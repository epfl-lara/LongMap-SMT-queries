; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92646 () Bool)

(assert start!92646)

(declare-fun b!1053169 () Bool)

(declare-fun res!702259 () Bool)

(declare-fun e!598089 () Bool)

(assert (=> b!1053169 (=> (not res!702259) (not e!598089))))

(declare-datatypes ((array!66420 0))(
  ( (array!66421 (arr!31948 (Array (_ BitVec 32) (_ BitVec 64))) (size!32484 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66420)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053169 (= res!702259 (= (select (arr!31948 a!3488) i!1381) k!2747))))

(declare-fun b!1053170 () Bool)

(declare-fun e!598088 () Bool)

(assert (=> b!1053170 (= e!598089 e!598088)))

(declare-fun res!702262 () Bool)

(assert (=> b!1053170 (=> (not res!702262) (not e!598088))))

(declare-fun lt!465086 () array!66420)

(declare-fun arrayContainsKey!0 (array!66420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053170 (= res!702262 (arrayContainsKey!0 lt!465086 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053170 (= lt!465086 (array!66421 (store (arr!31948 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32484 a!3488)))))

(declare-fun b!1053171 () Bool)

(declare-fun res!702260 () Bool)

(assert (=> b!1053171 (=> (not res!702260) (not e!598089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053171 (= res!702260 (validKeyInArray!0 k!2747))))

(declare-fun b!1053172 () Bool)

(declare-fun res!702261 () Bool)

(assert (=> b!1053172 (=> (not res!702261) (not e!598089))))

(declare-datatypes ((List!22260 0))(
  ( (Nil!22257) (Cons!22256 (h!23465 (_ BitVec 64)) (t!31567 List!22260)) )
))
(declare-fun arrayNoDuplicates!0 (array!66420 (_ BitVec 32) List!22260) Bool)

(assert (=> b!1053172 (= res!702261 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22257))))

(declare-fun res!702263 () Bool)

(assert (=> start!92646 (=> (not res!702263) (not e!598089))))

(assert (=> start!92646 (= res!702263 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32484 a!3488)) (bvslt (size!32484 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92646 e!598089))

(assert (=> start!92646 true))

(declare-fun array_inv!24728 (array!66420) Bool)

(assert (=> start!92646 (array_inv!24728 a!3488)))

(declare-fun b!1053173 () Bool)

(declare-fun lt!465087 () (_ BitVec 32))

(assert (=> b!1053173 (= e!598088 (and (not (= lt!465087 i!1381)) (or (bvslt lt!465087 #b00000000000000000000000000000000) (bvsge lt!465087 (size!32484 a!3488)))))))

(declare-fun arrayScanForKey!0 (array!66420 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053173 (= lt!465087 (arrayScanForKey!0 lt!465086 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92646 res!702263) b!1053172))

(assert (= (and b!1053172 res!702261) b!1053171))

(assert (= (and b!1053171 res!702260) b!1053169))

(assert (= (and b!1053169 res!702259) b!1053170))

(assert (= (and b!1053170 res!702262) b!1053173))

(declare-fun m!973529 () Bool)

(assert (=> b!1053169 m!973529))

(declare-fun m!973531 () Bool)

(assert (=> b!1053171 m!973531))

(declare-fun m!973533 () Bool)

(assert (=> b!1053170 m!973533))

(declare-fun m!973535 () Bool)

(assert (=> b!1053170 m!973535))

(declare-fun m!973537 () Bool)

(assert (=> start!92646 m!973537))

(declare-fun m!973539 () Bool)

(assert (=> b!1053172 m!973539))

(declare-fun m!973541 () Bool)

(assert (=> b!1053173 m!973541))

(push 1)

(assert (not b!1053173))

(assert (not b!1053170))

(assert (not b!1053172))

(assert (not b!1053171))

(assert (not start!92646))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!127839 () Bool)

(declare-fun lt!465102 () (_ BitVec 32))

(assert (=> d!127839 (and (or (bvslt lt!465102 #b00000000000000000000000000000000) (bvsge lt!465102 (size!32484 lt!465086)) (and (bvsge lt!465102 #b00000000000000000000000000000000) (bvslt lt!465102 (size!32484 lt!465086)))) (bvsge lt!465102 #b00000000000000000000000000000000) (bvslt lt!465102 (size!32484 lt!465086)) (= (select (arr!31948 lt!465086) lt!465102) k!2747))))

(declare-fun e!598111 () (_ BitVec 32))

(assert (=> d!127839 (= lt!465102 e!598111)))

(declare-fun c!106917 () Bool)

(assert (=> d!127839 (= c!106917 (= (select (arr!31948 lt!465086) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127839 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32484 lt!465086)) (bvslt (size!32484 lt!465086) #b01111111111111111111111111111111))))

(assert (=> d!127839 (= (arrayScanForKey!0 lt!465086 k!2747 #b00000000000000000000000000000000) lt!465102)))

(declare-fun b!1053208 () Bool)

(assert (=> b!1053208 (= e!598111 #b00000000000000000000000000000000)))

(declare-fun b!1053209 () Bool)

(assert (=> b!1053209 (= e!598111 (arrayScanForKey!0 lt!465086 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127839 c!106917) b!1053208))

(assert (= (and d!127839 (not c!106917)) b!1053209))

(declare-fun m!973571 () Bool)

(assert (=> d!127839 m!973571))

(declare-fun m!973573 () Bool)

(assert (=> d!127839 m!973573))

(declare-fun m!973575 () Bool)

(assert (=> b!1053209 m!973575))

(assert (=> b!1053173 d!127839))

(declare-fun d!127845 () Bool)

(declare-fun res!702319 () Bool)

(declare-fun e!598142 () Bool)

(assert (=> d!127845 (=> res!702319 e!598142)))

(assert (=> d!127845 (= res!702319 (bvsge #b00000000000000000000000000000000 (size!32484 a!3488)))))

(assert (=> d!127845 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22257) e!598142)))

(declare-fun bm!44734 () Bool)

(declare-fun call!44737 () Bool)

(declare-fun c!106923 () Bool)

(assert (=> bm!44734 (= call!44737 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106923 (Cons!22256 (select (arr!31948 a!3488) #b00000000000000000000000000000000) Nil!22257) Nil!22257)))))

(declare-fun b!1053245 () Bool)

(declare-fun e!598143 () Bool)

(declare-fun e!598145 () Bool)

(assert (=> b!1053245 (= e!598143 e!598145)))

(assert (=> b!1053245 (= c!106923 (validKeyInArray!0 (select (arr!31948 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053246 () Bool)

(declare-fun e!598144 () Bool)

(declare-fun contains!6162 (List!22260 (_ BitVec 64)) Bool)

(assert (=> b!1053246 (= e!598144 (contains!6162 Nil!22257 (select (arr!31948 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053247 () Bool)

(assert (=> b!1053247 (= e!598145 call!44737)))

(declare-fun b!1053248 () Bool)

(assert (=> b!1053248 (= e!598142 e!598143)))

(declare-fun res!702320 () Bool)

(assert (=> b!1053248 (=> (not res!702320) (not e!598143))))

(assert (=> b!1053248 (= res!702320 (not e!598144))))

(declare-fun res!702321 () Bool)

(assert (=> b!1053248 (=> (not res!702321) (not e!598144))))

(assert (=> b!1053248 (= res!702321 (validKeyInArray!0 (select (arr!31948 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053249 () Bool)

(assert (=> b!1053249 (= e!598145 call!44737)))

(assert (= (and d!127845 (not res!702319)) b!1053248))

(assert (= (and b!1053248 res!702321) b!1053246))

(assert (= (and b!1053248 res!702320) b!1053245))

(assert (= (and b!1053245 c!106923) b!1053247))

(assert (= (and b!1053245 (not c!106923)) b!1053249))

(assert (= (or b!1053247 b!1053249) bm!44734))

(declare-fun m!973589 () Bool)

(assert (=> bm!44734 m!973589))

(declare-fun m!973591 () Bool)

(assert (=> bm!44734 m!973591))

(assert (=> b!1053245 m!973589))

(assert (=> b!1053245 m!973589))

(declare-fun m!973593 () Bool)

(assert (=> b!1053245 m!973593))

(assert (=> b!1053246 m!973589))

(assert (=> b!1053246 m!973589))

(declare-fun m!973595 () Bool)

(assert (=> b!1053246 m!973595))

(assert (=> b!1053248 m!973589))

(assert (=> b!1053248 m!973589))

(assert (=> b!1053248 m!973593))

(assert (=> b!1053172 d!127845))

(declare-fun d!127853 () Bool)

(assert (=> d!127853 (= (array_inv!24728 a!3488) (bvsge (size!32484 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92646 d!127853))

(declare-fun d!127857 () Bool)

(assert (=> d!127857 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1053171 d!127857))

(declare-fun d!127861 () Bool)

(declare-fun res!702328 () Bool)

(declare-fun e!598152 () Bool)

(assert (=> d!127861 (=> res!702328 e!598152)))

(assert (=> d!127861 (= res!702328 (= (select (arr!31948 lt!465086) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127861 (= (arrayContainsKey!0 lt!465086 k!2747 #b00000000000000000000000000000000) e!598152)))

(declare-fun b!1053256 () Bool)

(declare-fun e!598153 () Bool)

(assert (=> b!1053256 (= e!598152 e!598153)))

(declare-fun res!702329 () Bool)

(assert (=> b!1053256 (=> (not res!702329) (not e!598153))))

(assert (=> b!1053256 (= res!702329 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32484 lt!465086)))))

(declare-fun b!1053257 () Bool)

(assert (=> b!1053257 (= e!598153 (arrayContainsKey!0 lt!465086 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127861 (not res!702328)) b!1053256))

(assert (= (and b!1053256 res!702329) b!1053257))

(assert (=> d!127861 m!973573))

(declare-fun m!973601 () Bool)

(assert (=> b!1053257 m!973601))

(assert (=> b!1053170 d!127861))

(push 1)

(assert (not b!1053209))

(assert (not b!1053245))

(assert (not b!1053246))

(assert (not b!1053248))

(assert (not b!1053257))

(assert (not bm!44734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

