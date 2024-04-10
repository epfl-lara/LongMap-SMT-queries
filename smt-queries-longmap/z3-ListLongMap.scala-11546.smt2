; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134410 () Bool)

(assert start!134410)

(assert (=> start!134410 false))

(assert (=> start!134410 true))

(declare-fun e!874913 () Bool)

(assert (=> start!134410 e!874913))

(declare-fun b!1569453 () Bool)

(declare-fun tp_is_empty!39063 () Bool)

(declare-fun tp!114123 () Bool)

(assert (=> b!1569453 (= e!874913 (and tp_is_empty!39063 tp!114123))))

(declare-datatypes ((B!2512 0))(
  ( (B!2513 (val!19618 Int)) )
))
(declare-datatypes ((tuple2!25338 0))(
  ( (tuple2!25339 (_1!12680 (_ BitVec 64)) (_2!12680 B!2512)) )
))
(declare-datatypes ((List!36738 0))(
  ( (Nil!36735) (Cons!36734 (h!38181 tuple2!25338) (t!51646 List!36738)) )
))
(declare-fun l!750 () List!36738)

(get-info :version)

(assert (= (and start!134410 ((_ is Cons!36734) l!750)) b!1569453))

(check-sat (not b!1569453) tp_is_empty!39063)
(check-sat)
