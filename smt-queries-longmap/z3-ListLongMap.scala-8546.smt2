; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104234 () Bool)

(assert start!104234)

(declare-fun b!1245418 () Bool)

(declare-fun res!830902 () Bool)

(declare-fun e!706187 () Bool)

(assert (=> b!1245418 (=> (not res!830902) (not e!706187))))

(declare-datatypes ((array!80183 0))(
  ( (array!80184 (arr!38676 (Array (_ BitVec 32) (_ BitVec 64))) (size!39212 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80183)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245418 (= res!830902 (validKeyInArray!0 (select (arr!38676 a!3892) from!3270)))))

(declare-fun b!1245419 () Bool)

(declare-fun res!830904 () Bool)

(assert (=> b!1245419 (=> (not res!830904) (not e!706187))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1245419 (= res!830904 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39212 a!3892)) (not (= newFrom!287 (size!39212 a!3892)))))))

(declare-fun b!1245420 () Bool)

(declare-fun res!830903 () Bool)

(assert (=> b!1245420 (=> (not res!830903) (not e!706187))))

(assert (=> b!1245420 (= res!830903 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-fun b!1245421 () Bool)

(declare-fun res!830901 () Bool)

(assert (=> b!1245421 (=> (not res!830901) (not e!706187))))

(declare-datatypes ((List!27479 0))(
  ( (Nil!27476) (Cons!27475 (h!28684 (_ BitVec 64)) (t!40948 List!27479)) )
))
(declare-fun arrayNoDuplicates!0 (array!80183 (_ BitVec 32) List!27479) Bool)

(assert (=> b!1245421 (= res!830901 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27476))))

(declare-fun b!1245422 () Bool)

(declare-fun noDuplicate!2024 (List!27479) Bool)

(assert (=> b!1245422 (= e!706187 (not (noDuplicate!2024 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476))))))

(declare-fun res!830905 () Bool)

(assert (=> start!104234 (=> (not res!830905) (not e!706187))))

(assert (=> start!104234 (= res!830905 (and (bvslt (size!39212 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39212 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39212 a!3892))))))

(assert (=> start!104234 e!706187))

(declare-fun array_inv!29524 (array!80183) Bool)

(assert (=> start!104234 (array_inv!29524 a!3892)))

(assert (=> start!104234 true))

(assert (= (and start!104234 res!830905) b!1245421))

(assert (= (and b!1245421 res!830901) b!1245419))

(assert (= (and b!1245419 res!830904) b!1245418))

(assert (= (and b!1245418 res!830902) b!1245420))

(assert (= (and b!1245420 res!830903) b!1245422))

(declare-fun m!1147483 () Bool)

(assert (=> b!1245418 m!1147483))

(assert (=> b!1245418 m!1147483))

(declare-fun m!1147485 () Bool)

(assert (=> b!1245418 m!1147485))

(declare-fun m!1147487 () Bool)

(assert (=> b!1245421 m!1147487))

(assert (=> b!1245422 m!1147483))

(declare-fun m!1147489 () Bool)

(assert (=> b!1245422 m!1147489))

(declare-fun m!1147491 () Bool)

(assert (=> start!104234 m!1147491))

(check-sat (not start!104234) (not b!1245418) (not b!1245421) (not b!1245422))
(check-sat)
(get-model)

(declare-fun d!137357 () Bool)

(assert (=> d!137357 (= (array_inv!29524 a!3892) (bvsge (size!39212 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104234 d!137357))

(declare-fun d!137359 () Bool)

(assert (=> d!137359 (= (validKeyInArray!0 (select (arr!38676 a!3892) from!3270)) (and (not (= (select (arr!38676 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38676 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1245418 d!137359))

(declare-fun b!1245454 () Bool)

(declare-fun e!706209 () Bool)

(declare-fun call!61477 () Bool)

(assert (=> b!1245454 (= e!706209 call!61477)))

(declare-fun b!1245455 () Bool)

(declare-fun e!706211 () Bool)

(assert (=> b!1245455 (= e!706211 e!706209)))

(declare-fun c!121945 () Bool)

(assert (=> b!1245455 (= c!121945 (validKeyInArray!0 (select (arr!38676 a!3892) from!3270)))))

(declare-fun b!1245456 () Bool)

(assert (=> b!1245456 (= e!706209 call!61477)))

(declare-fun d!137361 () Bool)

(declare-fun res!830934 () Bool)

(declare-fun e!706212 () Bool)

(assert (=> d!137361 (=> res!830934 e!706212)))

(assert (=> d!137361 (= res!830934 (bvsge from!3270 (size!39212 a!3892)))))

(assert (=> d!137361 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27476) e!706212)))

(declare-fun b!1245457 () Bool)

(assert (=> b!1245457 (= e!706212 e!706211)))

(declare-fun res!830933 () Bool)

(assert (=> b!1245457 (=> (not res!830933) (not e!706211))))

(declare-fun e!706210 () Bool)

(assert (=> b!1245457 (= res!830933 (not e!706210))))

(declare-fun res!830935 () Bool)

(assert (=> b!1245457 (=> (not res!830935) (not e!706210))))

(assert (=> b!1245457 (= res!830935 (validKeyInArray!0 (select (arr!38676 a!3892) from!3270)))))

(declare-fun b!1245458 () Bool)

(declare-fun contains!7444 (List!27479 (_ BitVec 64)) Bool)

(assert (=> b!1245458 (= e!706210 (contains!7444 Nil!27476 (select (arr!38676 a!3892) from!3270)))))

(declare-fun bm!61474 () Bool)

(assert (=> bm!61474 (= call!61477 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121945 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476) Nil!27476)))))

(assert (= (and d!137361 (not res!830934)) b!1245457))

(assert (= (and b!1245457 res!830935) b!1245458))

(assert (= (and b!1245457 res!830933) b!1245455))

(assert (= (and b!1245455 c!121945) b!1245454))

(assert (= (and b!1245455 (not c!121945)) b!1245456))

(assert (= (or b!1245454 b!1245456) bm!61474))

(assert (=> b!1245455 m!1147483))

(assert (=> b!1245455 m!1147483))

(assert (=> b!1245455 m!1147485))

(assert (=> b!1245457 m!1147483))

(assert (=> b!1245457 m!1147483))

(assert (=> b!1245457 m!1147485))

(assert (=> b!1245458 m!1147483))

(assert (=> b!1245458 m!1147483))

(declare-fun m!1147507 () Bool)

(assert (=> b!1245458 m!1147507))

(assert (=> bm!61474 m!1147483))

(declare-fun m!1147509 () Bool)

(assert (=> bm!61474 m!1147509))

(assert (=> b!1245421 d!137361))

(declare-fun d!137369 () Bool)

(declare-fun res!830940 () Bool)

(declare-fun e!706217 () Bool)

(assert (=> d!137369 (=> res!830940 e!706217)))

(get-info :version)

(assert (=> d!137369 (= res!830940 ((_ is Nil!27476) (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476)))))

(assert (=> d!137369 (= (noDuplicate!2024 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476)) e!706217)))

(declare-fun b!1245463 () Bool)

(declare-fun e!706218 () Bool)

(assert (=> b!1245463 (= e!706217 e!706218)))

(declare-fun res!830941 () Bool)

(assert (=> b!1245463 (=> (not res!830941) (not e!706218))))

(assert (=> b!1245463 (= res!830941 (not (contains!7444 (t!40948 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476)) (h!28684 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476)))))))

(declare-fun b!1245464 () Bool)

(assert (=> b!1245464 (= e!706218 (noDuplicate!2024 (t!40948 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476))))))

(assert (= (and d!137369 (not res!830940)) b!1245463))

(assert (= (and b!1245463 res!830941) b!1245464))

(declare-fun m!1147511 () Bool)

(assert (=> b!1245463 m!1147511))

(declare-fun m!1147513 () Bool)

(assert (=> b!1245464 m!1147513))

(assert (=> b!1245422 d!137369))

(check-sat (not b!1245458) (not b!1245463) (not b!1245457) (not bm!61474) (not b!1245464) (not b!1245455))
(check-sat)
(get-model)

(assert (=> b!1245457 d!137359))

(assert (=> b!1245455 d!137359))

(declare-fun d!137381 () Bool)

(declare-fun res!830966 () Bool)

(declare-fun e!706249 () Bool)

(assert (=> d!137381 (=> res!830966 e!706249)))

(assert (=> d!137381 (= res!830966 ((_ is Nil!27476) (t!40948 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476))))))

(assert (=> d!137381 (= (noDuplicate!2024 (t!40948 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476))) e!706249)))

(declare-fun b!1245501 () Bool)

(declare-fun e!706250 () Bool)

(assert (=> b!1245501 (= e!706249 e!706250)))

(declare-fun res!830967 () Bool)

(assert (=> b!1245501 (=> (not res!830967) (not e!706250))))

(assert (=> b!1245501 (= res!830967 (not (contains!7444 (t!40948 (t!40948 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476))) (h!28684 (t!40948 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476))))))))

(declare-fun b!1245502 () Bool)

(assert (=> b!1245502 (= e!706250 (noDuplicate!2024 (t!40948 (t!40948 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476)))))))

(assert (= (and d!137381 (not res!830966)) b!1245501))

(assert (= (and b!1245501 res!830967) b!1245502))

(declare-fun m!1147527 () Bool)

(assert (=> b!1245501 m!1147527))

(declare-fun m!1147529 () Bool)

(assert (=> b!1245502 m!1147529))

(assert (=> b!1245464 d!137381))

(declare-fun b!1245503 () Bool)

(declare-fun e!706251 () Bool)

(declare-fun call!61484 () Bool)

(assert (=> b!1245503 (= e!706251 call!61484)))

(declare-fun b!1245504 () Bool)

(declare-fun e!706253 () Bool)

(assert (=> b!1245504 (= e!706253 e!706251)))

(declare-fun c!121952 () Bool)

(assert (=> b!1245504 (= c!121952 (validKeyInArray!0 (select (arr!38676 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(declare-fun b!1245505 () Bool)

(assert (=> b!1245505 (= e!706251 call!61484)))

(declare-fun d!137383 () Bool)

(declare-fun res!830969 () Bool)

(declare-fun e!706254 () Bool)

(assert (=> d!137383 (=> res!830969 e!706254)))

(assert (=> d!137383 (= res!830969 (bvsge (bvadd from!3270 #b00000000000000000000000000000001) (size!39212 a!3892)))))

(assert (=> d!137383 (= (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121945 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476) Nil!27476)) e!706254)))

(declare-fun b!1245506 () Bool)

(assert (=> b!1245506 (= e!706254 e!706253)))

(declare-fun res!830968 () Bool)

(assert (=> b!1245506 (=> (not res!830968) (not e!706253))))

(declare-fun e!706252 () Bool)

(assert (=> b!1245506 (= res!830968 (not e!706252))))

(declare-fun res!830970 () Bool)

(assert (=> b!1245506 (=> (not res!830970) (not e!706252))))

(assert (=> b!1245506 (= res!830970 (validKeyInArray!0 (select (arr!38676 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(declare-fun b!1245507 () Bool)

(assert (=> b!1245507 (= e!706252 (contains!7444 (ite c!121945 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476) Nil!27476) (select (arr!38676 a!3892) (bvadd from!3270 #b00000000000000000000000000000001))))))

(declare-fun bm!61481 () Bool)

(assert (=> bm!61481 (= call!61484 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!121952 (Cons!27475 (select (arr!38676 a!3892) (bvadd from!3270 #b00000000000000000000000000000001)) (ite c!121945 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476) Nil!27476)) (ite c!121945 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476) Nil!27476))))))

(assert (= (and d!137383 (not res!830969)) b!1245506))

(assert (= (and b!1245506 res!830970) b!1245507))

(assert (= (and b!1245506 res!830968) b!1245504))

(assert (= (and b!1245504 c!121952) b!1245503))

(assert (= (and b!1245504 (not c!121952)) b!1245505))

(assert (= (or b!1245503 b!1245505) bm!61481))

(declare-fun m!1147531 () Bool)

(assert (=> b!1245504 m!1147531))

(assert (=> b!1245504 m!1147531))

(declare-fun m!1147533 () Bool)

(assert (=> b!1245504 m!1147533))

(assert (=> b!1245506 m!1147531))

(assert (=> b!1245506 m!1147531))

(assert (=> b!1245506 m!1147533))

(assert (=> b!1245507 m!1147531))

(assert (=> b!1245507 m!1147531))

(declare-fun m!1147535 () Bool)

(assert (=> b!1245507 m!1147535))

(assert (=> bm!61481 m!1147531))

(declare-fun m!1147537 () Bool)

(assert (=> bm!61481 m!1147537))

(assert (=> bm!61474 d!137383))

(declare-fun d!137385 () Bool)

(declare-fun lt!562928 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!619 (List!27479) (InoxSet (_ BitVec 64)))

(assert (=> d!137385 (= lt!562928 (select (content!619 (t!40948 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476))) (h!28684 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476))))))

(declare-fun e!706259 () Bool)

(assert (=> d!137385 (= lt!562928 e!706259)))

(declare-fun res!830976 () Bool)

(assert (=> d!137385 (=> (not res!830976) (not e!706259))))

(assert (=> d!137385 (= res!830976 ((_ is Cons!27475) (t!40948 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476))))))

(assert (=> d!137385 (= (contains!7444 (t!40948 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476)) (h!28684 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476))) lt!562928)))

(declare-fun b!1245512 () Bool)

(declare-fun e!706260 () Bool)

(assert (=> b!1245512 (= e!706259 e!706260)))

(declare-fun res!830975 () Bool)

(assert (=> b!1245512 (=> res!830975 e!706260)))

(assert (=> b!1245512 (= res!830975 (= (h!28684 (t!40948 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476))) (h!28684 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476))))))

(declare-fun b!1245513 () Bool)

(assert (=> b!1245513 (= e!706260 (contains!7444 (t!40948 (t!40948 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476))) (h!28684 (Cons!27475 (select (arr!38676 a!3892) from!3270) Nil!27476))))))

(assert (= (and d!137385 res!830976) b!1245512))

(assert (= (and b!1245512 (not res!830975)) b!1245513))

(declare-fun m!1147539 () Bool)

(assert (=> d!137385 m!1147539))

(declare-fun m!1147541 () Bool)

(assert (=> d!137385 m!1147541))

(declare-fun m!1147543 () Bool)

(assert (=> b!1245513 m!1147543))

(assert (=> b!1245463 d!137385))

(declare-fun d!137387 () Bool)

(declare-fun lt!562929 () Bool)

(assert (=> d!137387 (= lt!562929 (select (content!619 Nil!27476) (select (arr!38676 a!3892) from!3270)))))

(declare-fun e!706261 () Bool)

(assert (=> d!137387 (= lt!562929 e!706261)))

(declare-fun res!830978 () Bool)

(assert (=> d!137387 (=> (not res!830978) (not e!706261))))

(assert (=> d!137387 (= res!830978 ((_ is Cons!27475) Nil!27476))))

(assert (=> d!137387 (= (contains!7444 Nil!27476 (select (arr!38676 a!3892) from!3270)) lt!562929)))

(declare-fun b!1245514 () Bool)

(declare-fun e!706262 () Bool)

(assert (=> b!1245514 (= e!706261 e!706262)))

(declare-fun res!830977 () Bool)

(assert (=> b!1245514 (=> res!830977 e!706262)))

(assert (=> b!1245514 (= res!830977 (= (h!28684 Nil!27476) (select (arr!38676 a!3892) from!3270)))))

(declare-fun b!1245515 () Bool)

(assert (=> b!1245515 (= e!706262 (contains!7444 (t!40948 Nil!27476) (select (arr!38676 a!3892) from!3270)))))

(assert (= (and d!137387 res!830978) b!1245514))

(assert (= (and b!1245514 (not res!830977)) b!1245515))

(declare-fun m!1147545 () Bool)

(assert (=> d!137387 m!1147545))

(assert (=> d!137387 m!1147483))

(declare-fun m!1147547 () Bool)

(assert (=> d!137387 m!1147547))

(assert (=> b!1245515 m!1147483))

(declare-fun m!1147549 () Bool)

(assert (=> b!1245515 m!1147549))

(assert (=> b!1245458 d!137387))

(check-sat (not b!1245513) (not b!1245502) (not b!1245504) (not b!1245501) (not b!1245507) (not d!137387) (not d!137385) (not b!1245515) (not bm!61481) (not b!1245506))
(check-sat)
