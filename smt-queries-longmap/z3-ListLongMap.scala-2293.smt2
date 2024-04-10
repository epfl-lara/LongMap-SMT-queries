; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37222 () Bool)

(assert start!37222)

(declare-fun b_free!8349 () Bool)

(declare-fun b_next!8349 () Bool)

(assert (=> start!37222 (= b_free!8349 (not b_next!8349))))

(declare-fun tp!29762 () Bool)

(declare-fun b_and!15591 () Bool)

(assert (=> start!37222 (= tp!29762 b_and!15591)))

(declare-fun b!376296 () Bool)

(declare-fun res!212640 () Bool)

(declare-fun e!229188 () Bool)

(assert (=> b!376296 (=> (not res!212640) (not e!229188))))

(declare-datatypes ((array!21923 0))(
  ( (array!21924 (arr!10430 (Array (_ BitVec 32) (_ BitVec 64))) (size!10782 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21923)

(declare-datatypes ((List!5888 0))(
  ( (Nil!5885) (Cons!5884 (h!6740 (_ BitVec 64)) (t!11038 List!5888)) )
))
(declare-fun arrayNoDuplicates!0 (array!21923 (_ BitVec 32) List!5888) Bool)

(assert (=> b!376296 (= res!212640 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5885))))

(declare-fun b!376297 () Bool)

(declare-fun e!229187 () Bool)

(declare-fun e!229186 () Bool)

(assert (=> b!376297 (= e!229187 (not e!229186))))

(declare-fun res!212635 () Bool)

(assert (=> b!376297 (=> res!212635 e!229186)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!376297 (= res!212635 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13101 0))(
  ( (V!13102 (val!4543 Int)) )
))
(declare-datatypes ((tuple2!6046 0))(
  ( (tuple2!6047 (_1!3034 (_ BitVec 64)) (_2!3034 V!13101)) )
))
(declare-datatypes ((List!5889 0))(
  ( (Nil!5886) (Cons!5885 (h!6741 tuple2!6046) (t!11039 List!5889)) )
))
(declare-datatypes ((ListLongMap!4959 0))(
  ( (ListLongMap!4960 (toList!2495 List!5889)) )
))
(declare-fun lt!174516 () ListLongMap!4959)

(declare-datatypes ((ValueCell!4155 0))(
  ( (ValueCellFull!4155 (v!6740 V!13101)) (EmptyCell!4155) )
))
(declare-datatypes ((array!21925 0))(
  ( (array!21926 (arr!10431 (Array (_ BitVec 32) ValueCell!4155)) (size!10783 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21925)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13101)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13101)

(declare-fun getCurrentListMap!1929 (array!21923 array!21925 (_ BitVec 32) (_ BitVec 32) V!13101 V!13101 (_ BitVec 32) Int) ListLongMap!4959)

(assert (=> b!376297 (= lt!174516 (getCurrentListMap!1929 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174511 () array!21925)

(declare-fun lt!174510 () array!21923)

(declare-fun lt!174512 () ListLongMap!4959)

(assert (=> b!376297 (= lt!174512 (getCurrentListMap!1929 lt!174510 lt!174511 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174505 () ListLongMap!4959)

(declare-fun lt!174508 () ListLongMap!4959)

(assert (=> b!376297 (and (= lt!174505 lt!174508) (= lt!174508 lt!174505))))

(declare-fun lt!174507 () ListLongMap!4959)

(declare-fun lt!174506 () tuple2!6046)

(declare-fun +!841 (ListLongMap!4959 tuple2!6046) ListLongMap!4959)

(assert (=> b!376297 (= lt!174508 (+!841 lt!174507 lt!174506))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13101)

(assert (=> b!376297 (= lt!174506 (tuple2!6047 k0!778 v!373))))

(declare-datatypes ((Unit!11588 0))(
  ( (Unit!11589) )
))
(declare-fun lt!174504 () Unit!11588)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!87 (array!21923 array!21925 (_ BitVec 32) (_ BitVec 32) V!13101 V!13101 (_ BitVec 32) (_ BitVec 64) V!13101 (_ BitVec 32) Int) Unit!11588)

(assert (=> b!376297 (= lt!174504 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!87 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!763 (array!21923 array!21925 (_ BitVec 32) (_ BitVec 32) V!13101 V!13101 (_ BitVec 32) Int) ListLongMap!4959)

(assert (=> b!376297 (= lt!174505 (getCurrentListMapNoExtraKeys!763 lt!174510 lt!174511 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376297 (= lt!174511 (array!21926 (store (arr!10431 _values!506) i!548 (ValueCellFull!4155 v!373)) (size!10783 _values!506)))))

(assert (=> b!376297 (= lt!174507 (getCurrentListMapNoExtraKeys!763 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376298 () Bool)

(declare-fun e!229183 () Bool)

(declare-fun tp_is_empty!8997 () Bool)

(assert (=> b!376298 (= e!229183 tp_is_empty!8997)))

(declare-fun b!376299 () Bool)

(declare-fun res!212641 () Bool)

(assert (=> b!376299 (=> (not res!212641) (not e!229188))))

(assert (=> b!376299 (= res!212641 (and (= (size!10783 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10782 _keys!658) (size!10783 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376300 () Bool)

(declare-fun res!212637 () Bool)

(assert (=> b!376300 (=> (not res!212637) (not e!229188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376300 (= res!212637 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!15060 () Bool)

(declare-fun mapRes!15060 () Bool)

(declare-fun tp!29763 () Bool)

(assert (=> mapNonEmpty!15060 (= mapRes!15060 (and tp!29763 e!229183))))

(declare-fun mapValue!15060 () ValueCell!4155)

(declare-fun mapKey!15060 () (_ BitVec 32))

(declare-fun mapRest!15060 () (Array (_ BitVec 32) ValueCell!4155))

(assert (=> mapNonEmpty!15060 (= (arr!10431 _values!506) (store mapRest!15060 mapKey!15060 mapValue!15060))))

(declare-fun b!376301 () Bool)

(declare-fun res!212636 () Bool)

(assert (=> b!376301 (=> (not res!212636) (not e!229188))))

(assert (=> b!376301 (= res!212636 (or (= (select (arr!10430 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10430 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376302 () Bool)

(declare-fun e!229189 () Bool)

(assert (=> b!376302 (= e!229186 e!229189)))

(declare-fun res!212634 () Bool)

(assert (=> b!376302 (=> res!212634 e!229189)))

(assert (=> b!376302 (= res!212634 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!174509 () ListLongMap!4959)

(assert (=> b!376302 (= lt!174512 lt!174509)))

(declare-fun lt!174514 () tuple2!6046)

(assert (=> b!376302 (= lt!174509 (+!841 lt!174508 lt!174514))))

(declare-fun lt!174513 () ListLongMap!4959)

(assert (=> b!376302 (= lt!174516 lt!174513)))

(assert (=> b!376302 (= lt!174513 (+!841 lt!174507 lt!174514))))

(assert (=> b!376302 (= lt!174512 (+!841 lt!174505 lt!174514))))

(assert (=> b!376302 (= lt!174514 (tuple2!6047 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376304 () Bool)

(declare-fun e!229185 () Bool)

(assert (=> b!376304 (= e!229185 tp_is_empty!8997)))

(declare-fun b!376305 () Bool)

(assert (=> b!376305 (= e!229189 true)))

(assert (=> b!376305 (= lt!174509 (+!841 lt!174513 lt!174506))))

(declare-fun lt!174515 () Unit!11588)

(declare-fun addCommutativeForDiffKeys!256 (ListLongMap!4959 (_ BitVec 64) V!13101 (_ BitVec 64) V!13101) Unit!11588)

(assert (=> b!376305 (= lt!174515 (addCommutativeForDiffKeys!256 lt!174507 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376306 () Bool)

(assert (=> b!376306 (= e!229188 e!229187)))

(declare-fun res!212642 () Bool)

(assert (=> b!376306 (=> (not res!212642) (not e!229187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21923 (_ BitVec 32)) Bool)

(assert (=> b!376306 (= res!212642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174510 mask!970))))

(assert (=> b!376306 (= lt!174510 (array!21924 (store (arr!10430 _keys!658) i!548 k0!778) (size!10782 _keys!658)))))

(declare-fun b!376307 () Bool)

(declare-fun e!229190 () Bool)

(assert (=> b!376307 (= e!229190 (and e!229185 mapRes!15060))))

(declare-fun condMapEmpty!15060 () Bool)

(declare-fun mapDefault!15060 () ValueCell!4155)

(assert (=> b!376307 (= condMapEmpty!15060 (= (arr!10431 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4155)) mapDefault!15060)))))

(declare-fun b!376308 () Bool)

(declare-fun res!212632 () Bool)

(assert (=> b!376308 (=> (not res!212632) (not e!229187))))

(assert (=> b!376308 (= res!212632 (arrayNoDuplicates!0 lt!174510 #b00000000000000000000000000000000 Nil!5885))))

(declare-fun b!376303 () Bool)

(declare-fun res!212638 () Bool)

(assert (=> b!376303 (=> (not res!212638) (not e!229188))))

(declare-fun arrayContainsKey!0 (array!21923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376303 (= res!212638 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!212639 () Bool)

(assert (=> start!37222 (=> (not res!212639) (not e!229188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37222 (= res!212639 (validMask!0 mask!970))))

(assert (=> start!37222 e!229188))

(declare-fun array_inv!7686 (array!21925) Bool)

(assert (=> start!37222 (and (array_inv!7686 _values!506) e!229190)))

(assert (=> start!37222 tp!29762))

(assert (=> start!37222 true))

(assert (=> start!37222 tp_is_empty!8997))

(declare-fun array_inv!7687 (array!21923) Bool)

(assert (=> start!37222 (array_inv!7687 _keys!658)))

(declare-fun b!376309 () Bool)

(declare-fun res!212631 () Bool)

(assert (=> b!376309 (=> (not res!212631) (not e!229188))))

(assert (=> b!376309 (= res!212631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15060 () Bool)

(assert (=> mapIsEmpty!15060 mapRes!15060))

(declare-fun b!376310 () Bool)

(declare-fun res!212633 () Bool)

(assert (=> b!376310 (=> (not res!212633) (not e!229188))))

(assert (=> b!376310 (= res!212633 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10782 _keys!658))))))

(assert (= (and start!37222 res!212639) b!376299))

(assert (= (and b!376299 res!212641) b!376309))

(assert (= (and b!376309 res!212631) b!376296))

(assert (= (and b!376296 res!212640) b!376310))

(assert (= (and b!376310 res!212633) b!376300))

(assert (= (and b!376300 res!212637) b!376301))

(assert (= (and b!376301 res!212636) b!376303))

(assert (= (and b!376303 res!212638) b!376306))

(assert (= (and b!376306 res!212642) b!376308))

(assert (= (and b!376308 res!212632) b!376297))

(assert (= (and b!376297 (not res!212635)) b!376302))

(assert (= (and b!376302 (not res!212634)) b!376305))

(assert (= (and b!376307 condMapEmpty!15060) mapIsEmpty!15060))

(assert (= (and b!376307 (not condMapEmpty!15060)) mapNonEmpty!15060))

(get-info :version)

(assert (= (and mapNonEmpty!15060 ((_ is ValueCellFull!4155) mapValue!15060)) b!376298))

(assert (= (and b!376307 ((_ is ValueCellFull!4155) mapDefault!15060)) b!376304))

(assert (= start!37222 b!376307))

(declare-fun m!372987 () Bool)

(assert (=> b!376302 m!372987))

(declare-fun m!372989 () Bool)

(assert (=> b!376302 m!372989))

(declare-fun m!372991 () Bool)

(assert (=> b!376302 m!372991))

(declare-fun m!372993 () Bool)

(assert (=> start!37222 m!372993))

(declare-fun m!372995 () Bool)

(assert (=> start!37222 m!372995))

(declare-fun m!372997 () Bool)

(assert (=> start!37222 m!372997))

(declare-fun m!372999 () Bool)

(assert (=> b!376301 m!372999))

(declare-fun m!373001 () Bool)

(assert (=> b!376297 m!373001))

(declare-fun m!373003 () Bool)

(assert (=> b!376297 m!373003))

(declare-fun m!373005 () Bool)

(assert (=> b!376297 m!373005))

(declare-fun m!373007 () Bool)

(assert (=> b!376297 m!373007))

(declare-fun m!373009 () Bool)

(assert (=> b!376297 m!373009))

(declare-fun m!373011 () Bool)

(assert (=> b!376297 m!373011))

(declare-fun m!373013 () Bool)

(assert (=> b!376297 m!373013))

(declare-fun m!373015 () Bool)

(assert (=> b!376308 m!373015))

(declare-fun m!373017 () Bool)

(assert (=> b!376296 m!373017))

(declare-fun m!373019 () Bool)

(assert (=> b!376300 m!373019))

(declare-fun m!373021 () Bool)

(assert (=> mapNonEmpty!15060 m!373021))

(declare-fun m!373023 () Bool)

(assert (=> b!376303 m!373023))

(declare-fun m!373025 () Bool)

(assert (=> b!376306 m!373025))

(declare-fun m!373027 () Bool)

(assert (=> b!376306 m!373027))

(declare-fun m!373029 () Bool)

(assert (=> b!376305 m!373029))

(declare-fun m!373031 () Bool)

(assert (=> b!376305 m!373031))

(declare-fun m!373033 () Bool)

(assert (=> b!376309 m!373033))

(check-sat (not b!376306) tp_is_empty!8997 (not b!376305) (not start!37222) (not b!376309) (not b!376297) (not mapNonEmpty!15060) (not b!376296) (not b!376308) (not b!376302) b_and!15591 (not b_next!8349) (not b!376300) (not b!376303))
(check-sat b_and!15591 (not b_next!8349))
