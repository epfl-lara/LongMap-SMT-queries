; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7774 () Bool)

(assert start!7774)

(assert (=> start!7774 false))

(declare-fun e!31692 () Bool)

(assert (=> start!7774 e!31692))

(assert (=> start!7774 true))

(declare-fun b!49340 () Bool)

(declare-fun tp_is_empty!2143 () Bool)

(declare-fun tp!6515 () Bool)

(assert (=> b!49340 (= e!31692 (and tp_is_empty!2143 tp!6515))))

(declare-datatypes ((B!992 0))(
  ( (B!993 (val!1116 Int)) )
))
(declare-datatypes ((tuple2!1796 0))(
  ( (tuple2!1797 (_1!909 (_ BitVec 64)) (_2!909 B!992)) )
))
(declare-datatypes ((List!1299 0))(
  ( (Nil!1296) (Cons!1295 (h!1875 tuple2!1796) (t!4333 List!1299)) )
))
(declare-fun l!1333 () List!1299)

(get-info :version)

(assert (= (and start!7774 ((_ is Cons!1295) l!1333)) b!49340))

(check-sat (not b!49340) tp_is_empty!2143)
(check-sat)
