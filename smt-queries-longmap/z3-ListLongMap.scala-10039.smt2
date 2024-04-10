; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118340 () Bool)

(assert start!118340)

(declare-fun b!1384114 () Bool)

(declare-fun res!925626 () Bool)

(declare-fun e!784354 () Bool)

(assert (=> b!1384114 (=> (not res!925626) (not e!784354))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94643 0))(
  ( (array!94644 (arr!45699 (Array (_ BitVec 32) (_ BitVec 64))) (size!46249 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94643)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1384114 (= res!925626 (and (= (size!46249 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46249 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46249 a!2938))))))

(declare-fun b!1384115 () Bool)

(declare-datatypes ((Unit!46134 0))(
  ( (Unit!46135) )
))
(declare-fun e!784353 () Unit!46134)

(declare-fun lt!608784 () Unit!46134)

(assert (=> b!1384115 (= e!784353 lt!608784)))

(declare-fun lt!608782 () Unit!46134)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94643 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46134)

(assert (=> b!1384115 (= lt!608782 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10092 0))(
  ( (MissingZero!10092 (index!42739 (_ BitVec 32))) (Found!10092 (index!42740 (_ BitVec 32))) (Intermediate!10092 (undefined!10904 Bool) (index!42741 (_ BitVec 32)) (x!124245 (_ BitVec 32))) (Undefined!10092) (MissingVacant!10092 (index!42742 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94643 (_ BitVec 32)) SeekEntryResult!10092)

(assert (=> b!1384115 (= (seekEntryOrOpen!0 (select (arr!45699 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45699 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94644 (store (arr!45699 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46249 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94643 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46134)

(assert (=> b!1384115 (= lt!608784 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94643 (_ BitVec 32)) Bool)

(assert (=> b!1384115 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384116 () Bool)

(assert (=> b!1384116 (= e!784354 false)))

(declare-fun lt!608783 () Unit!46134)

(assert (=> b!1384116 (= lt!608783 e!784353)))

(declare-fun c!128685 () Bool)

(declare-fun e!784352 () Bool)

(assert (=> b!1384116 (= c!128685 e!784352)))

(declare-fun res!925629 () Bool)

(assert (=> b!1384116 (=> (not res!925629) (not e!784352))))

(assert (=> b!1384116 (= res!925629 (not (= startIndex!16 i!1065)))))

(declare-fun res!925625 () Bool)

(assert (=> start!118340 (=> (not res!925625) (not e!784354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118340 (= res!925625 (validMask!0 mask!2987))))

(assert (=> start!118340 e!784354))

(assert (=> start!118340 true))

(declare-fun array_inv!34727 (array!94643) Bool)

(assert (=> start!118340 (array_inv!34727 a!2938)))

(declare-fun b!1384117 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384117 (= e!784352 (validKeyInArray!0 (select (arr!45699 a!2938) startIndex!16)))))

(declare-fun b!1384118 () Bool)

(declare-fun res!925624 () Bool)

(assert (=> b!1384118 (=> (not res!925624) (not e!784354))))

(declare-datatypes ((List!32227 0))(
  ( (Nil!32224) (Cons!32223 (h!33432 (_ BitVec 64)) (t!46921 List!32227)) )
))
(declare-fun arrayNoDuplicates!0 (array!94643 (_ BitVec 32) List!32227) Bool)

(assert (=> b!1384118 (= res!925624 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32224))))

(declare-fun b!1384119 () Bool)

(declare-fun res!925630 () Bool)

(assert (=> b!1384119 (=> (not res!925630) (not e!784354))))

(assert (=> b!1384119 (= res!925630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384120 () Bool)

(declare-fun Unit!46136 () Unit!46134)

(assert (=> b!1384120 (= e!784353 Unit!46136)))

(declare-fun b!1384121 () Bool)

(declare-fun res!925627 () Bool)

(assert (=> b!1384121 (=> (not res!925627) (not e!784354))))

(assert (=> b!1384121 (= res!925627 (validKeyInArray!0 (select (arr!45699 a!2938) i!1065)))))

(declare-fun b!1384122 () Bool)

(declare-fun res!925628 () Bool)

(assert (=> b!1384122 (=> (not res!925628) (not e!784354))))

(assert (=> b!1384122 (= res!925628 (and (not (= (select (arr!45699 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45699 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!118340 res!925625) b!1384114))

(assert (= (and b!1384114 res!925626) b!1384121))

(assert (= (and b!1384121 res!925627) b!1384118))

(assert (= (and b!1384118 res!925624) b!1384119))

(assert (= (and b!1384119 res!925630) b!1384122))

(assert (= (and b!1384122 res!925628) b!1384116))

(assert (= (and b!1384116 res!925629) b!1384117))

(assert (= (and b!1384116 c!128685) b!1384115))

(assert (= (and b!1384116 (not c!128685)) b!1384120))

(declare-fun m!1269321 () Bool)

(assert (=> b!1384118 m!1269321))

(declare-fun m!1269323 () Bool)

(assert (=> b!1384117 m!1269323))

(assert (=> b!1384117 m!1269323))

(declare-fun m!1269325 () Bool)

(assert (=> b!1384117 m!1269325))

(declare-fun m!1269327 () Bool)

(assert (=> b!1384121 m!1269327))

(assert (=> b!1384121 m!1269327))

(declare-fun m!1269329 () Bool)

(assert (=> b!1384121 m!1269329))

(declare-fun m!1269331 () Bool)

(assert (=> b!1384119 m!1269331))

(assert (=> b!1384122 m!1269327))

(declare-fun m!1269333 () Bool)

(assert (=> start!118340 m!1269333))

(declare-fun m!1269335 () Bool)

(assert (=> start!118340 m!1269335))

(declare-fun m!1269337 () Bool)

(assert (=> b!1384115 m!1269337))

(declare-fun m!1269339 () Bool)

(assert (=> b!1384115 m!1269339))

(assert (=> b!1384115 m!1269339))

(declare-fun m!1269341 () Bool)

(assert (=> b!1384115 m!1269341))

(declare-fun m!1269343 () Bool)

(assert (=> b!1384115 m!1269343))

(declare-fun m!1269345 () Bool)

(assert (=> b!1384115 m!1269345))

(assert (=> b!1384115 m!1269323))

(declare-fun m!1269347 () Bool)

(assert (=> b!1384115 m!1269347))

(assert (=> b!1384115 m!1269323))

(declare-fun m!1269349 () Bool)

(assert (=> b!1384115 m!1269349))

(check-sat (not b!1384121) (not b!1384118) (not b!1384117) (not start!118340) (not b!1384119) (not b!1384115))
