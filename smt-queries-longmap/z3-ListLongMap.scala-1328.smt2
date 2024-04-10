; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26528 () Bool)

(assert start!26528)

(declare-fun b!275352 () Bool)

(declare-fun res!139343 () Bool)

(declare-fun e!176153 () Bool)

(assert (=> b!275352 (=> (not res!139343) (not e!176153))))

(declare-datatypes ((array!13625 0))(
  ( (array!13626 (arr!6462 (Array (_ BitVec 32) (_ BitVec 64))) (size!6814 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13625)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275352 (= res!139343 (and (= (size!6814 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6814 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6814 a!3325))))))

(declare-fun b!275353 () Bool)

(declare-fun res!139345 () Bool)

(assert (=> b!275353 (=> (not res!139345) (not e!176153))))

(declare-datatypes ((List!4270 0))(
  ( (Nil!4267) (Cons!4266 (h!4933 (_ BitVec 64)) (t!9352 List!4270)) )
))
(declare-fun arrayNoDuplicates!0 (array!13625 (_ BitVec 32) List!4270) Bool)

(assert (=> b!275353 (= res!139345 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4267))))

(declare-fun b!275354 () Bool)

(declare-fun e!176151 () Bool)

(assert (=> b!275354 (= e!176153 e!176151)))

(declare-fun res!139347 () Bool)

(assert (=> b!275354 (=> (not res!139347) (not e!176151))))

(declare-datatypes ((SeekEntryResult!1620 0))(
  ( (MissingZero!1620 (index!8650 (_ BitVec 32))) (Found!1620 (index!8651 (_ BitVec 32))) (Intermediate!1620 (undefined!2432 Bool) (index!8652 (_ BitVec 32)) (x!26929 (_ BitVec 32))) (Undefined!1620) (MissingVacant!1620 (index!8653 (_ BitVec 32))) )
))
(declare-fun lt!137359 () SeekEntryResult!1620)

(assert (=> b!275354 (= res!139347 (or (= lt!137359 (MissingZero!1620 i!1267)) (= lt!137359 (MissingVacant!1620 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13625 (_ BitVec 32)) SeekEntryResult!1620)

(assert (=> b!275354 (= lt!137359 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275355 () Bool)

(declare-fun res!139344 () Bool)

(assert (=> b!275355 (=> (not res!139344) (not e!176153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275355 (= res!139344 (validKeyInArray!0 k0!2581))))

(declare-fun res!139346 () Bool)

(assert (=> start!26528 (=> (not res!139346) (not e!176153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26528 (= res!139346 (validMask!0 mask!3868))))

(assert (=> start!26528 e!176153))

(declare-fun array_inv!4425 (array!13625) Bool)

(assert (=> start!26528 (array_inv!4425 a!3325)))

(assert (=> start!26528 true))

(declare-fun b!275356 () Bool)

(assert (=> b!275356 (= e!176151 false)))

(declare-fun lt!137358 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13625 (_ BitVec 32)) Bool)

(assert (=> b!275356 (= lt!137358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275357 () Bool)

(declare-fun res!139342 () Bool)

(assert (=> b!275357 (=> (not res!139342) (not e!176153))))

(declare-fun arrayContainsKey!0 (array!13625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275357 (= res!139342 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26528 res!139346) b!275352))

(assert (= (and b!275352 res!139343) b!275355))

(assert (= (and b!275355 res!139344) b!275353))

(assert (= (and b!275353 res!139345) b!275357))

(assert (= (and b!275357 res!139342) b!275354))

(assert (= (and b!275354 res!139347) b!275356))

(declare-fun m!290939 () Bool)

(assert (=> b!275354 m!290939))

(declare-fun m!290941 () Bool)

(assert (=> b!275356 m!290941))

(declare-fun m!290943 () Bool)

(assert (=> b!275357 m!290943))

(declare-fun m!290945 () Bool)

(assert (=> start!26528 m!290945))

(declare-fun m!290947 () Bool)

(assert (=> start!26528 m!290947))

(declare-fun m!290949 () Bool)

(assert (=> b!275353 m!290949))

(declare-fun m!290951 () Bool)

(assert (=> b!275355 m!290951))

(check-sat (not b!275353) (not b!275356) (not b!275354) (not b!275355) (not start!26528) (not b!275357))
(check-sat)
