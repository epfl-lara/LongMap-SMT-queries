; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124010 () Bool)

(assert start!124010)

(declare-fun b!1436227 () Bool)

(declare-fun res!969181 () Bool)

(declare-fun e!810515 () Bool)

(assert (=> b!1436227 (=> (not res!969181) (not e!810515))))

(declare-datatypes ((array!97673 0))(
  ( (array!97674 (arr!47133 (Array (_ BitVec 32) (_ BitVec 64))) (size!47683 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97673)

(declare-datatypes ((List!33634 0))(
  ( (Nil!33631) (Cons!33630 (h!34965 (_ BitVec 64)) (t!48328 List!33634)) )
))
(declare-fun arrayNoDuplicates!0 (array!97673 (_ BitVec 32) List!33634) Bool)

(assert (=> b!1436227 (= res!969181 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33631))))

(declare-fun res!969182 () Bool)

(assert (=> start!124010 (=> (not res!969182) (not e!810515))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124010 (= res!969182 (validMask!0 mask!2687))))

(assert (=> start!124010 e!810515))

(assert (=> start!124010 true))

(declare-fun array_inv!36161 (array!97673) Bool)

(assert (=> start!124010 (array_inv!36161 a!2862)))

(declare-fun b!1436228 () Bool)

(declare-fun res!969184 () Bool)

(assert (=> b!1436228 (=> (not res!969184) (not e!810515))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436228 (= res!969184 (validKeyInArray!0 (select (arr!47133 a!2862) j!93)))))

(declare-fun b!1436229 () Bool)

(declare-fun res!969179 () Bool)

(assert (=> b!1436229 (=> (not res!969179) (not e!810515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97673 (_ BitVec 32)) Bool)

(assert (=> b!1436229 (= res!969179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436230 () Bool)

(declare-fun res!969180 () Bool)

(assert (=> b!1436230 (=> (not res!969180) (not e!810515))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436230 (= res!969180 (and (= (size!47683 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47683 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47683 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436231 () Bool)

(declare-fun res!969183 () Bool)

(assert (=> b!1436231 (=> (not res!969183) (not e!810515))))

(assert (=> b!1436231 (= res!969183 (validKeyInArray!0 (select (arr!47133 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1436232 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436232 (= e!810515 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47683 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47683 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47683 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47133 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsgt mask!2687 #b00111111111111111111111111111111)))))

(assert (= (and start!124010 res!969182) b!1436230))

(assert (= (and b!1436230 res!969180) b!1436231))

(assert (= (and b!1436231 res!969183) b!1436228))

(assert (= (and b!1436228 res!969184) b!1436229))

(assert (= (and b!1436229 res!969179) b!1436227))

(assert (= (and b!1436227 res!969181) b!1436232))

(declare-fun m!1325573 () Bool)

(assert (=> b!1436227 m!1325573))

(declare-fun m!1325575 () Bool)

(assert (=> b!1436231 m!1325575))

(assert (=> b!1436231 m!1325575))

(declare-fun m!1325577 () Bool)

(assert (=> b!1436231 m!1325577))

(declare-fun m!1325579 () Bool)

(assert (=> b!1436229 m!1325579))

(declare-fun m!1325581 () Bool)

(assert (=> b!1436232 m!1325581))

(declare-fun m!1325583 () Bool)

(assert (=> b!1436232 m!1325583))

(declare-fun m!1325585 () Bool)

(assert (=> b!1436228 m!1325585))

(assert (=> b!1436228 m!1325585))

(declare-fun m!1325587 () Bool)

(assert (=> b!1436228 m!1325587))

(declare-fun m!1325589 () Bool)

(assert (=> start!124010 m!1325589))

(declare-fun m!1325591 () Bool)

(assert (=> start!124010 m!1325591))

(check-sat (not start!124010) (not b!1436229) (not b!1436228) (not b!1436227) (not b!1436231))
(check-sat)
(get-model)

(declare-fun d!154535 () Bool)

(declare-fun res!969211 () Bool)

(declare-fun e!810530 () Bool)

(assert (=> d!154535 (=> res!969211 e!810530)))

(assert (=> d!154535 (= res!969211 (bvsge #b00000000000000000000000000000000 (size!47683 a!2862)))))

(assert (=> d!154535 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33631) e!810530)))

(declare-fun b!1436261 () Bool)

(declare-fun e!810533 () Bool)

(declare-fun e!810532 () Bool)

(assert (=> b!1436261 (= e!810533 e!810532)))

(declare-fun c!133029 () Bool)

(assert (=> b!1436261 (= c!133029 (validKeyInArray!0 (select (arr!47133 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1436262 () Bool)

(declare-fun call!67591 () Bool)

(assert (=> b!1436262 (= e!810532 call!67591)))

(declare-fun b!1436263 () Bool)

(declare-fun e!810531 () Bool)

(declare-fun contains!9883 (List!33634 (_ BitVec 64)) Bool)

(assert (=> b!1436263 (= e!810531 (contains!9883 Nil!33631 (select (arr!47133 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1436264 () Bool)

(assert (=> b!1436264 (= e!810530 e!810533)))

(declare-fun res!969209 () Bool)

(assert (=> b!1436264 (=> (not res!969209) (not e!810533))))

(assert (=> b!1436264 (= res!969209 (not e!810531))))

(declare-fun res!969210 () Bool)

(assert (=> b!1436264 (=> (not res!969210) (not e!810531))))

(assert (=> b!1436264 (= res!969210 (validKeyInArray!0 (select (arr!47133 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1436265 () Bool)

(assert (=> b!1436265 (= e!810532 call!67591)))

(declare-fun bm!67588 () Bool)

(assert (=> bm!67588 (= call!67591 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133029 (Cons!33630 (select (arr!47133 a!2862) #b00000000000000000000000000000000) Nil!33631) Nil!33631)))))

(assert (= (and d!154535 (not res!969211)) b!1436264))

(assert (= (and b!1436264 res!969210) b!1436263))

(assert (= (and b!1436264 res!969209) b!1436261))

(assert (= (and b!1436261 c!133029) b!1436262))

(assert (= (and b!1436261 (not c!133029)) b!1436265))

(assert (= (or b!1436262 b!1436265) bm!67588))

(declare-fun m!1325613 () Bool)

(assert (=> b!1436261 m!1325613))

(assert (=> b!1436261 m!1325613))

(declare-fun m!1325615 () Bool)

(assert (=> b!1436261 m!1325615))

(assert (=> b!1436263 m!1325613))

(assert (=> b!1436263 m!1325613))

(declare-fun m!1325617 () Bool)

(assert (=> b!1436263 m!1325617))

(assert (=> b!1436264 m!1325613))

(assert (=> b!1436264 m!1325613))

(assert (=> b!1436264 m!1325615))

(assert (=> bm!67588 m!1325613))

(declare-fun m!1325619 () Bool)

(assert (=> bm!67588 m!1325619))

(assert (=> b!1436227 d!154535))

(declare-fun d!154537 () Bool)

(assert (=> d!154537 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124010 d!154537))

(declare-fun d!154539 () Bool)

(assert (=> d!154539 (= (array_inv!36161 a!2862) (bvsge (size!47683 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124010 d!154539))

(declare-fun d!154541 () Bool)

(assert (=> d!154541 (= (validKeyInArray!0 (select (arr!47133 a!2862) i!1006)) (and (not (= (select (arr!47133 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47133 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1436231 d!154541))

(declare-fun b!1436284 () Bool)

(declare-fun e!810548 () Bool)

(declare-fun call!67596 () Bool)

(assert (=> b!1436284 (= e!810548 call!67596)))

(declare-fun b!1436285 () Bool)

(declare-fun e!810549 () Bool)

(assert (=> b!1436285 (= e!810549 call!67596)))

(declare-fun bm!67593 () Bool)

(assert (=> bm!67593 (= call!67596 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1436286 () Bool)

(assert (=> b!1436286 (= e!810549 e!810548)))

(declare-fun lt!632092 () (_ BitVec 64))

(assert (=> b!1436286 (= lt!632092 (select (arr!47133 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48548 0))(
  ( (Unit!48549) )
))
(declare-fun lt!632093 () Unit!48548)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97673 (_ BitVec 64) (_ BitVec 32)) Unit!48548)

(assert (=> b!1436286 (= lt!632093 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632092 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1436286 (arrayContainsKey!0 a!2862 lt!632092 #b00000000000000000000000000000000)))

(declare-fun lt!632094 () Unit!48548)

(assert (=> b!1436286 (= lt!632094 lt!632093)))

(declare-fun res!969223 () Bool)

(declare-datatypes ((SeekEntryResult!11401 0))(
  ( (MissingZero!11401 (index!47996 (_ BitVec 32))) (Found!11401 (index!47997 (_ BitVec 32))) (Intermediate!11401 (undefined!12213 Bool) (index!47998 (_ BitVec 32)) (x!129687 (_ BitVec 32))) (Undefined!11401) (MissingVacant!11401 (index!47999 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97673 (_ BitVec 32)) SeekEntryResult!11401)

(assert (=> b!1436286 (= res!969223 (= (seekEntryOrOpen!0 (select (arr!47133 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11401 #b00000000000000000000000000000000)))))

(assert (=> b!1436286 (=> (not res!969223) (not e!810548))))

(declare-fun b!1436287 () Bool)

(declare-fun e!810550 () Bool)

(assert (=> b!1436287 (= e!810550 e!810549)))

(declare-fun c!133034 () Bool)

(assert (=> b!1436287 (= c!133034 (validKeyInArray!0 (select (arr!47133 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!154543 () Bool)

(declare-fun res!969222 () Bool)

(assert (=> d!154543 (=> res!969222 e!810550)))

(assert (=> d!154543 (= res!969222 (bvsge #b00000000000000000000000000000000 (size!47683 a!2862)))))

(assert (=> d!154543 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!810550)))

(assert (= (and d!154543 (not res!969222)) b!1436287))

(assert (= (and b!1436287 c!133034) b!1436286))

(assert (= (and b!1436287 (not c!133034)) b!1436285))

(assert (= (and b!1436286 res!969223) b!1436284))

(assert (= (or b!1436284 b!1436285) bm!67593))

(declare-fun m!1325621 () Bool)

(assert (=> bm!67593 m!1325621))

(assert (=> b!1436286 m!1325613))

(declare-fun m!1325623 () Bool)

(assert (=> b!1436286 m!1325623))

(declare-fun m!1325625 () Bool)

(assert (=> b!1436286 m!1325625))

(assert (=> b!1436286 m!1325613))

(declare-fun m!1325627 () Bool)

(assert (=> b!1436286 m!1325627))

(assert (=> b!1436287 m!1325613))

(assert (=> b!1436287 m!1325613))

(assert (=> b!1436287 m!1325615))

(assert (=> b!1436229 d!154543))

(declare-fun d!154547 () Bool)

(assert (=> d!154547 (= (validKeyInArray!0 (select (arr!47133 a!2862) j!93)) (and (not (= (select (arr!47133 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47133 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1436228 d!154547))

(check-sat (not b!1436286) (not bm!67593) (not b!1436287) (not b!1436264) (not b!1436261) (not b!1436263) (not bm!67588))
(check-sat)
