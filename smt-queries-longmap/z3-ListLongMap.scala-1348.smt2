; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26648 () Bool)

(assert start!26648)

(declare-fun b!276621 () Bool)

(declare-fun res!140614 () Bool)

(declare-fun e!176692 () Bool)

(assert (=> b!276621 (=> (not res!140614) (not e!176692))))

(declare-datatypes ((array!13745 0))(
  ( (array!13746 (arr!6522 (Array (_ BitVec 32) (_ BitVec 64))) (size!6874 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13745)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!276621 (= res!140614 (and (= (size!6874 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6874 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6874 a!3325))))))

(declare-fun b!276622 () Bool)

(declare-fun res!140616 () Bool)

(assert (=> b!276622 (=> (not res!140616) (not e!176692))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276622 (= res!140616 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276623 () Bool)

(declare-fun e!176693 () Bool)

(assert (=> b!276623 (= e!176692 e!176693)))

(declare-fun res!140613 () Bool)

(assert (=> b!276623 (=> (not res!140613) (not e!176693))))

(declare-datatypes ((SeekEntryResult!1680 0))(
  ( (MissingZero!1680 (index!8890 (_ BitVec 32))) (Found!1680 (index!8891 (_ BitVec 32))) (Intermediate!1680 (undefined!2492 Bool) (index!8892 (_ BitVec 32)) (x!27149 (_ BitVec 32))) (Undefined!1680) (MissingVacant!1680 (index!8893 (_ BitVec 32))) )
))
(declare-fun lt!137692 () SeekEntryResult!1680)

(assert (=> b!276623 (= res!140613 (or (= lt!137692 (MissingZero!1680 i!1267)) (= lt!137692 (MissingVacant!1680 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13745 (_ BitVec 32)) SeekEntryResult!1680)

(assert (=> b!276623 (= lt!137692 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276624 () Bool)

(assert (=> b!276624 (= e!176693 false)))

(declare-fun lt!137691 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13745 (_ BitVec 32)) Bool)

(assert (=> b!276624 (= lt!137691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!140615 () Bool)

(assert (=> start!26648 (=> (not res!140615) (not e!176692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26648 (= res!140615 (validMask!0 mask!3868))))

(assert (=> start!26648 e!176692))

(declare-fun array_inv!4485 (array!13745) Bool)

(assert (=> start!26648 (array_inv!4485 a!3325)))

(assert (=> start!26648 true))

(declare-fun b!276625 () Bool)

(declare-fun res!140612 () Bool)

(assert (=> b!276625 (=> (not res!140612) (not e!176692))))

(declare-datatypes ((List!4330 0))(
  ( (Nil!4327) (Cons!4326 (h!4993 (_ BitVec 64)) (t!9412 List!4330)) )
))
(declare-fun arrayNoDuplicates!0 (array!13745 (_ BitVec 32) List!4330) Bool)

(assert (=> b!276625 (= res!140612 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4327))))

(declare-fun b!276626 () Bool)

(declare-fun res!140611 () Bool)

(assert (=> b!276626 (=> (not res!140611) (not e!176692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276626 (= res!140611 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26648 res!140615) b!276621))

(assert (= (and b!276621 res!140614) b!276626))

(assert (= (and b!276626 res!140611) b!276625))

(assert (= (and b!276625 res!140612) b!276622))

(assert (= (and b!276622 res!140616) b!276623))

(assert (= (and b!276623 res!140613) b!276624))

(declare-fun m!291911 () Bool)

(assert (=> start!26648 m!291911))

(declare-fun m!291913 () Bool)

(assert (=> start!26648 m!291913))

(declare-fun m!291915 () Bool)

(assert (=> b!276624 m!291915))

(declare-fun m!291917 () Bool)

(assert (=> b!276625 m!291917))

(declare-fun m!291919 () Bool)

(assert (=> b!276623 m!291919))

(declare-fun m!291921 () Bool)

(assert (=> b!276622 m!291921))

(declare-fun m!291923 () Bool)

(assert (=> b!276626 m!291923))

(check-sat (not b!276626) (not start!26648) (not b!276624) (not b!276623) (not b!276625) (not b!276622))
(check-sat)
