; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124590 () Bool)

(assert start!124590)

(declare-fun b!1442439 () Bool)

(declare-fun res!974663 () Bool)

(declare-fun e!812981 () Bool)

(assert (=> b!1442439 (=> (not res!974663) (not e!812981))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11559 0))(
  ( (MissingZero!11559 (index!48628 (_ BitVec 32))) (Found!11559 (index!48629 (_ BitVec 32))) (Intermediate!11559 (undefined!12371 Bool) (index!48630 (_ BitVec 32)) (x!130336 (_ BitVec 32))) (Undefined!11559) (MissingVacant!11559 (index!48631 (_ BitVec 32))) )
))
(declare-fun lt!633560 () SeekEntryResult!11559)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98038 0))(
  ( (array!98039 (arr!47307 (Array (_ BitVec 32) (_ BitVec 64))) (size!47857 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98038)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98038 (_ BitVec 32)) SeekEntryResult!11559)

(assert (=> b!1442439 (= res!974663 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47307 a!2862) j!93) a!2862 mask!2687) lt!633560))))

(declare-fun b!1442440 () Bool)

(declare-fun res!974671 () Bool)

(declare-fun e!812982 () Bool)

(assert (=> b!1442440 (=> (not res!974671) (not e!812982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442440 (= res!974671 (validKeyInArray!0 (select (arr!47307 a!2862) j!93)))))

(declare-fun b!1442441 () Bool)

(declare-fun res!974662 () Bool)

(assert (=> b!1442441 (=> (not res!974662) (not e!812982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98038 (_ BitVec 32)) Bool)

(assert (=> b!1442441 (= res!974662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442442 () Bool)

(declare-fun res!974659 () Bool)

(assert (=> b!1442442 (=> (not res!974659) (not e!812982))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1442442 (= res!974659 (and (= (size!47857 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47857 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47857 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442443 () Bool)

(declare-fun res!974670 () Bool)

(assert (=> b!1442443 (=> (not res!974670) (not e!812982))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1442443 (= res!974670 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47857 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47857 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47857 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442444 () Bool)

(declare-fun res!974657 () Bool)

(assert (=> b!1442444 (=> (not res!974657) (not e!812982))))

(assert (=> b!1442444 (= res!974657 (validKeyInArray!0 (select (arr!47307 a!2862) i!1006)))))

(declare-fun b!1442445 () Bool)

(declare-fun e!812984 () Bool)

(assert (=> b!1442445 (= e!812984 (not true))))

(declare-fun e!812980 () Bool)

(assert (=> b!1442445 e!812980))

(declare-fun res!974661 () Bool)

(assert (=> b!1442445 (=> (not res!974661) (not e!812980))))

(assert (=> b!1442445 (= res!974661 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48614 0))(
  ( (Unit!48615) )
))
(declare-fun lt!633562 () Unit!48614)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98038 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48614)

(assert (=> b!1442445 (= lt!633562 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!633564 () (_ BitVec 64))

(declare-fun e!812983 () Bool)

(declare-fun lt!633561 () array!98038)

(declare-fun b!1442446 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98038 (_ BitVec 32)) SeekEntryResult!11559)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98038 (_ BitVec 32)) SeekEntryResult!11559)

(assert (=> b!1442446 (= e!812983 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633564 lt!633561 mask!2687) (seekEntryOrOpen!0 lt!633564 lt!633561 mask!2687)))))

(declare-fun b!1442447 () Bool)

(declare-fun res!974669 () Bool)

(assert (=> b!1442447 (=> (not res!974669) (not e!812980))))

(assert (=> b!1442447 (= res!974669 (= (seekEntryOrOpen!0 (select (arr!47307 a!2862) j!93) a!2862 mask!2687) (Found!11559 j!93)))))

(declare-fun b!1442448 () Bool)

(declare-fun e!812979 () Bool)

(assert (=> b!1442448 (= e!812979 e!812981)))

(declare-fun res!974658 () Bool)

(assert (=> b!1442448 (=> (not res!974658) (not e!812981))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442448 (= res!974658 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47307 a!2862) j!93) mask!2687) (select (arr!47307 a!2862) j!93) a!2862 mask!2687) lt!633560))))

(assert (=> b!1442448 (= lt!633560 (Intermediate!11559 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442449 () Bool)

(assert (=> b!1442449 (= e!812982 e!812979)))

(declare-fun res!974665 () Bool)

(assert (=> b!1442449 (=> (not res!974665) (not e!812979))))

(assert (=> b!1442449 (= res!974665 (= (select (store (arr!47307 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442449 (= lt!633561 (array!98039 (store (arr!47307 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47857 a!2862)))))

(declare-fun lt!633563 () SeekEntryResult!11559)

(declare-fun b!1442450 () Bool)

(assert (=> b!1442450 (= e!812983 (= lt!633563 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633564 lt!633561 mask!2687)))))

(declare-fun b!1442451 () Bool)

(assert (=> b!1442451 (= e!812980 (or (= (select (arr!47307 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47307 a!2862) intermediateBeforeIndex!19) (select (arr!47307 a!2862) j!93))))))

(declare-fun b!1442452 () Bool)

(declare-fun res!974660 () Bool)

(assert (=> b!1442452 (=> (not res!974660) (not e!812982))))

(declare-datatypes ((List!33808 0))(
  ( (Nil!33805) (Cons!33804 (h!35154 (_ BitVec 64)) (t!48502 List!33808)) )
))
(declare-fun arrayNoDuplicates!0 (array!98038 (_ BitVec 32) List!33808) Bool)

(assert (=> b!1442452 (= res!974660 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33805))))

(declare-fun b!1442453 () Bool)

(declare-fun res!974666 () Bool)

(assert (=> b!1442453 (=> (not res!974666) (not e!812984))))

(assert (=> b!1442453 (= res!974666 e!812983)))

(declare-fun c!133401 () Bool)

(assert (=> b!1442453 (= c!133401 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442454 () Bool)

(declare-fun res!974664 () Bool)

(assert (=> b!1442454 (=> (not res!974664) (not e!812984))))

(assert (=> b!1442454 (= res!974664 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!974668 () Bool)

(assert (=> start!124590 (=> (not res!974668) (not e!812982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124590 (= res!974668 (validMask!0 mask!2687))))

(assert (=> start!124590 e!812982))

(assert (=> start!124590 true))

(declare-fun array_inv!36335 (array!98038) Bool)

(assert (=> start!124590 (array_inv!36335 a!2862)))

(declare-fun b!1442438 () Bool)

(assert (=> b!1442438 (= e!812981 e!812984)))

(declare-fun res!974667 () Bool)

(assert (=> b!1442438 (=> (not res!974667) (not e!812984))))

(assert (=> b!1442438 (= res!974667 (= lt!633563 (Intermediate!11559 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1442438 (= lt!633563 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633564 mask!2687) lt!633564 lt!633561 mask!2687))))

(assert (=> b!1442438 (= lt!633564 (select (store (arr!47307 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!124590 res!974668) b!1442442))

(assert (= (and b!1442442 res!974659) b!1442444))

(assert (= (and b!1442444 res!974657) b!1442440))

(assert (= (and b!1442440 res!974671) b!1442441))

(assert (= (and b!1442441 res!974662) b!1442452))

(assert (= (and b!1442452 res!974660) b!1442443))

(assert (= (and b!1442443 res!974670) b!1442449))

(assert (= (and b!1442449 res!974665) b!1442448))

(assert (= (and b!1442448 res!974658) b!1442439))

(assert (= (and b!1442439 res!974663) b!1442438))

(assert (= (and b!1442438 res!974667) b!1442453))

(assert (= (and b!1442453 c!133401) b!1442450))

(assert (= (and b!1442453 (not c!133401)) b!1442446))

(assert (= (and b!1442453 res!974666) b!1442454))

(assert (= (and b!1442454 res!974664) b!1442445))

(assert (= (and b!1442445 res!974661) b!1442447))

(assert (= (and b!1442447 res!974669) b!1442451))

(declare-fun m!1331591 () Bool)

(assert (=> b!1442441 m!1331591))

(declare-fun m!1331593 () Bool)

(assert (=> b!1442448 m!1331593))

(assert (=> b!1442448 m!1331593))

(declare-fun m!1331595 () Bool)

(assert (=> b!1442448 m!1331595))

(assert (=> b!1442448 m!1331595))

(assert (=> b!1442448 m!1331593))

(declare-fun m!1331597 () Bool)

(assert (=> b!1442448 m!1331597))

(declare-fun m!1331599 () Bool)

(assert (=> b!1442449 m!1331599))

(declare-fun m!1331601 () Bool)

(assert (=> b!1442449 m!1331601))

(declare-fun m!1331603 () Bool)

(assert (=> b!1442450 m!1331603))

(declare-fun m!1331605 () Bool)

(assert (=> start!124590 m!1331605))

(declare-fun m!1331607 () Bool)

(assert (=> start!124590 m!1331607))

(declare-fun m!1331609 () Bool)

(assert (=> b!1442452 m!1331609))

(declare-fun m!1331611 () Bool)

(assert (=> b!1442451 m!1331611))

(assert (=> b!1442451 m!1331593))

(assert (=> b!1442439 m!1331593))

(assert (=> b!1442439 m!1331593))

(declare-fun m!1331613 () Bool)

(assert (=> b!1442439 m!1331613))

(assert (=> b!1442440 m!1331593))

(assert (=> b!1442440 m!1331593))

(declare-fun m!1331615 () Bool)

(assert (=> b!1442440 m!1331615))

(declare-fun m!1331617 () Bool)

(assert (=> b!1442446 m!1331617))

(declare-fun m!1331619 () Bool)

(assert (=> b!1442446 m!1331619))

(declare-fun m!1331621 () Bool)

(assert (=> b!1442444 m!1331621))

(assert (=> b!1442444 m!1331621))

(declare-fun m!1331623 () Bool)

(assert (=> b!1442444 m!1331623))

(declare-fun m!1331625 () Bool)

(assert (=> b!1442438 m!1331625))

(assert (=> b!1442438 m!1331625))

(declare-fun m!1331627 () Bool)

(assert (=> b!1442438 m!1331627))

(assert (=> b!1442438 m!1331599))

(declare-fun m!1331629 () Bool)

(assert (=> b!1442438 m!1331629))

(declare-fun m!1331631 () Bool)

(assert (=> b!1442445 m!1331631))

(declare-fun m!1331633 () Bool)

(assert (=> b!1442445 m!1331633))

(assert (=> b!1442447 m!1331593))

(assert (=> b!1442447 m!1331593))

(declare-fun m!1331635 () Bool)

(assert (=> b!1442447 m!1331635))

(check-sat (not b!1442438) (not b!1442445) (not b!1442446) (not start!124590) (not b!1442450) (not b!1442441) (not b!1442452) (not b!1442439) (not b!1442444) (not b!1442440) (not b!1442447) (not b!1442448))
(check-sat)
