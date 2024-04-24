; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121050 () Bool)

(assert start!121050)

(declare-fun b!1407428 () Bool)

(declare-fun e!796704 () Bool)

(assert (=> b!1407428 (= e!796704 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96279 0))(
  ( (array!96280 (arr!46485 (Array (_ BitVec 32) (_ BitVec 64))) (size!47036 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96279)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10699 0))(
  ( (MissingZero!10699 (index!45173 (_ BitVec 32))) (Found!10699 (index!45174 (_ BitVec 32))) (Intermediate!10699 (undefined!11511 Bool) (index!45175 (_ BitVec 32)) (x!126925 (_ BitVec 32))) (Undefined!10699) (MissingVacant!10699 (index!45176 (_ BitVec 32))) )
))
(declare-fun lt!619727 () SeekEntryResult!10699)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96279 (_ BitVec 32)) SeekEntryResult!10699)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407428 (= lt!619727 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46485 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46485 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96280 (store (arr!46485 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47036 a!2901)) mask!2840))))

(declare-fun b!1407429 () Bool)

(declare-fun res!944963 () Bool)

(declare-fun e!796703 () Bool)

(assert (=> b!1407429 (=> (not res!944963) (not e!796703))))

(assert (=> b!1407429 (= res!944963 (and (= (size!47036 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47036 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47036 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407430 () Bool)

(declare-fun res!944968 () Bool)

(assert (=> b!1407430 (=> (not res!944968) (not e!796703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407430 (= res!944968 (validKeyInArray!0 (select (arr!46485 a!2901) j!112)))))

(declare-fun b!1407432 () Bool)

(declare-fun res!944965 () Bool)

(assert (=> b!1407432 (=> (not res!944965) (not e!796703))))

(declare-datatypes ((List!32991 0))(
  ( (Nil!32988) (Cons!32987 (h!34249 (_ BitVec 64)) (t!47677 List!32991)) )
))
(declare-fun arrayNoDuplicates!0 (array!96279 (_ BitVec 32) List!32991) Bool)

(assert (=> b!1407432 (= res!944965 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32988))))

(declare-fun b!1407433 () Bool)

(declare-fun res!944964 () Bool)

(assert (=> b!1407433 (=> (not res!944964) (not e!796703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96279 (_ BitVec 32)) Bool)

(assert (=> b!1407433 (= res!944964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407434 () Bool)

(declare-fun e!796706 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96279 (_ BitVec 32)) SeekEntryResult!10699)

(assert (=> b!1407434 (= e!796706 (= (seekEntryOrOpen!0 (select (arr!46485 a!2901) j!112) a!2901 mask!2840) (Found!10699 j!112)))))

(declare-fun b!1407435 () Bool)

(declare-fun res!944961 () Bool)

(assert (=> b!1407435 (=> (not res!944961) (not e!796703))))

(assert (=> b!1407435 (= res!944961 (validKeyInArray!0 (select (arr!46485 a!2901) i!1037)))))

(declare-fun res!944966 () Bool)

(assert (=> start!121050 (=> (not res!944966) (not e!796703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121050 (= res!944966 (validMask!0 mask!2840))))

(assert (=> start!121050 e!796703))

(assert (=> start!121050 true))

(declare-fun array_inv!35766 (array!96279) Bool)

(assert (=> start!121050 (array_inv!35766 a!2901)))

(declare-fun b!1407431 () Bool)

(assert (=> b!1407431 (= e!796703 (not e!796704))))

(declare-fun res!944967 () Bool)

(assert (=> b!1407431 (=> res!944967 e!796704)))

(declare-fun lt!619726 () SeekEntryResult!10699)

(assert (=> b!1407431 (= res!944967 (or (not (is-Intermediate!10699 lt!619726)) (undefined!11511 lt!619726)))))

(assert (=> b!1407431 e!796706))

(declare-fun res!944962 () Bool)

(assert (=> b!1407431 (=> (not res!944962) (not e!796706))))

(assert (=> b!1407431 (= res!944962 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47399 0))(
  ( (Unit!47400) )
))
(declare-fun lt!619725 () Unit!47399)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96279 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47399)

(assert (=> b!1407431 (= lt!619725 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1407431 (= lt!619726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46485 a!2901) j!112) mask!2840) (select (arr!46485 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!121050 res!944966) b!1407429))

(assert (= (and b!1407429 res!944963) b!1407435))

(assert (= (and b!1407435 res!944961) b!1407430))

(assert (= (and b!1407430 res!944968) b!1407433))

(assert (= (and b!1407433 res!944964) b!1407432))

(assert (= (and b!1407432 res!944965) b!1407431))

(assert (= (and b!1407431 res!944962) b!1407434))

(assert (= (and b!1407431 (not res!944967)) b!1407428))

(declare-fun m!1296741 () Bool)

(assert (=> b!1407430 m!1296741))

(assert (=> b!1407430 m!1296741))

(declare-fun m!1296743 () Bool)

(assert (=> b!1407430 m!1296743))

(assert (=> b!1407431 m!1296741))

(declare-fun m!1296745 () Bool)

(assert (=> b!1407431 m!1296745))

(assert (=> b!1407431 m!1296741))

(declare-fun m!1296747 () Bool)

(assert (=> b!1407431 m!1296747))

(assert (=> b!1407431 m!1296745))

(assert (=> b!1407431 m!1296741))

(declare-fun m!1296749 () Bool)

(assert (=> b!1407431 m!1296749))

(declare-fun m!1296751 () Bool)

(assert (=> b!1407431 m!1296751))

(assert (=> b!1407434 m!1296741))

(assert (=> b!1407434 m!1296741))

(declare-fun m!1296753 () Bool)

(assert (=> b!1407434 m!1296753))

(declare-fun m!1296755 () Bool)

(assert (=> b!1407432 m!1296755))

(declare-fun m!1296757 () Bool)

(assert (=> start!121050 m!1296757))

(declare-fun m!1296759 () Bool)

(assert (=> start!121050 m!1296759))

(declare-fun m!1296761 () Bool)

(assert (=> b!1407428 m!1296761))

(declare-fun m!1296763 () Bool)

(assert (=> b!1407428 m!1296763))

(assert (=> b!1407428 m!1296763))

(declare-fun m!1296765 () Bool)

(assert (=> b!1407428 m!1296765))

(assert (=> b!1407428 m!1296765))

(assert (=> b!1407428 m!1296763))

(declare-fun m!1296767 () Bool)

(assert (=> b!1407428 m!1296767))

(declare-fun m!1296769 () Bool)

(assert (=> b!1407435 m!1296769))

(assert (=> b!1407435 m!1296769))

(declare-fun m!1296771 () Bool)

(assert (=> b!1407435 m!1296771))

(declare-fun m!1296773 () Bool)

(assert (=> b!1407433 m!1296773))

(push 1)

(assert (not b!1407432))

(assert (not b!1407435))

(assert (not b!1407431))

(assert (not b!1407430))

(assert (not b!1407433))

(assert (not b!1407434))

(assert (not b!1407428))

(assert (not start!121050))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

