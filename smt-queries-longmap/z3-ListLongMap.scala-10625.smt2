; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124858 () Bool)

(assert start!124858)

(declare-fun b!1450388 () Bool)

(declare-fun e!816707 () Bool)

(declare-fun e!816703 () Bool)

(assert (=> b!1450388 (= e!816707 (not e!816703))))

(declare-fun res!981836 () Bool)

(assert (=> b!1450388 (=> res!981836 e!816703)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98284 0))(
  ( (array!98285 (arr!47431 (Array (_ BitVec 32) (_ BitVec 64))) (size!47983 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98284)

(assert (=> b!1450388 (= res!981836 (or (and (= (select (arr!47431 a!2862) index!646) (select (store (arr!47431 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47431 a!2862) index!646) (select (arr!47431 a!2862) j!93))) (not (= (select (arr!47431 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47431 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816701 () Bool)

(assert (=> b!1450388 e!816701))

(declare-fun res!981840 () Bool)

(assert (=> b!1450388 (=> (not res!981840) (not e!816701))))

(declare-datatypes ((SeekEntryResult!11708 0))(
  ( (MissingZero!11708 (index!49224 (_ BitVec 32))) (Found!11708 (index!49225 (_ BitVec 32))) (Intermediate!11708 (undefined!12520 Bool) (index!49226 (_ BitVec 32)) (x!130880 (_ BitVec 32))) (Undefined!11708) (MissingVacant!11708 (index!49227 (_ BitVec 32))) )
))
(declare-fun lt!636119 () SeekEntryResult!11708)

(declare-fun lt!636116 () SeekEntryResult!11708)

(assert (=> b!1450388 (= res!981840 (and (= lt!636119 lt!636116) (or (= (select (arr!47431 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47431 a!2862) intermediateBeforeIndex!19) (select (arr!47431 a!2862) j!93)))))))

(assert (=> b!1450388 (= lt!636116 (Found!11708 j!93))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98284 (_ BitVec 32)) SeekEntryResult!11708)

(assert (=> b!1450388 (= lt!636119 (seekEntryOrOpen!0 (select (arr!47431 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98284 (_ BitVec 32)) Bool)

(assert (=> b!1450388 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48753 0))(
  ( (Unit!48754) )
))
(declare-fun lt!636123 () Unit!48753)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98284 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48753)

(assert (=> b!1450388 (= lt!636123 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450390 () Bool)

(declare-fun e!816704 () Bool)

(declare-fun e!816699 () Bool)

(assert (=> b!1450390 (= e!816704 e!816699)))

(declare-fun res!981831 () Bool)

(assert (=> b!1450390 (=> (not res!981831) (not e!816699))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1450390 (= res!981831 (= (select (store (arr!47431 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636117 () array!98284)

(assert (=> b!1450390 (= lt!636117 (array!98285 (store (arr!47431 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47983 a!2862)))))

(declare-fun b!1450391 () Bool)

(declare-fun res!981830 () Bool)

(assert (=> b!1450391 (=> (not res!981830) (not e!816704))))

(assert (=> b!1450391 (= res!981830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!636122 () (_ BitVec 64))

(declare-fun e!816708 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1450392 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98284 (_ BitVec 32)) SeekEntryResult!11708)

(assert (=> b!1450392 (= e!816708 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636122 lt!636117 mask!2687) (seekEntryOrOpen!0 lt!636122 lt!636117 mask!2687)))))

(declare-fun b!1450393 () Bool)

(declare-fun e!816706 () Bool)

(assert (=> b!1450393 (= e!816701 e!816706)))

(declare-fun res!981846 () Bool)

(assert (=> b!1450393 (=> res!981846 e!816706)))

(assert (=> b!1450393 (= res!981846 (or (and (= (select (arr!47431 a!2862) index!646) (select (store (arr!47431 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47431 a!2862) index!646) (select (arr!47431 a!2862) j!93))) (not (= (select (arr!47431 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1450394 () Bool)

(declare-fun res!981834 () Bool)

(assert (=> b!1450394 (=> (not res!981834) (not e!816704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450394 (= res!981834 (validKeyInArray!0 (select (arr!47431 a!2862) j!93)))))

(declare-fun b!1450395 () Bool)

(declare-fun e!816700 () Bool)

(assert (=> b!1450395 (= e!816706 e!816700)))

(declare-fun res!981838 () Bool)

(assert (=> b!1450395 (=> (not res!981838) (not e!816700))))

(assert (=> b!1450395 (= res!981838 (= lt!636119 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47431 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450396 () Bool)

(declare-fun res!981845 () Bool)

(assert (=> b!1450396 (=> (not res!981845) (not e!816704))))

(declare-datatypes ((List!34010 0))(
  ( (Nil!34007) (Cons!34006 (h!35356 (_ BitVec 64)) (t!48696 List!34010)) )
))
(declare-fun arrayNoDuplicates!0 (array!98284 (_ BitVec 32) List!34010) Bool)

(assert (=> b!1450396 (= res!981845 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34007))))

(declare-fun b!1450397 () Bool)

(declare-fun e!816702 () Bool)

(assert (=> b!1450397 (= e!816702 e!816707)))

(declare-fun res!981844 () Bool)

(assert (=> b!1450397 (=> (not res!981844) (not e!816707))))

(declare-fun lt!636120 () SeekEntryResult!11708)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1450397 (= res!981844 (= lt!636120 (Intermediate!11708 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98284 (_ BitVec 32)) SeekEntryResult!11708)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450397 (= lt!636120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636122 mask!2687) lt!636122 lt!636117 mask!2687))))

(assert (=> b!1450397 (= lt!636122 (select (store (arr!47431 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450398 () Bool)

(declare-fun res!981833 () Bool)

(assert (=> b!1450398 (=> (not res!981833) (not e!816704))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1450398 (= res!981833 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47983 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47983 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47983 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450399 () Bool)

(assert (=> b!1450399 (= e!816703 (bvsge mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1450399 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636122 lt!636117 mask!2687) lt!636116)))

(declare-fun lt!636118 () Unit!48753)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98284 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48753)

(assert (=> b!1450399 (= lt!636118 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1450400 () Bool)

(declare-fun res!981839 () Bool)

(assert (=> b!1450400 (=> (not res!981839) (not e!816704))))

(assert (=> b!1450400 (= res!981839 (and (= (size!47983 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47983 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47983 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450401 () Bool)

(assert (=> b!1450401 (= e!816699 e!816702)))

(declare-fun res!981843 () Bool)

(assert (=> b!1450401 (=> (not res!981843) (not e!816702))))

(declare-fun lt!636121 () SeekEntryResult!11708)

(assert (=> b!1450401 (= res!981843 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47431 a!2862) j!93) mask!2687) (select (arr!47431 a!2862) j!93) a!2862 mask!2687) lt!636121))))

(assert (=> b!1450401 (= lt!636121 (Intermediate!11708 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450402 () Bool)

(assert (=> b!1450402 (= e!816700 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun res!981832 () Bool)

(assert (=> start!124858 (=> (not res!981832) (not e!816704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124858 (= res!981832 (validMask!0 mask!2687))))

(assert (=> start!124858 e!816704))

(assert (=> start!124858 true))

(declare-fun array_inv!36664 (array!98284) Bool)

(assert (=> start!124858 (array_inv!36664 a!2862)))

(declare-fun b!1450389 () Bool)

(declare-fun res!981835 () Bool)

(assert (=> b!1450389 (=> (not res!981835) (not e!816707))))

(assert (=> b!1450389 (= res!981835 e!816708)))

(declare-fun c!133792 () Bool)

(assert (=> b!1450389 (= c!133792 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450403 () Bool)

(assert (=> b!1450403 (= e!816708 (= lt!636120 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636122 lt!636117 mask!2687)))))

(declare-fun b!1450404 () Bool)

(declare-fun res!981841 () Bool)

(assert (=> b!1450404 (=> (not res!981841) (not e!816704))))

(assert (=> b!1450404 (= res!981841 (validKeyInArray!0 (select (arr!47431 a!2862) i!1006)))))

(declare-fun b!1450405 () Bool)

(declare-fun res!981847 () Bool)

(assert (=> b!1450405 (=> res!981847 e!816703)))

(assert (=> b!1450405 (= res!981847 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47431 a!2862) j!93) a!2862 mask!2687) lt!636116)))))

(declare-fun b!1450406 () Bool)

(declare-fun res!981837 () Bool)

(assert (=> b!1450406 (=> (not res!981837) (not e!816707))))

(assert (=> b!1450406 (= res!981837 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450407 () Bool)

(declare-fun res!981842 () Bool)

(assert (=> b!1450407 (=> (not res!981842) (not e!816702))))

(assert (=> b!1450407 (= res!981842 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47431 a!2862) j!93) a!2862 mask!2687) lt!636121))))

(assert (= (and start!124858 res!981832) b!1450400))

(assert (= (and b!1450400 res!981839) b!1450404))

(assert (= (and b!1450404 res!981841) b!1450394))

(assert (= (and b!1450394 res!981834) b!1450391))

(assert (= (and b!1450391 res!981830) b!1450396))

(assert (= (and b!1450396 res!981845) b!1450398))

(assert (= (and b!1450398 res!981833) b!1450390))

(assert (= (and b!1450390 res!981831) b!1450401))

(assert (= (and b!1450401 res!981843) b!1450407))

(assert (= (and b!1450407 res!981842) b!1450397))

(assert (= (and b!1450397 res!981844) b!1450389))

(assert (= (and b!1450389 c!133792) b!1450403))

(assert (= (and b!1450389 (not c!133792)) b!1450392))

(assert (= (and b!1450389 res!981835) b!1450406))

(assert (= (and b!1450406 res!981837) b!1450388))

(assert (= (and b!1450388 res!981840) b!1450393))

(assert (= (and b!1450393 (not res!981846)) b!1450395))

(assert (= (and b!1450395 res!981838) b!1450402))

(assert (= (and b!1450388 (not res!981836)) b!1450405))

(assert (= (and b!1450405 (not res!981847)) b!1450399))

(declare-fun m!1338543 () Bool)

(assert (=> b!1450405 m!1338543))

(assert (=> b!1450405 m!1338543))

(declare-fun m!1338545 () Bool)

(assert (=> b!1450405 m!1338545))

(declare-fun m!1338547 () Bool)

(assert (=> b!1450403 m!1338547))

(declare-fun m!1338549 () Bool)

(assert (=> b!1450399 m!1338549))

(declare-fun m!1338551 () Bool)

(assert (=> b!1450399 m!1338551))

(assert (=> b!1450395 m!1338543))

(assert (=> b!1450395 m!1338543))

(declare-fun m!1338553 () Bool)

(assert (=> b!1450395 m!1338553))

(assert (=> b!1450392 m!1338549))

(declare-fun m!1338555 () Bool)

(assert (=> b!1450392 m!1338555))

(declare-fun m!1338557 () Bool)

(assert (=> start!124858 m!1338557))

(declare-fun m!1338559 () Bool)

(assert (=> start!124858 m!1338559))

(declare-fun m!1338561 () Bool)

(assert (=> b!1450404 m!1338561))

(assert (=> b!1450404 m!1338561))

(declare-fun m!1338563 () Bool)

(assert (=> b!1450404 m!1338563))

(declare-fun m!1338565 () Bool)

(assert (=> b!1450388 m!1338565))

(declare-fun m!1338567 () Bool)

(assert (=> b!1450388 m!1338567))

(declare-fun m!1338569 () Bool)

(assert (=> b!1450388 m!1338569))

(declare-fun m!1338571 () Bool)

(assert (=> b!1450388 m!1338571))

(declare-fun m!1338573 () Bool)

(assert (=> b!1450388 m!1338573))

(assert (=> b!1450388 m!1338543))

(declare-fun m!1338575 () Bool)

(assert (=> b!1450388 m!1338575))

(declare-fun m!1338577 () Bool)

(assert (=> b!1450388 m!1338577))

(assert (=> b!1450388 m!1338543))

(declare-fun m!1338579 () Bool)

(assert (=> b!1450397 m!1338579))

(assert (=> b!1450397 m!1338579))

(declare-fun m!1338581 () Bool)

(assert (=> b!1450397 m!1338581))

(assert (=> b!1450397 m!1338567))

(declare-fun m!1338583 () Bool)

(assert (=> b!1450397 m!1338583))

(assert (=> b!1450394 m!1338543))

(assert (=> b!1450394 m!1338543))

(declare-fun m!1338585 () Bool)

(assert (=> b!1450394 m!1338585))

(declare-fun m!1338587 () Bool)

(assert (=> b!1450391 m!1338587))

(declare-fun m!1338589 () Bool)

(assert (=> b!1450396 m!1338589))

(assert (=> b!1450393 m!1338573))

(assert (=> b!1450393 m!1338567))

(assert (=> b!1450393 m!1338571))

(assert (=> b!1450393 m!1338543))

(assert (=> b!1450390 m!1338567))

(declare-fun m!1338591 () Bool)

(assert (=> b!1450390 m!1338591))

(assert (=> b!1450401 m!1338543))

(assert (=> b!1450401 m!1338543))

(declare-fun m!1338593 () Bool)

(assert (=> b!1450401 m!1338593))

(assert (=> b!1450401 m!1338593))

(assert (=> b!1450401 m!1338543))

(declare-fun m!1338595 () Bool)

(assert (=> b!1450401 m!1338595))

(assert (=> b!1450407 m!1338543))

(assert (=> b!1450407 m!1338543))

(declare-fun m!1338597 () Bool)

(assert (=> b!1450407 m!1338597))

(check-sat (not b!1450395) (not b!1450404) (not b!1450396) (not b!1450399) (not b!1450401) (not b!1450403) (not b!1450392) (not b!1450391) (not b!1450405) (not b!1450394) (not b!1450397) (not b!1450388) (not start!124858) (not b!1450407))
(check-sat)
