# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

data = [
  {
    tag_name: 'Polynomial',
    problems: [
      {
        is_proprietary: true,
        body: 'Simplify the equation.',
        equation: '(5p^3− 3) + (2p^2 − 3p^3)',
        answer: '`−3p^3 + 7p^2 − 3`'
      },
      {
        is_proprietary: true,
        body: 'Simplify the equation.',
        equation: '(a^2-2a^2)-(3a^2-4a^3)',
        answer: '`5a^3-5a^2`'
      },
      {
        is_proprietary: true,
        body: 'Simplify the equation.',
        equation: '(4+2n^3)+(5n^3+2)',
        answer: '`7n^3+6`'
      },
      {
        is_proprietary: true,
        body: 'Simplify the equation.',
        equation: '(4n-3n^3)-(3n^3+4n)',
        answer: '`-6n^3`'
      },
      {
        is_proprietary: true,
        body: 'Simplify the equation.',
        equation: '(3a^2 +1)−(4+2a^2)',
        answer: '`a^2-3`'
      },
      {
        is_proprietary: true,
        body: 'Simplify the equation.',
        equation: '(4r^3 +3r^4)−(r^4 −5r^3)',
        answer: '`2r^4 +9r^3`'
      },
      {
        is_proprietary: true,
        body: 'Simplify the equation.',
        equation: '(5a+4)−(5a+3)',
        answer: '1'
      },
      {
        is_proprietary: true,
        body: 'Simplify the equation.',
        equation: '(3x^4 −3x)−(3x−3x^4)',
        answer: '`6x^4-6x`'
      },
      {
        is_proprietary: true,
        body: 'Simplify the equation.',
        equation: '(−4k^4 +14+3k^2)+(−3k^4 −14k^2 −8)',
        answer: '`−7k^4 −11k^2 +6`'
      },
      {
        is_proprietary: true,
        body: 'Simplify the equation.',
        equation: '(3−6n^5 −8n^4)−(−6n^4 −3n−8n^5)',
        answer: '`2n^5 −2n^4 +3n+3`'
      },
      {
        is_proprietary: true,
        body: 'Simplify the equation.',
        equation: ' (12a^5 −6a−10a^3)−(10a−2a^5 −14a^4)',
        answer: '`14a^5 +14a^4 −10a^3 −16a`',
      },
      {
        is_proprietary: true,
        body: 'Simplify the equation.',
        equation: '(8n−3n^4 +10n^2)−(3n^2 +11n^4 −7)',
        answer: '`−14n^4 +7n^2 +8n+7`',
      },
      {
        is_proprietary: true,
        body: 'Simplify the equation.',
        equation: '(−x^4 +13x^5 +6x^3)+(6x^3 +5x^5 +7x^4)',
        answer: '`18x^5 +6x^4 +12x^3`',
      },
      {
        is_proprietary: true,
        body: 'Simplify the equation.',
        equation: '(9r^3 +5r^2 +11r)+(−2r^3 +9r−8r^2)',
        answer: '`7r^3 −3r^2 +20r`',
      },
      {
        is_proprietary: true,
        body: 'Simplify the equation.',
        equation: '(13n^2 +11n−2n^4)+(−13n^2 −3n−6n^4)',
        answer: '`−8n^4 +8n`',
      },
      {
        is_proprietary: true,
        body: 'Simplify the equation.',
        equation: '(−7x^5 +14−2x)+(10x^4 +7x+5x^5)',
        answer: '`−2x^5 +10x^4 +5x+14`',
      }
    ]
  },
  {
    tag_name: 'Factoring',
    problems: [
      {
        is_proprietary: true,
        body: 'Factor.',
        equation: '2y+6',
        answer: '2(y + 3)'
      },
      {
        is_proprietary: true,
        body: 'Factor.',
        equation: '3y^2+12y',
        answer: '3y(y+4)'
      },
      {
        is_proprietary: true,
        body: 'Factor.',
        equation: '4x^2 - 9',
        answer: '(2x+3)(2x-3)'
      },
      {
        is_proprietary: true,
        body: 'Factor.',
        equation: 'w^4 - 16',
        answer: '`(w^2 + 4)(w + 2)(w - 2)`'
      },
      {
        is_proprietary: true,
        body: 'Factor.',
        equation: '3u^4 - 24uv^3',
        answer: '`3u(u-2v)(u^2+2uv+4v^2)`'
      }
    ]
  },
  {
    tag_name: 'Function',
    problems: [
      {
        is_proprietary: true,
        body: 'Look at this set of ordered pairs:
        (15, 8)
        (15, 10)
        (16, 14)
        Is this relation a function?',
        answer: 'yes',
        equation: ''
      },
      {
        is_proprietary: true,
        body: 'Find f(-1) given the function:',
        answer: 'f(x) = -8x + 4',
        equation: 'f(-1) = 12'
      },
      {
        is_proprietary: true,
        body: 'Find f(8) given the function:',
        answer: 'f(x) = -5 + x^2',
        equation: 'f(8) = 59'
      },
      {
        is_proprietary: true,
        body: 'Find f(3) given the function:',
        answer: 'f(x) = 6x^2 - 8x + 9',
        equation: 'f(3) = 39'
      },
      {
        is_proprietary: true,
        body: 'Find  f(-5) given the function:',
        answer: 'f(x) = 10x - 1',
        equation: 'f(-5) = -51'
      }
    ]
  },
  {
    tag_name: 'Quadratic Function',
    problems: [
      {
        is_proprietary: true,
        body: 'Find the value of c that completes the square.',
        equation: 'x^2 −38x+c',
        answer: '361'
      },
      {
        is_proprietary: true,
        body: 'Find the value of c that completes the square.',
        equation: 'x^2 −32^x+c',
        answer: '256'
      },
      {
        is_proprietary: true,
        body: 'Find the value of c that completes the square.',
        equation: 'x^2−5/3x+c',
        answer: '25/36'
      },
      {
        is_proprietary: true,
        body: 'Find the value of c that completes the square.',
        equation: 'm^2 +24m+c',
        answer: '144'
      },
      {
        is_proprietary: true,
        body: 'Find the value of c that completes the square.',
        equation: 'p^2 −14p+c',
        answer: '49'
      },
      {
        is_proprietary: true,
        body: 'Find the value of c that completes the square.',
        equation: 'n^2− 2/5n+c',
        answer: '1/25'
      },
      {
        is_proprietary: true,
        body: 'Find the value of c that completes the square.',
        equation: 'a^2+ 22/13a+c',
        answer: '121/169'
      },
      {
        is_proprietary: true,
        body: 'Find the value of c that completes the square.',
        equation: 'x^2 +7x+c',
        answer: '49/4'
      },
      {
        is_proprietary: true,
        body: 'Find the value of c that completes the square.',
        equation: 'z^2 −17z+c',
        answer: '289/4'
      },
      {
        is_proprietary: true,
        body: 'Find the value of c that completes the square.',
        equation: 'x^2 −42x+c',
        answer: '441'
      }
    ]
  },
  {
    tag_name: 'Equation',
    problems: [
      {
        is_proprietary: true,
        body: 'Solve each equation. Remember to check for extraneous solutions.',
        equation: '(k+4)/4+(k-1)/4=(k+4)/(4k)',
        answer: '{-2, 1}'
      },
      {
        is_proprietary: true,
        body: 'Solve each equation. Remember to check for extraneous solutions.',
        equation: '1/(2m^2)=1/m-1/2',
        answer: '{1}'
      },
      {
        is_proprietary: true,
        body: 'Solve each equation. Remember to check for extraneous solutions.',
        equation: '(n^2-n-6)/n^2-(2n+12)/n = (n-6)/(2n)',
        answer: '{-2/3, 6}'
      },
      {
        is_proprietary: true,
        body: 'Solve each equation. Remember to check for extraneous solutions.',
        equation: '(3x^2+24x+48)/x^2 + (x-6)/(2x^2)= 1/x^2',
        answer: '{-8/3, -11/2}'
      },
      {
        is_proprietary: true,
        body: '',
        equation: '',
        answer: ''
      }
    ]
  }
]

data.each do |d|
  tag = Tag.create(name: d[:tag_name])
  d[:problems].each do |p|
    problem = Problem.create(p)
    tag.problems << problem
  end
end
