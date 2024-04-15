; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129014 () Bool)

(assert start!129014)

(declare-fun b!1513695 () Bool)

(declare-fun res!1033804 () Bool)

(declare-fun e!844758 () Bool)

(assert (=> b!1513695 (=> (not res!1033804) (not e!844758))))

(declare-datatypes ((array!100870 0))(
  ( (array!100871 (arr!48673 (Array (_ BitVec 32) (_ BitVec 64))) (size!49225 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100870)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513695 (= res!1033804 (validKeyInArray!0 (select (arr!48673 a!2804) i!961)))))

(declare-fun b!1513696 () Bool)

(declare-fun res!1033811 () Bool)

(assert (=> b!1513696 (=> (not res!1033811) (not e!844758))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100870 (_ BitVec 32)) Bool)

(assert (=> b!1513696 (= res!1033811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1033817 () Bool)

(assert (=> start!129014 (=> (not res!1033817) (not e!844758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129014 (= res!1033817 (validMask!0 mask!2512))))

(assert (=> start!129014 e!844758))

(assert (=> start!129014 true))

(declare-fun array_inv!37906 (array!100870) Bool)

(assert (=> start!129014 (array_inv!37906 a!2804)))

(declare-fun b!1513697 () Bool)

(declare-fun e!844756 () Bool)

(declare-fun e!844752 () Bool)

(assert (=> b!1513697 (= e!844756 e!844752)))

(declare-fun res!1033816 () Bool)

(assert (=> b!1513697 (=> (not res!1033816) (not e!844752))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12867 0))(
  ( (MissingZero!12867 (index!53863 (_ BitVec 32))) (Found!12867 (index!53864 (_ BitVec 32))) (Intermediate!12867 (undefined!13679 Bool) (index!53865 (_ BitVec 32)) (x!135579 (_ BitVec 32))) (Undefined!12867) (MissingVacant!12867 (index!53866 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100870 (_ BitVec 32)) SeekEntryResult!12867)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100870 (_ BitVec 32)) SeekEntryResult!12867)

(assert (=> b!1513697 (= res!1033816 (= (seekEntryOrOpen!0 (select (arr!48673 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48673 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513698 () Bool)

(declare-fun res!1033807 () Bool)

(assert (=> b!1513698 (=> (not res!1033807) (not e!844758))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513698 (= res!1033807 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49225 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49225 a!2804))))))

(declare-fun b!1513699 () Bool)

(declare-fun e!844754 () Bool)

(declare-fun e!844753 () Bool)

(assert (=> b!1513699 (= e!844754 e!844753)))

(declare-fun res!1033814 () Bool)

(assert (=> b!1513699 (=> (not res!1033814) (not e!844753))))

(declare-fun lt!655899 () (_ BitVec 64))

(declare-fun lt!655898 () array!100870)

(declare-fun lt!655895 () SeekEntryResult!12867)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100870 (_ BitVec 32)) SeekEntryResult!12867)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513699 (= res!1033814 (= lt!655895 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655899 mask!2512) lt!655899 lt!655898 mask!2512)))))

(assert (=> b!1513699 (= lt!655899 (select (store (arr!48673 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513699 (= lt!655898 (array!100871 (store (arr!48673 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49225 a!2804)))))

(declare-fun b!1513700 () Bool)

(declare-fun res!1033812 () Bool)

(assert (=> b!1513700 (=> (not res!1033812) (not e!844758))))

(assert (=> b!1513700 (= res!1033812 (validKeyInArray!0 (select (arr!48673 a!2804) j!70)))))

(declare-fun b!1513701 () Bool)

(declare-fun res!1033815 () Bool)

(declare-fun e!844755 () Bool)

(assert (=> b!1513701 (=> (not res!1033815) (not e!844755))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100870 (_ BitVec 32)) SeekEntryResult!12867)

(assert (=> b!1513701 (= res!1033815 (= (seekEntry!0 (select (arr!48673 a!2804) j!70) a!2804 mask!2512) (Found!12867 j!70)))))

(declare-fun b!1513702 () Bool)

(declare-fun res!1033810 () Bool)

(assert (=> b!1513702 (=> (not res!1033810) (not e!844758))))

(assert (=> b!1513702 (= res!1033810 (and (= (size!49225 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49225 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49225 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513703 () Bool)

(assert (=> b!1513703 (= e!844752 (= (seekEntryOrOpen!0 lt!655899 lt!655898 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655899 lt!655898 mask!2512)))))

(declare-fun b!1513704 () Bool)

(declare-fun res!1033813 () Bool)

(assert (=> b!1513704 (=> (not res!1033813) (not e!844754))))

(declare-fun lt!655896 () SeekEntryResult!12867)

(assert (=> b!1513704 (= res!1033813 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48673 a!2804) j!70) a!2804 mask!2512) lt!655896))))

(declare-fun b!1513705 () Bool)

(assert (=> b!1513705 (= e!844753 (not true))))

(assert (=> b!1513705 e!844755))

(declare-fun res!1033805 () Bool)

(assert (=> b!1513705 (=> (not res!1033805) (not e!844755))))

(assert (=> b!1513705 (= res!1033805 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50441 0))(
  ( (Unit!50442) )
))
(declare-fun lt!655897 () Unit!50441)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100870 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50441)

(assert (=> b!1513705 (= lt!655897 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513706 () Bool)

(assert (=> b!1513706 (= e!844755 e!844756)))

(declare-fun res!1033806 () Bool)

(assert (=> b!1513706 (=> res!1033806 e!844756)))

(assert (=> b!1513706 (= res!1033806 (or (not (= (select (arr!48673 a!2804) j!70) lt!655899)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48673 a!2804) index!487) (select (arr!48673 a!2804) j!70)) (not (= (select (arr!48673 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513707 () Bool)

(declare-fun res!1033808 () Bool)

(assert (=> b!1513707 (=> (not res!1033808) (not e!844758))))

(declare-datatypes ((List!35234 0))(
  ( (Nil!35231) (Cons!35230 (h!36643 (_ BitVec 64)) (t!49920 List!35234)) )
))
(declare-fun arrayNoDuplicates!0 (array!100870 (_ BitVec 32) List!35234) Bool)

(assert (=> b!1513707 (= res!1033808 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35231))))

(declare-fun b!1513708 () Bool)

(assert (=> b!1513708 (= e!844758 e!844754)))

(declare-fun res!1033809 () Bool)

(assert (=> b!1513708 (=> (not res!1033809) (not e!844754))))

(assert (=> b!1513708 (= res!1033809 (= lt!655895 lt!655896))))

(assert (=> b!1513708 (= lt!655896 (Intermediate!12867 false resIndex!21 resX!21))))

(assert (=> b!1513708 (= lt!655895 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48673 a!2804) j!70) mask!2512) (select (arr!48673 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129014 res!1033817) b!1513702))

(assert (= (and b!1513702 res!1033810) b!1513695))

(assert (= (and b!1513695 res!1033804) b!1513700))

(assert (= (and b!1513700 res!1033812) b!1513696))

(assert (= (and b!1513696 res!1033811) b!1513707))

(assert (= (and b!1513707 res!1033808) b!1513698))

(assert (= (and b!1513698 res!1033807) b!1513708))

(assert (= (and b!1513708 res!1033809) b!1513704))

(assert (= (and b!1513704 res!1033813) b!1513699))

(assert (= (and b!1513699 res!1033814) b!1513705))

(assert (= (and b!1513705 res!1033805) b!1513701))

(assert (= (and b!1513701 res!1033815) b!1513706))

(assert (= (and b!1513706 (not res!1033806)) b!1513697))

(assert (= (and b!1513697 res!1033816) b!1513703))

(declare-fun m!1396043 () Bool)

(assert (=> b!1513706 m!1396043))

(declare-fun m!1396045 () Bool)

(assert (=> b!1513706 m!1396045))

(assert (=> b!1513700 m!1396043))

(assert (=> b!1513700 m!1396043))

(declare-fun m!1396047 () Bool)

(assert (=> b!1513700 m!1396047))

(declare-fun m!1396049 () Bool)

(assert (=> b!1513705 m!1396049))

(declare-fun m!1396051 () Bool)

(assert (=> b!1513705 m!1396051))

(declare-fun m!1396053 () Bool)

(assert (=> b!1513695 m!1396053))

(assert (=> b!1513695 m!1396053))

(declare-fun m!1396055 () Bool)

(assert (=> b!1513695 m!1396055))

(assert (=> b!1513701 m!1396043))

(assert (=> b!1513701 m!1396043))

(declare-fun m!1396057 () Bool)

(assert (=> b!1513701 m!1396057))

(assert (=> b!1513697 m!1396043))

(assert (=> b!1513697 m!1396043))

(declare-fun m!1396059 () Bool)

(assert (=> b!1513697 m!1396059))

(assert (=> b!1513697 m!1396043))

(declare-fun m!1396061 () Bool)

(assert (=> b!1513697 m!1396061))

(assert (=> b!1513704 m!1396043))

(assert (=> b!1513704 m!1396043))

(declare-fun m!1396063 () Bool)

(assert (=> b!1513704 m!1396063))

(declare-fun m!1396065 () Bool)

(assert (=> b!1513703 m!1396065))

(declare-fun m!1396067 () Bool)

(assert (=> b!1513703 m!1396067))

(declare-fun m!1396069 () Bool)

(assert (=> b!1513707 m!1396069))

(declare-fun m!1396071 () Bool)

(assert (=> start!129014 m!1396071))

(declare-fun m!1396073 () Bool)

(assert (=> start!129014 m!1396073))

(declare-fun m!1396075 () Bool)

(assert (=> b!1513699 m!1396075))

(assert (=> b!1513699 m!1396075))

(declare-fun m!1396077 () Bool)

(assert (=> b!1513699 m!1396077))

(declare-fun m!1396079 () Bool)

(assert (=> b!1513699 m!1396079))

(declare-fun m!1396081 () Bool)

(assert (=> b!1513699 m!1396081))

(assert (=> b!1513708 m!1396043))

(assert (=> b!1513708 m!1396043))

(declare-fun m!1396083 () Bool)

(assert (=> b!1513708 m!1396083))

(assert (=> b!1513708 m!1396083))

(assert (=> b!1513708 m!1396043))

(declare-fun m!1396085 () Bool)

(assert (=> b!1513708 m!1396085))

(declare-fun m!1396087 () Bool)

(assert (=> b!1513696 m!1396087))

(check-sat (not b!1513696) (not start!129014) (not b!1513699) (not b!1513695) (not b!1513708) (not b!1513703) (not b!1513700) (not b!1513697) (not b!1513705) (not b!1513701) (not b!1513704) (not b!1513707))
(check-sat)
