; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37548 () Bool)

(assert start!37548)

(declare-fun b_free!8689 () Bool)

(declare-fun b_next!8689 () Bool)

(assert (=> start!37548 (= b_free!8689 (not b_next!8689))))

(declare-fun tp!30783 () Bool)

(declare-fun b_and!15905 () Bool)

(assert (=> start!37548 (= tp!30783 b_and!15905)))

(declare-fun b!383475 () Bool)

(declare-fun e!232886 () Bool)

(assert (=> b!383475 (= e!232886 true)))

(declare-datatypes ((V!13555 0))(
  ( (V!13556 (val!4713 Int)) )
))
(declare-datatypes ((tuple2!6320 0))(
  ( (tuple2!6321 (_1!3171 (_ BitVec 64)) (_2!3171 V!13555)) )
))
(declare-datatypes ((List!6144 0))(
  ( (Nil!6141) (Cons!6140 (h!6996 tuple2!6320) (t!11285 List!6144)) )
))
(declare-datatypes ((ListLongMap!5223 0))(
  ( (ListLongMap!5224 (toList!2627 List!6144)) )
))
(declare-fun lt!180129 () ListLongMap!5223)

(declare-fun lt!180128 () ListLongMap!5223)

(declare-fun lt!180130 () tuple2!6320)

(declare-fun +!984 (ListLongMap!5223 tuple2!6320) ListLongMap!5223)

(assert (=> b!383475 (= lt!180129 (+!984 lt!180128 lt!180130))))

(declare-fun lt!180123 () ListLongMap!5223)

(declare-fun lt!180131 () ListLongMap!5223)

(assert (=> b!383475 (= lt!180123 lt!180131)))

(declare-fun b!383477 () Bool)

(declare-fun res!218432 () Bool)

(declare-fun e!232885 () Bool)

(assert (=> b!383477 (=> (not res!218432) (not e!232885))))

(declare-datatypes ((array!22563 0))(
  ( (array!22564 (arr!10750 (Array (_ BitVec 32) (_ BitVec 64))) (size!11103 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22563)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22563 (_ BitVec 32)) Bool)

(assert (=> b!383477 (= res!218432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383478 () Bool)

(declare-fun res!218425 () Bool)

(assert (=> b!383478 (=> (not res!218425) (not e!232885))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4325 0))(
  ( (ValueCellFull!4325 (v!6904 V!13555)) (EmptyCell!4325) )
))
(declare-datatypes ((array!22565 0))(
  ( (array!22566 (arr!10751 (Array (_ BitVec 32) ValueCell!4325)) (size!11104 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22565)

(assert (=> b!383478 (= res!218425 (and (= (size!11104 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11103 _keys!658) (size!11104 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383479 () Bool)

(declare-fun res!218430 () Bool)

(declare-fun e!232883 () Bool)

(assert (=> b!383479 (=> (not res!218430) (not e!232883))))

(declare-fun lt!180127 () array!22563)

(declare-datatypes ((List!6145 0))(
  ( (Nil!6142) (Cons!6141 (h!6997 (_ BitVec 64)) (t!11286 List!6145)) )
))
(declare-fun arrayNoDuplicates!0 (array!22563 (_ BitVec 32) List!6145) Bool)

(assert (=> b!383479 (= res!218430 (arrayNoDuplicates!0 lt!180127 #b00000000000000000000000000000000 Nil!6142))))

(declare-fun b!383480 () Bool)

(declare-fun res!218431 () Bool)

(assert (=> b!383480 (=> (not res!218431) (not e!232885))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383480 (= res!218431 (or (= (select (arr!10750 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10750 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383481 () Bool)

(declare-fun res!218424 () Bool)

(assert (=> b!383481 (=> (not res!218424) (not e!232885))))

(assert (=> b!383481 (= res!218424 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11103 _keys!658))))))

(declare-fun b!383482 () Bool)

(assert (=> b!383482 (= e!232885 e!232883)))

(declare-fun res!218428 () Bool)

(assert (=> b!383482 (=> (not res!218428) (not e!232883))))

(assert (=> b!383482 (= res!218428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180127 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!383482 (= lt!180127 (array!22564 (store (arr!10750 _keys!658) i!548 k0!778) (size!11103 _keys!658)))))

(declare-fun mapNonEmpty!15570 () Bool)

(declare-fun mapRes!15570 () Bool)

(declare-fun tp!30782 () Bool)

(declare-fun e!232882 () Bool)

(assert (=> mapNonEmpty!15570 (= mapRes!15570 (and tp!30782 e!232882))))

(declare-fun mapValue!15570 () ValueCell!4325)

(declare-fun mapKey!15570 () (_ BitVec 32))

(declare-fun mapRest!15570 () (Array (_ BitVec 32) ValueCell!4325))

(assert (=> mapNonEmpty!15570 (= (arr!10751 _values!506) (store mapRest!15570 mapKey!15570 mapValue!15570))))

(declare-fun b!383483 () Bool)

(declare-fun tp_is_empty!9337 () Bool)

(assert (=> b!383483 (= e!232882 tp_is_empty!9337)))

(declare-fun mapIsEmpty!15570 () Bool)

(assert (=> mapIsEmpty!15570 mapRes!15570))

(declare-fun b!383484 () Bool)

(assert (=> b!383484 (= e!232883 (not e!232886))))

(declare-fun res!218422 () Bool)

(assert (=> b!383484 (=> res!218422 e!232886)))

(declare-fun lt!180124 () Bool)

(assert (=> b!383484 (= res!218422 (or (and (not lt!180124) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180124) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180124)))))

(assert (=> b!383484 (= lt!180124 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13555)

(declare-fun minValue!472 () V!13555)

(declare-fun getCurrentListMap!2008 (array!22563 array!22565 (_ BitVec 32) (_ BitVec 32) V!13555 V!13555 (_ BitVec 32) Int) ListLongMap!5223)

(assert (=> b!383484 (= lt!180128 (getCurrentListMap!2008 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180126 () array!22565)

(assert (=> b!383484 (= lt!180123 (getCurrentListMap!2008 lt!180127 lt!180126 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180132 () ListLongMap!5223)

(assert (=> b!383484 (and (= lt!180131 lt!180132) (= lt!180132 lt!180131))))

(declare-fun lt!180125 () ListLongMap!5223)

(assert (=> b!383484 (= lt!180132 (+!984 lt!180125 lt!180130))))

(declare-fun v!373 () V!13555)

(assert (=> b!383484 (= lt!180130 (tuple2!6321 k0!778 v!373))))

(declare-datatypes ((Unit!11822 0))(
  ( (Unit!11823) )
))
(declare-fun lt!180122 () Unit!11822)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!201 (array!22563 array!22565 (_ BitVec 32) (_ BitVec 32) V!13555 V!13555 (_ BitVec 32) (_ BitVec 64) V!13555 (_ BitVec 32) Int) Unit!11822)

(assert (=> b!383484 (= lt!180122 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!201 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!873 (array!22563 array!22565 (_ BitVec 32) (_ BitVec 32) V!13555 V!13555 (_ BitVec 32) Int) ListLongMap!5223)

(assert (=> b!383484 (= lt!180131 (getCurrentListMapNoExtraKeys!873 lt!180127 lt!180126 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383484 (= lt!180126 (array!22566 (store (arr!10751 _values!506) i!548 (ValueCellFull!4325 v!373)) (size!11104 _values!506)))))

(assert (=> b!383484 (= lt!180125 (getCurrentListMapNoExtraKeys!873 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383476 () Bool)

(declare-fun res!218429 () Bool)

(assert (=> b!383476 (=> (not res!218429) (not e!232885))))

(declare-fun arrayContainsKey!0 (array!22563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383476 (= res!218429 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!218426 () Bool)

(assert (=> start!37548 (=> (not res!218426) (not e!232885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37548 (= res!218426 (validMask!0 mask!970))))

(assert (=> start!37548 e!232885))

(declare-fun e!232880 () Bool)

(declare-fun array_inv!7914 (array!22565) Bool)

(assert (=> start!37548 (and (array_inv!7914 _values!506) e!232880)))

(assert (=> start!37548 tp!30783))

(assert (=> start!37548 true))

(assert (=> start!37548 tp_is_empty!9337))

(declare-fun array_inv!7915 (array!22563) Bool)

(assert (=> start!37548 (array_inv!7915 _keys!658)))

(declare-fun b!383485 () Bool)

(declare-fun res!218423 () Bool)

(assert (=> b!383485 (=> (not res!218423) (not e!232885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383485 (= res!218423 (validKeyInArray!0 k0!778))))

(declare-fun b!383486 () Bool)

(declare-fun e!232881 () Bool)

(assert (=> b!383486 (= e!232880 (and e!232881 mapRes!15570))))

(declare-fun condMapEmpty!15570 () Bool)

(declare-fun mapDefault!15570 () ValueCell!4325)

(assert (=> b!383486 (= condMapEmpty!15570 (= (arr!10751 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4325)) mapDefault!15570)))))

(declare-fun b!383487 () Bool)

(declare-fun res!218427 () Bool)

(assert (=> b!383487 (=> (not res!218427) (not e!232885))))

(assert (=> b!383487 (= res!218427 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6142))))

(declare-fun b!383488 () Bool)

(assert (=> b!383488 (= e!232881 tp_is_empty!9337)))

(assert (= (and start!37548 res!218426) b!383478))

(assert (= (and b!383478 res!218425) b!383477))

(assert (= (and b!383477 res!218432) b!383487))

(assert (= (and b!383487 res!218427) b!383481))

(assert (= (and b!383481 res!218424) b!383485))

(assert (= (and b!383485 res!218423) b!383480))

(assert (= (and b!383480 res!218431) b!383476))

(assert (= (and b!383476 res!218429) b!383482))

(assert (= (and b!383482 res!218428) b!383479))

(assert (= (and b!383479 res!218430) b!383484))

(assert (= (and b!383484 (not res!218422)) b!383475))

(assert (= (and b!383486 condMapEmpty!15570) mapIsEmpty!15570))

(assert (= (and b!383486 (not condMapEmpty!15570)) mapNonEmpty!15570))

(get-info :version)

(assert (= (and mapNonEmpty!15570 ((_ is ValueCellFull!4325) mapValue!15570)) b!383483))

(assert (= (and b!383486 ((_ is ValueCellFull!4325) mapDefault!15570)) b!383488))

(assert (= start!37548 b!383486))

(declare-fun m!379751 () Bool)

(assert (=> b!383484 m!379751))

(declare-fun m!379753 () Bool)

(assert (=> b!383484 m!379753))

(declare-fun m!379755 () Bool)

(assert (=> b!383484 m!379755))

(declare-fun m!379757 () Bool)

(assert (=> b!383484 m!379757))

(declare-fun m!379759 () Bool)

(assert (=> b!383484 m!379759))

(declare-fun m!379761 () Bool)

(assert (=> b!383484 m!379761))

(declare-fun m!379763 () Bool)

(assert (=> b!383484 m!379763))

(declare-fun m!379765 () Bool)

(assert (=> b!383477 m!379765))

(declare-fun m!379767 () Bool)

(assert (=> b!383476 m!379767))

(declare-fun m!379769 () Bool)

(assert (=> b!383485 m!379769))

(declare-fun m!379771 () Bool)

(assert (=> mapNonEmpty!15570 m!379771))

(declare-fun m!379773 () Bool)

(assert (=> b!383487 m!379773))

(declare-fun m!379775 () Bool)

(assert (=> b!383482 m!379775))

(declare-fun m!379777 () Bool)

(assert (=> b!383482 m!379777))

(declare-fun m!379779 () Bool)

(assert (=> start!37548 m!379779))

(declare-fun m!379781 () Bool)

(assert (=> start!37548 m!379781))

(declare-fun m!379783 () Bool)

(assert (=> start!37548 m!379783))

(declare-fun m!379785 () Bool)

(assert (=> b!383479 m!379785))

(declare-fun m!379787 () Bool)

(assert (=> b!383475 m!379787))

(declare-fun m!379789 () Bool)

(assert (=> b!383480 m!379789))

(check-sat (not b!383482) (not b!383487) (not b_next!8689) b_and!15905 tp_is_empty!9337 (not b!383484) (not b!383475) (not b!383477) (not mapNonEmpty!15570) (not b!383485) (not start!37548) (not b!383476) (not b!383479))
(check-sat b_and!15905 (not b_next!8689))
