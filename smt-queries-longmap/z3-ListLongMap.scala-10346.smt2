; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121622 () Bool)

(assert start!121622)

(declare-fun b!1412925 () Bool)

(declare-fun e!799605 () Bool)

(assert (=> b!1412925 (= e!799605 true)))

(declare-fun e!799606 () Bool)

(assert (=> b!1412925 e!799606))

(declare-fun res!949970 () Bool)

(assert (=> b!1412925 (=> (not res!949970) (not e!799606))))

(declare-datatypes ((array!96513 0))(
  ( (array!96514 (arr!46594 (Array (_ BitVec 32) (_ BitVec 64))) (size!47146 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96513)

(declare-datatypes ((SeekEntryResult!10931 0))(
  ( (MissingZero!10931 (index!46104 (_ BitVec 32))) (Found!10931 (index!46105 (_ BitVec 32))) (Intermediate!10931 (undefined!11743 Bool) (index!46106 (_ BitVec 32)) (x!127687 (_ BitVec 32))) (Undefined!10931) (MissingVacant!10931 (index!46107 (_ BitVec 32))) )
))
(declare-fun lt!622546 () SeekEntryResult!10931)

(declare-fun lt!622544 () SeekEntryResult!10931)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1412925 (= res!949970 (and (not (undefined!11743 lt!622546)) (= (index!46106 lt!622546) i!1037) (bvslt (x!127687 lt!622546) (x!127687 lt!622544)) (= (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46106 lt!622546)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622547 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47679 0))(
  ( (Unit!47680) )
))
(declare-fun lt!622545 () Unit!47679)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96513 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47679)

(assert (=> b!1412925 (= lt!622545 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622547 (x!127687 lt!622544) (index!46106 lt!622544) (x!127687 lt!622546) (index!46106 lt!622546) (undefined!11743 lt!622546) mask!2840))))

(declare-fun b!1412926 () Bool)

(declare-fun res!949974 () Bool)

(declare-fun e!799607 () Bool)

(assert (=> b!1412926 (=> (not res!949974) (not e!799607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412926 (= res!949974 (validKeyInArray!0 (select (arr!46594 a!2901) i!1037)))))

(declare-fun b!1412927 () Bool)

(declare-fun res!949973 () Bool)

(assert (=> b!1412927 (=> (not res!949973) (not e!799607))))

(assert (=> b!1412927 (= res!949973 (validKeyInArray!0 (select (arr!46594 a!2901) j!112)))))

(declare-fun b!1412928 () Bool)

(declare-fun e!799604 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96513 (_ BitVec 32)) SeekEntryResult!10931)

(assert (=> b!1412928 (= e!799604 (= (seekEntryOrOpen!0 (select (arr!46594 a!2901) j!112) a!2901 mask!2840) (Found!10931 j!112)))))

(declare-fun b!1412929 () Bool)

(declare-fun res!949968 () Bool)

(assert (=> b!1412929 (=> (not res!949968) (not e!799607))))

(declare-datatypes ((List!33191 0))(
  ( (Nil!33188) (Cons!33187 (h!34462 (_ BitVec 64)) (t!47877 List!33191)) )
))
(declare-fun arrayNoDuplicates!0 (array!96513 (_ BitVec 32) List!33191) Bool)

(assert (=> b!1412929 (= res!949968 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33188))))

(declare-fun b!1412930 () Bool)

(declare-fun e!799602 () Bool)

(assert (=> b!1412930 (= e!799607 (not e!799602))))

(declare-fun res!949966 () Bool)

(assert (=> b!1412930 (=> res!949966 e!799602)))

(get-info :version)

(assert (=> b!1412930 (= res!949966 (or (not ((_ is Intermediate!10931) lt!622544)) (undefined!11743 lt!622544)))))

(assert (=> b!1412930 e!799604))

(declare-fun res!949967 () Bool)

(assert (=> b!1412930 (=> (not res!949967) (not e!799604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96513 (_ BitVec 32)) Bool)

(assert (=> b!1412930 (= res!949967 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622541 () Unit!47679)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96513 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47679)

(assert (=> b!1412930 (= lt!622541 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96513 (_ BitVec 32)) SeekEntryResult!10931)

(assert (=> b!1412930 (= lt!622544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622547 (select (arr!46594 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412930 (= lt!622547 (toIndex!0 (select (arr!46594 a!2901) j!112) mask!2840))))

(declare-fun b!1412931 () Bool)

(declare-fun res!949972 () Bool)

(assert (=> b!1412931 (=> (not res!949972) (not e!799607))))

(assert (=> b!1412931 (= res!949972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!949969 () Bool)

(assert (=> start!121622 (=> (not res!949969) (not e!799607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121622 (= res!949969 (validMask!0 mask!2840))))

(assert (=> start!121622 e!799607))

(assert (=> start!121622 true))

(declare-fun array_inv!35827 (array!96513) Bool)

(assert (=> start!121622 (array_inv!35827 a!2901)))

(declare-fun b!1412932 () Bool)

(declare-fun res!949975 () Bool)

(assert (=> b!1412932 (=> (not res!949975) (not e!799607))))

(assert (=> b!1412932 (= res!949975 (and (= (size!47146 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47146 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47146 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412933 () Bool)

(assert (=> b!1412933 (= e!799602 e!799605)))

(declare-fun res!949971 () Bool)

(assert (=> b!1412933 (=> res!949971 e!799605)))

(assert (=> b!1412933 (= res!949971 (or (= lt!622544 lt!622546) (not ((_ is Intermediate!10931) lt!622546))))))

(declare-fun lt!622543 () array!96513)

(declare-fun lt!622542 () (_ BitVec 64))

(assert (=> b!1412933 (= lt!622546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622542 mask!2840) lt!622542 lt!622543 mask!2840))))

(assert (=> b!1412933 (= lt!622542 (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412933 (= lt!622543 (array!96514 (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47146 a!2901)))))

(declare-fun b!1412934 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96513 (_ BitVec 32)) SeekEntryResult!10931)

(assert (=> b!1412934 (= e!799606 (= (seekEntryOrOpen!0 lt!622542 lt!622543 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127687 lt!622546) (index!46106 lt!622546) (index!46106 lt!622546) (select (arr!46594 a!2901) j!112) lt!622543 mask!2840)))))

(assert (= (and start!121622 res!949969) b!1412932))

(assert (= (and b!1412932 res!949975) b!1412926))

(assert (= (and b!1412926 res!949974) b!1412927))

(assert (= (and b!1412927 res!949973) b!1412931))

(assert (= (and b!1412931 res!949972) b!1412929))

(assert (= (and b!1412929 res!949968) b!1412930))

(assert (= (and b!1412930 res!949967) b!1412928))

(assert (= (and b!1412930 (not res!949966)) b!1412933))

(assert (= (and b!1412933 (not res!949971)) b!1412925))

(assert (= (and b!1412925 res!949970) b!1412934))

(declare-fun m!1302721 () Bool)

(assert (=> b!1412926 m!1302721))

(assert (=> b!1412926 m!1302721))

(declare-fun m!1302723 () Bool)

(assert (=> b!1412926 m!1302723))

(declare-fun m!1302725 () Bool)

(assert (=> b!1412931 m!1302725))

(declare-fun m!1302727 () Bool)

(assert (=> b!1412930 m!1302727))

(declare-fun m!1302729 () Bool)

(assert (=> b!1412930 m!1302729))

(assert (=> b!1412930 m!1302727))

(assert (=> b!1412930 m!1302727))

(declare-fun m!1302731 () Bool)

(assert (=> b!1412930 m!1302731))

(declare-fun m!1302733 () Bool)

(assert (=> b!1412930 m!1302733))

(declare-fun m!1302735 () Bool)

(assert (=> b!1412930 m!1302735))

(declare-fun m!1302737 () Bool)

(assert (=> b!1412933 m!1302737))

(assert (=> b!1412933 m!1302737))

(declare-fun m!1302739 () Bool)

(assert (=> b!1412933 m!1302739))

(declare-fun m!1302741 () Bool)

(assert (=> b!1412933 m!1302741))

(declare-fun m!1302743 () Bool)

(assert (=> b!1412933 m!1302743))

(declare-fun m!1302745 () Bool)

(assert (=> b!1412934 m!1302745))

(assert (=> b!1412934 m!1302727))

(assert (=> b!1412934 m!1302727))

(declare-fun m!1302747 () Bool)

(assert (=> b!1412934 m!1302747))

(declare-fun m!1302749 () Bool)

(assert (=> b!1412929 m!1302749))

(declare-fun m!1302751 () Bool)

(assert (=> start!121622 m!1302751))

(declare-fun m!1302753 () Bool)

(assert (=> start!121622 m!1302753))

(assert (=> b!1412925 m!1302741))

(declare-fun m!1302755 () Bool)

(assert (=> b!1412925 m!1302755))

(declare-fun m!1302757 () Bool)

(assert (=> b!1412925 m!1302757))

(assert (=> b!1412927 m!1302727))

(assert (=> b!1412927 m!1302727))

(declare-fun m!1302759 () Bool)

(assert (=> b!1412927 m!1302759))

(assert (=> b!1412928 m!1302727))

(assert (=> b!1412928 m!1302727))

(declare-fun m!1302761 () Bool)

(assert (=> b!1412928 m!1302761))

(check-sat (not b!1412933) (not b!1412927) (not b!1412929) (not b!1412931) (not b!1412928) (not b!1412930) (not start!121622) (not b!1412925) (not b!1412926) (not b!1412934))
(check-sat)
