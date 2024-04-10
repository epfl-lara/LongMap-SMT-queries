; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126510 () Bool)

(assert start!126510)

(declare-fun b!1483855 () Bool)

(declare-fun res!1008696 () Bool)

(declare-fun e!832002 () Bool)

(assert (=> b!1483855 (=> (not res!1008696) (not e!832002))))

(declare-fun e!832001 () Bool)

(assert (=> b!1483855 (= res!1008696 e!832001)))

(declare-fun c!137106 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1483855 (= c!137106 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483856 () Bool)

(declare-fun res!1008704 () Bool)

(declare-fun e!832000 () Bool)

(assert (=> b!1483856 (=> (not res!1008704) (not e!832000))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99472 0))(
  ( (array!99473 (arr!48012 (Array (_ BitVec 32) (_ BitVec 64))) (size!48562 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99472)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1483856 (= res!1008704 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48562 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48562 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48562 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1008705 () Bool)

(assert (=> start!126510 (=> (not res!1008705) (not e!832000))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126510 (= res!1008705 (validMask!0 mask!2687))))

(assert (=> start!126510 e!832000))

(assert (=> start!126510 true))

(declare-fun array_inv!37040 (array!99472) Bool)

(assert (=> start!126510 (array_inv!37040 a!2862)))

(declare-fun b!1483857 () Bool)

(declare-fun e!832006 () Bool)

(assert (=> b!1483857 (= e!832006 true)))

(declare-fun lt!647568 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483857 (= lt!647568 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1483858 () Bool)

(declare-fun res!1008701 () Bool)

(assert (=> b!1483858 (=> (not res!1008701) (not e!832000))))

(declare-datatypes ((List!34513 0))(
  ( (Nil!34510) (Cons!34509 (h!35883 (_ BitVec 64)) (t!49207 List!34513)) )
))
(declare-fun arrayNoDuplicates!0 (array!99472 (_ BitVec 32) List!34513) Bool)

(assert (=> b!1483858 (= res!1008701 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34510))))

(declare-fun b!1483859 () Bool)

(declare-fun e!831998 () Bool)

(declare-fun e!832004 () Bool)

(assert (=> b!1483859 (= e!831998 e!832004)))

(declare-fun res!1008700 () Bool)

(assert (=> b!1483859 (=> (not res!1008700) (not e!832004))))

(declare-fun lt!647571 () (_ BitVec 64))

(assert (=> b!1483859 (= res!1008700 (and (= index!646 intermediateAfterIndex!19) (= lt!647571 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1483860 () Bool)

(declare-fun res!1008699 () Bool)

(assert (=> b!1483860 (=> (not res!1008699) (not e!832000))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483860 (= res!1008699 (validKeyInArray!0 (select (arr!48012 a!2862) i!1006)))))

(declare-fun b!1483861 () Bool)

(declare-fun res!1008695 () Bool)

(assert (=> b!1483861 (=> (not res!1008695) (not e!832002))))

(assert (=> b!1483861 (= res!1008695 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483862 () Bool)

(declare-fun e!832003 () Bool)

(assert (=> b!1483862 (= e!832000 e!832003)))

(declare-fun res!1008697 () Bool)

(assert (=> b!1483862 (=> (not res!1008697) (not e!832003))))

(assert (=> b!1483862 (= res!1008697 (= (select (store (arr!48012 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647567 () array!99472)

(assert (=> b!1483862 (= lt!647567 (array!99473 (store (arr!48012 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48562 a!2862)))))

(declare-fun lt!647569 () (_ BitVec 64))

(declare-fun b!1483863 () Bool)

(declare-datatypes ((SeekEntryResult!12252 0))(
  ( (MissingZero!12252 (index!51400 (_ BitVec 32))) (Found!12252 (index!51401 (_ BitVec 32))) (Intermediate!12252 (undefined!13064 Bool) (index!51402 (_ BitVec 32)) (x!132984 (_ BitVec 32))) (Undefined!12252) (MissingVacant!12252 (index!51403 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99472 (_ BitVec 32)) SeekEntryResult!12252)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99472 (_ BitVec 32)) SeekEntryResult!12252)

(assert (=> b!1483863 (= e!832004 (= (seekEntryOrOpen!0 lt!647569 lt!647567 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647569 lt!647567 mask!2687)))))

(declare-fun b!1483864 () Bool)

(declare-fun e!831999 () Bool)

(assert (=> b!1483864 (= e!831999 e!831998)))

(declare-fun res!1008693 () Bool)

(assert (=> b!1483864 (=> res!1008693 e!831998)))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1483864 (= res!1008693 (or (and (= (select (arr!48012 a!2862) index!646) lt!647571) (= (select (arr!48012 a!2862) index!646) (select (arr!48012 a!2862) j!93))) (= (select (arr!48012 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483864 (= lt!647571 (select (store (arr!48012 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483865 () Bool)

(declare-fun res!1008706 () Bool)

(assert (=> b!1483865 (=> (not res!1008706) (not e!832000))))

(assert (=> b!1483865 (= res!1008706 (and (= (size!48562 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48562 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48562 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!647566 () SeekEntryResult!12252)

(declare-fun b!1483866 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99472 (_ BitVec 32)) SeekEntryResult!12252)

(assert (=> b!1483866 (= e!832001 (= lt!647566 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647569 lt!647567 mask!2687)))))

(declare-fun b!1483867 () Bool)

(declare-fun res!1008694 () Bool)

(declare-fun e!832005 () Bool)

(assert (=> b!1483867 (=> (not res!1008694) (not e!832005))))

(declare-fun lt!647565 () SeekEntryResult!12252)

(assert (=> b!1483867 (= res!1008694 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48012 a!2862) j!93) a!2862 mask!2687) lt!647565))))

(declare-fun b!1483868 () Bool)

(declare-fun res!1008688 () Bool)

(assert (=> b!1483868 (=> (not res!1008688) (not e!832000))))

(assert (=> b!1483868 (= res!1008688 (validKeyInArray!0 (select (arr!48012 a!2862) j!93)))))

(declare-fun b!1483869 () Bool)

(assert (=> b!1483869 (= e!832003 e!832005)))

(declare-fun res!1008690 () Bool)

(assert (=> b!1483869 (=> (not res!1008690) (not e!832005))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1483869 (= res!1008690 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48012 a!2862) j!93) mask!2687) (select (arr!48012 a!2862) j!93) a!2862 mask!2687) lt!647565))))

(assert (=> b!1483869 (= lt!647565 (Intermediate!12252 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1483870 () Bool)

(declare-fun res!1008691 () Bool)

(assert (=> b!1483870 (=> (not res!1008691) (not e!832000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99472 (_ BitVec 32)) Bool)

(assert (=> b!1483870 (= res!1008691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1483871 () Bool)

(assert (=> b!1483871 (= e!832002 (not e!832006))))

(declare-fun res!1008698 () Bool)

(assert (=> b!1483871 (=> res!1008698 e!832006)))

(assert (=> b!1483871 (= res!1008698 (or (and (= (select (arr!48012 a!2862) index!646) (select (store (arr!48012 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48012 a!2862) index!646) (select (arr!48012 a!2862) j!93))) (= (select (arr!48012 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483871 e!831999))

(declare-fun res!1008692 () Bool)

(assert (=> b!1483871 (=> (not res!1008692) (not e!831999))))

(assert (=> b!1483871 (= res!1008692 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49844 0))(
  ( (Unit!49845) )
))
(declare-fun lt!647570 () Unit!49844)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99472 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49844)

(assert (=> b!1483871 (= lt!647570 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1483872 () Bool)

(declare-fun res!1008703 () Bool)

(assert (=> b!1483872 (=> (not res!1008703) (not e!831999))))

(assert (=> b!1483872 (= res!1008703 (= (seekEntryOrOpen!0 (select (arr!48012 a!2862) j!93) a!2862 mask!2687) (Found!12252 j!93)))))

(declare-fun b!1483873 () Bool)

(assert (=> b!1483873 (= e!832001 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647569 lt!647567 mask!2687) (seekEntryOrOpen!0 lt!647569 lt!647567 mask!2687)))))

(declare-fun b!1483874 () Bool)

(assert (=> b!1483874 (= e!832005 e!832002)))

(declare-fun res!1008689 () Bool)

(assert (=> b!1483874 (=> (not res!1008689) (not e!832002))))

(assert (=> b!1483874 (= res!1008689 (= lt!647566 (Intermediate!12252 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1483874 (= lt!647566 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647569 mask!2687) lt!647569 lt!647567 mask!2687))))

(assert (=> b!1483874 (= lt!647569 (select (store (arr!48012 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1483875 () Bool)

(declare-fun res!1008702 () Bool)

(assert (=> b!1483875 (=> (not res!1008702) (not e!831999))))

(assert (=> b!1483875 (= res!1008702 (or (= (select (arr!48012 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48012 a!2862) intermediateBeforeIndex!19) (select (arr!48012 a!2862) j!93))))))

(assert (= (and start!126510 res!1008705) b!1483865))

(assert (= (and b!1483865 res!1008706) b!1483860))

(assert (= (and b!1483860 res!1008699) b!1483868))

(assert (= (and b!1483868 res!1008688) b!1483870))

(assert (= (and b!1483870 res!1008691) b!1483858))

(assert (= (and b!1483858 res!1008701) b!1483856))

(assert (= (and b!1483856 res!1008704) b!1483862))

(assert (= (and b!1483862 res!1008697) b!1483869))

(assert (= (and b!1483869 res!1008690) b!1483867))

(assert (= (and b!1483867 res!1008694) b!1483874))

(assert (= (and b!1483874 res!1008689) b!1483855))

(assert (= (and b!1483855 c!137106) b!1483866))

(assert (= (and b!1483855 (not c!137106)) b!1483873))

(assert (= (and b!1483855 res!1008696) b!1483861))

(assert (= (and b!1483861 res!1008695) b!1483871))

(assert (= (and b!1483871 res!1008692) b!1483872))

(assert (= (and b!1483872 res!1008703) b!1483875))

(assert (= (and b!1483875 res!1008702) b!1483864))

(assert (= (and b!1483864 (not res!1008693)) b!1483859))

(assert (= (and b!1483859 res!1008700) b!1483863))

(assert (= (and b!1483871 (not res!1008698)) b!1483857))

(declare-fun m!1369265 () Bool)

(assert (=> b!1483873 m!1369265))

(declare-fun m!1369267 () Bool)

(assert (=> b!1483873 m!1369267))

(declare-fun m!1369269 () Bool)

(assert (=> b!1483874 m!1369269))

(assert (=> b!1483874 m!1369269))

(declare-fun m!1369271 () Bool)

(assert (=> b!1483874 m!1369271))

(declare-fun m!1369273 () Bool)

(assert (=> b!1483874 m!1369273))

(declare-fun m!1369275 () Bool)

(assert (=> b!1483874 m!1369275))

(declare-fun m!1369277 () Bool)

(assert (=> b!1483860 m!1369277))

(assert (=> b!1483860 m!1369277))

(declare-fun m!1369279 () Bool)

(assert (=> b!1483860 m!1369279))

(declare-fun m!1369281 () Bool)

(assert (=> b!1483870 m!1369281))

(declare-fun m!1369283 () Bool)

(assert (=> b!1483875 m!1369283))

(declare-fun m!1369285 () Bool)

(assert (=> b!1483875 m!1369285))

(declare-fun m!1369287 () Bool)

(assert (=> b!1483866 m!1369287))

(assert (=> b!1483868 m!1369285))

(assert (=> b!1483868 m!1369285))

(declare-fun m!1369289 () Bool)

(assert (=> b!1483868 m!1369289))

(declare-fun m!1369291 () Bool)

(assert (=> b!1483858 m!1369291))

(assert (=> b!1483862 m!1369273))

(declare-fun m!1369293 () Bool)

(assert (=> b!1483862 m!1369293))

(declare-fun m!1369295 () Bool)

(assert (=> b!1483871 m!1369295))

(assert (=> b!1483871 m!1369273))

(declare-fun m!1369297 () Bool)

(assert (=> b!1483871 m!1369297))

(declare-fun m!1369299 () Bool)

(assert (=> b!1483871 m!1369299))

(declare-fun m!1369301 () Bool)

(assert (=> b!1483871 m!1369301))

(assert (=> b!1483871 m!1369285))

(assert (=> b!1483863 m!1369267))

(assert (=> b!1483863 m!1369265))

(declare-fun m!1369303 () Bool)

(assert (=> start!126510 m!1369303))

(declare-fun m!1369305 () Bool)

(assert (=> start!126510 m!1369305))

(assert (=> b!1483869 m!1369285))

(assert (=> b!1483869 m!1369285))

(declare-fun m!1369307 () Bool)

(assert (=> b!1483869 m!1369307))

(assert (=> b!1483869 m!1369307))

(assert (=> b!1483869 m!1369285))

(declare-fun m!1369309 () Bool)

(assert (=> b!1483869 m!1369309))

(assert (=> b!1483872 m!1369285))

(assert (=> b!1483872 m!1369285))

(declare-fun m!1369311 () Bool)

(assert (=> b!1483872 m!1369311))

(declare-fun m!1369313 () Bool)

(assert (=> b!1483857 m!1369313))

(assert (=> b!1483864 m!1369299))

(assert (=> b!1483864 m!1369285))

(assert (=> b!1483864 m!1369273))

(assert (=> b!1483864 m!1369297))

(assert (=> b!1483867 m!1369285))

(assert (=> b!1483867 m!1369285))

(declare-fun m!1369315 () Bool)

(assert (=> b!1483867 m!1369315))

(check-sat (not b!1483874) (not b!1483863) (not b!1483873) (not b!1483871) (not b!1483872) (not b!1483870) (not b!1483858) (not b!1483867) (not b!1483868) (not b!1483857) (not b!1483866) (not b!1483860) (not start!126510) (not b!1483869))
(check-sat)
