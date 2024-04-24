; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118536 () Bool)

(assert start!118536)

(declare-fun b!1385206 () Bool)

(declare-fun res!925979 () Bool)

(declare-fun e!785106 () Bool)

(assert (=> b!1385206 (=> (not res!925979) (not e!785106))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94737 0))(
  ( (array!94738 (arr!45744 (Array (_ BitVec 32) (_ BitVec 64))) (size!46295 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94737)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385206 (= res!925979 (and (= (size!46295 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46295 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46295 a!2938))))))

(declare-fun b!1385207 () Bool)

(declare-fun e!785107 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385207 (= e!785107 (validKeyInArray!0 (select (arr!45744 a!2938) startIndex!16)))))

(declare-fun b!1385208 () Bool)

(declare-fun res!925975 () Bool)

(assert (=> b!1385208 (=> (not res!925975) (not e!785106))))

(assert (=> b!1385208 (= res!925975 (validKeyInArray!0 (select (arr!45744 a!2938) i!1065)))))

(declare-fun b!1385209 () Bool)

(assert (=> b!1385209 (= e!785106 false)))

(declare-datatypes ((Unit!46049 0))(
  ( (Unit!46050) )
))
(declare-fun lt!609191 () Unit!46049)

(declare-fun e!785104 () Unit!46049)

(assert (=> b!1385209 (= lt!609191 e!785104)))

(declare-fun c!129063 () Bool)

(assert (=> b!1385209 (= c!129063 e!785107)))

(declare-fun res!925981 () Bool)

(assert (=> b!1385209 (=> (not res!925981) (not e!785107))))

(assert (=> b!1385209 (= res!925981 (not (= startIndex!16 i!1065)))))

(declare-fun res!925977 () Bool)

(assert (=> start!118536 (=> (not res!925977) (not e!785106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118536 (= res!925977 (validMask!0 mask!2987))))

(assert (=> start!118536 e!785106))

(assert (=> start!118536 true))

(declare-fun array_inv!35025 (array!94737) Bool)

(assert (=> start!118536 (array_inv!35025 a!2938)))

(declare-fun b!1385210 () Bool)

(declare-fun res!925976 () Bool)

(assert (=> b!1385210 (=> (not res!925976) (not e!785106))))

(assert (=> b!1385210 (= res!925976 (and (not (= (select (arr!45744 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45744 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1385211 () Bool)

(declare-fun lt!609190 () Unit!46049)

(assert (=> b!1385211 (= e!785104 lt!609190)))

(declare-fun lt!609192 () Unit!46049)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46049)

(assert (=> b!1385211 (= lt!609192 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10040 0))(
  ( (MissingZero!10040 (index!42531 (_ BitVec 32))) (Found!10040 (index!42532 (_ BitVec 32))) (Intermediate!10040 (undefined!10852 Bool) (index!42533 (_ BitVec 32)) (x!124191 (_ BitVec 32))) (Undefined!10040) (MissingVacant!10040 (index!42534 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94737 (_ BitVec 32)) SeekEntryResult!10040)

(assert (=> b!1385211 (= (seekEntryOrOpen!0 (select (arr!45744 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45744 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94738 (store (arr!45744 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46295 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46049)

(assert (=> b!1385211 (= lt!609190 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94737 (_ BitVec 32)) Bool)

(assert (=> b!1385211 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1385212 () Bool)

(declare-fun Unit!46051 () Unit!46049)

(assert (=> b!1385212 (= e!785104 Unit!46051)))

(declare-fun b!1385213 () Bool)

(declare-fun res!925980 () Bool)

(assert (=> b!1385213 (=> (not res!925980) (not e!785106))))

(declare-datatypes ((List!32259 0))(
  ( (Nil!32256) (Cons!32255 (h!33473 (_ BitVec 64)) (t!46945 List!32259)) )
))
(declare-fun arrayNoDuplicates!0 (array!94737 (_ BitVec 32) List!32259) Bool)

(assert (=> b!1385213 (= res!925980 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32256))))

(declare-fun b!1385214 () Bool)

(declare-fun res!925978 () Bool)

(assert (=> b!1385214 (=> (not res!925978) (not e!785106))))

(assert (=> b!1385214 (= res!925978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118536 res!925977) b!1385206))

(assert (= (and b!1385206 res!925979) b!1385208))

(assert (= (and b!1385208 res!925975) b!1385213))

(assert (= (and b!1385213 res!925980) b!1385214))

(assert (= (and b!1385214 res!925978) b!1385210))

(assert (= (and b!1385210 res!925976) b!1385209))

(assert (= (and b!1385209 res!925981) b!1385207))

(assert (= (and b!1385209 c!129063) b!1385211))

(assert (= (and b!1385209 (not c!129063)) b!1385212))

(declare-fun m!1270713 () Bool)

(assert (=> b!1385207 m!1270713))

(assert (=> b!1385207 m!1270713))

(declare-fun m!1270715 () Bool)

(assert (=> b!1385207 m!1270715))

(declare-fun m!1270717 () Bool)

(assert (=> b!1385208 m!1270717))

(assert (=> b!1385208 m!1270717))

(declare-fun m!1270719 () Bool)

(assert (=> b!1385208 m!1270719))

(declare-fun m!1270721 () Bool)

(assert (=> start!118536 m!1270721))

(declare-fun m!1270723 () Bool)

(assert (=> start!118536 m!1270723))

(assert (=> b!1385210 m!1270717))

(declare-fun m!1270725 () Bool)

(assert (=> b!1385213 m!1270725))

(declare-fun m!1270727 () Bool)

(assert (=> b!1385214 m!1270727))

(declare-fun m!1270729 () Bool)

(assert (=> b!1385211 m!1270729))

(declare-fun m!1270731 () Bool)

(assert (=> b!1385211 m!1270731))

(assert (=> b!1385211 m!1270731))

(declare-fun m!1270733 () Bool)

(assert (=> b!1385211 m!1270733))

(declare-fun m!1270735 () Bool)

(assert (=> b!1385211 m!1270735))

(declare-fun m!1270737 () Bool)

(assert (=> b!1385211 m!1270737))

(assert (=> b!1385211 m!1270713))

(declare-fun m!1270739 () Bool)

(assert (=> b!1385211 m!1270739))

(assert (=> b!1385211 m!1270713))

(declare-fun m!1270741 () Bool)

(assert (=> b!1385211 m!1270741))

(push 1)

(assert (not b!1385208))

(assert (not start!118536))

(assert (not b!1385214))

(assert (not b!1385211))

(assert (not b!1385207))

(assert (not b!1385213))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

