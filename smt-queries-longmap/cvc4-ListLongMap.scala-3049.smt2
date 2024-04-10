; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42868 () Bool)

(assert start!42868)

(declare-fun b_free!12107 () Bool)

(declare-fun b_next!12107 () Bool)

(assert (=> start!42868 (= b_free!12107 (not b_next!12107))))

(declare-fun tp!42409 () Bool)

(declare-fun b_and!20725 () Bool)

(assert (=> start!42868 (= tp!42409 b_and!20725)))

(declare-fun b!476909 () Bool)

(declare-fun res!284697 () Bool)

(declare-fun e!280176 () Bool)

(assert (=> b!476909 (=> (not res!284697) (not e!280176))))

(declare-datatypes ((B!1056 0))(
  ( (B!1057 (val!6812 Int)) )
))
(declare-datatypes ((tuple2!8996 0))(
  ( (tuple2!8997 (_1!4509 (_ BitVec 64)) (_2!4509 B!1056)) )
))
(declare-datatypes ((List!9055 0))(
  ( (Nil!9052) (Cons!9051 (h!9907 tuple2!8996) (t!15123 List!9055)) )
))
(declare-datatypes ((ListLongMap!7909 0))(
  ( (ListLongMap!7910 (toList!3970 List!9055)) )
))
(declare-fun lm!215 () ListLongMap!7909)

(declare-fun isEmpty!603 (ListLongMap!7909) Bool)

(assert (=> b!476909 (= res!284697 (not (isEmpty!603 lm!215)))))

(declare-fun p!166 () Int)

(declare-fun lt!217362 () tuple2!8996)

(declare-fun e!280175 () Bool)

(declare-fun b!476910 () Bool)

(declare-fun forall!199 (List!9055 Int) Bool)

(declare-fun +!1767 (ListLongMap!7909 tuple2!8996) ListLongMap!7909)

(assert (=> b!476910 (= e!280175 (not (forall!199 (toList!3970 (+!1767 lm!215 lt!217362)) p!166)))))

(declare-fun lt!217360 () ListLongMap!7909)

(assert (=> b!476910 (forall!199 (toList!3970 (+!1767 lt!217360 lt!217362)) p!166)))

(declare-fun b!85 () B!1056)

(declare-fun a!501 () (_ BitVec 64))

(declare-datatypes ((Unit!14038 0))(
  ( (Unit!14039) )
))
(declare-fun lt!217361 () Unit!14038)

(declare-fun addValidProp!22 (ListLongMap!7909 Int (_ BitVec 64) B!1056) Unit!14038)

(assert (=> b!476910 (= lt!217361 (addValidProp!22 lt!217360 p!166 a!501 b!85))))

(declare-fun b!476911 () Bool)

(declare-fun e!280177 () Bool)

(declare-fun tp!42408 () Bool)

(assert (=> b!476911 (= e!280177 tp!42408)))

(declare-fun b!476913 () Bool)

(declare-fun e!280174 () Bool)

(assert (=> b!476913 (= e!280174 e!280176)))

(declare-fun res!284696 () Bool)

(assert (=> b!476913 (=> (not res!284696) (not e!280176))))

(declare-fun dynLambda!946 (Int tuple2!8996) Bool)

(assert (=> b!476913 (= res!284696 (dynLambda!946 p!166 lt!217362))))

(assert (=> b!476913 (= lt!217362 (tuple2!8997 a!501 b!85))))

(declare-fun b!476912 () Bool)

(assert (=> b!476912 (= e!280176 e!280175)))

(declare-fun res!284695 () Bool)

(assert (=> b!476912 (=> (not res!284695) (not e!280175))))

(assert (=> b!476912 (= res!284695 (forall!199 (toList!3970 lt!217360) p!166))))

(declare-fun tail!127 (ListLongMap!7909) ListLongMap!7909)

(assert (=> b!476912 (= lt!217360 (tail!127 lm!215))))

(declare-fun res!284698 () Bool)

(assert (=> start!42868 (=> (not res!284698) (not e!280174))))

(assert (=> start!42868 (= res!284698 (forall!199 (toList!3970 lm!215) p!166))))

(assert (=> start!42868 e!280174))

(declare-fun inv!15497 (ListLongMap!7909) Bool)

(assert (=> start!42868 (and (inv!15497 lm!215) e!280177)))

(assert (=> start!42868 tp!42409))

(declare-fun tp_is_empty!13529 () Bool)

(assert (=> start!42868 tp_is_empty!13529))

(assert (=> start!42868 true))

(assert (= (and start!42868 res!284698) b!476913))

(assert (= (and b!476913 res!284696) b!476909))

(assert (= (and b!476909 res!284697) b!476912))

(assert (= (and b!476912 res!284695) b!476910))

(assert (= start!42868 b!476911))

(declare-fun b_lambda!10519 () Bool)

(assert (=> (not b_lambda!10519) (not b!476913)))

(declare-fun t!15122 () Bool)

(declare-fun tb!4025 () Bool)

(assert (=> (and start!42868 (= p!166 p!166) t!15122) tb!4025))

(declare-fun result!7587 () Bool)

(assert (=> tb!4025 (= result!7587 true)))

(assert (=> b!476913 t!15122))

(declare-fun b_and!20727 () Bool)

(assert (= b_and!20725 (and (=> t!15122 result!7587) b_and!20727)))

(declare-fun m!459183 () Bool)

(assert (=> b!476913 m!459183))

(declare-fun m!459185 () Bool)

(assert (=> b!476910 m!459185))

(declare-fun m!459187 () Bool)

(assert (=> b!476910 m!459187))

(declare-fun m!459189 () Bool)

(assert (=> b!476910 m!459189))

(declare-fun m!459191 () Bool)

(assert (=> b!476910 m!459191))

(declare-fun m!459193 () Bool)

(assert (=> b!476910 m!459193))

(declare-fun m!459195 () Bool)

(assert (=> start!42868 m!459195))

(declare-fun m!459197 () Bool)

(assert (=> start!42868 m!459197))

(declare-fun m!459199 () Bool)

(assert (=> b!476912 m!459199))

(declare-fun m!459201 () Bool)

(assert (=> b!476912 m!459201))

(declare-fun m!459203 () Bool)

(assert (=> b!476909 m!459203))

(push 1)

(assert (not b_next!12107))

(assert (not b!476910))

(assert (not start!42868))

(assert (not b!476909))

(assert tp_is_empty!13529)

(assert (not b_lambda!10519))

(assert (not b!476911))

(assert b_and!20727)

(assert (not b!476912))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20727)

(assert (not b_next!12107))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!10525 () Bool)

(assert (= b_lambda!10519 (or (and start!42868 b_free!12107) b_lambda!10525)))

(push 1)

(assert (not b_next!12107))

(assert (not b!476910))

(assert (not start!42868))

(assert (not b!476909))

(assert tp_is_empty!13529)

(assert (not b_lambda!10525))

(assert (not b!476911))

(assert b_and!20727)

(assert (not b!476912))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20727)

(assert (not b_next!12107))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75913 () Bool)

(declare-fun res!284715 () Bool)

(declare-fun e!280194 () Bool)

(assert (=> d!75913 (=> res!284715 e!280194)))

(assert (=> d!75913 (= res!284715 (is-Nil!9052 (toList!3970 lt!217360)))))

(assert (=> d!75913 (= (forall!199 (toList!3970 lt!217360) p!166) e!280194)))

(declare-fun b!476930 () Bool)

(declare-fun e!280195 () Bool)

(assert (=> b!476930 (= e!280194 e!280195)))

(declare-fun res!284716 () Bool)

(assert (=> b!476930 (=> (not res!284716) (not e!280195))))

(assert (=> b!476930 (= res!284716 (dynLambda!946 p!166 (h!9907 (toList!3970 lt!217360))))))

(declare-fun b!476931 () Bool)

(assert (=> b!476931 (= e!280195 (forall!199 (t!15123 (toList!3970 lt!217360)) p!166))))

(assert (= (and d!75913 (not res!284715)) b!476930))

(assert (= (and b!476930 res!284716) b!476931))

(declare-fun b_lambda!10531 () Bool)

(assert (=> (not b_lambda!10531) (not b!476930)))

(declare-fun t!15130 () Bool)

(declare-fun tb!4032 () Bool)

(assert (=> (and start!42868 (= p!166 p!166) t!15130) tb!4032))

(declare-fun result!7595 () Bool)

(assert (=> tb!4032 (= result!7595 true)))

(assert (=> b!476930 t!15130))

(declare-fun b_and!20735 () Bool)

(assert (= b_and!20727 (and (=> t!15130 result!7595) b_and!20735)))

(declare-fun m!459219 () Bool)

(assert (=> b!476930 m!459219))

(declare-fun m!459223 () Bool)

(assert (=> b!476931 m!459223))

(assert (=> b!476912 d!75913))

(declare-fun d!75925 () Bool)

(declare-fun tail!129 (List!9055) List!9055)

(assert (=> d!75925 (= (tail!127 lm!215) (ListLongMap!7910 (tail!129 (toList!3970 lm!215))))))

(declare-fun bs!15161 () Bool)

(assert (= bs!15161 d!75925))

(declare-fun m!459229 () Bool)

(assert (=> bs!15161 m!459229))

(assert (=> b!476912 d!75925))

(declare-fun d!75929 () Bool)

(assert (=> d!75929 (forall!199 (toList!3970 (+!1767 lt!217360 (tuple2!8997 a!501 b!85))) p!166)))

(declare-fun lt!217377 () Unit!14038)

(declare-fun choose!1362 (ListLongMap!7909 Int (_ BitVec 64) B!1056) Unit!14038)

(assert (=> d!75929 (= lt!217377 (choose!1362 lt!217360 p!166 a!501 b!85))))

(declare-fun e!280205 () Bool)

(assert (=> d!75929 e!280205))

(declare-fun res!284729 () Bool)

(assert (=> d!75929 (=> (not res!284729) (not e!280205))))

(assert (=> d!75929 (= res!284729 (forall!199 (toList!3970 lt!217360) p!166))))

(assert (=> d!75929 (= (addValidProp!22 lt!217360 p!166 a!501 b!85) lt!217377)))

(declare-fun b!476945 () Bool)

(assert (=> b!476945 (= e!280205 (dynLambda!946 p!166 (tuple2!8997 a!501 b!85)))))

(assert (= (and d!75929 res!284729) b!476945))

(declare-fun b_lambda!10537 () Bool)

(assert (=> (not b_lambda!10537) (not b!476945)))

(declare-fun t!15135 () Bool)

(declare-fun tb!4037 () Bool)

(assert (=> (and start!42868 (= p!166 p!166) t!15135) tb!4037))

(declare-fun result!7599 () Bool)

(assert (=> tb!4037 (= result!7599 true)))

(assert (=> b!476945 t!15135))

(declare-fun b_and!20739 () Bool)

(assert (= b_and!20735 (and (=> t!15135 result!7599) b_and!20739)))

(declare-fun m!459247 () Bool)

(assert (=> d!75929 m!459247))

(declare-fun m!459249 () Bool)

(assert (=> d!75929 m!459249))

(declare-fun m!459251 () Bool)

(assert (=> d!75929 m!459251))

(assert (=> d!75929 m!459199))

(declare-fun m!459253 () Bool)

(assert (=> b!476945 m!459253))

(assert (=> b!476910 d!75929))

(declare-fun d!75937 () Bool)

(declare-fun res!284730 () Bool)

(declare-fun e!280206 () Bool)

(assert (=> d!75937 (=> res!284730 e!280206)))

(assert (=> d!75937 (= res!284730 (is-Nil!9052 (toList!3970 (+!1767 lt!217360 lt!217362))))))

(assert (=> d!75937 (= (forall!199 (toList!3970 (+!1767 lt!217360 lt!217362)) p!166) e!280206)))

(declare-fun b!476946 () Bool)

(declare-fun e!280207 () Bool)

(assert (=> b!476946 (= e!280206 e!280207)))

(declare-fun res!284731 () Bool)

(assert (=> b!476946 (=> (not res!284731) (not e!280207))))

(assert (=> b!476946 (= res!284731 (dynLambda!946 p!166 (h!9907 (toList!3970 (+!1767 lt!217360 lt!217362)))))))

(declare-fun b!476947 () Bool)

(assert (=> b!476947 (= e!280207 (forall!199 (t!15123 (toList!3970 (+!1767 lt!217360 lt!217362))) p!166))))

(assert (= (and d!75937 (not res!284730)) b!476946))

(assert (= (and b!476946 res!284731) b!476947))

(declare-fun b_lambda!10539 () Bool)

(assert (=> (not b_lambda!10539) (not b!476946)))

(declare-fun t!15137 () Bool)

(declare-fun tb!4039 () Bool)

(assert (=> (and start!42868 (= p!166 p!166) t!15137) tb!4039))

(declare-fun result!7601 () Bool)

(assert (=> tb!4039 (= result!7601 true)))

(assert (=> b!476946 t!15137))

(declare-fun b_and!20741 () Bool)

(assert (= b_and!20739 (and (=> t!15137 result!7601) b_and!20741)))

(declare-fun m!459255 () Bool)

(assert (=> b!476946 m!459255))

(declare-fun m!459257 () Bool)

(assert (=> b!476947 m!459257))

(assert (=> b!476910 d!75937))

(declare-fun d!75939 () Bool)

(declare-fun e!280225 () Bool)

(assert (=> d!75939 e!280225))

(declare-fun res!284754 () Bool)

(assert (=> d!75939 (=> (not res!284754) (not e!280225))))

(declare-fun lt!217411 () ListLongMap!7909)

(declare-fun contains!2572 (ListLongMap!7909 (_ BitVec 64)) Bool)

(assert (=> d!75939 (= res!284754 (contains!2572 lt!217411 (_1!4509 lt!217362)))))

(declare-fun lt!217410 () List!9055)

(assert (=> d!75939 (= lt!217411 (ListLongMap!7910 lt!217410))))

(declare-fun lt!217409 () Unit!14038)

(declare-fun lt!217412 () Unit!14038)

(assert (=> d!75939 (= lt!217409 lt!217412)))

(declare-datatypes ((Option!394 0))(
  ( (Some!393 (v!9094 B!1056)) (None!392) )
))
(declare-fun getValueByKey!388 (List!9055 (_ BitVec 64)) Option!394)

(assert (=> d!75939 (= (getValueByKey!388 lt!217410 (_1!4509 lt!217362)) (Some!393 (_2!4509 lt!217362)))))

(declare-fun lemmaContainsTupThenGetReturnValue!210 (List!9055 (_ BitVec 64) B!1056) Unit!14038)

(assert (=> d!75939 (= lt!217412 (lemmaContainsTupThenGetReturnValue!210 lt!217410 (_1!4509 lt!217362) (_2!4509 lt!217362)))))

(declare-fun insertStrictlySorted!213 (List!9055 (_ BitVec 64) B!1056) List!9055)

(assert (=> d!75939 (= lt!217410 (insertStrictlySorted!213 (toList!3970 lt!217360) (_1!4509 lt!217362) (_2!4509 lt!217362)))))

(assert (=> d!75939 (= (+!1767 lt!217360 lt!217362) lt!217411)))

(declare-fun b!476976 () Bool)

(declare-fun res!284753 () Bool)

(assert (=> b!476976 (=> (not res!284753) (not e!280225))))

(assert (=> b!476976 (= res!284753 (= (getValueByKey!388 (toList!3970 lt!217411) (_1!4509 lt!217362)) (Some!393 (_2!4509 lt!217362))))))

(declare-fun b!476977 () Bool)

(declare-fun contains!2573 (List!9055 tuple2!8996) Bool)

(assert (=> b!476977 (= e!280225 (contains!2573 (toList!3970 lt!217411) lt!217362))))

(assert (= (and d!75939 res!284754) b!476976))

(assert (= (and b!476976 res!284753) b!476977))

(declare-fun m!459315 () Bool)

(assert (=> d!75939 m!459315))

(declare-fun m!459317 () Bool)

(assert (=> d!75939 m!459317))

(declare-fun m!459319 () Bool)

(assert (=> d!75939 m!459319))

(declare-fun m!459321 () Bool)

(assert (=> d!75939 m!459321))

(declare-fun m!459323 () Bool)

(assert (=> b!476976 m!459323))

(declare-fun m!459325 () Bool)

(assert (=> b!476977 m!459325))

(assert (=> b!476910 d!75939))

(declare-fun d!75955 () Bool)

(declare-fun e!280228 () Bool)

(assert (=> d!75955 e!280228))

(declare-fun res!284758 () Bool)

(assert (=> d!75955 (=> (not res!284758) (not e!280228))))

(declare-fun lt!217417 () ListLongMap!7909)

(assert (=> d!75955 (= res!284758 (contains!2572 lt!217417 (_1!4509 lt!217362)))))

(declare-fun lt!217416 () List!9055)

(assert (=> d!75955 (= lt!217417 (ListLongMap!7910 lt!217416))))

(declare-fun lt!217415 () Unit!14038)

(declare-fun lt!217418 () Unit!14038)

(assert (=> d!75955 (= lt!217415 lt!217418)))

(assert (=> d!75955 (= (getValueByKey!388 lt!217416 (_1!4509 lt!217362)) (Some!393 (_2!4509 lt!217362)))))

(assert (=> d!75955 (= lt!217418 (lemmaContainsTupThenGetReturnValue!210 lt!217416 (_1!4509 lt!217362) (_2!4509 lt!217362)))))

(assert (=> d!75955 (= lt!217416 (insertStrictlySorted!213 (toList!3970 lm!215) (_1!4509 lt!217362) (_2!4509 lt!217362)))))

(assert (=> d!75955 (= (+!1767 lm!215 lt!217362) lt!217417)))

(declare-fun b!476980 () Bool)

(declare-fun res!284757 () Bool)

(assert (=> b!476980 (=> (not res!284757) (not e!280228))))

(assert (=> b!476980 (= res!284757 (= (getValueByKey!388 (toList!3970 lt!217417) (_1!4509 lt!217362)) (Some!393 (_2!4509 lt!217362))))))

(declare-fun b!476981 () Bool)

(assert (=> b!476981 (= e!280228 (contains!2573 (toList!3970 lt!217417) lt!217362))))

(assert (= (and d!75955 res!284758) b!476980))

(assert (= (and b!476980 res!284757) b!476981))

(declare-fun m!459327 () Bool)

(assert (=> d!75955 m!459327))

(declare-fun m!459329 () Bool)

(assert (=> d!75955 m!459329))

(declare-fun m!459331 () Bool)

(assert (=> d!75955 m!459331))

(declare-fun m!459333 () Bool)

(assert (=> d!75955 m!459333))

(declare-fun m!459335 () Bool)

(assert (=> b!476980 m!459335))

(declare-fun m!459337 () Bool)

(assert (=> b!476981 m!459337))

(assert (=> b!476910 d!75955))

(declare-fun d!75957 () Bool)

(declare-fun res!284759 () Bool)

(declare-fun e!280229 () Bool)

(assert (=> d!75957 (=> res!284759 e!280229)))

(assert (=> d!75957 (= res!284759 (is-Nil!9052 (toList!3970 (+!1767 lm!215 lt!217362))))))

(assert (=> d!75957 (= (forall!199 (toList!3970 (+!1767 lm!215 lt!217362)) p!166) e!280229)))

(declare-fun b!476982 () Bool)

(declare-fun e!280230 () Bool)

(assert (=> b!476982 (= e!280229 e!280230)))

(declare-fun res!284760 () Bool)

(assert (=> b!476982 (=> (not res!284760) (not e!280230))))

(assert (=> b!476982 (= res!284760 (dynLambda!946 p!166 (h!9907 (toList!3970 (+!1767 lm!215 lt!217362)))))))

(declare-fun b!476983 () Bool)

(assert (=> b!476983 (= e!280230 (forall!199 (t!15123 (toList!3970 (+!1767 lm!215 lt!217362))) p!166))))

(assert (= (and d!75957 (not res!284759)) b!476982))

(assert (= (and b!476982 res!284760) b!476983))

(declare-fun b_lambda!10557 () Bool)

(assert (=> (not b_lambda!10557) (not b!476982)))

(declare-fun t!15145 () Bool)

(declare-fun tb!4047 () Bool)

(assert (=> (and start!42868 (= p!166 p!166) t!15145) tb!4047))

(declare-fun result!7611 () Bool)

(assert (=> tb!4047 (= result!7611 true)))

(assert (=> b!476982 t!15145))

(declare-fun b_and!20749 () Bool)

(assert (= b_and!20741 (and (=> t!15145 result!7611) b_and!20749)))

(declare-fun m!459339 () Bool)

(assert (=> b!476982 m!459339))

(declare-fun m!459341 () Bool)

(assert (=> b!476983 m!459341))

(assert (=> b!476910 d!75957))

(declare-fun d!75959 () Bool)

(declare-fun res!284762 () Bool)

(declare-fun e!280232 () Bool)

(assert (=> d!75959 (=> res!284762 e!280232)))

(assert (=> d!75959 (= res!284762 (is-Nil!9052 (toList!3970 lm!215)))))

(assert (=> d!75959 (= (forall!199 (toList!3970 lm!215) p!166) e!280232)))

(declare-fun b!476985 () Bool)

(declare-fun e!280233 () Bool)

(assert (=> b!476985 (= e!280232 e!280233)))

(declare-fun res!284763 () Bool)

(assert (=> b!476985 (=> (not res!284763) (not e!280233))))

(assert (=> b!476985 (= res!284763 (dynLambda!946 p!166 (h!9907 (toList!3970 lm!215))))))

(declare-fun b!476986 () Bool)

(assert (=> b!476986 (= e!280233 (forall!199 (t!15123 (toList!3970 lm!215)) p!166))))

(assert (= (and d!75959 (not res!284762)) b!476985))

(assert (= (and b!476985 res!284763) b!476986))

(declare-fun b_lambda!10561 () Bool)

(assert (=> (not b_lambda!10561) (not b!476985)))

(declare-fun t!15149 () Bool)

(declare-fun tb!4051 () Bool)

(assert (=> (and start!42868 (= p!166 p!166) t!15149) tb!4051))

(declare-fun result!7615 () Bool)

(assert (=> tb!4051 (= result!7615 true)))

(assert (=> b!476985 t!15149))

(declare-fun b_and!20753 () Bool)

(assert (= b_and!20749 (and (=> t!15149 result!7615) b_and!20753)))

(declare-fun m!459351 () Bool)

(assert (=> b!476985 m!459351))

(declare-fun m!459353 () Bool)

(assert (=> b!476986 m!459353))

(assert (=> start!42868 d!75959))

(declare-fun d!75963 () Bool)

(declare-fun isStrictlySorted!389 (List!9055) Bool)

(assert (=> d!75963 (= (inv!15497 lm!215) (isStrictlySorted!389 (toList!3970 lm!215)))))

(declare-fun bs!15166 () Bool)

(assert (= bs!15166 d!75963))

(declare-fun m!459363 () Bool)

(assert (=> bs!15166 m!459363))

(assert (=> start!42868 d!75963))

(declare-fun d!75967 () Bool)

(declare-fun isEmpty!606 (List!9055) Bool)

(assert (=> d!75967 (= (isEmpty!603 lm!215) (isEmpty!606 (toList!3970 lm!215)))))

(declare-fun bs!15167 () Bool)

(assert (= bs!15167 d!75967))

(declare-fun m!459365 () Bool)

(assert (=> bs!15167 m!459365))

(assert (=> b!476909 d!75967))

(declare-fun b!477000 () Bool)

(declare-fun e!280243 () Bool)

(declare-fun tp!42418 () Bool)

(assert (=> b!477000 (= e!280243 (and tp_is_empty!13529 tp!42418))))

(assert (=> b!476911 (= tp!42408 e!280243)))

(assert (= (and b!476911 (is-Cons!9051 (toList!3970 lm!215))) b!477000))

(declare-fun b_lambda!10577 () Bool)

(assert (= b_lambda!10531 (or (and start!42868 b_free!12107) b_lambda!10577)))

(declare-fun b_lambda!10579 () Bool)

(assert (= b_lambda!10557 (or (and start!42868 b_free!12107) b_lambda!10579)))

(declare-fun b_lambda!10581 () Bool)

(assert (= b_lambda!10537 (or (and start!42868 b_free!12107) b_lambda!10581)))

(declare-fun b_lambda!10583 () Bool)

(assert (= b_lambda!10561 (or (and start!42868 b_free!12107) b_lambda!10583)))

(declare-fun b_lambda!10585 () Bool)

(assert (= b_lambda!10539 (or (and start!42868 b_free!12107) b_lambda!10585)))

(push 1)

(assert (not b_lambda!10577))

(assert (not b!476931))

(assert (not d!75925))

(assert (not b!476983))

(assert (not d!75967))

(assert (not d!75939))

(assert (not b!476947))

(assert (not d!75929))

(assert (not b!477000))

(assert (not b_lambda!10581))

(assert tp_is_empty!13529)

(assert (not b!476976))

(assert (not d!75955))

(assert (not b_next!12107))

(assert (not b!476986))

(assert (not b_lambda!10579))

(assert (not b!476981))

(assert (not d!75963))

(assert b_and!20753)

(assert (not b!476977))

(assert (not b_lambda!10585))

(assert (not b_lambda!10525))

(assert (not b!476980))

(assert (not b_lambda!10583))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20753)

(assert (not b_next!12107))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76041 () Bool)

(assert (=> d!76041 (= (tail!129 (toList!3970 lm!215)) (t!15123 (toList!3970 lm!215)))))

(assert (=> d!75925 d!76041))

(declare-fun b!477181 () Bool)

(declare-fun e!280359 () Option!394)

(assert (=> b!477181 (= e!280359 (getValueByKey!388 (t!15123 (toList!3970 lt!217411)) (_1!4509 lt!217362)))))

(declare-fun b!477180 () Bool)

(declare-fun e!280358 () Option!394)

(assert (=> b!477180 (= e!280358 e!280359)))

(declare-fun c!57424 () Bool)

(assert (=> b!477180 (= c!57424 (and (is-Cons!9051 (toList!3970 lt!217411)) (not (= (_1!4509 (h!9907 (toList!3970 lt!217411))) (_1!4509 lt!217362)))))))

(declare-fun b!477182 () Bool)

(assert (=> b!477182 (= e!280359 None!392)))

(declare-fun b!477179 () Bool)

(assert (=> b!477179 (= e!280358 (Some!393 (_2!4509 (h!9907 (toList!3970 lt!217411)))))))

(declare-fun d!76045 () Bool)

(declare-fun c!57423 () Bool)

(assert (=> d!76045 (= c!57423 (and (is-Cons!9051 (toList!3970 lt!217411)) (= (_1!4509 (h!9907 (toList!3970 lt!217411))) (_1!4509 lt!217362))))))

(assert (=> d!76045 (= (getValueByKey!388 (toList!3970 lt!217411) (_1!4509 lt!217362)) e!280358)))

(assert (= (and d!76045 c!57423) b!477179))

(assert (= (and d!76045 (not c!57423)) b!477180))

(assert (= (and b!477180 c!57424) b!477181))

(assert (= (and b!477180 (not c!57424)) b!477182))

(declare-fun m!459527 () Bool)

(assert (=> b!477181 m!459527))

(assert (=> b!476976 d!76045))

(declare-fun d!76049 () Bool)

(declare-fun lt!217476 () Bool)

(declare-fun content!208 (List!9055) (Set tuple2!8996))

(assert (=> d!76049 (= lt!217476 (member lt!217362 (content!208 (toList!3970 lt!217417))))))

(declare-fun e!280365 () Bool)

(assert (=> d!76049 (= lt!217476 e!280365)))

(declare-fun res!284850 () Bool)

(assert (=> d!76049 (=> (not res!284850) (not e!280365))))

(assert (=> d!76049 (= res!284850 (is-Cons!9051 (toList!3970 lt!217417)))))

(assert (=> d!76049 (= (contains!2573 (toList!3970 lt!217417) lt!217362) lt!217476)))

(declare-fun b!477187 () Bool)

(declare-fun e!280364 () Bool)

(assert (=> b!477187 (= e!280365 e!280364)))

(declare-fun res!284849 () Bool)

(assert (=> b!477187 (=> res!284849 e!280364)))

(assert (=> b!477187 (= res!284849 (= (h!9907 (toList!3970 lt!217417)) lt!217362))))

(declare-fun b!477188 () Bool)

(assert (=> b!477188 (= e!280364 (contains!2573 (t!15123 (toList!3970 lt!217417)) lt!217362))))

(assert (= (and d!76049 res!284850) b!477187))

(assert (= (and b!477187 (not res!284849)) b!477188))

(declare-fun m!459529 () Bool)

(assert (=> d!76049 m!459529))

(declare-fun m!459531 () Bool)

(assert (=> d!76049 m!459531))

(declare-fun m!459533 () Bool)

(assert (=> b!477188 m!459533))

(assert (=> b!476981 d!76049))

(declare-fun d!76051 () Bool)

(declare-fun e!280386 () Bool)

(assert (=> d!76051 e!280386))

(declare-fun res!284858 () Bool)

(assert (=> d!76051 (=> res!284858 e!280386)))

(declare-fun lt!217491 () Bool)

(assert (=> d!76051 (= res!284858 (not lt!217491))))

(declare-fun lt!217490 () Bool)

(assert (=> d!76051 (= lt!217491 lt!217490)))

(declare-fun lt!217487 () Unit!14038)

(declare-fun e!280385 () Unit!14038)

(assert (=> d!76051 (= lt!217487 e!280385)))

(declare-fun c!57436 () Bool)

(assert (=> d!76051 (= c!57436 lt!217490)))

(declare-fun containsKey!350 (List!9055 (_ BitVec 64)) Bool)

(assert (=> d!76051 (= lt!217490 (containsKey!350 (toList!3970 lt!217417) (_1!4509 lt!217362)))))

(assert (=> d!76051 (= (contains!2572 lt!217417 (_1!4509 lt!217362)) lt!217491)))

(declare-fun b!477217 () Bool)

(declare-fun lt!217488 () Unit!14038)

(assert (=> b!477217 (= e!280385 lt!217488)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!298 (List!9055 (_ BitVec 64)) Unit!14038)

(assert (=> b!477217 (= lt!217488 (lemmaContainsKeyImpliesGetValueByKeyDefined!298 (toList!3970 lt!217417) (_1!4509 lt!217362)))))

(declare-fun isDefined!299 (Option!394) Bool)

(assert (=> b!477217 (isDefined!299 (getValueByKey!388 (toList!3970 lt!217417) (_1!4509 lt!217362)))))

(declare-fun b!477219 () Bool)

(declare-fun Unit!14043 () Unit!14038)

(assert (=> b!477219 (= e!280385 Unit!14043)))

(declare-fun b!477220 () Bool)

(assert (=> b!477220 (= e!280386 (isDefined!299 (getValueByKey!388 (toList!3970 lt!217417) (_1!4509 lt!217362))))))

(assert (= (and d!76051 c!57436) b!477217))

(assert (= (and d!76051 (not c!57436)) b!477219))

(assert (= (and d!76051 (not res!284858)) b!477220))

(declare-fun m!459535 () Bool)

(assert (=> d!76051 m!459535))

(declare-fun m!459537 () Bool)

(assert (=> b!477217 m!459537))

(assert (=> b!477217 m!459335))

(assert (=> b!477217 m!459335))

(declare-fun m!459539 () Bool)

(assert (=> b!477217 m!459539))

(assert (=> b!477220 m!459335))

(assert (=> b!477220 m!459335))

(assert (=> b!477220 m!459539))

(assert (=> d!75955 d!76051))

(declare-fun b!477230 () Bool)

(declare-fun e!280388 () Option!394)

(assert (=> b!477230 (= e!280388 (getValueByKey!388 (t!15123 lt!217416) (_1!4509 lt!217362)))))

(declare-fun b!477229 () Bool)

(declare-fun e!280387 () Option!394)

(assert (=> b!477229 (= e!280387 e!280388)))

(declare-fun c!57441 () Bool)

(assert (=> b!477229 (= c!57441 (and (is-Cons!9051 lt!217416) (not (= (_1!4509 (h!9907 lt!217416)) (_1!4509 lt!217362)))))))

(declare-fun b!477231 () Bool)

(assert (=> b!477231 (= e!280388 None!392)))

(declare-fun b!477228 () Bool)

(assert (=> b!477228 (= e!280387 (Some!393 (_2!4509 (h!9907 lt!217416))))))

(declare-fun d!76053 () Bool)

(declare-fun c!57440 () Bool)

(assert (=> d!76053 (= c!57440 (and (is-Cons!9051 lt!217416) (= (_1!4509 (h!9907 lt!217416)) (_1!4509 lt!217362))))))

(assert (=> d!76053 (= (getValueByKey!388 lt!217416 (_1!4509 lt!217362)) e!280387)))

(assert (= (and d!76053 c!57440) b!477228))

(assert (= (and d!76053 (not c!57440)) b!477229))

(assert (= (and b!477229 c!57441) b!477230))

(assert (= (and b!477229 (not c!57441)) b!477231))

(declare-fun m!459547 () Bool)

(assert (=> b!477230 m!459547))

(assert (=> d!75955 d!76053))

(declare-fun d!76055 () Bool)

(assert (=> d!76055 (= (getValueByKey!388 lt!217416 (_1!4509 lt!217362)) (Some!393 (_2!4509 lt!217362)))))

(declare-fun lt!217501 () Unit!14038)

(declare-fun choose!1366 (List!9055 (_ BitVec 64) B!1056) Unit!14038)

(assert (=> d!76055 (= lt!217501 (choose!1366 lt!217416 (_1!4509 lt!217362) (_2!4509 lt!217362)))))

(declare-fun e!280405 () Bool)

(assert (=> d!76055 e!280405))

(declare-fun res!284873 () Bool)

(assert (=> d!76055 (=> (not res!284873) (not e!280405))))

(assert (=> d!76055 (= res!284873 (isStrictlySorted!389 lt!217416))))

(assert (=> d!76055 (= (lemmaContainsTupThenGetReturnValue!210 lt!217416 (_1!4509 lt!217362) (_2!4509 lt!217362)) lt!217501)))

(declare-fun b!477259 () Bool)

(declare-fun res!284874 () Bool)

(assert (=> b!477259 (=> (not res!284874) (not e!280405))))

(assert (=> b!477259 (= res!284874 (containsKey!350 lt!217416 (_1!4509 lt!217362)))))

(declare-fun b!477260 () Bool)

(assert (=> b!477260 (= e!280405 (contains!2573 lt!217416 (tuple2!8997 (_1!4509 lt!217362) (_2!4509 lt!217362))))))

(assert (= (and d!76055 res!284873) b!477259))

(assert (= (and b!477259 res!284874) b!477260))

(assert (=> d!76055 m!459329))

(declare-fun m!459591 () Bool)

(assert (=> d!76055 m!459591))

(declare-fun m!459593 () Bool)

(assert (=> d!76055 m!459593))

(declare-fun m!459595 () Bool)

(assert (=> b!477259 m!459595))

(declare-fun m!459597 () Bool)

(assert (=> b!477260 m!459597))

(assert (=> d!75955 d!76055))

(declare-fun b!477282 () Bool)

(declare-fun c!57458 () Bool)

(assert (=> b!477282 (= c!57458 (and (is-Cons!9051 (toList!3970 lm!215)) (bvsgt (_1!4509 (h!9907 (toList!3970 lm!215))) (_1!4509 lt!217362))))))

(declare-fun e!280420 () List!9055)

(declare-fun e!280418 () List!9055)

(assert (=> b!477282 (= e!280420 e!280418)))

(declare-fun b!477283 () Bool)

(declare-fun res!284879 () Bool)

(declare-fun e!280417 () Bool)

(assert (=> b!477283 (=> (not res!284879) (not e!280417))))

(declare-fun lt!217504 () List!9055)

(assert (=> b!477283 (= res!284879 (containsKey!350 lt!217504 (_1!4509 lt!217362)))))

(declare-fun b!477284 () Bool)

(declare-fun e!280421 () List!9055)

(assert (=> b!477284 (= e!280421 e!280420)))

(declare-fun c!57457 () Bool)

(assert (=> b!477284 (= c!57457 (and (is-Cons!9051 (toList!3970 lm!215)) (= (_1!4509 (h!9907 (toList!3970 lm!215))) (_1!4509 lt!217362))))))

(declare-fun bm!30758 () Bool)

(declare-fun call!30761 () List!9055)

(declare-fun call!30763 () List!9055)

(assert (=> bm!30758 (= call!30761 call!30763)))

(declare-fun b!477285 () Bool)

(assert (=> b!477285 (= e!280418 call!30761)))

(declare-fun b!477286 () Bool)

(declare-fun e!280419 () List!9055)

(assert (=> b!477286 (= e!280419 (insertStrictlySorted!213 (t!15123 (toList!3970 lm!215)) (_1!4509 lt!217362) (_2!4509 lt!217362)))))

(declare-fun b!477287 () Bool)

(assert (=> b!477287 (= e!280418 call!30761)))

(declare-fun b!477288 () Bool)

(assert (=> b!477288 (= e!280419 (ite c!57457 (t!15123 (toList!3970 lm!215)) (ite c!57458 (Cons!9051 (h!9907 (toList!3970 lm!215)) (t!15123 (toList!3970 lm!215))) Nil!9052)))))

(declare-fun b!477289 () Bool)

(assert (=> b!477289 (= e!280417 (contains!2573 lt!217504 (tuple2!8997 (_1!4509 lt!217362) (_2!4509 lt!217362))))))

(declare-fun d!76069 () Bool)

(assert (=> d!76069 e!280417))

(declare-fun res!284880 () Bool)

(assert (=> d!76069 (=> (not res!284880) (not e!280417))))

(assert (=> d!76069 (= res!284880 (isStrictlySorted!389 lt!217504))))

(assert (=> d!76069 (= lt!217504 e!280421)))

(declare-fun c!57460 () Bool)

(assert (=> d!76069 (= c!57460 (and (is-Cons!9051 (toList!3970 lm!215)) (bvslt (_1!4509 (h!9907 (toList!3970 lm!215))) (_1!4509 lt!217362))))))

(assert (=> d!76069 (isStrictlySorted!389 (toList!3970 lm!215))))

(assert (=> d!76069 (= (insertStrictlySorted!213 (toList!3970 lm!215) (_1!4509 lt!217362) (_2!4509 lt!217362)) lt!217504)))

(declare-fun bm!30759 () Bool)

(declare-fun call!30762 () List!9055)

(declare-fun $colon$colon!112 (List!9055 tuple2!8996) List!9055)

(assert (=> bm!30759 (= call!30762 ($colon$colon!112 e!280419 (ite c!57460 (h!9907 (toList!3970 lm!215)) (tuple2!8997 (_1!4509 lt!217362) (_2!4509 lt!217362)))))))

(declare-fun c!57459 () Bool)

(assert (=> bm!30759 (= c!57459 c!57460)))

(declare-fun b!477290 () Bool)

(assert (=> b!477290 (= e!280421 call!30762)))

(declare-fun b!477291 () Bool)

(assert (=> b!477291 (= e!280420 call!30763)))

(declare-fun bm!30760 () Bool)

(assert (=> bm!30760 (= call!30763 call!30762)))

(assert (= (and d!76069 c!57460) b!477290))

(assert (= (and d!76069 (not c!57460)) b!477284))

(assert (= (and b!477284 c!57457) b!477291))

(assert (= (and b!477284 (not c!57457)) b!477282))

(assert (= (and b!477282 c!57458) b!477287))

(assert (= (and b!477282 (not c!57458)) b!477285))

(assert (= (or b!477287 b!477285) bm!30758))

(assert (= (or b!477291 bm!30758) bm!30760))

(assert (= (or b!477290 bm!30760) bm!30759))

(assert (= (and bm!30759 c!57459) b!477286))

(assert (= (and bm!30759 (not c!57459)) b!477288))

(assert (= (and d!76069 res!284880) b!477283))

(assert (= (and b!477283 res!284879) b!477289))

(declare-fun m!459599 () Bool)

(assert (=> d!76069 m!459599))

(assert (=> d!76069 m!459363))

(declare-fun m!459601 () Bool)

(assert (=> b!477283 m!459601))

(declare-fun m!459603 () Bool)

(assert (=> bm!30759 m!459603))

(declare-fun m!459605 () Bool)

(assert (=> b!477286 m!459605))

(declare-fun m!459607 () Bool)

(assert (=> b!477289 m!459607))

(assert (=> d!75955 d!76069))

(declare-fun d!76071 () Bool)

(declare-fun res!284881 () Bool)

(declare-fun e!280422 () Bool)

(assert (=> d!76071 (=> res!284881 e!280422)))

(assert (=> d!76071 (= res!284881 (is-Nil!9052 (t!15123 (toList!3970 (+!1767 lt!217360 lt!217362)))))))

(assert (=> d!76071 (= (forall!199 (t!15123 (toList!3970 (+!1767 lt!217360 lt!217362))) p!166) e!280422)))

(declare-fun b!477292 () Bool)

(declare-fun e!280423 () Bool)

(assert (=> b!477292 (= e!280422 e!280423)))

(declare-fun res!284882 () Bool)

(assert (=> b!477292 (=> (not res!284882) (not e!280423))))

(assert (=> b!477292 (= res!284882 (dynLambda!946 p!166 (h!9907 (t!15123 (toList!3970 (+!1767 lt!217360 lt!217362))))))))

(declare-fun b!477293 () Bool)

(assert (=> b!477293 (= e!280423 (forall!199 (t!15123 (t!15123 (toList!3970 (+!1767 lt!217360 lt!217362)))) p!166))))

(assert (= (and d!76071 (not res!284881)) b!477292))

(assert (= (and b!477292 res!284882) b!477293))

(declare-fun b_lambda!10627 () Bool)

(assert (=> (not b_lambda!10627) (not b!477292)))

(declare-fun t!15175 () Bool)

(declare-fun tb!4077 () Bool)

(assert (=> (and start!42868 (= p!166 p!166) t!15175) tb!4077))

(declare-fun result!7645 () Bool)

(assert (=> tb!4077 (= result!7645 true)))

(assert (=> b!477292 t!15175))

(declare-fun b_and!20779 () Bool)

(assert (= b_and!20753 (and (=> t!15175 result!7645) b_and!20779)))

(declare-fun m!459609 () Bool)

(assert (=> b!477292 m!459609))

(declare-fun m!459611 () Bool)

(assert (=> b!477293 m!459611))

(assert (=> b!476947 d!76071))

(declare-fun d!76073 () Bool)

(declare-fun lt!217505 () Bool)

(assert (=> d!76073 (= lt!217505 (member lt!217362 (content!208 (toList!3970 lt!217411))))))

(declare-fun e!280425 () Bool)

(assert (=> d!76073 (= lt!217505 e!280425)))

(declare-fun res!284884 () Bool)

(assert (=> d!76073 (=> (not res!284884) (not e!280425))))

(assert (=> d!76073 (= res!284884 (is-Cons!9051 (toList!3970 lt!217411)))))

(assert (=> d!76073 (= (contains!2573 (toList!3970 lt!217411) lt!217362) lt!217505)))

(declare-fun b!477294 () Bool)

(declare-fun e!280424 () Bool)

(assert (=> b!477294 (= e!280425 e!280424)))

(declare-fun res!284883 () Bool)

(assert (=> b!477294 (=> res!284883 e!280424)))

(assert (=> b!477294 (= res!284883 (= (h!9907 (toList!3970 lt!217411)) lt!217362))))

(declare-fun b!477295 () Bool)

(assert (=> b!477295 (= e!280424 (contains!2573 (t!15123 (toList!3970 lt!217411)) lt!217362))))

(assert (= (and d!76073 res!284884) b!477294))

(assert (= (and b!477294 (not res!284883)) b!477295))

(declare-fun m!459613 () Bool)

(assert (=> d!76073 m!459613))

(declare-fun m!459615 () Bool)

(assert (=> d!76073 m!459615))

(declare-fun m!459617 () Bool)

(assert (=> b!477295 m!459617))

(assert (=> b!476977 d!76073))

(declare-fun d!76075 () Bool)

(declare-fun res!284885 () Bool)

(declare-fun e!280426 () Bool)

(assert (=> d!76075 (=> res!284885 e!280426)))

(assert (=> d!76075 (= res!284885 (is-Nil!9052 (t!15123 (toList!3970 lt!217360))))))

(assert (=> d!76075 (= (forall!199 (t!15123 (toList!3970 lt!217360)) p!166) e!280426)))

(declare-fun b!477296 () Bool)

(declare-fun e!280427 () Bool)

(assert (=> b!477296 (= e!280426 e!280427)))

(declare-fun res!284886 () Bool)

(assert (=> b!477296 (=> (not res!284886) (not e!280427))))

(assert (=> b!477296 (= res!284886 (dynLambda!946 p!166 (h!9907 (t!15123 (toList!3970 lt!217360)))))))

(declare-fun b!477297 () Bool)

(assert (=> b!477297 (= e!280427 (forall!199 (t!15123 (t!15123 (toList!3970 lt!217360))) p!166))))

(assert (= (and d!76075 (not res!284885)) b!477296))

(assert (= (and b!477296 res!284886) b!477297))

(declare-fun b_lambda!10629 () Bool)

(assert (=> (not b_lambda!10629) (not b!477296)))

(declare-fun t!15177 () Bool)

(declare-fun tb!4079 () Bool)

(assert (=> (and start!42868 (= p!166 p!166) t!15177) tb!4079))

(declare-fun result!7647 () Bool)

(assert (=> tb!4079 (= result!7647 true)))

(assert (=> b!477296 t!15177))

(declare-fun b_and!20781 () Bool)

(assert (= b_and!20779 (and (=> t!15177 result!7647) b_and!20781)))

(declare-fun m!459619 () Bool)

(assert (=> b!477296 m!459619))

(declare-fun m!459621 () Bool)

(assert (=> b!477297 m!459621))

(assert (=> b!476931 d!76075))

(declare-fun d!76077 () Bool)

(declare-fun res!284887 () Bool)

(declare-fun e!280428 () Bool)

(assert (=> d!76077 (=> res!284887 e!280428)))

(assert (=> d!76077 (= res!284887 (is-Nil!9052 (toList!3970 (+!1767 lt!217360 (tuple2!8997 a!501 b!85)))))))

(assert (=> d!76077 (= (forall!199 (toList!3970 (+!1767 lt!217360 (tuple2!8997 a!501 b!85))) p!166) e!280428)))

(declare-fun b!477298 () Bool)

(declare-fun e!280429 () Bool)

(assert (=> b!477298 (= e!280428 e!280429)))

(declare-fun res!284888 () Bool)

(assert (=> b!477298 (=> (not res!284888) (not e!280429))))

(assert (=> b!477298 (= res!284888 (dynLambda!946 p!166 (h!9907 (toList!3970 (+!1767 lt!217360 (tuple2!8997 a!501 b!85))))))))

(declare-fun b!477299 () Bool)

(assert (=> b!477299 (= e!280429 (forall!199 (t!15123 (toList!3970 (+!1767 lt!217360 (tuple2!8997 a!501 b!85)))) p!166))))

(assert (= (and d!76077 (not res!284887)) b!477298))

(assert (= (and b!477298 res!284888) b!477299))

(declare-fun b_lambda!10631 () Bool)

(assert (=> (not b_lambda!10631) (not b!477298)))

(declare-fun t!15179 () Bool)

(declare-fun tb!4081 () Bool)

(assert (=> (and start!42868 (= p!166 p!166) t!15179) tb!4081))

(declare-fun result!7649 () Bool)

(assert (=> tb!4081 (= result!7649 true)))

(assert (=> b!477298 t!15179))

(declare-fun b_and!20783 () Bool)

(assert (= b_and!20781 (and (=> t!15179 result!7649) b_and!20783)))

(declare-fun m!459623 () Bool)

(assert (=> b!477298 m!459623))

(declare-fun m!459625 () Bool)

(assert (=> b!477299 m!459625))

(assert (=> d!75929 d!76077))

(declare-fun d!76079 () Bool)

(declare-fun e!280430 () Bool)

(assert (=> d!76079 e!280430))

(declare-fun res!284890 () Bool)

(assert (=> d!76079 (=> (not res!284890) (not e!280430))))

(declare-fun lt!217508 () ListLongMap!7909)

(assert (=> d!76079 (= res!284890 (contains!2572 lt!217508 (_1!4509 (tuple2!8997 a!501 b!85))))))

(declare-fun lt!217507 () List!9055)

(assert (=> d!76079 (= lt!217508 (ListLongMap!7910 lt!217507))))

(declare-fun lt!217506 () Unit!14038)

(declare-fun lt!217509 () Unit!14038)

(assert (=> d!76079 (= lt!217506 lt!217509)))

(assert (=> d!76079 (= (getValueByKey!388 lt!217507 (_1!4509 (tuple2!8997 a!501 b!85))) (Some!393 (_2!4509 (tuple2!8997 a!501 b!85))))))

(assert (=> d!76079 (= lt!217509 (lemmaContainsTupThenGetReturnValue!210 lt!217507 (_1!4509 (tuple2!8997 a!501 b!85)) (_2!4509 (tuple2!8997 a!501 b!85))))))

(assert (=> d!76079 (= lt!217507 (insertStrictlySorted!213 (toList!3970 lt!217360) (_1!4509 (tuple2!8997 a!501 b!85)) (_2!4509 (tuple2!8997 a!501 b!85))))))

(assert (=> d!76079 (= (+!1767 lt!217360 (tuple2!8997 a!501 b!85)) lt!217508)))

(declare-fun b!477300 () Bool)

(declare-fun res!284889 () Bool)

(assert (=> b!477300 (=> (not res!284889) (not e!280430))))

(assert (=> b!477300 (= res!284889 (= (getValueByKey!388 (toList!3970 lt!217508) (_1!4509 (tuple2!8997 a!501 b!85))) (Some!393 (_2!4509 (tuple2!8997 a!501 b!85)))))))

(declare-fun b!477301 () Bool)

(assert (=> b!477301 (= e!280430 (contains!2573 (toList!3970 lt!217508) (tuple2!8997 a!501 b!85)))))

(assert (= (and d!76079 res!284890) b!477300))

(assert (= (and b!477300 res!284889) b!477301))

(declare-fun m!459627 () Bool)

(assert (=> d!76079 m!459627))

(declare-fun m!459629 () Bool)

(assert (=> d!76079 m!459629))

(declare-fun m!459631 () Bool)

(assert (=> d!76079 m!459631))

(declare-fun m!459633 () Bool)

(assert (=> d!76079 m!459633))

(declare-fun m!459635 () Bool)

(assert (=> b!477300 m!459635))

(declare-fun m!459637 () Bool)

(assert (=> b!477301 m!459637))

(assert (=> d!75929 d!76079))

(declare-fun d!76081 () Bool)

(assert (=> d!76081 (forall!199 (toList!3970 (+!1767 lt!217360 (tuple2!8997 a!501 b!85))) p!166)))

(assert (=> d!76081 true))

(declare-fun _$30!93 () Unit!14038)

(assert (=> d!76081 (= (choose!1362 lt!217360 p!166 a!501 b!85) _$30!93)))

(declare-fun bs!15170 () Bool)

(assert (= bs!15170 d!76081))

(assert (=> bs!15170 m!459247))

(assert (=> bs!15170 m!459249))

(assert (=> d!75929 d!76081))

(assert (=> d!75929 d!75913))

(declare-fun d!76083 () Bool)

(declare-fun res!284895 () Bool)

(declare-fun e!280435 () Bool)

(assert (=> d!76083 (=> res!284895 e!280435)))

(assert (=> d!76083 (= res!284895 (or (is-Nil!9052 (toList!3970 lm!215)) (is-Nil!9052 (t!15123 (toList!3970 lm!215)))))))

(assert (=> d!76083 (= (isStrictlySorted!389 (toList!3970 lm!215)) e!280435)))

(declare-fun b!477307 () Bool)

(declare-fun e!280436 () Bool)

(assert (=> b!477307 (= e!280435 e!280436)))

(declare-fun res!284896 () Bool)

(assert (=> b!477307 (=> (not res!284896) (not e!280436))))

(assert (=> b!477307 (= res!284896 (bvslt (_1!4509 (h!9907 (toList!3970 lm!215))) (_1!4509 (h!9907 (t!15123 (toList!3970 lm!215))))))))

(declare-fun b!477308 () Bool)

(assert (=> b!477308 (= e!280436 (isStrictlySorted!389 (t!15123 (toList!3970 lm!215))))))

(assert (= (and d!76083 (not res!284895)) b!477307))

(assert (= (and b!477307 res!284896) b!477308))

(declare-fun m!459639 () Bool)

(assert (=> b!477308 m!459639))

(assert (=> d!75963 d!76083))

(declare-fun d!76085 () Bool)

(assert (=> d!76085 (= (isEmpty!606 (toList!3970 lm!215)) (is-Nil!9052 (toList!3970 lm!215)))))

(assert (=> d!75967 d!76085))

(declare-fun d!76087 () Bool)

(declare-fun e!280438 () Bool)

(assert (=> d!76087 e!280438))

(declare-fun res!284897 () Bool)

(assert (=> d!76087 (=> res!284897 e!280438)))

(declare-fun lt!217513 () Bool)

(assert (=> d!76087 (= res!284897 (not lt!217513))))

(declare-fun lt!217512 () Bool)

(assert (=> d!76087 (= lt!217513 lt!217512)))

(declare-fun lt!217510 () Unit!14038)

(declare-fun e!280437 () Unit!14038)

(assert (=> d!76087 (= lt!217510 e!280437)))

(declare-fun c!57461 () Bool)

(assert (=> d!76087 (= c!57461 lt!217512)))

(assert (=> d!76087 (= lt!217512 (containsKey!350 (toList!3970 lt!217411) (_1!4509 lt!217362)))))

(assert (=> d!76087 (= (contains!2572 lt!217411 (_1!4509 lt!217362)) lt!217513)))

(declare-fun b!477309 () Bool)

(declare-fun lt!217511 () Unit!14038)

(assert (=> b!477309 (= e!280437 lt!217511)))

(assert (=> b!477309 (= lt!217511 (lemmaContainsKeyImpliesGetValueByKeyDefined!298 (toList!3970 lt!217411) (_1!4509 lt!217362)))))

(assert (=> b!477309 (isDefined!299 (getValueByKey!388 (toList!3970 lt!217411) (_1!4509 lt!217362)))))

(declare-fun b!477310 () Bool)

(declare-fun Unit!14045 () Unit!14038)

(assert (=> b!477310 (= e!280437 Unit!14045)))

(declare-fun b!477311 () Bool)

(assert (=> b!477311 (= e!280438 (isDefined!299 (getValueByKey!388 (toList!3970 lt!217411) (_1!4509 lt!217362))))))

(assert (= (and d!76087 c!57461) b!477309))

(assert (= (and d!76087 (not c!57461)) b!477310))

(assert (= (and d!76087 (not res!284897)) b!477311))

(declare-fun m!459641 () Bool)

(assert (=> d!76087 m!459641))

(declare-fun m!459643 () Bool)

(assert (=> b!477309 m!459643))

(assert (=> b!477309 m!459323))

(assert (=> b!477309 m!459323))

(declare-fun m!459645 () Bool)

(assert (=> b!477309 m!459645))

(assert (=> b!477311 m!459323))

(assert (=> b!477311 m!459323))

(assert (=> b!477311 m!459645))

(assert (=> d!75939 d!76087))

(declare-fun b!477314 () Bool)

(declare-fun e!280440 () Option!394)

(assert (=> b!477314 (= e!280440 (getValueByKey!388 (t!15123 lt!217410) (_1!4509 lt!217362)))))

(declare-fun b!477313 () Bool)

(declare-fun e!280439 () Option!394)

(assert (=> b!477313 (= e!280439 e!280440)))

(declare-fun c!57463 () Bool)

(assert (=> b!477313 (= c!57463 (and (is-Cons!9051 lt!217410) (not (= (_1!4509 (h!9907 lt!217410)) (_1!4509 lt!217362)))))))

(declare-fun b!477315 () Bool)

(assert (=> b!477315 (= e!280440 None!392)))

(declare-fun b!477312 () Bool)

(assert (=> b!477312 (= e!280439 (Some!393 (_2!4509 (h!9907 lt!217410))))))

(declare-fun d!76089 () Bool)

(declare-fun c!57462 () Bool)

(assert (=> d!76089 (= c!57462 (and (is-Cons!9051 lt!217410) (= (_1!4509 (h!9907 lt!217410)) (_1!4509 lt!217362))))))

(assert (=> d!76089 (= (getValueByKey!388 lt!217410 (_1!4509 lt!217362)) e!280439)))

(assert (= (and d!76089 c!57462) b!477312))

(assert (= (and d!76089 (not c!57462)) b!477313))

(assert (= (and b!477313 c!57463) b!477314))

(assert (= (and b!477313 (not c!57463)) b!477315))

(declare-fun m!459647 () Bool)

(assert (=> b!477314 m!459647))

(assert (=> d!75939 d!76089))

(declare-fun d!76091 () Bool)

(assert (=> d!76091 (= (getValueByKey!388 lt!217410 (_1!4509 lt!217362)) (Some!393 (_2!4509 lt!217362)))))

(declare-fun lt!217514 () Unit!14038)

(assert (=> d!76091 (= lt!217514 (choose!1366 lt!217410 (_1!4509 lt!217362) (_2!4509 lt!217362)))))

(declare-fun e!280441 () Bool)

(assert (=> d!76091 e!280441))

(declare-fun res!284898 () Bool)

(assert (=> d!76091 (=> (not res!284898) (not e!280441))))

(assert (=> d!76091 (= res!284898 (isStrictlySorted!389 lt!217410))))

(assert (=> d!76091 (= (lemmaContainsTupThenGetReturnValue!210 lt!217410 (_1!4509 lt!217362) (_2!4509 lt!217362)) lt!217514)))

(declare-fun b!477316 () Bool)

(declare-fun res!284899 () Bool)

(assert (=> b!477316 (=> (not res!284899) (not e!280441))))

(assert (=> b!477316 (= res!284899 (containsKey!350 lt!217410 (_1!4509 lt!217362)))))

(declare-fun b!477317 () Bool)

(assert (=> b!477317 (= e!280441 (contains!2573 lt!217410 (tuple2!8997 (_1!4509 lt!217362) (_2!4509 lt!217362))))))

(assert (= (and d!76091 res!284898) b!477316))

(assert (= (and b!477316 res!284899) b!477317))

(assert (=> d!76091 m!459317))

(declare-fun m!459649 () Bool)

(assert (=> d!76091 m!459649))

(declare-fun m!459651 () Bool)

(assert (=> d!76091 m!459651))

(declare-fun m!459653 () Bool)

(assert (=> b!477316 m!459653))

(declare-fun m!459655 () Bool)

(assert (=> b!477317 m!459655))

(assert (=> d!75939 d!76091))

(declare-fun b!477318 () Bool)

(declare-fun c!57465 () Bool)

(assert (=> b!477318 (= c!57465 (and (is-Cons!9051 (toList!3970 lt!217360)) (bvsgt (_1!4509 (h!9907 (toList!3970 lt!217360))) (_1!4509 lt!217362))))))

(declare-fun e!280445 () List!9055)

(declare-fun e!280443 () List!9055)

(assert (=> b!477318 (= e!280445 e!280443)))

(declare-fun b!477319 () Bool)

(declare-fun res!284900 () Bool)

(declare-fun e!280442 () Bool)

(assert (=> b!477319 (=> (not res!284900) (not e!280442))))

(declare-fun lt!217515 () List!9055)

(assert (=> b!477319 (= res!284900 (containsKey!350 lt!217515 (_1!4509 lt!217362)))))

(declare-fun b!477320 () Bool)

(declare-fun e!280446 () List!9055)

(assert (=> b!477320 (= e!280446 e!280445)))

(declare-fun c!57464 () Bool)

(assert (=> b!477320 (= c!57464 (and (is-Cons!9051 (toList!3970 lt!217360)) (= (_1!4509 (h!9907 (toList!3970 lt!217360))) (_1!4509 lt!217362))))))

(declare-fun bm!30761 () Bool)

(declare-fun call!30764 () List!9055)

(declare-fun call!30766 () List!9055)

(assert (=> bm!30761 (= call!30764 call!30766)))

(declare-fun b!477321 () Bool)

(assert (=> b!477321 (= e!280443 call!30764)))

(declare-fun b!477322 () Bool)

(declare-fun e!280444 () List!9055)

(assert (=> b!477322 (= e!280444 (insertStrictlySorted!213 (t!15123 (toList!3970 lt!217360)) (_1!4509 lt!217362) (_2!4509 lt!217362)))))

(declare-fun b!477323 () Bool)

(assert (=> b!477323 (= e!280443 call!30764)))

(declare-fun b!477324 () Bool)

(assert (=> b!477324 (= e!280444 (ite c!57464 (t!15123 (toList!3970 lt!217360)) (ite c!57465 (Cons!9051 (h!9907 (toList!3970 lt!217360)) (t!15123 (toList!3970 lt!217360))) Nil!9052)))))

(declare-fun b!477325 () Bool)

(assert (=> b!477325 (= e!280442 (contains!2573 lt!217515 (tuple2!8997 (_1!4509 lt!217362) (_2!4509 lt!217362))))))

(declare-fun d!76093 () Bool)

(assert (=> d!76093 e!280442))

(declare-fun res!284901 () Bool)

(assert (=> d!76093 (=> (not res!284901) (not e!280442))))

(assert (=> d!76093 (= res!284901 (isStrictlySorted!389 lt!217515))))

(assert (=> d!76093 (= lt!217515 e!280446)))

(declare-fun c!57467 () Bool)

(assert (=> d!76093 (= c!57467 (and (is-Cons!9051 (toList!3970 lt!217360)) (bvslt (_1!4509 (h!9907 (toList!3970 lt!217360))) (_1!4509 lt!217362))))))

(assert (=> d!76093 (isStrictlySorted!389 (toList!3970 lt!217360))))

(assert (=> d!76093 (= (insertStrictlySorted!213 (toList!3970 lt!217360) (_1!4509 lt!217362) (_2!4509 lt!217362)) lt!217515)))

(declare-fun call!30765 () List!9055)

(declare-fun bm!30762 () Bool)

(assert (=> bm!30762 (= call!30765 ($colon$colon!112 e!280444 (ite c!57467 (h!9907 (toList!3970 lt!217360)) (tuple2!8997 (_1!4509 lt!217362) (_2!4509 lt!217362)))))))

(declare-fun c!57466 () Bool)

(assert (=> bm!30762 (= c!57466 c!57467)))

(declare-fun b!477326 () Bool)

(assert (=> b!477326 (= e!280446 call!30765)))

(declare-fun b!477327 () Bool)

(assert (=> b!477327 (= e!280445 call!30766)))

(declare-fun bm!30763 () Bool)

(assert (=> bm!30763 (= call!30766 call!30765)))

(assert (= (and d!76093 c!57467) b!477326))

(assert (= (and d!76093 (not c!57467)) b!477320))

(assert (= (and b!477320 c!57464) b!477327))

(assert (= (and b!477320 (not c!57464)) b!477318))

(assert (= (and b!477318 c!57465) b!477323))

(assert (= (and b!477318 (not c!57465)) b!477321))

(assert (= (or b!477323 b!477321) bm!30761))

(assert (= (or b!477327 bm!30761) bm!30763))

(assert (= (or b!477326 bm!30763) bm!30762))

(assert (= (and bm!30762 c!57466) b!477322))

(assert (= (and bm!30762 (not c!57466)) b!477324))

(assert (= (and d!76093 res!284901) b!477319))

(assert (= (and b!477319 res!284900) b!477325))

(declare-fun m!459657 () Bool)

(assert (=> d!76093 m!459657))

(declare-fun m!459659 () Bool)

(assert (=> d!76093 m!459659))

(declare-fun m!459661 () Bool)

(assert (=> b!477319 m!459661))

(declare-fun m!459663 () Bool)

(assert (=> bm!30762 m!459663))

(declare-fun m!459665 () Bool)

(assert (=> b!477322 m!459665))

(declare-fun m!459667 () Bool)

(assert (=> b!477325 m!459667))

(assert (=> d!75939 d!76093))

(declare-fun d!76095 () Bool)

(declare-fun res!284902 () Bool)

(declare-fun e!280447 () Bool)

(assert (=> d!76095 (=> res!284902 e!280447)))

(assert (=> d!76095 (= res!284902 (is-Nil!9052 (t!15123 (toList!3970 lm!215))))))

(assert (=> d!76095 (= (forall!199 (t!15123 (toList!3970 lm!215)) p!166) e!280447)))

(declare-fun b!477328 () Bool)

(declare-fun e!280448 () Bool)

(assert (=> b!477328 (= e!280447 e!280448)))

(declare-fun res!284903 () Bool)

(assert (=> b!477328 (=> (not res!284903) (not e!280448))))

(assert (=> b!477328 (= res!284903 (dynLambda!946 p!166 (h!9907 (t!15123 (toList!3970 lm!215)))))))

(declare-fun b!477329 () Bool)

(assert (=> b!477329 (= e!280448 (forall!199 (t!15123 (t!15123 (toList!3970 lm!215))) p!166))))

(assert (= (and d!76095 (not res!284902)) b!477328))

(assert (= (and b!477328 res!284903) b!477329))

(declare-fun b_lambda!10633 () Bool)

(assert (=> (not b_lambda!10633) (not b!477328)))

(declare-fun t!15181 () Bool)

(declare-fun tb!4083 () Bool)

(assert (=> (and start!42868 (= p!166 p!166) t!15181) tb!4083))

(declare-fun result!7651 () Bool)

(assert (=> tb!4083 (= result!7651 true)))

(assert (=> b!477328 t!15181))

(declare-fun b_and!20785 () Bool)

(assert (= b_and!20783 (and (=> t!15181 result!7651) b_and!20785)))

(declare-fun m!459669 () Bool)

(assert (=> b!477328 m!459669))

(declare-fun m!459671 () Bool)

(assert (=> b!477329 m!459671))

(assert (=> b!476986 d!76095))

(declare-fun b!477332 () Bool)

(declare-fun e!280450 () Option!394)

(assert (=> b!477332 (= e!280450 (getValueByKey!388 (t!15123 (toList!3970 lt!217417)) (_1!4509 lt!217362)))))

(declare-fun b!477331 () Bool)

(declare-fun e!280449 () Option!394)

(assert (=> b!477331 (= e!280449 e!280450)))

(declare-fun c!57469 () Bool)

(assert (=> b!477331 (= c!57469 (and (is-Cons!9051 (toList!3970 lt!217417)) (not (= (_1!4509 (h!9907 (toList!3970 lt!217417))) (_1!4509 lt!217362)))))))

(declare-fun b!477333 () Bool)

(assert (=> b!477333 (= e!280450 None!392)))

(declare-fun b!477330 () Bool)

(assert (=> b!477330 (= e!280449 (Some!393 (_2!4509 (h!9907 (toList!3970 lt!217417)))))))

(declare-fun d!76097 () Bool)

(declare-fun c!57468 () Bool)

(assert (=> d!76097 (= c!57468 (and (is-Cons!9051 (toList!3970 lt!217417)) (= (_1!4509 (h!9907 (toList!3970 lt!217417))) (_1!4509 lt!217362))))))

(assert (=> d!76097 (= (getValueByKey!388 (toList!3970 lt!217417) (_1!4509 lt!217362)) e!280449)))

(assert (= (and d!76097 c!57468) b!477330))

(assert (= (and d!76097 (not c!57468)) b!477331))

(assert (= (and b!477331 c!57469) b!477332))

(assert (= (and b!477331 (not c!57469)) b!477333))

(declare-fun m!459673 () Bool)

(assert (=> b!477332 m!459673))

(assert (=> b!476980 d!76097))

(declare-fun d!76099 () Bool)

(declare-fun res!284904 () Bool)

(declare-fun e!280451 () Bool)

(assert (=> d!76099 (=> res!284904 e!280451)))

(assert (=> d!76099 (= res!284904 (is-Nil!9052 (t!15123 (toList!3970 (+!1767 lm!215 lt!217362)))))))

(assert (=> d!76099 (= (forall!199 (t!15123 (toList!3970 (+!1767 lm!215 lt!217362))) p!166) e!280451)))

(declare-fun b!477334 () Bool)

(declare-fun e!280452 () Bool)

(assert (=> b!477334 (= e!280451 e!280452)))

(declare-fun res!284905 () Bool)

(assert (=> b!477334 (=> (not res!284905) (not e!280452))))

(assert (=> b!477334 (= res!284905 (dynLambda!946 p!166 (h!9907 (t!15123 (toList!3970 (+!1767 lm!215 lt!217362))))))))

(declare-fun b!477335 () Bool)

(assert (=> b!477335 (= e!280452 (forall!199 (t!15123 (t!15123 (toList!3970 (+!1767 lm!215 lt!217362)))) p!166))))

(assert (= (and d!76099 (not res!284904)) b!477334))

(assert (= (and b!477334 res!284905) b!477335))

(declare-fun b_lambda!10635 () Bool)

(assert (=> (not b_lambda!10635) (not b!477334)))

(declare-fun t!15183 () Bool)

(declare-fun tb!4085 () Bool)

(assert (=> (and start!42868 (= p!166 p!166) t!15183) tb!4085))

(declare-fun result!7653 () Bool)

(assert (=> tb!4085 (= result!7653 true)))

(assert (=> b!477334 t!15183))

(declare-fun b_and!20787 () Bool)

(assert (= b_and!20785 (and (=> t!15183 result!7653) b_and!20787)))

(declare-fun m!459675 () Bool)

(assert (=> b!477334 m!459675))

(declare-fun m!459677 () Bool)

(assert (=> b!477335 m!459677))

(assert (=> b!476983 d!76099))

(declare-fun b!477336 () Bool)

(declare-fun e!280453 () Bool)

(declare-fun tp!42421 () Bool)

(assert (=> b!477336 (= e!280453 (and tp_is_empty!13529 tp!42421))))

(assert (=> b!477000 (= tp!42418 e!280453)))

(assert (= (and b!477000 (is-Cons!9051 (t!15123 (toList!3970 lm!215)))) b!477336))

(declare-fun b_lambda!10637 () Bool)

(assert (= b_lambda!10627 (or (and start!42868 b_free!12107) b_lambda!10637)))

(declare-fun b_lambda!10639 () Bool)

(assert (= b_lambda!10631 (or (and start!42868 b_free!12107) b_lambda!10639)))

(declare-fun b_lambda!10641 () Bool)

(assert (= b_lambda!10635 (or (and start!42868 b_free!12107) b_lambda!10641)))

(declare-fun b_lambda!10643 () Bool)

(assert (= b_lambda!10629 (or (and start!42868 b_free!12107) b_lambda!10643)))

(declare-fun b_lambda!10645 () Bool)

(assert (= b_lambda!10633 (or (and start!42868 b_free!12107) b_lambda!10645)))

(push 1)

(assert (not d!76069))

(assert (not b_next!12107))

(assert (not b!477329))

(assert (not b!477322))

(assert (not b!477260))

(assert (not b!477286))

(assert (not b!477301))

(assert (not b!477335))

(assert b_and!20787)

(assert (not b!477289))

(assert (not b!477316))

(assert (not b_lambda!10583))

(assert (not b!477325))

(assert (not d!76093))

(assert (not b_lambda!10643))

(assert (not b_lambda!10579))

(assert (not b!477309))

(assert (not b!477314))

(assert (not d!76051))

(assert (not b_lambda!10639))

(assert (not b!477308))

(assert (not b!477259))

(assert (not b_lambda!10637))

(assert (not b_lambda!10577))

(assert (not d!76087))

(assert (not b!477311))

(assert (not b!477217))

(assert (not b!477220))

(assert (not b_lambda!10645))

(assert (not bm!30759))

(assert (not b!477230))

(assert (not d!76049))

(assert (not b!477293))

(assert (not b!477295))

(assert (not b!477188))

(assert (not d!76055))

(assert (not b!477297))

(assert (not b!477181))

(assert (not b!477319))

(assert (not b!477332))

(assert (not b_lambda!10581))

(assert (not b_lambda!10641))

(assert tp_is_empty!13529)

(assert (not b!477299))

(assert (not b!477300))

(assert (not b!477336))

(assert (not d!76091))

(assert (not d!76079))

(assert (not b!477283))

(assert (not d!76081))

(assert (not b_lambda!10585))

(assert (not b_lambda!10525))

(assert (not d!76073))

(assert (not b!477317))

(assert (not bm!30762))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20787)

(assert (not b_next!12107))

(check-sat)

(get-model)

(pop 1)

(declare-fun b!477587 () Bool)

(declare-fun e!280637 () Option!394)

(assert (=> b!477587 (= e!280637 (getValueByKey!388 (t!15123 (t!15123 (toList!3970 lt!217417))) (_1!4509 lt!217362)))))

(declare-fun b!477586 () Bool)

(declare-fun e!280636 () Option!394)

(assert (=> b!477586 (= e!280636 e!280637)))

(declare-fun c!57529 () Bool)

(assert (=> b!477586 (= c!57529 (and (is-Cons!9051 (t!15123 (toList!3970 lt!217417))) (not (= (_1!4509 (h!9907 (t!15123 (toList!3970 lt!217417)))) (_1!4509 lt!217362)))))))

(declare-fun b!477588 () Bool)

(assert (=> b!477588 (= e!280637 None!392)))

(declare-fun b!477585 () Bool)

(assert (=> b!477585 (= e!280636 (Some!393 (_2!4509 (h!9907 (t!15123 (toList!3970 lt!217417))))))))

(declare-fun d!76281 () Bool)

(declare-fun c!57528 () Bool)

(assert (=> d!76281 (= c!57528 (and (is-Cons!9051 (t!15123 (toList!3970 lt!217417))) (= (_1!4509 (h!9907 (t!15123 (toList!3970 lt!217417)))) (_1!4509 lt!217362))))))

(assert (=> d!76281 (= (getValueByKey!388 (t!15123 (toList!3970 lt!217417)) (_1!4509 lt!217362)) e!280636)))

(assert (= (and d!76281 c!57528) b!477585))

(assert (= (and d!76281 (not c!57528)) b!477586))

(assert (= (and b!477586 c!57529) b!477587))

(assert (= (and b!477586 (not c!57529)) b!477588))

(declare-fun m!459995 () Bool)

(assert (=> b!477587 m!459995))

(assert (=> b!477332 d!76281))

(declare-fun d!76283 () Bool)

(declare-fun res!285036 () Bool)

(declare-fun e!280638 () Bool)

(assert (=> d!76283 (=> res!285036 e!280638)))

(assert (=> d!76283 (= res!285036 (or (is-Nil!9052 (t!15123 (toList!3970 lm!215))) (is-Nil!9052 (t!15123 (t!15123 (toList!3970 lm!215))))))))

(assert (=> d!76283 (= (isStrictlySorted!389 (t!15123 (toList!3970 lm!215))) e!280638)))

(declare-fun b!477589 () Bool)

(declare-fun e!280639 () Bool)

(assert (=> b!477589 (= e!280638 e!280639)))

(declare-fun res!285037 () Bool)

(assert (=> b!477589 (=> (not res!285037) (not e!280639))))

(assert (=> b!477589 (= res!285037 (bvslt (_1!4509 (h!9907 (t!15123 (toList!3970 lm!215)))) (_1!4509 (h!9907 (t!15123 (t!15123 (toList!3970 lm!215)))))))))

(declare-fun b!477590 () Bool)

(assert (=> b!477590 (= e!280639 (isStrictlySorted!389 (t!15123 (t!15123 (toList!3970 lm!215)))))))

(assert (= (and d!76283 (not res!285036)) b!477589))

(assert (= (and b!477589 res!285037) b!477590))

(declare-fun m!459997 () Bool)

(assert (=> b!477590 m!459997))

(assert (=> b!477308 d!76283))

(declare-fun d!76285 () Bool)

(declare-fun res!285042 () Bool)

(declare-fun e!280644 () Bool)

(assert (=> d!76285 (=> res!285042 e!280644)))

(assert (=> d!76285 (= res!285042 (and (is-Cons!9051 lt!217410) (= (_1!4509 (h!9907 lt!217410)) (_1!4509 lt!217362))))))

(assert (=> d!76285 (= (containsKey!350 lt!217410 (_1!4509 lt!217362)) e!280644)))

(declare-fun b!477595 () Bool)

(declare-fun e!280645 () Bool)

(assert (=> b!477595 (= e!280644 e!280645)))

(declare-fun res!285043 () Bool)

(assert (=> b!477595 (=> (not res!285043) (not e!280645))))

(assert (=> b!477595 (= res!285043 (and (or (not (is-Cons!9051 lt!217410)) (bvsle (_1!4509 (h!9907 lt!217410)) (_1!4509 lt!217362))) (is-Cons!9051 lt!217410) (bvslt (_1!4509 (h!9907 lt!217410)) (_1!4509 lt!217362))))))

(declare-fun b!477596 () Bool)

(assert (=> b!477596 (= e!280645 (containsKey!350 (t!15123 lt!217410) (_1!4509 lt!217362)))))

(assert (= (and d!76285 (not res!285042)) b!477595))

(assert (= (and b!477595 res!285043) b!477596))

(declare-fun m!459999 () Bool)

(assert (=> b!477596 m!459999))

(assert (=> b!477316 d!76285))

(declare-fun d!76287 () Bool)

(declare-fun lt!217554 () Bool)

(assert (=> d!76287 (= lt!217554 (member (tuple2!8997 (_1!4509 lt!217362) (_2!4509 lt!217362)) (content!208 lt!217410)))))

(declare-fun e!280647 () Bool)

(assert (=> d!76287 (= lt!217554 e!280647)))

(declare-fun res!285045 () Bool)

(assert (=> d!76287 (=> (not res!285045) (not e!280647))))

(assert (=> d!76287 (= res!285045 (is-Cons!9051 lt!217410))))

(assert (=> d!76287 (= (contains!2573 lt!217410 (tuple2!8997 (_1!4509 lt!217362) (_2!4509 lt!217362))) lt!217554)))

(declare-fun b!477597 () Bool)

(declare-fun e!280646 () Bool)

(assert (=> b!477597 (= e!280647 e!280646)))

(declare-fun res!285044 () Bool)

(assert (=> b!477597 (=> res!285044 e!280646)))

(assert (=> b!477597 (= res!285044 (= (h!9907 lt!217410) (tuple2!8997 (_1!4509 lt!217362) (_2!4509 lt!217362))))))

(declare-fun b!477598 () Bool)

(assert (=> b!477598 (= e!280646 (contains!2573 (t!15123 lt!217410) (tuple2!8997 (_1!4509 lt!217362) (_2!4509 lt!217362))))))

(assert (= (and d!76287 res!285045) b!477597))

(assert (= (and b!477597 (not res!285044)) b!477598))

(declare-fun m!460001 () Bool)

(assert (=> d!76287 m!460001))

(declare-fun m!460003 () Bool)

(assert (=> d!76287 m!460003))

(declare-fun m!460005 () Bool)

(assert (=> b!477598 m!460005))

(assert (=> b!477317 d!76287))

(declare-fun d!76289 () Bool)

(declare-fun res!285046 () Bool)

(declare-fun e!280648 () Bool)

(assert (=> d!76289 (=> res!285046 e!280648)))

(assert (=> d!76289 (= res!285046 (and (is-Cons!9051 (toList!3970 lt!217417)) (= (_1!4509 (h!9907 (toList!3970 lt!217417))) (_1!4509 lt!217362))))))

(assert (=> d!76289 (= (containsKey!350 (toList!3970 lt!217417) (_1!4509 lt!217362)) e!280648)))

(declare-fun b!477599 () Bool)

(declare-fun e!280649 () Bool)

(assert (=> b!477599 (= e!280648 e!280649)))

(declare-fun res!285047 () Bool)

(assert (=> b!477599 (=> (not res!285047) (not e!280649))))

(assert (=> b!477599 (= res!285047 (and (or (not (is-Cons!9051 (toList!3970 lt!217417))) (bvsle (_1!4509 (h!9907 (toList!3970 lt!217417))) (_1!4509 lt!217362))) (is-Cons!9051 (toList!3970 lt!217417)) (bvslt (_1!4509 (h!9907 (toList!3970 lt!217417))) (_1!4509 lt!217362))))))

(declare-fun b!477600 () Bool)

(assert (=> b!477600 (= e!280649 (containsKey!350 (t!15123 (toList!3970 lt!217417)) (_1!4509 lt!217362)))))

(assert (= (and d!76289 (not res!285046)) b!477599))

(assert (= (and b!477599 res!285047) b!477600))

(declare-fun m!460007 () Bool)

(assert (=> b!477600 m!460007))

(assert (=> d!76051 d!76289))

(declare-fun d!76291 () Bool)

(declare-fun res!285048 () Bool)

(declare-fun e!280650 () Bool)

(assert (=> d!76291 (=> res!285048 e!280650)))

(assert (=> d!76291 (= res!285048 (and (is-Cons!9051 lt!217504) (= (_1!4509 (h!9907 lt!217504)) (_1!4509 lt!217362))))))

(assert (=> d!76291 (= (containsKey!350 lt!217504 (_1!4509 lt!217362)) e!280650)))

(declare-fun b!477601 () Bool)

(declare-fun e!280651 () Bool)

(assert (=> b!477601 (= e!280650 e!280651)))

(declare-fun res!285049 () Bool)

(assert (=> b!477601 (=> (not res!285049) (not e!280651))))

(assert (=> b!477601 (= res!285049 (and (or (not (is-Cons!9051 lt!217504)) (bvsle (_1!4509 (h!9907 lt!217504)) (_1!4509 lt!217362))) (is-Cons!9051 lt!217504) (bvslt (_1!4509 (h!9907 lt!217504)) (_1!4509 lt!217362))))))

(declare-fun b!477602 () Bool)

(assert (=> b!477602 (= e!280651 (containsKey!350 (t!15123 lt!217504) (_1!4509 lt!217362)))))

(assert (= (and d!76291 (not res!285048)) b!477601))

(assert (= (and b!477601 res!285049) b!477602))

(declare-fun m!460009 () Bool)

(assert (=> b!477602 m!460009))

(assert (=> b!477283 d!76291))

(declare-fun d!76293 () Bool)

(declare-fun e!280653 () Bool)

(assert (=> d!76293 e!280653))

(declare-fun res!285050 () Bool)

(assert (=> d!76293 (=> res!285050 e!280653)))

(declare-fun lt!217558 () Bool)

(assert (=> d!76293 (= res!285050 (not lt!217558))))

(declare-fun lt!217557 () Bool)

(assert (=> d!76293 (= lt!217558 lt!217557)))

(declare-fun lt!217555 () Unit!14038)

(declare-fun e!280652 () Unit!14038)

(assert (=> d!76293 (= lt!217555 e!280652)))

(declare-fun c!57530 () Bool)

(assert (=> d!76293 (= c!57530 lt!217557)))

(assert (=> d!76293 (= lt!217557 (containsKey!350 (toList!3970 lt!217508) (_1!4509 (tuple2!8997 a!501 b!85))))))

(assert (=> d!76293 (= (contains!2572 lt!217508 (_1!4509 (tuple2!8997 a!501 b!85))) lt!217558)))

(declare-fun b!477603 () Bool)

(declare-fun lt!217556 () Unit!14038)

(assert (=> b!477603 (= e!280652 lt!217556)))

(assert (=> b!477603 (= lt!217556 (lemmaContainsKeyImpliesGetValueByKeyDefined!298 (toList!3970 lt!217508) (_1!4509 (tuple2!8997 a!501 b!85))))))

(assert (=> b!477603 (isDefined!299 (getValueByKey!388 (toList!3970 lt!217508) (_1!4509 (tuple2!8997 a!501 b!85))))))

(declare-fun b!477604 () Bool)

