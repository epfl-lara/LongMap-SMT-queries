; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125050 () Bool)

(assert start!125050)

(declare-fun b!1455294 () Bool)

(declare-fun res!986000 () Bool)

(declare-fun e!818912 () Bool)

(assert (=> b!1455294 (=> (not res!986000) (not e!818912))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98498 0))(
  ( (array!98499 (arr!47537 (Array (_ BitVec 32) (_ BitVec 64))) (size!48087 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98498)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1455294 (= res!986000 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48087 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48087 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48087 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1455295 () Bool)

(declare-fun res!985986 () Bool)

(declare-fun e!818920 () Bool)

(assert (=> b!1455295 (=> (not res!985986) (not e!818920))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1455295 (= res!985986 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun e!818915 () Bool)

(declare-fun b!1455296 () Bool)

(declare-fun lt!637899 () array!98498)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!637901 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11789 0))(
  ( (MissingZero!11789 (index!49548 (_ BitVec 32))) (Found!11789 (index!49549 (_ BitVec 32))) (Intermediate!11789 (undefined!12601 Bool) (index!49550 (_ BitVec 32)) (x!131182 (_ BitVec 32))) (Undefined!11789) (MissingVacant!11789 (index!49551 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98498 (_ BitVec 32)) SeekEntryResult!11789)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98498 (_ BitVec 32)) SeekEntryResult!11789)

(assert (=> b!1455296 (= e!818915 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637901 lt!637899 mask!2687) (seekEntryOrOpen!0 lt!637901 lt!637899 mask!2687)))))

(declare-fun b!1455297 () Bool)

(declare-fun res!985985 () Bool)

(assert (=> b!1455297 (=> (not res!985985) (not e!818912))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1455297 (= res!985985 (and (= (size!48087 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48087 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48087 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455298 () Bool)

(declare-fun e!818916 () Bool)

(assert (=> b!1455298 (= e!818916 true)))

(declare-fun lt!637902 () Bool)

(declare-fun e!818918 () Bool)

(assert (=> b!1455298 (= lt!637902 e!818918)))

(declare-fun c!134166 () Bool)

(assert (=> b!1455298 (= c!134166 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455299 () Bool)

(declare-fun lt!637898 () (_ BitVec 32))

(declare-fun lt!637904 () SeekEntryResult!11789)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98498 (_ BitVec 32)) SeekEntryResult!11789)

(assert (=> b!1455299 (= e!818918 (not (= lt!637904 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637898 lt!637901 lt!637899 mask!2687))))))

(declare-fun b!1455300 () Bool)

(declare-fun lt!637903 () SeekEntryResult!11789)

(assert (=> b!1455300 (= e!818918 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637898 intermediateAfterIndex!19 lt!637901 lt!637899 mask!2687) lt!637903)))))

(declare-fun b!1455301 () Bool)

(declare-fun res!985998 () Bool)

(assert (=> b!1455301 (=> (not res!985998) (not e!818912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455301 (= res!985998 (validKeyInArray!0 (select (arr!47537 a!2862) i!1006)))))

(declare-fun b!1455303 () Bool)

(declare-fun e!818919 () Bool)

(assert (=> b!1455303 (= e!818919 e!818920)))

(declare-fun res!985988 () Bool)

(assert (=> b!1455303 (=> (not res!985988) (not e!818920))))

(assert (=> b!1455303 (= res!985988 (= lt!637904 (Intermediate!11789 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455303 (= lt!637904 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637901 mask!2687) lt!637901 lt!637899 mask!2687))))

(assert (=> b!1455303 (= lt!637901 (select (store (arr!47537 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455304 () Bool)

(declare-fun res!986002 () Bool)

(declare-fun e!818913 () Bool)

(assert (=> b!1455304 (=> (not res!986002) (not e!818913))))

(assert (=> b!1455304 (= res!986002 (= (seekEntryOrOpen!0 (select (arr!47537 a!2862) j!93) a!2862 mask!2687) (Found!11789 j!93)))))

(declare-fun b!1455305 () Bool)

(declare-fun res!985991 () Bool)

(assert (=> b!1455305 (=> (not res!985991) (not e!818912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98498 (_ BitVec 32)) Bool)

(assert (=> b!1455305 (= res!985991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455306 () Bool)

(declare-fun res!986001 () Bool)

(assert (=> b!1455306 (=> (not res!986001) (not e!818919))))

(declare-fun lt!637900 () SeekEntryResult!11789)

(assert (=> b!1455306 (= res!986001 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47537 a!2862) j!93) a!2862 mask!2687) lt!637900))))

(declare-fun b!1455307 () Bool)

(declare-fun res!985993 () Bool)

(assert (=> b!1455307 (=> res!985993 e!818916)))

(assert (=> b!1455307 (= res!985993 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637898 (select (arr!47537 a!2862) j!93) a!2862 mask!2687) lt!637900)))))

(declare-fun res!985999 () Bool)

(assert (=> start!125050 (=> (not res!985999) (not e!818912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125050 (= res!985999 (validMask!0 mask!2687))))

(assert (=> start!125050 e!818912))

(assert (=> start!125050 true))

(declare-fun array_inv!36565 (array!98498) Bool)

(assert (=> start!125050 (array_inv!36565 a!2862)))

(declare-fun b!1455302 () Bool)

(declare-fun res!985990 () Bool)

(assert (=> b!1455302 (=> (not res!985990) (not e!818912))))

(assert (=> b!1455302 (= res!985990 (validKeyInArray!0 (select (arr!47537 a!2862) j!93)))))

(declare-fun b!1455308 () Bool)

(declare-fun res!985995 () Bool)

(assert (=> b!1455308 (=> (not res!985995) (not e!818912))))

(declare-datatypes ((List!34038 0))(
  ( (Nil!34035) (Cons!34034 (h!35384 (_ BitVec 64)) (t!48732 List!34038)) )
))
(declare-fun arrayNoDuplicates!0 (array!98498 (_ BitVec 32) List!34038) Bool)

(assert (=> b!1455308 (= res!985995 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34035))))

(declare-fun b!1455309 () Bool)

(declare-fun res!985992 () Bool)

(assert (=> b!1455309 (=> (not res!985992) (not e!818920))))

(assert (=> b!1455309 (= res!985992 e!818915)))

(declare-fun c!134165 () Bool)

(assert (=> b!1455309 (= c!134165 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1455310 () Bool)

(assert (=> b!1455310 (= e!818915 (= lt!637904 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637901 lt!637899 mask!2687)))))

(declare-fun b!1455311 () Bool)

(declare-fun e!818914 () Bool)

(assert (=> b!1455311 (= e!818920 (not e!818914))))

(declare-fun res!985997 () Bool)

(assert (=> b!1455311 (=> res!985997 e!818914)))

(assert (=> b!1455311 (= res!985997 (or (and (= (select (arr!47537 a!2862) index!646) (select (store (arr!47537 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47537 a!2862) index!646) (select (arr!47537 a!2862) j!93))) (= (select (arr!47537 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1455311 e!818913))

(declare-fun res!985987 () Bool)

(assert (=> b!1455311 (=> (not res!985987) (not e!818913))))

(assert (=> b!1455311 (= res!985987 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49074 0))(
  ( (Unit!49075) )
))
(declare-fun lt!637905 () Unit!49074)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98498 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49074)

(assert (=> b!1455311 (= lt!637905 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455312 () Bool)

(assert (=> b!1455312 (= e!818914 e!818916)))

(declare-fun res!985994 () Bool)

(assert (=> b!1455312 (=> res!985994 e!818916)))

(assert (=> b!1455312 (= res!985994 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637898 #b00000000000000000000000000000000) (bvsge lt!637898 (size!48087 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455312 (= lt!637898 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1455312 (= lt!637903 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637901 lt!637899 mask!2687))))

(assert (=> b!1455312 (= lt!637903 (seekEntryOrOpen!0 lt!637901 lt!637899 mask!2687))))

(declare-fun b!1455313 () Bool)

(declare-fun e!818917 () Bool)

(assert (=> b!1455313 (= e!818917 e!818919)))

(declare-fun res!985989 () Bool)

(assert (=> b!1455313 (=> (not res!985989) (not e!818919))))

(assert (=> b!1455313 (= res!985989 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47537 a!2862) j!93) mask!2687) (select (arr!47537 a!2862) j!93) a!2862 mask!2687) lt!637900))))

(assert (=> b!1455313 (= lt!637900 (Intermediate!11789 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455314 () Bool)

(assert (=> b!1455314 (= e!818912 e!818917)))

(declare-fun res!985996 () Bool)

(assert (=> b!1455314 (=> (not res!985996) (not e!818917))))

(assert (=> b!1455314 (= res!985996 (= (select (store (arr!47537 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455314 (= lt!637899 (array!98499 (store (arr!47537 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48087 a!2862)))))

(declare-fun b!1455315 () Bool)

(assert (=> b!1455315 (= e!818913 (and (or (= (select (arr!47537 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47537 a!2862) intermediateBeforeIndex!19) (select (arr!47537 a!2862) j!93))) (let ((bdg!53143 (select (store (arr!47537 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47537 a!2862) index!646) bdg!53143) (= (select (arr!47537 a!2862) index!646) (select (arr!47537 a!2862) j!93))) (= (select (arr!47537 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53143 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and start!125050 res!985999) b!1455297))

(assert (= (and b!1455297 res!985985) b!1455301))

(assert (= (and b!1455301 res!985998) b!1455302))

(assert (= (and b!1455302 res!985990) b!1455305))

(assert (= (and b!1455305 res!985991) b!1455308))

(assert (= (and b!1455308 res!985995) b!1455294))

(assert (= (and b!1455294 res!986000) b!1455314))

(assert (= (and b!1455314 res!985996) b!1455313))

(assert (= (and b!1455313 res!985989) b!1455306))

(assert (= (and b!1455306 res!986001) b!1455303))

(assert (= (and b!1455303 res!985988) b!1455309))

(assert (= (and b!1455309 c!134165) b!1455310))

(assert (= (and b!1455309 (not c!134165)) b!1455296))

(assert (= (and b!1455309 res!985992) b!1455295))

(assert (= (and b!1455295 res!985986) b!1455311))

(assert (= (and b!1455311 res!985987) b!1455304))

(assert (= (and b!1455304 res!986002) b!1455315))

(assert (= (and b!1455311 (not res!985997)) b!1455312))

(assert (= (and b!1455312 (not res!985994)) b!1455307))

(assert (= (and b!1455307 (not res!985993)) b!1455298))

(assert (= (and b!1455298 c!134166) b!1455299))

(assert (= (and b!1455298 (not c!134166)) b!1455300))

(declare-fun m!1343533 () Bool)

(assert (=> b!1455301 m!1343533))

(assert (=> b!1455301 m!1343533))

(declare-fun m!1343535 () Bool)

(assert (=> b!1455301 m!1343535))

(declare-fun m!1343537 () Bool)

(assert (=> b!1455315 m!1343537))

(declare-fun m!1343539 () Bool)

(assert (=> b!1455315 m!1343539))

(declare-fun m!1343541 () Bool)

(assert (=> b!1455315 m!1343541))

(declare-fun m!1343543 () Bool)

(assert (=> b!1455315 m!1343543))

(declare-fun m!1343545 () Bool)

(assert (=> b!1455315 m!1343545))

(declare-fun m!1343547 () Bool)

(assert (=> b!1455300 m!1343547))

(declare-fun m!1343549 () Bool)

(assert (=> b!1455296 m!1343549))

(declare-fun m!1343551 () Bool)

(assert (=> b!1455296 m!1343551))

(declare-fun m!1343553 () Bool)

(assert (=> b!1455311 m!1343553))

(assert (=> b!1455311 m!1343537))

(assert (=> b!1455311 m!1343541))

(assert (=> b!1455311 m!1343543))

(declare-fun m!1343555 () Bool)

(assert (=> b!1455311 m!1343555))

(assert (=> b!1455311 m!1343545))

(declare-fun m!1343557 () Bool)

(assert (=> b!1455308 m!1343557))

(declare-fun m!1343559 () Bool)

(assert (=> b!1455312 m!1343559))

(assert (=> b!1455312 m!1343549))

(assert (=> b!1455312 m!1343551))

(declare-fun m!1343561 () Bool)

(assert (=> b!1455303 m!1343561))

(assert (=> b!1455303 m!1343561))

(declare-fun m!1343563 () Bool)

(assert (=> b!1455303 m!1343563))

(assert (=> b!1455303 m!1343537))

(declare-fun m!1343565 () Bool)

(assert (=> b!1455303 m!1343565))

(declare-fun m!1343567 () Bool)

(assert (=> b!1455299 m!1343567))

(assert (=> b!1455313 m!1343545))

(assert (=> b!1455313 m!1343545))

(declare-fun m!1343569 () Bool)

(assert (=> b!1455313 m!1343569))

(assert (=> b!1455313 m!1343569))

(assert (=> b!1455313 m!1343545))

(declare-fun m!1343571 () Bool)

(assert (=> b!1455313 m!1343571))

(assert (=> b!1455302 m!1343545))

(assert (=> b!1455302 m!1343545))

(declare-fun m!1343573 () Bool)

(assert (=> b!1455302 m!1343573))

(assert (=> b!1455306 m!1343545))

(assert (=> b!1455306 m!1343545))

(declare-fun m!1343575 () Bool)

(assert (=> b!1455306 m!1343575))

(assert (=> b!1455307 m!1343545))

(assert (=> b!1455307 m!1343545))

(declare-fun m!1343577 () Bool)

(assert (=> b!1455307 m!1343577))

(assert (=> b!1455304 m!1343545))

(assert (=> b!1455304 m!1343545))

(declare-fun m!1343579 () Bool)

(assert (=> b!1455304 m!1343579))

(assert (=> b!1455314 m!1343537))

(declare-fun m!1343581 () Bool)

(assert (=> b!1455314 m!1343581))

(declare-fun m!1343583 () Bool)

(assert (=> start!125050 m!1343583))

(declare-fun m!1343585 () Bool)

(assert (=> start!125050 m!1343585))

(declare-fun m!1343587 () Bool)

(assert (=> b!1455310 m!1343587))

(declare-fun m!1343589 () Bool)

(assert (=> b!1455305 m!1343589))

(push 1)

