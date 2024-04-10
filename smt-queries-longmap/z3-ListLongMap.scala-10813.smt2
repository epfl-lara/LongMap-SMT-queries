; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126528 () Bool)

(assert start!126528)

(declare-fun b!1484422 () Bool)

(declare-fun lt!647760 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!832277 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99490 0))(
  ( (array!99491 (arr!48021 (Array (_ BitVec 32) (_ BitVec 64))) (size!48571 (_ BitVec 32))) )
))
(declare-fun lt!647756 () array!99490)

(declare-datatypes ((SeekEntryResult!12261 0))(
  ( (MissingZero!12261 (index!51436 (_ BitVec 32))) (Found!12261 (index!51437 (_ BitVec 32))) (Intermediate!12261 (undefined!13073 Bool) (index!51438 (_ BitVec 32)) (x!133017 (_ BitVec 32))) (Undefined!12261) (MissingVacant!12261 (index!51439 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99490 (_ BitVec 32)) SeekEntryResult!12261)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99490 (_ BitVec 32)) SeekEntryResult!12261)

(assert (=> b!1484422 (= e!832277 (= (seekEntryOrOpen!0 lt!647760 lt!647756 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647760 lt!647756 mask!2687)))))

(declare-fun b!1484423 () Bool)

(declare-fun e!832270 () Bool)

(declare-fun e!832275 () Bool)

(assert (=> b!1484423 (= e!832270 (not e!832275))))

(declare-fun res!1009208 () Bool)

(assert (=> b!1484423 (=> res!1009208 e!832275)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99490)

(assert (=> b!1484423 (= res!1009208 (or (and (= (select (arr!48021 a!2862) index!646) (select (store (arr!48021 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48021 a!2862) index!646) (select (arr!48021 a!2862) j!93))) (= (select (arr!48021 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!832273 () Bool)

(assert (=> b!1484423 e!832273))

(declare-fun res!1009204 () Bool)

(assert (=> b!1484423 (=> (not res!1009204) (not e!832273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99490 (_ BitVec 32)) Bool)

(assert (=> b!1484423 (= res!1009204 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49862 0))(
  ( (Unit!49863) )
))
(declare-fun lt!647758 () Unit!49862)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99490 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49862)

(assert (=> b!1484423 (= lt!647758 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484424 () Bool)

(declare-fun res!1009215 () Bool)

(declare-fun e!832272 () Bool)

(assert (=> b!1484424 (=> (not res!1009215) (not e!832272))))

(assert (=> b!1484424 (= res!1009215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484425 () Bool)

(declare-fun res!1009206 () Bool)

(assert (=> b!1484425 (=> (not res!1009206) (not e!832272))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1484425 (= res!1009206 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48571 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48571 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48571 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484426 () Bool)

(declare-fun res!1009202 () Bool)

(assert (=> b!1484426 (=> (not res!1009202) (not e!832272))))

(declare-datatypes ((List!34522 0))(
  ( (Nil!34519) (Cons!34518 (h!35892 (_ BitVec 64)) (t!49216 List!34522)) )
))
(declare-fun arrayNoDuplicates!0 (array!99490 (_ BitVec 32) List!34522) Bool)

(assert (=> b!1484426 (= res!1009202 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34519))))

(declare-fun b!1484427 () Bool)

(declare-fun res!1009203 () Bool)

(assert (=> b!1484427 (=> (not res!1009203) (not e!832272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484427 (= res!1009203 (validKeyInArray!0 (select (arr!48021 a!2862) i!1006)))))

(declare-fun b!1484428 () Bool)

(declare-fun res!1009213 () Bool)

(assert (=> b!1484428 (=> (not res!1009213) (not e!832273))))

(assert (=> b!1484428 (= res!1009213 (= (seekEntryOrOpen!0 (select (arr!48021 a!2862) j!93) a!2862 mask!2687) (Found!12261 j!93)))))

(declare-fun b!1484429 () Bool)

(declare-fun res!1009209 () Bool)

(assert (=> b!1484429 (=> (not res!1009209) (not e!832270))))

(declare-fun e!832274 () Bool)

(assert (=> b!1484429 (= res!1009209 e!832274)))

(declare-fun c!137133 () Bool)

(assert (=> b!1484429 (= c!137133 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1484430 () Bool)

(declare-fun e!832271 () Bool)

(assert (=> b!1484430 (= e!832271 e!832270)))

(declare-fun res!1009219 () Bool)

(assert (=> b!1484430 (=> (not res!1009219) (not e!832270))))

(declare-fun lt!647757 () SeekEntryResult!12261)

(assert (=> b!1484430 (= res!1009219 (= lt!647757 (Intermediate!12261 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99490 (_ BitVec 32)) SeekEntryResult!12261)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484430 (= lt!647757 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647760 mask!2687) lt!647760 lt!647756 mask!2687))))

(assert (=> b!1484430 (= lt!647760 (select (store (arr!48021 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484431 () Bool)

(declare-fun e!832268 () Bool)

(assert (=> b!1484431 (= e!832268 e!832271)))

(declare-fun res!1009214 () Bool)

(assert (=> b!1484431 (=> (not res!1009214) (not e!832271))))

(declare-fun lt!647755 () SeekEntryResult!12261)

(assert (=> b!1484431 (= res!1009214 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48021 a!2862) j!93) mask!2687) (select (arr!48021 a!2862) j!93) a!2862 mask!2687) lt!647755))))

(assert (=> b!1484431 (= lt!647755 (Intermediate!12261 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484432 () Bool)

(declare-fun e!832276 () Bool)

(assert (=> b!1484432 (= e!832273 e!832276)))

(declare-fun res!1009210 () Bool)

(assert (=> b!1484432 (=> res!1009210 e!832276)))

(declare-fun lt!647759 () (_ BitVec 64))

(assert (=> b!1484432 (= res!1009210 (or (and (= (select (arr!48021 a!2862) index!646) lt!647759) (= (select (arr!48021 a!2862) index!646) (select (arr!48021 a!2862) j!93))) (= (select (arr!48021 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484432 (= lt!647759 (select (store (arr!48021 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484433 () Bool)

(declare-fun res!1009218 () Bool)

(assert (=> b!1484433 (=> (not res!1009218) (not e!832272))))

(assert (=> b!1484433 (= res!1009218 (and (= (size!48571 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48571 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48571 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1009216 () Bool)

(assert (=> start!126528 (=> (not res!1009216) (not e!832272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126528 (= res!1009216 (validMask!0 mask!2687))))

(assert (=> start!126528 e!832272))

(assert (=> start!126528 true))

(declare-fun array_inv!37049 (array!99490) Bool)

(assert (=> start!126528 (array_inv!37049 a!2862)))

(declare-fun b!1484434 () Bool)

(assert (=> b!1484434 (= e!832275 true)))

(declare-fun lt!647754 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484434 (= lt!647754 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1484435 () Bool)

(declare-fun res!1009207 () Bool)

(assert (=> b!1484435 (=> (not res!1009207) (not e!832273))))

(assert (=> b!1484435 (= res!1009207 (or (= (select (arr!48021 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48021 a!2862) intermediateBeforeIndex!19) (select (arr!48021 a!2862) j!93))))))

(declare-fun b!1484436 () Bool)

(assert (=> b!1484436 (= e!832276 e!832277)))

(declare-fun res!1009217 () Bool)

(assert (=> b!1484436 (=> (not res!1009217) (not e!832277))))

(assert (=> b!1484436 (= res!1009217 (and (= index!646 intermediateAfterIndex!19) (= lt!647759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484437 () Bool)

(assert (=> b!1484437 (= e!832274 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647760 lt!647756 mask!2687) (seekEntryOrOpen!0 lt!647760 lt!647756 mask!2687)))))

(declare-fun b!1484438 () Bool)

(declare-fun res!1009212 () Bool)

(assert (=> b!1484438 (=> (not res!1009212) (not e!832272))))

(assert (=> b!1484438 (= res!1009212 (validKeyInArray!0 (select (arr!48021 a!2862) j!93)))))

(declare-fun b!1484439 () Bool)

(assert (=> b!1484439 (= e!832274 (= lt!647757 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647760 lt!647756 mask!2687)))))

(declare-fun b!1484440 () Bool)

(declare-fun res!1009201 () Bool)

(assert (=> b!1484440 (=> (not res!1009201) (not e!832270))))

(assert (=> b!1484440 (= res!1009201 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484441 () Bool)

(declare-fun res!1009205 () Bool)

(assert (=> b!1484441 (=> (not res!1009205) (not e!832271))))

(assert (=> b!1484441 (= res!1009205 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48021 a!2862) j!93) a!2862 mask!2687) lt!647755))))

(declare-fun b!1484442 () Bool)

(assert (=> b!1484442 (= e!832272 e!832268)))

(declare-fun res!1009211 () Bool)

(assert (=> b!1484442 (=> (not res!1009211) (not e!832268))))

(assert (=> b!1484442 (= res!1009211 (= (select (store (arr!48021 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484442 (= lt!647756 (array!99491 (store (arr!48021 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48571 a!2862)))))

(assert (= (and start!126528 res!1009216) b!1484433))

(assert (= (and b!1484433 res!1009218) b!1484427))

(assert (= (and b!1484427 res!1009203) b!1484438))

(assert (= (and b!1484438 res!1009212) b!1484424))

(assert (= (and b!1484424 res!1009215) b!1484426))

(assert (= (and b!1484426 res!1009202) b!1484425))

(assert (= (and b!1484425 res!1009206) b!1484442))

(assert (= (and b!1484442 res!1009211) b!1484431))

(assert (= (and b!1484431 res!1009214) b!1484441))

(assert (= (and b!1484441 res!1009205) b!1484430))

(assert (= (and b!1484430 res!1009219) b!1484429))

(assert (= (and b!1484429 c!137133) b!1484439))

(assert (= (and b!1484429 (not c!137133)) b!1484437))

(assert (= (and b!1484429 res!1009209) b!1484440))

(assert (= (and b!1484440 res!1009201) b!1484423))

(assert (= (and b!1484423 res!1009204) b!1484428))

(assert (= (and b!1484428 res!1009213) b!1484435))

(assert (= (and b!1484435 res!1009207) b!1484432))

(assert (= (and b!1484432 (not res!1009210)) b!1484436))

(assert (= (and b!1484436 res!1009217) b!1484422))

(assert (= (and b!1484423 (not res!1009208)) b!1484434))

(declare-fun m!1369733 () Bool)

(assert (=> b!1484426 m!1369733))

(declare-fun m!1369735 () Bool)

(assert (=> b!1484435 m!1369735))

(declare-fun m!1369737 () Bool)

(assert (=> b!1484435 m!1369737))

(declare-fun m!1369739 () Bool)

(assert (=> b!1484434 m!1369739))

(assert (=> b!1484441 m!1369737))

(assert (=> b!1484441 m!1369737))

(declare-fun m!1369741 () Bool)

(assert (=> b!1484441 m!1369741))

(declare-fun m!1369743 () Bool)

(assert (=> b!1484424 m!1369743))

(declare-fun m!1369745 () Bool)

(assert (=> b!1484432 m!1369745))

(assert (=> b!1484432 m!1369737))

(declare-fun m!1369747 () Bool)

(assert (=> b!1484432 m!1369747))

(declare-fun m!1369749 () Bool)

(assert (=> b!1484432 m!1369749))

(assert (=> b!1484428 m!1369737))

(assert (=> b!1484428 m!1369737))

(declare-fun m!1369751 () Bool)

(assert (=> b!1484428 m!1369751))

(declare-fun m!1369753 () Bool)

(assert (=> b!1484427 m!1369753))

(assert (=> b!1484427 m!1369753))

(declare-fun m!1369755 () Bool)

(assert (=> b!1484427 m!1369755))

(assert (=> b!1484442 m!1369747))

(declare-fun m!1369757 () Bool)

(assert (=> b!1484442 m!1369757))

(declare-fun m!1369759 () Bool)

(assert (=> b!1484439 m!1369759))

(declare-fun m!1369761 () Bool)

(assert (=> b!1484423 m!1369761))

(assert (=> b!1484423 m!1369747))

(assert (=> b!1484423 m!1369749))

(assert (=> b!1484423 m!1369745))

(declare-fun m!1369763 () Bool)

(assert (=> b!1484423 m!1369763))

(assert (=> b!1484423 m!1369737))

(assert (=> b!1484438 m!1369737))

(assert (=> b!1484438 m!1369737))

(declare-fun m!1369765 () Bool)

(assert (=> b!1484438 m!1369765))

(declare-fun m!1369767 () Bool)

(assert (=> b!1484437 m!1369767))

(declare-fun m!1369769 () Bool)

(assert (=> b!1484437 m!1369769))

(assert (=> b!1484422 m!1369769))

(assert (=> b!1484422 m!1369767))

(assert (=> b!1484431 m!1369737))

(assert (=> b!1484431 m!1369737))

(declare-fun m!1369771 () Bool)

(assert (=> b!1484431 m!1369771))

(assert (=> b!1484431 m!1369771))

(assert (=> b!1484431 m!1369737))

(declare-fun m!1369773 () Bool)

(assert (=> b!1484431 m!1369773))

(declare-fun m!1369775 () Bool)

(assert (=> b!1484430 m!1369775))

(assert (=> b!1484430 m!1369775))

(declare-fun m!1369777 () Bool)

(assert (=> b!1484430 m!1369777))

(assert (=> b!1484430 m!1369747))

(declare-fun m!1369779 () Bool)

(assert (=> b!1484430 m!1369779))

(declare-fun m!1369781 () Bool)

(assert (=> start!126528 m!1369781))

(declare-fun m!1369783 () Bool)

(assert (=> start!126528 m!1369783))

(check-sat (not b!1484423) (not b!1484430) (not start!126528) (not b!1484427) (not b!1484424) (not b!1484428) (not b!1484437) (not b!1484434) (not b!1484431) (not b!1484441) (not b!1484426) (not b!1484439) (not b!1484422) (not b!1484438))
(check-sat)
