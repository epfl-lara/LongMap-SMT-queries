; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75112 () Bool)

(assert start!75112)

(declare-fun res!601303 () Bool)

(declare-fun e!492734 () Bool)

(assert (=> start!75112 (=> (not res!601303) (not e!492734))))

(declare-datatypes ((B!1268 0))(
  ( (B!1269 (val!8940 Int)) )
))
(declare-datatypes ((tuple2!11894 0))(
  ( (tuple2!11895 (_1!5958 (_ BitVec 64)) (_2!5958 B!1268)) )
))
(declare-datatypes ((List!17664 0))(
  ( (Nil!17661) (Cons!17660 (h!18791 tuple2!11894) (t!24932 List!17664)) )
))
(declare-fun l!906 () List!17664)

(declare-fun isStrictlySorted!473 (List!17664) Bool)

(assert (=> start!75112 (= res!601303 (isStrictlySorted!473 l!906))))

(assert (=> start!75112 e!492734))

(declare-fun e!492733 () Bool)

(assert (=> start!75112 e!492733))

(assert (=> start!75112 true))

(declare-fun tp_is_empty!17779 () Bool)

(assert (=> start!75112 tp_is_empty!17779))

(declare-fun b!885366 () Bool)

(declare-fun res!601304 () Bool)

(assert (=> b!885366 (=> (not res!601304) (not e!492734))))

(declare-fun key1!49 () (_ BitVec 64))

(get-info :version)

(assert (=> b!885366 (= res!601304 (or (not ((_ is Cons!17660) l!906)) (bvsge (_1!5958 (h!18791 l!906)) key1!49)))))

(declare-fun v1!38 () B!1268)

(declare-fun b!885367 () Bool)

(declare-fun insertStrictlySorted!295 (List!17664 (_ BitVec 64) B!1268) List!17664)

(assert (=> b!885367 (= e!492734 (not (isStrictlySorted!473 (insertStrictlySorted!295 l!906 key1!49 v1!38))))))

(declare-fun b!885368 () Bool)

(declare-fun tp!54285 () Bool)

(assert (=> b!885368 (= e!492733 (and tp_is_empty!17779 tp!54285))))

(assert (= (and start!75112 res!601303) b!885366))

(assert (= (and b!885366 res!601304) b!885367))

(assert (= (and start!75112 ((_ is Cons!17660) l!906)) b!885368))

(declare-fun m!825023 () Bool)

(assert (=> start!75112 m!825023))

(declare-fun m!825025 () Bool)

(assert (=> b!885367 m!825025))

(assert (=> b!885367 m!825025))

(declare-fun m!825027 () Bool)

(assert (=> b!885367 m!825027))

(check-sat (not b!885367) (not start!75112) (not b!885368) tp_is_empty!17779)
(check-sat)
(get-model)

(declare-fun d!109223 () Bool)

(declare-fun res!601321 () Bool)

(declare-fun e!492751 () Bool)

(assert (=> d!109223 (=> res!601321 e!492751)))

(assert (=> d!109223 (= res!601321 (or ((_ is Nil!17661) (insertStrictlySorted!295 l!906 key1!49 v1!38)) ((_ is Nil!17661) (t!24932 (insertStrictlySorted!295 l!906 key1!49 v1!38)))))))

(assert (=> d!109223 (= (isStrictlySorted!473 (insertStrictlySorted!295 l!906 key1!49 v1!38)) e!492751)))

(declare-fun b!885391 () Bool)

(declare-fun e!492752 () Bool)

(assert (=> b!885391 (= e!492751 e!492752)))

(declare-fun res!601322 () Bool)

(assert (=> b!885391 (=> (not res!601322) (not e!492752))))

(assert (=> b!885391 (= res!601322 (bvslt (_1!5958 (h!18791 (insertStrictlySorted!295 l!906 key1!49 v1!38))) (_1!5958 (h!18791 (t!24932 (insertStrictlySorted!295 l!906 key1!49 v1!38))))))))

(declare-fun b!885392 () Bool)

(assert (=> b!885392 (= e!492752 (isStrictlySorted!473 (t!24932 (insertStrictlySorted!295 l!906 key1!49 v1!38))))))

(assert (= (and d!109223 (not res!601321)) b!885391))

(assert (= (and b!885391 res!601322) b!885392))

(declare-fun m!825041 () Bool)

(assert (=> b!885392 m!825041))

(assert (=> b!885367 d!109223))

(declare-fun b!885463 () Bool)

(declare-fun e!492795 () List!17664)

(declare-fun call!39116 () List!17664)

(assert (=> b!885463 (= e!492795 call!39116)))

(declare-fun b!885464 () Bool)

(declare-fun c!93279 () Bool)

(assert (=> b!885464 (= c!93279 (and ((_ is Cons!17660) l!906) (bvsgt (_1!5958 (h!18791 l!906)) key1!49)))))

(declare-fun e!492798 () List!17664)

(assert (=> b!885464 (= e!492798 e!492795)))

(declare-fun b!885465 () Bool)

(declare-fun call!39114 () List!17664)

(assert (=> b!885465 (= e!492798 call!39114)))

(declare-fun b!885466 () Bool)

(assert (=> b!885466 (= e!492795 call!39116)))

(declare-fun d!109227 () Bool)

(declare-fun e!492797 () Bool)

(assert (=> d!109227 e!492797))

(declare-fun res!601345 () Bool)

(assert (=> d!109227 (=> (not res!601345) (not e!492797))))

(declare-fun lt!400806 () List!17664)

(assert (=> d!109227 (= res!601345 (isStrictlySorted!473 lt!400806))))

(declare-fun e!492799 () List!17664)

(assert (=> d!109227 (= lt!400806 e!492799)))

(declare-fun c!93280 () Bool)

(assert (=> d!109227 (= c!93280 (and ((_ is Cons!17660) l!906) (bvslt (_1!5958 (h!18791 l!906)) key1!49)))))

(assert (=> d!109227 (isStrictlySorted!473 l!906)))

(assert (=> d!109227 (= (insertStrictlySorted!295 l!906 key1!49 v1!38) lt!400806)))

(declare-fun b!885467 () Bool)

(declare-fun contains!4267 (List!17664 tuple2!11894) Bool)

(assert (=> b!885467 (= e!492797 (contains!4267 lt!400806 (tuple2!11895 key1!49 v1!38)))))

(declare-fun bm!39111 () Bool)

(declare-fun call!39115 () List!17664)

(assert (=> bm!39111 (= call!39114 call!39115)))

(declare-fun e!492796 () List!17664)

(declare-fun bm!39112 () Bool)

(declare-fun $colon$colon!544 (List!17664 tuple2!11894) List!17664)

(assert (=> bm!39112 (= call!39115 ($colon$colon!544 e!492796 (ite c!93280 (h!18791 l!906) (tuple2!11895 key1!49 v1!38))))))

(declare-fun c!93278 () Bool)

(assert (=> bm!39112 (= c!93278 c!93280)))

(declare-fun b!885468 () Bool)

(assert (=> b!885468 (= e!492796 (insertStrictlySorted!295 (t!24932 l!906) key1!49 v1!38))))

(declare-fun b!885469 () Bool)

(assert (=> b!885469 (= e!492799 e!492798)))

(declare-fun c!93277 () Bool)

(assert (=> b!885469 (= c!93277 (and ((_ is Cons!17660) l!906) (= (_1!5958 (h!18791 l!906)) key1!49)))))

(declare-fun b!885470 () Bool)

(declare-fun res!601346 () Bool)

(assert (=> b!885470 (=> (not res!601346) (not e!492797))))

(declare-fun containsKey!409 (List!17664 (_ BitVec 64)) Bool)

(assert (=> b!885470 (= res!601346 (containsKey!409 lt!400806 key1!49))))

(declare-fun b!885471 () Bool)

(assert (=> b!885471 (= e!492796 (ite c!93277 (t!24932 l!906) (ite c!93279 (Cons!17660 (h!18791 l!906) (t!24932 l!906)) Nil!17661)))))

(declare-fun bm!39113 () Bool)

(assert (=> bm!39113 (= call!39116 call!39114)))

(declare-fun b!885472 () Bool)

(assert (=> b!885472 (= e!492799 call!39115)))

(assert (= (and d!109227 c!93280) b!885472))

(assert (= (and d!109227 (not c!93280)) b!885469))

(assert (= (and b!885469 c!93277) b!885465))

(assert (= (and b!885469 (not c!93277)) b!885464))

(assert (= (and b!885464 c!93279) b!885466))

(assert (= (and b!885464 (not c!93279)) b!885463))

(assert (= (or b!885466 b!885463) bm!39113))

(assert (= (or b!885465 bm!39113) bm!39111))

(assert (= (or b!885472 bm!39111) bm!39112))

(assert (= (and bm!39112 c!93278) b!885468))

(assert (= (and bm!39112 (not c!93278)) b!885471))

(assert (= (and d!109227 res!601345) b!885470))

(assert (= (and b!885470 res!601346) b!885467))

(declare-fun m!825047 () Bool)

(assert (=> b!885467 m!825047))

(declare-fun m!825049 () Bool)

(assert (=> bm!39112 m!825049))

(declare-fun m!825051 () Bool)

(assert (=> b!885470 m!825051))

(declare-fun m!825053 () Bool)

(assert (=> b!885468 m!825053))

(declare-fun m!825055 () Bool)

(assert (=> d!109227 m!825055))

(assert (=> d!109227 m!825023))

(assert (=> b!885367 d!109227))

(declare-fun d!109235 () Bool)

(declare-fun res!601351 () Bool)

(declare-fun e!492805 () Bool)

(assert (=> d!109235 (=> res!601351 e!492805)))

(assert (=> d!109235 (= res!601351 (or ((_ is Nil!17661) l!906) ((_ is Nil!17661) (t!24932 l!906))))))

(assert (=> d!109235 (= (isStrictlySorted!473 l!906) e!492805)))

(declare-fun b!885485 () Bool)

(declare-fun e!492806 () Bool)

(assert (=> b!885485 (= e!492805 e!492806)))

(declare-fun res!601352 () Bool)

(assert (=> b!885485 (=> (not res!601352) (not e!492806))))

(assert (=> b!885485 (= res!601352 (bvslt (_1!5958 (h!18791 l!906)) (_1!5958 (h!18791 (t!24932 l!906)))))))

(declare-fun b!885486 () Bool)

(assert (=> b!885486 (= e!492806 (isStrictlySorted!473 (t!24932 l!906)))))

(assert (= (and d!109235 (not res!601351)) b!885485))

(assert (= (and b!885485 res!601352) b!885486))

(declare-fun m!825057 () Bool)

(assert (=> b!885486 m!825057))

(assert (=> start!75112 d!109235))

(declare-fun b!885491 () Bool)

(declare-fun e!492809 () Bool)

(declare-fun tp!54294 () Bool)

(assert (=> b!885491 (= e!492809 (and tp_is_empty!17779 tp!54294))))

(assert (=> b!885368 (= tp!54285 e!492809)))

(assert (= (and b!885368 ((_ is Cons!17660) (t!24932 l!906))) b!885491))

(check-sat (not b!885467) (not b!885486) (not b!885392) (not b!885468) (not b!885491) tp_is_empty!17779 (not b!885470) (not d!109227) (not bm!39112))
(check-sat)
