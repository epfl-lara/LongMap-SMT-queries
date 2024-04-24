; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118950 () Bool)

(assert start!118950)

(declare-fun b!1389001 () Bool)

(declare-fun e!786904 () Bool)

(assert (=> b!1389001 (= e!786904 false)))

(declare-datatypes ((Unit!46335 0))(
  ( (Unit!46336) )
))
(declare-fun lt!610468 () Unit!46335)

(declare-fun e!786902 () Unit!46335)

(assert (=> b!1389001 (= lt!610468 e!786902)))

(declare-fun c!129469 () Bool)

(declare-fun e!786905 () Bool)

(assert (=> b!1389001 (= c!129469 e!786905)))

(declare-fun res!928961 () Bool)

(assert (=> b!1389001 (=> (not res!928961) (not e!786905))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1389001 (= res!928961 (not (= startIndex!16 i!1065)))))

(declare-fun b!1389002 () Bool)

(declare-datatypes ((array!95043 0))(
  ( (array!95044 (arr!45894 (Array (_ BitVec 32) (_ BitVec 64))) (size!46445 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!95043)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389002 (= e!786905 (validKeyInArray!0 (select (arr!45894 a!2938) startIndex!16)))))

(declare-fun b!1389003 () Bool)

(declare-fun lt!610469 () Unit!46335)

(assert (=> b!1389003 (= e!786902 lt!610469)))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lt!610467 () Unit!46335)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!95043 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46335)

(assert (=> b!1389003 (= lt!610467 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10141 0))(
  ( (MissingZero!10141 (index!42935 (_ BitVec 32))) (Found!10141 (index!42936 (_ BitVec 32))) (Intermediate!10141 (undefined!10953 Bool) (index!42937 (_ BitVec 32)) (x!124698 (_ BitVec 32))) (Undefined!10141) (MissingVacant!10141 (index!42938 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95043 (_ BitVec 32)) SeekEntryResult!10141)

(assert (=> b!1389003 (= (seekEntryOrOpen!0 (select (arr!45894 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45894 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!95044 (store (arr!45894 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46445 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95043 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46335)

(assert (=> b!1389003 (= lt!610469 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95043 (_ BitVec 32)) Bool)

(assert (=> b!1389003 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1389004 () Bool)

(declare-fun res!928964 () Bool)

(assert (=> b!1389004 (=> (not res!928964) (not e!786904))))

(assert (=> b!1389004 (= res!928964 (and (not (= (select (arr!45894 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45894 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1389005 () Bool)

(declare-fun res!928963 () Bool)

(assert (=> b!1389005 (=> (not res!928963) (not e!786904))))

(assert (=> b!1389005 (= res!928963 (validKeyInArray!0 (select (arr!45894 a!2938) i!1065)))))

(declare-fun b!1389006 () Bool)

(declare-fun res!928960 () Bool)

(assert (=> b!1389006 (=> (not res!928960) (not e!786904))))

(assert (=> b!1389006 (= res!928960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!928966 () Bool)

(assert (=> start!118950 (=> (not res!928966) (not e!786904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118950 (= res!928966 (validMask!0 mask!2987))))

(assert (=> start!118950 e!786904))

(assert (=> start!118950 true))

(declare-fun array_inv!35175 (array!95043) Bool)

(assert (=> start!118950 (array_inv!35175 a!2938)))

(declare-fun b!1389007 () Bool)

(declare-fun res!928962 () Bool)

(assert (=> b!1389007 (=> (not res!928962) (not e!786904))))

(assert (=> b!1389007 (= res!928962 (and (= (size!46445 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46445 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46445 a!2938))))))

(declare-fun b!1389008 () Bool)

(declare-fun res!928965 () Bool)

(assert (=> b!1389008 (=> (not res!928965) (not e!786904))))

(declare-datatypes ((List!32409 0))(
  ( (Nil!32406) (Cons!32405 (h!33625 (_ BitVec 64)) (t!47095 List!32409)) )
))
(declare-fun arrayNoDuplicates!0 (array!95043 (_ BitVec 32) List!32409) Bool)

(assert (=> b!1389008 (= res!928965 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32406))))

(declare-fun b!1389009 () Bool)

(declare-fun Unit!46337 () Unit!46335)

(assert (=> b!1389009 (= e!786902 Unit!46337)))

(assert (= (and start!118950 res!928966) b!1389007))

(assert (= (and b!1389007 res!928962) b!1389005))

(assert (= (and b!1389005 res!928963) b!1389008))

(assert (= (and b!1389008 res!928965) b!1389006))

(assert (= (and b!1389006 res!928960) b!1389004))

(assert (= (and b!1389004 res!928964) b!1389001))

(assert (= (and b!1389001 res!928961) b!1389002))

(assert (= (and b!1389001 c!129469) b!1389003))

(assert (= (and b!1389001 (not c!129469)) b!1389009))

(declare-fun m!1274887 () Bool)

(assert (=> b!1389008 m!1274887))

(declare-fun m!1274889 () Bool)

(assert (=> b!1389005 m!1274889))

(assert (=> b!1389005 m!1274889))

(declare-fun m!1274891 () Bool)

(assert (=> b!1389005 m!1274891))

(declare-fun m!1274893 () Bool)

(assert (=> b!1389002 m!1274893))

(assert (=> b!1389002 m!1274893))

(declare-fun m!1274895 () Bool)

(assert (=> b!1389002 m!1274895))

(declare-fun m!1274897 () Bool)

(assert (=> b!1389006 m!1274897))

(declare-fun m!1274899 () Bool)

(assert (=> b!1389003 m!1274899))

(declare-fun m!1274901 () Bool)

(assert (=> b!1389003 m!1274901))

(assert (=> b!1389003 m!1274901))

(declare-fun m!1274903 () Bool)

(assert (=> b!1389003 m!1274903))

(declare-fun m!1274905 () Bool)

(assert (=> b!1389003 m!1274905))

(declare-fun m!1274907 () Bool)

(assert (=> b!1389003 m!1274907))

(assert (=> b!1389003 m!1274893))

(declare-fun m!1274909 () Bool)

(assert (=> b!1389003 m!1274909))

(assert (=> b!1389003 m!1274893))

(declare-fun m!1274911 () Bool)

(assert (=> b!1389003 m!1274911))

(declare-fun m!1274913 () Bool)

(assert (=> start!118950 m!1274913))

(declare-fun m!1274915 () Bool)

(assert (=> start!118950 m!1274915))

(assert (=> b!1389004 m!1274889))

(push 1)

(assert (not b!1389002))

(assert (not b!1389005))

(assert (not b!1389008))

(assert (not b!1389003))

(assert (not b!1389006))

(assert (not start!118950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

