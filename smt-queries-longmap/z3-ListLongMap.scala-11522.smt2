; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134556 () Bool)

(assert start!134556)

(declare-fun res!1072148 () Bool)

(declare-fun e!875305 () Bool)

(assert (=> start!134556 (=> (not res!1072148) (not e!875305))))

(declare-datatypes ((B!2456 0))(
  ( (B!2457 (val!19590 Int)) )
))
(declare-datatypes ((tuple2!25342 0))(
  ( (tuple2!25343 (_1!12682 (_ BitVec 64)) (_2!12682 B!2456)) )
))
(declare-datatypes ((List!36697 0))(
  ( (Nil!36694) (Cons!36693 (h!38158 tuple2!25342) (t!51597 List!36697)) )
))
(declare-datatypes ((ListLongMap!22785 0))(
  ( (ListLongMap!22786 (toList!11408 List!36697)) )
))
(declare-fun thiss!194 () ListLongMap!22785)

(declare-fun key!103 () (_ BitVec 64))

(declare-fun contains!10412 (ListLongMap!22785 (_ BitVec 64)) Bool)

(assert (=> start!134556 (= res!1072148 (contains!10412 thiss!194 key!103))))

(assert (=> start!134556 e!875305))

(declare-fun e!875306 () Bool)

(declare-fun inv!58004 (ListLongMap!22785) Bool)

(assert (=> start!134556 (and (inv!58004 thiss!194) e!875306)))

(assert (=> start!134556 true))

(declare-fun b!1569962 () Bool)

(declare-datatypes ((Option!867 0))(
  ( (Some!866 (v!22340 B!2456)) (None!865) )
))
(declare-fun isDefined!583 (Option!867) Bool)

(declare-fun getValueByKey!792 (List!36697 (_ BitVec 64)) Option!867)

(assert (=> b!1569962 (= e!875305 (not (isDefined!583 (getValueByKey!792 (toList!11408 thiss!194) key!103))))))

(declare-fun b!1569963 () Bool)

(declare-fun tp!114003 () Bool)

(assert (=> b!1569963 (= e!875306 tp!114003)))

(assert (= (and start!134556 res!1072148) b!1569962))

(assert (= start!134556 b!1569963))

(declare-fun m!1444641 () Bool)

(assert (=> start!134556 m!1444641))

(declare-fun m!1444643 () Bool)

(assert (=> start!134556 m!1444643))

(declare-fun m!1444645 () Bool)

(assert (=> b!1569962 m!1444645))

(assert (=> b!1569962 m!1444645))

(declare-fun m!1444647 () Bool)

(assert (=> b!1569962 m!1444647))

(check-sat (not start!134556) (not b!1569962) (not b!1569963))
(check-sat)
(get-model)

(declare-fun d!164304 () Bool)

(declare-fun e!875333 () Bool)

(assert (=> d!164304 e!875333))

(declare-fun res!1072161 () Bool)

(assert (=> d!164304 (=> res!1072161 e!875333)))

(declare-fun lt!673922 () Bool)

(assert (=> d!164304 (= res!1072161 (not lt!673922))))

(declare-fun lt!673925 () Bool)

(assert (=> d!164304 (= lt!673922 lt!673925)))

(declare-datatypes ((Unit!51974 0))(
  ( (Unit!51975) )
))
(declare-fun lt!673920 () Unit!51974)

(declare-fun e!875332 () Unit!51974)

(assert (=> d!164304 (= lt!673920 e!875332)))

(declare-fun c!145315 () Bool)

(assert (=> d!164304 (= c!145315 lt!673925)))

(declare-fun containsKey!854 (List!36697 (_ BitVec 64)) Bool)

(assert (=> d!164304 (= lt!673925 (containsKey!854 (toList!11408 thiss!194) key!103))))

(assert (=> d!164304 (= (contains!10412 thiss!194 key!103) lt!673922)))

(declare-fun b!1569995 () Bool)

(declare-fun lt!673921 () Unit!51974)

(assert (=> b!1569995 (= e!875332 lt!673921)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!537 (List!36697 (_ BitVec 64)) Unit!51974)

(assert (=> b!1569995 (= lt!673921 (lemmaContainsKeyImpliesGetValueByKeyDefined!537 (toList!11408 thiss!194) key!103))))

(assert (=> b!1569995 (isDefined!583 (getValueByKey!792 (toList!11408 thiss!194) key!103))))

(declare-fun b!1569997 () Bool)

(declare-fun Unit!51978 () Unit!51974)

(assert (=> b!1569997 (= e!875332 Unit!51978)))

(declare-fun b!1569998 () Bool)

(assert (=> b!1569998 (= e!875333 (isDefined!583 (getValueByKey!792 (toList!11408 thiss!194) key!103)))))

(assert (= (and d!164304 c!145315) b!1569995))

(assert (= (and d!164304 (not c!145315)) b!1569997))

(assert (= (and d!164304 (not res!1072161)) b!1569998))

(declare-fun m!1444666 () Bool)

(assert (=> d!164304 m!1444666))

(declare-fun m!1444672 () Bool)

(assert (=> b!1569995 m!1444672))

(assert (=> b!1569995 m!1444645))

(assert (=> b!1569995 m!1444645))

(assert (=> b!1569995 m!1444647))

(assert (=> b!1569998 m!1444645))

(assert (=> b!1569998 m!1444645))

(assert (=> b!1569998 m!1444647))

(assert (=> start!134556 d!164304))

(declare-fun d!164311 () Bool)

(declare-fun isStrictlySorted!977 (List!36697) Bool)

(assert (=> d!164311 (= (inv!58004 thiss!194) (isStrictlySorted!977 (toList!11408 thiss!194)))))

(declare-fun bs!45142 () Bool)

(assert (= bs!45142 d!164311))

(declare-fun m!1444677 () Bool)

(assert (=> bs!45142 m!1444677))

(assert (=> start!134556 d!164311))

(declare-fun d!164315 () Bool)

(declare-fun isEmpty!1154 (Option!867) Bool)

(assert (=> d!164315 (= (isDefined!583 (getValueByKey!792 (toList!11408 thiss!194) key!103)) (not (isEmpty!1154 (getValueByKey!792 (toList!11408 thiss!194) key!103))))))

(declare-fun bs!45145 () Bool)

(assert (= bs!45145 d!164315))

(assert (=> bs!45145 m!1444645))

(declare-fun m!1444683 () Bool)

(assert (=> bs!45145 m!1444683))

(assert (=> b!1569962 d!164315))

(declare-fun b!1570027 () Bool)

(declare-fun e!875349 () Option!867)

(assert (=> b!1570027 (= e!875349 (Some!866 (_2!12682 (h!38158 (toList!11408 thiss!194)))))))

(declare-fun b!1570030 () Bool)

(declare-fun e!875350 () Option!867)

(assert (=> b!1570030 (= e!875350 None!865)))

(declare-fun b!1570028 () Bool)

(assert (=> b!1570028 (= e!875349 e!875350)))

(declare-fun c!145330 () Bool)

(get-info :version)

(assert (=> b!1570028 (= c!145330 (and ((_ is Cons!36693) (toList!11408 thiss!194)) (not (= (_1!12682 (h!38158 (toList!11408 thiss!194))) key!103))))))

(declare-fun d!164321 () Bool)

(declare-fun c!145329 () Bool)

(assert (=> d!164321 (= c!145329 (and ((_ is Cons!36693) (toList!11408 thiss!194)) (= (_1!12682 (h!38158 (toList!11408 thiss!194))) key!103)))))

(assert (=> d!164321 (= (getValueByKey!792 (toList!11408 thiss!194) key!103) e!875349)))

(declare-fun b!1570029 () Bool)

(assert (=> b!1570029 (= e!875350 (getValueByKey!792 (t!51597 (toList!11408 thiss!194)) key!103))))

(assert (= (and d!164321 c!145329) b!1570027))

(assert (= (and d!164321 (not c!145329)) b!1570028))

(assert (= (and b!1570028 c!145330) b!1570029))

(assert (= (and b!1570028 (not c!145330)) b!1570030))

(declare-fun m!1444689 () Bool)

(assert (=> b!1570029 m!1444689))

(assert (=> b!1569962 d!164321))

(declare-fun b!1570052 () Bool)

(declare-fun e!875362 () Bool)

(declare-fun tp_is_empty!39011 () Bool)

(declare-fun tp!114017 () Bool)

(assert (=> b!1570052 (= e!875362 (and tp_is_empty!39011 tp!114017))))

(assert (=> b!1569963 (= tp!114003 e!875362)))

(assert (= (and b!1569963 ((_ is Cons!36693) (toList!11408 thiss!194))) b!1570052))

(check-sat (not b!1570052) (not b!1570029) (not d!164315) (not d!164311) (not b!1569995) tp_is_empty!39011 (not b!1569998) (not d!164304))
(check-sat)
