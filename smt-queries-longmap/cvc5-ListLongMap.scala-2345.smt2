; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37532 () Bool)

(assert start!37532)

(declare-fun b_free!8659 () Bool)

(declare-fun b_next!8659 () Bool)

(assert (=> start!37532 (= b_free!8659 (not b_next!8659))))

(declare-fun tp!30692 () Bool)

(declare-fun b_and!15901 () Bool)

(assert (=> start!37532 (= tp!30692 b_and!15901)))

(declare-fun b!383116 () Bool)

(declare-fun e!232744 () Bool)

(declare-fun tp_is_empty!9307 () Bool)

(assert (=> b!383116 (= e!232744 tp_is_empty!9307)))

(declare-fun b!383118 () Bool)

(declare-fun res!218062 () Bool)

(declare-fun e!232740 () Bool)

(assert (=> b!383118 (=> (not res!218062) (not e!232740))))

(declare-datatypes ((array!22521 0))(
  ( (array!22522 (arr!10729 (Array (_ BitVec 32) (_ BitVec 64))) (size!11081 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22521)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22521 (_ BitVec 32)) Bool)

(assert (=> b!383118 (= res!218062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383119 () Bool)

(declare-fun res!218064 () Bool)

(assert (=> b!383119 (=> (not res!218064) (not e!232740))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383119 (= res!218064 (validKeyInArray!0 k!778))))

(declare-fun b!383120 () Bool)

(declare-fun e!232742 () Bool)

(assert (=> b!383120 (= e!232742 true)))

(declare-datatypes ((V!13515 0))(
  ( (V!13516 (val!4698 Int)) )
))
(declare-datatypes ((tuple2!6318 0))(
  ( (tuple2!6319 (_1!3170 (_ BitVec 64)) (_2!3170 V!13515)) )
))
(declare-datatypes ((List!6151 0))(
  ( (Nil!6148) (Cons!6147 (h!7003 tuple2!6318) (t!11301 List!6151)) )
))
(declare-datatypes ((ListLongMap!5231 0))(
  ( (ListLongMap!5232 (toList!2631 List!6151)) )
))
(declare-fun lt!179871 () ListLongMap!5231)

(declare-fun lt!179862 () ListLongMap!5231)

(declare-fun lt!179865 () tuple2!6318)

(declare-fun +!966 (ListLongMap!5231 tuple2!6318) ListLongMap!5231)

(assert (=> b!383120 (= lt!179871 (+!966 lt!179862 lt!179865))))

(declare-fun lt!179868 () ListLongMap!5231)

(declare-fun lt!179864 () ListLongMap!5231)

(assert (=> b!383120 (= lt!179868 lt!179864)))

(declare-fun mapIsEmpty!15525 () Bool)

(declare-fun mapRes!15525 () Bool)

(assert (=> mapIsEmpty!15525 mapRes!15525))

(declare-fun b!383121 () Bool)

(declare-fun e!232745 () Bool)

(assert (=> b!383121 (= e!232745 (not e!232742))))

(declare-fun res!218057 () Bool)

(assert (=> b!383121 (=> res!218057 e!232742)))

(declare-fun lt!179869 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383121 (= res!218057 (or (and (not lt!179869) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179869) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179869)))))

(assert (=> b!383121 (= lt!179869 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((ValueCell!4310 0))(
  ( (ValueCellFull!4310 (v!6895 V!13515)) (EmptyCell!4310) )
))
(declare-datatypes ((array!22523 0))(
  ( (array!22524 (arr!10730 (Array (_ BitVec 32) ValueCell!4310)) (size!11082 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22523)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13515)

(declare-fun minValue!472 () V!13515)

(declare-fun getCurrentListMap!2036 (array!22521 array!22523 (_ BitVec 32) (_ BitVec 32) V!13515 V!13515 (_ BitVec 32) Int) ListLongMap!5231)

(assert (=> b!383121 (= lt!179862 (getCurrentListMap!2036 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179870 () array!22523)

(declare-fun lt!179866 () array!22521)

(assert (=> b!383121 (= lt!179868 (getCurrentListMap!2036 lt!179866 lt!179870 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179863 () ListLongMap!5231)

(assert (=> b!383121 (and (= lt!179864 lt!179863) (= lt!179863 lt!179864))))

(declare-fun lt!179867 () ListLongMap!5231)

(assert (=> b!383121 (= lt!179863 (+!966 lt!179867 lt!179865))))

(declare-fun v!373 () V!13515)

(assert (=> b!383121 (= lt!179865 (tuple2!6319 k!778 v!373))))

(declare-datatypes ((Unit!11826 0))(
  ( (Unit!11827) )
))
(declare-fun lt!179861 () Unit!11826)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!194 (array!22521 array!22523 (_ BitVec 32) (_ BitVec 32) V!13515 V!13515 (_ BitVec 32) (_ BitVec 64) V!13515 (_ BitVec 32) Int) Unit!11826)

(assert (=> b!383121 (= lt!179861 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!194 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!870 (array!22521 array!22523 (_ BitVec 32) (_ BitVec 32) V!13515 V!13515 (_ BitVec 32) Int) ListLongMap!5231)

(assert (=> b!383121 (= lt!179864 (getCurrentListMapNoExtraKeys!870 lt!179866 lt!179870 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383121 (= lt!179870 (array!22524 (store (arr!10730 _values!506) i!548 (ValueCellFull!4310 v!373)) (size!11082 _values!506)))))

(assert (=> b!383121 (= lt!179867 (getCurrentListMapNoExtraKeys!870 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15525 () Bool)

(declare-fun tp!30693 () Bool)

(assert (=> mapNonEmpty!15525 (= mapRes!15525 (and tp!30693 e!232744))))

(declare-fun mapKey!15525 () (_ BitVec 32))

(declare-fun mapRest!15525 () (Array (_ BitVec 32) ValueCell!4310))

(declare-fun mapValue!15525 () ValueCell!4310)

(assert (=> mapNonEmpty!15525 (= (arr!10730 _values!506) (store mapRest!15525 mapKey!15525 mapValue!15525))))

(declare-fun b!383122 () Bool)

(declare-fun res!218060 () Bool)

(assert (=> b!383122 (=> (not res!218060) (not e!232740))))

(declare-fun arrayContainsKey!0 (array!22521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383122 (= res!218060 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!383123 () Bool)

(declare-fun res!218063 () Bool)

(assert (=> b!383123 (=> (not res!218063) (not e!232745))))

(declare-datatypes ((List!6152 0))(
  ( (Nil!6149) (Cons!6148 (h!7004 (_ BitVec 64)) (t!11302 List!6152)) )
))
(declare-fun arrayNoDuplicates!0 (array!22521 (_ BitVec 32) List!6152) Bool)

(assert (=> b!383123 (= res!218063 (arrayNoDuplicates!0 lt!179866 #b00000000000000000000000000000000 Nil!6149))))

(declare-fun b!383124 () Bool)

(declare-fun e!232743 () Bool)

(assert (=> b!383124 (= e!232743 tp_is_empty!9307)))

(declare-fun res!218061 () Bool)

(assert (=> start!37532 (=> (not res!218061) (not e!232740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37532 (= res!218061 (validMask!0 mask!970))))

(assert (=> start!37532 e!232740))

(declare-fun e!232741 () Bool)

(declare-fun array_inv!7898 (array!22523) Bool)

(assert (=> start!37532 (and (array_inv!7898 _values!506) e!232741)))

(assert (=> start!37532 tp!30692))

(assert (=> start!37532 true))

(assert (=> start!37532 tp_is_empty!9307))

(declare-fun array_inv!7899 (array!22521) Bool)

(assert (=> start!37532 (array_inv!7899 _keys!658)))

(declare-fun b!383117 () Bool)

(declare-fun res!218059 () Bool)

(assert (=> b!383117 (=> (not res!218059) (not e!232740))))

(assert (=> b!383117 (= res!218059 (or (= (select (arr!10729 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10729 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383125 () Bool)

(assert (=> b!383125 (= e!232740 e!232745)))

(declare-fun res!218056 () Bool)

(assert (=> b!383125 (=> (not res!218056) (not e!232745))))

(assert (=> b!383125 (= res!218056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179866 mask!970))))

(assert (=> b!383125 (= lt!179866 (array!22522 (store (arr!10729 _keys!658) i!548 k!778) (size!11081 _keys!658)))))

(declare-fun b!383126 () Bool)

(declare-fun res!218058 () Bool)

(assert (=> b!383126 (=> (not res!218058) (not e!232740))))

(assert (=> b!383126 (= res!218058 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6149))))

(declare-fun b!383127 () Bool)

(assert (=> b!383127 (= e!232741 (and e!232743 mapRes!15525))))

(declare-fun condMapEmpty!15525 () Bool)

(declare-fun mapDefault!15525 () ValueCell!4310)

