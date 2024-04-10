; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123540 () Bool)

(assert start!123540)

(declare-fun b!1432193 () Bool)

(declare-fun res!966062 () Bool)

(declare-fun e!808496 () Bool)

(assert (=> b!1432193 (=> (not res!966062) (not e!808496))))

(declare-datatypes ((array!97512 0))(
  ( (array!97513 (arr!47063 (Array (_ BitVec 32) (_ BitVec 64))) (size!47613 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97512)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432193 (= res!966062 (validKeyInArray!0 (select (arr!47063 a!2831) i!982)))))

(declare-fun b!1432194 () Bool)

(declare-fun e!808494 () Bool)

(assert (=> b!1432194 (= e!808494 true)))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!630490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432194 (= lt!630490 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432195 () Bool)

(declare-fun e!808497 () Bool)

(assert (=> b!1432195 (= e!808496 e!808497)))

(declare-fun res!966061 () Bool)

(assert (=> b!1432195 (=> (not res!966061) (not e!808497))))

(declare-datatypes ((SeekEntryResult!11342 0))(
  ( (MissingZero!11342 (index!47760 (_ BitVec 32))) (Found!11342 (index!47761 (_ BitVec 32))) (Intermediate!11342 (undefined!12154 Bool) (index!47762 (_ BitVec 32)) (x!129408 (_ BitVec 32))) (Undefined!11342) (MissingVacant!11342 (index!47763 (_ BitVec 32))) )
))
(declare-fun lt!630489 () SeekEntryResult!11342)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97512 (_ BitVec 32)) SeekEntryResult!11342)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432195 (= res!966061 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47063 a!2831) j!81) mask!2608) (select (arr!47063 a!2831) j!81) a!2831 mask!2608) lt!630489))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1432195 (= lt!630489 (Intermediate!11342 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432196 () Bool)

(declare-fun e!808495 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97512 (_ BitVec 32)) SeekEntryResult!11342)

(assert (=> b!1432196 (= e!808495 (= (seekEntryOrOpen!0 (select (arr!47063 a!2831) j!81) a!2831 mask!2608) (Found!11342 j!81)))))

(declare-fun b!1432197 () Bool)

(declare-fun res!966060 () Bool)

(assert (=> b!1432197 (=> (not res!966060) (not e!808496))))

(assert (=> b!1432197 (= res!966060 (and (= (size!47613 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47613 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47613 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432198 () Bool)

(declare-fun e!808498 () Bool)

(assert (=> b!1432198 (= e!808497 e!808498)))

(declare-fun res!966064 () Bool)

(assert (=> b!1432198 (=> (not res!966064) (not e!808498))))

(declare-fun lt!630487 () SeekEntryResult!11342)

(declare-fun lt!630491 () (_ BitVec 64))

(declare-fun lt!630492 () array!97512)

(assert (=> b!1432198 (= res!966064 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630491 mask!2608) lt!630491 lt!630492 mask!2608) lt!630487))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432198 (= lt!630487 (Intermediate!11342 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432198 (= lt!630491 (select (store (arr!47063 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432198 (= lt!630492 (array!97513 (store (arr!47063 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47613 a!2831)))))

(declare-fun b!1432199 () Bool)

(assert (=> b!1432199 (= e!808498 (not e!808494))))

(declare-fun res!966067 () Bool)

(assert (=> b!1432199 (=> res!966067 e!808494)))

(assert (=> b!1432199 (= res!966067 (or (= (select (arr!47063 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47063 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47063 a!2831) index!585) (select (arr!47063 a!2831) j!81)) (= (select (store (arr!47063 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1432199 e!808495))

(declare-fun res!966070 () Bool)

(assert (=> b!1432199 (=> (not res!966070) (not e!808495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97512 (_ BitVec 32)) Bool)

(assert (=> b!1432199 (= res!966070 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48430 0))(
  ( (Unit!48431) )
))
(declare-fun lt!630488 () Unit!48430)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48430)

(assert (=> b!1432199 (= lt!630488 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun res!966066 () Bool)

(assert (=> start!123540 (=> (not res!966066) (not e!808496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123540 (= res!966066 (validMask!0 mask!2608))))

(assert (=> start!123540 e!808496))

(assert (=> start!123540 true))

(declare-fun array_inv!36091 (array!97512) Bool)

(assert (=> start!123540 (array_inv!36091 a!2831)))

(declare-fun b!1432200 () Bool)

(declare-fun res!966069 () Bool)

(assert (=> b!1432200 (=> (not res!966069) (not e!808498))))

(assert (=> b!1432200 (= res!966069 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630491 lt!630492 mask!2608) lt!630487))))

(declare-fun b!1432201 () Bool)

(declare-fun res!966063 () Bool)

(assert (=> b!1432201 (=> (not res!966063) (not e!808496))))

(assert (=> b!1432201 (= res!966063 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47613 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47613 a!2831))))))

(declare-fun b!1432202 () Bool)

(declare-fun res!966068 () Bool)

(assert (=> b!1432202 (=> (not res!966068) (not e!808496))))

(assert (=> b!1432202 (= res!966068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432203 () Bool)

(declare-fun res!966059 () Bool)

(assert (=> b!1432203 (=> (not res!966059) (not e!808498))))

(assert (=> b!1432203 (= res!966059 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432204 () Bool)

(declare-fun res!966058 () Bool)

(assert (=> b!1432204 (=> (not res!966058) (not e!808496))))

(assert (=> b!1432204 (= res!966058 (validKeyInArray!0 (select (arr!47063 a!2831) j!81)))))

(declare-fun b!1432205 () Bool)

(declare-fun res!966057 () Bool)

(assert (=> b!1432205 (=> (not res!966057) (not e!808496))))

(declare-datatypes ((List!33573 0))(
  ( (Nil!33570) (Cons!33569 (h!34892 (_ BitVec 64)) (t!48267 List!33573)) )
))
(declare-fun arrayNoDuplicates!0 (array!97512 (_ BitVec 32) List!33573) Bool)

(assert (=> b!1432205 (= res!966057 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33570))))

(declare-fun b!1432206 () Bool)

(declare-fun res!966065 () Bool)

(assert (=> b!1432206 (=> (not res!966065) (not e!808498))))

(assert (=> b!1432206 (= res!966065 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47063 a!2831) j!81) a!2831 mask!2608) lt!630489))))

(assert (= (and start!123540 res!966066) b!1432197))

(assert (= (and b!1432197 res!966060) b!1432193))

(assert (= (and b!1432193 res!966062) b!1432204))

(assert (= (and b!1432204 res!966058) b!1432202))

(assert (= (and b!1432202 res!966068) b!1432205))

(assert (= (and b!1432205 res!966057) b!1432201))

(assert (= (and b!1432201 res!966063) b!1432195))

(assert (= (and b!1432195 res!966061) b!1432198))

(assert (= (and b!1432198 res!966064) b!1432206))

(assert (= (and b!1432206 res!966065) b!1432200))

(assert (= (and b!1432200 res!966069) b!1432203))

(assert (= (and b!1432203 res!966059) b!1432199))

(assert (= (and b!1432199 res!966070) b!1432196))

(assert (= (and b!1432199 (not res!966067)) b!1432194))

(declare-fun m!1321989 () Bool)

(assert (=> b!1432193 m!1321989))

(assert (=> b!1432193 m!1321989))

(declare-fun m!1321991 () Bool)

(assert (=> b!1432193 m!1321991))

(declare-fun m!1321993 () Bool)

(assert (=> b!1432196 m!1321993))

(assert (=> b!1432196 m!1321993))

(declare-fun m!1321995 () Bool)

(assert (=> b!1432196 m!1321995))

(assert (=> b!1432195 m!1321993))

(assert (=> b!1432195 m!1321993))

(declare-fun m!1321997 () Bool)

(assert (=> b!1432195 m!1321997))

(assert (=> b!1432195 m!1321997))

(assert (=> b!1432195 m!1321993))

(declare-fun m!1321999 () Bool)

(assert (=> b!1432195 m!1321999))

(declare-fun m!1322001 () Bool)

(assert (=> b!1432194 m!1322001))

(declare-fun m!1322003 () Bool)

(assert (=> b!1432205 m!1322003))

(declare-fun m!1322005 () Bool)

(assert (=> b!1432198 m!1322005))

(assert (=> b!1432198 m!1322005))

(declare-fun m!1322007 () Bool)

(assert (=> b!1432198 m!1322007))

(declare-fun m!1322009 () Bool)

(assert (=> b!1432198 m!1322009))

(declare-fun m!1322011 () Bool)

(assert (=> b!1432198 m!1322011))

(assert (=> b!1432206 m!1321993))

(assert (=> b!1432206 m!1321993))

(declare-fun m!1322013 () Bool)

(assert (=> b!1432206 m!1322013))

(assert (=> b!1432204 m!1321993))

(assert (=> b!1432204 m!1321993))

(declare-fun m!1322015 () Bool)

(assert (=> b!1432204 m!1322015))

(declare-fun m!1322017 () Bool)

(assert (=> b!1432202 m!1322017))

(assert (=> b!1432199 m!1322009))

(declare-fun m!1322019 () Bool)

(assert (=> b!1432199 m!1322019))

(declare-fun m!1322021 () Bool)

(assert (=> b!1432199 m!1322021))

(declare-fun m!1322023 () Bool)

(assert (=> b!1432199 m!1322023))

(assert (=> b!1432199 m!1321993))

(declare-fun m!1322025 () Bool)

(assert (=> b!1432199 m!1322025))

(declare-fun m!1322027 () Bool)

(assert (=> start!123540 m!1322027))

(declare-fun m!1322029 () Bool)

(assert (=> start!123540 m!1322029))

(declare-fun m!1322031 () Bool)

(assert (=> b!1432200 m!1322031))

(push 1)

