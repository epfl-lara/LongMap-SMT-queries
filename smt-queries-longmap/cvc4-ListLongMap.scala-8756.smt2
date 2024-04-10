; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106334 () Bool)

(assert start!106334)

(assert (=> start!106334 false))

(declare-fun e!720365 () Bool)

(assert (=> start!106334 e!720365))

(declare-fun b!1264957 () Bool)

(declare-fun tp_is_empty!32465 () Bool)

(declare-fun tp!96263 () Bool)

(assert (=> b!1264957 (= e!720365 (and tp_is_empty!32465 tp!96263))))

(declare-datatypes ((B!1932 0))(
  ( (B!1933 (val!16301 Int)) )
))
(declare-datatypes ((tuple2!21120 0))(
  ( (tuple2!21121 (_1!10571 (_ BitVec 64)) (_2!10571 B!1932)) )
))
(declare-datatypes ((List!28293 0))(
  ( (Nil!28290) (Cons!28289 (h!29498 tuple2!21120) (t!41814 List!28293)) )
))
(declare-fun l!706 () List!28293)

(assert (= (and start!106334 (is-Cons!28289 l!706)) b!1264957))

(push 1)

(assert (not b!1264957))

(assert tp_is_empty!32465)

(check-sat)

(pop 1)

(push 1)

(check-sat)

