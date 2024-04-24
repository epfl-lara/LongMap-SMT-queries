; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116842 () Bool)

(assert start!116842)

(declare-fun b!1376224 () Bool)

(declare-datatypes ((array!93418 0))(
  ( (array!93419 (arr!45109 (Array (_ BitVec 32) (_ BitVec 64))) (size!45660 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93418)

(declare-fun lt!604403 () array!93418)

(declare-fun e!779736 () Bool)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93418 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376224 (= e!779736 (= (arrayCountValidKeys!0 lt!604403 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457))))))

(declare-fun b!1376225 () Bool)

(declare-fun res!918568 () Bool)

(declare-fun e!779737 () Bool)

(assert (=> b!1376225 (=> (not res!918568) (not e!779737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376225 (= res!918568 (validKeyInArray!0 (select (arr!45109 a!4142) i!1457)))))

(declare-fun b!1376223 () Bool)

(declare-fun res!918566 () Bool)

(assert (=> b!1376223 (=> (not res!918566) (not e!779737))))

(assert (=> b!1376223 (= res!918566 (bvslt (size!45660 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!918569 () Bool)

(assert (=> start!116842 (=> (not res!918569) (not e!779737))))

(assert (=> start!116842 (= res!918569 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45660 a!4142))))))

(assert (=> start!116842 e!779737))

(assert (=> start!116842 true))

(declare-fun array_inv!34390 (array!93418) Bool)

(assert (=> start!116842 (array_inv!34390 a!4142)))

(declare-fun b!1376226 () Bool)

(declare-fun res!918570 () Bool)

(assert (=> b!1376226 (=> (not res!918570) (not e!779737))))

(declare-fun k0!2959 () (_ BitVec 64))

(assert (=> b!1376226 (= res!918570 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1376227 () Bool)

(assert (=> b!1376227 (= e!779737 (not e!779736))))

(declare-fun res!918567 () Bool)

(assert (=> b!1376227 (=> res!918567 e!779736)))

(assert (=> b!1376227 (= res!918567 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(assert (=> b!1376227 (= (arrayCountValidKeys!0 lt!604403 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1376227 (= lt!604403 (array!93419 (store (arr!45109 a!4142) i!1457 k0!2959) (size!45660 a!4142)))))

(declare-datatypes ((Unit!45440 0))(
  ( (Unit!45441) )
))
(declare-fun lt!604404 () Unit!45440)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93418 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45440)

(assert (=> b!1376227 (= lt!604404 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(assert (= (and start!116842 res!918569) b!1376225))

(assert (= (and b!1376225 res!918568) b!1376226))

(assert (= (and b!1376226 res!918570) b!1376223))

(assert (= (and b!1376223 res!918566) b!1376227))

(assert (= (and b!1376227 (not res!918567)) b!1376224))

(declare-fun m!1260119 () Bool)

(assert (=> b!1376224 m!1260119))

(declare-fun m!1260121 () Bool)

(assert (=> b!1376224 m!1260121))

(declare-fun m!1260123 () Bool)

(assert (=> start!116842 m!1260123))

(declare-fun m!1260125 () Bool)

(assert (=> b!1376226 m!1260125))

(declare-fun m!1260127 () Bool)

(assert (=> b!1376227 m!1260127))

(declare-fun m!1260129 () Bool)

(assert (=> b!1376227 m!1260129))

(declare-fun m!1260131 () Bool)

(assert (=> b!1376227 m!1260131))

(declare-fun m!1260133 () Bool)

(assert (=> b!1376227 m!1260133))

(declare-fun m!1260135 () Bool)

(assert (=> b!1376225 m!1260135))

(assert (=> b!1376225 m!1260135))

(declare-fun m!1260137 () Bool)

(assert (=> b!1376225 m!1260137))

(check-sat (not b!1376224) (not start!116842) (not b!1376225) (not b!1376227) (not b!1376226))
(check-sat)
(get-model)

(declare-fun bm!65722 () Bool)

(declare-fun call!65725 () (_ BitVec 32))

(assert (=> bm!65722 (= call!65725 (arrayCountValidKeys!0 lt!604403 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun d!148635 () Bool)

(declare-fun lt!604419 () (_ BitVec 32))

(assert (=> d!148635 (and (bvsge lt!604419 #b00000000000000000000000000000000) (bvsle lt!604419 (bvsub (size!45660 lt!604403) #b00000000000000000000000000000000)))))

(declare-fun e!779760 () (_ BitVec 32))

(assert (=> d!148635 (= lt!604419 e!779760)))

(declare-fun c!128281 () Bool)

(assert (=> d!148635 (= c!128281 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148635 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45660 lt!604403)))))

(assert (=> d!148635 (= (arrayCountValidKeys!0 lt!604403 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) lt!604419)))

(declare-fun b!1376266 () Bool)

(declare-fun e!779761 () (_ BitVec 32))

(assert (=> b!1376266 (= e!779761 (bvadd #b00000000000000000000000000000001 call!65725))))

(declare-fun b!1376267 () Bool)

(assert (=> b!1376267 (= e!779761 call!65725)))

(declare-fun b!1376268 () Bool)

(assert (=> b!1376268 (= e!779760 e!779761)))

(declare-fun c!128280 () Bool)

(assert (=> b!1376268 (= c!128280 (validKeyInArray!0 (select (arr!45109 lt!604403) #b00000000000000000000000000000000)))))

(declare-fun b!1376269 () Bool)

(assert (=> b!1376269 (= e!779760 #b00000000000000000000000000000000)))

(assert (= (and d!148635 c!128281) b!1376269))

(assert (= (and d!148635 (not c!128281)) b!1376268))

(assert (= (and b!1376268 c!128280) b!1376266))

(assert (= (and b!1376268 (not c!128280)) b!1376267))

(assert (= (or b!1376266 b!1376267) bm!65722))

(declare-fun m!1260179 () Bool)

(assert (=> bm!65722 m!1260179))

(declare-fun m!1260181 () Bool)

(assert (=> b!1376268 m!1260181))

(assert (=> b!1376268 m!1260181))

(declare-fun m!1260183 () Bool)

(assert (=> b!1376268 m!1260183))

(assert (=> b!1376227 d!148635))

(declare-fun bm!65723 () Bool)

(declare-fun call!65726 () (_ BitVec 32))

(assert (=> bm!65723 (= call!65726 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun d!148637 () Bool)

(declare-fun lt!604420 () (_ BitVec 32))

(assert (=> d!148637 (and (bvsge lt!604420 #b00000000000000000000000000000000) (bvsle lt!604420 (bvsub (size!45660 a!4142) #b00000000000000000000000000000000)))))

(declare-fun e!779762 () (_ BitVec 32))

(assert (=> d!148637 (= lt!604420 e!779762)))

(declare-fun c!128283 () Bool)

(assert (=> d!148637 (= c!128283 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148637 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45660 a!4142)))))

(assert (=> d!148637 (= (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) lt!604420)))

(declare-fun b!1376270 () Bool)

(declare-fun e!779763 () (_ BitVec 32))

(assert (=> b!1376270 (= e!779763 (bvadd #b00000000000000000000000000000001 call!65726))))

(declare-fun b!1376271 () Bool)

(assert (=> b!1376271 (= e!779763 call!65726)))

(declare-fun b!1376272 () Bool)

(assert (=> b!1376272 (= e!779762 e!779763)))

(declare-fun c!128282 () Bool)

(assert (=> b!1376272 (= c!128282 (validKeyInArray!0 (select (arr!45109 a!4142) #b00000000000000000000000000000000)))))

(declare-fun b!1376273 () Bool)

(assert (=> b!1376273 (= e!779762 #b00000000000000000000000000000000)))

(assert (= (and d!148637 c!128283) b!1376273))

(assert (= (and d!148637 (not c!128283)) b!1376272))

(assert (= (and b!1376272 c!128282) b!1376270))

(assert (= (and b!1376272 (not c!128282)) b!1376271))

(assert (= (or b!1376270 b!1376271) bm!65723))

(declare-fun m!1260185 () Bool)

(assert (=> bm!65723 m!1260185))

(declare-fun m!1260187 () Bool)

(assert (=> b!1376272 m!1260187))

(assert (=> b!1376272 m!1260187))

(declare-fun m!1260189 () Bool)

(assert (=> b!1376272 m!1260189))

(assert (=> b!1376227 d!148637))

(declare-fun d!148639 () Bool)

(declare-fun e!779766 () Bool)

(assert (=> d!148639 e!779766))

(declare-fun res!918603 () Bool)

(assert (=> d!148639 (=> (not res!918603) (not e!779766))))

(assert (=> d!148639 (= res!918603 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45660 a!4142))))))

(declare-fun lt!604423 () Unit!45440)

(declare-fun choose!4 (array!93418 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45440)

(assert (=> d!148639 (= lt!604423 (choose!4 a!4142 i!1457 k0!2959 i!1457))))

(assert (=> d!148639 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45660 a!4142)))))

(assert (=> d!148639 (= (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457) lt!604423)))

(declare-fun b!1376276 () Bool)

(assert (=> b!1376276 (= e!779766 (= (arrayCountValidKeys!0 (array!93419 (store (arr!45109 a!4142) i!1457 k0!2959) (size!45660 a!4142)) #b00000000000000000000000000000000 (bvadd i!1457 #b00000000000000000000000000000001)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd i!1457 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(assert (= (and d!148639 res!918603) b!1376276))

(declare-fun m!1260191 () Bool)

(assert (=> d!148639 m!1260191))

(assert (=> b!1376276 m!1260131))

(declare-fun m!1260193 () Bool)

(assert (=> b!1376276 m!1260193))

(declare-fun m!1260195 () Bool)

(assert (=> b!1376276 m!1260195))

(assert (=> b!1376227 d!148639))

(declare-fun d!148645 () Bool)

(assert (=> d!148645 (= (validKeyInArray!0 k0!2959) (and (not (= k0!2959 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2959 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1376226 d!148645))

(declare-fun d!148647 () Bool)

(assert (=> d!148647 (= (validKeyInArray!0 (select (arr!45109 a!4142) i!1457)) (and (not (= (select (arr!45109 a!4142) i!1457) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45109 a!4142) i!1457) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1376225 d!148647))

(declare-fun d!148649 () Bool)

(assert (=> d!148649 (= (array_inv!34390 a!4142) (bvsge (size!45660 a!4142) #b00000000000000000000000000000000))))

(assert (=> start!116842 d!148649))

(declare-fun bm!65726 () Bool)

(declare-fun call!65729 () (_ BitVec 32))

(assert (=> bm!65726 (= call!65729 (arrayCountValidKeys!0 lt!604403 (bvadd #b00000000000000000000000000000001 i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun d!148651 () Bool)

(declare-fun lt!604426 () (_ BitVec 32))

(assert (=> d!148651 (and (bvsge lt!604426 #b00000000000000000000000000000000) (bvsle lt!604426 (bvsub (size!45660 lt!604403) (bvadd #b00000000000000000000000000000001 i!1457))))))

(declare-fun e!779771 () (_ BitVec 32))

(assert (=> d!148651 (= lt!604426 e!779771)))

(declare-fun c!128289 () Bool)

(assert (=> d!148651 (= c!128289 (bvsge (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148651 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45660 lt!604403)))))

(assert (=> d!148651 (= (arrayCountValidKeys!0 lt!604403 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) lt!604426)))

(declare-fun b!1376285 () Bool)

(declare-fun e!779772 () (_ BitVec 32))

(assert (=> b!1376285 (= e!779772 (bvadd #b00000000000000000000000000000001 call!65729))))

(declare-fun b!1376286 () Bool)

(assert (=> b!1376286 (= e!779772 call!65729)))

(declare-fun b!1376287 () Bool)

(assert (=> b!1376287 (= e!779771 e!779772)))

(declare-fun c!128288 () Bool)

(assert (=> b!1376287 (= c!128288 (validKeyInArray!0 (select (arr!45109 lt!604403) (bvadd #b00000000000000000000000000000001 i!1457))))))

(declare-fun b!1376288 () Bool)

(assert (=> b!1376288 (= e!779771 #b00000000000000000000000000000000)))

(assert (= (and d!148651 c!128289) b!1376288))

(assert (= (and d!148651 (not c!128289)) b!1376287))

(assert (= (and b!1376287 c!128288) b!1376285))

(assert (= (and b!1376287 (not c!128288)) b!1376286))

(assert (= (or b!1376285 b!1376286) bm!65726))

(declare-fun m!1260197 () Bool)

(assert (=> bm!65726 m!1260197))

(declare-fun m!1260199 () Bool)

(assert (=> b!1376287 m!1260199))

(assert (=> b!1376287 m!1260199))

(declare-fun m!1260201 () Bool)

(assert (=> b!1376287 m!1260201))

(assert (=> b!1376224 d!148651))

(declare-fun bm!65728 () Bool)

(declare-fun call!65731 () (_ BitVec 32))

(assert (=> bm!65728 (= call!65731 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun d!148653 () Bool)

(declare-fun lt!604428 () (_ BitVec 32))

(assert (=> d!148653 (and (bvsge lt!604428 #b00000000000000000000000000000000) (bvsle lt!604428 (bvsub (size!45660 a!4142) (bvadd #b00000000000000000000000000000001 i!1457))))))

(declare-fun e!779775 () (_ BitVec 32))

(assert (=> d!148653 (= lt!604428 e!779775)))

(declare-fun c!128293 () Bool)

(assert (=> d!148653 (= c!128293 (bvsge (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148653 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45660 a!4142)))))

(assert (=> d!148653 (= (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) lt!604428)))

(declare-fun b!1376293 () Bool)

(declare-fun e!779776 () (_ BitVec 32))

(assert (=> b!1376293 (= e!779776 (bvadd #b00000000000000000000000000000001 call!65731))))

(declare-fun b!1376294 () Bool)

(assert (=> b!1376294 (= e!779776 call!65731)))

(declare-fun b!1376295 () Bool)

(assert (=> b!1376295 (= e!779775 e!779776)))

(declare-fun c!128292 () Bool)

(assert (=> b!1376295 (= c!128292 (validKeyInArray!0 (select (arr!45109 a!4142) (bvadd #b00000000000000000000000000000001 i!1457))))))

(declare-fun b!1376296 () Bool)

(assert (=> b!1376296 (= e!779775 #b00000000000000000000000000000000)))

(assert (= (and d!148653 c!128293) b!1376296))

(assert (= (and d!148653 (not c!128293)) b!1376295))

(assert (= (and b!1376295 c!128292) b!1376293))

(assert (= (and b!1376295 (not c!128292)) b!1376294))

(assert (= (or b!1376293 b!1376294) bm!65728))

(declare-fun m!1260205 () Bool)

(assert (=> bm!65728 m!1260205))

(declare-fun m!1260209 () Bool)

(assert (=> b!1376295 m!1260209))

(assert (=> b!1376295 m!1260209))

(declare-fun m!1260213 () Bool)

(assert (=> b!1376295 m!1260213))

(assert (=> b!1376224 d!148653))

(check-sat (not bm!65728) (not b!1376295) (not b!1376272) (not b!1376287) (not d!148639) (not b!1376268) (not b!1376276) (not bm!65726) (not bm!65722) (not bm!65723))
(check-sat)
