; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126602 () Bool)

(assert start!126602)

(declare-fun b!1486261 () Bool)

(declare-fun res!1010819 () Bool)

(declare-fun e!833141 () Bool)

(assert (=> b!1486261 (=> (not res!1010819) (not e!833141))))

(declare-fun e!833136 () Bool)

(assert (=> b!1486261 (= res!1010819 e!833136)))

(declare-fun c!137248 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1486261 (= c!137248 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1486262 () Bool)

(declare-fun res!1010827 () Bool)

(declare-fun e!833142 () Bool)

(assert (=> b!1486262 (=> (not res!1010827) (not e!833142))))

(declare-datatypes ((array!99499 0))(
  ( (array!99500 (arr!48025 (Array (_ BitVec 32) (_ BitVec 64))) (size!48577 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99499)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12290 0))(
  ( (MissingZero!12290 (index!51552 (_ BitVec 32))) (Found!12290 (index!51553 (_ BitVec 32))) (Intermediate!12290 (undefined!13102 Bool) (index!51554 (_ BitVec 32)) (x!133131 (_ BitVec 32))) (Undefined!12290) (MissingVacant!12290 (index!51555 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99499 (_ BitVec 32)) SeekEntryResult!12290)

(assert (=> b!1486262 (= res!1010827 (= (seekEntryOrOpen!0 (select (arr!48025 a!2862) j!93) a!2862 mask!2687) (Found!12290 j!93)))))

(declare-fun res!1010826 () Bool)

(declare-fun e!833144 () Bool)

(assert (=> start!126602 (=> (not res!1010826) (not e!833144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126602 (= res!1010826 (validMask!0 mask!2687))))

(assert (=> start!126602 e!833144))

(assert (=> start!126602 true))

(declare-fun array_inv!37258 (array!99499) Bool)

(assert (=> start!126602 (array_inv!37258 a!2862)))

(declare-fun b!1486263 () Bool)

(declare-fun e!833140 () Bool)

(assert (=> b!1486263 (= e!833142 e!833140)))

(declare-fun res!1010829 () Bool)

(assert (=> b!1486263 (=> res!1010829 e!833140)))

(declare-fun lt!648230 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1486263 (= res!1010829 (or (and (= (select (arr!48025 a!2862) index!646) lt!648230) (= (select (arr!48025 a!2862) index!646) (select (arr!48025 a!2862) j!93))) (= (select (arr!48025 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1486263 (= lt!648230 (select (store (arr!48025 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1486264 () Bool)

(declare-fun e!833139 () Bool)

(declare-fun e!833138 () Bool)

(assert (=> b!1486264 (= e!833139 e!833138)))

(declare-fun res!1010832 () Bool)

(assert (=> b!1486264 (=> (not res!1010832) (not e!833138))))

(declare-fun lt!648227 () SeekEntryResult!12290)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99499 (_ BitVec 32)) SeekEntryResult!12290)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486264 (= res!1010832 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48025 a!2862) j!93) mask!2687) (select (arr!48025 a!2862) j!93) a!2862 mask!2687) lt!648227))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1486264 (= lt!648227 (Intermediate!12290 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1486265 () Bool)

(assert (=> b!1486265 (= e!833144 e!833139)))

(declare-fun res!1010831 () Bool)

(assert (=> b!1486265 (=> (not res!1010831) (not e!833139))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1486265 (= res!1010831 (= (select (store (arr!48025 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!648229 () array!99499)

(assert (=> b!1486265 (= lt!648229 (array!99500 (store (arr!48025 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48577 a!2862)))))

(declare-fun b!1486266 () Bool)

(declare-fun e!833135 () Bool)

(assert (=> b!1486266 (= e!833140 e!833135)))

(declare-fun res!1010822 () Bool)

(assert (=> b!1486266 (=> (not res!1010822) (not e!833135))))

(assert (=> b!1486266 (= res!1010822 (and (= index!646 intermediateAfterIndex!19) (= lt!648230 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486267 () Bool)

(declare-fun res!1010833 () Bool)

(assert (=> b!1486267 (=> (not res!1010833) (not e!833142))))

(assert (=> b!1486267 (= res!1010833 (or (= (select (arr!48025 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48025 a!2862) intermediateBeforeIndex!19) (select (arr!48025 a!2862) j!93))))))

(declare-fun b!1486268 () Bool)

(declare-fun lt!648232 () (_ BitVec 64))

(declare-fun lt!648233 () SeekEntryResult!12290)

(assert (=> b!1486268 (= e!833136 (= lt!648233 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648232 lt!648229 mask!2687)))))

(declare-fun b!1486269 () Bool)

(declare-fun res!1010820 () Bool)

(assert (=> b!1486269 (=> (not res!1010820) (not e!833144))))

(declare-datatypes ((List!34604 0))(
  ( (Nil!34601) (Cons!34600 (h!35977 (_ BitVec 64)) (t!49290 List!34604)) )
))
(declare-fun arrayNoDuplicates!0 (array!99499 (_ BitVec 32) List!34604) Bool)

(assert (=> b!1486269 (= res!1010820 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34601))))

(declare-fun b!1486270 () Bool)

(declare-fun res!1010830 () Bool)

(assert (=> b!1486270 (=> (not res!1010830) (not e!833144))))

(assert (=> b!1486270 (= res!1010830 (and (= (size!48577 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48577 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48577 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486271 () Bool)

(assert (=> b!1486271 (= e!833138 e!833141)))

(declare-fun res!1010825 () Bool)

(assert (=> b!1486271 (=> (not res!1010825) (not e!833141))))

(assert (=> b!1486271 (= res!1010825 (= lt!648233 (Intermediate!12290 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1486271 (= lt!648233 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648232 mask!2687) lt!648232 lt!648229 mask!2687))))

(assert (=> b!1486271 (= lt!648232 (select (store (arr!48025 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486272 () Bool)

(declare-fun res!1010824 () Bool)

(assert (=> b!1486272 (=> (not res!1010824) (not e!833138))))

(assert (=> b!1486272 (= res!1010824 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48025 a!2862) j!93) a!2862 mask!2687) lt!648227))))

(declare-fun b!1486273 () Bool)

(declare-fun res!1010818 () Bool)

(assert (=> b!1486273 (=> (not res!1010818) (not e!833144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99499 (_ BitVec 32)) Bool)

(assert (=> b!1486273 (= res!1010818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1486274 () Bool)

(declare-fun e!833137 () Bool)

(assert (=> b!1486274 (= e!833137 true)))

(declare-fun lt!648228 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486274 (= lt!648228 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1486275 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99499 (_ BitVec 32)) SeekEntryResult!12290)

(assert (=> b!1486275 (= e!833136 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648232 lt!648229 mask!2687) (seekEntryOrOpen!0 lt!648232 lt!648229 mask!2687)))))

(declare-fun b!1486276 () Bool)

(declare-fun res!1010821 () Bool)

(assert (=> b!1486276 (=> (not res!1010821) (not e!833141))))

(assert (=> b!1486276 (= res!1010821 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486277 () Bool)

(declare-fun res!1010828 () Bool)

(assert (=> b!1486277 (=> (not res!1010828) (not e!833144))))

(assert (=> b!1486277 (= res!1010828 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48577 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48577 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48577 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1486278 () Bool)

(declare-fun res!1010835 () Bool)

(assert (=> b!1486278 (=> (not res!1010835) (not e!833144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486278 (= res!1010835 (validKeyInArray!0 (select (arr!48025 a!2862) j!93)))))

(declare-fun b!1486279 () Bool)

(assert (=> b!1486279 (= e!833141 (not e!833137))))

(declare-fun res!1010823 () Bool)

(assert (=> b!1486279 (=> res!1010823 e!833137)))

(assert (=> b!1486279 (= res!1010823 (or (and (= (select (arr!48025 a!2862) index!646) (select (store (arr!48025 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48025 a!2862) index!646) (select (arr!48025 a!2862) j!93))) (= (select (arr!48025 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486279 e!833142))

(declare-fun res!1010836 () Bool)

(assert (=> b!1486279 (=> (not res!1010836) (not e!833142))))

(assert (=> b!1486279 (= res!1010836 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49761 0))(
  ( (Unit!49762) )
))
(declare-fun lt!648231 () Unit!49761)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49761)

(assert (=> b!1486279 (= lt!648231 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486280 () Bool)

(declare-fun res!1010834 () Bool)

(assert (=> b!1486280 (=> (not res!1010834) (not e!833144))))

(assert (=> b!1486280 (= res!1010834 (validKeyInArray!0 (select (arr!48025 a!2862) i!1006)))))

(declare-fun b!1486281 () Bool)

(assert (=> b!1486281 (= e!833135 (= (seekEntryOrOpen!0 lt!648232 lt!648229 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648232 lt!648229 mask!2687)))))

(assert (= (and start!126602 res!1010826) b!1486270))

(assert (= (and b!1486270 res!1010830) b!1486280))

(assert (= (and b!1486280 res!1010834) b!1486278))

(assert (= (and b!1486278 res!1010835) b!1486273))

(assert (= (and b!1486273 res!1010818) b!1486269))

(assert (= (and b!1486269 res!1010820) b!1486277))

(assert (= (and b!1486277 res!1010828) b!1486265))

(assert (= (and b!1486265 res!1010831) b!1486264))

(assert (= (and b!1486264 res!1010832) b!1486272))

(assert (= (and b!1486272 res!1010824) b!1486271))

(assert (= (and b!1486271 res!1010825) b!1486261))

(assert (= (and b!1486261 c!137248) b!1486268))

(assert (= (and b!1486261 (not c!137248)) b!1486275))

(assert (= (and b!1486261 res!1010819) b!1486276))

(assert (= (and b!1486276 res!1010821) b!1486279))

(assert (= (and b!1486279 res!1010836) b!1486262))

(assert (= (and b!1486262 res!1010827) b!1486267))

(assert (= (and b!1486267 res!1010833) b!1486263))

(assert (= (and b!1486263 (not res!1010829)) b!1486266))

(assert (= (and b!1486266 res!1010822) b!1486281))

(assert (= (and b!1486279 (not res!1010823)) b!1486274))

(declare-fun m!1370571 () Bool)

(assert (=> b!1486272 m!1370571))

(assert (=> b!1486272 m!1370571))

(declare-fun m!1370573 () Bool)

(assert (=> b!1486272 m!1370573))

(declare-fun m!1370575 () Bool)

(assert (=> b!1486265 m!1370575))

(declare-fun m!1370577 () Bool)

(assert (=> b!1486265 m!1370577))

(assert (=> b!1486264 m!1370571))

(assert (=> b!1486264 m!1370571))

(declare-fun m!1370579 () Bool)

(assert (=> b!1486264 m!1370579))

(assert (=> b!1486264 m!1370579))

(assert (=> b!1486264 m!1370571))

(declare-fun m!1370581 () Bool)

(assert (=> b!1486264 m!1370581))

(declare-fun m!1370583 () Bool)

(assert (=> b!1486275 m!1370583))

(declare-fun m!1370585 () Bool)

(assert (=> b!1486275 m!1370585))

(declare-fun m!1370587 () Bool)

(assert (=> b!1486279 m!1370587))

(assert (=> b!1486279 m!1370575))

(declare-fun m!1370589 () Bool)

(assert (=> b!1486279 m!1370589))

(declare-fun m!1370591 () Bool)

(assert (=> b!1486279 m!1370591))

(declare-fun m!1370593 () Bool)

(assert (=> b!1486279 m!1370593))

(assert (=> b!1486279 m!1370571))

(assert (=> b!1486278 m!1370571))

(assert (=> b!1486278 m!1370571))

(declare-fun m!1370595 () Bool)

(assert (=> b!1486278 m!1370595))

(assert (=> b!1486262 m!1370571))

(assert (=> b!1486262 m!1370571))

(declare-fun m!1370597 () Bool)

(assert (=> b!1486262 m!1370597))

(assert (=> b!1486281 m!1370585))

(assert (=> b!1486281 m!1370583))

(declare-fun m!1370599 () Bool)

(assert (=> b!1486274 m!1370599))

(declare-fun m!1370601 () Bool)

(assert (=> b!1486269 m!1370601))

(assert (=> b!1486263 m!1370591))

(assert (=> b!1486263 m!1370571))

(assert (=> b!1486263 m!1370575))

(assert (=> b!1486263 m!1370589))

(declare-fun m!1370603 () Bool)

(assert (=> b!1486268 m!1370603))

(declare-fun m!1370605 () Bool)

(assert (=> start!126602 m!1370605))

(declare-fun m!1370607 () Bool)

(assert (=> start!126602 m!1370607))

(declare-fun m!1370609 () Bool)

(assert (=> b!1486271 m!1370609))

(assert (=> b!1486271 m!1370609))

(declare-fun m!1370611 () Bool)

(assert (=> b!1486271 m!1370611))

(assert (=> b!1486271 m!1370575))

(declare-fun m!1370613 () Bool)

(assert (=> b!1486271 m!1370613))

(declare-fun m!1370615 () Bool)

(assert (=> b!1486267 m!1370615))

(assert (=> b!1486267 m!1370571))

(declare-fun m!1370617 () Bool)

(assert (=> b!1486273 m!1370617))

(declare-fun m!1370619 () Bool)

(assert (=> b!1486280 m!1370619))

(assert (=> b!1486280 m!1370619))

(declare-fun m!1370621 () Bool)

(assert (=> b!1486280 m!1370621))

(check-sat (not b!1486275) (not b!1486278) (not b!1486272) (not b!1486280) (not b!1486269) (not b!1486273) (not b!1486264) (not b!1486274) (not b!1486279) (not b!1486281) (not b!1486271) (not b!1486268) (not b!1486262) (not start!126602))
(check-sat)
