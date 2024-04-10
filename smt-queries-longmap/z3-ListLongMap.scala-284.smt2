; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4646 () Bool)

(assert start!4646)

(declare-fun b_free!1293 () Bool)

(declare-fun b_next!1293 () Bool)

(assert (=> start!4646 (= b_free!1293 (not b_next!1293))))

(declare-fun tp!5329 () Bool)

(declare-fun b_and!2127 () Bool)

(assert (=> start!4646 (= tp!5329 b_and!2127)))

(declare-fun b!36311 () Bool)

(declare-fun res!21978 () Bool)

(declare-fun e!22926 () Bool)

(assert (=> b!36311 (=> (not res!21978) (not e!22926))))

(declare-datatypes ((B!700 0))(
  ( (B!701 (val!850 Int)) )
))
(declare-datatypes ((tuple2!1360 0))(
  ( (tuple2!1361 (_1!691 (_ BitVec 64)) (_2!691 B!700)) )
))
(declare-datatypes ((List!954 0))(
  ( (Nil!951) (Cons!950 (h!1518 tuple2!1360) (t!3667 List!954)) )
))
(declare-datatypes ((ListLongMap!937 0))(
  ( (ListLongMap!938 (toList!484 List!954)) )
))
(declare-fun lm!252 () ListLongMap!937)

(declare-fun isEmpty!177 (ListLongMap!937) Bool)

(assert (=> b!36311 (= res!21978 (not (isEmpty!177 lm!252)))))

(declare-fun b!36310 () Bool)

(declare-fun res!21977 () Bool)

(assert (=> b!36310 (=> (not res!21977) (not e!22926))))

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!435 (ListLongMap!937 (_ BitVec 64)) Bool)

(assert (=> b!36310 (= res!21977 (contains!435 lm!252 k0!388))))

(declare-fun b!36312 () Bool)

(assert (=> b!36312 (= e!22926 (= (toList!484 lm!252) Nil!951))))

(declare-fun res!21976 () Bool)

(assert (=> start!4646 (=> (not res!21976) (not e!22926))))

(declare-fun p!304 () Int)

(declare-fun forall!150 (List!954 Int) Bool)

(assert (=> start!4646 (= res!21976 (forall!150 (toList!484 lm!252) p!304))))

(assert (=> start!4646 e!22926))

(declare-fun e!22927 () Bool)

(declare-fun inv!1575 (ListLongMap!937) Bool)

(assert (=> start!4646 (and (inv!1575 lm!252) e!22927)))

(assert (=> start!4646 tp!5329))

(assert (=> start!4646 true))

(declare-fun b!36313 () Bool)

(declare-fun tp!5330 () Bool)

(assert (=> b!36313 (= e!22927 tp!5330)))

(assert (= (and start!4646 res!21976) b!36310))

(assert (= (and b!36310 res!21977) b!36311))

(assert (= (and b!36311 res!21978) b!36312))

(assert (= start!4646 b!36313))

(declare-fun m!29273 () Bool)

(assert (=> b!36311 m!29273))

(declare-fun m!29275 () Bool)

(assert (=> b!36310 m!29275))

(declare-fun m!29277 () Bool)

(assert (=> start!4646 m!29277))

(declare-fun m!29279 () Bool)

(assert (=> start!4646 m!29279))

(check-sat (not b_next!1293) (not b!36313) (not start!4646) (not b!36310) (not b!36311) b_and!2127)
(check-sat b_and!2127 (not b_next!1293))
(get-model)

(declare-fun d!5457 () Bool)

(declare-fun isEmpty!179 (List!954) Bool)

(assert (=> d!5457 (= (isEmpty!177 lm!252) (isEmpty!179 (toList!484 lm!252)))))

(declare-fun bs!1379 () Bool)

(assert (= bs!1379 d!5457))

(declare-fun m!29289 () Bool)

(assert (=> bs!1379 m!29289))

(assert (=> b!36311 d!5457))

(declare-fun d!5459 () Bool)

(declare-fun e!22948 () Bool)

(assert (=> d!5459 e!22948))

(declare-fun res!21996 () Bool)

(assert (=> d!5459 (=> res!21996 e!22948)))

(declare-fun lt!13465 () Bool)

(assert (=> d!5459 (= res!21996 (not lt!13465))))

(declare-fun lt!13466 () Bool)

(assert (=> d!5459 (= lt!13465 lt!13466)))

(declare-datatypes ((Unit!800 0))(
  ( (Unit!801) )
))
(declare-fun lt!13464 () Unit!800)

(declare-fun e!22949 () Unit!800)

(assert (=> d!5459 (= lt!13464 e!22949)))

(declare-fun c!4162 () Bool)

(assert (=> d!5459 (= c!4162 lt!13466)))

(declare-fun containsKey!39 (List!954 (_ BitVec 64)) Bool)

(assert (=> d!5459 (= lt!13466 (containsKey!39 (toList!484 lm!252) k0!388))))

(assert (=> d!5459 (= (contains!435 lm!252 k0!388) lt!13465)))

(declare-fun b!36342 () Bool)

(declare-fun lt!13463 () Unit!800)

(assert (=> b!36342 (= e!22949 lt!13463)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!36 (List!954 (_ BitVec 64)) Unit!800)

(assert (=> b!36342 (= lt!13463 (lemmaContainsKeyImpliesGetValueByKeyDefined!36 (toList!484 lm!252) k0!388))))

(declare-datatypes ((Option!81 0))(
  ( (Some!80 (v!1949 B!700)) (None!79) )
))
(declare-fun isDefined!37 (Option!81) Bool)

(declare-fun getValueByKey!75 (List!954 (_ BitVec 64)) Option!81)

(assert (=> b!36342 (isDefined!37 (getValueByKey!75 (toList!484 lm!252) k0!388))))

(declare-fun b!36343 () Bool)

(declare-fun Unit!802 () Unit!800)

(assert (=> b!36343 (= e!22949 Unit!802)))

(declare-fun b!36344 () Bool)

(assert (=> b!36344 (= e!22948 (isDefined!37 (getValueByKey!75 (toList!484 lm!252) k0!388)))))

(assert (= (and d!5459 c!4162) b!36342))

(assert (= (and d!5459 (not c!4162)) b!36343))

(assert (= (and d!5459 (not res!21996)) b!36344))

(declare-fun m!29299 () Bool)

(assert (=> d!5459 m!29299))

(declare-fun m!29301 () Bool)

(assert (=> b!36342 m!29301))

(declare-fun m!29303 () Bool)

(assert (=> b!36342 m!29303))

(assert (=> b!36342 m!29303))

(declare-fun m!29305 () Bool)

(assert (=> b!36342 m!29305))

(assert (=> b!36344 m!29303))

(assert (=> b!36344 m!29303))

(assert (=> b!36344 m!29305))

(assert (=> b!36310 d!5459))

(declare-fun d!5467 () Bool)

(declare-fun res!22004 () Bool)

(declare-fun e!22956 () Bool)

(assert (=> d!5467 (=> res!22004 e!22956)))

(get-info :version)

(assert (=> d!5467 (= res!22004 ((_ is Nil!951) (toList!484 lm!252)))))

(assert (=> d!5467 (= (forall!150 (toList!484 lm!252) p!304) e!22956)))

(declare-fun b!36354 () Bool)

(declare-fun e!22957 () Bool)

(assert (=> b!36354 (= e!22956 e!22957)))

(declare-fun res!22005 () Bool)

(assert (=> b!36354 (=> (not res!22005) (not e!22957))))

(declare-fun dynLambda!161 (Int tuple2!1360) Bool)

(assert (=> b!36354 (= res!22005 (dynLambda!161 p!304 (h!1518 (toList!484 lm!252))))))

(declare-fun b!36355 () Bool)

(assert (=> b!36355 (= e!22957 (forall!150 (t!3667 (toList!484 lm!252)) p!304))))

(assert (= (and d!5467 (not res!22004)) b!36354))

(assert (= (and b!36354 res!22005) b!36355))

(declare-fun b_lambda!1745 () Bool)

(assert (=> (not b_lambda!1745) (not b!36354)))

(declare-fun t!3672 () Bool)

(declare-fun tb!703 () Bool)

(assert (=> (and start!4646 (= p!304 p!304) t!3672) tb!703))

(declare-fun result!1215 () Bool)

(assert (=> tb!703 (= result!1215 true)))

(assert (=> b!36354 t!3672))

(declare-fun b_and!2133 () Bool)

(assert (= b_and!2127 (and (=> t!3672 result!1215) b_and!2133)))

(declare-fun m!29313 () Bool)

(assert (=> b!36354 m!29313))

(declare-fun m!29315 () Bool)

(assert (=> b!36355 m!29315))

(assert (=> start!4646 d!5467))

(declare-fun d!5469 () Bool)

(declare-fun isStrictlySorted!173 (List!954) Bool)

(assert (=> d!5469 (= (inv!1575 lm!252) (isStrictlySorted!173 (toList!484 lm!252)))))

(declare-fun bs!1382 () Bool)

(assert (= bs!1382 d!5469))

(declare-fun m!29319 () Bool)

(assert (=> bs!1382 m!29319))

(assert (=> start!4646 d!5469))

(declare-fun b!36364 () Bool)

(declare-fun e!22964 () Bool)

(declare-fun tp_is_empty!1645 () Bool)

(declare-fun tp!5339 () Bool)

(assert (=> b!36364 (= e!22964 (and tp_is_empty!1645 tp!5339))))

(assert (=> b!36313 (= tp!5330 e!22964)))

(assert (= (and b!36313 ((_ is Cons!950) (toList!484 lm!252))) b!36364))

(declare-fun b_lambda!1747 () Bool)

(assert (= b_lambda!1745 (or (and start!4646 b_free!1293) b_lambda!1747)))

(check-sat (not b_next!1293) (not d!5459) (not d!5457) (not b!36355) (not b!36344) (not b!36364) (not b!36342) tp_is_empty!1645 (not b_lambda!1747) b_and!2133 (not d!5469))
(check-sat b_and!2133 (not b_next!1293))
(get-model)

(declare-fun d!5477 () Bool)

(declare-fun res!22015 () Bool)

(declare-fun e!22979 () Bool)

(assert (=> d!5477 (=> res!22015 e!22979)))

(assert (=> d!5477 (= res!22015 ((_ is Nil!951) (t!3667 (toList!484 lm!252))))))

(assert (=> d!5477 (= (forall!150 (t!3667 (toList!484 lm!252)) p!304) e!22979)))

(declare-fun b!36386 () Bool)

(declare-fun e!22980 () Bool)

(assert (=> b!36386 (= e!22979 e!22980)))

(declare-fun res!22016 () Bool)

(assert (=> b!36386 (=> (not res!22016) (not e!22980))))

(assert (=> b!36386 (= res!22016 (dynLambda!161 p!304 (h!1518 (t!3667 (toList!484 lm!252)))))))

(declare-fun b!36387 () Bool)

(assert (=> b!36387 (= e!22980 (forall!150 (t!3667 (t!3667 (toList!484 lm!252))) p!304))))

(assert (= (and d!5477 (not res!22015)) b!36386))

(assert (= (and b!36386 res!22016) b!36387))

(declare-fun b_lambda!1755 () Bool)

(assert (=> (not b_lambda!1755) (not b!36386)))

(declare-fun t!3676 () Bool)

(declare-fun tb!707 () Bool)

(assert (=> (and start!4646 (= p!304 p!304) t!3676) tb!707))

(declare-fun result!1225 () Bool)

(assert (=> tb!707 (= result!1225 true)))

(assert (=> b!36386 t!3676))

(declare-fun b_and!2137 () Bool)

(assert (= b_and!2133 (and (=> t!3676 result!1225) b_and!2137)))

(declare-fun m!29337 () Bool)

(assert (=> b!36386 m!29337))

(declare-fun m!29339 () Bool)

(assert (=> b!36387 m!29339))

(assert (=> b!36355 d!5477))

(declare-fun d!5479 () Bool)

(declare-fun res!22021 () Bool)

(declare-fun e!22985 () Bool)

(assert (=> d!5479 (=> res!22021 e!22985)))

(assert (=> d!5479 (= res!22021 (and ((_ is Cons!950) (toList!484 lm!252)) (= (_1!691 (h!1518 (toList!484 lm!252))) k0!388)))))

(assert (=> d!5479 (= (containsKey!39 (toList!484 lm!252) k0!388) e!22985)))

(declare-fun b!36392 () Bool)

(declare-fun e!22986 () Bool)

(assert (=> b!36392 (= e!22985 e!22986)))

(declare-fun res!22022 () Bool)

(assert (=> b!36392 (=> (not res!22022) (not e!22986))))

(assert (=> b!36392 (= res!22022 (and (or (not ((_ is Cons!950) (toList!484 lm!252))) (bvsle (_1!691 (h!1518 (toList!484 lm!252))) k0!388)) ((_ is Cons!950) (toList!484 lm!252)) (bvslt (_1!691 (h!1518 (toList!484 lm!252))) k0!388)))))

(declare-fun b!36393 () Bool)

(assert (=> b!36393 (= e!22986 (containsKey!39 (t!3667 (toList!484 lm!252)) k0!388))))

(assert (= (and d!5479 (not res!22021)) b!36392))

(assert (= (and b!36392 res!22022) b!36393))

(declare-fun m!29341 () Bool)

(assert (=> b!36393 m!29341))

(assert (=> d!5459 d!5479))

(declare-fun d!5481 () Bool)

(assert (=> d!5481 (isDefined!37 (getValueByKey!75 (toList!484 lm!252) k0!388))))

(declare-fun lt!13485 () Unit!800)

(declare-fun choose!224 (List!954 (_ BitVec 64)) Unit!800)

(assert (=> d!5481 (= lt!13485 (choose!224 (toList!484 lm!252) k0!388))))

(declare-fun e!22989 () Bool)

(assert (=> d!5481 e!22989))

(declare-fun res!22025 () Bool)

(assert (=> d!5481 (=> (not res!22025) (not e!22989))))

(assert (=> d!5481 (= res!22025 (isStrictlySorted!173 (toList!484 lm!252)))))

(assert (=> d!5481 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!36 (toList!484 lm!252) k0!388) lt!13485)))

(declare-fun b!36396 () Bool)

(assert (=> b!36396 (= e!22989 (containsKey!39 (toList!484 lm!252) k0!388))))

(assert (= (and d!5481 res!22025) b!36396))

(assert (=> d!5481 m!29303))

(assert (=> d!5481 m!29303))

(assert (=> d!5481 m!29305))

(declare-fun m!29343 () Bool)

(assert (=> d!5481 m!29343))

(assert (=> d!5481 m!29319))

(assert (=> b!36396 m!29299))

(assert (=> b!36342 d!5481))

(declare-fun d!5485 () Bool)

(declare-fun isEmpty!182 (Option!81) Bool)

(assert (=> d!5485 (= (isDefined!37 (getValueByKey!75 (toList!484 lm!252) k0!388)) (not (isEmpty!182 (getValueByKey!75 (toList!484 lm!252) k0!388))))))

(declare-fun bs!1385 () Bool)

(assert (= bs!1385 d!5485))

(assert (=> bs!1385 m!29303))

(declare-fun m!29345 () Bool)

(assert (=> bs!1385 m!29345))

(assert (=> b!36342 d!5485))

(declare-fun d!5487 () Bool)

(declare-fun c!4171 () Bool)

(assert (=> d!5487 (= c!4171 (and ((_ is Cons!950) (toList!484 lm!252)) (= (_1!691 (h!1518 (toList!484 lm!252))) k0!388)))))

(declare-fun e!23004 () Option!81)

(assert (=> d!5487 (= (getValueByKey!75 (toList!484 lm!252) k0!388) e!23004)))

(declare-fun b!36418 () Bool)

(declare-fun e!23005 () Option!81)

(assert (=> b!36418 (= e!23005 None!79)))

(declare-fun b!36416 () Bool)

(assert (=> b!36416 (= e!23004 e!23005)))

(declare-fun c!4172 () Bool)

(assert (=> b!36416 (= c!4172 (and ((_ is Cons!950) (toList!484 lm!252)) (not (= (_1!691 (h!1518 (toList!484 lm!252))) k0!388))))))

(declare-fun b!36417 () Bool)

(assert (=> b!36417 (= e!23005 (getValueByKey!75 (t!3667 (toList!484 lm!252)) k0!388))))

(declare-fun b!36415 () Bool)

(assert (=> b!36415 (= e!23004 (Some!80 (_2!691 (h!1518 (toList!484 lm!252)))))))

(assert (= (and d!5487 c!4171) b!36415))

(assert (= (and d!5487 (not c!4171)) b!36416))

(assert (= (and b!36416 c!4172) b!36417))

(assert (= (and b!36416 (not c!4172)) b!36418))

(declare-fun m!29349 () Bool)

(assert (=> b!36417 m!29349))

(assert (=> b!36342 d!5487))

(assert (=> b!36344 d!5485))

(assert (=> b!36344 d!5487))

(declare-fun d!5495 () Bool)

(declare-fun res!22048 () Bool)

(declare-fun e!23018 () Bool)

(assert (=> d!5495 (=> res!22048 e!23018)))

(assert (=> d!5495 (= res!22048 (or ((_ is Nil!951) (toList!484 lm!252)) ((_ is Nil!951) (t!3667 (toList!484 lm!252)))))))

(assert (=> d!5495 (= (isStrictlySorted!173 (toList!484 lm!252)) e!23018)))

(declare-fun b!36431 () Bool)

(declare-fun e!23019 () Bool)

(assert (=> b!36431 (= e!23018 e!23019)))

(declare-fun res!22049 () Bool)

(assert (=> b!36431 (=> (not res!22049) (not e!23019))))

(assert (=> b!36431 (= res!22049 (bvslt (_1!691 (h!1518 (toList!484 lm!252))) (_1!691 (h!1518 (t!3667 (toList!484 lm!252))))))))

(declare-fun b!36432 () Bool)

(assert (=> b!36432 (= e!23019 (isStrictlySorted!173 (t!3667 (toList!484 lm!252))))))

(assert (= (and d!5495 (not res!22048)) b!36431))

(assert (= (and b!36431 res!22049) b!36432))

(declare-fun m!29357 () Bool)

(assert (=> b!36432 m!29357))

(assert (=> d!5469 d!5495))

(declare-fun d!5503 () Bool)

(assert (=> d!5503 (= (isEmpty!179 (toList!484 lm!252)) ((_ is Nil!951) (toList!484 lm!252)))))

(assert (=> d!5457 d!5503))

(declare-fun b!36445 () Bool)

(declare-fun e!23028 () Bool)

(declare-fun tp!5346 () Bool)

(assert (=> b!36445 (= e!23028 (and tp_is_empty!1645 tp!5346))))

(assert (=> b!36364 (= tp!5339 e!23028)))

(assert (= (and b!36364 ((_ is Cons!950) (t!3667 (toList!484 lm!252)))) b!36445))

(declare-fun b_lambda!1757 () Bool)

(assert (= b_lambda!1755 (or (and start!4646 b_free!1293) b_lambda!1757)))

(check-sat (not b!36387) (not b!36417) (not d!5485) (not b!36396) (not d!5481) (not b!36393) (not b_next!1293) tp_is_empty!1645 (not b_lambda!1747) b_and!2137 (not b!36432) (not b_lambda!1757) (not b!36445))
(check-sat b_and!2137 (not b_next!1293))
