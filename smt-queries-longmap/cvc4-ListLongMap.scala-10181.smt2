; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120016 () Bool)

(assert start!120016)

(declare-fun b!1397176 () Bool)

(declare-fun res!936093 () Bool)

(declare-fun e!790988 () Bool)

(assert (=> b!1397176 (=> (not res!936093) (not e!790988))))

(declare-datatypes ((array!95545 0))(
  ( (array!95546 (arr!46126 (Array (_ BitVec 32) (_ BitVec 64))) (size!46676 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95545)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397176 (= res!936093 (validKeyInArray!0 (select (arr!46126 a!2901) i!1037)))))

(declare-fun b!1397177 () Bool)

(declare-fun e!790986 () Bool)

(assert (=> b!1397177 (= e!790986 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!613999 () array!95545)

(declare-fun lt!614002 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10443 0))(
  ( (MissingZero!10443 (index!44143 (_ BitVec 32))) (Found!10443 (index!44144 (_ BitVec 32))) (Intermediate!10443 (undefined!11255 Bool) (index!44145 (_ BitVec 32)) (x!125801 (_ BitVec 32))) (Undefined!10443) (MissingVacant!10443 (index!44146 (_ BitVec 32))) )
))
(declare-fun lt!613998 () SeekEntryResult!10443)

(declare-fun lt!614001 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95545 (_ BitVec 32)) SeekEntryResult!10443)

(assert (=> b!1397177 (= lt!613998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614002 lt!614001 lt!613999 mask!2840))))

(declare-fun b!1397178 () Bool)

(declare-fun e!790985 () Bool)

(assert (=> b!1397178 (= e!790985 e!790986)))

(declare-fun res!936097 () Bool)

(assert (=> b!1397178 (=> res!936097 e!790986)))

(declare-fun lt!614003 () SeekEntryResult!10443)

(declare-fun lt!614004 () SeekEntryResult!10443)

(assert (=> b!1397178 (= res!936097 (or (= lt!614003 lt!614004) (not (is-Intermediate!10443 lt!614004)) (bvslt (x!125801 lt!614003) #b00000000000000000000000000000000) (bvsgt (x!125801 lt!614003) #b01111111111111111111111111111110) (bvslt lt!614002 #b00000000000000000000000000000000) (bvsge lt!614002 (size!46676 a!2901)) (bvslt (index!44145 lt!614003) #b00000000000000000000000000000000) (bvsge (index!44145 lt!614003) (size!46676 a!2901)) (not (= lt!614003 (Intermediate!10443 false (index!44145 lt!614003) (x!125801 lt!614003)))) (not (= lt!614004 (Intermediate!10443 (undefined!11255 lt!614004) (index!44145 lt!614004) (x!125801 lt!614004))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397178 (= lt!614004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614001 mask!2840) lt!614001 lt!613999 mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397178 (= lt!614001 (select (store (arr!46126 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397178 (= lt!613999 (array!95546 (store (arr!46126 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46676 a!2901)))))

(declare-fun b!1397179 () Bool)

(declare-fun res!936096 () Bool)

(assert (=> b!1397179 (=> (not res!936096) (not e!790988))))

(assert (=> b!1397179 (= res!936096 (validKeyInArray!0 (select (arr!46126 a!2901) j!112)))))

(declare-fun e!790987 () Bool)

(declare-fun b!1397180 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95545 (_ BitVec 32)) SeekEntryResult!10443)

(assert (=> b!1397180 (= e!790987 (= (seekEntryOrOpen!0 (select (arr!46126 a!2901) j!112) a!2901 mask!2840) (Found!10443 j!112)))))

(declare-fun b!1397181 () Bool)

(declare-fun res!936095 () Bool)

(assert (=> b!1397181 (=> (not res!936095) (not e!790988))))

(declare-datatypes ((List!32645 0))(
  ( (Nil!32642) (Cons!32641 (h!33883 (_ BitVec 64)) (t!47339 List!32645)) )
))
(declare-fun arrayNoDuplicates!0 (array!95545 (_ BitVec 32) List!32645) Bool)

(assert (=> b!1397181 (= res!936095 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32642))))

(declare-fun res!936092 () Bool)

(assert (=> start!120016 (=> (not res!936092) (not e!790988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120016 (= res!936092 (validMask!0 mask!2840))))

(assert (=> start!120016 e!790988))

(assert (=> start!120016 true))

(declare-fun array_inv!35154 (array!95545) Bool)

(assert (=> start!120016 (array_inv!35154 a!2901)))

(declare-fun b!1397182 () Bool)

(assert (=> b!1397182 (= e!790988 (not e!790985))))

(declare-fun res!936089 () Bool)

(assert (=> b!1397182 (=> res!936089 e!790985)))

(assert (=> b!1397182 (= res!936089 (or (not (is-Intermediate!10443 lt!614003)) (undefined!11255 lt!614003)))))

(assert (=> b!1397182 e!790987))

(declare-fun res!936090 () Bool)

(assert (=> b!1397182 (=> (not res!936090) (not e!790987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95545 (_ BitVec 32)) Bool)

(assert (=> b!1397182 (= res!936090 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46890 0))(
  ( (Unit!46891) )
))
(declare-fun lt!614000 () Unit!46890)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95545 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46890)

(assert (=> b!1397182 (= lt!614000 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397182 (= lt!614003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614002 (select (arr!46126 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397182 (= lt!614002 (toIndex!0 (select (arr!46126 a!2901) j!112) mask!2840))))

(declare-fun b!1397183 () Bool)

(declare-fun res!936094 () Bool)

(assert (=> b!1397183 (=> (not res!936094) (not e!790988))))

(assert (=> b!1397183 (= res!936094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397184 () Bool)

(declare-fun res!936091 () Bool)

(assert (=> b!1397184 (=> (not res!936091) (not e!790988))))

(assert (=> b!1397184 (= res!936091 (and (= (size!46676 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46676 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46676 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120016 res!936092) b!1397184))

(assert (= (and b!1397184 res!936091) b!1397176))

(assert (= (and b!1397176 res!936093) b!1397179))

(assert (= (and b!1397179 res!936096) b!1397183))

(assert (= (and b!1397183 res!936094) b!1397181))

(assert (= (and b!1397181 res!936095) b!1397182))

(assert (= (and b!1397182 res!936090) b!1397180))

(assert (= (and b!1397182 (not res!936089)) b!1397178))

(assert (= (and b!1397178 (not res!936097)) b!1397177))

(declare-fun m!1283859 () Bool)

(assert (=> b!1397176 m!1283859))

(assert (=> b!1397176 m!1283859))

(declare-fun m!1283861 () Bool)

(assert (=> b!1397176 m!1283861))

(declare-fun m!1283863 () Bool)

(assert (=> start!120016 m!1283863))

(declare-fun m!1283865 () Bool)

(assert (=> start!120016 m!1283865))

(declare-fun m!1283867 () Bool)

(assert (=> b!1397177 m!1283867))

(declare-fun m!1283869 () Bool)

(assert (=> b!1397181 m!1283869))

(declare-fun m!1283871 () Bool)

(assert (=> b!1397182 m!1283871))

(declare-fun m!1283873 () Bool)

(assert (=> b!1397182 m!1283873))

(assert (=> b!1397182 m!1283871))

(assert (=> b!1397182 m!1283871))

(declare-fun m!1283875 () Bool)

(assert (=> b!1397182 m!1283875))

(declare-fun m!1283877 () Bool)

(assert (=> b!1397182 m!1283877))

(declare-fun m!1283879 () Bool)

(assert (=> b!1397182 m!1283879))

(assert (=> b!1397179 m!1283871))

(assert (=> b!1397179 m!1283871))

(declare-fun m!1283881 () Bool)

(assert (=> b!1397179 m!1283881))

(declare-fun m!1283883 () Bool)

(assert (=> b!1397183 m!1283883))

(declare-fun m!1283885 () Bool)

(assert (=> b!1397178 m!1283885))

(assert (=> b!1397178 m!1283885))

(declare-fun m!1283887 () Bool)

(assert (=> b!1397178 m!1283887))

(declare-fun m!1283889 () Bool)

(assert (=> b!1397178 m!1283889))

(declare-fun m!1283891 () Bool)

(assert (=> b!1397178 m!1283891))

(assert (=> b!1397180 m!1283871))

(assert (=> b!1397180 m!1283871))

(declare-fun m!1283893 () Bool)

(assert (=> b!1397180 m!1283893))

(push 1)

