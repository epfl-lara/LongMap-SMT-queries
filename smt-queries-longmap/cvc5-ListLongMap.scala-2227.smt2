; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36824 () Bool)

(assert start!36824)

(declare-fun b_free!7951 () Bool)

(declare-fun b_next!7951 () Bool)

(assert (=> start!36824 (= b_free!7951 (not b_next!7951))))

(declare-fun tp!28569 () Bool)

(declare-fun b_and!15193 () Bool)

(assert (=> start!36824 (= tp!28569 b_and!15193)))

(declare-fun b!368084 () Bool)

(declare-fun res!206215 () Bool)

(declare-fun e!225173 () Bool)

(assert (=> b!368084 (=> (not res!206215) (not e!225173))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368084 (= res!206215 (validKeyInArray!0 k!778))))

(declare-fun b!368085 () Bool)

(declare-fun e!225169 () Bool)

(declare-fun tp_is_empty!8599 () Bool)

(assert (=> b!368085 (= e!225169 tp_is_empty!8599)))

(declare-fun b!368086 () Bool)

(declare-fun res!206218 () Bool)

(assert (=> b!368086 (=> (not res!206218) (not e!225173))))

(declare-datatypes ((array!21155 0))(
  ( (array!21156 (arr!10046 (Array (_ BitVec 32) (_ BitVec 64))) (size!10398 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21155)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368086 (= res!206218 (or (= (select (arr!10046 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10046 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14463 () Bool)

(declare-fun mapRes!14463 () Bool)

(assert (=> mapIsEmpty!14463 mapRes!14463))

(declare-fun b!368088 () Bool)

(declare-fun e!225168 () Bool)

(assert (=> b!368088 (= e!225168 false)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((V!12571 0))(
  ( (V!12572 (val!4344 Int)) )
))
(declare-fun zeroValue!472 () V!12571)

(declare-datatypes ((ValueCell!3956 0))(
  ( (ValueCellFull!3956 (v!6541 V!12571)) (EmptyCell!3956) )
))
(declare-datatypes ((array!21157 0))(
  ( (array!21158 (arr!10047 (Array (_ BitVec 32) ValueCell!3956)) (size!10399 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21157)

(declare-datatypes ((tuple2!5752 0))(
  ( (tuple2!5753 (_1!2887 (_ BitVec 64)) (_2!2887 V!12571)) )
))
(declare-datatypes ((List!5585 0))(
  ( (Nil!5582) (Cons!5581 (h!6437 tuple2!5752) (t!10735 List!5585)) )
))
(declare-datatypes ((ListLongMap!4665 0))(
  ( (ListLongMap!4666 (toList!2348 List!5585)) )
))
(declare-fun lt!169475 () ListLongMap!4665)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12571)

(declare-fun getCurrentListMapNoExtraKeys!625 (array!21155 array!21157 (_ BitVec 32) (_ BitVec 32) V!12571 V!12571 (_ BitVec 32) Int) ListLongMap!4665)

(assert (=> b!368088 (= lt!169475 (getCurrentListMapNoExtraKeys!625 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14463 () Bool)

(declare-fun tp!28568 () Bool)

(assert (=> mapNonEmpty!14463 (= mapRes!14463 (and tp!28568 e!225169))))

(declare-fun mapValue!14463 () ValueCell!3956)

(declare-fun mapKey!14463 () (_ BitVec 32))

(declare-fun mapRest!14463 () (Array (_ BitVec 32) ValueCell!3956))

(assert (=> mapNonEmpty!14463 (= (arr!10047 _values!506) (store mapRest!14463 mapKey!14463 mapValue!14463))))

(declare-fun b!368089 () Bool)

(declare-fun e!225172 () Bool)

(declare-fun e!225170 () Bool)

(assert (=> b!368089 (= e!225172 (and e!225170 mapRes!14463))))

(declare-fun condMapEmpty!14463 () Bool)

(declare-fun mapDefault!14463 () ValueCell!3956)

