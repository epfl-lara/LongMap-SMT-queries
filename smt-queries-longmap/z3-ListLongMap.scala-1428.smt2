; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27642 () Bool)

(assert start!27642)

(declare-fun b!285392 () Bool)

(declare-fun res!147776 () Bool)

(declare-fun e!180909 () Bool)

(assert (=> b!285392 (=> (not res!147776) (not e!180909))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285392 (= res!147776 (validKeyInArray!0 k0!2581))))

(declare-fun res!147775 () Bool)

(assert (=> start!27642 (=> (not res!147775) (not e!180909))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27642 (= res!147775 (validMask!0 mask!3868))))

(assert (=> start!27642 e!180909))

(declare-datatypes ((array!14246 0))(
  ( (array!14247 (arr!6760 (Array (_ BitVec 32) (_ BitVec 64))) (size!7112 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14246)

(declare-fun array_inv!4710 (array!14246) Bool)

(assert (=> start!27642 (array_inv!4710 a!3325)))

(assert (=> start!27642 true))

(declare-fun b!285393 () Bool)

(declare-fun e!180911 () Bool)

(assert (=> b!285393 (= e!180909 e!180911)))

(declare-fun res!147772 () Bool)

(assert (=> b!285393 (=> (not res!147772) (not e!180911))))

(declare-datatypes ((SeekEntryResult!1883 0))(
  ( (MissingZero!1883 (index!9702 (_ BitVec 32))) (Found!1883 (index!9703 (_ BitVec 32))) (Intermediate!1883 (undefined!2695 Bool) (index!9704 (_ BitVec 32)) (x!28010 (_ BitVec 32))) (Undefined!1883) (MissingVacant!1883 (index!9705 (_ BitVec 32))) )
))
(declare-fun lt!140849 () SeekEntryResult!1883)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!285393 (= res!147772 (or (= lt!140849 (MissingZero!1883 i!1267)) (= lt!140849 (MissingVacant!1883 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14246 (_ BitVec 32)) SeekEntryResult!1883)

(assert (=> b!285393 (= lt!140849 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!285394 () Bool)

(assert (=> b!285394 (= e!180911 false)))

(declare-fun lt!140850 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14246 (_ BitVec 32)) Bool)

(assert (=> b!285394 (= lt!140850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!285395 () Bool)

(declare-fun res!147777 () Bool)

(assert (=> b!285395 (=> (not res!147777) (not e!180909))))

(declare-fun arrayContainsKey!0 (array!14246 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285395 (= res!147777 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!285396 () Bool)

(declare-fun res!147774 () Bool)

(assert (=> b!285396 (=> (not res!147774) (not e!180909))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!285396 (= res!147774 (and (= (size!7112 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7112 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7112 a!3325))))))

(declare-fun b!285397 () Bool)

(declare-fun res!147773 () Bool)

(assert (=> b!285397 (=> (not res!147773) (not e!180909))))

(declare-datatypes ((List!4481 0))(
  ( (Nil!4478) (Cons!4477 (h!5150 (_ BitVec 64)) (t!9555 List!4481)) )
))
(declare-fun arrayNoDuplicates!0 (array!14246 (_ BitVec 32) List!4481) Bool)

(assert (=> b!285397 (= res!147773 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4478))))

(assert (= (and start!27642 res!147775) b!285396))

(assert (= (and b!285396 res!147774) b!285392))

(assert (= (and b!285392 res!147776) b!285397))

(assert (= (and b!285397 res!147773) b!285395))

(assert (= (and b!285395 res!147777) b!285393))

(assert (= (and b!285393 res!147772) b!285394))

(declare-fun m!300401 () Bool)

(assert (=> b!285394 m!300401))

(declare-fun m!300403 () Bool)

(assert (=> b!285392 m!300403))

(declare-fun m!300405 () Bool)

(assert (=> b!285393 m!300405))

(declare-fun m!300407 () Bool)

(assert (=> start!27642 m!300407))

(declare-fun m!300409 () Bool)

(assert (=> start!27642 m!300409))

(declare-fun m!300411 () Bool)

(assert (=> b!285397 m!300411))

(declare-fun m!300413 () Bool)

(assert (=> b!285395 m!300413))

(check-sat (not b!285392) (not b!285397) (not b!285395) (not b!285393) (not start!27642) (not b!285394))
(check-sat)
