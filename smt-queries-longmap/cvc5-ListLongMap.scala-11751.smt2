; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137878 () Bool)

(assert start!137878)

(declare-fun res!1081621 () Bool)

(declare-fun e!883785 () Bool)

(assert (=> start!137878 (=> (not res!1081621) (not e!883785))))

(declare-datatypes ((B!2846 0))(
  ( (B!2847 (val!19785 Int)) )
))
(declare-datatypes ((tuple2!25738 0))(
  ( (tuple2!25739 (_1!12880 (_ BitVec 64)) (_2!12880 B!2846)) )
))
(declare-datatypes ((List!36905 0))(
  ( (Nil!36902) (Cons!36901 (h!38444 tuple2!25738) (t!51819 List!36905)) )
))
(declare-fun l!548 () List!36905)

(declare-fun isStrictlySorted!1139 (List!36905) Bool)

(assert (=> start!137878 (= res!1081621 (isStrictlySorted!1139 l!548))))

(assert (=> start!137878 e!883785))

(declare-fun e!883786 () Bool)

(assert (=> start!137878 e!883786))

(assert (=> start!137878 true))

(declare-fun b!1583357 () Bool)

(declare-fun res!1081622 () Bool)

(assert (=> b!1583357 (=> (not res!1081622) (not e!883785))))

(declare-fun key!159 () (_ BitVec 64))

(assert (=> b!1583357 (= res!1081622 (and (not (= (_1!12880 (h!38444 l!548)) key!159)) (is-Cons!36901 l!548)))))

(declare-fun b!1583358 () Bool)

(assert (=> b!1583358 (= e!883785 (not (isStrictlySorted!1139 (t!51819 l!548))))))

(declare-fun b!1583359 () Bool)

(declare-fun tp_is_empty!39379 () Bool)

(declare-fun tp!114931 () Bool)

(assert (=> b!1583359 (= e!883786 (and tp_is_empty!39379 tp!114931))))

(assert (= (and start!137878 res!1081621) b!1583357))

(assert (= (and b!1583357 res!1081622) b!1583358))

(assert (= (and start!137878 (is-Cons!36901 l!548)) b!1583359))

(declare-fun m!1453283 () Bool)

(assert (=> start!137878 m!1453283))

(declare-fun m!1453285 () Bool)

(assert (=> b!1583358 m!1453285))

(push 1)

(assert (not b!1583358))

(assert (not start!137878))

(assert (not b!1583359))

(assert tp_is_empty!39379)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167219 () Bool)

(declare-fun res!1081655 () Bool)

(declare-fun e!883824 () Bool)

(assert (=> d!167219 (=> res!1081655 e!883824)))

(assert (=> d!167219 (= res!1081655 (or (is-Nil!36902 (t!51819 l!548)) (is-Nil!36902 (t!51819 (t!51819 l!548)))))))

(assert (=> d!167219 (= (isStrictlySorted!1139 (t!51819 l!548)) e!883824)))

(declare-fun b!1583407 () Bool)

(declare-fun e!883825 () Bool)

(assert (=> b!1583407 (= e!883824 e!883825)))

(declare-fun res!1081656 () Bool)

(assert (=> b!1583407 (=> (not res!1081656) (not e!883825))))

(assert (=> b!1583407 (= res!1081656 (bvslt (_1!12880 (h!38444 (t!51819 l!548))) (_1!12880 (h!38444 (t!51819 (t!51819 l!548))))))))

(declare-fun b!1583408 () Bool)

(assert (=> b!1583408 (= e!883825 (isStrictlySorted!1139 (t!51819 (t!51819 l!548))))))

(assert (= (and d!167219 (not res!1081655)) b!1583407))

(assert (= (and b!1583407 res!1081656) b!1583408))

(declare-fun m!1453299 () Bool)

(assert (=> b!1583408 m!1453299))

(assert (=> b!1583358 d!167219))

(declare-fun d!167225 () Bool)

(declare-fun res!1081657 () Bool)

(declare-fun e!883827 () Bool)

(assert (=> d!167225 (=> res!1081657 e!883827)))

(assert (=> d!167225 (= res!1081657 (or (is-Nil!36902 l!548) (is-Nil!36902 (t!51819 l!548))))))

(assert (=> d!167225 (= (isStrictlySorted!1139 l!548) e!883827)))

(declare-fun b!1583410 () Bool)

(declare-fun e!883828 () Bool)

(assert (=> b!1583410 (= e!883827 e!883828)))

(declare-fun res!1081658 () Bool)

(assert (=> b!1583410 (=> (not res!1081658) (not e!883828))))

(assert (=> b!1583410 (= res!1081658 (bvslt (_1!12880 (h!38444 l!548)) (_1!12880 (h!38444 (t!51819 l!548)))))))

(declare-fun b!1583411 () Bool)

(assert (=> b!1583411 (= e!883828 (isStrictlySorted!1139 (t!51819 l!548)))))

(assert (= (and d!167225 (not res!1081657)) b!1583410))

(assert (= (and b!1583410 res!1081658) b!1583411))

(assert (=> b!1583411 m!1453285))

(assert (=> start!137878 d!167225))

(declare-fun b!1583416 () Bool)

(declare-fun e!883831 () Bool)

(declare-fun tp!114946 () Bool)

(assert (=> b!1583416 (= e!883831 (and tp_is_empty!39379 tp!114946))))

(assert (=> b!1583359 (= tp!114931 e!883831)))

(assert (= (and b!1583359 (is-Cons!36901 (t!51819 l!548))) b!1583416))

(push 1)

