; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118368 () Bool)

(assert start!118368)

(declare-fun res!925922 () Bool)

(declare-fun e!784525 () Bool)

(assert (=> start!118368 (=> (not res!925922) (not e!784525))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118368 (= res!925922 (validMask!0 mask!2987))))

(assert (=> start!118368 e!784525))

(assert (=> start!118368 true))

(declare-datatypes ((array!94671 0))(
  ( (array!94672 (arr!45713 (Array (_ BitVec 32) (_ BitVec 64))) (size!46263 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94671)

(declare-fun array_inv!34741 (array!94671) Bool)

(assert (=> start!118368 (array_inv!34741 a!2938)))

(declare-fun b!1384494 () Bool)

(declare-fun e!784526 () Bool)

(assert (=> b!1384494 (= e!784526 (not true))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!608912 () array!94671)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94671 (_ BitVec 32)) Bool)

(assert (=> b!1384494 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!608912 mask!2987)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((Unit!46176 0))(
  ( (Unit!46177) )
))
(declare-fun lt!608913 () Unit!46176)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46176)

(assert (=> b!1384494 (= lt!608913 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1384495 () Bool)

(declare-fun res!925924 () Bool)

(assert (=> b!1384495 (=> (not res!925924) (not e!784525))))

(assert (=> b!1384495 (= res!925924 (and (not (= (select (arr!45713 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45713 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384496 () Bool)

(declare-fun res!925927 () Bool)

(assert (=> b!1384496 (=> (not res!925927) (not e!784525))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384496 (= res!925927 (validKeyInArray!0 (select (arr!45713 a!2938) i!1065)))))

(declare-fun b!1384497 () Bool)

(declare-fun res!925920 () Bool)

(assert (=> b!1384497 (=> (not res!925920) (not e!784525))))

(assert (=> b!1384497 (= res!925920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384498 () Bool)

(declare-fun res!925921 () Bool)

(assert (=> b!1384498 (=> (not res!925921) (not e!784525))))

(declare-datatypes ((List!32241 0))(
  ( (Nil!32238) (Cons!32237 (h!33446 (_ BitVec 64)) (t!46935 List!32241)) )
))
(declare-fun arrayNoDuplicates!0 (array!94671 (_ BitVec 32) List!32241) Bool)

(assert (=> b!1384498 (= res!925921 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32238))))

(declare-fun b!1384499 () Bool)

(declare-fun e!784523 () Bool)

(assert (=> b!1384499 (= e!784523 (validKeyInArray!0 (select (arr!45713 a!2938) startIndex!16)))))

(declare-fun b!1384500 () Bool)

(declare-fun res!925923 () Bool)

(assert (=> b!1384500 (=> (not res!925923) (not e!784525))))

(assert (=> b!1384500 (= res!925923 (and (= (size!46263 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46263 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46263 a!2938))))))

(declare-fun b!1384501 () Bool)

(declare-fun e!784522 () Unit!46176)

(declare-fun Unit!46178 () Unit!46176)

(assert (=> b!1384501 (= e!784522 Unit!46178)))

(declare-fun b!1384502 () Bool)

(assert (=> b!1384502 (= e!784525 e!784526)))

(declare-fun res!925925 () Bool)

(assert (=> b!1384502 (=> (not res!925925) (not e!784526))))

(assert (=> b!1384502 (= res!925925 (and (bvslt startIndex!16 (bvsub (size!46263 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!608916 () Unit!46176)

(assert (=> b!1384502 (= lt!608916 e!784522)))

(declare-fun c!128727 () Bool)

(assert (=> b!1384502 (= c!128727 e!784523)))

(declare-fun res!925926 () Bool)

(assert (=> b!1384502 (=> (not res!925926) (not e!784523))))

(assert (=> b!1384502 (= res!925926 (not (= startIndex!16 i!1065)))))

(assert (=> b!1384502 (= lt!608912 (array!94672 (store (arr!45713 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46263 a!2938)))))

(declare-fun b!1384503 () Bool)

(declare-fun lt!608914 () Unit!46176)

(assert (=> b!1384503 (= e!784522 lt!608914)))

(declare-fun lt!608915 () Unit!46176)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46176)

(assert (=> b!1384503 (= lt!608915 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10106 0))(
  ( (MissingZero!10106 (index!42795 (_ BitVec 32))) (Found!10106 (index!42796 (_ BitVec 32))) (Intermediate!10106 (undefined!10918 Bool) (index!42797 (_ BitVec 32)) (x!124299 (_ BitVec 32))) (Undefined!10106) (MissingVacant!10106 (index!42798 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94671 (_ BitVec 32)) SeekEntryResult!10106)

(assert (=> b!1384503 (= (seekEntryOrOpen!0 (select (arr!45713 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45713 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!608912 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46176)

(assert (=> b!1384503 (= lt!608914 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384503 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (= (and start!118368 res!925922) b!1384500))

(assert (= (and b!1384500 res!925923) b!1384496))

(assert (= (and b!1384496 res!925927) b!1384498))

(assert (= (and b!1384498 res!925921) b!1384497))

(assert (= (and b!1384497 res!925920) b!1384495))

(assert (= (and b!1384495 res!925924) b!1384502))

(assert (= (and b!1384502 res!925926) b!1384499))

(assert (= (and b!1384502 c!128727) b!1384503))

(assert (= (and b!1384502 (not c!128727)) b!1384501))

(assert (= (and b!1384502 res!925925) b!1384494))

(declare-fun m!1269741 () Bool)

(assert (=> start!118368 m!1269741))

(declare-fun m!1269743 () Bool)

(assert (=> start!118368 m!1269743))

(declare-fun m!1269745 () Bool)

(assert (=> b!1384497 m!1269745))

(declare-fun m!1269747 () Bool)

(assert (=> b!1384496 m!1269747))

(assert (=> b!1384496 m!1269747))

(declare-fun m!1269749 () Bool)

(assert (=> b!1384496 m!1269749))

(declare-fun m!1269751 () Bool)

(assert (=> b!1384499 m!1269751))

(assert (=> b!1384499 m!1269751))

(declare-fun m!1269753 () Bool)

(assert (=> b!1384499 m!1269753))

(declare-fun m!1269755 () Bool)

(assert (=> b!1384494 m!1269755))

(declare-fun m!1269757 () Bool)

(assert (=> b!1384494 m!1269757))

(declare-fun m!1269759 () Bool)

(assert (=> b!1384498 m!1269759))

(declare-fun m!1269761 () Bool)

(assert (=> b!1384503 m!1269761))

(declare-fun m!1269763 () Bool)

(assert (=> b!1384503 m!1269763))

(declare-fun m!1269765 () Bool)

(assert (=> b!1384503 m!1269765))

(declare-fun m!1269767 () Bool)

(assert (=> b!1384503 m!1269767))

(assert (=> b!1384503 m!1269763))

(declare-fun m!1269769 () Bool)

(assert (=> b!1384503 m!1269769))

(assert (=> b!1384503 m!1269751))

(declare-fun m!1269771 () Bool)

(assert (=> b!1384503 m!1269771))

(assert (=> b!1384503 m!1269751))

(declare-fun m!1269773 () Bool)

(assert (=> b!1384503 m!1269773))

(assert (=> b!1384502 m!1269765))

(assert (=> b!1384495 m!1269747))

(push 1)

