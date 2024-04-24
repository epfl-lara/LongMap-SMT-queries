; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103802 () Bool)

(assert start!103802)

(assert (=> start!103802 false))

(assert (=> start!103802 true))

(declare-fun e!704162 () Bool)

(assert (=> start!103802 e!704162))

(declare-fun b!1242105 () Bool)

(declare-fun tp_is_empty!31207 () Bool)

(declare-fun tp!92564 () Bool)

(assert (=> b!1242105 (= e!704162 (and tp_is_empty!31207 tp!92564))))

(declare-datatypes ((B!1808 0))(
  ( (B!1809 (val!15666 Int)) )
))
(declare-datatypes ((tuple2!20220 0))(
  ( (tuple2!20221 (_1!10121 (_ BitVec 64)) (_2!10121 B!1808)) )
))
(declare-datatypes ((List!27356 0))(
  ( (Nil!27353) (Cons!27352 (h!28570 tuple2!20220) (t!40811 List!27356)) )
))
(declare-fun l!644 () List!27356)

(get-info :version)

(assert (= (and start!103802 ((_ is Cons!27352) l!644)) b!1242105))

(check-sat (not b!1242105) tp_is_empty!31207)
(check-sat)
