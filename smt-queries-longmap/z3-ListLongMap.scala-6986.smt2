; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88580 () Bool)

(assert start!88580)

(assert (=> start!88580 false))

(declare-fun e!572822 () Bool)

(assert (=> start!88580 e!572822))

(assert (=> start!88580 true))

(declare-fun b!1018087 () Bool)

(declare-fun tp_is_empty!23689 () Bool)

(declare-fun tp!71002 () Bool)

(assert (=> b!1018087 (= e!572822 (and tp_is_empty!23689 tp!71002))))

(declare-datatypes ((B!1622 0))(
  ( (B!1623 (val!11895 Int)) )
))
(declare-datatypes ((tuple2!15416 0))(
  ( (tuple2!15417 (_1!7719 (_ BitVec 64)) (_2!7719 B!1622)) )
))
(declare-datatypes ((List!21618 0))(
  ( (Nil!21615) (Cons!21614 (h!22812 tuple2!15416) (t!30610 List!21618)) )
))
(declare-fun l!996 () List!21618)

(get-info :version)

(assert (= (and start!88580 ((_ is Cons!21614) l!996)) b!1018087))

(check-sat (not b!1018087) tp_is_empty!23689)
(check-sat)
