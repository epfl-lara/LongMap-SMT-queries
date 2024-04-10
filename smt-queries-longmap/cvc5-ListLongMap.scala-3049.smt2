; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42864 () Bool)

(assert start!42864)

(declare-fun b_free!12103 () Bool)

(declare-fun b_next!12103 () Bool)

(assert (=> start!42864 (= b_free!12103 (not b_next!12103))))

(declare-fun tp!42397 () Bool)

(declare-fun b_and!20717 () Bool)

(assert (=> start!42864 (= tp!42397 b_and!20717)))

(declare-fun res!284671 () Bool)

(declare-fun e!280151 () Bool)

(assert (=> start!42864 (=> (not res!284671) (not e!280151))))

(declare-datatypes ((B!1052 0))(
  ( (B!1053 (val!6810 Int)) )
))
(declare-datatypes ((tuple2!8992 0))(
  ( (tuple2!8993 (_1!4507 (_ BitVec 64)) (_2!4507 B!1052)) )
))
(declare-datatypes ((List!9053 0))(
  ( (Nil!9050) (Cons!9049 (h!9905 tuple2!8992) (t!15117 List!9053)) )
))
(declare-datatypes ((ListLongMap!7905 0))(
  ( (ListLongMap!7906 (toList!3968 List!9053)) )
))
(declare-fun lm!215 () ListLongMap!7905)

(declare-fun p!166 () Int)

(declare-fun forall!197 (List!9053 Int) Bool)

(assert (=> start!42864 (= res!284671 (forall!197 (toList!3968 lm!215) p!166))))

(assert (=> start!42864 e!280151))

(declare-fun e!280153 () Bool)

(declare-fun inv!15495 (ListLongMap!7905) Bool)

(assert (=> start!42864 (and (inv!15495 lm!215) e!280153)))

(assert (=> start!42864 tp!42397))

(declare-fun tp_is_empty!13525 () Bool)

(assert (=> start!42864 tp_is_empty!13525))

(assert (=> start!42864 true))

(declare-fun b!476879 () Bool)

(declare-fun res!284672 () Bool)

(declare-fun e!280152 () Bool)

(assert (=> b!476879 (=> (not res!284672) (not e!280152))))

(declare-fun isEmpty!601 (ListLongMap!7905) Bool)

(assert (=> b!476879 (= res!284672 (not (isEmpty!601 lm!215)))))

(declare-fun b!476880 () Bool)

(assert (=> b!476880 (= e!280151 e!280152)))

(declare-fun res!284674 () Bool)

(assert (=> b!476880 (=> (not res!284674) (not e!280152))))

(declare-fun lt!217342 () tuple2!8992)

(declare-fun dynLambda!944 (Int tuple2!8992) Bool)

(assert (=> b!476880 (= res!284674 (dynLambda!944 p!166 lt!217342))))

(declare-fun a!501 () (_ BitVec 64))

(declare-fun b!85 () B!1052)

(assert (=> b!476880 (= lt!217342 (tuple2!8993 a!501 b!85))))

(declare-fun b!476881 () Bool)

(declare-fun tp!42396 () Bool)

(assert (=> b!476881 (= e!280153 tp!42396)))

(declare-fun b!476882 () Bool)

(declare-fun e!280150 () Bool)

(assert (=> b!476882 (= e!280152 e!280150)))

(declare-fun res!284673 () Bool)

(assert (=> b!476882 (=> (not res!284673) (not e!280150))))

(declare-fun lt!217344 () ListLongMap!7905)

(assert (=> b!476882 (= res!284673 (forall!197 (toList!3968 lt!217344) p!166))))

(declare-fun tail!125 (ListLongMap!7905) ListLongMap!7905)

(assert (=> b!476882 (= lt!217344 (tail!125 lm!215))))

(declare-fun b!476883 () Bool)

(declare-fun +!1765 (ListLongMap!7905 tuple2!8992) ListLongMap!7905)

(assert (=> b!476883 (= e!280150 (not (forall!197 (toList!3968 (+!1765 lm!215 lt!217342)) p!166)))))

(assert (=> b!476883 (forall!197 (toList!3968 (+!1765 lt!217344 lt!217342)) p!166)))

(declare-datatypes ((Unit!14034 0))(
  ( (Unit!14035) )
))
(declare-fun lt!217343 () Unit!14034)

(declare-fun addValidProp!20 (ListLongMap!7905 Int (_ BitVec 64) B!1052) Unit!14034)

(assert (=> b!476883 (= lt!217343 (addValidProp!20 lt!217344 p!166 a!501 b!85))))

(assert (= (and start!42864 res!284671) b!476880))

(assert (= (and b!476880 res!284674) b!476879))

(assert (= (and b!476879 res!284672) b!476882))

(assert (= (and b!476882 res!284673) b!476883))

(assert (= start!42864 b!476881))

(declare-fun b_lambda!10515 () Bool)

(assert (=> (not b_lambda!10515) (not b!476880)))

(declare-fun t!15116 () Bool)

(declare-fun tb!4021 () Bool)

(assert (=> (and start!42864 (= p!166 p!166) t!15116) tb!4021))

(declare-fun result!7583 () Bool)

(assert (=> tb!4021 (= result!7583 true)))

(assert (=> b!476880 t!15116))

(declare-fun b_and!20719 () Bool)

(assert (= b_and!20717 (and (=> t!15116 result!7583) b_and!20719)))

(declare-fun m!459139 () Bool)

(assert (=> b!476882 m!459139))

(declare-fun m!459141 () Bool)

(assert (=> b!476882 m!459141))

(declare-fun m!459143 () Bool)

(assert (=> b!476883 m!459143))

(declare-fun m!459145 () Bool)

(assert (=> b!476883 m!459145))

(declare-fun m!459147 () Bool)

(assert (=> b!476883 m!459147))

(declare-fun m!459149 () Bool)

(assert (=> b!476883 m!459149))

(declare-fun m!459151 () Bool)

(assert (=> b!476883 m!459151))

(declare-fun m!459153 () Bool)

(assert (=> b!476880 m!459153))

(declare-fun m!459155 () Bool)

(assert (=> start!42864 m!459155))

(declare-fun m!459157 () Bool)

(assert (=> start!42864 m!459157))

(declare-fun m!459159 () Bool)

(assert (=> b!476879 m!459159))

(push 1)

(assert (not b!476881))

(assert (not b_next!12103))

(assert (not b!476883))

(assert b_and!20719)

(assert tp_is_empty!13525)

(assert (not b!476882))

(assert (not b_lambda!10515))

(assert (not start!42864))

(assert (not b!476879))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20719)

(assert (not b_next!12103))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!10523 () Bool)

(assert (= b_lambda!10515 (or (and start!42864 b_free!12103) b_lambda!10523)))

(push 1)

(assert (not b!476881))

(assert (not b_next!12103))

(assert (not b!476883))

(assert b_and!20719)

(assert tp_is_empty!13525)

(assert (not b!476882))

(assert (not b_lambda!10523))

(assert (not start!42864))

(assert (not b!476879))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20719)

(assert (not b_next!12103))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75909 () Bool)

(declare-fun res!284703 () Bool)

(declare-fun e!280182 () Bool)

(assert (=> d!75909 (=> res!284703 e!280182)))

(assert (=> d!75909 (= res!284703 (is-Nil!9050 (toList!3968 lt!217344)))))

(assert (=> d!75909 (= (forall!197 (toList!3968 lt!217344) p!166) e!280182)))

(declare-fun b!476918 () Bool)

(declare-fun e!280183 () Bool)

(assert (=> b!476918 (= e!280182 e!280183)))

(declare-fun res!284704 () Bool)

(assert (=> b!476918 (=> (not res!284704) (not e!280183))))

(assert (=> b!476918 (= res!284704 (dynLambda!944 p!166 (h!9905 (toList!3968 lt!217344))))))

(declare-fun b!476919 () Bool)

(assert (=> b!476919 (= e!280183 (forall!197 (t!15117 (toList!3968 lt!217344)) p!166))))

(assert (= (and d!75909 (not res!284703)) b!476918))

(assert (= (and b!476918 res!284704) b!476919))

(declare-fun b_lambda!10527 () Bool)

(assert (=> (not b_lambda!10527) (not b!476918)))

(declare-fun t!15125 () Bool)

(declare-fun tb!4027 () Bool)

(assert (=> (and start!42864 (= p!166 p!166) t!15125) tb!4027))

(declare-fun result!7589 () Bool)

(assert (=> tb!4027 (= result!7589 true)))

(assert (=> b!476918 t!15125))

(declare-fun b_and!20729 () Bool)

(assert (= b_and!20719 (and (=> t!15125 result!7589) b_and!20729)))

(declare-fun m!459207 () Bool)

(assert (=> b!476918 m!459207))

(declare-fun m!459209 () Bool)

(assert (=> b!476919 m!459209))

(assert (=> b!476882 d!75909))

(declare-fun d!75917 () Bool)

(declare-fun tail!128 (List!9053) List!9053)

(assert (=> d!75917 (= (tail!125 lm!215) (ListLongMap!7906 (tail!128 (toList!3968 lm!215))))))

(declare-fun bs!15160 () Bool)

(assert (= bs!15160 d!75917))

(declare-fun m!459215 () Bool)

(assert (=> bs!15160 m!459215))

(assert (=> b!476882 d!75917))

(declare-fun d!75921 () Bool)

(declare-fun res!284719 () Bool)

(declare-fun e!280198 () Bool)

(assert (=> d!75921 (=> res!284719 e!280198)))

(assert (=> d!75921 (= res!284719 (is-Nil!9050 (toList!3968 lm!215)))))

(assert (=> d!75921 (= (forall!197 (toList!3968 lm!215) p!166) e!280198)))

(declare-fun b!476934 () Bool)

(declare-fun e!280199 () Bool)

(assert (=> b!476934 (= e!280198 e!280199)))

(declare-fun res!284720 () Bool)

(assert (=> b!476934 (=> (not res!284720) (not e!280199))))

(assert (=> b!476934 (= res!284720 (dynLambda!944 p!166 (h!9905 (toList!3968 lm!215))))))

(declare-fun b!476935 () Bool)

(assert (=> b!476935 (= e!280199 (forall!197 (t!15117 (toList!3968 lm!215)) p!166))))

(assert (= (and d!75921 (not res!284719)) b!476934))

(assert (= (and b!476934 res!284720) b!476935))

(declare-fun b_lambda!10535 () Bool)

(assert (=> (not b_lambda!10535) (not b!476934)))

(declare-fun t!15133 () Bool)

(declare-fun tb!4035 () Bool)

(assert (=> (and start!42864 (= p!166 p!166) t!15133) tb!4035))

(declare-fun result!7597 () Bool)

(assert (=> tb!4035 (= result!7597 true)))

(assert (=> b!476934 t!15133))

(declare-fun b_and!20737 () Bool)

(assert (= b_and!20729 (and (=> t!15133 result!7597) b_and!20737)))

(declare-fun m!459225 () Bool)

(assert (=> b!476934 m!459225))

(declare-fun m!459227 () Bool)

(assert (=> b!476935 m!459227))

(assert (=> start!42864 d!75921))

(declare-fun d!75927 () Bool)

(declare-fun isStrictlySorted!387 (List!9053) Bool)

(assert (=> d!75927 (= (inv!15495 lm!215) (isStrictlySorted!387 (toList!3968 lm!215)))))

(declare-fun bs!15162 () Bool)

(assert (= bs!15162 d!75927))

(declare-fun m!459231 () Bool)

(assert (=> bs!15162 m!459231))

(assert (=> start!42864 d!75927))

(declare-fun d!75931 () Bool)

(declare-fun isEmpty!605 (List!9053) Bool)

(assert (=> d!75931 (= (isEmpty!601 lm!215) (isEmpty!605 (toList!3968 lm!215)))))

(declare-fun bs!15163 () Bool)

(assert (= bs!15163 d!75931))

(declare-fun m!459233 () Bool)

(assert (=> bs!15163 m!459233))

(assert (=> b!476879 d!75931))

(declare-fun d!75933 () Bool)

(declare-fun e!280216 () Bool)

(assert (=> d!75933 e!280216))

(declare-fun res!284744 () Bool)

(assert (=> d!75933 (=> (not res!284744) (not e!280216))))

(declare-fun lt!217393 () ListLongMap!7905)

(declare-fun contains!2570 (ListLongMap!7905 (_ BitVec 64)) Bool)

(assert (=> d!75933 (= res!284744 (contains!2570 lt!217393 (_1!4507 lt!217342)))))

(declare-fun lt!217396 () List!9053)

(assert (=> d!75933 (= lt!217393 (ListLongMap!7906 lt!217396))))

(declare-fun lt!217395 () Unit!14034)

(declare-fun lt!217394 () Unit!14034)

(assert (=> d!75933 (= lt!217395 lt!217394)))

(declare-datatypes ((Option!393 0))(
  ( (Some!392 (v!9093 B!1052)) (None!391) )
))
(declare-fun getValueByKey!387 (List!9053 (_ BitVec 64)) Option!393)

(assert (=> d!75933 (= (getValueByKey!387 lt!217396 (_1!4507 lt!217342)) (Some!392 (_2!4507 lt!217342)))))

(declare-fun lemmaContainsTupThenGetReturnValue!209 (List!9053 (_ BitVec 64) B!1052) Unit!14034)

(assert (=> d!75933 (= lt!217394 (lemmaContainsTupThenGetReturnValue!209 lt!217396 (_1!4507 lt!217342) (_2!4507 lt!217342)))))

(declare-fun insertStrictlySorted!212 (List!9053 (_ BitVec 64) B!1052) List!9053)

(assert (=> d!75933 (= lt!217396 (insertStrictlySorted!212 (toList!3968 lm!215) (_1!4507 lt!217342) (_2!4507 lt!217342)))))

(assert (=> d!75933 (= (+!1765 lm!215 lt!217342) lt!217393)))

(declare-fun b!476960 () Bool)

(declare-fun res!284743 () Bool)

(assert (=> b!476960 (=> (not res!284743) (not e!280216))))

(assert (=> b!476960 (= res!284743 (= (getValueByKey!387 (toList!3968 lt!217393) (_1!4507 lt!217342)) (Some!392 (_2!4507 lt!217342))))))

(declare-fun b!476961 () Bool)

(declare-fun contains!2571 (List!9053 tuple2!8992) Bool)

(assert (=> b!476961 (= e!280216 (contains!2571 (toList!3968 lt!217393) lt!217342))))

(assert (= (and d!75933 res!284744) b!476960))

(assert (= (and b!476960 res!284743) b!476961))

(declare-fun m!459283 () Bool)

(assert (=> d!75933 m!459283))

(declare-fun m!459285 () Bool)

(assert (=> d!75933 m!459285))

(declare-fun m!459287 () Bool)

(assert (=> d!75933 m!459287))

(declare-fun m!459289 () Bool)

(assert (=> d!75933 m!459289))

(declare-fun m!459291 () Bool)

(assert (=> b!476960 m!459291))

(declare-fun m!459293 () Bool)

(assert (=> b!476961 m!459293))

(assert (=> b!476883 d!75933))

(declare-fun d!75947 () Bool)

(declare-fun e!280217 () Bool)

(assert (=> d!75947 e!280217))

(declare-fun res!284746 () Bool)

(assert (=> d!75947 (=> (not res!284746) (not e!280217))))

(declare-fun lt!217397 () ListLongMap!7905)

(assert (=> d!75947 (= res!284746 (contains!2570 lt!217397 (_1!4507 lt!217342)))))

(declare-fun lt!217400 () List!9053)

(assert (=> d!75947 (= lt!217397 (ListLongMap!7906 lt!217400))))

(declare-fun lt!217399 () Unit!14034)

(declare-fun lt!217398 () Unit!14034)

(assert (=> d!75947 (= lt!217399 lt!217398)))

(assert (=> d!75947 (= (getValueByKey!387 lt!217400 (_1!4507 lt!217342)) (Some!392 (_2!4507 lt!217342)))))

(assert (=> d!75947 (= lt!217398 (lemmaContainsTupThenGetReturnValue!209 lt!217400 (_1!4507 lt!217342) (_2!4507 lt!217342)))))

(assert (=> d!75947 (= lt!217400 (insertStrictlySorted!212 (toList!3968 lt!217344) (_1!4507 lt!217342) (_2!4507 lt!217342)))))

(assert (=> d!75947 (= (+!1765 lt!217344 lt!217342) lt!217397)))

(declare-fun b!476962 () Bool)

(declare-fun res!284745 () Bool)

(assert (=> b!476962 (=> (not res!284745) (not e!280217))))

(assert (=> b!476962 (= res!284745 (= (getValueByKey!387 (toList!3968 lt!217397) (_1!4507 lt!217342)) (Some!392 (_2!4507 lt!217342))))))

(declare-fun b!476963 () Bool)

(assert (=> b!476963 (= e!280217 (contains!2571 (toList!3968 lt!217397) lt!217342))))

(assert (= (and d!75947 res!284746) b!476962))

(assert (= (and b!476962 res!284745) b!476963))

(declare-fun m!459297 () Bool)

(assert (=> d!75947 m!459297))

(declare-fun m!459299 () Bool)

(assert (=> d!75947 m!459299))

(declare-fun m!459301 () Bool)

(assert (=> d!75947 m!459301))

(declare-fun m!459303 () Bool)

(assert (=> d!75947 m!459303))

(declare-fun m!459309 () Bool)

(assert (=> b!476962 m!459309))

(declare-fun m!459311 () Bool)

(assert (=> b!476963 m!459311))

(assert (=> b!476883 d!75947))

(declare-fun d!75953 () Bool)

(assert (=> d!75953 (forall!197 (toList!3968 (+!1765 lt!217344 (tuple2!8993 a!501 b!85))) p!166)))

(declare-fun lt!217419 () Unit!14034)

(declare-fun choose!1363 (ListLongMap!7905 Int (_ BitVec 64) B!1052) Unit!14034)

(assert (=> d!75953 (= lt!217419 (choose!1363 lt!217344 p!166 a!501 b!85))))

(declare-fun e!280231 () Bool)

(assert (=> d!75953 e!280231))

(declare-fun res!284761 () Bool)

(assert (=> d!75953 (=> (not res!284761) (not e!280231))))

(assert (=> d!75953 (= res!284761 (forall!197 (toList!3968 lt!217344) p!166))))

(assert (=> d!75953 (= (addValidProp!20 lt!217344 p!166 a!501 b!85) lt!217419)))

(declare-fun b!476984 () Bool)

(assert (=> b!476984 (= e!280231 (dynLambda!944 p!166 (tuple2!8993 a!501 b!85)))))

(assert (= (and d!75953 res!284761) b!476984))

(declare-fun b_lambda!10559 () Bool)

(assert (=> (not b_lambda!10559) (not b!476984)))

(declare-fun t!15147 () Bool)

(declare-fun tb!4049 () Bool)

(assert (=> (and start!42864 (= p!166 p!166) t!15147) tb!4049))

(declare-fun result!7613 () Bool)

(assert (=> tb!4049 (= result!7613 true)))

(assert (=> b!476984 t!15147))

(declare-fun b_and!20751 () Bool)

(assert (= b_and!20737 (and (=> t!15147 result!7613) b_and!20751)))

(declare-fun m!459343 () Bool)

(assert (=> d!75953 m!459343))

(declare-fun m!459345 () Bool)

(assert (=> d!75953 m!459345))

(declare-fun m!459347 () Bool)

(assert (=> d!75953 m!459347))

(assert (=> d!75953 m!459139))

(declare-fun m!459349 () Bool)

(assert (=> b!476984 m!459349))

(assert (=> b!476883 d!75953))

(declare-fun d!75961 () Bool)

(declare-fun res!284764 () Bool)

(declare-fun e!280234 () Bool)

(assert (=> d!75961 (=> res!284764 e!280234)))

(assert (=> d!75961 (= res!284764 (is-Nil!9050 (toList!3968 (+!1765 lt!217344 lt!217342))))))

(assert (=> d!75961 (= (forall!197 (toList!3968 (+!1765 lt!217344 lt!217342)) p!166) e!280234)))

(declare-fun b!476987 () Bool)

(declare-fun e!280235 () Bool)

(assert (=> b!476987 (= e!280234 e!280235)))

(declare-fun res!284765 () Bool)

(assert (=> b!476987 (=> (not res!284765) (not e!280235))))

(assert (=> b!476987 (= res!284765 (dynLambda!944 p!166 (h!9905 (toList!3968 (+!1765 lt!217344 lt!217342)))))))

(declare-fun b!476988 () Bool)

(assert (=> b!476988 (= e!280235 (forall!197 (t!15117 (toList!3968 (+!1765 lt!217344 lt!217342))) p!166))))

(assert (= (and d!75961 (not res!284764)) b!476987))

(assert (= (and b!476987 res!284765) b!476988))

(declare-fun b_lambda!10563 () Bool)

(assert (=> (not b_lambda!10563) (not b!476987)))

(declare-fun t!15151 () Bool)

(declare-fun tb!4053 () Bool)

(assert (=> (and start!42864 (= p!166 p!166) t!15151) tb!4053))

(declare-fun result!7617 () Bool)

(assert (=> tb!4053 (= result!7617 true)))

(assert (=> b!476987 t!15151))

(declare-fun b_and!20755 () Bool)

(assert (= b_and!20751 (and (=> t!15151 result!7617) b_and!20755)))

(declare-fun m!459355 () Bool)

(assert (=> b!476987 m!459355))

(declare-fun m!459357 () Bool)

(assert (=> b!476988 m!459357))

(assert (=> b!476883 d!75961))

(declare-fun d!75965 () Bool)

(declare-fun res!284766 () Bool)

(declare-fun e!280236 () Bool)

(assert (=> d!75965 (=> res!284766 e!280236)))

(assert (=> d!75965 (= res!284766 (is-Nil!9050 (toList!3968 (+!1765 lm!215 lt!217342))))))

(assert (=> d!75965 (= (forall!197 (toList!3968 (+!1765 lm!215 lt!217342)) p!166) e!280236)))

(declare-fun b!476989 () Bool)

(declare-fun e!280237 () Bool)

(assert (=> b!476989 (= e!280236 e!280237)))

(declare-fun res!284767 () Bool)

(assert (=> b!476989 (=> (not res!284767) (not e!280237))))

(assert (=> b!476989 (= res!284767 (dynLambda!944 p!166 (h!9905 (toList!3968 (+!1765 lm!215 lt!217342)))))))

(declare-fun b!476990 () Bool)

(assert (=> b!476990 (= e!280237 (forall!197 (t!15117 (toList!3968 (+!1765 lm!215 lt!217342))) p!166))))

(assert (= (and d!75965 (not res!284766)) b!476989))

(assert (= (and b!476989 res!284767) b!476990))

(declare-fun b_lambda!10565 () Bool)

(assert (=> (not b_lambda!10565) (not b!476989)))

(declare-fun t!15153 () Bool)

(declare-fun tb!4055 () Bool)

(assert (=> (and start!42864 (= p!166 p!166) t!15153) tb!4055))

(declare-fun result!7619 () Bool)

(assert (=> tb!4055 (= result!7619 true)))

(assert (=> b!476989 t!15153))

(declare-fun b_and!20757 () Bool)

(assert (= b_and!20755 (and (=> t!15153 result!7619) b_and!20757)))

(declare-fun m!459359 () Bool)

(assert (=> b!476989 m!459359))

(declare-fun m!459361 () Bool)

(assert (=> b!476990 m!459361))

(assert (=> b!476883 d!75965))

(declare-fun b!476995 () Bool)

(declare-fun e!280240 () Bool)

(declare-fun tp!42415 () Bool)

(assert (=> b!476995 (= e!280240 (and tp_is_empty!13525 tp!42415))))

(assert (=> b!476881 (= tp!42396 e!280240)))

(assert (= (and b!476881 (is-Cons!9049 (toList!3968 lm!215))) b!476995))

(declare-fun b_lambda!10567 () Bool)

(assert (= b_lambda!10565 (or (and start!42864 b_free!12103) b_lambda!10567)))

(declare-fun b_lambda!10569 () Bool)

(assert (= b_lambda!10527 (or (and start!42864 b_free!12103) b_lambda!10569)))

(declare-fun b_lambda!10571 () Bool)

(assert (= b_lambda!10563 (or (and start!42864 b_free!12103) b_lambda!10571)))

(declare-fun b_lambda!10573 () Bool)

(assert (= b_lambda!10535 (or (and start!42864 b_free!12103) b_lambda!10573)))

(declare-fun b_lambda!10575 () Bool)

(assert (= b_lambda!10559 (or (and start!42864 b_free!12103) b_lambda!10575)))

(push 1)

(assert (not d!75933))

(assert (not b_lambda!10573))

(assert (not b_lambda!10567))

(assert (not b_next!12103))

(assert (not d!75917))

(assert (not b_lambda!10571))

(assert (not b!476961))

(assert (not b!476990))

(assert tp_is_empty!13525)

(assert (not b!476935))

(assert (not b_lambda!10523))

(assert b_and!20757)

(assert (not b!476963))

(assert (not b_lambda!10575))

(assert (not d!75947))

(assert (not b_lambda!10569))

(assert (not d!75953))

(assert (not b!476960))

(assert (not b!476995))

(assert (not b!476988))

(assert (not d!75931))

(assert (not b!476962))

(assert (not d!75927))

(assert (not b!476919))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20757)

(assert (not b_next!12103))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75987 () Bool)

(assert (=> d!75987 (= (isEmpty!605 (toList!3968 lm!215)) (is-Nil!9050 (toList!3968 lm!215)))))

(assert (=> d!75931 d!75987))

(declare-fun d!75989 () Bool)

(declare-fun res!284786 () Bool)

(declare-fun e!280269 () Bool)

(assert (=> d!75989 (=> res!284786 e!280269)))

(assert (=> d!75989 (= res!284786 (is-Nil!9050 (t!15117 (toList!3968 (+!1765 lm!215 lt!217342)))))))

(assert (=> d!75989 (= (forall!197 (t!15117 (toList!3968 (+!1765 lm!215 lt!217342))) p!166) e!280269)))

(declare-fun b!477036 () Bool)

(declare-fun e!280270 () Bool)

(assert (=> b!477036 (= e!280269 e!280270)))

(declare-fun res!284787 () Bool)

(assert (=> b!477036 (=> (not res!284787) (not e!280270))))

(assert (=> b!477036 (= res!284787 (dynLambda!944 p!166 (h!9905 (t!15117 (toList!3968 (+!1765 lm!215 lt!217342))))))))

(declare-fun b!477037 () Bool)

(assert (=> b!477037 (= e!280270 (forall!197 (t!15117 (t!15117 (toList!3968 (+!1765 lm!215 lt!217342)))) p!166))))

(assert (= (and d!75989 (not res!284786)) b!477036))

(assert (= (and b!477036 res!284787) b!477037))

(declare-fun b_lambda!10595 () Bool)

(assert (=> (not b_lambda!10595) (not b!477036)))

(declare-fun t!15163 () Bool)

(declare-fun tb!4065 () Bool)

(assert (=> (and start!42864 (= p!166 p!166) t!15163) tb!4065))

(declare-fun result!7633 () Bool)

(assert (=> tb!4065 (= result!7633 true)))

(assert (=> b!477036 t!15163))

(declare-fun b_and!20767 () Bool)

(assert (= b_and!20757 (and (=> t!15163 result!7633) b_and!20767)))

(declare-fun m!459403 () Bool)

(assert (=> b!477036 m!459403))

(declare-fun m!459405 () Bool)

(assert (=> b!477037 m!459405))

(assert (=> b!476990 d!75989))

(declare-fun b!477054 () Bool)

(declare-fun e!280279 () Option!393)

(declare-fun e!280280 () Option!393)

(assert (=> b!477054 (= e!280279 e!280280)))

(declare-fun c!57390 () Bool)

(assert (=> b!477054 (= c!57390 (and (is-Cons!9049 (toList!3968 lt!217393)) (not (= (_1!4507 (h!9905 (toList!3968 lt!217393))) (_1!4507 lt!217342)))))))

(declare-fun b!477053 () Bool)

(assert (=> b!477053 (= e!280279 (Some!392 (_2!4507 (h!9905 (toList!3968 lt!217393)))))))

(declare-fun b!477055 () Bool)

(assert (=> b!477055 (= e!280280 (getValueByKey!387 (t!15117 (toList!3968 lt!217393)) (_1!4507 lt!217342)))))

(declare-fun b!477056 () Bool)

(assert (=> b!477056 (= e!280280 None!391)))

(declare-fun d!75991 () Bool)

(declare-fun c!57389 () Bool)

(assert (=> d!75991 (= c!57389 (and (is-Cons!9049 (toList!3968 lt!217393)) (= (_1!4507 (h!9905 (toList!3968 lt!217393))) (_1!4507 lt!217342))))))

(assert (=> d!75991 (= (getValueByKey!387 (toList!3968 lt!217393) (_1!4507 lt!217342)) e!280279)))

(assert (= (and d!75991 c!57389) b!477053))

(assert (= (and d!75991 (not c!57389)) b!477054))

(assert (= (and b!477054 c!57390) b!477055))

(assert (= (and b!477054 (not c!57390)) b!477056))

(declare-fun m!459415 () Bool)

(assert (=> b!477055 m!459415))

(assert (=> b!476960 d!75991))

(declare-fun d!75997 () Bool)

(declare-fun res!284789 () Bool)

(declare-fun e!280281 () Bool)

(assert (=> d!75997 (=> res!284789 e!280281)))

(assert (=> d!75997 (= res!284789 (is-Nil!9050 (t!15117 (toList!3968 lt!217344))))))

(assert (=> d!75997 (= (forall!197 (t!15117 (toList!3968 lt!217344)) p!166) e!280281)))

(declare-fun b!477057 () Bool)

(declare-fun e!280282 () Bool)

(assert (=> b!477057 (= e!280281 e!280282)))

(declare-fun res!284790 () Bool)

(assert (=> b!477057 (=> (not res!284790) (not e!280282))))

(assert (=> b!477057 (= res!284790 (dynLambda!944 p!166 (h!9905 (t!15117 (toList!3968 lt!217344)))))))

(declare-fun b!477058 () Bool)

(assert (=> b!477058 (= e!280282 (forall!197 (t!15117 (t!15117 (toList!3968 lt!217344))) p!166))))

(assert (= (and d!75997 (not res!284789)) b!477057))

(assert (= (and b!477057 res!284790) b!477058))

(declare-fun b_lambda!10597 () Bool)

(assert (=> (not b_lambda!10597) (not b!477057)))

(declare-fun t!15165 () Bool)

(declare-fun tb!4067 () Bool)

(assert (=> (and start!42864 (= p!166 p!166) t!15165) tb!4067))

(declare-fun result!7635 () Bool)

(assert (=> tb!4067 (= result!7635 true)))

(assert (=> b!477057 t!15165))

(declare-fun b_and!20769 () Bool)

(assert (= b_and!20767 (and (=> t!15165 result!7635) b_and!20769)))

(declare-fun m!459417 () Bool)

(assert (=> b!477057 m!459417))

(declare-fun m!459419 () Bool)

(assert (=> b!477058 m!459419))

(assert (=> b!476919 d!75997))

(declare-fun d!75999 () Bool)

(declare-fun res!284791 () Bool)

(declare-fun e!280283 () Bool)

(assert (=> d!75999 (=> res!284791 e!280283)))

(assert (=> d!75999 (= res!284791 (is-Nil!9050 (t!15117 (toList!3968 lm!215))))))

(assert (=> d!75999 (= (forall!197 (t!15117 (toList!3968 lm!215)) p!166) e!280283)))

(declare-fun b!477059 () Bool)

(declare-fun e!280284 () Bool)

(assert (=> b!477059 (= e!280283 e!280284)))

(declare-fun res!284792 () Bool)

(assert (=> b!477059 (=> (not res!284792) (not e!280284))))

(assert (=> b!477059 (= res!284792 (dynLambda!944 p!166 (h!9905 (t!15117 (toList!3968 lm!215)))))))

(declare-fun b!477060 () Bool)

(assert (=> b!477060 (= e!280284 (forall!197 (t!15117 (t!15117 (toList!3968 lm!215))) p!166))))

(assert (= (and d!75999 (not res!284791)) b!477059))

(assert (= (and b!477059 res!284792) b!477060))

(declare-fun b_lambda!10599 () Bool)

(assert (=> (not b_lambda!10599) (not b!477059)))

(declare-fun t!15167 () Bool)

(declare-fun tb!4069 () Bool)

(assert (=> (and start!42864 (= p!166 p!166) t!15167) tb!4069))

(declare-fun result!7637 () Bool)

(assert (=> tb!4069 (= result!7637 true)))

(assert (=> b!477059 t!15167))

(declare-fun b_and!20771 () Bool)

(assert (= b_and!20769 (and (=> t!15167 result!7637) b_and!20771)))

(declare-fun m!459421 () Bool)

(assert (=> b!477059 m!459421))

(declare-fun m!459423 () Bool)

(assert (=> b!477060 m!459423))

(assert (=> b!476935 d!75999))

(declare-fun d!76001 () Bool)

(declare-fun lt!217444 () Bool)

(declare-fun content!207 (List!9053) (Set tuple2!8992))

(assert (=> d!76001 (= lt!217444 (set.member lt!217342 (content!207 (toList!3968 lt!217393))))))

(declare-fun e!280292 () Bool)

(assert (=> d!76001 (= lt!217444 e!280292)))

(declare-fun res!284804 () Bool)

(assert (=> d!76001 (=> (not res!284804) (not e!280292))))

(assert (=> d!76001 (= res!284804 (is-Cons!9049 (toList!3968 lt!217393)))))

(assert (=> d!76001 (= (contains!2571 (toList!3968 lt!217393) lt!217342) lt!217444)))

(declare-fun b!477071 () Bool)

(declare-fun e!280293 () Bool)

(assert (=> b!477071 (= e!280292 e!280293)))

(declare-fun res!284803 () Bool)

(assert (=> b!477071 (=> res!284803 e!280293)))

(assert (=> b!477071 (= res!284803 (= (h!9905 (toList!3968 lt!217393)) lt!217342))))

(declare-fun b!477072 () Bool)

(assert (=> b!477072 (= e!280293 (contains!2571 (t!15117 (toList!3968 lt!217393)) lt!217342))))

(assert (= (and d!76001 res!284804) b!477071))

(assert (= (and b!477071 (not res!284803)) b!477072))

(declare-fun m!459433 () Bool)

(assert (=> d!76001 m!459433))

(declare-fun m!459435 () Bool)

(assert (=> d!76001 m!459435))

(declare-fun m!459437 () Bool)

(assert (=> b!477072 m!459437))

(assert (=> b!476961 d!76001))

(declare-fun d!76005 () Bool)

(declare-fun res!284809 () Bool)

(declare-fun e!280298 () Bool)

(assert (=> d!76005 (=> res!284809 e!280298)))

(assert (=> d!76005 (= res!284809 (or (is-Nil!9050 (toList!3968 lm!215)) (is-Nil!9050 (t!15117 (toList!3968 lm!215)))))))

(assert (=> d!76005 (= (isStrictlySorted!387 (toList!3968 lm!215)) e!280298)))

(declare-fun b!477077 () Bool)

(declare-fun e!280299 () Bool)

(assert (=> b!477077 (= e!280298 e!280299)))

(declare-fun res!284810 () Bool)

(assert (=> b!477077 (=> (not res!284810) (not e!280299))))

(assert (=> b!477077 (= res!284810 (bvslt (_1!4507 (h!9905 (toList!3968 lm!215))) (_1!4507 (h!9905 (t!15117 (toList!3968 lm!215))))))))

(declare-fun b!477078 () Bool)

(assert (=> b!477078 (= e!280299 (isStrictlySorted!387 (t!15117 (toList!3968 lm!215))))))

(assert (= (and d!76005 (not res!284809)) b!477077))

(assert (= (and b!477077 res!284810) b!477078))

(declare-fun m!459439 () Bool)

(assert (=> b!477078 m!459439))

(assert (=> d!75927 d!76005))

(declare-fun d!76007 () Bool)

(assert (=> d!76007 (= (tail!128 (toList!3968 lm!215)) (t!15117 (toList!3968 lm!215)))))

(assert (=> d!75917 d!76007))

(declare-fun b!477080 () Bool)

(declare-fun e!280300 () Option!393)

(declare-fun e!280301 () Option!393)

(assert (=> b!477080 (= e!280300 e!280301)))

(declare-fun c!57392 () Bool)

(assert (=> b!477080 (= c!57392 (and (is-Cons!9049 (toList!3968 lt!217397)) (not (= (_1!4507 (h!9905 (toList!3968 lt!217397))) (_1!4507 lt!217342)))))))

(declare-fun b!477079 () Bool)

(assert (=> b!477079 (= e!280300 (Some!392 (_2!4507 (h!9905 (toList!3968 lt!217397)))))))

(declare-fun b!477081 () Bool)

(assert (=> b!477081 (= e!280301 (getValueByKey!387 (t!15117 (toList!3968 lt!217397)) (_1!4507 lt!217342)))))

(declare-fun b!477082 () Bool)

(assert (=> b!477082 (= e!280301 None!391)))

(declare-fun d!76009 () Bool)

(declare-fun c!57391 () Bool)

(assert (=> d!76009 (= c!57391 (and (is-Cons!9049 (toList!3968 lt!217397)) (= (_1!4507 (h!9905 (toList!3968 lt!217397))) (_1!4507 lt!217342))))))

(assert (=> d!76009 (= (getValueByKey!387 (toList!3968 lt!217397) (_1!4507 lt!217342)) e!280300)))

(assert (= (and d!76009 c!57391) b!477079))

(assert (= (and d!76009 (not c!57391)) b!477080))

(assert (= (and b!477080 c!57392) b!477081))

(assert (= (and b!477080 (not c!57392)) b!477082))

(declare-fun m!459441 () Bool)

(assert (=> b!477081 m!459441))

(assert (=> b!476962 d!76009))

(declare-fun d!76011 () Bool)

(declare-fun res!284811 () Bool)

(declare-fun e!280302 () Bool)

(assert (=> d!76011 (=> res!284811 e!280302)))

(assert (=> d!76011 (= res!284811 (is-Nil!9050 (toList!3968 (+!1765 lt!217344 (tuple2!8993 a!501 b!85)))))))

(assert (=> d!76011 (= (forall!197 (toList!3968 (+!1765 lt!217344 (tuple2!8993 a!501 b!85))) p!166) e!280302)))

(declare-fun b!477083 () Bool)

(declare-fun e!280303 () Bool)

(assert (=> b!477083 (= e!280302 e!280303)))

(declare-fun res!284812 () Bool)

(assert (=> b!477083 (=> (not res!284812) (not e!280303))))

(assert (=> b!477083 (= res!284812 (dynLambda!944 p!166 (h!9905 (toList!3968 (+!1765 lt!217344 (tuple2!8993 a!501 b!85))))))))

(declare-fun b!477084 () Bool)

(assert (=> b!477084 (= e!280303 (forall!197 (t!15117 (toList!3968 (+!1765 lt!217344 (tuple2!8993 a!501 b!85)))) p!166))))

(assert (= (and d!76011 (not res!284811)) b!477083))

(assert (= (and b!477083 res!284812) b!477084))

(declare-fun b_lambda!10601 () Bool)

(assert (=> (not b_lambda!10601) (not b!477083)))

(declare-fun t!15169 () Bool)

(declare-fun tb!4071 () Bool)

(assert (=> (and start!42864 (= p!166 p!166) t!15169) tb!4071))

(declare-fun result!7639 () Bool)

(assert (=> tb!4071 (= result!7639 true)))

(assert (=> b!477083 t!15169))

(declare-fun b_and!20773 () Bool)

(assert (= b_and!20771 (and (=> t!15169 result!7639) b_and!20773)))

(declare-fun m!459443 () Bool)

(assert (=> b!477083 m!459443))

(declare-fun m!459445 () Bool)

(assert (=> b!477084 m!459445))

(assert (=> d!75953 d!76011))

(declare-fun d!76013 () Bool)

(declare-fun e!280304 () Bool)

(assert (=> d!76013 e!280304))

(declare-fun res!284814 () Bool)

(assert (=> d!76013 (=> (not res!284814) (not e!280304))))

(declare-fun lt!217445 () ListLongMap!7905)

(assert (=> d!76013 (= res!284814 (contains!2570 lt!217445 (_1!4507 (tuple2!8993 a!501 b!85))))))

(declare-fun lt!217448 () List!9053)

(assert (=> d!76013 (= lt!217445 (ListLongMap!7906 lt!217448))))

(declare-fun lt!217447 () Unit!14034)

(declare-fun lt!217446 () Unit!14034)

(assert (=> d!76013 (= lt!217447 lt!217446)))

(assert (=> d!76013 (= (getValueByKey!387 lt!217448 (_1!4507 (tuple2!8993 a!501 b!85))) (Some!392 (_2!4507 (tuple2!8993 a!501 b!85))))))

(assert (=> d!76013 (= lt!217446 (lemmaContainsTupThenGetReturnValue!209 lt!217448 (_1!4507 (tuple2!8993 a!501 b!85)) (_2!4507 (tuple2!8993 a!501 b!85))))))

(assert (=> d!76013 (= lt!217448 (insertStrictlySorted!212 (toList!3968 lt!217344) (_1!4507 (tuple2!8993 a!501 b!85)) (_2!4507 (tuple2!8993 a!501 b!85))))))

(assert (=> d!76013 (= (+!1765 lt!217344 (tuple2!8993 a!501 b!85)) lt!217445)))

(declare-fun b!477085 () Bool)

(declare-fun res!284813 () Bool)

(assert (=> b!477085 (=> (not res!284813) (not e!280304))))

(assert (=> b!477085 (= res!284813 (= (getValueByKey!387 (toList!3968 lt!217445) (_1!4507 (tuple2!8993 a!501 b!85))) (Some!392 (_2!4507 (tuple2!8993 a!501 b!85)))))))

(declare-fun b!477086 () Bool)

(assert (=> b!477086 (= e!280304 (contains!2571 (toList!3968 lt!217445) (tuple2!8993 a!501 b!85)))))

(assert (= (and d!76013 res!284814) b!477085))

(assert (= (and b!477085 res!284813) b!477086))

(declare-fun m!459447 () Bool)

(assert (=> d!76013 m!459447))

(declare-fun m!459449 () Bool)

(assert (=> d!76013 m!459449))

(declare-fun m!459451 () Bool)

(assert (=> d!76013 m!459451))

(declare-fun m!459453 () Bool)

(assert (=> d!76013 m!459453))

(declare-fun m!459455 () Bool)

(assert (=> b!477085 m!459455))

(declare-fun m!459457 () Bool)

(assert (=> b!477086 m!459457))

(assert (=> d!75953 d!76013))

(declare-fun d!76015 () Bool)

(assert (=> d!76015 (forall!197 (toList!3968 (+!1765 lt!217344 (tuple2!8993 a!501 b!85))) p!166)))

(assert (=> d!76015 true))

(declare-fun _$30!90 () Unit!14034)

(assert (=> d!76015 (= (choose!1363 lt!217344 p!166 a!501 b!85) _$30!90)))

(declare-fun bs!15169 () Bool)

(assert (= bs!15169 d!76015))

(assert (=> bs!15169 m!459343))

(assert (=> bs!15169 m!459345))

(assert (=> d!75953 d!76015))

(assert (=> d!75953 d!75909))

(declare-fun d!76017 () Bool)

(declare-fun e!280332 () Bool)

(assert (=> d!76017 e!280332))

(declare-fun res!284830 () Bool)

(assert (=> d!76017 (=> res!284830 e!280332)))

(declare-fun lt!217465 () Bool)

(assert (=> d!76017 (= res!284830 (not lt!217465))))

(declare-fun lt!217466 () Bool)

(assert (=> d!76017 (= lt!217465 lt!217466)))

(declare-fun lt!217464 () Unit!14034)

(declare-fun e!280333 () Unit!14034)

(assert (=> d!76017 (= lt!217464 e!280333)))

(declare-fun c!57408 () Bool)

(assert (=> d!76017 (= c!57408 lt!217466)))

(declare-fun containsKey!349 (List!9053 (_ BitVec 64)) Bool)

(assert (=> d!76017 (= lt!217466 (containsKey!349 (toList!3968 lt!217393) (_1!4507 lt!217342)))))

(assert (=> d!76017 (= (contains!2570 lt!217393 (_1!4507 lt!217342)) lt!217465)))

(declare-fun b!477133 () Bool)

(declare-fun lt!217467 () Unit!14034)

(assert (=> b!477133 (= e!280333 lt!217467)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!297 (List!9053 (_ BitVec 64)) Unit!14034)

(assert (=> b!477133 (= lt!217467 (lemmaContainsKeyImpliesGetValueByKeyDefined!297 (toList!3968 lt!217393) (_1!4507 lt!217342)))))

(declare-fun isDefined!298 (Option!393) Bool)

(assert (=> b!477133 (isDefined!298 (getValueByKey!387 (toList!3968 lt!217393) (_1!4507 lt!217342)))))

(declare-fun b!477134 () Bool)

(declare-fun Unit!14041 () Unit!14034)

(assert (=> b!477134 (= e!280333 Unit!14041)))

(declare-fun b!477135 () Bool)

(assert (=> b!477135 (= e!280332 (isDefined!298 (getValueByKey!387 (toList!3968 lt!217393) (_1!4507 lt!217342))))))

(assert (= (and d!76017 c!57408) b!477133))

(assert (= (and d!76017 (not c!57408)) b!477134))

(assert (= (and d!76017 (not res!284830)) b!477135))

(declare-fun m!459479 () Bool)

(assert (=> d!76017 m!459479))

(declare-fun m!459481 () Bool)

(assert (=> b!477133 m!459481))

(assert (=> b!477133 m!459291))

(assert (=> b!477133 m!459291))

(declare-fun m!459484 () Bool)

(assert (=> b!477133 m!459484))

(assert (=> b!477135 m!459291))

(assert (=> b!477135 m!459291))

(assert (=> b!477135 m!459484))

(assert (=> d!75933 d!76017))

(declare-fun b!477143 () Bool)

(declare-fun e!280337 () Option!393)

(declare-fun e!280338 () Option!393)

(assert (=> b!477143 (= e!280337 e!280338)))

(declare-fun c!57412 () Bool)

(assert (=> b!477143 (= c!57412 (and (is-Cons!9049 lt!217396) (not (= (_1!4507 (h!9905 lt!217396)) (_1!4507 lt!217342)))))))

(declare-fun b!477142 () Bool)

(assert (=> b!477142 (= e!280337 (Some!392 (_2!4507 (h!9905 lt!217396))))))

(declare-fun b!477144 () Bool)

(assert (=> b!477144 (= e!280338 (getValueByKey!387 (t!15117 lt!217396) (_1!4507 lt!217342)))))

(declare-fun b!477145 () Bool)

(assert (=> b!477145 (= e!280338 None!391)))

(declare-fun d!76029 () Bool)

(declare-fun c!57411 () Bool)

(assert (=> d!76029 (= c!57411 (and (is-Cons!9049 lt!217396) (= (_1!4507 (h!9905 lt!217396)) (_1!4507 lt!217342))))))

(assert (=> d!76029 (= (getValueByKey!387 lt!217396 (_1!4507 lt!217342)) e!280337)))

(assert (= (and d!76029 c!57411) b!477142))

(assert (= (and d!76029 (not c!57411)) b!477143))

(assert (= (and b!477143 c!57412) b!477144))

(assert (= (and b!477143 (not c!57412)) b!477145))

(declare-fun m!459493 () Bool)

(assert (=> b!477144 m!459493))

(assert (=> d!75933 d!76029))

(declare-fun d!76031 () Bool)

(assert (=> d!76031 (= (getValueByKey!387 lt!217396 (_1!4507 lt!217342)) (Some!392 (_2!4507 lt!217342)))))

(declare-fun lt!217473 () Unit!14034)

(declare-fun choose!1365 (List!9053 (_ BitVec 64) B!1052) Unit!14034)

(assert (=> d!76031 (= lt!217473 (choose!1365 lt!217396 (_1!4507 lt!217342) (_2!4507 lt!217342)))))

(declare-fun e!280353 () Bool)

(assert (=> d!76031 e!280353))

(declare-fun res!284843 () Bool)

(assert (=> d!76031 (=> (not res!284843) (not e!280353))))

(assert (=> d!76031 (= res!284843 (isStrictlySorted!387 lt!217396))))

(assert (=> d!76031 (= (lemmaContainsTupThenGetReturnValue!209 lt!217396 (_1!4507 lt!217342) (_2!4507 lt!217342)) lt!217473)))

(declare-fun b!477169 () Bool)

(declare-fun res!284844 () Bool)

(assert (=> b!477169 (=> (not res!284844) (not e!280353))))

(assert (=> b!477169 (= res!284844 (containsKey!349 lt!217396 (_1!4507 lt!217342)))))

(declare-fun b!477170 () Bool)

(assert (=> b!477170 (= e!280353 (contains!2571 lt!217396 (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))))))

(assert (= (and d!76031 res!284843) b!477169))

(assert (= (and b!477169 res!284844) b!477170))

(assert (=> d!76031 m!459285))

(declare-fun m!459519 () Bool)

(assert (=> d!76031 m!459519))

(declare-fun m!459521 () Bool)

(assert (=> d!76031 m!459521))

(declare-fun m!459523 () Bool)

(assert (=> b!477169 m!459523))

(declare-fun m!459525 () Bool)

(assert (=> b!477170 m!459525))

(assert (=> d!75933 d!76031))

(declare-fun b!477215 () Bool)

(declare-fun e!280380 () List!9053)

(assert (=> b!477215 (= e!280380 (insertStrictlySorted!212 (t!15117 (toList!3968 lm!215)) (_1!4507 lt!217342) (_2!4507 lt!217342)))))

(declare-fun bm!30746 () Bool)

(declare-fun call!30751 () List!9053)

(declare-fun call!30749 () List!9053)

(assert (=> bm!30746 (= call!30751 call!30749)))

(declare-fun b!477216 () Bool)

(declare-fun e!280381 () Bool)

(declare-fun lt!217489 () List!9053)

(assert (=> b!477216 (= e!280381 (contains!2571 lt!217489 (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))))))

(declare-fun b!477218 () Bool)

(declare-fun e!280383 () List!9053)

(declare-fun call!30750 () List!9053)

(assert (=> b!477218 (= e!280383 call!30750)))

(declare-fun bm!30747 () Bool)

(assert (=> bm!30747 (= call!30750 call!30751)))

(declare-fun b!477221 () Bool)

(assert (=> b!477221 (= e!280383 call!30750)))

(declare-fun b!477222 () Bool)

(declare-fun res!284857 () Bool)

(assert (=> b!477222 (=> (not res!284857) (not e!280381))))

(assert (=> b!477222 (= res!284857 (containsKey!349 lt!217489 (_1!4507 lt!217342)))))

(declare-fun d!76047 () Bool)

(assert (=> d!76047 e!280381))

(declare-fun res!284859 () Bool)

(assert (=> d!76047 (=> (not res!284859) (not e!280381))))

(assert (=> d!76047 (= res!284859 (isStrictlySorted!387 lt!217489))))

(declare-fun e!280382 () List!9053)

(assert (=> d!76047 (= lt!217489 e!280382)))

(declare-fun c!57438 () Bool)

(assert (=> d!76047 (= c!57438 (and (is-Cons!9049 (toList!3968 lm!215)) (bvslt (_1!4507 (h!9905 (toList!3968 lm!215))) (_1!4507 lt!217342))))))

(assert (=> d!76047 (isStrictlySorted!387 (toList!3968 lm!215))))

(assert (=> d!76047 (= (insertStrictlySorted!212 (toList!3968 lm!215) (_1!4507 lt!217342) (_2!4507 lt!217342)) lt!217489)))

(declare-fun b!477223 () Bool)

(declare-fun c!57437 () Bool)

(assert (=> b!477223 (= c!57437 (and (is-Cons!9049 (toList!3968 lm!215)) (bvsgt (_1!4507 (h!9905 (toList!3968 lm!215))) (_1!4507 lt!217342))))))

(declare-fun e!280384 () List!9053)

(assert (=> b!477223 (= e!280384 e!280383)))

(declare-fun bm!30748 () Bool)

(declare-fun $colon$colon!111 (List!9053 tuple2!8992) List!9053)

(assert (=> bm!30748 (= call!30749 ($colon$colon!111 e!280380 (ite c!57438 (h!9905 (toList!3968 lm!215)) (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342)))))))

(declare-fun c!57439 () Bool)

(assert (=> bm!30748 (= c!57439 c!57438)))

(declare-fun b!477224 () Bool)

(declare-fun c!57435 () Bool)

(assert (=> b!477224 (= e!280380 (ite c!57435 (t!15117 (toList!3968 lm!215)) (ite c!57437 (Cons!9049 (h!9905 (toList!3968 lm!215)) (t!15117 (toList!3968 lm!215))) Nil!9050)))))

(declare-fun b!477225 () Bool)

(assert (=> b!477225 (= e!280382 call!30749)))

(declare-fun b!477226 () Bool)

(assert (=> b!477226 (= e!280384 call!30751)))

(declare-fun b!477227 () Bool)

(assert (=> b!477227 (= e!280382 e!280384)))

(assert (=> b!477227 (= c!57435 (and (is-Cons!9049 (toList!3968 lm!215)) (= (_1!4507 (h!9905 (toList!3968 lm!215))) (_1!4507 lt!217342))))))

(assert (= (and d!76047 c!57438) b!477225))

(assert (= (and d!76047 (not c!57438)) b!477227))

(assert (= (and b!477227 c!57435) b!477226))

(assert (= (and b!477227 (not c!57435)) b!477223))

(assert (= (and b!477223 c!57437) b!477218))

(assert (= (and b!477223 (not c!57437)) b!477221))

(assert (= (or b!477218 b!477221) bm!30747))

(assert (= (or b!477226 bm!30747) bm!30746))

(assert (= (or b!477225 bm!30746) bm!30748))

(assert (= (and bm!30748 c!57439) b!477215))

(assert (= (and bm!30748 (not c!57439)) b!477224))

(assert (= (and d!76047 res!284859) b!477222))

(assert (= (and b!477222 res!284857) b!477216))

(declare-fun m!459541 () Bool)

(assert (=> b!477216 m!459541))

(declare-fun m!459543 () Bool)

(assert (=> bm!30748 m!459543))

(declare-fun m!459545 () Bool)

(assert (=> b!477222 m!459545))

(declare-fun m!459549 () Bool)

(assert (=> b!477215 m!459549))

(declare-fun m!459551 () Bool)

(assert (=> d!76047 m!459551))

(assert (=> d!76047 m!459231))

(assert (=> d!75933 d!76047))

(declare-fun d!76057 () Bool)

(declare-fun lt!217492 () Bool)

(assert (=> d!76057 (= lt!217492 (set.member lt!217342 (content!207 (toList!3968 lt!217397))))))

(declare-fun e!280389 () Bool)

(assert (=> d!76057 (= lt!217492 e!280389)))

(declare-fun res!284861 () Bool)

(assert (=> d!76057 (=> (not res!284861) (not e!280389))))

(assert (=> d!76057 (= res!284861 (is-Cons!9049 (toList!3968 lt!217397)))))

(assert (=> d!76057 (= (contains!2571 (toList!3968 lt!217397) lt!217342) lt!217492)))

(declare-fun b!477232 () Bool)

(declare-fun e!280390 () Bool)

(assert (=> b!477232 (= e!280389 e!280390)))

(declare-fun res!284860 () Bool)

(assert (=> b!477232 (=> res!284860 e!280390)))

(assert (=> b!477232 (= res!284860 (= (h!9905 (toList!3968 lt!217397)) lt!217342))))

(declare-fun b!477233 () Bool)

(assert (=> b!477233 (= e!280390 (contains!2571 (t!15117 (toList!3968 lt!217397)) lt!217342))))

(assert (= (and d!76057 res!284861) b!477232))

(assert (= (and b!477232 (not res!284860)) b!477233))

(declare-fun m!459553 () Bool)

(assert (=> d!76057 m!459553))

(declare-fun m!459555 () Bool)

(assert (=> d!76057 m!459555))

(declare-fun m!459557 () Bool)

(assert (=> b!477233 m!459557))

(assert (=> b!476963 d!76057))

(declare-fun d!76059 () Bool)

(declare-fun res!284862 () Bool)

(declare-fun e!280391 () Bool)

(assert (=> d!76059 (=> res!284862 e!280391)))

(assert (=> d!76059 (= res!284862 (is-Nil!9050 (t!15117 (toList!3968 (+!1765 lt!217344 lt!217342)))))))

(assert (=> d!76059 (= (forall!197 (t!15117 (toList!3968 (+!1765 lt!217344 lt!217342))) p!166) e!280391)))

(declare-fun b!477234 () Bool)

(declare-fun e!280392 () Bool)

(assert (=> b!477234 (= e!280391 e!280392)))

(declare-fun res!284863 () Bool)

(assert (=> b!477234 (=> (not res!284863) (not e!280392))))

(assert (=> b!477234 (= res!284863 (dynLambda!944 p!166 (h!9905 (t!15117 (toList!3968 (+!1765 lt!217344 lt!217342))))))))

(declare-fun b!477235 () Bool)

(assert (=> b!477235 (= e!280392 (forall!197 (t!15117 (t!15117 (toList!3968 (+!1765 lt!217344 lt!217342)))) p!166))))

(assert (= (and d!76059 (not res!284862)) b!477234))

(assert (= (and b!477234 res!284863) b!477235))

(declare-fun b_lambda!10615 () Bool)

(assert (=> (not b_lambda!10615) (not b!477234)))

(declare-fun t!15173 () Bool)

(declare-fun tb!4075 () Bool)

(assert (=> (and start!42864 (= p!166 p!166) t!15173) tb!4075))

(declare-fun result!7643 () Bool)

(assert (=> tb!4075 (= result!7643 true)))

(assert (=> b!477234 t!15173))

(declare-fun b_and!20777 () Bool)

(assert (= b_and!20773 (and (=> t!15173 result!7643) b_and!20777)))

(declare-fun m!459559 () Bool)

(assert (=> b!477234 m!459559))

(declare-fun m!459561 () Bool)

(assert (=> b!477235 m!459561))

(assert (=> b!476988 d!76059))

(declare-fun d!76061 () Bool)

(declare-fun e!280393 () Bool)

(assert (=> d!76061 e!280393))

(declare-fun res!284864 () Bool)

(assert (=> d!76061 (=> res!284864 e!280393)))

(declare-fun lt!217494 () Bool)

(assert (=> d!76061 (= res!284864 (not lt!217494))))

(declare-fun lt!217495 () Bool)

(assert (=> d!76061 (= lt!217494 lt!217495)))

(declare-fun lt!217493 () Unit!14034)

(declare-fun e!280394 () Unit!14034)

(assert (=> d!76061 (= lt!217493 e!280394)))

(declare-fun c!57442 () Bool)

(assert (=> d!76061 (= c!57442 lt!217495)))

(assert (=> d!76061 (= lt!217495 (containsKey!349 (toList!3968 lt!217397) (_1!4507 lt!217342)))))

(assert (=> d!76061 (= (contains!2570 lt!217397 (_1!4507 lt!217342)) lt!217494)))

(declare-fun b!477236 () Bool)

(declare-fun lt!217496 () Unit!14034)

(assert (=> b!477236 (= e!280394 lt!217496)))

(assert (=> b!477236 (= lt!217496 (lemmaContainsKeyImpliesGetValueByKeyDefined!297 (toList!3968 lt!217397) (_1!4507 lt!217342)))))

(assert (=> b!477236 (isDefined!298 (getValueByKey!387 (toList!3968 lt!217397) (_1!4507 lt!217342)))))

(declare-fun b!477237 () Bool)

(declare-fun Unit!14044 () Unit!14034)

(assert (=> b!477237 (= e!280394 Unit!14044)))

(declare-fun b!477238 () Bool)

(assert (=> b!477238 (= e!280393 (isDefined!298 (getValueByKey!387 (toList!3968 lt!217397) (_1!4507 lt!217342))))))

(assert (= (and d!76061 c!57442) b!477236))

(assert (= (and d!76061 (not c!57442)) b!477237))

(assert (= (and d!76061 (not res!284864)) b!477238))

(declare-fun m!459563 () Bool)

(assert (=> d!76061 m!459563))

(declare-fun m!459565 () Bool)

(assert (=> b!477236 m!459565))

(assert (=> b!477236 m!459309))

(assert (=> b!477236 m!459309))

(declare-fun m!459567 () Bool)

(assert (=> b!477236 m!459567))

(assert (=> b!477238 m!459309))

(assert (=> b!477238 m!459309))

(assert (=> b!477238 m!459567))

(assert (=> d!75947 d!76061))

(declare-fun b!477240 () Bool)

(declare-fun e!280395 () Option!393)

(declare-fun e!280396 () Option!393)

(assert (=> b!477240 (= e!280395 e!280396)))

(declare-fun c!57444 () Bool)

(assert (=> b!477240 (= c!57444 (and (is-Cons!9049 lt!217400) (not (= (_1!4507 (h!9905 lt!217400)) (_1!4507 lt!217342)))))))

(declare-fun b!477239 () Bool)

(assert (=> b!477239 (= e!280395 (Some!392 (_2!4507 (h!9905 lt!217400))))))

(declare-fun b!477241 () Bool)

(assert (=> b!477241 (= e!280396 (getValueByKey!387 (t!15117 lt!217400) (_1!4507 lt!217342)))))

(declare-fun b!477242 () Bool)

(assert (=> b!477242 (= e!280396 None!391)))

(declare-fun d!76063 () Bool)

(declare-fun c!57443 () Bool)

(assert (=> d!76063 (= c!57443 (and (is-Cons!9049 lt!217400) (= (_1!4507 (h!9905 lt!217400)) (_1!4507 lt!217342))))))

(assert (=> d!76063 (= (getValueByKey!387 lt!217400 (_1!4507 lt!217342)) e!280395)))

(assert (= (and d!76063 c!57443) b!477239))

(assert (= (and d!76063 (not c!57443)) b!477240))

(assert (= (and b!477240 c!57444) b!477241))

(assert (= (and b!477240 (not c!57444)) b!477242))

(declare-fun m!459569 () Bool)

(assert (=> b!477241 m!459569))

(assert (=> d!75947 d!76063))

(declare-fun d!76065 () Bool)

(assert (=> d!76065 (= (getValueByKey!387 lt!217400 (_1!4507 lt!217342)) (Some!392 (_2!4507 lt!217342)))))

(declare-fun lt!217497 () Unit!14034)

(assert (=> d!76065 (= lt!217497 (choose!1365 lt!217400 (_1!4507 lt!217342) (_2!4507 lt!217342)))))

(declare-fun e!280397 () Bool)

(assert (=> d!76065 e!280397))

(declare-fun res!284865 () Bool)

(assert (=> d!76065 (=> (not res!284865) (not e!280397))))

(assert (=> d!76065 (= res!284865 (isStrictlySorted!387 lt!217400))))

(assert (=> d!76065 (= (lemmaContainsTupThenGetReturnValue!209 lt!217400 (_1!4507 lt!217342) (_2!4507 lt!217342)) lt!217497)))

(declare-fun b!477243 () Bool)

(declare-fun res!284866 () Bool)

(assert (=> b!477243 (=> (not res!284866) (not e!280397))))

(assert (=> b!477243 (= res!284866 (containsKey!349 lt!217400 (_1!4507 lt!217342)))))

(declare-fun b!477244 () Bool)

(assert (=> b!477244 (= e!280397 (contains!2571 lt!217400 (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))))))

(assert (= (and d!76065 res!284865) b!477243))

(assert (= (and b!477243 res!284866) b!477244))

(assert (=> d!76065 m!459299))

(declare-fun m!459571 () Bool)

(assert (=> d!76065 m!459571))

(declare-fun m!459573 () Bool)

(assert (=> d!76065 m!459573))

(declare-fun m!459575 () Bool)

(assert (=> b!477243 m!459575))

(declare-fun m!459577 () Bool)

(assert (=> b!477244 m!459577))

(assert (=> d!75947 d!76065))

(declare-fun b!477249 () Bool)

(declare-fun e!280400 () List!9053)

(assert (=> b!477249 (= e!280400 (insertStrictlySorted!212 (t!15117 (toList!3968 lt!217344)) (_1!4507 lt!217342) (_2!4507 lt!217342)))))

(declare-fun bm!30749 () Bool)

(declare-fun call!30754 () List!9053)

(declare-fun call!30752 () List!9053)

(assert (=> bm!30749 (= call!30754 call!30752)))

(declare-fun b!477250 () Bool)

(declare-fun e!280401 () Bool)

(declare-fun lt!217500 () List!9053)

(assert (=> b!477250 (= e!280401 (contains!2571 lt!217500 (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))))))

(declare-fun b!477251 () Bool)

(declare-fun e!280403 () List!9053)

(declare-fun call!30753 () List!9053)

(assert (=> b!477251 (= e!280403 call!30753)))

(declare-fun bm!30750 () Bool)

(assert (=> bm!30750 (= call!30753 call!30754)))

(declare-fun b!477252 () Bool)

(assert (=> b!477252 (= e!280403 call!30753)))

(declare-fun b!477253 () Bool)

(declare-fun res!284871 () Bool)

(assert (=> b!477253 (=> (not res!284871) (not e!280401))))

(assert (=> b!477253 (= res!284871 (containsKey!349 lt!217500 (_1!4507 lt!217342)))))

(declare-fun d!76067 () Bool)

(assert (=> d!76067 e!280401))

(declare-fun res!284872 () Bool)

(assert (=> d!76067 (=> (not res!284872) (not e!280401))))

(assert (=> d!76067 (= res!284872 (isStrictlySorted!387 lt!217500))))

(declare-fun e!280402 () List!9053)

(assert (=> d!76067 (= lt!217500 e!280402)))

(declare-fun c!57447 () Bool)

(assert (=> d!76067 (= c!57447 (and (is-Cons!9049 (toList!3968 lt!217344)) (bvslt (_1!4507 (h!9905 (toList!3968 lt!217344))) (_1!4507 lt!217342))))))

(assert (=> d!76067 (isStrictlySorted!387 (toList!3968 lt!217344))))

(assert (=> d!76067 (= (insertStrictlySorted!212 (toList!3968 lt!217344) (_1!4507 lt!217342) (_2!4507 lt!217342)) lt!217500)))

(declare-fun b!477254 () Bool)

(declare-fun c!57446 () Bool)

(assert (=> b!477254 (= c!57446 (and (is-Cons!9049 (toList!3968 lt!217344)) (bvsgt (_1!4507 (h!9905 (toList!3968 lt!217344))) (_1!4507 lt!217342))))))

(declare-fun e!280404 () List!9053)

(assert (=> b!477254 (= e!280404 e!280403)))

(declare-fun bm!30751 () Bool)

(assert (=> bm!30751 (= call!30752 ($colon$colon!111 e!280400 (ite c!57447 (h!9905 (toList!3968 lt!217344)) (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342)))))))

(declare-fun c!57448 () Bool)

(assert (=> bm!30751 (= c!57448 c!57447)))

(declare-fun c!57445 () Bool)

(declare-fun b!477255 () Bool)

(assert (=> b!477255 (= e!280400 (ite c!57445 (t!15117 (toList!3968 lt!217344)) (ite c!57446 (Cons!9049 (h!9905 (toList!3968 lt!217344)) (t!15117 (toList!3968 lt!217344))) Nil!9050)))))

(declare-fun b!477256 () Bool)

(assert (=> b!477256 (= e!280402 call!30752)))

(declare-fun b!477257 () Bool)

(assert (=> b!477257 (= e!280404 call!30754)))

(declare-fun b!477258 () Bool)

(assert (=> b!477258 (= e!280402 e!280404)))

(assert (=> b!477258 (= c!57445 (and (is-Cons!9049 (toList!3968 lt!217344)) (= (_1!4507 (h!9905 (toList!3968 lt!217344))) (_1!4507 lt!217342))))))

(assert (= (and d!76067 c!57447) b!477256))

(assert (= (and d!76067 (not c!57447)) b!477258))

(assert (= (and b!477258 c!57445) b!477257))

(assert (= (and b!477258 (not c!57445)) b!477254))

(assert (= (and b!477254 c!57446) b!477251))

(assert (= (and b!477254 (not c!57446)) b!477252))

(assert (= (or b!477251 b!477252) bm!30750))

(assert (= (or b!477257 bm!30750) bm!30749))

(assert (= (or b!477256 bm!30749) bm!30751))

(assert (= (and bm!30751 c!57448) b!477249))

(assert (= (and bm!30751 (not c!57448)) b!477255))

(assert (= (and d!76067 res!284872) b!477253))

(assert (= (and b!477253 res!284871) b!477250))

(declare-fun m!459579 () Bool)

(assert (=> b!477250 m!459579))

(declare-fun m!459581 () Bool)

(assert (=> bm!30751 m!459581))

(declare-fun m!459583 () Bool)

(assert (=> b!477253 m!459583))

(declare-fun m!459585 () Bool)

(assert (=> b!477249 m!459585))

(declare-fun m!459587 () Bool)

(assert (=> d!76067 m!459587))

(declare-fun m!459589 () Bool)

(assert (=> d!76067 m!459589))

(assert (=> d!75947 d!76067))

(declare-fun b!477261 () Bool)

(declare-fun e!280406 () Bool)

(declare-fun tp!42420 () Bool)

(assert (=> b!477261 (= e!280406 (and tp_is_empty!13525 tp!42420))))

(assert (=> b!476995 (= tp!42415 e!280406)))

(assert (= (and b!476995 (is-Cons!9049 (t!15117 (toList!3968 lm!215)))) b!477261))

(declare-fun b_lambda!10617 () Bool)

(assert (= b_lambda!10595 (or (and start!42864 b_free!12103) b_lambda!10617)))

(declare-fun b_lambda!10619 () Bool)

(assert (= b_lambda!10615 (or (and start!42864 b_free!12103) b_lambda!10619)))

(declare-fun b_lambda!10621 () Bool)

(assert (= b_lambda!10601 (or (and start!42864 b_free!12103) b_lambda!10621)))

(declare-fun b_lambda!10623 () Bool)

(assert (= b_lambda!10597 (or (and start!42864 b_free!12103) b_lambda!10623)))

(declare-fun b_lambda!10625 () Bool)

(assert (= b_lambda!10599 (or (and start!42864 b_free!12103) b_lambda!10625)))

(push 1)

(assert (not d!76001))

(assert (not b_lambda!10567))

(assert (not b!477249))

(assert (not b!477241))

(assert (not b!477236))

(assert (not b!477250))

(assert (not b!477235))

(assert (not b!477169))

(assert (not b_lambda!10575))

(assert (not b!477243))

(assert (not b_lambda!10619))

(assert (not b_lambda!10625))

(assert (not b_lambda!10617))

(assert (not b!477261))

(assert (not b!477084))

(assert (not b_lambda!10573))

(assert (not b_lambda!10623))

(assert (not b!477086))

(assert (not d!76047))

(assert (not d!76017))

(assert (not b_lambda!10569))

(assert (not b!477233))

(assert (not b_next!12103))

(assert (not d!76015))

(assert (not b!477144))

(assert (not b!477078))

(assert (not bm!30751))

(assert (not b!477072))

(assert (not b!477135))

(assert (not b_lambda!10571))

(assert (not b!477058))

(assert (not b!477170))

(assert (not b!477037))

(assert (not b!477244))

(assert tp_is_empty!13525)

(assert b_and!20777)

(assert (not b!477133))

(assert (not d!76061))

(assert (not b!477085))

(assert (not b!477215))

(assert (not d!76031))

(assert (not bm!30748))

(assert (not b!477055))

(assert (not b!477216))

(assert (not d!76013))

(assert (not d!76057))

(assert (not d!76067))

(assert (not b!477081))

(assert (not b_lambda!10523))

(assert (not b!477060))

(assert (not b!477253))

(assert (not b!477238))

(assert (not d!76065))

(assert (not b_lambda!10621))

(assert (not b!477222))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20777)

(assert (not b_next!12103))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76191 () Bool)

(declare-fun res!284975 () Bool)

(declare-fun e!280549 () Bool)

(assert (=> d!76191 (=> res!284975 e!280549)))

(assert (=> d!76191 (= res!284975 (and (is-Cons!9049 lt!217400) (= (_1!4507 (h!9905 lt!217400)) (_1!4507 lt!217342))))))

(assert (=> d!76191 (= (containsKey!349 lt!217400 (_1!4507 lt!217342)) e!280549)))

(declare-fun b!477465 () Bool)

(declare-fun e!280550 () Bool)

(assert (=> b!477465 (= e!280549 e!280550)))

(declare-fun res!284976 () Bool)

(assert (=> b!477465 (=> (not res!284976) (not e!280550))))

(assert (=> b!477465 (= res!284976 (and (or (not (is-Cons!9049 lt!217400)) (bvsle (_1!4507 (h!9905 lt!217400)) (_1!4507 lt!217342))) (is-Cons!9049 lt!217400) (bvslt (_1!4507 (h!9905 lt!217400)) (_1!4507 lt!217342))))))

(declare-fun b!477466 () Bool)

(assert (=> b!477466 (= e!280550 (containsKey!349 (t!15117 lt!217400) (_1!4507 lt!217342)))))

(assert (= (and d!76191 (not res!284975)) b!477465))

(assert (= (and b!477465 res!284976) b!477466))

(declare-fun m!459837 () Bool)

(assert (=> b!477466 m!459837))

(assert (=> b!477243 d!76191))

(declare-fun b!477468 () Bool)

(declare-fun e!280551 () Option!393)

(declare-fun e!280552 () Option!393)

(assert (=> b!477468 (= e!280551 e!280552)))

(declare-fun c!57500 () Bool)

(assert (=> b!477468 (= c!57500 (and (is-Cons!9049 (t!15117 (toList!3968 lt!217397))) (not (= (_1!4507 (h!9905 (t!15117 (toList!3968 lt!217397)))) (_1!4507 lt!217342)))))))

(declare-fun b!477467 () Bool)

(assert (=> b!477467 (= e!280551 (Some!392 (_2!4507 (h!9905 (t!15117 (toList!3968 lt!217397))))))))

(declare-fun b!477469 () Bool)

(assert (=> b!477469 (= e!280552 (getValueByKey!387 (t!15117 (t!15117 (toList!3968 lt!217397))) (_1!4507 lt!217342)))))

(declare-fun b!477470 () Bool)

(assert (=> b!477470 (= e!280552 None!391)))

(declare-fun d!76193 () Bool)

(declare-fun c!57499 () Bool)

(assert (=> d!76193 (= c!57499 (and (is-Cons!9049 (t!15117 (toList!3968 lt!217397))) (= (_1!4507 (h!9905 (t!15117 (toList!3968 lt!217397)))) (_1!4507 lt!217342))))))

(assert (=> d!76193 (= (getValueByKey!387 (t!15117 (toList!3968 lt!217397)) (_1!4507 lt!217342)) e!280551)))

(assert (= (and d!76193 c!57499) b!477467))

(assert (= (and d!76193 (not c!57499)) b!477468))

(assert (= (and b!477468 c!57500) b!477469))

(assert (= (and b!477468 (not c!57500)) b!477470))

(declare-fun m!459839 () Bool)

(assert (=> b!477469 m!459839))

(assert (=> b!477081 d!76193))

(declare-fun d!76195 () Bool)

(declare-fun lt!217535 () Bool)

(assert (=> d!76195 (= lt!217535 (set.member (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342)) (content!207 lt!217400)))))

(declare-fun e!280553 () Bool)

(assert (=> d!76195 (= lt!217535 e!280553)))

(declare-fun res!284978 () Bool)

(assert (=> d!76195 (=> (not res!284978) (not e!280553))))

(assert (=> d!76195 (= res!284978 (is-Cons!9049 lt!217400))))

(assert (=> d!76195 (= (contains!2571 lt!217400 (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))) lt!217535)))

(declare-fun b!477471 () Bool)

(declare-fun e!280554 () Bool)

(assert (=> b!477471 (= e!280553 e!280554)))

(declare-fun res!284977 () Bool)

(assert (=> b!477471 (=> res!284977 e!280554)))

(assert (=> b!477471 (= res!284977 (= (h!9905 lt!217400) (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))))))

(declare-fun b!477472 () Bool)

(assert (=> b!477472 (= e!280554 (contains!2571 (t!15117 lt!217400) (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))))))

(assert (= (and d!76195 res!284978) b!477471))

(assert (= (and b!477471 (not res!284977)) b!477472))

(declare-fun m!459841 () Bool)

(assert (=> d!76195 m!459841))

(declare-fun m!459843 () Bool)

(assert (=> d!76195 m!459843))

(declare-fun m!459845 () Bool)

(assert (=> b!477472 m!459845))

(assert (=> b!477244 d!76195))

(declare-fun d!76197 () Bool)

(declare-fun c!57503 () Bool)

(assert (=> d!76197 (= c!57503 (is-Nil!9050 (toList!3968 lt!217393)))))

(declare-fun e!280557 () (Set tuple2!8992))

(assert (=> d!76197 (= (content!207 (toList!3968 lt!217393)) e!280557)))

(declare-fun b!477477 () Bool)

(assert (=> b!477477 (= e!280557 (as set.empty (Set tuple2!8992)))))

(declare-fun b!477478 () Bool)

(assert (=> b!477478 (= e!280557 (set.union (set.insert (h!9905 (toList!3968 lt!217393)) (as set.empty (Set tuple2!8992))) (content!207 (t!15117 (toList!3968 lt!217393)))))))

(assert (= (and d!76197 c!57503) b!477477))

(assert (= (and d!76197 (not c!57503)) b!477478))

(declare-fun m!459847 () Bool)

(assert (=> b!477478 m!459847))

(declare-fun m!459849 () Bool)

(assert (=> b!477478 m!459849))

(assert (=> d!76001 d!76197))

(declare-fun b!477479 () Bool)

(declare-fun e!280558 () List!9053)

(assert (=> b!477479 (= e!280558 (insertStrictlySorted!212 (t!15117 (t!15117 (toList!3968 lt!217344))) (_1!4507 lt!217342) (_2!4507 lt!217342)))))

(declare-fun bm!30773 () Bool)

(declare-fun call!30778 () List!9053)

(declare-fun call!30776 () List!9053)

(assert (=> bm!30773 (= call!30778 call!30776)))

(declare-fun b!477480 () Bool)

(declare-fun e!280559 () Bool)

(declare-fun lt!217536 () List!9053)

(assert (=> b!477480 (= e!280559 (contains!2571 lt!217536 (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))))))

(declare-fun b!477481 () Bool)

(declare-fun e!280561 () List!9053)

(declare-fun call!30777 () List!9053)

(assert (=> b!477481 (= e!280561 call!30777)))

(declare-fun bm!30774 () Bool)

(assert (=> bm!30774 (= call!30777 call!30778)))

(declare-fun b!477482 () Bool)

(assert (=> b!477482 (= e!280561 call!30777)))

(declare-fun b!477483 () Bool)

(declare-fun res!284979 () Bool)

(assert (=> b!477483 (=> (not res!284979) (not e!280559))))

(assert (=> b!477483 (= res!284979 (containsKey!349 lt!217536 (_1!4507 lt!217342)))))

(declare-fun d!76199 () Bool)

(assert (=> d!76199 e!280559))

(declare-fun res!284980 () Bool)

(assert (=> d!76199 (=> (not res!284980) (not e!280559))))

(assert (=> d!76199 (= res!284980 (isStrictlySorted!387 lt!217536))))

(declare-fun e!280560 () List!9053)

(assert (=> d!76199 (= lt!217536 e!280560)))

(declare-fun c!57506 () Bool)

(assert (=> d!76199 (= c!57506 (and (is-Cons!9049 (t!15117 (toList!3968 lt!217344))) (bvslt (_1!4507 (h!9905 (t!15117 (toList!3968 lt!217344)))) (_1!4507 lt!217342))))))

(assert (=> d!76199 (isStrictlySorted!387 (t!15117 (toList!3968 lt!217344)))))

(assert (=> d!76199 (= (insertStrictlySorted!212 (t!15117 (toList!3968 lt!217344)) (_1!4507 lt!217342) (_2!4507 lt!217342)) lt!217536)))

(declare-fun b!477484 () Bool)

(declare-fun c!57505 () Bool)

(assert (=> b!477484 (= c!57505 (and (is-Cons!9049 (t!15117 (toList!3968 lt!217344))) (bvsgt (_1!4507 (h!9905 (t!15117 (toList!3968 lt!217344)))) (_1!4507 lt!217342))))))

(declare-fun e!280562 () List!9053)

(assert (=> b!477484 (= e!280562 e!280561)))

(declare-fun bm!30775 () Bool)

(assert (=> bm!30775 (= call!30776 ($colon$colon!111 e!280558 (ite c!57506 (h!9905 (t!15117 (toList!3968 lt!217344))) (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342)))))))

(declare-fun c!57507 () Bool)

(assert (=> bm!30775 (= c!57507 c!57506)))

(declare-fun b!477485 () Bool)

(declare-fun c!57504 () Bool)

(assert (=> b!477485 (= e!280558 (ite c!57504 (t!15117 (t!15117 (toList!3968 lt!217344))) (ite c!57505 (Cons!9049 (h!9905 (t!15117 (toList!3968 lt!217344))) (t!15117 (t!15117 (toList!3968 lt!217344)))) Nil!9050)))))

(declare-fun b!477486 () Bool)

(assert (=> b!477486 (= e!280560 call!30776)))

(declare-fun b!477487 () Bool)

(assert (=> b!477487 (= e!280562 call!30778)))

(declare-fun b!477488 () Bool)

(assert (=> b!477488 (= e!280560 e!280562)))

(assert (=> b!477488 (= c!57504 (and (is-Cons!9049 (t!15117 (toList!3968 lt!217344))) (= (_1!4507 (h!9905 (t!15117 (toList!3968 lt!217344)))) (_1!4507 lt!217342))))))

(assert (= (and d!76199 c!57506) b!477486))

(assert (= (and d!76199 (not c!57506)) b!477488))

(assert (= (and b!477488 c!57504) b!477487))

(assert (= (and b!477488 (not c!57504)) b!477484))

(assert (= (and b!477484 c!57505) b!477481))

(assert (= (and b!477484 (not c!57505)) b!477482))

(assert (= (or b!477481 b!477482) bm!30774))

(assert (= (or b!477487 bm!30774) bm!30773))

(assert (= (or b!477486 bm!30773) bm!30775))

(assert (= (and bm!30775 c!57507) b!477479))

(assert (= (and bm!30775 (not c!57507)) b!477485))

(assert (= (and d!76199 res!284980) b!477483))

(assert (= (and b!477483 res!284979) b!477480))

(declare-fun m!459851 () Bool)

(assert (=> b!477480 m!459851))

(declare-fun m!459853 () Bool)

(assert (=> bm!30775 m!459853))

(declare-fun m!459855 () Bool)

(assert (=> b!477483 m!459855))

(declare-fun m!459857 () Bool)

(assert (=> b!477479 m!459857))

(declare-fun m!459859 () Bool)

(assert (=> d!76199 m!459859))

(declare-fun m!459861 () Bool)

(assert (=> d!76199 m!459861))

(assert (=> b!477249 d!76199))

(declare-fun d!76201 () Bool)

(declare-fun lt!217537 () Bool)

(assert (=> d!76201 (= lt!217537 (set.member (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342)) (content!207 lt!217500)))))

(declare-fun e!280563 () Bool)

(assert (=> d!76201 (= lt!217537 e!280563)))

(declare-fun res!284982 () Bool)

(assert (=> d!76201 (=> (not res!284982) (not e!280563))))

(assert (=> d!76201 (= res!284982 (is-Cons!9049 lt!217500))))

(assert (=> d!76201 (= (contains!2571 lt!217500 (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))) lt!217537)))

(declare-fun b!477489 () Bool)

(declare-fun e!280564 () Bool)

(assert (=> b!477489 (= e!280563 e!280564)))

(declare-fun res!284981 () Bool)

(assert (=> b!477489 (=> res!284981 e!280564)))

(assert (=> b!477489 (= res!284981 (= (h!9905 lt!217500) (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))))))

(declare-fun b!477490 () Bool)

(assert (=> b!477490 (= e!280564 (contains!2571 (t!15117 lt!217500) (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))))))

(assert (= (and d!76201 res!284982) b!477489))

(assert (= (and b!477489 (not res!284981)) b!477490))

(declare-fun m!459863 () Bool)

(assert (=> d!76201 m!459863))

(declare-fun m!459865 () Bool)

(assert (=> d!76201 m!459865))

(declare-fun m!459867 () Bool)

(assert (=> b!477490 m!459867))

(assert (=> b!477250 d!76201))

(declare-fun d!76203 () Bool)

(declare-fun res!284983 () Bool)

(declare-fun e!280565 () Bool)

(assert (=> d!76203 (=> res!284983 e!280565)))

(assert (=> d!76203 (= res!284983 (or (is-Nil!9050 lt!217489) (is-Nil!9050 (t!15117 lt!217489))))))

(assert (=> d!76203 (= (isStrictlySorted!387 lt!217489) e!280565)))

(declare-fun b!477491 () Bool)

(declare-fun e!280566 () Bool)

(assert (=> b!477491 (= e!280565 e!280566)))

(declare-fun res!284984 () Bool)

(assert (=> b!477491 (=> (not res!284984) (not e!280566))))

(assert (=> b!477491 (= res!284984 (bvslt (_1!4507 (h!9905 lt!217489)) (_1!4507 (h!9905 (t!15117 lt!217489)))))))

(declare-fun b!477492 () Bool)

(assert (=> b!477492 (= e!280566 (isStrictlySorted!387 (t!15117 lt!217489)))))

(assert (= (and d!76203 (not res!284983)) b!477491))

(assert (= (and b!477491 res!284984) b!477492))

(declare-fun m!459869 () Bool)

(assert (=> b!477492 m!459869))

(assert (=> d!76047 d!76203))

(assert (=> d!76047 d!76005))

(assert (=> d!76031 d!76029))

(declare-fun d!76205 () Bool)

(assert (=> d!76205 (= (getValueByKey!387 lt!217396 (_1!4507 lt!217342)) (Some!392 (_2!4507 lt!217342)))))

(assert (=> d!76205 true))

(declare-fun _$22!551 () Unit!14034)

(assert (=> d!76205 (= (choose!1365 lt!217396 (_1!4507 lt!217342) (_2!4507 lt!217342)) _$22!551)))

(declare-fun bs!15175 () Bool)

(assert (= bs!15175 d!76205))

(assert (=> bs!15175 m!459285))

(assert (=> d!76031 d!76205))

(declare-fun d!76207 () Bool)

(declare-fun res!284985 () Bool)

(declare-fun e!280567 () Bool)

(assert (=> d!76207 (=> res!284985 e!280567)))

(assert (=> d!76207 (= res!284985 (or (is-Nil!9050 lt!217396) (is-Nil!9050 (t!15117 lt!217396))))))

(assert (=> d!76207 (= (isStrictlySorted!387 lt!217396) e!280567)))

(declare-fun b!477493 () Bool)

(declare-fun e!280568 () Bool)

(assert (=> b!477493 (= e!280567 e!280568)))

(declare-fun res!284986 () Bool)

(assert (=> b!477493 (=> (not res!284986) (not e!280568))))

(assert (=> b!477493 (= res!284986 (bvslt (_1!4507 (h!9905 lt!217396)) (_1!4507 (h!9905 (t!15117 lt!217396)))))))

(declare-fun b!477494 () Bool)

(assert (=> b!477494 (= e!280568 (isStrictlySorted!387 (t!15117 lt!217396)))))

(assert (= (and d!76207 (not res!284985)) b!477493))

(assert (= (and b!477493 res!284986) b!477494))

(declare-fun m!459871 () Bool)

(assert (=> b!477494 m!459871))

(assert (=> d!76031 d!76207))

(declare-fun d!76209 () Bool)

(declare-fun res!284987 () Bool)

(declare-fun e!280569 () Bool)

(assert (=> d!76209 (=> res!284987 e!280569)))

(assert (=> d!76209 (= res!284987 (or (is-Nil!9050 (t!15117 (toList!3968 lm!215))) (is-Nil!9050 (t!15117 (t!15117 (toList!3968 lm!215))))))))

(assert (=> d!76209 (= (isStrictlySorted!387 (t!15117 (toList!3968 lm!215))) e!280569)))

(declare-fun b!477495 () Bool)

(declare-fun e!280570 () Bool)

(assert (=> b!477495 (= e!280569 e!280570)))

(declare-fun res!284988 () Bool)

(assert (=> b!477495 (=> (not res!284988) (not e!280570))))

(assert (=> b!477495 (= res!284988 (bvslt (_1!4507 (h!9905 (t!15117 (toList!3968 lm!215)))) (_1!4507 (h!9905 (t!15117 (t!15117 (toList!3968 lm!215)))))))))

(declare-fun b!477496 () Bool)

(assert (=> b!477496 (= e!280570 (isStrictlySorted!387 (t!15117 (t!15117 (toList!3968 lm!215)))))))

(assert (= (and d!76209 (not res!284987)) b!477495))

(assert (= (and b!477495 res!284988) b!477496))

(declare-fun m!459873 () Bool)

(assert (=> b!477496 m!459873))

(assert (=> b!477078 d!76209))

(declare-fun d!76211 () Bool)

(declare-fun res!284989 () Bool)

(declare-fun e!280571 () Bool)

(assert (=> d!76211 (=> res!284989 e!280571)))

(assert (=> d!76211 (= res!284989 (and (is-Cons!9049 lt!217500) (= (_1!4507 (h!9905 lt!217500)) (_1!4507 lt!217342))))))

(assert (=> d!76211 (= (containsKey!349 lt!217500 (_1!4507 lt!217342)) e!280571)))

(declare-fun b!477497 () Bool)

(declare-fun e!280572 () Bool)

(assert (=> b!477497 (= e!280571 e!280572)))

(declare-fun res!284990 () Bool)

(assert (=> b!477497 (=> (not res!284990) (not e!280572))))

(assert (=> b!477497 (= res!284990 (and (or (not (is-Cons!9049 lt!217500)) (bvsle (_1!4507 (h!9905 lt!217500)) (_1!4507 lt!217342))) (is-Cons!9049 lt!217500) (bvslt (_1!4507 (h!9905 lt!217500)) (_1!4507 lt!217342))))))

(declare-fun b!477498 () Bool)

(assert (=> b!477498 (= e!280572 (containsKey!349 (t!15117 lt!217500) (_1!4507 lt!217342)))))

(assert (= (and d!76211 (not res!284989)) b!477497))

(assert (= (and b!477497 res!284990) b!477498))

(declare-fun m!459875 () Bool)

(assert (=> b!477498 m!459875))

(assert (=> b!477253 d!76211))

(declare-fun d!76213 () Bool)

(declare-fun e!280573 () Bool)

(assert (=> d!76213 e!280573))

(declare-fun res!284991 () Bool)

(assert (=> d!76213 (=> res!284991 e!280573)))

(declare-fun lt!217539 () Bool)

(assert (=> d!76213 (= res!284991 (not lt!217539))))

(declare-fun lt!217540 () Bool)

(assert (=> d!76213 (= lt!217539 lt!217540)))

(declare-fun lt!217538 () Unit!14034)

(declare-fun e!280574 () Unit!14034)

(assert (=> d!76213 (= lt!217538 e!280574)))

(declare-fun c!57508 () Bool)

(assert (=> d!76213 (= c!57508 lt!217540)))

(assert (=> d!76213 (= lt!217540 (containsKey!349 (toList!3968 lt!217445) (_1!4507 (tuple2!8993 a!501 b!85))))))

(assert (=> d!76213 (= (contains!2570 lt!217445 (_1!4507 (tuple2!8993 a!501 b!85))) lt!217539)))

(declare-fun b!477499 () Bool)

(declare-fun lt!217541 () Unit!14034)

(assert (=> b!477499 (= e!280574 lt!217541)))

(assert (=> b!477499 (= lt!217541 (lemmaContainsKeyImpliesGetValueByKeyDefined!297 (toList!3968 lt!217445) (_1!4507 (tuple2!8993 a!501 b!85))))))

(assert (=> b!477499 (isDefined!298 (getValueByKey!387 (toList!3968 lt!217445) (_1!4507 (tuple2!8993 a!501 b!85))))))

(declare-fun b!477500 () Bool)

(declare-fun Unit!14047 () Unit!14034)

(assert (=> b!477500 (= e!280574 Unit!14047)))

(declare-fun b!477501 () Bool)

(assert (=> b!477501 (= e!280573 (isDefined!298 (getValueByKey!387 (toList!3968 lt!217445) (_1!4507 (tuple2!8993 a!501 b!85)))))))

(assert (= (and d!76213 c!57508) b!477499))

(assert (= (and d!76213 (not c!57508)) b!477500))

(assert (= (and d!76213 (not res!284991)) b!477501))

(declare-fun m!459877 () Bool)

(assert (=> d!76213 m!459877))

(declare-fun m!459879 () Bool)

(assert (=> b!477499 m!459879))

(assert (=> b!477499 m!459455))

(assert (=> b!477499 m!459455))

(declare-fun m!459881 () Bool)

(assert (=> b!477499 m!459881))

(assert (=> b!477501 m!459455))

(assert (=> b!477501 m!459455))

(assert (=> b!477501 m!459881))

(assert (=> d!76013 d!76213))

(declare-fun b!477503 () Bool)

(declare-fun e!280575 () Option!393)

(declare-fun e!280576 () Option!393)

(assert (=> b!477503 (= e!280575 e!280576)))

(declare-fun c!57510 () Bool)

(assert (=> b!477503 (= c!57510 (and (is-Cons!9049 lt!217448) (not (= (_1!4507 (h!9905 lt!217448)) (_1!4507 (tuple2!8993 a!501 b!85))))))))

(declare-fun b!477502 () Bool)

(assert (=> b!477502 (= e!280575 (Some!392 (_2!4507 (h!9905 lt!217448))))))

(declare-fun b!477504 () Bool)

(assert (=> b!477504 (= e!280576 (getValueByKey!387 (t!15117 lt!217448) (_1!4507 (tuple2!8993 a!501 b!85))))))

(declare-fun b!477505 () Bool)

(assert (=> b!477505 (= e!280576 None!391)))

(declare-fun c!57509 () Bool)

(declare-fun d!76215 () Bool)

(assert (=> d!76215 (= c!57509 (and (is-Cons!9049 lt!217448) (= (_1!4507 (h!9905 lt!217448)) (_1!4507 (tuple2!8993 a!501 b!85)))))))

(assert (=> d!76215 (= (getValueByKey!387 lt!217448 (_1!4507 (tuple2!8993 a!501 b!85))) e!280575)))

(assert (= (and d!76215 c!57509) b!477502))

(assert (= (and d!76215 (not c!57509)) b!477503))

(assert (= (and b!477503 c!57510) b!477504))

(assert (= (and b!477503 (not c!57510)) b!477505))

(declare-fun m!459883 () Bool)

(assert (=> b!477504 m!459883))

(assert (=> d!76013 d!76215))

(declare-fun d!76217 () Bool)

(assert (=> d!76217 (= (getValueByKey!387 lt!217448 (_1!4507 (tuple2!8993 a!501 b!85))) (Some!392 (_2!4507 (tuple2!8993 a!501 b!85))))))

(declare-fun lt!217542 () Unit!14034)

(assert (=> d!76217 (= lt!217542 (choose!1365 lt!217448 (_1!4507 (tuple2!8993 a!501 b!85)) (_2!4507 (tuple2!8993 a!501 b!85))))))

(declare-fun e!280577 () Bool)

(assert (=> d!76217 e!280577))

(declare-fun res!284992 () Bool)

(assert (=> d!76217 (=> (not res!284992) (not e!280577))))

(assert (=> d!76217 (= res!284992 (isStrictlySorted!387 lt!217448))))

(assert (=> d!76217 (= (lemmaContainsTupThenGetReturnValue!209 lt!217448 (_1!4507 (tuple2!8993 a!501 b!85)) (_2!4507 (tuple2!8993 a!501 b!85))) lt!217542)))

(declare-fun b!477506 () Bool)

(declare-fun res!284993 () Bool)

(assert (=> b!477506 (=> (not res!284993) (not e!280577))))

(assert (=> b!477506 (= res!284993 (containsKey!349 lt!217448 (_1!4507 (tuple2!8993 a!501 b!85))))))

(declare-fun b!477507 () Bool)

(assert (=> b!477507 (= e!280577 (contains!2571 lt!217448 (tuple2!8993 (_1!4507 (tuple2!8993 a!501 b!85)) (_2!4507 (tuple2!8993 a!501 b!85)))))))

(assert (= (and d!76217 res!284992) b!477506))

(assert (= (and b!477506 res!284993) b!477507))

(assert (=> d!76217 m!459449))

(declare-fun m!459885 () Bool)

(assert (=> d!76217 m!459885))

(declare-fun m!459887 () Bool)

(assert (=> d!76217 m!459887))

(declare-fun m!459889 () Bool)

(assert (=> b!477506 m!459889))

(declare-fun m!459891 () Bool)

(assert (=> b!477507 m!459891))

(assert (=> d!76013 d!76217))

(declare-fun b!477508 () Bool)

(declare-fun e!280578 () List!9053)

(assert (=> b!477508 (= e!280578 (insertStrictlySorted!212 (t!15117 (toList!3968 lt!217344)) (_1!4507 (tuple2!8993 a!501 b!85)) (_2!4507 (tuple2!8993 a!501 b!85))))))

(declare-fun bm!30776 () Bool)

(declare-fun call!30781 () List!9053)

(declare-fun call!30779 () List!9053)

(assert (=> bm!30776 (= call!30781 call!30779)))

(declare-fun b!477509 () Bool)

(declare-fun lt!217543 () List!9053)

(declare-fun e!280579 () Bool)

(assert (=> b!477509 (= e!280579 (contains!2571 lt!217543 (tuple2!8993 (_1!4507 (tuple2!8993 a!501 b!85)) (_2!4507 (tuple2!8993 a!501 b!85)))))))

(declare-fun b!477510 () Bool)

(declare-fun e!280581 () List!9053)

(declare-fun call!30780 () List!9053)

(assert (=> b!477510 (= e!280581 call!30780)))

(declare-fun bm!30777 () Bool)

(assert (=> bm!30777 (= call!30780 call!30781)))

(declare-fun b!477511 () Bool)

(assert (=> b!477511 (= e!280581 call!30780)))

(declare-fun b!477512 () Bool)

(declare-fun res!284994 () Bool)

(assert (=> b!477512 (=> (not res!284994) (not e!280579))))

(assert (=> b!477512 (= res!284994 (containsKey!349 lt!217543 (_1!4507 (tuple2!8993 a!501 b!85))))))

(declare-fun d!76219 () Bool)

(assert (=> d!76219 e!280579))

(declare-fun res!284995 () Bool)

(assert (=> d!76219 (=> (not res!284995) (not e!280579))))

(assert (=> d!76219 (= res!284995 (isStrictlySorted!387 lt!217543))))

(declare-fun e!280580 () List!9053)

(assert (=> d!76219 (= lt!217543 e!280580)))

(declare-fun c!57513 () Bool)

(assert (=> d!76219 (= c!57513 (and (is-Cons!9049 (toList!3968 lt!217344)) (bvslt (_1!4507 (h!9905 (toList!3968 lt!217344))) (_1!4507 (tuple2!8993 a!501 b!85)))))))

(assert (=> d!76219 (isStrictlySorted!387 (toList!3968 lt!217344))))

(assert (=> d!76219 (= (insertStrictlySorted!212 (toList!3968 lt!217344) (_1!4507 (tuple2!8993 a!501 b!85)) (_2!4507 (tuple2!8993 a!501 b!85))) lt!217543)))

(declare-fun b!477513 () Bool)

(declare-fun c!57512 () Bool)

(assert (=> b!477513 (= c!57512 (and (is-Cons!9049 (toList!3968 lt!217344)) (bvsgt (_1!4507 (h!9905 (toList!3968 lt!217344))) (_1!4507 (tuple2!8993 a!501 b!85)))))))

(declare-fun e!280582 () List!9053)

(assert (=> b!477513 (= e!280582 e!280581)))

(declare-fun bm!30778 () Bool)

(assert (=> bm!30778 (= call!30779 ($colon$colon!111 e!280578 (ite c!57513 (h!9905 (toList!3968 lt!217344)) (tuple2!8993 (_1!4507 (tuple2!8993 a!501 b!85)) (_2!4507 (tuple2!8993 a!501 b!85))))))))

(declare-fun c!57514 () Bool)

(assert (=> bm!30778 (= c!57514 c!57513)))

(declare-fun c!57511 () Bool)

(declare-fun b!477514 () Bool)

(assert (=> b!477514 (= e!280578 (ite c!57511 (t!15117 (toList!3968 lt!217344)) (ite c!57512 (Cons!9049 (h!9905 (toList!3968 lt!217344)) (t!15117 (toList!3968 lt!217344))) Nil!9050)))))

(declare-fun b!477515 () Bool)

(assert (=> b!477515 (= e!280580 call!30779)))

(declare-fun b!477516 () Bool)

(assert (=> b!477516 (= e!280582 call!30781)))

(declare-fun b!477517 () Bool)

(assert (=> b!477517 (= e!280580 e!280582)))

(assert (=> b!477517 (= c!57511 (and (is-Cons!9049 (toList!3968 lt!217344)) (= (_1!4507 (h!9905 (toList!3968 lt!217344))) (_1!4507 (tuple2!8993 a!501 b!85)))))))

(assert (= (and d!76219 c!57513) b!477515))

(assert (= (and d!76219 (not c!57513)) b!477517))

(assert (= (and b!477517 c!57511) b!477516))

(assert (= (and b!477517 (not c!57511)) b!477513))

(assert (= (and b!477513 c!57512) b!477510))

(assert (= (and b!477513 (not c!57512)) b!477511))

(assert (= (or b!477510 b!477511) bm!30777))

(assert (= (or b!477516 bm!30777) bm!30776))

(assert (= (or b!477515 bm!30776) bm!30778))

(assert (= (and bm!30778 c!57514) b!477508))

(assert (= (and bm!30778 (not c!57514)) b!477514))

(assert (= (and d!76219 res!284995) b!477512))

(assert (= (and b!477512 res!284994) b!477509))

(declare-fun m!459893 () Bool)

(assert (=> b!477509 m!459893))

(declare-fun m!459895 () Bool)

(assert (=> bm!30778 m!459895))

(declare-fun m!459897 () Bool)

(assert (=> b!477512 m!459897))

(declare-fun m!459899 () Bool)

(assert (=> b!477508 m!459899))

(declare-fun m!459901 () Bool)

(assert (=> d!76219 m!459901))

(assert (=> d!76219 m!459589))

(assert (=> d!76013 d!76219))

(declare-fun d!76221 () Bool)

(declare-fun res!284996 () Bool)

(declare-fun e!280583 () Bool)

(assert (=> d!76221 (=> res!284996 e!280583)))

(assert (=> d!76221 (= res!284996 (or (is-Nil!9050 lt!217500) (is-Nil!9050 (t!15117 lt!217500))))))

(assert (=> d!76221 (= (isStrictlySorted!387 lt!217500) e!280583)))

(declare-fun b!477518 () Bool)

(declare-fun e!280584 () Bool)

(assert (=> b!477518 (= e!280583 e!280584)))

(declare-fun res!284997 () Bool)

(assert (=> b!477518 (=> (not res!284997) (not e!280584))))

(assert (=> b!477518 (= res!284997 (bvslt (_1!4507 (h!9905 lt!217500)) (_1!4507 (h!9905 (t!15117 lt!217500)))))))

(declare-fun b!477519 () Bool)

(assert (=> b!477519 (= e!280584 (isStrictlySorted!387 (t!15117 lt!217500)))))

(assert (= (and d!76221 (not res!284996)) b!477518))

(assert (= (and b!477518 res!284997) b!477519))

(declare-fun m!459903 () Bool)

(assert (=> b!477519 m!459903))

(assert (=> d!76067 d!76221))

(declare-fun d!76223 () Bool)

(declare-fun res!284998 () Bool)

(declare-fun e!280585 () Bool)

(assert (=> d!76223 (=> res!284998 e!280585)))

(assert (=> d!76223 (= res!284998 (or (is-Nil!9050 (toList!3968 lt!217344)) (is-Nil!9050 (t!15117 (toList!3968 lt!217344)))))))

(assert (=> d!76223 (= (isStrictlySorted!387 (toList!3968 lt!217344)) e!280585)))

(declare-fun b!477520 () Bool)

(declare-fun e!280586 () Bool)

(assert (=> b!477520 (= e!280585 e!280586)))

(declare-fun res!284999 () Bool)

(assert (=> b!477520 (=> (not res!284999) (not e!280586))))

(assert (=> b!477520 (= res!284999 (bvslt (_1!4507 (h!9905 (toList!3968 lt!217344))) (_1!4507 (h!9905 (t!15117 (toList!3968 lt!217344))))))))

(declare-fun b!477521 () Bool)

(assert (=> b!477521 (= e!280586 (isStrictlySorted!387 (t!15117 (toList!3968 lt!217344))))))

(assert (= (and d!76223 (not res!284998)) b!477520))

(assert (= (and b!477520 res!284999) b!477521))

(assert (=> b!477521 m!459861))

(assert (=> d!76067 d!76223))

(declare-fun d!76225 () Bool)

(declare-fun res!285000 () Bool)

(declare-fun e!280587 () Bool)

(assert (=> d!76225 (=> res!285000 e!280587)))

(assert (=> d!76225 (= res!285000 (and (is-Cons!9049 (toList!3968 lt!217397)) (= (_1!4507 (h!9905 (toList!3968 lt!217397))) (_1!4507 lt!217342))))))

(assert (=> d!76225 (= (containsKey!349 (toList!3968 lt!217397) (_1!4507 lt!217342)) e!280587)))

(declare-fun b!477522 () Bool)

(declare-fun e!280588 () Bool)

(assert (=> b!477522 (= e!280587 e!280588)))

(declare-fun res!285001 () Bool)

(assert (=> b!477522 (=> (not res!285001) (not e!280588))))

(assert (=> b!477522 (= res!285001 (and (or (not (is-Cons!9049 (toList!3968 lt!217397))) (bvsle (_1!4507 (h!9905 (toList!3968 lt!217397))) (_1!4507 lt!217342))) (is-Cons!9049 (toList!3968 lt!217397)) (bvslt (_1!4507 (h!9905 (toList!3968 lt!217397))) (_1!4507 lt!217342))))))

(declare-fun b!477523 () Bool)

(assert (=> b!477523 (= e!280588 (containsKey!349 (t!15117 (toList!3968 lt!217397)) (_1!4507 lt!217342)))))

(assert (= (and d!76225 (not res!285000)) b!477522))

(assert (= (and b!477522 res!285001) b!477523))

(declare-fun m!459905 () Bool)

(assert (=> b!477523 m!459905))

(assert (=> d!76061 d!76225))

(declare-fun b!477524 () Bool)

(declare-fun e!280589 () List!9053)

(assert (=> b!477524 (= e!280589 (insertStrictlySorted!212 (t!15117 (t!15117 (toList!3968 lm!215))) (_1!4507 lt!217342) (_2!4507 lt!217342)))))

(declare-fun bm!30779 () Bool)

(declare-fun call!30784 () List!9053)

(declare-fun call!30782 () List!9053)

(assert (=> bm!30779 (= call!30784 call!30782)))

(declare-fun b!477525 () Bool)

(declare-fun e!280590 () Bool)

(declare-fun lt!217544 () List!9053)

(assert (=> b!477525 (= e!280590 (contains!2571 lt!217544 (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))))))

(declare-fun b!477526 () Bool)

(declare-fun e!280592 () List!9053)

(declare-fun call!30783 () List!9053)

(assert (=> b!477526 (= e!280592 call!30783)))

(declare-fun bm!30780 () Bool)

(assert (=> bm!30780 (= call!30783 call!30784)))

(declare-fun b!477527 () Bool)

(assert (=> b!477527 (= e!280592 call!30783)))

(declare-fun b!477528 () Bool)

(declare-fun res!285002 () Bool)

(assert (=> b!477528 (=> (not res!285002) (not e!280590))))

(assert (=> b!477528 (= res!285002 (containsKey!349 lt!217544 (_1!4507 lt!217342)))))

(declare-fun d!76227 () Bool)

(assert (=> d!76227 e!280590))

(declare-fun res!285003 () Bool)

(assert (=> d!76227 (=> (not res!285003) (not e!280590))))

(assert (=> d!76227 (= res!285003 (isStrictlySorted!387 lt!217544))))

(declare-fun e!280591 () List!9053)

(assert (=> d!76227 (= lt!217544 e!280591)))

(declare-fun c!57517 () Bool)

(assert (=> d!76227 (= c!57517 (and (is-Cons!9049 (t!15117 (toList!3968 lm!215))) (bvslt (_1!4507 (h!9905 (t!15117 (toList!3968 lm!215)))) (_1!4507 lt!217342))))))

(assert (=> d!76227 (isStrictlySorted!387 (t!15117 (toList!3968 lm!215)))))

(assert (=> d!76227 (= (insertStrictlySorted!212 (t!15117 (toList!3968 lm!215)) (_1!4507 lt!217342) (_2!4507 lt!217342)) lt!217544)))

(declare-fun b!477529 () Bool)

(declare-fun c!57516 () Bool)

(assert (=> b!477529 (= c!57516 (and (is-Cons!9049 (t!15117 (toList!3968 lm!215))) (bvsgt (_1!4507 (h!9905 (t!15117 (toList!3968 lm!215)))) (_1!4507 lt!217342))))))

(declare-fun e!280593 () List!9053)

(assert (=> b!477529 (= e!280593 e!280592)))

(declare-fun bm!30781 () Bool)

(assert (=> bm!30781 (= call!30782 ($colon$colon!111 e!280589 (ite c!57517 (h!9905 (t!15117 (toList!3968 lm!215))) (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342)))))))

(declare-fun c!57518 () Bool)

(assert (=> bm!30781 (= c!57518 c!57517)))

(declare-fun b!477530 () Bool)

(declare-fun c!57515 () Bool)

(assert (=> b!477530 (= e!280589 (ite c!57515 (t!15117 (t!15117 (toList!3968 lm!215))) (ite c!57516 (Cons!9049 (h!9905 (t!15117 (toList!3968 lm!215))) (t!15117 (t!15117 (toList!3968 lm!215)))) Nil!9050)))))

(declare-fun b!477531 () Bool)

(assert (=> b!477531 (= e!280591 call!30782)))

(declare-fun b!477532 () Bool)

(assert (=> b!477532 (= e!280593 call!30784)))

(declare-fun b!477533 () Bool)

(assert (=> b!477533 (= e!280591 e!280593)))

(assert (=> b!477533 (= c!57515 (and (is-Cons!9049 (t!15117 (toList!3968 lm!215))) (= (_1!4507 (h!9905 (t!15117 (toList!3968 lm!215)))) (_1!4507 lt!217342))))))

(assert (= (and d!76227 c!57517) b!477531))

(assert (= (and d!76227 (not c!57517)) b!477533))

(assert (= (and b!477533 c!57515) b!477532))

(assert (= (and b!477533 (not c!57515)) b!477529))

(assert (= (and b!477529 c!57516) b!477526))

(assert (= (and b!477529 (not c!57516)) b!477527))

(assert (= (or b!477526 b!477527) bm!30780))

(assert (= (or b!477532 bm!30780) bm!30779))

(assert (= (or b!477531 bm!30779) bm!30781))

(assert (= (and bm!30781 c!57518) b!477524))

(assert (= (and bm!30781 (not c!57518)) b!477530))

(assert (= (and d!76227 res!285003) b!477528))

(assert (= (and b!477528 res!285002) b!477525))

(declare-fun m!459907 () Bool)

(assert (=> b!477525 m!459907))

(declare-fun m!459909 () Bool)

(assert (=> bm!30781 m!459909))

(declare-fun m!459911 () Bool)

(assert (=> b!477528 m!459911))

(declare-fun m!459913 () Bool)

(assert (=> b!477524 m!459913))

(declare-fun m!459915 () Bool)

(assert (=> d!76227 m!459915))

(assert (=> d!76227 m!459439))

(assert (=> b!477215 d!76227))

(declare-fun d!76229 () Bool)

(declare-fun res!285004 () Bool)

(declare-fun e!280594 () Bool)

(assert (=> d!76229 (=> res!285004 e!280594)))

(assert (=> d!76229 (= res!285004 (is-Nil!9050 (t!15117 (t!15117 (toList!3968 lt!217344)))))))

(assert (=> d!76229 (= (forall!197 (t!15117 (t!15117 (toList!3968 lt!217344))) p!166) e!280594)))

(declare-fun b!477534 () Bool)

(declare-fun e!280595 () Bool)

(assert (=> b!477534 (= e!280594 e!280595)))

(declare-fun res!285005 () Bool)

(assert (=> b!477534 (=> (not res!285005) (not e!280595))))

(assert (=> b!477534 (= res!285005 (dynLambda!944 p!166 (h!9905 (t!15117 (t!15117 (toList!3968 lt!217344))))))))

(declare-fun b!477535 () Bool)

(assert (=> b!477535 (= e!280595 (forall!197 (t!15117 (t!15117 (t!15117 (toList!3968 lt!217344)))) p!166))))

(assert (= (and d!76229 (not res!285004)) b!477534))

(assert (= (and b!477534 res!285005) b!477535))

(declare-fun b_lambda!10667 () Bool)

(assert (=> (not b_lambda!10667) (not b!477534)))

(declare-fun t!15196 () Bool)

(declare-fun tb!4097 () Bool)

(assert (=> (and start!42864 (= p!166 p!166) t!15196) tb!4097))

(declare-fun result!7665 () Bool)

(assert (=> tb!4097 (= result!7665 true)))

(assert (=> b!477534 t!15196))

(declare-fun b_and!20799 () Bool)

(assert (= b_and!20777 (and (=> t!15196 result!7665) b_and!20799)))

(declare-fun m!459917 () Bool)

(assert (=> b!477534 m!459917))

(declare-fun m!459919 () Bool)

(assert (=> b!477535 m!459919))

(assert (=> b!477058 d!76229))

(declare-fun d!76231 () Bool)

(declare-fun lt!217545 () Bool)

(assert (=> d!76231 (= lt!217545 (set.member (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342)) (content!207 lt!217489)))))

(declare-fun e!280596 () Bool)

(assert (=> d!76231 (= lt!217545 e!280596)))

(declare-fun res!285007 () Bool)

(assert (=> d!76231 (=> (not res!285007) (not e!280596))))

(assert (=> d!76231 (= res!285007 (is-Cons!9049 lt!217489))))

(assert (=> d!76231 (= (contains!2571 lt!217489 (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))) lt!217545)))

(declare-fun b!477536 () Bool)

(declare-fun e!280597 () Bool)

(assert (=> b!477536 (= e!280596 e!280597)))

(declare-fun res!285006 () Bool)

(assert (=> b!477536 (=> res!285006 e!280597)))

(assert (=> b!477536 (= res!285006 (= (h!9905 lt!217489) (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))))))

(declare-fun b!477537 () Bool)

(assert (=> b!477537 (= e!280597 (contains!2571 (t!15117 lt!217489) (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))))))

(assert (= (and d!76231 res!285007) b!477536))

(assert (= (and b!477536 (not res!285006)) b!477537))

(declare-fun m!459921 () Bool)

(assert (=> d!76231 m!459921))

(declare-fun m!459923 () Bool)

(assert (=> d!76231 m!459923))

(declare-fun m!459925 () Bool)

(assert (=> b!477537 m!459925))

(assert (=> b!477216 d!76231))

(declare-fun d!76233 () Bool)

(assert (=> d!76233 (= ($colon$colon!111 e!280400 (ite c!57447 (h!9905 (toList!3968 lt!217344)) (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342)))) (Cons!9049 (ite c!57447 (h!9905 (toList!3968 lt!217344)) (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))) e!280400))))

(assert (=> bm!30751 d!76233))

(declare-fun b!477539 () Bool)

(declare-fun e!280598 () Option!393)

(declare-fun e!280599 () Option!393)

(assert (=> b!477539 (= e!280598 e!280599)))

(declare-fun c!57520 () Bool)

(assert (=> b!477539 (= c!57520 (and (is-Cons!9049 (t!15117 lt!217400)) (not (= (_1!4507 (h!9905 (t!15117 lt!217400))) (_1!4507 lt!217342)))))))

(declare-fun b!477538 () Bool)

(assert (=> b!477538 (= e!280598 (Some!392 (_2!4507 (h!9905 (t!15117 lt!217400)))))))

(declare-fun b!477540 () Bool)

(assert (=> b!477540 (= e!280599 (getValueByKey!387 (t!15117 (t!15117 lt!217400)) (_1!4507 lt!217342)))))

(declare-fun b!477541 () Bool)

(assert (=> b!477541 (= e!280599 None!391)))

(declare-fun d!76235 () Bool)

(declare-fun c!57519 () Bool)

(assert (=> d!76235 (= c!57519 (and (is-Cons!9049 (t!15117 lt!217400)) (= (_1!4507 (h!9905 (t!15117 lt!217400))) (_1!4507 lt!217342))))))

(assert (=> d!76235 (= (getValueByKey!387 (t!15117 lt!217400) (_1!4507 lt!217342)) e!280598)))

(assert (= (and d!76235 c!57519) b!477538))

(assert (= (and d!76235 (not c!57519)) b!477539))

(assert (= (and b!477539 c!57520) b!477540))

(assert (= (and b!477539 (not c!57520)) b!477541))

(declare-fun m!459927 () Bool)

(assert (=> b!477540 m!459927))

(assert (=> b!477241 d!76235))

(declare-fun d!76237 () Bool)

(declare-fun res!285008 () Bool)

(declare-fun e!280600 () Bool)

(assert (=> d!76237 (=> res!285008 e!280600)))

(assert (=> d!76237 (= res!285008 (is-Nil!9050 (t!15117 (t!15117 (toList!3968 (+!1765 lm!215 lt!217342))))))))

(assert (=> d!76237 (= (forall!197 (t!15117 (t!15117 (toList!3968 (+!1765 lm!215 lt!217342)))) p!166) e!280600)))

(declare-fun b!477542 () Bool)

(declare-fun e!280601 () Bool)

(assert (=> b!477542 (= e!280600 e!280601)))

(declare-fun res!285009 () Bool)

(assert (=> b!477542 (=> (not res!285009) (not e!280601))))

(assert (=> b!477542 (= res!285009 (dynLambda!944 p!166 (h!9905 (t!15117 (t!15117 (toList!3968 (+!1765 lm!215 lt!217342)))))))))

(declare-fun b!477543 () Bool)

(assert (=> b!477543 (= e!280601 (forall!197 (t!15117 (t!15117 (t!15117 (toList!3968 (+!1765 lm!215 lt!217342))))) p!166))))

(assert (= (and d!76237 (not res!285008)) b!477542))

(assert (= (and b!477542 res!285009) b!477543))

(declare-fun b_lambda!10669 () Bool)

(assert (=> (not b_lambda!10669) (not b!477542)))

(declare-fun t!15199 () Bool)

(declare-fun tb!4099 () Bool)

(assert (=> (and start!42864 (= p!166 p!166) t!15199) tb!4099))

(declare-fun result!7667 () Bool)

(assert (=> tb!4099 (= result!7667 true)))

(assert (=> b!477542 t!15199))

(declare-fun b_and!20801 () Bool)

(assert (= b_and!20799 (and (=> t!15199 result!7667) b_and!20801)))

(declare-fun m!459929 () Bool)

(assert (=> b!477542 m!459929))

(declare-fun m!459931 () Bool)

(assert (=> b!477543 m!459931))

(assert (=> b!477037 d!76237))

(declare-fun d!76239 () Bool)

(declare-fun c!57521 () Bool)

(assert (=> d!76239 (= c!57521 (is-Nil!9050 (toList!3968 lt!217397)))))

(declare-fun e!280602 () (Set tuple2!8992))

(assert (=> d!76239 (= (content!207 (toList!3968 lt!217397)) e!280602)))

(declare-fun b!477544 () Bool)

(assert (=> b!477544 (= e!280602 (as set.empty (Set tuple2!8992)))))

(declare-fun b!477545 () Bool)

(assert (=> b!477545 (= e!280602 (set.union (set.insert (h!9905 (toList!3968 lt!217397)) (as set.empty (Set tuple2!8992))) (content!207 (t!15117 (toList!3968 lt!217397)))))))

(assert (= (and d!76239 c!57521) b!477544))

(assert (= (and d!76239 (not c!57521)) b!477545))

(declare-fun m!459933 () Bool)

(assert (=> b!477545 m!459933))

(declare-fun m!459935 () Bool)

(assert (=> b!477545 m!459935))

(assert (=> d!76057 d!76239))

(declare-fun d!76241 () Bool)

(declare-fun res!285010 () Bool)

(declare-fun e!280603 () Bool)

(assert (=> d!76241 (=> res!285010 e!280603)))

(assert (=> d!76241 (= res!285010 (is-Nil!9050 (t!15117 (toList!3968 (+!1765 lt!217344 (tuple2!8993 a!501 b!85))))))))

(assert (=> d!76241 (= (forall!197 (t!15117 (toList!3968 (+!1765 lt!217344 (tuple2!8993 a!501 b!85)))) p!166) e!280603)))

(declare-fun b!477546 () Bool)

(declare-fun e!280604 () Bool)

(assert (=> b!477546 (= e!280603 e!280604)))

(declare-fun res!285011 () Bool)

(assert (=> b!477546 (=> (not res!285011) (not e!280604))))

(assert (=> b!477546 (= res!285011 (dynLambda!944 p!166 (h!9905 (t!15117 (toList!3968 (+!1765 lt!217344 (tuple2!8993 a!501 b!85)))))))))

(declare-fun b!477547 () Bool)

(assert (=> b!477547 (= e!280604 (forall!197 (t!15117 (t!15117 (toList!3968 (+!1765 lt!217344 (tuple2!8993 a!501 b!85))))) p!166))))

(assert (= (and d!76241 (not res!285010)) b!477546))

(assert (= (and b!477546 res!285011) b!477547))

(declare-fun b_lambda!10671 () Bool)

(assert (=> (not b_lambda!10671) (not b!477546)))

(declare-fun t!15201 () Bool)

(declare-fun tb!4101 () Bool)

(assert (=> (and start!42864 (= p!166 p!166) t!15201) tb!4101))

(declare-fun result!7669 () Bool)

(assert (=> tb!4101 (= result!7669 true)))

(assert (=> b!477546 t!15201))

(declare-fun b_and!20803 () Bool)

(assert (= b_and!20801 (and (=> t!15201 result!7669) b_and!20803)))

(declare-fun m!459937 () Bool)

(assert (=> b!477546 m!459937))

(declare-fun m!459939 () Bool)

(assert (=> b!477547 m!459939))

(assert (=> b!477084 d!76241))

(declare-fun d!76243 () Bool)

(declare-fun res!285012 () Bool)

(declare-fun e!280605 () Bool)

(assert (=> d!76243 (=> res!285012 e!280605)))

(assert (=> d!76243 (= res!285012 (is-Nil!9050 (t!15117 (t!15117 (toList!3968 (+!1765 lt!217344 lt!217342))))))))

(assert (=> d!76243 (= (forall!197 (t!15117 (t!15117 (toList!3968 (+!1765 lt!217344 lt!217342)))) p!166) e!280605)))

(declare-fun b!477548 () Bool)

(declare-fun e!280606 () Bool)

(assert (=> b!477548 (= e!280605 e!280606)))

(declare-fun res!285013 () Bool)

(assert (=> b!477548 (=> (not res!285013) (not e!280606))))

(assert (=> b!477548 (= res!285013 (dynLambda!944 p!166 (h!9905 (t!15117 (t!15117 (toList!3968 (+!1765 lt!217344 lt!217342)))))))))

(declare-fun b!477549 () Bool)

(assert (=> b!477549 (= e!280606 (forall!197 (t!15117 (t!15117 (t!15117 (toList!3968 (+!1765 lt!217344 lt!217342))))) p!166))))

(assert (= (and d!76243 (not res!285012)) b!477548))

(assert (= (and b!477548 res!285013) b!477549))

(declare-fun b_lambda!10673 () Bool)

(assert (=> (not b_lambda!10673) (not b!477548)))

(declare-fun t!15203 () Bool)

(declare-fun tb!4103 () Bool)

(assert (=> (and start!42864 (= p!166 p!166) t!15203) tb!4103))

(declare-fun result!7671 () Bool)

(assert (=> tb!4103 (= result!7671 true)))

(assert (=> b!477548 t!15203))

(declare-fun b_and!20805 () Bool)

(assert (= b_and!20803 (and (=> t!15203 result!7671) b_and!20805)))

(declare-fun m!459941 () Bool)

(assert (=> b!477548 m!459941))

(declare-fun m!459943 () Bool)

(assert (=> b!477549 m!459943))

(assert (=> b!477235 d!76243))

(declare-fun d!76245 () Bool)

(assert (=> d!76245 (isDefined!298 (getValueByKey!387 (toList!3968 lt!217393) (_1!4507 lt!217342)))))

(declare-fun lt!217548 () Unit!14034)

(declare-fun choose!1368 (List!9053 (_ BitVec 64)) Unit!14034)

(assert (=> d!76245 (= lt!217548 (choose!1368 (toList!3968 lt!217393) (_1!4507 lt!217342)))))

(declare-fun e!280609 () Bool)

(assert (=> d!76245 e!280609))

(declare-fun res!285016 () Bool)

(assert (=> d!76245 (=> (not res!285016) (not e!280609))))

(assert (=> d!76245 (= res!285016 (isStrictlySorted!387 (toList!3968 lt!217393)))))

(assert (=> d!76245 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!297 (toList!3968 lt!217393) (_1!4507 lt!217342)) lt!217548)))

(declare-fun b!477552 () Bool)

(assert (=> b!477552 (= e!280609 (containsKey!349 (toList!3968 lt!217393) (_1!4507 lt!217342)))))

(assert (= (and d!76245 res!285016) b!477552))

(assert (=> d!76245 m!459291))

(assert (=> d!76245 m!459291))

(assert (=> d!76245 m!459484))

(declare-fun m!459945 () Bool)

(assert (=> d!76245 m!459945))

(declare-fun m!459947 () Bool)

(assert (=> d!76245 m!459947))

(assert (=> b!477552 m!459479))

(assert (=> b!477133 d!76245))

(declare-fun d!76247 () Bool)

(declare-fun isEmpty!608 (Option!393) Bool)

(assert (=> d!76247 (= (isDefined!298 (getValueByKey!387 (toList!3968 lt!217393) (_1!4507 lt!217342))) (not (isEmpty!608 (getValueByKey!387 (toList!3968 lt!217393) (_1!4507 lt!217342)))))))

(declare-fun bs!15176 () Bool)

(assert (= bs!15176 d!76247))

(assert (=> bs!15176 m!459291))

(declare-fun m!459949 () Bool)

(assert (=> bs!15176 m!459949))

(assert (=> b!477133 d!76247))

(assert (=> b!477133 d!75991))

(declare-fun d!76249 () Bool)

(declare-fun lt!217549 () Bool)

(assert (=> d!76249 (= lt!217549 (set.member (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342)) (content!207 lt!217396)))))

(declare-fun e!280610 () Bool)

(assert (=> d!76249 (= lt!217549 e!280610)))

(declare-fun res!285018 () Bool)

(assert (=> d!76249 (=> (not res!285018) (not e!280610))))

(assert (=> d!76249 (= res!285018 (is-Cons!9049 lt!217396))))

(assert (=> d!76249 (= (contains!2571 lt!217396 (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))) lt!217549)))

(declare-fun b!477553 () Bool)

(declare-fun e!280611 () Bool)

(assert (=> b!477553 (= e!280610 e!280611)))

(declare-fun res!285017 () Bool)

(assert (=> b!477553 (=> res!285017 e!280611)))

(assert (=> b!477553 (= res!285017 (= (h!9905 lt!217396) (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))))))

(declare-fun b!477554 () Bool)

(assert (=> b!477554 (= e!280611 (contains!2571 (t!15117 lt!217396) (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))))))

(assert (= (and d!76249 res!285018) b!477553))

(assert (= (and b!477553 (not res!285017)) b!477554))

(declare-fun m!459951 () Bool)

(assert (=> d!76249 m!459951))

(declare-fun m!459953 () Bool)

(assert (=> d!76249 m!459953))

(declare-fun m!459955 () Bool)

(assert (=> b!477554 m!459955))

(assert (=> b!477170 d!76249))

(assert (=> b!477135 d!76247))

(assert (=> b!477135 d!75991))

(declare-fun d!76251 () Bool)

(declare-fun res!285019 () Bool)

(declare-fun e!280612 () Bool)

(assert (=> d!76251 (=> res!285019 e!280612)))

(assert (=> d!76251 (= res!285019 (and (is-Cons!9049 lt!217396) (= (_1!4507 (h!9905 lt!217396)) (_1!4507 lt!217342))))))

(assert (=> d!76251 (= (containsKey!349 lt!217396 (_1!4507 lt!217342)) e!280612)))

(declare-fun b!477555 () Bool)

(declare-fun e!280613 () Bool)

(assert (=> b!477555 (= e!280612 e!280613)))

(declare-fun res!285020 () Bool)

(assert (=> b!477555 (=> (not res!285020) (not e!280613))))

(assert (=> b!477555 (= res!285020 (and (or (not (is-Cons!9049 lt!217396)) (bvsle (_1!4507 (h!9905 lt!217396)) (_1!4507 lt!217342))) (is-Cons!9049 lt!217396) (bvslt (_1!4507 (h!9905 lt!217396)) (_1!4507 lt!217342))))))

(declare-fun b!477556 () Bool)

(assert (=> b!477556 (= e!280613 (containsKey!349 (t!15117 lt!217396) (_1!4507 lt!217342)))))

(assert (= (and d!76251 (not res!285019)) b!477555))

(assert (= (and b!477555 res!285020) b!477556))

(declare-fun m!459957 () Bool)

(assert (=> b!477556 m!459957))

(assert (=> b!477169 d!76251))

(declare-fun b!477558 () Bool)

(declare-fun e!280614 () Option!393)

(declare-fun e!280615 () Option!393)

(assert (=> b!477558 (= e!280614 e!280615)))

(declare-fun c!57523 () Bool)

(assert (=> b!477558 (= c!57523 (and (is-Cons!9049 (t!15117 lt!217396)) (not (= (_1!4507 (h!9905 (t!15117 lt!217396))) (_1!4507 lt!217342)))))))

(declare-fun b!477557 () Bool)

(assert (=> b!477557 (= e!280614 (Some!392 (_2!4507 (h!9905 (t!15117 lt!217396)))))))

(declare-fun b!477559 () Bool)

(assert (=> b!477559 (= e!280615 (getValueByKey!387 (t!15117 (t!15117 lt!217396)) (_1!4507 lt!217342)))))

(declare-fun b!477560 () Bool)

(assert (=> b!477560 (= e!280615 None!391)))

(declare-fun d!76253 () Bool)

(declare-fun c!57522 () Bool)

(assert (=> d!76253 (= c!57522 (and (is-Cons!9049 (t!15117 lt!217396)) (= (_1!4507 (h!9905 (t!15117 lt!217396))) (_1!4507 lt!217342))))))

(assert (=> d!76253 (= (getValueByKey!387 (t!15117 lt!217396) (_1!4507 lt!217342)) e!280614)))

(assert (= (and d!76253 c!57522) b!477557))

(assert (= (and d!76253 (not c!57522)) b!477558))

(assert (= (and b!477558 c!57523) b!477559))

(assert (= (and b!477558 (not c!57523)) b!477560))

(declare-fun m!459959 () Bool)

(assert (=> b!477559 m!459959))

(assert (=> b!477144 d!76253))

(declare-fun b!477562 () Bool)

(declare-fun e!280616 () Option!393)

(declare-fun e!280617 () Option!393)

(assert (=> b!477562 (= e!280616 e!280617)))

(declare-fun c!57525 () Bool)

(assert (=> b!477562 (= c!57525 (and (is-Cons!9049 (toList!3968 lt!217445)) (not (= (_1!4507 (h!9905 (toList!3968 lt!217445))) (_1!4507 (tuple2!8993 a!501 b!85))))))))

(declare-fun b!477561 () Bool)

(assert (=> b!477561 (= e!280616 (Some!392 (_2!4507 (h!9905 (toList!3968 lt!217445)))))))

(declare-fun b!477563 () Bool)

(assert (=> b!477563 (= e!280617 (getValueByKey!387 (t!15117 (toList!3968 lt!217445)) (_1!4507 (tuple2!8993 a!501 b!85))))))

(declare-fun b!477564 () Bool)

(assert (=> b!477564 (= e!280617 None!391)))

(declare-fun c!57524 () Bool)

(declare-fun d!76255 () Bool)

(assert (=> d!76255 (= c!57524 (and (is-Cons!9049 (toList!3968 lt!217445)) (= (_1!4507 (h!9905 (toList!3968 lt!217445))) (_1!4507 (tuple2!8993 a!501 b!85)))))))

(assert (=> d!76255 (= (getValueByKey!387 (toList!3968 lt!217445) (_1!4507 (tuple2!8993 a!501 b!85))) e!280616)))

(assert (= (and d!76255 c!57524) b!477561))

(assert (= (and d!76255 (not c!57524)) b!477562))

(assert (= (and b!477562 c!57525) b!477563))

(assert (= (and b!477562 (not c!57525)) b!477564))

(declare-fun m!459961 () Bool)

(assert (=> b!477563 m!459961))

(assert (=> b!477085 d!76255))

(assert (=> d!76065 d!76063))

(declare-fun d!76257 () Bool)

(assert (=> d!76257 (= (getValueByKey!387 lt!217400 (_1!4507 lt!217342)) (Some!392 (_2!4507 lt!217342)))))

(assert (=> d!76257 true))

(declare-fun _$22!552 () Unit!14034)

(assert (=> d!76257 (= (choose!1365 lt!217400 (_1!4507 lt!217342) (_2!4507 lt!217342)) _$22!552)))

(declare-fun bs!15177 () Bool)

(assert (= bs!15177 d!76257))

(assert (=> bs!15177 m!459299))

(assert (=> d!76065 d!76257))

(declare-fun d!76259 () Bool)

(declare-fun res!285021 () Bool)

(declare-fun e!280618 () Bool)

(assert (=> d!76259 (=> res!285021 e!280618)))

(assert (=> d!76259 (= res!285021 (or (is-Nil!9050 lt!217400) (is-Nil!9050 (t!15117 lt!217400))))))

(assert (=> d!76259 (= (isStrictlySorted!387 lt!217400) e!280618)))

(declare-fun b!477565 () Bool)

(declare-fun e!280619 () Bool)

(assert (=> b!477565 (= e!280618 e!280619)))

(declare-fun res!285022 () Bool)

(assert (=> b!477565 (=> (not res!285022) (not e!280619))))

(assert (=> b!477565 (= res!285022 (bvslt (_1!4507 (h!9905 lt!217400)) (_1!4507 (h!9905 (t!15117 lt!217400)))))))

(declare-fun b!477566 () Bool)

(assert (=> b!477566 (= e!280619 (isStrictlySorted!387 (t!15117 lt!217400)))))

(assert (= (and d!76259 (not res!285021)) b!477565))

(assert (= (and b!477565 res!285022) b!477566))

(declare-fun m!459963 () Bool)

(assert (=> b!477566 m!459963))

(assert (=> d!76065 d!76259))

(declare-fun d!76261 () Bool)

(declare-fun lt!217550 () Bool)

(assert (=> d!76261 (= lt!217550 (set.member (tuple2!8993 a!501 b!85) (content!207 (toList!3968 lt!217445))))))

(declare-fun e!280620 () Bool)

(assert (=> d!76261 (= lt!217550 e!280620)))

(declare-fun res!285024 () Bool)

(assert (=> d!76261 (=> (not res!285024) (not e!280620))))

(assert (=> d!76261 (= res!285024 (is-Cons!9049 (toList!3968 lt!217445)))))

(assert (=> d!76261 (= (contains!2571 (toList!3968 lt!217445) (tuple2!8993 a!501 b!85)) lt!217550)))

(declare-fun b!477567 () Bool)

(declare-fun e!280621 () Bool)

(assert (=> b!477567 (= e!280620 e!280621)))

(declare-fun res!285023 () Bool)

(assert (=> b!477567 (=> res!285023 e!280621)))

(assert (=> b!477567 (= res!285023 (= (h!9905 (toList!3968 lt!217445)) (tuple2!8993 a!501 b!85)))))

(declare-fun b!477568 () Bool)

(assert (=> b!477568 (= e!280621 (contains!2571 (t!15117 (toList!3968 lt!217445)) (tuple2!8993 a!501 b!85)))))

(assert (= (and d!76261 res!285024) b!477567))

(assert (= (and b!477567 (not res!285023)) b!477568))

(declare-fun m!459965 () Bool)

(assert (=> d!76261 m!459965))

(declare-fun m!459967 () Bool)

(assert (=> d!76261 m!459967))

(declare-fun m!459969 () Bool)

(assert (=> b!477568 m!459969))

(assert (=> b!477086 d!76261))

(declare-fun d!76263 () Bool)

(declare-fun res!285025 () Bool)

(declare-fun e!280622 () Bool)

(assert (=> d!76263 (=> res!285025 e!280622)))

(assert (=> d!76263 (= res!285025 (is-Nil!9050 (t!15117 (t!15117 (toList!3968 lm!215)))))))

(assert (=> d!76263 (= (forall!197 (t!15117 (t!15117 (toList!3968 lm!215))) p!166) e!280622)))

(declare-fun b!477569 () Bool)

(declare-fun e!280623 () Bool)

(assert (=> b!477569 (= e!280622 e!280623)))

(declare-fun res!285026 () Bool)

(assert (=> b!477569 (=> (not res!285026) (not e!280623))))

(assert (=> b!477569 (= res!285026 (dynLambda!944 p!166 (h!9905 (t!15117 (t!15117 (toList!3968 lm!215))))))))

(declare-fun b!477570 () Bool)

(assert (=> b!477570 (= e!280623 (forall!197 (t!15117 (t!15117 (t!15117 (toList!3968 lm!215)))) p!166))))

(assert (= (and d!76263 (not res!285025)) b!477569))

(assert (= (and b!477569 res!285026) b!477570))

(declare-fun b_lambda!10675 () Bool)

(assert (=> (not b_lambda!10675) (not b!477569)))

(declare-fun t!15205 () Bool)

(declare-fun tb!4105 () Bool)

(assert (=> (and start!42864 (= p!166 p!166) t!15205) tb!4105))

(declare-fun result!7673 () Bool)

(assert (=> tb!4105 (= result!7673 true)))

(assert (=> b!477569 t!15205))

(declare-fun b_and!20807 () Bool)

(assert (= b_and!20805 (and (=> t!15205 result!7673) b_and!20807)))

(declare-fun m!459971 () Bool)

(assert (=> b!477569 m!459971))

(declare-fun m!459973 () Bool)

(assert (=> b!477570 m!459973))

(assert (=> b!477060 d!76263))

(declare-fun d!76265 () Bool)

(assert (=> d!76265 (isDefined!298 (getValueByKey!387 (toList!3968 lt!217397) (_1!4507 lt!217342)))))

(declare-fun lt!217551 () Unit!14034)

(assert (=> d!76265 (= lt!217551 (choose!1368 (toList!3968 lt!217397) (_1!4507 lt!217342)))))

(declare-fun e!280624 () Bool)

(assert (=> d!76265 e!280624))

(declare-fun res!285027 () Bool)

(assert (=> d!76265 (=> (not res!285027) (not e!280624))))

(assert (=> d!76265 (= res!285027 (isStrictlySorted!387 (toList!3968 lt!217397)))))

(assert (=> d!76265 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!297 (toList!3968 lt!217397) (_1!4507 lt!217342)) lt!217551)))

(declare-fun b!477571 () Bool)

(assert (=> b!477571 (= e!280624 (containsKey!349 (toList!3968 lt!217397) (_1!4507 lt!217342)))))

(assert (= (and d!76265 res!285027) b!477571))

(assert (=> d!76265 m!459309))

(assert (=> d!76265 m!459309))

(assert (=> d!76265 m!459567))

(declare-fun m!459975 () Bool)

(assert (=> d!76265 m!459975))

(declare-fun m!459977 () Bool)

(assert (=> d!76265 m!459977))

(assert (=> b!477571 m!459563))

(assert (=> b!477236 d!76265))

(declare-fun d!76267 () Bool)

(assert (=> d!76267 (= (isDefined!298 (getValueByKey!387 (toList!3968 lt!217397) (_1!4507 lt!217342))) (not (isEmpty!608 (getValueByKey!387 (toList!3968 lt!217397) (_1!4507 lt!217342)))))))

(declare-fun bs!15178 () Bool)

(assert (= bs!15178 d!76267))

(assert (=> bs!15178 m!459309))

(declare-fun m!459979 () Bool)

(assert (=> bs!15178 m!459979))

(assert (=> b!477236 d!76267))

(assert (=> b!477236 d!76009))

(assert (=> b!477238 d!76267))

(assert (=> b!477238 d!76009))

(declare-fun d!76269 () Bool)

(declare-fun res!285028 () Bool)

(declare-fun e!280625 () Bool)

(assert (=> d!76269 (=> res!285028 e!280625)))

(assert (=> d!76269 (= res!285028 (and (is-Cons!9049 (toList!3968 lt!217393)) (= (_1!4507 (h!9905 (toList!3968 lt!217393))) (_1!4507 lt!217342))))))

(assert (=> d!76269 (= (containsKey!349 (toList!3968 lt!217393) (_1!4507 lt!217342)) e!280625)))

(declare-fun b!477572 () Bool)

(declare-fun e!280626 () Bool)

(assert (=> b!477572 (= e!280625 e!280626)))

(declare-fun res!285029 () Bool)

(assert (=> b!477572 (=> (not res!285029) (not e!280626))))

(assert (=> b!477572 (= res!285029 (and (or (not (is-Cons!9049 (toList!3968 lt!217393))) (bvsle (_1!4507 (h!9905 (toList!3968 lt!217393))) (_1!4507 lt!217342))) (is-Cons!9049 (toList!3968 lt!217393)) (bvslt (_1!4507 (h!9905 (toList!3968 lt!217393))) (_1!4507 lt!217342))))))

(declare-fun b!477573 () Bool)

(assert (=> b!477573 (= e!280626 (containsKey!349 (t!15117 (toList!3968 lt!217393)) (_1!4507 lt!217342)))))

(assert (= (and d!76269 (not res!285028)) b!477572))

(assert (= (and b!477572 res!285029) b!477573))

(declare-fun m!459981 () Bool)

(assert (=> b!477573 m!459981))

(assert (=> d!76017 d!76269))

(declare-fun d!76271 () Bool)

(declare-fun res!285030 () Bool)

(declare-fun e!280627 () Bool)

(assert (=> d!76271 (=> res!285030 e!280627)))

(assert (=> d!76271 (= res!285030 (and (is-Cons!9049 lt!217489) (= (_1!4507 (h!9905 lt!217489)) (_1!4507 lt!217342))))))

(assert (=> d!76271 (= (containsKey!349 lt!217489 (_1!4507 lt!217342)) e!280627)))

(declare-fun b!477574 () Bool)

(declare-fun e!280628 () Bool)

(assert (=> b!477574 (= e!280627 e!280628)))

(declare-fun res!285031 () Bool)

(assert (=> b!477574 (=> (not res!285031) (not e!280628))))

(assert (=> b!477574 (= res!285031 (and (or (not (is-Cons!9049 lt!217489)) (bvsle (_1!4507 (h!9905 lt!217489)) (_1!4507 lt!217342))) (is-Cons!9049 lt!217489) (bvslt (_1!4507 (h!9905 lt!217489)) (_1!4507 lt!217342))))))

(declare-fun b!477575 () Bool)

(assert (=> b!477575 (= e!280628 (containsKey!349 (t!15117 lt!217489) (_1!4507 lt!217342)))))

(assert (= (and d!76271 (not res!285030)) b!477574))

(assert (= (and b!477574 res!285031) b!477575))

(declare-fun m!459983 () Bool)

(assert (=> b!477575 m!459983))

(assert (=> b!477222 d!76271))

(declare-fun d!76273 () Bool)

(assert (=> d!76273 (= ($colon$colon!111 e!280380 (ite c!57438 (h!9905 (toList!3968 lm!215)) (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342)))) (Cons!9049 (ite c!57438 (h!9905 (toList!3968 lm!215)) (tuple2!8993 (_1!4507 lt!217342) (_2!4507 lt!217342))) e!280380))))

(assert (=> bm!30748 d!76273))

(declare-fun d!76275 () Bool)

(declare-fun lt!217552 () Bool)

(assert (=> d!76275 (= lt!217552 (set.member lt!217342 (content!207 (t!15117 (toList!3968 lt!217397)))))))

(declare-fun e!280629 () Bool)

(assert (=> d!76275 (= lt!217552 e!280629)))

(declare-fun res!285033 () Bool)

(assert (=> d!76275 (=> (not res!285033) (not e!280629))))

(assert (=> d!76275 (= res!285033 (is-Cons!9049 (t!15117 (toList!3968 lt!217397))))))

(assert (=> d!76275 (= (contains!2571 (t!15117 (toList!3968 lt!217397)) lt!217342) lt!217552)))

(declare-fun b!477576 () Bool)

(declare-fun e!280630 () Bool)

(assert (=> b!477576 (= e!280629 e!280630)))

(declare-fun res!285032 () Bool)

(assert (=> b!477576 (=> res!285032 e!280630)))

(assert (=> b!477576 (= res!285032 (= (h!9905 (t!15117 (toList!3968 lt!217397))) lt!217342))))

(declare-fun b!477577 () Bool)

(assert (=> b!477577 (= e!280630 (contains!2571 (t!15117 (t!15117 (toList!3968 lt!217397))) lt!217342))))

(assert (= (and d!76275 res!285033) b!477576))

(assert (= (and b!477576 (not res!285032)) b!477577))

(assert (=> d!76275 m!459935))

(declare-fun m!459985 () Bool)

(assert (=> d!76275 m!459985))

(declare-fun m!459987 () Bool)

(assert (=> b!477577 m!459987))

(assert (=> b!477233 d!76275))

(assert (=> d!76015 d!76011))

(assert (=> d!76015 d!76013))

(declare-fun b!477579 () Bool)

(declare-fun e!280631 () Option!393)

(declare-fun e!280632 () Option!393)

(assert (=> b!477579 (= e!280631 e!280632)))

(declare-fun c!57527 () Bool)

(assert (=> b!477579 (= c!57527 (and (is-Cons!9049 (t!15117 (toList!3968 lt!217393))) (not (= (_1!4507 (h!9905 (t!15117 (toList!3968 lt!217393)))) (_1!4507 lt!217342)))))))

