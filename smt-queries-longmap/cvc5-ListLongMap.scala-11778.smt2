; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138362 () Bool)

(assert start!138362)

(declare-fun res!1083203 () Bool)

(declare-fun e!885641 () Bool)

(assert (=> start!138362 (=> (not res!1083203) (not e!885641))))

(declare-datatypes ((B!3008 0))(
  ( (B!3009 (val!19866 Int)) )
))
(declare-datatypes ((tuple2!25900 0))(
  ( (tuple2!25901 (_1!12961 (_ BitVec 64)) (_2!12961 B!3008)) )
))
(declare-datatypes ((List!36986 0))(
  ( (Nil!36983) (Cons!36982 (h!38525 tuple2!25900) (t!51916 List!36986)) )
))
(declare-fun l!556 () List!36986)

(declare-fun isStrictlySorted!1208 (List!36986) Bool)

(assert (=> start!138362 (= res!1083203 (isStrictlySorted!1208 l!556))))

(assert (=> start!138362 e!885641))

(declare-fun e!885642 () Bool)

(assert (=> start!138362 e!885642))

(assert (=> start!138362 true))

(declare-fun b!1586053 () Bool)

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1586053 (= e!885641 (and (or (not (is-Cons!36982 l!556)) (bvsge (_1!12961 (h!38525 l!556)) newKey!21)) (or (not (is-Cons!36982 l!556)) (not (= (_1!12961 (h!38525 l!556)) newKey!21))) (or (not (is-Cons!36982 l!556)) (bvsle (_1!12961 (h!38525 l!556)) newKey!21)) (not (is-Nil!36983 l!556))))))

(declare-fun b!1586054 () Bool)

(declare-fun tp_is_empty!39541 () Bool)

(declare-fun tp!115335 () Bool)

(assert (=> b!1586054 (= e!885642 (and tp_is_empty!39541 tp!115335))))

(assert (= (and start!138362 res!1083203) b!1586053))

(assert (= (and start!138362 (is-Cons!36982 l!556)) b!1586054))

(declare-fun m!1454631 () Bool)

(assert (=> start!138362 m!1454631))

(push 1)

(assert (not start!138362))

(assert (not b!1586054))

(assert tp_is_empty!39541)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

