; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124824 () Bool)

(assert start!124824)

(declare-fun b!1448712 () Bool)

(declare-fun res!980235 () Bool)

(declare-fun e!815858 () Bool)

(assert (=> b!1448712 (=> (not res!980235) (not e!815858))))

(declare-datatypes ((array!98272 0))(
  ( (array!98273 (arr!47424 (Array (_ BitVec 32) (_ BitVec 64))) (size!47974 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98272)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98272 (_ BitVec 32)) Bool)

(assert (=> b!1448712 (= res!980235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448713 () Bool)

(declare-fun res!980245 () Bool)

(declare-fun e!815860 () Bool)

(assert (=> b!1448713 (=> (not res!980245) (not e!815860))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11676 0))(
  ( (MissingZero!11676 (index!49096 (_ BitVec 32))) (Found!11676 (index!49097 (_ BitVec 32))) (Intermediate!11676 (undefined!12488 Bool) (index!49098 (_ BitVec 32)) (x!130765 (_ BitVec 32))) (Undefined!11676) (MissingVacant!11676 (index!49099 (_ BitVec 32))) )
))
(declare-fun lt!635631 () SeekEntryResult!11676)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98272 (_ BitVec 32)) SeekEntryResult!11676)

(assert (=> b!1448713 (= res!980245 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47424 a!2862) j!93) a!2862 mask!2687) lt!635631))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!815863 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1448715 () Bool)

(assert (=> b!1448715 (= e!815863 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun lt!635634 () SeekEntryResult!11676)

(declare-fun lt!635632 () (_ BitVec 64))

(declare-fun b!1448716 () Bool)

(declare-fun e!815855 () Bool)

(declare-fun lt!635636 () array!98272)

(assert (=> b!1448716 (= e!815855 (= lt!635634 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635632 lt!635636 mask!2687)))))

(declare-fun b!1448717 () Bool)

(declare-fun e!815859 () Bool)

(declare-fun e!815856 () Bool)

(assert (=> b!1448717 (= e!815859 (not e!815856))))

(declare-fun res!980230 () Bool)

(assert (=> b!1448717 (=> res!980230 e!815856)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1448717 (= res!980230 (or (and (= (select (arr!47424 a!2862) index!646) (select (store (arr!47424 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47424 a!2862) index!646) (select (arr!47424 a!2862) j!93))) (not (= (select (arr!47424 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47424 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815862 () Bool)

(assert (=> b!1448717 e!815862))

(declare-fun res!980240 () Bool)

(assert (=> b!1448717 (=> (not res!980240) (not e!815862))))

(declare-fun lt!635633 () SeekEntryResult!11676)

(assert (=> b!1448717 (= res!980240 (and (= lt!635633 (Found!11676 j!93)) (or (= (select (arr!47424 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47424 a!2862) intermediateBeforeIndex!19) (select (arr!47424 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98272 (_ BitVec 32)) SeekEntryResult!11676)

(assert (=> b!1448717 (= lt!635633 (seekEntryOrOpen!0 (select (arr!47424 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1448717 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48848 0))(
  ( (Unit!48849) )
))
(declare-fun lt!635637 () Unit!48848)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48848)

(assert (=> b!1448717 (= lt!635637 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448718 () Bool)

(declare-fun res!980241 () Bool)

(assert (=> b!1448718 (=> (not res!980241) (not e!815858))))

(assert (=> b!1448718 (= res!980241 (and (= (size!47974 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47974 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47974 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448719 () Bool)

(declare-fun e!815857 () Bool)

(assert (=> b!1448719 (= e!815857 e!815863)))

(declare-fun res!980236 () Bool)

(assert (=> b!1448719 (=> (not res!980236) (not e!815863))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98272 (_ BitVec 32)) SeekEntryResult!11676)

(assert (=> b!1448719 (= res!980236 (= lt!635633 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47424 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448720 () Bool)

(declare-fun res!980237 () Bool)

(assert (=> b!1448720 (=> (not res!980237) (not e!815859))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1448720 (= res!980237 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448721 () Bool)

(declare-fun e!815864 () Bool)

(assert (=> b!1448721 (= e!815858 e!815864)))

(declare-fun res!980229 () Bool)

(assert (=> b!1448721 (=> (not res!980229) (not e!815864))))

(assert (=> b!1448721 (= res!980229 (= (select (store (arr!47424 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448721 (= lt!635636 (array!98273 (store (arr!47424 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47974 a!2862)))))

(declare-fun b!1448722 () Bool)

(declare-fun res!980242 () Bool)

(assert (=> b!1448722 (=> (not res!980242) (not e!815858))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448722 (= res!980242 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47974 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47974 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47974 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448723 () Bool)

(assert (=> b!1448723 (= e!815860 e!815859)))

(declare-fun res!980232 () Bool)

(assert (=> b!1448723 (=> (not res!980232) (not e!815859))))

(assert (=> b!1448723 (= res!980232 (= lt!635634 (Intermediate!11676 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448723 (= lt!635634 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635632 mask!2687) lt!635632 lt!635636 mask!2687))))

(assert (=> b!1448723 (= lt!635632 (select (store (arr!47424 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448724 () Bool)

(assert (=> b!1448724 (= e!815855 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635632 lt!635636 mask!2687) (seekEntryOrOpen!0 lt!635632 lt!635636 mask!2687)))))

(declare-fun b!1448725 () Bool)

(assert (=> b!1448725 (= e!815862 e!815857)))

(declare-fun res!980234 () Bool)

(assert (=> b!1448725 (=> res!980234 e!815857)))

(assert (=> b!1448725 (= res!980234 (or (and (= (select (arr!47424 a!2862) index!646) (select (store (arr!47424 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47424 a!2862) index!646) (select (arr!47424 a!2862) j!93))) (not (= (select (arr!47424 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448726 () Bool)

(declare-fun res!980231 () Bool)

(assert (=> b!1448726 (=> (not res!980231) (not e!815858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448726 (= res!980231 (validKeyInArray!0 (select (arr!47424 a!2862) i!1006)))))

(declare-fun res!980233 () Bool)

(assert (=> start!124824 (=> (not res!980233) (not e!815858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124824 (= res!980233 (validMask!0 mask!2687))))

(assert (=> start!124824 e!815858))

(assert (=> start!124824 true))

(declare-fun array_inv!36452 (array!98272) Bool)

(assert (=> start!124824 (array_inv!36452 a!2862)))

(declare-fun b!1448714 () Bool)

(assert (=> b!1448714 (= e!815856 true)))

(declare-fun lt!635635 () SeekEntryResult!11676)

(assert (=> b!1448714 (= lt!635635 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47424 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448727 () Bool)

(declare-fun res!980239 () Bool)

(assert (=> b!1448727 (=> (not res!980239) (not e!815859))))

(assert (=> b!1448727 (= res!980239 e!815855)))

(declare-fun c!133752 () Bool)

(assert (=> b!1448727 (= c!133752 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448728 () Bool)

(declare-fun res!980244 () Bool)

(assert (=> b!1448728 (=> (not res!980244) (not e!815858))))

(assert (=> b!1448728 (= res!980244 (validKeyInArray!0 (select (arr!47424 a!2862) j!93)))))

(declare-fun b!1448729 () Bool)

(declare-fun res!980238 () Bool)

(assert (=> b!1448729 (=> (not res!980238) (not e!815858))))

(declare-datatypes ((List!33925 0))(
  ( (Nil!33922) (Cons!33921 (h!35271 (_ BitVec 64)) (t!48619 List!33925)) )
))
(declare-fun arrayNoDuplicates!0 (array!98272 (_ BitVec 32) List!33925) Bool)

(assert (=> b!1448729 (= res!980238 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33922))))

(declare-fun b!1448730 () Bool)

(assert (=> b!1448730 (= e!815864 e!815860)))

(declare-fun res!980243 () Bool)

(assert (=> b!1448730 (=> (not res!980243) (not e!815860))))

(assert (=> b!1448730 (= res!980243 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47424 a!2862) j!93) mask!2687) (select (arr!47424 a!2862) j!93) a!2862 mask!2687) lt!635631))))

(assert (=> b!1448730 (= lt!635631 (Intermediate!11676 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124824 res!980233) b!1448718))

(assert (= (and b!1448718 res!980241) b!1448726))

(assert (= (and b!1448726 res!980231) b!1448728))

(assert (= (and b!1448728 res!980244) b!1448712))

(assert (= (and b!1448712 res!980235) b!1448729))

(assert (= (and b!1448729 res!980238) b!1448722))

(assert (= (and b!1448722 res!980242) b!1448721))

(assert (= (and b!1448721 res!980229) b!1448730))

(assert (= (and b!1448730 res!980243) b!1448713))

(assert (= (and b!1448713 res!980245) b!1448723))

(assert (= (and b!1448723 res!980232) b!1448727))

(assert (= (and b!1448727 c!133752) b!1448716))

(assert (= (and b!1448727 (not c!133752)) b!1448724))

(assert (= (and b!1448727 res!980239) b!1448720))

(assert (= (and b!1448720 res!980237) b!1448717))

(assert (= (and b!1448717 res!980240) b!1448725))

(assert (= (and b!1448725 (not res!980234)) b!1448719))

(assert (= (and b!1448719 res!980236) b!1448715))

(assert (= (and b!1448717 (not res!980230)) b!1448714))

(declare-fun m!1337461 () Bool)

(assert (=> b!1448714 m!1337461))

(assert (=> b!1448714 m!1337461))

(declare-fun m!1337463 () Bool)

(assert (=> b!1448714 m!1337463))

(declare-fun m!1337465 () Bool)

(assert (=> b!1448716 m!1337465))

(assert (=> b!1448730 m!1337461))

(assert (=> b!1448730 m!1337461))

(declare-fun m!1337467 () Bool)

(assert (=> b!1448730 m!1337467))

(assert (=> b!1448730 m!1337467))

(assert (=> b!1448730 m!1337461))

(declare-fun m!1337469 () Bool)

(assert (=> b!1448730 m!1337469))

(declare-fun m!1337471 () Bool)

(assert (=> b!1448717 m!1337471))

(declare-fun m!1337473 () Bool)

(assert (=> b!1448717 m!1337473))

(declare-fun m!1337475 () Bool)

(assert (=> b!1448717 m!1337475))

(declare-fun m!1337477 () Bool)

(assert (=> b!1448717 m!1337477))

(declare-fun m!1337479 () Bool)

(assert (=> b!1448717 m!1337479))

(assert (=> b!1448717 m!1337461))

(declare-fun m!1337481 () Bool)

(assert (=> b!1448717 m!1337481))

(declare-fun m!1337483 () Bool)

(assert (=> b!1448717 m!1337483))

(assert (=> b!1448717 m!1337461))

(assert (=> b!1448719 m!1337461))

(assert (=> b!1448719 m!1337461))

(declare-fun m!1337485 () Bool)

(assert (=> b!1448719 m!1337485))

(assert (=> b!1448713 m!1337461))

(assert (=> b!1448713 m!1337461))

(declare-fun m!1337487 () Bool)

(assert (=> b!1448713 m!1337487))

(assert (=> b!1448721 m!1337473))

(declare-fun m!1337489 () Bool)

(assert (=> b!1448721 m!1337489))

(declare-fun m!1337491 () Bool)

(assert (=> b!1448724 m!1337491))

(declare-fun m!1337493 () Bool)

(assert (=> b!1448724 m!1337493))

(declare-fun m!1337495 () Bool)

(assert (=> b!1448726 m!1337495))

(assert (=> b!1448726 m!1337495))

(declare-fun m!1337497 () Bool)

(assert (=> b!1448726 m!1337497))

(declare-fun m!1337499 () Bool)

(assert (=> b!1448723 m!1337499))

(assert (=> b!1448723 m!1337499))

(declare-fun m!1337501 () Bool)

(assert (=> b!1448723 m!1337501))

(assert (=> b!1448723 m!1337473))

(declare-fun m!1337503 () Bool)

(assert (=> b!1448723 m!1337503))

(declare-fun m!1337505 () Bool)

(assert (=> b!1448712 m!1337505))

(assert (=> b!1448725 m!1337479))

(assert (=> b!1448725 m!1337473))

(assert (=> b!1448725 m!1337477))

(assert (=> b!1448725 m!1337461))

(declare-fun m!1337507 () Bool)

(assert (=> start!124824 m!1337507))

(declare-fun m!1337509 () Bool)

(assert (=> start!124824 m!1337509))

(assert (=> b!1448728 m!1337461))

(assert (=> b!1448728 m!1337461))

(declare-fun m!1337511 () Bool)

(assert (=> b!1448728 m!1337511))

(declare-fun m!1337513 () Bool)

(assert (=> b!1448729 m!1337513))

(check-sat (not b!1448717) (not b!1448726) (not b!1448728) (not b!1448723) (not b!1448713) (not b!1448719) (not b!1448730) (not b!1448724) (not b!1448714) (not b!1448712) (not b!1448729) (not b!1448716) (not start!124824))
(check-sat)
