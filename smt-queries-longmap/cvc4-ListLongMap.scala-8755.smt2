; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106274 () Bool)

(assert start!106274)

(declare-fun b!1264714 () Bool)

(declare-fun res!842236 () Bool)

(declare-fun e!720212 () Bool)

(assert (=> b!1264714 (=> (not res!842236) (not e!720212))))

(declare-datatypes ((B!1926 0))(
  ( (B!1927 (val!16298 Int)) )
))
(declare-datatypes ((tuple2!21114 0))(
  ( (tuple2!21115 (_1!10568 (_ BitVec 64)) (_2!10568 B!1926)) )
))
(declare-datatypes ((List!28290 0))(
  ( (Nil!28287) (Cons!28286 (h!29495 tuple2!21114) (t!41811 List!28290)) )
))
(declare-datatypes ((ListLongMap!18987 0))(
  ( (ListLongMap!18988 (toList!9509 List!28290)) )
))
(declare-fun lm!212 () ListLongMap!18987)

(declare-fun isStrictlySorted!777 (List!28290) Bool)

(assert (=> b!1264714 (= res!842236 (isStrictlySorted!777 (toList!9509 lm!212)))))

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun b1!78 () B!1926)

(declare-fun b!1264716 () Bool)

(declare-fun -!2154 (ListLongMap!18987 (_ BitVec 64)) ListLongMap!18987)

(declare-fun +!4267 (ListLongMap!18987 tuple2!21114) ListLongMap!18987)

(assert (=> b!1264716 (= e!720212 (not (= (-!2154 (+!4267 lm!212 (tuple2!21115 a1!67 b1!78)) a1!67) lm!212)))))

(declare-fun removeStrictlySorted!148 (List!28290 (_ BitVec 64)) List!28290)

(declare-fun insertStrictlySorted!455 (List!28290 (_ BitVec 64) B!1926) List!28290)

(assert (=> b!1264716 (= (removeStrictlySorted!148 (insertStrictlySorted!455 (toList!9509 lm!212) a1!67 b1!78) a1!67) (toList!9509 lm!212))))

(declare-datatypes ((Unit!42166 0))(
  ( (Unit!42167) )
))
(declare-fun lt!573885 () Unit!42166)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!3 (List!28290 (_ BitVec 64) B!1926) Unit!42166)

(assert (=> b!1264716 (= lt!573885 (lemmaInsertStrictlySortedThenRemoveIsSame!3 (toList!9509 lm!212) a1!67 b1!78))))

(declare-fun b!1264717 () Bool)

(declare-fun e!720211 () Bool)

(declare-fun tp!96245 () Bool)

(assert (=> b!1264717 (= e!720211 tp!96245)))

(declare-fun res!842234 () Bool)

(assert (=> start!106274 (=> (not res!842234) (not e!720212))))

(declare-fun contains!7630 (ListLongMap!18987 (_ BitVec 64)) Bool)

(assert (=> start!106274 (= res!842234 (not (contains!7630 lm!212 a1!67)))))

(assert (=> start!106274 e!720212))

(declare-fun inv!44090 (ListLongMap!18987) Bool)

(assert (=> start!106274 (and (inv!44090 lm!212) e!720211)))

(assert (=> start!106274 true))

(declare-fun tp_is_empty!32459 () Bool)

(assert (=> start!106274 tp_is_empty!32459))

(declare-fun b!1264715 () Bool)

(declare-fun res!842235 () Bool)

(assert (=> b!1264715 (=> (not res!842235) (not e!720212))))

(declare-fun containsKey!636 (List!28290 (_ BitVec 64)) Bool)

(assert (=> b!1264715 (= res!842235 (not (containsKey!636 (toList!9509 lm!212) a1!67)))))

(assert (= (and start!106274 res!842234) b!1264714))

(assert (= (and b!1264714 res!842236) b!1264715))

(assert (= (and b!1264715 res!842235) b!1264716))

(assert (= start!106274 b!1264717))

(declare-fun m!1165209 () Bool)

(assert (=> b!1264714 m!1165209))

(declare-fun m!1165211 () Bool)

(assert (=> b!1264716 m!1165211))

(declare-fun m!1165213 () Bool)

(assert (=> b!1264716 m!1165213))

(declare-fun m!1165215 () Bool)

(assert (=> b!1264716 m!1165215))

(declare-fun m!1165217 () Bool)

(assert (=> b!1264716 m!1165217))

(assert (=> b!1264716 m!1165217))

(declare-fun m!1165219 () Bool)

(assert (=> b!1264716 m!1165219))

(assert (=> b!1264716 m!1165211))

(declare-fun m!1165221 () Bool)

(assert (=> start!106274 m!1165221))

(declare-fun m!1165223 () Bool)

(assert (=> start!106274 m!1165223))

(declare-fun m!1165225 () Bool)

(assert (=> b!1264715 m!1165225))

(push 1)

(assert (not b!1264717))

(assert (not b!1264715))

(assert tp_is_empty!32459)

(assert (not start!106274))

(assert (not b!1264716))

(assert (not b!1264714))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138779 () Bool)

(declare-fun e!720223 () Bool)

(assert (=> d!138779 e!720223))

(declare-fun res!842245 () Bool)

(assert (=> d!138779 (=> res!842245 e!720223)))

(declare-fun lt!573900 () Bool)

(assert (=> d!138779 (= res!842245 (not lt!573900))))

(declare-fun lt!573898 () Bool)

(assert (=> d!138779 (= lt!573900 lt!573898)))

(declare-fun lt!573899 () Unit!42166)

(declare-fun e!720224 () Unit!42166)

(assert (=> d!138779 (= lt!573899 e!720224)))

(declare-fun c!123157 () Bool)

(assert (=> d!138779 (= c!123157 lt!573898)))

(assert (=> d!138779 (= lt!573898 (containsKey!636 (toList!9509 lm!212) a1!67))))

(assert (=> d!138779 (= (contains!7630 lm!212 a1!67) lt!573900)))

(declare-fun b!1264730 () Bool)

(declare-fun lt!573897 () Unit!42166)

(assert (=> b!1264730 (= e!720224 lt!573897)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!443 (List!28290 (_ BitVec 64)) Unit!42166)

(assert (=> b!1264730 (= lt!573897 (lemmaContainsKeyImpliesGetValueByKeyDefined!443 (toList!9509 lm!212) a1!67))))

(declare-datatypes ((Option!727 0))(
  ( (Some!726 (v!19004 B!1926)) (None!725) )
))
(declare-fun isDefined!482 (Option!727) Bool)

(declare-fun getValueByKey!675 (List!28290 (_ BitVec 64)) Option!727)

(assert (=> b!1264730 (isDefined!482 (getValueByKey!675 (toList!9509 lm!212) a1!67))))

(declare-fun b!1264731 () Bool)

(declare-fun Unit!42168 () Unit!42166)

(assert (=> b!1264731 (= e!720224 Unit!42168)))

(declare-fun b!1264732 () Bool)

(assert (=> b!1264732 (= e!720223 (isDefined!482 (getValueByKey!675 (toList!9509 lm!212) a1!67)))))

(assert (= (and d!138779 c!123157) b!1264730))

(assert (= (and d!138779 (not c!123157)) b!1264731))

(assert (= (and d!138779 (not res!842245)) b!1264732))

(assert (=> d!138779 m!1165225))

(declare-fun m!1165231 () Bool)

(assert (=> b!1264730 m!1165231))

(declare-fun m!1165233 () Bool)

(assert (=> b!1264730 m!1165233))

(assert (=> b!1264730 m!1165233))

(declare-fun m!1165235 () Bool)

(assert (=> b!1264730 m!1165235))

(assert (=> b!1264732 m!1165233))

(assert (=> b!1264732 m!1165233))

(assert (=> b!1264732 m!1165235))

(assert (=> start!106274 d!138779))

(declare-fun d!138789 () Bool)

(assert (=> d!138789 (= (inv!44090 lm!212) (isStrictlySorted!777 (toList!9509 lm!212)))))

(declare-fun bs!35787 () Bool)

(assert (= bs!35787 d!138789))

(assert (=> bs!35787 m!1165209))

(assert (=> start!106274 d!138789))

(declare-fun d!138791 () Bool)

(declare-fun res!842250 () Bool)

(declare-fun e!720229 () Bool)

(assert (=> d!138791 (=> res!842250 e!720229)))

(assert (=> d!138791 (= res!842250 (or (is-Nil!28287 (toList!9509 lm!212)) (is-Nil!28287 (t!41811 (toList!9509 lm!212)))))))

(assert (=> d!138791 (= (isStrictlySorted!777 (toList!9509 lm!212)) e!720229)))

(declare-fun b!1264737 () Bool)

(declare-fun e!720230 () Bool)

(assert (=> b!1264737 (= e!720229 e!720230)))

(declare-fun res!842251 () Bool)

(assert (=> b!1264737 (=> (not res!842251) (not e!720230))))

(assert (=> b!1264737 (= res!842251 (bvslt (_1!10568 (h!29495 (toList!9509 lm!212))) (_1!10568 (h!29495 (t!41811 (toList!9509 lm!212))))))))

(declare-fun b!1264738 () Bool)

(assert (=> b!1264738 (= e!720230 (isStrictlySorted!777 (t!41811 (toList!9509 lm!212))))))

(assert (= (and d!138791 (not res!842250)) b!1264737))

(assert (= (and b!1264737 res!842251) b!1264738))

(declare-fun m!1165237 () Bool)

(assert (=> b!1264738 m!1165237))

(assert (=> b!1264714 d!138791))

(declare-fun d!138793 () Bool)

(assert (=> d!138793 (= (removeStrictlySorted!148 (insertStrictlySorted!455 (toList!9509 lm!212) a1!67 b1!78) a1!67) (toList!9509 lm!212))))

(declare-fun lt!573913 () Unit!42166)

(declare-fun choose!1881 (List!28290 (_ BitVec 64) B!1926) Unit!42166)

(assert (=> d!138793 (= lt!573913 (choose!1881 (toList!9509 lm!212) a1!67 b1!78))))

(assert (=> d!138793 (isStrictlySorted!777 (toList!9509 lm!212))))

(assert (=> d!138793 (= (lemmaInsertStrictlySortedThenRemoveIsSame!3 (toList!9509 lm!212) a1!67 b1!78) lt!573913)))

(declare-fun bs!35788 () Bool)

(assert (= bs!35788 d!138793))

(assert (=> bs!35788 m!1165217))

(assert (=> bs!35788 m!1165217))

(assert (=> bs!35788 m!1165219))

(declare-fun m!1165239 () Bool)

(assert (=> bs!35788 m!1165239))

(assert (=> bs!35788 m!1165209))

(assert (=> b!1264716 d!138793))

(declare-fun d!138795 () Bool)

(declare-fun e!720259 () Bool)

(assert (=> d!138795 e!720259))

(declare-fun res!842266 () Bool)

(assert (=> d!138795 (=> (not res!842266) (not e!720259))))

(declare-fun lt!573921 () List!28290)

(assert (=> d!138795 (= res!842266 (isStrictlySorted!777 lt!573921))))

(declare-fun e!720258 () List!28290)

(assert (=> d!138795 (= lt!573921 e!720258)))

(declare-fun c!123171 () Bool)

(assert (=> d!138795 (= c!123171 (and (is-Cons!28286 (insertStrictlySorted!455 (toList!9509 lm!212) a1!67 b1!78)) (= (_1!10568 (h!29495 (insertStrictlySorted!455 (toList!9509 lm!212) a1!67 b1!78))) a1!67)))))

(assert (=> d!138795 (isStrictlySorted!777 (insertStrictlySorted!455 (toList!9509 lm!212) a1!67 b1!78))))

(assert (=> d!138795 (= (removeStrictlySorted!148 (insertStrictlySorted!455 (toList!9509 lm!212) a1!67 b1!78) a1!67) lt!573921)))

(declare-fun b!1264779 () Bool)

(assert (=> b!1264779 (= e!720258 (t!41811 (insertStrictlySorted!455 (toList!9509 lm!212) a1!67 b1!78)))))

(declare-fun b!1264780 () Bool)

(assert (=> b!1264780 (= e!720259 (not (containsKey!636 lt!573921 a1!67)))))

(declare-fun b!1264781 () Bool)

(declare-fun e!720260 () List!28290)

(assert (=> b!1264781 (= e!720258 e!720260)))

(declare-fun c!123172 () Bool)

(assert (=> b!1264781 (= c!123172 (and (is-Cons!28286 (insertStrictlySorted!455 (toList!9509 lm!212) a1!67 b1!78)) (not (= (_1!10568 (h!29495 (insertStrictlySorted!455 (toList!9509 lm!212) a1!67 b1!78))) a1!67))))))

(declare-fun b!1264782 () Bool)

(assert (=> b!1264782 (= e!720260 Nil!28287)))

(declare-fun b!1264783 () Bool)

(declare-fun $colon$colon!633 (List!28290 tuple2!21114) List!28290)

(assert (=> b!1264783 (= e!720260 ($colon$colon!633 (removeStrictlySorted!148 (t!41811 (insertStrictlySorted!455 (toList!9509 lm!212) a1!67 b1!78)) a1!67) (h!29495 (insertStrictlySorted!455 (toList!9509 lm!212) a1!67 b1!78))))))

(assert (= (and d!138795 c!123171) b!1264779))

(assert (= (and d!138795 (not c!123171)) b!1264781))

(assert (= (and b!1264781 c!123172) b!1264783))

(assert (= (and b!1264781 (not c!123172)) b!1264782))

(assert (= (and d!138795 res!842266) b!1264780))

(declare-fun m!1165259 () Bool)

(assert (=> d!138795 m!1165259))

(assert (=> d!138795 m!1165217))

(declare-fun m!1165261 () Bool)

(assert (=> d!138795 m!1165261))

(declare-fun m!1165263 () Bool)

(assert (=> b!1264780 m!1165263))

(declare-fun m!1165265 () Bool)

(assert (=> b!1264783 m!1165265))

(assert (=> b!1264783 m!1165265))

(declare-fun m!1165267 () Bool)

(assert (=> b!1264783 m!1165267))

(assert (=> b!1264716 d!138795))

(declare-fun d!138805 () Bool)

(declare-fun e!720266 () Bool)

(assert (=> d!138805 e!720266))

(declare-fun res!842278 () Bool)

(assert (=> d!138805 (=> (not res!842278) (not e!720266))))

(declare-fun lt!573945 () ListLongMap!18987)

(assert (=> d!138805 (= res!842278 (contains!7630 lt!573945 (_1!10568 (tuple2!21115 a1!67 b1!78))))))

(declare-fun lt!573948 () List!28290)

(assert (=> d!138805 (= lt!573945 (ListLongMap!18988 lt!573948))))

(declare-fun lt!573946 () Unit!42166)

(declare-fun lt!573947 () Unit!42166)

(assert (=> d!138805 (= lt!573946 lt!573947)))

(assert (=> d!138805 (= (getValueByKey!675 lt!573948 (_1!10568 (tuple2!21115 a1!67 b1!78))) (Some!726 (_2!10568 (tuple2!21115 a1!67 b1!78))))))

(declare-fun lemmaContainsTupThenGetReturnValue!340 (List!28290 (_ BitVec 64) B!1926) Unit!42166)

(assert (=> d!138805 (= lt!573947 (lemmaContainsTupThenGetReturnValue!340 lt!573948 (_1!10568 (tuple2!21115 a1!67 b1!78)) (_2!10568 (tuple2!21115 a1!67 b1!78))))))

(assert (=> d!138805 (= lt!573948 (insertStrictlySorted!455 (toList!9509 lm!212) (_1!10568 (tuple2!21115 a1!67 b1!78)) (_2!10568 (tuple2!21115 a1!67 b1!78))))))

(assert (=> d!138805 (= (+!4267 lm!212 (tuple2!21115 a1!67 b1!78)) lt!573945)))

(declare-fun b!1264794 () Bool)

(declare-fun res!842277 () Bool)

(assert (=> b!1264794 (=> (not res!842277) (not e!720266))))

(assert (=> b!1264794 (= res!842277 (= (getValueByKey!675 (toList!9509 lt!573945) (_1!10568 (tuple2!21115 a1!67 b1!78))) (Some!726 (_2!10568 (tuple2!21115 a1!67 b1!78)))))))

(declare-fun b!1264795 () Bool)

(declare-fun contains!7632 (List!28290 tuple2!21114) Bool)

(assert (=> b!1264795 (= e!720266 (contains!7632 (toList!9509 lt!573945) (tuple2!21115 a1!67 b1!78)))))

(assert (= (and d!138805 res!842278) b!1264794))

(assert (= (and b!1264794 res!842277) b!1264795))

(declare-fun m!1165283 () Bool)

(assert (=> d!138805 m!1165283))

(declare-fun m!1165285 () Bool)

(assert (=> d!138805 m!1165285))

(declare-fun m!1165287 () Bool)

(assert (=> d!138805 m!1165287))

(declare-fun m!1165289 () Bool)

(assert (=> d!138805 m!1165289))

(declare-fun m!1165291 () Bool)

(assert (=> b!1264794 m!1165291))

(declare-fun m!1165293 () Bool)

(assert (=> b!1264795 m!1165293))

(assert (=> b!1264716 d!138805))

(declare-fun d!138811 () Bool)

(declare-fun lt!573956 () ListLongMap!18987)

(assert (=> d!138811 (not (contains!7630 lt!573956 a1!67))))

(assert (=> d!138811 (= lt!573956 (ListLongMap!18988 (removeStrictlySorted!148 (toList!9509 (+!4267 lm!212 (tuple2!21115 a1!67 b1!78))) a1!67)))))

(assert (=> d!138811 (= (-!2154 (+!4267 lm!212 (tuple2!21115 a1!67 b1!78)) a1!67) lt!573956)))

(declare-fun bs!35792 () Bool)

(assert (= bs!35792 d!138811))

(declare-fun m!1165299 () Bool)

(assert (=> bs!35792 m!1165299))

(declare-fun m!1165301 () Bool)

(assert (=> bs!35792 m!1165301))

(assert (=> b!1264716 d!138811))

(declare-fun b!1264857 () Bool)

(declare-fun e!720300 () List!28290)

(declare-fun call!62345 () List!28290)

(assert (=> b!1264857 (= e!720300 call!62345)))

(declare-fun b!1264858 () Bool)

(declare-fun res!842296 () Bool)

(declare-fun e!720299 () Bool)

(assert (=> b!1264858 (=> (not res!842296) (not e!720299))))

(declare-fun lt!573974 () List!28290)

(assert (=> b!1264858 (= res!842296 (containsKey!636 lt!573974 a1!67))))

(declare-fun b!1264859 () Bool)

(declare-fun e!720302 () List!28290)

(declare-fun call!62347 () List!28290)

(assert (=> b!1264859 (= e!720302 call!62347)))

(declare-fun d!138815 () Bool)

(assert (=> d!138815 e!720299))

(declare-fun res!842297 () Bool)

(assert (=> d!138815 (=> (not res!842297) (not e!720299))))

(assert (=> d!138815 (= res!842297 (isStrictlySorted!777 lt!573974))))

(declare-fun e!720301 () List!28290)

(assert (=> d!138815 (= lt!573974 e!720301)))

(declare-fun c!123195 () Bool)

(assert (=> d!138815 (= c!123195 (and (is-Cons!28286 (toList!9509 lm!212)) (bvslt (_1!10568 (h!29495 (toList!9509 lm!212))) a1!67)))))

(assert (=> d!138815 (isStrictlySorted!777 (toList!9509 lm!212))))

(assert (=> d!138815 (= (insertStrictlySorted!455 (toList!9509 lm!212) a1!67 b1!78) lt!573974)))

(declare-fun b!1264860 () Bool)

(declare-fun call!62346 () List!28290)

(assert (=> b!1264860 (= e!720301 call!62346)))

(declare-fun b!1264861 () Bool)

(assert (=> b!1264861 (= e!720302 call!62347)))

(declare-fun c!123197 () Bool)

(declare-fun c!123198 () Bool)

(declare-fun b!1264862 () Bool)

(declare-fun e!720303 () List!28290)

(assert (=> b!1264862 (= e!720303 (ite c!123197 (t!41811 (toList!9509 lm!212)) (ite c!123198 (Cons!28286 (h!29495 (toList!9509 lm!212)) (t!41811 (toList!9509 lm!212))) Nil!28287)))))

(declare-fun bm!62342 () Bool)

(assert (=> bm!62342 (= call!62347 call!62345)))

(declare-fun bm!62343 () Bool)

(assert (=> bm!62343 (= call!62346 ($colon$colon!633 e!720303 (ite c!123195 (h!29495 (toList!9509 lm!212)) (tuple2!21115 a1!67 b1!78))))))

(declare-fun c!123196 () Bool)

(assert (=> bm!62343 (= c!123196 c!123195)))

(declare-fun b!1264863 () Bool)

(assert (=> b!1264863 (= e!720299 (contains!7632 lt!573974 (tuple2!21115 a1!67 b1!78)))))

(declare-fun b!1264864 () Bool)

(assert (=> b!1264864 (= e!720303 (insertStrictlySorted!455 (t!41811 (toList!9509 lm!212)) a1!67 b1!78))))

(declare-fun bm!62344 () Bool)

(assert (=> bm!62344 (= call!62345 call!62346)))

(declare-fun b!1264865 () Bool)

(assert (=> b!1264865 (= c!123198 (and (is-Cons!28286 (toList!9509 lm!212)) (bvsgt (_1!10568 (h!29495 (toList!9509 lm!212))) a1!67)))))

(assert (=> b!1264865 (= e!720300 e!720302)))

(declare-fun b!1264866 () Bool)

(assert (=> b!1264866 (= e!720301 e!720300)))

(assert (=> b!1264866 (= c!123197 (and (is-Cons!28286 (toList!9509 lm!212)) (= (_1!10568 (h!29495 (toList!9509 lm!212))) a1!67)))))

(assert (= (and d!138815 c!123195) b!1264860))

(assert (= (and d!138815 (not c!123195)) b!1264866))

(assert (= (and b!1264866 c!123197) b!1264857))

(assert (= (and b!1264866 (not c!123197)) b!1264865))

(assert (= (and b!1264865 c!123198) b!1264861))

(assert (= (and b!1264865 (not c!123198)) b!1264859))

(assert (= (or b!1264861 b!1264859) bm!62342))

(assert (= (or b!1264857 bm!62342) bm!62344))

(assert (= (or b!1264860 bm!62344) bm!62343))

(assert (= (and bm!62343 c!123196) b!1264864))

(assert (= (and bm!62343 (not c!123196)) b!1264862))

(assert (= (and d!138815 res!842297) b!1264858))

(assert (= (and b!1264858 res!842296) b!1264863))

(declare-fun m!1165325 () Bool)

(assert (=> b!1264858 m!1165325))

(declare-fun m!1165327 () Bool)

(assert (=> b!1264864 m!1165327))

(declare-fun m!1165329 () Bool)

(assert (=> bm!62343 m!1165329))

(declare-fun m!1165331 () Bool)

