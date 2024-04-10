; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7566 () Bool)

(assert start!7566)

(assert (=> start!7566 false))

(declare-fun e!31021 () Bool)

(assert (=> start!7566 e!31021))

(declare-fun b!48347 () Bool)

(declare-fun tp_is_empty!2085 () Bool)

(declare-fun tp!6368 () Bool)

(assert (=> b!48347 (= e!31021 (and tp_is_empty!2085 tp!6368))))

(declare-datatypes ((B!934 0))(
  ( (B!935 (val!1087 Int)) )
))
(declare-datatypes ((tuple2!1756 0))(
  ( (tuple2!1757 (_1!889 (_ BitVec 64)) (_2!889 B!934)) )
))
(declare-datatypes ((List!1284 0))(
  ( (Nil!1281) (Cons!1280 (h!1860 tuple2!1756) (t!4312 List!1284)) )
))
(declare-fun l!1333 () List!1284)

(get-info :version)

(assert (= (and start!7566 ((_ is Cons!1280) l!1333)) b!48347))

(check-sat (not b!48347) tp_is_empty!2085)
(check-sat)
