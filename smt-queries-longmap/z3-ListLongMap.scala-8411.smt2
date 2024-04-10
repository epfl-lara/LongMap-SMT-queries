; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102320 () Bool)

(assert start!102320)

(declare-fun b!1231287 () Bool)

(declare-fun res!819731 () Bool)

(declare-fun e!698477 () Bool)

(assert (=> b!1231287 (=> res!819731 e!698477)))

(declare-datatypes ((List!27104 0))(
  ( (Nil!27101) (Cons!27100 (h!28309 (_ BitVec 64)) (t!40567 List!27104)) )
))
(declare-fun contains!7166 (List!27104 (_ BitVec 64)) Bool)

(assert (=> b!1231287 (= res!819731 (contains!7166 Nil!27101 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231288 () Bool)

(declare-fun res!819732 () Bool)

(declare-fun e!698478 () Bool)

(assert (=> b!1231288 (=> (not res!819732) (not e!698478))))

(declare-fun acc!823 () List!27104)

(assert (=> b!1231288 (= res!819732 (not (contains!7166 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231289 () Bool)

(declare-fun res!819734 () Bool)

(assert (=> b!1231289 (=> res!819734 e!698477)))

(assert (=> b!1231289 (= res!819734 (contains!7166 Nil!27101 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231290 () Bool)

(declare-fun res!819736 () Bool)

(assert (=> b!1231290 (=> (not res!819736) (not e!698478))))

(declare-datatypes ((array!79429 0))(
  ( (array!79430 (arr!38331 (Array (_ BitVec 32) (_ BitVec 64))) (size!38867 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79429)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79429 (_ BitVec 32) List!27104) Bool)

(assert (=> b!1231290 (= res!819736 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231291 () Bool)

(declare-fun res!819725 () Bool)

(assert (=> b!1231291 (=> (not res!819725) (not e!698478))))

(declare-fun noDuplicate!1763 (List!27104) Bool)

(assert (=> b!1231291 (= res!819725 (noDuplicate!1763 acc!823))))

(declare-fun b!1231293 () Bool)

(declare-fun res!819726 () Bool)

(assert (=> b!1231293 (=> (not res!819726) (not e!698478))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231293 (= res!819726 (validKeyInArray!0 k0!2913))))

(declare-fun b!1231294 () Bool)

(assert (=> b!1231294 (= e!698478 (not e!698477))))

(declare-fun res!819735 () Bool)

(assert (=> b!1231294 (=> res!819735 e!698477)))

(assert (=> b!1231294 (= res!819735 (bvsgt from!3184 (size!38867 a!3806)))))

(assert (=> b!1231294 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27100 (select (arr!38331 a!3806) from!3184) acc!823))))

(declare-fun b!1231295 () Bool)

(declare-fun res!819727 () Bool)

(assert (=> b!1231295 (=> (not res!819727) (not e!698478))))

(assert (=> b!1231295 (= res!819727 (validKeyInArray!0 (select (arr!38331 a!3806) from!3184)))))

(declare-fun b!1231296 () Bool)

(declare-fun res!819729 () Bool)

(assert (=> b!1231296 (=> (not res!819729) (not e!698478))))

(assert (=> b!1231296 (= res!819729 (not (contains!7166 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231292 () Bool)

(declare-fun res!819728 () Bool)

(assert (=> b!1231292 (=> (not res!819728) (not e!698478))))

(declare-fun arrayContainsKey!0 (array!79429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231292 (= res!819728 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!819730 () Bool)

(assert (=> start!102320 (=> (not res!819730) (not e!698478))))

(assert (=> start!102320 (= res!819730 (bvslt (size!38867 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102320 e!698478))

(declare-fun array_inv!29179 (array!79429) Bool)

(assert (=> start!102320 (array_inv!29179 a!3806)))

(assert (=> start!102320 true))

(declare-fun b!1231297 () Bool)

(declare-fun subseq!501 (List!27104 List!27104) Bool)

(assert (=> b!1231297 (= e!698477 (subseq!501 Nil!27101 acc!823))))

(declare-fun b!1231298 () Bool)

(declare-fun res!819733 () Bool)

(assert (=> b!1231298 (=> (not res!819733) (not e!698478))))

(assert (=> b!1231298 (= res!819733 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38867 a!3806)) (bvslt from!3184 (size!38867 a!3806))))))

(assert (= (and start!102320 res!819730) b!1231293))

(assert (= (and b!1231293 res!819726) b!1231298))

(assert (= (and b!1231298 res!819733) b!1231291))

(assert (= (and b!1231291 res!819725) b!1231288))

(assert (= (and b!1231288 res!819732) b!1231296))

(assert (= (and b!1231296 res!819729) b!1231292))

(assert (= (and b!1231292 res!819728) b!1231290))

(assert (= (and b!1231290 res!819736) b!1231295))

(assert (= (and b!1231295 res!819727) b!1231294))

(assert (= (and b!1231294 (not res!819735)) b!1231289))

(assert (= (and b!1231289 (not res!819734)) b!1231287))

(assert (= (and b!1231287 (not res!819731)) b!1231297))

(declare-fun m!1135479 () Bool)

(assert (=> b!1231296 m!1135479))

(declare-fun m!1135481 () Bool)

(assert (=> b!1231290 m!1135481))

(declare-fun m!1135483 () Bool)

(assert (=> b!1231292 m!1135483))

(declare-fun m!1135485 () Bool)

(assert (=> b!1231295 m!1135485))

(assert (=> b!1231295 m!1135485))

(declare-fun m!1135487 () Bool)

(assert (=> b!1231295 m!1135487))

(declare-fun m!1135489 () Bool)

(assert (=> b!1231289 m!1135489))

(declare-fun m!1135491 () Bool)

(assert (=> b!1231297 m!1135491))

(declare-fun m!1135493 () Bool)

(assert (=> start!102320 m!1135493))

(declare-fun m!1135495 () Bool)

(assert (=> b!1231291 m!1135495))

(declare-fun m!1135497 () Bool)

(assert (=> b!1231287 m!1135497))

(declare-fun m!1135499 () Bool)

(assert (=> b!1231288 m!1135499))

(assert (=> b!1231294 m!1135485))

(declare-fun m!1135501 () Bool)

(assert (=> b!1231294 m!1135501))

(declare-fun m!1135503 () Bool)

(assert (=> b!1231293 m!1135503))

(check-sat (not b!1231294) (not b!1231293) (not b!1231296) (not b!1231288) (not b!1231295) (not b!1231290) (not start!102320) (not b!1231287) (not b!1231289) (not b!1231292) (not b!1231291) (not b!1231297))
(check-sat)
(get-model)

(declare-fun d!134699 () Bool)

(declare-fun lt!559403 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!563 (List!27104) (InoxSet (_ BitVec 64)))

(assert (=> d!134699 (= lt!559403 (select (content!563 Nil!27101) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698492 () Bool)

(assert (=> d!134699 (= lt!559403 e!698492)))

(declare-fun res!819777 () Bool)

(assert (=> d!134699 (=> (not res!819777) (not e!698492))))

(get-info :version)

(assert (=> d!134699 (= res!819777 ((_ is Cons!27100) Nil!27101))))

(assert (=> d!134699 (= (contains!7166 Nil!27101 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559403)))

(declare-fun b!1231339 () Bool)

(declare-fun e!698493 () Bool)

(assert (=> b!1231339 (= e!698492 e!698493)))

(declare-fun res!819778 () Bool)

(assert (=> b!1231339 (=> res!819778 e!698493)))

(assert (=> b!1231339 (= res!819778 (= (h!28309 Nil!27101) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231340 () Bool)

(assert (=> b!1231340 (= e!698493 (contains!7166 (t!40567 Nil!27101) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134699 res!819777) b!1231339))

(assert (= (and b!1231339 (not res!819778)) b!1231340))

(declare-fun m!1135531 () Bool)

(assert (=> d!134699 m!1135531))

(declare-fun m!1135533 () Bool)

(assert (=> d!134699 m!1135533))

(declare-fun m!1135535 () Bool)

(assert (=> b!1231340 m!1135535))

(assert (=> b!1231287 d!134699))

(declare-fun b!1231350 () Bool)

(declare-fun e!698505 () Bool)

(declare-fun e!698503 () Bool)

(assert (=> b!1231350 (= e!698505 e!698503)))

(declare-fun res!819790 () Bool)

(assert (=> b!1231350 (=> res!819790 e!698503)))

(declare-fun e!698504 () Bool)

(assert (=> b!1231350 (= res!819790 e!698504)))

(declare-fun res!819788 () Bool)

(assert (=> b!1231350 (=> (not res!819788) (not e!698504))))

(assert (=> b!1231350 (= res!819788 (= (h!28309 Nil!27101) (h!28309 acc!823)))))

(declare-fun b!1231351 () Bool)

(assert (=> b!1231351 (= e!698504 (subseq!501 (t!40567 Nil!27101) (t!40567 acc!823)))))

(declare-fun d!134701 () Bool)

(declare-fun res!819789 () Bool)

(declare-fun e!698502 () Bool)

(assert (=> d!134701 (=> res!819789 e!698502)))

(assert (=> d!134701 (= res!819789 ((_ is Nil!27101) Nil!27101))))

(assert (=> d!134701 (= (subseq!501 Nil!27101 acc!823) e!698502)))

(declare-fun b!1231352 () Bool)

(assert (=> b!1231352 (= e!698503 (subseq!501 Nil!27101 (t!40567 acc!823)))))

(declare-fun b!1231349 () Bool)

(assert (=> b!1231349 (= e!698502 e!698505)))

(declare-fun res!819787 () Bool)

(assert (=> b!1231349 (=> (not res!819787) (not e!698505))))

(assert (=> b!1231349 (= res!819787 ((_ is Cons!27100) acc!823))))

(assert (= (and d!134701 (not res!819789)) b!1231349))

(assert (= (and b!1231349 res!819787) b!1231350))

(assert (= (and b!1231350 res!819788) b!1231351))

(assert (= (and b!1231350 (not res!819790)) b!1231352))

(declare-fun m!1135537 () Bool)

(assert (=> b!1231351 m!1135537))

(declare-fun m!1135539 () Bool)

(assert (=> b!1231352 m!1135539))

(assert (=> b!1231297 d!134701))

(declare-fun d!134703 () Bool)

(declare-fun lt!559404 () Bool)

(assert (=> d!134703 (= lt!559404 (select (content!563 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698506 () Bool)

(assert (=> d!134703 (= lt!559404 e!698506)))

(declare-fun res!819791 () Bool)

(assert (=> d!134703 (=> (not res!819791) (not e!698506))))

(assert (=> d!134703 (= res!819791 ((_ is Cons!27100) acc!823))))

(assert (=> d!134703 (= (contains!7166 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559404)))

(declare-fun b!1231353 () Bool)

(declare-fun e!698507 () Bool)

(assert (=> b!1231353 (= e!698506 e!698507)))

(declare-fun res!819792 () Bool)

(assert (=> b!1231353 (=> res!819792 e!698507)))

(assert (=> b!1231353 (= res!819792 (= (h!28309 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231354 () Bool)

(assert (=> b!1231354 (= e!698507 (contains!7166 (t!40567 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134703 res!819791) b!1231353))

(assert (= (and b!1231353 (not res!819792)) b!1231354))

(declare-fun m!1135541 () Bool)

(assert (=> d!134703 m!1135541))

(declare-fun m!1135543 () Bool)

(assert (=> d!134703 m!1135543))

(declare-fun m!1135545 () Bool)

(assert (=> b!1231354 m!1135545))

(assert (=> b!1231288 d!134703))

(declare-fun d!134707 () Bool)

(assert (=> d!134707 (= (validKeyInArray!0 (select (arr!38331 a!3806) from!3184)) (and (not (= (select (arr!38331 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38331 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1231295 d!134707))

(declare-fun d!134713 () Bool)

(declare-fun lt!559405 () Bool)

(assert (=> d!134713 (= lt!559405 (select (content!563 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698508 () Bool)

(assert (=> d!134713 (= lt!559405 e!698508)))

(declare-fun res!819793 () Bool)

(assert (=> d!134713 (=> (not res!819793) (not e!698508))))

(assert (=> d!134713 (= res!819793 ((_ is Cons!27100) acc!823))))

(assert (=> d!134713 (= (contains!7166 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559405)))

(declare-fun b!1231355 () Bool)

(declare-fun e!698509 () Bool)

(assert (=> b!1231355 (= e!698508 e!698509)))

(declare-fun res!819794 () Bool)

(assert (=> b!1231355 (=> res!819794 e!698509)))

(assert (=> b!1231355 (= res!819794 (= (h!28309 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231356 () Bool)

(assert (=> b!1231356 (= e!698509 (contains!7166 (t!40567 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134713 res!819793) b!1231355))

(assert (= (and b!1231355 (not res!819794)) b!1231356))

(assert (=> d!134713 m!1135541))

(declare-fun m!1135547 () Bool)

(assert (=> d!134713 m!1135547))

(declare-fun m!1135549 () Bool)

(assert (=> b!1231356 m!1135549))

(assert (=> b!1231296 d!134713))

(declare-fun d!134715 () Bool)

(assert (=> d!134715 (= (array_inv!29179 a!3806) (bvsge (size!38867 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102320 d!134715))

(declare-fun d!134717 () Bool)

(declare-fun res!819811 () Bool)

(declare-fun e!698530 () Bool)

(assert (=> d!134717 (=> res!819811 e!698530)))

(assert (=> d!134717 (= res!819811 (= (select (arr!38331 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!134717 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!698530)))

(declare-fun b!1231381 () Bool)

(declare-fun e!698531 () Bool)

(assert (=> b!1231381 (= e!698530 e!698531)))

(declare-fun res!819812 () Bool)

(assert (=> b!1231381 (=> (not res!819812) (not e!698531))))

(assert (=> b!1231381 (= res!819812 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38867 a!3806)))))

(declare-fun b!1231382 () Bool)

(assert (=> b!1231382 (= e!698531 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134717 (not res!819811)) b!1231381))

(assert (= (and b!1231381 res!819812) b!1231382))

(declare-fun m!1135551 () Bool)

(assert (=> d!134717 m!1135551))

(declare-fun m!1135553 () Bool)

(assert (=> b!1231382 m!1135553))

(assert (=> b!1231292 d!134717))

(declare-fun call!60886 () Bool)

(declare-fun bm!60883 () Bool)

(declare-fun c!120649 () Bool)

(assert (=> bm!60883 (= call!60886 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120649 (Cons!27100 (select (arr!38331 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27100 (select (arr!38331 a!3806) from!3184) acc!823)) (Cons!27100 (select (arr!38331 a!3806) from!3184) acc!823))))))

(declare-fun b!1231411 () Bool)

(declare-fun e!698559 () Bool)

(declare-fun e!698557 () Bool)

(assert (=> b!1231411 (= e!698559 e!698557)))

(declare-fun res!819834 () Bool)

(assert (=> b!1231411 (=> (not res!819834) (not e!698557))))

(declare-fun e!698558 () Bool)

(assert (=> b!1231411 (= res!819834 (not e!698558))))

(declare-fun res!819835 () Bool)

(assert (=> b!1231411 (=> (not res!819835) (not e!698558))))

(assert (=> b!1231411 (= res!819835 (validKeyInArray!0 (select (arr!38331 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231412 () Bool)

(assert (=> b!1231412 (= e!698558 (contains!7166 (Cons!27100 (select (arr!38331 a!3806) from!3184) acc!823) (select (arr!38331 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1231413 () Bool)

(declare-fun e!698556 () Bool)

(assert (=> b!1231413 (= e!698556 call!60886)))

(declare-fun b!1231414 () Bool)

(assert (=> b!1231414 (= e!698557 e!698556)))

(assert (=> b!1231414 (= c!120649 (validKeyInArray!0 (select (arr!38331 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun d!134719 () Bool)

(declare-fun res!819833 () Bool)

(assert (=> d!134719 (=> res!819833 e!698559)))

(assert (=> d!134719 (= res!819833 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38867 a!3806)))))

(assert (=> d!134719 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27100 (select (arr!38331 a!3806) from!3184) acc!823)) e!698559)))

(declare-fun b!1231415 () Bool)

(assert (=> b!1231415 (= e!698556 call!60886)))

(assert (= (and d!134719 (not res!819833)) b!1231411))

(assert (= (and b!1231411 res!819835) b!1231412))

(assert (= (and b!1231411 res!819834) b!1231414))

(assert (= (and b!1231414 c!120649) b!1231413))

(assert (= (and b!1231414 (not c!120649)) b!1231415))

(assert (= (or b!1231413 b!1231415) bm!60883))

(assert (=> bm!60883 m!1135551))

(declare-fun m!1135571 () Bool)

(assert (=> bm!60883 m!1135571))

(assert (=> b!1231411 m!1135551))

(assert (=> b!1231411 m!1135551))

(declare-fun m!1135573 () Bool)

(assert (=> b!1231411 m!1135573))

(assert (=> b!1231412 m!1135551))

(assert (=> b!1231412 m!1135551))

(declare-fun m!1135575 () Bool)

(assert (=> b!1231412 m!1135575))

(assert (=> b!1231414 m!1135551))

(assert (=> b!1231414 m!1135551))

(assert (=> b!1231414 m!1135573))

(assert (=> b!1231294 d!134719))

(declare-fun d!134729 () Bool)

(assert (=> d!134729 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1231293 d!134729))

(declare-fun bm!60884 () Bool)

(declare-fun c!120650 () Bool)

(declare-fun call!60887 () Bool)

(assert (=> bm!60884 (= call!60887 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120650 (Cons!27100 (select (arr!38331 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1231420 () Bool)

(declare-fun e!698567 () Bool)

(declare-fun e!698565 () Bool)

(assert (=> b!1231420 (= e!698567 e!698565)))

(declare-fun res!819841 () Bool)

(assert (=> b!1231420 (=> (not res!819841) (not e!698565))))

(declare-fun e!698566 () Bool)

(assert (=> b!1231420 (= res!819841 (not e!698566))))

(declare-fun res!819842 () Bool)

(assert (=> b!1231420 (=> (not res!819842) (not e!698566))))

(assert (=> b!1231420 (= res!819842 (validKeyInArray!0 (select (arr!38331 a!3806) from!3184)))))

(declare-fun b!1231421 () Bool)

(assert (=> b!1231421 (= e!698566 (contains!7166 acc!823 (select (arr!38331 a!3806) from!3184)))))

(declare-fun b!1231422 () Bool)

(declare-fun e!698564 () Bool)

(assert (=> b!1231422 (= e!698564 call!60887)))

(declare-fun b!1231423 () Bool)

(assert (=> b!1231423 (= e!698565 e!698564)))

(assert (=> b!1231423 (= c!120650 (validKeyInArray!0 (select (arr!38331 a!3806) from!3184)))))

(declare-fun d!134731 () Bool)

(declare-fun res!819840 () Bool)

(assert (=> d!134731 (=> res!819840 e!698567)))

(assert (=> d!134731 (= res!819840 (bvsge from!3184 (size!38867 a!3806)))))

(assert (=> d!134731 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!698567)))

(declare-fun b!1231424 () Bool)

(assert (=> b!1231424 (= e!698564 call!60887)))

(assert (= (and d!134731 (not res!819840)) b!1231420))

(assert (= (and b!1231420 res!819842) b!1231421))

(assert (= (and b!1231420 res!819841) b!1231423))

(assert (= (and b!1231423 c!120650) b!1231422))

(assert (= (and b!1231423 (not c!120650)) b!1231424))

(assert (= (or b!1231422 b!1231424) bm!60884))

(assert (=> bm!60884 m!1135485))

(declare-fun m!1135589 () Bool)

(assert (=> bm!60884 m!1135589))

(assert (=> b!1231420 m!1135485))

(assert (=> b!1231420 m!1135485))

(assert (=> b!1231420 m!1135487))

(assert (=> b!1231421 m!1135485))

(assert (=> b!1231421 m!1135485))

(declare-fun m!1135591 () Bool)

(assert (=> b!1231421 m!1135591))

(assert (=> b!1231423 m!1135485))

(assert (=> b!1231423 m!1135485))

(assert (=> b!1231423 m!1135487))

(assert (=> b!1231290 d!134731))

(declare-fun d!134741 () Bool)

(declare-fun lt!559412 () Bool)

(assert (=> d!134741 (= lt!559412 (select (content!563 Nil!27101) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!698568 () Bool)

(assert (=> d!134741 (= lt!559412 e!698568)))

(declare-fun res!819843 () Bool)

(assert (=> d!134741 (=> (not res!819843) (not e!698568))))

(assert (=> d!134741 (= res!819843 ((_ is Cons!27100) Nil!27101))))

(assert (=> d!134741 (= (contains!7166 Nil!27101 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559412)))

(declare-fun b!1231425 () Bool)

(declare-fun e!698569 () Bool)

(assert (=> b!1231425 (= e!698568 e!698569)))

(declare-fun res!819844 () Bool)

(assert (=> b!1231425 (=> res!819844 e!698569)))

(assert (=> b!1231425 (= res!819844 (= (h!28309 Nil!27101) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231426 () Bool)

(assert (=> b!1231426 (= e!698569 (contains!7166 (t!40567 Nil!27101) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134741 res!819843) b!1231425))

(assert (= (and b!1231425 (not res!819844)) b!1231426))

(assert (=> d!134741 m!1135531))

(declare-fun m!1135593 () Bool)

(assert (=> d!134741 m!1135593))

(declare-fun m!1135595 () Bool)

(assert (=> b!1231426 m!1135595))

(assert (=> b!1231289 d!134741))

(declare-fun d!134743 () Bool)

(declare-fun res!819865 () Bool)

(declare-fun e!698590 () Bool)

(assert (=> d!134743 (=> res!819865 e!698590)))

(assert (=> d!134743 (= res!819865 ((_ is Nil!27101) acc!823))))

(assert (=> d!134743 (= (noDuplicate!1763 acc!823) e!698590)))

(declare-fun b!1231447 () Bool)

(declare-fun e!698591 () Bool)

(assert (=> b!1231447 (= e!698590 e!698591)))

(declare-fun res!819866 () Bool)

(assert (=> b!1231447 (=> (not res!819866) (not e!698591))))

(assert (=> b!1231447 (= res!819866 (not (contains!7166 (t!40567 acc!823) (h!28309 acc!823))))))

(declare-fun b!1231448 () Bool)

(assert (=> b!1231448 (= e!698591 (noDuplicate!1763 (t!40567 acc!823)))))

(assert (= (and d!134743 (not res!819865)) b!1231447))

(assert (= (and b!1231447 res!819866) b!1231448))

(declare-fun m!1135603 () Bool)

(assert (=> b!1231447 m!1135603))

(declare-fun m!1135605 () Bool)

(assert (=> b!1231448 m!1135605))

(assert (=> b!1231291 d!134743))

(check-sat (not b!1231354) (not d!134699) (not b!1231421) (not b!1231414) (not bm!60883) (not b!1231448) (not b!1231351) (not b!1231412) (not d!134713) (not b!1231447) (not d!134741) (not b!1231340) (not b!1231420) (not b!1231411) (not b!1231352) (not b!1231423) (not b!1231356) (not b!1231426) (not b!1231382) (not d!134703) (not bm!60884))
(check-sat)
