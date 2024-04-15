; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7620 () Bool)

(assert start!7620)

(assert (=> start!7620 false))

(declare-fun e!31155 () Bool)

(assert (=> start!7620 e!31155))

(assert (=> start!7620 true))

(declare-fun b!48533 () Bool)

(declare-fun tp_is_empty!2113 () Bool)

(declare-fun tp!6428 () Bool)

(assert (=> b!48533 (= e!31155 (and tp_is_empty!2113 tp!6428))))

(declare-datatypes ((B!962 0))(
  ( (B!963 (val!1101 Int)) )
))
(declare-datatypes ((tuple2!1788 0))(
  ( (tuple2!1789 (_1!905 (_ BitVec 64)) (_2!905 B!962)) )
))
(declare-datatypes ((List!1294 0))(
  ( (Nil!1291) (Cons!1290 (h!1870 tuple2!1788) (t!4321 List!1294)) )
))
(declare-fun l!1333 () List!1294)

(get-info :version)

(assert (= (and start!7620 ((_ is Cons!1290) l!1333)) b!48533))

(check-sat (not b!48533) tp_is_empty!2113)
(check-sat)
