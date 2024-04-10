; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37590 () Bool)

(assert start!37590)

(declare-fun b_free!8717 () Bool)

(declare-fun b_next!8717 () Bool)

(assert (=> start!37590 (= b_free!8717 (not b_next!8717))))

(declare-fun tp!30867 () Bool)

(declare-fun b_and!15959 () Bool)

(assert (=> start!37590 (= tp!30867 b_and!15959)))

(declare-fun b!384343 () Bool)

(declare-fun e!233359 () Bool)

(declare-fun e!233363 () Bool)

(assert (=> b!384343 (= e!233359 e!233363)))

(declare-fun res!219026 () Bool)

(assert (=> b!384343 (=> (not res!219026) (not e!233363))))

(declare-datatypes ((array!22635 0))(
  ( (array!22636 (arr!10786 (Array (_ BitVec 32) (_ BitVec 64))) (size!11138 (_ BitVec 32))) )
))
(declare-fun lt!180816 () array!22635)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22635 (_ BitVec 32)) Bool)

(assert (=> b!384343 (= res!219026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180816 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22635)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384343 (= lt!180816 (array!22636 (store (arr!10786 _keys!658) i!548 k!778) (size!11138 _keys!658)))))

(declare-fun b!384344 () Bool)

(declare-fun e!233358 () Bool)

(assert (=> b!384344 (= e!233363 (not e!233358))))

(declare-fun res!219032 () Bool)

(assert (=> b!384344 (=> res!219032 e!233358)))

(declare-fun lt!180811 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384344 (= res!219032 (or (and (not lt!180811) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180811) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180811)))))

(assert (=> b!384344 (= lt!180811 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13591 0))(
  ( (V!13592 (val!4727 Int)) )
))
(declare-datatypes ((ValueCell!4339 0))(
  ( (ValueCellFull!4339 (v!6924 V!13591)) (EmptyCell!4339) )
))
(declare-datatypes ((array!22637 0))(
  ( (array!22638 (arr!10787 (Array (_ BitVec 32) ValueCell!4339)) (size!11139 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22637)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13591)

(declare-datatypes ((tuple2!6362 0))(
  ( (tuple2!6363 (_1!3192 (_ BitVec 64)) (_2!3192 V!13591)) )
))
(declare-datatypes ((List!6198 0))(
  ( (Nil!6195) (Cons!6194 (h!7050 tuple2!6362) (t!11348 List!6198)) )
))
(declare-datatypes ((ListLongMap!5275 0))(
  ( (ListLongMap!5276 (toList!2653 List!6198)) )
))
(declare-fun lt!180813 () ListLongMap!5275)

(declare-fun minValue!472 () V!13591)

(declare-fun getCurrentListMap!2054 (array!22635 array!22637 (_ BitVec 32) (_ BitVec 32) V!13591 V!13591 (_ BitVec 32) Int) ListLongMap!5275)

(assert (=> b!384344 (= lt!180813 (getCurrentListMap!2054 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180815 () ListLongMap!5275)

(declare-fun lt!180812 () array!22637)

(assert (=> b!384344 (= lt!180815 (getCurrentListMap!2054 lt!180816 lt!180812 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180819 () ListLongMap!5275)

(declare-fun lt!180814 () ListLongMap!5275)

(assert (=> b!384344 (and (= lt!180819 lt!180814) (= lt!180814 lt!180819))))

(declare-fun lt!180818 () ListLongMap!5275)

(declare-fun lt!180810 () tuple2!6362)

(declare-fun +!988 (ListLongMap!5275 tuple2!6362) ListLongMap!5275)

(assert (=> b!384344 (= lt!180814 (+!988 lt!180818 lt!180810))))

(declare-fun v!373 () V!13591)

(assert (=> b!384344 (= lt!180810 (tuple2!6363 k!778 v!373))))

(declare-datatypes ((Unit!11862 0))(
  ( (Unit!11863) )
))
(declare-fun lt!180817 () Unit!11862)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!212 (array!22635 array!22637 (_ BitVec 32) (_ BitVec 32) V!13591 V!13591 (_ BitVec 32) (_ BitVec 64) V!13591 (_ BitVec 32) Int) Unit!11862)

(assert (=> b!384344 (= lt!180817 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!212 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!888 (array!22635 array!22637 (_ BitVec 32) (_ BitVec 32) V!13591 V!13591 (_ BitVec 32) Int) ListLongMap!5275)

(assert (=> b!384344 (= lt!180819 (getCurrentListMapNoExtraKeys!888 lt!180816 lt!180812 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384344 (= lt!180812 (array!22638 (store (arr!10787 _values!506) i!548 (ValueCellFull!4339 v!373)) (size!11139 _values!506)))))

(assert (=> b!384344 (= lt!180818 (getCurrentListMapNoExtraKeys!888 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384345 () Bool)

(declare-fun res!219028 () Bool)

(assert (=> b!384345 (=> (not res!219028) (not e!233359))))

(declare-fun arrayContainsKey!0 (array!22635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384345 (= res!219028 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15612 () Bool)

(declare-fun mapRes!15612 () Bool)

(assert (=> mapIsEmpty!15612 mapRes!15612))

(declare-fun b!384346 () Bool)

(declare-fun res!219023 () Bool)

(assert (=> b!384346 (=> (not res!219023) (not e!233359))))

(assert (=> b!384346 (= res!219023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384347 () Bool)

(declare-fun res!219027 () Bool)

(assert (=> b!384347 (=> (not res!219027) (not e!233363))))

(declare-datatypes ((List!6199 0))(
  ( (Nil!6196) (Cons!6195 (h!7051 (_ BitVec 64)) (t!11349 List!6199)) )
))
(declare-fun arrayNoDuplicates!0 (array!22635 (_ BitVec 32) List!6199) Bool)

(assert (=> b!384347 (= res!219027 (arrayNoDuplicates!0 lt!180816 #b00000000000000000000000000000000 Nil!6196))))

(declare-fun b!384348 () Bool)

(declare-fun e!233357 () Bool)

(declare-fun tp_is_empty!9365 () Bool)

(assert (=> b!384348 (= e!233357 tp_is_empty!9365)))

(declare-fun b!384350 () Bool)

(assert (=> b!384350 (= e!233358 true)))

(declare-fun lt!180809 () ListLongMap!5275)

(assert (=> b!384350 (= lt!180809 (+!988 lt!180813 lt!180810))))

(assert (=> b!384350 (= lt!180815 lt!180819)))

(declare-fun b!384351 () Bool)

(declare-fun res!219024 () Bool)

(assert (=> b!384351 (=> (not res!219024) (not e!233359))))

(assert (=> b!384351 (= res!219024 (and (= (size!11139 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11138 _keys!658) (size!11139 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384352 () Bool)

(declare-fun res!219022 () Bool)

(assert (=> b!384352 (=> (not res!219022) (not e!233359))))

(assert (=> b!384352 (= res!219022 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11138 _keys!658))))))

(declare-fun mapNonEmpty!15612 () Bool)

(declare-fun tp!30866 () Bool)

(assert (=> mapNonEmpty!15612 (= mapRes!15612 (and tp!30866 e!233357))))

(declare-fun mapValue!15612 () ValueCell!4339)

(declare-fun mapKey!15612 () (_ BitVec 32))

(declare-fun mapRest!15612 () (Array (_ BitVec 32) ValueCell!4339))

(assert (=> mapNonEmpty!15612 (= (arr!10787 _values!506) (store mapRest!15612 mapKey!15612 mapValue!15612))))

(declare-fun res!219029 () Bool)

(assert (=> start!37590 (=> (not res!219029) (not e!233359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37590 (= res!219029 (validMask!0 mask!970))))

(assert (=> start!37590 e!233359))

(declare-fun e!233361 () Bool)

(declare-fun array_inv!7942 (array!22637) Bool)

(assert (=> start!37590 (and (array_inv!7942 _values!506) e!233361)))

(assert (=> start!37590 tp!30867))

(assert (=> start!37590 true))

(assert (=> start!37590 tp_is_empty!9365))

(declare-fun array_inv!7943 (array!22635) Bool)

(assert (=> start!37590 (array_inv!7943 _keys!658)))

(declare-fun b!384349 () Bool)

(declare-fun res!219025 () Bool)

(assert (=> b!384349 (=> (not res!219025) (not e!233359))))

(assert (=> b!384349 (= res!219025 (or (= (select (arr!10786 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10786 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384353 () Bool)

(declare-fun e!233360 () Bool)

(assert (=> b!384353 (= e!233360 tp_is_empty!9365)))

(declare-fun b!384354 () Bool)

(declare-fun res!219030 () Bool)

(assert (=> b!384354 (=> (not res!219030) (not e!233359))))

(assert (=> b!384354 (= res!219030 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6196))))

(declare-fun b!384355 () Bool)

(assert (=> b!384355 (= e!233361 (and e!233360 mapRes!15612))))

(declare-fun condMapEmpty!15612 () Bool)

(declare-fun mapDefault!15612 () ValueCell!4339)

