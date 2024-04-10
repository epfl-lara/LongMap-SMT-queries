; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37752 () Bool)

(assert start!37752)

(declare-fun b_free!8855 () Bool)

(declare-fun b_next!8855 () Bool)

(assert (=> start!37752 (= b_free!8855 (not b_next!8855))))

(declare-fun tp!31316 () Bool)

(declare-fun b_and!16097 () Bool)

(assert (=> start!37752 (= tp!31316 b_and!16097)))

(declare-fun mapIsEmpty!15855 () Bool)

(declare-fun mapRes!15855 () Bool)

(assert (=> mapIsEmpty!15855 mapRes!15855))

(declare-fun b!387378 () Bool)

(declare-fun e!234863 () Bool)

(declare-fun e!234865 () Bool)

(assert (=> b!387378 (= e!234863 (and e!234865 mapRes!15855))))

(declare-fun condMapEmpty!15855 () Bool)

(declare-datatypes ((V!13807 0))(
  ( (V!13808 (val!4808 Int)) )
))
(declare-datatypes ((ValueCell!4420 0))(
  ( (ValueCellFull!4420 (v!7005 V!13807)) (EmptyCell!4420) )
))
(declare-datatypes ((array!22947 0))(
  ( (array!22948 (arr!10942 (Array (_ BitVec 32) ValueCell!4420)) (size!11294 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22947)

(declare-fun mapDefault!15855 () ValueCell!4420)

