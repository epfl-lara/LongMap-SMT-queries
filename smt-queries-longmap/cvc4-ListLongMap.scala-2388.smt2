; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37794 () Bool)

(assert start!37794)

(declare-fun b_free!8897 () Bool)

(declare-fun b_next!8897 () Bool)

(assert (=> start!37794 (= b_free!8897 (not b_next!8897))))

(declare-fun tp!31443 () Bool)

(declare-fun b_and!16139 () Bool)

(assert (=> start!37794 (= tp!31443 b_and!16139)))

(declare-fun b!388196 () Bool)

(declare-fun e!235242 () Bool)

(assert (=> b!388196 (= e!235242 (not true))))

(declare-datatypes ((V!13863 0))(
  ( (V!13864 (val!4829 Int)) )
))
(declare-datatypes ((tuple2!6492 0))(
  ( (tuple2!6493 (_1!3257 (_ BitVec 64)) (_2!3257 V!13863)) )
))
(declare-datatypes ((List!6345 0))(
  ( (Nil!6342) (Cons!6341 (h!7197 tuple2!6492) (t!11495 List!6345)) )
))
(declare-datatypes ((ListLongMap!5405 0))(
  ( (ListLongMap!5406 (toList!2718 List!6345)) )
))
(declare-fun lt!182250 () ListLongMap!5405)

(declare-fun lt!182248 () ListLongMap!5405)

(assert (=> b!388196 (and (= lt!182250 lt!182248) (= lt!182248 lt!182250))))

(declare-fun v!373 () V!13863)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun lt!182246 () ListLongMap!5405)

(declare-fun +!1013 (ListLongMap!5405 tuple2!6492) ListLongMap!5405)

(assert (=> b!388196 (= lt!182248 (+!1013 lt!182246 (tuple2!6493 k!778 v!373)))))

(declare-datatypes ((ValueCell!4441 0))(
  ( (ValueCellFull!4441 (v!7026 V!13863)) (EmptyCell!4441) )
))
(declare-datatypes ((array!23029 0))(
  ( (array!23030 (arr!10983 (Array (_ BitVec 32) ValueCell!4441)) (size!11335 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23029)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((array!23031 0))(
  ( (array!23032 (arr!10984 (Array (_ BitVec 32) (_ BitVec 64))) (size!11336 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23031)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((Unit!11900 0))(
  ( (Unit!11901) )
))
(declare-fun lt!182247 () Unit!11900)

(declare-fun zeroValue!472 () V!13863)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!13863)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!231 (array!23031 array!23029 (_ BitVec 32) (_ BitVec 32) V!13863 V!13863 (_ BitVec 32) (_ BitVec 64) V!13863 (_ BitVec 32) Int) Unit!11900)

(assert (=> b!388196 (= lt!182247 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!231 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182249 () array!23031)

(declare-fun getCurrentListMapNoExtraKeys!947 (array!23031 array!23029 (_ BitVec 32) (_ BitVec 32) V!13863 V!13863 (_ BitVec 32) Int) ListLongMap!5405)

(assert (=> b!388196 (= lt!182250 (getCurrentListMapNoExtraKeys!947 lt!182249 (array!23030 (store (arr!10983 _values!506) i!548 (ValueCellFull!4441 v!373)) (size!11335 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388196 (= lt!182246 (getCurrentListMapNoExtraKeys!947 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388197 () Bool)

(declare-fun res!221961 () Bool)

(declare-fun e!235240 () Bool)

(assert (=> b!388197 (=> (not res!221961) (not e!235240))))

(assert (=> b!388197 (= res!221961 (and (= (size!11335 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11336 _keys!658) (size!11335 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!388198 () Bool)

(declare-fun res!221960 () Bool)

(assert (=> b!388198 (=> (not res!221960) (not e!235240))))

(assert (=> b!388198 (= res!221960 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11336 _keys!658))))))

(declare-fun mapIsEmpty!15918 () Bool)

(declare-fun mapRes!15918 () Bool)

(assert (=> mapIsEmpty!15918 mapRes!15918))

(declare-fun b!388199 () Bool)

(declare-fun e!235239 () Bool)

(declare-fun tp_is_empty!9569 () Bool)

(assert (=> b!388199 (= e!235239 tp_is_empty!9569)))

(declare-fun b!388200 () Bool)

(declare-fun res!221962 () Bool)

(assert (=> b!388200 (=> (not res!221962) (not e!235240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23031 (_ BitVec 32)) Bool)

(assert (=> b!388200 (= res!221962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!388202 () Bool)

(declare-fun e!235241 () Bool)

(assert (=> b!388202 (= e!235241 tp_is_empty!9569)))

(declare-fun b!388203 () Bool)

(declare-fun e!235243 () Bool)

(assert (=> b!388203 (= e!235243 (and e!235239 mapRes!15918))))

(declare-fun condMapEmpty!15918 () Bool)

(declare-fun mapDefault!15918 () ValueCell!4441)

