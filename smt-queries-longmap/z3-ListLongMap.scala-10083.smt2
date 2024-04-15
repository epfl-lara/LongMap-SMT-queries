; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118628 () Bool)

(assert start!118628)

(declare-fun b!1386889 () Bool)

(declare-fun res!928017 () Bool)

(declare-fun e!785599 () Bool)

(assert (=> b!1386889 (=> (not res!928017) (not e!785599))))

(declare-datatypes ((array!94857 0))(
  ( (array!94858 (arr!45805 (Array (_ BitVec 32) (_ BitVec 64))) (size!46357 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94857)

(declare-datatypes ((List!32411 0))(
  ( (Nil!32408) (Cons!32407 (h!33616 (_ BitVec 64)) (t!47097 List!32411)) )
))
(declare-fun arrayNoDuplicates!0 (array!94857 (_ BitVec 32) List!32411) Bool)

(assert (=> b!1386889 (= res!928017 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32408))))

(declare-fun b!1386890 () Bool)

(declare-fun res!928021 () Bool)

(assert (=> b!1386890 (=> (not res!928021) (not e!785599))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386890 (= res!928021 (validKeyInArray!0 (select (arr!45805 a!2938) i!1065)))))

(declare-fun b!1386891 () Bool)

(declare-fun res!928022 () Bool)

(assert (=> b!1386891 (=> (not res!928022) (not e!785599))))

(assert (=> b!1386891 (= res!928022 (and (not (= (select (arr!45805 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45805 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386892 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386892 (= e!785599 (and (bvslt startIndex!16 (bvsub (size!46357 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000) (bvsge (bvsub (size!46357 a!2938) (bvadd #b00000000000000000000000000000001 startIndex!16)) (bvsub (size!46357 a!2938) startIndex!16))))))

(declare-datatypes ((Unit!46206 0))(
  ( (Unit!46207) )
))
(declare-fun lt!609453 () Unit!46206)

(declare-fun e!785597 () Unit!46206)

(assert (=> b!1386892 (= lt!609453 e!785597)))

(declare-fun c!128879 () Bool)

(declare-fun e!785596 () Bool)

(assert (=> b!1386892 (= c!128879 e!785596)))

(declare-fun res!928016 () Bool)

(assert (=> b!1386892 (=> (not res!928016) (not e!785596))))

(assert (=> b!1386892 (= res!928016 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386893 () Bool)

(declare-fun Unit!46208 () Unit!46206)

(assert (=> b!1386893 (= e!785597 Unit!46208)))

(declare-fun b!1386895 () Bool)

(declare-fun res!928020 () Bool)

(assert (=> b!1386895 (=> (not res!928020) (not e!785599))))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1386895 (= res!928020 (and (= (size!46357 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46357 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46357 a!2938))))))

(declare-fun b!1386896 () Bool)

(declare-fun res!928019 () Bool)

(assert (=> b!1386896 (=> (not res!928019) (not e!785599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94857 (_ BitVec 32)) Bool)

(assert (=> b!1386896 (= res!928019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386897 () Bool)

(declare-fun lt!609455 () Unit!46206)

(assert (=> b!1386897 (= e!785597 lt!609455)))

(declare-fun lt!609454 () Unit!46206)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94857 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46206)

(assert (=> b!1386897 (= lt!609454 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10174 0))(
  ( (MissingZero!10174 (index!43067 (_ BitVec 32))) (Found!10174 (index!43068 (_ BitVec 32))) (Intermediate!10174 (undefined!10986 Bool) (index!43069 (_ BitVec 32)) (x!124676 (_ BitVec 32))) (Undefined!10174) (MissingVacant!10174 (index!43070 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94857 (_ BitVec 32)) SeekEntryResult!10174)

(assert (=> b!1386897 (= (seekEntryOrOpen!0 (select (arr!45805 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45805 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94858 (store (arr!45805 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46357 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94857 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46206)

(assert (=> b!1386897 (= lt!609455 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386897 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!928018 () Bool)

(assert (=> start!118628 (=> (not res!928018) (not e!785599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118628 (= res!928018 (validMask!0 mask!2987))))

(assert (=> start!118628 e!785599))

(assert (=> start!118628 true))

(declare-fun array_inv!35038 (array!94857) Bool)

(assert (=> start!118628 (array_inv!35038 a!2938)))

(declare-fun b!1386894 () Bool)

(assert (=> b!1386894 (= e!785596 (validKeyInArray!0 (select (arr!45805 a!2938) startIndex!16)))))

(assert (= (and start!118628 res!928018) b!1386895))

(assert (= (and b!1386895 res!928020) b!1386890))

(assert (= (and b!1386890 res!928021) b!1386889))

(assert (= (and b!1386889 res!928017) b!1386896))

(assert (= (and b!1386896 res!928019) b!1386891))

(assert (= (and b!1386891 res!928022) b!1386892))

(assert (= (and b!1386892 res!928016) b!1386894))

(assert (= (and b!1386892 c!128879) b!1386897))

(assert (= (and b!1386892 (not c!128879)) b!1386893))

(declare-fun m!1271877 () Bool)

(assert (=> b!1386897 m!1271877))

(declare-fun m!1271879 () Bool)

(assert (=> b!1386897 m!1271879))

(assert (=> b!1386897 m!1271879))

(declare-fun m!1271881 () Bool)

(assert (=> b!1386897 m!1271881))

(declare-fun m!1271883 () Bool)

(assert (=> b!1386897 m!1271883))

(declare-fun m!1271885 () Bool)

(assert (=> b!1386897 m!1271885))

(declare-fun m!1271887 () Bool)

(assert (=> b!1386897 m!1271887))

(declare-fun m!1271889 () Bool)

(assert (=> b!1386897 m!1271889))

(assert (=> b!1386897 m!1271887))

(declare-fun m!1271891 () Bool)

(assert (=> b!1386897 m!1271891))

(declare-fun m!1271893 () Bool)

(assert (=> b!1386890 m!1271893))

(assert (=> b!1386890 m!1271893))

(declare-fun m!1271895 () Bool)

(assert (=> b!1386890 m!1271895))

(assert (=> b!1386894 m!1271887))

(assert (=> b!1386894 m!1271887))

(declare-fun m!1271897 () Bool)

(assert (=> b!1386894 m!1271897))

(declare-fun m!1271899 () Bool)

(assert (=> start!118628 m!1271899))

(declare-fun m!1271901 () Bool)

(assert (=> start!118628 m!1271901))

(assert (=> b!1386891 m!1271893))

(declare-fun m!1271903 () Bool)

(assert (=> b!1386889 m!1271903))

(declare-fun m!1271905 () Bool)

(assert (=> b!1386896 m!1271905))

(check-sat (not b!1386896) (not b!1386894) (not start!118628) (not b!1386889) (not b!1386897) (not b!1386890))
(check-sat)
