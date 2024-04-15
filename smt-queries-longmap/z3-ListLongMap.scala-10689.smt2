; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125242 () Bool)

(assert start!125242)

(declare-fun b!1462254 () Bool)

(declare-fun e!821961 () Bool)

(assert (=> b!1462254 (= e!821961 true)))

(declare-fun lt!640218 () Bool)

(declare-fun e!821963 () Bool)

(assert (=> b!1462254 (= lt!640218 e!821963)))

(declare-fun c!134740 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1462254 (= c!134740 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462255 () Bool)

(declare-fun res!991812 () Bool)

(declare-fun e!821964 () Bool)

(assert (=> b!1462255 (=> (not res!991812) (not e!821964))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98668 0))(
  ( (array!98669 (arr!47623 (Array (_ BitVec 32) (_ BitVec 64))) (size!48175 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98668)

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1462255 (= res!991812 (and (= (size!48175 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48175 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48175 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462256 () Bool)

(declare-fun e!821957 () Bool)

(assert (=> b!1462256 (= e!821964 e!821957)))

(declare-fun res!991802 () Bool)

(assert (=> b!1462256 (=> (not res!991802) (not e!821957))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1462256 (= res!991802 (= (select (store (arr!47623 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!640220 () array!98668)

(assert (=> b!1462256 (= lt!640220 (array!98669 (store (arr!47623 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48175 a!2862)))))

(declare-datatypes ((SeekEntryResult!11900 0))(
  ( (MissingZero!11900 (index!49992 (_ BitVec 32))) (Found!11900 (index!49993 (_ BitVec 32))) (Intermediate!11900 (undefined!12712 Bool) (index!49994 (_ BitVec 32)) (x!131584 (_ BitVec 32))) (Undefined!11900) (MissingVacant!11900 (index!49995 (_ BitVec 32))) )
))
(declare-fun lt!640223 () SeekEntryResult!11900)

(declare-fun b!1462257 () Bool)

(declare-fun e!821956 () Bool)

(declare-fun lt!640222 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98668 (_ BitVec 32)) SeekEntryResult!11900)

(assert (=> b!1462257 (= e!821956 (= lt!640223 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640222 lt!640220 mask!2687)))))

(declare-fun b!1462258 () Bool)

(declare-fun res!991803 () Bool)

(declare-fun e!821960 () Bool)

(assert (=> b!1462258 (=> (not res!991803) (not e!821960))))

(assert (=> b!1462258 (= res!991803 e!821956)))

(declare-fun c!134739 () Bool)

(assert (=> b!1462258 (= c!134739 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462259 () Bool)

(declare-fun res!991808 () Bool)

(assert (=> b!1462259 (=> (not res!991808) (not e!821960))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1462259 (= res!991808 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462260 () Bool)

(declare-fun res!991816 () Bool)

(declare-fun e!821958 () Bool)

(assert (=> b!1462260 (=> (not res!991816) (not e!821958))))

(declare-fun lt!640219 () SeekEntryResult!11900)

(assert (=> b!1462260 (= res!991816 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47623 a!2862) j!93) a!2862 mask!2687) lt!640219))))

(declare-fun b!1462261 () Bool)

(assert (=> b!1462261 (= e!821957 e!821958)))

(declare-fun res!991810 () Bool)

(assert (=> b!1462261 (=> (not res!991810) (not e!821958))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462261 (= res!991810 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47623 a!2862) j!93) mask!2687) (select (arr!47623 a!2862) j!93) a!2862 mask!2687) lt!640219))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1462261 (= lt!640219 (Intermediate!11900 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462262 () Bool)

(declare-fun e!821962 () Bool)

(assert (=> b!1462262 (= e!821962 e!821961)))

(declare-fun res!991806 () Bool)

(assert (=> b!1462262 (=> res!991806 e!821961)))

(declare-fun lt!640224 () (_ BitVec 32))

(assert (=> b!1462262 (= res!991806 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640224 #b00000000000000000000000000000000) (bvsge lt!640224 (size!48175 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462262 (= lt!640224 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1462263 () Bool)

(declare-fun res!991814 () Bool)

(assert (=> b!1462263 (=> res!991814 e!821961)))

(assert (=> b!1462263 (= res!991814 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640224 (select (arr!47623 a!2862) j!93) a!2862 mask!2687) lt!640219)))))

(declare-fun b!1462264 () Bool)

(declare-fun res!991804 () Bool)

(assert (=> b!1462264 (=> (not res!991804) (not e!821964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462264 (= res!991804 (validKeyInArray!0 (select (arr!47623 a!2862) i!1006)))))

(declare-fun e!821959 () Bool)

(declare-fun b!1462265 () Bool)

(assert (=> b!1462265 (= e!821959 (or (= (select (arr!47623 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47623 a!2862) intermediateBeforeIndex!19) (select (arr!47623 a!2862) j!93))))))

(declare-fun b!1462266 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98668 (_ BitVec 32)) SeekEntryResult!11900)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98668 (_ BitVec 32)) SeekEntryResult!11900)

(assert (=> b!1462266 (= e!821963 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640224 intermediateAfterIndex!19 lt!640222 lt!640220 mask!2687) (seekEntryOrOpen!0 lt!640222 lt!640220 mask!2687))))))

(declare-fun b!1462267 () Bool)

(assert (=> b!1462267 (= e!821956 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640222 lt!640220 mask!2687) (seekEntryOrOpen!0 lt!640222 lt!640220 mask!2687)))))

(declare-fun b!1462268 () Bool)

(assert (=> b!1462268 (= e!821960 (not e!821962))))

(declare-fun res!991818 () Bool)

(assert (=> b!1462268 (=> res!991818 e!821962)))

(assert (=> b!1462268 (= res!991818 (or (and (= (select (arr!47623 a!2862) index!646) (select (store (arr!47623 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47623 a!2862) index!646) (select (arr!47623 a!2862) j!93))) (= (select (arr!47623 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1462268 e!821959))

(declare-fun res!991815 () Bool)

(assert (=> b!1462268 (=> (not res!991815) (not e!821959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98668 (_ BitVec 32)) Bool)

(assert (=> b!1462268 (= res!991815 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49137 0))(
  ( (Unit!49138) )
))
(declare-fun lt!640221 () Unit!49137)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98668 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49137)

(assert (=> b!1462268 (= lt!640221 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1462269 () Bool)

(declare-fun res!991805 () Bool)

(assert (=> b!1462269 (=> (not res!991805) (not e!821964))))

(declare-datatypes ((List!34202 0))(
  ( (Nil!34199) (Cons!34198 (h!35548 (_ BitVec 64)) (t!48888 List!34202)) )
))
(declare-fun arrayNoDuplicates!0 (array!98668 (_ BitVec 32) List!34202) Bool)

(assert (=> b!1462269 (= res!991805 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34199))))

(declare-fun b!1462270 () Bool)

(declare-fun res!991817 () Bool)

(assert (=> b!1462270 (=> (not res!991817) (not e!821964))))

(assert (=> b!1462270 (= res!991817 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48175 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48175 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48175 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462271 () Bool)

(declare-fun res!991813 () Bool)

(assert (=> b!1462271 (=> (not res!991813) (not e!821964))))

(assert (=> b!1462271 (= res!991813 (validKeyInArray!0 (select (arr!47623 a!2862) j!93)))))

(declare-fun b!1462272 () Bool)

(assert (=> b!1462272 (= e!821958 e!821960)))

(declare-fun res!991811 () Bool)

(assert (=> b!1462272 (=> (not res!991811) (not e!821960))))

(assert (=> b!1462272 (= res!991811 (= lt!640223 (Intermediate!11900 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1462272 (= lt!640223 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640222 mask!2687) lt!640222 lt!640220 mask!2687))))

(assert (=> b!1462272 (= lt!640222 (select (store (arr!47623 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1462273 () Bool)

(assert (=> b!1462273 (= e!821963 (not (= lt!640223 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640224 lt!640222 lt!640220 mask!2687))))))

(declare-fun b!1462274 () Bool)

(declare-fun res!991807 () Bool)

(assert (=> b!1462274 (=> (not res!991807) (not e!821959))))

(assert (=> b!1462274 (= res!991807 (= (seekEntryOrOpen!0 (select (arr!47623 a!2862) j!93) a!2862 mask!2687) (Found!11900 j!93)))))

(declare-fun res!991809 () Bool)

(assert (=> start!125242 (=> (not res!991809) (not e!821964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125242 (= res!991809 (validMask!0 mask!2687))))

(assert (=> start!125242 e!821964))

(assert (=> start!125242 true))

(declare-fun array_inv!36856 (array!98668) Bool)

(assert (=> start!125242 (array_inv!36856 a!2862)))

(declare-fun b!1462275 () Bool)

(declare-fun res!991819 () Bool)

(assert (=> b!1462275 (=> (not res!991819) (not e!821964))))

(assert (=> b!1462275 (= res!991819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125242 res!991809) b!1462255))

(assert (= (and b!1462255 res!991812) b!1462264))

(assert (= (and b!1462264 res!991804) b!1462271))

(assert (= (and b!1462271 res!991813) b!1462275))

(assert (= (and b!1462275 res!991819) b!1462269))

(assert (= (and b!1462269 res!991805) b!1462270))

(assert (= (and b!1462270 res!991817) b!1462256))

(assert (= (and b!1462256 res!991802) b!1462261))

(assert (= (and b!1462261 res!991810) b!1462260))

(assert (= (and b!1462260 res!991816) b!1462272))

(assert (= (and b!1462272 res!991811) b!1462258))

(assert (= (and b!1462258 c!134739) b!1462257))

(assert (= (and b!1462258 (not c!134739)) b!1462267))

(assert (= (and b!1462258 res!991803) b!1462259))

(assert (= (and b!1462259 res!991808) b!1462268))

(assert (= (and b!1462268 res!991815) b!1462274))

(assert (= (and b!1462274 res!991807) b!1462265))

(assert (= (and b!1462268 (not res!991818)) b!1462262))

(assert (= (and b!1462262 (not res!991806)) b!1462263))

(assert (= (and b!1462263 (not res!991814)) b!1462254))

(assert (= (and b!1462254 c!134740) b!1462273))

(assert (= (and b!1462254 (not c!134740)) b!1462266))

(declare-fun m!1349229 () Bool)

(assert (=> b!1462265 m!1349229))

(declare-fun m!1349231 () Bool)

(assert (=> b!1462265 m!1349231))

(assert (=> b!1462260 m!1349231))

(assert (=> b!1462260 m!1349231))

(declare-fun m!1349233 () Bool)

(assert (=> b!1462260 m!1349233))

(declare-fun m!1349235 () Bool)

(assert (=> b!1462264 m!1349235))

(assert (=> b!1462264 m!1349235))

(declare-fun m!1349237 () Bool)

(assert (=> b!1462264 m!1349237))

(assert (=> b!1462274 m!1349231))

(assert (=> b!1462274 m!1349231))

(declare-fun m!1349239 () Bool)

(assert (=> b!1462274 m!1349239))

(declare-fun m!1349241 () Bool)

(assert (=> b!1462267 m!1349241))

(declare-fun m!1349243 () Bool)

(assert (=> b!1462267 m!1349243))

(declare-fun m!1349245 () Bool)

(assert (=> b!1462256 m!1349245))

(declare-fun m!1349247 () Bool)

(assert (=> b!1462256 m!1349247))

(assert (=> b!1462263 m!1349231))

(assert (=> b!1462263 m!1349231))

(declare-fun m!1349249 () Bool)

(assert (=> b!1462263 m!1349249))

(declare-fun m!1349251 () Bool)

(assert (=> b!1462262 m!1349251))

(assert (=> b!1462271 m!1349231))

(assert (=> b!1462271 m!1349231))

(declare-fun m!1349253 () Bool)

(assert (=> b!1462271 m!1349253))

(assert (=> b!1462261 m!1349231))

(assert (=> b!1462261 m!1349231))

(declare-fun m!1349255 () Bool)

(assert (=> b!1462261 m!1349255))

(assert (=> b!1462261 m!1349255))

(assert (=> b!1462261 m!1349231))

(declare-fun m!1349257 () Bool)

(assert (=> b!1462261 m!1349257))

(declare-fun m!1349259 () Bool)

(assert (=> b!1462275 m!1349259))

(declare-fun m!1349261 () Bool)

(assert (=> start!125242 m!1349261))

(declare-fun m!1349263 () Bool)

(assert (=> start!125242 m!1349263))

(declare-fun m!1349265 () Bool)

(assert (=> b!1462272 m!1349265))

(assert (=> b!1462272 m!1349265))

(declare-fun m!1349267 () Bool)

(assert (=> b!1462272 m!1349267))

(assert (=> b!1462272 m!1349245))

(declare-fun m!1349269 () Bool)

(assert (=> b!1462272 m!1349269))

(declare-fun m!1349271 () Bool)

(assert (=> b!1462273 m!1349271))

(declare-fun m!1349273 () Bool)

(assert (=> b!1462268 m!1349273))

(assert (=> b!1462268 m!1349245))

(declare-fun m!1349275 () Bool)

(assert (=> b!1462268 m!1349275))

(declare-fun m!1349277 () Bool)

(assert (=> b!1462268 m!1349277))

(declare-fun m!1349279 () Bool)

(assert (=> b!1462268 m!1349279))

(assert (=> b!1462268 m!1349231))

(declare-fun m!1349281 () Bool)

(assert (=> b!1462257 m!1349281))

(declare-fun m!1349283 () Bool)

(assert (=> b!1462266 m!1349283))

(assert (=> b!1462266 m!1349243))

(declare-fun m!1349285 () Bool)

(assert (=> b!1462269 m!1349285))

(check-sat (not b!1462260) (not b!1462266) (not b!1462257) (not b!1462263) (not b!1462262) (not b!1462273) (not b!1462269) (not b!1462261) (not b!1462275) (not b!1462271) (not b!1462272) (not b!1462264) (not start!125242) (not b!1462274) (not b!1462268) (not b!1462267))
(check-sat)
