; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118806 () Bool)

(assert start!118806)

(declare-fun b!1387753 () Bool)

(declare-fun res!928162 () Bool)

(declare-fun e!786248 () Bool)

(assert (=> b!1387753 (=> (not res!928162) (not e!786248))))

(declare-datatypes ((array!94980 0))(
  ( (array!94981 (arr!45864 (Array (_ BitVec 32) (_ BitVec 64))) (size!46415 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94980)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94980 (_ BitVec 32)) Bool)

(assert (=> b!1387753 (= res!928162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387755 () Bool)

(declare-fun res!928164 () Bool)

(assert (=> b!1387755 (=> (not res!928164) (not e!786248))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1387755 (= res!928164 (and (not (= (select (arr!45864 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45864 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1387756 () Bool)

(declare-datatypes ((Unit!46245 0))(
  ( (Unit!46246) )
))
(declare-fun e!786249 () Unit!46245)

(declare-fun lt!609946 () Unit!46245)

(assert (=> b!1387756 (= e!786249 lt!609946)))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!609947 () Unit!46245)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94980 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46245)

(assert (=> b!1387756 (= lt!609947 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10111 0))(
  ( (MissingZero!10111 (index!42815 (_ BitVec 32))) (Found!10111 (index!42816 (_ BitVec 32))) (Intermediate!10111 (undefined!10923 Bool) (index!42817 (_ BitVec 32)) (x!124582 (_ BitVec 32))) (Undefined!10111) (MissingVacant!10111 (index!42818 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94980 (_ BitVec 32)) SeekEntryResult!10111)

(assert (=> b!1387756 (= (seekEntryOrOpen!0 (select (arr!45864 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45864 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94981 (store (arr!45864 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46415 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94980 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46245)

(assert (=> b!1387756 (= lt!609946 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1387756 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1387757 () Bool)

(declare-fun res!928163 () Bool)

(assert (=> b!1387757 (=> (not res!928163) (not e!786248))))

(assert (=> b!1387757 (= res!928163 (and (= (size!46415 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46415 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46415 a!2938))))))

(declare-fun b!1387758 () Bool)

(declare-fun res!928165 () Bool)

(assert (=> b!1387758 (=> (not res!928165) (not e!786248))))

(declare-datatypes ((List!32379 0))(
  ( (Nil!32376) (Cons!32375 (h!33593 (_ BitVec 64)) (t!47065 List!32379)) )
))
(declare-fun arrayNoDuplicates!0 (array!94980 (_ BitVec 32) List!32379) Bool)

(assert (=> b!1387758 (= res!928165 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32376))))

(declare-fun b!1387759 () Bool)

(declare-fun e!786247 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387759 (= e!786247 (validKeyInArray!0 (select (arr!45864 a!2938) startIndex!16)))))

(declare-fun b!1387760 () Bool)

(declare-fun Unit!46247 () Unit!46245)

(assert (=> b!1387760 (= e!786249 Unit!46247)))

(declare-fun b!1387761 () Bool)

(assert (=> b!1387761 (= e!786248 false)))

(declare-fun lt!609948 () Unit!46245)

(assert (=> b!1387761 (= lt!609948 e!786249)))

(declare-fun c!129243 () Bool)

(assert (=> b!1387761 (= c!129243 e!786247)))

(declare-fun res!928166 () Bool)

(assert (=> b!1387761 (=> (not res!928166) (not e!786247))))

(assert (=> b!1387761 (= res!928166 (not (= startIndex!16 i!1065)))))

(declare-fun b!1387754 () Bool)

(declare-fun res!928168 () Bool)

(assert (=> b!1387754 (=> (not res!928168) (not e!786248))))

(assert (=> b!1387754 (= res!928168 (validKeyInArray!0 (select (arr!45864 a!2938) i!1065)))))

(declare-fun res!928167 () Bool)

(assert (=> start!118806 (=> (not res!928167) (not e!786248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118806 (= res!928167 (validMask!0 mask!2987))))

(assert (=> start!118806 e!786248))

(assert (=> start!118806 true))

(declare-fun array_inv!35145 (array!94980) Bool)

(assert (=> start!118806 (array_inv!35145 a!2938)))

(assert (= (and start!118806 res!928167) b!1387757))

(assert (= (and b!1387757 res!928163) b!1387754))

(assert (= (and b!1387754 res!928168) b!1387758))

(assert (= (and b!1387758 res!928165) b!1387753))

(assert (= (and b!1387753 res!928162) b!1387755))

(assert (= (and b!1387755 res!928164) b!1387761))

(assert (= (and b!1387761 res!928166) b!1387759))

(assert (= (and b!1387761 c!129243) b!1387756))

(assert (= (and b!1387761 (not c!129243)) b!1387760))

(declare-fun m!1273443 () Bool)

(assert (=> start!118806 m!1273443))

(declare-fun m!1273445 () Bool)

(assert (=> start!118806 m!1273445))

(declare-fun m!1273447 () Bool)

(assert (=> b!1387754 m!1273447))

(assert (=> b!1387754 m!1273447))

(declare-fun m!1273449 () Bool)

(assert (=> b!1387754 m!1273449))

(declare-fun m!1273451 () Bool)

(assert (=> b!1387758 m!1273451))

(assert (=> b!1387755 m!1273447))

(declare-fun m!1273453 () Bool)

(assert (=> b!1387756 m!1273453))

(declare-fun m!1273455 () Bool)

(assert (=> b!1387756 m!1273455))

(assert (=> b!1387756 m!1273455))

(declare-fun m!1273457 () Bool)

(assert (=> b!1387756 m!1273457))

(declare-fun m!1273459 () Bool)

(assert (=> b!1387756 m!1273459))

(declare-fun m!1273461 () Bool)

(assert (=> b!1387756 m!1273461))

(declare-fun m!1273463 () Bool)

(assert (=> b!1387756 m!1273463))

(declare-fun m!1273465 () Bool)

(assert (=> b!1387756 m!1273465))

(assert (=> b!1387756 m!1273463))

(declare-fun m!1273467 () Bool)

(assert (=> b!1387756 m!1273467))

(declare-fun m!1273469 () Bool)

(assert (=> b!1387753 m!1273469))

(assert (=> b!1387759 m!1273463))

(assert (=> b!1387759 m!1273463))

(declare-fun m!1273471 () Bool)

(assert (=> b!1387759 m!1273471))

(push 1)

(assert (not b!1387756))

(assert (not start!118806))

(assert (not b!1387759))

(assert (not b!1387758))

(assert (not b!1387753))

(assert (not b!1387754))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

