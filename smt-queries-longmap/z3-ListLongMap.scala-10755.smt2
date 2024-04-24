; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126066 () Bool)

(assert start!126066)

(declare-fun res!1000566 () Bool)

(declare-fun e!827346 () Bool)

(assert (=> start!126066 (=> (not res!1000566) (not e!827346))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126066 (= res!1000566 (validMask!0 mask!2687))))

(assert (=> start!126066 e!827346))

(assert (=> start!126066 true))

(declare-datatypes ((array!99238 0))(
  ( (array!99239 (arr!47899 (Array (_ BitVec 32) (_ BitVec 64))) (size!48450 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99238)

(declare-fun array_inv!37180 (array!99238) Bool)

(assert (=> start!126066 (array_inv!37180 a!2862)))

(declare-fun b!1473972 () Bool)

(declare-fun res!1000568 () Bool)

(assert (=> b!1473972 (=> (not res!1000568) (not e!827346))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1473972 (= res!1000568 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48450 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48450 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48450 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1473973 () Bool)

(declare-fun res!1000565 () Bool)

(assert (=> b!1473973 (=> (not res!1000565) (not e!827346))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473973 (= res!1000565 (validKeyInArray!0 (select (arr!47899 a!2862) j!93)))))

(declare-fun e!827340 () Bool)

(declare-fun b!1473974 () Bool)

(assert (=> b!1473974 (= e!827340 (or (= (select (arr!47899 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47899 a!2862) intermediateBeforeIndex!19) (select (arr!47899 a!2862) j!93))))))

(declare-fun b!1473975 () Bool)

(declare-fun res!1000570 () Bool)

(assert (=> b!1473975 (=> (not res!1000570) (not e!827346))))

(declare-datatypes ((List!34387 0))(
  ( (Nil!34384) (Cons!34383 (h!35753 (_ BitVec 64)) (t!49073 List!34387)) )
))
(declare-fun arrayNoDuplicates!0 (array!99238 (_ BitVec 32) List!34387) Bool)

(assert (=> b!1473975 (= res!1000570 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34384))))

(declare-fun b!1473976 () Bool)

(declare-fun res!1000562 () Bool)

(assert (=> b!1473976 (=> (not res!1000562) (not e!827346))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1473976 (= res!1000562 (validKeyInArray!0 (select (arr!47899 a!2862) i!1006)))))

(declare-fun b!1473977 () Bool)

(declare-fun res!1000559 () Bool)

(declare-fun e!827342 () Bool)

(assert (=> b!1473977 (=> (not res!1000559) (not e!827342))))

(declare-datatypes ((SeekEntryResult!12036 0))(
  ( (MissingZero!12036 (index!50536 (_ BitVec 32))) (Found!12036 (index!50537 (_ BitVec 32))) (Intermediate!12036 (undefined!12848 Bool) (index!50538 (_ BitVec 32)) (x!132304 (_ BitVec 32))) (Undefined!12036) (MissingVacant!12036 (index!50539 (_ BitVec 32))) )
))
(declare-fun lt!644161 () SeekEntryResult!12036)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99238 (_ BitVec 32)) SeekEntryResult!12036)

(assert (=> b!1473977 (= res!1000559 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47899 a!2862) j!93) a!2862 mask!2687) lt!644161))))

(declare-fun lt!644157 () array!99238)

(declare-fun lt!644160 () (_ BitVec 64))

(declare-fun e!827344 () Bool)

(declare-fun b!1473978 () Bool)

(declare-fun lt!644158 () SeekEntryResult!12036)

(assert (=> b!1473978 (= e!827344 (= lt!644158 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644160 lt!644157 mask!2687)))))

(declare-fun b!1473979 () Bool)

(declare-fun res!1000569 () Bool)

(assert (=> b!1473979 (=> (not res!1000569) (not e!827346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99238 (_ BitVec 32)) Bool)

(assert (=> b!1473979 (= res!1000569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473980 () Bool)

(declare-fun res!1000563 () Bool)

(declare-fun e!827341 () Bool)

(assert (=> b!1473980 (=> (not res!1000563) (not e!827341))))

(assert (=> b!1473980 (= res!1000563 e!827344)))

(declare-fun c!136231 () Bool)

(assert (=> b!1473980 (= c!136231 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1473981 () Bool)

(assert (=> b!1473981 (= e!827342 e!827341)))

(declare-fun res!1000571 () Bool)

(assert (=> b!1473981 (=> (not res!1000571) (not e!827341))))

(assert (=> b!1473981 (= res!1000571 (= lt!644158 (Intermediate!12036 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473981 (= lt!644158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644160 mask!2687) lt!644160 lt!644157 mask!2687))))

(assert (=> b!1473981 (= lt!644160 (select (store (arr!47899 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1473982 () Bool)

(declare-fun e!827343 () Bool)

(assert (=> b!1473982 (= e!827343 e!827342)))

(declare-fun res!1000561 () Bool)

(assert (=> b!1473982 (=> (not res!1000561) (not e!827342))))

(assert (=> b!1473982 (= res!1000561 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47899 a!2862) j!93) mask!2687) (select (arr!47899 a!2862) j!93) a!2862 mask!2687) lt!644161))))

(assert (=> b!1473982 (= lt!644161 (Intermediate!12036 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473983 () Bool)

(assert (=> b!1473983 (= e!827346 e!827343)))

(declare-fun res!1000560 () Bool)

(assert (=> b!1473983 (=> (not res!1000560) (not e!827343))))

(assert (=> b!1473983 (= res!1000560 (= (select (store (arr!47899 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473983 (= lt!644157 (array!99239 (store (arr!47899 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48450 a!2862)))))

(declare-fun b!1473984 () Bool)

(declare-fun res!1000558 () Bool)

(assert (=> b!1473984 (=> (not res!1000558) (not e!827340))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99238 (_ BitVec 32)) SeekEntryResult!12036)

(assert (=> b!1473984 (= res!1000558 (= (seekEntryOrOpen!0 (select (arr!47899 a!2862) j!93) a!2862 mask!2687) (Found!12036 j!93)))))

(declare-fun b!1473985 () Bool)

(declare-fun res!1000564 () Bool)

(assert (=> b!1473985 (=> (not res!1000564) (not e!827346))))

(assert (=> b!1473985 (= res!1000564 (and (= (size!48450 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48450 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48450 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1473986 () Bool)

(assert (=> b!1473986 (= e!827341 (not true))))

(assert (=> b!1473986 e!827340))

(declare-fun res!1000557 () Bool)

(assert (=> b!1473986 (=> (not res!1000557) (not e!827340))))

(assert (=> b!1473986 (= res!1000557 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49445 0))(
  ( (Unit!49446) )
))
(declare-fun lt!644159 () Unit!49445)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99238 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49445)

(assert (=> b!1473986 (= lt!644159 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1473987 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99238 (_ BitVec 32)) SeekEntryResult!12036)

(assert (=> b!1473987 (= e!827344 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644160 lt!644157 mask!2687) (seekEntryOrOpen!0 lt!644160 lt!644157 mask!2687)))))

(declare-fun b!1473988 () Bool)

(declare-fun res!1000567 () Bool)

(assert (=> b!1473988 (=> (not res!1000567) (not e!827341))))

(assert (=> b!1473988 (= res!1000567 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126066 res!1000566) b!1473985))

(assert (= (and b!1473985 res!1000564) b!1473976))

(assert (= (and b!1473976 res!1000562) b!1473973))

(assert (= (and b!1473973 res!1000565) b!1473979))

(assert (= (and b!1473979 res!1000569) b!1473975))

(assert (= (and b!1473975 res!1000570) b!1473972))

(assert (= (and b!1473972 res!1000568) b!1473983))

(assert (= (and b!1473983 res!1000560) b!1473982))

(assert (= (and b!1473982 res!1000561) b!1473977))

(assert (= (and b!1473977 res!1000559) b!1473981))

(assert (= (and b!1473981 res!1000571) b!1473980))

(assert (= (and b!1473980 c!136231) b!1473978))

(assert (= (and b!1473980 (not c!136231)) b!1473987))

(assert (= (and b!1473980 res!1000563) b!1473988))

(assert (= (and b!1473988 res!1000567) b!1473986))

(assert (= (and b!1473986 res!1000557) b!1473984))

(assert (= (and b!1473984 res!1000558) b!1473974))

(declare-fun m!1360681 () Bool)

(assert (=> b!1473979 m!1360681))

(declare-fun m!1360683 () Bool)

(assert (=> start!126066 m!1360683))

(declare-fun m!1360685 () Bool)

(assert (=> start!126066 m!1360685))

(declare-fun m!1360687 () Bool)

(assert (=> b!1473982 m!1360687))

(assert (=> b!1473982 m!1360687))

(declare-fun m!1360689 () Bool)

(assert (=> b!1473982 m!1360689))

(assert (=> b!1473982 m!1360689))

(assert (=> b!1473982 m!1360687))

(declare-fun m!1360691 () Bool)

(assert (=> b!1473982 m!1360691))

(declare-fun m!1360693 () Bool)

(assert (=> b!1473976 m!1360693))

(assert (=> b!1473976 m!1360693))

(declare-fun m!1360695 () Bool)

(assert (=> b!1473976 m!1360695))

(declare-fun m!1360697 () Bool)

(assert (=> b!1473981 m!1360697))

(assert (=> b!1473981 m!1360697))

(declare-fun m!1360699 () Bool)

(assert (=> b!1473981 m!1360699))

(declare-fun m!1360701 () Bool)

(assert (=> b!1473981 m!1360701))

(declare-fun m!1360703 () Bool)

(assert (=> b!1473981 m!1360703))

(assert (=> b!1473983 m!1360701))

(declare-fun m!1360705 () Bool)

(assert (=> b!1473983 m!1360705))

(declare-fun m!1360707 () Bool)

(assert (=> b!1473974 m!1360707))

(assert (=> b!1473974 m!1360687))

(assert (=> b!1473984 m!1360687))

(assert (=> b!1473984 m!1360687))

(declare-fun m!1360709 () Bool)

(assert (=> b!1473984 m!1360709))

(assert (=> b!1473977 m!1360687))

(assert (=> b!1473977 m!1360687))

(declare-fun m!1360711 () Bool)

(assert (=> b!1473977 m!1360711))

(assert (=> b!1473973 m!1360687))

(assert (=> b!1473973 m!1360687))

(declare-fun m!1360713 () Bool)

(assert (=> b!1473973 m!1360713))

(declare-fun m!1360715 () Bool)

(assert (=> b!1473986 m!1360715))

(declare-fun m!1360717 () Bool)

(assert (=> b!1473986 m!1360717))

(declare-fun m!1360719 () Bool)

(assert (=> b!1473987 m!1360719))

(declare-fun m!1360721 () Bool)

(assert (=> b!1473987 m!1360721))

(declare-fun m!1360723 () Bool)

(assert (=> b!1473975 m!1360723))

(declare-fun m!1360725 () Bool)

(assert (=> b!1473978 m!1360725))

(check-sat (not b!1473981) (not b!1473975) (not b!1473978) (not start!126066) (not b!1473987) (not b!1473979) (not b!1473984) (not b!1473977) (not b!1473982) (not b!1473976) (not b!1473986) (not b!1473973))
(check-sat)
