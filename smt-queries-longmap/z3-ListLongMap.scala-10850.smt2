; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127014 () Bool)

(assert start!127014)

(declare-fun b!1492789 () Bool)

(declare-fun res!1015590 () Bool)

(declare-fun e!836286 () Bool)

(assert (=> b!1492789 (=> (not res!1015590) (not e!836286))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12372 0))(
  ( (MissingZero!12372 (index!51880 (_ BitVec 32))) (Found!12372 (index!51881 (_ BitVec 32))) (Intermediate!12372 (undefined!13184 Bool) (index!51882 (_ BitVec 32)) (x!133472 (_ BitVec 32))) (Undefined!12372) (MissingVacant!12372 (index!51883 (_ BitVec 32))) )
))
(declare-fun lt!650772 () SeekEntryResult!12372)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99724 0))(
  ( (array!99725 (arr!48132 (Array (_ BitVec 32) (_ BitVec 64))) (size!48682 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99724)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99724 (_ BitVec 32)) SeekEntryResult!12372)

(assert (=> b!1492789 (= res!1015590 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48132 a!2862) j!93) a!2862 mask!2687) lt!650772))))

(declare-fun b!1492790 () Bool)

(declare-fun res!1015581 () Bool)

(declare-fun e!836281 () Bool)

(assert (=> b!1492790 (=> (not res!1015581) (not e!836281))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1492790 (= res!1015581 (validKeyInArray!0 (select (arr!48132 a!2862) i!1006)))))

(declare-fun res!1015587 () Bool)

(assert (=> start!127014 (=> (not res!1015587) (not e!836281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127014 (= res!1015587 (validMask!0 mask!2687))))

(assert (=> start!127014 e!836281))

(assert (=> start!127014 true))

(declare-fun array_inv!37160 (array!99724) Bool)

(assert (=> start!127014 (array_inv!37160 a!2862)))

(declare-fun b!1492791 () Bool)

(declare-fun res!1015585 () Bool)

(declare-fun e!836285 () Bool)

(assert (=> b!1492791 (=> (not res!1015585) (not e!836285))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99724 (_ BitVec 32)) SeekEntryResult!12372)

(assert (=> b!1492791 (= res!1015585 (= (seekEntryOrOpen!0 (select (arr!48132 a!2862) j!93) a!2862 mask!2687) (Found!12372 j!93)))))

(declare-fun b!1492792 () Bool)

(declare-fun res!1015577 () Bool)

(assert (=> b!1492792 (=> (not res!1015577) (not e!836281))))

(declare-datatypes ((List!34633 0))(
  ( (Nil!34630) (Cons!34629 (h!36015 (_ BitVec 64)) (t!49327 List!34633)) )
))
(declare-fun arrayNoDuplicates!0 (array!99724 (_ BitVec 32) List!34633) Bool)

(assert (=> b!1492792 (= res!1015577 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34630))))

(declare-fun b!1492793 () Bool)

(declare-fun res!1015576 () Bool)

(assert (=> b!1492793 (=> (not res!1015576) (not e!836281))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1492793 (= res!1015576 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48682 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48682 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48682 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1492794 () Bool)

(declare-fun e!836283 () Bool)

(assert (=> b!1492794 (= e!836283 true)))

(declare-fun lt!650771 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492794 (= lt!650771 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1492795 () Bool)

(declare-fun e!836284 () Bool)

(assert (=> b!1492795 (= e!836281 e!836284)))

(declare-fun res!1015589 () Bool)

(assert (=> b!1492795 (=> (not res!1015589) (not e!836284))))

(assert (=> b!1492795 (= res!1015589 (= (select (store (arr!48132 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!650769 () array!99724)

(assert (=> b!1492795 (= lt!650769 (array!99725 (store (arr!48132 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48682 a!2862)))))

(declare-fun b!1492796 () Bool)

(declare-fun res!1015583 () Bool)

(assert (=> b!1492796 (=> (not res!1015583) (not e!836281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99724 (_ BitVec 32)) Bool)

(assert (=> b!1492796 (= res!1015583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1492797 () Bool)

(declare-fun res!1015579 () Bool)

(assert (=> b!1492797 (=> (not res!1015579) (not e!836281))))

(assert (=> b!1492797 (= res!1015579 (and (= (size!48682 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48682 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48682 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1492798 () Bool)

(declare-fun res!1015582 () Bool)

(assert (=> b!1492798 (=> (not res!1015582) (not e!836281))))

(assert (=> b!1492798 (= res!1015582 (validKeyInArray!0 (select (arr!48132 a!2862) j!93)))))

(declare-fun b!1492799 () Bool)

(declare-fun e!836287 () Bool)

(declare-fun lt!650767 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99724 (_ BitVec 32)) SeekEntryResult!12372)

(assert (=> b!1492799 (= e!836287 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650767 lt!650769 mask!2687) (seekEntryOrOpen!0 lt!650767 lt!650769 mask!2687)))))

(declare-fun b!1492800 () Bool)

(assert (=> b!1492800 (= e!836285 (or (= (select (arr!48132 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48132 a!2862) intermediateBeforeIndex!19) (select (arr!48132 a!2862) j!93))))))

(declare-fun b!1492801 () Bool)

(declare-fun res!1015591 () Bool)

(declare-fun e!836288 () Bool)

(assert (=> b!1492801 (=> (not res!1015591) (not e!836288))))

(assert (=> b!1492801 (= res!1015591 e!836287)))

(declare-fun c!138135 () Bool)

(assert (=> b!1492801 (= c!138135 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1492802 () Bool)

(assert (=> b!1492802 (= e!836286 e!836288)))

(declare-fun res!1015584 () Bool)

(assert (=> b!1492802 (=> (not res!1015584) (not e!836288))))

(declare-fun lt!650768 () SeekEntryResult!12372)

(assert (=> b!1492802 (= res!1015584 (= lt!650768 (Intermediate!12372 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1492802 (= lt!650768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650767 mask!2687) lt!650767 lt!650769 mask!2687))))

(assert (=> b!1492802 (= lt!650767 (select (store (arr!48132 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1492803 () Bool)

(declare-fun res!1015580 () Bool)

(assert (=> b!1492803 (=> (not res!1015580) (not e!836288))))

(assert (=> b!1492803 (= res!1015580 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1492804 () Bool)

(assert (=> b!1492804 (= e!836287 (= lt!650768 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650767 lt!650769 mask!2687)))))

(declare-fun b!1492805 () Bool)

(assert (=> b!1492805 (= e!836284 e!836286)))

(declare-fun res!1015586 () Bool)

(assert (=> b!1492805 (=> (not res!1015586) (not e!836286))))

(assert (=> b!1492805 (= res!1015586 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48132 a!2862) j!93) mask!2687) (select (arr!48132 a!2862) j!93) a!2862 mask!2687) lt!650772))))

(assert (=> b!1492805 (= lt!650772 (Intermediate!12372 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1492806 () Bool)

(assert (=> b!1492806 (= e!836288 (not e!836283))))

(declare-fun res!1015578 () Bool)

(assert (=> b!1492806 (=> res!1015578 e!836283)))

(assert (=> b!1492806 (= res!1015578 (or (and (= (select (arr!48132 a!2862) index!646) (select (store (arr!48132 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48132 a!2862) index!646) (select (arr!48132 a!2862) j!93))) (= (select (arr!48132 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1492806 e!836285))

(declare-fun res!1015588 () Bool)

(assert (=> b!1492806 (=> (not res!1015588) (not e!836285))))

(assert (=> b!1492806 (= res!1015588 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50084 0))(
  ( (Unit!50085) )
))
(declare-fun lt!650770 () Unit!50084)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99724 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50084)

(assert (=> b!1492806 (= lt!650770 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!127014 res!1015587) b!1492797))

(assert (= (and b!1492797 res!1015579) b!1492790))

(assert (= (and b!1492790 res!1015581) b!1492798))

(assert (= (and b!1492798 res!1015582) b!1492796))

(assert (= (and b!1492796 res!1015583) b!1492792))

(assert (= (and b!1492792 res!1015577) b!1492793))

(assert (= (and b!1492793 res!1015576) b!1492795))

(assert (= (and b!1492795 res!1015589) b!1492805))

(assert (= (and b!1492805 res!1015586) b!1492789))

(assert (= (and b!1492789 res!1015590) b!1492802))

(assert (= (and b!1492802 res!1015584) b!1492801))

(assert (= (and b!1492801 c!138135) b!1492804))

(assert (= (and b!1492801 (not c!138135)) b!1492799))

(assert (= (and b!1492801 res!1015591) b!1492803))

(assert (= (and b!1492803 res!1015580) b!1492806))

(assert (= (and b!1492806 res!1015588) b!1492791))

(assert (= (and b!1492791 res!1015585) b!1492800))

(assert (= (and b!1492806 (not res!1015578)) b!1492794))

(declare-fun m!1376729 () Bool)

(assert (=> b!1492790 m!1376729))

(assert (=> b!1492790 m!1376729))

(declare-fun m!1376731 () Bool)

(assert (=> b!1492790 m!1376731))

(declare-fun m!1376733 () Bool)

(assert (=> b!1492792 m!1376733))

(declare-fun m!1376735 () Bool)

(assert (=> start!127014 m!1376735))

(declare-fun m!1376737 () Bool)

(assert (=> start!127014 m!1376737))

(declare-fun m!1376739 () Bool)

(assert (=> b!1492805 m!1376739))

(assert (=> b!1492805 m!1376739))

(declare-fun m!1376741 () Bool)

(assert (=> b!1492805 m!1376741))

(assert (=> b!1492805 m!1376741))

(assert (=> b!1492805 m!1376739))

(declare-fun m!1376743 () Bool)

(assert (=> b!1492805 m!1376743))

(declare-fun m!1376745 () Bool)

(assert (=> b!1492796 m!1376745))

(declare-fun m!1376747 () Bool)

(assert (=> b!1492802 m!1376747))

(assert (=> b!1492802 m!1376747))

(declare-fun m!1376749 () Bool)

(assert (=> b!1492802 m!1376749))

(declare-fun m!1376751 () Bool)

(assert (=> b!1492802 m!1376751))

(declare-fun m!1376753 () Bool)

(assert (=> b!1492802 m!1376753))

(assert (=> b!1492798 m!1376739))

(assert (=> b!1492798 m!1376739))

(declare-fun m!1376755 () Bool)

(assert (=> b!1492798 m!1376755))

(declare-fun m!1376757 () Bool)

(assert (=> b!1492794 m!1376757))

(assert (=> b!1492789 m!1376739))

(assert (=> b!1492789 m!1376739))

(declare-fun m!1376759 () Bool)

(assert (=> b!1492789 m!1376759))

(declare-fun m!1376761 () Bool)

(assert (=> b!1492800 m!1376761))

(assert (=> b!1492800 m!1376739))

(declare-fun m!1376763 () Bool)

(assert (=> b!1492806 m!1376763))

(assert (=> b!1492806 m!1376751))

(declare-fun m!1376765 () Bool)

(assert (=> b!1492806 m!1376765))

(declare-fun m!1376767 () Bool)

(assert (=> b!1492806 m!1376767))

(declare-fun m!1376769 () Bool)

(assert (=> b!1492806 m!1376769))

(assert (=> b!1492806 m!1376739))

(declare-fun m!1376771 () Bool)

(assert (=> b!1492804 m!1376771))

(declare-fun m!1376773 () Bool)

(assert (=> b!1492799 m!1376773))

(declare-fun m!1376775 () Bool)

(assert (=> b!1492799 m!1376775))

(assert (=> b!1492791 m!1376739))

(assert (=> b!1492791 m!1376739))

(declare-fun m!1376777 () Bool)

(assert (=> b!1492791 m!1376777))

(assert (=> b!1492795 m!1376751))

(declare-fun m!1376779 () Bool)

(assert (=> b!1492795 m!1376779))

(check-sat (not b!1492802) (not b!1492792) (not b!1492794) (not b!1492789) (not b!1492804) (not b!1492799) (not b!1492791) (not b!1492805) (not b!1492790) (not start!127014) (not b!1492806) (not b!1492796) (not b!1492798))
(check-sat)
