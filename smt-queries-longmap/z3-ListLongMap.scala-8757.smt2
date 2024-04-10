; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106338 () Bool)

(assert start!106338)

(assert (=> start!106338 false))

(declare-fun e!720371 () Bool)

(assert (=> start!106338 e!720371))

(assert (=> start!106338 true))

(declare-fun b!1264963 () Bool)

(declare-fun tp_is_empty!32469 () Bool)

(declare-fun tp!96269 () Bool)

(assert (=> b!1264963 (= e!720371 (and tp_is_empty!32469 tp!96269))))

(declare-datatypes ((B!1936 0))(
  ( (B!1937 (val!16303 Int)) )
))
(declare-datatypes ((tuple2!21124 0))(
  ( (tuple2!21125 (_1!10573 (_ BitVec 64)) (_2!10573 B!1936)) )
))
(declare-datatypes ((List!28295 0))(
  ( (Nil!28292) (Cons!28291 (h!29500 tuple2!21124) (t!41816 List!28295)) )
))
(declare-fun l!706 () List!28295)

(get-info :version)

(assert (= (and start!106338 ((_ is Cons!28291) l!706)) b!1264963))

(check-sat (not b!1264963) tp_is_empty!32469)
(check-sat)
