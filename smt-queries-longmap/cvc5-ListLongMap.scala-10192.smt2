; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120078 () Bool)

(assert start!120078)

(declare-fun b!1398013 () Bool)

(declare-fun res!936928 () Bool)

(declare-fun e!791452 () Bool)

(assert (=> b!1398013 (=> (not res!936928) (not e!791452))))

(declare-datatypes ((array!95607 0))(
  ( (array!95608 (arr!46157 (Array (_ BitVec 32) (_ BitVec 64))) (size!46707 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95607)

(declare-datatypes ((List!32676 0))(
  ( (Nil!32673) (Cons!32672 (h!33914 (_ BitVec 64)) (t!47370 List!32676)) )
))
(declare-fun arrayNoDuplicates!0 (array!95607 (_ BitVec 32) List!32676) Bool)

(assert (=> b!1398013 (= res!936928 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32673))))

(declare-fun b!1398014 () Bool)

(declare-fun e!791453 () Bool)

(declare-fun e!791450 () Bool)

(assert (=> b!1398014 (= e!791453 e!791450)))

(declare-fun res!936931 () Bool)

(assert (=> b!1398014 (=> res!936931 e!791450)))

(declare-datatypes ((SeekEntryResult!10474 0))(
  ( (MissingZero!10474 (index!44267 (_ BitVec 32))) (Found!10474 (index!44268 (_ BitVec 32))) (Intermediate!10474 (undefined!11286 Bool) (index!44269 (_ BitVec 32)) (x!125920 (_ BitVec 32))) (Undefined!10474) (MissingVacant!10474 (index!44270 (_ BitVec 32))) )
))
(declare-fun lt!614649 () SeekEntryResult!10474)

(declare-fun lt!614651 () SeekEntryResult!10474)

(assert (=> b!1398014 (= res!936931 (or (= lt!614649 lt!614651) (not (is-Intermediate!10474 lt!614651))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!614652 () (_ BitVec 64))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95607 (_ BitVec 32)) SeekEntryResult!10474)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398014 (= lt!614651 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614652 mask!2840) lt!614652 (array!95608 (store (arr!46157 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46707 a!2901)) mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398014 (= lt!614652 (select (store (arr!46157 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398015 () Bool)

(declare-fun res!936930 () Bool)

(assert (=> b!1398015 (=> (not res!936930) (not e!791452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398015 (= res!936930 (validKeyInArray!0 (select (arr!46157 a!2901) j!112)))))

(declare-fun b!1398016 () Bool)

(assert (=> b!1398016 (= e!791452 (not e!791453))))

(declare-fun res!936926 () Bool)

(assert (=> b!1398016 (=> res!936926 e!791453)))

(assert (=> b!1398016 (= res!936926 (or (not (is-Intermediate!10474 lt!614649)) (undefined!11286 lt!614649)))))

(declare-fun e!791449 () Bool)

(assert (=> b!1398016 e!791449))

(declare-fun res!936932 () Bool)

(assert (=> b!1398016 (=> (not res!936932) (not e!791449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95607 (_ BitVec 32)) Bool)

(assert (=> b!1398016 (= res!936932 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46952 0))(
  ( (Unit!46953) )
))
(declare-fun lt!614648 () Unit!46952)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46952)

(assert (=> b!1398016 (= lt!614648 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614650 () (_ BitVec 32))

(assert (=> b!1398016 (= lt!614649 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614650 (select (arr!46157 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398016 (= lt!614650 (toIndex!0 (select (arr!46157 a!2901) j!112) mask!2840))))

(declare-fun res!936933 () Bool)

(assert (=> start!120078 (=> (not res!936933) (not e!791452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120078 (= res!936933 (validMask!0 mask!2840))))

(assert (=> start!120078 e!791452))

(assert (=> start!120078 true))

(declare-fun array_inv!35185 (array!95607) Bool)

(assert (=> start!120078 (array_inv!35185 a!2901)))

(declare-fun b!1398017 () Bool)

(declare-fun res!936934 () Bool)

(assert (=> b!1398017 (=> (not res!936934) (not e!791452))))

(assert (=> b!1398017 (= res!936934 (validKeyInArray!0 (select (arr!46157 a!2901) i!1037)))))

(declare-fun b!1398018 () Bool)

(declare-fun res!936927 () Bool)

(assert (=> b!1398018 (=> (not res!936927) (not e!791452))))

(assert (=> b!1398018 (= res!936927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398019 () Bool)

(declare-fun res!936929 () Bool)

(assert (=> b!1398019 (=> (not res!936929) (not e!791452))))

(assert (=> b!1398019 (= res!936929 (and (= (size!46707 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46707 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46707 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398020 () Bool)

(assert (=> b!1398020 (= e!791450 true)))

(assert (=> b!1398020 (and (not (undefined!11286 lt!614651)) (= (index!44269 lt!614651) i!1037) (bvslt (x!125920 lt!614651) (x!125920 lt!614649)) (= (select (store (arr!46157 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44269 lt!614651)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614647 () Unit!46952)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46952)

(assert (=> b!1398020 (= lt!614647 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614650 (x!125920 lt!614649) (index!44269 lt!614649) (x!125920 lt!614651) (index!44269 lt!614651) (undefined!11286 lt!614651) mask!2840))))

(declare-fun b!1398021 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95607 (_ BitVec 32)) SeekEntryResult!10474)

(assert (=> b!1398021 (= e!791449 (= (seekEntryOrOpen!0 (select (arr!46157 a!2901) j!112) a!2901 mask!2840) (Found!10474 j!112)))))

(assert (= (and start!120078 res!936933) b!1398019))

(assert (= (and b!1398019 res!936929) b!1398017))

(assert (= (and b!1398017 res!936934) b!1398015))

(assert (= (and b!1398015 res!936930) b!1398018))

(assert (= (and b!1398018 res!936927) b!1398013))

(assert (= (and b!1398013 res!936928) b!1398016))

(assert (= (and b!1398016 res!936932) b!1398021))

(assert (= (and b!1398016 (not res!936926)) b!1398014))

(assert (= (and b!1398014 (not res!936931)) b!1398020))

(declare-fun m!1284975 () Bool)

(assert (=> b!1398020 m!1284975))

(declare-fun m!1284977 () Bool)

(assert (=> b!1398020 m!1284977))

(declare-fun m!1284979 () Bool)

(assert (=> b!1398020 m!1284979))

(declare-fun m!1284981 () Bool)

(assert (=> b!1398018 m!1284981))

(declare-fun m!1284983 () Bool)

(assert (=> b!1398021 m!1284983))

(assert (=> b!1398021 m!1284983))

(declare-fun m!1284985 () Bool)

(assert (=> b!1398021 m!1284985))

(assert (=> b!1398016 m!1284983))

(declare-fun m!1284987 () Bool)

(assert (=> b!1398016 m!1284987))

(assert (=> b!1398016 m!1284983))

(declare-fun m!1284989 () Bool)

(assert (=> b!1398016 m!1284989))

(assert (=> b!1398016 m!1284983))

(declare-fun m!1284991 () Bool)

(assert (=> b!1398016 m!1284991))

(declare-fun m!1284993 () Bool)

(assert (=> b!1398016 m!1284993))

(assert (=> b!1398015 m!1284983))

(assert (=> b!1398015 m!1284983))

(declare-fun m!1284995 () Bool)

(assert (=> b!1398015 m!1284995))

(declare-fun m!1284997 () Bool)

(assert (=> b!1398013 m!1284997))

(declare-fun m!1284999 () Bool)

(assert (=> b!1398014 m!1284999))

(assert (=> b!1398014 m!1284975))

(assert (=> b!1398014 m!1284999))

(declare-fun m!1285001 () Bool)

(assert (=> b!1398014 m!1285001))

(declare-fun m!1285003 () Bool)

(assert (=> b!1398014 m!1285003))

(declare-fun m!1285005 () Bool)

(assert (=> start!120078 m!1285005))

(declare-fun m!1285007 () Bool)

(assert (=> start!120078 m!1285007))

(declare-fun m!1285009 () Bool)

(assert (=> b!1398017 m!1285009))

(assert (=> b!1398017 m!1285009))

(declare-fun m!1285011 () Bool)

(assert (=> b!1398017 m!1285011))

(push 1)

