/* this is what i am thinking for my databased 
for the 'LoginScreen' if the username and password is in databased
he will be logged in to the app with his folders and questions and
the app should remember if the user is already logged in, so that 
'LoginScreen' can change to '_playButton' instead of '_loginForm'
*/

Map<String, dynamic> database = {
  'folders': {
    1: {
      'folderName': 'Java',
      'insideFolder': {
        'folders': {
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
