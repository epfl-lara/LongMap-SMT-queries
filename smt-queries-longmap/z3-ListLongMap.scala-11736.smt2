; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137618 () Bool)

(assert start!137618)

(assert (=> start!137618 false))

(declare-fun e!882941 () Bool)

(assert (=> start!137618 e!882941))

(assert (=> start!137618 true))

(declare-fun b!1582125 () Bool)

(declare-fun tp_is_empty!39301 () Bool)

(declare-fun tp!114732 () Bool)

(assert (=> b!1582125 (= e!882941 (and tp_is_empty!39301 tp!114732))))

(declare-datatypes ((B!2756 0))(
  ( (B!2757 (val!19740 Int)) )
))
(declare-datatypes ((tuple2!25716 0))(
  ( (tuple2!25717 (_1!12869 (_ BitVec 64)) (_2!12869 B!2756)) )
))
(declare-datatypes ((List!36901 0))(
  ( (Nil!36898) (Cons!36897 (h!38441 tuple2!25716) (t!51807 List!36901)) )
))
(declare-fun l!1356 () List!36901)

(get-info :version)

(assert (= (and start!137618 ((_ is Cons!36897) l!1356)) b!1582125))

(check-sat (not b!1582125) tp_is_empty!39301)
(check-sat)
