; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118372 () Bool)

(assert start!118372)

(declare-fun b!1384554 () Bool)

(declare-fun e!784553 () Bool)

(assert (=> b!1384554 (= e!784553 (not true))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-datatypes ((array!94675 0))(
  ( (array!94676 (arr!45715 (Array (_ BitVec 32) (_ BitVec 64))) (size!46265 (_ BitVec 32))) )
))
(declare-fun lt!608944 () array!94675)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94675 (_ BitVec 32)) Bool)

(assert (=> b!1384554 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!608944 mask!2987)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun a!2938 () array!94675)

(declare-datatypes ((Unit!46182 0))(
  ( (Unit!46183) )
))
(declare-fun lt!608945 () Unit!46182)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94675 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46182)

(assert (=> b!1384554 (= lt!608945 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun res!925971 () Bool)

(declare-fun e!784554 () Bool)

(assert (=> start!118372 (=> (not res!925971) (not e!784554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118372 (= res!925971 (validMask!0 mask!2987))))

(assert (=> start!118372 e!784554))

(assert (=> start!118372 true))

(declare-fun array_inv!34743 (array!94675) Bool)

(assert (=> start!118372 (array_inv!34743 a!2938)))

(declare-fun b!1384555 () Bool)

(declare-fun res!925975 () Bool)

(assert (=> b!1384555 (=> (not res!925975) (not e!784554))))

(assert (=> b!1384555 (= res!925975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384556 () Bool)

(assert (=> b!1384556 (= e!784554 e!784553)))

(declare-fun res!925969 () Bool)

(assert (=> b!1384556 (=> (not res!925969) (not e!784553))))

(assert (=> b!1384556 (= res!925969 (and (bvslt startIndex!16 (bvsub (size!46265 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!608942 () Unit!46182)

(declare-fun e!784556 () Unit!46182)

(assert (=> b!1384556 (= lt!608942 e!784556)))

(declare-fun c!128733 () Bool)

(declare-fun e!784555 () Bool)

(assert (=> b!1384556 (= c!128733 e!784555)))

(declare-fun res!925968 () Bool)

(assert (=> b!1384556 (=> (not res!925968) (not e!784555))))

(assert (=> b!1384556 (= res!925968 (not (= startIndex!16 i!1065)))))

(assert (=> b!1384556 (= lt!608944 (array!94676 (store (arr!45715 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46265 a!2938)))))

(declare-fun b!1384557 () Bool)

(declare-fun res!925973 () Bool)

(assert (=> b!1384557 (=> (not res!925973) (not e!784554))))

(assert (=> b!1384557 (= res!925973 (and (not (= (select (arr!45715 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45715 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384558 () Bool)

(declare-fun res!925972 () Bool)

(assert (=> b!1384558 (=> (not res!925972) (not e!784554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384558 (= res!925972 (validKeyInArray!0 (select (arr!45715 a!2938) i!1065)))))

(declare-fun b!1384559 () Bool)

(assert (=> b!1384559 (= e!784555 (validKeyInArray!0 (select (arr!45715 a!2938) startIndex!16)))))

(declare-fun b!1384560 () Bool)

(declare-fun Unit!46184 () Unit!46182)

(assert (=> b!1384560 (= e!784556 Unit!46184)))

(declare-fun b!1384561 () Bool)

(declare-fun res!925970 () Bool)

(assert (=> b!1384561 (=> (not res!925970) (not e!784554))))

(declare-datatypes ((List!32243 0))(
  ( (Nil!32240) (Cons!32239 (h!33448 (_ BitVec 64)) (t!46937 List!32243)) )
))
(declare-fun arrayNoDuplicates!0 (array!94675 (_ BitVec 32) List!32243) Bool)

(assert (=> b!1384561 (= res!925970 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32240))))

(declare-fun b!1384562 () Bool)

(declare-fun res!925974 () Bool)

(assert (=> b!1384562 (=> (not res!925974) (not e!784554))))

(assert (=> b!1384562 (= res!925974 (and (= (size!46265 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46265 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46265 a!2938))))))

(declare-fun b!1384563 () Bool)

(declare-fun lt!608943 () Unit!46182)

(assert (=> b!1384563 (= e!784556 lt!608943)))

(declare-fun lt!608946 () Unit!46182)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94675 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46182)

(assert (=> b!1384563 (= lt!608946 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10108 0))(
  ( (MissingZero!10108 (index!42803 (_ BitVec 32))) (Found!10108 (index!42804 (_ BitVec 32))) (Intermediate!10108 (undefined!10920 Bool) (index!42805 (_ BitVec 32)) (x!124301 (_ BitVec 32))) (Undefined!10108) (MissingVacant!10108 (index!42806 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94675 (_ BitVec 32)) SeekEntryResult!10108)

(assert (=> b!1384563 (= (seekEntryOrOpen!0 (select (arr!45715 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45715 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!608944 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94675 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46182)

(assert (=> b!1384563 (= lt!608943 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384563 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (= (and start!118372 res!925971) b!1384562))

(assert (= (and b!1384562 res!925974) b!1384558))

(assert (= (and b!1384558 res!925972) b!1384561))

(assert (= (and b!1384561 res!925970) b!1384555))

(assert (= (and b!1384555 res!925975) b!1384557))

(assert (= (and b!1384557 res!925973) b!1384556))

(assert (= (and b!1384556 res!925968) b!1384559))

(assert (= (and b!1384556 c!128733) b!1384563))

(assert (= (and b!1384556 (not c!128733)) b!1384560))

(assert (= (and b!1384556 res!925969) b!1384554))

(declare-fun m!1269809 () Bool)

(assert (=> b!1384563 m!1269809))

(declare-fun m!1269811 () Bool)

(assert (=> b!1384563 m!1269811))

(declare-fun m!1269813 () Bool)

(assert (=> b!1384563 m!1269813))

(assert (=> b!1384563 m!1269811))

(declare-fun m!1269815 () Bool)

(assert (=> b!1384563 m!1269815))

(declare-fun m!1269817 () Bool)

(assert (=> b!1384563 m!1269817))

(declare-fun m!1269819 () Bool)

(assert (=> b!1384563 m!1269819))

(declare-fun m!1269821 () Bool)

(assert (=> b!1384563 m!1269821))

(assert (=> b!1384563 m!1269819))

(declare-fun m!1269823 () Bool)

(assert (=> b!1384563 m!1269823))

(declare-fun m!1269825 () Bool)

(assert (=> b!1384557 m!1269825))

(declare-fun m!1269827 () Bool)

(assert (=> start!118372 m!1269827))

(declare-fun m!1269829 () Bool)

(assert (=> start!118372 m!1269829))

(assert (=> b!1384556 m!1269813))

(declare-fun m!1269831 () Bool)

(assert (=> b!1384555 m!1269831))

(assert (=> b!1384558 m!1269825))

(assert (=> b!1384558 m!1269825))

(declare-fun m!1269833 () Bool)

(assert (=> b!1384558 m!1269833))

(assert (=> b!1384559 m!1269819))

(assert (=> b!1384559 m!1269819))

(declare-fun m!1269835 () Bool)

(assert (=> b!1384559 m!1269835))

(declare-fun m!1269837 () Bool)

(assert (=> b!1384561 m!1269837))

(declare-fun m!1269839 () Bool)

(assert (=> b!1384554 m!1269839))

(declare-fun m!1269841 () Bool)

(assert (=> b!1384554 m!1269841))

(push 1)

