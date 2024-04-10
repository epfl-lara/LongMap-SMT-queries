; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106330 () Bool)

(assert start!106330)

(assert (=> start!106330 false))

(declare-fun e!720359 () Bool)

(assert (=> start!106330 e!720359))

(declare-fun b!1264951 () Bool)

(declare-fun tp_is_empty!32461 () Bool)

(declare-fun tp!96257 () Bool)

(assert (=> b!1264951 (= e!720359 (and tp_is_empty!32461 tp!96257))))

(declare-datatypes ((B!1928 0))(
  ( (B!1929 (val!16299 Int)) )
))
(declare-datatypes ((tuple2!21116 0))(
  ( (tuple2!21117 (_1!10569 (_ BitVec 64)) (_2!10569 B!1928)) )
))
(declare-datatypes ((List!28291 0))(
  ( (Nil!28288) (Cons!28287 (h!29496 tuple2!21116) (t!41812 List!28291)) )
))
(declare-fun l!706 () List!28291)

(assert (= (and start!106330 (is-Cons!28287 l!706)) b!1264951))

(push 1)

(assert (not b!1264951))

(assert tp_is_empty!32461)

(check-sat)

(pop 1)

