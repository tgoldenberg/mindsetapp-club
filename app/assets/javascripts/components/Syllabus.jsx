
class Syllabus extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      topics: props.topics
    }
  }
  _renderEmptyTable(){
    return (
      <table className="table table-striped" style={{ marginLeft: 10 }}>
        <thead>
          <tr>
            <th style={{ width: 100 }}>Approved</th>
            <th>Problem</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th></th>
            <th></th>
          </tr>
        </tbody>
      </table>
    )
  }
  _renderTable(topic){
    return (
      <table className="table table-striped" style={{ marginLeft: 10 }}>
        <thead>
          <tr>
            <th style={{ width: 100 }}>Approved</th>
            <th>Problem</th>
          </tr>
        </thead>
        <tbody>
          {topic.tags.map((tag) => {
            return (
              tag.problems.slice(0, 2).map((problem) => {
                return (
                  <tr>
                    <th>Not approved</th>
                    <th>{problem.equation ? "`" + problem.equation + "`" : problem.body}</th>
                  </tr>
                )
              })
            )
          })}
        </tbody>
      </table>
    )
  }
  render(){
    let { syllabus, classInfo } = this.props;
    let { topics } = this.state;
    console.log('TOPICS', topics);
    return (
      <div>
        <div className="account-header" style={{ textAlign: 'center' }}>
          <h1>{syllabus.course_name}</h1>
        </div>
        <div className="col-md-12">
          <br/>
          <table className="table">
            <thead>
              <tr>
                <th>Teacher</th>
                <th>Year</th>
                <th>Class Info</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th>{classInfo.staff[0].first_name} {classInfo.staff[0].last_name}</th>
                <th>{classInfo.school_year}</th>
                <th>Room: {classInfo.term[0].rooms[0].room_number}, Period: {classInfo.term[0].meeting_time[0].time_table_period}</th>
              </tr>
            </tbody>
          </table>
        </div>
        <div>
          {topics.map((topic, idx) => {
            return (
              <div className="">
                <div className="col-md-8">
                  <h4>
                    {idx + 1}. {topic.topic.name}
                    <span>{topic.tags.map((tag) => {
                        return (
                          <span className="label label-inverted-primary" style={styles.tag}>{tag.tag.name}</span>
                        )
                      })}</span>
                  </h4>
                  {topic.tags.length && topic.tags.map((tag) => tag.problems.length).reduce((p,n) => p+n) > 0 ? this._renderTable(topic) : this._renderEmptyTable()}
                </div>
                <div className="col-md-4">
                  <button
                    onClick={()=> {
                      $('#myModal').modal('show');
                    }}
                    className="btn btn-primary btn-lg" style={{ marginTop: 60 }}
                    >Upload Problem</button>
                </div>
              </div>
            )
          })}
        </div>
        <div className="modal fade" id="myModal" tabIndex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div className="modal-dialog">
            <div className="modal-content">
              <div className="modal-header">
                <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 className="modal-title" id="exampleModalLabel">Choose your RSS Feeds</h4>
              </div>
              <div className="modal-body">
                <div className="card-block p-y-0">
                  <ul className="nav nav-tabs sr-only" role="tablist">
                    <li className="nav-item">
                      <a className="nav-link" href="#default" role="tab" data-toggle="tab">Sources</a>
                    </li>
                  </ul>
                  <div className="tab-content">
                    <div role="tabpanel" className="tab-pane fade in active" id="default">
                      <ul className="p-l-0 m-b-0">
                        <ul className="list-group list-group-flush">
                          
                        </ul>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div className="modal-footer">
                <button type="button" className="btn btn-default" data-dismiss="modal">Close</button>
                <button
                  type="button"
                  className="btn btn-primary">
                  Save changes
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
};

let styles = {
  tag: {
    border: '1px solid #1465cc',
    borderRadius: 6,
    color: '#1465cc',
    marginLeft: 4,
  }
}
