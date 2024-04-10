; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137268 () Bool)

(assert start!137268)

(declare-fun res!1079975 () Bool)

(declare-fun e!882000 () Bool)

(assert (=> start!137268 (=> (not res!1079975) (not e!882000))))

(declare-datatypes ((B!2678 0))(
  ( (B!2679 (val!19701 Int)) )
))
(declare-datatypes ((tuple2!25540 0))(
  ( (tuple2!25541 (_1!12781 (_ BitVec 64)) (_2!12781 B!2678)) )
))
(declare-datatypes ((List!36821 0))(
  ( (Nil!36818) (Cons!36817 (h!38360 tuple2!25540) (t!51735 List!36821)) )
))
(declare-fun l!1390 () List!36821)

(declare-fun isStrictlySorted!1079 (List!36821) Bool)

(assert (=> start!137268 (= res!1079975 (isStrictlySorted!1079 l!1390))))

(assert (=> start!137268 e!882000))

(declare-fun e!882001 () Bool)

(assert (=> start!137268 e!882001))

(assert (=> start!137268 true))

(declare-fun tp_is_empty!39223 () Bool)

(assert (=> start!137268 tp_is_empty!39223))

(declare-fun b!1580864 () Bool)

(declare-fun e!881999 () Bool)

(declare-fun e!882002 () Bool)

(assert (=> b!1580864 (= e!881999 e!882002)))

(declare-fun res!1079978 () Bool)

(assert (=> b!1580864 (=> (not res!1079978) (not e!882002))))

(declare-fun e!881998 () Bool)

(assert (=> b!1580864 (= res!1079978 e!881998)))

(declare-fun res!1079980 () Bool)

(assert (=> b!1580864 (=> res!1079980 e!881998)))

(declare-datatypes ((tuple2!25542 0))(
  ( (tuple2!25543 (_1!12782 tuple2!25540) (_2!12782 List!36821)) )
))
(declare-datatypes ((Option!911 0))(
  ( (Some!910 (v!22417 tuple2!25542)) (None!909) )
))
(declare-fun lt!676830 () Option!911)

(declare-fun isEmpty!1172 (Option!911) Bool)

(assert (=> b!1580864 (= res!1079980 (isEmpty!1172 lt!676830))))

(declare-fun unapply!88 (List!36821) Option!911)

(assert (=> b!1580864 (= lt!676830 (unapply!88 l!1390))))

(declare-fun b!1580865 () Bool)

(declare-fun res!1079977 () Bool)

(assert (=> b!1580865 (=> (not res!1079977) (not e!882002))))

(assert (=> b!1580865 (= res!1079977 (isStrictlySorted!1079 (t!51735 l!1390)))))

(declare-fun b!1580866 () Bool)

(declare-fun res!1079976 () Bool)

(assert (=> b!1580866 (=> (not res!1079976) (not e!882002))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!925 (List!36821 (_ BitVec 64)) Bool)

(assert (=> b!1580866 (= res!1079976 (not (containsKey!925 (t!51735 l!1390) key!405)))))

(declare-fun b!1580867 () Bool)

(declare-fun value!194 () B!2678)

(declare-datatypes ((Option!912 0))(
  ( (Some!911 (v!22418 B!2678)) (None!910) )
))
(declare-fun getValueByKey!817 (List!36821 (_ BitVec 64)) Option!912)

(assert (=> b!1580867 (= e!882002 (not (= (getValueByKey!817 l!1390 key!405) (Some!911 value!194))))))

(declare-fun lt!676829 () tuple2!25540)

(declare-fun contains!10493 (List!36821 tuple2!25540) Bool)

(assert (=> b!1580867 (not (contains!10493 (t!51735 l!1390) lt!676829))))

(declare-datatypes ((Unit!52246 0))(
  ( (Unit!52247) )
))
(declare-fun lt!676828 () Unit!52246)

(declare-fun lemmaNotContainsKeyThenNotContainsTuple!4 (List!36821 (_ BitVec 64) B!2678) Unit!52246)

(assert (=> b!1580867 (= lt!676828 (lemmaNotContainsKeyThenNotContainsTuple!4 (t!51735 l!1390) key!405 value!194))))

(declare-fun b!1580868 () Bool)

(declare-fun res!1079979 () Bool)

(assert (=> b!1580868 (=> (not res!1079979) (not e!882002))))

(assert (=> b!1580868 (= res!1079979 (and (is-Cons!36817 l!1390) (= (_1!12781 (h!38360 l!1390)) key!405)))))

(declare-fun b!1580869 () Bool)

(declare-fun get!26803 (Option!911) tuple2!25542)

(assert (=> b!1580869 (= e!881998 (not (is-Nil!36818 (_2!12782 (get!26803 lt!676830)))))))

(declare-fun b!1580870 () Bool)

(assert (=> b!1580870 (= e!882000 e!881999)))

(declare-fun res!1079981 () Bool)

(assert (=> b!1580870 (=> (not res!1079981) (not e!881999))))

(assert (=> b!1580870 (= res!1079981 (contains!10493 l!1390 lt!676829))))

(assert (=> b!1580870 (= lt!676829 (tuple2!25541 key!405 value!194))))

(declare-fun b!1580871 () Bool)

(declare-fun tp!114524 () Bool)

(assert (=> b!1580871 (= e!882001 (and tp_is_empty!39223 tp!114524))))

(declare-fun b!1580872 () Bool)

(declare-fun res!1079982 () Bool)

(assert (=> b!1580872 (=> (not res!1079982) (not e!882000))))

(assert (=> b!1580872 (= res!1079982 (containsKey!925 l!1390 key!405))))

(assert (= (and start!137268 res!1079975) b!1580872))

(assert (= (and b!1580872 res!1079982) b!1580870))

(assert (= (and b!1580870 res!1079981) b!1580864))

(assert (= (and b!1580864 (not res!1079980)) b!1580869))

(assert (= (and b!1580864 res!1079978) b!1580868))

(assert (= (and b!1580868 res!1079979) b!1580865))

(assert (= (and b!1580865 res!1079977) b!1580866))

(assert (= (and b!1580866 res!1079976) b!1580867))

(assert (= (and start!137268 (is-Cons!36817 l!1390)) b!1580871))

(declare-fun m!1452077 () Bool)

(assert (=> b!1580866 m!1452077))

(declare-fun m!1452079 () Bool)

(assert (=> b!1580869 m!1452079))

(declare-fun m!1452081 () Bool)

(assert (=> b!1580864 m!1452081))

(declare-fun m!1452083 () Bool)

(assert (=> b!1580864 m!1452083))

(declare-fun m!1452085 () Bool)

(assert (=> b!1580870 m!1452085))

(declare-fun m!1452087 () Bool)

(assert (=> start!137268 m!1452087))

(declare-fun m!1452089 () Bool)

(assert (=> b!1580872 m!1452089))

(declare-fun m!1452091 () Bool)

(assert (=> b!1580865 m!1452091))

(declare-fun m!1452093 () Bool)

(assert (=> b!1580867 m!1452093))

(declare-fun m!1452095 () Bool)

(assert (=> b!1580867 m!1452095))

(declare-fun m!1452097 () Bool)

(assert (=> b!1580867 m!1452097))

(push 1)

(assert (not b!1580871))

(assert (not b!1580872))

(assert (not b!1580867))

(assert (not b!1580864))

(assert (not b!1580869))

(assert (not b!1580866))

(assert (not start!137268))

(assert (not b!1580870))

(assert (not b!1580865))

(assert tp_is_empty!39223)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166555 () Bool)

(declare-fun lt!676857 () Bool)

(declare-fun content!842 (List!36821) (Set tuple2!25540))

(assert (=> d!166555 (= lt!676857 (set.member lt!676829 (content!842 l!1390)))))

(declare-fun e!882058 () Bool)

(assert (=> d!166555 (= lt!676857 e!882058)))

(declare-fun res!1080054 () Bool)

(assert (=> d!166555 (=> (not res!1080054) (not e!882058))))

(assert (=> d!166555 (= res!1080054 (is-Cons!36817 l!1390))))

(assert (=> d!166555 (= (contains!10493 l!1390 lt!676829) lt!676857)))

(declare-fun b!1580953 () Bool)

(declare-fun e!882057 () Bool)

(assert (=> b!1580953 (= e!882058 e!882057)))

(declare-fun res!1080053 () Bool)

(assert (=> b!1580953 (=> res!1080053 e!882057)))

(assert (=> b!1580953 (= res!1080053 (= (h!38360 l!1390) lt!676829))))

(declare-fun b!1580954 () Bool)

(assert (=> b!1580954 (= e!882057 (contains!10493 (t!51735 l!1390) lt!676829))))

(assert (= (and d!166555 res!1080054) b!1580953))

(assert (= (and b!1580953 (not res!1080053)) b!1580954))

(declare-fun m!1452151 () Bool)

(assert (=> d!166555 m!1452151))

(declare-fun m!1452153 () Bool)

(assert (=> d!166555 m!1452153))

(assert (=> b!1580954 m!1452095))

(assert (=> b!1580870 d!166555))

(declare-fun d!166563 () Bool)

(declare-fun res!1080067 () Bool)

(declare-fun e!882075 () Bool)

(assert (=> d!166563 (=> res!1080067 e!882075)))

(assert (=> d!166563 (= res!1080067 (or (is-Nil!36818 (t!51735 l!1390)) (is-Nil!36818 (t!51735 (t!51735 l!1390)))))))

(assert (=> d!166563 (= (isStrictlySorted!1079 (t!51735 l!1390)) e!882075)))

(declare-fun b!1580975 () Bool)

(declare-fun e!882076 () Bool)

(assert (=> b!1580975 (= e!882075 e!882076)))

(declare-fun res!1080068 () Bool)

(assert (=> b!1580975 (=> (not res!1080068) (not e!882076))))

(assert (=> b!1580975 (= res!1080068 (bvslt (_1!12781 (h!38360 (t!51735 l!1390))) (_1!12781 (h!38360 (t!51735 (t!51735 l!1390))))))))

(declare-fun b!1580976 () Bool)

(assert (=> b!1580976 (= e!882076 (isStrictlySorted!1079 (t!51735 (t!51735 l!1390))))))

(assert (= (and d!166563 (not res!1080067)) b!1580975))

(assert (= (and b!1580975 res!1080068) b!1580976))

(declare-fun m!1452163 () Bool)

(assert (=> b!1580976 m!1452163))

(assert (=> b!1580865 d!166563))

(declare-fun d!166571 () Bool)

(assert (=> d!166571 (= (isEmpty!1172 lt!676830) (not (is-Some!910 lt!676830)))))

(assert (=> b!1580864 d!166571))

(declare-fun d!166575 () Bool)

(assert (=> d!166575 (= (unapply!88 l!1390) (ite (is-Nil!36818 l!1390) None!909 (Some!910 (tuple2!25543 (h!38360 l!1390) (t!51735 l!1390)))))))

(assert (=> b!1580864 d!166575))

(declare-fun d!166579 () Bool)

(assert (=> d!166579 (= (get!26803 lt!676830) (v!22417 lt!676830))))

(assert (=> b!1580869 d!166579))

(declare-fun b!1581003 () Bool)

(declare-fun e!882099 () Option!912)

(assert (=> b!1581003 (= e!882099 None!910)))

(declare-fun b!1581000 () Bool)

(declare-fun e!882098 () Option!912)

(assert (=> b!1581000 (= e!882098 (Some!911 (_2!12781 (h!38360 l!1390))))))

(declare-fun b!1581002 () Bool)

(assert (=> b!1581002 (= e!882099 (getValueByKey!817 (t!51735 l!1390) key!405))))

(declare-fun b!1581001 () Bool)

(assert (=> b!1581001 (= e!882098 e!882099)))

(declare-fun c!146572 () Bool)

(assert (=> b!1581001 (= c!146572 (and (is-Cons!36817 l!1390) (not (= (_1!12781 (h!38360 l!1390)) key!405))))))

(declare-fun d!166581 () Bool)

(declare-fun c!146571 () Bool)

(assert (=> d!166581 (= c!146571 (and (is-Cons!36817 l!1390) (= (_1!12781 (h!38360 l!1390)) key!405)))))

(assert (=> d!166581 (= (getValueByKey!817 l!1390 key!405) e!882098)))

(assert (= (and d!166581 c!146571) b!1581000))

(assert (= (and d!166581 (not c!146571)) b!1581001))

(assert (= (and b!1581001 c!146572) b!1581002))

(assert (= (and b!1581001 (not c!146572)) b!1581003))

(declare-fun m!1452173 () Bool)

(assert (=> b!1581002 m!1452173))

(assert (=> b!1580867 d!166581))

(declare-fun d!166593 () Bool)

(declare-fun lt!676862 () Bool)

(assert (=> d!166593 (= lt!676862 (set.member lt!676829 (content!842 (t!51735 l!1390))))))

(declare-fun e!882101 () Bool)

(assert (=> d!166593 (= lt!676862 e!882101)))

(declare-fun res!1080087 () Bool)

(assert (=> d!166593 (=> (not res!1080087) (not e!882101))))

(assert (=> d!166593 (= res!1080087 (is-Cons!36817 (t!51735 l!1390)))))

(assert (=> d!166593 (= (contains!10493 (t!51735 l!1390) lt!676829) lt!676862)))

(declare-fun b!1581006 () Bool)

(declare-fun e!882100 () Bool)

(assert (=> b!1581006 (= e!882101 e!882100)))

(declare-fun res!1080086 () Bool)

(assert (=> b!1581006 (=> res!1080086 e!882100)))

(assert (=> b!1581006 (= res!1080086 (= (h!38360 (t!51735 l!1390)) lt!676829))))

(declare-fun b!1581007 () Bool)

(assert (=> b!1581007 (= e!882100 (contains!10493 (t!51735 (t!51735 l!1390)) lt!676829))))

(assert (= (and d!166593 res!1080087) b!1581006))

(assert (= (and b!1581006 (not res!1080086)) b!1581007))

(declare-fun m!1452175 () Bool)

(assert (=> d!166593 m!1452175))

(declare-fun m!1452177 () Bool)

(assert (=> d!166593 m!1452177))

(declare-fun m!1452179 () Bool)

(assert (=> b!1581007 m!1452179))

(assert (=> b!1580867 d!166593))

(declare-fun d!166595 () Bool)

(assert (=> d!166595 (not (contains!10493 (t!51735 l!1390) (tuple2!25541 key!405 value!194)))))

(declare-fun lt!676866 () Unit!52246)

(declare-fun choose!2097 (List!36821 (_ BitVec 64) B!2678) Unit!52246)

(assert (=> d!166595 (= lt!676866 (choose!2097 (t!51735 l!1390) key!405 value!194))))

(declare-fun e!882119 () Bool)

(assert (=> d!166595 e!882119))

(declare-fun res!1080096 () Bool)

(assert (=> d!166595 (=> (not res!1080096) (not e!882119))))

(assert (=> d!166595 (= res!1080096 (isStrictlySorted!1079 (t!51735 l!1390)))))

(assert (=> d!166595 (= (lemmaNotContainsKeyThenNotContainsTuple!4 (t!51735 l!1390) key!405 value!194) lt!676866)))

(declare-fun b!1581033 () Bool)

(assert (=> b!1581033 (= e!882119 (not (containsKey!925 (t!51735 l!1390) key!405)))))

(assert (= (and d!166595 res!1080096) b!1581033))

(declare-fun m!1452191 () Bool)

(assert (=> d!166595 m!1452191))

(declare-fun m!1452193 () Bool)

(assert (=> d!166595 m!1452193))

(assert (=> d!166595 m!1452091))

(assert (=> b!1581033 m!1452077))

(assert (=> b!1580867 d!166595))

(declare-fun d!166607 () Bool)

(declare-fun res!1080106 () Bool)

(declare-fun e!882129 () Bool)

(assert (=> d!166607 (=> res!1080106 e!882129)))

(assert (=> d!166607 (= res!1080106 (and (is-Cons!36817 (t!51735 l!1390)) (= (_1!12781 (h!38360 (t!51735 l!1390))) key!405)))))

(assert (=> d!166607 (= (containsKey!925 (t!51735 l!1390) key!405) e!882129)))

(declare-fun b!1581043 () Bool)

(declare-fun e!882130 () Bool)

(assert (=> b!1581043 (= e!882129 e!882130)))

(declare-fun res!1080107 () Bool)

(assert (=> b!1581043 (=> (not res!1080107) (not e!882130))))

(assert (=> b!1581043 (= res!1080107 (and (or (not (is-Cons!36817 (t!51735 l!1390))) (bvsle (_1!12781 (h!38360 (t!51735 l!1390))) key!405)) (is-Cons!36817 (t!51735 l!1390)) (bvslt (_1!12781 (h!38360 (t!51735 l!1390))) key!405)))))

(declare-fun b!1581044 () Bool)

(assert (=> b!1581044 (= e!882130 (containsKey!925 (t!51735 (t!51735 l!1390)) key!405))))

(assert (= (and d!166607 (not res!1080106)) b!1581043))

(assert (= (and b!1581043 res!1080107) b!1581044))

(declare-fun m!1452201 () Bool)

(assert (=> b!1581044 m!1452201))

(assert (=> b!1580866 d!166607))

(declare-fun d!166611 () Bool)

(declare-fun res!1080108 () Bool)

(declare-fun e!882133 () Bool)

(assert (=> d!166611 (=> res!1080108 e!882133)))

(assert (=> d!166611 (= res!1080108 (or (is-Nil!36818 l!1390) (is-Nil!36818 (t!51735 l!1390))))))

(assert (=> d!166611 (= (isStrictlySorted!1079 l!1390) e!882133)))

(declare-fun b!1581049 () Bool)

(declare-fun e!882134 () Bool)

(assert (=> b!1581049 (= e!882133 e!882134)))

(declare-fun res!1080109 () Bool)

(assert (=> b!1581049 (=> (not res!1080109) (not e!882134))))

(assert (=> b!1581049 (= res!1080109 (bvslt (_1!12781 (h!38360 l!1390)) (_1!12781 (h!38360 (t!51735 l!1390)))))))

(declare-fun b!1581050 () Bool)

(assert (=> b!1581050 (= e!882134 (isStrictlySorted!1079 (t!51735 l!1390)))))

(assert (= (and d!166611 (not res!1080108)) b!1581049))

(assert (= (and b!1581049 res!1080109) b!1581050))

(assert (=> b!1581050 m!1452091))

(assert (=> start!137268 d!166611))

(declare-fun d!166613 () Bool)

(declare-fun res!1080110 () Bool)

(declare-fun e!882136 () Bool)

(assert (=> d!166613 (=> res!1080110 e!882136)))

(assert (=> d!166613 (= res!1080110 (and (is-Cons!36817 l!1390) (= (_1!12781 (h!38360 l!1390)) key!405)))))

(assert (=> d!166613 (= (containsKey!925 l!1390 key!405) e!882136)))

(declare-fun b!1581052 () Bool)

(declare-fun e!882137 () Bool)

(assert (=> b!1581052 (= e!882136 e!882137)))

(declare-fun res!1080111 () Bool)

(assert (=> b!1581052 (=> (not res!1080111) (not e!882137))))

(assert (=> b!1581052 (= res!1080111 (and (or (not (is-Cons!36817 l!1390)) (bvsle (_1!12781 (h!38360 l!1390)) key!405)) (is-Cons!36817 l!1390) (bvslt (_1!12781 (h!38360 l!1390)) key!405)))))

(declare-fun b!1581053 () Bool)

(assert (=> b!1581053 (= e!882137 (containsKey!925 (t!51735 l!1390) key!405))))

(assert (= (and d!166613 (not res!1080110)) b!1581052))

(assert (= (and b!1581052 res!1080111) b!1581053))

(assert (=> b!1581053 m!1452077))

(assert (=> b!1580872 d!166613))

(declare-fun b!1581058 () Bool)

(declare-fun e!882140 () Bool)

(declare-fun tp!114539 () Bool)

(assert (=> b!1581058 (= e!882140 (and tp_is_empty!39223 tp!114539))))

(assert (=> b!1580871 (= tp!114524 e!882140)))

(assert (= (and b!1580871 (is-Cons!36817 (t!51735 l!1390))) b!1581058))

