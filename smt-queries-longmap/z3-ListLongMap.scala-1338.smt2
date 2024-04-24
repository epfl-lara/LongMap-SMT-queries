; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26586 () Bool)

(assert start!26586)

(declare-fun b!276065 () Bool)

(declare-fun e!176438 () Bool)

(assert (=> b!276065 (= e!176438 false)))

(declare-fun lt!137592 () Bool)

(declare-datatypes ((array!13682 0))(
  ( (array!13683 (arr!6490 (Array (_ BitVec 32) (_ BitVec 64))) (size!6842 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13682)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13682 (_ BitVec 32)) Bool)

(assert (=> b!276065 (= lt!137592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276066 () Bool)

(declare-fun e!176437 () Bool)

(assert (=> b!276066 (= e!176437 e!176438)))

(declare-fun res!140029 () Bool)

(assert (=> b!276066 (=> (not res!140029) (not e!176438))))

(declare-datatypes ((SeekEntryResult!1613 0))(
  ( (MissingZero!1613 (index!8622 (_ BitVec 32))) (Found!1613 (index!8623 (_ BitVec 32))) (Intermediate!1613 (undefined!2425 Bool) (index!8624 (_ BitVec 32)) (x!27002 (_ BitVec 32))) (Undefined!1613) (MissingVacant!1613 (index!8625 (_ BitVec 32))) )
))
(declare-fun lt!137591 () SeekEntryResult!1613)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276066 (= res!140029 (or (= lt!137591 (MissingZero!1613 i!1267)) (= lt!137591 (MissingVacant!1613 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13682 (_ BitVec 32)) SeekEntryResult!1613)

(assert (=> b!276066 (= lt!137591 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276068 () Bool)

(declare-fun res!140032 () Bool)

(assert (=> b!276068 (=> (not res!140032) (not e!176437))))

(declare-datatypes ((List!4211 0))(
  ( (Nil!4208) (Cons!4207 (h!4874 (_ BitVec 64)) (t!9285 List!4211)) )
))
(declare-fun arrayNoDuplicates!0 (array!13682 (_ BitVec 32) List!4211) Bool)

(assert (=> b!276068 (= res!140032 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4208))))

(declare-fun b!276069 () Bool)

(declare-fun res!140031 () Bool)

(assert (=> b!276069 (=> (not res!140031) (not e!176437))))

(declare-fun arrayContainsKey!0 (array!13682 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276069 (= res!140031 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276070 () Bool)

(declare-fun res!140033 () Bool)

(assert (=> b!276070 (=> (not res!140033) (not e!176437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276070 (= res!140033 (validKeyInArray!0 k0!2581))))

(declare-fun res!140034 () Bool)

(assert (=> start!26586 (=> (not res!140034) (not e!176437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26586 (= res!140034 (validMask!0 mask!3868))))

(assert (=> start!26586 e!176437))

(declare-fun array_inv!4440 (array!13682) Bool)

(assert (=> start!26586 (array_inv!4440 a!3325)))

(assert (=> start!26586 true))

(declare-fun b!276067 () Bool)

(declare-fun res!140030 () Bool)

(assert (=> b!276067 (=> (not res!140030) (not e!176437))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276067 (= res!140030 (and (= (size!6842 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6842 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6842 a!3325))))))

(assert (= (and start!26586 res!140034) b!276067))

(assert (= (and b!276067 res!140030) b!276070))

(assert (= (and b!276070 res!140033) b!276068))

(assert (= (and b!276068 res!140032) b!276069))

(assert (= (and b!276069 res!140031) b!276066))

(assert (= (and b!276066 res!140029) b!276065))

(declare-fun m!291671 () Bool)

(assert (=> b!276066 m!291671))

(declare-fun m!291673 () Bool)

(assert (=> start!26586 m!291673))

(declare-fun m!291675 () Bool)

(assert (=> start!26586 m!291675))

(declare-fun m!291677 () Bool)

(assert (=> b!276065 m!291677))

(declare-fun m!291679 () Bool)

(assert (=> b!276070 m!291679))

(declare-fun m!291681 () Bool)

(assert (=> b!276069 m!291681))

(declare-fun m!291683 () Bool)

(assert (=> b!276068 m!291683))

(check-sat (not b!276069) (not b!276066) (not start!26586) (not b!276065) (not b!276070) (not b!276068))
(check-sat)
