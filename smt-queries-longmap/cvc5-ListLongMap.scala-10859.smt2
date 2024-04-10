; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127198 () Bool)

(assert start!127198)

(declare-fun b!1495008 () Bool)

(declare-fun e!837399 () Bool)

(declare-fun e!837398 () Bool)

(assert (=> b!1495008 (= e!837399 e!837398)))

(declare-fun res!1017085 () Bool)

(assert (=> b!1495008 (=> (not res!1017085) (not e!837398))))

(declare-datatypes ((SeekEntryResult!12398 0))(
  ( (MissingZero!12398 (index!51984 (_ BitVec 32))) (Found!12398 (index!51985 (_ BitVec 32))) (Intermediate!12398 (undefined!13210 Bool) (index!51986 (_ BitVec 32)) (x!133594 (_ BitVec 32))) (Undefined!12398) (MissingVacant!12398 (index!51987 (_ BitVec 32))) )
))
(declare-fun lt!651590 () SeekEntryResult!12398)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1495008 (= res!1017085 (= lt!651590 (Intermediate!12398 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!99782 0))(
  ( (array!99783 (arr!48158 (Array (_ BitVec 32) (_ BitVec 64))) (size!48708 (_ BitVec 32))) )
))
(declare-fun lt!651588 () array!99782)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!651591 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99782 (_ BitVec 32)) SeekEntryResult!12398)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495008 (= lt!651590 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651591 mask!2687) lt!651591 lt!651588 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99782)

(assert (=> b!1495008 (= lt!651591 (select (store (arr!48158 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!837396 () Bool)

(declare-fun b!1495009 () Bool)

(assert (=> b!1495009 (= e!837396 (or (= (select (arr!48158 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48158 a!2862) intermediateBeforeIndex!19) (select (arr!48158 a!2862) j!93))))))

(declare-fun b!1495010 () Bool)

(declare-fun res!1017071 () Bool)

(declare-fun e!837401 () Bool)

(assert (=> b!1495010 (=> (not res!1017071) (not e!837401))))

(assert (=> b!1495010 (= res!1017071 (and (= (size!48708 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48708 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48708 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1017086 () Bool)

(assert (=> start!127198 (=> (not res!1017086) (not e!837401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127198 (= res!1017086 (validMask!0 mask!2687))))

(assert (=> start!127198 e!837401))

(assert (=> start!127198 true))

(declare-fun array_inv!37186 (array!99782) Bool)

(assert (=> start!127198 (array_inv!37186 a!2862)))

(declare-fun b!1495011 () Bool)

(declare-fun res!1017076 () Bool)

(assert (=> b!1495011 (=> (not res!1017076) (not e!837401))))

(declare-datatypes ((List!34659 0))(
  ( (Nil!34656) (Cons!34655 (h!36047 (_ BitVec 64)) (t!49353 List!34659)) )
))
(declare-fun arrayNoDuplicates!0 (array!99782 (_ BitVec 32) List!34659) Bool)

(assert (=> b!1495011 (= res!1017076 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34656))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1495012 () Bool)

(declare-fun e!837397 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1495012 (= e!837397 (= lt!651590 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651591 lt!651588 mask!2687)))))

(declare-fun b!1495013 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99782 (_ BitVec 32)) SeekEntryResult!12398)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99782 (_ BitVec 32)) SeekEntryResult!12398)

(assert (=> b!1495013 (= e!837397 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651591 lt!651588 mask!2687) (seekEntryOrOpen!0 lt!651591 lt!651588 mask!2687)))))

(declare-fun b!1495014 () Bool)

(declare-fun res!1017084 () Bool)

(assert (=> b!1495014 (=> (not res!1017084) (not e!837401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1495014 (= res!1017084 (validKeyInArray!0 (select (arr!48158 a!2862) i!1006)))))

(declare-fun b!1495015 () Bool)

(declare-fun res!1017077 () Bool)

(assert (=> b!1495015 (=> (not res!1017077) (not e!837401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99782 (_ BitVec 32)) Bool)

(assert (=> b!1495015 (= res!1017077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1495016 () Bool)

(declare-fun res!1017080 () Bool)

(assert (=> b!1495016 (=> (not res!1017080) (not e!837396))))

(assert (=> b!1495016 (= res!1017080 (= (seekEntryOrOpen!0 (select (arr!48158 a!2862) j!93) a!2862 mask!2687) (Found!12398 j!93)))))

(declare-fun b!1495017 () Bool)

(declare-fun e!837400 () Bool)

(declare-fun e!837392 () Bool)

(assert (=> b!1495017 (= e!837400 e!837392)))

(declare-fun res!1017073 () Bool)

(assert (=> b!1495017 (=> res!1017073 e!837392)))

(declare-fun lt!651586 () (_ BitVec 32))

(assert (=> b!1495017 (= res!1017073 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651586 #b00000000000000000000000000000000) (bvsge lt!651586 (size!48708 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495017 (= lt!651586 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun e!837394 () Bool)

(declare-fun b!1495018 () Bool)

(assert (=> b!1495018 (= e!837394 (= lt!651590 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651586 lt!651591 lt!651588 mask!2687)))))

(declare-fun b!1495019 () Bool)

(declare-fun e!837395 () Bool)

(assert (=> b!1495019 (= e!837395 e!837399)))

(declare-fun res!1017082 () Bool)

(assert (=> b!1495019 (=> (not res!1017082) (not e!837399))))

(declare-fun lt!651587 () SeekEntryResult!12398)

(assert (=> b!1495019 (= res!1017082 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48158 a!2862) j!93) mask!2687) (select (arr!48158 a!2862) j!93) a!2862 mask!2687) lt!651587))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1495019 (= lt!651587 (Intermediate!12398 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1495020 () Bool)

(declare-fun res!1017081 () Bool)

(assert (=> b!1495020 (=> (not res!1017081) (not e!837398))))

(assert (=> b!1495020 (= res!1017081 e!837397)))

(declare-fun c!138501 () Bool)

(assert (=> b!1495020 (= c!138501 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1495021 () Bool)

(declare-fun res!1017087 () Bool)

(assert (=> b!1495021 (=> res!1017087 e!837392)))

(assert (=> b!1495021 (= res!1017087 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651586 (select (arr!48158 a!2862) j!93) a!2862 mask!2687) lt!651587)))))

(declare-fun b!1495022 () Bool)

(assert (=> b!1495022 (= e!837394 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651586 intermediateAfterIndex!19 lt!651591 lt!651588 mask!2687) (seekEntryOrOpen!0 lt!651591 lt!651588 mask!2687)))))

(declare-fun b!1495023 () Bool)

(assert (=> b!1495023 (= e!837401 e!837395)))

(declare-fun res!1017074 () Bool)

(assert (=> b!1495023 (=> (not res!1017074) (not e!837395))))

(assert (=> b!1495023 (= res!1017074 (= (select (store (arr!48158 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495023 (= lt!651588 (array!99783 (store (arr!48158 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48708 a!2862)))))

(declare-fun b!1495024 () Bool)

(assert (=> b!1495024 (= e!837398 (not e!837400))))

(declare-fun res!1017078 () Bool)

(assert (=> b!1495024 (=> res!1017078 e!837400)))

(assert (=> b!1495024 (= res!1017078 (or (and (= (select (arr!48158 a!2862) index!646) (select (store (arr!48158 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48158 a!2862) index!646) (select (arr!48158 a!2862) j!93))) (= (select (arr!48158 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1495024 e!837396))

(declare-fun res!1017072 () Bool)

(assert (=> b!1495024 (=> (not res!1017072) (not e!837396))))

(assert (=> b!1495024 (= res!1017072 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50136 0))(
  ( (Unit!50137) )
))
(declare-fun lt!651589 () Unit!50136)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50136)

(assert (=> b!1495024 (= lt!651589 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1495025 () Bool)

(declare-fun res!1017075 () Bool)

(assert (=> b!1495025 (=> (not res!1017075) (not e!837401))))

(assert (=> b!1495025 (= res!1017075 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48708 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48708 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48708 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1495026 () Bool)

(declare-fun res!1017088 () Bool)

(assert (=> b!1495026 (=> (not res!1017088) (not e!837401))))

(assert (=> b!1495026 (= res!1017088 (validKeyInArray!0 (select (arr!48158 a!2862) j!93)))))

(declare-fun b!1495027 () Bool)

(assert (=> b!1495027 (= e!837392 e!837394)))

(declare-fun c!138500 () Bool)

(assert (=> b!1495027 (= c!138500 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1495028 () Bool)

(declare-fun res!1017083 () Bool)

(assert (=> b!1495028 (=> (not res!1017083) (not e!837399))))

(assert (=> b!1495028 (= res!1017083 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48158 a!2862) j!93) a!2862 mask!2687) lt!651587))))

(declare-fun b!1495029 () Bool)

(declare-fun res!1017079 () Bool)

(assert (=> b!1495029 (=> (not res!1017079) (not e!837398))))

(assert (=> b!1495029 (= res!1017079 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!127198 res!1017086) b!1495010))

(assert (= (and b!1495010 res!1017071) b!1495014))

(assert (= (and b!1495014 res!1017084) b!1495026))

(assert (= (and b!1495026 res!1017088) b!1495015))

(assert (= (and b!1495015 res!1017077) b!1495011))

(assert (= (and b!1495011 res!1017076) b!1495025))

(assert (= (and b!1495025 res!1017075) b!1495023))

(assert (= (and b!1495023 res!1017074) b!1495019))

(assert (= (and b!1495019 res!1017082) b!1495028))

(assert (= (and b!1495028 res!1017083) b!1495008))

(assert (= (and b!1495008 res!1017085) b!1495020))

(assert (= (and b!1495020 c!138501) b!1495012))

(assert (= (and b!1495020 (not c!138501)) b!1495013))

(assert (= (and b!1495020 res!1017081) b!1495029))

(assert (= (and b!1495029 res!1017079) b!1495024))

(assert (= (and b!1495024 res!1017072) b!1495016))

(assert (= (and b!1495016 res!1017080) b!1495009))

(assert (= (and b!1495024 (not res!1017078)) b!1495017))

(assert (= (and b!1495017 (not res!1017073)) b!1495021))

(assert (= (and b!1495021 (not res!1017087)) b!1495027))

(assert (= (and b!1495027 c!138500) b!1495018))

(assert (= (and b!1495027 (not c!138500)) b!1495022))

(declare-fun m!1378585 () Bool)

(assert (=> b!1495024 m!1378585))

(declare-fun m!1378587 () Bool)

(assert (=> b!1495024 m!1378587))

(declare-fun m!1378589 () Bool)

(assert (=> b!1495024 m!1378589))

(declare-fun m!1378591 () Bool)

(assert (=> b!1495024 m!1378591))

(declare-fun m!1378593 () Bool)

(assert (=> b!1495024 m!1378593))

(declare-fun m!1378595 () Bool)

(assert (=> b!1495024 m!1378595))

(declare-fun m!1378597 () Bool)

(assert (=> b!1495009 m!1378597))

(assert (=> b!1495009 m!1378595))

(assert (=> b!1495023 m!1378587))

(declare-fun m!1378599 () Bool)

(assert (=> b!1495023 m!1378599))

(declare-fun m!1378601 () Bool)

(assert (=> b!1495017 m!1378601))

(declare-fun m!1378603 () Bool)

(assert (=> b!1495022 m!1378603))

(declare-fun m!1378605 () Bool)

(assert (=> b!1495022 m!1378605))

(assert (=> b!1495019 m!1378595))

(assert (=> b!1495019 m!1378595))

(declare-fun m!1378607 () Bool)

(assert (=> b!1495019 m!1378607))

(assert (=> b!1495019 m!1378607))

(assert (=> b!1495019 m!1378595))

(declare-fun m!1378609 () Bool)

(assert (=> b!1495019 m!1378609))

(declare-fun m!1378611 () Bool)

(assert (=> b!1495012 m!1378611))

(assert (=> b!1495026 m!1378595))

(assert (=> b!1495026 m!1378595))

(declare-fun m!1378613 () Bool)

(assert (=> b!1495026 m!1378613))

(assert (=> b!1495021 m!1378595))

(assert (=> b!1495021 m!1378595))

(declare-fun m!1378615 () Bool)

(assert (=> b!1495021 m!1378615))

(declare-fun m!1378617 () Bool)

(assert (=> b!1495013 m!1378617))

(assert (=> b!1495013 m!1378605))

(declare-fun m!1378619 () Bool)

(assert (=> b!1495014 m!1378619))

(assert (=> b!1495014 m!1378619))

(declare-fun m!1378621 () Bool)

(assert (=> b!1495014 m!1378621))

(assert (=> b!1495028 m!1378595))

(assert (=> b!1495028 m!1378595))

(declare-fun m!1378623 () Bool)

(assert (=> b!1495028 m!1378623))

(declare-fun m!1378625 () Bool)

(assert (=> b!1495015 m!1378625))

(declare-fun m!1378627 () Bool)

(assert (=> b!1495018 m!1378627))

(declare-fun m!1378629 () Bool)

(assert (=> start!127198 m!1378629))

(declare-fun m!1378631 () Bool)

(assert (=> start!127198 m!1378631))

(assert (=> b!1495016 m!1378595))

(assert (=> b!1495016 m!1378595))

(declare-fun m!1378633 () Bool)

(assert (=> b!1495016 m!1378633))

(declare-fun m!1378635 () Bool)

(assert (=> b!1495008 m!1378635))

(assert (=> b!1495008 m!1378635))

(declare-fun m!1378637 () Bool)

(assert (=> b!1495008 m!1378637))

(assert (=> b!1495008 m!1378587))

(declare-fun m!1378639 () Bool)

(assert (=> b!1495008 m!1378639))

(declare-fun m!1378641 () Bool)

(assert (=> b!1495011 m!1378641))

(push 1)

(assert (not b!1495018))

(assert (not b!1495012))

(assert (not b!1495011))

(assert (not b!1495022))

(assert (not b!1495019))

(assert (not b!1495028))

(assert (not b!1495021))

(assert (not b!1495014))

(assert (not b!1495026))

(assert (not b!1495017))

(assert (not b!1495008))

(assert (not start!127198))

(assert (not b!1495015))

(assert (not b!1495013))

(assert (not b!1495024))

(assert (not b!1495016))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1495283 () Bool)

(declare-fun e!837539 () Bool)

(declare-fun e!837536 () Bool)

(assert (=> b!1495283 (= e!837539 e!837536)))

(declare-fun res!1017246 () Bool)

(declare-fun lt!651675 () SeekEntryResult!12398)

(assert (=> b!1495283 (= res!1017246 (and (is-Intermediate!12398 lt!651675) (not (undefined!13210 lt!651675)) (bvslt (x!133594 lt!651675) #b01111111111111111111111111111110) (bvsge (x!133594 lt!651675) #b00000000000000000000000000000000) (bvsge (x!133594 lt!651675) #b00000000000000000000000000000000)))))

(assert (=> b!1495283 (=> (not res!1017246) (not e!837536))))

(declare-fun b!1495284 () Bool)

(declare-fun e!837540 () SeekEntryResult!12398)

(assert (=> b!1495284 (= e!837540 (Intermediate!12398 true (toIndex!0 lt!651591 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1495285 () Bool)

(assert (=> b!1495285 (= e!837539 (bvsge (x!133594 lt!651675) #b01111111111111111111111111111110))))

(declare-fun b!1495286 () Bool)

(assert (=> b!1495286 (and (bvsge (index!51986 lt!651675) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651675) (size!48708 lt!651588)))))

(declare-fun res!1017245 () Bool)

(assert (=> b!1495286 (= res!1017245 (= (select (arr!48158 lt!651588) (index!51986 lt!651675)) lt!651591))))

(declare-fun e!837537 () Bool)

(assert (=> b!1495286 (=> res!1017245 e!837537)))

(assert (=> b!1495286 (= e!837536 e!837537)))

(declare-fun b!1495287 () Bool)

(declare-fun e!837538 () SeekEntryResult!12398)

(assert (=> b!1495287 (= e!837538 (Intermediate!12398 false (toIndex!0 lt!651591 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1495288 () Bool)

(assert (=> b!1495288 (and (bvsge (index!51986 lt!651675) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651675) (size!48708 lt!651588)))))

(declare-fun res!1017247 () Bool)

(assert (=> b!1495288 (= res!1017247 (= (select (arr!48158 lt!651588) (index!51986 lt!651675)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495288 (=> res!1017247 e!837537)))

(declare-fun b!1495289 () Bool)

(assert (=> b!1495289 (= e!837538 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!651591 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!651591 lt!651588 mask!2687))))

(declare-fun d!157199 () Bool)

(assert (=> d!157199 e!837539))

(declare-fun c!138552 () Bool)

(assert (=> d!157199 (= c!138552 (and (is-Intermediate!12398 lt!651675) (undefined!13210 lt!651675)))))

(assert (=> d!157199 (= lt!651675 e!837540)))

(declare-fun c!138553 () Bool)

(assert (=> d!157199 (= c!138553 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!651676 () (_ BitVec 64))

(assert (=> d!157199 (= lt!651676 (select (arr!48158 lt!651588) (toIndex!0 lt!651591 mask!2687)))))

(assert (=> d!157199 (validMask!0 mask!2687)))

(assert (=> d!157199 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651591 mask!2687) lt!651591 lt!651588 mask!2687) lt!651675)))

(declare-fun b!1495290 () Bool)

(assert (=> b!1495290 (and (bvsge (index!51986 lt!651675) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651675) (size!48708 lt!651588)))))

(assert (=> b!1495290 (= e!837537 (= (select (arr!48158 lt!651588) (index!51986 lt!651675)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495291 () Bool)

(assert (=> b!1495291 (= e!837540 e!837538)))

(declare-fun c!138551 () Bool)

(assert (=> b!1495291 (= c!138551 (or (= lt!651676 lt!651591) (= (bvadd lt!651676 lt!651676) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!157199 c!138553) b!1495284))

(assert (= (and d!157199 (not c!138553)) b!1495291))

(assert (= (and b!1495291 c!138551) b!1495287))

(assert (= (and b!1495291 (not c!138551)) b!1495289))

(assert (= (and d!157199 c!138552) b!1495285))

(assert (= (and d!157199 (not c!138552)) b!1495283))

(assert (= (and b!1495283 res!1017246) b!1495286))

(assert (= (and b!1495286 (not res!1017245)) b!1495288))

(assert (= (and b!1495288 (not res!1017247)) b!1495290))

(assert (=> b!1495289 m!1378635))

(declare-fun m!1378823 () Bool)

(assert (=> b!1495289 m!1378823))

(assert (=> b!1495289 m!1378823))

(declare-fun m!1378825 () Bool)

(assert (=> b!1495289 m!1378825))

(assert (=> d!157199 m!1378635))

(declare-fun m!1378827 () Bool)

(assert (=> d!157199 m!1378827))

(assert (=> d!157199 m!1378629))

(declare-fun m!1378829 () Bool)

(assert (=> b!1495286 m!1378829))

(assert (=> b!1495290 m!1378829))

(assert (=> b!1495288 m!1378829))

(assert (=> b!1495008 d!157199))

(declare-fun d!157215 () Bool)

(declare-fun lt!651696 () (_ BitVec 32))

(declare-fun lt!651695 () (_ BitVec 32))

(assert (=> d!157215 (= lt!651696 (bvmul (bvxor lt!651695 (bvlshr lt!651695 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157215 (= lt!651695 ((_ extract 31 0) (bvand (bvxor lt!651591 (bvlshr lt!651591 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157215 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1017248 (let ((h!36051 ((_ extract 31 0) (bvand (bvxor lt!651591 (bvlshr lt!651591 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133600 (bvmul (bvxor h!36051 (bvlshr h!36051 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133600 (bvlshr x!133600 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1017248 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1017248 #b00000000000000000000000000000000))))))

(assert (=> d!157215 (= (toIndex!0 lt!651591 mask!2687) (bvand (bvxor lt!651696 (bvlshr lt!651696 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1495008 d!157215))

(declare-fun b!1495328 () Bool)

(declare-fun e!837562 () Bool)

(declare-fun e!837559 () Bool)

(assert (=> b!1495328 (= e!837562 e!837559)))

(declare-fun res!1017250 () Bool)

(declare-fun lt!651697 () SeekEntryResult!12398)

(assert (=> b!1495328 (= res!1017250 (and (is-Intermediate!12398 lt!651697) (not (undefined!13210 lt!651697)) (bvslt (x!133594 lt!651697) #b01111111111111111111111111111110) (bvsge (x!133594 lt!651697) #b00000000000000000000000000000000) (bvsge (x!133594 lt!651697) #b00000000000000000000000000000000)))))

(assert (=> b!1495328 (=> (not res!1017250) (not e!837559))))

(declare-fun b!1495329 () Bool)

(declare-fun e!837563 () SeekEntryResult!12398)

(assert (=> b!1495329 (= e!837563 (Intermediate!12398 true (toIndex!0 (select (arr!48158 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1495330 () Bool)

(assert (=> b!1495330 (= e!837562 (bvsge (x!133594 lt!651697) #b01111111111111111111111111111110))))

(declare-fun b!1495331 () Bool)

(assert (=> b!1495331 (and (bvsge (index!51986 lt!651697) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651697) (size!48708 a!2862)))))

(declare-fun res!1017249 () Bool)

(assert (=> b!1495331 (= res!1017249 (= (select (arr!48158 a!2862) (index!51986 lt!651697)) (select (arr!48158 a!2862) j!93)))))

(declare-fun e!837560 () Bool)

(assert (=> b!1495331 (=> res!1017249 e!837560)))

(assert (=> b!1495331 (= e!837559 e!837560)))

(declare-fun e!837561 () SeekEntryResult!12398)

(declare-fun b!1495332 () Bool)

(assert (=> b!1495332 (= e!837561 (Intermediate!12398 false (toIndex!0 (select (arr!48158 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1495333 () Bool)

(assert (=> b!1495333 (and (bvsge (index!51986 lt!651697) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651697) (size!48708 a!2862)))))

(declare-fun res!1017251 () Bool)

(assert (=> b!1495333 (= res!1017251 (= (select (arr!48158 a!2862) (index!51986 lt!651697)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495333 (=> res!1017251 e!837560)))

(declare-fun b!1495334 () Bool)

(assert (=> b!1495334 (= e!837561 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48158 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48158 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!157219 () Bool)

(assert (=> d!157219 e!837562))

(declare-fun c!138573 () Bool)

(assert (=> d!157219 (= c!138573 (and (is-Intermediate!12398 lt!651697) (undefined!13210 lt!651697)))))

(assert (=> d!157219 (= lt!651697 e!837563)))

(declare-fun c!138574 () Bool)

(assert (=> d!157219 (= c!138574 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!651698 () (_ BitVec 64))

(assert (=> d!157219 (= lt!651698 (select (arr!48158 a!2862) (toIndex!0 (select (arr!48158 a!2862) j!93) mask!2687)))))

(assert (=> d!157219 (validMask!0 mask!2687)))

(assert (=> d!157219 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48158 a!2862) j!93) mask!2687) (select (arr!48158 a!2862) j!93) a!2862 mask!2687) lt!651697)))

(declare-fun b!1495335 () Bool)

(assert (=> b!1495335 (and (bvsge (index!51986 lt!651697) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651697) (size!48708 a!2862)))))

(assert (=> b!1495335 (= e!837560 (= (select (arr!48158 a!2862) (index!51986 lt!651697)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495336 () Bool)

(assert (=> b!1495336 (= e!837563 e!837561)))

(declare-fun c!138572 () Bool)

(assert (=> b!1495336 (= c!138572 (or (= lt!651698 (select (arr!48158 a!2862) j!93)) (= (bvadd lt!651698 lt!651698) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!157219 c!138574) b!1495329))

(assert (= (and d!157219 (not c!138574)) b!1495336))

(assert (= (and b!1495336 c!138572) b!1495332))

(assert (= (and b!1495336 (not c!138572)) b!1495334))

(assert (= (and d!157219 c!138573) b!1495330))

(assert (= (and d!157219 (not c!138573)) b!1495328))

(assert (= (and b!1495328 res!1017250) b!1495331))

(assert (= (and b!1495331 (not res!1017249)) b!1495333))

(assert (= (and b!1495333 (not res!1017251)) b!1495335))

(assert (=> b!1495334 m!1378607))

(declare-fun m!1378851 () Bool)

(assert (=> b!1495334 m!1378851))

(assert (=> b!1495334 m!1378851))

(assert (=> b!1495334 m!1378595))

(declare-fun m!1378853 () Bool)

(assert (=> b!1495334 m!1378853))

(assert (=> d!157219 m!1378607))

(declare-fun m!1378855 () Bool)

(assert (=> d!157219 m!1378855))

(assert (=> d!157219 m!1378629))

(declare-fun m!1378857 () Bool)

(assert (=> b!1495331 m!1378857))

(assert (=> b!1495335 m!1378857))

(assert (=> b!1495333 m!1378857))

(assert (=> b!1495019 d!157219))

(declare-fun d!157223 () Bool)

(declare-fun lt!651700 () (_ BitVec 32))

(declare-fun lt!651699 () (_ BitVec 32))

(assert (=> d!157223 (= lt!651700 (bvmul (bvxor lt!651699 (bvlshr lt!651699 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157223 (= lt!651699 ((_ extract 31 0) (bvand (bvxor (select (arr!48158 a!2862) j!93) (bvlshr (select (arr!48158 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157223 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1017248 (let ((h!36051 ((_ extract 31 0) (bvand (bvxor (select (arr!48158 a!2862) j!93) (bvlshr (select (arr!48158 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133600 (bvmul (bvxor h!36051 (bvlshr h!36051 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133600 (bvlshr x!133600 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1017248 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1017248 #b00000000000000000000000000000000))))))

(assert (=> d!157223 (= (toIndex!0 (select (arr!48158 a!2862) j!93) mask!2687) (bvand (bvxor lt!651700 (bvlshr lt!651700 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1495019 d!157223))

(declare-fun b!1495337 () Bool)

(declare-fun e!837567 () Bool)

(declare-fun e!837564 () Bool)

(assert (=> b!1495337 (= e!837567 e!837564)))

(declare-fun res!1017253 () Bool)

(declare-fun lt!651701 () SeekEntryResult!12398)

(assert (=> b!1495337 (= res!1017253 (and (is-Intermediate!12398 lt!651701) (not (undefined!13210 lt!651701)) (bvslt (x!133594 lt!651701) #b01111111111111111111111111111110) (bvsge (x!133594 lt!651701) #b00000000000000000000000000000000) (bvsge (x!133594 lt!651701) x!665)))))

(assert (=> b!1495337 (=> (not res!1017253) (not e!837564))))

(declare-fun b!1495338 () Bool)

(declare-fun e!837568 () SeekEntryResult!12398)

(assert (=> b!1495338 (= e!837568 (Intermediate!12398 true index!646 x!665))))

(declare-fun b!1495339 () Bool)

(assert (=> b!1495339 (= e!837567 (bvsge (x!133594 lt!651701) #b01111111111111111111111111111110))))

(declare-fun b!1495340 () Bool)

(assert (=> b!1495340 (and (bvsge (index!51986 lt!651701) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651701) (size!48708 a!2862)))))

(declare-fun res!1017252 () Bool)

(assert (=> b!1495340 (= res!1017252 (= (select (arr!48158 a!2862) (index!51986 lt!651701)) (select (arr!48158 a!2862) j!93)))))

(declare-fun e!837565 () Bool)

(assert (=> b!1495340 (=> res!1017252 e!837565)))

(assert (=> b!1495340 (= e!837564 e!837565)))

(declare-fun b!1495341 () Bool)

(declare-fun e!837566 () SeekEntryResult!12398)

(assert (=> b!1495341 (= e!837566 (Intermediate!12398 false index!646 x!665))))

(declare-fun b!1495342 () Bool)

(assert (=> b!1495342 (and (bvsge (index!51986 lt!651701) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651701) (size!48708 a!2862)))))

(declare-fun res!1017254 () Bool)

(assert (=> b!1495342 (= res!1017254 (= (select (arr!48158 a!2862) (index!51986 lt!651701)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495342 (=> res!1017254 e!837565)))

(declare-fun b!1495343 () Bool)

(assert (=> b!1495343 (= e!837566 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48158 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!157225 () Bool)

(assert (=> d!157225 e!837567))

(declare-fun c!138576 () Bool)

(assert (=> d!157225 (= c!138576 (and (is-Intermediate!12398 lt!651701) (undefined!13210 lt!651701)))))

(assert (=> d!157225 (= lt!651701 e!837568)))

(declare-fun c!138577 () Bool)

(assert (=> d!157225 (= c!138577 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!651702 () (_ BitVec 64))

(assert (=> d!157225 (= lt!651702 (select (arr!48158 a!2862) index!646))))

(assert (=> d!157225 (validMask!0 mask!2687)))

(assert (=> d!157225 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48158 a!2862) j!93) a!2862 mask!2687) lt!651701)))

(declare-fun b!1495344 () Bool)

(assert (=> b!1495344 (and (bvsge (index!51986 lt!651701) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651701) (size!48708 a!2862)))))

(assert (=> b!1495344 (= e!837565 (= (select (arr!48158 a!2862) (index!51986 lt!651701)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495345 () Bool)

(assert (=> b!1495345 (= e!837568 e!837566)))

(declare-fun c!138575 () Bool)

(assert (=> b!1495345 (= c!138575 (or (= lt!651702 (select (arr!48158 a!2862) j!93)) (= (bvadd lt!651702 lt!651702) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!157225 c!138577) b!1495338))

(assert (= (and d!157225 (not c!138577)) b!1495345))

(assert (= (and b!1495345 c!138575) b!1495341))

(assert (= (and b!1495345 (not c!138575)) b!1495343))

(assert (= (and d!157225 c!138576) b!1495339))

(assert (= (and d!157225 (not c!138576)) b!1495337))

(assert (= (and b!1495337 res!1017253) b!1495340))

(assert (= (and b!1495340 (not res!1017252)) b!1495342))

(assert (= (and b!1495342 (not res!1017254)) b!1495344))

(assert (=> b!1495343 m!1378601))

(assert (=> b!1495343 m!1378601))

(assert (=> b!1495343 m!1378595))

(declare-fun m!1378859 () Bool)

(assert (=> b!1495343 m!1378859))

(assert (=> d!157225 m!1378591))

(assert (=> d!157225 m!1378629))

(declare-fun m!1378861 () Bool)

(assert (=> b!1495340 m!1378861))

(assert (=> b!1495344 m!1378861))

(assert (=> b!1495342 m!1378861))

(assert (=> b!1495028 d!157225))

(declare-fun d!157227 () Bool)

(declare-fun lt!651705 () (_ BitVec 32))

(assert (=> d!157227 (and (bvsge lt!651705 #b00000000000000000000000000000000) (bvslt lt!651705 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157227 (= lt!651705 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!157227 (validMask!0 mask!2687)))

(assert (=> d!157227 (= (nextIndex!0 index!646 x!665 mask!2687) lt!651705)))

(declare-fun bs!42912 () Bool)

(assert (= bs!42912 d!157227))

(declare-fun m!1378863 () Bool)

(assert (=> bs!42912 m!1378863))

(assert (=> bs!42912 m!1378629))

(assert (=> b!1495017 d!157227))

(declare-fun b!1495346 () Bool)

(declare-fun e!837572 () Bool)

(declare-fun e!837569 () Bool)

(assert (=> b!1495346 (= e!837572 e!837569)))

(declare-fun res!1017256 () Bool)

(declare-fun lt!651706 () SeekEntryResult!12398)

(assert (=> b!1495346 (= res!1017256 (and (is-Intermediate!12398 lt!651706) (not (undefined!13210 lt!651706)) (bvslt (x!133594 lt!651706) #b01111111111111111111111111111110) (bvsge (x!133594 lt!651706) #b00000000000000000000000000000000) (bvsge (x!133594 lt!651706) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1495346 (=> (not res!1017256) (not e!837569))))

(declare-fun b!1495347 () Bool)

(declare-fun e!837573 () SeekEntryResult!12398)

(assert (=> b!1495347 (= e!837573 (Intermediate!12398 true lt!651586 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1495348 () Bool)

(assert (=> b!1495348 (= e!837572 (bvsge (x!133594 lt!651706) #b01111111111111111111111111111110))))

(declare-fun b!1495349 () Bool)

(assert (=> b!1495349 (and (bvsge (index!51986 lt!651706) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651706) (size!48708 lt!651588)))))

(declare-fun res!1017255 () Bool)

(assert (=> b!1495349 (= res!1017255 (= (select (arr!48158 lt!651588) (index!51986 lt!651706)) lt!651591))))

(declare-fun e!837570 () Bool)

(assert (=> b!1495349 (=> res!1017255 e!837570)))

(assert (=> b!1495349 (= e!837569 e!837570)))

(declare-fun b!1495350 () Bool)

(declare-fun e!837571 () SeekEntryResult!12398)

(assert (=> b!1495350 (= e!837571 (Intermediate!12398 false lt!651586 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1495351 () Bool)

(assert (=> b!1495351 (and (bvsge (index!51986 lt!651706) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651706) (size!48708 lt!651588)))))

(declare-fun res!1017257 () Bool)

(assert (=> b!1495351 (= res!1017257 (= (select (arr!48158 lt!651588) (index!51986 lt!651706)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495351 (=> res!1017257 e!837570)))

(declare-fun b!1495352 () Bool)

(assert (=> b!1495352 (= e!837571 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651586 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) lt!651591 lt!651588 mask!2687))))

(declare-fun d!157229 () Bool)

(assert (=> d!157229 e!837572))

(declare-fun c!138579 () Bool)

(assert (=> d!157229 (= c!138579 (and (is-Intermediate!12398 lt!651706) (undefined!13210 lt!651706)))))

(assert (=> d!157229 (= lt!651706 e!837573)))

(declare-fun c!138580 () Bool)

(assert (=> d!157229 (= c!138580 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!651707 () (_ BitVec 64))

(assert (=> d!157229 (= lt!651707 (select (arr!48158 lt!651588) lt!651586))))

(assert (=> d!157229 (validMask!0 mask!2687)))

(assert (=> d!157229 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651586 lt!651591 lt!651588 mask!2687) lt!651706)))

(declare-fun b!1495353 () Bool)

(assert (=> b!1495353 (and (bvsge (index!51986 lt!651706) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651706) (size!48708 lt!651588)))))

(assert (=> b!1495353 (= e!837570 (= (select (arr!48158 lt!651588) (index!51986 lt!651706)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495354 () Bool)

(assert (=> b!1495354 (= e!837573 e!837571)))

(declare-fun c!138578 () Bool)

(assert (=> b!1495354 (= c!138578 (or (= lt!651707 lt!651591) (= (bvadd lt!651707 lt!651707) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!157229 c!138580) b!1495347))

(assert (= (and d!157229 (not c!138580)) b!1495354))

(assert (= (and b!1495354 c!138578) b!1495350))

(assert (= (and b!1495354 (not c!138578)) b!1495352))

(assert (= (and d!157229 c!138579) b!1495348))

(assert (= (and d!157229 (not c!138579)) b!1495346))

(assert (= (and b!1495346 res!1017256) b!1495349))

(assert (= (and b!1495349 (not res!1017255)) b!1495351))

(assert (= (and b!1495351 (not res!1017257)) b!1495353))

(declare-fun m!1378865 () Bool)

(assert (=> b!1495352 m!1378865))

(assert (=> b!1495352 m!1378865))

(declare-fun m!1378867 () Bool)

(assert (=> b!1495352 m!1378867))

(declare-fun m!1378869 () Bool)

(assert (=> d!157229 m!1378869))

(assert (=> d!157229 m!1378629))

(declare-fun m!1378871 () Bool)

(assert (=> b!1495349 m!1378871))

(assert (=> b!1495353 m!1378871))

(assert (=> b!1495351 m!1378871))

(assert (=> b!1495018 d!157229))

(declare-fun b!1495355 () Bool)

(declare-fun e!837577 () Bool)

(declare-fun e!837574 () Bool)

(assert (=> b!1495355 (= e!837577 e!837574)))

(declare-fun res!1017259 () Bool)

(declare-fun lt!651708 () SeekEntryResult!12398)

(assert (=> b!1495355 (= res!1017259 (and (is-Intermediate!12398 lt!651708) (not (undefined!13210 lt!651708)) (bvslt (x!133594 lt!651708) #b01111111111111111111111111111110) (bvsge (x!133594 lt!651708) #b00000000000000000000000000000000) (bvsge (x!133594 lt!651708) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1495355 (=> (not res!1017259) (not e!837574))))

(declare-fun b!1495356 () Bool)

(declare-fun e!837578 () SeekEntryResult!12398)

(assert (=> b!1495356 (= e!837578 (Intermediate!12398 true lt!651586 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1495357 () Bool)

(assert (=> b!1495357 (= e!837577 (bvsge (x!133594 lt!651708) #b01111111111111111111111111111110))))

(declare-fun b!1495358 () Bool)

(assert (=> b!1495358 (and (bvsge (index!51986 lt!651708) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651708) (size!48708 a!2862)))))

(declare-fun res!1017258 () Bool)

(assert (=> b!1495358 (= res!1017258 (= (select (arr!48158 a!2862) (index!51986 lt!651708)) (select (arr!48158 a!2862) j!93)))))

(declare-fun e!837575 () Bool)

(assert (=> b!1495358 (=> res!1017258 e!837575)))

(assert (=> b!1495358 (= e!837574 e!837575)))

(declare-fun b!1495359 () Bool)

(declare-fun e!837576 () SeekEntryResult!12398)

(assert (=> b!1495359 (= e!837576 (Intermediate!12398 false lt!651586 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1495360 () Bool)

(assert (=> b!1495360 (and (bvsge (index!51986 lt!651708) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651708) (size!48708 a!2862)))))

(declare-fun res!1017260 () Bool)

(assert (=> b!1495360 (= res!1017260 (= (select (arr!48158 a!2862) (index!51986 lt!651708)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495360 (=> res!1017260 e!837575)))

(declare-fun b!1495361 () Bool)

(assert (=> b!1495361 (= e!837576 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651586 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) (select (arr!48158 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!157231 () Bool)

(assert (=> d!157231 e!837577))

(declare-fun c!138582 () Bool)

(assert (=> d!157231 (= c!138582 (and (is-Intermediate!12398 lt!651708) (undefined!13210 lt!651708)))))

(assert (=> d!157231 (= lt!651708 e!837578)))

(declare-fun c!138583 () Bool)

(assert (=> d!157231 (= c!138583 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!651709 () (_ BitVec 64))

(assert (=> d!157231 (= lt!651709 (select (arr!48158 a!2862) lt!651586))))

(assert (=> d!157231 (validMask!0 mask!2687)))

(assert (=> d!157231 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651586 (select (arr!48158 a!2862) j!93) a!2862 mask!2687) lt!651708)))

(declare-fun b!1495362 () Bool)

(assert (=> b!1495362 (and (bvsge (index!51986 lt!651708) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651708) (size!48708 a!2862)))))

(assert (=> b!1495362 (= e!837575 (= (select (arr!48158 a!2862) (index!51986 lt!651708)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495363 () Bool)

(assert (=> b!1495363 (= e!837578 e!837576)))

(declare-fun c!138581 () Bool)

(assert (=> b!1495363 (= c!138581 (or (= lt!651709 (select (arr!48158 a!2862) j!93)) (= (bvadd lt!651709 lt!651709) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!157231 c!138583) b!1495356))

(assert (= (and d!157231 (not c!138583)) b!1495363))

(assert (= (and b!1495363 c!138581) b!1495359))

(assert (= (and b!1495363 (not c!138581)) b!1495361))

(assert (= (and d!157231 c!138582) b!1495357))

(assert (= (and d!157231 (not c!138582)) b!1495355))

(assert (= (and b!1495355 res!1017259) b!1495358))

(assert (= (and b!1495358 (not res!1017258)) b!1495360))

(assert (= (and b!1495360 (not res!1017260)) b!1495362))

(assert (=> b!1495361 m!1378865))

(assert (=> b!1495361 m!1378865))

(assert (=> b!1495361 m!1378595))

(declare-fun m!1378873 () Bool)

(assert (=> b!1495361 m!1378873))

(declare-fun m!1378875 () Bool)

(assert (=> d!157231 m!1378875))

(assert (=> d!157231 m!1378629))

(declare-fun m!1378877 () Bool)

(assert (=> b!1495358 m!1378877))

(assert (=> b!1495362 m!1378877))

(assert (=> b!1495360 m!1378877))

(assert (=> b!1495021 d!157231))

(declare-fun b!1495406 () Bool)

(declare-fun e!837602 () SeekEntryResult!12398)

(assert (=> b!1495406 (= e!837602 (Found!12398 lt!651586))))

(declare-fun b!1495407 () Bool)

(declare-fun e!837600 () SeekEntryResult!12398)

(assert (=> b!1495407 (= e!837600 e!837602)))

(declare-fun c!138607 () Bool)

(declare-fun lt!651728 () (_ BitVec 64))

(assert (=> b!1495407 (= c!138607 (= lt!651728 lt!651591))))

(declare-fun b!1495408 () Bool)

(declare-fun e!837601 () SeekEntryResult!12398)

(assert (=> b!1495408 (= e!837601 (MissingVacant!12398 intermediateAfterIndex!19))))

(declare-fun b!1495409 () Bool)

(assert (=> b!1495409 (= e!837601 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651586 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) intermediateAfterIndex!19 lt!651591 lt!651588 mask!2687))))

(declare-fun b!1495410 () Bool)

(assert (=> b!1495410 (= e!837600 Undefined!12398)))

(declare-fun lt!651729 () SeekEntryResult!12398)

(declare-fun d!157233 () Bool)

(assert (=> d!157233 (and (or (is-Undefined!12398 lt!651729) (not (is-Found!12398 lt!651729)) (and (bvsge (index!51985 lt!651729) #b00000000000000000000000000000000) (bvslt (index!51985 lt!651729) (size!48708 lt!651588)))) (or (is-Undefined!12398 lt!651729) (is-Found!12398 lt!651729) (not (is-MissingVacant!12398 lt!651729)) (not (= (index!51987 lt!651729) intermediateAfterIndex!19)) (and (bvsge (index!51987 lt!651729) #b00000000000000000000000000000000) (bvslt (index!51987 lt!651729) (size!48708 lt!651588)))) (or (is-Undefined!12398 lt!651729) (ite (is-Found!12398 lt!651729) (= (select (arr!48158 lt!651588) (index!51985 lt!651729)) lt!651591) (and (is-MissingVacant!12398 lt!651729) (= (index!51987 lt!651729) intermediateAfterIndex!19) (= (select (arr!48158 lt!651588) (index!51987 lt!651729)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157233 (= lt!651729 e!837600)))

(declare-fun c!138605 () Bool)

(assert (=> d!157233 (= c!138605 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157233 (= lt!651728 (select (arr!48158 lt!651588) lt!651586))))

(assert (=> d!157233 (validMask!0 mask!2687)))

(assert (=> d!157233 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651586 intermediateAfterIndex!19 lt!651591 lt!651588 mask!2687) lt!651729)))

(declare-fun b!1495411 () Bool)

(declare-fun c!138606 () Bool)

(assert (=> b!1495411 (= c!138606 (= lt!651728 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495411 (= e!837602 e!837601)))

(assert (= (and d!157233 c!138605) b!1495410))

(assert (= (and d!157233 (not c!138605)) b!1495407))

(assert (= (and b!1495407 c!138607) b!1495406))

(assert (= (and b!1495407 (not c!138607)) b!1495411))

(assert (= (and b!1495411 c!138606) b!1495408))

(assert (= (and b!1495411 (not c!138606)) b!1495409))

(assert (=> b!1495409 m!1378865))

(assert (=> b!1495409 m!1378865))

(declare-fun m!1378903 () Bool)

(assert (=> b!1495409 m!1378903))

(declare-fun m!1378905 () Bool)

(assert (=> d!157233 m!1378905))

(declare-fun m!1378907 () Bool)

(assert (=> d!157233 m!1378907))

(assert (=> d!157233 m!1378869))

(assert (=> d!157233 m!1378629))

(assert (=> b!1495022 d!157233))

(declare-fun d!157245 () Bool)

(declare-fun lt!651751 () SeekEntryResult!12398)

(assert (=> d!157245 (and (or (is-Undefined!12398 lt!651751) (not (is-Found!12398 lt!651751)) (and (bvsge (index!51985 lt!651751) #b00000000000000000000000000000000) (bvslt (index!51985 lt!651751) (size!48708 lt!651588)))) (or (is-Undefined!12398 lt!651751) (is-Found!12398 lt!651751) (not (is-MissingZero!12398 lt!651751)) (and (bvsge (index!51984 lt!651751) #b00000000000000000000000000000000) (bvslt (index!51984 lt!651751) (size!48708 lt!651588)))) (or (is-Undefined!12398 lt!651751) (is-Found!12398 lt!651751) (is-MissingZero!12398 lt!651751) (not (is-MissingVacant!12398 lt!651751)) (and (bvsge (index!51987 lt!651751) #b00000000000000000000000000000000) (bvslt (index!51987 lt!651751) (size!48708 lt!651588)))) (or (is-Undefined!12398 lt!651751) (ite (is-Found!12398 lt!651751) (= (select (arr!48158 lt!651588) (index!51985 lt!651751)) lt!651591) (ite (is-MissingZero!12398 lt!651751) (= (select (arr!48158 lt!651588) (index!51984 lt!651751)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12398 lt!651751) (= (select (arr!48158 lt!651588) (index!51987 lt!651751)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!837642 () SeekEntryResult!12398)

(assert (=> d!157245 (= lt!651751 e!837642)))

(declare-fun c!138631 () Bool)

(declare-fun lt!651752 () SeekEntryResult!12398)

(assert (=> d!157245 (= c!138631 (and (is-Intermediate!12398 lt!651752) (undefined!13210 lt!651752)))))

(assert (=> d!157245 (= lt!651752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651591 mask!2687) lt!651591 lt!651588 mask!2687))))

(assert (=> d!157245 (validMask!0 mask!2687)))

(assert (=> d!157245 (= (seekEntryOrOpen!0 lt!651591 lt!651588 mask!2687) lt!651751)))

(declare-fun b!1495475 () Bool)

(declare-fun e!837641 () SeekEntryResult!12398)

(assert (=> b!1495475 (= e!837641 (seekKeyOrZeroReturnVacant!0 (x!133594 lt!651752) (index!51986 lt!651752) (index!51986 lt!651752) lt!651591 lt!651588 mask!2687))))

(declare-fun b!1495476 () Bool)

(assert (=> b!1495476 (= e!837641 (MissingZero!12398 (index!51986 lt!651752)))))

(declare-fun b!1495477 () Bool)

(declare-fun e!837643 () SeekEntryResult!12398)

(assert (=> b!1495477 (= e!837642 e!837643)))

(declare-fun lt!651750 () (_ BitVec 64))

(assert (=> b!1495477 (= lt!651750 (select (arr!48158 lt!651588) (index!51986 lt!651752)))))

(declare-fun c!138629 () Bool)

(assert (=> b!1495477 (= c!138629 (= lt!651750 lt!651591))))

(declare-fun b!1495478 () Bool)

(declare-fun c!138630 () Bool)

(assert (=> b!1495478 (= c!138630 (= lt!651750 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495478 (= e!837643 e!837641)))

(declare-fun b!1495479 () Bool)

(assert (=> b!1495479 (= e!837643 (Found!12398 (index!51986 lt!651752)))))

(declare-fun b!1495480 () Bool)

(assert (=> b!1495480 (= e!837642 Undefined!12398)))

(assert (= (and d!157245 c!138631) b!1495480))

(assert (= (and d!157245 (not c!138631)) b!1495477))

(assert (= (and b!1495477 c!138629) b!1495479))

(assert (= (and b!1495477 (not c!138629)) b!1495478))

(assert (= (and b!1495478 c!138630) b!1495476))

(assert (= (and b!1495478 (not c!138630)) b!1495475))

(assert (=> d!157245 m!1378635))

(assert (=> d!157245 m!1378637))

(assert (=> d!157245 m!1378629))

(assert (=> d!157245 m!1378635))

(declare-fun m!1378929 () Bool)

(assert (=> d!157245 m!1378929))

(declare-fun m!1378931 () Bool)

(assert (=> d!157245 m!1378931))

(declare-fun m!1378933 () Bool)

(assert (=> d!157245 m!1378933))

(declare-fun m!1378935 () Bool)

(assert (=> b!1495475 m!1378935))

(declare-fun m!1378937 () Bool)

(assert (=> b!1495477 m!1378937))

(assert (=> b!1495022 d!157245))

(declare-fun d!157257 () Bool)

(declare-fun res!1017290 () Bool)

(declare-fun e!837660 () Bool)

(assert (=> d!157257 (=> res!1017290 e!837660)))

(assert (=> d!157257 (= res!1017290 (bvsge #b00000000000000000000000000000000 (size!48708 a!2862)))))

(assert (=> d!157257 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34656) e!837660)))

(declare-fun b!1495503 () Bool)

(declare-fun e!837659 () Bool)

(assert (=> b!1495503 (= e!837660 e!837659)))

(declare-fun res!1017289 () Bool)

(assert (=> b!1495503 (=> (not res!1017289) (not e!837659))))

(declare-fun e!837658 () Bool)

(assert (=> b!1495503 (= res!1017289 (not e!837658))))

(declare-fun res!1017291 () Bool)

(assert (=> b!1495503 (=> (not res!1017291) (not e!837658))))

(assert (=> b!1495503 (= res!1017291 (validKeyInArray!0 (select (arr!48158 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1495504 () Bool)

(declare-fun contains!9934 (List!34659 (_ BitVec 64)) Bool)

(assert (=> b!1495504 (= e!837658 (contains!9934 Nil!34656 (select (arr!48158 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1495505 () Bool)

(declare-fun e!837661 () Bool)

(declare-fun call!68012 () Bool)

(assert (=> b!1495505 (= e!837661 call!68012)))

(declare-fun b!1495506 () Bool)

(assert (=> b!1495506 (= e!837659 e!837661)))

(declare-fun c!138640 () Bool)

(assert (=> b!1495506 (= c!138640 (validKeyInArray!0 (select (arr!48158 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1495507 () Bool)

(assert (=> b!1495507 (= e!837661 call!68012)))

(declare-fun bm!68009 () Bool)

(assert (=> bm!68009 (= call!68012 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138640 (Cons!34655 (select (arr!48158 a!2862) #b00000000000000000000000000000000) Nil!34656) Nil!34656)))))

(assert (= (and d!157257 (not res!1017290)) b!1495503))

(assert (= (and b!1495503 res!1017291) b!1495504))

(assert (= (and b!1495503 res!1017289) b!1495506))

(assert (= (and b!1495506 c!138640) b!1495507))

(assert (= (and b!1495506 (not c!138640)) b!1495505))

(assert (= (or b!1495507 b!1495505) bm!68009))

(declare-fun m!1378939 () Bool)

(assert (=> b!1495503 m!1378939))

(assert (=> b!1495503 m!1378939))

(declare-fun m!1378941 () Bool)

(assert (=> b!1495503 m!1378941))

(assert (=> b!1495504 m!1378939))

(assert (=> b!1495504 m!1378939))

(declare-fun m!1378943 () Bool)

(assert (=> b!1495504 m!1378943))

(assert (=> b!1495506 m!1378939))

(assert (=> b!1495506 m!1378939))

(assert (=> b!1495506 m!1378941))

(assert (=> bm!68009 m!1378939))

(declare-fun m!1378945 () Bool)

(assert (=> bm!68009 m!1378945))

(assert (=> b!1495011 d!157257))

(declare-fun b!1495562 () Bool)

(declare-fun e!837694 () Bool)

(declare-fun call!68015 () Bool)

(assert (=> b!1495562 (= e!837694 call!68015)))

(declare-fun bm!68012 () Bool)

(assert (=> bm!68012 (= call!68015 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1495563 () Bool)

(declare-fun e!837693 () Bool)

(assert (=> b!1495563 (= e!837693 call!68015)))

(declare-fun b!1495564 () Bool)

(assert (=> b!1495564 (= e!837694 e!837693)))

(declare-fun lt!651781 () (_ BitVec 64))

(assert (=> b!1495564 (= lt!651781 (select (arr!48158 a!2862) j!93))))

(declare-fun lt!651783 () Unit!50136)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99782 (_ BitVec 64) (_ BitVec 32)) Unit!50136)

(assert (=> b!1495564 (= lt!651783 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651781 j!93))))

(declare-fun arrayContainsKey!0 (array!99782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1495564 (arrayContainsKey!0 a!2862 lt!651781 #b00000000000000000000000000000000)))

(declare-fun lt!651782 () Unit!50136)

(assert (=> b!1495564 (= lt!651782 lt!651783)))

(declare-fun res!1017306 () Bool)

(assert (=> b!1495564 (= res!1017306 (= (seekEntryOrOpen!0 (select (arr!48158 a!2862) j!93) a!2862 mask!2687) (Found!12398 j!93)))))

(assert (=> b!1495564 (=> (not res!1017306) (not e!837693))))

(declare-fun d!157259 () Bool)

(declare-fun res!1017305 () Bool)

(declare-fun e!837692 () Bool)

(assert (=> d!157259 (=> res!1017305 e!837692)))

(assert (=> d!157259 (= res!1017305 (bvsge j!93 (size!48708 a!2862)))))

(assert (=> d!157259 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!837692)))

(declare-fun b!1495561 () Bool)

(assert (=> b!1495561 (= e!837692 e!837694)))

(declare-fun c!138661 () Bool)

(assert (=> b!1495561 (= c!138661 (validKeyInArray!0 (select (arr!48158 a!2862) j!93)))))

(assert (= (and d!157259 (not res!1017305)) b!1495561))

(assert (= (and b!1495561 c!138661) b!1495564))

(assert (= (and b!1495561 (not c!138661)) b!1495562))

(assert (= (and b!1495564 res!1017306) b!1495563))

(assert (= (or b!1495563 b!1495562) bm!68012))

(declare-fun m!1378995 () Bool)

(assert (=> bm!68012 m!1378995))

(assert (=> b!1495564 m!1378595))

(declare-fun m!1378997 () Bool)

(assert (=> b!1495564 m!1378997))

(declare-fun m!1378999 () Bool)

(assert (=> b!1495564 m!1378999))

(assert (=> b!1495564 m!1378595))

(assert (=> b!1495564 m!1378633))

(assert (=> b!1495561 m!1378595))

(assert (=> b!1495561 m!1378595))

(assert (=> b!1495561 m!1378613))

(assert (=> b!1495024 d!157259))

(declare-fun d!157277 () Bool)

(assert (=> d!157277 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!651792 () Unit!50136)

(declare-fun choose!38 (array!99782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50136)

(assert (=> d!157277 (= lt!651792 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!157277 (validMask!0 mask!2687)))

(assert (=> d!157277 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!651792)))

(declare-fun bs!42915 () Bool)

(assert (= bs!42915 d!157277))

(assert (=> bs!42915 m!1378593))

(declare-fun m!1379001 () Bool)

(assert (=> bs!42915 m!1379001))

(assert (=> bs!42915 m!1378629))

(assert (=> b!1495024 d!157277))

(declare-fun b!1495577 () Bool)

(declare-fun e!837706 () SeekEntryResult!12398)

(assert (=> b!1495577 (= e!837706 (Found!12398 index!646))))

(declare-fun b!1495578 () Bool)

(declare-fun e!837704 () SeekEntryResult!12398)

(assert (=> b!1495578 (= e!837704 e!837706)))

(declare-fun c!138667 () Bool)

(declare-fun lt!651796 () (_ BitVec 64))

(assert (=> b!1495578 (= c!138667 (= lt!651796 lt!651591))))

(declare-fun b!1495579 () Bool)

(declare-fun e!837705 () SeekEntryResult!12398)

(assert (=> b!1495579 (= e!837705 (MissingVacant!12398 intermediateAfterIndex!19))))

(declare-fun b!1495580 () Bool)

(assert (=> b!1495580 (= e!837705 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!651591 lt!651588 mask!2687))))

(declare-fun b!1495581 () Bool)

(assert (=> b!1495581 (= e!837704 Undefined!12398)))

(declare-fun lt!651797 () SeekEntryResult!12398)

(declare-fun d!157279 () Bool)

(assert (=> d!157279 (and (or (is-Undefined!12398 lt!651797) (not (is-Found!12398 lt!651797)) (and (bvsge (index!51985 lt!651797) #b00000000000000000000000000000000) (bvslt (index!51985 lt!651797) (size!48708 lt!651588)))) (or (is-Undefined!12398 lt!651797) (is-Found!12398 lt!651797) (not (is-MissingVacant!12398 lt!651797)) (not (= (index!51987 lt!651797) intermediateAfterIndex!19)) (and (bvsge (index!51987 lt!651797) #b00000000000000000000000000000000) (bvslt (index!51987 lt!651797) (size!48708 lt!651588)))) (or (is-Undefined!12398 lt!651797) (ite (is-Found!12398 lt!651797) (= (select (arr!48158 lt!651588) (index!51985 lt!651797)) lt!651591) (and (is-MissingVacant!12398 lt!651797) (= (index!51987 lt!651797) intermediateAfterIndex!19) (= (select (arr!48158 lt!651588) (index!51987 lt!651797)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157279 (= lt!651797 e!837704)))

(declare-fun c!138665 () Bool)

(assert (=> d!157279 (= c!138665 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157279 (= lt!651796 (select (arr!48158 lt!651588) index!646))))

(assert (=> d!157279 (validMask!0 mask!2687)))

(assert (=> d!157279 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651591 lt!651588 mask!2687) lt!651797)))

(declare-fun b!1495582 () Bool)

(declare-fun c!138666 () Bool)

(assert (=> b!1495582 (= c!138666 (= lt!651796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495582 (= e!837706 e!837705)))

(assert (= (and d!157279 c!138665) b!1495581))

(assert (= (and d!157279 (not c!138665)) b!1495578))

(assert (= (and b!1495578 c!138667) b!1495577))

(assert (= (and b!1495578 (not c!138667)) b!1495582))

(assert (= (and b!1495582 c!138666) b!1495579))

(assert (= (and b!1495582 (not c!138666)) b!1495580))

(assert (=> b!1495580 m!1378601))

(assert (=> b!1495580 m!1378601))

(declare-fun m!1379009 () Bool)

(assert (=> b!1495580 m!1379009))

(declare-fun m!1379011 () Bool)

(assert (=> d!157279 m!1379011))

(declare-fun m!1379013 () Bool)

(assert (=> d!157279 m!1379013))

(declare-fun m!1379015 () Bool)

(assert (=> d!157279 m!1379015))

(assert (=> d!157279 m!1378629))

(assert (=> b!1495013 d!157279))

(assert (=> b!1495013 d!157245))

(declare-fun d!157283 () Bool)

(assert (=> d!157283 (= (validKeyInArray!0 (select (arr!48158 a!2862) i!1006)) (and (not (= (select (arr!48158 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48158 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1495014 d!157283))

(declare-fun b!1495583 () Bool)

(declare-fun e!837710 () Bool)

(declare-fun e!837707 () Bool)

(assert (=> b!1495583 (= e!837710 e!837707)))

(declare-fun res!1017314 () Bool)

(declare-fun lt!651798 () SeekEntryResult!12398)

(assert (=> b!1495583 (= res!1017314 (and (is-Intermediate!12398 lt!651798) (not (undefined!13210 lt!651798)) (bvslt (x!133594 lt!651798) #b01111111111111111111111111111110) (bvsge (x!133594 lt!651798) #b00000000000000000000000000000000) (bvsge (x!133594 lt!651798) x!665)))))

(assert (=> b!1495583 (=> (not res!1017314) (not e!837707))))

(declare-fun b!1495584 () Bool)

(declare-fun e!837711 () SeekEntryResult!12398)

(assert (=> b!1495584 (= e!837711 (Intermediate!12398 true index!646 x!665))))

(declare-fun b!1495585 () Bool)

(assert (=> b!1495585 (= e!837710 (bvsge (x!133594 lt!651798) #b01111111111111111111111111111110))))

(declare-fun b!1495586 () Bool)

(assert (=> b!1495586 (and (bvsge (index!51986 lt!651798) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651798) (size!48708 lt!651588)))))

(declare-fun res!1017313 () Bool)

(assert (=> b!1495586 (= res!1017313 (= (select (arr!48158 lt!651588) (index!51986 lt!651798)) lt!651591))))

(declare-fun e!837708 () Bool)

(assert (=> b!1495586 (=> res!1017313 e!837708)))

(assert (=> b!1495586 (= e!837707 e!837708)))

(declare-fun b!1495587 () Bool)

(declare-fun e!837709 () SeekEntryResult!12398)

(assert (=> b!1495587 (= e!837709 (Intermediate!12398 false index!646 x!665))))

(declare-fun b!1495588 () Bool)

(assert (=> b!1495588 (and (bvsge (index!51986 lt!651798) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651798) (size!48708 lt!651588)))))

(declare-fun res!1017315 () Bool)

(assert (=> b!1495588 (= res!1017315 (= (select (arr!48158 lt!651588) (index!51986 lt!651798)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495588 (=> res!1017315 e!837708)))

(declare-fun b!1495589 () Bool)

(assert (=> b!1495589 (= e!837709 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!651591 lt!651588 mask!2687))))

(declare-fun d!157285 () Bool)

(assert (=> d!157285 e!837710))

(declare-fun c!138669 () Bool)

(assert (=> d!157285 (= c!138669 (and (is-Intermediate!12398 lt!651798) (undefined!13210 lt!651798)))))

(assert (=> d!157285 (= lt!651798 e!837711)))

(declare-fun c!138670 () Bool)

(assert (=> d!157285 (= c!138670 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!651799 () (_ BitVec 64))

(assert (=> d!157285 (= lt!651799 (select (arr!48158 lt!651588) index!646))))

(assert (=> d!157285 (validMask!0 mask!2687)))

(assert (=> d!157285 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651591 lt!651588 mask!2687) lt!651798)))

(declare-fun b!1495590 () Bool)

(assert (=> b!1495590 (and (bvsge (index!51986 lt!651798) #b00000000000000000000000000000000) (bvslt (index!51986 lt!651798) (size!48708 lt!651588)))))

(assert (=> b!1495590 (= e!837708 (= (select (arr!48158 lt!651588) (index!51986 lt!651798)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1495591 () Bool)

(assert (=> b!1495591 (= e!837711 e!837709)))

(declare-fun c!138668 () Bool)

(assert (=> b!1495591 (= c!138668 (or (= lt!651799 lt!651591) (= (bvadd lt!651799 lt!651799) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!157285 c!138670) b!1495584))

(assert (= (and d!157285 (not c!138670)) b!1495591))

(assert (= (and b!1495591 c!138668) b!1495587))

(assert (= (and b!1495591 (not c!138668)) b!1495589))

(assert (= (and d!157285 c!138669) b!1495585))

(assert (= (and d!157285 (not c!138669)) b!1495583))

(assert (= (and b!1495583 res!1017314) b!1495586))

(assert (= (and b!1495586 (not res!1017313)) b!1495588))

(assert (= (and b!1495588 (not res!1017315)) b!1495590))

(assert (=> b!1495589 m!1378601))

(assert (=> b!1495589 m!1378601))

(declare-fun m!1379017 () Bool)

(assert (=> b!1495589 m!1379017))

(assert (=> d!157285 m!1379015))

(assert (=> d!157285 m!1378629))

(declare-fun m!1379019 () Bool)

(assert (=> b!1495586 m!1379019))

(assert (=> b!1495590 m!1379019))

(assert (=> b!1495588 m!1379019))

(assert (=> b!1495012 d!157285))

(declare-fun d!157287 () Bool)

(declare-fun lt!651801 () SeekEntryResult!12398)

(assert (=> d!157287 (and (or (is-Undefined!12398 lt!651801) (not (is-Found!12398 lt!651801)) (and (bvsge (index!51985 lt!651801) #b00000000000000000000000000000000) (bvslt (index!51985 lt!651801) (size!48708 a!2862)))) (or (is-Undefined!12398 lt!651801) (is-Found!12398 lt!651801) (not (is-MissingZero!12398 lt!651801)) (and (bvsge (index!51984 lt!651801) #b00000000000000000000000000000000) (bvslt (index!51984 lt!651801) (size!48708 a!2862)))) (or (is-Undefined!12398 lt!651801) (is-Found!12398 lt!651801) (is-MissingZero!12398 lt!651801) (not (is-MissingVacant!12398 lt!651801)) (and (bvsge (index!51987 lt!651801) #b00000000000000000000000000000000) (bvslt (index!51987 lt!651801) (size!48708 a!2862)))) (or (is-Undefined!12398 lt!651801) (ite (is-Found!12398 lt!651801) (= (select (arr!48158 a!2862) (index!51985 lt!651801)) (select (arr!48158 a!2862) j!93)) (ite (is-MissingZero!12398 lt!651801) (= (select (arr!48158 a!2862) (index!51984 lt!651801)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12398 lt!651801) (= (select (arr!48158 a!2862) (index!51987 lt!651801)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!837713 () SeekEntryResult!12398)

(assert (=> d!157287 (= lt!651801 e!837713)))

(declare-fun c!138673 () Bool)

(declare-fun lt!651802 () SeekEntryResult!12398)

(assert (=> d!157287 (= c!138673 (and (is-Intermediate!12398 lt!651802) (undefined!13210 lt!651802)))))

(assert (=> d!157287 (= lt!651802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48158 a!2862) j!93) mask!2687) (select (arr!48158 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!157287 (validMask!0 mask!2687)))

(assert (=> d!157287 (= (seekEntryOrOpen!0 (select (arr!48158 a!2862) j!93) a!2862 mask!2687) lt!651801)))

(declare-fun e!837712 () SeekEntryResult!12398)

(declare-fun b!1495592 () Bool)

(assert (=> b!1495592 (= e!837712 (seekKeyOrZeroReturnVacant!0 (x!133594 lt!651802) (index!51986 lt!651802) (index!51986 lt!651802) (select (arr!48158 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1495593 () Bool)

(assert (=> b!1495593 (= e!837712 (MissingZero!12398 (index!51986 lt!651802)))))

(declare-fun b!1495594 () Bool)

(declare-fun e!837714 () SeekEntryResult!12398)

(assert (=> b!1495594 (= e!837713 e!837714)))

(declare-fun lt!651800 () (_ BitVec 64))

(assert (=> b!1495594 (= lt!651800 (select (arr!48158 a!2862) (index!51986 lt!651802)))))

(declare-fun c!138671 () Bool)

(assert (=> b!1495594 (= c!138671 (= lt!651800 (select (arr!48158 a!2862) j!93)))))

(declare-fun b!1495595 () Bool)

(declare-fun c!138672 () Bool)

(assert (=> b!1495595 (= c!138672 (= lt!651800 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495595 (= e!837714 e!837712)))

(declare-fun b!1495596 () Bool)

(assert (=> b!1495596 (= e!837714 (Found!12398 (index!51986 lt!651802)))))

(declare-fun b!1495597 () Bool)

(assert (=> b!1495597 (= e!837713 Undefined!12398)))

(assert (= (and d!157287 c!138673) b!1495597))

(assert (= (and d!157287 (not c!138673)) b!1495594))

(assert (= (and b!1495594 c!138671) b!1495596))

(assert (= (and b!1495594 (not c!138671)) b!1495595))

(assert (= (and b!1495595 c!138672) b!1495593))

(assert (= (and b!1495595 (not c!138672)) b!1495592))

(assert (=> d!157287 m!1378607))

(assert (=> d!157287 m!1378595))

(assert (=> d!157287 m!1378609))

(assert (=> d!157287 m!1378629))

(assert (=> d!157287 m!1378595))

(assert (=> d!157287 m!1378607))

(declare-fun m!1379023 () Bool)

(assert (=> d!157287 m!1379023))

(declare-fun m!1379025 () Bool)

(assert (=> d!157287 m!1379025))

(declare-fun m!1379027 () Bool)

(assert (=> d!157287 m!1379027))

(assert (=> b!1495592 m!1378595))

(declare-fun m!1379029 () Bool)

(assert (=> b!1495592 m!1379029))

(declare-fun m!1379031 () Bool)

(assert (=> b!1495594 m!1379031))

(assert (=> b!1495016 d!157287))

(declare-fun d!157291 () Bool)

(assert (=> d!157291 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!127198 d!157291))

(declare-fun d!157297 () Bool)

(assert (=> d!157297 (= (array_inv!37186 a!2862) (bvsge (size!48708 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!127198 d!157297))

(declare-fun d!157299 () Bool)

(assert (=> d!157299 (= (validKeyInArray!0 (select (arr!48158 a!2862) j!93)) (and (not (= (select (arr!48158 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48158 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1495026 d!157299))

(declare-fun b!1495612 () Bool)

(declare-fun e!837725 () Bool)

(declare-fun call!68020 () Bool)

(assert (=> b!1495612 (= e!837725 call!68020)))

(declare-fun bm!68017 () Bool)

(assert (=> bm!68017 (= call!68020 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1495613 () Bool)

(declare-fun e!837724 () Bool)

(assert (=> b!1495613 (= e!837724 call!68020)))

(declare-fun b!1495614 () Bool)

(assert (=> b!1495614 (= e!837725 e!837724)))

(declare-fun lt!651811 () (_ BitVec 64))

(assert (=> b!1495614 (= lt!651811 (select (arr!48158 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!651813 () Unit!50136)

(assert (=> b!1495614 (= lt!651813 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651811 #b00000000000000000000000000000000))))

(assert (=> b!1495614 (arrayContainsKey!0 a!2862 lt!651811 #b00000000000000000000000000000000)))

(declare-fun lt!651812 () Unit!50136)

(assert (=> b!1495614 (= lt!651812 lt!651813)))

(declare-fun res!1017322 () Bool)

(assert (=> b!1495614 (= res!1017322 (= (seekEntryOrOpen!0 (select (arr!48158 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12398 #b00000000000000000000000000000000)))))

(assert (=> b!1495614 (=> (not res!1017322) (not e!837724))))

(declare-fun d!157301 () Bool)

(declare-fun res!1017321 () Bool)

(declare-fun e!837723 () Bool)

(assert (=> d!157301 (=> res!1017321 e!837723)))

(assert (=> d!157301 (= res!1017321 (bvsge #b00000000000000000000000000000000 (size!48708 a!2862)))))

(assert (=> d!157301 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!837723)))

(declare-fun b!1495611 () Bool)

(assert (=> b!1495611 (= e!837723 e!837725)))

(declare-fun c!138678 () Bool)

(assert (=> b!1495611 (= c!138678 (validKeyInArray!0 (select (arr!48158 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!157301 (not res!1017321)) b!1495611))

(assert (= (and b!1495611 c!138678) b!1495614))

(assert (= (and b!1495611 (not c!138678)) b!1495612))

(assert (= (and b!1495614 res!1017322) b!1495613))

(assert (= (or b!1495613 b!1495612) bm!68017))

(declare-fun m!1379045 () Bool)

(assert (=> bm!68017 m!1379045))

(assert (=> b!1495614 m!1378939))

(declare-fun m!1379047 () Bool)

(assert (=> b!1495614 m!1379047))

(declare-fun m!1379049 () Bool)

(assert (=> b!1495614 m!1379049))

(assert (=> b!1495614 m!1378939))

(declare-fun m!1379051 () Bool)

(assert (=> b!1495614 m!1379051))

(assert (=> b!1495611 m!1378939))

(assert (=> b!1495611 m!1378939))

(assert (=> b!1495611 m!1378941))

(assert (=> b!1495015 d!157301))

(push 1)

(assert (not b!1495614))

(assert (not b!1495592))

(assert (not b!1495334))

(assert (not d!157225))

(assert (not bm!68009))

(assert (not d!157199))

(assert (not b!1495475))

(assert (not b!1495343))

(assert (not b!1495589))

(assert (not d!157231))

(assert (not d!157245))

(assert (not b!1495564))

(assert (not d!157277))

(assert (not b!1495611))

(assert (not b!1495561))

(assert (not d!157279))

(assert (not b!1495409))

(assert (not b!1495503))

(assert (not b!1495289))

(assert (not d!157219))

(assert (not d!157233))

(assert (not b!1495506))

(assert (not d!157227))

(assert (not b!1495504))

(assert (not bm!68012))

(assert (not b!1495352))

(assert (not d!157229))

(assert (not d!157287))

(assert (not b!1495361))

(assert (not b!1495580))

(assert (not d!157285))

(assert (not bm!68017))

(check-sat)

(pop 1)

(push 1)

(check-sat)

