; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119132 () Bool)

(assert start!119132)

(declare-fun b!1389749 () Bool)

(declare-fun res!929961 () Bool)

(declare-fun e!787132 () Bool)

(assert (=> b!1389749 (=> (not res!929961) (not e!787132))))

(declare-datatypes ((array!95022 0))(
  ( (array!95023 (arr!45877 (Array (_ BitVec 32) (_ BitVec 64))) (size!46429 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95022)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95022 (_ BitVec 32)) Bool)

(assert (=> b!1389749 (= res!929961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389750 () Bool)

(declare-fun res!929965 () Bool)

(assert (=> b!1389750 (=> (not res!929965) (not e!787132))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389750 (= res!929965 (validKeyInArray!0 (select (arr!45877 a!2901) i!1037)))))

(declare-fun b!1389751 () Bool)

(declare-fun res!929962 () Bool)

(assert (=> b!1389751 (=> (not res!929962) (not e!787132))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389751 (= res!929962 (and (= (size!46429 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46429 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46429 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389748 () Bool)

(declare-fun res!929964 () Bool)

(assert (=> b!1389748 (=> (not res!929964) (not e!787132))))

(declare-datatypes ((List!32474 0))(
  ( (Nil!32471) (Cons!32470 (h!33688 (_ BitVec 64)) (t!47160 List!32474)) )
))
(declare-fun arrayNoDuplicates!0 (array!95022 (_ BitVec 32) List!32474) Bool)

(assert (=> b!1389748 (= res!929964 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32471))))

(declare-fun res!929963 () Bool)

(assert (=> start!119132 (=> (not res!929963) (not e!787132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119132 (= res!929963 (validMask!0 mask!2840))))

(assert (=> start!119132 e!787132))

(assert (=> start!119132 true))

(declare-fun array_inv!35110 (array!95022) Bool)

(assert (=> start!119132 (array_inv!35110 a!2901)))

(declare-fun b!1389752 () Bool)

(assert (=> b!1389752 (= e!787132 (not (bvsge mask!2840 #b00000000000000000000000000000000)))))

(assert (=> b!1389752 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46287 0))(
  ( (Unit!46288) )
))
(declare-fun lt!610453 () Unit!46287)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95022 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46287)

(assert (=> b!1389752 (= lt!610453 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10220 0))(
  ( (MissingZero!10220 (index!43251 (_ BitVec 32))) (Found!10220 (index!43252 (_ BitVec 32))) (Intermediate!10220 (undefined!11032 Bool) (index!43253 (_ BitVec 32)) (x!124935 (_ BitVec 32))) (Undefined!10220) (MissingVacant!10220 (index!43254 (_ BitVec 32))) )
))
(declare-fun lt!610454 () SeekEntryResult!10220)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95022 (_ BitVec 32)) SeekEntryResult!10220)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389752 (= lt!610454 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45877 a!2901) j!112) mask!2840) (select (arr!45877 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389753 () Bool)

(declare-fun res!929960 () Bool)

(assert (=> b!1389753 (=> (not res!929960) (not e!787132))))

(assert (=> b!1389753 (= res!929960 (validKeyInArray!0 (select (arr!45877 a!2901) j!112)))))

(assert (= (and start!119132 res!929963) b!1389751))

(assert (= (and b!1389751 res!929962) b!1389750))

(assert (= (and b!1389750 res!929965) b!1389753))

(assert (= (and b!1389753 res!929960) b!1389749))

(assert (= (and b!1389749 res!929961) b!1389748))

(assert (= (and b!1389748 res!929964) b!1389752))

(declare-fun m!1274983 () Bool)

(assert (=> b!1389749 m!1274983))

(declare-fun m!1274985 () Bool)

(assert (=> b!1389750 m!1274985))

(assert (=> b!1389750 m!1274985))

(declare-fun m!1274987 () Bool)

(assert (=> b!1389750 m!1274987))

(declare-fun m!1274989 () Bool)

(assert (=> b!1389748 m!1274989))

(declare-fun m!1274991 () Bool)

(assert (=> b!1389753 m!1274991))

(assert (=> b!1389753 m!1274991))

(declare-fun m!1274993 () Bool)

(assert (=> b!1389753 m!1274993))

(assert (=> b!1389752 m!1274991))

(declare-fun m!1274995 () Bool)

(assert (=> b!1389752 m!1274995))

(assert (=> b!1389752 m!1274991))

(declare-fun m!1274997 () Bool)

(assert (=> b!1389752 m!1274997))

(assert (=> b!1389752 m!1274995))

(assert (=> b!1389752 m!1274991))

(declare-fun m!1274999 () Bool)

(assert (=> b!1389752 m!1274999))

(declare-fun m!1275001 () Bool)

(assert (=> b!1389752 m!1275001))

(declare-fun m!1275003 () Bool)

(assert (=> start!119132 m!1275003))

(declare-fun m!1275005 () Bool)

(assert (=> start!119132 m!1275005))

(check-sat (not b!1389749) (not b!1389750) (not b!1389753) (not b!1389752) (not start!119132) (not b!1389748))
(check-sat)
