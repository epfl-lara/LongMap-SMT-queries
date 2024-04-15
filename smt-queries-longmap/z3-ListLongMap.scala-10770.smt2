; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126028 () Bool)

(assert start!126028)

(declare-fun b!1475572 () Bool)

(declare-fun res!1002250 () Bool)

(declare-fun e!827857 () Bool)

(assert (=> b!1475572 (=> (not res!1002250) (not e!827857))))

(declare-datatypes ((array!99169 0))(
  ( (array!99170 (arr!47866 (Array (_ BitVec 32) (_ BitVec 64))) (size!48418 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99169)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99169 (_ BitVec 32)) Bool)

(assert (=> b!1475572 (= res!1002250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1475573 () Bool)

(declare-fun res!1002260 () Bool)

(assert (=> b!1475573 (=> (not res!1002260) (not e!827857))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1475573 (= res!1002260 (validKeyInArray!0 (select (arr!47866 a!2862) i!1006)))))

(declare-fun b!1475574 () Bool)

(declare-fun res!1002255 () Bool)

(assert (=> b!1475574 (=> (not res!1002255) (not e!827857))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1475574 (= res!1002255 (and (= (size!48418 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48418 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48418 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!827862 () Bool)

(declare-fun b!1475575 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1475575 (= e!827862 (not (or (and (= (select (arr!47866 a!2862) index!646) (select (store (arr!47866 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47866 a!2862) index!646) (select (arr!47866 a!2862) j!93))) (not (= (select (arr!47866 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (= x!665 intermediateBeforeX!19))))))

(declare-fun e!827859 () Bool)

(assert (=> b!1475575 e!827859))

(declare-fun res!1002252 () Bool)

(assert (=> b!1475575 (=> (not res!1002252) (not e!827859))))

(declare-datatypes ((SeekEntryResult!12131 0))(
  ( (MissingZero!12131 (index!50916 (_ BitVec 32))) (Found!12131 (index!50917 (_ BitVec 32))) (Intermediate!12131 (undefined!12943 Bool) (index!50918 (_ BitVec 32)) (x!132508 (_ BitVec 32))) (Undefined!12131) (MissingVacant!12131 (index!50919 (_ BitVec 32))) )
))
(declare-fun lt!644527 () SeekEntryResult!12131)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1475575 (= res!1002252 (and (= lt!644527 (Found!12131 j!93)) (or (= (select (arr!47866 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47866 a!2862) intermediateBeforeIndex!19) (select (arr!47866 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99169 (_ BitVec 32)) SeekEntryResult!12131)

(assert (=> b!1475575 (= lt!644527 (seekEntryOrOpen!0 (select (arr!47866 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1475575 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49443 0))(
  ( (Unit!49444) )
))
(declare-fun lt!644529 () Unit!49443)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49443)

(assert (=> b!1475575 (= lt!644529 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1002261 () Bool)

(assert (=> start!126028 (=> (not res!1002261) (not e!827857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126028 (= res!1002261 (validMask!0 mask!2687))))

(assert (=> start!126028 e!827857))

(assert (=> start!126028 true))

(declare-fun array_inv!37099 (array!99169) Bool)

(assert (=> start!126028 (array_inv!37099 a!2862)))

(declare-fun b!1475576 () Bool)

(declare-fun e!827865 () Bool)

(declare-fun e!827863 () Bool)

(assert (=> b!1475576 (= e!827865 e!827863)))

(declare-fun res!1002249 () Bool)

(assert (=> b!1475576 (=> (not res!1002249) (not e!827863))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99169 (_ BitVec 32)) SeekEntryResult!12131)

(assert (=> b!1475576 (= res!1002249 (= lt!644527 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47866 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1475577 () Bool)

(assert (=> b!1475577 (= e!827863 (= index!646 intermediateBeforeIndex!19))))

(declare-fun b!1475578 () Bool)

(assert (=> b!1475578 (= e!827859 e!827865)))

(declare-fun res!1002254 () Bool)

(assert (=> b!1475578 (=> res!1002254 e!827865)))

(assert (=> b!1475578 (= res!1002254 (or (and (= (select (arr!47866 a!2862) index!646) (select (store (arr!47866 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47866 a!2862) index!646) (select (arr!47866 a!2862) j!93))) (not (= (select (arr!47866 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!827858 () Bool)

(declare-fun lt!644524 () (_ BitVec 64))

(declare-fun lt!644528 () array!99169)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1475579 () Bool)

(assert (=> b!1475579 (= e!827858 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644524 lt!644528 mask!2687) (seekEntryOrOpen!0 lt!644524 lt!644528 mask!2687)))))

(declare-fun b!1475580 () Bool)

(declare-fun res!1002258 () Bool)

(assert (=> b!1475580 (=> (not res!1002258) (not e!827862))))

(assert (=> b!1475580 (= res!1002258 e!827858)))

(declare-fun c!136183 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1475580 (= c!136183 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1475581 () Bool)

(declare-fun res!1002253 () Bool)

(assert (=> b!1475581 (=> (not res!1002253) (not e!827857))))

(declare-datatypes ((List!34445 0))(
  ( (Nil!34442) (Cons!34441 (h!35806 (_ BitVec 64)) (t!49131 List!34445)) )
))
(declare-fun arrayNoDuplicates!0 (array!99169 (_ BitVec 32) List!34445) Bool)

(assert (=> b!1475581 (= res!1002253 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34442))))

(declare-fun b!1475582 () Bool)

(declare-fun e!827861 () Bool)

(declare-fun e!827864 () Bool)

(assert (=> b!1475582 (= e!827861 e!827864)))

(declare-fun res!1002259 () Bool)

(assert (=> b!1475582 (=> (not res!1002259) (not e!827864))))

(declare-fun lt!644526 () SeekEntryResult!12131)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99169 (_ BitVec 32)) SeekEntryResult!12131)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475582 (= res!1002259 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47866 a!2862) j!93) mask!2687) (select (arr!47866 a!2862) j!93) a!2862 mask!2687) lt!644526))))

(assert (=> b!1475582 (= lt!644526 (Intermediate!12131 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1475583 () Bool)

(assert (=> b!1475583 (= e!827864 e!827862)))

(declare-fun res!1002251 () Bool)

(assert (=> b!1475583 (=> (not res!1002251) (not e!827862))))

(declare-fun lt!644525 () SeekEntryResult!12131)

(assert (=> b!1475583 (= res!1002251 (= lt!644525 (Intermediate!12131 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1475583 (= lt!644525 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644524 mask!2687) lt!644524 lt!644528 mask!2687))))

(assert (=> b!1475583 (= lt!644524 (select (store (arr!47866 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1475584 () Bool)

(assert (=> b!1475584 (= e!827858 (= lt!644525 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644524 lt!644528 mask!2687)))))

(declare-fun b!1475585 () Bool)

(declare-fun res!1002262 () Bool)

(assert (=> b!1475585 (=> (not res!1002262) (not e!827857))))

(assert (=> b!1475585 (= res!1002262 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48418 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48418 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48418 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1475586 () Bool)

(declare-fun res!1002257 () Bool)

(assert (=> b!1475586 (=> (not res!1002257) (not e!827857))))

(assert (=> b!1475586 (= res!1002257 (validKeyInArray!0 (select (arr!47866 a!2862) j!93)))))

(declare-fun b!1475587 () Bool)

(assert (=> b!1475587 (= e!827857 e!827861)))

(declare-fun res!1002256 () Bool)

(assert (=> b!1475587 (=> (not res!1002256) (not e!827861))))

(assert (=> b!1475587 (= res!1002256 (= (select (store (arr!47866 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475587 (= lt!644528 (array!99170 (store (arr!47866 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48418 a!2862)))))

(declare-fun b!1475588 () Bool)

(declare-fun res!1002247 () Bool)

(assert (=> b!1475588 (=> (not res!1002247) (not e!827862))))

(assert (=> b!1475588 (= res!1002247 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1475589 () Bool)

(declare-fun res!1002248 () Bool)

(assert (=> b!1475589 (=> (not res!1002248) (not e!827864))))

(assert (=> b!1475589 (= res!1002248 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47866 a!2862) j!93) a!2862 mask!2687) lt!644526))))

(assert (= (and start!126028 res!1002261) b!1475574))

(assert (= (and b!1475574 res!1002255) b!1475573))

(assert (= (and b!1475573 res!1002260) b!1475586))

(assert (= (and b!1475586 res!1002257) b!1475572))

(assert (= (and b!1475572 res!1002250) b!1475581))

(assert (= (and b!1475581 res!1002253) b!1475585))

(assert (= (and b!1475585 res!1002262) b!1475587))

(assert (= (and b!1475587 res!1002256) b!1475582))

(assert (= (and b!1475582 res!1002259) b!1475589))

(assert (= (and b!1475589 res!1002248) b!1475583))

(assert (= (and b!1475583 res!1002251) b!1475580))

(assert (= (and b!1475580 c!136183) b!1475584))

(assert (= (and b!1475580 (not c!136183)) b!1475579))

(assert (= (and b!1475580 res!1002258) b!1475588))

(assert (= (and b!1475588 res!1002247) b!1475575))

(assert (= (and b!1475575 res!1002252) b!1475578))

(assert (= (and b!1475578 (not res!1002254)) b!1475576))

(assert (= (and b!1475576 res!1002249) b!1475577))

(declare-fun m!1361235 () Bool)

(assert (=> b!1475573 m!1361235))

(assert (=> b!1475573 m!1361235))

(declare-fun m!1361237 () Bool)

(assert (=> b!1475573 m!1361237))

(declare-fun m!1361239 () Bool)

(assert (=> b!1475583 m!1361239))

(assert (=> b!1475583 m!1361239))

(declare-fun m!1361241 () Bool)

(assert (=> b!1475583 m!1361241))

(declare-fun m!1361243 () Bool)

(assert (=> b!1475583 m!1361243))

(declare-fun m!1361245 () Bool)

(assert (=> b!1475583 m!1361245))

(declare-fun m!1361247 () Bool)

(assert (=> b!1475586 m!1361247))

(assert (=> b!1475586 m!1361247))

(declare-fun m!1361249 () Bool)

(assert (=> b!1475586 m!1361249))

(assert (=> b!1475576 m!1361247))

(assert (=> b!1475576 m!1361247))

(declare-fun m!1361251 () Bool)

(assert (=> b!1475576 m!1361251))

(declare-fun m!1361253 () Bool)

(assert (=> b!1475578 m!1361253))

(assert (=> b!1475578 m!1361243))

(declare-fun m!1361255 () Bool)

(assert (=> b!1475578 m!1361255))

(assert (=> b!1475578 m!1361247))

(declare-fun m!1361257 () Bool)

(assert (=> b!1475581 m!1361257))

(assert (=> b!1475587 m!1361243))

(declare-fun m!1361259 () Bool)

(assert (=> b!1475587 m!1361259))

(assert (=> b!1475582 m!1361247))

(assert (=> b!1475582 m!1361247))

(declare-fun m!1361261 () Bool)

(assert (=> b!1475582 m!1361261))

(assert (=> b!1475582 m!1361261))

(assert (=> b!1475582 m!1361247))

(declare-fun m!1361263 () Bool)

(assert (=> b!1475582 m!1361263))

(declare-fun m!1361265 () Bool)

(assert (=> start!126028 m!1361265))

(declare-fun m!1361267 () Bool)

(assert (=> start!126028 m!1361267))

(declare-fun m!1361269 () Bool)

(assert (=> b!1475584 m!1361269))

(declare-fun m!1361271 () Bool)

(assert (=> b!1475579 m!1361271))

(declare-fun m!1361273 () Bool)

(assert (=> b!1475579 m!1361273))

(declare-fun m!1361275 () Bool)

(assert (=> b!1475575 m!1361275))

(assert (=> b!1475575 m!1361243))

(declare-fun m!1361277 () Bool)

(assert (=> b!1475575 m!1361277))

(assert (=> b!1475575 m!1361255))

(assert (=> b!1475575 m!1361253))

(assert (=> b!1475575 m!1361247))

(declare-fun m!1361279 () Bool)

(assert (=> b!1475575 m!1361279))

(declare-fun m!1361281 () Bool)

(assert (=> b!1475575 m!1361281))

(assert (=> b!1475575 m!1361247))

(assert (=> b!1475589 m!1361247))

(assert (=> b!1475589 m!1361247))

(declare-fun m!1361283 () Bool)

(assert (=> b!1475589 m!1361283))

(declare-fun m!1361285 () Bool)

(assert (=> b!1475572 m!1361285))

(check-sat (not start!126028) (not b!1475589) (not b!1475582) (not b!1475572) (not b!1475573) (not b!1475586) (not b!1475581) (not b!1475584) (not b!1475576) (not b!1475583) (not b!1475579) (not b!1475575))
(check-sat)
(get-model)

(declare-fun b!1475716 () Bool)

(declare-fun e!827933 () SeekEntryResult!12131)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475716 (= e!827933 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47866 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1475717 () Bool)

(declare-fun e!827934 () SeekEntryResult!12131)

(assert (=> b!1475717 (= e!827934 (Intermediate!12131 true index!646 x!665))))

(declare-fun b!1475718 () Bool)

(declare-fun lt!644571 () SeekEntryResult!12131)

(assert (=> b!1475718 (and (bvsge (index!50918 lt!644571) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644571) (size!48418 a!2862)))))

(declare-fun res!1002365 () Bool)

(assert (=> b!1475718 (= res!1002365 (= (select (arr!47866 a!2862) (index!50918 lt!644571)) (select (arr!47866 a!2862) j!93)))))

(declare-fun e!827930 () Bool)

(assert (=> b!1475718 (=> res!1002365 e!827930)))

(declare-fun e!827931 () Bool)

(assert (=> b!1475718 (= e!827931 e!827930)))

(declare-fun b!1475719 () Bool)

(declare-fun e!827932 () Bool)

(assert (=> b!1475719 (= e!827932 e!827931)))

(declare-fun res!1002366 () Bool)

(get-info :version)

(assert (=> b!1475719 (= res!1002366 (and ((_ is Intermediate!12131) lt!644571) (not (undefined!12943 lt!644571)) (bvslt (x!132508 lt!644571) #b01111111111111111111111111111110) (bvsge (x!132508 lt!644571) #b00000000000000000000000000000000) (bvsge (x!132508 lt!644571) x!665)))))

(assert (=> b!1475719 (=> (not res!1002366) (not e!827931))))

(declare-fun d!155701 () Bool)

(assert (=> d!155701 e!827932))

(declare-fun c!136197 () Bool)

(assert (=> d!155701 (= c!136197 (and ((_ is Intermediate!12131) lt!644571) (undefined!12943 lt!644571)))))

(assert (=> d!155701 (= lt!644571 e!827934)))

(declare-fun c!136198 () Bool)

(assert (=> d!155701 (= c!136198 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644570 () (_ BitVec 64))

(assert (=> d!155701 (= lt!644570 (select (arr!47866 a!2862) index!646))))

(assert (=> d!155701 (validMask!0 mask!2687)))

(assert (=> d!155701 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47866 a!2862) j!93) a!2862 mask!2687) lt!644571)))

(declare-fun b!1475720 () Bool)

(assert (=> b!1475720 (and (bvsge (index!50918 lt!644571) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644571) (size!48418 a!2862)))))

(assert (=> b!1475720 (= e!827930 (= (select (arr!47866 a!2862) (index!50918 lt!644571)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1475721 () Bool)

(assert (=> b!1475721 (= e!827933 (Intermediate!12131 false index!646 x!665))))

(declare-fun b!1475722 () Bool)

(assert (=> b!1475722 (= e!827934 e!827933)))

(declare-fun c!136196 () Bool)

(assert (=> b!1475722 (= c!136196 (or (= lt!644570 (select (arr!47866 a!2862) j!93)) (= (bvadd lt!644570 lt!644570) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1475723 () Bool)

(assert (=> b!1475723 (= e!827932 (bvsge (x!132508 lt!644571) #b01111111111111111111111111111110))))

(declare-fun b!1475724 () Bool)

(assert (=> b!1475724 (and (bvsge (index!50918 lt!644571) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644571) (size!48418 a!2862)))))

(declare-fun res!1002367 () Bool)

(assert (=> b!1475724 (= res!1002367 (= (select (arr!47866 a!2862) (index!50918 lt!644571)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475724 (=> res!1002367 e!827930)))

(assert (= (and d!155701 c!136198) b!1475717))

(assert (= (and d!155701 (not c!136198)) b!1475722))

(assert (= (and b!1475722 c!136196) b!1475721))

(assert (= (and b!1475722 (not c!136196)) b!1475716))

(assert (= (and d!155701 c!136197) b!1475723))

(assert (= (and d!155701 (not c!136197)) b!1475719))

(assert (= (and b!1475719 res!1002366) b!1475718))

(assert (= (and b!1475718 (not res!1002365)) b!1475724))

(assert (= (and b!1475724 (not res!1002367)) b!1475720))

(declare-fun m!1361391 () Bool)

(assert (=> b!1475720 m!1361391))

(declare-fun m!1361393 () Bool)

(assert (=> b!1475716 m!1361393))

(assert (=> b!1475716 m!1361393))

(assert (=> b!1475716 m!1361247))

(declare-fun m!1361395 () Bool)

(assert (=> b!1475716 m!1361395))

(assert (=> d!155701 m!1361253))

(assert (=> d!155701 m!1361265))

(assert (=> b!1475718 m!1361391))

(assert (=> b!1475724 m!1361391))

(assert (=> b!1475589 d!155701))

(declare-fun b!1475737 () Bool)

(declare-fun e!827943 () SeekEntryResult!12131)

(assert (=> b!1475737 (= e!827943 (MissingVacant!12131 intermediateAfterIndex!19))))

(declare-fun d!155703 () Bool)

(declare-fun lt!644577 () SeekEntryResult!12131)

(assert (=> d!155703 (and (or ((_ is Undefined!12131) lt!644577) (not ((_ is Found!12131) lt!644577)) (and (bvsge (index!50917 lt!644577) #b00000000000000000000000000000000) (bvslt (index!50917 lt!644577) (size!48418 lt!644528)))) (or ((_ is Undefined!12131) lt!644577) ((_ is Found!12131) lt!644577) (not ((_ is MissingVacant!12131) lt!644577)) (not (= (index!50919 lt!644577) intermediateAfterIndex!19)) (and (bvsge (index!50919 lt!644577) #b00000000000000000000000000000000) (bvslt (index!50919 lt!644577) (size!48418 lt!644528)))) (or ((_ is Undefined!12131) lt!644577) (ite ((_ is Found!12131) lt!644577) (= (select (arr!47866 lt!644528) (index!50917 lt!644577)) lt!644524) (and ((_ is MissingVacant!12131) lt!644577) (= (index!50919 lt!644577) intermediateAfterIndex!19) (= (select (arr!47866 lt!644528) (index!50919 lt!644577)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!827941 () SeekEntryResult!12131)

(assert (=> d!155703 (= lt!644577 e!827941)))

(declare-fun c!136206 () Bool)

(assert (=> d!155703 (= c!136206 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644576 () (_ BitVec 64))

(assert (=> d!155703 (= lt!644576 (select (arr!47866 lt!644528) index!646))))

(assert (=> d!155703 (validMask!0 mask!2687)))

(assert (=> d!155703 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644524 lt!644528 mask!2687) lt!644577)))

(declare-fun b!1475738 () Bool)

(declare-fun c!136207 () Bool)

(assert (=> b!1475738 (= c!136207 (= lt!644576 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827942 () SeekEntryResult!12131)

(assert (=> b!1475738 (= e!827942 e!827943)))

(declare-fun b!1475739 () Bool)

(assert (=> b!1475739 (= e!827941 e!827942)))

(declare-fun c!136205 () Bool)

(assert (=> b!1475739 (= c!136205 (= lt!644576 lt!644524))))

(declare-fun b!1475740 () Bool)

(assert (=> b!1475740 (= e!827941 Undefined!12131)))

(declare-fun b!1475741 () Bool)

(assert (=> b!1475741 (= e!827943 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!644524 lt!644528 mask!2687))))

(declare-fun b!1475742 () Bool)

(assert (=> b!1475742 (= e!827942 (Found!12131 index!646))))

(assert (= (and d!155703 c!136206) b!1475740))

(assert (= (and d!155703 (not c!136206)) b!1475739))

(assert (= (and b!1475739 c!136205) b!1475742))

(assert (= (and b!1475739 (not c!136205)) b!1475738))

(assert (= (and b!1475738 c!136207) b!1475737))

(assert (= (and b!1475738 (not c!136207)) b!1475741))

(declare-fun m!1361397 () Bool)

(assert (=> d!155703 m!1361397))

(declare-fun m!1361399 () Bool)

(assert (=> d!155703 m!1361399))

(declare-fun m!1361401 () Bool)

(assert (=> d!155703 m!1361401))

(assert (=> d!155703 m!1361265))

(assert (=> b!1475741 m!1361393))

(assert (=> b!1475741 m!1361393))

(declare-fun m!1361403 () Bool)

(assert (=> b!1475741 m!1361403))

(assert (=> b!1475579 d!155703))

(declare-fun b!1475755 () Bool)

(declare-fun e!827952 () SeekEntryResult!12131)

(declare-fun e!827950 () SeekEntryResult!12131)

(assert (=> b!1475755 (= e!827952 e!827950)))

(declare-fun lt!644584 () (_ BitVec 64))

(declare-fun lt!644586 () SeekEntryResult!12131)

(assert (=> b!1475755 (= lt!644584 (select (arr!47866 lt!644528) (index!50918 lt!644586)))))

(declare-fun c!136216 () Bool)

(assert (=> b!1475755 (= c!136216 (= lt!644584 lt!644524))))

(declare-fun b!1475756 () Bool)

(assert (=> b!1475756 (= e!827950 (Found!12131 (index!50918 lt!644586)))))

(declare-fun b!1475757 () Bool)

(assert (=> b!1475757 (= e!827952 Undefined!12131)))

(declare-fun b!1475758 () Bool)

(declare-fun e!827951 () SeekEntryResult!12131)

(assert (=> b!1475758 (= e!827951 (MissingZero!12131 (index!50918 lt!644586)))))

(declare-fun d!155705 () Bool)

(declare-fun lt!644585 () SeekEntryResult!12131)

(assert (=> d!155705 (and (or ((_ is Undefined!12131) lt!644585) (not ((_ is Found!12131) lt!644585)) (and (bvsge (index!50917 lt!644585) #b00000000000000000000000000000000) (bvslt (index!50917 lt!644585) (size!48418 lt!644528)))) (or ((_ is Undefined!12131) lt!644585) ((_ is Found!12131) lt!644585) (not ((_ is MissingZero!12131) lt!644585)) (and (bvsge (index!50916 lt!644585) #b00000000000000000000000000000000) (bvslt (index!50916 lt!644585) (size!48418 lt!644528)))) (or ((_ is Undefined!12131) lt!644585) ((_ is Found!12131) lt!644585) ((_ is MissingZero!12131) lt!644585) (not ((_ is MissingVacant!12131) lt!644585)) (and (bvsge (index!50919 lt!644585) #b00000000000000000000000000000000) (bvslt (index!50919 lt!644585) (size!48418 lt!644528)))) (or ((_ is Undefined!12131) lt!644585) (ite ((_ is Found!12131) lt!644585) (= (select (arr!47866 lt!644528) (index!50917 lt!644585)) lt!644524) (ite ((_ is MissingZero!12131) lt!644585) (= (select (arr!47866 lt!644528) (index!50916 lt!644585)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12131) lt!644585) (= (select (arr!47866 lt!644528) (index!50919 lt!644585)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155705 (= lt!644585 e!827952)))

(declare-fun c!136215 () Bool)

(assert (=> d!155705 (= c!136215 (and ((_ is Intermediate!12131) lt!644586) (undefined!12943 lt!644586)))))

(assert (=> d!155705 (= lt!644586 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644524 mask!2687) lt!644524 lt!644528 mask!2687))))

(assert (=> d!155705 (validMask!0 mask!2687)))

(assert (=> d!155705 (= (seekEntryOrOpen!0 lt!644524 lt!644528 mask!2687) lt!644585)))

(declare-fun b!1475759 () Bool)

(assert (=> b!1475759 (= e!827951 (seekKeyOrZeroReturnVacant!0 (x!132508 lt!644586) (index!50918 lt!644586) (index!50918 lt!644586) lt!644524 lt!644528 mask!2687))))

(declare-fun b!1475760 () Bool)

(declare-fun c!136214 () Bool)

(assert (=> b!1475760 (= c!136214 (= lt!644584 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475760 (= e!827950 e!827951)))

(assert (= (and d!155705 c!136215) b!1475757))

(assert (= (and d!155705 (not c!136215)) b!1475755))

(assert (= (and b!1475755 c!136216) b!1475756))

(assert (= (and b!1475755 (not c!136216)) b!1475760))

(assert (= (and b!1475760 c!136214) b!1475758))

(assert (= (and b!1475760 (not c!136214)) b!1475759))

(declare-fun m!1361405 () Bool)

(assert (=> b!1475755 m!1361405))

(assert (=> d!155705 m!1361239))

(assert (=> d!155705 m!1361265))

(assert (=> d!155705 m!1361239))

(assert (=> d!155705 m!1361241))

(declare-fun m!1361407 () Bool)

(assert (=> d!155705 m!1361407))

(declare-fun m!1361409 () Bool)

(assert (=> d!155705 m!1361409))

(declare-fun m!1361411 () Bool)

(assert (=> d!155705 m!1361411))

(declare-fun m!1361413 () Bool)

(assert (=> b!1475759 m!1361413))

(assert (=> b!1475579 d!155705))

(declare-fun d!155709 () Bool)

(assert (=> d!155709 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126028 d!155709))

(declare-fun d!155713 () Bool)

(assert (=> d!155713 (= (array_inv!37099 a!2862) (bvsge (size!48418 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126028 d!155713))

(declare-fun d!155715 () Bool)

(assert (=> d!155715 (= (validKeyInArray!0 (select (arr!47866 a!2862) j!93)) (and (not (= (select (arr!47866 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47866 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1475586 d!155715))

(declare-fun b!1475761 () Bool)

(declare-fun e!827955 () SeekEntryResult!12131)

(assert (=> b!1475761 (= e!827955 (MissingVacant!12131 index!646))))

(declare-fun lt!644588 () SeekEntryResult!12131)

(declare-fun d!155717 () Bool)

(assert (=> d!155717 (and (or ((_ is Undefined!12131) lt!644588) (not ((_ is Found!12131) lt!644588)) (and (bvsge (index!50917 lt!644588) #b00000000000000000000000000000000) (bvslt (index!50917 lt!644588) (size!48418 a!2862)))) (or ((_ is Undefined!12131) lt!644588) ((_ is Found!12131) lt!644588) (not ((_ is MissingVacant!12131) lt!644588)) (not (= (index!50919 lt!644588) index!646)) (and (bvsge (index!50919 lt!644588) #b00000000000000000000000000000000) (bvslt (index!50919 lt!644588) (size!48418 a!2862)))) (or ((_ is Undefined!12131) lt!644588) (ite ((_ is Found!12131) lt!644588) (= (select (arr!47866 a!2862) (index!50917 lt!644588)) (select (arr!47866 a!2862) j!93)) (and ((_ is MissingVacant!12131) lt!644588) (= (index!50919 lt!644588) index!646) (= (select (arr!47866 a!2862) (index!50919 lt!644588)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!827953 () SeekEntryResult!12131)

(assert (=> d!155717 (= lt!644588 e!827953)))

(declare-fun c!136218 () Bool)

(assert (=> d!155717 (= c!136218 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644587 () (_ BitVec 64))

(assert (=> d!155717 (= lt!644587 (select (arr!47866 a!2862) index!646))))

(assert (=> d!155717 (validMask!0 mask!2687)))

(assert (=> d!155717 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47866 a!2862) j!93) a!2862 mask!2687) lt!644588)))

(declare-fun b!1475762 () Bool)

(declare-fun c!136219 () Bool)

(assert (=> b!1475762 (= c!136219 (= lt!644587 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827954 () SeekEntryResult!12131)

(assert (=> b!1475762 (= e!827954 e!827955)))

(declare-fun b!1475763 () Bool)

(assert (=> b!1475763 (= e!827953 e!827954)))

(declare-fun c!136217 () Bool)

(assert (=> b!1475763 (= c!136217 (= lt!644587 (select (arr!47866 a!2862) j!93)))))

(declare-fun b!1475764 () Bool)

(assert (=> b!1475764 (= e!827953 Undefined!12131)))

(declare-fun b!1475765 () Bool)

(assert (=> b!1475765 (= e!827955 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) index!646 (select (arr!47866 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1475766 () Bool)

(assert (=> b!1475766 (= e!827954 (Found!12131 index!646))))

(assert (= (and d!155717 c!136218) b!1475764))

(assert (= (and d!155717 (not c!136218)) b!1475763))

(assert (= (and b!1475763 c!136217) b!1475766))

(assert (= (and b!1475763 (not c!136217)) b!1475762))

(assert (= (and b!1475762 c!136219) b!1475761))

(assert (= (and b!1475762 (not c!136219)) b!1475765))

(declare-fun m!1361415 () Bool)

(assert (=> d!155717 m!1361415))

(declare-fun m!1361417 () Bool)

(assert (=> d!155717 m!1361417))

(assert (=> d!155717 m!1361253))

(assert (=> d!155717 m!1361265))

(assert (=> b!1475765 m!1361393))

(assert (=> b!1475765 m!1361393))

(assert (=> b!1475765 m!1361247))

(declare-fun m!1361419 () Bool)

(assert (=> b!1475765 m!1361419))

(assert (=> b!1475576 d!155717))

(declare-fun b!1475775 () Bool)

(declare-fun e!827962 () SeekEntryResult!12131)

(declare-fun e!827960 () SeekEntryResult!12131)

(assert (=> b!1475775 (= e!827962 e!827960)))

(declare-fun lt!644593 () (_ BitVec 64))

(declare-fun lt!644595 () SeekEntryResult!12131)

(assert (=> b!1475775 (= lt!644593 (select (arr!47866 a!2862) (index!50918 lt!644595)))))

(declare-fun c!136226 () Bool)

(assert (=> b!1475775 (= c!136226 (= lt!644593 (select (arr!47866 a!2862) j!93)))))

(declare-fun b!1475776 () Bool)

(assert (=> b!1475776 (= e!827960 (Found!12131 (index!50918 lt!644595)))))

(declare-fun b!1475777 () Bool)

(assert (=> b!1475777 (= e!827962 Undefined!12131)))

(declare-fun b!1475778 () Bool)

(declare-fun e!827961 () SeekEntryResult!12131)

(assert (=> b!1475778 (= e!827961 (MissingZero!12131 (index!50918 lt!644595)))))

(declare-fun d!155719 () Bool)

(declare-fun lt!644594 () SeekEntryResult!12131)

(assert (=> d!155719 (and (or ((_ is Undefined!12131) lt!644594) (not ((_ is Found!12131) lt!644594)) (and (bvsge (index!50917 lt!644594) #b00000000000000000000000000000000) (bvslt (index!50917 lt!644594) (size!48418 a!2862)))) (or ((_ is Undefined!12131) lt!644594) ((_ is Found!12131) lt!644594) (not ((_ is MissingZero!12131) lt!644594)) (and (bvsge (index!50916 lt!644594) #b00000000000000000000000000000000) (bvslt (index!50916 lt!644594) (size!48418 a!2862)))) (or ((_ is Undefined!12131) lt!644594) ((_ is Found!12131) lt!644594) ((_ is MissingZero!12131) lt!644594) (not ((_ is MissingVacant!12131) lt!644594)) (and (bvsge (index!50919 lt!644594) #b00000000000000000000000000000000) (bvslt (index!50919 lt!644594) (size!48418 a!2862)))) (or ((_ is Undefined!12131) lt!644594) (ite ((_ is Found!12131) lt!644594) (= (select (arr!47866 a!2862) (index!50917 lt!644594)) (select (arr!47866 a!2862) j!93)) (ite ((_ is MissingZero!12131) lt!644594) (= (select (arr!47866 a!2862) (index!50916 lt!644594)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12131) lt!644594) (= (select (arr!47866 a!2862) (index!50919 lt!644594)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155719 (= lt!644594 e!827962)))

(declare-fun c!136225 () Bool)

(assert (=> d!155719 (= c!136225 (and ((_ is Intermediate!12131) lt!644595) (undefined!12943 lt!644595)))))

(assert (=> d!155719 (= lt!644595 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47866 a!2862) j!93) mask!2687) (select (arr!47866 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155719 (validMask!0 mask!2687)))

(assert (=> d!155719 (= (seekEntryOrOpen!0 (select (arr!47866 a!2862) j!93) a!2862 mask!2687) lt!644594)))

(declare-fun b!1475779 () Bool)

(assert (=> b!1475779 (= e!827961 (seekKeyOrZeroReturnVacant!0 (x!132508 lt!644595) (index!50918 lt!644595) (index!50918 lt!644595) (select (arr!47866 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1475780 () Bool)

(declare-fun c!136224 () Bool)

(assert (=> b!1475780 (= c!136224 (= lt!644593 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475780 (= e!827960 e!827961)))

(assert (= (and d!155719 c!136225) b!1475777))

(assert (= (and d!155719 (not c!136225)) b!1475775))

(assert (= (and b!1475775 c!136226) b!1475776))

(assert (= (and b!1475775 (not c!136226)) b!1475780))

(assert (= (and b!1475780 c!136224) b!1475778))

(assert (= (and b!1475780 (not c!136224)) b!1475779))

(declare-fun m!1361421 () Bool)

(assert (=> b!1475775 m!1361421))

(assert (=> d!155719 m!1361247))

(assert (=> d!155719 m!1361261))

(assert (=> d!155719 m!1361265))

(assert (=> d!155719 m!1361261))

(assert (=> d!155719 m!1361247))

(assert (=> d!155719 m!1361263))

(declare-fun m!1361423 () Bool)

(assert (=> d!155719 m!1361423))

(declare-fun m!1361425 () Bool)

(assert (=> d!155719 m!1361425))

(declare-fun m!1361427 () Bool)

(assert (=> d!155719 m!1361427))

(assert (=> b!1475779 m!1361247))

(declare-fun m!1361429 () Bool)

(assert (=> b!1475779 m!1361429))

(assert (=> b!1475575 d!155719))

(declare-fun bm!67772 () Bool)

(declare-fun call!67775 () Bool)

(assert (=> bm!67772 (= call!67775 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1475808 () Bool)

(declare-fun e!827982 () Bool)

(declare-fun e!827980 () Bool)

(assert (=> b!1475808 (= e!827982 e!827980)))

(declare-fun c!136234 () Bool)

(assert (=> b!1475808 (= c!136234 (validKeyInArray!0 (select (arr!47866 a!2862) j!93)))))

(declare-fun b!1475809 () Bool)

(declare-fun e!827981 () Bool)

(assert (=> b!1475809 (= e!827980 e!827981)))

(declare-fun lt!644604 () (_ BitVec 64))

(assert (=> b!1475809 (= lt!644604 (select (arr!47866 a!2862) j!93))))

(declare-fun lt!644605 () Unit!49443)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99169 (_ BitVec 64) (_ BitVec 32)) Unit!49443)

(assert (=> b!1475809 (= lt!644605 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!644604 j!93))))

(declare-fun arrayContainsKey!0 (array!99169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1475809 (arrayContainsKey!0 a!2862 lt!644604 #b00000000000000000000000000000000)))

(declare-fun lt!644606 () Unit!49443)

(assert (=> b!1475809 (= lt!644606 lt!644605)))

(declare-fun res!1002381 () Bool)

(assert (=> b!1475809 (= res!1002381 (= (seekEntryOrOpen!0 (select (arr!47866 a!2862) j!93) a!2862 mask!2687) (Found!12131 j!93)))))

(assert (=> b!1475809 (=> (not res!1002381) (not e!827981))))

(declare-fun b!1475810 () Bool)

(assert (=> b!1475810 (= e!827980 call!67775)))

(declare-fun b!1475811 () Bool)

(assert (=> b!1475811 (= e!827981 call!67775)))

(declare-fun d!155721 () Bool)

(declare-fun res!1002382 () Bool)

(assert (=> d!155721 (=> res!1002382 e!827982)))

(assert (=> d!155721 (= res!1002382 (bvsge j!93 (size!48418 a!2862)))))

(assert (=> d!155721 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!827982)))

(assert (= (and d!155721 (not res!1002382)) b!1475808))

(assert (= (and b!1475808 c!136234) b!1475809))

(assert (= (and b!1475808 (not c!136234)) b!1475810))

(assert (= (and b!1475809 res!1002381) b!1475811))

(assert (= (or b!1475811 b!1475810) bm!67772))

(declare-fun m!1361439 () Bool)

(assert (=> bm!67772 m!1361439))

(assert (=> b!1475808 m!1361247))

(assert (=> b!1475808 m!1361247))

(assert (=> b!1475808 m!1361249))

(assert (=> b!1475809 m!1361247))

(declare-fun m!1361441 () Bool)

(assert (=> b!1475809 m!1361441))

(declare-fun m!1361443 () Bool)

(assert (=> b!1475809 m!1361443))

(assert (=> b!1475809 m!1361247))

(assert (=> b!1475809 m!1361279))

(assert (=> b!1475575 d!155721))

(declare-fun d!155725 () Bool)

(assert (=> d!155725 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!644615 () Unit!49443)

(declare-fun choose!38 (array!99169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49443)

(assert (=> d!155725 (= lt!644615 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155725 (validMask!0 mask!2687)))

(assert (=> d!155725 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!644615)))

(declare-fun bs!42547 () Bool)

(assert (= bs!42547 d!155725))

(assert (=> bs!42547 m!1361281))

(declare-fun m!1361445 () Bool)

(assert (=> bs!42547 m!1361445))

(assert (=> bs!42547 m!1361265))

(assert (=> b!1475575 d!155725))

(declare-fun d!155727 () Bool)

(assert (=> d!155727 (= (validKeyInArray!0 (select (arr!47866 a!2862) i!1006)) (and (not (= (select (arr!47866 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47866 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1475573 d!155727))

(declare-fun b!1475824 () Bool)

(declare-fun e!827992 () SeekEntryResult!12131)

(assert (=> b!1475824 (= e!827992 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!644524 lt!644528 mask!2687))))

(declare-fun b!1475825 () Bool)

(declare-fun e!827993 () SeekEntryResult!12131)

(assert (=> b!1475825 (= e!827993 (Intermediate!12131 true index!646 x!665))))

(declare-fun b!1475826 () Bool)

(declare-fun lt!644617 () SeekEntryResult!12131)

(assert (=> b!1475826 (and (bvsge (index!50918 lt!644617) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644617) (size!48418 lt!644528)))))

(declare-fun res!1002383 () Bool)

(assert (=> b!1475826 (= res!1002383 (= (select (arr!47866 lt!644528) (index!50918 lt!644617)) lt!644524))))

(declare-fun e!827989 () Bool)

(assert (=> b!1475826 (=> res!1002383 e!827989)))

(declare-fun e!827990 () Bool)

(assert (=> b!1475826 (= e!827990 e!827989)))

(declare-fun b!1475827 () Bool)

(declare-fun e!827991 () Bool)

(assert (=> b!1475827 (= e!827991 e!827990)))

(declare-fun res!1002384 () Bool)

(assert (=> b!1475827 (= res!1002384 (and ((_ is Intermediate!12131) lt!644617) (not (undefined!12943 lt!644617)) (bvslt (x!132508 lt!644617) #b01111111111111111111111111111110) (bvsge (x!132508 lt!644617) #b00000000000000000000000000000000) (bvsge (x!132508 lt!644617) x!665)))))

(assert (=> b!1475827 (=> (not res!1002384) (not e!827990))))

(declare-fun d!155729 () Bool)

(assert (=> d!155729 e!827991))

(declare-fun c!136242 () Bool)

(assert (=> d!155729 (= c!136242 (and ((_ is Intermediate!12131) lt!644617) (undefined!12943 lt!644617)))))

(assert (=> d!155729 (= lt!644617 e!827993)))

(declare-fun c!136243 () Bool)

(assert (=> d!155729 (= c!136243 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644616 () (_ BitVec 64))

(assert (=> d!155729 (= lt!644616 (select (arr!47866 lt!644528) index!646))))

(assert (=> d!155729 (validMask!0 mask!2687)))

(assert (=> d!155729 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644524 lt!644528 mask!2687) lt!644617)))

(declare-fun b!1475828 () Bool)

(assert (=> b!1475828 (and (bvsge (index!50918 lt!644617) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644617) (size!48418 lt!644528)))))

(assert (=> b!1475828 (= e!827989 (= (select (arr!47866 lt!644528) (index!50918 lt!644617)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1475829 () Bool)

(assert (=> b!1475829 (= e!827992 (Intermediate!12131 false index!646 x!665))))

(declare-fun b!1475830 () Bool)

(assert (=> b!1475830 (= e!827993 e!827992)))

(declare-fun c!136241 () Bool)

(assert (=> b!1475830 (= c!136241 (or (= lt!644616 lt!644524) (= (bvadd lt!644616 lt!644616) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1475831 () Bool)

(assert (=> b!1475831 (= e!827991 (bvsge (x!132508 lt!644617) #b01111111111111111111111111111110))))

(declare-fun b!1475832 () Bool)

(assert (=> b!1475832 (and (bvsge (index!50918 lt!644617) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644617) (size!48418 lt!644528)))))

(declare-fun res!1002385 () Bool)

(assert (=> b!1475832 (= res!1002385 (= (select (arr!47866 lt!644528) (index!50918 lt!644617)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475832 (=> res!1002385 e!827989)))

(assert (= (and d!155729 c!136243) b!1475825))

(assert (= (and d!155729 (not c!136243)) b!1475830))

(assert (= (and b!1475830 c!136241) b!1475829))

(assert (= (and b!1475830 (not c!136241)) b!1475824))

(assert (= (and d!155729 c!136242) b!1475831))

(assert (= (and d!155729 (not c!136242)) b!1475827))

(assert (= (and b!1475827 res!1002384) b!1475826))

(assert (= (and b!1475826 (not res!1002383)) b!1475832))

(assert (= (and b!1475832 (not res!1002385)) b!1475828))

(declare-fun m!1361447 () Bool)

(assert (=> b!1475828 m!1361447))

(assert (=> b!1475824 m!1361393))

(assert (=> b!1475824 m!1361393))

(declare-fun m!1361449 () Bool)

(assert (=> b!1475824 m!1361449))

(assert (=> d!155729 m!1361401))

(assert (=> d!155729 m!1361265))

(assert (=> b!1475826 m!1361447))

(assert (=> b!1475832 m!1361447))

(assert (=> b!1475584 d!155729))

(declare-fun b!1475833 () Bool)

(declare-fun e!827997 () SeekEntryResult!12131)

(assert (=> b!1475833 (= e!827997 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47866 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47866 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1475834 () Bool)

(declare-fun e!827998 () SeekEntryResult!12131)

(assert (=> b!1475834 (= e!827998 (Intermediate!12131 true (toIndex!0 (select (arr!47866 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1475835 () Bool)

(declare-fun lt!644619 () SeekEntryResult!12131)

(assert (=> b!1475835 (and (bvsge (index!50918 lt!644619) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644619) (size!48418 a!2862)))))

(declare-fun res!1002386 () Bool)

(assert (=> b!1475835 (= res!1002386 (= (select (arr!47866 a!2862) (index!50918 lt!644619)) (select (arr!47866 a!2862) j!93)))))

(declare-fun e!827994 () Bool)

(assert (=> b!1475835 (=> res!1002386 e!827994)))

(declare-fun e!827995 () Bool)

(assert (=> b!1475835 (= e!827995 e!827994)))

(declare-fun b!1475836 () Bool)

(declare-fun e!827996 () Bool)

(assert (=> b!1475836 (= e!827996 e!827995)))

(declare-fun res!1002387 () Bool)

(assert (=> b!1475836 (= res!1002387 (and ((_ is Intermediate!12131) lt!644619) (not (undefined!12943 lt!644619)) (bvslt (x!132508 lt!644619) #b01111111111111111111111111111110) (bvsge (x!132508 lt!644619) #b00000000000000000000000000000000) (bvsge (x!132508 lt!644619) #b00000000000000000000000000000000)))))

(assert (=> b!1475836 (=> (not res!1002387) (not e!827995))))

(declare-fun d!155731 () Bool)

(assert (=> d!155731 e!827996))

(declare-fun c!136245 () Bool)

(assert (=> d!155731 (= c!136245 (and ((_ is Intermediate!12131) lt!644619) (undefined!12943 lt!644619)))))

(assert (=> d!155731 (= lt!644619 e!827998)))

(declare-fun c!136246 () Bool)

(assert (=> d!155731 (= c!136246 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!644618 () (_ BitVec 64))

(assert (=> d!155731 (= lt!644618 (select (arr!47866 a!2862) (toIndex!0 (select (arr!47866 a!2862) j!93) mask!2687)))))

(assert (=> d!155731 (validMask!0 mask!2687)))

(assert (=> d!155731 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47866 a!2862) j!93) mask!2687) (select (arr!47866 a!2862) j!93) a!2862 mask!2687) lt!644619)))

(declare-fun b!1475837 () Bool)

(assert (=> b!1475837 (and (bvsge (index!50918 lt!644619) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644619) (size!48418 a!2862)))))

(assert (=> b!1475837 (= e!827994 (= (select (arr!47866 a!2862) (index!50918 lt!644619)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1475838 () Bool)

(assert (=> b!1475838 (= e!827997 (Intermediate!12131 false (toIndex!0 (select (arr!47866 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1475839 () Bool)

(assert (=> b!1475839 (= e!827998 e!827997)))

(declare-fun c!136244 () Bool)

(assert (=> b!1475839 (= c!136244 (or (= lt!644618 (select (arr!47866 a!2862) j!93)) (= (bvadd lt!644618 lt!644618) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1475840 () Bool)

(assert (=> b!1475840 (= e!827996 (bvsge (x!132508 lt!644619) #b01111111111111111111111111111110))))

(declare-fun b!1475841 () Bool)

(assert (=> b!1475841 (and (bvsge (index!50918 lt!644619) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644619) (size!48418 a!2862)))))

(declare-fun res!1002388 () Bool)

(assert (=> b!1475841 (= res!1002388 (= (select (arr!47866 a!2862) (index!50918 lt!644619)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475841 (=> res!1002388 e!827994)))

(assert (= (and d!155731 c!136246) b!1475834))

(assert (= (and d!155731 (not c!136246)) b!1475839))

(assert (= (and b!1475839 c!136244) b!1475838))

(assert (= (and b!1475839 (not c!136244)) b!1475833))

(assert (= (and d!155731 c!136245) b!1475840))

(assert (= (and d!155731 (not c!136245)) b!1475836))

(assert (= (and b!1475836 res!1002387) b!1475835))

(assert (= (and b!1475835 (not res!1002386)) b!1475841))

(assert (= (and b!1475841 (not res!1002388)) b!1475837))

(declare-fun m!1361451 () Bool)

(assert (=> b!1475837 m!1361451))

(assert (=> b!1475833 m!1361261))

(declare-fun m!1361453 () Bool)

(assert (=> b!1475833 m!1361453))

(assert (=> b!1475833 m!1361453))

(assert (=> b!1475833 m!1361247))

(declare-fun m!1361455 () Bool)

(assert (=> b!1475833 m!1361455))

(assert (=> d!155731 m!1361261))

(declare-fun m!1361457 () Bool)

(assert (=> d!155731 m!1361457))

(assert (=> d!155731 m!1361265))

(assert (=> b!1475835 m!1361451))

(assert (=> b!1475841 m!1361451))

(assert (=> b!1475582 d!155731))

(declare-fun d!155733 () Bool)

(declare-fun lt!644634 () (_ BitVec 32))

(declare-fun lt!644633 () (_ BitVec 32))

(assert (=> d!155733 (= lt!644634 (bvmul (bvxor lt!644633 (bvlshr lt!644633 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155733 (= lt!644633 ((_ extract 31 0) (bvand (bvxor (select (arr!47866 a!2862) j!93) (bvlshr (select (arr!47866 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155733 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1002389 (let ((h!35809 ((_ extract 31 0) (bvand (bvxor (select (arr!47866 a!2862) j!93) (bvlshr (select (arr!47866 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132514 (bvmul (bvxor h!35809 (bvlshr h!35809 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132514 (bvlshr x!132514 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1002389 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1002389 #b00000000000000000000000000000000))))))

(assert (=> d!155733 (= (toIndex!0 (select (arr!47866 a!2862) j!93) mask!2687) (bvand (bvxor lt!644634 (bvlshr lt!644634 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1475582 d!155733))

(declare-fun b!1475860 () Bool)

(declare-fun e!828011 () SeekEntryResult!12131)

(assert (=> b!1475860 (= e!828011 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!644524 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!644524 lt!644528 mask!2687))))

(declare-fun b!1475861 () Bool)

(declare-fun e!828012 () SeekEntryResult!12131)

(assert (=> b!1475861 (= e!828012 (Intermediate!12131 true (toIndex!0 lt!644524 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1475862 () Bool)

(declare-fun lt!644636 () SeekEntryResult!12131)

(assert (=> b!1475862 (and (bvsge (index!50918 lt!644636) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644636) (size!48418 lt!644528)))))

(declare-fun res!1002390 () Bool)

(assert (=> b!1475862 (= res!1002390 (= (select (arr!47866 lt!644528) (index!50918 lt!644636)) lt!644524))))

(declare-fun e!828008 () Bool)

(assert (=> b!1475862 (=> res!1002390 e!828008)))

(declare-fun e!828009 () Bool)

(assert (=> b!1475862 (= e!828009 e!828008)))

(declare-fun b!1475863 () Bool)

(declare-fun e!828010 () Bool)

(assert (=> b!1475863 (= e!828010 e!828009)))

(declare-fun res!1002391 () Bool)

(assert (=> b!1475863 (= res!1002391 (and ((_ is Intermediate!12131) lt!644636) (not (undefined!12943 lt!644636)) (bvslt (x!132508 lt!644636) #b01111111111111111111111111111110) (bvsge (x!132508 lt!644636) #b00000000000000000000000000000000) (bvsge (x!132508 lt!644636) #b00000000000000000000000000000000)))))

(assert (=> b!1475863 (=> (not res!1002391) (not e!828009))))

(declare-fun d!155737 () Bool)

(assert (=> d!155737 e!828010))

(declare-fun c!136257 () Bool)

(assert (=> d!155737 (= c!136257 (and ((_ is Intermediate!12131) lt!644636) (undefined!12943 lt!644636)))))

(assert (=> d!155737 (= lt!644636 e!828012)))

(declare-fun c!136258 () Bool)

(assert (=> d!155737 (= c!136258 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!644635 () (_ BitVec 64))

(assert (=> d!155737 (= lt!644635 (select (arr!47866 lt!644528) (toIndex!0 lt!644524 mask!2687)))))

(assert (=> d!155737 (validMask!0 mask!2687)))

(assert (=> d!155737 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644524 mask!2687) lt!644524 lt!644528 mask!2687) lt!644636)))

(declare-fun b!1475864 () Bool)

(assert (=> b!1475864 (and (bvsge (index!50918 lt!644636) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644636) (size!48418 lt!644528)))))

(assert (=> b!1475864 (= e!828008 (= (select (arr!47866 lt!644528) (index!50918 lt!644636)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1475865 () Bool)

(assert (=> b!1475865 (= e!828011 (Intermediate!12131 false (toIndex!0 lt!644524 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1475866 () Bool)

(assert (=> b!1475866 (= e!828012 e!828011)))

(declare-fun c!136256 () Bool)

(assert (=> b!1475866 (= c!136256 (or (= lt!644635 lt!644524) (= (bvadd lt!644635 lt!644635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1475867 () Bool)

(assert (=> b!1475867 (= e!828010 (bvsge (x!132508 lt!644636) #b01111111111111111111111111111110))))

(declare-fun b!1475868 () Bool)

(assert (=> b!1475868 (and (bvsge (index!50918 lt!644636) #b00000000000000000000000000000000) (bvslt (index!50918 lt!644636) (size!48418 lt!644528)))))

(declare-fun res!1002392 () Bool)

(assert (=> b!1475868 (= res!1002392 (= (select (arr!47866 lt!644528) (index!50918 lt!644636)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475868 (=> res!1002392 e!828008)))

(assert (= (and d!155737 c!136258) b!1475861))

(assert (= (and d!155737 (not c!136258)) b!1475866))

(assert (= (and b!1475866 c!136256) b!1475865))

(assert (= (and b!1475866 (not c!136256)) b!1475860))

(assert (= (and d!155737 c!136257) b!1475867))

(assert (= (and d!155737 (not c!136257)) b!1475863))

(assert (= (and b!1475863 res!1002391) b!1475862))

(assert (= (and b!1475862 (not res!1002390)) b!1475868))

(assert (= (and b!1475868 (not res!1002392)) b!1475864))

(declare-fun m!1361469 () Bool)

(assert (=> b!1475864 m!1361469))

(assert (=> b!1475860 m!1361239))

(declare-fun m!1361471 () Bool)

(assert (=> b!1475860 m!1361471))

(assert (=> b!1475860 m!1361471))

(declare-fun m!1361473 () Bool)

(assert (=> b!1475860 m!1361473))

(assert (=> d!155737 m!1361239))

(declare-fun m!1361475 () Bool)

(assert (=> d!155737 m!1361475))

(assert (=> d!155737 m!1361265))

(assert (=> b!1475862 m!1361469))

(assert (=> b!1475868 m!1361469))

(assert (=> b!1475583 d!155737))

(declare-fun d!155739 () Bool)

(declare-fun lt!644638 () (_ BitVec 32))

(declare-fun lt!644637 () (_ BitVec 32))

(assert (=> d!155739 (= lt!644638 (bvmul (bvxor lt!644637 (bvlshr lt!644637 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155739 (= lt!644637 ((_ extract 31 0) (bvand (bvxor lt!644524 (bvlshr lt!644524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155739 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1002389 (let ((h!35809 ((_ extract 31 0) (bvand (bvxor lt!644524 (bvlshr lt!644524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132514 (bvmul (bvxor h!35809 (bvlshr h!35809 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132514 (bvlshr x!132514 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1002389 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1002389 #b00000000000000000000000000000000))))))

(assert (=> d!155739 (= (toIndex!0 lt!644524 mask!2687) (bvand (bvxor lt!644638 (bvlshr lt!644638 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1475583 d!155739))

(declare-fun bm!67773 () Bool)

(declare-fun call!67776 () Bool)

(assert (=> bm!67773 (= call!67776 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1475875 () Bool)

(declare-fun e!828019 () Bool)

(declare-fun e!828017 () Bool)

(assert (=> b!1475875 (= e!828019 e!828017)))

(declare-fun c!136261 () Bool)

(assert (=> b!1475875 (= c!136261 (validKeyInArray!0 (select (arr!47866 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1475876 () Bool)

(declare-fun e!828018 () Bool)

(assert (=> b!1475876 (= e!828017 e!828018)))

(declare-fun lt!644639 () (_ BitVec 64))

(assert (=> b!1475876 (= lt!644639 (select (arr!47866 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!644640 () Unit!49443)

(assert (=> b!1475876 (= lt!644640 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!644639 #b00000000000000000000000000000000))))

(assert (=> b!1475876 (arrayContainsKey!0 a!2862 lt!644639 #b00000000000000000000000000000000)))

(declare-fun lt!644641 () Unit!49443)

(assert (=> b!1475876 (= lt!644641 lt!644640)))

(declare-fun res!1002395 () Bool)

(assert (=> b!1475876 (= res!1002395 (= (seekEntryOrOpen!0 (select (arr!47866 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12131 #b00000000000000000000000000000000)))))

(assert (=> b!1475876 (=> (not res!1002395) (not e!828018))))

(declare-fun b!1475877 () Bool)

(assert (=> b!1475877 (= e!828017 call!67776)))

(declare-fun b!1475878 () Bool)

(assert (=> b!1475878 (= e!828018 call!67776)))

(declare-fun d!155741 () Bool)

(declare-fun res!1002396 () Bool)

(assert (=> d!155741 (=> res!1002396 e!828019)))

(assert (=> d!155741 (= res!1002396 (bvsge #b00000000000000000000000000000000 (size!48418 a!2862)))))

(assert (=> d!155741 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!828019)))

(assert (= (and d!155741 (not res!1002396)) b!1475875))

(assert (= (and b!1475875 c!136261) b!1475876))

(assert (= (and b!1475875 (not c!136261)) b!1475877))

(assert (= (and b!1475876 res!1002395) b!1475878))

(assert (= (or b!1475878 b!1475877) bm!67773))

(declare-fun m!1361477 () Bool)

(assert (=> bm!67773 m!1361477))

(declare-fun m!1361479 () Bool)

(assert (=> b!1475875 m!1361479))

(assert (=> b!1475875 m!1361479))

(declare-fun m!1361481 () Bool)

(assert (=> b!1475875 m!1361481))

(assert (=> b!1475876 m!1361479))

(declare-fun m!1361483 () Bool)

(assert (=> b!1475876 m!1361483))

(declare-fun m!1361485 () Bool)

(assert (=> b!1475876 m!1361485))

(assert (=> b!1475876 m!1361479))

(declare-fun m!1361487 () Bool)

(assert (=> b!1475876 m!1361487))

(assert (=> b!1475572 d!155741))

(declare-fun d!155743 () Bool)

(declare-fun res!1002407 () Bool)

(declare-fun e!828037 () Bool)

(assert (=> d!155743 (=> res!1002407 e!828037)))

(assert (=> d!155743 (= res!1002407 (bvsge #b00000000000000000000000000000000 (size!48418 a!2862)))))

(assert (=> d!155743 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34442) e!828037)))

(declare-fun b!1475901 () Bool)

(declare-fun e!828036 () Bool)

(declare-fun call!67782 () Bool)

(assert (=> b!1475901 (= e!828036 call!67782)))

(declare-fun b!1475902 () Bool)

(declare-fun e!828039 () Bool)

(assert (=> b!1475902 (= e!828037 e!828039)))

(declare-fun res!1002409 () Bool)

(assert (=> b!1475902 (=> (not res!1002409) (not e!828039))))

(declare-fun e!828038 () Bool)

(assert (=> b!1475902 (= res!1002409 (not e!828038))))

(declare-fun res!1002408 () Bool)

(assert (=> b!1475902 (=> (not res!1002408) (not e!828038))))

(assert (=> b!1475902 (= res!1002408 (validKeyInArray!0 (select (arr!47866 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1475903 () Bool)

(assert (=> b!1475903 (= e!828039 e!828036)))

(declare-fun c!136268 () Bool)

(assert (=> b!1475903 (= c!136268 (validKeyInArray!0 (select (arr!47866 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67779 () Bool)

(assert (=> bm!67779 (= call!67782 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136268 (Cons!34441 (select (arr!47866 a!2862) #b00000000000000000000000000000000) Nil!34442) Nil!34442)))))

(declare-fun b!1475904 () Bool)

(declare-fun contains!9875 (List!34445 (_ BitVec 64)) Bool)

(assert (=> b!1475904 (= e!828038 (contains!9875 Nil!34442 (select (arr!47866 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1475905 () Bool)

(assert (=> b!1475905 (= e!828036 call!67782)))

(assert (= (and d!155743 (not res!1002407)) b!1475902))

(assert (= (and b!1475902 res!1002408) b!1475904))

(assert (= (and b!1475902 res!1002409) b!1475903))

(assert (= (and b!1475903 c!136268) b!1475905))

(assert (= (and b!1475903 (not c!136268)) b!1475901))

(assert (= (or b!1475905 b!1475901) bm!67779))

(assert (=> b!1475902 m!1361479))

(assert (=> b!1475902 m!1361479))

(assert (=> b!1475902 m!1361481))

(assert (=> b!1475903 m!1361479))

(assert (=> b!1475903 m!1361479))

(assert (=> b!1475903 m!1361481))

(assert (=> bm!67779 m!1361479))

(declare-fun m!1361505 () Bool)

(assert (=> bm!67779 m!1361505))

(assert (=> b!1475904 m!1361479))

(assert (=> b!1475904 m!1361479))

(declare-fun m!1361507 () Bool)

(assert (=> b!1475904 m!1361507))

(assert (=> b!1475581 d!155743))

(check-sat (not b!1475808) (not b!1475902) (not b!1475759) (not b!1475779) (not b!1475809) (not bm!67773) (not b!1475765) (not d!155701) (not d!155705) (not d!155731) (not b!1475903) (not b!1475716) (not d!155737) (not bm!67772) (not b!1475833) (not b!1475904) (not d!155719) (not b!1475875) (not b!1475741) (not d!155725) (not d!155703) (not b!1475876) (not d!155729) (not d!155717) (not bm!67779) (not b!1475860) (not b!1475824))
(check-sat)
