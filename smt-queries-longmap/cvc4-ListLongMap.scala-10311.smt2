; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121192 () Bool)

(assert start!121192)

(declare-fun b!1409150 () Bool)

(declare-fun e!797450 () Bool)

(declare-fun e!797453 () Bool)

(assert (=> b!1409150 (= e!797450 (not e!797453))))

(declare-fun res!946877 () Bool)

(assert (=> b!1409150 (=> res!946877 e!797453)))

(declare-datatypes ((SeekEntryResult!10827 0))(
  ( (MissingZero!10827 (index!45685 (_ BitVec 32))) (Found!10827 (index!45686 (_ BitVec 32))) (Intermediate!10827 (undefined!11639 Bool) (index!45687 (_ BitVec 32)) (x!127276 (_ BitVec 32))) (Undefined!10827) (MissingVacant!10827 (index!45688 (_ BitVec 32))) )
))
(declare-fun lt!620615 () SeekEntryResult!10827)

(assert (=> b!1409150 (= res!946877 (or (not (is-Intermediate!10827 lt!620615)) (undefined!11639 lt!620615)))))

(declare-fun e!797451 () Bool)

(assert (=> b!1409150 e!797451))

(declare-fun res!946872 () Bool)

(assert (=> b!1409150 (=> (not res!946872) (not e!797451))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!96346 0))(
  ( (array!96347 (arr!46516 (Array (_ BitVec 32) (_ BitVec 64))) (size!47066 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96346)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96346 (_ BitVec 32)) Bool)

(assert (=> b!1409150 (= res!946872 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47628 0))(
  ( (Unit!47629) )
))
(declare-fun lt!620616 () Unit!47628)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47628)

(assert (=> b!1409150 (= lt!620616 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96346 (_ BitVec 32)) SeekEntryResult!10827)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409150 (= lt!620615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46516 a!2901) j!112) mask!2840) (select (arr!46516 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409151 () Bool)

(assert (=> b!1409151 (= e!797453 true)))

(declare-fun lt!620614 () SeekEntryResult!10827)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1409151 (= lt!620614 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96347 (store (arr!46516 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47066 a!2901)) mask!2840))))

(declare-fun b!1409152 () Bool)

(declare-fun res!946879 () Bool)

(assert (=> b!1409152 (=> (not res!946879) (not e!797450))))

(declare-datatypes ((List!33035 0))(
  ( (Nil!33032) (Cons!33031 (h!34294 (_ BitVec 64)) (t!47729 List!33035)) )
))
(declare-fun arrayNoDuplicates!0 (array!96346 (_ BitVec 32) List!33035) Bool)

(assert (=> b!1409152 (= res!946879 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33032))))

(declare-fun b!1409153 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96346 (_ BitVec 32)) SeekEntryResult!10827)

(assert (=> b!1409153 (= e!797451 (= (seekEntryOrOpen!0 (select (arr!46516 a!2901) j!112) a!2901 mask!2840) (Found!10827 j!112)))))

(declare-fun b!1409154 () Bool)

(declare-fun res!946875 () Bool)

(assert (=> b!1409154 (=> (not res!946875) (not e!797450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409154 (= res!946875 (validKeyInArray!0 (select (arr!46516 a!2901) j!112)))))

(declare-fun res!946876 () Bool)

(assert (=> start!121192 (=> (not res!946876) (not e!797450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121192 (= res!946876 (validMask!0 mask!2840))))

(assert (=> start!121192 e!797450))

(assert (=> start!121192 true))

(declare-fun array_inv!35544 (array!96346) Bool)

(assert (=> start!121192 (array_inv!35544 a!2901)))

(declare-fun b!1409155 () Bool)

(declare-fun res!946873 () Bool)

(assert (=> b!1409155 (=> (not res!946873) (not e!797450))))

(assert (=> b!1409155 (= res!946873 (and (= (size!47066 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47066 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47066 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409156 () Bool)

(declare-fun res!946874 () Bool)

(assert (=> b!1409156 (=> (not res!946874) (not e!797450))))

(assert (=> b!1409156 (= res!946874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409157 () Bool)

(declare-fun res!946878 () Bool)

(assert (=> b!1409157 (=> (not res!946878) (not e!797450))))

(assert (=> b!1409157 (= res!946878 (validKeyInArray!0 (select (arr!46516 a!2901) i!1037)))))

(assert (= (and start!121192 res!946876) b!1409155))

(assert (= (and b!1409155 res!946873) b!1409157))

(assert (= (and b!1409157 res!946878) b!1409154))

(assert (= (and b!1409154 res!946875) b!1409156))

(assert (= (and b!1409156 res!946874) b!1409152))

(assert (= (and b!1409152 res!946879) b!1409150))

(assert (= (and b!1409150 res!946872) b!1409153))

(assert (= (and b!1409150 (not res!946877)) b!1409151))

(declare-fun m!1298747 () Bool)

(assert (=> b!1409150 m!1298747))

(declare-fun m!1298749 () Bool)

(assert (=> b!1409150 m!1298749))

(assert (=> b!1409150 m!1298747))

(declare-fun m!1298751 () Bool)

(assert (=> b!1409150 m!1298751))

(assert (=> b!1409150 m!1298749))

(assert (=> b!1409150 m!1298747))

(declare-fun m!1298753 () Bool)

(assert (=> b!1409150 m!1298753))

(declare-fun m!1298755 () Bool)

(assert (=> b!1409150 m!1298755))

(declare-fun m!1298757 () Bool)

(assert (=> b!1409157 m!1298757))

(assert (=> b!1409157 m!1298757))

(declare-fun m!1298759 () Bool)

(assert (=> b!1409157 m!1298759))

(declare-fun m!1298761 () Bool)

(assert (=> start!121192 m!1298761))

(declare-fun m!1298763 () Bool)

(assert (=> start!121192 m!1298763))

(declare-fun m!1298765 () Bool)

(assert (=> b!1409151 m!1298765))

(declare-fun m!1298767 () Bool)

(assert (=> b!1409151 m!1298767))

(assert (=> b!1409151 m!1298767))

(declare-fun m!1298769 () Bool)

(assert (=> b!1409151 m!1298769))

(assert (=> b!1409151 m!1298769))

(assert (=> b!1409151 m!1298767))

(declare-fun m!1298771 () Bool)

(assert (=> b!1409151 m!1298771))

(declare-fun m!1298773 () Bool)

(assert (=> b!1409156 m!1298773))

(declare-fun m!1298775 () Bool)

(assert (=> b!1409152 m!1298775))

(assert (=> b!1409153 m!1298747))

(assert (=> b!1409153 m!1298747))

(declare-fun m!1298777 () Bool)

(assert (=> b!1409153 m!1298777))

(assert (=> b!1409154 m!1298747))

(assert (=> b!1409154 m!1298747))

(declare-fun m!1298779 () Bool)

(assert (=> b!1409154 m!1298779))

(push 1)

(assert (not b!1409156))

(assert (not b!1409157))

(assert (not b!1409151))

(assert (not start!121192))

(assert (not b!1409154))

(assert (not b!1409150))

(assert (not b!1409153))

(assert (not b!1409152))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

