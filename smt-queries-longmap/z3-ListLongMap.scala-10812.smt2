; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126522 () Bool)

(assert start!126522)

(declare-fun b!1484233 () Bool)

(declare-fun res!1009032 () Bool)

(declare-fun e!832180 () Bool)

(assert (=> b!1484233 (=> (not res!1009032) (not e!832180))))

(declare-datatypes ((array!99484 0))(
  ( (array!99485 (arr!48018 (Array (_ BitVec 32) (_ BitVec 64))) (size!48568 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99484)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99484 (_ BitVec 32)) Bool)

(assert (=> b!1484233 (= res!1009032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484234 () Bool)

(declare-fun res!1009043 () Bool)

(declare-fun e!832186 () Bool)

(assert (=> b!1484234 (=> (not res!1009043) (not e!832186))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12258 0))(
  ( (MissingZero!12258 (index!51424 (_ BitVec 32))) (Found!12258 (index!51425 (_ BitVec 32))) (Intermediate!12258 (undefined!13070 Bool) (index!51426 (_ BitVec 32)) (x!133006 (_ BitVec 32))) (Undefined!12258) (MissingVacant!12258 (index!51427 (_ BitVec 32))) )
))
(declare-fun lt!647694 () SeekEntryResult!12258)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99484 (_ BitVec 32)) SeekEntryResult!12258)

(assert (=> b!1484234 (= res!1009043 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48018 a!2862) j!93) a!2862 mask!2687) lt!647694))))

(declare-fun e!832187 () Bool)

(declare-fun lt!647693 () (_ BitVec 64))

(declare-fun lt!647692 () SeekEntryResult!12258)

(declare-fun b!1484235 () Bool)

(declare-fun lt!647697 () array!99484)

(assert (=> b!1484235 (= e!832187 (= lt!647692 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647693 lt!647697 mask!2687)))))

(declare-fun b!1484236 () Bool)

(declare-fun res!1009036 () Bool)

(assert (=> b!1484236 (=> (not res!1009036) (not e!832180))))

(declare-datatypes ((List!34519 0))(
  ( (Nil!34516) (Cons!34515 (h!35889 (_ BitVec 64)) (t!49213 List!34519)) )
))
(declare-fun arrayNoDuplicates!0 (array!99484 (_ BitVec 32) List!34519) Bool)

(assert (=> b!1484236 (= res!1009036 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34516))))

(declare-fun b!1484237 () Bool)

(declare-fun res!1009035 () Bool)

(assert (=> b!1484237 (=> (not res!1009035) (not e!832180))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484237 (= res!1009035 (validKeyInArray!0 (select (arr!48018 a!2862) i!1006)))))

(declare-fun b!1484238 () Bool)

(declare-fun e!832179 () Bool)

(assert (=> b!1484238 (= e!832180 e!832179)))

(declare-fun res!1009034 () Bool)

(assert (=> b!1484238 (=> (not res!1009034) (not e!832179))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1484238 (= res!1009034 (= (select (store (arr!48018 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484238 (= lt!647697 (array!99485 (store (arr!48018 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48568 a!2862)))))

(declare-fun b!1484239 () Bool)

(declare-fun e!832184 () Bool)

(declare-fun e!832183 () Bool)

(assert (=> b!1484239 (= e!832184 (not e!832183))))

(declare-fun res!1009046 () Bool)

(assert (=> b!1484239 (=> res!1009046 e!832183)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1484239 (= res!1009046 (or (and (= (select (arr!48018 a!2862) index!646) (select (store (arr!48018 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48018 a!2862) index!646) (select (arr!48018 a!2862) j!93))) (= (select (arr!48018 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!832182 () Bool)

(assert (=> b!1484239 e!832182))

(declare-fun res!1009040 () Bool)

(assert (=> b!1484239 (=> (not res!1009040) (not e!832182))))

(assert (=> b!1484239 (= res!1009040 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49856 0))(
  ( (Unit!49857) )
))
(declare-fun lt!647696 () Unit!49856)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99484 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49856)

(assert (=> b!1484239 (= lt!647696 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484240 () Bool)

(declare-fun res!1009038 () Bool)

(assert (=> b!1484240 (=> (not res!1009038) (not e!832182))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99484 (_ BitVec 32)) SeekEntryResult!12258)

(assert (=> b!1484240 (= res!1009038 (= (seekEntryOrOpen!0 (select (arr!48018 a!2862) j!93) a!2862 mask!2687) (Found!12258 j!93)))))

(declare-fun b!1484241 () Bool)

(declare-fun res!1009042 () Bool)

(assert (=> b!1484241 (=> (not res!1009042) (not e!832184))))

(assert (=> b!1484241 (= res!1009042 e!832187)))

(declare-fun c!137124 () Bool)

(assert (=> b!1484241 (= c!137124 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484242 () Bool)

(declare-fun res!1009047 () Bool)

(assert (=> b!1484242 (=> (not res!1009047) (not e!832184))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1484242 (= res!1009047 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun e!832181 () Bool)

(declare-fun b!1484243 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99484 (_ BitVec 32)) SeekEntryResult!12258)

(assert (=> b!1484243 (= e!832181 (= (seekEntryOrOpen!0 lt!647693 lt!647697 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647693 lt!647697 mask!2687)))))

(declare-fun b!1484245 () Bool)

(assert (=> b!1484245 (= e!832179 e!832186)))

(declare-fun res!1009048 () Bool)

(assert (=> b!1484245 (=> (not res!1009048) (not e!832186))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484245 (= res!1009048 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48018 a!2862) j!93) mask!2687) (select (arr!48018 a!2862) j!93) a!2862 mask!2687) lt!647694))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1484245 (= lt!647694 (Intermediate!12258 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484246 () Bool)

(assert (=> b!1484246 (= e!832187 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647693 lt!647697 mask!2687) (seekEntryOrOpen!0 lt!647693 lt!647697 mask!2687)))))

(declare-fun b!1484247 () Bool)

(declare-fun res!1009031 () Bool)

(assert (=> b!1484247 (=> (not res!1009031) (not e!832180))))

(assert (=> b!1484247 (= res!1009031 (validKeyInArray!0 (select (arr!48018 a!2862) j!93)))))

(declare-fun b!1484248 () Bool)

(declare-fun e!832178 () Bool)

(assert (=> b!1484248 (= e!832182 e!832178)))

(declare-fun res!1009037 () Bool)

(assert (=> b!1484248 (=> res!1009037 e!832178)))

(declare-fun lt!647695 () (_ BitVec 64))

(assert (=> b!1484248 (= res!1009037 (or (and (= (select (arr!48018 a!2862) index!646) lt!647695) (= (select (arr!48018 a!2862) index!646) (select (arr!48018 a!2862) j!93))) (= (select (arr!48018 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484248 (= lt!647695 (select (store (arr!48018 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484249 () Bool)

(assert (=> b!1484249 (= e!832186 e!832184)))

(declare-fun res!1009030 () Bool)

(assert (=> b!1484249 (=> (not res!1009030) (not e!832184))))

(assert (=> b!1484249 (= res!1009030 (= lt!647692 (Intermediate!12258 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1484249 (= lt!647692 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647693 mask!2687) lt!647693 lt!647697 mask!2687))))

(assert (=> b!1484249 (= lt!647693 (select (store (arr!48018 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484250 () Bool)

(declare-fun res!1009044 () Bool)

(assert (=> b!1484250 (=> (not res!1009044) (not e!832180))))

(assert (=> b!1484250 (= res!1009044 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48568 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48568 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48568 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484251 () Bool)

(assert (=> b!1484251 (= e!832178 e!832181)))

(declare-fun res!1009039 () Bool)

(assert (=> b!1484251 (=> (not res!1009039) (not e!832181))))

(assert (=> b!1484251 (= res!1009039 (and (= index!646 intermediateAfterIndex!19) (= lt!647695 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484252 () Bool)

(assert (=> b!1484252 (= e!832183 true)))

(declare-fun lt!647691 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484252 (= lt!647691 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1484253 () Bool)

(declare-fun res!1009045 () Bool)

(assert (=> b!1484253 (=> (not res!1009045) (not e!832180))))

(assert (=> b!1484253 (= res!1009045 (and (= (size!48568 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48568 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48568 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1009033 () Bool)

(assert (=> start!126522 (=> (not res!1009033) (not e!832180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126522 (= res!1009033 (validMask!0 mask!2687))))

(assert (=> start!126522 e!832180))

(assert (=> start!126522 true))

(declare-fun array_inv!37046 (array!99484) Bool)

(assert (=> start!126522 (array_inv!37046 a!2862)))

(declare-fun b!1484244 () Bool)

(declare-fun res!1009041 () Bool)

(assert (=> b!1484244 (=> (not res!1009041) (not e!832182))))

(assert (=> b!1484244 (= res!1009041 (or (= (select (arr!48018 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48018 a!2862) intermediateBeforeIndex!19) (select (arr!48018 a!2862) j!93))))))

(assert (= (and start!126522 res!1009033) b!1484253))

(assert (= (and b!1484253 res!1009045) b!1484237))

(assert (= (and b!1484237 res!1009035) b!1484247))

(assert (= (and b!1484247 res!1009031) b!1484233))

(assert (= (and b!1484233 res!1009032) b!1484236))

(assert (= (and b!1484236 res!1009036) b!1484250))

(assert (= (and b!1484250 res!1009044) b!1484238))

(assert (= (and b!1484238 res!1009034) b!1484245))

(assert (= (and b!1484245 res!1009048) b!1484234))

(assert (= (and b!1484234 res!1009043) b!1484249))

(assert (= (and b!1484249 res!1009030) b!1484241))

(assert (= (and b!1484241 c!137124) b!1484235))

(assert (= (and b!1484241 (not c!137124)) b!1484246))

(assert (= (and b!1484241 res!1009042) b!1484242))

(assert (= (and b!1484242 res!1009047) b!1484239))

(assert (= (and b!1484239 res!1009040) b!1484240))

(assert (= (and b!1484240 res!1009038) b!1484244))

(assert (= (and b!1484244 res!1009041) b!1484248))

(assert (= (and b!1484248 (not res!1009037)) b!1484251))

(assert (= (and b!1484251 res!1009039) b!1484243))

(assert (= (and b!1484239 (not res!1009046)) b!1484252))

(declare-fun m!1369577 () Bool)

(assert (=> b!1484236 m!1369577))

(declare-fun m!1369579 () Bool)

(assert (=> b!1484235 m!1369579))

(declare-fun m!1369581 () Bool)

(assert (=> b!1484234 m!1369581))

(assert (=> b!1484234 m!1369581))

(declare-fun m!1369583 () Bool)

(assert (=> b!1484234 m!1369583))

(assert (=> b!1484247 m!1369581))

(assert (=> b!1484247 m!1369581))

(declare-fun m!1369585 () Bool)

(assert (=> b!1484247 m!1369585))

(declare-fun m!1369587 () Bool)

(assert (=> start!126522 m!1369587))

(declare-fun m!1369589 () Bool)

(assert (=> start!126522 m!1369589))

(assert (=> b!1484245 m!1369581))

(assert (=> b!1484245 m!1369581))

(declare-fun m!1369591 () Bool)

(assert (=> b!1484245 m!1369591))

(assert (=> b!1484245 m!1369591))

(assert (=> b!1484245 m!1369581))

(declare-fun m!1369593 () Bool)

(assert (=> b!1484245 m!1369593))

(declare-fun m!1369595 () Bool)

(assert (=> b!1484252 m!1369595))

(declare-fun m!1369597 () Bool)

(assert (=> b!1484244 m!1369597))

(assert (=> b!1484244 m!1369581))

(declare-fun m!1369599 () Bool)

(assert (=> b!1484249 m!1369599))

(assert (=> b!1484249 m!1369599))

(declare-fun m!1369601 () Bool)

(assert (=> b!1484249 m!1369601))

(declare-fun m!1369603 () Bool)

(assert (=> b!1484249 m!1369603))

(declare-fun m!1369605 () Bool)

(assert (=> b!1484249 m!1369605))

(declare-fun m!1369607 () Bool)

(assert (=> b!1484233 m!1369607))

(assert (=> b!1484238 m!1369603))

(declare-fun m!1369609 () Bool)

(assert (=> b!1484238 m!1369609))

(declare-fun m!1369611 () Bool)

(assert (=> b!1484246 m!1369611))

(declare-fun m!1369613 () Bool)

(assert (=> b!1484246 m!1369613))

(assert (=> b!1484243 m!1369613))

(assert (=> b!1484243 m!1369611))

(declare-fun m!1369615 () Bool)

(assert (=> b!1484237 m!1369615))

(assert (=> b!1484237 m!1369615))

(declare-fun m!1369617 () Bool)

(assert (=> b!1484237 m!1369617))

(assert (=> b!1484240 m!1369581))

(assert (=> b!1484240 m!1369581))

(declare-fun m!1369619 () Bool)

(assert (=> b!1484240 m!1369619))

(declare-fun m!1369621 () Bool)

(assert (=> b!1484248 m!1369621))

(assert (=> b!1484248 m!1369581))

(assert (=> b!1484248 m!1369603))

(declare-fun m!1369623 () Bool)

(assert (=> b!1484248 m!1369623))

(declare-fun m!1369625 () Bool)

(assert (=> b!1484239 m!1369625))

(assert (=> b!1484239 m!1369603))

(assert (=> b!1484239 m!1369623))

(assert (=> b!1484239 m!1369621))

(declare-fun m!1369627 () Bool)

(assert (=> b!1484239 m!1369627))

(assert (=> b!1484239 m!1369581))

(check-sat (not b!1484243) (not b!1484239) (not b!1484245) (not b!1484237) (not b!1484235) (not b!1484240) (not b!1484247) (not b!1484234) (not b!1484236) (not b!1484252) (not b!1484249) (not b!1484246) (not b!1484233) (not start!126522))
(check-sat)
