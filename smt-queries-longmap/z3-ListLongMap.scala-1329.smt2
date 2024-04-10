; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26534 () Bool)

(assert start!26534)

(declare-fun b!275406 () Bool)

(declare-fun e!176179 () Bool)

(assert (=> b!275406 (= e!176179 false)))

(declare-fun lt!137376 () Bool)

(declare-datatypes ((array!13631 0))(
  ( (array!13632 (arr!6465 (Array (_ BitVec 32) (_ BitVec 64))) (size!6817 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13631)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13631 (_ BitVec 32)) Bool)

(assert (=> b!275406 (= lt!137376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275407 () Bool)

(declare-fun res!139399 () Bool)

(declare-fun e!176180 () Bool)

(assert (=> b!275407 (=> (not res!139399) (not e!176180))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275407 (= res!139399 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275408 () Bool)

(assert (=> b!275408 (= e!176180 e!176179)))

(declare-fun res!139397 () Bool)

(assert (=> b!275408 (=> (not res!139397) (not e!176179))))

(declare-datatypes ((SeekEntryResult!1623 0))(
  ( (MissingZero!1623 (index!8662 (_ BitVec 32))) (Found!1623 (index!8663 (_ BitVec 32))) (Intermediate!1623 (undefined!2435 Bool) (index!8664 (_ BitVec 32)) (x!26940 (_ BitVec 32))) (Undefined!1623) (MissingVacant!1623 (index!8665 (_ BitVec 32))) )
))
(declare-fun lt!137377 () SeekEntryResult!1623)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275408 (= res!139397 (or (= lt!137377 (MissingZero!1623 i!1267)) (= lt!137377 (MissingVacant!1623 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13631 (_ BitVec 32)) SeekEntryResult!1623)

(assert (=> b!275408 (= lt!137377 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275409 () Bool)

(declare-fun res!139401 () Bool)

(assert (=> b!275409 (=> (not res!139401) (not e!176180))))

(declare-datatypes ((List!4273 0))(
  ( (Nil!4270) (Cons!4269 (h!4936 (_ BitVec 64)) (t!9355 List!4273)) )
))
(declare-fun arrayNoDuplicates!0 (array!13631 (_ BitVec 32) List!4273) Bool)

(assert (=> b!275409 (= res!139401 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4270))))

(declare-fun res!139398 () Bool)

(assert (=> start!26534 (=> (not res!139398) (not e!176180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26534 (= res!139398 (validMask!0 mask!3868))))

(assert (=> start!26534 e!176180))

(declare-fun array_inv!4428 (array!13631) Bool)

(assert (=> start!26534 (array_inv!4428 a!3325)))

(assert (=> start!26534 true))

(declare-fun b!275410 () Bool)

(declare-fun res!139400 () Bool)

(assert (=> b!275410 (=> (not res!139400) (not e!176180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275410 (= res!139400 (validKeyInArray!0 k0!2581))))

(declare-fun b!275411 () Bool)

(declare-fun res!139396 () Bool)

(assert (=> b!275411 (=> (not res!139396) (not e!176180))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275411 (= res!139396 (and (= (size!6817 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6817 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6817 a!3325))))))

(assert (= (and start!26534 res!139398) b!275411))

(assert (= (and b!275411 res!139396) b!275410))

(assert (= (and b!275410 res!139400) b!275409))

(assert (= (and b!275409 res!139401) b!275407))

(assert (= (and b!275407 res!139399) b!275408))

(assert (= (and b!275408 res!139397) b!275406))

(declare-fun m!290981 () Bool)

(assert (=> b!275407 m!290981))

(declare-fun m!290983 () Bool)

(assert (=> b!275410 m!290983))

(declare-fun m!290985 () Bool)

(assert (=> b!275408 m!290985))

(declare-fun m!290987 () Bool)

(assert (=> start!26534 m!290987))

(declare-fun m!290989 () Bool)

(assert (=> start!26534 m!290989))

(declare-fun m!290991 () Bool)

(assert (=> b!275406 m!290991))

(declare-fun m!290993 () Bool)

(assert (=> b!275409 m!290993))

(check-sat (not b!275409) (not b!275406) (not b!275410) (not b!275407) (not b!275408) (not start!26534))
(check-sat)
