; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124590 () Bool)

(assert start!124590)

(declare-fun b!1443013 () Bool)

(declare-fun e!813183 () Bool)

(declare-fun e!813184 () Bool)

(assert (=> b!1443013 (= e!813183 e!813184)))

(declare-fun res!975271 () Bool)

(assert (=> b!1443013 (=> (not res!975271) (not e!813184))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98016 0))(
  ( (array!98017 (arr!47297 (Array (_ BitVec 32) (_ BitVec 64))) (size!47849 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98016)

(assert (=> b!1443013 (= res!975271 (= (select (store (arr!47297 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!633551 () array!98016)

(assert (=> b!1443013 (= lt!633551 (array!98017 (store (arr!47297 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47849 a!2862)))))

(declare-fun b!1443014 () Bool)

(declare-fun e!813186 () Bool)

(declare-fun lt!633555 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443014 (= e!813186 (validKeyInArray!0 lt!633555))))

(declare-fun b!1443015 () Bool)

(declare-fun res!975266 () Bool)

(declare-fun e!813185 () Bool)

(assert (=> b!1443015 (=> (not res!975266) (not e!813185))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11574 0))(
  ( (MissingZero!11574 (index!48688 (_ BitVec 32))) (Found!11574 (index!48689 (_ BitVec 32))) (Intermediate!11574 (undefined!12386 Bool) (index!48690 (_ BitVec 32)) (x!130386 (_ BitVec 32))) (Undefined!11574) (MissingVacant!11574 (index!48691 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98016 (_ BitVec 32)) SeekEntryResult!11574)

(assert (=> b!1443015 (= res!975266 (= (seekEntryOrOpen!0 (select (arr!47297 a!2862) j!93) a!2862 mask!2687) (Found!11574 j!93)))))

(declare-fun b!1443016 () Bool)

(declare-fun res!975263 () Bool)

(declare-fun e!813188 () Bool)

(assert (=> b!1443016 (=> (not res!975263) (not e!813188))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!633552 () SeekEntryResult!11574)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98016 (_ BitVec 32)) SeekEntryResult!11574)

(assert (=> b!1443016 (= res!975263 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47297 a!2862) j!93) a!2862 mask!2687) lt!633552))))

(declare-fun b!1443017 () Bool)

(declare-fun res!975267 () Bool)

(assert (=> b!1443017 (=> (not res!975267) (not e!813183))))

(assert (=> b!1443017 (= res!975267 (validKeyInArray!0 (select (arr!47297 a!2862) j!93)))))

(declare-fun lt!633553 () SeekEntryResult!11574)

(declare-fun e!813189 () Bool)

(declare-fun b!1443018 () Bool)

(assert (=> b!1443018 (= e!813189 (= lt!633553 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633555 lt!633551 mask!2687)))))

(declare-fun b!1443019 () Bool)

(declare-fun res!975269 () Bool)

(declare-fun e!813182 () Bool)

(assert (=> b!1443019 (=> (not res!975269) (not e!813182))))

(assert (=> b!1443019 (= res!975269 e!813189)))

(declare-fun c!133390 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1443019 (= c!133390 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443020 () Bool)

(declare-fun res!975268 () Bool)

(assert (=> b!1443020 (=> (not res!975268) (not e!813183))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443020 (= res!975268 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47849 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47849 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47849 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443021 () Bool)

(assert (=> b!1443021 (= e!813184 e!813188)))

(declare-fun res!975272 () Bool)

(assert (=> b!1443021 (=> (not res!975272) (not e!813188))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443021 (= res!975272 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47297 a!2862) j!93) mask!2687) (select (arr!47297 a!2862) j!93) a!2862 mask!2687) lt!633552))))

(assert (=> b!1443021 (= lt!633552 (Intermediate!11574 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443022 () Bool)

(assert (=> b!1443022 (= e!813188 e!813182)))

(declare-fun res!975259 () Bool)

(assert (=> b!1443022 (=> (not res!975259) (not e!813182))))

(assert (=> b!1443022 (= res!975259 (= lt!633553 (Intermediate!11574 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1443022 (= lt!633553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633555 mask!2687) lt!633555 lt!633551 mask!2687))))

(assert (=> b!1443022 (= lt!633555 (select (store (arr!47297 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443023 () Bool)

(declare-fun res!975264 () Bool)

(assert (=> b!1443023 (=> (not res!975264) (not e!813183))))

(assert (=> b!1443023 (= res!975264 (and (= (size!47849 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47849 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47849 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443024 () Bool)

(assert (=> b!1443024 (= e!813182 (not e!813186))))

(declare-fun res!975260 () Bool)

(assert (=> b!1443024 (=> res!975260 e!813186)))

(assert (=> b!1443024 (= res!975260 (or (not (= (select (arr!47297 a!2862) index!646) (select (store (arr!47297 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47297 a!2862) index!646) (select (arr!47297 a!2862) j!93))) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(assert (=> b!1443024 e!813185))

(declare-fun res!975262 () Bool)

(assert (=> b!1443024 (=> (not res!975262) (not e!813185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98016 (_ BitVec 32)) Bool)

(assert (=> b!1443024 (= res!975262 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48485 0))(
  ( (Unit!48486) )
))
(declare-fun lt!633554 () Unit!48485)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48485)

(assert (=> b!1443024 (= lt!633554 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443025 () Bool)

(declare-fun res!975261 () Bool)

(assert (=> b!1443025 (=> (not res!975261) (not e!813182))))

(assert (=> b!1443025 (= res!975261 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443026 () Bool)

(declare-fun res!975270 () Bool)

(assert (=> b!1443026 (=> (not res!975270) (not e!813183))))

(declare-datatypes ((List!33876 0))(
  ( (Nil!33873) (Cons!33872 (h!35222 (_ BitVec 64)) (t!48562 List!33876)) )
))
(declare-fun arrayNoDuplicates!0 (array!98016 (_ BitVec 32) List!33876) Bool)

(assert (=> b!1443026 (= res!975270 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33873))))

(declare-fun b!1443027 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98016 (_ BitVec 32)) SeekEntryResult!11574)

(assert (=> b!1443027 (= e!813189 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633555 lt!633551 mask!2687) (seekEntryOrOpen!0 lt!633555 lt!633551 mask!2687)))))

(declare-fun b!1443028 () Bool)

(declare-fun res!975274 () Bool)

(assert (=> b!1443028 (=> (not res!975274) (not e!813183))))

(assert (=> b!1443028 (= res!975274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!975265 () Bool)

(assert (=> start!124590 (=> (not res!975265) (not e!813183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124590 (= res!975265 (validMask!0 mask!2687))))

(assert (=> start!124590 e!813183))

(assert (=> start!124590 true))

(declare-fun array_inv!36530 (array!98016) Bool)

(assert (=> start!124590 (array_inv!36530 a!2862)))

(declare-fun b!1443029 () Bool)

(declare-fun res!975273 () Bool)

(assert (=> b!1443029 (=> (not res!975273) (not e!813183))))

(assert (=> b!1443029 (= res!975273 (validKeyInArray!0 (select (arr!47297 a!2862) i!1006)))))

(declare-fun b!1443030 () Bool)

(assert (=> b!1443030 (= e!813185 (or (= (select (arr!47297 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47297 a!2862) intermediateBeforeIndex!19) (select (arr!47297 a!2862) j!93))))))

(assert (= (and start!124590 res!975265) b!1443023))

(assert (= (and b!1443023 res!975264) b!1443029))

(assert (= (and b!1443029 res!975273) b!1443017))

(assert (= (and b!1443017 res!975267) b!1443028))

(assert (= (and b!1443028 res!975274) b!1443026))

(assert (= (and b!1443026 res!975270) b!1443020))

(assert (= (and b!1443020 res!975268) b!1443013))

(assert (= (and b!1443013 res!975271) b!1443021))

(assert (= (and b!1443021 res!975272) b!1443016))

(assert (= (and b!1443016 res!975263) b!1443022))

(assert (= (and b!1443022 res!975259) b!1443019))

(assert (= (and b!1443019 c!133390) b!1443018))

(assert (= (and b!1443019 (not c!133390)) b!1443027))

(assert (= (and b!1443019 res!975269) b!1443025))

(assert (= (and b!1443025 res!975261) b!1443024))

(assert (= (and b!1443024 res!975262) b!1443015))

(assert (= (and b!1443015 res!975266) b!1443030))

(assert (= (and b!1443024 (not res!975260)) b!1443014))

(declare-fun m!1331623 () Bool)

(assert (=> b!1443027 m!1331623))

(declare-fun m!1331625 () Bool)

(assert (=> b!1443027 m!1331625))

(declare-fun m!1331627 () Bool)

(assert (=> b!1443021 m!1331627))

(assert (=> b!1443021 m!1331627))

(declare-fun m!1331629 () Bool)

(assert (=> b!1443021 m!1331629))

(assert (=> b!1443021 m!1331629))

(assert (=> b!1443021 m!1331627))

(declare-fun m!1331631 () Bool)

(assert (=> b!1443021 m!1331631))

(declare-fun m!1331633 () Bool)

(assert (=> b!1443026 m!1331633))

(declare-fun m!1331635 () Bool)

(assert (=> b!1443024 m!1331635))

(declare-fun m!1331637 () Bool)

(assert (=> b!1443024 m!1331637))

(declare-fun m!1331639 () Bool)

(assert (=> b!1443024 m!1331639))

(declare-fun m!1331641 () Bool)

(assert (=> b!1443024 m!1331641))

(declare-fun m!1331643 () Bool)

(assert (=> b!1443024 m!1331643))

(assert (=> b!1443024 m!1331627))

(declare-fun m!1331645 () Bool)

(assert (=> b!1443014 m!1331645))

(declare-fun m!1331647 () Bool)

(assert (=> b!1443018 m!1331647))

(assert (=> b!1443015 m!1331627))

(assert (=> b!1443015 m!1331627))

(declare-fun m!1331649 () Bool)

(assert (=> b!1443015 m!1331649))

(declare-fun m!1331651 () Bool)

(assert (=> b!1443030 m!1331651))

(assert (=> b!1443030 m!1331627))

(declare-fun m!1331653 () Bool)

(assert (=> b!1443022 m!1331653))

(assert (=> b!1443022 m!1331653))

(declare-fun m!1331655 () Bool)

(assert (=> b!1443022 m!1331655))

(assert (=> b!1443022 m!1331637))

(declare-fun m!1331657 () Bool)

(assert (=> b!1443022 m!1331657))

(assert (=> b!1443016 m!1331627))

(assert (=> b!1443016 m!1331627))

(declare-fun m!1331659 () Bool)

(assert (=> b!1443016 m!1331659))

(declare-fun m!1331661 () Bool)

(assert (=> b!1443028 m!1331661))

(declare-fun m!1331663 () Bool)

(assert (=> b!1443029 m!1331663))

(assert (=> b!1443029 m!1331663))

(declare-fun m!1331665 () Bool)

(assert (=> b!1443029 m!1331665))

(assert (=> b!1443013 m!1331637))

(declare-fun m!1331667 () Bool)

(assert (=> b!1443013 m!1331667))

(declare-fun m!1331669 () Bool)

(assert (=> start!124590 m!1331669))

(declare-fun m!1331671 () Bool)

(assert (=> start!124590 m!1331671))

(assert (=> b!1443017 m!1331627))

(assert (=> b!1443017 m!1331627))

(declare-fun m!1331673 () Bool)

(assert (=> b!1443017 m!1331673))

(push 1)

(assert (not b!1443016))

(assert (not b!1443028))

(assert (not b!1443014))

(assert (not b!1443029))

(assert (not b!1443015))

(assert (not b!1443022))

(assert (not start!124590))

(assert (not b!1443026))

(assert (not b!1443021))

(assert (not b!1443027))

(assert (not b!1443017))

(assert (not b!1443018))

(assert (not b!1443024))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

