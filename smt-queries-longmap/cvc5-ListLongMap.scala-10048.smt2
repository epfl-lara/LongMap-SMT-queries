; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118392 () Bool)

(assert start!118392)

(declare-fun res!926227 () Bool)

(declare-fun e!784693 () Bool)

(assert (=> start!118392 (=> (not res!926227) (not e!784693))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118392 (= res!926227 (validMask!0 mask!2987))))

(assert (=> start!118392 e!784693))

(assert (=> start!118392 true))

(declare-datatypes ((array!94648 0))(
  ( (array!94649 (arr!45702 (Array (_ BitVec 32) (_ BitVec 64))) (size!46254 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94648)

(declare-fun array_inv!34935 (array!94648) Bool)

(assert (=> start!118392 (array_inv!34935 a!2938)))

(declare-fun b!1384837 () Bool)

(declare-fun e!784694 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384837 (= e!784694 (validKeyInArray!0 (select (arr!45702 a!2938) startIndex!16)))))

(declare-fun b!1384838 () Bool)

(declare-fun res!926222 () Bool)

(assert (=> b!1384838 (=> (not res!926222) (not e!784693))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384838 (= res!926222 (validKeyInArray!0 (select (arr!45702 a!2938) i!1065)))))

(declare-fun b!1384839 () Bool)

(declare-fun res!926223 () Bool)

(assert (=> b!1384839 (=> (not res!926223) (not e!784693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94648 (_ BitVec 32)) Bool)

(assert (=> b!1384839 (= res!926223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384840 () Bool)

(assert (=> b!1384840 (= e!784693 false)))

(declare-datatypes ((Unit!46059 0))(
  ( (Unit!46060) )
))
(declare-fun lt!608922 () Unit!46059)

(declare-fun e!784696 () Unit!46059)

(assert (=> b!1384840 (= lt!608922 e!784696)))

(declare-fun c!128750 () Bool)

(assert (=> b!1384840 (= c!128750 e!784694)))

(declare-fun res!926228 () Bool)

(assert (=> b!1384840 (=> (not res!926228) (not e!784694))))

(assert (=> b!1384840 (= res!926228 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384841 () Bool)

(declare-fun res!926224 () Bool)

(assert (=> b!1384841 (=> (not res!926224) (not e!784693))))

(assert (=> b!1384841 (= res!926224 (and (= (size!46254 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46254 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46254 a!2938))))))

(declare-fun b!1384842 () Bool)

(declare-fun res!926226 () Bool)

(assert (=> b!1384842 (=> (not res!926226) (not e!784693))))

(assert (=> b!1384842 (= res!926226 (and (not (= (select (arr!45702 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45702 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384843 () Bool)

(declare-fun Unit!46061 () Unit!46059)

(assert (=> b!1384843 (= e!784696 Unit!46061)))

(declare-fun b!1384844 () Bool)

(declare-fun res!926225 () Bool)

(assert (=> b!1384844 (=> (not res!926225) (not e!784693))))

(declare-datatypes ((List!32308 0))(
  ( (Nil!32305) (Cons!32304 (h!33513 (_ BitVec 64)) (t!46994 List!32308)) )
))
(declare-fun arrayNoDuplicates!0 (array!94648 (_ BitVec 32) List!32308) Bool)

(assert (=> b!1384844 (= res!926225 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32305))))

(declare-fun b!1384845 () Bool)

(declare-fun lt!608923 () Unit!46059)

(assert (=> b!1384845 (= e!784696 lt!608923)))

(declare-fun lt!608924 () Unit!46059)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46059)

(assert (=> b!1384845 (= lt!608924 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10119 0))(
  ( (MissingZero!10119 (index!42847 (_ BitVec 32))) (Found!10119 (index!42848 (_ BitVec 32))) (Intermediate!10119 (undefined!10931 Bool) (index!42849 (_ BitVec 32)) (x!124341 (_ BitVec 32))) (Undefined!10119) (MissingVacant!10119 (index!42850 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94648 (_ BitVec 32)) SeekEntryResult!10119)

(assert (=> b!1384845 (= (seekEntryOrOpen!0 (select (arr!45702 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45702 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94649 (store (arr!45702 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46254 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46059)

(assert (=> b!1384845 (= lt!608923 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384845 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (= (and start!118392 res!926227) b!1384841))

(assert (= (and b!1384841 res!926224) b!1384838))

(assert (= (and b!1384838 res!926222) b!1384844))

(assert (= (and b!1384844 res!926225) b!1384839))

(assert (= (and b!1384839 res!926223) b!1384842))

(assert (= (and b!1384842 res!926226) b!1384840))

(assert (= (and b!1384840 res!926228) b!1384837))

(assert (= (and b!1384840 c!128750) b!1384845))

(assert (= (and b!1384840 (not c!128750)) b!1384843))

(declare-fun m!1269705 () Bool)

(assert (=> b!1384837 m!1269705))

(assert (=> b!1384837 m!1269705))

(declare-fun m!1269707 () Bool)

(assert (=> b!1384837 m!1269707))

(declare-fun m!1269709 () Bool)

(assert (=> b!1384844 m!1269709))

(declare-fun m!1269711 () Bool)

(assert (=> b!1384845 m!1269711))

(declare-fun m!1269713 () Bool)

(assert (=> b!1384845 m!1269713))

(assert (=> b!1384845 m!1269713))

(declare-fun m!1269715 () Bool)

(assert (=> b!1384845 m!1269715))

(declare-fun m!1269717 () Bool)

(assert (=> b!1384845 m!1269717))

(declare-fun m!1269719 () Bool)

(assert (=> b!1384845 m!1269719))

(assert (=> b!1384845 m!1269705))

(declare-fun m!1269721 () Bool)

(assert (=> b!1384845 m!1269721))

(assert (=> b!1384845 m!1269705))

(declare-fun m!1269723 () Bool)

(assert (=> b!1384845 m!1269723))

(declare-fun m!1269725 () Bool)

(assert (=> b!1384839 m!1269725))

(declare-fun m!1269727 () Bool)

(assert (=> b!1384842 m!1269727))

(assert (=> b!1384838 m!1269727))

(assert (=> b!1384838 m!1269727))

(declare-fun m!1269729 () Bool)

(assert (=> b!1384838 m!1269729))

(declare-fun m!1269731 () Bool)

(assert (=> start!118392 m!1269731))

(declare-fun m!1269733 () Bool)

(assert (=> start!118392 m!1269733))

(push 1)

(assert (not start!118392))

(assert (not b!1384844))

(assert (not b!1384838))

(assert (not b!1384839))

(assert (not b!1384837))

(assert (not b!1384845))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

