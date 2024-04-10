; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43000 () Bool)

(assert start!43000)

(declare-fun b_free!12113 () Bool)

(declare-fun b_next!12113 () Bool)

(assert (=> start!43000 (= b_free!12113 (not b_next!12113))))

(declare-fun tp!42442 () Bool)

(declare-fun b_and!20827 () Bool)

(assert (=> start!43000 (= tp!42442 b_and!20827)))

(declare-fun b!477742 () Bool)

(declare-fun res!285127 () Bool)

(declare-fun e!280752 () Bool)

(assert (=> b!477742 (=> (not res!285127) (not e!280752))))

(declare-datatypes ((B!1062 0))(
  ( (B!1063 (val!6815 Int)) )
))
(declare-datatypes ((tuple2!9002 0))(
  ( (tuple2!9003 (_1!4512 (_ BitVec 64)) (_2!4512 B!1062)) )
))
(declare-datatypes ((List!9058 0))(
  ( (Nil!9055) (Cons!9054 (h!9910 tuple2!9002) (t!15225 List!9058)) )
))
(declare-datatypes ((ListLongMap!7915 0))(
  ( (ListLongMap!7916 (toList!3973 List!9058)) )
))
(declare-fun lm!215 () ListLongMap!7915)

(declare-fun isEmpty!611 (ListLongMap!7915) Bool)

(assert (=> b!477742 (= res!285127 (isEmpty!611 lm!215))))

(declare-fun lt!217581 () tuple2!9002)

(declare-fun p!166 () Int)

(declare-fun b!477743 () Bool)

(declare-fun forall!202 (List!9058 Int) Bool)

(declare-fun +!1770 (ListLongMap!7915 tuple2!9002) ListLongMap!7915)

(assert (=> b!477743 (= e!280752 (not (forall!202 (toList!3973 (+!1770 lm!215 lt!217581)) p!166)))))

(declare-fun b!477744 () Bool)

(declare-fun e!280751 () Bool)

(declare-fun tp!42441 () Bool)

(assert (=> b!477744 (= e!280751 tp!42441)))

(declare-fun res!285126 () Bool)

(declare-fun e!280753 () Bool)

(assert (=> start!43000 (=> (not res!285126) (not e!280753))))

(assert (=> start!43000 (= res!285126 (forall!202 (toList!3973 lm!215) p!166))))

(assert (=> start!43000 e!280753))

(declare-fun inv!15505 (ListLongMap!7915) Bool)

(assert (=> start!43000 (and (inv!15505 lm!215) e!280751)))

(assert (=> start!43000 tp!42442))

(declare-fun tp_is_empty!13535 () Bool)

(assert (=> start!43000 tp_is_empty!13535))

(assert (=> start!43000 true))

(declare-fun b!477741 () Bool)

(assert (=> b!477741 (= e!280753 e!280752)))

(declare-fun res!285125 () Bool)

(assert (=> b!477741 (=> (not res!285125) (not e!280752))))

(declare-fun dynLambda!949 (Int tuple2!9002) Bool)

(assert (=> b!477741 (= res!285125 (dynLambda!949 p!166 lt!217581))))

(declare-fun a!501 () (_ BitVec 64))

(declare-fun b!85 () B!1062)

(assert (=> b!477741 (= lt!217581 (tuple2!9003 a!501 b!85))))

(assert (= (and start!43000 res!285126) b!477741))

(assert (= (and b!477741 res!285125) b!477742))

(assert (= (and b!477742 res!285127) b!477743))

(assert (= start!43000 b!477744))

(declare-fun b_lambda!10711 () Bool)

(assert (=> (not b_lambda!10711) (not b!477741)))

(declare-fun t!15224 () Bool)

(declare-fun tb!4121 () Bool)

(assert (=> (and start!43000 (= p!166 p!166) t!15224) tb!4121))

(declare-fun result!7689 () Bool)

(assert (=> tb!4121 (= result!7689 true)))

(assert (=> b!477741 t!15224))

(declare-fun b_and!20829 () Bool)

(assert (= b_and!20827 (and (=> t!15224 result!7689) b_and!20829)))

(declare-fun m!460177 () Bool)

(assert (=> b!477742 m!460177))

(declare-fun m!460179 () Bool)

(assert (=> b!477743 m!460179))

(declare-fun m!460181 () Bool)

(assert (=> b!477743 m!460181))

(declare-fun m!460183 () Bool)

(assert (=> start!43000 m!460183))

(declare-fun m!460185 () Bool)

(assert (=> start!43000 m!460185))

(declare-fun m!460187 () Bool)

(assert (=> b!477741 m!460187))

(push 1)

(assert (not b!477742))

(assert (not start!43000))

(assert (not b!477743))

(assert (not b_next!12113))

(assert (not b!477744))

(assert tp_is_empty!13535)

(assert (not b_lambda!10711))

(assert b_and!20829)

(check-sat)

(pop 1)

(push 1)

(assert b_and!20829)

(assert (not b_next!12113))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!10717 () Bool)

(assert (= b_lambda!10711 (or (and start!43000 b_free!12113) b_lambda!10717)))

(push 1)

(assert (not b_lambda!10717))

(assert (not b!477742))

(assert (not start!43000))

(assert (not b!477743))

(assert (not b_next!12113))

(assert (not b!477744))

(assert tp_is_empty!13535)

(assert b_and!20829)

(check-sat)

(pop 1)

(push 1)

(assert b_and!20829)

(assert (not b_next!12113))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76383 () Bool)

(declare-fun isEmpty!614 (List!9058) Bool)

(assert (=> d!76383 (= (isEmpty!611 lm!215) (isEmpty!614 (toList!3973 lm!215)))))

(declare-fun bs!15189 () Bool)

(assert (= bs!15189 d!76383))

(declare-fun m!460199 () Bool)

(assert (=> bs!15189 m!460199))

(assert (=> b!477742 d!76383))

(declare-fun d!76387 () Bool)

(declare-fun res!285146 () Bool)

(declare-fun e!280772 () Bool)

(assert (=> d!76387 (=> res!285146 e!280772)))

(assert (=> d!76387 (= res!285146 (is-Nil!9055 (toList!3973 lm!215)))))

(assert (=> d!76387 (= (forall!202 (toList!3973 lm!215) p!166) e!280772)))

(declare-fun b!477763 () Bool)

(declare-fun e!280773 () Bool)

(assert (=> b!477763 (= e!280772 e!280773)))

(declare-fun res!285147 () Bool)

(assert (=> b!477763 (=> (not res!285147) (not e!280773))))

(assert (=> b!477763 (= res!285147 (dynLambda!949 p!166 (h!9910 (toList!3973 lm!215))))))

(declare-fun b!477764 () Bool)

(assert (=> b!477764 (= e!280773 (forall!202 (t!15225 (toList!3973 lm!215)) p!166))))

(assert (= (and d!76387 (not res!285146)) b!477763))

(assert (= (and b!477763 res!285147) b!477764))

(declare-fun b_lambda!10725 () Bool)

(assert (=> (not b_lambda!10725) (not b!477763)))

(declare-fun t!15233 () Bool)

(declare-fun tb!4129 () Bool)

(assert (=> (and start!43000 (= p!166 p!166) t!15233) tb!4129))

(declare-fun result!7697 () Bool)

(assert (=> tb!4129 (= result!7697 true)))

(assert (=> b!477763 t!15233))

(declare-fun b_and!20837 () Bool)

(assert (= b_and!20829 (and (=> t!15233 result!7697) b_and!20837)))

(declare-fun m!460209 () Bool)

(assert (=> b!477763 m!460209))

(declare-fun m!460211 () Bool)

(assert (=> b!477764 m!460211))

(assert (=> start!43000 d!76387))

(declare-fun d!76393 () Bool)

(declare-fun isStrictlySorted!392 (List!9058) Bool)

(assert (=> d!76393 (= (inv!15505 lm!215) (isStrictlySorted!392 (toList!3973 lm!215)))))

(declare-fun bs!15191 () Bool)

(assert (= bs!15191 d!76393))

(declare-fun m!460219 () Bool)

(assert (=> bs!15191 m!460219))

(assert (=> start!43000 d!76393))

(declare-fun d!76399 () Bool)

(declare-fun res!285150 () Bool)

(declare-fun e!280776 () Bool)

(assert (=> d!76399 (=> res!285150 e!280776)))

(assert (=> d!76399 (= res!285150 (is-Nil!9055 (toList!3973 (+!1770 lm!215 lt!217581))))))

(assert (=> d!76399 (= (forall!202 (toList!3973 (+!1770 lm!215 lt!217581)) p!166) e!280776)))

(declare-fun b!477767 () Bool)

(declare-fun e!280777 () Bool)

(assert (=> b!477767 (= e!280776 e!280777)))

(declare-fun res!285151 () Bool)

(assert (=> b!477767 (=> (not res!285151) (not e!280777))))

(assert (=> b!477767 (= res!285151 (dynLambda!949 p!166 (h!9910 (toList!3973 (+!1770 lm!215 lt!217581)))))))

(declare-fun b!477768 () Bool)

(assert (=> b!477768 (= e!280777 (forall!202 (t!15225 (toList!3973 (+!1770 lm!215 lt!217581))) p!166))))

(assert (= (and d!76399 (not res!285150)) b!477767))

(assert (= (and b!477767 res!285151) b!477768))

(declare-fun b_lambda!10729 () Bool)

(assert (=> (not b_lambda!10729) (not b!477767)))

(declare-fun t!15237 () Bool)

(declare-fun tb!4133 () Bool)

(assert (=> (and start!43000 (= p!166 p!166) t!15237) tb!4133))

(declare-fun result!7701 () Bool)

(assert (=> tb!4133 (= result!7701 true)))

(assert (=> b!477767 t!15237))

(declare-fun b_and!20841 () Bool)

(assert (= b_and!20837 (and (=> t!15237 result!7701) b_and!20841)))

(declare-fun m!460221 () Bool)

(assert (=> b!477767 m!460221))

(declare-fun m!460223 () Bool)

(assert (=> b!477768 m!460223))

(assert (=> b!477743 d!76399))

(declare-fun d!76401 () Bool)

(declare-fun e!280792 () Bool)

(assert (=> d!76401 e!280792))

(declare-fun res!285168 () Bool)

(assert (=> d!76401 (=> (not res!285168) (not e!280792))))

(declare-fun lt!217617 () ListLongMap!7915)

(declare-fun contains!2578 (ListLongMap!7915 (_ BitVec 64)) Bool)

(assert (=> d!76401 (= res!285168 (contains!2578 lt!217617 (_1!4512 lt!217581)))))

(declare-fun lt!217614 () List!9058)

(assert (=> d!76401 (= lt!217617 (ListLongMap!7916 lt!217614))))

(declare-datatypes ((Unit!14053 0))(
  ( (Unit!14054) )
))
(declare-fun lt!217615 () Unit!14053)

(declare-fun lt!217616 () Unit!14053)

(assert (=> d!76401 (= lt!217615 lt!217616)))

(declare-datatypes ((Option!397 0))(
  ( (Some!396 (v!9100 B!1062)) (None!395) )
))
(declare-fun getValueByKey!391 (List!9058 (_ BitVec 64)) Option!397)

(assert (=> d!76401 (= (getValueByKey!391 lt!217614 (_1!4512 lt!217581)) (Some!396 (_2!4512 lt!217581)))))

(declare-fun lemmaContainsTupThenGetReturnValue!213 (List!9058 (_ BitVec 64) B!1062) Unit!14053)

(assert (=> d!76401 (= lt!217616 (lemmaContainsTupThenGetReturnValue!213 lt!217614 (_1!4512 lt!217581) (_2!4512 lt!217581)))))

(declare-fun insertStrictlySorted!216 (List!9058 (_ BitVec 64) B!1062) List!9058)

(assert (=> d!76401 (= lt!217614 (insertStrictlySorted!216 (toList!3973 lm!215) (_1!4512 lt!217581) (_2!4512 lt!217581)))))

(assert (=> d!76401 (= (+!1770 lm!215 lt!217581) lt!217617)))

(declare-fun b!477795 () Bool)

(declare-fun res!285169 () Bool)

(assert (=> b!477795 (=> (not res!285169) (not e!280792))))

(assert (=> b!477795 (= res!285169 (= (getValueByKey!391 (toList!3973 lt!217617) (_1!4512 lt!217581)) (Some!396 (_2!4512 lt!217581))))))

(declare-fun b!477796 () Bool)

(declare-fun contains!2579 (List!9058 tuple2!9002) Bool)

(assert (=> b!477796 (= e!280792 (contains!2579 (toList!3973 lt!217617) lt!217581))))

(assert (= (and d!76401 res!285168) b!477795))

(assert (= (and b!477795 res!285169) b!477796))

(declare-fun m!460249 () Bool)

(assert (=> d!76401 m!460249))

(declare-fun m!460251 () Bool)

(assert (=> d!76401 m!460251))

(declare-fun m!460253 () Bool)

(assert (=> d!76401 m!460253))

(declare-fun m!460255 () Bool)

(assert (=> d!76401 m!460255))

(declare-fun m!460257 () Bool)

(assert (=> b!477795 m!460257))

(declare-fun m!460259 () Bool)

(assert (=> b!477796 m!460259))

(assert (=> b!477743 d!76401))

(declare-fun b!477801 () Bool)

(declare-fun e!280795 () Bool)

(declare-fun tp!42451 () Bool)

(assert (=> b!477801 (= e!280795 (and tp_is_empty!13535 tp!42451))))

(assert (=> b!477744 (= tp!42441 e!280795)))

(assert (= (and b!477744 (is-Cons!9054 (toList!3973 lm!215))) b!477801))

(declare-fun b_lambda!10739 () Bool)

(assert (= b_lambda!10725 (or (and start!43000 b_free!12113) b_lambda!10739)))

(declare-fun b_lambda!10741 () Bool)

(assert (= b_lambda!10729 (or (and start!43000 b_free!12113) b_lambda!10741)))

(push 1)

(assert (not b_lambda!10717))

(assert (not b!477796))

(assert (not b!477801))

(assert (not d!76393))

(assert (not d!76401))

(assert (not b_lambda!10739))

(assert (not b!477795))

(assert (not b_next!12113))

(assert (not b_lambda!10741))

(assert tp_is_empty!13535)

(assert (not d!76383))

(assert (not b!477768))

(assert b_and!20841)

(assert (not b!477764))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20841)

(assert (not b_next!12113))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76421 () Bool)

(declare-fun lt!217650 () Bool)

(declare-fun content!209 (List!9058) (Set tuple2!9002))

(assert (=> d!76421 (= lt!217650 (member lt!217581 (content!209 (toList!3973 lt!217617))))))

(declare-fun e!280832 () Bool)

(assert (=> d!76421 (= lt!217650 e!280832)))

(declare-fun res!285194 () Bool)

(assert (=> d!76421 (=> (not res!285194) (not e!280832))))

(assert (=> d!76421 (= res!285194 (is-Cons!9054 (toList!3973 lt!217617)))))

(assert (=> d!76421 (= (contains!2579 (toList!3973 lt!217617) lt!217581) lt!217650)))

(declare-fun b!477862 () Bool)

(declare-fun e!280833 () Bool)

(assert (=> b!477862 (= e!280832 e!280833)))

(declare-fun res!285195 () Bool)

(assert (=> b!477862 (=> res!285195 e!280833)))

(assert (=> b!477862 (= res!285195 (= (h!9910 (toList!3973 lt!217617)) lt!217581))))

(declare-fun b!477863 () Bool)

(assert (=> b!477863 (= e!280833 (contains!2579 (t!15225 (toList!3973 lt!217617)) lt!217581))))

(assert (= (and d!76421 res!285194) b!477862))

(assert (= (and b!477862 (not res!285195)) b!477863))

(declare-fun m!460297 () Bool)

(assert (=> d!76421 m!460297))

(declare-fun m!460299 () Bool)

(assert (=> d!76421 m!460299))

(declare-fun m!460301 () Bool)

(assert (=> b!477863 m!460301))

(assert (=> b!477796 d!76421))

(declare-fun b!477904 () Bool)

(declare-fun e!280854 () Option!397)

(assert (=> b!477904 (= e!280854 (Some!396 (_2!4512 (h!9910 (toList!3973 lt!217617)))))))

(declare-fun b!477906 () Bool)

(declare-fun e!280855 () Option!397)

(assert (=> b!477906 (= e!280855 (getValueByKey!391 (t!15225 (toList!3973 lt!217617)) (_1!4512 lt!217581)))))

(declare-fun b!477907 () Bool)

(assert (=> b!477907 (= e!280855 None!395)))

(declare-fun d!76423 () Bool)

(declare-fun c!57595 () Bool)

(assert (=> d!76423 (= c!57595 (and (is-Cons!9054 (toList!3973 lt!217617)) (= (_1!4512 (h!9910 (toList!3973 lt!217617))) (_1!4512 lt!217581))))))

(assert (=> d!76423 (= (getValueByKey!391 (toList!3973 lt!217617) (_1!4512 lt!217581)) e!280854)))

(declare-fun b!477905 () Bool)

(assert (=> b!477905 (= e!280854 e!280855)))

(declare-fun c!57596 () Bool)

(assert (=> b!477905 (= c!57596 (and (is-Cons!9054 (toList!3973 lt!217617)) (not (= (_1!4512 (h!9910 (toList!3973 lt!217617))) (_1!4512 lt!217581)))))))

(assert (= (and d!76423 c!57595) b!477904))

(assert (= (and d!76423 (not c!57595)) b!477905))

(assert (= (and b!477905 c!57596) b!477906))

(assert (= (and b!477905 (not c!57596)) b!477907))

(declare-fun m!460303 () Bool)

(assert (=> b!477906 m!460303))

(assert (=> b!477795 d!76423))

(declare-fun d!76425 () Bool)

(declare-fun res!285208 () Bool)

(declare-fun e!280864 () Bool)

(assert (=> d!76425 (=> res!285208 e!280864)))

(assert (=> d!76425 (= res!285208 (or (is-Nil!9055 (toList!3973 lm!215)) (is-Nil!9055 (t!15225 (toList!3973 lm!215)))))))

(assert (=> d!76425 (= (isStrictlySorted!392 (toList!3973 lm!215)) e!280864)))

(declare-fun b!477920 () Bool)

(declare-fun e!280865 () Bool)

(assert (=> b!477920 (= e!280864 e!280865)))

(declare-fun res!285209 () Bool)

(assert (=> b!477920 (=> (not res!285209) (not e!280865))))

(assert (=> b!477920 (= res!285209 (bvslt (_1!4512 (h!9910 (toList!3973 lm!215))) (_1!4512 (h!9910 (t!15225 (toList!3973 lm!215))))))))

(declare-fun b!477921 () Bool)

(assert (=> b!477921 (= e!280865 (isStrictlySorted!392 (t!15225 (toList!3973 lm!215))))))

(assert (= (and d!76425 (not res!285208)) b!477920))

(assert (= (and b!477920 res!285209) b!477921))

(declare-fun m!460305 () Bool)

(assert (=> b!477921 m!460305))

(assert (=> d!76393 d!76425))

(declare-fun d!76427 () Bool)

(declare-fun e!280899 () Bool)

(assert (=> d!76427 e!280899))

(declare-fun res!285234 () Bool)

(assert (=> d!76427 (=> res!285234 e!280899)))

(declare-fun lt!217673 () Bool)

(assert (=> d!76427 (= res!285234 (not lt!217673))))

(declare-fun lt!217672 () Bool)

(assert (=> d!76427 (= lt!217673 lt!217672)))

(declare-fun lt!217671 () Unit!14053)

(declare-fun e!280898 () Unit!14053)

(assert (=> d!76427 (= lt!217671 e!280898)))

(declare-fun c!57607 () Bool)

(assert (=> d!76427 (= c!57607 lt!217672)))

(declare-fun containsKey!353 (List!9058 (_ BitVec 64)) Bool)

(assert (=> d!76427 (= lt!217672 (containsKey!353 (toList!3973 lt!217617) (_1!4512 lt!217581)))))

(assert (=> d!76427 (= (contains!2578 lt!217617 (_1!4512 lt!217581)) lt!217673)))

(declare-fun b!477966 () Bool)

(declare-fun lt!217674 () Unit!14053)

(assert (=> b!477966 (= e!280898 lt!217674)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!301 (List!9058 (_ BitVec 64)) Unit!14053)

(assert (=> b!477966 (= lt!217674 (lemmaContainsKeyImpliesGetValueByKeyDefined!301 (toList!3973 lt!217617) (_1!4512 lt!217581)))))

(declare-fun isDefined!302 (Option!397) Bool)

(assert (=> b!477966 (isDefined!302 (getValueByKey!391 (toList!3973 lt!217617) (_1!4512 lt!217581)))))

(declare-fun b!477967 () Bool)

(declare-fun Unit!14057 () Unit!14053)

(assert (=> b!477967 (= e!280898 Unit!14057)))

(declare-fun b!477968 () Bool)

(assert (=> b!477968 (= e!280899 (isDefined!302 (getValueByKey!391 (toList!3973 lt!217617) (_1!4512 lt!217581))))))

(assert (= (and d!76427 c!57607) b!477966))

(assert (= (and d!76427 (not c!57607)) b!477967))

(assert (= (and d!76427 (not res!285234)) b!477968))

(declare-fun m!460347 () Bool)

(assert (=> d!76427 m!460347))

(declare-fun m!460351 () Bool)

(assert (=> b!477966 m!460351))

(assert (=> b!477966 m!460257))

(assert (=> b!477966 m!460257))

(declare-fun m!460355 () Bool)

(assert (=> b!477966 m!460355))

(assert (=> b!477968 m!460257))

(assert (=> b!477968 m!460257))

(assert (=> b!477968 m!460355))

(assert (=> d!76401 d!76427))

(declare-fun b!477973 () Bool)

(declare-fun e!280902 () Option!397)

(assert (=> b!477973 (= e!280902 (Some!396 (_2!4512 (h!9910 lt!217614))))))

(declare-fun b!477975 () Bool)

(declare-fun e!280903 () Option!397)

(assert (=> b!477975 (= e!280903 (getValueByKey!391 (t!15225 lt!217614) (_1!4512 lt!217581)))))

(declare-fun b!477976 () Bool)

(assert (=> b!477976 (= e!280903 None!395)))

(declare-fun d!76447 () Bool)

(declare-fun c!57610 () Bool)

(assert (=> d!76447 (= c!57610 (and (is-Cons!9054 lt!217614) (= (_1!4512 (h!9910 lt!217614)) (_1!4512 lt!217581))))))

(assert (=> d!76447 (= (getValueByKey!391 lt!217614 (_1!4512 lt!217581)) e!280902)))

(declare-fun b!477974 () Bool)

(assert (=> b!477974 (= e!280902 e!280903)))

(declare-fun c!57611 () Bool)

(assert (=> b!477974 (= c!57611 (and (is-Cons!9054 lt!217614) (not (= (_1!4512 (h!9910 lt!217614)) (_1!4512 lt!217581)))))))

(assert (= (and d!76447 c!57610) b!477973))

(assert (= (and d!76447 (not c!57610)) b!477974))

(assert (= (and b!477974 c!57611) b!477975))

(assert (= (and b!477974 (not c!57611)) b!477976))

(declare-fun m!460359 () Bool)

(assert (=> b!477975 m!460359))

(assert (=> d!76401 d!76447))

(declare-fun d!76451 () Bool)

(assert (=> d!76451 (= (getValueByKey!391 lt!217614 (_1!4512 lt!217581)) (Some!396 (_2!4512 lt!217581)))))

(declare-fun lt!217677 () Unit!14053)

(declare-fun choose!1371 (List!9058 (_ BitVec 64) B!1062) Unit!14053)

(assert (=> d!76451 (= lt!217677 (choose!1371 lt!217614 (_1!4512 lt!217581) (_2!4512 lt!217581)))))

(declare-fun e!280922 () Bool)

(assert (=> d!76451 e!280922))

(declare-fun res!285251 () Bool)

(assert (=> d!76451 (=> (not res!285251) (not e!280922))))

(assert (=> d!76451 (= res!285251 (isStrictlySorted!392 lt!217614))))

(assert (=> d!76451 (= (lemmaContainsTupThenGetReturnValue!213 lt!217614 (_1!4512 lt!217581) (_2!4512 lt!217581)) lt!217677)))

(declare-fun b!477999 () Bool)

(declare-fun res!285252 () Bool)

(assert (=> b!477999 (=> (not res!285252) (not e!280922))))

(assert (=> b!477999 (= res!285252 (containsKey!353 lt!217614 (_1!4512 lt!217581)))))

(declare-fun b!478000 () Bool)

(assert (=> b!478000 (= e!280922 (contains!2579 lt!217614 (tuple2!9003 (_1!4512 lt!217581) (_2!4512 lt!217581))))))

(assert (= (and d!76451 res!285251) b!477999))

(assert (= (and b!477999 res!285252) b!478000))

(assert (=> d!76451 m!460251))

(declare-fun m!460367 () Bool)

(assert (=> d!76451 m!460367))

(declare-fun m!460369 () Bool)

(assert (=> d!76451 m!460369))

(declare-fun m!460371 () Bool)

(assert (=> b!477999 m!460371))

(declare-fun m!460373 () Bool)

(assert (=> b!478000 m!460373))

(assert (=> d!76401 d!76451))

(declare-fun b!478021 () Bool)

(declare-fun e!280935 () List!9058)

(declare-fun call!30818 () List!9058)

(assert (=> b!478021 (= e!280935 call!30818)))

(declare-fun b!478022 () Bool)

(declare-fun e!280937 () List!9058)

(assert (=> b!478022 (= e!280937 (insertStrictlySorted!216 (t!15225 (toList!3973 lm!215)) (_1!4512 lt!217581) (_2!4512 lt!217581)))))

(declare-fun b!478023 () Bool)

(declare-fun e!280934 () Bool)

(declare-fun lt!217680 () List!9058)

(assert (=> b!478023 (= e!280934 (contains!2579 lt!217680 (tuple2!9003 (_1!4512 lt!217581) (_2!4512 lt!217581))))))

(declare-fun d!76455 () Bool)

(assert (=> d!76455 e!280934))

(declare-fun res!285257 () Bool)

(assert (=> d!76455 (=> (not res!285257) (not e!280934))))

(assert (=> d!76455 (= res!285257 (isStrictlySorted!392 lt!217680))))

(declare-fun e!280933 () List!9058)

(assert (=> d!76455 (= lt!217680 e!280933)))

(declare-fun c!57625 () Bool)

(assert (=> d!76455 (= c!57625 (and (is-Cons!9054 (toList!3973 lm!215)) (bvslt (_1!4512 (h!9910 (toList!3973 lm!215))) (_1!4512 lt!217581))))))

(assert (=> d!76455 (isStrictlySorted!392 (toList!3973 lm!215))))

(assert (=> d!76455 (= (insertStrictlySorted!216 (toList!3973 lm!215) (_1!4512 lt!217581) (_2!4512 lt!217581)) lt!217680)))

(declare-fun b!478024 () Bool)

(declare-fun res!285258 () Bool)

(assert (=> b!478024 (=> (not res!285258) (not e!280934))))

(assert (=> b!478024 (= res!285258 (containsKey!353 lt!217680 (_1!4512 lt!217581)))))

(declare-fun b!478025 () Bool)

(declare-fun c!57624 () Bool)

(assert (=> b!478025 (= c!57624 (and (is-Cons!9054 (toList!3973 lm!215)) (bvsgt (_1!4512 (h!9910 (toList!3973 lm!215))) (_1!4512 lt!217581))))))

(declare-fun e!280936 () List!9058)

(assert (=> b!478025 (= e!280935 e!280936)))

(declare-fun bm!30815 () Bool)

(declare-fun call!30819 () List!9058)

(assert (=> bm!30815 (= call!30819 call!30818)))

(declare-fun b!478026 () Bool)

(assert (=> b!478026 (= e!280933 e!280935)))

(declare-fun c!57623 () Bool)

(assert (=> b!478026 (= c!57623 (and (is-Cons!9054 (toList!3973 lm!215)) (= (_1!4512 (h!9910 (toList!3973 lm!215))) (_1!4512 lt!217581))))))

(declare-fun call!30820 () List!9058)

(declare-fun bm!30816 () Bool)

(declare-fun $colon$colon!115 (List!9058 tuple2!9002) List!9058)

(assert (=> bm!30816 (= call!30820 ($colon$colon!115 e!280937 (ite c!57625 (h!9910 (toList!3973 lm!215)) (tuple2!9003 (_1!4512 lt!217581) (_2!4512 lt!217581)))))))

(declare-fun c!57622 () Bool)

(assert (=> bm!30816 (= c!57622 c!57625)))

(declare-fun b!478027 () Bool)

(assert (=> b!478027 (= e!280936 call!30819)))

(declare-fun b!478028 () Bool)

(assert (=> b!478028 (= e!280937 (ite c!57623 (t!15225 (toList!3973 lm!215)) (ite c!57624 (Cons!9054 (h!9910 (toList!3973 lm!215)) (t!15225 (toList!3973 lm!215))) Nil!9055)))))

(declare-fun b!478029 () Bool)

(assert (=> b!478029 (= e!280936 call!30819)))

(declare-fun b!478030 () Bool)

(assert (=> b!478030 (= e!280933 call!30820)))

(declare-fun bm!30817 () Bool)

(assert (=> bm!30817 (= call!30818 call!30820)))

(assert (= (and d!76455 c!57625) b!478030))

(assert (= (and d!76455 (not c!57625)) b!478026))

(assert (= (and b!478026 c!57623) b!478021))

(assert (= (and b!478026 (not c!57623)) b!478025))

(assert (= (and b!478025 c!57624) b!478029))

(assert (= (and b!478025 (not c!57624)) b!478027))

(assert (= (or b!478029 b!478027) bm!30815))

(assert (= (or b!478021 bm!30815) bm!30817))

(assert (= (or b!478030 bm!30817) bm!30816))

(assert (= (and bm!30816 c!57622) b!478022))

(assert (= (and bm!30816 (not c!57622)) b!478028))

(assert (= (and d!76455 res!285257) b!478024))

(assert (= (and b!478024 res!285258) b!478023))

(declare-fun m!460375 () Bool)

(assert (=> b!478024 m!460375))

(declare-fun m!460377 () Bool)

(assert (=> b!478022 m!460377))

(declare-fun m!460379 () Bool)

(assert (=> b!478023 m!460379))

(declare-fun m!460381 () Bool)

(assert (=> d!76455 m!460381))

(assert (=> d!76455 m!460219))

(declare-fun m!460383 () Bool)

(assert (=> bm!30816 m!460383))

(assert (=> d!76401 d!76455))

(declare-fun d!76457 () Bool)

(declare-fun res!285259 () Bool)

(declare-fun e!280938 () Bool)

(assert (=> d!76457 (=> res!285259 e!280938)))

(assert (=> d!76457 (= res!285259 (is-Nil!9055 (t!15225 (toList!3973 (+!1770 lm!215 lt!217581)))))))

(assert (=> d!76457 (= (forall!202 (t!15225 (toList!3973 (+!1770 lm!215 lt!217581))) p!166) e!280938)))

(declare-fun b!478031 () Bool)

(declare-fun e!280939 () Bool)

(assert (=> b!478031 (= e!280938 e!280939)))

(declare-fun res!285260 () Bool)

(assert (=> b!478031 (=> (not res!285260) (not e!280939))))

(assert (=> b!478031 (= res!285260 (dynLambda!949 p!166 (h!9910 (t!15225 (toList!3973 (+!1770 lm!215 lt!217581))))))))

(declare-fun b!478032 () Bool)

(assert (=> b!478032 (= e!280939 (forall!202 (t!15225 (t!15225 (toList!3973 (+!1770 lm!215 lt!217581)))) p!166))))

(assert (= (and d!76457 (not res!285259)) b!478031))

(assert (= (and b!478031 res!285260) b!478032))

(declare-fun b_lambda!10759 () Bool)

(assert (=> (not b_lambda!10759) (not b!478031)))

(declare-fun t!15247 () Bool)

(declare-fun tb!4143 () Bool)

(assert (=> (and start!43000 (= p!166 p!166) t!15247) tb!4143))

(declare-fun result!7717 () Bool)

(assert (=> tb!4143 (= result!7717 true)))

(assert (=> b!478031 t!15247))

(declare-fun b_and!20851 () Bool)

(assert (= b_and!20841 (and (=> t!15247 result!7717) b_and!20851)))

(declare-fun m!460385 () Bool)

(assert (=> b!478031 m!460385))

(declare-fun m!460387 () Bool)

(assert (=> b!478032 m!460387))

(assert (=> b!477768 d!76457))

(declare-fun d!76459 () Bool)

(assert (=> d!76459 (= (isEmpty!614 (toList!3973 lm!215)) (is-Nil!9055 (toList!3973 lm!215)))))

(assert (=> d!76383 d!76459))

(declare-fun d!76461 () Bool)

(declare-fun res!285261 () Bool)

(declare-fun e!280940 () Bool)

(assert (=> d!76461 (=> res!285261 e!280940)))

(assert (=> d!76461 (= res!285261 (is-Nil!9055 (t!15225 (toList!3973 lm!215))))))

(assert (=> d!76461 (= (forall!202 (t!15225 (toList!3973 lm!215)) p!166) e!280940)))

(declare-fun b!478033 () Bool)

(declare-fun e!280941 () Bool)

(assert (=> b!478033 (= e!280940 e!280941)))

(declare-fun res!285262 () Bool)

(assert (=> b!478033 (=> (not res!285262) (not e!280941))))

(assert (=> b!478033 (= res!285262 (dynLambda!949 p!166 (h!9910 (t!15225 (toList!3973 lm!215)))))))

(declare-fun b!478034 () Bool)

(assert (=> b!478034 (= e!280941 (forall!202 (t!15225 (t!15225 (toList!3973 lm!215))) p!166))))

(assert (= (and d!76461 (not res!285261)) b!478033))

(assert (= (and b!478033 res!285262) b!478034))

(declare-fun b_lambda!10761 () Bool)

(assert (=> (not b_lambda!10761) (not b!478033)))

(declare-fun t!15249 () Bool)

(declare-fun tb!4145 () Bool)

(assert (=> (and start!43000 (= p!166 p!166) t!15249) tb!4145))

(declare-fun result!7719 () Bool)

(assert (=> tb!4145 (= result!7719 true)))

(assert (=> b!478033 t!15249))

(declare-fun b_and!20853 () Bool)

(assert (= b_and!20851 (and (=> t!15249 result!7719) b_and!20853)))

(declare-fun m!460389 () Bool)

(assert (=> b!478033 m!460389))

(declare-fun m!460391 () Bool)

(assert (=> b!478034 m!460391))

(assert (=> b!477764 d!76461))

(declare-fun b!478035 () Bool)

(declare-fun e!280942 () Bool)

(declare-fun tp!42454 () Bool)

(assert (=> b!478035 (= e!280942 (and tp_is_empty!13535 tp!42454))))

(assert (=> b!477801 (= tp!42451 e!280942)))

(assert (= (and b!477801 (is-Cons!9054 (t!15225 (toList!3973 lm!215)))) b!478035))

(declare-fun b_lambda!10763 () Bool)

(assert (= b_lambda!10759 (or (and start!43000 b_free!12113) b_lambda!10763)))

(declare-fun b_lambda!10765 () Bool)

(assert (= b_lambda!10761 (or (and start!43000 b_free!12113) b_lambda!10765)))

(push 1)

(assert (not b!477975))

(assert (not b!478035))

(assert (not b_lambda!10717))

(assert (not b_lambda!10765))

(assert b_and!20853)

(assert (not b!478032))

(assert (not b!478000))

(assert (not b_next!12113))

(assert (not b_lambda!10739))

(assert (not bm!30816))

(assert (not d!76427))

(assert (not b_lambda!10763))

(assert (not b!477999))

(assert (not b!477966))

(assert (not b!477921))

(assert (not b!478023))

(assert (not b!478024))

(assert (not d!76455))

(assert (not d!76421))

(assert (not b!478022))

(assert tp_is_empty!13535)

(assert (not b!477863))

(assert (not b_lambda!10741))

(assert (not b!477968))

(assert (not b!477906))

(assert (not d!76451))

(assert (not b!478034))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20853)

(assert (not b_next!12113))

(check-sat)

(get-model)

(pop 1)

(declare-fun b!478144 () Bool)

(declare-fun e!281027 () Option!397)

(assert (=> b!478144 (= e!281027 (Some!396 (_2!4512 (h!9910 (t!15225 lt!217614)))))))

(declare-fun b!478146 () Bool)

(declare-fun e!281028 () Option!397)

(assert (=> b!478146 (= e!281028 (getValueByKey!391 (t!15225 (t!15225 lt!217614)) (_1!4512 lt!217581)))))

(declare-fun b!478147 () Bool)

(assert (=> b!478147 (= e!281028 None!395)))

(declare-fun d!76539 () Bool)

(declare-fun c!57648 () Bool)

(assert (=> d!76539 (= c!57648 (and (is-Cons!9054 (t!15225 lt!217614)) (= (_1!4512 (h!9910 (t!15225 lt!217614))) (_1!4512 lt!217581))))))

(assert (=> d!76539 (= (getValueByKey!391 (t!15225 lt!217614) (_1!4512 lt!217581)) e!281027)))

(declare-fun b!478145 () Bool)

