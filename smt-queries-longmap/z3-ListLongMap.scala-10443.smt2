; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122822 () Bool)

(assert start!122822)

(declare-fun b!1424367 () Bool)

(declare-fun e!804989 () Bool)

(assert (=> b!1424367 (= e!804989 true)))

(declare-fun lt!627525 () (_ BitVec 64))

(declare-fun lt!627521 () (_ BitVec 32))

(declare-datatypes ((array!97187 0))(
  ( (array!97188 (arr!46911 (Array (_ BitVec 32) (_ BitVec 64))) (size!47461 (_ BitVec 32))) )
))
(declare-fun lt!627522 () array!97187)

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11196 0))(
  ( (MissingZero!11196 (index!47176 (_ BitVec 32))) (Found!11196 (index!47177 (_ BitVec 32))) (Intermediate!11196 (undefined!12008 Bool) (index!47178 (_ BitVec 32)) (x!128806 (_ BitVec 32))) (Undefined!11196) (MissingVacant!11196 (index!47179 (_ BitVec 32))) )
))
(declare-fun lt!627520 () SeekEntryResult!11196)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97187 (_ BitVec 32)) SeekEntryResult!11196)

(assert (=> b!1424367 (= lt!627520 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627521 lt!627525 lt!627522 mask!2608))))

(declare-fun b!1424368 () Bool)

(declare-fun res!959806 () Bool)

(declare-fun e!804986 () Bool)

(assert (=> b!1424368 (=> (not res!959806) (not e!804986))))

(declare-fun a!2831 () array!97187)

(declare-datatypes ((List!33421 0))(
  ( (Nil!33418) (Cons!33417 (h!34719 (_ BitVec 64)) (t!48115 List!33421)) )
))
(declare-fun arrayNoDuplicates!0 (array!97187 (_ BitVec 32) List!33421) Bool)

(assert (=> b!1424368 (= res!959806 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33418))))

(declare-fun b!1424369 () Bool)

(declare-fun res!959813 () Bool)

(declare-fun e!804985 () Bool)

(assert (=> b!1424369 (=> (not res!959813) (not e!804985))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424369 (= res!959813 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424370 () Bool)

(declare-fun e!804987 () Bool)

(assert (=> b!1424370 (= e!804985 (not e!804987))))

(declare-fun res!959807 () Bool)

(assert (=> b!1424370 (=> res!959807 e!804987)))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424370 (= res!959807 (or (= (select (arr!46911 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46911 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46911 a!2831) index!585) (select (arr!46911 a!2831) j!81)) (= (select (store (arr!46911 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804983 () Bool)

(assert (=> b!1424370 e!804983))

(declare-fun res!959811 () Bool)

(assert (=> b!1424370 (=> (not res!959811) (not e!804983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97187 (_ BitVec 32)) Bool)

(assert (=> b!1424370 (= res!959811 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48228 0))(
  ( (Unit!48229) )
))
(declare-fun lt!627523 () Unit!48228)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97187 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48228)

(assert (=> b!1424370 (= lt!627523 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424371 () Bool)

(declare-fun res!959808 () Bool)

(assert (=> b!1424371 (=> res!959808 e!804989)))

(declare-fun lt!627524 () SeekEntryResult!11196)

(assert (=> b!1424371 (= res!959808 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627521 (select (arr!46911 a!2831) j!81) a!2831 mask!2608) lt!627524)))))

(declare-fun b!1424372 () Bool)

(declare-fun e!804984 () Bool)

(assert (=> b!1424372 (= e!804986 e!804984)))

(declare-fun res!959809 () Bool)

(assert (=> b!1424372 (=> (not res!959809) (not e!804984))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424372 (= res!959809 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46911 a!2831) j!81) mask!2608) (select (arr!46911 a!2831) j!81) a!2831 mask!2608) lt!627524))))

(assert (=> b!1424372 (= lt!627524 (Intermediate!11196 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424373 () Bool)

(assert (=> b!1424373 (= e!804987 e!804989)))

(declare-fun res!959802 () Bool)

(assert (=> b!1424373 (=> res!959802 e!804989)))

(assert (=> b!1424373 (= res!959802 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627521 #b00000000000000000000000000000000) (bvsge lt!627521 (size!47461 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424373 (= lt!627521 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1424375 () Bool)

(declare-fun res!959801 () Bool)

(assert (=> b!1424375 (=> (not res!959801) (not e!804985))))

(declare-fun lt!627519 () SeekEntryResult!11196)

(assert (=> b!1424375 (= res!959801 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627525 lt!627522 mask!2608) lt!627519))))

(declare-fun b!1424376 () Bool)

(assert (=> b!1424376 (= e!804984 e!804985)))

(declare-fun res!959815 () Bool)

(assert (=> b!1424376 (=> (not res!959815) (not e!804985))))

(assert (=> b!1424376 (= res!959815 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627525 mask!2608) lt!627525 lt!627522 mask!2608) lt!627519))))

(assert (=> b!1424376 (= lt!627519 (Intermediate!11196 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424376 (= lt!627525 (select (store (arr!46911 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424376 (= lt!627522 (array!97188 (store (arr!46911 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47461 a!2831)))))

(declare-fun b!1424377 () Bool)

(declare-fun res!959800 () Bool)

(assert (=> b!1424377 (=> (not res!959800) (not e!804986))))

(assert (=> b!1424377 (= res!959800 (and (= (size!47461 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47461 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47461 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424378 () Bool)

(declare-fun res!959805 () Bool)

(assert (=> b!1424378 (=> (not res!959805) (not e!804985))))

(assert (=> b!1424378 (= res!959805 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46911 a!2831) j!81) a!2831 mask!2608) lt!627524))))

(declare-fun b!1424379 () Bool)

(declare-fun res!959804 () Bool)

(assert (=> b!1424379 (=> (not res!959804) (not e!804986))))

(assert (=> b!1424379 (= res!959804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424380 () Bool)

(declare-fun res!959814 () Bool)

(assert (=> b!1424380 (=> (not res!959814) (not e!804986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424380 (= res!959814 (validKeyInArray!0 (select (arr!46911 a!2831) i!982)))))

(declare-fun b!1424381 () Bool)

(declare-fun res!959810 () Bool)

(assert (=> b!1424381 (=> (not res!959810) (not e!804986))))

(assert (=> b!1424381 (= res!959810 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47461 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47461 a!2831))))))

(declare-fun b!1424382 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97187 (_ BitVec 32)) SeekEntryResult!11196)

(assert (=> b!1424382 (= e!804983 (= (seekEntryOrOpen!0 (select (arr!46911 a!2831) j!81) a!2831 mask!2608) (Found!11196 j!81)))))

(declare-fun b!1424374 () Bool)

(declare-fun res!959812 () Bool)

(assert (=> b!1424374 (=> (not res!959812) (not e!804986))))

(assert (=> b!1424374 (= res!959812 (validKeyInArray!0 (select (arr!46911 a!2831) j!81)))))

(declare-fun res!959803 () Bool)

(assert (=> start!122822 (=> (not res!959803) (not e!804986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122822 (= res!959803 (validMask!0 mask!2608))))

(assert (=> start!122822 e!804986))

(assert (=> start!122822 true))

(declare-fun array_inv!35939 (array!97187) Bool)

(assert (=> start!122822 (array_inv!35939 a!2831)))

(assert (= (and start!122822 res!959803) b!1424377))

(assert (= (and b!1424377 res!959800) b!1424380))

(assert (= (and b!1424380 res!959814) b!1424374))

(assert (= (and b!1424374 res!959812) b!1424379))

(assert (= (and b!1424379 res!959804) b!1424368))

(assert (= (and b!1424368 res!959806) b!1424381))

(assert (= (and b!1424381 res!959810) b!1424372))

(assert (= (and b!1424372 res!959809) b!1424376))

(assert (= (and b!1424376 res!959815) b!1424378))

(assert (= (and b!1424378 res!959805) b!1424375))

(assert (= (and b!1424375 res!959801) b!1424369))

(assert (= (and b!1424369 res!959813) b!1424370))

(assert (= (and b!1424370 res!959811) b!1424382))

(assert (= (and b!1424370 (not res!959807)) b!1424373))

(assert (= (and b!1424373 (not res!959802)) b!1424371))

(assert (= (and b!1424371 (not res!959808)) b!1424367))

(declare-fun m!1314915 () Bool)

(assert (=> b!1424370 m!1314915))

(declare-fun m!1314917 () Bool)

(assert (=> b!1424370 m!1314917))

(declare-fun m!1314919 () Bool)

(assert (=> b!1424370 m!1314919))

(declare-fun m!1314921 () Bool)

(assert (=> b!1424370 m!1314921))

(declare-fun m!1314923 () Bool)

(assert (=> b!1424370 m!1314923))

(declare-fun m!1314925 () Bool)

(assert (=> b!1424370 m!1314925))

(declare-fun m!1314927 () Bool)

(assert (=> b!1424379 m!1314927))

(assert (=> b!1424378 m!1314923))

(assert (=> b!1424378 m!1314923))

(declare-fun m!1314929 () Bool)

(assert (=> b!1424378 m!1314929))

(assert (=> b!1424374 m!1314923))

(assert (=> b!1424374 m!1314923))

(declare-fun m!1314931 () Bool)

(assert (=> b!1424374 m!1314931))

(declare-fun m!1314933 () Bool)

(assert (=> b!1424375 m!1314933))

(declare-fun m!1314935 () Bool)

(assert (=> b!1424373 m!1314935))

(declare-fun m!1314937 () Bool)

(assert (=> b!1424380 m!1314937))

(assert (=> b!1424380 m!1314937))

(declare-fun m!1314939 () Bool)

(assert (=> b!1424380 m!1314939))

(assert (=> b!1424382 m!1314923))

(assert (=> b!1424382 m!1314923))

(declare-fun m!1314941 () Bool)

(assert (=> b!1424382 m!1314941))

(assert (=> b!1424372 m!1314923))

(assert (=> b!1424372 m!1314923))

(declare-fun m!1314943 () Bool)

(assert (=> b!1424372 m!1314943))

(assert (=> b!1424372 m!1314943))

(assert (=> b!1424372 m!1314923))

(declare-fun m!1314945 () Bool)

(assert (=> b!1424372 m!1314945))

(declare-fun m!1314947 () Bool)

(assert (=> b!1424376 m!1314947))

(assert (=> b!1424376 m!1314947))

(declare-fun m!1314949 () Bool)

(assert (=> b!1424376 m!1314949))

(assert (=> b!1424376 m!1314915))

(declare-fun m!1314951 () Bool)

(assert (=> b!1424376 m!1314951))

(declare-fun m!1314953 () Bool)

(assert (=> b!1424368 m!1314953))

(assert (=> b!1424371 m!1314923))

(assert (=> b!1424371 m!1314923))

(declare-fun m!1314955 () Bool)

(assert (=> b!1424371 m!1314955))

(declare-fun m!1314957 () Bool)

(assert (=> start!122822 m!1314957))

(declare-fun m!1314959 () Bool)

(assert (=> start!122822 m!1314959))

(declare-fun m!1314961 () Bool)

(assert (=> b!1424367 m!1314961))

(check-sat (not b!1424374) (not b!1424370) (not b!1424380) (not b!1424373) (not b!1424372) (not b!1424376) (not b!1424378) (not b!1424371) (not start!122822) (not b!1424379) (not b!1424367) (not b!1424375) (not b!1424382) (not b!1424368))
(check-sat)
