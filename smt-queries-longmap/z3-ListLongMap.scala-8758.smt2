; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106344 () Bool)

(assert start!106344)

(assert (=> start!106344 false))

(declare-fun e!720380 () Bool)

(assert (=> start!106344 e!720380))

(assert (=> start!106344 true))

(declare-fun b!1264972 () Bool)

(declare-fun tp_is_empty!32475 () Bool)

(declare-fun tp!96278 () Bool)

(assert (=> b!1264972 (= e!720380 (and tp_is_empty!32475 tp!96278))))

(declare-datatypes ((B!1942 0))(
  ( (B!1943 (val!16306 Int)) )
))
(declare-datatypes ((tuple2!21130 0))(
  ( (tuple2!21131 (_1!10576 (_ BitVec 64)) (_2!10576 B!1942)) )
))
(declare-datatypes ((List!28298 0))(
  ( (Nil!28295) (Cons!28294 (h!29503 tuple2!21130) (t!41819 List!28298)) )
))
(declare-fun l!706 () List!28298)

(get-info :version)

(assert (= (and start!106344 ((_ is Cons!28294) l!706)) b!1264972))

(check-sat (not b!1264972) tp_is_empty!32475)
(check-sat)
