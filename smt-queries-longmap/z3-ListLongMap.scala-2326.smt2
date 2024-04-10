; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37420 () Bool)

(assert start!37420)

(declare-fun b_free!8547 () Bool)

(declare-fun b_next!8547 () Bool)

(assert (=> start!37420 (= b_free!8547 (not b_next!8547))))

(declare-fun tp!30356 () Bool)

(declare-fun b_and!15789 () Bool)

(assert (=> start!37420 (= tp!30356 b_and!15789)))

(declare-fun b!380760 () Bool)

(declare-fun e!231559 () Bool)

(declare-fun tp_is_empty!9195 () Bool)

(assert (=> b!380760 (= e!231559 tp_is_empty!9195)))

(declare-fun b!380761 () Bool)

(declare-fun e!231564 () Bool)

(declare-fun e!231562 () Bool)

(assert (=> b!380761 (= e!231564 e!231562)))

(declare-fun res!216211 () Bool)

(assert (=> b!380761 (=> (not res!216211) (not e!231562))))

(declare-datatypes ((array!22309 0))(
  ( (array!22310 (arr!10623 (Array (_ BitVec 32) (_ BitVec 64))) (size!10975 (_ BitVec 32))) )
))
(declare-fun lt!178337 () array!22309)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22309 (_ BitVec 32)) Bool)

(assert (=> b!380761 (= res!216211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178337 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22309)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380761 (= lt!178337 (array!22310 (store (arr!10623 _keys!658) i!548 k0!778) (size!10975 _keys!658)))))

(declare-fun b!380762 () Bool)

(declare-fun res!216215 () Bool)

(assert (=> b!380762 (=> (not res!216215) (not e!231564))))

(declare-datatypes ((List!6060 0))(
  ( (Nil!6057) (Cons!6056 (h!6912 (_ BitVec 64)) (t!11210 List!6060)) )
))
(declare-fun arrayNoDuplicates!0 (array!22309 (_ BitVec 32) List!6060) Bool)

(assert (=> b!380762 (= res!216215 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6057))))

(declare-fun b!380763 () Bool)

(declare-fun res!216208 () Bool)

(assert (=> b!380763 (=> (not res!216208) (not e!231564))))

(assert (=> b!380763 (= res!216208 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10975 _keys!658))))))

(declare-fun b!380764 () Bool)

(declare-fun e!231563 () Bool)

(assert (=> b!380764 (= e!231563 tp_is_empty!9195)))

(declare-fun b!380765 () Bool)

(declare-fun res!216206 () Bool)

(assert (=> b!380765 (=> (not res!216206) (not e!231564))))

(assert (=> b!380765 (= res!216206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380766 () Bool)

(declare-fun res!216214 () Bool)

(assert (=> b!380766 (=> (not res!216214) (not e!231564))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13365 0))(
  ( (V!13366 (val!4642 Int)) )
))
(declare-datatypes ((ValueCell!4254 0))(
  ( (ValueCellFull!4254 (v!6839 V!13365)) (EmptyCell!4254) )
))
(declare-datatypes ((array!22311 0))(
  ( (array!22312 (arr!10624 (Array (_ BitVec 32) ValueCell!4254)) (size!10976 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22311)

(assert (=> b!380766 (= res!216214 (and (= (size!10976 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10975 _keys!658) (size!10976 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380767 () Bool)

(declare-fun e!231566 () Bool)

(assert (=> b!380767 (= e!231562 (not e!231566))))

(declare-fun res!216207 () Bool)

(assert (=> b!380767 (=> res!216207 e!231566)))

(assert (=> b!380767 (= res!216207 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13365)

(declare-datatypes ((tuple2!6226 0))(
  ( (tuple2!6227 (_1!3124 (_ BitVec 64)) (_2!3124 V!13365)) )
))
(declare-datatypes ((List!6061 0))(
  ( (Nil!6058) (Cons!6057 (h!6913 tuple2!6226) (t!11211 List!6061)) )
))
(declare-datatypes ((ListLongMap!5139 0))(
  ( (ListLongMap!5140 (toList!2585 List!6061)) )
))
(declare-fun lt!178330 () ListLongMap!5139)

(declare-fun minValue!472 () V!13365)

(declare-fun getCurrentListMap!2001 (array!22309 array!22311 (_ BitVec 32) (_ BitVec 32) V!13365 V!13365 (_ BitVec 32) Int) ListLongMap!5139)

(assert (=> b!380767 (= lt!178330 (getCurrentListMap!2001 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178338 () ListLongMap!5139)

(declare-fun lt!178331 () array!22311)

(assert (=> b!380767 (= lt!178338 (getCurrentListMap!2001 lt!178337 lt!178331 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178341 () ListLongMap!5139)

(declare-fun lt!178335 () ListLongMap!5139)

(assert (=> b!380767 (and (= lt!178341 lt!178335) (= lt!178335 lt!178341))))

(declare-fun lt!178333 () ListLongMap!5139)

(declare-fun lt!178336 () tuple2!6226)

(declare-fun +!931 (ListLongMap!5139 tuple2!6226) ListLongMap!5139)

(assert (=> b!380767 (= lt!178335 (+!931 lt!178333 lt!178336))))

(declare-fun v!373 () V!13365)

(assert (=> b!380767 (= lt!178336 (tuple2!6227 k0!778 v!373))))

(declare-datatypes ((Unit!11756 0))(
  ( (Unit!11757) )
))
(declare-fun lt!178334 () Unit!11756)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!159 (array!22309 array!22311 (_ BitVec 32) (_ BitVec 32) V!13365 V!13365 (_ BitVec 32) (_ BitVec 64) V!13365 (_ BitVec 32) Int) Unit!11756)

(assert (=> b!380767 (= lt!178334 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!159 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!835 (array!22309 array!22311 (_ BitVec 32) (_ BitVec 32) V!13365 V!13365 (_ BitVec 32) Int) ListLongMap!5139)

(assert (=> b!380767 (= lt!178341 (getCurrentListMapNoExtraKeys!835 lt!178337 lt!178331 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380767 (= lt!178331 (array!22312 (store (arr!10624 _values!506) i!548 (ValueCellFull!4254 v!373)) (size!10976 _values!506)))))

(assert (=> b!380767 (= lt!178333 (getCurrentListMapNoExtraKeys!835 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380768 () Bool)

(declare-fun e!231561 () Bool)

(declare-fun mapRes!15357 () Bool)

(assert (=> b!380768 (= e!231561 (and e!231559 mapRes!15357))))

(declare-fun condMapEmpty!15357 () Bool)

(declare-fun mapDefault!15357 () ValueCell!4254)

(assert (=> b!380768 (= condMapEmpty!15357 (= (arr!10624 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4254)) mapDefault!15357)))))

(declare-fun b!380770 () Bool)

(declare-fun e!231560 () Bool)

(assert (=> b!380770 (= e!231560 (bvsle #b00000000000000000000000000000000 (size!10975 _keys!658)))))

(declare-fun lt!178329 () ListLongMap!5139)

(declare-fun lt!178339 () ListLongMap!5139)

(assert (=> b!380770 (= lt!178329 (+!931 lt!178339 lt!178336))))

(declare-fun lt!178340 () Unit!11756)

(declare-fun addCommutativeForDiffKeys!327 (ListLongMap!5139 (_ BitVec 64) V!13365 (_ BitVec 64) V!13365) Unit!11756)

(assert (=> b!380770 (= lt!178340 (addCommutativeForDiffKeys!327 lt!178333 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380771 () Bool)

(assert (=> b!380771 (= e!231566 e!231560)))

(declare-fun res!216213 () Bool)

(assert (=> b!380771 (=> res!216213 e!231560)))

(assert (=> b!380771 (= res!216213 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!380771 (= lt!178330 lt!178339)))

(declare-fun lt!178332 () tuple2!6226)

(assert (=> b!380771 (= lt!178339 (+!931 lt!178333 lt!178332))))

(assert (=> b!380771 (= lt!178338 lt!178329)))

(assert (=> b!380771 (= lt!178329 (+!931 lt!178335 lt!178332))))

(assert (=> b!380771 (= lt!178338 (+!931 lt!178341 lt!178332))))

(assert (=> b!380771 (= lt!178332 (tuple2!6227 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!15357 () Bool)

(declare-fun tp!30357 () Bool)

(assert (=> mapNonEmpty!15357 (= mapRes!15357 (and tp!30357 e!231563))))

(declare-fun mapValue!15357 () ValueCell!4254)

(declare-fun mapKey!15357 () (_ BitVec 32))

(declare-fun mapRest!15357 () (Array (_ BitVec 32) ValueCell!4254))

(assert (=> mapNonEmpty!15357 (= (arr!10624 _values!506) (store mapRest!15357 mapKey!15357 mapValue!15357))))

(declare-fun b!380772 () Bool)

(declare-fun res!216209 () Bool)

(assert (=> b!380772 (=> (not res!216209) (not e!231564))))

(assert (=> b!380772 (= res!216209 (or (= (select (arr!10623 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10623 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380773 () Bool)

(declare-fun res!216210 () Bool)

(assert (=> b!380773 (=> (not res!216210) (not e!231564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380773 (= res!216210 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!15357 () Bool)

(assert (=> mapIsEmpty!15357 mapRes!15357))

(declare-fun b!380774 () Bool)

(declare-fun res!216205 () Bool)

(assert (=> b!380774 (=> (not res!216205) (not e!231562))))

(assert (=> b!380774 (= res!216205 (arrayNoDuplicates!0 lt!178337 #b00000000000000000000000000000000 Nil!6057))))

(declare-fun b!380769 () Bool)

(declare-fun res!216212 () Bool)

(assert (=> b!380769 (=> (not res!216212) (not e!231564))))

(declare-fun arrayContainsKey!0 (array!22309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380769 (= res!216212 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!216204 () Bool)

(assert (=> start!37420 (=> (not res!216204) (not e!231564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37420 (= res!216204 (validMask!0 mask!970))))

(assert (=> start!37420 e!231564))

(declare-fun array_inv!7820 (array!22311) Bool)

(assert (=> start!37420 (and (array_inv!7820 _values!506) e!231561)))

(assert (=> start!37420 tp!30356))

(assert (=> start!37420 true))

(assert (=> start!37420 tp_is_empty!9195))

(declare-fun array_inv!7821 (array!22309) Bool)

(assert (=> start!37420 (array_inv!7821 _keys!658)))

(assert (= (and start!37420 res!216204) b!380766))

(assert (= (and b!380766 res!216214) b!380765))

(assert (= (and b!380765 res!216206) b!380762))

(assert (= (and b!380762 res!216215) b!380763))

(assert (= (and b!380763 res!216208) b!380773))

(assert (= (and b!380773 res!216210) b!380772))

(assert (= (and b!380772 res!216209) b!380769))

(assert (= (and b!380769 res!216212) b!380761))

(assert (= (and b!380761 res!216211) b!380774))

(assert (= (and b!380774 res!216205) b!380767))

(assert (= (and b!380767 (not res!216207)) b!380771))

(assert (= (and b!380771 (not res!216213)) b!380770))

(assert (= (and b!380768 condMapEmpty!15357) mapIsEmpty!15357))

(assert (= (and b!380768 (not condMapEmpty!15357)) mapNonEmpty!15357))

(get-info :version)

(assert (= (and mapNonEmpty!15357 ((_ is ValueCellFull!4254) mapValue!15357)) b!380764))

(assert (= (and b!380768 ((_ is ValueCellFull!4254) mapDefault!15357)) b!380760))

(assert (= start!37420 b!380768))

(declare-fun m!377727 () Bool)

(assert (=> b!380761 m!377727))

(declare-fun m!377729 () Bool)

(assert (=> b!380761 m!377729))

(declare-fun m!377731 () Bool)

(assert (=> start!37420 m!377731))

(declare-fun m!377733 () Bool)

(assert (=> start!37420 m!377733))

(declare-fun m!377735 () Bool)

(assert (=> start!37420 m!377735))

(declare-fun m!377737 () Bool)

(assert (=> b!380767 m!377737))

(declare-fun m!377739 () Bool)

(assert (=> b!380767 m!377739))

(declare-fun m!377741 () Bool)

(assert (=> b!380767 m!377741))

(declare-fun m!377743 () Bool)

(assert (=> b!380767 m!377743))

(declare-fun m!377745 () Bool)

(assert (=> b!380767 m!377745))

(declare-fun m!377747 () Bool)

(assert (=> b!380767 m!377747))

(declare-fun m!377749 () Bool)

(assert (=> b!380767 m!377749))

(declare-fun m!377751 () Bool)

(assert (=> b!380762 m!377751))

(declare-fun m!377753 () Bool)

(assert (=> b!380772 m!377753))

(declare-fun m!377755 () Bool)

(assert (=> b!380771 m!377755))

(declare-fun m!377757 () Bool)

(assert (=> b!380771 m!377757))

(declare-fun m!377759 () Bool)

(assert (=> b!380771 m!377759))

(declare-fun m!377761 () Bool)

(assert (=> b!380765 m!377761))

(declare-fun m!377763 () Bool)

(assert (=> b!380773 m!377763))

(declare-fun m!377765 () Bool)

(assert (=> mapNonEmpty!15357 m!377765))

(declare-fun m!377767 () Bool)

(assert (=> b!380769 m!377767))

(declare-fun m!377769 () Bool)

(assert (=> b!380774 m!377769))

(declare-fun m!377771 () Bool)

(assert (=> b!380770 m!377771))

(declare-fun m!377773 () Bool)

(assert (=> b!380770 m!377773))

(check-sat (not b!380771) (not b!380773) (not b!380767) tp_is_empty!9195 (not start!37420) b_and!15789 (not b!380769) (not b!380762) (not b!380765) (not b_next!8547) (not mapNonEmpty!15357) (not b!380774) (not b!380770) (not b!380761))
(check-sat b_and!15789 (not b_next!8547))
