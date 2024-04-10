; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124546 () Bool)

(assert start!124546)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!633230 () (_ BitVec 64))

(declare-datatypes ((array!97994 0))(
  ( (array!97995 (arr!47285 (Array (_ BitVec 32) (_ BitVec 64))) (size!47835 (_ BitVec 32))) )
))
(declare-fun lt!633231 () array!97994)

(declare-fun b!1441416 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!812564 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11537 0))(
  ( (MissingZero!11537 (index!48540 (_ BitVec 32))) (Found!11537 (index!48541 (_ BitVec 32))) (Intermediate!11537 (undefined!12349 Bool) (index!48542 (_ BitVec 32)) (x!130258 (_ BitVec 32))) (Undefined!11537) (MissingVacant!11537 (index!48543 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97994 (_ BitVec 32)) SeekEntryResult!11537)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97994 (_ BitVec 32)) SeekEntryResult!11537)

(assert (=> b!1441416 (= e!812564 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633230 lt!633231 mask!2687) (seekEntryOrOpen!0 lt!633230 lt!633231 mask!2687))))))

(declare-fun b!1441417 () Bool)

(declare-fun res!973775 () Bool)

(declare-fun e!812560 () Bool)

(assert (=> b!1441417 (=> (not res!973775) (not e!812560))))

(declare-fun a!2862 () array!97994)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97994 (_ BitVec 32)) Bool)

(assert (=> b!1441417 (= res!973775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!633234 () SeekEntryResult!11537)

(declare-fun b!1441418 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97994 (_ BitVec 32)) SeekEntryResult!11537)

(assert (=> b!1441418 (= e!812564 (not (= lt!633234 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633230 lt!633231 mask!2687))))))

(declare-fun res!973774 () Bool)

(assert (=> start!124546 (=> (not res!973774) (not e!812560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124546 (= res!973774 (validMask!0 mask!2687))))

(assert (=> start!124546 e!812560))

(assert (=> start!124546 true))

(declare-fun array_inv!36313 (array!97994) Bool)

(assert (=> start!124546 (array_inv!36313 a!2862)))

(declare-fun b!1441419 () Bool)

(declare-fun e!812559 () Bool)

(assert (=> b!1441419 (= e!812559 false)))

(declare-fun lt!633232 () Bool)

(assert (=> b!1441419 (= lt!633232 e!812564)))

(declare-fun c!133335 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1441419 (= c!133335 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441420 () Bool)

(declare-fun res!973769 () Bool)

(assert (=> b!1441420 (=> (not res!973769) (not e!812560))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441420 (= res!973769 (validKeyInArray!0 (select (arr!47285 a!2862) i!1006)))))

(declare-fun b!1441421 () Bool)

(declare-fun e!812562 () Bool)

(assert (=> b!1441421 (= e!812560 e!812562)))

(declare-fun res!973777 () Bool)

(assert (=> b!1441421 (=> (not res!973777) (not e!812562))))

(assert (=> b!1441421 (= res!973777 (= (select (store (arr!47285 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441421 (= lt!633231 (array!97995 (store (arr!47285 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47835 a!2862)))))

(declare-fun b!1441422 () Bool)

(declare-fun res!973767 () Bool)

(assert (=> b!1441422 (=> (not res!973767) (not e!812560))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1441422 (= res!973767 (and (= (size!47835 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47835 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47835 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441423 () Bool)

(declare-fun res!973773 () Bool)

(declare-fun e!812561 () Bool)

(assert (=> b!1441423 (=> (not res!973773) (not e!812561))))

(declare-fun lt!633233 () SeekEntryResult!11537)

(assert (=> b!1441423 (= res!973773 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47285 a!2862) j!93) a!2862 mask!2687) lt!633233))))

(declare-fun b!1441424 () Bool)

(assert (=> b!1441424 (= e!812561 e!812559)))

(declare-fun res!973771 () Bool)

(assert (=> b!1441424 (=> (not res!973771) (not e!812559))))

(assert (=> b!1441424 (= res!973771 (= lt!633234 (Intermediate!11537 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441424 (= lt!633234 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633230 mask!2687) lt!633230 lt!633231 mask!2687))))

(assert (=> b!1441424 (= lt!633230 (select (store (arr!47285 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441425 () Bool)

(declare-fun res!973770 () Bool)

(assert (=> b!1441425 (=> (not res!973770) (not e!812560))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441425 (= res!973770 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47835 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47835 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47835 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441426 () Bool)

(assert (=> b!1441426 (= e!812562 e!812561)))

(declare-fun res!973776 () Bool)

(assert (=> b!1441426 (=> (not res!973776) (not e!812561))))

(assert (=> b!1441426 (= res!973776 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47285 a!2862) j!93) mask!2687) (select (arr!47285 a!2862) j!93) a!2862 mask!2687) lt!633233))))

(assert (=> b!1441426 (= lt!633233 (Intermediate!11537 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441427 () Bool)

(declare-fun res!973768 () Bool)

(assert (=> b!1441427 (=> (not res!973768) (not e!812560))))

(assert (=> b!1441427 (= res!973768 (validKeyInArray!0 (select (arr!47285 a!2862) j!93)))))

(declare-fun b!1441428 () Bool)

(declare-fun res!973772 () Bool)

(assert (=> b!1441428 (=> (not res!973772) (not e!812560))))

(declare-datatypes ((List!33786 0))(
  ( (Nil!33783) (Cons!33782 (h!35132 (_ BitVec 64)) (t!48480 List!33786)) )
))
(declare-fun arrayNoDuplicates!0 (array!97994 (_ BitVec 32) List!33786) Bool)

(assert (=> b!1441428 (= res!973772 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33783))))

(assert (= (and start!124546 res!973774) b!1441422))

(assert (= (and b!1441422 res!973767) b!1441420))

(assert (= (and b!1441420 res!973769) b!1441427))

(assert (= (and b!1441427 res!973768) b!1441417))

(assert (= (and b!1441417 res!973775) b!1441428))

(assert (= (and b!1441428 res!973772) b!1441425))

(assert (= (and b!1441425 res!973770) b!1441421))

(assert (= (and b!1441421 res!973777) b!1441426))

(assert (= (and b!1441426 res!973776) b!1441423))

(assert (= (and b!1441423 res!973773) b!1441424))

(assert (= (and b!1441424 res!973771) b!1441419))

(assert (= (and b!1441419 c!133335) b!1441418))

(assert (= (and b!1441419 (not c!133335)) b!1441416))

(declare-fun m!1330639 () Bool)

(assert (=> b!1441421 m!1330639))

(declare-fun m!1330641 () Bool)

(assert (=> b!1441421 m!1330641))

(declare-fun m!1330643 () Bool)

(assert (=> b!1441426 m!1330643))

(assert (=> b!1441426 m!1330643))

(declare-fun m!1330645 () Bool)

(assert (=> b!1441426 m!1330645))

(assert (=> b!1441426 m!1330645))

(assert (=> b!1441426 m!1330643))

(declare-fun m!1330647 () Bool)

(assert (=> b!1441426 m!1330647))

(assert (=> b!1441427 m!1330643))

(assert (=> b!1441427 m!1330643))

(declare-fun m!1330649 () Bool)

(assert (=> b!1441427 m!1330649))

(declare-fun m!1330651 () Bool)

(assert (=> b!1441416 m!1330651))

(declare-fun m!1330653 () Bool)

(assert (=> b!1441416 m!1330653))

(assert (=> b!1441423 m!1330643))

(assert (=> b!1441423 m!1330643))

(declare-fun m!1330655 () Bool)

(assert (=> b!1441423 m!1330655))

(declare-fun m!1330657 () Bool)

(assert (=> start!124546 m!1330657))

(declare-fun m!1330659 () Bool)

(assert (=> start!124546 m!1330659))

(declare-fun m!1330661 () Bool)

(assert (=> b!1441428 m!1330661))

(declare-fun m!1330663 () Bool)

(assert (=> b!1441417 m!1330663))

(declare-fun m!1330665 () Bool)

(assert (=> b!1441424 m!1330665))

(assert (=> b!1441424 m!1330665))

(declare-fun m!1330667 () Bool)

(assert (=> b!1441424 m!1330667))

(assert (=> b!1441424 m!1330639))

(declare-fun m!1330669 () Bool)

(assert (=> b!1441424 m!1330669))

(declare-fun m!1330671 () Bool)

(assert (=> b!1441420 m!1330671))

(assert (=> b!1441420 m!1330671))

(declare-fun m!1330673 () Bool)

(assert (=> b!1441420 m!1330673))

(declare-fun m!1330675 () Bool)

(assert (=> b!1441418 m!1330675))

(push 1)

