; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124914 () Bool)

(assert start!124914)

(declare-fun b!1446531 () Bool)

(declare-fun res!977613 () Bool)

(declare-fun e!814987 () Bool)

(assert (=> b!1446531 (=> (not res!977613) (not e!814987))))

(declare-fun e!814985 () Bool)

(assert (=> b!1446531 (= res!977613 e!814985)))

(declare-fun c!133981 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1446531 (= c!133981 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446532 () Bool)

(declare-fun res!977621 () Bool)

(assert (=> b!1446532 (=> (not res!977621) (not e!814987))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1446532 (= res!977621 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446533 () Bool)

(declare-fun res!977608 () Bool)

(declare-fun e!814988 () Bool)

(assert (=> b!1446533 (=> (not res!977608) (not e!814988))))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98257 0))(
  ( (array!98258 (arr!47413 (Array (_ BitVec 32) (_ BitVec 64))) (size!47964 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98257)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11562 0))(
  ( (MissingZero!11562 (index!48640 (_ BitVec 32))) (Found!11562 (index!48641 (_ BitVec 32))) (Intermediate!11562 (undefined!12374 Bool) (index!48642 (_ BitVec 32)) (x!130507 (_ BitVec 32))) (Undefined!11562) (MissingVacant!11562 (index!48643 (_ BitVec 32))) )
))
(declare-fun lt!634905 () SeekEntryResult!11562)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98257 (_ BitVec 32)) SeekEntryResult!11562)

(assert (=> b!1446533 (= res!977608 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47413 a!2862) j!93) a!2862 mask!2687) lt!634905))))

(declare-fun b!1446534 () Bool)

(declare-fun res!977619 () Bool)

(declare-fun e!814984 () Bool)

(assert (=> b!1446534 (=> (not res!977619) (not e!814984))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98257 (_ BitVec 32)) SeekEntryResult!11562)

(assert (=> b!1446534 (= res!977619 (= (seekEntryOrOpen!0 (select (arr!47413 a!2862) j!93) a!2862 mask!2687) (Found!11562 j!93)))))

(declare-fun b!1446535 () Bool)

(assert (=> b!1446535 (= e!814988 e!814987)))

(declare-fun res!977611 () Bool)

(assert (=> b!1446535 (=> (not res!977611) (not e!814987))))

(declare-fun lt!634908 () SeekEntryResult!11562)

(assert (=> b!1446535 (= res!977611 (= lt!634908 (Intermediate!11562 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634906 () array!98257)

(declare-fun lt!634909 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446535 (= lt!634908 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634909 mask!2687) lt!634909 lt!634906 mask!2687))))

(assert (=> b!1446535 (= lt!634909 (select (store (arr!47413 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1446536 () Bool)

(assert (=> b!1446536 (= e!814984 (or (= (select (arr!47413 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47413 a!2862) intermediateBeforeIndex!19) (select (arr!47413 a!2862) j!93))))))

(declare-fun b!1446537 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98257 (_ BitVec 32)) SeekEntryResult!11562)

(assert (=> b!1446537 (= e!814985 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634909 lt!634906 mask!2687) (seekEntryOrOpen!0 lt!634909 lt!634906 mask!2687)))))

(declare-fun b!1446538 () Bool)

(declare-fun res!977609 () Bool)

(declare-fun e!814989 () Bool)

(assert (=> b!1446538 (=> (not res!977609) (not e!814989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98257 (_ BitVec 32)) Bool)

(assert (=> b!1446538 (= res!977609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!977607 () Bool)

(assert (=> start!124914 (=> (not res!977607) (not e!814989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124914 (= res!977607 (validMask!0 mask!2687))))

(assert (=> start!124914 e!814989))

(assert (=> start!124914 true))

(declare-fun array_inv!36694 (array!98257) Bool)

(assert (=> start!124914 (array_inv!36694 a!2862)))

(declare-fun b!1446539 () Bool)

(declare-fun res!977612 () Bool)

(assert (=> b!1446539 (=> (not res!977612) (not e!814989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446539 (= res!977612 (validKeyInArray!0 (select (arr!47413 a!2862) j!93)))))

(declare-fun b!1446540 () Bool)

(declare-fun res!977614 () Bool)

(assert (=> b!1446540 (=> (not res!977614) (not e!814989))))

(assert (=> b!1446540 (= res!977614 (validKeyInArray!0 (select (arr!47413 a!2862) i!1006)))))

(declare-fun b!1446541 () Bool)

(assert (=> b!1446541 (= e!814987 (not true))))

(assert (=> b!1446541 e!814984))

(declare-fun res!977620 () Bool)

(assert (=> b!1446541 (=> (not res!977620) (not e!814984))))

(assert (=> b!1446541 (= res!977620 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48653 0))(
  ( (Unit!48654) )
))
(declare-fun lt!634907 () Unit!48653)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48653)

(assert (=> b!1446541 (= lt!634907 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446542 () Bool)

(declare-fun res!977615 () Bool)

(assert (=> b!1446542 (=> (not res!977615) (not e!814989))))

(assert (=> b!1446542 (= res!977615 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47964 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47964 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47964 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446543 () Bool)

(declare-fun e!814986 () Bool)

(assert (=> b!1446543 (= e!814989 e!814986)))

(declare-fun res!977617 () Bool)

(assert (=> b!1446543 (=> (not res!977617) (not e!814986))))

(assert (=> b!1446543 (= res!977617 (= (select (store (arr!47413 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446543 (= lt!634906 (array!98258 (store (arr!47413 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47964 a!2862)))))

(declare-fun b!1446544 () Bool)

(declare-fun res!977616 () Bool)

(assert (=> b!1446544 (=> (not res!977616) (not e!814989))))

(declare-datatypes ((List!33901 0))(
  ( (Nil!33898) (Cons!33897 (h!35258 (_ BitVec 64)) (t!48587 List!33901)) )
))
(declare-fun arrayNoDuplicates!0 (array!98257 (_ BitVec 32) List!33901) Bool)

(assert (=> b!1446544 (= res!977616 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33898))))

(declare-fun b!1446545 () Bool)

(assert (=> b!1446545 (= e!814985 (= lt!634908 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634909 lt!634906 mask!2687)))))

(declare-fun b!1446546 () Bool)

(declare-fun res!977618 () Bool)

(assert (=> b!1446546 (=> (not res!977618) (not e!814989))))

(assert (=> b!1446546 (= res!977618 (and (= (size!47964 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47964 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47964 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446547 () Bool)

(assert (=> b!1446547 (= e!814986 e!814988)))

(declare-fun res!977610 () Bool)

(assert (=> b!1446547 (=> (not res!977610) (not e!814988))))

(assert (=> b!1446547 (= res!977610 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47413 a!2862) j!93) mask!2687) (select (arr!47413 a!2862) j!93) a!2862 mask!2687) lt!634905))))

(assert (=> b!1446547 (= lt!634905 (Intermediate!11562 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124914 res!977607) b!1446546))

(assert (= (and b!1446546 res!977618) b!1446540))

(assert (= (and b!1446540 res!977614) b!1446539))

(assert (= (and b!1446539 res!977612) b!1446538))

(assert (= (and b!1446538 res!977609) b!1446544))

(assert (= (and b!1446544 res!977616) b!1446542))

(assert (= (and b!1446542 res!977615) b!1446543))

(assert (= (and b!1446543 res!977617) b!1446547))

(assert (= (and b!1446547 res!977610) b!1446533))

(assert (= (and b!1446533 res!977608) b!1446535))

(assert (= (and b!1446535 res!977611) b!1446531))

(assert (= (and b!1446531 c!133981) b!1446545))

(assert (= (and b!1446531 (not c!133981)) b!1446537))

(assert (= (and b!1446531 res!977613) b!1446532))

(assert (= (and b!1446532 res!977621) b!1446541))

(assert (= (and b!1446541 res!977620) b!1446534))

(assert (= (and b!1446534 res!977619) b!1446536))

(declare-fun m!1335613 () Bool)

(assert (=> b!1446539 m!1335613))

(assert (=> b!1446539 m!1335613))

(declare-fun m!1335615 () Bool)

(assert (=> b!1446539 m!1335615))

(declare-fun m!1335617 () Bool)

(assert (=> b!1446535 m!1335617))

(assert (=> b!1446535 m!1335617))

(declare-fun m!1335619 () Bool)

(assert (=> b!1446535 m!1335619))

(declare-fun m!1335621 () Bool)

(assert (=> b!1446535 m!1335621))

(declare-fun m!1335623 () Bool)

(assert (=> b!1446535 m!1335623))

(declare-fun m!1335625 () Bool)

(assert (=> b!1446537 m!1335625))

(declare-fun m!1335627 () Bool)

(assert (=> b!1446537 m!1335627))

(assert (=> b!1446547 m!1335613))

(assert (=> b!1446547 m!1335613))

(declare-fun m!1335629 () Bool)

(assert (=> b!1446547 m!1335629))

(assert (=> b!1446547 m!1335629))

(assert (=> b!1446547 m!1335613))

(declare-fun m!1335631 () Bool)

(assert (=> b!1446547 m!1335631))

(declare-fun m!1335633 () Bool)

(assert (=> start!124914 m!1335633))

(declare-fun m!1335635 () Bool)

(assert (=> start!124914 m!1335635))

(declare-fun m!1335637 () Bool)

(assert (=> b!1446540 m!1335637))

(assert (=> b!1446540 m!1335637))

(declare-fun m!1335639 () Bool)

(assert (=> b!1446540 m!1335639))

(assert (=> b!1446534 m!1335613))

(assert (=> b!1446534 m!1335613))

(declare-fun m!1335641 () Bool)

(assert (=> b!1446534 m!1335641))

(declare-fun m!1335643 () Bool)

(assert (=> b!1446544 m!1335643))

(declare-fun m!1335645 () Bool)

(assert (=> b!1446538 m!1335645))

(declare-fun m!1335647 () Bool)

(assert (=> b!1446541 m!1335647))

(declare-fun m!1335649 () Bool)

(assert (=> b!1446541 m!1335649))

(declare-fun m!1335651 () Bool)

(assert (=> b!1446545 m!1335651))

(declare-fun m!1335653 () Bool)

(assert (=> b!1446536 m!1335653))

(assert (=> b!1446536 m!1335613))

(assert (=> b!1446543 m!1335621))

(declare-fun m!1335655 () Bool)

(assert (=> b!1446543 m!1335655))

(assert (=> b!1446533 m!1335613))

(assert (=> b!1446533 m!1335613))

(declare-fun m!1335657 () Bool)

(assert (=> b!1446533 m!1335657))

(check-sat (not b!1446535) (not b!1446541) (not b!1446538) (not start!124914) (not b!1446533) (not b!1446534) (not b!1446544) (not b!1446547) (not b!1446537) (not b!1446540) (not b!1446539) (not b!1446545))
(check-sat)
