; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125640 () Bool)

(assert start!125640)

(declare-fun b!1467127 () Bool)

(declare-fun res!994926 () Bool)

(declare-fun e!824491 () Bool)

(assert (=> b!1467127 (=> (not res!994926) (not e!824491))))

(declare-datatypes ((array!98926 0))(
  ( (array!98927 (arr!47746 (Array (_ BitVec 32) (_ BitVec 64))) (size!48297 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98926)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11895 0))(
  ( (MissingZero!11895 (index!49972 (_ BitVec 32))) (Found!11895 (index!49973 (_ BitVec 32))) (Intermediate!11895 (undefined!12707 Bool) (index!49974 (_ BitVec 32)) (x!131737 (_ BitVec 32))) (Undefined!11895) (MissingVacant!11895 (index!49975 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98926 (_ BitVec 32)) SeekEntryResult!11895)

(assert (=> b!1467127 (= res!994926 (= (seekEntryOrOpen!0 (select (arr!47746 a!2862) j!93) a!2862 mask!2687) (Found!11895 j!93)))))

(declare-fun b!1467128 () Bool)

(declare-fun res!994923 () Bool)

(declare-fun e!824492 () Bool)

(assert (=> b!1467128 (=> (not res!994923) (not e!824492))))

(declare-fun e!824490 () Bool)

(assert (=> b!1467128 (= res!994923 e!824490)))

(declare-fun c!135625 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1467128 (= c!135625 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1467129 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1467129 (= e!824491 (or (= (select (arr!47746 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47746 a!2862) intermediateBeforeIndex!19) (select (arr!47746 a!2862) j!93))))))

(declare-fun b!1467130 () Bool)

(declare-fun res!994930 () Bool)

(declare-fun e!824485 () Bool)

(assert (=> b!1467130 (=> (not res!994930) (not e!824485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98926 (_ BitVec 32)) Bool)

(assert (=> b!1467130 (= res!994930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467131 () Bool)

(declare-fun e!824493 () Bool)

(declare-fun e!824489 () Bool)

(assert (=> b!1467131 (= e!824493 e!824489)))

(declare-fun res!994921 () Bool)

(assert (=> b!1467131 (=> (not res!994921) (not e!824489))))

(declare-fun lt!642036 () SeekEntryResult!11895)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98926 (_ BitVec 32)) SeekEntryResult!11895)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467131 (= res!994921 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47746 a!2862) j!93) mask!2687) (select (arr!47746 a!2862) j!93) a!2862 mask!2687) lt!642036))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1467131 (= lt!642036 (Intermediate!11895 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467132 () Bool)

(declare-fun e!824484 () Bool)

(declare-fun e!824487 () Bool)

(assert (=> b!1467132 (= e!824484 e!824487)))

(declare-fun res!994937 () Bool)

(assert (=> b!1467132 (=> res!994937 e!824487)))

(declare-fun lt!642039 () (_ BitVec 32))

(assert (=> b!1467132 (= res!994937 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!642039 #b00000000000000000000000000000000) (bvsge lt!642039 (size!48297 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467132 (= lt!642039 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1467133 () Bool)

(declare-fun res!994927 () Bool)

(assert (=> b!1467133 (=> (not res!994927) (not e!824489))))

(assert (=> b!1467133 (= res!994927 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47746 a!2862) j!93) a!2862 mask!2687) lt!642036))))

(declare-fun b!1467134 () Bool)

(declare-fun res!994929 () Bool)

(assert (=> b!1467134 (=> (not res!994929) (not e!824485))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467134 (= res!994929 (and (= (size!48297 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48297 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48297 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467135 () Bool)

(assert (=> b!1467135 (= e!824492 (not e!824484))))

(declare-fun res!994922 () Bool)

(assert (=> b!1467135 (=> res!994922 e!824484)))

(assert (=> b!1467135 (= res!994922 (or (and (= (select (arr!47746 a!2862) index!646) (select (store (arr!47746 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47746 a!2862) index!646) (select (arr!47746 a!2862) j!93))) (= (select (arr!47746 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1467135 e!824491))

(declare-fun res!994933 () Bool)

(assert (=> b!1467135 (=> (not res!994933) (not e!824491))))

(assert (=> b!1467135 (= res!994933 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49319 0))(
  ( (Unit!49320) )
))
(declare-fun lt!642040 () Unit!49319)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98926 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49319)

(assert (=> b!1467135 (= lt!642040 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1467136 () Bool)

(declare-fun res!994935 () Bool)

(assert (=> b!1467136 (=> (not res!994935) (not e!824485))))

(declare-datatypes ((List!34234 0))(
  ( (Nil!34231) (Cons!34230 (h!35594 (_ BitVec 64)) (t!48920 List!34234)) )
))
(declare-fun arrayNoDuplicates!0 (array!98926 (_ BitVec 32) List!34234) Bool)

(assert (=> b!1467136 (= res!994935 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34231))))

(declare-fun b!1467137 () Bool)

(declare-fun res!994932 () Bool)

(assert (=> b!1467137 (=> (not res!994932) (not e!824492))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467137 (= res!994932 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1467138 () Bool)

(declare-fun res!994924 () Bool)

(assert (=> b!1467138 (=> (not res!994924) (not e!824485))))

(assert (=> b!1467138 (= res!994924 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48297 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48297 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48297 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!642034 () (_ BitVec 64))

(declare-fun b!1467139 () Bool)

(declare-fun lt!642035 () array!98926)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98926 (_ BitVec 32)) SeekEntryResult!11895)

(assert (=> b!1467139 (= e!824490 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642034 lt!642035 mask!2687) (seekEntryOrOpen!0 lt!642034 lt!642035 mask!2687)))))

(declare-fun e!824488 () Bool)

(declare-fun b!1467140 () Bool)

(assert (=> b!1467140 (= e!824488 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642039 intermediateAfterIndex!19 lt!642034 lt!642035 mask!2687) (seekEntryOrOpen!0 lt!642034 lt!642035 mask!2687))))))

(declare-fun res!994928 () Bool)

(assert (=> start!125640 (=> (not res!994928) (not e!824485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125640 (= res!994928 (validMask!0 mask!2687))))

(assert (=> start!125640 e!824485))

(assert (=> start!125640 true))

(declare-fun array_inv!37027 (array!98926) Bool)

(assert (=> start!125640 (array_inv!37027 a!2862)))

(declare-fun b!1467141 () Bool)

(declare-fun res!994936 () Bool)

(assert (=> b!1467141 (=> res!994936 e!824487)))

(assert (=> b!1467141 (= res!994936 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642039 (select (arr!47746 a!2862) j!93) a!2862 mask!2687) lt!642036)))))

(declare-fun b!1467142 () Bool)

(declare-fun res!994920 () Bool)

(assert (=> b!1467142 (=> (not res!994920) (not e!824485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467142 (= res!994920 (validKeyInArray!0 (select (arr!47746 a!2862) i!1006)))))

(declare-fun b!1467143 () Bool)

(assert (=> b!1467143 (= e!824489 e!824492)))

(declare-fun res!994934 () Bool)

(assert (=> b!1467143 (=> (not res!994934) (not e!824492))))

(declare-fun lt!642037 () SeekEntryResult!11895)

(assert (=> b!1467143 (= res!994934 (= lt!642037 (Intermediate!11895 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1467143 (= lt!642037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642034 mask!2687) lt!642034 lt!642035 mask!2687))))

(assert (=> b!1467143 (= lt!642034 (select (store (arr!47746 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1467144 () Bool)

(assert (=> b!1467144 (= e!824487 true)))

(declare-fun lt!642038 () Bool)

(assert (=> b!1467144 (= lt!642038 e!824488)))

(declare-fun c!135624 () Bool)

(assert (=> b!1467144 (= c!135624 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1467145 () Bool)

(assert (=> b!1467145 (= e!824488 (not (= lt!642037 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642039 lt!642034 lt!642035 mask!2687))))))

(declare-fun b!1467146 () Bool)

(assert (=> b!1467146 (= e!824490 (= lt!642037 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642034 lt!642035 mask!2687)))))

(declare-fun b!1467147 () Bool)

(assert (=> b!1467147 (= e!824485 e!824493)))

(declare-fun res!994925 () Bool)

(assert (=> b!1467147 (=> (not res!994925) (not e!824493))))

(assert (=> b!1467147 (= res!994925 (= (select (store (arr!47746 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1467147 (= lt!642035 (array!98927 (store (arr!47746 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48297 a!2862)))))

(declare-fun b!1467148 () Bool)

(declare-fun res!994931 () Bool)

(assert (=> b!1467148 (=> (not res!994931) (not e!824485))))

(assert (=> b!1467148 (= res!994931 (validKeyInArray!0 (select (arr!47746 a!2862) j!93)))))

(assert (= (and start!125640 res!994928) b!1467134))

(assert (= (and b!1467134 res!994929) b!1467142))

(assert (= (and b!1467142 res!994920) b!1467148))

(assert (= (and b!1467148 res!994931) b!1467130))

(assert (= (and b!1467130 res!994930) b!1467136))

(assert (= (and b!1467136 res!994935) b!1467138))

(assert (= (and b!1467138 res!994924) b!1467147))

(assert (= (and b!1467147 res!994925) b!1467131))

(assert (= (and b!1467131 res!994921) b!1467133))

(assert (= (and b!1467133 res!994927) b!1467143))

(assert (= (and b!1467143 res!994934) b!1467128))

(assert (= (and b!1467128 c!135625) b!1467146))

(assert (= (and b!1467128 (not c!135625)) b!1467139))

(assert (= (and b!1467128 res!994923) b!1467137))

(assert (= (and b!1467137 res!994932) b!1467135))

(assert (= (and b!1467135 res!994933) b!1467127))

(assert (= (and b!1467127 res!994926) b!1467129))

(assert (= (and b!1467135 (not res!994922)) b!1467132))

(assert (= (and b!1467132 (not res!994937)) b!1467141))

(assert (= (and b!1467141 (not res!994936)) b!1467144))

(assert (= (and b!1467144 c!135624) b!1467145))

(assert (= (and b!1467144 (not c!135624)) b!1467140))

(declare-fun m!1354201 () Bool)

(assert (=> b!1467135 m!1354201))

(declare-fun m!1354203 () Bool)

(assert (=> b!1467135 m!1354203))

(declare-fun m!1354205 () Bool)

(assert (=> b!1467135 m!1354205))

(declare-fun m!1354207 () Bool)

(assert (=> b!1467135 m!1354207))

(declare-fun m!1354209 () Bool)

(assert (=> b!1467135 m!1354209))

(declare-fun m!1354211 () Bool)

(assert (=> b!1467135 m!1354211))

(declare-fun m!1354213 () Bool)

(assert (=> b!1467136 m!1354213))

(assert (=> b!1467141 m!1354211))

(assert (=> b!1467141 m!1354211))

(declare-fun m!1354215 () Bool)

(assert (=> b!1467141 m!1354215))

(declare-fun m!1354217 () Bool)

(assert (=> b!1467145 m!1354217))

(declare-fun m!1354219 () Bool)

(assert (=> b!1467140 m!1354219))

(declare-fun m!1354221 () Bool)

(assert (=> b!1467140 m!1354221))

(assert (=> b!1467147 m!1354203))

(declare-fun m!1354223 () Bool)

(assert (=> b!1467147 m!1354223))

(declare-fun m!1354225 () Bool)

(assert (=> b!1467143 m!1354225))

(assert (=> b!1467143 m!1354225))

(declare-fun m!1354227 () Bool)

(assert (=> b!1467143 m!1354227))

(assert (=> b!1467143 m!1354203))

(declare-fun m!1354229 () Bool)

(assert (=> b!1467143 m!1354229))

(assert (=> b!1467133 m!1354211))

(assert (=> b!1467133 m!1354211))

(declare-fun m!1354231 () Bool)

(assert (=> b!1467133 m!1354231))

(declare-fun m!1354233 () Bool)

(assert (=> b!1467130 m!1354233))

(declare-fun m!1354235 () Bool)

(assert (=> b!1467139 m!1354235))

(assert (=> b!1467139 m!1354221))

(declare-fun m!1354237 () Bool)

(assert (=> b!1467129 m!1354237))

(assert (=> b!1467129 m!1354211))

(assert (=> b!1467148 m!1354211))

(assert (=> b!1467148 m!1354211))

(declare-fun m!1354239 () Bool)

(assert (=> b!1467148 m!1354239))

(declare-fun m!1354241 () Bool)

(assert (=> b!1467132 m!1354241))

(assert (=> b!1467131 m!1354211))

(assert (=> b!1467131 m!1354211))

(declare-fun m!1354243 () Bool)

(assert (=> b!1467131 m!1354243))

(assert (=> b!1467131 m!1354243))

(assert (=> b!1467131 m!1354211))

(declare-fun m!1354245 () Bool)

(assert (=> b!1467131 m!1354245))

(assert (=> b!1467127 m!1354211))

(assert (=> b!1467127 m!1354211))

(declare-fun m!1354247 () Bool)

(assert (=> b!1467127 m!1354247))

(declare-fun m!1354249 () Bool)

(assert (=> start!125640 m!1354249))

(declare-fun m!1354251 () Bool)

(assert (=> start!125640 m!1354251))

(declare-fun m!1354253 () Bool)

(assert (=> b!1467146 m!1354253))

(declare-fun m!1354255 () Bool)

(assert (=> b!1467142 m!1354255))

(assert (=> b!1467142 m!1354255))

(declare-fun m!1354257 () Bool)

(assert (=> b!1467142 m!1354257))

(check-sat (not b!1467132) (not b!1467148) (not b!1467136) (not b!1467141) (not b!1467131) (not b!1467140) (not b!1467142) (not start!125640) (not b!1467146) (not b!1467133) (not b!1467135) (not b!1467130) (not b!1467143) (not b!1467145) (not b!1467139) (not b!1467127))
(check-sat)
