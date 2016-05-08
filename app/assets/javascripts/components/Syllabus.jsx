
class Syllabus extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      topics: props.topics.map((topic) => {
        return {
          topic: topic.topic,
          tags: topic.tags.map((tag) => {
            return {
              tag: tag.tag,
              problems: tag.problems.map((problem) => {
                return Object.assign({}, problem, {approved: false})
              })
            }
          })
        }
      })
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
  _renderApproved(problem, i, j, k){
    return (
      <i className="material-icons md-48 animated bounceIn" style={{ color: 'green' }}>check_box</i>
    )
  }
  _renderUnapproved(problem, i, j, k){
    return (
      <i
        onClick={() => {
          let { topics } = this.state;
          topics[i].tags[j].problems[k].approved = true;
          this.setState({topics: topics})
        }}
        className="material-icons md-48">check_box_outline_blank</i>
    )
  }
  _renderTable(topic, i){
    return (
      <table className="table table-striped" style={{ marginLeft: 10 }}>
        <thead>
          <tr>
            <th style={{ width: 100 }}>Approved</th>
            <th>Problem</th>
          </tr>
        </thead>
        <tbody>
          {topic.tags.map((tag, j) => {
            return (
              tag.problems.slice(0, 2).map((problem, k) => {
                return (
                  <tr>
                    <th>
                      {problem.approved ? this._renderApproved(problem, i, j, k) : this._renderUnapproved(problem, i, j, k)}
                    </th>
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
                  {topic.tags.length && topic.tags.map((tag) => tag.problems.length).reduce((p,n) => p+n) > 0 ? this._renderTable(topic, idx) : this._renderEmptyTable()}
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
