; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26552 () Bool)

(assert start!26552)

(declare-fun b!275411 () Bool)

(declare-fun res!139461 () Bool)

(declare-fun e!176150 () Bool)

(assert (=> b!275411 (=> (not res!139461) (not e!176150))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13638 0))(
  ( (array!13639 (arr!6468 (Array (_ BitVec 32) (_ BitVec 64))) (size!6821 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13638)

(assert (=> b!275411 (= res!139461 (and (bvslt startIndex!26 (bvsub (size!6821 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!275412 () Bool)

(declare-fun res!139455 () Bool)

(assert (=> b!275412 (=> (not res!139455) (not e!176150))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275412 (= res!139455 (not (= startIndex!26 i!1267)))))

(declare-fun res!139453 () Bool)

(declare-fun e!176151 () Bool)

(assert (=> start!26552 (=> (not res!139453) (not e!176151))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26552 (= res!139453 (validMask!0 mask!3868))))

(assert (=> start!26552 e!176151))

(declare-fun array_inv!4440 (array!13638) Bool)

(assert (=> start!26552 (array_inv!4440 a!3325)))

(assert (=> start!26552 true))

(declare-fun b!275413 () Bool)

(declare-fun res!139458 () Bool)

(assert (=> b!275413 (=> (not res!139458) (not e!176151))))

(declare-datatypes ((List!4249 0))(
  ( (Nil!4246) (Cons!4245 (h!4912 (_ BitVec 64)) (t!9322 List!4249)) )
))
(declare-fun arrayNoDuplicates!0 (array!13638 (_ BitVec 32) List!4249) Bool)

(assert (=> b!275413 (= res!139458 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4246))))

(declare-fun b!275414 () Bool)

(declare-fun res!139456 () Bool)

(assert (=> b!275414 (=> (not res!139456) (not e!176150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13638 (_ BitVec 32)) Bool)

(assert (=> b!275414 (= res!139456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275415 () Bool)

(declare-fun res!139457 () Bool)

(assert (=> b!275415 (=> (not res!139457) (not e!176151))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275415 (= res!139457 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275416 () Bool)

(declare-fun res!139462 () Bool)

(assert (=> b!275416 (=> (not res!139462) (not e!176151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275416 (= res!139462 (validKeyInArray!0 k0!2581))))

(declare-fun b!275417 () Bool)

(assert (=> b!275417 (= e!176151 e!176150)))

(declare-fun res!139459 () Bool)

(assert (=> b!275417 (=> (not res!139459) (not e!176150))))

(declare-datatypes ((SeekEntryResult!1625 0))(
  ( (MissingZero!1625 (index!8670 (_ BitVec 32))) (Found!1625 (index!8671 (_ BitVec 32))) (Intermediate!1625 (undefined!2437 Bool) (index!8672 (_ BitVec 32)) (x!26965 (_ BitVec 32))) (Undefined!1625) (MissingVacant!1625 (index!8673 (_ BitVec 32))) )
))
(declare-fun lt!137243 () SeekEntryResult!1625)

(assert (=> b!275417 (= res!139459 (or (= lt!137243 (MissingZero!1625 i!1267)) (= lt!137243 (MissingVacant!1625 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13638 (_ BitVec 32)) SeekEntryResult!1625)

(assert (=> b!275417 (= lt!137243 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275418 () Bool)

(assert (=> b!275418 (= e!176150 (not true))))

(assert (=> b!275418 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13639 (store (arr!6468 a!3325) i!1267 k0!2581) (size!6821 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8631 0))(
  ( (Unit!8632) )
))
(declare-fun lt!137244 () Unit!8631)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13638 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8631)

(assert (=> b!275418 (= lt!137244 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!275419 () Bool)

(declare-fun res!139460 () Bool)

(assert (=> b!275419 (=> (not res!139460) (not e!176151))))

(assert (=> b!275419 (= res!139460 (and (= (size!6821 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6821 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6821 a!3325))))))

(declare-fun b!275420 () Bool)

(declare-fun res!139454 () Bool)

(assert (=> b!275420 (=> (not res!139454) (not e!176150))))

(assert (=> b!275420 (= res!139454 (not (validKeyInArray!0 (select (arr!6468 a!3325) startIndex!26))))))

(assert (= (and start!26552 res!139453) b!275419))

(assert (= (and b!275419 res!139460) b!275416))

(assert (= (and b!275416 res!139462) b!275413))

(assert (= (and b!275413 res!139458) b!275415))

(assert (= (and b!275415 res!139457) b!275417))

(assert (= (and b!275417 res!139459) b!275414))

(assert (= (and b!275414 res!139456) b!275412))

(assert (= (and b!275412 res!139455) b!275420))

(assert (= (and b!275420 res!139454) b!275411))

(assert (= (and b!275411 res!139461) b!275418))

(declare-fun m!290501 () Bool)

(assert (=> start!26552 m!290501))

(declare-fun m!290503 () Bool)

(assert (=> start!26552 m!290503))

(declare-fun m!290505 () Bool)

(assert (=> b!275413 m!290505))

(declare-fun m!290507 () Bool)

(assert (=> b!275417 m!290507))

(declare-fun m!290509 () Bool)

(assert (=> b!275414 m!290509))

(declare-fun m!290511 () Bool)

(assert (=> b!275420 m!290511))

(assert (=> b!275420 m!290511))

(declare-fun m!290513 () Bool)

(assert (=> b!275420 m!290513))

(declare-fun m!290515 () Bool)

(assert (=> b!275418 m!290515))

(declare-fun m!290517 () Bool)

(assert (=> b!275418 m!290517))

(declare-fun m!290519 () Bool)

(assert (=> b!275418 m!290519))

(declare-fun m!290521 () Bool)

(assert (=> b!275415 m!290521))

(declare-fun m!290523 () Bool)

(assert (=> b!275416 m!290523))

(check-sat (not b!275420) (not b!275417) (not b!275415) (not start!26552) (not b!275418) (not b!275414) (not b!275413) (not b!275416))
(check-sat)
