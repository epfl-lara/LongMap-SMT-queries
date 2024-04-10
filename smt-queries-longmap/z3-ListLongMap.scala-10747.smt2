; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125682 () Bool)

(assert start!125682)

(declare-fun b!1470732 () Bool)

(declare-fun res!998837 () Bool)

(declare-fun e!825575 () Bool)

(assert (=> b!1470732 (=> (not res!998837) (not e!825575))))

(declare-datatypes ((array!99073 0))(
  ( (array!99074 (arr!47823 (Array (_ BitVec 32) (_ BitVec 64))) (size!48373 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99073)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470732 (= res!998837 (validKeyInArray!0 (select (arr!47823 a!2862) j!93)))))

(declare-fun b!1470733 () Bool)

(declare-fun res!998838 () Bool)

(assert (=> b!1470733 (=> (not res!998838) (not e!825575))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99073 (_ BitVec 32)) Bool)

(assert (=> b!1470733 (= res!998838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470734 () Bool)

(declare-fun res!998832 () Bool)

(assert (=> b!1470734 (=> (not res!998832) (not e!825575))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1470734 (= res!998832 (validKeyInArray!0 (select (arr!47823 a!2862) i!1006)))))

(declare-fun res!998839 () Bool)

(assert (=> start!125682 (=> (not res!998839) (not e!825575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125682 (= res!998839 (validMask!0 mask!2687))))

(assert (=> start!125682 e!825575))

(assert (=> start!125682 true))

(declare-fun array_inv!36851 (array!99073) Bool)

(assert (=> start!125682 (array_inv!36851 a!2862)))

(declare-fun b!1470735 () Bool)

(declare-fun e!825574 () Bool)

(assert (=> b!1470735 (= e!825575 e!825574)))

(declare-fun res!998835 () Bool)

(assert (=> b!1470735 (=> (not res!998835) (not e!825574))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1470735 (= res!998835 (= (select (store (arr!47823 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643020 () array!99073)

(assert (=> b!1470735 (= lt!643020 (array!99074 (store (arr!47823 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48373 a!2862)))))

(declare-fun e!825571 () Bool)

(declare-fun b!1470736 () Bool)

(declare-datatypes ((SeekEntryResult!12063 0))(
  ( (MissingZero!12063 (index!50644 (_ BitVec 32))) (Found!12063 (index!50645 (_ BitVec 32))) (Intermediate!12063 (undefined!12875 Bool) (index!50646 (_ BitVec 32)) (x!132225 (_ BitVec 32))) (Undefined!12063) (MissingVacant!12063 (index!50647 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99073 (_ BitVec 32)) SeekEntryResult!12063)

(assert (=> b!1470736 (= e!825571 (= (seekEntryOrOpen!0 (select (arr!47823 a!2862) j!93) a!2862 mask!2687) (Found!12063 j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!643019 () (_ BitVec 64))

(declare-fun b!1470737 () Bool)

(declare-fun e!825569 () Bool)

(declare-fun lt!643018 () SeekEntryResult!12063)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99073 (_ BitVec 32)) SeekEntryResult!12063)

(assert (=> b!1470737 (= e!825569 (= lt!643018 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643019 lt!643020 mask!2687)))))

(declare-fun b!1470738 () Bool)

(declare-fun res!998828 () Bool)

(assert (=> b!1470738 (=> (not res!998828) (not e!825575))))

(assert (=> b!1470738 (= res!998828 (and (= (size!48373 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48373 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48373 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470739 () Bool)

(declare-fun e!825570 () Bool)

(declare-fun e!825573 () Bool)

(assert (=> b!1470739 (= e!825570 e!825573)))

(declare-fun res!998827 () Bool)

(assert (=> b!1470739 (=> (not res!998827) (not e!825573))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1470739 (= res!998827 (= lt!643018 (Intermediate!12063 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470739 (= lt!643018 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643019 mask!2687) lt!643019 lt!643020 mask!2687))))

(assert (=> b!1470739 (= lt!643019 (select (store (arr!47823 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1470740 () Bool)

(assert (=> b!1470740 (= e!825574 e!825570)))

(declare-fun res!998826 () Bool)

(assert (=> b!1470740 (=> (not res!998826) (not e!825570))))

(declare-fun lt!643017 () SeekEntryResult!12063)

(assert (=> b!1470740 (= res!998826 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47823 a!2862) j!93) mask!2687) (select (arr!47823 a!2862) j!93) a!2862 mask!2687) lt!643017))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1470740 (= lt!643017 (Intermediate!12063 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470741 () Bool)

(declare-fun res!998829 () Bool)

(assert (=> b!1470741 (=> (not res!998829) (not e!825570))))

(assert (=> b!1470741 (= res!998829 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47823 a!2862) j!93) a!2862 mask!2687) lt!643017))))

(declare-fun b!1470742 () Bool)

(declare-fun res!998830 () Bool)

(assert (=> b!1470742 (=> (not res!998830) (not e!825575))))

(declare-datatypes ((List!34324 0))(
  ( (Nil!34321) (Cons!34320 (h!35673 (_ BitVec 64)) (t!49018 List!34324)) )
))
(declare-fun arrayNoDuplicates!0 (array!99073 (_ BitVec 32) List!34324) Bool)

(assert (=> b!1470742 (= res!998830 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34321))))

(declare-fun b!1470743 () Bool)

(declare-fun res!998831 () Bool)

(assert (=> b!1470743 (=> (not res!998831) (not e!825573))))

(assert (=> b!1470743 (= res!998831 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1470744 () Bool)

(declare-fun res!998836 () Bool)

(assert (=> b!1470744 (=> (not res!998836) (not e!825573))))

(assert (=> b!1470744 (= res!998836 e!825569)))

(declare-fun c!135465 () Bool)

(assert (=> b!1470744 (= c!135465 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1470745 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99073 (_ BitVec 32)) SeekEntryResult!12063)

(assert (=> b!1470745 (= e!825569 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643019 lt!643020 mask!2687) (seekEntryOrOpen!0 lt!643019 lt!643020 mask!2687)))))

(declare-fun b!1470746 () Bool)

(declare-fun res!998833 () Bool)

(assert (=> b!1470746 (=> (not res!998833) (not e!825575))))

(assert (=> b!1470746 (= res!998833 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48373 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48373 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48373 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1470747 () Bool)

(assert (=> b!1470747 (= e!825573 (not true))))

(assert (=> b!1470747 e!825571))

(declare-fun res!998834 () Bool)

(assert (=> b!1470747 (=> (not res!998834) (not e!825571))))

(assert (=> b!1470747 (= res!998834 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49466 0))(
  ( (Unit!49467) )
))
(declare-fun lt!643016 () Unit!49466)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99073 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49466)

(assert (=> b!1470747 (= lt!643016 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125682 res!998839) b!1470738))

(assert (= (and b!1470738 res!998828) b!1470734))

(assert (= (and b!1470734 res!998832) b!1470732))

(assert (= (and b!1470732 res!998837) b!1470733))

(assert (= (and b!1470733 res!998838) b!1470742))

(assert (= (and b!1470742 res!998830) b!1470746))

(assert (= (and b!1470746 res!998833) b!1470735))

(assert (= (and b!1470735 res!998835) b!1470740))

(assert (= (and b!1470740 res!998826) b!1470741))

(assert (= (and b!1470741 res!998829) b!1470739))

(assert (= (and b!1470739 res!998827) b!1470744))

(assert (= (and b!1470744 c!135465) b!1470737))

(assert (= (and b!1470744 (not c!135465)) b!1470745))

(assert (= (and b!1470744 res!998836) b!1470743))

(assert (= (and b!1470743 res!998831) b!1470747))

(assert (= (and b!1470747 res!998834) b!1470736))

(declare-fun m!1357707 () Bool)

(assert (=> b!1470734 m!1357707))

(assert (=> b!1470734 m!1357707))

(declare-fun m!1357709 () Bool)

(assert (=> b!1470734 m!1357709))

(declare-fun m!1357711 () Bool)

(assert (=> b!1470737 m!1357711))

(declare-fun m!1357713 () Bool)

(assert (=> b!1470739 m!1357713))

(assert (=> b!1470739 m!1357713))

(declare-fun m!1357715 () Bool)

(assert (=> b!1470739 m!1357715))

(declare-fun m!1357717 () Bool)

(assert (=> b!1470739 m!1357717))

(declare-fun m!1357719 () Bool)

(assert (=> b!1470739 m!1357719))

(declare-fun m!1357721 () Bool)

(assert (=> b!1470733 m!1357721))

(declare-fun m!1357723 () Bool)

(assert (=> b!1470747 m!1357723))

(declare-fun m!1357725 () Bool)

(assert (=> b!1470747 m!1357725))

(declare-fun m!1357727 () Bool)

(assert (=> start!125682 m!1357727))

(declare-fun m!1357729 () Bool)

(assert (=> start!125682 m!1357729))

(declare-fun m!1357731 () Bool)

(assert (=> b!1470736 m!1357731))

(assert (=> b!1470736 m!1357731))

(declare-fun m!1357733 () Bool)

(assert (=> b!1470736 m!1357733))

(assert (=> b!1470740 m!1357731))

(assert (=> b!1470740 m!1357731))

(declare-fun m!1357735 () Bool)

(assert (=> b!1470740 m!1357735))

(assert (=> b!1470740 m!1357735))

(assert (=> b!1470740 m!1357731))

(declare-fun m!1357737 () Bool)

(assert (=> b!1470740 m!1357737))

(assert (=> b!1470735 m!1357717))

(declare-fun m!1357739 () Bool)

(assert (=> b!1470735 m!1357739))

(assert (=> b!1470741 m!1357731))

(assert (=> b!1470741 m!1357731))

(declare-fun m!1357741 () Bool)

(assert (=> b!1470741 m!1357741))

(declare-fun m!1357743 () Bool)

(assert (=> b!1470745 m!1357743))

(declare-fun m!1357745 () Bool)

(assert (=> b!1470745 m!1357745))

(declare-fun m!1357747 () Bool)

(assert (=> b!1470742 m!1357747))

(assert (=> b!1470732 m!1357731))

(assert (=> b!1470732 m!1357731))

(declare-fun m!1357749 () Bool)

(assert (=> b!1470732 m!1357749))

(check-sat (not b!1470734) (not b!1470733) (not b!1470736) (not b!1470739) (not b!1470745) (not b!1470747) (not b!1470740) (not b!1470741) (not b!1470742) (not start!125682) (not b!1470737) (not b!1470732))
(check-sat)
