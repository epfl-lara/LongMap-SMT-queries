; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106722 () Bool)

(assert start!106722)

(assert (=> start!106722 false))

(declare-fun e!721784 () Bool)

(assert (=> start!106722 e!721784))

(assert (=> start!106722 true))

(declare-fun b!1267050 () Bool)

(declare-fun tp_is_empty!32569 () Bool)

(declare-fun tp!96542 () Bool)

(assert (=> b!1267050 (= e!721784 (and tp_is_empty!32569 tp!96542))))

(declare-datatypes ((B!2048 0))(
  ( (B!2049 (val!16359 Int)) )
))
(declare-datatypes ((tuple2!21318 0))(
  ( (tuple2!21319 (_1!10670 (_ BitVec 64)) (_2!10670 B!2048)) )
))
(declare-datatypes ((List!28435 0))(
  ( (Nil!28432) (Cons!28431 (h!29640 tuple2!21318) (t!41953 List!28435)) )
))
(declare-fun l!874 () List!28435)

(get-info :version)

(assert (= (and start!106722 ((_ is Cons!28431) l!874)) b!1267050))

(check-sat (not b!1267050) tp_is_empty!32569)
(check-sat)
