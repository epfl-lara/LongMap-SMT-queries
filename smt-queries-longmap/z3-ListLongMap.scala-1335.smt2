; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26570 () Bool)

(assert start!26570)

(declare-fun b!275681 () Bool)

(declare-fun res!139727 () Bool)

(declare-fun e!176231 () Bool)

(assert (=> b!275681 (=> (not res!139727) (not e!176231))))

(declare-datatypes ((array!13656 0))(
  ( (array!13657 (arr!6477 (Array (_ BitVec 32) (_ BitVec 64))) (size!6830 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13656)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275681 (= res!139727 (not (validKeyInArray!0 (select (arr!6477 a!3325) startIndex!26))))))

(declare-fun res!139723 () Bool)

(declare-fun e!176232 () Bool)

(assert (=> start!26570 (=> (not res!139723) (not e!176232))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26570 (= res!139723 (validMask!0 mask!3868))))

(assert (=> start!26570 e!176232))

(declare-fun array_inv!4449 (array!13656) Bool)

(assert (=> start!26570 (array_inv!4449 a!3325)))

(assert (=> start!26570 true))

(declare-fun b!275682 () Bool)

(declare-fun res!139731 () Bool)

(assert (=> b!275682 (=> (not res!139731) (not e!176231))))

(assert (=> b!275682 (= res!139731 (and (bvslt startIndex!26 (bvsub (size!6830 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!275683 () Bool)

(declare-fun res!139732 () Bool)

(assert (=> b!275683 (=> (not res!139732) (not e!176232))))

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!275683 (= res!139732 (validKeyInArray!0 k0!2581))))

(declare-fun b!275684 () Bool)

(declare-fun res!139728 () Bool)

(assert (=> b!275684 (=> (not res!139728) (not e!176232))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275684 (= res!139728 (and (= (size!6830 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6830 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6830 a!3325))))))

(declare-fun b!275685 () Bool)

(declare-fun res!139729 () Bool)

(assert (=> b!275685 (=> (not res!139729) (not e!176231))))

(assert (=> b!275685 (= res!139729 (not (= startIndex!26 i!1267)))))

(declare-fun b!275686 () Bool)

(assert (=> b!275686 (= e!176232 e!176231)))

(declare-fun res!139724 () Bool)

(assert (=> b!275686 (=> (not res!139724) (not e!176231))))

(declare-datatypes ((SeekEntryResult!1634 0))(
  ( (MissingZero!1634 (index!8706 (_ BitVec 32))) (Found!1634 (index!8707 (_ BitVec 32))) (Intermediate!1634 (undefined!2446 Bool) (index!8708 (_ BitVec 32)) (x!26998 (_ BitVec 32))) (Undefined!1634) (MissingVacant!1634 (index!8709 (_ BitVec 32))) )
))
(declare-fun lt!137298 () SeekEntryResult!1634)

(assert (=> b!275686 (= res!139724 (or (= lt!137298 (MissingZero!1634 i!1267)) (= lt!137298 (MissingVacant!1634 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13656 (_ BitVec 32)) SeekEntryResult!1634)

(assert (=> b!275686 (= lt!137298 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275687 () Bool)

(declare-fun res!139726 () Bool)

(assert (=> b!275687 (=> (not res!139726) (not e!176232))))

(declare-datatypes ((List!4258 0))(
  ( (Nil!4255) (Cons!4254 (h!4921 (_ BitVec 64)) (t!9331 List!4258)) )
))
(declare-fun arrayNoDuplicates!0 (array!13656 (_ BitVec 32) List!4258) Bool)

(assert (=> b!275687 (= res!139726 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4255))))

(declare-fun b!275688 () Bool)

(declare-fun res!139725 () Bool)

(assert (=> b!275688 (=> (not res!139725) (not e!176231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13656 (_ BitVec 32)) Bool)

(assert (=> b!275688 (= res!139725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275689 () Bool)

(declare-fun res!139730 () Bool)

(assert (=> b!275689 (=> (not res!139730) (not e!176232))))

(declare-fun arrayContainsKey!0 (array!13656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275689 (= res!139730 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275690 () Bool)

(assert (=> b!275690 (= e!176231 (not (bvsle startIndex!26 (size!6830 a!3325))))))

(assert (=> b!275690 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13657 (store (arr!6477 a!3325) i!1267 k0!2581) (size!6830 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8649 0))(
  ( (Unit!8650) )
))
(declare-fun lt!137297 () Unit!8649)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13656 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8649)

(assert (=> b!275690 (= lt!137297 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (= (and start!26570 res!139723) b!275684))

(assert (= (and b!275684 res!139728) b!275683))

(assert (= (and b!275683 res!139732) b!275687))

(assert (= (and b!275687 res!139726) b!275689))

(assert (= (and b!275689 res!139730) b!275686))

(assert (= (and b!275686 res!139724) b!275688))

(assert (= (and b!275688 res!139725) b!275685))

(assert (= (and b!275685 res!139729) b!275681))

(assert (= (and b!275681 res!139727) b!275682))

(assert (= (and b!275682 res!139731) b!275690))

(declare-fun m!290717 () Bool)

(assert (=> b!275683 m!290717))

(declare-fun m!290719 () Bool)

(assert (=> b!275688 m!290719))

(declare-fun m!290721 () Bool)

(assert (=> b!275687 m!290721))

(declare-fun m!290723 () Bool)

(assert (=> b!275681 m!290723))

(assert (=> b!275681 m!290723))

(declare-fun m!290725 () Bool)

(assert (=> b!275681 m!290725))

(declare-fun m!290727 () Bool)

(assert (=> b!275686 m!290727))

(declare-fun m!290729 () Bool)

(assert (=> b!275689 m!290729))

(declare-fun m!290731 () Bool)

(assert (=> start!26570 m!290731))

(declare-fun m!290733 () Bool)

(assert (=> start!26570 m!290733))

(declare-fun m!290735 () Bool)

(assert (=> b!275690 m!290735))

(declare-fun m!290737 () Bool)

(assert (=> b!275690 m!290737))

(declare-fun m!290739 () Bool)

(assert (=> b!275690 m!290739))

(check-sat (not b!275688) (not b!275681) (not b!275686) (not b!275690) (not b!275689) (not b!275687) (not b!275683) (not start!26570))
(check-sat)
