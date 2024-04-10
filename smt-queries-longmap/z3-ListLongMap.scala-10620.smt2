; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124860 () Bool)

(assert start!124860)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1449743 () Bool)

(declare-fun e!816395 () Bool)

(declare-datatypes ((array!98308 0))(
  ( (array!98309 (arr!47442 (Array (_ BitVec 32) (_ BitVec 64))) (size!47992 (_ BitVec 32))) )
))
(declare-fun lt!636015 () array!98308)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11694 0))(
  ( (MissingZero!11694 (index!49168 (_ BitVec 32))) (Found!11694 (index!49169 (_ BitVec 32))) (Intermediate!11694 (undefined!12506 Bool) (index!49170 (_ BitVec 32)) (x!130831 (_ BitVec 32))) (Undefined!11694) (MissingVacant!11694 (index!49171 (_ BitVec 32))) )
))
(declare-fun lt!636016 () SeekEntryResult!11694)

(declare-fun lt!636018 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98308 (_ BitVec 32)) SeekEntryResult!11694)

(assert (=> b!1449743 (= e!816395 (= lt!636016 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636018 lt!636015 mask!2687)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun e!816396 () Bool)

(declare-fun b!1449745 () Bool)

(assert (=> b!1449745 (= e!816396 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449746 () Bool)

(declare-fun e!816402 () Bool)

(declare-fun e!816403 () Bool)

(assert (=> b!1449746 (= e!816402 e!816403)))

(declare-fun res!981161 () Bool)

(assert (=> b!1449746 (=> res!981161 e!816403)))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98308)

(assert (=> b!1449746 (= res!981161 (or (and (= (select (arr!47442 a!2862) index!646) (select (store (arr!47442 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47442 a!2862) index!646) (select (arr!47442 a!2862) j!93))) (not (= (select (arr!47442 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449747 () Bool)

(declare-fun res!981165 () Bool)

(declare-fun e!816398 () Bool)

(assert (=> b!1449747 (=> (not res!981165) (not e!816398))))

(declare-datatypes ((List!33943 0))(
  ( (Nil!33940) (Cons!33939 (h!35289 (_ BitVec 64)) (t!48637 List!33943)) )
))
(declare-fun arrayNoDuplicates!0 (array!98308 (_ BitVec 32) List!33943) Bool)

(assert (=> b!1449747 (= res!981165 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33940))))

(declare-fun b!1449748 () Bool)

(declare-fun e!816400 () Bool)

(assert (=> b!1449748 (= e!816400 true)))

(declare-fun lt!636019 () SeekEntryResult!11694)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98308 (_ BitVec 32)) SeekEntryResult!11694)

(assert (=> b!1449748 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636018 lt!636015 mask!2687) lt!636019)))

(declare-datatypes ((Unit!48884 0))(
  ( (Unit!48885) )
))
(declare-fun lt!636020 () Unit!48884)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48884)

(assert (=> b!1449748 (= lt!636020 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1449749 () Bool)

(declare-fun res!981154 () Bool)

(assert (=> b!1449749 (=> (not res!981154) (not e!816398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449749 (= res!981154 (validKeyInArray!0 (select (arr!47442 a!2862) i!1006)))))

(declare-fun b!1449750 () Bool)

(declare-fun res!981158 () Bool)

(assert (=> b!1449750 (=> (not res!981158) (not e!816398))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1449750 (= res!981158 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47992 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47992 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47992 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449751 () Bool)

(declare-fun res!981153 () Bool)

(assert (=> b!1449751 (=> (not res!981153) (not e!816398))))

(assert (=> b!1449751 (= res!981153 (and (= (size!47992 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47992 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47992 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449752 () Bool)

(declare-fun e!816399 () Bool)

(declare-fun e!816397 () Bool)

(assert (=> b!1449752 (= e!816399 e!816397)))

(declare-fun res!981159 () Bool)

(assert (=> b!1449752 (=> (not res!981159) (not e!816397))))

(declare-fun lt!636014 () SeekEntryResult!11694)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449752 (= res!981159 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47442 a!2862) j!93) mask!2687) (select (arr!47442 a!2862) j!93) a!2862 mask!2687) lt!636014))))

(assert (=> b!1449752 (= lt!636014 (Intermediate!11694 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449753 () Bool)

(assert (=> b!1449753 (= e!816398 e!816399)))

(declare-fun res!981162 () Bool)

(assert (=> b!1449753 (=> (not res!981162) (not e!816399))))

(assert (=> b!1449753 (= res!981162 (= (select (store (arr!47442 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449753 (= lt!636015 (array!98309 (store (arr!47442 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47992 a!2862)))))

(declare-fun b!1449754 () Bool)

(declare-fun res!981157 () Bool)

(declare-fun e!816404 () Bool)

(assert (=> b!1449754 (=> (not res!981157) (not e!816404))))

(assert (=> b!1449754 (= res!981157 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449755 () Bool)

(assert (=> b!1449755 (= e!816397 e!816404)))

(declare-fun res!981152 () Bool)

(assert (=> b!1449755 (=> (not res!981152) (not e!816404))))

(assert (=> b!1449755 (= res!981152 (= lt!636016 (Intermediate!11694 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1449755 (= lt!636016 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636018 mask!2687) lt!636018 lt!636015 mask!2687))))

(assert (=> b!1449755 (= lt!636018 (select (store (arr!47442 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!981160 () Bool)

(assert (=> start!124860 (=> (not res!981160) (not e!816398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124860 (= res!981160 (validMask!0 mask!2687))))

(assert (=> start!124860 e!816398))

(assert (=> start!124860 true))

(declare-fun array_inv!36470 (array!98308) Bool)

(assert (=> start!124860 (array_inv!36470 a!2862)))

(declare-fun b!1449744 () Bool)

(declare-fun res!981155 () Bool)

(assert (=> b!1449744 (=> (not res!981155) (not e!816398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98308 (_ BitVec 32)) Bool)

(assert (=> b!1449744 (= res!981155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1449756 () Bool)

(declare-fun res!981168 () Bool)

(assert (=> b!1449756 (=> (not res!981168) (not e!816404))))

(assert (=> b!1449756 (= res!981168 e!816395)))

(declare-fun c!133806 () Bool)

(assert (=> b!1449756 (= c!133806 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449757 () Bool)

(declare-fun res!981156 () Bool)

(assert (=> b!1449757 (=> (not res!981156) (not e!816397))))

(assert (=> b!1449757 (= res!981156 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47442 a!2862) j!93) a!2862 mask!2687) lt!636014))))

(declare-fun b!1449758 () Bool)

(assert (=> b!1449758 (= e!816404 (not e!816400))))

(declare-fun res!981164 () Bool)

(assert (=> b!1449758 (=> res!981164 e!816400)))

(assert (=> b!1449758 (= res!981164 (or (and (= (select (arr!47442 a!2862) index!646) (select (store (arr!47442 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47442 a!2862) index!646) (select (arr!47442 a!2862) j!93))) (not (= (select (arr!47442 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47442 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1449758 e!816402))

(declare-fun res!981167 () Bool)

(assert (=> b!1449758 (=> (not res!981167) (not e!816402))))

(declare-fun lt!636021 () SeekEntryResult!11694)

(assert (=> b!1449758 (= res!981167 (and (= lt!636021 lt!636019) (or (= (select (arr!47442 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47442 a!2862) intermediateBeforeIndex!19) (select (arr!47442 a!2862) j!93)))))))

(assert (=> b!1449758 (= lt!636019 (Found!11694 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98308 (_ BitVec 32)) SeekEntryResult!11694)

(assert (=> b!1449758 (= lt!636021 (seekEntryOrOpen!0 (select (arr!47442 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1449758 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!636017 () Unit!48884)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48884)

(assert (=> b!1449758 (= lt!636017 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449759 () Bool)

(assert (=> b!1449759 (= e!816403 e!816396)))

(declare-fun res!981166 () Bool)

(assert (=> b!1449759 (=> (not res!981166) (not e!816396))))

(assert (=> b!1449759 (= res!981166 (= lt!636021 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47442 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449760 () Bool)

(assert (=> b!1449760 (= e!816395 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636018 lt!636015 mask!2687) (seekEntryOrOpen!0 lt!636018 lt!636015 mask!2687)))))

(declare-fun b!1449761 () Bool)

(declare-fun res!981169 () Bool)

(assert (=> b!1449761 (=> res!981169 e!816400)))

(assert (=> b!1449761 (= res!981169 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47442 a!2862) j!93) a!2862 mask!2687) lt!636019)))))

(declare-fun b!1449762 () Bool)

(declare-fun res!981163 () Bool)

(assert (=> b!1449762 (=> (not res!981163) (not e!816398))))

(assert (=> b!1449762 (= res!981163 (validKeyInArray!0 (select (arr!47442 a!2862) j!93)))))

(assert (= (and start!124860 res!981160) b!1449751))

(assert (= (and b!1449751 res!981153) b!1449749))

(assert (= (and b!1449749 res!981154) b!1449762))

(assert (= (and b!1449762 res!981163) b!1449744))

(assert (= (and b!1449744 res!981155) b!1449747))

(assert (= (and b!1449747 res!981165) b!1449750))

(assert (= (and b!1449750 res!981158) b!1449753))

(assert (= (and b!1449753 res!981162) b!1449752))

(assert (= (and b!1449752 res!981159) b!1449757))

(assert (= (and b!1449757 res!981156) b!1449755))

(assert (= (and b!1449755 res!981152) b!1449756))

(assert (= (and b!1449756 c!133806) b!1449743))

(assert (= (and b!1449756 (not c!133806)) b!1449760))

(assert (= (and b!1449756 res!981168) b!1449754))

(assert (= (and b!1449754 res!981157) b!1449758))

(assert (= (and b!1449758 res!981167) b!1449746))

(assert (= (and b!1449746 (not res!981161)) b!1449759))

(assert (= (and b!1449759 res!981166) b!1449745))

(assert (= (and b!1449758 (not res!981164)) b!1449761))

(assert (= (and b!1449761 (not res!981169)) b!1449748))

(declare-fun m!1338435 () Bool)

(assert (=> b!1449753 m!1338435))

(declare-fun m!1338437 () Bool)

(assert (=> b!1449753 m!1338437))

(declare-fun m!1338439 () Bool)

(assert (=> b!1449749 m!1338439))

(assert (=> b!1449749 m!1338439))

(declare-fun m!1338441 () Bool)

(assert (=> b!1449749 m!1338441))

(declare-fun m!1338443 () Bool)

(assert (=> start!124860 m!1338443))

(declare-fun m!1338445 () Bool)

(assert (=> start!124860 m!1338445))

(declare-fun m!1338447 () Bool)

(assert (=> b!1449752 m!1338447))

(assert (=> b!1449752 m!1338447))

(declare-fun m!1338449 () Bool)

(assert (=> b!1449752 m!1338449))

(assert (=> b!1449752 m!1338449))

(assert (=> b!1449752 m!1338447))

(declare-fun m!1338451 () Bool)

(assert (=> b!1449752 m!1338451))

(declare-fun m!1338453 () Bool)

(assert (=> b!1449748 m!1338453))

(declare-fun m!1338455 () Bool)

(assert (=> b!1449748 m!1338455))

(declare-fun m!1338457 () Bool)

(assert (=> b!1449743 m!1338457))

(declare-fun m!1338459 () Bool)

(assert (=> b!1449744 m!1338459))

(assert (=> b!1449759 m!1338447))

(assert (=> b!1449759 m!1338447))

(declare-fun m!1338461 () Bool)

(assert (=> b!1449759 m!1338461))

(assert (=> b!1449757 m!1338447))

(assert (=> b!1449757 m!1338447))

(declare-fun m!1338463 () Bool)

(assert (=> b!1449757 m!1338463))

(declare-fun m!1338465 () Bool)

(assert (=> b!1449746 m!1338465))

(assert (=> b!1449746 m!1338435))

(declare-fun m!1338467 () Bool)

(assert (=> b!1449746 m!1338467))

(assert (=> b!1449746 m!1338447))

(assert (=> b!1449760 m!1338453))

(declare-fun m!1338469 () Bool)

(assert (=> b!1449760 m!1338469))

(assert (=> b!1449761 m!1338447))

(assert (=> b!1449761 m!1338447))

(declare-fun m!1338471 () Bool)

(assert (=> b!1449761 m!1338471))

(assert (=> b!1449762 m!1338447))

(assert (=> b!1449762 m!1338447))

(declare-fun m!1338473 () Bool)

(assert (=> b!1449762 m!1338473))

(declare-fun m!1338475 () Bool)

(assert (=> b!1449758 m!1338475))

(assert (=> b!1449758 m!1338435))

(declare-fun m!1338477 () Bool)

(assert (=> b!1449758 m!1338477))

(assert (=> b!1449758 m!1338467))

(assert (=> b!1449758 m!1338465))

(assert (=> b!1449758 m!1338447))

(declare-fun m!1338479 () Bool)

(assert (=> b!1449758 m!1338479))

(declare-fun m!1338481 () Bool)

(assert (=> b!1449758 m!1338481))

(assert (=> b!1449758 m!1338447))

(declare-fun m!1338483 () Bool)

(assert (=> b!1449747 m!1338483))

(declare-fun m!1338485 () Bool)

(assert (=> b!1449755 m!1338485))

(assert (=> b!1449755 m!1338485))

(declare-fun m!1338487 () Bool)

(assert (=> b!1449755 m!1338487))

(assert (=> b!1449755 m!1338435))

(declare-fun m!1338489 () Bool)

(assert (=> b!1449755 m!1338489))

(check-sat (not b!1449762) (not b!1449743) (not b!1449760) (not b!1449752) (not b!1449759) (not b!1449757) (not b!1449749) (not b!1449744) (not b!1449758) (not start!124860) (not b!1449761) (not b!1449747) (not b!1449748) (not b!1449755))
(check-sat)
