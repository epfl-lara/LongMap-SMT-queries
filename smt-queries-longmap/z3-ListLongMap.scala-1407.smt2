; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27294 () Bool)

(assert start!27294)

(declare-fun b!282842 () Bool)

(declare-fun e!179495 () Bool)

(declare-fun e!179497 () Bool)

(assert (=> b!282842 (= e!179495 e!179497)))

(declare-fun res!145891 () Bool)

(assert (=> b!282842 (=> (not res!145891) (not e!179497))))

(declare-datatypes ((SeekEntryResult!1820 0))(
  ( (MissingZero!1820 (index!9450 (_ BitVec 32))) (Found!1820 (index!9451 (_ BitVec 32))) (Intermediate!1820 (undefined!2632 Bool) (index!9452 (_ BitVec 32)) (x!27770 (_ BitVec 32))) (Undefined!1820) (MissingVacant!1820 (index!9453 (_ BitVec 32))) )
))
(declare-fun lt!139805 () SeekEntryResult!1820)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282842 (= res!145891 (or (= lt!139805 (MissingZero!1820 i!1267)) (= lt!139805 (MissingVacant!1820 i!1267))))))

(declare-datatypes ((array!14111 0))(
  ( (array!14112 (arr!6697 (Array (_ BitVec 32) (_ BitVec 64))) (size!7049 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14111)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14111 (_ BitVec 32)) SeekEntryResult!1820)

(assert (=> b!282842 (= lt!139805 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282843 () Bool)

(declare-fun res!145885 () Bool)

(assert (=> b!282843 (=> (not res!145885) (not e!179495))))

(declare-datatypes ((List!4418 0))(
  ( (Nil!4415) (Cons!4414 (h!5084 (_ BitVec 64)) (t!9492 List!4418)) )
))
(declare-fun arrayNoDuplicates!0 (array!14111 (_ BitVec 32) List!4418) Bool)

(assert (=> b!282843 (= res!145885 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4415))))

(declare-fun b!282844 () Bool)

(declare-fun res!145886 () Bool)

(assert (=> b!282844 (=> (not res!145886) (not e!179495))))

(declare-fun arrayContainsKey!0 (array!14111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282844 (= res!145886 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282845 () Bool)

(declare-fun e!179496 () Bool)

(assert (=> b!282845 (= e!179496 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14111 (_ BitVec 32)) Bool)

(assert (=> b!282845 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8970 0))(
  ( (Unit!8971) )
))
(declare-fun lt!139802 () Unit!8970)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14111 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8970)

(assert (=> b!282845 (= lt!139802 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139804 () array!14111)

(assert (=> b!282845 (= (seekEntryOrOpen!0 (select (arr!6697 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6697 a!3325) i!1267 k0!2581) startIndex!26) lt!139804 mask!3868))))

(declare-fun lt!139803 () Unit!8970)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14111 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8970)

(assert (=> b!282845 (= lt!139803 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282845 (arrayNoDuplicates!0 lt!139804 #b00000000000000000000000000000000 Nil!4415)))

(declare-fun lt!139806 () Unit!8970)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14111 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4418) Unit!8970)

(assert (=> b!282845 (= lt!139806 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4415))))

(declare-fun b!282846 () Bool)

(declare-fun res!145892 () Bool)

(assert (=> b!282846 (=> (not res!145892) (not e!179495))))

(assert (=> b!282846 (= res!145892 (and (= (size!7049 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7049 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7049 a!3325))))))

(declare-fun b!282847 () Bool)

(assert (=> b!282847 (= e!179497 e!179496)))

(declare-fun res!145893 () Bool)

(assert (=> b!282847 (=> (not res!145893) (not e!179496))))

(assert (=> b!282847 (= res!145893 (not (= startIndex!26 i!1267)))))

(assert (=> b!282847 (= lt!139804 (array!14112 (store (arr!6697 a!3325) i!1267 k0!2581) (size!7049 a!3325)))))

(declare-fun b!282848 () Bool)

(declare-fun res!145888 () Bool)

(assert (=> b!282848 (=> (not res!145888) (not e!179496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282848 (= res!145888 (validKeyInArray!0 (select (arr!6697 a!3325) startIndex!26)))))

(declare-fun res!145887 () Bool)

(assert (=> start!27294 (=> (not res!145887) (not e!179495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27294 (= res!145887 (validMask!0 mask!3868))))

(assert (=> start!27294 e!179495))

(declare-fun array_inv!4647 (array!14111) Bool)

(assert (=> start!27294 (array_inv!4647 a!3325)))

(assert (=> start!27294 true))

(declare-fun b!282849 () Bool)

(declare-fun res!145889 () Bool)

(assert (=> b!282849 (=> (not res!145889) (not e!179495))))

(assert (=> b!282849 (= res!145889 (validKeyInArray!0 k0!2581))))

(declare-fun b!282850 () Bool)

(declare-fun res!145890 () Bool)

(assert (=> b!282850 (=> (not res!145890) (not e!179497))))

(assert (=> b!282850 (= res!145890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27294 res!145887) b!282846))

(assert (= (and b!282846 res!145892) b!282849))

(assert (= (and b!282849 res!145889) b!282843))

(assert (= (and b!282843 res!145885) b!282844))

(assert (= (and b!282844 res!145886) b!282842))

(assert (= (and b!282842 res!145891) b!282850))

(assert (= (and b!282850 res!145890) b!282847))

(assert (= (and b!282847 res!145893) b!282848))

(assert (= (and b!282848 res!145888) b!282845))

(declare-fun m!297689 () Bool)

(assert (=> b!282844 m!297689))

(declare-fun m!297691 () Bool)

(assert (=> start!27294 m!297691))

(declare-fun m!297693 () Bool)

(assert (=> start!27294 m!297693))

(declare-fun m!297695 () Bool)

(assert (=> b!282845 m!297695))

(declare-fun m!297697 () Bool)

(assert (=> b!282845 m!297697))

(declare-fun m!297699 () Bool)

(assert (=> b!282845 m!297699))

(declare-fun m!297701 () Bool)

(assert (=> b!282845 m!297701))

(assert (=> b!282845 m!297699))

(declare-fun m!297703 () Bool)

(assert (=> b!282845 m!297703))

(declare-fun m!297705 () Bool)

(assert (=> b!282845 m!297705))

(declare-fun m!297707 () Bool)

(assert (=> b!282845 m!297707))

(declare-fun m!297709 () Bool)

(assert (=> b!282845 m!297709))

(declare-fun m!297711 () Bool)

(assert (=> b!282845 m!297711))

(assert (=> b!282845 m!297707))

(declare-fun m!297713 () Bool)

(assert (=> b!282845 m!297713))

(declare-fun m!297715 () Bool)

(assert (=> b!282842 m!297715))

(declare-fun m!297717 () Bool)

(assert (=> b!282843 m!297717))

(assert (=> b!282848 m!297707))

(assert (=> b!282848 m!297707))

(declare-fun m!297719 () Bool)

(assert (=> b!282848 m!297719))

(assert (=> b!282847 m!297703))

(declare-fun m!297721 () Bool)

(assert (=> b!282849 m!297721))

(declare-fun m!297723 () Bool)

(assert (=> b!282850 m!297723))

(check-sat (not b!282850) (not b!282849) (not b!282845) (not b!282848) (not start!27294) (not b!282842) (not b!282844) (not b!282843))
(check-sat)
