; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7776 () Bool)

(assert start!7776)

(assert (=> start!7776 false))

(declare-fun e!31695 () Bool)

(assert (=> start!7776 e!31695))

(assert (=> start!7776 true))

(declare-fun b!49340 () Bool)

(declare-fun tp_is_empty!2149 () Bool)

(declare-fun tp!6524 () Bool)

(assert (=> b!49340 (= e!31695 (and tp_is_empty!2149 tp!6524))))

(declare-datatypes ((B!998 0))(
  ( (B!999 (val!1119 Int)) )
))
(declare-datatypes ((tuple2!1824 0))(
  ( (tuple2!1825 (_1!923 (_ BitVec 64)) (_2!923 B!998)) )
))
(declare-datatypes ((List!1312 0))(
  ( (Nil!1309) (Cons!1308 (h!1888 tuple2!1824) (t!4345 List!1312)) )
))
(declare-fun l!1333 () List!1312)

(get-info :version)

(assert (= (and start!7776 ((_ is Cons!1308) l!1333)) b!49340))

(check-sat (not b!49340) tp_is_empty!2149)
(check-sat)
