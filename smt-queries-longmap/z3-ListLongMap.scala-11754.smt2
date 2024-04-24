; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138330 () Bool)

(assert start!138330)

(declare-fun res!1082581 () Bool)

(declare-fun e!885393 () Bool)

(assert (=> start!138330 (=> (not res!1082581) (not e!885393))))

(declare-datatypes ((B!2852 0))(
  ( (B!2853 (val!19788 Int)) )
))
(declare-datatypes ((tuple2!25804 0))(
  ( (tuple2!25805 (_1!12913 (_ BitVec 64)) (_2!12913 B!2852)) )
))
(declare-datatypes ((List!36940 0))(
  ( (Nil!36937) (Cons!36936 (h!38497 tuple2!25804) (t!51846 List!36940)) )
))
(declare-fun l!548 () List!36940)

(declare-fun isStrictlySorted!1130 (List!36940) Bool)

(assert (=> start!138330 (= res!1082581 (isStrictlySorted!1130 l!548))))

(assert (=> start!138330 e!885393))

(declare-fun e!885394 () Bool)

(assert (=> start!138330 e!885394))

(declare-fun b!1585928 () Bool)

(declare-fun ListPrimitiveSize!211 (List!36940) Int)

(assert (=> b!1585928 (= e!885393 (< (ListPrimitiveSize!211 l!548) 0))))

(declare-fun b!1585929 () Bool)

(declare-fun tp_is_empty!39385 () Bool)

(declare-fun tp!114950 () Bool)

(assert (=> b!1585929 (= e!885394 (and tp_is_empty!39385 tp!114950))))

(assert (= (and start!138330 res!1082581) b!1585928))

(get-info :version)

(assert (= (and start!138330 ((_ is Cons!36936) l!548)) b!1585929))

(declare-fun m!1455627 () Bool)

(assert (=> start!138330 m!1455627))

(declare-fun m!1455629 () Bool)

(assert (=> b!1585928 m!1455629))

(check-sat (not b!1585928) (not start!138330) (not b!1585929) tp_is_empty!39385)
(check-sat)
(get-model)

(declare-fun d!167960 () Bool)

(declare-fun lt!678080 () Int)

(assert (=> d!167960 (>= lt!678080 0)))

(declare-fun e!885415 () Int)

(assert (=> d!167960 (= lt!678080 e!885415)))

(declare-fun c!147539 () Bool)

(assert (=> d!167960 (= c!147539 ((_ is Nil!36937) l!548))))

(assert (=> d!167960 (= (ListPrimitiveSize!211 l!548) lt!678080)))

(declare-fun b!1585954 () Bool)

(assert (=> b!1585954 (= e!885415 0)))

(declare-fun b!1585955 () Bool)

(assert (=> b!1585955 (= e!885415 (+ 1 (ListPrimitiveSize!211 (t!51846 l!548))))))

(assert (= (and d!167960 c!147539) b!1585954))

(assert (= (and d!167960 (not c!147539)) b!1585955))

(declare-fun m!1455639 () Bool)

(assert (=> b!1585955 m!1455639))

(assert (=> b!1585928 d!167960))

(declare-fun d!167965 () Bool)

(declare-fun res!1082602 () Bool)

(declare-fun e!885429 () Bool)

(assert (=> d!167965 (=> res!1082602 e!885429)))

(assert (=> d!167965 (= res!1082602 (or ((_ is Nil!36937) l!548) ((_ is Nil!36937) (t!51846 l!548))))))

(assert (=> d!167965 (= (isStrictlySorted!1130 l!548) e!885429)))

(declare-fun b!1585973 () Bool)

(declare-fun e!885431 () Bool)

(assert (=> b!1585973 (= e!885429 e!885431)))

(declare-fun res!1082603 () Bool)

(assert (=> b!1585973 (=> (not res!1082603) (not e!885431))))

(assert (=> b!1585973 (= res!1082603 (bvslt (_1!12913 (h!38497 l!548)) (_1!12913 (h!38497 (t!51846 l!548)))))))

(declare-fun b!1585975 () Bool)

(assert (=> b!1585975 (= e!885431 (isStrictlySorted!1130 (t!51846 l!548)))))

(assert (= (and d!167965 (not res!1082602)) b!1585973))

(assert (= (and b!1585973 res!1082603) b!1585975))

(declare-fun m!1455647 () Bool)

(assert (=> b!1585975 m!1455647))

(assert (=> start!138330 d!167965))

(declare-fun b!1585986 () Bool)

(declare-fun e!885438 () Bool)

(declare-fun tp!114961 () Bool)

(assert (=> b!1585986 (= e!885438 (and tp_is_empty!39385 tp!114961))))

(assert (=> b!1585929 (= tp!114950 e!885438)))

(assert (= (and b!1585929 ((_ is Cons!36936) (t!51846 l!548))) b!1585986))

(check-sat (not b!1585955) (not b!1585975) (not b!1585986) tp_is_empty!39385)
(check-sat)
