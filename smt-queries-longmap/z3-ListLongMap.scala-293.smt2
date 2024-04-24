; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5042 () Bool)

(assert start!5042)

(declare-fun b_free!1345 () Bool)

(declare-fun b_next!1345 () Bool)

(assert (=> start!5042 (= b_free!1345 (not b_next!1345))))

(declare-fun tp!5543 () Bool)

(declare-fun b_and!2289 () Bool)

(assert (=> start!5042 (= tp!5543 b_and!2289)))

(declare-fun b!37473 () Bool)

(declare-fun e!23726 () Bool)

(declare-datatypes ((B!752 0))(
  ( (B!753 (val!876 Int)) )
))
(declare-datatypes ((tuple2!1394 0))(
  ( (tuple2!1395 (_1!708 (_ BitVec 64)) (_2!708 B!752)) )
))
(declare-datatypes ((List!966 0))(
  ( (Nil!963) (Cons!962 (h!1530 tuple2!1394) (t!3783 List!966)) )
))
(declare-datatypes ((ListLongMap!965 0))(
  ( (ListLongMap!966 (toList!498 List!966)) )
))
(declare-fun lm!252 () ListLongMap!965)

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun head!846 (List!966) tuple2!1394)

(assert (=> b!37473 (= e!23726 (= (_1!708 (head!846 (toList!498 lm!252))) k0!388))))

(declare-fun b!37474 () Bool)

(declare-fun res!22664 () Bool)

(declare-fun e!23725 () Bool)

(assert (=> b!37474 (=> (not res!22664) (not e!23725))))

(assert (=> b!37474 (= res!22664 e!23726)))

(declare-fun res!22665 () Bool)

(assert (=> b!37474 (=> res!22665 e!23726)))

(declare-fun isEmpty!218 (ListLongMap!965) Bool)

(assert (=> b!37474 (= res!22665 (isEmpty!218 lm!252))))

(declare-fun b!37475 () Bool)

(declare-fun res!22667 () Bool)

(assert (=> b!37475 (=> (not res!22667) (not e!23725))))

(declare-fun contains!451 (ListLongMap!965 (_ BitVec 64)) Bool)

(assert (=> b!37475 (= res!22667 (contains!451 lm!252 k0!388))))

(declare-fun res!22666 () Bool)

(assert (=> start!5042 (=> (not res!22666) (not e!23725))))

(declare-fun p!304 () Int)

(declare-fun forall!176 (List!966 Int) Bool)

(assert (=> start!5042 (= res!22666 (forall!176 (toList!498 lm!252) p!304))))

(assert (=> start!5042 e!23725))

(declare-fun e!23727 () Bool)

(declare-fun inv!1646 (ListLongMap!965) Bool)

(assert (=> start!5042 (and (inv!1646 lm!252) e!23727)))

(assert (=> start!5042 tp!5543))

(assert (=> start!5042 true))

(declare-fun b!37476 () Bool)

(declare-fun dynLambda!174 (Int tuple2!1394) Bool)

(declare-fun apply!49 (ListLongMap!965 (_ BitVec 64)) B!752)

(assert (=> b!37476 (= e!23725 (not (dynLambda!174 p!304 (tuple2!1395 k0!388 (apply!49 lm!252 k0!388)))))))

(declare-fun b!37477 () Bool)

(declare-fun tp!5542 () Bool)

(assert (=> b!37477 (= e!23727 tp!5542)))

(assert (= (and start!5042 res!22666) b!37475))

(assert (= (and b!37475 res!22667) b!37474))

(assert (= (and b!37474 (not res!22665)) b!37473))

(assert (= (and b!37474 res!22664) b!37476))

(assert (= start!5042 b!37477))

(declare-fun b_lambda!1961 () Bool)

(assert (=> (not b_lambda!1961) (not b!37476)))

(declare-fun t!3782 () Bool)

(declare-fun tb!803 () Bool)

(assert (=> (and start!5042 (= p!304 p!304) t!3782) tb!803))

(declare-fun result!1345 () Bool)

(assert (=> tb!803 (= result!1345 true)))

(assert (=> b!37476 t!3782))

(declare-fun b_and!2291 () Bool)

(assert (= b_and!2289 (and (=> t!3782 result!1345) b_and!2291)))

(declare-fun m!30199 () Bool)

(assert (=> start!5042 m!30199))

(declare-fun m!30201 () Bool)

(assert (=> start!5042 m!30201))

(declare-fun m!30203 () Bool)

(assert (=> b!37473 m!30203))

(declare-fun m!30205 () Bool)

(assert (=> b!37474 m!30205))

(declare-fun m!30207 () Bool)

(assert (=> b!37475 m!30207))

(declare-fun m!30209 () Bool)

(assert (=> b!37476 m!30209))

(declare-fun m!30211 () Bool)

(assert (=> b!37476 m!30211))

(check-sat b_and!2291 (not b!37474) (not start!5042) (not b!37473) (not b!37477) (not b_next!1345) (not b!37476) (not b_lambda!1961) (not b!37475))
(check-sat b_and!2291 (not b_next!1345))
(get-model)

(declare-fun b_lambda!1967 () Bool)

(assert (= b_lambda!1961 (or (and start!5042 b_free!1345) b_lambda!1967)))

(check-sat (not b_lambda!1967) b_and!2291 (not b!37474) (not start!5042) (not b!37473) (not b!37477) (not b_next!1345) (not b!37476) (not b!37475))
(check-sat b_and!2291 (not b_next!1345))
(get-model)

(declare-fun d!5965 () Bool)

(declare-fun isEmpty!221 (List!966) Bool)

(assert (=> d!5965 (= (isEmpty!218 lm!252) (isEmpty!221 (toList!498 lm!252)))))

(declare-fun bs!1467 () Bool)

(assert (= bs!1467 d!5965))

(declare-fun m!30241 () Bool)

(assert (=> bs!1467 m!30241))

(assert (=> b!37474 d!5965))

(declare-fun d!5971 () Bool)

(declare-fun e!23763 () Bool)

(assert (=> d!5971 e!23763))

(declare-fun res!22703 () Bool)

(assert (=> d!5971 (=> res!22703 e!23763)))

(declare-fun lt!13812 () Bool)

(assert (=> d!5971 (= res!22703 (not lt!13812))))

(declare-fun lt!13813 () Bool)

(assert (=> d!5971 (= lt!13812 lt!13813)))

(declare-datatypes ((Unit!866 0))(
  ( (Unit!867) )
))
(declare-fun lt!13811 () Unit!866)

(declare-fun e!23762 () Unit!866)

(assert (=> d!5971 (= lt!13811 e!23762)))

(declare-fun c!4318 () Bool)

(assert (=> d!5971 (= c!4318 lt!13813)))

(declare-fun containsKey!54 (List!966 (_ BitVec 64)) Bool)

(assert (=> d!5971 (= lt!13813 (containsKey!54 (toList!498 lm!252) k0!388))))

(assert (=> d!5971 (= (contains!451 lm!252 k0!388) lt!13812)))

(declare-fun b!37529 () Bool)

(declare-fun lt!13810 () Unit!866)

(assert (=> b!37529 (= e!23762 lt!13810)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!51 (List!966 (_ BitVec 64)) Unit!866)

(assert (=> b!37529 (= lt!13810 (lemmaContainsKeyImpliesGetValueByKeyDefined!51 (toList!498 lm!252) k0!388))))

(declare-datatypes ((Option!97 0))(
  ( (Some!96 (v!1965 B!752)) (None!95) )
))
(declare-fun isDefined!52 (Option!97) Bool)

(declare-fun getValueByKey!91 (List!966 (_ BitVec 64)) Option!97)

(assert (=> b!37529 (isDefined!52 (getValueByKey!91 (toList!498 lm!252) k0!388))))

(declare-fun b!37530 () Bool)

(declare-fun Unit!870 () Unit!866)

(assert (=> b!37530 (= e!23762 Unit!870)))

(declare-fun b!37531 () Bool)

(assert (=> b!37531 (= e!23763 (isDefined!52 (getValueByKey!91 (toList!498 lm!252) k0!388)))))

(assert (= (and d!5971 c!4318) b!37529))

(assert (= (and d!5971 (not c!4318)) b!37530))

(assert (= (and d!5971 (not res!22703)) b!37531))

(declare-fun m!30263 () Bool)

(assert (=> d!5971 m!30263))

(declare-fun m!30265 () Bool)

(assert (=> b!37529 m!30265))

(declare-fun m!30267 () Bool)

(assert (=> b!37529 m!30267))

(assert (=> b!37529 m!30267))

(declare-fun m!30269 () Bool)

(assert (=> b!37529 m!30269))

(assert (=> b!37531 m!30267))

(assert (=> b!37531 m!30267))

(assert (=> b!37531 m!30269))

(assert (=> b!37475 d!5971))

(declare-fun d!5983 () Bool)

(assert (=> d!5983 (= (head!846 (toList!498 lm!252)) (h!1530 (toList!498 lm!252)))))

(assert (=> b!37473 d!5983))

(declare-fun d!5987 () Bool)

(declare-fun res!22712 () Bool)

(declare-fun e!23772 () Bool)

(assert (=> d!5987 (=> res!22712 e!23772)))

(get-info :version)

(assert (=> d!5987 (= res!22712 ((_ is Nil!963) (toList!498 lm!252)))))

(assert (=> d!5987 (= (forall!176 (toList!498 lm!252) p!304) e!23772)))

(declare-fun b!37540 () Bool)

(declare-fun e!23773 () Bool)

(assert (=> b!37540 (= e!23772 e!23773)))

(declare-fun res!22713 () Bool)

(assert (=> b!37540 (=> (not res!22713) (not e!23773))))

(assert (=> b!37540 (= res!22713 (dynLambda!174 p!304 (h!1530 (toList!498 lm!252))))))

(declare-fun b!37541 () Bool)

(assert (=> b!37541 (= e!23773 (forall!176 (t!3783 (toList!498 lm!252)) p!304))))

(assert (= (and d!5987 (not res!22712)) b!37540))

(assert (= (and b!37540 res!22713) b!37541))

(declare-fun b_lambda!1975 () Bool)

(assert (=> (not b_lambda!1975) (not b!37540)))

(declare-fun t!3793 () Bool)

(declare-fun tb!811 () Bool)

(assert (=> (and start!5042 (= p!304 p!304) t!3793) tb!811))

(declare-fun result!1353 () Bool)

(assert (=> tb!811 (= result!1353 true)))

(assert (=> b!37540 t!3793))

(declare-fun b_and!2303 () Bool)

(assert (= b_and!2291 (and (=> t!3793 result!1353) b_and!2303)))

(declare-fun m!30273 () Bool)

(assert (=> b!37540 m!30273))

(declare-fun m!30275 () Bool)

(assert (=> b!37541 m!30275))

(assert (=> start!5042 d!5987))

(declare-fun d!5991 () Bool)

(declare-fun isStrictlySorted!176 (List!966) Bool)

(assert (=> d!5991 (= (inv!1646 lm!252) (isStrictlySorted!176 (toList!498 lm!252)))))

(declare-fun bs!1472 () Bool)

(assert (= bs!1472 d!5991))

(declare-fun m!30281 () Bool)

(assert (=> bs!1472 m!30281))

(assert (=> start!5042 d!5991))

(declare-fun d!5995 () Bool)

(declare-fun get!641 (Option!97) B!752)

(assert (=> d!5995 (= (apply!49 lm!252 k0!388) (get!641 (getValueByKey!91 (toList!498 lm!252) k0!388)))))

(declare-fun bs!1474 () Bool)

(assert (= bs!1474 d!5995))

(assert (=> bs!1474 m!30267))

(assert (=> bs!1474 m!30267))

(declare-fun m!30291 () Bool)

(assert (=> bs!1474 m!30291))

(assert (=> b!37476 d!5995))

(declare-fun b!37562 () Bool)

(declare-fun e!23787 () Bool)

(declare-fun tp_is_empty!1676 () Bool)

(declare-fun tp!5561 () Bool)

(assert (=> b!37562 (= e!23787 (and tp_is_empty!1676 tp!5561))))

(assert (=> b!37477 (= tp!5542 e!23787)))

(assert (= (and b!37477 ((_ is Cons!962) (toList!498 lm!252))) b!37562))

(declare-fun b_lambda!1981 () Bool)

(assert (= b_lambda!1975 (or (and start!5042 b_free!1345) b_lambda!1981)))

(check-sat (not b_lambda!1967) b_and!2303 tp_is_empty!1676 (not b_lambda!1981) (not d!5971) (not b!37541) (not d!5995) (not b!37529) (not b_next!1345) (not d!5965) (not d!5991) (not b!37562) (not b!37531))
(check-sat b_and!2303 (not b_next!1345))
(get-model)

(declare-fun d!5999 () Bool)

(declare-fun res!22723 () Bool)

(declare-fun e!23795 () Bool)

(assert (=> d!5999 (=> res!22723 e!23795)))

(assert (=> d!5999 (= res!22723 (or ((_ is Nil!963) (toList!498 lm!252)) ((_ is Nil!963) (t!3783 (toList!498 lm!252)))))))

(assert (=> d!5999 (= (isStrictlySorted!176 (toList!498 lm!252)) e!23795)))

(declare-fun b!37572 () Bool)

(declare-fun e!23796 () Bool)

(assert (=> b!37572 (= e!23795 e!23796)))

(declare-fun res!22724 () Bool)

(assert (=> b!37572 (=> (not res!22724) (not e!23796))))

(assert (=> b!37572 (= res!22724 (bvslt (_1!708 (h!1530 (toList!498 lm!252))) (_1!708 (h!1530 (t!3783 (toList!498 lm!252))))))))

(declare-fun b!37573 () Bool)

(assert (=> b!37573 (= e!23796 (isStrictlySorted!176 (t!3783 (toList!498 lm!252))))))

(assert (= (and d!5999 (not res!22723)) b!37572))

(assert (= (and b!37572 res!22724) b!37573))

(declare-fun m!30295 () Bool)

(assert (=> b!37573 m!30295))

(assert (=> d!5991 d!5999))

(declare-fun d!6001 () Bool)

(declare-fun isEmpty!224 (Option!97) Bool)

(assert (=> d!6001 (= (isDefined!52 (getValueByKey!91 (toList!498 lm!252) k0!388)) (not (isEmpty!224 (getValueByKey!91 (toList!498 lm!252) k0!388))))))

(declare-fun bs!1476 () Bool)

(assert (= bs!1476 d!6001))

(assert (=> bs!1476 m!30267))

(declare-fun m!30297 () Bool)

(assert (=> bs!1476 m!30297))

(assert (=> b!37531 d!6001))

(declare-fun b!37590 () Bool)

(declare-fun e!23808 () Option!97)

(assert (=> b!37590 (= e!23808 (getValueByKey!91 (t!3783 (toList!498 lm!252)) k0!388))))

(declare-fun d!6003 () Bool)

(declare-fun c!4326 () Bool)

(assert (=> d!6003 (= c!4326 (and ((_ is Cons!962) (toList!498 lm!252)) (= (_1!708 (h!1530 (toList!498 lm!252))) k0!388)))))

(declare-fun e!23807 () Option!97)

(assert (=> d!6003 (= (getValueByKey!91 (toList!498 lm!252) k0!388) e!23807)))

(declare-fun b!37591 () Bool)

(assert (=> b!37591 (= e!23808 None!95)))

(declare-fun b!37588 () Bool)

(assert (=> b!37588 (= e!23807 (Some!96 (_2!708 (h!1530 (toList!498 lm!252)))))))

(declare-fun b!37589 () Bool)

(assert (=> b!37589 (= e!23807 e!23808)))

(declare-fun c!4327 () Bool)

(assert (=> b!37589 (= c!4327 (and ((_ is Cons!962) (toList!498 lm!252)) (not (= (_1!708 (h!1530 (toList!498 lm!252))) k0!388))))))

(assert (= (and d!6003 c!4326) b!37588))

(assert (= (and d!6003 (not c!4326)) b!37589))

(assert (= (and b!37589 c!4327) b!37590))

(assert (= (and b!37589 (not c!4327)) b!37591))

(declare-fun m!30301 () Bool)

(assert (=> b!37590 m!30301))

(assert (=> b!37531 d!6003))

(declare-fun d!6009 () Bool)

(assert (=> d!6009 (isDefined!52 (getValueByKey!91 (toList!498 lm!252) k0!388))))

(declare-fun lt!13828 () Unit!866)

(declare-fun choose!238 (List!966 (_ BitVec 64)) Unit!866)

(assert (=> d!6009 (= lt!13828 (choose!238 (toList!498 lm!252) k0!388))))

(declare-fun e!23815 () Bool)

(assert (=> d!6009 e!23815))

(declare-fun res!22733 () Bool)

(assert (=> d!6009 (=> (not res!22733) (not e!23815))))

(assert (=> d!6009 (= res!22733 (isStrictlySorted!176 (toList!498 lm!252)))))

(assert (=> d!6009 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!51 (toList!498 lm!252) k0!388) lt!13828)))

(declare-fun b!37602 () Bool)

(assert (=> b!37602 (= e!23815 (containsKey!54 (toList!498 lm!252) k0!388))))

(assert (= (and d!6009 res!22733) b!37602))

(assert (=> d!6009 m!30267))

(assert (=> d!6009 m!30267))

(assert (=> d!6009 m!30269))

(declare-fun m!30305 () Bool)

(assert (=> d!6009 m!30305))

(assert (=> d!6009 m!30281))

(assert (=> b!37602 m!30263))

(assert (=> b!37529 d!6009))

(assert (=> b!37529 d!6001))

(assert (=> b!37529 d!6003))

(declare-fun d!6013 () Bool)

(assert (=> d!6013 (= (get!641 (getValueByKey!91 (toList!498 lm!252) k0!388)) (v!1965 (getValueByKey!91 (toList!498 lm!252) k0!388)))))

(assert (=> d!5995 d!6013))

(assert (=> d!5995 d!6003))

(declare-fun d!6015 () Bool)

(declare-fun res!22746 () Bool)

(declare-fun e!23830 () Bool)

(assert (=> d!6015 (=> res!22746 e!23830)))

(assert (=> d!6015 (= res!22746 (and ((_ is Cons!962) (toList!498 lm!252)) (= (_1!708 (h!1530 (toList!498 lm!252))) k0!388)))))

(assert (=> d!6015 (= (containsKey!54 (toList!498 lm!252) k0!388) e!23830)))

(declare-fun b!37619 () Bool)

(declare-fun e!23831 () Bool)

(assert (=> b!37619 (= e!23830 e!23831)))

(declare-fun res!22747 () Bool)

(assert (=> b!37619 (=> (not res!22747) (not e!23831))))

(assert (=> b!37619 (= res!22747 (and (or (not ((_ is Cons!962) (toList!498 lm!252))) (bvsle (_1!708 (h!1530 (toList!498 lm!252))) k0!388)) ((_ is Cons!962) (toList!498 lm!252)) (bvslt (_1!708 (h!1530 (toList!498 lm!252))) k0!388)))))

(declare-fun b!37620 () Bool)

(assert (=> b!37620 (= e!23831 (containsKey!54 (t!3783 (toList!498 lm!252)) k0!388))))

(assert (= (and d!6015 (not res!22746)) b!37619))

(assert (= (and b!37619 res!22747) b!37620))

(declare-fun m!30315 () Bool)

(assert (=> b!37620 m!30315))

(assert (=> d!5971 d!6015))

(declare-fun d!6025 () Bool)

(assert (=> d!6025 (= (isEmpty!221 (toList!498 lm!252)) ((_ is Nil!963) (toList!498 lm!252)))))

(assert (=> d!5965 d!6025))

(declare-fun d!6029 () Bool)

(declare-fun res!22750 () Bool)

(declare-fun e!23834 () Bool)

(assert (=> d!6029 (=> res!22750 e!23834)))

(assert (=> d!6029 (= res!22750 ((_ is Nil!963) (t!3783 (toList!498 lm!252))))))

(assert (=> d!6029 (= (forall!176 (t!3783 (toList!498 lm!252)) p!304) e!23834)))

(declare-fun b!37623 () Bool)

(declare-fun e!23835 () Bool)

(assert (=> b!37623 (= e!23834 e!23835)))

(declare-fun res!22751 () Bool)

(assert (=> b!37623 (=> (not res!22751) (not e!23835))))

(assert (=> b!37623 (= res!22751 (dynLambda!174 p!304 (h!1530 (t!3783 (toList!498 lm!252)))))))

(declare-fun b!37624 () Bool)

(assert (=> b!37624 (= e!23835 (forall!176 (t!3783 (t!3783 (toList!498 lm!252))) p!304))))

(assert (= (and d!6029 (not res!22750)) b!37623))

(assert (= (and b!37623 res!22751) b!37624))

(declare-fun b_lambda!1987 () Bool)

(assert (=> (not b_lambda!1987) (not b!37623)))

(declare-fun t!3799 () Bool)

(declare-fun tb!817 () Bool)

(assert (=> (and start!5042 (= p!304 p!304) t!3799) tb!817))

(declare-fun result!1365 () Bool)

(assert (=> tb!817 (= result!1365 true)))

(assert (=> b!37623 t!3799))

(declare-fun b_and!2309 () Bool)

(assert (= b_and!2303 (and (=> t!3799 result!1365) b_and!2309)))

(declare-fun m!30321 () Bool)

(assert (=> b!37623 m!30321))

(declare-fun m!30323 () Bool)

(assert (=> b!37624 m!30323))

(assert (=> b!37541 d!6029))

(declare-fun b!37626 () Bool)

(declare-fun e!23837 () Bool)

(declare-fun tp!5565 () Bool)

(assert (=> b!37626 (= e!23837 (and tp_is_empty!1676 tp!5565))))

(assert (=> b!37562 (= tp!5561 e!23837)))

(assert (= (and b!37562 ((_ is Cons!962) (t!3783 (toList!498 lm!252)))) b!37626))

(declare-fun b_lambda!1989 () Bool)

(assert (= b_lambda!1987 (or (and start!5042 b_free!1345) b_lambda!1989)))

(check-sat (not b_lambda!1967) (not d!6009) (not b!37620) tp_is_empty!1676 (not b_lambda!1989) (not b!37590) b_and!2309 (not d!6001) (not b!37602) (not b!37573) (not b_lambda!1981) (not b!37626) (not b!37624) (not b_next!1345))
(check-sat b_and!2309 (not b_next!1345))
