; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130046 () Bool)

(assert start!130046)

(declare-fun b!1525852 () Bool)

(declare-fun res!1043897 () Bool)

(declare-fun e!850539 () Bool)

(assert (=> b!1525852 (=> (not res!1043897) (not e!850539))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101459 0))(
  ( (array!101460 (arr!48956 (Array (_ BitVec 32) (_ BitVec 64))) (size!49506 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101459)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13121 0))(
  ( (MissingZero!13121 (index!54879 (_ BitVec 32))) (Found!13121 (index!54880 (_ BitVec 32))) (Intermediate!13121 (undefined!13933 Bool) (index!54881 (_ BitVec 32)) (x!136583 (_ BitVec 32))) (Undefined!13121) (MissingVacant!13121 (index!54882 (_ BitVec 32))) )
))
(declare-fun lt!660865 () SeekEntryResult!13121)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101459 (_ BitVec 32)) SeekEntryResult!13121)

(assert (=> b!1525852 (= res!1043897 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48956 a!2804) j!70) a!2804 mask!2512) lt!660865))))

(declare-fun b!1525853 () Bool)

(declare-fun e!850538 () Bool)

(declare-fun e!850537 () Bool)

(assert (=> b!1525853 (= e!850538 e!850537)))

(declare-fun res!1043889 () Bool)

(assert (=> b!1525853 (=> res!1043889 e!850537)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!660868 () (_ BitVec 64))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1525853 (= res!1043889 (or (not (= (select (arr!48956 a!2804) j!70) lt!660868)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48956 a!2804) index!487) (select (arr!48956 a!2804) j!70)) (not (= (select (arr!48956 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1525854 () Bool)

(declare-fun res!1043894 () Bool)

(declare-fun e!850542 () Bool)

(assert (=> b!1525854 (=> (not res!1043894) (not e!850542))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525854 (= res!1043894 (validKeyInArray!0 (select (arr!48956 a!2804) j!70)))))

(declare-fun b!1525856 () Bool)

(declare-fun res!1043886 () Bool)

(assert (=> b!1525856 (=> (not res!1043886) (not e!850542))))

(assert (=> b!1525856 (= res!1043886 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49506 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49506 a!2804))))))

(declare-fun b!1525857 () Bool)

(declare-fun e!850543 () Bool)

(assert (=> b!1525857 (= e!850539 e!850543)))

(declare-fun res!1043898 () Bool)

(assert (=> b!1525857 (=> (not res!1043898) (not e!850543))))

(declare-fun lt!660866 () array!101459)

(declare-fun lt!660867 () SeekEntryResult!13121)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525857 (= res!1043898 (= lt!660867 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660868 mask!2512) lt!660868 lt!660866 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1525857 (= lt!660868 (select (store (arr!48956 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1525857 (= lt!660866 (array!101460 (store (arr!48956 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49506 a!2804)))))

(declare-fun b!1525858 () Bool)

(declare-fun res!1043896 () Bool)

(assert (=> b!1525858 (=> (not res!1043896) (not e!850542))))

(assert (=> b!1525858 (= res!1043896 (and (= (size!49506 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49506 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49506 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525859 () Bool)

(declare-fun e!850541 () Bool)

(assert (=> b!1525859 (= e!850537 e!850541)))

(declare-fun res!1043895 () Bool)

(assert (=> b!1525859 (=> (not res!1043895) (not e!850541))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101459 (_ BitVec 32)) SeekEntryResult!13121)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101459 (_ BitVec 32)) SeekEntryResult!13121)

(assert (=> b!1525859 (= res!1043895 (= (seekEntryOrOpen!0 (select (arr!48956 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48956 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1525860 () Bool)

(declare-fun res!1043887 () Bool)

(assert (=> b!1525860 (=> (not res!1043887) (not e!850542))))

(assert (=> b!1525860 (= res!1043887 (validKeyInArray!0 (select (arr!48956 a!2804) i!961)))))

(declare-fun b!1525861 () Bool)

(declare-fun res!1043892 () Bool)

(assert (=> b!1525861 (=> (not res!1043892) (not e!850538))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101459 (_ BitVec 32)) SeekEntryResult!13121)

(assert (=> b!1525861 (= res!1043892 (= (seekEntry!0 (select (arr!48956 a!2804) j!70) a!2804 mask!2512) (Found!13121 j!70)))))

(declare-fun b!1525862 () Bool)

(assert (=> b!1525862 (= e!850542 e!850539)))

(declare-fun res!1043888 () Bool)

(assert (=> b!1525862 (=> (not res!1043888) (not e!850539))))

(assert (=> b!1525862 (= res!1043888 (= lt!660867 lt!660865))))

(assert (=> b!1525862 (= lt!660865 (Intermediate!13121 false resIndex!21 resX!21))))

(assert (=> b!1525862 (= lt!660867 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48956 a!2804) j!70) mask!2512) (select (arr!48956 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525863 () Bool)

(declare-fun res!1043890 () Bool)

(assert (=> b!1525863 (=> (not res!1043890) (not e!850542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101459 (_ BitVec 32)) Bool)

(assert (=> b!1525863 (= res!1043890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525864 () Bool)

(declare-fun res!1043891 () Bool)

(assert (=> b!1525864 (=> (not res!1043891) (not e!850542))))

(declare-datatypes ((List!35439 0))(
  ( (Nil!35436) (Cons!35435 (h!36868 (_ BitVec 64)) (t!50133 List!35439)) )
))
(declare-fun arrayNoDuplicates!0 (array!101459 (_ BitVec 32) List!35439) Bool)

(assert (=> b!1525864 (= res!1043891 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35436))))

(declare-fun b!1525865 () Bool)

(assert (=> b!1525865 (= e!850543 (not true))))

(assert (=> b!1525865 e!850538))

(declare-fun res!1043893 () Bool)

(assert (=> b!1525865 (=> (not res!1043893) (not e!850538))))

(assert (=> b!1525865 (= res!1043893 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51026 0))(
  ( (Unit!51027) )
))
(declare-fun lt!660864 () Unit!51026)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101459 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51026)

(assert (=> b!1525865 (= lt!660864 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1043899 () Bool)

(assert (=> start!130046 (=> (not res!1043899) (not e!850542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130046 (= res!1043899 (validMask!0 mask!2512))))

(assert (=> start!130046 e!850542))

(assert (=> start!130046 true))

(declare-fun array_inv!37984 (array!101459) Bool)

(assert (=> start!130046 (array_inv!37984 a!2804)))

(declare-fun b!1525855 () Bool)

(assert (=> b!1525855 (= e!850541 (= (seekEntryOrOpen!0 lt!660868 lt!660866 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660868 lt!660866 mask!2512)))))

(assert (= (and start!130046 res!1043899) b!1525858))

(assert (= (and b!1525858 res!1043896) b!1525860))

(assert (= (and b!1525860 res!1043887) b!1525854))

(assert (= (and b!1525854 res!1043894) b!1525863))

(assert (= (and b!1525863 res!1043890) b!1525864))

(assert (= (and b!1525864 res!1043891) b!1525856))

(assert (= (and b!1525856 res!1043886) b!1525862))

(assert (= (and b!1525862 res!1043888) b!1525852))

(assert (= (and b!1525852 res!1043897) b!1525857))

(assert (= (and b!1525857 res!1043898) b!1525865))

(assert (= (and b!1525865 res!1043893) b!1525861))

(assert (= (and b!1525861 res!1043892) b!1525853))

(assert (= (and b!1525853 (not res!1043889)) b!1525859))

(assert (= (and b!1525859 res!1043895) b!1525855))

(declare-fun m!1408599 () Bool)

(assert (=> start!130046 m!1408599))

(declare-fun m!1408601 () Bool)

(assert (=> start!130046 m!1408601))

(declare-fun m!1408603 () Bool)

(assert (=> b!1525863 m!1408603))

(declare-fun m!1408605 () Bool)

(assert (=> b!1525859 m!1408605))

(assert (=> b!1525859 m!1408605))

(declare-fun m!1408607 () Bool)

(assert (=> b!1525859 m!1408607))

(assert (=> b!1525859 m!1408605))

(declare-fun m!1408609 () Bool)

(assert (=> b!1525859 m!1408609))

(assert (=> b!1525854 m!1408605))

(assert (=> b!1525854 m!1408605))

(declare-fun m!1408611 () Bool)

(assert (=> b!1525854 m!1408611))

(assert (=> b!1525853 m!1408605))

(declare-fun m!1408613 () Bool)

(assert (=> b!1525853 m!1408613))

(assert (=> b!1525862 m!1408605))

(assert (=> b!1525862 m!1408605))

(declare-fun m!1408615 () Bool)

(assert (=> b!1525862 m!1408615))

(assert (=> b!1525862 m!1408615))

(assert (=> b!1525862 m!1408605))

(declare-fun m!1408617 () Bool)

(assert (=> b!1525862 m!1408617))

(declare-fun m!1408619 () Bool)

(assert (=> b!1525857 m!1408619))

(assert (=> b!1525857 m!1408619))

(declare-fun m!1408621 () Bool)

(assert (=> b!1525857 m!1408621))

(declare-fun m!1408623 () Bool)

(assert (=> b!1525857 m!1408623))

(declare-fun m!1408625 () Bool)

(assert (=> b!1525857 m!1408625))

(declare-fun m!1408627 () Bool)

(assert (=> b!1525865 m!1408627))

(declare-fun m!1408629 () Bool)

(assert (=> b!1525865 m!1408629))

(declare-fun m!1408631 () Bool)

(assert (=> b!1525860 m!1408631))

(assert (=> b!1525860 m!1408631))

(declare-fun m!1408633 () Bool)

(assert (=> b!1525860 m!1408633))

(declare-fun m!1408635 () Bool)

(assert (=> b!1525864 m!1408635))

(declare-fun m!1408637 () Bool)

(assert (=> b!1525855 m!1408637))

(declare-fun m!1408639 () Bool)

(assert (=> b!1525855 m!1408639))

(assert (=> b!1525852 m!1408605))

(assert (=> b!1525852 m!1408605))

(declare-fun m!1408641 () Bool)

(assert (=> b!1525852 m!1408641))

(assert (=> b!1525861 m!1408605))

(assert (=> b!1525861 m!1408605))

(declare-fun m!1408643 () Bool)

(assert (=> b!1525861 m!1408643))

(push 1)

