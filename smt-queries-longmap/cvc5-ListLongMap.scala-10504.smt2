; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123720 () Bool)

(assert start!123720)

(declare-fun b!1434071 () Bool)

(declare-fun res!967542 () Bool)

(declare-fun e!809416 () Bool)

(assert (=> b!1434071 (=> (not res!967542) (not e!809416))))

(declare-datatypes ((SeekEntryResult!11372 0))(
  ( (MissingZero!11372 (index!47880 (_ BitVec 32))) (Found!11372 (index!47881 (_ BitVec 32))) (Intermediate!11372 (undefined!12184 Bool) (index!47882 (_ BitVec 32)) (x!129536 (_ BitVec 32))) (Undefined!11372) (MissingVacant!11372 (index!47883 (_ BitVec 32))) )
))
(declare-fun lt!631309 () SeekEntryResult!11372)

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97578 0))(
  ( (array!97579 (arr!47093 (Array (_ BitVec 32) (_ BitVec 64))) (size!47643 (_ BitVec 32))) )
))
(declare-fun lt!631313 () array!97578)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!631310 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97578 (_ BitVec 32)) SeekEntryResult!11372)

(assert (=> b!1434071 (= res!967542 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631310 lt!631313 mask!2608) lt!631309))))

(declare-fun b!1434072 () Bool)

(declare-fun res!967536 () Bool)

(declare-fun e!809415 () Bool)

(assert (=> b!1434072 (=> (not res!967536) (not e!809415))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97578)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1434072 (= res!967536 (and (= (size!47643 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47643 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47643 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1434073 () Bool)

(declare-fun res!967545 () Bool)

(assert (=> b!1434073 (=> (not res!967545) (not e!809415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434073 (= res!967545 (validKeyInArray!0 (select (arr!47093 a!2831) j!81)))))

(declare-fun b!1434074 () Bool)

(declare-fun e!809417 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97578 (_ BitVec 32)) SeekEntryResult!11372)

(assert (=> b!1434074 (= e!809417 (= (seekEntryOrOpen!0 (select (arr!47093 a!2831) j!81) a!2831 mask!2608) (Found!11372 j!81)))))

(declare-fun res!967538 () Bool)

(assert (=> start!123720 (=> (not res!967538) (not e!809415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123720 (= res!967538 (validMask!0 mask!2608))))

(assert (=> start!123720 e!809415))

(assert (=> start!123720 true))

(declare-fun array_inv!36121 (array!97578) Bool)

(assert (=> start!123720 (array_inv!36121 a!2831)))

(declare-fun b!1434075 () Bool)

(declare-fun e!809413 () Bool)

(assert (=> b!1434075 (= e!809413 true)))

(declare-fun lt!631312 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434075 (= lt!631312 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1434076 () Bool)

(declare-fun res!967537 () Bool)

(assert (=> b!1434076 (=> (not res!967537) (not e!809415))))

(assert (=> b!1434076 (= res!967537 (validKeyInArray!0 (select (arr!47093 a!2831) i!982)))))

(declare-fun b!1434077 () Bool)

(declare-fun e!809414 () Bool)

(assert (=> b!1434077 (= e!809415 e!809414)))

(declare-fun res!967541 () Bool)

(assert (=> b!1434077 (=> (not res!967541) (not e!809414))))

(declare-fun lt!631311 () SeekEntryResult!11372)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434077 (= res!967541 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47093 a!2831) j!81) mask!2608) (select (arr!47093 a!2831) j!81) a!2831 mask!2608) lt!631311))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1434077 (= lt!631311 (Intermediate!11372 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1434078 () Bool)

(declare-fun res!967546 () Bool)

(assert (=> b!1434078 (=> (not res!967546) (not e!809416))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1434078 (= res!967546 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434079 () Bool)

(declare-fun res!967543 () Bool)

(assert (=> b!1434079 (=> (not res!967543) (not e!809415))))

(assert (=> b!1434079 (= res!967543 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47643 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47643 a!2831))))))

(declare-fun b!1434080 () Bool)

(declare-fun res!967539 () Bool)

(assert (=> b!1434080 (=> (not res!967539) (not e!809416))))

(assert (=> b!1434080 (= res!967539 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47093 a!2831) j!81) a!2831 mask!2608) lt!631311))))

(declare-fun b!1434081 () Bool)

(declare-fun res!967540 () Bool)

(assert (=> b!1434081 (=> (not res!967540) (not e!809415))))

(declare-datatypes ((List!33603 0))(
  ( (Nil!33600) (Cons!33599 (h!34928 (_ BitVec 64)) (t!48297 List!33603)) )
))
(declare-fun arrayNoDuplicates!0 (array!97578 (_ BitVec 32) List!33603) Bool)

(assert (=> b!1434081 (= res!967540 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33600))))

(declare-fun b!1434082 () Bool)

(assert (=> b!1434082 (= e!809414 e!809416)))

(declare-fun res!967535 () Bool)

(assert (=> b!1434082 (=> (not res!967535) (not e!809416))))

(assert (=> b!1434082 (= res!967535 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631310 mask!2608) lt!631310 lt!631313 mask!2608) lt!631309))))

(assert (=> b!1434082 (= lt!631309 (Intermediate!11372 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1434082 (= lt!631310 (select (store (arr!47093 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434082 (= lt!631313 (array!97579 (store (arr!47093 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47643 a!2831)))))

(declare-fun b!1434083 () Bool)

(declare-fun res!967534 () Bool)

(assert (=> b!1434083 (=> (not res!967534) (not e!809415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97578 (_ BitVec 32)) Bool)

(assert (=> b!1434083 (= res!967534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1434084 () Bool)

(assert (=> b!1434084 (= e!809416 (not e!809413))))

(declare-fun res!967544 () Bool)

(assert (=> b!1434084 (=> res!967544 e!809413)))

(assert (=> b!1434084 (= res!967544 (or (= (select (arr!47093 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47093 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47093 a!2831) index!585) (select (arr!47093 a!2831) j!81)) (= (select (store (arr!47093 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1434084 e!809417))

(declare-fun res!967533 () Bool)

(assert (=> b!1434084 (=> (not res!967533) (not e!809417))))

(assert (=> b!1434084 (= res!967533 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48490 0))(
  ( (Unit!48491) )
))
(declare-fun lt!631314 () Unit!48490)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48490)

(assert (=> b!1434084 (= lt!631314 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!123720 res!967538) b!1434072))

(assert (= (and b!1434072 res!967536) b!1434076))

(assert (= (and b!1434076 res!967537) b!1434073))

(assert (= (and b!1434073 res!967545) b!1434083))

(assert (= (and b!1434083 res!967534) b!1434081))

(assert (= (and b!1434081 res!967540) b!1434079))

(assert (= (and b!1434079 res!967543) b!1434077))

(assert (= (and b!1434077 res!967541) b!1434082))

(assert (= (and b!1434082 res!967535) b!1434080))

(assert (= (and b!1434080 res!967539) b!1434071))

(assert (= (and b!1434071 res!967542) b!1434078))

(assert (= (and b!1434078 res!967546) b!1434084))

(assert (= (and b!1434084 res!967533) b!1434074))

(assert (= (and b!1434084 (not res!967544)) b!1434075))

(declare-fun m!1323681 () Bool)

(assert (=> start!123720 m!1323681))

(declare-fun m!1323683 () Bool)

(assert (=> start!123720 m!1323683))

(declare-fun m!1323685 () Bool)

(assert (=> b!1434082 m!1323685))

(assert (=> b!1434082 m!1323685))

(declare-fun m!1323687 () Bool)

(assert (=> b!1434082 m!1323687))

(declare-fun m!1323689 () Bool)

(assert (=> b!1434082 m!1323689))

(declare-fun m!1323691 () Bool)

(assert (=> b!1434082 m!1323691))

(declare-fun m!1323693 () Bool)

(assert (=> b!1434076 m!1323693))

(assert (=> b!1434076 m!1323693))

(declare-fun m!1323695 () Bool)

(assert (=> b!1434076 m!1323695))

(declare-fun m!1323697 () Bool)

(assert (=> b!1434071 m!1323697))

(assert (=> b!1434084 m!1323689))

(declare-fun m!1323699 () Bool)

(assert (=> b!1434084 m!1323699))

(declare-fun m!1323701 () Bool)

(assert (=> b!1434084 m!1323701))

(declare-fun m!1323703 () Bool)

(assert (=> b!1434084 m!1323703))

(declare-fun m!1323705 () Bool)

(assert (=> b!1434084 m!1323705))

(declare-fun m!1323707 () Bool)

(assert (=> b!1434084 m!1323707))

(assert (=> b!1434073 m!1323705))

(assert (=> b!1434073 m!1323705))

(declare-fun m!1323709 () Bool)

(assert (=> b!1434073 m!1323709))

(assert (=> b!1434074 m!1323705))

(assert (=> b!1434074 m!1323705))

(declare-fun m!1323711 () Bool)

(assert (=> b!1434074 m!1323711))

(declare-fun m!1323713 () Bool)

(assert (=> b!1434083 m!1323713))

(declare-fun m!1323715 () Bool)

(assert (=> b!1434075 m!1323715))

(assert (=> b!1434077 m!1323705))

(assert (=> b!1434077 m!1323705))

(declare-fun m!1323717 () Bool)

(assert (=> b!1434077 m!1323717))

(assert (=> b!1434077 m!1323717))

(assert (=> b!1434077 m!1323705))

(declare-fun m!1323719 () Bool)

(assert (=> b!1434077 m!1323719))

(declare-fun m!1323721 () Bool)

(assert (=> b!1434081 m!1323721))

(assert (=> b!1434080 m!1323705))

(assert (=> b!1434080 m!1323705))

(declare-fun m!1323723 () Bool)

(assert (=> b!1434080 m!1323723))

(push 1)

