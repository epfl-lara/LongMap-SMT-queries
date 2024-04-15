; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26564 () Bool)

(assert start!26564)

(declare-fun b!275591 () Bool)

(declare-fun res!139635 () Bool)

(declare-fun e!176204 () Bool)

(assert (=> b!275591 (=> (not res!139635) (not e!176204))))

(declare-datatypes ((array!13650 0))(
  ( (array!13651 (arr!6474 (Array (_ BitVec 32) (_ BitVec 64))) (size!6827 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13650)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275591 (= res!139635 (not (validKeyInArray!0 (select (arr!6474 a!3325) startIndex!26))))))

(declare-fun b!275592 () Bool)

(declare-fun res!139638 () Bool)

(declare-fun e!176205 () Bool)

(assert (=> b!275592 (=> (not res!139638) (not e!176205))))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!275592 (= res!139638 (validKeyInArray!0 k0!2581))))

(declare-fun b!275593 () Bool)

(assert (=> b!275593 (= e!176204 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13650 (_ BitVec 32)) Bool)

(assert (=> b!275593 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13651 (store (arr!6474 a!3325) i!1267 k0!2581) (size!6827 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8643 0))(
  ( (Unit!8644) )
))
(declare-fun lt!137279 () Unit!8643)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13650 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8643)

(assert (=> b!275593 (= lt!137279 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!275594 () Bool)

(declare-fun res!139640 () Bool)

(assert (=> b!275594 (=> (not res!139640) (not e!176204))))

(assert (=> b!275594 (= res!139640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275595 () Bool)

(declare-fun res!139639 () Bool)

(assert (=> b!275595 (=> (not res!139639) (not e!176205))))

(declare-datatypes ((List!4255 0))(
  ( (Nil!4252) (Cons!4251 (h!4918 (_ BitVec 64)) (t!9328 List!4255)) )
))
(declare-fun arrayNoDuplicates!0 (array!13650 (_ BitVec 32) List!4255) Bool)

(assert (=> b!275595 (= res!139639 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4252))))

(declare-fun b!275596 () Bool)

(assert (=> b!275596 (= e!176205 e!176204)))

(declare-fun res!139642 () Bool)

(assert (=> b!275596 (=> (not res!139642) (not e!176204))))

(declare-datatypes ((SeekEntryResult!1631 0))(
  ( (MissingZero!1631 (index!8694 (_ BitVec 32))) (Found!1631 (index!8695 (_ BitVec 32))) (Intermediate!1631 (undefined!2443 Bool) (index!8696 (_ BitVec 32)) (x!26987 (_ BitVec 32))) (Undefined!1631) (MissingVacant!1631 (index!8697 (_ BitVec 32))) )
))
(declare-fun lt!137280 () SeekEntryResult!1631)

(assert (=> b!275596 (= res!139642 (or (= lt!137280 (MissingZero!1631 i!1267)) (= lt!137280 (MissingVacant!1631 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13650 (_ BitVec 32)) SeekEntryResult!1631)

(assert (=> b!275596 (= lt!137280 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275597 () Bool)

(declare-fun res!139634 () Bool)

(assert (=> b!275597 (=> (not res!139634) (not e!176205))))

(declare-fun arrayContainsKey!0 (array!13650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275597 (= res!139634 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!139641 () Bool)

(assert (=> start!26564 (=> (not res!139641) (not e!176205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26564 (= res!139641 (validMask!0 mask!3868))))

(assert (=> start!26564 e!176205))

(declare-fun array_inv!4446 (array!13650) Bool)

(assert (=> start!26564 (array_inv!4446 a!3325)))

(assert (=> start!26564 true))

(declare-fun b!275598 () Bool)

(declare-fun res!139636 () Bool)

(assert (=> b!275598 (=> (not res!139636) (not e!176204))))

(assert (=> b!275598 (= res!139636 (and (bvslt startIndex!26 (bvsub (size!6827 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!275599 () Bool)

(declare-fun res!139637 () Bool)

(assert (=> b!275599 (=> (not res!139637) (not e!176204))))

(assert (=> b!275599 (= res!139637 (not (= startIndex!26 i!1267)))))

(declare-fun b!275600 () Bool)

(declare-fun res!139633 () Bool)

(assert (=> b!275600 (=> (not res!139633) (not e!176205))))

(assert (=> b!275600 (= res!139633 (and (= (size!6827 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6827 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6827 a!3325))))))

(assert (= (and start!26564 res!139641) b!275600))

(assert (= (and b!275600 res!139633) b!275592))

(assert (= (and b!275592 res!139638) b!275595))

(assert (= (and b!275595 res!139639) b!275597))

(assert (= (and b!275597 res!139634) b!275596))

(assert (= (and b!275596 res!139642) b!275594))

(assert (= (and b!275594 res!139640) b!275599))

(assert (= (and b!275599 res!139637) b!275591))

(assert (= (and b!275591 res!139635) b!275598))

(assert (= (and b!275598 res!139636) b!275593))

(declare-fun m!290645 () Bool)

(assert (=> b!275595 m!290645))

(declare-fun m!290647 () Bool)

(assert (=> b!275593 m!290647))

(declare-fun m!290649 () Bool)

(assert (=> b!275593 m!290649))

(declare-fun m!290651 () Bool)

(assert (=> b!275593 m!290651))

(declare-fun m!290653 () Bool)

(assert (=> b!275592 m!290653))

(declare-fun m!290655 () Bool)

(assert (=> start!26564 m!290655))

(declare-fun m!290657 () Bool)

(assert (=> start!26564 m!290657))

(declare-fun m!290659 () Bool)

(assert (=> b!275597 m!290659))

(declare-fun m!290661 () Bool)

(assert (=> b!275596 m!290661))

(declare-fun m!290663 () Bool)

(assert (=> b!275594 m!290663))

(declare-fun m!290665 () Bool)

(assert (=> b!275591 m!290665))

(assert (=> b!275591 m!290665))

(declare-fun m!290667 () Bool)

(assert (=> b!275591 m!290667))

(check-sat (not b!275591) (not b!275597) (not b!275595) (not b!275596) (not b!275594) (not b!275593) (not b!275592) (not start!26564))
(check-sat)
