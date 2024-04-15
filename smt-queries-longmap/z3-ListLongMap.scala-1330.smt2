; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26540 () Bool)

(assert start!26540)

(declare-fun b!275295 () Bool)

(declare-fun res!139342 () Bool)

(declare-fun e!176096 () Bool)

(assert (=> b!275295 (=> (not res!139342) (not e!176096))))

(declare-datatypes ((array!13626 0))(
  ( (array!13627 (arr!6462 (Array (_ BitVec 32) (_ BitVec 64))) (size!6815 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13626)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275295 (= res!139342 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275296 () Bool)

(declare-fun e!176095 () Bool)

(assert (=> b!275296 (= e!176096 e!176095)))

(declare-fun res!139338 () Bool)

(assert (=> b!275296 (=> (not res!139338) (not e!176095))))

(declare-datatypes ((SeekEntryResult!1619 0))(
  ( (MissingZero!1619 (index!8646 (_ BitVec 32))) (Found!1619 (index!8647 (_ BitVec 32))) (Intermediate!1619 (undefined!2431 Bool) (index!8648 (_ BitVec 32)) (x!26943 (_ BitVec 32))) (Undefined!1619) (MissingVacant!1619 (index!8649 (_ BitVec 32))) )
))
(declare-fun lt!137207 () SeekEntryResult!1619)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275296 (= res!139338 (or (= lt!137207 (MissingZero!1619 i!1267)) (= lt!137207 (MissingVacant!1619 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13626 (_ BitVec 32)) SeekEntryResult!1619)

(assert (=> b!275296 (= lt!137207 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275297 () Bool)

(declare-fun res!139339 () Bool)

(assert (=> b!275297 (=> (not res!139339) (not e!176096))))

(declare-datatypes ((List!4243 0))(
  ( (Nil!4240) (Cons!4239 (h!4906 (_ BitVec 64)) (t!9316 List!4243)) )
))
(declare-fun arrayNoDuplicates!0 (array!13626 (_ BitVec 32) List!4243) Bool)

(assert (=> b!275297 (= res!139339 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4240))))

(declare-fun b!275298 () Bool)

(declare-fun res!139341 () Bool)

(assert (=> b!275298 (=> (not res!139341) (not e!176096))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275298 (= res!139341 (and (= (size!6815 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6815 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6815 a!3325))))))

(declare-fun b!275299 () Bool)

(assert (=> b!275299 (= e!176095 false)))

(declare-fun lt!137208 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13626 (_ BitVec 32)) Bool)

(assert (=> b!275299 (= lt!137208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275300 () Bool)

(declare-fun res!139337 () Bool)

(assert (=> b!275300 (=> (not res!139337) (not e!176096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275300 (= res!139337 (validKeyInArray!0 k0!2581))))

(declare-fun res!139340 () Bool)

(assert (=> start!26540 (=> (not res!139340) (not e!176096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26540 (= res!139340 (validMask!0 mask!3868))))

(assert (=> start!26540 e!176096))

(declare-fun array_inv!4434 (array!13626) Bool)

(assert (=> start!26540 (array_inv!4434 a!3325)))

(assert (=> start!26540 true))

(assert (= (and start!26540 res!139340) b!275298))

(assert (= (and b!275298 res!139341) b!275300))

(assert (= (and b!275300 res!139337) b!275297))

(assert (= (and b!275297 res!139339) b!275295))

(assert (= (and b!275295 res!139342) b!275296))

(assert (= (and b!275296 res!139338) b!275299))

(declare-fun m!290417 () Bool)

(assert (=> b!275297 m!290417))

(declare-fun m!290419 () Bool)

(assert (=> start!26540 m!290419))

(declare-fun m!290421 () Bool)

(assert (=> start!26540 m!290421))

(declare-fun m!290423 () Bool)

(assert (=> b!275300 m!290423))

(declare-fun m!290425 () Bool)

(assert (=> b!275295 m!290425))

(declare-fun m!290427 () Bool)

(assert (=> b!275299 m!290427))

(declare-fun m!290429 () Bool)

(assert (=> b!275296 m!290429))

(check-sat (not b!275300) (not b!275295) (not start!26540) (not b!275297) (not b!275296) (not b!275299))
(check-sat)
