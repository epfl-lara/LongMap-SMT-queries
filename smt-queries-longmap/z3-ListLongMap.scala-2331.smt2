; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37450 () Bool)

(assert start!37450)

(declare-fun b_free!8577 () Bool)

(declare-fun b_next!8577 () Bool)

(assert (=> start!37450 (= b_free!8577 (not b_next!8577))))

(declare-fun tp!30447 () Bool)

(declare-fun b_and!15819 () Bool)

(assert (=> start!37450 (= tp!30447 b_and!15819)))

(declare-fun b!381394 () Bool)

(declare-fun res!216703 () Bool)

(declare-fun e!231884 () Bool)

(assert (=> b!381394 (=> (not res!216703) (not e!231884))))

(declare-datatypes ((array!22365 0))(
  ( (array!22366 (arr!10651 (Array (_ BitVec 32) (_ BitVec 64))) (size!11003 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22365)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381394 (= res!216703 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381395 () Bool)

(declare-fun res!216707 () Bool)

(assert (=> b!381395 (=> (not res!216707) (not e!231884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381395 (= res!216707 (validKeyInArray!0 k0!778))))

(declare-fun b!381396 () Bool)

(declare-fun res!216709 () Bool)

(assert (=> b!381396 (=> (not res!216709) (not e!231884))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22365 (_ BitVec 32)) Bool)

(assert (=> b!381396 (= res!216709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381397 () Bool)

(declare-fun e!231879 () Bool)

(declare-fun e!231883 () Bool)

(assert (=> b!381397 (= e!231879 (not e!231883))))

(declare-fun res!216705 () Bool)

(assert (=> b!381397 (=> res!216705 e!231883)))

(declare-fun lt!178754 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381397 (= res!216705 (or (and (not lt!178754) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178754) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178754)))))

(assert (=> b!381397 (= lt!178754 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13405 0))(
  ( (V!13406 (val!4657 Int)) )
))
(declare-datatypes ((ValueCell!4269 0))(
  ( (ValueCellFull!4269 (v!6854 V!13405)) (EmptyCell!4269) )
))
(declare-datatypes ((array!22367 0))(
  ( (array!22368 (arr!10652 (Array (_ BitVec 32) ValueCell!4269)) (size!11004 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22367)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6254 0))(
  ( (tuple2!6255 (_1!3138 (_ BitVec 64)) (_2!3138 V!13405)) )
))
(declare-datatypes ((List!6085 0))(
  ( (Nil!6082) (Cons!6081 (h!6937 tuple2!6254) (t!11235 List!6085)) )
))
(declare-datatypes ((ListLongMap!5167 0))(
  ( (ListLongMap!5168 (toList!2599 List!6085)) )
))
(declare-fun lt!178755 () ListLongMap!5167)

(declare-fun zeroValue!472 () V!13405)

(declare-fun minValue!472 () V!13405)

(declare-fun getCurrentListMap!2012 (array!22365 array!22367 (_ BitVec 32) (_ BitVec 32) V!13405 V!13405 (_ BitVec 32) Int) ListLongMap!5167)

(assert (=> b!381397 (= lt!178755 (getCurrentListMap!2012 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178751 () ListLongMap!5167)

(declare-fun lt!178750 () array!22367)

(declare-fun lt!178752 () array!22365)

(assert (=> b!381397 (= lt!178751 (getCurrentListMap!2012 lt!178752 lt!178750 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178756 () ListLongMap!5167)

(declare-fun lt!178757 () ListLongMap!5167)

(assert (=> b!381397 (and (= lt!178756 lt!178757) (= lt!178757 lt!178756))))

(declare-fun lt!178758 () ListLongMap!5167)

(declare-fun v!373 () V!13405)

(declare-fun +!942 (ListLongMap!5167 tuple2!6254) ListLongMap!5167)

(assert (=> b!381397 (= lt!178757 (+!942 lt!178758 (tuple2!6255 k0!778 v!373)))))

(declare-datatypes ((Unit!11778 0))(
  ( (Unit!11779) )
))
(declare-fun lt!178753 () Unit!11778)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!170 (array!22365 array!22367 (_ BitVec 32) (_ BitVec 32) V!13405 V!13405 (_ BitVec 32) (_ BitVec 64) V!13405 (_ BitVec 32) Int) Unit!11778)

(assert (=> b!381397 (= lt!178753 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!170 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!846 (array!22365 array!22367 (_ BitVec 32) (_ BitVec 32) V!13405 V!13405 (_ BitVec 32) Int) ListLongMap!5167)

(assert (=> b!381397 (= lt!178756 (getCurrentListMapNoExtraKeys!846 lt!178752 lt!178750 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381397 (= lt!178750 (array!22368 (store (arr!10652 _values!506) i!548 (ValueCellFull!4269 v!373)) (size!11004 _values!506)))))

(assert (=> b!381397 (= lt!178758 (getCurrentListMapNoExtraKeys!846 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381398 () Bool)

(declare-fun e!231882 () Bool)

(declare-fun e!231878 () Bool)

(declare-fun mapRes!15402 () Bool)

(assert (=> b!381398 (= e!231882 (and e!231878 mapRes!15402))))

(declare-fun condMapEmpty!15402 () Bool)

(declare-fun mapDefault!15402 () ValueCell!4269)

(assert (=> b!381398 (= condMapEmpty!15402 (= (arr!10652 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4269)) mapDefault!15402)))))

(declare-fun b!381399 () Bool)

(declare-fun res!216710 () Bool)

(assert (=> b!381399 (=> (not res!216710) (not e!231879))))

(declare-datatypes ((List!6086 0))(
  ( (Nil!6083) (Cons!6082 (h!6938 (_ BitVec 64)) (t!11236 List!6086)) )
))
(declare-fun arrayNoDuplicates!0 (array!22365 (_ BitVec 32) List!6086) Bool)

(assert (=> b!381399 (= res!216710 (arrayNoDuplicates!0 lt!178752 #b00000000000000000000000000000000 Nil!6083))))

(declare-fun b!381400 () Bool)

(declare-fun e!231880 () Bool)

(declare-fun tp_is_empty!9225 () Bool)

(assert (=> b!381400 (= e!231880 tp_is_empty!9225)))

(declare-fun b!381401 () Bool)

(declare-fun res!216704 () Bool)

(assert (=> b!381401 (=> (not res!216704) (not e!231884))))

(assert (=> b!381401 (= res!216704 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6083))))

(declare-fun b!381402 () Bool)

(declare-fun res!216713 () Bool)

(assert (=> b!381402 (=> (not res!216713) (not e!231884))))

(assert (=> b!381402 (= res!216713 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11003 _keys!658))))))

(declare-fun b!381403 () Bool)

(declare-fun res!216706 () Bool)

(assert (=> b!381403 (=> (not res!216706) (not e!231884))))

(assert (=> b!381403 (= res!216706 (or (= (select (arr!10651 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10651 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15402 () Bool)

(declare-fun tp!30446 () Bool)

(assert (=> mapNonEmpty!15402 (= mapRes!15402 (and tp!30446 e!231880))))

(declare-fun mapRest!15402 () (Array (_ BitVec 32) ValueCell!4269))

(declare-fun mapKey!15402 () (_ BitVec 32))

(declare-fun mapValue!15402 () ValueCell!4269)

(assert (=> mapNonEmpty!15402 (= (arr!10652 _values!506) (store mapRest!15402 mapKey!15402 mapValue!15402))))

(declare-fun b!381405 () Bool)

(assert (=> b!381405 (= e!231883 true)))

(assert (=> b!381405 (= lt!178751 lt!178756)))

(declare-fun b!381406 () Bool)

(assert (=> b!381406 (= e!231878 tp_is_empty!9225)))

(declare-fun mapIsEmpty!15402 () Bool)

(assert (=> mapIsEmpty!15402 mapRes!15402))

(declare-fun b!381407 () Bool)

(assert (=> b!381407 (= e!231884 e!231879)))

(declare-fun res!216711 () Bool)

(assert (=> b!381407 (=> (not res!216711) (not e!231879))))

(assert (=> b!381407 (= res!216711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178752 mask!970))))

(assert (=> b!381407 (= lt!178752 (array!22366 (store (arr!10651 _keys!658) i!548 k0!778) (size!11003 _keys!658)))))

(declare-fun b!381404 () Bool)

(declare-fun res!216712 () Bool)

(assert (=> b!381404 (=> (not res!216712) (not e!231884))))

(assert (=> b!381404 (= res!216712 (and (= (size!11004 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11003 _keys!658) (size!11004 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!216708 () Bool)

(assert (=> start!37450 (=> (not res!216708) (not e!231884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37450 (= res!216708 (validMask!0 mask!970))))

(assert (=> start!37450 e!231884))

(declare-fun array_inv!7842 (array!22367) Bool)

(assert (=> start!37450 (and (array_inv!7842 _values!506) e!231882)))

(assert (=> start!37450 tp!30447))

(assert (=> start!37450 true))

(assert (=> start!37450 tp_is_empty!9225))

(declare-fun array_inv!7843 (array!22365) Bool)

(assert (=> start!37450 (array_inv!7843 _keys!658)))

(assert (= (and start!37450 res!216708) b!381404))

(assert (= (and b!381404 res!216712) b!381396))

(assert (= (and b!381396 res!216709) b!381401))

(assert (= (and b!381401 res!216704) b!381402))

(assert (= (and b!381402 res!216713) b!381395))

(assert (= (and b!381395 res!216707) b!381403))

(assert (= (and b!381403 res!216706) b!381394))

(assert (= (and b!381394 res!216703) b!381407))

(assert (= (and b!381407 res!216711) b!381399))

(assert (= (and b!381399 res!216710) b!381397))

(assert (= (and b!381397 (not res!216705)) b!381405))

(assert (= (and b!381398 condMapEmpty!15402) mapIsEmpty!15402))

(assert (= (and b!381398 (not condMapEmpty!15402)) mapNonEmpty!15402))

(get-info :version)

(assert (= (and mapNonEmpty!15402 ((_ is ValueCellFull!4269) mapValue!15402)) b!381400))

(assert (= (and b!381398 ((_ is ValueCellFull!4269) mapDefault!15402)) b!381406))

(assert (= start!37450 b!381398))

(declare-fun m!378317 () Bool)

(assert (=> b!381395 m!378317))

(declare-fun m!378319 () Bool)

(assert (=> b!381396 m!378319))

(declare-fun m!378321 () Bool)

(assert (=> b!381394 m!378321))

(declare-fun m!378323 () Bool)

(assert (=> b!381401 m!378323))

(declare-fun m!378325 () Bool)

(assert (=> start!37450 m!378325))

(declare-fun m!378327 () Bool)

(assert (=> start!37450 m!378327))

(declare-fun m!378329 () Bool)

(assert (=> start!37450 m!378329))

(declare-fun m!378331 () Bool)

(assert (=> mapNonEmpty!15402 m!378331))

(declare-fun m!378333 () Bool)

(assert (=> b!381407 m!378333))

(declare-fun m!378335 () Bool)

(assert (=> b!381407 m!378335))

(declare-fun m!378337 () Bool)

(assert (=> b!381397 m!378337))

(declare-fun m!378339 () Bool)

(assert (=> b!381397 m!378339))

(declare-fun m!378341 () Bool)

(assert (=> b!381397 m!378341))

(declare-fun m!378343 () Bool)

(assert (=> b!381397 m!378343))

(declare-fun m!378345 () Bool)

(assert (=> b!381397 m!378345))

(declare-fun m!378347 () Bool)

(assert (=> b!381397 m!378347))

(declare-fun m!378349 () Bool)

(assert (=> b!381397 m!378349))

(declare-fun m!378351 () Bool)

(assert (=> b!381403 m!378351))

(declare-fun m!378353 () Bool)

(assert (=> b!381399 m!378353))

(check-sat (not b!381396) (not b!381394) (not b!381401) (not b!381399) (not b_next!8577) (not mapNonEmpty!15402) (not b!381395) (not start!37450) (not b!381407) b_and!15819 (not b!381397) tp_is_empty!9225)
(check-sat b_and!15819 (not b_next!8577))
