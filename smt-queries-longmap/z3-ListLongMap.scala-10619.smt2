; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124854 () Bool)

(assert start!124854)

(declare-fun b!1449567 () Bool)

(declare-fun res!981004 () Bool)

(declare-fun e!816313 () Bool)

(assert (=> b!1449567 (=> (not res!981004) (not e!816313))))

(declare-datatypes ((array!98302 0))(
  ( (array!98303 (arr!47439 (Array (_ BitVec 32) (_ BitVec 64))) (size!47989 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98302)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449567 (= res!981004 (validKeyInArray!0 (select (arr!47439 a!2862) j!93)))))

(declare-fun b!1449568 () Bool)

(declare-fun res!981007 () Bool)

(declare-fun e!816309 () Bool)

(assert (=> b!1449568 (=> (not res!981007) (not e!816309))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11691 0))(
  ( (MissingZero!11691 (index!49156 (_ BitVec 32))) (Found!11691 (index!49157 (_ BitVec 32))) (Intermediate!11691 (undefined!12503 Bool) (index!49158 (_ BitVec 32)) (x!130820 (_ BitVec 32))) (Undefined!11691) (MissingVacant!11691 (index!49159 (_ BitVec 32))) )
))
(declare-fun lt!635947 () SeekEntryResult!11691)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98302 (_ BitVec 32)) SeekEntryResult!11691)

(assert (=> b!1449568 (= res!981007 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47439 a!2862) j!93) a!2862 mask!2687) lt!635947))))

(declare-fun b!1449569 () Bool)

(declare-fun e!816307 () Bool)

(assert (=> b!1449569 (= e!816309 e!816307)))

(declare-fun res!981006 () Bool)

(assert (=> b!1449569 (=> (not res!981006) (not e!816307))))

(declare-fun lt!635951 () SeekEntryResult!11691)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1449569 (= res!981006 (= lt!635951 (Intermediate!11691 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635950 () array!98302)

(declare-fun lt!635948 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449569 (= lt!635951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635948 mask!2687) lt!635948 lt!635950 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1449569 (= lt!635948 (select (store (arr!47439 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449570 () Bool)

(declare-fun e!816308 () Bool)

(declare-fun e!816310 () Bool)

(assert (=> b!1449570 (= e!816308 e!816310)))

(declare-fun res!981003 () Bool)

(assert (=> b!1449570 (=> (not res!981003) (not e!816310))))

(declare-fun lt!635946 () SeekEntryResult!11691)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98302 (_ BitVec 32)) SeekEntryResult!11691)

(assert (=> b!1449570 (= res!981003 (= lt!635946 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47439 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449571 () Bool)

(declare-fun e!816305 () Bool)

(assert (=> b!1449571 (= e!816305 (= lt!635951 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635948 lt!635950 mask!2687)))))

(declare-fun b!1449572 () Bool)

(declare-fun res!980998 () Bool)

(assert (=> b!1449572 (=> (not res!980998) (not e!816313))))

(assert (=> b!1449572 (= res!980998 (validKeyInArray!0 (select (arr!47439 a!2862) i!1006)))))

(declare-fun b!1449573 () Bool)

(declare-fun res!980995 () Bool)

(assert (=> b!1449573 (=> (not res!980995) (not e!816313))))

(declare-datatypes ((List!33940 0))(
  ( (Nil!33937) (Cons!33936 (h!35286 (_ BitVec 64)) (t!48634 List!33940)) )
))
(declare-fun arrayNoDuplicates!0 (array!98302 (_ BitVec 32) List!33940) Bool)

(assert (=> b!1449573 (= res!980995 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33937))))

(declare-fun res!980994 () Bool)

(assert (=> start!124854 (=> (not res!980994) (not e!816313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124854 (= res!980994 (validMask!0 mask!2687))))

(assert (=> start!124854 e!816313))

(assert (=> start!124854 true))

(declare-fun array_inv!36467 (array!98302) Bool)

(assert (=> start!124854 (array_inv!36467 a!2862)))

(declare-fun b!1449574 () Bool)

(declare-fun e!816314 () Bool)

(assert (=> b!1449574 (= e!816314 e!816308)))

(declare-fun res!981010 () Bool)

(assert (=> b!1449574 (=> res!981010 e!816308)))

(assert (=> b!1449574 (= res!981010 (or (and (= (select (arr!47439 a!2862) index!646) (select (store (arr!47439 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47439 a!2862) index!646) (select (arr!47439 a!2862) j!93))) (not (= (select (arr!47439 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449575 () Bool)

(declare-fun e!816306 () Bool)

(assert (=> b!1449575 (= e!816306 true)))

(declare-fun lt!635949 () SeekEntryResult!11691)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1449575 (= lt!635949 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47439 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1449576 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98302 (_ BitVec 32)) SeekEntryResult!11691)

(assert (=> b!1449576 (= e!816305 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635948 lt!635950 mask!2687) (seekEntryOrOpen!0 lt!635948 lt!635950 mask!2687)))))

(declare-fun b!1449577 () Bool)

(declare-fun res!981000 () Bool)

(assert (=> b!1449577 (=> (not res!981000) (not e!816307))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1449577 (= res!981000 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449578 () Bool)

(declare-fun res!981002 () Bool)

(assert (=> b!1449578 (=> (not res!981002) (not e!816313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98302 (_ BitVec 32)) Bool)

(assert (=> b!1449578 (= res!981002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1449579 () Bool)

(declare-fun res!981001 () Bool)

(assert (=> b!1449579 (=> (not res!981001) (not e!816307))))

(assert (=> b!1449579 (= res!981001 e!816305)))

(declare-fun c!133797 () Bool)

(assert (=> b!1449579 (= c!133797 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449580 () Bool)

(declare-fun e!816312 () Bool)

(assert (=> b!1449580 (= e!816312 e!816309)))

(declare-fun res!980999 () Bool)

(assert (=> b!1449580 (=> (not res!980999) (not e!816309))))

(assert (=> b!1449580 (= res!980999 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47439 a!2862) j!93) mask!2687) (select (arr!47439 a!2862) j!93) a!2862 mask!2687) lt!635947))))

(assert (=> b!1449580 (= lt!635947 (Intermediate!11691 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449581 () Bool)

(declare-fun res!980996 () Bool)

(assert (=> b!1449581 (=> (not res!980996) (not e!816313))))

(assert (=> b!1449581 (= res!980996 (and (= (size!47989 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47989 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47989 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449582 () Bool)

(declare-fun res!980997 () Bool)

(assert (=> b!1449582 (=> (not res!980997) (not e!816313))))

(assert (=> b!1449582 (= res!980997 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47989 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47989 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47989 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449583 () Bool)

(assert (=> b!1449583 (= e!816307 (not e!816306))))

(declare-fun res!981009 () Bool)

(assert (=> b!1449583 (=> res!981009 e!816306)))

(assert (=> b!1449583 (= res!981009 (or (and (= (select (arr!47439 a!2862) index!646) (select (store (arr!47439 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47439 a!2862) index!646) (select (arr!47439 a!2862) j!93))) (not (= (select (arr!47439 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47439 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1449583 e!816314))

(declare-fun res!981008 () Bool)

(assert (=> b!1449583 (=> (not res!981008) (not e!816314))))

(assert (=> b!1449583 (= res!981008 (and (= lt!635946 (Found!11691 j!93)) (or (= (select (arr!47439 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47439 a!2862) intermediateBeforeIndex!19) (select (arr!47439 a!2862) j!93)))))))

(assert (=> b!1449583 (= lt!635946 (seekEntryOrOpen!0 (select (arr!47439 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1449583 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48878 0))(
  ( (Unit!48879) )
))
(declare-fun lt!635952 () Unit!48878)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48878)

(assert (=> b!1449583 (= lt!635952 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449584 () Bool)

(assert (=> b!1449584 (= e!816313 e!816312)))

(declare-fun res!981005 () Bool)

(assert (=> b!1449584 (=> (not res!981005) (not e!816312))))

(assert (=> b!1449584 (= res!981005 (= (select (store (arr!47439 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449584 (= lt!635950 (array!98303 (store (arr!47439 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47989 a!2862)))))

(declare-fun b!1449585 () Bool)

(assert (=> b!1449585 (= e!816310 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!124854 res!980994) b!1449581))

(assert (= (and b!1449581 res!980996) b!1449572))

(assert (= (and b!1449572 res!980998) b!1449567))

(assert (= (and b!1449567 res!981004) b!1449578))

(assert (= (and b!1449578 res!981002) b!1449573))

(assert (= (and b!1449573 res!980995) b!1449582))

(assert (= (and b!1449582 res!980997) b!1449584))

(assert (= (and b!1449584 res!981005) b!1449580))

(assert (= (and b!1449580 res!980999) b!1449568))

(assert (= (and b!1449568 res!981007) b!1449569))

(assert (= (and b!1449569 res!981006) b!1449579))

(assert (= (and b!1449579 c!133797) b!1449571))

(assert (= (and b!1449579 (not c!133797)) b!1449576))

(assert (= (and b!1449579 res!981001) b!1449577))

(assert (= (and b!1449577 res!981000) b!1449583))

(assert (= (and b!1449583 res!981008) b!1449574))

(assert (= (and b!1449574 (not res!981010)) b!1449570))

(assert (= (and b!1449570 res!981003) b!1449585))

(assert (= (and b!1449583 (not res!981009)) b!1449575))

(declare-fun m!1338271 () Bool)

(assert (=> b!1449584 m!1338271))

(declare-fun m!1338273 () Bool)

(assert (=> b!1449584 m!1338273))

(declare-fun m!1338275 () Bool)

(assert (=> b!1449572 m!1338275))

(assert (=> b!1449572 m!1338275))

(declare-fun m!1338277 () Bool)

(assert (=> b!1449572 m!1338277))

(declare-fun m!1338279 () Bool)

(assert (=> b!1449568 m!1338279))

(assert (=> b!1449568 m!1338279))

(declare-fun m!1338281 () Bool)

(assert (=> b!1449568 m!1338281))

(assert (=> b!1449575 m!1338279))

(assert (=> b!1449575 m!1338279))

(declare-fun m!1338283 () Bool)

(assert (=> b!1449575 m!1338283))

(declare-fun m!1338285 () Bool)

(assert (=> start!124854 m!1338285))

(declare-fun m!1338287 () Bool)

(assert (=> start!124854 m!1338287))

(declare-fun m!1338289 () Bool)

(assert (=> b!1449574 m!1338289))

(assert (=> b!1449574 m!1338271))

(declare-fun m!1338291 () Bool)

(assert (=> b!1449574 m!1338291))

(assert (=> b!1449574 m!1338279))

(declare-fun m!1338293 () Bool)

(assert (=> b!1449573 m!1338293))

(declare-fun m!1338295 () Bool)

(assert (=> b!1449576 m!1338295))

(declare-fun m!1338297 () Bool)

(assert (=> b!1449576 m!1338297))

(declare-fun m!1338299 () Bool)

(assert (=> b!1449583 m!1338299))

(assert (=> b!1449583 m!1338271))

(declare-fun m!1338301 () Bool)

(assert (=> b!1449583 m!1338301))

(assert (=> b!1449583 m!1338291))

(assert (=> b!1449583 m!1338289))

(assert (=> b!1449583 m!1338279))

(declare-fun m!1338303 () Bool)

(assert (=> b!1449583 m!1338303))

(declare-fun m!1338305 () Bool)

(assert (=> b!1449583 m!1338305))

(assert (=> b!1449583 m!1338279))

(assert (=> b!1449567 m!1338279))

(assert (=> b!1449567 m!1338279))

(declare-fun m!1338307 () Bool)

(assert (=> b!1449567 m!1338307))

(declare-fun m!1338309 () Bool)

(assert (=> b!1449578 m!1338309))

(declare-fun m!1338311 () Bool)

(assert (=> b!1449571 m!1338311))

(assert (=> b!1449570 m!1338279))

(assert (=> b!1449570 m!1338279))

(declare-fun m!1338313 () Bool)

(assert (=> b!1449570 m!1338313))

(assert (=> b!1449580 m!1338279))

(assert (=> b!1449580 m!1338279))

(declare-fun m!1338315 () Bool)

(assert (=> b!1449580 m!1338315))

(assert (=> b!1449580 m!1338315))

(assert (=> b!1449580 m!1338279))

(declare-fun m!1338317 () Bool)

(assert (=> b!1449580 m!1338317))

(declare-fun m!1338319 () Bool)

(assert (=> b!1449569 m!1338319))

(assert (=> b!1449569 m!1338319))

(declare-fun m!1338321 () Bool)

(assert (=> b!1449569 m!1338321))

(assert (=> b!1449569 m!1338271))

(declare-fun m!1338323 () Bool)

(assert (=> b!1449569 m!1338323))

(check-sat (not b!1449583) (not b!1449580) (not b!1449573) (not b!1449567) (not b!1449570) (not start!124854) (not b!1449576) (not b!1449569) (not b!1449578) (not b!1449571) (not b!1449568) (not b!1449575) (not b!1449572))
(check-sat)
