; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122804 () Bool)

(assert start!122804)

(declare-fun b!1423935 () Bool)

(declare-fun res!959369 () Bool)

(declare-fun e!804799 () Bool)

(assert (=> b!1423935 (=> (not res!959369) (not e!804799))))

(declare-datatypes ((array!97169 0))(
  ( (array!97170 (arr!46902 (Array (_ BitVec 32) (_ BitVec 64))) (size!47452 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97169)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423935 (= res!959369 (validKeyInArray!0 (select (arr!46902 a!2831) i!982)))))

(declare-fun b!1423936 () Bool)

(declare-fun e!804796 () Bool)

(assert (=> b!1423936 (= e!804796 true)))

(declare-datatypes ((SeekEntryResult!11187 0))(
  ( (MissingZero!11187 (index!47140 (_ BitVec 32))) (Found!11187 (index!47141 (_ BitVec 32))) (Intermediate!11187 (undefined!11999 Bool) (index!47142 (_ BitVec 32)) (x!128773 (_ BitVec 32))) (Undefined!11187) (MissingVacant!11187 (index!47143 (_ BitVec 32))) )
))
(declare-fun lt!627333 () SeekEntryResult!11187)

(declare-fun lt!627331 () array!97169)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!627334 () (_ BitVec 64))

(declare-fun lt!627330 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97169 (_ BitVec 32)) SeekEntryResult!11187)

(assert (=> b!1423936 (= lt!627333 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627330 lt!627334 lt!627331 mask!2608))))

(declare-fun b!1423937 () Bool)

(declare-fun res!959382 () Bool)

(declare-fun e!804798 () Bool)

(assert (=> b!1423937 (=> (not res!959382) (not e!804798))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!627335 () SeekEntryResult!11187)

(assert (=> b!1423937 (= res!959382 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46902 a!2831) j!81) a!2831 mask!2608) lt!627335))))

(declare-fun b!1423938 () Bool)

(declare-fun res!959383 () Bool)

(assert (=> b!1423938 (=> (not res!959383) (not e!804799))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1423938 (= res!959383 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47452 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47452 a!2831))))))

(declare-fun res!959379 () Bool)

(assert (=> start!122804 (=> (not res!959379) (not e!804799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122804 (= res!959379 (validMask!0 mask!2608))))

(assert (=> start!122804 e!804799))

(assert (=> start!122804 true))

(declare-fun array_inv!35930 (array!97169) Bool)

(assert (=> start!122804 (array_inv!35930 a!2831)))

(declare-fun b!1423939 () Bool)

(declare-fun e!804794 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97169 (_ BitVec 32)) SeekEntryResult!11187)

(assert (=> b!1423939 (= e!804794 (= (seekEntryOrOpen!0 (select (arr!46902 a!2831) j!81) a!2831 mask!2608) (Found!11187 j!81)))))

(declare-fun b!1423940 () Bool)

(declare-fun e!804797 () Bool)

(assert (=> b!1423940 (= e!804799 e!804797)))

(declare-fun res!959370 () Bool)

(assert (=> b!1423940 (=> (not res!959370) (not e!804797))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423940 (= res!959370 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46902 a!2831) j!81) mask!2608) (select (arr!46902 a!2831) j!81) a!2831 mask!2608) lt!627335))))

(assert (=> b!1423940 (= lt!627335 (Intermediate!11187 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423941 () Bool)

(declare-fun e!804795 () Bool)

(assert (=> b!1423941 (= e!804798 (not e!804795))))

(declare-fun res!959375 () Bool)

(assert (=> b!1423941 (=> res!959375 e!804795)))

(assert (=> b!1423941 (= res!959375 (or (= (select (arr!46902 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46902 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46902 a!2831) index!585) (select (arr!46902 a!2831) j!81)) (= (select (store (arr!46902 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1423941 e!804794))

(declare-fun res!959380 () Bool)

(assert (=> b!1423941 (=> (not res!959380) (not e!804794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97169 (_ BitVec 32)) Bool)

(assert (=> b!1423941 (= res!959380 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48210 0))(
  ( (Unit!48211) )
))
(declare-fun lt!627332 () Unit!48210)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48210)

(assert (=> b!1423941 (= lt!627332 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423942 () Bool)

(declare-fun res!959371 () Bool)

(assert (=> b!1423942 (=> (not res!959371) (not e!804799))))

(assert (=> b!1423942 (= res!959371 (and (= (size!47452 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47452 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47452 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423943 () Bool)

(declare-fun res!959381 () Bool)

(assert (=> b!1423943 (=> (not res!959381) (not e!804798))))

(declare-fun lt!627336 () SeekEntryResult!11187)

(assert (=> b!1423943 (= res!959381 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627334 lt!627331 mask!2608) lt!627336))))

(declare-fun b!1423944 () Bool)

(assert (=> b!1423944 (= e!804795 e!804796)))

(declare-fun res!959368 () Bool)

(assert (=> b!1423944 (=> res!959368 e!804796)))

(assert (=> b!1423944 (= res!959368 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627330 #b00000000000000000000000000000000) (bvsge lt!627330 (size!47452 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423944 (= lt!627330 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423945 () Bool)

(declare-fun res!959376 () Bool)

(assert (=> b!1423945 (=> (not res!959376) (not e!804799))))

(assert (=> b!1423945 (= res!959376 (validKeyInArray!0 (select (arr!46902 a!2831) j!81)))))

(declare-fun b!1423946 () Bool)

(declare-fun res!959372 () Bool)

(assert (=> b!1423946 (=> (not res!959372) (not e!804799))))

(declare-datatypes ((List!33412 0))(
  ( (Nil!33409) (Cons!33408 (h!34710 (_ BitVec 64)) (t!48106 List!33412)) )
))
(declare-fun arrayNoDuplicates!0 (array!97169 (_ BitVec 32) List!33412) Bool)

(assert (=> b!1423946 (= res!959372 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33409))))

(declare-fun b!1423947 () Bool)

(declare-fun res!959374 () Bool)

(assert (=> b!1423947 (=> (not res!959374) (not e!804798))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423947 (= res!959374 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423948 () Bool)

(assert (=> b!1423948 (= e!804797 e!804798)))

(declare-fun res!959378 () Bool)

(assert (=> b!1423948 (=> (not res!959378) (not e!804798))))

(assert (=> b!1423948 (= res!959378 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627334 mask!2608) lt!627334 lt!627331 mask!2608) lt!627336))))

(assert (=> b!1423948 (= lt!627336 (Intermediate!11187 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423948 (= lt!627334 (select (store (arr!46902 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423948 (= lt!627331 (array!97170 (store (arr!46902 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47452 a!2831)))))

(declare-fun b!1423949 () Bool)

(declare-fun res!959373 () Bool)

(assert (=> b!1423949 (=> (not res!959373) (not e!804799))))

(assert (=> b!1423949 (= res!959373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423950 () Bool)

(declare-fun res!959377 () Bool)

(assert (=> b!1423950 (=> res!959377 e!804796)))

(assert (=> b!1423950 (= res!959377 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627330 (select (arr!46902 a!2831) j!81) a!2831 mask!2608) lt!627335)))))

(assert (= (and start!122804 res!959379) b!1423942))

(assert (= (and b!1423942 res!959371) b!1423935))

(assert (= (and b!1423935 res!959369) b!1423945))

(assert (= (and b!1423945 res!959376) b!1423949))

(assert (= (and b!1423949 res!959373) b!1423946))

(assert (= (and b!1423946 res!959372) b!1423938))

(assert (= (and b!1423938 res!959383) b!1423940))

(assert (= (and b!1423940 res!959370) b!1423948))

(assert (= (and b!1423948 res!959378) b!1423937))

(assert (= (and b!1423937 res!959382) b!1423943))

(assert (= (and b!1423943 res!959381) b!1423947))

(assert (= (and b!1423947 res!959374) b!1423941))

(assert (= (and b!1423941 res!959380) b!1423939))

(assert (= (and b!1423941 (not res!959375)) b!1423944))

(assert (= (and b!1423944 (not res!959368)) b!1423950))

(assert (= (and b!1423950 (not res!959377)) b!1423936))

(declare-fun m!1314483 () Bool)

(assert (=> b!1423949 m!1314483))

(declare-fun m!1314485 () Bool)

(assert (=> b!1423943 m!1314485))

(declare-fun m!1314487 () Bool)

(assert (=> b!1423937 m!1314487))

(assert (=> b!1423937 m!1314487))

(declare-fun m!1314489 () Bool)

(assert (=> b!1423937 m!1314489))

(assert (=> b!1423940 m!1314487))

(assert (=> b!1423940 m!1314487))

(declare-fun m!1314491 () Bool)

(assert (=> b!1423940 m!1314491))

(assert (=> b!1423940 m!1314491))

(assert (=> b!1423940 m!1314487))

(declare-fun m!1314493 () Bool)

(assert (=> b!1423940 m!1314493))

(declare-fun m!1314495 () Bool)

(assert (=> b!1423948 m!1314495))

(assert (=> b!1423948 m!1314495))

(declare-fun m!1314497 () Bool)

(assert (=> b!1423948 m!1314497))

(declare-fun m!1314499 () Bool)

(assert (=> b!1423948 m!1314499))

(declare-fun m!1314501 () Bool)

(assert (=> b!1423948 m!1314501))

(declare-fun m!1314503 () Bool)

(assert (=> b!1423935 m!1314503))

(assert (=> b!1423935 m!1314503))

(declare-fun m!1314505 () Bool)

(assert (=> b!1423935 m!1314505))

(declare-fun m!1314507 () Bool)

(assert (=> b!1423936 m!1314507))

(declare-fun m!1314509 () Bool)

(assert (=> start!122804 m!1314509))

(declare-fun m!1314511 () Bool)

(assert (=> start!122804 m!1314511))

(assert (=> b!1423941 m!1314499))

(declare-fun m!1314513 () Bool)

(assert (=> b!1423941 m!1314513))

(declare-fun m!1314515 () Bool)

(assert (=> b!1423941 m!1314515))

(declare-fun m!1314517 () Bool)

(assert (=> b!1423941 m!1314517))

(assert (=> b!1423941 m!1314487))

(declare-fun m!1314519 () Bool)

(assert (=> b!1423941 m!1314519))

(declare-fun m!1314521 () Bool)

(assert (=> b!1423946 m!1314521))

(assert (=> b!1423950 m!1314487))

(assert (=> b!1423950 m!1314487))

(declare-fun m!1314523 () Bool)

(assert (=> b!1423950 m!1314523))

(declare-fun m!1314525 () Bool)

(assert (=> b!1423944 m!1314525))

(assert (=> b!1423939 m!1314487))

(assert (=> b!1423939 m!1314487))

(declare-fun m!1314527 () Bool)

(assert (=> b!1423939 m!1314527))

(assert (=> b!1423945 m!1314487))

(assert (=> b!1423945 m!1314487))

(declare-fun m!1314529 () Bool)

(assert (=> b!1423945 m!1314529))

(check-sat (not b!1423935) (not b!1423941) (not b!1423948) (not b!1423945) (not b!1423937) (not b!1423946) (not b!1423943) (not b!1423936) (not b!1423940) (not b!1423944) (not b!1423939) (not b!1423949) (not b!1423950) (not start!122804))
(check-sat)
