; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5258 () Bool)

(assert start!5258)

(assert (=> start!5258 true))

(assert (=> start!5258 true))

(declare-datatypes ((B!804 0))(
  ( (B!805 (val!902 Int)) )
))
(declare-datatypes ((tuple2!1464 0))(
  ( (tuple2!1465 (_1!743 (_ BitVec 64)) (_2!743 B!804)) )
))
(declare-datatypes ((List!1014 0))(
  ( (Nil!1011) (Cons!1010 (h!1578 tuple2!1464) (t!3847 List!1014)) )
))
(declare-datatypes ((ListLongMap!1041 0))(
  ( (ListLongMap!1042 (toList!536 List!1014)) )
))
(declare-fun lm!266 () ListLongMap!1041)

(declare-fun value!232 () B!804)

(declare-fun lambda!200 () Int)

(declare-datatypes ((List!1015 0))(
  ( (Nil!1012) (Cons!1011 (h!1579 (_ BitVec 64)) (t!3848 List!1015)) )
))
(declare-fun forall!181 (List!1015 Int) Bool)

(declare-fun getKeysOf!3 (List!1014 B!804) List!1015)

(assert (=> start!5258 (not (forall!181 (getKeysOf!3 (toList!536 lm!266) value!232) lambda!200))))

(declare-fun e!24208 () Bool)

(declare-fun inv!1717 (ListLongMap!1041) Bool)

(assert (=> start!5258 (and (inv!1717 lm!266) e!24208)))

(declare-fun tp_is_empty!1727 () Bool)

(assert (=> start!5258 tp_is_empty!1727))

(declare-fun b!38076 () Bool)

(declare-fun tp!5675 () Bool)

(assert (=> b!38076 (= e!24208 tp!5675)))

(assert (= start!5258 b!38076))

(declare-fun m!30739 () Bool)

(assert (=> start!5258 m!30739))

(assert (=> start!5258 m!30739))

(declare-fun m!30741 () Bool)

(assert (=> start!5258 m!30741))

(declare-fun m!30743 () Bool)

(assert (=> start!5258 m!30743))

(push 1)

(assert (not start!5258))

(assert (not b!38076))

(assert tp_is_empty!1727)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6169 () Bool)

(declare-fun res!22987 () Bool)

(declare-fun e!24221 () Bool)

(assert (=> d!6169 (=> res!22987 e!24221)))

(assert (=> d!6169 (= res!22987 (is-Nil!1012 (getKeysOf!3 (toList!536 lm!266) value!232)))))

(assert (=> d!6169 (= (forall!181 (getKeysOf!3 (toList!536 lm!266) value!232) lambda!200) e!24221)))

(declare-fun b!38093 () Bool)

(declare-fun e!24222 () Bool)

(assert (=> b!38093 (= e!24221 e!24222)))

(declare-fun res!22988 () Bool)

(assert (=> b!38093 (=> (not res!22988) (not e!24222))))

(declare-fun dynLambda!183 (Int (_ BitVec 64)) Bool)

(assert (=> b!38093 (= res!22988 (dynLambda!183 lambda!200 (h!1579 (getKeysOf!3 (toList!536 lm!266) value!232))))))

(declare-fun b!38094 () Bool)

(assert (=> b!38094 (= e!24222 (forall!181 (t!3848 (getKeysOf!3 (toList!536 lm!266) value!232)) lambda!200))))

(assert (= (and d!6169 (not res!22987)) b!38093))

(assert (= (and b!38093 res!22988) b!38094))

(declare-fun b_lambda!1998 () Bool)

(assert (=> (not b_lambda!1998) (not b!38093)))

(declare-fun m!30746 () Bool)

(assert (=> b!38093 m!30746))

(declare-fun m!30750 () Bool)

(assert (=> b!38094 m!30750))

(assert (=> start!5258 d!6169))

(declare-fun bs!1525 () Bool)

(declare-fun b!38159 () Bool)

(assert (= bs!1525 (and b!38159 start!5258)))

(declare-fun lt!14066 () tuple2!1464)

(declare-fun lambda!221 () Int)

(declare-fun lt!14068 () List!1014)

(assert (=> bs!1525 (= (= (Cons!1010 lt!14066 lt!14068) (toList!536 lm!266)) (= lambda!221 lambda!200))))

(assert (=> b!38159 true))

(assert (=> b!38159 true))

(assert (=> b!38159 true))

(declare-fun bs!1529 () Bool)

(declare-fun b!38162 () Bool)

(assert (= bs!1529 (and b!38162 start!5258)))

(declare-fun lt!14075 () List!1014)

(declare-fun lambda!223 () Int)

(declare-fun lt!14067 () tuple2!1464)

(assert (=> bs!1529 (= (= (Cons!1010 lt!14067 lt!14075) (toList!536 lm!266)) (= lambda!223 lambda!200))))

(declare-fun bs!1532 () Bool)

(assert (= bs!1532 (and b!38162 b!38159)))

(assert (=> bs!1532 (= (= (Cons!1010 lt!14067 lt!14075) (Cons!1010 lt!14066 lt!14068)) (= lambda!223 lambda!221))))

(assert (=> b!38162 true))

(assert (=> b!38162 true))

(assert (=> b!38162 true))

(declare-fun bs!1536 () Bool)

(declare-fun d!6177 () Bool)

(assert (= bs!1536 (and d!6177 start!5258)))

(declare-fun lambda!225 () Int)

(assert (=> bs!1536 (= lambda!225 lambda!200)))

(declare-fun bs!1539 () Bool)

(assert (= bs!1539 (and d!6177 b!38159)))

(assert (=> bs!1539 (= (= (toList!536 lm!266) (Cons!1010 lt!14066 lt!14068)) (= lambda!225 lambda!221))))

(declare-fun bs!1542 () Bool)

(assert (= bs!1542 (and d!6177 b!38162)))

(assert (=> bs!1542 (= (= (toList!536 lm!266) (Cons!1010 lt!14067 lt!14075)) (= lambda!225 lambda!223))))

(assert (=> d!6177 true))

(assert (=> d!6177 true))

(declare-fun b!38155 () Bool)

(declare-datatypes ((Unit!893 0))(
  ( (Unit!894) )
))
(declare-fun e!24256 () Unit!893)

(declare-fun Unit!895 () Unit!893)

(assert (=> b!38155 (= e!24256 Unit!895)))

(declare-fun b!38156 () Bool)

(declare-fun lt!14064 () Unit!893)

(assert (=> b!38156 (= lt!14064 e!24256)))

(declare-fun c!4406 () Bool)

(declare-fun call!2895 () Bool)

(assert (=> b!38156 (= c!4406 (not call!2895))))

(declare-fun lt!14070 () List!1015)

(declare-fun call!2893 () List!1015)

(assert (=> b!38156 (= lt!14070 call!2893)))

(declare-fun e!24258 () List!1015)

(assert (=> b!38156 (= e!24258 call!2893)))

(declare-fun b!38157 () Bool)

(declare-fun e!24257 () List!1015)

(assert (=> b!38157 (= e!24257 (Cons!1011 (_1!743 (h!1578 (toList!536 lm!266))) call!2893))))

(declare-fun c!4407 () Bool)

(assert (=> b!38157 (= c!4407 (not call!2895))))

(declare-fun lt!14071 () Unit!893)

(declare-fun e!24255 () Unit!893)

(assert (=> b!38157 (= lt!14071 e!24255)))

(declare-fun bm!2890 () Bool)

(declare-fun isEmpty!225 (List!1015) Bool)

(assert (=> bm!2890 (= call!2895 (isEmpty!225 call!2893))))

(declare-fun b!38158 () Bool)

(assert (=> b!38158 (= e!24258 Nil!1012)))

(declare-fun call!2896 () Bool)

(assert (=> b!38159 call!2896))

(declare-fun lt!14072 () Unit!893)

(declare-fun call!2894 () Unit!893)

(assert (=> b!38159 (= lt!14072 call!2894)))

(assert (=> b!38159 (= lt!14066 (h!1578 (toList!536 lm!266)))))

(declare-fun lt!14063 () List!1015)

(assert (=> b!38159 (= lt!14063 call!2893)))

(assert (=> b!38159 (= lt!14068 (t!3847 (toList!536 lm!266)))))

(assert (=> b!38159 (= e!24255 lt!14072)))

(declare-fun bm!2891 () Bool)

(assert (=> bm!2891 (= call!2893 (getKeysOf!3 (t!3847 (toList!536 lm!266)) value!232))))

(declare-fun c!4408 () Bool)

(declare-fun bm!2892 () Bool)

(declare-fun lt!14069 () List!1015)

(assert (=> bm!2892 (= call!2896 (forall!181 (ite c!4408 lt!14063 lt!14069) (ite c!4408 lambda!221 lambda!223)))))

(declare-fun lt!14073 () List!1015)

(assert (=> d!6177 (forall!181 lt!14073 lambda!225)))

(assert (=> d!6177 (= lt!14073 e!24257)))

(assert (=> d!6177 (= c!4408 (and (is-Cons!1010 (toList!536 lm!266)) (= (_2!743 (h!1578 (toList!536 lm!266))) value!232)))))

(declare-fun isStrictlySorted!208 (List!1014) Bool)

(assert (=> d!6177 (isStrictlySorted!208 (toList!536 lm!266))))

(assert (=> d!6177 (= (getKeysOf!3 (toList!536 lm!266) value!232) lt!14073)))

(declare-fun bm!2893 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!3 (List!1014 List!1015 B!804 tuple2!1464) Unit!893)

(assert (=> bm!2893 (= call!2894 (lemmaForallGetValueByKeySameWithASmallerHead!3 (ite c!4408 lt!14068 lt!14075) (ite c!4408 lt!14063 lt!14069) value!232 (ite c!4408 lt!14066 lt!14067)))))

(declare-fun b!38160 () Bool)

(assert (=> b!38160 (= e!24257 e!24258)))

(declare-fun c!4405 () Bool)

(assert (=> b!38160 (= c!4405 (and (is-Cons!1010 (toList!536 lm!266)) (not (= (_2!743 (h!1578 (toList!536 lm!266))) value!232))))))

(declare-fun b!38161 () Bool)

(declare-fun Unit!898 () Unit!893)

(assert (=> b!38161 (= e!24255 Unit!898)))

(declare-fun lt!14074 () Unit!893)

(assert (=> b!38162 (= e!24256 lt!14074)))

(assert (=> b!38162 (= lt!14075 (t!3847 (toList!536 lm!266)))))

(assert (=> b!38162 (= lt!14069 call!2893)))

(assert (=> b!38162 (= lt!14067 (h!1578 (toList!536 lm!266)))))

(assert (=> b!38162 (= lt!14074 call!2894)))

(assert (=> b!38162 call!2896))

(assert (= (and d!6177 c!4408) b!38157))

(assert (= (and d!6177 (not c!4408)) b!38160))

(assert (= (and b!38157 c!4407) b!38159))

(assert (= (and b!38157 (not c!4407)) b!38161))

