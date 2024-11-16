/* 
this is what i am thinking for my databased 
folders numbering is the numbers of the FolderDecks widget
folderName is given(for example java and javascript)
now once they click the FolderDecks widget they will go
to the QuestionScreen widget that has 
secondary folders/sub decks(this will be FolderDecks widget too, inside there will also be questions)
and questions (this will be question card)
let not do too much for now lets do the others for next let try it out 
*/

Map<String, dynamic> database = {
  'folders': {
    1: {
      'folderName': 'Java',
      'insideFolder': {
        'folders': {
          1: {
            'folderName': 'arrays',
            'questions': {
              1: {
                'question': 'what is array',
                'answer': 'collection of data',
              },
              2: {
                'question': 'what is index',
                'answer': 'address of array',
              },
            },
          },
          'questions': {
            1: {
              'question': 'what is java',
              'answer': 'a programming language',
            },
            2: {
              'question': 'java strengths',
              'answer': 'robust, fast, and multi platform',
            },
          },
        },
      }
    },
    2: {
      'folderName': 'Javascript',
      'insideFolder': {
        'folders': {
          1: {
            'folderName': 'HTML',
            'questions': {
              1: {
                'question': 'what is HTMK',
                'answer': 'a hypertext markup language',
              },
            },
          },
          2: {
            'folderName': 'CSS',
            'questions': {
              1: {
                'question': 'what is css',
                'answer': 'a cascading style sheet',
              },
            },
          },
        },
        'questions': {
          1: {
            'question': 'what is javascript',
            'answer': 'a programming language for web',
          },
          2: {
            'question': 'javascript weakness',
            'answer': 'messy',
          },
        },
      },
    },
    3: {
      'folderName': 'Augy chan',
      'insideFolder': {
        'folders': {},
        'questions': {
          1: {
            'question': 'what is august',
            'answer': 'he is love',
          },
          2: {
            'question': 'what is love',
            'answer': 'august period.',
          },
        },
      },
    },
  },
};
