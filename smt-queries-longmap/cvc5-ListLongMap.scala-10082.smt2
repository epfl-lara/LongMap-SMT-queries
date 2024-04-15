; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118626 () Bool)

(assert start!118626)

(declare-fun b!1386862 () Bool)

(declare-fun e!785584 () Bool)

(declare-datatypes ((array!94855 0))(
  ( (array!94856 (arr!45804 (Array (_ BitVec 32) (_ BitVec 64))) (size!46356 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94855)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386862 (= e!785584 (validKeyInArray!0 (select (arr!45804 a!2938) startIndex!16)))))

(declare-fun b!1386863 () Bool)

(declare-fun res!928001 () Bool)

(declare-fun e!785585 () Bool)

(assert (=> b!1386863 (=> (not res!928001) (not e!785585))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94855 (_ BitVec 32)) Bool)

(assert (=> b!1386863 (= res!928001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386864 () Bool)

(declare-fun res!928000 () Bool)

(assert (=> b!1386864 (=> (not res!928000) (not e!785585))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1386864 (= res!928000 (and (not (= (select (arr!45804 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45804 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386865 () Bool)

(declare-fun res!927997 () Bool)

(assert (=> b!1386865 (=> (not res!927997) (not e!785585))))

(declare-datatypes ((List!32410 0))(
  ( (Nil!32407) (Cons!32406 (h!33615 (_ BitVec 64)) (t!47096 List!32410)) )
))
(declare-fun arrayNoDuplicates!0 (array!94855 (_ BitVec 32) List!32410) Bool)

(assert (=> b!1386865 (= res!927997 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32407))))

(declare-fun b!1386867 () Bool)

(declare-datatypes ((Unit!46203 0))(
  ( (Unit!46204) )
))
(declare-fun e!785586 () Unit!46203)

(declare-fun Unit!46205 () Unit!46203)

(assert (=> b!1386867 (= e!785586 Unit!46205)))

(declare-fun b!1386868 () Bool)

(assert (=> b!1386868 (= e!785585 false)))

(declare-fun lt!609444 () Unit!46203)

(assert (=> b!1386868 (= lt!609444 e!785586)))

(declare-fun c!128876 () Bool)

(assert (=> b!1386868 (= c!128876 e!785584)))

(declare-fun res!927998 () Bool)

(assert (=> b!1386868 (=> (not res!927998) (not e!785584))))

(assert (=> b!1386868 (= res!927998 (not (= startIndex!16 i!1065)))))

(declare-fun res!927999 () Bool)

(assert (=> start!118626 (=> (not res!927999) (not e!785585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118626 (= res!927999 (validMask!0 mask!2987))))

(assert (=> start!118626 e!785585))

(assert (=> start!118626 true))

(declare-fun array_inv!35037 (array!94855) Bool)

(assert (=> start!118626 (array_inv!35037 a!2938)))

(declare-fun b!1386866 () Bool)

(declare-fun res!927996 () Bool)

(assert (=> b!1386866 (=> (not res!927996) (not e!785585))))

(assert (=> b!1386866 (= res!927996 (and (= (size!46356 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46356 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46356 a!2938))))))

(declare-fun b!1386869 () Bool)

(declare-fun lt!609446 () Unit!46203)

(assert (=> b!1386869 (= e!785586 lt!609446)))

(declare-fun lt!609445 () Unit!46203)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46203)

(assert (=> b!1386869 (= lt!609445 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10173 0))(
  ( (MissingZero!10173 (index!43063 (_ BitVec 32))) (Found!10173 (index!43064 (_ BitVec 32))) (Intermediate!10173 (undefined!10985 Bool) (index!43065 (_ BitVec 32)) (x!124667 (_ BitVec 32))) (Undefined!10173) (MissingVacant!10173 (index!43066 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94855 (_ BitVec 32)) SeekEntryResult!10173)

(assert (=> b!1386869 (= (seekEntryOrOpen!0 (select (arr!45804 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45804 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94856 (store (arr!45804 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46356 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46203)

(assert (=> b!1386869 (= lt!609446 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386869 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386870 () Bool)

(declare-fun res!927995 () Bool)

(assert (=> b!1386870 (=> (not res!927995) (not e!785585))))

(assert (=> b!1386870 (= res!927995 (validKeyInArray!0 (select (arr!45804 a!2938) i!1065)))))

(assert (= (and start!118626 res!927999) b!1386866))

(assert (= (and b!1386866 res!927996) b!1386870))

(assert (= (and b!1386870 res!927995) b!1386865))

(assert (= (and b!1386865 res!927997) b!1386863))

(assert (= (and b!1386863 res!928001) b!1386864))

(assert (= (and b!1386864 res!928000) b!1386868))

(assert (= (and b!1386868 res!927998) b!1386862))

(assert (= (and b!1386868 c!128876) b!1386869))

(assert (= (and b!1386868 (not c!128876)) b!1386867))

(declare-fun m!1271847 () Bool)

(assert (=> b!1386869 m!1271847))

(declare-fun m!1271849 () Bool)

(assert (=> b!1386869 m!1271849))

(assert (=> b!1386869 m!1271849))

(declare-fun m!1271851 () Bool)

(assert (=> b!1386869 m!1271851))

(declare-fun m!1271853 () Bool)

(assert (=> b!1386869 m!1271853))

(declare-fun m!1271855 () Bool)

(assert (=> b!1386869 m!1271855))

(declare-fun m!1271857 () Bool)

(assert (=> b!1386869 m!1271857))

(declare-fun m!1271859 () Bool)

(assert (=> b!1386869 m!1271859))

(assert (=> b!1386869 m!1271857))

(declare-fun m!1271861 () Bool)

(assert (=> b!1386869 m!1271861))

(declare-fun m!1271863 () Bool)

(assert (=> b!1386865 m!1271863))

(declare-fun m!1271865 () Bool)

(assert (=> b!1386864 m!1271865))

(assert (=> b!1386870 m!1271865))

(assert (=> b!1386870 m!1271865))

(declare-fun m!1271867 () Bool)

(assert (=> b!1386870 m!1271867))

(assert (=> b!1386862 m!1271857))

(assert (=> b!1386862 m!1271857))

(declare-fun m!1271869 () Bool)

(assert (=> b!1386862 m!1271869))

(declare-fun m!1271871 () Bool)

(assert (=> start!118626 m!1271871))

(declare-fun m!1271873 () Bool)

(assert (=> start!118626 m!1271873))

(declare-fun m!1271875 () Bool)

(assert (=> b!1386863 m!1271875))

(push 1)

(assert (not start!118626))

(assert (not b!1386869))

(assert (not b!1386863))

(assert (not b!1386862))

(assert (not b!1386865))

(assert (not b!1386870))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

