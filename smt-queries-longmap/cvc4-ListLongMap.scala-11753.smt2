; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137912 () Bool)

(assert start!137912)

(declare-fun res!1081703 () Bool)

(declare-fun e!883902 () Bool)

(assert (=> start!137912 (=> (not res!1081703) (not e!883902))))

(declare-datatypes ((B!2862 0))(
  ( (B!2863 (val!19793 Int)) )
))
(declare-datatypes ((tuple2!25754 0))(
  ( (tuple2!25755 (_1!12888 (_ BitVec 64)) (_2!12888 B!2862)) )
))
(declare-datatypes ((List!36913 0))(
  ( (Nil!36910) (Cons!36909 (h!38452 tuple2!25754) (t!51827 List!36913)) )
))
(declare-fun l!548 () List!36913)

(declare-fun isStrictlySorted!1147 (List!36913) Bool)

(assert (=> start!137912 (= res!1081703 (isStrictlySorted!1147 l!548))))

(assert (=> start!137912 e!883902))

(declare-fun e!883903 () Bool)

(assert (=> start!137912 e!883903))

(assert (=> start!137912 true))

(declare-fun b!1583510 () Bool)

(declare-fun res!1081702 () Bool)

(assert (=> b!1583510 (=> (not res!1081702) (not e!883902))))

(declare-fun key!159 () (_ BitVec 64))

(assert (=> b!1583510 (= res!1081702 (and (not (= (_1!12888 (h!38452 l!548)) key!159)) (is-Cons!36909 l!548)))))

(declare-fun b!1583511 () Bool)

(declare-fun ListPrimitiveSize!216 (List!36913) Int)

(assert (=> b!1583511 (= e!883902 (>= (ListPrimitiveSize!216 (t!51827 l!548)) (ListPrimitiveSize!216 l!548)))))

(declare-fun b!1583512 () Bool)

(declare-fun tp_is_empty!39395 () Bool)

(declare-fun tp!114973 () Bool)

(assert (=> b!1583512 (= e!883903 (and tp_is_empty!39395 tp!114973))))

(assert (= (and start!137912 res!1081703) b!1583510))

(assert (= (and b!1583510 res!1081702) b!1583511))

(assert (= (and start!137912 (is-Cons!36909 l!548)) b!1583512))

(declare-fun m!1453337 () Bool)

(assert (=> start!137912 m!1453337))

(declare-fun m!1453339 () Bool)

(assert (=> b!1583511 m!1453339))

(declare-fun m!1453341 () Bool)

(assert (=> b!1583511 m!1453341))

(push 1)

(assert (not start!137912))

(assert (not b!1583511))

(assert (not b!1583512))

(assert tp_is_empty!39395)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167245 () Bool)

(declare-fun res!1081718 () Bool)

(declare-fun e!883918 () Bool)

(assert (=> d!167245 (=> res!1081718 e!883918)))

(assert (=> d!167245 (= res!1081718 (or (is-Nil!36910 l!548) (is-Nil!36910 (t!51827 l!548))))))

(assert (=> d!167245 (= (isStrictlySorted!1147 l!548) e!883918)))

(declare-fun b!1583527 () Bool)

(declare-fun e!883919 () Bool)

(assert (=> b!1583527 (= e!883918 e!883919)))

(declare-fun res!1081719 () Bool)

(assert (=> b!1583527 (=> (not res!1081719) (not e!883919))))

(assert (=> b!1583527 (= res!1081719 (bvslt (_1!12888 (h!38452 l!548)) (_1!12888 (h!38452 (t!51827 l!548)))))))

(declare-fun b!1583528 () Bool)

(assert (=> b!1583528 (= e!883919 (isStrictlySorted!1147 (t!51827 l!548)))))

(assert (= (and d!167245 (not res!1081718)) b!1583527))

(assert (= (and b!1583527 res!1081719) b!1583528))

(declare-fun m!1453345 () Bool)

(assert (=> b!1583528 m!1453345))

(assert (=> start!137912 d!167245))

(declare-fun d!167251 () Bool)

(declare-fun lt!677184 () Int)

(assert (=> d!167251 (>= lt!677184 0)))

(declare-fun e!883932 () Int)

(assert (=> d!167251 (= lt!677184 e!883932)))

(declare-fun c!146747 () Bool)

(assert (=> d!167251 (= c!146747 (is-Nil!36910 (t!51827 l!548)))))

(assert (=> d!167251 (= (ListPrimitiveSize!216 (t!51827 l!548)) lt!677184)))

(declare-fun b!1583551 () Bool)

(assert (=> b!1583551 (= e!883932 0)))

(declare-fun b!1583552 () Bool)

(assert (=> b!1583552 (= e!883932 (+ 1 (ListPrimitiveSize!216 (t!51827 (t!51827 l!548)))))))

(assert (= (and d!167251 c!146747) b!1583551))

(assert (= (and d!167251 (not c!146747)) b!1583552))

(declare-fun m!1453351 () Bool)

(assert (=> b!1583552 m!1453351))

(assert (=> b!1583511 d!167251))

(declare-fun d!167257 () Bool)

(declare-fun lt!677185 () Int)

(assert (=> d!167257 (>= lt!677185 0)))

(declare-fun e!883934 () Int)

(assert (=> d!167257 (= lt!677185 e!883934)))

(declare-fun c!146748 () Bool)

(assert (=> d!167257 (= c!146748 (is-Nil!36910 l!548))))

(assert (=> d!167257 (= (ListPrimitiveSize!216 l!548) lt!677185)))

(declare-fun b!1583554 () Bool)

(assert (=> b!1583554 (= e!883934 0)))

(declare-fun b!1583555 () Bool)

