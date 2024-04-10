; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121612 () Bool)

(assert start!121612)

(declare-fun res!949793 () Bool)

(declare-fun e!799515 () Bool)

(assert (=> start!121612 (=> (not res!949793) (not e!799515))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121612 (= res!949793 (validMask!0 mask!2840))))

(assert (=> start!121612 e!799515))

(assert (=> start!121612 true))

(declare-datatypes ((array!96550 0))(
  ( (array!96551 (arr!46612 (Array (_ BitVec 32) (_ BitVec 64))) (size!47162 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96550)

(declare-fun array_inv!35640 (array!96550) Bool)

(assert (=> start!121612 (array_inv!35640 a!2901)))

(declare-fun b!1412796 () Bool)

(declare-fun e!799517 () Bool)

(declare-fun e!799518 () Bool)

(assert (=> b!1412796 (= e!799517 e!799518)))

(declare-fun res!949790 () Bool)

(assert (=> b!1412796 (=> res!949790 e!799518)))

(declare-datatypes ((SeekEntryResult!10923 0))(
  ( (MissingZero!10923 (index!46072 (_ BitVec 32))) (Found!10923 (index!46073 (_ BitVec 32))) (Intermediate!10923 (undefined!11735 Bool) (index!46074 (_ BitVec 32)) (x!127658 (_ BitVec 32))) (Undefined!10923) (MissingVacant!10923 (index!46075 (_ BitVec 32))) )
))
(declare-fun lt!622586 () SeekEntryResult!10923)

(declare-fun lt!622588 () SeekEntryResult!10923)

(assert (=> b!1412796 (= res!949790 (or (= lt!622586 lt!622588) (not (is-Intermediate!10923 lt!622588))))))

(declare-fun lt!622587 () (_ BitVec 64))

(declare-fun lt!622590 () array!96550)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96550 (_ BitVec 32)) SeekEntryResult!10923)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412796 (= lt!622588 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622587 mask!2840) lt!622587 lt!622590 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1412796 (= lt!622587 (select (store (arr!46612 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412796 (= lt!622590 (array!96551 (store (arr!46612 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47162 a!2901)))))

(declare-fun e!799520 () Bool)

(declare-fun b!1412797 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96550 (_ BitVec 32)) SeekEntryResult!10923)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96550 (_ BitVec 32)) SeekEntryResult!10923)

(assert (=> b!1412797 (= e!799520 (= (seekEntryOrOpen!0 lt!622587 lt!622590 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127658 lt!622588) (index!46074 lt!622588) (index!46074 lt!622588) (select (arr!46612 a!2901) j!112) lt!622590 mask!2840)))))

(declare-fun b!1412798 () Bool)

(declare-fun res!949787 () Bool)

(assert (=> b!1412798 (=> (not res!949787) (not e!799515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412798 (= res!949787 (validKeyInArray!0 (select (arr!46612 a!2901) j!112)))))

(declare-fun e!799519 () Bool)

(declare-fun b!1412799 () Bool)

(assert (=> b!1412799 (= e!799519 (= (seekEntryOrOpen!0 (select (arr!46612 a!2901) j!112) a!2901 mask!2840) (Found!10923 j!112)))))

(declare-fun b!1412800 () Bool)

(assert (=> b!1412800 (= e!799515 (not e!799517))))

(declare-fun res!949795 () Bool)

(assert (=> b!1412800 (=> res!949795 e!799517)))

(assert (=> b!1412800 (= res!949795 (or (not (is-Intermediate!10923 lt!622586)) (undefined!11735 lt!622586)))))

(assert (=> b!1412800 e!799519))

(declare-fun res!949792 () Bool)

(assert (=> b!1412800 (=> (not res!949792) (not e!799519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96550 (_ BitVec 32)) Bool)

(assert (=> b!1412800 (= res!949792 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47820 0))(
  ( (Unit!47821) )
))
(declare-fun lt!622584 () Unit!47820)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96550 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47820)

(assert (=> b!1412800 (= lt!622584 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622585 () (_ BitVec 32))

(assert (=> b!1412800 (= lt!622586 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622585 (select (arr!46612 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412800 (= lt!622585 (toIndex!0 (select (arr!46612 a!2901) j!112) mask!2840))))

(declare-fun b!1412801 () Bool)

(declare-fun res!949786 () Bool)

(assert (=> b!1412801 (=> (not res!949786) (not e!799515))))

(declare-datatypes ((List!33131 0))(
  ( (Nil!33128) (Cons!33127 (h!34402 (_ BitVec 64)) (t!47825 List!33131)) )
))
(declare-fun arrayNoDuplicates!0 (array!96550 (_ BitVec 32) List!33131) Bool)

(assert (=> b!1412801 (= res!949786 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33128))))

(declare-fun b!1412802 () Bool)

(declare-fun res!949794 () Bool)

(assert (=> b!1412802 (=> (not res!949794) (not e!799515))))

(assert (=> b!1412802 (= res!949794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412803 () Bool)

(assert (=> b!1412803 (= e!799518 true)))

(assert (=> b!1412803 e!799520))

(declare-fun res!949788 () Bool)

(assert (=> b!1412803 (=> (not res!949788) (not e!799520))))

(assert (=> b!1412803 (= res!949788 (and (not (undefined!11735 lt!622588)) (= (index!46074 lt!622588) i!1037) (bvslt (x!127658 lt!622588) (x!127658 lt!622586)) (= (select (store (arr!46612 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46074 lt!622588)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622589 () Unit!47820)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96550 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47820)

(assert (=> b!1412803 (= lt!622589 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622585 (x!127658 lt!622586) (index!46074 lt!622586) (x!127658 lt!622588) (index!46074 lt!622588) (undefined!11735 lt!622588) mask!2840))))

(declare-fun b!1412804 () Bool)

(declare-fun res!949789 () Bool)

(assert (=> b!1412804 (=> (not res!949789) (not e!799515))))

(assert (=> b!1412804 (= res!949789 (and (= (size!47162 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47162 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47162 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412805 () Bool)

(declare-fun res!949791 () Bool)

(assert (=> b!1412805 (=> (not res!949791) (not e!799515))))

(assert (=> b!1412805 (= res!949791 (validKeyInArray!0 (select (arr!46612 a!2901) i!1037)))))

(assert (= (and start!121612 res!949793) b!1412804))

(assert (= (and b!1412804 res!949789) b!1412805))

(assert (= (and b!1412805 res!949791) b!1412798))

(assert (= (and b!1412798 res!949787) b!1412802))

(assert (= (and b!1412802 res!949794) b!1412801))

(assert (= (and b!1412801 res!949786) b!1412800))

(assert (= (and b!1412800 res!949792) b!1412799))

(assert (= (and b!1412800 (not res!949795)) b!1412796))

(assert (= (and b!1412796 (not res!949790)) b!1412803))

(assert (= (and b!1412803 res!949788) b!1412797))

(declare-fun m!1302963 () Bool)

(assert (=> b!1412800 m!1302963))

(declare-fun m!1302965 () Bool)

(assert (=> b!1412800 m!1302965))

(assert (=> b!1412800 m!1302963))

(declare-fun m!1302967 () Bool)

(assert (=> b!1412800 m!1302967))

(assert (=> b!1412800 m!1302963))

(declare-fun m!1302969 () Bool)

(assert (=> b!1412800 m!1302969))

(declare-fun m!1302971 () Bool)

(assert (=> b!1412800 m!1302971))

(assert (=> b!1412799 m!1302963))

(assert (=> b!1412799 m!1302963))

(declare-fun m!1302973 () Bool)

(assert (=> b!1412799 m!1302973))

(declare-fun m!1302975 () Bool)

(assert (=> b!1412803 m!1302975))

(declare-fun m!1302977 () Bool)

(assert (=> b!1412803 m!1302977))

(declare-fun m!1302979 () Bool)

(assert (=> b!1412803 m!1302979))

(declare-fun m!1302981 () Bool)

(assert (=> start!121612 m!1302981))

(declare-fun m!1302983 () Bool)

(assert (=> start!121612 m!1302983))

(declare-fun m!1302985 () Bool)

(assert (=> b!1412805 m!1302985))

(assert (=> b!1412805 m!1302985))

(declare-fun m!1302987 () Bool)

(assert (=> b!1412805 m!1302987))

(declare-fun m!1302989 () Bool)

(assert (=> b!1412801 m!1302989))

(declare-fun m!1302991 () Bool)

(assert (=> b!1412797 m!1302991))

(assert (=> b!1412797 m!1302963))

(assert (=> b!1412797 m!1302963))

(declare-fun m!1302993 () Bool)

(assert (=> b!1412797 m!1302993))

(declare-fun m!1302995 () Bool)

(assert (=> b!1412802 m!1302995))

(declare-fun m!1302997 () Bool)

(assert (=> b!1412796 m!1302997))

(assert (=> b!1412796 m!1302997))

(declare-fun m!1302999 () Bool)

(assert (=> b!1412796 m!1302999))

(assert (=> b!1412796 m!1302975))

(declare-fun m!1303001 () Bool)

(assert (=> b!1412796 m!1303001))

(assert (=> b!1412798 m!1302963))

(assert (=> b!1412798 m!1302963))

(declare-fun m!1303003 () Bool)

(assert (=> b!1412798 m!1303003))

(push 1)

