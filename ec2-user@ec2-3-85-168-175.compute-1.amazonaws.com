import os
import openai
import streamlit as st

openai.api_key = os.environ.get("OPENAI_API_KEY")

openai.api_key = "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"

def main():
    st.title("Nigerian Language Translator")
    st.write("This web app translates english language to 4 major nigerian languages, Yoruba, Ibo, Hausa, and Efik")
    st.image("naija.png")
    words = st.text_area("Type an english sentence:")
    if st.button("Translate"):
        with st.spinner("Translating.."):
            response = openai.Completion.create(
            model="text-davinci-003",
            prompt=f"Translate this into 1. Yoruba, 2. Ibo 3. Hausa and 4. Efik  with the language in front:\n\nProduct: {words}",
            temperature=0.5,
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