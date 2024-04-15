; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5036 () Bool)

(assert start!5036)

(declare-fun b_free!1345 () Bool)

(declare-fun b_next!1345 () Bool)

(assert (=> start!5036 (= b_free!1345 (not b_next!1345))))

(declare-fun tp!5543 () Bool)

(declare-fun b_and!2293 () Bool)

(assert (=> start!5036 (= tp!5543 b_and!2293)))

(declare-fun b!37491 () Bool)

(declare-fun k0!388 () (_ BitVec 64))

(declare-datatypes ((B!752 0))(
  ( (B!753 (val!876 Int)) )
))
(declare-datatypes ((tuple2!1416 0))(
  ( (tuple2!1417 (_1!719 (_ BitVec 64)) (_2!719 B!752)) )
))
(declare-datatypes ((List!973 0))(
  ( (Nil!970) (Cons!969 (h!1537 tuple2!1416) (t!3789 List!973)) )
))
(declare-datatypes ((ListLongMap!981 0))(
  ( (ListLongMap!982 (toList!506 List!973)) )
))
(declare-fun lm!252 () ListLongMap!981)

(declare-fun e!23734 () Bool)

(declare-fun p!304 () Int)

(declare-fun dynLambda!177 (Int tuple2!1416) Bool)

(declare-fun apply!49 (ListLongMap!981 (_ BitVec 64)) B!752)

(assert (=> b!37491 (= e!23734 (not (dynLambda!177 p!304 (tuple2!1417 k0!388 (apply!49 lm!252 k0!388)))))))

(declare-fun b!37492 () Bool)

(declare-fun res!22673 () Bool)

(assert (=> b!37492 (=> (not res!22673) (not e!23734))))

(declare-fun e!23736 () Bool)

(assert (=> b!37492 (= res!22673 e!23736)))

(declare-fun res!22675 () Bool)

(assert (=> b!37492 (=> res!22675 e!23736)))

(declare-fun isEmpty!218 (ListLongMap!981) Bool)

(assert (=> b!37492 (= res!22675 (isEmpty!218 lm!252))))

(declare-fun b!37493 () Bool)

(declare-fun head!848 (List!973) tuple2!1416)

(assert (=> b!37493 (= e!23736 (= (_1!719 (head!848 (toList!506 lm!252))) k0!388))))

(declare-fun b!37494 () Bool)

(declare-fun e!23735 () Bool)

(declare-fun tp!5542 () Bool)

(assert (=> b!37494 (= e!23735 tp!5542)))

(declare-fun b!37495 () Bool)

(declare-fun res!22674 () Bool)

(assert (=> b!37495 (=> (not res!22674) (not e!23734))))

(declare-fun contains!458 (ListLongMap!981 (_ BitVec 64)) Bool)

(assert (=> b!37495 (= res!22674 (contains!458 lm!252 k0!388))))

(declare-fun res!22672 () Bool)

(assert (=> start!5036 (=> (not res!22672) (not e!23734))))

(declare-fun forall!176 (List!973 Int) Bool)

(assert (=> start!5036 (= res!22672 (forall!176 (toList!506 lm!252) p!304))))

(assert (=> start!5036 e!23734))

(declare-fun inv!1646 (ListLongMap!981) Bool)

(assert (=> start!5036 (and (inv!1646 lm!252) e!23735)))

(assert (=> start!5036 tp!5543))

(assert (=> start!5036 true))

(assert (= (and start!5036 res!22672) b!37495))

(assert (= (and b!37495 res!22674) b!37492))

(assert (= (and b!37492 (not res!22675)) b!37493))

(assert (= (and b!37492 res!22673) b!37491))

(assert (= start!5036 b!37494))

(declare-fun b_lambda!1965 () Bool)

(assert (=> (not b_lambda!1965) (not b!37491)))

(declare-fun t!3788 () Bool)

(declare-fun tb!803 () Bool)

(assert (=> (and start!5036 (= p!304 p!304) t!3788) tb!803))

(declare-fun result!1345 () Bool)

(assert (=> tb!803 (= result!1345 true)))

(assert (=> b!37491 t!3788))

(declare-fun b_and!2295 () Bool)

(assert (= b_and!2293 (and (=> t!3788 result!1345) b_and!2295)))

(declare-fun m!30281 () Bool)

(assert (=> b!37492 m!30281))

(declare-fun m!30283 () Bool)

(assert (=> b!37495 m!30283))

(declare-fun m!30285 () Bool)

(assert (=> b!37493 m!30285))

(declare-fun m!30287 () Bool)

(assert (=> b!37491 m!30287))

(declare-fun m!30289 () Bool)

(assert (=> b!37491 m!30289))

(declare-fun m!30291 () Bool)

(assert (=> start!5036 m!30291))

(declare-fun m!30293 () Bool)

(assert (=> start!5036 m!30293))

(check-sat (not start!5036) b_and!2295 (not b_lambda!1965) (not b!37495) (not b!37494) (not b_next!1345) (not b!37491) (not b!37492) (not b!37493))
(check-sat b_and!2295 (not b_next!1345))
(get-model)

(declare-fun b_lambda!1973 () Bool)

(assert (= b_lambda!1965 (or (and start!5036 b_free!1345) b_lambda!1973)))

(check-sat (not start!5036) b_and!2295 (not b_lambda!1973) (not b!37495) (not b!37494) (not b_next!1345) (not b!37491) (not b!37492) (not b!37493))
(check-sat b_and!2295 (not b_next!1345))
(get-model)

(declare-fun d!5963 () Bool)

(declare-fun isEmpty!221 (List!973) Bool)

(assert (=> d!5963 (= (isEmpty!218 lm!252) (isEmpty!221 (toList!506 lm!252)))))

(declare-fun bs!1468 () Bool)

(assert (= bs!1468 d!5963))

(declare-fun m!30327 () Bool)

(assert (=> bs!1468 m!30327))

(assert (=> b!37492 d!5963))

(declare-fun d!5969 () Bool)

(declare-fun res!22714 () Bool)

(declare-fun e!23769 () Bool)

(assert (=> d!5969 (=> res!22714 e!23769)))

(get-info :version)

(assert (=> d!5969 (= res!22714 ((_ is Nil!970) (toList!506 lm!252)))))

(assert (=> d!5969 (= (forall!176 (toList!506 lm!252) p!304) e!23769)))

(declare-fun b!37540 () Bool)

(declare-fun e!23770 () Bool)

(assert (=> b!37540 (= e!23769 e!23770)))

(declare-fun res!22715 () Bool)

(assert (=> b!37540 (=> (not res!22715) (not e!23770))))

(assert (=> b!37540 (= res!22715 (dynLambda!177 p!304 (h!1537 (toList!506 lm!252))))))

(declare-fun b!37541 () Bool)

(assert (=> b!37541 (= e!23770 (forall!176 (t!3789 (toList!506 lm!252)) p!304))))

(assert (= (and d!5969 (not res!22714)) b!37540))

(assert (= (and b!37540 res!22715) b!37541))

(declare-fun b_lambda!1979 () Bool)

(assert (=> (not b_lambda!1979) (not b!37540)))

(declare-fun t!3799 () Bool)

(declare-fun tb!811 () Bool)

(assert (=> (and start!5036 (= p!304 p!304) t!3799) tb!811))

(declare-fun result!1353 () Bool)

(assert (=> tb!811 (= result!1353 true)))

(assert (=> b!37540 t!3799))

(declare-fun b_and!2307 () Bool)

(assert (= b_and!2295 (and (=> t!3799 result!1353) b_and!2307)))

(declare-fun m!30335 () Bool)

(assert (=> b!37540 m!30335))

(declare-fun m!30337 () Bool)

(assert (=> b!37541 m!30337))

(assert (=> start!5036 d!5969))

(declare-fun d!5975 () Bool)

(declare-fun isStrictlySorted!182 (List!973) Bool)

(assert (=> d!5975 (= (inv!1646 lm!252) (isStrictlySorted!182 (toList!506 lm!252)))))

(declare-fun bs!1471 () Bool)

(assert (= bs!1471 d!5975))

(declare-fun m!30345 () Bool)

(assert (=> bs!1471 m!30345))

(assert (=> start!5036 d!5975))

(declare-fun d!5981 () Bool)

(declare-datatypes ((Option!95 0))(
  ( (Some!94 (v!1963 B!752)) (None!93) )
))
(declare-fun get!640 (Option!95) B!752)

(declare-fun getValueByKey!89 (List!973 (_ BitVec 64)) Option!95)

(assert (=> d!5981 (= (apply!49 lm!252 k0!388) (get!640 (getValueByKey!89 (toList!506 lm!252) k0!388)))))

(declare-fun bs!1474 () Bool)

(assert (= bs!1474 d!5981))

(declare-fun m!30351 () Bool)

(assert (=> bs!1474 m!30351))

(assert (=> bs!1474 m!30351))

(declare-fun m!30353 () Bool)

(assert (=> bs!1474 m!30353))

(assert (=> b!37491 d!5981))

(declare-fun d!5989 () Bool)

(declare-fun e!23782 () Bool)

(assert (=> d!5989 e!23782))

(declare-fun res!22722 () Bool)

(assert (=> d!5989 (=> res!22722 e!23782)))

(declare-fun lt!13848 () Bool)

(assert (=> d!5989 (= res!22722 (not lt!13848))))

(declare-fun lt!13846 () Bool)

(assert (=> d!5989 (= lt!13848 lt!13846)))

(declare-datatypes ((Unit!863 0))(
  ( (Unit!864) )
))
(declare-fun lt!13849 () Unit!863)

(declare-fun e!23781 () Unit!863)

(assert (=> d!5989 (= lt!13849 e!23781)))

(declare-fun c!4322 () Bool)

(assert (=> d!5989 (= c!4322 lt!13846)))

(declare-fun containsKey!53 (List!973 (_ BitVec 64)) Bool)

(assert (=> d!5989 (= lt!13846 (containsKey!53 (toList!506 lm!252) k0!388))))

(assert (=> d!5989 (= (contains!458 lm!252 k0!388) lt!13848)))

(declare-fun b!37556 () Bool)

(declare-fun lt!13847 () Unit!863)

(assert (=> b!37556 (= e!23781 lt!13847)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!50 (List!973 (_ BitVec 64)) Unit!863)

(assert (=> b!37556 (= lt!13847 (lemmaContainsKeyImpliesGetValueByKeyDefined!50 (toList!506 lm!252) k0!388))))

(declare-fun isDefined!51 (Option!95) Bool)

(assert (=> b!37556 (isDefined!51 (getValueByKey!89 (toList!506 lm!252) k0!388))))

(declare-fun b!37557 () Bool)

(declare-fun Unit!867 () Unit!863)

(assert (=> b!37557 (= e!23781 Unit!867)))

(declare-fun b!37558 () Bool)

(assert (=> b!37558 (= e!23782 (isDefined!51 (getValueByKey!89 (toList!506 lm!252) k0!388)))))

(assert (= (and d!5989 c!4322) b!37556))

(assert (= (and d!5989 (not c!4322)) b!37557))

(assert (= (and d!5989 (not res!22722)) b!37558))

(declare-fun m!30359 () Bool)

(assert (=> d!5989 m!30359))

(declare-fun m!30361 () Bool)

(assert (=> b!37556 m!30361))

(assert (=> b!37556 m!30351))

(assert (=> b!37556 m!30351))

(declare-fun m!30363 () Bool)

(assert (=> b!37556 m!30363))

(assert (=> b!37558 m!30351))

(assert (=> b!37558 m!30351))

(assert (=> b!37558 m!30363))

(assert (=> b!37495 d!5989))

(declare-fun d!5993 () Bool)

(assert (=> d!5993 (= (head!848 (toList!506 lm!252)) (h!1537 (toList!506 lm!252)))))

(assert (=> b!37493 d!5993))

(declare-fun b!37570 () Bool)

(declare-fun e!23789 () Bool)

(declare-fun tp_is_empty!1675 () Bool)

(declare-fun tp!5560 () Bool)

(assert (=> b!37570 (= e!23789 (and tp_is_empty!1675 tp!5560))))

(assert (=> b!37494 (= tp!5542 e!23789)))

(assert (= (and b!37494 ((_ is Cons!969) (toList!506 lm!252))) b!37570))

(declare-fun b_lambda!1983 () Bool)

(assert (= b_lambda!1979 (or (and start!5036 b_free!1345) b_lambda!1983)))

(check-sat (not d!5989) b_and!2307 (not b_lambda!1973) (not b!37541) (not b_next!1345) (not b!37570) (not d!5975) (not b_lambda!1983) (not b!37556) (not b!37558) (not d!5981) (not d!5963) tp_is_empty!1675)
(check-sat b_and!2307 (not b_next!1345))
(get-model)

(declare-fun d!5997 () Bool)

(declare-fun isEmpty!224 (Option!95) Bool)

(assert (=> d!5997 (= (isDefined!51 (getValueByKey!89 (toList!506 lm!252) k0!388)) (not (isEmpty!224 (getValueByKey!89 (toList!506 lm!252) k0!388))))))

(declare-fun bs!1476 () Bool)

(assert (= bs!1476 d!5997))

(assert (=> bs!1476 m!30351))

(declare-fun m!30377 () Bool)

(assert (=> bs!1476 m!30377))

(assert (=> b!37558 d!5997))

(declare-fun b!37596 () Bool)

(declare-fun e!23805 () Option!95)

(assert (=> b!37596 (= e!23805 (getValueByKey!89 (t!3789 (toList!506 lm!252)) k0!388))))

(declare-fun b!37597 () Bool)

(assert (=> b!37597 (= e!23805 None!93)))

(declare-fun b!37595 () Bool)

(declare-fun e!23804 () Option!95)

(assert (=> b!37595 (= e!23804 e!23805)))

(declare-fun c!4332 () Bool)

(assert (=> b!37595 (= c!4332 (and ((_ is Cons!969) (toList!506 lm!252)) (not (= (_1!719 (h!1537 (toList!506 lm!252))) k0!388))))))

(declare-fun d!5999 () Bool)

(declare-fun c!4331 () Bool)

(assert (=> d!5999 (= c!4331 (and ((_ is Cons!969) (toList!506 lm!252)) (= (_1!719 (h!1537 (toList!506 lm!252))) k0!388)))))

(assert (=> d!5999 (= (getValueByKey!89 (toList!506 lm!252) k0!388) e!23804)))

(declare-fun b!37594 () Bool)

(assert (=> b!37594 (= e!23804 (Some!94 (_2!719 (h!1537 (toList!506 lm!252)))))))

(assert (= (and d!5999 c!4331) b!37594))

(assert (= (and d!5999 (not c!4331)) b!37595))

(assert (= (and b!37595 c!4332) b!37596))

(assert (= (and b!37595 (not c!4332)) b!37597))

(declare-fun m!30379 () Bool)

(assert (=> b!37596 m!30379))

(assert (=> b!37558 d!5999))

(declare-fun d!6005 () Bool)

(declare-fun res!22727 () Bool)

(declare-fun e!23806 () Bool)

(assert (=> d!6005 (=> res!22727 e!23806)))

(assert (=> d!6005 (= res!22727 ((_ is Nil!970) (t!3789 (toList!506 lm!252))))))

(assert (=> d!6005 (= (forall!176 (t!3789 (toList!506 lm!252)) p!304) e!23806)))

(declare-fun b!37598 () Bool)

(declare-fun e!23807 () Bool)

(assert (=> b!37598 (= e!23806 e!23807)))

(declare-fun res!22728 () Bool)

(assert (=> b!37598 (=> (not res!22728) (not e!23807))))

(assert (=> b!37598 (= res!22728 (dynLambda!177 p!304 (h!1537 (t!3789 (toList!506 lm!252)))))))

(declare-fun b!37599 () Bool)

(assert (=> b!37599 (= e!23807 (forall!176 (t!3789 (t!3789 (toList!506 lm!252))) p!304))))

(assert (= (and d!6005 (not res!22727)) b!37598))

(assert (= (and b!37598 res!22728) b!37599))

(declare-fun b_lambda!1989 () Bool)

(assert (=> (not b_lambda!1989) (not b!37598)))

(declare-fun t!3803 () Bool)

(declare-fun tb!815 () Bool)

(assert (=> (and start!5036 (= p!304 p!304) t!3803) tb!815))

(declare-fun result!1363 () Bool)

(assert (=> tb!815 (= result!1363 true)))

(assert (=> b!37598 t!3803))

(declare-fun b_and!2311 () Bool)

(assert (= b_and!2307 (and (=> t!3803 result!1363) b_and!2311)))

(declare-fun m!30381 () Bool)

(assert (=> b!37598 m!30381))

(declare-fun m!30383 () Bool)

(assert (=> b!37599 m!30383))

(assert (=> b!37541 d!6005))

(declare-fun d!6007 () Bool)

(assert (=> d!6007 (isDefined!51 (getValueByKey!89 (toList!506 lm!252) k0!388))))

(declare-fun lt!13868 () Unit!863)

(declare-fun choose!238 (List!973 (_ BitVec 64)) Unit!863)

(assert (=> d!6007 (= lt!13868 (choose!238 (toList!506 lm!252) k0!388))))

(declare-fun e!23818 () Bool)

(assert (=> d!6007 e!23818))

(declare-fun res!22733 () Bool)

(assert (=> d!6007 (=> (not res!22733) (not e!23818))))

(assert (=> d!6007 (= res!22733 (isStrictlySorted!182 (toList!506 lm!252)))))

(assert (=> d!6007 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!50 (toList!506 lm!252) k0!388) lt!13868)))

(declare-fun b!37616 () Bool)

(assert (=> b!37616 (= e!23818 (containsKey!53 (toList!506 lm!252) k0!388))))

(assert (= (and d!6007 res!22733) b!37616))

(assert (=> d!6007 m!30351))

(assert (=> d!6007 m!30351))

(assert (=> d!6007 m!30363))

(declare-fun m!30391 () Bool)

(assert (=> d!6007 m!30391))

(assert (=> d!6007 m!30345))

(assert (=> b!37616 m!30359))

(assert (=> b!37556 d!6007))

(assert (=> b!37556 d!5997))

(assert (=> b!37556 d!5999))

(declare-fun d!6013 () Bool)

(assert (=> d!6013 (= (get!640 (getValueByKey!89 (toList!506 lm!252) k0!388)) (v!1963 (getValueByKey!89 (toList!506 lm!252) k0!388)))))

(assert (=> d!5981 d!6013))

(assert (=> d!5981 d!5999))

(declare-fun d!6015 () Bool)

(declare-fun res!22741 () Bool)

(declare-fun e!23826 () Bool)

(assert (=> d!6015 (=> res!22741 e!23826)))

(assert (=> d!6015 (= res!22741 (or ((_ is Nil!970) (toList!506 lm!252)) ((_ is Nil!970) (t!3789 (toList!506 lm!252)))))))

(assert (=> d!6015 (= (isStrictlySorted!182 (toList!506 lm!252)) e!23826)))

(declare-fun b!37624 () Bool)

(declare-fun e!23827 () Bool)

(assert (=> b!37624 (= e!23826 e!23827)))

(declare-fun res!22742 () Bool)

(assert (=> b!37624 (=> (not res!22742) (not e!23827))))

(assert (=> b!37624 (= res!22742 (bvslt (_1!719 (h!1537 (toList!506 lm!252))) (_1!719 (h!1537 (t!3789 (toList!506 lm!252))))))))

(declare-fun b!37625 () Bool)

(assert (=> b!37625 (= e!23827 (isStrictlySorted!182 (t!3789 (toList!506 lm!252))))))

(assert (= (and d!6015 (not res!22741)) b!37624))

(assert (= (and b!37624 res!22742) b!37625))

(declare-fun m!30395 () Bool)

(assert (=> b!37625 m!30395))

(assert (=> d!5975 d!6015))

(declare-fun d!6019 () Bool)

(declare-fun res!22751 () Bool)

(declare-fun e!23836 () Bool)

(assert (=> d!6019 (=> res!22751 e!23836)))

(assert (=> d!6019 (= res!22751 (and ((_ is Cons!969) (toList!506 lm!252)) (= (_1!719 (h!1537 (toList!506 lm!252))) k0!388)))))

(assert (=> d!6019 (= (containsKey!53 (toList!506 lm!252) k0!388) e!23836)))

(declare-fun b!37634 () Bool)

(declare-fun e!23837 () Bool)

(assert (=> b!37634 (= e!23836 e!23837)))

(declare-fun res!22752 () Bool)

(assert (=> b!37634 (=> (not res!22752) (not e!23837))))

(assert (=> b!37634 (= res!22752 (and (or (not ((_ is Cons!969) (toList!506 lm!252))) (bvsle (_1!719 (h!1537 (toList!506 lm!252))) k0!388)) ((_ is Cons!969) (toList!506 lm!252)) (bvslt (_1!719 (h!1537 (toList!506 lm!252))) k0!388)))))

(declare-fun b!37635 () Bool)

(assert (=> b!37635 (= e!23837 (containsKey!53 (t!3789 (toList!506 lm!252)) k0!388))))

(assert (= (and d!6019 (not res!22751)) b!37634))

(assert (= (and b!37634 res!22752) b!37635))

(declare-fun m!30399 () Bool)

(assert (=> b!37635 m!30399))

(assert (=> d!5989 d!6019))

(declare-fun d!6025 () Bool)

(assert (=> d!6025 (= (isEmpty!221 (toList!506 lm!252)) ((_ is Nil!970) (toList!506 lm!252)))))

(assert (=> d!5963 d!6025))

(declare-fun b!37638 () Bool)

(declare-fun e!23840 () Bool)

(declare-fun tp!5565 () Bool)

(assert (=> b!37638 (= e!23840 (and tp_is_empty!1675 tp!5565))))

(assert (=> b!37570 (= tp!5560 e!23840)))

(assert (= (and b!37570 ((_ is Cons!969) (t!3789 (toList!506 lm!252)))) b!37638))

(declare-fun b_lambda!1993 () Bool)

(assert (= b_lambda!1989 (or (and start!5036 b_free!1345) b_lambda!1993)))

(check-sat (not d!6007) (not b!37599) (not b!37596) (not b_lambda!1973) (not b_lambda!1993) (not b_next!1345) tp_is_empty!1675 (not b!37638) (not d!5997) (not b_lambda!1983) (not b!37635) (not b!37616) (not b!37625) b_and!2311)
(check-sat b_and!2311 (not b_next!1345))
