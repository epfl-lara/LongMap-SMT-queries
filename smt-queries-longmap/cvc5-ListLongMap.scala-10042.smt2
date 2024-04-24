; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118572 () Bool)

(assert start!118572)

(declare-fun b!1385692 () Bool)

(declare-fun res!926359 () Bool)

(declare-fun e!785321 () Bool)

(assert (=> b!1385692 (=> (not res!926359) (not e!785321))))

(declare-datatypes ((array!94773 0))(
  ( (array!94774 (arr!45762 (Array (_ BitVec 32) (_ BitVec 64))) (size!46313 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94773)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385692 (= res!926359 (validKeyInArray!0 (select (arr!45762 a!2938) i!1065)))))

(declare-fun b!1385693 () Bool)

(declare-fun res!926355 () Bool)

(assert (=> b!1385693 (=> (not res!926355) (not e!785321))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385693 (= res!926355 (and (= (size!46313 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46313 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46313 a!2938))))))

(declare-fun b!1385694 () Bool)

(declare-fun res!926358 () Bool)

(assert (=> b!1385694 (=> (not res!926358) (not e!785321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94773 (_ BitVec 32)) Bool)

(assert (=> b!1385694 (= res!926358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385695 () Bool)

(declare-datatypes ((Unit!46103 0))(
  ( (Unit!46104) )
))
(declare-fun e!785320 () Unit!46103)

(declare-fun lt!609354 () Unit!46103)

(assert (=> b!1385695 (= e!785320 lt!609354)))

(declare-fun lt!609353 () Unit!46103)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94773 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46103)

(assert (=> b!1385695 (= lt!609353 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10058 0))(
  ( (MissingZero!10058 (index!42603 (_ BitVec 32))) (Found!10058 (index!42604 (_ BitVec 32))) (Intermediate!10058 (undefined!10870 Bool) (index!42605 (_ BitVec 32)) (x!124257 (_ BitVec 32))) (Undefined!10058) (MissingVacant!10058 (index!42606 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94773 (_ BitVec 32)) SeekEntryResult!10058)

(assert (=> b!1385695 (= (seekEntryOrOpen!0 (select (arr!45762 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45762 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94774 (store (arr!45762 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46313 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94773 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46103)

(assert (=> b!1385695 (= lt!609354 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1385695 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1385696 () Bool)

(assert (=> b!1385696 (= e!785321 false)))

(declare-fun lt!609352 () Unit!46103)

(assert (=> b!1385696 (= lt!609352 e!785320)))

(declare-fun c!129117 () Bool)

(declare-fun e!785323 () Bool)

(assert (=> b!1385696 (= c!129117 e!785323)))

(declare-fun res!926354 () Bool)

(assert (=> b!1385696 (=> (not res!926354) (not e!785323))))

(assert (=> b!1385696 (= res!926354 (not (= startIndex!16 i!1065)))))

(declare-fun b!1385697 () Bool)

(declare-fun Unit!46105 () Unit!46103)

(assert (=> b!1385697 (= e!785320 Unit!46105)))

(declare-fun b!1385698 () Bool)

(declare-fun res!926356 () Bool)

(assert (=> b!1385698 (=> (not res!926356) (not e!785321))))

(declare-datatypes ((List!32277 0))(
  ( (Nil!32274) (Cons!32273 (h!33491 (_ BitVec 64)) (t!46963 List!32277)) )
))
(declare-fun arrayNoDuplicates!0 (array!94773 (_ BitVec 32) List!32277) Bool)

(assert (=> b!1385698 (= res!926356 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32274))))

(declare-fun b!1385699 () Bool)

(assert (=> b!1385699 (= e!785323 (validKeyInArray!0 (select (arr!45762 a!2938) startIndex!16)))))

(declare-fun res!926357 () Bool)

(assert (=> start!118572 (=> (not res!926357) (not e!785321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118572 (= res!926357 (validMask!0 mask!2987))))

(assert (=> start!118572 e!785321))

(assert (=> start!118572 true))

(declare-fun array_inv!35043 (array!94773) Bool)

(assert (=> start!118572 (array_inv!35043 a!2938)))

(declare-fun b!1385700 () Bool)

(declare-fun res!926353 () Bool)

(assert (=> b!1385700 (=> (not res!926353) (not e!785321))))

(assert (=> b!1385700 (= res!926353 (and (not (= (select (arr!45762 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45762 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!118572 res!926357) b!1385693))

(assert (= (and b!1385693 res!926355) b!1385692))

(assert (= (and b!1385692 res!926359) b!1385698))

(assert (= (and b!1385698 res!926356) b!1385694))

(assert (= (and b!1385694 res!926358) b!1385700))

(assert (= (and b!1385700 res!926353) b!1385696))

(assert (= (and b!1385696 res!926354) b!1385699))

(assert (= (and b!1385696 c!129117) b!1385695))

(assert (= (and b!1385696 (not c!129117)) b!1385697))

(declare-fun m!1271253 () Bool)

(assert (=> b!1385694 m!1271253))

(declare-fun m!1271255 () Bool)

(assert (=> start!118572 m!1271255))

(declare-fun m!1271257 () Bool)

(assert (=> start!118572 m!1271257))

(declare-fun m!1271259 () Bool)

(assert (=> b!1385695 m!1271259))

(declare-fun m!1271261 () Bool)

(assert (=> b!1385695 m!1271261))

(assert (=> b!1385695 m!1271261))

(declare-fun m!1271263 () Bool)

(assert (=> b!1385695 m!1271263))

(declare-fun m!1271265 () Bool)

(assert (=> b!1385695 m!1271265))

(declare-fun m!1271267 () Bool)

(assert (=> b!1385695 m!1271267))

(declare-fun m!1271269 () Bool)

(assert (=> b!1385695 m!1271269))

(declare-fun m!1271271 () Bool)

(assert (=> b!1385695 m!1271271))

(assert (=> b!1385695 m!1271269))

(declare-fun m!1271273 () Bool)

(assert (=> b!1385695 m!1271273))

(declare-fun m!1271275 () Bool)

(assert (=> b!1385692 m!1271275))

(assert (=> b!1385692 m!1271275))

(declare-fun m!1271277 () Bool)

(assert (=> b!1385692 m!1271277))

(assert (=> b!1385699 m!1271269))

(assert (=> b!1385699 m!1271269))

(declare-fun m!1271279 () Bool)

(assert (=> b!1385699 m!1271279))

(assert (=> b!1385700 m!1271275))

(declare-fun m!1271281 () Bool)

(assert (=> b!1385698 m!1271281))

(push 1)

(assert (not b!1385694))

(assert (not b!1385699))

(assert (not b!1385698))

(assert (not start!118572))

(assert (not b!1385695))

(assert (not b!1385692))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

