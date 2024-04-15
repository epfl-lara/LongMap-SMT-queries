; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124864 () Bool)

(assert start!124864)

(declare-fun b!1450568 () Bool)

(declare-fun res!982006 () Bool)

(declare-fun e!816796 () Bool)

(assert (=> b!1450568 (=> (not res!982006) (not e!816796))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11711 0))(
  ( (MissingZero!11711 (index!49236 (_ BitVec 32))) (Found!11711 (index!49237 (_ BitVec 32))) (Intermediate!11711 (undefined!12523 Bool) (index!49238 (_ BitVec 32)) (x!130891 (_ BitVec 32))) (Undefined!11711) (MissingVacant!11711 (index!49239 (_ BitVec 32))) )
))
(declare-fun lt!636188 () SeekEntryResult!11711)

(declare-datatypes ((array!98290 0))(
  ( (array!98291 (arr!47434 (Array (_ BitVec 32) (_ BitVec 64))) (size!47986 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98290)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98290 (_ BitVec 32)) SeekEntryResult!11711)

(assert (=> b!1450568 (= res!982006 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47434 a!2862) j!93) a!2862 mask!2687) lt!636188))))

(declare-fun b!1450569 () Bool)

(declare-fun res!982007 () Bool)

(declare-fun e!816789 () Bool)

(assert (=> b!1450569 (=> res!982007 e!816789)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!636195 () SeekEntryResult!11711)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98290 (_ BitVec 32)) SeekEntryResult!11711)

(assert (=> b!1450569 (= res!982007 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47434 a!2862) j!93) a!2862 mask!2687) lt!636195)))))

(declare-fun b!1450570 () Bool)

(declare-fun res!981996 () Bool)

(declare-fun e!816797 () Bool)

(assert (=> b!1450570 (=> (not res!981996) (not e!816797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450570 (= res!981996 (validKeyInArray!0 (select (arr!47434 a!2862) j!93)))))

(declare-fun lt!636194 () array!98290)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!816791 () Bool)

(declare-fun lt!636190 () (_ BitVec 64))

(declare-fun b!1450571 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98290 (_ BitVec 32)) SeekEntryResult!11711)

(assert (=> b!1450571 (= e!816791 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636190 lt!636194 mask!2687) (seekEntryOrOpen!0 lt!636190 lt!636194 mask!2687)))))

(declare-fun b!1450572 () Bool)

(declare-fun e!816798 () Bool)

(declare-fun e!816790 () Bool)

(assert (=> b!1450572 (= e!816798 e!816790)))

(declare-fun res!982004 () Bool)

(assert (=> b!1450572 (=> res!982004 e!816790)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1450572 (= res!982004 (or (and (= (select (arr!47434 a!2862) index!646) (select (store (arr!47434 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47434 a!2862) index!646) (select (arr!47434 a!2862) j!93))) (not (= (select (arr!47434 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1450573 () Bool)

(declare-fun res!982009 () Bool)

(assert (=> b!1450573 (=> (not res!982009) (not e!816797))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1450573 (= res!982009 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47986 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47986 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47986 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!982001 () Bool)

(assert (=> start!124864 (=> (not res!982001) (not e!816797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124864 (= res!982001 (validMask!0 mask!2687))))

(assert (=> start!124864 e!816797))

(assert (=> start!124864 true))

(declare-fun array_inv!36667 (array!98290) Bool)

(assert (=> start!124864 (array_inv!36667 a!2862)))

(declare-fun e!816795 () Bool)

(declare-fun b!1450574 () Bool)

(assert (=> b!1450574 (= e!816795 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450575 () Bool)

(declare-fun res!981995 () Bool)

(declare-fun e!816794 () Bool)

(assert (=> b!1450575 (=> (not res!981995) (not e!816794))))

(assert (=> b!1450575 (= res!981995 e!816791)))

(declare-fun c!133801 () Bool)

(assert (=> b!1450575 (= c!133801 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450576 () Bool)

(declare-fun lt!636189 () SeekEntryResult!11711)

(assert (=> b!1450576 (= e!816791 (= lt!636189 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636190 lt!636194 mask!2687)))))

(declare-fun b!1450577 () Bool)

(assert (=> b!1450577 (= e!816794 (not e!816789))))

(declare-fun res!981999 () Bool)

(assert (=> b!1450577 (=> res!981999 e!816789)))

(assert (=> b!1450577 (= res!981999 (or (and (= (select (arr!47434 a!2862) index!646) (select (store (arr!47434 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47434 a!2862) index!646) (select (arr!47434 a!2862) j!93))) (not (= (select (arr!47434 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47434 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1450577 e!816798))

(declare-fun res!982005 () Bool)

(assert (=> b!1450577 (=> (not res!982005) (not e!816798))))

(declare-fun lt!636193 () SeekEntryResult!11711)

(assert (=> b!1450577 (= res!982005 (and (= lt!636193 lt!636195) (or (= (select (arr!47434 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47434 a!2862) intermediateBeforeIndex!19) (select (arr!47434 a!2862) j!93)))))))

(assert (=> b!1450577 (= lt!636195 (Found!11711 j!93))))

(assert (=> b!1450577 (= lt!636193 (seekEntryOrOpen!0 (select (arr!47434 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98290 (_ BitVec 32)) Bool)

(assert (=> b!1450577 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48759 0))(
  ( (Unit!48760) )
))
(declare-fun lt!636192 () Unit!48759)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48759)

(assert (=> b!1450577 (= lt!636192 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450578 () Bool)

(assert (=> b!1450578 (= e!816789 true)))

(assert (=> b!1450578 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636190 lt!636194 mask!2687) lt!636195)))

(declare-fun lt!636191 () Unit!48759)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48759)

(assert (=> b!1450578 (= lt!636191 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1450579 () Bool)

(declare-fun res!981992 () Bool)

(assert (=> b!1450579 (=> (not res!981992) (not e!816794))))

(assert (=> b!1450579 (= res!981992 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450580 () Bool)

(declare-fun res!981994 () Bool)

(assert (=> b!1450580 (=> (not res!981994) (not e!816797))))

(assert (=> b!1450580 (= res!981994 (validKeyInArray!0 (select (arr!47434 a!2862) i!1006)))))

(declare-fun b!1450581 () Bool)

(assert (=> b!1450581 (= e!816796 e!816794)))

(declare-fun res!981998 () Bool)

(assert (=> b!1450581 (=> (not res!981998) (not e!816794))))

(assert (=> b!1450581 (= res!981998 (= lt!636189 (Intermediate!11711 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450581 (= lt!636189 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636190 mask!2687) lt!636190 lt!636194 mask!2687))))

(assert (=> b!1450581 (= lt!636190 (select (store (arr!47434 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450582 () Bool)

(declare-fun res!981993 () Bool)

(assert (=> b!1450582 (=> (not res!981993) (not e!816797))))

(assert (=> b!1450582 (= res!981993 (and (= (size!47986 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47986 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47986 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450583 () Bool)

(declare-fun res!982003 () Bool)

(assert (=> b!1450583 (=> (not res!982003) (not e!816797))))

(declare-datatypes ((List!34013 0))(
  ( (Nil!34010) (Cons!34009 (h!35359 (_ BitVec 64)) (t!48699 List!34013)) )
))
(declare-fun arrayNoDuplicates!0 (array!98290 (_ BitVec 32) List!34013) Bool)

(assert (=> b!1450583 (= res!982003 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34010))))

(declare-fun b!1450584 () Bool)

(declare-fun res!981997 () Bool)

(assert (=> b!1450584 (=> (not res!981997) (not e!816797))))

(assert (=> b!1450584 (= res!981997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450585 () Bool)

(assert (=> b!1450585 (= e!816790 e!816795)))

(declare-fun res!982000 () Bool)

(assert (=> b!1450585 (=> (not res!982000) (not e!816795))))

(assert (=> b!1450585 (= res!982000 (= lt!636193 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47434 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450586 () Bool)

(declare-fun e!816793 () Bool)

(assert (=> b!1450586 (= e!816797 e!816793)))

(declare-fun res!982008 () Bool)

(assert (=> b!1450586 (=> (not res!982008) (not e!816793))))

(assert (=> b!1450586 (= res!982008 (= (select (store (arr!47434 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1450586 (= lt!636194 (array!98291 (store (arr!47434 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47986 a!2862)))))

(declare-fun b!1450587 () Bool)

(assert (=> b!1450587 (= e!816793 e!816796)))

(declare-fun res!982002 () Bool)

(assert (=> b!1450587 (=> (not res!982002) (not e!816796))))

(assert (=> b!1450587 (= res!982002 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47434 a!2862) j!93) mask!2687) (select (arr!47434 a!2862) j!93) a!2862 mask!2687) lt!636188))))

(assert (=> b!1450587 (= lt!636188 (Intermediate!11711 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124864 res!982001) b!1450582))

(assert (= (and b!1450582 res!981993) b!1450580))

(assert (= (and b!1450580 res!981994) b!1450570))

(assert (= (and b!1450570 res!981996) b!1450584))

(assert (= (and b!1450584 res!981997) b!1450583))

(assert (= (and b!1450583 res!982003) b!1450573))

(assert (= (and b!1450573 res!982009) b!1450586))

(assert (= (and b!1450586 res!982008) b!1450587))

(assert (= (and b!1450587 res!982002) b!1450568))

(assert (= (and b!1450568 res!982006) b!1450581))

(assert (= (and b!1450581 res!981998) b!1450575))

(assert (= (and b!1450575 c!133801) b!1450576))

(assert (= (and b!1450575 (not c!133801)) b!1450571))

(assert (= (and b!1450575 res!981995) b!1450579))

(assert (= (and b!1450579 res!981992) b!1450577))

(assert (= (and b!1450577 res!982005) b!1450572))

(assert (= (and b!1450572 (not res!982004)) b!1450585))

(assert (= (and b!1450585 res!982000) b!1450574))

(assert (= (and b!1450577 (not res!981999)) b!1450569))

(assert (= (and b!1450569 (not res!982007)) b!1450578))

(declare-fun m!1338711 () Bool)

(assert (=> b!1450583 m!1338711))

(declare-fun m!1338713 () Bool)

(assert (=> b!1450587 m!1338713))

(assert (=> b!1450587 m!1338713))

(declare-fun m!1338715 () Bool)

(assert (=> b!1450587 m!1338715))

(assert (=> b!1450587 m!1338715))

(assert (=> b!1450587 m!1338713))

(declare-fun m!1338717 () Bool)

(assert (=> b!1450587 m!1338717))

(declare-fun m!1338719 () Bool)

(assert (=> start!124864 m!1338719))

(declare-fun m!1338721 () Bool)

(assert (=> start!124864 m!1338721))

(assert (=> b!1450585 m!1338713))

(assert (=> b!1450585 m!1338713))

(declare-fun m!1338723 () Bool)

(assert (=> b!1450585 m!1338723))

(declare-fun m!1338725 () Bool)

(assert (=> b!1450572 m!1338725))

(declare-fun m!1338727 () Bool)

(assert (=> b!1450572 m!1338727))

(declare-fun m!1338729 () Bool)

(assert (=> b!1450572 m!1338729))

(assert (=> b!1450572 m!1338713))

(declare-fun m!1338731 () Bool)

(assert (=> b!1450577 m!1338731))

(assert (=> b!1450577 m!1338727))

(declare-fun m!1338733 () Bool)

(assert (=> b!1450577 m!1338733))

(assert (=> b!1450577 m!1338729))

(assert (=> b!1450577 m!1338725))

(assert (=> b!1450577 m!1338713))

(declare-fun m!1338735 () Bool)

(assert (=> b!1450577 m!1338735))

(declare-fun m!1338737 () Bool)

(assert (=> b!1450577 m!1338737))

(assert (=> b!1450577 m!1338713))

(declare-fun m!1338739 () Bool)

(assert (=> b!1450581 m!1338739))

(assert (=> b!1450581 m!1338739))

(declare-fun m!1338741 () Bool)

(assert (=> b!1450581 m!1338741))

(assert (=> b!1450581 m!1338727))

(declare-fun m!1338743 () Bool)

(assert (=> b!1450581 m!1338743))

(declare-fun m!1338745 () Bool)

(assert (=> b!1450576 m!1338745))

(declare-fun m!1338747 () Bool)

(assert (=> b!1450578 m!1338747))

(declare-fun m!1338749 () Bool)

(assert (=> b!1450578 m!1338749))

(declare-fun m!1338751 () Bool)

(assert (=> b!1450580 m!1338751))

(assert (=> b!1450580 m!1338751))

(declare-fun m!1338753 () Bool)

(assert (=> b!1450580 m!1338753))

(assert (=> b!1450568 m!1338713))

(assert (=> b!1450568 m!1338713))

(declare-fun m!1338755 () Bool)

(assert (=> b!1450568 m!1338755))

(assert (=> b!1450571 m!1338747))

(declare-fun m!1338757 () Bool)

(assert (=> b!1450571 m!1338757))

(declare-fun m!1338759 () Bool)

(assert (=> b!1450584 m!1338759))

(assert (=> b!1450570 m!1338713))

(assert (=> b!1450570 m!1338713))

(declare-fun m!1338761 () Bool)

(assert (=> b!1450570 m!1338761))

(assert (=> b!1450586 m!1338727))

(declare-fun m!1338763 () Bool)

(assert (=> b!1450586 m!1338763))

(assert (=> b!1450569 m!1338713))

(assert (=> b!1450569 m!1338713))

(declare-fun m!1338765 () Bool)

(assert (=> b!1450569 m!1338765))

(check-sat (not b!1450580) (not b!1450583) (not b!1450569) (not b!1450570) (not start!124864) (not b!1450581) (not b!1450577) (not b!1450584) (not b!1450578) (not b!1450585) (not b!1450568) (not b!1450576) (not b!1450587) (not b!1450571))
(check-sat)
