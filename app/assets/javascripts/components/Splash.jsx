
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
          <h4 style={{ width: '100%', textAlign: 'center' }}>
            You tell us what you are teaching or learning. We find you more practice problems.
          </h4>
          <div style={styles.row}>
            <div style={styles.iconContainer}>
              <i className="material-icons md-48">content_paste</i>
              <p>Teachers add problem sets</p>
            </div>
            <div style={styles.iconContainer}>
              <i className="material-icons md-48">vpn_key</i>
              <p>Our algorithm interprets and categorizes problems</p>
            </div>
            <div style={styles.iconContainer}>
              <i className="material-icons md-48">thumb_up</i>
              <p>Teachers select from suggested problem sets</p>
            </div>
            <div style={styles.iconContainer}>
              <img src='assets/ic_sentiment' style={{ width: 48 }} />
              <p>Teacher work is amplified</p>
            </div>
            <div style={styles.iconContainer}>
              <i className="material-icons md-48">school</i>
              <p>Students can practice and sync their phone calendars</p>
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
  iconContainer: {
    flex: 1,
    alignItems: 'center',
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
