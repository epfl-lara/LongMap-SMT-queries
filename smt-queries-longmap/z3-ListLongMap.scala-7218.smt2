; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92368 () Bool)

(assert start!92368)

(declare-fun b!1050035 () Bool)

(declare-fun e!595820 () Bool)

(assert (=> b!1050035 (= e!595820 true)))

(declare-fun lt!463626 () Bool)

(declare-datatypes ((List!22165 0))(
  ( (Nil!22162) (Cons!22161 (h!23370 (_ BitVec 64)) (t!31463 List!22165)) )
))
(declare-fun contains!6103 (List!22165 (_ BitVec 64)) Bool)

(assert (=> b!1050035 (= lt!463626 (contains!6103 Nil!22162 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!699256 () Bool)

(declare-fun e!595821 () Bool)

(assert (=> start!92368 (=> (not res!699256) (not e!595821))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66110 0))(
  ( (array!66111 (arr!31794 (Array (_ BitVec 32) (_ BitVec 64))) (size!32332 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66110)

(assert (=> start!92368 (= res!699256 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32332 a!3488)) (bvslt (size!32332 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92368 e!595821))

(assert (=> start!92368 true))

(declare-fun array_inv!24577 (array!66110) Bool)

(assert (=> start!92368 (array_inv!24577 a!3488)))

(declare-fun b!1050036 () Bool)

(declare-fun e!595825 () Bool)

(declare-fun e!595824 () Bool)

(assert (=> b!1050036 (= e!595825 e!595824)))

(declare-fun res!699252 () Bool)

(assert (=> b!1050036 (=> res!699252 e!595824)))

(declare-fun lt!463624 () (_ BitVec 32))

(assert (=> b!1050036 (= res!699252 (bvsle lt!463624 i!1381))))

(declare-fun b!1050037 () Bool)

(declare-fun res!699249 () Bool)

(assert (=> b!1050037 (=> res!699249 e!595820)))

(declare-fun noDuplicate!1528 (List!22165) Bool)

(assert (=> b!1050037 (= res!699249 (not (noDuplicate!1528 Nil!22162)))))

(declare-fun b!1050038 () Bool)

(declare-fun e!595826 () Bool)

(assert (=> b!1050038 (= e!595821 e!595826)))

(declare-fun res!699251 () Bool)

(assert (=> b!1050038 (=> (not res!699251) (not e!595826))))

(declare-fun lt!463625 () array!66110)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66110 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050038 (= res!699251 (arrayContainsKey!0 lt!463625 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050038 (= lt!463625 (array!66111 (store (arr!31794 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32332 a!3488)))))

(declare-fun b!1050039 () Bool)

(declare-fun res!699246 () Bool)

(assert (=> b!1050039 (=> (not res!699246) (not e!595821))))

(declare-fun arrayNoDuplicates!0 (array!66110 (_ BitVec 32) List!22165) Bool)

(assert (=> b!1050039 (= res!699246 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22162))))

(declare-fun b!1050040 () Bool)

(declare-fun res!699253 () Bool)

(assert (=> b!1050040 (=> (not res!699253) (not e!595821))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050040 (= res!699253 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050041 () Bool)

(declare-fun res!699247 () Bool)

(assert (=> b!1050041 (=> (not res!699247) (not e!595821))))

(assert (=> b!1050041 (= res!699247 (= (select (arr!31794 a!3488) i!1381) k0!2747))))

(declare-fun b!1050042 () Bool)

(declare-fun e!595827 () Bool)

(assert (=> b!1050042 (= e!595827 e!595820)))

(declare-fun res!699248 () Bool)

(assert (=> b!1050042 (=> res!699248 e!595820)))

(assert (=> b!1050042 (= res!699248 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32332 a!3488)))))

(assert (=> b!1050042 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34241 0))(
  ( (Unit!34242) )
))
(declare-fun lt!463623 () Unit!34241)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66110 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34241)

(assert (=> b!1050042 (= lt!463623 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463624 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1050042 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22162)))

(declare-fun lt!463627 () Unit!34241)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66110 (_ BitVec 32) (_ BitVec 32)) Unit!34241)

(assert (=> b!1050042 (= lt!463627 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050043 () Bool)

(declare-fun e!595822 () Bool)

(assert (=> b!1050043 (= e!595822 (not e!595827))))

(declare-fun res!699255 () Bool)

(assert (=> b!1050043 (=> res!699255 e!595827)))

(assert (=> b!1050043 (= res!699255 (bvsle lt!463624 i!1381))))

(assert (=> b!1050043 e!595825))

(declare-fun res!699245 () Bool)

(assert (=> b!1050043 (=> (not res!699245) (not e!595825))))

(assert (=> b!1050043 (= res!699245 (= (select (store (arr!31794 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463624) k0!2747))))

(declare-fun b!1050044 () Bool)

(assert (=> b!1050044 (= e!595826 e!595822)))

(declare-fun res!699254 () Bool)

(assert (=> b!1050044 (=> (not res!699254) (not e!595822))))

(assert (=> b!1050044 (= res!699254 (not (= lt!463624 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66110 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050044 (= lt!463624 (arrayScanForKey!0 lt!463625 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050045 () Bool)

(declare-fun res!699250 () Bool)

(assert (=> b!1050045 (=> res!699250 e!595820)))

(assert (=> b!1050045 (= res!699250 (contains!6103 Nil!22162 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050046 () Bool)

(assert (=> b!1050046 (= e!595824 (arrayContainsKey!0 a!3488 k0!2747 lt!463624))))

(assert (= (and start!92368 res!699256) b!1050039))

(assert (= (and b!1050039 res!699246) b!1050040))

(assert (= (and b!1050040 res!699253) b!1050041))

(assert (= (and b!1050041 res!699247) b!1050038))

(assert (= (and b!1050038 res!699251) b!1050044))

(assert (= (and b!1050044 res!699254) b!1050043))

(assert (= (and b!1050043 res!699245) b!1050036))

(assert (= (and b!1050036 (not res!699252)) b!1050046))

(assert (= (and b!1050043 (not res!699255)) b!1050042))

(assert (= (and b!1050042 (not res!699248)) b!1050037))

(assert (= (and b!1050037 (not res!699249)) b!1050045))

(assert (= (and b!1050045 (not res!699250)) b!1050035))

(declare-fun m!970249 () Bool)

(assert (=> b!1050035 m!970249))

(declare-fun m!970251 () Bool)

(assert (=> b!1050044 m!970251))

(declare-fun m!970253 () Bool)

(assert (=> b!1050043 m!970253))

(declare-fun m!970255 () Bool)

(assert (=> b!1050043 m!970255))

(declare-fun m!970257 () Bool)

(assert (=> b!1050042 m!970257))

(declare-fun m!970259 () Bool)

(assert (=> b!1050042 m!970259))

(declare-fun m!970261 () Bool)

(assert (=> b!1050042 m!970261))

(declare-fun m!970263 () Bool)

(assert (=> b!1050042 m!970263))

(declare-fun m!970265 () Bool)

(assert (=> b!1050045 m!970265))

(declare-fun m!970267 () Bool)

(assert (=> b!1050039 m!970267))

(declare-fun m!970269 () Bool)

(assert (=> b!1050040 m!970269))

(declare-fun m!970271 () Bool)

(assert (=> b!1050037 m!970271))

(declare-fun m!970273 () Bool)

(assert (=> start!92368 m!970273))

(declare-fun m!970275 () Bool)

(assert (=> b!1050046 m!970275))

(declare-fun m!970277 () Bool)

(assert (=> b!1050041 m!970277))

(declare-fun m!970279 () Bool)

(assert (=> b!1050038 m!970279))

(assert (=> b!1050038 m!970253))

(check-sat (not b!1050045) (not b!1050044) (not start!92368) (not b!1050042) (not b!1050038) (not b!1050039) (not b!1050046) (not b!1050035) (not b!1050040) (not b!1050037))
(check-sat)
