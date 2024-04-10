; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125214 () Bool)

(assert start!125214)

(declare-fun b!1460600 () Bool)

(declare-fun res!990356 () Bool)

(declare-fun e!821242 () Bool)

(assert (=> b!1460600 (=> (not res!990356) (not e!821242))))

(declare-datatypes ((array!98662 0))(
  ( (array!98663 (arr!47619 (Array (_ BitVec 32) (_ BitVec 64))) (size!48169 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98662)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460600 (= res!990356 (validKeyInArray!0 (select (arr!47619 a!2862) j!93)))))

(declare-fun b!1460601 () Bool)

(declare-fun res!990354 () Bool)

(assert (=> b!1460601 (=> (not res!990354) (not e!821242))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98662 (_ BitVec 32)) Bool)

(assert (=> b!1460601 (= res!990354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460602 () Bool)

(declare-fun res!990358 () Bool)

(assert (=> b!1460602 (=> (not res!990358) (not e!821242))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1460602 (= res!990358 (validKeyInArray!0 (select (arr!47619 a!2862) i!1006)))))

(declare-fun b!1460603 () Bool)

(declare-fun res!990359 () Bool)

(assert (=> b!1460603 (=> (not res!990359) (not e!821242))))

(declare-datatypes ((List!34120 0))(
  ( (Nil!34117) (Cons!34116 (h!35466 (_ BitVec 64)) (t!48814 List!34120)) )
))
(declare-fun arrayNoDuplicates!0 (array!98662 (_ BitVec 32) List!34120) Bool)

(assert (=> b!1460603 (= res!990359 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34117))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1460604 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun e!821246 () Bool)

(assert (=> b!1460604 (= e!821246 (not (or (and (= (select (arr!47619 a!2862) index!646) (select (store (arr!47619 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47619 a!2862) index!646) (select (arr!47619 a!2862) j!93))) (= (select (arr!47619 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun e!821245 () Bool)

(assert (=> b!1460604 e!821245))

(declare-fun res!990353 () Bool)

(assert (=> b!1460604 (=> (not res!990353) (not e!821245))))

(assert (=> b!1460604 (= res!990353 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49238 0))(
  ( (Unit!49239) )
))
(declare-fun lt!639869 () Unit!49238)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98662 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49238)

(assert (=> b!1460604 (= lt!639869 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460605 () Bool)

(declare-fun res!990355 () Bool)

(assert (=> b!1460605 (=> (not res!990355) (not e!821242))))

(assert (=> b!1460605 (= res!990355 (and (= (size!48169 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48169 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48169 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460607 () Bool)

(declare-fun res!990366 () Bool)

(assert (=> b!1460607 (=> (not res!990366) (not e!821242))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1460607 (= res!990366 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48169 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48169 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48169 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-datatypes ((SeekEntryResult!11871 0))(
  ( (MissingZero!11871 (index!49876 (_ BitVec 32))) (Found!11871 (index!49877 (_ BitVec 32))) (Intermediate!11871 (undefined!12683 Bool) (index!49878 (_ BitVec 32)) (x!131480 (_ BitVec 32))) (Undefined!11871) (MissingVacant!11871 (index!49879 (_ BitVec 32))) )
))
(declare-fun lt!639870 () SeekEntryResult!11871)

(declare-fun b!1460608 () Bool)

(declare-fun lt!639872 () (_ BitVec 64))

(declare-fun lt!639871 () array!98662)

(declare-fun e!821244 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98662 (_ BitVec 32)) SeekEntryResult!11871)

(assert (=> b!1460608 (= e!821244 (= lt!639870 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639872 lt!639871 mask!2687)))))

(declare-fun b!1460609 () Bool)

(declare-fun res!990361 () Bool)

(assert (=> b!1460609 (=> (not res!990361) (not e!821245))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98662 (_ BitVec 32)) SeekEntryResult!11871)

(assert (=> b!1460609 (= res!990361 (= (seekEntryOrOpen!0 (select (arr!47619 a!2862) j!93) a!2862 mask!2687) (Found!11871 j!93)))))

(declare-fun b!1460610 () Bool)

(declare-fun e!821240 () Bool)

(assert (=> b!1460610 (= e!821242 e!821240)))

(declare-fun res!990363 () Bool)

(assert (=> b!1460610 (=> (not res!990363) (not e!821240))))

(assert (=> b!1460610 (= res!990363 (= (select (store (arr!47619 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1460610 (= lt!639871 (array!98663 (store (arr!47619 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48169 a!2862)))))

(declare-fun b!1460611 () Bool)

(assert (=> b!1460611 (= e!821245 (or (= (select (arr!47619 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47619 a!2862) intermediateBeforeIndex!19) (select (arr!47619 a!2862) j!93))))))

(declare-fun b!1460612 () Bool)

(declare-fun res!990364 () Bool)

(declare-fun e!821241 () Bool)

(assert (=> b!1460612 (=> (not res!990364) (not e!821241))))

(declare-fun lt!639873 () SeekEntryResult!11871)

(assert (=> b!1460612 (= res!990364 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47619 a!2862) j!93) a!2862 mask!2687) lt!639873))))

(declare-fun b!1460613 () Bool)

(declare-fun res!990357 () Bool)

(assert (=> b!1460613 (=> (not res!990357) (not e!821246))))

(assert (=> b!1460613 (= res!990357 e!821244)))

(declare-fun c!134634 () Bool)

(assert (=> b!1460613 (= c!134634 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460606 () Bool)

(declare-fun res!990365 () Bool)

(assert (=> b!1460606 (=> (not res!990365) (not e!821246))))

(assert (=> b!1460606 (= res!990365 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!990362 () Bool)

(assert (=> start!125214 (=> (not res!990362) (not e!821242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125214 (= res!990362 (validMask!0 mask!2687))))

(assert (=> start!125214 e!821242))

(assert (=> start!125214 true))

(declare-fun array_inv!36647 (array!98662) Bool)

(assert (=> start!125214 (array_inv!36647 a!2862)))

(declare-fun b!1460614 () Bool)

(assert (=> b!1460614 (= e!821241 e!821246)))

(declare-fun res!990367 () Bool)

(assert (=> b!1460614 (=> (not res!990367) (not e!821246))))

(assert (=> b!1460614 (= res!990367 (= lt!639870 (Intermediate!11871 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460614 (= lt!639870 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639872 mask!2687) lt!639872 lt!639871 mask!2687))))

(assert (=> b!1460614 (= lt!639872 (select (store (arr!47619 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460615 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98662 (_ BitVec 32)) SeekEntryResult!11871)

(assert (=> b!1460615 (= e!821244 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639872 lt!639871 mask!2687) (seekEntryOrOpen!0 lt!639872 lt!639871 mask!2687)))))

(declare-fun b!1460616 () Bool)

(assert (=> b!1460616 (= e!821240 e!821241)))

(declare-fun res!990360 () Bool)

(assert (=> b!1460616 (=> (not res!990360) (not e!821241))))

(assert (=> b!1460616 (= res!990360 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47619 a!2862) j!93) mask!2687) (select (arr!47619 a!2862) j!93) a!2862 mask!2687) lt!639873))))

(assert (=> b!1460616 (= lt!639873 (Intermediate!11871 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125214 res!990362) b!1460605))

(assert (= (and b!1460605 res!990355) b!1460602))

(assert (= (and b!1460602 res!990358) b!1460600))

(assert (= (and b!1460600 res!990356) b!1460601))

(assert (= (and b!1460601 res!990354) b!1460603))

(assert (= (and b!1460603 res!990359) b!1460607))

(assert (= (and b!1460607 res!990366) b!1460610))

(assert (= (and b!1460610 res!990363) b!1460616))

(assert (= (and b!1460616 res!990360) b!1460612))

(assert (= (and b!1460612 res!990364) b!1460614))

(assert (= (and b!1460614 res!990367) b!1460613))

(assert (= (and b!1460613 c!134634) b!1460608))

(assert (= (and b!1460613 (not c!134634)) b!1460615))

(assert (= (and b!1460613 res!990357) b!1460606))

(assert (= (and b!1460606 res!990365) b!1460604))

(assert (= (and b!1460604 res!990353) b!1460609))

(assert (= (and b!1460609 res!990361) b!1460611))

(declare-fun m!1348275 () Bool)

(assert (=> b!1460601 m!1348275))

(declare-fun m!1348277 () Bool)

(assert (=> b!1460616 m!1348277))

(assert (=> b!1460616 m!1348277))

(declare-fun m!1348279 () Bool)

(assert (=> b!1460616 m!1348279))

(assert (=> b!1460616 m!1348279))

(assert (=> b!1460616 m!1348277))

(declare-fun m!1348281 () Bool)

(assert (=> b!1460616 m!1348281))

(declare-fun m!1348283 () Bool)

(assert (=> b!1460615 m!1348283))

(declare-fun m!1348285 () Bool)

(assert (=> b!1460615 m!1348285))

(assert (=> b!1460609 m!1348277))

(assert (=> b!1460609 m!1348277))

(declare-fun m!1348287 () Bool)

(assert (=> b!1460609 m!1348287))

(declare-fun m!1348289 () Bool)

(assert (=> start!125214 m!1348289))

(declare-fun m!1348291 () Bool)

(assert (=> start!125214 m!1348291))

(declare-fun m!1348293 () Bool)

(assert (=> b!1460608 m!1348293))

(assert (=> b!1460612 m!1348277))

(assert (=> b!1460612 m!1348277))

(declare-fun m!1348295 () Bool)

(assert (=> b!1460612 m!1348295))

(declare-fun m!1348297 () Bool)

(assert (=> b!1460604 m!1348297))

(declare-fun m!1348299 () Bool)

(assert (=> b!1460604 m!1348299))

(declare-fun m!1348301 () Bool)

(assert (=> b!1460604 m!1348301))

(declare-fun m!1348303 () Bool)

(assert (=> b!1460604 m!1348303))

(declare-fun m!1348305 () Bool)

(assert (=> b!1460604 m!1348305))

(assert (=> b!1460604 m!1348277))

(assert (=> b!1460610 m!1348299))

(declare-fun m!1348307 () Bool)

(assert (=> b!1460610 m!1348307))

(declare-fun m!1348309 () Bool)

(assert (=> b!1460611 m!1348309))

(assert (=> b!1460611 m!1348277))

(declare-fun m!1348311 () Bool)

(assert (=> b!1460603 m!1348311))

(declare-fun m!1348313 () Bool)

(assert (=> b!1460614 m!1348313))

(assert (=> b!1460614 m!1348313))

(declare-fun m!1348315 () Bool)

(assert (=> b!1460614 m!1348315))

(assert (=> b!1460614 m!1348299))

(declare-fun m!1348317 () Bool)

(assert (=> b!1460614 m!1348317))

(assert (=> b!1460600 m!1348277))

(assert (=> b!1460600 m!1348277))

(declare-fun m!1348319 () Bool)

(assert (=> b!1460600 m!1348319))

(declare-fun m!1348321 () Bool)

(assert (=> b!1460602 m!1348321))

(assert (=> b!1460602 m!1348321))

(declare-fun m!1348323 () Bool)

(assert (=> b!1460602 m!1348323))

(check-sat (not start!125214) (not b!1460601) (not b!1460609) (not b!1460614) (not b!1460615) (not b!1460616) (not b!1460602) (not b!1460603) (not b!1460600) (not b!1460612) (not b!1460608) (not b!1460604))
(check-sat)
