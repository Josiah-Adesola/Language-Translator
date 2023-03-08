import os
import openai
import streamlit as st

openai.api_key = st.secrets["api_key"]

def main():
    st.title("Polygot - The Language Translator")
    st.write("NaijaLingo translates english language to 4 major languages, French, Spanish, Arabic and Chinese")
    st.image("translate.png")
    words = st.text_area("Type an english sentence:")
    if st.button("Translate"):
        with st.spinner("Translating.."):
            response = openai.Completion.create(
            model="text-davinci-003",
            prompt=f"Translate this into 1. French, 2. Spanish 3. Arabic and 4. Chinese  with the language in front:\n\nProduct: {words}",
            temperature=0.2,
            max_tokens=100,
            top_p=1,
            frequency_penalty=0,
            presence_penalty=0
            )
            
            description = response['choices'][0]['text']
            st.subheader("Generated description: ")
            st.success(description)
            
        
if __name__ == "__main__":
    main()
