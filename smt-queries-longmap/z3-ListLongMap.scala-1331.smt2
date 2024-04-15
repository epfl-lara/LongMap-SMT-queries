; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26546 () Bool)

(assert start!26546)

(declare-fun b!275349 () Bool)

(declare-fun e!176124 () Bool)

(assert (=> b!275349 (= e!176124 false)))

(declare-fun lt!137225 () Bool)

(declare-datatypes ((array!13632 0))(
  ( (array!13633 (arr!6465 (Array (_ BitVec 32) (_ BitVec 64))) (size!6818 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13632)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13632 (_ BitVec 32)) Bool)

(assert (=> b!275349 (= lt!137225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275351 () Bool)

(declare-fun e!176123 () Bool)

(assert (=> b!275351 (= e!176123 e!176124)))

(declare-fun res!139391 () Bool)

(assert (=> b!275351 (=> (not res!139391) (not e!176124))))

(declare-datatypes ((SeekEntryResult!1622 0))(
  ( (MissingZero!1622 (index!8658 (_ BitVec 32))) (Found!1622 (index!8659 (_ BitVec 32))) (Intermediate!1622 (undefined!2434 Bool) (index!8660 (_ BitVec 32)) (x!26954 (_ BitVec 32))) (Undefined!1622) (MissingVacant!1622 (index!8661 (_ BitVec 32))) )
))
(declare-fun lt!137226 () SeekEntryResult!1622)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275351 (= res!139391 (or (= lt!137226 (MissingZero!1622 i!1267)) (= lt!137226 (MissingVacant!1622 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13632 (_ BitVec 32)) SeekEntryResult!1622)

(assert (=> b!275351 (= lt!137226 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275352 () Bool)

(declare-fun res!139395 () Bool)

(assert (=> b!275352 (=> (not res!139395) (not e!176123))))

(declare-fun arrayContainsKey!0 (array!13632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275352 (= res!139395 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275353 () Bool)

(declare-fun res!139396 () Bool)

(assert (=> b!275353 (=> (not res!139396) (not e!176123))))

(declare-datatypes ((List!4246 0))(
  ( (Nil!4243) (Cons!4242 (h!4909 (_ BitVec 64)) (t!9319 List!4246)) )
))
(declare-fun arrayNoDuplicates!0 (array!13632 (_ BitVec 32) List!4246) Bool)

(assert (=> b!275353 (= res!139396 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4243))))

(declare-fun b!275354 () Bool)

(declare-fun res!139393 () Bool)

(assert (=> b!275354 (=> (not res!139393) (not e!176123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275354 (= res!139393 (validKeyInArray!0 k0!2581))))

(declare-fun b!275350 () Bool)

(declare-fun res!139394 () Bool)

(assert (=> b!275350 (=> (not res!139394) (not e!176123))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275350 (= res!139394 (and (= (size!6818 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6818 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6818 a!3325))))))

(declare-fun res!139392 () Bool)

(assert (=> start!26546 (=> (not res!139392) (not e!176123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26546 (= res!139392 (validMask!0 mask!3868))))

(assert (=> start!26546 e!176123))

(declare-fun array_inv!4437 (array!13632) Bool)

(assert (=> start!26546 (array_inv!4437 a!3325)))

(assert (=> start!26546 true))

(assert (= (and start!26546 res!139392) b!275350))

(assert (= (and b!275350 res!139394) b!275354))

(assert (= (and b!275354 res!139393) b!275353))

(assert (= (and b!275353 res!139396) b!275352))

(assert (= (and b!275352 res!139395) b!275351))

(assert (= (and b!275351 res!139391) b!275349))

(declare-fun m!290459 () Bool)

(assert (=> b!275351 m!290459))

(declare-fun m!290461 () Bool)

(assert (=> start!26546 m!290461))

(declare-fun m!290463 () Bool)

(assert (=> start!26546 m!290463))

(declare-fun m!290465 () Bool)

(assert (=> b!275354 m!290465))

(declare-fun m!290467 () Bool)

(assert (=> b!275353 m!290467))

(declare-fun m!290469 () Bool)

(assert (=> b!275349 m!290469))

(declare-fun m!290471 () Bool)

(assert (=> b!275352 m!290471))

(check-sat (not start!26546) (not b!275349) (not b!275352) (not b!275354) (not b!275351) (not b!275353))
(check-sat)
