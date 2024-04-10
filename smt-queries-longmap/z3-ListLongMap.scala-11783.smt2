; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138424 () Bool)

(assert start!138424)

(declare-fun res!1083356 () Bool)

(declare-fun e!885863 () Bool)

(assert (=> start!138424 (=> (not res!1083356) (not e!885863))))

(declare-datatypes ((B!3040 0))(
  ( (B!3041 (val!19882 Int)) )
))
(declare-datatypes ((tuple2!25932 0))(
  ( (tuple2!25933 (_1!12977 (_ BitVec 64)) (_2!12977 B!3040)) )
))
(declare-datatypes ((List!37002 0))(
  ( (Nil!36999) (Cons!36998 (h!38541 tuple2!25932) (t!51932 List!37002)) )
))
(declare-fun l!636 () List!37002)

(declare-fun isStrictlySorted!1224 (List!37002) Bool)

(assert (=> start!138424 (= res!1083356 (isStrictlySorted!1224 l!636))))

(assert (=> start!138424 e!885863))

(declare-fun e!885864 () Bool)

(assert (=> start!138424 e!885864))

(assert (=> start!138424 true))

(declare-fun b!1586350 () Bool)

(declare-fun key!185 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1586350 (= e!885863 (and (or (not ((_ is Cons!36998) l!636)) (not (= (_1!12977 (h!38541 l!636)) key!185))) (or (not ((_ is Cons!36998) l!636)) (bvsle (_1!12977 (h!38541 l!636)) key!185)) (or (not ((_ is Cons!36998) l!636)) (bvsge (_1!12977 (h!38541 l!636)) key!185)) (not ((_ is Nil!36999) l!636))))))

(declare-fun b!1586351 () Bool)

(declare-fun tp_is_empty!39573 () Bool)

(declare-fun tp!115419 () Bool)

(assert (=> b!1586351 (= e!885864 (and tp_is_empty!39573 tp!115419))))

(assert (= (and start!138424 res!1083356) b!1586350))

(assert (= (and start!138424 ((_ is Cons!36998) l!636)) b!1586351))

(declare-fun m!1454735 () Bool)

(assert (=> start!138424 m!1454735))

(check-sat (not start!138424) (not b!1586351) tp_is_empty!39573)
(check-sat)
