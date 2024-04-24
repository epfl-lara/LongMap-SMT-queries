; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106950 () Bool)

(assert start!106950)

(assert (=> start!106950 false))

(declare-fun e!722676 () Bool)

(assert (=> start!106950 e!722676))

(assert (=> start!106950 true))

(declare-fun b!1268437 () Bool)

(declare-fun tp_is_empty!32569 () Bool)

(declare-fun tp!96542 () Bool)

(assert (=> b!1268437 (= e!722676 (and tp_is_empty!32569 tp!96542))))

(declare-datatypes ((B!2048 0))(
  ( (B!2049 (val!16359 Int)) )
))
(declare-datatypes ((tuple2!21246 0))(
  ( (tuple2!21247 (_1!10634 (_ BitVec 64)) (_2!10634 B!2048)) )
))
(declare-datatypes ((List!28387 0))(
  ( (Nil!28384) (Cons!28383 (h!29601 tuple2!21246) (t!41906 List!28387)) )
))
(declare-fun l!874 () List!28387)

(get-info :version)

(assert (= (and start!106950 ((_ is Cons!28383) l!874)) b!1268437))

(check-sat (not b!1268437) tp_is_empty!32569)
(check-sat)
