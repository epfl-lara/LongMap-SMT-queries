; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88606 () Bool)

(assert start!88606)

(declare-fun res!682867 () Bool)

(declare-fun e!572984 () Bool)

(assert (=> start!88606 (=> (not res!682867) (not e!572984))))

(declare-datatypes ((B!1646 0))(
  ( (B!1647 (val!11907 Int)) )
))
(declare-datatypes ((tuple2!15360 0))(
  ( (tuple2!15361 (_1!7691 (_ BitVec 64)) (_2!7691 B!1646)) )
))
(declare-datatypes ((List!21595 0))(
  ( (Nil!21592) (Cons!21591 (h!22789 tuple2!15360) (t!30596 List!21595)) )
))
(declare-fun l!996 () List!21595)

(declare-fun isStrictlySorted!660 (List!21595) Bool)

(assert (=> start!88606 (= res!682867 (isStrictlySorted!660 l!996))))

(assert (=> start!88606 e!572984))

(declare-fun e!572985 () Bool)

(assert (=> start!88606 e!572985))

(assert (=> start!88606 true))

(declare-fun tp_is_empty!23713 () Bool)

(assert (=> start!88606 tp_is_empty!23713))

(declare-fun b!1018353 () Bool)

(declare-fun res!682868 () Bool)

(assert (=> b!1018353 (=> (not res!682868) (not e!572984))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!520 (List!21595 (_ BitVec 64)) Bool)

(assert (=> b!1018353 (= res!682868 (containsKey!520 l!996 key!261))))

(declare-fun b!1018354 () Bool)

(assert (=> b!1018354 (= e!572984 false)))

(declare-fun lt!449535 () List!21595)

(declare-fun value!172 () B!1646)

(declare-fun insertStrictlySorted!341 (List!21595 (_ BitVec 64) B!1646) List!21595)

(assert (=> b!1018354 (= lt!449535 (insertStrictlySorted!341 l!996 key!261 value!172))))

(declare-fun b!1018355 () Bool)

(declare-fun tp!71038 () Bool)

(assert (=> b!1018355 (= e!572985 (and tp_is_empty!23713 tp!71038))))

(assert (= (and start!88606 res!682867) b!1018353))

(assert (= (and b!1018353 res!682868) b!1018354))

(assert (= (and start!88606 (is-Cons!21591 l!996)) b!1018355))

(declare-fun m!939265 () Bool)

(assert (=> start!88606 m!939265))

(declare-fun m!939267 () Bool)

(assert (=> b!1018353 m!939267))

(declare-fun m!939269 () Bool)

(assert (=> b!1018354 m!939269))

(push 1)

(assert (not b!1018355))

(assert (not b!1018353))

(assert (not start!88606))

(assert (not b!1018354))

(assert tp_is_empty!23713)

(check-sat)

(pop 1)

