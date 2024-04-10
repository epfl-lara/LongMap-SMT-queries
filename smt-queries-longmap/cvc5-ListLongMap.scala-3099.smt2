; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43534 () Bool)

(assert start!43534)

(declare-fun b_free!12313 () Bool)

(declare-fun b_next!12313 () Bool)

(assert (=> start!43534 (= b_free!12313 (not b_next!12313))))

(declare-fun tp!43222 () Bool)

(declare-fun b_and!21073 () Bool)

(assert (=> start!43534 (= tp!43222 b_and!21073)))

(declare-fun b!482342 () Bool)

(declare-fun e!283854 () Bool)

(declare-fun e!283853 () Bool)

(declare-fun mapRes!22447 () Bool)

(assert (=> b!482342 (= e!283854 (and e!283853 mapRes!22447))))

(declare-fun condMapEmpty!22447 () Bool)

(declare-datatypes ((V!19505 0))(
  ( (V!19506 (val!6960 Int)) )
))
(declare-datatypes ((ValueCell!6551 0))(
  ( (ValueCellFull!6551 (v!9253 V!19505)) (EmptyCell!6551) )
))
(declare-datatypes ((array!31309 0))(
  ( (array!31310 (arr!15057 (Array (_ BitVec 32) ValueCell!6551)) (size!15415 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31309)

(declare-fun mapDefault!22447 () ValueCell!6551)

