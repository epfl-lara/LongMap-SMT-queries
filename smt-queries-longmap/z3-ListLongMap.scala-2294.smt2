; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37212 () Bool)

(assert start!37212)

(declare-fun b_free!8353 () Bool)

(declare-fun b_next!8353 () Bool)

(assert (=> start!37212 (= b_free!8353 (not b_next!8353))))

(declare-fun tp!29775 () Bool)

(declare-fun b_and!15569 () Bool)

(assert (=> start!37212 (= tp!29775 b_and!15569)))

(declare-fun b!376115 () Bool)

(declare-fun e!229064 () Bool)

(declare-fun tp_is_empty!9001 () Bool)

(assert (=> b!376115 (= e!229064 tp_is_empty!9001)))

(declare-fun b!376116 () Bool)

(declare-fun res!212581 () Bool)

(declare-fun e!229062 () Bool)

(assert (=> b!376116 (=> (not res!212581) (not e!229062))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376116 (= res!212581 (validKeyInArray!0 k0!778))))

(declare-fun res!212584 () Bool)

(assert (=> start!37212 (=> (not res!212584) (not e!229062))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37212 (= res!212584 (validMask!0 mask!970))))

(assert (=> start!37212 e!229062))

(declare-datatypes ((V!13107 0))(
  ( (V!13108 (val!4545 Int)) )
))
(declare-datatypes ((ValueCell!4157 0))(
  ( (ValueCellFull!4157 (v!6736 V!13107)) (EmptyCell!4157) )
))
(declare-datatypes ((array!21915 0))(
  ( (array!21916 (arr!10426 (Array (_ BitVec 32) ValueCell!4157)) (size!10779 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21915)

(declare-fun e!229058 () Bool)

(declare-fun array_inv!7690 (array!21915) Bool)

(assert (=> start!37212 (and (array_inv!7690 _values!506) e!229058)))

(assert (=> start!37212 tp!29775))

(assert (=> start!37212 true))

(assert (=> start!37212 tp_is_empty!9001))

(declare-datatypes ((array!21917 0))(
  ( (array!21918 (arr!10427 (Array (_ BitVec 32) (_ BitVec 64))) (size!10780 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21917)

(declare-fun array_inv!7691 (array!21917) Bool)

(assert (=> start!37212 (array_inv!7691 _keys!658)))

(declare-fun b!376117 () Bool)

(declare-fun e!229057 () Bool)

(declare-fun e!229060 () Bool)

(assert (=> b!376117 (= e!229057 (not e!229060))))

(declare-fun res!212576 () Bool)

(assert (=> b!376117 (=> res!212576 e!229060)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376117 (= res!212576 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6034 0))(
  ( (tuple2!6035 (_1!3028 (_ BitVec 64)) (_2!3028 V!13107)) )
))
(declare-datatypes ((List!5863 0))(
  ( (Nil!5860) (Cons!5859 (h!6715 tuple2!6034) (t!11004 List!5863)) )
))
(declare-datatypes ((ListLongMap!4937 0))(
  ( (ListLongMap!4938 (toList!2484 List!5863)) )
))
(declare-fun lt!174350 () ListLongMap!4937)

(declare-fun zeroValue!472 () V!13107)

(declare-fun minValue!472 () V!13107)

(declare-fun getCurrentListMap!1896 (array!21917 array!21915 (_ BitVec 32) (_ BitVec 32) V!13107 V!13107 (_ BitVec 32) Int) ListLongMap!4937)

(assert (=> b!376117 (= lt!174350 (getCurrentListMap!1896 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174348 () ListLongMap!4937)

(declare-fun lt!174352 () array!21915)

(declare-fun lt!174358 () array!21917)

(assert (=> b!376117 (= lt!174348 (getCurrentListMap!1896 lt!174358 lt!174352 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174349 () ListLongMap!4937)

(declare-fun lt!174360 () ListLongMap!4937)

(assert (=> b!376117 (and (= lt!174349 lt!174360) (= lt!174360 lt!174349))))

(declare-fun lt!174351 () ListLongMap!4937)

(declare-fun lt!174355 () tuple2!6034)

(declare-fun +!852 (ListLongMap!4937 tuple2!6034) ListLongMap!4937)

(assert (=> b!376117 (= lt!174360 (+!852 lt!174351 lt!174355))))

(declare-fun v!373 () V!13107)

(assert (=> b!376117 (= lt!174355 (tuple2!6035 k0!778 v!373))))

(declare-datatypes ((Unit!11576 0))(
  ( (Unit!11577) )
))
(declare-fun lt!174359 () Unit!11576)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!89 (array!21917 array!21915 (_ BitVec 32) (_ BitVec 32) V!13107 V!13107 (_ BitVec 32) (_ BitVec 64) V!13107 (_ BitVec 32) Int) Unit!11576)

(assert (=> b!376117 (= lt!174359 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!89 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!761 (array!21917 array!21915 (_ BitVec 32) (_ BitVec 32) V!13107 V!13107 (_ BitVec 32) Int) ListLongMap!4937)

(assert (=> b!376117 (= lt!174349 (getCurrentListMapNoExtraKeys!761 lt!174358 lt!174352 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376117 (= lt!174352 (array!21916 (store (arr!10426 _values!506) i!548 (ValueCellFull!4157 v!373)) (size!10779 _values!506)))))

(assert (=> b!376117 (= lt!174351 (getCurrentListMapNoExtraKeys!761 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376118 () Bool)

(declare-fun res!212579 () Bool)

(assert (=> b!376118 (=> (not res!212579) (not e!229057))))

(declare-datatypes ((List!5864 0))(
  ( (Nil!5861) (Cons!5860 (h!6716 (_ BitVec 64)) (t!11005 List!5864)) )
))
(declare-fun arrayNoDuplicates!0 (array!21917 (_ BitVec 32) List!5864) Bool)

(assert (=> b!376118 (= res!212579 (arrayNoDuplicates!0 lt!174358 #b00000000000000000000000000000000 Nil!5861))))

(declare-fun b!376119 () Bool)

(declare-fun res!212585 () Bool)

(assert (=> b!376119 (=> (not res!212585) (not e!229062))))

(assert (=> b!376119 (= res!212585 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10780 _keys!658))))))

(declare-fun b!376120 () Bool)

(declare-fun res!212582 () Bool)

(assert (=> b!376120 (=> (not res!212582) (not e!229062))))

(assert (=> b!376120 (= res!212582 (or (= (select (arr!10427 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10427 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376121 () Bool)

(declare-fun res!212575 () Bool)

(assert (=> b!376121 (=> (not res!212575) (not e!229062))))

(assert (=> b!376121 (= res!212575 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5861))))

(declare-fun b!376122 () Bool)

(declare-fun e!229059 () Bool)

(assert (=> b!376122 (= e!229060 e!229059)))

(declare-fun res!212578 () Bool)

(assert (=> b!376122 (=> res!212578 e!229059)))

(assert (=> b!376122 (= res!212578 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!174356 () ListLongMap!4937)

(assert (=> b!376122 (= lt!174348 lt!174356)))

(declare-fun lt!174357 () tuple2!6034)

(assert (=> b!376122 (= lt!174356 (+!852 lt!174360 lt!174357))))

(declare-fun lt!174354 () ListLongMap!4937)

(assert (=> b!376122 (= lt!174350 lt!174354)))

(assert (=> b!376122 (= lt!174354 (+!852 lt!174351 lt!174357))))

(assert (=> b!376122 (= lt!174348 (+!852 lt!174349 lt!174357))))

(assert (=> b!376122 (= lt!174357 (tuple2!6035 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376123 () Bool)

(assert (=> b!376123 (= e!229059 true)))

(assert (=> b!376123 (= lt!174356 (+!852 lt!174354 lt!174355))))

(declare-fun lt!174353 () Unit!11576)

(declare-fun addCommutativeForDiffKeys!263 (ListLongMap!4937 (_ BitVec 64) V!13107 (_ BitVec 64) V!13107) Unit!11576)

(assert (=> b!376123 (= lt!174353 (addCommutativeForDiffKeys!263 lt!174351 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376124 () Bool)

(declare-fun res!212583 () Bool)

(assert (=> b!376124 (=> (not res!212583) (not e!229062))))

(declare-fun arrayContainsKey!0 (array!21917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376124 (= res!212583 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!376125 () Bool)

(declare-fun e!229063 () Bool)

(declare-fun mapRes!15066 () Bool)

(assert (=> b!376125 (= e!229058 (and e!229063 mapRes!15066))))

(declare-fun condMapEmpty!15066 () Bool)

(declare-fun mapDefault!15066 () ValueCell!4157)

(assert (=> b!376125 (= condMapEmpty!15066 (= (arr!10426 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4157)) mapDefault!15066)))))

(declare-fun b!376126 () Bool)

(declare-fun res!212574 () Bool)

(assert (=> b!376126 (=> (not res!212574) (not e!229062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21917 (_ BitVec 32)) Bool)

(assert (=> b!376126 (= res!212574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15066 () Bool)

(assert (=> mapIsEmpty!15066 mapRes!15066))

(declare-fun b!376127 () Bool)

(assert (=> b!376127 (= e!229062 e!229057)))

(declare-fun res!212577 () Bool)

(assert (=> b!376127 (=> (not res!212577) (not e!229057))))

(assert (=> b!376127 (= res!212577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174358 mask!970))))

(assert (=> b!376127 (= lt!174358 (array!21918 (store (arr!10427 _keys!658) i!548 k0!778) (size!10780 _keys!658)))))

(declare-fun b!376128 () Bool)

(assert (=> b!376128 (= e!229063 tp_is_empty!9001)))

(declare-fun mapNonEmpty!15066 () Bool)

(declare-fun tp!29774 () Bool)

(assert (=> mapNonEmpty!15066 (= mapRes!15066 (and tp!29774 e!229064))))

(declare-fun mapValue!15066 () ValueCell!4157)

(declare-fun mapKey!15066 () (_ BitVec 32))

(declare-fun mapRest!15066 () (Array (_ BitVec 32) ValueCell!4157))

(assert (=> mapNonEmpty!15066 (= (arr!10426 _values!506) (store mapRest!15066 mapKey!15066 mapValue!15066))))

(declare-fun b!376129 () Bool)

(declare-fun res!212580 () Bool)

(assert (=> b!376129 (=> (not res!212580) (not e!229062))))

(assert (=> b!376129 (= res!212580 (and (= (size!10779 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10780 _keys!658) (size!10779 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37212 res!212584) b!376129))

(assert (= (and b!376129 res!212580) b!376126))

(assert (= (and b!376126 res!212574) b!376121))

(assert (= (and b!376121 res!212575) b!376119))

(assert (= (and b!376119 res!212585) b!376116))

(assert (= (and b!376116 res!212581) b!376120))

(assert (= (and b!376120 res!212582) b!376124))

(assert (= (and b!376124 res!212583) b!376127))

(assert (= (and b!376127 res!212577) b!376118))

(assert (= (and b!376118 res!212579) b!376117))

(assert (= (and b!376117 (not res!212576)) b!376122))

(assert (= (and b!376122 (not res!212578)) b!376123))

(assert (= (and b!376125 condMapEmpty!15066) mapIsEmpty!15066))

(assert (= (and b!376125 (not condMapEmpty!15066)) mapNonEmpty!15066))

(get-info :version)

(assert (= (and mapNonEmpty!15066 ((_ is ValueCellFull!4157) mapValue!15066)) b!376115))

(assert (= (and b!376125 ((_ is ValueCellFull!4157) mapDefault!15066)) b!376128))

(assert (= start!37212 b!376125))

(declare-fun m!372359 () Bool)

(assert (=> b!376116 m!372359))

(declare-fun m!372361 () Bool)

(assert (=> b!376117 m!372361))

(declare-fun m!372363 () Bool)

(assert (=> b!376117 m!372363))

(declare-fun m!372365 () Bool)

(assert (=> b!376117 m!372365))

(declare-fun m!372367 () Bool)

(assert (=> b!376117 m!372367))

(declare-fun m!372369 () Bool)

(assert (=> b!376117 m!372369))

(declare-fun m!372371 () Bool)

(assert (=> b!376117 m!372371))

(declare-fun m!372373 () Bool)

(assert (=> b!376117 m!372373))

(declare-fun m!372375 () Bool)

(assert (=> b!376126 m!372375))

(declare-fun m!372377 () Bool)

(assert (=> b!376118 m!372377))

(declare-fun m!372379 () Bool)

(assert (=> b!376121 m!372379))

(declare-fun m!372381 () Bool)

(assert (=> b!376122 m!372381))

(declare-fun m!372383 () Bool)

(assert (=> b!376122 m!372383))

(declare-fun m!372385 () Bool)

(assert (=> b!376122 m!372385))

(declare-fun m!372387 () Bool)

(assert (=> b!376120 m!372387))

(declare-fun m!372389 () Bool)

(assert (=> b!376124 m!372389))

(declare-fun m!372391 () Bool)

(assert (=> mapNonEmpty!15066 m!372391))

(declare-fun m!372393 () Bool)

(assert (=> b!376127 m!372393))

(declare-fun m!372395 () Bool)

(assert (=> b!376127 m!372395))

(declare-fun m!372397 () Bool)

(assert (=> b!376123 m!372397))

(declare-fun m!372399 () Bool)

(assert (=> b!376123 m!372399))

(declare-fun m!372401 () Bool)

(assert (=> start!37212 m!372401))

(declare-fun m!372403 () Bool)

(assert (=> start!37212 m!372403))

(declare-fun m!372405 () Bool)

(assert (=> start!37212 m!372405))

(check-sat (not b!376127) (not b!376118) (not b!376124) (not b_next!8353) tp_is_empty!9001 (not start!37212) (not b!376122) (not b!376123) (not b!376126) (not b!376117) b_and!15569 (not b!376121) (not mapNonEmpty!15066) (not b!376116))
(check-sat b_and!15569 (not b_next!8353))
