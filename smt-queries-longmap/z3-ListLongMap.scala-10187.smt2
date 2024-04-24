; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120236 () Bool)

(assert start!120236)

(declare-fun b!1398748 () Bool)

(declare-fun e!791966 () Bool)

(assert (=> b!1398748 (= e!791966 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95687 0))(
  ( (array!95688 (arr!46195 (Array (_ BitVec 32) (_ BitVec 64))) (size!46746 (_ BitVec 32))) )
))
(declare-fun lt!614733 () array!95687)

(declare-fun lt!614735 () (_ BitVec 32))

(declare-fun lt!614737 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10415 0))(
  ( (MissingZero!10415 (index!44031 (_ BitVec 32))) (Found!10415 (index!44032 (_ BitVec 32))) (Intermediate!10415 (undefined!11227 Bool) (index!44033 (_ BitVec 32)) (x!125840 (_ BitVec 32))) (Undefined!10415) (MissingVacant!10415 (index!44034 (_ BitVec 32))) )
))
(declare-fun lt!614736 () SeekEntryResult!10415)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95687 (_ BitVec 32)) SeekEntryResult!10415)

(assert (=> b!1398748 (= lt!614736 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614735 lt!614737 lt!614733 mask!2840))))

(declare-fun res!936979 () Bool)

(declare-fun e!791963 () Bool)

(assert (=> start!120236 (=> (not res!936979) (not e!791963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120236 (= res!936979 (validMask!0 mask!2840))))

(assert (=> start!120236 e!791963))

(assert (=> start!120236 true))

(declare-fun a!2901 () array!95687)

(declare-fun array_inv!35476 (array!95687) Bool)

(assert (=> start!120236 (array_inv!35476 a!2901)))

(declare-fun b!1398749 () Bool)

(declare-fun e!791964 () Bool)

(assert (=> b!1398749 (= e!791963 (not e!791964))))

(declare-fun res!936981 () Bool)

(assert (=> b!1398749 (=> res!936981 e!791964)))

(declare-fun lt!614734 () SeekEntryResult!10415)

(get-info :version)

(assert (=> b!1398749 (= res!936981 (or (not ((_ is Intermediate!10415) lt!614734)) (undefined!11227 lt!614734)))))

(declare-fun e!791965 () Bool)

(assert (=> b!1398749 e!791965))

(declare-fun res!936980 () Bool)

(assert (=> b!1398749 (=> (not res!936980) (not e!791965))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95687 (_ BitVec 32)) Bool)

(assert (=> b!1398749 (= res!936980 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46861 0))(
  ( (Unit!46862) )
))
(declare-fun lt!614732 () Unit!46861)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46861)

(assert (=> b!1398749 (= lt!614732 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398749 (= lt!614734 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614735 (select (arr!46195 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398749 (= lt!614735 (toIndex!0 (select (arr!46195 a!2901) j!112) mask!2840))))

(declare-fun b!1398750 () Bool)

(declare-fun res!936982 () Bool)

(assert (=> b!1398750 (=> (not res!936982) (not e!791963))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1398750 (= res!936982 (and (= (size!46746 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46746 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46746 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398751 () Bool)

(assert (=> b!1398751 (= e!791964 e!791966)))

(declare-fun res!936985 () Bool)

(assert (=> b!1398751 (=> res!936985 e!791966)))

(declare-fun lt!614738 () SeekEntryResult!10415)

(assert (=> b!1398751 (= res!936985 (or (= lt!614734 lt!614738) (not ((_ is Intermediate!10415) lt!614738)) (bvslt (x!125840 lt!614734) #b00000000000000000000000000000000) (bvsgt (x!125840 lt!614734) #b01111111111111111111111111111110) (bvslt lt!614735 #b00000000000000000000000000000000) (bvsge lt!614735 (size!46746 a!2901)) (bvslt (index!44033 lt!614734) #b00000000000000000000000000000000) (bvsge (index!44033 lt!614734) (size!46746 a!2901)) (not (= lt!614734 (Intermediate!10415 false (index!44033 lt!614734) (x!125840 lt!614734)))) (not (= lt!614738 (Intermediate!10415 (undefined!11227 lt!614738) (index!44033 lt!614738) (x!125840 lt!614738))))))))

(assert (=> b!1398751 (= lt!614738 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614737 mask!2840) lt!614737 lt!614733 mask!2840))))

(assert (=> b!1398751 (= lt!614737 (select (store (arr!46195 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1398751 (= lt!614733 (array!95688 (store (arr!46195 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46746 a!2901)))))

(declare-fun b!1398752 () Bool)

(declare-fun res!936978 () Bool)

(assert (=> b!1398752 (=> (not res!936978) (not e!791963))))

(declare-datatypes ((List!32701 0))(
  ( (Nil!32698) (Cons!32697 (h!33947 (_ BitVec 64)) (t!47387 List!32701)) )
))
(declare-fun arrayNoDuplicates!0 (array!95687 (_ BitVec 32) List!32701) Bool)

(assert (=> b!1398752 (= res!936978 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32698))))

(declare-fun b!1398753 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95687 (_ BitVec 32)) SeekEntryResult!10415)

(assert (=> b!1398753 (= e!791965 (= (seekEntryOrOpen!0 (select (arr!46195 a!2901) j!112) a!2901 mask!2840) (Found!10415 j!112)))))

(declare-fun b!1398754 () Bool)

(declare-fun res!936983 () Bool)

(assert (=> b!1398754 (=> (not res!936983) (not e!791963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398754 (= res!936983 (validKeyInArray!0 (select (arr!46195 a!2901) j!112)))))

(declare-fun b!1398755 () Bool)

(declare-fun res!936977 () Bool)

(assert (=> b!1398755 (=> (not res!936977) (not e!791963))))

(assert (=> b!1398755 (= res!936977 (validKeyInArray!0 (select (arr!46195 a!2901) i!1037)))))

(declare-fun b!1398756 () Bool)

(declare-fun res!936984 () Bool)

(assert (=> b!1398756 (=> (not res!936984) (not e!791963))))

(assert (=> b!1398756 (= res!936984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120236 res!936979) b!1398750))

(assert (= (and b!1398750 res!936982) b!1398755))

(assert (= (and b!1398755 res!936977) b!1398754))

(assert (= (and b!1398754 res!936983) b!1398756))

(assert (= (and b!1398756 res!936984) b!1398752))

(assert (= (and b!1398752 res!936978) b!1398749))

(assert (= (and b!1398749 res!936980) b!1398753))

(assert (= (and b!1398749 (not res!936981)) b!1398751))

(assert (= (and b!1398751 (not res!936985)) b!1398748))

(declare-fun m!1285807 () Bool)

(assert (=> b!1398755 m!1285807))

(assert (=> b!1398755 m!1285807))

(declare-fun m!1285809 () Bool)

(assert (=> b!1398755 m!1285809))

(declare-fun m!1285811 () Bool)

(assert (=> start!120236 m!1285811))

(declare-fun m!1285813 () Bool)

(assert (=> start!120236 m!1285813))

(declare-fun m!1285815 () Bool)

(assert (=> b!1398753 m!1285815))

(assert (=> b!1398753 m!1285815))

(declare-fun m!1285817 () Bool)

(assert (=> b!1398753 m!1285817))

(declare-fun m!1285819 () Bool)

(assert (=> b!1398752 m!1285819))

(assert (=> b!1398754 m!1285815))

(assert (=> b!1398754 m!1285815))

(declare-fun m!1285821 () Bool)

(assert (=> b!1398754 m!1285821))

(declare-fun m!1285823 () Bool)

(assert (=> b!1398751 m!1285823))

(assert (=> b!1398751 m!1285823))

(declare-fun m!1285825 () Bool)

(assert (=> b!1398751 m!1285825))

(declare-fun m!1285827 () Bool)

(assert (=> b!1398751 m!1285827))

(declare-fun m!1285829 () Bool)

(assert (=> b!1398751 m!1285829))

(declare-fun m!1285831 () Bool)

(assert (=> b!1398756 m!1285831))

(assert (=> b!1398749 m!1285815))

(declare-fun m!1285833 () Bool)

(assert (=> b!1398749 m!1285833))

(assert (=> b!1398749 m!1285815))

(assert (=> b!1398749 m!1285815))

(declare-fun m!1285835 () Bool)

(assert (=> b!1398749 m!1285835))

(declare-fun m!1285837 () Bool)

(assert (=> b!1398749 m!1285837))

(declare-fun m!1285839 () Bool)

(assert (=> b!1398749 m!1285839))

(declare-fun m!1285841 () Bool)

(assert (=> b!1398748 m!1285841))

(check-sat (not b!1398748) (not b!1398756) (not b!1398749) (not b!1398754) (not start!120236) (not b!1398753) (not b!1398752) (not b!1398755) (not b!1398751))
(check-sat)
