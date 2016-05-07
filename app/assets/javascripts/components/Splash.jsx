
class Splash extends React.Component{
  render(){
    return (
      <div>
        <div className='splash-dark splash'>
          <div className="container" style={styles.container}>
            <h1 className='white-text splash'>
              Problem Sets on Demand
            </h1>
            <h4 className='white-text splash'>
              {`We add to your problems... and are proud of it ;)`}
            </h4>
          </div>
        </div>
        <div className="container" style={styles.container}>
          <h4>
            You tell us what you are teaching or learning. We find you more practice problems.
          </h4>
          <div style={styles.row}>
            <div>
              <img src='' />
              <p>Teachers add problem sets</p>
            </div>
            <div>
              <img src='' />
              <p>Our algorithm interprets and categorizes problems</p>
            </div>
            <div>
              <img src='' />
              <p>Teachers select from suggested problem sets</p>
            </div>
            <div>
              <img src='' />
              <p>Teacher work is amplified</p>
            </div>
            <div>
              <img src='' />
              <p>Students can practice new problems and sync their phone calendars for assignments</p>
            </div>
          </div>
        </div>
      </div>
    );
  }
};

let styles = {
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    height: '100%',
    width: '100%',
    display: 'flex',
    flexDirection: 'column',
  },
  row: {
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center'
  }
}
