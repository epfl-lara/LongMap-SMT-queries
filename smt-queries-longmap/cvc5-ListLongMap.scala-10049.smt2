; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118614 () Bool)

(assert start!118614)

(declare-fun b!1386295 () Bool)

(declare-datatypes ((Unit!46166 0))(
  ( (Unit!46167) )
))
(declare-fun e!785611 () Unit!46166)

(declare-fun lt!609614 () Unit!46166)

(assert (=> b!1386295 (= e!785611 lt!609614)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lt!609613 () Unit!46166)

(declare-datatypes ((array!94815 0))(
  ( (array!94816 (arr!45783 (Array (_ BitVec 32) (_ BitVec 64))) (size!46334 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94815)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94815 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46166)

(assert (=> b!1386295 (= lt!609613 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10079 0))(
  ( (MissingZero!10079 (index!42687 (_ BitVec 32))) (Found!10079 (index!42688 (_ BitVec 32))) (Intermediate!10079 (undefined!10891 Bool) (index!42689 (_ BitVec 32)) (x!124334 (_ BitVec 32))) (Undefined!10079) (MissingVacant!10079 (index!42690 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94815 (_ BitVec 32)) SeekEntryResult!10079)

(assert (=> b!1386295 (= (seekEntryOrOpen!0 (select (arr!45783 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45783 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94816 (store (arr!45783 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46334 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94815 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46166)

(assert (=> b!1386295 (= lt!609614 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94815 (_ BitVec 32)) Bool)

(assert (=> b!1386295 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386296 () Bool)

(declare-fun Unit!46168 () Unit!46166)

(assert (=> b!1386296 (= e!785611 Unit!46168)))

(declare-fun b!1386297 () Bool)

(declare-fun e!785610 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386297 (= e!785610 (validKeyInArray!0 (select (arr!45783 a!2938) startIndex!16)))))

(declare-fun b!1386298 () Bool)

(declare-fun res!926836 () Bool)

(declare-fun e!785609 () Bool)

(assert (=> b!1386298 (=> (not res!926836) (not e!785609))))

(assert (=> b!1386298 (= res!926836 (validKeyInArray!0 (select (arr!45783 a!2938) i!1065)))))

(declare-fun b!1386299 () Bool)

(assert (=> b!1386299 (= e!785609 false)))

(declare-fun lt!609615 () Unit!46166)

(assert (=> b!1386299 (= lt!609615 e!785611)))

(declare-fun c!129180 () Bool)

(assert (=> b!1386299 (= c!129180 e!785610)))

(declare-fun res!926833 () Bool)

(assert (=> b!1386299 (=> (not res!926833) (not e!785610))))

(assert (=> b!1386299 (= res!926833 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386300 () Bool)

(declare-fun res!926831 () Bool)

(assert (=> b!1386300 (=> (not res!926831) (not e!785609))))

(declare-datatypes ((List!32298 0))(
  ( (Nil!32295) (Cons!32294 (h!33512 (_ BitVec 64)) (t!46984 List!32298)) )
))
(declare-fun arrayNoDuplicates!0 (array!94815 (_ BitVec 32) List!32298) Bool)

(assert (=> b!1386300 (= res!926831 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32295))))

(declare-fun b!1386301 () Bool)

(declare-fun res!926830 () Bool)

(assert (=> b!1386301 (=> (not res!926830) (not e!785609))))

(assert (=> b!1386301 (= res!926830 (and (= (size!46334 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46334 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46334 a!2938))))))

(declare-fun b!1386302 () Bool)

(declare-fun res!926835 () Bool)

(assert (=> b!1386302 (=> (not res!926835) (not e!785609))))

(assert (=> b!1386302 (= res!926835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386303 () Bool)

(declare-fun res!926834 () Bool)

(assert (=> b!1386303 (=> (not res!926834) (not e!785609))))

(assert (=> b!1386303 (= res!926834 (and (not (= (select (arr!45783 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45783 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!926832 () Bool)

(assert (=> start!118614 (=> (not res!926832) (not e!785609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118614 (= res!926832 (validMask!0 mask!2987))))

(assert (=> start!118614 e!785609))

(assert (=> start!118614 true))

(declare-fun array_inv!35064 (array!94815) Bool)

(assert (=> start!118614 (array_inv!35064 a!2938)))

(assert (= (and start!118614 res!926832) b!1386301))

(assert (= (and b!1386301 res!926830) b!1386298))

(assert (= (and b!1386298 res!926836) b!1386300))

(assert (= (and b!1386300 res!926831) b!1386302))

(assert (= (and b!1386302 res!926835) b!1386303))

(assert (= (and b!1386303 res!926834) b!1386299))

(assert (= (and b!1386299 res!926833) b!1386297))

(assert (= (and b!1386299 c!129180) b!1386295))

(assert (= (and b!1386299 (not c!129180)) b!1386296))

(declare-fun m!1271931 () Bool)

(assert (=> start!118614 m!1271931))

(declare-fun m!1271933 () Bool)

(assert (=> start!118614 m!1271933))

(declare-fun m!1271935 () Bool)

(assert (=> b!1386303 m!1271935))

(declare-fun m!1271937 () Bool)

(assert (=> b!1386302 m!1271937))

(declare-fun m!1271939 () Bool)

(assert (=> b!1386297 m!1271939))

(assert (=> b!1386297 m!1271939))

(declare-fun m!1271941 () Bool)

(assert (=> b!1386297 m!1271941))

(declare-fun m!1271943 () Bool)

(assert (=> b!1386295 m!1271943))

(declare-fun m!1271945 () Bool)

(assert (=> b!1386295 m!1271945))

(assert (=> b!1386295 m!1271945))

(declare-fun m!1271947 () Bool)

(assert (=> b!1386295 m!1271947))

(declare-fun m!1271949 () Bool)

(assert (=> b!1386295 m!1271949))

(declare-fun m!1271951 () Bool)

(assert (=> b!1386295 m!1271951))

(assert (=> b!1386295 m!1271939))

(declare-fun m!1271953 () Bool)

(assert (=> b!1386295 m!1271953))

(assert (=> b!1386295 m!1271939))

(declare-fun m!1271955 () Bool)

(assert (=> b!1386295 m!1271955))

(assert (=> b!1386298 m!1271935))

(assert (=> b!1386298 m!1271935))

(declare-fun m!1271957 () Bool)

(assert (=> b!1386298 m!1271957))

(declare-fun m!1271959 () Bool)

(assert (=> b!1386300 m!1271959))

(push 1)

(assert (not b!1386298))

(assert (not b!1386297))

(assert (not b!1386302))

(assert (not start!118614))

(assert (not b!1386295))

(assert (not b!1386300))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

