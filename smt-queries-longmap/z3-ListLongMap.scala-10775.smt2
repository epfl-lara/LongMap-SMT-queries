; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126118 () Bool)

(assert start!126118)

(declare-fun b!1476781 () Bool)

(declare-fun e!828499 () Bool)

(declare-fun e!828501 () Bool)

(assert (=> b!1476781 (= e!828499 e!828501)))

(declare-fun res!1003081 () Bool)

(assert (=> b!1476781 (=> res!1003081 e!828501)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99202 0))(
  ( (array!99203 (arr!47881 (Array (_ BitVec 32) (_ BitVec 64))) (size!48433 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99202)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1476781 (= res!1003081 (or (and (= (select (arr!47881 a!2862) index!646) (select (store (arr!47881 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47881 a!2862) index!646) (select (arr!47881 a!2862) j!93))) (not (= (select (arr!47881 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!644959 () (_ BitVec 64))

(declare-fun lt!644960 () array!99202)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!828503 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1476782 () Bool)

(declare-datatypes ((SeekEntryResult!12146 0))(
  ( (MissingZero!12146 (index!50976 (_ BitVec 32))) (Found!12146 (index!50977 (_ BitVec 32))) (Intermediate!12146 (undefined!12958 Bool) (index!50978 (_ BitVec 32)) (x!132572 (_ BitVec 32))) (Undefined!12146) (MissingVacant!12146 (index!50979 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99202 (_ BitVec 32)) SeekEntryResult!12146)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99202 (_ BitVec 32)) SeekEntryResult!12146)

(assert (=> b!1476782 (= e!828503 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644959 lt!644960 mask!2687) (seekEntryOrOpen!0 lt!644959 lt!644960 mask!2687)))))

(declare-fun b!1476783 () Bool)

(declare-fun res!1003075 () Bool)

(declare-fun e!828500 () Bool)

(assert (=> b!1476783 (=> (not res!1003075) (not e!828500))))

(assert (=> b!1476783 (= res!1003075 e!828503)))

(declare-fun c!136375 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1476783 (= c!136375 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1476784 () Bool)

(declare-fun res!1003076 () Bool)

(declare-fun e!828498 () Bool)

(assert (=> b!1476784 (=> (not res!1003076) (not e!828498))))

(declare-fun lt!644962 () SeekEntryResult!12146)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99202 (_ BitVec 32)) SeekEntryResult!12146)

(assert (=> b!1476784 (= res!1003076 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47881 a!2862) j!93) a!2862 mask!2687) lt!644962))))

(declare-fun b!1476785 () Bool)

(declare-fun res!1003082 () Bool)

(declare-fun e!828504 () Bool)

(assert (=> b!1476785 (=> (not res!1003082) (not e!828504))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476785 (= res!1003082 (validKeyInArray!0 (select (arr!47881 a!2862) j!93)))))

(declare-fun b!1476786 () Bool)

(declare-fun res!1003083 () Bool)

(assert (=> b!1476786 (=> (not res!1003083) (not e!828504))))

(assert (=> b!1476786 (= res!1003083 (and (= (size!48433 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48433 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48433 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1476787 () Bool)

(declare-fun res!1003078 () Bool)

(assert (=> b!1476787 (=> (not res!1003078) (not e!828504))))

(declare-datatypes ((List!34460 0))(
  ( (Nil!34457) (Cons!34456 (h!35824 (_ BitVec 64)) (t!49146 List!34460)) )
))
(declare-fun arrayNoDuplicates!0 (array!99202 (_ BitVec 32) List!34460) Bool)

(assert (=> b!1476787 (= res!1003078 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34457))))

(declare-fun b!1476788 () Bool)

(assert (=> b!1476788 (= e!828498 e!828500)))

(declare-fun res!1003086 () Bool)

(assert (=> b!1476788 (=> (not res!1003086) (not e!828500))))

(declare-fun lt!644964 () SeekEntryResult!12146)

(assert (=> b!1476788 (= res!1003086 (= lt!644964 (Intermediate!12146 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476788 (= lt!644964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644959 mask!2687) lt!644959 lt!644960 mask!2687))))

(assert (=> b!1476788 (= lt!644959 (select (store (arr!47881 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!828497 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1476789 () Bool)

(assert (=> b!1476789 (= e!828497 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1476790 () Bool)

(assert (=> b!1476790 (= e!828501 e!828497)))

(declare-fun res!1003077 () Bool)

(assert (=> b!1476790 (=> (not res!1003077) (not e!828497))))

(declare-fun lt!644963 () SeekEntryResult!12146)

(assert (=> b!1476790 (= res!1003077 (= lt!644963 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47881 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1476791 () Bool)

(assert (=> b!1476791 (= e!828503 (= lt!644964 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644959 lt!644960 mask!2687)))))

(declare-fun b!1476792 () Bool)

(declare-fun e!828502 () Bool)

(assert (=> b!1476792 (= e!828504 e!828502)))

(declare-fun res!1003090 () Bool)

(assert (=> b!1476792 (=> (not res!1003090) (not e!828502))))

(assert (=> b!1476792 (= res!1003090 (= (select (store (arr!47881 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476792 (= lt!644960 (array!99203 (store (arr!47881 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48433 a!2862)))))

(declare-fun res!1003087 () Bool)

(assert (=> start!126118 (=> (not res!1003087) (not e!828504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126118 (= res!1003087 (validMask!0 mask!2687))))

(assert (=> start!126118 e!828504))

(assert (=> start!126118 true))

(declare-fun array_inv!37114 (array!99202) Bool)

(assert (=> start!126118 (array_inv!37114 a!2862)))

(declare-fun b!1476793 () Bool)

(assert (=> b!1476793 (= e!828502 e!828498)))

(declare-fun res!1003080 () Bool)

(assert (=> b!1476793 (=> (not res!1003080) (not e!828498))))

(assert (=> b!1476793 (= res!1003080 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47881 a!2862) j!93) mask!2687) (select (arr!47881 a!2862) j!93) a!2862 mask!2687) lt!644962))))

(assert (=> b!1476793 (= lt!644962 (Intermediate!12146 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476794 () Bool)

(declare-fun res!1003088 () Bool)

(assert (=> b!1476794 (=> (not res!1003088) (not e!828504))))

(assert (=> b!1476794 (= res!1003088 (validKeyInArray!0 (select (arr!47881 a!2862) i!1006)))))

(declare-fun b!1476795 () Bool)

(declare-fun res!1003084 () Bool)

(assert (=> b!1476795 (=> (not res!1003084) (not e!828504))))

(assert (=> b!1476795 (= res!1003084 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48433 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48433 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48433 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476796 () Bool)

(declare-fun res!1003089 () Bool)

(assert (=> b!1476796 (=> (not res!1003089) (not e!828500))))

(assert (=> b!1476796 (= res!1003089 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1476797 () Bool)

(declare-fun res!1003085 () Bool)

(assert (=> b!1476797 (=> (not res!1003085) (not e!828504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99202 (_ BitVec 32)) Bool)

(assert (=> b!1476797 (= res!1003085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476798 () Bool)

(assert (=> b!1476798 (= e!828500 (not true))))

(assert (=> b!1476798 e!828499))

(declare-fun res!1003079 () Bool)

(assert (=> b!1476798 (=> (not res!1003079) (not e!828499))))

(assert (=> b!1476798 (= res!1003079 (and (= lt!644963 (Found!12146 j!93)) (or (= (select (arr!47881 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47881 a!2862) intermediateBeforeIndex!19) (select (arr!47881 a!2862) j!93)))))))

(assert (=> b!1476798 (= lt!644963 (seekEntryOrOpen!0 (select (arr!47881 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1476798 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49473 0))(
  ( (Unit!49474) )
))
(declare-fun lt!644961 () Unit!49473)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99202 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49473)

(assert (=> b!1476798 (= lt!644961 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126118 res!1003087) b!1476786))

(assert (= (and b!1476786 res!1003083) b!1476794))

(assert (= (and b!1476794 res!1003088) b!1476785))

(assert (= (and b!1476785 res!1003082) b!1476797))

(assert (= (and b!1476797 res!1003085) b!1476787))

(assert (= (and b!1476787 res!1003078) b!1476795))

(assert (= (and b!1476795 res!1003084) b!1476792))

(assert (= (and b!1476792 res!1003090) b!1476793))

(assert (= (and b!1476793 res!1003080) b!1476784))

(assert (= (and b!1476784 res!1003076) b!1476788))

(assert (= (and b!1476788 res!1003086) b!1476783))

(assert (= (and b!1476783 c!136375) b!1476791))

(assert (= (and b!1476783 (not c!136375)) b!1476782))

(assert (= (and b!1476783 res!1003075) b!1476796))

(assert (= (and b!1476796 res!1003089) b!1476798))

(assert (= (and b!1476798 res!1003079) b!1476781))

(assert (= (and b!1476781 (not res!1003081)) b!1476790))

(assert (= (and b!1476790 res!1003077) b!1476789))

(declare-fun m!1362267 () Bool)

(assert (=> b!1476790 m!1362267))

(assert (=> b!1476790 m!1362267))

(declare-fun m!1362269 () Bool)

(assert (=> b!1476790 m!1362269))

(assert (=> b!1476785 m!1362267))

(assert (=> b!1476785 m!1362267))

(declare-fun m!1362271 () Bool)

(assert (=> b!1476785 m!1362271))

(declare-fun m!1362273 () Bool)

(assert (=> start!126118 m!1362273))

(declare-fun m!1362275 () Bool)

(assert (=> start!126118 m!1362275))

(declare-fun m!1362277 () Bool)

(assert (=> b!1476797 m!1362277))

(assert (=> b!1476793 m!1362267))

(assert (=> b!1476793 m!1362267))

(declare-fun m!1362279 () Bool)

(assert (=> b!1476793 m!1362279))

(assert (=> b!1476793 m!1362279))

(assert (=> b!1476793 m!1362267))

(declare-fun m!1362281 () Bool)

(assert (=> b!1476793 m!1362281))

(declare-fun m!1362283 () Bool)

(assert (=> b!1476788 m!1362283))

(assert (=> b!1476788 m!1362283))

(declare-fun m!1362285 () Bool)

(assert (=> b!1476788 m!1362285))

(declare-fun m!1362287 () Bool)

(assert (=> b!1476788 m!1362287))

(declare-fun m!1362289 () Bool)

(assert (=> b!1476788 m!1362289))

(declare-fun m!1362291 () Bool)

(assert (=> b!1476798 m!1362291))

(declare-fun m!1362293 () Bool)

(assert (=> b!1476798 m!1362293))

(assert (=> b!1476798 m!1362267))

(declare-fun m!1362295 () Bool)

(assert (=> b!1476798 m!1362295))

(declare-fun m!1362297 () Bool)

(assert (=> b!1476798 m!1362297))

(assert (=> b!1476798 m!1362267))

(declare-fun m!1362299 () Bool)

(assert (=> b!1476791 m!1362299))

(assert (=> b!1476784 m!1362267))

(assert (=> b!1476784 m!1362267))

(declare-fun m!1362301 () Bool)

(assert (=> b!1476784 m!1362301))

(assert (=> b!1476792 m!1362287))

(declare-fun m!1362303 () Bool)

(assert (=> b!1476792 m!1362303))

(declare-fun m!1362305 () Bool)

(assert (=> b!1476794 m!1362305))

(assert (=> b!1476794 m!1362305))

(declare-fun m!1362307 () Bool)

(assert (=> b!1476794 m!1362307))

(declare-fun m!1362309 () Bool)

(assert (=> b!1476782 m!1362309))

(declare-fun m!1362311 () Bool)

(assert (=> b!1476782 m!1362311))

(declare-fun m!1362313 () Bool)

(assert (=> b!1476781 m!1362313))

(assert (=> b!1476781 m!1362287))

(declare-fun m!1362315 () Bool)

(assert (=> b!1476781 m!1362315))

(assert (=> b!1476781 m!1362267))

(declare-fun m!1362317 () Bool)

(assert (=> b!1476787 m!1362317))

(check-sat (not b!1476793) (not b!1476797) (not b!1476791) (not b!1476790) (not start!126118) (not b!1476784) (not b!1476787) (not b!1476782) (not b!1476788) (not b!1476794) (not b!1476785) (not b!1476798))
(check-sat)
