; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125218 () Bool)

(assert start!125218)

(declare-fun b!1460702 () Bool)

(declare-fun res!990455 () Bool)

(declare-fun e!821284 () Bool)

(assert (=> b!1460702 (=> (not res!990455) (not e!821284))))

(declare-datatypes ((array!98666 0))(
  ( (array!98667 (arr!47621 (Array (_ BitVec 32) (_ BitVec 64))) (size!48171 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98666)

(declare-datatypes ((List!34122 0))(
  ( (Nil!34119) (Cons!34118 (h!35468 (_ BitVec 64)) (t!48816 List!34122)) )
))
(declare-fun arrayNoDuplicates!0 (array!98666 (_ BitVec 32) List!34122) Bool)

(assert (=> b!1460702 (= res!990455 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34119))))

(declare-fun b!1460703 () Bool)

(declare-fun res!990450 () Bool)

(declare-fun e!821286 () Bool)

(assert (=> b!1460703 (=> (not res!990450) (not e!821286))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1460703 (= res!990450 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460704 () Bool)

(declare-fun e!821283 () Bool)

(assert (=> b!1460704 (= e!821283 e!821286)))

(declare-fun res!990457 () Bool)

(assert (=> b!1460704 (=> (not res!990457) (not e!821286))))

(declare-datatypes ((SeekEntryResult!11873 0))(
  ( (MissingZero!11873 (index!49884 (_ BitVec 32))) (Found!11873 (index!49885 (_ BitVec 32))) (Intermediate!11873 (undefined!12685 Bool) (index!49886 (_ BitVec 32)) (x!131490 (_ BitVec 32))) (Undefined!11873) (MissingVacant!11873 (index!49887 (_ BitVec 32))) )
))
(declare-fun lt!639902 () SeekEntryResult!11873)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1460704 (= res!990457 (= lt!639902 (Intermediate!11873 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!639900 () (_ BitVec 64))

(declare-fun lt!639899 () array!98666)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98666 (_ BitVec 32)) SeekEntryResult!11873)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460704 (= lt!639902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639900 mask!2687) lt!639900 lt!639899 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1460704 (= lt!639900 (select (store (arr!47621 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460705 () Bool)

(declare-fun res!990453 () Bool)

(assert (=> b!1460705 (=> (not res!990453) (not e!821286))))

(declare-fun e!821287 () Bool)

(assert (=> b!1460705 (= res!990453 e!821287)))

(declare-fun c!134640 () Bool)

(assert (=> b!1460705 (= c!134640 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460706 () Bool)

(declare-fun res!990447 () Bool)

(assert (=> b!1460706 (=> (not res!990447) (not e!821284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98666 (_ BitVec 32)) Bool)

(assert (=> b!1460706 (= res!990447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460707 () Bool)

(declare-fun res!990449 () Bool)

(assert (=> b!1460707 (=> (not res!990449) (not e!821284))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1460707 (= res!990449 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48171 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48171 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48171 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460708 () Bool)

(declare-fun res!990456 () Bool)

(assert (=> b!1460708 (=> (not res!990456) (not e!821284))))

(assert (=> b!1460708 (= res!990456 (and (= (size!48171 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48171 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48171 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460709 () Bool)

(declare-fun e!821285 () Bool)

(assert (=> b!1460709 (= e!821285 e!821283)))

(declare-fun res!990451 () Bool)

(assert (=> b!1460709 (=> (not res!990451) (not e!821283))))

(declare-fun lt!639901 () SeekEntryResult!11873)

(assert (=> b!1460709 (= res!990451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47621 a!2862) j!93) mask!2687) (select (arr!47621 a!2862) j!93) a!2862 mask!2687) lt!639901))))

(assert (=> b!1460709 (= lt!639901 (Intermediate!11873 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460710 () Bool)

(declare-fun res!990454 () Bool)

(assert (=> b!1460710 (=> (not res!990454) (not e!821284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460710 (= res!990454 (validKeyInArray!0 (select (arr!47621 a!2862) i!1006)))))

(declare-fun b!1460711 () Bool)

(declare-fun res!990452 () Bool)

(assert (=> b!1460711 (=> (not res!990452) (not e!821284))))

(assert (=> b!1460711 (= res!990452 (validKeyInArray!0 (select (arr!47621 a!2862) j!93)))))

(declare-fun res!990443 () Bool)

(assert (=> start!125218 (=> (not res!990443) (not e!821284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125218 (= res!990443 (validMask!0 mask!2687))))

(assert (=> start!125218 e!821284))

(assert (=> start!125218 true))

(declare-fun array_inv!36649 (array!98666) Bool)

(assert (=> start!125218 (array_inv!36649 a!2862)))

(declare-fun b!1460712 () Bool)

(declare-fun res!990445 () Bool)

(declare-fun e!821282 () Bool)

(assert (=> b!1460712 (=> (not res!990445) (not e!821282))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98666 (_ BitVec 32)) SeekEntryResult!11873)

(assert (=> b!1460712 (= res!990445 (= (seekEntryOrOpen!0 (select (arr!47621 a!2862) j!93) a!2862 mask!2687) (Found!11873 j!93)))))

(declare-fun b!1460713 () Bool)

(assert (=> b!1460713 (= e!821286 (not true))))

(assert (=> b!1460713 e!821282))

(declare-fun res!990446 () Bool)

(assert (=> b!1460713 (=> (not res!990446) (not e!821282))))

(assert (=> b!1460713 (= res!990446 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49242 0))(
  ( (Unit!49243) )
))
(declare-fun lt!639903 () Unit!49242)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98666 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49242)

(assert (=> b!1460713 (= lt!639903 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460714 () Bool)

(assert (=> b!1460714 (= e!821284 e!821285)))

(declare-fun res!990448 () Bool)

(assert (=> b!1460714 (=> (not res!990448) (not e!821285))))

(assert (=> b!1460714 (= res!990448 (= (select (store (arr!47621 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1460714 (= lt!639899 (array!98667 (store (arr!47621 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48171 a!2862)))))

(declare-fun b!1460715 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98666 (_ BitVec 32)) SeekEntryResult!11873)

(assert (=> b!1460715 (= e!821287 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639900 lt!639899 mask!2687) (seekEntryOrOpen!0 lt!639900 lt!639899 mask!2687)))))

(declare-fun b!1460716 () Bool)

(declare-fun res!990444 () Bool)

(assert (=> b!1460716 (=> (not res!990444) (not e!821283))))

(assert (=> b!1460716 (= res!990444 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47621 a!2862) j!93) a!2862 mask!2687) lt!639901))))

(declare-fun b!1460717 () Bool)

(assert (=> b!1460717 (= e!821287 (= lt!639902 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639900 lt!639899 mask!2687)))))

(declare-fun b!1460718 () Bool)

(assert (=> b!1460718 (= e!821282 (or (= (select (arr!47621 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47621 a!2862) intermediateBeforeIndex!19) (select (arr!47621 a!2862) j!93))))))

(assert (= (and start!125218 res!990443) b!1460708))

(assert (= (and b!1460708 res!990456) b!1460710))

(assert (= (and b!1460710 res!990454) b!1460711))

(assert (= (and b!1460711 res!990452) b!1460706))

(assert (= (and b!1460706 res!990447) b!1460702))

(assert (= (and b!1460702 res!990455) b!1460707))

(assert (= (and b!1460707 res!990449) b!1460714))

(assert (= (and b!1460714 res!990448) b!1460709))

(assert (= (and b!1460709 res!990451) b!1460716))

(assert (= (and b!1460716 res!990444) b!1460704))

(assert (= (and b!1460704 res!990457) b!1460705))

(assert (= (and b!1460705 c!134640) b!1460717))

(assert (= (and b!1460705 (not c!134640)) b!1460715))

(assert (= (and b!1460705 res!990453) b!1460703))

(assert (= (and b!1460703 res!990450) b!1460713))

(assert (= (and b!1460713 res!990446) b!1460712))

(assert (= (and b!1460712 res!990445) b!1460718))

(declare-fun m!1348375 () Bool)

(assert (=> b!1460717 m!1348375))

(declare-fun m!1348377 () Bool)

(assert (=> b!1460714 m!1348377))

(declare-fun m!1348379 () Bool)

(assert (=> b!1460714 m!1348379))

(declare-fun m!1348381 () Bool)

(assert (=> start!125218 m!1348381))

(declare-fun m!1348383 () Bool)

(assert (=> start!125218 m!1348383))

(declare-fun m!1348385 () Bool)

(assert (=> b!1460710 m!1348385))

(assert (=> b!1460710 m!1348385))

(declare-fun m!1348387 () Bool)

(assert (=> b!1460710 m!1348387))

(declare-fun m!1348389 () Bool)

(assert (=> b!1460713 m!1348389))

(declare-fun m!1348391 () Bool)

(assert (=> b!1460713 m!1348391))

(declare-fun m!1348393 () Bool)

(assert (=> b!1460715 m!1348393))

(declare-fun m!1348395 () Bool)

(assert (=> b!1460715 m!1348395))

(declare-fun m!1348397 () Bool)

(assert (=> b!1460709 m!1348397))

(assert (=> b!1460709 m!1348397))

(declare-fun m!1348399 () Bool)

(assert (=> b!1460709 m!1348399))

(assert (=> b!1460709 m!1348399))

(assert (=> b!1460709 m!1348397))

(declare-fun m!1348401 () Bool)

(assert (=> b!1460709 m!1348401))

(assert (=> b!1460716 m!1348397))

(assert (=> b!1460716 m!1348397))

(declare-fun m!1348403 () Bool)

(assert (=> b!1460716 m!1348403))

(declare-fun m!1348405 () Bool)

(assert (=> b!1460704 m!1348405))

(assert (=> b!1460704 m!1348405))

(declare-fun m!1348407 () Bool)

(assert (=> b!1460704 m!1348407))

(assert (=> b!1460704 m!1348377))

(declare-fun m!1348409 () Bool)

(assert (=> b!1460704 m!1348409))

(declare-fun m!1348411 () Bool)

(assert (=> b!1460706 m!1348411))

(declare-fun m!1348413 () Bool)

(assert (=> b!1460702 m!1348413))

(assert (=> b!1460711 m!1348397))

(assert (=> b!1460711 m!1348397))

(declare-fun m!1348415 () Bool)

(assert (=> b!1460711 m!1348415))

(assert (=> b!1460712 m!1348397))

(assert (=> b!1460712 m!1348397))

(declare-fun m!1348417 () Bool)

(assert (=> b!1460712 m!1348417))

(declare-fun m!1348419 () Bool)

(assert (=> b!1460718 m!1348419))

(assert (=> b!1460718 m!1348397))

(push 1)

