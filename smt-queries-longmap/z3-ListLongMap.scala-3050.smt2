; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42998 () Bool)

(assert start!42998)

(declare-fun b_free!12111 () Bool)

(declare-fun b_next!12111 () Bool)

(assert (=> start!42998 (= b_free!12111 (not b_next!12111))))

(declare-fun tp!42435 () Bool)

(declare-fun b_and!20823 () Bool)

(assert (=> start!42998 (= tp!42435 b_and!20823)))

(declare-datatypes ((B!1060 0))(
  ( (B!1061 (val!6814 Int)) )
))
(declare-datatypes ((tuple2!9000 0))(
  ( (tuple2!9001 (_1!4511 (_ BitVec 64)) (_2!4511 B!1060)) )
))
(declare-datatypes ((List!9057 0))(
  ( (Nil!9054) (Cons!9053 (h!9909 tuple2!9000) (t!15222 List!9057)) )
))
(declare-datatypes ((ListLongMap!7913 0))(
  ( (ListLongMap!7914 (toList!3972 List!9057)) )
))
(declare-fun lm!215 () ListLongMap!7913)

(declare-fun p!166 () Int)

(declare-fun b!477731 () Bool)

(declare-fun e!280742 () Bool)

(declare-fun lt!217578 () tuple2!9000)

(declare-fun forall!201 (List!9057 Int) Bool)

(declare-fun +!1769 (ListLongMap!7913 tuple2!9000) ListLongMap!7913)

(assert (=> b!477731 (= e!280742 (not (forall!201 (toList!3972 (+!1769 lm!215 lt!217578)) p!166)))))

(declare-fun b!477729 () Bool)

(declare-fun e!280744 () Bool)

(assert (=> b!477729 (= e!280744 e!280742)))

(declare-fun res!285116 () Bool)

(assert (=> b!477729 (=> (not res!285116) (not e!280742))))

(declare-fun dynLambda!948 (Int tuple2!9000) Bool)

(assert (=> b!477729 (= res!285116 (dynLambda!948 p!166 lt!217578))))

(declare-fun a!501 () (_ BitVec 64))

(declare-fun b!85 () B!1060)

(assert (=> b!477729 (= lt!217578 (tuple2!9001 a!501 b!85))))

(declare-fun b!477732 () Bool)

(declare-fun e!280743 () Bool)

(declare-fun tp!42436 () Bool)

(assert (=> b!477732 (= e!280743 tp!42436)))

(declare-fun res!285118 () Bool)

(assert (=> start!42998 (=> (not res!285118) (not e!280744))))

(assert (=> start!42998 (= res!285118 (forall!201 (toList!3972 lm!215) p!166))))

(assert (=> start!42998 e!280744))

(declare-fun inv!15504 (ListLongMap!7913) Bool)

(assert (=> start!42998 (and (inv!15504 lm!215) e!280743)))

(assert (=> start!42998 tp!42435))

(declare-fun tp_is_empty!13533 () Bool)

(assert (=> start!42998 tp_is_empty!13533))

(assert (=> start!42998 true))

(declare-fun b!477730 () Bool)

(declare-fun res!285117 () Bool)

(assert (=> b!477730 (=> (not res!285117) (not e!280742))))

(declare-fun isEmpty!610 (ListLongMap!7913) Bool)

(assert (=> b!477730 (= res!285117 (isEmpty!610 lm!215))))

(assert (= (and start!42998 res!285118) b!477729))

(assert (= (and b!477729 res!285116) b!477730))

(assert (= (and b!477730 res!285117) b!477731))

(assert (= start!42998 b!477732))

(declare-fun b_lambda!10709 () Bool)

(assert (=> (not b_lambda!10709) (not b!477729)))

(declare-fun t!15221 () Bool)

(declare-fun tb!4119 () Bool)

(assert (=> (and start!42998 (= p!166 p!166) t!15221) tb!4119))

(declare-fun result!7687 () Bool)

(assert (=> tb!4119 (= result!7687 true)))

(assert (=> b!477729 t!15221))

(declare-fun b_and!20825 () Bool)

(assert (= b_and!20823 (and (=> t!15221 result!7687) b_and!20825)))

(declare-fun m!460165 () Bool)

(assert (=> b!477731 m!460165))

(declare-fun m!460167 () Bool)

(assert (=> b!477731 m!460167))

(declare-fun m!460169 () Bool)

(assert (=> b!477729 m!460169))

(declare-fun m!460171 () Bool)

(assert (=> start!42998 m!460171))

(declare-fun m!460173 () Bool)

(assert (=> start!42998 m!460173))

(declare-fun m!460175 () Bool)

(assert (=> b!477730 m!460175))

(check-sat (not b_lambda!10709) (not b_next!12111) b_and!20825 tp_is_empty!13533 (not b!477731) (not b!477732) (not b!477730) (not start!42998))
(check-sat b_and!20825 (not b_next!12111))
(get-model)

(declare-fun b_lambda!10715 () Bool)

(assert (= b_lambda!10709 (or (and start!42998 b_free!12111) b_lambda!10715)))

(check-sat (not b_next!12111) b_and!20825 (not b_lambda!10715) tp_is_empty!13533 (not b!477731) (not b!477732) (not b!477730) (not start!42998))
(check-sat b_and!20825 (not b_next!12111))
(get-model)

(declare-fun d!76377 () Bool)

(declare-fun isEmpty!613 (List!9057) Bool)

(assert (=> d!76377 (= (isEmpty!610 lm!215) (isEmpty!613 (toList!3972 lm!215)))))

(declare-fun bs!15187 () Bool)

(assert (= bs!15187 d!76377))

(declare-fun m!460195 () Bool)

(assert (=> bs!15187 m!460195))

(assert (=> b!477730 d!76377))

(declare-fun d!76381 () Bool)

(declare-fun res!285140 () Bool)

(declare-fun e!280766 () Bool)

(assert (=> d!76381 (=> res!285140 e!280766)))

(get-info :version)

(assert (=> d!76381 (= res!285140 ((_ is Nil!9054) (toList!3972 lm!215)))))

(assert (=> d!76381 (= (forall!201 (toList!3972 lm!215) p!166) e!280766)))

(declare-fun b!477757 () Bool)

(declare-fun e!280767 () Bool)

(assert (=> b!477757 (= e!280766 e!280767)))

(declare-fun res!285141 () Bool)

(assert (=> b!477757 (=> (not res!285141) (not e!280767))))

(assert (=> b!477757 (= res!285141 (dynLambda!948 p!166 (h!9909 (toList!3972 lm!215))))))

(declare-fun b!477758 () Bool)

(assert (=> b!477758 (= e!280767 (forall!201 (t!15222 (toList!3972 lm!215)) p!166))))

(assert (= (and d!76381 (not res!285140)) b!477757))

(assert (= (and b!477757 res!285141) b!477758))

(declare-fun b_lambda!10723 () Bool)

(assert (=> (not b_lambda!10723) (not b!477757)))

(declare-fun t!15231 () Bool)

(declare-fun tb!4127 () Bool)

(assert (=> (and start!42998 (= p!166 p!166) t!15231) tb!4127))

(declare-fun result!7695 () Bool)

(assert (=> tb!4127 (= result!7695 true)))

(assert (=> b!477757 t!15231))

(declare-fun b_and!20835 () Bool)

(assert (= b_and!20825 (and (=> t!15231 result!7695) b_and!20835)))

(declare-fun m!460205 () Bool)

(assert (=> b!477757 m!460205))

(declare-fun m!460207 () Bool)

(assert (=> b!477758 m!460207))

(assert (=> start!42998 d!76381))

(declare-fun d!76391 () Bool)

(declare-fun isStrictlySorted!391 (List!9057) Bool)

(assert (=> d!76391 (= (inv!15504 lm!215) (isStrictlySorted!391 (toList!3972 lm!215)))))

(declare-fun bs!15190 () Bool)

(assert (= bs!15190 d!76391))

(declare-fun m!460213 () Bool)

(assert (=> bs!15190 m!460213))

(assert (=> start!42998 d!76391))

(declare-fun d!76395 () Bool)

(declare-fun res!285148 () Bool)

(declare-fun e!280774 () Bool)

(assert (=> d!76395 (=> res!285148 e!280774)))

(assert (=> d!76395 (= res!285148 ((_ is Nil!9054) (toList!3972 (+!1769 lm!215 lt!217578))))))

(assert (=> d!76395 (= (forall!201 (toList!3972 (+!1769 lm!215 lt!217578)) p!166) e!280774)))

(declare-fun b!477765 () Bool)

(declare-fun e!280775 () Bool)

(assert (=> b!477765 (= e!280774 e!280775)))

(declare-fun res!285149 () Bool)

(assert (=> b!477765 (=> (not res!285149) (not e!280775))))

(assert (=> b!477765 (= res!285149 (dynLambda!948 p!166 (h!9909 (toList!3972 (+!1769 lm!215 lt!217578)))))))

(declare-fun b!477766 () Bool)

(assert (=> b!477766 (= e!280775 (forall!201 (t!15222 (toList!3972 (+!1769 lm!215 lt!217578))) p!166))))

(assert (= (and d!76395 (not res!285148)) b!477765))

(assert (= (and b!477765 res!285149) b!477766))

(declare-fun b_lambda!10727 () Bool)

(assert (=> (not b_lambda!10727) (not b!477765)))

(declare-fun t!15235 () Bool)

(declare-fun tb!4131 () Bool)

(assert (=> (and start!42998 (= p!166 p!166) t!15235) tb!4131))

(declare-fun result!7699 () Bool)

(assert (=> tb!4131 (= result!7699 true)))

(assert (=> b!477765 t!15235))

(declare-fun b_and!20839 () Bool)

(assert (= b_and!20835 (and (=> t!15235 result!7699) b_and!20839)))

(declare-fun m!460215 () Bool)

(assert (=> b!477765 m!460215))

(declare-fun m!460217 () Bool)

(assert (=> b!477766 m!460217))

(assert (=> b!477731 d!76395))

(declare-fun d!76397 () Bool)

(declare-fun e!280788 () Bool)

(assert (=> d!76397 e!280788))

(declare-fun res!285166 () Bool)

(assert (=> d!76397 (=> (not res!285166) (not e!280788))))

(declare-fun lt!217611 () ListLongMap!7913)

(declare-fun contains!2575 (ListLongMap!7913 (_ BitVec 64)) Bool)

(assert (=> d!76397 (= res!285166 (contains!2575 lt!217611 (_1!4511 lt!217578)))))

(declare-fun lt!217612 () List!9057)

(assert (=> d!76397 (= lt!217611 (ListLongMap!7914 lt!217612))))

(declare-datatypes ((Unit!14051 0))(
  ( (Unit!14052) )
))
(declare-fun lt!217613 () Unit!14051)

(declare-fun lt!217610 () Unit!14051)

(assert (=> d!76397 (= lt!217613 lt!217610)))

(declare-datatypes ((Option!396 0))(
  ( (Some!395 (v!9099 B!1060)) (None!394) )
))
(declare-fun getValueByKey!390 (List!9057 (_ BitVec 64)) Option!396)

(assert (=> d!76397 (= (getValueByKey!390 lt!217612 (_1!4511 lt!217578)) (Some!395 (_2!4511 lt!217578)))))

(declare-fun lemmaContainsTupThenGetReturnValue!212 (List!9057 (_ BitVec 64) B!1060) Unit!14051)

(assert (=> d!76397 (= lt!217610 (lemmaContainsTupThenGetReturnValue!212 lt!217612 (_1!4511 lt!217578) (_2!4511 lt!217578)))))

(declare-fun insertStrictlySorted!215 (List!9057 (_ BitVec 64) B!1060) List!9057)

(assert (=> d!76397 (= lt!217612 (insertStrictlySorted!215 (toList!3972 lm!215) (_1!4511 lt!217578) (_2!4511 lt!217578)))))

(assert (=> d!76397 (= (+!1769 lm!215 lt!217578) lt!217611)))

(declare-fun b!477788 () Bool)

(declare-fun res!285167 () Bool)

(assert (=> b!477788 (=> (not res!285167) (not e!280788))))

(assert (=> b!477788 (= res!285167 (= (getValueByKey!390 (toList!3972 lt!217611) (_1!4511 lt!217578)) (Some!395 (_2!4511 lt!217578))))))

(declare-fun b!477789 () Bool)

(declare-fun contains!2577 (List!9057 tuple2!9000) Bool)

(assert (=> b!477789 (= e!280788 (contains!2577 (toList!3972 lt!217611) lt!217578))))

(assert (= (and d!76397 res!285166) b!477788))

(assert (= (and b!477788 res!285167) b!477789))

(declare-fun m!460237 () Bool)

(assert (=> d!76397 m!460237))

(declare-fun m!460239 () Bool)

(assert (=> d!76397 m!460239))

(declare-fun m!460241 () Bool)

(assert (=> d!76397 m!460241))

(declare-fun m!460243 () Bool)

(assert (=> d!76397 m!460243))

(declare-fun m!460245 () Bool)

(assert (=> b!477788 m!460245))

(declare-fun m!460247 () Bool)

(assert (=> b!477789 m!460247))

(assert (=> b!477731 d!76397))

(declare-fun b!477794 () Bool)

(declare-fun e!280791 () Bool)

(declare-fun tp!42448 () Bool)

(assert (=> b!477794 (= e!280791 (and tp_is_empty!13533 tp!42448))))

(assert (=> b!477732 (= tp!42436 e!280791)))

(assert (= (and b!477732 ((_ is Cons!9053) (toList!3972 lm!215))) b!477794))

(declare-fun b_lambda!10735 () Bool)

(assert (= b_lambda!10727 (or (and start!42998 b_free!12111) b_lambda!10735)))

(declare-fun b_lambda!10737 () Bool)

(assert (= b_lambda!10723 (or (and start!42998 b_free!12111) b_lambda!10737)))

(check-sat b_and!20839 (not b_next!12111) (not b_lambda!10715) (not b!477758) (not d!76377) (not b_lambda!10735) (not d!76397) (not b!477789) (not b!477766) (not d!76391) tp_is_empty!13533 (not b!477788) (not b!477794) (not b_lambda!10737))
(check-sat b_and!20839 (not b_next!12111))
(get-model)

(declare-fun d!76403 () Bool)

(declare-fun res!285170 () Bool)

(declare-fun e!280796 () Bool)

(assert (=> d!76403 (=> res!285170 e!280796)))

(assert (=> d!76403 (= res!285170 ((_ is Nil!9054) (t!15222 (toList!3972 (+!1769 lm!215 lt!217578)))))))

(assert (=> d!76403 (= (forall!201 (t!15222 (toList!3972 (+!1769 lm!215 lt!217578))) p!166) e!280796)))

(declare-fun b!477802 () Bool)

(declare-fun e!280797 () Bool)

(assert (=> b!477802 (= e!280796 e!280797)))

(declare-fun res!285171 () Bool)

(assert (=> b!477802 (=> (not res!285171) (not e!280797))))

(assert (=> b!477802 (= res!285171 (dynLambda!948 p!166 (h!9909 (t!15222 (toList!3972 (+!1769 lm!215 lt!217578))))))))

(declare-fun b!477803 () Bool)

(assert (=> b!477803 (= e!280797 (forall!201 (t!15222 (t!15222 (toList!3972 (+!1769 lm!215 lt!217578)))) p!166))))

(assert (= (and d!76403 (not res!285170)) b!477802))

(assert (= (and b!477802 res!285171) b!477803))

(declare-fun b_lambda!10743 () Bool)

(assert (=> (not b_lambda!10743) (not b!477802)))

(declare-fun t!15239 () Bool)

(declare-fun tb!4135 () Bool)

(assert (=> (and start!42998 (= p!166 p!166) t!15239) tb!4135))

(declare-fun result!7709 () Bool)

(assert (=> tb!4135 (= result!7709 true)))

(assert (=> b!477802 t!15239))

(declare-fun b_and!20843 () Bool)

(assert (= b_and!20839 (and (=> t!15239 result!7709) b_and!20843)))

(declare-fun m!460261 () Bool)

(assert (=> b!477802 m!460261))

(declare-fun m!460263 () Bool)

(assert (=> b!477803 m!460263))

(assert (=> b!477766 d!76403))

(declare-fun d!76407 () Bool)

(declare-fun e!280809 () Bool)

(assert (=> d!76407 e!280809))

(declare-fun res!285177 () Bool)

(assert (=> d!76407 (=> res!285177 e!280809)))

(declare-fun lt!217638 () Bool)

(assert (=> d!76407 (= res!285177 (not lt!217638))))

(declare-fun lt!217641 () Bool)

(assert (=> d!76407 (= lt!217638 lt!217641)))

(declare-fun lt!217640 () Unit!14051)

(declare-fun e!280808 () Unit!14051)

(assert (=> d!76407 (= lt!217640 e!280808)))

(declare-fun c!57562 () Bool)

(assert (=> d!76407 (= c!57562 lt!217641)))

(declare-fun containsKey!352 (List!9057 (_ BitVec 64)) Bool)

(assert (=> d!76407 (= lt!217641 (containsKey!352 (toList!3972 lt!217611) (_1!4511 lt!217578)))))

(assert (=> d!76407 (= (contains!2575 lt!217611 (_1!4511 lt!217578)) lt!217638)))

(declare-fun b!477819 () Bool)

(declare-fun lt!217639 () Unit!14051)

(assert (=> b!477819 (= e!280808 lt!217639)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!300 (List!9057 (_ BitVec 64)) Unit!14051)

(assert (=> b!477819 (= lt!217639 (lemmaContainsKeyImpliesGetValueByKeyDefined!300 (toList!3972 lt!217611) (_1!4511 lt!217578)))))

(declare-fun isDefined!301 (Option!396) Bool)

(assert (=> b!477819 (isDefined!301 (getValueByKey!390 (toList!3972 lt!217611) (_1!4511 lt!217578)))))

(declare-fun b!477820 () Bool)

(declare-fun Unit!14056 () Unit!14051)

(assert (=> b!477820 (= e!280808 Unit!14056)))

(declare-fun b!477821 () Bool)

(assert (=> b!477821 (= e!280809 (isDefined!301 (getValueByKey!390 (toList!3972 lt!217611) (_1!4511 lt!217578))))))

(assert (= (and d!76407 c!57562) b!477819))

(assert (= (and d!76407 (not c!57562)) b!477820))

(assert (= (and d!76407 (not res!285177)) b!477821))

(declare-fun m!460267 () Bool)

(assert (=> d!76407 m!460267))

(declare-fun m!460271 () Bool)

(assert (=> b!477819 m!460271))

(assert (=> b!477819 m!460245))

(assert (=> b!477819 m!460245))

(declare-fun m!460275 () Bool)

(assert (=> b!477819 m!460275))

(assert (=> b!477821 m!460245))

(assert (=> b!477821 m!460245))

(assert (=> b!477821 m!460275))

(assert (=> d!76397 d!76407))

(declare-fun b!477843 () Bool)

(declare-fun e!280820 () Option!396)

(declare-fun e!280821 () Option!396)

(assert (=> b!477843 (= e!280820 e!280821)))

(declare-fun c!57574 () Bool)

(assert (=> b!477843 (= c!57574 (and ((_ is Cons!9053) lt!217612) (not (= (_1!4511 (h!9909 lt!217612)) (_1!4511 lt!217578)))))))

(declare-fun b!477842 () Bool)

(assert (=> b!477842 (= e!280820 (Some!395 (_2!4511 (h!9909 lt!217612))))))

(declare-fun b!477845 () Bool)

(assert (=> b!477845 (= e!280821 None!394)))

(declare-fun b!477844 () Bool)

(assert (=> b!477844 (= e!280821 (getValueByKey!390 (t!15222 lt!217612) (_1!4511 lt!217578)))))

(declare-fun d!76411 () Bool)

(declare-fun c!57573 () Bool)

(assert (=> d!76411 (= c!57573 (and ((_ is Cons!9053) lt!217612) (= (_1!4511 (h!9909 lt!217612)) (_1!4511 lt!217578))))))

(assert (=> d!76411 (= (getValueByKey!390 lt!217612 (_1!4511 lt!217578)) e!280820)))

(assert (= (and d!76411 c!57573) b!477842))

(assert (= (and d!76411 (not c!57573)) b!477843))

(assert (= (and b!477843 c!57574) b!477844))

(assert (= (and b!477843 (not c!57574)) b!477845))

(declare-fun m!460279 () Bool)

(assert (=> b!477844 m!460279))

(assert (=> d!76397 d!76411))

(declare-fun d!76415 () Bool)

(assert (=> d!76415 (= (getValueByKey!390 lt!217612 (_1!4511 lt!217578)) (Some!395 (_2!4511 lt!217578)))))

(declare-fun lt!217646 () Unit!14051)

(declare-fun choose!1370 (List!9057 (_ BitVec 64) B!1060) Unit!14051)

(assert (=> d!76415 (= lt!217646 (choose!1370 lt!217612 (_1!4511 lt!217578) (_2!4511 lt!217578)))))

(declare-fun e!280826 () Bool)

(assert (=> d!76415 e!280826))

(declare-fun res!285186 () Bool)

(assert (=> d!76415 (=> (not res!285186) (not e!280826))))

(assert (=> d!76415 (= res!285186 (isStrictlySorted!391 lt!217612))))

(assert (=> d!76415 (= (lemmaContainsTupThenGetReturnValue!212 lt!217612 (_1!4511 lt!217578) (_2!4511 lt!217578)) lt!217646)))

(declare-fun b!477854 () Bool)

(declare-fun res!285187 () Bool)

(assert (=> b!477854 (=> (not res!285187) (not e!280826))))

(assert (=> b!477854 (= res!285187 (containsKey!352 lt!217612 (_1!4511 lt!217578)))))

(declare-fun b!477855 () Bool)

(assert (=> b!477855 (= e!280826 (contains!2577 lt!217612 (tuple2!9001 (_1!4511 lt!217578) (_2!4511 lt!217578))))))

(assert (= (and d!76415 res!285186) b!477854))

(assert (= (and b!477854 res!285187) b!477855))

(assert (=> d!76415 m!460239))

(declare-fun m!460281 () Bool)

(assert (=> d!76415 m!460281))

(declare-fun m!460283 () Bool)

(assert (=> d!76415 m!460283))

(declare-fun m!460287 () Bool)

(assert (=> b!477854 m!460287))

(declare-fun m!460293 () Bool)

(assert (=> b!477855 m!460293))

(assert (=> d!76397 d!76415))

(declare-fun c!57599 () Bool)

(declare-fun c!57597 () Bool)

(declare-fun e!280867 () List!9057)

(declare-fun b!477922 () Bool)

(assert (=> b!477922 (= e!280867 (ite c!57599 (t!15222 (toList!3972 lm!215)) (ite c!57597 (Cons!9053 (h!9909 (toList!3972 lm!215)) (t!15222 (toList!3972 lm!215))) Nil!9054)))))

(declare-fun b!477923 () Bool)

(declare-fun res!285210 () Bool)

(declare-fun e!280868 () Bool)

(assert (=> b!477923 (=> (not res!285210) (not e!280868))))

(declare-fun lt!217655 () List!9057)

(assert (=> b!477923 (= res!285210 (containsKey!352 lt!217655 (_1!4511 lt!217578)))))

(declare-fun bm!30803 () Bool)

(declare-fun call!30807 () List!9057)

(declare-fun call!30806 () List!9057)

(assert (=> bm!30803 (= call!30807 call!30806)))

(declare-fun b!477924 () Bool)

(assert (=> b!477924 (= e!280868 (contains!2577 lt!217655 (tuple2!9001 (_1!4511 lt!217578) (_2!4511 lt!217578))))))

(declare-fun b!477925 () Bool)

(declare-fun e!280870 () List!9057)

(declare-fun call!30808 () List!9057)

(assert (=> b!477925 (= e!280870 call!30808)))

(declare-fun d!76417 () Bool)

(assert (=> d!76417 e!280868))

(declare-fun res!285211 () Bool)

(assert (=> d!76417 (=> (not res!285211) (not e!280868))))

(assert (=> d!76417 (= res!285211 (isStrictlySorted!391 lt!217655))))

(assert (=> d!76417 (= lt!217655 e!280870)))

(declare-fun c!57600 () Bool)

(assert (=> d!76417 (= c!57600 (and ((_ is Cons!9053) (toList!3972 lm!215)) (bvslt (_1!4511 (h!9909 (toList!3972 lm!215))) (_1!4511 lt!217578))))))

(assert (=> d!76417 (isStrictlySorted!391 (toList!3972 lm!215))))

(assert (=> d!76417 (= (insertStrictlySorted!215 (toList!3972 lm!215) (_1!4511 lt!217578) (_2!4511 lt!217578)) lt!217655)))

(declare-fun b!477926 () Bool)

(assert (=> b!477926 (= c!57597 (and ((_ is Cons!9053) (toList!3972 lm!215)) (bvsgt (_1!4511 (h!9909 (toList!3972 lm!215))) (_1!4511 lt!217578))))))

(declare-fun e!280869 () List!9057)

(declare-fun e!280866 () List!9057)

(assert (=> b!477926 (= e!280869 e!280866)))

(declare-fun b!477927 () Bool)

(assert (=> b!477927 (= e!280870 e!280869)))

(assert (=> b!477927 (= c!57599 (and ((_ is Cons!9053) (toList!3972 lm!215)) (= (_1!4511 (h!9909 (toList!3972 lm!215))) (_1!4511 lt!217578))))))

(declare-fun b!477928 () Bool)

(assert (=> b!477928 (= e!280869 call!30806)))

(declare-fun b!477929 () Bool)

(assert (=> b!477929 (= e!280866 call!30807)))

(declare-fun b!477930 () Bool)

(assert (=> b!477930 (= e!280866 call!30807)))

(declare-fun bm!30804 () Bool)

(assert (=> bm!30804 (= call!30806 call!30808)))

(declare-fun bm!30805 () Bool)

(declare-fun $colon$colon!114 (List!9057 tuple2!9000) List!9057)

(assert (=> bm!30805 (= call!30808 ($colon$colon!114 e!280867 (ite c!57600 (h!9909 (toList!3972 lm!215)) (tuple2!9001 (_1!4511 lt!217578) (_2!4511 lt!217578)))))))

(declare-fun c!57598 () Bool)

(assert (=> bm!30805 (= c!57598 c!57600)))

(declare-fun b!477931 () Bool)

(assert (=> b!477931 (= e!280867 (insertStrictlySorted!215 (t!15222 (toList!3972 lm!215)) (_1!4511 lt!217578) (_2!4511 lt!217578)))))

(assert (= (and d!76417 c!57600) b!477925))

(assert (= (and d!76417 (not c!57600)) b!477927))

(assert (= (and b!477927 c!57599) b!477928))

(assert (= (and b!477927 (not c!57599)) b!477926))

(assert (= (and b!477926 c!57597) b!477930))

(assert (= (and b!477926 (not c!57597)) b!477929))

(assert (= (or b!477930 b!477929) bm!30803))

(assert (= (or b!477928 bm!30803) bm!30804))

(assert (= (or b!477925 bm!30804) bm!30805))

(assert (= (and bm!30805 c!57598) b!477931))

(assert (= (and bm!30805 (not c!57598)) b!477922))

(assert (= (and d!76417 res!285211) b!477923))

(assert (= (and b!477923 res!285210) b!477924))

(declare-fun m!460307 () Bool)

(assert (=> bm!30805 m!460307))

(declare-fun m!460309 () Bool)

(assert (=> b!477931 m!460309))

(declare-fun m!460311 () Bool)

(assert (=> b!477923 m!460311))

(declare-fun m!460317 () Bool)

(assert (=> b!477924 m!460317))

(declare-fun m!460319 () Bool)

(assert (=> d!76417 m!460319))

(assert (=> d!76417 m!460213))

(assert (=> d!76397 d!76417))

(declare-fun d!76429 () Bool)

(assert (=> d!76429 (= (isEmpty!613 (toList!3972 lm!215)) ((_ is Nil!9054) (toList!3972 lm!215)))))

(assert (=> d!76377 d!76429))

(declare-fun d!76433 () Bool)

(declare-fun lt!217669 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!210 (List!9057) (InoxSet tuple2!9000))

(assert (=> d!76433 (= lt!217669 (select (content!210 (toList!3972 lt!217611)) lt!217578))))

(declare-fun e!280888 () Bool)

(assert (=> d!76433 (= lt!217669 e!280888)))

(declare-fun res!285224 () Bool)

(assert (=> d!76433 (=> (not res!285224) (not e!280888))))

(assert (=> d!76433 (= res!285224 ((_ is Cons!9053) (toList!3972 lt!217611)))))

(assert (=> d!76433 (= (contains!2577 (toList!3972 lt!217611) lt!217578) lt!217669)))

(declare-fun b!477956 () Bool)

(declare-fun e!280889 () Bool)

(assert (=> b!477956 (= e!280888 e!280889)))

(declare-fun res!285225 () Bool)

(assert (=> b!477956 (=> res!285225 e!280889)))

(assert (=> b!477956 (= res!285225 (= (h!9909 (toList!3972 lt!217611)) lt!217578))))

(declare-fun b!477957 () Bool)

(assert (=> b!477957 (= e!280889 (contains!2577 (t!15222 (toList!3972 lt!217611)) lt!217578))))

(assert (= (and d!76433 res!285224) b!477956))

(assert (= (and b!477956 (not res!285225)) b!477957))

(declare-fun m!460331 () Bool)

(assert (=> d!76433 m!460331))

(declare-fun m!460333 () Bool)

(assert (=> d!76433 m!460333))

(declare-fun m!460335 () Bool)

(assert (=> b!477957 m!460335))

(assert (=> b!477789 d!76433))

(declare-fun d!76439 () Bool)

(declare-fun res!285228 () Bool)

(declare-fun e!280892 () Bool)

(assert (=> d!76439 (=> res!285228 e!280892)))

(assert (=> d!76439 (= res!285228 ((_ is Nil!9054) (t!15222 (toList!3972 lm!215))))))

(assert (=> d!76439 (= (forall!201 (t!15222 (toList!3972 lm!215)) p!166) e!280892)))

(declare-fun b!477960 () Bool)

(declare-fun e!280893 () Bool)

(assert (=> b!477960 (= e!280892 e!280893)))

(declare-fun res!285229 () Bool)

(assert (=> b!477960 (=> (not res!285229) (not e!280893))))

(assert (=> b!477960 (= res!285229 (dynLambda!948 p!166 (h!9909 (t!15222 (toList!3972 lm!215)))))))

(declare-fun b!477961 () Bool)

(assert (=> b!477961 (= e!280893 (forall!201 (t!15222 (t!15222 (toList!3972 lm!215))) p!166))))

(assert (= (and d!76439 (not res!285228)) b!477960))

(assert (= (and b!477960 res!285229) b!477961))

(declare-fun b_lambda!10747 () Bool)

(assert (=> (not b_lambda!10747) (not b!477960)))

(declare-fun t!15243 () Bool)

(declare-fun tb!4139 () Bool)

(assert (=> (and start!42998 (= p!166 p!166) t!15243) tb!4139))

(declare-fun result!7713 () Bool)

(assert (=> tb!4139 (= result!7713 true)))

(assert (=> b!477960 t!15243))

(declare-fun b_and!20847 () Bool)

(assert (= b_and!20843 (and (=> t!15243 result!7713) b_and!20847)))

(declare-fun m!460337 () Bool)

(assert (=> b!477960 m!460337))

(declare-fun m!460339 () Bool)

(assert (=> b!477961 m!460339))

(assert (=> b!477758 d!76439))

(declare-fun d!76441 () Bool)

(declare-fun res!285239 () Bool)

(declare-fun e!280908 () Bool)

(assert (=> d!76441 (=> res!285239 e!280908)))

(assert (=> d!76441 (= res!285239 (or ((_ is Nil!9054) (toList!3972 lm!215)) ((_ is Nil!9054) (t!15222 (toList!3972 lm!215)))))))

(assert (=> d!76441 (= (isStrictlySorted!391 (toList!3972 lm!215)) e!280908)))

(declare-fun b!477981 () Bool)

(declare-fun e!280909 () Bool)

(assert (=> b!477981 (= e!280908 e!280909)))

(declare-fun res!285240 () Bool)

(assert (=> b!477981 (=> (not res!285240) (not e!280909))))

(assert (=> b!477981 (= res!285240 (bvslt (_1!4511 (h!9909 (toList!3972 lm!215))) (_1!4511 (h!9909 (t!15222 (toList!3972 lm!215))))))))

(declare-fun b!477982 () Bool)

(assert (=> b!477982 (= e!280909 (isStrictlySorted!391 (t!15222 (toList!3972 lm!215))))))

(assert (= (and d!76441 (not res!285239)) b!477981))

(assert (= (and b!477981 res!285240) b!477982))

(declare-fun m!460361 () Bool)

(assert (=> b!477982 m!460361))

(assert (=> d!76391 d!76441))

(declare-fun b!477984 () Bool)

(declare-fun e!280910 () Option!396)

(declare-fun e!280911 () Option!396)

(assert (=> b!477984 (= e!280910 e!280911)))

(declare-fun c!57613 () Bool)

(assert (=> b!477984 (= c!57613 (and ((_ is Cons!9053) (toList!3972 lt!217611)) (not (= (_1!4511 (h!9909 (toList!3972 lt!217611))) (_1!4511 lt!217578)))))))

(declare-fun b!477983 () Bool)

(assert (=> b!477983 (= e!280910 (Some!395 (_2!4511 (h!9909 (toList!3972 lt!217611)))))))

(declare-fun b!477986 () Bool)

(assert (=> b!477986 (= e!280911 None!394)))

(declare-fun b!477985 () Bool)

(assert (=> b!477985 (= e!280911 (getValueByKey!390 (t!15222 (toList!3972 lt!217611)) (_1!4511 lt!217578)))))

(declare-fun d!76453 () Bool)

(declare-fun c!57612 () Bool)

(assert (=> d!76453 (= c!57612 (and ((_ is Cons!9053) (toList!3972 lt!217611)) (= (_1!4511 (h!9909 (toList!3972 lt!217611))) (_1!4511 lt!217578))))))

(assert (=> d!76453 (= (getValueByKey!390 (toList!3972 lt!217611) (_1!4511 lt!217578)) e!280910)))

(assert (= (and d!76453 c!57612) b!477983))

(assert (= (and d!76453 (not c!57612)) b!477984))

(assert (= (and b!477984 c!57613) b!477985))

(assert (= (and b!477984 (not c!57613)) b!477986))

(declare-fun m!460363 () Bool)

(assert (=> b!477985 m!460363))

(assert (=> b!477788 d!76453))

(declare-fun b!477991 () Bool)

(declare-fun e!280916 () Bool)

(declare-fun tp!42452 () Bool)

(assert (=> b!477991 (= e!280916 (and tp_is_empty!13533 tp!42452))))

(assert (=> b!477794 (= tp!42448 e!280916)))

(assert (= (and b!477794 ((_ is Cons!9053) (t!15222 (toList!3972 lm!215)))) b!477991))

(declare-fun b_lambda!10751 () Bool)

(assert (= b_lambda!10743 (or (and start!42998 b_free!12111) b_lambda!10751)))

(declare-fun b_lambda!10753 () Bool)

(assert (= b_lambda!10747 (or (and start!42998 b_free!12111) b_lambda!10753)))

(check-sat (not b!477819) (not b!477961) tp_is_empty!13533 (not b!477982) (not b!477957) (not b_lambda!10735) (not d!76433) (not b!477844) (not bm!30805) (not b!477931) (not d!76407) (not b_next!12111) (not d!76417) (not b_lambda!10715) (not d!76415) (not b!477991) (not b!477924) (not b!477923) (not b_lambda!10753) (not b!477985) (not b!477854) (not b_lambda!10737) (not b_lambda!10751) (not b!477855) (not b!477821) b_and!20847 (not b!477803))
(check-sat b_and!20847 (not b_next!12111))
(get-model)

(declare-fun d!76463 () Bool)

(declare-fun c!57628 () Bool)

(assert (=> d!76463 (= c!57628 ((_ is Nil!9054) (toList!3972 lt!217611)))))

(declare-fun e!280945 () (InoxSet tuple2!9000))

(assert (=> d!76463 (= (content!210 (toList!3972 lt!217611)) e!280945)))

(declare-fun b!478040 () Bool)

(assert (=> b!478040 (= e!280945 ((as const (Array tuple2!9000 Bool)) false))))

(declare-fun b!478041 () Bool)

(assert (=> b!478041 (= e!280945 ((_ map or) (store ((as const (Array tuple2!9000 Bool)) false) (h!9909 (toList!3972 lt!217611)) true) (content!210 (t!15222 (toList!3972 lt!217611)))))))

(assert (= (and d!76463 c!57628) b!478040))

(assert (= (and d!76463 (not c!57628)) b!478041))

(declare-fun m!460393 () Bool)

(assert (=> b!478041 m!460393))

(declare-fun m!460395 () Bool)

(assert (=> b!478041 m!460395))

(assert (=> d!76433 d!76463))

(declare-fun d!76465 () Bool)

(declare-fun res!285267 () Bool)

(declare-fun e!280950 () Bool)

(assert (=> d!76465 (=> res!285267 e!280950)))

(assert (=> d!76465 (= res!285267 (and ((_ is Cons!9053) lt!217655) (= (_1!4511 (h!9909 lt!217655)) (_1!4511 lt!217578))))))

(assert (=> d!76465 (= (containsKey!352 lt!217655 (_1!4511 lt!217578)) e!280950)))

(declare-fun b!478046 () Bool)

(declare-fun e!280951 () Bool)

(assert (=> b!478046 (= e!280950 e!280951)))

(declare-fun res!285268 () Bool)

(assert (=> b!478046 (=> (not res!285268) (not e!280951))))

(assert (=> b!478046 (= res!285268 (and (or (not ((_ is Cons!9053) lt!217655)) (bvsle (_1!4511 (h!9909 lt!217655)) (_1!4511 lt!217578))) ((_ is Cons!9053) lt!217655) (bvslt (_1!4511 (h!9909 lt!217655)) (_1!4511 lt!217578))))))

(declare-fun b!478047 () Bool)

(assert (=> b!478047 (= e!280951 (containsKey!352 (t!15222 lt!217655) (_1!4511 lt!217578)))))

(assert (= (and d!76465 (not res!285267)) b!478046))

(assert (= (and b!478046 res!285268) b!478047))

(declare-fun m!460397 () Bool)

(assert (=> b!478047 m!460397))

(assert (=> b!477923 d!76465))

(declare-fun d!76467 () Bool)

(assert (=> d!76467 (isDefined!301 (getValueByKey!390 (toList!3972 lt!217611) (_1!4511 lt!217578)))))

(declare-fun lt!217683 () Unit!14051)

(declare-fun choose!1372 (List!9057 (_ BitVec 64)) Unit!14051)

(assert (=> d!76467 (= lt!217683 (choose!1372 (toList!3972 lt!217611) (_1!4511 lt!217578)))))

(declare-fun e!280954 () Bool)

(assert (=> d!76467 e!280954))

(declare-fun res!285271 () Bool)

(assert (=> d!76467 (=> (not res!285271) (not e!280954))))

(assert (=> d!76467 (= res!285271 (isStrictlySorted!391 (toList!3972 lt!217611)))))

(assert (=> d!76467 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!300 (toList!3972 lt!217611) (_1!4511 lt!217578)) lt!217683)))

(declare-fun b!478050 () Bool)

(assert (=> b!478050 (= e!280954 (containsKey!352 (toList!3972 lt!217611) (_1!4511 lt!217578)))))

(assert (= (and d!76467 res!285271) b!478050))

(assert (=> d!76467 m!460245))

(assert (=> d!76467 m!460245))

(assert (=> d!76467 m!460275))

(declare-fun m!460399 () Bool)

(assert (=> d!76467 m!460399))

(declare-fun m!460401 () Bool)

(assert (=> d!76467 m!460401))

(assert (=> b!478050 m!460267))

(assert (=> b!477819 d!76467))

(declare-fun d!76469 () Bool)

(declare-fun isEmpty!615 (Option!396) Bool)

(assert (=> d!76469 (= (isDefined!301 (getValueByKey!390 (toList!3972 lt!217611) (_1!4511 lt!217578))) (not (isEmpty!615 (getValueByKey!390 (toList!3972 lt!217611) (_1!4511 lt!217578)))))))

(declare-fun bs!15192 () Bool)

(assert (= bs!15192 d!76469))

(assert (=> bs!15192 m!460245))

(declare-fun m!460403 () Bool)

(assert (=> bs!15192 m!460403))

(assert (=> b!477819 d!76469))

(assert (=> b!477819 d!76453))

(declare-fun e!280956 () List!9057)

(declare-fun c!57631 () Bool)

(declare-fun c!57629 () Bool)

(declare-fun b!478051 () Bool)

(assert (=> b!478051 (= e!280956 (ite c!57631 (t!15222 (t!15222 (toList!3972 lm!215))) (ite c!57629 (Cons!9053 (h!9909 (t!15222 (toList!3972 lm!215))) (t!15222 (t!15222 (toList!3972 lm!215)))) Nil!9054)))))

(declare-fun b!478052 () Bool)

(declare-fun res!285272 () Bool)

(declare-fun e!280957 () Bool)

(assert (=> b!478052 (=> (not res!285272) (not e!280957))))

(declare-fun lt!217684 () List!9057)

(assert (=> b!478052 (= res!285272 (containsKey!352 lt!217684 (_1!4511 lt!217578)))))

(declare-fun bm!30818 () Bool)

(declare-fun call!30822 () List!9057)

(declare-fun call!30821 () List!9057)

(assert (=> bm!30818 (= call!30822 call!30821)))

(declare-fun b!478053 () Bool)

(assert (=> b!478053 (= e!280957 (contains!2577 lt!217684 (tuple2!9001 (_1!4511 lt!217578) (_2!4511 lt!217578))))))

(declare-fun b!478054 () Bool)

(declare-fun e!280959 () List!9057)

(declare-fun call!30823 () List!9057)

(assert (=> b!478054 (= e!280959 call!30823)))

(declare-fun d!76471 () Bool)

(assert (=> d!76471 e!280957))

(declare-fun res!285273 () Bool)

(assert (=> d!76471 (=> (not res!285273) (not e!280957))))

(assert (=> d!76471 (= res!285273 (isStrictlySorted!391 lt!217684))))

(assert (=> d!76471 (= lt!217684 e!280959)))

(declare-fun c!57632 () Bool)

(assert (=> d!76471 (= c!57632 (and ((_ is Cons!9053) (t!15222 (toList!3972 lm!215))) (bvslt (_1!4511 (h!9909 (t!15222 (toList!3972 lm!215)))) (_1!4511 lt!217578))))))

(assert (=> d!76471 (isStrictlySorted!391 (t!15222 (toList!3972 lm!215)))))

(assert (=> d!76471 (= (insertStrictlySorted!215 (t!15222 (toList!3972 lm!215)) (_1!4511 lt!217578) (_2!4511 lt!217578)) lt!217684)))

(declare-fun b!478055 () Bool)

(assert (=> b!478055 (= c!57629 (and ((_ is Cons!9053) (t!15222 (toList!3972 lm!215))) (bvsgt (_1!4511 (h!9909 (t!15222 (toList!3972 lm!215)))) (_1!4511 lt!217578))))))

(declare-fun e!280958 () List!9057)

(declare-fun e!280955 () List!9057)

(assert (=> b!478055 (= e!280958 e!280955)))

(declare-fun b!478056 () Bool)

(assert (=> b!478056 (= e!280959 e!280958)))

(assert (=> b!478056 (= c!57631 (and ((_ is Cons!9053) (t!15222 (toList!3972 lm!215))) (= (_1!4511 (h!9909 (t!15222 (toList!3972 lm!215)))) (_1!4511 lt!217578))))))

(declare-fun b!478057 () Bool)

(assert (=> b!478057 (= e!280958 call!30821)))

(declare-fun b!478058 () Bool)

(assert (=> b!478058 (= e!280955 call!30822)))

(declare-fun b!478059 () Bool)

(assert (=> b!478059 (= e!280955 call!30822)))

(declare-fun bm!30819 () Bool)

(assert (=> bm!30819 (= call!30821 call!30823)))

(declare-fun bm!30820 () Bool)

(assert (=> bm!30820 (= call!30823 ($colon$colon!114 e!280956 (ite c!57632 (h!9909 (t!15222 (toList!3972 lm!215))) (tuple2!9001 (_1!4511 lt!217578) (_2!4511 lt!217578)))))))

(declare-fun c!57630 () Bool)

(assert (=> bm!30820 (= c!57630 c!57632)))

(declare-fun b!478060 () Bool)

(assert (=> b!478060 (= e!280956 (insertStrictlySorted!215 (t!15222 (t!15222 (toList!3972 lm!215))) (_1!4511 lt!217578) (_2!4511 lt!217578)))))

(assert (= (and d!76471 c!57632) b!478054))

(assert (= (and d!76471 (not c!57632)) b!478056))

(assert (= (and b!478056 c!57631) b!478057))

(assert (= (and b!478056 (not c!57631)) b!478055))

(assert (= (and b!478055 c!57629) b!478059))

(assert (= (and b!478055 (not c!57629)) b!478058))

(assert (= (or b!478059 b!478058) bm!30818))

(assert (= (or b!478057 bm!30818) bm!30819))

(assert (= (or b!478054 bm!30819) bm!30820))

(assert (= (and bm!30820 c!57630) b!478060))

(assert (= (and bm!30820 (not c!57630)) b!478051))

(assert (= (and d!76471 res!285273) b!478052))

(assert (= (and b!478052 res!285272) b!478053))

(declare-fun m!460405 () Bool)

(assert (=> bm!30820 m!460405))

(declare-fun m!460407 () Bool)

(assert (=> b!478060 m!460407))

(declare-fun m!460409 () Bool)

(assert (=> b!478052 m!460409))

(declare-fun m!460411 () Bool)

(assert (=> b!478053 m!460411))

(declare-fun m!460413 () Bool)

(assert (=> d!76471 m!460413))

(assert (=> d!76471 m!460361))

(assert (=> b!477931 d!76471))

(declare-fun d!76473 () Bool)

(assert (=> d!76473 (= ($colon$colon!114 e!280867 (ite c!57600 (h!9909 (toList!3972 lm!215)) (tuple2!9001 (_1!4511 lt!217578) (_2!4511 lt!217578)))) (Cons!9053 (ite c!57600 (h!9909 (toList!3972 lm!215)) (tuple2!9001 (_1!4511 lt!217578) (_2!4511 lt!217578))) e!280867))))

(assert (=> bm!30805 d!76473))

(declare-fun d!76475 () Bool)

(declare-fun lt!217685 () Bool)

(assert (=> d!76475 (= lt!217685 (select (content!210 (t!15222 (toList!3972 lt!217611))) lt!217578))))

(declare-fun e!280960 () Bool)

(assert (=> d!76475 (= lt!217685 e!280960)))

(declare-fun res!285274 () Bool)

(assert (=> d!76475 (=> (not res!285274) (not e!280960))))

(assert (=> d!76475 (= res!285274 ((_ is Cons!9053) (t!15222 (toList!3972 lt!217611))))))

(assert (=> d!76475 (= (contains!2577 (t!15222 (toList!3972 lt!217611)) lt!217578) lt!217685)))

(declare-fun b!478061 () Bool)

(declare-fun e!280961 () Bool)

(assert (=> b!478061 (= e!280960 e!280961)))

(declare-fun res!285275 () Bool)

(assert (=> b!478061 (=> res!285275 e!280961)))

(assert (=> b!478061 (= res!285275 (= (h!9909 (t!15222 (toList!3972 lt!217611))) lt!217578))))

(declare-fun b!478062 () Bool)

(assert (=> b!478062 (= e!280961 (contains!2577 (t!15222 (t!15222 (toList!3972 lt!217611))) lt!217578))))

(assert (= (and d!76475 res!285274) b!478061))

(assert (= (and b!478061 (not res!285275)) b!478062))

(assert (=> d!76475 m!460395))

(declare-fun m!460415 () Bool)

(assert (=> d!76475 m!460415))

(declare-fun m!460417 () Bool)

(assert (=> b!478062 m!460417))

(assert (=> b!477957 d!76475))

(declare-fun b!478064 () Bool)

(declare-fun e!280962 () Option!396)

(declare-fun e!280963 () Option!396)

(assert (=> b!478064 (= e!280962 e!280963)))

(declare-fun c!57634 () Bool)

(assert (=> b!478064 (= c!57634 (and ((_ is Cons!9053) (t!15222 lt!217612)) (not (= (_1!4511 (h!9909 (t!15222 lt!217612))) (_1!4511 lt!217578)))))))

(declare-fun b!478063 () Bool)

(assert (=> b!478063 (= e!280962 (Some!395 (_2!4511 (h!9909 (t!15222 lt!217612)))))))

(declare-fun b!478066 () Bool)

(assert (=> b!478066 (= e!280963 None!394)))

(declare-fun b!478065 () Bool)

(assert (=> b!478065 (= e!280963 (getValueByKey!390 (t!15222 (t!15222 lt!217612)) (_1!4511 lt!217578)))))

(declare-fun d!76477 () Bool)

(declare-fun c!57633 () Bool)

(assert (=> d!76477 (= c!57633 (and ((_ is Cons!9053) (t!15222 lt!217612)) (= (_1!4511 (h!9909 (t!15222 lt!217612))) (_1!4511 lt!217578))))))

(assert (=> d!76477 (= (getValueByKey!390 (t!15222 lt!217612) (_1!4511 lt!217578)) e!280962)))

(assert (= (and d!76477 c!57633) b!478063))

(assert (= (and d!76477 (not c!57633)) b!478064))

(assert (= (and b!478064 c!57634) b!478065))

(assert (= (and b!478064 (not c!57634)) b!478066))

(declare-fun m!460419 () Bool)

(assert (=> b!478065 m!460419))

(assert (=> b!477844 d!76477))

(declare-fun b!478068 () Bool)

(declare-fun e!280964 () Option!396)

(declare-fun e!280965 () Option!396)

(assert (=> b!478068 (= e!280964 e!280965)))

(declare-fun c!57636 () Bool)

(assert (=> b!478068 (= c!57636 (and ((_ is Cons!9053) (t!15222 (toList!3972 lt!217611))) (not (= (_1!4511 (h!9909 (t!15222 (toList!3972 lt!217611)))) (_1!4511 lt!217578)))))))

(declare-fun b!478067 () Bool)

(assert (=> b!478067 (= e!280964 (Some!395 (_2!4511 (h!9909 (t!15222 (toList!3972 lt!217611))))))))

(declare-fun b!478070 () Bool)

(assert (=> b!478070 (= e!280965 None!394)))

(declare-fun b!478069 () Bool)

(assert (=> b!478069 (= e!280965 (getValueByKey!390 (t!15222 (t!15222 (toList!3972 lt!217611))) (_1!4511 lt!217578)))))

(declare-fun d!76479 () Bool)

(declare-fun c!57635 () Bool)

(assert (=> d!76479 (= c!57635 (and ((_ is Cons!9053) (t!15222 (toList!3972 lt!217611))) (= (_1!4511 (h!9909 (t!15222 (toList!3972 lt!217611)))) (_1!4511 lt!217578))))))

(assert (=> d!76479 (= (getValueByKey!390 (t!15222 (toList!3972 lt!217611)) (_1!4511 lt!217578)) e!280964)))

(assert (= (and d!76479 c!57635) b!478067))

(assert (= (and d!76479 (not c!57635)) b!478068))

(assert (= (and b!478068 c!57636) b!478069))

(assert (= (and b!478068 (not c!57636)) b!478070))

(declare-fun m!460421 () Bool)

(assert (=> b!478069 m!460421))

(assert (=> b!477985 d!76479))

(declare-fun d!76481 () Bool)

(declare-fun res!285276 () Bool)

(declare-fun e!280966 () Bool)

(assert (=> d!76481 (=> res!285276 e!280966)))

(assert (=> d!76481 (= res!285276 ((_ is Nil!9054) (t!15222 (t!15222 (toList!3972 lm!215)))))))

(assert (=> d!76481 (= (forall!201 (t!15222 (t!15222 (toList!3972 lm!215))) p!166) e!280966)))

(declare-fun b!478071 () Bool)

(declare-fun e!280967 () Bool)

(assert (=> b!478071 (= e!280966 e!280967)))

(declare-fun res!285277 () Bool)

(assert (=> b!478071 (=> (not res!285277) (not e!280967))))

(assert (=> b!478071 (= res!285277 (dynLambda!948 p!166 (h!9909 (t!15222 (t!15222 (toList!3972 lm!215))))))))

(declare-fun b!478072 () Bool)

(assert (=> b!478072 (= e!280967 (forall!201 (t!15222 (t!15222 (t!15222 (toList!3972 lm!215)))) p!166))))

(assert (= (and d!76481 (not res!285276)) b!478071))

(assert (= (and b!478071 res!285277) b!478072))

(declare-fun b_lambda!10767 () Bool)

(assert (=> (not b_lambda!10767) (not b!478071)))

(declare-fun t!15252 () Bool)

(declare-fun tb!4147 () Bool)

(assert (=> (and start!42998 (= p!166 p!166) t!15252) tb!4147))

(declare-fun result!7721 () Bool)

(assert (=> tb!4147 (= result!7721 true)))

(assert (=> b!478071 t!15252))

(declare-fun b_and!20855 () Bool)

(assert (= b_and!20847 (and (=> t!15252 result!7721) b_and!20855)))

(declare-fun m!460423 () Bool)

(assert (=> b!478071 m!460423))

(declare-fun m!460425 () Bool)

(assert (=> b!478072 m!460425))

(assert (=> b!477961 d!76481))

(assert (=> d!76415 d!76411))

(declare-fun d!76483 () Bool)

(assert (=> d!76483 (= (getValueByKey!390 lt!217612 (_1!4511 lt!217578)) (Some!395 (_2!4511 lt!217578)))))

(assert (=> d!76483 true))

(declare-fun _$22!559 () Unit!14051)

(assert (=> d!76483 (= (choose!1370 lt!217612 (_1!4511 lt!217578) (_2!4511 lt!217578)) _$22!559)))

(declare-fun bs!15193 () Bool)

(assert (= bs!15193 d!76483))

(assert (=> bs!15193 m!460239))

(assert (=> d!76415 d!76483))

(declare-fun d!76485 () Bool)

(declare-fun res!285278 () Bool)

(declare-fun e!280968 () Bool)

(assert (=> d!76485 (=> res!285278 e!280968)))

(assert (=> d!76485 (= res!285278 (or ((_ is Nil!9054) lt!217612) ((_ is Nil!9054) (t!15222 lt!217612))))))

(assert (=> d!76485 (= (isStrictlySorted!391 lt!217612) e!280968)))

(declare-fun b!478073 () Bool)

(declare-fun e!280969 () Bool)

(assert (=> b!478073 (= e!280968 e!280969)))

(declare-fun res!285279 () Bool)

(assert (=> b!478073 (=> (not res!285279) (not e!280969))))

(assert (=> b!478073 (= res!285279 (bvslt (_1!4511 (h!9909 lt!217612)) (_1!4511 (h!9909 (t!15222 lt!217612)))))))

(declare-fun b!478074 () Bool)

(assert (=> b!478074 (= e!280969 (isStrictlySorted!391 (t!15222 lt!217612)))))

(assert (= (and d!76485 (not res!285278)) b!478073))

(assert (= (and b!478073 res!285279) b!478074))

(declare-fun m!460427 () Bool)

(assert (=> b!478074 m!460427))

(assert (=> d!76415 d!76485))

(declare-fun d!76487 () Bool)

(declare-fun res!285280 () Bool)

(declare-fun e!280970 () Bool)

(assert (=> d!76487 (=> res!285280 e!280970)))

(assert (=> d!76487 (= res!285280 (or ((_ is Nil!9054) (t!15222 (toList!3972 lm!215))) ((_ is Nil!9054) (t!15222 (t!15222 (toList!3972 lm!215))))))))

(assert (=> d!76487 (= (isStrictlySorted!391 (t!15222 (toList!3972 lm!215))) e!280970)))

(declare-fun b!478075 () Bool)

(declare-fun e!280971 () Bool)

(assert (=> b!478075 (= e!280970 e!280971)))

(declare-fun res!285281 () Bool)

(assert (=> b!478075 (=> (not res!285281) (not e!280971))))

(assert (=> b!478075 (= res!285281 (bvslt (_1!4511 (h!9909 (t!15222 (toList!3972 lm!215)))) (_1!4511 (h!9909 (t!15222 (t!15222 (toList!3972 lm!215)))))))))

(declare-fun b!478076 () Bool)

(assert (=> b!478076 (= e!280971 (isStrictlySorted!391 (t!15222 (t!15222 (toList!3972 lm!215)))))))

(assert (= (and d!76487 (not res!285280)) b!478075))

(assert (= (and b!478075 res!285281) b!478076))

(declare-fun m!460429 () Bool)

(assert (=> b!478076 m!460429))

(assert (=> b!477982 d!76487))

(declare-fun d!76489 () Bool)

(declare-fun res!285282 () Bool)

(declare-fun e!280972 () Bool)

(assert (=> d!76489 (=> res!285282 e!280972)))

(assert (=> d!76489 (= res!285282 ((_ is Nil!9054) (t!15222 (t!15222 (toList!3972 (+!1769 lm!215 lt!217578))))))))

(assert (=> d!76489 (= (forall!201 (t!15222 (t!15222 (toList!3972 (+!1769 lm!215 lt!217578)))) p!166) e!280972)))

(declare-fun b!478077 () Bool)

(declare-fun e!280973 () Bool)

(assert (=> b!478077 (= e!280972 e!280973)))

(declare-fun res!285283 () Bool)

(assert (=> b!478077 (=> (not res!285283) (not e!280973))))

(assert (=> b!478077 (= res!285283 (dynLambda!948 p!166 (h!9909 (t!15222 (t!15222 (toList!3972 (+!1769 lm!215 lt!217578)))))))))

(declare-fun b!478078 () Bool)

(assert (=> b!478078 (= e!280973 (forall!201 (t!15222 (t!15222 (t!15222 (toList!3972 (+!1769 lm!215 lt!217578))))) p!166))))

(assert (= (and d!76489 (not res!285282)) b!478077))

(assert (= (and b!478077 res!285283) b!478078))

(declare-fun b_lambda!10769 () Bool)

(assert (=> (not b_lambda!10769) (not b!478077)))

(declare-fun t!15254 () Bool)

(declare-fun tb!4149 () Bool)

(assert (=> (and start!42998 (= p!166 p!166) t!15254) tb!4149))

(declare-fun result!7723 () Bool)

(assert (=> tb!4149 (= result!7723 true)))

(assert (=> b!478077 t!15254))

(declare-fun b_and!20857 () Bool)

(assert (= b_and!20855 (and (=> t!15254 result!7723) b_and!20857)))

(declare-fun m!460431 () Bool)

(assert (=> b!478077 m!460431))

(declare-fun m!460433 () Bool)

(assert (=> b!478078 m!460433))

(assert (=> b!477803 d!76489))

(declare-fun d!76491 () Bool)

(declare-fun res!285284 () Bool)

(declare-fun e!280974 () Bool)

(assert (=> d!76491 (=> res!285284 e!280974)))

(assert (=> d!76491 (= res!285284 (or ((_ is Nil!9054) lt!217655) ((_ is Nil!9054) (t!15222 lt!217655))))))

(assert (=> d!76491 (= (isStrictlySorted!391 lt!217655) e!280974)))

(declare-fun b!478079 () Bool)

(declare-fun e!280975 () Bool)

(assert (=> b!478079 (= e!280974 e!280975)))

(declare-fun res!285285 () Bool)

(assert (=> b!478079 (=> (not res!285285) (not e!280975))))

(assert (=> b!478079 (= res!285285 (bvslt (_1!4511 (h!9909 lt!217655)) (_1!4511 (h!9909 (t!15222 lt!217655)))))))

(declare-fun b!478080 () Bool)

(assert (=> b!478080 (= e!280975 (isStrictlySorted!391 (t!15222 lt!217655)))))

(assert (= (and d!76491 (not res!285284)) b!478079))

(assert (= (and b!478079 res!285285) b!478080))

(declare-fun m!460435 () Bool)

(assert (=> b!478080 m!460435))

(assert (=> d!76417 d!76491))

(assert (=> d!76417 d!76441))

(declare-fun d!76493 () Bool)

(declare-fun lt!217686 () Bool)

(assert (=> d!76493 (= lt!217686 (select (content!210 lt!217612) (tuple2!9001 (_1!4511 lt!217578) (_2!4511 lt!217578))))))

(declare-fun e!280976 () Bool)

(assert (=> d!76493 (= lt!217686 e!280976)))

(declare-fun res!285286 () Bool)

(assert (=> d!76493 (=> (not res!285286) (not e!280976))))

(assert (=> d!76493 (= res!285286 ((_ is Cons!9053) lt!217612))))

(assert (=> d!76493 (= (contains!2577 lt!217612 (tuple2!9001 (_1!4511 lt!217578) (_2!4511 lt!217578))) lt!217686)))

(declare-fun b!478081 () Bool)

(declare-fun e!280977 () Bool)

(assert (=> b!478081 (= e!280976 e!280977)))

(declare-fun res!285287 () Bool)

(assert (=> b!478081 (=> res!285287 e!280977)))

(assert (=> b!478081 (= res!285287 (= (h!9909 lt!217612) (tuple2!9001 (_1!4511 lt!217578) (_2!4511 lt!217578))))))

(declare-fun b!478082 () Bool)

(assert (=> b!478082 (= e!280977 (contains!2577 (t!15222 lt!217612) (tuple2!9001 (_1!4511 lt!217578) (_2!4511 lt!217578))))))

(assert (= (and d!76493 res!285286) b!478081))

(assert (= (and b!478081 (not res!285287)) b!478082))

(declare-fun m!460437 () Bool)

(assert (=> d!76493 m!460437))

(declare-fun m!460439 () Bool)

(assert (=> d!76493 m!460439))

(declare-fun m!460441 () Bool)

(assert (=> b!478082 m!460441))

(assert (=> b!477855 d!76493))

(declare-fun d!76495 () Bool)

(declare-fun res!285288 () Bool)

(declare-fun e!280978 () Bool)

(assert (=> d!76495 (=> res!285288 e!280978)))

(assert (=> d!76495 (= res!285288 (and ((_ is Cons!9053) lt!217612) (= (_1!4511 (h!9909 lt!217612)) (_1!4511 lt!217578))))))

(assert (=> d!76495 (= (containsKey!352 lt!217612 (_1!4511 lt!217578)) e!280978)))

(declare-fun b!478083 () Bool)

(declare-fun e!280979 () Bool)

(assert (=> b!478083 (= e!280978 e!280979)))

(declare-fun res!285289 () Bool)

(assert (=> b!478083 (=> (not res!285289) (not e!280979))))

(assert (=> b!478083 (= res!285289 (and (or (not ((_ is Cons!9053) lt!217612)) (bvsle (_1!4511 (h!9909 lt!217612)) (_1!4511 lt!217578))) ((_ is Cons!9053) lt!217612) (bvslt (_1!4511 (h!9909 lt!217612)) (_1!4511 lt!217578))))))

(declare-fun b!478084 () Bool)

(assert (=> b!478084 (= e!280979 (containsKey!352 (t!15222 lt!217612) (_1!4511 lt!217578)))))

(assert (= (and d!76495 (not res!285288)) b!478083))

(assert (= (and b!478083 res!285289) b!478084))

(declare-fun m!460443 () Bool)

(assert (=> b!478084 m!460443))

(assert (=> b!477854 d!76495))

(declare-fun d!76497 () Bool)

(declare-fun res!285290 () Bool)

(declare-fun e!280980 () Bool)

(assert (=> d!76497 (=> res!285290 e!280980)))

(assert (=> d!76497 (= res!285290 (and ((_ is Cons!9053) (toList!3972 lt!217611)) (= (_1!4511 (h!9909 (toList!3972 lt!217611))) (_1!4511 lt!217578))))))

(assert (=> d!76497 (= (containsKey!352 (toList!3972 lt!217611) (_1!4511 lt!217578)) e!280980)))

(declare-fun b!478085 () Bool)

(declare-fun e!280981 () Bool)

(assert (=> b!478085 (= e!280980 e!280981)))

(declare-fun res!285291 () Bool)

(assert (=> b!478085 (=> (not res!285291) (not e!280981))))

(assert (=> b!478085 (= res!285291 (and (or (not ((_ is Cons!9053) (toList!3972 lt!217611))) (bvsle (_1!4511 (h!9909 (toList!3972 lt!217611))) (_1!4511 lt!217578))) ((_ is Cons!9053) (toList!3972 lt!217611)) (bvslt (_1!4511 (h!9909 (toList!3972 lt!217611))) (_1!4511 lt!217578))))))

(declare-fun b!478086 () Bool)

(assert (=> b!478086 (= e!280981 (containsKey!352 (t!15222 (toList!3972 lt!217611)) (_1!4511 lt!217578)))))

(assert (= (and d!76497 (not res!285290)) b!478085))

(assert (= (and b!478085 res!285291) b!478086))

(declare-fun m!460445 () Bool)

(assert (=> b!478086 m!460445))

(assert (=> d!76407 d!76497))

(declare-fun d!76499 () Bool)

(declare-fun lt!217687 () Bool)

(assert (=> d!76499 (= lt!217687 (select (content!210 lt!217655) (tuple2!9001 (_1!4511 lt!217578) (_2!4511 lt!217578))))))

(declare-fun e!280982 () Bool)

(assert (=> d!76499 (= lt!217687 e!280982)))

(declare-fun res!285292 () Bool)

(assert (=> d!76499 (=> (not res!285292) (not e!280982))))

(assert (=> d!76499 (= res!285292 ((_ is Cons!9053) lt!217655))))

(assert (=> d!76499 (= (contains!2577 lt!217655 (tuple2!9001 (_1!4511 lt!217578) (_2!4511 lt!217578))) lt!217687)))

(declare-fun b!478087 () Bool)

(declare-fun e!280983 () Bool)

(assert (=> b!478087 (= e!280982 e!280983)))

(declare-fun res!285293 () Bool)

(assert (=> b!478087 (=> res!285293 e!280983)))

(assert (=> b!478087 (= res!285293 (= (h!9909 lt!217655) (tuple2!9001 (_1!4511 lt!217578) (_2!4511 lt!217578))))))

(declare-fun b!478088 () Bool)

(assert (=> b!478088 (= e!280983 (contains!2577 (t!15222 lt!217655) (tuple2!9001 (_1!4511 lt!217578) (_2!4511 lt!217578))))))

(assert (= (and d!76499 res!285292) b!478087))

(assert (= (and b!478087 (not res!285293)) b!478088))

(declare-fun m!460447 () Bool)

(assert (=> d!76499 m!460447))

(declare-fun m!460449 () Bool)

(assert (=> d!76499 m!460449))

(declare-fun m!460451 () Bool)

(assert (=> b!478088 m!460451))

(assert (=> b!477924 d!76499))

(assert (=> b!477821 d!76469))

(assert (=> b!477821 d!76453))

(declare-fun b!478089 () Bool)

(declare-fun e!280984 () Bool)

(declare-fun tp!42455 () Bool)

(assert (=> b!478089 (= e!280984 (and tp_is_empty!13533 tp!42455))))

(assert (=> b!477991 (= tp!42452 e!280984)))

(assert (= (and b!477991 ((_ is Cons!9053) (t!15222 (t!15222 (toList!3972 lm!215))))) b!478089))

(declare-fun b_lambda!10771 () Bool)

(assert (= b_lambda!10767 (or (and start!42998 b_free!12111) b_lambda!10771)))

(declare-fun b_lambda!10773 () Bool)

(assert (= b_lambda!10769 (or (and start!42998 b_free!12111) b_lambda!10773)))

(check-sat (not b!478062) b_and!20857 (not b_next!12111) (not d!76471) (not bm!30820) (not b_lambda!10753) (not b!478086) (not b!478069) (not d!76475) (not b!478065) (not b!478074) (not b!478088) (not b!478089) (not d!76467) (not b_lambda!10715) (not b!478052) (not d!76469) tp_is_empty!13533 (not b_lambda!10737) (not b_lambda!10751) (not b_lambda!10771) (not d!76493) (not b!478072) (not b!478060) (not b!478050) (not d!76483) (not b!478082) (not b!478047) (not b!478076) (not d!76499) (not b!478053) (not b_lambda!10773) (not b!478041) (not b!478084) (not b_lambda!10735) (not b!478078) (not b!478080))
(check-sat b_and!20857 (not b_next!12111))
