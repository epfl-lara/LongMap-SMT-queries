; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106332 () Bool)

(assert start!106332)

(assert (=> start!106332 false))

(declare-fun e!720362 () Bool)

(assert (=> start!106332 e!720362))

(declare-fun b!1264954 () Bool)

(declare-fun tp_is_empty!32463 () Bool)

(declare-fun tp!96260 () Bool)

(assert (=> b!1264954 (= e!720362 (and tp_is_empty!32463 tp!96260))))

(declare-datatypes ((B!1930 0))(
  ( (B!1931 (val!16300 Int)) )
))
(declare-datatypes ((tuple2!21118 0))(
  ( (tuple2!21119 (_1!10570 (_ BitVec 64)) (_2!10570 B!1930)) )
))
(declare-datatypes ((List!28292 0))(
  ( (Nil!28289) (Cons!28288 (h!29497 tuple2!21118) (t!41813 List!28292)) )
))
(declare-fun l!706 () List!28292)

(get-info :version)

(assert (= (and start!106332 ((_ is Cons!28288) l!706)) b!1264954))

(check-sat (not b!1264954) tp_is_empty!32463)
(check-sat)
