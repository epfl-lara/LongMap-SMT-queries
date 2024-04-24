; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26538 () Bool)

(assert start!26538)

(declare-fun b!275490 () Bool)

(declare-fun e!176221 () Bool)

(assert (=> b!275490 (= e!176221 false)))

(declare-fun lt!137448 () Bool)

(declare-datatypes ((array!13634 0))(
  ( (array!13635 (arr!6466 (Array (_ BitVec 32) (_ BitVec 64))) (size!6818 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13634)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13634 (_ BitVec 32)) Bool)

(assert (=> b!275490 (= lt!137448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275491 () Bool)

(declare-fun res!139453 () Bool)

(declare-fun e!176220 () Bool)

(assert (=> b!275491 (=> (not res!139453) (not e!176220))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275491 (= res!139453 (validKeyInArray!0 k0!2581))))

(declare-fun b!275492 () Bool)

(declare-fun res!139458 () Bool)

(assert (=> b!275492 (=> (not res!139458) (not e!176220))))

(declare-fun arrayContainsKey!0 (array!13634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275492 (= res!139458 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275493 () Bool)

(declare-fun res!139457 () Bool)

(assert (=> b!275493 (=> (not res!139457) (not e!176220))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275493 (= res!139457 (and (= (size!6818 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6818 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6818 a!3325))))))

(declare-fun b!275494 () Bool)

(declare-fun res!139454 () Bool)

(assert (=> b!275494 (=> (not res!139454) (not e!176220))))

(declare-datatypes ((List!4187 0))(
  ( (Nil!4184) (Cons!4183 (h!4850 (_ BitVec 64)) (t!9261 List!4187)) )
))
(declare-fun arrayNoDuplicates!0 (array!13634 (_ BitVec 32) List!4187) Bool)

(assert (=> b!275494 (= res!139454 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4184))))

(declare-fun res!139456 () Bool)

(assert (=> start!26538 (=> (not res!139456) (not e!176220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26538 (= res!139456 (validMask!0 mask!3868))))

(assert (=> start!26538 e!176220))

(declare-fun array_inv!4416 (array!13634) Bool)

(assert (=> start!26538 (array_inv!4416 a!3325)))

(assert (=> start!26538 true))

(declare-fun b!275489 () Bool)

(assert (=> b!275489 (= e!176220 e!176221)))

(declare-fun res!139455 () Bool)

(assert (=> b!275489 (=> (not res!139455) (not e!176221))))

(declare-datatypes ((SeekEntryResult!1589 0))(
  ( (MissingZero!1589 (index!8526 (_ BitVec 32))) (Found!1589 (index!8527 (_ BitVec 32))) (Intermediate!1589 (undefined!2401 Bool) (index!8528 (_ BitVec 32)) (x!26914 (_ BitVec 32))) (Undefined!1589) (MissingVacant!1589 (index!8529 (_ BitVec 32))) )
))
(declare-fun lt!137447 () SeekEntryResult!1589)

(assert (=> b!275489 (= res!139455 (or (= lt!137447 (MissingZero!1589 i!1267)) (= lt!137447 (MissingVacant!1589 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13634 (_ BitVec 32)) SeekEntryResult!1589)

(assert (=> b!275489 (= lt!137447 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26538 res!139456) b!275493))

(assert (= (and b!275493 res!139457) b!275491))

(assert (= (and b!275491 res!139453) b!275494))

(assert (= (and b!275494 res!139454) b!275492))

(assert (= (and b!275492 res!139458) b!275489))

(assert (= (and b!275489 res!139455) b!275490))

(declare-fun m!291215 () Bool)

(assert (=> b!275489 m!291215))

(declare-fun m!291217 () Bool)

(assert (=> b!275490 m!291217))

(declare-fun m!291219 () Bool)

(assert (=> b!275491 m!291219))

(declare-fun m!291221 () Bool)

(assert (=> start!26538 m!291221))

(declare-fun m!291223 () Bool)

(assert (=> start!26538 m!291223))

(declare-fun m!291225 () Bool)

(assert (=> b!275494 m!291225))

(declare-fun m!291227 () Bool)

(assert (=> b!275492 m!291227))

(check-sat (not b!275491) (not b!275489) (not b!275492) (not b!275490) (not start!26538) (not b!275494))
(check-sat)
