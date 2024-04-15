; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26534 () Bool)

(assert start!26534)

(declare-fun b!275241 () Bool)

(declare-fun res!139284 () Bool)

(declare-fun e!176069 () Bool)

(assert (=> b!275241 (=> (not res!139284) (not e!176069))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275241 (= res!139284 (validKeyInArray!0 k0!2581))))

(declare-fun b!275242 () Bool)

(declare-fun e!176070 () Bool)

(assert (=> b!275242 (= e!176070 false)))

(declare-fun lt!137190 () Bool)

(declare-datatypes ((array!13620 0))(
  ( (array!13621 (arr!6459 (Array (_ BitVec 32) (_ BitVec 64))) (size!6812 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13620)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13620 (_ BitVec 32)) Bool)

(assert (=> b!275242 (= lt!137190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275243 () Bool)

(declare-fun res!139283 () Bool)

(assert (=> b!275243 (=> (not res!139283) (not e!176069))))

(declare-fun arrayContainsKey!0 (array!13620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275243 (= res!139283 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275245 () Bool)

(declare-fun res!139286 () Bool)

(assert (=> b!275245 (=> (not res!139286) (not e!176069))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275245 (= res!139286 (and (= (size!6812 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6812 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6812 a!3325))))))

(declare-fun b!275246 () Bool)

(assert (=> b!275246 (= e!176069 e!176070)))

(declare-fun res!139288 () Bool)

(assert (=> b!275246 (=> (not res!139288) (not e!176070))))

(declare-datatypes ((SeekEntryResult!1616 0))(
  ( (MissingZero!1616 (index!8634 (_ BitVec 32))) (Found!1616 (index!8635 (_ BitVec 32))) (Intermediate!1616 (undefined!2428 Bool) (index!8636 (_ BitVec 32)) (x!26932 (_ BitVec 32))) (Undefined!1616) (MissingVacant!1616 (index!8637 (_ BitVec 32))) )
))
(declare-fun lt!137189 () SeekEntryResult!1616)

(assert (=> b!275246 (= res!139288 (or (= lt!137189 (MissingZero!1616 i!1267)) (= lt!137189 (MissingVacant!1616 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13620 (_ BitVec 32)) SeekEntryResult!1616)

(assert (=> b!275246 (= lt!137189 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!139287 () Bool)

(assert (=> start!26534 (=> (not res!139287) (not e!176069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26534 (= res!139287 (validMask!0 mask!3868))))

(assert (=> start!26534 e!176069))

(declare-fun array_inv!4431 (array!13620) Bool)

(assert (=> start!26534 (array_inv!4431 a!3325)))

(assert (=> start!26534 true))

(declare-fun b!275244 () Bool)

(declare-fun res!139285 () Bool)

(assert (=> b!275244 (=> (not res!139285) (not e!176069))))

(declare-datatypes ((List!4240 0))(
  ( (Nil!4237) (Cons!4236 (h!4903 (_ BitVec 64)) (t!9313 List!4240)) )
))
(declare-fun arrayNoDuplicates!0 (array!13620 (_ BitVec 32) List!4240) Bool)

(assert (=> b!275244 (= res!139285 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4237))))

(assert (= (and start!26534 res!139287) b!275245))

(assert (= (and b!275245 res!139286) b!275241))

(assert (= (and b!275241 res!139284) b!275244))

(assert (= (and b!275244 res!139285) b!275243))

(assert (= (and b!275243 res!139283) b!275246))

(assert (= (and b!275246 res!139288) b!275242))

(declare-fun m!290375 () Bool)

(assert (=> b!275241 m!290375))

(declare-fun m!290377 () Bool)

(assert (=> b!275244 m!290377))

(declare-fun m!290379 () Bool)

(assert (=> b!275242 m!290379))

(declare-fun m!290381 () Bool)

(assert (=> b!275246 m!290381))

(declare-fun m!290383 () Bool)

(assert (=> b!275243 m!290383))

(declare-fun m!290385 () Bool)

(assert (=> start!26534 m!290385))

(declare-fun m!290387 () Bool)

(assert (=> start!26534 m!290387))

(check-sat (not b!275244) (not b!275242) (not b!275241) (not b!275243) (not b!275246) (not start!26534))
(check-sat)
