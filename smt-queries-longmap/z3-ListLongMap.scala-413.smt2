; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7770 () Bool)

(assert start!7770)

(assert (=> start!7770 false))

(declare-fun e!31732 () Bool)

(assert (=> start!7770 e!31732))

(assert (=> start!7770 true))

(declare-fun b!49400 () Bool)

(declare-fun tp_is_empty!2145 () Bool)

(declare-fun tp!6518 () Bool)

(assert (=> b!49400 (= e!31732 (and tp_is_empty!2145 tp!6518))))

(declare-datatypes ((B!994 0))(
  ( (B!995 (val!1117 Int)) )
))
(declare-datatypes ((tuple2!1816 0))(
  ( (tuple2!1817 (_1!919 (_ BitVec 64)) (_2!919 B!994)) )
))
(declare-datatypes ((List!1314 0))(
  ( (Nil!1311) (Cons!1310 (h!1890 tuple2!1816) (t!4348 List!1314)) )
))
(declare-fun l!1333 () List!1314)

(get-info :version)

(assert (= (and start!7770 ((_ is Cons!1310) l!1333)) b!49400))

(check-sat (not b!49400) tp_is_empty!2145)
(check-sat)
