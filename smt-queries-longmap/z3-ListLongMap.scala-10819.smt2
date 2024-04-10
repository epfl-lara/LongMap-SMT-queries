; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126564 () Bool)

(assert start!126564)

(declare-fun b!1485556 () Bool)

(declare-fun e!832809 () Bool)

(declare-fun e!832808 () Bool)

(assert (=> b!1485556 (= e!832809 e!832808)))

(declare-fun res!1010239 () Bool)

(assert (=> b!1485556 (=> (not res!1010239) (not e!832808))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99526 0))(
  ( (array!99527 (arr!48039 (Array (_ BitVec 32) (_ BitVec 64))) (size!48589 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99526)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1485556 (= res!1010239 (= (select (store (arr!48039 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!648134 () array!99526)

(assert (=> b!1485556 (= lt!648134 (array!99527 (store (arr!48039 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48589 a!2862)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!648133 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!832816 () Bool)

(declare-fun b!1485557 () Bool)

(declare-datatypes ((SeekEntryResult!12279 0))(
  ( (MissingZero!12279 (index!51508 (_ BitVec 32))) (Found!12279 (index!51509 (_ BitVec 32))) (Intermediate!12279 (undefined!13091 Bool) (index!51510 (_ BitVec 32)) (x!133083 (_ BitVec 32))) (Undefined!12279) (MissingVacant!12279 (index!51511 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99526 (_ BitVec 32)) SeekEntryResult!12279)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99526 (_ BitVec 32)) SeekEntryResult!12279)

(assert (=> b!1485557 (= e!832816 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648133 lt!648134 mask!2687) (seekEntryOrOpen!0 lt!648133 lt!648134 mask!2687)))))

(declare-fun b!1485558 () Bool)

(declare-fun res!1010242 () Bool)

(assert (=> b!1485558 (=> (not res!1010242) (not e!832809))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1485558 (= res!1010242 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48589 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48589 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48589 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1485559 () Bool)

(declare-fun e!832813 () Bool)

(assert (=> b!1485559 (= e!832813 (= (seekEntryOrOpen!0 lt!648133 lt!648134 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648133 lt!648134 mask!2687)))))

(declare-fun b!1485560 () Bool)

(declare-fun res!1010244 () Bool)

(assert (=> b!1485560 (=> (not res!1010244) (not e!832809))))

(declare-datatypes ((List!34540 0))(
  ( (Nil!34537) (Cons!34536 (h!35910 (_ BitVec 64)) (t!49234 List!34540)) )
))
(declare-fun arrayNoDuplicates!0 (array!99526 (_ BitVec 32) List!34540) Bool)

(assert (=> b!1485560 (= res!1010244 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34537))))

(declare-fun res!1010240 () Bool)

(assert (=> start!126564 (=> (not res!1010240) (not e!832809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126564 (= res!1010240 (validMask!0 mask!2687))))

(assert (=> start!126564 e!832809))

(assert (=> start!126564 true))

(declare-fun array_inv!37067 (array!99526) Bool)

(assert (=> start!126564 (array_inv!37067 a!2862)))

(declare-fun b!1485561 () Bool)

(declare-fun e!832810 () Bool)

(declare-fun e!832815 () Bool)

(assert (=> b!1485561 (= e!832810 e!832815)))

(declare-fun res!1010237 () Bool)

(assert (=> b!1485561 (=> (not res!1010237) (not e!832815))))

(declare-fun lt!648136 () SeekEntryResult!12279)

(assert (=> b!1485561 (= res!1010237 (= lt!648136 (Intermediate!12279 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99526 (_ BitVec 32)) SeekEntryResult!12279)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485561 (= lt!648136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648133 mask!2687) lt!648133 lt!648134 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1485561 (= lt!648133 (select (store (arr!48039 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1485562 () Bool)

(assert (=> b!1485562 (= e!832808 e!832810)))

(declare-fun res!1010235 () Bool)

(assert (=> b!1485562 (=> (not res!1010235) (not e!832810))))

(declare-fun lt!648138 () SeekEntryResult!12279)

(assert (=> b!1485562 (= res!1010235 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48039 a!2862) j!93) mask!2687) (select (arr!48039 a!2862) j!93) a!2862 mask!2687) lt!648138))))

(assert (=> b!1485562 (= lt!648138 (Intermediate!12279 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1485563 () Bool)

(declare-fun e!832812 () Bool)

(assert (=> b!1485563 (= e!832812 e!832813)))

(declare-fun res!1010234 () Bool)

(assert (=> b!1485563 (=> (not res!1010234) (not e!832813))))

(declare-fun lt!648135 () (_ BitVec 64))

(assert (=> b!1485563 (= res!1010234 (and (= index!646 intermediateAfterIndex!19) (= lt!648135 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485564 () Bool)

(declare-fun res!1010241 () Bool)

(assert (=> b!1485564 (=> (not res!1010241) (not e!832815))))

(assert (=> b!1485564 (= res!1010241 e!832816)))

(declare-fun c!137187 () Bool)

(assert (=> b!1485564 (= c!137187 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1485565 () Bool)

(declare-fun e!832814 () Bool)

(assert (=> b!1485565 (= e!832815 (not e!832814))))

(declare-fun res!1010230 () Bool)

(assert (=> b!1485565 (=> res!1010230 e!832814)))

(assert (=> b!1485565 (= res!1010230 (or (and (= (select (arr!48039 a!2862) index!646) (select (store (arr!48039 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48039 a!2862) index!646) (select (arr!48039 a!2862) j!93))) (= (select (arr!48039 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!832817 () Bool)

(assert (=> b!1485565 e!832817))

(declare-fun res!1010228 () Bool)

(assert (=> b!1485565 (=> (not res!1010228) (not e!832817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99526 (_ BitVec 32)) Bool)

(assert (=> b!1485565 (= res!1010228 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49898 0))(
  ( (Unit!49899) )
))
(declare-fun lt!648137 () Unit!49898)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99526 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49898)

(assert (=> b!1485565 (= lt!648137 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1485566 () Bool)

(declare-fun res!1010245 () Bool)

(assert (=> b!1485566 (=> (not res!1010245) (not e!832809))))

(assert (=> b!1485566 (= res!1010245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1485567 () Bool)

(declare-fun res!1010231 () Bool)

(assert (=> b!1485567 (=> (not res!1010231) (not e!832809))))

(assert (=> b!1485567 (= res!1010231 (and (= (size!48589 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48589 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48589 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1485568 () Bool)

(declare-fun res!1010238 () Bool)

(assert (=> b!1485568 (=> (not res!1010238) (not e!832817))))

(assert (=> b!1485568 (= res!1010238 (or (= (select (arr!48039 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48039 a!2862) intermediateBeforeIndex!19) (select (arr!48039 a!2862) j!93))))))

(declare-fun b!1485569 () Bool)

(assert (=> b!1485569 (= e!832816 (= lt!648136 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648133 lt!648134 mask!2687)))))

(declare-fun b!1485570 () Bool)

(declare-fun res!1010232 () Bool)

(assert (=> b!1485570 (=> (not res!1010232) (not e!832815))))

(assert (=> b!1485570 (= res!1010232 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1485571 () Bool)

(declare-fun res!1010236 () Bool)

(assert (=> b!1485571 (=> (not res!1010236) (not e!832809))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485571 (= res!1010236 (validKeyInArray!0 (select (arr!48039 a!2862) i!1006)))))

(declare-fun b!1485572 () Bool)

(assert (=> b!1485572 (= e!832817 e!832812)))

(declare-fun res!1010243 () Bool)

(assert (=> b!1485572 (=> res!1010243 e!832812)))

(assert (=> b!1485572 (= res!1010243 (or (and (= (select (arr!48039 a!2862) index!646) lt!648135) (= (select (arr!48039 a!2862) index!646) (select (arr!48039 a!2862) j!93))) (= (select (arr!48039 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485572 (= lt!648135 (select (store (arr!48039 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485573 () Bool)

(assert (=> b!1485573 (= e!832814 true)))

(declare-fun lt!648132 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485573 (= lt!648132 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1485574 () Bool)

(declare-fun res!1010229 () Bool)

(assert (=> b!1485574 (=> (not res!1010229) (not e!832817))))

(assert (=> b!1485574 (= res!1010229 (= (seekEntryOrOpen!0 (select (arr!48039 a!2862) j!93) a!2862 mask!2687) (Found!12279 j!93)))))

(declare-fun b!1485575 () Bool)

(declare-fun res!1010233 () Bool)

(assert (=> b!1485575 (=> (not res!1010233) (not e!832809))))

(assert (=> b!1485575 (= res!1010233 (validKeyInArray!0 (select (arr!48039 a!2862) j!93)))))

(declare-fun b!1485576 () Bool)

(declare-fun res!1010227 () Bool)

(assert (=> b!1485576 (=> (not res!1010227) (not e!832810))))

(assert (=> b!1485576 (= res!1010227 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48039 a!2862) j!93) a!2862 mask!2687) lt!648138))))

(assert (= (and start!126564 res!1010240) b!1485567))

(assert (= (and b!1485567 res!1010231) b!1485571))

(assert (= (and b!1485571 res!1010236) b!1485575))

(assert (= (and b!1485575 res!1010233) b!1485566))

(assert (= (and b!1485566 res!1010245) b!1485560))

(assert (= (and b!1485560 res!1010244) b!1485558))

(assert (= (and b!1485558 res!1010242) b!1485556))

(assert (= (and b!1485556 res!1010239) b!1485562))

(assert (= (and b!1485562 res!1010235) b!1485576))

(assert (= (and b!1485576 res!1010227) b!1485561))

(assert (= (and b!1485561 res!1010237) b!1485564))

(assert (= (and b!1485564 c!137187) b!1485569))

(assert (= (and b!1485564 (not c!137187)) b!1485557))

(assert (= (and b!1485564 res!1010241) b!1485570))

(assert (= (and b!1485570 res!1010232) b!1485565))

(assert (= (and b!1485565 res!1010228) b!1485574))

(assert (= (and b!1485574 res!1010229) b!1485568))

(assert (= (and b!1485568 res!1010238) b!1485572))

(assert (= (and b!1485572 (not res!1010243)) b!1485563))

(assert (= (and b!1485563 res!1010234) b!1485559))

(assert (= (and b!1485565 (not res!1010230)) b!1485573))

(declare-fun m!1370669 () Bool)

(assert (=> b!1485572 m!1370669))

(declare-fun m!1370671 () Bool)

(assert (=> b!1485572 m!1370671))

(declare-fun m!1370673 () Bool)

(assert (=> b!1485572 m!1370673))

(declare-fun m!1370675 () Bool)

(assert (=> b!1485572 m!1370675))

(assert (=> b!1485556 m!1370673))

(declare-fun m!1370677 () Bool)

(assert (=> b!1485556 m!1370677))

(declare-fun m!1370679 () Bool)

(assert (=> b!1485561 m!1370679))

(assert (=> b!1485561 m!1370679))

(declare-fun m!1370681 () Bool)

(assert (=> b!1485561 m!1370681))

(assert (=> b!1485561 m!1370673))

(declare-fun m!1370683 () Bool)

(assert (=> b!1485561 m!1370683))

(declare-fun m!1370685 () Bool)

(assert (=> b!1485559 m!1370685))

(declare-fun m!1370687 () Bool)

(assert (=> b!1485559 m!1370687))

(assert (=> b!1485574 m!1370671))

(assert (=> b!1485574 m!1370671))

(declare-fun m!1370689 () Bool)

(assert (=> b!1485574 m!1370689))

(declare-fun m!1370691 () Bool)

(assert (=> b!1485560 m!1370691))

(declare-fun m!1370693 () Bool)

(assert (=> b!1485565 m!1370693))

(assert (=> b!1485565 m!1370673))

(assert (=> b!1485565 m!1370675))

(assert (=> b!1485565 m!1370669))

(declare-fun m!1370695 () Bool)

(assert (=> b!1485565 m!1370695))

(assert (=> b!1485565 m!1370671))

(declare-fun m!1370697 () Bool)

(assert (=> b!1485571 m!1370697))

(assert (=> b!1485571 m!1370697))

(declare-fun m!1370699 () Bool)

(assert (=> b!1485571 m!1370699))

(declare-fun m!1370701 () Bool)

(assert (=> b!1485569 m!1370701))

(assert (=> b!1485576 m!1370671))

(assert (=> b!1485576 m!1370671))

(declare-fun m!1370703 () Bool)

(assert (=> b!1485576 m!1370703))

(assert (=> b!1485557 m!1370687))

(assert (=> b!1485557 m!1370685))

(assert (=> b!1485562 m!1370671))

(assert (=> b!1485562 m!1370671))

(declare-fun m!1370705 () Bool)

(assert (=> b!1485562 m!1370705))

(assert (=> b!1485562 m!1370705))

(assert (=> b!1485562 m!1370671))

(declare-fun m!1370707 () Bool)

(assert (=> b!1485562 m!1370707))

(assert (=> b!1485575 m!1370671))

(assert (=> b!1485575 m!1370671))

(declare-fun m!1370709 () Bool)

(assert (=> b!1485575 m!1370709))

(declare-fun m!1370711 () Bool)

(assert (=> b!1485568 m!1370711))

(assert (=> b!1485568 m!1370671))

(declare-fun m!1370713 () Bool)

(assert (=> start!126564 m!1370713))

(declare-fun m!1370715 () Bool)

(assert (=> start!126564 m!1370715))

(declare-fun m!1370717 () Bool)

(assert (=> b!1485573 m!1370717))

(declare-fun m!1370719 () Bool)

(assert (=> b!1485566 m!1370719))

(check-sat (not b!1485575) (not b!1485565) (not b!1485573) (not b!1485557) (not b!1485559) (not start!126564) (not b!1485561) (not b!1485569) (not b!1485576) (not b!1485562) (not b!1485560) (not b!1485574) (not b!1485566) (not b!1485571))
(check-sat)
