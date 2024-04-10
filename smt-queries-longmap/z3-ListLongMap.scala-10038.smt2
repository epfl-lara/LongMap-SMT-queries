; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118334 () Bool)

(assert start!118334)

(declare-fun b!1384033 () Bool)

(declare-datatypes ((Unit!46125 0))(
  ( (Unit!46126) )
))
(declare-fun e!784319 () Unit!46125)

(declare-fun Unit!46127 () Unit!46125)

(assert (=> b!1384033 (= e!784319 Unit!46127)))

(declare-fun b!1384034 () Bool)

(declare-fun lt!608756 () Unit!46125)

(assert (=> b!1384034 (= e!784319 lt!608756)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94637 0))(
  ( (array!94638 (arr!45696 (Array (_ BitVec 32) (_ BitVec 64))) (size!46246 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94637)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!608757 () Unit!46125)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94637 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46125)

(assert (=> b!1384034 (= lt!608757 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10089 0))(
  ( (MissingZero!10089 (index!42727 (_ BitVec 32))) (Found!10089 (index!42728 (_ BitVec 32))) (Intermediate!10089 (undefined!10901 Bool) (index!42729 (_ BitVec 32)) (x!124234 (_ BitVec 32))) (Undefined!10089) (MissingVacant!10089 (index!42730 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94637 (_ BitVec 32)) SeekEntryResult!10089)

(assert (=> b!1384034 (= (seekEntryOrOpen!0 (select (arr!45696 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45696 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94638 (store (arr!45696 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46246 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94637 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46125)

(assert (=> b!1384034 (= lt!608756 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94637 (_ BitVec 32)) Bool)

(assert (=> b!1384034 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384035 () Bool)

(declare-fun res!925564 () Bool)

(declare-fun e!784318 () Bool)

(assert (=> b!1384035 (=> (not res!925564) (not e!784318))))

(assert (=> b!1384035 (= res!925564 (and (= (size!46246 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46246 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46246 a!2938))))))

(declare-fun b!1384036 () Bool)

(declare-fun res!925563 () Bool)

(assert (=> b!1384036 (=> (not res!925563) (not e!784318))))

(declare-datatypes ((List!32224 0))(
  ( (Nil!32221) (Cons!32220 (h!33429 (_ BitVec 64)) (t!46918 List!32224)) )
))
(declare-fun arrayNoDuplicates!0 (array!94637 (_ BitVec 32) List!32224) Bool)

(assert (=> b!1384036 (= res!925563 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32221))))

(declare-fun res!925561 () Bool)

(assert (=> start!118334 (=> (not res!925561) (not e!784318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118334 (= res!925561 (validMask!0 mask!2987))))

(assert (=> start!118334 e!784318))

(assert (=> start!118334 true))

(declare-fun array_inv!34724 (array!94637) Bool)

(assert (=> start!118334 (array_inv!34724 a!2938)))

(declare-fun b!1384037 () Bool)

(declare-fun res!925562 () Bool)

(assert (=> b!1384037 (=> (not res!925562) (not e!784318))))

(assert (=> b!1384037 (= res!925562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384038 () Bool)

(assert (=> b!1384038 (= e!784318 false)))

(declare-fun lt!608755 () Unit!46125)

(assert (=> b!1384038 (= lt!608755 e!784319)))

(declare-fun c!128676 () Bool)

(declare-fun e!784317 () Bool)

(assert (=> b!1384038 (= c!128676 e!784317)))

(declare-fun res!925567 () Bool)

(assert (=> b!1384038 (=> (not res!925567) (not e!784317))))

(assert (=> b!1384038 (= res!925567 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384039 () Bool)

(declare-fun res!925565 () Bool)

(assert (=> b!1384039 (=> (not res!925565) (not e!784318))))

(assert (=> b!1384039 (= res!925565 (and (not (= (select (arr!45696 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45696 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384040 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384040 (= e!784317 (validKeyInArray!0 (select (arr!45696 a!2938) startIndex!16)))))

(declare-fun b!1384041 () Bool)

(declare-fun res!925566 () Bool)

(assert (=> b!1384041 (=> (not res!925566) (not e!784318))))

(assert (=> b!1384041 (= res!925566 (validKeyInArray!0 (select (arr!45696 a!2938) i!1065)))))

(assert (= (and start!118334 res!925561) b!1384035))

(assert (= (and b!1384035 res!925564) b!1384041))

(assert (= (and b!1384041 res!925566) b!1384036))

(assert (= (and b!1384036 res!925563) b!1384037))

(assert (= (and b!1384037 res!925562) b!1384039))

(assert (= (and b!1384039 res!925565) b!1384038))

(assert (= (and b!1384038 res!925567) b!1384040))

(assert (= (and b!1384038 c!128676) b!1384034))

(assert (= (and b!1384038 (not c!128676)) b!1384033))

(declare-fun m!1269231 () Bool)

(assert (=> start!118334 m!1269231))

(declare-fun m!1269233 () Bool)

(assert (=> start!118334 m!1269233))

(declare-fun m!1269235 () Bool)

(assert (=> b!1384039 m!1269235))

(declare-fun m!1269237 () Bool)

(assert (=> b!1384040 m!1269237))

(assert (=> b!1384040 m!1269237))

(declare-fun m!1269239 () Bool)

(assert (=> b!1384040 m!1269239))

(declare-fun m!1269241 () Bool)

(assert (=> b!1384034 m!1269241))

(declare-fun m!1269243 () Bool)

(assert (=> b!1384034 m!1269243))

(assert (=> b!1384034 m!1269243))

(declare-fun m!1269245 () Bool)

(assert (=> b!1384034 m!1269245))

(declare-fun m!1269247 () Bool)

(assert (=> b!1384034 m!1269247))

(declare-fun m!1269249 () Bool)

(assert (=> b!1384034 m!1269249))

(assert (=> b!1384034 m!1269237))

(declare-fun m!1269251 () Bool)

(assert (=> b!1384034 m!1269251))

(assert (=> b!1384034 m!1269237))

(declare-fun m!1269253 () Bool)

(assert (=> b!1384034 m!1269253))

(assert (=> b!1384041 m!1269235))

(assert (=> b!1384041 m!1269235))

(declare-fun m!1269255 () Bool)

(assert (=> b!1384041 m!1269255))

(declare-fun m!1269257 () Bool)

(assert (=> b!1384036 m!1269257))

(declare-fun m!1269259 () Bool)

(assert (=> b!1384037 m!1269259))

(check-sat (not b!1384036) (not b!1384040) (not start!118334) (not b!1384034) (not b!1384041) (not b!1384037))
