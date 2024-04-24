; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5258 () Bool)

(assert start!5258)

(assert (=> start!5258 true))

(assert (=> start!5258 true))

(declare-datatypes ((B!800 0))(
  ( (B!801 (val!900 Int)) )
))
(declare-datatypes ((tuple2!1442 0))(
  ( (tuple2!1443 (_1!732 (_ BitVec 64)) (_2!732 B!800)) )
))
(declare-datatypes ((List!996 0))(
  ( (Nil!993) (Cons!992 (h!1560 tuple2!1442) (t!3829 List!996)) )
))
(declare-datatypes ((ListLongMap!1013 0))(
  ( (ListLongMap!1014 (toList!522 List!996)) )
))
(declare-fun lm!266 () ListLongMap!1013)

(declare-fun value!232 () B!800)

(declare-fun lambda!194 () Int)

(declare-datatypes ((List!997 0))(
  ( (Nil!994) (Cons!993 (h!1561 (_ BitVec 64)) (t!3830 List!997)) )
))
(declare-fun forall!179 (List!997 Int) Bool)

(declare-fun getKeysOf!1 (List!996 B!800) List!997)

(assert (=> start!5258 (not (forall!179 (getKeysOf!1 (toList!522 lm!266) value!232) lambda!194))))

(declare-fun e!24165 () Bool)

(declare-fun inv!1715 (ListLongMap!1013) Bool)

(assert (=> start!5258 (and (inv!1715 lm!266) e!24165)))

(declare-fun tp_is_empty!1723 () Bool)

(assert (=> start!5258 tp_is_empty!1723))

(declare-fun b!38005 () Bool)

(declare-fun tp!5669 () Bool)

(assert (=> b!38005 (= e!24165 tp!5669)))

(assert (= start!5258 b!38005))

(declare-fun m!30601 () Bool)

(assert (=> start!5258 m!30601))

(assert (=> start!5258 m!30601))

(declare-fun m!30603 () Bool)

(assert (=> start!5258 m!30603))

(declare-fun m!30605 () Bool)

(assert (=> start!5258 m!30605))

(check-sat (not start!5258) (not b!38005) tp_is_empty!1723)
(check-sat)
(get-model)

(declare-fun d!6159 () Bool)

(declare-fun res!22966 () Bool)

(declare-fun e!24188 () Bool)

(assert (=> d!6159 (=> res!22966 e!24188)))

(get-info :version)

(assert (=> d!6159 (= res!22966 ((_ is Nil!994) (getKeysOf!1 (toList!522 lm!266) value!232)))))

(assert (=> d!6159 (= (forall!179 (getKeysOf!1 (toList!522 lm!266) value!232) lambda!194) e!24188)))

(declare-fun b!38040 () Bool)

(declare-fun e!24189 () Bool)

(assert (=> b!38040 (= e!24188 e!24189)))

(declare-fun res!22967 () Bool)

(assert (=> b!38040 (=> (not res!22967) (not e!24189))))

(declare-fun dynLambda!178 (Int (_ BitVec 64)) Bool)

(assert (=> b!38040 (= res!22967 (dynLambda!178 lambda!194 (h!1561 (getKeysOf!1 (toList!522 lm!266) value!232))))))

(declare-fun b!38041 () Bool)

(assert (=> b!38041 (= e!24189 (forall!179 (t!3830 (getKeysOf!1 (toList!522 lm!266) value!232)) lambda!194))))

(assert (= (and d!6159 (not res!22966)) b!38040))

(assert (= (and b!38040 res!22967) b!38041))

(declare-fun b_lambda!2001 () Bool)

(assert (=> (not b_lambda!2001) (not b!38040)))

(declare-fun m!30627 () Bool)

(assert (=> b!38040 m!30627))

(declare-fun m!30629 () Bool)

(assert (=> b!38041 m!30629))

(assert (=> start!5258 d!6159))

(declare-fun bs!1530 () Bool)

(declare-fun b!38108 () Bool)

(assert (= bs!1530 (and b!38108 start!5258)))

(declare-fun lambda!221 () Int)

(declare-fun lt!14023 () List!996)

(declare-fun lt!14021 () tuple2!1442)

(assert (=> bs!1530 (= (= (Cons!992 lt!14021 lt!14023) (toList!522 lm!266)) (= lambda!221 lambda!194))))

(assert (=> b!38108 true))

(assert (=> b!38108 true))

(assert (=> b!38108 true))

(declare-fun bs!1531 () Bool)

(declare-fun b!38102 () Bool)

(assert (= bs!1531 (and b!38102 start!5258)))

(declare-fun lt!14031 () List!996)

(declare-fun lt!14030 () tuple2!1442)

(declare-fun lambda!223 () Int)

(assert (=> bs!1531 (= (= (Cons!992 lt!14030 lt!14031) (toList!522 lm!266)) (= lambda!223 lambda!194))))

(declare-fun bs!1532 () Bool)

(assert (= bs!1532 (and b!38102 b!38108)))

(assert (=> bs!1532 (= (= (Cons!992 lt!14030 lt!14031) (Cons!992 lt!14021 lt!14023)) (= lambda!223 lambda!221))))

(assert (=> b!38102 true))

(assert (=> b!38102 true))

(assert (=> b!38102 true))

(declare-fun bs!1535 () Bool)

(declare-fun d!6165 () Bool)

(assert (= bs!1535 (and d!6165 start!5258)))

(declare-fun lambda!225 () Int)

(assert (=> bs!1535 (= lambda!225 lambda!194)))

(declare-fun bs!1536 () Bool)

(assert (= bs!1536 (and d!6165 b!38108)))

(assert (=> bs!1536 (= (= (toList!522 lm!266) (Cons!992 lt!14021 lt!14023)) (= lambda!225 lambda!221))))

(declare-fun bs!1538 () Bool)

(assert (= bs!1538 (and d!6165 b!38102)))

(assert (=> bs!1538 (= (= (toList!522 lm!266) (Cons!992 lt!14030 lt!14031)) (= lambda!225 lambda!223))))

(assert (=> d!6165 true))

(assert (=> d!6165 true))

(declare-datatypes ((Unit!895 0))(
  ( (Unit!896) )
))
(declare-fun e!24219 () Unit!895)

(declare-fun lt!14026 () Unit!895)

(assert (=> b!38102 (= e!24219 lt!14026)))

(assert (=> b!38102 (= lt!14031 (t!3829 (toList!522 lm!266)))))

(declare-fun lt!14029 () List!997)

(declare-fun call!2880 () List!997)

(assert (=> b!38102 (= lt!14029 call!2880)))

(assert (=> b!38102 (= lt!14030 (h!1560 (toList!522 lm!266)))))

(declare-fun call!2879 () Unit!895)

(assert (=> b!38102 (= lt!14026 call!2879)))

(declare-fun call!2882 () Bool)

(assert (=> b!38102 call!2882))

(declare-fun c!4389 () Bool)

(declare-fun lt!14022 () List!997)

(declare-fun bm!2876 () Bool)

(assert (=> bm!2876 (= call!2882 (forall!179 (ite c!4389 lt!14022 lt!14029) (ite c!4389 lambda!221 lambda!223)))))

(declare-fun b!38103 () Bool)

(declare-fun lt!14028 () Unit!895)

(assert (=> b!38103 (= lt!14028 e!24219)))

(declare-fun c!4390 () Bool)

(declare-fun call!2881 () Bool)

(assert (=> b!38103 (= c!4390 (not call!2881))))

(declare-fun lt!14024 () List!997)

(assert (=> b!38103 (= lt!14024 call!2880)))

(declare-fun e!24220 () List!997)

(assert (=> b!38103 (= e!24220 call!2880)))

(declare-fun b!38104 () Bool)

(declare-fun e!24218 () List!997)

(assert (=> b!38104 (= e!24218 e!24220)))

(declare-fun c!4392 () Bool)

(assert (=> b!38104 (= c!4392 (and ((_ is Cons!992) (toList!522 lm!266)) (not (= (_2!732 (h!1560 (toList!522 lm!266))) value!232))))))

(declare-fun lt!14025 () List!997)

(assert (=> d!6165 (forall!179 lt!14025 lambda!225)))

(assert (=> d!6165 (= lt!14025 e!24218)))

(assert (=> d!6165 (= c!4389 (and ((_ is Cons!992) (toList!522 lm!266)) (= (_2!732 (h!1560 (toList!522 lm!266))) value!232)))))

(declare-fun isStrictlySorted!194 (List!996) Bool)

(assert (=> d!6165 (isStrictlySorted!194 (toList!522 lm!266))))

(assert (=> d!6165 (= (getKeysOf!1 (toList!522 lm!266) value!232) lt!14025)))

(declare-fun b!38105 () Bool)

(declare-fun e!24221 () Unit!895)

(declare-fun Unit!900 () Unit!895)

(assert (=> b!38105 (= e!24221 Unit!900)))

(declare-fun bm!2877 () Bool)

(assert (=> bm!2877 (= call!2880 (getKeysOf!1 (t!3829 (toList!522 lm!266)) value!232))))

(declare-fun b!38106 () Bool)

(assert (=> b!38106 (= e!24218 (Cons!993 (_1!732 (h!1560 (toList!522 lm!266))) call!2880))))

(declare-fun c!4391 () Bool)

(assert (=> b!38106 (= c!4391 (not call!2881))))

(declare-fun lt!14032 () Unit!895)

(assert (=> b!38106 (= lt!14032 e!24221)))

(declare-fun bm!2878 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!3 (List!996 List!997 B!800 tuple2!1442) Unit!895)

(assert (=> bm!2878 (= call!2879 (lemmaForallGetValueByKeySameWithASmallerHead!3 (ite c!4389 lt!14023 lt!14031) (ite c!4389 lt!14022 lt!14029) value!232 (ite c!4389 lt!14021 lt!14030)))))

(declare-fun b!38107 () Bool)

(assert (=> b!38107 (= e!24220 Nil!994)))

(declare-fun bm!2879 () Bool)

(declare-fun isEmpty!228 (List!997) Bool)

(assert (=> bm!2879 (= call!2881 (isEmpty!228 call!2880))))

(assert (=> b!38108 call!2882))

(declare-fun lt!14027 () Unit!895)

(assert (=> b!38108 (= lt!14027 call!2879)))

(assert (=> b!38108 (= lt!14021 (h!1560 (toList!522 lm!266)))))

(assert (=> b!38108 (= lt!14022 call!2880)))

(assert (=> b!38108 (= lt!14023 (t!3829 (toList!522 lm!266)))))

(assert (=> b!38108 (= e!24221 lt!14027)))

(declare-fun b!38109 () Bool)

(declare-fun Unit!904 () Unit!895)

(assert (=> b!38109 (= e!24219 Unit!904)))

(assert (= (and d!6165 c!4389) b!38106))

(assert (= (and d!6165 (not c!4389)) b!38104))

(assert (= (and b!38106 c!4391) b!38108))

(assert (= (and b!38106 (not c!4391)) b!38105))

(assert (= (and b!38104 c!4392) b!38103))

(assert (= (and b!38104 (not c!4392)) b!38107))

(assert (= (and b!38103 c!4390) b!38102))

(assert (= (and b!38103 (not c!4390)) b!38109))

(assert (= (or b!38108 b!38102) bm!2876))

(assert (= (or b!38108 b!38102) bm!2878))

(assert (= (or b!38106 b!38108 b!38102 b!38103) bm!2877))

(assert (= (or b!38106 b!38103) bm!2879))

(declare-fun m!30645 () Bool)

(assert (=> d!6165 m!30645))

(declare-fun m!30647 () Bool)

(assert (=> d!6165 m!30647))

(declare-fun m!30649 () Bool)

(assert (=> bm!2876 m!30649))

(declare-fun m!30651 () Bool)

(assert (=> bm!2877 m!30651))

(declare-fun m!30653 () Bool)

(assert (=> bm!2878 m!30653))

(declare-fun m!30655 () Bool)

(assert (=> bm!2879 m!30655))

(assert (=> start!5258 d!6165))

(declare-fun d!6171 () Bool)

(assert (=> d!6171 (= (inv!1715 lm!266) (isStrictlySorted!194 (toList!522 lm!266)))))

(declare-fun bs!1544 () Bool)

(assert (= bs!1544 d!6171))

(assert (=> bs!1544 m!30647))

(assert (=> start!5258 d!6171))

(declare-fun b!38135 () Bool)

(declare-fun e!24231 () Bool)

(declare-fun tp!5681 () Bool)

(assert (=> b!38135 (= e!24231 (and tp_is_empty!1723 tp!5681))))

(assert (=> b!38005 (= tp!5669 e!24231)))

(assert (= (and b!38005 ((_ is Cons!992) (toList!522 lm!266))) b!38135))

(declare-fun b_lambda!2005 () Bool)

(assert (= b_lambda!2001 (or start!5258 b_lambda!2005)))

(declare-fun bs!1545 () Bool)

(declare-fun d!6173 () Bool)

(assert (= bs!1545 (and d!6173 start!5258)))

(declare-datatypes ((Option!103 0))(
  ( (Some!102 (v!1977 B!800)) (None!101) )
))
(declare-fun getValueByKey!97 (List!996 (_ BitVec 64)) Option!103)

(assert (=> bs!1545 (= (dynLambda!178 lambda!194 (h!1561 (getKeysOf!1 (toList!522 lm!266) value!232))) (= (getValueByKey!97 (toList!522 lm!266) (h!1561 (getKeysOf!1 (toList!522 lm!266) value!232))) (Some!102 value!232)))))

(declare-fun m!30669 () Bool)

(assert (=> bs!1545 m!30669))

(assert (=> b!38040 d!6173))

(check-sat (not bm!2876) (not b!38041) tp_is_empty!1723 (not bm!2877) (not bm!2879) (not b_lambda!2005) (not bm!2878) (not d!6171) (not d!6165) (not bs!1545) (not b!38135))
(check-sat)
