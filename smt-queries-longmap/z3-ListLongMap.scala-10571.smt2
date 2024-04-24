; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124782 () Bool)

(assert start!124782)

(declare-fun b!1443134 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11496 0))(
  ( (MissingZero!11496 (index!48376 (_ BitVec 32))) (Found!11496 (index!48377 (_ BitVec 32))) (Intermediate!11496 (undefined!12308 Bool) (index!48378 (_ BitVec 32)) (x!130265 (_ BitVec 32))) (Undefined!11496) (MissingVacant!11496 (index!48379 (_ BitVec 32))) )
))
(declare-fun lt!633846 () SeekEntryResult!11496)

(declare-fun e!813563 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!633847 () (_ BitVec 64))

(declare-datatypes ((array!98125 0))(
  ( (array!98126 (arr!47347 (Array (_ BitVec 32) (_ BitVec 64))) (size!47898 (_ BitVec 32))) )
))
(declare-fun lt!633844 () array!98125)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98125 (_ BitVec 32)) SeekEntryResult!11496)

(assert (=> b!1443134 (= e!813563 (= lt!633846 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633847 lt!633844 mask!2687)))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1443135 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98125 (_ BitVec 32)) SeekEntryResult!11496)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98125 (_ BitVec 32)) SeekEntryResult!11496)

(assert (=> b!1443135 (= e!813563 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633847 lt!633844 mask!2687) (seekEntryOrOpen!0 lt!633847 lt!633844 mask!2687)))))

(declare-fun b!1443136 () Bool)

(declare-fun res!974614 () Bool)

(declare-fun e!813562 () Bool)

(assert (=> b!1443136 (=> (not res!974614) (not e!813562))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun a!2862 () array!98125)

(assert (=> b!1443136 (= res!974614 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47898 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47898 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47898 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443137 () Bool)

(declare-fun res!974618 () Bool)

(assert (=> b!1443137 (=> (not res!974618) (not e!813562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98125 (_ BitVec 32)) Bool)

(assert (=> b!1443137 (= res!974618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443138 () Bool)

(declare-fun e!813560 () Bool)

(declare-fun e!813559 () Bool)

(assert (=> b!1443138 (= e!813560 e!813559)))

(declare-fun res!974613 () Bool)

(assert (=> b!1443138 (=> (not res!974613) (not e!813559))))

(assert (=> b!1443138 (= res!974613 (= lt!633846 (Intermediate!11496 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443138 (= lt!633846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633847 mask!2687) lt!633847 lt!633844 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1443138 (= lt!633847 (select (store (arr!47347 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443139 () Bool)

(declare-fun res!974611 () Bool)

(assert (=> b!1443139 (=> (not res!974611) (not e!813562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443139 (= res!974611 (validKeyInArray!0 (select (arr!47347 a!2862) i!1006)))))

(declare-fun b!1443140 () Bool)

(declare-fun e!813564 () Bool)

(assert (=> b!1443140 (= e!813564 e!813560)))

(declare-fun res!974616 () Bool)

(assert (=> b!1443140 (=> (not res!974616) (not e!813560))))

(declare-fun lt!633843 () SeekEntryResult!11496)

(assert (=> b!1443140 (= res!974616 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47347 a!2862) j!93) mask!2687) (select (arr!47347 a!2862) j!93) a!2862 mask!2687) lt!633843))))

(assert (=> b!1443140 (= lt!633843 (Intermediate!11496 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443141 () Bool)

(declare-fun res!974617 () Bool)

(assert (=> b!1443141 (=> (not res!974617) (not e!813560))))

(assert (=> b!1443141 (= res!974617 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47347 a!2862) j!93) a!2862 mask!2687) lt!633843))))

(declare-fun res!974607 () Bool)

(assert (=> start!124782 (=> (not res!974607) (not e!813562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124782 (= res!974607 (validMask!0 mask!2687))))

(assert (=> start!124782 e!813562))

(assert (=> start!124782 true))

(declare-fun array_inv!36628 (array!98125) Bool)

(assert (=> start!124782 (array_inv!36628 a!2862)))

(declare-fun b!1443142 () Bool)

(declare-fun res!974608 () Bool)

(assert (=> b!1443142 (=> (not res!974608) (not e!813559))))

(assert (=> b!1443142 (= res!974608 e!813563)))

(declare-fun c!133783 () Bool)

(assert (=> b!1443142 (= c!133783 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443143 () Bool)

(declare-fun res!974612 () Bool)

(assert (=> b!1443143 (=> (not res!974612) (not e!813559))))

(assert (=> b!1443143 (= res!974612 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443144 () Bool)

(declare-fun res!974609 () Bool)

(assert (=> b!1443144 (=> (not res!974609) (not e!813562))))

(declare-datatypes ((List!33835 0))(
  ( (Nil!33832) (Cons!33831 (h!35192 (_ BitVec 64)) (t!48521 List!33835)) )
))
(declare-fun arrayNoDuplicates!0 (array!98125 (_ BitVec 32) List!33835) Bool)

(assert (=> b!1443144 (= res!974609 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33832))))

(declare-fun b!1443145 () Bool)

(assert (=> b!1443145 (= e!813559 (not true))))

(assert (=> b!1443145 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48521 0))(
  ( (Unit!48522) )
))
(declare-fun lt!633845 () Unit!48521)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48521)

(assert (=> b!1443145 (= lt!633845 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443146 () Bool)

(assert (=> b!1443146 (= e!813562 e!813564)))

(declare-fun res!974606 () Bool)

(assert (=> b!1443146 (=> (not res!974606) (not e!813564))))

(assert (=> b!1443146 (= res!974606 (= (select (store (arr!47347 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443146 (= lt!633844 (array!98126 (store (arr!47347 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47898 a!2862)))))

(declare-fun b!1443147 () Bool)

(declare-fun res!974615 () Bool)

(assert (=> b!1443147 (=> (not res!974615) (not e!813562))))

(assert (=> b!1443147 (= res!974615 (validKeyInArray!0 (select (arr!47347 a!2862) j!93)))))

(declare-fun b!1443148 () Bool)

(declare-fun res!974610 () Bool)

(assert (=> b!1443148 (=> (not res!974610) (not e!813562))))

(assert (=> b!1443148 (= res!974610 (and (= (size!47898 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47898 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47898 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124782 res!974607) b!1443148))

(assert (= (and b!1443148 res!974610) b!1443139))

(assert (= (and b!1443139 res!974611) b!1443147))

(assert (= (and b!1443147 res!974615) b!1443137))

(assert (= (and b!1443137 res!974618) b!1443144))

(assert (= (and b!1443144 res!974609) b!1443136))

(assert (= (and b!1443136 res!974614) b!1443146))

(assert (= (and b!1443146 res!974606) b!1443140))

(assert (= (and b!1443140 res!974616) b!1443141))

(assert (= (and b!1443141 res!974617) b!1443138))

(assert (= (and b!1443138 res!974613) b!1443142))

(assert (= (and b!1443142 c!133783) b!1443134))

(assert (= (and b!1443142 (not c!133783)) b!1443135))

(assert (= (and b!1443142 res!974608) b!1443143))

(assert (= (and b!1443143 res!974612) b!1443145))

(declare-fun m!1332445 () Bool)

(assert (=> b!1443141 m!1332445))

(assert (=> b!1443141 m!1332445))

(declare-fun m!1332447 () Bool)

(assert (=> b!1443141 m!1332447))

(declare-fun m!1332449 () Bool)

(assert (=> start!124782 m!1332449))

(declare-fun m!1332451 () Bool)

(assert (=> start!124782 m!1332451))

(declare-fun m!1332453 () Bool)

(assert (=> b!1443134 m!1332453))

(declare-fun m!1332455 () Bool)

(assert (=> b!1443146 m!1332455))

(declare-fun m!1332457 () Bool)

(assert (=> b!1443146 m!1332457))

(declare-fun m!1332459 () Bool)

(assert (=> b!1443137 m!1332459))

(assert (=> b!1443140 m!1332445))

(assert (=> b!1443140 m!1332445))

(declare-fun m!1332461 () Bool)

(assert (=> b!1443140 m!1332461))

(assert (=> b!1443140 m!1332461))

(assert (=> b!1443140 m!1332445))

(declare-fun m!1332463 () Bool)

(assert (=> b!1443140 m!1332463))

(declare-fun m!1332465 () Bool)

(assert (=> b!1443144 m!1332465))

(assert (=> b!1443147 m!1332445))

(assert (=> b!1443147 m!1332445))

(declare-fun m!1332467 () Bool)

(assert (=> b!1443147 m!1332467))

(declare-fun m!1332469 () Bool)

(assert (=> b!1443145 m!1332469))

(declare-fun m!1332471 () Bool)

(assert (=> b!1443145 m!1332471))

(declare-fun m!1332473 () Bool)

(assert (=> b!1443135 m!1332473))

(declare-fun m!1332475 () Bool)

(assert (=> b!1443135 m!1332475))

(declare-fun m!1332477 () Bool)

(assert (=> b!1443138 m!1332477))

(assert (=> b!1443138 m!1332477))

(declare-fun m!1332479 () Bool)

(assert (=> b!1443138 m!1332479))

(assert (=> b!1443138 m!1332455))

(declare-fun m!1332481 () Bool)

(assert (=> b!1443138 m!1332481))

(declare-fun m!1332483 () Bool)

(assert (=> b!1443139 m!1332483))

(assert (=> b!1443139 m!1332483))

(declare-fun m!1332485 () Bool)

(assert (=> b!1443139 m!1332485))

(check-sat (not b!1443134) (not b!1443139) (not b!1443140) (not b!1443137) (not start!124782) (not b!1443145) (not b!1443144) (not b!1443138) (not b!1443141) (not b!1443147) (not b!1443135))
(check-sat)
