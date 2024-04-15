; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126130 () Bool)

(assert start!126130)

(declare-fun b!1477105 () Bool)

(declare-fun res!1003368 () Bool)

(declare-fun e!828664 () Bool)

(assert (=> b!1477105 (=> (not res!1003368) (not e!828664))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1477105 (= res!1003368 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477106 () Bool)

(declare-fun e!828665 () Bool)

(declare-fun e!828661 () Bool)

(assert (=> b!1477106 (= e!828665 e!828661)))

(declare-fun res!1003375 () Bool)

(assert (=> b!1477106 (=> (not res!1003375) (not e!828661))))

(declare-datatypes ((SeekEntryResult!12152 0))(
  ( (MissingZero!12152 (index!51000 (_ BitVec 32))) (Found!12152 (index!51001 (_ BitVec 32))) (Intermediate!12152 (undefined!12964 Bool) (index!51002 (_ BitVec 32)) (x!132594 (_ BitVec 32))) (Undefined!12152) (MissingVacant!12152 (index!51003 (_ BitVec 32))) )
))
(declare-fun lt!645067 () SeekEntryResult!12152)

(declare-datatypes ((array!99214 0))(
  ( (array!99215 (arr!47887 (Array (_ BitVec 32) (_ BitVec 64))) (size!48439 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99214)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99214 (_ BitVec 32)) SeekEntryResult!12152)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477106 (= res!1003375 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47887 a!2862) j!93) mask!2687) (select (arr!47887 a!2862) j!93) a!2862 mask!2687) lt!645067))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1477106 (= lt!645067 (Intermediate!12152 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1477107 () Bool)

(assert (=> b!1477107 (= e!828664 (not true))))

(declare-fun e!828666 () Bool)

(assert (=> b!1477107 e!828666))

(declare-fun res!1003364 () Bool)

(assert (=> b!1477107 (=> (not res!1003364) (not e!828666))))

(declare-fun lt!645070 () SeekEntryResult!12152)

(assert (=> b!1477107 (= res!1003364 (and (= lt!645070 (Found!12152 j!93)) (or (= (select (arr!47887 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47887 a!2862) intermediateBeforeIndex!19) (select (arr!47887 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99214 (_ BitVec 32)) SeekEntryResult!12152)

(assert (=> b!1477107 (= lt!645070 (seekEntryOrOpen!0 (select (arr!47887 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99214 (_ BitVec 32)) Bool)

(assert (=> b!1477107 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49485 0))(
  ( (Unit!49486) )
))
(declare-fun lt!645072 () Unit!49485)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49485)

(assert (=> b!1477107 (= lt!645072 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477108 () Bool)

(declare-fun e!828658 () Bool)

(declare-fun e!828660 () Bool)

(assert (=> b!1477108 (= e!828658 e!828660)))

(declare-fun res!1003372 () Bool)

(assert (=> b!1477108 (=> (not res!1003372) (not e!828660))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99214 (_ BitVec 32)) SeekEntryResult!12152)

(assert (=> b!1477108 (= res!1003372 (= lt!645070 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47887 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477109 () Bool)

(declare-fun res!1003369 () Bool)

(declare-fun e!828662 () Bool)

(assert (=> b!1477109 (=> (not res!1003369) (not e!828662))))

(declare-datatypes ((List!34466 0))(
  ( (Nil!34463) (Cons!34462 (h!35830 (_ BitVec 64)) (t!49152 List!34466)) )
))
(declare-fun arrayNoDuplicates!0 (array!99214 (_ BitVec 32) List!34466) Bool)

(assert (=> b!1477109 (= res!1003369 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34463))))

(declare-fun b!1477110 () Bool)

(declare-fun res!1003365 () Bool)

(assert (=> b!1477110 (=> (not res!1003365) (not e!828664))))

(declare-fun e!828659 () Bool)

(assert (=> b!1477110 (= res!1003365 e!828659)))

(declare-fun c!136393 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1477110 (= c!136393 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477111 () Bool)

(declare-fun res!1003363 () Bool)

(assert (=> b!1477111 (=> (not res!1003363) (not e!828662))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477111 (= res!1003363 (validKeyInArray!0 (select (arr!47887 a!2862) j!93)))))

(declare-fun b!1477112 () Bool)

(declare-fun res!1003377 () Bool)

(assert (=> b!1477112 (=> (not res!1003377) (not e!828662))))

(assert (=> b!1477112 (= res!1003377 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48439 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48439 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48439 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477113 () Bool)

(declare-fun res!1003376 () Bool)

(assert (=> b!1477113 (=> (not res!1003376) (not e!828662))))

(assert (=> b!1477113 (= res!1003376 (validKeyInArray!0 (select (arr!47887 a!2862) i!1006)))))

(declare-fun lt!645068 () array!99214)

(declare-fun b!1477114 () Bool)

(declare-fun lt!645069 () (_ BitVec 64))

(assert (=> b!1477114 (= e!828659 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645069 lt!645068 mask!2687) (seekEntryOrOpen!0 lt!645069 lt!645068 mask!2687)))))

(declare-fun b!1477115 () Bool)

(declare-fun res!1003373 () Bool)

(assert (=> b!1477115 (=> (not res!1003373) (not e!828661))))

(assert (=> b!1477115 (= res!1003373 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47887 a!2862) j!93) a!2862 mask!2687) lt!645067))))

(declare-fun res!1003370 () Bool)

(assert (=> start!126130 (=> (not res!1003370) (not e!828662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126130 (= res!1003370 (validMask!0 mask!2687))))

(assert (=> start!126130 e!828662))

(assert (=> start!126130 true))

(declare-fun array_inv!37120 (array!99214) Bool)

(assert (=> start!126130 (array_inv!37120 a!2862)))

(declare-fun b!1477116 () Bool)

(declare-fun res!1003366 () Bool)

(assert (=> b!1477116 (=> (not res!1003366) (not e!828662))))

(assert (=> b!1477116 (= res!1003366 (and (= (size!48439 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48439 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48439 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477117 () Bool)

(assert (=> b!1477117 (= e!828666 e!828658)))

(declare-fun res!1003374 () Bool)

(assert (=> b!1477117 (=> res!1003374 e!828658)))

(assert (=> b!1477117 (= res!1003374 (or (and (= (select (arr!47887 a!2862) index!646) (select (store (arr!47887 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47887 a!2862) index!646) (select (arr!47887 a!2862) j!93))) (not (= (select (arr!47887 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477118 () Bool)

(assert (=> b!1477118 (= e!828662 e!828665)))

(declare-fun res!1003378 () Bool)

(assert (=> b!1477118 (=> (not res!1003378) (not e!828665))))

(assert (=> b!1477118 (= res!1003378 (= (select (store (arr!47887 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477118 (= lt!645068 (array!99215 (store (arr!47887 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48439 a!2862)))))

(declare-fun b!1477119 () Bool)

(declare-fun res!1003367 () Bool)

(assert (=> b!1477119 (=> (not res!1003367) (not e!828662))))

(assert (=> b!1477119 (= res!1003367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477120 () Bool)

(assert (=> b!1477120 (= e!828661 e!828664)))

(declare-fun res!1003371 () Bool)

(assert (=> b!1477120 (=> (not res!1003371) (not e!828664))))

(declare-fun lt!645071 () SeekEntryResult!12152)

(assert (=> b!1477120 (= res!1003371 (= lt!645071 (Intermediate!12152 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1477120 (= lt!645071 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645069 mask!2687) lt!645069 lt!645068 mask!2687))))

(assert (=> b!1477120 (= lt!645069 (select (store (arr!47887 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1477121 () Bool)

(assert (=> b!1477121 (= e!828659 (= lt!645071 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645069 lt!645068 mask!2687)))))

(declare-fun b!1477122 () Bool)

(assert (=> b!1477122 (= e!828660 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!126130 res!1003370) b!1477116))

(assert (= (and b!1477116 res!1003366) b!1477113))

(assert (= (and b!1477113 res!1003376) b!1477111))

(assert (= (and b!1477111 res!1003363) b!1477119))

(assert (= (and b!1477119 res!1003367) b!1477109))

(assert (= (and b!1477109 res!1003369) b!1477112))

(assert (= (and b!1477112 res!1003377) b!1477118))

(assert (= (and b!1477118 res!1003378) b!1477106))

(assert (= (and b!1477106 res!1003375) b!1477115))

(assert (= (and b!1477115 res!1003373) b!1477120))

(assert (= (and b!1477120 res!1003371) b!1477110))

(assert (= (and b!1477110 c!136393) b!1477121))

(assert (= (and b!1477110 (not c!136393)) b!1477114))

(assert (= (and b!1477110 res!1003365) b!1477105))

(assert (= (and b!1477105 res!1003368) b!1477107))

(assert (= (and b!1477107 res!1003364) b!1477117))

(assert (= (and b!1477117 (not res!1003374)) b!1477108))

(assert (= (and b!1477108 res!1003372) b!1477122))

(declare-fun m!1362579 () Bool)

(assert (=> b!1477119 m!1362579))

(declare-fun m!1362581 () Bool)

(assert (=> b!1477117 m!1362581))

(declare-fun m!1362583 () Bool)

(assert (=> b!1477117 m!1362583))

(declare-fun m!1362585 () Bool)

(assert (=> b!1477117 m!1362585))

(declare-fun m!1362587 () Bool)

(assert (=> b!1477117 m!1362587))

(declare-fun m!1362589 () Bool)

(assert (=> b!1477114 m!1362589))

(declare-fun m!1362591 () Bool)

(assert (=> b!1477114 m!1362591))

(declare-fun m!1362593 () Bool)

(assert (=> b!1477113 m!1362593))

(assert (=> b!1477113 m!1362593))

(declare-fun m!1362595 () Bool)

(assert (=> b!1477113 m!1362595))

(assert (=> b!1477106 m!1362587))

(assert (=> b!1477106 m!1362587))

(declare-fun m!1362597 () Bool)

(assert (=> b!1477106 m!1362597))

(assert (=> b!1477106 m!1362597))

(assert (=> b!1477106 m!1362587))

(declare-fun m!1362599 () Bool)

(assert (=> b!1477106 m!1362599))

(declare-fun m!1362601 () Bool)

(assert (=> b!1477120 m!1362601))

(assert (=> b!1477120 m!1362601))

(declare-fun m!1362603 () Bool)

(assert (=> b!1477120 m!1362603))

(assert (=> b!1477120 m!1362583))

(declare-fun m!1362605 () Bool)

(assert (=> b!1477120 m!1362605))

(declare-fun m!1362607 () Bool)

(assert (=> start!126130 m!1362607))

(declare-fun m!1362609 () Bool)

(assert (=> start!126130 m!1362609))

(declare-fun m!1362611 () Bool)

(assert (=> b!1477107 m!1362611))

(declare-fun m!1362613 () Bool)

(assert (=> b!1477107 m!1362613))

(assert (=> b!1477107 m!1362587))

(declare-fun m!1362615 () Bool)

(assert (=> b!1477107 m!1362615))

(declare-fun m!1362617 () Bool)

(assert (=> b!1477107 m!1362617))

(assert (=> b!1477107 m!1362587))

(assert (=> b!1477115 m!1362587))

(assert (=> b!1477115 m!1362587))

(declare-fun m!1362619 () Bool)

(assert (=> b!1477115 m!1362619))

(assert (=> b!1477118 m!1362583))

(declare-fun m!1362621 () Bool)

(assert (=> b!1477118 m!1362621))

(declare-fun m!1362623 () Bool)

(assert (=> b!1477109 m!1362623))

(declare-fun m!1362625 () Bool)

(assert (=> b!1477121 m!1362625))

(assert (=> b!1477111 m!1362587))

(assert (=> b!1477111 m!1362587))

(declare-fun m!1362627 () Bool)

(assert (=> b!1477111 m!1362627))

(assert (=> b!1477108 m!1362587))

(assert (=> b!1477108 m!1362587))

(declare-fun m!1362629 () Bool)

(assert (=> b!1477108 m!1362629))

(check-sat (not b!1477111) (not b!1477107) (not b!1477106) (not b!1477114) (not b!1477119) (not b!1477108) (not b!1477120) (not b!1477113) (not b!1477121) (not b!1477109) (not start!126130) (not b!1477115))
(check-sat)
