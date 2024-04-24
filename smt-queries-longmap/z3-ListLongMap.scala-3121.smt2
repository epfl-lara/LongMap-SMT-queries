; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43938 () Bool)

(assert start!43938)

(declare-fun res!288891 () Bool)

(declare-fun e!285530 () Bool)

(assert (=> start!43938 (=> (not res!288891) (not e!285530))))

(declare-datatypes ((B!1148 0))(
  ( (B!1149 (val!7026 Int)) )
))
(declare-datatypes ((tuple2!9168 0))(
  ( (tuple2!9169 (_1!4595 (_ BitVec 64)) (_2!4595 B!1148)) )
))
(declare-datatypes ((List!9192 0))(
  ( (Nil!9189) (Cons!9188 (h!10044 tuple2!9168) (t!15409 List!9192)) )
))
(declare-fun l!956 () List!9192)

(declare-fun isStrictlySorted!417 (List!9192) Bool)

(assert (=> start!43938 (= res!288891 (isStrictlySorted!417 l!956))))

(assert (=> start!43938 e!285530))

(declare-fun e!285531 () Bool)

(assert (=> start!43938 e!285531))

(assert (=> start!43938 true))

(declare-fun tp_is_empty!13957 () Bool)

(assert (=> start!43938 tp_is_empty!13957))

(declare-fun b!484985 () Bool)

(declare-fun res!288892 () Bool)

(assert (=> b!484985 (=> (not res!288892) (not e!285530))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!392 (List!9192 (_ BitVec 64)) Bool)

(assert (=> b!484985 (= res!288892 (not (containsKey!392 l!956 key!251)))))

(declare-fun b!484986 () Bool)

(get-info :version)

(assert (=> b!484986 (= e!285530 (and ((_ is Cons!9188) l!956) (= (_1!4595 (h!10044 l!956)) key!251)))))

(declare-fun lt!219493 () List!9192)

(declare-fun value!166 () B!1148)

(declare-fun insertStrictlySorted!245 (List!9192 (_ BitVec 64) B!1148) List!9192)

(assert (=> b!484986 (= lt!219493 (insertStrictlySorted!245 l!956 key!251 value!166))))

(declare-fun b!484987 () Bool)

(declare-fun tp!43573 () Bool)

(assert (=> b!484987 (= e!285531 (and tp_is_empty!13957 tp!43573))))

(assert (= (and start!43938 res!288891) b!484985))

(assert (= (and b!484985 res!288892) b!484986))

(assert (= (and start!43938 ((_ is Cons!9188) l!956)) b!484987))

(declare-fun m!465571 () Bool)

(assert (=> start!43938 m!465571))

(declare-fun m!465573 () Bool)

(assert (=> b!484985 m!465573))

(declare-fun m!465575 () Bool)

(assert (=> b!484986 m!465575))

(check-sat (not b!484986) tp_is_empty!13957 (not b!484987) (not b!484985) (not start!43938))
(check-sat)
(get-model)

(declare-fun d!77343 () Bool)

(declare-fun res!288915 () Bool)

(declare-fun e!285554 () Bool)

(assert (=> d!77343 (=> res!288915 e!285554)))

(assert (=> d!77343 (= res!288915 (or ((_ is Nil!9189) l!956) ((_ is Nil!9189) (t!15409 l!956))))))

(assert (=> d!77343 (= (isStrictlySorted!417 l!956) e!285554)))

(declare-fun b!485016 () Bool)

(declare-fun e!285555 () Bool)

(assert (=> b!485016 (= e!285554 e!285555)))

(declare-fun res!288916 () Bool)

(assert (=> b!485016 (=> (not res!288916) (not e!285555))))

(assert (=> b!485016 (= res!288916 (bvslt (_1!4595 (h!10044 l!956)) (_1!4595 (h!10044 (t!15409 l!956)))))))

(declare-fun b!485017 () Bool)

(assert (=> b!485017 (= e!285555 (isStrictlySorted!417 (t!15409 l!956)))))

(assert (= (and d!77343 (not res!288915)) b!485016))

(assert (= (and b!485016 res!288916) b!485017))

(declare-fun m!465591 () Bool)

(assert (=> b!485017 m!465591))

(assert (=> start!43938 d!77343))

(declare-fun b!485098 () Bool)

(declare-fun c!58378 () Bool)

(assert (=> b!485098 (= c!58378 (and ((_ is Cons!9188) l!956) (bvsgt (_1!4595 (h!10044 l!956)) key!251)))))

(declare-fun e!285598 () List!9192)

(declare-fun e!285597 () List!9192)

(assert (=> b!485098 (= e!285598 e!285597)))

(declare-fun b!485099 () Bool)

(declare-fun call!31206 () List!9192)

(assert (=> b!485099 (= e!285597 call!31206)))

(declare-fun bm!31201 () Bool)

(declare-fun call!31204 () List!9192)

(assert (=> bm!31201 (= call!31206 call!31204)))

(declare-fun bm!31202 () Bool)

(declare-fun c!58376 () Bool)

(declare-fun call!31205 () List!9192)

(declare-fun e!285599 () List!9192)

(declare-fun $colon$colon!125 (List!9192 tuple2!9168) List!9192)

(assert (=> bm!31202 (= call!31205 ($colon$colon!125 e!285599 (ite c!58376 (h!10044 l!956) (tuple2!9169 key!251 value!166))))))

(declare-fun c!58377 () Bool)

(assert (=> bm!31202 (= c!58377 c!58376)))

(declare-fun b!485100 () Bool)

(assert (=> b!485100 (= e!285599 (insertStrictlySorted!245 (t!15409 l!956) key!251 value!166))))

(declare-fun c!58379 () Bool)

(declare-fun b!485101 () Bool)

(assert (=> b!485101 (= e!285599 (ite c!58379 (t!15409 l!956) (ite c!58378 (Cons!9188 (h!10044 l!956) (t!15409 l!956)) Nil!9189)))))

(declare-fun b!485103 () Bool)

(declare-fun lt!219508 () List!9192)

(declare-fun e!285600 () Bool)

(declare-fun contains!2662 (List!9192 tuple2!9168) Bool)

(assert (=> b!485103 (= e!285600 (contains!2662 lt!219508 (tuple2!9169 key!251 value!166)))))

(declare-fun b!485104 () Bool)

(declare-fun res!288933 () Bool)

(assert (=> b!485104 (=> (not res!288933) (not e!285600))))

(assert (=> b!485104 (= res!288933 (containsKey!392 lt!219508 key!251))))

(declare-fun b!485105 () Bool)

(declare-fun e!285596 () List!9192)

(assert (=> b!485105 (= e!285596 e!285598)))

(assert (=> b!485105 (= c!58379 (and ((_ is Cons!9188) l!956) (= (_1!4595 (h!10044 l!956)) key!251)))))

(declare-fun bm!31203 () Bool)

(assert (=> bm!31203 (= call!31204 call!31205)))

(declare-fun b!485106 () Bool)

(assert (=> b!485106 (= e!285598 call!31204)))

(declare-fun b!485107 () Bool)

(assert (=> b!485107 (= e!285597 call!31206)))

(declare-fun b!485102 () Bool)

(assert (=> b!485102 (= e!285596 call!31205)))

(declare-fun d!77349 () Bool)

(assert (=> d!77349 e!285600))

(declare-fun res!288934 () Bool)

(assert (=> d!77349 (=> (not res!288934) (not e!285600))))

(assert (=> d!77349 (= res!288934 (isStrictlySorted!417 lt!219508))))

(assert (=> d!77349 (= lt!219508 e!285596)))

(assert (=> d!77349 (= c!58376 (and ((_ is Cons!9188) l!956) (bvslt (_1!4595 (h!10044 l!956)) key!251)))))

(assert (=> d!77349 (isStrictlySorted!417 l!956)))

(assert (=> d!77349 (= (insertStrictlySorted!245 l!956 key!251 value!166) lt!219508)))

(assert (= (and d!77349 c!58376) b!485102))

(assert (= (and d!77349 (not c!58376)) b!485105))

(assert (= (and b!485105 c!58379) b!485106))

(assert (= (and b!485105 (not c!58379)) b!485098))

(assert (= (and b!485098 c!58378) b!485107))

(assert (= (and b!485098 (not c!58378)) b!485099))

(assert (= (or b!485107 b!485099) bm!31201))

(assert (= (or b!485106 bm!31201) bm!31203))

(assert (= (or b!485102 bm!31203) bm!31202))

(assert (= (and bm!31202 c!58377) b!485100))

(assert (= (and bm!31202 (not c!58377)) b!485101))

(assert (= (and d!77349 res!288934) b!485104))

(assert (= (and b!485104 res!288933) b!485103))

(declare-fun m!465609 () Bool)

(assert (=> b!485100 m!465609))

(declare-fun m!465613 () Bool)

(assert (=> bm!31202 m!465613))

(declare-fun m!465617 () Bool)

(assert (=> b!485103 m!465617))

(declare-fun m!465619 () Bool)

(assert (=> d!77349 m!465619))

(assert (=> d!77349 m!465571))

(declare-fun m!465621 () Bool)

(assert (=> b!485104 m!465621))

(assert (=> b!484986 d!77349))

(declare-fun d!77355 () Bool)

(declare-fun res!288955 () Bool)

(declare-fun e!285621 () Bool)

(assert (=> d!77355 (=> res!288955 e!285621)))

(assert (=> d!77355 (= res!288955 (and ((_ is Cons!9188) l!956) (= (_1!4595 (h!10044 l!956)) key!251)))))

(assert (=> d!77355 (= (containsKey!392 l!956 key!251) e!285621)))

(declare-fun b!485128 () Bool)

(declare-fun e!285622 () Bool)

(assert (=> b!485128 (= e!285621 e!285622)))

(declare-fun res!288956 () Bool)

(assert (=> b!485128 (=> (not res!288956) (not e!285622))))

(assert (=> b!485128 (= res!288956 (and (or (not ((_ is Cons!9188) l!956)) (bvsle (_1!4595 (h!10044 l!956)) key!251)) ((_ is Cons!9188) l!956) (bvslt (_1!4595 (h!10044 l!956)) key!251)))))

(declare-fun b!485129 () Bool)

(assert (=> b!485129 (= e!285622 (containsKey!392 (t!15409 l!956) key!251))))

(assert (= (and d!77355 (not res!288955)) b!485128))

(assert (= (and b!485128 res!288956) b!485129))

(declare-fun m!465627 () Bool)

(assert (=> b!485129 m!465627))

(assert (=> b!484985 d!77355))

(declare-fun b!485143 () Bool)

(declare-fun e!285630 () Bool)

(declare-fun tp!43585 () Bool)

(assert (=> b!485143 (= e!285630 (and tp_is_empty!13957 tp!43585))))

(assert (=> b!484987 (= tp!43573 e!285630)))

(assert (= (and b!484987 ((_ is Cons!9188) (t!15409 l!956))) b!485143))

(check-sat (not b!485100) (not b!485143) (not b!485017) (not b!485129) (not b!485104) (not bm!31202) (not b!485103) (not d!77349) tp_is_empty!13957)
(check-sat)
