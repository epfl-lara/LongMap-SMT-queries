; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87940 () Bool)

(assert start!87940)

(declare-fun res!681269 () Bool)

(declare-fun e!571487 () Bool)

(assert (=> start!87940 (=> (not res!681269) (not e!571487))))

(declare-datatypes ((B!1430 0))(
  ( (B!1431 (val!11799 Int)) )
))
(declare-datatypes ((tuple2!15148 0))(
  ( (tuple2!15149 (_1!7585 (_ BitVec 64)) (_2!7585 B!1430)) )
))
(declare-datatypes ((List!21419 0))(
  ( (Nil!21416) (Cons!21415 (h!22622 tuple2!15148) (t!30412 List!21419)) )
))
(declare-fun l!412 () List!21419)

(declare-fun isStrictlySorted!561 (List!21419) Bool)

(assert (=> start!87940 (= res!681269 (isStrictlySorted!561 l!412))))

(assert (=> start!87940 e!571487))

(declare-fun e!571488 () Bool)

(assert (=> start!87940 e!571488))

(declare-fun tp_is_empty!23497 () Bool)

(assert (=> start!87940 tp_is_empty!23497))

(declare-fun b!1015682 () Bool)

(declare-fun res!681268 () Bool)

(assert (=> b!1015682 (=> (not res!681268) (not e!571487))))

(declare-fun value!115 () B!1430)

(get-info :version)

(assert (=> b!1015682 (= res!681268 (and (not (= (_2!7585 (h!22622 l!412)) value!115)) ((_ is Cons!21415) l!412)))))

(declare-fun b!1015683 () Bool)

(declare-fun ListPrimitiveSize!112 (List!21419) Int)

(assert (=> b!1015683 (= e!571487 (>= (ListPrimitiveSize!112 (t!30412 l!412)) (ListPrimitiveSize!112 l!412)))))

(declare-datatypes ((List!21420 0))(
  ( (Nil!21417) (Cons!21416 (h!22623 (_ BitVec 64)) (t!30413 List!21420)) )
))
(declare-fun lt!449000 () List!21420)

(declare-fun getKeysOf!46 (List!21419 B!1430) List!21420)

(assert (=> b!1015683 (= lt!449000 (getKeysOf!46 (t!30412 l!412) value!115))))

(declare-fun b!1015684 () Bool)

(declare-fun tp!70521 () Bool)

(assert (=> b!1015684 (= e!571488 (and tp_is_empty!23497 tp!70521))))

(assert (= (and start!87940 res!681269) b!1015682))

(assert (= (and b!1015682 res!681268) b!1015683))

(assert (= (and start!87940 ((_ is Cons!21415) l!412)) b!1015684))

(declare-fun m!938687 () Bool)

(assert (=> start!87940 m!938687))

(declare-fun m!938689 () Bool)

(assert (=> b!1015683 m!938689))

(declare-fun m!938691 () Bool)

(assert (=> b!1015683 m!938691))

(declare-fun m!938693 () Bool)

(assert (=> b!1015683 m!938693))

(check-sat (not b!1015683) (not start!87940) (not b!1015684) tp_is_empty!23497)
(check-sat)
(get-model)

(declare-fun d!121225 () Bool)

(declare-fun lt!449009 () Int)

(assert (=> d!121225 (>= lt!449009 0)))

(declare-fun e!571503 () Int)

(assert (=> d!121225 (= lt!449009 e!571503)))

(declare-fun c!103075 () Bool)

(assert (=> d!121225 (= c!103075 ((_ is Nil!21416) (t!30412 l!412)))))

(assert (=> d!121225 (= (ListPrimitiveSize!112 (t!30412 l!412)) lt!449009)))

(declare-fun b!1015707 () Bool)

(assert (=> b!1015707 (= e!571503 0)))

(declare-fun b!1015708 () Bool)

(assert (=> b!1015708 (= e!571503 (+ 1 (ListPrimitiveSize!112 (t!30412 (t!30412 l!412)))))))

(assert (= (and d!121225 c!103075) b!1015707))

(assert (= (and d!121225 (not c!103075)) b!1015708))

(declare-fun m!938711 () Bool)

(assert (=> b!1015708 m!938711))

(assert (=> b!1015683 d!121225))

(declare-fun d!121231 () Bool)

(declare-fun lt!449010 () Int)

(assert (=> d!121231 (>= lt!449010 0)))

(declare-fun e!571508 () Int)

(assert (=> d!121231 (= lt!449010 e!571508)))

(declare-fun c!103076 () Bool)

(assert (=> d!121231 (= c!103076 ((_ is Nil!21416) l!412))))

(assert (=> d!121231 (= (ListPrimitiveSize!112 l!412) lt!449010)))

(declare-fun b!1015713 () Bool)

(assert (=> b!1015713 (= e!571508 0)))

(declare-fun b!1015714 () Bool)

(assert (=> b!1015714 (= e!571508 (+ 1 (ListPrimitiveSize!112 (t!30412 l!412))))))

(assert (= (and d!121231 c!103076) b!1015713))

(assert (= (and d!121231 (not c!103076)) b!1015714))

(assert (=> b!1015714 m!938689))

(assert (=> b!1015683 d!121231))

(declare-fun b!1015788 () Bool)

(assert (=> b!1015788 true))

(assert (=> b!1015788 true))

(assert (=> b!1015788 true))

(declare-fun bs!29285 () Bool)

(declare-fun b!1015787 () Bool)

(assert (= bs!29285 (and b!1015787 b!1015788)))

(declare-fun lt!449100 () List!21419)

(declare-fun lt!449096 () tuple2!15148)

(declare-fun lambda!703 () Int)

(declare-fun lt!449093 () tuple2!15148)

(declare-fun lambda!702 () Int)

(declare-fun lt!449101 () List!21419)

(assert (=> bs!29285 (= (= (Cons!21415 lt!449096 lt!449101) (Cons!21415 lt!449093 lt!449100)) (= lambda!703 lambda!702))))

(assert (=> b!1015787 true))

(assert (=> b!1015787 true))

(assert (=> b!1015787 true))

(declare-fun bs!29286 () Bool)

(declare-fun d!121233 () Bool)

(assert (= bs!29286 (and d!121233 b!1015788)))

(declare-fun lambda!705 () Int)

(assert (=> bs!29286 (= (= (t!30412 l!412) (Cons!21415 lt!449093 lt!449100)) (= lambda!705 lambda!702))))

(declare-fun bs!29287 () Bool)

(assert (= bs!29287 (and d!121233 b!1015787)))

(assert (=> bs!29287 (= (= (t!30412 l!412) (Cons!21415 lt!449096 lt!449101)) (= lambda!705 lambda!703))))

(assert (=> d!121233 true))

(assert (=> d!121233 true))

(declare-datatypes ((Unit!33163 0))(
  ( (Unit!33164) )
))
(declare-fun e!571550 () Unit!33163)

(declare-fun lt!449099 () Unit!33163)

(assert (=> b!1015787 (= e!571550 lt!449099)))

(assert (=> b!1015787 (= lt!449101 (t!30412 (t!30412 l!412)))))

(declare-fun lt!449094 () List!21420)

(declare-fun call!42870 () List!21420)

(assert (=> b!1015787 (= lt!449094 call!42870)))

(assert (=> b!1015787 (= lt!449096 (h!22622 (t!30412 l!412)))))

(declare-fun call!42871 () Unit!33163)

(assert (=> b!1015787 (= lt!449099 call!42871)))

(declare-fun call!42872 () Bool)

(assert (=> b!1015787 call!42872))

(assert (=> b!1015788 call!42872))

(declare-fun lt!449091 () Unit!33163)

(assert (=> b!1015788 (= lt!449091 call!42871)))

(assert (=> b!1015788 (= lt!449093 (h!22622 (t!30412 l!412)))))

(declare-fun lt!449098 () List!21420)

(assert (=> b!1015788 (= lt!449098 call!42870)))

(assert (=> b!1015788 (= lt!449100 (t!30412 (t!30412 l!412)))))

(declare-fun e!571552 () Unit!33163)

(assert (=> b!1015788 (= e!571552 lt!449091)))

(declare-fun lt!449102 () List!21420)

(declare-fun forall!240 (List!21420 Int) Bool)

(assert (=> d!121233 (forall!240 lt!449102 lambda!705)))

(declare-fun e!571551 () List!21420)

(assert (=> d!121233 (= lt!449102 e!571551)))

(declare-fun c!103112 () Bool)

(assert (=> d!121233 (= c!103112 (and ((_ is Cons!21415) (t!30412 l!412)) (= (_2!7585 (h!22622 (t!30412 l!412))) value!115)))))

(assert (=> d!121233 (isStrictlySorted!561 (t!30412 l!412))))

(assert (=> d!121233 (= (getKeysOf!46 (t!30412 l!412) value!115) lt!449102)))

(declare-fun b!1015789 () Bool)

(declare-fun e!571549 () List!21420)

(assert (=> b!1015789 (= e!571549 Nil!21417)))

(declare-fun b!1015790 () Bool)

(declare-fun lt!449092 () Unit!33163)

(assert (=> b!1015790 (= lt!449092 e!571550)))

(declare-fun c!103109 () Bool)

(declare-fun call!42869 () Bool)

(assert (=> b!1015790 (= c!103109 (not call!42869))))

(declare-fun lt!449097 () List!21420)

(assert (=> b!1015790 (= lt!449097 call!42870)))

(assert (=> b!1015790 (= e!571549 call!42870)))

(declare-fun bm!42866 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!36 (List!21419 List!21420 B!1430 tuple2!15148) Unit!33163)

(assert (=> bm!42866 (= call!42871 (lemmaForallGetValueByKeySameWithASmallerHead!36 (ite c!103112 lt!449100 lt!449101) (ite c!103112 lt!449098 lt!449094) value!115 (ite c!103112 lt!449093 lt!449096)))))

(declare-fun bm!42867 () Bool)

(assert (=> bm!42867 (= call!42870 (getKeysOf!46 (t!30412 (t!30412 l!412)) value!115))))

(declare-fun b!1015791 () Bool)

(assert (=> b!1015791 (= e!571551 e!571549)))

(declare-fun c!103111 () Bool)

(assert (=> b!1015791 (= c!103111 (and ((_ is Cons!21415) (t!30412 l!412)) (not (= (_2!7585 (h!22622 (t!30412 l!412))) value!115))))))

(declare-fun b!1015792 () Bool)

(declare-fun Unit!33169 () Unit!33163)

(assert (=> b!1015792 (= e!571550 Unit!33169)))

(declare-fun bm!42868 () Bool)

(assert (=> bm!42868 (= call!42872 (forall!240 (ite c!103112 lt!449098 lt!449094) (ite c!103112 lambda!702 lambda!703)))))

(declare-fun b!1015793 () Bool)

(assert (=> b!1015793 (= e!571551 (Cons!21416 (_1!7585 (h!22622 (t!30412 l!412))) call!42870))))

(declare-fun c!103110 () Bool)

(assert (=> b!1015793 (= c!103110 (not call!42869))))

(declare-fun lt!449095 () Unit!33163)

(assert (=> b!1015793 (= lt!449095 e!571552)))

(declare-fun bm!42869 () Bool)

(declare-fun isEmpty!836 (List!21420) Bool)

(assert (=> bm!42869 (= call!42869 (isEmpty!836 call!42870))))

(declare-fun b!1015794 () Bool)

(declare-fun Unit!33170 () Unit!33163)

(assert (=> b!1015794 (= e!571552 Unit!33170)))

(assert (= (and d!121233 c!103112) b!1015793))

(assert (= (and d!121233 (not c!103112)) b!1015791))

(assert (= (and b!1015793 c!103110) b!1015788))

(assert (= (and b!1015793 (not c!103110)) b!1015794))

(assert (= (and b!1015791 c!103111) b!1015790))

(assert (= (and b!1015791 (not c!103111)) b!1015789))

(assert (= (and b!1015790 c!103109) b!1015787))

(assert (= (and b!1015790 (not c!103109)) b!1015792))

(assert (= (or b!1015788 b!1015787) bm!42866))

(assert (= (or b!1015788 b!1015787) bm!42868))

(assert (= (or b!1015793 b!1015788 b!1015787 b!1015790) bm!42867))

(assert (= (or b!1015793 b!1015790) bm!42869))

(declare-fun m!938721 () Bool)

(assert (=> bm!42868 m!938721))

(declare-fun m!938723 () Bool)

(assert (=> bm!42866 m!938723))

(declare-fun m!938725 () Bool)

(assert (=> bm!42867 m!938725))

(declare-fun m!938727 () Bool)

(assert (=> d!121233 m!938727))

(declare-fun m!938729 () Bool)

(assert (=> d!121233 m!938729))

(declare-fun m!938731 () Bool)

(assert (=> bm!42869 m!938731))

(assert (=> b!1015683 d!121233))

(declare-fun d!121247 () Bool)

(declare-fun res!681298 () Bool)

(declare-fun e!571567 () Bool)

(assert (=> d!121247 (=> res!681298 e!571567)))

(assert (=> d!121247 (= res!681298 (or ((_ is Nil!21416) l!412) ((_ is Nil!21416) (t!30412 l!412))))))

(assert (=> d!121247 (= (isStrictlySorted!561 l!412) e!571567)))

(declare-fun b!1015837 () Bool)

(declare-fun e!571568 () Bool)

(assert (=> b!1015837 (= e!571567 e!571568)))

(declare-fun res!681299 () Bool)

(assert (=> b!1015837 (=> (not res!681299) (not e!571568))))

(assert (=> b!1015837 (= res!681299 (bvslt (_1!7585 (h!22622 l!412)) (_1!7585 (h!22622 (t!30412 l!412)))))))

(declare-fun b!1015838 () Bool)

(assert (=> b!1015838 (= e!571568 (isStrictlySorted!561 (t!30412 l!412)))))

(assert (= (and d!121247 (not res!681298)) b!1015837))

(assert (= (and b!1015837 res!681299) b!1015838))

(assert (=> b!1015838 m!938729))

(assert (=> start!87940 d!121247))

(declare-fun b!1015844 () Bool)

(declare-fun e!571572 () Bool)

(declare-fun tp!70533 () Bool)

(assert (=> b!1015844 (= e!571572 (and tp_is_empty!23497 tp!70533))))

(assert (=> b!1015684 (= tp!70521 e!571572)))

(assert (= (and b!1015684 ((_ is Cons!21415) (t!30412 l!412))) b!1015844))

(check-sat (not bm!42869) (not bm!42868) (not bm!42867) (not d!121233) tp_is_empty!23497 (not b!1015838) (not b!1015708) (not b!1015844) (not bm!42866) (not b!1015714))
(check-sat)
