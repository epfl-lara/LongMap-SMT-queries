; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5040 () Bool)

(assert start!5040)

(declare-fun b_free!1347 () Bool)

(declare-fun b_next!1347 () Bool)

(assert (=> start!5040 (= b_free!1347 (not b_next!1347))))

(declare-fun tp!5549 () Bool)

(declare-fun b_and!2295 () Bool)

(assert (=> start!5040 (= tp!5549 b_and!2295)))

(declare-fun b!37545 () Bool)

(declare-fun e!23772 () Bool)

(declare-fun tp!5548 () Bool)

(assert (=> b!37545 (= e!23772 tp!5548)))

(declare-fun res!22704 () Bool)

(declare-fun e!23771 () Bool)

(assert (=> start!5040 (=> (not res!22704) (not e!23771))))

(declare-datatypes ((B!754 0))(
  ( (B!755 (val!877 Int)) )
))
(declare-datatypes ((tuple2!1414 0))(
  ( (tuple2!1415 (_1!718 (_ BitVec 64)) (_2!718 B!754)) )
))
(declare-datatypes ((List!981 0))(
  ( (Nil!978) (Cons!977 (h!1545 tuple2!1414) (t!3800 List!981)) )
))
(declare-datatypes ((ListLongMap!991 0))(
  ( (ListLongMap!992 (toList!511 List!981)) )
))
(declare-fun lm!252 () ListLongMap!991)

(declare-fun p!304 () Int)

(declare-fun forall!177 (List!981 Int) Bool)

(assert (=> start!5040 (= res!22704 (forall!177 (toList!511 lm!252) p!304))))

(assert (=> start!5040 e!23771))

(declare-fun inv!1647 (ListLongMap!991) Bool)

(assert (=> start!5040 (and (inv!1647 lm!252) e!23772)))

(assert (=> start!5040 tp!5549))

(assert (=> start!5040 true))

(declare-fun b!37546 () Bool)

(declare-fun e!23773 () Bool)

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun head!849 (List!981) tuple2!1414)

(assert (=> b!37546 (= e!23773 (= (_1!718 (head!849 (toList!511 lm!252))) k0!388))))

(declare-fun b!37547 () Bool)

(declare-fun res!22702 () Bool)

(assert (=> b!37547 (=> (not res!22702) (not e!23771))))

(assert (=> b!37547 (= res!22702 e!23773)))

(declare-fun res!22703 () Bool)

(assert (=> b!37547 (=> res!22703 e!23773)))

(declare-fun isEmpty!216 (ListLongMap!991) Bool)

(assert (=> b!37547 (= res!22703 (isEmpty!216 lm!252))))

(declare-fun b!37548 () Bool)

(declare-fun res!22701 () Bool)

(assert (=> b!37548 (=> (not res!22701) (not e!23771))))

(declare-fun contains!462 (ListLongMap!991 (_ BitVec 64)) Bool)

(assert (=> b!37548 (= res!22701 (contains!462 lm!252 k0!388))))

(declare-fun b!37549 () Bool)

(declare-fun dynLambda!179 (Int tuple2!1414) Bool)

(declare-fun apply!50 (ListLongMap!991 (_ BitVec 64)) B!754)

(assert (=> b!37549 (= e!23771 (not (dynLambda!179 p!304 (tuple2!1415 k0!388 (apply!50 lm!252 k0!388)))))))

(assert (= (and start!5040 res!22704) b!37548))

(assert (= (and b!37548 res!22701) b!37547))

(assert (= (and b!37547 (not res!22703)) b!37546))

(assert (= (and b!37547 res!22702) b!37549))

(assert (= start!5040 b!37545))

(declare-fun b_lambda!1963 () Bool)

(assert (=> (not b_lambda!1963) (not b!37549)))

(declare-fun t!3799 () Bool)

(declare-fun tb!805 () Bool)

(assert (=> (and start!5040 (= p!304 p!304) t!3799) tb!805))

(declare-fun result!1347 () Bool)

(assert (=> tb!805 (= result!1347 true)))

(assert (=> b!37549 t!3799))

(declare-fun b_and!2297 () Bool)

(assert (= b_and!2295 (and (=> t!3799 result!1347) b_and!2297)))

(declare-fun m!30339 () Bool)

(assert (=> b!37546 m!30339))

(declare-fun m!30341 () Bool)

(assert (=> start!5040 m!30341))

(declare-fun m!30343 () Bool)

(assert (=> start!5040 m!30343))

(declare-fun m!30345 () Bool)

(assert (=> b!37547 m!30345))

(declare-fun m!30347 () Bool)

(assert (=> b!37548 m!30347))

(declare-fun m!30349 () Bool)

(assert (=> b!37549 m!30349))

(declare-fun m!30351 () Bool)

(assert (=> b!37549 m!30351))

(check-sat b_and!2297 (not b!37547) (not b!37546) (not b!37545) (not start!5040) (not b!37548) (not b_lambda!1963) (not b_next!1347) (not b!37549))
(check-sat b_and!2297 (not b_next!1347))
(get-model)

(declare-fun b_lambda!1971 () Bool)

(assert (= b_lambda!1963 (or (and start!5040 b_free!1347) b_lambda!1971)))

(check-sat b_and!2297 (not b!37548) (not b!37547) (not b!37545) (not start!5040) (not b_next!1347) (not b!37549) (not b!37546) (not b_lambda!1971))
(check-sat b_and!2297 (not b_next!1347))
(get-model)

(declare-fun d!5983 () Bool)

(declare-datatypes ((Option!98 0))(
  ( (Some!97 (v!1966 B!754)) (None!96) )
))
(declare-fun get!642 (Option!98) B!754)

(declare-fun getValueByKey!92 (List!981 (_ BitVec 64)) Option!98)

(assert (=> d!5983 (= (apply!50 lm!252 k0!388) (get!642 (getValueByKey!92 (toList!511 lm!252) k0!388)))))

(declare-fun bs!1470 () Bool)

(assert (= bs!1470 d!5983))

(declare-fun m!30375 () Bool)

(assert (=> bs!1470 m!30375))

(assert (=> bs!1470 m!30375))

(declare-fun m!30377 () Bool)

(assert (=> bs!1470 m!30377))

(assert (=> b!37549 d!5983))

(declare-fun d!5989 () Bool)

(declare-fun isEmpty!219 (List!981) Bool)

(assert (=> d!5989 (= (isEmpty!216 lm!252) (isEmpty!219 (toList!511 lm!252)))))

(declare-fun bs!1472 () Bool)

(assert (= bs!1472 d!5989))

(declare-fun m!30381 () Bool)

(assert (=> bs!1472 m!30381))

(assert (=> b!37547 d!5989))

(declare-fun d!5993 () Bool)

(declare-fun e!23808 () Bool)

(assert (=> d!5993 e!23808))

(declare-fun res!22731 () Bool)

(assert (=> d!5993 (=> res!22731 e!23808)))

(declare-fun lt!13868 () Bool)

(assert (=> d!5993 (= res!22731 (not lt!13868))))

(declare-fun lt!13866 () Bool)

(assert (=> d!5993 (= lt!13868 lt!13866)))

(declare-datatypes ((Unit!865 0))(
  ( (Unit!866) )
))
(declare-fun lt!13867 () Unit!865)

(declare-fun e!23809 () Unit!865)

(assert (=> d!5993 (= lt!13867 e!23809)))

(declare-fun c!4337 () Bool)

(assert (=> d!5993 (= c!4337 lt!13866)))

(declare-fun containsKey!56 (List!981 (_ BitVec 64)) Bool)

(assert (=> d!5993 (= lt!13866 (containsKey!56 (toList!511 lm!252) k0!388))))

(assert (=> d!5993 (= (contains!462 lm!252 k0!388) lt!13868)))

(declare-fun b!37600 () Bool)

(declare-fun lt!13865 () Unit!865)

(assert (=> b!37600 (= e!23809 lt!13865)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!53 (List!981 (_ BitVec 64)) Unit!865)

(assert (=> b!37600 (= lt!13865 (lemmaContainsKeyImpliesGetValueByKeyDefined!53 (toList!511 lm!252) k0!388))))

(declare-fun isDefined!54 (Option!98) Bool)

(assert (=> b!37600 (isDefined!54 (getValueByKey!92 (toList!511 lm!252) k0!388))))

(declare-fun b!37601 () Bool)

(declare-fun Unit!868 () Unit!865)

(assert (=> b!37601 (= e!23809 Unit!868)))

(declare-fun b!37602 () Bool)

(assert (=> b!37602 (= e!23808 (isDefined!54 (getValueByKey!92 (toList!511 lm!252) k0!388)))))

(assert (= (and d!5993 c!4337) b!37600))

(assert (= (and d!5993 (not c!4337)) b!37601))

(assert (= (and d!5993 (not res!22731)) b!37602))

(declare-fun m!30403 () Bool)

(assert (=> d!5993 m!30403))

(declare-fun m!30405 () Bool)

(assert (=> b!37600 m!30405))

(assert (=> b!37600 m!30375))

(assert (=> b!37600 m!30375))

(declare-fun m!30407 () Bool)

(assert (=> b!37600 m!30407))

(assert (=> b!37602 m!30375))

(assert (=> b!37602 m!30375))

(assert (=> b!37602 m!30407))

(assert (=> b!37548 d!5993))

(declare-fun d!6003 () Bool)

(assert (=> d!6003 (= (head!849 (toList!511 lm!252)) (h!1545 (toList!511 lm!252)))))

(assert (=> b!37546 d!6003))

(declare-fun d!6005 () Bool)

(declare-fun res!22742 () Bool)

(declare-fun e!23820 () Bool)

(assert (=> d!6005 (=> res!22742 e!23820)))

(get-info :version)

(assert (=> d!6005 (= res!22742 ((_ is Nil!978) (toList!511 lm!252)))))

(assert (=> d!6005 (= (forall!177 (toList!511 lm!252) p!304) e!23820)))

(declare-fun b!37613 () Bool)

(declare-fun e!23821 () Bool)

(assert (=> b!37613 (= e!23820 e!23821)))

(declare-fun res!22743 () Bool)

(assert (=> b!37613 (=> (not res!22743) (not e!23821))))

(assert (=> b!37613 (= res!22743 (dynLambda!179 p!304 (h!1545 (toList!511 lm!252))))))

(declare-fun b!37614 () Bool)

(assert (=> b!37614 (= e!23821 (forall!177 (t!3800 (toList!511 lm!252)) p!304))))

(assert (= (and d!6005 (not res!22742)) b!37613))

(assert (= (and b!37613 res!22743) b!37614))

(declare-fun b_lambda!1979 () Bool)

(assert (=> (not b_lambda!1979) (not b!37613)))

(declare-fun t!3809 () Bool)

(declare-fun tb!813 () Bool)

(assert (=> (and start!5040 (= p!304 p!304) t!3809) tb!813))

(declare-fun result!1357 () Bool)

(assert (=> tb!813 (= result!1357 true)))

(assert (=> b!37613 t!3809))

(declare-fun b_and!2307 () Bool)

(assert (= b_and!2297 (and (=> t!3809 result!1357) b_and!2307)))

(declare-fun m!30415 () Bool)

(assert (=> b!37613 m!30415))

(declare-fun m!30417 () Bool)

(assert (=> b!37614 m!30417))

(assert (=> start!5040 d!6005))

(declare-fun d!6011 () Bool)

(declare-fun isStrictlySorted!190 (List!981) Bool)

(assert (=> d!6011 (= (inv!1647 lm!252) (isStrictlySorted!190 (toList!511 lm!252)))))

(declare-fun bs!1476 () Bool)

(assert (= bs!1476 d!6011))

(declare-fun m!30419 () Bool)

(assert (=> bs!1476 m!30419))

(assert (=> start!5040 d!6011))

(declare-fun b!37624 () Bool)

(declare-fun e!23827 () Bool)

(declare-fun tp_is_empty!1679 () Bool)

(declare-fun tp!5564 () Bool)

(assert (=> b!37624 (= e!23827 (and tp_is_empty!1679 tp!5564))))

(assert (=> b!37545 (= tp!5548 e!23827)))

(assert (= (and b!37545 ((_ is Cons!977) (toList!511 lm!252))) b!37624))

(declare-fun b_lambda!1983 () Bool)

(assert (= b_lambda!1979 (or (and start!5040 b_free!1347) b_lambda!1983)))

(check-sat (not b!37614) tp_is_empty!1679 (not d!6011) (not b_next!1347) (not d!5993) (not d!5983) (not b!37600) (not b_lambda!1983) (not b!37602) (not d!5989) (not b!37624) b_and!2307 (not b_lambda!1971))
(check-sat b_and!2307 (not b_next!1347))
(get-model)

(declare-fun d!6015 () Bool)

(declare-fun isEmpty!221 (Option!98) Bool)

(assert (=> d!6015 (= (isDefined!54 (getValueByKey!92 (toList!511 lm!252) k0!388)) (not (isEmpty!221 (getValueByKey!92 (toList!511 lm!252) k0!388))))))

(declare-fun bs!1477 () Bool)

(assert (= bs!1477 d!6015))

(assert (=> bs!1477 m!30375))

(declare-fun m!30421 () Bool)

(assert (=> bs!1477 m!30421))

(assert (=> b!37602 d!6015))

(declare-fun b!37650 () Bool)

(declare-fun e!23844 () Option!98)

(declare-fun e!23845 () Option!98)

(assert (=> b!37650 (= e!23844 e!23845)))

(declare-fun c!4347 () Bool)

(assert (=> b!37650 (= c!4347 (and ((_ is Cons!977) (toList!511 lm!252)) (not (= (_1!718 (h!1545 (toList!511 lm!252))) k0!388))))))

(declare-fun b!37649 () Bool)

(assert (=> b!37649 (= e!23844 (Some!97 (_2!718 (h!1545 (toList!511 lm!252)))))))

(declare-fun d!6017 () Bool)

(declare-fun c!4346 () Bool)

(assert (=> d!6017 (= c!4346 (and ((_ is Cons!977) (toList!511 lm!252)) (= (_1!718 (h!1545 (toList!511 lm!252))) k0!388)))))

(assert (=> d!6017 (= (getValueByKey!92 (toList!511 lm!252) k0!388) e!23844)))

(declare-fun b!37651 () Bool)

(assert (=> b!37651 (= e!23845 (getValueByKey!92 (t!3800 (toList!511 lm!252)) k0!388))))

(declare-fun b!37652 () Bool)

(assert (=> b!37652 (= e!23845 None!96)))

(assert (= (and d!6017 c!4346) b!37649))

(assert (= (and d!6017 (not c!4346)) b!37650))

(assert (= (and b!37650 c!4347) b!37651))

(assert (= (and b!37650 (not c!4347)) b!37652))

(declare-fun m!30427 () Bool)

(assert (=> b!37651 m!30427))

(assert (=> b!37602 d!6017))

(declare-fun d!6029 () Bool)

(assert (=> d!6029 (= (get!642 (getValueByKey!92 (toList!511 lm!252) k0!388)) (v!1966 (getValueByKey!92 (toList!511 lm!252) k0!388)))))

(assert (=> d!5983 d!6029))

(assert (=> d!5983 d!6017))

(declare-fun d!6035 () Bool)

(assert (=> d!6035 (isDefined!54 (getValueByKey!92 (toList!511 lm!252) k0!388))))

(declare-fun lt!13877 () Unit!865)

(declare-fun choose!238 (List!981 (_ BitVec 64)) Unit!865)

(assert (=> d!6035 (= lt!13877 (choose!238 (toList!511 lm!252) k0!388))))

(declare-fun e!23860 () Bool)

(assert (=> d!6035 e!23860))

(declare-fun res!22760 () Bool)

(assert (=> d!6035 (=> (not res!22760) (not e!23860))))

(assert (=> d!6035 (= res!22760 (isStrictlySorted!190 (toList!511 lm!252)))))

(assert (=> d!6035 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!53 (toList!511 lm!252) k0!388) lt!13877)))

(declare-fun b!37673 () Bool)

(assert (=> b!37673 (= e!23860 (containsKey!56 (toList!511 lm!252) k0!388))))

(assert (= (and d!6035 res!22760) b!37673))

(assert (=> d!6035 m!30375))

(assert (=> d!6035 m!30375))

(assert (=> d!6035 m!30407))

(declare-fun m!30441 () Bool)

(assert (=> d!6035 m!30441))

(assert (=> d!6035 m!30419))

(assert (=> b!37673 m!30403))

(assert (=> b!37600 d!6035))

(assert (=> b!37600 d!6015))

(assert (=> b!37600 d!6017))

(declare-fun d!6043 () Bool)

(assert (=> d!6043 (= (isEmpty!219 (toList!511 lm!252)) ((_ is Nil!978) (toList!511 lm!252)))))

(assert (=> d!5989 d!6043))

(declare-fun d!6045 () Bool)

(declare-fun res!22775 () Bool)

(declare-fun e!23878 () Bool)

(assert (=> d!6045 (=> res!22775 e!23878)))

(assert (=> d!6045 (= res!22775 (or ((_ is Nil!978) (toList!511 lm!252)) ((_ is Nil!978) (t!3800 (toList!511 lm!252)))))))

(assert (=> d!6045 (= (isStrictlySorted!190 (toList!511 lm!252)) e!23878)))

(declare-fun b!37693 () Bool)

(declare-fun e!23879 () Bool)

(assert (=> b!37693 (= e!23878 e!23879)))

(declare-fun res!22776 () Bool)

(assert (=> b!37693 (=> (not res!22776) (not e!23879))))

(assert (=> b!37693 (= res!22776 (bvslt (_1!718 (h!1545 (toList!511 lm!252))) (_1!718 (h!1545 (t!3800 (toList!511 lm!252))))))))

(declare-fun b!37694 () Bool)

(assert (=> b!37694 (= e!23879 (isStrictlySorted!190 (t!3800 (toList!511 lm!252))))))

(assert (= (and d!6045 (not res!22775)) b!37693))

(assert (= (and b!37693 res!22776) b!37694))

(declare-fun m!30451 () Bool)

(assert (=> b!37694 m!30451))

(assert (=> d!6011 d!6045))

(declare-fun d!6051 () Bool)

(declare-fun res!22785 () Bool)

(declare-fun e!23888 () Bool)

(assert (=> d!6051 (=> res!22785 e!23888)))

(assert (=> d!6051 (= res!22785 (and ((_ is Cons!977) (toList!511 lm!252)) (= (_1!718 (h!1545 (toList!511 lm!252))) k0!388)))))

(assert (=> d!6051 (= (containsKey!56 (toList!511 lm!252) k0!388) e!23888)))

(declare-fun b!37703 () Bool)

(declare-fun e!23889 () Bool)

(assert (=> b!37703 (= e!23888 e!23889)))

(declare-fun res!22786 () Bool)

(assert (=> b!37703 (=> (not res!22786) (not e!23889))))

(assert (=> b!37703 (= res!22786 (and (or (not ((_ is Cons!977) (toList!511 lm!252))) (bvsle (_1!718 (h!1545 (toList!511 lm!252))) k0!388)) ((_ is Cons!977) (toList!511 lm!252)) (bvslt (_1!718 (h!1545 (toList!511 lm!252))) k0!388)))))

(declare-fun b!37704 () Bool)

(assert (=> b!37704 (= e!23889 (containsKey!56 (t!3800 (toList!511 lm!252)) k0!388))))

(assert (= (and d!6051 (not res!22785)) b!37703))

(assert (= (and b!37703 res!22786) b!37704))

(declare-fun m!30455 () Bool)

(assert (=> b!37704 m!30455))

(assert (=> d!5993 d!6051))

(declare-fun d!6057 () Bool)

(declare-fun res!22789 () Bool)

(declare-fun e!23892 () Bool)

(assert (=> d!6057 (=> res!22789 e!23892)))

(assert (=> d!6057 (= res!22789 ((_ is Nil!978) (t!3800 (toList!511 lm!252))))))

(assert (=> d!6057 (= (forall!177 (t!3800 (toList!511 lm!252)) p!304) e!23892)))

(declare-fun b!37707 () Bool)

(declare-fun e!23893 () Bool)

(assert (=> b!37707 (= e!23892 e!23893)))

(declare-fun res!22790 () Bool)

(assert (=> b!37707 (=> (not res!22790) (not e!23893))))

(assert (=> b!37707 (= res!22790 (dynLambda!179 p!304 (h!1545 (t!3800 (toList!511 lm!252)))))))

(declare-fun b!37708 () Bool)

(assert (=> b!37708 (= e!23893 (forall!177 (t!3800 (t!3800 (toList!511 lm!252))) p!304))))

(assert (= (and d!6057 (not res!22789)) b!37707))

(assert (= (and b!37707 res!22790) b!37708))

(declare-fun b_lambda!1991 () Bool)

(assert (=> (not b_lambda!1991) (not b!37707)))

(declare-fun t!3815 () Bool)

(declare-fun tb!819 () Bool)

(assert (=> (and start!5040 (= p!304 p!304) t!3815) tb!819))

(declare-fun result!1367 () Bool)

(assert (=> tb!819 (= result!1367 true)))

(assert (=> b!37707 t!3815))

(declare-fun b_and!2313 () Bool)

(assert (= b_and!2307 (and (=> t!3815 result!1367) b_and!2313)))

(declare-fun m!30457 () Bool)

(assert (=> b!37707 m!30457))

(declare-fun m!30459 () Bool)

(assert (=> b!37708 m!30459))

(assert (=> b!37614 d!6057))

(declare-fun b!37711 () Bool)

(declare-fun e!23896 () Bool)

(declare-fun tp!5566 () Bool)

(assert (=> b!37711 (= e!23896 (and tp_is_empty!1679 tp!5566))))

(assert (=> b!37624 (= tp!5564 e!23896)))

(assert (= (and b!37624 ((_ is Cons!977) (t!3800 (toList!511 lm!252)))) b!37711))

(declare-fun b_lambda!1993 () Bool)

(assert (= b_lambda!1991 (or (and start!5040 b_free!1347) b_lambda!1993)))

(check-sat tp_is_empty!1679 (not d!6035) (not b_next!1347) (not b!37704) (not b!37673) (not b_lambda!1971) (not b_lambda!1993) (not b!37694) (not b!37711) b_and!2313 (not b_lambda!1983) (not d!6015) (not b!37651) (not b!37708))
(check-sat b_and!2313 (not b_next!1347))
