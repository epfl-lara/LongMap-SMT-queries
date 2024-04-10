; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121606 () Bool)

(assert start!121606)

(declare-fun b!1412706 () Bool)

(declare-fun e!799466 () Bool)

(declare-fun e!799464 () Bool)

(assert (=> b!1412706 (= e!799466 (not e!799464))))

(declare-fun res!949703 () Bool)

(assert (=> b!1412706 (=> res!949703 e!799464)))

(declare-datatypes ((SeekEntryResult!10920 0))(
  ( (MissingZero!10920 (index!46060 (_ BitVec 32))) (Found!10920 (index!46061 (_ BitVec 32))) (Intermediate!10920 (undefined!11732 Bool) (index!46062 (_ BitVec 32)) (x!127647 (_ BitVec 32))) (Undefined!10920) (MissingVacant!10920 (index!46063 (_ BitVec 32))) )
))
(declare-fun lt!622522 () SeekEntryResult!10920)

(assert (=> b!1412706 (= res!949703 (or (not (is-Intermediate!10920 lt!622522)) (undefined!11732 lt!622522)))))

(declare-fun e!799462 () Bool)

(assert (=> b!1412706 e!799462))

(declare-fun res!949702 () Bool)

(assert (=> b!1412706 (=> (not res!949702) (not e!799462))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96544 0))(
  ( (array!96545 (arr!46609 (Array (_ BitVec 32) (_ BitVec 64))) (size!47159 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96544)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96544 (_ BitVec 32)) Bool)

(assert (=> b!1412706 (= res!949702 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47814 0))(
  ( (Unit!47815) )
))
(declare-fun lt!622526 () Unit!47814)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96544 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47814)

(assert (=> b!1412706 (= lt!622526 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622527 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96544 (_ BitVec 32)) SeekEntryResult!10920)

(assert (=> b!1412706 (= lt!622522 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622527 (select (arr!46609 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412706 (= lt!622527 (toIndex!0 (select (arr!46609 a!2901) j!112) mask!2840))))

(declare-fun res!949705 () Bool)

(assert (=> start!121606 (=> (not res!949705) (not e!799466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121606 (= res!949705 (validMask!0 mask!2840))))

(assert (=> start!121606 e!799466))

(assert (=> start!121606 true))

(declare-fun array_inv!35637 (array!96544) Bool)

(assert (=> start!121606 (array_inv!35637 a!2901)))

(declare-fun b!1412707 () Bool)

(declare-fun lt!622521 () (_ BitVec 64))

(declare-fun e!799465 () Bool)

(declare-fun lt!622523 () array!96544)

(declare-fun lt!622524 () SeekEntryResult!10920)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96544 (_ BitVec 32)) SeekEntryResult!10920)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96544 (_ BitVec 32)) SeekEntryResult!10920)

(assert (=> b!1412707 (= e!799465 (= (seekEntryOrOpen!0 lt!622521 lt!622523 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127647 lt!622524) (index!46062 lt!622524) (index!46062 lt!622524) (select (arr!46609 a!2901) j!112) lt!622523 mask!2840)))))

(declare-fun b!1412708 () Bool)

(declare-fun res!949696 () Bool)

(assert (=> b!1412708 (=> (not res!949696) (not e!799466))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412708 (= res!949696 (validKeyInArray!0 (select (arr!46609 a!2901) i!1037)))))

(declare-fun b!1412709 () Bool)

(assert (=> b!1412709 (= e!799462 (= (seekEntryOrOpen!0 (select (arr!46609 a!2901) j!112) a!2901 mask!2840) (Found!10920 j!112)))))

(declare-fun b!1412710 () Bool)

(declare-fun res!949698 () Bool)

(assert (=> b!1412710 (=> (not res!949698) (not e!799466))))

(assert (=> b!1412710 (= res!949698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412711 () Bool)

(declare-fun res!949704 () Bool)

(assert (=> b!1412711 (=> (not res!949704) (not e!799466))))

(assert (=> b!1412711 (= res!949704 (validKeyInArray!0 (select (arr!46609 a!2901) j!112)))))

(declare-fun b!1412712 () Bool)

(declare-fun e!799463 () Bool)

(assert (=> b!1412712 (= e!799464 e!799463)))

(declare-fun res!949701 () Bool)

(assert (=> b!1412712 (=> res!949701 e!799463)))

(assert (=> b!1412712 (= res!949701 (or (= lt!622522 lt!622524) (not (is-Intermediate!10920 lt!622524))))))

(assert (=> b!1412712 (= lt!622524 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622521 mask!2840) lt!622521 lt!622523 mask!2840))))

(assert (=> b!1412712 (= lt!622521 (select (store (arr!46609 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412712 (= lt!622523 (array!96545 (store (arr!46609 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47159 a!2901)))))

(declare-fun b!1412713 () Bool)

(declare-fun res!949700 () Bool)

(assert (=> b!1412713 (=> (not res!949700) (not e!799466))))

(declare-datatypes ((List!33128 0))(
  ( (Nil!33125) (Cons!33124 (h!34399 (_ BitVec 64)) (t!47822 List!33128)) )
))
(declare-fun arrayNoDuplicates!0 (array!96544 (_ BitVec 32) List!33128) Bool)

(assert (=> b!1412713 (= res!949700 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33125))))

(declare-fun b!1412714 () Bool)

(declare-fun res!949697 () Bool)

(assert (=> b!1412714 (=> (not res!949697) (not e!799466))))

(assert (=> b!1412714 (= res!949697 (and (= (size!47159 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47159 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47159 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412715 () Bool)

(assert (=> b!1412715 (= e!799463 true)))

(assert (=> b!1412715 e!799465))

(declare-fun res!949699 () Bool)

(assert (=> b!1412715 (=> (not res!949699) (not e!799465))))

(assert (=> b!1412715 (= res!949699 (and (not (undefined!11732 lt!622524)) (= (index!46062 lt!622524) i!1037) (bvslt (x!127647 lt!622524) (x!127647 lt!622522)) (= (select (store (arr!46609 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46062 lt!622524)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622525 () Unit!47814)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96544 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47814)

(assert (=> b!1412715 (= lt!622525 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622527 (x!127647 lt!622522) (index!46062 lt!622522) (x!127647 lt!622524) (index!46062 lt!622524) (undefined!11732 lt!622524) mask!2840))))

(assert (= (and start!121606 res!949705) b!1412714))

(assert (= (and b!1412714 res!949697) b!1412708))

(assert (= (and b!1412708 res!949696) b!1412711))

(assert (= (and b!1412711 res!949704) b!1412710))

(assert (= (and b!1412710 res!949698) b!1412713))

(assert (= (and b!1412713 res!949700) b!1412706))

(assert (= (and b!1412706 res!949702) b!1412709))

(assert (= (and b!1412706 (not res!949703)) b!1412712))

(assert (= (and b!1412712 (not res!949701)) b!1412715))

(assert (= (and b!1412715 res!949699) b!1412707))

(declare-fun m!1302837 () Bool)

(assert (=> b!1412708 m!1302837))

(assert (=> b!1412708 m!1302837))

(declare-fun m!1302839 () Bool)

(assert (=> b!1412708 m!1302839))

(declare-fun m!1302841 () Bool)

(assert (=> b!1412706 m!1302841))

(declare-fun m!1302843 () Bool)

(assert (=> b!1412706 m!1302843))

(assert (=> b!1412706 m!1302841))

(declare-fun m!1302845 () Bool)

(assert (=> b!1412706 m!1302845))

(assert (=> b!1412706 m!1302841))

(declare-fun m!1302847 () Bool)

(assert (=> b!1412706 m!1302847))

(declare-fun m!1302849 () Bool)

(assert (=> b!1412706 m!1302849))

(declare-fun m!1302851 () Bool)

(assert (=> b!1412715 m!1302851))

(declare-fun m!1302853 () Bool)

(assert (=> b!1412715 m!1302853))

(declare-fun m!1302855 () Bool)

(assert (=> b!1412715 m!1302855))

(declare-fun m!1302857 () Bool)

(assert (=> b!1412710 m!1302857))

(assert (=> b!1412711 m!1302841))

(assert (=> b!1412711 m!1302841))

(declare-fun m!1302859 () Bool)

(assert (=> b!1412711 m!1302859))

(declare-fun m!1302861 () Bool)

(assert (=> b!1412712 m!1302861))

(assert (=> b!1412712 m!1302861))

(declare-fun m!1302863 () Bool)

(assert (=> b!1412712 m!1302863))

(assert (=> b!1412712 m!1302851))

(declare-fun m!1302865 () Bool)

(assert (=> b!1412712 m!1302865))

(declare-fun m!1302867 () Bool)

(assert (=> b!1412713 m!1302867))

(assert (=> b!1412709 m!1302841))

(assert (=> b!1412709 m!1302841))

(declare-fun m!1302869 () Bool)

(assert (=> b!1412709 m!1302869))

(declare-fun m!1302871 () Bool)

(assert (=> b!1412707 m!1302871))

(assert (=> b!1412707 m!1302841))

(assert (=> b!1412707 m!1302841))

(declare-fun m!1302873 () Bool)

(assert (=> b!1412707 m!1302873))

(declare-fun m!1302875 () Bool)

(assert (=> start!121606 m!1302875))

(declare-fun m!1302877 () Bool)

(assert (=> start!121606 m!1302877))

(push 1)

