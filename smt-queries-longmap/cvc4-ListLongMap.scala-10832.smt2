; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126842 () Bool)

(assert start!126842)

(declare-fun b!1489398 () Bool)

(declare-fun res!1012851 () Bool)

(declare-fun e!834755 () Bool)

(assert (=> b!1489398 (=> res!1012851 e!834755)))

(declare-fun e!834752 () Bool)

(assert (=> b!1489398 (= res!1012851 e!834752)))

(declare-fun c!137802 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1489398 (= c!137802 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1489400 () Bool)

(declare-fun res!1012862 () Bool)

(assert (=> b!1489400 (=> res!1012862 e!834755)))

(declare-datatypes ((SeekEntryResult!12319 0))(
  ( (MissingZero!12319 (index!51668 (_ BitVec 32))) (Found!12319 (index!51669 (_ BitVec 32))) (Intermediate!12319 (undefined!13131 Bool) (index!51670 (_ BitVec 32)) (x!133263 (_ BitVec 32))) (Undefined!12319) (MissingVacant!12319 (index!51671 (_ BitVec 32))) )
))
(declare-fun lt!649541 () SeekEntryResult!12319)

(declare-datatypes ((array!99615 0))(
  ( (array!99616 (arr!48079 (Array (_ BitVec 32) (_ BitVec 64))) (size!48629 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99615)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!649538 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99615 (_ BitVec 32)) SeekEntryResult!12319)

(assert (=> b!1489400 (= res!1012862 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649538 (select (arr!48079 a!2862) j!93) a!2862 mask!2687) lt!649541)))))

(declare-fun b!1489401 () Bool)

(declare-fun res!1012866 () Bool)

(declare-fun e!834751 () Bool)

(assert (=> b!1489401 (=> (not res!1012866) (not e!834751))))

(declare-datatypes ((List!34580 0))(
  ( (Nil!34577) (Cons!34576 (h!35959 (_ BitVec 64)) (t!49274 List!34580)) )
))
(declare-fun arrayNoDuplicates!0 (array!99615 (_ BitVec 32) List!34580) Bool)

(assert (=> b!1489401 (= res!1012866 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34577))))

(declare-fun b!1489402 () Bool)

(declare-fun res!1012853 () Bool)

(assert (=> b!1489402 (=> (not res!1012853) (not e!834751))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1489402 (= res!1012853 (and (= (size!48629 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48629 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48629 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489403 () Bool)

(declare-fun res!1012859 () Bool)

(declare-fun e!834747 () Bool)

(assert (=> b!1489403 (=> (not res!1012859) (not e!834747))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1489403 (= res!1012859 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!649542 () array!99615)

(declare-fun lt!649539 () (_ BitVec 64))

(declare-fun b!1489404 () Bool)

(declare-fun e!834753 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99615 (_ BitVec 32)) SeekEntryResult!12319)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99615 (_ BitVec 32)) SeekEntryResult!12319)

(assert (=> b!1489404 (= e!834753 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649539 lt!649542 mask!2687) (seekEntryOrOpen!0 lt!649539 lt!649542 mask!2687)))))

(declare-fun b!1489405 () Bool)

(declare-fun res!1012854 () Bool)

(assert (=> b!1489405 (=> (not res!1012854) (not e!834751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99615 (_ BitVec 32)) Bool)

(assert (=> b!1489405 (= res!1012854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489406 () Bool)

(declare-fun res!1012855 () Bool)

(declare-fun e!834750 () Bool)

(assert (=> b!1489406 (=> (not res!1012855) (not e!834750))))

(assert (=> b!1489406 (= res!1012855 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48079 a!2862) j!93) a!2862 mask!2687) lt!649541))))

(declare-fun b!1489407 () Bool)

(declare-fun res!1012861 () Bool)

(assert (=> b!1489407 (=> res!1012861 e!834755)))

(assert (=> b!1489407 (= res!1012861 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1489408 () Bool)

(assert (=> b!1489408 (= e!834755 true)))

(declare-fun lt!649534 () SeekEntryResult!12319)

(declare-fun lt!649535 () SeekEntryResult!12319)

(assert (=> b!1489408 (= lt!649534 lt!649535)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49978 0))(
  ( (Unit!49979) )
))
(declare-fun lt!649537 () Unit!49978)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49978)

(assert (=> b!1489408 (= lt!649537 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649538 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun lt!649536 () SeekEntryResult!12319)

(declare-fun b!1489409 () Bool)

(assert (=> b!1489409 (= e!834753 (= lt!649536 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649539 lt!649542 mask!2687)))))

(declare-fun res!1012864 () Bool)

(assert (=> start!126842 (=> (not res!1012864) (not e!834751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126842 (= res!1012864 (validMask!0 mask!2687))))

(assert (=> start!126842 e!834751))

(assert (=> start!126842 true))

(declare-fun array_inv!37107 (array!99615) Bool)

(assert (=> start!126842 (array_inv!37107 a!2862)))

(declare-fun b!1489399 () Bool)

(declare-fun e!834748 () Bool)

(assert (=> b!1489399 (= e!834748 e!834755)))

(declare-fun res!1012860 () Bool)

(assert (=> b!1489399 (=> res!1012860 e!834755)))

(assert (=> b!1489399 (= res!1012860 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649538 #b00000000000000000000000000000000) (bvsge lt!649538 (size!48629 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489399 (= lt!649538 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1489399 (= lt!649535 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649539 lt!649542 mask!2687))))

(assert (=> b!1489399 (= lt!649535 (seekEntryOrOpen!0 lt!649539 lt!649542 mask!2687))))

(declare-fun b!1489410 () Bool)

(declare-fun e!834749 () Bool)

(assert (=> b!1489410 (= e!834751 e!834749)))

(declare-fun res!1012852 () Bool)

(assert (=> b!1489410 (=> (not res!1012852) (not e!834749))))

(assert (=> b!1489410 (= res!1012852 (= (select (store (arr!48079 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489410 (= lt!649542 (array!99616 (store (arr!48079 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48629 a!2862)))))

(declare-fun b!1489411 () Bool)

(declare-fun res!1012850 () Bool)

(assert (=> b!1489411 (=> (not res!1012850) (not e!834747))))

(assert (=> b!1489411 (= res!1012850 e!834753)))

(declare-fun c!137801 () Bool)

(assert (=> b!1489411 (= c!137801 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489412 () Bool)

(assert (=> b!1489412 (= e!834750 e!834747)))

(declare-fun res!1012856 () Bool)

(assert (=> b!1489412 (=> (not res!1012856) (not e!834747))))

(assert (=> b!1489412 (= res!1012856 (= lt!649536 (Intermediate!12319 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489412 (= lt!649536 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649539 mask!2687) lt!649539 lt!649542 mask!2687))))

(assert (=> b!1489412 (= lt!649539 (select (store (arr!48079 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1489413 () Bool)

(declare-fun res!1012857 () Bool)

(assert (=> b!1489413 (=> (not res!1012857) (not e!834751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489413 (= res!1012857 (validKeyInArray!0 (select (arr!48079 a!2862) j!93)))))

(declare-fun b!1489414 () Bool)

(assert (=> b!1489414 (= e!834752 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649538 intermediateAfterIndex!19 lt!649539 lt!649542 mask!2687) lt!649535)))))

(declare-fun b!1489415 () Bool)

(declare-fun res!1012863 () Bool)

(assert (=> b!1489415 (=> (not res!1012863) (not e!834751))))

(assert (=> b!1489415 (= res!1012863 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48629 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48629 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48629 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1489416 () Bool)

(assert (=> b!1489416 (= e!834749 e!834750)))

(declare-fun res!1012865 () Bool)

(assert (=> b!1489416 (=> (not res!1012865) (not e!834750))))

(assert (=> b!1489416 (= res!1012865 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48079 a!2862) j!93) mask!2687) (select (arr!48079 a!2862) j!93) a!2862 mask!2687) lt!649541))))

(assert (=> b!1489416 (= lt!649541 (Intermediate!12319 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489417 () Bool)

(assert (=> b!1489417 (= e!834752 (not (= lt!649536 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649538 lt!649539 lt!649542 mask!2687))))))

(declare-fun b!1489418 () Bool)

(declare-fun res!1012858 () Bool)

(assert (=> b!1489418 (=> (not res!1012858) (not e!834751))))

(assert (=> b!1489418 (= res!1012858 (validKeyInArray!0 (select (arr!48079 a!2862) i!1006)))))

(declare-fun b!1489419 () Bool)

(assert (=> b!1489419 (= e!834747 (not e!834748))))

(declare-fun res!1012867 () Bool)

(assert (=> b!1489419 (=> res!1012867 e!834748)))

(assert (=> b!1489419 (= res!1012867 (or (and (= (select (arr!48079 a!2862) index!646) (select (store (arr!48079 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48079 a!2862) index!646) (select (arr!48079 a!2862) j!93))) (= (select (arr!48079 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1489419 (and (= lt!649534 (Found!12319 j!93)) (or (= (select (arr!48079 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48079 a!2862) intermediateBeforeIndex!19) (select (arr!48079 a!2862) j!93))) (let ((bdg!54710 (select (store (arr!48079 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48079 a!2862) index!646) bdg!54710) (= (select (arr!48079 a!2862) index!646) (select (arr!48079 a!2862) j!93))) (= (select (arr!48079 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54710 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1489419 (= lt!649534 (seekEntryOrOpen!0 (select (arr!48079 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1489419 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!649540 () Unit!49978)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49978)

(assert (=> b!1489419 (= lt!649540 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126842 res!1012864) b!1489402))

(assert (= (and b!1489402 res!1012853) b!1489418))

(assert (= (and b!1489418 res!1012858) b!1489413))

(assert (= (and b!1489413 res!1012857) b!1489405))

(assert (= (and b!1489405 res!1012854) b!1489401))

(assert (= (and b!1489401 res!1012866) b!1489415))

(assert (= (and b!1489415 res!1012863) b!1489410))

(assert (= (and b!1489410 res!1012852) b!1489416))

(assert (= (and b!1489416 res!1012865) b!1489406))

(assert (= (and b!1489406 res!1012855) b!1489412))

(assert (= (and b!1489412 res!1012856) b!1489411))

(assert (= (and b!1489411 c!137801) b!1489409))

(assert (= (and b!1489411 (not c!137801)) b!1489404))

(assert (= (and b!1489411 res!1012850) b!1489403))

(assert (= (and b!1489403 res!1012859) b!1489419))

(assert (= (and b!1489419 (not res!1012867)) b!1489399))

(assert (= (and b!1489399 (not res!1012860)) b!1489400))

(assert (= (and b!1489400 (not res!1012862)) b!1489398))

(assert (= (and b!1489398 c!137802) b!1489417))

(assert (= (and b!1489398 (not c!137802)) b!1489414))

(assert (= (and b!1489398 (not res!1012851)) b!1489407))

(assert (= (and b!1489407 (not res!1012861)) b!1489408))

(declare-fun m!1373635 () Bool)

(assert (=> b!1489409 m!1373635))

(declare-fun m!1373637 () Bool)

(assert (=> b!1489399 m!1373637))

(declare-fun m!1373639 () Bool)

(assert (=> b!1489399 m!1373639))

(declare-fun m!1373641 () Bool)

(assert (=> b!1489399 m!1373641))

(declare-fun m!1373643 () Bool)

(assert (=> b!1489412 m!1373643))

(assert (=> b!1489412 m!1373643))

(declare-fun m!1373645 () Bool)

(assert (=> b!1489412 m!1373645))

(declare-fun m!1373647 () Bool)

(assert (=> b!1489412 m!1373647))

(declare-fun m!1373649 () Bool)

(assert (=> b!1489412 m!1373649))

(declare-fun m!1373651 () Bool)

(assert (=> b!1489417 m!1373651))

(assert (=> b!1489410 m!1373647))

(declare-fun m!1373653 () Bool)

(assert (=> b!1489410 m!1373653))

(declare-fun m!1373655 () Bool)

(assert (=> b!1489413 m!1373655))

(assert (=> b!1489413 m!1373655))

(declare-fun m!1373657 () Bool)

(assert (=> b!1489413 m!1373657))

(declare-fun m!1373659 () Bool)

(assert (=> b!1489418 m!1373659))

(assert (=> b!1489418 m!1373659))

(declare-fun m!1373661 () Bool)

(assert (=> b!1489418 m!1373661))

(declare-fun m!1373663 () Bool)

(assert (=> b!1489408 m!1373663))

(declare-fun m!1373665 () Bool)

(assert (=> b!1489414 m!1373665))

(declare-fun m!1373667 () Bool)

(assert (=> start!126842 m!1373667))

(declare-fun m!1373669 () Bool)

(assert (=> start!126842 m!1373669))

(assert (=> b!1489416 m!1373655))

(assert (=> b!1489416 m!1373655))

(declare-fun m!1373671 () Bool)

(assert (=> b!1489416 m!1373671))

(assert (=> b!1489416 m!1373671))

(assert (=> b!1489416 m!1373655))

(declare-fun m!1373673 () Bool)

(assert (=> b!1489416 m!1373673))

(declare-fun m!1373675 () Bool)

(assert (=> b!1489419 m!1373675))

(assert (=> b!1489419 m!1373647))

(declare-fun m!1373677 () Bool)

(assert (=> b!1489419 m!1373677))

(declare-fun m!1373679 () Bool)

(assert (=> b!1489419 m!1373679))

(declare-fun m!1373681 () Bool)

(assert (=> b!1489419 m!1373681))

(assert (=> b!1489419 m!1373655))

(declare-fun m!1373683 () Bool)

(assert (=> b!1489419 m!1373683))

(declare-fun m!1373685 () Bool)

(assert (=> b!1489419 m!1373685))

(assert (=> b!1489419 m!1373655))

(assert (=> b!1489400 m!1373655))

(assert (=> b!1489400 m!1373655))

(declare-fun m!1373687 () Bool)

(assert (=> b!1489400 m!1373687))

(declare-fun m!1373689 () Bool)

(assert (=> b!1489401 m!1373689))

(assert (=> b!1489404 m!1373639))

(assert (=> b!1489404 m!1373641))

(assert (=> b!1489406 m!1373655))

(assert (=> b!1489406 m!1373655))

(declare-fun m!1373691 () Bool)

(assert (=> b!1489406 m!1373691))

(declare-fun m!1373693 () Bool)

(assert (=> b!1489405 m!1373693))

(push 1)

