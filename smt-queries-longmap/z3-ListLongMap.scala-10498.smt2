; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123796 () Bool)

(assert start!123796)

(declare-fun b!1434069 () Bool)

(declare-fun res!967108 () Bool)

(declare-fun e!809591 () Bool)

(assert (=> b!1434069 (=> (not res!967108) (not e!809591))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97649 0))(
  ( (array!97650 (arr!47128 (Array (_ BitVec 32) (_ BitVec 64))) (size!47679 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97649)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1434069 (= res!967108 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47679 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47679 a!2831))))))

(declare-fun b!1434070 () Bool)

(declare-fun res!967104 () Bool)

(assert (=> b!1434070 (=> (not res!967104) (not e!809591))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1434070 (= res!967104 (and (= (size!47679 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47679 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47679 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1434071 () Bool)

(declare-fun res!967100 () Bool)

(declare-fun e!809586 () Bool)

(assert (=> b!1434071 (=> (not res!967100) (not e!809586))))

(declare-datatypes ((SeekEntryResult!11309 0))(
  ( (MissingZero!11309 (index!47628 (_ BitVec 32))) (Found!11309 (index!47629 (_ BitVec 32))) (Intermediate!11309 (undefined!12121 Bool) (index!47630 (_ BitVec 32)) (x!129431 (_ BitVec 32))) (Undefined!11309) (MissingVacant!11309 (index!47631 (_ BitVec 32))) )
))
(declare-fun lt!631206 () SeekEntryResult!11309)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97649 (_ BitVec 32)) SeekEntryResult!11309)

(assert (=> b!1434071 (= res!967100 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47128 a!2831) j!81) a!2831 mask!2608) lt!631206))))

(declare-fun res!967097 () Bool)

(assert (=> start!123796 (=> (not res!967097) (not e!809591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123796 (= res!967097 (validMask!0 mask!2608))))

(assert (=> start!123796 e!809591))

(assert (=> start!123796 true))

(declare-fun array_inv!36409 (array!97649) Bool)

(assert (=> start!123796 (array_inv!36409 a!2831)))

(declare-fun b!1434068 () Bool)

(declare-fun res!967099 () Bool)

(assert (=> b!1434068 (=> (not res!967099) (not e!809591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434068 (= res!967099 (validKeyInArray!0 (select (arr!47128 a!2831) i!982)))))

(declare-fun b!1434072 () Bool)

(declare-fun res!967102 () Bool)

(assert (=> b!1434072 (=> (not res!967102) (not e!809586))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1434072 (= res!967102 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434073 () Bool)

(declare-fun e!809587 () Bool)

(assert (=> b!1434073 (= e!809587 e!809586)))

(declare-fun res!967101 () Bool)

(assert (=> b!1434073 (=> (not res!967101) (not e!809586))))

(declare-fun lt!631207 () (_ BitVec 64))

(declare-fun lt!631203 () SeekEntryResult!11309)

(declare-fun lt!631208 () array!97649)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434073 (= res!967101 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631207 mask!2608) lt!631207 lt!631208 mask!2608) lt!631203))))

(assert (=> b!1434073 (= lt!631203 (Intermediate!11309 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1434073 (= lt!631207 (select (store (arr!47128 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434073 (= lt!631208 (array!97650 (store (arr!47128 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47679 a!2831)))))

(declare-fun e!809589 () Bool)

(declare-fun b!1434074 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97649 (_ BitVec 32)) SeekEntryResult!11309)

(assert (=> b!1434074 (= e!809589 (= (seekEntryOrOpen!0 (select (arr!47128 a!2831) j!81) a!2831 mask!2608) (Found!11309 j!81)))))

(declare-fun b!1434075 () Bool)

(declare-fun e!809588 () Bool)

(assert (=> b!1434075 (= e!809588 true)))

(declare-fun lt!631205 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434075 (= lt!631205 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1434076 () Bool)

(assert (=> b!1434076 (= e!809586 (not e!809588))))

(declare-fun res!967103 () Bool)

(assert (=> b!1434076 (=> res!967103 e!809588)))

(assert (=> b!1434076 (= res!967103 (or (= (select (arr!47128 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47128 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47128 a!2831) index!585) (select (arr!47128 a!2831) j!81)) (= (select (store (arr!47128 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1434076 e!809589))

(declare-fun res!967105 () Bool)

(assert (=> b!1434076 (=> (not res!967105) (not e!809589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97649 (_ BitVec 32)) Bool)

(assert (=> b!1434076 (= res!967105 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48395 0))(
  ( (Unit!48396) )
))
(declare-fun lt!631204 () Unit!48395)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48395)

(assert (=> b!1434076 (= lt!631204 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1434077 () Bool)

(declare-fun res!967106 () Bool)

(assert (=> b!1434077 (=> (not res!967106) (not e!809586))))

(assert (=> b!1434077 (= res!967106 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631207 lt!631208 mask!2608) lt!631203))))

(declare-fun b!1434078 () Bool)

(declare-fun res!967107 () Bool)

(assert (=> b!1434078 (=> (not res!967107) (not e!809591))))

(assert (=> b!1434078 (= res!967107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1434079 () Bool)

(declare-fun res!967096 () Bool)

(assert (=> b!1434079 (=> (not res!967096) (not e!809591))))

(declare-datatypes ((List!33625 0))(
  ( (Nil!33622) (Cons!33621 (h!34955 (_ BitVec 64)) (t!48311 List!33625)) )
))
(declare-fun arrayNoDuplicates!0 (array!97649 (_ BitVec 32) List!33625) Bool)

(assert (=> b!1434079 (= res!967096 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33622))))

(declare-fun b!1434080 () Bool)

(assert (=> b!1434080 (= e!809591 e!809587)))

(declare-fun res!967098 () Bool)

(assert (=> b!1434080 (=> (not res!967098) (not e!809587))))

(assert (=> b!1434080 (= res!967098 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47128 a!2831) j!81) mask!2608) (select (arr!47128 a!2831) j!81) a!2831 mask!2608) lt!631206))))

(assert (=> b!1434080 (= lt!631206 (Intermediate!11309 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1434081 () Bool)

(declare-fun res!967095 () Bool)

(assert (=> b!1434081 (=> (not res!967095) (not e!809591))))

(assert (=> b!1434081 (= res!967095 (validKeyInArray!0 (select (arr!47128 a!2831) j!81)))))

(assert (= (and start!123796 res!967097) b!1434070))

(assert (= (and b!1434070 res!967104) b!1434068))

(assert (= (and b!1434068 res!967099) b!1434081))

(assert (= (and b!1434081 res!967095) b!1434078))

(assert (= (and b!1434078 res!967107) b!1434079))

(assert (= (and b!1434079 res!967096) b!1434069))

(assert (= (and b!1434069 res!967108) b!1434080))

(assert (= (and b!1434080 res!967098) b!1434073))

(assert (= (and b!1434073 res!967101) b!1434071))

(assert (= (and b!1434071 res!967100) b!1434077))

(assert (= (and b!1434077 res!967106) b!1434072))

(assert (= (and b!1434072 res!967102) b!1434076))

(assert (= (and b!1434076 res!967105) b!1434074))

(assert (= (and b!1434076 (not res!967103)) b!1434075))

(declare-fun m!1323991 () Bool)

(assert (=> b!1434075 m!1323991))

(declare-fun m!1323993 () Bool)

(assert (=> b!1434080 m!1323993))

(assert (=> b!1434080 m!1323993))

(declare-fun m!1323995 () Bool)

(assert (=> b!1434080 m!1323995))

(assert (=> b!1434080 m!1323995))

(assert (=> b!1434080 m!1323993))

(declare-fun m!1323997 () Bool)

(assert (=> b!1434080 m!1323997))

(declare-fun m!1323999 () Bool)

(assert (=> b!1434079 m!1323999))

(assert (=> b!1434071 m!1323993))

(assert (=> b!1434071 m!1323993))

(declare-fun m!1324001 () Bool)

(assert (=> b!1434071 m!1324001))

(declare-fun m!1324003 () Bool)

(assert (=> b!1434068 m!1324003))

(assert (=> b!1434068 m!1324003))

(declare-fun m!1324005 () Bool)

(assert (=> b!1434068 m!1324005))

(declare-fun m!1324007 () Bool)

(assert (=> b!1434077 m!1324007))

(declare-fun m!1324009 () Bool)

(assert (=> b!1434078 m!1324009))

(assert (=> b!1434081 m!1323993))

(assert (=> b!1434081 m!1323993))

(declare-fun m!1324011 () Bool)

(assert (=> b!1434081 m!1324011))

(assert (=> b!1434074 m!1323993))

(assert (=> b!1434074 m!1323993))

(declare-fun m!1324013 () Bool)

(assert (=> b!1434074 m!1324013))

(declare-fun m!1324015 () Bool)

(assert (=> b!1434073 m!1324015))

(assert (=> b!1434073 m!1324015))

(declare-fun m!1324017 () Bool)

(assert (=> b!1434073 m!1324017))

(declare-fun m!1324019 () Bool)

(assert (=> b!1434073 m!1324019))

(declare-fun m!1324021 () Bool)

(assert (=> b!1434073 m!1324021))

(assert (=> b!1434076 m!1324019))

(declare-fun m!1324023 () Bool)

(assert (=> b!1434076 m!1324023))

(declare-fun m!1324025 () Bool)

(assert (=> b!1434076 m!1324025))

(declare-fun m!1324027 () Bool)

(assert (=> b!1434076 m!1324027))

(assert (=> b!1434076 m!1323993))

(declare-fun m!1324029 () Bool)

(assert (=> b!1434076 m!1324029))

(declare-fun m!1324031 () Bool)

(assert (=> start!123796 m!1324031))

(declare-fun m!1324033 () Bool)

(assert (=> start!123796 m!1324033))

(check-sat (not b!1434080) (not b!1434068) (not b!1434079) (not b!1434081) (not b!1434077) (not b!1434071) (not b!1434075) (not b!1434073) (not start!123796) (not b!1434078) (not b!1434076) (not b!1434074))
(check-sat)
