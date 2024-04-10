; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130094 () Bool)

(assert start!130094)

(declare-fun b!1526860 () Bool)

(declare-fun res!1044897 () Bool)

(declare-fun e!851044 () Bool)

(assert (=> b!1526860 (=> (not res!1044897) (not e!851044))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101507 0))(
  ( (array!101508 (arr!48980 (Array (_ BitVec 32) (_ BitVec 64))) (size!49530 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101507)

(assert (=> b!1526860 (= res!1044897 (and (= (size!49530 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49530 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49530 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526862 () Bool)

(declare-fun e!851045 () Bool)

(declare-fun e!851041 () Bool)

(assert (=> b!1526862 (= e!851045 e!851041)))

(declare-fun res!1044900 () Bool)

(assert (=> b!1526862 (=> (not res!1044900) (not e!851041))))

(declare-datatypes ((SeekEntryResult!13145 0))(
  ( (MissingZero!13145 (index!54975 (_ BitVec 32))) (Found!13145 (index!54976 (_ BitVec 32))) (Intermediate!13145 (undefined!13957 Bool) (index!54977 (_ BitVec 32)) (x!136671 (_ BitVec 32))) (Undefined!13145) (MissingVacant!13145 (index!54978 (_ BitVec 32))) )
))
(declare-fun lt!661225 () SeekEntryResult!13145)

(declare-fun lt!661228 () array!101507)

(declare-fun lt!661226 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101507 (_ BitVec 32)) SeekEntryResult!13145)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526862 (= res!1044900 (= lt!661225 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661226 mask!2512) lt!661226 lt!661228 mask!2512)))))

(assert (=> b!1526862 (= lt!661226 (select (store (arr!48980 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526862 (= lt!661228 (array!101508 (store (arr!48980 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49530 a!2804)))))

(declare-fun b!1526863 () Bool)

(declare-fun res!1044896 () Bool)

(assert (=> b!1526863 (=> (not res!1044896) (not e!851044))))

(declare-datatypes ((List!35463 0))(
  ( (Nil!35460) (Cons!35459 (h!36892 (_ BitVec 64)) (t!50157 List!35463)) )
))
(declare-fun arrayNoDuplicates!0 (array!101507 (_ BitVec 32) List!35463) Bool)

(assert (=> b!1526863 (= res!1044896 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35460))))

(declare-fun b!1526864 () Bool)

(declare-fun res!1044907 () Bool)

(declare-fun e!851046 () Bool)

(assert (=> b!1526864 (=> (not res!1044907) (not e!851046))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101507 (_ BitVec 32)) SeekEntryResult!13145)

(assert (=> b!1526864 (= res!1044907 (= (seekEntry!0 (select (arr!48980 a!2804) j!70) a!2804 mask!2512) (Found!13145 j!70)))))

(declare-fun b!1526865 () Bool)

(declare-fun e!851043 () Bool)

(declare-fun e!851047 () Bool)

(assert (=> b!1526865 (= e!851043 e!851047)))

(declare-fun res!1044894 () Bool)

(assert (=> b!1526865 (=> (not res!1044894) (not e!851047))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101507 (_ BitVec 32)) SeekEntryResult!13145)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101507 (_ BitVec 32)) SeekEntryResult!13145)

(assert (=> b!1526865 (= res!1044894 (= (seekEntryOrOpen!0 (select (arr!48980 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48980 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526866 () Bool)

(declare-fun res!1044895 () Bool)

(assert (=> b!1526866 (=> (not res!1044895) (not e!851044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526866 (= res!1044895 (validKeyInArray!0 (select (arr!48980 a!2804) j!70)))))

(declare-fun b!1526867 () Bool)

(declare-fun res!1044901 () Bool)

(assert (=> b!1526867 (=> (not res!1044901) (not e!851044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101507 (_ BitVec 32)) Bool)

(assert (=> b!1526867 (= res!1044901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526868 () Bool)

(declare-fun res!1044906 () Bool)

(assert (=> b!1526868 (=> (not res!1044906) (not e!851045))))

(declare-fun lt!661224 () SeekEntryResult!13145)

(assert (=> b!1526868 (= res!1044906 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48980 a!2804) j!70) a!2804 mask!2512) lt!661224))))

(declare-fun b!1526869 () Bool)

(declare-fun res!1044899 () Bool)

(assert (=> b!1526869 (=> (not res!1044899) (not e!851044))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526869 (= res!1044899 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49530 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49530 a!2804))))))

(declare-fun b!1526870 () Bool)

(declare-fun res!1044904 () Bool)

(assert (=> b!1526870 (=> (not res!1044904) (not e!851044))))

(assert (=> b!1526870 (= res!1044904 (validKeyInArray!0 (select (arr!48980 a!2804) i!961)))))

(declare-fun b!1526871 () Bool)

(assert (=> b!1526871 (= e!851047 (= (seekEntryOrOpen!0 lt!661226 lt!661228 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661226 lt!661228 mask!2512)))))

(declare-fun b!1526872 () Bool)

(assert (=> b!1526872 (= e!851046 e!851043)))

(declare-fun res!1044903 () Bool)

(assert (=> b!1526872 (=> res!1044903 e!851043)))

(assert (=> b!1526872 (= res!1044903 (or (not (= (select (arr!48980 a!2804) j!70) lt!661226)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48980 a!2804) index!487) (select (arr!48980 a!2804) j!70)) (not (= (select (arr!48980 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526873 () Bool)

(assert (=> b!1526873 (= e!851041 (not true))))

(assert (=> b!1526873 e!851046))

(declare-fun res!1044898 () Bool)

(assert (=> b!1526873 (=> (not res!1044898) (not e!851046))))

(assert (=> b!1526873 (= res!1044898 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51074 0))(
  ( (Unit!51075) )
))
(declare-fun lt!661227 () Unit!51074)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101507 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51074)

(assert (=> b!1526873 (= lt!661227 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526861 () Bool)

(assert (=> b!1526861 (= e!851044 e!851045)))

(declare-fun res!1044905 () Bool)

(assert (=> b!1526861 (=> (not res!1044905) (not e!851045))))

(assert (=> b!1526861 (= res!1044905 (= lt!661225 lt!661224))))

(assert (=> b!1526861 (= lt!661224 (Intermediate!13145 false resIndex!21 resX!21))))

(assert (=> b!1526861 (= lt!661225 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48980 a!2804) j!70) mask!2512) (select (arr!48980 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1044902 () Bool)

(assert (=> start!130094 (=> (not res!1044902) (not e!851044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130094 (= res!1044902 (validMask!0 mask!2512))))

(assert (=> start!130094 e!851044))

(assert (=> start!130094 true))

(declare-fun array_inv!38008 (array!101507) Bool)

(assert (=> start!130094 (array_inv!38008 a!2804)))

(assert (= (and start!130094 res!1044902) b!1526860))

(assert (= (and b!1526860 res!1044897) b!1526870))

(assert (= (and b!1526870 res!1044904) b!1526866))

(assert (= (and b!1526866 res!1044895) b!1526867))

(assert (= (and b!1526867 res!1044901) b!1526863))

(assert (= (and b!1526863 res!1044896) b!1526869))

(assert (= (and b!1526869 res!1044899) b!1526861))

(assert (= (and b!1526861 res!1044905) b!1526868))

(assert (= (and b!1526868 res!1044906) b!1526862))

(assert (= (and b!1526862 res!1044900) b!1526873))

(assert (= (and b!1526873 res!1044898) b!1526864))

(assert (= (and b!1526864 res!1044907) b!1526872))

(assert (= (and b!1526872 (not res!1044903)) b!1526865))

(assert (= (and b!1526865 res!1044894) b!1526871))

(declare-fun m!1409703 () Bool)

(assert (=> b!1526864 m!1409703))

(assert (=> b!1526864 m!1409703))

(declare-fun m!1409705 () Bool)

(assert (=> b!1526864 m!1409705))

(declare-fun m!1409707 () Bool)

(assert (=> b!1526873 m!1409707))

(declare-fun m!1409709 () Bool)

(assert (=> b!1526873 m!1409709))

(declare-fun m!1409711 () Bool)

(assert (=> b!1526867 m!1409711))

(declare-fun m!1409713 () Bool)

(assert (=> b!1526862 m!1409713))

(assert (=> b!1526862 m!1409713))

(declare-fun m!1409715 () Bool)

(assert (=> b!1526862 m!1409715))

(declare-fun m!1409717 () Bool)

(assert (=> b!1526862 m!1409717))

(declare-fun m!1409719 () Bool)

(assert (=> b!1526862 m!1409719))

(assert (=> b!1526872 m!1409703))

(declare-fun m!1409721 () Bool)

(assert (=> b!1526872 m!1409721))

(assert (=> b!1526865 m!1409703))

(assert (=> b!1526865 m!1409703))

(declare-fun m!1409723 () Bool)

(assert (=> b!1526865 m!1409723))

(assert (=> b!1526865 m!1409703))

(declare-fun m!1409725 () Bool)

(assert (=> b!1526865 m!1409725))

(declare-fun m!1409727 () Bool)

(assert (=> b!1526870 m!1409727))

(assert (=> b!1526870 m!1409727))

(declare-fun m!1409729 () Bool)

(assert (=> b!1526870 m!1409729))

(declare-fun m!1409731 () Bool)

(assert (=> b!1526871 m!1409731))

(declare-fun m!1409733 () Bool)

(assert (=> b!1526871 m!1409733))

(declare-fun m!1409735 () Bool)

(assert (=> start!130094 m!1409735))

(declare-fun m!1409737 () Bool)

(assert (=> start!130094 m!1409737))

(assert (=> b!1526868 m!1409703))

(assert (=> b!1526868 m!1409703))

(declare-fun m!1409739 () Bool)

(assert (=> b!1526868 m!1409739))

(assert (=> b!1526861 m!1409703))

(assert (=> b!1526861 m!1409703))

(declare-fun m!1409741 () Bool)

(assert (=> b!1526861 m!1409741))

(assert (=> b!1526861 m!1409741))

(assert (=> b!1526861 m!1409703))

(declare-fun m!1409743 () Bool)

(assert (=> b!1526861 m!1409743))

(declare-fun m!1409745 () Bool)

(assert (=> b!1526863 m!1409745))

(assert (=> b!1526866 m!1409703))

(assert (=> b!1526866 m!1409703))

(declare-fun m!1409747 () Bool)

(assert (=> b!1526866 m!1409747))

(push 1)

