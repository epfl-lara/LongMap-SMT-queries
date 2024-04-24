; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123080 () Bool)

(assert start!123080)

(declare-fun b!1426200 () Bool)

(declare-fun res!960757 () Bool)

(declare-fun e!806080 () Bool)

(assert (=> b!1426200 (=> (not res!960757) (not e!806080))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97316 0))(
  ( (array!97317 (arr!46972 (Array (_ BitVec 32) (_ BitVec 64))) (size!47523 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97316)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11159 0))(
  ( (MissingZero!11159 (index!47028 (_ BitVec 32))) (Found!11159 (index!47029 (_ BitVec 32))) (Intermediate!11159 (undefined!11971 Bool) (index!47030 (_ BitVec 32)) (x!128818 (_ BitVec 32))) (Undefined!11159) (MissingVacant!11159 (index!47031 (_ BitVec 32))) )
))
(declare-fun lt!628222 () SeekEntryResult!11159)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97316 (_ BitVec 32)) SeekEntryResult!11159)

(assert (=> b!1426200 (= res!960757 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46972 a!2831) j!81) a!2831 mask!2608) lt!628222))))

(declare-fun b!1426201 () Bool)

(declare-fun res!960752 () Bool)

(declare-fun e!806082 () Bool)

(assert (=> b!1426201 (=> (not res!960752) (not e!806082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426201 (= res!960752 (validKeyInArray!0 (select (arr!46972 a!2831) j!81)))))

(declare-fun b!1426202 () Bool)

(declare-fun res!960753 () Bool)

(assert (=> b!1426202 (=> (not res!960753) (not e!806082))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1426202 (= res!960753 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47523 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47523 a!2831))))))

(declare-fun b!1426203 () Bool)

(declare-fun res!960756 () Bool)

(assert (=> b!1426203 (=> (not res!960756) (not e!806082))))

(declare-datatypes ((List!33469 0))(
  ( (Nil!33466) (Cons!33465 (h!34778 (_ BitVec 64)) (t!48155 List!33469)) )
))
(declare-fun arrayNoDuplicates!0 (array!97316 (_ BitVec 32) List!33469) Bool)

(assert (=> b!1426203 (= res!960756 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33466))))

(declare-fun b!1426204 () Bool)

(declare-fun res!960760 () Bool)

(assert (=> b!1426204 (=> (not res!960760) (not e!806080))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426204 (= res!960760 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1426205 () Bool)

(declare-fun e!806079 () Bool)

(assert (=> b!1426205 (= e!806082 e!806079)))

(declare-fun res!960748 () Bool)

(assert (=> b!1426205 (=> (not res!960748) (not e!806079))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426205 (= res!960748 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46972 a!2831) j!81) mask!2608) (select (arr!46972 a!2831) j!81) a!2831 mask!2608) lt!628222))))

(assert (=> b!1426205 (= lt!628222 (Intermediate!11159 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426206 () Bool)

(declare-fun e!806084 () Bool)

(assert (=> b!1426206 (= e!806084 true)))

(declare-fun lt!628219 () (_ BitVec 32))

(declare-fun lt!628218 () (_ BitVec 64))

(declare-fun lt!628221 () array!97316)

(declare-fun lt!628220 () SeekEntryResult!11159)

(assert (=> b!1426206 (= lt!628220 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!628219 lt!628218 lt!628221 mask!2608))))

(declare-fun b!1426207 () Bool)

(declare-fun res!960758 () Bool)

(assert (=> b!1426207 (=> (not res!960758) (not e!806082))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426207 (= res!960758 (validKeyInArray!0 (select (arr!46972 a!2831) i!982)))))

(declare-fun b!1426208 () Bool)

(declare-fun res!960754 () Bool)

(assert (=> b!1426208 (=> (not res!960754) (not e!806082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97316 (_ BitVec 32)) Bool)

(assert (=> b!1426208 (= res!960754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426209 () Bool)

(declare-fun res!960750 () Bool)

(assert (=> b!1426209 (=> (not res!960750) (not e!806082))))

(assert (=> b!1426209 (= res!960750 (and (= (size!47523 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47523 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47523 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426210 () Bool)

(declare-fun res!960759 () Bool)

(assert (=> b!1426210 (=> (not res!960759) (not e!806080))))

(declare-fun lt!628223 () SeekEntryResult!11159)

(assert (=> b!1426210 (= res!960759 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628218 lt!628221 mask!2608) lt!628223))))

(declare-fun b!1426211 () Bool)

(declare-fun e!806078 () Bool)

(assert (=> b!1426211 (= e!806078 e!806084)))

(declare-fun res!960751 () Bool)

(assert (=> b!1426211 (=> res!960751 e!806084)))

(assert (=> b!1426211 (= res!960751 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!628219 #b00000000000000000000000000000000) (bvsge lt!628219 (size!47523 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426211 (= lt!628219 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1426212 () Bool)

(declare-fun e!806081 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97316 (_ BitVec 32)) SeekEntryResult!11159)

(assert (=> b!1426212 (= e!806081 (= (seekEntryOrOpen!0 (select (arr!46972 a!2831) j!81) a!2831 mask!2608) (Found!11159 j!81)))))

(declare-fun b!1426213 () Bool)

(assert (=> b!1426213 (= e!806079 e!806080)))

(declare-fun res!960749 () Bool)

(assert (=> b!1426213 (=> (not res!960749) (not e!806080))))

(assert (=> b!1426213 (= res!960749 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628218 mask!2608) lt!628218 lt!628221 mask!2608) lt!628223))))

(assert (=> b!1426213 (= lt!628223 (Intermediate!11159 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1426213 (= lt!628218 (select (store (arr!46972 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426213 (= lt!628221 (array!97317 (store (arr!46972 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47523 a!2831)))))

(declare-fun res!960763 () Bool)

(assert (=> start!123080 (=> (not res!960763) (not e!806082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123080 (= res!960763 (validMask!0 mask!2608))))

(assert (=> start!123080 e!806082))

(assert (=> start!123080 true))

(declare-fun array_inv!36253 (array!97316) Bool)

(assert (=> start!123080 (array_inv!36253 a!2831)))

(declare-fun b!1426214 () Bool)

(declare-fun res!960761 () Bool)

(assert (=> b!1426214 (=> res!960761 e!806084)))

(assert (=> b!1426214 (= res!960761 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!628219 (select (arr!46972 a!2831) j!81) a!2831 mask!2608) lt!628222)))))

(declare-fun b!1426215 () Bool)

(assert (=> b!1426215 (= e!806080 (not e!806078))))

(declare-fun res!960755 () Bool)

(assert (=> b!1426215 (=> res!960755 e!806078)))

(assert (=> b!1426215 (= res!960755 (or (= (select (arr!46972 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46972 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46972 a!2831) index!585) (select (arr!46972 a!2831) j!81)) (= (select (store (arr!46972 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1426215 e!806081))

(declare-fun res!960762 () Bool)

(assert (=> b!1426215 (=> (not res!960762) (not e!806081))))

(assert (=> b!1426215 (= res!960762 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48185 0))(
  ( (Unit!48186) )
))
(declare-fun lt!628217 () Unit!48185)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48185)

(assert (=> b!1426215 (= lt!628217 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!123080 res!960763) b!1426209))

(assert (= (and b!1426209 res!960750) b!1426207))

(assert (= (and b!1426207 res!960758) b!1426201))

(assert (= (and b!1426201 res!960752) b!1426208))

(assert (= (and b!1426208 res!960754) b!1426203))

(assert (= (and b!1426203 res!960756) b!1426202))

(assert (= (and b!1426202 res!960753) b!1426205))

(assert (= (and b!1426205 res!960748) b!1426213))

(assert (= (and b!1426213 res!960749) b!1426200))

(assert (= (and b!1426200 res!960757) b!1426210))

(assert (= (and b!1426210 res!960759) b!1426204))

(assert (= (and b!1426204 res!960760) b!1426215))

(assert (= (and b!1426215 res!960762) b!1426212))

(assert (= (and b!1426215 (not res!960755)) b!1426211))

(assert (= (and b!1426211 (not res!960751)) b!1426214))

(assert (= (and b!1426214 (not res!960761)) b!1426206))

(declare-fun m!1316865 () Bool)

(assert (=> b!1426215 m!1316865))

(declare-fun m!1316867 () Bool)

(assert (=> b!1426215 m!1316867))

(declare-fun m!1316869 () Bool)

(assert (=> b!1426215 m!1316869))

(declare-fun m!1316871 () Bool)

(assert (=> b!1426215 m!1316871))

(declare-fun m!1316873 () Bool)

(assert (=> b!1426215 m!1316873))

(declare-fun m!1316875 () Bool)

(assert (=> b!1426215 m!1316875))

(assert (=> b!1426201 m!1316873))

(assert (=> b!1426201 m!1316873))

(declare-fun m!1316877 () Bool)

(assert (=> b!1426201 m!1316877))

(declare-fun m!1316879 () Bool)

(assert (=> b!1426203 m!1316879))

(declare-fun m!1316881 () Bool)

(assert (=> start!123080 m!1316881))

(declare-fun m!1316883 () Bool)

(assert (=> start!123080 m!1316883))

(declare-fun m!1316885 () Bool)

(assert (=> b!1426213 m!1316885))

(assert (=> b!1426213 m!1316885))

(declare-fun m!1316887 () Bool)

(assert (=> b!1426213 m!1316887))

(assert (=> b!1426213 m!1316865))

(declare-fun m!1316889 () Bool)

(assert (=> b!1426213 m!1316889))

(assert (=> b!1426212 m!1316873))

(assert (=> b!1426212 m!1316873))

(declare-fun m!1316891 () Bool)

(assert (=> b!1426212 m!1316891))

(declare-fun m!1316893 () Bool)

(assert (=> b!1426206 m!1316893))

(assert (=> b!1426205 m!1316873))

(assert (=> b!1426205 m!1316873))

(declare-fun m!1316895 () Bool)

(assert (=> b!1426205 m!1316895))

(assert (=> b!1426205 m!1316895))

(assert (=> b!1426205 m!1316873))

(declare-fun m!1316897 () Bool)

(assert (=> b!1426205 m!1316897))

(assert (=> b!1426200 m!1316873))

(assert (=> b!1426200 m!1316873))

(declare-fun m!1316899 () Bool)

(assert (=> b!1426200 m!1316899))

(declare-fun m!1316901 () Bool)

(assert (=> b!1426211 m!1316901))

(declare-fun m!1316903 () Bool)

(assert (=> b!1426210 m!1316903))

(assert (=> b!1426214 m!1316873))

(assert (=> b!1426214 m!1316873))

(declare-fun m!1316905 () Bool)

(assert (=> b!1426214 m!1316905))

(declare-fun m!1316907 () Bool)

(assert (=> b!1426208 m!1316907))

(declare-fun m!1316909 () Bool)

(assert (=> b!1426207 m!1316909))

(assert (=> b!1426207 m!1316909))

(declare-fun m!1316911 () Bool)

(assert (=> b!1426207 m!1316911))

(check-sat (not b!1426212) (not b!1426200) (not b!1426203) (not b!1426208) (not b!1426205) (not b!1426213) (not b!1426206) (not b!1426201) (not start!123080) (not b!1426215) (not b!1426214) (not b!1426207) (not b!1426211) (not b!1426210))
(check-sat)
