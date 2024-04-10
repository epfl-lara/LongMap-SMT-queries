; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26238 () Bool)

(assert start!26238)

(declare-fun b!271568 () Bool)

(declare-fun e!174585 () Bool)

(declare-fun e!174587 () Bool)

(assert (=> b!271568 (= e!174585 e!174587)))

(declare-fun res!135559 () Bool)

(assert (=> b!271568 (=> (not res!135559) (not e!174587))))

(declare-datatypes ((SeekEntryResult!1475 0))(
  ( (MissingZero!1475 (index!8070 (_ BitVec 32))) (Found!1475 (index!8071 (_ BitVec 32))) (Intermediate!1475 (undefined!2287 Bool) (index!8072 (_ BitVec 32)) (x!26400 (_ BitVec 32))) (Undefined!1475) (MissingVacant!1475 (index!8073 (_ BitVec 32))) )
))
(declare-fun lt!135823 () SeekEntryResult!1475)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271568 (= res!135559 (or (= lt!135823 (MissingZero!1475 i!1267)) (= lt!135823 (MissingVacant!1475 i!1267))))))

(declare-datatypes ((array!13335 0))(
  ( (array!13336 (arr!6317 (Array (_ BitVec 32) (_ BitVec 64))) (size!6669 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13335)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13335 (_ BitVec 32)) SeekEntryResult!1475)

(assert (=> b!271568 (= lt!135823 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!271569 () Bool)

(declare-fun res!135560 () Bool)

(assert (=> b!271569 (=> (not res!135560) (not e!174587))))

(declare-datatypes ((List!4125 0))(
  ( (Nil!4122) (Cons!4121 (h!4788 (_ BitVec 64)) (t!9207 List!4125)) )
))
(declare-fun contains!1955 (List!4125 (_ BitVec 64)) Bool)

(assert (=> b!271569 (= res!135560 (not (contains!1955 Nil!4122 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271570 () Bool)

(declare-fun res!135566 () Bool)

(assert (=> b!271570 (=> (not res!135566) (not e!174587))))

(assert (=> b!271570 (= res!135566 (not (contains!1955 Nil!4122 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271571 () Bool)

(declare-fun res!135558 () Bool)

(assert (=> b!271571 (=> (not res!135558) (not e!174585))))

(declare-fun arrayContainsKey!0 (array!13335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271571 (= res!135558 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!135569 () Bool)

(assert (=> start!26238 (=> (not res!135569) (not e!174585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26238 (= res!135569 (validMask!0 mask!3868))))

(assert (=> start!26238 e!174585))

(declare-fun array_inv!4280 (array!13335) Bool)

(assert (=> start!26238 (array_inv!4280 a!3325)))

(assert (=> start!26238 true))

(declare-fun b!271572 () Bool)

(declare-fun res!135562 () Bool)

(assert (=> b!271572 (=> (not res!135562) (not e!174587))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271572 (= res!135562 (validKeyInArray!0 (select (arr!6317 a!3325) startIndex!26)))))

(declare-fun b!271573 () Bool)

(declare-fun res!135568 () Bool)

(assert (=> b!271573 (=> (not res!135568) (not e!174585))))

(assert (=> b!271573 (= res!135568 (validKeyInArray!0 k!2581))))

(declare-fun b!271574 () Bool)

(declare-fun res!135564 () Bool)

(assert (=> b!271574 (=> (not res!135564) (not e!174585))))

(declare-fun arrayNoDuplicates!0 (array!13335 (_ BitVec 32) List!4125) Bool)

(assert (=> b!271574 (= res!135564 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4122))))

(declare-fun b!271575 () Bool)

(declare-fun res!135570 () Bool)

(assert (=> b!271575 (=> (not res!135570) (not e!174587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13335 (_ BitVec 32)) Bool)

(assert (=> b!271575 (= res!135570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271576 () Bool)

(declare-fun res!135561 () Bool)

(assert (=> b!271576 (=> (not res!135561) (not e!174587))))

(assert (=> b!271576 (= res!135561 (and (bvslt (size!6669 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6669 a!3325))))))

(declare-fun b!271577 () Bool)

(declare-fun res!135563 () Bool)

(assert (=> b!271577 (=> (not res!135563) (not e!174587))))

(assert (=> b!271577 (= res!135563 (not (= startIndex!26 i!1267)))))

(declare-fun b!271578 () Bool)

(assert (=> b!271578 (= e!174587 false)))

(declare-fun lt!135822 () Bool)

(assert (=> b!271578 (= lt!135822 (contains!1955 Nil!4122 k!2581))))

(declare-fun b!271579 () Bool)

(declare-fun res!135565 () Bool)

(assert (=> b!271579 (=> (not res!135565) (not e!174585))))

(assert (=> b!271579 (= res!135565 (and (= (size!6669 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6669 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6669 a!3325))))))

(declare-fun b!271580 () Bool)

(declare-fun res!135567 () Bool)

(assert (=> b!271580 (=> (not res!135567) (not e!174587))))

(declare-fun noDuplicate!143 (List!4125) Bool)

(assert (=> b!271580 (= res!135567 (noDuplicate!143 Nil!4122))))

(assert (= (and start!26238 res!135569) b!271579))

(assert (= (and b!271579 res!135565) b!271573))

(assert (= (and b!271573 res!135568) b!271574))

(assert (= (and b!271574 res!135564) b!271571))

(assert (= (and b!271571 res!135558) b!271568))

(assert (= (and b!271568 res!135559) b!271575))

(assert (= (and b!271575 res!135570) b!271577))

(assert (= (and b!271577 res!135563) b!271572))

(assert (= (and b!271572 res!135562) b!271576))

(assert (= (and b!271576 res!135561) b!271580))

(assert (= (and b!271580 res!135567) b!271570))

(assert (= (and b!271570 res!135566) b!271569))

(assert (= (and b!271569 res!135560) b!271578))

(declare-fun m!286809 () Bool)

(assert (=> b!271574 m!286809))

(declare-fun m!286811 () Bool)

(assert (=> b!271570 m!286811))

(declare-fun m!286813 () Bool)

(assert (=> b!271571 m!286813))

(declare-fun m!286815 () Bool)

(assert (=> b!271578 m!286815))

(declare-fun m!286817 () Bool)

(assert (=> b!271573 m!286817))

(declare-fun m!286819 () Bool)

(assert (=> start!26238 m!286819))

(declare-fun m!286821 () Bool)

(assert (=> start!26238 m!286821))

(declare-fun m!286823 () Bool)

(assert (=> b!271580 m!286823))

(declare-fun m!286825 () Bool)

(assert (=> b!271568 m!286825))

(declare-fun m!286827 () Bool)

(assert (=> b!271575 m!286827))

(declare-fun m!286829 () Bool)

(assert (=> b!271569 m!286829))

(declare-fun m!286831 () Bool)

(assert (=> b!271572 m!286831))

(assert (=> b!271572 m!286831))

(declare-fun m!286833 () Bool)

(assert (=> b!271572 m!286833))

(push 1)

