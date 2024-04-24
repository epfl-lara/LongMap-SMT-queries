; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124154 () Bool)

(assert start!124154)

(declare-fun b!1437268 () Bool)

(declare-fun res!969424 () Bool)

(declare-fun e!811208 () Bool)

(assert (=> b!1437268 (=> (not res!969424) (not e!811208))))

(declare-datatypes ((array!97759 0))(
  ( (array!97760 (arr!47176 (Array (_ BitVec 32) (_ BitVec 64))) (size!47727 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97759)

(assert (=> b!1437268 (= res!969424 (and (bvsle #b00000000000000000000000000000000 (size!47727 a!2862)) (bvslt (size!47727 a!2862) #b01111111111111111111111111111111)))))

(declare-fun b!1437269 () Bool)

(declare-fun res!969423 () Bool)

(assert (=> b!1437269 (=> (not res!969423) (not e!811208))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437269 (= res!969423 (and (= (size!47727 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47727 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47727 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!969422 () Bool)

(assert (=> start!124154 (=> (not res!969422) (not e!811208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124154 (= res!969422 (validMask!0 mask!2687))))

(assert (=> start!124154 e!811208))

(assert (=> start!124154 true))

(declare-fun array_inv!36457 (array!97759) Bool)

(assert (=> start!124154 (array_inv!36457 a!2862)))

(declare-fun b!1437270 () Bool)

(declare-fun res!969421 () Bool)

(assert (=> b!1437270 (=> (not res!969421) (not e!811208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97759 (_ BitVec 32)) Bool)

(assert (=> b!1437270 (= res!969421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437271 () Bool)

(declare-fun res!969420 () Bool)

(assert (=> b!1437271 (=> (not res!969420) (not e!811208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437271 (= res!969420 (validKeyInArray!0 (select (arr!47176 a!2862) i!1006)))))

(declare-fun b!1437272 () Bool)

(declare-datatypes ((List!33664 0))(
  ( (Nil!33661) (Cons!33660 (h!35006 (_ BitVec 64)) (t!48350 List!33664)) )
))
(declare-fun noDuplicate!2629 (List!33664) Bool)

(assert (=> b!1437272 (= e!811208 (not (noDuplicate!2629 Nil!33661)))))

(declare-fun b!1437273 () Bool)

(declare-fun res!969419 () Bool)

(assert (=> b!1437273 (=> (not res!969419) (not e!811208))))

(assert (=> b!1437273 (= res!969419 (validKeyInArray!0 (select (arr!47176 a!2862) j!93)))))

(assert (= (and start!124154 res!969422) b!1437269))

(assert (= (and b!1437269 res!969423) b!1437271))

(assert (= (and b!1437271 res!969420) b!1437273))

(assert (= (and b!1437273 res!969419) b!1437270))

(assert (= (and b!1437270 res!969421) b!1437268))

(assert (= (and b!1437268 res!969424) b!1437272))

(declare-fun m!1326757 () Bool)

(assert (=> b!1437273 m!1326757))

(assert (=> b!1437273 m!1326757))

(declare-fun m!1326759 () Bool)

(assert (=> b!1437273 m!1326759))

(declare-fun m!1326761 () Bool)

(assert (=> b!1437271 m!1326761))

(assert (=> b!1437271 m!1326761))

(declare-fun m!1326763 () Bool)

(assert (=> b!1437271 m!1326763))

(declare-fun m!1326765 () Bool)

(assert (=> b!1437270 m!1326765))

(declare-fun m!1326767 () Bool)

(assert (=> start!124154 m!1326767))

(declare-fun m!1326769 () Bool)

(assert (=> start!124154 m!1326769))

(declare-fun m!1326771 () Bool)

(assert (=> b!1437272 m!1326771))

(check-sat (not b!1437271) (not b!1437270) (not b!1437272) (not b!1437273) (not start!124154))
(check-sat)
(get-model)

(declare-fun d!154845 () Bool)

(declare-fun res!969465 () Bool)

(declare-fun e!811225 () Bool)

(assert (=> d!154845 (=> res!969465 e!811225)))

(get-info :version)

(assert (=> d!154845 (= res!969465 ((_ is Nil!33661) Nil!33661))))

(assert (=> d!154845 (= (noDuplicate!2629 Nil!33661) e!811225)))

(declare-fun b!1437314 () Bool)

(declare-fun e!811226 () Bool)

(assert (=> b!1437314 (= e!811225 e!811226)))

(declare-fun res!969466 () Bool)

(assert (=> b!1437314 (=> (not res!969466) (not e!811226))))

(declare-fun contains!9924 (List!33664 (_ BitVec 64)) Bool)

(assert (=> b!1437314 (= res!969466 (not (contains!9924 (t!48350 Nil!33661) (h!35006 Nil!33661))))))

(declare-fun b!1437315 () Bool)

(assert (=> b!1437315 (= e!811226 (noDuplicate!2629 (t!48350 Nil!33661)))))

(assert (= (and d!154845 (not res!969465)) b!1437314))

(assert (= (and b!1437314 res!969466) b!1437315))

(declare-fun m!1326805 () Bool)

(assert (=> b!1437314 m!1326805))

(declare-fun m!1326807 () Bool)

(assert (=> b!1437315 m!1326807))

(assert (=> b!1437272 d!154845))

(declare-fun d!154847 () Bool)

(assert (=> d!154847 (= (validKeyInArray!0 (select (arr!47176 a!2862) i!1006)) (and (not (= (select (arr!47176 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47176 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437271 d!154847))

(declare-fun d!154849 () Bool)

(assert (=> d!154849 (= (validKeyInArray!0 (select (arr!47176 a!2862) j!93)) (and (not (= (select (arr!47176 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47176 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437273 d!154849))

(declare-fun d!154851 () Bool)

(assert (=> d!154851 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124154 d!154851))

(declare-fun d!154855 () Bool)

(assert (=> d!154855 (= (array_inv!36457 a!2862) (bvsge (size!47727 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124154 d!154855))

(declare-fun b!1437342 () Bool)

(declare-fun e!811250 () Bool)

(declare-fun call!67653 () Bool)

(assert (=> b!1437342 (= e!811250 call!67653)))

(declare-fun b!1437343 () Bool)

(declare-fun e!811249 () Bool)

(declare-fun e!811248 () Bool)

(assert (=> b!1437343 (= e!811249 e!811248)))

(declare-fun c!133441 () Bool)

(assert (=> b!1437343 (= c!133441 (validKeyInArray!0 (select (arr!47176 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437344 () Bool)

(assert (=> b!1437344 (= e!811248 e!811250)))

(declare-fun lt!632535 () (_ BitVec 64))

(assert (=> b!1437344 (= lt!632535 (select (arr!47176 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48475 0))(
  ( (Unit!48476) )
))
(declare-fun lt!632537 () Unit!48475)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97759 (_ BitVec 64) (_ BitVec 32)) Unit!48475)

(assert (=> b!1437344 (= lt!632537 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632535 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1437344 (arrayContainsKey!0 a!2862 lt!632535 #b00000000000000000000000000000000)))

(declare-fun lt!632536 () Unit!48475)

(assert (=> b!1437344 (= lt!632536 lt!632537)))

(declare-fun res!969483 () Bool)

(declare-datatypes ((SeekEntryResult!11349 0))(
  ( (MissingZero!11349 (index!47788 (_ BitVec 32))) (Found!11349 (index!47789 (_ BitVec 32))) (Intermediate!11349 (undefined!12161 Bool) (index!47790 (_ BitVec 32)) (x!129635 (_ BitVec 32))) (Undefined!11349) (MissingVacant!11349 (index!47791 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97759 (_ BitVec 32)) SeekEntryResult!11349)

(assert (=> b!1437344 (= res!969483 (= (seekEntryOrOpen!0 (select (arr!47176 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11349 #b00000000000000000000000000000000)))))

(assert (=> b!1437344 (=> (not res!969483) (not e!811250))))

(declare-fun d!154857 () Bool)

(declare-fun res!969484 () Bool)

(assert (=> d!154857 (=> res!969484 e!811249)))

(assert (=> d!154857 (= res!969484 (bvsge #b00000000000000000000000000000000 (size!47727 a!2862)))))

(assert (=> d!154857 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!811249)))

(declare-fun b!1437345 () Bool)

(assert (=> b!1437345 (= e!811248 call!67653)))

(declare-fun bm!67650 () Bool)

(assert (=> bm!67650 (= call!67653 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!154857 (not res!969484)) b!1437343))

(assert (= (and b!1437343 c!133441) b!1437344))

(assert (= (and b!1437343 (not c!133441)) b!1437345))

(assert (= (and b!1437344 res!969483) b!1437342))

(assert (= (or b!1437342 b!1437345) bm!67650))

(declare-fun m!1326825 () Bool)

(assert (=> b!1437343 m!1326825))

(assert (=> b!1437343 m!1326825))

(declare-fun m!1326827 () Bool)

(assert (=> b!1437343 m!1326827))

(assert (=> b!1437344 m!1326825))

(declare-fun m!1326829 () Bool)

(assert (=> b!1437344 m!1326829))

(declare-fun m!1326831 () Bool)

(assert (=> b!1437344 m!1326831))

(assert (=> b!1437344 m!1326825))

(declare-fun m!1326833 () Bool)

(assert (=> b!1437344 m!1326833))

(declare-fun m!1326835 () Bool)

(assert (=> bm!67650 m!1326835))

(assert (=> b!1437270 d!154857))

(check-sat (not b!1437314) (not bm!67650) (not b!1437344) (not b!1437315) (not b!1437343))
(check-sat)
