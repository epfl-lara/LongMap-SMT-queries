; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88144 () Bool)

(assert start!88144)

(assert (=> start!88144 false))

(declare-fun e!572145 () Bool)

(assert (=> start!88144 e!572145))

(declare-fun b!1016848 () Bool)

(declare-fun tp_is_empty!23545 () Bool)

(declare-fun tp!70647 () Bool)

(assert (=> b!1016848 (= e!572145 (and tp_is_empty!23545 tp!70647))))

(declare-datatypes ((B!1478 0))(
  ( (B!1479 (val!11823 Int)) )
))
(declare-datatypes ((tuple2!15196 0))(
  ( (tuple2!15197 (_1!7609 (_ BitVec 64)) (_2!7609 B!1478)) )
))
(declare-datatypes ((List!21464 0))(
  ( (Nil!21461) (Cons!21460 (h!22667 tuple2!15196) (t!30457 List!21464)) )
))
(declare-fun l!1114 () List!21464)

(get-info :version)

(assert (= (and start!88144 ((_ is Cons!21460) l!1114)) b!1016848))

(check-sat (not b!1016848) tp_is_empty!23545)
(check-sat)
