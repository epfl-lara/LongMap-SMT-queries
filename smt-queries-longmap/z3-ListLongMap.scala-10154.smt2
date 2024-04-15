; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119684 () Bool)

(assert start!119684)

(declare-fun b!1394116 () Bool)

(declare-fun res!933576 () Bool)

(declare-fun e!789358 () Bool)

(assert (=> b!1394116 (=> res!933576 e!789358)))

(declare-datatypes ((SeekEntryResult!10361 0))(
  ( (MissingZero!10361 (index!43815 (_ BitVec 32))) (Found!10361 (index!43816 (_ BitVec 32))) (Intermediate!10361 (undefined!11173 Bool) (index!43817 (_ BitVec 32)) (x!125482 (_ BitVec 32))) (Undefined!10361) (MissingVacant!10361 (index!43818 (_ BitVec 32))) )
))
(declare-fun lt!612094 () SeekEntryResult!10361)

(declare-datatypes ((array!95319 0))(
  ( (array!95320 (arr!46018 (Array (_ BitVec 32) (_ BitVec 64))) (size!46570 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95319)

(declare-fun lt!612097 () (_ BitVec 32))

(assert (=> b!1394116 (= res!933576 (or (bvslt (x!125482 lt!612094) #b00000000000000000000000000000000) (bvsgt (x!125482 lt!612094) #b01111111111111111111111111111110) (bvslt lt!612097 #b00000000000000000000000000000000) (bvsge lt!612097 (size!46570 a!2901)) (bvslt (index!43817 lt!612094) #b00000000000000000000000000000000) (bvsge (index!43817 lt!612094) (size!46570 a!2901)) (not (= lt!612094 (Intermediate!10361 false (index!43817 lt!612094) (x!125482 lt!612094))))))))

(declare-fun b!1394117 () Bool)

(declare-fun res!933582 () Bool)

(declare-fun e!789357 () Bool)

(assert (=> b!1394117 (=> (not res!933582) (not e!789357))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95319 (_ BitVec 32)) Bool)

(assert (=> b!1394117 (= res!933582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394118 () Bool)

(declare-fun res!933580 () Bool)

(assert (=> b!1394118 (=> (not res!933580) (not e!789357))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394118 (= res!933580 (validKeyInArray!0 (select (arr!46018 a!2901) j!112)))))

(declare-fun b!1394119 () Bool)

(declare-fun e!789359 () Bool)

(assert (=> b!1394119 (= e!789359 e!789358)))

(declare-fun res!933583 () Bool)

(assert (=> b!1394119 (=> res!933583 e!789358)))

(declare-fun lt!612098 () array!95319)

(declare-fun lt!612093 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95319 (_ BitVec 32)) SeekEntryResult!10361)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394119 (= res!933583 (not (= lt!612094 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612093 mask!2840) lt!612093 lt!612098 mask!2840))))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1394119 (= lt!612093 (select (store (arr!46018 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394119 (= lt!612098 (array!95320 (store (arr!46018 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46570 a!2901)))))

(declare-fun res!933579 () Bool)

(assert (=> start!119684 (=> (not res!933579) (not e!789357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119684 (= res!933579 (validMask!0 mask!2840))))

(assert (=> start!119684 e!789357))

(assert (=> start!119684 true))

(declare-fun array_inv!35251 (array!95319) Bool)

(assert (=> start!119684 (array_inv!35251 a!2901)))

(declare-fun b!1394120 () Bool)

(assert (=> b!1394120 (= e!789357 (not e!789359))))

(declare-fun res!933578 () Bool)

(assert (=> b!1394120 (=> res!933578 e!789359)))

(get-info :version)

(assert (=> b!1394120 (= res!933578 (or (not ((_ is Intermediate!10361) lt!612094)) (undefined!11173 lt!612094)))))

(declare-fun lt!612092 () SeekEntryResult!10361)

(assert (=> b!1394120 (= lt!612092 (Found!10361 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95319 (_ BitVec 32)) SeekEntryResult!10361)

(assert (=> b!1394120 (= lt!612092 (seekEntryOrOpen!0 (select (arr!46018 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394120 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46569 0))(
  ( (Unit!46570) )
))
(declare-fun lt!612095 () Unit!46569)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95319 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46569)

(assert (=> b!1394120 (= lt!612095 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394120 (= lt!612094 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612097 (select (arr!46018 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394120 (= lt!612097 (toIndex!0 (select (arr!46018 a!2901) j!112) mask!2840))))

(declare-fun b!1394121 () Bool)

(declare-fun res!933577 () Bool)

(assert (=> b!1394121 (=> (not res!933577) (not e!789357))))

(declare-datatypes ((List!32615 0))(
  ( (Nil!32612) (Cons!32611 (h!33844 (_ BitVec 64)) (t!47301 List!32615)) )
))
(declare-fun arrayNoDuplicates!0 (array!95319 (_ BitVec 32) List!32615) Bool)

(assert (=> b!1394121 (= res!933577 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32612))))

(declare-fun b!1394122 () Bool)

(declare-fun res!933581 () Bool)

(assert (=> b!1394122 (=> (not res!933581) (not e!789357))))

(assert (=> b!1394122 (= res!933581 (validKeyInArray!0 (select (arr!46018 a!2901) i!1037)))))

(declare-fun b!1394123 () Bool)

(assert (=> b!1394123 (= e!789358 true)))

(assert (=> b!1394123 (= lt!612092 (seekEntryOrOpen!0 lt!612093 lt!612098 mask!2840))))

(declare-fun lt!612096 () Unit!46569)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95319 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46569)

(assert (=> b!1394123 (= lt!612096 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612097 (x!125482 lt!612094) (index!43817 lt!612094) mask!2840))))

(declare-fun b!1394124 () Bool)

(declare-fun res!933575 () Bool)

(assert (=> b!1394124 (=> (not res!933575) (not e!789357))))

(assert (=> b!1394124 (= res!933575 (and (= (size!46570 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46570 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46570 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119684 res!933579) b!1394124))

(assert (= (and b!1394124 res!933575) b!1394122))

(assert (= (and b!1394122 res!933581) b!1394118))

(assert (= (and b!1394118 res!933580) b!1394117))

(assert (= (and b!1394117 res!933582) b!1394121))

(assert (= (and b!1394121 res!933577) b!1394120))

(assert (= (and b!1394120 (not res!933578)) b!1394119))

(assert (= (and b!1394119 (not res!933583)) b!1394116))

(assert (= (and b!1394116 (not res!933576)) b!1394123))

(declare-fun m!1279885 () Bool)

(assert (=> b!1394119 m!1279885))

(assert (=> b!1394119 m!1279885))

(declare-fun m!1279887 () Bool)

(assert (=> b!1394119 m!1279887))

(declare-fun m!1279889 () Bool)

(assert (=> b!1394119 m!1279889))

(declare-fun m!1279891 () Bool)

(assert (=> b!1394119 m!1279891))

(declare-fun m!1279893 () Bool)

(assert (=> b!1394120 m!1279893))

(declare-fun m!1279895 () Bool)

(assert (=> b!1394120 m!1279895))

(assert (=> b!1394120 m!1279893))

(declare-fun m!1279897 () Bool)

(assert (=> b!1394120 m!1279897))

(assert (=> b!1394120 m!1279893))

(declare-fun m!1279899 () Bool)

(assert (=> b!1394120 m!1279899))

(declare-fun m!1279901 () Bool)

(assert (=> b!1394120 m!1279901))

(assert (=> b!1394120 m!1279893))

(declare-fun m!1279903 () Bool)

(assert (=> b!1394120 m!1279903))

(declare-fun m!1279905 () Bool)

(assert (=> start!119684 m!1279905))

(declare-fun m!1279907 () Bool)

(assert (=> start!119684 m!1279907))

(declare-fun m!1279909 () Bool)

(assert (=> b!1394121 m!1279909))

(declare-fun m!1279911 () Bool)

(assert (=> b!1394117 m!1279911))

(declare-fun m!1279913 () Bool)

(assert (=> b!1394122 m!1279913))

(assert (=> b!1394122 m!1279913))

(declare-fun m!1279915 () Bool)

(assert (=> b!1394122 m!1279915))

(assert (=> b!1394118 m!1279893))

(assert (=> b!1394118 m!1279893))

(declare-fun m!1279917 () Bool)

(assert (=> b!1394118 m!1279917))

(declare-fun m!1279919 () Bool)

(assert (=> b!1394123 m!1279919))

(declare-fun m!1279921 () Bool)

(assert (=> b!1394123 m!1279921))

(check-sat (not b!1394118) (not b!1394122) (not b!1394120) (not b!1394117) (not start!119684) (not b!1394121) (not b!1394119) (not b!1394123))
(check-sat)
