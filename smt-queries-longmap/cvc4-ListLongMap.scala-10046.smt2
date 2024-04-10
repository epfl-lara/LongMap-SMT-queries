; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118384 () Bool)

(assert start!118384)

(declare-fun b!1384734 () Bool)

(declare-fun res!926115 () Bool)

(declare-fun e!784645 () Bool)

(assert (=> b!1384734 (=> (not res!926115) (not e!784645))))

(declare-datatypes ((array!94687 0))(
  ( (array!94688 (arr!45721 (Array (_ BitVec 32) (_ BitVec 64))) (size!46271 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94687)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94687 (_ BitVec 32)) Bool)

(assert (=> b!1384734 (= res!926115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384735 () Bool)

(declare-fun res!926112 () Bool)

(assert (=> b!1384735 (=> (not res!926112) (not e!784645))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384735 (= res!926112 (and (= (size!46271 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46271 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46271 a!2938))))))

(declare-fun res!926113 () Bool)

(assert (=> start!118384 (=> (not res!926113) (not e!784645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118384 (= res!926113 (validMask!0 mask!2987))))

(assert (=> start!118384 e!784645))

(assert (=> start!118384 true))

(declare-fun array_inv!34749 (array!94687) Bool)

(assert (=> start!118384 (array_inv!34749 a!2938)))

(declare-fun b!1384736 () Bool)

(declare-datatypes ((Unit!46200 0))(
  ( (Unit!46201) )
))
(declare-fun e!784643 () Unit!46200)

(declare-fun lt!609035 () Unit!46200)

(assert (=> b!1384736 (= e!784643 lt!609035)))

(declare-fun lt!609034 () Unit!46200)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46200)

(assert (=> b!1384736 (= lt!609034 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun lt!609033 () array!94687)

(declare-datatypes ((SeekEntryResult!10114 0))(
  ( (MissingZero!10114 (index!42827 (_ BitVec 32))) (Found!10114 (index!42828 (_ BitVec 32))) (Intermediate!10114 (undefined!10926 Bool) (index!42829 (_ BitVec 32)) (x!124323 (_ BitVec 32))) (Undefined!10114) (MissingVacant!10114 (index!42830 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94687 (_ BitVec 32)) SeekEntryResult!10114)

(assert (=> b!1384736 (= (seekEntryOrOpen!0 (select (arr!45721 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45721 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609033 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46200)

(assert (=> b!1384736 (= lt!609035 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384736 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384737 () Bool)

(declare-fun e!784644 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384737 (= e!784644 (validKeyInArray!0 (select (arr!45721 a!2938) startIndex!16)))))

(declare-fun b!1384738 () Bool)

(declare-fun e!784646 () Bool)

(assert (=> b!1384738 (= e!784645 e!784646)))

(declare-fun res!926117 () Bool)

(assert (=> b!1384738 (=> (not res!926117) (not e!784646))))

(assert (=> b!1384738 (= res!926117 (and (bvslt startIndex!16 (bvsub (size!46271 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609036 () Unit!46200)

(assert (=> b!1384738 (= lt!609036 e!784643)))

(declare-fun c!128751 () Bool)

(assert (=> b!1384738 (= c!128751 e!784644)))

(declare-fun res!926116 () Bool)

(assert (=> b!1384738 (=> (not res!926116) (not e!784644))))

(assert (=> b!1384738 (= res!926116 (not (= startIndex!16 i!1065)))))

(assert (=> b!1384738 (= lt!609033 (array!94688 (store (arr!45721 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46271 a!2938)))))

(declare-fun b!1384739 () Bool)

(declare-fun res!926114 () Bool)

(assert (=> b!1384739 (=> (not res!926114) (not e!784645))))

(declare-datatypes ((List!32249 0))(
  ( (Nil!32246) (Cons!32245 (h!33454 (_ BitVec 64)) (t!46943 List!32249)) )
))
(declare-fun arrayNoDuplicates!0 (array!94687 (_ BitVec 32) List!32249) Bool)

(assert (=> b!1384739 (= res!926114 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32246))))

(declare-fun b!1384740 () Bool)

(assert (=> b!1384740 (= e!784646 (not true))))

(assert (=> b!1384740 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609033 mask!2987)))

(declare-fun lt!609032 () Unit!46200)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46200)

(assert (=> b!1384740 (= lt!609032 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1384741 () Bool)

(declare-fun res!926118 () Bool)

(assert (=> b!1384741 (=> (not res!926118) (not e!784645))))

(assert (=> b!1384741 (= res!926118 (and (not (= (select (arr!45721 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45721 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384742 () Bool)

(declare-fun res!926119 () Bool)

(assert (=> b!1384742 (=> (not res!926119) (not e!784645))))

(assert (=> b!1384742 (= res!926119 (validKeyInArray!0 (select (arr!45721 a!2938) i!1065)))))

(declare-fun b!1384743 () Bool)

(declare-fun Unit!46202 () Unit!46200)

(assert (=> b!1384743 (= e!784643 Unit!46202)))

(assert (= (and start!118384 res!926113) b!1384735))

(assert (= (and b!1384735 res!926112) b!1384742))

(assert (= (and b!1384742 res!926119) b!1384739))

(assert (= (and b!1384739 res!926114) b!1384734))

(assert (= (and b!1384734 res!926115) b!1384741))

(assert (= (and b!1384741 res!926118) b!1384738))

(assert (= (and b!1384738 res!926116) b!1384737))

(assert (= (and b!1384738 c!128751) b!1384736))

(assert (= (and b!1384738 (not c!128751)) b!1384743))

(assert (= (and b!1384738 res!926117) b!1384740))

(declare-fun m!1270013 () Bool)

(assert (=> b!1384738 m!1270013))

(declare-fun m!1270015 () Bool)

(assert (=> b!1384741 m!1270015))

(declare-fun m!1270017 () Bool)

(assert (=> start!118384 m!1270017))

(declare-fun m!1270019 () Bool)

(assert (=> start!118384 m!1270019))

(declare-fun m!1270021 () Bool)

(assert (=> b!1384734 m!1270021))

(declare-fun m!1270023 () Bool)

(assert (=> b!1384737 m!1270023))

(assert (=> b!1384737 m!1270023))

(declare-fun m!1270025 () Bool)

(assert (=> b!1384737 m!1270025))

(declare-fun m!1270027 () Bool)

(assert (=> b!1384740 m!1270027))

(declare-fun m!1270029 () Bool)

(assert (=> b!1384740 m!1270029))

(declare-fun m!1270031 () Bool)

(assert (=> b!1384736 m!1270031))

(declare-fun m!1270033 () Bool)

(assert (=> b!1384736 m!1270033))

(assert (=> b!1384736 m!1270013))

(declare-fun m!1270035 () Bool)

(assert (=> b!1384736 m!1270035))

(assert (=> b!1384736 m!1270023))

(declare-fun m!1270037 () Bool)

(assert (=> b!1384736 m!1270037))

(assert (=> b!1384736 m!1270023))

(declare-fun m!1270039 () Bool)

(assert (=> b!1384736 m!1270039))

(assert (=> b!1384736 m!1270033))

(declare-fun m!1270041 () Bool)

(assert (=> b!1384736 m!1270041))

(declare-fun m!1270043 () Bool)

(assert (=> b!1384739 m!1270043))

(assert (=> b!1384742 m!1270015))

(assert (=> b!1384742 m!1270015))

(declare-fun m!1270045 () Bool)

(assert (=> b!1384742 m!1270045))

(push 1)

(assert (not b!1384740))

(assert (not b!1384734))

