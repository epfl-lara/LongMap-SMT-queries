; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127116 () Bool)

(assert start!127116)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!650124 () (_ BitVec 64))

(declare-fun e!835757 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1490975 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99727 0))(
  ( (array!99728 (arr!48130 (Array (_ BitVec 32) (_ BitVec 64))) (size!48681 (_ BitVec 32))) )
))
(declare-fun lt!650119 () array!99727)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12267 0))(
  ( (MissingZero!12267 (index!51460 (_ BitVec 32))) (Found!12267 (index!51461 (_ BitVec 32))) (Intermediate!12267 (undefined!13079 Bool) (index!51462 (_ BitVec 32)) (x!133244 (_ BitVec 32))) (Undefined!12267) (MissingVacant!12267 (index!51463 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99727 (_ BitVec 32)) SeekEntryResult!12267)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99727 (_ BitVec 32)) SeekEntryResult!12267)

(assert (=> b!1490975 (= e!835757 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650124 lt!650119 mask!2687) (seekEntryOrOpen!0 lt!650124 lt!650119 mask!2687)))))

(declare-fun b!1490976 () Bool)

(declare-fun res!1013365 () Bool)

(declare-fun e!835756 () Bool)

(assert (=> b!1490976 (=> res!1013365 e!835756)))

(declare-fun lt!650123 () SeekEntryResult!12267)

(declare-fun lt!650118 () (_ BitVec 32))

(declare-fun a!2862 () array!99727)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99727 (_ BitVec 32)) SeekEntryResult!12267)

(assert (=> b!1490976 (= res!1013365 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650118 (select (arr!48130 a!2862) j!93) a!2862 mask!2687) lt!650123)))))

(declare-fun e!835762 () Bool)

(declare-fun lt!650117 () SeekEntryResult!12267)

(declare-fun b!1490977 () Bool)

(assert (=> b!1490977 (= e!835762 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650118 intermediateAfterIndex!19 lt!650124 lt!650119 mask!2687) lt!650117)))))

(declare-fun b!1490978 () Bool)

(declare-fun res!1013368 () Bool)

(declare-fun e!835760 () Bool)

(assert (=> b!1490978 (=> (not res!1013368) (not e!835760))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490978 (= res!1013368 (validKeyInArray!0 (select (arr!48130 a!2862) i!1006)))))

(declare-fun b!1490979 () Bool)

(declare-fun e!835759 () Bool)

(assert (=> b!1490979 (= e!835759 e!835756)))

(declare-fun res!1013362 () Bool)

(assert (=> b!1490979 (=> res!1013362 e!835756)))

(assert (=> b!1490979 (= res!1013362 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!650118 #b00000000000000000000000000000000) (bvsge lt!650118 (size!48681 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490979 (= lt!650118 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1490979 (= lt!650117 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650124 lt!650119 mask!2687))))

(assert (=> b!1490979 (= lt!650117 (seekEntryOrOpen!0 lt!650124 lt!650119 mask!2687))))

(declare-fun b!1490980 () Bool)

(declare-fun res!1013355 () Bool)

(declare-fun e!835763 () Bool)

(assert (=> b!1490980 (=> (not res!1013355) (not e!835763))))

(assert (=> b!1490980 (= res!1013355 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48130 a!2862) j!93) a!2862 mask!2687) lt!650123))))

(declare-fun b!1490981 () Bool)

(declare-fun res!1013363 () Bool)

(assert (=> b!1490981 (=> res!1013363 e!835756)))

(assert (=> b!1490981 (= res!1013363 e!835762)))

(declare-fun c!138348 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1490981 (= c!138348 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1490982 () Bool)

(declare-fun lt!650120 () SeekEntryResult!12267)

(assert (=> b!1490982 (= e!835757 (= lt!650120 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650124 lt!650119 mask!2687)))))

(declare-fun b!1490974 () Bool)

(declare-fun res!1013364 () Bool)

(declare-fun e!835761 () Bool)

(assert (=> b!1490974 (=> (not res!1013364) (not e!835761))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490974 (= res!1013364 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1013357 () Bool)

(assert (=> start!127116 (=> (not res!1013357) (not e!835760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127116 (= res!1013357 (validMask!0 mask!2687))))

(assert (=> start!127116 e!835760))

(assert (=> start!127116 true))

(declare-fun array_inv!37411 (array!99727) Bool)

(assert (=> start!127116 (array_inv!37411 a!2862)))

(declare-fun b!1490983 () Bool)

(declare-fun e!835758 () Bool)

(assert (=> b!1490983 (= e!835758 e!835763)))

(declare-fun res!1013367 () Bool)

(assert (=> b!1490983 (=> (not res!1013367) (not e!835763))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490983 (= res!1013367 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48130 a!2862) j!93) mask!2687) (select (arr!48130 a!2862) j!93) a!2862 mask!2687) lt!650123))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1490983 (= lt!650123 (Intermediate!12267 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490984 () Bool)

(declare-fun res!1013360 () Bool)

(assert (=> b!1490984 (=> (not res!1013360) (not e!835760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99727 (_ BitVec 32)) Bool)

(assert (=> b!1490984 (= res!1013360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490985 () Bool)

(assert (=> b!1490985 (= e!835762 (not (= lt!650120 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!650118 lt!650124 lt!650119 mask!2687))))))

(declare-fun b!1490986 () Bool)

(declare-fun res!1013369 () Bool)

(assert (=> b!1490986 (=> (not res!1013369) (not e!835760))))

(assert (=> b!1490986 (= res!1013369 (and (= (size!48681 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48681 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48681 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490987 () Bool)

(declare-fun res!1013366 () Bool)

(assert (=> b!1490987 (=> (not res!1013366) (not e!835760))))

(assert (=> b!1490987 (= res!1013366 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48681 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48681 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48681 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490988 () Bool)

(declare-fun res!1013359 () Bool)

(assert (=> b!1490988 (=> res!1013359 e!835756)))

(assert (=> b!1490988 (= res!1013359 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1490989 () Bool)

(assert (=> b!1490989 (= e!835761 (not e!835759))))

(declare-fun res!1013354 () Bool)

(assert (=> b!1490989 (=> res!1013354 e!835759)))

(assert (=> b!1490989 (= res!1013354 (or (and (= (select (arr!48130 a!2862) index!646) (select (store (arr!48130 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48130 a!2862) index!646) (select (arr!48130 a!2862) j!93))) (= (select (arr!48130 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun lt!650121 () SeekEntryResult!12267)

(assert (=> b!1490989 (and (= lt!650121 (Found!12267 j!93)) (or (= (select (arr!48130 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48130 a!2862) intermediateBeforeIndex!19) (select (arr!48130 a!2862) j!93))) (let ((bdg!54707 (select (store (arr!48130 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48130 a!2862) index!646) bdg!54707) (= (select (arr!48130 a!2862) index!646) (select (arr!48130 a!2862) j!93))) (= (select (arr!48130 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54707 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1490989 (= lt!650121 (seekEntryOrOpen!0 (select (arr!48130 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1490989 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49907 0))(
  ( (Unit!49908) )
))
(declare-fun lt!650125 () Unit!49907)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49907)

(assert (=> b!1490989 (= lt!650125 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490990 () Bool)

(assert (=> b!1490990 (= e!835760 e!835758)))

(declare-fun res!1013358 () Bool)

(assert (=> b!1490990 (=> (not res!1013358) (not e!835758))))

(assert (=> b!1490990 (= res!1013358 (= (select (store (arr!48130 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490990 (= lt!650119 (array!99728 (store (arr!48130 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48681 a!2862)))))

(declare-fun b!1490991 () Bool)

(assert (=> b!1490991 (= e!835756 true)))

(assert (=> b!1490991 (= lt!650121 lt!650117)))

(declare-fun lt!650122 () Unit!49907)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49907)

(assert (=> b!1490991 (= lt!650122 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!650118 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1490992 () Bool)

(assert (=> b!1490992 (= e!835763 e!835761)))

(declare-fun res!1013356 () Bool)

(assert (=> b!1490992 (=> (not res!1013356) (not e!835761))))

(assert (=> b!1490992 (= res!1013356 (= lt!650120 (Intermediate!12267 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1490992 (= lt!650120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650124 mask!2687) lt!650124 lt!650119 mask!2687))))

(assert (=> b!1490992 (= lt!650124 (select (store (arr!48130 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490993 () Bool)

(declare-fun res!1013361 () Bool)

(assert (=> b!1490993 (=> (not res!1013361) (not e!835760))))

(assert (=> b!1490993 (= res!1013361 (validKeyInArray!0 (select (arr!48130 a!2862) j!93)))))

(declare-fun b!1490994 () Bool)

(declare-fun res!1013353 () Bool)

(assert (=> b!1490994 (=> (not res!1013353) (not e!835760))))

(declare-datatypes ((List!34618 0))(
  ( (Nil!34615) (Cons!34614 (h!36011 (_ BitVec 64)) (t!49304 List!34618)) )
))
(declare-fun arrayNoDuplicates!0 (array!99727 (_ BitVec 32) List!34618) Bool)

(assert (=> b!1490994 (= res!1013353 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34615))))

(declare-fun b!1490995 () Bool)

(declare-fun res!1013352 () Bool)

(assert (=> b!1490995 (=> (not res!1013352) (not e!835761))))

(assert (=> b!1490995 (= res!1013352 e!835757)))

(declare-fun c!138349 () Bool)

(assert (=> b!1490995 (= c!138349 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!127116 res!1013357) b!1490986))

(assert (= (and b!1490986 res!1013369) b!1490978))

(assert (= (and b!1490978 res!1013368) b!1490993))

(assert (= (and b!1490993 res!1013361) b!1490984))

(assert (= (and b!1490984 res!1013360) b!1490994))

(assert (= (and b!1490994 res!1013353) b!1490987))

(assert (= (and b!1490987 res!1013366) b!1490990))

(assert (= (and b!1490990 res!1013358) b!1490983))

(assert (= (and b!1490983 res!1013367) b!1490980))

(assert (= (and b!1490980 res!1013355) b!1490992))

(assert (= (and b!1490992 res!1013356) b!1490995))

(assert (= (and b!1490995 c!138349) b!1490982))

(assert (= (and b!1490995 (not c!138349)) b!1490975))

(assert (= (and b!1490995 res!1013352) b!1490974))

(assert (= (and b!1490974 res!1013364) b!1490989))

(assert (= (and b!1490989 (not res!1013354)) b!1490979))

(assert (= (and b!1490979 (not res!1013362)) b!1490976))

(assert (= (and b!1490976 (not res!1013365)) b!1490981))

(assert (= (and b!1490981 c!138348) b!1490985))

(assert (= (and b!1490981 (not c!138348)) b!1490977))

(assert (= (and b!1490981 (not res!1013363)) b!1490988))

(assert (= (and b!1490988 (not res!1013359)) b!1490991))

(declare-fun m!1375219 () Bool)

(assert (=> b!1490989 m!1375219))

(declare-fun m!1375221 () Bool)

(assert (=> b!1490989 m!1375221))

(declare-fun m!1375223 () Bool)

(assert (=> b!1490989 m!1375223))

(declare-fun m!1375225 () Bool)

(assert (=> b!1490989 m!1375225))

(declare-fun m!1375227 () Bool)

(assert (=> b!1490989 m!1375227))

(declare-fun m!1375229 () Bool)

(assert (=> b!1490989 m!1375229))

(declare-fun m!1375231 () Bool)

(assert (=> b!1490989 m!1375231))

(declare-fun m!1375233 () Bool)

(assert (=> b!1490989 m!1375233))

(assert (=> b!1490989 m!1375229))

(assert (=> b!1490990 m!1375221))

(declare-fun m!1375235 () Bool)

(assert (=> b!1490990 m!1375235))

(assert (=> b!1490976 m!1375229))

(assert (=> b!1490976 m!1375229))

(declare-fun m!1375237 () Bool)

(assert (=> b!1490976 m!1375237))

(declare-fun m!1375239 () Bool)

(assert (=> b!1490985 m!1375239))

(assert (=> b!1490983 m!1375229))

(assert (=> b!1490983 m!1375229))

(declare-fun m!1375241 () Bool)

(assert (=> b!1490983 m!1375241))

(assert (=> b!1490983 m!1375241))

(assert (=> b!1490983 m!1375229))

(declare-fun m!1375243 () Bool)

(assert (=> b!1490983 m!1375243))

(declare-fun m!1375245 () Bool)

(assert (=> b!1490975 m!1375245))

(declare-fun m!1375247 () Bool)

(assert (=> b!1490975 m!1375247))

(declare-fun m!1375249 () Bool)

(assert (=> start!127116 m!1375249))

(declare-fun m!1375251 () Bool)

(assert (=> start!127116 m!1375251))

(assert (=> b!1490980 m!1375229))

(assert (=> b!1490980 m!1375229))

(declare-fun m!1375253 () Bool)

(assert (=> b!1490980 m!1375253))

(declare-fun m!1375255 () Bool)

(assert (=> b!1490978 m!1375255))

(assert (=> b!1490978 m!1375255))

(declare-fun m!1375257 () Bool)

(assert (=> b!1490978 m!1375257))

(declare-fun m!1375259 () Bool)

(assert (=> b!1490991 m!1375259))

(declare-fun m!1375261 () Bool)

(assert (=> b!1490979 m!1375261))

(assert (=> b!1490979 m!1375245))

(assert (=> b!1490979 m!1375247))

(declare-fun m!1375263 () Bool)

(assert (=> b!1490994 m!1375263))

(declare-fun m!1375265 () Bool)

(assert (=> b!1490992 m!1375265))

(assert (=> b!1490992 m!1375265))

(declare-fun m!1375267 () Bool)

(assert (=> b!1490992 m!1375267))

(assert (=> b!1490992 m!1375221))

(declare-fun m!1375269 () Bool)

(assert (=> b!1490992 m!1375269))

(declare-fun m!1375271 () Bool)

(assert (=> b!1490984 m!1375271))

(assert (=> b!1490993 m!1375229))

(assert (=> b!1490993 m!1375229))

(declare-fun m!1375273 () Bool)

(assert (=> b!1490993 m!1375273))

(declare-fun m!1375275 () Bool)

(assert (=> b!1490982 m!1375275))

(declare-fun m!1375277 () Bool)

(assert (=> b!1490977 m!1375277))

(check-sat (not b!1490978) (not b!1490985) (not b!1490989) (not b!1490982) (not b!1490975) (not b!1490993) (not start!127116) (not b!1490980) (not b!1490991) (not b!1490976) (not b!1490992) (not b!1490984) (not b!1490977) (not b!1490979) (not b!1490983) (not b!1490994))
(check-sat)
