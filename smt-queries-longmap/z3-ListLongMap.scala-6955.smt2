; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87726 () Bool)

(assert start!87726)

(declare-fun b!1014396 () Bool)

(declare-fun e!570647 () Bool)

(declare-datatypes ((B!1436 0))(
  ( (B!1437 (val!11802 Int)) )
))
(declare-datatypes ((tuple2!15230 0))(
  ( (tuple2!15231 (_1!7626 (_ BitVec 64)) (_2!7626 B!1436)) )
))
(declare-datatypes ((List!21471 0))(
  ( (Nil!21468) (Cons!21467 (h!22665 tuple2!15230) (t!30463 List!21471)) )
))
(declare-fun l!412 () List!21471)

(declare-fun ListPrimitiveSize!115 (List!21471) Int)

(assert (=> b!1014396 (= e!570647 (>= (ListPrimitiveSize!115 (t!30463 l!412)) (ListPrimitiveSize!115 l!412)))))

(declare-fun b!1014394 () Bool)

(declare-fun res!680728 () Bool)

(assert (=> b!1014394 (=> (not res!680728) (not e!570647))))

(declare-fun value!115 () B!1436)

(get-info :version)

(assert (=> b!1014394 (= res!680728 (and (not (= (_2!7626 (h!22665 l!412)) value!115)) ((_ is Cons!21467) l!412)))))

(declare-fun res!680729 () Bool)

(assert (=> start!87726 (=> (not res!680729) (not e!570647))))

(declare-fun isStrictlySorted!572 (List!21471) Bool)

(assert (=> start!87726 (= res!680729 (isStrictlySorted!572 l!412))))

(assert (=> start!87726 e!570647))

(declare-fun e!570646 () Bool)

(assert (=> start!87726 e!570646))

(declare-fun tp_is_empty!23503 () Bool)

(assert (=> start!87726 tp_is_empty!23503))

(declare-fun b!1014395 () Bool)

(declare-fun res!680727 () Bool)

(assert (=> b!1014395 (=> (not res!680727) (not e!570647))))

(declare-datatypes ((List!21472 0))(
  ( (Nil!21469) (Cons!21468 (h!22666 (_ BitVec 64)) (t!30464 List!21472)) )
))
(declare-fun isEmpty!842 (List!21472) Bool)

(declare-fun getKeysOf!49 (List!21471 B!1436) List!21472)

(assert (=> b!1014395 (= res!680727 (not (isEmpty!842 (getKeysOf!49 (t!30463 l!412) value!115))))))

(declare-fun b!1014397 () Bool)

(declare-fun tp!70539 () Bool)

(assert (=> b!1014397 (= e!570646 (and tp_is_empty!23503 tp!70539))))

(assert (= (and start!87726 res!680729) b!1014394))

(assert (= (and b!1014394 res!680728) b!1014395))

(assert (= (and b!1014395 res!680727) b!1014396))

(assert (= (and start!87726 ((_ is Cons!21467) l!412)) b!1014397))

(declare-fun m!936469 () Bool)

(assert (=> b!1014396 m!936469))

(declare-fun m!936471 () Bool)

(assert (=> b!1014396 m!936471))

(declare-fun m!936473 () Bool)

(assert (=> start!87726 m!936473))

(declare-fun m!936475 () Bool)

(assert (=> b!1014395 m!936475))

(assert (=> b!1014395 m!936475))

(declare-fun m!936477 () Bool)

(assert (=> b!1014395 m!936477))

(check-sat tp_is_empty!23503 (not start!87726) (not b!1014396) (not b!1014395) (not b!1014397))
(check-sat)
(get-model)

(declare-fun d!120637 () Bool)

(assert (=> d!120637 (= (isEmpty!842 (getKeysOf!49 (t!30463 l!412) value!115)) ((_ is Nil!21469) (getKeysOf!49 (t!30463 l!412) value!115)))))

(assert (=> b!1014395 d!120637))

(declare-fun b!1014505 () Bool)

(assert (=> b!1014505 true))

(assert (=> b!1014505 true))

(assert (=> b!1014505 true))

(declare-fun bs!29248 () Bool)

(declare-fun b!1014502 () Bool)

(assert (= bs!29248 (and b!1014502 b!1014505)))

(declare-fun lt!448503 () tuple2!15230)

(declare-fun lt!448499 () tuple2!15230)

(declare-fun lt!448498 () List!21471)

(declare-fun lt!448492 () List!21471)

(declare-fun lambda!728 () Int)

(declare-fun lambda!725 () Int)

(assert (=> bs!29248 (= (= (Cons!21467 lt!448499 lt!448498) (Cons!21467 lt!448503 lt!448492)) (= lambda!728 lambda!725))))

(assert (=> b!1014502 true))

(assert (=> b!1014502 true))

(assert (=> b!1014502 true))

(declare-fun bs!29249 () Bool)

(declare-fun d!120639 () Bool)

(assert (= bs!29249 (and d!120639 b!1014505)))

(declare-fun lambda!729 () Int)

(assert (=> bs!29249 (= (= (t!30463 l!412) (Cons!21467 lt!448503 lt!448492)) (= lambda!729 lambda!725))))

(declare-fun bs!29250 () Bool)

(assert (= bs!29250 (and d!120639 b!1014502)))

(assert (=> bs!29250 (= (= (t!30463 l!412) (Cons!21467 lt!448499 lt!448498)) (= lambda!729 lambda!728))))

(assert (=> d!120639 true))

(assert (=> d!120639 true))

(declare-fun b!1014498 () Bool)

(declare-datatypes ((Unit!33071 0))(
  ( (Unit!33072) )
))
(declare-fun e!570705 () Unit!33071)

(declare-fun Unit!33073 () Unit!33071)

(assert (=> b!1014498 (= e!570705 Unit!33073)))

(declare-fun b!1014499 () Bool)

(declare-fun e!570704 () List!21472)

(assert (=> b!1014499 (= e!570704 Nil!21469)))

(declare-fun lt!448495 () List!21472)

(declare-fun forall!245 (List!21472 Int) Bool)

(assert (=> d!120639 (forall!245 lt!448495 lambda!729)))

(declare-fun e!570706 () List!21472)

(assert (=> d!120639 (= lt!448495 e!570706)))

(declare-fun c!102709 () Bool)

(assert (=> d!120639 (= c!102709 (and ((_ is Cons!21467) (t!30463 l!412)) (= (_2!7626 (h!22665 (t!30463 l!412))) value!115)))))

(assert (=> d!120639 (isStrictlySorted!572 (t!30463 l!412))))

(assert (=> d!120639 (= (getKeysOf!49 (t!30463 l!412) value!115) lt!448495)))

(declare-fun b!1014500 () Bool)

(declare-fun e!570707 () Unit!33071)

(declare-fun Unit!33074 () Unit!33071)

(assert (=> b!1014500 (= e!570707 Unit!33074)))

(declare-fun bm!42804 () Bool)

(declare-fun call!42808 () Unit!33071)

(declare-fun lt!448501 () List!21472)

(declare-fun lt!448494 () List!21472)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!40 (List!21471 List!21472 B!1436 tuple2!15230) Unit!33071)

(assert (=> bm!42804 (= call!42808 (lemmaForallGetValueByKeySameWithASmallerHead!40 (ite c!102709 lt!448492 lt!448498) (ite c!102709 lt!448501 lt!448494) value!115 (ite c!102709 lt!448503 lt!448499)))))

(declare-fun bm!42805 () Bool)

(declare-fun call!42809 () Bool)

(assert (=> bm!42805 (= call!42809 (forall!245 (ite c!102709 lt!448501 lt!448494) (ite c!102709 lambda!725 lambda!728)))))

(declare-fun bm!42806 () Bool)

(declare-fun call!42810 () List!21472)

(assert (=> bm!42806 (= call!42810 (getKeysOf!49 (t!30463 (t!30463 l!412)) value!115))))

(declare-fun bm!42807 () Bool)

(declare-fun call!42807 () Bool)

(assert (=> bm!42807 (= call!42807 (isEmpty!842 call!42810))))

(declare-fun b!1014501 () Bool)

(declare-fun lt!448502 () Unit!33071)

(assert (=> b!1014501 (= lt!448502 e!570707)))

(declare-fun c!102706 () Bool)

(assert (=> b!1014501 (= c!102706 (not call!42807))))

(declare-fun lt!448497 () List!21472)

(assert (=> b!1014501 (= lt!448497 call!42810)))

(assert (=> b!1014501 (= e!570704 call!42810)))

(declare-fun lt!448493 () Unit!33071)

(assert (=> b!1014502 (= e!570707 lt!448493)))

(assert (=> b!1014502 (= lt!448498 (t!30463 (t!30463 l!412)))))

(assert (=> b!1014502 (= lt!448494 call!42810)))

(assert (=> b!1014502 (= lt!448499 (h!22665 (t!30463 l!412)))))

(assert (=> b!1014502 (= lt!448493 call!42808)))

(assert (=> b!1014502 call!42809))

(declare-fun b!1014503 () Bool)

(assert (=> b!1014503 (= e!570706 (Cons!21468 (_1!7626 (h!22665 (t!30463 l!412))) call!42810))))

(declare-fun c!102707 () Bool)

(assert (=> b!1014503 (= c!102707 (not call!42807))))

(declare-fun lt!448500 () Unit!33071)

(assert (=> b!1014503 (= lt!448500 e!570705)))

(declare-fun b!1014504 () Bool)

(assert (=> b!1014504 (= e!570706 e!570704)))

(declare-fun c!102708 () Bool)

(assert (=> b!1014504 (= c!102708 (and ((_ is Cons!21467) (t!30463 l!412)) (not (= (_2!7626 (h!22665 (t!30463 l!412))) value!115))))))

(assert (=> b!1014505 call!42809))

(declare-fun lt!448496 () Unit!33071)

(assert (=> b!1014505 (= lt!448496 call!42808)))

(assert (=> b!1014505 (= lt!448503 (h!22665 (t!30463 l!412)))))

(assert (=> b!1014505 (= lt!448501 call!42810)))

(assert (=> b!1014505 (= lt!448492 (t!30463 (t!30463 l!412)))))

(assert (=> b!1014505 (= e!570705 lt!448496)))

(assert (= (and d!120639 c!102709) b!1014503))

(assert (= (and d!120639 (not c!102709)) b!1014504))

(assert (= (and b!1014503 c!102707) b!1014505))

(assert (= (and b!1014503 (not c!102707)) b!1014498))

(assert (= (and b!1014504 c!102708) b!1014501))

(assert (= (and b!1014504 (not c!102708)) b!1014499))

(assert (= (and b!1014501 c!102706) b!1014502))

(assert (= (and b!1014501 (not c!102706)) b!1014500))

(assert (= (or b!1014505 b!1014502) bm!42804))

(assert (= (or b!1014505 b!1014502) bm!42805))

(assert (= (or b!1014503 b!1014505 b!1014501 b!1014502) bm!42806))

(assert (= (or b!1014503 b!1014501) bm!42807))

(declare-fun m!936507 () Bool)

(assert (=> bm!42804 m!936507))

(declare-fun m!936509 () Bool)

(assert (=> bm!42806 m!936509))

(declare-fun m!936511 () Bool)

(assert (=> bm!42805 m!936511))

(declare-fun m!936513 () Bool)

(assert (=> d!120639 m!936513))

(declare-fun m!936515 () Bool)

(assert (=> d!120639 m!936515))

(declare-fun m!936517 () Bool)

(assert (=> bm!42807 m!936517))

(assert (=> b!1014395 d!120639))

(declare-fun d!120661 () Bool)

(declare-fun res!680764 () Bool)

(declare-fun e!570716 () Bool)

(assert (=> d!120661 (=> res!680764 e!570716)))

(assert (=> d!120661 (= res!680764 (or ((_ is Nil!21468) l!412) ((_ is Nil!21468) (t!30463 l!412))))))

(assert (=> d!120661 (= (isStrictlySorted!572 l!412) e!570716)))

(declare-fun b!1014530 () Bool)

(declare-fun e!570717 () Bool)

(assert (=> b!1014530 (= e!570716 e!570717)))

(declare-fun res!680765 () Bool)

(assert (=> b!1014530 (=> (not res!680765) (not e!570717))))

(assert (=> b!1014530 (= res!680765 (bvslt (_1!7626 (h!22665 l!412)) (_1!7626 (h!22665 (t!30463 l!412)))))))

(declare-fun b!1014531 () Bool)

(assert (=> b!1014531 (= e!570717 (isStrictlySorted!572 (t!30463 l!412)))))

(assert (= (and d!120661 (not res!680764)) b!1014530))

(assert (= (and b!1014530 res!680765) b!1014531))

(assert (=> b!1014531 m!936515))

(assert (=> start!87726 d!120661))

(declare-fun d!120663 () Bool)

(declare-fun lt!448530 () Int)

(assert (=> d!120663 (>= lt!448530 0)))

(declare-fun e!570727 () Int)

(assert (=> d!120663 (= lt!448530 e!570727)))

(declare-fun c!102720 () Bool)

(assert (=> d!120663 (= c!102720 ((_ is Nil!21468) (t!30463 l!412)))))

(assert (=> d!120663 (= (ListPrimitiveSize!115 (t!30463 l!412)) lt!448530)))

(declare-fun b!1014555 () Bool)

(assert (=> b!1014555 (= e!570727 0)))

(declare-fun b!1014556 () Bool)

(assert (=> b!1014556 (= e!570727 (+ 1 (ListPrimitiveSize!115 (t!30463 (t!30463 l!412)))))))

(assert (= (and d!120663 c!102720) b!1014555))

(assert (= (and d!120663 (not c!102720)) b!1014556))

(declare-fun m!936529 () Bool)

(assert (=> b!1014556 m!936529))

(assert (=> b!1014396 d!120663))

(declare-fun d!120665 () Bool)

(declare-fun lt!448531 () Int)

(assert (=> d!120665 (>= lt!448531 0)))

(declare-fun e!570728 () Int)

(assert (=> d!120665 (= lt!448531 e!570728)))

(declare-fun c!102721 () Bool)

(assert (=> d!120665 (= c!102721 ((_ is Nil!21468) l!412))))

(assert (=> d!120665 (= (ListPrimitiveSize!115 l!412) lt!448531)))

(declare-fun b!1014557 () Bool)

(assert (=> b!1014557 (= e!570728 0)))

(declare-fun b!1014558 () Bool)

(assert (=> b!1014558 (= e!570728 (+ 1 (ListPrimitiveSize!115 (t!30463 l!412))))))

(assert (= (and d!120665 c!102721) b!1014557))

(assert (= (and d!120665 (not c!102721)) b!1014558))

(assert (=> b!1014558 m!936469))

(assert (=> b!1014396 d!120665))

(declare-fun b!1014563 () Bool)

(declare-fun e!570731 () Bool)

(declare-fun tp!70551 () Bool)

(assert (=> b!1014563 (= e!570731 (and tp_is_empty!23503 tp!70551))))

(assert (=> b!1014397 (= tp!70539 e!570731)))

(assert (= (and b!1014397 ((_ is Cons!21467) (t!30463 l!412))) b!1014563))

(check-sat tp_is_empty!23503 (not bm!42805) (not bm!42804) (not bm!42807) (not d!120639) (not b!1014556) (not b!1014558) (not b!1014531) (not bm!42806) (not b!1014563))
(check-sat)
