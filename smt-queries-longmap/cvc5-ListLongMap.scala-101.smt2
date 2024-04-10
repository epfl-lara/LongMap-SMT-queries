; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1650 () Bool)

(assert start!1650)

(declare-fun res!9750 () Bool)

(declare-fun e!7028 () Bool)

(assert (=> start!1650 (=> (not res!9750) (not e!7028))))

(declare-datatypes ((B!410 0))(
  ( (B!411 (val!300 Int)) )
))
(declare-datatypes ((tuple2!400 0))(
  ( (tuple2!401 (_1!200 (_ BitVec 64)) (_2!200 B!410)) )
))
(declare-datatypes ((List!352 0))(
  ( (Nil!349) (Cons!348 (h!914 tuple2!400) (t!2739 List!352)) )
))
(declare-datatypes ((ListLongMap!381 0))(
  ( (ListLongMap!382 (toList!206 List!352)) )
))
(declare-fun lm!265 () ListLongMap!381)

(declare-fun a!527 () (_ BitVec 64))

(declare-fun contains!174 (ListLongMap!381 (_ BitVec 64)) Bool)

(assert (=> start!1650 (= res!9750 (contains!174 lm!265 a!527))))

(assert (=> start!1650 e!7028))

(declare-fun e!7027 () Bool)

(declare-fun inv!590 (ListLongMap!381) Bool)

(assert (=> start!1650 (and (inv!590 lm!265) e!7027)))

(assert (=> start!1650 true))

(declare-fun tp_is_empty!583 () Bool)

(assert (=> start!1650 tp_is_empty!583))

(declare-fun b!11808 () Bool)

(declare-fun res!9751 () Bool)

(assert (=> b!11808 (=> (not res!9751) (not e!7028))))

(declare-fun b!100 () B!410)

(declare-datatypes ((Option!38 0))(
  ( (Some!37 (v!1352 B!410)) (None!36) )
))
(declare-fun getValueByKey!32 (List!352 (_ BitVec 64)) Option!38)

(assert (=> b!11808 (= res!9751 (= (getValueByKey!32 (toList!206 lm!265) a!527) (Some!37 b!100)))))

(declare-fun b!11809 () Bool)

(declare-fun isStrictlySorted!51 (List!352) Bool)

(assert (=> b!11809 (= e!7028 (not (isStrictlySorted!51 (toList!206 lm!265))))))

(declare-fun b!11810 () Bool)

(declare-fun tp!1979 () Bool)

(assert (=> b!11810 (= e!7027 tp!1979)))

(assert (= (and start!1650 res!9750) b!11808))

(assert (= (and b!11808 res!9751) b!11809))

(assert (= start!1650 b!11810))

(declare-fun m!8237 () Bool)

(assert (=> start!1650 m!8237))

(declare-fun m!8239 () Bool)

(assert (=> start!1650 m!8239))

(declare-fun m!8241 () Bool)

(assert (=> b!11808 m!8241))

(declare-fun m!8243 () Bool)

(assert (=> b!11809 m!8243))

(push 1)

(assert (not b!11808))

(assert (not b!11810))

(assert (not start!1650))

(assert (not b!11809))

(assert tp_is_empty!583)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!11857 () Bool)

(declare-fun e!7058 () Option!38)

(assert (=> b!11857 (= e!7058 (getValueByKey!32 (t!2739 (toList!206 lm!265)) a!527))))

(declare-fun b!11856 () Bool)

(declare-fun e!7057 () Option!38)

(assert (=> b!11856 (= e!7057 e!7058)))

(declare-fun c!998 () Bool)

(assert (=> b!11856 (= c!998 (and (is-Cons!348 (toList!206 lm!265)) (not (= (_1!200 (h!914 (toList!206 lm!265))) a!527))))))

(declare-fun b!11858 () Bool)

(assert (=> b!11858 (= e!7058 None!36)))

(declare-fun b!11855 () Bool)

(assert (=> b!11855 (= e!7057 (Some!37 (_2!200 (h!914 (toList!206 lm!265)))))))

(declare-fun d!1641 () Bool)

(declare-fun c!997 () Bool)

(assert (=> d!1641 (= c!997 (and (is-Cons!348 (toList!206 lm!265)) (= (_1!200 (h!914 (toList!206 lm!265))) a!527)))))

(assert (=> d!1641 (= (getValueByKey!32 (toList!206 lm!265) a!527) e!7057)))

(assert (= (and d!1641 c!997) b!11855))

(assert (= (and d!1641 (not c!997)) b!11856))

(assert (= (and b!11856 c!998) b!11857))

(assert (= (and b!11856 (not c!998)) b!11858))

(declare-fun m!8265 () Bool)

(assert (=> b!11857 m!8265))

(assert (=> b!11808 d!1641))

(declare-fun d!1647 () Bool)

(declare-fun res!9780 () Bool)

(declare-fun e!7073 () Bool)

(assert (=> d!1647 (=> res!9780 e!7073)))

(assert (=> d!1647 (= res!9780 (or (is-Nil!349 (toList!206 lm!265)) (is-Nil!349 (t!2739 (toList!206 lm!265)))))))

(assert (=> d!1647 (= (isStrictlySorted!51 (toList!206 lm!265)) e!7073)))

(declare-fun b!11877 () Bool)

(declare-fun e!7074 () Bool)

(assert (=> b!11877 (= e!7073 e!7074)))

(declare-fun res!9781 () Bool)

(assert (=> b!11877 (=> (not res!9781) (not e!7074))))

(assert (=> b!11877 (= res!9781 (bvslt (_1!200 (h!914 (toList!206 lm!265))) (_1!200 (h!914 (t!2739 (toList!206 lm!265))))))))

(declare-fun b!11878 () Bool)

(assert (=> b!11878 (= e!7074 (isStrictlySorted!51 (t!2739 (toList!206 lm!265))))))

(assert (= (and d!1647 (not res!9780)) b!11877))

(assert (= (and b!11877 res!9781) b!11878))

(declare-fun m!8269 () Bool)

(assert (=> b!11878 m!8269))

(assert (=> b!11809 d!1647))

(declare-fun d!1651 () Bool)

(declare-fun e!7092 () Bool)

(assert (=> d!1651 e!7092))

(declare-fun res!9789 () Bool)

(assert (=> d!1651 (=> res!9789 e!7092)))

(declare-fun lt!3074 () Bool)

(assert (=> d!1651 (= res!9789 (not lt!3074))))

(declare-fun lt!3073 () Bool)

(assert (=> d!1651 (= lt!3074 lt!3073)))

(declare-datatypes ((Unit!251 0))(
  ( (Unit!252) )
))
(declare-fun lt!3072 () Unit!251)

(declare-fun e!7090 () Unit!251)

(assert (=> d!1651 (= lt!3072 e!7090)))

(declare-fun c!1012 () Bool)

(assert (=> d!1651 (= c!1012 lt!3073)))

(declare-fun containsKey!15 (List!352 (_ BitVec 64)) Bool)

(assert (=> d!1651 (= lt!3073 (containsKey!15 (toList!206 lm!265) a!527))))

(assert (=> d!1651 (= (contains!174 lm!265 a!527) lt!3074)))

(declare-fun b!11904 () Bool)

(declare-fun lt!3071 () Unit!251)

(assert (=> b!11904 (= e!7090 lt!3071)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!12 (List!352 (_ BitVec 64)) Unit!251)

(assert (=> b!11904 (= lt!3071 (lemmaContainsKeyImpliesGetValueByKeyDefined!12 (toList!206 lm!265) a!527))))

(declare-fun isDefined!13 (Option!38) Bool)

(assert (=> b!11904 (isDefined!13 (getValueByKey!32 (toList!206 lm!265) a!527))))

(declare-fun b!11905 () Bool)

(declare-fun Unit!256 () Unit!251)

(assert (=> b!11905 (= e!7090 Unit!256)))

(declare-fun b!11906 () Bool)

(assert (=> b!11906 (= e!7092 (isDefined!13 (getValueByKey!32 (toList!206 lm!265) a!527)))))

(assert (= (and d!1651 c!1012) b!11904))

(assert (= (and d!1651 (not c!1012)) b!11905))

(assert (= (and d!1651 (not res!9789)) b!11906))

(declare-fun m!8274 () Bool)

(assert (=> d!1651 m!8274))

(declare-fun m!8281 () Bool)

(assert (=> b!11904 m!8281))

(assert (=> b!11904 m!8241))

(assert (=> b!11904 m!8241))

(declare-fun m!8287 () Bool)

(assert (=> b!11904 m!8287))

(assert (=> b!11906 m!8241))

(assert (=> b!11906 m!8241))

(assert (=> b!11906 m!8287))

(assert (=> start!1650 d!1651))

(declare-fun d!1657 () Bool)

(assert (=> d!1657 (= (inv!590 lm!265) (isStrictlySorted!51 (toList!206 lm!265)))))

(declare-fun bs!454 () Bool)

(assert (= bs!454 d!1657))

(assert (=> bs!454 m!8243))

(assert (=> start!1650 d!1657))

(declare-fun b!11924 () Bool)

(declare-fun e!7101 () Bool)

(declare-fun tp!1994 () Bool)

(assert (=> b!11924 (= e!7101 (and tp_is_empty!583 tp!1994))))

(assert (=> b!11810 (= tp!1979 e!7101)))

(assert (= (and b!11810 (is-Cons!348 (toList!206 lm!265))) b!11924))

(push 1)

