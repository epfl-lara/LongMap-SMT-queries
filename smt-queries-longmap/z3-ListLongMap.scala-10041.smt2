; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118352 () Bool)

(assert start!118352)

(declare-fun b!1384276 () Bool)

(declare-fun res!925756 () Bool)

(declare-fun e!784425 () Bool)

(assert (=> b!1384276 (=> (not res!925756) (not e!784425))))

(declare-datatypes ((array!94655 0))(
  ( (array!94656 (arr!45705 (Array (_ BitVec 32) (_ BitVec 64))) (size!46255 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94655)

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384276 (= res!925756 (and (not (= (select (arr!45705 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45705 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384277 () Bool)

(declare-datatypes ((Unit!46152 0))(
  ( (Unit!46153) )
))
(declare-fun e!784426 () Unit!46152)

(declare-fun lt!608836 () Unit!46152)

(assert (=> b!1384277 (= e!784426 lt!608836)))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!608838 () Unit!46152)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46152)

(assert (=> b!1384277 (= lt!608838 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10098 0))(
  ( (MissingZero!10098 (index!42763 (_ BitVec 32))) (Found!10098 (index!42764 (_ BitVec 32))) (Intermediate!10098 (undefined!10910 Bool) (index!42765 (_ BitVec 32)) (x!124267 (_ BitVec 32))) (Undefined!10098) (MissingVacant!10098 (index!42766 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94655 (_ BitVec 32)) SeekEntryResult!10098)

(assert (=> b!1384277 (= (seekEntryOrOpen!0 (select (arr!45705 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45705 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94656 (store (arr!45705 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46255 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46152)

(assert (=> b!1384277 (= lt!608836 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94655 (_ BitVec 32)) Bool)

(assert (=> b!1384277 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384278 () Bool)

(declare-fun Unit!46154 () Unit!46152)

(assert (=> b!1384278 (= e!784426 Unit!46154)))

(declare-fun res!925751 () Bool)

(assert (=> start!118352 (=> (not res!925751) (not e!784425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118352 (= res!925751 (validMask!0 mask!2987))))

(assert (=> start!118352 e!784425))

(assert (=> start!118352 true))

(declare-fun array_inv!34733 (array!94655) Bool)

(assert (=> start!118352 (array_inv!34733 a!2938)))

(declare-fun b!1384279 () Bool)

(declare-fun res!925754 () Bool)

(assert (=> b!1384279 (=> (not res!925754) (not e!784425))))

(assert (=> b!1384279 (= res!925754 (and (= (size!46255 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46255 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46255 a!2938))))))

(declare-fun b!1384280 () Bool)

(declare-fun res!925755 () Bool)

(assert (=> b!1384280 (=> (not res!925755) (not e!784425))))

(assert (=> b!1384280 (= res!925755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384281 () Bool)

(assert (=> b!1384281 (= e!784425 false)))

(declare-fun lt!608837 () Unit!46152)

(assert (=> b!1384281 (= lt!608837 e!784426)))

(declare-fun c!128703 () Bool)

(declare-fun e!784424 () Bool)

(assert (=> b!1384281 (= c!128703 e!784424)))

(declare-fun res!925752 () Bool)

(assert (=> b!1384281 (=> (not res!925752) (not e!784424))))

(assert (=> b!1384281 (= res!925752 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384282 () Bool)

(declare-fun res!925750 () Bool)

(assert (=> b!1384282 (=> (not res!925750) (not e!784425))))

(declare-datatypes ((List!32233 0))(
  ( (Nil!32230) (Cons!32229 (h!33438 (_ BitVec 64)) (t!46927 List!32233)) )
))
(declare-fun arrayNoDuplicates!0 (array!94655 (_ BitVec 32) List!32233) Bool)

(assert (=> b!1384282 (= res!925750 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32230))))

(declare-fun b!1384283 () Bool)

(declare-fun res!925753 () Bool)

(assert (=> b!1384283 (=> (not res!925753) (not e!784425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384283 (= res!925753 (validKeyInArray!0 (select (arr!45705 a!2938) i!1065)))))

(declare-fun b!1384284 () Bool)

(assert (=> b!1384284 (= e!784424 (validKeyInArray!0 (select (arr!45705 a!2938) startIndex!16)))))

(assert (= (and start!118352 res!925751) b!1384279))

(assert (= (and b!1384279 res!925754) b!1384283))

(assert (= (and b!1384283 res!925753) b!1384282))

(assert (= (and b!1384282 res!925750) b!1384280))

(assert (= (and b!1384280 res!925755) b!1384276))

(assert (= (and b!1384276 res!925756) b!1384281))

(assert (= (and b!1384281 res!925752) b!1384284))

(assert (= (and b!1384281 c!128703) b!1384277))

(assert (= (and b!1384281 (not c!128703)) b!1384278))

(declare-fun m!1269501 () Bool)

(assert (=> b!1384276 m!1269501))

(declare-fun m!1269503 () Bool)

(assert (=> b!1384280 m!1269503))

(declare-fun m!1269505 () Bool)

(assert (=> start!118352 m!1269505))

(declare-fun m!1269507 () Bool)

(assert (=> start!118352 m!1269507))

(declare-fun m!1269509 () Bool)

(assert (=> b!1384284 m!1269509))

(assert (=> b!1384284 m!1269509))

(declare-fun m!1269511 () Bool)

(assert (=> b!1384284 m!1269511))

(declare-fun m!1269513 () Bool)

(assert (=> b!1384277 m!1269513))

(declare-fun m!1269515 () Bool)

(assert (=> b!1384277 m!1269515))

(assert (=> b!1384277 m!1269515))

(declare-fun m!1269517 () Bool)

(assert (=> b!1384277 m!1269517))

(declare-fun m!1269519 () Bool)

(assert (=> b!1384277 m!1269519))

(declare-fun m!1269521 () Bool)

(assert (=> b!1384277 m!1269521))

(assert (=> b!1384277 m!1269509))

(declare-fun m!1269523 () Bool)

(assert (=> b!1384277 m!1269523))

(assert (=> b!1384277 m!1269509))

(declare-fun m!1269525 () Bool)

(assert (=> b!1384277 m!1269525))

(declare-fun m!1269527 () Bool)

(assert (=> b!1384282 m!1269527))

(assert (=> b!1384283 m!1269501))

(assert (=> b!1384283 m!1269501))

(declare-fun m!1269529 () Bool)

(assert (=> b!1384283 m!1269529))

(check-sat (not b!1384282) (not b!1384283) (not b!1384284) (not b!1384277) (not b!1384280) (not start!118352))
