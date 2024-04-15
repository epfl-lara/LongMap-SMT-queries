; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137492 () Bool)

(assert start!137492)

(assert (=> start!137492 false))

(declare-fun e!882530 () Bool)

(assert (=> start!137492 e!882530))

(declare-fun b!1581582 () Bool)

(declare-fun tp_is_empty!39265 () Bool)

(declare-fun tp!114633 () Bool)

(assert (=> b!1581582 (= e!882530 (and tp_is_empty!39265 tp!114633))))

(declare-datatypes ((B!2720 0))(
  ( (B!2721 (val!19722 Int)) )
))
(declare-datatypes ((tuple2!25680 0))(
  ( (tuple2!25681 (_1!12851 (_ BitVec 64)) (_2!12851 B!2720)) )
))
(declare-datatypes ((List!36883 0))(
  ( (Nil!36880) (Cons!36879 (h!38423 tuple2!25680) (t!51789 List!36883)) )
))
(declare-fun l!1356 () List!36883)

(get-info :version)

(assert (= (and start!137492 ((_ is Cons!36879) l!1356)) b!1581582))

(check-sat (not b!1581582) tp_is_empty!39265)
(check-sat)
