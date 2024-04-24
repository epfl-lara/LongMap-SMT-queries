; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7168 () Bool)

(assert start!7168)

(assert (=> start!7168 false))

(declare-fun e!29212 () Bool)

(assert (=> start!7168 e!29212))

(declare-fun b!45891 () Bool)

(declare-fun tp_is_empty!1945 () Bool)

(declare-fun tp!6029 () Bool)

(assert (=> b!45891 (= e!29212 (and tp_is_empty!1945 tp!6029))))

(declare-datatypes ((B!848 0))(
  ( (B!849 (val!1011 Int)) )
))
(declare-datatypes ((tuple2!1652 0))(
  ( (tuple2!1653 (_1!837 (_ BitVec 64)) (_2!837 B!848)) )
))
(declare-datatypes ((List!1215 0))(
  ( (Nil!1212) (Cons!1211 (h!1791 tuple2!1652) (t!4240 List!1215)) )
))
(declare-fun l!812 () List!1215)

(get-info :version)

(assert (= (and start!7168 ((_ is Cons!1211) l!812)) b!45891))

(check-sat (not b!45891) tp_is_empty!1945)
(check-sat)
