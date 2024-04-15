; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26606 () Bool)

(assert start!26606)

(declare-fun res!140114 () Bool)

(declare-fun e!176393 () Bool)

(assert (=> start!26606 (=> (not res!140114) (not e!176393))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26606 (= res!140114 (validMask!0 mask!3868))))

(assert (=> start!26606 e!176393))

(declare-datatypes ((array!13692 0))(
  ( (array!13693 (arr!6495 (Array (_ BitVec 32) (_ BitVec 64))) (size!6848 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13692)

(declare-fun array_inv!4467 (array!13692) Bool)

(assert (=> start!26606 (array_inv!4467 a!3325)))

(assert (=> start!26606 true))

(declare-fun b!276069 () Bool)

(declare-fun res!140111 () Bool)

(assert (=> b!276069 (=> (not res!140111) (not e!176393))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276069 (= res!140111 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276070 () Bool)

(declare-fun e!176394 () Bool)

(assert (=> b!276070 (= e!176394 false)))

(declare-fun lt!137388 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13692 (_ BitVec 32)) Bool)

(assert (=> b!276070 (= lt!137388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276071 () Bool)

(declare-fun res!140115 () Bool)

(assert (=> b!276071 (=> (not res!140115) (not e!176393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276071 (= res!140115 (validKeyInArray!0 k0!2581))))

(declare-fun b!276072 () Bool)

(declare-fun res!140116 () Bool)

(assert (=> b!276072 (=> (not res!140116) (not e!176393))))

(declare-datatypes ((List!4276 0))(
  ( (Nil!4273) (Cons!4272 (h!4939 (_ BitVec 64)) (t!9349 List!4276)) )
))
(declare-fun arrayNoDuplicates!0 (array!13692 (_ BitVec 32) List!4276) Bool)

(assert (=> b!276072 (= res!140116 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4273))))

(declare-fun b!276073 () Bool)

(declare-fun res!140113 () Bool)

(assert (=> b!276073 (=> (not res!140113) (not e!176393))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276073 (= res!140113 (and (= (size!6848 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6848 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6848 a!3325))))))

(declare-fun b!276074 () Bool)

(assert (=> b!276074 (= e!176393 e!176394)))

(declare-fun res!140112 () Bool)

(assert (=> b!276074 (=> (not res!140112) (not e!176394))))

(declare-datatypes ((SeekEntryResult!1652 0))(
  ( (MissingZero!1652 (index!8778 (_ BitVec 32))) (Found!1652 (index!8779 (_ BitVec 32))) (Intermediate!1652 (undefined!2464 Bool) (index!8780 (_ BitVec 32)) (x!27064 (_ BitVec 32))) (Undefined!1652) (MissingVacant!1652 (index!8781 (_ BitVec 32))) )
))
(declare-fun lt!137387 () SeekEntryResult!1652)

(assert (=> b!276074 (= res!140112 (or (= lt!137387 (MissingZero!1652 i!1267)) (= lt!137387 (MissingVacant!1652 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13692 (_ BitVec 32)) SeekEntryResult!1652)

(assert (=> b!276074 (= lt!137387 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26606 res!140114) b!276073))

(assert (= (and b!276073 res!140113) b!276071))

(assert (= (and b!276071 res!140115) b!276072))

(assert (= (and b!276072 res!140116) b!276069))

(assert (= (and b!276069 res!140111) b!276074))

(assert (= (and b!276074 res!140112) b!276070))

(declare-fun m!291011 () Bool)

(assert (=> start!26606 m!291011))

(declare-fun m!291013 () Bool)

(assert (=> start!26606 m!291013))

(declare-fun m!291015 () Bool)

(assert (=> b!276072 m!291015))

(declare-fun m!291017 () Bool)

(assert (=> b!276074 m!291017))

(declare-fun m!291019 () Bool)

(assert (=> b!276069 m!291019))

(declare-fun m!291021 () Bool)

(assert (=> b!276070 m!291021))

(declare-fun m!291023 () Bool)

(assert (=> b!276071 m!291023))

(check-sat (not start!26606) (not b!276069) (not b!276072) (not b!276070) (not b!276071) (not b!276074))
(check-sat)
