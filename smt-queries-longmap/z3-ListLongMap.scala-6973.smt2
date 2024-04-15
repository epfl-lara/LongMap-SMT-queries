; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88234 () Bool)

(assert start!88234)

(declare-fun b!1016683 () Bool)

(assert (=> b!1016683 true))

(assert (=> b!1016683 true))

(declare-fun b!1016677 () Bool)

(declare-fun res!681956 () Bool)

(declare-fun e!571962 () Bool)

(assert (=> b!1016677 (=> (not res!681956) (not e!571962))))

(declare-datatypes ((List!21570 0))(
  ( (Nil!21567) (Cons!21566 (h!22764 (_ BitVec 64)) (t!30562 List!21570)) )
))
(declare-fun keys!40 () List!21570)

(get-info :version)

(assert (=> b!1016677 (= res!681956 ((_ is Cons!21566) keys!40))))

(declare-fun b!1016678 () Bool)

(declare-fun e!571961 () Bool)

(declare-fun ListPrimitiveSize!124 (List!21570) Int)

(assert (=> b!1016678 (= e!571961 (< (ListPrimitiveSize!124 (t!30562 keys!40)) (ListPrimitiveSize!124 keys!40)))))

(declare-fun b!1016679 () Bool)

(declare-fun res!681954 () Bool)

(assert (=> b!1016679 (=> (not res!681954) (not e!571962))))

(declare-datatypes ((B!1544 0))(
  ( (B!1545 (val!11856 Int)) )
))
(declare-datatypes ((tuple2!15338 0))(
  ( (tuple2!15339 (_1!7680 (_ BitVec 64)) (_2!7680 B!1544)) )
))
(declare-fun newHead!31 () tuple2!15338)

(declare-datatypes ((List!21571 0))(
  ( (Nil!21568) (Cons!21567 (h!22765 tuple2!15338) (t!30563 List!21571)) )
))
(declare-fun l!1114 () List!21571)

(declare-fun head!972 (List!21571) tuple2!15338)

(assert (=> b!1016679 (= res!681954 (bvslt (_1!7680 newHead!31) (_1!7680 (head!972 l!1114))))))

(declare-fun b!1016680 () Bool)

(assert (=> b!1016680 (= e!571962 (not e!571961))))

(declare-fun res!681955 () Bool)

(assert (=> b!1016680 (=> res!681955 e!571961)))

(declare-fun lambda!1045 () Int)

(declare-fun forall!290 (List!21570 Int) Bool)

(assert (=> b!1016680 (= res!681955 (not (forall!290 (t!30562 keys!40) lambda!1045)))))

(declare-fun lt!449136 () List!21571)

(declare-datatypes ((Option!612 0))(
  ( (Some!611 (v!14459 B!1544)) (None!610) )
))
(declare-fun isDefined!410 (Option!612) Bool)

(declare-fun getValueByKey!561 (List!21571 (_ BitVec 64)) Option!612)

(assert (=> b!1016680 (isDefined!410 (getValueByKey!561 lt!449136 (h!22764 keys!40)))))

(declare-datatypes ((Unit!33153 0))(
  ( (Unit!33154) )
))
(declare-fun lt!449137 () Unit!33153)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!385 (List!21571 (_ BitVec 64)) Unit!33153)

(assert (=> b!1016680 (= lt!449137 (lemmaContainsKeyImpliesGetValueByKeyDefined!385 lt!449136 (h!22764 keys!40)))))

(assert (=> b!1016680 (= lt!449136 (Cons!21567 newHead!31 l!1114))))

(declare-fun containsKey!496 (List!21571 (_ BitVec 64)) Bool)

(assert (=> b!1016680 (containsKey!496 l!1114 (h!22764 keys!40))))

(declare-fun lt!449135 () Unit!33153)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!16 (List!21571 (_ BitVec 64)) Unit!33153)

(assert (=> b!1016680 (= lt!449135 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!16 l!1114 (h!22764 keys!40)))))

(declare-fun b!1016681 () Bool)

(declare-fun res!681959 () Bool)

(assert (=> b!1016681 (=> (not res!681959) (not e!571962))))

(declare-fun isEmpty!897 (List!21571) Bool)

(assert (=> b!1016681 (= res!681959 (not (isEmpty!897 l!1114)))))

(declare-fun b!1016682 () Bool)

(declare-fun e!571960 () Bool)

(declare-fun tp_is_empty!23611 () Bool)

(declare-fun tp!70811 () Bool)

(assert (=> b!1016682 (= e!571960 (and tp_is_empty!23611 tp!70811))))

(declare-fun res!681957 () Bool)

(assert (=> start!88234 (=> (not res!681957) (not e!571962))))

(declare-fun isStrictlySorted!620 (List!21571) Bool)

(assert (=> start!88234 (= res!681957 (isStrictlySorted!620 l!1114))))

(assert (=> start!88234 e!571962))

(assert (=> start!88234 e!571960))

(assert (=> start!88234 true))

(assert (=> start!88234 tp_is_empty!23611))

(declare-fun res!681958 () Bool)

(assert (=> b!1016683 (=> (not res!681958) (not e!571962))))

(assert (=> b!1016683 (= res!681958 (forall!290 keys!40 lambda!1045))))

(assert (= (and start!88234 res!681957) b!1016681))

(assert (= (and b!1016681 res!681959) b!1016683))

(assert (= (and b!1016683 res!681958) b!1016679))

(assert (= (and b!1016679 res!681954) b!1016677))

(assert (= (and b!1016677 res!681956) b!1016680))

(assert (= (and b!1016680 (not res!681955)) b!1016678))

(assert (= (and start!88234 ((_ is Cons!21567) l!1114)) b!1016682))

(declare-fun m!937735 () Bool)

(assert (=> b!1016681 m!937735))

(declare-fun m!937737 () Bool)

(assert (=> start!88234 m!937737))

(declare-fun m!937739 () Bool)

(assert (=> b!1016680 m!937739))

(declare-fun m!937741 () Bool)

(assert (=> b!1016680 m!937741))

(declare-fun m!937743 () Bool)

(assert (=> b!1016680 m!937743))

(declare-fun m!937745 () Bool)

(assert (=> b!1016680 m!937745))

(declare-fun m!937747 () Bool)

(assert (=> b!1016680 m!937747))

(declare-fun m!937749 () Bool)

(assert (=> b!1016680 m!937749))

(assert (=> b!1016680 m!937745))

(declare-fun m!937751 () Bool)

(assert (=> b!1016678 m!937751))

(declare-fun m!937753 () Bool)

(assert (=> b!1016678 m!937753))

(declare-fun m!937755 () Bool)

(assert (=> b!1016679 m!937755))

(declare-fun m!937757 () Bool)

(assert (=> b!1016683 m!937757))

(check-sat (not start!88234) (not b!1016678) (not b!1016680) tp_is_empty!23611 (not b!1016682) (not b!1016683) (not b!1016679) (not b!1016681))
(check-sat)
(get-model)

(declare-fun d!121239 () Bool)

(declare-fun lt!449158 () Int)

(assert (=> d!121239 (>= lt!449158 0)))

(declare-fun e!571983 () Int)

(assert (=> d!121239 (= lt!449158 e!571983)))

(declare-fun c!102927 () Bool)

(assert (=> d!121239 (= c!102927 ((_ is Nil!21567) (t!30562 keys!40)))))

(assert (=> d!121239 (= (ListPrimitiveSize!124 (t!30562 keys!40)) lt!449158)))

(declare-fun b!1016742 () Bool)

(assert (=> b!1016742 (= e!571983 0)))

(declare-fun b!1016743 () Bool)

(assert (=> b!1016743 (= e!571983 (+ 1 (ListPrimitiveSize!124 (t!30562 (t!30562 keys!40)))))))

(assert (= (and d!121239 c!102927) b!1016742))

(assert (= (and d!121239 (not c!102927)) b!1016743))

(declare-fun m!937807 () Bool)

(assert (=> b!1016743 m!937807))

(assert (=> b!1016678 d!121239))

(declare-fun d!121241 () Bool)

(declare-fun lt!449159 () Int)

(assert (=> d!121241 (>= lt!449159 0)))

(declare-fun e!571984 () Int)

(assert (=> d!121241 (= lt!449159 e!571984)))

(declare-fun c!102928 () Bool)

(assert (=> d!121241 (= c!102928 ((_ is Nil!21567) keys!40))))

(assert (=> d!121241 (= (ListPrimitiveSize!124 keys!40) lt!449159)))

(declare-fun b!1016744 () Bool)

(assert (=> b!1016744 (= e!571984 0)))

(declare-fun b!1016745 () Bool)

(assert (=> b!1016745 (= e!571984 (+ 1 (ListPrimitiveSize!124 (t!30562 keys!40))))))

(assert (= (and d!121241 c!102928) b!1016744))

(assert (= (and d!121241 (not c!102928)) b!1016745))

(assert (=> b!1016745 m!937751))

(assert (=> b!1016678 d!121241))

(declare-fun d!121243 () Bool)

(declare-fun res!682000 () Bool)

(declare-fun e!571989 () Bool)

(assert (=> d!121243 (=> res!682000 e!571989)))

(assert (=> d!121243 (= res!682000 ((_ is Nil!21567) keys!40))))

(assert (=> d!121243 (= (forall!290 keys!40 lambda!1045) e!571989)))

(declare-fun b!1016750 () Bool)

(declare-fun e!571990 () Bool)

(assert (=> b!1016750 (= e!571989 e!571990)))

(declare-fun res!682001 () Bool)

(assert (=> b!1016750 (=> (not res!682001) (not e!571990))))

(declare-fun dynLambda!1913 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016750 (= res!682001 (dynLambda!1913 lambda!1045 (h!22764 keys!40)))))

(declare-fun b!1016751 () Bool)

(assert (=> b!1016751 (= e!571990 (forall!290 (t!30562 keys!40) lambda!1045))))

(assert (= (and d!121243 (not res!682000)) b!1016750))

(assert (= (and b!1016750 res!682001) b!1016751))

(declare-fun b_lambda!15533 () Bool)

(assert (=> (not b_lambda!15533) (not b!1016750)))

(declare-fun m!937809 () Bool)

(assert (=> b!1016750 m!937809))

(assert (=> b!1016751 m!937741))

(assert (=> b!1016683 d!121243))

(declare-fun d!121247 () Bool)

(assert (=> d!121247 (= (head!972 l!1114) (h!22765 l!1114))))

(assert (=> b!1016679 d!121247))

(declare-fun d!121249 () Bool)

(declare-fun res!682012 () Bool)

(declare-fun e!572001 () Bool)

(assert (=> d!121249 (=> res!682012 e!572001)))

(assert (=> d!121249 (= res!682012 (and ((_ is Cons!21567) l!1114) (= (_1!7680 (h!22765 l!1114)) (h!22764 keys!40))))))

(assert (=> d!121249 (= (containsKey!496 l!1114 (h!22764 keys!40)) e!572001)))

(declare-fun b!1016762 () Bool)

(declare-fun e!572002 () Bool)

(assert (=> b!1016762 (= e!572001 e!572002)))

(declare-fun res!682013 () Bool)

(assert (=> b!1016762 (=> (not res!682013) (not e!572002))))

(assert (=> b!1016762 (= res!682013 (and (or (not ((_ is Cons!21567) l!1114)) (bvsle (_1!7680 (h!22765 l!1114)) (h!22764 keys!40))) ((_ is Cons!21567) l!1114) (bvslt (_1!7680 (h!22765 l!1114)) (h!22764 keys!40))))))

(declare-fun b!1016763 () Bool)

(assert (=> b!1016763 (= e!572002 (containsKey!496 (t!30563 l!1114) (h!22764 keys!40)))))

(assert (= (and d!121249 (not res!682012)) b!1016762))

(assert (= (and b!1016762 res!682013) b!1016763))

(declare-fun m!937815 () Bool)

(assert (=> b!1016763 m!937815))

(assert (=> b!1016680 d!121249))

(declare-fun d!121255 () Bool)

(assert (=> d!121255 (isDefined!410 (getValueByKey!561 lt!449136 (h!22764 keys!40)))))

(declare-fun lt!449164 () Unit!33153)

(declare-fun choose!1665 (List!21571 (_ BitVec 64)) Unit!33153)

(assert (=> d!121255 (= lt!449164 (choose!1665 lt!449136 (h!22764 keys!40)))))

(declare-fun e!572011 () Bool)

(assert (=> d!121255 e!572011))

(declare-fun res!682016 () Bool)

(assert (=> d!121255 (=> (not res!682016) (not e!572011))))

(assert (=> d!121255 (= res!682016 (isStrictlySorted!620 lt!449136))))

(assert (=> d!121255 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!385 lt!449136 (h!22764 keys!40)) lt!449164)))

(declare-fun b!1016778 () Bool)

(assert (=> b!1016778 (= e!572011 (containsKey!496 lt!449136 (h!22764 keys!40)))))

(assert (= (and d!121255 res!682016) b!1016778))

(assert (=> d!121255 m!937745))

(assert (=> d!121255 m!937745))

(assert (=> d!121255 m!937747))

(declare-fun m!937817 () Bool)

(assert (=> d!121255 m!937817))

(declare-fun m!937819 () Bool)

(assert (=> d!121255 m!937819))

(declare-fun m!937821 () Bool)

(assert (=> b!1016778 m!937821))

(assert (=> b!1016680 d!121255))

(declare-fun b!1016805 () Bool)

(declare-fun e!572028 () Option!612)

(assert (=> b!1016805 (= e!572028 None!610)))

(declare-fun b!1016802 () Bool)

(declare-fun e!572027 () Option!612)

(assert (=> b!1016802 (= e!572027 (Some!611 (_2!7680 (h!22765 lt!449136))))))

(declare-fun b!1016804 () Bool)

(assert (=> b!1016804 (= e!572028 (getValueByKey!561 (t!30563 lt!449136) (h!22764 keys!40)))))

(declare-fun d!121261 () Bool)

(declare-fun c!102943 () Bool)

(assert (=> d!121261 (= c!102943 (and ((_ is Cons!21567) lt!449136) (= (_1!7680 (h!22765 lt!449136)) (h!22764 keys!40))))))

(assert (=> d!121261 (= (getValueByKey!561 lt!449136 (h!22764 keys!40)) e!572027)))

(declare-fun b!1016803 () Bool)

(assert (=> b!1016803 (= e!572027 e!572028)))

(declare-fun c!102944 () Bool)

(assert (=> b!1016803 (= c!102944 (and ((_ is Cons!21567) lt!449136) (not (= (_1!7680 (h!22765 lt!449136)) (h!22764 keys!40)))))))

(assert (= (and d!121261 c!102943) b!1016802))

(assert (= (and d!121261 (not c!102943)) b!1016803))

(assert (= (and b!1016803 c!102944) b!1016804))

(assert (= (and b!1016803 (not c!102944)) b!1016805))

(declare-fun m!937833 () Bool)

(assert (=> b!1016804 m!937833))

(assert (=> b!1016680 d!121261))

(declare-fun d!121271 () Bool)

(declare-fun isEmpty!901 (Option!612) Bool)

(assert (=> d!121271 (= (isDefined!410 (getValueByKey!561 lt!449136 (h!22764 keys!40))) (not (isEmpty!901 (getValueByKey!561 lt!449136 (h!22764 keys!40)))))))

(declare-fun bs!29511 () Bool)

(assert (= bs!29511 d!121271))

(assert (=> bs!29511 m!937745))

(declare-fun m!937837 () Bool)

(assert (=> bs!29511 m!937837))

(assert (=> b!1016680 d!121271))

(declare-fun d!121275 () Bool)

(assert (=> d!121275 (containsKey!496 l!1114 (h!22764 keys!40))))

(declare-fun lt!449172 () Unit!33153)

(declare-fun choose!1667 (List!21571 (_ BitVec 64)) Unit!33153)

(assert (=> d!121275 (= lt!449172 (choose!1667 l!1114 (h!22764 keys!40)))))

(declare-fun e!572043 () Bool)

(assert (=> d!121275 e!572043))

(declare-fun res!682034 () Bool)

(assert (=> d!121275 (=> (not res!682034) (not e!572043))))

(assert (=> d!121275 (= res!682034 (isStrictlySorted!620 l!1114))))

(assert (=> d!121275 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!16 l!1114 (h!22764 keys!40)) lt!449172)))

(declare-fun b!1016824 () Bool)

(assert (=> b!1016824 (= e!572043 (isDefined!410 (getValueByKey!561 l!1114 (h!22764 keys!40))))))

(assert (= (and d!121275 res!682034) b!1016824))

(assert (=> d!121275 m!937739))

(declare-fun m!937843 () Bool)

(assert (=> d!121275 m!937843))

(assert (=> d!121275 m!937737))

(declare-fun m!937845 () Bool)

(assert (=> b!1016824 m!937845))

(assert (=> b!1016824 m!937845))

(declare-fun m!937847 () Bool)

(assert (=> b!1016824 m!937847))

(assert (=> b!1016680 d!121275))

(declare-fun d!121279 () Bool)

(declare-fun res!682035 () Bool)

(declare-fun e!572044 () Bool)

(assert (=> d!121279 (=> res!682035 e!572044)))

(assert (=> d!121279 (= res!682035 ((_ is Nil!21567) (t!30562 keys!40)))))

(assert (=> d!121279 (= (forall!290 (t!30562 keys!40) lambda!1045) e!572044)))

(declare-fun b!1016825 () Bool)

(declare-fun e!572045 () Bool)

(assert (=> b!1016825 (= e!572044 e!572045)))

(declare-fun res!682036 () Bool)

(assert (=> b!1016825 (=> (not res!682036) (not e!572045))))

(assert (=> b!1016825 (= res!682036 (dynLambda!1913 lambda!1045 (h!22764 (t!30562 keys!40))))))

(declare-fun b!1016826 () Bool)

(assert (=> b!1016826 (= e!572045 (forall!290 (t!30562 (t!30562 keys!40)) lambda!1045))))

(assert (= (and d!121279 (not res!682035)) b!1016825))

(assert (= (and b!1016825 res!682036) b!1016826))

(declare-fun b_lambda!15537 () Bool)

(assert (=> (not b_lambda!15537) (not b!1016825)))

(declare-fun m!937849 () Bool)

(assert (=> b!1016825 m!937849))

(declare-fun m!937851 () Bool)

(assert (=> b!1016826 m!937851))

(assert (=> b!1016680 d!121279))

(declare-fun d!121281 () Bool)

(declare-fun res!682050 () Bool)

(declare-fun e!572061 () Bool)

(assert (=> d!121281 (=> res!682050 e!572061)))

(assert (=> d!121281 (= res!682050 (or ((_ is Nil!21568) l!1114) ((_ is Nil!21568) (t!30563 l!1114))))))

(assert (=> d!121281 (= (isStrictlySorted!620 l!1114) e!572061)))

(declare-fun b!1016844 () Bool)

(declare-fun e!572062 () Bool)

(assert (=> b!1016844 (= e!572061 e!572062)))

(declare-fun res!682051 () Bool)

(assert (=> b!1016844 (=> (not res!682051) (not e!572062))))

(assert (=> b!1016844 (= res!682051 (bvslt (_1!7680 (h!22765 l!1114)) (_1!7680 (h!22765 (t!30563 l!1114)))))))

(declare-fun b!1016845 () Bool)

(assert (=> b!1016845 (= e!572062 (isStrictlySorted!620 (t!30563 l!1114)))))

(assert (= (and d!121281 (not res!682050)) b!1016844))

(assert (= (and b!1016844 res!682051) b!1016845))

(declare-fun m!937863 () Bool)

(assert (=> b!1016845 m!937863))

(assert (=> start!88234 d!121281))

(declare-fun d!121289 () Bool)

(assert (=> d!121289 (= (isEmpty!897 l!1114) ((_ is Nil!21568) l!1114))))

(assert (=> b!1016681 d!121289))

(declare-fun b!1016856 () Bool)

(declare-fun e!572071 () Bool)

(declare-fun tp!70820 () Bool)

(assert (=> b!1016856 (= e!572071 (and tp_is_empty!23611 tp!70820))))

(assert (=> b!1016682 (= tp!70811 e!572071)))

(assert (= (and b!1016682 ((_ is Cons!21567) (t!30563 l!1114))) b!1016856))

(declare-fun b_lambda!15541 () Bool)

(assert (= b_lambda!15533 (or b!1016683 b_lambda!15541)))

(declare-fun bs!29513 () Bool)

(declare-fun d!121295 () Bool)

(assert (= bs!29513 (and d!121295 b!1016683)))

(declare-fun value!178 () B!1544)

(assert (=> bs!29513 (= (dynLambda!1913 lambda!1045 (h!22764 keys!40)) (= (getValueByKey!561 l!1114 (h!22764 keys!40)) (Some!611 value!178)))))

(assert (=> bs!29513 m!937845))

(assert (=> b!1016750 d!121295))

(declare-fun b_lambda!15543 () Bool)

(assert (= b_lambda!15537 (or b!1016683 b_lambda!15543)))

(declare-fun bs!29514 () Bool)

(declare-fun d!121299 () Bool)

(assert (= bs!29514 (and d!121299 b!1016683)))

(assert (=> bs!29514 (= (dynLambda!1913 lambda!1045 (h!22764 (t!30562 keys!40))) (= (getValueByKey!561 l!1114 (h!22764 (t!30562 keys!40))) (Some!611 value!178)))))

(declare-fun m!937871 () Bool)

(assert (=> bs!29514 m!937871))

(assert (=> b!1016825 d!121299))

(check-sat (not b!1016856) (not d!121255) (not d!121275) (not b!1016743) (not b!1016826) (not bs!29514) (not b!1016778) (not b!1016845) (not b_lambda!15541) (not b!1016824) (not b!1016763) (not b!1016804) (not b!1016751) tp_is_empty!23611 (not b!1016745) (not b_lambda!15543) (not d!121271) (not bs!29513))
(check-sat)
