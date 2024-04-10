; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120014 () Bool)

(assert start!120014)

(declare-fun b!1397149 () Bool)

(declare-fun e!790971 () Bool)

(declare-fun e!790969 () Bool)

(assert (=> b!1397149 (= e!790971 (not e!790969))))

(declare-fun res!936070 () Bool)

(assert (=> b!1397149 (=> res!936070 e!790969)))

(declare-datatypes ((SeekEntryResult!10442 0))(
  ( (MissingZero!10442 (index!44139 (_ BitVec 32))) (Found!10442 (index!44140 (_ BitVec 32))) (Intermediate!10442 (undefined!11254 Bool) (index!44141 (_ BitVec 32)) (x!125800 (_ BitVec 32))) (Undefined!10442) (MissingVacant!10442 (index!44142 (_ BitVec 32))) )
))
(declare-fun lt!613980 () SeekEntryResult!10442)

(get-info :version)

(assert (=> b!1397149 (= res!936070 (or (not ((_ is Intermediate!10442) lt!613980)) (undefined!11254 lt!613980)))))

(declare-fun e!790972 () Bool)

(assert (=> b!1397149 e!790972))

(declare-fun res!936069 () Bool)

(assert (=> b!1397149 (=> (not res!936069) (not e!790972))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95543 0))(
  ( (array!95544 (arr!46125 (Array (_ BitVec 32) (_ BitVec 64))) (size!46675 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95543)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95543 (_ BitVec 32)) Bool)

(assert (=> b!1397149 (= res!936069 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46888 0))(
  ( (Unit!46889) )
))
(declare-fun lt!613979 () Unit!46888)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46888)

(assert (=> b!1397149 (= lt!613979 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613983 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95543 (_ BitVec 32)) SeekEntryResult!10442)

(assert (=> b!1397149 (= lt!613980 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613983 (select (arr!46125 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397149 (= lt!613983 (toIndex!0 (select (arr!46125 a!2901) j!112) mask!2840))))

(declare-fun b!1397150 () Bool)

(declare-fun e!790970 () Bool)

(assert (=> b!1397150 (= e!790970 true)))

(declare-fun lt!613978 () (_ BitVec 64))

(declare-fun lt!613977 () SeekEntryResult!10442)

(declare-fun lt!613982 () array!95543)

(assert (=> b!1397150 (= lt!613977 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613983 lt!613978 lt!613982 mask!2840))))

(declare-fun b!1397151 () Bool)

(declare-fun res!936062 () Bool)

(assert (=> b!1397151 (=> (not res!936062) (not e!790971))))

(declare-datatypes ((List!32644 0))(
  ( (Nil!32641) (Cons!32640 (h!33882 (_ BitVec 64)) (t!47338 List!32644)) )
))
(declare-fun arrayNoDuplicates!0 (array!95543 (_ BitVec 32) List!32644) Bool)

(assert (=> b!1397151 (= res!936062 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32641))))

(declare-fun b!1397152 () Bool)

(assert (=> b!1397152 (= e!790969 e!790970)))

(declare-fun res!936068 () Bool)

(assert (=> b!1397152 (=> res!936068 e!790970)))

(declare-fun lt!613981 () SeekEntryResult!10442)

(assert (=> b!1397152 (= res!936068 (or (= lt!613980 lt!613981) (not ((_ is Intermediate!10442) lt!613981)) (bvslt (x!125800 lt!613980) #b00000000000000000000000000000000) (bvsgt (x!125800 lt!613980) #b01111111111111111111111111111110) (bvslt lt!613983 #b00000000000000000000000000000000) (bvsge lt!613983 (size!46675 a!2901)) (bvslt (index!44141 lt!613980) #b00000000000000000000000000000000) (bvsge (index!44141 lt!613980) (size!46675 a!2901)) (not (= lt!613980 (Intermediate!10442 false (index!44141 lt!613980) (x!125800 lt!613980)))) (not (= lt!613981 (Intermediate!10442 (undefined!11254 lt!613981) (index!44141 lt!613981) (x!125800 lt!613981))))))))

(assert (=> b!1397152 (= lt!613981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613978 mask!2840) lt!613978 lt!613982 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397152 (= lt!613978 (select (store (arr!46125 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397152 (= lt!613982 (array!95544 (store (arr!46125 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46675 a!2901)))))

(declare-fun res!936063 () Bool)

(assert (=> start!120014 (=> (not res!936063) (not e!790971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120014 (= res!936063 (validMask!0 mask!2840))))

(assert (=> start!120014 e!790971))

(assert (=> start!120014 true))

(declare-fun array_inv!35153 (array!95543) Bool)

(assert (=> start!120014 (array_inv!35153 a!2901)))

(declare-fun b!1397153 () Bool)

(declare-fun res!936066 () Bool)

(assert (=> b!1397153 (=> (not res!936066) (not e!790971))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397153 (= res!936066 (validKeyInArray!0 (select (arr!46125 a!2901) i!1037)))))

(declare-fun b!1397154 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95543 (_ BitVec 32)) SeekEntryResult!10442)

(assert (=> b!1397154 (= e!790972 (= (seekEntryOrOpen!0 (select (arr!46125 a!2901) j!112) a!2901 mask!2840) (Found!10442 j!112)))))

(declare-fun b!1397155 () Bool)

(declare-fun res!936065 () Bool)

(assert (=> b!1397155 (=> (not res!936065) (not e!790971))))

(assert (=> b!1397155 (= res!936065 (and (= (size!46675 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46675 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46675 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397156 () Bool)

(declare-fun res!936067 () Bool)

(assert (=> b!1397156 (=> (not res!936067) (not e!790971))))

(assert (=> b!1397156 (= res!936067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397157 () Bool)

(declare-fun res!936064 () Bool)

(assert (=> b!1397157 (=> (not res!936064) (not e!790971))))

(assert (=> b!1397157 (= res!936064 (validKeyInArray!0 (select (arr!46125 a!2901) j!112)))))

(assert (= (and start!120014 res!936063) b!1397155))

(assert (= (and b!1397155 res!936065) b!1397153))

(assert (= (and b!1397153 res!936066) b!1397157))

(assert (= (and b!1397157 res!936064) b!1397156))

(assert (= (and b!1397156 res!936067) b!1397151))

(assert (= (and b!1397151 res!936062) b!1397149))

(assert (= (and b!1397149 res!936069) b!1397154))

(assert (= (and b!1397149 (not res!936070)) b!1397152))

(assert (= (and b!1397152 (not res!936068)) b!1397150))

(declare-fun m!1283823 () Bool)

(assert (=> b!1397152 m!1283823))

(assert (=> b!1397152 m!1283823))

(declare-fun m!1283825 () Bool)

(assert (=> b!1397152 m!1283825))

(declare-fun m!1283827 () Bool)

(assert (=> b!1397152 m!1283827))

(declare-fun m!1283829 () Bool)

(assert (=> b!1397152 m!1283829))

(declare-fun m!1283831 () Bool)

(assert (=> b!1397154 m!1283831))

(assert (=> b!1397154 m!1283831))

(declare-fun m!1283833 () Bool)

(assert (=> b!1397154 m!1283833))

(assert (=> b!1397149 m!1283831))

(declare-fun m!1283835 () Bool)

(assert (=> b!1397149 m!1283835))

(assert (=> b!1397149 m!1283831))

(declare-fun m!1283837 () Bool)

(assert (=> b!1397149 m!1283837))

(assert (=> b!1397149 m!1283831))

(declare-fun m!1283839 () Bool)

(assert (=> b!1397149 m!1283839))

(declare-fun m!1283841 () Bool)

(assert (=> b!1397149 m!1283841))

(declare-fun m!1283843 () Bool)

(assert (=> b!1397156 m!1283843))

(assert (=> b!1397157 m!1283831))

(assert (=> b!1397157 m!1283831))

(declare-fun m!1283845 () Bool)

(assert (=> b!1397157 m!1283845))

(declare-fun m!1283847 () Bool)

(assert (=> start!120014 m!1283847))

(declare-fun m!1283849 () Bool)

(assert (=> start!120014 m!1283849))

(declare-fun m!1283851 () Bool)

(assert (=> b!1397151 m!1283851))

(declare-fun m!1283853 () Bool)

(assert (=> b!1397153 m!1283853))

(assert (=> b!1397153 m!1283853))

(declare-fun m!1283855 () Bool)

(assert (=> b!1397153 m!1283855))

(declare-fun m!1283857 () Bool)

(assert (=> b!1397150 m!1283857))

(check-sat (not b!1397157) (not b!1397154) (not b!1397150) (not b!1397151) (not b!1397152) (not start!120014) (not b!1397156) (not b!1397153) (not b!1397149))
(check-sat)
