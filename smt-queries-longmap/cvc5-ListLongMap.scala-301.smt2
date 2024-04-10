; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5236 () Bool)

(assert start!5236)

(declare-datatypes ((B!794 0))(
  ( (B!795 (val!897 Int)) )
))
(declare-datatypes ((tuple2!1454 0))(
  ( (tuple2!1455 (_1!738 (_ BitVec 64)) (_2!738 B!794)) )
))
(declare-datatypes ((List!1007 0))(
  ( (Nil!1004) (Cons!1003 (h!1571 tuple2!1454) (t!3840 List!1007)) )
))
(declare-datatypes ((ListLongMap!1031 0))(
  ( (ListLongMap!1032 (toList!531 List!1007)) )
))
(declare-fun lm!266 () ListLongMap!1031)

(declare-fun isStrictlySorted!203 (List!1007) Bool)

(assert (=> start!5236 (not (isStrictlySorted!203 (toList!531 lm!266)))))

(declare-fun e!24166 () Bool)

(declare-fun inv!1707 (ListLongMap!1031) Bool)

(assert (=> start!5236 (and (inv!1707 lm!266) e!24166)))

(declare-fun b!38020 () Bool)

(declare-fun tp!5651 () Bool)

(assert (=> b!38020 (= e!24166 tp!5651)))

(assert (= start!5236 b!38020))

(declare-fun m!30709 () Bool)

(assert (=> start!5236 m!30709))

(declare-fun m!30711 () Bool)

(assert (=> start!5236 m!30711))

(push 1)

(assert (not start!5236))

(assert (not b!38020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6159 () Bool)

(declare-fun res!22973 () Bool)

(declare-fun e!24189 () Bool)

(assert (=> d!6159 (=> res!22973 e!24189)))

(assert (=> d!6159 (= res!22973 (or (is-Nil!1004 (toList!531 lm!266)) (is-Nil!1004 (t!3840 (toList!531 lm!266)))))))

(assert (=> d!6159 (= (isStrictlySorted!203 (toList!531 lm!266)) e!24189)))

(declare-fun b!38045 () Bool)

(declare-fun e!24191 () Bool)

(assert (=> b!38045 (= e!24189 e!24191)))

(declare-fun res!22974 () Bool)

(assert (=> b!38045 (=> (not res!22974) (not e!24191))))

(assert (=> b!38045 (= res!22974 (bvslt (_1!738 (h!1571 (toList!531 lm!266))) (_1!738 (h!1571 (t!3840 (toList!531 lm!266))))))))

(declare-fun b!38047 () Bool)

(assert (=> b!38047 (= e!24191 (isStrictlySorted!203 (t!3840 (toList!531 lm!266))))))

(assert (= (and d!6159 (not res!22973)) b!38045))

(assert (= (and b!38045 res!22974) b!38047))

(declare-fun m!30725 () Bool)

(assert (=> b!38047 m!30725))

(assert (=> start!5236 d!6159))

(declare-fun d!6165 () Bool)

(assert (=> d!6165 (= (inv!1707 lm!266) (isStrictlySorted!203 (toList!531 lm!266)))))

(declare-fun bs!1521 () Bool)

(assert (= bs!1521 d!6165))

(assert (=> bs!1521 m!30709))

(assert (=> start!5236 d!6165))

(declare-fun b!38059 () Bool)

(declare-fun e!24199 () Bool)

(declare-fun tp_is_empty!1721 () Bool)

(declare-fun tp!5666 () Bool)

(assert (=> b!38059 (= e!24199 (and tp_is_empty!1721 tp!5666))))

(assert (=> b!38020 (= tp!5651 e!24199)))

(assert (= (and b!38020 (is-Cons!1003 (toList!531 lm!266))) b!38059))

(push 1)

