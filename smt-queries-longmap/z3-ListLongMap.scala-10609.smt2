; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124794 () Bool)

(assert start!124794)

(declare-fun b!1447857 () Bool)

(declare-fun res!979475 () Bool)

(declare-fun e!815413 () Bool)

(assert (=> b!1447857 (=> (not res!979475) (not e!815413))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1447857 (= res!979475 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447858 () Bool)

(declare-fun e!815408 () Bool)

(assert (=> b!1447858 (= e!815408 true)))

(declare-datatypes ((SeekEntryResult!11661 0))(
  ( (MissingZero!11661 (index!49036 (_ BitVec 32))) (Found!11661 (index!49037 (_ BitVec 32))) (Intermediate!11661 (undefined!12473 Bool) (index!49038 (_ BitVec 32)) (x!130710 (_ BitVec 32))) (Undefined!11661) (MissingVacant!11661 (index!49039 (_ BitVec 32))) )
))
(declare-fun lt!635316 () SeekEntryResult!11661)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98242 0))(
  ( (array!98243 (arr!47409 (Array (_ BitVec 32) (_ BitVec 64))) (size!47959 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98242)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98242 (_ BitVec 32)) SeekEntryResult!11661)

(assert (=> b!1447858 (= lt!635316 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47409 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447859 () Bool)

(declare-fun e!815412 () Bool)

(declare-fun e!815406 () Bool)

(assert (=> b!1447859 (= e!815412 e!815406)))

(declare-fun res!979465 () Bool)

(assert (=> b!1447859 (=> res!979465 e!815406)))

(assert (=> b!1447859 (= res!979465 (or (and (= (select (arr!47409 a!2862) index!646) (select (store (arr!47409 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47409 a!2862) index!646) (select (arr!47409 a!2862) j!93))) (not (= (select (arr!47409 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447860 () Bool)

(declare-fun e!815409 () Bool)

(declare-fun e!815410 () Bool)

(assert (=> b!1447860 (= e!815409 e!815410)))

(declare-fun res!979479 () Bool)

(assert (=> b!1447860 (=> (not res!979479) (not e!815410))))

(declare-fun lt!635320 () SeekEntryResult!11661)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98242 (_ BitVec 32)) SeekEntryResult!11661)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447860 (= res!979479 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47409 a!2862) j!93) mask!2687) (select (arr!47409 a!2862) j!93) a!2862 mask!2687) lt!635320))))

(assert (=> b!1447860 (= lt!635320 (Intermediate!11661 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447861 () Bool)

(assert (=> b!1447861 (= e!815410 e!815413)))

(declare-fun res!979468 () Bool)

(assert (=> b!1447861 (=> (not res!979468) (not e!815413))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!635319 () SeekEntryResult!11661)

(assert (=> b!1447861 (= res!979468 (= lt!635319 (Intermediate!11661 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635321 () (_ BitVec 64))

(declare-fun lt!635317 () array!98242)

(assert (=> b!1447861 (= lt!635319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635321 mask!2687) lt!635321 lt!635317 mask!2687))))

(assert (=> b!1447861 (= lt!635321 (select (store (arr!47409 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447862 () Bool)

(declare-fun res!979472 () Bool)

(assert (=> b!1447862 (=> (not res!979472) (not e!815413))))

(declare-fun e!815407 () Bool)

(assert (=> b!1447862 (= res!979472 e!815407)))

(declare-fun c!133707 () Bool)

(assert (=> b!1447862 (= c!133707 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447863 () Bool)

(declare-fun e!815414 () Bool)

(assert (=> b!1447863 (= e!815414 e!815409)))

(declare-fun res!979469 () Bool)

(assert (=> b!1447863 (=> (not res!979469) (not e!815409))))

(assert (=> b!1447863 (= res!979469 (= (select (store (arr!47409 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447863 (= lt!635317 (array!98243 (store (arr!47409 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47959 a!2862)))))

(declare-fun b!1447865 () Bool)

(assert (=> b!1447865 (= e!815413 (not e!815408))))

(declare-fun res!979478 () Bool)

(assert (=> b!1447865 (=> res!979478 e!815408)))

(assert (=> b!1447865 (= res!979478 (or (and (= (select (arr!47409 a!2862) index!646) (select (store (arr!47409 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47409 a!2862) index!646) (select (arr!47409 a!2862) j!93))) (not (= (select (arr!47409 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47409 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1447865 e!815412))

(declare-fun res!979466 () Bool)

(assert (=> b!1447865 (=> (not res!979466) (not e!815412))))

(declare-fun lt!635318 () SeekEntryResult!11661)

(assert (=> b!1447865 (= res!979466 (and (= lt!635318 (Found!11661 j!93)) (or (= (select (arr!47409 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47409 a!2862) intermediateBeforeIndex!19) (select (arr!47409 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98242 (_ BitVec 32)) SeekEntryResult!11661)

(assert (=> b!1447865 (= lt!635318 (seekEntryOrOpen!0 (select (arr!47409 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98242 (_ BitVec 32)) Bool)

(assert (=> b!1447865 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48818 0))(
  ( (Unit!48819) )
))
(declare-fun lt!635322 () Unit!48818)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98242 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48818)

(assert (=> b!1447865 (= lt!635322 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447866 () Bool)

(declare-fun res!979471 () Bool)

(assert (=> b!1447866 (=> (not res!979471) (not e!815414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447866 (= res!979471 (validKeyInArray!0 (select (arr!47409 a!2862) i!1006)))))

(declare-fun b!1447867 () Bool)

(assert (=> b!1447867 (= e!815407 (= lt!635319 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635321 lt!635317 mask!2687)))))

(declare-fun b!1447868 () Bool)

(declare-fun res!979464 () Bool)

(assert (=> b!1447868 (=> (not res!979464) (not e!815414))))

(assert (=> b!1447868 (= res!979464 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47959 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47959 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47959 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447869 () Bool)

(declare-fun res!979476 () Bool)

(assert (=> b!1447869 (=> (not res!979476) (not e!815414))))

(assert (=> b!1447869 (= res!979476 (and (= (size!47959 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47959 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47959 a!2862)) (not (= i!1006 j!93))))))

(declare-fun e!815405 () Bool)

(declare-fun b!1447870 () Bool)

(assert (=> b!1447870 (= e!815405 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447871 () Bool)

(declare-fun res!979480 () Bool)

(assert (=> b!1447871 (=> (not res!979480) (not e!815414))))

(declare-datatypes ((List!33910 0))(
  ( (Nil!33907) (Cons!33906 (h!35256 (_ BitVec 64)) (t!48604 List!33910)) )
))
(declare-fun arrayNoDuplicates!0 (array!98242 (_ BitVec 32) List!33910) Bool)

(assert (=> b!1447871 (= res!979480 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33907))))

(declare-fun b!1447872 () Bool)

(assert (=> b!1447872 (= e!815407 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635321 lt!635317 mask!2687) (seekEntryOrOpen!0 lt!635321 lt!635317 mask!2687)))))

(declare-fun b!1447873 () Bool)

(assert (=> b!1447873 (= e!815406 e!815405)))

(declare-fun res!979477 () Bool)

(assert (=> b!1447873 (=> (not res!979477) (not e!815405))))

(assert (=> b!1447873 (= res!979477 (= lt!635318 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47409 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447874 () Bool)

(declare-fun res!979470 () Bool)

(assert (=> b!1447874 (=> (not res!979470) (not e!815414))))

(assert (=> b!1447874 (= res!979470 (validKeyInArray!0 (select (arr!47409 a!2862) j!93)))))

(declare-fun b!1447875 () Bool)

(declare-fun res!979467 () Bool)

(assert (=> b!1447875 (=> (not res!979467) (not e!815410))))

(assert (=> b!1447875 (= res!979467 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47409 a!2862) j!93) a!2862 mask!2687) lt!635320))))

(declare-fun b!1447864 () Bool)

(declare-fun res!979473 () Bool)

(assert (=> b!1447864 (=> (not res!979473) (not e!815414))))

(assert (=> b!1447864 (= res!979473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!979474 () Bool)

(assert (=> start!124794 (=> (not res!979474) (not e!815414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124794 (= res!979474 (validMask!0 mask!2687))))

(assert (=> start!124794 e!815414))

(assert (=> start!124794 true))

(declare-fun array_inv!36437 (array!98242) Bool)

(assert (=> start!124794 (array_inv!36437 a!2862)))

(assert (= (and start!124794 res!979474) b!1447869))

(assert (= (and b!1447869 res!979476) b!1447866))

(assert (= (and b!1447866 res!979471) b!1447874))

(assert (= (and b!1447874 res!979470) b!1447864))

(assert (= (and b!1447864 res!979473) b!1447871))

(assert (= (and b!1447871 res!979480) b!1447868))

(assert (= (and b!1447868 res!979464) b!1447863))

(assert (= (and b!1447863 res!979469) b!1447860))

(assert (= (and b!1447860 res!979479) b!1447875))

(assert (= (and b!1447875 res!979467) b!1447861))

(assert (= (and b!1447861 res!979468) b!1447862))

(assert (= (and b!1447862 c!133707) b!1447867))

(assert (= (and b!1447862 (not c!133707)) b!1447872))

(assert (= (and b!1447862 res!979472) b!1447857))

(assert (= (and b!1447857 res!979475) b!1447865))

(assert (= (and b!1447865 res!979466) b!1447859))

(assert (= (and b!1447859 (not res!979465)) b!1447873))

(assert (= (and b!1447873 res!979477) b!1447870))

(assert (= (and b!1447865 (not res!979478)) b!1447858))

(declare-fun m!1336651 () Bool)

(assert (=> b!1447875 m!1336651))

(assert (=> b!1447875 m!1336651))

(declare-fun m!1336653 () Bool)

(assert (=> b!1447875 m!1336653))

(declare-fun m!1336655 () Bool)

(assert (=> b!1447867 m!1336655))

(declare-fun m!1336657 () Bool)

(assert (=> b!1447863 m!1336657))

(declare-fun m!1336659 () Bool)

(assert (=> b!1447863 m!1336659))

(declare-fun m!1336661 () Bool)

(assert (=> b!1447861 m!1336661))

(assert (=> b!1447861 m!1336661))

(declare-fun m!1336663 () Bool)

(assert (=> b!1447861 m!1336663))

(assert (=> b!1447861 m!1336657))

(declare-fun m!1336665 () Bool)

(assert (=> b!1447861 m!1336665))

(declare-fun m!1336667 () Bool)

(assert (=> b!1447871 m!1336667))

(declare-fun m!1336669 () Bool)

(assert (=> b!1447865 m!1336669))

(assert (=> b!1447865 m!1336657))

(declare-fun m!1336671 () Bool)

(assert (=> b!1447865 m!1336671))

(declare-fun m!1336673 () Bool)

(assert (=> b!1447865 m!1336673))

(declare-fun m!1336675 () Bool)

(assert (=> b!1447865 m!1336675))

(assert (=> b!1447865 m!1336651))

(declare-fun m!1336677 () Bool)

(assert (=> b!1447865 m!1336677))

(declare-fun m!1336679 () Bool)

(assert (=> b!1447865 m!1336679))

(assert (=> b!1447865 m!1336651))

(assert (=> b!1447858 m!1336651))

(assert (=> b!1447858 m!1336651))

(declare-fun m!1336681 () Bool)

(assert (=> b!1447858 m!1336681))

(declare-fun m!1336683 () Bool)

(assert (=> b!1447864 m!1336683))

(assert (=> b!1447860 m!1336651))

(assert (=> b!1447860 m!1336651))

(declare-fun m!1336685 () Bool)

(assert (=> b!1447860 m!1336685))

(assert (=> b!1447860 m!1336685))

(assert (=> b!1447860 m!1336651))

(declare-fun m!1336687 () Bool)

(assert (=> b!1447860 m!1336687))

(assert (=> b!1447859 m!1336675))

(assert (=> b!1447859 m!1336657))

(assert (=> b!1447859 m!1336673))

(assert (=> b!1447859 m!1336651))

(declare-fun m!1336689 () Bool)

(assert (=> start!124794 m!1336689))

(declare-fun m!1336691 () Bool)

(assert (=> start!124794 m!1336691))

(assert (=> b!1447874 m!1336651))

(assert (=> b!1447874 m!1336651))

(declare-fun m!1336693 () Bool)

(assert (=> b!1447874 m!1336693))

(assert (=> b!1447873 m!1336651))

(assert (=> b!1447873 m!1336651))

(declare-fun m!1336695 () Bool)

(assert (=> b!1447873 m!1336695))

(declare-fun m!1336697 () Bool)

(assert (=> b!1447866 m!1336697))

(assert (=> b!1447866 m!1336697))

(declare-fun m!1336699 () Bool)

(assert (=> b!1447866 m!1336699))

(declare-fun m!1336701 () Bool)

(assert (=> b!1447872 m!1336701))

(declare-fun m!1336703 () Bool)

(assert (=> b!1447872 m!1336703))

(check-sat (not b!1447867) (not b!1447874) (not b!1447871) (not b!1447860) (not b!1447864) (not b!1447875) (not b!1447858) (not start!124794) (not b!1447861) (not b!1447865) (not b!1447866) (not b!1447873) (not b!1447872))
(check-sat)
