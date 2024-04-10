; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123544 () Bool)

(assert start!123544)

(declare-fun b!1432277 () Bool)

(declare-fun res!966141 () Bool)

(declare-fun e!808533 () Bool)

(assert (=> b!1432277 (=> (not res!966141) (not e!808533))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97516 0))(
  ( (array!97517 (arr!47065 (Array (_ BitVec 32) (_ BitVec 64))) (size!47615 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97516)

(declare-datatypes ((SeekEntryResult!11344 0))(
  ( (MissingZero!11344 (index!47768 (_ BitVec 32))) (Found!11344 (index!47769 (_ BitVec 32))) (Intermediate!11344 (undefined!12156 Bool) (index!47770 (_ BitVec 32)) (x!129410 (_ BitVec 32))) (Undefined!11344) (MissingVacant!11344 (index!47771 (_ BitVec 32))) )
))
(declare-fun lt!630525 () SeekEntryResult!11344)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97516 (_ BitVec 32)) SeekEntryResult!11344)

(assert (=> b!1432277 (= res!966141 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47065 a!2831) j!81) a!2831 mask!2608) lt!630525))))

(declare-fun b!1432278 () Bool)

(declare-fun res!966142 () Bool)

(declare-fun e!808535 () Bool)

(assert (=> b!1432278 (=> (not res!966142) (not e!808535))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432278 (= res!966142 (validKeyInArray!0 (select (arr!47065 a!2831) i!982)))))

(declare-fun b!1432279 () Bool)

(declare-fun e!808532 () Bool)

(assert (=> b!1432279 (= e!808532 true)))

(declare-fun lt!630527 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432279 (= lt!630527 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432280 () Bool)

(declare-fun res!966146 () Bool)

(assert (=> b!1432280 (=> (not res!966146) (not e!808535))))

(assert (=> b!1432280 (= res!966146 (validKeyInArray!0 (select (arr!47065 a!2831) j!81)))))

(declare-fun b!1432281 () Bool)

(declare-fun res!966154 () Bool)

(assert (=> b!1432281 (=> (not res!966154) (not e!808535))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1432281 (= res!966154 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47615 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47615 a!2831))))))

(declare-fun res!966152 () Bool)

(assert (=> start!123544 (=> (not res!966152) (not e!808535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123544 (= res!966152 (validMask!0 mask!2608))))

(assert (=> start!123544 e!808535))

(assert (=> start!123544 true))

(declare-fun array_inv!36093 (array!97516) Bool)

(assert (=> start!123544 (array_inv!36093 a!2831)))

(declare-fun b!1432282 () Bool)

(declare-fun res!966150 () Bool)

(assert (=> b!1432282 (=> (not res!966150) (not e!808535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97516 (_ BitVec 32)) Bool)

(assert (=> b!1432282 (= res!966150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432283 () Bool)

(declare-fun res!966153 () Bool)

(assert (=> b!1432283 (=> (not res!966153) (not e!808535))))

(declare-datatypes ((List!33575 0))(
  ( (Nil!33572) (Cons!33571 (h!34894 (_ BitVec 64)) (t!48269 List!33575)) )
))
(declare-fun arrayNoDuplicates!0 (array!97516 (_ BitVec 32) List!33575) Bool)

(assert (=> b!1432283 (= res!966153 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33572))))

(declare-fun b!1432284 () Bool)

(declare-fun e!808534 () Bool)

(assert (=> b!1432284 (= e!808535 e!808534)))

(declare-fun res!966147 () Bool)

(assert (=> b!1432284 (=> (not res!966147) (not e!808534))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432284 (= res!966147 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47065 a!2831) j!81) mask!2608) (select (arr!47065 a!2831) j!81) a!2831 mask!2608) lt!630525))))

(assert (=> b!1432284 (= lt!630525 (Intermediate!11344 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432285 () Bool)

(declare-fun res!966149 () Bool)

(assert (=> b!1432285 (=> (not res!966149) (not e!808533))))

(declare-fun lt!630524 () (_ BitVec 64))

(declare-fun lt!630523 () SeekEntryResult!11344)

(declare-fun lt!630526 () array!97516)

(assert (=> b!1432285 (= res!966149 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630524 lt!630526 mask!2608) lt!630523))))

(declare-fun e!808530 () Bool)

(declare-fun b!1432286 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97516 (_ BitVec 32)) SeekEntryResult!11344)

(assert (=> b!1432286 (= e!808530 (= (seekEntryOrOpen!0 (select (arr!47065 a!2831) j!81) a!2831 mask!2608) (Found!11344 j!81)))))

(declare-fun b!1432287 () Bool)

(declare-fun res!966151 () Bool)

(assert (=> b!1432287 (=> (not res!966151) (not e!808533))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432287 (= res!966151 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432288 () Bool)

(assert (=> b!1432288 (= e!808533 (not e!808532))))

(declare-fun res!966148 () Bool)

(assert (=> b!1432288 (=> res!966148 e!808532)))

(assert (=> b!1432288 (= res!966148 (or (= (select (arr!47065 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47065 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47065 a!2831) index!585) (select (arr!47065 a!2831) j!81)) (= (select (store (arr!47065 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1432288 e!808530))

(declare-fun res!966143 () Bool)

(assert (=> b!1432288 (=> (not res!966143) (not e!808530))))

(assert (=> b!1432288 (= res!966143 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48434 0))(
  ( (Unit!48435) )
))
(declare-fun lt!630528 () Unit!48434)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97516 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48434)

(assert (=> b!1432288 (= lt!630528 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432289 () Bool)

(assert (=> b!1432289 (= e!808534 e!808533)))

(declare-fun res!966144 () Bool)

(assert (=> b!1432289 (=> (not res!966144) (not e!808533))))

(assert (=> b!1432289 (= res!966144 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630524 mask!2608) lt!630524 lt!630526 mask!2608) lt!630523))))

(assert (=> b!1432289 (= lt!630523 (Intermediate!11344 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432289 (= lt!630524 (select (store (arr!47065 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432289 (= lt!630526 (array!97517 (store (arr!47065 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47615 a!2831)))))

(declare-fun b!1432290 () Bool)

(declare-fun res!966145 () Bool)

(assert (=> b!1432290 (=> (not res!966145) (not e!808535))))

(assert (=> b!1432290 (= res!966145 (and (= (size!47615 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47615 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47615 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123544 res!966152) b!1432290))

(assert (= (and b!1432290 res!966145) b!1432278))

(assert (= (and b!1432278 res!966142) b!1432280))

(assert (= (and b!1432280 res!966146) b!1432282))

(assert (= (and b!1432282 res!966150) b!1432283))

(assert (= (and b!1432283 res!966153) b!1432281))

(assert (= (and b!1432281 res!966154) b!1432284))

(assert (= (and b!1432284 res!966147) b!1432289))

(assert (= (and b!1432289 res!966144) b!1432277))

(assert (= (and b!1432277 res!966141) b!1432285))

(assert (= (and b!1432285 res!966149) b!1432287))

(assert (= (and b!1432287 res!966151) b!1432288))

(assert (= (and b!1432288 res!966143) b!1432286))

(assert (= (and b!1432288 (not res!966148)) b!1432279))

(declare-fun m!1322077 () Bool)

(assert (=> b!1432277 m!1322077))

(assert (=> b!1432277 m!1322077))

(declare-fun m!1322079 () Bool)

(assert (=> b!1432277 m!1322079))

(declare-fun m!1322081 () Bool)

(assert (=> b!1432283 m!1322081))

(declare-fun m!1322083 () Bool)

(assert (=> b!1432285 m!1322083))

(declare-fun m!1322085 () Bool)

(assert (=> b!1432279 m!1322085))

(declare-fun m!1322087 () Bool)

(assert (=> b!1432288 m!1322087))

(declare-fun m!1322089 () Bool)

(assert (=> b!1432288 m!1322089))

(declare-fun m!1322091 () Bool)

(assert (=> b!1432288 m!1322091))

(declare-fun m!1322093 () Bool)

(assert (=> b!1432288 m!1322093))

(assert (=> b!1432288 m!1322077))

(declare-fun m!1322095 () Bool)

(assert (=> b!1432288 m!1322095))

(assert (=> b!1432286 m!1322077))

(assert (=> b!1432286 m!1322077))

(declare-fun m!1322097 () Bool)

(assert (=> b!1432286 m!1322097))

(assert (=> b!1432284 m!1322077))

(assert (=> b!1432284 m!1322077))

(declare-fun m!1322099 () Bool)

(assert (=> b!1432284 m!1322099))

(assert (=> b!1432284 m!1322099))

(assert (=> b!1432284 m!1322077))

(declare-fun m!1322101 () Bool)

(assert (=> b!1432284 m!1322101))

(declare-fun m!1322103 () Bool)

(assert (=> b!1432278 m!1322103))

(assert (=> b!1432278 m!1322103))

(declare-fun m!1322105 () Bool)

(assert (=> b!1432278 m!1322105))

(assert (=> b!1432280 m!1322077))

(assert (=> b!1432280 m!1322077))

(declare-fun m!1322107 () Bool)

(assert (=> b!1432280 m!1322107))

(declare-fun m!1322109 () Bool)

(assert (=> b!1432289 m!1322109))

(assert (=> b!1432289 m!1322109))

(declare-fun m!1322111 () Bool)

(assert (=> b!1432289 m!1322111))

(assert (=> b!1432289 m!1322087))

(declare-fun m!1322113 () Bool)

(assert (=> b!1432289 m!1322113))

(declare-fun m!1322115 () Bool)

(assert (=> b!1432282 m!1322115))

(declare-fun m!1322117 () Bool)

(assert (=> start!123544 m!1322117))

(declare-fun m!1322119 () Bool)

(assert (=> start!123544 m!1322119))

(push 1)

