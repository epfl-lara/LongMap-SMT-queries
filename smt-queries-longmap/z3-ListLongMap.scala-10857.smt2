; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127398 () Bool)

(assert start!127398)

(declare-fun b!1495960 () Bool)

(declare-fun res!1017263 () Bool)

(declare-fun e!838054 () Bool)

(assert (=> b!1495960 (=> (not res!1017263) (not e!838054))))

(declare-fun e!838059 () Bool)

(assert (=> b!1495960 (= res!1017263 e!838059)))

(declare-fun c!138892 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1495960 (= c!138892 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1495961 () Bool)

(declare-fun lt!651935 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12342 0))(
  ( (MissingZero!12342 (index!51760 (_ BitVec 32))) (Found!12342 (index!51761 (_ BitVec 32))) (Intermediate!12342 (undefined!13154 Bool) (index!51762 (_ BitVec 32)) (x!133543 (_ BitVec 32))) (Undefined!12342) (MissingVacant!12342 (index!51763 (_ BitVec 32))) )
))
(declare-fun lt!651932 () SeekEntryResult!12342)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99883 0))(
  ( (array!99884 (arr!48205 (Array (_ BitVec 32) (_ BitVec 64))) (size!48756 (_ BitVec 32))) )
))
(declare-fun lt!651936 () array!99883)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99883 (_ BitVec 32)) SeekEntryResult!12342)

(assert (=> b!1495961 (= e!838059 (= lt!651932 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651935 lt!651936 mask!2687)))))

(declare-fun b!1495962 () Bool)

(declare-fun res!1017268 () Bool)

(assert (=> b!1495962 (=> (not res!1017268) (not e!838054))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1495962 (= res!1017268 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1495963 () Bool)

(declare-fun res!1017270 () Bool)

(declare-fun e!838052 () Bool)

(assert (=> b!1495963 (=> (not res!1017270) (not e!838052))))

(declare-fun a!2862 () array!99883)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99883 (_ BitVec 32)) Bool)

(assert (=> b!1495963 (= res!1017270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1495964 () Bool)

(declare-fun e!838055 () Bool)

(declare-fun e!838058 () Bool)

(assert (=> b!1495964 (= e!838055 e!838058)))

(declare-fun res!1017260 () Bool)

(assert (=> b!1495964 (=> res!1017260 e!838058)))

(declare-fun lt!651934 () (_ BitVec 32))

(assert (=> b!1495964 (= res!1017260 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651934 #b00000000000000000000000000000000) (bvsge lt!651934 (size!48756 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495964 (= lt!651934 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1495965 () Bool)

(declare-fun e!838051 () Bool)

(declare-fun e!838056 () Bool)

(assert (=> b!1495965 (= e!838051 e!838056)))

(declare-fun res!1017258 () Bool)

(assert (=> b!1495965 (=> (not res!1017258) (not e!838056))))

(declare-fun lt!651937 () SeekEntryResult!12342)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495965 (= res!1017258 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48205 a!2862) j!93) mask!2687) (select (arr!48205 a!2862) j!93) a!2862 mask!2687) lt!651937))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1495965 (= lt!651937 (Intermediate!12342 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1495966 () Bool)

(assert (=> b!1495966 (= e!838054 (not e!838055))))

(declare-fun res!1017271 () Bool)

(assert (=> b!1495966 (=> res!1017271 e!838055)))

(assert (=> b!1495966 (= res!1017271 (or (and (= (select (arr!48205 a!2862) index!646) (select (store (arr!48205 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48205 a!2862) index!646) (select (arr!48205 a!2862) j!93))) (= (select (arr!48205 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!838057 () Bool)

(assert (=> b!1495966 e!838057))

(declare-fun res!1017256 () Bool)

(assert (=> b!1495966 (=> (not res!1017256) (not e!838057))))

(assert (=> b!1495966 (= res!1017256 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50057 0))(
  ( (Unit!50058) )
))
(declare-fun lt!651933 () Unit!50057)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99883 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50057)

(assert (=> b!1495966 (= lt!651933 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1495967 () Bool)

(assert (=> b!1495967 (= e!838057 (or (= (select (arr!48205 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48205 a!2862) intermediateBeforeIndex!19) (select (arr!48205 a!2862) j!93))))))

(declare-fun b!1495968 () Bool)

(declare-fun res!1017261 () Bool)

(assert (=> b!1495968 (=> (not res!1017261) (not e!838052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1495968 (= res!1017261 (validKeyInArray!0 (select (arr!48205 a!2862) i!1006)))))

(declare-fun b!1495969 () Bool)

(declare-fun res!1017257 () Bool)

(assert (=> b!1495969 (=> (not res!1017257) (not e!838052))))

(assert (=> b!1495969 (= res!1017257 (validKeyInArray!0 (select (arr!48205 a!2862) j!93)))))

(declare-fun b!1495971 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99883 (_ BitVec 32)) SeekEntryResult!12342)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99883 (_ BitVec 32)) SeekEntryResult!12342)

(assert (=> b!1495971 (= e!838059 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651935 lt!651936 mask!2687) (seekEntryOrOpen!0 lt!651935 lt!651936 mask!2687)))))

(declare-fun b!1495972 () Bool)

(assert (=> b!1495972 (= e!838056 e!838054)))

(declare-fun res!1017259 () Bool)

(assert (=> b!1495972 (=> (not res!1017259) (not e!838054))))

(assert (=> b!1495972 (= res!1017259 (= lt!651932 (Intermediate!12342 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1495972 (= lt!651932 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651935 mask!2687) lt!651935 lt!651936 mask!2687))))

(assert (=> b!1495972 (= lt!651935 (select (store (arr!48205 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1495973 () Bool)

(declare-fun res!1017264 () Bool)

(assert (=> b!1495973 (=> (not res!1017264) (not e!838052))))

(assert (=> b!1495973 (= res!1017264 (and (= (size!48756 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48756 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48756 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1495974 () Bool)

(assert (=> b!1495974 (= e!838052 e!838051)))

(declare-fun res!1017265 () Bool)

(assert (=> b!1495974 (=> (not res!1017265) (not e!838051))))

(assert (=> b!1495974 (= res!1017265 (= (select (store (arr!48205 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1495974 (= lt!651936 (array!99884 (store (arr!48205 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48756 a!2862)))))

(declare-fun b!1495975 () Bool)

(declare-fun res!1017269 () Bool)

(assert (=> b!1495975 (=> (not res!1017269) (not e!838057))))

(assert (=> b!1495975 (= res!1017269 (= (seekEntryOrOpen!0 (select (arr!48205 a!2862) j!93) a!2862 mask!2687) (Found!12342 j!93)))))

(declare-fun b!1495976 () Bool)

(assert (=> b!1495976 (= e!838058 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651934 (select (arr!48205 a!2862) j!93) a!2862 mask!2687) lt!651937))))

(declare-fun b!1495977 () Bool)

(declare-fun res!1017272 () Bool)

(assert (=> b!1495977 (=> (not res!1017272) (not e!838052))))

(declare-datatypes ((List!34693 0))(
  ( (Nil!34690) (Cons!34689 (h!36092 (_ BitVec 64)) (t!49379 List!34693)) )
))
(declare-fun arrayNoDuplicates!0 (array!99883 (_ BitVec 32) List!34693) Bool)

(assert (=> b!1495977 (= res!1017272 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34690))))

(declare-fun b!1495978 () Bool)

(declare-fun res!1017266 () Bool)

(assert (=> b!1495978 (=> (not res!1017266) (not e!838052))))

(assert (=> b!1495978 (= res!1017266 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48756 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48756 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48756 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1017262 () Bool)

(assert (=> start!127398 (=> (not res!1017262) (not e!838052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127398 (= res!1017262 (validMask!0 mask!2687))))

(assert (=> start!127398 e!838052))

(assert (=> start!127398 true))

(declare-fun array_inv!37486 (array!99883) Bool)

(assert (=> start!127398 (array_inv!37486 a!2862)))

(declare-fun b!1495970 () Bool)

(declare-fun res!1017267 () Bool)

(assert (=> b!1495970 (=> (not res!1017267) (not e!838056))))

(assert (=> b!1495970 (= res!1017267 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48205 a!2862) j!93) a!2862 mask!2687) lt!651937))))

(assert (= (and start!127398 res!1017262) b!1495973))

(assert (= (and b!1495973 res!1017264) b!1495968))

(assert (= (and b!1495968 res!1017261) b!1495969))

(assert (= (and b!1495969 res!1017257) b!1495963))

(assert (= (and b!1495963 res!1017270) b!1495977))

(assert (= (and b!1495977 res!1017272) b!1495978))

(assert (= (and b!1495978 res!1017266) b!1495974))

(assert (= (and b!1495974 res!1017265) b!1495965))

(assert (= (and b!1495965 res!1017258) b!1495970))

(assert (= (and b!1495970 res!1017267) b!1495972))

(assert (= (and b!1495972 res!1017259) b!1495960))

(assert (= (and b!1495960 c!138892) b!1495961))

(assert (= (and b!1495960 (not c!138892)) b!1495971))

(assert (= (and b!1495960 res!1017263) b!1495962))

(assert (= (and b!1495962 res!1017268) b!1495966))

(assert (= (and b!1495966 res!1017256) b!1495975))

(assert (= (and b!1495975 res!1017269) b!1495967))

(assert (= (and b!1495966 (not res!1017271)) b!1495964))

(assert (= (and b!1495964 (not res!1017260)) b!1495976))

(declare-fun m!1379719 () Bool)

(assert (=> b!1495976 m!1379719))

(assert (=> b!1495976 m!1379719))

(declare-fun m!1379721 () Bool)

(assert (=> b!1495976 m!1379721))

(declare-fun m!1379723 () Bool)

(assert (=> b!1495967 m!1379723))

(assert (=> b!1495967 m!1379719))

(declare-fun m!1379725 () Bool)

(assert (=> b!1495971 m!1379725))

(declare-fun m!1379727 () Bool)

(assert (=> b!1495971 m!1379727))

(declare-fun m!1379729 () Bool)

(assert (=> b!1495963 m!1379729))

(declare-fun m!1379731 () Bool)

(assert (=> b!1495964 m!1379731))

(declare-fun m!1379733 () Bool)

(assert (=> start!127398 m!1379733))

(declare-fun m!1379735 () Bool)

(assert (=> start!127398 m!1379735))

(declare-fun m!1379737 () Bool)

(assert (=> b!1495972 m!1379737))

(assert (=> b!1495972 m!1379737))

(declare-fun m!1379739 () Bool)

(assert (=> b!1495972 m!1379739))

(declare-fun m!1379741 () Bool)

(assert (=> b!1495972 m!1379741))

(declare-fun m!1379743 () Bool)

(assert (=> b!1495972 m!1379743))

(assert (=> b!1495965 m!1379719))

(assert (=> b!1495965 m!1379719))

(declare-fun m!1379745 () Bool)

(assert (=> b!1495965 m!1379745))

(assert (=> b!1495965 m!1379745))

(assert (=> b!1495965 m!1379719))

(declare-fun m!1379747 () Bool)

(assert (=> b!1495965 m!1379747))

(declare-fun m!1379749 () Bool)

(assert (=> b!1495977 m!1379749))

(declare-fun m!1379751 () Bool)

(assert (=> b!1495968 m!1379751))

(assert (=> b!1495968 m!1379751))

(declare-fun m!1379753 () Bool)

(assert (=> b!1495968 m!1379753))

(assert (=> b!1495969 m!1379719))

(assert (=> b!1495969 m!1379719))

(declare-fun m!1379755 () Bool)

(assert (=> b!1495969 m!1379755))

(assert (=> b!1495975 m!1379719))

(assert (=> b!1495975 m!1379719))

(declare-fun m!1379757 () Bool)

(assert (=> b!1495975 m!1379757))

(assert (=> b!1495970 m!1379719))

(assert (=> b!1495970 m!1379719))

(declare-fun m!1379759 () Bool)

(assert (=> b!1495970 m!1379759))

(assert (=> b!1495974 m!1379741))

(declare-fun m!1379761 () Bool)

(assert (=> b!1495974 m!1379761))

(declare-fun m!1379763 () Bool)

(assert (=> b!1495966 m!1379763))

(assert (=> b!1495966 m!1379741))

(declare-fun m!1379765 () Bool)

(assert (=> b!1495966 m!1379765))

(declare-fun m!1379767 () Bool)

(assert (=> b!1495966 m!1379767))

(declare-fun m!1379769 () Bool)

(assert (=> b!1495966 m!1379769))

(assert (=> b!1495966 m!1379719))

(declare-fun m!1379771 () Bool)

(assert (=> b!1495961 m!1379771))

(check-sat (not b!1495976) (not b!1495966) (not b!1495965) (not b!1495963) (not b!1495970) (not b!1495969) (not b!1495977) (not b!1495968) (not b!1495964) (not b!1495975) (not b!1495961) (not b!1495972) (not start!127398) (not b!1495971))
(check-sat)
(get-model)

(declare-fun d!157543 () Bool)

(assert (=> d!157543 (= (validKeyInArray!0 (select (arr!48205 a!2862) j!93)) (and (not (= (select (arr!48205 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48205 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1495969 d!157543))

(declare-fun b!1496111 () Bool)

(declare-fun e!838126 () Bool)

(declare-fun lt!651978 () SeekEntryResult!12342)

(assert (=> b!1496111 (= e!838126 (bvsge (x!133543 lt!651978) #b01111111111111111111111111111110))))

(declare-fun b!1496112 () Bool)

(assert (=> b!1496112 (and (bvsge (index!51762 lt!651978) #b00000000000000000000000000000000) (bvslt (index!51762 lt!651978) (size!48756 a!2862)))))

(declare-fun res!1017383 () Bool)

(assert (=> b!1496112 (= res!1017383 (= (select (arr!48205 a!2862) (index!51762 lt!651978)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!838124 () Bool)

(assert (=> b!1496112 (=> res!1017383 e!838124)))

(declare-fun b!1496113 () Bool)

(declare-fun e!838128 () Bool)

(assert (=> b!1496113 (= e!838126 e!838128)))

(declare-fun res!1017382 () Bool)

(get-info :version)

(assert (=> b!1496113 (= res!1017382 (and ((_ is Intermediate!12342) lt!651978) (not (undefined!13154 lt!651978)) (bvslt (x!133543 lt!651978) #b01111111111111111111111111111110) (bvsge (x!133543 lt!651978) #b00000000000000000000000000000000) (bvsge (x!133543 lt!651978) x!665)))))

(assert (=> b!1496113 (=> (not res!1017382) (not e!838128))))

(declare-fun b!1496114 () Bool)

(declare-fun e!838125 () SeekEntryResult!12342)

(assert (=> b!1496114 (= e!838125 (Intermediate!12342 true index!646 x!665))))

(declare-fun b!1496115 () Bool)

(assert (=> b!1496115 (and (bvsge (index!51762 lt!651978) #b00000000000000000000000000000000) (bvslt (index!51762 lt!651978) (size!48756 a!2862)))))

(declare-fun res!1017381 () Bool)

(assert (=> b!1496115 (= res!1017381 (= (select (arr!48205 a!2862) (index!51762 lt!651978)) (select (arr!48205 a!2862) j!93)))))

(assert (=> b!1496115 (=> res!1017381 e!838124)))

(assert (=> b!1496115 (= e!838128 e!838124)))

(declare-fun e!838127 () SeekEntryResult!12342)

(declare-fun b!1496116 () Bool)

(assert (=> b!1496116 (= e!838127 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!48205 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!157545 () Bool)

(assert (=> d!157545 e!838126))

(declare-fun c!138905 () Bool)

(assert (=> d!157545 (= c!138905 (and ((_ is Intermediate!12342) lt!651978) (undefined!13154 lt!651978)))))

(assert (=> d!157545 (= lt!651978 e!838125)))

(declare-fun c!138906 () Bool)

(assert (=> d!157545 (= c!138906 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!651979 () (_ BitVec 64))

(assert (=> d!157545 (= lt!651979 (select (arr!48205 a!2862) index!646))))

(assert (=> d!157545 (validMask!0 mask!2687)))

(assert (=> d!157545 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48205 a!2862) j!93) a!2862 mask!2687) lt!651978)))

(declare-fun b!1496117 () Bool)

(assert (=> b!1496117 (and (bvsge (index!51762 lt!651978) #b00000000000000000000000000000000) (bvslt (index!51762 lt!651978) (size!48756 a!2862)))))

(assert (=> b!1496117 (= e!838124 (= (select (arr!48205 a!2862) (index!51762 lt!651978)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1496118 () Bool)

(assert (=> b!1496118 (= e!838125 e!838127)))

(declare-fun c!138907 () Bool)

(assert (=> b!1496118 (= c!138907 (or (= lt!651979 (select (arr!48205 a!2862) j!93)) (= (bvadd lt!651979 lt!651979) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1496119 () Bool)

(assert (=> b!1496119 (= e!838127 (Intermediate!12342 false index!646 x!665))))

(assert (= (and d!157545 c!138906) b!1496114))

(assert (= (and d!157545 (not c!138906)) b!1496118))

(assert (= (and b!1496118 c!138907) b!1496119))

(assert (= (and b!1496118 (not c!138907)) b!1496116))

(assert (= (and d!157545 c!138905) b!1496111))

(assert (= (and d!157545 (not c!138905)) b!1496113))

(assert (= (and b!1496113 res!1017382) b!1496115))

(assert (= (and b!1496115 (not res!1017381)) b!1496112))

(assert (= (and b!1496112 (not res!1017383)) b!1496117))

(assert (=> d!157545 m!1379767))

(assert (=> d!157545 m!1379733))

(declare-fun m!1379881 () Bool)

(assert (=> b!1496115 m!1379881))

(assert (=> b!1496112 m!1379881))

(declare-fun m!1379883 () Bool)

(assert (=> b!1496116 m!1379883))

(assert (=> b!1496116 m!1379883))

(assert (=> b!1496116 m!1379719))

(declare-fun m!1379885 () Bool)

(assert (=> b!1496116 m!1379885))

(assert (=> b!1496117 m!1379881))

(assert (=> b!1495970 d!157545))

(declare-fun d!157547 () Bool)

(assert (=> d!157547 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!127398 d!157547))

(declare-fun d!157549 () Bool)

(assert (=> d!157549 (= (array_inv!37486 a!2862) (bvsge (size!48756 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!127398 d!157549))

(declare-fun b!1496132 () Bool)

(declare-fun c!138916 () Bool)

(declare-fun lt!651985 () (_ BitVec 64))

(assert (=> b!1496132 (= c!138916 (= lt!651985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!838137 () SeekEntryResult!12342)

(declare-fun e!838136 () SeekEntryResult!12342)

(assert (=> b!1496132 (= e!838137 e!838136)))

(declare-fun lt!651984 () SeekEntryResult!12342)

(declare-fun d!157551 () Bool)

(assert (=> d!157551 (and (or ((_ is Undefined!12342) lt!651984) (not ((_ is Found!12342) lt!651984)) (and (bvsge (index!51761 lt!651984) #b00000000000000000000000000000000) (bvslt (index!51761 lt!651984) (size!48756 lt!651936)))) (or ((_ is Undefined!12342) lt!651984) ((_ is Found!12342) lt!651984) (not ((_ is MissingVacant!12342) lt!651984)) (not (= (index!51763 lt!651984) intermediateAfterIndex!19)) (and (bvsge (index!51763 lt!651984) #b00000000000000000000000000000000) (bvslt (index!51763 lt!651984) (size!48756 lt!651936)))) (or ((_ is Undefined!12342) lt!651984) (ite ((_ is Found!12342) lt!651984) (= (select (arr!48205 lt!651936) (index!51761 lt!651984)) lt!651935) (and ((_ is MissingVacant!12342) lt!651984) (= (index!51763 lt!651984) intermediateAfterIndex!19) (= (select (arr!48205 lt!651936) (index!51763 lt!651984)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!838135 () SeekEntryResult!12342)

(assert (=> d!157551 (= lt!651984 e!838135)))

(declare-fun c!138915 () Bool)

(assert (=> d!157551 (= c!138915 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157551 (= lt!651985 (select (arr!48205 lt!651936) index!646))))

(assert (=> d!157551 (validMask!0 mask!2687)))

(assert (=> d!157551 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651935 lt!651936 mask!2687) lt!651984)))

(declare-fun b!1496133 () Bool)

(assert (=> b!1496133 (= e!838137 (Found!12342 index!646))))

(declare-fun b!1496134 () Bool)

(assert (=> b!1496134 (= e!838136 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!651935 lt!651936 mask!2687))))

(declare-fun b!1496135 () Bool)

(assert (=> b!1496135 (= e!838135 Undefined!12342)))

(declare-fun b!1496136 () Bool)

(assert (=> b!1496136 (= e!838136 (MissingVacant!12342 intermediateAfterIndex!19))))

(declare-fun b!1496137 () Bool)

(assert (=> b!1496137 (= e!838135 e!838137)))

(declare-fun c!138914 () Bool)

(assert (=> b!1496137 (= c!138914 (= lt!651985 lt!651935))))

(assert (= (and d!157551 c!138915) b!1496135))

(assert (= (and d!157551 (not c!138915)) b!1496137))

(assert (= (and b!1496137 c!138914) b!1496133))

(assert (= (and b!1496137 (not c!138914)) b!1496132))

(assert (= (and b!1496132 c!138916) b!1496136))

(assert (= (and b!1496132 (not c!138916)) b!1496134))

(declare-fun m!1379887 () Bool)

(assert (=> d!157551 m!1379887))

(declare-fun m!1379889 () Bool)

(assert (=> d!157551 m!1379889))

(declare-fun m!1379891 () Bool)

(assert (=> d!157551 m!1379891))

(assert (=> d!157551 m!1379733))

(assert (=> b!1496134 m!1379883))

(assert (=> b!1496134 m!1379883))

(declare-fun m!1379893 () Bool)

(assert (=> b!1496134 m!1379893))

(assert (=> b!1495971 d!157551))

(declare-fun b!1496150 () Bool)

(declare-fun e!838146 () SeekEntryResult!12342)

(assert (=> b!1496150 (= e!838146 Undefined!12342)))

(declare-fun b!1496151 () Bool)

(declare-fun e!838145 () SeekEntryResult!12342)

(declare-fun lt!651994 () SeekEntryResult!12342)

(assert (=> b!1496151 (= e!838145 (seekKeyOrZeroReturnVacant!0 (x!133543 lt!651994) (index!51762 lt!651994) (index!51762 lt!651994) lt!651935 lt!651936 mask!2687))))

(declare-fun b!1496152 () Bool)

(declare-fun c!138925 () Bool)

(declare-fun lt!651993 () (_ BitVec 64))

(assert (=> b!1496152 (= c!138925 (= lt!651993 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!838144 () SeekEntryResult!12342)

(assert (=> b!1496152 (= e!838144 e!838145)))

(declare-fun b!1496153 () Bool)

(assert (=> b!1496153 (= e!838145 (MissingZero!12342 (index!51762 lt!651994)))))

(declare-fun d!157553 () Bool)

(declare-fun lt!651992 () SeekEntryResult!12342)

(assert (=> d!157553 (and (or ((_ is Undefined!12342) lt!651992) (not ((_ is Found!12342) lt!651992)) (and (bvsge (index!51761 lt!651992) #b00000000000000000000000000000000) (bvslt (index!51761 lt!651992) (size!48756 lt!651936)))) (or ((_ is Undefined!12342) lt!651992) ((_ is Found!12342) lt!651992) (not ((_ is MissingZero!12342) lt!651992)) (and (bvsge (index!51760 lt!651992) #b00000000000000000000000000000000) (bvslt (index!51760 lt!651992) (size!48756 lt!651936)))) (or ((_ is Undefined!12342) lt!651992) ((_ is Found!12342) lt!651992) ((_ is MissingZero!12342) lt!651992) (not ((_ is MissingVacant!12342) lt!651992)) (and (bvsge (index!51763 lt!651992) #b00000000000000000000000000000000) (bvslt (index!51763 lt!651992) (size!48756 lt!651936)))) (or ((_ is Undefined!12342) lt!651992) (ite ((_ is Found!12342) lt!651992) (= (select (arr!48205 lt!651936) (index!51761 lt!651992)) lt!651935) (ite ((_ is MissingZero!12342) lt!651992) (= (select (arr!48205 lt!651936) (index!51760 lt!651992)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12342) lt!651992) (= (select (arr!48205 lt!651936) (index!51763 lt!651992)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157553 (= lt!651992 e!838146)))

(declare-fun c!138924 () Bool)

(assert (=> d!157553 (= c!138924 (and ((_ is Intermediate!12342) lt!651994) (undefined!13154 lt!651994)))))

(assert (=> d!157553 (= lt!651994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651935 mask!2687) lt!651935 lt!651936 mask!2687))))

(assert (=> d!157553 (validMask!0 mask!2687)))

(assert (=> d!157553 (= (seekEntryOrOpen!0 lt!651935 lt!651936 mask!2687) lt!651992)))

(declare-fun b!1496154 () Bool)

(assert (=> b!1496154 (= e!838144 (Found!12342 (index!51762 lt!651994)))))

(declare-fun b!1496155 () Bool)

(assert (=> b!1496155 (= e!838146 e!838144)))

(assert (=> b!1496155 (= lt!651993 (select (arr!48205 lt!651936) (index!51762 lt!651994)))))

(declare-fun c!138923 () Bool)

(assert (=> b!1496155 (= c!138923 (= lt!651993 lt!651935))))

(assert (= (and d!157553 c!138924) b!1496150))

(assert (= (and d!157553 (not c!138924)) b!1496155))

(assert (= (and b!1496155 c!138923) b!1496154))

(assert (= (and b!1496155 (not c!138923)) b!1496152))

(assert (= (and b!1496152 c!138925) b!1496153))

(assert (= (and b!1496152 (not c!138925)) b!1496151))

(declare-fun m!1379895 () Bool)

(assert (=> b!1496151 m!1379895))

(assert (=> d!157553 m!1379733))

(assert (=> d!157553 m!1379737))

(assert (=> d!157553 m!1379739))

(assert (=> d!157553 m!1379737))

(declare-fun m!1379897 () Bool)

(assert (=> d!157553 m!1379897))

(declare-fun m!1379899 () Bool)

(assert (=> d!157553 m!1379899))

(declare-fun m!1379901 () Bool)

(assert (=> d!157553 m!1379901))

(declare-fun m!1379903 () Bool)

(assert (=> b!1496155 m!1379903))

(assert (=> b!1495971 d!157553))

(declare-fun b!1496156 () Bool)

(declare-fun e!838149 () Bool)

(declare-fun lt!651995 () SeekEntryResult!12342)

(assert (=> b!1496156 (= e!838149 (bvsge (x!133543 lt!651995) #b01111111111111111111111111111110))))

(declare-fun b!1496157 () Bool)

(assert (=> b!1496157 (and (bvsge (index!51762 lt!651995) #b00000000000000000000000000000000) (bvslt (index!51762 lt!651995) (size!48756 lt!651936)))))

(declare-fun res!1017386 () Bool)

(assert (=> b!1496157 (= res!1017386 (= (select (arr!48205 lt!651936) (index!51762 lt!651995)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!838147 () Bool)

(assert (=> b!1496157 (=> res!1017386 e!838147)))

(declare-fun b!1496158 () Bool)

(declare-fun e!838151 () Bool)

(assert (=> b!1496158 (= e!838149 e!838151)))

(declare-fun res!1017385 () Bool)

(assert (=> b!1496158 (= res!1017385 (and ((_ is Intermediate!12342) lt!651995) (not (undefined!13154 lt!651995)) (bvslt (x!133543 lt!651995) #b01111111111111111111111111111110) (bvsge (x!133543 lt!651995) #b00000000000000000000000000000000) (bvsge (x!133543 lt!651995) #b00000000000000000000000000000000)))))

(assert (=> b!1496158 (=> (not res!1017385) (not e!838151))))

(declare-fun b!1496159 () Bool)

(declare-fun e!838148 () SeekEntryResult!12342)

(assert (=> b!1496159 (= e!838148 (Intermediate!12342 true (toIndex!0 lt!651935 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1496160 () Bool)

(assert (=> b!1496160 (and (bvsge (index!51762 lt!651995) #b00000000000000000000000000000000) (bvslt (index!51762 lt!651995) (size!48756 lt!651936)))))

(declare-fun res!1017384 () Bool)

(assert (=> b!1496160 (= res!1017384 (= (select (arr!48205 lt!651936) (index!51762 lt!651995)) lt!651935))))

(assert (=> b!1496160 (=> res!1017384 e!838147)))

(assert (=> b!1496160 (= e!838151 e!838147)))

(declare-fun b!1496161 () Bool)

(declare-fun e!838150 () SeekEntryResult!12342)

(assert (=> b!1496161 (= e!838150 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!651935 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!651935 lt!651936 mask!2687))))

(declare-fun d!157557 () Bool)

(assert (=> d!157557 e!838149))

(declare-fun c!138926 () Bool)

(assert (=> d!157557 (= c!138926 (and ((_ is Intermediate!12342) lt!651995) (undefined!13154 lt!651995)))))

(assert (=> d!157557 (= lt!651995 e!838148)))

(declare-fun c!138927 () Bool)

(assert (=> d!157557 (= c!138927 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!651996 () (_ BitVec 64))

(assert (=> d!157557 (= lt!651996 (select (arr!48205 lt!651936) (toIndex!0 lt!651935 mask!2687)))))

(assert (=> d!157557 (validMask!0 mask!2687)))

(assert (=> d!157557 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651935 mask!2687) lt!651935 lt!651936 mask!2687) lt!651995)))

(declare-fun b!1496162 () Bool)

(assert (=> b!1496162 (and (bvsge (index!51762 lt!651995) #b00000000000000000000000000000000) (bvslt (index!51762 lt!651995) (size!48756 lt!651936)))))

(assert (=> b!1496162 (= e!838147 (= (select (arr!48205 lt!651936) (index!51762 lt!651995)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1496163 () Bool)

(assert (=> b!1496163 (= e!838148 e!838150)))

(declare-fun c!138928 () Bool)

(assert (=> b!1496163 (= c!138928 (or (= lt!651996 lt!651935) (= (bvadd lt!651996 lt!651996) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1496164 () Bool)

(assert (=> b!1496164 (= e!838150 (Intermediate!12342 false (toIndex!0 lt!651935 mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!157557 c!138927) b!1496159))

(assert (= (and d!157557 (not c!138927)) b!1496163))

(assert (= (and b!1496163 c!138928) b!1496164))

(assert (= (and b!1496163 (not c!138928)) b!1496161))

(assert (= (and d!157557 c!138926) b!1496156))

(assert (= (and d!157557 (not c!138926)) b!1496158))

(assert (= (and b!1496158 res!1017385) b!1496160))

(assert (= (and b!1496160 (not res!1017384)) b!1496157))

(assert (= (and b!1496157 (not res!1017386)) b!1496162))

(assert (=> d!157557 m!1379737))

(declare-fun m!1379905 () Bool)

(assert (=> d!157557 m!1379905))

(assert (=> d!157557 m!1379733))

(declare-fun m!1379907 () Bool)

(assert (=> b!1496160 m!1379907))

(assert (=> b!1496157 m!1379907))

(assert (=> b!1496161 m!1379737))

(declare-fun m!1379909 () Bool)

(assert (=> b!1496161 m!1379909))

(assert (=> b!1496161 m!1379909))

(declare-fun m!1379911 () Bool)

(assert (=> b!1496161 m!1379911))

(assert (=> b!1496162 m!1379907))

(assert (=> b!1495972 d!157557))

(declare-fun d!157559 () Bool)

(declare-fun lt!652002 () (_ BitVec 32))

(declare-fun lt!652001 () (_ BitVec 32))

(assert (=> d!157559 (= lt!652002 (bvmul (bvxor lt!652001 (bvlshr lt!652001 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157559 (= lt!652001 ((_ extract 31 0) (bvand (bvxor lt!651935 (bvlshr lt!651935 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157559 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1017387 (let ((h!36095 ((_ extract 31 0) (bvand (bvxor lt!651935 (bvlshr lt!651935 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133548 (bvmul (bvxor h!36095 (bvlshr h!36095 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133548 (bvlshr x!133548 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1017387 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1017387 #b00000000000000000000000000000000))))))

(assert (=> d!157559 (= (toIndex!0 lt!651935 mask!2687) (bvand (bvxor lt!652002 (bvlshr lt!652002 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1495972 d!157559))

(declare-fun b!1496165 () Bool)

(declare-fun e!838154 () Bool)

(declare-fun lt!652003 () SeekEntryResult!12342)

(assert (=> b!1496165 (= e!838154 (bvsge (x!133543 lt!652003) #b01111111111111111111111111111110))))

(declare-fun b!1496166 () Bool)

(assert (=> b!1496166 (and (bvsge (index!51762 lt!652003) #b00000000000000000000000000000000) (bvslt (index!51762 lt!652003) (size!48756 lt!651936)))))

(declare-fun res!1017390 () Bool)

(assert (=> b!1496166 (= res!1017390 (= (select (arr!48205 lt!651936) (index!51762 lt!652003)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!838152 () Bool)

(assert (=> b!1496166 (=> res!1017390 e!838152)))

(declare-fun b!1496167 () Bool)

(declare-fun e!838156 () Bool)

(assert (=> b!1496167 (= e!838154 e!838156)))

(declare-fun res!1017389 () Bool)

(assert (=> b!1496167 (= res!1017389 (and ((_ is Intermediate!12342) lt!652003) (not (undefined!13154 lt!652003)) (bvslt (x!133543 lt!652003) #b01111111111111111111111111111110) (bvsge (x!133543 lt!652003) #b00000000000000000000000000000000) (bvsge (x!133543 lt!652003) x!665)))))

(assert (=> b!1496167 (=> (not res!1017389) (not e!838156))))

(declare-fun b!1496168 () Bool)

(declare-fun e!838153 () SeekEntryResult!12342)

(assert (=> b!1496168 (= e!838153 (Intermediate!12342 true index!646 x!665))))

(declare-fun b!1496169 () Bool)

(assert (=> b!1496169 (and (bvsge (index!51762 lt!652003) #b00000000000000000000000000000000) (bvslt (index!51762 lt!652003) (size!48756 lt!651936)))))

(declare-fun res!1017388 () Bool)

(assert (=> b!1496169 (= res!1017388 (= (select (arr!48205 lt!651936) (index!51762 lt!652003)) lt!651935))))

(assert (=> b!1496169 (=> res!1017388 e!838152)))

(assert (=> b!1496169 (= e!838156 e!838152)))

(declare-fun e!838155 () SeekEntryResult!12342)

(declare-fun b!1496170 () Bool)

(assert (=> b!1496170 (= e!838155 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!651935 lt!651936 mask!2687))))

(declare-fun d!157561 () Bool)

(assert (=> d!157561 e!838154))

(declare-fun c!138929 () Bool)

(assert (=> d!157561 (= c!138929 (and ((_ is Intermediate!12342) lt!652003) (undefined!13154 lt!652003)))))

(assert (=> d!157561 (= lt!652003 e!838153)))

(declare-fun c!138930 () Bool)

(assert (=> d!157561 (= c!138930 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!652004 () (_ BitVec 64))

(assert (=> d!157561 (= lt!652004 (select (arr!48205 lt!651936) index!646))))

(assert (=> d!157561 (validMask!0 mask!2687)))

(assert (=> d!157561 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651935 lt!651936 mask!2687) lt!652003)))

(declare-fun b!1496171 () Bool)

(assert (=> b!1496171 (and (bvsge (index!51762 lt!652003) #b00000000000000000000000000000000) (bvslt (index!51762 lt!652003) (size!48756 lt!651936)))))

(assert (=> b!1496171 (= e!838152 (= (select (arr!48205 lt!651936) (index!51762 lt!652003)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1496172 () Bool)

(assert (=> b!1496172 (= e!838153 e!838155)))

(declare-fun c!138931 () Bool)

(assert (=> b!1496172 (= c!138931 (or (= lt!652004 lt!651935) (= (bvadd lt!652004 lt!652004) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1496173 () Bool)

(assert (=> b!1496173 (= e!838155 (Intermediate!12342 false index!646 x!665))))

(assert (= (and d!157561 c!138930) b!1496168))

(assert (= (and d!157561 (not c!138930)) b!1496172))

(assert (= (and b!1496172 c!138931) b!1496173))

(assert (= (and b!1496172 (not c!138931)) b!1496170))

(assert (= (and d!157561 c!138929) b!1496165))

(assert (= (and d!157561 (not c!138929)) b!1496167))

(assert (= (and b!1496167 res!1017389) b!1496169))

(assert (= (and b!1496169 (not res!1017388)) b!1496166))

(assert (= (and b!1496166 (not res!1017390)) b!1496171))

(assert (=> d!157561 m!1379891))

(assert (=> d!157561 m!1379733))

(declare-fun m!1379913 () Bool)

(assert (=> b!1496169 m!1379913))

(assert (=> b!1496166 m!1379913))

(assert (=> b!1496170 m!1379883))

(assert (=> b!1496170 m!1379883))

(declare-fun m!1379915 () Bool)

(assert (=> b!1496170 m!1379915))

(assert (=> b!1496171 m!1379913))

(assert (=> b!1495961 d!157561))

(declare-fun b!1496209 () Bool)

(declare-fun e!838178 () Bool)

(declare-fun call!68073 () Bool)

(assert (=> b!1496209 (= e!838178 call!68073)))

(declare-fun b!1496210 () Bool)

(declare-fun e!838180 () Bool)

(assert (=> b!1496210 (= e!838180 e!838178)))

(declare-fun lt!652018 () (_ BitVec 64))

(assert (=> b!1496210 (= lt!652018 (select (arr!48205 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!652019 () Unit!50057)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99883 (_ BitVec 64) (_ BitVec 32)) Unit!50057)

(assert (=> b!1496210 (= lt!652019 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!652018 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1496210 (arrayContainsKey!0 a!2862 lt!652018 #b00000000000000000000000000000000)))

(declare-fun lt!652017 () Unit!50057)

(assert (=> b!1496210 (= lt!652017 lt!652019)))

(declare-fun res!1017405 () Bool)

(assert (=> b!1496210 (= res!1017405 (= (seekEntryOrOpen!0 (select (arr!48205 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12342 #b00000000000000000000000000000000)))))

(assert (=> b!1496210 (=> (not res!1017405) (not e!838178))))

(declare-fun b!1496211 () Bool)

(declare-fun e!838179 () Bool)

(assert (=> b!1496211 (= e!838179 e!838180)))

(declare-fun c!138943 () Bool)

(assert (=> b!1496211 (= c!138943 (validKeyInArray!0 (select (arr!48205 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!157563 () Bool)

(declare-fun res!1017404 () Bool)

(assert (=> d!157563 (=> res!1017404 e!838179)))

(assert (=> d!157563 (= res!1017404 (bvsge #b00000000000000000000000000000000 (size!48756 a!2862)))))

(assert (=> d!157563 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!838179)))

(declare-fun b!1496212 () Bool)

(assert (=> b!1496212 (= e!838180 call!68073)))

(declare-fun bm!68070 () Bool)

(assert (=> bm!68070 (= call!68073 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!157563 (not res!1017404)) b!1496211))

(assert (= (and b!1496211 c!138943) b!1496210))

(assert (= (and b!1496211 (not c!138943)) b!1496212))

(assert (= (and b!1496210 res!1017405) b!1496209))

(assert (= (or b!1496209 b!1496212) bm!68070))

(declare-fun m!1379917 () Bool)

(assert (=> b!1496210 m!1379917))

(declare-fun m!1379919 () Bool)

(assert (=> b!1496210 m!1379919))

(declare-fun m!1379921 () Bool)

(assert (=> b!1496210 m!1379921))

(assert (=> b!1496210 m!1379917))

(declare-fun m!1379927 () Bool)

(assert (=> b!1496210 m!1379927))

(assert (=> b!1496211 m!1379917))

(assert (=> b!1496211 m!1379917))

(declare-fun m!1379931 () Bool)

(assert (=> b!1496211 m!1379931))

(declare-fun m!1379933 () Bool)

(assert (=> bm!68070 m!1379933))

(assert (=> b!1495963 d!157563))

(declare-fun d!157567 () Bool)

(declare-fun lt!652022 () (_ BitVec 32))

(assert (=> d!157567 (and (bvsge lt!652022 #b00000000000000000000000000000000) (bvslt lt!652022 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157567 (= lt!652022 (choose!52 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> d!157567 (validMask!0 mask!2687)))

(assert (=> d!157567 (= (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) lt!652022)))

(declare-fun bs!42904 () Bool)

(assert (= bs!42904 d!157567))

(declare-fun m!1379937 () Bool)

(assert (=> bs!42904 m!1379937))

(assert (=> bs!42904 m!1379733))

(assert (=> b!1495964 d!157567))

(declare-fun b!1496213 () Bool)

(declare-fun e!838183 () SeekEntryResult!12342)

(assert (=> b!1496213 (= e!838183 Undefined!12342)))

(declare-fun b!1496214 () Bool)

(declare-fun e!838182 () SeekEntryResult!12342)

(declare-fun lt!652025 () SeekEntryResult!12342)

(assert (=> b!1496214 (= e!838182 (seekKeyOrZeroReturnVacant!0 (x!133543 lt!652025) (index!51762 lt!652025) (index!51762 lt!652025) (select (arr!48205 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1496215 () Bool)

(declare-fun c!138946 () Bool)

(declare-fun lt!652024 () (_ BitVec 64))

(assert (=> b!1496215 (= c!138946 (= lt!652024 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!838181 () SeekEntryResult!12342)

(assert (=> b!1496215 (= e!838181 e!838182)))

(declare-fun b!1496216 () Bool)

(assert (=> b!1496216 (= e!838182 (MissingZero!12342 (index!51762 lt!652025)))))

(declare-fun d!157571 () Bool)

(declare-fun lt!652023 () SeekEntryResult!12342)

(assert (=> d!157571 (and (or ((_ is Undefined!12342) lt!652023) (not ((_ is Found!12342) lt!652023)) (and (bvsge (index!51761 lt!652023) #b00000000000000000000000000000000) (bvslt (index!51761 lt!652023) (size!48756 a!2862)))) (or ((_ is Undefined!12342) lt!652023) ((_ is Found!12342) lt!652023) (not ((_ is MissingZero!12342) lt!652023)) (and (bvsge (index!51760 lt!652023) #b00000000000000000000000000000000) (bvslt (index!51760 lt!652023) (size!48756 a!2862)))) (or ((_ is Undefined!12342) lt!652023) ((_ is Found!12342) lt!652023) ((_ is MissingZero!12342) lt!652023) (not ((_ is MissingVacant!12342) lt!652023)) (and (bvsge (index!51763 lt!652023) #b00000000000000000000000000000000) (bvslt (index!51763 lt!652023) (size!48756 a!2862)))) (or ((_ is Undefined!12342) lt!652023) (ite ((_ is Found!12342) lt!652023) (= (select (arr!48205 a!2862) (index!51761 lt!652023)) (select (arr!48205 a!2862) j!93)) (ite ((_ is MissingZero!12342) lt!652023) (= (select (arr!48205 a!2862) (index!51760 lt!652023)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12342) lt!652023) (= (select (arr!48205 a!2862) (index!51763 lt!652023)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157571 (= lt!652023 e!838183)))

(declare-fun c!138945 () Bool)

(assert (=> d!157571 (= c!138945 (and ((_ is Intermediate!12342) lt!652025) (undefined!13154 lt!652025)))))

(assert (=> d!157571 (= lt!652025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48205 a!2862) j!93) mask!2687) (select (arr!48205 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!157571 (validMask!0 mask!2687)))

(assert (=> d!157571 (= (seekEntryOrOpen!0 (select (arr!48205 a!2862) j!93) a!2862 mask!2687) lt!652023)))

(declare-fun b!1496217 () Bool)

(assert (=> b!1496217 (= e!838181 (Found!12342 (index!51762 lt!652025)))))

(declare-fun b!1496218 () Bool)

(assert (=> b!1496218 (= e!838183 e!838181)))

(assert (=> b!1496218 (= lt!652024 (select (arr!48205 a!2862) (index!51762 lt!652025)))))

(declare-fun c!138944 () Bool)

(assert (=> b!1496218 (= c!138944 (= lt!652024 (select (arr!48205 a!2862) j!93)))))

(assert (= (and d!157571 c!138945) b!1496213))

(assert (= (and d!157571 (not c!138945)) b!1496218))

(assert (= (and b!1496218 c!138944) b!1496217))

(assert (= (and b!1496218 (not c!138944)) b!1496215))

(assert (= (and b!1496215 c!138946) b!1496216))

(assert (= (and b!1496215 (not c!138946)) b!1496214))

(assert (=> b!1496214 m!1379719))

(declare-fun m!1379939 () Bool)

(assert (=> b!1496214 m!1379939))

(assert (=> d!157571 m!1379733))

(assert (=> d!157571 m!1379745))

(assert (=> d!157571 m!1379719))

(assert (=> d!157571 m!1379747))

(assert (=> d!157571 m!1379719))

(assert (=> d!157571 m!1379745))

(declare-fun m!1379941 () Bool)

(assert (=> d!157571 m!1379941))

(declare-fun m!1379943 () Bool)

(assert (=> d!157571 m!1379943))

(declare-fun m!1379945 () Bool)

(assert (=> d!157571 m!1379945))

(declare-fun m!1379947 () Bool)

(assert (=> b!1496218 m!1379947))

(assert (=> b!1495975 d!157571))

(declare-fun b!1496219 () Bool)

(declare-fun e!838186 () Bool)

(declare-fun lt!652026 () SeekEntryResult!12342)

(assert (=> b!1496219 (= e!838186 (bvsge (x!133543 lt!652026) #b01111111111111111111111111111110))))

(declare-fun b!1496220 () Bool)

(assert (=> b!1496220 (and (bvsge (index!51762 lt!652026) #b00000000000000000000000000000000) (bvslt (index!51762 lt!652026) (size!48756 a!2862)))))

(declare-fun res!1017408 () Bool)

(assert (=> b!1496220 (= res!1017408 (= (select (arr!48205 a!2862) (index!51762 lt!652026)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!838184 () Bool)

(assert (=> b!1496220 (=> res!1017408 e!838184)))

(declare-fun b!1496221 () Bool)

(declare-fun e!838188 () Bool)

(assert (=> b!1496221 (= e!838186 e!838188)))

(declare-fun res!1017407 () Bool)

(assert (=> b!1496221 (= res!1017407 (and ((_ is Intermediate!12342) lt!652026) (not (undefined!13154 lt!652026)) (bvslt (x!133543 lt!652026) #b01111111111111111111111111111110) (bvsge (x!133543 lt!652026) #b00000000000000000000000000000000) (bvsge (x!133543 lt!652026) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1496221 (=> (not res!1017407) (not e!838188))))

(declare-fun b!1496222 () Bool)

(declare-fun e!838185 () SeekEntryResult!12342)

(assert (=> b!1496222 (= e!838185 (Intermediate!12342 true lt!651934 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1496223 () Bool)

(assert (=> b!1496223 (and (bvsge (index!51762 lt!652026) #b00000000000000000000000000000000) (bvslt (index!51762 lt!652026) (size!48756 a!2862)))))

(declare-fun res!1017406 () Bool)

(assert (=> b!1496223 (= res!1017406 (= (select (arr!48205 a!2862) (index!51762 lt!652026)) (select (arr!48205 a!2862) j!93)))))

(assert (=> b!1496223 (=> res!1017406 e!838184)))

(assert (=> b!1496223 (= e!838188 e!838184)))

(declare-fun b!1496224 () Bool)

(declare-fun e!838187 () SeekEntryResult!12342)

(assert (=> b!1496224 (= e!838187 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651934 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!48205 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!157573 () Bool)

(assert (=> d!157573 e!838186))

(declare-fun c!138947 () Bool)

(assert (=> d!157573 (= c!138947 (and ((_ is Intermediate!12342) lt!652026) (undefined!13154 lt!652026)))))

(assert (=> d!157573 (= lt!652026 e!838185)))

(declare-fun c!138948 () Bool)

(assert (=> d!157573 (= c!138948 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!652027 () (_ BitVec 64))

(assert (=> d!157573 (= lt!652027 (select (arr!48205 a!2862) lt!651934))))

(assert (=> d!157573 (validMask!0 mask!2687)))

(assert (=> d!157573 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651934 (select (arr!48205 a!2862) j!93) a!2862 mask!2687) lt!652026)))

(declare-fun b!1496225 () Bool)

(assert (=> b!1496225 (and (bvsge (index!51762 lt!652026) #b00000000000000000000000000000000) (bvslt (index!51762 lt!652026) (size!48756 a!2862)))))

(assert (=> b!1496225 (= e!838184 (= (select (arr!48205 a!2862) (index!51762 lt!652026)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1496226 () Bool)

(assert (=> b!1496226 (= e!838185 e!838187)))

(declare-fun c!138949 () Bool)

(assert (=> b!1496226 (= c!138949 (or (= lt!652027 (select (arr!48205 a!2862) j!93)) (= (bvadd lt!652027 lt!652027) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1496227 () Bool)

(assert (=> b!1496227 (= e!838187 (Intermediate!12342 false lt!651934 (bvadd #b00000000000000000000000000000001 x!665)))))

(assert (= (and d!157573 c!138948) b!1496222))

(assert (= (and d!157573 (not c!138948)) b!1496226))

(assert (= (and b!1496226 c!138949) b!1496227))

(assert (= (and b!1496226 (not c!138949)) b!1496224))

(assert (= (and d!157573 c!138947) b!1496219))

(assert (= (and d!157573 (not c!138947)) b!1496221))

(assert (= (and b!1496221 res!1017407) b!1496223))

(assert (= (and b!1496223 (not res!1017406)) b!1496220))

(assert (= (and b!1496220 (not res!1017408)) b!1496225))

(declare-fun m!1379949 () Bool)

(assert (=> d!157573 m!1379949))

(assert (=> d!157573 m!1379733))

(declare-fun m!1379951 () Bool)

(assert (=> b!1496223 m!1379951))

(assert (=> b!1496220 m!1379951))

(declare-fun m!1379953 () Bool)

(assert (=> b!1496224 m!1379953))

(assert (=> b!1496224 m!1379953))

(assert (=> b!1496224 m!1379719))

(declare-fun m!1379955 () Bool)

(assert (=> b!1496224 m!1379955))

(assert (=> b!1496225 m!1379951))

(assert (=> b!1495976 d!157573))

(declare-fun b!1496228 () Bool)

(declare-fun e!838191 () Bool)

(declare-fun lt!652028 () SeekEntryResult!12342)

(assert (=> b!1496228 (= e!838191 (bvsge (x!133543 lt!652028) #b01111111111111111111111111111110))))

(declare-fun b!1496229 () Bool)

(assert (=> b!1496229 (and (bvsge (index!51762 lt!652028) #b00000000000000000000000000000000) (bvslt (index!51762 lt!652028) (size!48756 a!2862)))))

(declare-fun res!1017411 () Bool)

(assert (=> b!1496229 (= res!1017411 (= (select (arr!48205 a!2862) (index!51762 lt!652028)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!838189 () Bool)

(assert (=> b!1496229 (=> res!1017411 e!838189)))

(declare-fun b!1496230 () Bool)

(declare-fun e!838193 () Bool)

(assert (=> b!1496230 (= e!838191 e!838193)))

(declare-fun res!1017410 () Bool)

(assert (=> b!1496230 (= res!1017410 (and ((_ is Intermediate!12342) lt!652028) (not (undefined!13154 lt!652028)) (bvslt (x!133543 lt!652028) #b01111111111111111111111111111110) (bvsge (x!133543 lt!652028) #b00000000000000000000000000000000) (bvsge (x!133543 lt!652028) #b00000000000000000000000000000000)))))

(assert (=> b!1496230 (=> (not res!1017410) (not e!838193))))

(declare-fun e!838190 () SeekEntryResult!12342)

(declare-fun b!1496231 () Bool)

(assert (=> b!1496231 (= e!838190 (Intermediate!12342 true (toIndex!0 (select (arr!48205 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1496232 () Bool)

(assert (=> b!1496232 (and (bvsge (index!51762 lt!652028) #b00000000000000000000000000000000) (bvslt (index!51762 lt!652028) (size!48756 a!2862)))))

(declare-fun res!1017409 () Bool)

(assert (=> b!1496232 (= res!1017409 (= (select (arr!48205 a!2862) (index!51762 lt!652028)) (select (arr!48205 a!2862) j!93)))))

(assert (=> b!1496232 (=> res!1017409 e!838189)))

(assert (=> b!1496232 (= e!838193 e!838189)))

(declare-fun b!1496233 () Bool)

(declare-fun e!838192 () SeekEntryResult!12342)

(assert (=> b!1496233 (= e!838192 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48205 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!48205 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!157575 () Bool)

(assert (=> d!157575 e!838191))

(declare-fun c!138950 () Bool)

(assert (=> d!157575 (= c!138950 (and ((_ is Intermediate!12342) lt!652028) (undefined!13154 lt!652028)))))

(assert (=> d!157575 (= lt!652028 e!838190)))

(declare-fun c!138951 () Bool)

(assert (=> d!157575 (= c!138951 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!652029 () (_ BitVec 64))

(assert (=> d!157575 (= lt!652029 (select (arr!48205 a!2862) (toIndex!0 (select (arr!48205 a!2862) j!93) mask!2687)))))

(assert (=> d!157575 (validMask!0 mask!2687)))

(assert (=> d!157575 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48205 a!2862) j!93) mask!2687) (select (arr!48205 a!2862) j!93) a!2862 mask!2687) lt!652028)))

(declare-fun b!1496234 () Bool)

(assert (=> b!1496234 (and (bvsge (index!51762 lt!652028) #b00000000000000000000000000000000) (bvslt (index!51762 lt!652028) (size!48756 a!2862)))))

(assert (=> b!1496234 (= e!838189 (= (select (arr!48205 a!2862) (index!51762 lt!652028)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1496235 () Bool)

(assert (=> b!1496235 (= e!838190 e!838192)))

(declare-fun c!138952 () Bool)

(assert (=> b!1496235 (= c!138952 (or (= lt!652029 (select (arr!48205 a!2862) j!93)) (= (bvadd lt!652029 lt!652029) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1496236 () Bool)

(assert (=> b!1496236 (= e!838192 (Intermediate!12342 false (toIndex!0 (select (arr!48205 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!157575 c!138951) b!1496231))

(assert (= (and d!157575 (not c!138951)) b!1496235))

(assert (= (and b!1496235 c!138952) b!1496236))

(assert (= (and b!1496235 (not c!138952)) b!1496233))

(assert (= (and d!157575 c!138950) b!1496228))

(assert (= (and d!157575 (not c!138950)) b!1496230))

(assert (= (and b!1496230 res!1017410) b!1496232))

(assert (= (and b!1496232 (not res!1017409)) b!1496229))

(assert (= (and b!1496229 (not res!1017411)) b!1496234))

(assert (=> d!157575 m!1379745))

(declare-fun m!1379957 () Bool)

(assert (=> d!157575 m!1379957))

(assert (=> d!157575 m!1379733))

(declare-fun m!1379959 () Bool)

(assert (=> b!1496232 m!1379959))

(assert (=> b!1496229 m!1379959))

(assert (=> b!1496233 m!1379745))

(declare-fun m!1379961 () Bool)

(assert (=> b!1496233 m!1379961))

(assert (=> b!1496233 m!1379961))

(assert (=> b!1496233 m!1379719))

(declare-fun m!1379963 () Bool)

(assert (=> b!1496233 m!1379963))

(assert (=> b!1496234 m!1379959))

(assert (=> b!1495965 d!157575))

(declare-fun d!157577 () Bool)

(declare-fun lt!652031 () (_ BitVec 32))

(declare-fun lt!652030 () (_ BitVec 32))

(assert (=> d!157577 (= lt!652031 (bvmul (bvxor lt!652030 (bvlshr lt!652030 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157577 (= lt!652030 ((_ extract 31 0) (bvand (bvxor (select (arr!48205 a!2862) j!93) (bvlshr (select (arr!48205 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157577 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1017387 (let ((h!36095 ((_ extract 31 0) (bvand (bvxor (select (arr!48205 a!2862) j!93) (bvlshr (select (arr!48205 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133548 (bvmul (bvxor h!36095 (bvlshr h!36095 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133548 (bvlshr x!133548 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1017387 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1017387 #b00000000000000000000000000000000))))))

(assert (=> d!157577 (= (toIndex!0 (select (arr!48205 a!2862) j!93) mask!2687) (bvand (bvxor lt!652031 (bvlshr lt!652031 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1495965 d!157577))

(declare-fun b!1496237 () Bool)

(declare-fun e!838194 () Bool)

(declare-fun call!68074 () Bool)

(assert (=> b!1496237 (= e!838194 call!68074)))

(declare-fun b!1496238 () Bool)

(declare-fun e!838196 () Bool)

(assert (=> b!1496238 (= e!838196 e!838194)))

(declare-fun lt!652033 () (_ BitVec 64))

(assert (=> b!1496238 (= lt!652033 (select (arr!48205 a!2862) j!93))))

(declare-fun lt!652034 () Unit!50057)

(assert (=> b!1496238 (= lt!652034 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!652033 j!93))))

(assert (=> b!1496238 (arrayContainsKey!0 a!2862 lt!652033 #b00000000000000000000000000000000)))

(declare-fun lt!652032 () Unit!50057)

(assert (=> b!1496238 (= lt!652032 lt!652034)))

(declare-fun res!1017413 () Bool)

(assert (=> b!1496238 (= res!1017413 (= (seekEntryOrOpen!0 (select (arr!48205 a!2862) j!93) a!2862 mask!2687) (Found!12342 j!93)))))

(assert (=> b!1496238 (=> (not res!1017413) (not e!838194))))

(declare-fun b!1496239 () Bool)

(declare-fun e!838195 () Bool)

(assert (=> b!1496239 (= e!838195 e!838196)))

(declare-fun c!138953 () Bool)

(assert (=> b!1496239 (= c!138953 (validKeyInArray!0 (select (arr!48205 a!2862) j!93)))))

(declare-fun d!157579 () Bool)

(declare-fun res!1017412 () Bool)

(assert (=> d!157579 (=> res!1017412 e!838195)))

(assert (=> d!157579 (= res!1017412 (bvsge j!93 (size!48756 a!2862)))))

(assert (=> d!157579 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!838195)))

(declare-fun b!1496240 () Bool)

(assert (=> b!1496240 (= e!838196 call!68074)))

(declare-fun bm!68071 () Bool)

(assert (=> bm!68071 (= call!68074 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!157579 (not res!1017412)) b!1496239))

(assert (= (and b!1496239 c!138953) b!1496238))

(assert (= (and b!1496239 (not c!138953)) b!1496240))

(assert (= (and b!1496238 res!1017413) b!1496237))

(assert (= (or b!1496237 b!1496240) bm!68071))

(assert (=> b!1496238 m!1379719))

(declare-fun m!1379965 () Bool)

(assert (=> b!1496238 m!1379965))

(declare-fun m!1379967 () Bool)

(assert (=> b!1496238 m!1379967))

(assert (=> b!1496238 m!1379719))

(assert (=> b!1496238 m!1379757))

(assert (=> b!1496239 m!1379719))

(assert (=> b!1496239 m!1379719))

(assert (=> b!1496239 m!1379755))

(declare-fun m!1379969 () Bool)

(assert (=> bm!68071 m!1379969))

(assert (=> b!1495966 d!157579))

(declare-fun d!157581 () Bool)

(assert (=> d!157581 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!652037 () Unit!50057)

(declare-fun choose!38 (array!99883 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50057)

(assert (=> d!157581 (= lt!652037 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!157581 (validMask!0 mask!2687)))

(assert (=> d!157581 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!652037)))

(declare-fun bs!42905 () Bool)

(assert (= bs!42905 d!157581))

(assert (=> bs!42905 m!1379769))

(declare-fun m!1379971 () Bool)

(assert (=> bs!42905 m!1379971))

(assert (=> bs!42905 m!1379733))

(assert (=> b!1495966 d!157581))

(declare-fun b!1496263 () Bool)

(declare-fun e!838211 () Bool)

(declare-fun e!838212 () Bool)

(assert (=> b!1496263 (= e!838211 e!838212)))

(declare-fun c!138962 () Bool)

(assert (=> b!1496263 (= c!138962 (validKeyInArray!0 (select (arr!48205 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1496264 () Bool)

(declare-fun e!838213 () Bool)

(declare-fun contains!9978 (List!34693 (_ BitVec 64)) Bool)

(assert (=> b!1496264 (= e!838213 (contains!9978 Nil!34690 (select (arr!48205 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1496265 () Bool)

(declare-fun call!68077 () Bool)

(assert (=> b!1496265 (= e!838212 call!68077)))

(declare-fun bm!68074 () Bool)

(assert (=> bm!68074 (= call!68077 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138962 (Cons!34689 (select (arr!48205 a!2862) #b00000000000000000000000000000000) Nil!34690) Nil!34690)))))

(declare-fun b!1496267 () Bool)

(declare-fun e!838214 () Bool)

(assert (=> b!1496267 (= e!838214 e!838211)))

(declare-fun res!1017422 () Bool)

(assert (=> b!1496267 (=> (not res!1017422) (not e!838211))))

(assert (=> b!1496267 (= res!1017422 (not e!838213))))

(declare-fun res!1017420 () Bool)

(assert (=> b!1496267 (=> (not res!1017420) (not e!838213))))

(assert (=> b!1496267 (= res!1017420 (validKeyInArray!0 (select (arr!48205 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1496266 () Bool)

(assert (=> b!1496266 (= e!838212 call!68077)))

(declare-fun d!157583 () Bool)

(declare-fun res!1017421 () Bool)

(assert (=> d!157583 (=> res!1017421 e!838214)))

(assert (=> d!157583 (= res!1017421 (bvsge #b00000000000000000000000000000000 (size!48756 a!2862)))))

(assert (=> d!157583 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34690) e!838214)))

(assert (= (and d!157583 (not res!1017421)) b!1496267))

(assert (= (and b!1496267 res!1017420) b!1496264))

(assert (= (and b!1496267 res!1017422) b!1496263))

(assert (= (and b!1496263 c!138962) b!1496266))

(assert (= (and b!1496263 (not c!138962)) b!1496265))

(assert (= (or b!1496266 b!1496265) bm!68074))

(assert (=> b!1496263 m!1379917))

(assert (=> b!1496263 m!1379917))

(assert (=> b!1496263 m!1379931))

(assert (=> b!1496264 m!1379917))

(assert (=> b!1496264 m!1379917))

(declare-fun m!1379973 () Bool)

(assert (=> b!1496264 m!1379973))

(assert (=> bm!68074 m!1379917))

(declare-fun m!1379975 () Bool)

(assert (=> bm!68074 m!1379975))

(assert (=> b!1496267 m!1379917))

(assert (=> b!1496267 m!1379917))

(assert (=> b!1496267 m!1379931))

(assert (=> b!1495977 d!157583))

(declare-fun d!157585 () Bool)

(assert (=> d!157585 (= (validKeyInArray!0 (select (arr!48205 a!2862) i!1006)) (and (not (= (select (arr!48205 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48205 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1495968 d!157585))

(check-sat (not b!1496161) (not b!1496214) (not b!1496239) (not bm!68074) (not b!1496264) (not b!1496267) (not d!157551) (not d!157561) (not d!157567) (not b!1496116) (not b!1496238) (not d!157557) (not b!1496210) (not d!157571) (not bm!68071) (not d!157575) (not d!157553) (not b!1496211) (not b!1496224) (not d!157581) (not b!1496134) (not b!1496151) (not d!157573) (not b!1496263) (not bm!68070) (not b!1496170) (not d!157545) (not b!1496233))
(check-sat)
