; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27146 () Bool)

(assert start!27146)

(declare-fun b!280623 () Bool)

(declare-fun res!143751 () Bool)

(declare-fun e!178551 () Bool)

(assert (=> b!280623 (=> (not res!143751) (not e!178551))))

(declare-datatypes ((array!13953 0))(
  ( (array!13954 (arr!6618 (Array (_ BitVec 32) (_ BitVec 64))) (size!6971 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13953)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280623 (= res!143751 (validKeyInArray!0 (select (arr!6618 a!3325) startIndex!26)))))

(declare-fun res!143746 () Bool)

(declare-fun e!178550 () Bool)

(assert (=> start!27146 (=> (not res!143746) (not e!178550))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27146 (= res!143746 (validMask!0 mask!3868))))

(assert (=> start!27146 e!178550))

(declare-fun array_inv!4590 (array!13953) Bool)

(assert (=> start!27146 (array_inv!4590 a!3325)))

(assert (=> start!27146 true))

(declare-fun b!280624 () Bool)

(assert (=> b!280624 (= e!178550 e!178551)))

(declare-fun res!143744 () Bool)

(assert (=> b!280624 (=> (not res!143744) (not e!178551))))

(declare-datatypes ((SeekEntryResult!1775 0))(
  ( (MissingZero!1775 (index!9270 (_ BitVec 32))) (Found!1775 (index!9271 (_ BitVec 32))) (Intermediate!1775 (undefined!2587 Bool) (index!9272 (_ BitVec 32)) (x!27524 (_ BitVec 32))) (Undefined!1775) (MissingVacant!1775 (index!9273 (_ BitVec 32))) )
))
(declare-fun lt!138720 () SeekEntryResult!1775)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280624 (= res!143744 (or (= lt!138720 (MissingZero!1775 i!1267)) (= lt!138720 (MissingVacant!1775 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13953 (_ BitVec 32)) SeekEntryResult!1775)

(assert (=> b!280624 (= lt!138720 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280625 () Bool)

(declare-fun res!143745 () Bool)

(assert (=> b!280625 (=> (not res!143745) (not e!178550))))

(declare-datatypes ((List!4399 0))(
  ( (Nil!4396) (Cons!4395 (h!5065 (_ BitVec 64)) (t!9472 List!4399)) )
))
(declare-fun arrayNoDuplicates!0 (array!13953 (_ BitVec 32) List!4399) Bool)

(assert (=> b!280625 (= res!143745 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4396))))

(declare-fun b!280626 () Bool)

(assert (=> b!280626 (= e!178551 (not true))))

(assert (=> b!280626 (arrayNoDuplicates!0 (array!13954 (store (arr!6618 a!3325) i!1267 k0!2581) (size!6971 a!3325)) #b00000000000000000000000000000000 Nil!4396)))

(declare-datatypes ((Unit!8796 0))(
  ( (Unit!8797) )
))
(declare-fun lt!138719 () Unit!8796)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13953 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4399) Unit!8796)

(assert (=> b!280626 (= lt!138719 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4396))))

(declare-fun b!280627 () Bool)

(declare-fun res!143750 () Bool)

(assert (=> b!280627 (=> (not res!143750) (not e!178550))))

(declare-fun arrayContainsKey!0 (array!13953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280627 (= res!143750 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280628 () Bool)

(declare-fun res!143748 () Bool)

(assert (=> b!280628 (=> (not res!143748) (not e!178550))))

(assert (=> b!280628 (= res!143748 (and (= (size!6971 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6971 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6971 a!3325))))))

(declare-fun b!280629 () Bool)

(declare-fun res!143747 () Bool)

(assert (=> b!280629 (=> (not res!143747) (not e!178551))))

(assert (=> b!280629 (= res!143747 (not (= startIndex!26 i!1267)))))

(declare-fun b!280630 () Bool)

(declare-fun res!143752 () Bool)

(assert (=> b!280630 (=> (not res!143752) (not e!178551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13953 (_ BitVec 32)) Bool)

(assert (=> b!280630 (= res!143752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280631 () Bool)

(declare-fun res!143749 () Bool)

(assert (=> b!280631 (=> (not res!143749) (not e!178550))))

(assert (=> b!280631 (= res!143749 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27146 res!143746) b!280628))

(assert (= (and b!280628 res!143748) b!280631))

(assert (= (and b!280631 res!143749) b!280625))

(assert (= (and b!280625 res!143745) b!280627))

(assert (= (and b!280627 res!143750) b!280624))

(assert (= (and b!280624 res!143744) b!280630))

(assert (= (and b!280630 res!143752) b!280629))

(assert (= (and b!280629 res!143747) b!280623))

(assert (= (and b!280623 res!143751) b!280626))

(declare-fun m!294575 () Bool)

(assert (=> b!280630 m!294575))

(declare-fun m!294577 () Bool)

(assert (=> b!280626 m!294577))

(declare-fun m!294579 () Bool)

(assert (=> b!280626 m!294579))

(declare-fun m!294581 () Bool)

(assert (=> b!280626 m!294581))

(declare-fun m!294583 () Bool)

(assert (=> start!27146 m!294583))

(declare-fun m!294585 () Bool)

(assert (=> start!27146 m!294585))

(declare-fun m!294587 () Bool)

(assert (=> b!280624 m!294587))

(declare-fun m!294589 () Bool)

(assert (=> b!280631 m!294589))

(declare-fun m!294591 () Bool)

(assert (=> b!280623 m!294591))

(assert (=> b!280623 m!294591))

(declare-fun m!294593 () Bool)

(assert (=> b!280623 m!294593))

(declare-fun m!294595 () Bool)

(assert (=> b!280625 m!294595))

(declare-fun m!294597 () Bool)

(assert (=> b!280627 m!294597))

(check-sat (not b!280631) (not b!280623) (not b!280624) (not b!280630) (not start!27146) (not b!280625) (not b!280627) (not b!280626))
(check-sat)
