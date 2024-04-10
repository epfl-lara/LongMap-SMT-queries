; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126546 () Bool)

(assert start!126546)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1484989 () Bool)

(declare-fun lt!647945 () (_ BitVec 64))

(declare-datatypes ((array!99508 0))(
  ( (array!99509 (arr!48030 (Array (_ BitVec 32) (_ BitVec 64))) (size!48580 (_ BitVec 32))) )
))
(declare-fun lt!647944 () array!99508)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!832538 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12270 0))(
  ( (MissingZero!12270 (index!51472 (_ BitVec 32))) (Found!12270 (index!51473 (_ BitVec 32))) (Intermediate!12270 (undefined!13082 Bool) (index!51474 (_ BitVec 32)) (x!133050 (_ BitVec 32))) (Undefined!12270) (MissingVacant!12270 (index!51475 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99508 (_ BitVec 32)) SeekEntryResult!12270)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99508 (_ BitVec 32)) SeekEntryResult!12270)

(assert (=> b!1484989 (= e!832538 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647945 lt!647944 mask!2687) (seekEntryOrOpen!0 lt!647945 lt!647944 mask!2687)))))

(declare-fun b!1484990 () Bool)

(declare-fun res!1009727 () Bool)

(declare-fun e!832546 () Bool)

(assert (=> b!1484990 (=> (not res!1009727) (not e!832546))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun a!2862 () array!99508)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1484990 (= res!1009727 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48580 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48580 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48580 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484991 () Bool)

(declare-fun res!1009721 () Bool)

(declare-fun e!832544 () Bool)

(assert (=> b!1484991 (=> (not res!1009721) (not e!832544))))

(declare-fun lt!647948 () SeekEntryResult!12270)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99508 (_ BitVec 32)) SeekEntryResult!12270)

(assert (=> b!1484991 (= res!1009721 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48030 a!2862) j!93) a!2862 mask!2687) lt!647948))))

(declare-fun e!832539 () Bool)

(declare-fun b!1484992 () Bool)

(assert (=> b!1484992 (= e!832539 (= (seekEntryOrOpen!0 lt!647945 lt!647944 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647945 lt!647944 mask!2687)))))

(declare-fun b!1484993 () Bool)

(declare-fun e!832543 () Bool)

(assert (=> b!1484993 (= e!832543 e!832539)))

(declare-fun res!1009728 () Bool)

(assert (=> b!1484993 (=> (not res!1009728) (not e!832539))))

(declare-fun lt!647946 () (_ BitVec 64))

(assert (=> b!1484993 (= res!1009728 (and (= index!646 intermediateAfterIndex!19) (= lt!647946 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!647943 () SeekEntryResult!12270)

(declare-fun b!1484994 () Bool)

(assert (=> b!1484994 (= e!832538 (= lt!647943 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647945 lt!647944 mask!2687)))))

(declare-fun b!1484995 () Bool)

(declare-fun e!832542 () Bool)

(assert (=> b!1484995 (= e!832542 e!832544)))

(declare-fun res!1009730 () Bool)

(assert (=> b!1484995 (=> (not res!1009730) (not e!832544))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484995 (= res!1009730 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48030 a!2862) j!93) mask!2687) (select (arr!48030 a!2862) j!93) a!2862 mask!2687) lt!647948))))

(assert (=> b!1484995 (= lt!647948 (Intermediate!12270 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484996 () Bool)

(declare-fun e!832545 () Bool)

(assert (=> b!1484996 (= e!832544 e!832545)))

(declare-fun res!1009729 () Bool)

(assert (=> b!1484996 (=> (not res!1009729) (not e!832545))))

(assert (=> b!1484996 (= res!1009729 (= lt!647943 (Intermediate!12270 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1484996 (= lt!647943 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647945 mask!2687) lt!647945 lt!647944 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1484996 (= lt!647945 (select (store (arr!48030 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484997 () Bool)

(declare-fun res!1009724 () Bool)

(assert (=> b!1484997 (=> (not res!1009724) (not e!832545))))

(assert (=> b!1484997 (= res!1009724 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484998 () Bool)

(declare-fun res!1009717 () Bool)

(assert (=> b!1484998 (=> (not res!1009717) (not e!832546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99508 (_ BitVec 32)) Bool)

(assert (=> b!1484998 (= res!1009717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484999 () Bool)

(declare-fun res!1009731 () Bool)

(declare-fun e!832541 () Bool)

(assert (=> b!1484999 (=> (not res!1009731) (not e!832541))))

(assert (=> b!1484999 (= res!1009731 (or (= (select (arr!48030 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48030 a!2862) intermediateBeforeIndex!19) (select (arr!48030 a!2862) j!93))))))

(declare-fun res!1009722 () Bool)

(assert (=> start!126546 (=> (not res!1009722) (not e!832546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126546 (= res!1009722 (validMask!0 mask!2687))))

(assert (=> start!126546 e!832546))

(assert (=> start!126546 true))

(declare-fun array_inv!37058 (array!99508) Bool)

(assert (=> start!126546 (array_inv!37058 a!2862)))

(declare-fun b!1485000 () Bool)

(declare-fun e!832540 () Bool)

(assert (=> b!1485000 (= e!832545 (not e!832540))))

(declare-fun res!1009715 () Bool)

(assert (=> b!1485000 (=> res!1009715 e!832540)))

(assert (=> b!1485000 (= res!1009715 (or (and (= (select (arr!48030 a!2862) index!646) (select (store (arr!48030 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48030 a!2862) index!646) (select (arr!48030 a!2862) j!93))) (= (select (arr!48030 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485000 e!832541))

(declare-fun res!1009716 () Bool)

(assert (=> b!1485000 (=> (not res!1009716) (not e!832541))))

(assert (=> b!1485000 (= res!1009716 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49880 0))(
  ( (Unit!49881) )
))
(declare-fun lt!647947 () Unit!49880)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99508 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49880)

(assert (=> b!1485000 (= lt!647947 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1485001 () Bool)

(assert (=> b!1485001 (= e!832541 e!832543)))

(declare-fun res!1009719 () Bool)

(assert (=> b!1485001 (=> res!1009719 e!832543)))

(assert (=> b!1485001 (= res!1009719 (or (and (= (select (arr!48030 a!2862) index!646) lt!647946) (= (select (arr!48030 a!2862) index!646) (select (arr!48030 a!2862) j!93))) (= (select (arr!48030 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485001 (= lt!647946 (select (store (arr!48030 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485002 () Bool)

(assert (=> b!1485002 (= e!832540 true)))

(declare-fun lt!647949 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485002 (= lt!647949 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1485003 () Bool)

(declare-fun res!1009726 () Bool)

(assert (=> b!1485003 (=> (not res!1009726) (not e!832546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485003 (= res!1009726 (validKeyInArray!0 (select (arr!48030 a!2862) j!93)))))

(declare-fun b!1485004 () Bool)

(declare-fun res!1009725 () Bool)

(assert (=> b!1485004 (=> (not res!1009725) (not e!832545))))

(assert (=> b!1485004 (= res!1009725 e!832538)))

(declare-fun c!137160 () Bool)

(assert (=> b!1485004 (= c!137160 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1485005 () Bool)

(declare-fun res!1009718 () Bool)

(assert (=> b!1485005 (=> (not res!1009718) (not e!832541))))

(assert (=> b!1485005 (= res!1009718 (= (seekEntryOrOpen!0 (select (arr!48030 a!2862) j!93) a!2862 mask!2687) (Found!12270 j!93)))))

(declare-fun b!1485006 () Bool)

(declare-fun res!1009732 () Bool)

(assert (=> b!1485006 (=> (not res!1009732) (not e!832546))))

(assert (=> b!1485006 (= res!1009732 (validKeyInArray!0 (select (arr!48030 a!2862) i!1006)))))

(declare-fun b!1485007 () Bool)

(declare-fun res!1009723 () Bool)

(assert (=> b!1485007 (=> (not res!1009723) (not e!832546))))

(declare-datatypes ((List!34531 0))(
  ( (Nil!34528) (Cons!34527 (h!35901 (_ BitVec 64)) (t!49225 List!34531)) )
))
(declare-fun arrayNoDuplicates!0 (array!99508 (_ BitVec 32) List!34531) Bool)

(assert (=> b!1485007 (= res!1009723 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34528))))

(declare-fun b!1485008 () Bool)

(assert (=> b!1485008 (= e!832546 e!832542)))

(declare-fun res!1009714 () Bool)

(assert (=> b!1485008 (=> (not res!1009714) (not e!832542))))

(assert (=> b!1485008 (= res!1009714 (= (select (store (arr!48030 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1485008 (= lt!647944 (array!99509 (store (arr!48030 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48580 a!2862)))))

(declare-fun b!1485009 () Bool)

(declare-fun res!1009720 () Bool)

(assert (=> b!1485009 (=> (not res!1009720) (not e!832546))))

(assert (=> b!1485009 (= res!1009720 (and (= (size!48580 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48580 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48580 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!126546 res!1009722) b!1485009))

(assert (= (and b!1485009 res!1009720) b!1485006))

(assert (= (and b!1485006 res!1009732) b!1485003))

(assert (= (and b!1485003 res!1009726) b!1484998))

(assert (= (and b!1484998 res!1009717) b!1485007))

(assert (= (and b!1485007 res!1009723) b!1484990))

(assert (= (and b!1484990 res!1009727) b!1485008))

(assert (= (and b!1485008 res!1009714) b!1484995))

(assert (= (and b!1484995 res!1009730) b!1484991))

(assert (= (and b!1484991 res!1009721) b!1484996))

(assert (= (and b!1484996 res!1009729) b!1485004))

(assert (= (and b!1485004 c!137160) b!1484994))

(assert (= (and b!1485004 (not c!137160)) b!1484989))

(assert (= (and b!1485004 res!1009725) b!1484997))

(assert (= (and b!1484997 res!1009724) b!1485000))

(assert (= (and b!1485000 res!1009716) b!1485005))

(assert (= (and b!1485005 res!1009718) b!1484999))

(assert (= (and b!1484999 res!1009731) b!1485001))

(assert (= (and b!1485001 (not res!1009719)) b!1484993))

(assert (= (and b!1484993 res!1009728) b!1484992))

(assert (= (and b!1485000 (not res!1009715)) b!1485002))

(declare-fun m!1370201 () Bool)

(assert (=> b!1485005 m!1370201))

(assert (=> b!1485005 m!1370201))

(declare-fun m!1370203 () Bool)

(assert (=> b!1485005 m!1370203))

(declare-fun m!1370205 () Bool)

(assert (=> b!1484994 m!1370205))

(assert (=> b!1484995 m!1370201))

(assert (=> b!1484995 m!1370201))

(declare-fun m!1370207 () Bool)

(assert (=> b!1484995 m!1370207))

(assert (=> b!1484995 m!1370207))

(assert (=> b!1484995 m!1370201))

(declare-fun m!1370209 () Bool)

(assert (=> b!1484995 m!1370209))

(assert (=> b!1485003 m!1370201))

(assert (=> b!1485003 m!1370201))

(declare-fun m!1370211 () Bool)

(assert (=> b!1485003 m!1370211))

(declare-fun m!1370213 () Bool)

(assert (=> b!1484989 m!1370213))

(declare-fun m!1370215 () Bool)

(assert (=> b!1484989 m!1370215))

(declare-fun m!1370217 () Bool)

(assert (=> b!1485007 m!1370217))

(declare-fun m!1370219 () Bool)

(assert (=> b!1485001 m!1370219))

(assert (=> b!1485001 m!1370201))

(declare-fun m!1370221 () Bool)

(assert (=> b!1485001 m!1370221))

(declare-fun m!1370223 () Bool)

(assert (=> b!1485001 m!1370223))

(declare-fun m!1370225 () Bool)

(assert (=> b!1484999 m!1370225))

(assert (=> b!1484999 m!1370201))

(declare-fun m!1370227 () Bool)

(assert (=> b!1485002 m!1370227))

(assert (=> b!1485008 m!1370221))

(declare-fun m!1370229 () Bool)

(assert (=> b!1485008 m!1370229))

(declare-fun m!1370231 () Bool)

(assert (=> b!1485000 m!1370231))

(assert (=> b!1485000 m!1370221))

(assert (=> b!1485000 m!1370223))

(assert (=> b!1485000 m!1370219))

(declare-fun m!1370233 () Bool)

(assert (=> b!1485000 m!1370233))

(assert (=> b!1485000 m!1370201))

(assert (=> b!1484991 m!1370201))

(assert (=> b!1484991 m!1370201))

(declare-fun m!1370235 () Bool)

(assert (=> b!1484991 m!1370235))

(declare-fun m!1370237 () Bool)

(assert (=> start!126546 m!1370237))

(declare-fun m!1370239 () Bool)

(assert (=> start!126546 m!1370239))

(declare-fun m!1370241 () Bool)

(assert (=> b!1484996 m!1370241))

(assert (=> b!1484996 m!1370241))

(declare-fun m!1370243 () Bool)

(assert (=> b!1484996 m!1370243))

(assert (=> b!1484996 m!1370221))

(declare-fun m!1370245 () Bool)

(assert (=> b!1484996 m!1370245))

(declare-fun m!1370247 () Bool)

(assert (=> b!1485006 m!1370247))

(assert (=> b!1485006 m!1370247))

(declare-fun m!1370249 () Bool)

(assert (=> b!1485006 m!1370249))

(declare-fun m!1370251 () Bool)

(assert (=> b!1484998 m!1370251))

(assert (=> b!1484992 m!1370215))

(assert (=> b!1484992 m!1370213))

(check-sat (not b!1484991) (not b!1485000) (not b!1484995) (not b!1485007) (not b!1484992) (not b!1484989) (not b!1485005) (not b!1485003) (not b!1484996) (not start!126546) (not b!1484994) (not b!1485002) (not b!1484998) (not b!1485006))
(check-sat)
