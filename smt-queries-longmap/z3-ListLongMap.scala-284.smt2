; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4640 () Bool)

(assert start!4640)

(declare-fun b_free!1291 () Bool)

(declare-fun b_next!1291 () Bool)

(assert (=> start!4640 (= b_free!1291 (not b_next!1291))))

(declare-fun tp!5323 () Bool)

(declare-fun b_and!2115 () Bool)

(assert (=> start!4640 (= tp!5323 b_and!2115)))

(declare-fun res!21928 () Bool)

(declare-fun e!22869 () Bool)

(assert (=> start!4640 (=> (not res!21928) (not e!22869))))

(declare-datatypes ((B!698 0))(
  ( (B!699 (val!849 Int)) )
))
(declare-datatypes ((tuple2!1340 0))(
  ( (tuple2!1341 (_1!681 (_ BitVec 64)) (_2!681 B!698)) )
))
(declare-datatypes ((List!939 0))(
  ( (Nil!936) (Cons!935 (h!1503 tuple2!1340) (t!3646 List!939)) )
))
(declare-datatypes ((ListLongMap!911 0))(
  ( (ListLongMap!912 (toList!471 List!939)) )
))
(declare-fun lm!252 () ListLongMap!911)

(declare-fun p!304 () Int)

(declare-fun forall!149 (List!939 Int) Bool)

(assert (=> start!4640 (= res!21928 (forall!149 (toList!471 lm!252) p!304))))

(assert (=> start!4640 e!22869))

(declare-fun e!22868 () Bool)

(declare-fun inv!1574 (ListLongMap!911) Bool)

(assert (=> start!4640 (and (inv!1574 lm!252) e!22868)))

(assert (=> start!4640 tp!5323))

(assert (=> start!4640 true))

(declare-fun b!36229 () Bool)

(declare-fun tp!5324 () Bool)

(assert (=> b!36229 (= e!22868 tp!5324)))

(declare-fun b!36228 () Bool)

(assert (=> b!36228 (= e!22869 (= (toList!471 lm!252) Nil!936))))

(declare-fun b!36227 () Bool)

(declare-fun res!21929 () Bool)

(assert (=> b!36227 (=> (not res!21929) (not e!22869))))

(declare-fun isEmpty!176 (ListLongMap!911) Bool)

(assert (=> b!36227 (= res!21929 (not (isEmpty!176 lm!252)))))

(declare-fun b!36226 () Bool)

(declare-fun res!21927 () Bool)

(assert (=> b!36226 (=> (not res!21927) (not e!22869))))

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!424 (ListLongMap!911 (_ BitVec 64)) Bool)

(assert (=> b!36226 (= res!21927 (contains!424 lm!252 k0!388))))

(assert (= (and start!4640 res!21928) b!36226))

(assert (= (and b!36226 res!21927) b!36227))

(assert (= (and b!36227 res!21929) b!36228))

(assert (= start!4640 b!36229))

(declare-fun m!29113 () Bool)

(assert (=> start!4640 m!29113))

(declare-fun m!29115 () Bool)

(assert (=> start!4640 m!29115))

(declare-fun m!29117 () Bool)

(assert (=> b!36227 m!29117))

(declare-fun m!29119 () Bool)

(assert (=> b!36226 m!29119))

(check-sat (not b!36227) (not start!4640) b_and!2115 (not b!36229) (not b_next!1291) (not b!36226))
(check-sat b_and!2115 (not b_next!1291))
(get-model)

(declare-fun d!5421 () Bool)

(declare-fun isEmpty!179 (List!939) Bool)

(assert (=> d!5421 (= (isEmpty!176 lm!252) (isEmpty!179 (toList!471 lm!252)))))

(declare-fun bs!1377 () Bool)

(assert (= bs!1377 d!5421))

(declare-fun m!29137 () Bool)

(assert (=> bs!1377 m!29137))

(assert (=> b!36227 d!5421))

(declare-fun d!5423 () Bool)

(declare-fun e!22898 () Bool)

(assert (=> d!5423 e!22898))

(declare-fun res!21962 () Bool)

(assert (=> d!5423 (=> res!21962 e!22898)))

(declare-fun lt!13414 () Bool)

(assert (=> d!5423 (= res!21962 (not lt!13414))))

(declare-fun lt!13412 () Bool)

(assert (=> d!5423 (= lt!13414 lt!13412)))

(declare-datatypes ((Unit!806 0))(
  ( (Unit!807) )
))
(declare-fun lt!13413 () Unit!806)

(declare-fun e!22899 () Unit!806)

(assert (=> d!5423 (= lt!13413 e!22899)))

(declare-fun c!4144 () Bool)

(assert (=> d!5423 (= c!4144 lt!13412)))

(declare-fun containsKey!39 (List!939 (_ BitVec 64)) Bool)

(assert (=> d!5423 (= lt!13412 (containsKey!39 (toList!471 lm!252) k0!388))))

(assert (=> d!5423 (= (contains!424 lm!252 k0!388) lt!13414)))

(declare-fun b!36272 () Bool)

(declare-fun lt!13411 () Unit!806)

(assert (=> b!36272 (= e!22899 lt!13411)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!36 (List!939 (_ BitVec 64)) Unit!806)

(assert (=> b!36272 (= lt!13411 (lemmaContainsKeyImpliesGetValueByKeyDefined!36 (toList!471 lm!252) k0!388))))

(declare-datatypes ((Option!81 0))(
  ( (Some!80 (v!1949 B!698)) (None!79) )
))
(declare-fun isDefined!37 (Option!81) Bool)

(declare-fun getValueByKey!75 (List!939 (_ BitVec 64)) Option!81)

(assert (=> b!36272 (isDefined!37 (getValueByKey!75 (toList!471 lm!252) k0!388))))

(declare-fun b!36273 () Bool)

(declare-fun Unit!808 () Unit!806)

(assert (=> b!36273 (= e!22899 Unit!808)))

(declare-fun b!36274 () Bool)

(assert (=> b!36274 (= e!22898 (isDefined!37 (getValueByKey!75 (toList!471 lm!252) k0!388)))))

(assert (= (and d!5423 c!4144) b!36272))

(assert (= (and d!5423 (not c!4144)) b!36273))

(assert (= (and d!5423 (not res!21962)) b!36274))

(declare-fun m!29155 () Bool)

(assert (=> d!5423 m!29155))

(declare-fun m!29157 () Bool)

(assert (=> b!36272 m!29157))

(declare-fun m!29159 () Bool)

(assert (=> b!36272 m!29159))

(assert (=> b!36272 m!29159))

(declare-fun m!29161 () Bool)

(assert (=> b!36272 m!29161))

(assert (=> b!36274 m!29159))

(assert (=> b!36274 m!29159))

(assert (=> b!36274 m!29161))

(assert (=> b!36226 d!5423))

(declare-fun d!5437 () Bool)

(declare-fun res!21969 () Bool)

(declare-fun e!22908 () Bool)

(assert (=> d!5437 (=> res!21969 e!22908)))

(get-info :version)

(assert (=> d!5437 (= res!21969 ((_ is Nil!936) (toList!471 lm!252)))))

(assert (=> d!5437 (= (forall!149 (toList!471 lm!252) p!304) e!22908)))

(declare-fun b!36285 () Bool)

(declare-fun e!22909 () Bool)

(assert (=> b!36285 (= e!22908 e!22909)))

(declare-fun res!21970 () Bool)

(assert (=> b!36285 (=> (not res!21970) (not e!22909))))

(declare-fun dynLambda!158 (Int tuple2!1340) Bool)

(assert (=> b!36285 (= res!21970 (dynLambda!158 p!304 (h!1503 (toList!471 lm!252))))))

(declare-fun b!36286 () Bool)

(assert (=> b!36286 (= e!22909 (forall!149 (t!3646 (toList!471 lm!252)) p!304))))

(assert (= (and d!5437 (not res!21969)) b!36285))

(assert (= (and b!36285 res!21970) b!36286))

(declare-fun b_lambda!1731 () Bool)

(assert (=> (not b_lambda!1731) (not b!36285)))

(declare-fun t!3654 () Bool)

(declare-fun tb!699 () Bool)

(assert (=> (and start!4640 (= p!304 p!304) t!3654) tb!699))

(declare-fun result!1211 () Bool)

(assert (=> tb!699 (= result!1211 true)))

(assert (=> b!36285 t!3654))

(declare-fun b_and!2125 () Bool)

(assert (= b_and!2115 (and (=> t!3654 result!1211) b_and!2125)))

(declare-fun m!29163 () Bool)

(assert (=> b!36285 m!29163))

(declare-fun m!29165 () Bool)

(assert (=> b!36286 m!29165))

(assert (=> start!4640 d!5437))

(declare-fun d!5439 () Bool)

(declare-fun isStrictlySorted!162 (List!939) Bool)

(assert (=> d!5439 (= (inv!1574 lm!252) (isStrictlySorted!162 (toList!471 lm!252)))))

(declare-fun bs!1382 () Bool)

(assert (= bs!1382 d!5439))

(declare-fun m!29175 () Bool)

(assert (=> bs!1382 m!29175))

(assert (=> start!4640 d!5439))

(declare-fun b!36305 () Bool)

(declare-fun e!22921 () Bool)

(declare-fun tp_is_empty!1647 () Bool)

(declare-fun tp!5342 () Bool)

(assert (=> b!36305 (= e!22921 (and tp_is_empty!1647 tp!5342))))

(assert (=> b!36229 (= tp!5324 e!22921)))

(assert (= (and b!36229 ((_ is Cons!935) (toList!471 lm!252))) b!36305))

(declare-fun b_lambda!1735 () Bool)

(assert (= b_lambda!1731 (or (and start!4640 b_free!1291) b_lambda!1735)))

(check-sat tp_is_empty!1647 (not b_next!1291) (not d!5423) (not b_lambda!1735) (not b!36305) (not d!5421) b_and!2125 (not b!36286) (not b!36274) (not b!36272) (not d!5439))
(check-sat b_and!2125 (not b_next!1291))
(get-model)

(declare-fun d!5441 () Bool)

(declare-fun isEmpty!182 (Option!81) Bool)

(assert (=> d!5441 (= (isDefined!37 (getValueByKey!75 (toList!471 lm!252) k0!388)) (not (isEmpty!182 (getValueByKey!75 (toList!471 lm!252) k0!388))))))

(declare-fun bs!1383 () Bool)

(assert (= bs!1383 d!5441))

(assert (=> bs!1383 m!29159))

(declare-fun m!29185 () Bool)

(assert (=> bs!1383 m!29185))

(assert (=> b!36274 d!5441))

(declare-fun b!36324 () Bool)

(declare-fun e!22932 () Option!81)

(assert (=> b!36324 (= e!22932 (getValueByKey!75 (t!3646 (toList!471 lm!252)) k0!388))))

(declare-fun d!5443 () Bool)

(declare-fun c!4155 () Bool)

(assert (=> d!5443 (= c!4155 (and ((_ is Cons!935) (toList!471 lm!252)) (= (_1!681 (h!1503 (toList!471 lm!252))) k0!388)))))

(declare-fun e!22931 () Option!81)

(assert (=> d!5443 (= (getValueByKey!75 (toList!471 lm!252) k0!388) e!22931)))

(declare-fun b!36322 () Bool)

(assert (=> b!36322 (= e!22931 (Some!80 (_2!681 (h!1503 (toList!471 lm!252)))))))

(declare-fun b!36325 () Bool)

(assert (=> b!36325 (= e!22932 None!79)))

(declare-fun b!36323 () Bool)

(assert (=> b!36323 (= e!22931 e!22932)))

(declare-fun c!4156 () Bool)

(assert (=> b!36323 (= c!4156 (and ((_ is Cons!935) (toList!471 lm!252)) (not (= (_1!681 (h!1503 (toList!471 lm!252))) k0!388))))))

(assert (= (and d!5443 c!4155) b!36322))

(assert (= (and d!5443 (not c!4155)) b!36323))

(assert (= (and b!36323 c!4156) b!36324))

(assert (= (and b!36323 (not c!4156)) b!36325))

(declare-fun m!29187 () Bool)

(assert (=> b!36324 m!29187))

(assert (=> b!36274 d!5443))

(declare-fun d!5447 () Bool)

(declare-fun res!21987 () Bool)

(declare-fun e!22945 () Bool)

(assert (=> d!5447 (=> res!21987 e!22945)))

(assert (=> d!5447 (= res!21987 (or ((_ is Nil!936) (toList!471 lm!252)) ((_ is Nil!936) (t!3646 (toList!471 lm!252)))))))

(assert (=> d!5447 (= (isStrictlySorted!162 (toList!471 lm!252)) e!22945)))

(declare-fun b!36338 () Bool)

(declare-fun e!22946 () Bool)

(assert (=> b!36338 (= e!22945 e!22946)))

(declare-fun res!21988 () Bool)

(assert (=> b!36338 (=> (not res!21988) (not e!22946))))

(assert (=> b!36338 (= res!21988 (bvslt (_1!681 (h!1503 (toList!471 lm!252))) (_1!681 (h!1503 (t!3646 (toList!471 lm!252))))))))

(declare-fun b!36339 () Bool)

(assert (=> b!36339 (= e!22946 (isStrictlySorted!162 (t!3646 (toList!471 lm!252))))))

(assert (= (and d!5447 (not res!21987)) b!36338))

(assert (= (and b!36338 res!21988) b!36339))

(declare-fun m!29195 () Bool)

(assert (=> b!36339 m!29195))

(assert (=> d!5439 d!5447))

(declare-fun d!5455 () Bool)

(declare-fun res!21991 () Bool)

(declare-fun e!22949 () Bool)

(assert (=> d!5455 (=> res!21991 e!22949)))

(assert (=> d!5455 (= res!21991 ((_ is Nil!936) (t!3646 (toList!471 lm!252))))))

(assert (=> d!5455 (= (forall!149 (t!3646 (toList!471 lm!252)) p!304) e!22949)))

(declare-fun b!36342 () Bool)

(declare-fun e!22950 () Bool)

(assert (=> b!36342 (= e!22949 e!22950)))

(declare-fun res!21992 () Bool)

(assert (=> b!36342 (=> (not res!21992) (not e!22950))))

(assert (=> b!36342 (= res!21992 (dynLambda!158 p!304 (h!1503 (t!3646 (toList!471 lm!252)))))))

(declare-fun b!36343 () Bool)

(assert (=> b!36343 (= e!22950 (forall!149 (t!3646 (t!3646 (toList!471 lm!252))) p!304))))

(assert (= (and d!5455 (not res!21991)) b!36342))

(assert (= (and b!36342 res!21992) b!36343))

(declare-fun b_lambda!1743 () Bool)

(assert (=> (not b_lambda!1743) (not b!36342)))

(declare-fun t!3660 () Bool)

(declare-fun tb!705 () Bool)

(assert (=> (and start!4640 (= p!304 p!304) t!3660) tb!705))

(declare-fun result!1223 () Bool)

(assert (=> tb!705 (= result!1223 true)))

(assert (=> b!36342 t!3660))

(declare-fun b_and!2131 () Bool)

(assert (= b_and!2125 (and (=> t!3660 result!1223) b_and!2131)))

(declare-fun m!29201 () Bool)

(assert (=> b!36342 m!29201))

(declare-fun m!29203 () Bool)

(assert (=> b!36343 m!29203))

(assert (=> b!36286 d!5455))

(declare-fun d!5459 () Bool)

(declare-fun res!22009 () Bool)

(declare-fun e!22967 () Bool)

(assert (=> d!5459 (=> res!22009 e!22967)))

(assert (=> d!5459 (= res!22009 (and ((_ is Cons!935) (toList!471 lm!252)) (= (_1!681 (h!1503 (toList!471 lm!252))) k0!388)))))

(assert (=> d!5459 (= (containsKey!39 (toList!471 lm!252) k0!388) e!22967)))

(declare-fun b!36360 () Bool)

(declare-fun e!22968 () Bool)

(assert (=> b!36360 (= e!22967 e!22968)))

(declare-fun res!22010 () Bool)

(assert (=> b!36360 (=> (not res!22010) (not e!22968))))

(assert (=> b!36360 (= res!22010 (and (or (not ((_ is Cons!935) (toList!471 lm!252))) (bvsle (_1!681 (h!1503 (toList!471 lm!252))) k0!388)) ((_ is Cons!935) (toList!471 lm!252)) (bvslt (_1!681 (h!1503 (toList!471 lm!252))) k0!388)))))

(declare-fun b!36361 () Bool)

(assert (=> b!36361 (= e!22968 (containsKey!39 (t!3646 (toList!471 lm!252)) k0!388))))

(assert (= (and d!5459 (not res!22009)) b!36360))

(assert (= (and b!36360 res!22010) b!36361))

(declare-fun m!29211 () Bool)

(assert (=> b!36361 m!29211))

(assert (=> d!5423 d!5459))

(declare-fun d!5467 () Bool)

(assert (=> d!5467 (isDefined!37 (getValueByKey!75 (toList!471 lm!252) k0!388))))

(declare-fun lt!13441 () Unit!806)

(declare-fun choose!225 (List!939 (_ BitVec 64)) Unit!806)

(assert (=> d!5467 (= lt!13441 (choose!225 (toList!471 lm!252) k0!388))))

(declare-fun e!22981 () Bool)

(assert (=> d!5467 e!22981))

(declare-fun res!22019 () Bool)

(assert (=> d!5467 (=> (not res!22019) (not e!22981))))

(assert (=> d!5467 (= res!22019 (isStrictlySorted!162 (toList!471 lm!252)))))

(assert (=> d!5467 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!36 (toList!471 lm!252) k0!388) lt!13441)))

(declare-fun b!36378 () Bool)

(assert (=> b!36378 (= e!22981 (containsKey!39 (toList!471 lm!252) k0!388))))

(assert (= (and d!5467 res!22019) b!36378))

(assert (=> d!5467 m!29159))

(assert (=> d!5467 m!29159))

(assert (=> d!5467 m!29161))

(declare-fun m!29215 () Bool)

(assert (=> d!5467 m!29215))

(assert (=> d!5467 m!29175))

(assert (=> b!36378 m!29155))

(assert (=> b!36272 d!5467))

(assert (=> b!36272 d!5441))

(assert (=> b!36272 d!5443))

(declare-fun d!5473 () Bool)

(assert (=> d!5473 (= (isEmpty!179 (toList!471 lm!252)) ((_ is Nil!936) (toList!471 lm!252)))))

(assert (=> d!5421 d!5473))

(declare-fun b!36383 () Bool)

(declare-fun e!22984 () Bool)

(declare-fun tp!5346 () Bool)

(assert (=> b!36383 (= e!22984 (and tp_is_empty!1647 tp!5346))))

(assert (=> b!36305 (= tp!5342 e!22984)))

(assert (= (and b!36305 ((_ is Cons!935) (t!3646 (toList!471 lm!252)))) b!36383))

(declare-fun b_lambda!1745 () Bool)

(assert (= b_lambda!1743 (or (and start!4640 b_free!1291) b_lambda!1745)))

(check-sat tp_is_empty!1647 (not b!36343) (not b_next!1291) (not b!36324) (not d!5441) b_and!2131 (not b_lambda!1745) (not b!36339) (not b!36378) (not b_lambda!1735) (not b!36361) (not b!36383) (not d!5467))
(check-sat b_and!2131 (not b_next!1291))
