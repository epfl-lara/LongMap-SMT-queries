; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26526 () Bool)

(assert start!26526)

(declare-fun res!139324 () Bool)

(declare-fun e!176142 () Bool)

(assert (=> start!26526 (=> (not res!139324) (not e!176142))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26526 (= res!139324 (validMask!0 mask!3868))))

(assert (=> start!26526 e!176142))

(declare-datatypes ((array!13623 0))(
  ( (array!13624 (arr!6461 (Array (_ BitVec 32) (_ BitVec 64))) (size!6813 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13623)

(declare-fun array_inv!4424 (array!13623) Bool)

(assert (=> start!26526 (array_inv!4424 a!3325)))

(assert (=> start!26526 true))

(declare-fun b!275334 () Bool)

(declare-fun e!176143 () Bool)

(assert (=> b!275334 (= e!176143 false)))

(declare-fun lt!137353 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13623 (_ BitVec 32)) Bool)

(assert (=> b!275334 (= lt!137353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275335 () Bool)

(declare-fun res!139329 () Bool)

(assert (=> b!275335 (=> (not res!139329) (not e!176142))))

(declare-datatypes ((List!4269 0))(
  ( (Nil!4266) (Cons!4265 (h!4932 (_ BitVec 64)) (t!9351 List!4269)) )
))
(declare-fun arrayNoDuplicates!0 (array!13623 (_ BitVec 32) List!4269) Bool)

(assert (=> b!275335 (= res!139329 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4266))))

(declare-fun b!275336 () Bool)

(declare-fun res!139326 () Bool)

(assert (=> b!275336 (=> (not res!139326) (not e!176142))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275336 (= res!139326 (validKeyInArray!0 k!2581))))

(declare-fun b!275337 () Bool)

(assert (=> b!275337 (= e!176142 e!176143)))

(declare-fun res!139327 () Bool)

(assert (=> b!275337 (=> (not res!139327) (not e!176143))))

(declare-datatypes ((SeekEntryResult!1619 0))(
  ( (MissingZero!1619 (index!8646 (_ BitVec 32))) (Found!1619 (index!8647 (_ BitVec 32))) (Intermediate!1619 (undefined!2431 Bool) (index!8648 (_ BitVec 32)) (x!26928 (_ BitVec 32))) (Undefined!1619) (MissingVacant!1619 (index!8649 (_ BitVec 32))) )
))
(declare-fun lt!137352 () SeekEntryResult!1619)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275337 (= res!139327 (or (= lt!137352 (MissingZero!1619 i!1267)) (= lt!137352 (MissingVacant!1619 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13623 (_ BitVec 32)) SeekEntryResult!1619)

(assert (=> b!275337 (= lt!137352 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275338 () Bool)

(declare-fun res!139328 () Bool)

(assert (=> b!275338 (=> (not res!139328) (not e!176142))))

(declare-fun arrayContainsKey!0 (array!13623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275338 (= res!139328 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275339 () Bool)

(declare-fun res!139325 () Bool)

(assert (=> b!275339 (=> (not res!139325) (not e!176142))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275339 (= res!139325 (and (= (size!6813 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6813 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6813 a!3325))))))

(assert (= (and start!26526 res!139324) b!275339))

(assert (= (and b!275339 res!139325) b!275336))

(assert (= (and b!275336 res!139326) b!275335))

(assert (= (and b!275335 res!139329) b!275338))

(assert (= (and b!275338 res!139328) b!275337))

(assert (= (and b!275337 res!139327) b!275334))

(declare-fun m!290925 () Bool)

(assert (=> start!26526 m!290925))

(declare-fun m!290927 () Bool)

(assert (=> start!26526 m!290927))

(declare-fun m!290929 () Bool)

(assert (=> b!275337 m!290929))

(declare-fun m!290931 () Bool)

(assert (=> b!275338 m!290931))

(declare-fun m!290933 () Bool)

(assert (=> b!275336 m!290933))

(declare-fun m!290935 () Bool)

(assert (=> b!275335 m!290935))

(declare-fun m!290937 () Bool)

(assert (=> b!275334 m!290937))

(push 1)

