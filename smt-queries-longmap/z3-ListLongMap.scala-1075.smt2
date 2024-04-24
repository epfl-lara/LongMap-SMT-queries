; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22136 () Bool)

(assert start!22136)

(declare-fun b!230702 () Bool)

(declare-fun b_free!6199 () Bool)

(declare-fun b_next!6199 () Bool)

(assert (=> b!230702 (= b_free!6199 (not b_next!6199))))

(declare-fun tp!21738 () Bool)

(declare-fun b_and!13111 () Bool)

(assert (=> b!230702 (= tp!21738 b_and!13111)))

(declare-fun b!230687 () Bool)

(declare-fun e!149711 () Bool)

(declare-fun e!149719 () Bool)

(declare-fun mapRes!10261 () Bool)

(assert (=> b!230687 (= e!149711 (and e!149719 mapRes!10261))))

(declare-fun condMapEmpty!10261 () Bool)

(declare-datatypes ((V!7729 0))(
  ( (V!7730 (val!3075 Int)) )
))
(declare-datatypes ((ValueCell!2687 0))(
  ( (ValueCellFull!2687 (v!5096 V!7729)) (EmptyCell!2687) )
))
(declare-datatypes ((array!11363 0))(
  ( (array!11364 (arr!5401 (Array (_ BitVec 32) ValueCell!2687)) (size!5734 (_ BitVec 32))) )
))
(declare-datatypes ((array!11365 0))(
  ( (array!11366 (arr!5402 (Array (_ BitVec 32) (_ BitVec 64))) (size!5735 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3274 0))(
  ( (LongMapFixedSize!3275 (defaultEntry!4296 Int) (mask!10190 (_ BitVec 32)) (extraKeys!4033 (_ BitVec 32)) (zeroValue!4137 V!7729) (minValue!4137 V!7729) (_size!1686 (_ BitVec 32)) (_keys!6350 array!11365) (_values!4279 array!11363) (_vacant!1686 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3274)

(declare-fun mapDefault!10261 () ValueCell!2687)

(assert (=> b!230687 (= condMapEmpty!10261 (= (arr!5401 (_values!4279 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2687)) mapDefault!10261)))))

(declare-fun b!230688 () Bool)

(declare-fun e!149709 () Bool)

(declare-fun e!149720 () Bool)

(assert (=> b!230688 (= e!149709 e!149720)))

(declare-fun res!113441 () Bool)

(assert (=> b!230688 (=> (not res!113441) (not e!149720))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!230688 (= res!113441 (inRange!0 index!297 (mask!10190 thiss!1504)))))

(declare-datatypes ((Unit!7050 0))(
  ( (Unit!7051) )
))
(declare-fun lt!116167 () Unit!7050)

(declare-fun e!149716 () Unit!7050)

(assert (=> b!230688 (= lt!116167 e!149716)))

(declare-fun c!38304 () Bool)

(declare-datatypes ((tuple2!4462 0))(
  ( (tuple2!4463 (_1!2242 (_ BitVec 64)) (_2!2242 V!7729)) )
))
(declare-datatypes ((List!3375 0))(
  ( (Nil!3372) (Cons!3371 (h!4019 tuple2!4462) (t!8326 List!3375)) )
))
(declare-datatypes ((ListLongMap!3377 0))(
  ( (ListLongMap!3378 (toList!1704 List!3375)) )
))
(declare-fun lt!116175 () ListLongMap!3377)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun contains!1593 (ListLongMap!3377 (_ BitVec 64)) Bool)

(assert (=> b!230688 (= c!38304 (contains!1593 lt!116175 key!932))))

(declare-fun getCurrentListMap!1236 (array!11365 array!11363 (_ BitVec 32) (_ BitVec 32) V!7729 V!7729 (_ BitVec 32) Int) ListLongMap!3377)

(assert (=> b!230688 (= lt!116175 (getCurrentListMap!1236 (_keys!6350 thiss!1504) (_values!4279 thiss!1504) (mask!10190 thiss!1504) (extraKeys!4033 thiss!1504) (zeroValue!4137 thiss!1504) (minValue!4137 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4296 thiss!1504)))))

(declare-datatypes ((SeekEntryResult!906 0))(
  ( (MissingZero!906 (index!5794 (_ BitVec 32))) (Found!906 (index!5795 (_ BitVec 32))) (Intermediate!906 (undefined!1718 Bool) (index!5796 (_ BitVec 32)) (x!23422 (_ BitVec 32))) (Undefined!906) (MissingVacant!906 (index!5797 (_ BitVec 32))) )
))
(declare-fun lt!116174 () SeekEntryResult!906)

(declare-fun call!21419 () Bool)

(declare-fun c!38303 () Bool)

(declare-fun bm!21416 () Bool)

(assert (=> bm!21416 (= call!21419 (inRange!0 (ite c!38303 (index!5794 lt!116174) (index!5797 lt!116174)) (mask!10190 thiss!1504)))))

(declare-fun b!230689 () Bool)

(declare-fun e!149718 () Bool)

(declare-fun e!149715 () Bool)

(assert (=> b!230689 (= e!149718 e!149715)))

(declare-fun res!113443 () Bool)

(assert (=> b!230689 (= res!113443 call!21419)))

(assert (=> b!230689 (=> (not res!113443) (not e!149715))))

(declare-fun b!230691 () Bool)

(declare-fun e!149708 () Unit!7050)

(declare-fun Unit!7052 () Unit!7050)

(assert (=> b!230691 (= e!149708 Unit!7052)))

(declare-fun mapIsEmpty!10261 () Bool)

(assert (=> mapIsEmpty!10261 mapRes!10261))

(declare-fun b!230692 () Bool)

(declare-fun e!149717 () Bool)

(assert (=> b!230692 (= e!149717 e!149709)))

(declare-fun res!113444 () Bool)

(assert (=> b!230692 (=> (not res!113444) (not e!149709))))

(assert (=> b!230692 (= res!113444 (or (= lt!116174 (MissingZero!906 index!297)) (= lt!116174 (MissingVacant!906 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11365 (_ BitVec 32)) SeekEntryResult!906)

(assert (=> b!230692 (= lt!116174 (seekEntryOrOpen!0 key!932 (_keys!6350 thiss!1504) (mask!10190 thiss!1504)))))

(declare-fun b!230693 () Bool)

(declare-fun Unit!7053 () Unit!7050)

(assert (=> b!230693 (= e!149708 Unit!7053)))

(declare-fun lt!116169 () Unit!7050)

(declare-fun lemmaArrayContainsKeyThenInListMap!132 (array!11365 array!11363 (_ BitVec 32) (_ BitVec 32) V!7729 V!7729 (_ BitVec 64) (_ BitVec 32) Int) Unit!7050)

(assert (=> b!230693 (= lt!116169 (lemmaArrayContainsKeyThenInListMap!132 (_keys!6350 thiss!1504) (_values!4279 thiss!1504) (mask!10190 thiss!1504) (extraKeys!4033 thiss!1504) (zeroValue!4137 thiss!1504) (minValue!4137 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4296 thiss!1504)))))

(assert (=> b!230693 false))

(declare-fun b!230694 () Bool)

(get-info :version)

(assert (=> b!230694 (= e!149718 ((_ is Undefined!906) lt!116174))))

(declare-fun b!230695 () Bool)

(assert (=> b!230695 (= e!149720 (not true))))

(declare-fun lt!116166 () array!11365)

(declare-fun arrayCountValidKeys!0 (array!11365 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!230695 (= (arrayCountValidKeys!0 lt!116166 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116171 () Unit!7050)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11365 (_ BitVec 32)) Unit!7050)

(assert (=> b!230695 (= lt!116171 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116166 index!297))))

(declare-fun arrayContainsKey!0 (array!11365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230695 (arrayContainsKey!0 lt!116166 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116168 () Unit!7050)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11365 (_ BitVec 64) (_ BitVec 32)) Unit!7050)

(assert (=> b!230695 (= lt!116168 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116166 key!932 index!297))))

(declare-fun v!346 () V!7729)

(declare-fun +!603 (ListLongMap!3377 tuple2!4462) ListLongMap!3377)

(assert (=> b!230695 (= (+!603 lt!116175 (tuple2!4463 key!932 v!346)) (getCurrentListMap!1236 lt!116166 (array!11364 (store (arr!5401 (_values!4279 thiss!1504)) index!297 (ValueCellFull!2687 v!346)) (size!5734 (_values!4279 thiss!1504))) (mask!10190 thiss!1504) (extraKeys!4033 thiss!1504) (zeroValue!4137 thiss!1504) (minValue!4137 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4296 thiss!1504)))))

(declare-fun lt!116172 () Unit!7050)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!62 (array!11365 array!11363 (_ BitVec 32) (_ BitVec 32) V!7729 V!7729 (_ BitVec 32) (_ BitVec 64) V!7729 Int) Unit!7050)

(assert (=> b!230695 (= lt!116172 (lemmaAddValidKeyToArrayThenAddPairToListMap!62 (_keys!6350 thiss!1504) (_values!4279 thiss!1504) (mask!10190 thiss!1504) (extraKeys!4033 thiss!1504) (zeroValue!4137 thiss!1504) (minValue!4137 thiss!1504) index!297 key!932 v!346 (defaultEntry!4296 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11365 (_ BitVec 32)) Bool)

(assert (=> b!230695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116166 (mask!10190 thiss!1504))))

(declare-fun lt!116170 () Unit!7050)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11365 (_ BitVec 32) (_ BitVec 32)) Unit!7050)

(assert (=> b!230695 (= lt!116170 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6350 thiss!1504) index!297 (mask!10190 thiss!1504)))))

(assert (=> b!230695 (= (arrayCountValidKeys!0 lt!116166 #b00000000000000000000000000000000 (size!5735 (_keys!6350 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6350 thiss!1504) #b00000000000000000000000000000000 (size!5735 (_keys!6350 thiss!1504)))))))

(declare-fun lt!116179 () Unit!7050)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11365 (_ BitVec 32) (_ BitVec 64)) Unit!7050)

(assert (=> b!230695 (= lt!116179 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6350 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3376 0))(
  ( (Nil!3373) (Cons!3372 (h!4020 (_ BitVec 64)) (t!8327 List!3376)) )
))
(declare-fun arrayNoDuplicates!0 (array!11365 (_ BitVec 32) List!3376) Bool)

(assert (=> b!230695 (arrayNoDuplicates!0 lt!116166 #b00000000000000000000000000000000 Nil!3373)))

(assert (=> b!230695 (= lt!116166 (array!11366 (store (arr!5402 (_keys!6350 thiss!1504)) index!297 key!932) (size!5735 (_keys!6350 thiss!1504))))))

(declare-fun lt!116177 () Unit!7050)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11365 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3376) Unit!7050)

(assert (=> b!230695 (= lt!116177 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6350 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3373))))

(declare-fun lt!116178 () Unit!7050)

(assert (=> b!230695 (= lt!116178 e!149708)))

(declare-fun c!38305 () Bool)

(assert (=> b!230695 (= c!38305 (arrayContainsKey!0 (_keys!6350 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230696 () Bool)

(declare-fun res!113439 () Bool)

(declare-fun e!149707 () Bool)

(assert (=> b!230696 (=> (not res!113439) (not e!149707))))

(assert (=> b!230696 (= res!113439 call!21419)))

(declare-fun e!149714 () Bool)

(assert (=> b!230696 (= e!149714 e!149707)))

(declare-fun b!230697 () Bool)

(declare-fun c!38302 () Bool)

(assert (=> b!230697 (= c!38302 ((_ is MissingVacant!906) lt!116174))))

(assert (=> b!230697 (= e!149714 e!149718)))

(declare-fun b!230698 () Bool)

(declare-fun Unit!7054 () Unit!7050)

(assert (=> b!230698 (= e!149716 Unit!7054)))

(declare-fun lt!116173 () Unit!7050)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!296 (array!11365 array!11363 (_ BitVec 32) (_ BitVec 32) V!7729 V!7729 (_ BitVec 64) Int) Unit!7050)

(assert (=> b!230698 (= lt!116173 (lemmaInListMapThenSeekEntryOrOpenFindsIt!296 (_keys!6350 thiss!1504) (_values!4279 thiss!1504) (mask!10190 thiss!1504) (extraKeys!4033 thiss!1504) (zeroValue!4137 thiss!1504) (minValue!4137 thiss!1504) key!932 (defaultEntry!4296 thiss!1504)))))

(assert (=> b!230698 false))

(declare-fun mapNonEmpty!10261 () Bool)

(declare-fun tp!21739 () Bool)

(declare-fun e!149712 () Bool)

(assert (=> mapNonEmpty!10261 (= mapRes!10261 (and tp!21739 e!149712))))

(declare-fun mapValue!10261 () ValueCell!2687)

(declare-fun mapRest!10261 () (Array (_ BitVec 32) ValueCell!2687))

(declare-fun mapKey!10261 () (_ BitVec 32))

(assert (=> mapNonEmpty!10261 (= (arr!5401 (_values!4279 thiss!1504)) (store mapRest!10261 mapKey!10261 mapValue!10261))))

(declare-fun b!230690 () Bool)

(declare-fun res!113446 () Bool)

(assert (=> b!230690 (= res!113446 (= (select (arr!5402 (_keys!6350 thiss!1504)) (index!5797 lt!116174)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!230690 (=> (not res!113446) (not e!149715))))

(declare-fun res!113445 () Bool)

(assert (=> start!22136 (=> (not res!113445) (not e!149717))))

(declare-fun valid!1315 (LongMapFixedSize!3274) Bool)

(assert (=> start!22136 (= res!113445 (valid!1315 thiss!1504))))

(assert (=> start!22136 e!149717))

(declare-fun e!149713 () Bool)

(assert (=> start!22136 e!149713))

(assert (=> start!22136 true))

(declare-fun tp_is_empty!6061 () Bool)

(assert (=> start!22136 tp_is_empty!6061))

(declare-fun b!230699 () Bool)

(assert (=> b!230699 (= e!149719 tp_is_empty!6061)))

(declare-fun b!230700 () Bool)

(declare-fun call!21420 () Bool)

(assert (=> b!230700 (= e!149715 (not call!21420))))

(declare-fun b!230701 () Bool)

(assert (=> b!230701 (= e!149712 tp_is_empty!6061)))

(declare-fun array_inv!3545 (array!11365) Bool)

(declare-fun array_inv!3546 (array!11363) Bool)

(assert (=> b!230702 (= e!149713 (and tp!21738 tp_is_empty!6061 (array_inv!3545 (_keys!6350 thiss!1504)) (array_inv!3546 (_values!4279 thiss!1504)) e!149711))))

(declare-fun b!230703 () Bool)

(declare-fun lt!116176 () Unit!7050)

(assert (=> b!230703 (= e!149716 lt!116176)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!289 (array!11365 array!11363 (_ BitVec 32) (_ BitVec 32) V!7729 V!7729 (_ BitVec 64) Int) Unit!7050)

(assert (=> b!230703 (= lt!116176 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!289 (_keys!6350 thiss!1504) (_values!4279 thiss!1504) (mask!10190 thiss!1504) (extraKeys!4033 thiss!1504) (zeroValue!4137 thiss!1504) (minValue!4137 thiss!1504) key!932 (defaultEntry!4296 thiss!1504)))))

(assert (=> b!230703 (= c!38303 ((_ is MissingZero!906) lt!116174))))

(assert (=> b!230703 e!149714))

(declare-fun b!230704 () Bool)

(declare-fun res!113440 () Bool)

(assert (=> b!230704 (=> (not res!113440) (not e!149707))))

(assert (=> b!230704 (= res!113440 (= (select (arr!5402 (_keys!6350 thiss!1504)) (index!5794 lt!116174)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!230705 () Bool)

(assert (=> b!230705 (= e!149707 (not call!21420))))

(declare-fun bm!21417 () Bool)

(assert (=> bm!21417 (= call!21420 (arrayContainsKey!0 (_keys!6350 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230706 () Bool)

(declare-fun res!113442 () Bool)

(assert (=> b!230706 (=> (not res!113442) (not e!149717))))

(assert (=> b!230706 (= res!113442 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!22136 res!113445) b!230706))

(assert (= (and b!230706 res!113442) b!230692))

(assert (= (and b!230692 res!113444) b!230688))

(assert (= (and b!230688 c!38304) b!230698))

(assert (= (and b!230688 (not c!38304)) b!230703))

(assert (= (and b!230703 c!38303) b!230696))

(assert (= (and b!230703 (not c!38303)) b!230697))

(assert (= (and b!230696 res!113439) b!230704))

(assert (= (and b!230704 res!113440) b!230705))

(assert (= (and b!230697 c!38302) b!230689))

(assert (= (and b!230697 (not c!38302)) b!230694))

(assert (= (and b!230689 res!113443) b!230690))

(assert (= (and b!230690 res!113446) b!230700))

(assert (= (or b!230696 b!230689) bm!21416))

(assert (= (or b!230705 b!230700) bm!21417))

(assert (= (and b!230688 res!113441) b!230695))

(assert (= (and b!230695 c!38305) b!230693))

(assert (= (and b!230695 (not c!38305)) b!230691))

(assert (= (and b!230687 condMapEmpty!10261) mapIsEmpty!10261))

(assert (= (and b!230687 (not condMapEmpty!10261)) mapNonEmpty!10261))

(assert (= (and mapNonEmpty!10261 ((_ is ValueCellFull!2687) mapValue!10261)) b!230701))

(assert (= (and b!230687 ((_ is ValueCellFull!2687) mapDefault!10261)) b!230699))

(assert (= b!230702 b!230687))

(assert (= start!22136 b!230702))

(declare-fun m!252187 () Bool)

(assert (=> bm!21417 m!252187))

(declare-fun m!252189 () Bool)

(assert (=> b!230695 m!252189))

(assert (=> b!230695 m!252187))

(declare-fun m!252191 () Bool)

(assert (=> b!230695 m!252191))

(declare-fun m!252193 () Bool)

(assert (=> b!230695 m!252193))

(declare-fun m!252195 () Bool)

(assert (=> b!230695 m!252195))

(declare-fun m!252197 () Bool)

(assert (=> b!230695 m!252197))

(declare-fun m!252199 () Bool)

(assert (=> b!230695 m!252199))

(declare-fun m!252201 () Bool)

(assert (=> b!230695 m!252201))

(declare-fun m!252203 () Bool)

(assert (=> b!230695 m!252203))

(declare-fun m!252205 () Bool)

(assert (=> b!230695 m!252205))

(declare-fun m!252207 () Bool)

(assert (=> b!230695 m!252207))

(declare-fun m!252209 () Bool)

(assert (=> b!230695 m!252209))

(declare-fun m!252211 () Bool)

(assert (=> b!230695 m!252211))

(declare-fun m!252213 () Bool)

(assert (=> b!230695 m!252213))

(declare-fun m!252215 () Bool)

(assert (=> b!230695 m!252215))

(declare-fun m!252217 () Bool)

(assert (=> b!230695 m!252217))

(declare-fun m!252219 () Bool)

(assert (=> b!230695 m!252219))

(declare-fun m!252221 () Bool)

(assert (=> b!230688 m!252221))

(declare-fun m!252223 () Bool)

(assert (=> b!230688 m!252223))

(declare-fun m!252225 () Bool)

(assert (=> b!230688 m!252225))

(declare-fun m!252227 () Bool)

(assert (=> b!230702 m!252227))

(declare-fun m!252229 () Bool)

(assert (=> b!230702 m!252229))

(declare-fun m!252231 () Bool)

(assert (=> b!230690 m!252231))

(declare-fun m!252233 () Bool)

(assert (=> b!230698 m!252233))

(declare-fun m!252235 () Bool)

(assert (=> bm!21416 m!252235))

(declare-fun m!252237 () Bool)

(assert (=> b!230703 m!252237))

(declare-fun m!252239 () Bool)

(assert (=> b!230692 m!252239))

(declare-fun m!252241 () Bool)

(assert (=> b!230704 m!252241))

(declare-fun m!252243 () Bool)

(assert (=> mapNonEmpty!10261 m!252243))

(declare-fun m!252245 () Bool)

(assert (=> b!230693 m!252245))

(declare-fun m!252247 () Bool)

(assert (=> start!22136 m!252247))

(check-sat (not b!230695) (not b!230702) (not mapNonEmpty!10261) (not start!22136) (not b_next!6199) (not b!230693) (not bm!21416) tp_is_empty!6061 (not b!230688) (not b!230698) b_and!13111 (not b!230703) (not b!230692) (not bm!21417))
(check-sat b_and!13111 (not b_next!6199))
