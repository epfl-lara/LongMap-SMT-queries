; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74204 () Bool)

(assert start!74204)

(declare-fun b_free!15011 () Bool)

(declare-fun b_next!15011 () Bool)

(assert (=> start!74204 (= b_free!15011 (not b_next!15011))))

(declare-fun tp!52683 () Bool)

(declare-fun b_and!24763 () Bool)

(assert (=> start!74204 (= tp!52683 b_and!24763)))

(declare-fun b!872974 () Bool)

(declare-fun e!486148 () Bool)

(declare-datatypes ((V!28037 0))(
  ( (V!28038 (val!8669 Int)) )
))
(declare-datatypes ((tuple2!11464 0))(
  ( (tuple2!11465 (_1!5743 (_ BitVec 64)) (_2!5743 V!28037)) )
))
(declare-datatypes ((List!17281 0))(
  ( (Nil!17278) (Cons!17277 (h!18408 tuple2!11464) (t!24318 List!17281)) )
))
(declare-datatypes ((ListLongMap!10233 0))(
  ( (ListLongMap!10234 (toList!5132 List!17281)) )
))
(declare-fun call!38500 () ListLongMap!10233)

(declare-fun call!38501 () ListLongMap!10233)

(assert (=> b!872974 (= e!486148 (= call!38500 call!38501))))

(declare-fun mapIsEmpty!27467 () Bool)

(declare-fun mapRes!27467 () Bool)

(assert (=> mapIsEmpty!27467 mapRes!27467))

(declare-fun b!872975 () Bool)

(declare-fun e!486145 () Bool)

(declare-fun e!486143 () Bool)

(assert (=> b!872975 (= e!486145 (and e!486143 mapRes!27467))))

(declare-fun condMapEmpty!27467 () Bool)

(declare-datatypes ((ValueCell!8182 0))(
  ( (ValueCellFull!8182 (v!11094 V!28037)) (EmptyCell!8182) )
))
(declare-datatypes ((array!50614 0))(
  ( (array!50615 (arr!24337 (Array (_ BitVec 32) ValueCell!8182)) (size!24777 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50614)

(declare-fun mapDefault!27467 () ValueCell!8182)

