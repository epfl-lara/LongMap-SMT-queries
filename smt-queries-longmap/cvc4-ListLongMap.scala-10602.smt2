; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124754 () Bool)

(assert start!124754)

(declare-fun b!1446717 () Bool)

(declare-fun e!814807 () Bool)

(assert (=> b!1446717 (= e!814807 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98202 0))(
  ( (array!98203 (arr!47389 (Array (_ BitVec 32) (_ BitVec 64))) (size!47939 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98202)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11641 0))(
  ( (MissingZero!11641 (index!48956 (_ BitVec 32))) (Found!11641 (index!48957 (_ BitVec 32))) (Intermediate!11641 (undefined!12453 Bool) (index!48958 (_ BitVec 32)) (x!130634 (_ BitVec 32))) (Undefined!11641) (MissingVacant!11641 (index!48959 (_ BitVec 32))) )
))
(declare-fun lt!634897 () SeekEntryResult!11641)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98202 (_ BitVec 32)) SeekEntryResult!11641)

(assert (=> b!1446717 (= lt!634897 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47389 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1446718 () Bool)

(declare-fun res!978450 () Bool)

(declare-fun e!814812 () Bool)

(assert (=> b!1446718 (=> (not res!978450) (not e!814812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98202 (_ BitVec 32)) Bool)

(assert (=> b!1446718 (= res!978450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446719 () Bool)

(declare-fun e!814806 () Bool)

(declare-fun e!814805 () Bool)

(assert (=> b!1446719 (= e!814806 e!814805)))

(declare-fun res!978444 () Bool)

(assert (=> b!1446719 (=> (not res!978444) (not e!814805))))

(declare-fun lt!634900 () SeekEntryResult!11641)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98202 (_ BitVec 32)) SeekEntryResult!11641)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446719 (= res!978444 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47389 a!2862) j!93) mask!2687) (select (arr!47389 a!2862) j!93) a!2862 mask!2687) lt!634900))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1446719 (= lt!634900 (Intermediate!11641 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446720 () Bool)

(declare-fun res!978451 () Bool)

(assert (=> b!1446720 (=> (not res!978451) (not e!814812))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1446720 (= res!978451 (and (= (size!47939 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47939 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47939 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446721 () Bool)

(declare-fun e!814809 () Bool)

(assert (=> b!1446721 (= e!814805 e!814809)))

(declare-fun res!978446 () Bool)

(assert (=> b!1446721 (=> (not res!978446) (not e!814809))))

(declare-fun lt!634902 () SeekEntryResult!11641)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1446721 (= res!978446 (= lt!634902 (Intermediate!11641 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634899 () (_ BitVec 64))

(declare-fun lt!634901 () array!98202)

(assert (=> b!1446721 (= lt!634902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634899 mask!2687) lt!634899 lt!634901 mask!2687))))

(assert (=> b!1446721 (= lt!634899 (select (store (arr!47389 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446722 () Bool)

(declare-fun res!978445 () Bool)

(assert (=> b!1446722 (=> (not res!978445) (not e!814812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446722 (= res!978445 (validKeyInArray!0 (select (arr!47389 a!2862) i!1006)))))

(declare-fun b!1446723 () Bool)

(declare-fun e!814808 () Bool)

(declare-fun e!814814 () Bool)

(assert (=> b!1446723 (= e!814808 e!814814)))

(declare-fun res!978448 () Bool)

(assert (=> b!1446723 (=> res!978448 e!814814)))

(assert (=> b!1446723 (= res!978448 (or (and (= (select (arr!47389 a!2862) index!646) (select (store (arr!47389 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47389 a!2862) index!646) (select (arr!47389 a!2862) j!93))) (not (= (select (arr!47389 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!814811 () Bool)

(declare-fun b!1446724 () Bool)

(assert (=> b!1446724 (= e!814811 (= lt!634902 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634899 lt!634901 mask!2687)))))

(declare-fun b!1446725 () Bool)

(declare-fun e!814810 () Bool)

(assert (=> b!1446725 (= e!814814 e!814810)))

(declare-fun res!978457 () Bool)

(assert (=> b!1446725 (=> (not res!978457) (not e!814810))))

(declare-fun lt!634898 () SeekEntryResult!11641)

(assert (=> b!1446725 (= res!978457 (= lt!634898 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47389 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1446726 () Bool)

(declare-fun res!978458 () Bool)

(assert (=> b!1446726 (=> (not res!978458) (not e!814812))))

(declare-datatypes ((List!33890 0))(
  ( (Nil!33887) (Cons!33886 (h!35236 (_ BitVec 64)) (t!48584 List!33890)) )
))
(declare-fun arrayNoDuplicates!0 (array!98202 (_ BitVec 32) List!33890) Bool)

(assert (=> b!1446726 (= res!978458 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33887))))

(declare-fun b!1446727 () Bool)

(declare-fun res!978449 () Bool)

(assert (=> b!1446727 (=> (not res!978449) (not e!814809))))

(assert (=> b!1446727 (= res!978449 e!814811)))

(declare-fun c!133647 () Bool)

(assert (=> b!1446727 (= c!133647 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!978455 () Bool)

(assert (=> start!124754 (=> (not res!978455) (not e!814812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124754 (= res!978455 (validMask!0 mask!2687))))

(assert (=> start!124754 e!814812))

(assert (=> start!124754 true))

(declare-fun array_inv!36417 (array!98202) Bool)

(assert (=> start!124754 (array_inv!36417 a!2862)))

(declare-fun b!1446728 () Bool)

(declare-fun res!978452 () Bool)

(assert (=> b!1446728 (=> (not res!978452) (not e!814812))))

(assert (=> b!1446728 (= res!978452 (validKeyInArray!0 (select (arr!47389 a!2862) j!93)))))

(declare-fun b!1446729 () Bool)

(declare-fun res!978460 () Bool)

(assert (=> b!1446729 (=> (not res!978460) (not e!814805))))

(assert (=> b!1446729 (= res!978460 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47389 a!2862) j!93) a!2862 mask!2687) lt!634900))))

(declare-fun b!1446730 () Bool)

(assert (=> b!1446730 (= e!814812 e!814806)))

(declare-fun res!978454 () Bool)

(assert (=> b!1446730 (=> (not res!978454) (not e!814806))))

(assert (=> b!1446730 (= res!978454 (= (select (store (arr!47389 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446730 (= lt!634901 (array!98203 (store (arr!47389 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47939 a!2862)))))

(declare-fun b!1446731 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98202 (_ BitVec 32)) SeekEntryResult!11641)

(assert (=> b!1446731 (= e!814811 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634899 lt!634901 mask!2687) (seekEntryOrOpen!0 lt!634899 lt!634901 mask!2687)))))

(declare-fun b!1446732 () Bool)

(declare-fun res!978447 () Bool)

(assert (=> b!1446732 (=> (not res!978447) (not e!814812))))

(assert (=> b!1446732 (= res!978447 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47939 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47939 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47939 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446733 () Bool)

(assert (=> b!1446733 (= e!814810 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1446734 () Bool)

(assert (=> b!1446734 (= e!814809 (not e!814807))))

(declare-fun res!978459 () Bool)

(assert (=> b!1446734 (=> res!978459 e!814807)))

(assert (=> b!1446734 (= res!978459 (or (and (= (select (arr!47389 a!2862) index!646) (select (store (arr!47389 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47389 a!2862) index!646) (select (arr!47389 a!2862) j!93))) (not (= (select (arr!47389 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47389 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1446734 e!814808))

(declare-fun res!978453 () Bool)

(assert (=> b!1446734 (=> (not res!978453) (not e!814808))))

(assert (=> b!1446734 (= res!978453 (and (= lt!634898 (Found!11641 j!93)) (or (= (select (arr!47389 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47389 a!2862) intermediateBeforeIndex!19) (select (arr!47389 a!2862) j!93)))))))

(assert (=> b!1446734 (= lt!634898 (seekEntryOrOpen!0 (select (arr!47389 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1446734 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48778 0))(
  ( (Unit!48779) )
))
(declare-fun lt!634896 () Unit!48778)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98202 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48778)

(assert (=> b!1446734 (= lt!634896 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446735 () Bool)

(declare-fun res!978456 () Bool)

(assert (=> b!1446735 (=> (not res!978456) (not e!814809))))

(assert (=> b!1446735 (= res!978456 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!124754 res!978455) b!1446720))

(assert (= (and b!1446720 res!978451) b!1446722))

(assert (= (and b!1446722 res!978445) b!1446728))

(assert (= (and b!1446728 res!978452) b!1446718))

(assert (= (and b!1446718 res!978450) b!1446726))

(assert (= (and b!1446726 res!978458) b!1446732))

(assert (= (and b!1446732 res!978447) b!1446730))

(assert (= (and b!1446730 res!978454) b!1446719))

(assert (= (and b!1446719 res!978444) b!1446729))

(assert (= (and b!1446729 res!978460) b!1446721))

(assert (= (and b!1446721 res!978446) b!1446727))

(assert (= (and b!1446727 c!133647) b!1446724))

(assert (= (and b!1446727 (not c!133647)) b!1446731))

(assert (= (and b!1446727 res!978449) b!1446735))

(assert (= (and b!1446735 res!978456) b!1446734))

(assert (= (and b!1446734 res!978453) b!1446723))

(assert (= (and b!1446723 (not res!978448)) b!1446725))

(assert (= (and b!1446725 res!978457) b!1446733))

(assert (= (and b!1446734 (not res!978459)) b!1446717))

(declare-fun m!1335571 () Bool)

(assert (=> start!124754 m!1335571))

(declare-fun m!1335573 () Bool)

(assert (=> start!124754 m!1335573))

(declare-fun m!1335575 () Bool)

(assert (=> b!1446725 m!1335575))

(assert (=> b!1446725 m!1335575))

(declare-fun m!1335577 () Bool)

(assert (=> b!1446725 m!1335577))

(assert (=> b!1446728 m!1335575))

(assert (=> b!1446728 m!1335575))

(declare-fun m!1335579 () Bool)

(assert (=> b!1446728 m!1335579))

(declare-fun m!1335581 () Bool)

(assert (=> b!1446731 m!1335581))

(declare-fun m!1335583 () Bool)

(assert (=> b!1446731 m!1335583))

(declare-fun m!1335585 () Bool)

(assert (=> b!1446722 m!1335585))

(assert (=> b!1446722 m!1335585))

(declare-fun m!1335587 () Bool)

(assert (=> b!1446722 m!1335587))

(declare-fun m!1335589 () Bool)

(assert (=> b!1446723 m!1335589))

(declare-fun m!1335591 () Bool)

(assert (=> b!1446723 m!1335591))

(declare-fun m!1335593 () Bool)

(assert (=> b!1446723 m!1335593))

(assert (=> b!1446723 m!1335575))

(assert (=> b!1446717 m!1335575))

(assert (=> b!1446717 m!1335575))

(declare-fun m!1335595 () Bool)

(assert (=> b!1446717 m!1335595))

(assert (=> b!1446730 m!1335591))

(declare-fun m!1335597 () Bool)

(assert (=> b!1446730 m!1335597))

(declare-fun m!1335599 () Bool)

(assert (=> b!1446726 m!1335599))

(assert (=> b!1446719 m!1335575))

(assert (=> b!1446719 m!1335575))

(declare-fun m!1335601 () Bool)

(assert (=> b!1446719 m!1335601))

(assert (=> b!1446719 m!1335601))

(assert (=> b!1446719 m!1335575))

(declare-fun m!1335603 () Bool)

(assert (=> b!1446719 m!1335603))

(declare-fun m!1335605 () Bool)

(assert (=> b!1446724 m!1335605))

(declare-fun m!1335607 () Bool)

(assert (=> b!1446721 m!1335607))

(assert (=> b!1446721 m!1335607))

(declare-fun m!1335609 () Bool)

(assert (=> b!1446721 m!1335609))

(assert (=> b!1446721 m!1335591))

(declare-fun m!1335611 () Bool)

(assert (=> b!1446721 m!1335611))

(declare-fun m!1335613 () Bool)

(assert (=> b!1446718 m!1335613))

(declare-fun m!1335615 () Bool)

(assert (=> b!1446734 m!1335615))

(assert (=> b!1446734 m!1335591))

(declare-fun m!1335617 () Bool)

(assert (=> b!1446734 m!1335617))

(assert (=> b!1446734 m!1335593))

(assert (=> b!1446734 m!1335589))

(assert (=> b!1446734 m!1335575))

(declare-fun m!1335619 () Bool)

(assert (=> b!1446734 m!1335619))

(declare-fun m!1335621 () Bool)

(assert (=> b!1446734 m!1335621))

(assert (=> b!1446734 m!1335575))

(assert (=> b!1446729 m!1335575))

(assert (=> b!1446729 m!1335575))

(declare-fun m!1335623 () Bool)

(assert (=> b!1446729 m!1335623))

(push 1)

