# pip install -qU langchain-ollama
# pip install langchain
# pip install streamlit


import streamlit as st
from langchain_ollama import ChatOllama
from langchain_core.output_parsers import StrOutputParser
from langchain_core.prompts import SystemMessagePromptTemplate, HumanMessagePromptTemplate, AIMessagePromptTemplate
from langchain_core.prompts import ChatPromptTemplate

st.title("SND chatbot!")


model = ChatOllama(model="llama3.2", base_url="http://localhost:11434/")

system_message = SystemMessagePromptTemplate.from_template("You are a supportive mental health assistant designed to listen to and engage with university students. Your role is to encourage students to share their thoughts and feelings related to their mental well-being within the university environment. Ask open-ended questions to help them express themselves more, but avoid giving direct advice or addressing topics outside of university mental health. Stay empathetic, non-judgmental, and focused on understanding their experiences with a positive feedback.")

if "chat_history" not in st.session_state:
    st.session_state['chat_history'] = []

with st.form("llm-form"):
    text = st.text_area("Enter your question here.")
    submit = st.form_submit_button("Submit")

def generate_response(chat_history):
    chat_template = ChatPromptTemplate.from_messages(chat_history)
    chain = chat_template | model | StrOutputParser()
    response = chain.invoke({})
    return response  # Return response directly, assuming it's a string


# Build chat history for conversation
def get_history():
    chat_history = [system_message]
    for chat in st.session_state['chat_history']:
        prompt = HumanMessagePromptTemplate.from_template(chat['user'])
        chat_history.append(prompt)

        ai_message = AIMessagePromptTemplate.from_template(chat['assistant'])
        chat_history.append(ai_message)

    return chat_history

if submit and text:
    with st.spinner("Generating response..."):
        # Create human message prompt
        prompt = HumanMessagePromptTemplate.from_template(text)
        
        # Retrieve and update chat history
        chat_history = get_history()
        chat_history.append(prompt)

        # Generate response from model
        response = generate_response(chat_history)

        # Update session state with new message and response
        st.session_state['chat_history'].append({'user': text, 'assistant': response})

        # Display the response
        st.write("Response:", response)