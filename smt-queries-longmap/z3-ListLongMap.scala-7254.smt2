; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92820 () Bool)

(assert start!92820)

(declare-fun b!1054286 () Bool)

(declare-fun res!702607 () Bool)

(declare-fun e!598760 () Bool)

(assert (=> b!1054286 (=> (not res!702607) (not e!598760))))

(declare-datatypes ((array!66436 0))(
  ( (array!66437 (arr!31951 (Array (_ BitVec 32) (_ BitVec 64))) (size!32488 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66436)

(declare-datatypes ((List!22233 0))(
  ( (Nil!22230) (Cons!22229 (h!23447 (_ BitVec 64)) (t!31532 List!22233)) )
))
(declare-fun arrayNoDuplicates!0 (array!66436 (_ BitVec 32) List!22233) Bool)

(assert (=> b!1054286 (= res!702607 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22230))))

(declare-fun b!1054287 () Bool)

(declare-fun res!702609 () Bool)

(assert (=> b!1054287 (=> (not res!702609) (not e!598760))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054287 (= res!702609 (= (select (arr!31951 a!3488) i!1381) k0!2747))))

(declare-fun res!702608 () Bool)

(assert (=> start!92820 (=> (not res!702608) (not e!598760))))

(assert (=> start!92820 (= res!702608 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32488 a!3488)) (bvslt (size!32488 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92820 e!598760))

(assert (=> start!92820 true))

(declare-fun array_inv!24733 (array!66436) Bool)

(assert (=> start!92820 (array_inv!24733 a!3488)))

(declare-fun b!1054288 () Bool)

(declare-fun res!702610 () Bool)

(assert (=> b!1054288 (=> (not res!702610) (not e!598760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054288 (= res!702610 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054289 () Bool)

(declare-fun e!598761 () Bool)

(assert (=> b!1054289 (= e!598760 e!598761)))

(declare-fun res!702611 () Bool)

(assert (=> b!1054289 (=> (not res!702611) (not e!598761))))

(declare-fun lt!465536 () array!66436)

(declare-fun arrayContainsKey!0 (array!66436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054289 (= res!702611 (arrayContainsKey!0 lt!465536 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054289 (= lt!465536 (array!66437 (store (arr!31951 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32488 a!3488)))))

(declare-fun b!1054290 () Bool)

(declare-fun arrayScanForKey!0 (array!66436 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054290 (= e!598761 (= (arrayScanForKey!0 lt!465536 k0!2747 #b00000000000000000000000000000000) i!1381))))

(assert (= (and start!92820 res!702608) b!1054286))

(assert (= (and b!1054286 res!702607) b!1054288))

(assert (= (and b!1054288 res!702610) b!1054287))

(assert (= (and b!1054287 res!702609) b!1054289))

(assert (= (and b!1054289 res!702611) b!1054290))

(declare-fun m!975029 () Bool)

(assert (=> b!1054287 m!975029))

(declare-fun m!975031 () Bool)

(assert (=> start!92820 m!975031))

(declare-fun m!975033 () Bool)

(assert (=> b!1054289 m!975033))

(declare-fun m!975035 () Bool)

(assert (=> b!1054289 m!975035))

(declare-fun m!975037 () Bool)

(assert (=> b!1054290 m!975037))

(declare-fun m!975039 () Bool)

(assert (=> b!1054286 m!975039))

(declare-fun m!975041 () Bool)

(assert (=> b!1054288 m!975041))

(check-sat (not start!92820) (not b!1054288) (not b!1054286) (not b!1054290) (not b!1054289))
(check-sat)
(get-model)

(declare-fun d!128261 () Bool)

(declare-fun res!702646 () Bool)

(declare-fun e!598785 () Bool)

(assert (=> d!128261 (=> res!702646 e!598785)))

(assert (=> d!128261 (= res!702646 (= (select (arr!31951 lt!465536) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128261 (= (arrayContainsKey!0 lt!465536 k0!2747 #b00000000000000000000000000000000) e!598785)))

(declare-fun b!1054325 () Bool)

(declare-fun e!598786 () Bool)

(assert (=> b!1054325 (= e!598785 e!598786)))

(declare-fun res!702647 () Bool)

(assert (=> b!1054325 (=> (not res!702647) (not e!598786))))

(assert (=> b!1054325 (= res!702647 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32488 lt!465536)))))

(declare-fun b!1054326 () Bool)

(assert (=> b!1054326 (= e!598786 (arrayContainsKey!0 lt!465536 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128261 (not res!702646)) b!1054325))

(assert (= (and b!1054325 res!702647) b!1054326))

(declare-fun m!975071 () Bool)

(assert (=> d!128261 m!975071))

(declare-fun m!975073 () Bool)

(assert (=> b!1054326 m!975073))

(assert (=> b!1054289 d!128261))

(declare-fun d!128269 () Bool)

(declare-fun lt!465545 () (_ BitVec 32))

(assert (=> d!128269 (and (or (bvslt lt!465545 #b00000000000000000000000000000000) (bvsge lt!465545 (size!32488 lt!465536)) (and (bvsge lt!465545 #b00000000000000000000000000000000) (bvslt lt!465545 (size!32488 lt!465536)))) (bvsge lt!465545 #b00000000000000000000000000000000) (bvslt lt!465545 (size!32488 lt!465536)) (= (select (arr!31951 lt!465536) lt!465545) k0!2747))))

(declare-fun e!598811 () (_ BitVec 32))

(assert (=> d!128269 (= lt!465545 e!598811)))

(declare-fun c!107313 () Bool)

(assert (=> d!128269 (= c!107313 (= (select (arr!31951 lt!465536) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128269 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32488 lt!465536)) (bvslt (size!32488 lt!465536) #b01111111111111111111111111111111))))

(assert (=> d!128269 (= (arrayScanForKey!0 lt!465536 k0!2747 #b00000000000000000000000000000000) lt!465545)))

(declare-fun b!1054357 () Bool)

(assert (=> b!1054357 (= e!598811 #b00000000000000000000000000000000)))

(declare-fun b!1054358 () Bool)

(assert (=> b!1054358 (= e!598811 (arrayScanForKey!0 lt!465536 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128269 c!107313) b!1054357))

(assert (= (and d!128269 (not c!107313)) b!1054358))

(declare-fun m!975079 () Bool)

(assert (=> d!128269 m!975079))

(assert (=> d!128269 m!975071))

(declare-fun m!975081 () Bool)

(assert (=> b!1054358 m!975081))

(assert (=> b!1054290 d!128269))

(declare-fun d!128277 () Bool)

(assert (=> d!128277 (= (array_inv!24733 a!3488) (bvsge (size!32488 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92820 d!128277))

(declare-fun b!1054385 () Bool)

(declare-fun e!598837 () Bool)

(declare-fun call!44798 () Bool)

(assert (=> b!1054385 (= e!598837 call!44798)))

(declare-fun d!128279 () Bool)

(declare-fun res!702685 () Bool)

(declare-fun e!598836 () Bool)

(assert (=> d!128279 (=> res!702685 e!598836)))

(assert (=> d!128279 (= res!702685 (bvsge #b00000000000000000000000000000000 (size!32488 a!3488)))))

(assert (=> d!128279 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22230) e!598836)))

(declare-fun b!1054386 () Bool)

(assert (=> b!1054386 (= e!598837 call!44798)))

(declare-fun b!1054387 () Bool)

(declare-fun e!598834 () Bool)

(assert (=> b!1054387 (= e!598836 e!598834)))

(declare-fun res!702684 () Bool)

(assert (=> b!1054387 (=> (not res!702684) (not e!598834))))

(declare-fun e!598835 () Bool)

(assert (=> b!1054387 (= res!702684 (not e!598835))))

(declare-fun res!702686 () Bool)

(assert (=> b!1054387 (=> (not res!702686) (not e!598835))))

(assert (=> b!1054387 (= res!702686 (validKeyInArray!0 (select (arr!31951 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054388 () Bool)

(assert (=> b!1054388 (= e!598834 e!598837)))

(declare-fun c!107318 () Bool)

(assert (=> b!1054388 (= c!107318 (validKeyInArray!0 (select (arr!31951 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054389 () Bool)

(declare-fun contains!6186 (List!22233 (_ BitVec 64)) Bool)

(assert (=> b!1054389 (= e!598835 (contains!6186 Nil!22230 (select (arr!31951 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44795 () Bool)

(assert (=> bm!44795 (= call!44798 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107318 (Cons!22229 (select (arr!31951 a!3488) #b00000000000000000000000000000000) Nil!22230) Nil!22230)))))

(assert (= (and d!128279 (not res!702685)) b!1054387))

(assert (= (and b!1054387 res!702686) b!1054389))

(assert (= (and b!1054387 res!702684) b!1054388))

(assert (= (and b!1054388 c!107318) b!1054386))

(assert (= (and b!1054388 (not c!107318)) b!1054385))

(assert (= (or b!1054386 b!1054385) bm!44795))

(declare-fun m!975103 () Bool)

(assert (=> b!1054387 m!975103))

(assert (=> b!1054387 m!975103))

(declare-fun m!975105 () Bool)

(assert (=> b!1054387 m!975105))

(assert (=> b!1054388 m!975103))

(assert (=> b!1054388 m!975103))

(assert (=> b!1054388 m!975105))

(assert (=> b!1054389 m!975103))

(assert (=> b!1054389 m!975103))

(declare-fun m!975107 () Bool)

(assert (=> b!1054389 m!975107))

(assert (=> bm!44795 m!975103))

(declare-fun m!975109 () Bool)

(assert (=> bm!44795 m!975109))

(assert (=> b!1054286 d!128279))

(declare-fun d!128289 () Bool)

(assert (=> d!128289 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1054288 d!128289))

(check-sat (not b!1054326) (not b!1054358) (not bm!44795) (not b!1054387) (not b!1054388) (not b!1054389))
(check-sat)
