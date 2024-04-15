; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127292 () Bool)

(assert start!127292)

(declare-fun b!1495950 () Bool)

(declare-fun res!1017515 () Bool)

(declare-fun e!837879 () Bool)

(assert (=> b!1495950 (=> (not res!1017515) (not e!837879))))

(declare-datatypes ((array!99748 0))(
  ( (array!99749 (arr!48139 (Array (_ BitVec 32) (_ BitVec 64))) (size!48691 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99748)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1495950 (= res!1017515 (validKeyInArray!0 (select (arr!48139 a!2862) j!93)))))

(declare-fun lt!651768 () array!99748)

(declare-datatypes ((SeekEntryResult!12404 0))(
  ( (MissingZero!12404 (index!52008 (_ BitVec 32))) (Found!12404 (index!52009 (_ BitVec 32))) (Intermediate!12404 (undefined!13216 Bool) (index!52010 (_ BitVec 32)) (x!133633 (_ BitVec 32))) (Undefined!12404) (MissingVacant!12404 (index!52011 (_ BitVec 32))) )
))
(declare-fun lt!651767 () SeekEntryResult!12404)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!837878 () Bool)

(declare-fun b!1495951 () Bool)

(declare-fun lt!651769 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99748 (_ BitVec 32)) SeekEntryResult!12404)

(assert (=> b!1495951 (= e!837878 (= lt!651767 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651769 lt!651768 mask!2687)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!837872 () Bool)

(declare-fun b!1495952 () Bool)

(assert (=> b!1495952 (= e!837872 (or (= (select (arr!48139 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48139 a!2862) intermediateBeforeIndex!19) (select (arr!48139 a!2862) j!93))))))

(declare-fun b!1495953 () Bool)

(declare-fun res!1017519 () Bool)

(assert (=> b!1495953 (=> (not res!1017519) (not e!837879))))

(declare-datatypes ((List!34718 0))(
  ( (Nil!34715) (Cons!34714 (h!36112 (_ BitVec 64)) (t!49404 List!34718)) )
))
(declare-fun arrayNoDuplicates!0 (array!99748 (_ BitVec 32) List!34718) Bool)

(assert (=> b!1495953 (= res!1017519 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34715))))

(declare-fun b!1495954 () Bool)

(declare-fun res!1017526 () Bool)

(assert (=> b!1495954 (=> (not res!1017526) (not e!837879))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99748 (_ BitVec 32)) Bool)

(assert (=> b!1495954 (= res!1017526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1495955 () Bool)

(declare-fun res!1017512 () Bool)

(declare-fun e!837874 () Bool)

(assert (=> b!1495955 (=> (not res!1017512) (not e!837874))))

(assert (=> b!1495955 (= res!1017512 e!837878)))

(declare-fun c!138757 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1495955 (= c!138757 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1495956 () Bool)

(declare-fun res!1017520 () Bool)

(assert (=> b!1495956 (=> (not res!1017520) (not e!837879))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1495956 (= res!1017520 (and (= (size!48691 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48691 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48691 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1017513 () Bool)

(assert (=> start!127292 (=> (not res!1017513) (not e!837879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127292 (= res!1017513 (validMask!0 mask!2687))))

(assert (=> start!127292 e!837879))

(assert (=> start!127292 true))

(declare-fun array_inv!37372 (array!99748) Bool)

(assert (=> start!127292 (array_inv!37372 a!2862)))

(declare-fun b!1495957 () Bool)

(declare-fun e!837875 () Bool)

(assert (=> b!1495957 (= e!837875 true)))

(declare-fun lt!651764 () Bool)

(declare-fun e!837877 () Bool)

(assert (=> b!1495957 (= lt!651764 e!837877)))

(declare-fun c!138756 () Bool)

(assert (=> b!1495957 (= c!138756 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1495958 () Bool)

(declare-fun e!837881 () Bool)

(assert (=> b!1495958 (= e!837879 e!837881)))

(declare-fun res!1017518 () Bool)

(assert (=> b!1495958 (=> (not res!1017518) (not e!837881))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1495958 (= res!1017518 (= (select (store (arr!48139 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495958 (= lt!651768 (array!99749 (store (arr!48139 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48691 a!2862)))))

(declare-fun b!1495959 () Bool)

(declare-fun e!837880 () Bool)

(assert (=> b!1495959 (= e!837880 e!837875)))

(declare-fun res!1017517 () Bool)

(assert (=> b!1495959 (=> res!1017517 e!837875)))

(declare-fun lt!651766 () (_ BitVec 32))

(assert (=> b!1495959 (= res!1017517 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651766 #b00000000000000000000000000000000) (bvsge lt!651766 (size!48691 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495959 (= lt!651766 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1495960 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99748 (_ BitVec 32)) SeekEntryResult!12404)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99748 (_ BitVec 32)) SeekEntryResult!12404)

(assert (=> b!1495960 (= e!837877 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651766 intermediateAfterIndex!19 lt!651769 lt!651768 mask!2687) (seekEntryOrOpen!0 lt!651769 lt!651768 mask!2687))))))

(declare-fun b!1495961 () Bool)

(declare-fun res!1017514 () Bool)

(assert (=> b!1495961 (=> (not res!1017514) (not e!837872))))

(assert (=> b!1495961 (= res!1017514 (= (seekEntryOrOpen!0 (select (arr!48139 a!2862) j!93) a!2862 mask!2687) (Found!12404 j!93)))))

(declare-fun b!1495962 () Bool)

(declare-fun e!837873 () Bool)

(assert (=> b!1495962 (= e!837873 e!837874)))

(declare-fun res!1017516 () Bool)

(assert (=> b!1495962 (=> (not res!1017516) (not e!837874))))

(assert (=> b!1495962 (= res!1017516 (= lt!651767 (Intermediate!12404 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495962 (= lt!651767 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651769 mask!2687) lt!651769 lt!651768 mask!2687))))

(assert (=> b!1495962 (= lt!651769 (select (store (arr!48139 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1495963 () Bool)

(assert (=> b!1495963 (= e!837878 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651769 lt!651768 mask!2687) (seekEntryOrOpen!0 lt!651769 lt!651768 mask!2687)))))

(declare-fun b!1495964 () Bool)

(declare-fun res!1017524 () Bool)

(assert (=> b!1495964 (=> (not res!1017524) (not e!837874))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1495964 (= res!1017524 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1495965 () Bool)

(declare-fun res!1017525 () Bool)

(assert (=> b!1495965 (=> (not res!1017525) (not e!837879))))

(assert (=> b!1495965 (= res!1017525 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48691 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48691 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48691 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1495966 () Bool)

(assert (=> b!1495966 (= e!837881 e!837873)))

(declare-fun res!1017522 () Bool)

(assert (=> b!1495966 (=> (not res!1017522) (not e!837873))))

(declare-fun lt!651765 () SeekEntryResult!12404)

(assert (=> b!1495966 (= res!1017522 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48139 a!2862) j!93) mask!2687) (select (arr!48139 a!2862) j!93) a!2862 mask!2687) lt!651765))))

(assert (=> b!1495966 (= lt!651765 (Intermediate!12404 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1495967 () Bool)

(assert (=> b!1495967 (= e!837877 (not (= lt!651767 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651766 lt!651769 lt!651768 mask!2687))))))

(declare-fun b!1495968 () Bool)

(declare-fun res!1017529 () Bool)

(assert (=> b!1495968 (=> res!1017529 e!837875)))

(assert (=> b!1495968 (= res!1017529 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651766 (select (arr!48139 a!2862) j!93) a!2862 mask!2687) lt!651765)))))

(declare-fun b!1495969 () Bool)

(declare-fun res!1017528 () Bool)

(assert (=> b!1495969 (=> (not res!1017528) (not e!837873))))

(assert (=> b!1495969 (= res!1017528 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48139 a!2862) j!93) a!2862 mask!2687) lt!651765))))

(declare-fun b!1495970 () Bool)

(assert (=> b!1495970 (= e!837874 (not e!837880))))

(declare-fun res!1017523 () Bool)

(assert (=> b!1495970 (=> res!1017523 e!837880)))

(assert (=> b!1495970 (= res!1017523 (or (and (= (select (arr!48139 a!2862) index!646) (select (store (arr!48139 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48139 a!2862) index!646) (select (arr!48139 a!2862) j!93))) (= (select (arr!48139 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1495970 e!837872))

(declare-fun res!1017527 () Bool)

(assert (=> b!1495970 (=> (not res!1017527) (not e!837872))))

(assert (=> b!1495970 (= res!1017527 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49989 0))(
  ( (Unit!49990) )
))
(declare-fun lt!651770 () Unit!49989)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99748 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49989)

(assert (=> b!1495970 (= lt!651770 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1495971 () Bool)

(declare-fun res!1017521 () Bool)

(assert (=> b!1495971 (=> (not res!1017521) (not e!837879))))

(assert (=> b!1495971 (= res!1017521 (validKeyInArray!0 (select (arr!48139 a!2862) i!1006)))))

(assert (= (and start!127292 res!1017513) b!1495956))

(assert (= (and b!1495956 res!1017520) b!1495971))

(assert (= (and b!1495971 res!1017521) b!1495950))

(assert (= (and b!1495950 res!1017515) b!1495954))

(assert (= (and b!1495954 res!1017526) b!1495953))

(assert (= (and b!1495953 res!1017519) b!1495965))

(assert (= (and b!1495965 res!1017525) b!1495958))

(assert (= (and b!1495958 res!1017518) b!1495966))

(assert (= (and b!1495966 res!1017522) b!1495969))

(assert (= (and b!1495969 res!1017528) b!1495962))

(assert (= (and b!1495962 res!1017516) b!1495955))

(assert (= (and b!1495955 c!138757) b!1495951))

(assert (= (and b!1495955 (not c!138757)) b!1495963))

(assert (= (and b!1495955 res!1017512) b!1495964))

(assert (= (and b!1495964 res!1017524) b!1495970))

(assert (= (and b!1495970 res!1017527) b!1495961))

(assert (= (and b!1495961 res!1017514) b!1495952))

(assert (= (and b!1495970 (not res!1017523)) b!1495959))

(assert (= (and b!1495959 (not res!1017517)) b!1495968))

(assert (= (and b!1495968 (not res!1017529)) b!1495957))

(assert (= (and b!1495957 c!138756) b!1495967))

(assert (= (and b!1495957 (not c!138756)) b!1495960))

(declare-fun m!1378617 () Bool)

(assert (=> b!1495963 m!1378617))

(declare-fun m!1378619 () Bool)

(assert (=> b!1495963 m!1378619))

(declare-fun m!1378621 () Bool)

(assert (=> b!1495960 m!1378621))

(assert (=> b!1495960 m!1378619))

(declare-fun m!1378623 () Bool)

(assert (=> b!1495961 m!1378623))

(assert (=> b!1495961 m!1378623))

(declare-fun m!1378625 () Bool)

(assert (=> b!1495961 m!1378625))

(assert (=> b!1495968 m!1378623))

(assert (=> b!1495968 m!1378623))

(declare-fun m!1378627 () Bool)

(assert (=> b!1495968 m!1378627))

(declare-fun m!1378629 () Bool)

(assert (=> b!1495958 m!1378629))

(declare-fun m!1378631 () Bool)

(assert (=> b!1495958 m!1378631))

(assert (=> b!1495950 m!1378623))

(assert (=> b!1495950 m!1378623))

(declare-fun m!1378633 () Bool)

(assert (=> b!1495950 m!1378633))

(declare-fun m!1378635 () Bool)

(assert (=> b!1495952 m!1378635))

(assert (=> b!1495952 m!1378623))

(declare-fun m!1378637 () Bool)

(assert (=> b!1495962 m!1378637))

(assert (=> b!1495962 m!1378637))

(declare-fun m!1378639 () Bool)

(assert (=> b!1495962 m!1378639))

(assert (=> b!1495962 m!1378629))

(declare-fun m!1378641 () Bool)

(assert (=> b!1495962 m!1378641))

(declare-fun m!1378643 () Bool)

(assert (=> b!1495954 m!1378643))

(declare-fun m!1378645 () Bool)

(assert (=> b!1495971 m!1378645))

(assert (=> b!1495971 m!1378645))

(declare-fun m!1378647 () Bool)

(assert (=> b!1495971 m!1378647))

(declare-fun m!1378649 () Bool)

(assert (=> b!1495970 m!1378649))

(assert (=> b!1495970 m!1378629))

(declare-fun m!1378651 () Bool)

(assert (=> b!1495970 m!1378651))

(declare-fun m!1378653 () Bool)

(assert (=> b!1495970 m!1378653))

(declare-fun m!1378655 () Bool)

(assert (=> b!1495970 m!1378655))

(assert (=> b!1495970 m!1378623))

(declare-fun m!1378657 () Bool)

(assert (=> b!1495951 m!1378657))

(declare-fun m!1378659 () Bool)

(assert (=> b!1495953 m!1378659))

(declare-fun m!1378661 () Bool)

(assert (=> b!1495959 m!1378661))

(assert (=> b!1495966 m!1378623))

(assert (=> b!1495966 m!1378623))

(declare-fun m!1378663 () Bool)

(assert (=> b!1495966 m!1378663))

(assert (=> b!1495966 m!1378663))

(assert (=> b!1495966 m!1378623))

(declare-fun m!1378665 () Bool)

(assert (=> b!1495966 m!1378665))

(declare-fun m!1378667 () Bool)

(assert (=> b!1495967 m!1378667))

(declare-fun m!1378669 () Bool)

(assert (=> start!127292 m!1378669))

(declare-fun m!1378671 () Bool)

(assert (=> start!127292 m!1378671))

(assert (=> b!1495969 m!1378623))

(assert (=> b!1495969 m!1378623))

(declare-fun m!1378673 () Bool)

(assert (=> b!1495969 m!1378673))

(check-sat (not b!1495963) (not b!1495970) (not b!1495953) (not b!1495967) (not b!1495968) (not b!1495960) (not b!1495966) (not b!1495951) (not b!1495959) (not start!127292) (not b!1495969) (not b!1495954) (not b!1495961) (not b!1495962) (not b!1495950) (not b!1495971))
(check-sat)
