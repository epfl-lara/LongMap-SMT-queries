; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134314 () Bool)

(assert start!134314)

(assert (=> start!134314 false))

(assert (=> start!134314 true))

(declare-fun e!874430 () Bool)

(assert (=> start!134314 e!874430))

(declare-fun b!1568571 () Bool)

(declare-fun tp_is_empty!39015 () Bool)

(declare-fun tp!114024 () Bool)

(assert (=> b!1568571 (= e!874430 (and tp_is_empty!39015 tp!114024))))

(declare-datatypes ((B!2464 0))(
  ( (B!2465 (val!19594 Int)) )
))
(declare-datatypes ((tuple2!25290 0))(
  ( (tuple2!25291 (_1!12656 (_ BitVec 64)) (_2!12656 B!2464)) )
))
(declare-datatypes ((List!36714 0))(
  ( (Nil!36711) (Cons!36710 (h!38157 tuple2!25290) (t!51622 List!36714)) )
))
(declare-fun l!750 () List!36714)

(get-info :version)

(assert (= (and start!134314 ((_ is Cons!36710) l!750)) b!1568571))

(check-sat (not b!1568571) tp_is_empty!39015)
(check-sat)
