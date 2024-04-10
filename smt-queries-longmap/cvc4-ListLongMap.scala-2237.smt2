; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36888 () Bool)

(assert start!36888)

(declare-fun b_free!8015 () Bool)

(declare-fun b_next!8015 () Bool)

(assert (=> start!36888 (= b_free!8015 (not b_next!8015))))

(declare-fun tp!28761 () Bool)

(declare-fun b_and!15257 () Bool)

(assert (=> start!36888 (= tp!28761 b_and!15257)))

(declare-fun b!369332 () Bool)

(declare-fun e!225744 () Bool)

(declare-fun e!225746 () Bool)

(assert (=> b!369332 (= e!225744 e!225746)))

(declare-fun res!207171 () Bool)

(assert (=> b!369332 (=> (not res!207171) (not e!225746))))

(declare-datatypes ((array!21277 0))(
  ( (array!21278 (arr!10107 (Array (_ BitVec 32) (_ BitVec 64))) (size!10459 (_ BitVec 32))) )
))
(declare-fun lt!169713 () array!21277)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21277 (_ BitVec 32)) Bool)

(assert (=> b!369332 (= res!207171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169713 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21277)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369332 (= lt!169713 (array!21278 (store (arr!10107 _keys!658) i!548 k!778) (size!10459 _keys!658)))))

(declare-fun b!369333 () Bool)

(declare-fun res!207173 () Bool)

(assert (=> b!369333 (=> (not res!207173) (not e!225744))))

(declare-fun arrayContainsKey!0 (array!21277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369333 (= res!207173 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!369334 () Bool)

(declare-fun res!207176 () Bool)

(assert (=> b!369334 (=> (not res!207176) (not e!225744))))

(assert (=> b!369334 (= res!207176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369335 () Bool)

(declare-fun e!225745 () Bool)

(declare-fun tp_is_empty!8663 () Bool)

(assert (=> b!369335 (= e!225745 tp_is_empty!8663)))

(declare-fun res!207170 () Bool)

(assert (=> start!36888 (=> (not res!207170) (not e!225744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36888 (= res!207170 (validMask!0 mask!970))))

(assert (=> start!36888 e!225744))

(declare-datatypes ((V!12655 0))(
  ( (V!12656 (val!4376 Int)) )
))
(declare-datatypes ((ValueCell!3988 0))(
  ( (ValueCellFull!3988 (v!6573 V!12655)) (EmptyCell!3988) )
))
(declare-datatypes ((array!21279 0))(
  ( (array!21280 (arr!10108 (Array (_ BitVec 32) ValueCell!3988)) (size!10460 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21279)

(declare-fun e!225748 () Bool)

(declare-fun array_inv!7470 (array!21279) Bool)

(assert (=> start!36888 (and (array_inv!7470 _values!506) e!225748)))

(assert (=> start!36888 tp!28761))

(assert (=> start!36888 true))

(assert (=> start!36888 tp_is_empty!8663))

(declare-fun array_inv!7471 (array!21277) Bool)

(assert (=> start!36888 (array_inv!7471 _keys!658)))

(declare-fun b!369336 () Bool)

(declare-fun res!207177 () Bool)

(assert (=> b!369336 (=> (not res!207177) (not e!225746))))

(declare-datatypes ((List!5638 0))(
  ( (Nil!5635) (Cons!5634 (h!6490 (_ BitVec 64)) (t!10788 List!5638)) )
))
(declare-fun arrayNoDuplicates!0 (array!21277 (_ BitVec 32) List!5638) Bool)

(assert (=> b!369336 (= res!207177 (arrayNoDuplicates!0 lt!169713 #b00000000000000000000000000000000 Nil!5635))))

(declare-fun mapNonEmpty!14559 () Bool)

(declare-fun mapRes!14559 () Bool)

(declare-fun tp!28760 () Bool)

(assert (=> mapNonEmpty!14559 (= mapRes!14559 (and tp!28760 e!225745))))

(declare-fun mapRest!14559 () (Array (_ BitVec 32) ValueCell!3988))

(declare-fun mapKey!14559 () (_ BitVec 32))

(declare-fun mapValue!14559 () ValueCell!3988)

(assert (=> mapNonEmpty!14559 (= (arr!10108 _values!506) (store mapRest!14559 mapKey!14559 mapValue!14559))))

(declare-fun b!369337 () Bool)

(declare-fun res!207174 () Bool)

(assert (=> b!369337 (=> (not res!207174) (not e!225744))))

(assert (=> b!369337 (= res!207174 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10459 _keys!658))))))

(declare-fun b!369338 () Bool)

(declare-fun e!225749 () Bool)

(assert (=> b!369338 (= e!225749 tp_is_empty!8663)))

(declare-fun b!369339 () Bool)

(declare-fun res!207179 () Bool)

(assert (=> b!369339 (=> (not res!207179) (not e!225744))))

(assert (=> b!369339 (= res!207179 (or (= (select (arr!10107 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10107 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14559 () Bool)

(assert (=> mapIsEmpty!14559 mapRes!14559))

(declare-fun b!369340 () Bool)

(assert (=> b!369340 (= e!225746 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12655)

(declare-datatypes ((tuple2!5804 0))(
  ( (tuple2!5805 (_1!2913 (_ BitVec 64)) (_2!2913 V!12655)) )
))
(declare-datatypes ((List!5639 0))(
  ( (Nil!5636) (Cons!5635 (h!6491 tuple2!5804) (t!10789 List!5639)) )
))
(declare-datatypes ((ListLongMap!4717 0))(
  ( (ListLongMap!4718 (toList!2374 List!5639)) )
))
(declare-fun lt!169712 () ListLongMap!4717)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12655)

(declare-fun minValue!472 () V!12655)

(declare-fun getCurrentListMapNoExtraKeys!651 (array!21277 array!21279 (_ BitVec 32) (_ BitVec 32) V!12655 V!12655 (_ BitVec 32) Int) ListLongMap!4717)

(assert (=> b!369340 (= lt!169712 (getCurrentListMapNoExtraKeys!651 lt!169713 (array!21280 (store (arr!10108 _values!506) i!548 (ValueCellFull!3988 v!373)) (size!10460 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169711 () ListLongMap!4717)

(assert (=> b!369340 (= lt!169711 (getCurrentListMapNoExtraKeys!651 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369341 () Bool)

(declare-fun res!207175 () Bool)

(assert (=> b!369341 (=> (not res!207175) (not e!225744))))

(assert (=> b!369341 (= res!207175 (and (= (size!10460 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10459 _keys!658) (size!10460 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369342 () Bool)

(declare-fun res!207172 () Bool)

(assert (=> b!369342 (=> (not res!207172) (not e!225744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369342 (= res!207172 (validKeyInArray!0 k!778))))

(declare-fun b!369343 () Bool)

(assert (=> b!369343 (= e!225748 (and e!225749 mapRes!14559))))

(declare-fun condMapEmpty!14559 () Bool)

(declare-fun mapDefault!14559 () ValueCell!3988)

