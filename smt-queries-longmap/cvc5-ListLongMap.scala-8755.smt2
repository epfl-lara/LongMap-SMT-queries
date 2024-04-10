; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106270 () Bool)

(assert start!106270)

(declare-fun b!1264691 () Bool)

(declare-fun res!842216 () Bool)

(declare-fun e!720199 () Bool)

(assert (=> b!1264691 (=> (not res!842216) (not e!720199))))

(declare-datatypes ((B!1922 0))(
  ( (B!1923 (val!16296 Int)) )
))
(declare-datatypes ((tuple2!21110 0))(
  ( (tuple2!21111 (_1!10566 (_ BitVec 64)) (_2!10566 B!1922)) )
))
(declare-datatypes ((List!28288 0))(
  ( (Nil!28285) (Cons!28284 (h!29493 tuple2!21110) (t!41809 List!28288)) )
))
(declare-datatypes ((ListLongMap!18983 0))(
  ( (ListLongMap!18984 (toList!9507 List!28288)) )
))
(declare-fun lm!212 () ListLongMap!18983)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun containsKey!634 (List!28288 (_ BitVec 64)) Bool)

(assert (=> b!1264691 (= res!842216 (not (containsKey!634 (toList!9507 lm!212) a1!67)))))

(declare-fun res!842218 () Bool)

(assert (=> start!106270 (=> (not res!842218) (not e!720199))))

(declare-fun contains!7628 (ListLongMap!18983 (_ BitVec 64)) Bool)

(assert (=> start!106270 (= res!842218 (not (contains!7628 lm!212 a1!67)))))

(assert (=> start!106270 e!720199))

(declare-fun e!720200 () Bool)

(declare-fun inv!44088 (ListLongMap!18983) Bool)

(assert (=> start!106270 (and (inv!44088 lm!212) e!720200)))

(assert (=> start!106270 true))

(declare-fun tp_is_empty!32455 () Bool)

(assert (=> start!106270 tp_is_empty!32455))

(declare-fun b!1264692 () Bool)

(declare-fun b1!78 () B!1922)

(declare-fun -!2152 (ListLongMap!18983 (_ BitVec 64)) ListLongMap!18983)

(declare-fun +!4265 (ListLongMap!18983 tuple2!21110) ListLongMap!18983)

(assert (=> b!1264692 (= e!720199 (not (= (-!2152 (+!4265 lm!212 (tuple2!21111 a1!67 b1!78)) a1!67) lm!212)))))

(declare-fun removeStrictlySorted!146 (List!28288 (_ BitVec 64)) List!28288)

(declare-fun insertStrictlySorted!453 (List!28288 (_ BitVec 64) B!1922) List!28288)

(assert (=> b!1264692 (= (removeStrictlySorted!146 (insertStrictlySorted!453 (toList!9507 lm!212) a1!67 b1!78) a1!67) (toList!9507 lm!212))))

(declare-datatypes ((Unit!42162 0))(
  ( (Unit!42163) )
))
(declare-fun lt!573879 () Unit!42162)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!1 (List!28288 (_ BitVec 64) B!1922) Unit!42162)

(assert (=> b!1264692 (= lt!573879 (lemmaInsertStrictlySortedThenRemoveIsSame!1 (toList!9507 lm!212) a1!67 b1!78))))

(declare-fun b!1264693 () Bool)

(declare-fun tp!96239 () Bool)

(assert (=> b!1264693 (= e!720200 tp!96239)))

(declare-fun b!1264690 () Bool)

(declare-fun res!842217 () Bool)

(assert (=> b!1264690 (=> (not res!842217) (not e!720199))))

(declare-fun isStrictlySorted!775 (List!28288) Bool)

(assert (=> b!1264690 (= res!842217 (isStrictlySorted!775 (toList!9507 lm!212)))))

(assert (= (and start!106270 res!842218) b!1264690))

(assert (= (and b!1264690 res!842217) b!1264691))

(assert (= (and b!1264691 res!842216) b!1264692))

(assert (= start!106270 b!1264693))

(declare-fun m!1165173 () Bool)

(assert (=> b!1264691 m!1165173))

(declare-fun m!1165175 () Bool)

(assert (=> start!106270 m!1165175))

(declare-fun m!1165177 () Bool)

(assert (=> start!106270 m!1165177))

(declare-fun m!1165179 () Bool)

(assert (=> b!1264692 m!1165179))

(declare-fun m!1165181 () Bool)

(assert (=> b!1264692 m!1165181))

(declare-fun m!1165183 () Bool)

(assert (=> b!1264692 m!1165183))

(declare-fun m!1165185 () Bool)

(assert (=> b!1264692 m!1165185))

(assert (=> b!1264692 m!1165185))

(declare-fun m!1165187 () Bool)

(assert (=> b!1264692 m!1165187))

(assert (=> b!1264692 m!1165179))

(declare-fun m!1165189 () Bool)

(assert (=> b!1264690 m!1165189))

(push 1)

(assert (not b!1264692))

(assert (not b!1264693))

(assert (not start!106270))

(assert (not b!1264691))

(assert tp_is_empty!32455)

(assert (not b!1264690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138781 () Bool)

(assert (=> d!138781 (= (removeStrictlySorted!146 (insertStrictlySorted!453 (toList!9507 lm!212) a1!67 b1!78) a1!67) (toList!9507 lm!212))))

(declare-fun lt!573894 () Unit!42162)

(declare-fun choose!1880 (List!28288 (_ BitVec 64) B!1922) Unit!42162)

(assert (=> d!138781 (= lt!573894 (choose!1880 (toList!9507 lm!212) a1!67 b1!78))))

(assert (=> d!138781 (isStrictlySorted!775 (toList!9507 lm!212))))

(assert (=> d!138781 (= (lemmaInsertStrictlySortedThenRemoveIsSame!1 (toList!9507 lm!212) a1!67 b1!78) lt!573894)))

(declare-fun bs!35786 () Bool)

(assert (= bs!35786 d!138781))

(assert (=> bs!35786 m!1165185))

(assert (=> bs!35786 m!1165185))

(assert (=> bs!35786 m!1165187))

(declare-fun m!1165227 () Bool)

(assert (=> bs!35786 m!1165227))

(assert (=> bs!35786 m!1165189))

(assert (=> b!1264692 d!138781))

(declare-fun b!1264755 () Bool)

(declare-fun e!720241 () List!28288)

(assert (=> b!1264755 (= e!720241 (t!41809 (insertStrictlySorted!453 (toList!9507 lm!212) a1!67 b1!78)))))

(declare-fun e!720242 () List!28288)

(declare-fun b!1264756 () Bool)

(declare-fun $colon$colon!632 (List!28288 tuple2!21110) List!28288)

(assert (=> b!1264756 (= e!720242 ($colon$colon!632 (removeStrictlySorted!146 (t!41809 (insertStrictlySorted!453 (toList!9507 lm!212) a1!67 b1!78)) a1!67) (h!29493 (insertStrictlySorted!453 (toList!9507 lm!212) a1!67 b1!78))))))

(declare-fun d!138787 () Bool)

(declare-fun e!720243 () Bool)

(assert (=> d!138787 e!720243))

(declare-fun res!842256 () Bool)

(assert (=> d!138787 (=> (not res!842256) (not e!720243))))

(declare-fun lt!573914 () List!28288)

(assert (=> d!138787 (= res!842256 (isStrictlySorted!775 lt!573914))))

(assert (=> d!138787 (= lt!573914 e!720241)))

(declare-fun c!123164 () Bool)

(assert (=> d!138787 (= c!123164 (and (is-Cons!28284 (insertStrictlySorted!453 (toList!9507 lm!212) a1!67 b1!78)) (= (_1!10566 (h!29493 (insertStrictlySorted!453 (toList!9507 lm!212) a1!67 b1!78))) a1!67)))))

(assert (=> d!138787 (isStrictlySorted!775 (insertStrictlySorted!453 (toList!9507 lm!212) a1!67 b1!78))))

(assert (=> d!138787 (= (removeStrictlySorted!146 (insertStrictlySorted!453 (toList!9507 lm!212) a1!67 b1!78) a1!67) lt!573914)))

(declare-fun b!1264757 () Bool)

(assert (=> b!1264757 (= e!720243 (not (containsKey!634 lt!573914 a1!67)))))

(declare-fun b!1264758 () Bool)

(assert (=> b!1264758 (= e!720241 e!720242)))

(declare-fun c!123165 () Bool)

(assert (=> b!1264758 (= c!123165 (and (is-Cons!28284 (insertStrictlySorted!453 (toList!9507 lm!212) a1!67 b1!78)) (not (= (_1!10566 (h!29493 (insertStrictlySorted!453 (toList!9507 lm!212) a1!67 b1!78))) a1!67))))))

(declare-fun b!1264759 () Bool)

(assert (=> b!1264759 (= e!720242 Nil!28285)))

(assert (= (and d!138787 c!123164) b!1264755))

(assert (= (and d!138787 (not c!123164)) b!1264758))

(assert (= (and b!1264758 c!123165) b!1264756))

(assert (= (and b!1264758 (not c!123165)) b!1264759))

(assert (= (and d!138787 res!842256) b!1264757))

(declare-fun m!1165241 () Bool)

(assert (=> b!1264756 m!1165241))

(assert (=> b!1264756 m!1165241))

(declare-fun m!1165243 () Bool)

(assert (=> b!1264756 m!1165243))

(declare-fun m!1165247 () Bool)

(assert (=> d!138787 m!1165247))

(assert (=> d!138787 m!1165185))

(declare-fun m!1165251 () Bool)

(assert (=> d!138787 m!1165251))

(declare-fun m!1165253 () Bool)

(assert (=> b!1264757 m!1165253))

(assert (=> b!1264692 d!138787))

(declare-fun d!138797 () Bool)

(declare-fun e!720265 () Bool)

(assert (=> d!138797 e!720265))

(declare-fun res!842276 () Bool)

(assert (=> d!138797 (=> (not res!842276) (not e!720265))))

(declare-fun lt!573942 () ListLongMap!18983)

(assert (=> d!138797 (= res!842276 (contains!7628 lt!573942 (_1!10566 (tuple2!21111 a1!67 b1!78))))))

(declare-fun lt!573944 () List!28288)

(assert (=> d!138797 (= lt!573942 (ListLongMap!18984 lt!573944))))

(declare-fun lt!573941 () Unit!42162)

(declare-fun lt!573943 () Unit!42162)

(assert (=> d!138797 (= lt!573941 lt!573943)))

(declare-datatypes ((Option!729 0))(
  ( (Some!728 (v!19006 B!1922)) (None!727) )
))
(declare-fun getValueByKey!677 (List!28288 (_ BitVec 64)) Option!729)

(assert (=> d!138797 (= (getValueByKey!677 lt!573944 (_1!10566 (tuple2!21111 a1!67 b1!78))) (Some!728 (_2!10566 (tuple2!21111 a1!67 b1!78))))))

(declare-fun lemmaContainsTupThenGetReturnValue!339 (List!28288 (_ BitVec 64) B!1922) Unit!42162)

(assert (=> d!138797 (= lt!573943 (lemmaContainsTupThenGetReturnValue!339 lt!573944 (_1!10566 (tuple2!21111 a1!67 b1!78)) (_2!10566 (tuple2!21111 a1!67 b1!78))))))

(assert (=> d!138797 (= lt!573944 (insertStrictlySorted!453 (toList!9507 lm!212) (_1!10566 (tuple2!21111 a1!67 b1!78)) (_2!10566 (tuple2!21111 a1!67 b1!78))))))

(assert (=> d!138797 (= (+!4265 lm!212 (tuple2!21111 a1!67 b1!78)) lt!573942)))

(declare-fun b!1264792 () Bool)

(declare-fun res!842275 () Bool)

(assert (=> b!1264792 (=> (not res!842275) (not e!720265))))

(assert (=> b!1264792 (= res!842275 (= (getValueByKey!677 (toList!9507 lt!573942) (_1!10566 (tuple2!21111 a1!67 b1!78))) (Some!728 (_2!10566 (tuple2!21111 a1!67 b1!78)))))))

(declare-fun b!1264793 () Bool)

(declare-fun contains!7631 (List!28288 tuple2!21110) Bool)

(assert (=> b!1264793 (= e!720265 (contains!7631 (toList!9507 lt!573942) (tuple2!21111 a1!67 b1!78)))))

(assert (= (and d!138797 res!842276) b!1264792))

(assert (= (and b!1264792 res!842275) b!1264793))

(declare-fun m!1165271 () Bool)

(assert (=> d!138797 m!1165271))

(declare-fun m!1165273 () Bool)

(assert (=> d!138797 m!1165273))

(declare-fun m!1165275 () Bool)

(assert (=> d!138797 m!1165275))

(declare-fun m!1165277 () Bool)

(assert (=> d!138797 m!1165277))

(declare-fun m!1165279 () Bool)

(assert (=> b!1264792 m!1165279))

(declare-fun m!1165281 () Bool)

(assert (=> b!1264793 m!1165281))

(assert (=> b!1264692 d!138797))

(declare-fun d!138809 () Bool)

(declare-fun lt!573953 () ListLongMap!18983)

(assert (=> d!138809 (not (contains!7628 lt!573953 a1!67))))

(assert (=> d!138809 (= lt!573953 (ListLongMap!18984 (removeStrictlySorted!146 (toList!9507 (+!4265 lm!212 (tuple2!21111 a1!67 b1!78))) a1!67)))))

(assert (=> d!138809 (= (-!2152 (+!4265 lm!212 (tuple2!21111 a1!67 b1!78)) a1!67) lt!573953)))

(declare-fun bs!35791 () Bool)

(assert (= bs!35791 d!138809))

(declare-fun m!1165295 () Bool)

(assert (=> bs!35791 m!1165295))

(declare-fun m!1165297 () Bool)

(assert (=> bs!35791 m!1165297))

(assert (=> b!1264692 d!138809))

(declare-fun b!1264867 () Bool)

(declare-fun e!720306 () List!28288)

(declare-fun call!62349 () List!28288)

(assert (=> b!1264867 (= e!720306 call!62349)))

(declare-fun b!1264868 () Bool)

(declare-fun e!720308 () List!28288)

(declare-fun e!720307 () List!28288)

(assert (=> b!1264868 (= e!720308 e!720307)))

(declare-fun c!123201 () Bool)

(assert (=> b!1264868 (= c!123201 (and (is-Cons!28284 (toList!9507 lm!212)) (= (_1!10566 (h!29493 (toList!9507 lm!212))) a1!67)))))

(declare-fun b!1264869 () Bool)

(declare-fun call!62350 () List!28288)

(assert (=> b!1264869 (= e!720307 call!62350)))

(declare-fun b!1264870 () Bool)

(declare-fun res!842298 () Bool)

(declare-fun e!720305 () Bool)

(assert (=> b!1264870 (=> (not res!842298) (not e!720305))))

(declare-fun lt!573977 () List!28288)

(assert (=> b!1264870 (= res!842298 (containsKey!634 lt!573977 a1!67))))

(declare-fun c!123200 () Bool)

(declare-fun b!1264871 () Bool)

(declare-fun e!720304 () List!28288)

(assert (=> b!1264871 (= e!720304 (ite c!123201 (t!41809 (toList!9507 lm!212)) (ite c!123200 (Cons!28284 (h!29493 (toList!9507 lm!212)) (t!41809 (toList!9507 lm!212))) Nil!28285)))))

(declare-fun d!138813 () Bool)

(assert (=> d!138813 e!720305))

(declare-fun res!842299 () Bool)

(assert (=> d!138813 (=> (not res!842299) (not e!720305))))

(assert (=> d!138813 (= res!842299 (isStrictlySorted!775 lt!573977))))

(assert (=> d!138813 (= lt!573977 e!720308)))

(declare-fun c!123199 () Bool)

(assert (=> d!138813 (= c!123199 (and (is-Cons!28284 (toList!9507 lm!212)) (bvslt (_1!10566 (h!29493 (toList!9507 lm!212))) a1!67)))))

(assert (=> d!138813 (isStrictlySorted!775 (toList!9507 lm!212))))

(assert (=> d!138813 (= (insertStrictlySorted!453 (toList!9507 lm!212) a1!67 b1!78) lt!573977)))

(declare-fun b!1264872 () Bool)

(assert (=> b!1264872 (= e!720305 (contains!7631 lt!573977 (tuple2!21111 a1!67 b1!78)))))

(declare-fun bm!62345 () Bool)

(assert (=> bm!62345 (= call!62349 call!62350)))

(declare-fun b!1264873 () Bool)

(assert (=> b!1264873 (= e!720304 (insertStrictlySorted!453 (t!41809 (toList!9507 lm!212)) a1!67 b1!78))))

(declare-fun bm!62346 () Bool)

(declare-fun call!62348 () List!28288)

(assert (=> bm!62346 (= call!62350 call!62348)))

(declare-fun bm!62347 () Bool)

(assert (=> bm!62347 (= call!62348 ($colon$colon!632 e!720304 (ite c!123199 (h!29493 (toList!9507 lm!212)) (tuple2!21111 a1!67 b1!78))))))

(declare-fun c!123202 () Bool)

(assert (=> bm!62347 (= c!123202 c!123199)))

(declare-fun b!1264874 () Bool)

(assert (=> b!1264874 (= e!720306 call!62349)))

(declare-fun b!1264875 () Bool)

(assert (=> b!1264875 (= c!123200 (and (is-Cons!28284 (toList!9507 lm!212)) (bvsgt (_1!10566 (h!29493 (toList!9507 lm!212))) a1!67)))))

(assert (=> b!1264875 (= e!720307 e!720306)))

(declare-fun b!1264876 () Bool)

(assert (=> b!1264876 (= e!720308 call!62348)))

(assert (= (and d!138813 c!123199) b!1264876))

(assert (= (and d!138813 (not c!123199)) b!1264868))

(assert (= (and b!1264868 c!123201) b!1264869))

(assert (= (and b!1264868 (not c!123201)) b!1264875))

(assert (= (and b!1264875 c!123200) b!1264867))

(assert (= (and b!1264875 (not c!123200)) b!1264874))

(assert (= (or b!1264867 b!1264874) bm!62345))

(assert (= (or b!1264869 bm!62345) bm!62346))

(assert (= (or b!1264876 bm!62346) bm!62347))

(assert (= (and bm!62347 c!123202) b!1264873))

(assert (= (and bm!62347 (not c!123202)) b!1264871))

(assert (= (and d!138813 res!842299) b!1264870))

(assert (= (and b!1264870 res!842298) b!1264872))

(declare-fun m!1165339 () Bool)

(assert (=> b!1264870 m!1165339))

(declare-fun m!1165341 () Bool)

(assert (=> b!1264873 m!1165341))

(declare-fun m!1165343 () Bool)

(assert (=> bm!62347 m!1165343))

(declare-fun m!1165345 () Bool)

(assert (=> d!138813 m!1165345))

(assert (=> d!138813 m!1165189))

(declare-fun m!1165347 () Bool)

(assert (=> b!1264872 m!1165347))

(assert (=> b!1264692 d!138813))

(declare-fun d!138825 () Bool)

(declare-fun res!842310 () Bool)

(declare-fun e!720322 () Bool)

(assert (=> d!138825 (=> res!842310 e!720322)))

(assert (=> d!138825 (= res!842310 (and (is-Cons!28284 (toList!9507 lm!212)) (= (_1!10566 (h!29493 (toList!9507 lm!212))) a1!67)))))

(assert (=> d!138825 (= (containsKey!634 (toList!9507 lm!212) a1!67) e!720322)))

(declare-fun b!1264892 () Bool)

(declare-fun e!720323 () Bool)

(assert (=> b!1264892 (= e!720322 e!720323)))

(declare-fun res!842311 () Bool)

(assert (=> b!1264892 (=> (not res!842311) (not e!720323))))

(assert (=> b!1264892 (= res!842311 (and (or (not (is-Cons!28284 (toList!9507 lm!212))) (bvsle (_1!10566 (h!29493 (toList!9507 lm!212))) a1!67)) (is-Cons!28284 (toList!9507 lm!212)) (bvslt (_1!10566 (h!29493 (toList!9507 lm!212))) a1!67)))))

(declare-fun b!1264893 () Bool)

(assert (=> b!1264893 (= e!720323 (containsKey!634 (t!41809 (toList!9507 lm!212)) a1!67))))

(assert (= (and d!138825 (not res!842310)) b!1264892))

(assert (= (and b!1264892 res!842311) b!1264893))

(declare-fun m!1165351 () Bool)

(assert (=> b!1264893 m!1165351))

(assert (=> b!1264691 d!138825))

(declare-fun d!138827 () Bool)

(declare-fun e!720334 () Bool)

(assert (=> d!138827 e!720334))

(declare-fun res!842314 () Bool)

(assert (=> d!138827 (=> res!842314 e!720334)))

(declare-fun lt!573991 () Bool)

(assert (=> d!138827 (= res!842314 (not lt!573991))))

(declare-fun lt!573989 () Bool)

(assert (=> d!138827 (= lt!573991 lt!573989)))

(declare-fun lt!573990 () Unit!42162)

(declare-fun e!720335 () Unit!42162)

(assert (=> d!138827 (= lt!573990 e!720335)))

(declare-fun c!123211 () Bool)

(assert (=> d!138827 (= c!123211 lt!573989)))

(assert (=> d!138827 (= lt!573989 (containsKey!634 (toList!9507 lm!212) a1!67))))

(assert (=> d!138827 (= (contains!7628 lm!212 a1!67) lt!573991)))

(declare-fun b!1264912 () Bool)

(declare-fun lt!573992 () Unit!42162)

(assert (=> b!1264912 (= e!720335 lt!573992)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!445 (List!28288 (_ BitVec 64)) Unit!42162)

(assert (=> b!1264912 (= lt!573992 (lemmaContainsKeyImpliesGetValueByKeyDefined!445 (toList!9507 lm!212) a1!67))))

(declare-fun isDefined!484 (Option!729) Bool)

(assert (=> b!1264912 (isDefined!484 (getValueByKey!677 (toList!9507 lm!212) a1!67))))

(declare-fun b!1264913 () Bool)

(declare-fun Unit!42170 () Unit!42162)

(assert (=> b!1264913 (= e!720335 Unit!42170)))

(declare-fun b!1264914 () Bool)

(assert (=> b!1264914 (= e!720334 (isDefined!484 (getValueByKey!677 (toList!9507 lm!212) a1!67)))))

(assert (= (and d!138827 c!123211) b!1264912))

(assert (= (and d!138827 (not c!123211)) b!1264913))

(assert (= (and d!138827 (not res!842314)) b!1264914))

(assert (=> d!138827 m!1165173))

(declare-fun m!1165353 () Bool)

(assert (=> b!1264912 m!1165353))

(declare-fun m!1165355 () Bool)

(assert (=> b!1264912 m!1165355))

(assert (=> b!1264912 m!1165355))

(declare-fun m!1165357 () Bool)

(assert (=> b!1264912 m!1165357))

(assert (=> b!1264914 m!1165355))

(assert (=> b!1264914 m!1165355))

(assert (=> b!1264914 m!1165357))

(assert (=> start!106270 d!138827))

(declare-fun d!138829 () Bool)

(assert (=> d!138829 (= (inv!44088 lm!212) (isStrictlySorted!775 (toList!9507 lm!212)))))

(declare-fun bs!35794 () Bool)

(assert (= bs!35794 d!138829))

(assert (=> bs!35794 m!1165189))

(assert (=> start!106270 d!138829))

(declare-fun d!138831 () Bool)

(declare-fun res!842325 () Bool)

(declare-fun e!720349 () Bool)

(assert (=> d!138831 (=> res!842325 e!720349)))

(assert (=> d!138831 (= res!842325 (or (is-Nil!28285 (toList!9507 lm!212)) (is-Nil!28285 (t!41809 (toList!9507 lm!212)))))))

(assert (=> d!138831 (= (isStrictlySorted!775 (toList!9507 lm!212)) e!720349)))

(declare-fun b!1264937 () Bool)

(declare-fun e!720350 () Bool)

(assert (=> b!1264937 (= e!720349 e!720350)))

(declare-fun res!842326 () Bool)

(assert (=> b!1264937 (=> (not res!842326) (not e!720350))))

(assert (=> b!1264937 (= res!842326 (bvslt (_1!10566 (h!29493 (toList!9507 lm!212))) (_1!10566 (h!29493 (t!41809 (toList!9507 lm!212))))))))

(declare-fun b!1264938 () Bool)

(assert (=> b!1264938 (= e!720350 (isStrictlySorted!775 (t!41809 (toList!9507 lm!212))))))

(assert (= (and d!138831 (not res!842325)) b!1264937))

(assert (= (and b!1264937 res!842326) b!1264938))

(declare-fun m!1165367 () Bool)

(assert (=> b!1264938 m!1165367))

(assert (=> b!1264690 d!138831))

(declare-fun b!1264947 () Bool)

(declare-fun e!720355 () Bool)

(declare-fun tp!96253 () Bool)

(assert (=> b!1264947 (= e!720355 (and tp_is_empty!32455 tp!96253))))

(assert (=> b!1264693 (= tp!96239 e!720355)))

(assert (= (and b!1264693 (is-Cons!28284 (toList!9507 lm!212))) b!1264947))

(push 1)

