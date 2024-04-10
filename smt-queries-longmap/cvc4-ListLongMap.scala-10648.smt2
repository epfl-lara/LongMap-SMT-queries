; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125030 () Bool)

(assert start!125030)

(declare-fun b!1454634 () Bool)

(declare-fun res!985448 () Bool)

(declare-fun e!818618 () Bool)

(assert (=> b!1454634 (=> (not res!985448) (not e!818618))))

(declare-datatypes ((array!98478 0))(
  ( (array!98479 (arr!47527 (Array (_ BitVec 32) (_ BitVec 64))) (size!48077 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98478)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454634 (= res!985448 (validKeyInArray!0 (select (arr!47527 a!2862) j!93)))))

(declare-fun b!1454635 () Bool)

(declare-fun res!985454 () Bool)

(declare-fun e!818615 () Bool)

(assert (=> b!1454635 (=> (not res!985454) (not e!818615))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11779 0))(
  ( (MissingZero!11779 (index!49508 (_ BitVec 32))) (Found!11779 (index!49509 (_ BitVec 32))) (Intermediate!11779 (undefined!12591 Bool) (index!49510 (_ BitVec 32)) (x!131140 (_ BitVec 32))) (Undefined!11779) (MissingVacant!11779 (index!49511 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98478 (_ BitVec 32)) SeekEntryResult!11779)

(assert (=> b!1454635 (= res!985454 (= (seekEntryOrOpen!0 (select (arr!47527 a!2862) j!93) a!2862 mask!2687) (Found!11779 j!93)))))

(declare-fun b!1454636 () Bool)

(declare-fun e!818620 () Bool)

(assert (=> b!1454636 (= e!818620 true)))

(declare-fun lt!637658 () Bool)

(declare-fun e!818616 () Bool)

(assert (=> b!1454636 (= lt!637658 e!818616)))

(declare-fun c!134105 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1454636 (= c!134105 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1454637 () Bool)

(declare-fun res!985457 () Bool)

(assert (=> b!1454637 (=> (not res!985457) (not e!818618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98478 (_ BitVec 32)) Bool)

(assert (=> b!1454637 (= res!985457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454638 () Bool)

(declare-fun res!985462 () Bool)

(assert (=> b!1454638 (=> (not res!985462) (not e!818618))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1454638 (= res!985462 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48077 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48077 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48077 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454639 () Bool)

(declare-fun res!985461 () Bool)

(assert (=> b!1454639 (=> (not res!985461) (not e!818618))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1454639 (= res!985461 (and (= (size!48077 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48077 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48077 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454641 () Bool)

(declare-fun res!985449 () Bool)

(declare-fun e!818612 () Bool)

(assert (=> b!1454641 (=> (not res!985449) (not e!818612))))

(assert (=> b!1454641 (= res!985449 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454642 () Bool)

(declare-fun e!818619 () Bool)

(assert (=> b!1454642 (= e!818618 e!818619)))

(declare-fun res!985450 () Bool)

(assert (=> b!1454642 (=> (not res!985450) (not e!818619))))

(assert (=> b!1454642 (= res!985450 (= (select (store (arr!47527 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637660 () array!98478)

(assert (=> b!1454642 (= lt!637660 (array!98479 (store (arr!47527 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48077 a!2862)))))

(declare-fun b!1454643 () Bool)

(declare-fun res!985445 () Bool)

(declare-fun e!818613 () Bool)

(assert (=> b!1454643 (=> (not res!985445) (not e!818613))))

(declare-fun lt!637664 () SeekEntryResult!11779)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98478 (_ BitVec 32)) SeekEntryResult!11779)

(assert (=> b!1454643 (= res!985445 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47527 a!2862) j!93) a!2862 mask!2687) lt!637664))))

(declare-fun b!1454644 () Bool)

(declare-fun lt!637663 () (_ BitVec 32))

(declare-fun lt!637659 () SeekEntryResult!11779)

(declare-fun lt!637662 () (_ BitVec 64))

(assert (=> b!1454644 (= e!818616 (not (= lt!637659 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637663 lt!637662 lt!637660 mask!2687))))))

(declare-fun e!818614 () Bool)

(declare-fun b!1454645 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98478 (_ BitVec 32)) SeekEntryResult!11779)

(assert (=> b!1454645 (= e!818614 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637662 lt!637660 mask!2687) (seekEntryOrOpen!0 lt!637662 lt!637660 mask!2687)))))

(declare-fun b!1454646 () Bool)

(assert (=> b!1454646 (= e!818615 (and (or (= (select (arr!47527 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47527 a!2862) intermediateBeforeIndex!19) (select (arr!47527 a!2862) j!93))) (let ((bdg!53077 (select (store (arr!47527 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47527 a!2862) index!646) bdg!53077) (= (select (arr!47527 a!2862) index!646) (select (arr!47527 a!2862) j!93))) (= (select (arr!47527 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53077 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1454647 () Bool)

(declare-fun res!985459 () Bool)

(assert (=> b!1454647 (=> (not res!985459) (not e!818618))))

(assert (=> b!1454647 (= res!985459 (validKeyInArray!0 (select (arr!47527 a!2862) i!1006)))))

(declare-fun b!1454648 () Bool)

(declare-fun res!985455 () Bool)

(assert (=> b!1454648 (=> (not res!985455) (not e!818618))))

(declare-datatypes ((List!34028 0))(
  ( (Nil!34025) (Cons!34024 (h!35374 (_ BitVec 64)) (t!48722 List!34028)) )
))
(declare-fun arrayNoDuplicates!0 (array!98478 (_ BitVec 32) List!34028) Bool)

(assert (=> b!1454648 (= res!985455 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34025))))

(declare-fun b!1454649 () Bool)

(assert (=> b!1454649 (= e!818613 e!818612)))

(declare-fun res!985452 () Bool)

(assert (=> b!1454649 (=> (not res!985452) (not e!818612))))

(assert (=> b!1454649 (= res!985452 (= lt!637659 (Intermediate!11779 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454649 (= lt!637659 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637662 mask!2687) lt!637662 lt!637660 mask!2687))))

(assert (=> b!1454649 (= lt!637662 (select (store (arr!47527 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1454650 () Bool)

(assert (=> b!1454650 (= e!818619 e!818613)))

(declare-fun res!985460 () Bool)

(assert (=> b!1454650 (=> (not res!985460) (not e!818613))))

(assert (=> b!1454650 (= res!985460 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47527 a!2862) j!93) mask!2687) (select (arr!47527 a!2862) j!93) a!2862 mask!2687) lt!637664))))

(assert (=> b!1454650 (= lt!637664 (Intermediate!11779 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454651 () Bool)

(assert (=> b!1454651 (= e!818614 (= lt!637659 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637662 lt!637660 mask!2687)))))

(declare-fun res!985447 () Bool)

(assert (=> start!125030 (=> (not res!985447) (not e!818618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125030 (= res!985447 (validMask!0 mask!2687))))

(assert (=> start!125030 e!818618))

(assert (=> start!125030 true))

(declare-fun array_inv!36555 (array!98478) Bool)

(assert (=> start!125030 (array_inv!36555 a!2862)))

(declare-fun b!1454640 () Bool)

(declare-fun e!818617 () Bool)

(assert (=> b!1454640 (= e!818612 (not e!818617))))

(declare-fun res!985458 () Bool)

(assert (=> b!1454640 (=> res!985458 e!818617)))

(assert (=> b!1454640 (= res!985458 (or (and (= (select (arr!47527 a!2862) index!646) (select (store (arr!47527 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47527 a!2862) index!646) (select (arr!47527 a!2862) j!93))) (= (select (arr!47527 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1454640 e!818615))

(declare-fun res!985446 () Bool)

(assert (=> b!1454640 (=> (not res!985446) (not e!818615))))

(assert (=> b!1454640 (= res!985446 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49054 0))(
  ( (Unit!49055) )
))
(declare-fun lt!637661 () Unit!49054)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98478 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49054)

(assert (=> b!1454640 (= lt!637661 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454652 () Bool)

(declare-fun res!985456 () Bool)

(assert (=> b!1454652 (=> res!985456 e!818620)))

(assert (=> b!1454652 (= res!985456 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637663 (select (arr!47527 a!2862) j!93) a!2862 mask!2687) lt!637664)))))

(declare-fun b!1454653 () Bool)

(declare-fun lt!637665 () SeekEntryResult!11779)

(assert (=> b!1454653 (= e!818616 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637663 intermediateAfterIndex!19 lt!637662 lt!637660 mask!2687) lt!637665)))))

(declare-fun b!1454654 () Bool)

(declare-fun res!985451 () Bool)

(assert (=> b!1454654 (=> (not res!985451) (not e!818612))))

(assert (=> b!1454654 (= res!985451 e!818614)))

(declare-fun c!134106 () Bool)

(assert (=> b!1454654 (= c!134106 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454655 () Bool)

(assert (=> b!1454655 (= e!818617 e!818620)))

(declare-fun res!985453 () Bool)

(assert (=> b!1454655 (=> res!985453 e!818620)))

(assert (=> b!1454655 (= res!985453 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637663 #b00000000000000000000000000000000) (bvsge lt!637663 (size!48077 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454655 (= lt!637663 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1454655 (= lt!637665 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637662 lt!637660 mask!2687))))

(assert (=> b!1454655 (= lt!637665 (seekEntryOrOpen!0 lt!637662 lt!637660 mask!2687))))

(assert (= (and start!125030 res!985447) b!1454639))

(assert (= (and b!1454639 res!985461) b!1454647))

(assert (= (and b!1454647 res!985459) b!1454634))

(assert (= (and b!1454634 res!985448) b!1454637))

(assert (= (and b!1454637 res!985457) b!1454648))

(assert (= (and b!1454648 res!985455) b!1454638))

(assert (= (and b!1454638 res!985462) b!1454642))

(assert (= (and b!1454642 res!985450) b!1454650))

(assert (= (and b!1454650 res!985460) b!1454643))

(assert (= (and b!1454643 res!985445) b!1454649))

(assert (= (and b!1454649 res!985452) b!1454654))

(assert (= (and b!1454654 c!134106) b!1454651))

(assert (= (and b!1454654 (not c!134106)) b!1454645))

(assert (= (and b!1454654 res!985451) b!1454641))

(assert (= (and b!1454641 res!985449) b!1454640))

(assert (= (and b!1454640 res!985446) b!1454635))

(assert (= (and b!1454635 res!985454) b!1454646))

(assert (= (and b!1454640 (not res!985458)) b!1454655))

(assert (= (and b!1454655 (not res!985453)) b!1454652))

(assert (= (and b!1454652 (not res!985456)) b!1454636))

(assert (= (and b!1454636 c!134105) b!1454644))

(assert (= (and b!1454636 (not c!134105)) b!1454653))

(declare-fun m!1342953 () Bool)

(assert (=> b!1454646 m!1342953))

(declare-fun m!1342955 () Bool)

(assert (=> b!1454646 m!1342955))

(declare-fun m!1342957 () Bool)

(assert (=> b!1454646 m!1342957))

(declare-fun m!1342959 () Bool)

(assert (=> b!1454646 m!1342959))

(declare-fun m!1342961 () Bool)

(assert (=> b!1454646 m!1342961))

(declare-fun m!1342963 () Bool)

(assert (=> b!1454651 m!1342963))

(declare-fun m!1342965 () Bool)

(assert (=> start!125030 m!1342965))

(declare-fun m!1342967 () Bool)

(assert (=> start!125030 m!1342967))

(declare-fun m!1342969 () Bool)

(assert (=> b!1454647 m!1342969))

(assert (=> b!1454647 m!1342969))

(declare-fun m!1342971 () Bool)

(assert (=> b!1454647 m!1342971))

(declare-fun m!1342973 () Bool)

(assert (=> b!1454640 m!1342973))

(assert (=> b!1454640 m!1342953))

(assert (=> b!1454640 m!1342957))

(assert (=> b!1454640 m!1342959))

(declare-fun m!1342975 () Bool)

(assert (=> b!1454640 m!1342975))

(assert (=> b!1454640 m!1342961))

(assert (=> b!1454650 m!1342961))

(assert (=> b!1454650 m!1342961))

(declare-fun m!1342977 () Bool)

(assert (=> b!1454650 m!1342977))

(assert (=> b!1454650 m!1342977))

(assert (=> b!1454650 m!1342961))

(declare-fun m!1342979 () Bool)

(assert (=> b!1454650 m!1342979))

(assert (=> b!1454635 m!1342961))

(assert (=> b!1454635 m!1342961))

(declare-fun m!1342981 () Bool)

(assert (=> b!1454635 m!1342981))

(declare-fun m!1342983 () Bool)

(assert (=> b!1454645 m!1342983))

(declare-fun m!1342985 () Bool)

(assert (=> b!1454645 m!1342985))

(assert (=> b!1454634 m!1342961))

(assert (=> b!1454634 m!1342961))

(declare-fun m!1342987 () Bool)

(assert (=> b!1454634 m!1342987))

(assert (=> b!1454642 m!1342953))

(declare-fun m!1342989 () Bool)

(assert (=> b!1454642 m!1342989))

(declare-fun m!1342991 () Bool)

(assert (=> b!1454649 m!1342991))

(assert (=> b!1454649 m!1342991))

(declare-fun m!1342993 () Bool)

(assert (=> b!1454649 m!1342993))

(assert (=> b!1454649 m!1342953))

(declare-fun m!1342995 () Bool)

(assert (=> b!1454649 m!1342995))

(declare-fun m!1342997 () Bool)

(assert (=> b!1454653 m!1342997))

(declare-fun m!1342999 () Bool)

(assert (=> b!1454644 m!1342999))

(assert (=> b!1454643 m!1342961))

(assert (=> b!1454643 m!1342961))

(declare-fun m!1343001 () Bool)

(assert (=> b!1454643 m!1343001))

(assert (=> b!1454652 m!1342961))

(assert (=> b!1454652 m!1342961))

(declare-fun m!1343003 () Bool)

(assert (=> b!1454652 m!1343003))

(declare-fun m!1343005 () Bool)

(assert (=> b!1454655 m!1343005))

(assert (=> b!1454655 m!1342983))

(assert (=> b!1454655 m!1342985))

(declare-fun m!1343007 () Bool)

(assert (=> b!1454648 m!1343007))

(declare-fun m!1343009 () Bool)

(assert (=> b!1454637 m!1343009))

(push 1)

