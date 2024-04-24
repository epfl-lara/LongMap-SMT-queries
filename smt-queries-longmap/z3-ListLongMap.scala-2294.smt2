; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37212 () Bool)

(assert start!37212)

(declare-fun b_free!8353 () Bool)

(declare-fun b_next!8353 () Bool)

(assert (=> start!37212 (= b_free!8353 (not b_next!8353))))

(declare-fun tp!29774 () Bool)

(declare-fun b_and!15609 () Bool)

(assert (=> start!37212 (= tp!29774 b_and!15609)))

(declare-fun b!376337 () Bool)

(declare-fun e!229202 () Bool)

(declare-fun tp_is_empty!9001 () Bool)

(assert (=> b!376337 (= e!229202 tp_is_empty!9001)))

(declare-fun mapIsEmpty!15066 () Bool)

(declare-fun mapRes!15066 () Bool)

(assert (=> mapIsEmpty!15066 mapRes!15066))

(declare-fun b!376338 () Bool)

(declare-fun e!229200 () Bool)

(assert (=> b!376338 (= e!229200 true)))

(declare-datatypes ((V!13107 0))(
  ( (V!13108 (val!4545 Int)) )
))
(declare-datatypes ((tuple2!5962 0))(
  ( (tuple2!5963 (_1!2992 (_ BitVec 64)) (_2!2992 V!13107)) )
))
(declare-datatypes ((List!5804 0))(
  ( (Nil!5801) (Cons!5800 (h!6656 tuple2!5962) (t!10946 List!5804)) )
))
(declare-datatypes ((ListLongMap!4877 0))(
  ( (ListLongMap!4878 (toList!2454 List!5804)) )
))
(declare-fun lt!174606 () ListLongMap!4877)

(declare-fun lt!174603 () ListLongMap!4877)

(declare-fun lt!174611 () tuple2!5962)

(declare-fun +!850 (ListLongMap!4877 tuple2!5962) ListLongMap!4877)

(assert (=> b!376338 (= lt!174606 (+!850 lt!174603 lt!174611))))

(declare-fun v!373 () V!13107)

(declare-datatypes ((Unit!11587 0))(
  ( (Unit!11588) )
))
(declare-fun lt!174610 () Unit!11587)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun lt!174605 () ListLongMap!4877)

(declare-fun zeroValue!472 () V!13107)

(declare-fun addCommutativeForDiffKeys!271 (ListLongMap!4877 (_ BitVec 64) V!13107 (_ BitVec 64) V!13107) Unit!11587)

(assert (=> b!376338 (= lt!174610 (addCommutativeForDiffKeys!271 lt!174605 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376339 () Bool)

(declare-fun res!212700 () Bool)

(declare-fun e!229206 () Bool)

(assert (=> b!376339 (=> (not res!212700) (not e!229206))))

(declare-datatypes ((array!21920 0))(
  ( (array!21921 (arr!10428 (Array (_ BitVec 32) (_ BitVec 64))) (size!10780 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21920)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21920 (_ BitVec 32)) Bool)

(assert (=> b!376339 (= res!212700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376340 () Bool)

(declare-fun e!229199 () Bool)

(assert (=> b!376340 (= e!229199 (and e!229202 mapRes!15066))))

(declare-fun condMapEmpty!15066 () Bool)

(declare-datatypes ((ValueCell!4157 0))(
  ( (ValueCellFull!4157 (v!6743 V!13107)) (EmptyCell!4157) )
))
(declare-datatypes ((array!21922 0))(
  ( (array!21923 (arr!10429 (Array (_ BitVec 32) ValueCell!4157)) (size!10781 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21922)

(declare-fun mapDefault!15066 () ValueCell!4157)

(assert (=> b!376340 (= condMapEmpty!15066 (= (arr!10429 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4157)) mapDefault!15066)))))

(declare-fun b!376341 () Bool)

(declare-fun res!212708 () Bool)

(assert (=> b!376341 (=> (not res!212708) (not e!229206))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376341 (= res!212708 (or (= (select (arr!10428 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10428 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376343 () Bool)

(declare-fun res!212701 () Bool)

(assert (=> b!376343 (=> (not res!212701) (not e!229206))))

(declare-fun arrayContainsKey!0 (array!21920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376343 (= res!212701 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15066 () Bool)

(declare-fun tp!29775 () Bool)

(declare-fun e!229201 () Bool)

(assert (=> mapNonEmpty!15066 (= mapRes!15066 (and tp!29775 e!229201))))

(declare-fun mapValue!15066 () ValueCell!4157)

(declare-fun mapKey!15066 () (_ BitVec 32))

(declare-fun mapRest!15066 () (Array (_ BitVec 32) ValueCell!4157))

(assert (=> mapNonEmpty!15066 (= (arr!10429 _values!506) (store mapRest!15066 mapKey!15066 mapValue!15066))))

(declare-fun b!376344 () Bool)

(declare-fun e!229205 () Bool)

(assert (=> b!376344 (= e!229206 e!229205)))

(declare-fun res!212709 () Bool)

(assert (=> b!376344 (=> (not res!212709) (not e!229205))))

(declare-fun lt!174612 () array!21920)

(assert (=> b!376344 (= res!212709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174612 mask!970))))

(assert (=> b!376344 (= lt!174612 (array!21921 (store (arr!10428 _keys!658) i!548 k0!778) (size!10780 _keys!658)))))

(declare-fun b!376345 () Bool)

(declare-fun res!212705 () Bool)

(assert (=> b!376345 (=> (not res!212705) (not e!229206))))

(declare-datatypes ((List!5805 0))(
  ( (Nil!5802) (Cons!5801 (h!6657 (_ BitVec 64)) (t!10947 List!5805)) )
))
(declare-fun arrayNoDuplicates!0 (array!21920 (_ BitVec 32) List!5805) Bool)

(assert (=> b!376345 (= res!212705 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5802))))

(declare-fun b!376346 () Bool)

(declare-fun res!212706 () Bool)

(assert (=> b!376346 (=> (not res!212706) (not e!229206))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376346 (= res!212706 (and (= (size!10781 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10780 _keys!658) (size!10781 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376347 () Bool)

(declare-fun e!229204 () Bool)

(assert (=> b!376347 (= e!229204 e!229200)))

(declare-fun res!212704 () Bool)

(assert (=> b!376347 (=> res!212704 e!229200)))

(assert (=> b!376347 (= res!212704 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!174609 () ListLongMap!4877)

(assert (=> b!376347 (= lt!174609 lt!174606)))

(declare-fun lt!174602 () ListLongMap!4877)

(declare-fun lt!174608 () tuple2!5962)

(assert (=> b!376347 (= lt!174606 (+!850 lt!174602 lt!174608))))

(declare-fun lt!174604 () ListLongMap!4877)

(assert (=> b!376347 (= lt!174604 lt!174603)))

(assert (=> b!376347 (= lt!174603 (+!850 lt!174605 lt!174608))))

(declare-fun lt!174607 () ListLongMap!4877)

(assert (=> b!376347 (= lt!174609 (+!850 lt!174607 lt!174608))))

(assert (=> b!376347 (= lt!174608 (tuple2!5963 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376348 () Bool)

(assert (=> b!376348 (= e!229205 (not e!229204))))

(declare-fun res!212711 () Bool)

(assert (=> b!376348 (=> res!212711 e!229204)))

(assert (=> b!376348 (= res!212711 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13107)

(declare-fun getCurrentListMap!1905 (array!21920 array!21922 (_ BitVec 32) (_ BitVec 32) V!13107 V!13107 (_ BitVec 32) Int) ListLongMap!4877)

(assert (=> b!376348 (= lt!174604 (getCurrentListMap!1905 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174601 () array!21922)

(assert (=> b!376348 (= lt!174609 (getCurrentListMap!1905 lt!174612 lt!174601 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376348 (and (= lt!174607 lt!174602) (= lt!174602 lt!174607))))

(assert (=> b!376348 (= lt!174602 (+!850 lt!174605 lt!174611))))

(assert (=> b!376348 (= lt!174611 (tuple2!5963 k0!778 v!373))))

(declare-fun lt!174613 () Unit!11587)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!92 (array!21920 array!21922 (_ BitVec 32) (_ BitVec 32) V!13107 V!13107 (_ BitVec 32) (_ BitVec 64) V!13107 (_ BitVec 32) Int) Unit!11587)

(assert (=> b!376348 (= lt!174613 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!92 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!752 (array!21920 array!21922 (_ BitVec 32) (_ BitVec 32) V!13107 V!13107 (_ BitVec 32) Int) ListLongMap!4877)

(assert (=> b!376348 (= lt!174607 (getCurrentListMapNoExtraKeys!752 lt!174612 lt!174601 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376348 (= lt!174601 (array!21923 (store (arr!10429 _values!506) i!548 (ValueCellFull!4157 v!373)) (size!10781 _values!506)))))

(assert (=> b!376348 (= lt!174605 (getCurrentListMapNoExtraKeys!752 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376349 () Bool)

(declare-fun res!212702 () Bool)

(assert (=> b!376349 (=> (not res!212702) (not e!229205))))

(assert (=> b!376349 (= res!212702 (arrayNoDuplicates!0 lt!174612 #b00000000000000000000000000000000 Nil!5802))))

(declare-fun b!376342 () Bool)

(declare-fun res!212710 () Bool)

(assert (=> b!376342 (=> (not res!212710) (not e!229206))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376342 (= res!212710 (validKeyInArray!0 k0!778))))

(declare-fun res!212703 () Bool)

(assert (=> start!37212 (=> (not res!212703) (not e!229206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37212 (= res!212703 (validMask!0 mask!970))))

(assert (=> start!37212 e!229206))

(declare-fun array_inv!7740 (array!21922) Bool)

(assert (=> start!37212 (and (array_inv!7740 _values!506) e!229199)))

(assert (=> start!37212 tp!29774))

(assert (=> start!37212 true))

(assert (=> start!37212 tp_is_empty!9001))

(declare-fun array_inv!7741 (array!21920) Bool)

(assert (=> start!37212 (array_inv!7741 _keys!658)))

(declare-fun b!376350 () Bool)

(declare-fun res!212707 () Bool)

(assert (=> b!376350 (=> (not res!212707) (not e!229206))))

(assert (=> b!376350 (= res!212707 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10780 _keys!658))))))

(declare-fun b!376351 () Bool)

(assert (=> b!376351 (= e!229201 tp_is_empty!9001)))

(assert (= (and start!37212 res!212703) b!376346))

(assert (= (and b!376346 res!212706) b!376339))

(assert (= (and b!376339 res!212700) b!376345))

(assert (= (and b!376345 res!212705) b!376350))

(assert (= (and b!376350 res!212707) b!376342))

(assert (= (and b!376342 res!212710) b!376341))

(assert (= (and b!376341 res!212708) b!376343))

(assert (= (and b!376343 res!212701) b!376344))

(assert (= (and b!376344 res!212709) b!376349))

(assert (= (and b!376349 res!212702) b!376348))

(assert (= (and b!376348 (not res!212711)) b!376347))

(assert (= (and b!376347 (not res!212704)) b!376338))

(assert (= (and b!376340 condMapEmpty!15066) mapIsEmpty!15066))

(assert (= (and b!376340 (not condMapEmpty!15066)) mapNonEmpty!15066))

(get-info :version)

(assert (= (and mapNonEmpty!15066 ((_ is ValueCellFull!4157) mapValue!15066)) b!376351))

(assert (= (and b!376340 ((_ is ValueCellFull!4157) mapDefault!15066)) b!376337))

(assert (= start!37212 b!376340))

(declare-fun m!373313 () Bool)

(assert (=> b!376345 m!373313))

(declare-fun m!373315 () Bool)

(assert (=> mapNonEmpty!15066 m!373315))

(declare-fun m!373317 () Bool)

(assert (=> b!376344 m!373317))

(declare-fun m!373319 () Bool)

(assert (=> b!376344 m!373319))

(declare-fun m!373321 () Bool)

(assert (=> b!376339 m!373321))

(declare-fun m!373323 () Bool)

(assert (=> b!376348 m!373323))

(declare-fun m!373325 () Bool)

(assert (=> b!376348 m!373325))

(declare-fun m!373327 () Bool)

(assert (=> b!376348 m!373327))

(declare-fun m!373329 () Bool)

(assert (=> b!376348 m!373329))

(declare-fun m!373331 () Bool)

(assert (=> b!376348 m!373331))

(declare-fun m!373333 () Bool)

(assert (=> b!376348 m!373333))

(declare-fun m!373335 () Bool)

(assert (=> b!376348 m!373335))

(declare-fun m!373337 () Bool)

(assert (=> start!37212 m!373337))

(declare-fun m!373339 () Bool)

(assert (=> start!37212 m!373339))

(declare-fun m!373341 () Bool)

(assert (=> start!37212 m!373341))

(declare-fun m!373343 () Bool)

(assert (=> b!376349 m!373343))

(declare-fun m!373345 () Bool)

(assert (=> b!376347 m!373345))

(declare-fun m!373347 () Bool)

(assert (=> b!376347 m!373347))

(declare-fun m!373349 () Bool)

(assert (=> b!376347 m!373349))

(declare-fun m!373351 () Bool)

(assert (=> b!376338 m!373351))

(declare-fun m!373353 () Bool)

(assert (=> b!376338 m!373353))

(declare-fun m!373355 () Bool)

(assert (=> b!376341 m!373355))

(declare-fun m!373357 () Bool)

(assert (=> b!376343 m!373357))

(declare-fun m!373359 () Bool)

(assert (=> b!376342 m!373359))

(check-sat (not b!376348) (not b!376349) (not b!376339) (not b_next!8353) (not b!376345) tp_is_empty!9001 (not b!376338) (not start!37212) (not b!376344) (not mapNonEmpty!15066) b_and!15609 (not b!376342) (not b!376343) (not b!376347))
(check-sat b_and!15609 (not b_next!8353))
