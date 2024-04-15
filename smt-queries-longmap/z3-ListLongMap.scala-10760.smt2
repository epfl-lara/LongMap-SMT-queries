; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125848 () Bool)

(assert start!125848)

(declare-fun b!1473208 () Bool)

(declare-fun res!1000648 () Bool)

(declare-fun e!826705 () Bool)

(assert (=> b!1473208 (=> (not res!1000648) (not e!826705))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99103 0))(
  ( (array!99104 (arr!47836 (Array (_ BitVec 32) (_ BitVec 64))) (size!48388 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99103)

(assert (=> b!1473208 (= res!1000648 (and (= (size!48388 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48388 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48388 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1473209 () Bool)

(declare-fun res!1000649 () Bool)

(declare-fun e!826709 () Bool)

(assert (=> b!1473209 (=> (not res!1000649) (not e!826709))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1473209 (= res!1000649 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1473210 () Bool)

(declare-fun res!1000654 () Bool)

(assert (=> b!1473210 (=> (not res!1000654) (not e!826709))))

(declare-fun e!826706 () Bool)

(assert (=> b!1473210 (= res!1000654 e!826706)))

(declare-fun c!135799 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1473210 (= c!135799 (bvsle x!665 intermediateAfterX!19))))

(declare-fun e!826708 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1473211 () Bool)

(assert (=> b!1473211 (= e!826708 (or (= (select (arr!47836 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47836 a!2862) intermediateBeforeIndex!19) (select (arr!47836 a!2862) j!93))))))

(declare-fun b!1473212 () Bool)

(declare-fun res!1000655 () Bool)

(declare-fun e!826703 () Bool)

(assert (=> b!1473212 (=> (not res!1000655) (not e!826703))))

(declare-datatypes ((SeekEntryResult!12101 0))(
  ( (MissingZero!12101 (index!50796 (_ BitVec 32))) (Found!12101 (index!50797 (_ BitVec 32))) (Intermediate!12101 (undefined!12913 Bool) (index!50798 (_ BitVec 32)) (x!132380 (_ BitVec 32))) (Undefined!12101) (MissingVacant!12101 (index!50799 (_ BitVec 32))) )
))
(declare-fun lt!643683 () SeekEntryResult!12101)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99103 (_ BitVec 32)) SeekEntryResult!12101)

(assert (=> b!1473212 (= res!1000655 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47836 a!2862) j!93) a!2862 mask!2687) lt!643683))))

(declare-fun b!1473213 () Bool)

(declare-fun res!1000659 () Bool)

(assert (=> b!1473213 (=> (not res!1000659) (not e!826705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473213 (= res!1000659 (validKeyInArray!0 (select (arr!47836 a!2862) j!93)))))

(declare-fun b!1473214 () Bool)

(declare-fun e!826704 () Bool)

(assert (=> b!1473214 (= e!826705 e!826704)))

(declare-fun res!1000652 () Bool)

(assert (=> b!1473214 (=> (not res!1000652) (not e!826704))))

(assert (=> b!1473214 (= res!1000652 (= (select (store (arr!47836 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643682 () array!99103)

(assert (=> b!1473214 (= lt!643682 (array!99104 (store (arr!47836 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48388 a!2862)))))

(declare-fun b!1473215 () Bool)

(declare-fun e!826710 () Bool)

(assert (=> b!1473215 (= e!826710 true)))

(declare-fun lt!643681 () SeekEntryResult!12101)

(declare-fun lt!643686 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99103 (_ BitVec 32)) SeekEntryResult!12101)

(assert (=> b!1473215 (= lt!643681 (seekEntryOrOpen!0 lt!643686 lt!643682 mask!2687))))

(declare-fun b!1473216 () Bool)

(declare-fun res!1000645 () Bool)

(assert (=> b!1473216 (=> (not res!1000645) (not e!826705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99103 (_ BitVec 32)) Bool)

(assert (=> b!1473216 (= res!1000645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473217 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99103 (_ BitVec 32)) SeekEntryResult!12101)

(assert (=> b!1473217 (= e!826706 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643686 lt!643682 mask!2687) (seekEntryOrOpen!0 lt!643686 lt!643682 mask!2687)))))

(declare-fun res!1000657 () Bool)

(assert (=> start!125848 (=> (not res!1000657) (not e!826705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125848 (= res!1000657 (validMask!0 mask!2687))))

(assert (=> start!125848 e!826705))

(assert (=> start!125848 true))

(declare-fun array_inv!37069 (array!99103) Bool)

(assert (=> start!125848 (array_inv!37069 a!2862)))

(declare-fun lt!643684 () SeekEntryResult!12101)

(declare-fun b!1473218 () Bool)

(assert (=> b!1473218 (= e!826706 (= lt!643684 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643686 lt!643682 mask!2687)))))

(declare-fun b!1473219 () Bool)

(declare-fun res!1000651 () Bool)

(assert (=> b!1473219 (=> (not res!1000651) (not e!826705))))

(assert (=> b!1473219 (= res!1000651 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48388 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48388 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48388 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1473220 () Bool)

(declare-fun res!1000660 () Bool)

(assert (=> b!1473220 (=> (not res!1000660) (not e!826705))))

(assert (=> b!1473220 (= res!1000660 (validKeyInArray!0 (select (arr!47836 a!2862) i!1006)))))

(declare-fun b!1473221 () Bool)

(assert (=> b!1473221 (= e!826704 e!826703)))

(declare-fun res!1000653 () Bool)

(assert (=> b!1473221 (=> (not res!1000653) (not e!826703))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473221 (= res!1000653 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47836 a!2862) j!93) mask!2687) (select (arr!47836 a!2862) j!93) a!2862 mask!2687) lt!643683))))

(assert (=> b!1473221 (= lt!643683 (Intermediate!12101 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473222 () Bool)

(declare-fun res!1000650 () Bool)

(assert (=> b!1473222 (=> (not res!1000650) (not e!826705))))

(declare-datatypes ((List!34415 0))(
  ( (Nil!34412) (Cons!34411 (h!35770 (_ BitVec 64)) (t!49101 List!34415)) )
))
(declare-fun arrayNoDuplicates!0 (array!99103 (_ BitVec 32) List!34415) Bool)

(assert (=> b!1473222 (= res!1000650 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34412))))

(declare-fun b!1473223 () Bool)

(declare-fun res!1000658 () Bool)

(assert (=> b!1473223 (=> (not res!1000658) (not e!826708))))

(assert (=> b!1473223 (= res!1000658 (= (seekEntryOrOpen!0 (select (arr!47836 a!2862) j!93) a!2862 mask!2687) (Found!12101 j!93)))))

(declare-fun b!1473224 () Bool)

(assert (=> b!1473224 (= e!826703 e!826709)))

(declare-fun res!1000656 () Bool)

(assert (=> b!1473224 (=> (not res!1000656) (not e!826709))))

(assert (=> b!1473224 (= res!1000656 (= lt!643684 (Intermediate!12101 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1473224 (= lt!643684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643686 mask!2687) lt!643686 lt!643682 mask!2687))))

(assert (=> b!1473224 (= lt!643686 (select (store (arr!47836 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1473225 () Bool)

(assert (=> b!1473225 (= e!826709 (not e!826710))))

(declare-fun res!1000646 () Bool)

(assert (=> b!1473225 (=> res!1000646 e!826710)))

(assert (=> b!1473225 (= res!1000646 (or (not (= (select (arr!47836 a!2862) index!646) (select (store (arr!47836 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47836 a!2862) index!646) (select (arr!47836 a!2862) j!93)))))))

(assert (=> b!1473225 e!826708))

(declare-fun res!1000647 () Bool)

(assert (=> b!1473225 (=> (not res!1000647) (not e!826708))))

(assert (=> b!1473225 (= res!1000647 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49383 0))(
  ( (Unit!49384) )
))
(declare-fun lt!643685 () Unit!49383)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99103 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49383)

(assert (=> b!1473225 (= lt!643685 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125848 res!1000657) b!1473208))

(assert (= (and b!1473208 res!1000648) b!1473220))

(assert (= (and b!1473220 res!1000660) b!1473213))

(assert (= (and b!1473213 res!1000659) b!1473216))

(assert (= (and b!1473216 res!1000645) b!1473222))

(assert (= (and b!1473222 res!1000650) b!1473219))

(assert (= (and b!1473219 res!1000651) b!1473214))

(assert (= (and b!1473214 res!1000652) b!1473221))

(assert (= (and b!1473221 res!1000653) b!1473212))

(assert (= (and b!1473212 res!1000655) b!1473224))

(assert (= (and b!1473224 res!1000656) b!1473210))

(assert (= (and b!1473210 c!135799) b!1473218))

(assert (= (and b!1473210 (not c!135799)) b!1473217))

(assert (= (and b!1473210 res!1000654) b!1473209))

(assert (= (and b!1473209 res!1000649) b!1473225))

(assert (= (and b!1473225 res!1000647) b!1473223))

(assert (= (and b!1473223 res!1000658) b!1473211))

(assert (= (and b!1473225 (not res!1000646)) b!1473215))

(declare-fun m!1359255 () Bool)

(assert (=> b!1473224 m!1359255))

(assert (=> b!1473224 m!1359255))

(declare-fun m!1359257 () Bool)

(assert (=> b!1473224 m!1359257))

(declare-fun m!1359259 () Bool)

(assert (=> b!1473224 m!1359259))

(declare-fun m!1359261 () Bool)

(assert (=> b!1473224 m!1359261))

(declare-fun m!1359263 () Bool)

(assert (=> start!125848 m!1359263))

(declare-fun m!1359265 () Bool)

(assert (=> start!125848 m!1359265))

(declare-fun m!1359267 () Bool)

(assert (=> b!1473223 m!1359267))

(assert (=> b!1473223 m!1359267))

(declare-fun m!1359269 () Bool)

(assert (=> b!1473223 m!1359269))

(declare-fun m!1359271 () Bool)

(assert (=> b!1473217 m!1359271))

(declare-fun m!1359273 () Bool)

(assert (=> b!1473217 m!1359273))

(assert (=> b!1473213 m!1359267))

(assert (=> b!1473213 m!1359267))

(declare-fun m!1359275 () Bool)

(assert (=> b!1473213 m!1359275))

(assert (=> b!1473212 m!1359267))

(assert (=> b!1473212 m!1359267))

(declare-fun m!1359277 () Bool)

(assert (=> b!1473212 m!1359277))

(declare-fun m!1359279 () Bool)

(assert (=> b!1473225 m!1359279))

(assert (=> b!1473225 m!1359259))

(declare-fun m!1359281 () Bool)

(assert (=> b!1473225 m!1359281))

(declare-fun m!1359283 () Bool)

(assert (=> b!1473225 m!1359283))

(declare-fun m!1359285 () Bool)

(assert (=> b!1473225 m!1359285))

(assert (=> b!1473225 m!1359267))

(declare-fun m!1359287 () Bool)

(assert (=> b!1473222 m!1359287))

(declare-fun m!1359289 () Bool)

(assert (=> b!1473218 m!1359289))

(assert (=> b!1473215 m!1359273))

(assert (=> b!1473221 m!1359267))

(assert (=> b!1473221 m!1359267))

(declare-fun m!1359291 () Bool)

(assert (=> b!1473221 m!1359291))

(assert (=> b!1473221 m!1359291))

(assert (=> b!1473221 m!1359267))

(declare-fun m!1359293 () Bool)

(assert (=> b!1473221 m!1359293))

(declare-fun m!1359295 () Bool)

(assert (=> b!1473216 m!1359295))

(declare-fun m!1359297 () Bool)

(assert (=> b!1473220 m!1359297))

(assert (=> b!1473220 m!1359297))

(declare-fun m!1359299 () Bool)

(assert (=> b!1473220 m!1359299))

(assert (=> b!1473214 m!1359259))

(declare-fun m!1359301 () Bool)

(assert (=> b!1473214 m!1359301))

(declare-fun m!1359303 () Bool)

(assert (=> b!1473211 m!1359303))

(assert (=> b!1473211 m!1359267))

(check-sat (not start!125848) (not b!1473221) (not b!1473222) (not b!1473212) (not b!1473225) (not b!1473220) (not b!1473224) (not b!1473216) (not b!1473215) (not b!1473223) (not b!1473218) (not b!1473213) (not b!1473217))
(check-sat)
