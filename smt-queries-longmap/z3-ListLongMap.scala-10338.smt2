; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121766 () Bool)

(assert start!121766)

(declare-fun b!1413426 () Bool)

(declare-fun e!799947 () Bool)

(declare-fun e!799950 () Bool)

(assert (=> b!1413426 (= e!799947 (not e!799950))))

(declare-fun res!949741 () Bool)

(assert (=> b!1413426 (=> res!949741 e!799950)))

(declare-datatypes ((SeekEntryResult!10862 0))(
  ( (MissingZero!10862 (index!45828 (_ BitVec 32))) (Found!10862 (index!45829 (_ BitVec 32))) (Intermediate!10862 (undefined!11674 Bool) (index!45830 (_ BitVec 32)) (x!127576 (_ BitVec 32))) (Undefined!10862) (MissingVacant!10862 (index!45831 (_ BitVec 32))) )
))
(declare-fun lt!622628 () SeekEntryResult!10862)

(get-info :version)

(assert (=> b!1413426 (= res!949741 (or (not ((_ is Intermediate!10862) lt!622628)) (undefined!11674 lt!622628)))))

(declare-fun e!799948 () Bool)

(assert (=> b!1413426 e!799948))

(declare-fun res!949737 () Bool)

(assert (=> b!1413426 (=> (not res!949737) (not e!799948))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96626 0))(
  ( (array!96627 (arr!46648 (Array (_ BitVec 32) (_ BitVec 64))) (size!47199 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96626)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96626 (_ BitVec 32)) Bool)

(assert (=> b!1413426 (= res!949737 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47725 0))(
  ( (Unit!47726) )
))
(declare-fun lt!622629 () Unit!47725)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47725)

(assert (=> b!1413426 (= lt!622629 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622630 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96626 (_ BitVec 32)) SeekEntryResult!10862)

(assert (=> b!1413426 (= lt!622628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622630 (select (arr!46648 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413426 (= lt!622630 (toIndex!0 (select (arr!46648 a!2901) j!112) mask!2840))))

(declare-fun res!949734 () Bool)

(assert (=> start!121766 (=> (not res!949734) (not e!799947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121766 (= res!949734 (validMask!0 mask!2840))))

(assert (=> start!121766 e!799947))

(assert (=> start!121766 true))

(declare-fun array_inv!35929 (array!96626) Bool)

(assert (=> start!121766 (array_inv!35929 a!2901)))

(declare-fun b!1413427 () Bool)

(declare-fun res!949739 () Bool)

(assert (=> b!1413427 (=> (not res!949739) (not e!799947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413427 (= res!949739 (validKeyInArray!0 (select (arr!46648 a!2901) j!112)))))

(declare-fun b!1413428 () Bool)

(declare-fun e!799952 () Bool)

(assert (=> b!1413428 (= e!799952 true)))

(declare-fun e!799951 () Bool)

(assert (=> b!1413428 e!799951))

(declare-fun res!949736 () Bool)

(assert (=> b!1413428 (=> (not res!949736) (not e!799951))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!622631 () SeekEntryResult!10862)

(assert (=> b!1413428 (= res!949736 (and (not (undefined!11674 lt!622631)) (= (index!45830 lt!622631) i!1037) (bvslt (x!127576 lt!622631) (x!127576 lt!622628)) (= (select (store (arr!46648 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45830 lt!622631)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622626 () Unit!47725)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47725)

(assert (=> b!1413428 (= lt!622626 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622630 (x!127576 lt!622628) (index!45830 lt!622628) (x!127576 lt!622631) (index!45830 lt!622631) (undefined!11674 lt!622631) mask!2840))))

(declare-fun b!1413429 () Bool)

(declare-fun res!949735 () Bool)

(assert (=> b!1413429 (=> (not res!949735) (not e!799947))))

(assert (=> b!1413429 (= res!949735 (and (= (size!47199 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47199 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47199 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413430 () Bool)

(declare-fun res!949733 () Bool)

(assert (=> b!1413430 (=> (not res!949733) (not e!799947))))

(assert (=> b!1413430 (= res!949733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun lt!622627 () array!96626)

(declare-fun lt!622625 () (_ BitVec 64))

(declare-fun b!1413431 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96626 (_ BitVec 32)) SeekEntryResult!10862)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96626 (_ BitVec 32)) SeekEntryResult!10862)

(assert (=> b!1413431 (= e!799951 (= (seekEntryOrOpen!0 lt!622625 lt!622627 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127576 lt!622631) (index!45830 lt!622631) (index!45830 lt!622631) (select (arr!46648 a!2901) j!112) lt!622627 mask!2840)))))

(declare-fun b!1413432 () Bool)

(assert (=> b!1413432 (= e!799950 e!799952)))

(declare-fun res!949740 () Bool)

(assert (=> b!1413432 (=> res!949740 e!799952)))

(assert (=> b!1413432 (= res!949740 (or (= lt!622628 lt!622631) (not ((_ is Intermediate!10862) lt!622631))))))

(assert (=> b!1413432 (= lt!622631 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622625 mask!2840) lt!622625 lt!622627 mask!2840))))

(assert (=> b!1413432 (= lt!622625 (select (store (arr!46648 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413432 (= lt!622627 (array!96627 (store (arr!46648 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47199 a!2901)))))

(declare-fun b!1413433 () Bool)

(declare-fun res!949738 () Bool)

(assert (=> b!1413433 (=> (not res!949738) (not e!799947))))

(assert (=> b!1413433 (= res!949738 (validKeyInArray!0 (select (arr!46648 a!2901) i!1037)))))

(declare-fun b!1413434 () Bool)

(assert (=> b!1413434 (= e!799948 (= (seekEntryOrOpen!0 (select (arr!46648 a!2901) j!112) a!2901 mask!2840) (Found!10862 j!112)))))

(declare-fun b!1413435 () Bool)

(declare-fun res!949732 () Bool)

(assert (=> b!1413435 (=> (not res!949732) (not e!799947))))

(declare-datatypes ((List!33154 0))(
  ( (Nil!33151) (Cons!33150 (h!34433 (_ BitVec 64)) (t!47840 List!33154)) )
))
(declare-fun arrayNoDuplicates!0 (array!96626 (_ BitVec 32) List!33154) Bool)

(assert (=> b!1413435 (= res!949732 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33151))))

(assert (= (and start!121766 res!949734) b!1413429))

(assert (= (and b!1413429 res!949735) b!1413433))

(assert (= (and b!1413433 res!949738) b!1413427))

(assert (= (and b!1413427 res!949739) b!1413430))

(assert (= (and b!1413430 res!949733) b!1413435))

(assert (= (and b!1413435 res!949732) b!1413426))

(assert (= (and b!1413426 res!949737) b!1413434))

(assert (= (and b!1413426 (not res!949741)) b!1413432))

(assert (= (and b!1413432 (not res!949740)) b!1413428))

(assert (= (and b!1413428 res!949736) b!1413431))

(declare-fun m!1303621 () Bool)

(assert (=> b!1413426 m!1303621))

(declare-fun m!1303623 () Bool)

(assert (=> b!1413426 m!1303623))

(assert (=> b!1413426 m!1303621))

(declare-fun m!1303625 () Bool)

(assert (=> b!1413426 m!1303625))

(assert (=> b!1413426 m!1303621))

(declare-fun m!1303627 () Bool)

(assert (=> b!1413426 m!1303627))

(declare-fun m!1303629 () Bool)

(assert (=> b!1413426 m!1303629))

(declare-fun m!1303631 () Bool)

(assert (=> b!1413428 m!1303631))

(declare-fun m!1303633 () Bool)

(assert (=> b!1413428 m!1303633))

(declare-fun m!1303635 () Bool)

(assert (=> b!1413428 m!1303635))

(declare-fun m!1303637 () Bool)

(assert (=> b!1413430 m!1303637))

(declare-fun m!1303639 () Bool)

(assert (=> b!1413432 m!1303639))

(assert (=> b!1413432 m!1303639))

(declare-fun m!1303641 () Bool)

(assert (=> b!1413432 m!1303641))

(assert (=> b!1413432 m!1303631))

(declare-fun m!1303643 () Bool)

(assert (=> b!1413432 m!1303643))

(declare-fun m!1303645 () Bool)

(assert (=> start!121766 m!1303645))

(declare-fun m!1303647 () Bool)

(assert (=> start!121766 m!1303647))

(declare-fun m!1303649 () Bool)

(assert (=> b!1413435 m!1303649))

(declare-fun m!1303651 () Bool)

(assert (=> b!1413431 m!1303651))

(assert (=> b!1413431 m!1303621))

(assert (=> b!1413431 m!1303621))

(declare-fun m!1303653 () Bool)

(assert (=> b!1413431 m!1303653))

(declare-fun m!1303655 () Bool)

(assert (=> b!1413433 m!1303655))

(assert (=> b!1413433 m!1303655))

(declare-fun m!1303657 () Bool)

(assert (=> b!1413433 m!1303657))

(assert (=> b!1413434 m!1303621))

(assert (=> b!1413434 m!1303621))

(declare-fun m!1303659 () Bool)

(assert (=> b!1413434 m!1303659))

(assert (=> b!1413427 m!1303621))

(assert (=> b!1413427 m!1303621))

(declare-fun m!1303661 () Bool)

(assert (=> b!1413427 m!1303661))

(check-sat (not b!1413427) (not b!1413432) (not b!1413428) (not b!1413433) (not b!1413431) (not b!1413434) (not b!1413435) (not b!1413426) (not b!1413430) (not start!121766))
(check-sat)
