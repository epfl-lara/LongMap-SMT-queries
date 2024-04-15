; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25240 () Bool)

(assert start!25240)

(declare-fun b!262722 () Bool)

(declare-fun b_free!6793 () Bool)

(declare-fun b_next!6793 () Bool)

(assert (=> b!262722 (= b_free!6793 (not b_next!6793))))

(declare-fun tp!23715 () Bool)

(declare-fun b_and!13909 () Bool)

(assert (=> b!262722 (= tp!23715 b_and!13909)))

(declare-fun b!262704 () Bool)

(declare-fun e!170238 () Bool)

(declare-datatypes ((SeekEntryResult!1193 0))(
  ( (MissingZero!1193 (index!6942 (_ BitVec 32))) (Found!1193 (index!6943 (_ BitVec 32))) (Intermediate!1193 (undefined!2005 Bool) (index!6944 (_ BitVec 32)) (x!25234 (_ BitVec 32))) (Undefined!1193) (MissingVacant!1193 (index!6945 (_ BitVec 32))) )
))
(declare-fun lt!132774 () SeekEntryResult!1193)

(get-info :version)

(assert (=> b!262704 (= e!170238 ((_ is Undefined!1193) lt!132774))))

(declare-fun b!262706 () Bool)

(declare-fun res!128293 () Bool)

(declare-fun e!170235 () Bool)

(assert (=> b!262706 (=> (not res!128293) (not e!170235))))

(declare-fun call!25117 () Bool)

(assert (=> b!262706 (= res!128293 call!25117)))

(declare-fun e!170247 () Bool)

(assert (=> b!262706 (= e!170247 e!170235)))

(declare-fun b!262707 () Bool)

(declare-fun e!170249 () Bool)

(declare-fun tp_is_empty!6655 () Bool)

(assert (=> b!262707 (= e!170249 tp_is_empty!6655)))

(declare-fun b!262708 () Bool)

(declare-datatypes ((Unit!8136 0))(
  ( (Unit!8137) )
))
(declare-fun e!170241 () Unit!8136)

(declare-fun Unit!8138 () Unit!8136)

(assert (=> b!262708 (= e!170241 Unit!8138)))

(declare-fun mapIsEmpty!11347 () Bool)

(declare-fun mapRes!11347 () Bool)

(assert (=> mapIsEmpty!11347 mapRes!11347))

(declare-fun b!262709 () Bool)

(declare-fun Unit!8139 () Unit!8136)

(assert (=> b!262709 (= e!170241 Unit!8139)))

(declare-fun lt!132769 () Unit!8136)

(declare-datatypes ((V!8521 0))(
  ( (V!8522 (val!3372 Int)) )
))
(declare-datatypes ((ValueCell!2984 0))(
  ( (ValueCellFull!2984 (v!5497 V!8521)) (EmptyCell!2984) )
))
(declare-datatypes ((array!12663 0))(
  ( (array!12664 (arr!5991 (Array (_ BitVec 32) ValueCell!2984)) (size!6343 (_ BitVec 32))) )
))
(declare-datatypes ((array!12665 0))(
  ( (array!12666 (arr!5992 (Array (_ BitVec 32) (_ BitVec 64))) (size!6344 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3868 0))(
  ( (LongMapFixedSize!3869 (defaultEntry!4842 Int) (mask!11207 (_ BitVec 32)) (extraKeys!4579 (_ BitVec 32)) (zeroValue!4683 V!8521) (minValue!4683 V!8521) (_size!1983 (_ BitVec 32)) (_keys!7033 array!12665) (_values!4825 array!12663) (_vacant!1983 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3868)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!262 (array!12665 array!12663 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 64) (_ BitVec 32) Int) Unit!8136)

(assert (=> b!262709 (= lt!132769 (lemmaArrayContainsKeyThenInListMap!262 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(assert (=> b!262709 false))

(declare-datatypes ((tuple2!4920 0))(
  ( (tuple2!4921 (_1!2471 (_ BitVec 64)) (_2!2471 V!8521)) )
))
(declare-fun lt!132765 () tuple2!4920)

(declare-datatypes ((List!3817 0))(
  ( (Nil!3814) (Cons!3813 (h!4479 tuple2!4920) (t!8885 List!3817)) )
))
(declare-datatypes ((ListLongMap!3823 0))(
  ( (ListLongMap!3824 (toList!1927 List!3817)) )
))
(declare-fun lt!132776 () ListLongMap!3823)

(declare-fun b!262710 () Bool)

(declare-fun e!170237 () Bool)

(declare-fun +!713 (ListLongMap!3823 tuple2!4920) ListLongMap!3823)

(declare-fun map!2737 (LongMapFixedSize!3868) ListLongMap!3823)

(assert (=> b!262710 (= e!170237 (= lt!132776 (+!713 (map!2737 thiss!1504) lt!132765)))))

(declare-fun b!262711 () Bool)

(declare-fun res!128289 () Bool)

(declare-fun e!170246 () Bool)

(assert (=> b!262711 (=> (not res!128289) (not e!170246))))

(assert (=> b!262711 (= res!128289 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!262712 () Bool)

(declare-fun e!170240 () Unit!8136)

(declare-fun lt!132762 () Unit!8136)

(assert (=> b!262712 (= e!170240 lt!132762)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!448 (array!12665 array!12663 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 64) Int) Unit!8136)

(assert (=> b!262712 (= lt!132762 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!448 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 (defaultEntry!4842 thiss!1504)))))

(declare-fun c!44785 () Bool)

(assert (=> b!262712 (= c!44785 ((_ is MissingZero!1193) lt!132774))))

(assert (=> b!262712 e!170247))

(declare-fun b!262713 () Bool)

(declare-fun Unit!8140 () Unit!8136)

(assert (=> b!262713 (= e!170240 Unit!8140)))

(declare-fun lt!132772 () Unit!8136)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!448 (array!12665 array!12663 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 64) Int) Unit!8136)

(assert (=> b!262713 (= lt!132772 (lemmaInListMapThenSeekEntryOrOpenFindsIt!448 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 (defaultEntry!4842 thiss!1504)))))

(assert (=> b!262713 false))

(declare-fun b!262714 () Bool)

(declare-fun e!170244 () Bool)

(assert (=> b!262714 (= e!170244 e!170237)))

(declare-fun res!128290 () Bool)

(assert (=> b!262714 (=> (not res!128290) (not e!170237))))

(declare-fun contains!1889 (ListLongMap!3823 (_ BitVec 64)) Bool)

(assert (=> b!262714 (= res!128290 (contains!1889 lt!132776 key!932))))

(declare-fun lt!132778 () LongMapFixedSize!3868)

(assert (=> b!262714 (= lt!132776 (map!2737 lt!132778))))

(declare-fun res!128287 () Bool)

(assert (=> start!25240 (=> (not res!128287) (not e!170246))))

(declare-fun valid!1513 (LongMapFixedSize!3868) Bool)

(assert (=> start!25240 (= res!128287 (valid!1513 thiss!1504))))

(assert (=> start!25240 e!170246))

(declare-fun e!170248 () Bool)

(assert (=> start!25240 e!170248))

(assert (=> start!25240 true))

(assert (=> start!25240 tp_is_empty!6655))

(declare-fun b!262705 () Bool)

(declare-fun e!170239 () Bool)

(assert (=> b!262705 (= e!170239 (and e!170249 mapRes!11347))))

(declare-fun condMapEmpty!11347 () Bool)

(declare-fun mapDefault!11347 () ValueCell!2984)

(assert (=> b!262705 (= condMapEmpty!11347 (= (arr!5991 (_values!4825 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2984)) mapDefault!11347)))))

(declare-fun b!262715 () Bool)

(declare-fun e!170243 () Bool)

(assert (=> b!262715 (= e!170243 tp_is_empty!6655)))

(declare-fun bm!25114 () Bool)

(declare-fun call!25118 () Bool)

(declare-fun arrayContainsKey!0 (array!12665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!25114 (= call!25118 (arrayContainsKey!0 (_keys!7033 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262716 () Bool)

(assert (=> b!262716 (= e!170235 (not call!25118))))

(declare-fun b!262717 () Bool)

(declare-fun res!128291 () Bool)

(assert (=> b!262717 (= res!128291 (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6945 lt!132774)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!170250 () Bool)

(assert (=> b!262717 (=> (not res!128291) (not e!170250))))

(declare-fun bm!25115 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!25115 (= call!25117 (inRange!0 (ite c!44785 (index!6942 lt!132774) (index!6945 lt!132774)) (mask!11207 thiss!1504)))))

(declare-fun b!262718 () Bool)

(declare-fun c!44784 () Bool)

(assert (=> b!262718 (= c!44784 ((_ is MissingVacant!1193) lt!132774))))

(assert (=> b!262718 (= e!170247 e!170238)))

(declare-fun b!262719 () Bool)

(declare-fun e!170242 () Bool)

(assert (=> b!262719 (= e!170242 (not e!170244))))

(declare-fun res!128286 () Bool)

(assert (=> b!262719 (=> (not res!128286) (not e!170244))))

(assert (=> b!262719 (= res!128286 (valid!1513 lt!132778))))

(declare-fun lt!132775 () ListLongMap!3823)

(assert (=> b!262719 (contains!1889 lt!132775 key!932)))

(declare-fun lt!132768 () array!12665)

(declare-fun lt!132779 () Unit!8136)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!132766 () array!12663)

(declare-fun lemmaValidKeyInArrayIsInListMap!151 (array!12665 array!12663 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 32) Int) Unit!8136)

(assert (=> b!262719 (= lt!132779 (lemmaValidKeyInArrayIsInListMap!151 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) index!297 (defaultEntry!4842 thiss!1504)))))

(assert (=> b!262719 (= lt!132778 (LongMapFixedSize!3869 (defaultEntry!4842 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000001 (_size!1983 thiss!1504)) lt!132768 lt!132766 (_vacant!1983 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12665 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!262719 (= (arrayCountValidKeys!0 lt!132768 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!132767 () Unit!8136)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12665 (_ BitVec 32)) Unit!8136)

(assert (=> b!262719 (= lt!132767 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132768 index!297))))

(assert (=> b!262719 (arrayContainsKey!0 lt!132768 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132777 () Unit!8136)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12665 (_ BitVec 64) (_ BitVec 32)) Unit!8136)

(assert (=> b!262719 (= lt!132777 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132768 key!932 index!297))))

(declare-fun lt!132764 () ListLongMap!3823)

(assert (=> b!262719 (= lt!132764 lt!132775)))

(declare-fun getCurrentListMap!1436 (array!12665 array!12663 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 32) Int) ListLongMap!3823)

(assert (=> b!262719 (= lt!132775 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!132763 () ListLongMap!3823)

(assert (=> b!262719 (= lt!132764 (+!713 lt!132763 lt!132765))))

(declare-fun v!346 () V!8521)

(assert (=> b!262719 (= lt!132766 (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504))))))

(assert (=> b!262719 (= lt!132765 (tuple2!4921 key!932 v!346))))

(declare-fun lt!132782 () Unit!8136)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!124 (array!12665 array!12663 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 32) (_ BitVec 64) V!8521 Int) Unit!8136)

(assert (=> b!262719 (= lt!132782 (lemmaAddValidKeyToArrayThenAddPairToListMap!124 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) index!297 key!932 v!346 (defaultEntry!4842 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12665 (_ BitVec 32)) Bool)

(assert (=> b!262719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132768 (mask!11207 thiss!1504))))

(declare-fun lt!132770 () Unit!8136)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12665 (_ BitVec 32) (_ BitVec 32)) Unit!8136)

(assert (=> b!262719 (= lt!132770 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7033 thiss!1504) index!297 (mask!11207 thiss!1504)))))

(assert (=> b!262719 (= (arrayCountValidKeys!0 lt!132768 #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!7033 thiss!1504) #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504)))))))

(declare-fun lt!132773 () Unit!8136)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12665 (_ BitVec 32) (_ BitVec 64)) Unit!8136)

(assert (=> b!262719 (= lt!132773 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7033 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3818 0))(
  ( (Nil!3815) (Cons!3814 (h!4480 (_ BitVec 64)) (t!8886 List!3818)) )
))
(declare-fun arrayNoDuplicates!0 (array!12665 (_ BitVec 32) List!3818) Bool)

(assert (=> b!262719 (arrayNoDuplicates!0 lt!132768 #b00000000000000000000000000000000 Nil!3815)))

(assert (=> b!262719 (= lt!132768 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun lt!132780 () Unit!8136)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12665 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3818) Unit!8136)

(assert (=> b!262719 (= lt!132780 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7033 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3815))))

(declare-fun lt!132781 () Unit!8136)

(assert (=> b!262719 (= lt!132781 e!170241)))

(declare-fun c!44786 () Bool)

(assert (=> b!262719 (= c!44786 (arrayContainsKey!0 (_keys!7033 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262720 () Bool)

(declare-fun e!170245 () Bool)

(assert (=> b!262720 (= e!170246 e!170245)))

(declare-fun res!128295 () Bool)

(assert (=> b!262720 (=> (not res!128295) (not e!170245))))

(assert (=> b!262720 (= res!128295 (or (= lt!132774 (MissingZero!1193 index!297)) (= lt!132774 (MissingVacant!1193 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12665 (_ BitVec 32)) SeekEntryResult!1193)

(assert (=> b!262720 (= lt!132774 (seekEntryOrOpen!0 key!932 (_keys!7033 thiss!1504) (mask!11207 thiss!1504)))))

(declare-fun mapNonEmpty!11347 () Bool)

(declare-fun tp!23716 () Bool)

(assert (=> mapNonEmpty!11347 (= mapRes!11347 (and tp!23716 e!170243))))

(declare-fun mapKey!11347 () (_ BitVec 32))

(declare-fun mapRest!11347 () (Array (_ BitVec 32) ValueCell!2984))

(declare-fun mapValue!11347 () ValueCell!2984)

(assert (=> mapNonEmpty!11347 (= (arr!5991 (_values!4825 thiss!1504)) (store mapRest!11347 mapKey!11347 mapValue!11347))))

(declare-fun b!262721 () Bool)

(assert (=> b!262721 (= e!170238 e!170250)))

(declare-fun res!128288 () Bool)

(assert (=> b!262721 (= res!128288 call!25117)))

(assert (=> b!262721 (=> (not res!128288) (not e!170250))))

(declare-fun array_inv!3963 (array!12665) Bool)

(declare-fun array_inv!3964 (array!12663) Bool)

(assert (=> b!262722 (= e!170248 (and tp!23715 tp_is_empty!6655 (array_inv!3963 (_keys!7033 thiss!1504)) (array_inv!3964 (_values!4825 thiss!1504)) e!170239))))

(declare-fun b!262723 () Bool)

(declare-fun res!128294 () Bool)

(assert (=> b!262723 (=> (not res!128294) (not e!170235))))

(assert (=> b!262723 (= res!128294 (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6942 lt!132774)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262724 () Bool)

(assert (=> b!262724 (= e!170245 e!170242)))

(declare-fun res!128292 () Bool)

(assert (=> b!262724 (=> (not res!128292) (not e!170242))))

(assert (=> b!262724 (= res!128292 (inRange!0 index!297 (mask!11207 thiss!1504)))))

(declare-fun lt!132771 () Unit!8136)

(assert (=> b!262724 (= lt!132771 e!170240)))

(declare-fun c!44783 () Bool)

(assert (=> b!262724 (= c!44783 (contains!1889 lt!132763 key!932))))

(assert (=> b!262724 (= lt!132763 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun b!262725 () Bool)

(assert (=> b!262725 (= e!170250 (not call!25118))))

(assert (= (and start!25240 res!128287) b!262711))

(assert (= (and b!262711 res!128289) b!262720))

(assert (= (and b!262720 res!128295) b!262724))

(assert (= (and b!262724 c!44783) b!262713))

(assert (= (and b!262724 (not c!44783)) b!262712))

(assert (= (and b!262712 c!44785) b!262706))

(assert (= (and b!262712 (not c!44785)) b!262718))

(assert (= (and b!262706 res!128293) b!262723))

(assert (= (and b!262723 res!128294) b!262716))

(assert (= (and b!262718 c!44784) b!262721))

(assert (= (and b!262718 (not c!44784)) b!262704))

(assert (= (and b!262721 res!128288) b!262717))

(assert (= (and b!262717 res!128291) b!262725))

(assert (= (or b!262706 b!262721) bm!25115))

(assert (= (or b!262716 b!262725) bm!25114))

(assert (= (and b!262724 res!128292) b!262719))

(assert (= (and b!262719 c!44786) b!262709))

(assert (= (and b!262719 (not c!44786)) b!262708))

(assert (= (and b!262719 res!128286) b!262714))

(assert (= (and b!262714 res!128290) b!262710))

(assert (= (and b!262705 condMapEmpty!11347) mapIsEmpty!11347))

(assert (= (and b!262705 (not condMapEmpty!11347)) mapNonEmpty!11347))

(assert (= (and mapNonEmpty!11347 ((_ is ValueCellFull!2984) mapValue!11347)) b!262715))

(assert (= (and b!262705 ((_ is ValueCellFull!2984) mapDefault!11347)) b!262707))

(assert (= b!262722 b!262705))

(assert (= start!25240 b!262722))

(declare-fun m!278289 () Bool)

(assert (=> b!262724 m!278289))

(declare-fun m!278291 () Bool)

(assert (=> b!262724 m!278291))

(declare-fun m!278293 () Bool)

(assert (=> b!262724 m!278293))

(declare-fun m!278295 () Bool)

(assert (=> b!262714 m!278295))

(declare-fun m!278297 () Bool)

(assert (=> b!262714 m!278297))

(declare-fun m!278299 () Bool)

(assert (=> b!262712 m!278299))

(declare-fun m!278301 () Bool)

(assert (=> b!262710 m!278301))

(assert (=> b!262710 m!278301))

(declare-fun m!278303 () Bool)

(assert (=> b!262710 m!278303))

(declare-fun m!278305 () Bool)

(assert (=> b!262709 m!278305))

(declare-fun m!278307 () Bool)

(assert (=> mapNonEmpty!11347 m!278307))

(declare-fun m!278309 () Bool)

(assert (=> start!25240 m!278309))

(declare-fun m!278311 () Bool)

(assert (=> b!262719 m!278311))

(declare-fun m!278313 () Bool)

(assert (=> b!262719 m!278313))

(declare-fun m!278315 () Bool)

(assert (=> b!262719 m!278315))

(declare-fun m!278317 () Bool)

(assert (=> b!262719 m!278317))

(declare-fun m!278319 () Bool)

(assert (=> b!262719 m!278319))

(declare-fun m!278321 () Bool)

(assert (=> b!262719 m!278321))

(declare-fun m!278323 () Bool)

(assert (=> b!262719 m!278323))

(declare-fun m!278325 () Bool)

(assert (=> b!262719 m!278325))

(declare-fun m!278327 () Bool)

(assert (=> b!262719 m!278327))

(declare-fun m!278329 () Bool)

(assert (=> b!262719 m!278329))

(declare-fun m!278331 () Bool)

(assert (=> b!262719 m!278331))

(declare-fun m!278333 () Bool)

(assert (=> b!262719 m!278333))

(declare-fun m!278335 () Bool)

(assert (=> b!262719 m!278335))

(declare-fun m!278337 () Bool)

(assert (=> b!262719 m!278337))

(declare-fun m!278339 () Bool)

(assert (=> b!262719 m!278339))

(declare-fun m!278341 () Bool)

(assert (=> b!262719 m!278341))

(declare-fun m!278343 () Bool)

(assert (=> b!262719 m!278343))

(declare-fun m!278345 () Bool)

(assert (=> b!262719 m!278345))

(declare-fun m!278347 () Bool)

(assert (=> b!262719 m!278347))

(declare-fun m!278349 () Bool)

(assert (=> b!262719 m!278349))

(declare-fun m!278351 () Bool)

(assert (=> b!262720 m!278351))

(declare-fun m!278353 () Bool)

(assert (=> b!262723 m!278353))

(declare-fun m!278355 () Bool)

(assert (=> bm!25115 m!278355))

(declare-fun m!278357 () Bool)

(assert (=> b!262722 m!278357))

(declare-fun m!278359 () Bool)

(assert (=> b!262722 m!278359))

(assert (=> bm!25114 m!278313))

(declare-fun m!278361 () Bool)

(assert (=> b!262713 m!278361))

(declare-fun m!278363 () Bool)

(assert (=> b!262717 m!278363))

(check-sat (not mapNonEmpty!11347) (not b!262720) (not start!25240) (not b!262709) (not b_next!6793) (not b!262719) (not b!262714) (not b!262713) (not b!262722) tp_is_empty!6655 (not bm!25114) (not bm!25115) (not b!262710) b_and!13909 (not b!262712) (not b!262724))
(check-sat b_and!13909 (not b_next!6793))
(get-model)

(declare-fun d!62929 () Bool)

(declare-fun res!128360 () Bool)

(declare-fun e!170351 () Bool)

(assert (=> d!62929 (=> res!128360 e!170351)))

(assert (=> d!62929 (= res!128360 (= (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62929 (= (arrayContainsKey!0 (_keys!7033 thiss!1504) key!932 #b00000000000000000000000000000000) e!170351)))

(declare-fun b!262862 () Bool)

(declare-fun e!170352 () Bool)

(assert (=> b!262862 (= e!170351 e!170352)))

(declare-fun res!128361 () Bool)

(assert (=> b!262862 (=> (not res!128361) (not e!170352))))

(assert (=> b!262862 (= res!128361 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun b!262863 () Bool)

(assert (=> b!262863 (= e!170352 (arrayContainsKey!0 (_keys!7033 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62929 (not res!128360)) b!262862))

(assert (= (and b!262862 res!128361) b!262863))

(declare-fun m!278517 () Bool)

(assert (=> d!62929 m!278517))

(declare-fun m!278519 () Bool)

(assert (=> b!262863 m!278519))

(assert (=> bm!25114 d!62929))

(declare-fun d!62931 () Bool)

(assert (=> d!62931 (= (inRange!0 index!297 (mask!11207 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11207 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!262724 d!62931))

(declare-fun d!62933 () Bool)

(declare-fun e!170357 () Bool)

(assert (=> d!62933 e!170357))

(declare-fun res!128364 () Bool)

(assert (=> d!62933 (=> res!128364 e!170357)))

(declare-fun lt!132920 () Bool)

(assert (=> d!62933 (= res!128364 (not lt!132920))))

(declare-fun lt!132918 () Bool)

(assert (=> d!62933 (= lt!132920 lt!132918)))

(declare-fun lt!132917 () Unit!8136)

(declare-fun e!170358 () Unit!8136)

(assert (=> d!62933 (= lt!132917 e!170358)))

(declare-fun c!44813 () Bool)

(assert (=> d!62933 (= c!44813 lt!132918)))

(declare-fun containsKey!310 (List!3817 (_ BitVec 64)) Bool)

(assert (=> d!62933 (= lt!132918 (containsKey!310 (toList!1927 lt!132763) key!932))))

(assert (=> d!62933 (= (contains!1889 lt!132763 key!932) lt!132920)))

(declare-fun b!262870 () Bool)

(declare-fun lt!132919 () Unit!8136)

(assert (=> b!262870 (= e!170358 lt!132919)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!259 (List!3817 (_ BitVec 64)) Unit!8136)

(assert (=> b!262870 (= lt!132919 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!132763) key!932))))

(declare-datatypes ((Option!324 0))(
  ( (Some!323 (v!5502 V!8521)) (None!322) )
))
(declare-fun isDefined!260 (Option!324) Bool)

(declare-fun getValueByKey!318 (List!3817 (_ BitVec 64)) Option!324)

(assert (=> b!262870 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132763) key!932))))

(declare-fun b!262871 () Bool)

(declare-fun Unit!8151 () Unit!8136)

(assert (=> b!262871 (= e!170358 Unit!8151)))

(declare-fun b!262872 () Bool)

(assert (=> b!262872 (= e!170357 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132763) key!932)))))

(assert (= (and d!62933 c!44813) b!262870))

(assert (= (and d!62933 (not c!44813)) b!262871))

(assert (= (and d!62933 (not res!128364)) b!262872))

(declare-fun m!278521 () Bool)

(assert (=> d!62933 m!278521))

(declare-fun m!278523 () Bool)

(assert (=> b!262870 m!278523))

(declare-fun m!278525 () Bool)

(assert (=> b!262870 m!278525))

(assert (=> b!262870 m!278525))

(declare-fun m!278527 () Bool)

(assert (=> b!262870 m!278527))

(assert (=> b!262872 m!278525))

(assert (=> b!262872 m!278525))

(assert (=> b!262872 m!278527))

(assert (=> b!262724 d!62933))

(declare-fun b!262915 () Bool)

(declare-fun e!170397 () Bool)

(declare-fun lt!132981 () ListLongMap!3823)

(declare-fun apply!262 (ListLongMap!3823 (_ BitVec 64)) V!8521)

(assert (=> b!262915 (= e!170397 (= (apply!262 lt!132981 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4683 thiss!1504)))))

(declare-fun b!262916 () Bool)

(declare-fun res!128385 () Bool)

(declare-fun e!170396 () Bool)

(assert (=> b!262916 (=> (not res!128385) (not e!170396))))

(declare-fun e!170387 () Bool)

(assert (=> b!262916 (= res!128385 e!170387)))

(declare-fun res!128390 () Bool)

(assert (=> b!262916 (=> res!128390 e!170387)))

(declare-fun e!170389 () Bool)

(assert (=> b!262916 (= res!128390 (not e!170389))))

(declare-fun res!128387 () Bool)

(assert (=> b!262916 (=> (not res!128387) (not e!170389))))

(assert (=> b!262916 (= res!128387 (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun b!262917 () Bool)

(declare-fun e!170390 () Bool)

(assert (=> b!262917 (= e!170387 e!170390)))

(declare-fun res!128383 () Bool)

(assert (=> b!262917 (=> (not res!128383) (not e!170390))))

(assert (=> b!262917 (= res!128383 (contains!1889 lt!132981 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!262917 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun d!62935 () Bool)

(assert (=> d!62935 e!170396))

(declare-fun res!128391 () Bool)

(assert (=> d!62935 (=> (not res!128391) (not e!170396))))

(assert (=> d!62935 (= res!128391 (or (bvsge #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))))))))

(declare-fun lt!132966 () ListLongMap!3823)

(assert (=> d!62935 (= lt!132981 lt!132966)))

(declare-fun lt!132986 () Unit!8136)

(declare-fun e!170393 () Unit!8136)

(assert (=> d!62935 (= lt!132986 e!170393)))

(declare-fun c!44826 () Bool)

(declare-fun e!170386 () Bool)

(assert (=> d!62935 (= c!44826 e!170386)))

(declare-fun res!128384 () Bool)

(assert (=> d!62935 (=> (not res!128384) (not e!170386))))

(assert (=> d!62935 (= res!128384 (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun e!170395 () ListLongMap!3823)

(assert (=> d!62935 (= lt!132966 e!170395)))

(declare-fun c!44831 () Bool)

(assert (=> d!62935 (= c!44831 (and (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!62935 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!62935 (= (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) lt!132981)))

(declare-fun b!262918 () Bool)

(declare-fun e!170394 () ListLongMap!3823)

(declare-fun call!25150 () ListLongMap!3823)

(assert (=> b!262918 (= e!170394 call!25150)))

(declare-fun b!262919 () Bool)

(declare-fun e!170392 () Bool)

(declare-fun call!25145 () Bool)

(assert (=> b!262919 (= e!170392 (not call!25145))))

(declare-fun b!262920 () Bool)

(declare-fun c!44829 () Bool)

(assert (=> b!262920 (= c!44829 (and (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!170388 () ListLongMap!3823)

(assert (=> b!262920 (= e!170394 e!170388)))

(declare-fun b!262921 () Bool)

(declare-fun e!170391 () Bool)

(assert (=> b!262921 (= e!170391 (= (apply!262 lt!132981 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4683 thiss!1504)))))

(declare-fun b!262922 () Bool)

(assert (=> b!262922 (= e!170396 e!170392)))

(declare-fun c!44827 () Bool)

(assert (=> b!262922 (= c!44827 (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!25142 () Bool)

(declare-fun call!25147 () Bool)

(assert (=> bm!25142 (= call!25147 (contains!1889 lt!132981 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262923 () Bool)

(assert (=> b!262923 (= e!170395 e!170394)))

(declare-fun c!44828 () Bool)

(assert (=> b!262923 (= c!44828 (and (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!262924 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!262924 (= e!170386 (validKeyInArray!0 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun call!25151 () ListLongMap!3823)

(declare-fun call!25149 () ListLongMap!3823)

(declare-fun bm!25143 () Bool)

(declare-fun call!25148 () ListLongMap!3823)

(declare-fun call!25146 () ListLongMap!3823)

(assert (=> bm!25143 (= call!25146 (+!713 (ite c!44831 call!25149 (ite c!44828 call!25151 call!25148)) (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!262925 () Bool)

(assert (=> b!262925 (= e!170395 (+!713 call!25146 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(declare-fun b!262926 () Bool)

(declare-fun e!170385 () Bool)

(assert (=> b!262926 (= e!170385 (not call!25147))))

(declare-fun bm!25144 () Bool)

(assert (=> bm!25144 (= call!25145 (contains!1889 lt!132981 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!25145 () Bool)

(assert (=> bm!25145 (= call!25151 call!25149)))

(declare-fun b!262927 () Bool)

(assert (=> b!262927 (= e!170392 e!170397)))

(declare-fun res!128386 () Bool)

(assert (=> b!262927 (= res!128386 call!25145)))

(assert (=> b!262927 (=> (not res!128386) (not e!170397))))

(declare-fun bm!25146 () Bool)

(assert (=> bm!25146 (= call!25148 call!25151)))

(declare-fun b!262928 () Bool)

(assert (=> b!262928 (= e!170388 call!25148)))

(declare-fun b!262929 () Bool)

(declare-fun lt!132983 () Unit!8136)

(assert (=> b!262929 (= e!170393 lt!132983)))

(declare-fun lt!132977 () ListLongMap!3823)

(declare-fun getCurrentListMapNoExtraKeys!578 (array!12665 array!12663 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 32) Int) ListLongMap!3823)

(assert (=> b!262929 (= lt!132977 (getCurrentListMapNoExtraKeys!578 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!132974 () (_ BitVec 64))

(assert (=> b!262929 (= lt!132974 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132970 () (_ BitVec 64))

(assert (=> b!262929 (= lt!132970 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132967 () Unit!8136)

(declare-fun addStillContains!238 (ListLongMap!3823 (_ BitVec 64) V!8521 (_ BitVec 64)) Unit!8136)

(assert (=> b!262929 (= lt!132967 (addStillContains!238 lt!132977 lt!132974 (zeroValue!4683 thiss!1504) lt!132970))))

(assert (=> b!262929 (contains!1889 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))) lt!132970)))

(declare-fun lt!132976 () Unit!8136)

(assert (=> b!262929 (= lt!132976 lt!132967)))

(declare-fun lt!132973 () ListLongMap!3823)

(assert (=> b!262929 (= lt!132973 (getCurrentListMapNoExtraKeys!578 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!132968 () (_ BitVec 64))

(assert (=> b!262929 (= lt!132968 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132975 () (_ BitVec 64))

(assert (=> b!262929 (= lt!132975 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132984 () Unit!8136)

(declare-fun addApplyDifferent!238 (ListLongMap!3823 (_ BitVec 64) V!8521 (_ BitVec 64)) Unit!8136)

(assert (=> b!262929 (= lt!132984 (addApplyDifferent!238 lt!132973 lt!132968 (minValue!4683 thiss!1504) lt!132975))))

(assert (=> b!262929 (= (apply!262 (+!713 lt!132973 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))) lt!132975) (apply!262 lt!132973 lt!132975))))

(declare-fun lt!132978 () Unit!8136)

(assert (=> b!262929 (= lt!132978 lt!132984)))

(declare-fun lt!132971 () ListLongMap!3823)

(assert (=> b!262929 (= lt!132971 (getCurrentListMapNoExtraKeys!578 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!132980 () (_ BitVec 64))

(assert (=> b!262929 (= lt!132980 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132972 () (_ BitVec 64))

(assert (=> b!262929 (= lt!132972 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132965 () Unit!8136)

(assert (=> b!262929 (= lt!132965 (addApplyDifferent!238 lt!132971 lt!132980 (zeroValue!4683 thiss!1504) lt!132972))))

(assert (=> b!262929 (= (apply!262 (+!713 lt!132971 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))) lt!132972) (apply!262 lt!132971 lt!132972))))

(declare-fun lt!132982 () Unit!8136)

(assert (=> b!262929 (= lt!132982 lt!132965)))

(declare-fun lt!132979 () ListLongMap!3823)

(assert (=> b!262929 (= lt!132979 (getCurrentListMapNoExtraKeys!578 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!132985 () (_ BitVec 64))

(assert (=> b!262929 (= lt!132985 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132969 () (_ BitVec 64))

(assert (=> b!262929 (= lt!132969 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262929 (= lt!132983 (addApplyDifferent!238 lt!132979 lt!132985 (minValue!4683 thiss!1504) lt!132969))))

(assert (=> b!262929 (= (apply!262 (+!713 lt!132979 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))) lt!132969) (apply!262 lt!132979 lt!132969))))

(declare-fun b!262930 () Bool)

(declare-fun get!3087 (ValueCell!2984 V!8521) V!8521)

(declare-fun dynLambda!596 (Int (_ BitVec 64)) V!8521)

(assert (=> b!262930 (= e!170390 (= (apply!262 lt!132981 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)) (get!3087 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262930 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6343 (_values!4825 thiss!1504))))))

(assert (=> b!262930 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun b!262931 () Bool)

(assert (=> b!262931 (= e!170388 call!25150)))

(declare-fun b!262932 () Bool)

(declare-fun Unit!8152 () Unit!8136)

(assert (=> b!262932 (= e!170393 Unit!8152)))

(declare-fun bm!25147 () Bool)

(assert (=> bm!25147 (= call!25150 call!25146)))

(declare-fun b!262933 () Bool)

(declare-fun res!128389 () Bool)

(assert (=> b!262933 (=> (not res!128389) (not e!170396))))

(assert (=> b!262933 (= res!128389 e!170385)))

(declare-fun c!44830 () Bool)

(assert (=> b!262933 (= c!44830 (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!262934 () Bool)

(assert (=> b!262934 (= e!170385 e!170391)))

(declare-fun res!128388 () Bool)

(assert (=> b!262934 (= res!128388 call!25147)))

(assert (=> b!262934 (=> (not res!128388) (not e!170391))))

(declare-fun bm!25148 () Bool)

(assert (=> bm!25148 (= call!25149 (getCurrentListMapNoExtraKeys!578 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun b!262935 () Bool)

(assert (=> b!262935 (= e!170389 (validKeyInArray!0 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!62935 c!44831) b!262925))

(assert (= (and d!62935 (not c!44831)) b!262923))

(assert (= (and b!262923 c!44828) b!262918))

(assert (= (and b!262923 (not c!44828)) b!262920))

(assert (= (and b!262920 c!44829) b!262931))

(assert (= (and b!262920 (not c!44829)) b!262928))

(assert (= (or b!262931 b!262928) bm!25146))

(assert (= (or b!262918 bm!25146) bm!25145))

(assert (= (or b!262918 b!262931) bm!25147))

(assert (= (or b!262925 bm!25145) bm!25148))

(assert (= (or b!262925 bm!25147) bm!25143))

(assert (= (and d!62935 res!128384) b!262924))

(assert (= (and d!62935 c!44826) b!262929))

(assert (= (and d!62935 (not c!44826)) b!262932))

(assert (= (and d!62935 res!128391) b!262916))

(assert (= (and b!262916 res!128387) b!262935))

(assert (= (and b!262916 (not res!128390)) b!262917))

(assert (= (and b!262917 res!128383) b!262930))

(assert (= (and b!262916 res!128385) b!262933))

(assert (= (and b!262933 c!44830) b!262934))

(assert (= (and b!262933 (not c!44830)) b!262926))

(assert (= (and b!262934 res!128388) b!262921))

(assert (= (or b!262934 b!262926) bm!25142))

(assert (= (and b!262933 res!128389) b!262922))

(assert (= (and b!262922 c!44827) b!262927))

(assert (= (and b!262922 (not c!44827)) b!262919))

(assert (= (and b!262927 res!128386) b!262915))

(assert (= (or b!262927 b!262919) bm!25144))

(declare-fun b_lambda!8313 () Bool)

(assert (=> (not b_lambda!8313) (not b!262930)))

(declare-fun t!8892 () Bool)

(declare-fun tb!3029 () Bool)

(assert (=> (and b!262722 (= (defaultEntry!4842 thiss!1504) (defaultEntry!4842 thiss!1504)) t!8892) tb!3029))

(declare-fun result!5425 () Bool)

(assert (=> tb!3029 (= result!5425 tp_is_empty!6655)))

(assert (=> b!262930 t!8892))

(declare-fun b_and!13915 () Bool)

(assert (= b_and!13909 (and (=> t!8892 result!5425) b_and!13915)))

(declare-fun m!278529 () Bool)

(assert (=> bm!25148 m!278529))

(declare-fun m!278531 () Bool)

(assert (=> b!262921 m!278531))

(declare-fun m!278533 () Bool)

(assert (=> b!262929 m!278533))

(declare-fun m!278535 () Bool)

(assert (=> b!262929 m!278535))

(declare-fun m!278537 () Bool)

(assert (=> b!262929 m!278537))

(declare-fun m!278539 () Bool)

(assert (=> b!262929 m!278539))

(assert (=> b!262929 m!278517))

(declare-fun m!278541 () Bool)

(assert (=> b!262929 m!278541))

(declare-fun m!278543 () Bool)

(assert (=> b!262929 m!278543))

(declare-fun m!278545 () Bool)

(assert (=> b!262929 m!278545))

(assert (=> b!262929 m!278537))

(declare-fun m!278547 () Bool)

(assert (=> b!262929 m!278547))

(declare-fun m!278549 () Bool)

(assert (=> b!262929 m!278549))

(declare-fun m!278551 () Bool)

(assert (=> b!262929 m!278551))

(assert (=> b!262929 m!278529))

(assert (=> b!262929 m!278543))

(assert (=> b!262929 m!278549))

(declare-fun m!278553 () Bool)

(assert (=> b!262929 m!278553))

(assert (=> b!262929 m!278535))

(declare-fun m!278555 () Bool)

(assert (=> b!262929 m!278555))

(declare-fun m!278557 () Bool)

(assert (=> b!262929 m!278557))

(declare-fun m!278559 () Bool)

(assert (=> b!262929 m!278559))

(declare-fun m!278561 () Bool)

(assert (=> b!262929 m!278561))

(declare-fun m!278563 () Bool)

(assert (=> bm!25143 m!278563))

(assert (=> b!262930 m!278517))

(declare-fun m!278565 () Bool)

(assert (=> b!262930 m!278565))

(declare-fun m!278567 () Bool)

(assert (=> b!262930 m!278567))

(declare-fun m!278569 () Bool)

(assert (=> b!262930 m!278569))

(declare-fun m!278571 () Bool)

(assert (=> b!262930 m!278571))

(assert (=> b!262930 m!278567))

(assert (=> b!262930 m!278569))

(assert (=> b!262930 m!278517))

(declare-fun m!278573 () Bool)

(assert (=> bm!25142 m!278573))

(declare-fun m!278575 () Bool)

(assert (=> b!262915 m!278575))

(declare-fun m!278577 () Bool)

(assert (=> b!262925 m!278577))

(declare-fun m!278579 () Bool)

(assert (=> d!62935 m!278579))

(assert (=> b!262935 m!278517))

(assert (=> b!262935 m!278517))

(declare-fun m!278581 () Bool)

(assert (=> b!262935 m!278581))

(assert (=> b!262924 m!278517))

(assert (=> b!262924 m!278517))

(assert (=> b!262924 m!278581))

(assert (=> b!262917 m!278517))

(assert (=> b!262917 m!278517))

(declare-fun m!278583 () Bool)

(assert (=> b!262917 m!278583))

(declare-fun m!278585 () Bool)

(assert (=> bm!25144 m!278585))

(assert (=> b!262724 d!62935))

(declare-fun d!62937 () Bool)

(assert (=> d!62937 (= (array_inv!3963 (_keys!7033 thiss!1504)) (bvsge (size!6344 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262722 d!62937))

(declare-fun d!62939 () Bool)

(assert (=> d!62939 (= (array_inv!3964 (_values!4825 thiss!1504)) (bvsge (size!6343 (_values!4825 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262722 d!62939))

(declare-fun d!62941 () Bool)

(assert (=> d!62941 (= (inRange!0 (ite c!44785 (index!6942 lt!132774) (index!6945 lt!132774)) (mask!11207 thiss!1504)) (and (bvsge (ite c!44785 (index!6942 lt!132774) (index!6945 lt!132774)) #b00000000000000000000000000000000) (bvslt (ite c!44785 (index!6942 lt!132774) (index!6945 lt!132774)) (bvadd (mask!11207 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!25115 d!62941))

(declare-fun b!262949 () Bool)

(declare-fun e!170409 () Bool)

(declare-fun call!25154 () Bool)

(assert (=> b!262949 (= e!170409 call!25154)))

(declare-fun b!262950 () Bool)

(declare-fun e!170408 () Bool)

(declare-fun e!170406 () Bool)

(assert (=> b!262950 (= e!170408 e!170406)))

(declare-fun res!128400 () Bool)

(assert (=> b!262950 (=> (not res!128400) (not e!170406))))

(declare-fun e!170407 () Bool)

(assert (=> b!262950 (= res!128400 (not e!170407))))

(declare-fun res!128399 () Bool)

(assert (=> b!262950 (=> (not res!128399) (not e!170407))))

(assert (=> b!262950 (= res!128399 (validKeyInArray!0 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(declare-fun bm!25151 () Bool)

(declare-fun c!44834 () Bool)

(assert (=> bm!25151 (= call!25154 (arrayNoDuplicates!0 lt!132768 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44834 (Cons!3814 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) Nil!3815) Nil!3815)))))

(declare-fun b!262951 () Bool)

(assert (=> b!262951 (= e!170409 call!25154)))

(declare-fun b!262952 () Bool)

(assert (=> b!262952 (= e!170406 e!170409)))

(assert (=> b!262952 (= c!44834 (validKeyInArray!0 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(declare-fun b!262948 () Bool)

(declare-fun contains!1892 (List!3818 (_ BitVec 64)) Bool)

(assert (=> b!262948 (= e!170407 (contains!1892 Nil!3815 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(declare-fun d!62943 () Bool)

(declare-fun res!128398 () Bool)

(assert (=> d!62943 (=> res!128398 e!170408)))

(assert (=> d!62943 (= res!128398 (bvsge #b00000000000000000000000000000000 (size!6344 lt!132768)))))

(assert (=> d!62943 (= (arrayNoDuplicates!0 lt!132768 #b00000000000000000000000000000000 Nil!3815) e!170408)))

(assert (= (and d!62943 (not res!128398)) b!262950))

(assert (= (and b!262950 res!128399) b!262948))

(assert (= (and b!262950 res!128400) b!262952))

(assert (= (and b!262952 c!44834) b!262951))

(assert (= (and b!262952 (not c!44834)) b!262949))

(assert (= (or b!262951 b!262949) bm!25151))

(declare-fun m!278587 () Bool)

(assert (=> b!262950 m!278587))

(assert (=> b!262950 m!278587))

(declare-fun m!278589 () Bool)

(assert (=> b!262950 m!278589))

(assert (=> bm!25151 m!278587))

(declare-fun m!278591 () Bool)

(assert (=> bm!25151 m!278591))

(assert (=> b!262952 m!278587))

(assert (=> b!262952 m!278587))

(assert (=> b!262952 m!278589))

(assert (=> b!262948 m!278587))

(assert (=> b!262948 m!278587))

(declare-fun m!278593 () Bool)

(assert (=> b!262948 m!278593))

(assert (=> b!262719 d!62943))

(declare-fun b!262953 () Bool)

(declare-fun e!170422 () Bool)

(declare-fun lt!133003 () ListLongMap!3823)

(assert (=> b!262953 (= e!170422 (= (apply!262 lt!133003 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4683 thiss!1504)))))

(declare-fun b!262954 () Bool)

(declare-fun res!128403 () Bool)

(declare-fun e!170421 () Bool)

(assert (=> b!262954 (=> (not res!128403) (not e!170421))))

(declare-fun e!170412 () Bool)

(assert (=> b!262954 (= res!128403 e!170412)))

(declare-fun res!128408 () Bool)

(assert (=> b!262954 (=> res!128408 e!170412)))

(declare-fun e!170414 () Bool)

(assert (=> b!262954 (= res!128408 (not e!170414))))

(declare-fun res!128405 () Bool)

(assert (=> b!262954 (=> (not res!128405) (not e!170414))))

(assert (=> b!262954 (= res!128405 (bvslt #b00000000000000000000000000000000 (size!6344 lt!132768)))))

(declare-fun b!262955 () Bool)

(declare-fun e!170415 () Bool)

(assert (=> b!262955 (= e!170412 e!170415)))

(declare-fun res!128401 () Bool)

(assert (=> b!262955 (=> (not res!128401) (not e!170415))))

(assert (=> b!262955 (= res!128401 (contains!1889 lt!133003 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(assert (=> b!262955 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 lt!132768)))))

(declare-fun d!62945 () Bool)

(assert (=> d!62945 e!170421))

(declare-fun res!128409 () Bool)

(assert (=> d!62945 (=> (not res!128409) (not e!170421))))

(assert (=> d!62945 (= res!128409 (or (bvsge #b00000000000000000000000000000000 (size!6344 lt!132768)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 lt!132768)))))))

(declare-fun lt!132988 () ListLongMap!3823)

(assert (=> d!62945 (= lt!133003 lt!132988)))

(declare-fun lt!133008 () Unit!8136)

(declare-fun e!170418 () Unit!8136)

(assert (=> d!62945 (= lt!133008 e!170418)))

(declare-fun c!44835 () Bool)

(declare-fun e!170411 () Bool)

(assert (=> d!62945 (= c!44835 e!170411)))

(declare-fun res!128402 () Bool)

(assert (=> d!62945 (=> (not res!128402) (not e!170411))))

(assert (=> d!62945 (= res!128402 (bvslt #b00000000000000000000000000000000 (size!6344 lt!132768)))))

(declare-fun e!170420 () ListLongMap!3823)

(assert (=> d!62945 (= lt!132988 e!170420)))

(declare-fun c!44840 () Bool)

(assert (=> d!62945 (= c!44840 (and (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62945 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!62945 (= (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) lt!133003)))

(declare-fun b!262956 () Bool)

(declare-fun e!170419 () ListLongMap!3823)

(declare-fun call!25160 () ListLongMap!3823)

(assert (=> b!262956 (= e!170419 call!25160)))

(declare-fun b!262957 () Bool)

(declare-fun e!170417 () Bool)

(declare-fun call!25155 () Bool)

(assert (=> b!262957 (= e!170417 (not call!25155))))

(declare-fun b!262958 () Bool)

(declare-fun c!44838 () Bool)

(assert (=> b!262958 (= c!44838 (and (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!170413 () ListLongMap!3823)

(assert (=> b!262958 (= e!170419 e!170413)))

(declare-fun b!262959 () Bool)

(declare-fun e!170416 () Bool)

(assert (=> b!262959 (= e!170416 (= (apply!262 lt!133003 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4683 thiss!1504)))))

(declare-fun b!262960 () Bool)

(assert (=> b!262960 (= e!170421 e!170417)))

(declare-fun c!44836 () Bool)

(assert (=> b!262960 (= c!44836 (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!25152 () Bool)

(declare-fun call!25157 () Bool)

(assert (=> bm!25152 (= call!25157 (contains!1889 lt!133003 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262961 () Bool)

(assert (=> b!262961 (= e!170420 e!170419)))

(declare-fun c!44837 () Bool)

(assert (=> b!262961 (= c!44837 (and (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!262962 () Bool)

(assert (=> b!262962 (= e!170411 (validKeyInArray!0 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(declare-fun call!25161 () ListLongMap!3823)

(declare-fun call!25158 () ListLongMap!3823)

(declare-fun call!25159 () ListLongMap!3823)

(declare-fun call!25156 () ListLongMap!3823)

(declare-fun bm!25153 () Bool)

(assert (=> bm!25153 (= call!25156 (+!713 (ite c!44840 call!25159 (ite c!44837 call!25161 call!25158)) (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!262963 () Bool)

(assert (=> b!262963 (= e!170420 (+!713 call!25156 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(declare-fun b!262964 () Bool)

(declare-fun e!170410 () Bool)

(assert (=> b!262964 (= e!170410 (not call!25157))))

(declare-fun bm!25154 () Bool)

(assert (=> bm!25154 (= call!25155 (contains!1889 lt!133003 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!25155 () Bool)

(assert (=> bm!25155 (= call!25161 call!25159)))

(declare-fun b!262965 () Bool)

(assert (=> b!262965 (= e!170417 e!170422)))

(declare-fun res!128404 () Bool)

(assert (=> b!262965 (= res!128404 call!25155)))

(assert (=> b!262965 (=> (not res!128404) (not e!170422))))

(declare-fun bm!25156 () Bool)

(assert (=> bm!25156 (= call!25158 call!25161)))

(declare-fun b!262966 () Bool)

(assert (=> b!262966 (= e!170413 call!25158)))

(declare-fun b!262967 () Bool)

(declare-fun lt!133005 () Unit!8136)

(assert (=> b!262967 (= e!170418 lt!133005)))

(declare-fun lt!132999 () ListLongMap!3823)

(assert (=> b!262967 (= lt!132999 (getCurrentListMapNoExtraKeys!578 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!132996 () (_ BitVec 64))

(assert (=> b!262967 (= lt!132996 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132992 () (_ BitVec 64))

(assert (=> b!262967 (= lt!132992 (select (arr!5992 lt!132768) #b00000000000000000000000000000000))))

(declare-fun lt!132989 () Unit!8136)

(assert (=> b!262967 (= lt!132989 (addStillContains!238 lt!132999 lt!132996 (zeroValue!4683 thiss!1504) lt!132992))))

(assert (=> b!262967 (contains!1889 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))) lt!132992)))

(declare-fun lt!132998 () Unit!8136)

(assert (=> b!262967 (= lt!132998 lt!132989)))

(declare-fun lt!132995 () ListLongMap!3823)

(assert (=> b!262967 (= lt!132995 (getCurrentListMapNoExtraKeys!578 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!132990 () (_ BitVec 64))

(assert (=> b!262967 (= lt!132990 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132997 () (_ BitVec 64))

(assert (=> b!262967 (= lt!132997 (select (arr!5992 lt!132768) #b00000000000000000000000000000000))))

(declare-fun lt!133006 () Unit!8136)

(assert (=> b!262967 (= lt!133006 (addApplyDifferent!238 lt!132995 lt!132990 (minValue!4683 thiss!1504) lt!132997))))

(assert (=> b!262967 (= (apply!262 (+!713 lt!132995 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))) lt!132997) (apply!262 lt!132995 lt!132997))))

(declare-fun lt!133000 () Unit!8136)

(assert (=> b!262967 (= lt!133000 lt!133006)))

(declare-fun lt!132993 () ListLongMap!3823)

(assert (=> b!262967 (= lt!132993 (getCurrentListMapNoExtraKeys!578 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!133002 () (_ BitVec 64))

(assert (=> b!262967 (= lt!133002 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132994 () (_ BitVec 64))

(assert (=> b!262967 (= lt!132994 (select (arr!5992 lt!132768) #b00000000000000000000000000000000))))

(declare-fun lt!132987 () Unit!8136)

(assert (=> b!262967 (= lt!132987 (addApplyDifferent!238 lt!132993 lt!133002 (zeroValue!4683 thiss!1504) lt!132994))))

(assert (=> b!262967 (= (apply!262 (+!713 lt!132993 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))) lt!132994) (apply!262 lt!132993 lt!132994))))

(declare-fun lt!133004 () Unit!8136)

(assert (=> b!262967 (= lt!133004 lt!132987)))

(declare-fun lt!133001 () ListLongMap!3823)

(assert (=> b!262967 (= lt!133001 (getCurrentListMapNoExtraKeys!578 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!133007 () (_ BitVec 64))

(assert (=> b!262967 (= lt!133007 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132991 () (_ BitVec 64))

(assert (=> b!262967 (= lt!132991 (select (arr!5992 lt!132768) #b00000000000000000000000000000000))))

(assert (=> b!262967 (= lt!133005 (addApplyDifferent!238 lt!133001 lt!133007 (minValue!4683 thiss!1504) lt!132991))))

(assert (=> b!262967 (= (apply!262 (+!713 lt!133001 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))) lt!132991) (apply!262 lt!133001 lt!132991))))

(declare-fun b!262968 () Bool)

(assert (=> b!262968 (= e!170415 (= (apply!262 lt!133003 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)) (get!3087 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262968 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6343 lt!132766)))))

(assert (=> b!262968 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 lt!132768)))))

(declare-fun b!262969 () Bool)

(assert (=> b!262969 (= e!170413 call!25160)))

(declare-fun b!262970 () Bool)

(declare-fun Unit!8153 () Unit!8136)

(assert (=> b!262970 (= e!170418 Unit!8153)))

(declare-fun bm!25157 () Bool)

(assert (=> bm!25157 (= call!25160 call!25156)))

(declare-fun b!262971 () Bool)

(declare-fun res!128407 () Bool)

(assert (=> b!262971 (=> (not res!128407) (not e!170421))))

(assert (=> b!262971 (= res!128407 e!170410)))

(declare-fun c!44839 () Bool)

(assert (=> b!262971 (= c!44839 (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!262972 () Bool)

(assert (=> b!262972 (= e!170410 e!170416)))

(declare-fun res!128406 () Bool)

(assert (=> b!262972 (= res!128406 call!25157)))

(assert (=> b!262972 (=> (not res!128406) (not e!170416))))

(declare-fun bm!25158 () Bool)

(assert (=> bm!25158 (= call!25159 (getCurrentListMapNoExtraKeys!578 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun b!262973 () Bool)

(assert (=> b!262973 (= e!170414 (validKeyInArray!0 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(assert (= (and d!62945 c!44840) b!262963))

(assert (= (and d!62945 (not c!44840)) b!262961))

(assert (= (and b!262961 c!44837) b!262956))

(assert (= (and b!262961 (not c!44837)) b!262958))

(assert (= (and b!262958 c!44838) b!262969))

(assert (= (and b!262958 (not c!44838)) b!262966))

(assert (= (or b!262969 b!262966) bm!25156))

(assert (= (or b!262956 bm!25156) bm!25155))

(assert (= (or b!262956 b!262969) bm!25157))

(assert (= (or b!262963 bm!25155) bm!25158))

(assert (= (or b!262963 bm!25157) bm!25153))

(assert (= (and d!62945 res!128402) b!262962))

(assert (= (and d!62945 c!44835) b!262967))

(assert (= (and d!62945 (not c!44835)) b!262970))

(assert (= (and d!62945 res!128409) b!262954))

(assert (= (and b!262954 res!128405) b!262973))

(assert (= (and b!262954 (not res!128408)) b!262955))

(assert (= (and b!262955 res!128401) b!262968))

(assert (= (and b!262954 res!128403) b!262971))

(assert (= (and b!262971 c!44839) b!262972))

(assert (= (and b!262971 (not c!44839)) b!262964))

(assert (= (and b!262972 res!128406) b!262959))

(assert (= (or b!262972 b!262964) bm!25152))

(assert (= (and b!262971 res!128407) b!262960))

(assert (= (and b!262960 c!44836) b!262965))

(assert (= (and b!262960 (not c!44836)) b!262957))

(assert (= (and b!262965 res!128404) b!262953))

(assert (= (or b!262965 b!262957) bm!25154))

(declare-fun b_lambda!8315 () Bool)

(assert (=> (not b_lambda!8315) (not b!262968)))

(assert (=> b!262968 t!8892))

(declare-fun b_and!13917 () Bool)

(assert (= b_and!13915 (and (=> t!8892 result!5425) b_and!13917)))

(declare-fun m!278595 () Bool)

(assert (=> bm!25158 m!278595))

(declare-fun m!278597 () Bool)

(assert (=> b!262959 m!278597))

(declare-fun m!278599 () Bool)

(assert (=> b!262967 m!278599))

(declare-fun m!278601 () Bool)

(assert (=> b!262967 m!278601))

(declare-fun m!278603 () Bool)

(assert (=> b!262967 m!278603))

(declare-fun m!278605 () Bool)

(assert (=> b!262967 m!278605))

(assert (=> b!262967 m!278587))

(declare-fun m!278607 () Bool)

(assert (=> b!262967 m!278607))

(declare-fun m!278609 () Bool)

(assert (=> b!262967 m!278609))

(declare-fun m!278611 () Bool)

(assert (=> b!262967 m!278611))

(assert (=> b!262967 m!278603))

(declare-fun m!278613 () Bool)

(assert (=> b!262967 m!278613))

(declare-fun m!278615 () Bool)

(assert (=> b!262967 m!278615))

(declare-fun m!278617 () Bool)

(assert (=> b!262967 m!278617))

(assert (=> b!262967 m!278595))

(assert (=> b!262967 m!278609))

(assert (=> b!262967 m!278615))

(declare-fun m!278619 () Bool)

(assert (=> b!262967 m!278619))

(assert (=> b!262967 m!278601))

(declare-fun m!278621 () Bool)

(assert (=> b!262967 m!278621))

(declare-fun m!278623 () Bool)

(assert (=> b!262967 m!278623))

(declare-fun m!278625 () Bool)

(assert (=> b!262967 m!278625))

(declare-fun m!278627 () Bool)

(assert (=> b!262967 m!278627))

(declare-fun m!278629 () Bool)

(assert (=> bm!25153 m!278629))

(assert (=> b!262968 m!278587))

(declare-fun m!278631 () Bool)

(assert (=> b!262968 m!278631))

(declare-fun m!278633 () Bool)

(assert (=> b!262968 m!278633))

(assert (=> b!262968 m!278569))

(declare-fun m!278635 () Bool)

(assert (=> b!262968 m!278635))

(assert (=> b!262968 m!278633))

(assert (=> b!262968 m!278569))

(assert (=> b!262968 m!278587))

(declare-fun m!278637 () Bool)

(assert (=> bm!25152 m!278637))

(declare-fun m!278639 () Bool)

(assert (=> b!262953 m!278639))

(declare-fun m!278641 () Bool)

(assert (=> b!262963 m!278641))

(assert (=> d!62945 m!278579))

(assert (=> b!262973 m!278587))

(assert (=> b!262973 m!278587))

(assert (=> b!262973 m!278589))

(assert (=> b!262962 m!278587))

(assert (=> b!262962 m!278587))

(assert (=> b!262962 m!278589))

(assert (=> b!262955 m!278587))

(assert (=> b!262955 m!278587))

(declare-fun m!278643 () Bool)

(assert (=> b!262955 m!278643))

(declare-fun m!278645 () Bool)

(assert (=> bm!25154 m!278645))

(assert (=> b!262719 d!62945))

(declare-fun b!262982 () Bool)

(declare-fun res!128421 () Bool)

(declare-fun e!170427 () Bool)

(assert (=> b!262982 (=> (not res!128421) (not e!170427))))

(assert (=> b!262982 (= res!128421 (not (validKeyInArray!0 (select (arr!5992 (_keys!7033 thiss!1504)) index!297))))))

(declare-fun b!262983 () Bool)

(declare-fun res!128420 () Bool)

(assert (=> b!262983 (=> (not res!128420) (not e!170427))))

(assert (=> b!262983 (= res!128420 (validKeyInArray!0 key!932))))

(declare-fun d!62947 () Bool)

(declare-fun e!170428 () Bool)

(assert (=> d!62947 e!170428))

(declare-fun res!128418 () Bool)

(assert (=> d!62947 (=> (not res!128418) (not e!170428))))

(assert (=> d!62947 (= res!128418 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6344 (_keys!7033 thiss!1504)))))))

(declare-fun lt!133011 () Unit!8136)

(declare-fun choose!1 (array!12665 (_ BitVec 32) (_ BitVec 64)) Unit!8136)

(assert (=> d!62947 (= lt!133011 (choose!1 (_keys!7033 thiss!1504) index!297 key!932))))

(assert (=> d!62947 e!170427))

(declare-fun res!128419 () Bool)

(assert (=> d!62947 (=> (not res!128419) (not e!170427))))

(assert (=> d!62947 (= res!128419 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6344 (_keys!7033 thiss!1504)))))))

(assert (=> d!62947 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7033 thiss!1504) index!297 key!932) lt!133011)))

(declare-fun b!262985 () Bool)

(assert (=> b!262985 (= e!170428 (= (arrayCountValidKeys!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!7033 thiss!1504) #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!262984 () Bool)

(assert (=> b!262984 (= e!170427 (bvslt (size!6344 (_keys!7033 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!62947 res!128419) b!262982))

(assert (= (and b!262982 res!128421) b!262983))

(assert (= (and b!262983 res!128420) b!262984))

(assert (= (and d!62947 res!128418) b!262985))

(declare-fun m!278647 () Bool)

(assert (=> b!262982 m!278647))

(assert (=> b!262982 m!278647))

(declare-fun m!278649 () Bool)

(assert (=> b!262982 m!278649))

(declare-fun m!278651 () Bool)

(assert (=> b!262983 m!278651))

(declare-fun m!278653 () Bool)

(assert (=> d!62947 m!278653))

(assert (=> b!262985 m!278327))

(declare-fun m!278655 () Bool)

(assert (=> b!262985 m!278655))

(assert (=> b!262985 m!278329))

(assert (=> b!262719 d!62947))

(declare-fun d!62949 () Bool)

(declare-fun e!170431 () Bool)

(assert (=> d!62949 e!170431))

(declare-fun res!128427 () Bool)

(assert (=> d!62949 (=> (not res!128427) (not e!170431))))

(declare-fun lt!133021 () ListLongMap!3823)

(assert (=> d!62949 (= res!128427 (contains!1889 lt!133021 (_1!2471 lt!132765)))))

(declare-fun lt!133020 () List!3817)

(assert (=> d!62949 (= lt!133021 (ListLongMap!3824 lt!133020))))

(declare-fun lt!133023 () Unit!8136)

(declare-fun lt!133022 () Unit!8136)

(assert (=> d!62949 (= lt!133023 lt!133022)))

(assert (=> d!62949 (= (getValueByKey!318 lt!133020 (_1!2471 lt!132765)) (Some!323 (_2!2471 lt!132765)))))

(declare-fun lemmaContainsTupThenGetReturnValue!177 (List!3817 (_ BitVec 64) V!8521) Unit!8136)

(assert (=> d!62949 (= lt!133022 (lemmaContainsTupThenGetReturnValue!177 lt!133020 (_1!2471 lt!132765) (_2!2471 lt!132765)))))

(declare-fun insertStrictlySorted!180 (List!3817 (_ BitVec 64) V!8521) List!3817)

(assert (=> d!62949 (= lt!133020 (insertStrictlySorted!180 (toList!1927 lt!132763) (_1!2471 lt!132765) (_2!2471 lt!132765)))))

(assert (=> d!62949 (= (+!713 lt!132763 lt!132765) lt!133021)))

(declare-fun b!262990 () Bool)

(declare-fun res!128426 () Bool)

(assert (=> b!262990 (=> (not res!128426) (not e!170431))))

(assert (=> b!262990 (= res!128426 (= (getValueByKey!318 (toList!1927 lt!133021) (_1!2471 lt!132765)) (Some!323 (_2!2471 lt!132765))))))

(declare-fun b!262991 () Bool)

(declare-fun contains!1893 (List!3817 tuple2!4920) Bool)

(assert (=> b!262991 (= e!170431 (contains!1893 (toList!1927 lt!133021) lt!132765))))

(assert (= (and d!62949 res!128427) b!262990))

(assert (= (and b!262990 res!128426) b!262991))

(declare-fun m!278657 () Bool)

(assert (=> d!62949 m!278657))

(declare-fun m!278659 () Bool)

(assert (=> d!62949 m!278659))

(declare-fun m!278661 () Bool)

(assert (=> d!62949 m!278661))

(declare-fun m!278663 () Bool)

(assert (=> d!62949 m!278663))

(declare-fun m!278665 () Bool)

(assert (=> b!262990 m!278665))

(declare-fun m!278667 () Bool)

(assert (=> b!262991 m!278667))

(assert (=> b!262719 d!62949))

(declare-fun b!263000 () Bool)

(declare-fun e!170437 () (_ BitVec 32))

(declare-fun call!25164 () (_ BitVec 32))

(assert (=> b!263000 (= e!170437 call!25164)))

(declare-fun bm!25161 () Bool)

(assert (=> bm!25161 (= call!25164 (arrayCountValidKeys!0 lt!132768 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!263001 () Bool)

(declare-fun e!170436 () (_ BitVec 32))

(assert (=> b!263001 (= e!170436 e!170437)))

(declare-fun c!44846 () Bool)

(assert (=> b!263001 (= c!44846 (validKeyInArray!0 (select (arr!5992 lt!132768) index!297)))))

(declare-fun b!263002 () Bool)

(assert (=> b!263002 (= e!170436 #b00000000000000000000000000000000)))

(declare-fun b!263003 () Bool)

(assert (=> b!263003 (= e!170437 (bvadd #b00000000000000000000000000000001 call!25164))))

(declare-fun d!62951 () Bool)

(declare-fun lt!133026 () (_ BitVec 32))

(assert (=> d!62951 (and (bvsge lt!133026 #b00000000000000000000000000000000) (bvsle lt!133026 (bvsub (size!6344 lt!132768) index!297)))))

(assert (=> d!62951 (= lt!133026 e!170436)))

(declare-fun c!44845 () Bool)

(assert (=> d!62951 (= c!44845 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62951 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6344 lt!132768)))))

(assert (=> d!62951 (= (arrayCountValidKeys!0 lt!132768 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!133026)))

(assert (= (and d!62951 c!44845) b!263002))

(assert (= (and d!62951 (not c!44845)) b!263001))

(assert (= (and b!263001 c!44846) b!263003))

(assert (= (and b!263001 (not c!44846)) b!263000))

(assert (= (or b!263003 b!263000) bm!25161))

(declare-fun m!278669 () Bool)

(assert (=> bm!25161 m!278669))

(declare-fun m!278671 () Bool)

(assert (=> b!263001 m!278671))

(assert (=> b!263001 m!278671))

(declare-fun m!278673 () Bool)

(assert (=> b!263001 m!278673))

(assert (=> b!262719 d!62951))

(declare-fun b!263012 () Bool)

(declare-fun e!170446 () Bool)

(declare-fun e!170445 () Bool)

(assert (=> b!263012 (= e!170446 e!170445)))

(declare-fun lt!133033 () (_ BitVec 64))

(assert (=> b!263012 (= lt!133033 (select (arr!5992 lt!132768) #b00000000000000000000000000000000))))

(declare-fun lt!133034 () Unit!8136)

(assert (=> b!263012 (= lt!133034 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132768 lt!133033 #b00000000000000000000000000000000))))

(assert (=> b!263012 (arrayContainsKey!0 lt!132768 lt!133033 #b00000000000000000000000000000000)))

(declare-fun lt!133035 () Unit!8136)

(assert (=> b!263012 (= lt!133035 lt!133034)))

(declare-fun res!128433 () Bool)

(assert (=> b!263012 (= res!128433 (= (seekEntryOrOpen!0 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) lt!132768 (mask!11207 thiss!1504)) (Found!1193 #b00000000000000000000000000000000)))))

(assert (=> b!263012 (=> (not res!128433) (not e!170445))))

(declare-fun d!62953 () Bool)

(declare-fun res!128432 () Bool)

(declare-fun e!170444 () Bool)

(assert (=> d!62953 (=> res!128432 e!170444)))

(assert (=> d!62953 (= res!128432 (bvsge #b00000000000000000000000000000000 (size!6344 lt!132768)))))

(assert (=> d!62953 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132768 (mask!11207 thiss!1504)) e!170444)))

(declare-fun b!263013 () Bool)

(declare-fun call!25167 () Bool)

(assert (=> b!263013 (= e!170445 call!25167)))

(declare-fun b!263014 () Bool)

(assert (=> b!263014 (= e!170444 e!170446)))

(declare-fun c!44849 () Bool)

(assert (=> b!263014 (= c!44849 (validKeyInArray!0 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(declare-fun b!263015 () Bool)

(assert (=> b!263015 (= e!170446 call!25167)))

(declare-fun bm!25164 () Bool)

(assert (=> bm!25164 (= call!25167 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!132768 (mask!11207 thiss!1504)))))

(assert (= (and d!62953 (not res!128432)) b!263014))

(assert (= (and b!263014 c!44849) b!263012))

(assert (= (and b!263014 (not c!44849)) b!263015))

(assert (= (and b!263012 res!128433) b!263013))

(assert (= (or b!263013 b!263015) bm!25164))

(assert (=> b!263012 m!278587))

(declare-fun m!278675 () Bool)

(assert (=> b!263012 m!278675))

(declare-fun m!278677 () Bool)

(assert (=> b!263012 m!278677))

(assert (=> b!263012 m!278587))

(declare-fun m!278679 () Bool)

(assert (=> b!263012 m!278679))

(assert (=> b!263014 m!278587))

(assert (=> b!263014 m!278587))

(assert (=> b!263014 m!278589))

(declare-fun m!278681 () Bool)

(assert (=> bm!25164 m!278681))

(assert (=> b!262719 d!62953))

(declare-fun d!62955 () Bool)

(declare-fun e!170449 () Bool)

(assert (=> d!62955 e!170449))

(declare-fun res!128436 () Bool)

(assert (=> d!62955 (=> (not res!128436) (not e!170449))))

(assert (=> d!62955 (= res!128436 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6344 lt!132768))))))

(declare-fun lt!133038 () Unit!8136)

(declare-fun choose!1295 (array!12665 array!12663 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 32) Int) Unit!8136)

(assert (=> d!62955 (= lt!133038 (choose!1295 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) index!297 (defaultEntry!4842 thiss!1504)))))

(assert (=> d!62955 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!62955 (= (lemmaValidKeyInArrayIsInListMap!151 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) index!297 (defaultEntry!4842 thiss!1504)) lt!133038)))

(declare-fun b!263018 () Bool)

(assert (=> b!263018 (= e!170449 (contains!1889 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) (select (arr!5992 lt!132768) index!297)))))

(assert (= (and d!62955 res!128436) b!263018))

(declare-fun m!278683 () Bool)

(assert (=> d!62955 m!278683))

(assert (=> d!62955 m!278579))

(assert (=> b!263018 m!278321))

(assert (=> b!263018 m!278671))

(assert (=> b!263018 m!278321))

(assert (=> b!263018 m!278671))

(declare-fun m!278685 () Bool)

(assert (=> b!263018 m!278685))

(assert (=> b!262719 d!62955))

(declare-fun d!62957 () Bool)

(assert (=> d!62957 (arrayContainsKey!0 lt!132768 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!133041 () Unit!8136)

(declare-fun choose!13 (array!12665 (_ BitVec 64) (_ BitVec 32)) Unit!8136)

(assert (=> d!62957 (= lt!133041 (choose!13 lt!132768 key!932 index!297))))

(assert (=> d!62957 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!62957 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132768 key!932 index!297) lt!133041)))

(declare-fun bs!9222 () Bool)

(assert (= bs!9222 d!62957))

(assert (=> bs!9222 m!278311))

(declare-fun m!278687 () Bool)

(assert (=> bs!9222 m!278687))

(assert (=> b!262719 d!62957))

(declare-fun b!263019 () Bool)

(declare-fun e!170451 () (_ BitVec 32))

(declare-fun call!25168 () (_ BitVec 32))

(assert (=> b!263019 (= e!170451 call!25168)))

(declare-fun bm!25165 () Bool)

(assert (=> bm!25165 (= call!25168 (arrayCountValidKeys!0 lt!132768 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun b!263020 () Bool)

(declare-fun e!170450 () (_ BitVec 32))

(assert (=> b!263020 (= e!170450 e!170451)))

(declare-fun c!44851 () Bool)

(assert (=> b!263020 (= c!44851 (validKeyInArray!0 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(declare-fun b!263021 () Bool)

(assert (=> b!263021 (= e!170450 #b00000000000000000000000000000000)))

(declare-fun b!263022 () Bool)

(assert (=> b!263022 (= e!170451 (bvadd #b00000000000000000000000000000001 call!25168))))

(declare-fun d!62959 () Bool)

(declare-fun lt!133042 () (_ BitVec 32))

(assert (=> d!62959 (and (bvsge lt!133042 #b00000000000000000000000000000000) (bvsle lt!133042 (bvsub (size!6344 lt!132768) #b00000000000000000000000000000000)))))

(assert (=> d!62959 (= lt!133042 e!170450)))

(declare-fun c!44850 () Bool)

(assert (=> d!62959 (= c!44850 (bvsge #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))))))

(assert (=> d!62959 (and (bvsle #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6344 (_keys!7033 thiss!1504)) (size!6344 lt!132768)))))

(assert (=> d!62959 (= (arrayCountValidKeys!0 lt!132768 #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))) lt!133042)))

(assert (= (and d!62959 c!44850) b!263021))

(assert (= (and d!62959 (not c!44850)) b!263020))

(assert (= (and b!263020 c!44851) b!263022))

(assert (= (and b!263020 (not c!44851)) b!263019))

(assert (= (or b!263022 b!263019) bm!25165))

(declare-fun m!278689 () Bool)

(assert (=> bm!25165 m!278689))

(assert (=> b!263020 m!278587))

(assert (=> b!263020 m!278587))

(assert (=> b!263020 m!278589))

(assert (=> b!262719 d!62959))

(declare-fun d!62961 () Bool)

(declare-fun e!170454 () Bool)

(assert (=> d!62961 e!170454))

(declare-fun res!128439 () Bool)

(assert (=> d!62961 (=> (not res!128439) (not e!170454))))

(assert (=> d!62961 (= res!128439 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6344 (_keys!7033 thiss!1504)))))))

(declare-fun lt!133045 () Unit!8136)

(declare-fun choose!41 (array!12665 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3818) Unit!8136)

(assert (=> d!62961 (= lt!133045 (choose!41 (_keys!7033 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3815))))

(assert (=> d!62961 (bvslt (size!6344 (_keys!7033 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!62961 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7033 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3815) lt!133045)))

(declare-fun b!263025 () Bool)

(assert (=> b!263025 (= e!170454 (arrayNoDuplicates!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) #b00000000000000000000000000000000 Nil!3815))))

(assert (= (and d!62961 res!128439) b!263025))

(declare-fun m!278691 () Bool)

(assert (=> d!62961 m!278691))

(assert (=> b!263025 m!278327))

(declare-fun m!278693 () Bool)

(assert (=> b!263025 m!278693))

(assert (=> b!262719 d!62961))

(assert (=> b!262719 d!62929))

(declare-fun d!62963 () Bool)

(declare-fun e!170457 () Bool)

(assert (=> d!62963 e!170457))

(declare-fun res!128442 () Bool)

(assert (=> d!62963 (=> (not res!128442) (not e!170457))))

(assert (=> d!62963 (= res!128442 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6344 (_keys!7033 thiss!1504)))))))

(declare-fun lt!133048 () Unit!8136)

(declare-fun choose!102 ((_ BitVec 64) array!12665 (_ BitVec 32) (_ BitVec 32)) Unit!8136)

(assert (=> d!62963 (= lt!133048 (choose!102 key!932 (_keys!7033 thiss!1504) index!297 (mask!11207 thiss!1504)))))

(assert (=> d!62963 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!62963 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7033 thiss!1504) index!297 (mask!11207 thiss!1504)) lt!133048)))

(declare-fun b!263028 () Bool)

(assert (=> b!263028 (= e!170457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (mask!11207 thiss!1504)))))

(assert (= (and d!62963 res!128442) b!263028))

(declare-fun m!278695 () Bool)

(assert (=> d!62963 m!278695))

(assert (=> d!62963 m!278579))

(assert (=> b!263028 m!278327))

(declare-fun m!278697 () Bool)

(assert (=> b!263028 m!278697))

(assert (=> b!262719 d!62963))

(declare-fun b!263029 () Bool)

(declare-fun e!170459 () (_ BitVec 32))

(declare-fun call!25169 () (_ BitVec 32))

(assert (=> b!263029 (= e!170459 call!25169)))

(declare-fun bm!25166 () Bool)

(assert (=> bm!25166 (= call!25169 (arrayCountValidKeys!0 (_keys!7033 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun b!263030 () Bool)

(declare-fun e!170458 () (_ BitVec 32))

(assert (=> b!263030 (= e!170458 e!170459)))

(declare-fun c!44853 () Bool)

(assert (=> b!263030 (= c!44853 (validKeyInArray!0 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263031 () Bool)

(assert (=> b!263031 (= e!170458 #b00000000000000000000000000000000)))

(declare-fun b!263032 () Bool)

(assert (=> b!263032 (= e!170459 (bvadd #b00000000000000000000000000000001 call!25169))))

(declare-fun d!62965 () Bool)

(declare-fun lt!133049 () (_ BitVec 32))

(assert (=> d!62965 (and (bvsge lt!133049 #b00000000000000000000000000000000) (bvsle lt!133049 (bvsub (size!6344 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!62965 (= lt!133049 e!170458)))

(declare-fun c!44852 () Bool)

(assert (=> d!62965 (= c!44852 (bvsge #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))))))

(assert (=> d!62965 (and (bvsle #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6344 (_keys!7033 thiss!1504)) (size!6344 (_keys!7033 thiss!1504))))))

(assert (=> d!62965 (= (arrayCountValidKeys!0 (_keys!7033 thiss!1504) #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))) lt!133049)))

(assert (= (and d!62965 c!44852) b!263031))

(assert (= (and d!62965 (not c!44852)) b!263030))

(assert (= (and b!263030 c!44853) b!263032))

(assert (= (and b!263030 (not c!44853)) b!263029))

(assert (= (or b!263032 b!263029) bm!25166))

(declare-fun m!278699 () Bool)

(assert (=> bm!25166 m!278699))

(assert (=> b!263030 m!278517))

(assert (=> b!263030 m!278517))

(assert (=> b!263030 m!278581))

(assert (=> b!262719 d!62965))

(declare-fun d!62967 () Bool)

(declare-fun res!128443 () Bool)

(declare-fun e!170460 () Bool)

(assert (=> d!62967 (=> res!128443 e!170460)))

(assert (=> d!62967 (= res!128443 (= (select (arr!5992 lt!132768) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62967 (= (arrayContainsKey!0 lt!132768 key!932 #b00000000000000000000000000000000) e!170460)))

(declare-fun b!263033 () Bool)

(declare-fun e!170461 () Bool)

(assert (=> b!263033 (= e!170460 e!170461)))

(declare-fun res!128444 () Bool)

(assert (=> b!263033 (=> (not res!128444) (not e!170461))))

(assert (=> b!263033 (= res!128444 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 lt!132768)))))

(declare-fun b!263034 () Bool)

(assert (=> b!263034 (= e!170461 (arrayContainsKey!0 lt!132768 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62967 (not res!128443)) b!263033))

(assert (= (and b!263033 res!128444) b!263034))

(assert (=> d!62967 m!278587))

(declare-fun m!278701 () Bool)

(assert (=> b!263034 m!278701))

(assert (=> b!262719 d!62967))

(declare-fun d!62969 () Bool)

(declare-fun e!170464 () Bool)

(assert (=> d!62969 e!170464))

(declare-fun res!128447 () Bool)

(assert (=> d!62969 (=> (not res!128447) (not e!170464))))

(assert (=> d!62969 (= res!128447 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6344 (_keys!7033 thiss!1504))) (bvslt index!297 (size!6343 (_values!4825 thiss!1504)))))))

(declare-fun lt!133052 () Unit!8136)

(declare-fun choose!1296 (array!12665 array!12663 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 32) (_ BitVec 64) V!8521 Int) Unit!8136)

(assert (=> d!62969 (= lt!133052 (choose!1296 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) index!297 key!932 v!346 (defaultEntry!4842 thiss!1504)))))

(assert (=> d!62969 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!62969 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!124 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) index!297 key!932 v!346 (defaultEntry!4842 thiss!1504)) lt!133052)))

(declare-fun b!263037 () Bool)

(assert (=> b!263037 (= e!170464 (= (+!713 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) (tuple2!4921 key!932 v!346)) (getCurrentListMap!1436 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504))) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))))

(assert (= (and d!62969 res!128447) b!263037))

(declare-fun m!278703 () Bool)

(assert (=> d!62969 m!278703))

(assert (=> d!62969 m!278579))

(assert (=> b!263037 m!278327))

(declare-fun m!278705 () Bool)

(assert (=> b!263037 m!278705))

(assert (=> b!263037 m!278293))

(assert (=> b!263037 m!278293))

(declare-fun m!278707 () Bool)

(assert (=> b!263037 m!278707))

(assert (=> b!263037 m!278319))

(assert (=> b!262719 d!62969))

(declare-fun d!62971 () Bool)

(declare-fun e!170465 () Bool)

(assert (=> d!62971 e!170465))

(declare-fun res!128448 () Bool)

(assert (=> d!62971 (=> res!128448 e!170465)))

(declare-fun lt!133056 () Bool)

(assert (=> d!62971 (= res!128448 (not lt!133056))))

(declare-fun lt!133054 () Bool)

(assert (=> d!62971 (= lt!133056 lt!133054)))

(declare-fun lt!133053 () Unit!8136)

(declare-fun e!170466 () Unit!8136)

(assert (=> d!62971 (= lt!133053 e!170466)))

(declare-fun c!44854 () Bool)

(assert (=> d!62971 (= c!44854 lt!133054)))

(assert (=> d!62971 (= lt!133054 (containsKey!310 (toList!1927 lt!132775) key!932))))

(assert (=> d!62971 (= (contains!1889 lt!132775 key!932) lt!133056)))

(declare-fun b!263038 () Bool)

(declare-fun lt!133055 () Unit!8136)

(assert (=> b!263038 (= e!170466 lt!133055)))

(assert (=> b!263038 (= lt!133055 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!132775) key!932))))

(assert (=> b!263038 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132775) key!932))))

(declare-fun b!263039 () Bool)

(declare-fun Unit!8154 () Unit!8136)

(assert (=> b!263039 (= e!170466 Unit!8154)))

(declare-fun b!263040 () Bool)

(assert (=> b!263040 (= e!170465 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132775) key!932)))))

(assert (= (and d!62971 c!44854) b!263038))

(assert (= (and d!62971 (not c!44854)) b!263039))

(assert (= (and d!62971 (not res!128448)) b!263040))

(declare-fun m!278709 () Bool)

(assert (=> d!62971 m!278709))

(declare-fun m!278711 () Bool)

(assert (=> b!263038 m!278711))

(declare-fun m!278713 () Bool)

(assert (=> b!263038 m!278713))

(assert (=> b!263038 m!278713))

(declare-fun m!278715 () Bool)

(assert (=> b!263038 m!278715))

(assert (=> b!263040 m!278713))

(assert (=> b!263040 m!278713))

(assert (=> b!263040 m!278715))

(assert (=> b!262719 d!62971))

(declare-fun d!62973 () Bool)

(assert (=> d!62973 (= (arrayCountValidKeys!0 lt!132768 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!133059 () Unit!8136)

(declare-fun choose!2 (array!12665 (_ BitVec 32)) Unit!8136)

(assert (=> d!62973 (= lt!133059 (choose!2 lt!132768 index!297))))

(declare-fun e!170469 () Bool)

(assert (=> d!62973 e!170469))

(declare-fun res!128453 () Bool)

(assert (=> d!62973 (=> (not res!128453) (not e!170469))))

(assert (=> d!62973 (= res!128453 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6344 lt!132768))))))

(assert (=> d!62973 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132768 index!297) lt!133059)))

(declare-fun b!263045 () Bool)

(declare-fun res!128454 () Bool)

(assert (=> b!263045 (=> (not res!128454) (not e!170469))))

(assert (=> b!263045 (= res!128454 (validKeyInArray!0 (select (arr!5992 lt!132768) index!297)))))

(declare-fun b!263046 () Bool)

(assert (=> b!263046 (= e!170469 (bvslt (size!6344 lt!132768) #b01111111111111111111111111111111))))

(assert (= (and d!62973 res!128453) b!263045))

(assert (= (and b!263045 res!128454) b!263046))

(declare-fun m!278717 () Bool)

(assert (=> d!62973 m!278717))

(declare-fun m!278719 () Bool)

(assert (=> d!62973 m!278719))

(assert (=> b!263045 m!278671))

(assert (=> b!263045 m!278671))

(assert (=> b!263045 m!278673))

(assert (=> b!262719 d!62973))

(declare-fun d!62975 () Bool)

(declare-fun res!128461 () Bool)

(declare-fun e!170472 () Bool)

(assert (=> d!62975 (=> (not res!128461) (not e!170472))))

(declare-fun simpleValid!285 (LongMapFixedSize!3868) Bool)

(assert (=> d!62975 (= res!128461 (simpleValid!285 lt!132778))))

(assert (=> d!62975 (= (valid!1513 lt!132778) e!170472)))

(declare-fun b!263053 () Bool)

(declare-fun res!128462 () Bool)

(assert (=> b!263053 (=> (not res!128462) (not e!170472))))

(assert (=> b!263053 (= res!128462 (= (arrayCountValidKeys!0 (_keys!7033 lt!132778) #b00000000000000000000000000000000 (size!6344 (_keys!7033 lt!132778))) (_size!1983 lt!132778)))))

(declare-fun b!263054 () Bool)

(declare-fun res!128463 () Bool)

(assert (=> b!263054 (=> (not res!128463) (not e!170472))))

(assert (=> b!263054 (= res!128463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!7033 lt!132778) (mask!11207 lt!132778)))))

(declare-fun b!263055 () Bool)

(assert (=> b!263055 (= e!170472 (arrayNoDuplicates!0 (_keys!7033 lt!132778) #b00000000000000000000000000000000 Nil!3815))))

(assert (= (and d!62975 res!128461) b!263053))

(assert (= (and b!263053 res!128462) b!263054))

(assert (= (and b!263054 res!128463) b!263055))

(declare-fun m!278721 () Bool)

(assert (=> d!62975 m!278721))

(declare-fun m!278723 () Bool)

(assert (=> b!263053 m!278723))

(declare-fun m!278725 () Bool)

(assert (=> b!263054 m!278725))

(declare-fun m!278727 () Bool)

(assert (=> b!263055 m!278727))

(assert (=> b!262719 d!62975))

(declare-fun d!62977 () Bool)

(declare-fun res!128464 () Bool)

(declare-fun e!170473 () Bool)

(assert (=> d!62977 (=> (not res!128464) (not e!170473))))

(assert (=> d!62977 (= res!128464 (simpleValid!285 thiss!1504))))

(assert (=> d!62977 (= (valid!1513 thiss!1504) e!170473)))

(declare-fun b!263056 () Bool)

(declare-fun res!128465 () Bool)

(assert (=> b!263056 (=> (not res!128465) (not e!170473))))

(assert (=> b!263056 (= res!128465 (= (arrayCountValidKeys!0 (_keys!7033 thiss!1504) #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))) (_size!1983 thiss!1504)))))

(declare-fun b!263057 () Bool)

(declare-fun res!128466 () Bool)

(assert (=> b!263057 (=> (not res!128466) (not e!170473))))

(assert (=> b!263057 (= res!128466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!7033 thiss!1504) (mask!11207 thiss!1504)))))

(declare-fun b!263058 () Bool)

(assert (=> b!263058 (= e!170473 (arrayNoDuplicates!0 (_keys!7033 thiss!1504) #b00000000000000000000000000000000 Nil!3815))))

(assert (= (and d!62977 res!128464) b!263056))

(assert (= (and b!263056 res!128465) b!263057))

(assert (= (and b!263057 res!128466) b!263058))

(declare-fun m!278729 () Bool)

(assert (=> d!62977 m!278729))

(assert (=> b!263056 m!278329))

(declare-fun m!278731 () Bool)

(assert (=> b!263057 m!278731))

(declare-fun m!278733 () Bool)

(assert (=> b!263058 m!278733))

(assert (=> start!25240 d!62977))

(declare-fun b!263071 () Bool)

(declare-fun e!170481 () SeekEntryResult!1193)

(declare-fun lt!133068 () SeekEntryResult!1193)

(assert (=> b!263071 (= e!170481 (MissingZero!1193 (index!6944 lt!133068)))))

(declare-fun d!62979 () Bool)

(declare-fun lt!133066 () SeekEntryResult!1193)

(assert (=> d!62979 (and (or ((_ is Undefined!1193) lt!133066) (not ((_ is Found!1193) lt!133066)) (and (bvsge (index!6943 lt!133066) #b00000000000000000000000000000000) (bvslt (index!6943 lt!133066) (size!6344 (_keys!7033 thiss!1504))))) (or ((_ is Undefined!1193) lt!133066) ((_ is Found!1193) lt!133066) (not ((_ is MissingZero!1193) lt!133066)) (and (bvsge (index!6942 lt!133066) #b00000000000000000000000000000000) (bvslt (index!6942 lt!133066) (size!6344 (_keys!7033 thiss!1504))))) (or ((_ is Undefined!1193) lt!133066) ((_ is Found!1193) lt!133066) ((_ is MissingZero!1193) lt!133066) (not ((_ is MissingVacant!1193) lt!133066)) (and (bvsge (index!6945 lt!133066) #b00000000000000000000000000000000) (bvslt (index!6945 lt!133066) (size!6344 (_keys!7033 thiss!1504))))) (or ((_ is Undefined!1193) lt!133066) (ite ((_ is Found!1193) lt!133066) (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6943 lt!133066)) key!932) (ite ((_ is MissingZero!1193) lt!133066) (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6942 lt!133066)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1193) lt!133066) (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6945 lt!133066)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!170480 () SeekEntryResult!1193)

(assert (=> d!62979 (= lt!133066 e!170480)))

(declare-fun c!44862 () Bool)

(assert (=> d!62979 (= c!44862 (and ((_ is Intermediate!1193) lt!133068) (undefined!2005 lt!133068)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12665 (_ BitVec 32)) SeekEntryResult!1193)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!62979 (= lt!133068 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11207 thiss!1504)) key!932 (_keys!7033 thiss!1504) (mask!11207 thiss!1504)))))

(assert (=> d!62979 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!62979 (= (seekEntryOrOpen!0 key!932 (_keys!7033 thiss!1504) (mask!11207 thiss!1504)) lt!133066)))

(declare-fun b!263072 () Bool)

(declare-fun e!170482 () SeekEntryResult!1193)

(assert (=> b!263072 (= e!170480 e!170482)))

(declare-fun lt!133067 () (_ BitVec 64))

(assert (=> b!263072 (= lt!133067 (select (arr!5992 (_keys!7033 thiss!1504)) (index!6944 lt!133068)))))

(declare-fun c!44863 () Bool)

(assert (=> b!263072 (= c!44863 (= lt!133067 key!932))))

(declare-fun b!263073 () Bool)

(assert (=> b!263073 (= e!170482 (Found!1193 (index!6944 lt!133068)))))

(declare-fun b!263074 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12665 (_ BitVec 32)) SeekEntryResult!1193)

(assert (=> b!263074 (= e!170481 (seekKeyOrZeroReturnVacant!0 (x!25234 lt!133068) (index!6944 lt!133068) (index!6944 lt!133068) key!932 (_keys!7033 thiss!1504) (mask!11207 thiss!1504)))))

(declare-fun b!263075 () Bool)

(assert (=> b!263075 (= e!170480 Undefined!1193)))

(declare-fun b!263076 () Bool)

(declare-fun c!44861 () Bool)

(assert (=> b!263076 (= c!44861 (= lt!133067 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263076 (= e!170482 e!170481)))

(assert (= (and d!62979 c!44862) b!263075))

(assert (= (and d!62979 (not c!44862)) b!263072))

(assert (= (and b!263072 c!44863) b!263073))

(assert (= (and b!263072 (not c!44863)) b!263076))

(assert (= (and b!263076 c!44861) b!263071))

(assert (= (and b!263076 (not c!44861)) b!263074))

(declare-fun m!278735 () Bool)

(assert (=> d!62979 m!278735))

(declare-fun m!278737 () Bool)

(assert (=> d!62979 m!278737))

(declare-fun m!278739 () Bool)

(assert (=> d!62979 m!278739))

(assert (=> d!62979 m!278579))

(declare-fun m!278741 () Bool)

(assert (=> d!62979 m!278741))

(declare-fun m!278743 () Bool)

(assert (=> d!62979 m!278743))

(assert (=> d!62979 m!278735))

(declare-fun m!278745 () Bool)

(assert (=> b!263072 m!278745))

(declare-fun m!278747 () Bool)

(assert (=> b!263074 m!278747))

(assert (=> b!262720 d!62979))

(declare-fun d!62981 () Bool)

(assert (=> d!62981 (contains!1889 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) key!932)))

(declare-fun lt!133071 () Unit!8136)

(declare-fun choose!1297 (array!12665 array!12663 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 64) (_ BitVec 32) Int) Unit!8136)

(assert (=> d!62981 (= lt!133071 (choose!1297 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(assert (=> d!62981 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!62981 (= (lemmaArrayContainsKeyThenInListMap!262 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) lt!133071)))

(declare-fun bs!9223 () Bool)

(assert (= bs!9223 d!62981))

(assert (=> bs!9223 m!278293))

(assert (=> bs!9223 m!278293))

(declare-fun m!278749 () Bool)

(assert (=> bs!9223 m!278749))

(declare-fun m!278751 () Bool)

(assert (=> bs!9223 m!278751))

(assert (=> bs!9223 m!278579))

(assert (=> b!262709 d!62981))

(declare-fun d!62983 () Bool)

(declare-fun e!170483 () Bool)

(assert (=> d!62983 e!170483))

(declare-fun res!128468 () Bool)

(assert (=> d!62983 (=> (not res!128468) (not e!170483))))

(declare-fun lt!133073 () ListLongMap!3823)

(assert (=> d!62983 (= res!128468 (contains!1889 lt!133073 (_1!2471 lt!132765)))))

(declare-fun lt!133072 () List!3817)

(assert (=> d!62983 (= lt!133073 (ListLongMap!3824 lt!133072))))

(declare-fun lt!133075 () Unit!8136)

(declare-fun lt!133074 () Unit!8136)

(assert (=> d!62983 (= lt!133075 lt!133074)))

(assert (=> d!62983 (= (getValueByKey!318 lt!133072 (_1!2471 lt!132765)) (Some!323 (_2!2471 lt!132765)))))

(assert (=> d!62983 (= lt!133074 (lemmaContainsTupThenGetReturnValue!177 lt!133072 (_1!2471 lt!132765) (_2!2471 lt!132765)))))

(assert (=> d!62983 (= lt!133072 (insertStrictlySorted!180 (toList!1927 (map!2737 thiss!1504)) (_1!2471 lt!132765) (_2!2471 lt!132765)))))

(assert (=> d!62983 (= (+!713 (map!2737 thiss!1504) lt!132765) lt!133073)))

(declare-fun b!263077 () Bool)

(declare-fun res!128467 () Bool)

(assert (=> b!263077 (=> (not res!128467) (not e!170483))))

(assert (=> b!263077 (= res!128467 (= (getValueByKey!318 (toList!1927 lt!133073) (_1!2471 lt!132765)) (Some!323 (_2!2471 lt!132765))))))

(declare-fun b!263078 () Bool)

(assert (=> b!263078 (= e!170483 (contains!1893 (toList!1927 lt!133073) lt!132765))))

(assert (= (and d!62983 res!128468) b!263077))

(assert (= (and b!263077 res!128467) b!263078))

(declare-fun m!278753 () Bool)

(assert (=> d!62983 m!278753))

(declare-fun m!278755 () Bool)

(assert (=> d!62983 m!278755))

(declare-fun m!278757 () Bool)

(assert (=> d!62983 m!278757))

(declare-fun m!278759 () Bool)

(assert (=> d!62983 m!278759))

(declare-fun m!278761 () Bool)

(assert (=> b!263077 m!278761))

(declare-fun m!278763 () Bool)

(assert (=> b!263078 m!278763))

(assert (=> b!262710 d!62983))

(declare-fun d!62985 () Bool)

(assert (=> d!62985 (= (map!2737 thiss!1504) (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun bs!9224 () Bool)

(assert (= bs!9224 d!62985))

(assert (=> bs!9224 m!278293))

(assert (=> b!262710 d!62985))

(declare-fun d!62987 () Bool)

(declare-fun e!170486 () Bool)

(assert (=> d!62987 e!170486))

(declare-fun res!128473 () Bool)

(assert (=> d!62987 (=> (not res!128473) (not e!170486))))

(declare-fun lt!133080 () SeekEntryResult!1193)

(assert (=> d!62987 (= res!128473 ((_ is Found!1193) lt!133080))))

(assert (=> d!62987 (= lt!133080 (seekEntryOrOpen!0 key!932 (_keys!7033 thiss!1504) (mask!11207 thiss!1504)))))

(declare-fun lt!133081 () Unit!8136)

(declare-fun choose!1298 (array!12665 array!12663 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 64) Int) Unit!8136)

(assert (=> d!62987 (= lt!133081 (choose!1298 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 (defaultEntry!4842 thiss!1504)))))

(assert (=> d!62987 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!62987 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!448 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 (defaultEntry!4842 thiss!1504)) lt!133081)))

(declare-fun b!263083 () Bool)

(declare-fun res!128474 () Bool)

(assert (=> b!263083 (=> (not res!128474) (not e!170486))))

(assert (=> b!263083 (= res!128474 (inRange!0 (index!6943 lt!133080) (mask!11207 thiss!1504)))))

(declare-fun b!263084 () Bool)

(assert (=> b!263084 (= e!170486 (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6943 lt!133080)) key!932))))

(assert (=> b!263084 (and (bvsge (index!6943 lt!133080) #b00000000000000000000000000000000) (bvslt (index!6943 lt!133080) (size!6344 (_keys!7033 thiss!1504))))))

(assert (= (and d!62987 res!128473) b!263083))

(assert (= (and b!263083 res!128474) b!263084))

(assert (=> d!62987 m!278351))

(declare-fun m!278765 () Bool)

(assert (=> d!62987 m!278765))

(assert (=> d!62987 m!278579))

(declare-fun m!278767 () Bool)

(assert (=> b!263083 m!278767))

(declare-fun m!278769 () Bool)

(assert (=> b!263084 m!278769))

(assert (=> b!262713 d!62987))

(declare-fun d!62989 () Bool)

(declare-fun e!170487 () Bool)

(assert (=> d!62989 e!170487))

(declare-fun res!128475 () Bool)

(assert (=> d!62989 (=> res!128475 e!170487)))

(declare-fun lt!133085 () Bool)

(assert (=> d!62989 (= res!128475 (not lt!133085))))

(declare-fun lt!133083 () Bool)

(assert (=> d!62989 (= lt!133085 lt!133083)))

(declare-fun lt!133082 () Unit!8136)

(declare-fun e!170488 () Unit!8136)

(assert (=> d!62989 (= lt!133082 e!170488)))

(declare-fun c!44864 () Bool)

(assert (=> d!62989 (= c!44864 lt!133083)))

(assert (=> d!62989 (= lt!133083 (containsKey!310 (toList!1927 lt!132776) key!932))))

(assert (=> d!62989 (= (contains!1889 lt!132776 key!932) lt!133085)))

(declare-fun b!263085 () Bool)

(declare-fun lt!133084 () Unit!8136)

(assert (=> b!263085 (= e!170488 lt!133084)))

(assert (=> b!263085 (= lt!133084 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!132776) key!932))))

(assert (=> b!263085 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132776) key!932))))

(declare-fun b!263086 () Bool)

(declare-fun Unit!8155 () Unit!8136)

(assert (=> b!263086 (= e!170488 Unit!8155)))

(declare-fun b!263087 () Bool)

(assert (=> b!263087 (= e!170487 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132776) key!932)))))

(assert (= (and d!62989 c!44864) b!263085))

(assert (= (and d!62989 (not c!44864)) b!263086))

(assert (= (and d!62989 (not res!128475)) b!263087))

(declare-fun m!278771 () Bool)

(assert (=> d!62989 m!278771))

(declare-fun m!278773 () Bool)

(assert (=> b!263085 m!278773))

(declare-fun m!278775 () Bool)

(assert (=> b!263085 m!278775))

(assert (=> b!263085 m!278775))

(declare-fun m!278777 () Bool)

(assert (=> b!263085 m!278777))

(assert (=> b!263087 m!278775))

(assert (=> b!263087 m!278775))

(assert (=> b!263087 m!278777))

(assert (=> b!262714 d!62989))

(declare-fun d!62991 () Bool)

(assert (=> d!62991 (= (map!2737 lt!132778) (getCurrentListMap!1436 (_keys!7033 lt!132778) (_values!4825 lt!132778) (mask!11207 lt!132778) (extraKeys!4579 lt!132778) (zeroValue!4683 lt!132778) (minValue!4683 lt!132778) #b00000000000000000000000000000000 (defaultEntry!4842 lt!132778)))))

(declare-fun bs!9225 () Bool)

(assert (= bs!9225 d!62991))

(declare-fun m!278779 () Bool)

(assert (=> bs!9225 m!278779))

(assert (=> b!262714 d!62991))

(declare-fun b!263104 () Bool)

(declare-fun res!128487 () Bool)

(declare-fun e!170498 () Bool)

(assert (=> b!263104 (=> (not res!128487) (not e!170498))))

(declare-fun call!25175 () Bool)

(assert (=> b!263104 (= res!128487 call!25175)))

(declare-fun e!170500 () Bool)

(assert (=> b!263104 (= e!170500 e!170498)))

(declare-fun b!263105 () Bool)

(declare-fun res!128484 () Bool)

(assert (=> b!263105 (=> (not res!128484) (not e!170498))))

(declare-fun lt!133091 () SeekEntryResult!1193)

(assert (=> b!263105 (= res!128484 (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6945 lt!133091)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263105 (and (bvsge (index!6945 lt!133091) #b00000000000000000000000000000000) (bvslt (index!6945 lt!133091) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun d!62993 () Bool)

(declare-fun e!170499 () Bool)

(assert (=> d!62993 e!170499))

(declare-fun c!44869 () Bool)

(assert (=> d!62993 (= c!44869 ((_ is MissingZero!1193) lt!133091))))

(assert (=> d!62993 (= lt!133091 (seekEntryOrOpen!0 key!932 (_keys!7033 thiss!1504) (mask!11207 thiss!1504)))))

(declare-fun lt!133090 () Unit!8136)

(declare-fun choose!1299 (array!12665 array!12663 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 64) Int) Unit!8136)

(assert (=> d!62993 (= lt!133090 (choose!1299 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 (defaultEntry!4842 thiss!1504)))))

(assert (=> d!62993 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!62993 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!448 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 (defaultEntry!4842 thiss!1504)) lt!133090)))

(declare-fun b!263106 () Bool)

(declare-fun e!170497 () Bool)

(declare-fun call!25174 () Bool)

(assert (=> b!263106 (= e!170497 (not call!25174))))

(declare-fun b!263107 () Bool)

(assert (=> b!263107 (= e!170500 ((_ is Undefined!1193) lt!133091))))

(declare-fun bm!25171 () Bool)

(assert (=> bm!25171 (= call!25175 (inRange!0 (ite c!44869 (index!6942 lt!133091) (index!6945 lt!133091)) (mask!11207 thiss!1504)))))

(declare-fun b!263108 () Bool)

(assert (=> b!263108 (and (bvsge (index!6942 lt!133091) #b00000000000000000000000000000000) (bvslt (index!6942 lt!133091) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun res!128486 () Bool)

(assert (=> b!263108 (= res!128486 (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6942 lt!133091)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263108 (=> (not res!128486) (not e!170497))))

(declare-fun bm!25172 () Bool)

(assert (=> bm!25172 (= call!25174 (arrayContainsKey!0 (_keys!7033 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!263109 () Bool)

(assert (=> b!263109 (= e!170498 (not call!25174))))

(declare-fun b!263110 () Bool)

(assert (=> b!263110 (= e!170499 e!170497)))

(declare-fun res!128485 () Bool)

(assert (=> b!263110 (= res!128485 call!25175)))

(assert (=> b!263110 (=> (not res!128485) (not e!170497))))

(declare-fun b!263111 () Bool)

(assert (=> b!263111 (= e!170499 e!170500)))

(declare-fun c!44870 () Bool)

(assert (=> b!263111 (= c!44870 ((_ is MissingVacant!1193) lt!133091))))

(assert (= (and d!62993 c!44869) b!263110))

(assert (= (and d!62993 (not c!44869)) b!263111))

(assert (= (and b!263110 res!128485) b!263108))

(assert (= (and b!263108 res!128486) b!263106))

(assert (= (and b!263111 c!44870) b!263104))

(assert (= (and b!263111 (not c!44870)) b!263107))

(assert (= (and b!263104 res!128487) b!263105))

(assert (= (and b!263105 res!128484) b!263109))

(assert (= (or b!263110 b!263104) bm!25171))

(assert (= (or b!263106 b!263109) bm!25172))

(declare-fun m!278781 () Bool)

(assert (=> b!263108 m!278781))

(assert (=> d!62993 m!278351))

(declare-fun m!278783 () Bool)

(assert (=> d!62993 m!278783))

(assert (=> d!62993 m!278579))

(assert (=> bm!25172 m!278313))

(declare-fun m!278785 () Bool)

(assert (=> b!263105 m!278785))

(declare-fun m!278787 () Bool)

(assert (=> bm!25171 m!278787))

(assert (=> b!262712 d!62993))

(declare-fun b!263118 () Bool)

(declare-fun e!170506 () Bool)

(assert (=> b!263118 (= e!170506 tp_is_empty!6655)))

(declare-fun condMapEmpty!11356 () Bool)

(declare-fun mapDefault!11356 () ValueCell!2984)

(assert (=> mapNonEmpty!11347 (= condMapEmpty!11356 (= mapRest!11347 ((as const (Array (_ BitVec 32) ValueCell!2984)) mapDefault!11356)))))

(declare-fun e!170505 () Bool)

(declare-fun mapRes!11356 () Bool)

(assert (=> mapNonEmpty!11347 (= tp!23716 (and e!170505 mapRes!11356))))

(declare-fun b!263119 () Bool)

(assert (=> b!263119 (= e!170505 tp_is_empty!6655)))

(declare-fun mapNonEmpty!11356 () Bool)

(declare-fun tp!23731 () Bool)

(assert (=> mapNonEmpty!11356 (= mapRes!11356 (and tp!23731 e!170506))))

(declare-fun mapValue!11356 () ValueCell!2984)

(declare-fun mapKey!11356 () (_ BitVec 32))

(declare-fun mapRest!11356 () (Array (_ BitVec 32) ValueCell!2984))

(assert (=> mapNonEmpty!11356 (= mapRest!11347 (store mapRest!11356 mapKey!11356 mapValue!11356))))

(declare-fun mapIsEmpty!11356 () Bool)

(assert (=> mapIsEmpty!11356 mapRes!11356))

(assert (= (and mapNonEmpty!11347 condMapEmpty!11356) mapIsEmpty!11356))

(assert (= (and mapNonEmpty!11347 (not condMapEmpty!11356)) mapNonEmpty!11356))

(assert (= (and mapNonEmpty!11356 ((_ is ValueCellFull!2984) mapValue!11356)) b!263118))

(assert (= (and mapNonEmpty!11347 ((_ is ValueCellFull!2984) mapDefault!11356)) b!263119))

(declare-fun m!278789 () Bool)

(assert (=> mapNonEmpty!11356 m!278789))

(declare-fun b_lambda!8317 () Bool)

(assert (= b_lambda!8315 (or (and b!262722 b_free!6793) b_lambda!8317)))

(declare-fun b_lambda!8319 () Bool)

(assert (= b_lambda!8313 (or (and b!262722 b_free!6793) b_lambda!8319)))

(check-sat (not b!263074) (not b!263012) (not bm!25144) (not b!263083) (not b!262959) (not d!62935) (not b!262955) (not b!263057) (not b_lambda!8317) (not b!263054) (not b!263028) (not b_lambda!8319) (not b!262935) (not d!62955) (not bm!25172) (not d!62933) (not b!263038) (not b!263030) (not b!262952) (not d!62983) (not b_next!6793) (not bm!25171) (not d!62975) (not b!262948) (not d!62977) b_and!13917 (not b!263025) (not b!262915) (not d!62961) (not b!263053) (not b!263058) (not b!262929) (not bm!25158) (not d!62949) (not b!262990) (not b!262863) (not bm!25161) (not b!263087) (not b!263037) (not d!62993) (not mapNonEmpty!11356) (not b!263014) (not d!62981) (not b!262991) (not b!262917) (not bm!25151) (not bm!25143) (not d!62973) (not d!62989) (not d!62963) (not b!263020) (not d!62969) (not b!263040) (not b!263077) (not b!262962) (not bm!25152) tp_is_empty!6655 (not b!262983) (not b!262968) (not b!262982) (not d!62945) (not b!263085) (not bm!25148) (not b!263055) (not b!262950) (not d!62971) (not b!262924) (not b!262872) (not b!262953) (not d!62979) (not d!62947) (not b!263045) (not bm!25165) (not d!62957) (not bm!25153) (not b!263056) (not b!262963) (not b!262870) (not d!62987) (not b!263018) (not b!262973) (not b!262985) (not bm!25142) (not b!262967) (not b!263001) (not d!62991) (not b!262930) (not b!262925) (not bm!25154) (not b!262921) (not d!62985) (not bm!25164) (not b!263078) (not bm!25166) (not b!263034))
(check-sat b_and!13917 (not b_next!6793))
(get-model)

(declare-fun d!62995 () Bool)

(assert (=> d!62995 (= (validKeyInArray!0 (select (arr!5992 (_keys!7033 thiss!1504)) index!297)) (and (not (= (select (arr!5992 (_keys!7033 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5992 (_keys!7033 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262982 d!62995))

(declare-fun d!62997 () Bool)

(declare-fun e!170507 () Bool)

(assert (=> d!62997 e!170507))

(declare-fun res!128489 () Bool)

(assert (=> d!62997 (=> (not res!128489) (not e!170507))))

(declare-fun lt!133093 () ListLongMap!3823)

(assert (=> d!62997 (= res!128489 (contains!1889 lt!133093 (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun lt!133092 () List!3817)

(assert (=> d!62997 (= lt!133093 (ListLongMap!3824 lt!133092))))

(declare-fun lt!133095 () Unit!8136)

(declare-fun lt!133094 () Unit!8136)

(assert (=> d!62997 (= lt!133095 lt!133094)))

(assert (=> d!62997 (= (getValueByKey!318 lt!133092 (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) (Some!323 (_2!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!62997 (= lt!133094 (lemmaContainsTupThenGetReturnValue!177 lt!133092 (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!62997 (= lt!133092 (insertStrictlySorted!180 (toList!1927 (ite c!44831 call!25149 (ite c!44828 call!25151 call!25148))) (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!62997 (= (+!713 (ite c!44831 call!25149 (ite c!44828 call!25151 call!25148)) (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133093)))

(declare-fun b!263120 () Bool)

(declare-fun res!128488 () Bool)

(assert (=> b!263120 (=> (not res!128488) (not e!170507))))

(assert (=> b!263120 (= res!128488 (= (getValueByKey!318 (toList!1927 lt!133093) (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) (Some!323 (_2!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun b!263121 () Bool)

(assert (=> b!263121 (= e!170507 (contains!1893 (toList!1927 lt!133093) (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (= (and d!62997 res!128489) b!263120))

(assert (= (and b!263120 res!128488) b!263121))

(declare-fun m!278791 () Bool)

(assert (=> d!62997 m!278791))

(declare-fun m!278793 () Bool)

(assert (=> d!62997 m!278793))

(declare-fun m!278795 () Bool)

(assert (=> d!62997 m!278795))

(declare-fun m!278797 () Bool)

(assert (=> d!62997 m!278797))

(declare-fun m!278799 () Bool)

(assert (=> b!263120 m!278799))

(declare-fun m!278801 () Bool)

(assert (=> b!263121 m!278801))

(assert (=> bm!25143 d!62997))

(declare-fun b!263122 () Bool)

(declare-fun e!170509 () (_ BitVec 32))

(declare-fun call!25176 () (_ BitVec 32))

(assert (=> b!263122 (= e!170509 call!25176)))

(declare-fun bm!25173 () Bool)

(assert (=> bm!25173 (= call!25176 (arrayCountValidKeys!0 (_keys!7033 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun b!263123 () Bool)

(declare-fun e!170508 () (_ BitVec 32))

(assert (=> b!263123 (= e!170508 e!170509)))

(declare-fun c!44872 () Bool)

(assert (=> b!263123 (= c!44872 (validKeyInArray!0 (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263124 () Bool)

(assert (=> b!263124 (= e!170508 #b00000000000000000000000000000000)))

(declare-fun b!263125 () Bool)

(assert (=> b!263125 (= e!170509 (bvadd #b00000000000000000000000000000001 call!25176))))

(declare-fun d!62999 () Bool)

(declare-fun lt!133096 () (_ BitVec 32))

(assert (=> d!62999 (and (bvsge lt!133096 #b00000000000000000000000000000000) (bvsle lt!133096 (bvsub (size!6344 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!62999 (= lt!133096 e!170508)))

(declare-fun c!44871 () Bool)

(assert (=> d!62999 (= c!44871 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(assert (=> d!62999 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6344 (_keys!7033 thiss!1504)) (size!6344 (_keys!7033 thiss!1504))))))

(assert (=> d!62999 (= (arrayCountValidKeys!0 (_keys!7033 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))) lt!133096)))

(assert (= (and d!62999 c!44871) b!263124))

(assert (= (and d!62999 (not c!44871)) b!263123))

(assert (= (and b!263123 c!44872) b!263125))

(assert (= (and b!263123 (not c!44872)) b!263122))

(assert (= (or b!263125 b!263122) bm!25173))

(declare-fun m!278803 () Bool)

(assert (=> bm!25173 m!278803))

(declare-fun m!278805 () Bool)

(assert (=> b!263123 m!278805))

(assert (=> b!263123 m!278805))

(declare-fun m!278807 () Bool)

(assert (=> b!263123 m!278807))

(assert (=> bm!25166 d!62999))

(declare-fun d!63001 () Bool)

(assert (=> d!63001 (= (validKeyInArray!0 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)) (and (not (= (select (arr!5992 lt!132768) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5992 lt!132768) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262950 d!63001))

(declare-fun d!63003 () Bool)

(declare-fun e!170510 () Bool)

(assert (=> d!63003 e!170510))

(declare-fun res!128491 () Bool)

(assert (=> d!63003 (=> (not res!128491) (not e!170510))))

(declare-fun lt!133098 () ListLongMap!3823)

(assert (=> d!63003 (= res!128491 (contains!1889 lt!133098 (_1!2471 (tuple2!4921 key!932 v!346))))))

(declare-fun lt!133097 () List!3817)

(assert (=> d!63003 (= lt!133098 (ListLongMap!3824 lt!133097))))

(declare-fun lt!133100 () Unit!8136)

(declare-fun lt!133099 () Unit!8136)

(assert (=> d!63003 (= lt!133100 lt!133099)))

(assert (=> d!63003 (= (getValueByKey!318 lt!133097 (_1!2471 (tuple2!4921 key!932 v!346))) (Some!323 (_2!2471 (tuple2!4921 key!932 v!346))))))

(assert (=> d!63003 (= lt!133099 (lemmaContainsTupThenGetReturnValue!177 lt!133097 (_1!2471 (tuple2!4921 key!932 v!346)) (_2!2471 (tuple2!4921 key!932 v!346))))))

(assert (=> d!63003 (= lt!133097 (insertStrictlySorted!180 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (_1!2471 (tuple2!4921 key!932 v!346)) (_2!2471 (tuple2!4921 key!932 v!346))))))

(assert (=> d!63003 (= (+!713 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) (tuple2!4921 key!932 v!346)) lt!133098)))

(declare-fun b!263126 () Bool)

(declare-fun res!128490 () Bool)

(assert (=> b!263126 (=> (not res!128490) (not e!170510))))

(assert (=> b!263126 (= res!128490 (= (getValueByKey!318 (toList!1927 lt!133098) (_1!2471 (tuple2!4921 key!932 v!346))) (Some!323 (_2!2471 (tuple2!4921 key!932 v!346)))))))

(declare-fun b!263127 () Bool)

(assert (=> b!263127 (= e!170510 (contains!1893 (toList!1927 lt!133098) (tuple2!4921 key!932 v!346)))))

(assert (= (and d!63003 res!128491) b!263126))

(assert (= (and b!263126 res!128490) b!263127))

(declare-fun m!278809 () Bool)

(assert (=> d!63003 m!278809))

(declare-fun m!278811 () Bool)

(assert (=> d!63003 m!278811))

(declare-fun m!278813 () Bool)

(assert (=> d!63003 m!278813))

(declare-fun m!278815 () Bool)

(assert (=> d!63003 m!278815))

(declare-fun m!278817 () Bool)

(assert (=> b!263126 m!278817))

(declare-fun m!278819 () Bool)

(assert (=> b!263127 m!278819))

(assert (=> b!263037 d!63003))

(assert (=> b!263037 d!62935))

(declare-fun b!263128 () Bool)

(declare-fun e!170523 () Bool)

(declare-fun lt!133117 () ListLongMap!3823)

(assert (=> b!263128 (= e!170523 (= (apply!262 lt!133117 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4683 thiss!1504)))))

(declare-fun b!263129 () Bool)

(declare-fun res!128494 () Bool)

(declare-fun e!170522 () Bool)

(assert (=> b!263129 (=> (not res!128494) (not e!170522))))

(declare-fun e!170513 () Bool)

(assert (=> b!263129 (= res!128494 e!170513)))

(declare-fun res!128499 () Bool)

(assert (=> b!263129 (=> res!128499 e!170513)))

(declare-fun e!170515 () Bool)

(assert (=> b!263129 (= res!128499 (not e!170515))))

(declare-fun res!128496 () Bool)

(assert (=> b!263129 (=> (not res!128496) (not e!170515))))

(assert (=> b!263129 (= res!128496 (bvslt #b00000000000000000000000000000000 (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))))

(declare-fun b!263130 () Bool)

(declare-fun e!170516 () Bool)

(assert (=> b!263130 (= e!170513 e!170516)))

(declare-fun res!128492 () Bool)

(assert (=> b!263130 (=> (not res!128492) (not e!170516))))

(assert (=> b!263130 (= res!128492 (contains!1889 lt!133117 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!263130 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))))

(declare-fun d!63005 () Bool)

(assert (=> d!63005 e!170522))

(declare-fun res!128500 () Bool)

(assert (=> d!63005 (=> (not res!128500) (not e!170522))))

(assert (=> d!63005 (= res!128500 (or (bvsge #b00000000000000000000000000000000 (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))))))

(declare-fun lt!133102 () ListLongMap!3823)

(assert (=> d!63005 (= lt!133117 lt!133102)))

(declare-fun lt!133122 () Unit!8136)

(declare-fun e!170519 () Unit!8136)

(assert (=> d!63005 (= lt!133122 e!170519)))

(declare-fun c!44873 () Bool)

(declare-fun e!170512 () Bool)

(assert (=> d!63005 (= c!44873 e!170512)))

(declare-fun res!128493 () Bool)

(assert (=> d!63005 (=> (not res!128493) (not e!170512))))

(assert (=> d!63005 (= res!128493 (bvslt #b00000000000000000000000000000000 (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))))

(declare-fun e!170521 () ListLongMap!3823)

(assert (=> d!63005 (= lt!133102 e!170521)))

(declare-fun c!44878 () Bool)

(assert (=> d!63005 (= c!44878 (and (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!63005 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!63005 (= (getCurrentListMap!1436 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504))) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) lt!133117)))

(declare-fun b!263131 () Bool)

(declare-fun e!170520 () ListLongMap!3823)

(declare-fun call!25182 () ListLongMap!3823)

(assert (=> b!263131 (= e!170520 call!25182)))

(declare-fun b!263132 () Bool)

(declare-fun e!170518 () Bool)

(declare-fun call!25177 () Bool)

(assert (=> b!263132 (= e!170518 (not call!25177))))

(declare-fun b!263133 () Bool)

(declare-fun c!44876 () Bool)

(assert (=> b!263133 (= c!44876 (and (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!170514 () ListLongMap!3823)

(assert (=> b!263133 (= e!170520 e!170514)))

(declare-fun b!263134 () Bool)

(declare-fun e!170517 () Bool)

(assert (=> b!263134 (= e!170517 (= (apply!262 lt!133117 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4683 thiss!1504)))))

(declare-fun b!263135 () Bool)

(assert (=> b!263135 (= e!170522 e!170518)))

(declare-fun c!44874 () Bool)

(assert (=> b!263135 (= c!44874 (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!25174 () Bool)

(declare-fun call!25179 () Bool)

(assert (=> bm!25174 (= call!25179 (contains!1889 lt!133117 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263136 () Bool)

(assert (=> b!263136 (= e!170521 e!170520)))

(declare-fun c!44875 () Bool)

(assert (=> b!263136 (= c!44875 (and (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!263137 () Bool)

(assert (=> b!263137 (= e!170512 (validKeyInArray!0 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun call!25183 () ListLongMap!3823)

(declare-fun bm!25175 () Bool)

(declare-fun call!25181 () ListLongMap!3823)

(declare-fun call!25178 () ListLongMap!3823)

(declare-fun call!25180 () ListLongMap!3823)

(assert (=> bm!25175 (= call!25178 (+!713 (ite c!44878 call!25181 (ite c!44875 call!25183 call!25180)) (ite (or c!44878 c!44875) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!263138 () Bool)

(assert (=> b!263138 (= e!170521 (+!713 call!25178 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(declare-fun b!263139 () Bool)

(declare-fun e!170511 () Bool)

(assert (=> b!263139 (= e!170511 (not call!25179))))

(declare-fun bm!25176 () Bool)

(assert (=> bm!25176 (= call!25177 (contains!1889 lt!133117 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!25177 () Bool)

(assert (=> bm!25177 (= call!25183 call!25181)))

(declare-fun b!263140 () Bool)

(assert (=> b!263140 (= e!170518 e!170523)))

(declare-fun res!128495 () Bool)

(assert (=> b!263140 (= res!128495 call!25177)))

(assert (=> b!263140 (=> (not res!128495) (not e!170523))))

(declare-fun bm!25178 () Bool)

(assert (=> bm!25178 (= call!25180 call!25183)))

(declare-fun b!263141 () Bool)

(assert (=> b!263141 (= e!170514 call!25180)))

(declare-fun b!263142 () Bool)

(declare-fun lt!133119 () Unit!8136)

(assert (=> b!263142 (= e!170519 lt!133119)))

(declare-fun lt!133113 () ListLongMap!3823)

(assert (=> b!263142 (= lt!133113 (getCurrentListMapNoExtraKeys!578 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504))) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!133110 () (_ BitVec 64))

(assert (=> b!263142 (= lt!133110 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133106 () (_ BitVec 64))

(assert (=> b!263142 (= lt!133106 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!133103 () Unit!8136)

(assert (=> b!263142 (= lt!133103 (addStillContains!238 lt!133113 lt!133110 (zeroValue!4683 thiss!1504) lt!133106))))

(assert (=> b!263142 (contains!1889 (+!713 lt!133113 (tuple2!4921 lt!133110 (zeroValue!4683 thiss!1504))) lt!133106)))

(declare-fun lt!133112 () Unit!8136)

(assert (=> b!263142 (= lt!133112 lt!133103)))

(declare-fun lt!133109 () ListLongMap!3823)

(assert (=> b!263142 (= lt!133109 (getCurrentListMapNoExtraKeys!578 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504))) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!133104 () (_ BitVec 64))

(assert (=> b!263142 (= lt!133104 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133111 () (_ BitVec 64))

(assert (=> b!263142 (= lt!133111 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!133120 () Unit!8136)

(assert (=> b!263142 (= lt!133120 (addApplyDifferent!238 lt!133109 lt!133104 (minValue!4683 thiss!1504) lt!133111))))

(assert (=> b!263142 (= (apply!262 (+!713 lt!133109 (tuple2!4921 lt!133104 (minValue!4683 thiss!1504))) lt!133111) (apply!262 lt!133109 lt!133111))))

(declare-fun lt!133114 () Unit!8136)

(assert (=> b!263142 (= lt!133114 lt!133120)))

(declare-fun lt!133107 () ListLongMap!3823)

(assert (=> b!263142 (= lt!133107 (getCurrentListMapNoExtraKeys!578 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504))) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!133116 () (_ BitVec 64))

(assert (=> b!263142 (= lt!133116 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133108 () (_ BitVec 64))

(assert (=> b!263142 (= lt!133108 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!133101 () Unit!8136)

(assert (=> b!263142 (= lt!133101 (addApplyDifferent!238 lt!133107 lt!133116 (zeroValue!4683 thiss!1504) lt!133108))))

(assert (=> b!263142 (= (apply!262 (+!713 lt!133107 (tuple2!4921 lt!133116 (zeroValue!4683 thiss!1504))) lt!133108) (apply!262 lt!133107 lt!133108))))

(declare-fun lt!133118 () Unit!8136)

(assert (=> b!263142 (= lt!133118 lt!133101)))

(declare-fun lt!133115 () ListLongMap!3823)

(assert (=> b!263142 (= lt!133115 (getCurrentListMapNoExtraKeys!578 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504))) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!133121 () (_ BitVec 64))

(assert (=> b!263142 (= lt!133121 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133105 () (_ BitVec 64))

(assert (=> b!263142 (= lt!133105 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000))))

(assert (=> b!263142 (= lt!133119 (addApplyDifferent!238 lt!133115 lt!133121 (minValue!4683 thiss!1504) lt!133105))))

(assert (=> b!263142 (= (apply!262 (+!713 lt!133115 (tuple2!4921 lt!133121 (minValue!4683 thiss!1504))) lt!133105) (apply!262 lt!133115 lt!133105))))

(declare-fun b!263143 () Bool)

(assert (=> b!263143 (= e!170516 (= (apply!262 lt!133117 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)) (get!3087 (select (arr!5991 (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263143 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6343 (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504))))))))

(assert (=> b!263143 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))))

(declare-fun b!263144 () Bool)

(assert (=> b!263144 (= e!170514 call!25182)))

(declare-fun b!263145 () Bool)

(declare-fun Unit!8156 () Unit!8136)

(assert (=> b!263145 (= e!170519 Unit!8156)))

(declare-fun bm!25179 () Bool)

(assert (=> bm!25179 (= call!25182 call!25178)))

(declare-fun b!263146 () Bool)

(declare-fun res!128498 () Bool)

(assert (=> b!263146 (=> (not res!128498) (not e!170522))))

(assert (=> b!263146 (= res!128498 e!170511)))

(declare-fun c!44877 () Bool)

(assert (=> b!263146 (= c!44877 (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!263147 () Bool)

(assert (=> b!263147 (= e!170511 e!170517)))

(declare-fun res!128497 () Bool)

(assert (=> b!263147 (= res!128497 call!25179)))

(assert (=> b!263147 (=> (not res!128497) (not e!170517))))

(declare-fun bm!25180 () Bool)

(assert (=> bm!25180 (= call!25181 (getCurrentListMapNoExtraKeys!578 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504))) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun b!263148 () Bool)

(assert (=> b!263148 (= e!170515 (validKeyInArray!0 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!63005 c!44878) b!263138))

(assert (= (and d!63005 (not c!44878)) b!263136))

(assert (= (and b!263136 c!44875) b!263131))

(assert (= (and b!263136 (not c!44875)) b!263133))

(assert (= (and b!263133 c!44876) b!263144))

(assert (= (and b!263133 (not c!44876)) b!263141))

(assert (= (or b!263144 b!263141) bm!25178))

(assert (= (or b!263131 bm!25178) bm!25177))

(assert (= (or b!263131 b!263144) bm!25179))

(assert (= (or b!263138 bm!25177) bm!25180))

(assert (= (or b!263138 bm!25179) bm!25175))

(assert (= (and d!63005 res!128493) b!263137))

(assert (= (and d!63005 c!44873) b!263142))

(assert (= (and d!63005 (not c!44873)) b!263145))

(assert (= (and d!63005 res!128500) b!263129))

(assert (= (and b!263129 res!128496) b!263148))

(assert (= (and b!263129 (not res!128499)) b!263130))

(assert (= (and b!263130 res!128492) b!263143))

(assert (= (and b!263129 res!128494) b!263146))

(assert (= (and b!263146 c!44877) b!263147))

(assert (= (and b!263146 (not c!44877)) b!263139))

(assert (= (and b!263147 res!128497) b!263134))

(assert (= (or b!263147 b!263139) bm!25174))

(assert (= (and b!263146 res!128498) b!263135))

(assert (= (and b!263135 c!44874) b!263140))

(assert (= (and b!263135 (not c!44874)) b!263132))

(assert (= (and b!263140 res!128495) b!263128))

(assert (= (or b!263140 b!263132) bm!25176))

(declare-fun b_lambda!8321 () Bool)

(assert (=> (not b_lambda!8321) (not b!263143)))

(assert (=> b!263143 t!8892))

(declare-fun b_and!13919 () Bool)

(assert (= b_and!13917 (and (=> t!8892 result!5425) b_and!13919)))

(declare-fun m!278821 () Bool)

(assert (=> bm!25180 m!278821))

(declare-fun m!278823 () Bool)

(assert (=> b!263134 m!278823))

(declare-fun m!278825 () Bool)

(assert (=> b!263142 m!278825))

(declare-fun m!278827 () Bool)

(assert (=> b!263142 m!278827))

(declare-fun m!278829 () Bool)

(assert (=> b!263142 m!278829))

(declare-fun m!278831 () Bool)

(assert (=> b!263142 m!278831))

(declare-fun m!278833 () Bool)

(assert (=> b!263142 m!278833))

(declare-fun m!278835 () Bool)

(assert (=> b!263142 m!278835))

(declare-fun m!278837 () Bool)

(assert (=> b!263142 m!278837))

(declare-fun m!278839 () Bool)

(assert (=> b!263142 m!278839))

(assert (=> b!263142 m!278829))

(declare-fun m!278841 () Bool)

(assert (=> b!263142 m!278841))

(declare-fun m!278843 () Bool)

(assert (=> b!263142 m!278843))

(declare-fun m!278845 () Bool)

(assert (=> b!263142 m!278845))

(assert (=> b!263142 m!278821))

(assert (=> b!263142 m!278837))

(assert (=> b!263142 m!278843))

(declare-fun m!278847 () Bool)

(assert (=> b!263142 m!278847))

(assert (=> b!263142 m!278827))

(declare-fun m!278849 () Bool)

(assert (=> b!263142 m!278849))

(declare-fun m!278851 () Bool)

(assert (=> b!263142 m!278851))

(declare-fun m!278853 () Bool)

(assert (=> b!263142 m!278853))

(declare-fun m!278855 () Bool)

(assert (=> b!263142 m!278855))

(declare-fun m!278857 () Bool)

(assert (=> bm!25175 m!278857))

(assert (=> b!263143 m!278833))

(declare-fun m!278859 () Bool)

(assert (=> b!263143 m!278859))

(declare-fun m!278861 () Bool)

(assert (=> b!263143 m!278861))

(assert (=> b!263143 m!278569))

(declare-fun m!278863 () Bool)

(assert (=> b!263143 m!278863))

(assert (=> b!263143 m!278861))

(assert (=> b!263143 m!278569))

(assert (=> b!263143 m!278833))

(declare-fun m!278865 () Bool)

(assert (=> bm!25174 m!278865))

(declare-fun m!278867 () Bool)

(assert (=> b!263128 m!278867))

(declare-fun m!278869 () Bool)

(assert (=> b!263138 m!278869))

(assert (=> d!63005 m!278579))

(assert (=> b!263148 m!278833))

(assert (=> b!263148 m!278833))

(declare-fun m!278871 () Bool)

(assert (=> b!263148 m!278871))

(assert (=> b!263137 m!278833))

(assert (=> b!263137 m!278833))

(assert (=> b!263137 m!278871))

(assert (=> b!263130 m!278833))

(assert (=> b!263130 m!278833))

(declare-fun m!278873 () Bool)

(assert (=> b!263130 m!278873))

(declare-fun m!278875 () Bool)

(assert (=> bm!25176 m!278875))

(assert (=> b!263037 d!63005))

(assert (=> b!263020 d!63001))

(declare-fun d!63007 () Bool)

(declare-fun res!128505 () Bool)

(declare-fun e!170528 () Bool)

(assert (=> d!63007 (=> res!128505 e!170528)))

(assert (=> d!63007 (= res!128505 (and ((_ is Cons!3813) (toList!1927 lt!132763)) (= (_1!2471 (h!4479 (toList!1927 lt!132763))) key!932)))))

(assert (=> d!63007 (= (containsKey!310 (toList!1927 lt!132763) key!932) e!170528)))

(declare-fun b!263153 () Bool)

(declare-fun e!170529 () Bool)

(assert (=> b!263153 (= e!170528 e!170529)))

(declare-fun res!128506 () Bool)

(assert (=> b!263153 (=> (not res!128506) (not e!170529))))

(assert (=> b!263153 (= res!128506 (and (or (not ((_ is Cons!3813) (toList!1927 lt!132763))) (bvsle (_1!2471 (h!4479 (toList!1927 lt!132763))) key!932)) ((_ is Cons!3813) (toList!1927 lt!132763)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!132763))) key!932)))))

(declare-fun b!263154 () Bool)

(assert (=> b!263154 (= e!170529 (containsKey!310 (t!8885 (toList!1927 lt!132763)) key!932))))

(assert (= (and d!63007 (not res!128505)) b!263153))

(assert (= (and b!263153 res!128506) b!263154))

(declare-fun m!278877 () Bool)

(assert (=> b!263154 m!278877))

(assert (=> d!62933 d!63007))

(declare-fun d!63009 () Bool)

(declare-fun lt!133125 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!176 (List!3817) (InoxSet tuple2!4920))

(assert (=> d!63009 (= lt!133125 (select (content!176 (toList!1927 lt!133021)) lt!132765))))

(declare-fun e!170535 () Bool)

(assert (=> d!63009 (= lt!133125 e!170535)))

(declare-fun res!128512 () Bool)

(assert (=> d!63009 (=> (not res!128512) (not e!170535))))

(assert (=> d!63009 (= res!128512 ((_ is Cons!3813) (toList!1927 lt!133021)))))

(assert (=> d!63009 (= (contains!1893 (toList!1927 lt!133021) lt!132765) lt!133125)))

(declare-fun b!263159 () Bool)

(declare-fun e!170534 () Bool)

(assert (=> b!263159 (= e!170535 e!170534)))

(declare-fun res!128511 () Bool)

(assert (=> b!263159 (=> res!128511 e!170534)))

(assert (=> b!263159 (= res!128511 (= (h!4479 (toList!1927 lt!133021)) lt!132765))))

(declare-fun b!263160 () Bool)

(assert (=> b!263160 (= e!170534 (contains!1893 (t!8885 (toList!1927 lt!133021)) lt!132765))))

(assert (= (and d!63009 res!128512) b!263159))

(assert (= (and b!263159 (not res!128511)) b!263160))

(declare-fun m!278879 () Bool)

(assert (=> d!63009 m!278879))

(declare-fun m!278881 () Bool)

(assert (=> d!63009 m!278881))

(declare-fun m!278883 () Bool)

(assert (=> b!263160 m!278883))

(assert (=> b!262991 d!63009))

(declare-fun b!263170 () Bool)

(declare-fun res!128524 () Bool)

(declare-fun e!170538 () Bool)

(assert (=> b!263170 (=> (not res!128524) (not e!170538))))

(declare-fun size!6349 (LongMapFixedSize!3868) (_ BitVec 32))

(assert (=> b!263170 (= res!128524 (bvsge (size!6349 lt!132778) (_size!1983 lt!132778)))))

(declare-fun b!263171 () Bool)

(declare-fun res!128522 () Bool)

(assert (=> b!263171 (=> (not res!128522) (not e!170538))))

(assert (=> b!263171 (= res!128522 (= (size!6349 lt!132778) (bvadd (_size!1983 lt!132778) (bvsdiv (bvadd (extraKeys!4579 lt!132778) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!263169 () Bool)

(declare-fun res!128523 () Bool)

(assert (=> b!263169 (=> (not res!128523) (not e!170538))))

(assert (=> b!263169 (= res!128523 (and (= (size!6343 (_values!4825 lt!132778)) (bvadd (mask!11207 lt!132778) #b00000000000000000000000000000001)) (= (size!6344 (_keys!7033 lt!132778)) (size!6343 (_values!4825 lt!132778))) (bvsge (_size!1983 lt!132778) #b00000000000000000000000000000000) (bvsle (_size!1983 lt!132778) (bvadd (mask!11207 lt!132778) #b00000000000000000000000000000001))))))

(declare-fun d!63011 () Bool)

(declare-fun res!128521 () Bool)

(assert (=> d!63011 (=> (not res!128521) (not e!170538))))

(assert (=> d!63011 (= res!128521 (validMask!0 (mask!11207 lt!132778)))))

(assert (=> d!63011 (= (simpleValid!285 lt!132778) e!170538)))

(declare-fun b!263172 () Bool)

(assert (=> b!263172 (= e!170538 (and (bvsge (extraKeys!4579 lt!132778) #b00000000000000000000000000000000) (bvsle (extraKeys!4579 lt!132778) #b00000000000000000000000000000011) (bvsge (_vacant!1983 lt!132778) #b00000000000000000000000000000000)))))

(assert (= (and d!63011 res!128521) b!263169))

(assert (= (and b!263169 res!128523) b!263170))

(assert (= (and b!263170 res!128524) b!263171))

(assert (= (and b!263171 res!128522) b!263172))

(declare-fun m!278885 () Bool)

(assert (=> b!263170 m!278885))

(assert (=> b!263171 m!278885))

(declare-fun m!278887 () Bool)

(assert (=> d!63011 m!278887))

(assert (=> d!62975 d!63011))

(declare-fun d!63013 () Bool)

(assert (=> d!63013 (contains!1889 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) (select (arr!5992 lt!132768) index!297))))

(assert (=> d!63013 true))

(declare-fun _$16!169 () Unit!8136)

(assert (=> d!63013 (= (choose!1295 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) index!297 (defaultEntry!4842 thiss!1504)) _$16!169)))

(declare-fun bs!9226 () Bool)

(assert (= bs!9226 d!63013))

(assert (=> bs!9226 m!278321))

(assert (=> bs!9226 m!278671))

(assert (=> bs!9226 m!278321))

(assert (=> bs!9226 m!278671))

(assert (=> bs!9226 m!278685))

(assert (=> d!62955 d!63013))

(declare-fun d!63015 () Bool)

(assert (=> d!63015 (= (validMask!0 (mask!11207 thiss!1504)) (and (or (= (mask!11207 thiss!1504) #b00000000000000000000000000000111) (= (mask!11207 thiss!1504) #b00000000000000000000000000001111) (= (mask!11207 thiss!1504) #b00000000000000000000000000011111) (= (mask!11207 thiss!1504) #b00000000000000000000000000111111) (= (mask!11207 thiss!1504) #b00000000000000000000000001111111) (= (mask!11207 thiss!1504) #b00000000000000000000000011111111) (= (mask!11207 thiss!1504) #b00000000000000000000000111111111) (= (mask!11207 thiss!1504) #b00000000000000000000001111111111) (= (mask!11207 thiss!1504) #b00000000000000000000011111111111) (= (mask!11207 thiss!1504) #b00000000000000000000111111111111) (= (mask!11207 thiss!1504) #b00000000000000000001111111111111) (= (mask!11207 thiss!1504) #b00000000000000000011111111111111) (= (mask!11207 thiss!1504) #b00000000000000000111111111111111) (= (mask!11207 thiss!1504) #b00000000000000001111111111111111) (= (mask!11207 thiss!1504) #b00000000000000011111111111111111) (= (mask!11207 thiss!1504) #b00000000000000111111111111111111) (= (mask!11207 thiss!1504) #b00000000000001111111111111111111) (= (mask!11207 thiss!1504) #b00000000000011111111111111111111) (= (mask!11207 thiss!1504) #b00000000000111111111111111111111) (= (mask!11207 thiss!1504) #b00000000001111111111111111111111) (= (mask!11207 thiss!1504) #b00000000011111111111111111111111) (= (mask!11207 thiss!1504) #b00000000111111111111111111111111) (= (mask!11207 thiss!1504) #b00000001111111111111111111111111) (= (mask!11207 thiss!1504) #b00000011111111111111111111111111) (= (mask!11207 thiss!1504) #b00000111111111111111111111111111) (= (mask!11207 thiss!1504) #b00001111111111111111111111111111) (= (mask!11207 thiss!1504) #b00011111111111111111111111111111) (= (mask!11207 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11207 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> d!62955 d!63015))

(declare-fun b!263173 () Bool)

(declare-fun e!170541 () Bool)

(declare-fun e!170540 () Bool)

(assert (=> b!263173 (= e!170541 e!170540)))

(declare-fun lt!133126 () (_ BitVec 64))

(assert (=> b!263173 (= lt!133126 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000))))

(declare-fun lt!133127 () Unit!8136)

(assert (=> b!263173 (= lt!133127 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!7033 lt!132778) lt!133126 #b00000000000000000000000000000000))))

(assert (=> b!263173 (arrayContainsKey!0 (_keys!7033 lt!132778) lt!133126 #b00000000000000000000000000000000)))

(declare-fun lt!133128 () Unit!8136)

(assert (=> b!263173 (= lt!133128 lt!133127)))

(declare-fun res!128526 () Bool)

(assert (=> b!263173 (= res!128526 (= (seekEntryOrOpen!0 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000) (_keys!7033 lt!132778) (mask!11207 lt!132778)) (Found!1193 #b00000000000000000000000000000000)))))

(assert (=> b!263173 (=> (not res!128526) (not e!170540))))

(declare-fun d!63017 () Bool)

(declare-fun res!128525 () Bool)

(declare-fun e!170539 () Bool)

(assert (=> d!63017 (=> res!128525 e!170539)))

(assert (=> d!63017 (= res!128525 (bvsge #b00000000000000000000000000000000 (size!6344 (_keys!7033 lt!132778))))))

(assert (=> d!63017 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!7033 lt!132778) (mask!11207 lt!132778)) e!170539)))

(declare-fun b!263174 () Bool)

(declare-fun call!25184 () Bool)

(assert (=> b!263174 (= e!170540 call!25184)))

(declare-fun b!263175 () Bool)

(assert (=> b!263175 (= e!170539 e!170541)))

(declare-fun c!44879 () Bool)

(assert (=> b!263175 (= c!44879 (validKeyInArray!0 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)))))

(declare-fun b!263176 () Bool)

(assert (=> b!263176 (= e!170541 call!25184)))

(declare-fun bm!25181 () Bool)

(assert (=> bm!25181 (= call!25184 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!7033 lt!132778) (mask!11207 lt!132778)))))

(assert (= (and d!63017 (not res!128525)) b!263175))

(assert (= (and b!263175 c!44879) b!263173))

(assert (= (and b!263175 (not c!44879)) b!263176))

(assert (= (and b!263173 res!128526) b!263174))

(assert (= (or b!263174 b!263176) bm!25181))

(declare-fun m!278889 () Bool)

(assert (=> b!263173 m!278889))

(declare-fun m!278891 () Bool)

(assert (=> b!263173 m!278891))

(declare-fun m!278893 () Bool)

(assert (=> b!263173 m!278893))

(assert (=> b!263173 m!278889))

(declare-fun m!278895 () Bool)

(assert (=> b!263173 m!278895))

(assert (=> b!263175 m!278889))

(assert (=> b!263175 m!278889))

(declare-fun m!278897 () Bool)

(assert (=> b!263175 m!278897))

(declare-fun m!278899 () Bool)

(assert (=> bm!25181 m!278899))

(assert (=> b!263054 d!63017))

(declare-fun d!63019 () Bool)

(declare-fun e!170542 () Bool)

(assert (=> d!63019 e!170542))

(declare-fun res!128528 () Bool)

(assert (=> d!63019 (=> (not res!128528) (not e!170542))))

(declare-fun lt!133130 () ListLongMap!3823)

(assert (=> d!63019 (= res!128528 (contains!1889 lt!133130 (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun lt!133129 () List!3817)

(assert (=> d!63019 (= lt!133130 (ListLongMap!3824 lt!133129))))

(declare-fun lt!133132 () Unit!8136)

(declare-fun lt!133131 () Unit!8136)

(assert (=> d!63019 (= lt!133132 lt!133131)))

(assert (=> d!63019 (= (getValueByKey!318 lt!133129 (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) (Some!323 (_2!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63019 (= lt!133131 (lemmaContainsTupThenGetReturnValue!177 lt!133129 (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63019 (= lt!133129 (insertStrictlySorted!180 (toList!1927 (ite c!44840 call!25159 (ite c!44837 call!25161 call!25158))) (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63019 (= (+!713 (ite c!44840 call!25159 (ite c!44837 call!25161 call!25158)) (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133130)))

(declare-fun b!263177 () Bool)

(declare-fun res!128527 () Bool)

(assert (=> b!263177 (=> (not res!128527) (not e!170542))))

(assert (=> b!263177 (= res!128527 (= (getValueByKey!318 (toList!1927 lt!133130) (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) (Some!323 (_2!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun b!263178 () Bool)

(assert (=> b!263178 (= e!170542 (contains!1893 (toList!1927 lt!133130) (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63019 res!128528) b!263177))

(assert (= (and b!263177 res!128527) b!263178))

(declare-fun m!278901 () Bool)

(assert (=> d!63019 m!278901))

(declare-fun m!278903 () Bool)

(assert (=> d!63019 m!278903))

(declare-fun m!278905 () Bool)

(assert (=> d!63019 m!278905))

(declare-fun m!278907 () Bool)

(assert (=> d!63019 m!278907))

(declare-fun m!278909 () Bool)

(assert (=> b!263177 m!278909))

(declare-fun m!278911 () Bool)

(assert (=> b!263178 m!278911))

(assert (=> bm!25153 d!63019))

(declare-fun d!63021 () Bool)

(assert (=> d!63021 (= (+!713 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) (tuple2!4921 key!932 v!346)) (getCurrentListMap!1436 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504))) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(assert (=> d!63021 true))

(declare-fun _$3!67 () Unit!8136)

(assert (=> d!63021 (= (choose!1296 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) index!297 key!932 v!346 (defaultEntry!4842 thiss!1504)) _$3!67)))

(declare-fun bs!9227 () Bool)

(assert (= bs!9227 d!63021))

(assert (=> bs!9227 m!278293))

(assert (=> bs!9227 m!278705))

(assert (=> bs!9227 m!278293))

(assert (=> bs!9227 m!278707))

(assert (=> bs!9227 m!278319))

(assert (=> bs!9227 m!278327))

(assert (=> d!62969 d!63021))

(assert (=> d!62969 d!63015))

(declare-fun d!63023 () Bool)

(assert (=> d!63023 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132776) key!932))))

(declare-fun lt!133135 () Unit!8136)

(declare-fun choose!1300 (List!3817 (_ BitVec 64)) Unit!8136)

(assert (=> d!63023 (= lt!133135 (choose!1300 (toList!1927 lt!132776) key!932))))

(declare-fun e!170545 () Bool)

(assert (=> d!63023 e!170545))

(declare-fun res!128531 () Bool)

(assert (=> d!63023 (=> (not res!128531) (not e!170545))))

(declare-fun isStrictlySorted!372 (List!3817) Bool)

(assert (=> d!63023 (= res!128531 (isStrictlySorted!372 (toList!1927 lt!132776)))))

(assert (=> d!63023 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!132776) key!932) lt!133135)))

(declare-fun b!263181 () Bool)

(assert (=> b!263181 (= e!170545 (containsKey!310 (toList!1927 lt!132776) key!932))))

(assert (= (and d!63023 res!128531) b!263181))

(assert (=> d!63023 m!278775))

(assert (=> d!63023 m!278775))

(assert (=> d!63023 m!278777))

(declare-fun m!278913 () Bool)

(assert (=> d!63023 m!278913))

(declare-fun m!278915 () Bool)

(assert (=> d!63023 m!278915))

(assert (=> b!263181 m!278771))

(assert (=> b!263085 d!63023))

(declare-fun d!63025 () Bool)

(declare-fun isEmpty!544 (Option!324) Bool)

(assert (=> d!63025 (= (isDefined!260 (getValueByKey!318 (toList!1927 lt!132776) key!932)) (not (isEmpty!544 (getValueByKey!318 (toList!1927 lt!132776) key!932))))))

(declare-fun bs!9228 () Bool)

(assert (= bs!9228 d!63025))

(assert (=> bs!9228 m!278775))

(declare-fun m!278917 () Bool)

(assert (=> bs!9228 m!278917))

(assert (=> b!263085 d!63025))

(declare-fun b!263191 () Bool)

(declare-fun e!170550 () Option!324)

(declare-fun e!170551 () Option!324)

(assert (=> b!263191 (= e!170550 e!170551)))

(declare-fun c!44885 () Bool)

(assert (=> b!263191 (= c!44885 (and ((_ is Cons!3813) (toList!1927 lt!132776)) (not (= (_1!2471 (h!4479 (toList!1927 lt!132776))) key!932))))))

(declare-fun b!263193 () Bool)

(assert (=> b!263193 (= e!170551 None!322)))

(declare-fun d!63027 () Bool)

(declare-fun c!44884 () Bool)

(assert (=> d!63027 (= c!44884 (and ((_ is Cons!3813) (toList!1927 lt!132776)) (= (_1!2471 (h!4479 (toList!1927 lt!132776))) key!932)))))

(assert (=> d!63027 (= (getValueByKey!318 (toList!1927 lt!132776) key!932) e!170550)))

(declare-fun b!263190 () Bool)

(assert (=> b!263190 (= e!170550 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!132776)))))))

(declare-fun b!263192 () Bool)

(assert (=> b!263192 (= e!170551 (getValueByKey!318 (t!8885 (toList!1927 lt!132776)) key!932))))

(assert (= (and d!63027 c!44884) b!263190))

(assert (= (and d!63027 (not c!44884)) b!263191))

(assert (= (and b!263191 c!44885) b!263192))

(assert (= (and b!263191 (not c!44885)) b!263193))

(declare-fun m!278919 () Bool)

(assert (=> b!263192 m!278919))

(assert (=> b!263085 d!63027))

(declare-fun d!63029 () Bool)

(assert (=> d!63029 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132775) key!932))))

(declare-fun lt!133136 () Unit!8136)

(assert (=> d!63029 (= lt!133136 (choose!1300 (toList!1927 lt!132775) key!932))))

(declare-fun e!170552 () Bool)

(assert (=> d!63029 e!170552))

(declare-fun res!128532 () Bool)

(assert (=> d!63029 (=> (not res!128532) (not e!170552))))

(assert (=> d!63029 (= res!128532 (isStrictlySorted!372 (toList!1927 lt!132775)))))

(assert (=> d!63029 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!132775) key!932) lt!133136)))

(declare-fun b!263194 () Bool)

(assert (=> b!263194 (= e!170552 (containsKey!310 (toList!1927 lt!132775) key!932))))

(assert (= (and d!63029 res!128532) b!263194))

(assert (=> d!63029 m!278713))

(assert (=> d!63029 m!278713))

(assert (=> d!63029 m!278715))

(declare-fun m!278921 () Bool)

(assert (=> d!63029 m!278921))

(declare-fun m!278923 () Bool)

(assert (=> d!63029 m!278923))

(assert (=> b!263194 m!278709))

(assert (=> b!263038 d!63029))

(declare-fun d!63031 () Bool)

(assert (=> d!63031 (= (isDefined!260 (getValueByKey!318 (toList!1927 lt!132775) key!932)) (not (isEmpty!544 (getValueByKey!318 (toList!1927 lt!132775) key!932))))))

(declare-fun bs!9229 () Bool)

(assert (= bs!9229 d!63031))

(assert (=> bs!9229 m!278713))

(declare-fun m!278925 () Bool)

(assert (=> bs!9229 m!278925))

(assert (=> b!263038 d!63031))

(declare-fun b!263196 () Bool)

(declare-fun e!170553 () Option!324)

(declare-fun e!170554 () Option!324)

(assert (=> b!263196 (= e!170553 e!170554)))

(declare-fun c!44887 () Bool)

(assert (=> b!263196 (= c!44887 (and ((_ is Cons!3813) (toList!1927 lt!132775)) (not (= (_1!2471 (h!4479 (toList!1927 lt!132775))) key!932))))))

(declare-fun b!263198 () Bool)

(assert (=> b!263198 (= e!170554 None!322)))

(declare-fun d!63033 () Bool)

(declare-fun c!44886 () Bool)

(assert (=> d!63033 (= c!44886 (and ((_ is Cons!3813) (toList!1927 lt!132775)) (= (_1!2471 (h!4479 (toList!1927 lt!132775))) key!932)))))

(assert (=> d!63033 (= (getValueByKey!318 (toList!1927 lt!132775) key!932) e!170553)))

(declare-fun b!263195 () Bool)

(assert (=> b!263195 (= e!170553 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!132775)))))))

(declare-fun b!263197 () Bool)

(assert (=> b!263197 (= e!170554 (getValueByKey!318 (t!8885 (toList!1927 lt!132775)) key!932))))

(assert (= (and d!63033 c!44886) b!263195))

(assert (= (and d!63033 (not c!44886)) b!263196))

(assert (= (and b!263196 c!44887) b!263197))

(assert (= (and b!263196 (not c!44887)) b!263198))

(declare-fun m!278927 () Bool)

(assert (=> b!263197 m!278927))

(assert (=> b!263038 d!63033))

(declare-fun d!63035 () Bool)

(declare-fun lt!133139 () Bool)

(declare-fun content!177 (List!3818) (InoxSet (_ BitVec 64)))

(assert (=> d!63035 (= lt!133139 (select (content!177 Nil!3815) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(declare-fun e!170560 () Bool)

(assert (=> d!63035 (= lt!133139 e!170560)))

(declare-fun res!128538 () Bool)

(assert (=> d!63035 (=> (not res!128538) (not e!170560))))

(assert (=> d!63035 (= res!128538 ((_ is Cons!3814) Nil!3815))))

(assert (=> d!63035 (= (contains!1892 Nil!3815 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)) lt!133139)))

(declare-fun b!263203 () Bool)

(declare-fun e!170559 () Bool)

(assert (=> b!263203 (= e!170560 e!170559)))

(declare-fun res!128537 () Bool)

(assert (=> b!263203 (=> res!128537 e!170559)))

(assert (=> b!263203 (= res!128537 (= (h!4480 Nil!3815) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(declare-fun b!263204 () Bool)

(assert (=> b!263204 (= e!170559 (contains!1892 (t!8886 Nil!3815) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(assert (= (and d!63035 res!128538) b!263203))

(assert (= (and b!263203 (not res!128537)) b!263204))

(declare-fun m!278929 () Bool)

(assert (=> d!63035 m!278929))

(assert (=> d!63035 m!278587))

(declare-fun m!278931 () Bool)

(assert (=> d!63035 m!278931))

(assert (=> b!263204 m!278587))

(declare-fun m!278933 () Bool)

(assert (=> b!263204 m!278933))

(assert (=> b!262948 d!63035))

(assert (=> b!263087 d!63025))

(assert (=> b!263087 d!63027))

(assert (=> b!263040 d!63031))

(assert (=> b!263040 d!63033))

(declare-fun d!63037 () Bool)

(assert (=> d!63037 (= (validKeyInArray!0 (select (arr!5992 lt!132768) index!297)) (and (not (= (select (arr!5992 lt!132768) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5992 lt!132768) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263001 d!63037))

(declare-fun d!63039 () Bool)

(declare-fun e!170561 () Bool)

(assert (=> d!63039 e!170561))

(declare-fun res!128539 () Bool)

(assert (=> d!63039 (=> res!128539 e!170561)))

(declare-fun lt!133143 () Bool)

(assert (=> d!63039 (= res!128539 (not lt!133143))))

(declare-fun lt!133141 () Bool)

(assert (=> d!63039 (= lt!133143 lt!133141)))

(declare-fun lt!133140 () Unit!8136)

(declare-fun e!170562 () Unit!8136)

(assert (=> d!63039 (= lt!133140 e!170562)))

(declare-fun c!44888 () Bool)

(assert (=> d!63039 (= c!44888 lt!133141)))

(assert (=> d!63039 (= lt!133141 (containsKey!310 (toList!1927 lt!133003) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(assert (=> d!63039 (= (contains!1889 lt!133003 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)) lt!133143)))

(declare-fun b!263205 () Bool)

(declare-fun lt!133142 () Unit!8136)

(assert (=> b!263205 (= e!170562 lt!133142)))

(assert (=> b!263205 (= lt!133142 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133003) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(assert (=> b!263205 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133003) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(declare-fun b!263206 () Bool)

(declare-fun Unit!8157 () Unit!8136)

(assert (=> b!263206 (= e!170562 Unit!8157)))

(declare-fun b!263207 () Bool)

(assert (=> b!263207 (= e!170561 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133003) (select (arr!5992 lt!132768) #b00000000000000000000000000000000))))))

(assert (= (and d!63039 c!44888) b!263205))

(assert (= (and d!63039 (not c!44888)) b!263206))

(assert (= (and d!63039 (not res!128539)) b!263207))

(assert (=> d!63039 m!278587))

(declare-fun m!278935 () Bool)

(assert (=> d!63039 m!278935))

(assert (=> b!263205 m!278587))

(declare-fun m!278937 () Bool)

(assert (=> b!263205 m!278937))

(assert (=> b!263205 m!278587))

(declare-fun m!278939 () Bool)

(assert (=> b!263205 m!278939))

(assert (=> b!263205 m!278939))

(declare-fun m!278941 () Bool)

(assert (=> b!263205 m!278941))

(assert (=> b!263207 m!278587))

(assert (=> b!263207 m!278939))

(assert (=> b!263207 m!278939))

(assert (=> b!263207 m!278941))

(assert (=> b!262955 d!63039))

(declare-fun d!63041 () Bool)

(assert (=> d!63041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (mask!11207 thiss!1504))))

(assert (=> d!63041 true))

(declare-fun _$56!45 () Unit!8136)

(assert (=> d!63041 (= (choose!102 key!932 (_keys!7033 thiss!1504) index!297 (mask!11207 thiss!1504)) _$56!45)))

(declare-fun bs!9230 () Bool)

(assert (= bs!9230 d!63041))

(assert (=> bs!9230 m!278327))

(assert (=> bs!9230 m!278697))

(assert (=> d!62963 d!63041))

(assert (=> d!62963 d!63015))

(declare-fun d!63043 () Bool)

(declare-fun e!170563 () Bool)

(assert (=> d!63043 e!170563))

(declare-fun res!128540 () Bool)

(assert (=> d!63043 (=> res!128540 e!170563)))

(declare-fun lt!133147 () Bool)

(assert (=> d!63043 (= res!128540 (not lt!133147))))

(declare-fun lt!133145 () Bool)

(assert (=> d!63043 (= lt!133147 lt!133145)))

(declare-fun lt!133144 () Unit!8136)

(declare-fun e!170564 () Unit!8136)

(assert (=> d!63043 (= lt!133144 e!170564)))

(declare-fun c!44889 () Bool)

(assert (=> d!63043 (= c!44889 lt!133145)))

(assert (=> d!63043 (= lt!133145 (containsKey!310 (toList!1927 lt!132981) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!63043 (= (contains!1889 lt!132981 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)) lt!133147)))

(declare-fun b!263208 () Bool)

(declare-fun lt!133146 () Unit!8136)

(assert (=> b!263208 (= e!170564 lt!133146)))

(assert (=> b!263208 (= lt!133146 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!132981) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!263208 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132981) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263209 () Bool)

(declare-fun Unit!8158 () Unit!8136)

(assert (=> b!263209 (= e!170564 Unit!8158)))

(declare-fun b!263210 () Bool)

(assert (=> b!263210 (= e!170563 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132981) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!63043 c!44889) b!263208))

(assert (= (and d!63043 (not c!44889)) b!263209))

(assert (= (and d!63043 (not res!128540)) b!263210))

(assert (=> d!63043 m!278517))

(declare-fun m!278943 () Bool)

(assert (=> d!63043 m!278943))

(assert (=> b!263208 m!278517))

(declare-fun m!278945 () Bool)

(assert (=> b!263208 m!278945))

(assert (=> b!263208 m!278517))

(declare-fun m!278947 () Bool)

(assert (=> b!263208 m!278947))

(assert (=> b!263208 m!278947))

(declare-fun m!278949 () Bool)

(assert (=> b!263208 m!278949))

(assert (=> b!263210 m!278517))

(assert (=> b!263210 m!278947))

(assert (=> b!263210 m!278947))

(assert (=> b!263210 m!278949))

(assert (=> b!262917 d!63043))

(assert (=> b!263056 d!62965))

(assert (=> b!262973 d!63001))

(declare-fun b!263212 () Bool)

(declare-fun e!170568 () Bool)

(declare-fun call!25185 () Bool)

(assert (=> b!263212 (= e!170568 call!25185)))

(declare-fun b!263213 () Bool)

(declare-fun e!170567 () Bool)

(declare-fun e!170565 () Bool)

(assert (=> b!263213 (= e!170567 e!170565)))

(declare-fun res!128543 () Bool)

(assert (=> b!263213 (=> (not res!128543) (not e!170565))))

(declare-fun e!170566 () Bool)

(assert (=> b!263213 (= res!128543 (not e!170566))))

(declare-fun res!128542 () Bool)

(assert (=> b!263213 (=> (not res!128542) (not e!170566))))

(assert (=> b!263213 (= res!128542 (validKeyInArray!0 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!25182 () Bool)

(declare-fun c!44890 () Bool)

(assert (=> bm!25182 (= call!25185 (arrayNoDuplicates!0 (_keys!7033 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44890 (Cons!3814 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) Nil!3815) Nil!3815)))))

(declare-fun b!263214 () Bool)

(assert (=> b!263214 (= e!170568 call!25185)))

(declare-fun b!263215 () Bool)

(assert (=> b!263215 (= e!170565 e!170568)))

(assert (=> b!263215 (= c!44890 (validKeyInArray!0 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263211 () Bool)

(assert (=> b!263211 (= e!170566 (contains!1892 Nil!3815 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!63045 () Bool)

(declare-fun res!128541 () Bool)

(assert (=> d!63045 (=> res!128541 e!170567)))

(assert (=> d!63045 (= res!128541 (bvsge #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))))))

(assert (=> d!63045 (= (arrayNoDuplicates!0 (_keys!7033 thiss!1504) #b00000000000000000000000000000000 Nil!3815) e!170567)))

(assert (= (and d!63045 (not res!128541)) b!263213))

(assert (= (and b!263213 res!128542) b!263211))

(assert (= (and b!263213 res!128543) b!263215))

(assert (= (and b!263215 c!44890) b!263214))

(assert (= (and b!263215 (not c!44890)) b!263212))

(assert (= (or b!263214 b!263212) bm!25182))

(assert (=> b!263213 m!278517))

(assert (=> b!263213 m!278517))

(assert (=> b!263213 m!278581))

(assert (=> bm!25182 m!278517))

(declare-fun m!278951 () Bool)

(assert (=> bm!25182 m!278951))

(assert (=> b!263215 m!278517))

(assert (=> b!263215 m!278517))

(assert (=> b!263215 m!278581))

(assert (=> b!263211 m!278517))

(assert (=> b!263211 m!278517))

(declare-fun m!278953 () Bool)

(assert (=> b!263211 m!278953))

(assert (=> b!263058 d!63045))

(declare-fun d!63047 () Bool)

(declare-fun lt!133148 () Bool)

(assert (=> d!63047 (= lt!133148 (select (content!176 (toList!1927 lt!133073)) lt!132765))))

(declare-fun e!170570 () Bool)

(assert (=> d!63047 (= lt!133148 e!170570)))

(declare-fun res!128545 () Bool)

(assert (=> d!63047 (=> (not res!128545) (not e!170570))))

(assert (=> d!63047 (= res!128545 ((_ is Cons!3813) (toList!1927 lt!133073)))))

(assert (=> d!63047 (= (contains!1893 (toList!1927 lt!133073) lt!132765) lt!133148)))

(declare-fun b!263216 () Bool)

(declare-fun e!170569 () Bool)

(assert (=> b!263216 (= e!170570 e!170569)))

(declare-fun res!128544 () Bool)

(assert (=> b!263216 (=> res!128544 e!170569)))

(assert (=> b!263216 (= res!128544 (= (h!4479 (toList!1927 lt!133073)) lt!132765))))

(declare-fun b!263217 () Bool)

(assert (=> b!263217 (= e!170569 (contains!1893 (t!8885 (toList!1927 lt!133073)) lt!132765))))

(assert (= (and d!63047 res!128545) b!263216))

(assert (= (and b!263216 (not res!128544)) b!263217))

(declare-fun m!278955 () Bool)

(assert (=> d!63047 m!278955))

(declare-fun m!278957 () Bool)

(assert (=> d!63047 m!278957))

(declare-fun m!278959 () Bool)

(assert (=> b!263217 m!278959))

(assert (=> b!263078 d!63047))

(declare-fun d!63049 () Bool)

(declare-fun get!3088 (Option!324) V!8521)

(assert (=> d!63049 (= (apply!262 lt!133003 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3088 (getValueByKey!318 (toList!1927 lt!133003) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9231 () Bool)

(assert (= bs!9231 d!63049))

(declare-fun m!278961 () Bool)

(assert (=> bs!9231 m!278961))

(assert (=> bs!9231 m!278961))

(declare-fun m!278963 () Bool)

(assert (=> bs!9231 m!278963))

(assert (=> b!262959 d!63049))

(declare-fun d!63051 () Bool)

(assert (=> d!63051 (= (apply!262 (+!713 lt!132995 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))) lt!132997) (apply!262 lt!132995 lt!132997))))

(declare-fun lt!133151 () Unit!8136)

(declare-fun choose!1301 (ListLongMap!3823 (_ BitVec 64) V!8521 (_ BitVec 64)) Unit!8136)

(assert (=> d!63051 (= lt!133151 (choose!1301 lt!132995 lt!132990 (minValue!4683 thiss!1504) lt!132997))))

(declare-fun e!170573 () Bool)

(assert (=> d!63051 e!170573))

(declare-fun res!128548 () Bool)

(assert (=> d!63051 (=> (not res!128548) (not e!170573))))

(assert (=> d!63051 (= res!128548 (contains!1889 lt!132995 lt!132997))))

(assert (=> d!63051 (= (addApplyDifferent!238 lt!132995 lt!132990 (minValue!4683 thiss!1504) lt!132997) lt!133151)))

(declare-fun b!263221 () Bool)

(assert (=> b!263221 (= e!170573 (not (= lt!132997 lt!132990)))))

(assert (= (and d!63051 res!128548) b!263221))

(assert (=> d!63051 m!278601))

(assert (=> d!63051 m!278601))

(assert (=> d!63051 m!278621))

(declare-fun m!278965 () Bool)

(assert (=> d!63051 m!278965))

(assert (=> d!63051 m!278625))

(declare-fun m!278967 () Bool)

(assert (=> d!63051 m!278967))

(assert (=> b!262967 d!63051))

(declare-fun d!63053 () Bool)

(assert (=> d!63053 (= (apply!262 lt!132995 lt!132997) (get!3088 (getValueByKey!318 (toList!1927 lt!132995) lt!132997)))))

(declare-fun bs!9232 () Bool)

(assert (= bs!9232 d!63053))

(declare-fun m!278969 () Bool)

(assert (=> bs!9232 m!278969))

(assert (=> bs!9232 m!278969))

(declare-fun m!278971 () Bool)

(assert (=> bs!9232 m!278971))

(assert (=> b!262967 d!63053))

(declare-fun d!63055 () Bool)

(assert (=> d!63055 (= (apply!262 (+!713 lt!132993 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))) lt!132994) (apply!262 lt!132993 lt!132994))))

(declare-fun lt!133152 () Unit!8136)

(assert (=> d!63055 (= lt!133152 (choose!1301 lt!132993 lt!133002 (zeroValue!4683 thiss!1504) lt!132994))))

(declare-fun e!170574 () Bool)

(assert (=> d!63055 e!170574))

(declare-fun res!128549 () Bool)

(assert (=> d!63055 (=> (not res!128549) (not e!170574))))

(assert (=> d!63055 (= res!128549 (contains!1889 lt!132993 lt!132994))))

(assert (=> d!63055 (= (addApplyDifferent!238 lt!132993 lt!133002 (zeroValue!4683 thiss!1504) lt!132994) lt!133152)))

(declare-fun b!263222 () Bool)

(assert (=> b!263222 (= e!170574 (not (= lt!132994 lt!133002)))))

(assert (= (and d!63055 res!128549) b!263222))

(assert (=> d!63055 m!278609))

(assert (=> d!63055 m!278609))

(assert (=> d!63055 m!278611))

(declare-fun m!278973 () Bool)

(assert (=> d!63055 m!278973))

(assert (=> d!63055 m!278623))

(declare-fun m!278975 () Bool)

(assert (=> d!63055 m!278975))

(assert (=> b!262967 d!63055))

(declare-fun d!63057 () Bool)

(assert (=> d!63057 (= (apply!262 (+!713 lt!133001 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))) lt!132991) (get!3088 (getValueByKey!318 (toList!1927 (+!713 lt!133001 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))) lt!132991)))))

(declare-fun bs!9233 () Bool)

(assert (= bs!9233 d!63057))

(declare-fun m!278977 () Bool)

(assert (=> bs!9233 m!278977))

(assert (=> bs!9233 m!278977))

(declare-fun m!278979 () Bool)

(assert (=> bs!9233 m!278979))

(assert (=> b!262967 d!63057))

(declare-fun d!63059 () Bool)

(assert (=> d!63059 (= (apply!262 (+!713 lt!132995 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))) lt!132997) (get!3088 (getValueByKey!318 (toList!1927 (+!713 lt!132995 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))) lt!132997)))))

(declare-fun bs!9234 () Bool)

(assert (= bs!9234 d!63059))

(declare-fun m!278981 () Bool)

(assert (=> bs!9234 m!278981))

(assert (=> bs!9234 m!278981))

(declare-fun m!278983 () Bool)

(assert (=> bs!9234 m!278983))

(assert (=> b!262967 d!63059))

(declare-fun d!63061 () Bool)

(declare-fun e!170575 () Bool)

(assert (=> d!63061 e!170575))

(declare-fun res!128551 () Bool)

(assert (=> d!63061 (=> (not res!128551) (not e!170575))))

(declare-fun lt!133154 () ListLongMap!3823)

(assert (=> d!63061 (= res!128551 (contains!1889 lt!133154 (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133153 () List!3817)

(assert (=> d!63061 (= lt!133154 (ListLongMap!3824 lt!133153))))

(declare-fun lt!133156 () Unit!8136)

(declare-fun lt!133155 () Unit!8136)

(assert (=> d!63061 (= lt!133156 lt!133155)))

(assert (=> d!63061 (= (getValueByKey!318 lt!133153 (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63061 (= lt!133155 (lemmaContainsTupThenGetReturnValue!177 lt!133153 (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63061 (= lt!133153 (insertStrictlySorted!180 (toList!1927 lt!132999) (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63061 (= (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))) lt!133154)))

(declare-fun b!263223 () Bool)

(declare-fun res!128550 () Bool)

(assert (=> b!263223 (=> (not res!128550) (not e!170575))))

(assert (=> b!263223 (= res!128550 (= (getValueByKey!318 (toList!1927 lt!133154) (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!263224 () Bool)

(assert (=> b!263224 (= e!170575 (contains!1893 (toList!1927 lt!133154) (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!63061 res!128551) b!263223))

(assert (= (and b!263223 res!128550) b!263224))

(declare-fun m!278985 () Bool)

(assert (=> d!63061 m!278985))

(declare-fun m!278987 () Bool)

(assert (=> d!63061 m!278987))

(declare-fun m!278989 () Bool)

(assert (=> d!63061 m!278989))

(declare-fun m!278991 () Bool)

(assert (=> d!63061 m!278991))

(declare-fun m!278993 () Bool)

(assert (=> b!263223 m!278993))

(declare-fun m!278995 () Bool)

(assert (=> b!263224 m!278995))

(assert (=> b!262967 d!63061))

(declare-fun d!63063 () Bool)

(assert (=> d!63063 (contains!1889 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))) lt!132992)))

(declare-fun lt!133159 () Unit!8136)

(declare-fun choose!1302 (ListLongMap!3823 (_ BitVec 64) V!8521 (_ BitVec 64)) Unit!8136)

(assert (=> d!63063 (= lt!133159 (choose!1302 lt!132999 lt!132996 (zeroValue!4683 thiss!1504) lt!132992))))

(assert (=> d!63063 (contains!1889 lt!132999 lt!132992)))

(assert (=> d!63063 (= (addStillContains!238 lt!132999 lt!132996 (zeroValue!4683 thiss!1504) lt!132992) lt!133159)))

(declare-fun bs!9235 () Bool)

(assert (= bs!9235 d!63063))

(assert (=> bs!9235 m!278603))

(assert (=> bs!9235 m!278603))

(assert (=> bs!9235 m!278613))

(declare-fun m!278997 () Bool)

(assert (=> bs!9235 m!278997))

(declare-fun m!278999 () Bool)

(assert (=> bs!9235 m!278999))

(assert (=> b!262967 d!63063))

(declare-fun d!63065 () Bool)

(assert (=> d!63065 (= (apply!262 (+!713 lt!132993 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))) lt!132994) (get!3088 (getValueByKey!318 (toList!1927 (+!713 lt!132993 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))) lt!132994)))))

(declare-fun bs!9236 () Bool)

(assert (= bs!9236 d!63065))

(declare-fun m!279001 () Bool)

(assert (=> bs!9236 m!279001))

(assert (=> bs!9236 m!279001))

(declare-fun m!279003 () Bool)

(assert (=> bs!9236 m!279003))

(assert (=> b!262967 d!63065))

(declare-fun d!63067 () Bool)

(declare-fun e!170576 () Bool)

(assert (=> d!63067 e!170576))

(declare-fun res!128553 () Bool)

(assert (=> d!63067 (=> (not res!128553) (not e!170576))))

(declare-fun lt!133161 () ListLongMap!3823)

(assert (=> d!63067 (= res!128553 (contains!1889 lt!133161 (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133160 () List!3817)

(assert (=> d!63067 (= lt!133161 (ListLongMap!3824 lt!133160))))

(declare-fun lt!133163 () Unit!8136)

(declare-fun lt!133162 () Unit!8136)

(assert (=> d!63067 (= lt!133163 lt!133162)))

(assert (=> d!63067 (= (getValueByKey!318 lt!133160 (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))))))

(assert (=> d!63067 (= lt!133162 (lemmaContainsTupThenGetReturnValue!177 lt!133160 (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))))))

(assert (=> d!63067 (= lt!133160 (insertStrictlySorted!180 (toList!1927 lt!132995) (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))))))

(assert (=> d!63067 (= (+!713 lt!132995 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))) lt!133161)))

(declare-fun b!263226 () Bool)

(declare-fun res!128552 () Bool)

(assert (=> b!263226 (=> (not res!128552) (not e!170576))))

(assert (=> b!263226 (= res!128552 (= (getValueByKey!318 (toList!1927 lt!133161) (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))))))))

(declare-fun b!263227 () Bool)

(assert (=> b!263227 (= e!170576 (contains!1893 (toList!1927 lt!133161) (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))))))

(assert (= (and d!63067 res!128553) b!263226))

(assert (= (and b!263226 res!128552) b!263227))

(declare-fun m!279005 () Bool)

(assert (=> d!63067 m!279005))

(declare-fun m!279007 () Bool)

(assert (=> d!63067 m!279007))

(declare-fun m!279009 () Bool)

(assert (=> d!63067 m!279009))

(declare-fun m!279011 () Bool)

(assert (=> d!63067 m!279011))

(declare-fun m!279013 () Bool)

(assert (=> b!263226 m!279013))

(declare-fun m!279015 () Bool)

(assert (=> b!263227 m!279015))

(assert (=> b!262967 d!63067))

(declare-fun d!63069 () Bool)

(assert (=> d!63069 (= (apply!262 lt!132993 lt!132994) (get!3088 (getValueByKey!318 (toList!1927 lt!132993) lt!132994)))))

(declare-fun bs!9237 () Bool)

(assert (= bs!9237 d!63069))

(declare-fun m!279017 () Bool)

(assert (=> bs!9237 m!279017))

(assert (=> bs!9237 m!279017))

(declare-fun m!279019 () Bool)

(assert (=> bs!9237 m!279019))

(assert (=> b!262967 d!63069))

(declare-fun d!63071 () Bool)

(assert (=> d!63071 (= (apply!262 lt!133001 lt!132991) (get!3088 (getValueByKey!318 (toList!1927 lt!133001) lt!132991)))))

(declare-fun bs!9238 () Bool)

(assert (= bs!9238 d!63071))

(declare-fun m!279021 () Bool)

(assert (=> bs!9238 m!279021))

(assert (=> bs!9238 m!279021))

(declare-fun m!279023 () Bool)

(assert (=> bs!9238 m!279023))

(assert (=> b!262967 d!63071))

(declare-fun d!63073 () Bool)

(declare-fun e!170577 () Bool)

(assert (=> d!63073 e!170577))

(declare-fun res!128554 () Bool)

(assert (=> d!63073 (=> res!128554 e!170577)))

(declare-fun lt!133167 () Bool)

(assert (=> d!63073 (= res!128554 (not lt!133167))))

(declare-fun lt!133165 () Bool)

(assert (=> d!63073 (= lt!133167 lt!133165)))

(declare-fun lt!133164 () Unit!8136)

(declare-fun e!170578 () Unit!8136)

(assert (=> d!63073 (= lt!133164 e!170578)))

(declare-fun c!44891 () Bool)

(assert (=> d!63073 (= c!44891 lt!133165)))

(assert (=> d!63073 (= lt!133165 (containsKey!310 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) lt!132992))))

(assert (=> d!63073 (= (contains!1889 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))) lt!132992) lt!133167)))

(declare-fun b!263228 () Bool)

(declare-fun lt!133166 () Unit!8136)

(assert (=> b!263228 (= e!170578 lt!133166)))

(assert (=> b!263228 (= lt!133166 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) lt!132992))))

(assert (=> b!263228 (isDefined!260 (getValueByKey!318 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) lt!132992))))

(declare-fun b!263229 () Bool)

(declare-fun Unit!8159 () Unit!8136)

(assert (=> b!263229 (= e!170578 Unit!8159)))

(declare-fun b!263230 () Bool)

(assert (=> b!263230 (= e!170577 (isDefined!260 (getValueByKey!318 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) lt!132992)))))

(assert (= (and d!63073 c!44891) b!263228))

(assert (= (and d!63073 (not c!44891)) b!263229))

(assert (= (and d!63073 (not res!128554)) b!263230))

(declare-fun m!279025 () Bool)

(assert (=> d!63073 m!279025))

(declare-fun m!279027 () Bool)

(assert (=> b!263228 m!279027))

(declare-fun m!279029 () Bool)

(assert (=> b!263228 m!279029))

(assert (=> b!263228 m!279029))

(declare-fun m!279031 () Bool)

(assert (=> b!263228 m!279031))

(assert (=> b!263230 m!279029))

(assert (=> b!263230 m!279029))

(assert (=> b!263230 m!279031))

(assert (=> b!262967 d!63073))

(declare-fun d!63075 () Bool)

(declare-fun e!170579 () Bool)

(assert (=> d!63075 e!170579))

(declare-fun res!128556 () Bool)

(assert (=> d!63075 (=> (not res!128556) (not e!170579))))

(declare-fun lt!133169 () ListLongMap!3823)

(assert (=> d!63075 (= res!128556 (contains!1889 lt!133169 (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133168 () List!3817)

(assert (=> d!63075 (= lt!133169 (ListLongMap!3824 lt!133168))))

(declare-fun lt!133171 () Unit!8136)

(declare-fun lt!133170 () Unit!8136)

(assert (=> d!63075 (= lt!133171 lt!133170)))

(assert (=> d!63075 (= (getValueByKey!318 lt!133168 (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63075 (= lt!133170 (lemmaContainsTupThenGetReturnValue!177 lt!133168 (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63075 (= lt!133168 (insertStrictlySorted!180 (toList!1927 lt!132993) (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63075 (= (+!713 lt!132993 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))) lt!133169)))

(declare-fun b!263231 () Bool)

(declare-fun res!128555 () Bool)

(assert (=> b!263231 (=> (not res!128555) (not e!170579))))

(assert (=> b!263231 (= res!128555 (= (getValueByKey!318 (toList!1927 lt!133169) (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!263232 () Bool)

(assert (=> b!263232 (= e!170579 (contains!1893 (toList!1927 lt!133169) (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!63075 res!128556) b!263231))

(assert (= (and b!263231 res!128555) b!263232))

(declare-fun m!279033 () Bool)

(assert (=> d!63075 m!279033))

(declare-fun m!279035 () Bool)

(assert (=> d!63075 m!279035))

(declare-fun m!279037 () Bool)

(assert (=> d!63075 m!279037))

(declare-fun m!279039 () Bool)

(assert (=> d!63075 m!279039))

(declare-fun m!279041 () Bool)

(assert (=> b!263231 m!279041))

(declare-fun m!279043 () Bool)

(assert (=> b!263232 m!279043))

(assert (=> b!262967 d!63075))

(declare-fun b!263257 () Bool)

(declare-fun e!170599 () Bool)

(declare-fun e!170597 () Bool)

(assert (=> b!263257 (= e!170599 e!170597)))

(assert (=> b!263257 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 lt!132768)))))

(declare-fun res!128566 () Bool)

(declare-fun lt!133188 () ListLongMap!3823)

(assert (=> b!263257 (= res!128566 (contains!1889 lt!133188 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(assert (=> b!263257 (=> (not res!128566) (not e!170597))))

(declare-fun b!263258 () Bool)

(declare-fun e!170594 () Bool)

(assert (=> b!263258 (= e!170594 (= lt!133188 (getCurrentListMapNoExtraKeys!578 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504))))))

(declare-fun b!263259 () Bool)

(assert (=> b!263259 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 lt!132768)))))

(assert (=> b!263259 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6343 lt!132766)))))

(assert (=> b!263259 (= e!170597 (= (apply!262 lt!133188 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)) (get!3087 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!263260 () Bool)

(declare-fun e!170596 () ListLongMap!3823)

(assert (=> b!263260 (= e!170596 (ListLongMap!3824 Nil!3814))))

(declare-fun b!263261 () Bool)

(declare-fun isEmpty!545 (ListLongMap!3823) Bool)

(assert (=> b!263261 (= e!170594 (isEmpty!545 lt!133188))))

(declare-fun b!263262 () Bool)

(assert (=> b!263262 (= e!170599 e!170594)))

(declare-fun c!44902 () Bool)

(assert (=> b!263262 (= c!44902 (bvslt #b00000000000000000000000000000000 (size!6344 lt!132768)))))

(declare-fun b!263263 () Bool)

(declare-fun res!128565 () Bool)

(declare-fun e!170600 () Bool)

(assert (=> b!263263 (=> (not res!128565) (not e!170600))))

(assert (=> b!263263 (= res!128565 (not (contains!1889 lt!133188 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263264 () Bool)

(declare-fun lt!133192 () Unit!8136)

(declare-fun lt!133190 () Unit!8136)

(assert (=> b!263264 (= lt!133192 lt!133190)))

(declare-fun lt!133191 () (_ BitVec 64))

(declare-fun lt!133186 () V!8521)

(declare-fun lt!133187 () ListLongMap!3823)

(declare-fun lt!133189 () (_ BitVec 64))

(assert (=> b!263264 (not (contains!1889 (+!713 lt!133187 (tuple2!4921 lt!133191 lt!133186)) lt!133189))))

(declare-fun addStillNotContains!130 (ListLongMap!3823 (_ BitVec 64) V!8521 (_ BitVec 64)) Unit!8136)

(assert (=> b!263264 (= lt!133190 (addStillNotContains!130 lt!133187 lt!133191 lt!133186 lt!133189))))

(assert (=> b!263264 (= lt!133189 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!263264 (= lt!133186 (get!3087 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!263264 (= lt!133191 (select (arr!5992 lt!132768) #b00000000000000000000000000000000))))

(declare-fun call!25188 () ListLongMap!3823)

(assert (=> b!263264 (= lt!133187 call!25188)))

(declare-fun e!170595 () ListLongMap!3823)

(assert (=> b!263264 (= e!170595 (+!713 call!25188 (tuple2!4921 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!25185 () Bool)

(assert (=> bm!25185 (= call!25188 (getCurrentListMapNoExtraKeys!578 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504)))))

(declare-fun b!263265 () Bool)

(assert (=> b!263265 (= e!170600 e!170599)))

(declare-fun c!44901 () Bool)

(declare-fun e!170598 () Bool)

(assert (=> b!263265 (= c!44901 e!170598)))

(declare-fun res!128567 () Bool)

(assert (=> b!263265 (=> (not res!128567) (not e!170598))))

(assert (=> b!263265 (= res!128567 (bvslt #b00000000000000000000000000000000 (size!6344 lt!132768)))))

(declare-fun b!263266 () Bool)

(assert (=> b!263266 (= e!170598 (validKeyInArray!0 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(assert (=> b!263266 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!263267 () Bool)

(assert (=> b!263267 (= e!170595 call!25188)))

(declare-fun d!63077 () Bool)

(assert (=> d!63077 e!170600))

(declare-fun res!128568 () Bool)

(assert (=> d!63077 (=> (not res!128568) (not e!170600))))

(assert (=> d!63077 (= res!128568 (not (contains!1889 lt!133188 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63077 (= lt!133188 e!170596)))

(declare-fun c!44900 () Bool)

(assert (=> d!63077 (= c!44900 (bvsge #b00000000000000000000000000000000 (size!6344 lt!132768)))))

(assert (=> d!63077 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!63077 (= (getCurrentListMapNoExtraKeys!578 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) lt!133188)))

(declare-fun b!263268 () Bool)

(assert (=> b!263268 (= e!170596 e!170595)))

(declare-fun c!44903 () Bool)

(assert (=> b!263268 (= c!44903 (validKeyInArray!0 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(assert (= (and d!63077 c!44900) b!263260))

(assert (= (and d!63077 (not c!44900)) b!263268))

(assert (= (and b!263268 c!44903) b!263264))

(assert (= (and b!263268 (not c!44903)) b!263267))

(assert (= (or b!263264 b!263267) bm!25185))

(assert (= (and d!63077 res!128568) b!263263))

(assert (= (and b!263263 res!128565) b!263265))

(assert (= (and b!263265 res!128567) b!263266))

(assert (= (and b!263265 c!44901) b!263257))

(assert (= (and b!263265 (not c!44901)) b!263262))

(assert (= (and b!263257 res!128566) b!263259))

(assert (= (and b!263262 c!44902) b!263258))

(assert (= (and b!263262 (not c!44902)) b!263261))

(declare-fun b_lambda!8323 () Bool)

(assert (=> (not b_lambda!8323) (not b!263259)))

(assert (=> b!263259 t!8892))

(declare-fun b_and!13921 () Bool)

(assert (= b_and!13919 (and (=> t!8892 result!5425) b_and!13921)))

(declare-fun b_lambda!8325 () Bool)

(assert (=> (not b_lambda!8325) (not b!263264)))

(assert (=> b!263264 t!8892))

(declare-fun b_and!13923 () Bool)

(assert (= b_and!13921 (and (=> t!8892 result!5425) b_and!13923)))

(assert (=> b!263268 m!278587))

(assert (=> b!263268 m!278587))

(assert (=> b!263268 m!278589))

(assert (=> b!263259 m!278587))

(declare-fun m!279045 () Bool)

(assert (=> b!263259 m!279045))

(assert (=> b!263259 m!278569))

(assert (=> b!263259 m!278587))

(assert (=> b!263259 m!278633))

(assert (=> b!263259 m!278569))

(assert (=> b!263259 m!278635))

(assert (=> b!263259 m!278633))

(declare-fun m!279047 () Bool)

(assert (=> b!263258 m!279047))

(assert (=> b!263266 m!278587))

(assert (=> b!263266 m!278587))

(assert (=> b!263266 m!278589))

(declare-fun m!279049 () Bool)

(assert (=> b!263263 m!279049))

(assert (=> bm!25185 m!279047))

(declare-fun m!279051 () Bool)

(assert (=> d!63077 m!279051))

(assert (=> d!63077 m!278579))

(declare-fun m!279053 () Bool)

(assert (=> b!263261 m!279053))

(declare-fun m!279055 () Bool)

(assert (=> b!263264 m!279055))

(declare-fun m!279057 () Bool)

(assert (=> b!263264 m!279057))

(assert (=> b!263264 m!278569))

(assert (=> b!263264 m!279055))

(declare-fun m!279059 () Bool)

(assert (=> b!263264 m!279059))

(assert (=> b!263264 m!278587))

(assert (=> b!263264 m!278633))

(assert (=> b!263264 m!278569))

(assert (=> b!263264 m!278635))

(declare-fun m!279061 () Bool)

(assert (=> b!263264 m!279061))

(assert (=> b!263264 m!278633))

(assert (=> b!263257 m!278587))

(assert (=> b!263257 m!278587))

(declare-fun m!279063 () Bool)

(assert (=> b!263257 m!279063))

(assert (=> b!262967 d!63077))

(declare-fun d!63079 () Bool)

(declare-fun e!170601 () Bool)

(assert (=> d!63079 e!170601))

(declare-fun res!128570 () Bool)

(assert (=> d!63079 (=> (not res!128570) (not e!170601))))

(declare-fun lt!133194 () ListLongMap!3823)

(assert (=> d!63079 (= res!128570 (contains!1889 lt!133194 (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133193 () List!3817)

(assert (=> d!63079 (= lt!133194 (ListLongMap!3824 lt!133193))))

(declare-fun lt!133196 () Unit!8136)

(declare-fun lt!133195 () Unit!8136)

(assert (=> d!63079 (= lt!133196 lt!133195)))

(assert (=> d!63079 (= (getValueByKey!318 lt!133193 (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))))))

(assert (=> d!63079 (= lt!133195 (lemmaContainsTupThenGetReturnValue!177 lt!133193 (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))))))

(assert (=> d!63079 (= lt!133193 (insertStrictlySorted!180 (toList!1927 lt!133001) (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))))))

(assert (=> d!63079 (= (+!713 lt!133001 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))) lt!133194)))

(declare-fun b!263269 () Bool)

(declare-fun res!128569 () Bool)

(assert (=> b!263269 (=> (not res!128569) (not e!170601))))

(assert (=> b!263269 (= res!128569 (= (getValueByKey!318 (toList!1927 lt!133194) (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))))))))

(declare-fun b!263270 () Bool)

(assert (=> b!263270 (= e!170601 (contains!1893 (toList!1927 lt!133194) (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))))))

(assert (= (and d!63079 res!128570) b!263269))

(assert (= (and b!263269 res!128569) b!263270))

(declare-fun m!279065 () Bool)

(assert (=> d!63079 m!279065))

(declare-fun m!279067 () Bool)

(assert (=> d!63079 m!279067))

(declare-fun m!279069 () Bool)

(assert (=> d!63079 m!279069))

(declare-fun m!279071 () Bool)

(assert (=> d!63079 m!279071))

(declare-fun m!279073 () Bool)

(assert (=> b!263269 m!279073))

(declare-fun m!279075 () Bool)

(assert (=> b!263270 m!279075))

(assert (=> b!262967 d!63079))

(declare-fun d!63081 () Bool)

(assert (=> d!63081 (= (apply!262 (+!713 lt!133001 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))) lt!132991) (apply!262 lt!133001 lt!132991))))

(declare-fun lt!133197 () Unit!8136)

(assert (=> d!63081 (= lt!133197 (choose!1301 lt!133001 lt!133007 (minValue!4683 thiss!1504) lt!132991))))

(declare-fun e!170602 () Bool)

(assert (=> d!63081 e!170602))

(declare-fun res!128571 () Bool)

(assert (=> d!63081 (=> (not res!128571) (not e!170602))))

(assert (=> d!63081 (= res!128571 (contains!1889 lt!133001 lt!132991))))

(assert (=> d!63081 (= (addApplyDifferent!238 lt!133001 lt!133007 (minValue!4683 thiss!1504) lt!132991) lt!133197)))

(declare-fun b!263271 () Bool)

(assert (=> b!263271 (= e!170602 (not (= lt!132991 lt!133007)))))

(assert (= (and d!63081 res!128571) b!263271))

(assert (=> d!63081 m!278615))

(assert (=> d!63081 m!278615))

(assert (=> d!63081 m!278617))

(declare-fun m!279077 () Bool)

(assert (=> d!63081 m!279077))

(assert (=> d!63081 m!278605))

(declare-fun m!279079 () Bool)

(assert (=> d!63081 m!279079))

(assert (=> b!262967 d!63081))

(declare-fun d!63083 () Bool)

(assert (=> d!63083 (= (inRange!0 (ite c!44869 (index!6942 lt!133091) (index!6945 lt!133091)) (mask!11207 thiss!1504)) (and (bvsge (ite c!44869 (index!6942 lt!133091) (index!6945 lt!133091)) #b00000000000000000000000000000000) (bvslt (ite c!44869 (index!6942 lt!133091) (index!6945 lt!133091)) (bvadd (mask!11207 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!25171 d!63083))

(declare-fun b!263273 () Bool)

(declare-fun e!170606 () Bool)

(declare-fun call!25189 () Bool)

(assert (=> b!263273 (= e!170606 call!25189)))

(declare-fun b!263274 () Bool)

(declare-fun e!170605 () Bool)

(declare-fun e!170603 () Bool)

(assert (=> b!263274 (= e!170605 e!170603)))

(declare-fun res!128574 () Bool)

(assert (=> b!263274 (=> (not res!128574) (not e!170603))))

(declare-fun e!170604 () Bool)

(assert (=> b!263274 (= res!128574 (not e!170604))))

(declare-fun res!128573 () Bool)

(assert (=> b!263274 (=> (not res!128573) (not e!170604))))

(assert (=> b!263274 (= res!128573 (validKeyInArray!0 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun c!44904 () Bool)

(declare-fun bm!25186 () Bool)

(assert (=> bm!25186 (= call!25189 (arrayNoDuplicates!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44904 (Cons!3814 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000) Nil!3815) Nil!3815)))))

(declare-fun b!263275 () Bool)

(assert (=> b!263275 (= e!170606 call!25189)))

(declare-fun b!263276 () Bool)

(assert (=> b!263276 (= e!170603 e!170606)))

(assert (=> b!263276 (= c!44904 (validKeyInArray!0 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!263272 () Bool)

(assert (=> b!263272 (= e!170604 (contains!1892 Nil!3815 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!63085 () Bool)

(declare-fun res!128572 () Bool)

(assert (=> d!63085 (=> res!128572 e!170605)))

(assert (=> d!63085 (= res!128572 (bvsge #b00000000000000000000000000000000 (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))))

(assert (=> d!63085 (= (arrayNoDuplicates!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) #b00000000000000000000000000000000 Nil!3815) e!170605)))

(assert (= (and d!63085 (not res!128572)) b!263274))

(assert (= (and b!263274 res!128573) b!263272))

(assert (= (and b!263274 res!128574) b!263276))

(assert (= (and b!263276 c!44904) b!263275))

(assert (= (and b!263276 (not c!44904)) b!263273))

(assert (= (or b!263275 b!263273) bm!25186))

(assert (=> b!263274 m!278833))

(assert (=> b!263274 m!278833))

(assert (=> b!263274 m!278871))

(assert (=> bm!25186 m!278833))

(declare-fun m!279081 () Bool)

(assert (=> bm!25186 m!279081))

(assert (=> b!263276 m!278833))

(assert (=> b!263276 m!278833))

(assert (=> b!263276 m!278871))

(assert (=> b!263272 m!278833))

(assert (=> b!263272 m!278833))

(declare-fun m!279083 () Bool)

(assert (=> b!263272 m!279083))

(assert (=> b!263025 d!63085))

(declare-fun d!63087 () Bool)

(assert (=> d!63087 (= (apply!262 lt!133003 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3088 (getValueByKey!318 (toList!1927 lt!133003) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9239 () Bool)

(assert (= bs!9239 d!63087))

(declare-fun m!279085 () Bool)

(assert (=> bs!9239 m!279085))

(assert (=> bs!9239 m!279085))

(declare-fun m!279087 () Bool)

(assert (=> bs!9239 m!279087))

(assert (=> b!262953 d!63087))

(assert (=> b!263045 d!63037))

(assert (=> bm!25172 d!62929))

(declare-fun d!63089 () Bool)

(declare-fun e!170607 () Bool)

(assert (=> d!63089 e!170607))

(declare-fun res!128576 () Bool)

(assert (=> d!63089 (=> (not res!128576) (not e!170607))))

(declare-fun lt!133199 () ListLongMap!3823)

(assert (=> d!63089 (= res!128576 (contains!1889 lt!133199 (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133198 () List!3817)

(assert (=> d!63089 (= lt!133199 (ListLongMap!3824 lt!133198))))

(declare-fun lt!133201 () Unit!8136)

(declare-fun lt!133200 () Unit!8136)

(assert (=> d!63089 (= lt!133201 lt!133200)))

(assert (=> d!63089 (= (getValueByKey!318 lt!133198 (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63089 (= lt!133200 (lemmaContainsTupThenGetReturnValue!177 lt!133198 (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63089 (= lt!133198 (insertStrictlySorted!180 (toList!1927 lt!132971) (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63089 (= (+!713 lt!132971 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))) lt!133199)))

(declare-fun b!263277 () Bool)

(declare-fun res!128575 () Bool)

(assert (=> b!263277 (=> (not res!128575) (not e!170607))))

(assert (=> b!263277 (= res!128575 (= (getValueByKey!318 (toList!1927 lt!133199) (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!263278 () Bool)

(assert (=> b!263278 (= e!170607 (contains!1893 (toList!1927 lt!133199) (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!63089 res!128576) b!263277))

(assert (= (and b!263277 res!128575) b!263278))

(declare-fun m!279089 () Bool)

(assert (=> d!63089 m!279089))

(declare-fun m!279091 () Bool)

(assert (=> d!63089 m!279091))

(declare-fun m!279093 () Bool)

(assert (=> d!63089 m!279093))

(declare-fun m!279095 () Bool)

(assert (=> d!63089 m!279095))

(declare-fun m!279097 () Bool)

(assert (=> b!263277 m!279097))

(declare-fun m!279099 () Bool)

(assert (=> b!263278 m!279099))

(assert (=> b!262929 d!63089))

(declare-fun d!63091 () Bool)

(assert (=> d!63091 (= (apply!262 (+!713 lt!132979 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))) lt!132969) (apply!262 lt!132979 lt!132969))))

(declare-fun lt!133202 () Unit!8136)

(assert (=> d!63091 (= lt!133202 (choose!1301 lt!132979 lt!132985 (minValue!4683 thiss!1504) lt!132969))))

(declare-fun e!170608 () Bool)

(assert (=> d!63091 e!170608))

(declare-fun res!128577 () Bool)

(assert (=> d!63091 (=> (not res!128577) (not e!170608))))

(assert (=> d!63091 (= res!128577 (contains!1889 lt!132979 lt!132969))))

(assert (=> d!63091 (= (addApplyDifferent!238 lt!132979 lt!132985 (minValue!4683 thiss!1504) lt!132969) lt!133202)))

(declare-fun b!263279 () Bool)

(assert (=> b!263279 (= e!170608 (not (= lt!132969 lt!132985)))))

(assert (= (and d!63091 res!128577) b!263279))

(assert (=> d!63091 m!278549))

(assert (=> d!63091 m!278549))

(assert (=> d!63091 m!278551))

(declare-fun m!279101 () Bool)

(assert (=> d!63091 m!279101))

(assert (=> d!63091 m!278539))

(declare-fun m!279103 () Bool)

(assert (=> d!63091 m!279103))

(assert (=> b!262929 d!63091))

(declare-fun d!63093 () Bool)

(declare-fun e!170609 () Bool)

(assert (=> d!63093 e!170609))

(declare-fun res!128579 () Bool)

(assert (=> d!63093 (=> (not res!128579) (not e!170609))))

(declare-fun lt!133204 () ListLongMap!3823)

(assert (=> d!63093 (= res!128579 (contains!1889 lt!133204 (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133203 () List!3817)

(assert (=> d!63093 (= lt!133204 (ListLongMap!3824 lt!133203))))

(declare-fun lt!133206 () Unit!8136)

(declare-fun lt!133205 () Unit!8136)

(assert (=> d!63093 (= lt!133206 lt!133205)))

(assert (=> d!63093 (= (getValueByKey!318 lt!133203 (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))))))

(assert (=> d!63093 (= lt!133205 (lemmaContainsTupThenGetReturnValue!177 lt!133203 (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))))))

(assert (=> d!63093 (= lt!133203 (insertStrictlySorted!180 (toList!1927 lt!132973) (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))))))

(assert (=> d!63093 (= (+!713 lt!132973 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))) lt!133204)))

(declare-fun b!263280 () Bool)

(declare-fun res!128578 () Bool)

(assert (=> b!263280 (=> (not res!128578) (not e!170609))))

(assert (=> b!263280 (= res!128578 (= (getValueByKey!318 (toList!1927 lt!133204) (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))))))))

(declare-fun b!263281 () Bool)

(assert (=> b!263281 (= e!170609 (contains!1893 (toList!1927 lt!133204) (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))))))

(assert (= (and d!63093 res!128579) b!263280))

(assert (= (and b!263280 res!128578) b!263281))

(declare-fun m!279105 () Bool)

(assert (=> d!63093 m!279105))

(declare-fun m!279107 () Bool)

(assert (=> d!63093 m!279107))

(declare-fun m!279109 () Bool)

(assert (=> d!63093 m!279109))

(declare-fun m!279111 () Bool)

(assert (=> d!63093 m!279111))

(declare-fun m!279113 () Bool)

(assert (=> b!263280 m!279113))

(declare-fun m!279115 () Bool)

(assert (=> b!263281 m!279115))

(assert (=> b!262929 d!63093))

(declare-fun d!63095 () Bool)

(assert (=> d!63095 (= (apply!262 (+!713 lt!132973 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))) lt!132975) (apply!262 lt!132973 lt!132975))))

(declare-fun lt!133207 () Unit!8136)

(assert (=> d!63095 (= lt!133207 (choose!1301 lt!132973 lt!132968 (minValue!4683 thiss!1504) lt!132975))))

(declare-fun e!170610 () Bool)

(assert (=> d!63095 e!170610))

(declare-fun res!128580 () Bool)

(assert (=> d!63095 (=> (not res!128580) (not e!170610))))

(assert (=> d!63095 (= res!128580 (contains!1889 lt!132973 lt!132975))))

(assert (=> d!63095 (= (addApplyDifferent!238 lt!132973 lt!132968 (minValue!4683 thiss!1504) lt!132975) lt!133207)))

(declare-fun b!263282 () Bool)

(assert (=> b!263282 (= e!170610 (not (= lt!132975 lt!132968)))))

(assert (= (and d!63095 res!128580) b!263282))

(assert (=> d!63095 m!278535))

(assert (=> d!63095 m!278535))

(assert (=> d!63095 m!278555))

(declare-fun m!279117 () Bool)

(assert (=> d!63095 m!279117))

(assert (=> d!63095 m!278559))

(declare-fun m!279119 () Bool)

(assert (=> d!63095 m!279119))

(assert (=> b!262929 d!63095))

(declare-fun d!63097 () Bool)

(assert (=> d!63097 (= (apply!262 lt!132973 lt!132975) (get!3088 (getValueByKey!318 (toList!1927 lt!132973) lt!132975)))))

(declare-fun bs!9240 () Bool)

(assert (= bs!9240 d!63097))

(declare-fun m!279121 () Bool)

(assert (=> bs!9240 m!279121))

(assert (=> bs!9240 m!279121))

(declare-fun m!279123 () Bool)

(assert (=> bs!9240 m!279123))

(assert (=> b!262929 d!63097))

(declare-fun d!63099 () Bool)

(declare-fun e!170611 () Bool)

(assert (=> d!63099 e!170611))

(declare-fun res!128581 () Bool)

(assert (=> d!63099 (=> res!128581 e!170611)))

(declare-fun lt!133211 () Bool)

(assert (=> d!63099 (= res!128581 (not lt!133211))))

(declare-fun lt!133209 () Bool)

(assert (=> d!63099 (= lt!133211 lt!133209)))

(declare-fun lt!133208 () Unit!8136)

(declare-fun e!170612 () Unit!8136)

(assert (=> d!63099 (= lt!133208 e!170612)))

(declare-fun c!44905 () Bool)

(assert (=> d!63099 (= c!44905 lt!133209)))

(assert (=> d!63099 (= lt!133209 (containsKey!310 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) lt!132970))))

(assert (=> d!63099 (= (contains!1889 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))) lt!132970) lt!133211)))

(declare-fun b!263283 () Bool)

(declare-fun lt!133210 () Unit!8136)

(assert (=> b!263283 (= e!170612 lt!133210)))

(assert (=> b!263283 (= lt!133210 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) lt!132970))))

(assert (=> b!263283 (isDefined!260 (getValueByKey!318 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) lt!132970))))

(declare-fun b!263284 () Bool)

(declare-fun Unit!8160 () Unit!8136)

(assert (=> b!263284 (= e!170612 Unit!8160)))

(declare-fun b!263285 () Bool)

(assert (=> b!263285 (= e!170611 (isDefined!260 (getValueByKey!318 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) lt!132970)))))

(assert (= (and d!63099 c!44905) b!263283))

(assert (= (and d!63099 (not c!44905)) b!263284))

(assert (= (and d!63099 (not res!128581)) b!263285))

(declare-fun m!279125 () Bool)

(assert (=> d!63099 m!279125))

(declare-fun m!279127 () Bool)

(assert (=> b!263283 m!279127))

(declare-fun m!279129 () Bool)

(assert (=> b!263283 m!279129))

(assert (=> b!263283 m!279129))

(declare-fun m!279131 () Bool)

(assert (=> b!263283 m!279131))

(assert (=> b!263285 m!279129))

(assert (=> b!263285 m!279129))

(assert (=> b!263285 m!279131))

(assert (=> b!262929 d!63099))

(declare-fun d!63101 () Bool)

(assert (=> d!63101 (contains!1889 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))) lt!132970)))

(declare-fun lt!133212 () Unit!8136)

(assert (=> d!63101 (= lt!133212 (choose!1302 lt!132977 lt!132974 (zeroValue!4683 thiss!1504) lt!132970))))

(assert (=> d!63101 (contains!1889 lt!132977 lt!132970)))

(assert (=> d!63101 (= (addStillContains!238 lt!132977 lt!132974 (zeroValue!4683 thiss!1504) lt!132970) lt!133212)))

(declare-fun bs!9241 () Bool)

(assert (= bs!9241 d!63101))

(assert (=> bs!9241 m!278537))

(assert (=> bs!9241 m!278537))

(assert (=> bs!9241 m!278547))

(declare-fun m!279133 () Bool)

(assert (=> bs!9241 m!279133))

(declare-fun m!279135 () Bool)

(assert (=> bs!9241 m!279135))

(assert (=> b!262929 d!63101))

(declare-fun d!63103 () Bool)

(declare-fun e!170613 () Bool)

(assert (=> d!63103 e!170613))

(declare-fun res!128583 () Bool)

(assert (=> d!63103 (=> (not res!128583) (not e!170613))))

(declare-fun lt!133214 () ListLongMap!3823)

(assert (=> d!63103 (= res!128583 (contains!1889 lt!133214 (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133213 () List!3817)

(assert (=> d!63103 (= lt!133214 (ListLongMap!3824 lt!133213))))

(declare-fun lt!133216 () Unit!8136)

(declare-fun lt!133215 () Unit!8136)

(assert (=> d!63103 (= lt!133216 lt!133215)))

(assert (=> d!63103 (= (getValueByKey!318 lt!133213 (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63103 (= lt!133215 (lemmaContainsTupThenGetReturnValue!177 lt!133213 (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63103 (= lt!133213 (insertStrictlySorted!180 (toList!1927 lt!132977) (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63103 (= (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))) lt!133214)))

(declare-fun b!263286 () Bool)

(declare-fun res!128582 () Bool)

(assert (=> b!263286 (=> (not res!128582) (not e!170613))))

(assert (=> b!263286 (= res!128582 (= (getValueByKey!318 (toList!1927 lt!133214) (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!263287 () Bool)

(assert (=> b!263287 (= e!170613 (contains!1893 (toList!1927 lt!133214) (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!63103 res!128583) b!263286))

(assert (= (and b!263286 res!128582) b!263287))

(declare-fun m!279137 () Bool)

(assert (=> d!63103 m!279137))

(declare-fun m!279139 () Bool)

(assert (=> d!63103 m!279139))

(declare-fun m!279141 () Bool)

(assert (=> d!63103 m!279141))

(declare-fun m!279143 () Bool)

(assert (=> d!63103 m!279143))

(declare-fun m!279145 () Bool)

(assert (=> b!263286 m!279145))

(declare-fun m!279147 () Bool)

(assert (=> b!263287 m!279147))

(assert (=> b!262929 d!63103))

(declare-fun d!63105 () Bool)

(declare-fun e!170614 () Bool)

(assert (=> d!63105 e!170614))

(declare-fun res!128585 () Bool)

(assert (=> d!63105 (=> (not res!128585) (not e!170614))))

(declare-fun lt!133218 () ListLongMap!3823)

(assert (=> d!63105 (= res!128585 (contains!1889 lt!133218 (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133217 () List!3817)

(assert (=> d!63105 (= lt!133218 (ListLongMap!3824 lt!133217))))

(declare-fun lt!133220 () Unit!8136)

(declare-fun lt!133219 () Unit!8136)

(assert (=> d!63105 (= lt!133220 lt!133219)))

(assert (=> d!63105 (= (getValueByKey!318 lt!133217 (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))))))

(assert (=> d!63105 (= lt!133219 (lemmaContainsTupThenGetReturnValue!177 lt!133217 (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))))))

(assert (=> d!63105 (= lt!133217 (insertStrictlySorted!180 (toList!1927 lt!132979) (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))))))

(assert (=> d!63105 (= (+!713 lt!132979 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))) lt!133218)))

(declare-fun b!263288 () Bool)

(declare-fun res!128584 () Bool)

(assert (=> b!263288 (=> (not res!128584) (not e!170614))))

(assert (=> b!263288 (= res!128584 (= (getValueByKey!318 (toList!1927 lt!133218) (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))))))))

(declare-fun b!263289 () Bool)

(assert (=> b!263289 (= e!170614 (contains!1893 (toList!1927 lt!133218) (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))))))

(assert (= (and d!63105 res!128585) b!263288))

(assert (= (and b!263288 res!128584) b!263289))

(declare-fun m!279149 () Bool)

(assert (=> d!63105 m!279149))

(declare-fun m!279151 () Bool)

(assert (=> d!63105 m!279151))

(declare-fun m!279153 () Bool)

(assert (=> d!63105 m!279153))

(declare-fun m!279155 () Bool)

(assert (=> d!63105 m!279155))

(declare-fun m!279157 () Bool)

(assert (=> b!263288 m!279157))

(declare-fun m!279159 () Bool)

(assert (=> b!263289 m!279159))

(assert (=> b!262929 d!63105))

(declare-fun d!63107 () Bool)

(assert (=> d!63107 (= (apply!262 lt!132971 lt!132972) (get!3088 (getValueByKey!318 (toList!1927 lt!132971) lt!132972)))))

(declare-fun bs!9242 () Bool)

(assert (= bs!9242 d!63107))

(declare-fun m!279161 () Bool)

(assert (=> bs!9242 m!279161))

(assert (=> bs!9242 m!279161))

(declare-fun m!279163 () Bool)

(assert (=> bs!9242 m!279163))

(assert (=> b!262929 d!63107))

(declare-fun d!63109 () Bool)

(assert (=> d!63109 (= (apply!262 (+!713 lt!132979 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))) lt!132969) (get!3088 (getValueByKey!318 (toList!1927 (+!713 lt!132979 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))) lt!132969)))))

(declare-fun bs!9243 () Bool)

(assert (= bs!9243 d!63109))

(declare-fun m!279165 () Bool)

(assert (=> bs!9243 m!279165))

(assert (=> bs!9243 m!279165))

(declare-fun m!279167 () Bool)

(assert (=> bs!9243 m!279167))

(assert (=> b!262929 d!63109))

(declare-fun d!63111 () Bool)

(assert (=> d!63111 (= (apply!262 lt!132979 lt!132969) (get!3088 (getValueByKey!318 (toList!1927 lt!132979) lt!132969)))))

(declare-fun bs!9244 () Bool)

(assert (= bs!9244 d!63111))

(declare-fun m!279169 () Bool)

(assert (=> bs!9244 m!279169))

(assert (=> bs!9244 m!279169))

(declare-fun m!279171 () Bool)

(assert (=> bs!9244 m!279171))

(assert (=> b!262929 d!63111))

(declare-fun d!63113 () Bool)

(assert (=> d!63113 (= (apply!262 (+!713 lt!132971 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))) lt!132972) (apply!262 lt!132971 lt!132972))))

(declare-fun lt!133221 () Unit!8136)

(assert (=> d!63113 (= lt!133221 (choose!1301 lt!132971 lt!132980 (zeroValue!4683 thiss!1504) lt!132972))))

(declare-fun e!170615 () Bool)

(assert (=> d!63113 e!170615))

(declare-fun res!128586 () Bool)

(assert (=> d!63113 (=> (not res!128586) (not e!170615))))

(assert (=> d!63113 (= res!128586 (contains!1889 lt!132971 lt!132972))))

(assert (=> d!63113 (= (addApplyDifferent!238 lt!132971 lt!132980 (zeroValue!4683 thiss!1504) lt!132972) lt!133221)))

(declare-fun b!263290 () Bool)

(assert (=> b!263290 (= e!170615 (not (= lt!132972 lt!132980)))))

(assert (= (and d!63113 res!128586) b!263290))

(assert (=> d!63113 m!278543))

(assert (=> d!63113 m!278543))

(assert (=> d!63113 m!278545))

(declare-fun m!279173 () Bool)

(assert (=> d!63113 m!279173))

(assert (=> d!63113 m!278557))

(declare-fun m!279175 () Bool)

(assert (=> d!63113 m!279175))

(assert (=> b!262929 d!63113))

(declare-fun b!263291 () Bool)

(declare-fun e!170621 () Bool)

(declare-fun e!170619 () Bool)

(assert (=> b!263291 (= e!170621 e!170619)))

(assert (=> b!263291 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun res!128588 () Bool)

(declare-fun lt!133224 () ListLongMap!3823)

(assert (=> b!263291 (= res!128588 (contains!1889 lt!133224 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!263291 (=> (not res!128588) (not e!170619))))

(declare-fun b!263292 () Bool)

(declare-fun e!170616 () Bool)

(assert (=> b!263292 (= e!170616 (= lt!133224 (getCurrentListMapNoExtraKeys!578 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504))))))

(declare-fun b!263293 () Bool)

(assert (=> b!263293 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))))))

(assert (=> b!263293 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6343 (_values!4825 thiss!1504))))))

(assert (=> b!263293 (= e!170619 (= (apply!262 lt!133224 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)) (get!3087 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!263294 () Bool)

(declare-fun e!170618 () ListLongMap!3823)

(assert (=> b!263294 (= e!170618 (ListLongMap!3824 Nil!3814))))

(declare-fun b!263295 () Bool)

(assert (=> b!263295 (= e!170616 (isEmpty!545 lt!133224))))

(declare-fun b!263296 () Bool)

(assert (=> b!263296 (= e!170621 e!170616)))

(declare-fun c!44908 () Bool)

(assert (=> b!263296 (= c!44908 (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun b!263297 () Bool)

(declare-fun res!128587 () Bool)

(declare-fun e!170622 () Bool)

(assert (=> b!263297 (=> (not res!128587) (not e!170622))))

(assert (=> b!263297 (= res!128587 (not (contains!1889 lt!133224 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263298 () Bool)

(declare-fun lt!133228 () Unit!8136)

(declare-fun lt!133226 () Unit!8136)

(assert (=> b!263298 (= lt!133228 lt!133226)))

(declare-fun lt!133227 () (_ BitVec 64))

(declare-fun lt!133223 () ListLongMap!3823)

(declare-fun lt!133225 () (_ BitVec 64))

(declare-fun lt!133222 () V!8521)

(assert (=> b!263298 (not (contains!1889 (+!713 lt!133223 (tuple2!4921 lt!133227 lt!133222)) lt!133225))))

(assert (=> b!263298 (= lt!133226 (addStillNotContains!130 lt!133223 lt!133227 lt!133222 lt!133225))))

(assert (=> b!263298 (= lt!133225 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!263298 (= lt!133222 (get!3087 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!263298 (= lt!133227 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!25190 () ListLongMap!3823)

(assert (=> b!263298 (= lt!133223 call!25190)))

(declare-fun e!170617 () ListLongMap!3823)

(assert (=> b!263298 (= e!170617 (+!713 call!25190 (tuple2!4921 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!25187 () Bool)

(assert (=> bm!25187 (= call!25190 (getCurrentListMapNoExtraKeys!578 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504)))))

(declare-fun b!263299 () Bool)

(assert (=> b!263299 (= e!170622 e!170621)))

(declare-fun c!44907 () Bool)

(declare-fun e!170620 () Bool)

(assert (=> b!263299 (= c!44907 e!170620)))

(declare-fun res!128589 () Bool)

(assert (=> b!263299 (=> (not res!128589) (not e!170620))))

(assert (=> b!263299 (= res!128589 (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun b!263300 () Bool)

(assert (=> b!263300 (= e!170620 (validKeyInArray!0 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!263300 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!263301 () Bool)

(assert (=> b!263301 (= e!170617 call!25190)))

(declare-fun d!63115 () Bool)

(assert (=> d!63115 e!170622))

(declare-fun res!128590 () Bool)

(assert (=> d!63115 (=> (not res!128590) (not e!170622))))

(assert (=> d!63115 (= res!128590 (not (contains!1889 lt!133224 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63115 (= lt!133224 e!170618)))

(declare-fun c!44906 () Bool)

(assert (=> d!63115 (= c!44906 (bvsge #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))))))

(assert (=> d!63115 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!63115 (= (getCurrentListMapNoExtraKeys!578 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) lt!133224)))

(declare-fun b!263302 () Bool)

(assert (=> b!263302 (= e!170618 e!170617)))

(declare-fun c!44909 () Bool)

(assert (=> b!263302 (= c!44909 (validKeyInArray!0 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!63115 c!44906) b!263294))

(assert (= (and d!63115 (not c!44906)) b!263302))

(assert (= (and b!263302 c!44909) b!263298))

(assert (= (and b!263302 (not c!44909)) b!263301))

(assert (= (or b!263298 b!263301) bm!25187))

(assert (= (and d!63115 res!128590) b!263297))

(assert (= (and b!263297 res!128587) b!263299))

(assert (= (and b!263299 res!128589) b!263300))

(assert (= (and b!263299 c!44907) b!263291))

(assert (= (and b!263299 (not c!44907)) b!263296))

(assert (= (and b!263291 res!128588) b!263293))

(assert (= (and b!263296 c!44908) b!263292))

(assert (= (and b!263296 (not c!44908)) b!263295))

(declare-fun b_lambda!8327 () Bool)

(assert (=> (not b_lambda!8327) (not b!263293)))

(assert (=> b!263293 t!8892))

(declare-fun b_and!13925 () Bool)

(assert (= b_and!13923 (and (=> t!8892 result!5425) b_and!13925)))

(declare-fun b_lambda!8329 () Bool)

(assert (=> (not b_lambda!8329) (not b!263298)))

(assert (=> b!263298 t!8892))

(declare-fun b_and!13927 () Bool)

(assert (= b_and!13925 (and (=> t!8892 result!5425) b_and!13927)))

(assert (=> b!263302 m!278517))

(assert (=> b!263302 m!278517))

(assert (=> b!263302 m!278581))

(assert (=> b!263293 m!278517))

(declare-fun m!279177 () Bool)

(assert (=> b!263293 m!279177))

(assert (=> b!263293 m!278569))

(assert (=> b!263293 m!278517))

(assert (=> b!263293 m!278567))

(assert (=> b!263293 m!278569))

(assert (=> b!263293 m!278571))

(assert (=> b!263293 m!278567))

(declare-fun m!279179 () Bool)

(assert (=> b!263292 m!279179))

(assert (=> b!263300 m!278517))

(assert (=> b!263300 m!278517))

(assert (=> b!263300 m!278581))

(declare-fun m!279181 () Bool)

(assert (=> b!263297 m!279181))

(assert (=> bm!25187 m!279179))

(declare-fun m!279183 () Bool)

(assert (=> d!63115 m!279183))

(assert (=> d!63115 m!278579))

(declare-fun m!279185 () Bool)

(assert (=> b!263295 m!279185))

(declare-fun m!279187 () Bool)

(assert (=> b!263298 m!279187))

(declare-fun m!279189 () Bool)

(assert (=> b!263298 m!279189))

(assert (=> b!263298 m!278569))

(assert (=> b!263298 m!279187))

(declare-fun m!279191 () Bool)

(assert (=> b!263298 m!279191))

(assert (=> b!263298 m!278517))

(assert (=> b!263298 m!278567))

(assert (=> b!263298 m!278569))

(assert (=> b!263298 m!278571))

(declare-fun m!279193 () Bool)

(assert (=> b!263298 m!279193))

(assert (=> b!263298 m!278567))

(assert (=> b!263291 m!278517))

(assert (=> b!263291 m!278517))

(declare-fun m!279195 () Bool)

(assert (=> b!263291 m!279195))

(assert (=> b!262929 d!63115))

(declare-fun d!63117 () Bool)

(assert (=> d!63117 (= (apply!262 (+!713 lt!132973 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))) lt!132975) (get!3088 (getValueByKey!318 (toList!1927 (+!713 lt!132973 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))) lt!132975)))))

(declare-fun bs!9245 () Bool)

(assert (= bs!9245 d!63117))

(declare-fun m!279197 () Bool)

(assert (=> bs!9245 m!279197))

(assert (=> bs!9245 m!279197))

(declare-fun m!279199 () Bool)

(assert (=> bs!9245 m!279199))

(assert (=> b!262929 d!63117))

(declare-fun d!63119 () Bool)

(assert (=> d!63119 (= (apply!262 (+!713 lt!132971 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))) lt!132972) (get!3088 (getValueByKey!318 (toList!1927 (+!713 lt!132971 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))) lt!132972)))))

(declare-fun bs!9246 () Bool)

(assert (= bs!9246 d!63119))

(declare-fun m!279201 () Bool)

(assert (=> bs!9246 m!279201))

(assert (=> bs!9246 m!279201))

(declare-fun m!279203 () Bool)

(assert (=> bs!9246 m!279203))

(assert (=> b!262929 d!63119))

(declare-fun d!63121 () Bool)

(assert (=> d!63121 (= (apply!262 lt!132981 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3088 (getValueByKey!318 (toList!1927 lt!132981) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9247 () Bool)

(assert (= bs!9247 d!63121))

(declare-fun m!279205 () Bool)

(assert (=> bs!9247 m!279205))

(assert (=> bs!9247 m!279205))

(declare-fun m!279207 () Bool)

(assert (=> bs!9247 m!279207))

(assert (=> b!262915 d!63121))

(declare-fun b!263303 () Bool)

(declare-fun e!170635 () Bool)

(declare-fun lt!133245 () ListLongMap!3823)

(assert (=> b!263303 (= e!170635 (= (apply!262 lt!133245 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4683 lt!132778)))))

(declare-fun b!263304 () Bool)

(declare-fun res!128593 () Bool)

(declare-fun e!170634 () Bool)

(assert (=> b!263304 (=> (not res!128593) (not e!170634))))

(declare-fun e!170625 () Bool)

(assert (=> b!263304 (= res!128593 e!170625)))

(declare-fun res!128598 () Bool)

(assert (=> b!263304 (=> res!128598 e!170625)))

(declare-fun e!170627 () Bool)

(assert (=> b!263304 (= res!128598 (not e!170627))))

(declare-fun res!128595 () Bool)

(assert (=> b!263304 (=> (not res!128595) (not e!170627))))

(assert (=> b!263304 (= res!128595 (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7033 lt!132778))))))

(declare-fun b!263305 () Bool)

(declare-fun e!170628 () Bool)

(assert (=> b!263305 (= e!170625 e!170628)))

(declare-fun res!128591 () Bool)

(assert (=> b!263305 (=> (not res!128591) (not e!170628))))

(assert (=> b!263305 (= res!128591 (contains!1889 lt!133245 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)))))

(assert (=> b!263305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7033 lt!132778))))))

(declare-fun d!63123 () Bool)

(assert (=> d!63123 e!170634))

(declare-fun res!128599 () Bool)

(assert (=> d!63123 (=> (not res!128599) (not e!170634))))

(assert (=> d!63123 (= res!128599 (or (bvsge #b00000000000000000000000000000000 (size!6344 (_keys!7033 lt!132778))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7033 lt!132778))))))))

(declare-fun lt!133230 () ListLongMap!3823)

(assert (=> d!63123 (= lt!133245 lt!133230)))

(declare-fun lt!133250 () Unit!8136)

(declare-fun e!170631 () Unit!8136)

(assert (=> d!63123 (= lt!133250 e!170631)))

(declare-fun c!44910 () Bool)

(declare-fun e!170624 () Bool)

(assert (=> d!63123 (= c!44910 e!170624)))

(declare-fun res!128592 () Bool)

(assert (=> d!63123 (=> (not res!128592) (not e!170624))))

(assert (=> d!63123 (= res!128592 (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7033 lt!132778))))))

(declare-fun e!170633 () ListLongMap!3823)

(assert (=> d!63123 (= lt!133230 e!170633)))

(declare-fun c!44915 () Bool)

(assert (=> d!63123 (= c!44915 (and (not (= (bvand (extraKeys!4579 lt!132778) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4579 lt!132778) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!63123 (validMask!0 (mask!11207 lt!132778))))

(assert (=> d!63123 (= (getCurrentListMap!1436 (_keys!7033 lt!132778) (_values!4825 lt!132778) (mask!11207 lt!132778) (extraKeys!4579 lt!132778) (zeroValue!4683 lt!132778) (minValue!4683 lt!132778) #b00000000000000000000000000000000 (defaultEntry!4842 lt!132778)) lt!133245)))

(declare-fun b!263306 () Bool)

(declare-fun e!170632 () ListLongMap!3823)

(declare-fun call!25196 () ListLongMap!3823)

(assert (=> b!263306 (= e!170632 call!25196)))

(declare-fun b!263307 () Bool)

(declare-fun e!170630 () Bool)

(declare-fun call!25191 () Bool)

(assert (=> b!263307 (= e!170630 (not call!25191))))

(declare-fun b!263308 () Bool)

(declare-fun c!44913 () Bool)

(assert (=> b!263308 (= c!44913 (and (not (= (bvand (extraKeys!4579 lt!132778) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4579 lt!132778) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!170626 () ListLongMap!3823)

(assert (=> b!263308 (= e!170632 e!170626)))

(declare-fun b!263309 () Bool)

(declare-fun e!170629 () Bool)

(assert (=> b!263309 (= e!170629 (= (apply!262 lt!133245 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4683 lt!132778)))))

(declare-fun b!263310 () Bool)

(assert (=> b!263310 (= e!170634 e!170630)))

(declare-fun c!44911 () Bool)

(assert (=> b!263310 (= c!44911 (not (= (bvand (extraKeys!4579 lt!132778) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!25188 () Bool)

(declare-fun call!25193 () Bool)

(assert (=> bm!25188 (= call!25193 (contains!1889 lt!133245 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263311 () Bool)

(assert (=> b!263311 (= e!170633 e!170632)))

(declare-fun c!44912 () Bool)

(assert (=> b!263311 (= c!44912 (and (not (= (bvand (extraKeys!4579 lt!132778) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4579 lt!132778) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!263312 () Bool)

(assert (=> b!263312 (= e!170624 (validKeyInArray!0 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)))))

(declare-fun call!25197 () ListLongMap!3823)

(declare-fun call!25195 () ListLongMap!3823)

(declare-fun bm!25189 () Bool)

(declare-fun call!25192 () ListLongMap!3823)

(declare-fun call!25194 () ListLongMap!3823)

(assert (=> bm!25189 (= call!25192 (+!713 (ite c!44915 call!25195 (ite c!44912 call!25197 call!25194)) (ite (or c!44915 c!44912) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!132778)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778)))))))

(declare-fun b!263313 () Bool)

(assert (=> b!263313 (= e!170633 (+!713 call!25192 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778))))))

(declare-fun b!263314 () Bool)

(declare-fun e!170623 () Bool)

(assert (=> b!263314 (= e!170623 (not call!25193))))

(declare-fun bm!25190 () Bool)

(assert (=> bm!25190 (= call!25191 (contains!1889 lt!133245 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!25191 () Bool)

(assert (=> bm!25191 (= call!25197 call!25195)))

(declare-fun b!263315 () Bool)

(assert (=> b!263315 (= e!170630 e!170635)))

(declare-fun res!128594 () Bool)

(assert (=> b!263315 (= res!128594 call!25191)))

(assert (=> b!263315 (=> (not res!128594) (not e!170635))))

(declare-fun bm!25192 () Bool)

(assert (=> bm!25192 (= call!25194 call!25197)))

(declare-fun b!263316 () Bool)

(assert (=> b!263316 (= e!170626 call!25194)))

(declare-fun b!263317 () Bool)

(declare-fun lt!133247 () Unit!8136)

(assert (=> b!263317 (= e!170631 lt!133247)))

(declare-fun lt!133241 () ListLongMap!3823)

(assert (=> b!263317 (= lt!133241 (getCurrentListMapNoExtraKeys!578 (_keys!7033 lt!132778) (_values!4825 lt!132778) (mask!11207 lt!132778) (extraKeys!4579 lt!132778) (zeroValue!4683 lt!132778) (minValue!4683 lt!132778) #b00000000000000000000000000000000 (defaultEntry!4842 lt!132778)))))

(declare-fun lt!133238 () (_ BitVec 64))

(assert (=> b!263317 (= lt!133238 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133234 () (_ BitVec 64))

(assert (=> b!263317 (= lt!133234 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000))))

(declare-fun lt!133231 () Unit!8136)

(assert (=> b!263317 (= lt!133231 (addStillContains!238 lt!133241 lt!133238 (zeroValue!4683 lt!132778) lt!133234))))

(assert (=> b!263317 (contains!1889 (+!713 lt!133241 (tuple2!4921 lt!133238 (zeroValue!4683 lt!132778))) lt!133234)))

(declare-fun lt!133240 () Unit!8136)

(assert (=> b!263317 (= lt!133240 lt!133231)))

(declare-fun lt!133237 () ListLongMap!3823)

(assert (=> b!263317 (= lt!133237 (getCurrentListMapNoExtraKeys!578 (_keys!7033 lt!132778) (_values!4825 lt!132778) (mask!11207 lt!132778) (extraKeys!4579 lt!132778) (zeroValue!4683 lt!132778) (minValue!4683 lt!132778) #b00000000000000000000000000000000 (defaultEntry!4842 lt!132778)))))

(declare-fun lt!133232 () (_ BitVec 64))

(assert (=> b!263317 (= lt!133232 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133239 () (_ BitVec 64))

(assert (=> b!263317 (= lt!133239 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000))))

(declare-fun lt!133248 () Unit!8136)

(assert (=> b!263317 (= lt!133248 (addApplyDifferent!238 lt!133237 lt!133232 (minValue!4683 lt!132778) lt!133239))))

(assert (=> b!263317 (= (apply!262 (+!713 lt!133237 (tuple2!4921 lt!133232 (minValue!4683 lt!132778))) lt!133239) (apply!262 lt!133237 lt!133239))))

(declare-fun lt!133242 () Unit!8136)

(assert (=> b!263317 (= lt!133242 lt!133248)))

(declare-fun lt!133235 () ListLongMap!3823)

(assert (=> b!263317 (= lt!133235 (getCurrentListMapNoExtraKeys!578 (_keys!7033 lt!132778) (_values!4825 lt!132778) (mask!11207 lt!132778) (extraKeys!4579 lt!132778) (zeroValue!4683 lt!132778) (minValue!4683 lt!132778) #b00000000000000000000000000000000 (defaultEntry!4842 lt!132778)))))

(declare-fun lt!133244 () (_ BitVec 64))

(assert (=> b!263317 (= lt!133244 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133236 () (_ BitVec 64))

(assert (=> b!263317 (= lt!133236 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000))))

(declare-fun lt!133229 () Unit!8136)

(assert (=> b!263317 (= lt!133229 (addApplyDifferent!238 lt!133235 lt!133244 (zeroValue!4683 lt!132778) lt!133236))))

(assert (=> b!263317 (= (apply!262 (+!713 lt!133235 (tuple2!4921 lt!133244 (zeroValue!4683 lt!132778))) lt!133236) (apply!262 lt!133235 lt!133236))))

(declare-fun lt!133246 () Unit!8136)

(assert (=> b!263317 (= lt!133246 lt!133229)))

(declare-fun lt!133243 () ListLongMap!3823)

(assert (=> b!263317 (= lt!133243 (getCurrentListMapNoExtraKeys!578 (_keys!7033 lt!132778) (_values!4825 lt!132778) (mask!11207 lt!132778) (extraKeys!4579 lt!132778) (zeroValue!4683 lt!132778) (minValue!4683 lt!132778) #b00000000000000000000000000000000 (defaultEntry!4842 lt!132778)))))

(declare-fun lt!133249 () (_ BitVec 64))

(assert (=> b!263317 (= lt!133249 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133233 () (_ BitVec 64))

(assert (=> b!263317 (= lt!133233 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000))))

(assert (=> b!263317 (= lt!133247 (addApplyDifferent!238 lt!133243 lt!133249 (minValue!4683 lt!132778) lt!133233))))

(assert (=> b!263317 (= (apply!262 (+!713 lt!133243 (tuple2!4921 lt!133249 (minValue!4683 lt!132778))) lt!133233) (apply!262 lt!133243 lt!133233))))

(declare-fun b!263318 () Bool)

(assert (=> b!263318 (= e!170628 (= (apply!262 lt!133245 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)) (get!3087 (select (arr!5991 (_values!4825 lt!132778)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 lt!132778) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263318 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6343 (_values!4825 lt!132778))))))

(assert (=> b!263318 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7033 lt!132778))))))

(declare-fun b!263319 () Bool)

(assert (=> b!263319 (= e!170626 call!25196)))

(declare-fun b!263320 () Bool)

(declare-fun Unit!8161 () Unit!8136)

(assert (=> b!263320 (= e!170631 Unit!8161)))

(declare-fun bm!25193 () Bool)

(assert (=> bm!25193 (= call!25196 call!25192)))

(declare-fun b!263321 () Bool)

(declare-fun res!128597 () Bool)

(assert (=> b!263321 (=> (not res!128597) (not e!170634))))

(assert (=> b!263321 (= res!128597 e!170623)))

(declare-fun c!44914 () Bool)

(assert (=> b!263321 (= c!44914 (not (= (bvand (extraKeys!4579 lt!132778) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!263322 () Bool)

(assert (=> b!263322 (= e!170623 e!170629)))

(declare-fun res!128596 () Bool)

(assert (=> b!263322 (= res!128596 call!25193)))

(assert (=> b!263322 (=> (not res!128596) (not e!170629))))

(declare-fun bm!25194 () Bool)

(assert (=> bm!25194 (= call!25195 (getCurrentListMapNoExtraKeys!578 (_keys!7033 lt!132778) (_values!4825 lt!132778) (mask!11207 lt!132778) (extraKeys!4579 lt!132778) (zeroValue!4683 lt!132778) (minValue!4683 lt!132778) #b00000000000000000000000000000000 (defaultEntry!4842 lt!132778)))))

(declare-fun b!263323 () Bool)

(assert (=> b!263323 (= e!170627 (validKeyInArray!0 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)))))

(assert (= (and d!63123 c!44915) b!263313))

(assert (= (and d!63123 (not c!44915)) b!263311))

(assert (= (and b!263311 c!44912) b!263306))

(assert (= (and b!263311 (not c!44912)) b!263308))

(assert (= (and b!263308 c!44913) b!263319))

(assert (= (and b!263308 (not c!44913)) b!263316))

(assert (= (or b!263319 b!263316) bm!25192))

(assert (= (or b!263306 bm!25192) bm!25191))

(assert (= (or b!263306 b!263319) bm!25193))

(assert (= (or b!263313 bm!25191) bm!25194))

(assert (= (or b!263313 bm!25193) bm!25189))

(assert (= (and d!63123 res!128592) b!263312))

(assert (= (and d!63123 c!44910) b!263317))

(assert (= (and d!63123 (not c!44910)) b!263320))

(assert (= (and d!63123 res!128599) b!263304))

(assert (= (and b!263304 res!128595) b!263323))

(assert (= (and b!263304 (not res!128598)) b!263305))

(assert (= (and b!263305 res!128591) b!263318))

(assert (= (and b!263304 res!128593) b!263321))

(assert (= (and b!263321 c!44914) b!263322))

(assert (= (and b!263321 (not c!44914)) b!263314))

(assert (= (and b!263322 res!128596) b!263309))

(assert (= (or b!263322 b!263314) bm!25188))

(assert (= (and b!263321 res!128597) b!263310))

(assert (= (and b!263310 c!44911) b!263315))

(assert (= (and b!263310 (not c!44911)) b!263307))

(assert (= (and b!263315 res!128594) b!263303))

(assert (= (or b!263315 b!263307) bm!25190))

(declare-fun b_lambda!8331 () Bool)

(assert (=> (not b_lambda!8331) (not b!263318)))

(declare-fun t!8894 () Bool)

(declare-fun tb!3031 () Bool)

(assert (=> (and b!262722 (= (defaultEntry!4842 thiss!1504) (defaultEntry!4842 lt!132778)) t!8894) tb!3031))

(declare-fun result!5431 () Bool)

(assert (=> tb!3031 (= result!5431 tp_is_empty!6655)))

(assert (=> b!263318 t!8894))

(declare-fun b_and!13929 () Bool)

(assert (= b_and!13927 (and (=> t!8894 result!5431) b_and!13929)))

(declare-fun m!279209 () Bool)

(assert (=> bm!25194 m!279209))

(declare-fun m!279211 () Bool)

(assert (=> b!263309 m!279211))

(declare-fun m!279213 () Bool)

(assert (=> b!263317 m!279213))

(declare-fun m!279215 () Bool)

(assert (=> b!263317 m!279215))

(declare-fun m!279217 () Bool)

(assert (=> b!263317 m!279217))

(declare-fun m!279219 () Bool)

(assert (=> b!263317 m!279219))

(assert (=> b!263317 m!278889))

(declare-fun m!279221 () Bool)

(assert (=> b!263317 m!279221))

(declare-fun m!279223 () Bool)

(assert (=> b!263317 m!279223))

(declare-fun m!279225 () Bool)

(assert (=> b!263317 m!279225))

(assert (=> b!263317 m!279217))

(declare-fun m!279227 () Bool)

(assert (=> b!263317 m!279227))

(declare-fun m!279229 () Bool)

(assert (=> b!263317 m!279229))

(declare-fun m!279231 () Bool)

(assert (=> b!263317 m!279231))

(assert (=> b!263317 m!279209))

(assert (=> b!263317 m!279223))

(assert (=> b!263317 m!279229))

(declare-fun m!279233 () Bool)

(assert (=> b!263317 m!279233))

(assert (=> b!263317 m!279215))

(declare-fun m!279235 () Bool)

(assert (=> b!263317 m!279235))

(declare-fun m!279237 () Bool)

(assert (=> b!263317 m!279237))

(declare-fun m!279239 () Bool)

(assert (=> b!263317 m!279239))

(declare-fun m!279241 () Bool)

(assert (=> b!263317 m!279241))

(declare-fun m!279243 () Bool)

(assert (=> bm!25189 m!279243))

(assert (=> b!263318 m!278889))

(declare-fun m!279245 () Bool)

(assert (=> b!263318 m!279245))

(declare-fun m!279247 () Bool)

(assert (=> b!263318 m!279247))

(declare-fun m!279249 () Bool)

(assert (=> b!263318 m!279249))

(declare-fun m!279251 () Bool)

(assert (=> b!263318 m!279251))

(assert (=> b!263318 m!279247))

(assert (=> b!263318 m!279249))

(assert (=> b!263318 m!278889))

(declare-fun m!279253 () Bool)

(assert (=> bm!25188 m!279253))

(declare-fun m!279255 () Bool)

(assert (=> b!263303 m!279255))

(declare-fun m!279257 () Bool)

(assert (=> b!263313 m!279257))

(assert (=> d!63123 m!278887))

(assert (=> b!263323 m!278889))

(assert (=> b!263323 m!278889))

(assert (=> b!263323 m!278897))

(assert (=> b!263312 m!278889))

(assert (=> b!263312 m!278889))

(assert (=> b!263312 m!278897))

(assert (=> b!263305 m!278889))

(assert (=> b!263305 m!278889))

(declare-fun m!279259 () Bool)

(assert (=> b!263305 m!279259))

(declare-fun m!279261 () Bool)

(assert (=> bm!25190 m!279261))

(assert (=> d!62991 d!63123))

(declare-fun e!170643 () SeekEntryResult!1193)

(declare-fun b!263336 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!263336 (= e!170643 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25234 lt!133068) #b00000000000000000000000000000001) (nextIndex!0 (index!6944 lt!133068) (x!25234 lt!133068) (mask!11207 thiss!1504)) (index!6944 lt!133068) key!932 (_keys!7033 thiss!1504) (mask!11207 thiss!1504)))))

(declare-fun b!263337 () Bool)

(assert (=> b!263337 (= e!170643 (MissingVacant!1193 (index!6944 lt!133068)))))

(declare-fun b!263338 () Bool)

(declare-fun c!44923 () Bool)

(declare-fun lt!133255 () (_ BitVec 64))

(assert (=> b!263338 (= c!44923 (= lt!133255 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!170642 () SeekEntryResult!1193)

(assert (=> b!263338 (= e!170642 e!170643)))

(declare-fun d!63125 () Bool)

(declare-fun lt!133256 () SeekEntryResult!1193)

(assert (=> d!63125 (and (or ((_ is Undefined!1193) lt!133256) (not ((_ is Found!1193) lt!133256)) (and (bvsge (index!6943 lt!133256) #b00000000000000000000000000000000) (bvslt (index!6943 lt!133256) (size!6344 (_keys!7033 thiss!1504))))) (or ((_ is Undefined!1193) lt!133256) ((_ is Found!1193) lt!133256) (not ((_ is MissingVacant!1193) lt!133256)) (not (= (index!6945 lt!133256) (index!6944 lt!133068))) (and (bvsge (index!6945 lt!133256) #b00000000000000000000000000000000) (bvslt (index!6945 lt!133256) (size!6344 (_keys!7033 thiss!1504))))) (or ((_ is Undefined!1193) lt!133256) (ite ((_ is Found!1193) lt!133256) (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6943 lt!133256)) key!932) (and ((_ is MissingVacant!1193) lt!133256) (= (index!6945 lt!133256) (index!6944 lt!133068)) (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6945 lt!133256)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!170644 () SeekEntryResult!1193)

(assert (=> d!63125 (= lt!133256 e!170644)))

(declare-fun c!44924 () Bool)

(assert (=> d!63125 (= c!44924 (bvsge (x!25234 lt!133068) #b01111111111111111111111111111110))))

(assert (=> d!63125 (= lt!133255 (select (arr!5992 (_keys!7033 thiss!1504)) (index!6944 lt!133068)))))

(assert (=> d!63125 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!63125 (= (seekKeyOrZeroReturnVacant!0 (x!25234 lt!133068) (index!6944 lt!133068) (index!6944 lt!133068) key!932 (_keys!7033 thiss!1504) (mask!11207 thiss!1504)) lt!133256)))

(declare-fun b!263339 () Bool)

(assert (=> b!263339 (= e!170644 Undefined!1193)))

(declare-fun b!263340 () Bool)

(assert (=> b!263340 (= e!170644 e!170642)))

(declare-fun c!44922 () Bool)

(assert (=> b!263340 (= c!44922 (= lt!133255 key!932))))

(declare-fun b!263341 () Bool)

(assert (=> b!263341 (= e!170642 (Found!1193 (index!6944 lt!133068)))))

(assert (= (and d!63125 c!44924) b!263339))

(assert (= (and d!63125 (not c!44924)) b!263340))

(assert (= (and b!263340 c!44922) b!263341))

(assert (= (and b!263340 (not c!44922)) b!263338))

(assert (= (and b!263338 c!44923) b!263337))

(assert (= (and b!263338 (not c!44923)) b!263336))

(declare-fun m!279263 () Bool)

(assert (=> b!263336 m!279263))

(assert (=> b!263336 m!279263))

(declare-fun m!279265 () Bool)

(assert (=> b!263336 m!279265))

(declare-fun m!279267 () Bool)

(assert (=> d!63125 m!279267))

(declare-fun m!279269 () Bool)

(assert (=> d!63125 m!279269))

(assert (=> d!63125 m!278745))

(assert (=> d!63125 m!278579))

(assert (=> b!263074 d!63125))

(declare-fun b!263342 () Bool)

(declare-fun e!170646 () (_ BitVec 32))

(declare-fun call!25198 () (_ BitVec 32))

(assert (=> b!263342 (= e!170646 call!25198)))

(declare-fun bm!25195 () Bool)

(assert (=> bm!25195 (= call!25198 (arrayCountValidKeys!0 lt!132768 (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(declare-fun b!263343 () Bool)

(declare-fun e!170645 () (_ BitVec 32))

(assert (=> b!263343 (= e!170645 e!170646)))

(declare-fun c!44926 () Bool)

(assert (=> b!263343 (= c!44926 (validKeyInArray!0 (select (arr!5992 lt!132768) index!297)))))

(declare-fun b!263344 () Bool)

(assert (=> b!263344 (= e!170645 #b00000000000000000000000000000000)))

(declare-fun b!263345 () Bool)

(assert (=> b!263345 (= e!170646 (bvadd #b00000000000000000000000000000001 call!25198))))

(declare-fun d!63127 () Bool)

(declare-fun lt!133257 () (_ BitVec 32))

(assert (=> d!63127 (and (bvsge lt!133257 #b00000000000000000000000000000000) (bvsle lt!133257 (bvsub (size!6344 lt!132768) index!297)))))

(assert (=> d!63127 (= lt!133257 e!170645)))

(declare-fun c!44925 () Bool)

(assert (=> d!63127 (= c!44925 (bvsge index!297 (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (=> d!63127 (and (bvsle index!297 (bvadd index!297 #b00000000000000000000000000000001)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd index!297 #b00000000000000000000000000000001) (size!6344 lt!132768)))))

(assert (=> d!63127 (= (arrayCountValidKeys!0 lt!132768 index!297 (bvadd index!297 #b00000000000000000000000000000001)) lt!133257)))

(assert (= (and d!63127 c!44925) b!263344))

(assert (= (and d!63127 (not c!44925)) b!263343))

(assert (= (and b!263343 c!44926) b!263345))

(assert (= (and b!263343 (not c!44926)) b!263342))

(assert (= (or b!263345 b!263342) bm!25195))

(declare-fun m!279271 () Bool)

(assert (=> bm!25195 m!279271))

(assert (=> b!263343 m!278671))

(assert (=> b!263343 m!278671))

(assert (=> b!263343 m!278673))

(assert (=> d!62973 d!63127))

(declare-fun d!63129 () Bool)

(assert (=> d!63129 (= (arrayCountValidKeys!0 lt!132768 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(assert (=> d!63129 true))

(declare-fun _$85!33 () Unit!8136)

(assert (=> d!63129 (= (choose!2 lt!132768 index!297) _$85!33)))

(declare-fun bs!9248 () Bool)

(assert (= bs!9248 d!63129))

(assert (=> bs!9248 m!278717))

(assert (=> d!62973 d!63129))

(declare-fun d!63131 () Bool)

(assert (=> d!63131 (arrayNoDuplicates!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) #b00000000000000000000000000000000 Nil!3815)))

(assert (=> d!63131 true))

(declare-fun _$65!98 () Unit!8136)

(assert (=> d!63131 (= (choose!41 (_keys!7033 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3815) _$65!98)))

(declare-fun bs!9249 () Bool)

(assert (= bs!9249 d!63131))

(assert (=> bs!9249 m!278327))

(assert (=> bs!9249 m!278693))

(assert (=> d!62961 d!63131))

(declare-fun d!63133 () Bool)

(declare-fun res!128600 () Bool)

(declare-fun e!170647 () Bool)

(assert (=> d!63133 (=> res!128600 e!170647)))

(assert (=> d!63133 (= res!128600 (and ((_ is Cons!3813) (toList!1927 lt!132776)) (= (_1!2471 (h!4479 (toList!1927 lt!132776))) key!932)))))

(assert (=> d!63133 (= (containsKey!310 (toList!1927 lt!132776) key!932) e!170647)))

(declare-fun b!263346 () Bool)

(declare-fun e!170648 () Bool)

(assert (=> b!263346 (= e!170647 e!170648)))

(declare-fun res!128601 () Bool)

(assert (=> b!263346 (=> (not res!128601) (not e!170648))))

(assert (=> b!263346 (= res!128601 (and (or (not ((_ is Cons!3813) (toList!1927 lt!132776))) (bvsle (_1!2471 (h!4479 (toList!1927 lt!132776))) key!932)) ((_ is Cons!3813) (toList!1927 lt!132776)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!132776))) key!932)))))

(declare-fun b!263347 () Bool)

(assert (=> b!263347 (= e!170648 (containsKey!310 (t!8885 (toList!1927 lt!132776)) key!932))))

(assert (= (and d!63133 (not res!128600)) b!263346))

(assert (= (and b!263346 res!128601) b!263347))

(declare-fun m!279273 () Bool)

(assert (=> b!263347 m!279273))

(assert (=> d!62989 d!63133))

(declare-fun d!63135 () Bool)

(declare-fun res!128602 () Bool)

(declare-fun e!170649 () Bool)

(assert (=> d!63135 (=> res!128602 e!170649)))

(assert (=> d!63135 (= res!128602 (and ((_ is Cons!3813) (toList!1927 lt!132775)) (= (_1!2471 (h!4479 (toList!1927 lt!132775))) key!932)))))

(assert (=> d!63135 (= (containsKey!310 (toList!1927 lt!132775) key!932) e!170649)))

(declare-fun b!263348 () Bool)

(declare-fun e!170650 () Bool)

(assert (=> b!263348 (= e!170649 e!170650)))

(declare-fun res!128603 () Bool)

(assert (=> b!263348 (=> (not res!128603) (not e!170650))))

(assert (=> b!263348 (= res!128603 (and (or (not ((_ is Cons!3813) (toList!1927 lt!132775))) (bvsle (_1!2471 (h!4479 (toList!1927 lt!132775))) key!932)) ((_ is Cons!3813) (toList!1927 lt!132775)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!132775))) key!932)))))

(declare-fun b!263349 () Bool)

(assert (=> b!263349 (= e!170650 (containsKey!310 (t!8885 (toList!1927 lt!132775)) key!932))))

(assert (= (and d!63135 (not res!128602)) b!263348))

(assert (= (and b!263348 res!128603) b!263349))

(declare-fun m!279275 () Bool)

(assert (=> b!263349 m!279275))

(assert (=> d!62971 d!63135))

(declare-fun d!63137 () Bool)

(declare-fun e!170651 () Bool)

(assert (=> d!63137 e!170651))

(declare-fun res!128605 () Bool)

(assert (=> d!63137 (=> (not res!128605) (not e!170651))))

(declare-fun lt!133259 () ListLongMap!3823)

(assert (=> d!63137 (= res!128605 (contains!1889 lt!133259 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133258 () List!3817)

(assert (=> d!63137 (= lt!133259 (ListLongMap!3824 lt!133258))))

(declare-fun lt!133261 () Unit!8136)

(declare-fun lt!133260 () Unit!8136)

(assert (=> d!63137 (= lt!133261 lt!133260)))

(assert (=> d!63137 (= (getValueByKey!318 lt!133258 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63137 (= lt!133260 (lemmaContainsTupThenGetReturnValue!177 lt!133258 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63137 (= lt!133258 (insertStrictlySorted!180 (toList!1927 call!25146) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63137 (= (+!713 call!25146 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) lt!133259)))

(declare-fun b!263350 () Bool)

(declare-fun res!128604 () Bool)

(assert (=> b!263350 (=> (not res!128604) (not e!170651))))

(assert (=> b!263350 (= res!128604 (= (getValueByKey!318 (toList!1927 lt!133259) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!263351 () Bool)

(assert (=> b!263351 (= e!170651 (contains!1893 (toList!1927 lt!133259) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(assert (= (and d!63137 res!128605) b!263350))

(assert (= (and b!263350 res!128604) b!263351))

(declare-fun m!279277 () Bool)

(assert (=> d!63137 m!279277))

(declare-fun m!279279 () Bool)

(assert (=> d!63137 m!279279))

(declare-fun m!279281 () Bool)

(assert (=> d!63137 m!279281))

(declare-fun m!279283 () Bool)

(assert (=> d!63137 m!279283))

(declare-fun m!279285 () Bool)

(assert (=> b!263350 m!279285))

(declare-fun m!279287 () Bool)

(assert (=> b!263351 m!279287))

(assert (=> b!262925 d!63137))

(declare-fun d!63139 () Bool)

(assert (=> d!63139 (= (inRange!0 (index!6943 lt!133080) (mask!11207 thiss!1504)) (and (bvsge (index!6943 lt!133080) #b00000000000000000000000000000000) (bvslt (index!6943 lt!133080) (bvadd (mask!11207 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!263083 d!63139))

(declare-fun b!263370 () Bool)

(declare-fun e!170664 () SeekEntryResult!1193)

(assert (=> b!263370 (= e!170664 (Intermediate!1193 true (toIndex!0 key!932 (mask!11207 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!263371 () Bool)

(declare-fun e!170663 () SeekEntryResult!1193)

(assert (=> b!263371 (= e!170663 (Intermediate!1193 false (toIndex!0 key!932 (mask!11207 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!263372 () Bool)

(assert (=> b!263372 (= e!170663 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!11207 thiss!1504)) #b00000000000000000000000000000000 (mask!11207 thiss!1504)) key!932 (_keys!7033 thiss!1504) (mask!11207 thiss!1504)))))

(declare-fun b!263373 () Bool)

(declare-fun lt!133267 () SeekEntryResult!1193)

(assert (=> b!263373 (and (bvsge (index!6944 lt!133267) #b00000000000000000000000000000000) (bvslt (index!6944 lt!133267) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun e!170665 () Bool)

(assert (=> b!263373 (= e!170665 (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6944 lt!133267)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!63141 () Bool)

(declare-fun e!170662 () Bool)

(assert (=> d!63141 e!170662))

(declare-fun c!44933 () Bool)

(assert (=> d!63141 (= c!44933 (and ((_ is Intermediate!1193) lt!133267) (undefined!2005 lt!133267)))))

(assert (=> d!63141 (= lt!133267 e!170664)))

(declare-fun c!44934 () Bool)

(assert (=> d!63141 (= c!44934 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!133266 () (_ BitVec 64))

(assert (=> d!63141 (= lt!133266 (select (arr!5992 (_keys!7033 thiss!1504)) (toIndex!0 key!932 (mask!11207 thiss!1504))))))

(assert (=> d!63141 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!63141 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11207 thiss!1504)) key!932 (_keys!7033 thiss!1504) (mask!11207 thiss!1504)) lt!133267)))

(declare-fun b!263374 () Bool)

(declare-fun e!170666 () Bool)

(assert (=> b!263374 (= e!170662 e!170666)))

(declare-fun res!128614 () Bool)

(assert (=> b!263374 (= res!128614 (and ((_ is Intermediate!1193) lt!133267) (not (undefined!2005 lt!133267)) (bvslt (x!25234 lt!133267) #b01111111111111111111111111111110) (bvsge (x!25234 lt!133267) #b00000000000000000000000000000000) (bvsge (x!25234 lt!133267) #b00000000000000000000000000000000)))))

(assert (=> b!263374 (=> (not res!128614) (not e!170666))))

(declare-fun b!263375 () Bool)

(assert (=> b!263375 (and (bvsge (index!6944 lt!133267) #b00000000000000000000000000000000) (bvslt (index!6944 lt!133267) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun res!128612 () Bool)

(assert (=> b!263375 (= res!128612 (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6944 lt!133267)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263375 (=> res!128612 e!170665)))

(declare-fun b!263376 () Bool)

(assert (=> b!263376 (and (bvsge (index!6944 lt!133267) #b00000000000000000000000000000000) (bvslt (index!6944 lt!133267) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun res!128613 () Bool)

(assert (=> b!263376 (= res!128613 (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6944 lt!133267)) key!932))))

(assert (=> b!263376 (=> res!128613 e!170665)))

(assert (=> b!263376 (= e!170666 e!170665)))

(declare-fun b!263377 () Bool)

(assert (=> b!263377 (= e!170664 e!170663)))

(declare-fun c!44935 () Bool)

(assert (=> b!263377 (= c!44935 (or (= lt!133266 key!932) (= (bvadd lt!133266 lt!133266) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263378 () Bool)

(assert (=> b!263378 (= e!170662 (bvsge (x!25234 lt!133267) #b01111111111111111111111111111110))))

(assert (= (and d!63141 c!44934) b!263370))

(assert (= (and d!63141 (not c!44934)) b!263377))

(assert (= (and b!263377 c!44935) b!263371))

(assert (= (and b!263377 (not c!44935)) b!263372))

(assert (= (and d!63141 c!44933) b!263378))

(assert (= (and d!63141 (not c!44933)) b!263374))

(assert (= (and b!263374 res!128614) b!263376))

(assert (= (and b!263376 (not res!128613)) b!263375))

(assert (= (and b!263375 (not res!128612)) b!263373))

(assert (=> b!263372 m!278735))

(declare-fun m!279289 () Bool)

(assert (=> b!263372 m!279289))

(assert (=> b!263372 m!279289))

(declare-fun m!279291 () Bool)

(assert (=> b!263372 m!279291))

(declare-fun m!279293 () Bool)

(assert (=> b!263373 m!279293))

(assert (=> b!263375 m!279293))

(assert (=> d!63141 m!278735))

(declare-fun m!279295 () Bool)

(assert (=> d!63141 m!279295))

(assert (=> d!63141 m!278579))

(assert (=> b!263376 m!279293))

(assert (=> d!62979 d!63141))

(declare-fun d!63143 () Bool)

(declare-fun lt!133273 () (_ BitVec 32))

(declare-fun lt!133272 () (_ BitVec 32))

(assert (=> d!63143 (= lt!133273 (bvmul (bvxor lt!133272 (bvlshr lt!133272 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!63143 (= lt!133272 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!63143 (and (bvsge (mask!11207 thiss!1504) #b00000000000000000000000000000000) (let ((res!128615 (let ((h!4485 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!25262 (bvmul (bvxor h!4485 (bvlshr h!4485 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!25262 (bvlshr x!25262 #b00000000000000000000000000001101)) (mask!11207 thiss!1504)))))) (and (bvslt res!128615 (bvadd (mask!11207 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!128615 #b00000000000000000000000000000000))))))

(assert (=> d!63143 (= (toIndex!0 key!932 (mask!11207 thiss!1504)) (bvand (bvxor lt!133273 (bvlshr lt!133273 #b00000000000000000000000000001101)) (mask!11207 thiss!1504)))))

(assert (=> d!62979 d!63143))

(assert (=> d!62979 d!63015))

(declare-fun b!263379 () Bool)

(declare-fun e!170668 () (_ BitVec 32))

(declare-fun call!25199 () (_ BitVec 32))

(assert (=> b!263379 (= e!170668 call!25199)))

(declare-fun bm!25196 () Bool)

(assert (=> bm!25196 (= call!25199 (arrayCountValidKeys!0 lt!132768 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun b!263380 () Bool)

(declare-fun e!170667 () (_ BitVec 32))

(assert (=> b!263380 (= e!170667 e!170668)))

(declare-fun c!44937 () Bool)

(assert (=> b!263380 (= c!44937 (validKeyInArray!0 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263381 () Bool)

(assert (=> b!263381 (= e!170667 #b00000000000000000000000000000000)))

(declare-fun b!263382 () Bool)

(assert (=> b!263382 (= e!170668 (bvadd #b00000000000000000000000000000001 call!25199))))

(declare-fun d!63145 () Bool)

(declare-fun lt!133274 () (_ BitVec 32))

(assert (=> d!63145 (and (bvsge lt!133274 #b00000000000000000000000000000000) (bvsle lt!133274 (bvsub (size!6344 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!63145 (= lt!133274 e!170667)))

(declare-fun c!44936 () Bool)

(assert (=> d!63145 (= c!44936 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(assert (=> d!63145 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6344 (_keys!7033 thiss!1504)) (size!6344 lt!132768)))))

(assert (=> d!63145 (= (arrayCountValidKeys!0 lt!132768 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))) lt!133274)))

(assert (= (and d!63145 c!44936) b!263381))

(assert (= (and d!63145 (not c!44936)) b!263380))

(assert (= (and b!263380 c!44937) b!263382))

(assert (= (and b!263380 (not c!44937)) b!263379))

(assert (= (or b!263382 b!263379) bm!25196))

(declare-fun m!279297 () Bool)

(assert (=> bm!25196 m!279297))

(declare-fun m!279299 () Bool)

(assert (=> b!263380 m!279299))

(assert (=> b!263380 m!279299))

(declare-fun m!279301 () Bool)

(assert (=> b!263380 m!279301))

(assert (=> bm!25165 d!63145))

(declare-fun d!63147 () Bool)

(declare-fun e!170669 () Bool)

(assert (=> d!63147 e!170669))

(declare-fun res!128616 () Bool)

(assert (=> d!63147 (=> res!128616 e!170669)))

(declare-fun lt!133278 () Bool)

(assert (=> d!63147 (= res!128616 (not lt!133278))))

(declare-fun lt!133276 () Bool)

(assert (=> d!63147 (= lt!133278 lt!133276)))

(declare-fun lt!133275 () Unit!8136)

(declare-fun e!170670 () Unit!8136)

(assert (=> d!63147 (= lt!133275 e!170670)))

(declare-fun c!44938 () Bool)

(assert (=> d!63147 (= c!44938 lt!133276)))

(assert (=> d!63147 (= lt!133276 (containsKey!310 (toList!1927 lt!133003) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63147 (= (contains!1889 lt!133003 #b1000000000000000000000000000000000000000000000000000000000000000) lt!133278)))

(declare-fun b!263383 () Bool)

(declare-fun lt!133277 () Unit!8136)

(assert (=> b!263383 (= e!170670 lt!133277)))

(assert (=> b!263383 (= lt!133277 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133003) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263383 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133003) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263384 () Bool)

(declare-fun Unit!8162 () Unit!8136)

(assert (=> b!263384 (= e!170670 Unit!8162)))

(declare-fun b!263385 () Bool)

(assert (=> b!263385 (= e!170669 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133003) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63147 c!44938) b!263383))

(assert (= (and d!63147 (not c!44938)) b!263384))

(assert (= (and d!63147 (not res!128616)) b!263385))

(declare-fun m!279303 () Bool)

(assert (=> d!63147 m!279303))

(declare-fun m!279305 () Bool)

(assert (=> b!263383 m!279305))

(assert (=> b!263383 m!279085))

(assert (=> b!263383 m!279085))

(declare-fun m!279307 () Bool)

(assert (=> b!263383 m!279307))

(assert (=> b!263385 m!279085))

(assert (=> b!263385 m!279085))

(assert (=> b!263385 m!279307))

(assert (=> bm!25154 d!63147))

(declare-fun d!63149 () Bool)

(assert (=> d!63149 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262983 d!63149))

(declare-fun d!63151 () Bool)

(assert (=> d!63151 (= (validKeyInArray!0 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263030 d!63151))

(declare-fun d!63153 () Bool)

(assert (=> d!63153 (arrayContainsKey!0 lt!132768 lt!133033 #b00000000000000000000000000000000)))

(declare-fun lt!133279 () Unit!8136)

(assert (=> d!63153 (= lt!133279 (choose!13 lt!132768 lt!133033 #b00000000000000000000000000000000))))

(assert (=> d!63153 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!63153 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132768 lt!133033 #b00000000000000000000000000000000) lt!133279)))

(declare-fun bs!9250 () Bool)

(assert (= bs!9250 d!63153))

(assert (=> bs!9250 m!278677))

(declare-fun m!279309 () Bool)

(assert (=> bs!9250 m!279309))

(assert (=> b!263012 d!63153))

(declare-fun d!63155 () Bool)

(declare-fun res!128617 () Bool)

(declare-fun e!170671 () Bool)

(assert (=> d!63155 (=> res!128617 e!170671)))

(assert (=> d!63155 (= res!128617 (= (select (arr!5992 lt!132768) #b00000000000000000000000000000000) lt!133033))))

(assert (=> d!63155 (= (arrayContainsKey!0 lt!132768 lt!133033 #b00000000000000000000000000000000) e!170671)))

(declare-fun b!263386 () Bool)

(declare-fun e!170672 () Bool)

(assert (=> b!263386 (= e!170671 e!170672)))

(declare-fun res!128618 () Bool)

(assert (=> b!263386 (=> (not res!128618) (not e!170672))))

(assert (=> b!263386 (= res!128618 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 lt!132768)))))

(declare-fun b!263387 () Bool)

(assert (=> b!263387 (= e!170672 (arrayContainsKey!0 lt!132768 lt!133033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63155 (not res!128617)) b!263386))

(assert (= (and b!263386 res!128618) b!263387))

(assert (=> d!63155 m!278587))

(declare-fun m!279311 () Bool)

(assert (=> b!263387 m!279311))

(assert (=> b!263012 d!63155))

(declare-fun b!263388 () Bool)

(declare-fun e!170674 () SeekEntryResult!1193)

(declare-fun lt!133282 () SeekEntryResult!1193)

(assert (=> b!263388 (= e!170674 (MissingZero!1193 (index!6944 lt!133282)))))

(declare-fun d!63157 () Bool)

(declare-fun lt!133280 () SeekEntryResult!1193)

(assert (=> d!63157 (and (or ((_ is Undefined!1193) lt!133280) (not ((_ is Found!1193) lt!133280)) (and (bvsge (index!6943 lt!133280) #b00000000000000000000000000000000) (bvslt (index!6943 lt!133280) (size!6344 lt!132768)))) (or ((_ is Undefined!1193) lt!133280) ((_ is Found!1193) lt!133280) (not ((_ is MissingZero!1193) lt!133280)) (and (bvsge (index!6942 lt!133280) #b00000000000000000000000000000000) (bvslt (index!6942 lt!133280) (size!6344 lt!132768)))) (or ((_ is Undefined!1193) lt!133280) ((_ is Found!1193) lt!133280) ((_ is MissingZero!1193) lt!133280) (not ((_ is MissingVacant!1193) lt!133280)) (and (bvsge (index!6945 lt!133280) #b00000000000000000000000000000000) (bvslt (index!6945 lt!133280) (size!6344 lt!132768)))) (or ((_ is Undefined!1193) lt!133280) (ite ((_ is Found!1193) lt!133280) (= (select (arr!5992 lt!132768) (index!6943 lt!133280)) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1193) lt!133280) (= (select (arr!5992 lt!132768) (index!6942 lt!133280)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1193) lt!133280) (= (select (arr!5992 lt!132768) (index!6945 lt!133280)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!170673 () SeekEntryResult!1193)

(assert (=> d!63157 (= lt!133280 e!170673)))

(declare-fun c!44940 () Bool)

(assert (=> d!63157 (= c!44940 (and ((_ is Intermediate!1193) lt!133282) (undefined!2005 lt!133282)))))

(assert (=> d!63157 (= lt!133282 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (mask!11207 thiss!1504)) (select (arr!5992 lt!132768) #b00000000000000000000000000000000) lt!132768 (mask!11207 thiss!1504)))))

(assert (=> d!63157 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!63157 (= (seekEntryOrOpen!0 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) lt!132768 (mask!11207 thiss!1504)) lt!133280)))

(declare-fun b!263389 () Bool)

(declare-fun e!170675 () SeekEntryResult!1193)

(assert (=> b!263389 (= e!170673 e!170675)))

(declare-fun lt!133281 () (_ BitVec 64))

(assert (=> b!263389 (= lt!133281 (select (arr!5992 lt!132768) (index!6944 lt!133282)))))

(declare-fun c!44941 () Bool)

(assert (=> b!263389 (= c!44941 (= lt!133281 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(declare-fun b!263390 () Bool)

(assert (=> b!263390 (= e!170675 (Found!1193 (index!6944 lt!133282)))))

(declare-fun b!263391 () Bool)

(assert (=> b!263391 (= e!170674 (seekKeyOrZeroReturnVacant!0 (x!25234 lt!133282) (index!6944 lt!133282) (index!6944 lt!133282) (select (arr!5992 lt!132768) #b00000000000000000000000000000000) lt!132768 (mask!11207 thiss!1504)))))

(declare-fun b!263392 () Bool)

(assert (=> b!263392 (= e!170673 Undefined!1193)))

(declare-fun b!263393 () Bool)

(declare-fun c!44939 () Bool)

(assert (=> b!263393 (= c!44939 (= lt!133281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263393 (= e!170675 e!170674)))

(assert (= (and d!63157 c!44940) b!263392))

(assert (= (and d!63157 (not c!44940)) b!263389))

(assert (= (and b!263389 c!44941) b!263390))

(assert (= (and b!263389 (not c!44941)) b!263393))

(assert (= (and b!263393 c!44939) b!263388))

(assert (= (and b!263393 (not c!44939)) b!263391))

(declare-fun m!279313 () Bool)

(assert (=> d!63157 m!279313))

(assert (=> d!63157 m!278587))

(declare-fun m!279315 () Bool)

(assert (=> d!63157 m!279315))

(declare-fun m!279317 () Bool)

(assert (=> d!63157 m!279317))

(assert (=> d!63157 m!278579))

(declare-fun m!279319 () Bool)

(assert (=> d!63157 m!279319))

(declare-fun m!279321 () Bool)

(assert (=> d!63157 m!279321))

(assert (=> d!63157 m!278587))

(assert (=> d!63157 m!279313))

(declare-fun m!279323 () Bool)

(assert (=> b!263389 m!279323))

(assert (=> b!263391 m!278587))

(declare-fun m!279325 () Bool)

(assert (=> b!263391 m!279325))

(assert (=> b!263012 d!63157))

(declare-fun b!263394 () Bool)

(declare-fun e!170677 () (_ BitVec 32))

(declare-fun call!25200 () (_ BitVec 32))

(assert (=> b!263394 (= e!170677 call!25200)))

(declare-fun bm!25197 () Bool)

(assert (=> bm!25197 (= call!25200 (arrayCountValidKeys!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun b!263395 () Bool)

(declare-fun e!170676 () (_ BitVec 32))

(assert (=> b!263395 (= e!170676 e!170677)))

(declare-fun c!44943 () Bool)

(assert (=> b!263395 (= c!44943 (validKeyInArray!0 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!263396 () Bool)

(assert (=> b!263396 (= e!170676 #b00000000000000000000000000000000)))

(declare-fun b!263397 () Bool)

(assert (=> b!263397 (= e!170677 (bvadd #b00000000000000000000000000000001 call!25200))))

(declare-fun lt!133283 () (_ BitVec 32))

(declare-fun d!63159 () Bool)

(assert (=> d!63159 (and (bvsge lt!133283 #b00000000000000000000000000000000) (bvsle lt!133283 (bvsub (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!63159 (= lt!133283 e!170676)))

(declare-fun c!44942 () Bool)

(assert (=> d!63159 (= c!44942 (bvsge #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))))))

(assert (=> d!63159 (and (bvsle #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6344 (_keys!7033 thiss!1504)) (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))))

(assert (=> d!63159 (= (arrayCountValidKeys!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))) lt!133283)))

(assert (= (and d!63159 c!44942) b!263396))

(assert (= (and d!63159 (not c!44942)) b!263395))

(assert (= (and b!263395 c!44943) b!263397))

(assert (= (and b!263395 (not c!44943)) b!263394))

(assert (= (or b!263397 b!263394) bm!25197))

(declare-fun m!279327 () Bool)

(assert (=> bm!25197 m!279327))

(assert (=> b!263395 m!278833))

(assert (=> b!263395 m!278833))

(assert (=> b!263395 m!278871))

(assert (=> b!262985 d!63159))

(assert (=> b!262985 d!62965))

(declare-fun d!63161 () Bool)

(declare-fun e!170678 () Bool)

(assert (=> d!63161 e!170678))

(declare-fun res!128619 () Bool)

(assert (=> d!63161 (=> res!128619 e!170678)))

(declare-fun lt!133287 () Bool)

(assert (=> d!63161 (= res!128619 (not lt!133287))))

(declare-fun lt!133285 () Bool)

(assert (=> d!63161 (= lt!133287 lt!133285)))

(declare-fun lt!133284 () Unit!8136)

(declare-fun e!170679 () Unit!8136)

(assert (=> d!63161 (= lt!133284 e!170679)))

(declare-fun c!44944 () Bool)

(assert (=> d!63161 (= c!44944 lt!133285)))

(assert (=> d!63161 (= lt!133285 (containsKey!310 (toList!1927 lt!132981) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63161 (= (contains!1889 lt!132981 #b1000000000000000000000000000000000000000000000000000000000000000) lt!133287)))

(declare-fun b!263398 () Bool)

(declare-fun lt!133286 () Unit!8136)

(assert (=> b!263398 (= e!170679 lt!133286)))

(assert (=> b!263398 (= lt!133286 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!132981) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263398 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132981) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263399 () Bool)

(declare-fun Unit!8163 () Unit!8136)

(assert (=> b!263399 (= e!170679 Unit!8163)))

(declare-fun b!263400 () Bool)

(assert (=> b!263400 (= e!170678 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132981) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63161 c!44944) b!263398))

(assert (= (and d!63161 (not c!44944)) b!263399))

(assert (= (and d!63161 (not res!128619)) b!263400))

(declare-fun m!279329 () Bool)

(assert (=> d!63161 m!279329))

(declare-fun m!279331 () Bool)

(assert (=> b!263398 m!279331))

(assert (=> b!263398 m!279205))

(assert (=> b!263398 m!279205))

(declare-fun m!279333 () Bool)

(assert (=> b!263398 m!279333))

(assert (=> b!263400 m!279205))

(assert (=> b!263400 m!279205))

(assert (=> b!263400 m!279333))

(assert (=> bm!25144 d!63161))

(assert (=> d!62957 d!62967))

(declare-fun d!63163 () Bool)

(assert (=> d!63163 (arrayContainsKey!0 lt!132768 key!932 #b00000000000000000000000000000000)))

(assert (=> d!63163 true))

(declare-fun _$60!387 () Unit!8136)

(assert (=> d!63163 (= (choose!13 lt!132768 key!932 index!297) _$60!387)))

(declare-fun bs!9251 () Bool)

(assert (= bs!9251 d!63163))

(assert (=> bs!9251 m!278311))

(assert (=> d!62957 d!63163))

(declare-fun b!263402 () Bool)

(declare-fun e!170683 () Bool)

(declare-fun call!25201 () Bool)

(assert (=> b!263402 (= e!170683 call!25201)))

(declare-fun b!263403 () Bool)

(declare-fun e!170682 () Bool)

(declare-fun e!170680 () Bool)

(assert (=> b!263403 (= e!170682 e!170680)))

(declare-fun res!128622 () Bool)

(assert (=> b!263403 (=> (not res!128622) (not e!170680))))

(declare-fun e!170681 () Bool)

(assert (=> b!263403 (= res!128622 (not e!170681))))

(declare-fun res!128621 () Bool)

(assert (=> b!263403 (=> (not res!128621) (not e!170681))))

(assert (=> b!263403 (= res!128621 (validKeyInArray!0 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!25198 () Bool)

(declare-fun c!44945 () Bool)

(assert (=> bm!25198 (= call!25201 (arrayNoDuplicates!0 lt!132768 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!44945 (Cons!3814 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44834 (Cons!3814 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) Nil!3815) Nil!3815)) (ite c!44834 (Cons!3814 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) Nil!3815) Nil!3815))))))

(declare-fun b!263404 () Bool)

(assert (=> b!263404 (= e!170683 call!25201)))

(declare-fun b!263405 () Bool)

(assert (=> b!263405 (= e!170680 e!170683)))

(assert (=> b!263405 (= c!44945 (validKeyInArray!0 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263401 () Bool)

(assert (=> b!263401 (= e!170681 (contains!1892 (ite c!44834 (Cons!3814 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) Nil!3815) Nil!3815) (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63165 () Bool)

(declare-fun res!128620 () Bool)

(assert (=> d!63165 (=> res!128620 e!170682)))

(assert (=> d!63165 (= res!128620 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 lt!132768)))))

(assert (=> d!63165 (= (arrayNoDuplicates!0 lt!132768 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44834 (Cons!3814 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) Nil!3815) Nil!3815)) e!170682)))

(assert (= (and d!63165 (not res!128620)) b!263403))

(assert (= (and b!263403 res!128621) b!263401))

(assert (= (and b!263403 res!128622) b!263405))

(assert (= (and b!263405 c!44945) b!263404))

(assert (= (and b!263405 (not c!44945)) b!263402))

(assert (= (or b!263404 b!263402) bm!25198))

(assert (=> b!263403 m!279299))

(assert (=> b!263403 m!279299))

(assert (=> b!263403 m!279301))

(assert (=> bm!25198 m!279299))

(declare-fun m!279335 () Bool)

(assert (=> bm!25198 m!279335))

(assert (=> b!263405 m!279299))

(assert (=> b!263405 m!279299))

(assert (=> b!263405 m!279301))

(assert (=> b!263401 m!279299))

(assert (=> b!263401 m!279299))

(declare-fun m!279337 () Bool)

(assert (=> b!263401 m!279337))

(assert (=> bm!25151 d!63165))

(declare-fun b!263407 () Bool)

(declare-fun e!170684 () Option!324)

(declare-fun e!170685 () Option!324)

(assert (=> b!263407 (= e!170684 e!170685)))

(declare-fun c!44947 () Bool)

(assert (=> b!263407 (= c!44947 (and ((_ is Cons!3813) (toList!1927 lt!133021)) (not (= (_1!2471 (h!4479 (toList!1927 lt!133021))) (_1!2471 lt!132765)))))))

(declare-fun b!263409 () Bool)

(assert (=> b!263409 (= e!170685 None!322)))

(declare-fun d!63167 () Bool)

(declare-fun c!44946 () Bool)

(assert (=> d!63167 (= c!44946 (and ((_ is Cons!3813) (toList!1927 lt!133021)) (= (_1!2471 (h!4479 (toList!1927 lt!133021))) (_1!2471 lt!132765))))))

(assert (=> d!63167 (= (getValueByKey!318 (toList!1927 lt!133021) (_1!2471 lt!132765)) e!170684)))

(declare-fun b!263406 () Bool)

(assert (=> b!263406 (= e!170684 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!133021)))))))

(declare-fun b!263408 () Bool)

(assert (=> b!263408 (= e!170685 (getValueByKey!318 (t!8885 (toList!1927 lt!133021)) (_1!2471 lt!132765)))))

(assert (= (and d!63167 c!44946) b!263406))

(assert (= (and d!63167 (not c!44946)) b!263407))

(assert (= (and b!263407 c!44947) b!263408))

(assert (= (and b!263407 (not c!44947)) b!263409))

(declare-fun m!279339 () Bool)

(assert (=> b!263408 m!279339))

(assert (=> b!262990 d!63167))

(assert (=> b!262952 d!63001))

(declare-fun b!263410 () Bool)

(declare-fun e!170687 () (_ BitVec 32))

(declare-fun call!25202 () (_ BitVec 32))

(assert (=> b!263410 (= e!170687 call!25202)))

(declare-fun bm!25199 () Bool)

(assert (=> bm!25199 (= call!25202 (arrayCountValidKeys!0 (_keys!7033 lt!132778) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 lt!132778))))))

(declare-fun b!263411 () Bool)

(declare-fun e!170686 () (_ BitVec 32))

(assert (=> b!263411 (= e!170686 e!170687)))

(declare-fun c!44949 () Bool)

(assert (=> b!263411 (= c!44949 (validKeyInArray!0 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)))))

(declare-fun b!263412 () Bool)

(assert (=> b!263412 (= e!170686 #b00000000000000000000000000000000)))

(declare-fun b!263413 () Bool)

(assert (=> b!263413 (= e!170687 (bvadd #b00000000000000000000000000000001 call!25202))))

(declare-fun d!63169 () Bool)

(declare-fun lt!133288 () (_ BitVec 32))

(assert (=> d!63169 (and (bvsge lt!133288 #b00000000000000000000000000000000) (bvsle lt!133288 (bvsub (size!6344 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)))))

(assert (=> d!63169 (= lt!133288 e!170686)))

(declare-fun c!44948 () Bool)

(assert (=> d!63169 (= c!44948 (bvsge #b00000000000000000000000000000000 (size!6344 (_keys!7033 lt!132778))))))

(assert (=> d!63169 (and (bvsle #b00000000000000000000000000000000 (size!6344 (_keys!7033 lt!132778))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6344 (_keys!7033 lt!132778)) (size!6344 (_keys!7033 lt!132778))))))

(assert (=> d!63169 (= (arrayCountValidKeys!0 (_keys!7033 lt!132778) #b00000000000000000000000000000000 (size!6344 (_keys!7033 lt!132778))) lt!133288)))

(assert (= (and d!63169 c!44948) b!263412))

(assert (= (and d!63169 (not c!44948)) b!263411))

(assert (= (and b!263411 c!44949) b!263413))

(assert (= (and b!263411 (not c!44949)) b!263410))

(assert (= (or b!263413 b!263410) bm!25199))

(declare-fun m!279341 () Bool)

(assert (=> bm!25199 m!279341))

(assert (=> b!263411 m!278889))

(assert (=> b!263411 m!278889))

(assert (=> b!263411 m!278897))

(assert (=> b!263053 d!63169))

(declare-fun d!63171 () Bool)

(declare-fun e!170688 () Bool)

(assert (=> d!63171 e!170688))

(declare-fun res!128623 () Bool)

(assert (=> d!63171 (=> res!128623 e!170688)))

(declare-fun lt!133292 () Bool)

(assert (=> d!63171 (= res!128623 (not lt!133292))))

(declare-fun lt!133290 () Bool)

(assert (=> d!63171 (= lt!133292 lt!133290)))

(declare-fun lt!133289 () Unit!8136)

(declare-fun e!170689 () Unit!8136)

(assert (=> d!63171 (= lt!133289 e!170689)))

(declare-fun c!44950 () Bool)

(assert (=> d!63171 (= c!44950 lt!133290)))

(assert (=> d!63171 (= lt!133290 (containsKey!310 (toList!1927 lt!133003) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63171 (= (contains!1889 lt!133003 #b0000000000000000000000000000000000000000000000000000000000000000) lt!133292)))

(declare-fun b!263414 () Bool)

(declare-fun lt!133291 () Unit!8136)

(assert (=> b!263414 (= e!170689 lt!133291)))

(assert (=> b!263414 (= lt!133291 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133003) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263414 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133003) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263415 () Bool)

(declare-fun Unit!8164 () Unit!8136)

(assert (=> b!263415 (= e!170689 Unit!8164)))

(declare-fun b!263416 () Bool)

(assert (=> b!263416 (= e!170688 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133003) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63171 c!44950) b!263414))

(assert (= (and d!63171 (not c!44950)) b!263415))

(assert (= (and d!63171 (not res!128623)) b!263416))

(declare-fun m!279343 () Bool)

(assert (=> d!63171 m!279343))

(declare-fun m!279345 () Bool)

(assert (=> b!263414 m!279345))

(assert (=> b!263414 m!278961))

(assert (=> b!263414 m!278961))

(declare-fun m!279347 () Bool)

(assert (=> b!263414 m!279347))

(assert (=> b!263416 m!278961))

(assert (=> b!263416 m!278961))

(assert (=> b!263416 m!279347))

(assert (=> bm!25152 d!63171))

(declare-fun d!63173 () Bool)

(assert (=> d!63173 (= (apply!262 lt!132981 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3088 (getValueByKey!318 (toList!1927 lt!132981) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9252 () Bool)

(assert (= bs!9252 d!63173))

(declare-fun m!279349 () Bool)

(assert (=> bs!9252 m!279349))

(assert (=> bs!9252 m!279349))

(declare-fun m!279351 () Bool)

(assert (=> bs!9252 m!279351))

(assert (=> b!262921 d!63173))

(declare-fun d!63175 () Bool)

(assert (=> d!63175 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132763) key!932))))

(declare-fun lt!133293 () Unit!8136)

(assert (=> d!63175 (= lt!133293 (choose!1300 (toList!1927 lt!132763) key!932))))

(declare-fun e!170690 () Bool)

(assert (=> d!63175 e!170690))

(declare-fun res!128624 () Bool)

(assert (=> d!63175 (=> (not res!128624) (not e!170690))))

(assert (=> d!63175 (= res!128624 (isStrictlySorted!372 (toList!1927 lt!132763)))))

(assert (=> d!63175 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!132763) key!932) lt!133293)))

(declare-fun b!263417 () Bool)

(assert (=> b!263417 (= e!170690 (containsKey!310 (toList!1927 lt!132763) key!932))))

(assert (= (and d!63175 res!128624) b!263417))

(assert (=> d!63175 m!278525))

(assert (=> d!63175 m!278525))

(assert (=> d!63175 m!278527))

(declare-fun m!279353 () Bool)

(assert (=> d!63175 m!279353))

(declare-fun m!279355 () Bool)

(assert (=> d!63175 m!279355))

(assert (=> b!263417 m!278521))

(assert (=> b!262870 d!63175))

(declare-fun d!63177 () Bool)

(assert (=> d!63177 (= (isDefined!260 (getValueByKey!318 (toList!1927 lt!132763) key!932)) (not (isEmpty!544 (getValueByKey!318 (toList!1927 lt!132763) key!932))))))

(declare-fun bs!9253 () Bool)

(assert (= bs!9253 d!63177))

(assert (=> bs!9253 m!278525))

(declare-fun m!279357 () Bool)

(assert (=> bs!9253 m!279357))

(assert (=> b!262870 d!63177))

(declare-fun b!263419 () Bool)

(declare-fun e!170691 () Option!324)

(declare-fun e!170692 () Option!324)

(assert (=> b!263419 (= e!170691 e!170692)))

(declare-fun c!44952 () Bool)

(assert (=> b!263419 (= c!44952 (and ((_ is Cons!3813) (toList!1927 lt!132763)) (not (= (_1!2471 (h!4479 (toList!1927 lt!132763))) key!932))))))

(declare-fun b!263421 () Bool)

(assert (=> b!263421 (= e!170692 None!322)))

(declare-fun d!63179 () Bool)

(declare-fun c!44951 () Bool)

(assert (=> d!63179 (= c!44951 (and ((_ is Cons!3813) (toList!1927 lt!132763)) (= (_1!2471 (h!4479 (toList!1927 lt!132763))) key!932)))))

(assert (=> d!63179 (= (getValueByKey!318 (toList!1927 lt!132763) key!932) e!170691)))

(declare-fun b!263418 () Bool)

(assert (=> b!263418 (= e!170691 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!132763)))))))

(declare-fun b!263420 () Bool)

(assert (=> b!263420 (= e!170692 (getValueByKey!318 (t!8885 (toList!1927 lt!132763)) key!932))))

(assert (= (and d!63179 c!44951) b!263418))

(assert (= (and d!63179 (not c!44951)) b!263419))

(assert (= (and b!263419 c!44952) b!263420))

(assert (= (and b!263419 (not c!44952)) b!263421))

(declare-fun m!279359 () Bool)

(assert (=> b!263420 m!279359))

(assert (=> b!262870 d!63179))

(assert (=> b!262935 d!63151))

(declare-fun d!63181 () Bool)

(declare-fun e!170693 () Bool)

(assert (=> d!63181 e!170693))

(declare-fun res!128625 () Bool)

(assert (=> d!63181 (=> res!128625 e!170693)))

(declare-fun lt!133297 () Bool)

(assert (=> d!63181 (= res!128625 (not lt!133297))))

(declare-fun lt!133295 () Bool)

(assert (=> d!63181 (= lt!133297 lt!133295)))

(declare-fun lt!133294 () Unit!8136)

(declare-fun e!170694 () Unit!8136)

(assert (=> d!63181 (= lt!133294 e!170694)))

(declare-fun c!44953 () Bool)

(assert (=> d!63181 (= c!44953 lt!133295)))

(assert (=> d!63181 (= lt!133295 (containsKey!310 (toList!1927 lt!132981) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63181 (= (contains!1889 lt!132981 #b0000000000000000000000000000000000000000000000000000000000000000) lt!133297)))

(declare-fun b!263422 () Bool)

(declare-fun lt!133296 () Unit!8136)

(assert (=> b!263422 (= e!170694 lt!133296)))

(assert (=> b!263422 (= lt!133296 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!132981) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263422 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132981) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263423 () Bool)

(declare-fun Unit!8165 () Unit!8136)

(assert (=> b!263423 (= e!170694 Unit!8165)))

(declare-fun b!263424 () Bool)

(assert (=> b!263424 (= e!170693 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132981) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63181 c!44953) b!263422))

(assert (= (and d!63181 (not c!44953)) b!263423))

(assert (= (and d!63181 (not res!128625)) b!263424))

(declare-fun m!279361 () Bool)

(assert (=> d!63181 m!279361))

(declare-fun m!279363 () Bool)

(assert (=> b!263422 m!279363))

(assert (=> b!263422 m!279349))

(assert (=> b!263422 m!279349))

(declare-fun m!279365 () Bool)

(assert (=> b!263422 m!279365))

(assert (=> b!263424 m!279349))

(assert (=> b!263424 m!279349))

(assert (=> b!263424 m!279365))

(assert (=> bm!25142 d!63181))

(assert (=> b!262872 d!63177))

(assert (=> b!262872 d!63179))

(declare-fun d!63183 () Bool)

(declare-fun e!170695 () Bool)

(assert (=> d!63183 e!170695))

(declare-fun res!128626 () Bool)

(assert (=> d!63183 (=> res!128626 e!170695)))

(declare-fun lt!133301 () Bool)

(assert (=> d!63183 (= res!128626 (not lt!133301))))

(declare-fun lt!133299 () Bool)

(assert (=> d!63183 (= lt!133301 lt!133299)))

(declare-fun lt!133298 () Unit!8136)

(declare-fun e!170696 () Unit!8136)

(assert (=> d!63183 (= lt!133298 e!170696)))

(declare-fun c!44954 () Bool)

(assert (=> d!63183 (= c!44954 lt!133299)))

(assert (=> d!63183 (= lt!133299 (containsKey!310 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5992 lt!132768) index!297)))))

(assert (=> d!63183 (= (contains!1889 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) (select (arr!5992 lt!132768) index!297)) lt!133301)))

(declare-fun b!263425 () Bool)

(declare-fun lt!133300 () Unit!8136)

(assert (=> b!263425 (= e!170696 lt!133300)))

(assert (=> b!263425 (= lt!133300 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5992 lt!132768) index!297)))))

(assert (=> b!263425 (isDefined!260 (getValueByKey!318 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5992 lt!132768) index!297)))))

(declare-fun b!263426 () Bool)

(declare-fun Unit!8166 () Unit!8136)

(assert (=> b!263426 (= e!170696 Unit!8166)))

(declare-fun b!263427 () Bool)

(assert (=> b!263427 (= e!170695 (isDefined!260 (getValueByKey!318 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5992 lt!132768) index!297))))))

(assert (= (and d!63183 c!44954) b!263425))

(assert (= (and d!63183 (not c!44954)) b!263426))

(assert (= (and d!63183 (not res!128626)) b!263427))

(assert (=> d!63183 m!278671))

(declare-fun m!279367 () Bool)

(assert (=> d!63183 m!279367))

(assert (=> b!263425 m!278671))

(declare-fun m!279369 () Bool)

(assert (=> b!263425 m!279369))

(assert (=> b!263425 m!278671))

(declare-fun m!279371 () Bool)

(assert (=> b!263425 m!279371))

(assert (=> b!263425 m!279371))

(declare-fun m!279373 () Bool)

(assert (=> b!263425 m!279373))

(assert (=> b!263427 m!278671))

(assert (=> b!263427 m!279371))

(assert (=> b!263427 m!279371))

(assert (=> b!263427 m!279373))

(assert (=> b!263018 d!63183))

(assert (=> b!263018 d!62945))

(declare-fun b!263429 () Bool)

(declare-fun e!170700 () Bool)

(declare-fun call!25203 () Bool)

(assert (=> b!263429 (= e!170700 call!25203)))

(declare-fun b!263430 () Bool)

(declare-fun e!170699 () Bool)

(declare-fun e!170697 () Bool)

(assert (=> b!263430 (= e!170699 e!170697)))

(declare-fun res!128629 () Bool)

(assert (=> b!263430 (=> (not res!128629) (not e!170697))))

(declare-fun e!170698 () Bool)

(assert (=> b!263430 (= res!128629 (not e!170698))))

(declare-fun res!128628 () Bool)

(assert (=> b!263430 (=> (not res!128628) (not e!170698))))

(assert (=> b!263430 (= res!128628 (validKeyInArray!0 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)))))

(declare-fun bm!25200 () Bool)

(declare-fun c!44955 () Bool)

(assert (=> bm!25200 (= call!25203 (arrayNoDuplicates!0 (_keys!7033 lt!132778) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44955 (Cons!3814 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000) Nil!3815) Nil!3815)))))

(declare-fun b!263431 () Bool)

(assert (=> b!263431 (= e!170700 call!25203)))

(declare-fun b!263432 () Bool)

(assert (=> b!263432 (= e!170697 e!170700)))

(assert (=> b!263432 (= c!44955 (validKeyInArray!0 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)))))

(declare-fun b!263428 () Bool)

(assert (=> b!263428 (= e!170698 (contains!1892 Nil!3815 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)))))

(declare-fun d!63185 () Bool)

(declare-fun res!128627 () Bool)

(assert (=> d!63185 (=> res!128627 e!170699)))

(assert (=> d!63185 (= res!128627 (bvsge #b00000000000000000000000000000000 (size!6344 (_keys!7033 lt!132778))))))

(assert (=> d!63185 (= (arrayNoDuplicates!0 (_keys!7033 lt!132778) #b00000000000000000000000000000000 Nil!3815) e!170699)))

(assert (= (and d!63185 (not res!128627)) b!263430))

(assert (= (and b!263430 res!128628) b!263428))

(assert (= (and b!263430 res!128629) b!263432))

(assert (= (and b!263432 c!44955) b!263431))

(assert (= (and b!263432 (not c!44955)) b!263429))

(assert (= (or b!263431 b!263429) bm!25200))

(assert (=> b!263430 m!278889))

(assert (=> b!263430 m!278889))

(assert (=> b!263430 m!278897))

(assert (=> bm!25200 m!278889))

(declare-fun m!279375 () Bool)

(assert (=> bm!25200 m!279375))

(assert (=> b!263432 m!278889))

(assert (=> b!263432 m!278889))

(assert (=> b!263432 m!278897))

(assert (=> b!263428 m!278889))

(assert (=> b!263428 m!278889))

(declare-fun m!279377 () Bool)

(assert (=> b!263428 m!279377))

(assert (=> b!263055 d!63185))

(assert (=> b!262962 d!63001))

(declare-fun d!63187 () Bool)

(declare-fun e!170701 () Bool)

(assert (=> d!63187 e!170701))

(declare-fun res!128631 () Bool)

(assert (=> d!63187 (=> (not res!128631) (not e!170701))))

(declare-fun lt!133303 () ListLongMap!3823)

(assert (=> d!63187 (= res!128631 (contains!1889 lt!133303 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133302 () List!3817)

(assert (=> d!63187 (= lt!133303 (ListLongMap!3824 lt!133302))))

(declare-fun lt!133305 () Unit!8136)

(declare-fun lt!133304 () Unit!8136)

(assert (=> d!63187 (= lt!133305 lt!133304)))

(assert (=> d!63187 (= (getValueByKey!318 lt!133302 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63187 (= lt!133304 (lemmaContainsTupThenGetReturnValue!177 lt!133302 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63187 (= lt!133302 (insertStrictlySorted!180 (toList!1927 call!25156) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63187 (= (+!713 call!25156 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) lt!133303)))

(declare-fun b!263433 () Bool)

(declare-fun res!128630 () Bool)

(assert (=> b!263433 (=> (not res!128630) (not e!170701))))

(assert (=> b!263433 (= res!128630 (= (getValueByKey!318 (toList!1927 lt!133303) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!263434 () Bool)

(assert (=> b!263434 (= e!170701 (contains!1893 (toList!1927 lt!133303) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(assert (= (and d!63187 res!128631) b!263433))

(assert (= (and b!263433 res!128630) b!263434))

(declare-fun m!279379 () Bool)

(assert (=> d!63187 m!279379))

(declare-fun m!279381 () Bool)

(assert (=> d!63187 m!279381))

(declare-fun m!279383 () Bool)

(assert (=> d!63187 m!279383))

(declare-fun m!279385 () Bool)

(assert (=> d!63187 m!279385))

(declare-fun m!279387 () Bool)

(assert (=> b!263433 m!279387))

(declare-fun m!279389 () Bool)

(assert (=> b!263434 m!279389))

(assert (=> b!262963 d!63187))

(assert (=> b!262924 d!63151))

(declare-fun d!63189 () Bool)

(declare-fun res!128632 () Bool)

(declare-fun e!170702 () Bool)

(assert (=> d!63189 (=> res!128632 e!170702)))

(assert (=> d!63189 (= res!128632 (= (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!63189 (= (arrayContainsKey!0 (_keys!7033 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!170702)))

(declare-fun b!263435 () Bool)

(declare-fun e!170703 () Bool)

(assert (=> b!263435 (= e!170702 e!170703)))

(declare-fun res!128633 () Bool)

(assert (=> b!263435 (=> (not res!128633) (not e!170703))))

(assert (=> b!263435 (= res!128633 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun b!263436 () Bool)

(assert (=> b!263436 (= e!170703 (arrayContainsKey!0 (_keys!7033 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!63189 (not res!128632)) b!263435))

(assert (= (and b!263435 res!128633) b!263436))

(assert (=> d!63189 m!278805))

(declare-fun m!279391 () Bool)

(assert (=> b!263436 m!279391))

(assert (=> b!262863 d!63189))

(assert (=> d!62993 d!62979))

(declare-fun b!263453 () Bool)

(declare-fun e!170712 () Bool)

(declare-fun e!170715 () Bool)

(assert (=> b!263453 (= e!170712 e!170715)))

(declare-fun c!44961 () Bool)

(declare-fun lt!133308 () SeekEntryResult!1193)

(assert (=> b!263453 (= c!44961 ((_ is MissingVacant!1193) lt!133308))))

(declare-fun b!263454 () Bool)

(assert (=> b!263454 (= e!170715 ((_ is Undefined!1193) lt!133308))))

(declare-fun b!263455 () Bool)

(declare-fun res!128643 () Bool)

(declare-fun e!170714 () Bool)

(assert (=> b!263455 (=> (not res!128643) (not e!170714))))

(declare-fun call!25208 () Bool)

(assert (=> b!263455 (= res!128643 call!25208)))

(assert (=> b!263455 (= e!170715 e!170714)))

(declare-fun bm!25205 () Bool)

(declare-fun c!44960 () Bool)

(assert (=> bm!25205 (= call!25208 (inRange!0 (ite c!44960 (index!6942 lt!133308) (index!6945 lt!133308)) (mask!11207 thiss!1504)))))

(declare-fun b!263456 () Bool)

(declare-fun e!170713 () Bool)

(declare-fun call!25209 () Bool)

(assert (=> b!263456 (= e!170713 (not call!25209))))

(declare-fun b!263457 () Bool)

(assert (=> b!263457 (= e!170714 (not call!25209))))

(declare-fun b!263458 () Bool)

(declare-fun res!128644 () Bool)

(assert (=> b!263458 (= res!128644 (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6942 lt!133308)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263458 (=> (not res!128644) (not e!170713))))

(declare-fun d!63191 () Bool)

(assert (=> d!63191 e!170712))

(assert (=> d!63191 (= c!44960 ((_ is MissingZero!1193) lt!133308))))

(assert (=> d!63191 (= lt!133308 (seekEntryOrOpen!0 key!932 (_keys!7033 thiss!1504) (mask!11207 thiss!1504)))))

(assert (=> d!63191 true))

(declare-fun _$34!1131 () Unit!8136)

(assert (=> d!63191 (= (choose!1299 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 (defaultEntry!4842 thiss!1504)) _$34!1131)))

(declare-fun bm!25206 () Bool)

(assert (=> bm!25206 (= call!25209 (arrayContainsKey!0 (_keys!7033 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!263459 () Bool)

(declare-fun res!128642 () Bool)

(assert (=> b!263459 (=> (not res!128642) (not e!170714))))

(assert (=> b!263459 (= res!128642 (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6945 lt!133308)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263460 () Bool)

(assert (=> b!263460 (= e!170712 e!170713)))

(declare-fun res!128645 () Bool)

(assert (=> b!263460 (= res!128645 call!25208)))

(assert (=> b!263460 (=> (not res!128645) (not e!170713))))

(assert (= (and d!63191 c!44960) b!263460))

(assert (= (and d!63191 (not c!44960)) b!263453))

(assert (= (and b!263460 res!128645) b!263458))

(assert (= (and b!263458 res!128644) b!263456))

(assert (= (and b!263453 c!44961) b!263455))

(assert (= (and b!263453 (not c!44961)) b!263454))

(assert (= (and b!263455 res!128643) b!263459))

(assert (= (and b!263459 res!128642) b!263457))

(assert (= (or b!263460 b!263455) bm!25205))

(assert (= (or b!263456 b!263457) bm!25206))

(declare-fun m!279393 () Bool)

(assert (=> b!263458 m!279393))

(declare-fun m!279395 () Bool)

(assert (=> bm!25205 m!279395))

(assert (=> d!63191 m!278351))

(assert (=> bm!25206 m!278313))

(declare-fun m!279397 () Bool)

(assert (=> b!263459 m!279397))

(assert (=> d!62993 d!63191))

(assert (=> d!62993 d!63015))

(assert (=> d!62987 d!62979))

(declare-fun d!63193 () Bool)

(declare-fun e!170718 () Bool)

(assert (=> d!63193 e!170718))

(declare-fun res!128651 () Bool)

(assert (=> d!63193 (=> (not res!128651) (not e!170718))))

(declare-fun lt!133311 () SeekEntryResult!1193)

(assert (=> d!63193 (= res!128651 ((_ is Found!1193) lt!133311))))

(assert (=> d!63193 (= lt!133311 (seekEntryOrOpen!0 key!932 (_keys!7033 thiss!1504) (mask!11207 thiss!1504)))))

(assert (=> d!63193 true))

(declare-fun _$33!186 () Unit!8136)

(assert (=> d!63193 (= (choose!1298 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 (defaultEntry!4842 thiss!1504)) _$33!186)))

(declare-fun b!263465 () Bool)

(declare-fun res!128650 () Bool)

(assert (=> b!263465 (=> (not res!128650) (not e!170718))))

(assert (=> b!263465 (= res!128650 (inRange!0 (index!6943 lt!133311) (mask!11207 thiss!1504)))))

(declare-fun b!263466 () Bool)

(assert (=> b!263466 (= e!170718 (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6943 lt!133311)) key!932))))

(assert (= (and d!63193 res!128651) b!263465))

(assert (= (and b!263465 res!128650) b!263466))

(assert (=> d!63193 m!278351))

(declare-fun m!279399 () Bool)

(assert (=> b!263465 m!279399))

(declare-fun m!279401 () Bool)

(assert (=> b!263466 m!279401))

(assert (=> d!62987 d!63193))

(assert (=> d!62987 d!63015))

(declare-fun b!263467 () Bool)

(declare-fun e!170721 () Bool)

(declare-fun e!170720 () Bool)

(assert (=> b!263467 (= e!170721 e!170720)))

(declare-fun lt!133312 () (_ BitVec 64))

(assert (=> b!263467 (= lt!133312 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!133313 () Unit!8136)

(assert (=> b!263467 (= lt!133313 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!7033 thiss!1504) lt!133312 #b00000000000000000000000000000000))))

(assert (=> b!263467 (arrayContainsKey!0 (_keys!7033 thiss!1504) lt!133312 #b00000000000000000000000000000000)))

(declare-fun lt!133314 () Unit!8136)

(assert (=> b!263467 (= lt!133314 lt!133313)))

(declare-fun res!128653 () Bool)

(assert (=> b!263467 (= res!128653 (= (seekEntryOrOpen!0 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) (_keys!7033 thiss!1504) (mask!11207 thiss!1504)) (Found!1193 #b00000000000000000000000000000000)))))

(assert (=> b!263467 (=> (not res!128653) (not e!170720))))

(declare-fun d!63195 () Bool)

(declare-fun res!128652 () Bool)

(declare-fun e!170719 () Bool)

(assert (=> d!63195 (=> res!128652 e!170719)))

(assert (=> d!63195 (= res!128652 (bvsge #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))))))

(assert (=> d!63195 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!7033 thiss!1504) (mask!11207 thiss!1504)) e!170719)))

(declare-fun b!263468 () Bool)

(declare-fun call!25210 () Bool)

(assert (=> b!263468 (= e!170720 call!25210)))

(declare-fun b!263469 () Bool)

(assert (=> b!263469 (= e!170719 e!170721)))

(declare-fun c!44962 () Bool)

(assert (=> b!263469 (= c!44962 (validKeyInArray!0 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263470 () Bool)

(assert (=> b!263470 (= e!170721 call!25210)))

(declare-fun bm!25207 () Bool)

(assert (=> bm!25207 (= call!25210 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!7033 thiss!1504) (mask!11207 thiss!1504)))))

(assert (= (and d!63195 (not res!128652)) b!263469))

(assert (= (and b!263469 c!44962) b!263467))

(assert (= (and b!263469 (not c!44962)) b!263470))

(assert (= (and b!263467 res!128653) b!263468))

(assert (= (or b!263468 b!263470) bm!25207))

(assert (=> b!263467 m!278517))

(declare-fun m!279403 () Bool)

(assert (=> b!263467 m!279403))

(declare-fun m!279405 () Bool)

(assert (=> b!263467 m!279405))

(assert (=> b!263467 m!278517))

(declare-fun m!279407 () Bool)

(assert (=> b!263467 m!279407))

(assert (=> b!263469 m!278517))

(assert (=> b!263469 m!278517))

(assert (=> b!263469 m!278581))

(declare-fun m!279409 () Bool)

(assert (=> bm!25207 m!279409))

(assert (=> b!263057 d!63195))

(assert (=> bm!25158 d!63077))

(declare-fun b!263472 () Bool)

(declare-fun e!170722 () Option!324)

(declare-fun e!170723 () Option!324)

(assert (=> b!263472 (= e!170722 e!170723)))

(declare-fun c!44964 () Bool)

(assert (=> b!263472 (= c!44964 (and ((_ is Cons!3813) (toList!1927 lt!133073)) (not (= (_1!2471 (h!4479 (toList!1927 lt!133073))) (_1!2471 lt!132765)))))))

(declare-fun b!263474 () Bool)

(assert (=> b!263474 (= e!170723 None!322)))

(declare-fun d!63197 () Bool)

(declare-fun c!44963 () Bool)

(assert (=> d!63197 (= c!44963 (and ((_ is Cons!3813) (toList!1927 lt!133073)) (= (_1!2471 (h!4479 (toList!1927 lt!133073))) (_1!2471 lt!132765))))))

(assert (=> d!63197 (= (getValueByKey!318 (toList!1927 lt!133073) (_1!2471 lt!132765)) e!170722)))

(declare-fun b!263471 () Bool)

(assert (=> b!263471 (= e!170722 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!133073)))))))

(declare-fun b!263473 () Bool)

(assert (=> b!263473 (= e!170723 (getValueByKey!318 (t!8885 (toList!1927 lt!133073)) (_1!2471 lt!132765)))))

(assert (= (and d!63197 c!44963) b!263471))

(assert (= (and d!63197 (not c!44963)) b!263472))

(assert (= (and b!263472 c!44964) b!263473))

(assert (= (and b!263472 (not c!44964)) b!263474))

(declare-fun m!279411 () Bool)

(assert (=> b!263473 m!279411))

(assert (=> b!263077 d!63197))

(declare-fun d!63199 () Bool)

(declare-fun res!128654 () Bool)

(declare-fun e!170724 () Bool)

(assert (=> d!63199 (=> res!128654 e!170724)))

(assert (=> d!63199 (= res!128654 (= (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!63199 (= (arrayContainsKey!0 lt!132768 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!170724)))

(declare-fun b!263475 () Bool)

(declare-fun e!170725 () Bool)

(assert (=> b!263475 (= e!170724 e!170725)))

(declare-fun res!128655 () Bool)

(assert (=> b!263475 (=> (not res!128655) (not e!170725))))

(assert (=> b!263475 (= res!128655 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6344 lt!132768)))))

(declare-fun b!263476 () Bool)

(assert (=> b!263476 (= e!170725 (arrayContainsKey!0 lt!132768 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!63199 (not res!128654)) b!263475))

(assert (= (and b!263475 res!128655) b!263476))

(assert (=> d!63199 m!279299))

(declare-fun m!279413 () Bool)

(assert (=> b!263476 m!279413))

(assert (=> b!263034 d!63199))

(declare-fun d!63201 () Bool)

(declare-fun e!170726 () Bool)

(assert (=> d!63201 e!170726))

(declare-fun res!128656 () Bool)

(assert (=> d!63201 (=> res!128656 e!170726)))

(declare-fun lt!133318 () Bool)

(assert (=> d!63201 (= res!128656 (not lt!133318))))

(declare-fun lt!133316 () Bool)

(assert (=> d!63201 (= lt!133318 lt!133316)))

(declare-fun lt!133315 () Unit!8136)

(declare-fun e!170727 () Unit!8136)

(assert (=> d!63201 (= lt!133315 e!170727)))

(declare-fun c!44965 () Bool)

(assert (=> d!63201 (= c!44965 lt!133316)))

(assert (=> d!63201 (= lt!133316 (containsKey!310 (toList!1927 lt!133021) (_1!2471 lt!132765)))))

(assert (=> d!63201 (= (contains!1889 lt!133021 (_1!2471 lt!132765)) lt!133318)))

(declare-fun b!263477 () Bool)

(declare-fun lt!133317 () Unit!8136)

(assert (=> b!263477 (= e!170727 lt!133317)))

(assert (=> b!263477 (= lt!133317 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133021) (_1!2471 lt!132765)))))

(assert (=> b!263477 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133021) (_1!2471 lt!132765)))))

(declare-fun b!263478 () Bool)

(declare-fun Unit!8167 () Unit!8136)

(assert (=> b!263478 (= e!170727 Unit!8167)))

(declare-fun b!263479 () Bool)

(assert (=> b!263479 (= e!170726 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133021) (_1!2471 lt!132765))))))

(assert (= (and d!63201 c!44965) b!263477))

(assert (= (and d!63201 (not c!44965)) b!263478))

(assert (= (and d!63201 (not res!128656)) b!263479))

(declare-fun m!279415 () Bool)

(assert (=> d!63201 m!279415))

(declare-fun m!279417 () Bool)

(assert (=> b!263477 m!279417))

(assert (=> b!263477 m!278665))

(assert (=> b!263477 m!278665))

(declare-fun m!279419 () Bool)

(assert (=> b!263477 m!279419))

(assert (=> b!263479 m!278665))

(assert (=> b!263479 m!278665))

(assert (=> b!263479 m!279419))

(assert (=> d!62949 d!63201))

(declare-fun b!263481 () Bool)

(declare-fun e!170728 () Option!324)

(declare-fun e!170729 () Option!324)

(assert (=> b!263481 (= e!170728 e!170729)))

(declare-fun c!44967 () Bool)

(assert (=> b!263481 (= c!44967 (and ((_ is Cons!3813) lt!133020) (not (= (_1!2471 (h!4479 lt!133020)) (_1!2471 lt!132765)))))))

(declare-fun b!263483 () Bool)

(assert (=> b!263483 (= e!170729 None!322)))

(declare-fun d!63203 () Bool)

(declare-fun c!44966 () Bool)

(assert (=> d!63203 (= c!44966 (and ((_ is Cons!3813) lt!133020) (= (_1!2471 (h!4479 lt!133020)) (_1!2471 lt!132765))))))

(assert (=> d!63203 (= (getValueByKey!318 lt!133020 (_1!2471 lt!132765)) e!170728)))

(declare-fun b!263480 () Bool)

(assert (=> b!263480 (= e!170728 (Some!323 (_2!2471 (h!4479 lt!133020))))))

(declare-fun b!263482 () Bool)

(assert (=> b!263482 (= e!170729 (getValueByKey!318 (t!8885 lt!133020) (_1!2471 lt!132765)))))

(assert (= (and d!63203 c!44966) b!263480))

(assert (= (and d!63203 (not c!44966)) b!263481))

(assert (= (and b!263481 c!44967) b!263482))

(assert (= (and b!263481 (not c!44967)) b!263483))

(declare-fun m!279421 () Bool)

(assert (=> b!263482 m!279421))

(assert (=> d!62949 d!63203))

(declare-fun d!63205 () Bool)

(assert (=> d!63205 (= (getValueByKey!318 lt!133020 (_1!2471 lt!132765)) (Some!323 (_2!2471 lt!132765)))))

(declare-fun lt!133321 () Unit!8136)

(declare-fun choose!1303 (List!3817 (_ BitVec 64) V!8521) Unit!8136)

(assert (=> d!63205 (= lt!133321 (choose!1303 lt!133020 (_1!2471 lt!132765) (_2!2471 lt!132765)))))

(declare-fun e!170732 () Bool)

(assert (=> d!63205 e!170732))

(declare-fun res!128661 () Bool)

(assert (=> d!63205 (=> (not res!128661) (not e!170732))))

(assert (=> d!63205 (= res!128661 (isStrictlySorted!372 lt!133020))))

(assert (=> d!63205 (= (lemmaContainsTupThenGetReturnValue!177 lt!133020 (_1!2471 lt!132765) (_2!2471 lt!132765)) lt!133321)))

(declare-fun b!263488 () Bool)

(declare-fun res!128662 () Bool)

(assert (=> b!263488 (=> (not res!128662) (not e!170732))))

(assert (=> b!263488 (= res!128662 (containsKey!310 lt!133020 (_1!2471 lt!132765)))))

(declare-fun b!263489 () Bool)

(assert (=> b!263489 (= e!170732 (contains!1893 lt!133020 (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))))))

(assert (= (and d!63205 res!128661) b!263488))

(assert (= (and b!263488 res!128662) b!263489))

(assert (=> d!63205 m!278659))

(declare-fun m!279423 () Bool)

(assert (=> d!63205 m!279423))

(declare-fun m!279425 () Bool)

(assert (=> d!63205 m!279425))

(declare-fun m!279427 () Bool)

(assert (=> b!263488 m!279427))

(declare-fun m!279429 () Bool)

(assert (=> b!263489 m!279429))

(assert (=> d!62949 d!63205))

(declare-fun b!263510 () Bool)

(declare-fun e!170744 () List!3817)

(declare-fun call!25217 () List!3817)

(assert (=> b!263510 (= e!170744 call!25217)))

(declare-fun b!263511 () Bool)

(declare-fun e!170746 () List!3817)

(declare-fun call!25218 () List!3817)

(assert (=> b!263511 (= e!170746 call!25218)))

(declare-fun c!44977 () Bool)

(declare-fun e!170747 () List!3817)

(declare-fun b!263512 () Bool)

(declare-fun c!44978 () Bool)

(assert (=> b!263512 (= e!170747 (ite c!44978 (t!8885 (toList!1927 lt!132763)) (ite c!44977 (Cons!3813 (h!4479 (toList!1927 lt!132763)) (t!8885 (toList!1927 lt!132763))) Nil!3814)))))

(declare-fun b!263513 () Bool)

(declare-fun e!170743 () Bool)

(declare-fun lt!133324 () List!3817)

(assert (=> b!263513 (= e!170743 (contains!1893 lt!133324 (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))))))

(declare-fun bm!25214 () Bool)

(declare-fun call!25219 () List!3817)

(assert (=> bm!25214 (= call!25219 call!25217)))

(declare-fun b!263514 () Bool)

(declare-fun res!128668 () Bool)

(assert (=> b!263514 (=> (not res!128668) (not e!170743))))

(assert (=> b!263514 (= res!128668 (containsKey!310 lt!133324 (_1!2471 lt!132765)))))

(declare-fun b!263515 () Bool)

(assert (=> b!263515 (= e!170746 call!25218)))

(declare-fun b!263516 () Bool)

(assert (=> b!263516 (= e!170747 (insertStrictlySorted!180 (t!8885 (toList!1927 lt!132763)) (_1!2471 lt!132765) (_2!2471 lt!132765)))))

(declare-fun d!63207 () Bool)

(assert (=> d!63207 e!170743))

(declare-fun res!128667 () Bool)

(assert (=> d!63207 (=> (not res!128667) (not e!170743))))

(assert (=> d!63207 (= res!128667 (isStrictlySorted!372 lt!133324))))

(assert (=> d!63207 (= lt!133324 e!170744)))

(declare-fun c!44979 () Bool)

(assert (=> d!63207 (= c!44979 (and ((_ is Cons!3813) (toList!1927 lt!132763)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!132763))) (_1!2471 lt!132765))))))

(assert (=> d!63207 (isStrictlySorted!372 (toList!1927 lt!132763))))

(assert (=> d!63207 (= (insertStrictlySorted!180 (toList!1927 lt!132763) (_1!2471 lt!132765) (_2!2471 lt!132765)) lt!133324)))

(declare-fun b!263517 () Bool)

(assert (=> b!263517 (= c!44977 (and ((_ is Cons!3813) (toList!1927 lt!132763)) (bvsgt (_1!2471 (h!4479 (toList!1927 lt!132763))) (_1!2471 lt!132765))))))

(declare-fun e!170745 () List!3817)

(assert (=> b!263517 (= e!170745 e!170746)))

(declare-fun bm!25215 () Bool)

(declare-fun $colon$colon!107 (List!3817 tuple2!4920) List!3817)

(assert (=> bm!25215 (= call!25217 ($colon$colon!107 e!170747 (ite c!44979 (h!4479 (toList!1927 lt!132763)) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765)))))))

(declare-fun c!44976 () Bool)

(assert (=> bm!25215 (= c!44976 c!44979)))

(declare-fun bm!25216 () Bool)

(assert (=> bm!25216 (= call!25218 call!25219)))

(declare-fun b!263518 () Bool)

(assert (=> b!263518 (= e!170745 call!25219)))

(declare-fun b!263519 () Bool)

(assert (=> b!263519 (= e!170744 e!170745)))

(assert (=> b!263519 (= c!44978 (and ((_ is Cons!3813) (toList!1927 lt!132763)) (= (_1!2471 (h!4479 (toList!1927 lt!132763))) (_1!2471 lt!132765))))))

(assert (= (and d!63207 c!44979) b!263510))

(assert (= (and d!63207 (not c!44979)) b!263519))

(assert (= (and b!263519 c!44978) b!263518))

(assert (= (and b!263519 (not c!44978)) b!263517))

(assert (= (and b!263517 c!44977) b!263515))

(assert (= (and b!263517 (not c!44977)) b!263511))

(assert (= (or b!263515 b!263511) bm!25216))

(assert (= (or b!263518 bm!25216) bm!25214))

(assert (= (or b!263510 bm!25214) bm!25215))

(assert (= (and bm!25215 c!44976) b!263516))

(assert (= (and bm!25215 (not c!44976)) b!263512))

(assert (= (and d!63207 res!128667) b!263514))

(assert (= (and b!263514 res!128668) b!263513))

(declare-fun m!279431 () Bool)

(assert (=> b!263516 m!279431))

(declare-fun m!279433 () Bool)

(assert (=> bm!25215 m!279433))

(declare-fun m!279435 () Bool)

(assert (=> b!263513 m!279435))

(declare-fun m!279437 () Bool)

(assert (=> b!263514 m!279437))

(declare-fun m!279439 () Bool)

(assert (=> d!63207 m!279439))

(assert (=> d!63207 m!279355))

(assert (=> d!62949 d!63207))

(assert (=> bm!25148 d!63115))

(assert (=> d!62945 d!63015))

(declare-fun d!63209 () Bool)

(declare-fun e!170748 () Bool)

(assert (=> d!63209 e!170748))

(declare-fun res!128669 () Bool)

(assert (=> d!63209 (=> res!128669 e!170748)))

(declare-fun lt!133328 () Bool)

(assert (=> d!63209 (= res!128669 (not lt!133328))))

(declare-fun lt!133326 () Bool)

(assert (=> d!63209 (= lt!133328 lt!133326)))

(declare-fun lt!133325 () Unit!8136)

(declare-fun e!170749 () Unit!8136)

(assert (=> d!63209 (= lt!133325 e!170749)))

(declare-fun c!44980 () Bool)

(assert (=> d!63209 (= c!44980 lt!133326)))

(assert (=> d!63209 (= lt!133326 (containsKey!310 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932))))

(assert (=> d!63209 (= (contains!1889 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) key!932) lt!133328)))

(declare-fun b!263520 () Bool)

(declare-fun lt!133327 () Unit!8136)

(assert (=> b!263520 (= e!170749 lt!133327)))

(assert (=> b!263520 (= lt!133327 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932))))

(assert (=> b!263520 (isDefined!260 (getValueByKey!318 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932))))

(declare-fun b!263521 () Bool)

(declare-fun Unit!8168 () Unit!8136)

(assert (=> b!263521 (= e!170749 Unit!8168)))

(declare-fun b!263522 () Bool)

(assert (=> b!263522 (= e!170748 (isDefined!260 (getValueByKey!318 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932)))))

(assert (= (and d!63209 c!44980) b!263520))

(assert (= (and d!63209 (not c!44980)) b!263521))

(assert (= (and d!63209 (not res!128669)) b!263522))

(declare-fun m!279441 () Bool)

(assert (=> d!63209 m!279441))

(declare-fun m!279443 () Bool)

(assert (=> b!263520 m!279443))

(declare-fun m!279445 () Bool)

(assert (=> b!263520 m!279445))

(assert (=> b!263520 m!279445))

(declare-fun m!279447 () Bool)

(assert (=> b!263520 m!279447))

(assert (=> b!263522 m!279445))

(assert (=> b!263522 m!279445))

(assert (=> b!263522 m!279447))

(assert (=> d!62981 d!63209))

(assert (=> d!62981 d!62935))

(declare-fun d!63211 () Bool)

(assert (=> d!63211 (contains!1889 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) key!932)))

(assert (=> d!63211 true))

(declare-fun _$17!95 () Unit!8136)

(assert (=> d!63211 (= (choose!1297 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) _$17!95)))

(declare-fun bs!9254 () Bool)

(assert (= bs!9254 d!63211))

(assert (=> bs!9254 m!278293))

(assert (=> bs!9254 m!278293))

(assert (=> bs!9254 m!278749))

(assert (=> d!62981 d!63211))

(assert (=> d!62981 d!63015))

(assert (=> b!263014 d!63001))

(declare-fun d!63213 () Bool)

(declare-fun e!170750 () Bool)

(assert (=> d!63213 e!170750))

(declare-fun res!128670 () Bool)

(assert (=> d!63213 (=> res!128670 e!170750)))

(declare-fun lt!133332 () Bool)

(assert (=> d!63213 (= res!128670 (not lt!133332))))

(declare-fun lt!133330 () Bool)

(assert (=> d!63213 (= lt!133332 lt!133330)))

(declare-fun lt!133329 () Unit!8136)

(declare-fun e!170751 () Unit!8136)

(assert (=> d!63213 (= lt!133329 e!170751)))

(declare-fun c!44981 () Bool)

(assert (=> d!63213 (= c!44981 lt!133330)))

(assert (=> d!63213 (= lt!133330 (containsKey!310 (toList!1927 lt!133073) (_1!2471 lt!132765)))))

(assert (=> d!63213 (= (contains!1889 lt!133073 (_1!2471 lt!132765)) lt!133332)))

(declare-fun b!263523 () Bool)

(declare-fun lt!133331 () Unit!8136)

(assert (=> b!263523 (= e!170751 lt!133331)))

(assert (=> b!263523 (= lt!133331 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133073) (_1!2471 lt!132765)))))

(assert (=> b!263523 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133073) (_1!2471 lt!132765)))))

(declare-fun b!263524 () Bool)

(declare-fun Unit!8169 () Unit!8136)

(assert (=> b!263524 (= e!170751 Unit!8169)))

(declare-fun b!263525 () Bool)

(assert (=> b!263525 (= e!170750 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133073) (_1!2471 lt!132765))))))

(assert (= (and d!63213 c!44981) b!263523))

(assert (= (and d!63213 (not c!44981)) b!263524))

(assert (= (and d!63213 (not res!128670)) b!263525))

(declare-fun m!279449 () Bool)

(assert (=> d!63213 m!279449))

(declare-fun m!279451 () Bool)

(assert (=> b!263523 m!279451))

(assert (=> b!263523 m!278761))

(assert (=> b!263523 m!278761))

(declare-fun m!279453 () Bool)

(assert (=> b!263523 m!279453))

(assert (=> b!263525 m!278761))

(assert (=> b!263525 m!278761))

(assert (=> b!263525 m!279453))

(assert (=> d!62983 d!63213))

(declare-fun b!263527 () Bool)

(declare-fun e!170752 () Option!324)

(declare-fun e!170753 () Option!324)

(assert (=> b!263527 (= e!170752 e!170753)))

(declare-fun c!44983 () Bool)

(assert (=> b!263527 (= c!44983 (and ((_ is Cons!3813) lt!133072) (not (= (_1!2471 (h!4479 lt!133072)) (_1!2471 lt!132765)))))))

(declare-fun b!263529 () Bool)

(assert (=> b!263529 (= e!170753 None!322)))

(declare-fun d!63215 () Bool)

(declare-fun c!44982 () Bool)

(assert (=> d!63215 (= c!44982 (and ((_ is Cons!3813) lt!133072) (= (_1!2471 (h!4479 lt!133072)) (_1!2471 lt!132765))))))

(assert (=> d!63215 (= (getValueByKey!318 lt!133072 (_1!2471 lt!132765)) e!170752)))

(declare-fun b!263526 () Bool)

(assert (=> b!263526 (= e!170752 (Some!323 (_2!2471 (h!4479 lt!133072))))))

(declare-fun b!263528 () Bool)

(assert (=> b!263528 (= e!170753 (getValueByKey!318 (t!8885 lt!133072) (_1!2471 lt!132765)))))

(assert (= (and d!63215 c!44982) b!263526))

(assert (= (and d!63215 (not c!44982)) b!263527))

(assert (= (and b!263527 c!44983) b!263528))

(assert (= (and b!263527 (not c!44983)) b!263529))

(declare-fun m!279455 () Bool)

(assert (=> b!263528 m!279455))

(assert (=> d!62983 d!63215))

(declare-fun d!63217 () Bool)

(assert (=> d!63217 (= (getValueByKey!318 lt!133072 (_1!2471 lt!132765)) (Some!323 (_2!2471 lt!132765)))))

(declare-fun lt!133333 () Unit!8136)

(assert (=> d!63217 (= lt!133333 (choose!1303 lt!133072 (_1!2471 lt!132765) (_2!2471 lt!132765)))))

(declare-fun e!170754 () Bool)

(assert (=> d!63217 e!170754))

(declare-fun res!128671 () Bool)

(assert (=> d!63217 (=> (not res!128671) (not e!170754))))

(assert (=> d!63217 (= res!128671 (isStrictlySorted!372 lt!133072))))

(assert (=> d!63217 (= (lemmaContainsTupThenGetReturnValue!177 lt!133072 (_1!2471 lt!132765) (_2!2471 lt!132765)) lt!133333)))

(declare-fun b!263530 () Bool)

(declare-fun res!128672 () Bool)

(assert (=> b!263530 (=> (not res!128672) (not e!170754))))

(assert (=> b!263530 (= res!128672 (containsKey!310 lt!133072 (_1!2471 lt!132765)))))

(declare-fun b!263531 () Bool)

(assert (=> b!263531 (= e!170754 (contains!1893 lt!133072 (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))))))

(assert (= (and d!63217 res!128671) b!263530))

(assert (= (and b!263530 res!128672) b!263531))

(assert (=> d!63217 m!278755))

(declare-fun m!279457 () Bool)

(assert (=> d!63217 m!279457))

(declare-fun m!279459 () Bool)

(assert (=> d!63217 m!279459))

(declare-fun m!279461 () Bool)

(assert (=> b!263530 m!279461))

(declare-fun m!279463 () Bool)

(assert (=> b!263531 m!279463))

(assert (=> d!62983 d!63217))

(declare-fun b!263532 () Bool)

(declare-fun e!170756 () List!3817)

(declare-fun call!25220 () List!3817)

(assert (=> b!263532 (= e!170756 call!25220)))

(declare-fun b!263533 () Bool)

(declare-fun e!170758 () List!3817)

(declare-fun call!25221 () List!3817)

(assert (=> b!263533 (= e!170758 call!25221)))

(declare-fun c!44985 () Bool)

(declare-fun c!44986 () Bool)

(declare-fun b!263534 () Bool)

(declare-fun e!170759 () List!3817)

(assert (=> b!263534 (= e!170759 (ite c!44986 (t!8885 (toList!1927 (map!2737 thiss!1504))) (ite c!44985 (Cons!3813 (h!4479 (toList!1927 (map!2737 thiss!1504))) (t!8885 (toList!1927 (map!2737 thiss!1504)))) Nil!3814)))))

(declare-fun b!263535 () Bool)

(declare-fun e!170755 () Bool)

(declare-fun lt!133334 () List!3817)

(assert (=> b!263535 (= e!170755 (contains!1893 lt!133334 (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))))))

(declare-fun bm!25217 () Bool)

(declare-fun call!25222 () List!3817)

(assert (=> bm!25217 (= call!25222 call!25220)))

(declare-fun b!263536 () Bool)

(declare-fun res!128674 () Bool)

(assert (=> b!263536 (=> (not res!128674) (not e!170755))))

(assert (=> b!263536 (= res!128674 (containsKey!310 lt!133334 (_1!2471 lt!132765)))))

(declare-fun b!263537 () Bool)

(assert (=> b!263537 (= e!170758 call!25221)))

(declare-fun b!263538 () Bool)

(assert (=> b!263538 (= e!170759 (insertStrictlySorted!180 (t!8885 (toList!1927 (map!2737 thiss!1504))) (_1!2471 lt!132765) (_2!2471 lt!132765)))))

(declare-fun d!63219 () Bool)

(assert (=> d!63219 e!170755))

(declare-fun res!128673 () Bool)

(assert (=> d!63219 (=> (not res!128673) (not e!170755))))

(assert (=> d!63219 (= res!128673 (isStrictlySorted!372 lt!133334))))

(assert (=> d!63219 (= lt!133334 e!170756)))

(declare-fun c!44987 () Bool)

(assert (=> d!63219 (= c!44987 (and ((_ is Cons!3813) (toList!1927 (map!2737 thiss!1504))) (bvslt (_1!2471 (h!4479 (toList!1927 (map!2737 thiss!1504)))) (_1!2471 lt!132765))))))

(assert (=> d!63219 (isStrictlySorted!372 (toList!1927 (map!2737 thiss!1504)))))

(assert (=> d!63219 (= (insertStrictlySorted!180 (toList!1927 (map!2737 thiss!1504)) (_1!2471 lt!132765) (_2!2471 lt!132765)) lt!133334)))

(declare-fun b!263539 () Bool)

(assert (=> b!263539 (= c!44985 (and ((_ is Cons!3813) (toList!1927 (map!2737 thiss!1504))) (bvsgt (_1!2471 (h!4479 (toList!1927 (map!2737 thiss!1504)))) (_1!2471 lt!132765))))))

(declare-fun e!170757 () List!3817)

(assert (=> b!263539 (= e!170757 e!170758)))

(declare-fun bm!25218 () Bool)

(assert (=> bm!25218 (= call!25220 ($colon$colon!107 e!170759 (ite c!44987 (h!4479 (toList!1927 (map!2737 thiss!1504))) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765)))))))

(declare-fun c!44984 () Bool)

(assert (=> bm!25218 (= c!44984 c!44987)))

(declare-fun bm!25219 () Bool)

(assert (=> bm!25219 (= call!25221 call!25222)))

(declare-fun b!263540 () Bool)

(assert (=> b!263540 (= e!170757 call!25222)))

(declare-fun b!263541 () Bool)

(assert (=> b!263541 (= e!170756 e!170757)))

(assert (=> b!263541 (= c!44986 (and ((_ is Cons!3813) (toList!1927 (map!2737 thiss!1504))) (= (_1!2471 (h!4479 (toList!1927 (map!2737 thiss!1504)))) (_1!2471 lt!132765))))))

(assert (= (and d!63219 c!44987) b!263532))

(assert (= (and d!63219 (not c!44987)) b!263541))

(assert (= (and b!263541 c!44986) b!263540))

(assert (= (and b!263541 (not c!44986)) b!263539))

(assert (= (and b!263539 c!44985) b!263537))

(assert (= (and b!263539 (not c!44985)) b!263533))

(assert (= (or b!263537 b!263533) bm!25219))

(assert (= (or b!263540 bm!25219) bm!25217))

(assert (= (or b!263532 bm!25217) bm!25218))

(assert (= (and bm!25218 c!44984) b!263538))

(assert (= (and bm!25218 (not c!44984)) b!263534))

(assert (= (and d!63219 res!128673) b!263536))

(assert (= (and b!263536 res!128674) b!263535))

(declare-fun m!279465 () Bool)

(assert (=> b!263538 m!279465))

(declare-fun m!279467 () Bool)

(assert (=> bm!25218 m!279467))

(declare-fun m!279469 () Bool)

(assert (=> b!263535 m!279469))

(declare-fun m!279471 () Bool)

(assert (=> b!263536 m!279471))

(declare-fun m!279473 () Bool)

(assert (=> d!63219 m!279473))

(declare-fun m!279475 () Bool)

(assert (=> d!63219 m!279475))

(assert (=> d!62983 d!63219))

(assert (=> d!62985 d!62935))

(declare-fun b!263543 () Bool)

(declare-fun res!128678 () Bool)

(declare-fun e!170760 () Bool)

(assert (=> b!263543 (=> (not res!128678) (not e!170760))))

(assert (=> b!263543 (= res!128678 (bvsge (size!6349 thiss!1504) (_size!1983 thiss!1504)))))

(declare-fun b!263544 () Bool)

(declare-fun res!128676 () Bool)

(assert (=> b!263544 (=> (not res!128676) (not e!170760))))

(assert (=> b!263544 (= res!128676 (= (size!6349 thiss!1504) (bvadd (_size!1983 thiss!1504) (bvsdiv (bvadd (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!263542 () Bool)

(declare-fun res!128677 () Bool)

(assert (=> b!263542 (=> (not res!128677) (not e!170760))))

(assert (=> b!263542 (= res!128677 (and (= (size!6343 (_values!4825 thiss!1504)) (bvadd (mask!11207 thiss!1504) #b00000000000000000000000000000001)) (= (size!6344 (_keys!7033 thiss!1504)) (size!6343 (_values!4825 thiss!1504))) (bvsge (_size!1983 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1983 thiss!1504) (bvadd (mask!11207 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun d!63221 () Bool)

(declare-fun res!128675 () Bool)

(assert (=> d!63221 (=> (not res!128675) (not e!170760))))

(assert (=> d!63221 (= res!128675 (validMask!0 (mask!11207 thiss!1504)))))

(assert (=> d!63221 (= (simpleValid!285 thiss!1504) e!170760)))

(declare-fun b!263545 () Bool)

(assert (=> b!263545 (= e!170760 (and (bvsge (extraKeys!4579 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4579 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1983 thiss!1504) #b00000000000000000000000000000000)))))

(assert (= (and d!63221 res!128675) b!263542))

(assert (= (and b!263542 res!128677) b!263543))

(assert (= (and b!263543 res!128678) b!263544))

(assert (= (and b!263544 res!128676) b!263545))

(declare-fun m!279477 () Bool)

(assert (=> b!263543 m!279477))

(assert (=> b!263544 m!279477))

(assert (=> d!63221 m!278579))

(assert (=> d!62977 d!63221))

(declare-fun b!263546 () Bool)

(declare-fun e!170763 () Bool)

(declare-fun e!170762 () Bool)

(assert (=> b!263546 (= e!170763 e!170762)))

(declare-fun lt!133335 () (_ BitVec 64))

(assert (=> b!263546 (= lt!133335 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!133336 () Unit!8136)

(assert (=> b!263546 (= lt!133336 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132768 lt!133335 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!263546 (arrayContainsKey!0 lt!132768 lt!133335 #b00000000000000000000000000000000)))

(declare-fun lt!133337 () Unit!8136)

(assert (=> b!263546 (= lt!133337 lt!133336)))

(declare-fun res!128680 () Bool)

(assert (=> b!263546 (= res!128680 (= (seekEntryOrOpen!0 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!132768 (mask!11207 thiss!1504)) (Found!1193 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!263546 (=> (not res!128680) (not e!170762))))

(declare-fun d!63223 () Bool)

(declare-fun res!128679 () Bool)

(declare-fun e!170761 () Bool)

(assert (=> d!63223 (=> res!128679 e!170761)))

(assert (=> d!63223 (= res!128679 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 lt!132768)))))

(assert (=> d!63223 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!132768 (mask!11207 thiss!1504)) e!170761)))

(declare-fun b!263547 () Bool)

(declare-fun call!25223 () Bool)

(assert (=> b!263547 (= e!170762 call!25223)))

(declare-fun b!263548 () Bool)

(assert (=> b!263548 (= e!170761 e!170763)))

(declare-fun c!44988 () Bool)

(assert (=> b!263548 (= c!44988 (validKeyInArray!0 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263549 () Bool)

(assert (=> b!263549 (= e!170763 call!25223)))

(declare-fun bm!25220 () Bool)

(assert (=> bm!25220 (= call!25223 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!132768 (mask!11207 thiss!1504)))))

(assert (= (and d!63223 (not res!128679)) b!263548))

(assert (= (and b!263548 c!44988) b!263546))

(assert (= (and b!263548 (not c!44988)) b!263549))

(assert (= (and b!263546 res!128680) b!263547))

(assert (= (or b!263547 b!263549) bm!25220))

(assert (=> b!263546 m!279299))

(declare-fun m!279479 () Bool)

(assert (=> b!263546 m!279479))

(declare-fun m!279481 () Bool)

(assert (=> b!263546 m!279481))

(assert (=> b!263546 m!279299))

(declare-fun m!279483 () Bool)

(assert (=> b!263546 m!279483))

(assert (=> b!263548 m!279299))

(assert (=> b!263548 m!279299))

(assert (=> b!263548 m!279301))

(declare-fun m!279485 () Bool)

(assert (=> bm!25220 m!279485))

(assert (=> bm!25164 d!63223))

(declare-fun d!63225 () Bool)

(assert (=> d!63225 (= (apply!262 lt!133003 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)) (get!3088 (getValueByKey!318 (toList!1927 lt!133003) (select (arr!5992 lt!132768) #b00000000000000000000000000000000))))))

(declare-fun bs!9255 () Bool)

(assert (= bs!9255 d!63225))

(assert (=> bs!9255 m!278587))

(assert (=> bs!9255 m!278939))

(assert (=> bs!9255 m!278939))

(declare-fun m!279487 () Bool)

(assert (=> bs!9255 m!279487))

(assert (=> b!262968 d!63225))

(declare-fun d!63227 () Bool)

(declare-fun c!44991 () Bool)

(assert (=> d!63227 (= c!44991 ((_ is ValueCellFull!2984) (select (arr!5991 lt!132766) #b00000000000000000000000000000000)))))

(declare-fun e!170766 () V!8521)

(assert (=> d!63227 (= (get!3087 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!170766)))

(declare-fun b!263554 () Bool)

(declare-fun get!3089 (ValueCell!2984 V!8521) V!8521)

(assert (=> b!263554 (= e!170766 (get!3089 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263555 () Bool)

(declare-fun get!3090 (ValueCell!2984 V!8521) V!8521)

(assert (=> b!263555 (= e!170766 (get!3090 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63227 c!44991) b!263554))

(assert (= (and d!63227 (not c!44991)) b!263555))

(assert (=> b!263554 m!278633))

(assert (=> b!263554 m!278569))

(declare-fun m!279489 () Bool)

(assert (=> b!263554 m!279489))

(assert (=> b!263555 m!278633))

(assert (=> b!263555 m!278569))

(declare-fun m!279491 () Bool)

(assert (=> b!263555 m!279491))

(assert (=> b!262968 d!63227))

(assert (=> d!62935 d!63015))

(declare-fun d!63229 () Bool)

(assert (=> d!63229 (= (apply!262 lt!132981 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)) (get!3088 (getValueByKey!318 (toList!1927 lt!132981) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9256 () Bool)

(assert (= bs!9256 d!63229))

(assert (=> bs!9256 m!278517))

(assert (=> bs!9256 m!278947))

(assert (=> bs!9256 m!278947))

(declare-fun m!279493 () Bool)

(assert (=> bs!9256 m!279493))

(assert (=> b!262930 d!63229))

(declare-fun d!63231 () Bool)

(declare-fun c!44992 () Bool)

(assert (=> d!63231 (= c!44992 ((_ is ValueCellFull!2984) (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!170767 () V!8521)

(assert (=> d!63231 (= (get!3087 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!170767)))

(declare-fun b!263556 () Bool)

(assert (=> b!263556 (= e!170767 (get!3089 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263557 () Bool)

(assert (=> b!263557 (= e!170767 (get!3090 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63231 c!44992) b!263556))

(assert (= (and d!63231 (not c!44992)) b!263557))

(assert (=> b!263556 m!278567))

(assert (=> b!263556 m!278569))

(declare-fun m!279495 () Bool)

(assert (=> b!263556 m!279495))

(assert (=> b!263557 m!278567))

(assert (=> b!263557 m!278569))

(declare-fun m!279497 () Bool)

(assert (=> b!263557 m!279497))

(assert (=> b!262930 d!63231))

(declare-fun d!63233 () Bool)

(assert (=> d!63233 (= (arrayCountValidKeys!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!7033 thiss!1504) #b00000000000000000000000000000000 (size!6344 (_keys!7033 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!63233 true))

(declare-fun _$84!48 () Unit!8136)

(assert (=> d!63233 (= (choose!1 (_keys!7033 thiss!1504) index!297 key!932) _$84!48)))

(declare-fun bs!9257 () Bool)

(assert (= bs!9257 d!63233))

(assert (=> bs!9257 m!278327))

(assert (=> bs!9257 m!278655))

(assert (=> bs!9257 m!278329))

(assert (=> d!62947 d!63233))

(declare-fun b!263558 () Bool)

(declare-fun e!170769 () (_ BitVec 32))

(declare-fun call!25224 () (_ BitVec 32))

(assert (=> b!263558 (= e!170769 call!25224)))

(declare-fun bm!25221 () Bool)

(assert (=> bm!25221 (= call!25224 (arrayCountValidKeys!0 lt!132768 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!263559 () Bool)

(declare-fun e!170768 () (_ BitVec 32))

(assert (=> b!263559 (= e!170768 e!170769)))

(declare-fun c!44994 () Bool)

(assert (=> b!263559 (= c!44994 (validKeyInArray!0 (select (arr!5992 lt!132768) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun b!263560 () Bool)

(assert (=> b!263560 (= e!170768 #b00000000000000000000000000000000)))

(declare-fun b!263561 () Bool)

(assert (=> b!263561 (= e!170769 (bvadd #b00000000000000000000000000000001 call!25224))))

(declare-fun d!63235 () Bool)

(declare-fun lt!133338 () (_ BitVec 32))

(assert (=> d!63235 (and (bvsge lt!133338 #b00000000000000000000000000000000) (bvsle lt!133338 (bvsub (size!6344 lt!132768) (bvadd index!297 #b00000000000000000000000000000001))))))

(assert (=> d!63235 (= lt!133338 e!170768)))

(declare-fun c!44993 () Bool)

(assert (=> d!63235 (= c!44993 (bvsge (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!63235 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) (bvsge (bvadd index!297 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6344 lt!132768)))))

(assert (=> d!63235 (= (arrayCountValidKeys!0 lt!132768 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) lt!133338)))

(assert (= (and d!63235 c!44993) b!263560))

(assert (= (and d!63235 (not c!44993)) b!263559))

(assert (= (and b!263559 c!44994) b!263561))

(assert (= (and b!263559 (not c!44994)) b!263558))

(assert (= (or b!263561 b!263558) bm!25221))

(declare-fun m!279499 () Bool)

(assert (=> bm!25221 m!279499))

(declare-fun m!279501 () Bool)

(assert (=> b!263559 m!279501))

(assert (=> b!263559 m!279501))

(declare-fun m!279503 () Bool)

(assert (=> b!263559 m!279503))

(assert (=> bm!25161 d!63235))

(declare-fun b!263562 () Bool)

(declare-fun e!170772 () Bool)

(declare-fun e!170771 () Bool)

(assert (=> b!263562 (= e!170772 e!170771)))

(declare-fun lt!133339 () (_ BitVec 64))

(assert (=> b!263562 (= lt!133339 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!133340 () Unit!8136)

(assert (=> b!263562 (= lt!133340 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) lt!133339 #b00000000000000000000000000000000))))

(assert (=> b!263562 (arrayContainsKey!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) lt!133339 #b00000000000000000000000000000000)))

(declare-fun lt!133341 () Unit!8136)

(assert (=> b!263562 (= lt!133341 lt!133340)))

(declare-fun res!128682 () Bool)

(assert (=> b!263562 (= res!128682 (= (seekEntryOrOpen!0 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000) (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (mask!11207 thiss!1504)) (Found!1193 #b00000000000000000000000000000000)))))

(assert (=> b!263562 (=> (not res!128682) (not e!170771))))

(declare-fun d!63237 () Bool)

(declare-fun res!128681 () Bool)

(declare-fun e!170770 () Bool)

(assert (=> d!63237 (=> res!128681 e!170770)))

(assert (=> d!63237 (= res!128681 (bvsge #b00000000000000000000000000000000 (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))))

(assert (=> d!63237 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (mask!11207 thiss!1504)) e!170770)))

(declare-fun b!263563 () Bool)

(declare-fun call!25225 () Bool)

(assert (=> b!263563 (= e!170771 call!25225)))

(declare-fun b!263564 () Bool)

(assert (=> b!263564 (= e!170770 e!170772)))

(declare-fun c!44995 () Bool)

(assert (=> b!263564 (= c!44995 (validKeyInArray!0 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!263565 () Bool)

(assert (=> b!263565 (= e!170772 call!25225)))

(declare-fun bm!25222 () Bool)

(assert (=> bm!25222 (= call!25225 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (mask!11207 thiss!1504)))))

(assert (= (and d!63237 (not res!128681)) b!263564))

(assert (= (and b!263564 c!44995) b!263562))

(assert (= (and b!263564 (not c!44995)) b!263565))

(assert (= (and b!263562 res!128682) b!263563))

(assert (= (or b!263563 b!263565) bm!25222))

(assert (=> b!263562 m!278833))

(declare-fun m!279505 () Bool)

(assert (=> b!263562 m!279505))

(declare-fun m!279507 () Bool)

(assert (=> b!263562 m!279507))

(assert (=> b!263562 m!278833))

(declare-fun m!279509 () Bool)

(assert (=> b!263562 m!279509))

(assert (=> b!263564 m!278833))

(assert (=> b!263564 m!278833))

(assert (=> b!263564 m!278871))

(declare-fun m!279511 () Bool)

(assert (=> bm!25222 m!279511))

(assert (=> b!263028 d!63237))

(declare-fun b!263566 () Bool)

(declare-fun e!170774 () Bool)

(assert (=> b!263566 (= e!170774 tp_is_empty!6655)))

(declare-fun condMapEmpty!11357 () Bool)

(declare-fun mapDefault!11357 () ValueCell!2984)

(assert (=> mapNonEmpty!11356 (= condMapEmpty!11357 (= mapRest!11356 ((as const (Array (_ BitVec 32) ValueCell!2984)) mapDefault!11357)))))

(declare-fun e!170773 () Bool)

(declare-fun mapRes!11357 () Bool)

(assert (=> mapNonEmpty!11356 (= tp!23731 (and e!170773 mapRes!11357))))

(declare-fun b!263567 () Bool)

(assert (=> b!263567 (= e!170773 tp_is_empty!6655)))

(declare-fun mapNonEmpty!11357 () Bool)

(declare-fun tp!23732 () Bool)

(assert (=> mapNonEmpty!11357 (= mapRes!11357 (and tp!23732 e!170774))))

(declare-fun mapValue!11357 () ValueCell!2984)

(declare-fun mapRest!11357 () (Array (_ BitVec 32) ValueCell!2984))

(declare-fun mapKey!11357 () (_ BitVec 32))

(assert (=> mapNonEmpty!11357 (= mapRest!11356 (store mapRest!11357 mapKey!11357 mapValue!11357))))

(declare-fun mapIsEmpty!11357 () Bool)

(assert (=> mapIsEmpty!11357 mapRes!11357))

(assert (= (and mapNonEmpty!11356 condMapEmpty!11357) mapIsEmpty!11357))

(assert (= (and mapNonEmpty!11356 (not condMapEmpty!11357)) mapNonEmpty!11357))

(assert (= (and mapNonEmpty!11357 ((_ is ValueCellFull!2984) mapValue!11357)) b!263566))

(assert (= (and mapNonEmpty!11356 ((_ is ValueCellFull!2984) mapDefault!11357)) b!263567))

(declare-fun m!279513 () Bool)

(assert (=> mapNonEmpty!11357 m!279513))

(declare-fun b_lambda!8333 () Bool)

(assert (= b_lambda!8329 (or (and b!262722 b_free!6793) b_lambda!8333)))

(declare-fun b_lambda!8335 () Bool)

(assert (= b_lambda!8323 (or (and b!262722 b_free!6793) b_lambda!8335)))

(declare-fun b_lambda!8337 () Bool)

(assert (= b_lambda!8321 (or (and b!262722 b_free!6793) b_lambda!8337)))

(declare-fun b_lambda!8339 () Bool)

(assert (= b_lambda!8327 (or (and b!262722 b_free!6793) b_lambda!8339)))

(declare-fun b_lambda!8341 () Bool)

(assert (= b_lambda!8325 (or (and b!262722 b_free!6793) b_lambda!8341)))

(check-sat (not b!263313) (not d!63049) (not d!63125) (not bm!25218) (not b!263207) (not b!263428) (not b!263278) (not b!263522) (not b!263272) (not b!263400) (not b!263223) (not b!263514) (not b!263380) (not d!63003) (not b!263432) (not d!63009) (not b!263477) (not b!263177) (not b!263192) (not d!63153) (not d!63193) (not b!263349) (not b!263287) (not b_lambda!8317) (not b!263261) (not b!263424) (not b!263120) (not b!263383) (not b!263416) (not b!263303) (not d!63121) (not b!263523) (not b!263489) (not d!63137) (not d!63181) (not b!263281) (not d!63157) (not bm!25198) (not b_lambda!8319) (not b!263317) (not bm!25190) (not d!63025) (not b!263170) (not b!263559) (not b!263228) (not b!263414) (not b!263544) (not d!63209) (not d!63201) (not b!263123) (not d!63069) (not b!263230) (not d!63217) (not d!63075) (not d!63225) (not bm!25175) (not b!263403) (not d!63175) (not d!63219) (not bm!25220) (not d!63021) (not b!263436) (not d!63221) (not b!263266) (not b!263422) (not b!263263) (not b!263387) (not d!63191) (not bm!25188) (not b!263300) (not b_next!6793) (not d!63105) (not b!263154) (not b!263274) (not b!263557) (not b!263433) (not b!263137) (not b!263194) (not b!263227) (not d!63141) (not d!63043) (not d!63035) (not b!263128) (not d!63183) (not d!63115) (not bm!25215) (not bm!25195) (not b!263351) (not d!63213) (not b!263148) (not b!263408) (not b_lambda!8335) (not bm!25174) (not b!263215) (not b!263143) (not b!263479) (not b!263427) (not d!63229) (not d!63109) (not d!63205) (not b!263531) (not d!63113) (not b!263555) (not d!63233) (not d!63187) (not b!263269) (not b!263535) (not d!63099) (not d!63073) (not d!63093) (not b!263264) (not b!263336) (not b!263204) (not d!63077) (not b!263434) (not d!63095) (not d!63129) (not b!263513) (not d!63103) (not b_lambda!8341) (not d!63047) (not bm!25205) (not b_lambda!8331) (not b!263175) (not bm!25222) (not b!263343) (not b!263232) (not b!263226) (not d!63065) (not b!263217) (not b!263350) (not d!63061) (not d!63023) (not b!263476) (not b_lambda!8339) (not bm!25187) (not b!263257) (not d!63081) (not b!263562) (not b!263127) (not d!63171) (not b!263538) (not b!263516) (not bm!25200) (not b!263469) (not b!263126) (not b!263224) (not b!263210) (not b!263554) (not d!63005) (not d!63031) (not b!263556) (not b!263520) (not d!63067) (not d!63161) (not b!263288) (not b!263130) (not b!263425) (not b!263309) (not d!63089) (not d!63019) (not b!263302) (not b!263181) (not b!263205) (not d!63063) (not d!63147) (not bm!25181) (not b!263525) (not b!263283) tp_is_empty!6655 (not bm!25182) (not d!63207) (not d!63029) (not b!263411) (not bm!25194) (not b!263277) (not b!263142) (not b!263405) (not b!263564) (not b!263298) (not b!263268) (not b!263305) (not b!263293) (not b!263467) (not bm!25196) (not bm!25206) (not b!263295) (not bm!25189) (not b!263178) (not d!63091) (not d!63059) (not d!63013) (not b!263398) (not b!263211) (not d!63111) (not b!263270) (not d!63173) (not b!263297) (not d!63117) (not b!263430) (not mapNonEmpty!11357) (not d!63123) (not bm!25180) (not b!263292) (not b!263401) (not b!263465) (not b!263280) (not b!263323) (not b!263197) (not b!263318) (not d!62997) (not d!63079) (not b!263138) (not b!263473) (not b!263530) (not b!263171) (not d!63119) (not bm!25173) (not b!263488) (not b!263121) (not b!263391) (not d!63057) (not b!263289) (not b!263385) (not b!263276) (not b!263160) (not b!263536) (not d!63041) (not d!63051) (not b!263420) (not b!263134) (not b!263173) (not bm!25199) (not bm!25207) (not d!63087) (not b!263528) (not d!63163) (not d!63211) (not d!63131) (not b!263543) (not b!263213) (not d!63011) b_and!13929 (not b!263347) (not b!263417) (not b_lambda!8337) (not b!263258) (not b!263285) (not d!63177) (not bm!25221) (not d!63071) (not d!63053) (not b_lambda!8333) (not d!63055) (not bm!25197) (not b!263208) (not b!263372) (not b!263291) (not bm!25176) (not b!263546) (not d!63107) (not bm!25186) (not b!263482) (not d!63097) (not b!263312) (not b!263231) (not b!263548) (not d!63101) (not b!263259) (not bm!25185) (not b!263395) (not d!63039) (not b!263286))
(check-sat b_and!13929 (not b_next!6793))
(get-model)

(declare-fun d!63239 () Bool)

(assert (=> d!63239 (= (get!3088 (getValueByKey!318 (toList!1927 lt!132995) lt!132997)) (v!5502 (getValueByKey!318 (toList!1927 lt!132995) lt!132997)))))

(assert (=> d!63053 d!63239))

(declare-fun b!263569 () Bool)

(declare-fun e!170775 () Option!324)

(declare-fun e!170776 () Option!324)

(assert (=> b!263569 (= e!170775 e!170776)))

(declare-fun c!44997 () Bool)

(assert (=> b!263569 (= c!44997 (and ((_ is Cons!3813) (toList!1927 lt!132995)) (not (= (_1!2471 (h!4479 (toList!1927 lt!132995))) lt!132997))))))

(declare-fun b!263571 () Bool)

(assert (=> b!263571 (= e!170776 None!322)))

(declare-fun d!63241 () Bool)

(declare-fun c!44996 () Bool)

(assert (=> d!63241 (= c!44996 (and ((_ is Cons!3813) (toList!1927 lt!132995)) (= (_1!2471 (h!4479 (toList!1927 lt!132995))) lt!132997)))))

(assert (=> d!63241 (= (getValueByKey!318 (toList!1927 lt!132995) lt!132997) e!170775)))

(declare-fun b!263568 () Bool)

(assert (=> b!263568 (= e!170775 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!132995)))))))

(declare-fun b!263570 () Bool)

(assert (=> b!263570 (= e!170776 (getValueByKey!318 (t!8885 (toList!1927 lt!132995)) lt!132997))))

(assert (= (and d!63241 c!44996) b!263568))

(assert (= (and d!63241 (not c!44996)) b!263569))

(assert (= (and b!263569 c!44997) b!263570))

(assert (= (and b!263569 (not c!44997)) b!263571))

(declare-fun m!279515 () Bool)

(assert (=> b!263570 m!279515))

(assert (=> d!63053 d!63241))

(declare-fun d!63243 () Bool)

(declare-fun e!170777 () Bool)

(assert (=> d!63243 e!170777))

(declare-fun res!128684 () Bool)

(assert (=> d!63243 (=> (not res!128684) (not e!170777))))

(declare-fun lt!133343 () ListLongMap!3823)

(assert (=> d!63243 (= res!128684 (contains!1889 lt!133343 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133342 () List!3817)

(assert (=> d!63243 (= lt!133343 (ListLongMap!3824 lt!133342))))

(declare-fun lt!133345 () Unit!8136)

(declare-fun lt!133344 () Unit!8136)

(assert (=> d!63243 (= lt!133345 lt!133344)))

(assert (=> d!63243 (= (getValueByKey!318 lt!133342 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63243 (= lt!133344 (lemmaContainsTupThenGetReturnValue!177 lt!133342 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63243 (= lt!133342 (insertStrictlySorted!180 (toList!1927 call!25178) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63243 (= (+!713 call!25178 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) lt!133343)))

(declare-fun b!263572 () Bool)

(declare-fun res!128683 () Bool)

(assert (=> b!263572 (=> (not res!128683) (not e!170777))))

(assert (=> b!263572 (= res!128683 (= (getValueByKey!318 (toList!1927 lt!133343) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!263573 () Bool)

(assert (=> b!263573 (= e!170777 (contains!1893 (toList!1927 lt!133343) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(assert (= (and d!63243 res!128684) b!263572))

(assert (= (and b!263572 res!128683) b!263573))

(declare-fun m!279517 () Bool)

(assert (=> d!63243 m!279517))

(declare-fun m!279519 () Bool)

(assert (=> d!63243 m!279519))

(declare-fun m!279521 () Bool)

(assert (=> d!63243 m!279521))

(declare-fun m!279523 () Bool)

(assert (=> d!63243 m!279523))

(declare-fun m!279525 () Bool)

(assert (=> b!263572 m!279525))

(declare-fun m!279527 () Bool)

(assert (=> b!263573 m!279527))

(assert (=> b!263138 d!63243))

(declare-fun d!63245 () Bool)

(declare-fun e!170778 () Bool)

(assert (=> d!63245 e!170778))

(declare-fun res!128686 () Bool)

(assert (=> d!63245 (=> (not res!128686) (not e!170778))))

(declare-fun lt!133347 () ListLongMap!3823)

(assert (=> d!63245 (= res!128686 (contains!1889 lt!133347 (_1!2471 (ite (or c!44915 c!44912) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!132778)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778))))))))

(declare-fun lt!133346 () List!3817)

(assert (=> d!63245 (= lt!133347 (ListLongMap!3824 lt!133346))))

(declare-fun lt!133349 () Unit!8136)

(declare-fun lt!133348 () Unit!8136)

(assert (=> d!63245 (= lt!133349 lt!133348)))

(assert (=> d!63245 (= (getValueByKey!318 lt!133346 (_1!2471 (ite (or c!44915 c!44912) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!132778)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778))))) (Some!323 (_2!2471 (ite (or c!44915 c!44912) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!132778)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778))))))))

(assert (=> d!63245 (= lt!133348 (lemmaContainsTupThenGetReturnValue!177 lt!133346 (_1!2471 (ite (or c!44915 c!44912) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!132778)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778)))) (_2!2471 (ite (or c!44915 c!44912) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!132778)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778))))))))

(assert (=> d!63245 (= lt!133346 (insertStrictlySorted!180 (toList!1927 (ite c!44915 call!25195 (ite c!44912 call!25197 call!25194))) (_1!2471 (ite (or c!44915 c!44912) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!132778)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778)))) (_2!2471 (ite (or c!44915 c!44912) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!132778)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778))))))))

(assert (=> d!63245 (= (+!713 (ite c!44915 call!25195 (ite c!44912 call!25197 call!25194)) (ite (or c!44915 c!44912) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!132778)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778)))) lt!133347)))

(declare-fun b!263574 () Bool)

(declare-fun res!128685 () Bool)

(assert (=> b!263574 (=> (not res!128685) (not e!170778))))

(assert (=> b!263574 (= res!128685 (= (getValueByKey!318 (toList!1927 lt!133347) (_1!2471 (ite (or c!44915 c!44912) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!132778)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778))))) (Some!323 (_2!2471 (ite (or c!44915 c!44912) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!132778)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778)))))))))

(declare-fun b!263575 () Bool)

(assert (=> b!263575 (= e!170778 (contains!1893 (toList!1927 lt!133347) (ite (or c!44915 c!44912) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!132778)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778)))))))

(assert (= (and d!63245 res!128686) b!263574))

(assert (= (and b!263574 res!128685) b!263575))

(declare-fun m!279529 () Bool)

(assert (=> d!63245 m!279529))

(declare-fun m!279531 () Bool)

(assert (=> d!63245 m!279531))

(declare-fun m!279533 () Bool)

(assert (=> d!63245 m!279533))

(declare-fun m!279535 () Bool)

(assert (=> d!63245 m!279535))

(declare-fun m!279537 () Bool)

(assert (=> b!263574 m!279537))

(declare-fun m!279539 () Bool)

(assert (=> b!263575 m!279539))

(assert (=> bm!25189 d!63245))

(declare-fun lt!133350 () Bool)

(declare-fun d!63247 () Bool)

(assert (=> d!63247 (= lt!133350 (select (content!176 (toList!1927 lt!133098)) (tuple2!4921 key!932 v!346)))))

(declare-fun e!170780 () Bool)

(assert (=> d!63247 (= lt!133350 e!170780)))

(declare-fun res!128688 () Bool)

(assert (=> d!63247 (=> (not res!128688) (not e!170780))))

(assert (=> d!63247 (= res!128688 ((_ is Cons!3813) (toList!1927 lt!133098)))))

(assert (=> d!63247 (= (contains!1893 (toList!1927 lt!133098) (tuple2!4921 key!932 v!346)) lt!133350)))

(declare-fun b!263576 () Bool)

(declare-fun e!170779 () Bool)

(assert (=> b!263576 (= e!170780 e!170779)))

(declare-fun res!128687 () Bool)

(assert (=> b!263576 (=> res!128687 e!170779)))

(assert (=> b!263576 (= res!128687 (= (h!4479 (toList!1927 lt!133098)) (tuple2!4921 key!932 v!346)))))

(declare-fun b!263577 () Bool)

(assert (=> b!263577 (= e!170779 (contains!1893 (t!8885 (toList!1927 lt!133098)) (tuple2!4921 key!932 v!346)))))

(assert (= (and d!63247 res!128688) b!263576))

(assert (= (and b!263576 (not res!128687)) b!263577))

(declare-fun m!279541 () Bool)

(assert (=> d!63247 m!279541))

(declare-fun m!279543 () Bool)

(assert (=> d!63247 m!279543))

(declare-fun m!279545 () Bool)

(assert (=> b!263577 m!279545))

(assert (=> b!263127 d!63247))

(declare-fun d!63249 () Bool)

(declare-fun e!170781 () Bool)

(assert (=> d!63249 e!170781))

(declare-fun res!128689 () Bool)

(assert (=> d!63249 (=> res!128689 e!170781)))

(declare-fun lt!133354 () Bool)

(assert (=> d!63249 (= res!128689 (not lt!133354))))

(declare-fun lt!133352 () Bool)

(assert (=> d!63249 (= lt!133354 lt!133352)))

(declare-fun lt!133351 () Unit!8136)

(declare-fun e!170782 () Unit!8136)

(assert (=> d!63249 (= lt!133351 e!170782)))

(declare-fun c!44998 () Bool)

(assert (=> d!63249 (= c!44998 lt!133352)))

(assert (=> d!63249 (= lt!133352 (containsKey!310 (toList!1927 lt!133224) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63249 (= (contains!1889 lt!133224 #b1000000000000000000000000000000000000000000000000000000000000000) lt!133354)))

(declare-fun b!263578 () Bool)

(declare-fun lt!133353 () Unit!8136)

(assert (=> b!263578 (= e!170782 lt!133353)))

(assert (=> b!263578 (= lt!133353 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133224) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263578 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133224) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263579 () Bool)

(declare-fun Unit!8170 () Unit!8136)

(assert (=> b!263579 (= e!170782 Unit!8170)))

(declare-fun b!263580 () Bool)

(assert (=> b!263580 (= e!170781 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63249 c!44998) b!263578))

(assert (= (and d!63249 (not c!44998)) b!263579))

(assert (= (and d!63249 (not res!128689)) b!263580))

(declare-fun m!279547 () Bool)

(assert (=> d!63249 m!279547))

(declare-fun m!279549 () Bool)

(assert (=> b!263578 m!279549))

(declare-fun m!279551 () Bool)

(assert (=> b!263578 m!279551))

(assert (=> b!263578 m!279551))

(declare-fun m!279553 () Bool)

(assert (=> b!263578 m!279553))

(assert (=> b!263580 m!279551))

(assert (=> b!263580 m!279551))

(assert (=> b!263580 m!279553))

(assert (=> b!263297 d!63249))

(declare-fun d!63251 () Bool)

(declare-fun e!170783 () Bool)

(assert (=> d!63251 e!170783))

(declare-fun res!128690 () Bool)

(assert (=> d!63251 (=> res!128690 e!170783)))

(declare-fun lt!133358 () Bool)

(assert (=> d!63251 (= res!128690 (not lt!133358))))

(declare-fun lt!133356 () Bool)

(assert (=> d!63251 (= lt!133358 lt!133356)))

(declare-fun lt!133355 () Unit!8136)

(declare-fun e!170784 () Unit!8136)

(assert (=> d!63251 (= lt!133355 e!170784)))

(declare-fun c!44999 () Bool)

(assert (=> d!63251 (= c!44999 lt!133356)))

(assert (=> d!63251 (= lt!133356 (containsKey!310 (toList!1927 lt!133303) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63251 (= (contains!1889 lt!133303 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133358)))

(declare-fun b!263581 () Bool)

(declare-fun lt!133357 () Unit!8136)

(assert (=> b!263581 (= e!170784 lt!133357)))

(assert (=> b!263581 (= lt!133357 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133303) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> b!263581 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133303) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!263582 () Bool)

(declare-fun Unit!8171 () Unit!8136)

(assert (=> b!263582 (= e!170784 Unit!8171)))

(declare-fun b!263583 () Bool)

(assert (=> b!263583 (= e!170783 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133303) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63251 c!44999) b!263581))

(assert (= (and d!63251 (not c!44999)) b!263582))

(assert (= (and d!63251 (not res!128690)) b!263583))

(declare-fun m!279555 () Bool)

(assert (=> d!63251 m!279555))

(declare-fun m!279557 () Bool)

(assert (=> b!263581 m!279557))

(assert (=> b!263581 m!279387))

(assert (=> b!263581 m!279387))

(declare-fun m!279559 () Bool)

(assert (=> b!263581 m!279559))

(assert (=> b!263583 m!279387))

(assert (=> b!263583 m!279387))

(assert (=> b!263583 m!279559))

(assert (=> d!63187 d!63251))

(declare-fun b!263585 () Bool)

(declare-fun e!170785 () Option!324)

(declare-fun e!170786 () Option!324)

(assert (=> b!263585 (= e!170785 e!170786)))

(declare-fun c!45001 () Bool)

(assert (=> b!263585 (= c!45001 (and ((_ is Cons!3813) lt!133302) (not (= (_1!2471 (h!4479 lt!133302)) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun b!263587 () Bool)

(assert (=> b!263587 (= e!170786 None!322)))

(declare-fun d!63253 () Bool)

(declare-fun c!45000 () Bool)

(assert (=> d!63253 (= c!45000 (and ((_ is Cons!3813) lt!133302) (= (_1!2471 (h!4479 lt!133302)) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63253 (= (getValueByKey!318 lt!133302 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) e!170785)))

(declare-fun b!263584 () Bool)

(assert (=> b!263584 (= e!170785 (Some!323 (_2!2471 (h!4479 lt!133302))))))

(declare-fun b!263586 () Bool)

(assert (=> b!263586 (= e!170786 (getValueByKey!318 (t!8885 lt!133302) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63253 c!45000) b!263584))

(assert (= (and d!63253 (not c!45000)) b!263585))

(assert (= (and b!263585 c!45001) b!263586))

(assert (= (and b!263585 (not c!45001)) b!263587))

(declare-fun m!279561 () Bool)

(assert (=> b!263586 m!279561))

(assert (=> d!63187 d!63253))

(declare-fun d!63255 () Bool)

(assert (=> d!63255 (= (getValueByKey!318 lt!133302 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133359 () Unit!8136)

(assert (=> d!63255 (= lt!133359 (choose!1303 lt!133302 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun e!170787 () Bool)

(assert (=> d!63255 e!170787))

(declare-fun res!128691 () Bool)

(assert (=> d!63255 (=> (not res!128691) (not e!170787))))

(assert (=> d!63255 (= res!128691 (isStrictlySorted!372 lt!133302))))

(assert (=> d!63255 (= (lemmaContainsTupThenGetReturnValue!177 lt!133302 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133359)))

(declare-fun b!263588 () Bool)

(declare-fun res!128692 () Bool)

(assert (=> b!263588 (=> (not res!128692) (not e!170787))))

(assert (=> b!263588 (= res!128692 (containsKey!310 lt!133302 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!263589 () Bool)

(assert (=> b!263589 (= e!170787 (contains!1893 lt!133302 (tuple2!4921 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63255 res!128691) b!263588))

(assert (= (and b!263588 res!128692) b!263589))

(assert (=> d!63255 m!279381))

(declare-fun m!279563 () Bool)

(assert (=> d!63255 m!279563))

(declare-fun m!279565 () Bool)

(assert (=> d!63255 m!279565))

(declare-fun m!279567 () Bool)

(assert (=> b!263588 m!279567))

(declare-fun m!279569 () Bool)

(assert (=> b!263589 m!279569))

(assert (=> d!63187 d!63255))

(declare-fun b!263590 () Bool)

(declare-fun e!170789 () List!3817)

(declare-fun call!25226 () List!3817)

(assert (=> b!263590 (= e!170789 call!25226)))

(declare-fun b!263591 () Bool)

(declare-fun e!170791 () List!3817)

(declare-fun call!25227 () List!3817)

(assert (=> b!263591 (= e!170791 call!25227)))

(declare-fun c!45004 () Bool)

(declare-fun b!263592 () Bool)

(declare-fun c!45003 () Bool)

(declare-fun e!170792 () List!3817)

(assert (=> b!263592 (= e!170792 (ite c!45004 (t!8885 (toList!1927 call!25156)) (ite c!45003 (Cons!3813 (h!4479 (toList!1927 call!25156)) (t!8885 (toList!1927 call!25156))) Nil!3814)))))

(declare-fun b!263593 () Bool)

(declare-fun e!170788 () Bool)

(declare-fun lt!133360 () List!3817)

(assert (=> b!263593 (= e!170788 (contains!1893 lt!133360 (tuple2!4921 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun bm!25223 () Bool)

(declare-fun call!25228 () List!3817)

(assert (=> bm!25223 (= call!25228 call!25226)))

(declare-fun b!263594 () Bool)

(declare-fun res!128694 () Bool)

(assert (=> b!263594 (=> (not res!128694) (not e!170788))))

(assert (=> b!263594 (= res!128694 (containsKey!310 lt!133360 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!263595 () Bool)

(assert (=> b!263595 (= e!170791 call!25227)))

(declare-fun b!263596 () Bool)

(assert (=> b!263596 (= e!170792 (insertStrictlySorted!180 (t!8885 (toList!1927 call!25156)) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun d!63257 () Bool)

(assert (=> d!63257 e!170788))

(declare-fun res!128693 () Bool)

(assert (=> d!63257 (=> (not res!128693) (not e!170788))))

(assert (=> d!63257 (= res!128693 (isStrictlySorted!372 lt!133360))))

(assert (=> d!63257 (= lt!133360 e!170789)))

(declare-fun c!45005 () Bool)

(assert (=> d!63257 (= c!45005 (and ((_ is Cons!3813) (toList!1927 call!25156)) (bvslt (_1!2471 (h!4479 (toList!1927 call!25156))) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63257 (isStrictlySorted!372 (toList!1927 call!25156))))

(assert (=> d!63257 (= (insertStrictlySorted!180 (toList!1927 call!25156) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133360)))

(declare-fun b!263597 () Bool)

(assert (=> b!263597 (= c!45003 (and ((_ is Cons!3813) (toList!1927 call!25156)) (bvsgt (_1!2471 (h!4479 (toList!1927 call!25156))) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun e!170790 () List!3817)

(assert (=> b!263597 (= e!170790 e!170791)))

(declare-fun bm!25224 () Bool)

(assert (=> bm!25224 (= call!25226 ($colon$colon!107 e!170792 (ite c!45005 (h!4479 (toList!1927 call!25156)) (tuple2!4921 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun c!45002 () Bool)

(assert (=> bm!25224 (= c!45002 c!45005)))

(declare-fun bm!25225 () Bool)

(assert (=> bm!25225 (= call!25227 call!25228)))

(declare-fun b!263598 () Bool)

(assert (=> b!263598 (= e!170790 call!25228)))

(declare-fun b!263599 () Bool)

(assert (=> b!263599 (= e!170789 e!170790)))

(assert (=> b!263599 (= c!45004 (and ((_ is Cons!3813) (toList!1927 call!25156)) (= (_1!2471 (h!4479 (toList!1927 call!25156))) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63257 c!45005) b!263590))

(assert (= (and d!63257 (not c!45005)) b!263599))

(assert (= (and b!263599 c!45004) b!263598))

(assert (= (and b!263599 (not c!45004)) b!263597))

(assert (= (and b!263597 c!45003) b!263595))

(assert (= (and b!263597 (not c!45003)) b!263591))

(assert (= (or b!263595 b!263591) bm!25225))

(assert (= (or b!263598 bm!25225) bm!25223))

(assert (= (or b!263590 bm!25223) bm!25224))

(assert (= (and bm!25224 c!45002) b!263596))

(assert (= (and bm!25224 (not c!45002)) b!263592))

(assert (= (and d!63257 res!128693) b!263594))

(assert (= (and b!263594 res!128694) b!263593))

(declare-fun m!279571 () Bool)

(assert (=> b!263596 m!279571))

(declare-fun m!279573 () Bool)

(assert (=> bm!25224 m!279573))

(declare-fun m!279575 () Bool)

(assert (=> b!263593 m!279575))

(declare-fun m!279577 () Bool)

(assert (=> b!263594 m!279577))

(declare-fun m!279579 () Bool)

(assert (=> d!63257 m!279579))

(declare-fun m!279581 () Bool)

(assert (=> d!63257 m!279581))

(assert (=> d!63187 d!63257))

(declare-fun d!63259 () Bool)

(declare-fun res!128695 () Bool)

(declare-fun e!170793 () Bool)

(assert (=> d!63259 (=> res!128695 e!170793)))

(assert (=> d!63259 (= res!128695 (and ((_ is Cons!3813) (toList!1927 lt!133003)) (= (_1!2471 (h!4479 (toList!1927 lt!133003))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63259 (= (containsKey!310 (toList!1927 lt!133003) #b1000000000000000000000000000000000000000000000000000000000000000) e!170793)))

(declare-fun b!263600 () Bool)

(declare-fun e!170794 () Bool)

(assert (=> b!263600 (= e!170793 e!170794)))

(declare-fun res!128696 () Bool)

(assert (=> b!263600 (=> (not res!128696) (not e!170794))))

(assert (=> b!263600 (= res!128696 (and (or (not ((_ is Cons!3813) (toList!1927 lt!133003))) (bvsle (_1!2471 (h!4479 (toList!1927 lt!133003))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!3813) (toList!1927 lt!133003)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!133003))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263601 () Bool)

(assert (=> b!263601 (= e!170794 (containsKey!310 (t!8885 (toList!1927 lt!133003)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63259 (not res!128695)) b!263600))

(assert (= (and b!263600 res!128696) b!263601))

(declare-fun m!279583 () Bool)

(assert (=> b!263601 m!279583))

(assert (=> d!63147 d!63259))

(declare-fun d!63261 () Bool)

(declare-fun e!170795 () Bool)

(assert (=> d!63261 e!170795))

(declare-fun res!128697 () Bool)

(assert (=> d!63261 (=> res!128697 e!170795)))

(declare-fun lt!133364 () Bool)

(assert (=> d!63261 (= res!128697 (not lt!133364))))

(declare-fun lt!133362 () Bool)

(assert (=> d!63261 (= lt!133364 lt!133362)))

(declare-fun lt!133361 () Unit!8136)

(declare-fun e!170796 () Unit!8136)

(assert (=> d!63261 (= lt!133361 e!170796)))

(declare-fun c!45006 () Bool)

(assert (=> d!63261 (= c!45006 lt!133362)))

(assert (=> d!63261 (= lt!133362 (containsKey!310 (toList!1927 lt!133218) (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))))))

(assert (=> d!63261 (= (contains!1889 lt!133218 (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))) lt!133364)))

(declare-fun b!263602 () Bool)

(declare-fun lt!133363 () Unit!8136)

(assert (=> b!263602 (= e!170796 lt!133363)))

(assert (=> b!263602 (= lt!133363 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133218) (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))))))

(assert (=> b!263602 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133218) (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))))))

(declare-fun b!263603 () Bool)

(declare-fun Unit!8172 () Unit!8136)

(assert (=> b!263603 (= e!170796 Unit!8172)))

(declare-fun b!263604 () Bool)

(assert (=> b!263604 (= e!170795 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133218) (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63261 c!45006) b!263602))

(assert (= (and d!63261 (not c!45006)) b!263603))

(assert (= (and d!63261 (not res!128697)) b!263604))

(declare-fun m!279585 () Bool)

(assert (=> d!63261 m!279585))

(declare-fun m!279587 () Bool)

(assert (=> b!263602 m!279587))

(assert (=> b!263602 m!279157))

(assert (=> b!263602 m!279157))

(declare-fun m!279589 () Bool)

(assert (=> b!263602 m!279589))

(assert (=> b!263604 m!279157))

(assert (=> b!263604 m!279157))

(assert (=> b!263604 m!279589))

(assert (=> d!63105 d!63261))

(declare-fun b!263606 () Bool)

(declare-fun e!170797 () Option!324)

(declare-fun e!170798 () Option!324)

(assert (=> b!263606 (= e!170797 e!170798)))

(declare-fun c!45008 () Bool)

(assert (=> b!263606 (= c!45008 (and ((_ is Cons!3813) lt!133217) (not (= (_1!2471 (h!4479 lt!133217)) (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))))))))

(declare-fun b!263608 () Bool)

(assert (=> b!263608 (= e!170798 None!322)))

(declare-fun c!45007 () Bool)

(declare-fun d!63263 () Bool)

(assert (=> d!63263 (= c!45007 (and ((_ is Cons!3813) lt!133217) (= (_1!2471 (h!4479 lt!133217)) (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))))))))

(assert (=> d!63263 (= (getValueByKey!318 lt!133217 (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))) e!170797)))

(declare-fun b!263605 () Bool)

(assert (=> b!263605 (= e!170797 (Some!323 (_2!2471 (h!4479 lt!133217))))))

(declare-fun b!263607 () Bool)

(assert (=> b!263607 (= e!170798 (getValueByKey!318 (t!8885 lt!133217) (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63263 c!45007) b!263605))

(assert (= (and d!63263 (not c!45007)) b!263606))

(assert (= (and b!263606 c!45008) b!263607))

(assert (= (and b!263606 (not c!45008)) b!263608))

(declare-fun m!279591 () Bool)

(assert (=> b!263607 m!279591))

(assert (=> d!63105 d!63263))

(declare-fun d!63265 () Bool)

(assert (=> d!63265 (= (getValueByKey!318 lt!133217 (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133365 () Unit!8136)

(assert (=> d!63265 (= lt!133365 (choose!1303 lt!133217 (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))))))

(declare-fun e!170799 () Bool)

(assert (=> d!63265 e!170799))

(declare-fun res!128698 () Bool)

(assert (=> d!63265 (=> (not res!128698) (not e!170799))))

(assert (=> d!63265 (= res!128698 (isStrictlySorted!372 lt!133217))))

(assert (=> d!63265 (= (lemmaContainsTupThenGetReturnValue!177 lt!133217 (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))) lt!133365)))

(declare-fun b!263609 () Bool)

(declare-fun res!128699 () Bool)

(assert (=> b!263609 (=> (not res!128699) (not e!170799))))

(assert (=> b!263609 (= res!128699 (containsKey!310 lt!133217 (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))))))

(declare-fun b!263610 () Bool)

(assert (=> b!263610 (= e!170799 (contains!1893 lt!133217 (tuple2!4921 (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63265 res!128698) b!263609))

(assert (= (and b!263609 res!128699) b!263610))

(assert (=> d!63265 m!279151))

(declare-fun m!279593 () Bool)

(assert (=> d!63265 m!279593))

(declare-fun m!279595 () Bool)

(assert (=> d!63265 m!279595))

(declare-fun m!279597 () Bool)

(assert (=> b!263609 m!279597))

(declare-fun m!279599 () Bool)

(assert (=> b!263610 m!279599))

(assert (=> d!63105 d!63265))

(declare-fun b!263611 () Bool)

(declare-fun e!170801 () List!3817)

(declare-fun call!25229 () List!3817)

(assert (=> b!263611 (= e!170801 call!25229)))

(declare-fun b!263612 () Bool)

(declare-fun e!170803 () List!3817)

(declare-fun call!25230 () List!3817)

(assert (=> b!263612 (= e!170803 call!25230)))

(declare-fun b!263613 () Bool)

(declare-fun e!170804 () List!3817)

(declare-fun c!45010 () Bool)

(declare-fun c!45011 () Bool)

(assert (=> b!263613 (= e!170804 (ite c!45011 (t!8885 (toList!1927 lt!132979)) (ite c!45010 (Cons!3813 (h!4479 (toList!1927 lt!132979)) (t!8885 (toList!1927 lt!132979))) Nil!3814)))))

(declare-fun b!263614 () Bool)

(declare-fun lt!133366 () List!3817)

(declare-fun e!170800 () Bool)

(assert (=> b!263614 (= e!170800 (contains!1893 lt!133366 (tuple2!4921 (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))))))))

(declare-fun bm!25226 () Bool)

(declare-fun call!25231 () List!3817)

(assert (=> bm!25226 (= call!25231 call!25229)))

(declare-fun b!263615 () Bool)

(declare-fun res!128701 () Bool)

(assert (=> b!263615 (=> (not res!128701) (not e!170800))))

(assert (=> b!263615 (= res!128701 (containsKey!310 lt!133366 (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))))))

(declare-fun b!263616 () Bool)

(assert (=> b!263616 (= e!170803 call!25230)))

(declare-fun b!263617 () Bool)

(assert (=> b!263617 (= e!170804 (insertStrictlySorted!180 (t!8885 (toList!1927 lt!132979)) (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))))))

(declare-fun d!63267 () Bool)

(assert (=> d!63267 e!170800))

(declare-fun res!128700 () Bool)

(assert (=> d!63267 (=> (not res!128700) (not e!170800))))

(assert (=> d!63267 (= res!128700 (isStrictlySorted!372 lt!133366))))

(assert (=> d!63267 (= lt!133366 e!170801)))

(declare-fun c!45012 () Bool)

(assert (=> d!63267 (= c!45012 (and ((_ is Cons!3813) (toList!1927 lt!132979)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!132979))) (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))))))))

(assert (=> d!63267 (isStrictlySorted!372 (toList!1927 lt!132979))))

(assert (=> d!63267 (= (insertStrictlySorted!180 (toList!1927 lt!132979) (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))) lt!133366)))

(declare-fun b!263618 () Bool)

(assert (=> b!263618 (= c!45010 (and ((_ is Cons!3813) (toList!1927 lt!132979)) (bvsgt (_1!2471 (h!4479 (toList!1927 lt!132979))) (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))))))))

(declare-fun e!170802 () List!3817)

(assert (=> b!263618 (= e!170802 e!170803)))

(declare-fun bm!25227 () Bool)

(assert (=> bm!25227 (= call!25229 ($colon$colon!107 e!170804 (ite c!45012 (h!4479 (toList!1927 lt!132979)) (tuple2!4921 (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))))))))

(declare-fun c!45009 () Bool)

(assert (=> bm!25227 (= c!45009 c!45012)))

(declare-fun bm!25228 () Bool)

(assert (=> bm!25228 (= call!25230 call!25231)))

(declare-fun b!263619 () Bool)

(assert (=> b!263619 (= e!170802 call!25231)))

(declare-fun b!263620 () Bool)

(assert (=> b!263620 (= e!170801 e!170802)))

(assert (=> b!263620 (= c!45011 (and ((_ is Cons!3813) (toList!1927 lt!132979)) (= (_1!2471 (h!4479 (toList!1927 lt!132979))) (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63267 c!45012) b!263611))

(assert (= (and d!63267 (not c!45012)) b!263620))

(assert (= (and b!263620 c!45011) b!263619))

(assert (= (and b!263620 (not c!45011)) b!263618))

(assert (= (and b!263618 c!45010) b!263616))

(assert (= (and b!263618 (not c!45010)) b!263612))

(assert (= (or b!263616 b!263612) bm!25228))

(assert (= (or b!263619 bm!25228) bm!25226))

(assert (= (or b!263611 bm!25226) bm!25227))

(assert (= (and bm!25227 c!45009) b!263617))

(assert (= (and bm!25227 (not c!45009)) b!263613))

(assert (= (and d!63267 res!128700) b!263615))

(assert (= (and b!263615 res!128701) b!263614))

(declare-fun m!279601 () Bool)

(assert (=> b!263617 m!279601))

(declare-fun m!279603 () Bool)

(assert (=> bm!25227 m!279603))

(declare-fun m!279605 () Bool)

(assert (=> b!263614 m!279605))

(declare-fun m!279607 () Bool)

(assert (=> b!263615 m!279607))

(declare-fun m!279609 () Bool)

(assert (=> d!63267 m!279609))

(declare-fun m!279611 () Bool)

(assert (=> d!63267 m!279611))

(assert (=> d!63105 d!63267))

(declare-fun d!63269 () Bool)

(declare-fun res!128702 () Bool)

(declare-fun e!170805 () Bool)

(assert (=> d!63269 (=> res!128702 e!170805)))

(assert (=> d!63269 (= res!128702 (and ((_ is Cons!3813) (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (= (_1!2471 (h!4479 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (select (arr!5992 lt!132768) index!297))))))

(assert (=> d!63269 (= (containsKey!310 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5992 lt!132768) index!297)) e!170805)))

(declare-fun b!263621 () Bool)

(declare-fun e!170806 () Bool)

(assert (=> b!263621 (= e!170805 e!170806)))

(declare-fun res!128703 () Bool)

(assert (=> b!263621 (=> (not res!128703) (not e!170806))))

(assert (=> b!263621 (= res!128703 (and (or (not ((_ is Cons!3813) (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (bvsle (_1!2471 (h!4479 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (select (arr!5992 lt!132768) index!297))) ((_ is Cons!3813) (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (bvslt (_1!2471 (h!4479 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (select (arr!5992 lt!132768) index!297))))))

(declare-fun b!263622 () Bool)

(assert (=> b!263622 (= e!170806 (containsKey!310 (t!8885 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (select (arr!5992 lt!132768) index!297)))))

(assert (= (and d!63269 (not res!128702)) b!263621))

(assert (= (and b!263621 res!128703) b!263622))

(assert (=> b!263622 m!278671))

(declare-fun m!279613 () Bool)

(assert (=> b!263622 m!279613))

(assert (=> d!63183 d!63269))

(assert (=> b!263213 d!63151))

(assert (=> b!263417 d!63007))

(declare-fun d!63271 () Bool)

(assert (=> d!63271 (= (get!3088 (getValueByKey!318 (toList!1927 (+!713 lt!133001 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))) lt!132991)) (v!5502 (getValueByKey!318 (toList!1927 (+!713 lt!133001 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))) lt!132991)))))

(assert (=> d!63057 d!63271))

(declare-fun b!263624 () Bool)

(declare-fun e!170807 () Option!324)

(declare-fun e!170808 () Option!324)

(assert (=> b!263624 (= e!170807 e!170808)))

(declare-fun c!45014 () Bool)

(assert (=> b!263624 (= c!45014 (and ((_ is Cons!3813) (toList!1927 (+!713 lt!133001 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))))) (not (= (_1!2471 (h!4479 (toList!1927 (+!713 lt!133001 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))))) lt!132991))))))

(declare-fun b!263626 () Bool)

(assert (=> b!263626 (= e!170808 None!322)))

(declare-fun d!63273 () Bool)

(declare-fun c!45013 () Bool)

(assert (=> d!63273 (= c!45013 (and ((_ is Cons!3813) (toList!1927 (+!713 lt!133001 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))))) (= (_1!2471 (h!4479 (toList!1927 (+!713 lt!133001 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))))) lt!132991)))))

(assert (=> d!63273 (= (getValueByKey!318 (toList!1927 (+!713 lt!133001 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))) lt!132991) e!170807)))

(declare-fun b!263623 () Bool)

(assert (=> b!263623 (= e!170807 (Some!323 (_2!2471 (h!4479 (toList!1927 (+!713 lt!133001 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))))))))))

(declare-fun b!263625 () Bool)

(assert (=> b!263625 (= e!170808 (getValueByKey!318 (t!8885 (toList!1927 (+!713 lt!133001 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))))) lt!132991))))

(assert (= (and d!63273 c!45013) b!263623))

(assert (= (and d!63273 (not c!45013)) b!263624))

(assert (= (and b!263624 c!45014) b!263625))

(assert (= (and b!263624 (not c!45014)) b!263626))

(declare-fun m!279615 () Bool)

(assert (=> b!263625 m!279615))

(assert (=> d!63057 d!63273))

(declare-fun b!263628 () Bool)

(declare-fun e!170812 () Bool)

(declare-fun call!25232 () Bool)

(assert (=> b!263628 (= e!170812 call!25232)))

(declare-fun b!263629 () Bool)

(declare-fun e!170811 () Bool)

(declare-fun e!170809 () Bool)

(assert (=> b!263629 (= e!170811 e!170809)))

(declare-fun res!128706 () Bool)

(assert (=> b!263629 (=> (not res!128706) (not e!170809))))

(declare-fun e!170810 () Bool)

(assert (=> b!263629 (= res!128706 (not e!170810))))

(declare-fun res!128705 () Bool)

(assert (=> b!263629 (=> (not res!128705) (not e!170810))))

(assert (=> b!263629 (= res!128705 (validKeyInArray!0 (select (arr!5992 (_keys!7033 lt!132778)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun c!45015 () Bool)

(declare-fun bm!25229 () Bool)

(assert (=> bm!25229 (= call!25232 (arrayNoDuplicates!0 (_keys!7033 lt!132778) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!45015 (Cons!3814 (select (arr!5992 (_keys!7033 lt!132778)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44955 (Cons!3814 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000) Nil!3815) Nil!3815)) (ite c!44955 (Cons!3814 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000) Nil!3815) Nil!3815))))))

(declare-fun b!263630 () Bool)

(assert (=> b!263630 (= e!170812 call!25232)))

(declare-fun b!263631 () Bool)

(assert (=> b!263631 (= e!170809 e!170812)))

(assert (=> b!263631 (= c!45015 (validKeyInArray!0 (select (arr!5992 (_keys!7033 lt!132778)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263627 () Bool)

(assert (=> b!263627 (= e!170810 (contains!1892 (ite c!44955 (Cons!3814 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000) Nil!3815) Nil!3815) (select (arr!5992 (_keys!7033 lt!132778)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63275 () Bool)

(declare-fun res!128704 () Bool)

(assert (=> d!63275 (=> res!128704 e!170811)))

(assert (=> d!63275 (= res!128704 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 lt!132778))))))

(assert (=> d!63275 (= (arrayNoDuplicates!0 (_keys!7033 lt!132778) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44955 (Cons!3814 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000) Nil!3815) Nil!3815)) e!170811)))

(assert (= (and d!63275 (not res!128704)) b!263629))

(assert (= (and b!263629 res!128705) b!263627))

(assert (= (and b!263629 res!128706) b!263631))

(assert (= (and b!263631 c!45015) b!263630))

(assert (= (and b!263631 (not c!45015)) b!263628))

(assert (= (or b!263630 b!263628) bm!25229))

(declare-fun m!279617 () Bool)

(assert (=> b!263629 m!279617))

(assert (=> b!263629 m!279617))

(declare-fun m!279619 () Bool)

(assert (=> b!263629 m!279619))

(assert (=> bm!25229 m!279617))

(declare-fun m!279621 () Bool)

(assert (=> bm!25229 m!279621))

(assert (=> b!263631 m!279617))

(assert (=> b!263631 m!279617))

(assert (=> b!263631 m!279619))

(assert (=> b!263627 m!279617))

(assert (=> b!263627 m!279617))

(declare-fun m!279623 () Bool)

(assert (=> b!263627 m!279623))

(assert (=> bm!25200 d!63275))

(declare-fun d!63277 () Bool)

(assert (=> d!63277 (= (isDefined!260 (getValueByKey!318 (toList!1927 lt!132981) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!544 (getValueByKey!318 (toList!1927 lt!132981) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!9258 () Bool)

(assert (= bs!9258 d!63277))

(assert (=> bs!9258 m!279349))

(declare-fun m!279625 () Bool)

(assert (=> bs!9258 m!279625))

(assert (=> b!263424 d!63277))

(declare-fun b!263633 () Bool)

(declare-fun e!170813 () Option!324)

(declare-fun e!170814 () Option!324)

(assert (=> b!263633 (= e!170813 e!170814)))

(declare-fun c!45017 () Bool)

(assert (=> b!263633 (= c!45017 (and ((_ is Cons!3813) (toList!1927 lt!132981)) (not (= (_1!2471 (h!4479 (toList!1927 lt!132981))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!263635 () Bool)

(assert (=> b!263635 (= e!170814 None!322)))

(declare-fun d!63279 () Bool)

(declare-fun c!45016 () Bool)

(assert (=> d!63279 (= c!45016 (and ((_ is Cons!3813) (toList!1927 lt!132981)) (= (_1!2471 (h!4479 (toList!1927 lt!132981))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63279 (= (getValueByKey!318 (toList!1927 lt!132981) #b0000000000000000000000000000000000000000000000000000000000000000) e!170813)))

(declare-fun b!263632 () Bool)

(assert (=> b!263632 (= e!170813 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!132981)))))))

(declare-fun b!263634 () Bool)

(assert (=> b!263634 (= e!170814 (getValueByKey!318 (t!8885 (toList!1927 lt!132981)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63279 c!45016) b!263632))

(assert (= (and d!63279 (not c!45016)) b!263633))

(assert (= (and b!263633 c!45017) b!263634))

(assert (= (and b!263633 (not c!45017)) b!263635))

(declare-fun m!279627 () Bool)

(assert (=> b!263634 m!279627))

(assert (=> b!263424 d!63279))

(declare-fun b!263636 () Bool)

(declare-fun e!170817 () SeekEntryResult!1193)

(assert (=> b!263636 (= e!170817 (Intermediate!1193 true (nextIndex!0 (toIndex!0 key!932 (mask!11207 thiss!1504)) #b00000000000000000000000000000000 (mask!11207 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!263637 () Bool)

(declare-fun e!170816 () SeekEntryResult!1193)

(assert (=> b!263637 (= e!170816 (Intermediate!1193 false (nextIndex!0 (toIndex!0 key!932 (mask!11207 thiss!1504)) #b00000000000000000000000000000000 (mask!11207 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!263638 () Bool)

(assert (=> b!263638 (= e!170816 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 key!932 (mask!11207 thiss!1504)) #b00000000000000000000000000000000 (mask!11207 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!11207 thiss!1504)) key!932 (_keys!7033 thiss!1504) (mask!11207 thiss!1504)))))

(declare-fun b!263639 () Bool)

(declare-fun lt!133368 () SeekEntryResult!1193)

(assert (=> b!263639 (and (bvsge (index!6944 lt!133368) #b00000000000000000000000000000000) (bvslt (index!6944 lt!133368) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun e!170818 () Bool)

(assert (=> b!263639 (= e!170818 (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6944 lt!133368)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!63281 () Bool)

(declare-fun e!170815 () Bool)

(assert (=> d!63281 e!170815))

(declare-fun c!45018 () Bool)

(assert (=> d!63281 (= c!45018 (and ((_ is Intermediate!1193) lt!133368) (undefined!2005 lt!133368)))))

(assert (=> d!63281 (= lt!133368 e!170817)))

(declare-fun c!45019 () Bool)

(assert (=> d!63281 (= c!45019 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!133367 () (_ BitVec 64))

(assert (=> d!63281 (= lt!133367 (select (arr!5992 (_keys!7033 thiss!1504)) (nextIndex!0 (toIndex!0 key!932 (mask!11207 thiss!1504)) #b00000000000000000000000000000000 (mask!11207 thiss!1504))))))

(assert (=> d!63281 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!63281 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!11207 thiss!1504)) #b00000000000000000000000000000000 (mask!11207 thiss!1504)) key!932 (_keys!7033 thiss!1504) (mask!11207 thiss!1504)) lt!133368)))

(declare-fun b!263640 () Bool)

(declare-fun e!170819 () Bool)

(assert (=> b!263640 (= e!170815 e!170819)))

(declare-fun res!128709 () Bool)

(assert (=> b!263640 (= res!128709 (and ((_ is Intermediate!1193) lt!133368) (not (undefined!2005 lt!133368)) (bvslt (x!25234 lt!133368) #b01111111111111111111111111111110) (bvsge (x!25234 lt!133368) #b00000000000000000000000000000000) (bvsge (x!25234 lt!133368) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!263640 (=> (not res!128709) (not e!170819))))

(declare-fun b!263641 () Bool)

(assert (=> b!263641 (and (bvsge (index!6944 lt!133368) #b00000000000000000000000000000000) (bvslt (index!6944 lt!133368) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun res!128707 () Bool)

(assert (=> b!263641 (= res!128707 (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6944 lt!133368)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263641 (=> res!128707 e!170818)))

(declare-fun b!263642 () Bool)

(assert (=> b!263642 (and (bvsge (index!6944 lt!133368) #b00000000000000000000000000000000) (bvslt (index!6944 lt!133368) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun res!128708 () Bool)

(assert (=> b!263642 (= res!128708 (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6944 lt!133368)) key!932))))

(assert (=> b!263642 (=> res!128708 e!170818)))

(assert (=> b!263642 (= e!170819 e!170818)))

(declare-fun b!263643 () Bool)

(assert (=> b!263643 (= e!170817 e!170816)))

(declare-fun c!45020 () Bool)

(assert (=> b!263643 (= c!45020 (or (= lt!133367 key!932) (= (bvadd lt!133367 lt!133367) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263644 () Bool)

(assert (=> b!263644 (= e!170815 (bvsge (x!25234 lt!133368) #b01111111111111111111111111111110))))

(assert (= (and d!63281 c!45019) b!263636))

(assert (= (and d!63281 (not c!45019)) b!263643))

(assert (= (and b!263643 c!45020) b!263637))

(assert (= (and b!263643 (not c!45020)) b!263638))

(assert (= (and d!63281 c!45018) b!263644))

(assert (= (and d!63281 (not c!45018)) b!263640))

(assert (= (and b!263640 res!128709) b!263642))

(assert (= (and b!263642 (not res!128708)) b!263641))

(assert (= (and b!263641 (not res!128707)) b!263639))

(assert (=> b!263638 m!279289))

(declare-fun m!279629 () Bool)

(assert (=> b!263638 m!279629))

(assert (=> b!263638 m!279629))

(declare-fun m!279631 () Bool)

(assert (=> b!263638 m!279631))

(declare-fun m!279633 () Bool)

(assert (=> b!263639 m!279633))

(assert (=> b!263641 m!279633))

(assert (=> d!63281 m!279289))

(declare-fun m!279635 () Bool)

(assert (=> d!63281 m!279635))

(assert (=> d!63281 m!278579))

(assert (=> b!263642 m!279633))

(assert (=> b!263372 d!63281))

(declare-fun d!63283 () Bool)

(declare-fun lt!133371 () (_ BitVec 32))

(assert (=> d!63283 (and (bvsge lt!133371 #b00000000000000000000000000000000) (bvslt lt!133371 (bvadd (mask!11207 thiss!1504) #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!63283 (= lt!133371 (choose!52 (toIndex!0 key!932 (mask!11207 thiss!1504)) #b00000000000000000000000000000000 (mask!11207 thiss!1504)))))

(assert (=> d!63283 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!63283 (= (nextIndex!0 (toIndex!0 key!932 (mask!11207 thiss!1504)) #b00000000000000000000000000000000 (mask!11207 thiss!1504)) lt!133371)))

(declare-fun bs!9259 () Bool)

(assert (= bs!9259 d!63283))

(assert (=> bs!9259 m!278735))

(declare-fun m!279637 () Bool)

(assert (=> bs!9259 m!279637))

(assert (=> bs!9259 m!278579))

(assert (=> b!263372 d!63283))

(declare-fun d!63285 () Bool)

(declare-fun e!170820 () Bool)

(assert (=> d!63285 e!170820))

(declare-fun res!128710 () Bool)

(assert (=> d!63285 (=> res!128710 e!170820)))

(declare-fun lt!133375 () Bool)

(assert (=> d!63285 (= res!128710 (not lt!133375))))

(declare-fun lt!133373 () Bool)

(assert (=> d!63285 (= lt!133375 lt!133373)))

(declare-fun lt!133372 () Unit!8136)

(declare-fun e!170821 () Unit!8136)

(assert (=> d!63285 (= lt!133372 e!170821)))

(declare-fun c!45021 () Bool)

(assert (=> d!63285 (= c!45021 lt!133373)))

(assert (=> d!63285 (= lt!133373 (containsKey!310 (toList!1927 lt!133204) (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))))))

(assert (=> d!63285 (= (contains!1889 lt!133204 (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))) lt!133375)))

(declare-fun b!263645 () Bool)

(declare-fun lt!133374 () Unit!8136)

(assert (=> b!263645 (= e!170821 lt!133374)))

(assert (=> b!263645 (= lt!133374 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133204) (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))))))

(assert (=> b!263645 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133204) (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))))))

(declare-fun b!263646 () Bool)

(declare-fun Unit!8173 () Unit!8136)

(assert (=> b!263646 (= e!170821 Unit!8173)))

(declare-fun b!263647 () Bool)

(assert (=> b!263647 (= e!170820 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133204) (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63285 c!45021) b!263645))

(assert (= (and d!63285 (not c!45021)) b!263646))

(assert (= (and d!63285 (not res!128710)) b!263647))

(declare-fun m!279639 () Bool)

(assert (=> d!63285 m!279639))

(declare-fun m!279641 () Bool)

(assert (=> b!263645 m!279641))

(assert (=> b!263645 m!279113))

(assert (=> b!263645 m!279113))

(declare-fun m!279643 () Bool)

(assert (=> b!263645 m!279643))

(assert (=> b!263647 m!279113))

(assert (=> b!263647 m!279113))

(assert (=> b!263647 m!279643))

(assert (=> d!63093 d!63285))

(declare-fun b!263649 () Bool)

(declare-fun e!170822 () Option!324)

(declare-fun e!170823 () Option!324)

(assert (=> b!263649 (= e!170822 e!170823)))

(declare-fun c!45023 () Bool)

(assert (=> b!263649 (= c!45023 (and ((_ is Cons!3813) lt!133203) (not (= (_1!2471 (h!4479 lt!133203)) (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))))))))

(declare-fun b!263651 () Bool)

(assert (=> b!263651 (= e!170823 None!322)))

(declare-fun d!63287 () Bool)

(declare-fun c!45022 () Bool)

(assert (=> d!63287 (= c!45022 (and ((_ is Cons!3813) lt!133203) (= (_1!2471 (h!4479 lt!133203)) (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))))))))

(assert (=> d!63287 (= (getValueByKey!318 lt!133203 (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))) e!170822)))

(declare-fun b!263648 () Bool)

(assert (=> b!263648 (= e!170822 (Some!323 (_2!2471 (h!4479 lt!133203))))))

(declare-fun b!263650 () Bool)

(assert (=> b!263650 (= e!170823 (getValueByKey!318 (t!8885 lt!133203) (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63287 c!45022) b!263648))

(assert (= (and d!63287 (not c!45022)) b!263649))

(assert (= (and b!263649 c!45023) b!263650))

(assert (= (and b!263649 (not c!45023)) b!263651))

(declare-fun m!279645 () Bool)

(assert (=> b!263650 m!279645))

(assert (=> d!63093 d!63287))

(declare-fun d!63289 () Bool)

(assert (=> d!63289 (= (getValueByKey!318 lt!133203 (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133376 () Unit!8136)

(assert (=> d!63289 (= lt!133376 (choose!1303 lt!133203 (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))))))

(declare-fun e!170824 () Bool)

(assert (=> d!63289 e!170824))

(declare-fun res!128711 () Bool)

(assert (=> d!63289 (=> (not res!128711) (not e!170824))))

(assert (=> d!63289 (= res!128711 (isStrictlySorted!372 lt!133203))))

(assert (=> d!63289 (= (lemmaContainsTupThenGetReturnValue!177 lt!133203 (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))) lt!133376)))

(declare-fun b!263652 () Bool)

(declare-fun res!128712 () Bool)

(assert (=> b!263652 (=> (not res!128712) (not e!170824))))

(assert (=> b!263652 (= res!128712 (containsKey!310 lt!133203 (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))))))

(declare-fun b!263653 () Bool)

(assert (=> b!263653 (= e!170824 (contains!1893 lt!133203 (tuple2!4921 (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63289 res!128711) b!263652))

(assert (= (and b!263652 res!128712) b!263653))

(assert (=> d!63289 m!279107))

(declare-fun m!279647 () Bool)

(assert (=> d!63289 m!279647))

(declare-fun m!279649 () Bool)

(assert (=> d!63289 m!279649))

(declare-fun m!279651 () Bool)

(assert (=> b!263652 m!279651))

(declare-fun m!279653 () Bool)

(assert (=> b!263653 m!279653))

(assert (=> d!63093 d!63289))

(declare-fun b!263654 () Bool)

(declare-fun e!170826 () List!3817)

(declare-fun call!25233 () List!3817)

(assert (=> b!263654 (= e!170826 call!25233)))

(declare-fun b!263655 () Bool)

(declare-fun e!170828 () List!3817)

(declare-fun call!25234 () List!3817)

(assert (=> b!263655 (= e!170828 call!25234)))

(declare-fun e!170829 () List!3817)

(declare-fun c!45026 () Bool)

(declare-fun c!45025 () Bool)

(declare-fun b!263656 () Bool)

(assert (=> b!263656 (= e!170829 (ite c!45026 (t!8885 (toList!1927 lt!132973)) (ite c!45025 (Cons!3813 (h!4479 (toList!1927 lt!132973)) (t!8885 (toList!1927 lt!132973))) Nil!3814)))))

(declare-fun e!170825 () Bool)

(declare-fun b!263657 () Bool)

(declare-fun lt!133377 () List!3817)

(assert (=> b!263657 (= e!170825 (contains!1893 lt!133377 (tuple2!4921 (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))))))))

(declare-fun bm!25230 () Bool)

(declare-fun call!25235 () List!3817)

(assert (=> bm!25230 (= call!25235 call!25233)))

(declare-fun b!263658 () Bool)

(declare-fun res!128714 () Bool)

(assert (=> b!263658 (=> (not res!128714) (not e!170825))))

(assert (=> b!263658 (= res!128714 (containsKey!310 lt!133377 (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))))))

(declare-fun b!263659 () Bool)

(assert (=> b!263659 (= e!170828 call!25234)))

(declare-fun b!263660 () Bool)

(assert (=> b!263660 (= e!170829 (insertStrictlySorted!180 (t!8885 (toList!1927 lt!132973)) (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))))))

(declare-fun d!63291 () Bool)

(assert (=> d!63291 e!170825))

(declare-fun res!128713 () Bool)

(assert (=> d!63291 (=> (not res!128713) (not e!170825))))

(assert (=> d!63291 (= res!128713 (isStrictlySorted!372 lt!133377))))

(assert (=> d!63291 (= lt!133377 e!170826)))

(declare-fun c!45027 () Bool)

(assert (=> d!63291 (= c!45027 (and ((_ is Cons!3813) (toList!1927 lt!132973)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!132973))) (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))))))))

(assert (=> d!63291 (isStrictlySorted!372 (toList!1927 lt!132973))))

(assert (=> d!63291 (= (insertStrictlySorted!180 (toList!1927 lt!132973) (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))) lt!133377)))

(declare-fun b!263661 () Bool)

(assert (=> b!263661 (= c!45025 (and ((_ is Cons!3813) (toList!1927 lt!132973)) (bvsgt (_1!2471 (h!4479 (toList!1927 lt!132973))) (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))))))))

(declare-fun e!170827 () List!3817)

(assert (=> b!263661 (= e!170827 e!170828)))

(declare-fun bm!25231 () Bool)

(assert (=> bm!25231 (= call!25233 ($colon$colon!107 e!170829 (ite c!45027 (h!4479 (toList!1927 lt!132973)) (tuple2!4921 (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))))))))

(declare-fun c!45024 () Bool)

(assert (=> bm!25231 (= c!45024 c!45027)))

(declare-fun bm!25232 () Bool)

(assert (=> bm!25232 (= call!25234 call!25235)))

(declare-fun b!263662 () Bool)

(assert (=> b!263662 (= e!170827 call!25235)))

(declare-fun b!263663 () Bool)

(assert (=> b!263663 (= e!170826 e!170827)))

(assert (=> b!263663 (= c!45026 (and ((_ is Cons!3813) (toList!1927 lt!132973)) (= (_1!2471 (h!4479 (toList!1927 lt!132973))) (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63291 c!45027) b!263654))

(assert (= (and d!63291 (not c!45027)) b!263663))

(assert (= (and b!263663 c!45026) b!263662))

(assert (= (and b!263663 (not c!45026)) b!263661))

(assert (= (and b!263661 c!45025) b!263659))

(assert (= (and b!263661 (not c!45025)) b!263655))

(assert (= (or b!263659 b!263655) bm!25232))

(assert (= (or b!263662 bm!25232) bm!25230))

(assert (= (or b!263654 bm!25230) bm!25231))

(assert (= (and bm!25231 c!45024) b!263660))

(assert (= (and bm!25231 (not c!45024)) b!263656))

(assert (= (and d!63291 res!128713) b!263658))

(assert (= (and b!263658 res!128714) b!263657))

(declare-fun m!279655 () Bool)

(assert (=> b!263660 m!279655))

(declare-fun m!279657 () Bool)

(assert (=> bm!25231 m!279657))

(declare-fun m!279659 () Bool)

(assert (=> b!263657 m!279659))

(declare-fun m!279661 () Bool)

(assert (=> b!263658 m!279661))

(declare-fun m!279663 () Bool)

(assert (=> d!63291 m!279663))

(declare-fun m!279665 () Bool)

(assert (=> d!63291 m!279665))

(assert (=> d!63093 d!63291))

(declare-fun b!263665 () Bool)

(declare-fun e!170830 () Option!324)

(declare-fun e!170831 () Option!324)

(assert (=> b!263665 (= e!170830 e!170831)))

(declare-fun c!45029 () Bool)

(assert (=> b!263665 (= c!45029 (and ((_ is Cons!3813) (t!8885 (toList!1927 lt!133021))) (not (= (_1!2471 (h!4479 (t!8885 (toList!1927 lt!133021)))) (_1!2471 lt!132765)))))))

(declare-fun b!263667 () Bool)

(assert (=> b!263667 (= e!170831 None!322)))

(declare-fun d!63293 () Bool)

(declare-fun c!45028 () Bool)

(assert (=> d!63293 (= c!45028 (and ((_ is Cons!3813) (t!8885 (toList!1927 lt!133021))) (= (_1!2471 (h!4479 (t!8885 (toList!1927 lt!133021)))) (_1!2471 lt!132765))))))

(assert (=> d!63293 (= (getValueByKey!318 (t!8885 (toList!1927 lt!133021)) (_1!2471 lt!132765)) e!170830)))

(declare-fun b!263664 () Bool)

(assert (=> b!263664 (= e!170830 (Some!323 (_2!2471 (h!4479 (t!8885 (toList!1927 lt!133021))))))))

(declare-fun b!263666 () Bool)

(assert (=> b!263666 (= e!170831 (getValueByKey!318 (t!8885 (t!8885 (toList!1927 lt!133021))) (_1!2471 lt!132765)))))

(assert (= (and d!63293 c!45028) b!263664))

(assert (= (and d!63293 (not c!45028)) b!263665))

(assert (= (and b!263665 c!45029) b!263666))

(assert (= (and b!263665 (not c!45029)) b!263667))

(declare-fun m!279667 () Bool)

(assert (=> b!263666 m!279667))

(assert (=> b!263408 d!63293))

(declare-fun b!263669 () Bool)

(declare-fun e!170832 () Option!324)

(declare-fun e!170833 () Option!324)

(assert (=> b!263669 (= e!170832 e!170833)))

(declare-fun c!45031 () Bool)

(assert (=> b!263669 (= c!45031 (and ((_ is Cons!3813) (toList!1927 lt!133259)) (not (= (_1!2471 (h!4479 (toList!1927 lt!133259))) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun b!263671 () Bool)

(assert (=> b!263671 (= e!170833 None!322)))

(declare-fun d!63295 () Bool)

(declare-fun c!45030 () Bool)

(assert (=> d!63295 (= c!45030 (and ((_ is Cons!3813) (toList!1927 lt!133259)) (= (_1!2471 (h!4479 (toList!1927 lt!133259))) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63295 (= (getValueByKey!318 (toList!1927 lt!133259) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) e!170832)))

(declare-fun b!263668 () Bool)

(assert (=> b!263668 (= e!170832 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!133259)))))))

(declare-fun b!263670 () Bool)

(assert (=> b!263670 (= e!170833 (getValueByKey!318 (t!8885 (toList!1927 lt!133259)) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63295 c!45030) b!263668))

(assert (= (and d!63295 (not c!45030)) b!263669))

(assert (= (and b!263669 c!45031) b!263670))

(assert (= (and b!263669 (not c!45031)) b!263671))

(declare-fun m!279669 () Bool)

(assert (=> b!263670 m!279669))

(assert (=> b!263350 d!63295))

(assert (=> b!263268 d!63001))

(assert (=> d!63129 d!63127))

(declare-fun lt!133378 () Bool)

(declare-fun d!63297 () Bool)

(assert (=> d!63297 (= lt!133378 (select (content!177 Nil!3815) (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!170835 () Bool)

(assert (=> d!63297 (= lt!133378 e!170835)))

(declare-fun res!128716 () Bool)

(assert (=> d!63297 (=> (not res!128716) (not e!170835))))

(assert (=> d!63297 (= res!128716 ((_ is Cons!3814) Nil!3815))))

(assert (=> d!63297 (= (contains!1892 Nil!3815 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)) lt!133378)))

(declare-fun b!263672 () Bool)

(declare-fun e!170834 () Bool)

(assert (=> b!263672 (= e!170835 e!170834)))

(declare-fun res!128715 () Bool)

(assert (=> b!263672 (=> res!128715 e!170834)))

(assert (=> b!263672 (= res!128715 (= (h!4480 Nil!3815) (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!263673 () Bool)

(assert (=> b!263673 (= e!170834 (contains!1892 (t!8886 Nil!3815) (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!63297 res!128716) b!263672))

(assert (= (and b!263672 (not res!128715)) b!263673))

(assert (=> d!63297 m!278929))

(assert (=> d!63297 m!278833))

(declare-fun m!279671 () Bool)

(assert (=> d!63297 m!279671))

(assert (=> b!263673 m!278833))

(declare-fun m!279673 () Bool)

(assert (=> b!263673 m!279673))

(assert (=> b!263272 d!63297))

(declare-fun d!63299 () Bool)

(assert (=> d!63299 (= (content!177 Nil!3815) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!63035 d!63299))

(declare-fun b!263675 () Bool)

(declare-fun e!170836 () Option!324)

(declare-fun e!170837 () Option!324)

(assert (=> b!263675 (= e!170836 e!170837)))

(declare-fun c!45033 () Bool)

(assert (=> b!263675 (= c!45033 (and ((_ is Cons!3813) (toList!1927 lt!133303)) (not (= (_1!2471 (h!4479 (toList!1927 lt!133303))) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun b!263677 () Bool)

(assert (=> b!263677 (= e!170837 None!322)))

(declare-fun d!63301 () Bool)

(declare-fun c!45032 () Bool)

(assert (=> d!63301 (= c!45032 (and ((_ is Cons!3813) (toList!1927 lt!133303)) (= (_1!2471 (h!4479 (toList!1927 lt!133303))) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63301 (= (getValueByKey!318 (toList!1927 lt!133303) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) e!170836)))

(declare-fun b!263674 () Bool)

(assert (=> b!263674 (= e!170836 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!133303)))))))

(declare-fun b!263676 () Bool)

(assert (=> b!263676 (= e!170837 (getValueByKey!318 (t!8885 (toList!1927 lt!133303)) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63301 c!45032) b!263674))

(assert (= (and d!63301 (not c!45032)) b!263675))

(assert (= (and b!263675 c!45033) b!263676))

(assert (= (and b!263675 (not c!45033)) b!263677))

(declare-fun m!279675 () Bool)

(assert (=> b!263676 m!279675))

(assert (=> b!263433 d!63301))

(declare-fun b!263679 () Bool)

(declare-fun e!170838 () Option!324)

(declare-fun e!170839 () Option!324)

(assert (=> b!263679 (= e!170838 e!170839)))

(declare-fun c!45035 () Bool)

(assert (=> b!263679 (= c!45035 (and ((_ is Cons!3813) (toList!1927 lt!133218)) (not (= (_1!2471 (h!4479 (toList!1927 lt!133218))) (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))))))))

(declare-fun b!263681 () Bool)

(assert (=> b!263681 (= e!170839 None!322)))

(declare-fun d!63303 () Bool)

(declare-fun c!45034 () Bool)

(assert (=> d!63303 (= c!45034 (and ((_ is Cons!3813) (toList!1927 lt!133218)) (= (_1!2471 (h!4479 (toList!1927 lt!133218))) (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))))))))

(assert (=> d!63303 (= (getValueByKey!318 (toList!1927 lt!133218) (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))) e!170838)))

(declare-fun b!263678 () Bool)

(assert (=> b!263678 (= e!170838 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!133218)))))))

(declare-fun b!263680 () Bool)

(assert (=> b!263680 (= e!170839 (getValueByKey!318 (t!8885 (toList!1927 lt!133218)) (_1!2471 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63303 c!45034) b!263678))

(assert (= (and d!63303 (not c!45034)) b!263679))

(assert (= (and b!263679 c!45035) b!263680))

(assert (= (and b!263679 (not c!45035)) b!263681))

(declare-fun m!279677 () Bool)

(assert (=> b!263680 m!279677))

(assert (=> b!263288 d!63303))

(declare-fun d!63305 () Bool)

(declare-fun e!170840 () Bool)

(assert (=> d!63305 e!170840))

(declare-fun res!128717 () Bool)

(assert (=> d!63305 (=> res!128717 e!170840)))

(declare-fun lt!133382 () Bool)

(assert (=> d!63305 (= res!128717 (not lt!133382))))

(declare-fun lt!133380 () Bool)

(assert (=> d!63305 (= lt!133382 lt!133380)))

(declare-fun lt!133379 () Unit!8136)

(declare-fun e!170841 () Unit!8136)

(assert (=> d!63305 (= lt!133379 e!170841)))

(declare-fun c!45036 () Bool)

(assert (=> d!63305 (= c!45036 lt!133380)))

(assert (=> d!63305 (= lt!133380 (containsKey!310 (toList!1927 lt!133245) (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)))))

(assert (=> d!63305 (= (contains!1889 lt!133245 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)) lt!133382)))

(declare-fun b!263682 () Bool)

(declare-fun lt!133381 () Unit!8136)

(assert (=> b!263682 (= e!170841 lt!133381)))

(assert (=> b!263682 (= lt!133381 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133245) (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)))))

(assert (=> b!263682 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133245) (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)))))

(declare-fun b!263683 () Bool)

(declare-fun Unit!8174 () Unit!8136)

(assert (=> b!263683 (= e!170841 Unit!8174)))

(declare-fun b!263684 () Bool)

(assert (=> b!263684 (= e!170840 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133245) (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000))))))

(assert (= (and d!63305 c!45036) b!263682))

(assert (= (and d!63305 (not c!45036)) b!263683))

(assert (= (and d!63305 (not res!128717)) b!263684))

(assert (=> d!63305 m!278889))

(declare-fun m!279679 () Bool)

(assert (=> d!63305 m!279679))

(assert (=> b!263682 m!278889))

(declare-fun m!279681 () Bool)

(assert (=> b!263682 m!279681))

(assert (=> b!263682 m!278889))

(declare-fun m!279683 () Bool)

(assert (=> b!263682 m!279683))

(assert (=> b!263682 m!279683))

(declare-fun m!279685 () Bool)

(assert (=> b!263682 m!279685))

(assert (=> b!263684 m!278889))

(assert (=> b!263684 m!279683))

(assert (=> b!263684 m!279683))

(assert (=> b!263684 m!279685))

(assert (=> b!263305 d!63305))

(declare-fun d!63307 () Bool)

(assert (not d!63307))

(assert (=> b!263204 d!63307))

(declare-fun d!63309 () Bool)

(assert (=> d!63309 (= (get!3088 (getValueByKey!318 (toList!1927 lt!133003) (select (arr!5992 lt!132768) #b00000000000000000000000000000000))) (v!5502 (getValueByKey!318 (toList!1927 lt!133003) (select (arr!5992 lt!132768) #b00000000000000000000000000000000))))))

(assert (=> d!63225 d!63309))

(declare-fun b!263686 () Bool)

(declare-fun e!170842 () Option!324)

(declare-fun e!170843 () Option!324)

(assert (=> b!263686 (= e!170842 e!170843)))

(declare-fun c!45038 () Bool)

(assert (=> b!263686 (= c!45038 (and ((_ is Cons!3813) (toList!1927 lt!133003)) (not (= (_1!2471 (h!4479 (toList!1927 lt!133003))) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))))

(declare-fun b!263688 () Bool)

(assert (=> b!263688 (= e!170843 None!322)))

(declare-fun d!63311 () Bool)

(declare-fun c!45037 () Bool)

(assert (=> d!63311 (= c!45037 (and ((_ is Cons!3813) (toList!1927 lt!133003)) (= (_1!2471 (h!4479 (toList!1927 lt!133003))) (select (arr!5992 lt!132768) #b00000000000000000000000000000000))))))

(assert (=> d!63311 (= (getValueByKey!318 (toList!1927 lt!133003) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)) e!170842)))

(declare-fun b!263685 () Bool)

(assert (=> b!263685 (= e!170842 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!133003)))))))

(declare-fun b!263687 () Bool)

(assert (=> b!263687 (= e!170843 (getValueByKey!318 (t!8885 (toList!1927 lt!133003)) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(assert (= (and d!63311 c!45037) b!263685))

(assert (= (and d!63311 (not c!45037)) b!263686))

(assert (= (and b!263686 c!45038) b!263687))

(assert (= (and b!263686 (not c!45038)) b!263688))

(assert (=> b!263687 m!278587))

(declare-fun m!279687 () Bool)

(assert (=> b!263687 m!279687))

(assert (=> d!63225 d!63311))

(declare-fun d!63313 () Bool)

(declare-fun e!170844 () Bool)

(assert (=> d!63313 e!170844))

(declare-fun res!128718 () Bool)

(assert (=> d!63313 (=> res!128718 e!170844)))

(declare-fun lt!133386 () Bool)

(assert (=> d!63313 (= res!128718 (not lt!133386))))

(declare-fun lt!133384 () Bool)

(assert (=> d!63313 (= lt!133386 lt!133384)))

(declare-fun lt!133383 () Unit!8136)

(declare-fun e!170845 () Unit!8136)

(assert (=> d!63313 (= lt!133383 e!170845)))

(declare-fun c!45039 () Bool)

(assert (=> d!63313 (= c!45039 lt!133384)))

(assert (=> d!63313 (= lt!133384 (containsKey!310 (toList!1927 lt!133098) (_1!2471 (tuple2!4921 key!932 v!346))))))

(assert (=> d!63313 (= (contains!1889 lt!133098 (_1!2471 (tuple2!4921 key!932 v!346))) lt!133386)))

(declare-fun b!263689 () Bool)

(declare-fun lt!133385 () Unit!8136)

(assert (=> b!263689 (= e!170845 lt!133385)))

(assert (=> b!263689 (= lt!133385 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133098) (_1!2471 (tuple2!4921 key!932 v!346))))))

(assert (=> b!263689 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133098) (_1!2471 (tuple2!4921 key!932 v!346))))))

(declare-fun b!263690 () Bool)

(declare-fun Unit!8175 () Unit!8136)

(assert (=> b!263690 (= e!170845 Unit!8175)))

(declare-fun b!263691 () Bool)

(assert (=> b!263691 (= e!170844 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133098) (_1!2471 (tuple2!4921 key!932 v!346)))))))

(assert (= (and d!63313 c!45039) b!263689))

(assert (= (and d!63313 (not c!45039)) b!263690))

(assert (= (and d!63313 (not res!128718)) b!263691))

(declare-fun m!279689 () Bool)

(assert (=> d!63313 m!279689))

(declare-fun m!279691 () Bool)

(assert (=> b!263689 m!279691))

(assert (=> b!263689 m!278817))

(assert (=> b!263689 m!278817))

(declare-fun m!279693 () Bool)

(assert (=> b!263689 m!279693))

(assert (=> b!263691 m!278817))

(assert (=> b!263691 m!278817))

(assert (=> b!263691 m!279693))

(assert (=> d!63003 d!63313))

(declare-fun b!263693 () Bool)

(declare-fun e!170846 () Option!324)

(declare-fun e!170847 () Option!324)

(assert (=> b!263693 (= e!170846 e!170847)))

(declare-fun c!45041 () Bool)

(assert (=> b!263693 (= c!45041 (and ((_ is Cons!3813) lt!133097) (not (= (_1!2471 (h!4479 lt!133097)) (_1!2471 (tuple2!4921 key!932 v!346))))))))

(declare-fun b!263695 () Bool)

(assert (=> b!263695 (= e!170847 None!322)))

(declare-fun d!63315 () Bool)

(declare-fun c!45040 () Bool)

(assert (=> d!63315 (= c!45040 (and ((_ is Cons!3813) lt!133097) (= (_1!2471 (h!4479 lt!133097)) (_1!2471 (tuple2!4921 key!932 v!346)))))))

(assert (=> d!63315 (= (getValueByKey!318 lt!133097 (_1!2471 (tuple2!4921 key!932 v!346))) e!170846)))

(declare-fun b!263692 () Bool)

(assert (=> b!263692 (= e!170846 (Some!323 (_2!2471 (h!4479 lt!133097))))))

(declare-fun b!263694 () Bool)

(assert (=> b!263694 (= e!170847 (getValueByKey!318 (t!8885 lt!133097) (_1!2471 (tuple2!4921 key!932 v!346))))))

(assert (= (and d!63315 c!45040) b!263692))

(assert (= (and d!63315 (not c!45040)) b!263693))

(assert (= (and b!263693 c!45041) b!263694))

(assert (= (and b!263693 (not c!45041)) b!263695))

(declare-fun m!279695 () Bool)

(assert (=> b!263694 m!279695))

(assert (=> d!63003 d!63315))

(declare-fun d!63317 () Bool)

(assert (=> d!63317 (= (getValueByKey!318 lt!133097 (_1!2471 (tuple2!4921 key!932 v!346))) (Some!323 (_2!2471 (tuple2!4921 key!932 v!346))))))

(declare-fun lt!133387 () Unit!8136)

(assert (=> d!63317 (= lt!133387 (choose!1303 lt!133097 (_1!2471 (tuple2!4921 key!932 v!346)) (_2!2471 (tuple2!4921 key!932 v!346))))))

(declare-fun e!170848 () Bool)

(assert (=> d!63317 e!170848))

(declare-fun res!128719 () Bool)

(assert (=> d!63317 (=> (not res!128719) (not e!170848))))

(assert (=> d!63317 (= res!128719 (isStrictlySorted!372 lt!133097))))

(assert (=> d!63317 (= (lemmaContainsTupThenGetReturnValue!177 lt!133097 (_1!2471 (tuple2!4921 key!932 v!346)) (_2!2471 (tuple2!4921 key!932 v!346))) lt!133387)))

(declare-fun b!263696 () Bool)

(declare-fun res!128720 () Bool)

(assert (=> b!263696 (=> (not res!128720) (not e!170848))))

(assert (=> b!263696 (= res!128720 (containsKey!310 lt!133097 (_1!2471 (tuple2!4921 key!932 v!346))))))

(declare-fun b!263697 () Bool)

(assert (=> b!263697 (= e!170848 (contains!1893 lt!133097 (tuple2!4921 (_1!2471 (tuple2!4921 key!932 v!346)) (_2!2471 (tuple2!4921 key!932 v!346)))))))

(assert (= (and d!63317 res!128719) b!263696))

(assert (= (and b!263696 res!128720) b!263697))

(assert (=> d!63317 m!278811))

(declare-fun m!279697 () Bool)

(assert (=> d!63317 m!279697))

(declare-fun m!279699 () Bool)

(assert (=> d!63317 m!279699))

(declare-fun m!279701 () Bool)

(assert (=> b!263696 m!279701))

(declare-fun m!279703 () Bool)

(assert (=> b!263697 m!279703))

(assert (=> d!63003 d!63317))

(declare-fun b!263698 () Bool)

(declare-fun e!170850 () List!3817)

(declare-fun call!25236 () List!3817)

(assert (=> b!263698 (= e!170850 call!25236)))

(declare-fun b!263699 () Bool)

(declare-fun e!170852 () List!3817)

(declare-fun call!25237 () List!3817)

(assert (=> b!263699 (= e!170852 call!25237)))

(declare-fun c!45043 () Bool)

(declare-fun e!170853 () List!3817)

(declare-fun b!263700 () Bool)

(declare-fun c!45044 () Bool)

(assert (=> b!263700 (= e!170853 (ite c!45044 (t!8885 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (ite c!45043 (Cons!3813 (h!4479 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (t!8885 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) Nil!3814)))))

(declare-fun e!170849 () Bool)

(declare-fun lt!133388 () List!3817)

(declare-fun b!263701 () Bool)

(assert (=> b!263701 (= e!170849 (contains!1893 lt!133388 (tuple2!4921 (_1!2471 (tuple2!4921 key!932 v!346)) (_2!2471 (tuple2!4921 key!932 v!346)))))))

(declare-fun bm!25233 () Bool)

(declare-fun call!25238 () List!3817)

(assert (=> bm!25233 (= call!25238 call!25236)))

(declare-fun b!263702 () Bool)

(declare-fun res!128722 () Bool)

(assert (=> b!263702 (=> (not res!128722) (not e!170849))))

(assert (=> b!263702 (= res!128722 (containsKey!310 lt!133388 (_1!2471 (tuple2!4921 key!932 v!346))))))

(declare-fun b!263703 () Bool)

(assert (=> b!263703 (= e!170852 call!25237)))

(declare-fun b!263704 () Bool)

(assert (=> b!263704 (= e!170853 (insertStrictlySorted!180 (t!8885 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (_1!2471 (tuple2!4921 key!932 v!346)) (_2!2471 (tuple2!4921 key!932 v!346))))))

(declare-fun d!63319 () Bool)

(assert (=> d!63319 e!170849))

(declare-fun res!128721 () Bool)

(assert (=> d!63319 (=> (not res!128721) (not e!170849))))

(assert (=> d!63319 (= res!128721 (isStrictlySorted!372 lt!133388))))

(assert (=> d!63319 (= lt!133388 e!170850)))

(declare-fun c!45045 () Bool)

(assert (=> d!63319 (= c!45045 (and ((_ is Cons!3813) (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (bvslt (_1!2471 (h!4479 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (_1!2471 (tuple2!4921 key!932 v!346)))))))

(assert (=> d!63319 (isStrictlySorted!372 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))))

(assert (=> d!63319 (= (insertStrictlySorted!180 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (_1!2471 (tuple2!4921 key!932 v!346)) (_2!2471 (tuple2!4921 key!932 v!346))) lt!133388)))

(declare-fun b!263705 () Bool)

(assert (=> b!263705 (= c!45043 (and ((_ is Cons!3813) (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (bvsgt (_1!2471 (h!4479 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (_1!2471 (tuple2!4921 key!932 v!346)))))))

(declare-fun e!170851 () List!3817)

(assert (=> b!263705 (= e!170851 e!170852)))

(declare-fun bm!25234 () Bool)

(assert (=> bm!25234 (= call!25236 ($colon$colon!107 e!170853 (ite c!45045 (h!4479 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (tuple2!4921 (_1!2471 (tuple2!4921 key!932 v!346)) (_2!2471 (tuple2!4921 key!932 v!346))))))))

(declare-fun c!45042 () Bool)

(assert (=> bm!25234 (= c!45042 c!45045)))

(declare-fun bm!25235 () Bool)

(assert (=> bm!25235 (= call!25237 call!25238)))

(declare-fun b!263706 () Bool)

(assert (=> b!263706 (= e!170851 call!25238)))

(declare-fun b!263707 () Bool)

(assert (=> b!263707 (= e!170850 e!170851)))

(assert (=> b!263707 (= c!45044 (and ((_ is Cons!3813) (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (= (_1!2471 (h!4479 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (_1!2471 (tuple2!4921 key!932 v!346)))))))

(assert (= (and d!63319 c!45045) b!263698))

(assert (= (and d!63319 (not c!45045)) b!263707))

(assert (= (and b!263707 c!45044) b!263706))

(assert (= (and b!263707 (not c!45044)) b!263705))

(assert (= (and b!263705 c!45043) b!263703))

(assert (= (and b!263705 (not c!45043)) b!263699))

(assert (= (or b!263703 b!263699) bm!25235))

(assert (= (or b!263706 bm!25235) bm!25233))

(assert (= (or b!263698 bm!25233) bm!25234))

(assert (= (and bm!25234 c!45042) b!263704))

(assert (= (and bm!25234 (not c!45042)) b!263700))

(assert (= (and d!63319 res!128721) b!263702))

(assert (= (and b!263702 res!128722) b!263701))

(declare-fun m!279705 () Bool)

(assert (=> b!263704 m!279705))

(declare-fun m!279707 () Bool)

(assert (=> bm!25234 m!279707))

(declare-fun m!279709 () Bool)

(assert (=> b!263701 m!279709))

(declare-fun m!279711 () Bool)

(assert (=> b!263702 m!279711))

(declare-fun m!279713 () Bool)

(assert (=> d!63319 m!279713))

(declare-fun m!279715 () Bool)

(assert (=> d!63319 m!279715))

(assert (=> d!63003 d!63319))

(declare-fun d!63321 () Bool)

(assert (=> d!63321 (= (isEmpty!544 (getValueByKey!318 (toList!1927 lt!132775) key!932)) (not ((_ is Some!323) (getValueByKey!318 (toList!1927 lt!132775) key!932))))))

(assert (=> d!63031 d!63321))

(assert (=> d!63233 d!63159))

(assert (=> d!63233 d!62965))

(declare-fun d!63323 () Bool)

(assert (=> d!63323 (= (get!3088 (getValueByKey!318 (toList!1927 lt!132993) lt!132994)) (v!5502 (getValueByKey!318 (toList!1927 lt!132993) lt!132994)))))

(assert (=> d!63069 d!63323))

(declare-fun b!263709 () Bool)

(declare-fun e!170854 () Option!324)

(declare-fun e!170855 () Option!324)

(assert (=> b!263709 (= e!170854 e!170855)))

(declare-fun c!45047 () Bool)

(assert (=> b!263709 (= c!45047 (and ((_ is Cons!3813) (toList!1927 lt!132993)) (not (= (_1!2471 (h!4479 (toList!1927 lt!132993))) lt!132994))))))

(declare-fun b!263711 () Bool)

(assert (=> b!263711 (= e!170855 None!322)))

(declare-fun d!63325 () Bool)

(declare-fun c!45046 () Bool)

(assert (=> d!63325 (= c!45046 (and ((_ is Cons!3813) (toList!1927 lt!132993)) (= (_1!2471 (h!4479 (toList!1927 lt!132993))) lt!132994)))))

(assert (=> d!63325 (= (getValueByKey!318 (toList!1927 lt!132993) lt!132994) e!170854)))

(declare-fun b!263708 () Bool)

(assert (=> b!263708 (= e!170854 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!132993)))))))

(declare-fun b!263710 () Bool)

(assert (=> b!263710 (= e!170855 (getValueByKey!318 (t!8885 (toList!1927 lt!132993)) lt!132994))))

(assert (= (and d!63325 c!45046) b!263708))

(assert (= (and d!63325 (not c!45046)) b!263709))

(assert (= (and b!263709 c!45047) b!263710))

(assert (= (and b!263709 (not c!45047)) b!263711))

(declare-fun m!279717 () Bool)

(assert (=> b!263710 m!279717))

(assert (=> d!63069 d!63325))

(assert (=> d!63191 d!62979))

(declare-fun d!63327 () Bool)

(assert (=> d!63327 (= (validKeyInArray!0 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263430 d!63327))

(declare-fun b!263713 () Bool)

(declare-fun e!170856 () Option!324)

(declare-fun e!170857 () Option!324)

(assert (=> b!263713 (= e!170856 e!170857)))

(declare-fun c!45049 () Bool)

(assert (=> b!263713 (= c!45049 (and ((_ is Cons!3813) (toList!1927 lt!133204)) (not (= (_1!2471 (h!4479 (toList!1927 lt!133204))) (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))))))))

(declare-fun b!263715 () Bool)

(assert (=> b!263715 (= e!170857 None!322)))

(declare-fun c!45048 () Bool)

(declare-fun d!63329 () Bool)

(assert (=> d!63329 (= c!45048 (and ((_ is Cons!3813) (toList!1927 lt!133204)) (= (_1!2471 (h!4479 (toList!1927 lt!133204))) (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))))))))

(assert (=> d!63329 (= (getValueByKey!318 (toList!1927 lt!133204) (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))) e!170856)))

(declare-fun b!263712 () Bool)

(assert (=> b!263712 (= e!170856 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!133204)))))))

(declare-fun b!263714 () Bool)

(assert (=> b!263714 (= e!170857 (getValueByKey!318 (t!8885 (toList!1927 lt!133204)) (_1!2471 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63329 c!45048) b!263712))

(assert (= (and d!63329 (not c!45048)) b!263713))

(assert (= (and b!263713 c!45049) b!263714))

(assert (= (and b!263713 (not c!45049)) b!263715))

(declare-fun m!279719 () Bool)

(assert (=> b!263714 m!279719))

(assert (=> b!263280 d!63329))

(declare-fun d!63331 () Bool)

(assert (=> d!63331 (= (inRange!0 (ite c!44960 (index!6942 lt!133308) (index!6945 lt!133308)) (mask!11207 thiss!1504)) (and (bvsge (ite c!44960 (index!6942 lt!133308) (index!6945 lt!133308)) #b00000000000000000000000000000000) (bvslt (ite c!44960 (index!6942 lt!133308) (index!6945 lt!133308)) (bvadd (mask!11207 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!25205 d!63331))

(declare-fun d!63333 () Bool)

(assert (=> d!63333 (= (isEmpty!544 (getValueByKey!318 (toList!1927 lt!132776) key!932)) (not ((_ is Some!323) (getValueByKey!318 (toList!1927 lt!132776) key!932))))))

(assert (=> d!63025 d!63333))

(declare-fun d!63335 () Bool)

(declare-fun res!128723 () Bool)

(declare-fun e!170858 () Bool)

(assert (=> d!63335 (=> res!128723 e!170858)))

(assert (=> d!63335 (= res!128723 (and ((_ is Cons!3813) lt!133020) (= (_1!2471 (h!4479 lt!133020)) (_1!2471 lt!132765))))))

(assert (=> d!63335 (= (containsKey!310 lt!133020 (_1!2471 lt!132765)) e!170858)))

(declare-fun b!263716 () Bool)

(declare-fun e!170859 () Bool)

(assert (=> b!263716 (= e!170858 e!170859)))

(declare-fun res!128724 () Bool)

(assert (=> b!263716 (=> (not res!128724) (not e!170859))))

(assert (=> b!263716 (= res!128724 (and (or (not ((_ is Cons!3813) lt!133020)) (bvsle (_1!2471 (h!4479 lt!133020)) (_1!2471 lt!132765))) ((_ is Cons!3813) lt!133020) (bvslt (_1!2471 (h!4479 lt!133020)) (_1!2471 lt!132765))))))

(declare-fun b!263717 () Bool)

(assert (=> b!263717 (= e!170859 (containsKey!310 (t!8885 lt!133020) (_1!2471 lt!132765)))))

(assert (= (and d!63335 (not res!128723)) b!263716))

(assert (= (and b!263716 res!128724) b!263717))

(declare-fun m!279721 () Bool)

(assert (=> b!263717 m!279721))

(assert (=> b!263488 d!63335))

(declare-fun d!63337 () Bool)

(assert (=> d!63337 (= (isDefined!260 (getValueByKey!318 (toList!1927 lt!133021) (_1!2471 lt!132765))) (not (isEmpty!544 (getValueByKey!318 (toList!1927 lt!133021) (_1!2471 lt!132765)))))))

(declare-fun bs!9260 () Bool)

(assert (= bs!9260 d!63337))

(assert (=> bs!9260 m!278665))

(declare-fun m!279723 () Bool)

(assert (=> bs!9260 m!279723))

(assert (=> b!263479 d!63337))

(assert (=> b!263479 d!63167))

(declare-fun b!263719 () Bool)

(declare-fun e!170860 () Option!324)

(declare-fun e!170861 () Option!324)

(assert (=> b!263719 (= e!170860 e!170861)))

(declare-fun c!45051 () Bool)

(assert (=> b!263719 (= c!45051 (and ((_ is Cons!3813) (t!8885 lt!133072)) (not (= (_1!2471 (h!4479 (t!8885 lt!133072))) (_1!2471 lt!132765)))))))

(declare-fun b!263721 () Bool)

(assert (=> b!263721 (= e!170861 None!322)))

(declare-fun d!63339 () Bool)

(declare-fun c!45050 () Bool)

(assert (=> d!63339 (= c!45050 (and ((_ is Cons!3813) (t!8885 lt!133072)) (= (_1!2471 (h!4479 (t!8885 lt!133072))) (_1!2471 lt!132765))))))

(assert (=> d!63339 (= (getValueByKey!318 (t!8885 lt!133072) (_1!2471 lt!132765)) e!170860)))

(declare-fun b!263718 () Bool)

(assert (=> b!263718 (= e!170860 (Some!323 (_2!2471 (h!4479 (t!8885 lt!133072)))))))

(declare-fun b!263720 () Bool)

(assert (=> b!263720 (= e!170861 (getValueByKey!318 (t!8885 (t!8885 lt!133072)) (_1!2471 lt!132765)))))

(assert (= (and d!63339 c!45050) b!263718))

(assert (= (and d!63339 (not c!45050)) b!263719))

(assert (= (and b!263719 c!45051) b!263720))

(assert (= (and b!263719 (not c!45051)) b!263721))

(declare-fun m!279725 () Bool)

(assert (=> b!263720 m!279725))

(assert (=> b!263528 d!63339))

(declare-fun d!63341 () Bool)

(assert (=> d!63341 (= (apply!262 lt!133117 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)) (get!3088 (getValueByKey!318 (toList!1927 lt!133117) (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000))))))

(declare-fun bs!9261 () Bool)

(assert (= bs!9261 d!63341))

(assert (=> bs!9261 m!278833))

(declare-fun m!279727 () Bool)

(assert (=> bs!9261 m!279727))

(assert (=> bs!9261 m!279727))

(declare-fun m!279729 () Bool)

(assert (=> bs!9261 m!279729))

(assert (=> b!263143 d!63341))

(declare-fun c!45052 () Bool)

(declare-fun d!63343 () Bool)

(assert (=> d!63343 (= c!45052 ((_ is ValueCellFull!2984) (select (arr!5991 (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!170862 () V!8521)

(assert (=> d!63343 (= (get!3087 (select (arr!5991 (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!170862)))

(declare-fun b!263722 () Bool)

(assert (=> b!263722 (= e!170862 (get!3089 (select (arr!5991 (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263723 () Bool)

(assert (=> b!263723 (= e!170862 (get!3090 (select (arr!5991 (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63343 c!45052) b!263722))

(assert (= (and d!63343 (not c!45052)) b!263723))

(assert (=> b!263722 m!278861))

(assert (=> b!263722 m!278569))

(declare-fun m!279731 () Bool)

(assert (=> b!263722 m!279731))

(assert (=> b!263723 m!278861))

(assert (=> b!263723 m!278569))

(declare-fun m!279733 () Bool)

(assert (=> b!263723 m!279733))

(assert (=> b!263143 d!63343))

(declare-fun b!263724 () Bool)

(declare-fun e!170868 () Bool)

(declare-fun e!170866 () Bool)

(assert (=> b!263724 (= e!170868 e!170866)))

(assert (=> b!263724 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7033 lt!132778))))))

(declare-fun res!128726 () Bool)

(declare-fun lt!133391 () ListLongMap!3823)

(assert (=> b!263724 (= res!128726 (contains!1889 lt!133391 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)))))

(assert (=> b!263724 (=> (not res!128726) (not e!170866))))

(declare-fun b!263725 () Bool)

(declare-fun e!170863 () Bool)

(assert (=> b!263725 (= e!170863 (= lt!133391 (getCurrentListMapNoExtraKeys!578 (_keys!7033 lt!132778) (_values!4825 lt!132778) (mask!11207 lt!132778) (extraKeys!4579 lt!132778) (zeroValue!4683 lt!132778) (minValue!4683 lt!132778) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 lt!132778))))))

(declare-fun b!263726 () Bool)

(assert (=> b!263726 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7033 lt!132778))))))

(assert (=> b!263726 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6343 (_values!4825 lt!132778))))))

(assert (=> b!263726 (= e!170866 (= (apply!262 lt!133391 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)) (get!3087 (select (arr!5991 (_values!4825 lt!132778)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 lt!132778) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!263727 () Bool)

(declare-fun e!170865 () ListLongMap!3823)

(assert (=> b!263727 (= e!170865 (ListLongMap!3824 Nil!3814))))

(declare-fun b!263728 () Bool)

(assert (=> b!263728 (= e!170863 (isEmpty!545 lt!133391))))

(declare-fun b!263729 () Bool)

(assert (=> b!263729 (= e!170868 e!170863)))

(declare-fun c!45055 () Bool)

(assert (=> b!263729 (= c!45055 (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7033 lt!132778))))))

(declare-fun b!263730 () Bool)

(declare-fun res!128725 () Bool)

(declare-fun e!170869 () Bool)

(assert (=> b!263730 (=> (not res!128725) (not e!170869))))

(assert (=> b!263730 (= res!128725 (not (contains!1889 lt!133391 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263731 () Bool)

(declare-fun lt!133395 () Unit!8136)

(declare-fun lt!133393 () Unit!8136)

(assert (=> b!263731 (= lt!133395 lt!133393)))

(declare-fun lt!133389 () V!8521)

(declare-fun lt!133390 () ListLongMap!3823)

(declare-fun lt!133392 () (_ BitVec 64))

(declare-fun lt!133394 () (_ BitVec 64))

(assert (=> b!263731 (not (contains!1889 (+!713 lt!133390 (tuple2!4921 lt!133394 lt!133389)) lt!133392))))

(assert (=> b!263731 (= lt!133393 (addStillNotContains!130 lt!133390 lt!133394 lt!133389 lt!133392))))

(assert (=> b!263731 (= lt!133392 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!263731 (= lt!133389 (get!3087 (select (arr!5991 (_values!4825 lt!132778)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 lt!132778) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!263731 (= lt!133394 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000))))

(declare-fun call!25239 () ListLongMap!3823)

(assert (=> b!263731 (= lt!133390 call!25239)))

(declare-fun e!170864 () ListLongMap!3823)

(assert (=> b!263731 (= e!170864 (+!713 call!25239 (tuple2!4921 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 (_values!4825 lt!132778)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 lt!132778) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!25236 () Bool)

(assert (=> bm!25236 (= call!25239 (getCurrentListMapNoExtraKeys!578 (_keys!7033 lt!132778) (_values!4825 lt!132778) (mask!11207 lt!132778) (extraKeys!4579 lt!132778) (zeroValue!4683 lt!132778) (minValue!4683 lt!132778) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 lt!132778)))))

(declare-fun b!263732 () Bool)

(assert (=> b!263732 (= e!170869 e!170868)))

(declare-fun c!45054 () Bool)

(declare-fun e!170867 () Bool)

(assert (=> b!263732 (= c!45054 e!170867)))

(declare-fun res!128727 () Bool)

(assert (=> b!263732 (=> (not res!128727) (not e!170867))))

(assert (=> b!263732 (= res!128727 (bvslt #b00000000000000000000000000000000 (size!6344 (_keys!7033 lt!132778))))))

(declare-fun b!263733 () Bool)

(assert (=> b!263733 (= e!170867 (validKeyInArray!0 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)))))

(assert (=> b!263733 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!263734 () Bool)

(assert (=> b!263734 (= e!170864 call!25239)))

(declare-fun d!63345 () Bool)

(assert (=> d!63345 e!170869))

(declare-fun res!128728 () Bool)

(assert (=> d!63345 (=> (not res!128728) (not e!170869))))

(assert (=> d!63345 (= res!128728 (not (contains!1889 lt!133391 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63345 (= lt!133391 e!170865)))

(declare-fun c!45053 () Bool)

(assert (=> d!63345 (= c!45053 (bvsge #b00000000000000000000000000000000 (size!6344 (_keys!7033 lt!132778))))))

(assert (=> d!63345 (validMask!0 (mask!11207 lt!132778))))

(assert (=> d!63345 (= (getCurrentListMapNoExtraKeys!578 (_keys!7033 lt!132778) (_values!4825 lt!132778) (mask!11207 lt!132778) (extraKeys!4579 lt!132778) (zeroValue!4683 lt!132778) (minValue!4683 lt!132778) #b00000000000000000000000000000000 (defaultEntry!4842 lt!132778)) lt!133391)))

(declare-fun b!263735 () Bool)

(assert (=> b!263735 (= e!170865 e!170864)))

(declare-fun c!45056 () Bool)

(assert (=> b!263735 (= c!45056 (validKeyInArray!0 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)))))

(assert (= (and d!63345 c!45053) b!263727))

(assert (= (and d!63345 (not c!45053)) b!263735))

(assert (= (and b!263735 c!45056) b!263731))

(assert (= (and b!263735 (not c!45056)) b!263734))

(assert (= (or b!263731 b!263734) bm!25236))

(assert (= (and d!63345 res!128728) b!263730))

(assert (= (and b!263730 res!128725) b!263732))

(assert (= (and b!263732 res!128727) b!263733))

(assert (= (and b!263732 c!45054) b!263724))

(assert (= (and b!263732 (not c!45054)) b!263729))

(assert (= (and b!263724 res!128726) b!263726))

(assert (= (and b!263729 c!45055) b!263725))

(assert (= (and b!263729 (not c!45055)) b!263728))

(declare-fun b_lambda!8343 () Bool)

(assert (=> (not b_lambda!8343) (not b!263726)))

(assert (=> b!263726 t!8894))

(declare-fun b_and!13931 () Bool)

(assert (= b_and!13929 (and (=> t!8894 result!5431) b_and!13931)))

(declare-fun b_lambda!8345 () Bool)

(assert (=> (not b_lambda!8345) (not b!263731)))

(assert (=> b!263731 t!8894))

(declare-fun b_and!13933 () Bool)

(assert (= b_and!13931 (and (=> t!8894 result!5431) b_and!13933)))

(assert (=> b!263735 m!278889))

(assert (=> b!263735 m!278889))

(assert (=> b!263735 m!278897))

(assert (=> b!263726 m!278889))

(declare-fun m!279735 () Bool)

(assert (=> b!263726 m!279735))

(assert (=> b!263726 m!279249))

(assert (=> b!263726 m!278889))

(assert (=> b!263726 m!279247))

(assert (=> b!263726 m!279249))

(assert (=> b!263726 m!279251))

(assert (=> b!263726 m!279247))

(declare-fun m!279737 () Bool)

(assert (=> b!263725 m!279737))

(assert (=> b!263733 m!278889))

(assert (=> b!263733 m!278889))

(assert (=> b!263733 m!278897))

(declare-fun m!279739 () Bool)

(assert (=> b!263730 m!279739))

(assert (=> bm!25236 m!279737))

(declare-fun m!279741 () Bool)

(assert (=> d!63345 m!279741))

(assert (=> d!63345 m!278887))

(declare-fun m!279743 () Bool)

(assert (=> b!263728 m!279743))

(declare-fun m!279745 () Bool)

(assert (=> b!263731 m!279745))

(declare-fun m!279747 () Bool)

(assert (=> b!263731 m!279747))

(assert (=> b!263731 m!279249))

(assert (=> b!263731 m!279745))

(declare-fun m!279749 () Bool)

(assert (=> b!263731 m!279749))

(assert (=> b!263731 m!278889))

(assert (=> b!263731 m!279247))

(assert (=> b!263731 m!279249))

(assert (=> b!263731 m!279251))

(declare-fun m!279751 () Bool)

(assert (=> b!263731 m!279751))

(assert (=> b!263731 m!279247))

(assert (=> b!263724 m!278889))

(assert (=> b!263724 m!278889))

(declare-fun m!279753 () Bool)

(assert (=> b!263724 m!279753))

(assert (=> b!263317 d!63345))

(declare-fun d!63347 () Bool)

(declare-fun e!170870 () Bool)

(assert (=> d!63347 e!170870))

(declare-fun res!128730 () Bool)

(assert (=> d!63347 (=> (not res!128730) (not e!170870))))

(declare-fun lt!133397 () ListLongMap!3823)

(assert (=> d!63347 (= res!128730 (contains!1889 lt!133397 (_1!2471 (tuple2!4921 lt!133249 (minValue!4683 lt!132778)))))))

(declare-fun lt!133396 () List!3817)

(assert (=> d!63347 (= lt!133397 (ListLongMap!3824 lt!133396))))

(declare-fun lt!133399 () Unit!8136)

(declare-fun lt!133398 () Unit!8136)

(assert (=> d!63347 (= lt!133399 lt!133398)))

(assert (=> d!63347 (= (getValueByKey!318 lt!133396 (_1!2471 (tuple2!4921 lt!133249 (minValue!4683 lt!132778)))) (Some!323 (_2!2471 (tuple2!4921 lt!133249 (minValue!4683 lt!132778)))))))

(assert (=> d!63347 (= lt!133398 (lemmaContainsTupThenGetReturnValue!177 lt!133396 (_1!2471 (tuple2!4921 lt!133249 (minValue!4683 lt!132778))) (_2!2471 (tuple2!4921 lt!133249 (minValue!4683 lt!132778)))))))

(assert (=> d!63347 (= lt!133396 (insertStrictlySorted!180 (toList!1927 lt!133243) (_1!2471 (tuple2!4921 lt!133249 (minValue!4683 lt!132778))) (_2!2471 (tuple2!4921 lt!133249 (minValue!4683 lt!132778)))))))

(assert (=> d!63347 (= (+!713 lt!133243 (tuple2!4921 lt!133249 (minValue!4683 lt!132778))) lt!133397)))

(declare-fun b!263736 () Bool)

(declare-fun res!128729 () Bool)

(assert (=> b!263736 (=> (not res!128729) (not e!170870))))

(assert (=> b!263736 (= res!128729 (= (getValueByKey!318 (toList!1927 lt!133397) (_1!2471 (tuple2!4921 lt!133249 (minValue!4683 lt!132778)))) (Some!323 (_2!2471 (tuple2!4921 lt!133249 (minValue!4683 lt!132778))))))))

(declare-fun b!263737 () Bool)

(assert (=> b!263737 (= e!170870 (contains!1893 (toList!1927 lt!133397) (tuple2!4921 lt!133249 (minValue!4683 lt!132778))))))

(assert (= (and d!63347 res!128730) b!263736))

(assert (= (and b!263736 res!128729) b!263737))

(declare-fun m!279755 () Bool)

(assert (=> d!63347 m!279755))

(declare-fun m!279757 () Bool)

(assert (=> d!63347 m!279757))

(declare-fun m!279759 () Bool)

(assert (=> d!63347 m!279759))

(declare-fun m!279761 () Bool)

(assert (=> d!63347 m!279761))

(declare-fun m!279763 () Bool)

(assert (=> b!263736 m!279763))

(declare-fun m!279765 () Bool)

(assert (=> b!263737 m!279765))

(assert (=> b!263317 d!63347))

(declare-fun d!63349 () Bool)

(assert (=> d!63349 (= (apply!262 (+!713 lt!133243 (tuple2!4921 lt!133249 (minValue!4683 lt!132778))) lt!133233) (apply!262 lt!133243 lt!133233))))

(declare-fun lt!133400 () Unit!8136)

(assert (=> d!63349 (= lt!133400 (choose!1301 lt!133243 lt!133249 (minValue!4683 lt!132778) lt!133233))))

(declare-fun e!170871 () Bool)

(assert (=> d!63349 e!170871))

(declare-fun res!128731 () Bool)

(assert (=> d!63349 (=> (not res!128731) (not e!170871))))

(assert (=> d!63349 (= res!128731 (contains!1889 lt!133243 lt!133233))))

(assert (=> d!63349 (= (addApplyDifferent!238 lt!133243 lt!133249 (minValue!4683 lt!132778) lt!133233) lt!133400)))

(declare-fun b!263738 () Bool)

(assert (=> b!263738 (= e!170871 (not (= lt!133233 lt!133249)))))

(assert (= (and d!63349 res!128731) b!263738))

(assert (=> d!63349 m!279229))

(assert (=> d!63349 m!279229))

(assert (=> d!63349 m!279231))

(declare-fun m!279767 () Bool)

(assert (=> d!63349 m!279767))

(assert (=> d!63349 m!279219))

(declare-fun m!279769 () Bool)

(assert (=> d!63349 m!279769))

(assert (=> b!263317 d!63349))

(declare-fun d!63351 () Bool)

(declare-fun e!170872 () Bool)

(assert (=> d!63351 e!170872))

(declare-fun res!128733 () Bool)

(assert (=> d!63351 (=> (not res!128733) (not e!170872))))

(declare-fun lt!133402 () ListLongMap!3823)

(assert (=> d!63351 (= res!128733 (contains!1889 lt!133402 (_1!2471 (tuple2!4921 lt!133238 (zeroValue!4683 lt!132778)))))))

(declare-fun lt!133401 () List!3817)

(assert (=> d!63351 (= lt!133402 (ListLongMap!3824 lt!133401))))

(declare-fun lt!133404 () Unit!8136)

(declare-fun lt!133403 () Unit!8136)

(assert (=> d!63351 (= lt!133404 lt!133403)))

(assert (=> d!63351 (= (getValueByKey!318 lt!133401 (_1!2471 (tuple2!4921 lt!133238 (zeroValue!4683 lt!132778)))) (Some!323 (_2!2471 (tuple2!4921 lt!133238 (zeroValue!4683 lt!132778)))))))

(assert (=> d!63351 (= lt!133403 (lemmaContainsTupThenGetReturnValue!177 lt!133401 (_1!2471 (tuple2!4921 lt!133238 (zeroValue!4683 lt!132778))) (_2!2471 (tuple2!4921 lt!133238 (zeroValue!4683 lt!132778)))))))

(assert (=> d!63351 (= lt!133401 (insertStrictlySorted!180 (toList!1927 lt!133241) (_1!2471 (tuple2!4921 lt!133238 (zeroValue!4683 lt!132778))) (_2!2471 (tuple2!4921 lt!133238 (zeroValue!4683 lt!132778)))))))

(assert (=> d!63351 (= (+!713 lt!133241 (tuple2!4921 lt!133238 (zeroValue!4683 lt!132778))) lt!133402)))

(declare-fun b!263739 () Bool)

(declare-fun res!128732 () Bool)

(assert (=> b!263739 (=> (not res!128732) (not e!170872))))

(assert (=> b!263739 (= res!128732 (= (getValueByKey!318 (toList!1927 lt!133402) (_1!2471 (tuple2!4921 lt!133238 (zeroValue!4683 lt!132778)))) (Some!323 (_2!2471 (tuple2!4921 lt!133238 (zeroValue!4683 lt!132778))))))))

(declare-fun b!263740 () Bool)

(assert (=> b!263740 (= e!170872 (contains!1893 (toList!1927 lt!133402) (tuple2!4921 lt!133238 (zeroValue!4683 lt!132778))))))

(assert (= (and d!63351 res!128733) b!263739))

(assert (= (and b!263739 res!128732) b!263740))

(declare-fun m!279771 () Bool)

(assert (=> d!63351 m!279771))

(declare-fun m!279773 () Bool)

(assert (=> d!63351 m!279773))

(declare-fun m!279775 () Bool)

(assert (=> d!63351 m!279775))

(declare-fun m!279777 () Bool)

(assert (=> d!63351 m!279777))

(declare-fun m!279779 () Bool)

(assert (=> b!263739 m!279779))

(declare-fun m!279781 () Bool)

(assert (=> b!263740 m!279781))

(assert (=> b!263317 d!63351))

(declare-fun d!63353 () Bool)

(declare-fun e!170873 () Bool)

(assert (=> d!63353 e!170873))

(declare-fun res!128734 () Bool)

(assert (=> d!63353 (=> res!128734 e!170873)))

(declare-fun lt!133408 () Bool)

(assert (=> d!63353 (= res!128734 (not lt!133408))))

(declare-fun lt!133406 () Bool)

(assert (=> d!63353 (= lt!133408 lt!133406)))

(declare-fun lt!133405 () Unit!8136)

(declare-fun e!170874 () Unit!8136)

(assert (=> d!63353 (= lt!133405 e!170874)))

(declare-fun c!45057 () Bool)

(assert (=> d!63353 (= c!45057 lt!133406)))

(assert (=> d!63353 (= lt!133406 (containsKey!310 (toList!1927 (+!713 lt!133241 (tuple2!4921 lt!133238 (zeroValue!4683 lt!132778)))) lt!133234))))

(assert (=> d!63353 (= (contains!1889 (+!713 lt!133241 (tuple2!4921 lt!133238 (zeroValue!4683 lt!132778))) lt!133234) lt!133408)))

(declare-fun b!263741 () Bool)

(declare-fun lt!133407 () Unit!8136)

(assert (=> b!263741 (= e!170874 lt!133407)))

(assert (=> b!263741 (= lt!133407 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 (+!713 lt!133241 (tuple2!4921 lt!133238 (zeroValue!4683 lt!132778)))) lt!133234))))

(assert (=> b!263741 (isDefined!260 (getValueByKey!318 (toList!1927 (+!713 lt!133241 (tuple2!4921 lt!133238 (zeroValue!4683 lt!132778)))) lt!133234))))

(declare-fun b!263742 () Bool)

(declare-fun Unit!8176 () Unit!8136)

(assert (=> b!263742 (= e!170874 Unit!8176)))

(declare-fun b!263743 () Bool)

(assert (=> b!263743 (= e!170873 (isDefined!260 (getValueByKey!318 (toList!1927 (+!713 lt!133241 (tuple2!4921 lt!133238 (zeroValue!4683 lt!132778)))) lt!133234)))))

(assert (= (and d!63353 c!45057) b!263741))

(assert (= (and d!63353 (not c!45057)) b!263742))

(assert (= (and d!63353 (not res!128734)) b!263743))

(declare-fun m!279783 () Bool)

(assert (=> d!63353 m!279783))

(declare-fun m!279785 () Bool)

(assert (=> b!263741 m!279785))

(declare-fun m!279787 () Bool)

(assert (=> b!263741 m!279787))

(assert (=> b!263741 m!279787))

(declare-fun m!279789 () Bool)

(assert (=> b!263741 m!279789))

(assert (=> b!263743 m!279787))

(assert (=> b!263743 m!279787))

(assert (=> b!263743 m!279789))

(assert (=> b!263317 d!63353))

(declare-fun d!63355 () Bool)

(assert (=> d!63355 (= (apply!262 (+!713 lt!133235 (tuple2!4921 lt!133244 (zeroValue!4683 lt!132778))) lt!133236) (apply!262 lt!133235 lt!133236))))

(declare-fun lt!133409 () Unit!8136)

(assert (=> d!63355 (= lt!133409 (choose!1301 lt!133235 lt!133244 (zeroValue!4683 lt!132778) lt!133236))))

(declare-fun e!170875 () Bool)

(assert (=> d!63355 e!170875))

(declare-fun res!128735 () Bool)

(assert (=> d!63355 (=> (not res!128735) (not e!170875))))

(assert (=> d!63355 (= res!128735 (contains!1889 lt!133235 lt!133236))))

(assert (=> d!63355 (= (addApplyDifferent!238 lt!133235 lt!133244 (zeroValue!4683 lt!132778) lt!133236) lt!133409)))

(declare-fun b!263744 () Bool)

(assert (=> b!263744 (= e!170875 (not (= lt!133236 lt!133244)))))

(assert (= (and d!63355 res!128735) b!263744))

(assert (=> d!63355 m!279223))

(assert (=> d!63355 m!279223))

(assert (=> d!63355 m!279225))

(declare-fun m!279791 () Bool)

(assert (=> d!63355 m!279791))

(assert (=> d!63355 m!279237))

(declare-fun m!279793 () Bool)

(assert (=> d!63355 m!279793))

(assert (=> b!263317 d!63355))

(declare-fun d!63357 () Bool)

(assert (=> d!63357 (= (apply!262 lt!133243 lt!133233) (get!3088 (getValueByKey!318 (toList!1927 lt!133243) lt!133233)))))

(declare-fun bs!9262 () Bool)

(assert (= bs!9262 d!63357))

(declare-fun m!279795 () Bool)

(assert (=> bs!9262 m!279795))

(assert (=> bs!9262 m!279795))

(declare-fun m!279797 () Bool)

(assert (=> bs!9262 m!279797))

(assert (=> b!263317 d!63357))

(declare-fun d!63359 () Bool)

(assert (=> d!63359 (= (apply!262 lt!133235 lt!133236) (get!3088 (getValueByKey!318 (toList!1927 lt!133235) lt!133236)))))

(declare-fun bs!9263 () Bool)

(assert (= bs!9263 d!63359))

(declare-fun m!279799 () Bool)

(assert (=> bs!9263 m!279799))

(assert (=> bs!9263 m!279799))

(declare-fun m!279801 () Bool)

(assert (=> bs!9263 m!279801))

(assert (=> b!263317 d!63359))

(declare-fun d!63361 () Bool)

(assert (=> d!63361 (= (apply!262 (+!713 lt!133237 (tuple2!4921 lt!133232 (minValue!4683 lt!132778))) lt!133239) (apply!262 lt!133237 lt!133239))))

(declare-fun lt!133410 () Unit!8136)

(assert (=> d!63361 (= lt!133410 (choose!1301 lt!133237 lt!133232 (minValue!4683 lt!132778) lt!133239))))

(declare-fun e!170876 () Bool)

(assert (=> d!63361 e!170876))

(declare-fun res!128736 () Bool)

(assert (=> d!63361 (=> (not res!128736) (not e!170876))))

(assert (=> d!63361 (= res!128736 (contains!1889 lt!133237 lt!133239))))

(assert (=> d!63361 (= (addApplyDifferent!238 lt!133237 lt!133232 (minValue!4683 lt!132778) lt!133239) lt!133410)))

(declare-fun b!263745 () Bool)

(assert (=> b!263745 (= e!170876 (not (= lt!133239 lt!133232)))))

(assert (= (and d!63361 res!128736) b!263745))

(assert (=> d!63361 m!279215))

(assert (=> d!63361 m!279215))

(assert (=> d!63361 m!279235))

(declare-fun m!279803 () Bool)

(assert (=> d!63361 m!279803))

(assert (=> d!63361 m!279239))

(declare-fun m!279805 () Bool)

(assert (=> d!63361 m!279805))

(assert (=> b!263317 d!63361))

(declare-fun d!63363 () Bool)

(assert (=> d!63363 (contains!1889 (+!713 lt!133241 (tuple2!4921 lt!133238 (zeroValue!4683 lt!132778))) lt!133234)))

(declare-fun lt!133411 () Unit!8136)

(assert (=> d!63363 (= lt!133411 (choose!1302 lt!133241 lt!133238 (zeroValue!4683 lt!132778) lt!133234))))

(assert (=> d!63363 (contains!1889 lt!133241 lt!133234)))

(assert (=> d!63363 (= (addStillContains!238 lt!133241 lt!133238 (zeroValue!4683 lt!132778) lt!133234) lt!133411)))

(declare-fun bs!9264 () Bool)

(assert (= bs!9264 d!63363))

(assert (=> bs!9264 m!279217))

(assert (=> bs!9264 m!279217))

(assert (=> bs!9264 m!279227))

(declare-fun m!279807 () Bool)

(assert (=> bs!9264 m!279807))

(declare-fun m!279809 () Bool)

(assert (=> bs!9264 m!279809))

(assert (=> b!263317 d!63363))

(declare-fun d!63365 () Bool)

(declare-fun e!170877 () Bool)

(assert (=> d!63365 e!170877))

(declare-fun res!128738 () Bool)

(assert (=> d!63365 (=> (not res!128738) (not e!170877))))

(declare-fun lt!133413 () ListLongMap!3823)

(assert (=> d!63365 (= res!128738 (contains!1889 lt!133413 (_1!2471 (tuple2!4921 lt!133232 (minValue!4683 lt!132778)))))))

(declare-fun lt!133412 () List!3817)

(assert (=> d!63365 (= lt!133413 (ListLongMap!3824 lt!133412))))

(declare-fun lt!133415 () Unit!8136)

(declare-fun lt!133414 () Unit!8136)

(assert (=> d!63365 (= lt!133415 lt!133414)))

(assert (=> d!63365 (= (getValueByKey!318 lt!133412 (_1!2471 (tuple2!4921 lt!133232 (minValue!4683 lt!132778)))) (Some!323 (_2!2471 (tuple2!4921 lt!133232 (minValue!4683 lt!132778)))))))

(assert (=> d!63365 (= lt!133414 (lemmaContainsTupThenGetReturnValue!177 lt!133412 (_1!2471 (tuple2!4921 lt!133232 (minValue!4683 lt!132778))) (_2!2471 (tuple2!4921 lt!133232 (minValue!4683 lt!132778)))))))

(assert (=> d!63365 (= lt!133412 (insertStrictlySorted!180 (toList!1927 lt!133237) (_1!2471 (tuple2!4921 lt!133232 (minValue!4683 lt!132778))) (_2!2471 (tuple2!4921 lt!133232 (minValue!4683 lt!132778)))))))

(assert (=> d!63365 (= (+!713 lt!133237 (tuple2!4921 lt!133232 (minValue!4683 lt!132778))) lt!133413)))

(declare-fun b!263746 () Bool)

(declare-fun res!128737 () Bool)

(assert (=> b!263746 (=> (not res!128737) (not e!170877))))

(assert (=> b!263746 (= res!128737 (= (getValueByKey!318 (toList!1927 lt!133413) (_1!2471 (tuple2!4921 lt!133232 (minValue!4683 lt!132778)))) (Some!323 (_2!2471 (tuple2!4921 lt!133232 (minValue!4683 lt!132778))))))))

(declare-fun b!263747 () Bool)

(assert (=> b!263747 (= e!170877 (contains!1893 (toList!1927 lt!133413) (tuple2!4921 lt!133232 (minValue!4683 lt!132778))))))

(assert (= (and d!63365 res!128738) b!263746))

(assert (= (and b!263746 res!128737) b!263747))

(declare-fun m!279811 () Bool)

(assert (=> d!63365 m!279811))

(declare-fun m!279813 () Bool)

(assert (=> d!63365 m!279813))

(declare-fun m!279815 () Bool)

(assert (=> d!63365 m!279815))

(declare-fun m!279817 () Bool)

(assert (=> d!63365 m!279817))

(declare-fun m!279819 () Bool)

(assert (=> b!263746 m!279819))

(declare-fun m!279821 () Bool)

(assert (=> b!263747 m!279821))

(assert (=> b!263317 d!63365))

(declare-fun d!63367 () Bool)

(assert (=> d!63367 (= (apply!262 (+!713 lt!133237 (tuple2!4921 lt!133232 (minValue!4683 lt!132778))) lt!133239) (get!3088 (getValueByKey!318 (toList!1927 (+!713 lt!133237 (tuple2!4921 lt!133232 (minValue!4683 lt!132778)))) lt!133239)))))

(declare-fun bs!9265 () Bool)

(assert (= bs!9265 d!63367))

(declare-fun m!279823 () Bool)

(assert (=> bs!9265 m!279823))

(assert (=> bs!9265 m!279823))

(declare-fun m!279825 () Bool)

(assert (=> bs!9265 m!279825))

(assert (=> b!263317 d!63367))

(declare-fun d!63369 () Bool)

(assert (=> d!63369 (= (apply!262 lt!133237 lt!133239) (get!3088 (getValueByKey!318 (toList!1927 lt!133237) lt!133239)))))

(declare-fun bs!9266 () Bool)

(assert (= bs!9266 d!63369))

(declare-fun m!279827 () Bool)

(assert (=> bs!9266 m!279827))

(assert (=> bs!9266 m!279827))

(declare-fun m!279829 () Bool)

(assert (=> bs!9266 m!279829))

(assert (=> b!263317 d!63369))

(declare-fun d!63371 () Bool)

(assert (=> d!63371 (= (apply!262 (+!713 lt!133235 (tuple2!4921 lt!133244 (zeroValue!4683 lt!132778))) lt!133236) (get!3088 (getValueByKey!318 (toList!1927 (+!713 lt!133235 (tuple2!4921 lt!133244 (zeroValue!4683 lt!132778)))) lt!133236)))))

(declare-fun bs!9267 () Bool)

(assert (= bs!9267 d!63371))

(declare-fun m!279831 () Bool)

(assert (=> bs!9267 m!279831))

(assert (=> bs!9267 m!279831))

(declare-fun m!279833 () Bool)

(assert (=> bs!9267 m!279833))

(assert (=> b!263317 d!63371))

(declare-fun d!63373 () Bool)

(assert (=> d!63373 (= (apply!262 (+!713 lt!133243 (tuple2!4921 lt!133249 (minValue!4683 lt!132778))) lt!133233) (get!3088 (getValueByKey!318 (toList!1927 (+!713 lt!133243 (tuple2!4921 lt!133249 (minValue!4683 lt!132778)))) lt!133233)))))

(declare-fun bs!9268 () Bool)

(assert (= bs!9268 d!63373))

(declare-fun m!279835 () Bool)

(assert (=> bs!9268 m!279835))

(assert (=> bs!9268 m!279835))

(declare-fun m!279837 () Bool)

(assert (=> bs!9268 m!279837))

(assert (=> b!263317 d!63373))

(declare-fun d!63375 () Bool)

(declare-fun e!170878 () Bool)

(assert (=> d!63375 e!170878))

(declare-fun res!128740 () Bool)

(assert (=> d!63375 (=> (not res!128740) (not e!170878))))

(declare-fun lt!133417 () ListLongMap!3823)

(assert (=> d!63375 (= res!128740 (contains!1889 lt!133417 (_1!2471 (tuple2!4921 lt!133244 (zeroValue!4683 lt!132778)))))))

(declare-fun lt!133416 () List!3817)

(assert (=> d!63375 (= lt!133417 (ListLongMap!3824 lt!133416))))

(declare-fun lt!133419 () Unit!8136)

(declare-fun lt!133418 () Unit!8136)

(assert (=> d!63375 (= lt!133419 lt!133418)))

(assert (=> d!63375 (= (getValueByKey!318 lt!133416 (_1!2471 (tuple2!4921 lt!133244 (zeroValue!4683 lt!132778)))) (Some!323 (_2!2471 (tuple2!4921 lt!133244 (zeroValue!4683 lt!132778)))))))

(assert (=> d!63375 (= lt!133418 (lemmaContainsTupThenGetReturnValue!177 lt!133416 (_1!2471 (tuple2!4921 lt!133244 (zeroValue!4683 lt!132778))) (_2!2471 (tuple2!4921 lt!133244 (zeroValue!4683 lt!132778)))))))

(assert (=> d!63375 (= lt!133416 (insertStrictlySorted!180 (toList!1927 lt!133235) (_1!2471 (tuple2!4921 lt!133244 (zeroValue!4683 lt!132778))) (_2!2471 (tuple2!4921 lt!133244 (zeroValue!4683 lt!132778)))))))

(assert (=> d!63375 (= (+!713 lt!133235 (tuple2!4921 lt!133244 (zeroValue!4683 lt!132778))) lt!133417)))

(declare-fun b!263748 () Bool)

(declare-fun res!128739 () Bool)

(assert (=> b!263748 (=> (not res!128739) (not e!170878))))

(assert (=> b!263748 (= res!128739 (= (getValueByKey!318 (toList!1927 lt!133417) (_1!2471 (tuple2!4921 lt!133244 (zeroValue!4683 lt!132778)))) (Some!323 (_2!2471 (tuple2!4921 lt!133244 (zeroValue!4683 lt!132778))))))))

(declare-fun b!263749 () Bool)

(assert (=> b!263749 (= e!170878 (contains!1893 (toList!1927 lt!133417) (tuple2!4921 lt!133244 (zeroValue!4683 lt!132778))))))

(assert (= (and d!63375 res!128740) b!263748))

(assert (= (and b!263748 res!128739) b!263749))

(declare-fun m!279839 () Bool)

(assert (=> d!63375 m!279839))

(declare-fun m!279841 () Bool)

(assert (=> d!63375 m!279841))

(declare-fun m!279843 () Bool)

(assert (=> d!63375 m!279843))

(declare-fun m!279845 () Bool)

(assert (=> d!63375 m!279845))

(declare-fun m!279847 () Bool)

(assert (=> b!263748 m!279847))

(declare-fun m!279849 () Bool)

(assert (=> b!263749 m!279849))

(assert (=> b!263317 d!63375))

(declare-fun d!63377 () Bool)

(declare-fun res!128741 () Bool)

(declare-fun e!170879 () Bool)

(assert (=> d!63377 (=> res!128741 e!170879)))

(assert (=> d!63377 (= res!128741 (and ((_ is Cons!3813) lt!133334) (= (_1!2471 (h!4479 lt!133334)) (_1!2471 lt!132765))))))

(assert (=> d!63377 (= (containsKey!310 lt!133334 (_1!2471 lt!132765)) e!170879)))

(declare-fun b!263750 () Bool)

(declare-fun e!170880 () Bool)

(assert (=> b!263750 (= e!170879 e!170880)))

(declare-fun res!128742 () Bool)

(assert (=> b!263750 (=> (not res!128742) (not e!170880))))

(assert (=> b!263750 (= res!128742 (and (or (not ((_ is Cons!3813) lt!133334)) (bvsle (_1!2471 (h!4479 lt!133334)) (_1!2471 lt!132765))) ((_ is Cons!3813) lt!133334) (bvslt (_1!2471 (h!4479 lt!133334)) (_1!2471 lt!132765))))))

(declare-fun b!263751 () Bool)

(assert (=> b!263751 (= e!170880 (containsKey!310 (t!8885 lt!133334) (_1!2471 lt!132765)))))

(assert (= (and d!63377 (not res!128741)) b!263750))

(assert (= (and b!263750 res!128742) b!263751))

(declare-fun m!279851 () Bool)

(assert (=> b!263751 m!279851))

(assert (=> b!263536 d!63377))

(declare-fun d!63379 () Bool)

(assert (=> d!63379 (= (get!3088 (getValueByKey!318 (toList!1927 lt!132973) lt!132975)) (v!5502 (getValueByKey!318 (toList!1927 lt!132973) lt!132975)))))

(assert (=> d!63097 d!63379))

(declare-fun b!263753 () Bool)

(declare-fun e!170881 () Option!324)

(declare-fun e!170882 () Option!324)

(assert (=> b!263753 (= e!170881 e!170882)))

(declare-fun c!45059 () Bool)

(assert (=> b!263753 (= c!45059 (and ((_ is Cons!3813) (toList!1927 lt!132973)) (not (= (_1!2471 (h!4479 (toList!1927 lt!132973))) lt!132975))))))

(declare-fun b!263755 () Bool)

(assert (=> b!263755 (= e!170882 None!322)))

(declare-fun d!63381 () Bool)

(declare-fun c!45058 () Bool)

(assert (=> d!63381 (= c!45058 (and ((_ is Cons!3813) (toList!1927 lt!132973)) (= (_1!2471 (h!4479 (toList!1927 lt!132973))) lt!132975)))))

(assert (=> d!63381 (= (getValueByKey!318 (toList!1927 lt!132973) lt!132975) e!170881)))

(declare-fun b!263752 () Bool)

(assert (=> b!263752 (= e!170881 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!132973)))))))

(declare-fun b!263754 () Bool)

(assert (=> b!263754 (= e!170882 (getValueByKey!318 (t!8885 (toList!1927 lt!132973)) lt!132975))))

(assert (= (and d!63381 c!45058) b!263752))

(assert (= (and d!63381 (not c!45058)) b!263753))

(assert (= (and b!263753 c!45059) b!263754))

(assert (= (and b!263753 (not c!45059)) b!263755))

(declare-fun m!279853 () Bool)

(assert (=> b!263754 m!279853))

(assert (=> d!63097 d!63381))

(declare-fun d!63383 () Bool)

(assert (=> d!63383 (= (get!3088 (getValueByKey!318 (toList!1927 lt!132981) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!5502 (getValueByKey!318 (toList!1927 lt!132981) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63121 d!63383))

(declare-fun b!263757 () Bool)

(declare-fun e!170883 () Option!324)

(declare-fun e!170884 () Option!324)

(assert (=> b!263757 (= e!170883 e!170884)))

(declare-fun c!45061 () Bool)

(assert (=> b!263757 (= c!45061 (and ((_ is Cons!3813) (toList!1927 lt!132981)) (not (= (_1!2471 (h!4479 (toList!1927 lt!132981))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!263759 () Bool)

(assert (=> b!263759 (= e!170884 None!322)))

(declare-fun d!63385 () Bool)

(declare-fun c!45060 () Bool)

(assert (=> d!63385 (= c!45060 (and ((_ is Cons!3813) (toList!1927 lt!132981)) (= (_1!2471 (h!4479 (toList!1927 lt!132981))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63385 (= (getValueByKey!318 (toList!1927 lt!132981) #b1000000000000000000000000000000000000000000000000000000000000000) e!170883)))

(declare-fun b!263756 () Bool)

(assert (=> b!263756 (= e!170883 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!132981)))))))

(declare-fun b!263758 () Bool)

(assert (=> b!263758 (= e!170884 (getValueByKey!318 (t!8885 (toList!1927 lt!132981)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63385 c!45060) b!263756))

(assert (= (and d!63385 (not c!45060)) b!263757))

(assert (= (and b!263757 c!45061) b!263758))

(assert (= (and b!263757 (not c!45061)) b!263759))

(declare-fun m!279855 () Bool)

(assert (=> b!263758 m!279855))

(assert (=> d!63121 d!63385))

(assert (=> b!263312 d!63327))

(declare-fun d!63387 () Bool)

(declare-fun lt!133420 () Bool)

(assert (=> d!63387 (= lt!133420 (select (content!177 (ite c!44834 (Cons!3814 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) Nil!3815) Nil!3815)) (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!170886 () Bool)

(assert (=> d!63387 (= lt!133420 e!170886)))

(declare-fun res!128744 () Bool)

(assert (=> d!63387 (=> (not res!128744) (not e!170886))))

(assert (=> d!63387 (= res!128744 ((_ is Cons!3814) (ite c!44834 (Cons!3814 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) Nil!3815) Nil!3815)))))

(assert (=> d!63387 (= (contains!1892 (ite c!44834 (Cons!3814 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) Nil!3815) Nil!3815) (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!133420)))

(declare-fun b!263760 () Bool)

(declare-fun e!170885 () Bool)

(assert (=> b!263760 (= e!170886 e!170885)))

(declare-fun res!128743 () Bool)

(assert (=> b!263760 (=> res!128743 e!170885)))

(assert (=> b!263760 (= res!128743 (= (h!4480 (ite c!44834 (Cons!3814 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) Nil!3815) Nil!3815)) (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263761 () Bool)

(assert (=> b!263761 (= e!170885 (contains!1892 (t!8886 (ite c!44834 (Cons!3814 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) Nil!3815) Nil!3815)) (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!63387 res!128744) b!263760))

(assert (= (and b!263760 (not res!128743)) b!263761))

(declare-fun m!279857 () Bool)

(assert (=> d!63387 m!279857))

(assert (=> d!63387 m!279299))

(declare-fun m!279859 () Bool)

(assert (=> d!63387 m!279859))

(assert (=> b!263761 m!279299))

(declare-fun m!279861 () Bool)

(assert (=> b!263761 m!279861))

(assert (=> b!263401 d!63387))

(declare-fun b!263763 () Bool)

(declare-fun e!170887 () Option!324)

(declare-fun e!170888 () Option!324)

(assert (=> b!263763 (= e!170887 e!170888)))

(declare-fun c!45063 () Bool)

(assert (=> b!263763 (= c!45063 (and ((_ is Cons!3813) (toList!1927 lt!133098)) (not (= (_1!2471 (h!4479 (toList!1927 lt!133098))) (_1!2471 (tuple2!4921 key!932 v!346))))))))

(declare-fun b!263765 () Bool)

(assert (=> b!263765 (= e!170888 None!322)))

(declare-fun c!45062 () Bool)

(declare-fun d!63389 () Bool)

(assert (=> d!63389 (= c!45062 (and ((_ is Cons!3813) (toList!1927 lt!133098)) (= (_1!2471 (h!4479 (toList!1927 lt!133098))) (_1!2471 (tuple2!4921 key!932 v!346)))))))

(assert (=> d!63389 (= (getValueByKey!318 (toList!1927 lt!133098) (_1!2471 (tuple2!4921 key!932 v!346))) e!170887)))

(declare-fun b!263762 () Bool)

(assert (=> b!263762 (= e!170887 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!133098)))))))

(declare-fun b!263764 () Bool)

(assert (=> b!263764 (= e!170888 (getValueByKey!318 (t!8885 (toList!1927 lt!133098)) (_1!2471 (tuple2!4921 key!932 v!346))))))

(assert (= (and d!63389 c!45062) b!263762))

(assert (= (and d!63389 (not c!45062)) b!263763))

(assert (= (and b!263763 c!45063) b!263764))

(assert (= (and b!263763 (not c!45063)) b!263765))

(declare-fun m!279863 () Bool)

(assert (=> b!263764 m!279863))

(assert (=> b!263126 d!63389))

(declare-fun d!63391 () Bool)

(assert (=> d!63391 (= (get!3088 (getValueByKey!318 (toList!1927 (+!713 lt!132995 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))) lt!132997)) (v!5502 (getValueByKey!318 (toList!1927 (+!713 lt!132995 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))) lt!132997)))))

(assert (=> d!63059 d!63391))

(declare-fun b!263767 () Bool)

(declare-fun e!170889 () Option!324)

(declare-fun e!170890 () Option!324)

(assert (=> b!263767 (= e!170889 e!170890)))

(declare-fun c!45065 () Bool)

(assert (=> b!263767 (= c!45065 (and ((_ is Cons!3813) (toList!1927 (+!713 lt!132995 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))))) (not (= (_1!2471 (h!4479 (toList!1927 (+!713 lt!132995 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))))) lt!132997))))))

(declare-fun b!263769 () Bool)

(assert (=> b!263769 (= e!170890 None!322)))

(declare-fun c!45064 () Bool)

(declare-fun d!63393 () Bool)

(assert (=> d!63393 (= c!45064 (and ((_ is Cons!3813) (toList!1927 (+!713 lt!132995 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))))) (= (_1!2471 (h!4479 (toList!1927 (+!713 lt!132995 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))))) lt!132997)))))

(assert (=> d!63393 (= (getValueByKey!318 (toList!1927 (+!713 lt!132995 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))) lt!132997) e!170889)))

(declare-fun b!263766 () Bool)

(assert (=> b!263766 (= e!170889 (Some!323 (_2!2471 (h!4479 (toList!1927 (+!713 lt!132995 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))))))))))

(declare-fun b!263768 () Bool)

(assert (=> b!263768 (= e!170890 (getValueByKey!318 (t!8885 (toList!1927 (+!713 lt!132995 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))))) lt!132997))))

(assert (= (and d!63393 c!45064) b!263766))

(assert (= (and d!63393 (not c!45064)) b!263767))

(assert (= (and b!263767 c!45065) b!263768))

(assert (= (and b!263767 (not c!45065)) b!263769))

(declare-fun m!279865 () Bool)

(assert (=> b!263768 m!279865))

(assert (=> d!63059 d!63393))

(declare-fun b!263771 () Bool)

(declare-fun e!170891 () Option!324)

(declare-fun e!170892 () Option!324)

(assert (=> b!263771 (= e!170891 e!170892)))

(declare-fun c!45067 () Bool)

(assert (=> b!263771 (= c!45067 (and ((_ is Cons!3813) (t!8885 (toList!1927 lt!133073))) (not (= (_1!2471 (h!4479 (t!8885 (toList!1927 lt!133073)))) (_1!2471 lt!132765)))))))

(declare-fun b!263773 () Bool)

(assert (=> b!263773 (= e!170892 None!322)))

(declare-fun d!63395 () Bool)

(declare-fun c!45066 () Bool)

(assert (=> d!63395 (= c!45066 (and ((_ is Cons!3813) (t!8885 (toList!1927 lt!133073))) (= (_1!2471 (h!4479 (t!8885 (toList!1927 lt!133073)))) (_1!2471 lt!132765))))))

(assert (=> d!63395 (= (getValueByKey!318 (t!8885 (toList!1927 lt!133073)) (_1!2471 lt!132765)) e!170891)))

(declare-fun b!263770 () Bool)

(assert (=> b!263770 (= e!170891 (Some!323 (_2!2471 (h!4479 (t!8885 (toList!1927 lt!133073))))))))

(declare-fun b!263772 () Bool)

(assert (=> b!263772 (= e!170892 (getValueByKey!318 (t!8885 (t!8885 (toList!1927 lt!133073))) (_1!2471 lt!132765)))))

(assert (= (and d!63395 c!45066) b!263770))

(assert (= (and d!63395 (not c!45066)) b!263771))

(assert (= (and b!263771 c!45067) b!263772))

(assert (= (and b!263771 (not c!45067)) b!263773))

(declare-fun m!279867 () Bool)

(assert (=> b!263772 m!279867))

(assert (=> b!263473 d!63395))

(declare-fun d!63397 () Bool)

(assert (=> d!63397 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133073) (_1!2471 lt!132765)))))

(declare-fun lt!133421 () Unit!8136)

(assert (=> d!63397 (= lt!133421 (choose!1300 (toList!1927 lt!133073) (_1!2471 lt!132765)))))

(declare-fun e!170893 () Bool)

(assert (=> d!63397 e!170893))

(declare-fun res!128745 () Bool)

(assert (=> d!63397 (=> (not res!128745) (not e!170893))))

(assert (=> d!63397 (= res!128745 (isStrictlySorted!372 (toList!1927 lt!133073)))))

(assert (=> d!63397 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133073) (_1!2471 lt!132765)) lt!133421)))

(declare-fun b!263774 () Bool)

(assert (=> b!263774 (= e!170893 (containsKey!310 (toList!1927 lt!133073) (_1!2471 lt!132765)))))

(assert (= (and d!63397 res!128745) b!263774))

(assert (=> d!63397 m!278761))

(assert (=> d!63397 m!278761))

(assert (=> d!63397 m!279453))

(declare-fun m!279869 () Bool)

(assert (=> d!63397 m!279869))

(declare-fun m!279871 () Bool)

(assert (=> d!63397 m!279871))

(assert (=> b!263774 m!279449))

(assert (=> b!263523 d!63397))

(declare-fun d!63399 () Bool)

(assert (=> d!63399 (= (isDefined!260 (getValueByKey!318 (toList!1927 lt!133073) (_1!2471 lt!132765))) (not (isEmpty!544 (getValueByKey!318 (toList!1927 lt!133073) (_1!2471 lt!132765)))))))

(declare-fun bs!9269 () Bool)

(assert (= bs!9269 d!63399))

(assert (=> bs!9269 m!278761))

(declare-fun m!279873 () Bool)

(assert (=> bs!9269 m!279873))

(assert (=> b!263523 d!63399))

(assert (=> b!263523 d!63197))

(declare-fun d!63401 () Bool)

(assert (=> d!63401 (isDefined!260 (getValueByKey!318 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) lt!132970))))

(declare-fun lt!133422 () Unit!8136)

(assert (=> d!63401 (= lt!133422 (choose!1300 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) lt!132970))))

(declare-fun e!170894 () Bool)

(assert (=> d!63401 e!170894))

(declare-fun res!128746 () Bool)

(assert (=> d!63401 (=> (not res!128746) (not e!170894))))

(assert (=> d!63401 (= res!128746 (isStrictlySorted!372 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63401 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) lt!132970) lt!133422)))

(declare-fun b!263775 () Bool)

(assert (=> b!263775 (= e!170894 (containsKey!310 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) lt!132970))))

(assert (= (and d!63401 res!128746) b!263775))

(assert (=> d!63401 m!279129))

(assert (=> d!63401 m!279129))

(assert (=> d!63401 m!279131))

(declare-fun m!279875 () Bool)

(assert (=> d!63401 m!279875))

(declare-fun m!279877 () Bool)

(assert (=> d!63401 m!279877))

(assert (=> b!263775 m!279125))

(assert (=> b!263283 d!63401))

(declare-fun d!63403 () Bool)

(assert (=> d!63403 (= (isDefined!260 (getValueByKey!318 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) lt!132970)) (not (isEmpty!544 (getValueByKey!318 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) lt!132970))))))

(declare-fun bs!9270 () Bool)

(assert (= bs!9270 d!63403))

(assert (=> bs!9270 m!279129))

(declare-fun m!279879 () Bool)

(assert (=> bs!9270 m!279879))

(assert (=> b!263283 d!63403))

(declare-fun b!263777 () Bool)

(declare-fun e!170895 () Option!324)

(declare-fun e!170896 () Option!324)

(assert (=> b!263777 (= e!170895 e!170896)))

(declare-fun c!45069 () Bool)

(assert (=> b!263777 (= c!45069 (and ((_ is Cons!3813) (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))) (not (= (_1!2471 (h!4479 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))) lt!132970))))))

(declare-fun b!263779 () Bool)

(assert (=> b!263779 (= e!170896 None!322)))

(declare-fun c!45068 () Bool)

(declare-fun d!63405 () Bool)

(assert (=> d!63405 (= c!45068 (and ((_ is Cons!3813) (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))) (= (_1!2471 (h!4479 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))) lt!132970)))))

(assert (=> d!63405 (= (getValueByKey!318 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) lt!132970) e!170895)))

(declare-fun b!263776 () Bool)

(assert (=> b!263776 (= e!170895 (Some!323 (_2!2471 (h!4479 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))))))))

(declare-fun b!263778 () Bool)

(assert (=> b!263778 (= e!170896 (getValueByKey!318 (t!8885 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))) lt!132970))))

(assert (= (and d!63405 c!45068) b!263776))

(assert (= (and d!63405 (not c!45068)) b!263777))

(assert (= (and b!263777 c!45069) b!263778))

(assert (= (and b!263777 (not c!45069)) b!263779))

(declare-fun m!279881 () Bool)

(assert (=> b!263778 m!279881))

(assert (=> b!263283 d!63405))

(declare-fun d!63407 () Bool)

(assert (=> d!63407 (arrayContainsKey!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) lt!133339 #b00000000000000000000000000000000)))

(declare-fun lt!133423 () Unit!8136)

(assert (=> d!63407 (= lt!133423 (choose!13 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) lt!133339 #b00000000000000000000000000000000))))

(assert (=> d!63407 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!63407 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) lt!133339 #b00000000000000000000000000000000) lt!133423)))

(declare-fun bs!9271 () Bool)

(assert (= bs!9271 d!63407))

(assert (=> bs!9271 m!279507))

(declare-fun m!279883 () Bool)

(assert (=> bs!9271 m!279883))

(assert (=> b!263562 d!63407))

(declare-fun d!63409 () Bool)

(declare-fun res!128747 () Bool)

(declare-fun e!170897 () Bool)

(assert (=> d!63409 (=> res!128747 e!170897)))

(assert (=> d!63409 (= res!128747 (= (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000) lt!133339))))

(assert (=> d!63409 (= (arrayContainsKey!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) lt!133339 #b00000000000000000000000000000000) e!170897)))

(declare-fun b!263780 () Bool)

(declare-fun e!170898 () Bool)

(assert (=> b!263780 (= e!170897 e!170898)))

(declare-fun res!128748 () Bool)

(assert (=> b!263780 (=> (not res!128748) (not e!170898))))

(assert (=> b!263780 (= res!128748 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))))

(declare-fun b!263781 () Bool)

(assert (=> b!263781 (= e!170898 (arrayContainsKey!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) lt!133339 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63409 (not res!128747)) b!263780))

(assert (= (and b!263780 res!128748) b!263781))

(assert (=> d!63409 m!278833))

(declare-fun m!279885 () Bool)

(assert (=> b!263781 m!279885))

(assert (=> b!263562 d!63409))

(declare-fun b!263782 () Bool)

(declare-fun e!170900 () SeekEntryResult!1193)

(declare-fun lt!133426 () SeekEntryResult!1193)

(assert (=> b!263782 (= e!170900 (MissingZero!1193 (index!6944 lt!133426)))))

(declare-fun lt!133424 () SeekEntryResult!1193)

(declare-fun d!63411 () Bool)

(assert (=> d!63411 (and (or ((_ is Undefined!1193) lt!133424) (not ((_ is Found!1193) lt!133424)) (and (bvsge (index!6943 lt!133424) #b00000000000000000000000000000000) (bvslt (index!6943 lt!133424) (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))) (or ((_ is Undefined!1193) lt!133424) ((_ is Found!1193) lt!133424) (not ((_ is MissingZero!1193) lt!133424)) (and (bvsge (index!6942 lt!133424) #b00000000000000000000000000000000) (bvslt (index!6942 lt!133424) (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))) (or ((_ is Undefined!1193) lt!133424) ((_ is Found!1193) lt!133424) ((_ is MissingZero!1193) lt!133424) (not ((_ is MissingVacant!1193) lt!133424)) (and (bvsge (index!6945 lt!133424) #b00000000000000000000000000000000) (bvslt (index!6945 lt!133424) (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))) (or ((_ is Undefined!1193) lt!133424) (ite ((_ is Found!1193) lt!133424) (= (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) (index!6943 lt!133424)) (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1193) lt!133424) (= (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) (index!6942 lt!133424)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1193) lt!133424) (= (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) (index!6945 lt!133424)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!170899 () SeekEntryResult!1193)

(assert (=> d!63411 (= lt!133424 e!170899)))

(declare-fun c!45071 () Bool)

(assert (=> d!63411 (= c!45071 (and ((_ is Intermediate!1193) lt!133426) (undefined!2005 lt!133426)))))

(assert (=> d!63411 (= lt!133426 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000) (mask!11207 thiss!1504)) (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000) (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (mask!11207 thiss!1504)))))

(assert (=> d!63411 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!63411 (= (seekEntryOrOpen!0 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000) (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (mask!11207 thiss!1504)) lt!133424)))

(declare-fun b!263783 () Bool)

(declare-fun e!170901 () SeekEntryResult!1193)

(assert (=> b!263783 (= e!170899 e!170901)))

(declare-fun lt!133425 () (_ BitVec 64))

(assert (=> b!263783 (= lt!133425 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) (index!6944 lt!133426)))))

(declare-fun c!45072 () Bool)

(assert (=> b!263783 (= c!45072 (= lt!133425 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!263784 () Bool)

(assert (=> b!263784 (= e!170901 (Found!1193 (index!6944 lt!133426)))))

(declare-fun b!263785 () Bool)

(assert (=> b!263785 (= e!170900 (seekKeyOrZeroReturnVacant!0 (x!25234 lt!133426) (index!6944 lt!133426) (index!6944 lt!133426) (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000) (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (mask!11207 thiss!1504)))))

(declare-fun b!263786 () Bool)

(assert (=> b!263786 (= e!170899 Undefined!1193)))

(declare-fun b!263787 () Bool)

(declare-fun c!45070 () Bool)

(assert (=> b!263787 (= c!45070 (= lt!133425 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263787 (= e!170901 e!170900)))

(assert (= (and d!63411 c!45071) b!263786))

(assert (= (and d!63411 (not c!45071)) b!263783))

(assert (= (and b!263783 c!45072) b!263784))

(assert (= (and b!263783 (not c!45072)) b!263787))

(assert (= (and b!263787 c!45070) b!263782))

(assert (= (and b!263787 (not c!45070)) b!263785))

(declare-fun m!279887 () Bool)

(assert (=> d!63411 m!279887))

(assert (=> d!63411 m!278833))

(declare-fun m!279889 () Bool)

(assert (=> d!63411 m!279889))

(declare-fun m!279891 () Bool)

(assert (=> d!63411 m!279891))

(assert (=> d!63411 m!278579))

(declare-fun m!279893 () Bool)

(assert (=> d!63411 m!279893))

(declare-fun m!279895 () Bool)

(assert (=> d!63411 m!279895))

(assert (=> d!63411 m!278833))

(assert (=> d!63411 m!279887))

(declare-fun m!279897 () Bool)

(assert (=> b!263783 m!279897))

(assert (=> b!263785 m!278833))

(declare-fun m!279899 () Bool)

(assert (=> b!263785 m!279899))

(assert (=> b!263562 d!63411))

(assert (=> b!263323 d!63327))

(declare-fun d!63413 () Bool)

(assert (=> d!63413 (= (isDefined!260 (getValueByKey!318 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) lt!132992)) (not (isEmpty!544 (getValueByKey!318 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) lt!132992))))))

(declare-fun bs!9272 () Bool)

(assert (= bs!9272 d!63413))

(assert (=> bs!9272 m!279029))

(declare-fun m!279901 () Bool)

(assert (=> bs!9272 m!279901))

(assert (=> b!263230 d!63413))

(declare-fun b!263789 () Bool)

(declare-fun e!170902 () Option!324)

(declare-fun e!170903 () Option!324)

(assert (=> b!263789 (= e!170902 e!170903)))

(declare-fun c!45074 () Bool)

(assert (=> b!263789 (= c!45074 (and ((_ is Cons!3813) (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))) (not (= (_1!2471 (h!4479 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))) lt!132992))))))

(declare-fun b!263791 () Bool)

(assert (=> b!263791 (= e!170903 None!322)))

(declare-fun d!63415 () Bool)

(declare-fun c!45073 () Bool)

(assert (=> d!63415 (= c!45073 (and ((_ is Cons!3813) (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))) (= (_1!2471 (h!4479 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))) lt!132992)))))

(assert (=> d!63415 (= (getValueByKey!318 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) lt!132992) e!170902)))

(declare-fun b!263788 () Bool)

(assert (=> b!263788 (= e!170902 (Some!323 (_2!2471 (h!4479 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))))))))

(declare-fun b!263790 () Bool)

(assert (=> b!263790 (= e!170903 (getValueByKey!318 (t!8885 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))) lt!132992))))

(assert (= (and d!63415 c!45073) b!263788))

(assert (= (and d!63415 (not c!45073)) b!263789))

(assert (= (and b!263789 c!45074) b!263790))

(assert (= (and b!263789 (not c!45074)) b!263791))

(declare-fun m!279903 () Bool)

(assert (=> b!263790 m!279903))

(assert (=> b!263230 d!63415))

(declare-fun d!63417 () Bool)

(declare-fun lt!133427 () Bool)

(assert (=> d!63417 (= lt!133427 (select (content!176 (t!8885 (toList!1927 lt!133073))) lt!132765))))

(declare-fun e!170905 () Bool)

(assert (=> d!63417 (= lt!133427 e!170905)))

(declare-fun res!128750 () Bool)

(assert (=> d!63417 (=> (not res!128750) (not e!170905))))

(assert (=> d!63417 (= res!128750 ((_ is Cons!3813) (t!8885 (toList!1927 lt!133073))))))

(assert (=> d!63417 (= (contains!1893 (t!8885 (toList!1927 lt!133073)) lt!132765) lt!133427)))

(declare-fun b!263792 () Bool)

(declare-fun e!170904 () Bool)

(assert (=> b!263792 (= e!170905 e!170904)))

(declare-fun res!128749 () Bool)

(assert (=> b!263792 (=> res!128749 e!170904)))

(assert (=> b!263792 (= res!128749 (= (h!4479 (t!8885 (toList!1927 lt!133073))) lt!132765))))

(declare-fun b!263793 () Bool)

(assert (=> b!263793 (= e!170904 (contains!1893 (t!8885 (t!8885 (toList!1927 lt!133073))) lt!132765))))

(assert (= (and d!63417 res!128750) b!263792))

(assert (= (and b!263792 (not res!128749)) b!263793))

(declare-fun m!279905 () Bool)

(assert (=> d!63417 m!279905))

(declare-fun m!279907 () Bool)

(assert (=> d!63417 m!279907))

(declare-fun m!279909 () Bool)

(assert (=> b!263793 m!279909))

(assert (=> b!263217 d!63417))

(declare-fun d!63419 () Bool)

(declare-fun e!170906 () Bool)

(assert (=> d!63419 e!170906))

(declare-fun res!128752 () Bool)

(assert (=> d!63419 (=> (not res!128752) (not e!170906))))

(declare-fun lt!133429 () ListLongMap!3823)

(assert (=> d!63419 (= res!128752 (contains!1889 lt!133429 (_1!2471 (ite (or c!44878 c!44875) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun lt!133428 () List!3817)

(assert (=> d!63419 (= lt!133429 (ListLongMap!3824 lt!133428))))

(declare-fun lt!133431 () Unit!8136)

(declare-fun lt!133430 () Unit!8136)

(assert (=> d!63419 (= lt!133431 lt!133430)))

(assert (=> d!63419 (= (getValueByKey!318 lt!133428 (_1!2471 (ite (or c!44878 c!44875) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) (Some!323 (_2!2471 (ite (or c!44878 c!44875) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63419 (= lt!133430 (lemmaContainsTupThenGetReturnValue!177 lt!133428 (_1!2471 (ite (or c!44878 c!44875) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44878 c!44875) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63419 (= lt!133428 (insertStrictlySorted!180 (toList!1927 (ite c!44878 call!25181 (ite c!44875 call!25183 call!25180))) (_1!2471 (ite (or c!44878 c!44875) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44878 c!44875) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63419 (= (+!713 (ite c!44878 call!25181 (ite c!44875 call!25183 call!25180)) (ite (or c!44878 c!44875) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133429)))

(declare-fun b!263794 () Bool)

(declare-fun res!128751 () Bool)

(assert (=> b!263794 (=> (not res!128751) (not e!170906))))

(assert (=> b!263794 (= res!128751 (= (getValueByKey!318 (toList!1927 lt!133429) (_1!2471 (ite (or c!44878 c!44875) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) (Some!323 (_2!2471 (ite (or c!44878 c!44875) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun b!263795 () Bool)

(assert (=> b!263795 (= e!170906 (contains!1893 (toList!1927 lt!133429) (ite (or c!44878 c!44875) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63419 res!128752) b!263794))

(assert (= (and b!263794 res!128751) b!263795))

(declare-fun m!279911 () Bool)

(assert (=> d!63419 m!279911))

(declare-fun m!279913 () Bool)

(assert (=> d!63419 m!279913))

(declare-fun m!279915 () Bool)

(assert (=> d!63419 m!279915))

(declare-fun m!279917 () Bool)

(assert (=> d!63419 m!279917))

(declare-fun m!279919 () Bool)

(assert (=> b!263794 m!279919))

(declare-fun m!279921 () Bool)

(assert (=> b!263795 m!279921))

(assert (=> bm!25175 d!63419))

(declare-fun d!63421 () Bool)

(declare-fun e!170907 () Bool)

(assert (=> d!63421 e!170907))

(declare-fun res!128753 () Bool)

(assert (=> d!63421 (=> res!128753 e!170907)))

(declare-fun lt!133435 () Bool)

(assert (=> d!63421 (= res!128753 (not lt!133435))))

(declare-fun lt!133433 () Bool)

(assert (=> d!63421 (= lt!133435 lt!133433)))

(declare-fun lt!133432 () Unit!8136)

(declare-fun e!170908 () Unit!8136)

(assert (=> d!63421 (= lt!133432 e!170908)))

(declare-fun c!45075 () Bool)

(assert (=> d!63421 (= c!45075 lt!133433)))

(assert (=> d!63421 (= lt!133433 (containsKey!310 (toList!1927 lt!133117) (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!63421 (= (contains!1889 lt!133117 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)) lt!133435)))

(declare-fun b!263796 () Bool)

(declare-fun lt!133434 () Unit!8136)

(assert (=> b!263796 (= e!170908 lt!133434)))

(assert (=> b!263796 (= lt!133434 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133117) (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!263796 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133117) (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!263797 () Bool)

(declare-fun Unit!8177 () Unit!8136)

(assert (=> b!263797 (= e!170908 Unit!8177)))

(declare-fun b!263798 () Bool)

(assert (=> b!263798 (= e!170907 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133117) (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000))))))

(assert (= (and d!63421 c!45075) b!263796))

(assert (= (and d!63421 (not c!45075)) b!263797))

(assert (= (and d!63421 (not res!128753)) b!263798))

(assert (=> d!63421 m!278833))

(declare-fun m!279923 () Bool)

(assert (=> d!63421 m!279923))

(assert (=> b!263796 m!278833))

(declare-fun m!279925 () Bool)

(assert (=> b!263796 m!279925))

(assert (=> b!263796 m!278833))

(assert (=> b!263796 m!279727))

(assert (=> b!263796 m!279727))

(declare-fun m!279927 () Bool)

(assert (=> b!263796 m!279927))

(assert (=> b!263798 m!278833))

(assert (=> b!263798 m!279727))

(assert (=> b!263798 m!279727))

(assert (=> b!263798 m!279927))

(assert (=> b!263130 d!63421))

(declare-fun d!63423 () Bool)

(assert (=> d!63423 (= (apply!262 lt!133188 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)) (get!3088 (getValueByKey!318 (toList!1927 lt!133188) (select (arr!5992 lt!132768) #b00000000000000000000000000000000))))))

(declare-fun bs!9273 () Bool)

(assert (= bs!9273 d!63423))

(assert (=> bs!9273 m!278587))

(declare-fun m!279929 () Bool)

(assert (=> bs!9273 m!279929))

(assert (=> bs!9273 m!279929))

(declare-fun m!279931 () Bool)

(assert (=> bs!9273 m!279931))

(assert (=> b!263259 d!63423))

(assert (=> b!263259 d!63227))

(declare-fun d!63425 () Bool)

(declare-fun lt!133436 () Bool)

(assert (=> d!63425 (= lt!133436 (select (content!176 lt!133324) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))))))

(declare-fun e!170910 () Bool)

(assert (=> d!63425 (= lt!133436 e!170910)))

(declare-fun res!128755 () Bool)

(assert (=> d!63425 (=> (not res!128755) (not e!170910))))

(assert (=> d!63425 (= res!128755 ((_ is Cons!3813) lt!133324))))

(assert (=> d!63425 (= (contains!1893 lt!133324 (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))) lt!133436)))

(declare-fun b!263799 () Bool)

(declare-fun e!170909 () Bool)

(assert (=> b!263799 (= e!170910 e!170909)))

(declare-fun res!128754 () Bool)

(assert (=> b!263799 (=> res!128754 e!170909)))

(assert (=> b!263799 (= res!128754 (= (h!4479 lt!133324) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))))))

(declare-fun b!263800 () Bool)

(assert (=> b!263800 (= e!170909 (contains!1893 (t!8885 lt!133324) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))))))

(assert (= (and d!63425 res!128755) b!263799))

(assert (= (and b!263799 (not res!128754)) b!263800))

(declare-fun m!279933 () Bool)

(assert (=> d!63425 m!279933))

(declare-fun m!279935 () Bool)

(assert (=> d!63425 m!279935))

(declare-fun m!279937 () Bool)

(assert (=> b!263800 m!279937))

(assert (=> b!263513 d!63425))

(declare-fun d!63427 () Bool)

(declare-fun res!128756 () Bool)

(declare-fun e!170911 () Bool)

(assert (=> d!63427 (=> res!128756 e!170911)))

(assert (=> d!63427 (= res!128756 (and ((_ is Cons!3813) (toList!1927 lt!133073)) (= (_1!2471 (h!4479 (toList!1927 lt!133073))) (_1!2471 lt!132765))))))

(assert (=> d!63427 (= (containsKey!310 (toList!1927 lt!133073) (_1!2471 lt!132765)) e!170911)))

(declare-fun b!263801 () Bool)

(declare-fun e!170912 () Bool)

(assert (=> b!263801 (= e!170911 e!170912)))

(declare-fun res!128757 () Bool)

(assert (=> b!263801 (=> (not res!128757) (not e!170912))))

(assert (=> b!263801 (= res!128757 (and (or (not ((_ is Cons!3813) (toList!1927 lt!133073))) (bvsle (_1!2471 (h!4479 (toList!1927 lt!133073))) (_1!2471 lt!132765))) ((_ is Cons!3813) (toList!1927 lt!133073)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!133073))) (_1!2471 lt!132765))))))

(declare-fun b!263802 () Bool)

(assert (=> b!263802 (= e!170912 (containsKey!310 (t!8885 (toList!1927 lt!133073)) (_1!2471 lt!132765)))))

(assert (= (and d!63427 (not res!128756)) b!263801))

(assert (= (and b!263801 res!128757) b!263802))

(declare-fun m!279939 () Bool)

(assert (=> b!263802 m!279939))

(assert (=> d!63213 d!63427))

(declare-fun d!63429 () Bool)

(declare-fun res!128758 () Bool)

(declare-fun e!170913 () Bool)

(assert (=> d!63429 (=> res!128758 e!170913)))

(assert (=> d!63429 (= res!128758 (and ((_ is Cons!3813) (t!8885 (toList!1927 lt!132763))) (= (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132763)))) key!932)))))

(assert (=> d!63429 (= (containsKey!310 (t!8885 (toList!1927 lt!132763)) key!932) e!170913)))

(declare-fun b!263803 () Bool)

(declare-fun e!170914 () Bool)

(assert (=> b!263803 (= e!170913 e!170914)))

(declare-fun res!128759 () Bool)

(assert (=> b!263803 (=> (not res!128759) (not e!170914))))

(assert (=> b!263803 (= res!128759 (and (or (not ((_ is Cons!3813) (t!8885 (toList!1927 lt!132763)))) (bvsle (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132763)))) key!932)) ((_ is Cons!3813) (t!8885 (toList!1927 lt!132763))) (bvslt (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132763)))) key!932)))))

(declare-fun b!263804 () Bool)

(assert (=> b!263804 (= e!170914 (containsKey!310 (t!8885 (t!8885 (toList!1927 lt!132763))) key!932))))

(assert (= (and d!63429 (not res!128758)) b!263803))

(assert (= (and b!263803 res!128759) b!263804))

(declare-fun m!279941 () Bool)

(assert (=> b!263804 m!279941))

(assert (=> b!263154 d!63429))

(declare-fun d!63431 () Bool)

(assert (=> d!63431 (= (validKeyInArray!0 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263380 d!63431))

(declare-fun d!63433 () Bool)

(assert (=> d!63433 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132981) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!133437 () Unit!8136)

(assert (=> d!63433 (= lt!133437 (choose!1300 (toList!1927 lt!132981) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!170915 () Bool)

(assert (=> d!63433 e!170915))

(declare-fun res!128760 () Bool)

(assert (=> d!63433 (=> (not res!128760) (not e!170915))))

(assert (=> d!63433 (= res!128760 (isStrictlySorted!372 (toList!1927 lt!132981)))))

(assert (=> d!63433 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!132981) #b0000000000000000000000000000000000000000000000000000000000000000) lt!133437)))

(declare-fun b!263805 () Bool)

(assert (=> b!263805 (= e!170915 (containsKey!310 (toList!1927 lt!132981) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63433 res!128760) b!263805))

(assert (=> d!63433 m!279349))

(assert (=> d!63433 m!279349))

(assert (=> d!63433 m!279365))

(declare-fun m!279943 () Bool)

(assert (=> d!63433 m!279943))

(declare-fun m!279945 () Bool)

(assert (=> d!63433 m!279945))

(assert (=> b!263805 m!279361))

(assert (=> b!263422 d!63433))

(assert (=> b!263422 d!63277))

(assert (=> b!263422 d!63279))

(declare-fun d!63435 () Bool)

(assert (=> d!63435 (= (validKeyInArray!0 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263148 d!63435))

(declare-fun d!63437 () Bool)

(assert (=> d!63437 (= (apply!262 (+!713 lt!132993 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))) lt!132994) (apply!262 lt!132993 lt!132994))))

(assert (=> d!63437 true))

(declare-fun _$34!1134 () Unit!8136)

(assert (=> d!63437 (= (choose!1301 lt!132993 lt!133002 (zeroValue!4683 thiss!1504) lt!132994) _$34!1134)))

(declare-fun bs!9274 () Bool)

(assert (= bs!9274 d!63437))

(assert (=> bs!9274 m!278609))

(assert (=> bs!9274 m!278609))

(assert (=> bs!9274 m!278611))

(assert (=> bs!9274 m!278623))

(assert (=> d!63055 d!63437))

(assert (=> d!63055 d!63069))

(assert (=> d!63055 d!63075))

(declare-fun d!63439 () Bool)

(declare-fun e!170916 () Bool)

(assert (=> d!63439 e!170916))

(declare-fun res!128761 () Bool)

(assert (=> d!63439 (=> res!128761 e!170916)))

(declare-fun lt!133441 () Bool)

(assert (=> d!63439 (= res!128761 (not lt!133441))))

(declare-fun lt!133439 () Bool)

(assert (=> d!63439 (= lt!133441 lt!133439)))

(declare-fun lt!133438 () Unit!8136)

(declare-fun e!170917 () Unit!8136)

(assert (=> d!63439 (= lt!133438 e!170917)))

(declare-fun c!45076 () Bool)

(assert (=> d!63439 (= c!45076 lt!133439)))

(assert (=> d!63439 (= lt!133439 (containsKey!310 (toList!1927 lt!132993) lt!132994))))

(assert (=> d!63439 (= (contains!1889 lt!132993 lt!132994) lt!133441)))

(declare-fun b!263807 () Bool)

(declare-fun lt!133440 () Unit!8136)

(assert (=> b!263807 (= e!170917 lt!133440)))

(assert (=> b!263807 (= lt!133440 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!132993) lt!132994))))

(assert (=> b!263807 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132993) lt!132994))))

(declare-fun b!263808 () Bool)

(declare-fun Unit!8178 () Unit!8136)

(assert (=> b!263808 (= e!170917 Unit!8178)))

(declare-fun b!263809 () Bool)

(assert (=> b!263809 (= e!170916 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132993) lt!132994)))))

(assert (= (and d!63439 c!45076) b!263807))

(assert (= (and d!63439 (not c!45076)) b!263808))

(assert (= (and d!63439 (not res!128761)) b!263809))

(declare-fun m!279947 () Bool)

(assert (=> d!63439 m!279947))

(declare-fun m!279949 () Bool)

(assert (=> b!263807 m!279949))

(assert (=> b!263807 m!279017))

(assert (=> b!263807 m!279017))

(declare-fun m!279951 () Bool)

(assert (=> b!263807 m!279951))

(assert (=> b!263809 m!279017))

(assert (=> b!263809 m!279017))

(assert (=> b!263809 m!279951))

(assert (=> d!63055 d!63439))

(assert (=> d!63055 d!63065))

(declare-fun d!63441 () Bool)

(assert (=> d!63441 (= (get!3088 (getValueByKey!318 (toList!1927 lt!133003) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!5502 (getValueByKey!318 (toList!1927 lt!133003) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63049 d!63441))

(declare-fun b!263811 () Bool)

(declare-fun e!170918 () Option!324)

(declare-fun e!170919 () Option!324)

(assert (=> b!263811 (= e!170918 e!170919)))

(declare-fun c!45078 () Bool)

(assert (=> b!263811 (= c!45078 (and ((_ is Cons!3813) (toList!1927 lt!133003)) (not (= (_1!2471 (h!4479 (toList!1927 lt!133003))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!263813 () Bool)

(assert (=> b!263813 (= e!170919 None!322)))

(declare-fun d!63443 () Bool)

(declare-fun c!45077 () Bool)

(assert (=> d!63443 (= c!45077 (and ((_ is Cons!3813) (toList!1927 lt!133003)) (= (_1!2471 (h!4479 (toList!1927 lt!133003))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63443 (= (getValueByKey!318 (toList!1927 lt!133003) #b0000000000000000000000000000000000000000000000000000000000000000) e!170918)))

(declare-fun b!263810 () Bool)

(assert (=> b!263810 (= e!170918 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!133003)))))))

(declare-fun b!263812 () Bool)

(assert (=> b!263812 (= e!170919 (getValueByKey!318 (t!8885 (toList!1927 lt!133003)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63443 c!45077) b!263810))

(assert (= (and d!63443 (not c!45077)) b!263811))

(assert (= (and b!263811 c!45078) b!263812))

(assert (= (and b!263811 (not c!45078)) b!263813))

(declare-fun m!279953 () Bool)

(assert (=> b!263812 m!279953))

(assert (=> d!63049 d!63443))

(declare-fun b!263814 () Bool)

(declare-fun e!170925 () Bool)

(declare-fun e!170923 () Bool)

(assert (=> b!263814 (= e!170925 e!170923)))

(assert (=> b!263814 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))))

(declare-fun lt!133444 () ListLongMap!3823)

(declare-fun res!128763 () Bool)

(assert (=> b!263814 (= res!128763 (contains!1889 lt!133444 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!263814 (=> (not res!128763) (not e!170923))))

(declare-fun b!263815 () Bool)

(declare-fun e!170920 () Bool)

(assert (=> b!263815 (= e!170920 (= lt!133444 (getCurrentListMapNoExtraKeys!578 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504))) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504))))))

(declare-fun b!263816 () Bool)

(assert (=> b!263816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))))

(assert (=> b!263816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6343 (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504))))))))

(assert (=> b!263816 (= e!170923 (= (apply!262 lt!133444 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)) (get!3087 (select (arr!5991 (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!263817 () Bool)

(declare-fun e!170922 () ListLongMap!3823)

(assert (=> b!263817 (= e!170922 (ListLongMap!3824 Nil!3814))))

(declare-fun b!263818 () Bool)

(assert (=> b!263818 (= e!170920 (isEmpty!545 lt!133444))))

(declare-fun b!263819 () Bool)

(assert (=> b!263819 (= e!170925 e!170920)))

(declare-fun c!45081 () Bool)

(assert (=> b!263819 (= c!45081 (bvslt #b00000000000000000000000000000000 (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))))

(declare-fun b!263820 () Bool)

(declare-fun res!128762 () Bool)

(declare-fun e!170926 () Bool)

(assert (=> b!263820 (=> (not res!128762) (not e!170926))))

(assert (=> b!263820 (= res!128762 (not (contains!1889 lt!133444 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263821 () Bool)

(declare-fun lt!133448 () Unit!8136)

(declare-fun lt!133446 () Unit!8136)

(assert (=> b!263821 (= lt!133448 lt!133446)))

(declare-fun lt!133442 () V!8521)

(declare-fun lt!133443 () ListLongMap!3823)

(declare-fun lt!133445 () (_ BitVec 64))

(declare-fun lt!133447 () (_ BitVec 64))

(assert (=> b!263821 (not (contains!1889 (+!713 lt!133443 (tuple2!4921 lt!133447 lt!133442)) lt!133445))))

(assert (=> b!263821 (= lt!133446 (addStillNotContains!130 lt!133443 lt!133447 lt!133442 lt!133445))))

(assert (=> b!263821 (= lt!133445 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!263821 (= lt!133442 (get!3087 (select (arr!5991 (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!263821 (= lt!133447 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun call!25240 () ListLongMap!3823)

(assert (=> b!263821 (= lt!133443 call!25240)))

(declare-fun e!170921 () ListLongMap!3823)

(assert (=> b!263821 (= e!170921 (+!713 call!25240 (tuple2!4921 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!25237 () Bool)

(assert (=> bm!25237 (= call!25240 (getCurrentListMapNoExtraKeys!578 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504))) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504)))))

(declare-fun b!263822 () Bool)

(assert (=> b!263822 (= e!170926 e!170925)))

(declare-fun c!45080 () Bool)

(declare-fun e!170924 () Bool)

(assert (=> b!263822 (= c!45080 e!170924)))

(declare-fun res!128764 () Bool)

(assert (=> b!263822 (=> (not res!128764) (not e!170924))))

(assert (=> b!263822 (= res!128764 (bvslt #b00000000000000000000000000000000 (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))))

(declare-fun b!263823 () Bool)

(assert (=> b!263823 (= e!170924 (validKeyInArray!0 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!263823 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!263824 () Bool)

(assert (=> b!263824 (= e!170921 call!25240)))

(declare-fun d!63445 () Bool)

(assert (=> d!63445 e!170926))

(declare-fun res!128765 () Bool)

(assert (=> d!63445 (=> (not res!128765) (not e!170926))))

(assert (=> d!63445 (= res!128765 (not (contains!1889 lt!133444 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63445 (= lt!133444 e!170922)))

(declare-fun c!45079 () Bool)

(assert (=> d!63445 (= c!45079 (bvsge #b00000000000000000000000000000000 (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))))

(assert (=> d!63445 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!63445 (= (getCurrentListMapNoExtraKeys!578 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (array!12664 (store (arr!5991 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6343 (_values!4825 thiss!1504))) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) lt!133444)))

(declare-fun b!263825 () Bool)

(assert (=> b!263825 (= e!170922 e!170921)))

(declare-fun c!45082 () Bool)

(assert (=> b!263825 (= c!45082 (validKeyInArray!0 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!63445 c!45079) b!263817))

(assert (= (and d!63445 (not c!45079)) b!263825))

(assert (= (and b!263825 c!45082) b!263821))

(assert (= (and b!263825 (not c!45082)) b!263824))

(assert (= (or b!263821 b!263824) bm!25237))

(assert (= (and d!63445 res!128765) b!263820))

(assert (= (and b!263820 res!128762) b!263822))

(assert (= (and b!263822 res!128764) b!263823))

(assert (= (and b!263822 c!45080) b!263814))

(assert (= (and b!263822 (not c!45080)) b!263819))

(assert (= (and b!263814 res!128763) b!263816))

(assert (= (and b!263819 c!45081) b!263815))

(assert (= (and b!263819 (not c!45081)) b!263818))

(declare-fun b_lambda!8347 () Bool)

(assert (=> (not b_lambda!8347) (not b!263816)))

(assert (=> b!263816 t!8892))

(declare-fun b_and!13935 () Bool)

(assert (= b_and!13933 (and (=> t!8892 result!5425) b_and!13935)))

(declare-fun b_lambda!8349 () Bool)

(assert (=> (not b_lambda!8349) (not b!263821)))

(assert (=> b!263821 t!8892))

(declare-fun b_and!13937 () Bool)

(assert (= b_and!13935 (and (=> t!8892 result!5425) b_and!13937)))

(assert (=> b!263825 m!278833))

(assert (=> b!263825 m!278833))

(assert (=> b!263825 m!278871))

(assert (=> b!263816 m!278833))

(declare-fun m!279955 () Bool)

(assert (=> b!263816 m!279955))

(assert (=> b!263816 m!278569))

(assert (=> b!263816 m!278833))

(assert (=> b!263816 m!278861))

(assert (=> b!263816 m!278569))

(assert (=> b!263816 m!278863))

(assert (=> b!263816 m!278861))

(declare-fun m!279957 () Bool)

(assert (=> b!263815 m!279957))

(assert (=> b!263823 m!278833))

(assert (=> b!263823 m!278833))

(assert (=> b!263823 m!278871))

(declare-fun m!279959 () Bool)

(assert (=> b!263820 m!279959))

(assert (=> bm!25237 m!279957))

(declare-fun m!279961 () Bool)

(assert (=> d!63445 m!279961))

(assert (=> d!63445 m!278579))

(declare-fun m!279963 () Bool)

(assert (=> b!263818 m!279963))

(declare-fun m!279965 () Bool)

(assert (=> b!263821 m!279965))

(declare-fun m!279967 () Bool)

(assert (=> b!263821 m!279967))

(assert (=> b!263821 m!278569))

(assert (=> b!263821 m!279965))

(declare-fun m!279969 () Bool)

(assert (=> b!263821 m!279969))

(assert (=> b!263821 m!278833))

(assert (=> b!263821 m!278861))

(assert (=> b!263821 m!278569))

(assert (=> b!263821 m!278863))

(declare-fun m!279971 () Bool)

(assert (=> b!263821 m!279971))

(assert (=> b!263821 m!278861))

(assert (=> b!263814 m!278833))

(assert (=> b!263814 m!278833))

(declare-fun m!279973 () Bool)

(assert (=> b!263814 m!279973))

(assert (=> b!263142 d!63445))

(declare-fun d!63447 () Bool)

(assert (=> d!63447 (= (apply!262 (+!713 lt!133109 (tuple2!4921 lt!133104 (minValue!4683 thiss!1504))) lt!133111) (apply!262 lt!133109 lt!133111))))

(declare-fun lt!133449 () Unit!8136)

(assert (=> d!63447 (= lt!133449 (choose!1301 lt!133109 lt!133104 (minValue!4683 thiss!1504) lt!133111))))

(declare-fun e!170927 () Bool)

(assert (=> d!63447 e!170927))

(declare-fun res!128766 () Bool)

(assert (=> d!63447 (=> (not res!128766) (not e!170927))))

(assert (=> d!63447 (= res!128766 (contains!1889 lt!133109 lt!133111))))

(assert (=> d!63447 (= (addApplyDifferent!238 lt!133109 lt!133104 (minValue!4683 thiss!1504) lt!133111) lt!133449)))

(declare-fun b!263826 () Bool)

(assert (=> b!263826 (= e!170927 (not (= lt!133111 lt!133104)))))

(assert (= (and d!63447 res!128766) b!263826))

(assert (=> d!63447 m!278827))

(assert (=> d!63447 m!278827))

(assert (=> d!63447 m!278849))

(declare-fun m!279975 () Bool)

(assert (=> d!63447 m!279975))

(assert (=> d!63447 m!278853))

(declare-fun m!279977 () Bool)

(assert (=> d!63447 m!279977))

(assert (=> b!263142 d!63447))

(declare-fun d!63449 () Bool)

(assert (=> d!63449 (= (apply!262 lt!133109 lt!133111) (get!3088 (getValueByKey!318 (toList!1927 lt!133109) lt!133111)))))

(declare-fun bs!9275 () Bool)

(assert (= bs!9275 d!63449))

(declare-fun m!279979 () Bool)

(assert (=> bs!9275 m!279979))

(assert (=> bs!9275 m!279979))

(declare-fun m!279981 () Bool)

(assert (=> bs!9275 m!279981))

(assert (=> b!263142 d!63449))

(declare-fun d!63451 () Bool)

(declare-fun e!170928 () Bool)

(assert (=> d!63451 e!170928))

(declare-fun res!128768 () Bool)

(assert (=> d!63451 (=> (not res!128768) (not e!170928))))

(declare-fun lt!133451 () ListLongMap!3823)

(assert (=> d!63451 (= res!128768 (contains!1889 lt!133451 (_1!2471 (tuple2!4921 lt!133104 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133450 () List!3817)

(assert (=> d!63451 (= lt!133451 (ListLongMap!3824 lt!133450))))

(declare-fun lt!133453 () Unit!8136)

(declare-fun lt!133452 () Unit!8136)

(assert (=> d!63451 (= lt!133453 lt!133452)))

(assert (=> d!63451 (= (getValueByKey!318 lt!133450 (_1!2471 (tuple2!4921 lt!133104 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!133104 (minValue!4683 thiss!1504)))))))

(assert (=> d!63451 (= lt!133452 (lemmaContainsTupThenGetReturnValue!177 lt!133450 (_1!2471 (tuple2!4921 lt!133104 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133104 (minValue!4683 thiss!1504)))))))

(assert (=> d!63451 (= lt!133450 (insertStrictlySorted!180 (toList!1927 lt!133109) (_1!2471 (tuple2!4921 lt!133104 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133104 (minValue!4683 thiss!1504)))))))

(assert (=> d!63451 (= (+!713 lt!133109 (tuple2!4921 lt!133104 (minValue!4683 thiss!1504))) lt!133451)))

(declare-fun b!263827 () Bool)

(declare-fun res!128767 () Bool)

(assert (=> b!263827 (=> (not res!128767) (not e!170928))))

(assert (=> b!263827 (= res!128767 (= (getValueByKey!318 (toList!1927 lt!133451) (_1!2471 (tuple2!4921 lt!133104 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!133104 (minValue!4683 thiss!1504))))))))

(declare-fun b!263828 () Bool)

(assert (=> b!263828 (= e!170928 (contains!1893 (toList!1927 lt!133451) (tuple2!4921 lt!133104 (minValue!4683 thiss!1504))))))

(assert (= (and d!63451 res!128768) b!263827))

(assert (= (and b!263827 res!128767) b!263828))

(declare-fun m!279983 () Bool)

(assert (=> d!63451 m!279983))

(declare-fun m!279985 () Bool)

(assert (=> d!63451 m!279985))

(declare-fun m!279987 () Bool)

(assert (=> d!63451 m!279987))

(declare-fun m!279989 () Bool)

(assert (=> d!63451 m!279989))

(declare-fun m!279991 () Bool)

(assert (=> b!263827 m!279991))

(declare-fun m!279993 () Bool)

(assert (=> b!263828 m!279993))

(assert (=> b!263142 d!63451))

(declare-fun d!63453 () Bool)

(assert (=> d!63453 (= (apply!262 (+!713 lt!133109 (tuple2!4921 lt!133104 (minValue!4683 thiss!1504))) lt!133111) (get!3088 (getValueByKey!318 (toList!1927 (+!713 lt!133109 (tuple2!4921 lt!133104 (minValue!4683 thiss!1504)))) lt!133111)))))

(declare-fun bs!9276 () Bool)

(assert (= bs!9276 d!63453))

(declare-fun m!279995 () Bool)

(assert (=> bs!9276 m!279995))

(assert (=> bs!9276 m!279995))

(declare-fun m!279997 () Bool)

(assert (=> bs!9276 m!279997))

(assert (=> b!263142 d!63453))

(declare-fun d!63455 () Bool)

(declare-fun e!170929 () Bool)

(assert (=> d!63455 e!170929))

(declare-fun res!128770 () Bool)

(assert (=> d!63455 (=> (not res!128770) (not e!170929))))

(declare-fun lt!133455 () ListLongMap!3823)

(assert (=> d!63455 (= res!128770 (contains!1889 lt!133455 (_1!2471 (tuple2!4921 lt!133110 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133454 () List!3817)

(assert (=> d!63455 (= lt!133455 (ListLongMap!3824 lt!133454))))

(declare-fun lt!133457 () Unit!8136)

(declare-fun lt!133456 () Unit!8136)

(assert (=> d!63455 (= lt!133457 lt!133456)))

(assert (=> d!63455 (= (getValueByKey!318 lt!133454 (_1!2471 (tuple2!4921 lt!133110 (zeroValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!133110 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63455 (= lt!133456 (lemmaContainsTupThenGetReturnValue!177 lt!133454 (_1!2471 (tuple2!4921 lt!133110 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133110 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63455 (= lt!133454 (insertStrictlySorted!180 (toList!1927 lt!133113) (_1!2471 (tuple2!4921 lt!133110 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133110 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63455 (= (+!713 lt!133113 (tuple2!4921 lt!133110 (zeroValue!4683 thiss!1504))) lt!133455)))

(declare-fun b!263829 () Bool)

(declare-fun res!128769 () Bool)

(assert (=> b!263829 (=> (not res!128769) (not e!170929))))

(assert (=> b!263829 (= res!128769 (= (getValueByKey!318 (toList!1927 lt!133455) (_1!2471 (tuple2!4921 lt!133110 (zeroValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!133110 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!263830 () Bool)

(assert (=> b!263830 (= e!170929 (contains!1893 (toList!1927 lt!133455) (tuple2!4921 lt!133110 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!63455 res!128770) b!263829))

(assert (= (and b!263829 res!128769) b!263830))

(declare-fun m!279999 () Bool)

(assert (=> d!63455 m!279999))

(declare-fun m!280001 () Bool)

(assert (=> d!63455 m!280001))

(declare-fun m!280003 () Bool)

(assert (=> d!63455 m!280003))

(declare-fun m!280005 () Bool)

(assert (=> d!63455 m!280005))

(declare-fun m!280007 () Bool)

(assert (=> b!263829 m!280007))

(declare-fun m!280009 () Bool)

(assert (=> b!263830 m!280009))

(assert (=> b!263142 d!63455))

(declare-fun d!63457 () Bool)

(assert (=> d!63457 (= (apply!262 (+!713 lt!133107 (tuple2!4921 lt!133116 (zeroValue!4683 thiss!1504))) lt!133108) (get!3088 (getValueByKey!318 (toList!1927 (+!713 lt!133107 (tuple2!4921 lt!133116 (zeroValue!4683 thiss!1504)))) lt!133108)))))

(declare-fun bs!9277 () Bool)

(assert (= bs!9277 d!63457))

(declare-fun m!280011 () Bool)

(assert (=> bs!9277 m!280011))

(assert (=> bs!9277 m!280011))

(declare-fun m!280013 () Bool)

(assert (=> bs!9277 m!280013))

(assert (=> b!263142 d!63457))

(declare-fun d!63459 () Bool)

(assert (=> d!63459 (= (apply!262 lt!133115 lt!133105) (get!3088 (getValueByKey!318 (toList!1927 lt!133115) lt!133105)))))

(declare-fun bs!9278 () Bool)

(assert (= bs!9278 d!63459))

(declare-fun m!280015 () Bool)

(assert (=> bs!9278 m!280015))

(assert (=> bs!9278 m!280015))

(declare-fun m!280017 () Bool)

(assert (=> bs!9278 m!280017))

(assert (=> b!263142 d!63459))

(declare-fun d!63461 () Bool)

(declare-fun e!170930 () Bool)

(assert (=> d!63461 e!170930))

(declare-fun res!128772 () Bool)

(assert (=> d!63461 (=> (not res!128772) (not e!170930))))

(declare-fun lt!133459 () ListLongMap!3823)

(assert (=> d!63461 (= res!128772 (contains!1889 lt!133459 (_1!2471 (tuple2!4921 lt!133121 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133458 () List!3817)

(assert (=> d!63461 (= lt!133459 (ListLongMap!3824 lt!133458))))

(declare-fun lt!133461 () Unit!8136)

(declare-fun lt!133460 () Unit!8136)

(assert (=> d!63461 (= lt!133461 lt!133460)))

(assert (=> d!63461 (= (getValueByKey!318 lt!133458 (_1!2471 (tuple2!4921 lt!133121 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!133121 (minValue!4683 thiss!1504)))))))

(assert (=> d!63461 (= lt!133460 (lemmaContainsTupThenGetReturnValue!177 lt!133458 (_1!2471 (tuple2!4921 lt!133121 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133121 (minValue!4683 thiss!1504)))))))

(assert (=> d!63461 (= lt!133458 (insertStrictlySorted!180 (toList!1927 lt!133115) (_1!2471 (tuple2!4921 lt!133121 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133121 (minValue!4683 thiss!1504)))))))

(assert (=> d!63461 (= (+!713 lt!133115 (tuple2!4921 lt!133121 (minValue!4683 thiss!1504))) lt!133459)))

(declare-fun b!263831 () Bool)

(declare-fun res!128771 () Bool)

(assert (=> b!263831 (=> (not res!128771) (not e!170930))))

(assert (=> b!263831 (= res!128771 (= (getValueByKey!318 (toList!1927 lt!133459) (_1!2471 (tuple2!4921 lt!133121 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!133121 (minValue!4683 thiss!1504))))))))

(declare-fun b!263832 () Bool)

(assert (=> b!263832 (= e!170930 (contains!1893 (toList!1927 lt!133459) (tuple2!4921 lt!133121 (minValue!4683 thiss!1504))))))

(assert (= (and d!63461 res!128772) b!263831))

(assert (= (and b!263831 res!128771) b!263832))

(declare-fun m!280019 () Bool)

(assert (=> d!63461 m!280019))

(declare-fun m!280021 () Bool)

(assert (=> d!63461 m!280021))

(declare-fun m!280023 () Bool)

(assert (=> d!63461 m!280023))

(declare-fun m!280025 () Bool)

(assert (=> d!63461 m!280025))

(declare-fun m!280027 () Bool)

(assert (=> b!263831 m!280027))

(declare-fun m!280029 () Bool)

(assert (=> b!263832 m!280029))

(assert (=> b!263142 d!63461))

(declare-fun d!63463 () Bool)

(assert (=> d!63463 (= (apply!262 (+!713 lt!133115 (tuple2!4921 lt!133121 (minValue!4683 thiss!1504))) lt!133105) (get!3088 (getValueByKey!318 (toList!1927 (+!713 lt!133115 (tuple2!4921 lt!133121 (minValue!4683 thiss!1504)))) lt!133105)))))

(declare-fun bs!9279 () Bool)

(assert (= bs!9279 d!63463))

(declare-fun m!280031 () Bool)

(assert (=> bs!9279 m!280031))

(assert (=> bs!9279 m!280031))

(declare-fun m!280033 () Bool)

(assert (=> bs!9279 m!280033))

(assert (=> b!263142 d!63463))

(declare-fun d!63465 () Bool)

(assert (=> d!63465 (= (apply!262 (+!713 lt!133107 (tuple2!4921 lt!133116 (zeroValue!4683 thiss!1504))) lt!133108) (apply!262 lt!133107 lt!133108))))

(declare-fun lt!133462 () Unit!8136)

(assert (=> d!63465 (= lt!133462 (choose!1301 lt!133107 lt!133116 (zeroValue!4683 thiss!1504) lt!133108))))

(declare-fun e!170931 () Bool)

(assert (=> d!63465 e!170931))

(declare-fun res!128773 () Bool)

(assert (=> d!63465 (=> (not res!128773) (not e!170931))))

(assert (=> d!63465 (= res!128773 (contains!1889 lt!133107 lt!133108))))

(assert (=> d!63465 (= (addApplyDifferent!238 lt!133107 lt!133116 (zeroValue!4683 thiss!1504) lt!133108) lt!133462)))

(declare-fun b!263833 () Bool)

(assert (=> b!263833 (= e!170931 (not (= lt!133108 lt!133116)))))

(assert (= (and d!63465 res!128773) b!263833))

(assert (=> d!63465 m!278837))

(assert (=> d!63465 m!278837))

(assert (=> d!63465 m!278839))

(declare-fun m!280035 () Bool)

(assert (=> d!63465 m!280035))

(assert (=> d!63465 m!278851))

(declare-fun m!280037 () Bool)

(assert (=> d!63465 m!280037))

(assert (=> b!263142 d!63465))

(declare-fun d!63467 () Bool)

(declare-fun e!170932 () Bool)

(assert (=> d!63467 e!170932))

(declare-fun res!128775 () Bool)

(assert (=> d!63467 (=> (not res!128775) (not e!170932))))

(declare-fun lt!133464 () ListLongMap!3823)

(assert (=> d!63467 (= res!128775 (contains!1889 lt!133464 (_1!2471 (tuple2!4921 lt!133116 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133463 () List!3817)

(assert (=> d!63467 (= lt!133464 (ListLongMap!3824 lt!133463))))

(declare-fun lt!133466 () Unit!8136)

(declare-fun lt!133465 () Unit!8136)

(assert (=> d!63467 (= lt!133466 lt!133465)))

(assert (=> d!63467 (= (getValueByKey!318 lt!133463 (_1!2471 (tuple2!4921 lt!133116 (zeroValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!133116 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63467 (= lt!133465 (lemmaContainsTupThenGetReturnValue!177 lt!133463 (_1!2471 (tuple2!4921 lt!133116 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133116 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63467 (= lt!133463 (insertStrictlySorted!180 (toList!1927 lt!133107) (_1!2471 (tuple2!4921 lt!133116 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133116 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63467 (= (+!713 lt!133107 (tuple2!4921 lt!133116 (zeroValue!4683 thiss!1504))) lt!133464)))

(declare-fun b!263834 () Bool)

(declare-fun res!128774 () Bool)

(assert (=> b!263834 (=> (not res!128774) (not e!170932))))

(assert (=> b!263834 (= res!128774 (= (getValueByKey!318 (toList!1927 lt!133464) (_1!2471 (tuple2!4921 lt!133116 (zeroValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!133116 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!263835 () Bool)

(assert (=> b!263835 (= e!170932 (contains!1893 (toList!1927 lt!133464) (tuple2!4921 lt!133116 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!63467 res!128775) b!263834))

(assert (= (and b!263834 res!128774) b!263835))

(declare-fun m!280039 () Bool)

(assert (=> d!63467 m!280039))

(declare-fun m!280041 () Bool)

(assert (=> d!63467 m!280041))

(declare-fun m!280043 () Bool)

(assert (=> d!63467 m!280043))

(declare-fun m!280045 () Bool)

(assert (=> d!63467 m!280045))

(declare-fun m!280047 () Bool)

(assert (=> b!263834 m!280047))

(declare-fun m!280049 () Bool)

(assert (=> b!263835 m!280049))

(assert (=> b!263142 d!63467))

(declare-fun d!63469 () Bool)

(assert (=> d!63469 (contains!1889 (+!713 lt!133113 (tuple2!4921 lt!133110 (zeroValue!4683 thiss!1504))) lt!133106)))

(declare-fun lt!133467 () Unit!8136)

(assert (=> d!63469 (= lt!133467 (choose!1302 lt!133113 lt!133110 (zeroValue!4683 thiss!1504) lt!133106))))

(assert (=> d!63469 (contains!1889 lt!133113 lt!133106)))

(assert (=> d!63469 (= (addStillContains!238 lt!133113 lt!133110 (zeroValue!4683 thiss!1504) lt!133106) lt!133467)))

(declare-fun bs!9280 () Bool)

(assert (= bs!9280 d!63469))

(assert (=> bs!9280 m!278829))

(assert (=> bs!9280 m!278829))

(assert (=> bs!9280 m!278841))

(declare-fun m!280051 () Bool)

(assert (=> bs!9280 m!280051))

(declare-fun m!280053 () Bool)

(assert (=> bs!9280 m!280053))

(assert (=> b!263142 d!63469))

(declare-fun d!63471 () Bool)

(assert (=> d!63471 (= (apply!262 (+!713 lt!133115 (tuple2!4921 lt!133121 (minValue!4683 thiss!1504))) lt!133105) (apply!262 lt!133115 lt!133105))))

(declare-fun lt!133468 () Unit!8136)

(assert (=> d!63471 (= lt!133468 (choose!1301 lt!133115 lt!133121 (minValue!4683 thiss!1504) lt!133105))))

(declare-fun e!170933 () Bool)

(assert (=> d!63471 e!170933))

(declare-fun res!128776 () Bool)

(assert (=> d!63471 (=> (not res!128776) (not e!170933))))

(assert (=> d!63471 (= res!128776 (contains!1889 lt!133115 lt!133105))))

(assert (=> d!63471 (= (addApplyDifferent!238 lt!133115 lt!133121 (minValue!4683 thiss!1504) lt!133105) lt!133468)))

(declare-fun b!263836 () Bool)

(assert (=> b!263836 (= e!170933 (not (= lt!133105 lt!133121)))))

(assert (= (and d!63471 res!128776) b!263836))

(assert (=> d!63471 m!278843))

(assert (=> d!63471 m!278843))

(assert (=> d!63471 m!278845))

(declare-fun m!280055 () Bool)

(assert (=> d!63471 m!280055))

(assert (=> d!63471 m!278831))

(declare-fun m!280057 () Bool)

(assert (=> d!63471 m!280057))

(assert (=> b!263142 d!63471))

(declare-fun d!63473 () Bool)

(assert (=> d!63473 (= (apply!262 lt!133107 lt!133108) (get!3088 (getValueByKey!318 (toList!1927 lt!133107) lt!133108)))))

(declare-fun bs!9281 () Bool)

(assert (= bs!9281 d!63473))

(declare-fun m!280059 () Bool)

(assert (=> bs!9281 m!280059))

(assert (=> bs!9281 m!280059))

(declare-fun m!280061 () Bool)

(assert (=> bs!9281 m!280061))

(assert (=> b!263142 d!63473))

(declare-fun d!63475 () Bool)

(declare-fun e!170934 () Bool)

(assert (=> d!63475 e!170934))

(declare-fun res!128777 () Bool)

(assert (=> d!63475 (=> res!128777 e!170934)))

(declare-fun lt!133472 () Bool)

(assert (=> d!63475 (= res!128777 (not lt!133472))))

(declare-fun lt!133470 () Bool)

(assert (=> d!63475 (= lt!133472 lt!133470)))

(declare-fun lt!133469 () Unit!8136)

(declare-fun e!170935 () Unit!8136)

(assert (=> d!63475 (= lt!133469 e!170935)))

(declare-fun c!45083 () Bool)

(assert (=> d!63475 (= c!45083 lt!133470)))

(assert (=> d!63475 (= lt!133470 (containsKey!310 (toList!1927 (+!713 lt!133113 (tuple2!4921 lt!133110 (zeroValue!4683 thiss!1504)))) lt!133106))))

(assert (=> d!63475 (= (contains!1889 (+!713 lt!133113 (tuple2!4921 lt!133110 (zeroValue!4683 thiss!1504))) lt!133106) lt!133472)))

(declare-fun b!263837 () Bool)

(declare-fun lt!133471 () Unit!8136)

(assert (=> b!263837 (= e!170935 lt!133471)))

(assert (=> b!263837 (= lt!133471 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 (+!713 lt!133113 (tuple2!4921 lt!133110 (zeroValue!4683 thiss!1504)))) lt!133106))))

(assert (=> b!263837 (isDefined!260 (getValueByKey!318 (toList!1927 (+!713 lt!133113 (tuple2!4921 lt!133110 (zeroValue!4683 thiss!1504)))) lt!133106))))

(declare-fun b!263838 () Bool)

(declare-fun Unit!8179 () Unit!8136)

(assert (=> b!263838 (= e!170935 Unit!8179)))

(declare-fun b!263839 () Bool)

(assert (=> b!263839 (= e!170934 (isDefined!260 (getValueByKey!318 (toList!1927 (+!713 lt!133113 (tuple2!4921 lt!133110 (zeroValue!4683 thiss!1504)))) lt!133106)))))

(assert (= (and d!63475 c!45083) b!263837))

(assert (= (and d!63475 (not c!45083)) b!263838))

(assert (= (and d!63475 (not res!128777)) b!263839))

(declare-fun m!280063 () Bool)

(assert (=> d!63475 m!280063))

(declare-fun m!280065 () Bool)

(assert (=> b!263837 m!280065))

(declare-fun m!280067 () Bool)

(assert (=> b!263837 m!280067))

(assert (=> b!263837 m!280067))

(declare-fun m!280069 () Bool)

(assert (=> b!263837 m!280069))

(assert (=> b!263839 m!280067))

(assert (=> b!263839 m!280067))

(assert (=> b!263839 m!280069))

(assert (=> b!263142 d!63475))

(declare-fun b!263840 () Bool)

(declare-fun e!170938 () Bool)

(declare-fun e!170937 () Bool)

(assert (=> b!263840 (= e!170938 e!170937)))

(declare-fun lt!133473 () (_ BitVec 64))

(assert (=> b!263840 (= lt!133473 (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!133474 () Unit!8136)

(assert (=> b!263840 (= lt!133474 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!7033 thiss!1504) lt!133473 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!263840 (arrayContainsKey!0 (_keys!7033 thiss!1504) lt!133473 #b00000000000000000000000000000000)))

(declare-fun lt!133475 () Unit!8136)

(assert (=> b!263840 (= lt!133475 lt!133474)))

(declare-fun res!128779 () Bool)

(assert (=> b!263840 (= res!128779 (= (seekEntryOrOpen!0 (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!7033 thiss!1504) (mask!11207 thiss!1504)) (Found!1193 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!263840 (=> (not res!128779) (not e!170937))))

(declare-fun d!63477 () Bool)

(declare-fun res!128778 () Bool)

(declare-fun e!170936 () Bool)

(assert (=> d!63477 (=> res!128778 e!170936)))

(assert (=> d!63477 (= res!128778 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(assert (=> d!63477 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!7033 thiss!1504) (mask!11207 thiss!1504)) e!170936)))

(declare-fun b!263841 () Bool)

(declare-fun call!25241 () Bool)

(assert (=> b!263841 (= e!170937 call!25241)))

(declare-fun b!263842 () Bool)

(assert (=> b!263842 (= e!170936 e!170938)))

(declare-fun c!45084 () Bool)

(assert (=> b!263842 (= c!45084 (validKeyInArray!0 (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263843 () Bool)

(assert (=> b!263843 (= e!170938 call!25241)))

(declare-fun bm!25238 () Bool)

(assert (=> bm!25238 (= call!25241 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!7033 thiss!1504) (mask!11207 thiss!1504)))))

(assert (= (and d!63477 (not res!128778)) b!263842))

(assert (= (and b!263842 c!45084) b!263840))

(assert (= (and b!263842 (not c!45084)) b!263843))

(assert (= (and b!263840 res!128779) b!263841))

(assert (= (or b!263841 b!263843) bm!25238))

(assert (=> b!263840 m!278805))

(declare-fun m!280071 () Bool)

(assert (=> b!263840 m!280071))

(declare-fun m!280073 () Bool)

(assert (=> b!263840 m!280073))

(assert (=> b!263840 m!278805))

(declare-fun m!280075 () Bool)

(assert (=> b!263840 m!280075))

(assert (=> b!263842 m!278805))

(assert (=> b!263842 m!278805))

(assert (=> b!263842 m!278807))

(declare-fun m!280077 () Bool)

(assert (=> bm!25238 m!280077))

(assert (=> bm!25207 d!63477))

(declare-fun d!63479 () Bool)

(declare-fun e!170939 () Bool)

(assert (=> d!63479 e!170939))

(declare-fun res!128780 () Bool)

(assert (=> d!63479 (=> res!128780 e!170939)))

(declare-fun lt!133479 () Bool)

(assert (=> d!63479 (= res!128780 (not lt!133479))))

(declare-fun lt!133477 () Bool)

(assert (=> d!63479 (= lt!133479 lt!133477)))

(declare-fun lt!133476 () Unit!8136)

(declare-fun e!170940 () Unit!8136)

(assert (=> d!63479 (= lt!133476 e!170940)))

(declare-fun c!45085 () Bool)

(assert (=> d!63479 (= c!45085 lt!133477)))

(assert (=> d!63479 (= lt!133477 (containsKey!310 (toList!1927 lt!132979) lt!132969))))

(assert (=> d!63479 (= (contains!1889 lt!132979 lt!132969) lt!133479)))

(declare-fun b!263844 () Bool)

(declare-fun lt!133478 () Unit!8136)

(assert (=> b!263844 (= e!170940 lt!133478)))

(assert (=> b!263844 (= lt!133478 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!132979) lt!132969))))

(assert (=> b!263844 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132979) lt!132969))))

(declare-fun b!263845 () Bool)

(declare-fun Unit!8180 () Unit!8136)

(assert (=> b!263845 (= e!170940 Unit!8180)))

(declare-fun b!263846 () Bool)

(assert (=> b!263846 (= e!170939 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132979) lt!132969)))))

(assert (= (and d!63479 c!45085) b!263844))

(assert (= (and d!63479 (not c!45085)) b!263845))

(assert (= (and d!63479 (not res!128780)) b!263846))

(declare-fun m!280079 () Bool)

(assert (=> d!63479 m!280079))

(declare-fun m!280081 () Bool)

(assert (=> b!263844 m!280081))

(assert (=> b!263844 m!279169))

(assert (=> b!263844 m!279169))

(declare-fun m!280083 () Bool)

(assert (=> b!263844 m!280083))

(assert (=> b!263846 m!279169))

(assert (=> b!263846 m!279169))

(assert (=> b!263846 m!280083))

(assert (=> d!63091 d!63479))

(assert (=> d!63091 d!63105))

(declare-fun d!63481 () Bool)

(assert (=> d!63481 (= (apply!262 (+!713 lt!132979 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))) lt!132969) (apply!262 lt!132979 lt!132969))))

(assert (=> d!63481 true))

(declare-fun _$34!1135 () Unit!8136)

(assert (=> d!63481 (= (choose!1301 lt!132979 lt!132985 (minValue!4683 thiss!1504) lt!132969) _$34!1135)))

(declare-fun bs!9282 () Bool)

(assert (= bs!9282 d!63481))

(assert (=> bs!9282 m!278549))

(assert (=> bs!9282 m!278549))

(assert (=> bs!9282 m!278551))

(assert (=> bs!9282 m!278539))

(assert (=> d!63091 d!63481))

(assert (=> d!63091 d!63109))

(assert (=> d!63091 d!63111))

(assert (=> d!63211 d!63209))

(assert (=> d!63211 d!62935))

(declare-fun d!63483 () Bool)

(declare-fun e!170941 () Bool)

(assert (=> d!63483 e!170941))

(declare-fun res!128781 () Bool)

(assert (=> d!63483 (=> res!128781 e!170941)))

(declare-fun lt!133483 () Bool)

(assert (=> d!63483 (= res!128781 (not lt!133483))))

(declare-fun lt!133481 () Bool)

(assert (=> d!63483 (= lt!133483 lt!133481)))

(declare-fun lt!133480 () Unit!8136)

(declare-fun e!170942 () Unit!8136)

(assert (=> d!63483 (= lt!133480 e!170942)))

(declare-fun c!45086 () Bool)

(assert (=> d!63483 (= c!45086 lt!133481)))

(assert (=> d!63483 (= lt!133481 (containsKey!310 (toList!1927 lt!133188) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63483 (= (contains!1889 lt!133188 #b0000000000000000000000000000000000000000000000000000000000000000) lt!133483)))

(declare-fun b!263847 () Bool)

(declare-fun lt!133482 () Unit!8136)

(assert (=> b!263847 (= e!170942 lt!133482)))

(assert (=> b!263847 (= lt!133482 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133188) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263847 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133188) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263848 () Bool)

(declare-fun Unit!8181 () Unit!8136)

(assert (=> b!263848 (= e!170942 Unit!8181)))

(declare-fun b!263849 () Bool)

(assert (=> b!263849 (= e!170941 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133188) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63483 c!45086) b!263847))

(assert (= (and d!63483 (not c!45086)) b!263848))

(assert (= (and d!63483 (not res!128781)) b!263849))

(declare-fun m!280085 () Bool)

(assert (=> d!63483 m!280085))

(declare-fun m!280087 () Bool)

(assert (=> b!263847 m!280087))

(declare-fun m!280089 () Bool)

(assert (=> b!263847 m!280089))

(assert (=> b!263847 m!280089))

(declare-fun m!280091 () Bool)

(assert (=> b!263847 m!280091))

(assert (=> b!263849 m!280089))

(assert (=> b!263849 m!280089))

(assert (=> b!263849 m!280091))

(assert (=> d!63077 d!63483))

(assert (=> d!63077 d!63015))

(declare-fun d!63485 () Bool)

(assert (=> d!63485 (= (get!3088 (getValueByKey!318 (toList!1927 lt!133003) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!5502 (getValueByKey!318 (toList!1927 lt!133003) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63087 d!63485))

(declare-fun b!263851 () Bool)

(declare-fun e!170943 () Option!324)

(declare-fun e!170944 () Option!324)

(assert (=> b!263851 (= e!170943 e!170944)))

(declare-fun c!45088 () Bool)

(assert (=> b!263851 (= c!45088 (and ((_ is Cons!3813) (toList!1927 lt!133003)) (not (= (_1!2471 (h!4479 (toList!1927 lt!133003))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!263853 () Bool)

(assert (=> b!263853 (= e!170944 None!322)))

(declare-fun d!63487 () Bool)

(declare-fun c!45087 () Bool)

(assert (=> d!63487 (= c!45087 (and ((_ is Cons!3813) (toList!1927 lt!133003)) (= (_1!2471 (h!4479 (toList!1927 lt!133003))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63487 (= (getValueByKey!318 (toList!1927 lt!133003) #b1000000000000000000000000000000000000000000000000000000000000000) e!170943)))

(declare-fun b!263850 () Bool)

(assert (=> b!263850 (= e!170943 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!133003)))))))

(declare-fun b!263852 () Bool)

(assert (=> b!263852 (= e!170944 (getValueByKey!318 (t!8885 (toList!1927 lt!133003)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63487 c!45087) b!263850))

(assert (= (and d!63487 (not c!45087)) b!263851))

(assert (= (and b!263851 c!45088) b!263852))

(assert (= (and b!263851 (not c!45088)) b!263853))

(declare-fun m!280093 () Bool)

(assert (=> b!263852 m!280093))

(assert (=> d!63087 d!63487))

(declare-fun d!63489 () Bool)

(declare-fun lt!133484 () Bool)

(assert (=> d!63489 (= lt!133484 (select (content!176 (t!8885 (toList!1927 lt!133021))) lt!132765))))

(declare-fun e!170946 () Bool)

(assert (=> d!63489 (= lt!133484 e!170946)))

(declare-fun res!128783 () Bool)

(assert (=> d!63489 (=> (not res!128783) (not e!170946))))

(assert (=> d!63489 (= res!128783 ((_ is Cons!3813) (t!8885 (toList!1927 lt!133021))))))

(assert (=> d!63489 (= (contains!1893 (t!8885 (toList!1927 lt!133021)) lt!132765) lt!133484)))

(declare-fun b!263854 () Bool)

(declare-fun e!170945 () Bool)

(assert (=> b!263854 (= e!170946 e!170945)))

(declare-fun res!128782 () Bool)

(assert (=> b!263854 (=> res!128782 e!170945)))

(assert (=> b!263854 (= res!128782 (= (h!4479 (t!8885 (toList!1927 lt!133021))) lt!132765))))

(declare-fun b!263855 () Bool)

(assert (=> b!263855 (= e!170945 (contains!1893 (t!8885 (t!8885 (toList!1927 lt!133021))) lt!132765))))

(assert (= (and d!63489 res!128783) b!263854))

(assert (= (and b!263854 (not res!128782)) b!263855))

(declare-fun m!280095 () Bool)

(assert (=> d!63489 m!280095))

(declare-fun m!280097 () Bool)

(assert (=> d!63489 m!280097))

(declare-fun m!280099 () Bool)

(assert (=> b!263855 m!280099))

(assert (=> b!263160 d!63489))

(declare-fun d!63491 () Bool)

(declare-fun lt!133485 () Bool)

(assert (=> d!63491 (= lt!133485 (select (content!176 (toList!1927 lt!133161)) (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))))))

(declare-fun e!170948 () Bool)

(assert (=> d!63491 (= lt!133485 e!170948)))

(declare-fun res!128785 () Bool)

(assert (=> d!63491 (=> (not res!128785) (not e!170948))))

(assert (=> d!63491 (= res!128785 ((_ is Cons!3813) (toList!1927 lt!133161)))))

(assert (=> d!63491 (= (contains!1893 (toList!1927 lt!133161) (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))) lt!133485)))

(declare-fun b!263856 () Bool)

(declare-fun e!170947 () Bool)

(assert (=> b!263856 (= e!170948 e!170947)))

(declare-fun res!128784 () Bool)

(assert (=> b!263856 (=> res!128784 e!170947)))

(assert (=> b!263856 (= res!128784 (= (h!4479 (toList!1927 lt!133161)) (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))))))

(declare-fun b!263857 () Bool)

(assert (=> b!263857 (= e!170947 (contains!1893 (t!8885 (toList!1927 lt!133161)) (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))))))

(assert (= (and d!63491 res!128785) b!263856))

(assert (= (and b!263856 (not res!128784)) b!263857))

(declare-fun m!280101 () Bool)

(assert (=> d!63491 m!280101))

(declare-fun m!280103 () Bool)

(assert (=> d!63491 m!280103))

(declare-fun m!280105 () Bool)

(assert (=> b!263857 m!280105))

(assert (=> b!263227 d!63491))

(declare-fun d!63493 () Bool)

(declare-fun e!170949 () Bool)

(assert (=> d!63493 e!170949))

(declare-fun res!128786 () Bool)

(assert (=> d!63493 (=> res!128786 e!170949)))

(declare-fun lt!133489 () Bool)

(assert (=> d!63493 (= res!128786 (not lt!133489))))

(declare-fun lt!133487 () Bool)

(assert (=> d!63493 (= lt!133489 lt!133487)))

(declare-fun lt!133486 () Unit!8136)

(declare-fun e!170950 () Unit!8136)

(assert (=> d!63493 (= lt!133486 e!170950)))

(declare-fun c!45089 () Bool)

(assert (=> d!63493 (= c!45089 lt!133487)))

(assert (=> d!63493 (= lt!133487 (containsKey!310 (toList!1927 lt!133117) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63493 (= (contains!1889 lt!133117 #b1000000000000000000000000000000000000000000000000000000000000000) lt!133489)))

(declare-fun b!263858 () Bool)

(declare-fun lt!133488 () Unit!8136)

(assert (=> b!263858 (= e!170950 lt!133488)))

(assert (=> b!263858 (= lt!133488 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133117) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263858 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133117) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263859 () Bool)

(declare-fun Unit!8182 () Unit!8136)

(assert (=> b!263859 (= e!170950 Unit!8182)))

(declare-fun b!263860 () Bool)

(assert (=> b!263860 (= e!170949 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133117) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63493 c!45089) b!263858))

(assert (= (and d!63493 (not c!45089)) b!263859))

(assert (= (and d!63493 (not res!128786)) b!263860))

(declare-fun m!280107 () Bool)

(assert (=> d!63493 m!280107))

(declare-fun m!280109 () Bool)

(assert (=> b!263858 m!280109))

(declare-fun m!280111 () Bool)

(assert (=> b!263858 m!280111))

(assert (=> b!263858 m!280111))

(declare-fun m!280113 () Bool)

(assert (=> b!263858 m!280113))

(assert (=> b!263860 m!280111))

(assert (=> b!263860 m!280111))

(assert (=> b!263860 m!280113))

(assert (=> bm!25176 d!63493))

(assert (=> b!263181 d!63133))

(declare-fun d!63495 () Bool)

(assert (=> d!63495 (= (size!6349 thiss!1504) (bvadd (_size!1983 thiss!1504) (bvsdiv (bvadd (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!263543 d!63495))

(declare-fun d!63497 () Bool)

(declare-fun e!170951 () Bool)

(assert (=> d!63497 e!170951))

(declare-fun res!128787 () Bool)

(assert (=> d!63497 (=> res!128787 e!170951)))

(declare-fun lt!133493 () Bool)

(assert (=> d!63497 (= res!128787 (not lt!133493))))

(declare-fun lt!133491 () Bool)

(assert (=> d!63497 (= lt!133493 lt!133491)))

(declare-fun lt!133490 () Unit!8136)

(declare-fun e!170952 () Unit!8136)

(assert (=> d!63497 (= lt!133490 e!170952)))

(declare-fun c!45090 () Bool)

(assert (=> d!63497 (= c!45090 lt!133491)))

(assert (=> d!63497 (= lt!133491 (containsKey!310 (toList!1927 lt!133214) (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63497 (= (contains!1889 lt!133214 (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) lt!133493)))

(declare-fun b!263861 () Bool)

(declare-fun lt!133492 () Unit!8136)

(assert (=> b!263861 (= e!170952 lt!133492)))

(assert (=> b!263861 (= lt!133492 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133214) (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))))

(assert (=> b!263861 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133214) (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!263862 () Bool)

(declare-fun Unit!8183 () Unit!8136)

(assert (=> b!263862 (= e!170952 Unit!8183)))

(declare-fun b!263863 () Bool)

(assert (=> b!263863 (= e!170951 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133214) (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!63497 c!45090) b!263861))

(assert (= (and d!63497 (not c!45090)) b!263862))

(assert (= (and d!63497 (not res!128787)) b!263863))

(declare-fun m!280115 () Bool)

(assert (=> d!63497 m!280115))

(declare-fun m!280117 () Bool)

(assert (=> b!263861 m!280117))

(assert (=> b!263861 m!279145))

(assert (=> b!263861 m!279145))

(declare-fun m!280119 () Bool)

(assert (=> b!263861 m!280119))

(assert (=> b!263863 m!279145))

(assert (=> b!263863 m!279145))

(assert (=> b!263863 m!280119))

(assert (=> d!63103 d!63497))

(declare-fun b!263865 () Bool)

(declare-fun e!170953 () Option!324)

(declare-fun e!170954 () Option!324)

(assert (=> b!263865 (= e!170953 e!170954)))

(declare-fun c!45092 () Bool)

(assert (=> b!263865 (= c!45092 (and ((_ is Cons!3813) lt!133213) (not (= (_1!2471 (h!4479 lt!133213)) (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))))))

(declare-fun b!263867 () Bool)

(assert (=> b!263867 (= e!170954 None!322)))

(declare-fun c!45091 () Bool)

(declare-fun d!63499 () Bool)

(assert (=> d!63499 (= c!45091 (and ((_ is Cons!3813) lt!133213) (= (_1!2471 (h!4479 lt!133213)) (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63499 (= (getValueByKey!318 lt!133213 (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) e!170953)))

(declare-fun b!263864 () Bool)

(assert (=> b!263864 (= e!170953 (Some!323 (_2!2471 (h!4479 lt!133213))))))

(declare-fun b!263866 () Bool)

(assert (=> b!263866 (= e!170954 (getValueByKey!318 (t!8885 lt!133213) (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))))

(assert (= (and d!63499 c!45091) b!263864))

(assert (= (and d!63499 (not c!45091)) b!263865))

(assert (= (and b!263865 c!45092) b!263866))

(assert (= (and b!263865 (not c!45092)) b!263867))

(declare-fun m!280121 () Bool)

(assert (=> b!263866 m!280121))

(assert (=> d!63103 d!63499))

(declare-fun d!63501 () Bool)

(assert (=> d!63501 (= (getValueByKey!318 lt!133213 (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133494 () Unit!8136)

(assert (=> d!63501 (= lt!133494 (choose!1303 lt!133213 (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))))

(declare-fun e!170955 () Bool)

(assert (=> d!63501 e!170955))

(declare-fun res!128788 () Bool)

(assert (=> d!63501 (=> (not res!128788) (not e!170955))))

(assert (=> d!63501 (= res!128788 (isStrictlySorted!372 lt!133213))))

(assert (=> d!63501 (= (lemmaContainsTupThenGetReturnValue!177 lt!133213 (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) lt!133494)))

(declare-fun b!263868 () Bool)

(declare-fun res!128789 () Bool)

(assert (=> b!263868 (=> (not res!128789) (not e!170955))))

(assert (=> b!263868 (= res!128789 (containsKey!310 lt!133213 (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!263869 () Bool)

(assert (=> b!263869 (= e!170955 (contains!1893 lt!133213 (tuple2!4921 (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!63501 res!128788) b!263868))

(assert (= (and b!263868 res!128789) b!263869))

(assert (=> d!63501 m!279139))

(declare-fun m!280123 () Bool)

(assert (=> d!63501 m!280123))

(declare-fun m!280125 () Bool)

(assert (=> d!63501 m!280125))

(declare-fun m!280127 () Bool)

(assert (=> b!263868 m!280127))

(declare-fun m!280129 () Bool)

(assert (=> b!263869 m!280129))

(assert (=> d!63103 d!63501))

(declare-fun b!263870 () Bool)

(declare-fun e!170957 () List!3817)

(declare-fun call!25242 () List!3817)

(assert (=> b!263870 (= e!170957 call!25242)))

(declare-fun b!263871 () Bool)

(declare-fun e!170959 () List!3817)

(declare-fun call!25243 () List!3817)

(assert (=> b!263871 (= e!170959 call!25243)))

(declare-fun b!263872 () Bool)

(declare-fun c!45095 () Bool)

(declare-fun e!170960 () List!3817)

(declare-fun c!45094 () Bool)

(assert (=> b!263872 (= e!170960 (ite c!45095 (t!8885 (toList!1927 lt!132977)) (ite c!45094 (Cons!3813 (h!4479 (toList!1927 lt!132977)) (t!8885 (toList!1927 lt!132977))) Nil!3814)))))

(declare-fun b!263873 () Bool)

(declare-fun lt!133495 () List!3817)

(declare-fun e!170956 () Bool)

(assert (=> b!263873 (= e!170956 (contains!1893 lt!133495 (tuple2!4921 (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))))))

(declare-fun bm!25239 () Bool)

(declare-fun call!25244 () List!3817)

(assert (=> bm!25239 (= call!25244 call!25242)))

(declare-fun b!263874 () Bool)

(declare-fun res!128791 () Bool)

(assert (=> b!263874 (=> (not res!128791) (not e!170956))))

(assert (=> b!263874 (= res!128791 (containsKey!310 lt!133495 (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!263875 () Bool)

(assert (=> b!263875 (= e!170959 call!25243)))

(declare-fun b!263876 () Bool)

(assert (=> b!263876 (= e!170960 (insertStrictlySorted!180 (t!8885 (toList!1927 lt!132977)) (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))))

(declare-fun d!63503 () Bool)

(assert (=> d!63503 e!170956))

(declare-fun res!128790 () Bool)

(assert (=> d!63503 (=> (not res!128790) (not e!170956))))

(assert (=> d!63503 (= res!128790 (isStrictlySorted!372 lt!133495))))

(assert (=> d!63503 (= lt!133495 e!170957)))

(declare-fun c!45096 () Bool)

(assert (=> d!63503 (= c!45096 (and ((_ is Cons!3813) (toList!1927 lt!132977)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!132977))) (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63503 (isStrictlySorted!372 (toList!1927 lt!132977))))

(assert (=> d!63503 (= (insertStrictlySorted!180 (toList!1927 lt!132977) (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) lt!133495)))

(declare-fun b!263877 () Bool)

(assert (=> b!263877 (= c!45094 (and ((_ is Cons!3813) (toList!1927 lt!132977)) (bvsgt (_1!2471 (h!4479 (toList!1927 lt!132977))) (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))))))

(declare-fun e!170958 () List!3817)

(assert (=> b!263877 (= e!170958 e!170959)))

(declare-fun bm!25240 () Bool)

(assert (=> bm!25240 (= call!25242 ($colon$colon!107 e!170960 (ite c!45096 (h!4479 (toList!1927 lt!132977)) (tuple2!4921 (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))))))

(declare-fun c!45093 () Bool)

(assert (=> bm!25240 (= c!45093 c!45096)))

(declare-fun bm!25241 () Bool)

(assert (=> bm!25241 (= call!25243 call!25244)))

(declare-fun b!263878 () Bool)

(assert (=> b!263878 (= e!170958 call!25244)))

(declare-fun b!263879 () Bool)

(assert (=> b!263879 (= e!170957 e!170958)))

(assert (=> b!263879 (= c!45095 (and ((_ is Cons!3813) (toList!1927 lt!132977)) (= (_1!2471 (h!4479 (toList!1927 lt!132977))) (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!63503 c!45096) b!263870))

(assert (= (and d!63503 (not c!45096)) b!263879))

(assert (= (and b!263879 c!45095) b!263878))

(assert (= (and b!263879 (not c!45095)) b!263877))

(assert (= (and b!263877 c!45094) b!263875))

(assert (= (and b!263877 (not c!45094)) b!263871))

(assert (= (or b!263875 b!263871) bm!25241))

(assert (= (or b!263878 bm!25241) bm!25239))

(assert (= (or b!263870 bm!25239) bm!25240))

(assert (= (and bm!25240 c!45093) b!263876))

(assert (= (and bm!25240 (not c!45093)) b!263872))

(assert (= (and d!63503 res!128790) b!263874))

(assert (= (and b!263874 res!128791) b!263873))

(declare-fun m!280131 () Bool)

(assert (=> b!263876 m!280131))

(declare-fun m!280133 () Bool)

(assert (=> bm!25240 m!280133))

(declare-fun m!280135 () Bool)

(assert (=> b!263873 m!280135))

(declare-fun m!280137 () Bool)

(assert (=> b!263874 m!280137))

(declare-fun m!280139 () Bool)

(assert (=> d!63503 m!280139))

(declare-fun m!280141 () Bool)

(assert (=> d!63503 m!280141))

(assert (=> d!63103 d!63503))

(declare-fun b!263881 () Bool)

(declare-fun e!170964 () Bool)

(declare-fun call!25245 () Bool)

(assert (=> b!263881 (= e!170964 call!25245)))

(declare-fun b!263882 () Bool)

(declare-fun e!170963 () Bool)

(declare-fun e!170961 () Bool)

(assert (=> b!263882 (= e!170963 e!170961)))

(declare-fun res!128794 () Bool)

(assert (=> b!263882 (=> (not res!128794) (not e!170961))))

(declare-fun e!170962 () Bool)

(assert (=> b!263882 (= res!128794 (not e!170962))))

(declare-fun res!128793 () Bool)

(assert (=> b!263882 (=> (not res!128793) (not e!170962))))

(assert (=> b!263882 (= res!128793 (validKeyInArray!0 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun c!45097 () Bool)

(declare-fun bm!25242 () Bool)

(assert (=> bm!25242 (= call!25245 (arrayNoDuplicates!0 lt!132768 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!45097 (Cons!3814 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!44945 (Cons!3814 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44834 (Cons!3814 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) Nil!3815) Nil!3815)) (ite c!44834 (Cons!3814 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) Nil!3815) Nil!3815))) (ite c!44945 (Cons!3814 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44834 (Cons!3814 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) Nil!3815) Nil!3815)) (ite c!44834 (Cons!3814 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) Nil!3815) Nil!3815)))))))

(declare-fun b!263883 () Bool)

(assert (=> b!263883 (= e!170964 call!25245)))

(declare-fun b!263884 () Bool)

(assert (=> b!263884 (= e!170961 e!170964)))

(assert (=> b!263884 (= c!45097 (validKeyInArray!0 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!263880 () Bool)

(assert (=> b!263880 (= e!170962 (contains!1892 (ite c!44945 (Cons!3814 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44834 (Cons!3814 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) Nil!3815) Nil!3815)) (ite c!44834 (Cons!3814 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) Nil!3815) Nil!3815)) (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!63505 () Bool)

(declare-fun res!128792 () Bool)

(assert (=> d!63505 (=> res!128792 e!170963)))

(assert (=> d!63505 (= res!128792 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6344 lt!132768)))))

(assert (=> d!63505 (= (arrayNoDuplicates!0 lt!132768 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!44945 (Cons!3814 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44834 (Cons!3814 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) Nil!3815) Nil!3815)) (ite c!44834 (Cons!3814 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) Nil!3815) Nil!3815))) e!170963)))

(assert (= (and d!63505 (not res!128792)) b!263882))

(assert (= (and b!263882 res!128793) b!263880))

(assert (= (and b!263882 res!128794) b!263884))

(assert (= (and b!263884 c!45097) b!263883))

(assert (= (and b!263884 (not c!45097)) b!263881))

(assert (= (or b!263883 b!263881) bm!25242))

(declare-fun m!280143 () Bool)

(assert (=> b!263882 m!280143))

(assert (=> b!263882 m!280143))

(declare-fun m!280145 () Bool)

(assert (=> b!263882 m!280145))

(assert (=> bm!25242 m!280143))

(declare-fun m!280147 () Bool)

(assert (=> bm!25242 m!280147))

(assert (=> b!263884 m!280143))

(assert (=> b!263884 m!280143))

(assert (=> b!263884 m!280145))

(assert (=> b!263880 m!280143))

(assert (=> b!263880 m!280143))

(declare-fun m!280149 () Bool)

(assert (=> b!263880 m!280149))

(assert (=> bm!25198 d!63505))

(declare-fun b!263885 () Bool)

(declare-fun e!170970 () Bool)

(declare-fun e!170968 () Bool)

(assert (=> b!263885 (= e!170970 e!170968)))

(assert (=> b!263885 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun res!128796 () Bool)

(declare-fun lt!133498 () ListLongMap!3823)

(assert (=> b!263885 (= res!128796 (contains!1889 lt!133498 (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!263885 (=> (not res!128796) (not e!170968))))

(declare-fun b!263886 () Bool)

(declare-fun e!170965 () Bool)

(assert (=> b!263886 (= e!170965 (= lt!133498 (getCurrentListMapNoExtraKeys!578 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504))))))

(declare-fun b!263887 () Bool)

(assert (=> b!263887 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(assert (=> b!263887 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6343 (_values!4825 thiss!1504))))))

(assert (=> b!263887 (= e!170968 (= (apply!262 lt!133498 (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!3087 (select (arr!5991 (_values!4825 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!263888 () Bool)

(declare-fun e!170967 () ListLongMap!3823)

(assert (=> b!263888 (= e!170967 (ListLongMap!3824 Nil!3814))))

(declare-fun b!263889 () Bool)

(assert (=> b!263889 (= e!170965 (isEmpty!545 lt!133498))))

(declare-fun b!263890 () Bool)

(assert (=> b!263890 (= e!170970 e!170965)))

(declare-fun c!45100 () Bool)

(assert (=> b!263890 (= c!45100 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun b!263891 () Bool)

(declare-fun res!128795 () Bool)

(declare-fun e!170971 () Bool)

(assert (=> b!263891 (=> (not res!128795) (not e!170971))))

(assert (=> b!263891 (= res!128795 (not (contains!1889 lt!133498 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263892 () Bool)

(declare-fun lt!133502 () Unit!8136)

(declare-fun lt!133500 () Unit!8136)

(assert (=> b!263892 (= lt!133502 lt!133500)))

(declare-fun lt!133497 () ListLongMap!3823)

(declare-fun lt!133499 () (_ BitVec 64))

(declare-fun lt!133496 () V!8521)

(declare-fun lt!133501 () (_ BitVec 64))

(assert (=> b!263892 (not (contains!1889 (+!713 lt!133497 (tuple2!4921 lt!133501 lt!133496)) lt!133499))))

(assert (=> b!263892 (= lt!133500 (addStillNotContains!130 lt!133497 lt!133501 lt!133496 lt!133499))))

(assert (=> b!263892 (= lt!133499 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!263892 (= lt!133496 (get!3087 (select (arr!5991 (_values!4825 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!263892 (= lt!133501 (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun call!25246 () ListLongMap!3823)

(assert (=> b!263892 (= lt!133497 call!25246)))

(declare-fun e!170966 () ListLongMap!3823)

(assert (=> b!263892 (= e!170966 (+!713 call!25246 (tuple2!4921 (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!3087 (select (arr!5991 (_values!4825 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!25243 () Bool)

(assert (=> bm!25243 (= call!25246 (getCurrentListMapNoExtraKeys!578 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504)))))

(declare-fun b!263893 () Bool)

(assert (=> b!263893 (= e!170971 e!170970)))

(declare-fun c!45099 () Bool)

(declare-fun e!170969 () Bool)

(assert (=> b!263893 (= c!45099 e!170969)))

(declare-fun res!128797 () Bool)

(assert (=> b!263893 (=> (not res!128797) (not e!170969))))

(assert (=> b!263893 (= res!128797 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun b!263894 () Bool)

(assert (=> b!263894 (= e!170969 (validKeyInArray!0 (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!263894 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!263895 () Bool)

(assert (=> b!263895 (= e!170966 call!25246)))

(declare-fun d!63507 () Bool)

(assert (=> d!63507 e!170971))

(declare-fun res!128798 () Bool)

(assert (=> d!63507 (=> (not res!128798) (not e!170971))))

(assert (=> d!63507 (= res!128798 (not (contains!1889 lt!133498 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63507 (= lt!133498 e!170967)))

(declare-fun c!45098 () Bool)

(assert (=> d!63507 (= c!45098 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(assert (=> d!63507 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!63507 (= (getCurrentListMapNoExtraKeys!578 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504)) lt!133498)))

(declare-fun b!263896 () Bool)

(assert (=> b!263896 (= e!170967 e!170966)))

(declare-fun c!45101 () Bool)

(assert (=> b!263896 (= c!45101 (validKeyInArray!0 (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!63507 c!45098) b!263888))

(assert (= (and d!63507 (not c!45098)) b!263896))

(assert (= (and b!263896 c!45101) b!263892))

(assert (= (and b!263896 (not c!45101)) b!263895))

(assert (= (or b!263892 b!263895) bm!25243))

(assert (= (and d!63507 res!128798) b!263891))

(assert (= (and b!263891 res!128795) b!263893))

(assert (= (and b!263893 res!128797) b!263894))

(assert (= (and b!263893 c!45099) b!263885))

(assert (= (and b!263893 (not c!45099)) b!263890))

(assert (= (and b!263885 res!128796) b!263887))

(assert (= (and b!263890 c!45100) b!263886))

(assert (= (and b!263890 (not c!45100)) b!263889))

(declare-fun b_lambda!8351 () Bool)

(assert (=> (not b_lambda!8351) (not b!263887)))

(assert (=> b!263887 t!8892))

(declare-fun b_and!13939 () Bool)

(assert (= b_and!13937 (and (=> t!8892 result!5425) b_and!13939)))

(declare-fun b_lambda!8353 () Bool)

(assert (=> (not b_lambda!8353) (not b!263892)))

(assert (=> b!263892 t!8892))

(declare-fun b_and!13941 () Bool)

(assert (= b_and!13939 (and (=> t!8892 result!5425) b_and!13941)))

(assert (=> b!263896 m!278805))

(assert (=> b!263896 m!278805))

(assert (=> b!263896 m!278807))

(assert (=> b!263887 m!278805))

(declare-fun m!280151 () Bool)

(assert (=> b!263887 m!280151))

(assert (=> b!263887 m!278569))

(assert (=> b!263887 m!278805))

(declare-fun m!280153 () Bool)

(assert (=> b!263887 m!280153))

(assert (=> b!263887 m!278569))

(declare-fun m!280155 () Bool)

(assert (=> b!263887 m!280155))

(assert (=> b!263887 m!280153))

(declare-fun m!280157 () Bool)

(assert (=> b!263886 m!280157))

(assert (=> b!263894 m!278805))

(assert (=> b!263894 m!278805))

(assert (=> b!263894 m!278807))

(declare-fun m!280159 () Bool)

(assert (=> b!263891 m!280159))

(assert (=> bm!25243 m!280157))

(declare-fun m!280161 () Bool)

(assert (=> d!63507 m!280161))

(assert (=> d!63507 m!278579))

(declare-fun m!280163 () Bool)

(assert (=> b!263889 m!280163))

(declare-fun m!280165 () Bool)

(assert (=> b!263892 m!280165))

(declare-fun m!280167 () Bool)

(assert (=> b!263892 m!280167))

(assert (=> b!263892 m!278569))

(assert (=> b!263892 m!280165))

(declare-fun m!280169 () Bool)

(assert (=> b!263892 m!280169))

(assert (=> b!263892 m!278805))

(assert (=> b!263892 m!280153))

(assert (=> b!263892 m!278569))

(assert (=> b!263892 m!280155))

(declare-fun m!280171 () Bool)

(assert (=> b!263892 m!280171))

(assert (=> b!263892 m!280153))

(assert (=> b!263885 m!278805))

(assert (=> b!263885 m!278805))

(declare-fun m!280173 () Bool)

(assert (=> b!263885 m!280173))

(assert (=> bm!25187 d!63507))

(assert (=> b!263343 d!63037))

(assert (=> d!63101 d!63099))

(assert (=> d!63101 d!63103))

(declare-fun d!63509 () Bool)

(assert (=> d!63509 (contains!1889 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))) lt!132970)))

(assert (=> d!63509 true))

(declare-fun _$35!420 () Unit!8136)

(assert (=> d!63509 (= (choose!1302 lt!132977 lt!132974 (zeroValue!4683 thiss!1504) lt!132970) _$35!420)))

(declare-fun bs!9283 () Bool)

(assert (= bs!9283 d!63509))

(assert (=> bs!9283 m!278537))

(assert (=> bs!9283 m!278537))

(assert (=> bs!9283 m!278547))

(assert (=> d!63101 d!63509))

(declare-fun d!63511 () Bool)

(declare-fun e!170972 () Bool)

(assert (=> d!63511 e!170972))

(declare-fun res!128799 () Bool)

(assert (=> d!63511 (=> res!128799 e!170972)))

(declare-fun lt!133506 () Bool)

(assert (=> d!63511 (= res!128799 (not lt!133506))))

(declare-fun lt!133504 () Bool)

(assert (=> d!63511 (= lt!133506 lt!133504)))

(declare-fun lt!133503 () Unit!8136)

(declare-fun e!170973 () Unit!8136)

(assert (=> d!63511 (= lt!133503 e!170973)))

(declare-fun c!45102 () Bool)

(assert (=> d!63511 (= c!45102 lt!133504)))

(assert (=> d!63511 (= lt!133504 (containsKey!310 (toList!1927 lt!132977) lt!132970))))

(assert (=> d!63511 (= (contains!1889 lt!132977 lt!132970) lt!133506)))

(declare-fun b!263898 () Bool)

(declare-fun lt!133505 () Unit!8136)

(assert (=> b!263898 (= e!170973 lt!133505)))

(assert (=> b!263898 (= lt!133505 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!132977) lt!132970))))

(assert (=> b!263898 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132977) lt!132970))))

(declare-fun b!263899 () Bool)

(declare-fun Unit!8184 () Unit!8136)

(assert (=> b!263899 (= e!170973 Unit!8184)))

(declare-fun b!263900 () Bool)

(assert (=> b!263900 (= e!170972 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132977) lt!132970)))))

(assert (= (and d!63511 c!45102) b!263898))

(assert (= (and d!63511 (not c!45102)) b!263899))

(assert (= (and d!63511 (not res!128799)) b!263900))

(declare-fun m!280175 () Bool)

(assert (=> d!63511 m!280175))

(declare-fun m!280177 () Bool)

(assert (=> b!263898 m!280177))

(declare-fun m!280179 () Bool)

(assert (=> b!263898 m!280179))

(assert (=> b!263898 m!280179))

(declare-fun m!280181 () Bool)

(assert (=> b!263898 m!280181))

(assert (=> b!263900 m!280179))

(assert (=> b!263900 m!280179))

(assert (=> b!263900 m!280181))

(assert (=> d!63101 d!63511))

(declare-fun b!263901 () Bool)

(declare-fun e!170975 () List!3817)

(declare-fun call!25247 () List!3817)

(assert (=> b!263901 (= e!170975 call!25247)))

(declare-fun b!263902 () Bool)

(declare-fun e!170977 () List!3817)

(declare-fun call!25248 () List!3817)

(assert (=> b!263902 (= e!170977 call!25248)))

(declare-fun e!170978 () List!3817)

(declare-fun c!45105 () Bool)

(declare-fun b!263903 () Bool)

(declare-fun c!45104 () Bool)

(assert (=> b!263903 (= e!170978 (ite c!45105 (t!8885 (t!8885 (toList!1927 lt!132763))) (ite c!45104 (Cons!3813 (h!4479 (t!8885 (toList!1927 lt!132763))) (t!8885 (t!8885 (toList!1927 lt!132763)))) Nil!3814)))))

(declare-fun b!263904 () Bool)

(declare-fun e!170974 () Bool)

(declare-fun lt!133507 () List!3817)

(assert (=> b!263904 (= e!170974 (contains!1893 lt!133507 (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))))))

(declare-fun bm!25244 () Bool)

(declare-fun call!25249 () List!3817)

(assert (=> bm!25244 (= call!25249 call!25247)))

(declare-fun b!263905 () Bool)

(declare-fun res!128801 () Bool)

(assert (=> b!263905 (=> (not res!128801) (not e!170974))))

(assert (=> b!263905 (= res!128801 (containsKey!310 lt!133507 (_1!2471 lt!132765)))))

(declare-fun b!263906 () Bool)

(assert (=> b!263906 (= e!170977 call!25248)))

(declare-fun b!263907 () Bool)

(assert (=> b!263907 (= e!170978 (insertStrictlySorted!180 (t!8885 (t!8885 (toList!1927 lt!132763))) (_1!2471 lt!132765) (_2!2471 lt!132765)))))

(declare-fun d!63513 () Bool)

(assert (=> d!63513 e!170974))

(declare-fun res!128800 () Bool)

(assert (=> d!63513 (=> (not res!128800) (not e!170974))))

(assert (=> d!63513 (= res!128800 (isStrictlySorted!372 lt!133507))))

(assert (=> d!63513 (= lt!133507 e!170975)))

(declare-fun c!45106 () Bool)

(assert (=> d!63513 (= c!45106 (and ((_ is Cons!3813) (t!8885 (toList!1927 lt!132763))) (bvslt (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132763)))) (_1!2471 lt!132765))))))

(assert (=> d!63513 (isStrictlySorted!372 (t!8885 (toList!1927 lt!132763)))))

(assert (=> d!63513 (= (insertStrictlySorted!180 (t!8885 (toList!1927 lt!132763)) (_1!2471 lt!132765) (_2!2471 lt!132765)) lt!133507)))

(declare-fun b!263908 () Bool)

(assert (=> b!263908 (= c!45104 (and ((_ is Cons!3813) (t!8885 (toList!1927 lt!132763))) (bvsgt (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132763)))) (_1!2471 lt!132765))))))

(declare-fun e!170976 () List!3817)

(assert (=> b!263908 (= e!170976 e!170977)))

(declare-fun bm!25245 () Bool)

(assert (=> bm!25245 (= call!25247 ($colon$colon!107 e!170978 (ite c!45106 (h!4479 (t!8885 (toList!1927 lt!132763))) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765)))))))

(declare-fun c!45103 () Bool)

(assert (=> bm!25245 (= c!45103 c!45106)))

(declare-fun bm!25246 () Bool)

(assert (=> bm!25246 (= call!25248 call!25249)))

(declare-fun b!263909 () Bool)

(assert (=> b!263909 (= e!170976 call!25249)))

(declare-fun b!263910 () Bool)

(assert (=> b!263910 (= e!170975 e!170976)))

(assert (=> b!263910 (= c!45105 (and ((_ is Cons!3813) (t!8885 (toList!1927 lt!132763))) (= (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132763)))) (_1!2471 lt!132765))))))

(assert (= (and d!63513 c!45106) b!263901))

(assert (= (and d!63513 (not c!45106)) b!263910))

(assert (= (and b!263910 c!45105) b!263909))

(assert (= (and b!263910 (not c!45105)) b!263908))

(assert (= (and b!263908 c!45104) b!263906))

(assert (= (and b!263908 (not c!45104)) b!263902))

(assert (= (or b!263906 b!263902) bm!25246))

(assert (= (or b!263909 bm!25246) bm!25244))

(assert (= (or b!263901 bm!25244) bm!25245))

(assert (= (and bm!25245 c!45103) b!263907))

(assert (= (and bm!25245 (not c!45103)) b!263903))

(assert (= (and d!63513 res!128800) b!263905))

(assert (= (and b!263905 res!128801) b!263904))

(declare-fun m!280183 () Bool)

(assert (=> b!263907 m!280183))

(declare-fun m!280185 () Bool)

(assert (=> bm!25245 m!280185))

(declare-fun m!280187 () Bool)

(assert (=> b!263904 m!280187))

(declare-fun m!280189 () Bool)

(assert (=> b!263905 m!280189))

(declare-fun m!280191 () Bool)

(assert (=> d!63513 m!280191))

(declare-fun m!280193 () Bool)

(assert (=> d!63513 m!280193))

(assert (=> b!263516 d!63513))

(declare-fun b!263911 () Bool)

(declare-fun e!170980 () (_ BitVec 32))

(declare-fun call!25250 () (_ BitVec 32))

(assert (=> b!263911 (= e!170980 call!25250)))

(declare-fun bm!25247 () Bool)

(assert (=> bm!25247 (= call!25250 (arrayCountValidKeys!0 lt!132768 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!263912 () Bool)

(declare-fun e!170979 () (_ BitVec 32))

(assert (=> b!263912 (= e!170979 e!170980)))

(declare-fun c!45108 () Bool)

(assert (=> b!263912 (= c!45108 (validKeyInArray!0 (select (arr!5992 lt!132768) (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!263913 () Bool)

(assert (=> b!263913 (= e!170979 #b00000000000000000000000000000000)))

(declare-fun b!263914 () Bool)

(assert (=> b!263914 (= e!170980 (bvadd #b00000000000000000000000000000001 call!25250))))

(declare-fun d!63515 () Bool)

(declare-fun lt!133508 () (_ BitVec 32))

(assert (=> d!63515 (and (bvsge lt!133508 #b00000000000000000000000000000000) (bvsle lt!133508 (bvsub (size!6344 lt!132768) (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!63515 (= lt!133508 e!170979)))

(declare-fun c!45107 () Bool)

(assert (=> d!63515 (= c!45107 (bvsge (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!63515 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) (bvsge (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6344 lt!132768)))))

(assert (=> d!63515 (= (arrayCountValidKeys!0 lt!132768 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) lt!133508)))

(assert (= (and d!63515 c!45107) b!263913))

(assert (= (and d!63515 (not c!45107)) b!263912))

(assert (= (and b!263912 c!45108) b!263914))

(assert (= (and b!263912 (not c!45108)) b!263911))

(assert (= (or b!263914 b!263911) bm!25247))

(declare-fun m!280195 () Bool)

(assert (=> bm!25247 m!280195))

(declare-fun m!280197 () Bool)

(assert (=> b!263912 m!280197))

(assert (=> b!263912 m!280197))

(declare-fun m!280199 () Bool)

(assert (=> b!263912 m!280199))

(assert (=> bm!25221 d!63515))

(declare-fun d!63517 () Bool)

(assert (=> d!63517 (= (get!3088 (getValueByKey!318 (toList!1927 (+!713 lt!132973 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))) lt!132975)) (v!5502 (getValueByKey!318 (toList!1927 (+!713 lt!132973 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))) lt!132975)))))

(assert (=> d!63117 d!63517))

(declare-fun b!263916 () Bool)

(declare-fun e!170981 () Option!324)

(declare-fun e!170982 () Option!324)

(assert (=> b!263916 (= e!170981 e!170982)))

(declare-fun c!45110 () Bool)

(assert (=> b!263916 (= c!45110 (and ((_ is Cons!3813) (toList!1927 (+!713 lt!132973 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))))) (not (= (_1!2471 (h!4479 (toList!1927 (+!713 lt!132973 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))))) lt!132975))))))

(declare-fun b!263918 () Bool)

(assert (=> b!263918 (= e!170982 None!322)))

(declare-fun c!45109 () Bool)

(declare-fun d!63519 () Bool)

(assert (=> d!63519 (= c!45109 (and ((_ is Cons!3813) (toList!1927 (+!713 lt!132973 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))))) (= (_1!2471 (h!4479 (toList!1927 (+!713 lt!132973 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))))) lt!132975)))))

(assert (=> d!63519 (= (getValueByKey!318 (toList!1927 (+!713 lt!132973 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504)))) lt!132975) e!170981)))

(declare-fun b!263915 () Bool)

(assert (=> b!263915 (= e!170981 (Some!323 (_2!2471 (h!4479 (toList!1927 (+!713 lt!132973 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))))))))))

(declare-fun b!263917 () Bool)

(assert (=> b!263917 (= e!170982 (getValueByKey!318 (t!8885 (toList!1927 (+!713 lt!132973 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))))) lt!132975))))

(assert (= (and d!63519 c!45109) b!263915))

(assert (= (and d!63519 (not c!45109)) b!263916))

(assert (= (and b!263916 c!45110) b!263917))

(assert (= (and b!263916 (not c!45110)) b!263918))

(declare-fun m!280201 () Bool)

(assert (=> b!263917 m!280201))

(assert (=> d!63117 d!63519))

(declare-fun d!63521 () Bool)

(declare-fun c!45113 () Bool)

(assert (=> d!63521 (= c!45113 ((_ is Nil!3814) (toList!1927 lt!133021)))))

(declare-fun e!170985 () (InoxSet tuple2!4920))

(assert (=> d!63521 (= (content!176 (toList!1927 lt!133021)) e!170985)))

(declare-fun b!263923 () Bool)

(assert (=> b!263923 (= e!170985 ((as const (Array tuple2!4920 Bool)) false))))

(declare-fun b!263924 () Bool)

(assert (=> b!263924 (= e!170985 ((_ map or) (store ((as const (Array tuple2!4920 Bool)) false) (h!4479 (toList!1927 lt!133021)) true) (content!176 (t!8885 (toList!1927 lt!133021)))))))

(assert (= (and d!63521 c!45113) b!263923))

(assert (= (and d!63521 (not c!45113)) b!263924))

(declare-fun m!280203 () Bool)

(assert (=> b!263924 m!280203))

(assert (=> b!263924 m!280095))

(assert (=> d!63009 d!63521))

(declare-fun b!263925 () Bool)

(declare-fun e!170987 () (_ BitVec 32))

(declare-fun call!25251 () (_ BitVec 32))

(assert (=> b!263925 (= e!170987 call!25251)))

(declare-fun bm!25248 () Bool)

(assert (=> bm!25248 (= call!25251 (arrayCountValidKeys!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun b!263926 () Bool)

(declare-fun e!170986 () (_ BitVec 32))

(assert (=> b!263926 (= e!170986 e!170987)))

(declare-fun c!45115 () Bool)

(assert (=> b!263926 (= c!45115 (validKeyInArray!0 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263927 () Bool)

(assert (=> b!263927 (= e!170986 #b00000000000000000000000000000000)))

(declare-fun b!263928 () Bool)

(assert (=> b!263928 (= e!170987 (bvadd #b00000000000000000000000000000001 call!25251))))

(declare-fun lt!133509 () (_ BitVec 32))

(declare-fun d!63523 () Bool)

(assert (=> d!63523 (and (bvsge lt!133509 #b00000000000000000000000000000000) (bvsle lt!133509 (bvsub (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!63523 (= lt!133509 e!170986)))

(declare-fun c!45114 () Bool)

(assert (=> d!63523 (= c!45114 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(assert (=> d!63523 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6344 (_keys!7033 thiss!1504)) (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))))

(assert (=> d!63523 (= (arrayCountValidKeys!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))) lt!133509)))

(assert (= (and d!63523 c!45114) b!263927))

(assert (= (and d!63523 (not c!45114)) b!263926))

(assert (= (and b!263926 c!45115) b!263928))

(assert (= (and b!263926 (not c!45115)) b!263925))

(assert (= (or b!263928 b!263925) bm!25248))

(declare-fun m!280205 () Bool)

(assert (=> bm!25248 m!280205))

(declare-fun m!280207 () Bool)

(assert (=> b!263926 m!280207))

(assert (=> b!263926 m!280207))

(declare-fun m!280209 () Bool)

(assert (=> b!263926 m!280209))

(assert (=> bm!25197 d!63523))

(declare-fun d!63525 () Bool)

(declare-fun e!170988 () Bool)

(assert (=> d!63525 e!170988))

(declare-fun res!128802 () Bool)

(assert (=> d!63525 (=> res!128802 e!170988)))

(declare-fun lt!133513 () Bool)

(assert (=> d!63525 (= res!128802 (not lt!133513))))

(declare-fun lt!133511 () Bool)

(assert (=> d!63525 (= lt!133513 lt!133511)))

(declare-fun lt!133510 () Unit!8136)

(declare-fun e!170989 () Unit!8136)

(assert (=> d!63525 (= lt!133510 e!170989)))

(declare-fun c!45116 () Bool)

(assert (=> d!63525 (= c!45116 lt!133511)))

(assert (=> d!63525 (= lt!133511 (containsKey!310 (toList!1927 lt!133224) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!63525 (= (contains!1889 lt!133224 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)) lt!133513)))

(declare-fun b!263929 () Bool)

(declare-fun lt!133512 () Unit!8136)

(assert (=> b!263929 (= e!170989 lt!133512)))

(assert (=> b!263929 (= lt!133512 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133224) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!263929 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133224) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263930 () Bool)

(declare-fun Unit!8185 () Unit!8136)

(assert (=> b!263930 (= e!170989 Unit!8185)))

(declare-fun b!263931 () Bool)

(assert (=> b!263931 (= e!170988 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133224) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!63525 c!45116) b!263929))

(assert (= (and d!63525 (not c!45116)) b!263930))

(assert (= (and d!63525 (not res!128802)) b!263931))

(assert (=> d!63525 m!278517))

(declare-fun m!280211 () Bool)

(assert (=> d!63525 m!280211))

(assert (=> b!263929 m!278517))

(declare-fun m!280213 () Bool)

(assert (=> b!263929 m!280213))

(assert (=> b!263929 m!278517))

(declare-fun m!280215 () Bool)

(assert (=> b!263929 m!280215))

(assert (=> b!263929 m!280215))

(declare-fun m!280217 () Bool)

(assert (=> b!263929 m!280217))

(assert (=> b!263931 m!278517))

(assert (=> b!263931 m!280215))

(assert (=> b!263931 m!280215))

(assert (=> b!263931 m!280217))

(assert (=> b!263291 d!63525))

(declare-fun d!63527 () Bool)

(declare-fun res!128807 () Bool)

(declare-fun e!170994 () Bool)

(assert (=> d!63527 (=> res!128807 e!170994)))

(assert (=> d!63527 (= res!128807 (or ((_ is Nil!3814) lt!133324) ((_ is Nil!3814) (t!8885 lt!133324))))))

(assert (=> d!63527 (= (isStrictlySorted!372 lt!133324) e!170994)))

(declare-fun b!263936 () Bool)

(declare-fun e!170995 () Bool)

(assert (=> b!263936 (= e!170994 e!170995)))

(declare-fun res!128808 () Bool)

(assert (=> b!263936 (=> (not res!128808) (not e!170995))))

(assert (=> b!263936 (= res!128808 (bvslt (_1!2471 (h!4479 lt!133324)) (_1!2471 (h!4479 (t!8885 lt!133324)))))))

(declare-fun b!263937 () Bool)

(assert (=> b!263937 (= e!170995 (isStrictlySorted!372 (t!8885 lt!133324)))))

(assert (= (and d!63527 (not res!128807)) b!263936))

(assert (= (and b!263936 res!128808) b!263937))

(declare-fun m!280219 () Bool)

(assert (=> b!263937 m!280219))

(assert (=> d!63207 d!63527))

(declare-fun d!63529 () Bool)

(declare-fun res!128809 () Bool)

(declare-fun e!170996 () Bool)

(assert (=> d!63529 (=> res!128809 e!170996)))

(assert (=> d!63529 (= res!128809 (or ((_ is Nil!3814) (toList!1927 lt!132763)) ((_ is Nil!3814) (t!8885 (toList!1927 lt!132763)))))))

(assert (=> d!63529 (= (isStrictlySorted!372 (toList!1927 lt!132763)) e!170996)))

(declare-fun b!263938 () Bool)

(declare-fun e!170997 () Bool)

(assert (=> b!263938 (= e!170996 e!170997)))

(declare-fun res!128810 () Bool)

(assert (=> b!263938 (=> (not res!128810) (not e!170997))))

(assert (=> b!263938 (= res!128810 (bvslt (_1!2471 (h!4479 (toList!1927 lt!132763))) (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132763))))))))

(declare-fun b!263939 () Bool)

(assert (=> b!263939 (= e!170997 (isStrictlySorted!372 (t!8885 (toList!1927 lt!132763))))))

(assert (= (and d!63529 (not res!128809)) b!263938))

(assert (= (and b!263938 res!128810) b!263939))

(assert (=> b!263939 m!280193))

(assert (=> d!63207 d!63529))

(assert (=> b!263432 d!63327))

(declare-fun d!63531 () Bool)

(declare-fun lt!133514 () Bool)

(assert (=> d!63531 (= lt!133514 (select (content!176 lt!133072) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))))))

(declare-fun e!170999 () Bool)

(assert (=> d!63531 (= lt!133514 e!170999)))

(declare-fun res!128812 () Bool)

(assert (=> d!63531 (=> (not res!128812) (not e!170999))))

(assert (=> d!63531 (= res!128812 ((_ is Cons!3813) lt!133072))))

(assert (=> d!63531 (= (contains!1893 lt!133072 (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))) lt!133514)))

(declare-fun b!263940 () Bool)

(declare-fun e!170998 () Bool)

(assert (=> b!263940 (= e!170999 e!170998)))

(declare-fun res!128811 () Bool)

(assert (=> b!263940 (=> res!128811 e!170998)))

(assert (=> b!263940 (= res!128811 (= (h!4479 lt!133072) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))))))

(declare-fun b!263941 () Bool)

(assert (=> b!263941 (= e!170998 (contains!1893 (t!8885 lt!133072) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))))))

(assert (= (and d!63531 res!128812) b!263940))

(assert (= (and b!263940 (not res!128811)) b!263941))

(declare-fun m!280221 () Bool)

(assert (=> d!63531 m!280221))

(declare-fun m!280223 () Bool)

(assert (=> d!63531 m!280223))

(declare-fun m!280225 () Bool)

(assert (=> b!263941 m!280225))

(assert (=> b!263531 d!63531))

(declare-fun d!63533 () Bool)

(assert (=> d!63533 (= (get!3090 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263557 d!63533))

(declare-fun b!263943 () Bool)

(declare-fun e!171000 () Option!324)

(declare-fun e!171001 () Option!324)

(assert (=> b!263943 (= e!171000 e!171001)))

(declare-fun c!45118 () Bool)

(assert (=> b!263943 (= c!45118 (and ((_ is Cons!3813) (toList!1927 lt!133214)) (not (= (_1!2471 (h!4479 (toList!1927 lt!133214))) (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))))))

(declare-fun b!263945 () Bool)

(assert (=> b!263945 (= e!171001 None!322)))

(declare-fun c!45117 () Bool)

(declare-fun d!63535 () Bool)

(assert (=> d!63535 (= c!45117 (and ((_ is Cons!3813) (toList!1927 lt!133214)) (= (_1!2471 (h!4479 (toList!1927 lt!133214))) (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63535 (= (getValueByKey!318 (toList!1927 lt!133214) (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) e!171000)))

(declare-fun b!263942 () Bool)

(assert (=> b!263942 (= e!171000 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!133214)))))))

(declare-fun b!263944 () Bool)

(assert (=> b!263944 (= e!171001 (getValueByKey!318 (t!8885 (toList!1927 lt!133214)) (_1!2471 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))))

(assert (= (and d!63535 c!45117) b!263942))

(assert (= (and d!63535 (not c!45117)) b!263943))

(assert (= (and b!263943 c!45118) b!263944))

(assert (= (and b!263943 (not c!45118)) b!263945))

(declare-fun m!280227 () Bool)

(assert (=> b!263944 m!280227))

(assert (=> b!263286 d!63535))

(declare-fun d!63537 () Bool)

(assert (=> d!63537 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133003) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(declare-fun lt!133515 () Unit!8136)

(assert (=> d!63537 (= lt!133515 (choose!1300 (toList!1927 lt!133003) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(declare-fun e!171002 () Bool)

(assert (=> d!63537 e!171002))

(declare-fun res!128813 () Bool)

(assert (=> d!63537 (=> (not res!128813) (not e!171002))))

(assert (=> d!63537 (= res!128813 (isStrictlySorted!372 (toList!1927 lt!133003)))))

(assert (=> d!63537 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133003) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)) lt!133515)))

(declare-fun b!263946 () Bool)

(assert (=> b!263946 (= e!171002 (containsKey!310 (toList!1927 lt!133003) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(assert (= (and d!63537 res!128813) b!263946))

(assert (=> d!63537 m!278587))

(assert (=> d!63537 m!278939))

(assert (=> d!63537 m!278939))

(assert (=> d!63537 m!278941))

(assert (=> d!63537 m!278587))

(declare-fun m!280229 () Bool)

(assert (=> d!63537 m!280229))

(declare-fun m!280231 () Bool)

(assert (=> d!63537 m!280231))

(assert (=> b!263946 m!278587))

(assert (=> b!263946 m!278935))

(assert (=> b!263205 d!63537))

(declare-fun d!63539 () Bool)

(assert (=> d!63539 (= (isDefined!260 (getValueByKey!318 (toList!1927 lt!133003) (select (arr!5992 lt!132768) #b00000000000000000000000000000000))) (not (isEmpty!544 (getValueByKey!318 (toList!1927 lt!133003) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))))

(declare-fun bs!9284 () Bool)

(assert (= bs!9284 d!63539))

(assert (=> bs!9284 m!278939))

(declare-fun m!280233 () Bool)

(assert (=> bs!9284 m!280233))

(assert (=> b!263205 d!63539))

(assert (=> b!263205 d!63311))

(declare-fun d!63541 () Bool)

(assert (=> d!63541 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132981) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!133516 () Unit!8136)

(assert (=> d!63541 (= lt!133516 (choose!1300 (toList!1927 lt!132981) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171003 () Bool)

(assert (=> d!63541 e!171003))

(declare-fun res!128814 () Bool)

(assert (=> d!63541 (=> (not res!128814) (not e!171003))))

(assert (=> d!63541 (= res!128814 (isStrictlySorted!372 (toList!1927 lt!132981)))))

(assert (=> d!63541 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!132981) #b1000000000000000000000000000000000000000000000000000000000000000) lt!133516)))

(declare-fun b!263947 () Bool)

(assert (=> b!263947 (= e!171003 (containsKey!310 (toList!1927 lt!132981) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63541 res!128814) b!263947))

(assert (=> d!63541 m!279205))

(assert (=> d!63541 m!279205))

(assert (=> d!63541 m!279333))

(declare-fun m!280235 () Bool)

(assert (=> d!63541 m!280235))

(assert (=> d!63541 m!279945))

(assert (=> b!263947 m!279329))

(assert (=> b!263398 d!63541))

(declare-fun d!63543 () Bool)

(assert (=> d!63543 (= (isDefined!260 (getValueByKey!318 (toList!1927 lt!132981) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!544 (getValueByKey!318 (toList!1927 lt!132981) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!9285 () Bool)

(assert (= bs!9285 d!63543))

(assert (=> bs!9285 m!279205))

(declare-fun m!280237 () Bool)

(assert (=> bs!9285 m!280237))

(assert (=> b!263398 d!63543))

(assert (=> b!263398 d!63385))

(declare-fun d!63545 () Bool)

(declare-fun e!171004 () Bool)

(assert (=> d!63545 e!171004))

(declare-fun res!128815 () Bool)

(assert (=> d!63545 (=> res!128815 e!171004)))

(declare-fun lt!133520 () Bool)

(assert (=> d!63545 (= res!128815 (not lt!133520))))

(declare-fun lt!133518 () Bool)

(assert (=> d!63545 (= lt!133520 lt!133518)))

(declare-fun lt!133517 () Unit!8136)

(declare-fun e!171005 () Unit!8136)

(assert (=> d!63545 (= lt!133517 e!171005)))

(declare-fun c!45119 () Bool)

(assert (=> d!63545 (= c!45119 lt!133518)))

(assert (=> d!63545 (= lt!133518 (containsKey!310 (toList!1927 lt!133161) (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))))))

(assert (=> d!63545 (= (contains!1889 lt!133161 (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))) lt!133520)))

(declare-fun b!263948 () Bool)

(declare-fun lt!133519 () Unit!8136)

(assert (=> b!263948 (= e!171005 lt!133519)))

(assert (=> b!263948 (= lt!133519 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133161) (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))))))

(assert (=> b!263948 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133161) (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))))))

(declare-fun b!263949 () Bool)

(declare-fun Unit!8186 () Unit!8136)

(assert (=> b!263949 (= e!171005 Unit!8186)))

(declare-fun b!263950 () Bool)

(assert (=> b!263950 (= e!171004 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133161) (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63545 c!45119) b!263948))

(assert (= (and d!63545 (not c!45119)) b!263949))

(assert (= (and d!63545 (not res!128815)) b!263950))

(declare-fun m!280239 () Bool)

(assert (=> d!63545 m!280239))

(declare-fun m!280241 () Bool)

(assert (=> b!263948 m!280241))

(assert (=> b!263948 m!279013))

(assert (=> b!263948 m!279013))

(declare-fun m!280243 () Bool)

(assert (=> b!263948 m!280243))

(assert (=> b!263950 m!279013))

(assert (=> b!263950 m!279013))

(assert (=> b!263950 m!280243))

(assert (=> d!63067 d!63545))

(declare-fun b!263952 () Bool)

(declare-fun e!171006 () Option!324)

(declare-fun e!171007 () Option!324)

(assert (=> b!263952 (= e!171006 e!171007)))

(declare-fun c!45121 () Bool)

(assert (=> b!263952 (= c!45121 (and ((_ is Cons!3813) lt!133160) (not (= (_1!2471 (h!4479 lt!133160)) (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))))))))

(declare-fun b!263954 () Bool)

(assert (=> b!263954 (= e!171007 None!322)))

(declare-fun d!63547 () Bool)

(declare-fun c!45120 () Bool)

(assert (=> d!63547 (= c!45120 (and ((_ is Cons!3813) lt!133160) (= (_1!2471 (h!4479 lt!133160)) (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))))))))

(assert (=> d!63547 (= (getValueByKey!318 lt!133160 (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))) e!171006)))

(declare-fun b!263951 () Bool)

(assert (=> b!263951 (= e!171006 (Some!323 (_2!2471 (h!4479 lt!133160))))))

(declare-fun b!263953 () Bool)

(assert (=> b!263953 (= e!171007 (getValueByKey!318 (t!8885 lt!133160) (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63547 c!45120) b!263951))

(assert (= (and d!63547 (not c!45120)) b!263952))

(assert (= (and b!263952 c!45121) b!263953))

(assert (= (and b!263952 (not c!45121)) b!263954))

(declare-fun m!280245 () Bool)

(assert (=> b!263953 m!280245))

(assert (=> d!63067 d!63547))

(declare-fun d!63549 () Bool)

(assert (=> d!63549 (= (getValueByKey!318 lt!133160 (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133521 () Unit!8136)

(assert (=> d!63549 (= lt!133521 (choose!1303 lt!133160 (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))))))

(declare-fun e!171008 () Bool)

(assert (=> d!63549 e!171008))

(declare-fun res!128816 () Bool)

(assert (=> d!63549 (=> (not res!128816) (not e!171008))))

(assert (=> d!63549 (= res!128816 (isStrictlySorted!372 lt!133160))))

(assert (=> d!63549 (= (lemmaContainsTupThenGetReturnValue!177 lt!133160 (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))) lt!133521)))

(declare-fun b!263955 () Bool)

(declare-fun res!128817 () Bool)

(assert (=> b!263955 (=> (not res!128817) (not e!171008))))

(assert (=> b!263955 (= res!128817 (containsKey!310 lt!133160 (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))))))

(declare-fun b!263956 () Bool)

(assert (=> b!263956 (= e!171008 (contains!1893 lt!133160 (tuple2!4921 (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63549 res!128816) b!263955))

(assert (= (and b!263955 res!128817) b!263956))

(assert (=> d!63549 m!279007))

(declare-fun m!280247 () Bool)

(assert (=> d!63549 m!280247))

(declare-fun m!280249 () Bool)

(assert (=> d!63549 m!280249))

(declare-fun m!280251 () Bool)

(assert (=> b!263955 m!280251))

(declare-fun m!280253 () Bool)

(assert (=> b!263956 m!280253))

(assert (=> d!63067 d!63549))

(declare-fun b!263957 () Bool)

(declare-fun e!171010 () List!3817)

(declare-fun call!25252 () List!3817)

(assert (=> b!263957 (= e!171010 call!25252)))

(declare-fun b!263958 () Bool)

(declare-fun e!171012 () List!3817)

(declare-fun call!25253 () List!3817)

(assert (=> b!263958 (= e!171012 call!25253)))

(declare-fun b!263959 () Bool)

(declare-fun c!45123 () Bool)

(declare-fun e!171013 () List!3817)

(declare-fun c!45124 () Bool)

(assert (=> b!263959 (= e!171013 (ite c!45124 (t!8885 (toList!1927 lt!132995)) (ite c!45123 (Cons!3813 (h!4479 (toList!1927 lt!132995)) (t!8885 (toList!1927 lt!132995))) Nil!3814)))))

(declare-fun b!263960 () Bool)

(declare-fun lt!133522 () List!3817)

(declare-fun e!171009 () Bool)

(assert (=> b!263960 (= e!171009 (contains!1893 lt!133522 (tuple2!4921 (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))))))))

(declare-fun bm!25249 () Bool)

(declare-fun call!25254 () List!3817)

(assert (=> bm!25249 (= call!25254 call!25252)))

(declare-fun b!263961 () Bool)

(declare-fun res!128819 () Bool)

(assert (=> b!263961 (=> (not res!128819) (not e!171009))))

(assert (=> b!263961 (= res!128819 (containsKey!310 lt!133522 (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))))))

(declare-fun b!263962 () Bool)

(assert (=> b!263962 (= e!171012 call!25253)))

(declare-fun b!263963 () Bool)

(assert (=> b!263963 (= e!171013 (insertStrictlySorted!180 (t!8885 (toList!1927 lt!132995)) (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))))))

(declare-fun d!63551 () Bool)

(assert (=> d!63551 e!171009))

(declare-fun res!128818 () Bool)

(assert (=> d!63551 (=> (not res!128818) (not e!171009))))

(assert (=> d!63551 (= res!128818 (isStrictlySorted!372 lt!133522))))

(assert (=> d!63551 (= lt!133522 e!171010)))

(declare-fun c!45125 () Bool)

(assert (=> d!63551 (= c!45125 (and ((_ is Cons!3813) (toList!1927 lt!132995)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!132995))) (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))))))))

(assert (=> d!63551 (isStrictlySorted!372 (toList!1927 lt!132995))))

(assert (=> d!63551 (= (insertStrictlySorted!180 (toList!1927 lt!132995) (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))) lt!133522)))

(declare-fun b!263964 () Bool)

(assert (=> b!263964 (= c!45123 (and ((_ is Cons!3813) (toList!1927 lt!132995)) (bvsgt (_1!2471 (h!4479 (toList!1927 lt!132995))) (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))))))))

(declare-fun e!171011 () List!3817)

(assert (=> b!263964 (= e!171011 e!171012)))

(declare-fun bm!25250 () Bool)

(assert (=> bm!25250 (= call!25252 ($colon$colon!107 e!171013 (ite c!45125 (h!4479 (toList!1927 lt!132995)) (tuple2!4921 (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))))))))

(declare-fun c!45122 () Bool)

(assert (=> bm!25250 (= c!45122 c!45125)))

(declare-fun bm!25251 () Bool)

(assert (=> bm!25251 (= call!25253 call!25254)))

(declare-fun b!263965 () Bool)

(assert (=> b!263965 (= e!171011 call!25254)))

(declare-fun b!263966 () Bool)

(assert (=> b!263966 (= e!171010 e!171011)))

(assert (=> b!263966 (= c!45124 (and ((_ is Cons!3813) (toList!1927 lt!132995)) (= (_1!2471 (h!4479 (toList!1927 lt!132995))) (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63551 c!45125) b!263957))

(assert (= (and d!63551 (not c!45125)) b!263966))

(assert (= (and b!263966 c!45124) b!263965))

(assert (= (and b!263966 (not c!45124)) b!263964))

(assert (= (and b!263964 c!45123) b!263962))

(assert (= (and b!263964 (not c!45123)) b!263958))

(assert (= (or b!263962 b!263958) bm!25251))

(assert (= (or b!263965 bm!25251) bm!25249))

(assert (= (or b!263957 bm!25249) bm!25250))

(assert (= (and bm!25250 c!45122) b!263963))

(assert (= (and bm!25250 (not c!45122)) b!263959))

(assert (= (and d!63551 res!128818) b!263961))

(assert (= (and b!263961 res!128819) b!263960))

(declare-fun m!280255 () Bool)

(assert (=> b!263963 m!280255))

(declare-fun m!280257 () Bool)

(assert (=> bm!25250 m!280257))

(declare-fun m!280259 () Bool)

(assert (=> b!263960 m!280259))

(declare-fun m!280261 () Bool)

(assert (=> b!263961 m!280261))

(declare-fun m!280263 () Bool)

(assert (=> d!63551 m!280263))

(declare-fun m!280265 () Bool)

(assert (=> d!63551 m!280265))

(assert (=> d!63067 d!63551))

(assert (=> b!263274 d!63435))

(declare-fun b!263967 () Bool)

(declare-fun e!171015 () SeekEntryResult!1193)

(assert (=> b!263967 (= e!171015 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25234 lt!133282) #b00000000000000000000000000000001) (nextIndex!0 (index!6944 lt!133282) (x!25234 lt!133282) (mask!11207 thiss!1504)) (index!6944 lt!133282) (select (arr!5992 lt!132768) #b00000000000000000000000000000000) lt!132768 (mask!11207 thiss!1504)))))

(declare-fun b!263968 () Bool)

(assert (=> b!263968 (= e!171015 (MissingVacant!1193 (index!6944 lt!133282)))))

(declare-fun b!263969 () Bool)

(declare-fun c!45127 () Bool)

(declare-fun lt!133523 () (_ BitVec 64))

(assert (=> b!263969 (= c!45127 (= lt!133523 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171014 () SeekEntryResult!1193)

(assert (=> b!263969 (= e!171014 e!171015)))

(declare-fun d!63553 () Bool)

(declare-fun lt!133524 () SeekEntryResult!1193)

(assert (=> d!63553 (and (or ((_ is Undefined!1193) lt!133524) (not ((_ is Found!1193) lt!133524)) (and (bvsge (index!6943 lt!133524) #b00000000000000000000000000000000) (bvslt (index!6943 lt!133524) (size!6344 lt!132768)))) (or ((_ is Undefined!1193) lt!133524) ((_ is Found!1193) lt!133524) (not ((_ is MissingVacant!1193) lt!133524)) (not (= (index!6945 lt!133524) (index!6944 lt!133282))) (and (bvsge (index!6945 lt!133524) #b00000000000000000000000000000000) (bvslt (index!6945 lt!133524) (size!6344 lt!132768)))) (or ((_ is Undefined!1193) lt!133524) (ite ((_ is Found!1193) lt!133524) (= (select (arr!5992 lt!132768) (index!6943 lt!133524)) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!1193) lt!133524) (= (index!6945 lt!133524) (index!6944 lt!133282)) (= (select (arr!5992 lt!132768) (index!6945 lt!133524)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!171016 () SeekEntryResult!1193)

(assert (=> d!63553 (= lt!133524 e!171016)))

(declare-fun c!45128 () Bool)

(assert (=> d!63553 (= c!45128 (bvsge (x!25234 lt!133282) #b01111111111111111111111111111110))))

(assert (=> d!63553 (= lt!133523 (select (arr!5992 lt!132768) (index!6944 lt!133282)))))

(assert (=> d!63553 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!63553 (= (seekKeyOrZeroReturnVacant!0 (x!25234 lt!133282) (index!6944 lt!133282) (index!6944 lt!133282) (select (arr!5992 lt!132768) #b00000000000000000000000000000000) lt!132768 (mask!11207 thiss!1504)) lt!133524)))

(declare-fun b!263970 () Bool)

(assert (=> b!263970 (= e!171016 Undefined!1193)))

(declare-fun b!263971 () Bool)

(assert (=> b!263971 (= e!171016 e!171014)))

(declare-fun c!45126 () Bool)

(assert (=> b!263971 (= c!45126 (= lt!133523 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(declare-fun b!263972 () Bool)

(assert (=> b!263972 (= e!171014 (Found!1193 (index!6944 lt!133282)))))

(assert (= (and d!63553 c!45128) b!263970))

(assert (= (and d!63553 (not c!45128)) b!263971))

(assert (= (and b!263971 c!45126) b!263972))

(assert (= (and b!263971 (not c!45126)) b!263969))

(assert (= (and b!263969 c!45127) b!263968))

(assert (= (and b!263969 (not c!45127)) b!263967))

(declare-fun m!280267 () Bool)

(assert (=> b!263967 m!280267))

(assert (=> b!263967 m!280267))

(assert (=> b!263967 m!278587))

(declare-fun m!280269 () Bool)

(assert (=> b!263967 m!280269))

(declare-fun m!280271 () Bool)

(assert (=> d!63553 m!280271))

(declare-fun m!280273 () Bool)

(assert (=> d!63553 m!280273))

(assert (=> d!63553 m!279323))

(assert (=> d!63553 m!278579))

(assert (=> b!263391 d!63553))

(declare-fun d!63555 () Bool)

(declare-fun res!128820 () Bool)

(declare-fun e!171017 () Bool)

(assert (=> d!63555 (=> res!128820 e!171017)))

(assert (=> d!63555 (= res!128820 (= (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!63555 (= (arrayContainsKey!0 lt!132768 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) e!171017)))

(declare-fun b!263973 () Bool)

(declare-fun e!171018 () Bool)

(assert (=> b!263973 (= e!171017 e!171018)))

(declare-fun res!128821 () Bool)

(assert (=> b!263973 (=> (not res!128821) (not e!171018))))

(assert (=> b!263973 (= res!128821 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6344 lt!132768)))))

(declare-fun b!263974 () Bool)

(assert (=> b!263974 (= e!171018 (arrayContainsKey!0 lt!132768 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!63555 (not res!128820)) b!263973))

(assert (= (and b!263973 res!128821) b!263974))

(assert (=> d!63555 m!280143))

(declare-fun m!280275 () Bool)

(assert (=> b!263974 m!280275))

(assert (=> b!263476 d!63555))

(assert (=> d!63113 d!63089))

(declare-fun d!63557 () Bool)

(declare-fun e!171019 () Bool)

(assert (=> d!63557 e!171019))

(declare-fun res!128822 () Bool)

(assert (=> d!63557 (=> res!128822 e!171019)))

(declare-fun lt!133528 () Bool)

(assert (=> d!63557 (= res!128822 (not lt!133528))))

(declare-fun lt!133526 () Bool)

(assert (=> d!63557 (= lt!133528 lt!133526)))

(declare-fun lt!133525 () Unit!8136)

(declare-fun e!171020 () Unit!8136)

(assert (=> d!63557 (= lt!133525 e!171020)))

(declare-fun c!45129 () Bool)

(assert (=> d!63557 (= c!45129 lt!133526)))

(assert (=> d!63557 (= lt!133526 (containsKey!310 (toList!1927 lt!132971) lt!132972))))

(assert (=> d!63557 (= (contains!1889 lt!132971 lt!132972) lt!133528)))

(declare-fun b!263975 () Bool)

(declare-fun lt!133527 () Unit!8136)

(assert (=> b!263975 (= e!171020 lt!133527)))

(assert (=> b!263975 (= lt!133527 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!132971) lt!132972))))

(assert (=> b!263975 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132971) lt!132972))))

(declare-fun b!263976 () Bool)

(declare-fun Unit!8187 () Unit!8136)

(assert (=> b!263976 (= e!171020 Unit!8187)))

(declare-fun b!263977 () Bool)

(assert (=> b!263977 (= e!171019 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132971) lt!132972)))))

(assert (= (and d!63557 c!45129) b!263975))

(assert (= (and d!63557 (not c!45129)) b!263976))

(assert (= (and d!63557 (not res!128822)) b!263977))

(declare-fun m!280277 () Bool)

(assert (=> d!63557 m!280277))

(declare-fun m!280279 () Bool)

(assert (=> b!263975 m!280279))

(assert (=> b!263975 m!279161))

(assert (=> b!263975 m!279161))

(declare-fun m!280281 () Bool)

(assert (=> b!263975 m!280281))

(assert (=> b!263977 m!279161))

(assert (=> b!263977 m!279161))

(assert (=> b!263977 m!280281))

(assert (=> d!63113 d!63557))

(declare-fun d!63559 () Bool)

(assert (=> d!63559 (= (apply!262 (+!713 lt!132971 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))) lt!132972) (apply!262 lt!132971 lt!132972))))

(assert (=> d!63559 true))

(declare-fun _$34!1136 () Unit!8136)

(assert (=> d!63559 (= (choose!1301 lt!132971 lt!132980 (zeroValue!4683 thiss!1504) lt!132972) _$34!1136)))

(declare-fun bs!9286 () Bool)

(assert (= bs!9286 d!63559))

(assert (=> bs!9286 m!278543))

(assert (=> bs!9286 m!278543))

(assert (=> bs!9286 m!278545))

(assert (=> bs!9286 m!278557))

(assert (=> d!63113 d!63559))

(assert (=> d!63113 d!63119))

(assert (=> d!63113 d!63107))

(declare-fun d!63561 () Bool)

(assert (=> d!63561 (= (inRange!0 (index!6943 lt!133311) (mask!11207 thiss!1504)) (and (bvsge (index!6943 lt!133311) #b00000000000000000000000000000000) (bvslt (index!6943 lt!133311) (bvadd (mask!11207 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!263465 d!63561))

(declare-fun b!263978 () Bool)

(declare-fun e!171022 () List!3817)

(declare-fun call!25255 () List!3817)

(assert (=> b!263978 (= e!171022 call!25255)))

(declare-fun b!263979 () Bool)

(declare-fun e!171024 () List!3817)

(declare-fun call!25256 () List!3817)

(assert (=> b!263979 (= e!171024 call!25256)))

(declare-fun c!45132 () Bool)

(declare-fun e!171025 () List!3817)

(declare-fun b!263980 () Bool)

(declare-fun c!45131 () Bool)

(assert (=> b!263980 (= e!171025 (ite c!45132 (t!8885 (t!8885 (toList!1927 (map!2737 thiss!1504)))) (ite c!45131 (Cons!3813 (h!4479 (t!8885 (toList!1927 (map!2737 thiss!1504)))) (t!8885 (t!8885 (toList!1927 (map!2737 thiss!1504))))) Nil!3814)))))

(declare-fun b!263981 () Bool)

(declare-fun e!171021 () Bool)

(declare-fun lt!133529 () List!3817)

(assert (=> b!263981 (= e!171021 (contains!1893 lt!133529 (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))))))

(declare-fun bm!25252 () Bool)

(declare-fun call!25257 () List!3817)

(assert (=> bm!25252 (= call!25257 call!25255)))

(declare-fun b!263982 () Bool)

(declare-fun res!128824 () Bool)

(assert (=> b!263982 (=> (not res!128824) (not e!171021))))

(assert (=> b!263982 (= res!128824 (containsKey!310 lt!133529 (_1!2471 lt!132765)))))

(declare-fun b!263983 () Bool)

(assert (=> b!263983 (= e!171024 call!25256)))

(declare-fun b!263984 () Bool)

(assert (=> b!263984 (= e!171025 (insertStrictlySorted!180 (t!8885 (t!8885 (toList!1927 (map!2737 thiss!1504)))) (_1!2471 lt!132765) (_2!2471 lt!132765)))))

(declare-fun d!63563 () Bool)

(assert (=> d!63563 e!171021))

(declare-fun res!128823 () Bool)

(assert (=> d!63563 (=> (not res!128823) (not e!171021))))

(assert (=> d!63563 (= res!128823 (isStrictlySorted!372 lt!133529))))

(assert (=> d!63563 (= lt!133529 e!171022)))

(declare-fun c!45133 () Bool)

(assert (=> d!63563 (= c!45133 (and ((_ is Cons!3813) (t!8885 (toList!1927 (map!2737 thiss!1504)))) (bvslt (_1!2471 (h!4479 (t!8885 (toList!1927 (map!2737 thiss!1504))))) (_1!2471 lt!132765))))))

(assert (=> d!63563 (isStrictlySorted!372 (t!8885 (toList!1927 (map!2737 thiss!1504))))))

(assert (=> d!63563 (= (insertStrictlySorted!180 (t!8885 (toList!1927 (map!2737 thiss!1504))) (_1!2471 lt!132765) (_2!2471 lt!132765)) lt!133529)))

(declare-fun b!263985 () Bool)

(assert (=> b!263985 (= c!45131 (and ((_ is Cons!3813) (t!8885 (toList!1927 (map!2737 thiss!1504)))) (bvsgt (_1!2471 (h!4479 (t!8885 (toList!1927 (map!2737 thiss!1504))))) (_1!2471 lt!132765))))))

(declare-fun e!171023 () List!3817)

(assert (=> b!263985 (= e!171023 e!171024)))

(declare-fun bm!25253 () Bool)

(assert (=> bm!25253 (= call!25255 ($colon$colon!107 e!171025 (ite c!45133 (h!4479 (t!8885 (toList!1927 (map!2737 thiss!1504)))) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765)))))))

(declare-fun c!45130 () Bool)

(assert (=> bm!25253 (= c!45130 c!45133)))

(declare-fun bm!25254 () Bool)

(assert (=> bm!25254 (= call!25256 call!25257)))

(declare-fun b!263986 () Bool)

(assert (=> b!263986 (= e!171023 call!25257)))

(declare-fun b!263987 () Bool)

(assert (=> b!263987 (= e!171022 e!171023)))

(assert (=> b!263987 (= c!45132 (and ((_ is Cons!3813) (t!8885 (toList!1927 (map!2737 thiss!1504)))) (= (_1!2471 (h!4479 (t!8885 (toList!1927 (map!2737 thiss!1504))))) (_1!2471 lt!132765))))))

(assert (= (and d!63563 c!45133) b!263978))

(assert (= (and d!63563 (not c!45133)) b!263987))

(assert (= (and b!263987 c!45132) b!263986))

(assert (= (and b!263987 (not c!45132)) b!263985))

(assert (= (and b!263985 c!45131) b!263983))

(assert (= (and b!263985 (not c!45131)) b!263979))

(assert (= (or b!263983 b!263979) bm!25254))

(assert (= (or b!263986 bm!25254) bm!25252))

(assert (= (or b!263978 bm!25252) bm!25253))

(assert (= (and bm!25253 c!45130) b!263984))

(assert (= (and bm!25253 (not c!45130)) b!263980))

(assert (= (and d!63563 res!128823) b!263982))

(assert (= (and b!263982 res!128824) b!263981))

(declare-fun m!280283 () Bool)

(assert (=> b!263984 m!280283))

(declare-fun m!280285 () Bool)

(assert (=> bm!25253 m!280285))

(declare-fun m!280287 () Bool)

(assert (=> b!263981 m!280287))

(declare-fun m!280289 () Bool)

(assert (=> b!263982 m!280289))

(declare-fun m!280291 () Bool)

(assert (=> d!63563 m!280291))

(declare-fun m!280293 () Bool)

(assert (=> d!63563 m!280293))

(assert (=> b!263538 d!63563))

(declare-fun d!63565 () Bool)

(assert (=> d!63565 (= (validMask!0 (mask!11207 lt!132778)) (and (or (= (mask!11207 lt!132778) #b00000000000000000000000000000111) (= (mask!11207 lt!132778) #b00000000000000000000000000001111) (= (mask!11207 lt!132778) #b00000000000000000000000000011111) (= (mask!11207 lt!132778) #b00000000000000000000000000111111) (= (mask!11207 lt!132778) #b00000000000000000000000001111111) (= (mask!11207 lt!132778) #b00000000000000000000000011111111) (= (mask!11207 lt!132778) #b00000000000000000000000111111111) (= (mask!11207 lt!132778) #b00000000000000000000001111111111) (= (mask!11207 lt!132778) #b00000000000000000000011111111111) (= (mask!11207 lt!132778) #b00000000000000000000111111111111) (= (mask!11207 lt!132778) #b00000000000000000001111111111111) (= (mask!11207 lt!132778) #b00000000000000000011111111111111) (= (mask!11207 lt!132778) #b00000000000000000111111111111111) (= (mask!11207 lt!132778) #b00000000000000001111111111111111) (= (mask!11207 lt!132778) #b00000000000000011111111111111111) (= (mask!11207 lt!132778) #b00000000000000111111111111111111) (= (mask!11207 lt!132778) #b00000000000001111111111111111111) (= (mask!11207 lt!132778) #b00000000000011111111111111111111) (= (mask!11207 lt!132778) #b00000000000111111111111111111111) (= (mask!11207 lt!132778) #b00000000001111111111111111111111) (= (mask!11207 lt!132778) #b00000000011111111111111111111111) (= (mask!11207 lt!132778) #b00000000111111111111111111111111) (= (mask!11207 lt!132778) #b00000001111111111111111111111111) (= (mask!11207 lt!132778) #b00000011111111111111111111111111) (= (mask!11207 lt!132778) #b00000111111111111111111111111111) (= (mask!11207 lt!132778) #b00001111111111111111111111111111) (= (mask!11207 lt!132778) #b00011111111111111111111111111111) (= (mask!11207 lt!132778) #b00111111111111111111111111111111)) (bvsle (mask!11207 lt!132778) #b00111111111111111111111111111111)))))

(assert (=> d!63011 d!63565))

(declare-fun d!63567 () Bool)

(assert (=> d!63567 (= (get!3088 (getValueByKey!318 (toList!1927 lt!132981) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000))) (v!5502 (getValueByKey!318 (toList!1927 lt!132981) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (=> d!63229 d!63567))

(declare-fun b!263989 () Bool)

(declare-fun e!171026 () Option!324)

(declare-fun e!171027 () Option!324)

(assert (=> b!263989 (= e!171026 e!171027)))

(declare-fun c!45135 () Bool)

(assert (=> b!263989 (= c!45135 (and ((_ is Cons!3813) (toList!1927 lt!132981)) (not (= (_1!2471 (h!4479 (toList!1927 lt!132981))) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))))

(declare-fun b!263991 () Bool)

(assert (=> b!263991 (= e!171027 None!322)))

(declare-fun d!63569 () Bool)

(declare-fun c!45134 () Bool)

(assert (=> d!63569 (= c!45134 (and ((_ is Cons!3813) (toList!1927 lt!132981)) (= (_1!2471 (h!4479 (toList!1927 lt!132981))) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (=> d!63569 (= (getValueByKey!318 (toList!1927 lt!132981) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)) e!171026)))

(declare-fun b!263988 () Bool)

(assert (=> b!263988 (= e!171026 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!132981)))))))

(declare-fun b!263990 () Bool)

(assert (=> b!263990 (= e!171027 (getValueByKey!318 (t!8885 (toList!1927 lt!132981)) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!63569 c!45134) b!263988))

(assert (= (and d!63569 (not c!45134)) b!263989))

(assert (= (and b!263989 c!45135) b!263990))

(assert (= (and b!263989 (not c!45135)) b!263991))

(assert (=> b!263990 m!278517))

(declare-fun m!280295 () Bool)

(assert (=> b!263990 m!280295))

(assert (=> d!63229 d!63569))

(assert (=> b!263194 d!63135))

(assert (=> d!63021 d!63003))

(assert (=> d!63021 d!62935))

(assert (=> d!63021 d!63005))

(declare-fun b!263993 () Bool)

(declare-fun e!171028 () Option!324)

(declare-fun e!171029 () Option!324)

(assert (=> b!263993 (= e!171028 e!171029)))

(declare-fun c!45137 () Bool)

(assert (=> b!263993 (= c!45137 (and ((_ is Cons!3813) (t!8885 (toList!1927 lt!132776))) (not (= (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132776)))) key!932))))))

(declare-fun b!263995 () Bool)

(assert (=> b!263995 (= e!171029 None!322)))

(declare-fun d!63571 () Bool)

(declare-fun c!45136 () Bool)

(assert (=> d!63571 (= c!45136 (and ((_ is Cons!3813) (t!8885 (toList!1927 lt!132776))) (= (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132776)))) key!932)))))

(assert (=> d!63571 (= (getValueByKey!318 (t!8885 (toList!1927 lt!132776)) key!932) e!171028)))

(declare-fun b!263992 () Bool)

(assert (=> b!263992 (= e!171028 (Some!323 (_2!2471 (h!4479 (t!8885 (toList!1927 lt!132776))))))))

(declare-fun b!263994 () Bool)

(assert (=> b!263994 (= e!171029 (getValueByKey!318 (t!8885 (t!8885 (toList!1927 lt!132776))) key!932))))

(assert (= (and d!63571 c!45136) b!263992))

(assert (= (and d!63571 (not c!45136)) b!263993))

(assert (= (and b!263993 c!45137) b!263994))

(assert (= (and b!263993 (not c!45137)) b!263995))

(declare-fun m!280297 () Bool)

(assert (=> b!263994 m!280297))

(assert (=> b!263192 d!63571))

(declare-fun d!63573 () Bool)

(assert (=> d!63573 (= (get!3089 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!5497 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!263556 d!63573))

(declare-fun b!263997 () Bool)

(declare-fun e!171030 () Option!324)

(declare-fun e!171031 () Option!324)

(assert (=> b!263997 (= e!171030 e!171031)))

(declare-fun c!45139 () Bool)

(assert (=> b!263997 (= c!45139 (and ((_ is Cons!3813) (t!8885 (toList!1927 lt!132763))) (not (= (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132763)))) key!932))))))

(declare-fun b!263999 () Bool)

(assert (=> b!263999 (= e!171031 None!322)))

(declare-fun d!63575 () Bool)

(declare-fun c!45138 () Bool)

(assert (=> d!63575 (= c!45138 (and ((_ is Cons!3813) (t!8885 (toList!1927 lt!132763))) (= (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132763)))) key!932)))))

(assert (=> d!63575 (= (getValueByKey!318 (t!8885 (toList!1927 lt!132763)) key!932) e!171030)))

(declare-fun b!263996 () Bool)

(assert (=> b!263996 (= e!171030 (Some!323 (_2!2471 (h!4479 (t!8885 (toList!1927 lt!132763))))))))

(declare-fun b!263998 () Bool)

(assert (=> b!263998 (= e!171031 (getValueByKey!318 (t!8885 (t!8885 (toList!1927 lt!132763))) key!932))))

(assert (= (and d!63575 c!45138) b!263996))

(assert (= (and d!63575 (not c!45138)) b!263997))

(assert (= (and b!263997 c!45139) b!263998))

(assert (= (and b!263997 (not c!45139)) b!263999))

(declare-fun m!280299 () Bool)

(assert (=> b!263998 m!280299))

(assert (=> b!263420 d!63575))

(declare-fun d!63577 () Bool)

(assert (=> d!63577 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132981) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun lt!133530 () Unit!8136)

(assert (=> d!63577 (= lt!133530 (choose!1300 (toList!1927 lt!132981) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!171032 () Bool)

(assert (=> d!63577 e!171032))

(declare-fun res!128825 () Bool)

(assert (=> d!63577 (=> (not res!128825) (not e!171032))))

(assert (=> d!63577 (= res!128825 (isStrictlySorted!372 (toList!1927 lt!132981)))))

(assert (=> d!63577 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!132981) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)) lt!133530)))

(declare-fun b!264000 () Bool)

(assert (=> b!264000 (= e!171032 (containsKey!310 (toList!1927 lt!132981) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!63577 res!128825) b!264000))

(assert (=> d!63577 m!278517))

(assert (=> d!63577 m!278947))

(assert (=> d!63577 m!278947))

(assert (=> d!63577 m!278949))

(assert (=> d!63577 m!278517))

(declare-fun m!280301 () Bool)

(assert (=> d!63577 m!280301))

(assert (=> d!63577 m!279945))

(assert (=> b!264000 m!278517))

(assert (=> b!264000 m!278943))

(assert (=> b!263208 d!63577))

(declare-fun d!63579 () Bool)

(assert (=> d!63579 (= (isDefined!260 (getValueByKey!318 (toList!1927 lt!132981) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000))) (not (isEmpty!544 (getValueByKey!318 (toList!1927 lt!132981) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))))

(declare-fun bs!9287 () Bool)

(assert (= bs!9287 d!63579))

(assert (=> bs!9287 m!278947))

(declare-fun m!280303 () Bool)

(assert (=> bs!9287 m!280303))

(assert (=> b!263208 d!63579))

(assert (=> b!263208 d!63569))

(declare-fun d!63581 () Bool)

(declare-fun e!171033 () Bool)

(assert (=> d!63581 e!171033))

(declare-fun res!128827 () Bool)

(assert (=> d!63581 (=> (not res!128827) (not e!171033))))

(declare-fun lt!133532 () ListLongMap!3823)

(assert (=> d!63581 (= res!128827 (contains!1889 lt!133532 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778)))))))

(declare-fun lt!133531 () List!3817)

(assert (=> d!63581 (= lt!133532 (ListLongMap!3824 lt!133531))))

(declare-fun lt!133534 () Unit!8136)

(declare-fun lt!133533 () Unit!8136)

(assert (=> d!63581 (= lt!133534 lt!133533)))

(assert (=> d!63581 (= (getValueByKey!318 lt!133531 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778)))) (Some!323 (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778)))))))

(assert (=> d!63581 (= lt!133533 (lemmaContainsTupThenGetReturnValue!177 lt!133531 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778)))))))

(assert (=> d!63581 (= lt!133531 (insertStrictlySorted!180 (toList!1927 call!25192) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778)))))))

(assert (=> d!63581 (= (+!713 call!25192 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778))) lt!133532)))

(declare-fun b!264001 () Bool)

(declare-fun res!128826 () Bool)

(assert (=> b!264001 (=> (not res!128826) (not e!171033))))

(assert (=> b!264001 (= res!128826 (= (getValueByKey!318 (toList!1927 lt!133532) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778)))) (Some!323 (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778))))))))

(declare-fun b!264002 () Bool)

(assert (=> b!264002 (= e!171033 (contains!1893 (toList!1927 lt!133532) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!132778))))))

(assert (= (and d!63581 res!128827) b!264001))

(assert (= (and b!264001 res!128826) b!264002))

(declare-fun m!280305 () Bool)

(assert (=> d!63581 m!280305))

(declare-fun m!280307 () Bool)

(assert (=> d!63581 m!280307))

(declare-fun m!280309 () Bool)

(assert (=> d!63581 m!280309))

(declare-fun m!280311 () Bool)

(assert (=> d!63581 m!280311))

(declare-fun m!280313 () Bool)

(assert (=> b!264001 m!280313))

(declare-fun m!280315 () Bool)

(assert (=> b!264002 m!280315))

(assert (=> b!263313 d!63581))

(assert (=> b!263525 d!63399))

(assert (=> b!263525 d!63197))

(declare-fun d!63583 () Bool)

(declare-fun res!128828 () Bool)

(declare-fun e!171034 () Bool)

(assert (=> d!63583 (=> res!128828 e!171034)))

(assert (=> d!63583 (= res!128828 (and ((_ is Cons!3813) (toList!1927 lt!133003)) (= (_1!2471 (h!4479 (toList!1927 lt!133003))) (select (arr!5992 lt!132768) #b00000000000000000000000000000000))))))

(assert (=> d!63583 (= (containsKey!310 (toList!1927 lt!133003) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)) e!171034)))

(declare-fun b!264003 () Bool)

(declare-fun e!171035 () Bool)

(assert (=> b!264003 (= e!171034 e!171035)))

(declare-fun res!128829 () Bool)

(assert (=> b!264003 (=> (not res!128829) (not e!171035))))

(assert (=> b!264003 (= res!128829 (and (or (not ((_ is Cons!3813) (toList!1927 lt!133003))) (bvsle (_1!2471 (h!4479 (toList!1927 lt!133003))) (select (arr!5992 lt!132768) #b00000000000000000000000000000000))) ((_ is Cons!3813) (toList!1927 lt!133003)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!133003))) (select (arr!5992 lt!132768) #b00000000000000000000000000000000))))))

(declare-fun b!264004 () Bool)

(assert (=> b!264004 (= e!171035 (containsKey!310 (t!8885 (toList!1927 lt!133003)) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(assert (= (and d!63583 (not res!128828)) b!264003))

(assert (= (and b!264003 res!128829) b!264004))

(assert (=> b!264004 m!278587))

(declare-fun m!280317 () Bool)

(assert (=> b!264004 m!280317))

(assert (=> d!63039 d!63583))

(assert (=> b!263403 d!63431))

(declare-fun d!63585 () Bool)

(declare-fun res!128830 () Bool)

(declare-fun e!171036 () Bool)

(assert (=> d!63585 (=> res!128830 e!171036)))

(assert (=> d!63585 (= res!128830 (and ((_ is Cons!3813) (toList!1927 lt!132981)) (= (_1!2471 (h!4479 (toList!1927 lt!132981))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63585 (= (containsKey!310 (toList!1927 lt!132981) #b1000000000000000000000000000000000000000000000000000000000000000) e!171036)))

(declare-fun b!264005 () Bool)

(declare-fun e!171037 () Bool)

(assert (=> b!264005 (= e!171036 e!171037)))

(declare-fun res!128831 () Bool)

(assert (=> b!264005 (=> (not res!128831) (not e!171037))))

(assert (=> b!264005 (= res!128831 (and (or (not ((_ is Cons!3813) (toList!1927 lt!132981))) (bvsle (_1!2471 (h!4479 (toList!1927 lt!132981))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!3813) (toList!1927 lt!132981)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!132981))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264006 () Bool)

(assert (=> b!264006 (= e!171037 (containsKey!310 (t!8885 (toList!1927 lt!132981)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63585 (not res!128830)) b!264005))

(assert (= (and b!264005 res!128831) b!264006))

(declare-fun m!280319 () Bool)

(assert (=> b!264006 m!280319))

(assert (=> d!63161 d!63585))

(declare-fun d!63587 () Bool)

(assert (=> d!63587 (= (get!3088 (getValueByKey!318 (toList!1927 (+!713 lt!132971 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))) lt!132972)) (v!5502 (getValueByKey!318 (toList!1927 (+!713 lt!132971 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))) lt!132972)))))

(assert (=> d!63119 d!63587))

(declare-fun b!264008 () Bool)

(declare-fun e!171038 () Option!324)

(declare-fun e!171039 () Option!324)

(assert (=> b!264008 (= e!171038 e!171039)))

(declare-fun c!45141 () Bool)

(assert (=> b!264008 (= c!45141 (and ((_ is Cons!3813) (toList!1927 (+!713 lt!132971 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))))) (not (= (_1!2471 (h!4479 (toList!1927 (+!713 lt!132971 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))))) lt!132972))))))

(declare-fun b!264010 () Bool)

(assert (=> b!264010 (= e!171039 None!322)))

(declare-fun c!45140 () Bool)

(declare-fun d!63589 () Bool)

(assert (=> d!63589 (= c!45140 (and ((_ is Cons!3813) (toList!1927 (+!713 lt!132971 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))))) (= (_1!2471 (h!4479 (toList!1927 (+!713 lt!132971 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))))) lt!132972)))))

(assert (=> d!63589 (= (getValueByKey!318 (toList!1927 (+!713 lt!132971 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))) lt!132972) e!171038)))

(declare-fun b!264007 () Bool)

(assert (=> b!264007 (= e!171038 (Some!323 (_2!2471 (h!4479 (toList!1927 (+!713 lt!132971 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))))))))))

(declare-fun b!264009 () Bool)

(assert (=> b!264009 (= e!171039 (getValueByKey!318 (t!8885 (toList!1927 (+!713 lt!132971 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))))) lt!132972))))

(assert (= (and d!63589 c!45140) b!264007))

(assert (= (and d!63589 (not c!45140)) b!264008))

(assert (= (and b!264008 c!45141) b!264009))

(assert (= (and b!264008 (not c!45141)) b!264010))

(declare-fun m!280321 () Bool)

(assert (=> b!264009 m!280321))

(assert (=> d!63119 d!63589))

(declare-fun b!264011 () Bool)

(declare-fun e!171041 () (_ BitVec 32))

(declare-fun call!25258 () (_ BitVec 32))

(assert (=> b!264011 (= e!171041 call!25258)))

(declare-fun bm!25255 () Bool)

(assert (=> bm!25255 (= call!25258 (arrayCountValidKeys!0 lt!132768 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(declare-fun b!264012 () Bool)

(declare-fun e!171040 () (_ BitVec 32))

(assert (=> b!264012 (= e!171040 e!171041)))

(declare-fun c!45143 () Bool)

(assert (=> b!264012 (= c!45143 (validKeyInArray!0 (select (arr!5992 lt!132768) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun b!264013 () Bool)

(assert (=> b!264013 (= e!171040 #b00000000000000000000000000000000)))

(declare-fun b!264014 () Bool)

(assert (=> b!264014 (= e!171041 (bvadd #b00000000000000000000000000000001 call!25258))))

(declare-fun d!63591 () Bool)

(declare-fun lt!133535 () (_ BitVec 32))

(assert (=> d!63591 (and (bvsge lt!133535 #b00000000000000000000000000000000) (bvsle lt!133535 (bvsub (size!6344 lt!132768) (bvadd index!297 #b00000000000000000000000000000001))))))

(assert (=> d!63591 (= lt!133535 e!171040)))

(declare-fun c!45142 () Bool)

(assert (=> d!63591 (= c!45142 (bvsge (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (=> d!63591 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)) (bvsge (bvadd index!297 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd index!297 #b00000000000000000000000000000001) (size!6344 lt!132768)))))

(assert (=> d!63591 (= (arrayCountValidKeys!0 lt!132768 (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)) lt!133535)))

(assert (= (and d!63591 c!45142) b!264013))

(assert (= (and d!63591 (not c!45142)) b!264012))

(assert (= (and b!264012 c!45143) b!264014))

(assert (= (and b!264012 (not c!45143)) b!264011))

(assert (= (or b!264014 b!264011) bm!25255))

(declare-fun m!280323 () Bool)

(assert (=> bm!25255 m!280323))

(assert (=> b!264012 m!279501))

(assert (=> b!264012 m!279501))

(assert (=> b!264012 m!279503))

(assert (=> bm!25195 d!63591))

(declare-fun d!63593 () Bool)

(assert (=> d!63593 (not (contains!1889 (+!713 lt!133223 (tuple2!4921 lt!133227 lt!133222)) lt!133225))))

(declare-fun lt!133538 () Unit!8136)

(declare-fun choose!1304 (ListLongMap!3823 (_ BitVec 64) V!8521 (_ BitVec 64)) Unit!8136)

(assert (=> d!63593 (= lt!133538 (choose!1304 lt!133223 lt!133227 lt!133222 lt!133225))))

(declare-fun e!171044 () Bool)

(assert (=> d!63593 e!171044))

(declare-fun res!128834 () Bool)

(assert (=> d!63593 (=> (not res!128834) (not e!171044))))

(assert (=> d!63593 (= res!128834 (not (contains!1889 lt!133223 lt!133225)))))

(assert (=> d!63593 (= (addStillNotContains!130 lt!133223 lt!133227 lt!133222 lt!133225) lt!133538)))

(declare-fun b!264018 () Bool)

(assert (=> b!264018 (= e!171044 (not (= lt!133227 lt!133225)))))

(assert (= (and d!63593 res!128834) b!264018))

(assert (=> d!63593 m!279187))

(assert (=> d!63593 m!279187))

(assert (=> d!63593 m!279189))

(declare-fun m!280325 () Bool)

(assert (=> d!63593 m!280325))

(declare-fun m!280327 () Bool)

(assert (=> d!63593 m!280327))

(assert (=> b!263298 d!63593))

(assert (=> b!263298 d!63231))

(declare-fun d!63595 () Bool)

(declare-fun e!171045 () Bool)

(assert (=> d!63595 e!171045))

(declare-fun res!128836 () Bool)

(assert (=> d!63595 (=> (not res!128836) (not e!171045))))

(declare-fun lt!133540 () ListLongMap!3823)

(assert (=> d!63595 (= res!128836 (contains!1889 lt!133540 (_1!2471 (tuple2!4921 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!133539 () List!3817)

(assert (=> d!63595 (= lt!133540 (ListLongMap!3824 lt!133539))))

(declare-fun lt!133542 () Unit!8136)

(declare-fun lt!133541 () Unit!8136)

(assert (=> d!63595 (= lt!133542 lt!133541)))

(assert (=> d!63595 (= (getValueByKey!318 lt!133539 (_1!2471 (tuple2!4921 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!323 (_2!2471 (tuple2!4921 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63595 (= lt!133541 (lemmaContainsTupThenGetReturnValue!177 lt!133539 (_1!2471 (tuple2!4921 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!2471 (tuple2!4921 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63595 (= lt!133539 (insertStrictlySorted!180 (toList!1927 call!25190) (_1!2471 (tuple2!4921 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!2471 (tuple2!4921 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63595 (= (+!713 call!25190 (tuple2!4921 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!133540)))

(declare-fun b!264019 () Bool)

(declare-fun res!128835 () Bool)

(assert (=> b!264019 (=> (not res!128835) (not e!171045))))

(assert (=> b!264019 (= res!128835 (= (getValueByKey!318 (toList!1927 lt!133540) (_1!2471 (tuple2!4921 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!323 (_2!2471 (tuple2!4921 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!264020 () Bool)

(assert (=> b!264020 (= e!171045 (contains!1893 (toList!1927 lt!133540) (tuple2!4921 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!63595 res!128836) b!264019))

(assert (= (and b!264019 res!128835) b!264020))

(declare-fun m!280329 () Bool)

(assert (=> d!63595 m!280329))

(declare-fun m!280331 () Bool)

(assert (=> d!63595 m!280331))

(declare-fun m!280333 () Bool)

(assert (=> d!63595 m!280333))

(declare-fun m!280335 () Bool)

(assert (=> d!63595 m!280335))

(declare-fun m!280337 () Bool)

(assert (=> b!264019 m!280337))

(declare-fun m!280339 () Bool)

(assert (=> b!264020 m!280339))

(assert (=> b!263298 d!63595))

(declare-fun d!63597 () Bool)

(declare-fun e!171046 () Bool)

(assert (=> d!63597 e!171046))

(declare-fun res!128838 () Bool)

(assert (=> d!63597 (=> (not res!128838) (not e!171046))))

(declare-fun lt!133544 () ListLongMap!3823)

(assert (=> d!63597 (= res!128838 (contains!1889 lt!133544 (_1!2471 (tuple2!4921 lt!133227 lt!133222))))))

(declare-fun lt!133543 () List!3817)

(assert (=> d!63597 (= lt!133544 (ListLongMap!3824 lt!133543))))

(declare-fun lt!133546 () Unit!8136)

(declare-fun lt!133545 () Unit!8136)

(assert (=> d!63597 (= lt!133546 lt!133545)))

(assert (=> d!63597 (= (getValueByKey!318 lt!133543 (_1!2471 (tuple2!4921 lt!133227 lt!133222))) (Some!323 (_2!2471 (tuple2!4921 lt!133227 lt!133222))))))

(assert (=> d!63597 (= lt!133545 (lemmaContainsTupThenGetReturnValue!177 lt!133543 (_1!2471 (tuple2!4921 lt!133227 lt!133222)) (_2!2471 (tuple2!4921 lt!133227 lt!133222))))))

(assert (=> d!63597 (= lt!133543 (insertStrictlySorted!180 (toList!1927 lt!133223) (_1!2471 (tuple2!4921 lt!133227 lt!133222)) (_2!2471 (tuple2!4921 lt!133227 lt!133222))))))

(assert (=> d!63597 (= (+!713 lt!133223 (tuple2!4921 lt!133227 lt!133222)) lt!133544)))

(declare-fun b!264021 () Bool)

(declare-fun res!128837 () Bool)

(assert (=> b!264021 (=> (not res!128837) (not e!171046))))

(assert (=> b!264021 (= res!128837 (= (getValueByKey!318 (toList!1927 lt!133544) (_1!2471 (tuple2!4921 lt!133227 lt!133222))) (Some!323 (_2!2471 (tuple2!4921 lt!133227 lt!133222)))))))

(declare-fun b!264022 () Bool)

(assert (=> b!264022 (= e!171046 (contains!1893 (toList!1927 lt!133544) (tuple2!4921 lt!133227 lt!133222)))))

(assert (= (and d!63597 res!128838) b!264021))

(assert (= (and b!264021 res!128837) b!264022))

(declare-fun m!280341 () Bool)

(assert (=> d!63597 m!280341))

(declare-fun m!280343 () Bool)

(assert (=> d!63597 m!280343))

(declare-fun m!280345 () Bool)

(assert (=> d!63597 m!280345))

(declare-fun m!280347 () Bool)

(assert (=> d!63597 m!280347))

(declare-fun m!280349 () Bool)

(assert (=> b!264021 m!280349))

(declare-fun m!280351 () Bool)

(assert (=> b!264022 m!280351))

(assert (=> b!263298 d!63597))

(declare-fun d!63599 () Bool)

(declare-fun e!171047 () Bool)

(assert (=> d!63599 e!171047))

(declare-fun res!128839 () Bool)

(assert (=> d!63599 (=> res!128839 e!171047)))

(declare-fun lt!133550 () Bool)

(assert (=> d!63599 (= res!128839 (not lt!133550))))

(declare-fun lt!133548 () Bool)

(assert (=> d!63599 (= lt!133550 lt!133548)))

(declare-fun lt!133547 () Unit!8136)

(declare-fun e!171048 () Unit!8136)

(assert (=> d!63599 (= lt!133547 e!171048)))

(declare-fun c!45144 () Bool)

(assert (=> d!63599 (= c!45144 lt!133548)))

(assert (=> d!63599 (= lt!133548 (containsKey!310 (toList!1927 (+!713 lt!133223 (tuple2!4921 lt!133227 lt!133222))) lt!133225))))

(assert (=> d!63599 (= (contains!1889 (+!713 lt!133223 (tuple2!4921 lt!133227 lt!133222)) lt!133225) lt!133550)))

(declare-fun b!264023 () Bool)

(declare-fun lt!133549 () Unit!8136)

(assert (=> b!264023 (= e!171048 lt!133549)))

(assert (=> b!264023 (= lt!133549 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 (+!713 lt!133223 (tuple2!4921 lt!133227 lt!133222))) lt!133225))))

(assert (=> b!264023 (isDefined!260 (getValueByKey!318 (toList!1927 (+!713 lt!133223 (tuple2!4921 lt!133227 lt!133222))) lt!133225))))

(declare-fun b!264024 () Bool)

(declare-fun Unit!8188 () Unit!8136)

(assert (=> b!264024 (= e!171048 Unit!8188)))

(declare-fun b!264025 () Bool)

(assert (=> b!264025 (= e!171047 (isDefined!260 (getValueByKey!318 (toList!1927 (+!713 lt!133223 (tuple2!4921 lt!133227 lt!133222))) lt!133225)))))

(assert (= (and d!63599 c!45144) b!264023))

(assert (= (and d!63599 (not c!45144)) b!264024))

(assert (= (and d!63599 (not res!128839)) b!264025))

(declare-fun m!280353 () Bool)

(assert (=> d!63599 m!280353))

(declare-fun m!280355 () Bool)

(assert (=> b!264023 m!280355))

(declare-fun m!280357 () Bool)

(assert (=> b!264023 m!280357))

(assert (=> b!264023 m!280357))

(declare-fun m!280359 () Bool)

(assert (=> b!264023 m!280359))

(assert (=> b!264025 m!280357))

(assert (=> b!264025 m!280357))

(assert (=> b!264025 m!280359))

(assert (=> b!263298 d!63599))

(declare-fun d!63601 () Bool)

(declare-fun lt!133551 () Bool)

(assert (=> d!63601 (= lt!133551 (select (content!176 (toList!1927 lt!133199)) (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))))))

(declare-fun e!171050 () Bool)

(assert (=> d!63601 (= lt!133551 e!171050)))

(declare-fun res!128841 () Bool)

(assert (=> d!63601 (=> (not res!128841) (not e!171050))))

(assert (=> d!63601 (= res!128841 ((_ is Cons!3813) (toList!1927 lt!133199)))))

(assert (=> d!63601 (= (contains!1893 (toList!1927 lt!133199) (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))) lt!133551)))

(declare-fun b!264026 () Bool)

(declare-fun e!171049 () Bool)

(assert (=> b!264026 (= e!171050 e!171049)))

(declare-fun res!128840 () Bool)

(assert (=> b!264026 (=> res!128840 e!171049)))

(assert (=> b!264026 (= res!128840 (= (h!4479 (toList!1927 lt!133199)) (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))))))

(declare-fun b!264027 () Bool)

(assert (=> b!264027 (= e!171049 (contains!1893 (t!8885 (toList!1927 lt!133199)) (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!63601 res!128841) b!264026))

(assert (= (and b!264026 (not res!128840)) b!264027))

(declare-fun m!280361 () Bool)

(assert (=> d!63601 m!280361))

(declare-fun m!280363 () Bool)

(assert (=> d!63601 m!280363))

(declare-fun m!280365 () Bool)

(assert (=> b!264027 m!280365))

(assert (=> b!263278 d!63601))

(declare-fun lt!133552 () Bool)

(declare-fun d!63603 () Bool)

(assert (=> d!63603 (= lt!133552 (select (content!176 (toList!1927 lt!133169)) (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))))))

(declare-fun e!171052 () Bool)

(assert (=> d!63603 (= lt!133552 e!171052)))

(declare-fun res!128843 () Bool)

(assert (=> d!63603 (=> (not res!128843) (not e!171052))))

(assert (=> d!63603 (= res!128843 ((_ is Cons!3813) (toList!1927 lt!133169)))))

(assert (=> d!63603 (= (contains!1893 (toList!1927 lt!133169) (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))) lt!133552)))

(declare-fun b!264028 () Bool)

(declare-fun e!171051 () Bool)

(assert (=> b!264028 (= e!171052 e!171051)))

(declare-fun res!128842 () Bool)

(assert (=> b!264028 (=> res!128842 e!171051)))

(assert (=> b!264028 (= res!128842 (= (h!4479 (toList!1927 lt!133169)) (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))))))

(declare-fun b!264029 () Bool)

(assert (=> b!264029 (= e!171051 (contains!1893 (t!8885 (toList!1927 lt!133169)) (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!63603 res!128843) b!264028))

(assert (= (and b!264028 (not res!128842)) b!264029))

(declare-fun m!280367 () Bool)

(assert (=> d!63603 m!280367))

(declare-fun m!280369 () Bool)

(assert (=> d!63603 m!280369))

(declare-fun m!280371 () Bool)

(assert (=> b!264029 m!280371))

(assert (=> b!263232 d!63603))

(declare-fun d!63605 () Bool)

(declare-fun res!128844 () Bool)

(declare-fun e!171053 () Bool)

(assert (=> d!63605 (=> res!128844 e!171053)))

(assert (=> d!63605 (= res!128844 (= (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!133033))))

(assert (=> d!63605 (= (arrayContainsKey!0 lt!132768 lt!133033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!171053)))

(declare-fun b!264030 () Bool)

(declare-fun e!171054 () Bool)

(assert (=> b!264030 (= e!171053 e!171054)))

(declare-fun res!128845 () Bool)

(assert (=> b!264030 (=> (not res!128845) (not e!171054))))

(assert (=> b!264030 (= res!128845 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6344 lt!132768)))))

(declare-fun b!264031 () Bool)

(assert (=> b!264031 (= e!171054 (arrayContainsKey!0 lt!132768 lt!133033 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!63605 (not res!128844)) b!264030))

(assert (= (and b!264030 res!128845) b!264031))

(assert (=> d!63605 m!279299))

(declare-fun m!280373 () Bool)

(assert (=> b!264031 m!280373))

(assert (=> b!263387 d!63605))

(assert (=> d!63051 d!63053))

(declare-fun d!63607 () Bool)

(assert (=> d!63607 (= (apply!262 (+!713 lt!132995 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))) lt!132997) (apply!262 lt!132995 lt!132997))))

(assert (=> d!63607 true))

(declare-fun _$34!1137 () Unit!8136)

(assert (=> d!63607 (= (choose!1301 lt!132995 lt!132990 (minValue!4683 thiss!1504) lt!132997) _$34!1137)))

(declare-fun bs!9288 () Bool)

(assert (= bs!9288 d!63607))

(assert (=> bs!9288 m!278601))

(assert (=> bs!9288 m!278601))

(assert (=> bs!9288 m!278621))

(assert (=> bs!9288 m!278625))

(assert (=> d!63051 d!63607))

(assert (=> d!63051 d!63059))

(declare-fun d!63609 () Bool)

(declare-fun e!171055 () Bool)

(assert (=> d!63609 e!171055))

(declare-fun res!128846 () Bool)

(assert (=> d!63609 (=> res!128846 e!171055)))

(declare-fun lt!133556 () Bool)

(assert (=> d!63609 (= res!128846 (not lt!133556))))

(declare-fun lt!133554 () Bool)

(assert (=> d!63609 (= lt!133556 lt!133554)))

(declare-fun lt!133553 () Unit!8136)

(declare-fun e!171056 () Unit!8136)

(assert (=> d!63609 (= lt!133553 e!171056)))

(declare-fun c!45145 () Bool)

(assert (=> d!63609 (= c!45145 lt!133554)))

(assert (=> d!63609 (= lt!133554 (containsKey!310 (toList!1927 lt!132995) lt!132997))))

(assert (=> d!63609 (= (contains!1889 lt!132995 lt!132997) lt!133556)))

(declare-fun b!264032 () Bool)

(declare-fun lt!133555 () Unit!8136)

(assert (=> b!264032 (= e!171056 lt!133555)))

(assert (=> b!264032 (= lt!133555 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!132995) lt!132997))))

(assert (=> b!264032 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132995) lt!132997))))

(declare-fun b!264033 () Bool)

(declare-fun Unit!8189 () Unit!8136)

(assert (=> b!264033 (= e!171056 Unit!8189)))

(declare-fun b!264034 () Bool)

(assert (=> b!264034 (= e!171055 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132995) lt!132997)))))

(assert (= (and d!63609 c!45145) b!264032))

(assert (= (and d!63609 (not c!45145)) b!264033))

(assert (= (and d!63609 (not res!128846)) b!264034))

(declare-fun m!280375 () Bool)

(assert (=> d!63609 m!280375))

(declare-fun m!280377 () Bool)

(assert (=> b!264032 m!280377))

(assert (=> b!264032 m!278969))

(assert (=> b!264032 m!278969))

(declare-fun m!280379 () Bool)

(assert (=> b!264032 m!280379))

(assert (=> b!264034 m!278969))

(assert (=> b!264034 m!278969))

(assert (=> b!264034 m!280379))

(assert (=> d!63051 d!63609))

(assert (=> d!63051 d!63067))

(declare-fun d!63611 () Bool)

(declare-fun res!128847 () Bool)

(declare-fun e!171057 () Bool)

(assert (=> d!63611 (=> res!128847 e!171057)))

(assert (=> d!63611 (= res!128847 (and ((_ is Cons!3813) lt!133072) (= (_1!2471 (h!4479 lt!133072)) (_1!2471 lt!132765))))))

(assert (=> d!63611 (= (containsKey!310 lt!133072 (_1!2471 lt!132765)) e!171057)))

(declare-fun b!264035 () Bool)

(declare-fun e!171058 () Bool)

(assert (=> b!264035 (= e!171057 e!171058)))

(declare-fun res!128848 () Bool)

(assert (=> b!264035 (=> (not res!128848) (not e!171058))))

(assert (=> b!264035 (= res!128848 (and (or (not ((_ is Cons!3813) lt!133072)) (bvsle (_1!2471 (h!4479 lt!133072)) (_1!2471 lt!132765))) ((_ is Cons!3813) lt!133072) (bvslt (_1!2471 (h!4479 lt!133072)) (_1!2471 lt!132765))))))

(declare-fun b!264036 () Bool)

(assert (=> b!264036 (= e!171058 (containsKey!310 (t!8885 lt!133072) (_1!2471 lt!132765)))))

(assert (= (and d!63611 (not res!128847)) b!264035))

(assert (= (and b!264035 res!128848) b!264036))

(declare-fun m!280381 () Bool)

(assert (=> b!264036 m!280381))

(assert (=> b!263530 d!63611))

(declare-fun d!63613 () Bool)

(declare-fun lt!133557 () Bool)

(assert (=> d!63613 (= lt!133557 (select (content!176 (toList!1927 lt!133259)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(declare-fun e!171060 () Bool)

(assert (=> d!63613 (= lt!133557 e!171060)))

(declare-fun res!128850 () Bool)

(assert (=> d!63613 (=> (not res!128850) (not e!171060))))

(assert (=> d!63613 (= res!128850 ((_ is Cons!3813) (toList!1927 lt!133259)))))

(assert (=> d!63613 (= (contains!1893 (toList!1927 lt!133259) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) lt!133557)))

(declare-fun b!264037 () Bool)

(declare-fun e!171059 () Bool)

(assert (=> b!264037 (= e!171060 e!171059)))

(declare-fun res!128849 () Bool)

(assert (=> b!264037 (=> res!128849 e!171059)))

(assert (=> b!264037 (= res!128849 (= (h!4479 (toList!1927 lt!133259)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(declare-fun b!264038 () Bool)

(assert (=> b!264038 (= e!171059 (contains!1893 (t!8885 (toList!1927 lt!133259)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(assert (= (and d!63613 res!128850) b!264037))

(assert (= (and b!264037 (not res!128849)) b!264038))

(declare-fun m!280383 () Bool)

(assert (=> d!63613 m!280383))

(declare-fun m!280385 () Bool)

(assert (=> d!63613 m!280385))

(declare-fun m!280387 () Bool)

(assert (=> b!264038 m!280387))

(assert (=> b!263351 d!63613))

(declare-fun b!264040 () Bool)

(declare-fun e!171061 () Option!324)

(declare-fun e!171062 () Option!324)

(assert (=> b!264040 (= e!171061 e!171062)))

(declare-fun c!45147 () Bool)

(assert (=> b!264040 (= c!45147 (and ((_ is Cons!3813) (toList!1927 lt!133161)) (not (= (_1!2471 (h!4479 (toList!1927 lt!133161))) (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))))))))

(declare-fun b!264042 () Bool)

(assert (=> b!264042 (= e!171062 None!322)))

(declare-fun d!63615 () Bool)

(declare-fun c!45146 () Bool)

(assert (=> d!63615 (= c!45146 (and ((_ is Cons!3813) (toList!1927 lt!133161)) (= (_1!2471 (h!4479 (toList!1927 lt!133161))) (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504))))))))

(assert (=> d!63615 (= (getValueByKey!318 (toList!1927 lt!133161) (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))) e!171061)))

(declare-fun b!264039 () Bool)

(assert (=> b!264039 (= e!171061 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!133161)))))))

(declare-fun b!264041 () Bool)

(assert (=> b!264041 (= e!171062 (getValueByKey!318 (t!8885 (toList!1927 lt!133161)) (_1!2471 (tuple2!4921 lt!132990 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63615 c!45146) b!264039))

(assert (= (and d!63615 (not c!45146)) b!264040))

(assert (= (and b!264040 c!45147) b!264041))

(assert (= (and b!264040 (not c!45147)) b!264042))

(declare-fun m!280389 () Bool)

(assert (=> b!264041 m!280389))

(assert (=> b!263226 d!63615))

(assert (=> d!63131 d!63085))

(declare-fun d!63617 () Bool)

(declare-fun e!171063 () Bool)

(assert (=> d!63617 e!171063))

(declare-fun res!128851 () Bool)

(assert (=> d!63617 (=> res!128851 e!171063)))

(declare-fun lt!133561 () Bool)

(assert (=> d!63617 (= res!128851 (not lt!133561))))

(declare-fun lt!133559 () Bool)

(assert (=> d!63617 (= lt!133561 lt!133559)))

(declare-fun lt!133558 () Unit!8136)

(declare-fun e!171064 () Unit!8136)

(assert (=> d!63617 (= lt!133558 e!171064)))

(declare-fun c!45148 () Bool)

(assert (=> d!63617 (= c!45148 lt!133559)))

(assert (=> d!63617 (= lt!133559 (containsKey!310 (toList!1927 lt!133259) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63617 (= (contains!1889 lt!133259 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133561)))

(declare-fun b!264043 () Bool)

(declare-fun lt!133560 () Unit!8136)

(assert (=> b!264043 (= e!171064 lt!133560)))

(assert (=> b!264043 (= lt!133560 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133259) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> b!264043 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133259) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!264044 () Bool)

(declare-fun Unit!8190 () Unit!8136)

(assert (=> b!264044 (= e!171064 Unit!8190)))

(declare-fun b!264045 () Bool)

(assert (=> b!264045 (= e!171063 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133259) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63617 c!45148) b!264043))

(assert (= (and d!63617 (not c!45148)) b!264044))

(assert (= (and d!63617 (not res!128851)) b!264045))

(declare-fun m!280391 () Bool)

(assert (=> d!63617 m!280391))

(declare-fun m!280393 () Bool)

(assert (=> b!264043 m!280393))

(assert (=> b!264043 m!279285))

(assert (=> b!264043 m!279285))

(declare-fun m!280395 () Bool)

(assert (=> b!264043 m!280395))

(assert (=> b!264045 m!279285))

(assert (=> b!264045 m!279285))

(assert (=> b!264045 m!280395))

(assert (=> d!63137 d!63617))

(declare-fun b!264047 () Bool)

(declare-fun e!171065 () Option!324)

(declare-fun e!171066 () Option!324)

(assert (=> b!264047 (= e!171065 e!171066)))

(declare-fun c!45150 () Bool)

(assert (=> b!264047 (= c!45150 (and ((_ is Cons!3813) lt!133258) (not (= (_1!2471 (h!4479 lt!133258)) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun b!264049 () Bool)

(assert (=> b!264049 (= e!171066 None!322)))

(declare-fun d!63619 () Bool)

(declare-fun c!45149 () Bool)

(assert (=> d!63619 (= c!45149 (and ((_ is Cons!3813) lt!133258) (= (_1!2471 (h!4479 lt!133258)) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63619 (= (getValueByKey!318 lt!133258 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) e!171065)))

(declare-fun b!264046 () Bool)

(assert (=> b!264046 (= e!171065 (Some!323 (_2!2471 (h!4479 lt!133258))))))

(declare-fun b!264048 () Bool)

(assert (=> b!264048 (= e!171066 (getValueByKey!318 (t!8885 lt!133258) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63619 c!45149) b!264046))

(assert (= (and d!63619 (not c!45149)) b!264047))

(assert (= (and b!264047 c!45150) b!264048))

(assert (= (and b!264047 (not c!45150)) b!264049))

(declare-fun m!280397 () Bool)

(assert (=> b!264048 m!280397))

(assert (=> d!63137 d!63619))

(declare-fun d!63621 () Bool)

(assert (=> d!63621 (= (getValueByKey!318 lt!133258 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133562 () Unit!8136)

(assert (=> d!63621 (= lt!133562 (choose!1303 lt!133258 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun e!171067 () Bool)

(assert (=> d!63621 e!171067))

(declare-fun res!128852 () Bool)

(assert (=> d!63621 (=> (not res!128852) (not e!171067))))

(assert (=> d!63621 (= res!128852 (isStrictlySorted!372 lt!133258))))

(assert (=> d!63621 (= (lemmaContainsTupThenGetReturnValue!177 lt!133258 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133562)))

(declare-fun b!264050 () Bool)

(declare-fun res!128853 () Bool)

(assert (=> b!264050 (=> (not res!128853) (not e!171067))))

(assert (=> b!264050 (= res!128853 (containsKey!310 lt!133258 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!264051 () Bool)

(assert (=> b!264051 (= e!171067 (contains!1893 lt!133258 (tuple2!4921 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63621 res!128852) b!264050))

(assert (= (and b!264050 res!128853) b!264051))

(assert (=> d!63621 m!279279))

(declare-fun m!280399 () Bool)

(assert (=> d!63621 m!280399))

(declare-fun m!280401 () Bool)

(assert (=> d!63621 m!280401))

(declare-fun m!280403 () Bool)

(assert (=> b!264050 m!280403))

(declare-fun m!280405 () Bool)

(assert (=> b!264051 m!280405))

(assert (=> d!63137 d!63621))

(declare-fun b!264052 () Bool)

(declare-fun e!171069 () List!3817)

(declare-fun call!25259 () List!3817)

(assert (=> b!264052 (= e!171069 call!25259)))

(declare-fun b!264053 () Bool)

(declare-fun e!171071 () List!3817)

(declare-fun call!25260 () List!3817)

(assert (=> b!264053 (= e!171071 call!25260)))

(declare-fun b!264054 () Bool)

(declare-fun c!45153 () Bool)

(declare-fun e!171072 () List!3817)

(declare-fun c!45152 () Bool)

(assert (=> b!264054 (= e!171072 (ite c!45153 (t!8885 (toList!1927 call!25146)) (ite c!45152 (Cons!3813 (h!4479 (toList!1927 call!25146)) (t!8885 (toList!1927 call!25146))) Nil!3814)))))

(declare-fun b!264055 () Bool)

(declare-fun e!171068 () Bool)

(declare-fun lt!133563 () List!3817)

(assert (=> b!264055 (= e!171068 (contains!1893 lt!133563 (tuple2!4921 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun bm!25256 () Bool)

(declare-fun call!25261 () List!3817)

(assert (=> bm!25256 (= call!25261 call!25259)))

(declare-fun b!264056 () Bool)

(declare-fun res!128855 () Bool)

(assert (=> b!264056 (=> (not res!128855) (not e!171068))))

(assert (=> b!264056 (= res!128855 (containsKey!310 lt!133563 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!264057 () Bool)

(assert (=> b!264057 (= e!171071 call!25260)))

(declare-fun b!264058 () Bool)

(assert (=> b!264058 (= e!171072 (insertStrictlySorted!180 (t!8885 (toList!1927 call!25146)) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun d!63623 () Bool)

(assert (=> d!63623 e!171068))

(declare-fun res!128854 () Bool)

(assert (=> d!63623 (=> (not res!128854) (not e!171068))))

(assert (=> d!63623 (= res!128854 (isStrictlySorted!372 lt!133563))))

(assert (=> d!63623 (= lt!133563 e!171069)))

(declare-fun c!45154 () Bool)

(assert (=> d!63623 (= c!45154 (and ((_ is Cons!3813) (toList!1927 call!25146)) (bvslt (_1!2471 (h!4479 (toList!1927 call!25146))) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63623 (isStrictlySorted!372 (toList!1927 call!25146))))

(assert (=> d!63623 (= (insertStrictlySorted!180 (toList!1927 call!25146) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133563)))

(declare-fun b!264059 () Bool)

(assert (=> b!264059 (= c!45152 (and ((_ is Cons!3813) (toList!1927 call!25146)) (bvsgt (_1!2471 (h!4479 (toList!1927 call!25146))) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun e!171070 () List!3817)

(assert (=> b!264059 (= e!171070 e!171071)))

(declare-fun bm!25257 () Bool)

(assert (=> bm!25257 (= call!25259 ($colon$colon!107 e!171072 (ite c!45154 (h!4479 (toList!1927 call!25146)) (tuple2!4921 (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun c!45151 () Bool)

(assert (=> bm!25257 (= c!45151 c!45154)))

(declare-fun bm!25258 () Bool)

(assert (=> bm!25258 (= call!25260 call!25261)))

(declare-fun b!264060 () Bool)

(assert (=> b!264060 (= e!171070 call!25261)))

(declare-fun b!264061 () Bool)

(assert (=> b!264061 (= e!171069 e!171070)))

(assert (=> b!264061 (= c!45153 (and ((_ is Cons!3813) (toList!1927 call!25146)) (= (_1!2471 (h!4479 (toList!1927 call!25146))) (_1!2471 (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63623 c!45154) b!264052))

(assert (= (and d!63623 (not c!45154)) b!264061))

(assert (= (and b!264061 c!45153) b!264060))

(assert (= (and b!264061 (not c!45153)) b!264059))

(assert (= (and b!264059 c!45152) b!264057))

(assert (= (and b!264059 (not c!45152)) b!264053))

(assert (= (or b!264057 b!264053) bm!25258))

(assert (= (or b!264060 bm!25258) bm!25256))

(assert (= (or b!264052 bm!25256) bm!25257))

(assert (= (and bm!25257 c!45151) b!264058))

(assert (= (and bm!25257 (not c!45151)) b!264054))

(assert (= (and d!63623 res!128854) b!264056))

(assert (= (and b!264056 res!128855) b!264055))

(declare-fun m!280407 () Bool)

(assert (=> b!264058 m!280407))

(declare-fun m!280409 () Bool)

(assert (=> bm!25257 m!280409))

(declare-fun m!280411 () Bool)

(assert (=> b!264055 m!280411))

(declare-fun m!280413 () Bool)

(assert (=> b!264056 m!280413))

(declare-fun m!280415 () Bool)

(assert (=> d!63623 m!280415))

(declare-fun m!280417 () Bool)

(assert (=> d!63623 m!280417))

(assert (=> d!63137 d!63623))

(declare-fun d!63625 () Bool)

(declare-fun lt!133564 () Bool)

(assert (=> d!63625 (= lt!133564 (select (content!176 (toList!1927 lt!133303)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(declare-fun e!171074 () Bool)

(assert (=> d!63625 (= lt!133564 e!171074)))

(declare-fun res!128857 () Bool)

(assert (=> d!63625 (=> (not res!128857) (not e!171074))))

(assert (=> d!63625 (= res!128857 ((_ is Cons!3813) (toList!1927 lt!133303)))))

(assert (=> d!63625 (= (contains!1893 (toList!1927 lt!133303) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) lt!133564)))

(declare-fun b!264062 () Bool)

(declare-fun e!171073 () Bool)

(assert (=> b!264062 (= e!171074 e!171073)))

(declare-fun res!128856 () Bool)

(assert (=> b!264062 (=> res!128856 e!171073)))

(assert (=> b!264062 (= res!128856 (= (h!4479 (toList!1927 lt!133303)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(declare-fun b!264063 () Bool)

(assert (=> b!264063 (= e!171073 (contains!1893 (t!8885 (toList!1927 lt!133303)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(assert (= (and d!63625 res!128857) b!264062))

(assert (= (and b!264062 (not res!128856)) b!264063))

(declare-fun m!280419 () Bool)

(assert (=> d!63625 m!280419))

(declare-fun m!280421 () Bool)

(assert (=> d!63625 m!280421))

(declare-fun m!280423 () Bool)

(assert (=> b!264063 m!280423))

(assert (=> b!263434 d!63625))

(declare-fun d!63627 () Bool)

(declare-fun isEmpty!546 (List!3817) Bool)

(assert (=> d!63627 (= (isEmpty!545 lt!133188) (isEmpty!546 (toList!1927 lt!133188)))))

(declare-fun bs!9289 () Bool)

(assert (= bs!9289 d!63627))

(declare-fun m!280425 () Bool)

(assert (=> bs!9289 m!280425))

(assert (=> b!263261 d!63627))

(declare-fun d!63629 () Bool)

(assert (=> d!63629 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133003) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!133565 () Unit!8136)

(assert (=> d!63629 (= lt!133565 (choose!1300 (toList!1927 lt!133003) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171075 () Bool)

(assert (=> d!63629 e!171075))

(declare-fun res!128858 () Bool)

(assert (=> d!63629 (=> (not res!128858) (not e!171075))))

(assert (=> d!63629 (= res!128858 (isStrictlySorted!372 (toList!1927 lt!133003)))))

(assert (=> d!63629 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133003) #b1000000000000000000000000000000000000000000000000000000000000000) lt!133565)))

(declare-fun b!264064 () Bool)

(assert (=> b!264064 (= e!171075 (containsKey!310 (toList!1927 lt!133003) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63629 res!128858) b!264064))

(assert (=> d!63629 m!279085))

(assert (=> d!63629 m!279085))

(assert (=> d!63629 m!279307))

(declare-fun m!280427 () Bool)

(assert (=> d!63629 m!280427))

(assert (=> d!63629 m!280231))

(assert (=> b!264064 m!279303))

(assert (=> b!263383 d!63629))

(declare-fun d!63631 () Bool)

(assert (=> d!63631 (= (isDefined!260 (getValueByKey!318 (toList!1927 lt!133003) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!544 (getValueByKey!318 (toList!1927 lt!133003) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!9290 () Bool)

(assert (= bs!9290 d!63631))

(assert (=> bs!9290 m!279085))

(declare-fun m!280429 () Bool)

(assert (=> bs!9290 m!280429))

(assert (=> b!263383 d!63631))

(assert (=> b!263383 d!63487))

(declare-fun d!63633 () Bool)

(assert (=> d!63633 (isDefined!260 (getValueByKey!318 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5992 lt!132768) index!297)))))

(declare-fun lt!133566 () Unit!8136)

(assert (=> d!63633 (= lt!133566 (choose!1300 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5992 lt!132768) index!297)))))

(declare-fun e!171076 () Bool)

(assert (=> d!63633 e!171076))

(declare-fun res!128859 () Bool)

(assert (=> d!63633 (=> (not res!128859) (not e!171076))))

(assert (=> d!63633 (= res!128859 (isStrictlySorted!372 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))))

(assert (=> d!63633 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5992 lt!132768) index!297)) lt!133566)))

(declare-fun b!264065 () Bool)

(assert (=> b!264065 (= e!171076 (containsKey!310 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5992 lt!132768) index!297)))))

(assert (= (and d!63633 res!128859) b!264065))

(assert (=> d!63633 m!278671))

(assert (=> d!63633 m!279371))

(assert (=> d!63633 m!279371))

(assert (=> d!63633 m!279373))

(assert (=> d!63633 m!278671))

(declare-fun m!280431 () Bool)

(assert (=> d!63633 m!280431))

(declare-fun m!280433 () Bool)

(assert (=> d!63633 m!280433))

(assert (=> b!264065 m!278671))

(assert (=> b!264065 m!279367))

(assert (=> b!263425 d!63633))

(declare-fun d!63635 () Bool)

(assert (=> d!63635 (= (isDefined!260 (getValueByKey!318 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5992 lt!132768) index!297))) (not (isEmpty!544 (getValueByKey!318 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5992 lt!132768) index!297)))))))

(declare-fun bs!9291 () Bool)

(assert (= bs!9291 d!63635))

(assert (=> bs!9291 m!279371))

(declare-fun m!280435 () Bool)

(assert (=> bs!9291 m!280435))

(assert (=> b!263425 d!63635))

(declare-fun b!264067 () Bool)

(declare-fun e!171077 () Option!324)

(declare-fun e!171078 () Option!324)

(assert (=> b!264067 (= e!171077 e!171078)))

(declare-fun c!45156 () Bool)

(assert (=> b!264067 (= c!45156 (and ((_ is Cons!3813) (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (not (= (_1!2471 (h!4479 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (select (arr!5992 lt!132768) index!297)))))))

(declare-fun b!264069 () Bool)

(assert (=> b!264069 (= e!171078 None!322)))

(declare-fun d!63637 () Bool)

(declare-fun c!45155 () Bool)

(assert (=> d!63637 (= c!45155 (and ((_ is Cons!3813) (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (= (_1!2471 (h!4479 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (select (arr!5992 lt!132768) index!297))))))

(assert (=> d!63637 (= (getValueByKey!318 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5992 lt!132768) index!297)) e!171077)))

(declare-fun b!264066 () Bool)

(assert (=> b!264066 (= e!171077 (Some!323 (_2!2471 (h!4479 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))))))

(declare-fun b!264068 () Bool)

(assert (=> b!264068 (= e!171078 (getValueByKey!318 (t!8885 (toList!1927 (getCurrentListMap!1436 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (select (arr!5992 lt!132768) index!297)))))

(assert (= (and d!63637 c!45155) b!264066))

(assert (= (and d!63637 (not c!45155)) b!264067))

(assert (= (and b!264067 c!45156) b!264068))

(assert (= (and b!264067 (not c!45156)) b!264069))

(assert (=> b!264068 m!278671))

(declare-fun m!280437 () Bool)

(assert (=> b!264068 m!280437))

(assert (=> b!263425 d!63637))

(declare-fun lt!133567 () Bool)

(declare-fun d!63639 () Bool)

(assert (=> d!63639 (= lt!133567 (select (content!176 (toList!1927 lt!133218)) (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))))))

(declare-fun e!171080 () Bool)

(assert (=> d!63639 (= lt!133567 e!171080)))

(declare-fun res!128861 () Bool)

(assert (=> d!63639 (=> (not res!128861) (not e!171080))))

(assert (=> d!63639 (= res!128861 ((_ is Cons!3813) (toList!1927 lt!133218)))))

(assert (=> d!63639 (= (contains!1893 (toList!1927 lt!133218) (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))) lt!133567)))

(declare-fun b!264070 () Bool)

(declare-fun e!171079 () Bool)

(assert (=> b!264070 (= e!171080 e!171079)))

(declare-fun res!128860 () Bool)

(assert (=> b!264070 (=> res!128860 e!171079)))

(assert (=> b!264070 (= res!128860 (= (h!4479 (toList!1927 lt!133218)) (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))))))

(declare-fun b!264071 () Bool)

(assert (=> b!264071 (= e!171079 (contains!1893 (t!8885 (toList!1927 lt!133218)) (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))))))

(assert (= (and d!63639 res!128861) b!264070))

(assert (= (and b!264070 (not res!128860)) b!264071))

(declare-fun m!280439 () Bool)

(assert (=> d!63639 m!280439))

(declare-fun m!280441 () Bool)

(assert (=> d!63639 m!280441))

(declare-fun m!280443 () Bool)

(assert (=> b!264071 m!280443))

(assert (=> b!263289 d!63639))

(declare-fun d!63641 () Bool)

(declare-fun c!45157 () Bool)

(assert (=> d!63641 (= c!45157 ((_ is Nil!3814) (toList!1927 lt!133073)))))

(declare-fun e!171081 () (InoxSet tuple2!4920))

(assert (=> d!63641 (= (content!176 (toList!1927 lt!133073)) e!171081)))

(declare-fun b!264072 () Bool)

(assert (=> b!264072 (= e!171081 ((as const (Array tuple2!4920 Bool)) false))))

(declare-fun b!264073 () Bool)

(assert (=> b!264073 (= e!171081 ((_ map or) (store ((as const (Array tuple2!4920 Bool)) false) (h!4479 (toList!1927 lt!133073)) true) (content!176 (t!8885 (toList!1927 lt!133073)))))))

(assert (= (and d!63641 c!45157) b!264072))

(assert (= (and d!63641 (not c!45157)) b!264073))

(declare-fun m!280445 () Bool)

(assert (=> b!264073 m!280445))

(assert (=> b!264073 m!279905))

(assert (=> d!63047 d!63641))

(assert (=> b!263564 d!63435))

(declare-fun b!264075 () Bool)

(declare-fun e!171082 () Option!324)

(declare-fun e!171083 () Option!324)

(assert (=> b!264075 (= e!171082 e!171083)))

(declare-fun c!45159 () Bool)

(assert (=> b!264075 (= c!45159 (and ((_ is Cons!3813) (toList!1927 lt!133169)) (not (= (_1!2471 (h!4479 (toList!1927 lt!133169))) (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))))))))

(declare-fun b!264077 () Bool)

(assert (=> b!264077 (= e!171083 None!322)))

(declare-fun c!45158 () Bool)

(declare-fun d!63643 () Bool)

(assert (=> d!63643 (= c!45158 (and ((_ is Cons!3813) (toList!1927 lt!133169)) (= (_1!2471 (h!4479 (toList!1927 lt!133169))) (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63643 (= (getValueByKey!318 (toList!1927 lt!133169) (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))) e!171082)))

(declare-fun b!264074 () Bool)

(assert (=> b!264074 (= e!171082 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!133169)))))))

(declare-fun b!264076 () Bool)

(assert (=> b!264076 (= e!171083 (getValueByKey!318 (t!8885 (toList!1927 lt!133169)) (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))))))

(assert (= (and d!63643 c!45158) b!264074))

(assert (= (and d!63643 (not c!45158)) b!264075))

(assert (= (and b!264075 c!45159) b!264076))

(assert (= (and b!264075 (not c!45159)) b!264077))

(declare-fun m!280447 () Bool)

(assert (=> b!264076 m!280447))

(assert (=> b!263231 d!63643))

(assert (=> d!63141 d!63015))

(declare-fun d!63645 () Bool)

(declare-fun res!128862 () Bool)

(declare-fun e!171084 () Bool)

(assert (=> d!63645 (=> res!128862 e!171084)))

(assert (=> d!63645 (= res!128862 (and ((_ is Cons!3813) (toList!1927 lt!132981)) (= (_1!2471 (h!4479 (toList!1927 lt!132981))) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (=> d!63645 (= (containsKey!310 (toList!1927 lt!132981) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)) e!171084)))

(declare-fun b!264078 () Bool)

(declare-fun e!171085 () Bool)

(assert (=> b!264078 (= e!171084 e!171085)))

(declare-fun res!128863 () Bool)

(assert (=> b!264078 (=> (not res!128863) (not e!171085))))

(assert (=> b!264078 (= res!128863 (and (or (not ((_ is Cons!3813) (toList!1927 lt!132981))) (bvsle (_1!2471 (h!4479 (toList!1927 lt!132981))) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000))) ((_ is Cons!3813) (toList!1927 lt!132981)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!132981))) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun b!264079 () Bool)

(assert (=> b!264079 (= e!171085 (containsKey!310 (t!8885 (toList!1927 lt!132981)) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!63645 (not res!128862)) b!264078))

(assert (= (and b!264078 res!128863) b!264079))

(assert (=> b!264079 m!278517))

(declare-fun m!280449 () Bool)

(assert (=> b!264079 m!280449))

(assert (=> d!63043 d!63645))

(declare-fun d!63647 () Bool)

(declare-fun res!128864 () Bool)

(declare-fun e!171086 () Bool)

(assert (=> d!63647 (=> res!128864 e!171086)))

(assert (=> d!63647 (= res!128864 (and ((_ is Cons!3813) lt!133324) (= (_1!2471 (h!4479 lt!133324)) (_1!2471 lt!132765))))))

(assert (=> d!63647 (= (containsKey!310 lt!133324 (_1!2471 lt!132765)) e!171086)))

(declare-fun b!264080 () Bool)

(declare-fun e!171087 () Bool)

(assert (=> b!264080 (= e!171086 e!171087)))

(declare-fun res!128865 () Bool)

(assert (=> b!264080 (=> (not res!128865) (not e!171087))))

(assert (=> b!264080 (= res!128865 (and (or (not ((_ is Cons!3813) lt!133324)) (bvsle (_1!2471 (h!4479 lt!133324)) (_1!2471 lt!132765))) ((_ is Cons!3813) lt!133324) (bvslt (_1!2471 (h!4479 lt!133324)) (_1!2471 lt!132765))))))

(declare-fun b!264081 () Bool)

(assert (=> b!264081 (= e!171087 (containsKey!310 (t!8885 lt!133324) (_1!2471 lt!132765)))))

(assert (= (and d!63647 (not res!128864)) b!264080))

(assert (= (and b!264080 res!128865) b!264081))

(declare-fun m!280451 () Bool)

(assert (=> b!264081 m!280451))

(assert (=> b!263514 d!63647))

(declare-fun b!264083 () Bool)

(declare-fun e!171088 () Option!324)

(declare-fun e!171089 () Option!324)

(assert (=> b!264083 (= e!171088 e!171089)))

(declare-fun c!45161 () Bool)

(assert (=> b!264083 (= c!45161 (and ((_ is Cons!3813) (toList!1927 lt!133199)) (not (= (_1!2471 (h!4479 (toList!1927 lt!133199))) (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))))))))

(declare-fun b!264085 () Bool)

(assert (=> b!264085 (= e!171089 None!322)))

(declare-fun c!45160 () Bool)

(declare-fun d!63649 () Bool)

(assert (=> d!63649 (= c!45160 (and ((_ is Cons!3813) (toList!1927 lt!133199)) (= (_1!2471 (h!4479 (toList!1927 lt!133199))) (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63649 (= (getValueByKey!318 (toList!1927 lt!133199) (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))) e!171088)))

(declare-fun b!264082 () Bool)

(assert (=> b!264082 (= e!171088 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!133199)))))))

(declare-fun b!264084 () Bool)

(assert (=> b!264084 (= e!171089 (getValueByKey!318 (t!8885 (toList!1927 lt!133199)) (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))))))

(assert (= (and d!63649 c!45160) b!264082))

(assert (= (and d!63649 (not c!45160)) b!264083))

(assert (= (and b!264083 c!45161) b!264084))

(assert (= (and b!264083 (not c!45161)) b!264085))

(declare-fun m!280453 () Bool)

(assert (=> b!264084 m!280453))

(assert (=> b!263277 d!63649))

(assert (=> b!263285 d!63403))

(assert (=> b!263285 d!63405))

(declare-fun b!264087 () Bool)

(declare-fun e!171093 () Bool)

(declare-fun call!25262 () Bool)

(assert (=> b!264087 (= e!171093 call!25262)))

(declare-fun b!264088 () Bool)

(declare-fun e!171092 () Bool)

(declare-fun e!171090 () Bool)

(assert (=> b!264088 (= e!171092 e!171090)))

(declare-fun res!128868 () Bool)

(assert (=> b!264088 (=> (not res!128868) (not e!171090))))

(declare-fun e!171091 () Bool)

(assert (=> b!264088 (= res!128868 (not e!171091))))

(declare-fun res!128867 () Bool)

(assert (=> b!264088 (=> (not res!128867) (not e!171091))))

(assert (=> b!264088 (= res!128867 (validKeyInArray!0 (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun c!45162 () Bool)

(declare-fun bm!25259 () Bool)

(assert (=> bm!25259 (= call!25262 (arrayNoDuplicates!0 (_keys!7033 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!45162 (Cons!3814 (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44890 (Cons!3814 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) Nil!3815) Nil!3815)) (ite c!44890 (Cons!3814 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) Nil!3815) Nil!3815))))))

(declare-fun b!264089 () Bool)

(assert (=> b!264089 (= e!171093 call!25262)))

(declare-fun b!264090 () Bool)

(assert (=> b!264090 (= e!171090 e!171093)))

(assert (=> b!264090 (= c!45162 (validKeyInArray!0 (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!264086 () Bool)

(assert (=> b!264086 (= e!171091 (contains!1892 (ite c!44890 (Cons!3814 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) Nil!3815) Nil!3815) (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63651 () Bool)

(declare-fun res!128866 () Bool)

(assert (=> d!63651 (=> res!128866 e!171092)))

(assert (=> d!63651 (= res!128866 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(assert (=> d!63651 (= (arrayNoDuplicates!0 (_keys!7033 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44890 (Cons!3814 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) Nil!3815) Nil!3815)) e!171092)))

(assert (= (and d!63651 (not res!128866)) b!264088))

(assert (= (and b!264088 res!128867) b!264086))

(assert (= (and b!264088 res!128868) b!264090))

(assert (= (and b!264090 c!45162) b!264089))

(assert (= (and b!264090 (not c!45162)) b!264087))

(assert (= (or b!264089 b!264087) bm!25259))

(assert (=> b!264088 m!278805))

(assert (=> b!264088 m!278805))

(assert (=> b!264088 m!278807))

(assert (=> bm!25259 m!278805))

(declare-fun m!280455 () Bool)

(assert (=> bm!25259 m!280455))

(assert (=> b!264090 m!278805))

(assert (=> b!264090 m!278805))

(assert (=> b!264090 m!278807))

(assert (=> b!264086 m!278805))

(assert (=> b!264086 m!278805))

(declare-fun m!280457 () Bool)

(assert (=> b!264086 m!280457))

(assert (=> bm!25182 d!63651))

(declare-fun d!63653 () Bool)

(declare-fun e!171094 () Bool)

(assert (=> d!63653 e!171094))

(declare-fun res!128869 () Bool)

(assert (=> d!63653 (=> res!128869 e!171094)))

(declare-fun lt!133571 () Bool)

(assert (=> d!63653 (= res!128869 (not lt!133571))))

(declare-fun lt!133569 () Bool)

(assert (=> d!63653 (= lt!133571 lt!133569)))

(declare-fun lt!133568 () Unit!8136)

(declare-fun e!171095 () Unit!8136)

(assert (=> d!63653 (= lt!133568 e!171095)))

(declare-fun c!45163 () Bool)

(assert (=> d!63653 (= c!45163 lt!133569)))

(assert (=> d!63653 (= lt!133569 (containsKey!310 (toList!1927 lt!133169) (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63653 (= (contains!1889 lt!133169 (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))) lt!133571)))

(declare-fun b!264091 () Bool)

(declare-fun lt!133570 () Unit!8136)

(assert (=> b!264091 (= e!171095 lt!133570)))

(assert (=> b!264091 (= lt!133570 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133169) (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))))))

(assert (=> b!264091 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133169) (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!264092 () Bool)

(declare-fun Unit!8191 () Unit!8136)

(assert (=> b!264092 (= e!171095 Unit!8191)))

(declare-fun b!264093 () Bool)

(assert (=> b!264093 (= e!171094 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133169) (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!63653 c!45163) b!264091))

(assert (= (and d!63653 (not c!45163)) b!264092))

(assert (= (and d!63653 (not res!128869)) b!264093))

(declare-fun m!280459 () Bool)

(assert (=> d!63653 m!280459))

(declare-fun m!280461 () Bool)

(assert (=> b!264091 m!280461))

(assert (=> b!264091 m!279041))

(assert (=> b!264091 m!279041))

(declare-fun m!280463 () Bool)

(assert (=> b!264091 m!280463))

(assert (=> b!264093 m!279041))

(assert (=> b!264093 m!279041))

(assert (=> b!264093 m!280463))

(assert (=> d!63075 d!63653))

(declare-fun b!264095 () Bool)

(declare-fun e!171096 () Option!324)

(declare-fun e!171097 () Option!324)

(assert (=> b!264095 (= e!171096 e!171097)))

(declare-fun c!45165 () Bool)

(assert (=> b!264095 (= c!45165 (and ((_ is Cons!3813) lt!133168) (not (= (_1!2471 (h!4479 lt!133168)) (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))))))))

(declare-fun b!264097 () Bool)

(assert (=> b!264097 (= e!171097 None!322)))

(declare-fun c!45164 () Bool)

(declare-fun d!63655 () Bool)

(assert (=> d!63655 (= c!45164 (and ((_ is Cons!3813) lt!133168) (= (_1!2471 (h!4479 lt!133168)) (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63655 (= (getValueByKey!318 lt!133168 (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))) e!171096)))

(declare-fun b!264094 () Bool)

(assert (=> b!264094 (= e!171096 (Some!323 (_2!2471 (h!4479 lt!133168))))))

(declare-fun b!264096 () Bool)

(assert (=> b!264096 (= e!171097 (getValueByKey!318 (t!8885 lt!133168) (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))))))

(assert (= (and d!63655 c!45164) b!264094))

(assert (= (and d!63655 (not c!45164)) b!264095))

(assert (= (and b!264095 c!45165) b!264096))

(assert (= (and b!264095 (not c!45165)) b!264097))

(declare-fun m!280465 () Bool)

(assert (=> b!264096 m!280465))

(assert (=> d!63075 d!63655))

(declare-fun d!63657 () Bool)

(assert (=> d!63657 (= (getValueByKey!318 lt!133168 (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133572 () Unit!8136)

(assert (=> d!63657 (= lt!133572 (choose!1303 lt!133168 (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))))))

(declare-fun e!171098 () Bool)

(assert (=> d!63657 e!171098))

(declare-fun res!128870 () Bool)

(assert (=> d!63657 (=> (not res!128870) (not e!171098))))

(assert (=> d!63657 (= res!128870 (isStrictlySorted!372 lt!133168))))

(assert (=> d!63657 (= (lemmaContainsTupThenGetReturnValue!177 lt!133168 (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))) lt!133572)))

(declare-fun b!264098 () Bool)

(declare-fun res!128871 () Bool)

(assert (=> b!264098 (=> (not res!128871) (not e!171098))))

(assert (=> b!264098 (= res!128871 (containsKey!310 lt!133168 (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!264099 () Bool)

(assert (=> b!264099 (= e!171098 (contains!1893 lt!133168 (tuple2!4921 (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!63657 res!128870) b!264098))

(assert (= (and b!264098 res!128871) b!264099))

(assert (=> d!63657 m!279035))

(declare-fun m!280467 () Bool)

(assert (=> d!63657 m!280467))

(declare-fun m!280469 () Bool)

(assert (=> d!63657 m!280469))

(declare-fun m!280471 () Bool)

(assert (=> b!264098 m!280471))

(declare-fun m!280473 () Bool)

(assert (=> b!264099 m!280473))

(assert (=> d!63075 d!63657))

(declare-fun b!264100 () Bool)

(declare-fun e!171100 () List!3817)

(declare-fun call!25263 () List!3817)

(assert (=> b!264100 (= e!171100 call!25263)))

(declare-fun b!264101 () Bool)

(declare-fun e!171102 () List!3817)

(declare-fun call!25264 () List!3817)

(assert (=> b!264101 (= e!171102 call!25264)))

(declare-fun c!45167 () Bool)

(declare-fun c!45168 () Bool)

(declare-fun b!264102 () Bool)

(declare-fun e!171103 () List!3817)

(assert (=> b!264102 (= e!171103 (ite c!45168 (t!8885 (toList!1927 lt!132993)) (ite c!45167 (Cons!3813 (h!4479 (toList!1927 lt!132993)) (t!8885 (toList!1927 lt!132993))) Nil!3814)))))

(declare-fun b!264103 () Bool)

(declare-fun lt!133573 () List!3817)

(declare-fun e!171099 () Bool)

(assert (=> b!264103 (= e!171099 (contains!1893 lt!133573 (tuple2!4921 (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))))))))

(declare-fun bm!25260 () Bool)

(declare-fun call!25265 () List!3817)

(assert (=> bm!25260 (= call!25265 call!25263)))

(declare-fun b!264104 () Bool)

(declare-fun res!128873 () Bool)

(assert (=> b!264104 (=> (not res!128873) (not e!171099))))

(assert (=> b!264104 (= res!128873 (containsKey!310 lt!133573 (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!264105 () Bool)

(assert (=> b!264105 (= e!171102 call!25264)))

(declare-fun b!264106 () Bool)

(assert (=> b!264106 (= e!171103 (insertStrictlySorted!180 (t!8885 (toList!1927 lt!132993)) (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))))))

(declare-fun d!63659 () Bool)

(assert (=> d!63659 e!171099))

(declare-fun res!128872 () Bool)

(assert (=> d!63659 (=> (not res!128872) (not e!171099))))

(assert (=> d!63659 (= res!128872 (isStrictlySorted!372 lt!133573))))

(assert (=> d!63659 (= lt!133573 e!171100)))

(declare-fun c!45169 () Bool)

(assert (=> d!63659 (= c!45169 (and ((_ is Cons!3813) (toList!1927 lt!132993)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!132993))) (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63659 (isStrictlySorted!372 (toList!1927 lt!132993))))

(assert (=> d!63659 (= (insertStrictlySorted!180 (toList!1927 lt!132993) (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))) lt!133573)))

(declare-fun b!264107 () Bool)

(assert (=> b!264107 (= c!45167 (and ((_ is Cons!3813) (toList!1927 lt!132993)) (bvsgt (_1!2471 (h!4479 (toList!1927 lt!132993))) (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))))))))

(declare-fun e!171101 () List!3817)

(assert (=> b!264107 (= e!171101 e!171102)))

(declare-fun bm!25261 () Bool)

(assert (=> bm!25261 (= call!25263 ($colon$colon!107 e!171103 (ite c!45169 (h!4479 (toList!1927 lt!132993)) (tuple2!4921 (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))))))))

(declare-fun c!45166 () Bool)

(assert (=> bm!25261 (= c!45166 c!45169)))

(declare-fun bm!25262 () Bool)

(assert (=> bm!25262 (= call!25264 call!25265)))

(declare-fun b!264108 () Bool)

(assert (=> b!264108 (= e!171101 call!25265)))

(declare-fun b!264109 () Bool)

(assert (=> b!264109 (= e!171100 e!171101)))

(assert (=> b!264109 (= c!45168 (and ((_ is Cons!3813) (toList!1927 lt!132993)) (= (_1!2471 (h!4479 (toList!1927 lt!132993))) (_1!2471 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!63659 c!45169) b!264100))

(assert (= (and d!63659 (not c!45169)) b!264109))

(assert (= (and b!264109 c!45168) b!264108))

(assert (= (and b!264109 (not c!45168)) b!264107))

(assert (= (and b!264107 c!45167) b!264105))

(assert (= (and b!264107 (not c!45167)) b!264101))

(assert (= (or b!264105 b!264101) bm!25262))

(assert (= (or b!264108 bm!25262) bm!25260))

(assert (= (or b!264100 bm!25260) bm!25261))

(assert (= (and bm!25261 c!45166) b!264106))

(assert (= (and bm!25261 (not c!45166)) b!264102))

(assert (= (and d!63659 res!128872) b!264104))

(assert (= (and b!264104 res!128873) b!264103))

(declare-fun m!280475 () Bool)

(assert (=> b!264106 m!280475))

(declare-fun m!280477 () Bool)

(assert (=> bm!25261 m!280477))

(declare-fun m!280479 () Bool)

(assert (=> b!264103 m!280479))

(declare-fun m!280481 () Bool)

(assert (=> b!264104 m!280481))

(declare-fun m!280483 () Bool)

(assert (=> d!63659 m!280483))

(declare-fun m!280485 () Bool)

(assert (=> d!63659 m!280485))

(assert (=> d!63075 d!63659))

(declare-fun d!63661 () Bool)

(declare-fun lt!133574 () Bool)

(assert (=> d!63661 (= lt!133574 (select (content!176 (toList!1927 lt!133204)) (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))))))

(declare-fun e!171105 () Bool)

(assert (=> d!63661 (= lt!133574 e!171105)))

(declare-fun res!128875 () Bool)

(assert (=> d!63661 (=> (not res!128875) (not e!171105))))

(assert (=> d!63661 (= res!128875 ((_ is Cons!3813) (toList!1927 lt!133204)))))

(assert (=> d!63661 (= (contains!1893 (toList!1927 lt!133204) (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))) lt!133574)))

(declare-fun b!264110 () Bool)

(declare-fun e!171104 () Bool)

(assert (=> b!264110 (= e!171105 e!171104)))

(declare-fun res!128874 () Bool)

(assert (=> b!264110 (=> res!128874 e!171104)))

(assert (=> b!264110 (= res!128874 (= (h!4479 (toList!1927 lt!133204)) (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))))))

(declare-fun b!264111 () Bool)

(assert (=> b!264111 (= e!171104 (contains!1893 (t!8885 (toList!1927 lt!133204)) (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))))))

(assert (= (and d!63661 res!128875) b!264110))

(assert (= (and b!264110 (not res!128874)) b!264111))

(declare-fun m!280487 () Bool)

(assert (=> d!63661 m!280487))

(declare-fun m!280489 () Bool)

(assert (=> d!63661 m!280489))

(declare-fun m!280491 () Bool)

(assert (=> b!264111 m!280491))

(assert (=> b!263281 d!63661))

(declare-fun d!63663 () Bool)

(declare-fun e!171106 () Bool)

(assert (=> d!63663 e!171106))

(declare-fun res!128876 () Bool)

(assert (=> d!63663 (=> res!128876 e!171106)))

(declare-fun lt!133578 () Bool)

(assert (=> d!63663 (= res!128876 (not lt!133578))))

(declare-fun lt!133576 () Bool)

(assert (=> d!63663 (= lt!133578 lt!133576)))

(declare-fun lt!133575 () Unit!8136)

(declare-fun e!171107 () Unit!8136)

(assert (=> d!63663 (= lt!133575 e!171107)))

(declare-fun c!45170 () Bool)

(assert (=> d!63663 (= c!45170 lt!133576)))

(assert (=> d!63663 (= lt!133576 (containsKey!310 (toList!1927 lt!133199) (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63663 (= (contains!1889 lt!133199 (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))) lt!133578)))

(declare-fun b!264112 () Bool)

(declare-fun lt!133577 () Unit!8136)

(assert (=> b!264112 (= e!171107 lt!133577)))

(assert (=> b!264112 (= lt!133577 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133199) (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))))))

(assert (=> b!264112 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133199) (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!264113 () Bool)

(declare-fun Unit!8192 () Unit!8136)

(assert (=> b!264113 (= e!171107 Unit!8192)))

(declare-fun b!264114 () Bool)

(assert (=> b!264114 (= e!171106 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133199) (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!63663 c!45170) b!264112))

(assert (= (and d!63663 (not c!45170)) b!264113))

(assert (= (and d!63663 (not res!128876)) b!264114))

(declare-fun m!280493 () Bool)

(assert (=> d!63663 m!280493))

(declare-fun m!280495 () Bool)

(assert (=> b!264112 m!280495))

(assert (=> b!264112 m!279097))

(assert (=> b!264112 m!279097))

(declare-fun m!280497 () Bool)

(assert (=> b!264112 m!280497))

(assert (=> b!264114 m!279097))

(assert (=> b!264114 m!279097))

(assert (=> b!264114 m!280497))

(assert (=> d!63089 d!63663))

(declare-fun b!264116 () Bool)

(declare-fun e!171108 () Option!324)

(declare-fun e!171109 () Option!324)

(assert (=> b!264116 (= e!171108 e!171109)))

(declare-fun c!45172 () Bool)

(assert (=> b!264116 (= c!45172 (and ((_ is Cons!3813) lt!133198) (not (= (_1!2471 (h!4479 lt!133198)) (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))))))))

(declare-fun b!264118 () Bool)

(assert (=> b!264118 (= e!171109 None!322)))

(declare-fun c!45171 () Bool)

(declare-fun d!63665 () Bool)

(assert (=> d!63665 (= c!45171 (and ((_ is Cons!3813) lt!133198) (= (_1!2471 (h!4479 lt!133198)) (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63665 (= (getValueByKey!318 lt!133198 (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))) e!171108)))

(declare-fun b!264115 () Bool)

(assert (=> b!264115 (= e!171108 (Some!323 (_2!2471 (h!4479 lt!133198))))))

(declare-fun b!264117 () Bool)

(assert (=> b!264117 (= e!171109 (getValueByKey!318 (t!8885 lt!133198) (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))))))

(assert (= (and d!63665 c!45171) b!264115))

(assert (= (and d!63665 (not c!45171)) b!264116))

(assert (= (and b!264116 c!45172) b!264117))

(assert (= (and b!264116 (not c!45172)) b!264118))

(declare-fun m!280499 () Bool)

(assert (=> b!264117 m!280499))

(assert (=> d!63089 d!63665))

(declare-fun d!63667 () Bool)

(assert (=> d!63667 (= (getValueByKey!318 lt!133198 (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133579 () Unit!8136)

(assert (=> d!63667 (= lt!133579 (choose!1303 lt!133198 (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))))))

(declare-fun e!171110 () Bool)

(assert (=> d!63667 e!171110))

(declare-fun res!128877 () Bool)

(assert (=> d!63667 (=> (not res!128877) (not e!171110))))

(assert (=> d!63667 (= res!128877 (isStrictlySorted!372 lt!133198))))

(assert (=> d!63667 (= (lemmaContainsTupThenGetReturnValue!177 lt!133198 (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))) lt!133579)))

(declare-fun b!264119 () Bool)

(declare-fun res!128878 () Bool)

(assert (=> b!264119 (=> (not res!128878) (not e!171110))))

(assert (=> b!264119 (= res!128878 (containsKey!310 lt!133198 (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!264120 () Bool)

(assert (=> b!264120 (= e!171110 (contains!1893 lt!133198 (tuple2!4921 (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!63667 res!128877) b!264119))

(assert (= (and b!264119 res!128878) b!264120))

(assert (=> d!63667 m!279091))

(declare-fun m!280501 () Bool)

(assert (=> d!63667 m!280501))

(declare-fun m!280503 () Bool)

(assert (=> d!63667 m!280503))

(declare-fun m!280505 () Bool)

(assert (=> b!264119 m!280505))

(declare-fun m!280507 () Bool)

(assert (=> b!264120 m!280507))

(assert (=> d!63089 d!63667))

(declare-fun b!264121 () Bool)

(declare-fun e!171112 () List!3817)

(declare-fun call!25266 () List!3817)

(assert (=> b!264121 (= e!171112 call!25266)))

(declare-fun b!264122 () Bool)

(declare-fun e!171114 () List!3817)

(declare-fun call!25267 () List!3817)

(assert (=> b!264122 (= e!171114 call!25267)))

(declare-fun c!45175 () Bool)

(declare-fun c!45174 () Bool)

(declare-fun e!171115 () List!3817)

(declare-fun b!264123 () Bool)

(assert (=> b!264123 (= e!171115 (ite c!45175 (t!8885 (toList!1927 lt!132971)) (ite c!45174 (Cons!3813 (h!4479 (toList!1927 lt!132971)) (t!8885 (toList!1927 lt!132971))) Nil!3814)))))

(declare-fun b!264124 () Bool)

(declare-fun lt!133580 () List!3817)

(declare-fun e!171111 () Bool)

(assert (=> b!264124 (= e!171111 (contains!1893 lt!133580 (tuple2!4921 (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))))))))

(declare-fun bm!25263 () Bool)

(declare-fun call!25268 () List!3817)

(assert (=> bm!25263 (= call!25268 call!25266)))

(declare-fun b!264125 () Bool)

(declare-fun res!128880 () Bool)

(assert (=> b!264125 (=> (not res!128880) (not e!171111))))

(assert (=> b!264125 (= res!128880 (containsKey!310 lt!133580 (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!264126 () Bool)

(assert (=> b!264126 (= e!171114 call!25267)))

(declare-fun b!264127 () Bool)

(assert (=> b!264127 (= e!171115 (insertStrictlySorted!180 (t!8885 (toList!1927 lt!132971)) (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))))))

(declare-fun d!63669 () Bool)

(assert (=> d!63669 e!171111))

(declare-fun res!128879 () Bool)

(assert (=> d!63669 (=> (not res!128879) (not e!171111))))

(assert (=> d!63669 (= res!128879 (isStrictlySorted!372 lt!133580))))

(assert (=> d!63669 (= lt!133580 e!171112)))

(declare-fun c!45176 () Bool)

(assert (=> d!63669 (= c!45176 (and ((_ is Cons!3813) (toList!1927 lt!132971)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!132971))) (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63669 (isStrictlySorted!372 (toList!1927 lt!132971))))

(assert (=> d!63669 (= (insertStrictlySorted!180 (toList!1927 lt!132971) (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))) lt!133580)))

(declare-fun b!264128 () Bool)

(assert (=> b!264128 (= c!45174 (and ((_ is Cons!3813) (toList!1927 lt!132971)) (bvsgt (_1!2471 (h!4479 (toList!1927 lt!132971))) (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))))))))

(declare-fun e!171113 () List!3817)

(assert (=> b!264128 (= e!171113 e!171114)))

(declare-fun bm!25264 () Bool)

(assert (=> bm!25264 (= call!25266 ($colon$colon!107 e!171115 (ite c!45176 (h!4479 (toList!1927 lt!132971)) (tuple2!4921 (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504)))))))))

(declare-fun c!45173 () Bool)

(assert (=> bm!25264 (= c!45173 c!45176)))

(declare-fun bm!25265 () Bool)

(assert (=> bm!25265 (= call!25267 call!25268)))

(declare-fun b!264129 () Bool)

(assert (=> b!264129 (= e!171113 call!25268)))

(declare-fun b!264130 () Bool)

(assert (=> b!264130 (= e!171112 e!171113)))

(assert (=> b!264130 (= c!45175 (and ((_ is Cons!3813) (toList!1927 lt!132971)) (= (_1!2471 (h!4479 (toList!1927 lt!132971))) (_1!2471 (tuple2!4921 lt!132980 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!63669 c!45176) b!264121))

(assert (= (and d!63669 (not c!45176)) b!264130))

(assert (= (and b!264130 c!45175) b!264129))

(assert (= (and b!264130 (not c!45175)) b!264128))

(assert (= (and b!264128 c!45174) b!264126))

(assert (= (and b!264128 (not c!45174)) b!264122))

(assert (= (or b!264126 b!264122) bm!25265))

(assert (= (or b!264129 bm!25265) bm!25263))

(assert (= (or b!264121 bm!25263) bm!25264))

(assert (= (and bm!25264 c!45173) b!264127))

(assert (= (and bm!25264 (not c!45173)) b!264123))

(assert (= (and d!63669 res!128879) b!264125))

(assert (= (and b!264125 res!128880) b!264124))

(declare-fun m!280509 () Bool)

(assert (=> b!264127 m!280509))

(declare-fun m!280511 () Bool)

(assert (=> bm!25264 m!280511))

(declare-fun m!280513 () Bool)

(assert (=> b!264124 m!280513))

(declare-fun m!280515 () Bool)

(assert (=> b!264125 m!280515))

(declare-fun m!280517 () Bool)

(assert (=> d!63669 m!280517))

(declare-fun m!280519 () Bool)

(assert (=> d!63669 m!280519))

(assert (=> d!63089 d!63669))

(declare-fun d!63671 () Bool)

(declare-fun lt!133581 () Bool)

(assert (=> d!63671 (= lt!133581 (select (content!176 lt!133020) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))))))

(declare-fun e!171117 () Bool)

(assert (=> d!63671 (= lt!133581 e!171117)))

(declare-fun res!128882 () Bool)

(assert (=> d!63671 (=> (not res!128882) (not e!171117))))

(assert (=> d!63671 (= res!128882 ((_ is Cons!3813) lt!133020))))

(assert (=> d!63671 (= (contains!1893 lt!133020 (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))) lt!133581)))

(declare-fun b!264131 () Bool)

(declare-fun e!171116 () Bool)

(assert (=> b!264131 (= e!171117 e!171116)))

(declare-fun res!128881 () Bool)

(assert (=> b!264131 (=> res!128881 e!171116)))

(assert (=> b!264131 (= res!128881 (= (h!4479 lt!133020) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))))))

(declare-fun b!264132 () Bool)

(assert (=> b!264132 (= e!171116 (contains!1893 (t!8885 lt!133020) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))))))

(assert (= (and d!63671 res!128882) b!264131))

(assert (= (and b!264131 (not res!128881)) b!264132))

(declare-fun m!280521 () Bool)

(assert (=> d!63671 m!280521))

(declare-fun m!280523 () Bool)

(assert (=> d!63671 m!280523))

(declare-fun m!280525 () Bool)

(assert (=> b!264132 m!280525))

(assert (=> b!263489 d!63671))

(declare-fun d!63673 () Bool)

(assert (=> d!63673 (= (apply!262 lt!133245 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)) (get!3088 (getValueByKey!318 (toList!1927 lt!133245) (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000))))))

(declare-fun bs!9292 () Bool)

(assert (= bs!9292 d!63673))

(assert (=> bs!9292 m!278889))

(assert (=> bs!9292 m!279683))

(assert (=> bs!9292 m!279683))

(declare-fun m!280527 () Bool)

(assert (=> bs!9292 m!280527))

(assert (=> b!263318 d!63673))

(declare-fun d!63675 () Bool)

(declare-fun c!45177 () Bool)

(assert (=> d!63675 (= c!45177 ((_ is ValueCellFull!2984) (select (arr!5991 (_values!4825 lt!132778)) #b00000000000000000000000000000000)))))

(declare-fun e!171118 () V!8521)

(assert (=> d!63675 (= (get!3087 (select (arr!5991 (_values!4825 lt!132778)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 lt!132778) #b0000000000000000000000000000000000000000000000000000000000000000)) e!171118)))

(declare-fun b!264133 () Bool)

(assert (=> b!264133 (= e!171118 (get!3089 (select (arr!5991 (_values!4825 lt!132778)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 lt!132778) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264134 () Bool)

(assert (=> b!264134 (= e!171118 (get!3090 (select (arr!5991 (_values!4825 lt!132778)) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 lt!132778) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63675 c!45177) b!264133))

(assert (= (and d!63675 (not c!45177)) b!264134))

(assert (=> b!264133 m!279247))

(assert (=> b!264133 m!279249))

(declare-fun m!280529 () Bool)

(assert (=> b!264133 m!280529))

(assert (=> b!264134 m!279247))

(assert (=> b!264134 m!279249))

(declare-fun m!280531 () Bool)

(assert (=> b!264134 m!280531))

(assert (=> b!263318 d!63675))

(assert (=> d!63175 d!63177))

(assert (=> d!63175 d!63179))

(declare-fun d!63677 () Bool)

(assert (=> d!63677 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132763) key!932))))

(assert (=> d!63677 true))

(declare-fun _$12!454 () Unit!8136)

(assert (=> d!63677 (= (choose!1300 (toList!1927 lt!132763) key!932) _$12!454)))

(declare-fun bs!9293 () Bool)

(assert (= bs!9293 d!63677))

(assert (=> bs!9293 m!278525))

(assert (=> bs!9293 m!278525))

(assert (=> bs!9293 m!278527))

(assert (=> d!63175 d!63677))

(assert (=> d!63175 d!63529))

(assert (=> d!63013 d!63183))

(assert (=> d!63013 d!62945))

(declare-fun d!63679 () Bool)

(assert (=> d!63679 (= (validKeyInArray!0 (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263123 d!63679))

(assert (=> d!63217 d!63215))

(declare-fun d!63681 () Bool)

(assert (=> d!63681 (= (getValueByKey!318 lt!133072 (_1!2471 lt!132765)) (Some!323 (_2!2471 lt!132765)))))

(assert (=> d!63681 true))

(declare-fun _$22!543 () Unit!8136)

(assert (=> d!63681 (= (choose!1303 lt!133072 (_1!2471 lt!132765) (_2!2471 lt!132765)) _$22!543)))

(declare-fun bs!9294 () Bool)

(assert (= bs!9294 d!63681))

(assert (=> bs!9294 m!278755))

(assert (=> d!63217 d!63681))

(declare-fun d!63683 () Bool)

(declare-fun res!128883 () Bool)

(declare-fun e!171119 () Bool)

(assert (=> d!63683 (=> res!128883 e!171119)))

(assert (=> d!63683 (= res!128883 (or ((_ is Nil!3814) lt!133072) ((_ is Nil!3814) (t!8885 lt!133072))))))

(assert (=> d!63683 (= (isStrictlySorted!372 lt!133072) e!171119)))

(declare-fun b!264135 () Bool)

(declare-fun e!171120 () Bool)

(assert (=> b!264135 (= e!171119 e!171120)))

(declare-fun res!128884 () Bool)

(assert (=> b!264135 (=> (not res!128884) (not e!171120))))

(assert (=> b!264135 (= res!128884 (bvslt (_1!2471 (h!4479 lt!133072)) (_1!2471 (h!4479 (t!8885 lt!133072)))))))

(declare-fun b!264136 () Bool)

(assert (=> b!264136 (= e!171120 (isStrictlySorted!372 (t!8885 lt!133072)))))

(assert (= (and d!63683 (not res!128883)) b!264135))

(assert (= (and b!264135 res!128884) b!264136))

(declare-fun m!280533 () Bool)

(assert (=> b!264136 m!280533))

(assert (=> d!63217 d!63683))

(assert (=> b!263548 d!63431))

(declare-fun d!63685 () Bool)

(assert (=> d!63685 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133003) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!133582 () Unit!8136)

(assert (=> d!63685 (= lt!133582 (choose!1300 (toList!1927 lt!133003) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171121 () Bool)

(assert (=> d!63685 e!171121))

(declare-fun res!128885 () Bool)

(assert (=> d!63685 (=> (not res!128885) (not e!171121))))

(assert (=> d!63685 (= res!128885 (isStrictlySorted!372 (toList!1927 lt!133003)))))

(assert (=> d!63685 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133003) #b0000000000000000000000000000000000000000000000000000000000000000) lt!133582)))

(declare-fun b!264137 () Bool)

(assert (=> b!264137 (= e!171121 (containsKey!310 (toList!1927 lt!133003) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63685 res!128885) b!264137))

(assert (=> d!63685 m!278961))

(assert (=> d!63685 m!278961))

(assert (=> d!63685 m!279347))

(declare-fun m!280535 () Bool)

(assert (=> d!63685 m!280535))

(assert (=> d!63685 m!280231))

(assert (=> b!264137 m!279343))

(assert (=> b!263414 d!63685))

(declare-fun d!63687 () Bool)

(assert (=> d!63687 (= (isDefined!260 (getValueByKey!318 (toList!1927 lt!133003) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!544 (getValueByKey!318 (toList!1927 lt!133003) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!9295 () Bool)

(assert (= bs!9295 d!63687))

(assert (=> bs!9295 m!278961))

(declare-fun m!280537 () Bool)

(assert (=> bs!9295 m!280537))

(assert (=> b!263414 d!63687))

(assert (=> b!263414 d!63443))

(declare-fun b!264139 () Bool)

(declare-fun e!171122 () Option!324)

(declare-fun e!171123 () Option!324)

(assert (=> b!264139 (= e!171122 e!171123)))

(declare-fun c!45179 () Bool)

(assert (=> b!264139 (= c!45179 (and ((_ is Cons!3813) (toList!1927 lt!133194)) (not (= (_1!2471 (h!4479 (toList!1927 lt!133194))) (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))))))))

(declare-fun b!264141 () Bool)

(assert (=> b!264141 (= e!171123 None!322)))

(declare-fun d!63689 () Bool)

(declare-fun c!45178 () Bool)

(assert (=> d!63689 (= c!45178 (and ((_ is Cons!3813) (toList!1927 lt!133194)) (= (_1!2471 (h!4479 (toList!1927 lt!133194))) (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))))))))

(assert (=> d!63689 (= (getValueByKey!318 (toList!1927 lt!133194) (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))) e!171122)))

(declare-fun b!264138 () Bool)

(assert (=> b!264138 (= e!171122 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!133194)))))))

(declare-fun b!264140 () Bool)

(assert (=> b!264140 (= e!171123 (getValueByKey!318 (t!8885 (toList!1927 lt!133194)) (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63689 c!45178) b!264138))

(assert (= (and d!63689 (not c!45178)) b!264139))

(assert (= (and b!264139 c!45179) b!264140))

(assert (= (and b!264139 (not c!45179)) b!264141))

(declare-fun m!280539 () Bool)

(assert (=> b!264140 m!280539))

(assert (=> b!263269 d!63689))

(declare-fun b!264142 () Bool)

(declare-fun e!171129 () Bool)

(declare-fun e!171127 () Bool)

(assert (=> b!264142 (= e!171129 e!171127)))

(assert (=> b!264142 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 lt!132768)))))

(declare-fun res!128887 () Bool)

(declare-fun lt!133585 () ListLongMap!3823)

(assert (=> b!264142 (= res!128887 (contains!1889 lt!133585 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!264142 (=> (not res!128887) (not e!171127))))

(declare-fun b!264143 () Bool)

(declare-fun e!171124 () Bool)

(assert (=> b!264143 (= e!171124 (= lt!133585 (getCurrentListMapNoExtraKeys!578 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504))))))

(declare-fun b!264144 () Bool)

(assert (=> b!264144 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 lt!132768)))))

(assert (=> b!264144 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6343 lt!132766)))))

(assert (=> b!264144 (= e!171127 (= (apply!262 lt!133585 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!3087 (select (arr!5991 lt!132766) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!264145 () Bool)

(declare-fun e!171126 () ListLongMap!3823)

(assert (=> b!264145 (= e!171126 (ListLongMap!3824 Nil!3814))))

(declare-fun b!264146 () Bool)

(assert (=> b!264146 (= e!171124 (isEmpty!545 lt!133585))))

(declare-fun b!264147 () Bool)

(assert (=> b!264147 (= e!171129 e!171124)))

(declare-fun c!45182 () Bool)

(assert (=> b!264147 (= c!45182 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 lt!132768)))))

(declare-fun b!264148 () Bool)

(declare-fun res!128886 () Bool)

(declare-fun e!171130 () Bool)

(assert (=> b!264148 (=> (not res!128886) (not e!171130))))

(assert (=> b!264148 (= res!128886 (not (contains!1889 lt!133585 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264149 () Bool)

(declare-fun lt!133589 () Unit!8136)

(declare-fun lt!133587 () Unit!8136)

(assert (=> b!264149 (= lt!133589 lt!133587)))

(declare-fun lt!133588 () (_ BitVec 64))

(declare-fun lt!133584 () ListLongMap!3823)

(declare-fun lt!133583 () V!8521)

(declare-fun lt!133586 () (_ BitVec 64))

(assert (=> b!264149 (not (contains!1889 (+!713 lt!133584 (tuple2!4921 lt!133588 lt!133583)) lt!133586))))

(assert (=> b!264149 (= lt!133587 (addStillNotContains!130 lt!133584 lt!133588 lt!133583 lt!133586))))

(assert (=> b!264149 (= lt!133586 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!264149 (= lt!133583 (get!3087 (select (arr!5991 lt!132766) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!264149 (= lt!133588 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun call!25269 () ListLongMap!3823)

(assert (=> b!264149 (= lt!133584 call!25269)))

(declare-fun e!171125 () ListLongMap!3823)

(assert (=> b!264149 (= e!171125 (+!713 call!25269 (tuple2!4921 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!3087 (select (arr!5991 lt!132766) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!25266 () Bool)

(assert (=> bm!25266 (= call!25269 (getCurrentListMapNoExtraKeys!578 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504)))))

(declare-fun b!264150 () Bool)

(assert (=> b!264150 (= e!171130 e!171129)))

(declare-fun c!45181 () Bool)

(declare-fun e!171128 () Bool)

(assert (=> b!264150 (= c!45181 e!171128)))

(declare-fun res!128888 () Bool)

(assert (=> b!264150 (=> (not res!128888) (not e!171128))))

(assert (=> b!264150 (= res!128888 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 lt!132768)))))

(declare-fun b!264151 () Bool)

(assert (=> b!264151 (= e!171128 (validKeyInArray!0 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!264151 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!264152 () Bool)

(assert (=> b!264152 (= e!171125 call!25269)))

(declare-fun d!63691 () Bool)

(assert (=> d!63691 e!171130))

(declare-fun res!128889 () Bool)

(assert (=> d!63691 (=> (not res!128889) (not e!171130))))

(assert (=> d!63691 (= res!128889 (not (contains!1889 lt!133585 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63691 (= lt!133585 e!171126)))

(declare-fun c!45180 () Bool)

(assert (=> d!63691 (= c!45180 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 lt!132768)))))

(assert (=> d!63691 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!63691 (= (getCurrentListMapNoExtraKeys!578 lt!132768 lt!132766 (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504)) lt!133585)))

(declare-fun b!264153 () Bool)

(assert (=> b!264153 (= e!171126 e!171125)))

(declare-fun c!45183 () Bool)

(assert (=> b!264153 (= c!45183 (validKeyInArray!0 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!63691 c!45180) b!264145))

(assert (= (and d!63691 (not c!45180)) b!264153))

(assert (= (and b!264153 c!45183) b!264149))

(assert (= (and b!264153 (not c!45183)) b!264152))

(assert (= (or b!264149 b!264152) bm!25266))

(assert (= (and d!63691 res!128889) b!264148))

(assert (= (and b!264148 res!128886) b!264150))

(assert (= (and b!264150 res!128888) b!264151))

(assert (= (and b!264150 c!45181) b!264142))

(assert (= (and b!264150 (not c!45181)) b!264147))

(assert (= (and b!264142 res!128887) b!264144))

(assert (= (and b!264147 c!45182) b!264143))

(assert (= (and b!264147 (not c!45182)) b!264146))

(declare-fun b_lambda!8355 () Bool)

(assert (=> (not b_lambda!8355) (not b!264144)))

(assert (=> b!264144 t!8892))

(declare-fun b_and!13943 () Bool)

(assert (= b_and!13941 (and (=> t!8892 result!5425) b_and!13943)))

(declare-fun b_lambda!8357 () Bool)

(assert (=> (not b_lambda!8357) (not b!264149)))

(assert (=> b!264149 t!8892))

(declare-fun b_and!13945 () Bool)

(assert (= b_and!13943 (and (=> t!8892 result!5425) b_and!13945)))

(assert (=> b!264153 m!279299))

(assert (=> b!264153 m!279299))

(assert (=> b!264153 m!279301))

(assert (=> b!264144 m!279299))

(declare-fun m!280541 () Bool)

(assert (=> b!264144 m!280541))

(assert (=> b!264144 m!278569))

(assert (=> b!264144 m!279299))

(declare-fun m!280543 () Bool)

(assert (=> b!264144 m!280543))

(assert (=> b!264144 m!278569))

(declare-fun m!280545 () Bool)

(assert (=> b!264144 m!280545))

(assert (=> b!264144 m!280543))

(declare-fun m!280547 () Bool)

(assert (=> b!264143 m!280547))

(assert (=> b!264151 m!279299))

(assert (=> b!264151 m!279299))

(assert (=> b!264151 m!279301))

(declare-fun m!280549 () Bool)

(assert (=> b!264148 m!280549))

(assert (=> bm!25266 m!280547))

(declare-fun m!280551 () Bool)

(assert (=> d!63691 m!280551))

(assert (=> d!63691 m!278579))

(declare-fun m!280553 () Bool)

(assert (=> b!264146 m!280553))

(declare-fun m!280555 () Bool)

(assert (=> b!264149 m!280555))

(declare-fun m!280557 () Bool)

(assert (=> b!264149 m!280557))

(assert (=> b!264149 m!278569))

(assert (=> b!264149 m!280555))

(declare-fun m!280559 () Bool)

(assert (=> b!264149 m!280559))

(assert (=> b!264149 m!279299))

(assert (=> b!264149 m!280543))

(assert (=> b!264149 m!278569))

(assert (=> b!264149 m!280545))

(declare-fun m!280561 () Bool)

(assert (=> b!264149 m!280561))

(assert (=> b!264149 m!280543))

(assert (=> b!264142 m!279299))

(assert (=> b!264142 m!279299))

(declare-fun m!280563 () Bool)

(assert (=> b!264142 m!280563))

(assert (=> bm!25185 d!63691))

(declare-fun d!63693 () Bool)

(declare-fun lt!133590 () Bool)

(assert (=> d!63693 (= lt!133590 (select (content!176 (toList!1927 lt!133130)) (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun e!171132 () Bool)

(assert (=> d!63693 (= lt!133590 e!171132)))

(declare-fun res!128891 () Bool)

(assert (=> d!63693 (=> (not res!128891) (not e!171132))))

(assert (=> d!63693 (= res!128891 ((_ is Cons!3813) (toList!1927 lt!133130)))))

(assert (=> d!63693 (= (contains!1893 (toList!1927 lt!133130) (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133590)))

(declare-fun b!264154 () Bool)

(declare-fun e!171131 () Bool)

(assert (=> b!264154 (= e!171132 e!171131)))

(declare-fun res!128890 () Bool)

(assert (=> b!264154 (=> res!128890 e!171131)))

(assert (=> b!264154 (= res!128890 (= (h!4479 (toList!1927 lt!133130)) (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!264155 () Bool)

(assert (=> b!264155 (= e!171131 (contains!1893 (t!8885 (toList!1927 lt!133130)) (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63693 res!128891) b!264154))

(assert (= (and b!264154 (not res!128890)) b!264155))

(declare-fun m!280565 () Bool)

(assert (=> d!63693 m!280565))

(declare-fun m!280567 () Bool)

(assert (=> d!63693 m!280567))

(declare-fun m!280569 () Bool)

(assert (=> b!264155 m!280569))

(assert (=> b!263178 d!63693))

(declare-fun d!63695 () Bool)

(declare-fun e!171133 () Bool)

(assert (=> d!63695 e!171133))

(declare-fun res!128892 () Bool)

(assert (=> d!63695 (=> res!128892 e!171133)))

(declare-fun lt!133594 () Bool)

(assert (=> d!63695 (= res!128892 (not lt!133594))))

(declare-fun lt!133592 () Bool)

(assert (=> d!63695 (= lt!133594 lt!133592)))

(declare-fun lt!133591 () Unit!8136)

(declare-fun e!171134 () Unit!8136)

(assert (=> d!63695 (= lt!133591 e!171134)))

(declare-fun c!45184 () Bool)

(assert (=> d!63695 (= c!45184 lt!133592)))

(assert (=> d!63695 (= lt!133592 (containsKey!310 (toList!1927 lt!133117) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63695 (= (contains!1889 lt!133117 #b0000000000000000000000000000000000000000000000000000000000000000) lt!133594)))

(declare-fun b!264156 () Bool)

(declare-fun lt!133593 () Unit!8136)

(assert (=> b!264156 (= e!171134 lt!133593)))

(assert (=> b!264156 (= lt!133593 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133117) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264156 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133117) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264157 () Bool)

(declare-fun Unit!8193 () Unit!8136)

(assert (=> b!264157 (= e!171134 Unit!8193)))

(declare-fun b!264158 () Bool)

(assert (=> b!264158 (= e!171133 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133117) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63695 c!45184) b!264156))

(assert (= (and d!63695 (not c!45184)) b!264157))

(assert (= (and d!63695 (not res!128892)) b!264158))

(declare-fun m!280571 () Bool)

(assert (=> d!63695 m!280571))

(declare-fun m!280573 () Bool)

(assert (=> b!264156 m!280573))

(declare-fun m!280575 () Bool)

(assert (=> b!264156 m!280575))

(assert (=> b!264156 m!280575))

(declare-fun m!280577 () Bool)

(assert (=> b!264156 m!280577))

(assert (=> b!264158 m!280575))

(assert (=> b!264158 m!280575))

(assert (=> b!264158 m!280577))

(assert (=> bm!25174 d!63695))

(declare-fun d!63697 () Bool)

(assert (=> d!63697 (= ($colon$colon!107 e!170747 (ite c!44979 (h!4479 (toList!1927 lt!132763)) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765)))) (Cons!3813 (ite c!44979 (h!4479 (toList!1927 lt!132763)) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))) e!170747))))

(assert (=> bm!25215 d!63697))

(declare-fun d!63699 () Bool)

(assert (=> d!63699 (= (apply!262 lt!133224 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)) (get!3088 (getValueByKey!318 (toList!1927 lt!133224) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9296 () Bool)

(assert (= bs!9296 d!63699))

(assert (=> bs!9296 m!278517))

(assert (=> bs!9296 m!280215))

(assert (=> bs!9296 m!280215))

(declare-fun m!280579 () Bool)

(assert (=> bs!9296 m!280579))

(assert (=> b!263293 d!63699))

(assert (=> b!263293 d!63231))

(declare-fun d!63701 () Bool)

(declare-fun res!128893 () Bool)

(declare-fun e!171135 () Bool)

(assert (=> d!63701 (=> res!128893 e!171135)))

(assert (=> d!63701 (= res!128893 (= (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!63701 (= (arrayContainsKey!0 (_keys!7033 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) e!171135)))

(declare-fun b!264159 () Bool)

(declare-fun e!171136 () Bool)

(assert (=> b!264159 (= e!171135 e!171136)))

(declare-fun res!128894 () Bool)

(assert (=> b!264159 (=> (not res!128894) (not e!171136))))

(assert (=> b!264159 (= res!128894 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun b!264160 () Bool)

(assert (=> b!264160 (= e!171136 (arrayContainsKey!0 (_keys!7033 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!63701 (not res!128893)) b!264159))

(assert (= (and b!264159 res!128894) b!264160))

(declare-fun m!280581 () Bool)

(assert (=> d!63701 m!280581))

(declare-fun m!280583 () Bool)

(assert (=> b!264160 m!280583))

(assert (=> b!263436 d!63701))

(assert (=> d!63063 d!63073))

(assert (=> d!63063 d!63061))

(declare-fun d!63703 () Bool)

(assert (=> d!63703 (contains!1889 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))) lt!132992)))

(assert (=> d!63703 true))

(declare-fun _$35!421 () Unit!8136)

(assert (=> d!63703 (= (choose!1302 lt!132999 lt!132996 (zeroValue!4683 thiss!1504) lt!132992) _$35!421)))

(declare-fun bs!9297 () Bool)

(assert (= bs!9297 d!63703))

(assert (=> bs!9297 m!278603))

(assert (=> bs!9297 m!278603))

(assert (=> bs!9297 m!278613))

(assert (=> d!63063 d!63703))

(declare-fun d!63705 () Bool)

(declare-fun e!171137 () Bool)

(assert (=> d!63705 e!171137))

(declare-fun res!128895 () Bool)

(assert (=> d!63705 (=> res!128895 e!171137)))

(declare-fun lt!133598 () Bool)

(assert (=> d!63705 (= res!128895 (not lt!133598))))

(declare-fun lt!133596 () Bool)

(assert (=> d!63705 (= lt!133598 lt!133596)))

(declare-fun lt!133595 () Unit!8136)

(declare-fun e!171138 () Unit!8136)

(assert (=> d!63705 (= lt!133595 e!171138)))

(declare-fun c!45185 () Bool)

(assert (=> d!63705 (= c!45185 lt!133596)))

(assert (=> d!63705 (= lt!133596 (containsKey!310 (toList!1927 lt!132999) lt!132992))))

(assert (=> d!63705 (= (contains!1889 lt!132999 lt!132992) lt!133598)))

(declare-fun b!264161 () Bool)

(declare-fun lt!133597 () Unit!8136)

(assert (=> b!264161 (= e!171138 lt!133597)))

(assert (=> b!264161 (= lt!133597 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!132999) lt!132992))))

(assert (=> b!264161 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132999) lt!132992))))

(declare-fun b!264162 () Bool)

(declare-fun Unit!8194 () Unit!8136)

(assert (=> b!264162 (= e!171138 Unit!8194)))

(declare-fun b!264163 () Bool)

(assert (=> b!264163 (= e!171137 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132999) lt!132992)))))

(assert (= (and d!63705 c!45185) b!264161))

(assert (= (and d!63705 (not c!45185)) b!264162))

(assert (= (and d!63705 (not res!128895)) b!264163))

(declare-fun m!280585 () Bool)

(assert (=> d!63705 m!280585))

(declare-fun m!280587 () Bool)

(assert (=> b!264161 m!280587))

(declare-fun m!280589 () Bool)

(assert (=> b!264161 m!280589))

(assert (=> b!264161 m!280589))

(declare-fun m!280591 () Bool)

(assert (=> b!264161 m!280591))

(assert (=> b!264163 m!280589))

(assert (=> b!264163 m!280589))

(assert (=> b!264163 m!280591))

(assert (=> d!63063 d!63705))

(assert (=> b!263207 d!63539))

(assert (=> b!263207 d!63311))

(assert (=> b!263400 d!63543))

(assert (=> b!263400 d!63385))

(declare-fun d!63707 () Bool)

(assert (=> d!63707 (= (get!3090 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263555 d!63707))

(declare-fun d!63709 () Bool)

(declare-fun e!171139 () Bool)

(assert (=> d!63709 e!171139))

(declare-fun res!128896 () Bool)

(assert (=> d!63709 (=> res!128896 e!171139)))

(declare-fun lt!133602 () Bool)

(assert (=> d!63709 (= res!128896 (not lt!133602))))

(declare-fun lt!133600 () Bool)

(assert (=> d!63709 (= lt!133602 lt!133600)))

(declare-fun lt!133599 () Unit!8136)

(declare-fun e!171140 () Unit!8136)

(assert (=> d!63709 (= lt!133599 e!171140)))

(declare-fun c!45186 () Bool)

(assert (=> d!63709 (= c!45186 lt!133600)))

(assert (=> d!63709 (= lt!133600 (containsKey!310 (toList!1927 lt!133224) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63709 (= (contains!1889 lt!133224 #b0000000000000000000000000000000000000000000000000000000000000000) lt!133602)))

(declare-fun b!264164 () Bool)

(declare-fun lt!133601 () Unit!8136)

(assert (=> b!264164 (= e!171140 lt!133601)))

(assert (=> b!264164 (= lt!133601 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133224) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264164 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133224) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264165 () Bool)

(declare-fun Unit!8195 () Unit!8136)

(assert (=> b!264165 (= e!171140 Unit!8195)))

(declare-fun b!264166 () Bool)

(assert (=> b!264166 (= e!171139 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133224) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63709 c!45186) b!264164))

(assert (= (and d!63709 (not c!45186)) b!264165))

(assert (= (and d!63709 (not res!128896)) b!264166))

(declare-fun m!280593 () Bool)

(assert (=> d!63709 m!280593))

(declare-fun m!280595 () Bool)

(assert (=> b!264164 m!280595))

(declare-fun m!280597 () Bool)

(assert (=> b!264164 m!280597))

(assert (=> b!264164 m!280597))

(declare-fun m!280599 () Bool)

(assert (=> b!264164 m!280599))

(assert (=> b!264166 m!280597))

(assert (=> b!264166 m!280597))

(assert (=> b!264166 m!280599))

(assert (=> d!63115 d!63709))

(assert (=> d!63115 d!63015))

(assert (=> b!263405 d!63431))

(assert (=> b!263300 d!63151))

(declare-fun d!63711 () Bool)

(declare-fun res!128897 () Bool)

(declare-fun e!171141 () Bool)

(assert (=> d!63711 (=> res!128897 e!171141)))

(assert (=> d!63711 (= res!128897 (or ((_ is Nil!3814) lt!133334) ((_ is Nil!3814) (t!8885 lt!133334))))))

(assert (=> d!63711 (= (isStrictlySorted!372 lt!133334) e!171141)))

(declare-fun b!264167 () Bool)

(declare-fun e!171142 () Bool)

(assert (=> b!264167 (= e!171141 e!171142)))

(declare-fun res!128898 () Bool)

(assert (=> b!264167 (=> (not res!128898) (not e!171142))))

(assert (=> b!264167 (= res!128898 (bvslt (_1!2471 (h!4479 lt!133334)) (_1!2471 (h!4479 (t!8885 lt!133334)))))))

(declare-fun b!264168 () Bool)

(assert (=> b!264168 (= e!171142 (isStrictlySorted!372 (t!8885 lt!133334)))))

(assert (= (and d!63711 (not res!128897)) b!264167))

(assert (= (and b!264167 res!128898) b!264168))

(declare-fun m!280601 () Bool)

(assert (=> b!264168 m!280601))

(assert (=> d!63219 d!63711))

(declare-fun d!63713 () Bool)

(declare-fun res!128899 () Bool)

(declare-fun e!171143 () Bool)

(assert (=> d!63713 (=> res!128899 e!171143)))

(assert (=> d!63713 (= res!128899 (or ((_ is Nil!3814) (toList!1927 (map!2737 thiss!1504))) ((_ is Nil!3814) (t!8885 (toList!1927 (map!2737 thiss!1504))))))))

(assert (=> d!63713 (= (isStrictlySorted!372 (toList!1927 (map!2737 thiss!1504))) e!171143)))

(declare-fun b!264169 () Bool)

(declare-fun e!171144 () Bool)

(assert (=> b!264169 (= e!171143 e!171144)))

(declare-fun res!128900 () Bool)

(assert (=> b!264169 (=> (not res!128900) (not e!171144))))

(assert (=> b!264169 (= res!128900 (bvslt (_1!2471 (h!4479 (toList!1927 (map!2737 thiss!1504)))) (_1!2471 (h!4479 (t!8885 (toList!1927 (map!2737 thiss!1504)))))))))

(declare-fun b!264170 () Bool)

(assert (=> b!264170 (= e!171144 (isStrictlySorted!372 (t!8885 (toList!1927 (map!2737 thiss!1504)))))))

(assert (= (and d!63713 (not res!128899)) b!264169))

(assert (= (and b!264169 res!128900) b!264170))

(assert (=> b!264170 m!280293))

(assert (=> d!63219 d!63713))

(declare-fun d!63715 () Bool)

(declare-fun e!171145 () Bool)

(assert (=> d!63715 e!171145))

(declare-fun res!128901 () Bool)

(assert (=> d!63715 (=> res!128901 e!171145)))

(declare-fun lt!133606 () Bool)

(assert (=> d!63715 (= res!128901 (not lt!133606))))

(declare-fun lt!133604 () Bool)

(assert (=> d!63715 (= lt!133606 lt!133604)))

(declare-fun lt!133603 () Unit!8136)

(declare-fun e!171146 () Unit!8136)

(assert (=> d!63715 (= lt!133603 e!171146)))

(declare-fun c!45187 () Bool)

(assert (=> d!63715 (= c!45187 lt!133604)))

(assert (=> d!63715 (= lt!133604 (containsKey!310 (toList!1927 lt!133130) (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63715 (= (contains!1889 lt!133130 (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) lt!133606)))

(declare-fun b!264171 () Bool)

(declare-fun lt!133605 () Unit!8136)

(assert (=> b!264171 (= e!171146 lt!133605)))

(assert (=> b!264171 (= lt!133605 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133130) (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> b!264171 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133130) (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!264172 () Bool)

(declare-fun Unit!8196 () Unit!8136)

(assert (=> b!264172 (= e!171146 Unit!8196)))

(declare-fun b!264173 () Bool)

(assert (=> b!264173 (= e!171145 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133130) (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (= (and d!63715 c!45187) b!264171))

(assert (= (and d!63715 (not c!45187)) b!264172))

(assert (= (and d!63715 (not res!128901)) b!264173))

(declare-fun m!280603 () Bool)

(assert (=> d!63715 m!280603))

(declare-fun m!280605 () Bool)

(assert (=> b!264171 m!280605))

(assert (=> b!264171 m!278909))

(assert (=> b!264171 m!278909))

(declare-fun m!280607 () Bool)

(assert (=> b!264171 m!280607))

(assert (=> b!264173 m!278909))

(assert (=> b!264173 m!278909))

(assert (=> b!264173 m!280607))

(assert (=> d!63019 d!63715))

(declare-fun b!264175 () Bool)

(declare-fun e!171147 () Option!324)

(declare-fun e!171148 () Option!324)

(assert (=> b!264175 (= e!171147 e!171148)))

(declare-fun c!45189 () Bool)

(assert (=> b!264175 (= c!45189 (and ((_ is Cons!3813) lt!133129) (not (= (_1!2471 (h!4479 lt!133129)) (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))))

(declare-fun b!264177 () Bool)

(assert (=> b!264177 (= e!171148 None!322)))

(declare-fun c!45188 () Bool)

(declare-fun d!63717 () Bool)

(assert (=> d!63717 (= c!45188 (and ((_ is Cons!3813) lt!133129) (= (_1!2471 (h!4479 lt!133129)) (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (=> d!63717 (= (getValueByKey!318 lt!133129 (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) e!171147)))

(declare-fun b!264174 () Bool)

(assert (=> b!264174 (= e!171147 (Some!323 (_2!2471 (h!4479 lt!133129))))))

(declare-fun b!264176 () Bool)

(assert (=> b!264176 (= e!171148 (getValueByKey!318 (t!8885 lt!133129) (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63717 c!45188) b!264174))

(assert (= (and d!63717 (not c!45188)) b!264175))

(assert (= (and b!264175 c!45189) b!264176))

(assert (= (and b!264175 (not c!45189)) b!264177))

(declare-fun m!280609 () Bool)

(assert (=> b!264176 m!280609))

(assert (=> d!63019 d!63717))

(declare-fun d!63719 () Bool)

(assert (=> d!63719 (= (getValueByKey!318 lt!133129 (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) (Some!323 (_2!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun lt!133607 () Unit!8136)

(assert (=> d!63719 (= lt!133607 (choose!1303 lt!133129 (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun e!171149 () Bool)

(assert (=> d!63719 e!171149))

(declare-fun res!128902 () Bool)

(assert (=> d!63719 (=> (not res!128902) (not e!171149))))

(assert (=> d!63719 (= res!128902 (isStrictlySorted!372 lt!133129))))

(assert (=> d!63719 (= (lemmaContainsTupThenGetReturnValue!177 lt!133129 (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) lt!133607)))

(declare-fun b!264178 () Bool)

(declare-fun res!128903 () Bool)

(assert (=> b!264178 (=> (not res!128903) (not e!171149))))

(assert (=> b!264178 (= res!128903 (containsKey!310 lt!133129 (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!264179 () Bool)

(assert (=> b!264179 (= e!171149 (contains!1893 lt!133129 (tuple2!4921 (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (= (and d!63719 res!128902) b!264178))

(assert (= (and b!264178 res!128903) b!264179))

(assert (=> d!63719 m!278903))

(declare-fun m!280611 () Bool)

(assert (=> d!63719 m!280611))

(declare-fun m!280613 () Bool)

(assert (=> d!63719 m!280613))

(declare-fun m!280615 () Bool)

(assert (=> b!264178 m!280615))

(declare-fun m!280617 () Bool)

(assert (=> b!264179 m!280617))

(assert (=> d!63019 d!63719))

(declare-fun b!264180 () Bool)

(declare-fun e!171151 () List!3817)

(declare-fun call!25270 () List!3817)

(assert (=> b!264180 (= e!171151 call!25270)))

(declare-fun b!264181 () Bool)

(declare-fun e!171153 () List!3817)

(declare-fun call!25271 () List!3817)

(assert (=> b!264181 (= e!171153 call!25271)))

(declare-fun c!45191 () Bool)

(declare-fun c!45192 () Bool)

(declare-fun e!171154 () List!3817)

(declare-fun b!264182 () Bool)

(assert (=> b!264182 (= e!171154 (ite c!45192 (t!8885 (toList!1927 (ite c!44840 call!25159 (ite c!44837 call!25161 call!25158)))) (ite c!45191 (Cons!3813 (h!4479 (toList!1927 (ite c!44840 call!25159 (ite c!44837 call!25161 call!25158)))) (t!8885 (toList!1927 (ite c!44840 call!25159 (ite c!44837 call!25161 call!25158))))) Nil!3814)))))

(declare-fun lt!133608 () List!3817)

(declare-fun b!264183 () Bool)

(declare-fun e!171150 () Bool)

(assert (=> b!264183 (= e!171150 (contains!1893 lt!133608 (tuple2!4921 (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun bm!25267 () Bool)

(declare-fun call!25272 () List!3817)

(assert (=> bm!25267 (= call!25272 call!25270)))

(declare-fun b!264184 () Bool)

(declare-fun res!128905 () Bool)

(assert (=> b!264184 (=> (not res!128905) (not e!171150))))

(assert (=> b!264184 (= res!128905 (containsKey!310 lt!133608 (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!264185 () Bool)

(assert (=> b!264185 (= e!171153 call!25271)))

(declare-fun b!264186 () Bool)

(assert (=> b!264186 (= e!171154 (insertStrictlySorted!180 (t!8885 (toList!1927 (ite c!44840 call!25159 (ite c!44837 call!25161 call!25158)))) (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun d!63721 () Bool)

(assert (=> d!63721 e!171150))

(declare-fun res!128904 () Bool)

(assert (=> d!63721 (=> (not res!128904) (not e!171150))))

(assert (=> d!63721 (= res!128904 (isStrictlySorted!372 lt!133608))))

(assert (=> d!63721 (= lt!133608 e!171151)))

(declare-fun c!45193 () Bool)

(assert (=> d!63721 (= c!45193 (and ((_ is Cons!3813) (toList!1927 (ite c!44840 call!25159 (ite c!44837 call!25161 call!25158)))) (bvslt (_1!2471 (h!4479 (toList!1927 (ite c!44840 call!25159 (ite c!44837 call!25161 call!25158))))) (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (=> d!63721 (isStrictlySorted!372 (toList!1927 (ite c!44840 call!25159 (ite c!44837 call!25161 call!25158))))))

(assert (=> d!63721 (= (insertStrictlySorted!180 (toList!1927 (ite c!44840 call!25159 (ite c!44837 call!25161 call!25158))) (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) lt!133608)))

(declare-fun b!264187 () Bool)

(assert (=> b!264187 (= c!45191 (and ((_ is Cons!3813) (toList!1927 (ite c!44840 call!25159 (ite c!44837 call!25161 call!25158)))) (bvsgt (_1!2471 (h!4479 (toList!1927 (ite c!44840 call!25159 (ite c!44837 call!25161 call!25158))))) (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun e!171152 () List!3817)

(assert (=> b!264187 (= e!171152 e!171153)))

(declare-fun bm!25268 () Bool)

(assert (=> bm!25268 (= call!25270 ($colon$colon!107 e!171154 (ite c!45193 (h!4479 (toList!1927 (ite c!44840 call!25159 (ite c!44837 call!25161 call!25158)))) (tuple2!4921 (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))))

(declare-fun c!45190 () Bool)

(assert (=> bm!25268 (= c!45190 c!45193)))

(declare-fun bm!25269 () Bool)

(assert (=> bm!25269 (= call!25271 call!25272)))

(declare-fun b!264188 () Bool)

(assert (=> b!264188 (= e!171152 call!25272)))

(declare-fun b!264189 () Bool)

(assert (=> b!264189 (= e!171151 e!171152)))

(assert (=> b!264189 (= c!45192 (and ((_ is Cons!3813) (toList!1927 (ite c!44840 call!25159 (ite c!44837 call!25161 call!25158)))) (= (_1!2471 (h!4479 (toList!1927 (ite c!44840 call!25159 (ite c!44837 call!25161 call!25158))))) (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (= (and d!63721 c!45193) b!264180))

(assert (= (and d!63721 (not c!45193)) b!264189))

(assert (= (and b!264189 c!45192) b!264188))

(assert (= (and b!264189 (not c!45192)) b!264187))

(assert (= (and b!264187 c!45191) b!264185))

(assert (= (and b!264187 (not c!45191)) b!264181))

(assert (= (or b!264185 b!264181) bm!25269))

(assert (= (or b!264188 bm!25269) bm!25267))

(assert (= (or b!264180 bm!25267) bm!25268))

(assert (= (and bm!25268 c!45190) b!264186))

(assert (= (and bm!25268 (not c!45190)) b!264182))

(assert (= (and d!63721 res!128904) b!264184))

(assert (= (and b!264184 res!128905) b!264183))

(declare-fun m!280619 () Bool)

(assert (=> b!264186 m!280619))

(declare-fun m!280621 () Bool)

(assert (=> bm!25268 m!280621))

(declare-fun m!280623 () Bool)

(assert (=> b!264183 m!280623))

(declare-fun m!280625 () Bool)

(assert (=> b!264184 m!280625))

(declare-fun m!280627 () Bool)

(assert (=> d!63721 m!280627))

(declare-fun m!280629 () Bool)

(assert (=> d!63721 m!280629))

(assert (=> d!63019 d!63721))

(assert (=> d!63221 d!63015))

(assert (=> bm!25206 d!62929))

(declare-fun b!264190 () Bool)

(declare-fun e!171156 () (_ BitVec 32))

(declare-fun call!25273 () (_ BitVec 32))

(assert (=> b!264190 (= e!171156 call!25273)))

(declare-fun bm!25270 () Bool)

(assert (=> bm!25270 (= call!25273 (arrayCountValidKeys!0 (_keys!7033 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun b!264191 () Bool)

(declare-fun e!171155 () (_ BitVec 32))

(assert (=> b!264191 (= e!171155 e!171156)))

(declare-fun c!45195 () Bool)

(assert (=> b!264191 (= c!45195 (validKeyInArray!0 (select (arr!5992 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!264192 () Bool)

(assert (=> b!264192 (= e!171155 #b00000000000000000000000000000000)))

(declare-fun b!264193 () Bool)

(assert (=> b!264193 (= e!171156 (bvadd #b00000000000000000000000000000001 call!25273))))

(declare-fun d!63723 () Bool)

(declare-fun lt!133609 () (_ BitVec 32))

(assert (=> d!63723 (and (bvsge lt!133609 #b00000000000000000000000000000000) (bvsle lt!133609 (bvsub (size!6344 (_keys!7033 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!63723 (= lt!133609 e!171155)))

(declare-fun c!45194 () Bool)

(assert (=> d!63723 (= c!45194 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(assert (=> d!63723 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6344 (_keys!7033 thiss!1504)) (size!6344 (_keys!7033 thiss!1504))))))

(assert (=> d!63723 (= (arrayCountValidKeys!0 (_keys!7033 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))) lt!133609)))

(assert (= (and d!63723 c!45194) b!264192))

(assert (= (and d!63723 (not c!45194)) b!264191))

(assert (= (and b!264191 c!45195) b!264193))

(assert (= (and b!264191 (not c!45195)) b!264190))

(assert (= (or b!264193 b!264190) bm!25270))

(declare-fun m!280631 () Bool)

(assert (=> bm!25270 m!280631))

(assert (=> b!264191 m!280581))

(assert (=> b!264191 m!280581))

(declare-fun m!280633 () Bool)

(assert (=> b!264191 m!280633))

(assert (=> bm!25173 d!63723))

(assert (=> d!63163 d!62967))

(assert (=> b!263544 d!63495))

(declare-fun b!264194 () Bool)

(declare-fun e!171158 () SeekEntryResult!1193)

(assert (=> b!264194 (= e!171158 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25234 lt!133068) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (index!6944 lt!133068) (x!25234 lt!133068) (mask!11207 thiss!1504)) (bvadd (x!25234 lt!133068) #b00000000000000000000000000000001) (mask!11207 thiss!1504)) (index!6944 lt!133068) key!932 (_keys!7033 thiss!1504) (mask!11207 thiss!1504)))))

(declare-fun b!264195 () Bool)

(assert (=> b!264195 (= e!171158 (MissingVacant!1193 (index!6944 lt!133068)))))

(declare-fun b!264196 () Bool)

(declare-fun c!45197 () Bool)

(declare-fun lt!133610 () (_ BitVec 64))

(assert (=> b!264196 (= c!45197 (= lt!133610 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171157 () SeekEntryResult!1193)

(assert (=> b!264196 (= e!171157 e!171158)))

(declare-fun lt!133611 () SeekEntryResult!1193)

(declare-fun d!63725 () Bool)

(assert (=> d!63725 (and (or ((_ is Undefined!1193) lt!133611) (not ((_ is Found!1193) lt!133611)) (and (bvsge (index!6943 lt!133611) #b00000000000000000000000000000000) (bvslt (index!6943 lt!133611) (size!6344 (_keys!7033 thiss!1504))))) (or ((_ is Undefined!1193) lt!133611) ((_ is Found!1193) lt!133611) (not ((_ is MissingVacant!1193) lt!133611)) (not (= (index!6945 lt!133611) (index!6944 lt!133068))) (and (bvsge (index!6945 lt!133611) #b00000000000000000000000000000000) (bvslt (index!6945 lt!133611) (size!6344 (_keys!7033 thiss!1504))))) (or ((_ is Undefined!1193) lt!133611) (ite ((_ is Found!1193) lt!133611) (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6943 lt!133611)) key!932) (and ((_ is MissingVacant!1193) lt!133611) (= (index!6945 lt!133611) (index!6944 lt!133068)) (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6945 lt!133611)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!171159 () SeekEntryResult!1193)

(assert (=> d!63725 (= lt!133611 e!171159)))

(declare-fun c!45198 () Bool)

(assert (=> d!63725 (= c!45198 (bvsge (bvadd (x!25234 lt!133068) #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!63725 (= lt!133610 (select (arr!5992 (_keys!7033 thiss!1504)) (nextIndex!0 (index!6944 lt!133068) (x!25234 lt!133068) (mask!11207 thiss!1504))))))

(assert (=> d!63725 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!63725 (= (seekKeyOrZeroReturnVacant!0 (bvadd (x!25234 lt!133068) #b00000000000000000000000000000001) (nextIndex!0 (index!6944 lt!133068) (x!25234 lt!133068) (mask!11207 thiss!1504)) (index!6944 lt!133068) key!932 (_keys!7033 thiss!1504) (mask!11207 thiss!1504)) lt!133611)))

(declare-fun b!264197 () Bool)

(assert (=> b!264197 (= e!171159 Undefined!1193)))

(declare-fun b!264198 () Bool)

(assert (=> b!264198 (= e!171159 e!171157)))

(declare-fun c!45196 () Bool)

(assert (=> b!264198 (= c!45196 (= lt!133610 key!932))))

(declare-fun b!264199 () Bool)

(assert (=> b!264199 (= e!171157 (Found!1193 (nextIndex!0 (index!6944 lt!133068) (x!25234 lt!133068) (mask!11207 thiss!1504))))))

(assert (= (and d!63725 c!45198) b!264197))

(assert (= (and d!63725 (not c!45198)) b!264198))

(assert (= (and b!264198 c!45196) b!264199))

(assert (= (and b!264198 (not c!45196)) b!264196))

(assert (= (and b!264196 c!45197) b!264195))

(assert (= (and b!264196 (not c!45197)) b!264194))

(assert (=> b!264194 m!279263))

(declare-fun m!280635 () Bool)

(assert (=> b!264194 m!280635))

(assert (=> b!264194 m!280635))

(declare-fun m!280637 () Bool)

(assert (=> b!264194 m!280637))

(declare-fun m!280639 () Bool)

(assert (=> d!63725 m!280639))

(declare-fun m!280641 () Bool)

(assert (=> d!63725 m!280641))

(assert (=> d!63725 m!279263))

(declare-fun m!280643 () Bool)

(assert (=> d!63725 m!280643))

(assert (=> d!63725 m!278579))

(assert (=> b!263336 d!63725))

(declare-fun d!63727 () Bool)

(declare-fun lt!133612 () (_ BitVec 32))

(assert (=> d!63727 (and (bvsge lt!133612 #b00000000000000000000000000000000) (bvslt lt!133612 (bvadd (mask!11207 thiss!1504) #b00000000000000000000000000000001)))))

(assert (=> d!63727 (= lt!133612 (choose!52 (index!6944 lt!133068) (x!25234 lt!133068) (mask!11207 thiss!1504)))))

(assert (=> d!63727 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!63727 (= (nextIndex!0 (index!6944 lt!133068) (x!25234 lt!133068) (mask!11207 thiss!1504)) lt!133612)))

(declare-fun bs!9298 () Bool)

(assert (= bs!9298 d!63727))

(declare-fun m!280645 () Bool)

(assert (=> bs!9298 m!280645))

(assert (=> bs!9298 m!278579))

(assert (=> b!263336 d!63727))

(declare-fun d!63729 () Bool)

(assert (=> d!63729 (arrayContainsKey!0 (_keys!7033 thiss!1504) lt!133312 #b00000000000000000000000000000000)))

(declare-fun lt!133613 () Unit!8136)

(assert (=> d!63729 (= lt!133613 (choose!13 (_keys!7033 thiss!1504) lt!133312 #b00000000000000000000000000000000))))

(assert (=> d!63729 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!63729 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!7033 thiss!1504) lt!133312 #b00000000000000000000000000000000) lt!133613)))

(declare-fun bs!9299 () Bool)

(assert (= bs!9299 d!63729))

(assert (=> bs!9299 m!279405))

(declare-fun m!280647 () Bool)

(assert (=> bs!9299 m!280647))

(assert (=> b!263467 d!63729))

(declare-fun d!63731 () Bool)

(declare-fun res!128906 () Bool)

(declare-fun e!171160 () Bool)

(assert (=> d!63731 (=> res!128906 e!171160)))

(assert (=> d!63731 (= res!128906 (= (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) lt!133312))))

(assert (=> d!63731 (= (arrayContainsKey!0 (_keys!7033 thiss!1504) lt!133312 #b00000000000000000000000000000000) e!171160)))

(declare-fun b!264200 () Bool)

(declare-fun e!171161 () Bool)

(assert (=> b!264200 (= e!171160 e!171161)))

(declare-fun res!128907 () Bool)

(assert (=> b!264200 (=> (not res!128907) (not e!171161))))

(assert (=> b!264200 (= res!128907 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun b!264201 () Bool)

(assert (=> b!264201 (= e!171161 (arrayContainsKey!0 (_keys!7033 thiss!1504) lt!133312 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63731 (not res!128906)) b!264200))

(assert (= (and b!264200 res!128907) b!264201))

(assert (=> d!63731 m!278517))

(declare-fun m!280649 () Bool)

(assert (=> b!264201 m!280649))

(assert (=> b!263467 d!63731))

(declare-fun b!264202 () Bool)

(declare-fun e!171163 () SeekEntryResult!1193)

(declare-fun lt!133616 () SeekEntryResult!1193)

(assert (=> b!264202 (= e!171163 (MissingZero!1193 (index!6944 lt!133616)))))

(declare-fun d!63733 () Bool)

(declare-fun lt!133614 () SeekEntryResult!1193)

(assert (=> d!63733 (and (or ((_ is Undefined!1193) lt!133614) (not ((_ is Found!1193) lt!133614)) (and (bvsge (index!6943 lt!133614) #b00000000000000000000000000000000) (bvslt (index!6943 lt!133614) (size!6344 (_keys!7033 thiss!1504))))) (or ((_ is Undefined!1193) lt!133614) ((_ is Found!1193) lt!133614) (not ((_ is MissingZero!1193) lt!133614)) (and (bvsge (index!6942 lt!133614) #b00000000000000000000000000000000) (bvslt (index!6942 lt!133614) (size!6344 (_keys!7033 thiss!1504))))) (or ((_ is Undefined!1193) lt!133614) ((_ is Found!1193) lt!133614) ((_ is MissingZero!1193) lt!133614) (not ((_ is MissingVacant!1193) lt!133614)) (and (bvsge (index!6945 lt!133614) #b00000000000000000000000000000000) (bvslt (index!6945 lt!133614) (size!6344 (_keys!7033 thiss!1504))))) (or ((_ is Undefined!1193) lt!133614) (ite ((_ is Found!1193) lt!133614) (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6943 lt!133614)) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1193) lt!133614) (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6942 lt!133614)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1193) lt!133614) (= (select (arr!5992 (_keys!7033 thiss!1504)) (index!6945 lt!133614)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!171162 () SeekEntryResult!1193)

(assert (=> d!63733 (= lt!133614 e!171162)))

(declare-fun c!45200 () Bool)

(assert (=> d!63733 (= c!45200 (and ((_ is Intermediate!1193) lt!133616) (undefined!2005 lt!133616)))))

(assert (=> d!63733 (= lt!133616 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) (mask!11207 thiss!1504)) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) (_keys!7033 thiss!1504) (mask!11207 thiss!1504)))))

(assert (=> d!63733 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!63733 (= (seekEntryOrOpen!0 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) (_keys!7033 thiss!1504) (mask!11207 thiss!1504)) lt!133614)))

(declare-fun b!264203 () Bool)

(declare-fun e!171164 () SeekEntryResult!1193)

(assert (=> b!264203 (= e!171162 e!171164)))

(declare-fun lt!133615 () (_ BitVec 64))

(assert (=> b!264203 (= lt!133615 (select (arr!5992 (_keys!7033 thiss!1504)) (index!6944 lt!133616)))))

(declare-fun c!45201 () Bool)

(assert (=> b!264203 (= c!45201 (= lt!133615 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!264204 () Bool)

(assert (=> b!264204 (= e!171164 (Found!1193 (index!6944 lt!133616)))))

(declare-fun b!264205 () Bool)

(assert (=> b!264205 (= e!171163 (seekKeyOrZeroReturnVacant!0 (x!25234 lt!133616) (index!6944 lt!133616) (index!6944 lt!133616) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000) (_keys!7033 thiss!1504) (mask!11207 thiss!1504)))))

(declare-fun b!264206 () Bool)

(assert (=> b!264206 (= e!171162 Undefined!1193)))

(declare-fun b!264207 () Bool)

(declare-fun c!45199 () Bool)

(assert (=> b!264207 (= c!45199 (= lt!133615 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264207 (= e!171164 e!171163)))

(assert (= (and d!63733 c!45200) b!264206))

(assert (= (and d!63733 (not c!45200)) b!264203))

(assert (= (and b!264203 c!45201) b!264204))

(assert (= (and b!264203 (not c!45201)) b!264207))

(assert (= (and b!264207 c!45199) b!264202))

(assert (= (and b!264207 (not c!45199)) b!264205))

(declare-fun m!280651 () Bool)

(assert (=> d!63733 m!280651))

(assert (=> d!63733 m!278517))

(declare-fun m!280653 () Bool)

(assert (=> d!63733 m!280653))

(declare-fun m!280655 () Bool)

(assert (=> d!63733 m!280655))

(assert (=> d!63733 m!278579))

(declare-fun m!280657 () Bool)

(assert (=> d!63733 m!280657))

(declare-fun m!280659 () Bool)

(assert (=> d!63733 m!280659))

(assert (=> d!63733 m!278517))

(assert (=> d!63733 m!280651))

(declare-fun m!280661 () Bool)

(assert (=> b!264203 m!280661))

(assert (=> b!264205 m!278517))

(declare-fun m!280663 () Bool)

(assert (=> b!264205 m!280663))

(assert (=> b!263467 d!63733))

(assert (=> b!263210 d!63579))

(assert (=> b!263210 d!63569))

(declare-fun d!63735 () Bool)

(declare-fun e!171165 () Bool)

(assert (=> d!63735 e!171165))

(declare-fun res!128908 () Bool)

(assert (=> d!63735 (=> res!128908 e!171165)))

(declare-fun lt!133620 () Bool)

(assert (=> d!63735 (= res!128908 (not lt!133620))))

(declare-fun lt!133618 () Bool)

(assert (=> d!63735 (= lt!133620 lt!133618)))

(declare-fun lt!133617 () Unit!8136)

(declare-fun e!171166 () Unit!8136)

(assert (=> d!63735 (= lt!133617 e!171166)))

(declare-fun c!45202 () Bool)

(assert (=> d!63735 (= c!45202 lt!133618)))

(assert (=> d!63735 (= lt!133618 (containsKey!310 (toList!1927 lt!133245) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63735 (= (contains!1889 lt!133245 #b1000000000000000000000000000000000000000000000000000000000000000) lt!133620)))

(declare-fun b!264208 () Bool)

(declare-fun lt!133619 () Unit!8136)

(assert (=> b!264208 (= e!171166 lt!133619)))

(assert (=> b!264208 (= lt!133619 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133245) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264208 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133245) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264209 () Bool)

(declare-fun Unit!8197 () Unit!8136)

(assert (=> b!264209 (= e!171166 Unit!8197)))

(declare-fun b!264210 () Bool)

(assert (=> b!264210 (= e!171165 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133245) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63735 c!45202) b!264208))

(assert (= (and d!63735 (not c!45202)) b!264209))

(assert (= (and d!63735 (not res!128908)) b!264210))

(declare-fun m!280665 () Bool)

(assert (=> d!63735 m!280665))

(declare-fun m!280667 () Bool)

(assert (=> b!264208 m!280667))

(declare-fun m!280669 () Bool)

(assert (=> b!264208 m!280669))

(assert (=> b!264208 m!280669))

(declare-fun m!280671 () Bool)

(assert (=> b!264208 m!280671))

(assert (=> b!264210 m!280669))

(assert (=> b!264210 m!280669))

(assert (=> b!264210 m!280671))

(assert (=> bm!25190 d!63735))

(declare-fun d!63737 () Bool)

(assert (=> d!63737 (= ($colon$colon!107 e!170759 (ite c!44987 (h!4479 (toList!1927 (map!2737 thiss!1504))) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765)))) (Cons!3813 (ite c!44987 (h!4479 (toList!1927 (map!2737 thiss!1504))) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))) e!170759))))

(assert (=> bm!25218 d!63737))

(declare-fun d!63739 () Bool)

(assert (=> d!63739 (= (validKeyInArray!0 (select (arr!5992 lt!132768) (bvadd index!297 #b00000000000000000000000000000001))) (and (not (= (select (arr!5992 lt!132768) (bvadd index!297 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5992 lt!132768) (bvadd index!297 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263559 d!63739))

(assert (=> b!263264 d!63227))

(declare-fun d!63741 () Bool)

(declare-fun e!171167 () Bool)

(assert (=> d!63741 e!171167))

(declare-fun res!128909 () Bool)

(assert (=> d!63741 (=> res!128909 e!171167)))

(declare-fun lt!133624 () Bool)

(assert (=> d!63741 (= res!128909 (not lt!133624))))

(declare-fun lt!133622 () Bool)

(assert (=> d!63741 (= lt!133624 lt!133622)))

(declare-fun lt!133621 () Unit!8136)

(declare-fun e!171168 () Unit!8136)

(assert (=> d!63741 (= lt!133621 e!171168)))

(declare-fun c!45203 () Bool)

(assert (=> d!63741 (= c!45203 lt!133622)))

(assert (=> d!63741 (= lt!133622 (containsKey!310 (toList!1927 (+!713 lt!133187 (tuple2!4921 lt!133191 lt!133186))) lt!133189))))

(assert (=> d!63741 (= (contains!1889 (+!713 lt!133187 (tuple2!4921 lt!133191 lt!133186)) lt!133189) lt!133624)))

(declare-fun b!264211 () Bool)

(declare-fun lt!133623 () Unit!8136)

(assert (=> b!264211 (= e!171168 lt!133623)))

(assert (=> b!264211 (= lt!133623 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 (+!713 lt!133187 (tuple2!4921 lt!133191 lt!133186))) lt!133189))))

(assert (=> b!264211 (isDefined!260 (getValueByKey!318 (toList!1927 (+!713 lt!133187 (tuple2!4921 lt!133191 lt!133186))) lt!133189))))

(declare-fun b!264212 () Bool)

(declare-fun Unit!8198 () Unit!8136)

(assert (=> b!264212 (= e!171168 Unit!8198)))

(declare-fun b!264213 () Bool)

(assert (=> b!264213 (= e!171167 (isDefined!260 (getValueByKey!318 (toList!1927 (+!713 lt!133187 (tuple2!4921 lt!133191 lt!133186))) lt!133189)))))

(assert (= (and d!63741 c!45203) b!264211))

(assert (= (and d!63741 (not c!45203)) b!264212))

(assert (= (and d!63741 (not res!128909)) b!264213))

(declare-fun m!280673 () Bool)

(assert (=> d!63741 m!280673))

(declare-fun m!280675 () Bool)

(assert (=> b!264211 m!280675))

(declare-fun m!280677 () Bool)

(assert (=> b!264211 m!280677))

(assert (=> b!264211 m!280677))

(declare-fun m!280679 () Bool)

(assert (=> b!264211 m!280679))

(assert (=> b!264213 m!280677))

(assert (=> b!264213 m!280677))

(assert (=> b!264213 m!280679))

(assert (=> b!263264 d!63741))

(declare-fun d!63743 () Bool)

(declare-fun e!171169 () Bool)

(assert (=> d!63743 e!171169))

(declare-fun res!128911 () Bool)

(assert (=> d!63743 (=> (not res!128911) (not e!171169))))

(declare-fun lt!133626 () ListLongMap!3823)

(assert (=> d!63743 (= res!128911 (contains!1889 lt!133626 (_1!2471 (tuple2!4921 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!133625 () List!3817)

(assert (=> d!63743 (= lt!133626 (ListLongMap!3824 lt!133625))))

(declare-fun lt!133628 () Unit!8136)

(declare-fun lt!133627 () Unit!8136)

(assert (=> d!63743 (= lt!133628 lt!133627)))

(assert (=> d!63743 (= (getValueByKey!318 lt!133625 (_1!2471 (tuple2!4921 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!323 (_2!2471 (tuple2!4921 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63743 (= lt!133627 (lemmaContainsTupThenGetReturnValue!177 lt!133625 (_1!2471 (tuple2!4921 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!2471 (tuple2!4921 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63743 (= lt!133625 (insertStrictlySorted!180 (toList!1927 call!25188) (_1!2471 (tuple2!4921 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!2471 (tuple2!4921 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63743 (= (+!713 call!25188 (tuple2!4921 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!133626)))

(declare-fun b!264214 () Bool)

(declare-fun res!128910 () Bool)

(assert (=> b!264214 (=> (not res!128910) (not e!171169))))

(assert (=> b!264214 (= res!128910 (= (getValueByKey!318 (toList!1927 lt!133626) (_1!2471 (tuple2!4921 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!323 (_2!2471 (tuple2!4921 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!264215 () Bool)

(assert (=> b!264215 (= e!171169 (contains!1893 (toList!1927 lt!133626) (tuple2!4921 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (get!3087 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!63743 res!128911) b!264214))

(assert (= (and b!264214 res!128910) b!264215))

(declare-fun m!280681 () Bool)

(assert (=> d!63743 m!280681))

(declare-fun m!280683 () Bool)

(assert (=> d!63743 m!280683))

(declare-fun m!280685 () Bool)

(assert (=> d!63743 m!280685))

(declare-fun m!280687 () Bool)

(assert (=> d!63743 m!280687))

(declare-fun m!280689 () Bool)

(assert (=> b!264214 m!280689))

(declare-fun m!280691 () Bool)

(assert (=> b!264215 m!280691))

(assert (=> b!263264 d!63743))

(declare-fun d!63745 () Bool)

(assert (=> d!63745 (not (contains!1889 (+!713 lt!133187 (tuple2!4921 lt!133191 lt!133186)) lt!133189))))

(declare-fun lt!133629 () Unit!8136)

(assert (=> d!63745 (= lt!133629 (choose!1304 lt!133187 lt!133191 lt!133186 lt!133189))))

(declare-fun e!171170 () Bool)

(assert (=> d!63745 e!171170))

(declare-fun res!128912 () Bool)

(assert (=> d!63745 (=> (not res!128912) (not e!171170))))

(assert (=> d!63745 (= res!128912 (not (contains!1889 lt!133187 lt!133189)))))

(assert (=> d!63745 (= (addStillNotContains!130 lt!133187 lt!133191 lt!133186 lt!133189) lt!133629)))

(declare-fun b!264216 () Bool)

(assert (=> b!264216 (= e!171170 (not (= lt!133191 lt!133189)))))

(assert (= (and d!63745 res!128912) b!264216))

(assert (=> d!63745 m!279055))

(assert (=> d!63745 m!279055))

(assert (=> d!63745 m!279057))

(declare-fun m!280693 () Bool)

(assert (=> d!63745 m!280693))

(declare-fun m!280695 () Bool)

(assert (=> d!63745 m!280695))

(assert (=> b!263264 d!63745))

(declare-fun d!63747 () Bool)

(declare-fun e!171171 () Bool)

(assert (=> d!63747 e!171171))

(declare-fun res!128914 () Bool)

(assert (=> d!63747 (=> (not res!128914) (not e!171171))))

(declare-fun lt!133631 () ListLongMap!3823)

(assert (=> d!63747 (= res!128914 (contains!1889 lt!133631 (_1!2471 (tuple2!4921 lt!133191 lt!133186))))))

(declare-fun lt!133630 () List!3817)

(assert (=> d!63747 (= lt!133631 (ListLongMap!3824 lt!133630))))

(declare-fun lt!133633 () Unit!8136)

(declare-fun lt!133632 () Unit!8136)

(assert (=> d!63747 (= lt!133633 lt!133632)))

(assert (=> d!63747 (= (getValueByKey!318 lt!133630 (_1!2471 (tuple2!4921 lt!133191 lt!133186))) (Some!323 (_2!2471 (tuple2!4921 lt!133191 lt!133186))))))

(assert (=> d!63747 (= lt!133632 (lemmaContainsTupThenGetReturnValue!177 lt!133630 (_1!2471 (tuple2!4921 lt!133191 lt!133186)) (_2!2471 (tuple2!4921 lt!133191 lt!133186))))))

(assert (=> d!63747 (= lt!133630 (insertStrictlySorted!180 (toList!1927 lt!133187) (_1!2471 (tuple2!4921 lt!133191 lt!133186)) (_2!2471 (tuple2!4921 lt!133191 lt!133186))))))

(assert (=> d!63747 (= (+!713 lt!133187 (tuple2!4921 lt!133191 lt!133186)) lt!133631)))

(declare-fun b!264217 () Bool)

(declare-fun res!128913 () Bool)

(assert (=> b!264217 (=> (not res!128913) (not e!171171))))

(assert (=> b!264217 (= res!128913 (= (getValueByKey!318 (toList!1927 lt!133631) (_1!2471 (tuple2!4921 lt!133191 lt!133186))) (Some!323 (_2!2471 (tuple2!4921 lt!133191 lt!133186)))))))

(declare-fun b!264218 () Bool)

(assert (=> b!264218 (= e!171171 (contains!1893 (toList!1927 lt!133631) (tuple2!4921 lt!133191 lt!133186)))))

(assert (= (and d!63747 res!128914) b!264217))

(assert (= (and b!264217 res!128913) b!264218))

(declare-fun m!280697 () Bool)

(assert (=> d!63747 m!280697))

(declare-fun m!280699 () Bool)

(assert (=> d!63747 m!280699))

(declare-fun m!280701 () Bool)

(assert (=> d!63747 m!280701))

(declare-fun m!280703 () Bool)

(assert (=> d!63747 m!280703))

(declare-fun m!280705 () Bool)

(assert (=> b!264217 m!280705))

(declare-fun m!280707 () Bool)

(assert (=> b!264218 m!280707))

(assert (=> b!263264 d!63747))

(declare-fun b!264220 () Bool)

(declare-fun e!171172 () Option!324)

(declare-fun e!171173 () Option!324)

(assert (=> b!264220 (= e!171172 e!171173)))

(declare-fun c!45205 () Bool)

(assert (=> b!264220 (= c!45205 (and ((_ is Cons!3813) (toList!1927 lt!133130)) (not (= (_1!2471 (h!4479 (toList!1927 lt!133130))) (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))))

(declare-fun b!264222 () Bool)

(assert (=> b!264222 (= e!171173 None!322)))

(declare-fun c!45204 () Bool)

(declare-fun d!63749 () Bool)

(assert (=> d!63749 (= c!45204 (and ((_ is Cons!3813) (toList!1927 lt!133130)) (= (_1!2471 (h!4479 (toList!1927 lt!133130))) (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (=> d!63749 (= (getValueByKey!318 (toList!1927 lt!133130) (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) e!171172)))

(declare-fun b!264219 () Bool)

(assert (=> b!264219 (= e!171172 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!133130)))))))

(declare-fun b!264221 () Bool)

(assert (=> b!264221 (= e!171173 (getValueByKey!318 (t!8885 (toList!1927 lt!133130)) (_1!2471 (ite (or c!44840 c!44837) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63749 c!45204) b!264219))

(assert (= (and d!63749 (not c!45204)) b!264220))

(assert (= (and b!264220 c!45205) b!264221))

(assert (= (and b!264220 (not c!45205)) b!264222))

(declare-fun m!280709 () Bool)

(assert (=> b!264221 m!280709))

(assert (=> b!263177 d!63749))

(declare-fun d!63751 () Bool)

(declare-fun res!128915 () Bool)

(declare-fun e!171174 () Bool)

(assert (=> d!63751 (=> res!128915 e!171174)))

(assert (=> d!63751 (= res!128915 (and ((_ is Cons!3813) (toList!1927 lt!133003)) (= (_1!2471 (h!4479 (toList!1927 lt!133003))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63751 (= (containsKey!310 (toList!1927 lt!133003) #b0000000000000000000000000000000000000000000000000000000000000000) e!171174)))

(declare-fun b!264223 () Bool)

(declare-fun e!171175 () Bool)

(assert (=> b!264223 (= e!171174 e!171175)))

(declare-fun res!128916 () Bool)

(assert (=> b!264223 (=> (not res!128916) (not e!171175))))

(assert (=> b!264223 (= res!128916 (and (or (not ((_ is Cons!3813) (toList!1927 lt!133003))) (bvsle (_1!2471 (h!4479 (toList!1927 lt!133003))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!3813) (toList!1927 lt!133003)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!133003))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264224 () Bool)

(assert (=> b!264224 (= e!171175 (containsKey!310 (t!8885 (toList!1927 lt!133003)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63751 (not res!128915)) b!264223))

(assert (= (and b!264223 res!128916) b!264224))

(declare-fun m!280711 () Bool)

(assert (=> b!264224 m!280711))

(assert (=> d!63171 d!63751))

(declare-fun d!63753 () Bool)

(assert (=> d!63753 (= (apply!262 lt!133245 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3088 (getValueByKey!318 (toList!1927 lt!133245) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9300 () Bool)

(assert (= bs!9300 d!63753))

(declare-fun m!280713 () Bool)

(assert (=> bs!9300 m!280713))

(assert (=> bs!9300 m!280713))

(declare-fun m!280715 () Bool)

(assert (=> bs!9300 m!280715))

(assert (=> b!263309 d!63753))

(declare-fun d!63755 () Bool)

(declare-fun res!128917 () Bool)

(declare-fun e!171176 () Bool)

(assert (=> d!63755 (=> res!128917 e!171176)))

(assert (=> d!63755 (= res!128917 (and ((_ is Cons!3813) (t!8885 (toList!1927 lt!132776))) (= (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132776)))) key!932)))))

(assert (=> d!63755 (= (containsKey!310 (t!8885 (toList!1927 lt!132776)) key!932) e!171176)))

(declare-fun b!264225 () Bool)

(declare-fun e!171177 () Bool)

(assert (=> b!264225 (= e!171176 e!171177)))

(declare-fun res!128918 () Bool)

(assert (=> b!264225 (=> (not res!128918) (not e!171177))))

(assert (=> b!264225 (= res!128918 (and (or (not ((_ is Cons!3813) (t!8885 (toList!1927 lt!132776)))) (bvsle (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132776)))) key!932)) ((_ is Cons!3813) (t!8885 (toList!1927 lt!132776))) (bvslt (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132776)))) key!932)))))

(declare-fun b!264226 () Bool)

(assert (=> b!264226 (= e!171177 (containsKey!310 (t!8885 (t!8885 (toList!1927 lt!132776))) key!932))))

(assert (= (and d!63755 (not res!128917)) b!264225))

(assert (= (and b!264225 res!128918) b!264226))

(declare-fun m!280717 () Bool)

(assert (=> b!264226 m!280717))

(assert (=> b!263347 d!63755))

(assert (=> b!263395 d!63435))

(assert (=> b!263292 d!63507))

(declare-fun d!63757 () Bool)

(assert (=> d!63757 (= (get!3088 (getValueByKey!318 (toList!1927 lt!132979) lt!132969)) (v!5502 (getValueByKey!318 (toList!1927 lt!132979) lt!132969)))))

(assert (=> d!63111 d!63757))

(declare-fun b!264228 () Bool)

(declare-fun e!171178 () Option!324)

(declare-fun e!171179 () Option!324)

(assert (=> b!264228 (= e!171178 e!171179)))

(declare-fun c!45207 () Bool)

(assert (=> b!264228 (= c!45207 (and ((_ is Cons!3813) (toList!1927 lt!132979)) (not (= (_1!2471 (h!4479 (toList!1927 lt!132979))) lt!132969))))))

(declare-fun b!264230 () Bool)

(assert (=> b!264230 (= e!171179 None!322)))

(declare-fun d!63759 () Bool)

(declare-fun c!45206 () Bool)

(assert (=> d!63759 (= c!45206 (and ((_ is Cons!3813) (toList!1927 lt!132979)) (= (_1!2471 (h!4479 (toList!1927 lt!132979))) lt!132969)))))

(assert (=> d!63759 (= (getValueByKey!318 (toList!1927 lt!132979) lt!132969) e!171178)))

(declare-fun b!264227 () Bool)

(assert (=> b!264227 (= e!171178 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!132979)))))))

(declare-fun b!264229 () Bool)

(assert (=> b!264229 (= e!171179 (getValueByKey!318 (t!8885 (toList!1927 lt!132979)) lt!132969))))

(assert (= (and d!63759 c!45206) b!264227))

(assert (= (and d!63759 (not c!45206)) b!264228))

(assert (= (and b!264228 c!45207) b!264229))

(assert (= (and b!264228 (not c!45207)) b!264230))

(declare-fun m!280719 () Bool)

(assert (=> b!264229 m!280719))

(assert (=> d!63111 d!63759))

(declare-fun d!63761 () Bool)

(assert (=> d!63761 (isDefined!260 (getValueByKey!318 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932))))

(declare-fun lt!133634 () Unit!8136)

(assert (=> d!63761 (= lt!133634 (choose!1300 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932))))

(declare-fun e!171180 () Bool)

(assert (=> d!63761 e!171180))

(declare-fun res!128919 () Bool)

(assert (=> d!63761 (=> (not res!128919) (not e!171180))))

(assert (=> d!63761 (= res!128919 (isStrictlySorted!372 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))))

(assert (=> d!63761 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932) lt!133634)))

(declare-fun b!264231 () Bool)

(assert (=> b!264231 (= e!171180 (containsKey!310 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932))))

(assert (= (and d!63761 res!128919) b!264231))

(assert (=> d!63761 m!279445))

(assert (=> d!63761 m!279445))

(assert (=> d!63761 m!279447))

(declare-fun m!280721 () Bool)

(assert (=> d!63761 m!280721))

(assert (=> d!63761 m!279715))

(assert (=> b!264231 m!279441))

(assert (=> b!263520 d!63761))

(declare-fun d!63763 () Bool)

(assert (=> d!63763 (= (isDefined!260 (getValueByKey!318 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932)) (not (isEmpty!544 (getValueByKey!318 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932))))))

(declare-fun bs!9301 () Bool)

(assert (= bs!9301 d!63763))

(assert (=> bs!9301 m!279445))

(declare-fun m!280723 () Bool)

(assert (=> bs!9301 m!280723))

(assert (=> b!263520 d!63763))

(declare-fun b!264233 () Bool)

(declare-fun e!171181 () Option!324)

(declare-fun e!171182 () Option!324)

(assert (=> b!264233 (= e!171181 e!171182)))

(declare-fun c!45209 () Bool)

(assert (=> b!264233 (= c!45209 (and ((_ is Cons!3813) (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (not (= (_1!2471 (h!4479 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) key!932))))))

(declare-fun b!264235 () Bool)

(assert (=> b!264235 (= e!171182 None!322)))

(declare-fun d!63765 () Bool)

(declare-fun c!45208 () Bool)

(assert (=> d!63765 (= c!45208 (and ((_ is Cons!3813) (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (= (_1!2471 (h!4479 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) key!932)))))

(assert (=> d!63765 (= (getValueByKey!318 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932) e!171181)))

(declare-fun b!264232 () Bool)

(assert (=> b!264232 (= e!171181 (Some!323 (_2!2471 (h!4479 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))))))

(declare-fun b!264234 () Bool)

(assert (=> b!264234 (= e!171182 (getValueByKey!318 (t!8885 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) key!932))))

(assert (= (and d!63765 c!45208) b!264232))

(assert (= (and d!63765 (not c!45208)) b!264233))

(assert (= (and b!264233 c!45209) b!264234))

(assert (= (and b!264233 (not c!45209)) b!264235))

(declare-fun m!280725 () Bool)

(assert (=> b!264234 m!280725))

(assert (=> b!263520 d!63765))

(declare-fun lt!133635 () Bool)

(declare-fun d!63767 () Bool)

(assert (=> d!63767 (= lt!133635 (select (content!176 (toList!1927 lt!133214)) (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))))

(declare-fun e!171184 () Bool)

(assert (=> d!63767 (= lt!133635 e!171184)))

(declare-fun res!128921 () Bool)

(assert (=> d!63767 (=> (not res!128921) (not e!171184))))

(assert (=> d!63767 (= res!128921 ((_ is Cons!3813) (toList!1927 lt!133214)))))

(assert (=> d!63767 (= (contains!1893 (toList!1927 lt!133214) (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))) lt!133635)))

(declare-fun b!264236 () Bool)

(declare-fun e!171183 () Bool)

(assert (=> b!264236 (= e!171184 e!171183)))

(declare-fun res!128920 () Bool)

(assert (=> b!264236 (=> res!128920 e!171183)))

(assert (=> b!264236 (= res!128920 (= (h!4479 (toList!1927 lt!133214)) (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))))

(declare-fun b!264237 () Bool)

(assert (=> b!264237 (= e!171183 (contains!1893 (t!8885 (toList!1927 lt!133214)) (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!63767 res!128921) b!264236))

(assert (= (and b!264236 (not res!128920)) b!264237))

(declare-fun m!280727 () Bool)

(assert (=> d!63767 m!280727))

(declare-fun m!280729 () Bool)

(assert (=> d!63767 m!280729))

(declare-fun m!280731 () Bool)

(assert (=> b!264237 m!280731))

(assert (=> b!263287 d!63767))

(declare-fun d!63769 () Bool)

(assert (=> d!63769 (arrayContainsKey!0 (_keys!7033 lt!132778) lt!133126 #b00000000000000000000000000000000)))

(declare-fun lt!133636 () Unit!8136)

(assert (=> d!63769 (= lt!133636 (choose!13 (_keys!7033 lt!132778) lt!133126 #b00000000000000000000000000000000))))

(assert (=> d!63769 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!63769 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!7033 lt!132778) lt!133126 #b00000000000000000000000000000000) lt!133636)))

(declare-fun bs!9302 () Bool)

(assert (= bs!9302 d!63769))

(assert (=> bs!9302 m!278893))

(declare-fun m!280733 () Bool)

(assert (=> bs!9302 m!280733))

(assert (=> b!263173 d!63769))

(declare-fun d!63771 () Bool)

(declare-fun res!128922 () Bool)

(declare-fun e!171185 () Bool)

(assert (=> d!63771 (=> res!128922 e!171185)))

(assert (=> d!63771 (= res!128922 (= (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000) lt!133126))))

(assert (=> d!63771 (= (arrayContainsKey!0 (_keys!7033 lt!132778) lt!133126 #b00000000000000000000000000000000) e!171185)))

(declare-fun b!264238 () Bool)

(declare-fun e!171186 () Bool)

(assert (=> b!264238 (= e!171185 e!171186)))

(declare-fun res!128923 () Bool)

(assert (=> b!264238 (=> (not res!128923) (not e!171186))))

(assert (=> b!264238 (= res!128923 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 lt!132778))))))

(declare-fun b!264239 () Bool)

(assert (=> b!264239 (= e!171186 (arrayContainsKey!0 (_keys!7033 lt!132778) lt!133126 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63771 (not res!128922)) b!264238))

(assert (= (and b!264238 res!128923) b!264239))

(assert (=> d!63771 m!278889))

(declare-fun m!280735 () Bool)

(assert (=> b!264239 m!280735))

(assert (=> b!263173 d!63771))

(declare-fun b!264240 () Bool)

(declare-fun e!171188 () SeekEntryResult!1193)

(declare-fun lt!133639 () SeekEntryResult!1193)

(assert (=> b!264240 (= e!171188 (MissingZero!1193 (index!6944 lt!133639)))))

(declare-fun d!63773 () Bool)

(declare-fun lt!133637 () SeekEntryResult!1193)

(assert (=> d!63773 (and (or ((_ is Undefined!1193) lt!133637) (not ((_ is Found!1193) lt!133637)) (and (bvsge (index!6943 lt!133637) #b00000000000000000000000000000000) (bvslt (index!6943 lt!133637) (size!6344 (_keys!7033 lt!132778))))) (or ((_ is Undefined!1193) lt!133637) ((_ is Found!1193) lt!133637) (not ((_ is MissingZero!1193) lt!133637)) (and (bvsge (index!6942 lt!133637) #b00000000000000000000000000000000) (bvslt (index!6942 lt!133637) (size!6344 (_keys!7033 lt!132778))))) (or ((_ is Undefined!1193) lt!133637) ((_ is Found!1193) lt!133637) ((_ is MissingZero!1193) lt!133637) (not ((_ is MissingVacant!1193) lt!133637)) (and (bvsge (index!6945 lt!133637) #b00000000000000000000000000000000) (bvslt (index!6945 lt!133637) (size!6344 (_keys!7033 lt!132778))))) (or ((_ is Undefined!1193) lt!133637) (ite ((_ is Found!1193) lt!133637) (= (select (arr!5992 (_keys!7033 lt!132778)) (index!6943 lt!133637)) (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1193) lt!133637) (= (select (arr!5992 (_keys!7033 lt!132778)) (index!6942 lt!133637)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1193) lt!133637) (= (select (arr!5992 (_keys!7033 lt!132778)) (index!6945 lt!133637)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!171187 () SeekEntryResult!1193)

(assert (=> d!63773 (= lt!133637 e!171187)))

(declare-fun c!45211 () Bool)

(assert (=> d!63773 (= c!45211 (and ((_ is Intermediate!1193) lt!133639) (undefined!2005 lt!133639)))))

(assert (=> d!63773 (= lt!133639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000) (mask!11207 lt!132778)) (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000) (_keys!7033 lt!132778) (mask!11207 lt!132778)))))

(assert (=> d!63773 (validMask!0 (mask!11207 lt!132778))))

(assert (=> d!63773 (= (seekEntryOrOpen!0 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000) (_keys!7033 lt!132778) (mask!11207 lt!132778)) lt!133637)))

(declare-fun b!264241 () Bool)

(declare-fun e!171189 () SeekEntryResult!1193)

(assert (=> b!264241 (= e!171187 e!171189)))

(declare-fun lt!133638 () (_ BitVec 64))

(assert (=> b!264241 (= lt!133638 (select (arr!5992 (_keys!7033 lt!132778)) (index!6944 lt!133639)))))

(declare-fun c!45212 () Bool)

(assert (=> b!264241 (= c!45212 (= lt!133638 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)))))

(declare-fun b!264242 () Bool)

(assert (=> b!264242 (= e!171189 (Found!1193 (index!6944 lt!133639)))))

(declare-fun b!264243 () Bool)

(assert (=> b!264243 (= e!171188 (seekKeyOrZeroReturnVacant!0 (x!25234 lt!133639) (index!6944 lt!133639) (index!6944 lt!133639) (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000) (_keys!7033 lt!132778) (mask!11207 lt!132778)))))

(declare-fun b!264244 () Bool)

(assert (=> b!264244 (= e!171187 Undefined!1193)))

(declare-fun b!264245 () Bool)

(declare-fun c!45210 () Bool)

(assert (=> b!264245 (= c!45210 (= lt!133638 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264245 (= e!171189 e!171188)))

(assert (= (and d!63773 c!45211) b!264244))

(assert (= (and d!63773 (not c!45211)) b!264241))

(assert (= (and b!264241 c!45212) b!264242))

(assert (= (and b!264241 (not c!45212)) b!264245))

(assert (= (and b!264245 c!45210) b!264240))

(assert (= (and b!264245 (not c!45210)) b!264243))

(declare-fun m!280737 () Bool)

(assert (=> d!63773 m!280737))

(assert (=> d!63773 m!278889))

(declare-fun m!280739 () Bool)

(assert (=> d!63773 m!280739))

(declare-fun m!280741 () Bool)

(assert (=> d!63773 m!280741))

(assert (=> d!63773 m!278887))

(declare-fun m!280743 () Bool)

(assert (=> d!63773 m!280743))

(declare-fun m!280745 () Bool)

(assert (=> d!63773 m!280745))

(assert (=> d!63773 m!278889))

(assert (=> d!63773 m!280737))

(declare-fun m!280747 () Bool)

(assert (=> b!264241 m!280747))

(assert (=> b!264243 m!278889))

(declare-fun m!280749 () Bool)

(assert (=> b!264243 m!280749))

(assert (=> b!263173 d!63773))

(declare-fun b!264246 () Bool)

(declare-fun e!171192 () Bool)

(declare-fun e!171191 () Bool)

(assert (=> b!264246 (= e!171192 e!171191)))

(declare-fun lt!133640 () (_ BitVec 64))

(assert (=> b!264246 (= lt!133640 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!133641 () Unit!8136)

(assert (=> b!264246 (= lt!133641 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) lt!133640 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!264246 (arrayContainsKey!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) lt!133640 #b00000000000000000000000000000000)))

(declare-fun lt!133642 () Unit!8136)

(assert (=> b!264246 (= lt!133642 lt!133641)))

(declare-fun res!128925 () Bool)

(assert (=> b!264246 (= res!128925 (= (seekEntryOrOpen!0 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (mask!11207 thiss!1504)) (Found!1193 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!264246 (=> (not res!128925) (not e!171191))))

(declare-fun d!63775 () Bool)

(declare-fun res!128924 () Bool)

(declare-fun e!171190 () Bool)

(assert (=> d!63775 (=> res!128924 e!171190)))

(assert (=> d!63775 (= res!128924 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))))

(assert (=> d!63775 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (mask!11207 thiss!1504)) e!171190)))

(declare-fun b!264247 () Bool)

(declare-fun call!25274 () Bool)

(assert (=> b!264247 (= e!171191 call!25274)))

(declare-fun b!264248 () Bool)

(assert (=> b!264248 (= e!171190 e!171192)))

(declare-fun c!45213 () Bool)

(assert (=> b!264248 (= c!45213 (validKeyInArray!0 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!264249 () Bool)

(assert (=> b!264249 (= e!171192 call!25274)))

(declare-fun bm!25271 () Bool)

(assert (=> bm!25271 (= call!25274 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (mask!11207 thiss!1504)))))

(assert (= (and d!63775 (not res!128924)) b!264248))

(assert (= (and b!264248 c!45213) b!264246))

(assert (= (and b!264248 (not c!45213)) b!264249))

(assert (= (and b!264246 res!128925) b!264247))

(assert (= (or b!264247 b!264249) bm!25271))

(assert (=> b!264246 m!280207))

(declare-fun m!280751 () Bool)

(assert (=> b!264246 m!280751))

(declare-fun m!280753 () Bool)

(assert (=> b!264246 m!280753))

(assert (=> b!264246 m!280207))

(declare-fun m!280755 () Bool)

(assert (=> b!264246 m!280755))

(assert (=> b!264248 m!280207))

(assert (=> b!264248 m!280207))

(assert (=> b!264248 m!280209))

(declare-fun m!280757 () Bool)

(assert (=> bm!25271 m!280757))

(assert (=> bm!25222 d!63775))

(declare-fun b!264251 () Bool)

(declare-fun e!171196 () Bool)

(declare-fun call!25275 () Bool)

(assert (=> b!264251 (= e!171196 call!25275)))

(declare-fun b!264252 () Bool)

(declare-fun e!171195 () Bool)

(declare-fun e!171193 () Bool)

(assert (=> b!264252 (= e!171195 e!171193)))

(declare-fun res!128928 () Bool)

(assert (=> b!264252 (=> (not res!128928) (not e!171193))))

(declare-fun e!171194 () Bool)

(assert (=> b!264252 (= res!128928 (not e!171194))))

(declare-fun res!128927 () Bool)

(assert (=> b!264252 (=> (not res!128927) (not e!171194))))

(assert (=> b!264252 (= res!128927 (validKeyInArray!0 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!25272 () Bool)

(declare-fun c!45214 () Bool)

(assert (=> bm!25272 (= call!25275 (arrayNoDuplicates!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!45214 (Cons!3814 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44904 (Cons!3814 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000) Nil!3815) Nil!3815)) (ite c!44904 (Cons!3814 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000) Nil!3815) Nil!3815))))))

(declare-fun b!264253 () Bool)

(assert (=> b!264253 (= e!171196 call!25275)))

(declare-fun b!264254 () Bool)

(assert (=> b!264254 (= e!171193 e!171196)))

(assert (=> b!264254 (= c!45214 (validKeyInArray!0 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!264250 () Bool)

(assert (=> b!264250 (= e!171194 (contains!1892 (ite c!44904 (Cons!3814 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000) Nil!3815) Nil!3815) (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63777 () Bool)

(declare-fun res!128926 () Bool)

(assert (=> d!63777 (=> res!128926 e!171195)))

(assert (=> d!63777 (= res!128926 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))))))))

(assert (=> d!63777 (= (arrayNoDuplicates!0 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44904 (Cons!3814 (select (arr!5992 (array!12666 (store (arr!5992 (_keys!7033 thiss!1504)) index!297 key!932) (size!6344 (_keys!7033 thiss!1504)))) #b00000000000000000000000000000000) Nil!3815) Nil!3815)) e!171195)))

(assert (= (and d!63777 (not res!128926)) b!264252))

(assert (= (and b!264252 res!128927) b!264250))

(assert (= (and b!264252 res!128928) b!264254))

(assert (= (and b!264254 c!45214) b!264253))

(assert (= (and b!264254 (not c!45214)) b!264251))

(assert (= (or b!264253 b!264251) bm!25272))

(assert (=> b!264252 m!280207))

(assert (=> b!264252 m!280207))

(assert (=> b!264252 m!280209))

(assert (=> bm!25272 m!280207))

(declare-fun m!280759 () Bool)

(assert (=> bm!25272 m!280759))

(assert (=> b!264254 m!280207))

(assert (=> b!264254 m!280207))

(assert (=> b!264254 m!280209))

(assert (=> b!264250 m!280207))

(assert (=> b!264250 m!280207))

(declare-fun m!280761 () Bool)

(assert (=> b!264250 m!280761))

(assert (=> bm!25186 d!63777))

(declare-fun d!63779 () Bool)

(assert (=> d!63779 (= (apply!262 lt!133117 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3088 (getValueByKey!318 (toList!1927 lt!133117) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9303 () Bool)

(assert (= bs!9303 d!63779))

(assert (=> bs!9303 m!280575))

(assert (=> bs!9303 m!280575))

(declare-fun m!280763 () Bool)

(assert (=> bs!9303 m!280763))

(assert (=> b!263134 d!63779))

(declare-fun d!63781 () Bool)

(declare-fun e!171197 () Bool)

(assert (=> d!63781 e!171197))

(declare-fun res!128929 () Bool)

(assert (=> d!63781 (=> res!128929 e!171197)))

(declare-fun lt!133646 () Bool)

(assert (=> d!63781 (= res!128929 (not lt!133646))))

(declare-fun lt!133644 () Bool)

(assert (=> d!63781 (= lt!133646 lt!133644)))

(declare-fun lt!133643 () Unit!8136)

(declare-fun e!171198 () Unit!8136)

(assert (=> d!63781 (= lt!133643 e!171198)))

(declare-fun c!45215 () Bool)

(assert (=> d!63781 (= c!45215 lt!133644)))

(assert (=> d!63781 (= lt!133644 (containsKey!310 (toList!1927 lt!133188) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63781 (= (contains!1889 lt!133188 #b1000000000000000000000000000000000000000000000000000000000000000) lt!133646)))

(declare-fun b!264255 () Bool)

(declare-fun lt!133645 () Unit!8136)

(assert (=> b!264255 (= e!171198 lt!133645)))

(assert (=> b!264255 (= lt!133645 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133188) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264255 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133188) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264256 () Bool)

(declare-fun Unit!8199 () Unit!8136)

(assert (=> b!264256 (= e!171198 Unit!8199)))

(declare-fun b!264257 () Bool)

(assert (=> b!264257 (= e!171197 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133188) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63781 c!45215) b!264255))

(assert (= (and d!63781 (not c!45215)) b!264256))

(assert (= (and d!63781 (not res!128929)) b!264257))

(declare-fun m!280765 () Bool)

(assert (=> d!63781 m!280765))

(declare-fun m!280767 () Bool)

(assert (=> b!264255 m!280767))

(declare-fun m!280769 () Bool)

(assert (=> b!264255 m!280769))

(assert (=> b!264255 m!280769))

(declare-fun m!280771 () Bool)

(assert (=> b!264255 m!280771))

(assert (=> b!264257 m!280769))

(assert (=> b!264257 m!280769))

(assert (=> b!264257 m!280771))

(assert (=> b!263263 d!63781))

(assert (=> b!263385 d!63631))

(assert (=> b!263385 d!63487))

(assert (=> b!263427 d!63635))

(assert (=> b!263427 d!63637))

(declare-fun d!63783 () Bool)

(assert (=> d!63783 (= (get!3089 (select (arr!5991 lt!132766) #b00000000000000000000000000000000) (dynLambda!596 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!5497 (select (arr!5991 lt!132766) #b00000000000000000000000000000000)))))

(assert (=> b!263554 d!63783))

(declare-fun b!264259 () Bool)

(declare-fun e!171199 () Option!324)

(declare-fun e!171200 () Option!324)

(assert (=> b!264259 (= e!171199 e!171200)))

(declare-fun c!45217 () Bool)

(assert (=> b!264259 (= c!45217 (and ((_ is Cons!3813) (t!8885 (toList!1927 lt!132775))) (not (= (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132775)))) key!932))))))

(declare-fun b!264261 () Bool)

(assert (=> b!264261 (= e!171200 None!322)))

(declare-fun d!63785 () Bool)

(declare-fun c!45216 () Bool)

(assert (=> d!63785 (= c!45216 (and ((_ is Cons!3813) (t!8885 (toList!1927 lt!132775))) (= (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132775)))) key!932)))))

(assert (=> d!63785 (= (getValueByKey!318 (t!8885 (toList!1927 lt!132775)) key!932) e!171199)))

(declare-fun b!264258 () Bool)

(assert (=> b!264258 (= e!171199 (Some!323 (_2!2471 (h!4479 (t!8885 (toList!1927 lt!132775))))))))

(declare-fun b!264260 () Bool)

(assert (=> b!264260 (= e!171200 (getValueByKey!318 (t!8885 (t!8885 (toList!1927 lt!132775))) key!932))))

(assert (= (and d!63785 c!45216) b!264258))

(assert (= (and d!63785 (not c!45216)) b!264259))

(assert (= (and b!264259 c!45217) b!264260))

(assert (= (and b!264259 (not c!45217)) b!264261))

(declare-fun m!280773 () Bool)

(assert (=> b!264260 m!280773))

(assert (=> b!263197 d!63785))

(declare-fun d!63787 () Bool)

(assert (=> d!63787 (= (get!3088 (getValueByKey!318 (toList!1927 (+!713 lt!132993 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))) lt!132994)) (v!5502 (getValueByKey!318 (toList!1927 (+!713 lt!132993 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))) lt!132994)))))

(assert (=> d!63065 d!63787))

(declare-fun b!264263 () Bool)

(declare-fun e!171201 () Option!324)

(declare-fun e!171202 () Option!324)

(assert (=> b!264263 (= e!171201 e!171202)))

(declare-fun c!45219 () Bool)

(assert (=> b!264263 (= c!45219 (and ((_ is Cons!3813) (toList!1927 (+!713 lt!132993 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))))) (not (= (_1!2471 (h!4479 (toList!1927 (+!713 lt!132993 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))))) lt!132994))))))

(declare-fun b!264265 () Bool)

(assert (=> b!264265 (= e!171202 None!322)))

(declare-fun d!63789 () Bool)

(declare-fun c!45218 () Bool)

(assert (=> d!63789 (= c!45218 (and ((_ is Cons!3813) (toList!1927 (+!713 lt!132993 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))))) (= (_1!2471 (h!4479 (toList!1927 (+!713 lt!132993 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))))) lt!132994)))))

(assert (=> d!63789 (= (getValueByKey!318 (toList!1927 (+!713 lt!132993 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504)))) lt!132994) e!171201)))

(declare-fun b!264262 () Bool)

(assert (=> b!264262 (= e!171201 (Some!323 (_2!2471 (h!4479 (toList!1927 (+!713 lt!132993 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))))))))))

(declare-fun b!264264 () Bool)

(assert (=> b!264264 (= e!171202 (getValueByKey!318 (t!8885 (toList!1927 (+!713 lt!132993 (tuple2!4921 lt!133002 (zeroValue!4683 thiss!1504))))) lt!132994))))

(assert (= (and d!63789 c!45218) b!264262))

(assert (= (and d!63789 (not c!45218)) b!264263))

(assert (= (and b!264263 c!45219) b!264264))

(assert (= (and b!264263 (not c!45219)) b!264265))

(declare-fun m!280775 () Bool)

(assert (=> b!264264 m!280775))

(assert (=> d!63065 d!63789))

(assert (=> d!63023 d!63025))

(assert (=> d!63023 d!63027))

(declare-fun d!63791 () Bool)

(assert (=> d!63791 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132776) key!932))))

(assert (=> d!63791 true))

(declare-fun _$12!455 () Unit!8136)

(assert (=> d!63791 (= (choose!1300 (toList!1927 lt!132776) key!932) _$12!455)))

(declare-fun bs!9304 () Bool)

(assert (= bs!9304 d!63791))

(assert (=> bs!9304 m!278775))

(assert (=> bs!9304 m!278775))

(assert (=> bs!9304 m!278777))

(assert (=> d!63023 d!63791))

(declare-fun d!63793 () Bool)

(declare-fun res!128930 () Bool)

(declare-fun e!171203 () Bool)

(assert (=> d!63793 (=> res!128930 e!171203)))

(assert (=> d!63793 (= res!128930 (or ((_ is Nil!3814) (toList!1927 lt!132776)) ((_ is Nil!3814) (t!8885 (toList!1927 lt!132776)))))))

(assert (=> d!63793 (= (isStrictlySorted!372 (toList!1927 lt!132776)) e!171203)))

(declare-fun b!264266 () Bool)

(declare-fun e!171204 () Bool)

(assert (=> b!264266 (= e!171203 e!171204)))

(declare-fun res!128931 () Bool)

(assert (=> b!264266 (=> (not res!128931) (not e!171204))))

(assert (=> b!264266 (= res!128931 (bvslt (_1!2471 (h!4479 (toList!1927 lt!132776))) (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132776))))))))

(declare-fun b!264267 () Bool)

(assert (=> b!264267 (= e!171204 (isStrictlySorted!372 (t!8885 (toList!1927 lt!132776))))))

(assert (= (and d!63793 (not res!128930)) b!264266))

(assert (= (and b!264266 res!128931) b!264267))

(declare-fun m!280777 () Bool)

(assert (=> b!264267 m!280777))

(assert (=> d!63023 d!63793))

(assert (=> d!63205 d!63203))

(declare-fun d!63795 () Bool)

(assert (=> d!63795 (= (getValueByKey!318 lt!133020 (_1!2471 lt!132765)) (Some!323 (_2!2471 lt!132765)))))

(assert (=> d!63795 true))

(declare-fun _$22!544 () Unit!8136)

(assert (=> d!63795 (= (choose!1303 lt!133020 (_1!2471 lt!132765) (_2!2471 lt!132765)) _$22!544)))

(declare-fun bs!9305 () Bool)

(assert (= bs!9305 d!63795))

(assert (=> bs!9305 m!278659))

(assert (=> d!63205 d!63795))

(declare-fun d!63797 () Bool)

(declare-fun res!128932 () Bool)

(declare-fun e!171205 () Bool)

(assert (=> d!63797 (=> res!128932 e!171205)))

(assert (=> d!63797 (= res!128932 (or ((_ is Nil!3814) lt!133020) ((_ is Nil!3814) (t!8885 lt!133020))))))

(assert (=> d!63797 (= (isStrictlySorted!372 lt!133020) e!171205)))

(declare-fun b!264268 () Bool)

(declare-fun e!171206 () Bool)

(assert (=> b!264268 (= e!171205 e!171206)))

(declare-fun res!128933 () Bool)

(assert (=> b!264268 (=> (not res!128933) (not e!171206))))

(assert (=> b!264268 (= res!128933 (bvslt (_1!2471 (h!4479 lt!133020)) (_1!2471 (h!4479 (t!8885 lt!133020)))))))

(declare-fun b!264269 () Bool)

(assert (=> b!264269 (= e!171206 (isStrictlySorted!372 (t!8885 lt!133020)))))

(assert (= (and d!63797 (not res!128932)) b!264268))

(assert (= (and b!264268 res!128933) b!264269))

(declare-fun m!280779 () Bool)

(assert (=> b!264269 m!280779))

(assert (=> d!63205 d!63797))

(declare-fun d!63799 () Bool)

(assert (=> d!63799 (arrayContainsKey!0 lt!132768 lt!133335 #b00000000000000000000000000000000)))

(declare-fun lt!133647 () Unit!8136)

(assert (=> d!63799 (= lt!133647 (choose!13 lt!132768 lt!133335 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!63799 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!63799 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132768 lt!133335 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!133647)))

(declare-fun bs!9306 () Bool)

(assert (= bs!9306 d!63799))

(assert (=> bs!9306 m!279481))

(declare-fun m!280781 () Bool)

(assert (=> bs!9306 m!280781))

(assert (=> b!263546 d!63799))

(declare-fun d!63801 () Bool)

(declare-fun res!128934 () Bool)

(declare-fun e!171207 () Bool)

(assert (=> d!63801 (=> res!128934 e!171207)))

(assert (=> d!63801 (= res!128934 (= (select (arr!5992 lt!132768) #b00000000000000000000000000000000) lt!133335))))

(assert (=> d!63801 (= (arrayContainsKey!0 lt!132768 lt!133335 #b00000000000000000000000000000000) e!171207)))

(declare-fun b!264270 () Bool)

(declare-fun e!171208 () Bool)

(assert (=> b!264270 (= e!171207 e!171208)))

(declare-fun res!128935 () Bool)

(assert (=> b!264270 (=> (not res!128935) (not e!171208))))

(assert (=> b!264270 (= res!128935 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 lt!132768)))))

(declare-fun b!264271 () Bool)

(assert (=> b!264271 (= e!171208 (arrayContainsKey!0 lt!132768 lt!133335 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63801 (not res!128934)) b!264270))

(assert (= (and b!264270 res!128935) b!264271))

(assert (=> d!63801 m!278587))

(declare-fun m!280783 () Bool)

(assert (=> b!264271 m!280783))

(assert (=> b!263546 d!63801))

(declare-fun b!264272 () Bool)

(declare-fun e!171210 () SeekEntryResult!1193)

(declare-fun lt!133650 () SeekEntryResult!1193)

(assert (=> b!264272 (= e!171210 (MissingZero!1193 (index!6944 lt!133650)))))

(declare-fun d!63803 () Bool)

(declare-fun lt!133648 () SeekEntryResult!1193)

(assert (=> d!63803 (and (or ((_ is Undefined!1193) lt!133648) (not ((_ is Found!1193) lt!133648)) (and (bvsge (index!6943 lt!133648) #b00000000000000000000000000000000) (bvslt (index!6943 lt!133648) (size!6344 lt!132768)))) (or ((_ is Undefined!1193) lt!133648) ((_ is Found!1193) lt!133648) (not ((_ is MissingZero!1193) lt!133648)) (and (bvsge (index!6942 lt!133648) #b00000000000000000000000000000000) (bvslt (index!6942 lt!133648) (size!6344 lt!132768)))) (or ((_ is Undefined!1193) lt!133648) ((_ is Found!1193) lt!133648) ((_ is MissingZero!1193) lt!133648) (not ((_ is MissingVacant!1193) lt!133648)) (and (bvsge (index!6945 lt!133648) #b00000000000000000000000000000000) (bvslt (index!6945 lt!133648) (size!6344 lt!132768)))) (or ((_ is Undefined!1193) lt!133648) (ite ((_ is Found!1193) lt!133648) (= (select (arr!5992 lt!132768) (index!6943 lt!133648)) (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!1193) lt!133648) (= (select (arr!5992 lt!132768) (index!6942 lt!133648)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1193) lt!133648) (= (select (arr!5992 lt!132768) (index!6945 lt!133648)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!171209 () SeekEntryResult!1193)

(assert (=> d!63803 (= lt!133648 e!171209)))

(declare-fun c!45221 () Bool)

(assert (=> d!63803 (= c!45221 (and ((_ is Intermediate!1193) lt!133650) (undefined!2005 lt!133650)))))

(assert (=> d!63803 (= lt!133650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (mask!11207 thiss!1504)) (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!132768 (mask!11207 thiss!1504)))))

(assert (=> d!63803 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!63803 (= (seekEntryOrOpen!0 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!132768 (mask!11207 thiss!1504)) lt!133648)))

(declare-fun b!264273 () Bool)

(declare-fun e!171211 () SeekEntryResult!1193)

(assert (=> b!264273 (= e!171209 e!171211)))

(declare-fun lt!133649 () (_ BitVec 64))

(assert (=> b!264273 (= lt!133649 (select (arr!5992 lt!132768) (index!6944 lt!133650)))))

(declare-fun c!45222 () Bool)

(assert (=> b!264273 (= c!45222 (= lt!133649 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!264274 () Bool)

(assert (=> b!264274 (= e!171211 (Found!1193 (index!6944 lt!133650)))))

(declare-fun b!264275 () Bool)

(assert (=> b!264275 (= e!171210 (seekKeyOrZeroReturnVacant!0 (x!25234 lt!133650) (index!6944 lt!133650) (index!6944 lt!133650) (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!132768 (mask!11207 thiss!1504)))))

(declare-fun b!264276 () Bool)

(assert (=> b!264276 (= e!171209 Undefined!1193)))

(declare-fun b!264277 () Bool)

(declare-fun c!45220 () Bool)

(assert (=> b!264277 (= c!45220 (= lt!133649 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264277 (= e!171211 e!171210)))

(assert (= (and d!63803 c!45221) b!264276))

(assert (= (and d!63803 (not c!45221)) b!264273))

(assert (= (and b!264273 c!45222) b!264274))

(assert (= (and b!264273 (not c!45222)) b!264277))

(assert (= (and b!264277 c!45220) b!264272))

(assert (= (and b!264277 (not c!45220)) b!264275))

(declare-fun m!280785 () Bool)

(assert (=> d!63803 m!280785))

(assert (=> d!63803 m!279299))

(declare-fun m!280787 () Bool)

(assert (=> d!63803 m!280787))

(declare-fun m!280789 () Bool)

(assert (=> d!63803 m!280789))

(assert (=> d!63803 m!278579))

(declare-fun m!280791 () Bool)

(assert (=> d!63803 m!280791))

(declare-fun m!280793 () Bool)

(assert (=> d!63803 m!280793))

(assert (=> d!63803 m!279299))

(assert (=> d!63803 m!280785))

(declare-fun m!280795 () Bool)

(assert (=> b!264273 m!280795))

(assert (=> b!264275 m!279299))

(declare-fun m!280797 () Bool)

(assert (=> b!264275 m!280797))

(assert (=> b!263546 d!63803))

(assert (=> b!263215 d!63151))

(declare-fun d!63805 () Bool)

(declare-fun res!128936 () Bool)

(declare-fun e!171212 () Bool)

(assert (=> d!63805 (=> res!128936 e!171212)))

(assert (=> d!63805 (= res!128936 (and ((_ is Cons!3813) (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (= (_1!2471 (h!4479 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) key!932)))))

(assert (=> d!63805 (= (containsKey!310 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932) e!171212)))

(declare-fun b!264278 () Bool)

(declare-fun e!171213 () Bool)

(assert (=> b!264278 (= e!171212 e!171213)))

(declare-fun res!128937 () Bool)

(assert (=> b!264278 (=> (not res!128937) (not e!171213))))

(assert (=> b!264278 (= res!128937 (and (or (not ((_ is Cons!3813) (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (bvsle (_1!2471 (h!4479 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) key!932)) ((_ is Cons!3813) (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (bvslt (_1!2471 (h!4479 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) key!932)))))

(declare-fun b!264279 () Bool)

(assert (=> b!264279 (= e!171213 (containsKey!310 (t!8885 (toList!1927 (getCurrentListMap!1436 (_keys!7033 thiss!1504) (_values!4825 thiss!1504) (mask!11207 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) key!932))))

(assert (= (and d!63805 (not res!128936)) b!264278))

(assert (= (and b!264278 res!128937) b!264279))

(declare-fun m!280799 () Bool)

(assert (=> b!264279 m!280799))

(assert (=> d!63209 d!63805))

(declare-fun d!63807 () Bool)

(assert (=> d!63807 (= (apply!262 (+!713 lt!133001 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))) lt!132991) (apply!262 lt!133001 lt!132991))))

(assert (=> d!63807 true))

(declare-fun _$34!1138 () Unit!8136)

(assert (=> d!63807 (= (choose!1301 lt!133001 lt!133007 (minValue!4683 thiss!1504) lt!132991) _$34!1138)))

(declare-fun bs!9307 () Bool)

(assert (= bs!9307 d!63807))

(assert (=> bs!9307 m!278615))

(assert (=> bs!9307 m!278615))

(assert (=> bs!9307 m!278617))

(assert (=> bs!9307 m!278605))

(assert (=> d!63081 d!63807))

(declare-fun d!63809 () Bool)

(declare-fun e!171214 () Bool)

(assert (=> d!63809 e!171214))

(declare-fun res!128938 () Bool)

(assert (=> d!63809 (=> res!128938 e!171214)))

(declare-fun lt!133654 () Bool)

(assert (=> d!63809 (= res!128938 (not lt!133654))))

(declare-fun lt!133652 () Bool)

(assert (=> d!63809 (= lt!133654 lt!133652)))

(declare-fun lt!133651 () Unit!8136)

(declare-fun e!171215 () Unit!8136)

(assert (=> d!63809 (= lt!133651 e!171215)))

(declare-fun c!45223 () Bool)

(assert (=> d!63809 (= c!45223 lt!133652)))

(assert (=> d!63809 (= lt!133652 (containsKey!310 (toList!1927 lt!133001) lt!132991))))

(assert (=> d!63809 (= (contains!1889 lt!133001 lt!132991) lt!133654)))

(declare-fun b!264280 () Bool)

(declare-fun lt!133653 () Unit!8136)

(assert (=> b!264280 (= e!171215 lt!133653)))

(assert (=> b!264280 (= lt!133653 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133001) lt!132991))))

(assert (=> b!264280 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133001) lt!132991))))

(declare-fun b!264281 () Bool)

(declare-fun Unit!8200 () Unit!8136)

(assert (=> b!264281 (= e!171215 Unit!8200)))

(declare-fun b!264282 () Bool)

(assert (=> b!264282 (= e!171214 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133001) lt!132991)))))

(assert (= (and d!63809 c!45223) b!264280))

(assert (= (and d!63809 (not c!45223)) b!264281))

(assert (= (and d!63809 (not res!128938)) b!264282))

(declare-fun m!280801 () Bool)

(assert (=> d!63809 m!280801))

(declare-fun m!280803 () Bool)

(assert (=> b!264280 m!280803))

(assert (=> b!264280 m!279021))

(assert (=> b!264280 m!279021))

(declare-fun m!280805 () Bool)

(assert (=> b!264280 m!280805))

(assert (=> b!264282 m!279021))

(assert (=> b!264282 m!279021))

(assert (=> b!264282 m!280805))

(assert (=> d!63081 d!63809))

(assert (=> d!63081 d!63057))

(assert (=> d!63081 d!63071))

(assert (=> d!63081 d!63079))

(declare-fun d!63811 () Bool)

(assert (=> d!63811 (= (get!3088 (getValueByKey!318 (toList!1927 lt!133001) lt!132991)) (v!5502 (getValueByKey!318 (toList!1927 lt!133001) lt!132991)))))

(assert (=> d!63071 d!63811))

(declare-fun b!264284 () Bool)

(declare-fun e!171216 () Option!324)

(declare-fun e!171217 () Option!324)

(assert (=> b!264284 (= e!171216 e!171217)))

(declare-fun c!45225 () Bool)

(assert (=> b!264284 (= c!45225 (and ((_ is Cons!3813) (toList!1927 lt!133001)) (not (= (_1!2471 (h!4479 (toList!1927 lt!133001))) lt!132991))))))

(declare-fun b!264286 () Bool)

(assert (=> b!264286 (= e!171217 None!322)))

(declare-fun d!63813 () Bool)

(declare-fun c!45224 () Bool)

(assert (=> d!63813 (= c!45224 (and ((_ is Cons!3813) (toList!1927 lt!133001)) (= (_1!2471 (h!4479 (toList!1927 lt!133001))) lt!132991)))))

(assert (=> d!63813 (= (getValueByKey!318 (toList!1927 lt!133001) lt!132991) e!171216)))

(declare-fun b!264283 () Bool)

(assert (=> b!264283 (= e!171216 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!133001)))))))

(declare-fun b!264285 () Bool)

(assert (=> b!264285 (= e!171217 (getValueByKey!318 (t!8885 (toList!1927 lt!133001)) lt!132991))))

(assert (= (and d!63813 c!45224) b!264283))

(assert (= (and d!63813 (not c!45224)) b!264284))

(assert (= (and b!264284 c!45225) b!264285))

(assert (= (and b!264284 (not c!45225)) b!264286))

(declare-fun m!280807 () Bool)

(assert (=> b!264285 m!280807))

(assert (=> d!63071 d!63813))

(declare-fun d!63815 () Bool)

(declare-fun lt!133655 () Bool)

(assert (=> d!63815 (= lt!133655 (select (content!176 (toList!1927 lt!133093)) (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun e!171219 () Bool)

(assert (=> d!63815 (= lt!133655 e!171219)))

(declare-fun res!128940 () Bool)

(assert (=> d!63815 (=> (not res!128940) (not e!171219))))

(assert (=> d!63815 (= res!128940 ((_ is Cons!3813) (toList!1927 lt!133093)))))

(assert (=> d!63815 (= (contains!1893 (toList!1927 lt!133093) (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133655)))

(declare-fun b!264287 () Bool)

(declare-fun e!171218 () Bool)

(assert (=> b!264287 (= e!171219 e!171218)))

(declare-fun res!128939 () Bool)

(assert (=> b!264287 (=> res!128939 e!171218)))

(assert (=> b!264287 (= res!128939 (= (h!4479 (toList!1927 lt!133093)) (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!264288 () Bool)

(assert (=> b!264288 (= e!171218 (contains!1893 (t!8885 (toList!1927 lt!133093)) (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63815 res!128940) b!264287))

(assert (= (and b!264287 (not res!128939)) b!264288))

(declare-fun m!280809 () Bool)

(assert (=> d!63815 m!280809))

(declare-fun m!280811 () Bool)

(assert (=> d!63815 m!280811))

(declare-fun m!280813 () Bool)

(assert (=> b!264288 m!280813))

(assert (=> b!263121 d!63815))

(declare-fun d!63817 () Bool)

(assert (=> d!63817 (= (isEmpty!545 lt!133224) (isEmpty!546 (toList!1927 lt!133224)))))

(declare-fun bs!9308 () Bool)

(assert (= bs!9308 d!63817))

(declare-fun m!280815 () Bool)

(assert (=> bs!9308 m!280815))

(assert (=> b!263295 d!63817))

(declare-fun b!264290 () Bool)

(declare-fun e!171220 () Option!324)

(declare-fun e!171221 () Option!324)

(assert (=> b!264290 (= e!171220 e!171221)))

(declare-fun c!45227 () Bool)

(assert (=> b!264290 (= c!45227 (and ((_ is Cons!3813) (t!8885 lt!133020)) (not (= (_1!2471 (h!4479 (t!8885 lt!133020))) (_1!2471 lt!132765)))))))

(declare-fun b!264292 () Bool)

(assert (=> b!264292 (= e!171221 None!322)))

(declare-fun d!63819 () Bool)

(declare-fun c!45226 () Bool)

(assert (=> d!63819 (= c!45226 (and ((_ is Cons!3813) (t!8885 lt!133020)) (= (_1!2471 (h!4479 (t!8885 lt!133020))) (_1!2471 lt!132765))))))

(assert (=> d!63819 (= (getValueByKey!318 (t!8885 lt!133020) (_1!2471 lt!132765)) e!171220)))

(declare-fun b!264289 () Bool)

(assert (=> b!264289 (= e!171220 (Some!323 (_2!2471 (h!4479 (t!8885 lt!133020)))))))

(declare-fun b!264291 () Bool)

(assert (=> b!264291 (= e!171221 (getValueByKey!318 (t!8885 (t!8885 lt!133020)) (_1!2471 lt!132765)))))

(assert (= (and d!63819 c!45226) b!264289))

(assert (= (and d!63819 (not c!45226)) b!264290))

(assert (= (and b!264290 c!45227) b!264291))

(assert (= (and b!264290 (not c!45227)) b!264292))

(declare-fun m!280817 () Bool)

(assert (=> b!264291 m!280817))

(assert (=> b!263482 d!63819))

(declare-fun d!63821 () Bool)

(declare-fun lt!133656 () Bool)

(assert (=> d!63821 (= lt!133656 (select (content!177 Nil!3815) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!171223 () Bool)

(assert (=> d!63821 (= lt!133656 e!171223)))

(declare-fun res!128942 () Bool)

(assert (=> d!63821 (=> (not res!128942) (not e!171223))))

(assert (=> d!63821 (= res!128942 ((_ is Cons!3814) Nil!3815))))

(assert (=> d!63821 (= (contains!1892 Nil!3815 (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)) lt!133656)))

(declare-fun b!264293 () Bool)

(declare-fun e!171222 () Bool)

(assert (=> b!264293 (= e!171223 e!171222)))

(declare-fun res!128941 () Bool)

(assert (=> b!264293 (=> res!128941 e!171222)))

(assert (=> b!264293 (= res!128941 (= (h!4480 Nil!3815) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!264294 () Bool)

(assert (=> b!264294 (= e!171222 (contains!1892 (t!8886 Nil!3815) (select (arr!5992 (_keys!7033 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!63821 res!128942) b!264293))

(assert (= (and b!264293 (not res!128941)) b!264294))

(assert (=> d!63821 m!278929))

(assert (=> d!63821 m!278517))

(declare-fun m!280819 () Bool)

(assert (=> d!63821 m!280819))

(assert (=> b!264294 m!278517))

(declare-fun m!280821 () Bool)

(assert (=> b!264294 m!280821))

(assert (=> b!263211 d!63821))

(declare-fun b!264295 () Bool)

(declare-fun e!171226 () Bool)

(declare-fun e!171225 () Bool)

(assert (=> b!264295 (= e!171226 e!171225)))

(declare-fun lt!133657 () (_ BitVec 64))

(assert (=> b!264295 (= lt!133657 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!133658 () Unit!8136)

(assert (=> b!264295 (= lt!133658 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132768 lt!133657 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!264295 (arrayContainsKey!0 lt!132768 lt!133657 #b00000000000000000000000000000000)))

(declare-fun lt!133659 () Unit!8136)

(assert (=> b!264295 (= lt!133659 lt!133658)))

(declare-fun res!128944 () Bool)

(assert (=> b!264295 (= res!128944 (= (seekEntryOrOpen!0 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!132768 (mask!11207 thiss!1504)) (Found!1193 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!264295 (=> (not res!128944) (not e!171225))))

(declare-fun d!63823 () Bool)

(declare-fun res!128943 () Bool)

(declare-fun e!171224 () Bool)

(assert (=> d!63823 (=> res!128943 e!171224)))

(assert (=> d!63823 (= res!128943 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6344 lt!132768)))))

(assert (=> d!63823 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!132768 (mask!11207 thiss!1504)) e!171224)))

(declare-fun b!264296 () Bool)

(declare-fun call!25276 () Bool)

(assert (=> b!264296 (= e!171225 call!25276)))

(declare-fun b!264297 () Bool)

(assert (=> b!264297 (= e!171224 e!171226)))

(declare-fun c!45228 () Bool)

(assert (=> b!264297 (= c!45228 (validKeyInArray!0 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!264298 () Bool)

(assert (=> b!264298 (= e!171226 call!25276)))

(declare-fun bm!25273 () Bool)

(assert (=> bm!25273 (= call!25276 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!132768 (mask!11207 thiss!1504)))))

(assert (= (and d!63823 (not res!128943)) b!264297))

(assert (= (and b!264297 c!45228) b!264295))

(assert (= (and b!264297 (not c!45228)) b!264298))

(assert (= (and b!264295 res!128944) b!264296))

(assert (= (or b!264296 b!264298) bm!25273))

(assert (=> b!264295 m!280143))

(declare-fun m!280823 () Bool)

(assert (=> b!264295 m!280823))

(declare-fun m!280825 () Bool)

(assert (=> b!264295 m!280825))

(assert (=> b!264295 m!280143))

(declare-fun m!280827 () Bool)

(assert (=> b!264295 m!280827))

(assert (=> b!264297 m!280143))

(assert (=> b!264297 m!280143))

(assert (=> b!264297 m!280145))

(declare-fun m!280829 () Bool)

(assert (=> bm!25273 m!280829))

(assert (=> bm!25220 d!63823))

(assert (=> d!63029 d!63031))

(assert (=> d!63029 d!63033))

(declare-fun d!63825 () Bool)

(assert (=> d!63825 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132775) key!932))))

(assert (=> d!63825 true))

(declare-fun _$12!456 () Unit!8136)

(assert (=> d!63825 (= (choose!1300 (toList!1927 lt!132775) key!932) _$12!456)))

(declare-fun bs!9309 () Bool)

(assert (= bs!9309 d!63825))

(assert (=> bs!9309 m!278713))

(assert (=> bs!9309 m!278713))

(assert (=> bs!9309 m!278715))

(assert (=> d!63029 d!63825))

(declare-fun d!63827 () Bool)

(declare-fun res!128945 () Bool)

(declare-fun e!171227 () Bool)

(assert (=> d!63827 (=> res!128945 e!171227)))

(assert (=> d!63827 (= res!128945 (or ((_ is Nil!3814) (toList!1927 lt!132775)) ((_ is Nil!3814) (t!8885 (toList!1927 lt!132775)))))))

(assert (=> d!63827 (= (isStrictlySorted!372 (toList!1927 lt!132775)) e!171227)))

(declare-fun b!264299 () Bool)

(declare-fun e!171228 () Bool)

(assert (=> b!264299 (= e!171227 e!171228)))

(declare-fun res!128946 () Bool)

(assert (=> b!264299 (=> (not res!128946) (not e!171228))))

(assert (=> b!264299 (= res!128946 (bvslt (_1!2471 (h!4479 (toList!1927 lt!132775))) (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132775))))))))

(declare-fun b!264300 () Bool)

(assert (=> b!264300 (= e!171228 (isStrictlySorted!372 (t!8885 (toList!1927 lt!132775))))))

(assert (= (and d!63827 (not res!128945)) b!264299))

(assert (= (and b!264299 res!128946) b!264300))

(declare-fun m!280831 () Bool)

(assert (=> b!264300 m!280831))

(assert (=> d!63029 d!63827))

(declare-fun d!63829 () Bool)

(declare-fun res!128947 () Bool)

(declare-fun e!171229 () Bool)

(assert (=> d!63829 (=> res!128947 e!171229)))

(assert (=> d!63829 (= res!128947 (and ((_ is Cons!3813) (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))) (= (_1!2471 (h!4479 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))) lt!132970)))))

(assert (=> d!63829 (= (containsKey!310 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))) lt!132970) e!171229)))

(declare-fun b!264301 () Bool)

(declare-fun e!171230 () Bool)

(assert (=> b!264301 (= e!171229 e!171230)))

(declare-fun res!128948 () Bool)

(assert (=> b!264301 (=> (not res!128948) (not e!171230))))

(assert (=> b!264301 (= res!128948 (and (or (not ((_ is Cons!3813) (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))) (bvsle (_1!2471 (h!4479 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))) lt!132970)) ((_ is Cons!3813) (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))) (bvslt (_1!2471 (h!4479 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504)))))) lt!132970)))))

(declare-fun b!264302 () Bool)

(assert (=> b!264302 (= e!171230 (containsKey!310 (t!8885 (toList!1927 (+!713 lt!132977 (tuple2!4921 lt!132974 (zeroValue!4683 thiss!1504))))) lt!132970))))

(assert (= (and d!63829 (not res!128947)) b!264301))

(assert (= (and b!264301 res!128948) b!264302))

(declare-fun m!280833 () Bool)

(assert (=> b!264302 m!280833))

(assert (=> d!63099 d!63829))

(assert (=> bm!25194 d!63345))

(declare-fun b!264303 () Bool)

(declare-fun e!171233 () Bool)

(declare-fun e!171232 () Bool)

(assert (=> b!264303 (= e!171233 e!171232)))

(declare-fun lt!133660 () (_ BitVec 64))

(assert (=> b!264303 (= lt!133660 (select (arr!5992 (_keys!7033 lt!132778)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!133661 () Unit!8136)

(assert (=> b!264303 (= lt!133661 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!7033 lt!132778) lt!133660 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!264303 (arrayContainsKey!0 (_keys!7033 lt!132778) lt!133660 #b00000000000000000000000000000000)))

(declare-fun lt!133662 () Unit!8136)

(assert (=> b!264303 (= lt!133662 lt!133661)))

(declare-fun res!128950 () Bool)

(assert (=> b!264303 (= res!128950 (= (seekEntryOrOpen!0 (select (arr!5992 (_keys!7033 lt!132778)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!7033 lt!132778) (mask!11207 lt!132778)) (Found!1193 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!264303 (=> (not res!128950) (not e!171232))))

(declare-fun d!63831 () Bool)

(declare-fun res!128949 () Bool)

(declare-fun e!171231 () Bool)

(assert (=> d!63831 (=> res!128949 e!171231)))

(assert (=> d!63831 (= res!128949 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 lt!132778))))))

(assert (=> d!63831 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!7033 lt!132778) (mask!11207 lt!132778)) e!171231)))

(declare-fun b!264304 () Bool)

(declare-fun call!25277 () Bool)

(assert (=> b!264304 (= e!171232 call!25277)))

(declare-fun b!264305 () Bool)

(assert (=> b!264305 (= e!171231 e!171233)))

(declare-fun c!45229 () Bool)

(assert (=> b!264305 (= c!45229 (validKeyInArray!0 (select (arr!5992 (_keys!7033 lt!132778)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!264306 () Bool)

(assert (=> b!264306 (= e!171233 call!25277)))

(declare-fun bm!25274 () Bool)

(assert (=> bm!25274 (= call!25277 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!7033 lt!132778) (mask!11207 lt!132778)))))

(assert (= (and d!63831 (not res!128949)) b!264305))

(assert (= (and b!264305 c!45229) b!264303))

(assert (= (and b!264305 (not c!45229)) b!264306))

(assert (= (and b!264303 res!128950) b!264304))

(assert (= (or b!264304 b!264306) bm!25274))

(assert (=> b!264303 m!279617))

(declare-fun m!280835 () Bool)

(assert (=> b!264303 m!280835))

(declare-fun m!280837 () Bool)

(assert (=> b!264303 m!280837))

(assert (=> b!264303 m!279617))

(declare-fun m!280839 () Bool)

(assert (=> b!264303 m!280839))

(assert (=> b!264305 m!279617))

(assert (=> b!264305 m!279617))

(assert (=> b!264305 m!279619))

(declare-fun m!280841 () Bool)

(assert (=> bm!25274 m!280841))

(assert (=> bm!25181 d!63831))

(assert (=> d!63123 d!63565))

(assert (=> b!263137 d!63435))

(assert (=> b!263266 d!63001))

(declare-fun d!63833 () Bool)

(declare-fun lt!133663 () Bool)

(assert (=> d!63833 (= lt!133663 (select (content!176 (toList!1927 lt!133154)) (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))))

(declare-fun e!171235 () Bool)

(assert (=> d!63833 (= lt!133663 e!171235)))

(declare-fun res!128952 () Bool)

(assert (=> d!63833 (=> (not res!128952) (not e!171235))))

(assert (=> d!63833 (= res!128952 ((_ is Cons!3813) (toList!1927 lt!133154)))))

(assert (=> d!63833 (= (contains!1893 (toList!1927 lt!133154) (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))) lt!133663)))

(declare-fun b!264307 () Bool)

(declare-fun e!171234 () Bool)

(assert (=> b!264307 (= e!171235 e!171234)))

(declare-fun res!128951 () Bool)

(assert (=> b!264307 (=> res!128951 e!171234)))

(assert (=> b!264307 (= res!128951 (= (h!4479 (toList!1927 lt!133154)) (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))))

(declare-fun b!264308 () Bool)

(assert (=> b!264308 (= e!171234 (contains!1893 (t!8885 (toList!1927 lt!133154)) (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!63833 res!128952) b!264307))

(assert (= (and b!264307 (not res!128951)) b!264308))

(declare-fun m!280843 () Bool)

(assert (=> d!63833 m!280843))

(declare-fun m!280845 () Bool)

(assert (=> d!63833 m!280845))

(declare-fun m!280847 () Bool)

(assert (=> b!264308 m!280847))

(assert (=> b!263224 d!63833))

(assert (=> d!63125 d!63015))

(assert (=> d!63095 d!63093))

(assert (=> d!63095 d!63097))

(declare-fun d!63835 () Bool)

(declare-fun e!171236 () Bool)

(assert (=> d!63835 e!171236))

(declare-fun res!128953 () Bool)

(assert (=> d!63835 (=> res!128953 e!171236)))

(declare-fun lt!133667 () Bool)

(assert (=> d!63835 (= res!128953 (not lt!133667))))

(declare-fun lt!133665 () Bool)

(assert (=> d!63835 (= lt!133667 lt!133665)))

(declare-fun lt!133664 () Unit!8136)

(declare-fun e!171237 () Unit!8136)

(assert (=> d!63835 (= lt!133664 e!171237)))

(declare-fun c!45230 () Bool)

(assert (=> d!63835 (= c!45230 lt!133665)))

(assert (=> d!63835 (= lt!133665 (containsKey!310 (toList!1927 lt!132973) lt!132975))))

(assert (=> d!63835 (= (contains!1889 lt!132973 lt!132975) lt!133667)))

(declare-fun b!264309 () Bool)

(declare-fun lt!133666 () Unit!8136)

(assert (=> b!264309 (= e!171237 lt!133666)))

(assert (=> b!264309 (= lt!133666 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!132973) lt!132975))))

(assert (=> b!264309 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132973) lt!132975))))

(declare-fun b!264310 () Bool)

(declare-fun Unit!8201 () Unit!8136)

(assert (=> b!264310 (= e!171237 Unit!8201)))

(declare-fun b!264311 () Bool)

(assert (=> b!264311 (= e!171236 (isDefined!260 (getValueByKey!318 (toList!1927 lt!132973) lt!132975)))))

(assert (= (and d!63835 c!45230) b!264309))

(assert (= (and d!63835 (not c!45230)) b!264310))

(assert (= (and d!63835 (not res!128953)) b!264311))

(declare-fun m!280849 () Bool)

(assert (=> d!63835 m!280849))

(declare-fun m!280851 () Bool)

(assert (=> b!264309 m!280851))

(assert (=> b!264309 m!279121))

(assert (=> b!264309 m!279121))

(declare-fun m!280853 () Bool)

(assert (=> b!264309 m!280853))

(assert (=> b!264311 m!279121))

(assert (=> b!264311 m!279121))

(assert (=> b!264311 m!280853))

(assert (=> d!63095 d!63835))

(assert (=> d!63095 d!63117))

(declare-fun d!63837 () Bool)

(assert (=> d!63837 (= (apply!262 (+!713 lt!132973 (tuple2!4921 lt!132968 (minValue!4683 thiss!1504))) lt!132975) (apply!262 lt!132973 lt!132975))))

(assert (=> d!63837 true))

(declare-fun _$34!1139 () Unit!8136)

(assert (=> d!63837 (= (choose!1301 lt!132973 lt!132968 (minValue!4683 thiss!1504) lt!132975) _$34!1139)))

(declare-fun bs!9310 () Bool)

(assert (= bs!9310 d!63837))

(assert (=> bs!9310 m!278535))

(assert (=> bs!9310 m!278535))

(assert (=> bs!9310 m!278555))

(assert (=> bs!9310 m!278559))

(assert (=> d!63095 d!63837))

(declare-fun d!63839 () Bool)

(assert (=> d!63839 (= (isEmpty!544 (getValueByKey!318 (toList!1927 lt!132763) key!932)) (not ((_ is Some!323) (getValueByKey!318 (toList!1927 lt!132763) key!932))))))

(assert (=> d!63177 d!63839))

(declare-fun d!63841 () Bool)

(declare-fun lt!133668 () Bool)

(assert (=> d!63841 (= lt!133668 (select (content!176 lt!133334) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))))))

(declare-fun e!171239 () Bool)

(assert (=> d!63841 (= lt!133668 e!171239)))

(declare-fun res!128955 () Bool)

(assert (=> d!63841 (=> (not res!128955) (not e!171239))))

(assert (=> d!63841 (= res!128955 ((_ is Cons!3813) lt!133334))))

(assert (=> d!63841 (= (contains!1893 lt!133334 (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))) lt!133668)))

(declare-fun b!264312 () Bool)

(declare-fun e!171238 () Bool)

(assert (=> b!264312 (= e!171239 e!171238)))

(declare-fun res!128954 () Bool)

(assert (=> b!264312 (=> res!128954 e!171238)))

(assert (=> b!264312 (= res!128954 (= (h!4479 lt!133334) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))))))

(declare-fun b!264313 () Bool)

(assert (=> b!264313 (= e!171238 (contains!1893 (t!8885 lt!133334) (tuple2!4921 (_1!2471 lt!132765) (_2!2471 lt!132765))))))

(assert (= (and d!63841 res!128955) b!264312))

(assert (= (and b!264312 (not res!128954)) b!264313))

(declare-fun m!280855 () Bool)

(assert (=> d!63841 m!280855))

(declare-fun m!280857 () Bool)

(assert (=> d!63841 m!280857))

(declare-fun m!280859 () Bool)

(assert (=> b!264313 m!280859))

(assert (=> b!263535 d!63841))

(assert (=> b!263411 d!63327))

(declare-fun d!63843 () Bool)

(assert (=> d!63843 (= (apply!262 lt!133245 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3088 (getValueByKey!318 (toList!1927 lt!133245) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9311 () Bool)

(assert (= bs!9311 d!63843))

(assert (=> bs!9311 m!280669))

(assert (=> bs!9311 m!280669))

(declare-fun m!280861 () Bool)

(assert (=> bs!9311 m!280861))

(assert (=> b!263303 d!63843))

(declare-fun d!63845 () Bool)

(declare-fun e!171240 () Bool)

(assert (=> d!63845 e!171240))

(declare-fun res!128956 () Bool)

(assert (=> d!63845 (=> res!128956 e!171240)))

(declare-fun lt!133672 () Bool)

(assert (=> d!63845 (= res!128956 (not lt!133672))))

(declare-fun lt!133670 () Bool)

(assert (=> d!63845 (= lt!133672 lt!133670)))

(declare-fun lt!133669 () Unit!8136)

(declare-fun e!171241 () Unit!8136)

(assert (=> d!63845 (= lt!133669 e!171241)))

(declare-fun c!45231 () Bool)

(assert (=> d!63845 (= c!45231 lt!133670)))

(assert (=> d!63845 (= lt!133670 (containsKey!310 (toList!1927 lt!133093) (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63845 (= (contains!1889 lt!133093 (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) lt!133672)))

(declare-fun b!264314 () Bool)

(declare-fun lt!133671 () Unit!8136)

(assert (=> b!264314 (= e!171241 lt!133671)))

(assert (=> b!264314 (= lt!133671 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133093) (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> b!264314 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133093) (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!264315 () Bool)

(declare-fun Unit!8202 () Unit!8136)

(assert (=> b!264315 (= e!171241 Unit!8202)))

(declare-fun b!264316 () Bool)

(assert (=> b!264316 (= e!171240 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133093) (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (= (and d!63845 c!45231) b!264314))

(assert (= (and d!63845 (not c!45231)) b!264315))

(assert (= (and d!63845 (not res!128956)) b!264316))

(declare-fun m!280863 () Bool)

(assert (=> d!63845 m!280863))

(declare-fun m!280865 () Bool)

(assert (=> b!264314 m!280865))

(assert (=> b!264314 m!278799))

(assert (=> b!264314 m!278799))

(declare-fun m!280867 () Bool)

(assert (=> b!264314 m!280867))

(assert (=> b!264316 m!278799))

(assert (=> b!264316 m!278799))

(assert (=> b!264316 m!280867))

(assert (=> d!62997 d!63845))

(declare-fun b!264318 () Bool)

(declare-fun e!171242 () Option!324)

(declare-fun e!171243 () Option!324)

(assert (=> b!264318 (= e!171242 e!171243)))

(declare-fun c!45233 () Bool)

(assert (=> b!264318 (= c!45233 (and ((_ is Cons!3813) lt!133092) (not (= (_1!2471 (h!4479 lt!133092)) (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))))

(declare-fun b!264320 () Bool)

(assert (=> b!264320 (= e!171243 None!322)))

(declare-fun d!63847 () Bool)

(declare-fun c!45232 () Bool)

(assert (=> d!63847 (= c!45232 (and ((_ is Cons!3813) lt!133092) (= (_1!2471 (h!4479 lt!133092)) (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (=> d!63847 (= (getValueByKey!318 lt!133092 (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) e!171242)))

(declare-fun b!264317 () Bool)

(assert (=> b!264317 (= e!171242 (Some!323 (_2!2471 (h!4479 lt!133092))))))

(declare-fun b!264319 () Bool)

(assert (=> b!264319 (= e!171243 (getValueByKey!318 (t!8885 lt!133092) (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63847 c!45232) b!264317))

(assert (= (and d!63847 (not c!45232)) b!264318))

(assert (= (and b!264318 c!45233) b!264319))

(assert (= (and b!264318 (not c!45233)) b!264320))

(declare-fun m!280869 () Bool)

(assert (=> b!264319 m!280869))

(assert (=> d!62997 d!63847))

(declare-fun d!63849 () Bool)

(assert (=> d!63849 (= (getValueByKey!318 lt!133092 (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) (Some!323 (_2!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun lt!133673 () Unit!8136)

(assert (=> d!63849 (= lt!133673 (choose!1303 lt!133092 (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun e!171244 () Bool)

(assert (=> d!63849 e!171244))

(declare-fun res!128957 () Bool)

(assert (=> d!63849 (=> (not res!128957) (not e!171244))))

(assert (=> d!63849 (= res!128957 (isStrictlySorted!372 lt!133092))))

(assert (=> d!63849 (= (lemmaContainsTupThenGetReturnValue!177 lt!133092 (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) lt!133673)))

(declare-fun b!264321 () Bool)

(declare-fun res!128958 () Bool)

(assert (=> b!264321 (=> (not res!128958) (not e!171244))))

(assert (=> b!264321 (= res!128958 (containsKey!310 lt!133092 (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!264322 () Bool)

(assert (=> b!264322 (= e!171244 (contains!1893 lt!133092 (tuple2!4921 (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (= (and d!63849 res!128957) b!264321))

(assert (= (and b!264321 res!128958) b!264322))

(assert (=> d!63849 m!278793))

(declare-fun m!280871 () Bool)

(assert (=> d!63849 m!280871))

(declare-fun m!280873 () Bool)

(assert (=> d!63849 m!280873))

(declare-fun m!280875 () Bool)

(assert (=> b!264321 m!280875))

(declare-fun m!280877 () Bool)

(assert (=> b!264322 m!280877))

(assert (=> d!62997 d!63849))

(declare-fun b!264323 () Bool)

(declare-fun e!171246 () List!3817)

(declare-fun call!25278 () List!3817)

(assert (=> b!264323 (= e!171246 call!25278)))

(declare-fun b!264324 () Bool)

(declare-fun e!171248 () List!3817)

(declare-fun call!25279 () List!3817)

(assert (=> b!264324 (= e!171248 call!25279)))

(declare-fun b!264325 () Bool)

(declare-fun c!45236 () Bool)

(declare-fun c!45235 () Bool)

(declare-fun e!171249 () List!3817)

(assert (=> b!264325 (= e!171249 (ite c!45236 (t!8885 (toList!1927 (ite c!44831 call!25149 (ite c!44828 call!25151 call!25148)))) (ite c!45235 (Cons!3813 (h!4479 (toList!1927 (ite c!44831 call!25149 (ite c!44828 call!25151 call!25148)))) (t!8885 (toList!1927 (ite c!44831 call!25149 (ite c!44828 call!25151 call!25148))))) Nil!3814)))))

(declare-fun b!264326 () Bool)

(declare-fun lt!133674 () List!3817)

(declare-fun e!171245 () Bool)

(assert (=> b!264326 (= e!171245 (contains!1893 lt!133674 (tuple2!4921 (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun bm!25275 () Bool)

(declare-fun call!25280 () List!3817)

(assert (=> bm!25275 (= call!25280 call!25278)))

(declare-fun b!264327 () Bool)

(declare-fun res!128960 () Bool)

(assert (=> b!264327 (=> (not res!128960) (not e!171245))))

(assert (=> b!264327 (= res!128960 (containsKey!310 lt!133674 (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!264328 () Bool)

(assert (=> b!264328 (= e!171248 call!25279)))

(declare-fun b!264329 () Bool)

(assert (=> b!264329 (= e!171249 (insertStrictlySorted!180 (t!8885 (toList!1927 (ite c!44831 call!25149 (ite c!44828 call!25151 call!25148)))) (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun d!63851 () Bool)

(assert (=> d!63851 e!171245))

(declare-fun res!128959 () Bool)

(assert (=> d!63851 (=> (not res!128959) (not e!171245))))

(assert (=> d!63851 (= res!128959 (isStrictlySorted!372 lt!133674))))

(assert (=> d!63851 (= lt!133674 e!171246)))

(declare-fun c!45237 () Bool)

(assert (=> d!63851 (= c!45237 (and ((_ is Cons!3813) (toList!1927 (ite c!44831 call!25149 (ite c!44828 call!25151 call!25148)))) (bvslt (_1!2471 (h!4479 (toList!1927 (ite c!44831 call!25149 (ite c!44828 call!25151 call!25148))))) (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (=> d!63851 (isStrictlySorted!372 (toList!1927 (ite c!44831 call!25149 (ite c!44828 call!25151 call!25148))))))

(assert (=> d!63851 (= (insertStrictlySorted!180 (toList!1927 (ite c!44831 call!25149 (ite c!44828 call!25151 call!25148))) (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) lt!133674)))

(declare-fun b!264330 () Bool)

(assert (=> b!264330 (= c!45235 (and ((_ is Cons!3813) (toList!1927 (ite c!44831 call!25149 (ite c!44828 call!25151 call!25148)))) (bvsgt (_1!2471 (h!4479 (toList!1927 (ite c!44831 call!25149 (ite c!44828 call!25151 call!25148))))) (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun e!171247 () List!3817)

(assert (=> b!264330 (= e!171247 e!171248)))

(declare-fun bm!25276 () Bool)

(assert (=> bm!25276 (= call!25278 ($colon$colon!107 e!171249 (ite c!45237 (h!4479 (toList!1927 (ite c!44831 call!25149 (ite c!44828 call!25151 call!25148)))) (tuple2!4921 (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))))

(declare-fun c!45234 () Bool)

(assert (=> bm!25276 (= c!45234 c!45237)))

(declare-fun bm!25277 () Bool)

(assert (=> bm!25277 (= call!25279 call!25280)))

(declare-fun b!264331 () Bool)

(assert (=> b!264331 (= e!171247 call!25280)))

(declare-fun b!264332 () Bool)

(assert (=> b!264332 (= e!171246 e!171247)))

(assert (=> b!264332 (= c!45236 (and ((_ is Cons!3813) (toList!1927 (ite c!44831 call!25149 (ite c!44828 call!25151 call!25148)))) (= (_1!2471 (h!4479 (toList!1927 (ite c!44831 call!25149 (ite c!44828 call!25151 call!25148))))) (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (= (and d!63851 c!45237) b!264323))

(assert (= (and d!63851 (not c!45237)) b!264332))

(assert (= (and b!264332 c!45236) b!264331))

(assert (= (and b!264332 (not c!45236)) b!264330))

(assert (= (and b!264330 c!45235) b!264328))

(assert (= (and b!264330 (not c!45235)) b!264324))

(assert (= (or b!264328 b!264324) bm!25277))

(assert (= (or b!264331 bm!25277) bm!25275))

(assert (= (or b!264323 bm!25275) bm!25276))

(assert (= (and bm!25276 c!45234) b!264329))

(assert (= (and bm!25276 (not c!45234)) b!264325))

(assert (= (and d!63851 res!128959) b!264327))

(assert (= (and b!264327 res!128960) b!264326))

(declare-fun m!280879 () Bool)

(assert (=> b!264329 m!280879))

(declare-fun m!280881 () Bool)

(assert (=> bm!25276 m!280881))

(declare-fun m!280883 () Bool)

(assert (=> b!264326 m!280883))

(declare-fun m!280885 () Bool)

(assert (=> b!264327 m!280885))

(declare-fun m!280887 () Bool)

(assert (=> d!63851 m!280887))

(declare-fun m!280889 () Bool)

(assert (=> d!63851 m!280889))

(assert (=> d!62997 d!63851))

(assert (=> bm!25180 d!63445))

(declare-fun d!63853 () Bool)

(declare-fun lt!133675 () Bool)

(assert (=> d!63853 (= lt!133675 (select (content!177 Nil!3815) (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)))))

(declare-fun e!171251 () Bool)

(assert (=> d!63853 (= lt!133675 e!171251)))

(declare-fun res!128962 () Bool)

(assert (=> d!63853 (=> (not res!128962) (not e!171251))))

(assert (=> d!63853 (= res!128962 ((_ is Cons!3814) Nil!3815))))

(assert (=> d!63853 (= (contains!1892 Nil!3815 (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)) lt!133675)))

(declare-fun b!264333 () Bool)

(declare-fun e!171250 () Bool)

(assert (=> b!264333 (= e!171251 e!171250)))

(declare-fun res!128961 () Bool)

(assert (=> b!264333 (=> res!128961 e!171250)))

(assert (=> b!264333 (= res!128961 (= (h!4480 Nil!3815) (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)))))

(declare-fun b!264334 () Bool)

(assert (=> b!264334 (= e!171250 (contains!1892 (t!8886 Nil!3815) (select (arr!5992 (_keys!7033 lt!132778)) #b00000000000000000000000000000000)))))

(assert (= (and d!63853 res!128962) b!264333))

(assert (= (and b!264333 (not res!128961)) b!264334))

(assert (=> d!63853 m!278929))

(assert (=> d!63853 m!278889))

(declare-fun m!280891 () Bool)

(assert (=> d!63853 m!280891))

(assert (=> b!264334 m!278889))

(declare-fun m!280893 () Bool)

(assert (=> b!264334 m!280893))

(assert (=> b!263428 d!63853))

(declare-fun b!264335 () Bool)

(declare-fun e!171253 () (_ BitVec 32))

(declare-fun call!25281 () (_ BitVec 32))

(assert (=> b!264335 (= e!171253 call!25281)))

(declare-fun bm!25278 () Bool)

(assert (=> bm!25278 (= call!25281 (arrayCountValidKeys!0 lt!132768 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(declare-fun b!264336 () Bool)

(declare-fun e!171252 () (_ BitVec 32))

(assert (=> b!264336 (= e!171252 e!171253)))

(declare-fun c!45239 () Bool)

(assert (=> b!264336 (= c!45239 (validKeyInArray!0 (select (arr!5992 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!264337 () Bool)

(assert (=> b!264337 (= e!171252 #b00000000000000000000000000000000)))

(declare-fun b!264338 () Bool)

(assert (=> b!264338 (= e!171253 (bvadd #b00000000000000000000000000000001 call!25281))))

(declare-fun d!63855 () Bool)

(declare-fun lt!133676 () (_ BitVec 32))

(assert (=> d!63855 (and (bvsge lt!133676 #b00000000000000000000000000000000) (bvsle lt!133676 (bvsub (size!6344 lt!132768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!63855 (= lt!133676 e!171252)))

(declare-fun c!45238 () Bool)

(assert (=> d!63855 (= c!45238 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))))))

(assert (=> d!63855 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6344 (_keys!7033 thiss!1504)) (size!6344 lt!132768)))))

(assert (=> d!63855 (= (arrayCountValidKeys!0 lt!132768 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6344 (_keys!7033 thiss!1504))) lt!133676)))

(assert (= (and d!63855 c!45238) b!264337))

(assert (= (and d!63855 (not c!45238)) b!264336))

(assert (= (and b!264336 c!45239) b!264338))

(assert (= (and b!264336 (not c!45239)) b!264335))

(assert (= (or b!264338 b!264335) bm!25278))

(declare-fun m!280895 () Bool)

(assert (=> bm!25278 m!280895))

(assert (=> b!264336 m!280143))

(assert (=> b!264336 m!280143))

(assert (=> b!264336 m!280145))

(assert (=> bm!25196 d!63855))

(assert (=> d!63005 d!63015))

(declare-fun d!63857 () Bool)

(assert (=> d!63857 (= (get!3088 (getValueByKey!318 (toList!1927 lt!132981) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!5502 (getValueByKey!318 (toList!1927 lt!132981) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63173 d!63857))

(assert (=> d!63173 d!63279))

(declare-fun d!63859 () Bool)

(assert (=> d!63859 (= (size!6349 lt!132778) (bvadd (_size!1983 lt!132778) (bvsdiv (bvadd (extraKeys!4579 lt!132778) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!263171 d!63859))

(assert (=> d!63153 d!63155))

(declare-fun d!63861 () Bool)

(assert (=> d!63861 (arrayContainsKey!0 lt!132768 lt!133033 #b00000000000000000000000000000000)))

(assert (=> d!63861 true))

(declare-fun _$60!388 () Unit!8136)

(assert (=> d!63861 (= (choose!13 lt!132768 lt!133033 #b00000000000000000000000000000000) _$60!388)))

(declare-fun bs!9312 () Bool)

(assert (= bs!9312 d!63861))

(assert (=> bs!9312 m!278677))

(assert (=> d!63153 d!63861))

(declare-fun d!63863 () Bool)

(assert (=> d!63863 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133021) (_1!2471 lt!132765)))))

(declare-fun lt!133677 () Unit!8136)

(assert (=> d!63863 (= lt!133677 (choose!1300 (toList!1927 lt!133021) (_1!2471 lt!132765)))))

(declare-fun e!171254 () Bool)

(assert (=> d!63863 e!171254))

(declare-fun res!128963 () Bool)

(assert (=> d!63863 (=> (not res!128963) (not e!171254))))

(assert (=> d!63863 (= res!128963 (isStrictlySorted!372 (toList!1927 lt!133021)))))

(assert (=> d!63863 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133021) (_1!2471 lt!132765)) lt!133677)))

(declare-fun b!264339 () Bool)

(assert (=> b!264339 (= e!171254 (containsKey!310 (toList!1927 lt!133021) (_1!2471 lt!132765)))))

(assert (= (and d!63863 res!128963) b!264339))

(assert (=> d!63863 m!278665))

(assert (=> d!63863 m!278665))

(assert (=> d!63863 m!279419))

(declare-fun m!280897 () Bool)

(assert (=> d!63863 m!280897))

(declare-fun m!280899 () Bool)

(assert (=> d!63863 m!280899))

(assert (=> b!264339 m!279415))

(assert (=> b!263477 d!63863))

(assert (=> b!263477 d!63337))

(assert (=> b!263477 d!63167))

(declare-fun d!63865 () Bool)

(assert (=> d!63865 (= (get!3088 (getValueByKey!318 (toList!1927 lt!132971) lt!132972)) (v!5502 (getValueByKey!318 (toList!1927 lt!132971) lt!132972)))))

(assert (=> d!63107 d!63865))

(declare-fun b!264341 () Bool)

(declare-fun e!171255 () Option!324)

(declare-fun e!171256 () Option!324)

(assert (=> b!264341 (= e!171255 e!171256)))

(declare-fun c!45241 () Bool)

(assert (=> b!264341 (= c!45241 (and ((_ is Cons!3813) (toList!1927 lt!132971)) (not (= (_1!2471 (h!4479 (toList!1927 lt!132971))) lt!132972))))))

(declare-fun b!264343 () Bool)

(assert (=> b!264343 (= e!171256 None!322)))

(declare-fun d!63867 () Bool)

(declare-fun c!45240 () Bool)

(assert (=> d!63867 (= c!45240 (and ((_ is Cons!3813) (toList!1927 lt!132971)) (= (_1!2471 (h!4479 (toList!1927 lt!132971))) lt!132972)))))

(assert (=> d!63867 (= (getValueByKey!318 (toList!1927 lt!132971) lt!132972) e!171255)))

(declare-fun b!264340 () Bool)

(assert (=> b!264340 (= e!171255 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!132971)))))))

(declare-fun b!264342 () Bool)

(assert (=> b!264342 (= e!171256 (getValueByKey!318 (t!8885 (toList!1927 lt!132971)) lt!132972))))

(assert (= (and d!63867 c!45240) b!264340))

(assert (= (and d!63867 (not c!45240)) b!264341))

(assert (= (and b!264341 c!45241) b!264342))

(assert (= (and b!264341 (not c!45241)) b!264343))

(declare-fun m!280901 () Bool)

(assert (=> b!264342 m!280901))

(assert (=> d!63107 d!63867))

(declare-fun d!63869 () Bool)

(declare-fun res!128964 () Bool)

(declare-fun e!171257 () Bool)

(assert (=> d!63869 (=> res!128964 e!171257)))

(assert (=> d!63869 (= res!128964 (and ((_ is Cons!3813) (toList!1927 lt!132981)) (= (_1!2471 (h!4479 (toList!1927 lt!132981))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63869 (= (containsKey!310 (toList!1927 lt!132981) #b0000000000000000000000000000000000000000000000000000000000000000) e!171257)))

(declare-fun b!264344 () Bool)

(declare-fun e!171258 () Bool)

(assert (=> b!264344 (= e!171257 e!171258)))

(declare-fun res!128965 () Bool)

(assert (=> b!264344 (=> (not res!128965) (not e!171258))))

(assert (=> b!264344 (= res!128965 (and (or (not ((_ is Cons!3813) (toList!1927 lt!132981))) (bvsle (_1!2471 (h!4479 (toList!1927 lt!132981))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!3813) (toList!1927 lt!132981)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!132981))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264345 () Bool)

(assert (=> b!264345 (= e!171258 (containsKey!310 (t!8885 (toList!1927 lt!132981)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63869 (not res!128964)) b!264344))

(assert (= (and b!264344 res!128965) b!264345))

(declare-fun m!280903 () Bool)

(assert (=> b!264345 m!280903))

(assert (=> d!63181 d!63869))

(assert (=> b!263416 d!63687))

(assert (=> b!263416 d!63443))

(assert (=> b!263302 d!63151))

(declare-fun d!63871 () Bool)

(declare-fun e!171259 () Bool)

(assert (=> d!63871 e!171259))

(declare-fun res!128966 () Bool)

(assert (=> d!63871 (=> res!128966 e!171259)))

(declare-fun lt!133681 () Bool)

(assert (=> d!63871 (= res!128966 (not lt!133681))))

(declare-fun lt!133679 () Bool)

(assert (=> d!63871 (= lt!133681 lt!133679)))

(declare-fun lt!133678 () Unit!8136)

(declare-fun e!171260 () Unit!8136)

(assert (=> d!63871 (= lt!133678 e!171260)))

(declare-fun c!45242 () Bool)

(assert (=> d!63871 (= c!45242 lt!133679)))

(assert (=> d!63871 (= lt!133679 (containsKey!310 (toList!1927 lt!133154) (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63871 (= (contains!1889 lt!133154 (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) lt!133681)))

(declare-fun b!264346 () Bool)

(declare-fun lt!133680 () Unit!8136)

(assert (=> b!264346 (= e!171260 lt!133680)))

(assert (=> b!264346 (= lt!133680 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133154) (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))))

(assert (=> b!264346 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133154) (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!264347 () Bool)

(declare-fun Unit!8203 () Unit!8136)

(assert (=> b!264347 (= e!171260 Unit!8203)))

(declare-fun b!264348 () Bool)

(assert (=> b!264348 (= e!171259 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133154) (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!63871 c!45242) b!264346))

(assert (= (and d!63871 (not c!45242)) b!264347))

(assert (= (and d!63871 (not res!128966)) b!264348))

(declare-fun m!280905 () Bool)

(assert (=> d!63871 m!280905))

(declare-fun m!280907 () Bool)

(assert (=> b!264346 m!280907))

(assert (=> b!264346 m!278993))

(assert (=> b!264346 m!278993))

(declare-fun m!280909 () Bool)

(assert (=> b!264346 m!280909))

(assert (=> b!264348 m!278993))

(assert (=> b!264348 m!278993))

(assert (=> b!264348 m!280909))

(assert (=> d!63061 d!63871))

(declare-fun b!264350 () Bool)

(declare-fun e!171261 () Option!324)

(declare-fun e!171262 () Option!324)

(assert (=> b!264350 (= e!171261 e!171262)))

(declare-fun c!45244 () Bool)

(assert (=> b!264350 (= c!45244 (and ((_ is Cons!3813) lt!133153) (not (= (_1!2471 (h!4479 lt!133153)) (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))))))

(declare-fun b!264352 () Bool)

(assert (=> b!264352 (= e!171262 None!322)))

(declare-fun c!45243 () Bool)

(declare-fun d!63873 () Bool)

(assert (=> d!63873 (= c!45243 (and ((_ is Cons!3813) lt!133153) (= (_1!2471 (h!4479 lt!133153)) (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63873 (= (getValueByKey!318 lt!133153 (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) e!171261)))

(declare-fun b!264349 () Bool)

(assert (=> b!264349 (= e!171261 (Some!323 (_2!2471 (h!4479 lt!133153))))))

(declare-fun b!264351 () Bool)

(assert (=> b!264351 (= e!171262 (getValueByKey!318 (t!8885 lt!133153) (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))))

(assert (= (and d!63873 c!45243) b!264349))

(assert (= (and d!63873 (not c!45243)) b!264350))

(assert (= (and b!264350 c!45244) b!264351))

(assert (= (and b!264350 (not c!45244)) b!264352))

(declare-fun m!280911 () Bool)

(assert (=> b!264351 m!280911))

(assert (=> d!63061 d!63873))

(declare-fun d!63875 () Bool)

(assert (=> d!63875 (= (getValueByKey!318 lt!133153 (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133682 () Unit!8136)

(assert (=> d!63875 (= lt!133682 (choose!1303 lt!133153 (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))))

(declare-fun e!171263 () Bool)

(assert (=> d!63875 e!171263))

(declare-fun res!128967 () Bool)

(assert (=> d!63875 (=> (not res!128967) (not e!171263))))

(assert (=> d!63875 (= res!128967 (isStrictlySorted!372 lt!133153))))

(assert (=> d!63875 (= (lemmaContainsTupThenGetReturnValue!177 lt!133153 (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) lt!133682)))

(declare-fun b!264353 () Bool)

(declare-fun res!128968 () Bool)

(assert (=> b!264353 (=> (not res!128968) (not e!171263))))

(assert (=> b!264353 (= res!128968 (containsKey!310 lt!133153 (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!264354 () Bool)

(assert (=> b!264354 (= e!171263 (contains!1893 lt!133153 (tuple2!4921 (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!63875 res!128967) b!264353))

(assert (= (and b!264353 res!128968) b!264354))

(assert (=> d!63875 m!278987))

(declare-fun m!280913 () Bool)

(assert (=> d!63875 m!280913))

(declare-fun m!280915 () Bool)

(assert (=> d!63875 m!280915))

(declare-fun m!280917 () Bool)

(assert (=> b!264353 m!280917))

(declare-fun m!280919 () Bool)

(assert (=> b!264354 m!280919))

(assert (=> d!63061 d!63875))

(declare-fun b!264355 () Bool)

(declare-fun e!171265 () List!3817)

(declare-fun call!25282 () List!3817)

(assert (=> b!264355 (= e!171265 call!25282)))

(declare-fun b!264356 () Bool)

(declare-fun e!171267 () List!3817)

(declare-fun call!25283 () List!3817)

(assert (=> b!264356 (= e!171267 call!25283)))

(declare-fun e!171268 () List!3817)

(declare-fun b!264357 () Bool)

(declare-fun c!45246 () Bool)

(declare-fun c!45247 () Bool)

(assert (=> b!264357 (= e!171268 (ite c!45247 (t!8885 (toList!1927 lt!132999)) (ite c!45246 (Cons!3813 (h!4479 (toList!1927 lt!132999)) (t!8885 (toList!1927 lt!132999))) Nil!3814)))))

(declare-fun b!264358 () Bool)

(declare-fun e!171264 () Bool)

(declare-fun lt!133683 () List!3817)

(assert (=> b!264358 (= e!171264 (contains!1893 lt!133683 (tuple2!4921 (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))))))

(declare-fun bm!25279 () Bool)

(declare-fun call!25284 () List!3817)

(assert (=> bm!25279 (= call!25284 call!25282)))

(declare-fun b!264359 () Bool)

(declare-fun res!128970 () Bool)

(assert (=> b!264359 (=> (not res!128970) (not e!171264))))

(assert (=> b!264359 (= res!128970 (containsKey!310 lt!133683 (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!264360 () Bool)

(assert (=> b!264360 (= e!171267 call!25283)))

(declare-fun b!264361 () Bool)

(assert (=> b!264361 (= e!171268 (insertStrictlySorted!180 (t!8885 (toList!1927 lt!132999)) (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))))

(declare-fun d!63877 () Bool)

(assert (=> d!63877 e!171264))

(declare-fun res!128969 () Bool)

(assert (=> d!63877 (=> (not res!128969) (not e!171264))))

(assert (=> d!63877 (= res!128969 (isStrictlySorted!372 lt!133683))))

(assert (=> d!63877 (= lt!133683 e!171265)))

(declare-fun c!45248 () Bool)

(assert (=> d!63877 (= c!45248 (and ((_ is Cons!3813) (toList!1927 lt!132999)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!132999))) (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63877 (isStrictlySorted!372 (toList!1927 lt!132999))))

(assert (=> d!63877 (= (insertStrictlySorted!180 (toList!1927 lt!132999) (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) lt!133683)))

(declare-fun b!264362 () Bool)

(assert (=> b!264362 (= c!45246 (and ((_ is Cons!3813) (toList!1927 lt!132999)) (bvsgt (_1!2471 (h!4479 (toList!1927 lt!132999))) (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))))))

(declare-fun e!171266 () List!3817)

(assert (=> b!264362 (= e!171266 e!171267)))

(declare-fun bm!25280 () Bool)

(assert (=> bm!25280 (= call!25282 ($colon$colon!107 e!171268 (ite c!45248 (h!4479 (toList!1927 lt!132999)) (tuple2!4921 (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))))))

(declare-fun c!45245 () Bool)

(assert (=> bm!25280 (= c!45245 c!45248)))

(declare-fun bm!25281 () Bool)

(assert (=> bm!25281 (= call!25283 call!25284)))

(declare-fun b!264363 () Bool)

(assert (=> b!264363 (= e!171266 call!25284)))

(declare-fun b!264364 () Bool)

(assert (=> b!264364 (= e!171265 e!171266)))

(assert (=> b!264364 (= c!45247 (and ((_ is Cons!3813) (toList!1927 lt!132999)) (= (_1!2471 (h!4479 (toList!1927 lt!132999))) (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!63877 c!45248) b!264355))

(assert (= (and d!63877 (not c!45248)) b!264364))

(assert (= (and b!264364 c!45247) b!264363))

(assert (= (and b!264364 (not c!45247)) b!264362))

(assert (= (and b!264362 c!45246) b!264360))

(assert (= (and b!264362 (not c!45246)) b!264356))

(assert (= (or b!264360 b!264356) bm!25281))

(assert (= (or b!264363 bm!25281) bm!25279))

(assert (= (or b!264355 bm!25279) bm!25280))

(assert (= (and bm!25280 c!45245) b!264361))

(assert (= (and bm!25280 (not c!45245)) b!264357))

(assert (= (and d!63877 res!128969) b!264359))

(assert (= (and b!264359 res!128970) b!264358))

(declare-fun m!280921 () Bool)

(assert (=> b!264361 m!280921))

(declare-fun m!280923 () Bool)

(assert (=> bm!25280 m!280923))

(declare-fun m!280925 () Bool)

(assert (=> b!264358 m!280925))

(declare-fun m!280927 () Bool)

(assert (=> b!264359 m!280927))

(declare-fun m!280929 () Bool)

(assert (=> d!63877 m!280929))

(declare-fun m!280931 () Bool)

(assert (=> d!63877 m!280931))

(assert (=> d!63061 d!63877))

(assert (=> b!263258 d!63691))

(declare-fun b!264365 () Bool)

(declare-fun e!171271 () SeekEntryResult!1193)

(assert (=> b!264365 (= e!171271 (Intermediate!1193 true (toIndex!0 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (mask!11207 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!264366 () Bool)

(declare-fun e!171270 () SeekEntryResult!1193)

(assert (=> b!264366 (= e!171270 (Intermediate!1193 false (toIndex!0 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (mask!11207 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!264367 () Bool)

(assert (=> b!264367 (= e!171270 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (mask!11207 thiss!1504)) #b00000000000000000000000000000000 (mask!11207 thiss!1504)) (select (arr!5992 lt!132768) #b00000000000000000000000000000000) lt!132768 (mask!11207 thiss!1504)))))

(declare-fun b!264368 () Bool)

(declare-fun lt!133685 () SeekEntryResult!1193)

(assert (=> b!264368 (and (bvsge (index!6944 lt!133685) #b00000000000000000000000000000000) (bvslt (index!6944 lt!133685) (size!6344 lt!132768)))))

(declare-fun e!171272 () Bool)

(assert (=> b!264368 (= e!171272 (= (select (arr!5992 lt!132768) (index!6944 lt!133685)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!63879 () Bool)

(declare-fun e!171269 () Bool)

(assert (=> d!63879 e!171269))

(declare-fun c!45249 () Bool)

(assert (=> d!63879 (= c!45249 (and ((_ is Intermediate!1193) lt!133685) (undefined!2005 lt!133685)))))

(assert (=> d!63879 (= lt!133685 e!171271)))

(declare-fun c!45250 () Bool)

(assert (=> d!63879 (= c!45250 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!133684 () (_ BitVec 64))

(assert (=> d!63879 (= lt!133684 (select (arr!5992 lt!132768) (toIndex!0 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (mask!11207 thiss!1504))))))

(assert (=> d!63879 (validMask!0 (mask!11207 thiss!1504))))

(assert (=> d!63879 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (mask!11207 thiss!1504)) (select (arr!5992 lt!132768) #b00000000000000000000000000000000) lt!132768 (mask!11207 thiss!1504)) lt!133685)))

(declare-fun b!264369 () Bool)

(declare-fun e!171273 () Bool)

(assert (=> b!264369 (= e!171269 e!171273)))

(declare-fun res!128973 () Bool)

(assert (=> b!264369 (= res!128973 (and ((_ is Intermediate!1193) lt!133685) (not (undefined!2005 lt!133685)) (bvslt (x!25234 lt!133685) #b01111111111111111111111111111110) (bvsge (x!25234 lt!133685) #b00000000000000000000000000000000) (bvsge (x!25234 lt!133685) #b00000000000000000000000000000000)))))

(assert (=> b!264369 (=> (not res!128973) (not e!171273))))

(declare-fun b!264370 () Bool)

(assert (=> b!264370 (and (bvsge (index!6944 lt!133685) #b00000000000000000000000000000000) (bvslt (index!6944 lt!133685) (size!6344 lt!132768)))))

(declare-fun res!128971 () Bool)

(assert (=> b!264370 (= res!128971 (= (select (arr!5992 lt!132768) (index!6944 lt!133685)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264370 (=> res!128971 e!171272)))

(declare-fun b!264371 () Bool)

(assert (=> b!264371 (and (bvsge (index!6944 lt!133685) #b00000000000000000000000000000000) (bvslt (index!6944 lt!133685) (size!6344 lt!132768)))))

(declare-fun res!128972 () Bool)

(assert (=> b!264371 (= res!128972 (= (select (arr!5992 lt!132768) (index!6944 lt!133685)) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(assert (=> b!264371 (=> res!128972 e!171272)))

(assert (=> b!264371 (= e!171273 e!171272)))

(declare-fun b!264372 () Bool)

(assert (=> b!264372 (= e!171271 e!171270)))

(declare-fun c!45251 () Bool)

(assert (=> b!264372 (= c!45251 (or (= lt!133684 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)) (= (bvadd lt!133684 lt!133684) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264373 () Bool)

(assert (=> b!264373 (= e!171269 (bvsge (x!25234 lt!133685) #b01111111111111111111111111111110))))

(assert (= (and d!63879 c!45250) b!264365))

(assert (= (and d!63879 (not c!45250)) b!264372))

(assert (= (and b!264372 c!45251) b!264366))

(assert (= (and b!264372 (not c!45251)) b!264367))

(assert (= (and d!63879 c!45249) b!264373))

(assert (= (and d!63879 (not c!45249)) b!264369))

(assert (= (and b!264369 res!128973) b!264371))

(assert (= (and b!264371 (not res!128972)) b!264370))

(assert (= (and b!264370 (not res!128971)) b!264368))

(assert (=> b!264367 m!279313))

(declare-fun m!280933 () Bool)

(assert (=> b!264367 m!280933))

(assert (=> b!264367 m!280933))

(assert (=> b!264367 m!278587))

(declare-fun m!280935 () Bool)

(assert (=> b!264367 m!280935))

(declare-fun m!280937 () Bool)

(assert (=> b!264368 m!280937))

(assert (=> b!264370 m!280937))

(assert (=> d!63879 m!279313))

(declare-fun m!280939 () Bool)

(assert (=> d!63879 m!280939))

(assert (=> d!63879 m!278579))

(assert (=> b!264371 m!280937))

(assert (=> d!63157 d!63879))

(declare-fun d!63881 () Bool)

(declare-fun lt!133687 () (_ BitVec 32))

(declare-fun lt!133686 () (_ BitVec 32))

(assert (=> d!63881 (= lt!133687 (bvmul (bvxor lt!133686 (bvlshr lt!133686 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!63881 (= lt!133686 ((_ extract 31 0) (bvand (bvxor (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (bvlshr (select (arr!5992 lt!132768) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!63881 (and (bvsge (mask!11207 thiss!1504) #b00000000000000000000000000000000) (let ((res!128615 (let ((h!4485 ((_ extract 31 0) (bvand (bvxor (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (bvlshr (select (arr!5992 lt!132768) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!25262 (bvmul (bvxor h!4485 (bvlshr h!4485 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!25262 (bvlshr x!25262 #b00000000000000000000000000001101)) (mask!11207 thiss!1504)))))) (and (bvslt res!128615 (bvadd (mask!11207 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!128615 #b00000000000000000000000000000000))))))

(assert (=> d!63881 (= (toIndex!0 (select (arr!5992 lt!132768) #b00000000000000000000000000000000) (mask!11207 thiss!1504)) (bvand (bvxor lt!133687 (bvlshr lt!133687 #b00000000000000000000000000001101)) (mask!11207 thiss!1504)))))

(assert (=> d!63157 d!63881))

(assert (=> d!63157 d!63015))

(assert (=> d!63041 d!63237))

(declare-fun d!63883 () Bool)

(assert (=> d!63883 (isDefined!260 (getValueByKey!318 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) lt!132992))))

(declare-fun lt!133688 () Unit!8136)

(assert (=> d!63883 (= lt!133688 (choose!1300 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) lt!132992))))

(declare-fun e!171274 () Bool)

(assert (=> d!63883 e!171274))

(declare-fun res!128974 () Bool)

(assert (=> d!63883 (=> (not res!128974) (not e!171274))))

(assert (=> d!63883 (= res!128974 (isStrictlySorted!372 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63883 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) lt!132992) lt!133688)))

(declare-fun b!264374 () Bool)

(assert (=> b!264374 (= e!171274 (containsKey!310 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) lt!132992))))

(assert (= (and d!63883 res!128974) b!264374))

(assert (=> d!63883 m!279029))

(assert (=> d!63883 m!279029))

(assert (=> d!63883 m!279031))

(declare-fun m!280941 () Bool)

(assert (=> d!63883 m!280941))

(declare-fun m!280943 () Bool)

(assert (=> d!63883 m!280943))

(assert (=> b!264374 m!279025))

(assert (=> b!263228 d!63883))

(assert (=> b!263228 d!63413))

(assert (=> b!263228 d!63415))

(declare-fun b!264376 () Bool)

(declare-fun e!171275 () Option!324)

(declare-fun e!171276 () Option!324)

(assert (=> b!264376 (= e!171275 e!171276)))

(declare-fun c!45253 () Bool)

(assert (=> b!264376 (= c!45253 (and ((_ is Cons!3813) (toList!1927 lt!133154)) (not (= (_1!2471 (h!4479 (toList!1927 lt!133154))) (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))))))

(declare-fun b!264378 () Bool)

(assert (=> b!264378 (= e!171276 None!322)))

(declare-fun d!63885 () Bool)

(declare-fun c!45252 () Bool)

(assert (=> d!63885 (= c!45252 (and ((_ is Cons!3813) (toList!1927 lt!133154)) (= (_1!2471 (h!4479 (toList!1927 lt!133154))) (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63885 (= (getValueByKey!318 (toList!1927 lt!133154) (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) e!171275)))

(declare-fun b!264375 () Bool)

(assert (=> b!264375 (= e!171275 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!133154)))))))

(declare-fun b!264377 () Bool)

(assert (=> b!264377 (= e!171276 (getValueByKey!318 (t!8885 (toList!1927 lt!133154)) (_1!2471 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))))

(assert (= (and d!63885 c!45252) b!264375))

(assert (= (and d!63885 (not c!45252)) b!264376))

(assert (= (and b!264376 c!45253) b!264377))

(assert (= (and b!264376 (not c!45253)) b!264378))

(declare-fun m!280945 () Bool)

(assert (=> b!264377 m!280945))

(assert (=> b!263223 d!63885))

(declare-fun d!63887 () Bool)

(declare-fun lt!133689 () Bool)

(assert (=> d!63887 (= lt!133689 (select (content!176 (toList!1927 lt!133194)) (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))))))

(declare-fun e!171278 () Bool)

(assert (=> d!63887 (= lt!133689 e!171278)))

(declare-fun res!128976 () Bool)

(assert (=> d!63887 (=> (not res!128976) (not e!171278))))

(assert (=> d!63887 (= res!128976 ((_ is Cons!3813) (toList!1927 lt!133194)))))

(assert (=> d!63887 (= (contains!1893 (toList!1927 lt!133194) (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))) lt!133689)))

(declare-fun b!264379 () Bool)

(declare-fun e!171277 () Bool)

(assert (=> b!264379 (= e!171278 e!171277)))

(declare-fun res!128975 () Bool)

(assert (=> b!264379 (=> res!128975 e!171277)))

(assert (=> b!264379 (= res!128975 (= (h!4479 (toList!1927 lt!133194)) (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))))))

(declare-fun b!264380 () Bool)

(assert (=> b!264380 (= e!171277 (contains!1893 (t!8885 (toList!1927 lt!133194)) (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))))))

(assert (= (and d!63887 res!128976) b!264379))

(assert (= (and b!264379 (not res!128975)) b!264380))

(declare-fun m!280947 () Bool)

(assert (=> d!63887 m!280947))

(declare-fun m!280949 () Bool)

(assert (=> d!63887 m!280949))

(declare-fun m!280951 () Bool)

(assert (=> b!264380 m!280951))

(assert (=> b!263270 d!63887))

(declare-fun d!63889 () Bool)

(declare-fun res!128977 () Bool)

(declare-fun e!171279 () Bool)

(assert (=> d!63889 (=> res!128977 e!171279)))

(assert (=> d!63889 (= res!128977 (and ((_ is Cons!3813) (toList!1927 lt!133021)) (= (_1!2471 (h!4479 (toList!1927 lt!133021))) (_1!2471 lt!132765))))))

(assert (=> d!63889 (= (containsKey!310 (toList!1927 lt!133021) (_1!2471 lt!132765)) e!171279)))

(declare-fun b!264381 () Bool)

(declare-fun e!171280 () Bool)

(assert (=> b!264381 (= e!171279 e!171280)))

(declare-fun res!128978 () Bool)

(assert (=> b!264381 (=> (not res!128978) (not e!171280))))

(assert (=> b!264381 (= res!128978 (and (or (not ((_ is Cons!3813) (toList!1927 lt!133021))) (bvsle (_1!2471 (h!4479 (toList!1927 lt!133021))) (_1!2471 lt!132765))) ((_ is Cons!3813) (toList!1927 lt!133021)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!133021))) (_1!2471 lt!132765))))))

(declare-fun b!264382 () Bool)

(assert (=> b!264382 (= e!171280 (containsKey!310 (t!8885 (toList!1927 lt!133021)) (_1!2471 lt!132765)))))

(assert (= (and d!63889 (not res!128977)) b!264381))

(assert (= (and b!264381 res!128978) b!264382))

(declare-fun m!280953 () Bool)

(assert (=> b!264382 m!280953))

(assert (=> d!63201 d!63889))

(assert (=> b!263522 d!63763))

(assert (=> b!263522 d!63765))

(declare-fun d!63891 () Bool)

(declare-fun e!171281 () Bool)

(assert (=> d!63891 e!171281))

(declare-fun res!128979 () Bool)

(assert (=> d!63891 (=> res!128979 e!171281)))

(declare-fun lt!133693 () Bool)

(assert (=> d!63891 (= res!128979 (not lt!133693))))

(declare-fun lt!133691 () Bool)

(assert (=> d!63891 (= lt!133693 lt!133691)))

(declare-fun lt!133690 () Unit!8136)

(declare-fun e!171282 () Unit!8136)

(assert (=> d!63891 (= lt!133690 e!171282)))

(declare-fun c!45254 () Bool)

(assert (=> d!63891 (= c!45254 lt!133691)))

(assert (=> d!63891 (= lt!133691 (containsKey!310 (toList!1927 lt!133245) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63891 (= (contains!1889 lt!133245 #b0000000000000000000000000000000000000000000000000000000000000000) lt!133693)))

(declare-fun b!264383 () Bool)

(declare-fun lt!133692 () Unit!8136)

(assert (=> b!264383 (= e!171282 lt!133692)))

(assert (=> b!264383 (= lt!133692 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133245) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264383 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133245) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264384 () Bool)

(declare-fun Unit!8204 () Unit!8136)

(assert (=> b!264384 (= e!171282 Unit!8204)))

(declare-fun b!264385 () Bool)

(assert (=> b!264385 (= e!171281 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133245) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63891 c!45254) b!264383))

(assert (= (and d!63891 (not c!45254)) b!264384))

(assert (= (and d!63891 (not res!128979)) b!264385))

(declare-fun m!280955 () Bool)

(assert (=> d!63891 m!280955))

(declare-fun m!280957 () Bool)

(assert (=> b!264383 m!280957))

(assert (=> b!264383 m!280713))

(assert (=> b!264383 m!280713))

(declare-fun m!280959 () Bool)

(assert (=> b!264383 m!280959))

(assert (=> b!264385 m!280713))

(assert (=> b!264385 m!280713))

(assert (=> b!264385 m!280959))

(assert (=> bm!25188 d!63891))

(assert (=> d!63193 d!62979))

(declare-fun b!264387 () Bool)

(declare-fun e!171283 () Option!324)

(declare-fun e!171284 () Option!324)

(assert (=> b!264387 (= e!171283 e!171284)))

(declare-fun c!45256 () Bool)

(assert (=> b!264387 (= c!45256 (and ((_ is Cons!3813) (toList!1927 lt!133093)) (not (= (_1!2471 (h!4479 (toList!1927 lt!133093))) (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))))

(declare-fun b!264389 () Bool)

(assert (=> b!264389 (= e!171284 None!322)))

(declare-fun c!45255 () Bool)

(declare-fun d!63893 () Bool)

(assert (=> d!63893 (= c!45255 (and ((_ is Cons!3813) (toList!1927 lt!133093)) (= (_1!2471 (h!4479 (toList!1927 lt!133093))) (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (=> d!63893 (= (getValueByKey!318 (toList!1927 lt!133093) (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) e!171283)))

(declare-fun b!264386 () Bool)

(assert (=> b!264386 (= e!171283 (Some!323 (_2!2471 (h!4479 (toList!1927 lt!133093)))))))

(declare-fun b!264388 () Bool)

(assert (=> b!264388 (= e!171284 (getValueByKey!318 (t!8885 (toList!1927 lt!133093)) (_1!2471 (ite (or c!44831 c!44828) (tuple2!4921 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4921 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63893 c!45255) b!264386))

(assert (= (and d!63893 (not c!45255)) b!264387))

(assert (= (and b!264387 c!45256) b!264388))

(assert (= (and b!264387 (not c!45256)) b!264389))

(declare-fun m!280961 () Bool)

(assert (=> b!264388 m!280961))

(assert (=> b!263120 d!63893))

(declare-fun d!63895 () Bool)

(assert (=> d!63895 (= (get!3088 (getValueByKey!318 (toList!1927 (+!713 lt!132979 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))) lt!132969)) (v!5502 (getValueByKey!318 (toList!1927 (+!713 lt!132979 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))) lt!132969)))))

(assert (=> d!63109 d!63895))

(declare-fun b!264391 () Bool)

(declare-fun e!171285 () Option!324)

(declare-fun e!171286 () Option!324)

(assert (=> b!264391 (= e!171285 e!171286)))

(declare-fun c!45258 () Bool)

(assert (=> b!264391 (= c!45258 (and ((_ is Cons!3813) (toList!1927 (+!713 lt!132979 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))))) (not (= (_1!2471 (h!4479 (toList!1927 (+!713 lt!132979 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))))) lt!132969))))))

(declare-fun b!264393 () Bool)

(assert (=> b!264393 (= e!171286 None!322)))

(declare-fun c!45257 () Bool)

(declare-fun d!63897 () Bool)

(assert (=> d!63897 (= c!45257 (and ((_ is Cons!3813) (toList!1927 (+!713 lt!132979 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))))) (= (_1!2471 (h!4479 (toList!1927 (+!713 lt!132979 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))))) lt!132969)))))

(assert (=> d!63897 (= (getValueByKey!318 (toList!1927 (+!713 lt!132979 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504)))) lt!132969) e!171285)))

(declare-fun b!264390 () Bool)

(assert (=> b!264390 (= e!171285 (Some!323 (_2!2471 (h!4479 (toList!1927 (+!713 lt!132979 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))))))))))

(declare-fun b!264392 () Bool)

(assert (=> b!264392 (= e!171286 (getValueByKey!318 (t!8885 (toList!1927 (+!713 lt!132979 (tuple2!4921 lt!132985 (minValue!4683 thiss!1504))))) lt!132969))))

(assert (= (and d!63897 c!45257) b!264390))

(assert (= (and d!63897 (not c!45257)) b!264391))

(assert (= (and b!264391 c!45258) b!264392))

(assert (= (and b!264391 (not c!45258)) b!264393))

(declare-fun m!280963 () Bool)

(assert (=> b!264392 m!280963))

(assert (=> d!63109 d!63897))

(assert (=> b!263175 d!63327))

(assert (=> b!263170 d!63859))

(assert (=> b!263276 d!63435))

(assert (=> b!263469 d!63151))

(declare-fun d!63899 () Bool)

(declare-fun res!128980 () Bool)

(declare-fun e!171287 () Bool)

(assert (=> d!63899 (=> res!128980 e!171287)))

(assert (=> d!63899 (= res!128980 (and ((_ is Cons!3813) (t!8885 (toList!1927 lt!132775))) (= (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132775)))) key!932)))))

(assert (=> d!63899 (= (containsKey!310 (t!8885 (toList!1927 lt!132775)) key!932) e!171287)))

(declare-fun b!264394 () Bool)

(declare-fun e!171288 () Bool)

(assert (=> b!264394 (= e!171287 e!171288)))

(declare-fun res!128981 () Bool)

(assert (=> b!264394 (=> (not res!128981) (not e!171288))))

(assert (=> b!264394 (= res!128981 (and (or (not ((_ is Cons!3813) (t!8885 (toList!1927 lt!132775)))) (bvsle (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132775)))) key!932)) ((_ is Cons!3813) (t!8885 (toList!1927 lt!132775))) (bvslt (_1!2471 (h!4479 (t!8885 (toList!1927 lt!132775)))) key!932)))))

(declare-fun b!264395 () Bool)

(assert (=> b!264395 (= e!171288 (containsKey!310 (t!8885 (t!8885 (toList!1927 lt!132775))) key!932))))

(assert (= (and d!63899 (not res!128980)) b!264394))

(assert (= (and b!264394 res!128981) b!264395))

(declare-fun m!280965 () Bool)

(assert (=> b!264395 m!280965))

(assert (=> b!263349 d!63899))

(declare-fun d!63901 () Bool)

(declare-fun res!128982 () Bool)

(declare-fun e!171289 () Bool)

(assert (=> d!63901 (=> res!128982 e!171289)))

(assert (=> d!63901 (= res!128982 (and ((_ is Cons!3813) (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))) (= (_1!2471 (h!4479 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))) lt!132992)))))

(assert (=> d!63901 (= (containsKey!310 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))) lt!132992) e!171289)))

(declare-fun b!264396 () Bool)

(declare-fun e!171290 () Bool)

(assert (=> b!264396 (= e!171289 e!171290)))

(declare-fun res!128983 () Bool)

(assert (=> b!264396 (=> (not res!128983) (not e!171290))))

(assert (=> b!264396 (= res!128983 (and (or (not ((_ is Cons!3813) (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))) (bvsle (_1!2471 (h!4479 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))) lt!132992)) ((_ is Cons!3813) (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))) (bvslt (_1!2471 (h!4479 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504)))))) lt!132992)))))

(declare-fun b!264397 () Bool)

(assert (=> b!264397 (= e!171290 (containsKey!310 (t!8885 (toList!1927 (+!713 lt!132999 (tuple2!4921 lt!132996 (zeroValue!4683 thiss!1504))))) lt!132992))))

(assert (= (and d!63901 (not res!128982)) b!264396))

(assert (= (and b!264396 res!128983) b!264397))

(declare-fun m!280967 () Bool)

(assert (=> b!264397 m!280967))

(assert (=> d!63073 d!63901))

(declare-fun d!63903 () Bool)

(declare-fun e!171291 () Bool)

(assert (=> d!63903 e!171291))

(declare-fun res!128984 () Bool)

(assert (=> d!63903 (=> res!128984 e!171291)))

(declare-fun lt!133697 () Bool)

(assert (=> d!63903 (= res!128984 (not lt!133697))))

(declare-fun lt!133695 () Bool)

(assert (=> d!63903 (= lt!133697 lt!133695)))

(declare-fun lt!133694 () Unit!8136)

(declare-fun e!171292 () Unit!8136)

(assert (=> d!63903 (= lt!133694 e!171292)))

(declare-fun c!45259 () Bool)

(assert (=> d!63903 (= c!45259 lt!133695)))

(assert (=> d!63903 (= lt!133695 (containsKey!310 (toList!1927 lt!133194) (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))))))

(assert (=> d!63903 (= (contains!1889 lt!133194 (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))) lt!133697)))

(declare-fun b!264398 () Bool)

(declare-fun lt!133696 () Unit!8136)

(assert (=> b!264398 (= e!171292 lt!133696)))

(assert (=> b!264398 (= lt!133696 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133194) (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))))))

(assert (=> b!264398 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133194) (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))))))

(declare-fun b!264399 () Bool)

(declare-fun Unit!8205 () Unit!8136)

(assert (=> b!264399 (= e!171292 Unit!8205)))

(declare-fun b!264400 () Bool)

(assert (=> b!264400 (= e!171291 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133194) (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63903 c!45259) b!264398))

(assert (= (and d!63903 (not c!45259)) b!264399))

(assert (= (and d!63903 (not res!128984)) b!264400))

(declare-fun m!280969 () Bool)

(assert (=> d!63903 m!280969))

(declare-fun m!280971 () Bool)

(assert (=> b!264398 m!280971))

(assert (=> b!264398 m!279073))

(assert (=> b!264398 m!279073))

(declare-fun m!280973 () Bool)

(assert (=> b!264398 m!280973))

(assert (=> b!264400 m!279073))

(assert (=> b!264400 m!279073))

(assert (=> b!264400 m!280973))

(assert (=> d!63079 d!63903))

(declare-fun b!264402 () Bool)

(declare-fun e!171293 () Option!324)

(declare-fun e!171294 () Option!324)

(assert (=> b!264402 (= e!171293 e!171294)))

(declare-fun c!45261 () Bool)

(assert (=> b!264402 (= c!45261 (and ((_ is Cons!3813) lt!133193) (not (= (_1!2471 (h!4479 lt!133193)) (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))))))))

(declare-fun b!264404 () Bool)

(assert (=> b!264404 (= e!171294 None!322)))

(declare-fun d!63905 () Bool)

(declare-fun c!45260 () Bool)

(assert (=> d!63905 (= c!45260 (and ((_ is Cons!3813) lt!133193) (= (_1!2471 (h!4479 lt!133193)) (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))))))))

(assert (=> d!63905 (= (getValueByKey!318 lt!133193 (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))) e!171293)))

(declare-fun b!264401 () Bool)

(assert (=> b!264401 (= e!171293 (Some!323 (_2!2471 (h!4479 lt!133193))))))

(declare-fun b!264403 () Bool)

(assert (=> b!264403 (= e!171294 (getValueByKey!318 (t!8885 lt!133193) (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63905 c!45260) b!264401))

(assert (= (and d!63905 (not c!45260)) b!264402))

(assert (= (and b!264402 c!45261) b!264403))

(assert (= (and b!264402 (not c!45261)) b!264404))

(declare-fun m!280975 () Bool)

(assert (=> b!264403 m!280975))

(assert (=> d!63079 d!63905))

(declare-fun d!63907 () Bool)

(assert (=> d!63907 (= (getValueByKey!318 lt!133193 (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))) (Some!323 (_2!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133698 () Unit!8136)

(assert (=> d!63907 (= lt!133698 (choose!1303 lt!133193 (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))))))

(declare-fun e!171295 () Bool)

(assert (=> d!63907 e!171295))

(declare-fun res!128985 () Bool)

(assert (=> d!63907 (=> (not res!128985) (not e!171295))))

(assert (=> d!63907 (= res!128985 (isStrictlySorted!372 lt!133193))))

(assert (=> d!63907 (= (lemmaContainsTupThenGetReturnValue!177 lt!133193 (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))) lt!133698)))

(declare-fun b!264405 () Bool)

(declare-fun res!128986 () Bool)

(assert (=> b!264405 (=> (not res!128986) (not e!171295))))

(assert (=> b!264405 (= res!128986 (containsKey!310 lt!133193 (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))))))

(declare-fun b!264406 () Bool)

(assert (=> b!264406 (= e!171295 (contains!1893 lt!133193 (tuple2!4921 (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63907 res!128985) b!264405))

(assert (= (and b!264405 res!128986) b!264406))

(assert (=> d!63907 m!279067))

(declare-fun m!280977 () Bool)

(assert (=> d!63907 m!280977))

(declare-fun m!280979 () Bool)

(assert (=> d!63907 m!280979))

(declare-fun m!280981 () Bool)

(assert (=> b!264405 m!280981))

(declare-fun m!280983 () Bool)

(assert (=> b!264406 m!280983))

(assert (=> d!63079 d!63907))

(declare-fun b!264407 () Bool)

(declare-fun e!171297 () List!3817)

(declare-fun call!25285 () List!3817)

(assert (=> b!264407 (= e!171297 call!25285)))

(declare-fun b!264408 () Bool)

(declare-fun e!171299 () List!3817)

(declare-fun call!25286 () List!3817)

(assert (=> b!264408 (= e!171299 call!25286)))

(declare-fun c!45263 () Bool)

(declare-fun c!45264 () Bool)

(declare-fun b!264409 () Bool)

(declare-fun e!171300 () List!3817)

(assert (=> b!264409 (= e!171300 (ite c!45264 (t!8885 (toList!1927 lt!133001)) (ite c!45263 (Cons!3813 (h!4479 (toList!1927 lt!133001)) (t!8885 (toList!1927 lt!133001))) Nil!3814)))))

(declare-fun e!171296 () Bool)

(declare-fun b!264410 () Bool)

(declare-fun lt!133699 () List!3817)

(assert (=> b!264410 (= e!171296 (contains!1893 lt!133699 (tuple2!4921 (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))))))))

(declare-fun bm!25282 () Bool)

(declare-fun call!25287 () List!3817)

(assert (=> bm!25282 (= call!25287 call!25285)))

(declare-fun b!264411 () Bool)

(declare-fun res!128988 () Bool)

(assert (=> b!264411 (=> (not res!128988) (not e!171296))))

(assert (=> b!264411 (= res!128988 (containsKey!310 lt!133699 (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))))))

(declare-fun b!264412 () Bool)

(assert (=> b!264412 (= e!171299 call!25286)))

(declare-fun b!264413 () Bool)

(assert (=> b!264413 (= e!171300 (insertStrictlySorted!180 (t!8885 (toList!1927 lt!133001)) (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))))))

(declare-fun d!63909 () Bool)

(assert (=> d!63909 e!171296))

(declare-fun res!128987 () Bool)

(assert (=> d!63909 (=> (not res!128987) (not e!171296))))

(assert (=> d!63909 (= res!128987 (isStrictlySorted!372 lt!133699))))

(assert (=> d!63909 (= lt!133699 e!171297)))

(declare-fun c!45265 () Bool)

(assert (=> d!63909 (= c!45265 (and ((_ is Cons!3813) (toList!1927 lt!133001)) (bvslt (_1!2471 (h!4479 (toList!1927 lt!133001))) (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))))))))

(assert (=> d!63909 (isStrictlySorted!372 (toList!1927 lt!133001))))

(assert (=> d!63909 (= (insertStrictlySorted!180 (toList!1927 lt!133001) (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))) lt!133699)))

(declare-fun b!264414 () Bool)

(assert (=> b!264414 (= c!45263 (and ((_ is Cons!3813) (toList!1927 lt!133001)) (bvsgt (_1!2471 (h!4479 (toList!1927 lt!133001))) (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))))))))

(declare-fun e!171298 () List!3817)

(assert (=> b!264414 (= e!171298 e!171299)))

(declare-fun bm!25283 () Bool)

(assert (=> bm!25283 (= call!25285 ($colon$colon!107 e!171300 (ite c!45265 (h!4479 (toList!1927 lt!133001)) (tuple2!4921 (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))) (_2!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504)))))))))

(declare-fun c!45262 () Bool)

(assert (=> bm!25283 (= c!45262 c!45265)))

(declare-fun bm!25284 () Bool)

(assert (=> bm!25284 (= call!25286 call!25287)))

(declare-fun b!264415 () Bool)

(assert (=> b!264415 (= e!171298 call!25287)))

(declare-fun b!264416 () Bool)

(assert (=> b!264416 (= e!171297 e!171298)))

(assert (=> b!264416 (= c!45264 (and ((_ is Cons!3813) (toList!1927 lt!133001)) (= (_1!2471 (h!4479 (toList!1927 lt!133001))) (_1!2471 (tuple2!4921 lt!133007 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63909 c!45265) b!264407))

(assert (= (and d!63909 (not c!45265)) b!264416))

(assert (= (and b!264416 c!45264) b!264415))

(assert (= (and b!264416 (not c!45264)) b!264414))

(assert (= (and b!264414 c!45263) b!264412))

(assert (= (and b!264414 (not c!45263)) b!264408))

(assert (= (or b!264412 b!264408) bm!25284))

(assert (= (or b!264415 bm!25284) bm!25282))

(assert (= (or b!264407 bm!25282) bm!25283))

(assert (= (and bm!25283 c!45262) b!264413))

(assert (= (and bm!25283 (not c!45262)) b!264409))

(assert (= (and d!63909 res!128987) b!264411))

(assert (= (and b!264411 res!128988) b!264410))

(declare-fun m!280985 () Bool)

(assert (=> b!264413 m!280985))

(declare-fun m!280987 () Bool)

(assert (=> bm!25283 m!280987))

(declare-fun m!280989 () Bool)

(assert (=> b!264410 m!280989))

(declare-fun m!280991 () Bool)

(assert (=> b!264411 m!280991))

(declare-fun m!280993 () Bool)

(assert (=> d!63909 m!280993))

(declare-fun m!280995 () Bool)

(assert (=> d!63909 m!280995))

(assert (=> d!63079 d!63909))

(declare-fun d!63911 () Bool)

(declare-fun e!171301 () Bool)

(assert (=> d!63911 e!171301))

(declare-fun res!128989 () Bool)

(assert (=> d!63911 (=> res!128989 e!171301)))

(declare-fun lt!133703 () Bool)

(assert (=> d!63911 (= res!128989 (not lt!133703))))

(declare-fun lt!133701 () Bool)

(assert (=> d!63911 (= lt!133703 lt!133701)))

(declare-fun lt!133700 () Unit!8136)

(declare-fun e!171302 () Unit!8136)

(assert (=> d!63911 (= lt!133700 e!171302)))

(declare-fun c!45266 () Bool)

(assert (=> d!63911 (= c!45266 lt!133701)))

(assert (=> d!63911 (= lt!133701 (containsKey!310 (toList!1927 lt!133188) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(assert (=> d!63911 (= (contains!1889 lt!133188 (select (arr!5992 lt!132768) #b00000000000000000000000000000000)) lt!133703)))

(declare-fun b!264417 () Bool)

(declare-fun lt!133702 () Unit!8136)

(assert (=> b!264417 (= e!171302 lt!133702)))

(assert (=> b!264417 (= lt!133702 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1927 lt!133188) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(assert (=> b!264417 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133188) (select (arr!5992 lt!132768) #b00000000000000000000000000000000)))))

(declare-fun b!264418 () Bool)

(declare-fun Unit!8206 () Unit!8136)

(assert (=> b!264418 (= e!171302 Unit!8206)))

(declare-fun b!264419 () Bool)

(assert (=> b!264419 (= e!171301 (isDefined!260 (getValueByKey!318 (toList!1927 lt!133188) (select (arr!5992 lt!132768) #b00000000000000000000000000000000))))))

(assert (= (and d!63911 c!45266) b!264417))

(assert (= (and d!63911 (not c!45266)) b!264418))

(assert (= (and d!63911 (not res!128989)) b!264419))

(assert (=> d!63911 m!278587))

(declare-fun m!280997 () Bool)

(assert (=> d!63911 m!280997))

(assert (=> b!264417 m!278587))

(declare-fun m!280999 () Bool)

(assert (=> b!264417 m!280999))

(assert (=> b!264417 m!278587))

(assert (=> b!264417 m!279929))

(assert (=> b!264417 m!279929))

(declare-fun m!281001 () Bool)

(assert (=> b!264417 m!281001))

(assert (=> b!264419 m!278587))

(assert (=> b!264419 m!279929))

(assert (=> b!264419 m!279929))

(assert (=> b!264419 m!281001))

(assert (=> b!263257 d!63911))

(declare-fun d!63913 () Bool)

(assert (=> d!63913 (= (apply!262 lt!133117 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3088 (getValueByKey!318 (toList!1927 lt!133117) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9313 () Bool)

(assert (= bs!9313 d!63913))

(assert (=> bs!9313 m!280111))

(assert (=> bs!9313 m!280111))

(declare-fun m!281003 () Bool)

(assert (=> bs!9313 m!281003))

(assert (=> b!263128 d!63913))

(declare-fun b!264420 () Bool)

(declare-fun e!171304 () (_ BitVec 32))

(declare-fun call!25288 () (_ BitVec 32))

(assert (=> b!264420 (= e!171304 call!25288)))

(declare-fun bm!25285 () Bool)

(assert (=> bm!25285 (= call!25288 (arrayCountValidKeys!0 (_keys!7033 lt!132778) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6344 (_keys!7033 lt!132778))))))

(declare-fun b!264421 () Bool)

(declare-fun e!171303 () (_ BitVec 32))

(assert (=> b!264421 (= e!171303 e!171304)))

(declare-fun c!45268 () Bool)

(assert (=> b!264421 (= c!45268 (validKeyInArray!0 (select (arr!5992 (_keys!7033 lt!132778)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!264422 () Bool)

(assert (=> b!264422 (= e!171303 #b00000000000000000000000000000000)))

(declare-fun b!264423 () Bool)

(assert (=> b!264423 (= e!171304 (bvadd #b00000000000000000000000000000001 call!25288))))

(declare-fun d!63915 () Bool)

(declare-fun lt!133704 () (_ BitVec 32))

(assert (=> d!63915 (and (bvsge lt!133704 #b00000000000000000000000000000000) (bvsle lt!133704 (bvsub (size!6344 (_keys!7033 lt!132778)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!63915 (= lt!133704 e!171303)))

(declare-fun c!45267 () Bool)

(assert (=> d!63915 (= c!45267 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 lt!132778))))))

(assert (=> d!63915 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 lt!132778))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6344 (_keys!7033 lt!132778)) (size!6344 (_keys!7033 lt!132778))))))

(assert (=> d!63915 (= (arrayCountValidKeys!0 (_keys!7033 lt!132778) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6344 (_keys!7033 lt!132778))) lt!133704)))

(assert (= (and d!63915 c!45267) b!264422))

(assert (= (and d!63915 (not c!45267)) b!264421))

(assert (= (and b!264421 c!45268) b!264423))

(assert (= (and b!264421 (not c!45268)) b!264420))

(assert (= (or b!264423 b!264420) bm!25285))

(declare-fun m!281005 () Bool)

(assert (=> bm!25285 m!281005))

(assert (=> b!264421 m!279617))

(assert (=> b!264421 m!279617))

(assert (=> b!264421 m!279619))

(assert (=> bm!25199 d!63915))

(declare-fun b!264424 () Bool)

(declare-fun e!171306 () Bool)

(assert (=> b!264424 (= e!171306 tp_is_empty!6655)))

(declare-fun condMapEmpty!11358 () Bool)

(declare-fun mapDefault!11358 () ValueCell!2984)

(assert (=> mapNonEmpty!11357 (= condMapEmpty!11358 (= mapRest!11357 ((as const (Array (_ BitVec 32) ValueCell!2984)) mapDefault!11358)))))

(declare-fun e!171305 () Bool)

(declare-fun mapRes!11358 () Bool)

(assert (=> mapNonEmpty!11357 (= tp!23732 (and e!171305 mapRes!11358))))

(declare-fun b!264425 () Bool)

(assert (=> b!264425 (= e!171305 tp_is_empty!6655)))

(declare-fun mapNonEmpty!11358 () Bool)

(declare-fun tp!23733 () Bool)

(assert (=> mapNonEmpty!11358 (= mapRes!11358 (and tp!23733 e!171306))))

(declare-fun mapValue!11358 () ValueCell!2984)

(declare-fun mapKey!11358 () (_ BitVec 32))

(declare-fun mapRest!11358 () (Array (_ BitVec 32) ValueCell!2984))

(assert (=> mapNonEmpty!11358 (= mapRest!11357 (store mapRest!11358 mapKey!11358 mapValue!11358))))

(declare-fun mapIsEmpty!11358 () Bool)

(assert (=> mapIsEmpty!11358 mapRes!11358))

(assert (= (and mapNonEmpty!11357 condMapEmpty!11358) mapIsEmpty!11358))

(assert (= (and mapNonEmpty!11357 (not condMapEmpty!11358)) mapNonEmpty!11358))

(assert (= (and mapNonEmpty!11358 ((_ is ValueCellFull!2984) mapValue!11358)) b!264424))

(assert (= (and mapNonEmpty!11357 ((_ is ValueCellFull!2984) mapDefault!11358)) b!264425))

(declare-fun m!281007 () Bool)

(assert (=> mapNonEmpty!11358 m!281007))

(declare-fun b_lambda!8359 () Bool)

(assert (= b_lambda!8349 (or (and b!262722 b_free!6793) b_lambda!8359)))

(declare-fun b_lambda!8361 () Bool)

(assert (= b_lambda!8353 (or (and b!262722 b_free!6793) b_lambda!8361)))

(declare-fun b_lambda!8363 () Bool)

(assert (= b_lambda!8351 (or (and b!262722 b_free!6793) b_lambda!8363)))

(declare-fun b_lambda!8365 () Bool)

(assert (= b_lambda!8357 (or (and b!262722 b_free!6793) b_lambda!8365)))

(declare-fun b_lambda!8367 () Bool)

(assert (= b_lambda!8355 (or (and b!262722 b_free!6793) b_lambda!8367)))

(declare-fun b_lambda!8369 () Bool)

(assert (= b_lambda!8331 (or (and b!262722 b_free!6793 (= (defaultEntry!4842 thiss!1504) (defaultEntry!4842 lt!132778))) b_lambda!8369)))

(declare-fun b_lambda!8371 () Bool)

(assert (= b_lambda!8347 (or (and b!262722 b_free!6793) b_lambda!8371)))

(check-sat (not b!263647) (not d!63425) (not d!63255) (not d!63467) (not b!263891) (not b!263947) (not b!264084) (not b!264171) (not b!264208) (not b!263967) (not b!264308) (not b!264058) (not b!263830) (not d!63403) (not b!263963) (not bm!25257) (not b!263774) (not bm!25234) (not b!263944) (not b!264143) (not d!63629) (not b!263710) (not d!63663) (not b!264022) (not d!63609) (not d!63657) (not b!264079) (not b!263900) (not b!263751) (not b!264021) (not b!263638) (not b!264267) (not d!63489) (not b!264088) (not d!63799) (not b!264031) (not b!264127) (not d!63419) (not b!264106) (not d!63471) (not b!263572) (not b!263894) (not b!264353) (not bm!25255) (not b_lambda!8317) (not b!263844) (not d!63473) (not b!263873) (not b!264104) (not b!263931) (not b!264168) (not b!263658) (not b!263772) (not b!264254) (not b!264421) (not b!263733) (not d!63367) (not d!63469) (not b!263723) (not b!264213) (not d!63635) (not d!63445) (not b!263714) (not b!264417) (not b!264342) (not b!263876) (not b!263739) (not d!63291) (not b!263596) (not b_lambda!8319) (not b!264279) (not b!264133) (not b!264151) (not b!263829) (not b!264183) (not b!263861) (not b!263682) (not d!63753) (not d!63281) (not d!63685) (not b!263855) (not b!263800) (not d!63733) (not d!63265) (not b!264194) (not b!264214) (not b!264025) (not b!263994) (not b!263609) (not b!263764) (not b!263680) (not d!63599) (not b!263802) (not d!63621) (not d!63465) (not d!63627) (not b!263847) (not d!63875) (not b!263580) (not b!263607) (not b!263868) (not b!264303) (not d!63277) (not b!263880) (not d!63877) (not b_lambda!8359) (not b!264392) (not d!63747) b_and!13945 (not b!263602) (not d!63509) (not b!263583) (not b!263790) (not b!263832) (not b!264234) (not d!63497) (not bm!25266) (not d!63577) (not b!264051) (not d!63341) (not b!263746) (not b!264398) (not b!263795) (not b!264001) (not bm!25236) (not b_next!6793) (not d!63883) (not d!63673) (not b!264038) (not b!263926) (not b!264071) (not b!263736) (not d!63501) (not b!263948) (not d!63319) (not d!63597) (not d!63699) (not d!63361) (not d!63815) (not b!263720) (not b!264246) (not d!63365) (not d!63531) (not b!264250) (not b!263615) (not b!264377) (not b!263684) (not bm!25261) (not b!263660) (not d!63455) (not d!63579) (not d!63671) (not b!263634) (not b!264405) (not b!263676) (not b!263977) (not b!264260) (not b!263743) (not d!63437) (not d!63703) (not b!264186) (not b!263697) (not b!264217) (not b_lambda!8335) (not b!264179) (not b!264163) (not b!264345) (not b!264205) (not d!63447) (not b!264239) (not bm!25283) (not b!264048) (not b!264229) (not d!63363) (not d!63247) (not b!263694) (not bm!25280) (not d!63313) (not bm!25242) (not b!264036) (not b!264034) (not bm!25259) (not b!263796) (not b!264226) (not b!264285) (not b!263886) (not d!63903) (not d!63463) (not b!263577) (not b!263834) (not b!264098) (not d!63503) (not b!263828) (not b!264367) (not b!263724) (not b!264319) (not b!263937) (not b!264243) (not d!63879) (not b!264164) (not b!264321) (not d!63397) (not d!63821) (not d!63863) (not d!63387) (not d!63433) (not bm!25278) (not b!263823) (not b!264191) (not d!63911) (not d!63769) (not b!263573) (not bm!25274) (not b!264173) (not b!264305) (not b!263725) (not d!63507) (not bm!25237) (not b!263722) (not d!63623) (not d!63595) (not b!263885) (not d!63541) (not b!264280) (not b!264252) (not b!264050) (not b!263588) (not d!63781) (not b!264006) (not d!63803) (not b!264294) (not b!263950) (not b!263717) (not d!63607) (not b!263866) (not bm!25271) (not b!263627) (not b!263809) (not d!63687) (not d!63249) (not b!263747) (not d!63407) (not d!63807) (not d!63337) (not b!264329) (not b!263884) (not b!263604) (not b!264032) (not b!264358) (not b!264413) (not b!264359) (not d!63449) (not b!264119) (not d!63317) (not d!63795) (not b!264004) (not b!264041) (not d!63297) (not bm!25276) (not b!263982) (not d!63817) (not b!263702) (not d!63545) (not b_lambda!8341) (not b!263917) (not b!263673) (not b!263821) (not d!63725) (not b!264063) (not d!63355) (not b!264361) (not bm!25247) (not b!264020) (not b_lambda!8339) (not d!63513) (not d!63907) (not bm!25250) (not b!264271) (not b!263622) (not b!263775) (not d!63849) (not d!63553) (not b!263704) (not b!264400) (not b!264237) (not d!63543) (not b!263575) (not b!263645) (not b!263837) (not d!63267) (not b!263846) (not b!264176) (not b!263892) (not b!263990) (not b!263804) (not b!264166) (not b!263842) (not d!63767) (not b!263768) (not d!63913) (not b!263614) (not d!63399) (not b!264327) (not mapNonEmpty!11358) (not b_lambda!8345) (not b!263974) (not b!263882) (not b!263798) (not b!263570) (not b!263794) (not d!63421) (not b!264009) (not b!263939) (not b!263827) (not d!63511) (not d!63373) (not d!63453) (not b!264309) (not b!263666) (not d!63305) (not b!264170) (not b!264120) (not d!63633) (not b!264136) (not d!63861) (not d!63243) (not b!263898) (not b!263574) (not d!63691) (not d!63709) (not b!263874) (not d!63729) (not b!263631) (not b!264297) (not b!264313) (not b!264295) (not d!63479) (not d!63617) (not b!263896) (not b!264288) (not b!264348) (not b!264282) (not d!63705) (not b!263941) (not b!264269) (not d!63439) (not d!63735) (not b!263869) (not b!264081) (not b!264091) (not bm!25245) (not b!264112) (not b!263858) (not d!63525) (not b!263749) (not b!264383) (not b!264314) (not d!63613) (not bm!25273) (not b!264125) tp_is_empty!6655 (not d!63837) (not b!264023) (not b!264148) (not b!264406) (not b!264248) (not d!63715) (not b!264382) (not b!263955) (not b!263687) (not b!263778) (not d!63345) (not b!263761) (not d!63835) (not bm!25268) (not b!264146) (not b!264099) (not d!63779) (not b!263956) (not b!264155) (not d!63871) (not b!263814) (not b!263593) (not b!263953) (not b!264351) (not b!264068) (not d!63761) (not d!63283) (not b!264211) (not b!264395) (not b!264231) (not b!264311) (not b!263589) (not b!263924) (not b!263839) (not d!63537) (not b!264334) (not b!263701) (not b!263863) (not b!264065) (not d!63693) (not d!63833) (not bm!25224) (not b!264076) (not b_lambda!8361) (not bm!25243) (not b!264149) (not d!63423) (not d!63401) (not d!63285) (not b!264160) (not b!263696) (not d!63539) (not b!263946) (not b!263730) (not b!263652) (not b!264134) (not b!264056) (not b!263758) (not b!263741) (not b!264093) (not b!264012) (not d!63593) (not d!63451) (not b!263728) (not b!264002) (not b!264000) (not b!264291) (not d!63245) (not b!264096) (not b!263998) (not b!263905) (not b!263748) (not b!264326) (not b!263691) (not b!264336) (not b_lambda!8363) (not d!63681) (not b!263754) (not b!263835) (not d!63371) (not b!263793) (not b!264339) (not b!263831) (not b!264346) (not d!63417) (not b!263904) (not d!63841) (not b!264043) (not b!263657) (not b!264103) (not d!63369) (not b!263887) (not bm!25240) (not d!63743) (not b!264114) (not b!263840) (not bm!25248) (not b!264178) (not b!263581) (not b!263785) (not b!264255) (not b_lambda!8367) (not b!263594) (not bm!25264) (not bm!25272) (not b!264184) (not d!63257) (not b!264419) (not d!63851) (not b!264132) (not b!264045) (not b!264221) (not b!264411) (not d!63601) (not d!63667) (not b!264111) (not b!263578) (not b!263889) (not b!264218) (not d!63887) (not d!63481) (not b!264257) (not b!263818) (not d!63843) (not b!263740) (not d!63563) (not b!263812) (not bm!25231) (not b_lambda!8343) (not bm!25238) (not d!63653) (not d!63461) (not d!63359) (not d!63909) (not bm!25253) (not d!63491) (not d!63375) (not b!264027) (not d!63721) (not b_lambda!8371) (not b!263825) (not b!263731) (not b!264354) (not d!63669) (not d!63475) (not b!263820) (not b!264374) (not b!263653) (not b!263852) (not b!264316) (not b!264322) (not d!63459) (not b!263929) (not b!263670) (not d!63741) (not b!264161) (not d!63289) (not bm!25285) (not b!264403) (not d!63483) (not b!263849) (not d!63745) (not d!63351) (not d!63581) (not d!63551) (not b!264264) (not d!63853) (not b!263805) (not b!264215) (not b_lambda!8369) (not d!63639) (not b!264142) (not b!264388) (not d!63557) (not b_lambda!8365) (not d!63763) (not d!63349) (not d!63677) (not d!63661) (not d!63493) (not b!263601) (not d!63603) (not b_lambda!8337) (not d!63353) (not b!264201) (not b!264029) (not b!264224) (not b!264158) (not b!263610) (not d!63457) (not b_lambda!8333) (not d!63719) (not b!263807) (not b!264302) (not b!264144) (not b!264073) (not b!263960) (not b!263857) (not b!263586) (not d!63791) (not d!63347) (not b!263629) (not b!264153) (not b!264380) (not b!263735) (not b!264019) (not d!63659) (not b!263912) (not b!263781) (not d!63695) (not b!264064) (not b!263975) (not d!63559) (not b!263907) (not b!263816) (not b!264410) (not b!263984) (not b!264055) (not d!63845) (not d!63825) (not d!63773) (not b!264156) (not b!264090) (not b!264300) (not d!63727) (not b!263726) (not bm!25229) (not b!263689) (not b!263737) (not b!263625) (not b!264137) (not b!263815) (not b!264275) (not d!63413) (not d!63625) (not b!263961) (not b!264397) (not d!63411) (not b!263617) (not d!63251) (not b!264124) (not d!63261) (not bm!25227) (not d!63631) (not b!264210) (not bm!25270) (not d!63357) (not b!264140) (not d!63891) (not d!63549) (not b!264086) (not b!263860) (not b!264117) (not b!263650) (not d!63809) (not b!264385) (not b!263981))
(check-sat b_and!13945 (not b_next!6793))
