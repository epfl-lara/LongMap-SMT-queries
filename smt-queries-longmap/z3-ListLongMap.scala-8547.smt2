; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104264 () Bool)

(assert start!104264)

(declare-fun res!830981 () Bool)

(declare-fun e!706252 () Bool)

(assert (=> start!104264 (=> (not res!830981) (not e!706252))))

(declare-datatypes ((array!80111 0))(
  ( (array!80112 (arr!38639 (Array (_ BitVec 32) (_ BitVec 64))) (size!39177 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80111)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104264 (= res!830981 (and (bvslt (size!39177 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39177 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39177 a!3892))))))

(assert (=> start!104264 e!706252))

(declare-fun array_inv!29622 (array!80111) Bool)

(assert (=> start!104264 (array_inv!29622 a!3892)))

(assert (=> start!104264 true))

(declare-fun b!1245476 () Bool)

(declare-fun res!830978 () Bool)

(declare-fun e!706254 () Bool)

(assert (=> b!1245476 (=> (not res!830978) (not e!706254))))

(declare-datatypes ((List!27543 0))(
  ( (Nil!27540) (Cons!27539 (h!28748 (_ BitVec 64)) (t!41003 List!27543)) )
))
(declare-fun lt!562760 () List!27543)

(declare-fun noDuplicate!2044 (List!27543) Bool)

(assert (=> b!1245476 (= res!830978 (noDuplicate!2044 lt!562760))))

(declare-fun b!1245477 () Bool)

(declare-fun res!830982 () Bool)

(assert (=> b!1245477 (=> (not res!830982) (not e!706252))))

(declare-fun arrayNoDuplicates!0 (array!80111 (_ BitVec 32) List!27543) Bool)

(assert (=> b!1245477 (= res!830982 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27540))))

(declare-fun b!1245478 () Bool)

(declare-fun e!706253 () Bool)

(declare-fun contains!7419 (List!27543 (_ BitVec 64)) Bool)

(assert (=> b!1245478 (= e!706253 (contains!7419 lt!562760 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245479 () Bool)

(assert (=> b!1245479 (= e!706254 e!706253)))

(declare-fun res!830980 () Bool)

(assert (=> b!1245479 (=> res!830980 e!706253)))

(assert (=> b!1245479 (= res!830980 (contains!7419 lt!562760 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245480 () Bool)

(assert (=> b!1245480 (= e!706252 e!706254)))

(declare-fun res!830979 () Bool)

(assert (=> b!1245480 (=> (not res!830979) (not e!706254))))

(assert (=> b!1245480 (= res!830979 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1245480 (= lt!562760 (Cons!27539 (select (arr!38639 a!3892) from!3270) Nil!27540))))

(declare-fun b!1245481 () Bool)

(declare-fun res!830983 () Bool)

(assert (=> b!1245481 (=> (not res!830983) (not e!706252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245481 (= res!830983 (validKeyInArray!0 (select (arr!38639 a!3892) from!3270)))))

(declare-fun b!1245482 () Bool)

(declare-fun res!830977 () Bool)

(assert (=> b!1245482 (=> (not res!830977) (not e!706252))))

(assert (=> b!1245482 (= res!830977 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39177 a!3892)) (not (= newFrom!287 (size!39177 a!3892)))))))

(assert (= (and start!104264 res!830981) b!1245477))

(assert (= (and b!1245477 res!830982) b!1245482))

(assert (= (and b!1245482 res!830977) b!1245481))

(assert (= (and b!1245481 res!830983) b!1245480))

(assert (= (and b!1245480 res!830979) b!1245476))

(assert (= (and b!1245476 res!830978) b!1245479))

(assert (= (and b!1245479 (not res!830980)) b!1245478))

(declare-fun m!1147067 () Bool)

(assert (=> b!1245476 m!1147067))

(declare-fun m!1147069 () Bool)

(assert (=> b!1245478 m!1147069))

(declare-fun m!1147071 () Bool)

(assert (=> b!1245479 m!1147071))

(declare-fun m!1147073 () Bool)

(assert (=> start!104264 m!1147073))

(declare-fun m!1147075 () Bool)

(assert (=> b!1245481 m!1147075))

(assert (=> b!1245481 m!1147075))

(declare-fun m!1147077 () Bool)

(assert (=> b!1245481 m!1147077))

(assert (=> b!1245480 m!1147075))

(declare-fun m!1147079 () Bool)

(assert (=> b!1245477 m!1147079))

(check-sat (not b!1245476) (not start!104264) (not b!1245479) (not b!1245481) (not b!1245477) (not b!1245478))
(check-sat)
(get-model)

(declare-fun d!137273 () Bool)

(assert (=> d!137273 (= (array_inv!29622 a!3892) (bvsge (size!39177 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104264 d!137273))

(declare-fun d!137275 () Bool)

(declare-fun lt!562769 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!619 (List!27543) (InoxSet (_ BitVec 64)))

(assert (=> d!137275 (= lt!562769 (select (content!619 lt!562760) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706284 () Bool)

(assert (=> d!137275 (= lt!562769 e!706284)))

(declare-fun res!831031 () Bool)

(assert (=> d!137275 (=> (not res!831031) (not e!706284))))

(get-info :version)

(assert (=> d!137275 (= res!831031 ((_ is Cons!27539) lt!562760))))

(assert (=> d!137275 (= (contains!7419 lt!562760 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562769)))

(declare-fun b!1245529 () Bool)

(declare-fun e!706285 () Bool)

(assert (=> b!1245529 (= e!706284 e!706285)))

(declare-fun res!831030 () Bool)

(assert (=> b!1245529 (=> res!831030 e!706285)))

(assert (=> b!1245529 (= res!831030 (= (h!28748 lt!562760) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245530 () Bool)

(assert (=> b!1245530 (= e!706285 (contains!7419 (t!41003 lt!562760) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137275 res!831031) b!1245529))

(assert (= (and b!1245529 (not res!831030)) b!1245530))

(declare-fun m!1147109 () Bool)

(assert (=> d!137275 m!1147109))

(declare-fun m!1147111 () Bool)

(assert (=> d!137275 m!1147111))

(declare-fun m!1147113 () Bool)

(assert (=> b!1245530 m!1147113))

(assert (=> b!1245478 d!137275))

(declare-fun b!1245545 () Bool)

(declare-fun e!706301 () Bool)

(declare-fun call!61470 () Bool)

(assert (=> b!1245545 (= e!706301 call!61470)))

(declare-fun d!137277 () Bool)

(declare-fun res!831043 () Bool)

(declare-fun e!706299 () Bool)

(assert (=> d!137277 (=> res!831043 e!706299)))

(assert (=> d!137277 (= res!831043 (bvsge from!3270 (size!39177 a!3892)))))

(assert (=> d!137277 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27540) e!706299)))

(declare-fun b!1245546 () Bool)

(declare-fun e!706298 () Bool)

(assert (=> b!1245546 (= e!706299 e!706298)))

(declare-fun res!831044 () Bool)

(assert (=> b!1245546 (=> (not res!831044) (not e!706298))))

(declare-fun e!706300 () Bool)

(assert (=> b!1245546 (= res!831044 (not e!706300))))

(declare-fun res!831042 () Bool)

(assert (=> b!1245546 (=> (not res!831042) (not e!706300))))

(assert (=> b!1245546 (= res!831042 (validKeyInArray!0 (select (arr!38639 a!3892) from!3270)))))

(declare-fun b!1245547 () Bool)

(assert (=> b!1245547 (= e!706298 e!706301)))

(declare-fun c!121939 () Bool)

(assert (=> b!1245547 (= c!121939 (validKeyInArray!0 (select (arr!38639 a!3892) from!3270)))))

(declare-fun b!1245548 () Bool)

(assert (=> b!1245548 (= e!706300 (contains!7419 Nil!27540 (select (arr!38639 a!3892) from!3270)))))

(declare-fun b!1245549 () Bool)

(assert (=> b!1245549 (= e!706301 call!61470)))

(declare-fun bm!61467 () Bool)

(assert (=> bm!61467 (= call!61470 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121939 (Cons!27539 (select (arr!38639 a!3892) from!3270) Nil!27540) Nil!27540)))))

(assert (= (and d!137277 (not res!831043)) b!1245546))

(assert (= (and b!1245546 res!831042) b!1245548))

(assert (= (and b!1245546 res!831044) b!1245547))

(assert (= (and b!1245547 c!121939) b!1245545))

(assert (= (and b!1245547 (not c!121939)) b!1245549))

(assert (= (or b!1245545 b!1245549) bm!61467))

(assert (=> b!1245546 m!1147075))

(assert (=> b!1245546 m!1147075))

(assert (=> b!1245546 m!1147077))

(assert (=> b!1245547 m!1147075))

(assert (=> b!1245547 m!1147075))

(assert (=> b!1245547 m!1147077))

(assert (=> b!1245548 m!1147075))

(assert (=> b!1245548 m!1147075))

(declare-fun m!1147115 () Bool)

(assert (=> b!1245548 m!1147115))

(assert (=> bm!61467 m!1147075))

(declare-fun m!1147117 () Bool)

(assert (=> bm!61467 m!1147117))

(assert (=> b!1245477 d!137277))

(declare-fun d!137289 () Bool)

(declare-fun res!831063 () Bool)

(declare-fun e!706320 () Bool)

(assert (=> d!137289 (=> res!831063 e!706320)))

(assert (=> d!137289 (= res!831063 ((_ is Nil!27540) lt!562760))))

(assert (=> d!137289 (= (noDuplicate!2044 lt!562760) e!706320)))

(declare-fun b!1245568 () Bool)

(declare-fun e!706321 () Bool)

(assert (=> b!1245568 (= e!706320 e!706321)))

(declare-fun res!831064 () Bool)

(assert (=> b!1245568 (=> (not res!831064) (not e!706321))))

(assert (=> b!1245568 (= res!831064 (not (contains!7419 (t!41003 lt!562760) (h!28748 lt!562760))))))

(declare-fun b!1245569 () Bool)

(assert (=> b!1245569 (= e!706321 (noDuplicate!2044 (t!41003 lt!562760)))))

(assert (= (and d!137289 (not res!831063)) b!1245568))

(assert (= (and b!1245568 res!831064) b!1245569))

(declare-fun m!1147133 () Bool)

(assert (=> b!1245568 m!1147133))

(declare-fun m!1147135 () Bool)

(assert (=> b!1245569 m!1147135))

(assert (=> b!1245476 d!137289))

(declare-fun d!137297 () Bool)

(assert (=> d!137297 (= (validKeyInArray!0 (select (arr!38639 a!3892) from!3270)) (and (not (= (select (arr!38639 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38639 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1245481 d!137297))

(declare-fun d!137301 () Bool)

(declare-fun lt!562774 () Bool)

(assert (=> d!137301 (= lt!562774 (select (content!619 lt!562760) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706324 () Bool)

(assert (=> d!137301 (= lt!562774 e!706324)))

(declare-fun res!831068 () Bool)

(assert (=> d!137301 (=> (not res!831068) (not e!706324))))

(assert (=> d!137301 (= res!831068 ((_ is Cons!27539) lt!562760))))

(assert (=> d!137301 (= (contains!7419 lt!562760 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562774)))

(declare-fun b!1245572 () Bool)

(declare-fun e!706325 () Bool)

(assert (=> b!1245572 (= e!706324 e!706325)))

(declare-fun res!831067 () Bool)

(assert (=> b!1245572 (=> res!831067 e!706325)))

(assert (=> b!1245572 (= res!831067 (= (h!28748 lt!562760) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245573 () Bool)

(assert (=> b!1245573 (= e!706325 (contains!7419 (t!41003 lt!562760) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137301 res!831068) b!1245572))

(assert (= (and b!1245572 (not res!831067)) b!1245573))

(assert (=> d!137301 m!1147109))

(declare-fun m!1147141 () Bool)

(assert (=> d!137301 m!1147141))

(declare-fun m!1147143 () Bool)

(assert (=> b!1245573 m!1147143))

(assert (=> b!1245479 d!137301))

(check-sat (not d!137301) (not b!1245573) (not b!1245546) (not b!1245547) (not b!1245569) (not b!1245548) (not b!1245530) (not bm!61467) (not d!137275) (not b!1245568))
(check-sat)
(get-model)

(declare-fun d!137309 () Bool)

(declare-fun lt!562779 () Bool)

(assert (=> d!137309 (= lt!562779 (select (content!619 Nil!27540) (select (arr!38639 a!3892) from!3270)))))

(declare-fun e!706358 () Bool)

(assert (=> d!137309 (= lt!562779 e!706358)))

(declare-fun res!831096 () Bool)

(assert (=> d!137309 (=> (not res!831096) (not e!706358))))

(assert (=> d!137309 (= res!831096 ((_ is Cons!27539) Nil!27540))))

(assert (=> d!137309 (= (contains!7419 Nil!27540 (select (arr!38639 a!3892) from!3270)) lt!562779)))

(declare-fun b!1245612 () Bool)

(declare-fun e!706359 () Bool)

(assert (=> b!1245612 (= e!706358 e!706359)))

(declare-fun res!831095 () Bool)

(assert (=> b!1245612 (=> res!831095 e!706359)))

(assert (=> b!1245612 (= res!831095 (= (h!28748 Nil!27540) (select (arr!38639 a!3892) from!3270)))))

(declare-fun b!1245613 () Bool)

(assert (=> b!1245613 (= e!706359 (contains!7419 (t!41003 Nil!27540) (select (arr!38639 a!3892) from!3270)))))

(assert (= (and d!137309 res!831096) b!1245612))

(assert (= (and b!1245612 (not res!831095)) b!1245613))

(declare-fun m!1147163 () Bool)

(assert (=> d!137309 m!1147163))

(assert (=> d!137309 m!1147075))

(declare-fun m!1147165 () Bool)

(assert (=> d!137309 m!1147165))

(assert (=> b!1245613 m!1147075))

(declare-fun m!1147167 () Bool)

(assert (=> b!1245613 m!1147167))

(assert (=> b!1245548 d!137309))

(declare-fun d!137311 () Bool)

(declare-fun lt!562780 () Bool)

(assert (=> d!137311 (= lt!562780 (select (content!619 (t!41003 lt!562760)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706360 () Bool)

(assert (=> d!137311 (= lt!562780 e!706360)))

(declare-fun res!831098 () Bool)

(assert (=> d!137311 (=> (not res!831098) (not e!706360))))

(assert (=> d!137311 (= res!831098 ((_ is Cons!27539) (t!41003 lt!562760)))))

(assert (=> d!137311 (= (contains!7419 (t!41003 lt!562760) #b0000000000000000000000000000000000000000000000000000000000000000) lt!562780)))

(declare-fun b!1245614 () Bool)

(declare-fun e!706361 () Bool)

(assert (=> b!1245614 (= e!706360 e!706361)))

(declare-fun res!831097 () Bool)

(assert (=> b!1245614 (=> res!831097 e!706361)))

(assert (=> b!1245614 (= res!831097 (= (h!28748 (t!41003 lt!562760)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245615 () Bool)

(assert (=> b!1245615 (= e!706361 (contains!7419 (t!41003 (t!41003 lt!562760)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137311 res!831098) b!1245614))

(assert (= (and b!1245614 (not res!831097)) b!1245615))

(declare-fun m!1147169 () Bool)

(assert (=> d!137311 m!1147169))

(declare-fun m!1147171 () Bool)

(assert (=> d!137311 m!1147171))

(declare-fun m!1147173 () Bool)

(assert (=> b!1245615 m!1147173))

(assert (=> b!1245573 d!137311))

(assert (=> b!1245547 d!137297))

(declare-fun d!137313 () Bool)

(declare-fun c!121948 () Bool)

(assert (=> d!137313 (= c!121948 ((_ is Nil!27540) lt!562760))))

(declare-fun e!706364 () (InoxSet (_ BitVec 64)))

(assert (=> d!137313 (= (content!619 lt!562760) e!706364)))

(declare-fun b!1245620 () Bool)

(assert (=> b!1245620 (= e!706364 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1245621 () Bool)

(assert (=> b!1245621 (= e!706364 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!28748 lt!562760) true) (content!619 (t!41003 lt!562760))))))

(assert (= (and d!137313 c!121948) b!1245620))

(assert (= (and d!137313 (not c!121948)) b!1245621))

(declare-fun m!1147175 () Bool)

(assert (=> b!1245621 m!1147175))

(assert (=> b!1245621 m!1147169))

(assert (=> d!137275 d!137313))

(assert (=> d!137301 d!137313))

(declare-fun d!137315 () Bool)

(declare-fun lt!562781 () Bool)

(assert (=> d!137315 (= lt!562781 (select (content!619 (t!41003 lt!562760)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706365 () Bool)

(assert (=> d!137315 (= lt!562781 e!706365)))

(declare-fun res!831100 () Bool)

(assert (=> d!137315 (=> (not res!831100) (not e!706365))))

(assert (=> d!137315 (= res!831100 ((_ is Cons!27539) (t!41003 lt!562760)))))

(assert (=> d!137315 (= (contains!7419 (t!41003 lt!562760) #b1000000000000000000000000000000000000000000000000000000000000000) lt!562781)))

(declare-fun b!1245622 () Bool)

(declare-fun e!706366 () Bool)

(assert (=> b!1245622 (= e!706365 e!706366)))

(declare-fun res!831099 () Bool)

(assert (=> b!1245622 (=> res!831099 e!706366)))

(assert (=> b!1245622 (= res!831099 (= (h!28748 (t!41003 lt!562760)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245623 () Bool)

(assert (=> b!1245623 (= e!706366 (contains!7419 (t!41003 (t!41003 lt!562760)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137315 res!831100) b!1245622))

(assert (= (and b!1245622 (not res!831099)) b!1245623))

(assert (=> d!137315 m!1147169))

(declare-fun m!1147177 () Bool)

(assert (=> d!137315 m!1147177))

(declare-fun m!1147179 () Bool)

(assert (=> b!1245623 m!1147179))

(assert (=> b!1245530 d!137315))

(declare-fun d!137317 () Bool)

(declare-fun res!831101 () Bool)

(declare-fun e!706367 () Bool)

(assert (=> d!137317 (=> res!831101 e!706367)))

(assert (=> d!137317 (= res!831101 ((_ is Nil!27540) (t!41003 lt!562760)))))

(assert (=> d!137317 (= (noDuplicate!2044 (t!41003 lt!562760)) e!706367)))

(declare-fun b!1245624 () Bool)

(declare-fun e!706368 () Bool)

(assert (=> b!1245624 (= e!706367 e!706368)))

(declare-fun res!831102 () Bool)

(assert (=> b!1245624 (=> (not res!831102) (not e!706368))))

(assert (=> b!1245624 (= res!831102 (not (contains!7419 (t!41003 (t!41003 lt!562760)) (h!28748 (t!41003 lt!562760)))))))

(declare-fun b!1245625 () Bool)

(assert (=> b!1245625 (= e!706368 (noDuplicate!2044 (t!41003 (t!41003 lt!562760))))))

(assert (= (and d!137317 (not res!831101)) b!1245624))

(assert (= (and b!1245624 res!831102) b!1245625))

(declare-fun m!1147181 () Bool)

(assert (=> b!1245624 m!1147181))

(declare-fun m!1147183 () Bool)

(assert (=> b!1245625 m!1147183))

(assert (=> b!1245569 d!137317))

(assert (=> b!1245546 d!137297))

(declare-fun b!1245626 () Bool)

(declare-fun e!706372 () Bool)

(declare-fun call!61477 () Bool)

(assert (=> b!1245626 (= e!706372 call!61477)))

(declare-fun d!137319 () Bool)

(declare-fun res!831104 () Bool)

(declare-fun e!706370 () Bool)

(assert (=> d!137319 (=> res!831104 e!706370)))

(assert (=> d!137319 (= res!831104 (bvsge (bvadd from!3270 #b00000000000000000000000000000001) (size!39177 a!3892)))))

(assert (=> d!137319 (= (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121939 (Cons!27539 (select (arr!38639 a!3892) from!3270) Nil!27540) Nil!27540)) e!706370)))

(declare-fun b!1245627 () Bool)

(declare-fun e!706369 () Bool)

(assert (=> b!1245627 (= e!706370 e!706369)))

(declare-fun res!831105 () Bool)

(assert (=> b!1245627 (=> (not res!831105) (not e!706369))))

(declare-fun e!706371 () Bool)

(assert (=> b!1245627 (= res!831105 (not e!706371))))

(declare-fun res!831103 () Bool)

(assert (=> b!1245627 (=> (not res!831103) (not e!706371))))

(assert (=> b!1245627 (= res!831103 (validKeyInArray!0 (select (arr!38639 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(declare-fun b!1245628 () Bool)

(assert (=> b!1245628 (= e!706369 e!706372)))

(declare-fun c!121949 () Bool)

(assert (=> b!1245628 (= c!121949 (validKeyInArray!0 (select (arr!38639 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(declare-fun b!1245629 () Bool)

(assert (=> b!1245629 (= e!706371 (contains!7419 (ite c!121939 (Cons!27539 (select (arr!38639 a!3892) from!3270) Nil!27540) Nil!27540) (select (arr!38639 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(declare-fun b!1245630 () Bool)

(assert (=> b!1245630 (= e!706372 call!61477)))

(declare-fun bm!61474 () Bool)

(assert (=> bm!61474 (= call!61477 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!121949 (Cons!27539 (select (arr!38639 a!3892) (bvadd from!3270 #b00000000000000000000000000000001)) (ite c!121939 (Cons!27539 (select (arr!38639 a!3892) from!3270) Nil!27540) Nil!27540)) (ite c!121939 (Cons!27539 (select (arr!38639 a!3892) from!3270) Nil!27540) Nil!27540))))))

(assert (= (and d!137319 (not res!831104)) b!1245627))

(assert (= (and b!1245627 res!831103) b!1245629))

(assert (= (and b!1245627 res!831105) b!1245628))

(assert (= (and b!1245628 c!121949) b!1245626))

(assert (= (and b!1245628 (not c!121949)) b!1245630))

(assert (= (or b!1245626 b!1245630) bm!61474))

(declare-fun m!1147185 () Bool)

(assert (=> b!1245627 m!1147185))

(assert (=> b!1245627 m!1147185))

(declare-fun m!1147187 () Bool)

(assert (=> b!1245627 m!1147187))

(assert (=> b!1245628 m!1147185))

(assert (=> b!1245628 m!1147185))

(assert (=> b!1245628 m!1147187))

(assert (=> b!1245629 m!1147185))

(assert (=> b!1245629 m!1147185))

(declare-fun m!1147189 () Bool)

(assert (=> b!1245629 m!1147189))

(assert (=> bm!61474 m!1147185))

(declare-fun m!1147191 () Bool)

(assert (=> bm!61474 m!1147191))

(assert (=> bm!61467 d!137319))

(declare-fun d!137321 () Bool)

(declare-fun lt!562782 () Bool)

(assert (=> d!137321 (= lt!562782 (select (content!619 (t!41003 lt!562760)) (h!28748 lt!562760)))))

(declare-fun e!706373 () Bool)

(assert (=> d!137321 (= lt!562782 e!706373)))

(declare-fun res!831107 () Bool)

(assert (=> d!137321 (=> (not res!831107) (not e!706373))))

(assert (=> d!137321 (= res!831107 ((_ is Cons!27539) (t!41003 lt!562760)))))

(assert (=> d!137321 (= (contains!7419 (t!41003 lt!562760) (h!28748 lt!562760)) lt!562782)))

(declare-fun b!1245631 () Bool)

(declare-fun e!706374 () Bool)

(assert (=> b!1245631 (= e!706373 e!706374)))

(declare-fun res!831106 () Bool)

(assert (=> b!1245631 (=> res!831106 e!706374)))

(assert (=> b!1245631 (= res!831106 (= (h!28748 (t!41003 lt!562760)) (h!28748 lt!562760)))))

(declare-fun b!1245632 () Bool)

(assert (=> b!1245632 (= e!706374 (contains!7419 (t!41003 (t!41003 lt!562760)) (h!28748 lt!562760)))))

(assert (= (and d!137321 res!831107) b!1245631))

(assert (= (and b!1245631 (not res!831106)) b!1245632))

(assert (=> d!137321 m!1147169))

(declare-fun m!1147193 () Bool)

(assert (=> d!137321 m!1147193))

(declare-fun m!1147195 () Bool)

(assert (=> b!1245632 m!1147195))

(assert (=> b!1245568 d!137321))

(check-sat (not d!137315) (not b!1245629) (not bm!61474) (not b!1245625) (not b!1245628) (not b!1245632) (not d!137321) (not b!1245613) (not b!1245621) (not b!1245627) (not b!1245624) (not b!1245615) (not d!137311) (not b!1245623) (not d!137309))
(check-sat)
