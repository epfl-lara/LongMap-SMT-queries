; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120836 () Bool)

(assert start!120836)

(declare-fun b!1405976 () Bool)

(declare-fun res!944197 () Bool)

(declare-fun e!795811 () Bool)

(assert (=> b!1405976 (=> (not res!944197) (not e!795811))))

(declare-datatypes ((array!96143 0))(
  ( (array!96144 (arr!46419 (Array (_ BitVec 32) (_ BitVec 64))) (size!46969 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96143)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405976 (= res!944197 (validKeyInArray!0 (select (arr!46419 a!2901) i!1037)))))

(declare-fun b!1405977 () Bool)

(declare-fun e!795812 () Bool)

(assert (=> b!1405977 (= e!795812 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10730 0))(
  ( (MissingZero!10730 (index!45297 (_ BitVec 32))) (Found!10730 (index!45298 (_ BitVec 32))) (Intermediate!10730 (undefined!11542 Bool) (index!45299 (_ BitVec 32)) (x!126905 (_ BitVec 32))) (Undefined!10730) (MissingVacant!10730 (index!45300 (_ BitVec 32))) )
))
(declare-fun lt!619211 () SeekEntryResult!10730)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96143 (_ BitVec 32)) SeekEntryResult!10730)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405977 (= lt!619211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46419 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46419 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96144 (store (arr!46419 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46969 a!2901)) mask!2840))))

(declare-fun b!1405978 () Bool)

(declare-fun res!944195 () Bool)

(assert (=> b!1405978 (=> (not res!944195) (not e!795811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96143 (_ BitVec 32)) Bool)

(assert (=> b!1405978 (= res!944195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!944199 () Bool)

(assert (=> start!120836 (=> (not res!944199) (not e!795811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120836 (= res!944199 (validMask!0 mask!2840))))

(assert (=> start!120836 e!795811))

(assert (=> start!120836 true))

(declare-fun array_inv!35447 (array!96143) Bool)

(assert (=> start!120836 (array_inv!35447 a!2901)))

(declare-fun b!1405979 () Bool)

(declare-fun res!944194 () Bool)

(assert (=> b!1405979 (=> (not res!944194) (not e!795811))))

(assert (=> b!1405979 (= res!944194 (and (= (size!46969 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46969 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46969 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405980 () Bool)

(declare-fun res!944196 () Bool)

(assert (=> b!1405980 (=> (not res!944196) (not e!795811))))

(declare-datatypes ((List!32938 0))(
  ( (Nil!32935) (Cons!32934 (h!34188 (_ BitVec 64)) (t!47632 List!32938)) )
))
(declare-fun arrayNoDuplicates!0 (array!96143 (_ BitVec 32) List!32938) Bool)

(assert (=> b!1405980 (= res!944196 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32935))))

(declare-fun b!1405981 () Bool)

(declare-fun e!795809 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96143 (_ BitVec 32)) SeekEntryResult!10730)

(assert (=> b!1405981 (= e!795809 (= (seekEntryOrOpen!0 (select (arr!46419 a!2901) j!112) a!2901 mask!2840) (Found!10730 j!112)))))

(declare-fun b!1405982 () Bool)

(assert (=> b!1405982 (= e!795811 (not e!795812))))

(declare-fun res!944198 () Bool)

(assert (=> b!1405982 (=> res!944198 e!795812)))

(declare-fun lt!619210 () SeekEntryResult!10730)

(get-info :version)

(assert (=> b!1405982 (= res!944198 (or (not ((_ is Intermediate!10730) lt!619210)) (undefined!11542 lt!619210)))))

(assert (=> b!1405982 e!795809))

(declare-fun res!944200 () Bool)

(assert (=> b!1405982 (=> (not res!944200) (not e!795809))))

(assert (=> b!1405982 (= res!944200 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47434 0))(
  ( (Unit!47435) )
))
(declare-fun lt!619212 () Unit!47434)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96143 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47434)

(assert (=> b!1405982 (= lt!619212 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1405982 (= lt!619210 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46419 a!2901) j!112) mask!2840) (select (arr!46419 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405983 () Bool)

(declare-fun res!944193 () Bool)

(assert (=> b!1405983 (=> (not res!944193) (not e!795811))))

(assert (=> b!1405983 (= res!944193 (validKeyInArray!0 (select (arr!46419 a!2901) j!112)))))

(assert (= (and start!120836 res!944199) b!1405979))

(assert (= (and b!1405979 res!944194) b!1405976))

(assert (= (and b!1405976 res!944197) b!1405983))

(assert (= (and b!1405983 res!944193) b!1405978))

(assert (= (and b!1405978 res!944195) b!1405980))

(assert (= (and b!1405980 res!944196) b!1405982))

(assert (= (and b!1405982 res!944200) b!1405981))

(assert (= (and b!1405982 (not res!944198)) b!1405977))

(declare-fun m!1294927 () Bool)

(assert (=> b!1405983 m!1294927))

(assert (=> b!1405983 m!1294927))

(declare-fun m!1294929 () Bool)

(assert (=> b!1405983 m!1294929))

(declare-fun m!1294931 () Bool)

(assert (=> b!1405976 m!1294931))

(assert (=> b!1405976 m!1294931))

(declare-fun m!1294933 () Bool)

(assert (=> b!1405976 m!1294933))

(declare-fun m!1294935 () Bool)

(assert (=> b!1405977 m!1294935))

(declare-fun m!1294937 () Bool)

(assert (=> b!1405977 m!1294937))

(assert (=> b!1405977 m!1294937))

(declare-fun m!1294939 () Bool)

(assert (=> b!1405977 m!1294939))

(assert (=> b!1405977 m!1294939))

(assert (=> b!1405977 m!1294937))

(declare-fun m!1294941 () Bool)

(assert (=> b!1405977 m!1294941))

(declare-fun m!1294943 () Bool)

(assert (=> start!120836 m!1294943))

(declare-fun m!1294945 () Bool)

(assert (=> start!120836 m!1294945))

(assert (=> b!1405982 m!1294927))

(declare-fun m!1294947 () Bool)

(assert (=> b!1405982 m!1294947))

(assert (=> b!1405982 m!1294927))

(declare-fun m!1294949 () Bool)

(assert (=> b!1405982 m!1294949))

(assert (=> b!1405982 m!1294947))

(assert (=> b!1405982 m!1294927))

(declare-fun m!1294951 () Bool)

(assert (=> b!1405982 m!1294951))

(declare-fun m!1294953 () Bool)

(assert (=> b!1405982 m!1294953))

(declare-fun m!1294955 () Bool)

(assert (=> b!1405978 m!1294955))

(declare-fun m!1294957 () Bool)

(assert (=> b!1405980 m!1294957))

(assert (=> b!1405981 m!1294927))

(assert (=> b!1405981 m!1294927))

(declare-fun m!1294959 () Bool)

(assert (=> b!1405981 m!1294959))

(check-sat (not b!1405978) (not b!1405980) (not b!1405977) (not b!1405983) (not b!1405976) (not b!1405981) (not start!120836) (not b!1405982))
