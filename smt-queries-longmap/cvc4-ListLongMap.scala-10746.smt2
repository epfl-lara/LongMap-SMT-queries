; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125678 () Bool)

(assert start!125678)

(declare-fun b!1470636 () Bool)

(declare-fun res!998753 () Bool)

(declare-fun e!825527 () Bool)

(assert (=> b!1470636 (=> (not res!998753) (not e!825527))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99069 0))(
  ( (array!99070 (arr!47821 (Array (_ BitVec 32) (_ BitVec 64))) (size!48371 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99069)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1470636 (= res!998753 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48371 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48371 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48371 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1470637 () Bool)

(declare-fun res!998748 () Bool)

(declare-fun e!825530 () Bool)

(assert (=> b!1470637 (=> (not res!998748) (not e!825530))))

(declare-fun e!825532 () Bool)

(assert (=> b!1470637 (= res!998748 e!825532)))

(declare-fun c!135459 () Bool)

(assert (=> b!1470637 (= c!135459 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1470638 () Bool)

(declare-fun e!825531 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12061 0))(
  ( (MissingZero!12061 (index!50636 (_ BitVec 32))) (Found!12061 (index!50637 (_ BitVec 32))) (Intermediate!12061 (undefined!12873 Bool) (index!50638 (_ BitVec 32)) (x!132215 (_ BitVec 32))) (Undefined!12061) (MissingVacant!12061 (index!50639 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99069 (_ BitVec 32)) SeekEntryResult!12061)

(assert (=> b!1470638 (= e!825531 (= (seekEntryOrOpen!0 (select (arr!47821 a!2862) j!93) a!2862 mask!2687) (Found!12061 j!93)))))

(declare-fun b!1470639 () Bool)

(declare-fun res!998747 () Bool)

(assert (=> b!1470639 (=> (not res!998747) (not e!825527))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1470639 (= res!998747 (and (= (size!48371 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48371 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48371 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470640 () Bool)

(declare-fun res!998754 () Bool)

(assert (=> b!1470640 (=> (not res!998754) (not e!825527))))

(declare-datatypes ((List!34322 0))(
  ( (Nil!34319) (Cons!34318 (h!35671 (_ BitVec 64)) (t!49016 List!34322)) )
))
(declare-fun arrayNoDuplicates!0 (array!99069 (_ BitVec 32) List!34322) Bool)

(assert (=> b!1470640 (= res!998754 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34319))))

(declare-fun b!1470642 () Bool)

(declare-fun e!825528 () Bool)

(assert (=> b!1470642 (= e!825527 e!825528)))

(declare-fun res!998749 () Bool)

(assert (=> b!1470642 (=> (not res!998749) (not e!825528))))

(assert (=> b!1470642 (= res!998749 (= (select (store (arr!47821 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!642989 () array!99069)

(assert (=> b!1470642 (= lt!642989 (array!99070 (store (arr!47821 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48371 a!2862)))))

(declare-fun b!1470643 () Bool)

(declare-fun res!998742 () Bool)

(declare-fun e!825529 () Bool)

(assert (=> b!1470643 (=> (not res!998742) (not e!825529))))

(declare-fun lt!642986 () SeekEntryResult!12061)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99069 (_ BitVec 32)) SeekEntryResult!12061)

(assert (=> b!1470643 (= res!998742 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47821 a!2862) j!93) a!2862 mask!2687) lt!642986))))

(declare-fun b!1470644 () Bool)

(declare-fun res!998746 () Bool)

(assert (=> b!1470644 (=> (not res!998746) (not e!825527))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99069 (_ BitVec 32)) Bool)

(assert (=> b!1470644 (= res!998746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470645 () Bool)

(assert (=> b!1470645 (= e!825528 e!825529)))

(declare-fun res!998743 () Bool)

(assert (=> b!1470645 (=> (not res!998743) (not e!825529))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470645 (= res!998743 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47821 a!2862) j!93) mask!2687) (select (arr!47821 a!2862) j!93) a!2862 mask!2687) lt!642986))))

(assert (=> b!1470645 (= lt!642986 (Intermediate!12061 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470646 () Bool)

(declare-fun res!998745 () Bool)

(assert (=> b!1470646 (=> (not res!998745) (not e!825527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470646 (= res!998745 (validKeyInArray!0 (select (arr!47821 a!2862) j!93)))))

(declare-fun lt!642990 () (_ BitVec 64))

(declare-fun lt!642987 () SeekEntryResult!12061)

(declare-fun b!1470647 () Bool)

(assert (=> b!1470647 (= e!825532 (= lt!642987 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642990 lt!642989 mask!2687)))))

(declare-fun res!998750 () Bool)

(assert (=> start!125678 (=> (not res!998750) (not e!825527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125678 (= res!998750 (validMask!0 mask!2687))))

(assert (=> start!125678 e!825527))

(assert (=> start!125678 true))

(declare-fun array_inv!36849 (array!99069) Bool)

(assert (=> start!125678 (array_inv!36849 a!2862)))

(declare-fun b!1470641 () Bool)

(assert (=> b!1470641 (= e!825530 (not true))))

(assert (=> b!1470641 e!825531))

(declare-fun res!998755 () Bool)

(assert (=> b!1470641 (=> (not res!998755) (not e!825531))))

(assert (=> b!1470641 (= res!998755 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49462 0))(
  ( (Unit!49463) )
))
(declare-fun lt!642988 () Unit!49462)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99069 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49462)

(assert (=> b!1470641 (= lt!642988 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1470648 () Bool)

(declare-fun res!998744 () Bool)

(assert (=> b!1470648 (=> (not res!998744) (not e!825527))))

(assert (=> b!1470648 (= res!998744 (validKeyInArray!0 (select (arr!47821 a!2862) i!1006)))))

(declare-fun b!1470649 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99069 (_ BitVec 32)) SeekEntryResult!12061)

(assert (=> b!1470649 (= e!825532 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642990 lt!642989 mask!2687) (seekEntryOrOpen!0 lt!642990 lt!642989 mask!2687)))))

(declare-fun b!1470650 () Bool)

(declare-fun res!998751 () Bool)

(assert (=> b!1470650 (=> (not res!998751) (not e!825530))))

(assert (=> b!1470650 (= res!998751 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1470651 () Bool)

(assert (=> b!1470651 (= e!825529 e!825530)))

(declare-fun res!998752 () Bool)

(assert (=> b!1470651 (=> (not res!998752) (not e!825530))))

(assert (=> b!1470651 (= res!998752 (= lt!642987 (Intermediate!12061 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1470651 (= lt!642987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642990 mask!2687) lt!642990 lt!642989 mask!2687))))

(assert (=> b!1470651 (= lt!642990 (select (store (arr!47821 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125678 res!998750) b!1470639))

(assert (= (and b!1470639 res!998747) b!1470648))

(assert (= (and b!1470648 res!998744) b!1470646))

(assert (= (and b!1470646 res!998745) b!1470644))

(assert (= (and b!1470644 res!998746) b!1470640))

(assert (= (and b!1470640 res!998754) b!1470636))

(assert (= (and b!1470636 res!998753) b!1470642))

(assert (= (and b!1470642 res!998749) b!1470645))

(assert (= (and b!1470645 res!998743) b!1470643))

(assert (= (and b!1470643 res!998742) b!1470651))

(assert (= (and b!1470651 res!998752) b!1470637))

(assert (= (and b!1470637 c!135459) b!1470647))

(assert (= (and b!1470637 (not c!135459)) b!1470649))

(assert (= (and b!1470637 res!998748) b!1470650))

(assert (= (and b!1470650 res!998751) b!1470641))

(assert (= (and b!1470641 res!998755) b!1470638))

(declare-fun m!1357619 () Bool)

(assert (=> b!1470651 m!1357619))

(assert (=> b!1470651 m!1357619))

(declare-fun m!1357621 () Bool)

(assert (=> b!1470651 m!1357621))

(declare-fun m!1357623 () Bool)

(assert (=> b!1470651 m!1357623))

(declare-fun m!1357625 () Bool)

(assert (=> b!1470651 m!1357625))

(declare-fun m!1357627 () Bool)

(assert (=> b!1470643 m!1357627))

(assert (=> b!1470643 m!1357627))

(declare-fun m!1357629 () Bool)

(assert (=> b!1470643 m!1357629))

(declare-fun m!1357631 () Bool)

(assert (=> b!1470640 m!1357631))

(declare-fun m!1357633 () Bool)

(assert (=> b!1470641 m!1357633))

(declare-fun m!1357635 () Bool)

(assert (=> b!1470641 m!1357635))

(assert (=> b!1470646 m!1357627))

(assert (=> b!1470646 m!1357627))

(declare-fun m!1357637 () Bool)

(assert (=> b!1470646 m!1357637))

(declare-fun m!1357639 () Bool)

(assert (=> b!1470644 m!1357639))

(declare-fun m!1357641 () Bool)

(assert (=> b!1470649 m!1357641))

(declare-fun m!1357643 () Bool)

(assert (=> b!1470649 m!1357643))

(declare-fun m!1357645 () Bool)

(assert (=> b!1470647 m!1357645))

(declare-fun m!1357647 () Bool)

(assert (=> start!125678 m!1357647))

(declare-fun m!1357649 () Bool)

(assert (=> start!125678 m!1357649))

(declare-fun m!1357651 () Bool)

(assert (=> b!1470648 m!1357651))

(assert (=> b!1470648 m!1357651))

(declare-fun m!1357653 () Bool)

(assert (=> b!1470648 m!1357653))

(assert (=> b!1470645 m!1357627))

(assert (=> b!1470645 m!1357627))

(declare-fun m!1357655 () Bool)

(assert (=> b!1470645 m!1357655))

(assert (=> b!1470645 m!1357655))

(assert (=> b!1470645 m!1357627))

(declare-fun m!1357657 () Bool)

(assert (=> b!1470645 m!1357657))

(assert (=> b!1470642 m!1357623))

(declare-fun m!1357659 () Bool)

(assert (=> b!1470642 m!1357659))

(assert (=> b!1470638 m!1357627))

(assert (=> b!1470638 m!1357627))

(declare-fun m!1357661 () Bool)

(assert (=> b!1470638 m!1357661))

(push 1)

(assert (not b!1470648))

