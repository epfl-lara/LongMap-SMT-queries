; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121640 () Bool)

(assert start!121640)

(declare-fun b!1413216 () Bool)

(declare-fun res!950209 () Bool)

(declare-fun e!799769 () Bool)

(assert (=> b!1413216 (=> (not res!950209) (not e!799769))))

(declare-datatypes ((array!96578 0))(
  ( (array!96579 (arr!46626 (Array (_ BitVec 32) (_ BitVec 64))) (size!47176 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96578)

(declare-datatypes ((List!33145 0))(
  ( (Nil!33142) (Cons!33141 (h!34416 (_ BitVec 64)) (t!47839 List!33145)) )
))
(declare-fun arrayNoDuplicates!0 (array!96578 (_ BitVec 32) List!33145) Bool)

(assert (=> b!1413216 (= res!950209 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33142))))

(declare-fun b!1413217 () Bool)

(declare-fun res!950211 () Bool)

(assert (=> b!1413217 (=> (not res!950211) (not e!799769))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413217 (= res!950211 (validKeyInArray!0 (select (arr!46626 a!2901) i!1037)))))

(declare-fun res!950214 () Bool)

(assert (=> start!121640 (=> (not res!950214) (not e!799769))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121640 (= res!950214 (validMask!0 mask!2840))))

(assert (=> start!121640 e!799769))

(assert (=> start!121640 true))

(declare-fun array_inv!35654 (array!96578) Bool)

(assert (=> start!121640 (array_inv!35654 a!2901)))

(declare-fun b!1413218 () Bool)

(declare-fun e!799770 () Bool)

(declare-fun e!799771 () Bool)

(assert (=> b!1413218 (= e!799770 e!799771)))

(declare-fun res!950213 () Bool)

(assert (=> b!1413218 (=> res!950213 e!799771)))

(declare-datatypes ((SeekEntryResult!10937 0))(
  ( (MissingZero!10937 (index!46128 (_ BitVec 32))) (Found!10937 (index!46129 (_ BitVec 32))) (Intermediate!10937 (undefined!11749 Bool) (index!46130 (_ BitVec 32)) (x!127712 (_ BitVec 32))) (Undefined!10937) (MissingVacant!10937 (index!46131 (_ BitVec 32))) )
))
(declare-fun lt!622883 () SeekEntryResult!10937)

(declare-fun lt!622884 () SeekEntryResult!10937)

(get-info :version)

(assert (=> b!1413218 (= res!950213 (or (= lt!622883 lt!622884) (not ((_ is Intermediate!10937) lt!622884))))))

(declare-fun lt!622880 () array!96578)

(declare-fun lt!622881 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96578 (_ BitVec 32)) SeekEntryResult!10937)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413218 (= lt!622884 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622881 mask!2840) lt!622881 lt!622880 mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1413218 (= lt!622881 (select (store (arr!46626 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413218 (= lt!622880 (array!96579 (store (arr!46626 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47176 a!2901)))))

(declare-fun b!1413219 () Bool)

(declare-fun e!799772 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96578 (_ BitVec 32)) SeekEntryResult!10937)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96578 (_ BitVec 32)) SeekEntryResult!10937)

(assert (=> b!1413219 (= e!799772 (= (seekEntryOrOpen!0 lt!622881 lt!622880 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127712 lt!622884) (index!46130 lt!622884) (index!46130 lt!622884) (select (arr!46626 a!2901) j!112) lt!622880 mask!2840)))))

(declare-fun b!1413220 () Bool)

(declare-fun e!799767 () Bool)

(assert (=> b!1413220 (= e!799767 (= (seekEntryOrOpen!0 (select (arr!46626 a!2901) j!112) a!2901 mask!2840) (Found!10937 j!112)))))

(declare-fun b!1413221 () Bool)

(assert (=> b!1413221 (= e!799771 true)))

(assert (=> b!1413221 e!799772))

(declare-fun res!950212 () Bool)

(assert (=> b!1413221 (=> (not res!950212) (not e!799772))))

(assert (=> b!1413221 (= res!950212 (and (not (undefined!11749 lt!622884)) (= (index!46130 lt!622884) i!1037) (bvslt (x!127712 lt!622884) (x!127712 lt!622883)) (= (select (store (arr!46626 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46130 lt!622884)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622882 () (_ BitVec 32))

(declare-datatypes ((Unit!47848 0))(
  ( (Unit!47849) )
))
(declare-fun lt!622878 () Unit!47848)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47848)

(assert (=> b!1413221 (= lt!622878 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622882 (x!127712 lt!622883) (index!46130 lt!622883) (x!127712 lt!622884) (index!46130 lt!622884) (undefined!11749 lt!622884) mask!2840))))

(declare-fun b!1413222 () Bool)

(declare-fun res!950207 () Bool)

(assert (=> b!1413222 (=> (not res!950207) (not e!799769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96578 (_ BitVec 32)) Bool)

(assert (=> b!1413222 (= res!950207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413223 () Bool)

(declare-fun res!950206 () Bool)

(assert (=> b!1413223 (=> (not res!950206) (not e!799769))))

(assert (=> b!1413223 (= res!950206 (and (= (size!47176 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47176 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47176 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413224 () Bool)

(assert (=> b!1413224 (= e!799769 (not e!799770))))

(declare-fun res!950215 () Bool)

(assert (=> b!1413224 (=> res!950215 e!799770)))

(assert (=> b!1413224 (= res!950215 (or (not ((_ is Intermediate!10937) lt!622883)) (undefined!11749 lt!622883)))))

(assert (=> b!1413224 e!799767))

(declare-fun res!950208 () Bool)

(assert (=> b!1413224 (=> (not res!950208) (not e!799767))))

(assert (=> b!1413224 (= res!950208 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622879 () Unit!47848)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47848)

(assert (=> b!1413224 (= lt!622879 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1413224 (= lt!622883 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622882 (select (arr!46626 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1413224 (= lt!622882 (toIndex!0 (select (arr!46626 a!2901) j!112) mask!2840))))

(declare-fun b!1413225 () Bool)

(declare-fun res!950210 () Bool)

(assert (=> b!1413225 (=> (not res!950210) (not e!799769))))

(assert (=> b!1413225 (= res!950210 (validKeyInArray!0 (select (arr!46626 a!2901) j!112)))))

(assert (= (and start!121640 res!950214) b!1413223))

(assert (= (and b!1413223 res!950206) b!1413217))

(assert (= (and b!1413217 res!950211) b!1413225))

(assert (= (and b!1413225 res!950210) b!1413222))

(assert (= (and b!1413222 res!950207) b!1413216))

(assert (= (and b!1413216 res!950209) b!1413224))

(assert (= (and b!1413224 res!950208) b!1413220))

(assert (= (and b!1413224 (not res!950215)) b!1413218))

(assert (= (and b!1413218 (not res!950213)) b!1413221))

(assert (= (and b!1413221 res!950212) b!1413219))

(declare-fun m!1303551 () Bool)

(assert (=> b!1413216 m!1303551))

(declare-fun m!1303553 () Bool)

(assert (=> b!1413219 m!1303553))

(declare-fun m!1303555 () Bool)

(assert (=> b!1413219 m!1303555))

(assert (=> b!1413219 m!1303555))

(declare-fun m!1303557 () Bool)

(assert (=> b!1413219 m!1303557))

(declare-fun m!1303559 () Bool)

(assert (=> b!1413218 m!1303559))

(assert (=> b!1413218 m!1303559))

(declare-fun m!1303561 () Bool)

(assert (=> b!1413218 m!1303561))

(declare-fun m!1303563 () Bool)

(assert (=> b!1413218 m!1303563))

(declare-fun m!1303565 () Bool)

(assert (=> b!1413218 m!1303565))

(declare-fun m!1303567 () Bool)

(assert (=> b!1413222 m!1303567))

(declare-fun m!1303569 () Bool)

(assert (=> start!121640 m!1303569))

(declare-fun m!1303571 () Bool)

(assert (=> start!121640 m!1303571))

(declare-fun m!1303573 () Bool)

(assert (=> b!1413217 m!1303573))

(assert (=> b!1413217 m!1303573))

(declare-fun m!1303575 () Bool)

(assert (=> b!1413217 m!1303575))

(assert (=> b!1413220 m!1303555))

(assert (=> b!1413220 m!1303555))

(declare-fun m!1303577 () Bool)

(assert (=> b!1413220 m!1303577))

(assert (=> b!1413224 m!1303555))

(declare-fun m!1303579 () Bool)

(assert (=> b!1413224 m!1303579))

(assert (=> b!1413224 m!1303555))

(assert (=> b!1413224 m!1303555))

(declare-fun m!1303581 () Bool)

(assert (=> b!1413224 m!1303581))

(declare-fun m!1303583 () Bool)

(assert (=> b!1413224 m!1303583))

(declare-fun m!1303585 () Bool)

(assert (=> b!1413224 m!1303585))

(assert (=> b!1413221 m!1303563))

(declare-fun m!1303587 () Bool)

(assert (=> b!1413221 m!1303587))

(declare-fun m!1303589 () Bool)

(assert (=> b!1413221 m!1303589))

(assert (=> b!1413225 m!1303555))

(assert (=> b!1413225 m!1303555))

(declare-fun m!1303591 () Bool)

(assert (=> b!1413225 m!1303591))

(check-sat (not b!1413217) (not b!1413225) (not b!1413221) (not start!121640) (not b!1413220) (not b!1413224) (not b!1413222) (not b!1413216) (not b!1413219) (not b!1413218))
(check-sat)
