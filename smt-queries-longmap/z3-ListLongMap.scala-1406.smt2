; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27290 () Bool)

(assert start!27290)

(declare-fun b!282741 () Bool)

(declare-fun res!145812 () Bool)

(declare-fun e!179448 () Bool)

(assert (=> b!282741 (=> (not res!145812) (not e!179448))))

(declare-datatypes ((array!14108 0))(
  ( (array!14109 (arr!6696 (Array (_ BitVec 32) (_ BitVec 64))) (size!7048 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14108)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14108 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282741 (= res!145812 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282742 () Bool)

(declare-fun res!145814 () Bool)

(declare-fun e!179450 () Bool)

(assert (=> b!282742 (=> (not res!145814) (not e!179450))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282742 (= res!145814 (validKeyInArray!0 (select (arr!6696 a!3325) startIndex!26)))))

(declare-fun b!282743 () Bool)

(declare-fun res!145817 () Bool)

(assert (=> b!282743 (=> (not res!145817) (not e!179448))))

(declare-datatypes ((List!4504 0))(
  ( (Nil!4501) (Cons!4500 (h!5170 (_ BitVec 64)) (t!9586 List!4504)) )
))
(declare-fun arrayNoDuplicates!0 (array!14108 (_ BitVec 32) List!4504) Bool)

(assert (=> b!282743 (= res!145817 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4501))))

(declare-fun b!282744 () Bool)

(assert (=> b!282744 (= e!179450 (not true))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14108 (_ BitVec 32)) Bool)

(assert (=> b!282744 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8992 0))(
  ( (Unit!8993) )
))
(declare-fun lt!139717 () Unit!8992)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14108 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8992)

(assert (=> b!282744 (= lt!139717 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lt!139715 () array!14108)

(declare-datatypes ((SeekEntryResult!1854 0))(
  ( (MissingZero!1854 (index!9586 (_ BitVec 32))) (Found!1854 (index!9587 (_ BitVec 32))) (Intermediate!1854 (undefined!2666 Bool) (index!9588 (_ BitVec 32)) (x!27796 (_ BitVec 32))) (Undefined!1854) (MissingVacant!1854 (index!9589 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14108 (_ BitVec 32)) SeekEntryResult!1854)

(assert (=> b!282744 (= (seekEntryOrOpen!0 (select (arr!6696 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6696 a!3325) i!1267 k0!2581) startIndex!26) lt!139715 mask!3868))))

(declare-fun lt!139716 () Unit!8992)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14108 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8992)

(assert (=> b!282744 (= lt!139716 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282744 (arrayNoDuplicates!0 lt!139715 #b00000000000000000000000000000000 Nil!4501)))

(declare-fun lt!139713 () Unit!8992)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14108 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4504) Unit!8992)

(assert (=> b!282744 (= lt!139713 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4501))))

(declare-fun res!145815 () Bool)

(assert (=> start!27290 (=> (not res!145815) (not e!179448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27290 (= res!145815 (validMask!0 mask!3868))))

(assert (=> start!27290 e!179448))

(declare-fun array_inv!4659 (array!14108) Bool)

(assert (=> start!27290 (array_inv!4659 a!3325)))

(assert (=> start!27290 true))

(declare-fun b!282745 () Bool)

(declare-fun e!179447 () Bool)

(assert (=> b!282745 (= e!179448 e!179447)))

(declare-fun res!145818 () Bool)

(assert (=> b!282745 (=> (not res!145818) (not e!179447))))

(declare-fun lt!139714 () SeekEntryResult!1854)

(assert (=> b!282745 (= res!145818 (or (= lt!139714 (MissingZero!1854 i!1267)) (= lt!139714 (MissingVacant!1854 i!1267))))))

(assert (=> b!282745 (= lt!139714 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282746 () Bool)

(declare-fun res!145813 () Bool)

(assert (=> b!282746 (=> (not res!145813) (not e!179447))))

(assert (=> b!282746 (= res!145813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282747 () Bool)

(declare-fun res!145816 () Bool)

(assert (=> b!282747 (=> (not res!145816) (not e!179448))))

(assert (=> b!282747 (= res!145816 (validKeyInArray!0 k0!2581))))

(declare-fun b!282748 () Bool)

(declare-fun res!145811 () Bool)

(assert (=> b!282748 (=> (not res!145811) (not e!179448))))

(assert (=> b!282748 (= res!145811 (and (= (size!7048 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7048 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7048 a!3325))))))

(declare-fun b!282749 () Bool)

(assert (=> b!282749 (= e!179447 e!179450)))

(declare-fun res!145810 () Bool)

(assert (=> b!282749 (=> (not res!145810) (not e!179450))))

(assert (=> b!282749 (= res!145810 (not (= startIndex!26 i!1267)))))

(assert (=> b!282749 (= lt!139715 (array!14109 (store (arr!6696 a!3325) i!1267 k0!2581) (size!7048 a!3325)))))

(assert (= (and start!27290 res!145815) b!282748))

(assert (= (and b!282748 res!145811) b!282747))

(assert (= (and b!282747 res!145816) b!282743))

(assert (= (and b!282743 res!145817) b!282741))

(assert (= (and b!282741 res!145812) b!282745))

(assert (= (and b!282745 res!145818) b!282746))

(assert (= (and b!282746 res!145813) b!282749))

(assert (= (and b!282749 res!145810) b!282742))

(assert (= (and b!282742 res!145814) b!282744))

(declare-fun m!297411 () Bool)

(assert (=> b!282749 m!297411))

(declare-fun m!297413 () Bool)

(assert (=> b!282741 m!297413))

(declare-fun m!297415 () Bool)

(assert (=> b!282742 m!297415))

(assert (=> b!282742 m!297415))

(declare-fun m!297417 () Bool)

(assert (=> b!282742 m!297417))

(declare-fun m!297419 () Bool)

(assert (=> start!27290 m!297419))

(declare-fun m!297421 () Bool)

(assert (=> start!27290 m!297421))

(declare-fun m!297423 () Bool)

(assert (=> b!282747 m!297423))

(declare-fun m!297425 () Bool)

(assert (=> b!282745 m!297425))

(declare-fun m!297427 () Bool)

(assert (=> b!282746 m!297427))

(declare-fun m!297429 () Bool)

(assert (=> b!282744 m!297429))

(declare-fun m!297431 () Bool)

(assert (=> b!282744 m!297431))

(declare-fun m!297433 () Bool)

(assert (=> b!282744 m!297433))

(assert (=> b!282744 m!297431))

(assert (=> b!282744 m!297411))

(declare-fun m!297435 () Bool)

(assert (=> b!282744 m!297435))

(assert (=> b!282744 m!297415))

(declare-fun m!297437 () Bool)

(assert (=> b!282744 m!297437))

(assert (=> b!282744 m!297415))

(declare-fun m!297439 () Bool)

(assert (=> b!282744 m!297439))

(declare-fun m!297441 () Bool)

(assert (=> b!282744 m!297441))

(declare-fun m!297443 () Bool)

(assert (=> b!282744 m!297443))

(declare-fun m!297445 () Bool)

(assert (=> b!282743 m!297445))

(check-sat (not start!27290) (not b!282743) (not b!282744) (not b!282745) (not b!282741) (not b!282742) (not b!282746) (not b!282747))
(check-sat)
