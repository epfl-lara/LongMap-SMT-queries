; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7486 () Bool)

(assert start!7486)

(declare-fun res!27866 () Bool)

(declare-fun e!30759 () Bool)

(assert (=> start!7486 (=> (not res!27866) (not e!30759))))

(declare-datatypes ((B!924 0))(
  ( (B!925 (val!1082 Int)) )
))
(declare-datatypes ((tuple2!1750 0))(
  ( (tuple2!1751 (_1!886 (_ BitVec 64)) (_2!886 B!924)) )
))
(declare-datatypes ((List!1275 0))(
  ( (Nil!1272) (Cons!1271 (h!1851 tuple2!1750) (t!4302 List!1275)) )
))
(declare-datatypes ((ListLongMap!1231 0))(
  ( (ListLongMap!1232 (toList!631 List!1275)) )
))
(declare-fun lm!267 () ListLongMap!1231)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!596 (ListLongMap!1231 (_ BitVec 64)) Bool)

(assert (=> start!7486 (= res!27866 (not (contains!596 lm!267 key!657)))))

(assert (=> start!7486 e!30759))

(declare-fun e!30758 () Bool)

(declare-fun inv!2230 (ListLongMap!1231) Bool)

(assert (=> start!7486 (and (inv!2230 lm!267) e!30758)))

(assert (=> start!7486 true))

(declare-fun b!47943 () Bool)

(declare-fun res!27867 () Bool)

(assert (=> b!47943 (=> (not res!27867) (not e!30759))))

(declare-fun isStrictlySorted!247 (List!1275) Bool)

(assert (=> b!47943 (= res!27867 (isStrictlySorted!247 (toList!631 lm!267)))))

(declare-fun b!47944 () Bool)

(declare-fun containsKey!99 (List!1275 (_ BitVec 64)) Bool)

(assert (=> b!47944 (= e!30759 (containsKey!99 (toList!631 lm!267) key!657))))

(declare-fun b!47945 () Bool)

(declare-fun tp!6335 () Bool)

(assert (=> b!47945 (= e!30758 tp!6335)))

(assert (= (and start!7486 res!27866) b!47943))

(assert (= (and b!47943 res!27867) b!47944))

(assert (= start!7486 b!47945))

(declare-fun m!41919 () Bool)

(assert (=> start!7486 m!41919))

(declare-fun m!41921 () Bool)

(assert (=> start!7486 m!41921))

(declare-fun m!41923 () Bool)

(assert (=> b!47943 m!41923))

(declare-fun m!41925 () Bool)

(assert (=> b!47944 m!41925))

(push 1)

(assert (not b!47944))

(assert (not start!7486))

(assert (not b!47943))

(assert (not b!47945))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9487 () Bool)

(declare-fun res!27876 () Bool)

(declare-fun e!30768 () Bool)

(assert (=> d!9487 (=> res!27876 e!30768)))

(assert (=> d!9487 (= res!27876 (and (is-Cons!1271 (toList!631 lm!267)) (= (_1!886 (h!1851 (toList!631 lm!267))) key!657)))))

(assert (=> d!9487 (= (containsKey!99 (toList!631 lm!267) key!657) e!30768)))

(declare-fun b!47952 () Bool)

(declare-fun e!30769 () Bool)

(assert (=> b!47952 (= e!30768 e!30769)))

(declare-fun res!27877 () Bool)

(assert (=> b!47952 (=> (not res!27877) (not e!30769))))

(assert (=> b!47952 (= res!27877 (and (or (not (is-Cons!1271 (toList!631 lm!267))) (bvsle (_1!886 (h!1851 (toList!631 lm!267))) key!657)) (is-Cons!1271 (toList!631 lm!267)) (bvslt (_1!886 (h!1851 (toList!631 lm!267))) key!657)))))

(declare-fun b!47953 () Bool)

(assert (=> b!47953 (= e!30769 (containsKey!99 (t!4302 (toList!631 lm!267)) key!657))))

(assert (= (and d!9487 (not res!27876)) b!47952))

(assert (= (and b!47952 res!27877) b!47953))

(declare-fun m!41927 () Bool)

(assert (=> b!47953 m!41927))

(assert (=> b!47944 d!9487))

(declare-fun d!9493 () Bool)

(declare-fun e!30792 () Bool)

(assert (=> d!9493 e!30792))

(declare-fun res!27896 () Bool)

(assert (=> d!9493 (=> res!27896 e!30792)))

(declare-fun lt!20513 () Bool)

(assert (=> d!9493 (= res!27896 (not lt!20513))))

(declare-fun lt!20511 () Bool)

(assert (=> d!9493 (= lt!20513 lt!20511)))

(declare-datatypes ((Unit!1351 0))(
  ( (Unit!1352) )
))
(declare-fun lt!20514 () Unit!1351)

(declare-fun e!30793 () Unit!1351)

(assert (=> d!9493 (= lt!20514 e!30793)))

(declare-fun c!6432 () Bool)

(assert (=> d!9493 (= c!6432 lt!20511)))

(assert (=> d!9493 (= lt!20511 (containsKey!99 (toList!631 lm!267) key!657))))

(assert (=> d!9493 (= (contains!596 lm!267 key!657) lt!20513)))

(declare-fun b!47982 () Bool)

(declare-fun lt!20512 () Unit!1351)

(assert (=> b!47982 (= e!30793 lt!20512)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!68 (List!1275 (_ BitVec 64)) Unit!1351)

(assert (=> b!47982 (= lt!20512 (lemmaContainsKeyImpliesGetValueByKeyDefined!68 (toList!631 lm!267) key!657))))

(declare-datatypes ((Option!117 0))(
  ( (Some!116 (v!2133 B!924)) (None!115) )
))
(declare-fun isDefined!69 (Option!117) Bool)

(declare-fun getValueByKey!111 (List!1275 (_ BitVec 64)) Option!117)

(assert (=> b!47982 (isDefined!69 (getValueByKey!111 (toList!631 lm!267) key!657))))

(declare-fun b!47983 () Bool)

(declare-fun Unit!1353 () Unit!1351)

(assert (=> b!47983 (= e!30793 Unit!1353)))

(declare-fun b!47984 () Bool)

(assert (=> b!47984 (= e!30792 (isDefined!69 (getValueByKey!111 (toList!631 lm!267) key!657)))))

(assert (= (and d!9493 c!6432) b!47982))

(assert (= (and d!9493 (not c!6432)) b!47983))

(assert (= (and d!9493 (not res!27896)) b!47984))

(assert (=> d!9493 m!41925))

(declare-fun m!41935 () Bool)

(assert (=> b!47982 m!41935))

(declare-fun m!41937 () Bool)

(assert (=> b!47982 m!41937))

(assert (=> b!47982 m!41937))

(declare-fun m!41939 () Bool)

(assert (=> b!47982 m!41939))

(assert (=> b!47984 m!41937))

(assert (=> b!47984 m!41937))

(assert (=> b!47984 m!41939))

(assert (=> start!7486 d!9493))

(declare-fun d!9501 () Bool)

(assert (=> d!9501 (= (inv!2230 lm!267) (isStrictlySorted!247 (toList!631 lm!267)))))

(declare-fun bs!2238 () Bool)

(assert (= bs!2238 d!9501))

(assert (=> bs!2238 m!41923))

(assert (=> start!7486 d!9501))

(declare-fun d!9505 () Bool)

(declare-fun res!27908 () Bool)

(declare-fun e!30808 () Bool)

(assert (=> d!9505 (=> res!27908 e!30808)))

(assert (=> d!9505 (= res!27908 (or (is-Nil!1272 (toList!631 lm!267)) (is-Nil!1272 (t!4302 (toList!631 lm!267)))))))

(assert (=> d!9505 (= (isStrictlySorted!247 (toList!631 lm!267)) e!30808)))

(declare-fun b!48002 () Bool)

(declare-fun e!30809 () Bool)

(assert (=> b!48002 (= e!30808 e!30809)))

(declare-fun res!27909 () Bool)

(assert (=> b!48002 (=> (not res!27909) (not e!30809))))

(assert (=> b!48002 (= res!27909 (bvslt (_1!886 (h!1851 (toList!631 lm!267))) (_1!886 (h!1851 (t!4302 (toList!631 lm!267))))))))

(declare-fun b!48003 () Bool)

(assert (=> b!48003 (= e!30809 (isStrictlySorted!247 (t!4302 (toList!631 lm!267))))))

(assert (= (and d!9505 (not res!27908)) b!48002))

(assert (= (and b!48002 res!27909) b!48003))

(declare-fun m!41947 () Bool)

(assert (=> b!48003 m!41947))

(assert (=> b!47943 d!9505))

(declare-fun b!48013 () Bool)

(declare-fun e!30816 () Bool)

(declare-fun tp_is_empty!2071 () Bool)

(declare-fun tp!6338 () Bool)

(assert (=> b!48013 (= e!30816 (and tp_is_empty!2071 tp!6338))))

(assert (=> b!47945 (= tp!6335 e!30816)))

(assert (= (and b!47945 (is-Cons!1271 (toList!631 lm!267))) b!48013))

(push 1)

(assert tp_is_empty!2071)

(assert (not d!9501))

(assert (not b!48003))

(assert (not b!48013))

(assert (not b!47953))

(assert (not b!47982))

(assert (not b!47984))

(assert (not d!9493))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

