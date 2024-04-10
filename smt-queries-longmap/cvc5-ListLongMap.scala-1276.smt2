; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26214 () Bool)

(assert start!26214)

(declare-fun b!271100 () Bool)

(declare-fun res!135100 () Bool)

(declare-fun e!174477 () Bool)

(assert (=> b!271100 (=> (not res!135100) (not e!174477))))

(declare-datatypes ((array!13311 0))(
  ( (array!13312 (arr!6305 (Array (_ BitVec 32) (_ BitVec 64))) (size!6657 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13311)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13311 (_ BitVec 32)) Bool)

(assert (=> b!271100 (= res!135100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271101 () Bool)

(declare-fun res!135091 () Bool)

(declare-fun e!174479 () Bool)

(assert (=> b!271101 (=> (not res!135091) (not e!174479))))

(declare-datatypes ((List!4113 0))(
  ( (Nil!4110) (Cons!4109 (h!4776 (_ BitVec 64)) (t!9195 List!4113)) )
))
(declare-fun arrayNoDuplicates!0 (array!13311 (_ BitVec 32) List!4113) Bool)

(assert (=> b!271101 (= res!135091 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4110))))

(declare-fun b!271102 () Bool)

(declare-fun res!135096 () Bool)

(assert (=> b!271102 (=> (not res!135096) (not e!174477))))

(declare-fun noDuplicate!131 (List!4113) Bool)

(assert (=> b!271102 (= res!135096 (noDuplicate!131 Nil!4110))))

(declare-fun b!271103 () Bool)

(assert (=> b!271103 (= e!174479 e!174477)))

(declare-fun res!135099 () Bool)

(assert (=> b!271103 (=> (not res!135099) (not e!174477))))

(declare-datatypes ((SeekEntryResult!1463 0))(
  ( (MissingZero!1463 (index!8022 (_ BitVec 32))) (Found!1463 (index!8023 (_ BitVec 32))) (Intermediate!1463 (undefined!2275 Bool) (index!8024 (_ BitVec 32)) (x!26356 (_ BitVec 32))) (Undefined!1463) (MissingVacant!1463 (index!8025 (_ BitVec 32))) )
))
(declare-fun lt!135751 () SeekEntryResult!1463)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271103 (= res!135099 (or (= lt!135751 (MissingZero!1463 i!1267)) (= lt!135751 (MissingVacant!1463 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13311 (_ BitVec 32)) SeekEntryResult!1463)

(assert (=> b!271103 (= lt!135751 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!271104 () Bool)

(assert (=> b!271104 (= e!174477 false)))

(declare-fun lt!135750 () Bool)

(declare-fun contains!1943 (List!4113 (_ BitVec 64)) Bool)

(assert (=> b!271104 (= lt!135750 (contains!1943 Nil!4110 k!2581))))

(declare-fun b!271105 () Bool)

(declare-fun res!135101 () Bool)

(assert (=> b!271105 (=> (not res!135101) (not e!174477))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271105 (= res!135101 (validKeyInArray!0 (select (arr!6305 a!3325) startIndex!26)))))

(declare-fun b!271106 () Bool)

(declare-fun res!135094 () Bool)

(assert (=> b!271106 (=> (not res!135094) (not e!174477))))

(assert (=> b!271106 (= res!135094 (and (bvslt (size!6657 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6657 a!3325))))))

(declare-fun b!271107 () Bool)

(declare-fun res!135095 () Bool)

(assert (=> b!271107 (=> (not res!135095) (not e!174479))))

(assert (=> b!271107 (= res!135095 (and (= (size!6657 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6657 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6657 a!3325))))))

(declare-fun res!135102 () Bool)

(assert (=> start!26214 (=> (not res!135102) (not e!174479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26214 (= res!135102 (validMask!0 mask!3868))))

(assert (=> start!26214 e!174479))

(declare-fun array_inv!4268 (array!13311) Bool)

(assert (=> start!26214 (array_inv!4268 a!3325)))

(assert (=> start!26214 true))

(declare-fun b!271108 () Bool)

(declare-fun res!135097 () Bool)

(assert (=> b!271108 (=> (not res!135097) (not e!174479))))

(assert (=> b!271108 (= res!135097 (validKeyInArray!0 k!2581))))

(declare-fun b!271109 () Bool)

(declare-fun res!135098 () Bool)

(assert (=> b!271109 (=> (not res!135098) (not e!174477))))

(assert (=> b!271109 (= res!135098 (not (contains!1943 Nil!4110 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271110 () Bool)

(declare-fun res!135093 () Bool)

(assert (=> b!271110 (=> (not res!135093) (not e!174477))))

(assert (=> b!271110 (= res!135093 (not (contains!1943 Nil!4110 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271111 () Bool)

(declare-fun res!135090 () Bool)

(assert (=> b!271111 (=> (not res!135090) (not e!174477))))

(assert (=> b!271111 (= res!135090 (not (= startIndex!26 i!1267)))))

(declare-fun b!271112 () Bool)

(declare-fun res!135092 () Bool)

(assert (=> b!271112 (=> (not res!135092) (not e!174479))))

(declare-fun arrayContainsKey!0 (array!13311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271112 (= res!135092 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26214 res!135102) b!271107))

(assert (= (and b!271107 res!135095) b!271108))

(assert (= (and b!271108 res!135097) b!271101))

(assert (= (and b!271101 res!135091) b!271112))

(assert (= (and b!271112 res!135092) b!271103))

(assert (= (and b!271103 res!135099) b!271100))

(assert (= (and b!271100 res!135100) b!271111))

(assert (= (and b!271111 res!135090) b!271105))

(assert (= (and b!271105 res!135101) b!271106))

(assert (= (and b!271106 res!135094) b!271102))

(assert (= (and b!271102 res!135096) b!271109))

(assert (= (and b!271109 res!135098) b!271110))

(assert (= (and b!271110 res!135093) b!271104))

(declare-fun m!286497 () Bool)

(assert (=> b!271109 m!286497))

(declare-fun m!286499 () Bool)

(assert (=> b!271112 m!286499))

(declare-fun m!286501 () Bool)

(assert (=> b!271103 m!286501))

(declare-fun m!286503 () Bool)

(assert (=> b!271105 m!286503))

(assert (=> b!271105 m!286503))

(declare-fun m!286505 () Bool)

(assert (=> b!271105 m!286505))

(declare-fun m!286507 () Bool)

(assert (=> b!271101 m!286507))

(declare-fun m!286509 () Bool)

(assert (=> start!26214 m!286509))

(declare-fun m!286511 () Bool)

(assert (=> start!26214 m!286511))

(declare-fun m!286513 () Bool)

(assert (=> b!271110 m!286513))

(declare-fun m!286515 () Bool)

(assert (=> b!271104 m!286515))

(declare-fun m!286517 () Bool)

(assert (=> b!271102 m!286517))

(declare-fun m!286519 () Bool)

(assert (=> b!271108 m!286519))

(declare-fun m!286521 () Bool)

(assert (=> b!271100 m!286521))

(push 1)

