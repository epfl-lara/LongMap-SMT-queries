; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37548 () Bool)

(assert start!37548)

(declare-fun b_free!8675 () Bool)

(declare-fun b_next!8675 () Bool)

(assert (=> start!37548 (= b_free!8675 (not b_next!8675))))

(declare-fun tp!30741 () Bool)

(declare-fun b_and!15917 () Bool)

(assert (=> start!37548 (= tp!30741 b_and!15917)))

(declare-fun b!383452 () Bool)

(declare-fun e!232912 () Bool)

(declare-fun e!232913 () Bool)

(assert (=> b!383452 (= e!232912 (not e!232913))))

(declare-fun res!218330 () Bool)

(assert (=> b!383452 (=> res!218330 e!232913)))

(declare-fun lt!180132 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383452 (= res!218330 (or (and (not lt!180132) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180132) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180132)))))

(assert (=> b!383452 (= lt!180132 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((V!13535 0))(
  ( (V!13536 (val!4706 Int)) )
))
(declare-fun zeroValue!472 () V!13535)

(declare-datatypes ((array!22553 0))(
  ( (array!22554 (arr!10745 (Array (_ BitVec 32) (_ BitVec 64))) (size!11097 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22553)

(declare-datatypes ((ValueCell!4318 0))(
  ( (ValueCellFull!4318 (v!6903 V!13535)) (EmptyCell!4318) )
))
(declare-datatypes ((array!22555 0))(
  ( (array!22556 (arr!10746 (Array (_ BitVec 32) ValueCell!4318)) (size!11098 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22555)

(declare-datatypes ((tuple2!6330 0))(
  ( (tuple2!6331 (_1!3176 (_ BitVec 64)) (_2!3176 V!13535)) )
))
(declare-datatypes ((List!6165 0))(
  ( (Nil!6162) (Cons!6161 (h!7017 tuple2!6330) (t!11315 List!6165)) )
))
(declare-datatypes ((ListLongMap!5243 0))(
  ( (ListLongMap!5244 (toList!2637 List!6165)) )
))
(declare-fun lt!180129 () ListLongMap!5243)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13535)

(declare-fun getCurrentListMap!2042 (array!22553 array!22555 (_ BitVec 32) (_ BitVec 32) V!13535 V!13535 (_ BitVec 32) Int) ListLongMap!5243)

(assert (=> b!383452 (= lt!180129 (getCurrentListMap!2042 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180130 () array!22553)

(declare-fun lt!180128 () ListLongMap!5243)

(declare-fun lt!180135 () array!22555)

(assert (=> b!383452 (= lt!180128 (getCurrentListMap!2042 lt!180130 lt!180135 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180127 () ListLongMap!5243)

(declare-fun lt!180134 () ListLongMap!5243)

(assert (=> b!383452 (and (= lt!180127 lt!180134) (= lt!180134 lt!180127))))

(declare-fun lt!180126 () ListLongMap!5243)

(declare-fun lt!180133 () tuple2!6330)

(declare-fun +!972 (ListLongMap!5243 tuple2!6330) ListLongMap!5243)

(assert (=> b!383452 (= lt!180134 (+!972 lt!180126 lt!180133))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!13535)

(assert (=> b!383452 (= lt!180133 (tuple2!6331 k!778 v!373))))

(declare-datatypes ((Unit!11838 0))(
  ( (Unit!11839) )
))
(declare-fun lt!180131 () Unit!11838)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!200 (array!22553 array!22555 (_ BitVec 32) (_ BitVec 32) V!13535 V!13535 (_ BitVec 32) (_ BitVec 64) V!13535 (_ BitVec 32) Int) Unit!11838)

(assert (=> b!383452 (= lt!180131 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!200 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!876 (array!22553 array!22555 (_ BitVec 32) (_ BitVec 32) V!13535 V!13535 (_ BitVec 32) Int) ListLongMap!5243)

(assert (=> b!383452 (= lt!180127 (getCurrentListMapNoExtraKeys!876 lt!180130 lt!180135 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383452 (= lt!180135 (array!22556 (store (arr!10746 _values!506) i!548 (ValueCellFull!4318 v!373)) (size!11098 _values!506)))))

(assert (=> b!383452 (= lt!180126 (getCurrentListMapNoExtraKeys!876 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383453 () Bool)

(declare-fun res!218328 () Bool)

(declare-fun e!232909 () Bool)

(assert (=> b!383453 (=> (not res!218328) (not e!232909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22553 (_ BitVec 32)) Bool)

(assert (=> b!383453 (= res!218328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15549 () Bool)

(declare-fun mapRes!15549 () Bool)

(declare-fun tp!30740 () Bool)

(declare-fun e!232911 () Bool)

(assert (=> mapNonEmpty!15549 (= mapRes!15549 (and tp!30740 e!232911))))

(declare-fun mapRest!15549 () (Array (_ BitVec 32) ValueCell!4318))

(declare-fun mapKey!15549 () (_ BitVec 32))

(declare-fun mapValue!15549 () ValueCell!4318)

(assert (=> mapNonEmpty!15549 (= (arr!10746 _values!506) (store mapRest!15549 mapKey!15549 mapValue!15549))))

(declare-fun res!218329 () Bool)

(assert (=> start!37548 (=> (not res!218329) (not e!232909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37548 (= res!218329 (validMask!0 mask!970))))

(assert (=> start!37548 e!232909))

(declare-fun e!232908 () Bool)

(declare-fun array_inv!7908 (array!22555) Bool)

(assert (=> start!37548 (and (array_inv!7908 _values!506) e!232908)))

(assert (=> start!37548 tp!30741))

(assert (=> start!37548 true))

(declare-fun tp_is_empty!9323 () Bool)

(assert (=> start!37548 tp_is_empty!9323))

(declare-fun array_inv!7909 (array!22553) Bool)

(assert (=> start!37548 (array_inv!7909 _keys!658)))

(declare-fun b!383454 () Bool)

(assert (=> b!383454 (= e!232913 true)))

(declare-fun lt!180125 () ListLongMap!5243)

(assert (=> b!383454 (= lt!180125 (+!972 lt!180129 lt!180133))))

(assert (=> b!383454 (= lt!180128 lt!180127)))

(declare-fun b!383455 () Bool)

(assert (=> b!383455 (= e!232909 e!232912)))

(declare-fun res!218320 () Bool)

(assert (=> b!383455 (=> (not res!218320) (not e!232912))))

(assert (=> b!383455 (= res!218320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180130 mask!970))))

(assert (=> b!383455 (= lt!180130 (array!22554 (store (arr!10745 _keys!658) i!548 k!778) (size!11097 _keys!658)))))

(declare-fun b!383456 () Bool)

(assert (=> b!383456 (= e!232911 tp_is_empty!9323)))

(declare-fun b!383457 () Bool)

(declare-fun res!218327 () Bool)

(assert (=> b!383457 (=> (not res!218327) (not e!232909))))

(declare-fun arrayContainsKey!0 (array!22553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383457 (= res!218327 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!383458 () Bool)

(declare-fun res!218324 () Bool)

(assert (=> b!383458 (=> (not res!218324) (not e!232909))))

(declare-datatypes ((List!6166 0))(
  ( (Nil!6163) (Cons!6162 (h!7018 (_ BitVec 64)) (t!11316 List!6166)) )
))
(declare-fun arrayNoDuplicates!0 (array!22553 (_ BitVec 32) List!6166) Bool)

(assert (=> b!383458 (= res!218324 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6163))))

(declare-fun b!383459 () Bool)

(declare-fun e!232907 () Bool)

(assert (=> b!383459 (= e!232907 tp_is_empty!9323)))

(declare-fun b!383460 () Bool)

(declare-fun res!218321 () Bool)

(assert (=> b!383460 (=> (not res!218321) (not e!232909))))

(assert (=> b!383460 (= res!218321 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11097 _keys!658))))))

(declare-fun b!383461 () Bool)

(declare-fun res!218322 () Bool)

(assert (=> b!383461 (=> (not res!218322) (not e!232912))))

(assert (=> b!383461 (= res!218322 (arrayNoDuplicates!0 lt!180130 #b00000000000000000000000000000000 Nil!6163))))

(declare-fun b!383462 () Bool)

(assert (=> b!383462 (= e!232908 (and e!232907 mapRes!15549))))

(declare-fun condMapEmpty!15549 () Bool)

(declare-fun mapDefault!15549 () ValueCell!4318)

