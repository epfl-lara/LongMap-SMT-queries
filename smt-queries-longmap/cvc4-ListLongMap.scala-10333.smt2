; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121486 () Bool)

(assert start!121486)

(declare-fun b!1411606 () Bool)

(declare-fun e!798820 () Bool)

(assert (=> b!1411606 (= e!798820 true)))

(declare-datatypes ((array!96487 0))(
  ( (array!96488 (arr!46582 (Array (_ BitVec 32) (_ BitVec 64))) (size!47132 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96487)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10893 0))(
  ( (MissingZero!10893 (index!45949 (_ BitVec 32))) (Found!10893 (index!45950 (_ BitVec 32))) (Intermediate!10893 (undefined!11705 Bool) (index!45951 (_ BitVec 32)) (x!127536 (_ BitVec 32))) (Undefined!10893) (MissingVacant!10893 (index!45952 (_ BitVec 32))) )
))
(declare-fun lt!621831 () SeekEntryResult!10893)

(declare-fun lt!621828 () SeekEntryResult!10893)

(assert (=> b!1411606 (and (not (undefined!11705 lt!621828)) (= (index!45951 lt!621828) i!1037) (bvslt (x!127536 lt!621828) (x!127536 lt!621831)) (= (select (store (arr!46582 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45951 lt!621828)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47760 0))(
  ( (Unit!47761) )
))
(declare-fun lt!621826 () Unit!47760)

(declare-fun lt!621830 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96487 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47760)

(assert (=> b!1411606 (= lt!621826 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621830 (x!127536 lt!621831) (index!45951 lt!621831) (x!127536 lt!621828) (index!45951 lt!621828) (undefined!11705 lt!621828) mask!2840))))

(declare-fun b!1411607 () Bool)

(declare-fun res!948836 () Bool)

(declare-fun e!798818 () Bool)

(assert (=> b!1411607 (=> (not res!948836) (not e!798818))))

(declare-datatypes ((List!33101 0))(
  ( (Nil!33098) (Cons!33097 (h!34369 (_ BitVec 64)) (t!47795 List!33101)) )
))
(declare-fun arrayNoDuplicates!0 (array!96487 (_ BitVec 32) List!33101) Bool)

(assert (=> b!1411607 (= res!948836 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33098))))

(declare-fun b!1411608 () Bool)

(declare-fun e!798821 () Bool)

(assert (=> b!1411608 (= e!798818 (not e!798821))))

(declare-fun res!948835 () Bool)

(assert (=> b!1411608 (=> res!948835 e!798821)))

(assert (=> b!1411608 (= res!948835 (or (not (is-Intermediate!10893 lt!621831)) (undefined!11705 lt!621831)))))

(declare-fun e!798817 () Bool)

(assert (=> b!1411608 e!798817))

(declare-fun res!948839 () Bool)

(assert (=> b!1411608 (=> (not res!948839) (not e!798817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96487 (_ BitVec 32)) Bool)

(assert (=> b!1411608 (= res!948839 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621829 () Unit!47760)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96487 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47760)

(assert (=> b!1411608 (= lt!621829 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96487 (_ BitVec 32)) SeekEntryResult!10893)

(assert (=> b!1411608 (= lt!621831 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621830 (select (arr!46582 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411608 (= lt!621830 (toIndex!0 (select (arr!46582 a!2901) j!112) mask!2840))))

(declare-fun b!1411609 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96487 (_ BitVec 32)) SeekEntryResult!10893)

(assert (=> b!1411609 (= e!798817 (= (seekEntryOrOpen!0 (select (arr!46582 a!2901) j!112) a!2901 mask!2840) (Found!10893 j!112)))))

(declare-fun b!1411610 () Bool)

(declare-fun res!948840 () Bool)

(assert (=> b!1411610 (=> (not res!948840) (not e!798818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411610 (= res!948840 (validKeyInArray!0 (select (arr!46582 a!2901) j!112)))))

(declare-fun b!1411611 () Bool)

(assert (=> b!1411611 (= e!798821 e!798820)))

(declare-fun res!948838 () Bool)

(assert (=> b!1411611 (=> res!948838 e!798820)))

(assert (=> b!1411611 (= res!948838 (or (= lt!621831 lt!621828) (not (is-Intermediate!10893 lt!621828))))))

(declare-fun lt!621827 () (_ BitVec 64))

(assert (=> b!1411611 (= lt!621828 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621827 mask!2840) lt!621827 (array!96488 (store (arr!46582 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47132 a!2901)) mask!2840))))

(assert (=> b!1411611 (= lt!621827 (select (store (arr!46582 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1411612 () Bool)

(declare-fun res!948834 () Bool)

(assert (=> b!1411612 (=> (not res!948834) (not e!798818))))

(assert (=> b!1411612 (= res!948834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!948837 () Bool)

(assert (=> start!121486 (=> (not res!948837) (not e!798818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121486 (= res!948837 (validMask!0 mask!2840))))

(assert (=> start!121486 e!798818))

(assert (=> start!121486 true))

(declare-fun array_inv!35610 (array!96487) Bool)

(assert (=> start!121486 (array_inv!35610 a!2901)))

(declare-fun b!1411613 () Bool)

(declare-fun res!948841 () Bool)

(assert (=> b!1411613 (=> (not res!948841) (not e!798818))))

(assert (=> b!1411613 (= res!948841 (validKeyInArray!0 (select (arr!46582 a!2901) i!1037)))))

(declare-fun b!1411614 () Bool)

(declare-fun res!948833 () Bool)

(assert (=> b!1411614 (=> (not res!948833) (not e!798818))))

(assert (=> b!1411614 (= res!948833 (and (= (size!47132 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47132 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47132 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121486 res!948837) b!1411614))

(assert (= (and b!1411614 res!948833) b!1411613))

(assert (= (and b!1411613 res!948841) b!1411610))

(assert (= (and b!1411610 res!948840) b!1411612))

(assert (= (and b!1411612 res!948834) b!1411607))

(assert (= (and b!1411607 res!948836) b!1411608))

(assert (= (and b!1411608 res!948839) b!1411609))

(assert (= (and b!1411608 (not res!948835)) b!1411611))

(assert (= (and b!1411611 (not res!948838)) b!1411606))

(declare-fun m!1301521 () Bool)

(assert (=> b!1411610 m!1301521))

(assert (=> b!1411610 m!1301521))

(declare-fun m!1301523 () Bool)

(assert (=> b!1411610 m!1301523))

(declare-fun m!1301525 () Bool)

(assert (=> start!121486 m!1301525))

(declare-fun m!1301527 () Bool)

(assert (=> start!121486 m!1301527))

(declare-fun m!1301529 () Bool)

(assert (=> b!1411612 m!1301529))

(assert (=> b!1411608 m!1301521))

(declare-fun m!1301531 () Bool)

(assert (=> b!1411608 m!1301531))

(declare-fun m!1301533 () Bool)

(assert (=> b!1411608 m!1301533))

(declare-fun m!1301535 () Bool)

(assert (=> b!1411608 m!1301535))

(assert (=> b!1411608 m!1301521))

(declare-fun m!1301537 () Bool)

(assert (=> b!1411608 m!1301537))

(assert (=> b!1411608 m!1301521))

(declare-fun m!1301539 () Bool)

(assert (=> b!1411607 m!1301539))

(declare-fun m!1301541 () Bool)

(assert (=> b!1411611 m!1301541))

(declare-fun m!1301543 () Bool)

(assert (=> b!1411611 m!1301543))

(assert (=> b!1411611 m!1301541))

(declare-fun m!1301545 () Bool)

(assert (=> b!1411611 m!1301545))

(declare-fun m!1301547 () Bool)

(assert (=> b!1411611 m!1301547))

(assert (=> b!1411609 m!1301521))

(assert (=> b!1411609 m!1301521))

(declare-fun m!1301549 () Bool)

(assert (=> b!1411609 m!1301549))

(assert (=> b!1411606 m!1301543))

(declare-fun m!1301551 () Bool)

(assert (=> b!1411606 m!1301551))

(declare-fun m!1301553 () Bool)

(assert (=> b!1411606 m!1301553))

(declare-fun m!1301555 () Bool)

(assert (=> b!1411613 m!1301555))

(assert (=> b!1411613 m!1301555))

(declare-fun m!1301557 () Bool)

(assert (=> b!1411613 m!1301557))

(push 1)

