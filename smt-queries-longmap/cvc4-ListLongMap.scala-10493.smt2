; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123538 () Bool)

(assert start!123538)

(declare-fun b!1432152 () Bool)

(declare-fun res!966028 () Bool)

(declare-fun e!808479 () Bool)

(assert (=> b!1432152 (=> (not res!966028) (not e!808479))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97510 0))(
  ( (array!97511 (arr!47062 (Array (_ BitVec 32) (_ BitVec 64))) (size!47612 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97510)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432152 (= res!966028 (and (= (size!47612 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47612 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47612 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432153 () Bool)

(declare-fun res!966021 () Bool)

(assert (=> b!1432153 (=> (not res!966021) (not e!808479))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1432153 (= res!966021 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47612 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47612 a!2831))))))

(declare-fun b!1432154 () Bool)

(declare-fun res!966027 () Bool)

(declare-fun e!808478 () Bool)

(assert (=> b!1432154 (=> (not res!966027) (not e!808478))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432154 (= res!966027 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432155 () Bool)

(declare-fun e!808481 () Bool)

(assert (=> b!1432155 (= e!808481 e!808478)))

(declare-fun res!966018 () Bool)

(assert (=> b!1432155 (=> (not res!966018) (not e!808478))))

(declare-fun lt!630470 () (_ BitVec 64))

(declare-fun lt!630472 () array!97510)

(declare-datatypes ((SeekEntryResult!11341 0))(
  ( (MissingZero!11341 (index!47756 (_ BitVec 32))) (Found!11341 (index!47757 (_ BitVec 32))) (Intermediate!11341 (undefined!12153 Bool) (index!47758 (_ BitVec 32)) (x!129399 (_ BitVec 32))) (Undefined!11341) (MissingVacant!11341 (index!47759 (_ BitVec 32))) )
))
(declare-fun lt!630474 () SeekEntryResult!11341)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97510 (_ BitVec 32)) SeekEntryResult!11341)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432155 (= res!966018 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630470 mask!2608) lt!630470 lt!630472 mask!2608) lt!630474))))

(assert (=> b!1432155 (= lt!630474 (Intermediate!11341 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432155 (= lt!630470 (select (store (arr!47062 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432155 (= lt!630472 (array!97511 (store (arr!47062 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47612 a!2831)))))

(declare-fun b!1432156 () Bool)

(declare-fun res!966024 () Bool)

(assert (=> b!1432156 (=> (not res!966024) (not e!808478))))

(assert (=> b!1432156 (= res!966024 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630470 lt!630472 mask!2608) lt!630474))))

(declare-fun b!1432157 () Bool)

(declare-fun res!966023 () Bool)

(assert (=> b!1432157 (=> (not res!966023) (not e!808479))))

(declare-datatypes ((List!33572 0))(
  ( (Nil!33569) (Cons!33568 (h!34891 (_ BitVec 64)) (t!48266 List!33572)) )
))
(declare-fun arrayNoDuplicates!0 (array!97510 (_ BitVec 32) List!33572) Bool)

(assert (=> b!1432157 (= res!966023 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33569))))

(declare-fun b!1432158 () Bool)

(declare-fun res!966020 () Bool)

(assert (=> b!1432158 (=> (not res!966020) (not e!808479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97510 (_ BitVec 32)) Bool)

(assert (=> b!1432158 (= res!966020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!966026 () Bool)

(assert (=> start!123538 (=> (not res!966026) (not e!808479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123538 (= res!966026 (validMask!0 mask!2608))))

(assert (=> start!123538 e!808479))

(assert (=> start!123538 true))

(declare-fun array_inv!36090 (array!97510) Bool)

(assert (=> start!123538 (array_inv!36090 a!2831)))

(declare-fun b!1432151 () Bool)

(declare-fun e!808477 () Bool)

(assert (=> b!1432151 (= e!808478 (not e!808477))))

(declare-fun res!966025 () Bool)

(assert (=> b!1432151 (=> res!966025 e!808477)))

(assert (=> b!1432151 (= res!966025 (or (= (select (arr!47062 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47062 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47062 a!2831) index!585) (select (arr!47062 a!2831) j!81)) (= (select (store (arr!47062 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808480 () Bool)

(assert (=> b!1432151 e!808480))

(declare-fun res!966017 () Bool)

(assert (=> b!1432151 (=> (not res!966017) (not e!808480))))

(assert (=> b!1432151 (= res!966017 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48428 0))(
  ( (Unit!48429) )
))
(declare-fun lt!630471 () Unit!48428)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48428)

(assert (=> b!1432151 (= lt!630471 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432159 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97510 (_ BitVec 32)) SeekEntryResult!11341)

(assert (=> b!1432159 (= e!808480 (= (seekEntryOrOpen!0 (select (arr!47062 a!2831) j!81) a!2831 mask!2608) (Found!11341 j!81)))))

(declare-fun b!1432160 () Bool)

(declare-fun res!966022 () Bool)

(assert (=> b!1432160 (=> (not res!966022) (not e!808479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432160 (= res!966022 (validKeyInArray!0 (select (arr!47062 a!2831) j!81)))))

(declare-fun b!1432161 () Bool)

(declare-fun res!966015 () Bool)

(assert (=> b!1432161 (=> (not res!966015) (not e!808479))))

(assert (=> b!1432161 (= res!966015 (validKeyInArray!0 (select (arr!47062 a!2831) i!982)))))

(declare-fun b!1432162 () Bool)

(declare-fun res!966019 () Bool)

(assert (=> b!1432162 (=> (not res!966019) (not e!808478))))

(declare-fun lt!630473 () SeekEntryResult!11341)

(assert (=> b!1432162 (= res!966019 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47062 a!2831) j!81) a!2831 mask!2608) lt!630473))))

(declare-fun b!1432163 () Bool)

(assert (=> b!1432163 (= e!808477 true)))

(declare-fun lt!630469 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432163 (= lt!630469 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432164 () Bool)

(assert (=> b!1432164 (= e!808479 e!808481)))

(declare-fun res!966016 () Bool)

(assert (=> b!1432164 (=> (not res!966016) (not e!808481))))

(assert (=> b!1432164 (= res!966016 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47062 a!2831) j!81) mask!2608) (select (arr!47062 a!2831) j!81) a!2831 mask!2608) lt!630473))))

(assert (=> b!1432164 (= lt!630473 (Intermediate!11341 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!123538 res!966026) b!1432152))

(assert (= (and b!1432152 res!966028) b!1432161))

(assert (= (and b!1432161 res!966015) b!1432160))

(assert (= (and b!1432160 res!966022) b!1432158))

(assert (= (and b!1432158 res!966020) b!1432157))

(assert (= (and b!1432157 res!966023) b!1432153))

(assert (= (and b!1432153 res!966021) b!1432164))

(assert (= (and b!1432164 res!966016) b!1432155))

(assert (= (and b!1432155 res!966018) b!1432162))

(assert (= (and b!1432162 res!966019) b!1432156))

(assert (= (and b!1432156 res!966024) b!1432154))

(assert (= (and b!1432154 res!966027) b!1432151))

(assert (= (and b!1432151 res!966017) b!1432159))

(assert (= (and b!1432151 (not res!966025)) b!1432163))

(declare-fun m!1321945 () Bool)

(assert (=> start!123538 m!1321945))

(declare-fun m!1321947 () Bool)

(assert (=> start!123538 m!1321947))

(declare-fun m!1321949 () Bool)

(assert (=> b!1432155 m!1321949))

(assert (=> b!1432155 m!1321949))

(declare-fun m!1321951 () Bool)

(assert (=> b!1432155 m!1321951))

(declare-fun m!1321953 () Bool)

(assert (=> b!1432155 m!1321953))

(declare-fun m!1321955 () Bool)

(assert (=> b!1432155 m!1321955))

(declare-fun m!1321957 () Bool)

(assert (=> b!1432156 m!1321957))

(declare-fun m!1321959 () Bool)

(assert (=> b!1432163 m!1321959))

(declare-fun m!1321961 () Bool)

(assert (=> b!1432164 m!1321961))

(assert (=> b!1432164 m!1321961))

(declare-fun m!1321963 () Bool)

(assert (=> b!1432164 m!1321963))

(assert (=> b!1432164 m!1321963))

(assert (=> b!1432164 m!1321961))

(declare-fun m!1321965 () Bool)

(assert (=> b!1432164 m!1321965))

(declare-fun m!1321967 () Bool)

(assert (=> b!1432158 m!1321967))

(declare-fun m!1321969 () Bool)

(assert (=> b!1432157 m!1321969))

(declare-fun m!1321971 () Bool)

(assert (=> b!1432161 m!1321971))

(assert (=> b!1432161 m!1321971))

(declare-fun m!1321973 () Bool)

(assert (=> b!1432161 m!1321973))

(assert (=> b!1432151 m!1321953))

(declare-fun m!1321975 () Bool)

(assert (=> b!1432151 m!1321975))

(declare-fun m!1321977 () Bool)

(assert (=> b!1432151 m!1321977))

(declare-fun m!1321979 () Bool)

(assert (=> b!1432151 m!1321979))

(assert (=> b!1432151 m!1321961))

(declare-fun m!1321981 () Bool)

(assert (=> b!1432151 m!1321981))

(assert (=> b!1432159 m!1321961))

(assert (=> b!1432159 m!1321961))

(declare-fun m!1321983 () Bool)

(assert (=> b!1432159 m!1321983))

(assert (=> b!1432160 m!1321961))

(assert (=> b!1432160 m!1321961))

(declare-fun m!1321985 () Bool)

(assert (=> b!1432160 m!1321985))

(assert (=> b!1432162 m!1321961))

(assert (=> b!1432162 m!1321961))

(declare-fun m!1321987 () Bool)

(assert (=> b!1432162 m!1321987))

(push 1)

(assert (not b!1432161))

(assert (not b!1432164))

(assert (not b!1432157))

(assert (not b!1432156))

(assert (not b!1432163))

(assert (not b!1432162))

(assert (not b!1432151))

(assert (not b!1432155))

(assert (not b!1432158))

(assert (not b!1432159))

(assert (not b!1432160))

(assert (not start!123538))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

