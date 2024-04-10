; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118374 () Bool)

(assert start!118374)

(declare-fun b!1384584 () Bool)

(declare-fun e!784567 () Bool)

(declare-datatypes ((array!94677 0))(
  ( (array!94678 (arr!45716 (Array (_ BitVec 32) (_ BitVec 64))) (size!46266 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94677)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384584 (= e!784567 (validKeyInArray!0 (select (arr!45716 a!2938) startIndex!16)))))

(declare-fun b!1384585 () Bool)

(declare-fun res!925995 () Bool)

(declare-fun e!784569 () Bool)

(assert (=> b!1384585 (=> (not res!925995) (not e!784569))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1384585 (= res!925995 (and (= (size!46266 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46266 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46266 a!2938))))))

(declare-fun b!1384586 () Bool)

(declare-fun e!784571 () Bool)

(assert (=> b!1384586 (= e!784571 (not true))))

(declare-fun lt!608961 () array!94677)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94677 (_ BitVec 32)) Bool)

(assert (=> b!1384586 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!608961 mask!2987)))

(declare-datatypes ((Unit!46185 0))(
  ( (Unit!46186) )
))
(declare-fun lt!608958 () Unit!46185)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46185)

(assert (=> b!1384586 (= lt!608958 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1384587 () Bool)

(declare-fun res!925997 () Bool)

(assert (=> b!1384587 (=> (not res!925997) (not e!784569))))

(assert (=> b!1384587 (= res!925997 (validKeyInArray!0 (select (arr!45716 a!2938) i!1065)))))

(declare-fun res!925999 () Bool)

(assert (=> start!118374 (=> (not res!925999) (not e!784569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118374 (= res!925999 (validMask!0 mask!2987))))

(assert (=> start!118374 e!784569))

(assert (=> start!118374 true))

(declare-fun array_inv!34744 (array!94677) Bool)

(assert (=> start!118374 (array_inv!34744 a!2938)))

(declare-fun b!1384588 () Bool)

(assert (=> b!1384588 (= e!784569 e!784571)))

(declare-fun res!925998 () Bool)

(assert (=> b!1384588 (=> (not res!925998) (not e!784571))))

(assert (=> b!1384588 (= res!925998 (and (bvslt startIndex!16 (bvsub (size!46266 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!608957 () Unit!46185)

(declare-fun e!784568 () Unit!46185)

(assert (=> b!1384588 (= lt!608957 e!784568)))

(declare-fun c!128736 () Bool)

(assert (=> b!1384588 (= c!128736 e!784567)))

(declare-fun res!925996 () Bool)

(assert (=> b!1384588 (=> (not res!925996) (not e!784567))))

(assert (=> b!1384588 (= res!925996 (not (= startIndex!16 i!1065)))))

(assert (=> b!1384588 (= lt!608961 (array!94678 (store (arr!45716 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46266 a!2938)))))

(declare-fun b!1384589 () Bool)

(declare-fun res!925993 () Bool)

(assert (=> b!1384589 (=> (not res!925993) (not e!784569))))

(assert (=> b!1384589 (= res!925993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384590 () Bool)

(declare-fun res!925994 () Bool)

(assert (=> b!1384590 (=> (not res!925994) (not e!784569))))

(assert (=> b!1384590 (= res!925994 (and (not (= (select (arr!45716 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45716 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384591 () Bool)

(declare-fun lt!608959 () Unit!46185)

(assert (=> b!1384591 (= e!784568 lt!608959)))

(declare-fun lt!608960 () Unit!46185)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46185)

(assert (=> b!1384591 (= lt!608960 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10109 0))(
  ( (MissingZero!10109 (index!42807 (_ BitVec 32))) (Found!10109 (index!42808 (_ BitVec 32))) (Intermediate!10109 (undefined!10921 Bool) (index!42809 (_ BitVec 32)) (x!124310 (_ BitVec 32))) (Undefined!10109) (MissingVacant!10109 (index!42810 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94677 (_ BitVec 32)) SeekEntryResult!10109)

(assert (=> b!1384591 (= (seekEntryOrOpen!0 (select (arr!45716 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45716 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!608961 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46185)

(assert (=> b!1384591 (= lt!608959 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384591 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384592 () Bool)

(declare-fun res!925992 () Bool)

(assert (=> b!1384592 (=> (not res!925992) (not e!784569))))

(declare-datatypes ((List!32244 0))(
  ( (Nil!32241) (Cons!32240 (h!33449 (_ BitVec 64)) (t!46938 List!32244)) )
))
(declare-fun arrayNoDuplicates!0 (array!94677 (_ BitVec 32) List!32244) Bool)

(assert (=> b!1384592 (= res!925992 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32241))))

(declare-fun b!1384593 () Bool)

(declare-fun Unit!46187 () Unit!46185)

(assert (=> b!1384593 (= e!784568 Unit!46187)))

(assert (= (and start!118374 res!925999) b!1384585))

(assert (= (and b!1384585 res!925995) b!1384587))

(assert (= (and b!1384587 res!925997) b!1384592))

(assert (= (and b!1384592 res!925992) b!1384589))

(assert (= (and b!1384589 res!925993) b!1384590))

(assert (= (and b!1384590 res!925994) b!1384588))

(assert (= (and b!1384588 res!925996) b!1384584))

(assert (= (and b!1384588 c!128736) b!1384591))

(assert (= (and b!1384588 (not c!128736)) b!1384593))

(assert (= (and b!1384588 res!925998) b!1384586))

(declare-fun m!1269843 () Bool)

(assert (=> b!1384589 m!1269843))

(declare-fun m!1269845 () Bool)

(assert (=> b!1384592 m!1269845))

(declare-fun m!1269847 () Bool)

(assert (=> start!118374 m!1269847))

(declare-fun m!1269849 () Bool)

(assert (=> start!118374 m!1269849))

(declare-fun m!1269851 () Bool)

(assert (=> b!1384584 m!1269851))

(assert (=> b!1384584 m!1269851))

(declare-fun m!1269853 () Bool)

(assert (=> b!1384584 m!1269853))

(declare-fun m!1269855 () Bool)

(assert (=> b!1384590 m!1269855))

(assert (=> b!1384587 m!1269855))

(assert (=> b!1384587 m!1269855))

(declare-fun m!1269857 () Bool)

(assert (=> b!1384587 m!1269857))

(declare-fun m!1269859 () Bool)

(assert (=> b!1384586 m!1269859))

(declare-fun m!1269861 () Bool)

(assert (=> b!1384586 m!1269861))

(declare-fun m!1269863 () Bool)

(assert (=> b!1384591 m!1269863))

(declare-fun m!1269865 () Bool)

(assert (=> b!1384591 m!1269865))

(declare-fun m!1269867 () Bool)

(assert (=> b!1384591 m!1269867))

(declare-fun m!1269869 () Bool)

(assert (=> b!1384591 m!1269869))

(assert (=> b!1384591 m!1269851))

(declare-fun m!1269871 () Bool)

(assert (=> b!1384591 m!1269871))

(assert (=> b!1384591 m!1269851))

(assert (=> b!1384591 m!1269865))

(declare-fun m!1269873 () Bool)

(assert (=> b!1384591 m!1269873))

(declare-fun m!1269875 () Bool)

(assert (=> b!1384591 m!1269875))

(assert (=> b!1384588 m!1269867))

(push 1)

