; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26594 () Bool)

(assert start!26594)

(declare-fun b!276105 () Bool)

(declare-fun res!140101 () Bool)

(declare-fun e!176448 () Bool)

(assert (=> b!276105 (=> (not res!140101) (not e!176448))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276105 (= res!140101 (not (= startIndex!26 i!1267)))))

(declare-fun res!140098 () Bool)

(declare-fun e!176450 () Bool)

(assert (=> start!26594 (=> (not res!140098) (not e!176450))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26594 (= res!140098 (validMask!0 mask!3868))))

(assert (=> start!26594 e!176450))

(declare-datatypes ((array!13691 0))(
  ( (array!13692 (arr!6495 (Array (_ BitVec 32) (_ BitVec 64))) (size!6847 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13691)

(declare-fun array_inv!4458 (array!13691) Bool)

(assert (=> start!26594 (array_inv!4458 a!3325)))

(assert (=> start!26594 true))

(declare-fun b!276106 () Bool)

(declare-fun res!140095 () Bool)

(assert (=> b!276106 (=> (not res!140095) (not e!176450))))

(assert (=> b!276106 (= res!140095 (and (= (size!6847 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6847 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6847 a!3325))))))

(declare-fun b!276107 () Bool)

(declare-fun res!140096 () Bool)

(assert (=> b!276107 (=> (not res!140096) (not e!176450))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276107 (= res!140096 (validKeyInArray!0 k0!2581))))

(declare-fun b!276108 () Bool)

(assert (=> b!276108 (= e!176450 e!176448)))

(declare-fun res!140097 () Bool)

(assert (=> b!276108 (=> (not res!140097) (not e!176448))))

(declare-datatypes ((SeekEntryResult!1653 0))(
  ( (MissingZero!1653 (index!8782 (_ BitVec 32))) (Found!1653 (index!8783 (_ BitVec 32))) (Intermediate!1653 (undefined!2465 Bool) (index!8784 (_ BitVec 32)) (x!27050 (_ BitVec 32))) (Undefined!1653) (MissingVacant!1653 (index!8785 (_ BitVec 32))) )
))
(declare-fun lt!137551 () SeekEntryResult!1653)

(assert (=> b!276108 (= res!140097 (or (= lt!137551 (MissingZero!1653 i!1267)) (= lt!137551 (MissingVacant!1653 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13691 (_ BitVec 32)) SeekEntryResult!1653)

(assert (=> b!276108 (= lt!137551 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276109 () Bool)

(declare-fun res!140102 () Bool)

(assert (=> b!276109 (=> (not res!140102) (not e!176450))))

(declare-fun arrayContainsKey!0 (array!13691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276109 (= res!140102 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276110 () Bool)

(declare-fun res!140103 () Bool)

(assert (=> b!276110 (=> (not res!140103) (not e!176448))))

(assert (=> b!276110 (= res!140103 (not (validKeyInArray!0 (select (arr!6495 a!3325) startIndex!26))))))

(declare-fun b!276111 () Bool)

(assert (=> b!276111 (= e!176448 (and (bvsge startIndex!26 (bvsub (size!6847 a!3325) #b00000000000000000000000000000001)) (bvsgt startIndex!26 (size!6847 a!3325))))))

(declare-fun b!276112 () Bool)

(declare-fun res!140099 () Bool)

(assert (=> b!276112 (=> (not res!140099) (not e!176448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13691 (_ BitVec 32)) Bool)

(assert (=> b!276112 (= res!140099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276113 () Bool)

(declare-fun res!140100 () Bool)

(assert (=> b!276113 (=> (not res!140100) (not e!176450))))

(declare-datatypes ((List!4303 0))(
  ( (Nil!4300) (Cons!4299 (h!4966 (_ BitVec 64)) (t!9385 List!4303)) )
))
(declare-fun arrayNoDuplicates!0 (array!13691 (_ BitVec 32) List!4303) Bool)

(assert (=> b!276113 (= res!140100 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4300))))

(assert (= (and start!26594 res!140098) b!276106))

(assert (= (and b!276106 res!140095) b!276107))

(assert (= (and b!276107 res!140096) b!276113))

(assert (= (and b!276113 res!140100) b!276109))

(assert (= (and b!276109 res!140102) b!276108))

(assert (= (and b!276108 res!140097) b!276112))

(assert (= (and b!276112 res!140099) b!276105))

(assert (= (and b!276105 res!140101) b!276110))

(assert (= (and b!276110 res!140103) b!276111))

(declare-fun m!291525 () Bool)

(assert (=> b!276107 m!291525))

(declare-fun m!291527 () Bool)

(assert (=> start!26594 m!291527))

(declare-fun m!291529 () Bool)

(assert (=> start!26594 m!291529))

(declare-fun m!291531 () Bool)

(assert (=> b!276112 m!291531))

(declare-fun m!291533 () Bool)

(assert (=> b!276113 m!291533))

(declare-fun m!291535 () Bool)

(assert (=> b!276109 m!291535))

(declare-fun m!291537 () Bool)

(assert (=> b!276108 m!291537))

(declare-fun m!291539 () Bool)

(assert (=> b!276110 m!291539))

(assert (=> b!276110 m!291539))

(declare-fun m!291541 () Bool)

(assert (=> b!276110 m!291541))

(check-sat (not b!276108) (not b!276110) (not start!26594) (not b!276107) (not b!276113) (not b!276112) (not b!276109))
(check-sat)
