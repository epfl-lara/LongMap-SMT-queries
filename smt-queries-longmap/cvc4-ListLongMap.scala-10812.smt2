; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126524 () Bool)

(assert start!126524)

(declare-fun b!1484296 () Bool)

(declare-fun e!832213 () Bool)

(declare-fun e!832214 () Bool)

(assert (=> b!1484296 (= e!832213 e!832214)))

(declare-fun res!1009103 () Bool)

(assert (=> b!1484296 (=> (not res!1009103) (not e!832214))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!647716 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1484296 (= res!1009103 (and (= index!646 intermediateAfterIndex!19) (= lt!647716 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!99486 0))(
  ( (array!99487 (arr!48019 (Array (_ BitVec 32) (_ BitVec 64))) (size!48569 (_ BitVec 32))) )
))
(declare-fun lt!647713 () array!99486)

(declare-fun b!1484297 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!647714 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12259 0))(
  ( (MissingZero!12259 (index!51428 (_ BitVec 32))) (Found!12259 (index!51429 (_ BitVec 32))) (Intermediate!12259 (undefined!13071 Bool) (index!51430 (_ BitVec 32)) (x!133007 (_ BitVec 32))) (Undefined!12259) (MissingVacant!12259 (index!51431 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99486 (_ BitVec 32)) SeekEntryResult!12259)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99486 (_ BitVec 32)) SeekEntryResult!12259)

(assert (=> b!1484297 (= e!832214 (= (seekEntryOrOpen!0 lt!647714 lt!647713 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647714 lt!647713 mask!2687)))))

(declare-fun lt!647717 () SeekEntryResult!12259)

(declare-fun e!832215 () Bool)

(declare-fun b!1484298 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99486 (_ BitVec 32)) SeekEntryResult!12259)

(assert (=> b!1484298 (= e!832215 (= lt!647717 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647714 lt!647713 mask!2687)))))

(declare-fun b!1484299 () Bool)

(declare-fun res!1009095 () Bool)

(declare-fun e!832212 () Bool)

(assert (=> b!1484299 (=> (not res!1009095) (not e!832212))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun a!2862 () array!99486)

(assert (=> b!1484299 (= res!1009095 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48569 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48569 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48569 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484300 () Bool)

(declare-fun e!832209 () Bool)

(declare-fun e!832216 () Bool)

(assert (=> b!1484300 (= e!832209 e!832216)))

(declare-fun res!1009105 () Bool)

(assert (=> b!1484300 (=> (not res!1009105) (not e!832216))))

(assert (=> b!1484300 (= res!1009105 (= lt!647717 (Intermediate!12259 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484300 (= lt!647717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647714 mask!2687) lt!647714 lt!647713 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1484300 (= lt!647714 (select (store (arr!48019 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484301 () Bool)

(declare-fun e!832210 () Bool)

(assert (=> b!1484301 (= e!832210 e!832209)))

(declare-fun res!1009087 () Bool)

(assert (=> b!1484301 (=> (not res!1009087) (not e!832209))))

(declare-fun lt!647712 () SeekEntryResult!12259)

(assert (=> b!1484301 (= res!1009087 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48019 a!2862) j!93) mask!2687) (select (arr!48019 a!2862) j!93) a!2862 mask!2687) lt!647712))))

(assert (=> b!1484301 (= lt!647712 (Intermediate!12259 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484302 () Bool)

(declare-fun res!1009099 () Bool)

(assert (=> b!1484302 (=> (not res!1009099) (not e!832212))))

(assert (=> b!1484302 (= res!1009099 (and (= (size!48569 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48569 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48569 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484303 () Bool)

(declare-fun e!832217 () Bool)

(assert (=> b!1484303 (= e!832217 e!832213)))

(declare-fun res!1009092 () Bool)

(assert (=> b!1484303 (=> res!1009092 e!832213)))

(assert (=> b!1484303 (= res!1009092 (or (and (= (select (arr!48019 a!2862) index!646) lt!647716) (= (select (arr!48019 a!2862) index!646) (select (arr!48019 a!2862) j!93))) (= (select (arr!48019 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484303 (= lt!647716 (select (store (arr!48019 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun res!1009088 () Bool)

(assert (=> start!126524 (=> (not res!1009088) (not e!832212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126524 (= res!1009088 (validMask!0 mask!2687))))

(assert (=> start!126524 e!832212))

(assert (=> start!126524 true))

(declare-fun array_inv!37047 (array!99486) Bool)

(assert (=> start!126524 (array_inv!37047 a!2862)))

(declare-fun b!1484304 () Bool)

(declare-fun e!832211 () Bool)

(assert (=> b!1484304 (= e!832216 (not e!832211))))

(declare-fun res!1009100 () Bool)

(assert (=> b!1484304 (=> res!1009100 e!832211)))

(assert (=> b!1484304 (= res!1009100 (or (and (= (select (arr!48019 a!2862) index!646) (select (store (arr!48019 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48019 a!2862) index!646) (select (arr!48019 a!2862) j!93))) (= (select (arr!48019 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484304 e!832217))

(declare-fun res!1009090 () Bool)

(assert (=> b!1484304 (=> (not res!1009090) (not e!832217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99486 (_ BitVec 32)) Bool)

(assert (=> b!1484304 (= res!1009090 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49858 0))(
  ( (Unit!49859) )
))
(declare-fun lt!647715 () Unit!49858)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99486 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49858)

(assert (=> b!1484304 (= lt!647715 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484305 () Bool)

(declare-fun res!1009089 () Bool)

(assert (=> b!1484305 (=> (not res!1009089) (not e!832217))))

(assert (=> b!1484305 (= res!1009089 (= (seekEntryOrOpen!0 (select (arr!48019 a!2862) j!93) a!2862 mask!2687) (Found!12259 j!93)))))

(declare-fun b!1484306 () Bool)

(declare-fun res!1009097 () Bool)

(assert (=> b!1484306 (=> (not res!1009097) (not e!832216))))

(assert (=> b!1484306 (= res!1009097 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484307 () Bool)

(declare-fun res!1009104 () Bool)

(assert (=> b!1484307 (=> (not res!1009104) (not e!832216))))

(assert (=> b!1484307 (= res!1009104 e!832215)))

(declare-fun c!137127 () Bool)

(assert (=> b!1484307 (= c!137127 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484308 () Bool)

(declare-fun res!1009102 () Bool)

(assert (=> b!1484308 (=> (not res!1009102) (not e!832212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484308 (= res!1009102 (validKeyInArray!0 (select (arr!48019 a!2862) i!1006)))))

(declare-fun b!1484309 () Bool)

(declare-fun res!1009096 () Bool)

(assert (=> b!1484309 (=> (not res!1009096) (not e!832212))))

(declare-datatypes ((List!34520 0))(
  ( (Nil!34517) (Cons!34516 (h!35890 (_ BitVec 64)) (t!49214 List!34520)) )
))
(declare-fun arrayNoDuplicates!0 (array!99486 (_ BitVec 32) List!34520) Bool)

(assert (=> b!1484309 (= res!1009096 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34517))))

(declare-fun b!1484310 () Bool)

(assert (=> b!1484310 (= e!832215 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647714 lt!647713 mask!2687) (seekEntryOrOpen!0 lt!647714 lt!647713 mask!2687)))))

(declare-fun b!1484311 () Bool)

(declare-fun res!1009094 () Bool)

(assert (=> b!1484311 (=> (not res!1009094) (not e!832212))))

(assert (=> b!1484311 (= res!1009094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484312 () Bool)

(declare-fun res!1009091 () Bool)

(assert (=> b!1484312 (=> (not res!1009091) (not e!832217))))

(assert (=> b!1484312 (= res!1009091 (or (= (select (arr!48019 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48019 a!2862) intermediateBeforeIndex!19) (select (arr!48019 a!2862) j!93))))))

(declare-fun b!1484313 () Bool)

(assert (=> b!1484313 (= e!832211 true)))

(declare-fun lt!647718 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484313 (= lt!647718 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1484314 () Bool)

(declare-fun res!1009093 () Bool)

(assert (=> b!1484314 (=> (not res!1009093) (not e!832212))))

(assert (=> b!1484314 (= res!1009093 (validKeyInArray!0 (select (arr!48019 a!2862) j!93)))))

(declare-fun b!1484315 () Bool)

(assert (=> b!1484315 (= e!832212 e!832210)))

(declare-fun res!1009101 () Bool)

(assert (=> b!1484315 (=> (not res!1009101) (not e!832210))))

(assert (=> b!1484315 (= res!1009101 (= (select (store (arr!48019 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484315 (= lt!647713 (array!99487 (store (arr!48019 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48569 a!2862)))))

(declare-fun b!1484316 () Bool)

(declare-fun res!1009098 () Bool)

(assert (=> b!1484316 (=> (not res!1009098) (not e!832209))))

(assert (=> b!1484316 (= res!1009098 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48019 a!2862) j!93) a!2862 mask!2687) lt!647712))))

(assert (= (and start!126524 res!1009088) b!1484302))

(assert (= (and b!1484302 res!1009099) b!1484308))

(assert (= (and b!1484308 res!1009102) b!1484314))

(assert (= (and b!1484314 res!1009093) b!1484311))

(assert (= (and b!1484311 res!1009094) b!1484309))

(assert (= (and b!1484309 res!1009096) b!1484299))

(assert (= (and b!1484299 res!1009095) b!1484315))

(assert (= (and b!1484315 res!1009101) b!1484301))

(assert (= (and b!1484301 res!1009087) b!1484316))

(assert (= (and b!1484316 res!1009098) b!1484300))

(assert (= (and b!1484300 res!1009105) b!1484307))

(assert (= (and b!1484307 c!137127) b!1484298))

(assert (= (and b!1484307 (not c!137127)) b!1484310))

(assert (= (and b!1484307 res!1009104) b!1484306))

(assert (= (and b!1484306 res!1009097) b!1484304))

(assert (= (and b!1484304 res!1009090) b!1484305))

(assert (= (and b!1484305 res!1009089) b!1484312))

(assert (= (and b!1484312 res!1009091) b!1484303))

(assert (= (and b!1484303 (not res!1009092)) b!1484296))

(assert (= (and b!1484296 res!1009103) b!1484297))

(assert (= (and b!1484304 (not res!1009100)) b!1484313))

(declare-fun m!1369629 () Bool)

(assert (=> b!1484298 m!1369629))

(declare-fun m!1369631 () Bool)

(assert (=> b!1484312 m!1369631))

(declare-fun m!1369633 () Bool)

(assert (=> b!1484312 m!1369633))

(declare-fun m!1369635 () Bool)

(assert (=> start!126524 m!1369635))

(declare-fun m!1369637 () Bool)

(assert (=> start!126524 m!1369637))

(assert (=> b!1484316 m!1369633))

(assert (=> b!1484316 m!1369633))

(declare-fun m!1369639 () Bool)

(assert (=> b!1484316 m!1369639))

(declare-fun m!1369641 () Bool)

(assert (=> b!1484300 m!1369641))

(assert (=> b!1484300 m!1369641))

(declare-fun m!1369643 () Bool)

(assert (=> b!1484300 m!1369643))

(declare-fun m!1369645 () Bool)

(assert (=> b!1484300 m!1369645))

(declare-fun m!1369647 () Bool)

(assert (=> b!1484300 m!1369647))

(declare-fun m!1369649 () Bool)

(assert (=> b!1484311 m!1369649))

(assert (=> b!1484305 m!1369633))

(assert (=> b!1484305 m!1369633))

(declare-fun m!1369651 () Bool)

(assert (=> b!1484305 m!1369651))

(assert (=> b!1484315 m!1369645))

(declare-fun m!1369653 () Bool)

(assert (=> b!1484315 m!1369653))

(declare-fun m!1369655 () Bool)

(assert (=> b!1484310 m!1369655))

(declare-fun m!1369657 () Bool)

(assert (=> b!1484310 m!1369657))

(assert (=> b!1484301 m!1369633))

(assert (=> b!1484301 m!1369633))

(declare-fun m!1369659 () Bool)

(assert (=> b!1484301 m!1369659))

(assert (=> b!1484301 m!1369659))

(assert (=> b!1484301 m!1369633))

(declare-fun m!1369661 () Bool)

(assert (=> b!1484301 m!1369661))

(assert (=> b!1484314 m!1369633))

(assert (=> b!1484314 m!1369633))

(declare-fun m!1369663 () Bool)

(assert (=> b!1484314 m!1369663))

(declare-fun m!1369665 () Bool)

(assert (=> b!1484313 m!1369665))

(declare-fun m!1369667 () Bool)

(assert (=> b!1484308 m!1369667))

(assert (=> b!1484308 m!1369667))

(declare-fun m!1369669 () Bool)

(assert (=> b!1484308 m!1369669))

(declare-fun m!1369671 () Bool)

(assert (=> b!1484304 m!1369671))

(assert (=> b!1484304 m!1369645))

(declare-fun m!1369673 () Bool)

(assert (=> b!1484304 m!1369673))

(declare-fun m!1369675 () Bool)

(assert (=> b!1484304 m!1369675))

(declare-fun m!1369677 () Bool)

(assert (=> b!1484304 m!1369677))

(assert (=> b!1484304 m!1369633))

(assert (=> b!1484303 m!1369675))

(assert (=> b!1484303 m!1369633))

(assert (=> b!1484303 m!1369645))

(assert (=> b!1484303 m!1369673))

(declare-fun m!1369679 () Bool)

(assert (=> b!1484309 m!1369679))

(assert (=> b!1484297 m!1369657))

(assert (=> b!1484297 m!1369655))

(push 1)

