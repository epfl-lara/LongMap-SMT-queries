; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5256 () Bool)

(assert start!5256)

(assert (=> start!5256 true))

(assert (=> start!5256 true))

(declare-datatypes ((B!802 0))(
  ( (B!803 (val!901 Int)) )
))
(declare-datatypes ((tuple2!1462 0))(
  ( (tuple2!1463 (_1!742 (_ BitVec 64)) (_2!742 B!802)) )
))
(declare-datatypes ((List!1012 0))(
  ( (Nil!1009) (Cons!1008 (h!1576 tuple2!1462) (t!3845 List!1012)) )
))
(declare-datatypes ((ListLongMap!1039 0))(
  ( (ListLongMap!1040 (toList!535 List!1012)) )
))
(declare-fun lm!266 () ListLongMap!1039)

(declare-fun value!232 () B!802)

(declare-fun lambda!197 () Int)

(declare-datatypes ((List!1013 0))(
  ( (Nil!1010) (Cons!1009 (h!1577 (_ BitVec 64)) (t!3846 List!1013)) )
))
(declare-fun forall!180 (List!1013 Int) Bool)

(declare-fun getKeysOf!2 (List!1012 B!802) List!1013)

(assert (=> start!5256 (not (forall!180 (getKeysOf!2 (toList!535 lm!266) value!232) lambda!197))))

(declare-fun e!24205 () Bool)

(declare-fun inv!1716 (ListLongMap!1039) Bool)

(assert (=> start!5256 (and (inv!1716 lm!266) e!24205)))

(declare-fun tp_is_empty!1725 () Bool)

(assert (=> start!5256 tp_is_empty!1725))

(declare-fun b!38069 () Bool)

(declare-fun tp!5672 () Bool)

(assert (=> b!38069 (= e!24205 tp!5672)))

(assert (= start!5256 b!38069))

(declare-fun m!30733 () Bool)

(assert (=> start!5256 m!30733))

(assert (=> start!5256 m!30733))

(declare-fun m!30735 () Bool)

(assert (=> start!5256 m!30735))

(declare-fun m!30737 () Bool)

(assert (=> start!5256 m!30737))

(check-sat (not start!5256) (not b!38069) tp_is_empty!1725)
(check-sat)
(get-model)

(declare-fun d!6173 () Bool)

(declare-fun res!22991 () Bool)

(declare-fun e!24225 () Bool)

(assert (=> d!6173 (=> res!22991 e!24225)))

(get-info :version)

(assert (=> d!6173 (= res!22991 ((_ is Nil!1010) (getKeysOf!2 (toList!535 lm!266) value!232)))))

(assert (=> d!6173 (= (forall!180 (getKeysOf!2 (toList!535 lm!266) value!232) lambda!197) e!24225)))

(declare-fun b!38097 () Bool)

(declare-fun e!24226 () Bool)

(assert (=> b!38097 (= e!24225 e!24226)))

(declare-fun res!22992 () Bool)

(assert (=> b!38097 (=> (not res!22992) (not e!24226))))

(declare-fun dynLambda!182 (Int (_ BitVec 64)) Bool)

(assert (=> b!38097 (= res!22992 (dynLambda!182 lambda!197 (h!1577 (getKeysOf!2 (toList!535 lm!266) value!232))))))

(declare-fun b!38098 () Bool)

(assert (=> b!38098 (= e!24226 (forall!180 (t!3846 (getKeysOf!2 (toList!535 lm!266) value!232)) lambda!197))))

(assert (= (and d!6173 (not res!22991)) b!38097))

(assert (= (and b!38097 res!22992) b!38098))

(declare-fun b_lambda!2001 () Bool)

(assert (=> (not b_lambda!2001) (not b!38097)))

(declare-fun m!30753 () Bool)

(assert (=> b!38097 m!30753))

(declare-fun m!30755 () Bool)

(assert (=> b!38098 m!30755))

(assert (=> start!5256 d!6173))

(declare-fun bs!1527 () Bool)

(declare-fun b!38152 () Bool)

(assert (= bs!1527 (and b!38152 start!5256)))

(declare-fun lt!14062 () List!1012)

(declare-fun lt!14061 () tuple2!1462)

(declare-fun lambda!219 () Int)

(assert (=> bs!1527 (= (= (Cons!1008 lt!14061 lt!14062) (toList!535 lm!266)) (= lambda!219 lambda!197))))

(assert (=> b!38152 true))

(assert (=> b!38152 true))

(assert (=> b!38152 true))

(declare-fun bs!1530 () Bool)

(declare-fun b!38153 () Bool)

(assert (= bs!1530 (and b!38153 start!5256)))

(declare-fun lt!14065 () tuple2!1462)

(declare-fun lt!14052 () List!1012)

(declare-fun lambda!224 () Int)

(assert (=> bs!1530 (= (= (Cons!1008 lt!14065 lt!14052) (toList!535 lm!266)) (= lambda!224 lambda!197))))

(declare-fun bs!1533 () Bool)

(assert (= bs!1533 (and b!38153 b!38152)))

(assert (=> bs!1533 (= (= (Cons!1008 lt!14065 lt!14052) (Cons!1008 lt!14061 lt!14062)) (= lambda!224 lambda!219))))

(assert (=> b!38153 true))

(assert (=> b!38153 true))

(assert (=> b!38153 true))

(declare-fun bs!1535 () Bool)

(declare-fun d!6179 () Bool)

(assert (= bs!1535 (and d!6179 start!5256)))

(declare-fun lambda!227 () Int)

(assert (=> bs!1535 (= lambda!227 lambda!197)))

(declare-fun bs!1537 () Bool)

(assert (= bs!1537 (and d!6179 b!38152)))

(assert (=> bs!1537 (= (= (toList!535 lm!266) (Cons!1008 lt!14061 lt!14062)) (= lambda!227 lambda!219))))

(declare-fun bs!1540 () Bool)

(assert (= bs!1540 (and d!6179 b!38153)))

(assert (=> bs!1540 (= (= (toList!535 lm!266) (Cons!1008 lt!14065 lt!14052)) (= lambda!227 lambda!224))))

(assert (=> d!6179 true))

(assert (=> d!6179 true))

(declare-fun lt!14053 () List!1013)

(declare-fun call!2890 () Bool)

(declare-fun bm!2886 () Bool)

(declare-fun lt!14056 () List!1013)

(declare-fun c!4404 () Bool)

(assert (=> bm!2886 (= call!2890 (forall!180 (ite c!4404 lt!14056 lt!14053) (ite c!4404 lambda!219 lambda!224)))))

(declare-fun bm!2887 () Bool)

(declare-fun call!2892 () Bool)

(declare-fun call!2889 () List!1013)

(declare-fun isEmpty!224 (List!1013) Bool)

(assert (=> bm!2887 (= call!2892 (isEmpty!224 call!2889))))

(declare-fun b!38147 () Bool)

(declare-datatypes ((Unit!887 0))(
  ( (Unit!888) )
))
(declare-fun lt!14054 () Unit!887)

(declare-fun e!24252 () Unit!887)

(assert (=> b!38147 (= lt!14054 e!24252)))

(declare-fun c!4402 () Bool)

(assert (=> b!38147 (= c!4402 (not call!2892))))

(declare-fun lt!14055 () List!1013)

(assert (=> b!38147 (= lt!14055 call!2889)))

(declare-fun e!24253 () List!1013)

(assert (=> b!38147 (= e!24253 call!2889)))

(declare-fun b!38148 () Bool)

(declare-fun e!24251 () List!1013)

(assert (=> b!38148 (= e!24251 e!24253)))

(declare-fun c!4403 () Bool)

(assert (=> b!38148 (= c!4403 (and ((_ is Cons!1008) (toList!535 lm!266)) (not (= (_2!742 (h!1576 (toList!535 lm!266))) value!232))))))

(declare-fun b!38149 () Bool)

(declare-fun Unit!892 () Unit!887)

(assert (=> b!38149 (= e!24252 Unit!892)))

(declare-fun bm!2888 () Bool)

(assert (=> bm!2888 (= call!2889 (getKeysOf!2 (t!3845 (toList!535 lm!266)) value!232))))

(declare-fun b!38150 () Bool)

(assert (=> b!38150 (= e!24253 Nil!1010)))

(declare-fun b!38151 () Bool)

(assert (=> b!38151 (= e!24251 (Cons!1009 (_1!742 (h!1576 (toList!535 lm!266))) call!2889))))

(declare-fun c!4401 () Bool)

(assert (=> b!38151 (= c!4401 (not call!2892))))

(declare-fun lt!14058 () Unit!887)

(declare-fun e!24254 () Unit!887)

(assert (=> b!38151 (= lt!14058 e!24254)))

(assert (=> b!38152 call!2890))

(declare-fun lt!14057 () Unit!887)

(declare-fun call!2891 () Unit!887)

(assert (=> b!38152 (= lt!14057 call!2891)))

(assert (=> b!38152 (= lt!14061 (h!1576 (toList!535 lm!266)))))

(assert (=> b!38152 (= lt!14056 call!2889)))

(assert (=> b!38152 (= lt!14062 (t!3845 (toList!535 lm!266)))))

(assert (=> b!38152 (= e!24254 lt!14057)))

(declare-fun lt!14060 () Unit!887)

(assert (=> b!38153 (= e!24252 lt!14060)))

(assert (=> b!38153 (= lt!14052 (t!3845 (toList!535 lm!266)))))

(assert (=> b!38153 (= lt!14053 call!2889)))

(assert (=> b!38153 (= lt!14065 (h!1576 (toList!535 lm!266)))))

(assert (=> b!38153 (= lt!14060 call!2891)))

(assert (=> b!38153 call!2890))

(declare-fun b!38154 () Bool)

(declare-fun Unit!896 () Unit!887)

(assert (=> b!38154 (= e!24254 Unit!896)))

(declare-fun lt!14059 () List!1013)

(assert (=> d!6179 (forall!180 lt!14059 lambda!227)))

(assert (=> d!6179 (= lt!14059 e!24251)))

(assert (=> d!6179 (= c!4404 (and ((_ is Cons!1008) (toList!535 lm!266)) (= (_2!742 (h!1576 (toList!535 lm!266))) value!232)))))

(declare-fun isStrictlySorted!207 (List!1012) Bool)

(assert (=> d!6179 (isStrictlySorted!207 (toList!535 lm!266))))

(assert (=> d!6179 (= (getKeysOf!2 (toList!535 lm!266) value!232) lt!14059)))

(declare-fun bm!2889 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!1 (List!1012 List!1013 B!802 tuple2!1462) Unit!887)

(assert (=> bm!2889 (= call!2891 (lemmaForallGetValueByKeySameWithASmallerHead!1 (ite c!4404 lt!14062 lt!14052) (ite c!4404 lt!14056 lt!14053) value!232 (ite c!4404 lt!14061 lt!14065)))))

(assert (= (and d!6179 c!4404) b!38151))

(assert (= (and d!6179 (not c!4404)) b!38148))

(assert (= (and b!38151 c!4401) b!38152))

(assert (= (and b!38151 (not c!4401)) b!38154))

(assert (= (and b!38148 c!4403) b!38147))

(assert (= (and b!38148 (not c!4403)) b!38150))

(assert (= (and b!38147 c!4402) b!38153))

(assert (= (and b!38147 (not c!4402)) b!38149))

(assert (= (or b!38152 b!38153) bm!2886))

(assert (= (or b!38152 b!38153) bm!2889))

(assert (= (or b!38151 b!38152 b!38147 b!38153) bm!2888))

(assert (= (or b!38151 b!38147) bm!2887))

(declare-fun m!30758 () Bool)

(assert (=> bm!2886 m!30758))

(declare-fun m!30765 () Bool)

(assert (=> d!6179 m!30765))

(declare-fun m!30767 () Bool)

(assert (=> d!6179 m!30767))

(declare-fun m!30775 () Bool)

(assert (=> bm!2889 m!30775))

(declare-fun m!30781 () Bool)

(assert (=> bm!2887 m!30781))

(declare-fun m!30787 () Bool)

(assert (=> bm!2888 m!30787))

(assert (=> start!5256 d!6179))

(declare-fun d!6182 () Bool)

(assert (=> d!6182 (= (inv!1716 lm!266) (isStrictlySorted!207 (toList!535 lm!266)))))

(declare-fun bs!1543 () Bool)

(assert (= bs!1543 d!6182))

(assert (=> bs!1543 m!30767))

(assert (=> start!5256 d!6182))

(declare-fun b!38196 () Bool)

(declare-fun e!24271 () Bool)

(declare-fun tp!5683 () Bool)

(assert (=> b!38196 (= e!24271 (and tp_is_empty!1725 tp!5683))))

(assert (=> b!38069 (= tp!5672 e!24271)))

(assert (= (and b!38069 ((_ is Cons!1008) (toList!535 lm!266))) b!38196))

(declare-fun b_lambda!2007 () Bool)

(assert (= b_lambda!2001 (or start!5256 b_lambda!2007)))

(declare-fun bs!1546 () Bool)

(declare-fun d!6188 () Bool)

(assert (= bs!1546 (and d!6188 start!5256)))

(declare-datatypes ((Option!102 0))(
  ( (Some!101 (v!1976 B!802)) (None!100) )
))
(declare-fun getValueByKey!96 (List!1012 (_ BitVec 64)) Option!102)

(assert (=> bs!1546 (= (dynLambda!182 lambda!197 (h!1577 (getKeysOf!2 (toList!535 lm!266) value!232))) (= (getValueByKey!96 (toList!535 lm!266) (h!1577 (getKeysOf!2 (toList!535 lm!266) value!232))) (Some!101 value!232)))))

(declare-fun m!30795 () Bool)

(assert (=> bs!1546 m!30795))

(assert (=> b!38097 d!6188))

(check-sat (not bm!2889) (not bm!2888) (not d!6182) (not bm!2886) (not d!6179) tp_is_empty!1725 (not b!38098) (not b_lambda!2007) (not bs!1546) (not b!38196) (not bm!2887))
(check-sat)
