; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125734 () Bool)

(assert start!125734)

(declare-fun b!1471457 () Bool)

(declare-fun res!999334 () Bool)

(declare-fun e!825910 () Bool)

(assert (=> b!1471457 (=> (not res!999334) (not e!825910))))

(declare-datatypes ((array!99046 0))(
  ( (array!99047 (arr!47809 (Array (_ BitVec 32) (_ BitVec 64))) (size!48361 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99046)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471457 (= res!999334 (validKeyInArray!0 (select (arr!47809 a!2862) i!1006)))))

(declare-fun b!1471458 () Bool)

(declare-fun e!825912 () Bool)

(assert (=> b!1471458 (= e!825910 e!825912)))

(declare-fun res!999331 () Bool)

(assert (=> b!1471458 (=> (not res!999331) (not e!825912))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1471458 (= res!999331 (= (select (store (arr!47809 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643108 () array!99046)

(assert (=> b!1471458 (= lt!643108 (array!99047 (store (arr!47809 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48361 a!2862)))))

(declare-fun b!1471459 () Bool)

(declare-fun res!999341 () Bool)

(assert (=> b!1471459 (=> (not res!999341) (not e!825910))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1471459 (= res!999341 (validKeyInArray!0 (select (arr!47809 a!2862) j!93)))))

(declare-fun b!1471460 () Bool)

(declare-fun res!999332 () Bool)

(assert (=> b!1471460 (=> (not res!999332) (not e!825910))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1471460 (= res!999332 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48361 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48361 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48361 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1471461 () Bool)

(declare-fun e!825913 () Bool)

(declare-fun e!825911 () Bool)

(assert (=> b!1471461 (= e!825913 e!825911)))

(declare-fun res!999329 () Bool)

(assert (=> b!1471461 (=> (not res!999329) (not e!825911))))

(declare-datatypes ((SeekEntryResult!12074 0))(
  ( (MissingZero!12074 (index!50688 (_ BitVec 32))) (Found!12074 (index!50689 (_ BitVec 32))) (Intermediate!12074 (undefined!12886 Bool) (index!50690 (_ BitVec 32)) (x!132272 (_ BitVec 32))) (Undefined!12074) (MissingVacant!12074 (index!50691 (_ BitVec 32))) )
))
(declare-fun lt!643106 () SeekEntryResult!12074)

(assert (=> b!1471461 (= res!999329 (= lt!643106 (Intermediate!12074 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!643107 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99046 (_ BitVec 32)) SeekEntryResult!12074)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471461 (= lt!643106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643107 mask!2687) lt!643107 lt!643108 mask!2687))))

(assert (=> b!1471461 (= lt!643107 (select (store (arr!47809 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1471463 () Bool)

(declare-fun res!999339 () Bool)

(assert (=> b!1471463 (=> (not res!999339) (not e!825910))))

(assert (=> b!1471463 (= res!999339 (and (= (size!48361 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48361 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48361 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1471464 () Bool)

(declare-fun res!999333 () Bool)

(assert (=> b!1471464 (=> (not res!999333) (not e!825910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99046 (_ BitVec 32)) Bool)

(assert (=> b!1471464 (= res!999333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1471465 () Bool)

(declare-fun e!825909 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99046 (_ BitVec 32)) SeekEntryResult!12074)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99046 (_ BitVec 32)) SeekEntryResult!12074)

(assert (=> b!1471465 (= e!825909 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643107 lt!643108 mask!2687) (seekEntryOrOpen!0 lt!643107 lt!643108 mask!2687)))))

(declare-fun b!1471466 () Bool)

(declare-fun res!999340 () Bool)

(assert (=> b!1471466 (=> (not res!999340) (not e!825913))))

(declare-fun lt!643110 () SeekEntryResult!12074)

(assert (=> b!1471466 (= res!999340 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47809 a!2862) j!93) a!2862 mask!2687) lt!643110))))

(declare-fun b!1471467 () Bool)

(assert (=> b!1471467 (= e!825911 (not true))))

(declare-fun e!825915 () Bool)

(assert (=> b!1471467 e!825915))

(declare-fun res!999330 () Bool)

(assert (=> b!1471467 (=> (not res!999330) (not e!825915))))

(assert (=> b!1471467 (= res!999330 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49329 0))(
  ( (Unit!49330) )
))
(declare-fun lt!643109 () Unit!49329)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99046 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49329)

(assert (=> b!1471467 (= lt!643109 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1471468 () Bool)

(declare-fun res!999337 () Bool)

(assert (=> b!1471468 (=> (not res!999337) (not e!825915))))

(assert (=> b!1471468 (= res!999337 (= (seekEntryOrOpen!0 (select (arr!47809 a!2862) j!93) a!2862 mask!2687) (Found!12074 j!93)))))

(declare-fun b!1471469 () Bool)

(assert (=> b!1471469 (= e!825915 (or (= (select (arr!47809 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47809 a!2862) intermediateBeforeIndex!19) (select (arr!47809 a!2862) j!93))))))

(declare-fun b!1471470 () Bool)

(declare-fun res!999342 () Bool)

(assert (=> b!1471470 (=> (not res!999342) (not e!825910))))

(declare-datatypes ((List!34388 0))(
  ( (Nil!34385) (Cons!34384 (h!35740 (_ BitVec 64)) (t!49074 List!34388)) )
))
(declare-fun arrayNoDuplicates!0 (array!99046 (_ BitVec 32) List!34388) Bool)

(assert (=> b!1471470 (= res!999342 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34385))))

(declare-fun b!1471471 () Bool)

(assert (=> b!1471471 (= e!825912 e!825913)))

(declare-fun res!999343 () Bool)

(assert (=> b!1471471 (=> (not res!999343) (not e!825913))))

(assert (=> b!1471471 (= res!999343 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47809 a!2862) j!93) mask!2687) (select (arr!47809 a!2862) j!93) a!2862 mask!2687) lt!643110))))

(assert (=> b!1471471 (= lt!643110 (Intermediate!12074 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1471472 () Bool)

(assert (=> b!1471472 (= e!825909 (= lt!643106 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643107 lt!643108 mask!2687)))))

(declare-fun b!1471473 () Bool)

(declare-fun res!999335 () Bool)

(assert (=> b!1471473 (=> (not res!999335) (not e!825911))))

(assert (=> b!1471473 (= res!999335 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1471462 () Bool)

(declare-fun res!999336 () Bool)

(assert (=> b!1471462 (=> (not res!999336) (not e!825911))))

(assert (=> b!1471462 (= res!999336 e!825909)))

(declare-fun c!135580 () Bool)

(assert (=> b!1471462 (= c!135580 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!999338 () Bool)

(assert (=> start!125734 (=> (not res!999338) (not e!825910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125734 (= res!999338 (validMask!0 mask!2687))))

(assert (=> start!125734 e!825910))

(assert (=> start!125734 true))

(declare-fun array_inv!37042 (array!99046) Bool)

(assert (=> start!125734 (array_inv!37042 a!2862)))

(assert (= (and start!125734 res!999338) b!1471463))

(assert (= (and b!1471463 res!999339) b!1471457))

(assert (= (and b!1471457 res!999334) b!1471459))

(assert (= (and b!1471459 res!999341) b!1471464))

(assert (= (and b!1471464 res!999333) b!1471470))

(assert (= (and b!1471470 res!999342) b!1471460))

(assert (= (and b!1471460 res!999332) b!1471458))

(assert (= (and b!1471458 res!999331) b!1471471))

(assert (= (and b!1471471 res!999343) b!1471466))

(assert (= (and b!1471466 res!999340) b!1471461))

(assert (= (and b!1471461 res!999329) b!1471462))

(assert (= (and b!1471462 c!135580) b!1471472))

(assert (= (and b!1471462 (not c!135580)) b!1471465))

(assert (= (and b!1471462 res!999336) b!1471473))

(assert (= (and b!1471473 res!999335) b!1471467))

(assert (= (and b!1471467 res!999330) b!1471468))

(assert (= (and b!1471468 res!999337) b!1471469))

(declare-fun m!1357767 () Bool)

(assert (=> b!1471471 m!1357767))

(assert (=> b!1471471 m!1357767))

(declare-fun m!1357769 () Bool)

(assert (=> b!1471471 m!1357769))

(assert (=> b!1471471 m!1357769))

(assert (=> b!1471471 m!1357767))

(declare-fun m!1357771 () Bool)

(assert (=> b!1471471 m!1357771))

(declare-fun m!1357773 () Bool)

(assert (=> start!125734 m!1357773))

(declare-fun m!1357775 () Bool)

(assert (=> start!125734 m!1357775))

(declare-fun m!1357777 () Bool)

(assert (=> b!1471465 m!1357777))

(declare-fun m!1357779 () Bool)

(assert (=> b!1471465 m!1357779))

(declare-fun m!1357781 () Bool)

(assert (=> b!1471469 m!1357781))

(assert (=> b!1471469 m!1357767))

(assert (=> b!1471459 m!1357767))

(assert (=> b!1471459 m!1357767))

(declare-fun m!1357783 () Bool)

(assert (=> b!1471459 m!1357783))

(declare-fun m!1357785 () Bool)

(assert (=> b!1471457 m!1357785))

(assert (=> b!1471457 m!1357785))

(declare-fun m!1357787 () Bool)

(assert (=> b!1471457 m!1357787))

(assert (=> b!1471466 m!1357767))

(assert (=> b!1471466 m!1357767))

(declare-fun m!1357789 () Bool)

(assert (=> b!1471466 m!1357789))

(assert (=> b!1471468 m!1357767))

(assert (=> b!1471468 m!1357767))

(declare-fun m!1357791 () Bool)

(assert (=> b!1471468 m!1357791))

(declare-fun m!1357793 () Bool)

(assert (=> b!1471461 m!1357793))

(assert (=> b!1471461 m!1357793))

(declare-fun m!1357795 () Bool)

(assert (=> b!1471461 m!1357795))

(declare-fun m!1357797 () Bool)

(assert (=> b!1471461 m!1357797))

(declare-fun m!1357799 () Bool)

(assert (=> b!1471461 m!1357799))

(declare-fun m!1357801 () Bool)

(assert (=> b!1471470 m!1357801))

(declare-fun m!1357803 () Bool)

(assert (=> b!1471464 m!1357803))

(declare-fun m!1357805 () Bool)

(assert (=> b!1471467 m!1357805))

(declare-fun m!1357807 () Bool)

(assert (=> b!1471467 m!1357807))

(declare-fun m!1357809 () Bool)

(assert (=> b!1471472 m!1357809))

(assert (=> b!1471458 m!1357797))

(declare-fun m!1357811 () Bool)

(assert (=> b!1471458 m!1357811))

(check-sat (not b!1471467) (not b!1471457) (not b!1471465) (not b!1471472) (not start!125734) (not b!1471470) (not b!1471464) (not b!1471471) (not b!1471461) (not b!1471459) (not b!1471466) (not b!1471468))
(check-sat)
