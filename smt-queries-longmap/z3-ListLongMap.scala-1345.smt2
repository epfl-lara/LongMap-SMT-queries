; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26630 () Bool)

(assert start!26630)

(declare-fun b!276286 () Bool)

(declare-fun res!140329 () Bool)

(declare-fun e!176502 () Bool)

(assert (=> b!276286 (=> (not res!140329) (not e!176502))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276286 (= res!140329 (validKeyInArray!0 k0!2581))))

(declare-fun b!276287 () Bool)

(declare-fun res!140332 () Bool)

(assert (=> b!276287 (=> (not res!140332) (not e!176502))))

(declare-datatypes ((array!13716 0))(
  ( (array!13717 (arr!6507 (Array (_ BitVec 32) (_ BitVec 64))) (size!6860 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13716)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!276287 (= res!140332 (and (= (size!6860 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6860 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6860 a!3325))))))

(declare-fun b!276288 () Bool)

(declare-fun e!176500 () Bool)

(assert (=> b!276288 (= e!176502 e!176500)))

(declare-fun res!140327 () Bool)

(assert (=> b!276288 (=> (not res!140327) (not e!176500))))

(declare-datatypes ((SeekEntryResult!1664 0))(
  ( (MissingZero!1664 (index!8826 (_ BitVec 32))) (Found!1664 (index!8827 (_ BitVec 32))) (Intermediate!1664 (undefined!2476 Bool) (index!8828 (_ BitVec 32)) (x!27108 (_ BitVec 32))) (Undefined!1664) (MissingVacant!1664 (index!8829 (_ BitVec 32))) )
))
(declare-fun lt!137459 () SeekEntryResult!1664)

(assert (=> b!276288 (= res!140327 (or (= lt!137459 (MissingZero!1664 i!1267)) (= lt!137459 (MissingVacant!1664 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13716 (_ BitVec 32)) SeekEntryResult!1664)

(assert (=> b!276288 (= lt!137459 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276285 () Bool)

(declare-fun res!140328 () Bool)

(assert (=> b!276285 (=> (not res!140328) (not e!176502))))

(declare-datatypes ((List!4288 0))(
  ( (Nil!4285) (Cons!4284 (h!4951 (_ BitVec 64)) (t!9361 List!4288)) )
))
(declare-fun arrayNoDuplicates!0 (array!13716 (_ BitVec 32) List!4288) Bool)

(assert (=> b!276285 (= res!140328 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4285))))

(declare-fun res!140330 () Bool)

(assert (=> start!26630 (=> (not res!140330) (not e!176502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26630 (= res!140330 (validMask!0 mask!3868))))

(assert (=> start!26630 e!176502))

(declare-fun array_inv!4479 (array!13716) Bool)

(assert (=> start!26630 (array_inv!4479 a!3325)))

(assert (=> start!26630 true))

(declare-fun b!276289 () Bool)

(declare-fun res!140331 () Bool)

(assert (=> b!276289 (=> (not res!140331) (not e!176502))))

(declare-fun arrayContainsKey!0 (array!13716 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276289 (= res!140331 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276290 () Bool)

(assert (=> b!276290 (= e!176500 false)))

(declare-fun lt!137460 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13716 (_ BitVec 32)) Bool)

(assert (=> b!276290 (= lt!137460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26630 res!140330) b!276287))

(assert (= (and b!276287 res!140332) b!276286))

(assert (= (and b!276286 res!140329) b!276285))

(assert (= (and b!276285 res!140328) b!276289))

(assert (= (and b!276289 res!140331) b!276288))

(assert (= (and b!276288 res!140327) b!276290))

(declare-fun m!291179 () Bool)

(assert (=> b!276286 m!291179))

(declare-fun m!291181 () Bool)

(assert (=> b!276288 m!291181))

(declare-fun m!291183 () Bool)

(assert (=> b!276289 m!291183))

(declare-fun m!291185 () Bool)

(assert (=> b!276285 m!291185))

(declare-fun m!291187 () Bool)

(assert (=> start!26630 m!291187))

(declare-fun m!291189 () Bool)

(assert (=> start!26630 m!291189))

(declare-fun m!291191 () Bool)

(assert (=> b!276290 m!291191))

(check-sat (not b!276290) (not start!26630) (not b!276288) (not b!276285) (not b!276289) (not b!276286))
(check-sat)
