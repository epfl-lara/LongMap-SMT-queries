; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37542 () Bool)

(assert start!37542)

(declare-fun b_free!8669 () Bool)

(declare-fun b_next!8669 () Bool)

(assert (=> start!37542 (= b_free!8669 (not b_next!8669))))

(declare-fun tp!30722 () Bool)

(declare-fun b_and!15911 () Bool)

(assert (=> start!37542 (= tp!30722 b_and!15911)))

(declare-fun b!383326 () Bool)

(declare-fun e!232846 () Bool)

(declare-fun e!232849 () Bool)

(assert (=> b!383326 (= e!232846 (not e!232849))))

(declare-fun res!218231 () Bool)

(assert (=> b!383326 (=> res!218231 e!232849)))

(declare-fun lt!180027 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383326 (= res!218231 (or (and (not lt!180027) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180027) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180027)))))

(assert (=> b!383326 (= lt!180027 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13527 0))(
  ( (V!13528 (val!4703 Int)) )
))
(declare-datatypes ((ValueCell!4315 0))(
  ( (ValueCellFull!4315 (v!6900 V!13527)) (EmptyCell!4315) )
))
(declare-datatypes ((array!22541 0))(
  ( (array!22542 (arr!10739 (Array (_ BitVec 32) ValueCell!4315)) (size!11091 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22541)

(declare-datatypes ((tuple2!6326 0))(
  ( (tuple2!6327 (_1!3174 (_ BitVec 64)) (_2!3174 V!13527)) )
))
(declare-datatypes ((List!6160 0))(
  ( (Nil!6157) (Cons!6156 (h!7012 tuple2!6326) (t!11310 List!6160)) )
))
(declare-datatypes ((ListLongMap!5239 0))(
  ( (ListLongMap!5240 (toList!2635 List!6160)) )
))
(declare-fun lt!180030 () ListLongMap!5239)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13527)

(declare-datatypes ((array!22543 0))(
  ( (array!22544 (arr!10740 (Array (_ BitVec 32) (_ BitVec 64))) (size!11092 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22543)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13527)

(declare-fun getCurrentListMap!2040 (array!22543 array!22541 (_ BitVec 32) (_ BitVec 32) V!13527 V!13527 (_ BitVec 32) Int) ListLongMap!5239)

(assert (=> b!383326 (= lt!180030 (getCurrentListMap!2040 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180034 () array!22541)

(declare-fun lt!180031 () array!22543)

(declare-fun lt!180033 () ListLongMap!5239)

(assert (=> b!383326 (= lt!180033 (getCurrentListMap!2040 lt!180031 lt!180034 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180032 () ListLongMap!5239)

(declare-fun lt!180028 () ListLongMap!5239)

(assert (=> b!383326 (and (= lt!180032 lt!180028) (= lt!180028 lt!180032))))

(declare-fun lt!180026 () ListLongMap!5239)

(declare-fun lt!180029 () tuple2!6326)

(declare-fun +!970 (ListLongMap!5239 tuple2!6326) ListLongMap!5239)

(assert (=> b!383326 (= lt!180028 (+!970 lt!180026 lt!180029))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!13527)

(assert (=> b!383326 (= lt!180029 (tuple2!6327 k!778 v!373))))

(declare-datatypes ((Unit!11834 0))(
  ( (Unit!11835) )
))
(declare-fun lt!180035 () Unit!11834)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!198 (array!22543 array!22541 (_ BitVec 32) (_ BitVec 32) V!13527 V!13527 (_ BitVec 32) (_ BitVec 64) V!13527 (_ BitVec 32) Int) Unit!11834)

(assert (=> b!383326 (= lt!180035 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!198 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!874 (array!22543 array!22541 (_ BitVec 32) (_ BitVec 32) V!13527 V!13527 (_ BitVec 32) Int) ListLongMap!5239)

(assert (=> b!383326 (= lt!180032 (getCurrentListMapNoExtraKeys!874 lt!180031 lt!180034 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383326 (= lt!180034 (array!22542 (store (arr!10739 _values!506) i!548 (ValueCellFull!4315 v!373)) (size!11091 _values!506)))))

(assert (=> b!383326 (= lt!180026 (getCurrentListMapNoExtraKeys!874 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383327 () Bool)

(declare-fun res!218229 () Bool)

(declare-fun e!232850 () Bool)

(assert (=> b!383327 (=> (not res!218229) (not e!232850))))

(declare-datatypes ((List!6161 0))(
  ( (Nil!6158) (Cons!6157 (h!7013 (_ BitVec 64)) (t!11311 List!6161)) )
))
(declare-fun arrayNoDuplicates!0 (array!22543 (_ BitVec 32) List!6161) Bool)

(assert (=> b!383327 (= res!218229 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6158))))

(declare-fun b!383328 () Bool)

(declare-fun res!218222 () Bool)

(assert (=> b!383328 (=> (not res!218222) (not e!232850))))

(assert (=> b!383328 (= res!218222 (and (= (size!11091 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11092 _keys!658) (size!11091 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383329 () Bool)

(assert (=> b!383329 (= e!232849 true)))

(declare-fun lt!180036 () ListLongMap!5239)

(assert (=> b!383329 (= lt!180036 (+!970 lt!180030 lt!180029))))

(assert (=> b!383329 (= lt!180033 lt!180032)))

(declare-fun b!383330 () Bool)

(assert (=> b!383330 (= e!232850 e!232846)))

(declare-fun res!218223 () Bool)

(assert (=> b!383330 (=> (not res!218223) (not e!232846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22543 (_ BitVec 32)) Bool)

(assert (=> b!383330 (= res!218223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180031 mask!970))))

(assert (=> b!383330 (= lt!180031 (array!22544 (store (arr!10740 _keys!658) i!548 k!778) (size!11092 _keys!658)))))

(declare-fun b!383331 () Bool)

(declare-fun res!218227 () Bool)

(assert (=> b!383331 (=> (not res!218227) (not e!232850))))

(assert (=> b!383331 (= res!218227 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11092 _keys!658))))))

(declare-fun b!383332 () Bool)

(declare-fun e!232847 () Bool)

(declare-fun tp_is_empty!9317 () Bool)

(assert (=> b!383332 (= e!232847 tp_is_empty!9317)))

(declare-fun b!383333 () Bool)

(declare-fun res!218230 () Bool)

(assert (=> b!383333 (=> (not res!218230) (not e!232850))))

(declare-fun arrayContainsKey!0 (array!22543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383333 (= res!218230 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!383334 () Bool)

(declare-fun e!232845 () Bool)

(declare-fun mapRes!15540 () Bool)

(assert (=> b!383334 (= e!232845 (and e!232847 mapRes!15540))))

(declare-fun condMapEmpty!15540 () Bool)

(declare-fun mapDefault!15540 () ValueCell!4315)

