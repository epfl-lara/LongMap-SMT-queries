; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1304 () Bool)

(assert start!1304)

(declare-fun b_free!405 () Bool)

(declare-fun b_next!405 () Bool)

(assert (=> start!1304 (= b_free!405 (not b_next!405))))

(declare-fun tp!1617 () Bool)

(declare-fun b_and!587 () Bool)

(assert (=> start!1304 (= tp!1617 b_and!587)))

(assert (=> start!1304 false))

(declare-datatypes ((B!346 0))(
  ( (B!347 (val!268 Int)) )
))
(declare-datatypes ((tuple2!336 0))(
  ( (tuple2!337 (_1!168 (_ BitVec 64)) (_2!168 B!346)) )
))
(declare-datatypes ((List!320 0))(
  ( (Nil!317) (Cons!316 (h!882 tuple2!336) (t!2491 List!320)) )
))
(declare-datatypes ((ListLongMap!317 0))(
  ( (ListLongMap!318 (toList!174 List!320)) )
))
(declare-fun lm!227 () ListLongMap!317)

(declare-fun e!6194 () Bool)

(declare-fun inv!503 (ListLongMap!317) Bool)

(assert (=> start!1304 (and (inv!503 lm!227) e!6194)))

(assert (=> start!1304 tp!1617))

(declare-fun e!6193 () Bool)

(assert (=> start!1304 e!6193))

(declare-fun b!10639 () Bool)

(declare-fun tp!1618 () Bool)

(assert (=> b!10639 (= e!6194 tp!1618)))

(declare-fun b!10640 () Bool)

(declare-fun tp_is_empty!519 () Bool)

(declare-fun tp!1619 () Bool)

(assert (=> b!10640 (= e!6193 (and tp_is_empty!519 tp!1619))))

(assert (= start!1304 b!10639))

(declare-fun kvs!4 () List!320)

(get-info :version)

(assert (= (and start!1304 ((_ is Cons!316) kvs!4)) b!10640))

(declare-fun m!6853 () Bool)

(assert (=> start!1304 m!6853))

(check-sat tp_is_empty!519 b_and!587 (not b!10640) (not b!10639) (not b_next!405) (not start!1304))
(check-sat b_and!587 (not b_next!405))
