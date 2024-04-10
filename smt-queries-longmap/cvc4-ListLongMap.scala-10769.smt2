; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125996 () Bool)

(assert start!125996)

(declare-fun e!827719 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!644580 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1475315 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99216 0))(
  ( (array!99217 (arr!47890 (Array (_ BitVec 32) (_ BitVec 64))) (size!48440 (_ BitVec 32))) )
))
(declare-fun lt!644579 () array!99216)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12130 0))(
  ( (MissingZero!12130 (index!50912 (_ BitVec 32))) (Found!12130 (index!50913 (_ BitVec 32))) (Intermediate!12130 (undefined!12942 Bool) (index!50914 (_ BitVec 32)) (x!132495 (_ BitVec 32))) (Undefined!12130) (MissingVacant!12130 (index!50915 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99216 (_ BitVec 32)) SeekEntryResult!12130)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99216 (_ BitVec 32)) SeekEntryResult!12130)

(assert (=> b!1475315 (= e!827719 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644580 lt!644579 mask!2687) (seekEntryOrOpen!0 lt!644580 lt!644579 mask!2687)))))

(declare-fun b!1475316 () Bool)

(declare-fun res!1002179 () Bool)

(declare-fun e!827713 () Bool)

(assert (=> b!1475316 (=> (not res!1002179) (not e!827713))))

(declare-fun a!2862 () array!99216)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1475316 (= res!1002179 (validKeyInArray!0 (select (arr!47890 a!2862) i!1006)))))

(declare-fun b!1475317 () Bool)

(declare-fun e!827714 () Bool)

(declare-fun e!827720 () Bool)

(assert (=> b!1475317 (= e!827714 e!827720)))

(declare-fun res!1002172 () Bool)

(assert (=> b!1475317 (=> (not res!1002172) (not e!827720))))

(declare-fun lt!644576 () SeekEntryResult!12130)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99216 (_ BitVec 32)) SeekEntryResult!12130)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475317 (= res!1002172 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47890 a!2862) j!93) mask!2687) (select (arr!47890 a!2862) j!93) a!2862 mask!2687) lt!644576))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1475317 (= lt!644576 (Intermediate!12130 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!644575 () SeekEntryResult!12130)

(declare-fun b!1475318 () Bool)

(assert (=> b!1475318 (= e!827719 (= lt!644575 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644580 lt!644579 mask!2687)))))

(declare-fun b!1475319 () Bool)

(declare-fun res!1002181 () Bool)

(declare-fun e!827715 () Bool)

(assert (=> b!1475319 (=> (not res!1002181) (not e!827715))))

(assert (=> b!1475319 (= res!1002181 e!827719)))

(declare-fun c!136089 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1475319 (= c!136089 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1002182 () Bool)

(assert (=> start!125996 (=> (not res!1002182) (not e!827713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125996 (= res!1002182 (validMask!0 mask!2687))))

(assert (=> start!125996 e!827713))

(assert (=> start!125996 true))

(declare-fun array_inv!36918 (array!99216) Bool)

(assert (=> start!125996 (array_inv!36918 a!2862)))

(declare-fun b!1475320 () Bool)

(declare-fun res!1002170 () Bool)

(assert (=> b!1475320 (=> (not res!1002170) (not e!827713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99216 (_ BitVec 32)) Bool)

(assert (=> b!1475320 (= res!1002170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1475321 () Bool)

(assert (=> b!1475321 (= e!827715 (not (or (and (= (select (arr!47890 a!2862) index!646) (select (store (arr!47890 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47890 a!2862) index!646) (select (arr!47890 a!2862) j!93))) (not (= (select (arr!47890 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!646 intermediateBeforeIndex!19))))))

(declare-fun e!827718 () Bool)

(assert (=> b!1475321 e!827718))

(declare-fun res!1002171 () Bool)

(assert (=> b!1475321 (=> (not res!1002171) (not e!827718))))

(declare-fun lt!644578 () SeekEntryResult!12130)

(assert (=> b!1475321 (= res!1002171 (and (= lt!644578 (Found!12130 j!93)) (or (= (select (arr!47890 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47890 a!2862) intermediateBeforeIndex!19) (select (arr!47890 a!2862) j!93)))))))

(assert (=> b!1475321 (= lt!644578 (seekEntryOrOpen!0 (select (arr!47890 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1475321 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49600 0))(
  ( (Unit!49601) )
))
(declare-fun lt!644577 () Unit!49600)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99216 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49600)

(assert (=> b!1475321 (= lt!644577 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1475322 () Bool)

(declare-fun res!1002177 () Bool)

(assert (=> b!1475322 (=> (not res!1002177) (not e!827713))))

(assert (=> b!1475322 (= res!1002177 (validKeyInArray!0 (select (arr!47890 a!2862) j!93)))))

(declare-fun b!1475323 () Bool)

(assert (=> b!1475323 (= e!827713 e!827714)))

(declare-fun res!1002184 () Bool)

(assert (=> b!1475323 (=> (not res!1002184) (not e!827714))))

(assert (=> b!1475323 (= res!1002184 (= (select (store (arr!47890 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475323 (= lt!644579 (array!99217 (store (arr!47890 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48440 a!2862)))))

(declare-fun b!1475324 () Bool)

(declare-fun res!1002175 () Bool)

(assert (=> b!1475324 (=> (not res!1002175) (not e!827713))))

(declare-datatypes ((List!34391 0))(
  ( (Nil!34388) (Cons!34387 (h!35749 (_ BitVec 64)) (t!49085 List!34391)) )
))
(declare-fun arrayNoDuplicates!0 (array!99216 (_ BitVec 32) List!34391) Bool)

(assert (=> b!1475324 (= res!1002175 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34388))))

(declare-fun b!1475325 () Bool)

(declare-fun res!1002173 () Bool)

(assert (=> b!1475325 (=> (not res!1002173) (not e!827713))))

(assert (=> b!1475325 (= res!1002173 (and (= (size!48440 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48440 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48440 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1475326 () Bool)

(declare-fun e!827716 () Bool)

(assert (=> b!1475326 (= e!827718 e!827716)))

(declare-fun res!1002183 () Bool)

(assert (=> b!1475326 (=> res!1002183 e!827716)))

(assert (=> b!1475326 (= res!1002183 (or (and (= (select (arr!47890 a!2862) index!646) (select (store (arr!47890 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47890 a!2862) index!646) (select (arr!47890 a!2862) j!93))) (not (= (select (arr!47890 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1475327 () Bool)

(declare-fun res!1002180 () Bool)

(assert (=> b!1475327 (=> (not res!1002180) (not e!827713))))

(assert (=> b!1475327 (= res!1002180 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48440 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48440 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48440 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1475328 () Bool)

(assert (=> b!1475328 (= e!827716 (= lt!644578 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47890 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1475329 () Bool)

(assert (=> b!1475329 (= e!827720 e!827715)))

(declare-fun res!1002178 () Bool)

(assert (=> b!1475329 (=> (not res!1002178) (not e!827715))))

(assert (=> b!1475329 (= res!1002178 (= lt!644575 (Intermediate!12130 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1475329 (= lt!644575 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644580 mask!2687) lt!644580 lt!644579 mask!2687))))

(assert (=> b!1475329 (= lt!644580 (select (store (arr!47890 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1475330 () Bool)

(declare-fun res!1002174 () Bool)

(assert (=> b!1475330 (=> (not res!1002174) (not e!827715))))

(assert (=> b!1475330 (= res!1002174 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1475331 () Bool)

(declare-fun res!1002176 () Bool)

(assert (=> b!1475331 (=> (not res!1002176) (not e!827720))))

(assert (=> b!1475331 (= res!1002176 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47890 a!2862) j!93) a!2862 mask!2687) lt!644576))))

(assert (= (and start!125996 res!1002182) b!1475325))

(assert (= (and b!1475325 res!1002173) b!1475316))

(assert (= (and b!1475316 res!1002179) b!1475322))

(assert (= (and b!1475322 res!1002177) b!1475320))

(assert (= (and b!1475320 res!1002170) b!1475324))

(assert (= (and b!1475324 res!1002175) b!1475327))

(assert (= (and b!1475327 res!1002180) b!1475323))

(assert (= (and b!1475323 res!1002184) b!1475317))

(assert (= (and b!1475317 res!1002172) b!1475331))

(assert (= (and b!1475331 res!1002176) b!1475329))

(assert (= (and b!1475329 res!1002178) b!1475319))

(assert (= (and b!1475319 c!136089) b!1475318))

(assert (= (and b!1475319 (not c!136089)) b!1475315))

(assert (= (and b!1475319 res!1002181) b!1475330))

(assert (= (and b!1475330 res!1002174) b!1475321))

(assert (= (and b!1475321 res!1002171) b!1475326))

(assert (= (and b!1475326 (not res!1002183)) b!1475328))

(declare-fun m!1361607 () Bool)

(assert (=> b!1475329 m!1361607))

(assert (=> b!1475329 m!1361607))

(declare-fun m!1361609 () Bool)

(assert (=> b!1475329 m!1361609))

(declare-fun m!1361611 () Bool)

(assert (=> b!1475329 m!1361611))

(declare-fun m!1361613 () Bool)

(assert (=> b!1475329 m!1361613))

(declare-fun m!1361615 () Bool)

(assert (=> b!1475321 m!1361615))

(assert (=> b!1475321 m!1361611))

(declare-fun m!1361617 () Bool)

(assert (=> b!1475321 m!1361617))

(declare-fun m!1361619 () Bool)

(assert (=> b!1475321 m!1361619))

(declare-fun m!1361621 () Bool)

(assert (=> b!1475321 m!1361621))

(declare-fun m!1361623 () Bool)

(assert (=> b!1475321 m!1361623))

(declare-fun m!1361625 () Bool)

(assert (=> b!1475321 m!1361625))

(declare-fun m!1361627 () Bool)

(assert (=> b!1475321 m!1361627))

(assert (=> b!1475321 m!1361623))

(assert (=> b!1475326 m!1361621))

(assert (=> b!1475326 m!1361611))

(assert (=> b!1475326 m!1361619))

(assert (=> b!1475326 m!1361623))

(declare-fun m!1361629 () Bool)

(assert (=> start!125996 m!1361629))

(declare-fun m!1361631 () Bool)

(assert (=> start!125996 m!1361631))

(assert (=> b!1475317 m!1361623))

(assert (=> b!1475317 m!1361623))

(declare-fun m!1361633 () Bool)

(assert (=> b!1475317 m!1361633))

(assert (=> b!1475317 m!1361633))

(assert (=> b!1475317 m!1361623))

(declare-fun m!1361635 () Bool)

(assert (=> b!1475317 m!1361635))

(declare-fun m!1361637 () Bool)

(assert (=> b!1475316 m!1361637))

(assert (=> b!1475316 m!1361637))

(declare-fun m!1361639 () Bool)

(assert (=> b!1475316 m!1361639))

(declare-fun m!1361641 () Bool)

(assert (=> b!1475318 m!1361641))

(declare-fun m!1361643 () Bool)

(assert (=> b!1475320 m!1361643))

(assert (=> b!1475322 m!1361623))

(assert (=> b!1475322 m!1361623))

(declare-fun m!1361645 () Bool)

(assert (=> b!1475322 m!1361645))

(assert (=> b!1475328 m!1361623))

(assert (=> b!1475328 m!1361623))

(declare-fun m!1361647 () Bool)

(assert (=> b!1475328 m!1361647))

(declare-fun m!1361649 () Bool)

(assert (=> b!1475315 m!1361649))

(declare-fun m!1361651 () Bool)

(assert (=> b!1475315 m!1361651))

(assert (=> b!1475331 m!1361623))

(assert (=> b!1475331 m!1361623))

(declare-fun m!1361653 () Bool)

(assert (=> b!1475331 m!1361653))

(assert (=> b!1475323 m!1361611))

(declare-fun m!1361655 () Bool)

(assert (=> b!1475323 m!1361655))

(declare-fun m!1361657 () Bool)

(assert (=> b!1475324 m!1361657))

(push 1)

(assert (not b!1475324))

(assert (not b!1475316))

(assert (not b!1475320))

(assert (not b!1475315))

(assert (not b!1475328))

(assert (not b!1475317))

(assert (not start!125996))

(assert (not b!1475318))

(assert (not b!1475321))

(assert (not b!1475331))

(assert (not b!1475322))

(assert (not b!1475329))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!155785 () Bool)

(assert (=> d!155785 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125996 d!155785))

(declare-fun d!155795 () Bool)

(assert (=> d!155795 (= (array_inv!36918 a!2862) (bvsge (size!48440 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125996 d!155795))

(declare-fun b!1475470 () Bool)

(declare-fun e!827798 () SeekEntryResult!12130)

(assert (=> b!1475470 (= e!827798 (Found!12130 index!646))))

(declare-fun e!827797 () SeekEntryResult!12130)

(declare-fun b!1475471 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475471 (= e!827797 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) index!646 (select (arr!47890 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!155797 () Bool)

(declare-fun lt!644644 () SeekEntryResult!12130)

(assert (=> d!155797 (and (or (is-Undefined!12130 lt!644644) (not (is-Found!12130 lt!644644)) (and (bvsge (index!50913 lt!644644) #b00000000000000000000000000000000) (bvslt (index!50913 lt!644644) (size!48440 a!2862)))) (or (is-Undefined!12130 lt!644644) (is-Found!12130 lt!644644) (not (is-MissingVacant!12130 lt!644644)) (not (= (index!50915 lt!644644) index!646)) (and (bvsge (index!50915 lt!644644) #b00000000000000000000000000000000) (bvslt (index!50915 lt!644644) (size!48440 a!2862)))) (or (is-Undefined!12130 lt!644644) (ite (is-Found!12130 lt!644644) (= (select (arr!47890 a!2862) (index!50913 lt!644644)) (select (arr!47890 a!2862) j!93)) (and (is-MissingVacant!12130 lt!644644) (= (index!50915 lt!644644) index!646) (= (select (arr!47890 a!2862) (index!50915 lt!644644)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!827799 () SeekEntryResult!12130)

(assert (=> d!155797 (= lt!644644 e!827799)))

(declare-fun c!136148 () Bool)

(assert (=> d!155797 (= c!136148 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644645 () (_ BitVec 64))

(assert (=> d!155797 (= lt!644645 (select (arr!47890 a!2862) index!646))))

(assert (=> d!155797 (validMask!0 mask!2687)))

(assert (=> d!155797 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47890 a!2862) j!93) a!2862 mask!2687) lt!644644)))

(declare-fun b!1475472 () Bool)

(assert (=> b!1475472 (= e!827799 e!827798)))

(declare-fun c!136146 () Bool)

(assert (=> b!1475472 (= c!136146 (= lt!644645 (select (arr!47890 a!2862) j!93)))))

(declare-fun b!1475473 () Bool)

(declare-fun c!136147 () Bool)

(assert (=> b!1475473 (= c!136147 (= lt!644645 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475473 (= e!827798 e!827797)))

(declare-fun b!1475474 () Bool)

(assert (=> b!1475474 (= e!827799 Undefined!12130)))

(declare-fun b!1475475 () Bool)

(assert (=> b!1475475 (= e!827797 (MissingVacant!12130 index!646))))

(assert (= (and d!155797 c!136148) b!1475474))

(assert (= (and d!155797 (not c!136148)) b!1475472))

(assert (= (and b!1475472 c!136146) b!1475470))

(assert (= (and b!1475472 (not c!136146)) b!1475473))

(assert (= (and b!1475473 c!136147) b!1475475))

(assert (= (and b!1475473 (not c!136147)) b!1475471))

(declare-fun m!1361739 () Bool)

(assert (=> b!1475471 m!1361739))

(assert (=> b!1475471 m!1361739))

(assert (=> b!1475471 m!1361623))

(declare-fun m!1361741 () Bool)

(assert (=> b!1475471 m!1361741))

(declare-fun m!1361743 () Bool)

(assert (=> d!155797 m!1361743))

(declare-fun m!1361745 () Bool)

(assert (=> d!155797 m!1361745))

(assert (=> d!155797 m!1361621))

(assert (=> d!155797 m!1361629))

(assert (=> b!1475328 d!155797))

(declare-fun b!1475540 () Bool)

(declare-fun e!827839 () SeekEntryResult!12130)

(assert (=> b!1475540 (= e!827839 (Intermediate!12130 false (toIndex!0 lt!644580 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1475541 () Bool)

(declare-fun e!827843 () Bool)

(declare-fun lt!644656 () SeekEntryResult!12130)

(assert (=> b!1475541 (= e!827843 (bvsge (x!132495 lt!644656) #b01111111111111111111111111111110))))

(declare-fun b!1475542 () Bool)

(assert (=> b!1475542 (and (bvsge (index!50914 lt!644656) #b00000000000000000000000000000000) (bvslt (index!50914 lt!644656) (size!48440 lt!644579)))))

(declare-fun e!827842 () Bool)

(assert (=> b!1475542 (= e!827842 (= (select (arr!47890 lt!644579) (index!50914 lt!644656)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1475544 () Bool)

(declare-fun e!827840 () SeekEntryResult!12130)

(assert (=> b!1475544 (= e!827840 e!827839)))

(declare-fun c!136170 () Bool)

(declare-fun lt!644657 () (_ BitVec 64))

(assert (=> b!1475544 (= c!136170 (or (= lt!644657 lt!644580) (= (bvadd lt!644657 lt!644657) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1475545 () Bool)

(assert (=> b!1475545 (and (bvsge (index!50914 lt!644656) #b00000000000000000000000000000000) (bvslt (index!50914 lt!644656) (size!48440 lt!644579)))))

(declare-fun res!1002237 () Bool)

(assert (=> b!1475545 (= res!1002237 (= (select (arr!47890 lt!644579) (index!50914 lt!644656)) lt!644580))))

(assert (=> b!1475545 (=> res!1002237 e!827842)))

(declare-fun e!827841 () Bool)

(assert (=> b!1475545 (= e!827841 e!827842)))

(declare-fun b!1475546 () Bool)

(assert (=> b!1475546 (= e!827843 e!827841)))

(declare-fun res!1002238 () Bool)

(assert (=> b!1475546 (= res!1002238 (and (is-Intermediate!12130 lt!644656) (not (undefined!12942 lt!644656)) (bvslt (x!132495 lt!644656) #b01111111111111111111111111111110) (bvsge (x!132495 lt!644656) #b00000000000000000000000000000000) (bvsge (x!132495 lt!644656) #b00000000000000000000000000000000)))))

(assert (=> b!1475546 (=> (not res!1002238) (not e!827841))))

(declare-fun d!155821 () Bool)

(assert (=> d!155821 e!827843))

(declare-fun c!136171 () Bool)

(assert (=> d!155821 (= c!136171 (and (is-Intermediate!12130 lt!644656) (undefined!12942 lt!644656)))))

(assert (=> d!155821 (= lt!644656 e!827840)))

(declare-fun c!136169 () Bool)

(assert (=> d!155821 (= c!136169 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155821 (= lt!644657 (select (arr!47890 lt!644579) (toIndex!0 lt!644580 mask!2687)))))

(assert (=> d!155821 (validMask!0 mask!2687)))

(assert (=> d!155821 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644580 mask!2687) lt!644580 lt!644579 mask!2687) lt!644656)))

(declare-fun b!1475543 () Bool)

(assert (=> b!1475543 (= e!827839 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!644580 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!644580 lt!644579 mask!2687))))

(declare-fun b!1475547 () Bool)

(assert (=> b!1475547 (and (bvsge (index!50914 lt!644656) #b00000000000000000000000000000000) (bvslt (index!50914 lt!644656) (size!48440 lt!644579)))))

(declare-fun res!1002236 () Bool)

(assert (=> b!1475547 (= res!1002236 (= (select (arr!47890 lt!644579) (index!50914 lt!644656)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475547 (=> res!1002236 e!827842)))

(declare-fun b!1475548 () Bool)

(assert (=> b!1475548 (= e!827840 (Intermediate!12130 true (toIndex!0 lt!644580 mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!155821 c!136169) b!1475548))

(assert (= (and d!155821 (not c!136169)) b!1475544))

(assert (= (and b!1475544 c!136170) b!1475540))

(assert (= (and b!1475544 (not c!136170)) b!1475543))

(assert (= (and d!155821 c!136171) b!1475541))

(assert (= (and d!155821 (not c!136171)) b!1475546))

(assert (= (and b!1475546 res!1002238) b!1475545))

(assert (= (and b!1475545 (not res!1002237)) b!1475547))

(assert (= (and b!1475547 (not res!1002236)) b!1475542))

(assert (=> b!1475543 m!1361607))

(declare-fun m!1361757 () Bool)

(assert (=> b!1475543 m!1361757))

(assert (=> b!1475543 m!1361757))

(declare-fun m!1361759 () Bool)

(assert (=> b!1475543 m!1361759))

(assert (=> d!155821 m!1361607))

(declare-fun m!1361761 () Bool)

(assert (=> d!155821 m!1361761))

(assert (=> d!155821 m!1361629))

(declare-fun m!1361763 () Bool)

(assert (=> b!1475545 m!1361763))

(assert (=> b!1475547 m!1361763))

(assert (=> b!1475542 m!1361763))

(assert (=> b!1475329 d!155821))

(declare-fun d!155827 () Bool)

(declare-fun lt!644665 () (_ BitVec 32))

(declare-fun lt!644664 () (_ BitVec 32))

(assert (=> d!155827 (= lt!644665 (bvmul (bvxor lt!644664 (bvlshr lt!644664 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155827 (= lt!644664 ((_ extract 31 0) (bvand (bvxor lt!644580 (bvlshr lt!644580 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155827 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1002239 (let ((h!35751 ((_ extract 31 0) (bvand (bvxor lt!644580 (bvlshr lt!644580 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132503 (bvmul (bvxor h!35751 (bvlshr h!35751 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132503 (bvlshr x!132503 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1002239 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1002239 #b00000000000000000000000000000000))))))

(assert (=> d!155827 (= (toIndex!0 lt!644580 mask!2687) (bvand (bvxor lt!644665 (bvlshr lt!644665 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1475329 d!155827))

(declare-fun b!1475555 () Bool)

(declare-fun e!827847 () SeekEntryResult!12130)

(assert (=> b!1475555 (= e!827847 (Intermediate!12130 false index!646 x!665))))

(declare-fun b!1475556 () Bool)

(declare-fun e!827851 () Bool)

(declare-fun lt!644666 () SeekEntryResult!12130)

(assert (=> b!1475556 (= e!827851 (bvsge (x!132495 lt!644666) #b01111111111111111111111111111110))))

(declare-fun b!1475557 () Bool)

(assert (=> b!1475557 (and (bvsge (index!50914 lt!644666) #b00000000000000000000000000000000) (bvslt (index!50914 lt!644666) (size!48440 lt!644579)))))

(declare-fun e!827850 () Bool)

(assert (=> b!1475557 (= e!827850 (= (select (arr!47890 lt!644579) (index!50914 lt!644666)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1475559 () Bool)

(declare-fun e!827848 () SeekEntryResult!12130)

(assert (=> b!1475559 (= e!827848 e!827847)))

(declare-fun c!136176 () Bool)

(declare-fun lt!644667 () (_ BitVec 64))

(assert (=> b!1475559 (= c!136176 (or (= lt!644667 lt!644580) (= (bvadd lt!644667 lt!644667) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1475560 () Bool)

(assert (=> b!1475560 (and (bvsge (index!50914 lt!644666) #b00000000000000000000000000000000) (bvslt (index!50914 lt!644666) (size!48440 lt!644579)))))

(declare-fun res!1002241 () Bool)

(assert (=> b!1475560 (= res!1002241 (= (select (arr!47890 lt!644579) (index!50914 lt!644666)) lt!644580))))

(assert (=> b!1475560 (=> res!1002241 e!827850)))

(declare-fun e!827849 () Bool)

(assert (=> b!1475560 (= e!827849 e!827850)))

(declare-fun b!1475561 () Bool)

(assert (=> b!1475561 (= e!827851 e!827849)))

(declare-fun res!1002242 () Bool)

(assert (=> b!1475561 (= res!1002242 (and (is-Intermediate!12130 lt!644666) (not (undefined!12942 lt!644666)) (bvslt (x!132495 lt!644666) #b01111111111111111111111111111110) (bvsge (x!132495 lt!644666) #b00000000000000000000000000000000) (bvsge (x!132495 lt!644666) x!665)))))

(assert (=> b!1475561 (=> (not res!1002242) (not e!827849))))

(declare-fun d!155831 () Bool)

(assert (=> d!155831 e!827851))

(declare-fun c!136177 () Bool)

(assert (=> d!155831 (= c!136177 (and (is-Intermediate!12130 lt!644666) (undefined!12942 lt!644666)))))

(assert (=> d!155831 (= lt!644666 e!827848)))

(declare-fun c!136175 () Bool)

(assert (=> d!155831 (= c!136175 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155831 (= lt!644667 (select (arr!47890 lt!644579) index!646))))

(assert (=> d!155831 (validMask!0 mask!2687)))

(assert (=> d!155831 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644580 lt!644579 mask!2687) lt!644666)))

(declare-fun b!1475558 () Bool)

(assert (=> b!1475558 (= e!827847 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!644580 lt!644579 mask!2687))))

(declare-fun b!1475562 () Bool)

(assert (=> b!1475562 (and (bvsge (index!50914 lt!644666) #b00000000000000000000000000000000) (bvslt (index!50914 lt!644666) (size!48440 lt!644579)))))

(declare-fun res!1002240 () Bool)

(assert (=> b!1475562 (= res!1002240 (= (select (arr!47890 lt!644579) (index!50914 lt!644666)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475562 (=> res!1002240 e!827850)))

(declare-fun b!1475563 () Bool)

(assert (=> b!1475563 (= e!827848 (Intermediate!12130 true index!646 x!665))))

(assert (= (and d!155831 c!136175) b!1475563))

(assert (= (and d!155831 (not c!136175)) b!1475559))

(assert (= (and b!1475559 c!136176) b!1475555))

(assert (= (and b!1475559 (not c!136176)) b!1475558))

(assert (= (and d!155831 c!136177) b!1475556))

(assert (= (and d!155831 (not c!136177)) b!1475561))

(assert (= (and b!1475561 res!1002242) b!1475560))

(assert (= (and b!1475560 (not res!1002241)) b!1475562))

(assert (= (and b!1475562 (not res!1002240)) b!1475557))

(assert (=> b!1475558 m!1361739))

(assert (=> b!1475558 m!1361739))

(declare-fun m!1361773 () Bool)

(assert (=> b!1475558 m!1361773))

(declare-fun m!1361775 () Bool)

(assert (=> d!155831 m!1361775))

(assert (=> d!155831 m!1361629))

(declare-fun m!1361777 () Bool)

(assert (=> b!1475560 m!1361777))

(assert (=> b!1475562 m!1361777))

(assert (=> b!1475557 m!1361777))

(assert (=> b!1475318 d!155831))

(declare-fun d!155833 () Bool)

(assert (=> d!155833 (= (validKeyInArray!0 (select (arr!47890 a!2862) i!1006)) (and (not (= (select (arr!47890 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47890 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1475316 d!155833))

(declare-fun e!827852 () SeekEntryResult!12130)

(declare-fun b!1475564 () Bool)

(assert (=> b!1475564 (= e!827852 (Intermediate!12130 false (toIndex!0 (select (arr!47890 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1475565 () Bool)

(declare-fun e!827856 () Bool)

(declare-fun lt!644668 () SeekEntryResult!12130)

(assert (=> b!1475565 (= e!827856 (bvsge (x!132495 lt!644668) #b01111111111111111111111111111110))))

(declare-fun b!1475566 () Bool)

(assert (=> b!1475566 (and (bvsge (index!50914 lt!644668) #b00000000000000000000000000000000) (bvslt (index!50914 lt!644668) (size!48440 a!2862)))))

(declare-fun e!827855 () Bool)

(assert (=> b!1475566 (= e!827855 (= (select (arr!47890 a!2862) (index!50914 lt!644668)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1475568 () Bool)

(declare-fun e!827853 () SeekEntryResult!12130)

(assert (=> b!1475568 (= e!827853 e!827852)))

(declare-fun lt!644669 () (_ BitVec 64))

(declare-fun c!136179 () Bool)

(assert (=> b!1475568 (= c!136179 (or (= lt!644669 (select (arr!47890 a!2862) j!93)) (= (bvadd lt!644669 lt!644669) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1475569 () Bool)

(assert (=> b!1475569 (and (bvsge (index!50914 lt!644668) #b00000000000000000000000000000000) (bvslt (index!50914 lt!644668) (size!48440 a!2862)))))

(declare-fun res!1002244 () Bool)

(assert (=> b!1475569 (= res!1002244 (= (select (arr!47890 a!2862) (index!50914 lt!644668)) (select (arr!47890 a!2862) j!93)))))

(assert (=> b!1475569 (=> res!1002244 e!827855)))

(declare-fun e!827854 () Bool)

(assert (=> b!1475569 (= e!827854 e!827855)))

(declare-fun b!1475570 () Bool)

(assert (=> b!1475570 (= e!827856 e!827854)))

(declare-fun res!1002245 () Bool)

(assert (=> b!1475570 (= res!1002245 (and (is-Intermediate!12130 lt!644668) (not (undefined!12942 lt!644668)) (bvslt (x!132495 lt!644668) #b01111111111111111111111111111110) (bvsge (x!132495 lt!644668) #b00000000000000000000000000000000) (bvsge (x!132495 lt!644668) #b00000000000000000000000000000000)))))

(assert (=> b!1475570 (=> (not res!1002245) (not e!827854))))

(declare-fun d!155835 () Bool)

(assert (=> d!155835 e!827856))

(declare-fun c!136180 () Bool)

(assert (=> d!155835 (= c!136180 (and (is-Intermediate!12130 lt!644668) (undefined!12942 lt!644668)))))

(assert (=> d!155835 (= lt!644668 e!827853)))

(declare-fun c!136178 () Bool)

(assert (=> d!155835 (= c!136178 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155835 (= lt!644669 (select (arr!47890 a!2862) (toIndex!0 (select (arr!47890 a!2862) j!93) mask!2687)))))

(assert (=> d!155835 (validMask!0 mask!2687)))

(assert (=> d!155835 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47890 a!2862) j!93) mask!2687) (select (arr!47890 a!2862) j!93) a!2862 mask!2687) lt!644668)))

(declare-fun b!1475567 () Bool)

(assert (=> b!1475567 (= e!827852 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47890 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47890 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1475571 () Bool)

(assert (=> b!1475571 (and (bvsge (index!50914 lt!644668) #b00000000000000000000000000000000) (bvslt (index!50914 lt!644668) (size!48440 a!2862)))))

(declare-fun res!1002243 () Bool)

(assert (=> b!1475571 (= res!1002243 (= (select (arr!47890 a!2862) (index!50914 lt!644668)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475571 (=> res!1002243 e!827855)))

(declare-fun b!1475572 () Bool)

(assert (=> b!1475572 (= e!827853 (Intermediate!12130 true (toIndex!0 (select (arr!47890 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!155835 c!136178) b!1475572))

(assert (= (and d!155835 (not c!136178)) b!1475568))

(assert (= (and b!1475568 c!136179) b!1475564))

(assert (= (and b!1475568 (not c!136179)) b!1475567))

(assert (= (and d!155835 c!136180) b!1475565))

(assert (= (and d!155835 (not c!136180)) b!1475570))

(assert (= (and b!1475570 res!1002245) b!1475569))

(assert (= (and b!1475569 (not res!1002244)) b!1475571))

(assert (= (and b!1475571 (not res!1002243)) b!1475566))

(assert (=> b!1475567 m!1361633))

(declare-fun m!1361779 () Bool)

(assert (=> b!1475567 m!1361779))

(assert (=> b!1475567 m!1361779))

(assert (=> b!1475567 m!1361623))

(declare-fun m!1361781 () Bool)

(assert (=> b!1475567 m!1361781))

(assert (=> d!155835 m!1361633))

(declare-fun m!1361783 () Bool)

(assert (=> d!155835 m!1361783))

(assert (=> d!155835 m!1361629))

(declare-fun m!1361785 () Bool)

(assert (=> b!1475569 m!1361785))

(assert (=> b!1475571 m!1361785))

(assert (=> b!1475566 m!1361785))

(assert (=> b!1475317 d!155835))

(declare-fun d!155837 () Bool)

(declare-fun lt!644671 () (_ BitVec 32))

(declare-fun lt!644670 () (_ BitVec 32))

(assert (=> d!155837 (= lt!644671 (bvmul (bvxor lt!644670 (bvlshr lt!644670 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155837 (= lt!644670 ((_ extract 31 0) (bvand (bvxor (select (arr!47890 a!2862) j!93) (bvlshr (select (arr!47890 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155837 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1002239 (let ((h!35751 ((_ extract 31 0) (bvand (bvxor (select (arr!47890 a!2862) j!93) (bvlshr (select (arr!47890 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132503 (bvmul (bvxor h!35751 (bvlshr h!35751 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132503 (bvlshr x!132503 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1002239 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1002239 #b00000000000000000000000000000000))))))

(assert (=> d!155837 (= (toIndex!0 (select (arr!47890 a!2862) j!93) mask!2687) (bvand (bvxor lt!644671 (bvlshr lt!644671 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1475317 d!155837))

(declare-fun b!1475573 () Bool)

(declare-fun e!827858 () SeekEntryResult!12130)

(assert (=> b!1475573 (= e!827858 (Found!12130 index!646))))

(declare-fun e!827857 () SeekEntryResult!12130)

(declare-fun b!1475574 () Bool)

(assert (=> b!1475574 (= e!827857 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!644580 lt!644579 mask!2687))))

(declare-fun lt!644672 () SeekEntryResult!12130)

(declare-fun d!155839 () Bool)

(assert (=> d!155839 (and (or (is-Undefined!12130 lt!644672) (not (is-Found!12130 lt!644672)) (and (bvsge (index!50913 lt!644672) #b00000000000000000000000000000000) (bvslt (index!50913 lt!644672) (size!48440 lt!644579)))) (or (is-Undefined!12130 lt!644672) (is-Found!12130 lt!644672) (not (is-MissingVacant!12130 lt!644672)) (not (= (index!50915 lt!644672) intermediateAfterIndex!19)) (and (bvsge (index!50915 lt!644672) #b00000000000000000000000000000000) (bvslt (index!50915 lt!644672) (size!48440 lt!644579)))) (or (is-Undefined!12130 lt!644672) (ite (is-Found!12130 lt!644672) (= (select (arr!47890 lt!644579) (index!50913 lt!644672)) lt!644580) (and (is-MissingVacant!12130 lt!644672) (= (index!50915 lt!644672) intermediateAfterIndex!19) (= (select (arr!47890 lt!644579) (index!50915 lt!644672)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!827859 () SeekEntryResult!12130)

