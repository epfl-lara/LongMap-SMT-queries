; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26686 () Bool)

(assert start!26686)

(declare-fun b!276971 () Bool)

(declare-fun res!140961 () Bool)

(declare-fun e!176864 () Bool)

(assert (=> b!276971 (=> (not res!140961) (not e!176864))))

(declare-datatypes ((array!13783 0))(
  ( (array!13784 (arr!6541 (Array (_ BitVec 32) (_ BitVec 64))) (size!6893 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13783)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276971 (= res!140961 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!140964 () Bool)

(assert (=> start!26686 (=> (not res!140964) (not e!176864))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26686 (= res!140964 (validMask!0 mask!3868))))

(assert (=> start!26686 e!176864))

(declare-fun array_inv!4504 (array!13783) Bool)

(assert (=> start!26686 (array_inv!4504 a!3325)))

(assert (=> start!26686 true))

(declare-fun b!276972 () Bool)

(declare-fun res!140966 () Bool)

(assert (=> b!276972 (=> (not res!140966) (not e!176864))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276972 (= res!140966 (and (= (size!6893 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6893 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6893 a!3325))))))

(declare-fun b!276973 () Bool)

(declare-fun res!140963 () Bool)

(assert (=> b!276973 (=> (not res!140963) (not e!176864))))

(declare-datatypes ((List!4349 0))(
  ( (Nil!4346) (Cons!4345 (h!5012 (_ BitVec 64)) (t!9431 List!4349)) )
))
(declare-fun arrayNoDuplicates!0 (array!13783 (_ BitVec 32) List!4349) Bool)

(assert (=> b!276973 (= res!140963 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4346))))

(declare-fun b!276974 () Bool)

(declare-fun res!140962 () Bool)

(declare-fun e!176863 () Bool)

(assert (=> b!276974 (=> (not res!140962) (not e!176863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13783 (_ BitVec 32)) Bool)

(assert (=> b!276974 (= res!140962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276975 () Bool)

(declare-fun res!140965 () Bool)

(assert (=> b!276975 (=> (not res!140965) (not e!176864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276975 (= res!140965 (validKeyInArray!0 k!2581))))

(declare-fun b!276976 () Bool)

(assert (=> b!276976 (= e!176863 (and (= startIndex!26 i!1267) (bvslt startIndex!26 (bvsub (size!6893 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000) (bvsge (bvsub (size!6893 a!3325) (bvadd #b00000000000000000000000000000001 startIndex!26)) (bvsub (size!6893 a!3325) startIndex!26))))))

(declare-fun b!276977 () Bool)

(assert (=> b!276977 (= e!176864 e!176863)))

(declare-fun res!140967 () Bool)

(assert (=> b!276977 (=> (not res!140967) (not e!176863))))

(declare-datatypes ((SeekEntryResult!1699 0))(
  ( (MissingZero!1699 (index!8966 (_ BitVec 32))) (Found!1699 (index!8967 (_ BitVec 32))) (Intermediate!1699 (undefined!2511 Bool) (index!8968 (_ BitVec 32)) (x!27216 (_ BitVec 32))) (Undefined!1699) (MissingVacant!1699 (index!8969 (_ BitVec 32))) )
))
(declare-fun lt!137797 () SeekEntryResult!1699)

(assert (=> b!276977 (= res!140967 (or (= lt!137797 (MissingZero!1699 i!1267)) (= lt!137797 (MissingVacant!1699 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13783 (_ BitVec 32)) SeekEntryResult!1699)

(assert (=> b!276977 (= lt!137797 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26686 res!140964) b!276972))

(assert (= (and b!276972 res!140966) b!276975))

(assert (= (and b!276975 res!140965) b!276973))

(assert (= (and b!276973 res!140963) b!276971))

(assert (= (and b!276971 res!140961) b!276977))

(assert (= (and b!276977 res!140967) b!276974))

(assert (= (and b!276974 res!140962) b!276976))

(declare-fun m!292177 () Bool)

(assert (=> b!276975 m!292177))

(declare-fun m!292179 () Bool)

(assert (=> b!276971 m!292179))

(declare-fun m!292181 () Bool)

(assert (=> b!276977 m!292181))

(declare-fun m!292183 () Bool)

(assert (=> b!276974 m!292183))

(declare-fun m!292185 () Bool)

(assert (=> start!26686 m!292185))

(declare-fun m!292187 () Bool)

(assert (=> start!26686 m!292187))

(declare-fun m!292189 () Bool)

(assert (=> b!276973 m!292189))

(push 1)

(assert (not b!276974))

(assert (not start!26686))

(assert (not b!276973))

(assert (not b!276975))

(assert (not b!276971))

(assert (not b!276977))

(check-sat)

(pop 1)

(push 1)

(check-sat)

