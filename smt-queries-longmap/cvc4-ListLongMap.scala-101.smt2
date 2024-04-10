; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1654 () Bool)

(assert start!1654)

(declare-fun res!9763 () Bool)

(declare-fun e!7040 () Bool)

(assert (=> start!1654 (=> (not res!9763) (not e!7040))))

(declare-datatypes ((B!414 0))(
  ( (B!415 (val!302 Int)) )
))
(declare-datatypes ((tuple2!404 0))(
  ( (tuple2!405 (_1!202 (_ BitVec 64)) (_2!202 B!414)) )
))
(declare-datatypes ((List!354 0))(
  ( (Nil!351) (Cons!350 (h!916 tuple2!404) (t!2741 List!354)) )
))
(declare-datatypes ((ListLongMap!385 0))(
  ( (ListLongMap!386 (toList!208 List!354)) )
))
(declare-fun lm!265 () ListLongMap!385)

(declare-fun a!527 () (_ BitVec 64))

(declare-fun contains!176 (ListLongMap!385 (_ BitVec 64)) Bool)

(assert (=> start!1654 (= res!9763 (contains!176 lm!265 a!527))))

(assert (=> start!1654 e!7040))

(declare-fun e!7039 () Bool)

(declare-fun inv!592 (ListLongMap!385) Bool)

(assert (=> start!1654 (and (inv!592 lm!265) e!7039)))

(assert (=> start!1654 true))

(declare-fun tp_is_empty!587 () Bool)

(assert (=> start!1654 tp_is_empty!587))

(declare-fun b!11826 () Bool)

(declare-fun res!9762 () Bool)

(assert (=> b!11826 (=> (not res!9762) (not e!7040))))

(declare-fun b!100 () B!414)

(declare-datatypes ((Option!40 0))(
  ( (Some!39 (v!1354 B!414)) (None!38) )
))
(declare-fun getValueByKey!34 (List!354 (_ BitVec 64)) Option!40)

(assert (=> b!11826 (= res!9762 (= (getValueByKey!34 (toList!208 lm!265) a!527) (Some!39 b!100)))))

(declare-fun b!11827 () Bool)

(declare-fun isStrictlySorted!53 (List!354) Bool)

(assert (=> b!11827 (= e!7040 (not (isStrictlySorted!53 (toList!208 lm!265))))))

(declare-fun b!11828 () Bool)

(declare-fun tp!1985 () Bool)

(assert (=> b!11828 (= e!7039 tp!1985)))

(assert (= (and start!1654 res!9763) b!11826))

(assert (= (and b!11826 res!9762) b!11827))

(assert (= start!1654 b!11828))

(declare-fun m!8253 () Bool)

(assert (=> start!1654 m!8253))

(declare-fun m!8255 () Bool)

(assert (=> start!1654 m!8255))

(declare-fun m!8257 () Bool)

(assert (=> b!11826 m!8257))

(declare-fun m!8259 () Bool)

(assert (=> b!11827 m!8259))

(push 1)

(assert (not b!11826))

(assert (not b!11827))

(assert (not start!1654))

(assert (not b!11828))

(assert tp_is_empty!587)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!11852 () Bool)

(declare-fun e!7055 () Option!40)

(declare-fun e!7056 () Option!40)

(assert (=> b!11852 (= e!7055 e!7056)))

(declare-fun c!996 () Bool)

(assert (=> b!11852 (= c!996 (and (is-Cons!350 (toList!208 lm!265)) (not (= (_1!202 (h!916 (toList!208 lm!265))) a!527))))))

(declare-fun d!1639 () Bool)

(declare-fun c!995 () Bool)

(assert (=> d!1639 (= c!995 (and (is-Cons!350 (toList!208 lm!265)) (= (_1!202 (h!916 (toList!208 lm!265))) a!527)))))

(assert (=> d!1639 (= (getValueByKey!34 (toList!208 lm!265) a!527) e!7055)))

(declare-fun b!11853 () Bool)

(assert (=> b!11853 (= e!7056 (getValueByKey!34 (t!2741 (toList!208 lm!265)) a!527))))

(declare-fun b!11854 () Bool)

(assert (=> b!11854 (= e!7056 None!38)))

(declare-fun b!11851 () Bool)

(assert (=> b!11851 (= e!7055 (Some!39 (_2!202 (h!916 (toList!208 lm!265)))))))

(assert (= (and d!1639 c!995) b!11851))

(assert (= (and d!1639 (not c!995)) b!11852))

(assert (= (and b!11852 c!996) b!11853))

(assert (= (and b!11852 (not c!996)) b!11854))

(declare-fun m!8263 () Bool)

(assert (=> b!11853 m!8263))

(assert (=> b!11826 d!1639))

(declare-fun d!1645 () Bool)

(declare-fun res!9778 () Bool)

(declare-fun e!7071 () Bool)

(assert (=> d!1645 (=> res!9778 e!7071)))

(assert (=> d!1645 (= res!9778 (or (is-Nil!351 (toList!208 lm!265)) (is-Nil!351 (t!2741 (toList!208 lm!265)))))))

(assert (=> d!1645 (= (isStrictlySorted!53 (toList!208 lm!265)) e!7071)))

(declare-fun b!11875 () Bool)

(declare-fun e!7072 () Bool)

(assert (=> b!11875 (= e!7071 e!7072)))

(declare-fun res!9779 () Bool)

(assert (=> b!11875 (=> (not res!9779) (not e!7072))))

(assert (=> b!11875 (= res!9779 (bvslt (_1!202 (h!916 (toList!208 lm!265))) (_1!202 (h!916 (t!2741 (toList!208 lm!265))))))))

(declare-fun b!11876 () Bool)

(assert (=> b!11876 (= e!7072 (isStrictlySorted!53 (t!2741 (toList!208 lm!265))))))

(assert (= (and d!1645 (not res!9778)) b!11875))

(assert (= (and b!11875 res!9779) b!11876))

(declare-fun m!8267 () Bool)

(assert (=> b!11876 m!8267))

(assert (=> b!11827 d!1645))

(declare-fun d!1649 () Bool)

(declare-fun e!7093 () Bool)

(assert (=> d!1649 e!7093))

(declare-fun res!9790 () Bool)

(assert (=> d!1649 (=> res!9790 e!7093)))

(declare-fun lt!3076 () Bool)

(assert (=> d!1649 (= res!9790 (not lt!3076))))

(declare-fun lt!3077 () Bool)

(assert (=> d!1649 (= lt!3076 lt!3077)))

(declare-datatypes ((Unit!254 0))(
  ( (Unit!255) )
))
(declare-fun lt!3078 () Unit!254)

(declare-fun e!7094 () Unit!254)

(assert (=> d!1649 (= lt!3078 e!7094)))

(declare-fun c!1013 () Bool)

(assert (=> d!1649 (= c!1013 lt!3077)))

(declare-fun containsKey!16 (List!354 (_ BitVec 64)) Bool)

(assert (=> d!1649 (= lt!3077 (containsKey!16 (toList!208 lm!265) a!527))))

(assert (=> d!1649 (= (contains!176 lm!265 a!527) lt!3076)))

(declare-fun b!11907 () Bool)

(declare-fun lt!3075 () Unit!254)

(assert (=> b!11907 (= e!7094 lt!3075)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!13 (List!354 (_ BitVec 64)) Unit!254)

(assert (=> b!11907 (= lt!3075 (lemmaContainsKeyImpliesGetValueByKeyDefined!13 (toList!208 lm!265) a!527))))

(declare-fun isDefined!14 (Option!40) Bool)

(assert (=> b!11907 (isDefined!14 (getValueByKey!34 (toList!208 lm!265) a!527))))

(declare-fun b!11908 () Bool)

(declare-fun Unit!257 () Unit!254)

(assert (=> b!11908 (= e!7094 Unit!257)))

(declare-fun b!11909 () Bool)

(assert (=> b!11909 (= e!7093 (isDefined!14 (getValueByKey!34 (toList!208 lm!265) a!527)))))

(assert (= (and d!1649 c!1013) b!11907))

(assert (= (and d!1649 (not c!1013)) b!11908))

(assert (= (and d!1649 (not res!9790)) b!11909))

(declare-fun m!8277 () Bool)

(assert (=> d!1649 m!8277))

(declare-fun m!8283 () Bool)

(assert (=> b!11907 m!8283))

(assert (=> b!11907 m!8257))

(assert (=> b!11907 m!8257))

(declare-fun m!8289 () Bool)

(assert (=> b!11907 m!8289))

(assert (=> b!11909 m!8257))

(assert (=> b!11909 m!8257))

(assert (=> b!11909 m!8289))

