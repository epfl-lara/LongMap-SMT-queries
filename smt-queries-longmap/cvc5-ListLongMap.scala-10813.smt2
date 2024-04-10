; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126526 () Bool)

(assert start!126526)

(declare-fun b!1484359 () Bool)

(declare-fun e!832240 () Bool)

(declare-fun e!832239 () Bool)

(assert (=> b!1484359 (= e!832240 e!832239)))

(declare-fun res!1009161 () Bool)

(assert (=> b!1484359 (=> (not res!1009161) (not e!832239))))

(declare-datatypes ((SeekEntryResult!12260 0))(
  ( (MissingZero!12260 (index!51432 (_ BitVec 32))) (Found!12260 (index!51433 (_ BitVec 32))) (Intermediate!12260 (undefined!13072 Bool) (index!51434 (_ BitVec 32)) (x!133016 (_ BitVec 32))) (Undefined!12260) (MissingVacant!12260 (index!51435 (_ BitVec 32))) )
))
(declare-fun lt!647739 () SeekEntryResult!12260)

(declare-datatypes ((array!99488 0))(
  ( (array!99489 (arr!48020 (Array (_ BitVec 32) (_ BitVec 64))) (size!48570 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99488)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99488 (_ BitVec 32)) SeekEntryResult!12260)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484359 (= res!1009161 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48020 a!2862) j!93) mask!2687) (select (arr!48020 a!2862) j!93) a!2862 mask!2687) lt!647739))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1484359 (= lt!647739 (Intermediate!12260 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1009149 () Bool)

(declare-fun e!832246 () Bool)

(assert (=> start!126526 (=> (not res!1009149) (not e!832246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126526 (= res!1009149 (validMask!0 mask!2687))))

(assert (=> start!126526 e!832246))

(assert (=> start!126526 true))

(declare-fun array_inv!37048 (array!99488) Bool)

(assert (=> start!126526 (array_inv!37048 a!2862)))

(declare-fun b!1484360 () Bool)

(declare-fun res!1009156 () Bool)

(assert (=> b!1484360 (=> (not res!1009156) (not e!832246))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1484360 (= res!1009156 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48570 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48570 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48570 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484361 () Bool)

(declare-fun res!1009145 () Bool)

(assert (=> b!1484361 (=> (not res!1009145) (not e!832239))))

(assert (=> b!1484361 (= res!1009145 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48020 a!2862) j!93) a!2862 mask!2687) lt!647739))))

(declare-fun b!1484362 () Bool)

(declare-fun res!1009154 () Bool)

(assert (=> b!1484362 (=> (not res!1009154) (not e!832246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99488 (_ BitVec 32)) Bool)

(assert (=> b!1484362 (= res!1009154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484363 () Bool)

(assert (=> b!1484363 (= e!832246 e!832240)))

(declare-fun res!1009148 () Bool)

(assert (=> b!1484363 (=> (not res!1009148) (not e!832240))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1484363 (= res!1009148 (= (select (store (arr!48020 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647737 () array!99488)

(assert (=> b!1484363 (= lt!647737 (array!99489 (store (arr!48020 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48570 a!2862)))))

(declare-fun b!1484364 () Bool)

(declare-fun res!1009147 () Bool)

(declare-fun e!832245 () Bool)

(assert (=> b!1484364 (=> (not res!1009147) (not e!832245))))

(assert (=> b!1484364 (= res!1009147 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484365 () Bool)

(declare-fun e!832238 () Bool)

(declare-fun e!832244 () Bool)

(assert (=> b!1484365 (= e!832238 e!832244)))

(declare-fun res!1009158 () Bool)

(assert (=> b!1484365 (=> (not res!1009158) (not e!832244))))

(declare-fun lt!647735 () (_ BitVec 64))

(assert (=> b!1484365 (= res!1009158 (and (= index!646 intermediateAfterIndex!19) (= lt!647735 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!647738 () (_ BitVec 64))

(declare-fun lt!647734 () SeekEntryResult!12260)

(declare-fun b!1484366 () Bool)

(declare-fun e!832247 () Bool)

(assert (=> b!1484366 (= e!832247 (= lt!647734 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647738 lt!647737 mask!2687)))))

(declare-fun b!1484367 () Bool)

(declare-fun res!1009155 () Bool)

(declare-fun e!832243 () Bool)

(assert (=> b!1484367 (=> (not res!1009155) (not e!832243))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99488 (_ BitVec 32)) SeekEntryResult!12260)

(assert (=> b!1484367 (= res!1009155 (= (seekEntryOrOpen!0 (select (arr!48020 a!2862) j!93) a!2862 mask!2687) (Found!12260 j!93)))))

(declare-fun b!1484368 () Bool)

(declare-fun res!1009157 () Bool)

(assert (=> b!1484368 (=> (not res!1009157) (not e!832246))))

(assert (=> b!1484368 (= res!1009157 (and (= (size!48570 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48570 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48570 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484369 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99488 (_ BitVec 32)) SeekEntryResult!12260)

(assert (=> b!1484369 (= e!832244 (= (seekEntryOrOpen!0 lt!647738 lt!647737 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647738 lt!647737 mask!2687)))))

(declare-fun b!1484370 () Bool)

(declare-fun e!832242 () Bool)

(assert (=> b!1484370 (= e!832245 (not e!832242))))

(declare-fun res!1009152 () Bool)

(assert (=> b!1484370 (=> res!1009152 e!832242)))

(assert (=> b!1484370 (= res!1009152 (or (and (= (select (arr!48020 a!2862) index!646) (select (store (arr!48020 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48020 a!2862) index!646) (select (arr!48020 a!2862) j!93))) (= (select (arr!48020 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484370 e!832243))

(declare-fun res!1009151 () Bool)

(assert (=> b!1484370 (=> (not res!1009151) (not e!832243))))

(assert (=> b!1484370 (= res!1009151 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49860 0))(
  ( (Unit!49861) )
))
(declare-fun lt!647733 () Unit!49860)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99488 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49860)

(assert (=> b!1484370 (= lt!647733 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484371 () Bool)

(assert (=> b!1484371 (= e!832239 e!832245)))

(declare-fun res!1009159 () Bool)

(assert (=> b!1484371 (=> (not res!1009159) (not e!832245))))

(assert (=> b!1484371 (= res!1009159 (= lt!647734 (Intermediate!12260 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1484371 (= lt!647734 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647738 mask!2687) lt!647738 lt!647737 mask!2687))))

(assert (=> b!1484371 (= lt!647738 (select (store (arr!48020 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484372 () Bool)

(declare-fun res!1009153 () Bool)

(assert (=> b!1484372 (=> (not res!1009153) (not e!832245))))

(assert (=> b!1484372 (= res!1009153 e!832247)))

(declare-fun c!137130 () Bool)

(assert (=> b!1484372 (= c!137130 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484373 () Bool)

(declare-fun res!1009162 () Bool)

(assert (=> b!1484373 (=> (not res!1009162) (not e!832246))))

(declare-datatypes ((List!34521 0))(
  ( (Nil!34518) (Cons!34517 (h!35891 (_ BitVec 64)) (t!49215 List!34521)) )
))
(declare-fun arrayNoDuplicates!0 (array!99488 (_ BitVec 32) List!34521) Bool)

(assert (=> b!1484373 (= res!1009162 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34518))))

(declare-fun b!1484374 () Bool)

(assert (=> b!1484374 (= e!832247 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647738 lt!647737 mask!2687) (seekEntryOrOpen!0 lt!647738 lt!647737 mask!2687)))))

(declare-fun b!1484375 () Bool)

(declare-fun res!1009160 () Bool)

(assert (=> b!1484375 (=> (not res!1009160) (not e!832246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484375 (= res!1009160 (validKeyInArray!0 (select (arr!48020 a!2862) j!93)))))

(declare-fun b!1484376 () Bool)

(assert (=> b!1484376 (= e!832243 e!832238)))

(declare-fun res!1009144 () Bool)

(assert (=> b!1484376 (=> res!1009144 e!832238)))

(assert (=> b!1484376 (= res!1009144 (or (and (= (select (arr!48020 a!2862) index!646) lt!647735) (= (select (arr!48020 a!2862) index!646) (select (arr!48020 a!2862) j!93))) (= (select (arr!48020 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484376 (= lt!647735 (select (store (arr!48020 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484377 () Bool)

(declare-fun res!1009150 () Bool)

(assert (=> b!1484377 (=> (not res!1009150) (not e!832246))))

(assert (=> b!1484377 (= res!1009150 (validKeyInArray!0 (select (arr!48020 a!2862) i!1006)))))

(declare-fun b!1484378 () Bool)

(assert (=> b!1484378 (= e!832242 true)))

(declare-fun lt!647736 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484378 (= lt!647736 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1484379 () Bool)

(declare-fun res!1009146 () Bool)

(assert (=> b!1484379 (=> (not res!1009146) (not e!832243))))

(assert (=> b!1484379 (= res!1009146 (or (= (select (arr!48020 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48020 a!2862) intermediateBeforeIndex!19) (select (arr!48020 a!2862) j!93))))))

(assert (= (and start!126526 res!1009149) b!1484368))

(assert (= (and b!1484368 res!1009157) b!1484377))

(assert (= (and b!1484377 res!1009150) b!1484375))

(assert (= (and b!1484375 res!1009160) b!1484362))

(assert (= (and b!1484362 res!1009154) b!1484373))

(assert (= (and b!1484373 res!1009162) b!1484360))

(assert (= (and b!1484360 res!1009156) b!1484363))

(assert (= (and b!1484363 res!1009148) b!1484359))

(assert (= (and b!1484359 res!1009161) b!1484361))

(assert (= (and b!1484361 res!1009145) b!1484371))

(assert (= (and b!1484371 res!1009159) b!1484372))

(assert (= (and b!1484372 c!137130) b!1484366))

(assert (= (and b!1484372 (not c!137130)) b!1484374))

(assert (= (and b!1484372 res!1009153) b!1484364))

(assert (= (and b!1484364 res!1009147) b!1484370))

(assert (= (and b!1484370 res!1009151) b!1484367))

(assert (= (and b!1484367 res!1009155) b!1484379))

(assert (= (and b!1484379 res!1009146) b!1484376))

(assert (= (and b!1484376 (not res!1009144)) b!1484365))

(assert (= (and b!1484365 res!1009158) b!1484369))

(assert (= (and b!1484370 (not res!1009152)) b!1484378))

(declare-fun m!1369681 () Bool)

(assert (=> b!1484376 m!1369681))

(declare-fun m!1369683 () Bool)

(assert (=> b!1484376 m!1369683))

(declare-fun m!1369685 () Bool)

(assert (=> b!1484376 m!1369685))

(declare-fun m!1369687 () Bool)

(assert (=> b!1484376 m!1369687))

(assert (=> b!1484363 m!1369685))

(declare-fun m!1369689 () Bool)

(assert (=> b!1484363 m!1369689))

(declare-fun m!1369691 () Bool)

(assert (=> b!1484371 m!1369691))

(assert (=> b!1484371 m!1369691))

(declare-fun m!1369693 () Bool)

(assert (=> b!1484371 m!1369693))

(assert (=> b!1484371 m!1369685))

(declare-fun m!1369695 () Bool)

(assert (=> b!1484371 m!1369695))

(assert (=> b!1484359 m!1369683))

(assert (=> b!1484359 m!1369683))

(declare-fun m!1369697 () Bool)

(assert (=> b!1484359 m!1369697))

(assert (=> b!1484359 m!1369697))

(assert (=> b!1484359 m!1369683))

(declare-fun m!1369699 () Bool)

(assert (=> b!1484359 m!1369699))

(assert (=> b!1484367 m!1369683))

(assert (=> b!1484367 m!1369683))

(declare-fun m!1369701 () Bool)

(assert (=> b!1484367 m!1369701))

(declare-fun m!1369703 () Bool)

(assert (=> b!1484374 m!1369703))

(declare-fun m!1369705 () Bool)

(assert (=> b!1484374 m!1369705))

(declare-fun m!1369707 () Bool)

(assert (=> b!1484370 m!1369707))

(assert (=> b!1484370 m!1369685))

(assert (=> b!1484370 m!1369687))

(assert (=> b!1484370 m!1369681))

(declare-fun m!1369709 () Bool)

(assert (=> b!1484370 m!1369709))

(assert (=> b!1484370 m!1369683))

(declare-fun m!1369711 () Bool)

(assert (=> b!1484366 m!1369711))

(declare-fun m!1369713 () Bool)

(assert (=> b!1484378 m!1369713))

(assert (=> b!1484361 m!1369683))

(assert (=> b!1484361 m!1369683))

(declare-fun m!1369715 () Bool)

(assert (=> b!1484361 m!1369715))

(declare-fun m!1369717 () Bool)

(assert (=> b!1484362 m!1369717))

(assert (=> b!1484375 m!1369683))

(assert (=> b!1484375 m!1369683))

(declare-fun m!1369719 () Bool)

(assert (=> b!1484375 m!1369719))

(declare-fun m!1369721 () Bool)

(assert (=> start!126526 m!1369721))

(declare-fun m!1369723 () Bool)

(assert (=> start!126526 m!1369723))

(declare-fun m!1369725 () Bool)

(assert (=> b!1484377 m!1369725))

(assert (=> b!1484377 m!1369725))

(declare-fun m!1369727 () Bool)

(assert (=> b!1484377 m!1369727))

(declare-fun m!1369729 () Bool)

(assert (=> b!1484373 m!1369729))

(assert (=> b!1484369 m!1369705))

(assert (=> b!1484369 m!1369703))

(declare-fun m!1369731 () Bool)

(assert (=> b!1484379 m!1369731))

(assert (=> b!1484379 m!1369683))

(push 1)

