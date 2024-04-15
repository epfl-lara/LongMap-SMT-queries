; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137856 () Bool)

(assert start!137856)

(declare-fun res!1081532 () Bool)

(declare-fun e!883638 () Bool)

(assert (=> start!137856 (=> (not res!1081532) (not e!883638))))

(declare-datatypes ((B!2852 0))(
  ( (B!2853 (val!19788 Int)) )
))
(declare-datatypes ((tuple2!25812 0))(
  ( (tuple2!25813 (_1!12917 (_ BitVec 64)) (_2!12917 B!2852)) )
))
(declare-datatypes ((List!36949 0))(
  ( (Nil!36946) (Cons!36945 (h!38489 tuple2!25812) (t!51855 List!36949)) )
))
(declare-fun l!548 () List!36949)

(declare-fun isStrictlySorted!1140 (List!36949) Bool)

(assert (=> start!137856 (= res!1081532 (isStrictlySorted!1140 l!548))))

(assert (=> start!137856 e!883638))

(declare-fun e!883639 () Bool)

(assert (=> start!137856 e!883639))

(declare-fun b!1583108 () Bool)

(declare-fun ListPrimitiveSize!211 (List!36949) Int)

(assert (=> b!1583108 (= e!883638 (< (ListPrimitiveSize!211 l!548) 0))))

(declare-fun b!1583109 () Bool)

(declare-fun tp_is_empty!39385 () Bool)

(declare-fun tp!114950 () Bool)

(assert (=> b!1583109 (= e!883639 (and tp_is_empty!39385 tp!114950))))

(assert (= (and start!137856 res!1081532) b!1583108))

(get-info :version)

(assert (= (and start!137856 ((_ is Cons!36945) l!548)) b!1583109))

(declare-fun m!1452421 () Bool)

(assert (=> start!137856 m!1452421))

(declare-fun m!1452423 () Bool)

(assert (=> b!1583108 m!1452423))

(check-sat (not start!137856) (not b!1583108) (not b!1583109) tp_is_empty!39385)
(check-sat)
(get-model)

(declare-fun d!166991 () Bool)

(declare-fun res!1081547 () Bool)

(declare-fun e!883662 () Bool)

(assert (=> d!166991 (=> res!1081547 e!883662)))

(assert (=> d!166991 (= res!1081547 (or ((_ is Nil!36946) l!548) ((_ is Nil!36946) (t!51855 l!548))))))

(assert (=> d!166991 (= (isStrictlySorted!1140 l!548) e!883662)))

(declare-fun b!1583134 () Bool)

(declare-fun e!883663 () Bool)

(assert (=> b!1583134 (= e!883662 e!883663)))

(declare-fun res!1081548 () Bool)

(assert (=> b!1583134 (=> (not res!1081548) (not e!883663))))

(assert (=> b!1583134 (= res!1081548 (bvslt (_1!12917 (h!38489 l!548)) (_1!12917 (h!38489 (t!51855 l!548)))))))

(declare-fun b!1583135 () Bool)

(assert (=> b!1583135 (= e!883663 (isStrictlySorted!1140 (t!51855 l!548)))))

(assert (= (and d!166991 (not res!1081547)) b!1583134))

(assert (= (and b!1583134 res!1081548) b!1583135))

(declare-fun m!1452433 () Bool)

(assert (=> b!1583135 m!1452433))

(assert (=> start!137856 d!166991))

(declare-fun d!166997 () Bool)

(declare-fun lt!676891 () Int)

(assert (=> d!166997 (>= lt!676891 0)))

(declare-fun e!883673 () Int)

(assert (=> d!166997 (= lt!676891 e!883673)))

(declare-fun c!146648 () Bool)

(assert (=> d!166997 (= c!146648 ((_ is Nil!36946) l!548))))

(assert (=> d!166997 (= (ListPrimitiveSize!211 l!548) lt!676891)))

(declare-fun b!1583150 () Bool)

(assert (=> b!1583150 (= e!883673 0)))

(declare-fun b!1583151 () Bool)

(assert (=> b!1583151 (= e!883673 (+ 1 (ListPrimitiveSize!211 (t!51855 l!548))))))

(assert (= (and d!166997 c!146648) b!1583150))

(assert (= (and d!166997 (not c!146648)) b!1583151))

(declare-fun m!1452439 () Bool)

(assert (=> b!1583151 m!1452439))

(assert (=> b!1583108 d!166997))

(declare-fun b!1583158 () Bool)

(declare-fun e!883678 () Bool)

(declare-fun tp!114959 () Bool)

(assert (=> b!1583158 (= e!883678 (and tp_is_empty!39385 tp!114959))))

(assert (=> b!1583109 (= tp!114950 e!883678)))

(assert (= (and b!1583109 ((_ is Cons!36945) (t!51855 l!548))) b!1583158))

(check-sat (not b!1583151) (not b!1583135) (not b!1583158) tp_is_empty!39385)
(check-sat)
