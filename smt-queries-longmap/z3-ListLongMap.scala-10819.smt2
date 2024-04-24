; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126840 () Bool)

(assert start!126840)

(declare-fun res!1010795 () Bool)

(declare-fun e!833844 () Bool)

(assert (=> start!126840 (=> (not res!1010795) (not e!833844))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126840 (= res!1010795 (validMask!0 mask!2687))))

(assert (=> start!126840 e!833844))

(assert (=> start!126840 true))

(declare-datatypes ((array!99640 0))(
  ( (array!99641 (arr!48091 (Array (_ BitVec 32) (_ BitVec 64))) (size!48642 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99640)

(declare-fun array_inv!37372 (array!99640) Bool)

(assert (=> start!126840 (array_inv!37372 a!2862)))

(declare-fun b!1487201 () Bool)

(declare-fun res!1010781 () Bool)

(declare-fun e!833848 () Bool)

(assert (=> b!1487201 (=> (not res!1010781) (not e!833848))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1487201 (= res!1010781 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1487202 () Bool)

(declare-fun res!1010783 () Bool)

(declare-fun e!833841 () Bool)

(assert (=> b!1487202 (=> (not res!1010783) (not e!833841))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12228 0))(
  ( (MissingZero!12228 (index!51304 (_ BitVec 32))) (Found!12228 (index!51305 (_ BitVec 32))) (Intermediate!12228 (undefined!13040 Bool) (index!51306 (_ BitVec 32)) (x!133065 (_ BitVec 32))) (Undefined!12228) (MissingVacant!12228 (index!51307 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99640 (_ BitVec 32)) SeekEntryResult!12228)

(assert (=> b!1487202 (= res!1010783 (= (seekEntryOrOpen!0 (select (arr!48091 a!2862) j!93) a!2862 mask!2687) (Found!12228 j!93)))))

(declare-fun b!1487203 () Bool)

(declare-fun e!833846 () Bool)

(assert (=> b!1487203 (= e!833841 e!833846)))

(declare-fun res!1010797 () Bool)

(assert (=> b!1487203 (=> res!1010797 e!833846)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!648750 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1487203 (= res!1010797 (or (and (= (select (arr!48091 a!2862) index!646) lt!648750) (= (select (arr!48091 a!2862) index!646) (select (arr!48091 a!2862) j!93))) (= (select (arr!48091 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487203 (= lt!648750 (select (store (arr!48091 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1487204 () Bool)

(declare-fun res!1010796 () Bool)

(assert (=> b!1487204 (=> (not res!1010796) (not e!833844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1487204 (= res!1010796 (validKeyInArray!0 (select (arr!48091 a!2862) j!93)))))

(declare-fun b!1487205 () Bool)

(declare-fun e!833850 () Bool)

(assert (=> b!1487205 (= e!833846 e!833850)))

(declare-fun res!1010798 () Bool)

(assert (=> b!1487205 (=> (not res!1010798) (not e!833850))))

(assert (=> b!1487205 (= res!1010798 (and (= index!646 intermediateAfterIndex!19) (= lt!648750 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487206 () Bool)

(declare-fun res!1010792 () Bool)

(assert (=> b!1487206 (=> (not res!1010792) (not e!833844))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1487206 (= res!1010792 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48642 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48642 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48642 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1487207 () Bool)

(declare-fun e!833843 () Bool)

(assert (=> b!1487207 (= e!833843 e!833848)))

(declare-fun res!1010786 () Bool)

(assert (=> b!1487207 (=> (not res!1010786) (not e!833848))))

(declare-fun lt!648748 () SeekEntryResult!12228)

(assert (=> b!1487207 (= res!1010786 (= lt!648748 (Intermediate!12228 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!648749 () array!99640)

(declare-fun lt!648751 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99640 (_ BitVec 32)) SeekEntryResult!12228)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487207 (= lt!648748 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648751 mask!2687) lt!648751 lt!648749 mask!2687))))

(assert (=> b!1487207 (= lt!648751 (select (store (arr!48091 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1487208 () Bool)

(declare-fun e!833849 () Bool)

(assert (=> b!1487208 (= e!833848 (not e!833849))))

(declare-fun res!1010788 () Bool)

(assert (=> b!1487208 (=> res!1010788 e!833849)))

(assert (=> b!1487208 (= res!1010788 (or (and (= (select (arr!48091 a!2862) index!646) (select (store (arr!48091 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48091 a!2862) index!646) (select (arr!48091 a!2862) j!93))) (= (select (arr!48091 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487208 e!833841))

(declare-fun res!1010794 () Bool)

(assert (=> b!1487208 (=> (not res!1010794) (not e!833841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99640 (_ BitVec 32)) Bool)

(assert (=> b!1487208 (= res!1010794 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49829 0))(
  ( (Unit!49830) )
))
(declare-fun lt!648754 () Unit!49829)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49829)

(assert (=> b!1487208 (= lt!648754 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1487209 () Bool)

(declare-fun res!1010782 () Bool)

(assert (=> b!1487209 (=> (not res!1010782) (not e!833848))))

(declare-fun e!833842 () Bool)

(assert (=> b!1487209 (= res!1010782 e!833842)))

(declare-fun c!137743 () Bool)

(assert (=> b!1487209 (= c!137743 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1487210 () Bool)

(declare-fun res!1010793 () Bool)

(assert (=> b!1487210 (=> (not res!1010793) (not e!833844))))

(assert (=> b!1487210 (= res!1010793 (and (= (size!48642 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48642 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48642 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1487211 () Bool)

(declare-fun e!833847 () Bool)

(assert (=> b!1487211 (= e!833847 e!833843)))

(declare-fun res!1010780 () Bool)

(assert (=> b!1487211 (=> (not res!1010780) (not e!833843))))

(declare-fun lt!648752 () SeekEntryResult!12228)

(assert (=> b!1487211 (= res!1010780 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48091 a!2862) j!93) mask!2687) (select (arr!48091 a!2862) j!93) a!2862 mask!2687) lt!648752))))

(assert (=> b!1487211 (= lt!648752 (Intermediate!12228 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1487212 () Bool)

(declare-fun res!1010787 () Bool)

(assert (=> b!1487212 (=> (not res!1010787) (not e!833844))))

(assert (=> b!1487212 (= res!1010787 (validKeyInArray!0 (select (arr!48091 a!2862) i!1006)))))

(declare-fun b!1487213 () Bool)

(declare-fun res!1010791 () Bool)

(assert (=> b!1487213 (=> (not res!1010791) (not e!833844))))

(declare-datatypes ((List!34579 0))(
  ( (Nil!34576) (Cons!34575 (h!35963 (_ BitVec 64)) (t!49265 List!34579)) )
))
(declare-fun arrayNoDuplicates!0 (array!99640 (_ BitVec 32) List!34579) Bool)

(assert (=> b!1487213 (= res!1010791 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34576))))

(declare-fun b!1487214 () Bool)

(declare-fun res!1010784 () Bool)

(assert (=> b!1487214 (=> (not res!1010784) (not e!833843))))

(assert (=> b!1487214 (= res!1010784 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48091 a!2862) j!93) a!2862 mask!2687) lt!648752))))

(declare-fun b!1487215 () Bool)

(assert (=> b!1487215 (= e!833842 (= lt!648748 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648751 lt!648749 mask!2687)))))

(declare-fun b!1487216 () Bool)

(declare-fun res!1010785 () Bool)

(assert (=> b!1487216 (=> (not res!1010785) (not e!833841))))

(assert (=> b!1487216 (= res!1010785 (or (= (select (arr!48091 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48091 a!2862) intermediateBeforeIndex!19) (select (arr!48091 a!2862) j!93))))))

(declare-fun b!1487217 () Bool)

(assert (=> b!1487217 (= e!833844 e!833847)))

(declare-fun res!1010789 () Bool)

(assert (=> b!1487217 (=> (not res!1010789) (not e!833847))))

(assert (=> b!1487217 (= res!1010789 (= (select (store (arr!48091 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487217 (= lt!648749 (array!99641 (store (arr!48091 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48642 a!2862)))))

(declare-fun b!1487218 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99640 (_ BitVec 32)) SeekEntryResult!12228)

(assert (=> b!1487218 (= e!833850 (= (seekEntryOrOpen!0 lt!648751 lt!648749 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648751 lt!648749 mask!2687)))))

(declare-fun b!1487219 () Bool)

(declare-fun res!1010790 () Bool)

(assert (=> b!1487219 (=> (not res!1010790) (not e!833844))))

(assert (=> b!1487219 (= res!1010790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1487220 () Bool)

(assert (=> b!1487220 (= e!833849 true)))

(declare-fun lt!648753 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487220 (= lt!648753 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1487221 () Bool)

(assert (=> b!1487221 (= e!833842 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648751 lt!648749 mask!2687) (seekEntryOrOpen!0 lt!648751 lt!648749 mask!2687)))))

(assert (= (and start!126840 res!1010795) b!1487210))

(assert (= (and b!1487210 res!1010793) b!1487212))

(assert (= (and b!1487212 res!1010787) b!1487204))

(assert (= (and b!1487204 res!1010796) b!1487219))

(assert (= (and b!1487219 res!1010790) b!1487213))

(assert (= (and b!1487213 res!1010791) b!1487206))

(assert (= (and b!1487206 res!1010792) b!1487217))

(assert (= (and b!1487217 res!1010789) b!1487211))

(assert (= (and b!1487211 res!1010780) b!1487214))

(assert (= (and b!1487214 res!1010784) b!1487207))

(assert (= (and b!1487207 res!1010786) b!1487209))

(assert (= (and b!1487209 c!137743) b!1487215))

(assert (= (and b!1487209 (not c!137743)) b!1487221))

(assert (= (and b!1487209 res!1010782) b!1487201))

(assert (= (and b!1487201 res!1010781) b!1487208))

(assert (= (and b!1487208 res!1010794) b!1487202))

(assert (= (and b!1487202 res!1010783) b!1487216))

(assert (= (and b!1487216 res!1010785) b!1487203))

(assert (= (and b!1487203 (not res!1010797)) b!1487205))

(assert (= (and b!1487205 res!1010798) b!1487218))

(assert (= (and b!1487208 (not res!1010788)) b!1487220))

(declare-fun m!1372303 () Bool)

(assert (=> b!1487219 m!1372303))

(declare-fun m!1372305 () Bool)

(assert (=> b!1487204 m!1372305))

(assert (=> b!1487204 m!1372305))

(declare-fun m!1372307 () Bool)

(assert (=> b!1487204 m!1372307))

(declare-fun m!1372309 () Bool)

(assert (=> b!1487208 m!1372309))

(declare-fun m!1372311 () Bool)

(assert (=> b!1487208 m!1372311))

(declare-fun m!1372313 () Bool)

(assert (=> b!1487208 m!1372313))

(declare-fun m!1372315 () Bool)

(assert (=> b!1487208 m!1372315))

(declare-fun m!1372317 () Bool)

(assert (=> b!1487208 m!1372317))

(assert (=> b!1487208 m!1372305))

(declare-fun m!1372319 () Bool)

(assert (=> b!1487221 m!1372319))

(declare-fun m!1372321 () Bool)

(assert (=> b!1487221 m!1372321))

(declare-fun m!1372323 () Bool)

(assert (=> b!1487220 m!1372323))

(assert (=> b!1487214 m!1372305))

(assert (=> b!1487214 m!1372305))

(declare-fun m!1372325 () Bool)

(assert (=> b!1487214 m!1372325))

(declare-fun m!1372327 () Bool)

(assert (=> b!1487213 m!1372327))

(assert (=> b!1487217 m!1372311))

(declare-fun m!1372329 () Bool)

(assert (=> b!1487217 m!1372329))

(declare-fun m!1372331 () Bool)

(assert (=> b!1487215 m!1372331))

(assert (=> b!1487202 m!1372305))

(assert (=> b!1487202 m!1372305))

(declare-fun m!1372333 () Bool)

(assert (=> b!1487202 m!1372333))

(assert (=> b!1487211 m!1372305))

(assert (=> b!1487211 m!1372305))

(declare-fun m!1372335 () Bool)

(assert (=> b!1487211 m!1372335))

(assert (=> b!1487211 m!1372335))

(assert (=> b!1487211 m!1372305))

(declare-fun m!1372337 () Bool)

(assert (=> b!1487211 m!1372337))

(declare-fun m!1372339 () Bool)

(assert (=> start!126840 m!1372339))

(declare-fun m!1372341 () Bool)

(assert (=> start!126840 m!1372341))

(assert (=> b!1487203 m!1372315))

(assert (=> b!1487203 m!1372305))

(assert (=> b!1487203 m!1372311))

(assert (=> b!1487203 m!1372313))

(declare-fun m!1372343 () Bool)

(assert (=> b!1487216 m!1372343))

(assert (=> b!1487216 m!1372305))

(declare-fun m!1372345 () Bool)

(assert (=> b!1487207 m!1372345))

(assert (=> b!1487207 m!1372345))

(declare-fun m!1372347 () Bool)

(assert (=> b!1487207 m!1372347))

(assert (=> b!1487207 m!1372311))

(declare-fun m!1372349 () Bool)

(assert (=> b!1487207 m!1372349))

(declare-fun m!1372351 () Bool)

(assert (=> b!1487212 m!1372351))

(assert (=> b!1487212 m!1372351))

(declare-fun m!1372353 () Bool)

(assert (=> b!1487212 m!1372353))

(assert (=> b!1487218 m!1372321))

(assert (=> b!1487218 m!1372319))

(check-sat (not start!126840) (not b!1487213) (not b!1487221) (not b!1487207) (not b!1487212) (not b!1487208) (not b!1487218) (not b!1487219) (not b!1487220) (not b!1487214) (not b!1487211) (not b!1487215) (not b!1487204) (not b!1487202))
(check-sat)
