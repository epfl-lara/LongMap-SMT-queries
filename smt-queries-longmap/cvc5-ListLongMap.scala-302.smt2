; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5254 () Bool)

(assert start!5254)

(assert (=> start!5254 true))

(assert (=> start!5254 true))

(declare-datatypes ((B!800 0))(
  ( (B!801 (val!900 Int)) )
))
(declare-datatypes ((tuple2!1460 0))(
  ( (tuple2!1461 (_1!741 (_ BitVec 64)) (_2!741 B!800)) )
))
(declare-datatypes ((List!1010 0))(
  ( (Nil!1007) (Cons!1006 (h!1574 tuple2!1460) (t!3843 List!1010)) )
))
(declare-datatypes ((ListLongMap!1037 0))(
  ( (ListLongMap!1038 (toList!534 List!1010)) )
))
(declare-fun lm!266 () ListLongMap!1037)

(declare-fun value!232 () B!800)

(declare-fun lambda!194 () Int)

(declare-datatypes ((List!1011 0))(
  ( (Nil!1008) (Cons!1007 (h!1575 (_ BitVec 64)) (t!3844 List!1011)) )
))
(declare-fun forall!179 (List!1011 Int) Bool)

(declare-fun getKeysOf!1 (List!1010 B!800) List!1011)

(assert (=> start!5254 (not (forall!179 (getKeysOf!1 (toList!534 lm!266) value!232) lambda!194))))

(declare-fun e!24202 () Bool)

(declare-fun inv!1715 (ListLongMap!1037) Bool)

(assert (=> start!5254 (and (inv!1715 lm!266) e!24202)))

(declare-fun tp_is_empty!1723 () Bool)

(assert (=> start!5254 tp_is_empty!1723))

(declare-fun b!38062 () Bool)

(declare-fun tp!5669 () Bool)

(assert (=> b!38062 (= e!24202 tp!5669)))

(assert (= start!5254 b!38062))

(declare-fun m!30727 () Bool)

(assert (=> start!5254 m!30727))

(assert (=> start!5254 m!30727))

(declare-fun m!30729 () Bool)

(assert (=> start!5254 m!30729))

(declare-fun m!30731 () Bool)

(assert (=> start!5254 m!30731))

(push 1)

(assert (not start!5254))

(assert (not b!38062))

(assert tp_is_empty!1723)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6171 () Bool)

(declare-fun res!22989 () Bool)

(declare-fun e!24223 () Bool)

(assert (=> d!6171 (=> res!22989 e!24223)))

(assert (=> d!6171 (= res!22989 (is-Nil!1008 (getKeysOf!1 (toList!534 lm!266) value!232)))))

(assert (=> d!6171 (= (forall!179 (getKeysOf!1 (toList!534 lm!266) value!232) lambda!194) e!24223)))

(declare-fun b!38095 () Bool)

(declare-fun e!24224 () Bool)

(assert (=> b!38095 (= e!24223 e!24224)))

(declare-fun res!22990 () Bool)

(assert (=> b!38095 (=> (not res!22990) (not e!24224))))

(declare-fun dynLambda!181 (Int (_ BitVec 64)) Bool)

(assert (=> b!38095 (= res!22990 (dynLambda!181 lambda!194 (h!1575 (getKeysOf!1 (toList!534 lm!266) value!232))))))

(declare-fun b!38096 () Bool)

(assert (=> b!38096 (= e!24224 (forall!179 (t!3844 (getKeysOf!1 (toList!534 lm!266) value!232)) lambda!194))))

(assert (= (and d!6171 (not res!22989)) b!38095))

(assert (= (and b!38095 res!22990) b!38096))

(declare-fun b_lambda!1999 () Bool)

(assert (=> (not b_lambda!1999) (not b!38095)))

(declare-fun m!30747 () Bool)

(assert (=> b!38095 m!30747))

(declare-fun m!30751 () Bool)

(assert (=> b!38096 m!30751))

(assert (=> start!5254 d!6171))

(declare-fun bs!1526 () Bool)

(declare-fun b!38165 () Bool)

(assert (= bs!1526 (and b!38165 start!5254)))

(declare-fun lt!14087 () tuple2!1460)

(declare-fun lt!14078 () List!1010)

(declare-fun lambda!220 () Int)

(assert (=> bs!1526 (= (= (Cons!1006 lt!14087 lt!14078) (toList!534 lm!266)) (= lambda!220 lambda!194))))

(assert (=> b!38165 true))

(assert (=> b!38165 true))

(assert (=> b!38165 true))

(declare-fun bs!1528 () Bool)

(declare-fun b!38169 () Bool)

(assert (= bs!1528 (and b!38169 start!5254)))

(declare-fun lt!14083 () tuple2!1460)

(declare-fun lt!14085 () List!1010)

(declare-fun lambda!222 () Int)

(assert (=> bs!1528 (= (= (Cons!1006 lt!14083 lt!14085) (toList!534 lm!266)) (= lambda!222 lambda!194))))

(declare-fun bs!1531 () Bool)

(assert (= bs!1531 (and b!38169 b!38165)))

(assert (=> bs!1531 (= (= (Cons!1006 lt!14083 lt!14085) (Cons!1006 lt!14087 lt!14078)) (= lambda!222 lambda!220))))

(assert (=> b!38169 true))

(assert (=> b!38169 true))

(assert (=> b!38169 true))

(declare-fun bs!1534 () Bool)

(declare-fun d!6176 () Bool)

(assert (= bs!1534 (and d!6176 start!5254)))

(declare-fun lambda!226 () Int)

(assert (=> bs!1534 (= lambda!226 lambda!194)))

(declare-fun bs!1538 () Bool)

(assert (= bs!1538 (and d!6176 b!38165)))

(assert (=> bs!1538 (= (= (toList!534 lm!266) (Cons!1006 lt!14087 lt!14078)) (= lambda!226 lambda!220))))

(declare-fun bs!1541 () Bool)

(assert (= bs!1541 (and d!6176 b!38169)))

(assert (=> bs!1541 (= (= (toList!534 lm!266) (Cons!1006 lt!14083 lt!14085)) (= lambda!226 lambda!222))))

(assert (=> d!6176 true))

(assert (=> d!6176 true))

(declare-fun b!38163 () Bool)

(declare-fun e!24259 () List!1011)

(declare-fun call!2900 () List!1011)

(assert (=> b!38163 (= e!24259 (Cons!1007 (_1!741 (h!1574 (toList!534 lm!266))) call!2900))))

(declare-fun c!4410 () Bool)

(declare-fun call!2898 () Bool)

(assert (=> b!38163 (= c!4410 (not call!2898))))

(declare-datatypes ((Unit!889 0))(
  ( (Unit!890) )
))
(declare-fun lt!14082 () Unit!889)

(declare-fun e!24260 () Unit!889)

(assert (=> b!38163 (= lt!14082 e!24260)))

(declare-fun b!38164 () Bool)

(declare-fun e!24261 () Unit!889)

(declare-fun Unit!891 () Unit!889)

(assert (=> b!38164 (= e!24261 Unit!891)))

(declare-fun call!2899 () Bool)

(assert (=> b!38165 call!2899))

(declare-fun lt!14080 () Unit!889)

(declare-fun call!2897 () Unit!889)

(assert (=> b!38165 (= lt!14080 call!2897)))

(assert (=> b!38165 (= lt!14087 (h!1574 (toList!534 lm!266)))))

(declare-fun lt!14077 () List!1011)

(assert (=> b!38165 (= lt!14077 call!2900)))

(assert (=> b!38165 (= lt!14078 (t!3843 (toList!534 lm!266)))))

(assert (=> b!38165 (= e!24260 lt!14080)))

(declare-fun lt!14086 () List!1011)

(assert (=> d!6176 (forall!179 lt!14086 lambda!226)))

(assert (=> d!6176 (= lt!14086 e!24259)))

(declare-fun c!4409 () Bool)

(assert (=> d!6176 (= c!4409 (and (is-Cons!1006 (toList!534 lm!266)) (= (_2!741 (h!1574 (toList!534 lm!266))) value!232)))))

(declare-fun isStrictlySorted!206 (List!1010) Bool)

(assert (=> d!6176 (isStrictlySorted!206 (toList!534 lm!266))))

(assert (=> d!6176 (= (getKeysOf!1 (toList!534 lm!266) value!232) lt!14086)))

(declare-fun b!38166 () Bool)

(declare-fun e!24262 () List!1011)

(assert (=> b!38166 (= e!24262 Nil!1008)))

(declare-fun b!38167 () Bool)

(assert (=> b!38167 (= e!24259 e!24262)))

(declare-fun c!4411 () Bool)

(assert (=> b!38167 (= c!4411 (and (is-Cons!1006 (toList!534 lm!266)) (not (= (_2!741 (h!1574 (toList!534 lm!266))) value!232))))))

(declare-fun b!38168 () Bool)

(declare-fun Unit!897 () Unit!889)

(assert (=> b!38168 (= e!24260 Unit!897)))

(declare-fun lt!14084 () Unit!889)

(assert (=> b!38169 (= e!24261 lt!14084)))

(assert (=> b!38169 (= lt!14085 (t!3843 (toList!534 lm!266)))))

(declare-fun lt!14076 () List!1011)

(assert (=> b!38169 (= lt!14076 call!2900)))

(assert (=> b!38169 (= lt!14083 (h!1574 (toList!534 lm!266)))))

(assert (=> b!38169 (= lt!14084 call!2897)))

(assert (=> b!38169 call!2899))

(declare-fun bm!2894 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!2 (List!1010 List!1011 B!800 tuple2!1460) Unit!889)

(assert (=> bm!2894 (= call!2897 (lemmaForallGetValueByKeySameWithASmallerHead!2 (ite c!4409 lt!14078 lt!14085) (ite c!4409 lt!14077 lt!14076) value!232 (ite c!4409 lt!14087 lt!14083)))))

(declare-fun b!38170 () Bool)

(declare-fun lt!14081 () Unit!889)

(assert (=> b!38170 (= lt!14081 e!24261)))

(declare-fun c!4412 () Bool)

(assert (=> b!38170 (= c!4412 (not call!2898))))

(declare-fun lt!14079 () List!1011)

(assert (=> b!38170 (= lt!14079 call!2900)))

(assert (=> b!38170 (= e!24262 call!2900)))

(declare-fun bm!2895 () Bool)

(assert (=> bm!2895 (= call!2899 (forall!179 (ite c!4409 lt!14077 lt!14076) (ite c!4409 lambda!220 lambda!222)))))

(declare-fun bm!2896 () Bool)

(declare-fun isEmpty!226 (List!1011) Bool)

(assert (=> bm!2896 (= call!2898 (isEmpty!226 call!2900))))

(declare-fun bm!2897 () Bool)

(assert (=> bm!2897 (= call!2900 (getKeysOf!1 (t!3843 (toList!534 lm!266)) value!232))))

(assert (= (and d!6176 c!4409) b!38163))

(assert (= (and d!6176 (not c!4409)) b!38167))

(assert (= (and b!38163 c!4410) b!38165))

(assert (= (and b!38163 (not c!4410)) b!38168))

(assert (= (and b!38167 c!4411) b!38170))

(assert (= (and b!38167 (not c!4411)) b!38166))

(assert (= (and b!38170 c!4412) b!38169))

(assert (= (and b!38170 (not c!4412)) b!38164))

(assert (= (or b!38165 b!38169) bm!2895))

(assert (= (or b!38165 b!38169) bm!2894))

(assert (= (or b!38163 b!38165 b!38169 b!38170) bm!2897))

(assert (= (or b!38163 b!38170) bm!2896))

(declare-fun m!30761 () Bool)

(assert (=> bm!2895 m!30761))

(declare-fun m!30763 () Bool)

(assert (=> bm!2896 m!30763))

(declare-fun m!30771 () Bool)

(assert (=> bm!2894 m!30771))

(declare-fun m!30777 () Bool)

(assert (=> bm!2897 m!30777))

(declare-fun m!30785 () Bool)

(assert (=> d!6176 m!30785))

(declare-fun m!30789 () Bool)

(assert (=> d!6176 m!30789))

(assert (=> start!5254 d!6176))

(declare-fun d!6183 () Bool)

(assert (=> d!6183 (= (inv!1715 lm!266) (isStrictlySorted!206 (toList!534 lm!266)))))

(declare-fun bs!1545 () Bool)

(assert (= bs!1545 d!6183))

(assert (=> bs!1545 m!30789))

(assert (=> start!5254 d!6183))

(declare-fun b!38197 () Bool)

(declare-fun e!24269 () Bool)

(declare-fun tp!5684 () Bool)

(assert (=> b!38197 (= e!24269 (and tp_is_empty!1723 tp!5684))))

(assert (=> b!38062 (= tp!5669 e!24269)))

(assert (= (and b!38062 (is-Cons!1006 (toList!534 lm!266))) b!38197))

(declare-fun b_lambda!2006 () Bool)

(assert (= b_lambda!1999 (or start!5254 b_lambda!2006)))

(declare-fun bs!1548 () Bool)

(declare-fun d!6191 () Bool)

(assert (= bs!1548 (and d!6191 start!5254)))

(declare-datatypes ((Option!103 0))(
  ( (Some!102 (v!1977 B!800)) (None!101) )
))
(declare-fun getValueByKey!97 (List!1010 (_ BitVec 64)) Option!103)

(assert (=> bs!1548 (= (dynLambda!181 lambda!194 (h!1575 (getKeysOf!1 (toList!534 lm!266) value!232))) (= (getValueByKey!97 (toList!534 lm!266) (h!1575 (getKeysOf!1 (toList!534 lm!266) value!232))) (Some!102 value!232)))))

(declare-fun m!30797 () Bool)

(assert (=> bs!1548 m!30797))

(assert (=> b!38095 d!6191))

(push 1)

(assert (not b_lambda!2006))

(assert (not d!6183))

