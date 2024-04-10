; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26540 () Bool)

(assert start!26540)

(declare-fun b!275460 () Bool)

(declare-fun res!139453 () Bool)

(declare-fun e!176207 () Bool)

(assert (=> b!275460 (=> (not res!139453) (not e!176207))))

(declare-datatypes ((array!13637 0))(
  ( (array!13638 (arr!6468 (Array (_ BitVec 32) (_ BitVec 64))) (size!6820 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13637)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!275460 (= res!139453 (and (= (size!6820 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6820 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6820 a!3325))))))

(declare-fun b!275461 () Bool)

(declare-fun res!139452 () Bool)

(assert (=> b!275461 (=> (not res!139452) (not e!176207))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275461 (= res!139452 (validKeyInArray!0 k0!2581))))

(declare-fun b!275462 () Bool)

(declare-fun e!176206 () Bool)

(assert (=> b!275462 (= e!176207 e!176206)))

(declare-fun res!139450 () Bool)

(assert (=> b!275462 (=> (not res!139450) (not e!176206))))

(declare-datatypes ((SeekEntryResult!1626 0))(
  ( (MissingZero!1626 (index!8674 (_ BitVec 32))) (Found!1626 (index!8675 (_ BitVec 32))) (Intermediate!1626 (undefined!2438 Bool) (index!8676 (_ BitVec 32)) (x!26951 (_ BitVec 32))) (Undefined!1626) (MissingVacant!1626 (index!8677 (_ BitVec 32))) )
))
(declare-fun lt!137395 () SeekEntryResult!1626)

(assert (=> b!275462 (= res!139450 (or (= lt!137395 (MissingZero!1626 i!1267)) (= lt!137395 (MissingVacant!1626 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13637 (_ BitVec 32)) SeekEntryResult!1626)

(assert (=> b!275462 (= lt!137395 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275463 () Bool)

(declare-fun res!139451 () Bool)

(assert (=> b!275463 (=> (not res!139451) (not e!176207))))

(declare-fun arrayContainsKey!0 (array!13637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275463 (= res!139451 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275464 () Bool)

(assert (=> b!275464 (= e!176206 false)))

(declare-fun lt!137394 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13637 (_ BitVec 32)) Bool)

(assert (=> b!275464 (= lt!137394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!139455 () Bool)

(assert (=> start!26540 (=> (not res!139455) (not e!176207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26540 (= res!139455 (validMask!0 mask!3868))))

(assert (=> start!26540 e!176207))

(declare-fun array_inv!4431 (array!13637) Bool)

(assert (=> start!26540 (array_inv!4431 a!3325)))

(assert (=> start!26540 true))

(declare-fun b!275465 () Bool)

(declare-fun res!139454 () Bool)

(assert (=> b!275465 (=> (not res!139454) (not e!176207))))

(declare-datatypes ((List!4276 0))(
  ( (Nil!4273) (Cons!4272 (h!4939 (_ BitVec 64)) (t!9358 List!4276)) )
))
(declare-fun arrayNoDuplicates!0 (array!13637 (_ BitVec 32) List!4276) Bool)

(assert (=> b!275465 (= res!139454 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4273))))

(assert (= (and start!26540 res!139455) b!275460))

(assert (= (and b!275460 res!139453) b!275461))

(assert (= (and b!275461 res!139452) b!275465))

(assert (= (and b!275465 res!139454) b!275463))

(assert (= (and b!275463 res!139451) b!275462))

(assert (= (and b!275462 res!139450) b!275464))

(declare-fun m!291023 () Bool)

(assert (=> b!275465 m!291023))

(declare-fun m!291025 () Bool)

(assert (=> b!275464 m!291025))

(declare-fun m!291027 () Bool)

(assert (=> b!275463 m!291027))

(declare-fun m!291029 () Bool)

(assert (=> b!275461 m!291029))

(declare-fun m!291031 () Bool)

(assert (=> start!26540 m!291031))

(declare-fun m!291033 () Bool)

(assert (=> start!26540 m!291033))

(declare-fun m!291035 () Bool)

(assert (=> b!275462 m!291035))

(check-sat (not b!275463) (not b!275465) (not b!275464) (not start!26540) (not b!275462) (not b!275461))
(check-sat)
