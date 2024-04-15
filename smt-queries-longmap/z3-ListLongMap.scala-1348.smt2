; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26648 () Bool)

(assert start!26648)

(declare-fun b!276456 () Bool)

(declare-fun e!176583 () Bool)

(declare-fun e!176581 () Bool)

(assert (=> b!276456 (= e!176583 e!176581)))

(declare-fun res!140499 () Bool)

(assert (=> b!276456 (=> (not res!140499) (not e!176581))))

(declare-datatypes ((SeekEntryResult!1673 0))(
  ( (MissingZero!1673 (index!8862 (_ BitVec 32))) (Found!1673 (index!8863 (_ BitVec 32))) (Intermediate!1673 (undefined!2485 Bool) (index!8864 (_ BitVec 32)) (x!27141 (_ BitVec 32))) (Undefined!1673) (MissingVacant!1673 (index!8865 (_ BitVec 32))) )
))
(declare-fun lt!137505 () SeekEntryResult!1673)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276456 (= res!140499 (or (= lt!137505 (MissingZero!1673 i!1267)) (= lt!137505 (MissingVacant!1673 i!1267))))))

(declare-datatypes ((array!13734 0))(
  ( (array!13735 (arr!6516 (Array (_ BitVec 32) (_ BitVec 64))) (size!6869 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13734)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13734 (_ BitVec 32)) SeekEntryResult!1673)

(assert (=> b!276456 (= lt!137505 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276457 () Bool)

(declare-fun res!140502 () Bool)

(assert (=> b!276457 (=> (not res!140502) (not e!176583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276457 (= res!140502 (validKeyInArray!0 k0!2581))))

(declare-fun b!276458 () Bool)

(assert (=> b!276458 (= e!176581 false)))

(declare-fun lt!137504 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13734 (_ BitVec 32)) Bool)

(assert (=> b!276458 (= lt!137504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!140498 () Bool)

(assert (=> start!26648 (=> (not res!140498) (not e!176583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26648 (= res!140498 (validMask!0 mask!3868))))

(assert (=> start!26648 e!176583))

(declare-fun array_inv!4488 (array!13734) Bool)

(assert (=> start!26648 (array_inv!4488 a!3325)))

(assert (=> start!26648 true))

(declare-fun b!276459 () Bool)

(declare-fun res!140500 () Bool)

(assert (=> b!276459 (=> (not res!140500) (not e!176583))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276459 (= res!140500 (and (= (size!6869 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6869 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6869 a!3325))))))

(declare-fun b!276460 () Bool)

(declare-fun res!140503 () Bool)

(assert (=> b!276460 (=> (not res!140503) (not e!176583))))

(declare-datatypes ((List!4297 0))(
  ( (Nil!4294) (Cons!4293 (h!4960 (_ BitVec 64)) (t!9370 List!4297)) )
))
(declare-fun arrayNoDuplicates!0 (array!13734 (_ BitVec 32) List!4297) Bool)

(assert (=> b!276460 (= res!140503 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4294))))

(declare-fun b!276461 () Bool)

(declare-fun res!140501 () Bool)

(assert (=> b!276461 (=> (not res!140501) (not e!176583))))

(declare-fun arrayContainsKey!0 (array!13734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276461 (= res!140501 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26648 res!140498) b!276459))

(assert (= (and b!276459 res!140500) b!276457))

(assert (= (and b!276457 res!140502) b!276460))

(assert (= (and b!276460 res!140503) b!276461))

(assert (= (and b!276461 res!140501) b!276456))

(assert (= (and b!276456 res!140499) b!276458))

(declare-fun m!291305 () Bool)

(assert (=> start!26648 m!291305))

(declare-fun m!291307 () Bool)

(assert (=> start!26648 m!291307))

(declare-fun m!291309 () Bool)

(assert (=> b!276460 m!291309))

(declare-fun m!291311 () Bool)

(assert (=> b!276456 m!291311))

(declare-fun m!291313 () Bool)

(assert (=> b!276457 m!291313))

(declare-fun m!291315 () Bool)

(assert (=> b!276461 m!291315))

(declare-fun m!291317 () Bool)

(assert (=> b!276458 m!291317))

(check-sat (not b!276456) (not b!276460) (not b!276457) (not start!26648) (not b!276461) (not b!276458))
(check-sat)
