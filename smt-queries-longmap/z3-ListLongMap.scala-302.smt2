; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5252 () Bool)

(assert start!5252)

(assert (=> start!5252 true))

(assert (=> start!5252 true))

(declare-datatypes ((B!800 0))(
  ( (B!801 (val!900 Int)) )
))
(declare-datatypes ((tuple2!1464 0))(
  ( (tuple2!1465 (_1!743 (_ BitVec 64)) (_2!743 B!800)) )
))
(declare-datatypes ((List!1003 0))(
  ( (Nil!1000) (Cons!999 (h!1567 tuple2!1464) (t!3835 List!1003)) )
))
(declare-datatypes ((ListLongMap!1029 0))(
  ( (ListLongMap!1030 (toList!530 List!1003)) )
))
(declare-fun lm!266 () ListLongMap!1029)

(declare-fun value!232 () B!800)

(declare-fun lambda!194 () Int)

(declare-datatypes ((List!1004 0))(
  ( (Nil!1001) (Cons!1000 (h!1568 (_ BitVec 64)) (t!3836 List!1004)) )
))
(declare-fun forall!179 (List!1004 Int) Bool)

(declare-fun getKeysOf!1 (List!1003 B!800) List!1004)

(assert (=> start!5252 (not (forall!179 (getKeysOf!1 (toList!530 lm!266) value!232) lambda!194))))

(declare-fun e!24174 () Bool)

(declare-fun inv!1715 (ListLongMap!1029) Bool)

(assert (=> start!5252 (and (inv!1715 lm!266) e!24174)))

(declare-fun tp_is_empty!1723 () Bool)

(assert (=> start!5252 tp_is_empty!1723))

(declare-fun b!38023 () Bool)

(declare-fun tp!5669 () Bool)

(assert (=> b!38023 (= e!24174 tp!5669)))

(assert (= start!5252 b!38023))

(declare-fun m!30683 () Bool)

(assert (=> start!5252 m!30683))

(assert (=> start!5252 m!30683))

(declare-fun m!30685 () Bool)

(assert (=> start!5252 m!30685))

(declare-fun m!30687 () Bool)

(assert (=> start!5252 m!30687))

(check-sat (not start!5252) (not b!38023) tp_is_empty!1723)
(check-sat)
(get-model)

(declare-fun d!6157 () Bool)

(declare-fun res!22972 () Bool)

(declare-fun e!24195 () Bool)

(assert (=> d!6157 (=> res!22972 e!24195)))

(get-info :version)

(assert (=> d!6157 (= res!22972 ((_ is Nil!1001) (getKeysOf!1 (toList!530 lm!266) value!232)))))

(assert (=> d!6157 (= (forall!179 (getKeysOf!1 (toList!530 lm!266) value!232) lambda!194) e!24195)))

(declare-fun b!38056 () Bool)

(declare-fun e!24196 () Bool)

(assert (=> b!38056 (= e!24195 e!24196)))

(declare-fun res!22973 () Bool)

(assert (=> b!38056 (=> (not res!22973) (not e!24196))))

(declare-fun dynLambda!180 (Int (_ BitVec 64)) Bool)

(assert (=> b!38056 (= res!22973 (dynLambda!180 lambda!194 (h!1568 (getKeysOf!1 (toList!530 lm!266) value!232))))))

(declare-fun b!38057 () Bool)

(assert (=> b!38057 (= e!24196 (forall!179 (t!3836 (getKeysOf!1 (toList!530 lm!266) value!232)) lambda!194))))

(assert (= (and d!6157 (not res!22972)) b!38056))

(assert (= (and b!38056 res!22973) b!38057))

(declare-fun b_lambda!2003 () Bool)

(assert (=> (not b_lambda!2003) (not b!38056)))

(declare-fun m!30705 () Bool)

(assert (=> b!38056 m!30705))

(declare-fun m!30707 () Bool)

(assert (=> b!38057 m!30707))

(assert (=> start!5252 d!6157))

(declare-fun bs!1525 () Bool)

(declare-fun b!38119 () Bool)

(assert (= bs!1525 (and b!38119 start!5252)))

(declare-fun lambda!218 () Int)

(declare-fun lt!14072 () List!1003)

(declare-fun lt!14060 () tuple2!1464)

(assert (=> bs!1525 (= (= (Cons!999 lt!14060 lt!14072) (toList!530 lm!266)) (= lambda!218 lambda!194))))

(assert (=> b!38119 true))

(assert (=> b!38119 true))

(assert (=> b!38119 true))

(declare-fun bs!1526 () Bool)

(declare-fun b!38112 () Bool)

(assert (= bs!1526 (and b!38112 start!5252)))

(declare-fun lambda!219 () Int)

(declare-fun lt!14067 () tuple2!1464)

(declare-fun lt!14058 () List!1003)

(assert (=> bs!1526 (= (= (Cons!999 lt!14067 lt!14058) (toList!530 lm!266)) (= lambda!219 lambda!194))))

(declare-fun bs!1528 () Bool)

(assert (= bs!1528 (and b!38112 b!38119)))

(assert (=> bs!1528 (= (= (Cons!999 lt!14067 lt!14058) (Cons!999 lt!14060 lt!14072)) (= lambda!219 lambda!218))))

(assert (=> b!38112 true))

(assert (=> b!38112 true))

(assert (=> b!38112 true))

(declare-fun bs!1530 () Bool)

(declare-fun d!6161 () Bool)

(assert (= bs!1530 (and d!6161 start!5252)))

(declare-fun lambda!221 () Int)

(assert (=> bs!1530 (= lambda!221 lambda!194)))

(declare-fun bs!1532 () Bool)

(assert (= bs!1532 (and d!6161 b!38119)))

(assert (=> bs!1532 (= (= (toList!530 lm!266) (Cons!999 lt!14060 lt!14072)) (= lambda!221 lambda!218))))

(declare-fun bs!1534 () Bool)

(assert (= bs!1534 (and d!6161 b!38112)))

(assert (=> bs!1534 (= (= (toList!530 lm!266) (Cons!999 lt!14067 lt!14058)) (= lambda!221 lambda!219))))

(assert (=> d!6161 true))

(assert (=> d!6161 true))

(declare-fun b!38108 () Bool)

(declare-datatypes ((Unit!890 0))(
  ( (Unit!891) )
))
(declare-fun e!24227 () Unit!890)

(declare-fun Unit!892 () Unit!890)

(assert (=> b!38108 (= e!24227 Unit!892)))

(declare-fun lt!14065 () List!1004)

(declare-fun bm!2879 () Bool)

(declare-fun call!2882 () Unit!890)

(declare-fun c!4392 () Bool)

(declare-fun lt!14069 () List!1004)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!1 (List!1003 List!1004 B!800 tuple2!1464) Unit!890)

(assert (=> bm!2879 (= call!2882 (lemmaForallGetValueByKeySameWithASmallerHead!1 (ite c!4392 lt!14072 lt!14058) (ite c!4392 lt!14065 lt!14069) value!232 (ite c!4392 lt!14060 lt!14067)))))

(declare-fun b!38110 () Bool)

(declare-fun e!24230 () List!1004)

(declare-fun call!2886 () List!1004)

(assert (=> b!38110 (= e!24230 (Cons!1000 (_1!743 (h!1567 (toList!530 lm!266))) call!2886))))

(declare-fun c!4391 () Bool)

(declare-fun call!2888 () Bool)

(assert (=> b!38110 (= c!4391 (not call!2888))))

(declare-fun lt!14050 () Unit!890)

(declare-fun e!24223 () Unit!890)

(assert (=> b!38110 (= lt!14050 e!24223)))

(declare-fun lt!14052 () Unit!890)

(assert (=> b!38112 (= e!24227 lt!14052)))

(assert (=> b!38112 (= lt!14058 (t!3835 (toList!530 lm!266)))))

(assert (=> b!38112 (= lt!14069 call!2886)))

(assert (=> b!38112 (= lt!14067 (h!1567 (toList!530 lm!266)))))

(assert (=> b!38112 (= lt!14052 call!2882)))

(declare-fun call!2881 () Bool)

(assert (=> b!38112 call!2881))

(declare-fun bm!2881 () Bool)

(assert (=> bm!2881 (= call!2886 (getKeysOf!1 (t!3835 (toList!530 lm!266)) value!232))))

(declare-fun b!38115 () Bool)

(declare-fun Unit!893 () Unit!890)

(assert (=> b!38115 (= e!24223 Unit!893)))

(declare-fun bm!2882 () Bool)

(declare-fun isEmpty!226 (List!1004) Bool)

(assert (=> bm!2882 (= call!2888 (isEmpty!226 call!2886))))

(declare-fun lt!14064 () List!1004)

(assert (=> d!6161 (forall!179 lt!14064 lambda!221)))

(assert (=> d!6161 (= lt!14064 e!24230)))

(assert (=> d!6161 (= c!4392 (and ((_ is Cons!999) (toList!530 lm!266)) (= (_2!743 (h!1567 (toList!530 lm!266))) value!232)))))

(declare-fun isStrictlySorted!200 (List!1003) Bool)

(assert (=> d!6161 (isStrictlySorted!200 (toList!530 lm!266))))

(assert (=> d!6161 (= (getKeysOf!1 (toList!530 lm!266) value!232) lt!14064)))

(declare-fun b!38117 () Bool)

(declare-fun lt!14061 () Unit!890)

(assert (=> b!38117 (= lt!14061 e!24227)))

(declare-fun c!4395 () Bool)

(assert (=> b!38117 (= c!4395 (not call!2888))))

(declare-fun lt!14055 () List!1004)

(assert (=> b!38117 (= lt!14055 call!2886)))

(declare-fun e!24225 () List!1004)

(assert (=> b!38117 (= e!24225 call!2886)))

(assert (=> b!38119 call!2881))

(declare-fun lt!14071 () Unit!890)

(assert (=> b!38119 (= lt!14071 call!2882)))

(assert (=> b!38119 (= lt!14060 (h!1567 (toList!530 lm!266)))))

(assert (=> b!38119 (= lt!14065 call!2886)))

(assert (=> b!38119 (= lt!14072 (t!3835 (toList!530 lm!266)))))

(assert (=> b!38119 (= e!24223 lt!14071)))

(declare-fun b!38120 () Bool)

(assert (=> b!38120 (= e!24225 Nil!1001)))

(declare-fun bm!2885 () Bool)

(assert (=> bm!2885 (= call!2881 (forall!179 (ite c!4392 lt!14065 lt!14069) (ite c!4392 lambda!218 lambda!219)))))

(declare-fun b!38123 () Bool)

(assert (=> b!38123 (= e!24230 e!24225)))

(declare-fun c!4397 () Bool)

(assert (=> b!38123 (= c!4397 (and ((_ is Cons!999) (toList!530 lm!266)) (not (= (_2!743 (h!1567 (toList!530 lm!266))) value!232))))))

(assert (= (and d!6161 c!4392) b!38110))

(assert (= (and d!6161 (not c!4392)) b!38123))

(assert (= (and b!38110 c!4391) b!38119))

(assert (= (and b!38110 (not c!4391)) b!38115))

(assert (= (and b!38123 c!4397) b!38117))

(assert (= (and b!38123 (not c!4397)) b!38120))

(assert (= (and b!38117 c!4395) b!38112))

(assert (= (and b!38117 (not c!4395)) b!38108))

(assert (= (or b!38119 b!38112) bm!2885))

(assert (= (or b!38119 b!38112) bm!2879))

(assert (= (or b!38110 b!38119 b!38112 b!38117) bm!2881))

(assert (= (or b!38110 b!38117) bm!2882))

(declare-fun m!30713 () Bool)

(assert (=> bm!2882 m!30713))

(declare-fun m!30717 () Bool)

(assert (=> bm!2885 m!30717))

(declare-fun m!30721 () Bool)

(assert (=> d!6161 m!30721))

(declare-fun m!30725 () Bool)

(assert (=> d!6161 m!30725))

(declare-fun m!30729 () Bool)

(assert (=> bm!2881 m!30729))

(declare-fun m!30735 () Bool)

(assert (=> bm!2879 m!30735))

(assert (=> start!5252 d!6161))

(declare-fun d!6166 () Bool)

(assert (=> d!6166 (= (inv!1715 lm!266) (isStrictlySorted!200 (toList!530 lm!266)))))

(declare-fun bs!1536 () Bool)

(assert (= bs!1536 d!6166))

(assert (=> bs!1536 m!30725))

(assert (=> start!5252 d!6166))

(declare-fun b!38140 () Bool)

(declare-fun e!24235 () Bool)

(declare-fun tp!5678 () Bool)

(assert (=> b!38140 (= e!24235 (and tp_is_empty!1723 tp!5678))))

(assert (=> b!38023 (= tp!5669 e!24235)))

(assert (= (and b!38023 ((_ is Cons!999) (toList!530 lm!266))) b!38140))

(declare-fun b_lambda!2007 () Bool)

(assert (= b_lambda!2003 (or start!5252 b_lambda!2007)))

(declare-fun bs!1538 () Bool)

(declare-fun d!6169 () Bool)

(assert (= bs!1538 (and d!6169 start!5252)))

(declare-datatypes ((Option!101 0))(
  ( (Some!100 (v!1975 B!800)) (None!99) )
))
(declare-fun getValueByKey!95 (List!1003 (_ BitVec 64)) Option!101)

(assert (=> bs!1538 (= (dynLambda!180 lambda!194 (h!1568 (getKeysOf!1 (toList!530 lm!266) value!232))) (= (getValueByKey!95 (toList!530 lm!266) (h!1568 (getKeysOf!1 (toList!530 lm!266) value!232))) (Some!100 value!232)))))

(declare-fun m!30737 () Bool)

(assert (=> bs!1538 m!30737))

(assert (=> b!38056 d!6169))

(check-sat (not bm!2881) tp_is_empty!1723 (not d!6166) (not d!6161) (not bm!2882) (not bm!2879) (not b!38057) (not bs!1538) (not b_lambda!2007) (not bm!2885) (not b!38140))
(check-sat)
