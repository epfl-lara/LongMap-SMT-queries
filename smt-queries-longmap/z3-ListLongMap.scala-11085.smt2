; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129698 () Bool)

(assert start!129698)

(declare-fun b!1521615 () Bool)

(declare-fun res!1040165 () Bool)

(declare-fun e!848919 () Bool)

(assert (=> b!1521615 (=> (not res!1040165) (not e!848919))))

(declare-datatypes ((array!101317 0))(
  ( (array!101318 (arr!48889 (Array (_ BitVec 32) (_ BitVec 64))) (size!49440 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101317)

(declare-datatypes ((List!35359 0))(
  ( (Nil!35356) (Cons!35355 (h!36785 (_ BitVec 64)) (t!50045 List!35359)) )
))
(declare-fun arrayNoDuplicates!0 (array!101317 (_ BitVec 32) List!35359) Bool)

(assert (=> b!1521615 (= res!1040165 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35356))))

(declare-fun b!1521616 () Bool)

(declare-fun e!848916 () Bool)

(assert (=> b!1521616 (= e!848919 e!848916)))

(declare-fun res!1040160 () Bool)

(assert (=> b!1521616 (=> (not res!1040160) (not e!848916))))

(declare-datatypes ((SeekEntryResult!12953 0))(
  ( (MissingZero!12953 (index!54207 (_ BitVec 32))) (Found!12953 (index!54208 (_ BitVec 32))) (Intermediate!12953 (undefined!13765 Bool) (index!54209 (_ BitVec 32)) (x!136082 (_ BitVec 32))) (Undefined!12953) (MissingVacant!12953 (index!54210 (_ BitVec 32))) )
))
(declare-fun lt!659486 () SeekEntryResult!12953)

(declare-fun lt!659488 () SeekEntryResult!12953)

(assert (=> b!1521616 (= res!1040160 (= lt!659486 lt!659488))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521616 (= lt!659488 (Intermediate!12953 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101317 (_ BitVec 32)) SeekEntryResult!12953)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521616 (= lt!659486 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48889 a!2804) j!70) mask!2512) (select (arr!48889 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521618 () Bool)

(declare-fun res!1040158 () Bool)

(assert (=> b!1521618 (=> (not res!1040158) (not e!848919))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521618 (= res!1040158 (and (= (size!49440 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49440 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49440 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521619 () Bool)

(declare-fun res!1040166 () Bool)

(assert (=> b!1521619 (=> (not res!1040166) (not e!848919))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521619 (= res!1040166 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49440 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49440 a!2804))))))

(declare-fun b!1521620 () Bool)

(declare-fun res!1040163 () Bool)

(assert (=> b!1521620 (=> (not res!1040163) (not e!848919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521620 (= res!1040163 (validKeyInArray!0 (select (arr!48889 a!2804) i!961)))))

(declare-fun b!1521621 () Bool)

(declare-fun res!1040162 () Bool)

(assert (=> b!1521621 (=> (not res!1040162) (not e!848919))))

(assert (=> b!1521621 (= res!1040162 (validKeyInArray!0 (select (arr!48889 a!2804) j!70)))))

(declare-fun b!1521622 () Bool)

(declare-fun res!1040161 () Bool)

(assert (=> b!1521622 (=> (not res!1040161) (not e!848919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101317 (_ BitVec 32)) Bool)

(assert (=> b!1521622 (= res!1040161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521623 () Bool)

(declare-fun e!848918 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101317 (_ BitVec 32)) SeekEntryResult!12953)

(assert (=> b!1521623 (= e!848918 (= (seekEntry!0 (select (arr!48889 a!2804) j!70) a!2804 mask!2512) (Found!12953 j!70)))))

(declare-fun b!1521617 () Bool)

(assert (=> b!1521617 (= e!848916 (not (= (select (arr!48889 a!2804) j!70) (select (store (arr!48889 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))))

(assert (=> b!1521617 e!848918))

(declare-fun res!1040168 () Bool)

(assert (=> b!1521617 (=> (not res!1040168) (not e!848918))))

(assert (=> b!1521617 (= res!1040168 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50809 0))(
  ( (Unit!50810) )
))
(declare-fun lt!659487 () Unit!50809)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50809)

(assert (=> b!1521617 (= lt!659487 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1040167 () Bool)

(assert (=> start!129698 (=> (not res!1040167) (not e!848919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129698 (= res!1040167 (validMask!0 mask!2512))))

(assert (=> start!129698 e!848919))

(assert (=> start!129698 true))

(declare-fun array_inv!38170 (array!101317) Bool)

(assert (=> start!129698 (array_inv!38170 a!2804)))

(declare-fun b!1521624 () Bool)

(declare-fun res!1040164 () Bool)

(assert (=> b!1521624 (=> (not res!1040164) (not e!848916))))

(assert (=> b!1521624 (= res!1040164 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48889 a!2804) j!70) a!2804 mask!2512) lt!659488))))

(declare-fun b!1521625 () Bool)

(declare-fun res!1040159 () Bool)

(assert (=> b!1521625 (=> (not res!1040159) (not e!848916))))

(assert (=> b!1521625 (= res!1040159 (= lt!659486 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48889 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48889 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101318 (store (arr!48889 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49440 a!2804)) mask!2512)))))

(assert (= (and start!129698 res!1040167) b!1521618))

(assert (= (and b!1521618 res!1040158) b!1521620))

(assert (= (and b!1521620 res!1040163) b!1521621))

(assert (= (and b!1521621 res!1040162) b!1521622))

(assert (= (and b!1521622 res!1040161) b!1521615))

(assert (= (and b!1521615 res!1040165) b!1521619))

(assert (= (and b!1521619 res!1040166) b!1521616))

(assert (= (and b!1521616 res!1040160) b!1521624))

(assert (= (and b!1521624 res!1040164) b!1521625))

(assert (= (and b!1521625 res!1040159) b!1521617))

(assert (= (and b!1521617 res!1040168) b!1521623))

(declare-fun m!1404879 () Bool)

(assert (=> b!1521620 m!1404879))

(assert (=> b!1521620 m!1404879))

(declare-fun m!1404881 () Bool)

(assert (=> b!1521620 m!1404881))

(declare-fun m!1404883 () Bool)

(assert (=> b!1521623 m!1404883))

(assert (=> b!1521623 m!1404883))

(declare-fun m!1404885 () Bool)

(assert (=> b!1521623 m!1404885))

(declare-fun m!1404887 () Bool)

(assert (=> b!1521622 m!1404887))

(declare-fun m!1404889 () Bool)

(assert (=> b!1521615 m!1404889))

(assert (=> b!1521616 m!1404883))

(assert (=> b!1521616 m!1404883))

(declare-fun m!1404891 () Bool)

(assert (=> b!1521616 m!1404891))

(assert (=> b!1521616 m!1404891))

(assert (=> b!1521616 m!1404883))

(declare-fun m!1404893 () Bool)

(assert (=> b!1521616 m!1404893))

(assert (=> b!1521624 m!1404883))

(assert (=> b!1521624 m!1404883))

(declare-fun m!1404895 () Bool)

(assert (=> b!1521624 m!1404895))

(assert (=> b!1521617 m!1404883))

(declare-fun m!1404897 () Bool)

(assert (=> b!1521617 m!1404897))

(declare-fun m!1404899 () Bool)

(assert (=> b!1521617 m!1404899))

(declare-fun m!1404901 () Bool)

(assert (=> b!1521617 m!1404901))

(declare-fun m!1404903 () Bool)

(assert (=> b!1521617 m!1404903))

(declare-fun m!1404905 () Bool)

(assert (=> start!129698 m!1404905))

(declare-fun m!1404907 () Bool)

(assert (=> start!129698 m!1404907))

(assert (=> b!1521625 m!1404899))

(assert (=> b!1521625 m!1404901))

(assert (=> b!1521625 m!1404901))

(declare-fun m!1404909 () Bool)

(assert (=> b!1521625 m!1404909))

(assert (=> b!1521625 m!1404909))

(assert (=> b!1521625 m!1404901))

(declare-fun m!1404911 () Bool)

(assert (=> b!1521625 m!1404911))

(assert (=> b!1521621 m!1404883))

(assert (=> b!1521621 m!1404883))

(declare-fun m!1404913 () Bool)

(assert (=> b!1521621 m!1404913))

(check-sat (not b!1521616) (not start!129698) (not b!1521624) (not b!1521620) (not b!1521617) (not b!1521621) (not b!1521622) (not b!1521623) (not b!1521625) (not b!1521615))
(check-sat)
