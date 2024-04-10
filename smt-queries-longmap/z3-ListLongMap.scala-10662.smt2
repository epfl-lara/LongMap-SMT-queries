; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125112 () Bool)

(assert start!125112)

(declare-fun b!1457340 () Bool)

(declare-fun res!987675 () Bool)

(declare-fun e!819847 () Bool)

(assert (=> b!1457340 (=> (not res!987675) (not e!819847))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98560 0))(
  ( (array!98561 (arr!47568 (Array (_ BitVec 32) (_ BitVec 64))) (size!48118 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98560)

(assert (=> b!1457340 (= res!987675 (and (= (size!48118 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48118 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48118 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!987676 () Bool)

(assert (=> start!125112 (=> (not res!987676) (not e!819847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125112 (= res!987676 (validMask!0 mask!2687))))

(assert (=> start!125112 e!819847))

(assert (=> start!125112 true))

(declare-fun array_inv!36596 (array!98560) Bool)

(assert (=> start!125112 (array_inv!36596 a!2862)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!638646 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!638642 () array!98560)

(declare-fun b!1457341 () Bool)

(declare-fun e!819845 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11820 0))(
  ( (MissingZero!11820 (index!49672 (_ BitVec 32))) (Found!11820 (index!49673 (_ BitVec 32))) (Intermediate!11820 (undefined!12632 Bool) (index!49674 (_ BitVec 32)) (x!131293 (_ BitVec 32))) (Undefined!11820) (MissingVacant!11820 (index!49675 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98560 (_ BitVec 32)) SeekEntryResult!11820)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98560 (_ BitVec 32)) SeekEntryResult!11820)

(assert (=> b!1457341 (= e!819845 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638646 lt!638642 mask!2687) (seekEntryOrOpen!0 lt!638646 lt!638642 mask!2687)))))

(declare-fun b!1457342 () Bool)

(declare-fun res!987669 () Bool)

(declare-fun e!819850 () Bool)

(assert (=> b!1457342 (=> (not res!987669) (not e!819850))))

(assert (=> b!1457342 (= res!987669 e!819845)))

(declare-fun c!134352 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1457342 (= c!134352 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!638643 () SeekEntryResult!11820)

(declare-fun b!1457343 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98560 (_ BitVec 32)) SeekEntryResult!11820)

(assert (=> b!1457343 (= e!819845 (= lt!638643 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638646 lt!638642 mask!2687)))))

(declare-fun b!1457344 () Bool)

(declare-fun res!987670 () Bool)

(declare-fun e!819848 () Bool)

(assert (=> b!1457344 (=> res!987670 e!819848)))

(declare-fun lt!638649 () (_ BitVec 32))

(declare-fun lt!638645 () SeekEntryResult!11820)

(assert (=> b!1457344 (= res!987670 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638649 (select (arr!47568 a!2862) j!93) a!2862 mask!2687) lt!638645)))))

(declare-fun b!1457345 () Bool)

(declare-fun res!987671 () Bool)

(declare-fun e!819844 () Bool)

(assert (=> b!1457345 (=> (not res!987671) (not e!819844))))

(assert (=> b!1457345 (= res!987671 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47568 a!2862) j!93) a!2862 mask!2687) lt!638645))))

(declare-fun b!1457346 () Bool)

(assert (=> b!1457346 (= e!819848 true)))

(declare-fun lt!638647 () Bool)

(declare-fun e!819849 () Bool)

(assert (=> b!1457346 (= lt!638647 e!819849)))

(declare-fun c!134351 () Bool)

(assert (=> b!1457346 (= c!134351 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457347 () Bool)

(declare-fun e!819846 () Bool)

(assert (=> b!1457347 (= e!819847 e!819846)))

(declare-fun res!987667 () Bool)

(assert (=> b!1457347 (=> (not res!987667) (not e!819846))))

(assert (=> b!1457347 (= res!987667 (= (select (store (arr!47568 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457347 (= lt!638642 (array!98561 (store (arr!47568 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48118 a!2862)))))

(declare-fun b!1457348 () Bool)

(declare-fun res!987666 () Bool)

(assert (=> b!1457348 (=> (not res!987666) (not e!819847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98560 (_ BitVec 32)) Bool)

(assert (=> b!1457348 (= res!987666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457349 () Bool)

(assert (=> b!1457349 (= e!819844 e!819850)))

(declare-fun res!987662 () Bool)

(assert (=> b!1457349 (=> (not res!987662) (not e!819850))))

(assert (=> b!1457349 (= res!987662 (= lt!638643 (Intermediate!11820 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457349 (= lt!638643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638646 mask!2687) lt!638646 lt!638642 mask!2687))))

(assert (=> b!1457349 (= lt!638646 (select (store (arr!47568 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457350 () Bool)

(declare-fun res!987663 () Bool)

(assert (=> b!1457350 (=> (not res!987663) (not e!819850))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1457350 (= res!987663 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457351 () Bool)

(assert (=> b!1457351 (= e!819849 (not (= lt!638643 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638649 lt!638646 lt!638642 mask!2687))))))

(declare-fun b!1457352 () Bool)

(declare-fun res!987664 () Bool)

(assert (=> b!1457352 (=> (not res!987664) (not e!819847))))

(declare-datatypes ((List!34069 0))(
  ( (Nil!34066) (Cons!34065 (h!35415 (_ BitVec 64)) (t!48763 List!34069)) )
))
(declare-fun arrayNoDuplicates!0 (array!98560 (_ BitVec 32) List!34069) Bool)

(assert (=> b!1457352 (= res!987664 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34066))))

(declare-fun b!1457353 () Bool)

(declare-fun lt!638644 () SeekEntryResult!11820)

(assert (=> b!1457353 (= e!819849 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638649 intermediateAfterIndex!19 lt!638646 lt!638642 mask!2687) lt!638644)))))

(declare-fun b!1457354 () Bool)

(declare-fun res!987665 () Bool)

(assert (=> b!1457354 (=> (not res!987665) (not e!819847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457354 (= res!987665 (validKeyInArray!0 (select (arr!47568 a!2862) i!1006)))))

(declare-fun b!1457355 () Bool)

(declare-fun res!987659 () Bool)

(declare-fun e!819851 () Bool)

(assert (=> b!1457355 (=> (not res!987659) (not e!819851))))

(assert (=> b!1457355 (= res!987659 (= (seekEntryOrOpen!0 (select (arr!47568 a!2862) j!93) a!2862 mask!2687) (Found!11820 j!93)))))

(declare-fun b!1457356 () Bool)

(declare-fun e!819842 () Bool)

(assert (=> b!1457356 (= e!819842 e!819848)))

(declare-fun res!987661 () Bool)

(assert (=> b!1457356 (=> res!987661 e!819848)))

(assert (=> b!1457356 (= res!987661 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638649 #b00000000000000000000000000000000) (bvsge lt!638649 (size!48118 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457356 (= lt!638649 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1457356 (= lt!638644 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638646 lt!638642 mask!2687))))

(assert (=> b!1457356 (= lt!638644 (seekEntryOrOpen!0 lt!638646 lt!638642 mask!2687))))

(declare-fun b!1457357 () Bool)

(assert (=> b!1457357 (= e!819846 e!819844)))

(declare-fun res!987672 () Bool)

(assert (=> b!1457357 (=> (not res!987672) (not e!819844))))

(assert (=> b!1457357 (= res!987672 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47568 a!2862) j!93) mask!2687) (select (arr!47568 a!2862) j!93) a!2862 mask!2687) lt!638645))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1457357 (= lt!638645 (Intermediate!11820 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457358 () Bool)

(declare-fun res!987674 () Bool)

(assert (=> b!1457358 (=> (not res!987674) (not e!819847))))

(assert (=> b!1457358 (= res!987674 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48118 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48118 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48118 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457359 () Bool)

(assert (=> b!1457359 (= e!819851 (and (or (= (select (arr!47568 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47568 a!2862) intermediateBeforeIndex!19) (select (arr!47568 a!2862) j!93))) (let ((bdg!53326 (select (store (arr!47568 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47568 a!2862) index!646) bdg!53326) (= (select (arr!47568 a!2862) index!646) (select (arr!47568 a!2862) j!93))) (= (select (arr!47568 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53326 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457360 () Bool)

(declare-fun res!987673 () Bool)

(assert (=> b!1457360 (=> (not res!987673) (not e!819847))))

(assert (=> b!1457360 (= res!987673 (validKeyInArray!0 (select (arr!47568 a!2862) j!93)))))

(declare-fun b!1457361 () Bool)

(assert (=> b!1457361 (= e!819850 (not e!819842))))

(declare-fun res!987668 () Bool)

(assert (=> b!1457361 (=> res!987668 e!819842)))

(assert (=> b!1457361 (= res!987668 (or (and (= (select (arr!47568 a!2862) index!646) (select (store (arr!47568 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47568 a!2862) index!646) (select (arr!47568 a!2862) j!93))) (= (select (arr!47568 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1457361 e!819851))

(declare-fun res!987660 () Bool)

(assert (=> b!1457361 (=> (not res!987660) (not e!819851))))

(assert (=> b!1457361 (= res!987660 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49136 0))(
  ( (Unit!49137) )
))
(declare-fun lt!638648 () Unit!49136)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98560 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49136)

(assert (=> b!1457361 (= lt!638648 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125112 res!987676) b!1457340))

(assert (= (and b!1457340 res!987675) b!1457354))

(assert (= (and b!1457354 res!987665) b!1457360))

(assert (= (and b!1457360 res!987673) b!1457348))

(assert (= (and b!1457348 res!987666) b!1457352))

(assert (= (and b!1457352 res!987664) b!1457358))

(assert (= (and b!1457358 res!987674) b!1457347))

(assert (= (and b!1457347 res!987667) b!1457357))

(assert (= (and b!1457357 res!987672) b!1457345))

(assert (= (and b!1457345 res!987671) b!1457349))

(assert (= (and b!1457349 res!987662) b!1457342))

(assert (= (and b!1457342 c!134352) b!1457343))

(assert (= (and b!1457342 (not c!134352)) b!1457341))

(assert (= (and b!1457342 res!987669) b!1457350))

(assert (= (and b!1457350 res!987663) b!1457361))

(assert (= (and b!1457361 res!987660) b!1457355))

(assert (= (and b!1457355 res!987659) b!1457359))

(assert (= (and b!1457361 (not res!987668)) b!1457356))

(assert (= (and b!1457356 (not res!987661)) b!1457344))

(assert (= (and b!1457344 (not res!987670)) b!1457346))

(assert (= (and b!1457346 c!134351) b!1457351))

(assert (= (and b!1457346 (not c!134351)) b!1457353))

(declare-fun m!1345331 () Bool)

(assert (=> b!1457347 m!1345331))

(declare-fun m!1345333 () Bool)

(assert (=> b!1457347 m!1345333))

(declare-fun m!1345335 () Bool)

(assert (=> b!1457352 m!1345335))

(declare-fun m!1345337 () Bool)

(assert (=> b!1457361 m!1345337))

(assert (=> b!1457361 m!1345331))

(declare-fun m!1345339 () Bool)

(assert (=> b!1457361 m!1345339))

(declare-fun m!1345341 () Bool)

(assert (=> b!1457361 m!1345341))

(declare-fun m!1345343 () Bool)

(assert (=> b!1457361 m!1345343))

(declare-fun m!1345345 () Bool)

(assert (=> b!1457361 m!1345345))

(declare-fun m!1345347 () Bool)

(assert (=> b!1457354 m!1345347))

(assert (=> b!1457354 m!1345347))

(declare-fun m!1345349 () Bool)

(assert (=> b!1457354 m!1345349))

(assert (=> b!1457345 m!1345345))

(assert (=> b!1457345 m!1345345))

(declare-fun m!1345351 () Bool)

(assert (=> b!1457345 m!1345351))

(assert (=> b!1457344 m!1345345))

(assert (=> b!1457344 m!1345345))

(declare-fun m!1345353 () Bool)

(assert (=> b!1457344 m!1345353))

(assert (=> b!1457360 m!1345345))

(assert (=> b!1457360 m!1345345))

(declare-fun m!1345355 () Bool)

(assert (=> b!1457360 m!1345355))

(assert (=> b!1457357 m!1345345))

(assert (=> b!1457357 m!1345345))

(declare-fun m!1345357 () Bool)

(assert (=> b!1457357 m!1345357))

(assert (=> b!1457357 m!1345357))

(assert (=> b!1457357 m!1345345))

(declare-fun m!1345359 () Bool)

(assert (=> b!1457357 m!1345359))

(declare-fun m!1345361 () Bool)

(assert (=> b!1457348 m!1345361))

(declare-fun m!1345363 () Bool)

(assert (=> b!1457353 m!1345363))

(assert (=> b!1457355 m!1345345))

(assert (=> b!1457355 m!1345345))

(declare-fun m!1345365 () Bool)

(assert (=> b!1457355 m!1345365))

(declare-fun m!1345367 () Bool)

(assert (=> b!1457343 m!1345367))

(declare-fun m!1345369 () Bool)

(assert (=> start!125112 m!1345369))

(declare-fun m!1345371 () Bool)

(assert (=> start!125112 m!1345371))

(declare-fun m!1345373 () Bool)

(assert (=> b!1457341 m!1345373))

(declare-fun m!1345375 () Bool)

(assert (=> b!1457341 m!1345375))

(declare-fun m!1345377 () Bool)

(assert (=> b!1457356 m!1345377))

(assert (=> b!1457356 m!1345373))

(assert (=> b!1457356 m!1345375))

(assert (=> b!1457359 m!1345331))

(declare-fun m!1345379 () Bool)

(assert (=> b!1457359 m!1345379))

(assert (=> b!1457359 m!1345339))

(assert (=> b!1457359 m!1345341))

(assert (=> b!1457359 m!1345345))

(declare-fun m!1345381 () Bool)

(assert (=> b!1457349 m!1345381))

(assert (=> b!1457349 m!1345381))

(declare-fun m!1345383 () Bool)

(assert (=> b!1457349 m!1345383))

(assert (=> b!1457349 m!1345331))

(declare-fun m!1345385 () Bool)

(assert (=> b!1457349 m!1345385))

(declare-fun m!1345387 () Bool)

(assert (=> b!1457351 m!1345387))

(check-sat (not b!1457344) (not b!1457360) (not b!1457352) (not b!1457361) (not b!1457348) (not b!1457341) (not b!1457354) (not b!1457349) (not b!1457357) (not b!1457353) (not b!1457356) (not start!125112) (not b!1457351) (not b!1457355) (not b!1457343) (not b!1457345))
(check-sat)
