; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104270 () Bool)

(assert start!104270)

(declare-fun res!831039 () Bool)

(declare-fun e!706311 () Bool)

(assert (=> start!104270 (=> (not res!831039) (not e!706311))))

(declare-datatypes ((array!80192 0))(
  ( (array!80193 (arr!38679 (Array (_ BitVec 32) (_ BitVec 64))) (size!39215 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80192)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104270 (= res!831039 (and (bvslt (size!39215 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39215 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39215 a!3892))))))

(assert (=> start!104270 e!706311))

(declare-fun array_inv!29527 (array!80192) Bool)

(assert (=> start!104270 (array_inv!29527 a!3892)))

(assert (=> start!104270 true))

(declare-fun b!1245579 () Bool)

(declare-fun res!831038 () Bool)

(assert (=> b!1245579 (=> (not res!831038) (not e!706311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245579 (= res!831038 (validKeyInArray!0 (select (arr!38679 a!3892) from!3270)))))

(declare-fun b!1245580 () Bool)

(declare-fun e!706312 () Bool)

(assert (=> b!1245580 (= e!706311 e!706312)))

(declare-fun res!831043 () Bool)

(assert (=> b!1245580 (=> (not res!831043) (not e!706312))))

(assert (=> b!1245580 (= res!831043 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-datatypes ((List!27482 0))(
  ( (Nil!27479) (Cons!27478 (h!28687 (_ BitVec 64)) (t!40951 List!27482)) )
))
(declare-fun lt!562942 () List!27482)

(assert (=> b!1245580 (= lt!562942 (Cons!27478 (select (arr!38679 a!3892) from!3270) Nil!27479))))

(declare-fun b!1245581 () Bool)

(declare-fun e!706309 () Bool)

(declare-fun contains!7448 (List!27482 (_ BitVec 64)) Bool)

(assert (=> b!1245581 (= e!706309 (contains!7448 lt!562942 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245582 () Bool)

(declare-fun res!831040 () Bool)

(assert (=> b!1245582 (=> (not res!831040) (not e!706311))))

(assert (=> b!1245582 (= res!831040 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39215 a!3892)) (not (= newFrom!287 (size!39215 a!3892)))))))

(declare-fun b!1245583 () Bool)

(declare-fun res!831044 () Bool)

(assert (=> b!1245583 (=> (not res!831044) (not e!706312))))

(declare-fun noDuplicate!2027 (List!27482) Bool)

(assert (=> b!1245583 (= res!831044 (noDuplicate!2027 lt!562942))))

(declare-fun b!1245584 () Bool)

(assert (=> b!1245584 (= e!706312 e!706309)))

(declare-fun res!831042 () Bool)

(assert (=> b!1245584 (=> res!831042 e!706309)))

(assert (=> b!1245584 (= res!831042 (contains!7448 lt!562942 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245585 () Bool)

(declare-fun res!831041 () Bool)

(assert (=> b!1245585 (=> (not res!831041) (not e!706311))))

(declare-fun arrayNoDuplicates!0 (array!80192 (_ BitVec 32) List!27482) Bool)

(assert (=> b!1245585 (= res!831041 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27479))))

(assert (= (and start!104270 res!831039) b!1245585))

(assert (= (and b!1245585 res!831041) b!1245582))

(assert (= (and b!1245582 res!831040) b!1245579))

(assert (= (and b!1245579 res!831038) b!1245580))

(assert (= (and b!1245580 res!831043) b!1245583))

(assert (= (and b!1245583 res!831044) b!1245584))

(assert (= (and b!1245584 (not res!831042)) b!1245581))

(declare-fun m!1147601 () Bool)

(assert (=> b!1245583 m!1147601))

(declare-fun m!1147603 () Bool)

(assert (=> b!1245581 m!1147603))

(declare-fun m!1147605 () Bool)

(assert (=> b!1245579 m!1147605))

(assert (=> b!1245579 m!1147605))

(declare-fun m!1147607 () Bool)

(assert (=> b!1245579 m!1147607))

(declare-fun m!1147609 () Bool)

(assert (=> start!104270 m!1147609))

(assert (=> b!1245580 m!1147605))

(declare-fun m!1147611 () Bool)

(assert (=> b!1245584 m!1147611))

(declare-fun m!1147613 () Bool)

(assert (=> b!1245585 m!1147613))

(check-sat (not b!1245579) (not b!1245585) (not b!1245583) (not b!1245584) (not start!104270) (not b!1245581))
(check-sat)
(get-model)

(declare-fun d!137405 () Bool)

(assert (=> d!137405 (= (array_inv!29527 a!3892) (bvsge (size!39215 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104270 d!137405))

(declare-fun d!137407 () Bool)

(declare-fun lt!562948 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!621 (List!27482) (InoxSet (_ BitVec 64)))

(assert (=> d!137407 (= lt!562948 (select (content!621 lt!562942) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706329 () Bool)

(assert (=> d!137407 (= lt!562948 e!706329)))

(declare-fun res!831070 () Bool)

(assert (=> d!137407 (=> (not res!831070) (not e!706329))))

(get-info :version)

(assert (=> d!137407 (= res!831070 ((_ is Cons!27478) lt!562942))))

(assert (=> d!137407 (= (contains!7448 lt!562942 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562948)))

(declare-fun b!1245611 () Bool)

(declare-fun e!706330 () Bool)

(assert (=> b!1245611 (= e!706329 e!706330)))

(declare-fun res!831071 () Bool)

(assert (=> b!1245611 (=> res!831071 e!706330)))

(assert (=> b!1245611 (= res!831071 (= (h!28687 lt!562942) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245612 () Bool)

(assert (=> b!1245612 (= e!706330 (contains!7448 (t!40951 lt!562942) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137407 res!831070) b!1245611))

(assert (= (and b!1245611 (not res!831071)) b!1245612))

(declare-fun m!1147629 () Bool)

(assert (=> d!137407 m!1147629))

(declare-fun m!1147631 () Bool)

(assert (=> d!137407 m!1147631))

(declare-fun m!1147633 () Bool)

(assert (=> b!1245612 m!1147633))

(assert (=> b!1245581 d!137407))

(declare-fun d!137409 () Bool)

(assert (=> d!137409 (= (validKeyInArray!0 (select (arr!38679 a!3892) from!3270)) (and (not (= (select (arr!38679 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38679 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1245579 d!137409))

(declare-fun b!1245635 () Bool)

(declare-fun e!706354 () Bool)

(declare-fun call!61489 () Bool)

(assert (=> b!1245635 (= e!706354 call!61489)))

(declare-fun b!1245636 () Bool)

(declare-fun e!706351 () Bool)

(assert (=> b!1245636 (= e!706351 (contains!7448 Nil!27479 (select (arr!38679 a!3892) from!3270)))))

(declare-fun c!121957 () Bool)

(declare-fun bm!61486 () Bool)

(assert (=> bm!61486 (= call!61489 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121957 (Cons!27478 (select (arr!38679 a!3892) from!3270) Nil!27479) Nil!27479)))))

(declare-fun b!1245637 () Bool)

(declare-fun e!706353 () Bool)

(declare-fun e!706352 () Bool)

(assert (=> b!1245637 (= e!706353 e!706352)))

(declare-fun res!831091 () Bool)

(assert (=> b!1245637 (=> (not res!831091) (not e!706352))))

(assert (=> b!1245637 (= res!831091 (not e!706351))))

(declare-fun res!831090 () Bool)

(assert (=> b!1245637 (=> (not res!831090) (not e!706351))))

(assert (=> b!1245637 (= res!831090 (validKeyInArray!0 (select (arr!38679 a!3892) from!3270)))))

(declare-fun d!137413 () Bool)

(declare-fun res!831092 () Bool)

(assert (=> d!137413 (=> res!831092 e!706353)))

(assert (=> d!137413 (= res!831092 (bvsge from!3270 (size!39215 a!3892)))))

(assert (=> d!137413 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27479) e!706353)))

(declare-fun b!1245638 () Bool)

(assert (=> b!1245638 (= e!706354 call!61489)))

(declare-fun b!1245639 () Bool)

(assert (=> b!1245639 (= e!706352 e!706354)))

(assert (=> b!1245639 (= c!121957 (validKeyInArray!0 (select (arr!38679 a!3892) from!3270)))))

(assert (= (and d!137413 (not res!831092)) b!1245637))

(assert (= (and b!1245637 res!831090) b!1245636))

(assert (= (and b!1245637 res!831091) b!1245639))

(assert (= (and b!1245639 c!121957) b!1245638))

(assert (= (and b!1245639 (not c!121957)) b!1245635))

(assert (= (or b!1245638 b!1245635) bm!61486))

(assert (=> b!1245636 m!1147605))

(assert (=> b!1245636 m!1147605))

(declare-fun m!1147645 () Bool)

(assert (=> b!1245636 m!1147645))

(assert (=> bm!61486 m!1147605))

(declare-fun m!1147647 () Bool)

(assert (=> bm!61486 m!1147647))

(assert (=> b!1245637 m!1147605))

(assert (=> b!1245637 m!1147605))

(assert (=> b!1245637 m!1147607))

(assert (=> b!1245639 m!1147605))

(assert (=> b!1245639 m!1147605))

(assert (=> b!1245639 m!1147607))

(assert (=> b!1245585 d!137413))

(declare-fun d!137421 () Bool)

(declare-fun res!831099 () Bool)

(declare-fun e!706361 () Bool)

(assert (=> d!137421 (=> res!831099 e!706361)))

(assert (=> d!137421 (= res!831099 ((_ is Nil!27479) lt!562942))))

(assert (=> d!137421 (= (noDuplicate!2027 lt!562942) e!706361)))

(declare-fun b!1245646 () Bool)

(declare-fun e!706362 () Bool)

(assert (=> b!1245646 (= e!706361 e!706362)))

(declare-fun res!831100 () Bool)

(assert (=> b!1245646 (=> (not res!831100) (not e!706362))))

(assert (=> b!1245646 (= res!831100 (not (contains!7448 (t!40951 lt!562942) (h!28687 lt!562942))))))

(declare-fun b!1245647 () Bool)

(assert (=> b!1245647 (= e!706362 (noDuplicate!2027 (t!40951 lt!562942)))))

(assert (= (and d!137421 (not res!831099)) b!1245646))

(assert (= (and b!1245646 res!831100) b!1245647))

(declare-fun m!1147653 () Bool)

(assert (=> b!1245646 m!1147653))

(declare-fun m!1147655 () Bool)

(assert (=> b!1245647 m!1147655))

(assert (=> b!1245583 d!137421))

(declare-fun d!137429 () Bool)

(declare-fun lt!562953 () Bool)

(assert (=> d!137429 (= lt!562953 (select (content!621 lt!562942) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706363 () Bool)

(assert (=> d!137429 (= lt!562953 e!706363)))

(declare-fun res!831101 () Bool)

(assert (=> d!137429 (=> (not res!831101) (not e!706363))))

(assert (=> d!137429 (= res!831101 ((_ is Cons!27478) lt!562942))))

(assert (=> d!137429 (= (contains!7448 lt!562942 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562953)))

(declare-fun b!1245648 () Bool)

(declare-fun e!706364 () Bool)

(assert (=> b!1245648 (= e!706363 e!706364)))

(declare-fun res!831102 () Bool)

(assert (=> b!1245648 (=> res!831102 e!706364)))

(assert (=> b!1245648 (= res!831102 (= (h!28687 lt!562942) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245649 () Bool)

(assert (=> b!1245649 (= e!706364 (contains!7448 (t!40951 lt!562942) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137429 res!831101) b!1245648))

(assert (= (and b!1245648 (not res!831102)) b!1245649))

(assert (=> d!137429 m!1147629))

(declare-fun m!1147657 () Bool)

(assert (=> d!137429 m!1147657))

(declare-fun m!1147659 () Bool)

(assert (=> b!1245649 m!1147659))

(assert (=> b!1245584 d!137429))

(check-sat (not d!137429) (not b!1245637) (not b!1245636) (not b!1245612) (not bm!61486) (not b!1245639) (not b!1245649) (not b!1245647) (not d!137407) (not b!1245646))
(check-sat)
(get-model)

(declare-fun d!137441 () Bool)

(declare-fun c!121966 () Bool)

(assert (=> d!137441 (= c!121966 ((_ is Nil!27479) lt!562942))))

(declare-fun e!706405 () (InoxSet (_ BitVec 64)))

(assert (=> d!137441 (= (content!621 lt!562942) e!706405)))

(declare-fun b!1245698 () Bool)

(assert (=> b!1245698 (= e!706405 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1245699 () Bool)

(assert (=> b!1245699 (= e!706405 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!28687 lt!562942) true) (content!621 (t!40951 lt!562942))))))

(assert (= (and d!137441 c!121966) b!1245698))

(assert (= (and d!137441 (not c!121966)) b!1245699))

(declare-fun m!1147683 () Bool)

(assert (=> b!1245699 m!1147683))

(declare-fun m!1147685 () Bool)

(assert (=> b!1245699 m!1147685))

(assert (=> d!137407 d!137441))

(assert (=> d!137429 d!137441))

(assert (=> b!1245637 d!137409))

(declare-fun d!137443 () Bool)

(declare-fun lt!562958 () Bool)

(assert (=> d!137443 (= lt!562958 (select (content!621 Nil!27479) (select (arr!38679 a!3892) from!3270)))))

(declare-fun e!706406 () Bool)

(assert (=> d!137443 (= lt!562958 e!706406)))

(declare-fun res!831135 () Bool)

(assert (=> d!137443 (=> (not res!831135) (not e!706406))))

(assert (=> d!137443 (= res!831135 ((_ is Cons!27478) Nil!27479))))

(assert (=> d!137443 (= (contains!7448 Nil!27479 (select (arr!38679 a!3892) from!3270)) lt!562958)))

(declare-fun b!1245700 () Bool)

(declare-fun e!706407 () Bool)

(assert (=> b!1245700 (= e!706406 e!706407)))

(declare-fun res!831136 () Bool)

(assert (=> b!1245700 (=> res!831136 e!706407)))

(assert (=> b!1245700 (= res!831136 (= (h!28687 Nil!27479) (select (arr!38679 a!3892) from!3270)))))

(declare-fun b!1245701 () Bool)

(assert (=> b!1245701 (= e!706407 (contains!7448 (t!40951 Nil!27479) (select (arr!38679 a!3892) from!3270)))))

(assert (= (and d!137443 res!831135) b!1245700))

(assert (= (and b!1245700 (not res!831136)) b!1245701))

(declare-fun m!1147687 () Bool)

(assert (=> d!137443 m!1147687))

(assert (=> d!137443 m!1147605))

(declare-fun m!1147689 () Bool)

(assert (=> d!137443 m!1147689))

(assert (=> b!1245701 m!1147605))

(declare-fun m!1147691 () Bool)

(assert (=> b!1245701 m!1147691))

(assert (=> b!1245636 d!137443))

(declare-fun d!137445 () Bool)

(declare-fun res!831137 () Bool)

(declare-fun e!706408 () Bool)

(assert (=> d!137445 (=> res!831137 e!706408)))

(assert (=> d!137445 (= res!831137 ((_ is Nil!27479) (t!40951 lt!562942)))))

(assert (=> d!137445 (= (noDuplicate!2027 (t!40951 lt!562942)) e!706408)))

(declare-fun b!1245702 () Bool)

(declare-fun e!706409 () Bool)

(assert (=> b!1245702 (= e!706408 e!706409)))

(declare-fun res!831138 () Bool)

(assert (=> b!1245702 (=> (not res!831138) (not e!706409))))

(assert (=> b!1245702 (= res!831138 (not (contains!7448 (t!40951 (t!40951 lt!562942)) (h!28687 (t!40951 lt!562942)))))))

(declare-fun b!1245703 () Bool)

(assert (=> b!1245703 (= e!706409 (noDuplicate!2027 (t!40951 (t!40951 lt!562942))))))

(assert (= (and d!137445 (not res!831137)) b!1245702))

(assert (= (and b!1245702 res!831138) b!1245703))

(declare-fun m!1147693 () Bool)

(assert (=> b!1245702 m!1147693))

(declare-fun m!1147695 () Bool)

(assert (=> b!1245703 m!1147695))

(assert (=> b!1245647 d!137445))

(declare-fun d!137447 () Bool)

(declare-fun lt!562959 () Bool)

(assert (=> d!137447 (= lt!562959 (select (content!621 (t!40951 lt!562942)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706410 () Bool)

(assert (=> d!137447 (= lt!562959 e!706410)))

(declare-fun res!831139 () Bool)

(assert (=> d!137447 (=> (not res!831139) (not e!706410))))

(assert (=> d!137447 (= res!831139 ((_ is Cons!27478) (t!40951 lt!562942)))))

(assert (=> d!137447 (= (contains!7448 (t!40951 lt!562942) #b1000000000000000000000000000000000000000000000000000000000000000) lt!562959)))

(declare-fun b!1245704 () Bool)

(declare-fun e!706411 () Bool)

(assert (=> b!1245704 (= e!706410 e!706411)))

(declare-fun res!831140 () Bool)

(assert (=> b!1245704 (=> res!831140 e!706411)))

(assert (=> b!1245704 (= res!831140 (= (h!28687 (t!40951 lt!562942)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245705 () Bool)

(assert (=> b!1245705 (= e!706411 (contains!7448 (t!40951 (t!40951 lt!562942)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137447 res!831139) b!1245704))

(assert (= (and b!1245704 (not res!831140)) b!1245705))

(assert (=> d!137447 m!1147685))

(declare-fun m!1147697 () Bool)

(assert (=> d!137447 m!1147697))

(declare-fun m!1147699 () Bool)

(assert (=> b!1245705 m!1147699))

(assert (=> b!1245612 d!137447))

(declare-fun b!1245706 () Bool)

(declare-fun e!706415 () Bool)

(declare-fun call!61496 () Bool)

(assert (=> b!1245706 (= e!706415 call!61496)))

(declare-fun e!706412 () Bool)

(declare-fun b!1245707 () Bool)

(assert (=> b!1245707 (= e!706412 (contains!7448 (ite c!121957 (Cons!27478 (select (arr!38679 a!3892) from!3270) Nil!27479) Nil!27479) (select (arr!38679 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(declare-fun bm!61493 () Bool)

(declare-fun c!121967 () Bool)

(assert (=> bm!61493 (= call!61496 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!121967 (Cons!27478 (select (arr!38679 a!3892) (bvadd from!3270 #b00000000000000000000000000000001)) (ite c!121957 (Cons!27478 (select (arr!38679 a!3892) from!3270) Nil!27479) Nil!27479)) (ite c!121957 (Cons!27478 (select (arr!38679 a!3892) from!3270) Nil!27479) Nil!27479))))))

(declare-fun b!1245708 () Bool)

(declare-fun e!706414 () Bool)

(declare-fun e!706413 () Bool)

(assert (=> b!1245708 (= e!706414 e!706413)))

(declare-fun res!831142 () Bool)

(assert (=> b!1245708 (=> (not res!831142) (not e!706413))))

(assert (=> b!1245708 (= res!831142 (not e!706412))))

(declare-fun res!831141 () Bool)

(assert (=> b!1245708 (=> (not res!831141) (not e!706412))))

(assert (=> b!1245708 (= res!831141 (validKeyInArray!0 (select (arr!38679 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(declare-fun d!137449 () Bool)

(declare-fun res!831143 () Bool)

(assert (=> d!137449 (=> res!831143 e!706414)))

(assert (=> d!137449 (= res!831143 (bvsge (bvadd from!3270 #b00000000000000000000000000000001) (size!39215 a!3892)))))

(assert (=> d!137449 (= (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121957 (Cons!27478 (select (arr!38679 a!3892) from!3270) Nil!27479) Nil!27479)) e!706414)))

(declare-fun b!1245709 () Bool)

(assert (=> b!1245709 (= e!706415 call!61496)))

(declare-fun b!1245710 () Bool)

(assert (=> b!1245710 (= e!706413 e!706415)))

(assert (=> b!1245710 (= c!121967 (validKeyInArray!0 (select (arr!38679 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(assert (= (and d!137449 (not res!831143)) b!1245708))

(assert (= (and b!1245708 res!831141) b!1245707))

(assert (= (and b!1245708 res!831142) b!1245710))

(assert (= (and b!1245710 c!121967) b!1245709))

(assert (= (and b!1245710 (not c!121967)) b!1245706))

(assert (= (or b!1245709 b!1245706) bm!61493))

(declare-fun m!1147701 () Bool)

(assert (=> b!1245707 m!1147701))

(assert (=> b!1245707 m!1147701))

(declare-fun m!1147703 () Bool)

(assert (=> b!1245707 m!1147703))

(assert (=> bm!61493 m!1147701))

(declare-fun m!1147705 () Bool)

(assert (=> bm!61493 m!1147705))

(assert (=> b!1245708 m!1147701))

(assert (=> b!1245708 m!1147701))

(declare-fun m!1147707 () Bool)

(assert (=> b!1245708 m!1147707))

(assert (=> b!1245710 m!1147701))

(assert (=> b!1245710 m!1147701))

(assert (=> b!1245710 m!1147707))

(assert (=> bm!61486 d!137449))

(assert (=> b!1245639 d!137409))

(declare-fun d!137451 () Bool)

(declare-fun lt!562960 () Bool)

(assert (=> d!137451 (= lt!562960 (select (content!621 (t!40951 lt!562942)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!706416 () Bool)

(assert (=> d!137451 (= lt!562960 e!706416)))

(declare-fun res!831144 () Bool)

(assert (=> d!137451 (=> (not res!831144) (not e!706416))))

(assert (=> d!137451 (= res!831144 ((_ is Cons!27478) (t!40951 lt!562942)))))

(assert (=> d!137451 (= (contains!7448 (t!40951 lt!562942) #b0000000000000000000000000000000000000000000000000000000000000000) lt!562960)))

(declare-fun b!1245711 () Bool)

(declare-fun e!706417 () Bool)

(assert (=> b!1245711 (= e!706416 e!706417)))

(declare-fun res!831145 () Bool)

(assert (=> b!1245711 (=> res!831145 e!706417)))

(assert (=> b!1245711 (= res!831145 (= (h!28687 (t!40951 lt!562942)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245712 () Bool)

(assert (=> b!1245712 (= e!706417 (contains!7448 (t!40951 (t!40951 lt!562942)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137451 res!831144) b!1245711))

(assert (= (and b!1245711 (not res!831145)) b!1245712))

(assert (=> d!137451 m!1147685))

(declare-fun m!1147709 () Bool)

(assert (=> d!137451 m!1147709))

(declare-fun m!1147711 () Bool)

(assert (=> b!1245712 m!1147711))

(assert (=> b!1245649 d!137451))

(declare-fun d!137453 () Bool)

(declare-fun lt!562961 () Bool)

(assert (=> d!137453 (= lt!562961 (select (content!621 (t!40951 lt!562942)) (h!28687 lt!562942)))))

(declare-fun e!706418 () Bool)

(assert (=> d!137453 (= lt!562961 e!706418)))

(declare-fun res!831146 () Bool)

(assert (=> d!137453 (=> (not res!831146) (not e!706418))))

(assert (=> d!137453 (= res!831146 ((_ is Cons!27478) (t!40951 lt!562942)))))

(assert (=> d!137453 (= (contains!7448 (t!40951 lt!562942) (h!28687 lt!562942)) lt!562961)))

(declare-fun b!1245713 () Bool)

(declare-fun e!706419 () Bool)

(assert (=> b!1245713 (= e!706418 e!706419)))

(declare-fun res!831147 () Bool)

(assert (=> b!1245713 (=> res!831147 e!706419)))

(assert (=> b!1245713 (= res!831147 (= (h!28687 (t!40951 lt!562942)) (h!28687 lt!562942)))))

(declare-fun b!1245714 () Bool)

(assert (=> b!1245714 (= e!706419 (contains!7448 (t!40951 (t!40951 lt!562942)) (h!28687 lt!562942)))))

(assert (= (and d!137453 res!831146) b!1245713))

(assert (= (and b!1245713 (not res!831147)) b!1245714))

(assert (=> d!137453 m!1147685))

(declare-fun m!1147713 () Bool)

(assert (=> d!137453 m!1147713))

(declare-fun m!1147715 () Bool)

(assert (=> b!1245714 m!1147715))

(assert (=> b!1245646 d!137453))

(check-sat (not b!1245714) (not bm!61493) (not b!1245707) (not d!137453) (not b!1245701) (not d!137447) (not d!137443) (not b!1245710) (not b!1245699) (not b!1245705) (not b!1245702) (not b!1245708) (not b!1245712) (not b!1245703) (not d!137451))
(check-sat)
