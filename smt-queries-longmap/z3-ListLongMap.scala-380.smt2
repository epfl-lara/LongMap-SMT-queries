; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7192 () Bool)

(assert start!7192)

(assert (=> start!7192 false))

(declare-fun e!29299 () Bool)

(assert (=> start!7192 e!29299))

(declare-fun b!46011 () Bool)

(declare-fun tp_is_empty!1957 () Bool)

(declare-fun tp!6056 () Bool)

(assert (=> b!46011 (= e!29299 (and tp_is_empty!1957 tp!6056))))

(declare-datatypes ((B!860 0))(
  ( (B!861 (val!1017 Int)) )
))
(declare-datatypes ((tuple2!1664 0))(
  ( (tuple2!1665 (_1!843 (_ BitVec 64)) (_2!843 B!860)) )
))
(declare-datatypes ((List!1221 0))(
  ( (Nil!1218) (Cons!1217 (h!1797 tuple2!1664) (t!4246 List!1221)) )
))
(declare-fun l!812 () List!1221)

(get-info :version)

(assert (= (and start!7192 ((_ is Cons!1217) l!812)) b!46011))

(check-sat (not b!46011) tp_is_empty!1957)
(check-sat)
