; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124582 () Bool)

(assert start!124582)

(declare-fun e!812897 () Bool)

(declare-fun b!1442235 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98030 0))(
  ( (array!98031 (arr!47303 (Array (_ BitVec 32) (_ BitVec 64))) (size!47853 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98030)

(assert (=> b!1442235 (= e!812897 (not (or (not (= (select (arr!47303 a!2862) index!646) (select (store (arr!47303 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47303 a!2862) index!646) (select (arr!47303 a!2862) j!93))) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(declare-fun e!812895 () Bool)

(assert (=> b!1442235 e!812895))

(declare-fun res!974490 () Bool)

(assert (=> b!1442235 (=> (not res!974490) (not e!812895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98030 (_ BitVec 32)) Bool)

(assert (=> b!1442235 (= res!974490 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48606 0))(
  ( (Unit!48607) )
))
(declare-fun lt!633502 () Unit!48606)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48606)

(assert (=> b!1442235 (= lt!633502 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442236 () Bool)

(declare-fun e!812899 () Bool)

(assert (=> b!1442236 (= e!812899 e!812897)))

(declare-fun res!974479 () Bool)

(assert (=> b!1442236 (=> (not res!974479) (not e!812897))))

(declare-datatypes ((SeekEntryResult!11555 0))(
  ( (MissingZero!11555 (index!48612 (_ BitVec 32))) (Found!11555 (index!48613 (_ BitVec 32))) (Intermediate!11555 (undefined!12367 Bool) (index!48614 (_ BitVec 32)) (x!130324 (_ BitVec 32))) (Undefined!11555) (MissingVacant!11555 (index!48615 (_ BitVec 32))) )
))
(declare-fun lt!633500 () SeekEntryResult!11555)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442236 (= res!974479 (= lt!633500 (Intermediate!11555 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633503 () (_ BitVec 64))

(declare-fun lt!633501 () array!98030)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98030 (_ BitVec 32)) SeekEntryResult!11555)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442236 (= lt!633500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633503 mask!2687) lt!633503 lt!633501 mask!2687))))

(assert (=> b!1442236 (= lt!633503 (select (store (arr!47303 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1442237 () Bool)

(assert (=> b!1442237 (= e!812895 (or (= (select (arr!47303 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47303 a!2862) intermediateBeforeIndex!19) (select (arr!47303 a!2862) j!93))))))

(declare-fun b!1442238 () Bool)

(declare-fun e!812896 () Bool)

(assert (=> b!1442238 (= e!812896 e!812899)))

(declare-fun res!974477 () Bool)

(assert (=> b!1442238 (=> (not res!974477) (not e!812899))))

(declare-fun lt!633504 () SeekEntryResult!11555)

(assert (=> b!1442238 (= res!974477 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47303 a!2862) j!93) mask!2687) (select (arr!47303 a!2862) j!93) a!2862 mask!2687) lt!633504))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1442238 (= lt!633504 (Intermediate!11555 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442239 () Bool)

(declare-fun res!974488 () Bool)

(declare-fun e!812894 () Bool)

(assert (=> b!1442239 (=> (not res!974488) (not e!812894))))

(declare-datatypes ((List!33804 0))(
  ( (Nil!33801) (Cons!33800 (h!35150 (_ BitVec 64)) (t!48498 List!33804)) )
))
(declare-fun arrayNoDuplicates!0 (array!98030 (_ BitVec 32) List!33804) Bool)

(assert (=> b!1442239 (= res!974488 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33801))))

(declare-fun b!1442240 () Bool)

(declare-fun res!974489 () Bool)

(assert (=> b!1442240 (=> (not res!974489) (not e!812897))))

(declare-fun e!812898 () Bool)

(assert (=> b!1442240 (= res!974489 e!812898)))

(declare-fun c!133389 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1442240 (= c!133389 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442241 () Bool)

(declare-fun res!974482 () Bool)

(assert (=> b!1442241 (=> (not res!974482) (not e!812894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442241 (= res!974482 (validKeyInArray!0 (select (arr!47303 a!2862) j!93)))))

(declare-fun b!1442242 () Bool)

(declare-fun res!974486 () Bool)

(assert (=> b!1442242 (=> (not res!974486) (not e!812897))))

(assert (=> b!1442242 (= res!974486 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442243 () Bool)

(declare-fun res!974487 () Bool)

(assert (=> b!1442243 (=> (not res!974487) (not e!812894))))

(assert (=> b!1442243 (= res!974487 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47853 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47853 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47853 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442244 () Bool)

(assert (=> b!1442244 (= e!812894 e!812896)))

(declare-fun res!974484 () Bool)

(assert (=> b!1442244 (=> (not res!974484) (not e!812896))))

(assert (=> b!1442244 (= res!974484 (= (select (store (arr!47303 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442244 (= lt!633501 (array!98031 (store (arr!47303 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47853 a!2862)))))

(declare-fun b!1442245 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98030 (_ BitVec 32)) SeekEntryResult!11555)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98030 (_ BitVec 32)) SeekEntryResult!11555)

(assert (=> b!1442245 (= e!812898 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633503 lt!633501 mask!2687) (seekEntryOrOpen!0 lt!633503 lt!633501 mask!2687)))))

(declare-fun b!1442246 () Bool)

(declare-fun res!974483 () Bool)

(assert (=> b!1442246 (=> (not res!974483) (not e!812894))))

(assert (=> b!1442246 (= res!974483 (validKeyInArray!0 (select (arr!47303 a!2862) i!1006)))))

(declare-fun b!1442234 () Bool)

(declare-fun res!974485 () Bool)

(assert (=> b!1442234 (=> (not res!974485) (not e!812899))))

(assert (=> b!1442234 (= res!974485 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47303 a!2862) j!93) a!2862 mask!2687) lt!633504))))

(declare-fun res!974478 () Bool)

(assert (=> start!124582 (=> (not res!974478) (not e!812894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124582 (= res!974478 (validMask!0 mask!2687))))

(assert (=> start!124582 e!812894))

(assert (=> start!124582 true))

(declare-fun array_inv!36331 (array!98030) Bool)

(assert (=> start!124582 (array_inv!36331 a!2862)))

(declare-fun b!1442247 () Bool)

(declare-fun res!974491 () Bool)

(assert (=> b!1442247 (=> (not res!974491) (not e!812894))))

(assert (=> b!1442247 (= res!974491 (and (= (size!47853 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47853 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47853 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442248 () Bool)

(declare-fun res!974480 () Bool)

(assert (=> b!1442248 (=> (not res!974480) (not e!812895))))

(assert (=> b!1442248 (= res!974480 (= (seekEntryOrOpen!0 (select (arr!47303 a!2862) j!93) a!2862 mask!2687) (Found!11555 j!93)))))

(declare-fun b!1442249 () Bool)

(declare-fun res!974481 () Bool)

(assert (=> b!1442249 (=> (not res!974481) (not e!812894))))

(assert (=> b!1442249 (= res!974481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442250 () Bool)

(assert (=> b!1442250 (= e!812898 (= lt!633500 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633503 lt!633501 mask!2687)))))

(assert (= (and start!124582 res!974478) b!1442247))

(assert (= (and b!1442247 res!974491) b!1442246))

(assert (= (and b!1442246 res!974483) b!1442241))

(assert (= (and b!1442241 res!974482) b!1442249))

(assert (= (and b!1442249 res!974481) b!1442239))

(assert (= (and b!1442239 res!974488) b!1442243))

(assert (= (and b!1442243 res!974487) b!1442244))

(assert (= (and b!1442244 res!974484) b!1442238))

(assert (= (and b!1442238 res!974477) b!1442234))

(assert (= (and b!1442234 res!974485) b!1442236))

(assert (= (and b!1442236 res!974479) b!1442240))

(assert (= (and b!1442240 c!133389) b!1442250))

(assert (= (and b!1442240 (not c!133389)) b!1442245))

(assert (= (and b!1442240 res!974489) b!1442242))

(assert (= (and b!1442242 res!974486) b!1442235))

(assert (= (and b!1442235 res!974490) b!1442248))

(assert (= (and b!1442248 res!974480) b!1442237))

(declare-fun m!1331395 () Bool)

(assert (=> b!1442234 m!1331395))

(assert (=> b!1442234 m!1331395))

(declare-fun m!1331397 () Bool)

(assert (=> b!1442234 m!1331397))

(assert (=> b!1442241 m!1331395))

(assert (=> b!1442241 m!1331395))

(declare-fun m!1331399 () Bool)

(assert (=> b!1442241 m!1331399))

(declare-fun m!1331401 () Bool)

(assert (=> b!1442250 m!1331401))

(declare-fun m!1331403 () Bool)

(assert (=> start!124582 m!1331403))

(declare-fun m!1331405 () Bool)

(assert (=> start!124582 m!1331405))

(declare-fun m!1331407 () Bool)

(assert (=> b!1442249 m!1331407))

(declare-fun m!1331409 () Bool)

(assert (=> b!1442235 m!1331409))

(declare-fun m!1331411 () Bool)

(assert (=> b!1442235 m!1331411))

(declare-fun m!1331413 () Bool)

(assert (=> b!1442235 m!1331413))

(declare-fun m!1331415 () Bool)

(assert (=> b!1442235 m!1331415))

(declare-fun m!1331417 () Bool)

(assert (=> b!1442235 m!1331417))

(assert (=> b!1442235 m!1331395))

(declare-fun m!1331419 () Bool)

(assert (=> b!1442236 m!1331419))

(assert (=> b!1442236 m!1331419))

(declare-fun m!1331421 () Bool)

(assert (=> b!1442236 m!1331421))

(assert (=> b!1442236 m!1331411))

(declare-fun m!1331423 () Bool)

(assert (=> b!1442236 m!1331423))

(declare-fun m!1331425 () Bool)

(assert (=> b!1442245 m!1331425))

(declare-fun m!1331427 () Bool)

(assert (=> b!1442245 m!1331427))

(declare-fun m!1331429 () Bool)

(assert (=> b!1442239 m!1331429))

(assert (=> b!1442248 m!1331395))

(assert (=> b!1442248 m!1331395))

(declare-fun m!1331431 () Bool)

(assert (=> b!1442248 m!1331431))

(assert (=> b!1442244 m!1331411))

(declare-fun m!1331433 () Bool)

(assert (=> b!1442244 m!1331433))

(assert (=> b!1442238 m!1331395))

(assert (=> b!1442238 m!1331395))

(declare-fun m!1331435 () Bool)

(assert (=> b!1442238 m!1331435))

(assert (=> b!1442238 m!1331435))

(assert (=> b!1442238 m!1331395))

(declare-fun m!1331437 () Bool)

(assert (=> b!1442238 m!1331437))

(declare-fun m!1331439 () Bool)

(assert (=> b!1442237 m!1331439))

(assert (=> b!1442237 m!1331395))

(declare-fun m!1331441 () Bool)

(assert (=> b!1442246 m!1331441))

(assert (=> b!1442246 m!1331441))

(declare-fun m!1331443 () Bool)

(assert (=> b!1442246 m!1331443))

(push 1)

