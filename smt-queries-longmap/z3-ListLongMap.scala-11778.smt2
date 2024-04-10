; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138364 () Bool)

(assert start!138364)

(declare-fun res!1083206 () Bool)

(declare-fun e!885647 () Bool)

(assert (=> start!138364 (=> (not res!1083206) (not e!885647))))

(declare-datatypes ((B!3010 0))(
  ( (B!3011 (val!19867 Int)) )
))
(declare-datatypes ((tuple2!25902 0))(
  ( (tuple2!25903 (_1!12962 (_ BitVec 64)) (_2!12962 B!3010)) )
))
(declare-datatypes ((List!36987 0))(
  ( (Nil!36984) (Cons!36983 (h!38526 tuple2!25902) (t!51917 List!36987)) )
))
(declare-fun l!556 () List!36987)

(declare-fun isStrictlySorted!1209 (List!36987) Bool)

(assert (=> start!138364 (= res!1083206 (isStrictlySorted!1209 l!556))))

(assert (=> start!138364 e!885647))

(declare-fun e!885648 () Bool)

(assert (=> start!138364 e!885648))

(assert (=> start!138364 true))

(declare-fun b!1586059 () Bool)

(declare-fun newKey!21 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1586059 (= e!885647 (and (or (not ((_ is Cons!36983) l!556)) (bvsge (_1!12962 (h!38526 l!556)) newKey!21)) (or (not ((_ is Cons!36983) l!556)) (not (= (_1!12962 (h!38526 l!556)) newKey!21))) (or (not ((_ is Cons!36983) l!556)) (bvsle (_1!12962 (h!38526 l!556)) newKey!21)) (not ((_ is Nil!36984) l!556))))))

(declare-fun b!1586060 () Bool)

(declare-fun tp_is_empty!39543 () Bool)

(declare-fun tp!115338 () Bool)

(assert (=> b!1586060 (= e!885648 (and tp_is_empty!39543 tp!115338))))

(assert (= (and start!138364 res!1083206) b!1586059))

(assert (= (and start!138364 ((_ is Cons!36983) l!556)) b!1586060))

(declare-fun m!1454633 () Bool)

(assert (=> start!138364 m!1454633))

(check-sat (not start!138364) (not b!1586060) tp_is_empty!39543)
(check-sat)
