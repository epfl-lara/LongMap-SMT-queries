; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126762 () Bool)

(assert start!126762)

(declare-fun b!1484744 () Bool)

(declare-fun res!1008559 () Bool)

(declare-fun e!832674 () Bool)

(assert (=> b!1484744 (=> (not res!1008559) (not e!832674))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12189 0))(
  ( (MissingZero!12189 (index!51148 (_ BitVec 32))) (Found!12189 (index!51149 (_ BitVec 32))) (Intermediate!12189 (undefined!13001 Bool) (index!51150 (_ BitVec 32)) (x!132922 (_ BitVec 32))) (Undefined!12189) (MissingVacant!12189 (index!51151 (_ BitVec 32))) )
))
(declare-fun lt!647929 () SeekEntryResult!12189)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99562 0))(
  ( (array!99563 (arr!48052 (Array (_ BitVec 32) (_ BitVec 64))) (size!48603 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99562)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99562 (_ BitVec 32)) SeekEntryResult!12189)

(assert (=> b!1484744 (= res!1008559 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48052 a!2862) j!93) a!2862 mask!2687) lt!647929))))

(declare-fun b!1484745 () Bool)

(declare-fun e!832680 () Bool)

(assert (=> b!1484745 (= e!832680 e!832674)))

(declare-fun res!1008572 () Bool)

(assert (=> b!1484745 (=> (not res!1008572) (not e!832674))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484745 (= res!1008572 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48052 a!2862) j!93) mask!2687) (select (arr!48052 a!2862) j!93) a!2862 mask!2687) lt!647929))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1484745 (= lt!647929 (Intermediate!12189 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484746 () Bool)

(declare-fun e!832676 () Bool)

(assert (=> b!1484746 (= e!832676 true)))

(declare-fun lt!647935 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484746 (= lt!647935 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun res!1008560 () Bool)

(declare-fun e!832672 () Bool)

(assert (=> start!126762 (=> (not res!1008560) (not e!832672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126762 (= res!1008560 (validMask!0 mask!2687))))

(assert (=> start!126762 e!832672))

(assert (=> start!126762 true))

(declare-fun array_inv!37333 (array!99562) Bool)

(assert (=> start!126762 (array_inv!37333 a!2862)))

(declare-fun lt!647931 () array!99562)

(declare-fun b!1484747 () Bool)

(declare-fun e!832679 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!647934 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99562 (_ BitVec 32)) SeekEntryResult!12189)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99562 (_ BitVec 32)) SeekEntryResult!12189)

(assert (=> b!1484747 (= e!832679 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647934 lt!647931 mask!2687) (seekEntryOrOpen!0 lt!647934 lt!647931 mask!2687)))))

(declare-fun b!1484748 () Bool)

(declare-fun res!1008561 () Bool)

(assert (=> b!1484748 (=> (not res!1008561) (not e!832672))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484748 (= res!1008561 (validKeyInArray!0 (select (arr!48052 a!2862) i!1006)))))

(declare-fun b!1484749 () Bool)

(declare-fun res!1008569 () Bool)

(declare-fun e!832678 () Bool)

(assert (=> b!1484749 (=> (not res!1008569) (not e!832678))))

(assert (=> b!1484749 (= res!1008569 (or (= (select (arr!48052 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48052 a!2862) intermediateBeforeIndex!19) (select (arr!48052 a!2862) j!93))))))

(declare-fun e!832671 () Bool)

(declare-fun b!1484750 () Bool)

(assert (=> b!1484750 (= e!832671 (= (seekEntryOrOpen!0 lt!647934 lt!647931 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647934 lt!647931 mask!2687)))))

(declare-fun b!1484751 () Bool)

(declare-fun res!1008562 () Bool)

(assert (=> b!1484751 (=> (not res!1008562) (not e!832678))))

(assert (=> b!1484751 (= res!1008562 (= (seekEntryOrOpen!0 (select (arr!48052 a!2862) j!93) a!2862 mask!2687) (Found!12189 j!93)))))

(declare-fun b!1484752 () Bool)

(declare-fun e!832675 () Bool)

(assert (=> b!1484752 (= e!832678 e!832675)))

(declare-fun res!1008557 () Bool)

(assert (=> b!1484752 (=> res!1008557 e!832675)))

(declare-fun lt!647930 () (_ BitVec 64))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1484752 (= res!1008557 (or (and (= (select (arr!48052 a!2862) index!646) lt!647930) (= (select (arr!48052 a!2862) index!646) (select (arr!48052 a!2862) j!93))) (= (select (arr!48052 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484752 (= lt!647930 (select (store (arr!48052 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484753 () Bool)

(declare-fun res!1008564 () Bool)

(assert (=> b!1484753 (=> (not res!1008564) (not e!832672))))

(declare-datatypes ((List!34540 0))(
  ( (Nil!34537) (Cons!34536 (h!35924 (_ BitVec 64)) (t!49226 List!34540)) )
))
(declare-fun arrayNoDuplicates!0 (array!99562 (_ BitVec 32) List!34540) Bool)

(assert (=> b!1484753 (= res!1008564 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34537))))

(declare-fun b!1484754 () Bool)

(assert (=> b!1484754 (= e!832675 e!832671)))

(declare-fun res!1008568 () Bool)

(assert (=> b!1484754 (=> (not res!1008568) (not e!832671))))

(assert (=> b!1484754 (= res!1008568 (and (= index!646 intermediateAfterIndex!19) (= lt!647930 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484755 () Bool)

(declare-fun res!1008574 () Bool)

(assert (=> b!1484755 (=> (not res!1008574) (not e!832672))))

(assert (=> b!1484755 (= res!1008574 (and (= (size!48603 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48603 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48603 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484756 () Bool)

(declare-fun lt!647932 () SeekEntryResult!12189)

(assert (=> b!1484756 (= e!832679 (= lt!647932 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647934 lt!647931 mask!2687)))))

(declare-fun b!1484757 () Bool)

(declare-fun res!1008570 () Bool)

(assert (=> b!1484757 (=> (not res!1008570) (not e!832672))))

(assert (=> b!1484757 (= res!1008570 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48603 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48603 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48603 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484758 () Bool)

(declare-fun res!1008575 () Bool)

(declare-fun e!832677 () Bool)

(assert (=> b!1484758 (=> (not res!1008575) (not e!832677))))

(assert (=> b!1484758 (= res!1008575 e!832679)))

(declare-fun c!137626 () Bool)

(assert (=> b!1484758 (= c!137626 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484759 () Bool)

(declare-fun res!1008558 () Bool)

(assert (=> b!1484759 (=> (not res!1008558) (not e!832672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99562 (_ BitVec 32)) Bool)

(assert (=> b!1484759 (= res!1008558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484760 () Bool)

(assert (=> b!1484760 (= e!832672 e!832680)))

(declare-fun res!1008567 () Bool)

(assert (=> b!1484760 (=> (not res!1008567) (not e!832680))))

(assert (=> b!1484760 (= res!1008567 (= (select (store (arr!48052 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484760 (= lt!647931 (array!99563 (store (arr!48052 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48603 a!2862)))))

(declare-fun b!1484761 () Bool)

(assert (=> b!1484761 (= e!832674 e!832677)))

(declare-fun res!1008571 () Bool)

(assert (=> b!1484761 (=> (not res!1008571) (not e!832677))))

(assert (=> b!1484761 (= res!1008571 (= lt!647932 (Intermediate!12189 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1484761 (= lt!647932 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647934 mask!2687) lt!647934 lt!647931 mask!2687))))

(assert (=> b!1484761 (= lt!647934 (select (store (arr!48052 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484762 () Bool)

(assert (=> b!1484762 (= e!832677 (not e!832676))))

(declare-fun res!1008565 () Bool)

(assert (=> b!1484762 (=> res!1008565 e!832676)))

(assert (=> b!1484762 (= res!1008565 (or (and (= (select (arr!48052 a!2862) index!646) (select (store (arr!48052 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48052 a!2862) index!646) (select (arr!48052 a!2862) j!93))) (= (select (arr!48052 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484762 e!832678))

(declare-fun res!1008563 () Bool)

(assert (=> b!1484762 (=> (not res!1008563) (not e!832678))))

(assert (=> b!1484762 (= res!1008563 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49751 0))(
  ( (Unit!49752) )
))
(declare-fun lt!647933 () Unit!49751)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49751)

(assert (=> b!1484762 (= lt!647933 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484763 () Bool)

(declare-fun res!1008573 () Bool)

(assert (=> b!1484763 (=> (not res!1008573) (not e!832672))))

(assert (=> b!1484763 (= res!1008573 (validKeyInArray!0 (select (arr!48052 a!2862) j!93)))))

(declare-fun b!1484764 () Bool)

(declare-fun res!1008566 () Bool)

(assert (=> b!1484764 (=> (not res!1008566) (not e!832677))))

(assert (=> b!1484764 (= res!1008566 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126762 res!1008560) b!1484755))

(assert (= (and b!1484755 res!1008574) b!1484748))

(assert (= (and b!1484748 res!1008561) b!1484763))

(assert (= (and b!1484763 res!1008573) b!1484759))

(assert (= (and b!1484759 res!1008558) b!1484753))

(assert (= (and b!1484753 res!1008564) b!1484757))

(assert (= (and b!1484757 res!1008570) b!1484760))

(assert (= (and b!1484760 res!1008567) b!1484745))

(assert (= (and b!1484745 res!1008572) b!1484744))

(assert (= (and b!1484744 res!1008559) b!1484761))

(assert (= (and b!1484761 res!1008571) b!1484758))

(assert (= (and b!1484758 c!137626) b!1484756))

(assert (= (and b!1484758 (not c!137626)) b!1484747))

(assert (= (and b!1484758 res!1008575) b!1484764))

(assert (= (and b!1484764 res!1008566) b!1484762))

(assert (= (and b!1484762 res!1008563) b!1484751))

(assert (= (and b!1484751 res!1008562) b!1484749))

(assert (= (and b!1484749 res!1008569) b!1484752))

(assert (= (and b!1484752 (not res!1008557)) b!1484754))

(assert (= (and b!1484754 res!1008568) b!1484750))

(assert (= (and b!1484762 (not res!1008565)) b!1484746))

(declare-fun m!1370275 () Bool)

(assert (=> b!1484751 m!1370275))

(assert (=> b!1484751 m!1370275))

(declare-fun m!1370277 () Bool)

(assert (=> b!1484751 m!1370277))

(declare-fun m!1370279 () Bool)

(assert (=> start!126762 m!1370279))

(declare-fun m!1370281 () Bool)

(assert (=> start!126762 m!1370281))

(assert (=> b!1484744 m!1370275))

(assert (=> b!1484744 m!1370275))

(declare-fun m!1370283 () Bool)

(assert (=> b!1484744 m!1370283))

(declare-fun m!1370285 () Bool)

(assert (=> b!1484746 m!1370285))

(declare-fun m!1370287 () Bool)

(assert (=> b!1484747 m!1370287))

(declare-fun m!1370289 () Bool)

(assert (=> b!1484747 m!1370289))

(declare-fun m!1370291 () Bool)

(assert (=> b!1484761 m!1370291))

(assert (=> b!1484761 m!1370291))

(declare-fun m!1370293 () Bool)

(assert (=> b!1484761 m!1370293))

(declare-fun m!1370295 () Bool)

(assert (=> b!1484761 m!1370295))

(declare-fun m!1370297 () Bool)

(assert (=> b!1484761 m!1370297))

(declare-fun m!1370299 () Bool)

(assert (=> b!1484762 m!1370299))

(assert (=> b!1484762 m!1370295))

(declare-fun m!1370301 () Bool)

(assert (=> b!1484762 m!1370301))

(declare-fun m!1370303 () Bool)

(assert (=> b!1484762 m!1370303))

(declare-fun m!1370305 () Bool)

(assert (=> b!1484762 m!1370305))

(assert (=> b!1484762 m!1370275))

(declare-fun m!1370307 () Bool)

(assert (=> b!1484756 m!1370307))

(declare-fun m!1370309 () Bool)

(assert (=> b!1484759 m!1370309))

(assert (=> b!1484752 m!1370303))

(assert (=> b!1484752 m!1370275))

(assert (=> b!1484752 m!1370295))

(assert (=> b!1484752 m!1370301))

(declare-fun m!1370311 () Bool)

(assert (=> b!1484753 m!1370311))

(declare-fun m!1370313 () Bool)

(assert (=> b!1484748 m!1370313))

(assert (=> b!1484748 m!1370313))

(declare-fun m!1370315 () Bool)

(assert (=> b!1484748 m!1370315))

(assert (=> b!1484760 m!1370295))

(declare-fun m!1370317 () Bool)

(assert (=> b!1484760 m!1370317))

(assert (=> b!1484745 m!1370275))

(assert (=> b!1484745 m!1370275))

(declare-fun m!1370319 () Bool)

(assert (=> b!1484745 m!1370319))

(assert (=> b!1484745 m!1370319))

(assert (=> b!1484745 m!1370275))

(declare-fun m!1370321 () Bool)

(assert (=> b!1484745 m!1370321))

(declare-fun m!1370323 () Bool)

(assert (=> b!1484749 m!1370323))

(assert (=> b!1484749 m!1370275))

(assert (=> b!1484750 m!1370289))

(assert (=> b!1484750 m!1370287))

(assert (=> b!1484763 m!1370275))

(assert (=> b!1484763 m!1370275))

(declare-fun m!1370325 () Bool)

(assert (=> b!1484763 m!1370325))

(check-sat (not b!1484761) (not b!1484745) (not b!1484747) (not b!1484748) (not b!1484746) (not b!1484751) (not b!1484763) (not start!126762) (not b!1484762) (not b!1484750) (not b!1484753) (not b!1484744) (not b!1484756) (not b!1484759))
(check-sat)
