; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122820 () Bool)

(assert start!122820)

(declare-fun b!1424319 () Bool)

(declare-fun e!804964 () Bool)

(declare-fun e!804963 () Bool)

(assert (=> b!1424319 (= e!804964 e!804963)))

(declare-fun res!959763 () Bool)

(assert (=> b!1424319 (=> (not res!959763) (not e!804963))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97185 0))(
  ( (array!97186 (arr!46910 (Array (_ BitVec 32) (_ BitVec 64))) (size!47460 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97185)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11195 0))(
  ( (MissingZero!11195 (index!47172 (_ BitVec 32))) (Found!11195 (index!47173 (_ BitVec 32))) (Intermediate!11195 (undefined!12007 Bool) (index!47174 (_ BitVec 32)) (x!128805 (_ BitVec 32))) (Undefined!11195) (MissingVacant!11195 (index!47175 (_ BitVec 32))) )
))
(declare-fun lt!627501 () SeekEntryResult!11195)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97185 (_ BitVec 32)) SeekEntryResult!11195)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424319 (= res!959763 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46910 a!2831) j!81) mask!2608) (select (arr!46910 a!2831) j!81) a!2831 mask!2608) lt!627501))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1424319 (= lt!627501 (Intermediate!11195 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424320 () Bool)

(declare-fun res!959753 () Bool)

(assert (=> b!1424320 (=> (not res!959753) (not e!804964))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424320 (= res!959753 (and (= (size!47460 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47460 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47460 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424321 () Bool)

(declare-fun e!804966 () Bool)

(assert (=> b!1424321 (= e!804963 e!804966)))

(declare-fun res!959762 () Bool)

(assert (=> b!1424321 (=> (not res!959762) (not e!804966))))

(declare-fun lt!627499 () SeekEntryResult!11195)

(declare-fun lt!627500 () (_ BitVec 64))

(declare-fun lt!627502 () array!97185)

(assert (=> b!1424321 (= res!959762 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627500 mask!2608) lt!627500 lt!627502 mask!2608) lt!627499))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424321 (= lt!627499 (Intermediate!11195 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424321 (= lt!627500 (select (store (arr!46910 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424321 (= lt!627502 (array!97186 (store (arr!46910 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47460 a!2831)))))

(declare-fun b!1424322 () Bool)

(declare-fun e!804965 () Bool)

(assert (=> b!1424322 (= e!804966 (not e!804965))))

(declare-fun res!959759 () Bool)

(assert (=> b!1424322 (=> res!959759 e!804965)))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1424322 (= res!959759 (or (= (select (arr!46910 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46910 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46910 a!2831) index!585) (select (arr!46910 a!2831) j!81)) (= (select (store (arr!46910 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804968 () Bool)

(assert (=> b!1424322 e!804968))

(declare-fun res!959764 () Bool)

(assert (=> b!1424322 (=> (not res!959764) (not e!804968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97185 (_ BitVec 32)) Bool)

(assert (=> b!1424322 (= res!959764 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48226 0))(
  ( (Unit!48227) )
))
(declare-fun lt!627503 () Unit!48226)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48226)

(assert (=> b!1424322 (= lt!627503 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424323 () Bool)

(declare-fun res!959755 () Bool)

(assert (=> b!1424323 (=> (not res!959755) (not e!804966))))

(assert (=> b!1424323 (= res!959755 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424324 () Bool)

(declare-fun res!959766 () Bool)

(assert (=> b!1424324 (=> (not res!959766) (not e!804966))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1424324 (= res!959766 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627500 lt!627502 mask!2608) lt!627499))))

(declare-fun b!1424325 () Bool)

(declare-fun res!959767 () Bool)

(assert (=> b!1424325 (=> (not res!959767) (not e!804964))))

(assert (=> b!1424325 (= res!959767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424327 () Bool)

(declare-fun res!959765 () Bool)

(declare-fun e!804962 () Bool)

(assert (=> b!1424327 (=> res!959765 e!804962)))

(declare-fun lt!627498 () (_ BitVec 32))

(assert (=> b!1424327 (= res!959765 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627498 (select (arr!46910 a!2831) j!81) a!2831 mask!2608) lt!627501)))))

(declare-fun b!1424328 () Bool)

(declare-fun res!959756 () Bool)

(assert (=> b!1424328 (=> (not res!959756) (not e!804964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424328 (= res!959756 (validKeyInArray!0 (select (arr!46910 a!2831) i!982)))))

(declare-fun b!1424329 () Bool)

(declare-fun res!959754 () Bool)

(assert (=> b!1424329 (=> (not res!959754) (not e!804964))))

(declare-datatypes ((List!33420 0))(
  ( (Nil!33417) (Cons!33416 (h!34718 (_ BitVec 64)) (t!48114 List!33420)) )
))
(declare-fun arrayNoDuplicates!0 (array!97185 (_ BitVec 32) List!33420) Bool)

(assert (=> b!1424329 (= res!959754 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33417))))

(declare-fun b!1424330 () Bool)

(declare-fun res!959752 () Bool)

(assert (=> b!1424330 (=> (not res!959752) (not e!804964))))

(assert (=> b!1424330 (= res!959752 (validKeyInArray!0 (select (arr!46910 a!2831) j!81)))))

(declare-fun b!1424331 () Bool)

(declare-fun res!959758 () Bool)

(assert (=> b!1424331 (=> (not res!959758) (not e!804964))))

(assert (=> b!1424331 (= res!959758 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47460 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47460 a!2831))))))

(declare-fun b!1424332 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97185 (_ BitVec 32)) SeekEntryResult!11195)

(assert (=> b!1424332 (= e!804968 (= (seekEntryOrOpen!0 (select (arr!46910 a!2831) j!81) a!2831 mask!2608) (Found!11195 j!81)))))

(declare-fun res!959761 () Bool)

(assert (=> start!122820 (=> (not res!959761) (not e!804964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122820 (= res!959761 (validMask!0 mask!2608))))

(assert (=> start!122820 e!804964))

(assert (=> start!122820 true))

(declare-fun array_inv!35938 (array!97185) Bool)

(assert (=> start!122820 (array_inv!35938 a!2831)))

(declare-fun b!1424326 () Bool)

(declare-fun res!959757 () Bool)

(assert (=> b!1424326 (=> (not res!959757) (not e!804966))))

(assert (=> b!1424326 (= res!959757 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46910 a!2831) j!81) a!2831 mask!2608) lt!627501))))

(declare-fun b!1424333 () Bool)

(assert (=> b!1424333 (= e!804962 true)))

(declare-fun lt!627504 () SeekEntryResult!11195)

(assert (=> b!1424333 (= lt!627504 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627498 lt!627500 lt!627502 mask!2608))))

(declare-fun b!1424334 () Bool)

(assert (=> b!1424334 (= e!804965 e!804962)))

(declare-fun res!959760 () Bool)

(assert (=> b!1424334 (=> res!959760 e!804962)))

(assert (=> b!1424334 (= res!959760 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627498 #b00000000000000000000000000000000) (bvsge lt!627498 (size!47460 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424334 (= lt!627498 (nextIndex!0 index!585 x!605 mask!2608))))

(assert (= (and start!122820 res!959761) b!1424320))

(assert (= (and b!1424320 res!959753) b!1424328))

(assert (= (and b!1424328 res!959756) b!1424330))

(assert (= (and b!1424330 res!959752) b!1424325))

(assert (= (and b!1424325 res!959767) b!1424329))

(assert (= (and b!1424329 res!959754) b!1424331))

(assert (= (and b!1424331 res!959758) b!1424319))

(assert (= (and b!1424319 res!959763) b!1424321))

(assert (= (and b!1424321 res!959762) b!1424326))

(assert (= (and b!1424326 res!959757) b!1424324))

(assert (= (and b!1424324 res!959766) b!1424323))

(assert (= (and b!1424323 res!959755) b!1424322))

(assert (= (and b!1424322 res!959764) b!1424332))

(assert (= (and b!1424322 (not res!959759)) b!1424334))

(assert (= (and b!1424334 (not res!959760)) b!1424327))

(assert (= (and b!1424327 (not res!959765)) b!1424333))

(declare-fun m!1314867 () Bool)

(assert (=> b!1424321 m!1314867))

(assert (=> b!1424321 m!1314867))

(declare-fun m!1314869 () Bool)

(assert (=> b!1424321 m!1314869))

(declare-fun m!1314871 () Bool)

(assert (=> b!1424321 m!1314871))

(declare-fun m!1314873 () Bool)

(assert (=> b!1424321 m!1314873))

(declare-fun m!1314875 () Bool)

(assert (=> b!1424324 m!1314875))

(declare-fun m!1314877 () Bool)

(assert (=> b!1424329 m!1314877))

(declare-fun m!1314879 () Bool)

(assert (=> start!122820 m!1314879))

(declare-fun m!1314881 () Bool)

(assert (=> start!122820 m!1314881))

(declare-fun m!1314883 () Bool)

(assert (=> b!1424333 m!1314883))

(declare-fun m!1314885 () Bool)

(assert (=> b!1424328 m!1314885))

(assert (=> b!1424328 m!1314885))

(declare-fun m!1314887 () Bool)

(assert (=> b!1424328 m!1314887))

(declare-fun m!1314889 () Bool)

(assert (=> b!1424327 m!1314889))

(assert (=> b!1424327 m!1314889))

(declare-fun m!1314891 () Bool)

(assert (=> b!1424327 m!1314891))

(assert (=> b!1424332 m!1314889))

(assert (=> b!1424332 m!1314889))

(declare-fun m!1314893 () Bool)

(assert (=> b!1424332 m!1314893))

(declare-fun m!1314895 () Bool)

(assert (=> b!1424325 m!1314895))

(assert (=> b!1424322 m!1314871))

(declare-fun m!1314897 () Bool)

(assert (=> b!1424322 m!1314897))

(declare-fun m!1314899 () Bool)

(assert (=> b!1424322 m!1314899))

(declare-fun m!1314901 () Bool)

(assert (=> b!1424322 m!1314901))

(assert (=> b!1424322 m!1314889))

(declare-fun m!1314903 () Bool)

(assert (=> b!1424322 m!1314903))

(declare-fun m!1314905 () Bool)

(assert (=> b!1424334 m!1314905))

(assert (=> b!1424319 m!1314889))

(assert (=> b!1424319 m!1314889))

(declare-fun m!1314907 () Bool)

(assert (=> b!1424319 m!1314907))

(assert (=> b!1424319 m!1314907))

(assert (=> b!1424319 m!1314889))

(declare-fun m!1314909 () Bool)

(assert (=> b!1424319 m!1314909))

(assert (=> b!1424326 m!1314889))

(assert (=> b!1424326 m!1314889))

(declare-fun m!1314911 () Bool)

(assert (=> b!1424326 m!1314911))

(assert (=> b!1424330 m!1314889))

(assert (=> b!1424330 m!1314889))

(declare-fun m!1314913 () Bool)

(assert (=> b!1424330 m!1314913))

(push 1)

