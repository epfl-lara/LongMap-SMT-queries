; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38048 () Bool)

(assert start!38048)

(declare-fun b_free!8995 () Bool)

(declare-fun b_next!8995 () Bool)

(assert (=> start!38048 (= b_free!8995 (not b_next!8995))))

(declare-fun tp!31757 () Bool)

(declare-fun b_and!16321 () Bool)

(assert (=> start!38048 (= tp!31757 b_and!16321)))

(declare-datatypes ((V!13995 0))(
  ( (V!13996 (val!4878 Int)) )
))
(declare-datatypes ((tuple2!6574 0))(
  ( (tuple2!6575 (_1!3298 (_ BitVec 64)) (_2!3298 V!13995)) )
))
(declare-datatypes ((List!6428 0))(
  ( (Nil!6425) (Cons!6424 (h!7280 tuple2!6574) (t!11592 List!6428)) )
))
(declare-datatypes ((ListLongMap!5487 0))(
  ( (ListLongMap!5488 (toList!2759 List!6428)) )
))
(declare-fun lt!185012 () ListLongMap!5487)

(declare-fun b!391795 () Bool)

(declare-fun lt!185015 () ListLongMap!5487)

(declare-fun e!237276 () Bool)

(declare-fun minValue!472 () V!13995)

(declare-fun +!1054 (ListLongMap!5487 tuple2!6574) ListLongMap!5487)

(assert (=> b!391795 (= e!237276 (= lt!185015 (+!1054 lt!185012 (tuple2!6575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun mapIsEmpty!16086 () Bool)

(declare-fun mapRes!16086 () Bool)

(assert (=> mapIsEmpty!16086 mapRes!16086))

(declare-fun b!391796 () Bool)

(declare-fun res!224341 () Bool)

(declare-fun e!237282 () Bool)

(assert (=> b!391796 (=> (not res!224341) (not e!237282))))

(declare-datatypes ((array!23237 0))(
  ( (array!23238 (arr!11080 (Array (_ BitVec 32) (_ BitVec 64))) (size!11432 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23237)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!391796 (= res!224341 (or (= (select (arr!11080 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11080 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16086 () Bool)

(declare-fun tp!31758 () Bool)

(declare-fun e!237279 () Bool)

(assert (=> mapNonEmpty!16086 (= mapRes!16086 (and tp!31758 e!237279))))

(declare-fun mapKey!16086 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4490 0))(
  ( (ValueCellFull!4490 (v!7103 V!13995)) (EmptyCell!4490) )
))
(declare-fun mapValue!16086 () ValueCell!4490)

(declare-fun mapRest!16086 () (Array (_ BitVec 32) ValueCell!4490))

(declare-datatypes ((array!23239 0))(
  ( (array!23240 (arr!11081 (Array (_ BitVec 32) ValueCell!4490)) (size!11433 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23239)

(assert (=> mapNonEmpty!16086 (= (arr!11081 _values!506) (store mapRest!16086 mapKey!16086 mapValue!16086))))

(declare-fun b!391797 () Bool)

(declare-fun res!224333 () Bool)

(assert (=> b!391797 (=> (not res!224333) (not e!237282))))

(declare-datatypes ((List!6429 0))(
  ( (Nil!6426) (Cons!6425 (h!7281 (_ BitVec 64)) (t!11593 List!6429)) )
))
(declare-fun arrayNoDuplicates!0 (array!23237 (_ BitVec 32) List!6429) Bool)

(assert (=> b!391797 (= res!224333 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6426))))

(declare-fun b!391798 () Bool)

(declare-fun e!237280 () Bool)

(assert (=> b!391798 (= e!237280 (not e!237276))))

(declare-fun res!224339 () Bool)

(assert (=> b!391798 (=> res!224339 e!237276)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391798 (= res!224339 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13995)

(declare-fun lt!185010 () ListLongMap!5487)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun getCurrentListMap!2101 (array!23237 array!23239 (_ BitVec 32) (_ BitVec 32) V!13995 V!13995 (_ BitVec 32) Int) ListLongMap!5487)

(assert (=> b!391798 (= lt!185010 (getCurrentListMap!2101 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185014 () array!23237)

(declare-fun lt!185011 () array!23239)

(assert (=> b!391798 (= lt!185015 (getCurrentListMap!2101 lt!185014 lt!185011 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185009 () ListLongMap!5487)

(assert (=> b!391798 (and (= lt!185012 lt!185009) (= lt!185009 lt!185012))))

(declare-fun v!373 () V!13995)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun lt!185013 () ListLongMap!5487)

(assert (=> b!391798 (= lt!185009 (+!1054 lt!185013 (tuple2!6575 k!778 v!373)))))

(declare-datatypes ((Unit!11990 0))(
  ( (Unit!11991) )
))
(declare-fun lt!185016 () Unit!11990)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!265 (array!23237 array!23239 (_ BitVec 32) (_ BitVec 32) V!13995 V!13995 (_ BitVec 32) (_ BitVec 64) V!13995 (_ BitVec 32) Int) Unit!11990)

(assert (=> b!391798 (= lt!185016 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!265 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!981 (array!23237 array!23239 (_ BitVec 32) (_ BitVec 32) V!13995 V!13995 (_ BitVec 32) Int) ListLongMap!5487)

(assert (=> b!391798 (= lt!185012 (getCurrentListMapNoExtraKeys!981 lt!185014 lt!185011 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391798 (= lt!185011 (array!23240 (store (arr!11081 _values!506) i!548 (ValueCellFull!4490 v!373)) (size!11433 _values!506)))))

(assert (=> b!391798 (= lt!185013 (getCurrentListMapNoExtraKeys!981 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391799 () Bool)

(declare-fun res!224338 () Bool)

(assert (=> b!391799 (=> (not res!224338) (not e!237280))))

(assert (=> b!391799 (= res!224338 (arrayNoDuplicates!0 lt!185014 #b00000000000000000000000000000000 Nil!6426))))

(declare-fun b!391800 () Bool)

(declare-fun res!224336 () Bool)

(assert (=> b!391800 (=> (not res!224336) (not e!237282))))

(declare-fun arrayContainsKey!0 (array!23237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391800 (= res!224336 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!391802 () Bool)

(declare-fun e!237277 () Bool)

(declare-fun e!237281 () Bool)

(assert (=> b!391802 (= e!237277 (and e!237281 mapRes!16086))))

(declare-fun condMapEmpty!16086 () Bool)

(declare-fun mapDefault!16086 () ValueCell!4490)

