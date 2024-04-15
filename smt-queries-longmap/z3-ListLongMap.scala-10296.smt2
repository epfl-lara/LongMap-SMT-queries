; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121094 () Bool)

(assert start!121094)

(declare-fun b!1407898 () Bool)

(declare-fun res!945678 () Bool)

(declare-fun e!796850 () Bool)

(assert (=> b!1407898 (=> res!945678 e!796850)))

(declare-datatypes ((array!96201 0))(
  ( (array!96202 (arr!46444 (Array (_ BitVec 32) (_ BitVec 64))) (size!46996 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96201)

(declare-datatypes ((SeekEntryResult!10781 0))(
  ( (MissingZero!10781 (index!45501 (_ BitVec 32))) (Found!10781 (index!45502 (_ BitVec 32))) (Intermediate!10781 (undefined!11593 Bool) (index!45503 (_ BitVec 32)) (x!127107 (_ BitVec 32))) (Undefined!10781) (MissingVacant!10781 (index!45504 (_ BitVec 32))) )
))
(declare-fun lt!619831 () SeekEntryResult!10781)

(declare-fun lt!619834 () (_ BitVec 32))

(assert (=> b!1407898 (= res!945678 (or (bvslt (x!127107 lt!619831) #b00000000000000000000000000000000) (bvsgt (x!127107 lt!619831) #b01111111111111111111111111111110) (bvslt lt!619834 #b00000000000000000000000000000000) (bvsge lt!619834 (size!46996 a!2901)) (bvslt (index!45503 lt!619831) #b00000000000000000000000000000000) (bvsge (index!45503 lt!619831) (size!46996 a!2901)) (not (= lt!619831 (Intermediate!10781 false (index!45503 lt!619831) (x!127107 lt!619831))))))))

(declare-fun res!945677 () Bool)

(declare-fun e!796847 () Bool)

(assert (=> start!121094 (=> (not res!945677) (not e!796847))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121094 (= res!945677 (validMask!0 mask!2840))))

(assert (=> start!121094 e!796847))

(assert (=> start!121094 true))

(declare-fun array_inv!35677 (array!96201) Bool)

(assert (=> start!121094 (array_inv!35677 a!2901)))

(declare-fun b!1407899 () Bool)

(assert (=> b!1407899 (= e!796850 true)))

(declare-fun lt!619832 () array!96201)

(declare-fun lt!619833 () SeekEntryResult!10781)

(declare-fun lt!619829 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96201 (_ BitVec 32)) SeekEntryResult!10781)

(assert (=> b!1407899 (= lt!619833 (seekEntryOrOpen!0 lt!619829 lt!619832 mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((Unit!47379 0))(
  ( (Unit!47380) )
))
(declare-fun lt!619830 () Unit!47379)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47379)

(assert (=> b!1407899 (= lt!619830 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!619834 (x!127107 lt!619831) (index!45503 lt!619831) mask!2840))))

(declare-fun b!1407900 () Bool)

(declare-fun res!945675 () Bool)

(assert (=> b!1407900 (=> (not res!945675) (not e!796847))))

(declare-datatypes ((List!33041 0))(
  ( (Nil!33038) (Cons!33037 (h!34300 (_ BitVec 64)) (t!47727 List!33041)) )
))
(declare-fun arrayNoDuplicates!0 (array!96201 (_ BitVec 32) List!33041) Bool)

(assert (=> b!1407900 (= res!945675 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33038))))

(declare-fun b!1407901 () Bool)

(declare-fun res!945679 () Bool)

(assert (=> b!1407901 (=> (not res!945679) (not e!796847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407901 (= res!945679 (validKeyInArray!0 (select (arr!46444 a!2901) j!112)))))

(declare-fun b!1407902 () Bool)

(declare-fun res!945674 () Bool)

(assert (=> b!1407902 (=> (not res!945674) (not e!796847))))

(assert (=> b!1407902 (= res!945674 (validKeyInArray!0 (select (arr!46444 a!2901) i!1037)))))

(declare-fun b!1407903 () Bool)

(declare-fun res!945672 () Bool)

(assert (=> b!1407903 (=> (not res!945672) (not e!796847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96201 (_ BitVec 32)) Bool)

(assert (=> b!1407903 (= res!945672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407904 () Bool)

(declare-fun e!796849 () Bool)

(assert (=> b!1407904 (= e!796847 (not e!796849))))

(declare-fun res!945671 () Bool)

(assert (=> b!1407904 (=> res!945671 e!796849)))

(get-info :version)

(assert (=> b!1407904 (= res!945671 (or (not ((_ is Intermediate!10781) lt!619831)) (undefined!11593 lt!619831)))))

(assert (=> b!1407904 (= lt!619833 (Found!10781 j!112))))

(assert (=> b!1407904 (= lt!619833 (seekEntryOrOpen!0 (select (arr!46444 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1407904 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!619835 () Unit!47379)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47379)

(assert (=> b!1407904 (= lt!619835 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96201 (_ BitVec 32)) SeekEntryResult!10781)

(assert (=> b!1407904 (= lt!619831 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619834 (select (arr!46444 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407904 (= lt!619834 (toIndex!0 (select (arr!46444 a!2901) j!112) mask!2840))))

(declare-fun b!1407905 () Bool)

(declare-fun res!945676 () Bool)

(assert (=> b!1407905 (=> (not res!945676) (not e!796847))))

(assert (=> b!1407905 (= res!945676 (and (= (size!46996 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46996 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46996 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407906 () Bool)

(assert (=> b!1407906 (= e!796849 e!796850)))

(declare-fun res!945673 () Bool)

(assert (=> b!1407906 (=> res!945673 e!796850)))

(assert (=> b!1407906 (= res!945673 (not (= lt!619831 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!619829 mask!2840) lt!619829 lt!619832 mask!2840))))))

(assert (=> b!1407906 (= lt!619829 (select (store (arr!46444 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1407906 (= lt!619832 (array!96202 (store (arr!46444 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46996 a!2901)))))

(assert (= (and start!121094 res!945677) b!1407905))

(assert (= (and b!1407905 res!945676) b!1407902))

(assert (= (and b!1407902 res!945674) b!1407901))

(assert (= (and b!1407901 res!945679) b!1407903))

(assert (= (and b!1407903 res!945672) b!1407900))

(assert (= (and b!1407900 res!945675) b!1407904))

(assert (= (and b!1407904 (not res!945671)) b!1407906))

(assert (= (and b!1407906 (not res!945673)) b!1407898))

(assert (= (and b!1407898 (not res!945678)) b!1407899))

(declare-fun m!1296553 () Bool)

(assert (=> b!1407899 m!1296553))

(declare-fun m!1296555 () Bool)

(assert (=> b!1407899 m!1296555))

(declare-fun m!1296557 () Bool)

(assert (=> b!1407906 m!1296557))

(assert (=> b!1407906 m!1296557))

(declare-fun m!1296559 () Bool)

(assert (=> b!1407906 m!1296559))

(declare-fun m!1296561 () Bool)

(assert (=> b!1407906 m!1296561))

(declare-fun m!1296563 () Bool)

(assert (=> b!1407906 m!1296563))

(declare-fun m!1296565 () Bool)

(assert (=> b!1407903 m!1296565))

(declare-fun m!1296567 () Bool)

(assert (=> b!1407904 m!1296567))

(declare-fun m!1296569 () Bool)

(assert (=> b!1407904 m!1296569))

(assert (=> b!1407904 m!1296567))

(declare-fun m!1296571 () Bool)

(assert (=> b!1407904 m!1296571))

(assert (=> b!1407904 m!1296567))

(declare-fun m!1296573 () Bool)

(assert (=> b!1407904 m!1296573))

(assert (=> b!1407904 m!1296567))

(declare-fun m!1296575 () Bool)

(assert (=> b!1407904 m!1296575))

(declare-fun m!1296577 () Bool)

(assert (=> b!1407904 m!1296577))

(assert (=> b!1407901 m!1296567))

(assert (=> b!1407901 m!1296567))

(declare-fun m!1296579 () Bool)

(assert (=> b!1407901 m!1296579))

(declare-fun m!1296581 () Bool)

(assert (=> b!1407902 m!1296581))

(assert (=> b!1407902 m!1296581))

(declare-fun m!1296583 () Bool)

(assert (=> b!1407902 m!1296583))

(declare-fun m!1296585 () Bool)

(assert (=> b!1407900 m!1296585))

(declare-fun m!1296587 () Bool)

(assert (=> start!121094 m!1296587))

(declare-fun m!1296589 () Bool)

(assert (=> start!121094 m!1296589))

(check-sat (not b!1407899) (not b!1407902) (not b!1407906) (not b!1407904) (not b!1407901) (not b!1407900) (not start!121094) (not b!1407903))
(check-sat)
