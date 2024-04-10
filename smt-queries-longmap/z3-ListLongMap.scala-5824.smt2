; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75126 () Bool)

(assert start!75126)

(assert (=> start!75126 false))

(declare-fun e!492873 () Bool)

(assert (=> start!75126 e!492873))

(declare-fun b!885595 () Bool)

(declare-fun tp_is_empty!17775 () Bool)

(declare-fun tp!54278 () Bool)

(assert (=> b!885595 (= e!492873 (and tp_is_empty!17775 tp!54278))))

(declare-datatypes ((B!1264 0))(
  ( (B!1265 (val!8938 Int)) )
))
(declare-datatypes ((tuple2!11870 0))(
  ( (tuple2!11871 (_1!5946 (_ BitVec 64)) (_2!5946 B!1264)) )
))
(declare-datatypes ((List!17654 0))(
  ( (Nil!17651) (Cons!17650 (h!18781 tuple2!11870) (t!24931 List!17654)) )
))
(declare-fun l!906 () List!17654)

(get-info :version)

(assert (= (and start!75126 ((_ is Cons!17650) l!906)) b!885595))

(check-sat (not b!885595) tp_is_empty!17775)
(check-sat)
