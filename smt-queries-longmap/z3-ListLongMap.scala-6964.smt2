; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87938 () Bool)

(assert start!87938)

(assert (=> start!87938 false))

(declare-fun e!571363 () Bool)

(assert (=> start!87938 e!571363))

(assert (=> start!87938 true))

(declare-fun tp_is_empty!23559 () Bool)

(assert (=> start!87938 tp_is_empty!23559))

(declare-fun b!1015625 () Bool)

(declare-fun tp!70676 () Bool)

(assert (=> b!1015625 (= e!571363 (and tp_is_empty!23559 tp!70676))))

(declare-datatypes ((B!1492 0))(
  ( (B!1493 (val!11830 Int)) )
))
(declare-datatypes ((tuple2!15206 0))(
  ( (tuple2!15207 (_1!7614 (_ BitVec 64)) (_2!7614 B!1492)) )
))
(declare-datatypes ((List!21485 0))(
  ( (Nil!21482) (Cons!21481 (h!22679 tuple2!15206) (t!30486 List!21485)) )
))
(declare-fun l!1114 () List!21485)

(get-info :version)

(assert (= (and start!87938 ((_ is Cons!21481) l!1114)) b!1015625))

(check-sat (not b!1015625) tp_is_empty!23559)
(check-sat)
