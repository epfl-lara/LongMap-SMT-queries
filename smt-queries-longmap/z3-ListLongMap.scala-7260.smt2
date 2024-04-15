; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92680 () Bool)

(assert start!92680)

(declare-fun b!1053144 () Bool)

(declare-fun res!702285 () Bool)

(declare-fun e!598088 () Bool)

(assert (=> b!1053144 (=> (not res!702285) (not e!598088))))

(declare-datatypes ((array!66368 0))(
  ( (array!66369 (arr!31920 (Array (_ BitVec 32) (_ BitVec 64))) (size!32458 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66368)

(declare-datatypes ((List!22291 0))(
  ( (Nil!22288) (Cons!22287 (h!23496 (_ BitVec 64)) (t!31589 List!22291)) )
))
(declare-fun arrayNoDuplicates!0 (array!66368 (_ BitVec 32) List!22291) Bool)

(assert (=> b!1053144 (= res!702285 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22288))))

(declare-fun res!702282 () Bool)

(assert (=> start!92680 (=> (not res!702282) (not e!598088))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!92680 (= res!702282 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32458 a!3488)) (bvslt (size!32458 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92680 e!598088))

(assert (=> start!92680 true))

(declare-fun array_inv!24703 (array!66368) Bool)

(assert (=> start!92680 (array_inv!24703 a!3488)))

(declare-fun b!1053145 () Bool)

(declare-fun e!598087 () Bool)

(assert (=> b!1053145 (= e!598088 e!598087)))

(declare-fun res!702286 () Bool)

(assert (=> b!1053145 (=> (not res!702286) (not e!598087))))

(declare-fun lt!464913 () array!66368)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66368 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053145 (= res!702286 (arrayContainsKey!0 lt!464913 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053145 (= lt!464913 (array!66369 (store (arr!31920 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32458 a!3488)))))

(declare-fun b!1053146 () Bool)

(declare-fun res!702284 () Bool)

(assert (=> b!1053146 (=> (not res!702284) (not e!598088))))

(assert (=> b!1053146 (= res!702284 (= (select (arr!31920 a!3488) i!1381) k0!2747))))

(declare-fun lt!464914 () (_ BitVec 32))

(declare-fun b!1053147 () Bool)

(assert (=> b!1053147 (= e!598087 (and (not (= lt!464914 i!1381)) (not (= (select (store (arr!31920 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464914) k0!2747))))))

(declare-fun arrayScanForKey!0 (array!66368 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053147 (= lt!464914 (arrayScanForKey!0 lt!464913 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053148 () Bool)

(declare-fun res!702283 () Bool)

(assert (=> b!1053148 (=> (not res!702283) (not e!598088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053148 (= res!702283 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92680 res!702282) b!1053144))

(assert (= (and b!1053144 res!702285) b!1053148))

(assert (= (and b!1053148 res!702283) b!1053146))

(assert (= (and b!1053146 res!702284) b!1053145))

(assert (= (and b!1053145 res!702286) b!1053147))

(declare-fun m!973003 () Bool)

(assert (=> b!1053144 m!973003))

(declare-fun m!973005 () Bool)

(assert (=> b!1053148 m!973005))

(declare-fun m!973007 () Bool)

(assert (=> start!92680 m!973007))

(declare-fun m!973009 () Bool)

(assert (=> b!1053145 m!973009))

(declare-fun m!973011 () Bool)

(assert (=> b!1053145 m!973011))

(assert (=> b!1053147 m!973011))

(declare-fun m!973013 () Bool)

(assert (=> b!1053147 m!973013))

(declare-fun m!973015 () Bool)

(assert (=> b!1053147 m!973015))

(declare-fun m!973017 () Bool)

(assert (=> b!1053146 m!973017))

(check-sat (not start!92680) (not b!1053148) (not b!1053144) (not b!1053147) (not b!1053145))
(check-sat)
(get-model)

(declare-fun d!127721 () Bool)

(declare-fun res!702321 () Bool)

(declare-fun e!598112 () Bool)

(assert (=> d!127721 (=> res!702321 e!598112)))

(assert (=> d!127721 (= res!702321 (= (select (arr!31920 lt!464913) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127721 (= (arrayContainsKey!0 lt!464913 k0!2747 #b00000000000000000000000000000000) e!598112)))

(declare-fun b!1053183 () Bool)

(declare-fun e!598113 () Bool)

(assert (=> b!1053183 (= e!598112 e!598113)))

(declare-fun res!702322 () Bool)

(assert (=> b!1053183 (=> (not res!702322) (not e!598113))))

(assert (=> b!1053183 (= res!702322 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32458 lt!464913)))))

(declare-fun b!1053184 () Bool)

(assert (=> b!1053184 (= e!598113 (arrayContainsKey!0 lt!464913 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127721 (not res!702321)) b!1053183))

(assert (= (and b!1053183 res!702322) b!1053184))

(declare-fun m!973051 () Bool)

(assert (=> d!127721 m!973051))

(declare-fun m!973053 () Bool)

(assert (=> b!1053184 m!973053))

(assert (=> b!1053145 d!127721))

(declare-fun d!127723 () Bool)

(assert (=> d!127723 (= (array_inv!24703 a!3488) (bvsge (size!32458 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92680 d!127723))

(declare-fun b!1053205 () Bool)

(declare-fun e!598131 () Bool)

(declare-fun e!598130 () Bool)

(assert (=> b!1053205 (= e!598131 e!598130)))

(declare-fun res!702335 () Bool)

(assert (=> b!1053205 (=> (not res!702335) (not e!598130))))

(declare-fun e!598133 () Bool)

(assert (=> b!1053205 (= res!702335 (not e!598133))))

(declare-fun res!702336 () Bool)

(assert (=> b!1053205 (=> (not res!702336) (not e!598133))))

(assert (=> b!1053205 (= res!702336 (validKeyInArray!0 (select (arr!31920 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053206 () Bool)

(declare-fun e!598132 () Bool)

(declare-fun call!44720 () Bool)

(assert (=> b!1053206 (= e!598132 call!44720)))

(declare-fun bm!44717 () Bool)

(declare-fun c!106898 () Bool)

(assert (=> bm!44717 (= call!44720 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106898 (Cons!22287 (select (arr!31920 a!3488) #b00000000000000000000000000000000) Nil!22288) Nil!22288)))))

(declare-fun d!127725 () Bool)

(declare-fun res!702337 () Bool)

(assert (=> d!127725 (=> res!702337 e!598131)))

(assert (=> d!127725 (= res!702337 (bvsge #b00000000000000000000000000000000 (size!32458 a!3488)))))

(assert (=> d!127725 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22288) e!598131)))

(declare-fun b!1053207 () Bool)

(assert (=> b!1053207 (= e!598130 e!598132)))

(assert (=> b!1053207 (= c!106898 (validKeyInArray!0 (select (arr!31920 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053208 () Bool)

(assert (=> b!1053208 (= e!598132 call!44720)))

(declare-fun b!1053209 () Bool)

(declare-fun contains!6139 (List!22291 (_ BitVec 64)) Bool)

(assert (=> b!1053209 (= e!598133 (contains!6139 Nil!22288 (select (arr!31920 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!127725 (not res!702337)) b!1053205))

(assert (= (and b!1053205 res!702336) b!1053209))

(assert (= (and b!1053205 res!702335) b!1053207))

(assert (= (and b!1053207 c!106898) b!1053208))

(assert (= (and b!1053207 (not c!106898)) b!1053206))

(assert (= (or b!1053208 b!1053206) bm!44717))

(declare-fun m!973059 () Bool)

(assert (=> b!1053205 m!973059))

(assert (=> b!1053205 m!973059))

(declare-fun m!973061 () Bool)

(assert (=> b!1053205 m!973061))

(assert (=> bm!44717 m!973059))

(declare-fun m!973063 () Bool)

(assert (=> bm!44717 m!973063))

(assert (=> b!1053207 m!973059))

(assert (=> b!1053207 m!973059))

(assert (=> b!1053207 m!973061))

(assert (=> b!1053209 m!973059))

(assert (=> b!1053209 m!973059))

(declare-fun m!973065 () Bool)

(assert (=> b!1053209 m!973065))

(assert (=> b!1053144 d!127725))

(declare-fun d!127733 () Bool)

(assert (=> d!127733 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1053148 d!127733))

(declare-fun d!127735 () Bool)

(declare-fun lt!464932 () (_ BitVec 32))

(assert (=> d!127735 (and (or (bvslt lt!464932 #b00000000000000000000000000000000) (bvsge lt!464932 (size!32458 lt!464913)) (and (bvsge lt!464932 #b00000000000000000000000000000000) (bvslt lt!464932 (size!32458 lt!464913)))) (bvsge lt!464932 #b00000000000000000000000000000000) (bvslt lt!464932 (size!32458 lt!464913)) (= (select (arr!31920 lt!464913) lt!464932) k0!2747))))

(declare-fun e!598157 () (_ BitVec 32))

(assert (=> d!127735 (= lt!464932 e!598157)))

(declare-fun c!106907 () Bool)

(assert (=> d!127735 (= c!106907 (= (select (arr!31920 lt!464913) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127735 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32458 lt!464913)) (bvslt (size!32458 lt!464913) #b01111111111111111111111111111111))))

(assert (=> d!127735 (= (arrayScanForKey!0 lt!464913 k0!2747 #b00000000000000000000000000000000) lt!464932)))

(declare-fun b!1053241 () Bool)

(assert (=> b!1053241 (= e!598157 #b00000000000000000000000000000000)))

(declare-fun b!1053242 () Bool)

(assert (=> b!1053242 (= e!598157 (arrayScanForKey!0 lt!464913 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127735 c!106907) b!1053241))

(assert (= (and d!127735 (not c!106907)) b!1053242))

(declare-fun m!973081 () Bool)

(assert (=> d!127735 m!973081))

(assert (=> d!127735 m!973051))

(declare-fun m!973083 () Bool)

(assert (=> b!1053242 m!973083))

(assert (=> b!1053147 d!127735))

(check-sat (not b!1053242) (not bm!44717) (not b!1053207) (not b!1053184) (not b!1053205) (not b!1053209))
(check-sat)
