; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137880 () Bool)

(assert start!137880)

(declare-fun res!1081627 () Bool)

(declare-fun e!883791 () Bool)

(assert (=> start!137880 (=> (not res!1081627) (not e!883791))))

(declare-datatypes ((B!2848 0))(
  ( (B!2849 (val!19786 Int)) )
))
(declare-datatypes ((tuple2!25740 0))(
  ( (tuple2!25741 (_1!12881 (_ BitVec 64)) (_2!12881 B!2848)) )
))
(declare-datatypes ((List!36906 0))(
  ( (Nil!36903) (Cons!36902 (h!38445 tuple2!25740) (t!51820 List!36906)) )
))
(declare-fun l!548 () List!36906)

(declare-fun isStrictlySorted!1140 (List!36906) Bool)

(assert (=> start!137880 (= res!1081627 (isStrictlySorted!1140 l!548))))

(assert (=> start!137880 e!883791))

(declare-fun e!883792 () Bool)

(assert (=> start!137880 e!883792))

(assert (=> start!137880 true))

(declare-fun b!1583366 () Bool)

(declare-fun res!1081628 () Bool)

(assert (=> b!1583366 (=> (not res!1081628) (not e!883791))))

(declare-fun key!159 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1583366 (= res!1081628 (and (not (= (_1!12881 (h!38445 l!548)) key!159)) ((_ is Cons!36902) l!548)))))

(declare-fun b!1583367 () Bool)

(assert (=> b!1583367 (= e!883791 (not (isStrictlySorted!1140 (t!51820 l!548))))))

(declare-fun b!1583368 () Bool)

(declare-fun tp_is_empty!39381 () Bool)

(declare-fun tp!114934 () Bool)

(assert (=> b!1583368 (= e!883792 (and tp_is_empty!39381 tp!114934))))

(assert (= (and start!137880 res!1081627) b!1583366))

(assert (= (and b!1583366 res!1081628) b!1583367))

(assert (= (and start!137880 ((_ is Cons!36902) l!548)) b!1583368))

(declare-fun m!1453287 () Bool)

(assert (=> start!137880 m!1453287))

(declare-fun m!1453289 () Bool)

(assert (=> b!1583367 m!1453289))

(check-sat (not start!137880) (not b!1583367) (not b!1583368) tp_is_empty!39381)
(check-sat)
(get-model)

(declare-fun d!167215 () Bool)

(declare-fun res!1081643 () Bool)

(declare-fun e!883807 () Bool)

(assert (=> d!167215 (=> res!1081643 e!883807)))

(assert (=> d!167215 (= res!1081643 (or ((_ is Nil!36903) l!548) ((_ is Nil!36903) (t!51820 l!548))))))

(assert (=> d!167215 (= (isStrictlySorted!1140 l!548) e!883807)))

(declare-fun b!1583386 () Bool)

(declare-fun e!883808 () Bool)

(assert (=> b!1583386 (= e!883807 e!883808)))

(declare-fun res!1081644 () Bool)

(assert (=> b!1583386 (=> (not res!1081644) (not e!883808))))

(assert (=> b!1583386 (= res!1081644 (bvslt (_1!12881 (h!38445 l!548)) (_1!12881 (h!38445 (t!51820 l!548)))))))

(declare-fun b!1583387 () Bool)

(assert (=> b!1583387 (= e!883808 (isStrictlySorted!1140 (t!51820 l!548)))))

(assert (= (and d!167215 (not res!1081643)) b!1583386))

(assert (= (and b!1583386 res!1081644) b!1583387))

(assert (=> b!1583387 m!1453289))

(assert (=> start!137880 d!167215))

(declare-fun d!167221 () Bool)

(declare-fun res!1081649 () Bool)

(declare-fun e!883813 () Bool)

(assert (=> d!167221 (=> res!1081649 e!883813)))

(assert (=> d!167221 (= res!1081649 (or ((_ is Nil!36903) (t!51820 l!548)) ((_ is Nil!36903) (t!51820 (t!51820 l!548)))))))

(assert (=> d!167221 (= (isStrictlySorted!1140 (t!51820 l!548)) e!883813)))

(declare-fun b!1583390 () Bool)

(declare-fun e!883814 () Bool)

(assert (=> b!1583390 (= e!883813 e!883814)))

(declare-fun res!1081650 () Bool)

(assert (=> b!1583390 (=> (not res!1081650) (not e!883814))))

(assert (=> b!1583390 (= res!1081650 (bvslt (_1!12881 (h!38445 (t!51820 l!548))) (_1!12881 (h!38445 (t!51820 (t!51820 l!548))))))))

(declare-fun b!1583391 () Bool)

(assert (=> b!1583391 (= e!883814 (isStrictlySorted!1140 (t!51820 (t!51820 l!548))))))

(assert (= (and d!167221 (not res!1081649)) b!1583390))

(assert (= (and b!1583390 res!1081650) b!1583391))

(declare-fun m!1453295 () Bool)

(assert (=> b!1583391 m!1453295))

(assert (=> b!1583367 d!167221))

(declare-fun b!1583406 () Bool)

(declare-fun e!883823 () Bool)

(declare-fun tp!114940 () Bool)

(assert (=> b!1583406 (= e!883823 (and tp_is_empty!39381 tp!114940))))

(assert (=> b!1583368 (= tp!114934 e!883823)))

(assert (= (and b!1583368 ((_ is Cons!36902) (t!51820 l!548))) b!1583406))

(check-sat (not b!1583391) (not b!1583387) (not b!1583406) tp_is_empty!39381)
(check-sat)
