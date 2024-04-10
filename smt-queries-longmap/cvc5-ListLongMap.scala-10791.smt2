; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126244 () Bool)

(assert start!126244)

(declare-fun res!1005502 () Bool)

(declare-fun e!829937 () Bool)

(assert (=> start!126244 (=> (not res!1005502) (not e!829937))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126244 (= res!1005502 (validMask!0 mask!2687))))

(assert (=> start!126244 e!829937))

(assert (=> start!126244 true))

(declare-datatypes ((array!99350 0))(
  ( (array!99351 (arr!47954 (Array (_ BitVec 32) (_ BitVec 64))) (size!48504 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99350)

(declare-fun array_inv!36982 (array!99350) Bool)

(assert (=> start!126244 (array_inv!36982 a!2862)))

(declare-fun b!1479599 () Bool)

(declare-fun e!829929 () Bool)

(assert (=> b!1479599 (= e!829929 true)))

(declare-datatypes ((SeekEntryResult!12194 0))(
  ( (MissingZero!12194 (index!51168 (_ BitVec 32))) (Found!12194 (index!51169 (_ BitVec 32))) (Intermediate!12194 (undefined!13006 Bool) (index!51170 (_ BitVec 32)) (x!132753 (_ BitVec 32))) (Undefined!12194) (MissingVacant!12194 (index!51171 (_ BitVec 32))) )
))
(declare-fun lt!646091 () SeekEntryResult!12194)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!646092 () array!99350)

(declare-fun lt!646095 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99350 (_ BitVec 32)) SeekEntryResult!12194)

(assert (=> b!1479599 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646095 lt!646092 mask!2687) lt!646091)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49728 0))(
  ( (Unit!49729) )
))
(declare-fun lt!646088 () Unit!49728)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49728)

(assert (=> b!1479599 (= lt!646088 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1479600 () Bool)

(declare-fun res!1005505 () Bool)

(assert (=> b!1479600 (=> res!1005505 e!829929)))

(assert (=> b!1479600 (= res!1005505 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47954 a!2862) j!93) a!2862 mask!2687) lt!646091)))))

(declare-fun b!1479601 () Bool)

(declare-fun res!1005495 () Bool)

(assert (=> b!1479601 (=> (not res!1005495) (not e!829937))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1479601 (= res!1005495 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48504 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48504 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48504 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479602 () Bool)

(declare-fun lt!646093 () SeekEntryResult!12194)

(declare-fun e!829934 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99350 (_ BitVec 32)) SeekEntryResult!12194)

(assert (=> b!1479602 (= e!829934 (= lt!646093 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646095 lt!646092 mask!2687)))))

(declare-fun b!1479603 () Bool)

(declare-fun res!1005500 () Bool)

(assert (=> b!1479603 (=> (not res!1005500) (not e!829937))))

(assert (=> b!1479603 (= res!1005500 (and (= (size!48504 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48504 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48504 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479604 () Bool)

(declare-fun e!829935 () Bool)

(assert (=> b!1479604 (= e!829937 e!829935)))

(declare-fun res!1005503 () Bool)

(assert (=> b!1479604 (=> (not res!1005503) (not e!829935))))

(assert (=> b!1479604 (= res!1005503 (= (select (store (arr!47954 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1479604 (= lt!646092 (array!99351 (store (arr!47954 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48504 a!2862)))))

(declare-fun b!1479605 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99350 (_ BitVec 32)) SeekEntryResult!12194)

(assert (=> b!1479605 (= e!829934 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646095 lt!646092 mask!2687) (seekEntryOrOpen!0 lt!646095 lt!646092 mask!2687)))))

(declare-fun b!1479606 () Bool)

(declare-fun res!1005489 () Bool)

(assert (=> b!1479606 (=> (not res!1005489) (not e!829937))))

(declare-datatypes ((List!34455 0))(
  ( (Nil!34452) (Cons!34451 (h!35819 (_ BitVec 64)) (t!49149 List!34455)) )
))
(declare-fun arrayNoDuplicates!0 (array!99350 (_ BitVec 32) List!34455) Bool)

(assert (=> b!1479606 (= res!1005489 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34452))))

(declare-fun b!1479607 () Bool)

(declare-fun res!1005497 () Bool)

(declare-fun e!829932 () Bool)

(assert (=> b!1479607 (=> (not res!1005497) (not e!829932))))

(assert (=> b!1479607 (= res!1005497 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479608 () Bool)

(declare-fun e!829930 () Bool)

(assert (=> b!1479608 (= e!829935 e!829930)))

(declare-fun res!1005490 () Bool)

(assert (=> b!1479608 (=> (not res!1005490) (not e!829930))))

(declare-fun lt!646089 () SeekEntryResult!12194)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479608 (= res!1005490 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47954 a!2862) j!93) mask!2687) (select (arr!47954 a!2862) j!93) a!2862 mask!2687) lt!646089))))

(assert (=> b!1479608 (= lt!646089 (Intermediate!12194 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479609 () Bool)

(assert (=> b!1479609 (= e!829932 (not e!829929))))

(declare-fun res!1005492 () Bool)

(assert (=> b!1479609 (=> res!1005492 e!829929)))

(assert (=> b!1479609 (= res!1005492 (or (and (= (select (arr!47954 a!2862) index!646) (select (store (arr!47954 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47954 a!2862) index!646) (select (arr!47954 a!2862) j!93))) (not (= (select (arr!47954 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47954 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!829933 () Bool)

(assert (=> b!1479609 e!829933))

(declare-fun res!1005499 () Bool)

(assert (=> b!1479609 (=> (not res!1005499) (not e!829933))))

(declare-fun lt!646090 () SeekEntryResult!12194)

(assert (=> b!1479609 (= res!1005499 (and (= lt!646090 lt!646091) (or (= (select (arr!47954 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47954 a!2862) intermediateBeforeIndex!19) (select (arr!47954 a!2862) j!93)))))))

(assert (=> b!1479609 (= lt!646091 (Found!12194 j!93))))

(assert (=> b!1479609 (= lt!646090 (seekEntryOrOpen!0 (select (arr!47954 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99350 (_ BitVec 32)) Bool)

(assert (=> b!1479609 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!646094 () Unit!49728)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49728)

(assert (=> b!1479609 (= lt!646094 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479610 () Bool)

(assert (=> b!1479610 (= e!829930 e!829932)))

(declare-fun res!1005494 () Bool)

(assert (=> b!1479610 (=> (not res!1005494) (not e!829932))))

(assert (=> b!1479610 (= res!1005494 (= lt!646093 (Intermediate!12194 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1479610 (= lt!646093 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646095 mask!2687) lt!646095 lt!646092 mask!2687))))

(assert (=> b!1479610 (= lt!646095 (select (store (arr!47954 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479611 () Bool)

(declare-fun res!1005501 () Bool)

(assert (=> b!1479611 (=> (not res!1005501) (not e!829937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479611 (= res!1005501 (validKeyInArray!0 (select (arr!47954 a!2862) i!1006)))))

(declare-fun b!1479612 () Bool)

(declare-fun e!829928 () Bool)

(assert (=> b!1479612 (= e!829933 e!829928)))

(declare-fun res!1005504 () Bool)

(assert (=> b!1479612 (=> res!1005504 e!829928)))

(assert (=> b!1479612 (= res!1005504 (or (and (= (select (arr!47954 a!2862) index!646) (select (store (arr!47954 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47954 a!2862) index!646) (select (arr!47954 a!2862) j!93))) (not (= (select (arr!47954 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479613 () Bool)

(declare-fun res!1005493 () Bool)

(assert (=> b!1479613 (=> (not res!1005493) (not e!829932))))

(assert (=> b!1479613 (= res!1005493 e!829934)))

(declare-fun c!136575 () Bool)

(assert (=> b!1479613 (= c!136575 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479614 () Bool)

(declare-fun e!829936 () Bool)

(assert (=> b!1479614 (= e!829928 e!829936)))

(declare-fun res!1005491 () Bool)

(assert (=> b!1479614 (=> (not res!1005491) (not e!829936))))

(assert (=> b!1479614 (= res!1005491 (= lt!646090 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47954 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479615 () Bool)

(declare-fun res!1005496 () Bool)

(assert (=> b!1479615 (=> (not res!1005496) (not e!829930))))

(assert (=> b!1479615 (= res!1005496 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47954 a!2862) j!93) a!2862 mask!2687) lt!646089))))

(declare-fun b!1479616 () Bool)

(declare-fun res!1005488 () Bool)

(assert (=> b!1479616 (=> (not res!1005488) (not e!829937))))

(assert (=> b!1479616 (= res!1005488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479617 () Bool)

(declare-fun res!1005498 () Bool)

(assert (=> b!1479617 (=> (not res!1005498) (not e!829937))))

(assert (=> b!1479617 (= res!1005498 (validKeyInArray!0 (select (arr!47954 a!2862) j!93)))))

(declare-fun b!1479618 () Bool)

(assert (=> b!1479618 (= e!829936 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!126244 res!1005502) b!1479603))

(assert (= (and b!1479603 res!1005500) b!1479611))

(assert (= (and b!1479611 res!1005501) b!1479617))

(assert (= (and b!1479617 res!1005498) b!1479616))

(assert (= (and b!1479616 res!1005488) b!1479606))

(assert (= (and b!1479606 res!1005489) b!1479601))

(assert (= (and b!1479601 res!1005495) b!1479604))

(assert (= (and b!1479604 res!1005503) b!1479608))

(assert (= (and b!1479608 res!1005490) b!1479615))

(assert (= (and b!1479615 res!1005496) b!1479610))

(assert (= (and b!1479610 res!1005494) b!1479613))

(assert (= (and b!1479613 c!136575) b!1479602))

(assert (= (and b!1479613 (not c!136575)) b!1479605))

(assert (= (and b!1479613 res!1005493) b!1479607))

(assert (= (and b!1479607 res!1005497) b!1479609))

(assert (= (and b!1479609 res!1005499) b!1479612))

(assert (= (and b!1479612 (not res!1005504)) b!1479614))

(assert (= (and b!1479614 res!1005491) b!1479618))

(assert (= (and b!1479609 (not res!1005492)) b!1479600))

(assert (= (and b!1479600 (not res!1005505)) b!1479599))

(declare-fun m!1365457 () Bool)

(assert (=> b!1479614 m!1365457))

(assert (=> b!1479614 m!1365457))

(declare-fun m!1365459 () Bool)

(assert (=> b!1479614 m!1365459))

(declare-fun m!1365461 () Bool)

(assert (=> b!1479602 m!1365461))

(assert (=> b!1479615 m!1365457))

(assert (=> b!1479615 m!1365457))

(declare-fun m!1365463 () Bool)

(assert (=> b!1479615 m!1365463))

(assert (=> b!1479608 m!1365457))

(assert (=> b!1479608 m!1365457))

(declare-fun m!1365465 () Bool)

(assert (=> b!1479608 m!1365465))

(assert (=> b!1479608 m!1365465))

(assert (=> b!1479608 m!1365457))

(declare-fun m!1365467 () Bool)

(assert (=> b!1479608 m!1365467))

(declare-fun m!1365469 () Bool)

(assert (=> b!1479611 m!1365469))

(assert (=> b!1479611 m!1365469))

(declare-fun m!1365471 () Bool)

(assert (=> b!1479611 m!1365471))

(assert (=> b!1479600 m!1365457))

(assert (=> b!1479600 m!1365457))

(declare-fun m!1365473 () Bool)

(assert (=> b!1479600 m!1365473))

(declare-fun m!1365475 () Bool)

(assert (=> b!1479599 m!1365475))

(declare-fun m!1365477 () Bool)

(assert (=> b!1479599 m!1365477))

(declare-fun m!1365479 () Bool)

(assert (=> b!1479609 m!1365479))

(declare-fun m!1365481 () Bool)

(assert (=> b!1479609 m!1365481))

(declare-fun m!1365483 () Bool)

(assert (=> b!1479609 m!1365483))

(declare-fun m!1365485 () Bool)

(assert (=> b!1479609 m!1365485))

(declare-fun m!1365487 () Bool)

(assert (=> b!1479609 m!1365487))

(assert (=> b!1479609 m!1365457))

(declare-fun m!1365489 () Bool)

(assert (=> b!1479609 m!1365489))

(declare-fun m!1365491 () Bool)

(assert (=> b!1479609 m!1365491))

(assert (=> b!1479609 m!1365457))

(declare-fun m!1365493 () Bool)

(assert (=> b!1479606 m!1365493))

(assert (=> b!1479605 m!1365475))

(declare-fun m!1365495 () Bool)

(assert (=> b!1479605 m!1365495))

(declare-fun m!1365497 () Bool)

(assert (=> b!1479610 m!1365497))

(assert (=> b!1479610 m!1365497))

(declare-fun m!1365499 () Bool)

(assert (=> b!1479610 m!1365499))

(assert (=> b!1479610 m!1365481))

(declare-fun m!1365501 () Bool)

(assert (=> b!1479610 m!1365501))

(assert (=> b!1479617 m!1365457))

(assert (=> b!1479617 m!1365457))

(declare-fun m!1365503 () Bool)

(assert (=> b!1479617 m!1365503))

(declare-fun m!1365505 () Bool)

(assert (=> b!1479616 m!1365505))

(declare-fun m!1365507 () Bool)

(assert (=> start!126244 m!1365507))

(declare-fun m!1365509 () Bool)

(assert (=> start!126244 m!1365509))

(assert (=> b!1479612 m!1365487))

(assert (=> b!1479612 m!1365481))

(assert (=> b!1479612 m!1365485))

(assert (=> b!1479612 m!1365457))

(assert (=> b!1479604 m!1365481))

(declare-fun m!1365511 () Bool)

(assert (=> b!1479604 m!1365511))

(push 1)

