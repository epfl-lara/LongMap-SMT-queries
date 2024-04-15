; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7770 () Bool)

(assert start!7770)

(assert (=> start!7770 false))

(declare-fun e!31686 () Bool)

(assert (=> start!7770 e!31686))

(assert (=> start!7770 true))

(declare-fun b!49331 () Bool)

(declare-fun tp_is_empty!2143 () Bool)

(declare-fun tp!6515 () Bool)

(assert (=> b!49331 (= e!31686 (and tp_is_empty!2143 tp!6515))))

(declare-datatypes ((B!992 0))(
  ( (B!993 (val!1116 Int)) )
))
(declare-datatypes ((tuple2!1818 0))(
  ( (tuple2!1819 (_1!920 (_ BitVec 64)) (_2!920 B!992)) )
))
(declare-datatypes ((List!1309 0))(
  ( (Nil!1306) (Cons!1305 (h!1885 tuple2!1818) (t!4342 List!1309)) )
))
(declare-fun l!1333 () List!1309)

(get-info :version)

(assert (= (and start!7770 ((_ is Cons!1305) l!1333)) b!49331))

(check-sat (not b!49331) tp_is_empty!2143)
(check-sat)
