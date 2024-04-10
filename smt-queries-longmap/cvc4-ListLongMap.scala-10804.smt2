; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126416 () Bool)

(assert start!126416)

(declare-fun b!1482435 () Bool)

(declare-fun e!831284 () Bool)

(declare-fun e!831288 () Bool)

(assert (=> b!1482435 (= e!831284 e!831288)))

(declare-fun res!1007645 () Bool)

(assert (=> b!1482435 (=> (not res!1007645) (not e!831288))))

(declare-datatypes ((SeekEntryResult!12235 0))(
  ( (MissingZero!12235 (index!51332 (_ BitVec 32))) (Found!12235 (index!51333 (_ BitVec 32))) (Intermediate!12235 (undefined!13047 Bool) (index!51334 (_ BitVec 32)) (x!132910 (_ BitVec 32))) (Undefined!12235) (MissingVacant!12235 (index!51335 (_ BitVec 32))) )
))
(declare-fun lt!647069 () SeekEntryResult!12235)

(declare-datatypes ((array!99435 0))(
  ( (array!99436 (arr!47995 (Array (_ BitVec 32) (_ BitVec 64))) (size!48545 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99435)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99435 (_ BitVec 32)) SeekEntryResult!12235)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482435 (= res!1007645 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47995 a!2862) j!93) mask!2687) (select (arr!47995 a!2862) j!93) a!2862 mask!2687) lt!647069))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1482435 (= lt!647069 (Intermediate!12235 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1482436 () Bool)

(declare-fun res!1007648 () Bool)

(assert (=> b!1482436 (=> (not res!1007648) (not e!831288))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1482436 (= res!1007648 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47995 a!2862) j!93) a!2862 mask!2687) lt!647069))))

(declare-fun b!1482437 () Bool)

(declare-fun res!1007650 () Bool)

(declare-fun e!831286 () Bool)

(assert (=> b!1482437 (=> (not res!1007650) (not e!831286))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1482437 (= res!1007650 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1482438 () Bool)

(declare-fun res!1007654 () Bool)

(declare-fun e!831285 () Bool)

(assert (=> b!1482438 (=> (not res!1007654) (not e!831285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1482438 (= res!1007654 (validKeyInArray!0 (select (arr!47995 a!2862) i!1006)))))

(declare-fun b!1482439 () Bool)

(declare-fun res!1007655 () Bool)

(declare-fun e!831290 () Bool)

(assert (=> b!1482439 (=> (not res!1007655) (not e!831290))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99435 (_ BitVec 32)) SeekEntryResult!12235)

(assert (=> b!1482439 (= res!1007655 (= (seekEntryOrOpen!0 (select (arr!47995 a!2862) j!93) a!2862 mask!2687) (Found!12235 j!93)))))

(declare-fun lt!647073 () (_ BitVec 64))

(declare-fun b!1482440 () Bool)

(declare-fun e!831289 () Bool)

(declare-fun lt!647070 () array!99435)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99435 (_ BitVec 32)) SeekEntryResult!12235)

(assert (=> b!1482440 (= e!831289 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647073 lt!647070 mask!2687) (seekEntryOrOpen!0 lt!647073 lt!647070 mask!2687)))))

(declare-fun b!1482441 () Bool)

(declare-fun res!1007646 () Bool)

(assert (=> b!1482441 (=> (not res!1007646) (not e!831285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99435 (_ BitVec 32)) Bool)

(assert (=> b!1482441 (= res!1007646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1482442 () Bool)

(assert (=> b!1482442 (= e!831285 e!831284)))

(declare-fun res!1007653 () Bool)

(assert (=> b!1482442 (=> (not res!1007653) (not e!831284))))

(assert (=> b!1482442 (= res!1007653 (= (select (store (arr!47995 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482442 (= lt!647070 (array!99436 (store (arr!47995 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48545 a!2862)))))

(declare-fun res!1007651 () Bool)

(assert (=> start!126416 (=> (not res!1007651) (not e!831285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126416 (= res!1007651 (validMask!0 mask!2687))))

(assert (=> start!126416 e!831285))

(assert (=> start!126416 true))

(declare-fun array_inv!37023 (array!99435) Bool)

(assert (=> start!126416 (array_inv!37023 a!2862)))

(declare-fun b!1482434 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1482434 (= e!831290 (and (or (= (select (arr!47995 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47995 a!2862) intermediateBeforeIndex!19) (select (arr!47995 a!2862) j!93))) (or (and (= (select (arr!47995 a!2862) index!646) (select (store (arr!47995 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47995 a!2862) index!646) (select (arr!47995 a!2862) j!93))) (= (select (arr!47995 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47995 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1482443 () Bool)

(declare-fun res!1007642 () Bool)

(assert (=> b!1482443 (=> (not res!1007642) (not e!831285))))

(declare-datatypes ((List!34496 0))(
  ( (Nil!34493) (Cons!34492 (h!35863 (_ BitVec 64)) (t!49190 List!34496)) )
))
(declare-fun arrayNoDuplicates!0 (array!99435 (_ BitVec 32) List!34496) Bool)

(assert (=> b!1482443 (= res!1007642 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34493))))

(declare-fun b!1482444 () Bool)

(declare-fun res!1007649 () Bool)

(assert (=> b!1482444 (=> (not res!1007649) (not e!831286))))

(assert (=> b!1482444 (= res!1007649 e!831289)))

(declare-fun c!136917 () Bool)

(assert (=> b!1482444 (= c!136917 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1482445 () Bool)

(declare-fun res!1007656 () Bool)

(assert (=> b!1482445 (=> (not res!1007656) (not e!831285))))

(assert (=> b!1482445 (= res!1007656 (and (= (size!48545 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48545 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48545 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1482446 () Bool)

(declare-fun res!1007643 () Bool)

(assert (=> b!1482446 (=> (not res!1007643) (not e!831285))))

(assert (=> b!1482446 (= res!1007643 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48545 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48545 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48545 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1482447 () Bool)

(assert (=> b!1482447 (= e!831288 e!831286)))

(declare-fun res!1007652 () Bool)

(assert (=> b!1482447 (=> (not res!1007652) (not e!831286))))

(declare-fun lt!647072 () SeekEntryResult!12235)

(assert (=> b!1482447 (= res!1007652 (= lt!647072 (Intermediate!12235 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1482447 (= lt!647072 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647073 mask!2687) lt!647073 lt!647070 mask!2687))))

(assert (=> b!1482447 (= lt!647073 (select (store (arr!47995 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1482448 () Bool)

(declare-fun res!1007647 () Bool)

(assert (=> b!1482448 (=> (not res!1007647) (not e!831285))))

(assert (=> b!1482448 (= res!1007647 (validKeyInArray!0 (select (arr!47995 a!2862) j!93)))))

(declare-fun b!1482449 () Bool)

(assert (=> b!1482449 (= e!831289 (= lt!647072 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647073 lt!647070 mask!2687)))))

(declare-fun b!1482450 () Bool)

(assert (=> b!1482450 (= e!831286 (not true))))

(assert (=> b!1482450 e!831290))

(declare-fun res!1007644 () Bool)

(assert (=> b!1482450 (=> (not res!1007644) (not e!831290))))

(assert (=> b!1482450 (= res!1007644 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49810 0))(
  ( (Unit!49811) )
))
(declare-fun lt!647071 () Unit!49810)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99435 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49810)

(assert (=> b!1482450 (= lt!647071 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126416 res!1007651) b!1482445))

(assert (= (and b!1482445 res!1007656) b!1482438))

(assert (= (and b!1482438 res!1007654) b!1482448))

(assert (= (and b!1482448 res!1007647) b!1482441))

(assert (= (and b!1482441 res!1007646) b!1482443))

(assert (= (and b!1482443 res!1007642) b!1482446))

(assert (= (and b!1482446 res!1007643) b!1482442))

(assert (= (and b!1482442 res!1007653) b!1482435))

(assert (= (and b!1482435 res!1007645) b!1482436))

(assert (= (and b!1482436 res!1007648) b!1482447))

(assert (= (and b!1482447 res!1007652) b!1482444))

(assert (= (and b!1482444 c!136917) b!1482449))

(assert (= (and b!1482444 (not c!136917)) b!1482440))

(assert (= (and b!1482444 res!1007649) b!1482437))

(assert (= (and b!1482437 res!1007650) b!1482450))

(assert (= (and b!1482450 res!1007644) b!1482439))

(assert (= (and b!1482439 res!1007655) b!1482434))

(declare-fun m!1368155 () Bool)

(assert (=> b!1482449 m!1368155))

(declare-fun m!1368157 () Bool)

(assert (=> b!1482439 m!1368157))

(assert (=> b!1482439 m!1368157))

(declare-fun m!1368159 () Bool)

(assert (=> b!1482439 m!1368159))

(declare-fun m!1368161 () Bool)

(assert (=> b!1482442 m!1368161))

(declare-fun m!1368163 () Bool)

(assert (=> b!1482442 m!1368163))

(assert (=> b!1482435 m!1368157))

(assert (=> b!1482435 m!1368157))

(declare-fun m!1368165 () Bool)

(assert (=> b!1482435 m!1368165))

(assert (=> b!1482435 m!1368165))

(assert (=> b!1482435 m!1368157))

(declare-fun m!1368167 () Bool)

(assert (=> b!1482435 m!1368167))

(declare-fun m!1368169 () Bool)

(assert (=> b!1482450 m!1368169))

(declare-fun m!1368171 () Bool)

(assert (=> b!1482450 m!1368171))

(declare-fun m!1368173 () Bool)

(assert (=> b!1482447 m!1368173))

(assert (=> b!1482447 m!1368173))

(declare-fun m!1368175 () Bool)

(assert (=> b!1482447 m!1368175))

(assert (=> b!1482447 m!1368161))

(declare-fun m!1368177 () Bool)

(assert (=> b!1482447 m!1368177))

(declare-fun m!1368179 () Bool)

(assert (=> b!1482438 m!1368179))

(assert (=> b!1482438 m!1368179))

(declare-fun m!1368181 () Bool)

(assert (=> b!1482438 m!1368181))

(declare-fun m!1368183 () Bool)

(assert (=> start!126416 m!1368183))

(declare-fun m!1368185 () Bool)

(assert (=> start!126416 m!1368185))

(assert (=> b!1482434 m!1368161))

(declare-fun m!1368187 () Bool)

(assert (=> b!1482434 m!1368187))

(declare-fun m!1368189 () Bool)

(assert (=> b!1482434 m!1368189))

(declare-fun m!1368191 () Bool)

(assert (=> b!1482434 m!1368191))

(assert (=> b!1482434 m!1368157))

(declare-fun m!1368193 () Bool)

(assert (=> b!1482440 m!1368193))

(declare-fun m!1368195 () Bool)

(assert (=> b!1482440 m!1368195))

(declare-fun m!1368197 () Bool)

(assert (=> b!1482441 m!1368197))

(assert (=> b!1482436 m!1368157))

(assert (=> b!1482436 m!1368157))

(declare-fun m!1368199 () Bool)

(assert (=> b!1482436 m!1368199))

(declare-fun m!1368201 () Bool)

(assert (=> b!1482443 m!1368201))

(assert (=> b!1482448 m!1368157))

(assert (=> b!1482448 m!1368157))

(declare-fun m!1368203 () Bool)

(assert (=> b!1482448 m!1368203))

(push 1)

