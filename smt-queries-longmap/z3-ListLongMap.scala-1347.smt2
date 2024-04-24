; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26640 () Bool)

(assert start!26640)

(declare-fun b!276596 () Bool)

(declare-fun e!176679 () Bool)

(declare-fun e!176680 () Bool)

(assert (=> b!276596 (= e!176679 e!176680)))

(declare-fun res!140564 () Bool)

(assert (=> b!276596 (=> (not res!140564) (not e!176680))))

(declare-datatypes ((SeekEntryResult!1640 0))(
  ( (MissingZero!1640 (index!8730 (_ BitVec 32))) (Found!1640 (index!8731 (_ BitVec 32))) (Intermediate!1640 (undefined!2452 Bool) (index!8732 (_ BitVec 32)) (x!27101 (_ BitVec 32))) (Undefined!1640) (MissingVacant!1640 (index!8733 (_ BitVec 32))) )
))
(declare-fun lt!137727 () SeekEntryResult!1640)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276596 (= res!140564 (or (= lt!137727 (MissingZero!1640 i!1267)) (= lt!137727 (MissingVacant!1640 i!1267))))))

(declare-datatypes ((array!13736 0))(
  ( (array!13737 (arr!6517 (Array (_ BitVec 32) (_ BitVec 64))) (size!6869 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13736)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13736 (_ BitVec 32)) SeekEntryResult!1640)

(assert (=> b!276596 (= lt!137727 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276597 () Bool)

(assert (=> b!276597 (= e!176680 false)))

(declare-fun lt!137726 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13736 (_ BitVec 32)) Bool)

(assert (=> b!276597 (= lt!137726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!140560 () Bool)

(assert (=> start!26640 (=> (not res!140560) (not e!176679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26640 (= res!140560 (validMask!0 mask!3868))))

(assert (=> start!26640 e!176679))

(declare-fun array_inv!4467 (array!13736) Bool)

(assert (=> start!26640 (array_inv!4467 a!3325)))

(assert (=> start!26640 true))

(declare-fun b!276598 () Bool)

(declare-fun res!140562 () Bool)

(assert (=> b!276598 (=> (not res!140562) (not e!176679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276598 (= res!140562 (validKeyInArray!0 k0!2581))))

(declare-fun b!276599 () Bool)

(declare-fun res!140565 () Bool)

(assert (=> b!276599 (=> (not res!140565) (not e!176679))))

(declare-datatypes ((List!4238 0))(
  ( (Nil!4235) (Cons!4234 (h!4901 (_ BitVec 64)) (t!9312 List!4238)) )
))
(declare-fun arrayNoDuplicates!0 (array!13736 (_ BitVec 32) List!4238) Bool)

(assert (=> b!276599 (= res!140565 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4235))))

(declare-fun b!276600 () Bool)

(declare-fun res!140561 () Bool)

(assert (=> b!276600 (=> (not res!140561) (not e!176679))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276600 (= res!140561 (and (= (size!6869 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6869 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6869 a!3325))))))

(declare-fun b!276601 () Bool)

(declare-fun res!140563 () Bool)

(assert (=> b!276601 (=> (not res!140563) (not e!176679))))

(declare-fun arrayContainsKey!0 (array!13736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276601 (= res!140563 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26640 res!140560) b!276600))

(assert (= (and b!276600 res!140561) b!276598))

(assert (= (and b!276598 res!140562) b!276599))

(assert (= (and b!276599 res!140565) b!276601))

(assert (= (and b!276601 res!140563) b!276596))

(assert (= (and b!276596 res!140564) b!276597))

(declare-fun m!292061 () Bool)

(assert (=> b!276599 m!292061))

(declare-fun m!292063 () Bool)

(assert (=> b!276601 m!292063))

(declare-fun m!292065 () Bool)

(assert (=> b!276596 m!292065))

(declare-fun m!292067 () Bool)

(assert (=> start!26640 m!292067))

(declare-fun m!292069 () Bool)

(assert (=> start!26640 m!292069))

(declare-fun m!292071 () Bool)

(assert (=> b!276598 m!292071))

(declare-fun m!292073 () Bool)

(assert (=> b!276597 m!292073))

(check-sat (not b!276601) (not b!276599) (not start!26640) (not b!276596) (not b!276597) (not b!276598))
(check-sat)
