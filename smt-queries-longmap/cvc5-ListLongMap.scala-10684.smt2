; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125242 () Bool)

(assert start!125242)

(declare-fun b!1461459 () Bool)

(declare-fun res!991073 () Bool)

(declare-fun e!821621 () Bool)

(assert (=> b!1461459 (=> (not res!991073) (not e!821621))))

(declare-datatypes ((array!98690 0))(
  ( (array!98691 (arr!47633 (Array (_ BitVec 32) (_ BitVec 64))) (size!48183 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98690)

(declare-datatypes ((List!34134 0))(
  ( (Nil!34131) (Cons!34130 (h!35480 (_ BitVec 64)) (t!48828 List!34134)) )
))
(declare-fun arrayNoDuplicates!0 (array!98690 (_ BitVec 32) List!34134) Bool)

(assert (=> b!1461459 (= res!991073 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34131))))

(declare-fun b!1461461 () Bool)

(declare-fun res!991081 () Bool)

(assert (=> b!1461461 (=> (not res!991081) (not e!821621))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461461 (= res!991081 (validKeyInArray!0 (select (arr!47633 a!2862) i!1006)))))

(declare-fun b!1461462 () Bool)

(declare-fun res!991074 () Bool)

(declare-fun e!821627 () Bool)

(assert (=> b!1461462 (=> (not res!991074) (not e!821627))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11885 0))(
  ( (MissingZero!11885 (index!49932 (_ BitVec 32))) (Found!11885 (index!49933 (_ BitVec 32))) (Intermediate!11885 (undefined!12697 Bool) (index!49934 (_ BitVec 32)) (x!131534 (_ BitVec 32))) (Undefined!11885) (MissingVacant!11885 (index!49935 (_ BitVec 32))) )
))
(declare-fun lt!640142 () SeekEntryResult!11885)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98690 (_ BitVec 32)) SeekEntryResult!11885)

(assert (=> b!1461462 (= res!991074 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47633 a!2862) j!93) a!2862 mask!2687) lt!640142))))

(declare-fun b!1461463 () Bool)

(declare-fun e!821629 () Bool)

(assert (=> b!1461463 (= e!821629 e!821627)))

(declare-fun res!991070 () Bool)

(assert (=> b!1461463 (=> (not res!991070) (not e!821627))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461463 (= res!991070 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47633 a!2862) j!93) mask!2687) (select (arr!47633 a!2862) j!93) a!2862 mask!2687) lt!640142))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1461463 (= lt!640142 (Intermediate!11885 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461464 () Bool)

(declare-fun res!991086 () Bool)

(assert (=> b!1461464 (=> (not res!991086) (not e!821621))))

(assert (=> b!1461464 (= res!991086 (and (= (size!48183 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48183 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48183 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461465 () Bool)

(declare-fun e!821623 () Bool)

(assert (=> b!1461465 (= e!821627 e!821623)))

(declare-fun res!991076 () Bool)

(assert (=> b!1461465 (=> (not res!991076) (not e!821623))))

(declare-fun lt!640139 () SeekEntryResult!11885)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1461465 (= res!991076 (= lt!640139 (Intermediate!11885 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!640143 () (_ BitVec 64))

(declare-fun lt!640137 () array!98690)

(assert (=> b!1461465 (= lt!640139 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640143 mask!2687) lt!640143 lt!640137 mask!2687))))

(assert (=> b!1461465 (= lt!640143 (select (store (arr!47633 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461466 () Bool)

(declare-fun res!991080 () Bool)

(assert (=> b!1461466 (=> (not res!991080) (not e!821621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98690 (_ BitVec 32)) Bool)

(assert (=> b!1461466 (= res!991080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461467 () Bool)

(declare-fun res!991084 () Bool)

(declare-fun e!821622 () Bool)

(assert (=> b!1461467 (=> (not res!991084) (not e!821622))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98690 (_ BitVec 32)) SeekEntryResult!11885)

(assert (=> b!1461467 (= res!991084 (= (seekEntryOrOpen!0 (select (arr!47633 a!2862) j!93) a!2862 mask!2687) (Found!11885 j!93)))))

(declare-fun b!1461468 () Bool)

(declare-fun res!991071 () Bool)

(assert (=> b!1461468 (=> (not res!991071) (not e!821621))))

(assert (=> b!1461468 (= res!991071 (validKeyInArray!0 (select (arr!47633 a!2862) j!93)))))

(declare-fun b!1461469 () Bool)

(declare-fun e!821630 () Bool)

(assert (=> b!1461469 (= e!821623 (not e!821630))))

(declare-fun res!991075 () Bool)

(assert (=> b!1461469 (=> res!991075 e!821630)))

(assert (=> b!1461469 (= res!991075 (or (and (= (select (arr!47633 a!2862) index!646) (select (store (arr!47633 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47633 a!2862) index!646) (select (arr!47633 a!2862) j!93))) (= (select (arr!47633 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1461469 e!821622))

(declare-fun res!991083 () Bool)

(assert (=> b!1461469 (=> (not res!991083) (not e!821622))))

(assert (=> b!1461469 (= res!991083 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49266 0))(
  ( (Unit!49267) )
))
(declare-fun lt!640138 () Unit!49266)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98690 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49266)

(assert (=> b!1461469 (= lt!640138 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461470 () Bool)

(assert (=> b!1461470 (= e!821622 (or (= (select (arr!47633 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47633 a!2862) intermediateBeforeIndex!19) (select (arr!47633 a!2862) j!93))))))

(declare-fun b!1461471 () Bool)

(declare-fun res!991077 () Bool)

(assert (=> b!1461471 (=> (not res!991077) (not e!821621))))

(assert (=> b!1461471 (= res!991077 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48183 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48183 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48183 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461472 () Bool)

(declare-fun e!821626 () Bool)

(assert (=> b!1461472 (= e!821630 e!821626)))

(declare-fun res!991078 () Bool)

(assert (=> b!1461472 (=> res!991078 e!821626)))

(declare-fun lt!640140 () (_ BitVec 32))

(assert (=> b!1461472 (= res!991078 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640140 #b00000000000000000000000000000000) (bvsge lt!640140 (size!48183 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461472 (= lt!640140 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1461473 () Bool)

(declare-fun e!821625 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98690 (_ BitVec 32)) SeekEntryResult!11885)

(assert (=> b!1461473 (= e!821625 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640143 lt!640137 mask!2687) (seekEntryOrOpen!0 lt!640143 lt!640137 mask!2687)))))

(declare-fun b!1461474 () Bool)

(assert (=> b!1461474 (= e!821625 (= lt!640139 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640143 lt!640137 mask!2687)))))

(declare-fun b!1461460 () Bool)

(assert (=> b!1461460 (= e!821621 e!821629)))

(declare-fun res!991072 () Bool)

(assert (=> b!1461460 (=> (not res!991072) (not e!821629))))

(assert (=> b!1461460 (= res!991072 (= (select (store (arr!47633 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461460 (= lt!640137 (array!98691 (store (arr!47633 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48183 a!2862)))))

(declare-fun res!991079 () Bool)

(assert (=> start!125242 (=> (not res!991079) (not e!821621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125242 (= res!991079 (validMask!0 mask!2687))))

(assert (=> start!125242 e!821621))

(assert (=> start!125242 true))

(declare-fun array_inv!36661 (array!98690) Bool)

(assert (=> start!125242 (array_inv!36661 a!2862)))

(declare-fun b!1461475 () Bool)

(declare-fun res!991087 () Bool)

(assert (=> b!1461475 (=> (not res!991087) (not e!821623))))

(assert (=> b!1461475 (= res!991087 e!821625)))

(declare-fun c!134706 () Bool)

(assert (=> b!1461475 (= c!134706 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461476 () Bool)

(declare-fun res!991085 () Bool)

(assert (=> b!1461476 (=> (not res!991085) (not e!821623))))

(assert (=> b!1461476 (= res!991085 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1461477 () Bool)

(declare-fun e!821624 () Bool)

(assert (=> b!1461477 (= e!821624 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640140 intermediateAfterIndex!19 lt!640143 lt!640137 mask!2687) (seekEntryOrOpen!0 lt!640143 lt!640137 mask!2687))))))

(declare-fun b!1461478 () Bool)

(assert (=> b!1461478 (= e!821624 (not (= lt!640139 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640140 lt!640143 lt!640137 mask!2687))))))

(declare-fun b!1461479 () Bool)

(assert (=> b!1461479 (= e!821626 true)))

(declare-fun lt!640141 () Bool)

(assert (=> b!1461479 (= lt!640141 e!821624)))

(declare-fun c!134705 () Bool)

(assert (=> b!1461479 (= c!134705 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461480 () Bool)

(declare-fun res!991082 () Bool)

(assert (=> b!1461480 (=> res!991082 e!821626)))

(assert (=> b!1461480 (= res!991082 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640140 (select (arr!47633 a!2862) j!93) a!2862 mask!2687) lt!640142)))))

(assert (= (and start!125242 res!991079) b!1461464))

(assert (= (and b!1461464 res!991086) b!1461461))

(assert (= (and b!1461461 res!991081) b!1461468))

(assert (= (and b!1461468 res!991071) b!1461466))

(assert (= (and b!1461466 res!991080) b!1461459))

(assert (= (and b!1461459 res!991073) b!1461471))

(assert (= (and b!1461471 res!991077) b!1461460))

(assert (= (and b!1461460 res!991072) b!1461463))

(assert (= (and b!1461463 res!991070) b!1461462))

(assert (= (and b!1461462 res!991074) b!1461465))

(assert (= (and b!1461465 res!991076) b!1461475))

(assert (= (and b!1461475 c!134706) b!1461474))

(assert (= (and b!1461475 (not c!134706)) b!1461473))

(assert (= (and b!1461475 res!991087) b!1461476))

(assert (= (and b!1461476 res!991085) b!1461469))

(assert (= (and b!1461469 res!991083) b!1461467))

(assert (= (and b!1461467 res!991084) b!1461470))

(assert (= (and b!1461469 (not res!991075)) b!1461472))

(assert (= (and b!1461472 (not res!991078)) b!1461480))

(assert (= (and b!1461480 (not res!991082)) b!1461479))

(assert (= (and b!1461479 c!134705) b!1461478))

(assert (= (and b!1461479 (not c!134705)) b!1461477))

(declare-fun m!1349035 () Bool)

(assert (=> b!1461462 m!1349035))

(assert (=> b!1461462 m!1349035))

(declare-fun m!1349037 () Bool)

(assert (=> b!1461462 m!1349037))

(declare-fun m!1349039 () Bool)

(assert (=> b!1461470 m!1349039))

(assert (=> b!1461470 m!1349035))

(declare-fun m!1349041 () Bool)

(assert (=> b!1461477 m!1349041))

(declare-fun m!1349043 () Bool)

(assert (=> b!1461477 m!1349043))

(declare-fun m!1349045 () Bool)

(assert (=> b!1461461 m!1349045))

(assert (=> b!1461461 m!1349045))

(declare-fun m!1349047 () Bool)

(assert (=> b!1461461 m!1349047))

(assert (=> b!1461467 m!1349035))

(assert (=> b!1461467 m!1349035))

(declare-fun m!1349049 () Bool)

(assert (=> b!1461467 m!1349049))

(declare-fun m!1349051 () Bool)

(assert (=> b!1461466 m!1349051))

(declare-fun m!1349053 () Bool)

(assert (=> b!1461459 m!1349053))

(assert (=> b!1461463 m!1349035))

(assert (=> b!1461463 m!1349035))

(declare-fun m!1349055 () Bool)

(assert (=> b!1461463 m!1349055))

(assert (=> b!1461463 m!1349055))

(assert (=> b!1461463 m!1349035))

(declare-fun m!1349057 () Bool)

(assert (=> b!1461463 m!1349057))

(declare-fun m!1349059 () Bool)

(assert (=> b!1461478 m!1349059))

(declare-fun m!1349061 () Bool)

(assert (=> b!1461460 m!1349061))

(declare-fun m!1349063 () Bool)

(assert (=> b!1461460 m!1349063))

(assert (=> b!1461480 m!1349035))

(assert (=> b!1461480 m!1349035))

(declare-fun m!1349065 () Bool)

(assert (=> b!1461480 m!1349065))

(declare-fun m!1349067 () Bool)

(assert (=> b!1461465 m!1349067))

(assert (=> b!1461465 m!1349067))

(declare-fun m!1349069 () Bool)

(assert (=> b!1461465 m!1349069))

(assert (=> b!1461465 m!1349061))

(declare-fun m!1349071 () Bool)

(assert (=> b!1461465 m!1349071))

(declare-fun m!1349073 () Bool)

(assert (=> b!1461474 m!1349073))

(declare-fun m!1349075 () Bool)

(assert (=> b!1461473 m!1349075))

(assert (=> b!1461473 m!1349043))

(declare-fun m!1349077 () Bool)

(assert (=> b!1461472 m!1349077))

(assert (=> b!1461468 m!1349035))

(assert (=> b!1461468 m!1349035))

(declare-fun m!1349079 () Bool)

(assert (=> b!1461468 m!1349079))

(declare-fun m!1349081 () Bool)

(assert (=> b!1461469 m!1349081))

(assert (=> b!1461469 m!1349061))

(declare-fun m!1349083 () Bool)

(assert (=> b!1461469 m!1349083))

(declare-fun m!1349085 () Bool)

(assert (=> b!1461469 m!1349085))

(declare-fun m!1349087 () Bool)

(assert (=> b!1461469 m!1349087))

(assert (=> b!1461469 m!1349035))

(declare-fun m!1349089 () Bool)

(assert (=> start!125242 m!1349089))

(declare-fun m!1349091 () Bool)

(assert (=> start!125242 m!1349091))

(push 1)

