; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2366 () Bool)

(assert start!2366)

(declare-fun b_free!477 () Bool)

(declare-fun b_next!477 () Bool)

(assert (=> start!2366 (= b_free!477 (not b_next!477))))

(declare-fun tp!2504 () Bool)

(declare-fun b_and!893 () Bool)

(assert (=> start!2366 (= tp!2504 b_and!893)))

(assert (=> start!2366 false))

(declare-datatypes ((B!598 0))(
  ( (B!599 (val!397 Int)) )
))
(declare-datatypes ((tuple2!594 0))(
  ( (tuple2!595 (_1!297 (_ BitVec 64)) (_2!297 B!598)) )
))
(declare-datatypes ((List!458 0))(
  ( (Nil!455) (Cons!454 (h!1020 tuple2!594) (t!2866 List!458)) )
))
(declare-datatypes ((ListLongMap!425 0))(
  ( (ListLongMap!426 (toList!228 List!458)) )
))
(declare-fun lm!238 () ListLongMap!425)

(declare-fun e!9254 () Bool)

(declare-fun inv!769 (ListLongMap!425) Bool)

(assert (=> start!2366 (and (inv!769 lm!238) e!9254)))

(assert (=> start!2366 tp!2504))

(declare-fun b!15275 () Bool)

(declare-fun tp!2503 () Bool)

(assert (=> b!15275 (= e!9254 tp!2503)))

(assert (= start!2366 b!15275))

(declare-fun m!10165 () Bool)

(assert (=> start!2366 m!10165))

(check-sat (not start!2366) (not b!15275) b_and!893 (not b_next!477))
(check-sat b_and!893 (not b_next!477))
