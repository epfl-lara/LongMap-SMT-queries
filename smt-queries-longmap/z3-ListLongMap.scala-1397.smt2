; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27236 () Bool)

(assert start!27236)

(declare-fun b!281838 () Bool)

(declare-fun e!179011 () Bool)

(assert (=> b!281838 (= e!179011 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!14043 0))(
  ( (array!14044 (arr!6663 (Array (_ BitVec 32) (_ BitVec 64))) (size!7016 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14043)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14043 (_ BitVec 32)) Bool)

(assert (=> b!281838 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8886 0))(
  ( (Unit!8887) )
))
(declare-fun lt!139112 () Unit!8886)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14043 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8886)

(assert (=> b!281838 (= lt!139112 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!139114 () array!14043)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1820 0))(
  ( (MissingZero!1820 (index!9450 (_ BitVec 32))) (Found!1820 (index!9451 (_ BitVec 32))) (Intermediate!1820 (undefined!2632 Bool) (index!9452 (_ BitVec 32)) (x!27689 (_ BitVec 32))) (Undefined!1820) (MissingVacant!1820 (index!9453 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14043 (_ BitVec 32)) SeekEntryResult!1820)

(assert (=> b!281838 (= (seekEntryOrOpen!0 (select (arr!6663 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6663 a!3325) i!1267 k0!2581) startIndex!26) lt!139114 mask!3868))))

(declare-fun lt!139116 () Unit!8886)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14043 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8886)

(assert (=> b!281838 (= lt!139116 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4444 0))(
  ( (Nil!4441) (Cons!4440 (h!5110 (_ BitVec 64)) (t!9517 List!4444)) )
))
(declare-fun arrayNoDuplicates!0 (array!14043 (_ BitVec 32) List!4444) Bool)

(assert (=> b!281838 (arrayNoDuplicates!0 lt!139114 #b00000000000000000000000000000000 Nil!4441)))

(declare-fun lt!139113 () Unit!8886)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14043 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4444) Unit!8886)

(assert (=> b!281838 (= lt!139113 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4441))))

(declare-fun b!281839 () Bool)

(declare-fun res!144960 () Bool)

(declare-fun e!179013 () Bool)

(assert (=> b!281839 (=> (not res!144960) (not e!179013))))

(declare-fun arrayContainsKey!0 (array!14043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281839 (= res!144960 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281840 () Bool)

(declare-fun e!179010 () Bool)

(assert (=> b!281840 (= e!179010 e!179011)))

(declare-fun res!144962 () Bool)

(assert (=> b!281840 (=> (not res!144962) (not e!179011))))

(assert (=> b!281840 (= res!144962 (not (= startIndex!26 i!1267)))))

(assert (=> b!281840 (= lt!139114 (array!14044 (store (arr!6663 a!3325) i!1267 k0!2581) (size!7016 a!3325)))))

(declare-fun b!281841 () Bool)

(declare-fun res!144963 () Bool)

(assert (=> b!281841 (=> (not res!144963) (not e!179013))))

(assert (=> b!281841 (= res!144963 (and (= (size!7016 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7016 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7016 a!3325))))))

(declare-fun res!144965 () Bool)

(assert (=> start!27236 (=> (not res!144965) (not e!179013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27236 (= res!144965 (validMask!0 mask!3868))))

(assert (=> start!27236 e!179013))

(declare-fun array_inv!4635 (array!14043) Bool)

(assert (=> start!27236 (array_inv!4635 a!3325)))

(assert (=> start!27236 true))

(declare-fun b!281842 () Bool)

(declare-fun res!144964 () Bool)

(assert (=> b!281842 (=> (not res!144964) (not e!179013))))

(assert (=> b!281842 (= res!144964 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4441))))

(declare-fun b!281843 () Bool)

(assert (=> b!281843 (= e!179013 e!179010)))

(declare-fun res!144961 () Bool)

(assert (=> b!281843 (=> (not res!144961) (not e!179010))))

(declare-fun lt!139115 () SeekEntryResult!1820)

(assert (=> b!281843 (= res!144961 (or (= lt!139115 (MissingZero!1820 i!1267)) (= lt!139115 (MissingVacant!1820 i!1267))))))

(assert (=> b!281843 (= lt!139115 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281844 () Bool)

(declare-fun res!144967 () Bool)

(assert (=> b!281844 (=> (not res!144967) (not e!179010))))

(assert (=> b!281844 (= res!144967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281845 () Bool)

(declare-fun res!144959 () Bool)

(assert (=> b!281845 (=> (not res!144959) (not e!179011))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281845 (= res!144959 (validKeyInArray!0 (select (arr!6663 a!3325) startIndex!26)))))

(declare-fun b!281846 () Bool)

(declare-fun res!144966 () Bool)

(assert (=> b!281846 (=> (not res!144966) (not e!179013))))

(assert (=> b!281846 (= res!144966 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27236 res!144965) b!281841))

(assert (= (and b!281841 res!144963) b!281846))

(assert (= (and b!281846 res!144966) b!281842))

(assert (= (and b!281842 res!144964) b!281839))

(assert (= (and b!281839 res!144960) b!281843))

(assert (= (and b!281843 res!144961) b!281844))

(assert (= (and b!281844 res!144967) b!281840))

(assert (= (and b!281840 res!144962) b!281845))

(assert (= (and b!281845 res!144959) b!281838))

(declare-fun m!295811 () Bool)

(assert (=> b!281842 m!295811))

(declare-fun m!295813 () Bool)

(assert (=> b!281844 m!295813))

(declare-fun m!295815 () Bool)

(assert (=> b!281840 m!295815))

(declare-fun m!295817 () Bool)

(assert (=> b!281839 m!295817))

(declare-fun m!295819 () Bool)

(assert (=> b!281838 m!295819))

(declare-fun m!295821 () Bool)

(assert (=> b!281838 m!295821))

(assert (=> b!281838 m!295815))

(declare-fun m!295823 () Bool)

(assert (=> b!281838 m!295823))

(declare-fun m!295825 () Bool)

(assert (=> b!281838 m!295825))

(declare-fun m!295827 () Bool)

(assert (=> b!281838 m!295827))

(assert (=> b!281838 m!295821))

(declare-fun m!295829 () Bool)

(assert (=> b!281838 m!295829))

(assert (=> b!281838 m!295825))

(declare-fun m!295831 () Bool)

(assert (=> b!281838 m!295831))

(declare-fun m!295833 () Bool)

(assert (=> b!281838 m!295833))

(declare-fun m!295835 () Bool)

(assert (=> b!281838 m!295835))

(declare-fun m!295837 () Bool)

(assert (=> b!281843 m!295837))

(assert (=> b!281845 m!295825))

(assert (=> b!281845 m!295825))

(declare-fun m!295839 () Bool)

(assert (=> b!281845 m!295839))

(declare-fun m!295841 () Bool)

(assert (=> start!27236 m!295841))

(declare-fun m!295843 () Bool)

(assert (=> start!27236 m!295843))

(declare-fun m!295845 () Bool)

(assert (=> b!281846 m!295845))

(check-sat (not b!281844) (not start!27236) (not b!281843) (not b!281838) (not b!281839) (not b!281846) (not b!281845) (not b!281842))
(check-sat)
