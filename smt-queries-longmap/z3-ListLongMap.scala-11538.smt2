; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134262 () Bool)

(assert start!134262)

(assert (=> start!134262 false))

(assert (=> start!134262 true))

(declare-fun e!874229 () Bool)

(assert (=> start!134262 e!874229))

(declare-fun b!1568255 () Bool)

(declare-fun tp_is_empty!39013 () Bool)

(declare-fun tp!114022 () Bool)

(assert (=> b!1568255 (= e!874229 (and tp_is_empty!39013 tp!114022))))

(declare-datatypes ((B!2462 0))(
  ( (B!2463 (val!19593 Int)) )
))
(declare-datatypes ((tuple2!25356 0))(
  ( (tuple2!25357 (_1!12689 (_ BitVec 64)) (_2!12689 B!2462)) )
))
(declare-datatypes ((List!36754 0))(
  ( (Nil!36751) (Cons!36750 (h!38198 tuple2!25356) (t!51654 List!36754)) )
))
(declare-fun l!750 () List!36754)

(get-info :version)

(assert (= (and start!134262 ((_ is Cons!36750) l!750)) b!1568255))

(check-sat (not b!1568255) tp_is_empty!39013)
(check-sat)
