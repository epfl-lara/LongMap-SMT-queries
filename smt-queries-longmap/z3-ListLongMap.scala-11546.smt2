; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134358 () Bool)

(assert start!134358)

(assert (=> start!134358 false))

(assert (=> start!134358 true))

(declare-fun e!874712 () Bool)

(assert (=> start!134358 e!874712))

(declare-fun b!1569137 () Bool)

(declare-fun tp_is_empty!39061 () Bool)

(declare-fun tp!114121 () Bool)

(assert (=> b!1569137 (= e!874712 (and tp_is_empty!39061 tp!114121))))

(declare-datatypes ((B!2510 0))(
  ( (B!2511 (val!19617 Int)) )
))
(declare-datatypes ((tuple2!25404 0))(
  ( (tuple2!25405 (_1!12713 (_ BitVec 64)) (_2!12713 B!2510)) )
))
(declare-datatypes ((List!36778 0))(
  ( (Nil!36775) (Cons!36774 (h!38222 tuple2!25404) (t!51678 List!36778)) )
))
(declare-fun l!750 () List!36778)

(get-info :version)

(assert (= (and start!134358 ((_ is Cons!36774) l!750)) b!1569137))

(check-sat (not b!1569137) tp_is_empty!39061)
(check-sat)
