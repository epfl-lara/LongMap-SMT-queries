; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92154 () Bool)

(assert start!92154)

(declare-fun res!697209 () Bool)

(declare-fun e!594349 () Bool)

(assert (=> start!92154 (=> (not res!697209) (not e!594349))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!65997 0))(
  ( (array!65998 (arr!31741 (Array (_ BitVec 32) (_ BitVec 64))) (size!32277 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!65997)

(assert (=> start!92154 (= res!697209 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32277 a!3488)) (bvslt (size!32277 a!3488) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!32277 a!3488))))))

(assert (=> start!92154 e!594349))

(assert (=> start!92154 true))

(declare-fun array_inv!24521 (array!65997) Bool)

(assert (=> start!92154 (array_inv!24521 a!3488)))

(declare-fun b!1048047 () Bool)

(declare-fun res!697210 () Bool)

(assert (=> b!1048047 (=> (not res!697210) (not e!594349))))

(declare-datatypes ((List!22053 0))(
  ( (Nil!22050) (Cons!22049 (h!23258 (_ BitVec 64)) (t!31360 List!22053)) )
))
(declare-fun noDuplicate!1488 (List!22053) Bool)

(assert (=> b!1048047 (= res!697210 (noDuplicate!1488 Nil!22050))))

(declare-fun b!1048048 () Bool)

(declare-fun e!594348 () Bool)

(assert (=> b!1048048 (= e!594349 e!594348)))

(declare-fun res!697211 () Bool)

(assert (=> b!1048048 (=> res!697211 e!594348)))

(declare-fun contains!6100 (List!22053 (_ BitVec 64)) Bool)

(assert (=> b!1048048 (= res!697211 (contains!6100 Nil!22050 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1048049 () Bool)

(assert (=> b!1048049 (= e!594348 (contains!6100 Nil!22050 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!92154 res!697209) b!1048047))

(assert (= (and b!1048047 res!697210) b!1048048))

(assert (= (and b!1048048 (not res!697211)) b!1048049))

(declare-fun m!969077 () Bool)

(assert (=> start!92154 m!969077))

(declare-fun m!969079 () Bool)

(assert (=> b!1048047 m!969079))

(declare-fun m!969081 () Bool)

(assert (=> b!1048048 m!969081))

(declare-fun m!969083 () Bool)

(assert (=> b!1048049 m!969083))

(push 1)

(assert (not start!92154))

(assert (not b!1048049))

(assert (not b!1048048))

(assert (not b!1048047))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!127621 () Bool)

(assert (=> d!127621 (= (array_inv!24521 a!3488) (bvsge (size!32277 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92154 d!127621))

(declare-fun d!127625 () Bool)

(declare-fun lt!463105 () Bool)

(declare-fun content!527 (List!22053) (Set (_ BitVec 64)))

(assert (=> d!127625 (= lt!463105 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!527 Nil!22050)))))

(declare-fun e!594387 () Bool)

(assert (=> d!127625 (= lt!463105 e!594387)))

(declare-fun res!697249 () Bool)

(assert (=> d!127625 (=> (not res!697249) (not e!594387))))

(assert (=> d!127625 (= res!697249 (is-Cons!22049 Nil!22050))))

(assert (=> d!127625 (= (contains!6100 Nil!22050 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463105)))

(declare-fun b!1048086 () Bool)

(declare-fun e!594386 () Bool)

(assert (=> b!1048086 (= e!594387 e!594386)))

(declare-fun res!697248 () Bool)

(assert (=> b!1048086 (=> res!697248 e!594386)))

(assert (=> b!1048086 (= res!697248 (= (h!23258 Nil!22050) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1048087 () Bool)

(assert (=> b!1048087 (= e!594386 (contains!6100 (t!31360 Nil!22050) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!127625 res!697249) b!1048086))

(assert (= (and b!1048086 (not res!697248)) b!1048087))

(declare-fun m!969115 () Bool)

(assert (=> d!127625 m!969115))

(declare-fun m!969117 () Bool)

(assert (=> d!127625 m!969117))

(declare-fun m!969119 () Bool)

(assert (=> b!1048087 m!969119))

(assert (=> b!1048049 d!127625))

(declare-fun d!127631 () Bool)

(declare-fun lt!463106 () Bool)

(assert (=> d!127631 (= lt!463106 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!527 Nil!22050)))))

(declare-fun e!594389 () Bool)

(assert (=> d!127631 (= lt!463106 e!594389)))

(declare-fun res!697251 () Bool)

(assert (=> d!127631 (=> (not res!697251) (not e!594389))))

(assert (=> d!127631 (= res!697251 (is-Cons!22049 Nil!22050))))

(assert (=> d!127631 (= (contains!6100 Nil!22050 #b0000000000000000000000000000000000000000000000000000000000000000) lt!463106)))

(declare-fun b!1048088 () Bool)

(declare-fun e!594388 () Bool)

(assert (=> b!1048088 (= e!594389 e!594388)))

(declare-fun res!697250 () Bool)

