; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123518 () Bool)

(assert start!123518)

(declare-fun b!1431899 () Bool)

(declare-fun res!965877 () Bool)

(declare-fun e!808349 () Bool)

(assert (=> b!1431899 (=> (not res!965877) (not e!808349))))

(declare-datatypes ((array!97455 0))(
  ( (array!97456 (arr!47035 (Array (_ BitVec 32) (_ BitVec 64))) (size!47587 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97455)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97455 (_ BitVec 32)) Bool)

(assert (=> b!1431899 (= res!965877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431900 () Bool)

(declare-fun e!808350 () Bool)

(assert (=> b!1431900 (= e!808350 true)))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!630212 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431900 (= lt!630212 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1431901 () Bool)

(declare-fun e!808345 () Bool)

(assert (=> b!1431901 (= e!808345 (not e!808350))))

(declare-fun res!965868 () Bool)

(assert (=> b!1431901 (=> res!965868 e!808350)))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1431901 (= res!965868 (or (= (select (arr!47035 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47035 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47035 a!2831) index!585) (select (arr!47035 a!2831) j!81)) (= (select (store (arr!47035 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808348 () Bool)

(assert (=> b!1431901 e!808348))

(declare-fun res!965875 () Bool)

(assert (=> b!1431901 (=> (not res!965875) (not e!808348))))

(assert (=> b!1431901 (= res!965875 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48267 0))(
  ( (Unit!48268) )
))
(declare-fun lt!630210 () Unit!48267)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48267)

(assert (=> b!1431901 (= lt!630210 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431902 () Bool)

(declare-fun res!965869 () Bool)

(assert (=> b!1431902 (=> (not res!965869) (not e!808349))))

(assert (=> b!1431902 (= res!965869 (and (= (size!47587 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47587 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47587 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431903 () Bool)

(declare-fun res!965870 () Bool)

(assert (=> b!1431903 (=> (not res!965870) (not e!808349))))

(declare-datatypes ((List!33623 0))(
  ( (Nil!33620) (Cons!33619 (h!34942 (_ BitVec 64)) (t!48309 List!33623)) )
))
(declare-fun arrayNoDuplicates!0 (array!97455 (_ BitVec 32) List!33623) Bool)

(assert (=> b!1431903 (= res!965870 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33620))))

(declare-fun b!1431904 () Bool)

(declare-datatypes ((SeekEntryResult!11341 0))(
  ( (MissingZero!11341 (index!47756 (_ BitVec 32))) (Found!11341 (index!47757 (_ BitVec 32))) (Intermediate!11341 (undefined!12153 Bool) (index!47758 (_ BitVec 32)) (x!129394 (_ BitVec 32))) (Undefined!11341) (MissingVacant!11341 (index!47759 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97455 (_ BitVec 32)) SeekEntryResult!11341)

(assert (=> b!1431904 (= e!808348 (= (seekEntryOrOpen!0 (select (arr!47035 a!2831) j!81) a!2831 mask!2608) (Found!11341 j!81)))))

(declare-fun b!1431905 () Bool)

(declare-fun e!808346 () Bool)

(assert (=> b!1431905 (= e!808349 e!808346)))

(declare-fun res!965874 () Bool)

(assert (=> b!1431905 (=> (not res!965874) (not e!808346))))

(declare-fun lt!630213 () SeekEntryResult!11341)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97455 (_ BitVec 32)) SeekEntryResult!11341)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431905 (= res!965874 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47035 a!2831) j!81) mask!2608) (select (arr!47035 a!2831) j!81) a!2831 mask!2608) lt!630213))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1431905 (= lt!630213 (Intermediate!11341 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431906 () Bool)

(declare-fun res!965872 () Bool)

(assert (=> b!1431906 (=> (not res!965872) (not e!808345))))

(declare-fun lt!630208 () (_ BitVec 64))

(declare-fun lt!630209 () SeekEntryResult!11341)

(declare-fun lt!630211 () array!97455)

(assert (=> b!1431906 (= res!965872 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630208 lt!630211 mask!2608) lt!630209))))

(declare-fun b!1431907 () Bool)

(declare-fun res!965871 () Bool)

(assert (=> b!1431907 (=> (not res!965871) (not e!808349))))

(assert (=> b!1431907 (= res!965871 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47587 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47587 a!2831))))))

(declare-fun b!1431908 () Bool)

(declare-fun res!965880 () Bool)

(assert (=> b!1431908 (=> (not res!965880) (not e!808349))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431908 (= res!965880 (validKeyInArray!0 (select (arr!47035 a!2831) i!982)))))

(declare-fun res!965879 () Bool)

(assert (=> start!123518 (=> (not res!965879) (not e!808349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123518 (= res!965879 (validMask!0 mask!2608))))

(assert (=> start!123518 e!808349))

(assert (=> start!123518 true))

(declare-fun array_inv!36268 (array!97455) Bool)

(assert (=> start!123518 (array_inv!36268 a!2831)))

(declare-fun b!1431909 () Bool)

(declare-fun res!965876 () Bool)

(assert (=> b!1431909 (=> (not res!965876) (not e!808345))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431909 (= res!965876 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431910 () Bool)

(declare-fun res!965881 () Bool)

(assert (=> b!1431910 (=> (not res!965881) (not e!808349))))

(assert (=> b!1431910 (= res!965881 (validKeyInArray!0 (select (arr!47035 a!2831) j!81)))))

(declare-fun b!1431911 () Bool)

(declare-fun res!965878 () Bool)

(assert (=> b!1431911 (=> (not res!965878) (not e!808345))))

(assert (=> b!1431911 (= res!965878 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47035 a!2831) j!81) a!2831 mask!2608) lt!630213))))

(declare-fun b!1431912 () Bool)

(assert (=> b!1431912 (= e!808346 e!808345)))

(declare-fun res!965873 () Bool)

(assert (=> b!1431912 (=> (not res!965873) (not e!808345))))

(assert (=> b!1431912 (= res!965873 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630208 mask!2608) lt!630208 lt!630211 mask!2608) lt!630209))))

(assert (=> b!1431912 (= lt!630209 (Intermediate!11341 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431912 (= lt!630208 (select (store (arr!47035 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431912 (= lt!630211 (array!97456 (store (arr!47035 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47587 a!2831)))))

(assert (= (and start!123518 res!965879) b!1431902))

(assert (= (and b!1431902 res!965869) b!1431908))

(assert (= (and b!1431908 res!965880) b!1431910))

(assert (= (and b!1431910 res!965881) b!1431899))

(assert (= (and b!1431899 res!965877) b!1431903))

(assert (= (and b!1431903 res!965870) b!1431907))

(assert (= (and b!1431907 res!965871) b!1431905))

(assert (= (and b!1431905 res!965874) b!1431912))

(assert (= (and b!1431912 res!965873) b!1431911))

(assert (= (and b!1431911 res!965878) b!1431906))

(assert (= (and b!1431906 res!965872) b!1431909))

(assert (= (and b!1431909 res!965876) b!1431901))

(assert (= (and b!1431901 res!965875) b!1431904))

(assert (= (and b!1431901 (not res!965868)) b!1431900))

(declare-fun m!1321205 () Bool)

(assert (=> b!1431912 m!1321205))

(assert (=> b!1431912 m!1321205))

(declare-fun m!1321207 () Bool)

(assert (=> b!1431912 m!1321207))

(declare-fun m!1321209 () Bool)

(assert (=> b!1431912 m!1321209))

(declare-fun m!1321211 () Bool)

(assert (=> b!1431912 m!1321211))

(declare-fun m!1321213 () Bool)

(assert (=> b!1431906 m!1321213))

(declare-fun m!1321215 () Bool)

(assert (=> b!1431910 m!1321215))

(assert (=> b!1431910 m!1321215))

(declare-fun m!1321217 () Bool)

(assert (=> b!1431910 m!1321217))

(declare-fun m!1321219 () Bool)

(assert (=> b!1431908 m!1321219))

(assert (=> b!1431908 m!1321219))

(declare-fun m!1321221 () Bool)

(assert (=> b!1431908 m!1321221))

(declare-fun m!1321223 () Bool)

(assert (=> start!123518 m!1321223))

(declare-fun m!1321225 () Bool)

(assert (=> start!123518 m!1321225))

(declare-fun m!1321227 () Bool)

(assert (=> b!1431900 m!1321227))

(declare-fun m!1321229 () Bool)

(assert (=> b!1431899 m!1321229))

(assert (=> b!1431904 m!1321215))

(assert (=> b!1431904 m!1321215))

(declare-fun m!1321231 () Bool)

(assert (=> b!1431904 m!1321231))

(assert (=> b!1431901 m!1321209))

(declare-fun m!1321233 () Bool)

(assert (=> b!1431901 m!1321233))

(declare-fun m!1321235 () Bool)

(assert (=> b!1431901 m!1321235))

(declare-fun m!1321237 () Bool)

(assert (=> b!1431901 m!1321237))

(assert (=> b!1431901 m!1321215))

(declare-fun m!1321239 () Bool)

(assert (=> b!1431901 m!1321239))

(assert (=> b!1431905 m!1321215))

(assert (=> b!1431905 m!1321215))

(declare-fun m!1321241 () Bool)

(assert (=> b!1431905 m!1321241))

(assert (=> b!1431905 m!1321241))

(assert (=> b!1431905 m!1321215))

(declare-fun m!1321243 () Bool)

(assert (=> b!1431905 m!1321243))

(declare-fun m!1321245 () Bool)

(assert (=> b!1431903 m!1321245))

(assert (=> b!1431911 m!1321215))

(assert (=> b!1431911 m!1321215))

(declare-fun m!1321247 () Bool)

(assert (=> b!1431911 m!1321247))

(check-sat (not b!1431911) (not b!1431910) (not b!1431900) (not b!1431904) (not b!1431905) (not b!1431908) (not b!1431903) (not b!1431912) (not b!1431901) (not b!1431906) (not b!1431899) (not start!123518))
(check-sat)
