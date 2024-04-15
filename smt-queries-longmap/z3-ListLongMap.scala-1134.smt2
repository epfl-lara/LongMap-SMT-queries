; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23332 () Bool)

(assert start!23332)

(declare-fun b!245138 () Bool)

(declare-fun b_free!6553 () Bool)

(declare-fun b_next!6553 () Bool)

(assert (=> b!245138 (= b_free!6553 (not b_next!6553))))

(declare-fun tp!22890 () Bool)

(declare-fun b_and!13515 () Bool)

(assert (=> b!245138 (= tp!22890 b_and!13515)))

(declare-fun b!245132 () Bool)

(declare-fun res!120232 () Bool)

(declare-fun e!159038 () Bool)

(assert (=> b!245132 (=> (not res!120232) (not e!159038))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!245132 (= res!120232 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!245133 () Bool)

(declare-datatypes ((Unit!7566 0))(
  ( (Unit!7567) )
))
(declare-fun e!159033 () Unit!7566)

(declare-fun Unit!7568 () Unit!7566)

(assert (=> b!245133 (= e!159033 Unit!7568)))

(declare-fun mapNonEmpty!10882 () Bool)

(declare-fun mapRes!10882 () Bool)

(declare-fun tp!22891 () Bool)

(declare-fun e!159026 () Bool)

(assert (=> mapNonEmpty!10882 (= mapRes!10882 (and tp!22891 e!159026))))

(declare-datatypes ((V!8201 0))(
  ( (V!8202 (val!3252 Int)) )
))
(declare-datatypes ((ValueCell!2864 0))(
  ( (ValueCellFull!2864 (v!5298 V!8201)) (EmptyCell!2864) )
))
(declare-fun mapValue!10882 () ValueCell!2864)

(declare-fun mapRest!10882 () (Array (_ BitVec 32) ValueCell!2864))

(declare-fun mapKey!10882 () (_ BitVec 32))

(declare-datatypes ((array!12119 0))(
  ( (array!12120 (arr!5751 (Array (_ BitVec 32) ValueCell!2864)) (size!6094 (_ BitVec 32))) )
))
(declare-datatypes ((array!12121 0))(
  ( (array!12122 (arr!5752 (Array (_ BitVec 32) (_ BitVec 64))) (size!6095 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3628 0))(
  ( (LongMapFixedSize!3629 (defaultEntry!4539 Int) (mask!10647 (_ BitVec 32)) (extraKeys!4276 (_ BitVec 32)) (zeroValue!4380 V!8201) (minValue!4380 V!8201) (_size!1863 (_ BitVec 32)) (_keys!6652 array!12121) (_values!4522 array!12119) (_vacant!1863 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3628)

(assert (=> mapNonEmpty!10882 (= (arr!5751 (_values!4522 thiss!1504)) (store mapRest!10882 mapKey!10882 mapValue!10882))))

(declare-fun b!245134 () Bool)

(declare-fun e!159030 () Bool)

(declare-fun e!159027 () Bool)

(assert (=> b!245134 (= e!159030 e!159027)))

(declare-fun res!120227 () Bool)

(declare-fun call!22868 () Bool)

(assert (=> b!245134 (= res!120227 call!22868)))

(assert (=> b!245134 (=> (not res!120227) (not e!159027))))

(declare-fun bm!22865 () Bool)

(declare-fun call!22869 () Bool)

(declare-fun arrayContainsKey!0 (array!12121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22865 (= call!22869 (arrayContainsKey!0 (_keys!6652 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245135 () Bool)

(declare-fun e!159034 () Unit!7566)

(declare-fun Unit!7569 () Unit!7566)

(assert (=> b!245135 (= e!159034 Unit!7569)))

(declare-fun lt!122659 () Unit!7566)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!376 (array!12121 array!12119 (_ BitVec 32) (_ BitVec 32) V!8201 V!8201 (_ BitVec 64) Int) Unit!7566)

(assert (=> b!245135 (= lt!122659 (lemmaInListMapThenSeekEntryOrOpenFindsIt!376 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 (defaultEntry!4539 thiss!1504)))))

(assert (=> b!245135 false))

(declare-fun b!245136 () Bool)

(declare-fun res!120225 () Bool)

(declare-fun e!159036 () Bool)

(assert (=> b!245136 (=> (not res!120225) (not e!159036))))

(assert (=> b!245136 (= res!120225 call!22868)))

(declare-fun e!159037 () Bool)

(assert (=> b!245136 (= e!159037 e!159036)))

(declare-fun b!245137 () Bool)

(declare-fun tp_is_empty!6415 () Bool)

(assert (=> b!245137 (= e!159026 tp_is_empty!6415)))

(declare-fun e!159031 () Bool)

(declare-fun e!159035 () Bool)

(declare-fun array_inv!3795 (array!12121) Bool)

(declare-fun array_inv!3796 (array!12119) Bool)

(assert (=> b!245138 (= e!159035 (and tp!22890 tp_is_empty!6415 (array_inv!3795 (_keys!6652 thiss!1504)) (array_inv!3796 (_values!4522 thiss!1504)) e!159031))))

(declare-fun b!245139 () Bool)

(declare-fun Unit!7570 () Unit!7566)

(assert (=> b!245139 (= e!159033 Unit!7570)))

(declare-fun lt!122658 () Unit!7566)

(declare-fun lemmaArrayContainsKeyThenInListMap!184 (array!12121 array!12119 (_ BitVec 32) (_ BitVec 32) V!8201 V!8201 (_ BitVec 64) (_ BitVec 32) Int) Unit!7566)

(assert (=> b!245139 (= lt!122658 (lemmaArrayContainsKeyThenInListMap!184 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)))))

(assert (=> b!245139 false))

(declare-fun bm!22866 () Bool)

(declare-datatypes ((SeekEntryResult!1086 0))(
  ( (MissingZero!1086 (index!6514 (_ BitVec 32))) (Found!1086 (index!6515 (_ BitVec 32))) (Intermediate!1086 (undefined!1898 Bool) (index!6516 (_ BitVec 32)) (x!24415 (_ BitVec 32))) (Undefined!1086) (MissingVacant!1086 (index!6517 (_ BitVec 32))) )
))
(declare-fun lt!122654 () SeekEntryResult!1086)

(declare-fun c!40921 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22866 (= call!22868 (inRange!0 (ite c!40921 (index!6514 lt!122654) (index!6517 lt!122654)) (mask!10647 thiss!1504)))))

(declare-fun b!245140 () Bool)

(assert (=> b!245140 (= e!159036 (not call!22869))))

(declare-fun mapIsEmpty!10882 () Bool)

(assert (=> mapIsEmpty!10882 mapRes!10882))

(declare-fun b!245141 () Bool)

(declare-fun lt!122655 () Unit!7566)

(assert (=> b!245141 (= e!159034 lt!122655)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!373 (array!12121 array!12119 (_ BitVec 32) (_ BitVec 32) V!8201 V!8201 (_ BitVec 64) Int) Unit!7566)

(assert (=> b!245141 (= lt!122655 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!373 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 (defaultEntry!4539 thiss!1504)))))

(get-info :version)

(assert (=> b!245141 (= c!40921 ((_ is MissingZero!1086) lt!122654))))

(assert (=> b!245141 e!159037))

(declare-fun b!245142 () Bool)

(declare-fun e!159029 () Bool)

(assert (=> b!245142 (= e!159029 tp_is_empty!6415)))

(declare-fun b!245143 () Bool)

(declare-fun e!159032 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!245143 (= e!159032 (not (validMask!0 (mask!10647 thiss!1504))))))

(declare-fun lt!122656 () array!12121)

(declare-fun arrayCountValidKeys!0 (array!12121 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!245143 (= (arrayCountValidKeys!0 lt!122656 #b00000000000000000000000000000000 (size!6095 (_keys!6652 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6652 thiss!1504) #b00000000000000000000000000000000 (size!6095 (_keys!6652 thiss!1504)))))))

(declare-fun lt!122662 () Unit!7566)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12121 (_ BitVec 32) (_ BitVec 64)) Unit!7566)

(assert (=> b!245143 (= lt!122662 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6652 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3657 0))(
  ( (Nil!3654) (Cons!3653 (h!4310 (_ BitVec 64)) (t!8661 List!3657)) )
))
(declare-fun arrayNoDuplicates!0 (array!12121 (_ BitVec 32) List!3657) Bool)

(assert (=> b!245143 (arrayNoDuplicates!0 lt!122656 #b00000000000000000000000000000000 Nil!3654)))

(assert (=> b!245143 (= lt!122656 (array!12122 (store (arr!5752 (_keys!6652 thiss!1504)) index!297 key!932) (size!6095 (_keys!6652 thiss!1504))))))

(declare-fun lt!122661 () Unit!7566)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12121 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3657) Unit!7566)

(assert (=> b!245143 (= lt!122661 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6652 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3654))))

(declare-fun lt!122660 () Unit!7566)

(assert (=> b!245143 (= lt!122660 e!159033)))

(declare-fun c!40922 () Bool)

(assert (=> b!245143 (= c!40922 (arrayContainsKey!0 (_keys!6652 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245144 () Bool)

(declare-fun res!120229 () Bool)

(assert (=> b!245144 (= res!120229 (= (select (arr!5752 (_keys!6652 thiss!1504)) (index!6517 lt!122654)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245144 (=> (not res!120229) (not e!159027))))

(declare-fun b!245145 () Bool)

(assert (=> b!245145 (= e!159027 (not call!22869))))

(declare-fun b!245146 () Bool)

(declare-fun c!40924 () Bool)

(assert (=> b!245146 (= c!40924 ((_ is MissingVacant!1086) lt!122654))))

(assert (=> b!245146 (= e!159037 e!159030)))

(declare-fun b!245147 () Bool)

(assert (=> b!245147 (= e!159031 (and e!159029 mapRes!10882))))

(declare-fun condMapEmpty!10882 () Bool)

(declare-fun mapDefault!10882 () ValueCell!2864)

(assert (=> b!245147 (= condMapEmpty!10882 (= (arr!5751 (_values!4522 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2864)) mapDefault!10882)))))

(declare-fun b!245148 () Bool)

(declare-fun e!159028 () Bool)

(assert (=> b!245148 (= e!159038 e!159028)))

(declare-fun res!120228 () Bool)

(assert (=> b!245148 (=> (not res!120228) (not e!159028))))

(assert (=> b!245148 (= res!120228 (or (= lt!122654 (MissingZero!1086 index!297)) (= lt!122654 (MissingVacant!1086 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12121 (_ BitVec 32)) SeekEntryResult!1086)

(assert (=> b!245148 (= lt!122654 (seekEntryOrOpen!0 key!932 (_keys!6652 thiss!1504) (mask!10647 thiss!1504)))))

(declare-fun res!120231 () Bool)

(assert (=> start!23332 (=> (not res!120231) (not e!159038))))

(declare-fun valid!1431 (LongMapFixedSize!3628) Bool)

(assert (=> start!23332 (= res!120231 (valid!1431 thiss!1504))))

(assert (=> start!23332 e!159038))

(assert (=> start!23332 e!159035))

(assert (=> start!23332 true))

(declare-fun b!245149 () Bool)

(assert (=> b!245149 (= e!159030 ((_ is Undefined!1086) lt!122654))))

(declare-fun b!245150 () Bool)

(assert (=> b!245150 (= e!159028 e!159032)))

(declare-fun res!120226 () Bool)

(assert (=> b!245150 (=> (not res!120226) (not e!159032))))

(assert (=> b!245150 (= res!120226 (inRange!0 index!297 (mask!10647 thiss!1504)))))

(declare-fun lt!122657 () Unit!7566)

(assert (=> b!245150 (= lt!122657 e!159034)))

(declare-fun c!40923 () Bool)

(declare-datatypes ((tuple2!4754 0))(
  ( (tuple2!4755 (_1!2388 (_ BitVec 64)) (_2!2388 V!8201)) )
))
(declare-datatypes ((List!3658 0))(
  ( (Nil!3655) (Cons!3654 (h!4311 tuple2!4754) (t!8662 List!3658)) )
))
(declare-datatypes ((ListLongMap!3657 0))(
  ( (ListLongMap!3658 (toList!1844 List!3658)) )
))
(declare-fun contains!1757 (ListLongMap!3657 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1353 (array!12121 array!12119 (_ BitVec 32) (_ BitVec 32) V!8201 V!8201 (_ BitVec 32) Int) ListLongMap!3657)

(assert (=> b!245150 (= c!40923 (contains!1757 (getCurrentListMap!1353 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)) key!932))))

(declare-fun b!245151 () Bool)

(declare-fun res!120230 () Bool)

(assert (=> b!245151 (=> (not res!120230) (not e!159036))))

(assert (=> b!245151 (= res!120230 (= (select (arr!5752 (_keys!6652 thiss!1504)) (index!6514 lt!122654)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!23332 res!120231) b!245132))

(assert (= (and b!245132 res!120232) b!245148))

(assert (= (and b!245148 res!120228) b!245150))

(assert (= (and b!245150 c!40923) b!245135))

(assert (= (and b!245150 (not c!40923)) b!245141))

(assert (= (and b!245141 c!40921) b!245136))

(assert (= (and b!245141 (not c!40921)) b!245146))

(assert (= (and b!245136 res!120225) b!245151))

(assert (= (and b!245151 res!120230) b!245140))

(assert (= (and b!245146 c!40924) b!245134))

(assert (= (and b!245146 (not c!40924)) b!245149))

(assert (= (and b!245134 res!120227) b!245144))

(assert (= (and b!245144 res!120229) b!245145))

(assert (= (or b!245136 b!245134) bm!22866))

(assert (= (or b!245140 b!245145) bm!22865))

(assert (= (and b!245150 res!120226) b!245143))

(assert (= (and b!245143 c!40922) b!245139))

(assert (= (and b!245143 (not c!40922)) b!245133))

(assert (= (and b!245147 condMapEmpty!10882) mapIsEmpty!10882))

(assert (= (and b!245147 (not condMapEmpty!10882)) mapNonEmpty!10882))

(assert (= (and mapNonEmpty!10882 ((_ is ValueCellFull!2864) mapValue!10882)) b!245137))

(assert (= (and b!245147 ((_ is ValueCellFull!2864) mapDefault!10882)) b!245142))

(assert (= b!245138 b!245147))

(assert (= start!23332 b!245138))

(declare-fun m!262293 () Bool)

(assert (=> b!245151 m!262293))

(declare-fun m!262295 () Bool)

(assert (=> mapNonEmpty!10882 m!262295))

(declare-fun m!262297 () Bool)

(assert (=> b!245141 m!262297))

(declare-fun m!262299 () Bool)

(assert (=> bm!22866 m!262299))

(declare-fun m!262301 () Bool)

(assert (=> b!245143 m!262301))

(declare-fun m!262303 () Bool)

(assert (=> b!245143 m!262303))

(declare-fun m!262305 () Bool)

(assert (=> b!245143 m!262305))

(declare-fun m!262307 () Bool)

(assert (=> b!245143 m!262307))

(declare-fun m!262309 () Bool)

(assert (=> b!245143 m!262309))

(declare-fun m!262311 () Bool)

(assert (=> b!245143 m!262311))

(declare-fun m!262313 () Bool)

(assert (=> b!245143 m!262313))

(declare-fun m!262315 () Bool)

(assert (=> b!245143 m!262315))

(declare-fun m!262317 () Bool)

(assert (=> b!245150 m!262317))

(declare-fun m!262319 () Bool)

(assert (=> b!245150 m!262319))

(assert (=> b!245150 m!262319))

(declare-fun m!262321 () Bool)

(assert (=> b!245150 m!262321))

(declare-fun m!262323 () Bool)

(assert (=> b!245139 m!262323))

(assert (=> bm!22865 m!262313))

(declare-fun m!262325 () Bool)

(assert (=> b!245148 m!262325))

(declare-fun m!262327 () Bool)

(assert (=> b!245144 m!262327))

(declare-fun m!262329 () Bool)

(assert (=> b!245138 m!262329))

(declare-fun m!262331 () Bool)

(assert (=> b!245138 m!262331))

(declare-fun m!262333 () Bool)

(assert (=> b!245135 m!262333))

(declare-fun m!262335 () Bool)

(assert (=> start!23332 m!262335))

(check-sat (not start!23332) (not b!245138) (not b!245139) (not bm!22865) (not b_next!6553) (not b!245143) (not b!245148) (not b!245135) b_and!13515 tp_is_empty!6415 (not b!245150) (not bm!22866) (not mapNonEmpty!10882) (not b!245141))
(check-sat b_and!13515 (not b_next!6553))
(get-model)

(declare-fun b!245282 () Bool)

(declare-fun e!159131 () Bool)

(declare-fun e!159133 () Bool)

(assert (=> b!245282 (= e!159131 e!159133)))

(declare-fun c!40951 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!245282 (= c!40951 (validKeyInArray!0 (select (arr!5752 lt!122656) #b00000000000000000000000000000000)))))

(declare-fun b!245283 () Bool)

(declare-fun e!159134 () Bool)

(declare-fun contains!1759 (List!3657 (_ BitVec 64)) Bool)

(assert (=> b!245283 (= e!159134 (contains!1759 Nil!3654 (select (arr!5752 lt!122656) #b00000000000000000000000000000000)))))

(declare-fun b!245285 () Bool)

(declare-fun call!22884 () Bool)

(assert (=> b!245285 (= e!159133 call!22884)))

(declare-fun b!245286 () Bool)

(declare-fun e!159132 () Bool)

(assert (=> b!245286 (= e!159132 e!159131)))

(declare-fun res!120288 () Bool)

(assert (=> b!245286 (=> (not res!120288) (not e!159131))))

(assert (=> b!245286 (= res!120288 (not e!159134))))

(declare-fun res!120289 () Bool)

(assert (=> b!245286 (=> (not res!120289) (not e!159134))))

(assert (=> b!245286 (= res!120289 (validKeyInArray!0 (select (arr!5752 lt!122656) #b00000000000000000000000000000000)))))

(declare-fun bm!22881 () Bool)

(assert (=> bm!22881 (= call!22884 (arrayNoDuplicates!0 lt!122656 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!40951 (Cons!3653 (select (arr!5752 lt!122656) #b00000000000000000000000000000000) Nil!3654) Nil!3654)))))

(declare-fun d!60033 () Bool)

(declare-fun res!120287 () Bool)

(assert (=> d!60033 (=> res!120287 e!159132)))

(assert (=> d!60033 (= res!120287 (bvsge #b00000000000000000000000000000000 (size!6095 lt!122656)))))

(assert (=> d!60033 (= (arrayNoDuplicates!0 lt!122656 #b00000000000000000000000000000000 Nil!3654) e!159132)))

(declare-fun b!245284 () Bool)

(assert (=> b!245284 (= e!159133 call!22884)))

(assert (= (and d!60033 (not res!120287)) b!245286))

(assert (= (and b!245286 res!120289) b!245283))

(assert (= (and b!245286 res!120288) b!245282))

(assert (= (and b!245282 c!40951) b!245285))

(assert (= (and b!245282 (not c!40951)) b!245284))

(assert (= (or b!245285 b!245284) bm!22881))

(declare-fun m!262425 () Bool)

(assert (=> b!245282 m!262425))

(assert (=> b!245282 m!262425))

(declare-fun m!262427 () Bool)

(assert (=> b!245282 m!262427))

(assert (=> b!245283 m!262425))

(assert (=> b!245283 m!262425))

(declare-fun m!262429 () Bool)

(assert (=> b!245283 m!262429))

(assert (=> b!245286 m!262425))

(assert (=> b!245286 m!262425))

(assert (=> b!245286 m!262427))

(assert (=> bm!22881 m!262425))

(declare-fun m!262431 () Bool)

(assert (=> bm!22881 m!262431))

(assert (=> b!245143 d!60033))

(declare-fun d!60035 () Bool)

(declare-fun e!159139 () Bool)

(assert (=> d!60035 e!159139))

(declare-fun res!120300 () Bool)

(assert (=> d!60035 (=> (not res!120300) (not e!159139))))

(assert (=> d!60035 (= res!120300 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6095 (_keys!6652 thiss!1504)))))))

(declare-fun lt!122719 () Unit!7566)

(declare-fun choose!1 (array!12121 (_ BitVec 32) (_ BitVec 64)) Unit!7566)

(assert (=> d!60035 (= lt!122719 (choose!1 (_keys!6652 thiss!1504) index!297 key!932))))

(declare-fun e!159140 () Bool)

(assert (=> d!60035 e!159140))

(declare-fun res!120301 () Bool)

(assert (=> d!60035 (=> (not res!120301) (not e!159140))))

(assert (=> d!60035 (= res!120301 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6095 (_keys!6652 thiss!1504)))))))

(assert (=> d!60035 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6652 thiss!1504) index!297 key!932) lt!122719)))

(declare-fun b!245296 () Bool)

(declare-fun res!120298 () Bool)

(assert (=> b!245296 (=> (not res!120298) (not e!159140))))

(assert (=> b!245296 (= res!120298 (validKeyInArray!0 key!932))))

(declare-fun b!245298 () Bool)

(assert (=> b!245298 (= e!159139 (= (arrayCountValidKeys!0 (array!12122 (store (arr!5752 (_keys!6652 thiss!1504)) index!297 key!932) (size!6095 (_keys!6652 thiss!1504))) #b00000000000000000000000000000000 (size!6095 (_keys!6652 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6652 thiss!1504) #b00000000000000000000000000000000 (size!6095 (_keys!6652 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!245297 () Bool)

(assert (=> b!245297 (= e!159140 (bvslt (size!6095 (_keys!6652 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!245295 () Bool)

(declare-fun res!120299 () Bool)

(assert (=> b!245295 (=> (not res!120299) (not e!159140))))

(assert (=> b!245295 (= res!120299 (not (validKeyInArray!0 (select (arr!5752 (_keys!6652 thiss!1504)) index!297))))))

(assert (= (and d!60035 res!120301) b!245295))

(assert (= (and b!245295 res!120299) b!245296))

(assert (= (and b!245296 res!120298) b!245297))

(assert (= (and d!60035 res!120300) b!245298))

(declare-fun m!262433 () Bool)

(assert (=> d!60035 m!262433))

(declare-fun m!262435 () Bool)

(assert (=> b!245296 m!262435))

(assert (=> b!245298 m!262307))

(declare-fun m!262437 () Bool)

(assert (=> b!245298 m!262437))

(assert (=> b!245298 m!262309))

(declare-fun m!262439 () Bool)

(assert (=> b!245295 m!262439))

(assert (=> b!245295 m!262439))

(declare-fun m!262441 () Bool)

(assert (=> b!245295 m!262441))

(assert (=> b!245143 d!60035))

(declare-fun d!60037 () Bool)

(declare-fun res!120306 () Bool)

(declare-fun e!159145 () Bool)

(assert (=> d!60037 (=> res!120306 e!159145)))

(assert (=> d!60037 (= res!120306 (= (select (arr!5752 (_keys!6652 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60037 (= (arrayContainsKey!0 (_keys!6652 thiss!1504) key!932 #b00000000000000000000000000000000) e!159145)))

(declare-fun b!245303 () Bool)

(declare-fun e!159146 () Bool)

(assert (=> b!245303 (= e!159145 e!159146)))

(declare-fun res!120307 () Bool)

(assert (=> b!245303 (=> (not res!120307) (not e!159146))))

(assert (=> b!245303 (= res!120307 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6095 (_keys!6652 thiss!1504))))))

(declare-fun b!245304 () Bool)

(assert (=> b!245304 (= e!159146 (arrayContainsKey!0 (_keys!6652 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60037 (not res!120306)) b!245303))

(assert (= (and b!245303 res!120307) b!245304))

(declare-fun m!262443 () Bool)

(assert (=> d!60037 m!262443))

(declare-fun m!262445 () Bool)

(assert (=> b!245304 m!262445))

(assert (=> b!245143 d!60037))

(declare-fun b!245313 () Bool)

(declare-fun e!159152 () (_ BitVec 32))

(declare-fun call!22887 () (_ BitVec 32))

(assert (=> b!245313 (= e!159152 call!22887)))

(declare-fun bm!22884 () Bool)

(assert (=> bm!22884 (= call!22887 (arrayCountValidKeys!0 (_keys!6652 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6095 (_keys!6652 thiss!1504))))))

(declare-fun b!245314 () Bool)

(declare-fun e!159151 () (_ BitVec 32))

(assert (=> b!245314 (= e!159151 e!159152)))

(declare-fun c!40956 () Bool)

(assert (=> b!245314 (= c!40956 (validKeyInArray!0 (select (arr!5752 (_keys!6652 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!60039 () Bool)

(declare-fun lt!122722 () (_ BitVec 32))

(assert (=> d!60039 (and (bvsge lt!122722 #b00000000000000000000000000000000) (bvsle lt!122722 (bvsub (size!6095 (_keys!6652 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60039 (= lt!122722 e!159151)))

(declare-fun c!40957 () Bool)

(assert (=> d!60039 (= c!40957 (bvsge #b00000000000000000000000000000000 (size!6095 (_keys!6652 thiss!1504))))))

(assert (=> d!60039 (and (bvsle #b00000000000000000000000000000000 (size!6095 (_keys!6652 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6095 (_keys!6652 thiss!1504)) (size!6095 (_keys!6652 thiss!1504))))))

(assert (=> d!60039 (= (arrayCountValidKeys!0 (_keys!6652 thiss!1504) #b00000000000000000000000000000000 (size!6095 (_keys!6652 thiss!1504))) lt!122722)))

(declare-fun b!245315 () Bool)

(assert (=> b!245315 (= e!159152 (bvadd #b00000000000000000000000000000001 call!22887))))

(declare-fun b!245316 () Bool)

(assert (=> b!245316 (= e!159151 #b00000000000000000000000000000000)))

(assert (= (and d!60039 c!40957) b!245316))

(assert (= (and d!60039 (not c!40957)) b!245314))

(assert (= (and b!245314 c!40956) b!245315))

(assert (= (and b!245314 (not c!40956)) b!245313))

(assert (= (or b!245315 b!245313) bm!22884))

(declare-fun m!262447 () Bool)

(assert (=> bm!22884 m!262447))

(assert (=> b!245314 m!262443))

(assert (=> b!245314 m!262443))

(declare-fun m!262449 () Bool)

(assert (=> b!245314 m!262449))

(assert (=> b!245143 d!60039))

(declare-fun d!60041 () Bool)

(assert (=> d!60041 (= (validMask!0 (mask!10647 thiss!1504)) (and (or (= (mask!10647 thiss!1504) #b00000000000000000000000000000111) (= (mask!10647 thiss!1504) #b00000000000000000000000000001111) (= (mask!10647 thiss!1504) #b00000000000000000000000000011111) (= (mask!10647 thiss!1504) #b00000000000000000000000000111111) (= (mask!10647 thiss!1504) #b00000000000000000000000001111111) (= (mask!10647 thiss!1504) #b00000000000000000000000011111111) (= (mask!10647 thiss!1504) #b00000000000000000000000111111111) (= (mask!10647 thiss!1504) #b00000000000000000000001111111111) (= (mask!10647 thiss!1504) #b00000000000000000000011111111111) (= (mask!10647 thiss!1504) #b00000000000000000000111111111111) (= (mask!10647 thiss!1504) #b00000000000000000001111111111111) (= (mask!10647 thiss!1504) #b00000000000000000011111111111111) (= (mask!10647 thiss!1504) #b00000000000000000111111111111111) (= (mask!10647 thiss!1504) #b00000000000000001111111111111111) (= (mask!10647 thiss!1504) #b00000000000000011111111111111111) (= (mask!10647 thiss!1504) #b00000000000000111111111111111111) (= (mask!10647 thiss!1504) #b00000000000001111111111111111111) (= (mask!10647 thiss!1504) #b00000000000011111111111111111111) (= (mask!10647 thiss!1504) #b00000000000111111111111111111111) (= (mask!10647 thiss!1504) #b00000000001111111111111111111111) (= (mask!10647 thiss!1504) #b00000000011111111111111111111111) (= (mask!10647 thiss!1504) #b00000000111111111111111111111111) (= (mask!10647 thiss!1504) #b00000001111111111111111111111111) (= (mask!10647 thiss!1504) #b00000011111111111111111111111111) (= (mask!10647 thiss!1504) #b00000111111111111111111111111111) (= (mask!10647 thiss!1504) #b00001111111111111111111111111111) (= (mask!10647 thiss!1504) #b00011111111111111111111111111111) (= (mask!10647 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10647 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!245143 d!60041))

(declare-fun b!245317 () Bool)

(declare-fun e!159154 () (_ BitVec 32))

(declare-fun call!22888 () (_ BitVec 32))

(assert (=> b!245317 (= e!159154 call!22888)))

(declare-fun bm!22885 () Bool)

(assert (=> bm!22885 (= call!22888 (arrayCountValidKeys!0 lt!122656 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6095 (_keys!6652 thiss!1504))))))

(declare-fun b!245318 () Bool)

(declare-fun e!159153 () (_ BitVec 32))

(assert (=> b!245318 (= e!159153 e!159154)))

(declare-fun c!40958 () Bool)

(assert (=> b!245318 (= c!40958 (validKeyInArray!0 (select (arr!5752 lt!122656) #b00000000000000000000000000000000)))))

(declare-fun d!60043 () Bool)

(declare-fun lt!122723 () (_ BitVec 32))

(assert (=> d!60043 (and (bvsge lt!122723 #b00000000000000000000000000000000) (bvsle lt!122723 (bvsub (size!6095 lt!122656) #b00000000000000000000000000000000)))))

(assert (=> d!60043 (= lt!122723 e!159153)))

(declare-fun c!40959 () Bool)

(assert (=> d!60043 (= c!40959 (bvsge #b00000000000000000000000000000000 (size!6095 (_keys!6652 thiss!1504))))))

(assert (=> d!60043 (and (bvsle #b00000000000000000000000000000000 (size!6095 (_keys!6652 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6095 (_keys!6652 thiss!1504)) (size!6095 lt!122656)))))

(assert (=> d!60043 (= (arrayCountValidKeys!0 lt!122656 #b00000000000000000000000000000000 (size!6095 (_keys!6652 thiss!1504))) lt!122723)))

(declare-fun b!245319 () Bool)

(assert (=> b!245319 (= e!159154 (bvadd #b00000000000000000000000000000001 call!22888))))

(declare-fun b!245320 () Bool)

(assert (=> b!245320 (= e!159153 #b00000000000000000000000000000000)))

(assert (= (and d!60043 c!40959) b!245320))

(assert (= (and d!60043 (not c!40959)) b!245318))

(assert (= (and b!245318 c!40958) b!245319))

(assert (= (and b!245318 (not c!40958)) b!245317))

(assert (= (or b!245319 b!245317) bm!22885))

(declare-fun m!262451 () Bool)

(assert (=> bm!22885 m!262451))

(assert (=> b!245318 m!262425))

(assert (=> b!245318 m!262425))

(assert (=> b!245318 m!262427))

(assert (=> b!245143 d!60043))

(declare-fun d!60045 () Bool)

(declare-fun e!159157 () Bool)

(assert (=> d!60045 e!159157))

(declare-fun res!120310 () Bool)

(assert (=> d!60045 (=> (not res!120310) (not e!159157))))

(assert (=> d!60045 (= res!120310 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6095 (_keys!6652 thiss!1504)))))))

(declare-fun lt!122726 () Unit!7566)

(declare-fun choose!41 (array!12121 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3657) Unit!7566)

(assert (=> d!60045 (= lt!122726 (choose!41 (_keys!6652 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3654))))

(assert (=> d!60045 (bvslt (size!6095 (_keys!6652 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60045 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6652 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3654) lt!122726)))

(declare-fun b!245323 () Bool)

(assert (=> b!245323 (= e!159157 (arrayNoDuplicates!0 (array!12122 (store (arr!5752 (_keys!6652 thiss!1504)) index!297 key!932) (size!6095 (_keys!6652 thiss!1504))) #b00000000000000000000000000000000 Nil!3654))))

(assert (= (and d!60045 res!120310) b!245323))

(declare-fun m!262453 () Bool)

(assert (=> d!60045 m!262453))

(assert (=> b!245323 m!262307))

(declare-fun m!262455 () Bool)

(assert (=> b!245323 m!262455))

(assert (=> b!245143 d!60045))

(declare-fun d!60047 () Bool)

(assert (=> d!60047 (= (inRange!0 (ite c!40921 (index!6514 lt!122654) (index!6517 lt!122654)) (mask!10647 thiss!1504)) (and (bvsge (ite c!40921 (index!6514 lt!122654) (index!6517 lt!122654)) #b00000000000000000000000000000000) (bvslt (ite c!40921 (index!6514 lt!122654) (index!6517 lt!122654)) (bvadd (mask!10647 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22866 d!60047))

(declare-fun d!60049 () Bool)

(assert (=> d!60049 (contains!1757 (getCurrentListMap!1353 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)) key!932)))

(declare-fun lt!122729 () Unit!7566)

(declare-fun choose!1153 (array!12121 array!12119 (_ BitVec 32) (_ BitVec 32) V!8201 V!8201 (_ BitVec 64) (_ BitVec 32) Int) Unit!7566)

(assert (=> d!60049 (= lt!122729 (choose!1153 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)))))

(assert (=> d!60049 (validMask!0 (mask!10647 thiss!1504))))

(assert (=> d!60049 (= (lemmaArrayContainsKeyThenInListMap!184 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)) lt!122729)))

(declare-fun bs!8866 () Bool)

(assert (= bs!8866 d!60049))

(assert (=> bs!8866 m!262319))

(assert (=> bs!8866 m!262319))

(assert (=> bs!8866 m!262321))

(declare-fun m!262457 () Bool)

(assert (=> bs!8866 m!262457))

(assert (=> bs!8866 m!262301))

(assert (=> b!245139 d!60049))

(declare-fun b!245336 () Bool)

(declare-fun lt!122736 () SeekEntryResult!1086)

(declare-fun e!159166 () SeekEntryResult!1086)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12121 (_ BitVec 32)) SeekEntryResult!1086)

(assert (=> b!245336 (= e!159166 (seekKeyOrZeroReturnVacant!0 (x!24415 lt!122736) (index!6516 lt!122736) (index!6516 lt!122736) key!932 (_keys!6652 thiss!1504) (mask!10647 thiss!1504)))))

(declare-fun b!245337 () Bool)

(declare-fun e!159164 () SeekEntryResult!1086)

(declare-fun e!159165 () SeekEntryResult!1086)

(assert (=> b!245337 (= e!159164 e!159165)))

(declare-fun lt!122738 () (_ BitVec 64))

(assert (=> b!245337 (= lt!122738 (select (arr!5752 (_keys!6652 thiss!1504)) (index!6516 lt!122736)))))

(declare-fun c!40968 () Bool)

(assert (=> b!245337 (= c!40968 (= lt!122738 key!932))))

(declare-fun b!245338 () Bool)

(assert (=> b!245338 (= e!159166 (MissingZero!1086 (index!6516 lt!122736)))))

(declare-fun b!245339 () Bool)

(declare-fun c!40967 () Bool)

(assert (=> b!245339 (= c!40967 (= lt!122738 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245339 (= e!159165 e!159166)))

(declare-fun d!60051 () Bool)

(declare-fun lt!122737 () SeekEntryResult!1086)

(assert (=> d!60051 (and (or ((_ is Undefined!1086) lt!122737) (not ((_ is Found!1086) lt!122737)) (and (bvsge (index!6515 lt!122737) #b00000000000000000000000000000000) (bvslt (index!6515 lt!122737) (size!6095 (_keys!6652 thiss!1504))))) (or ((_ is Undefined!1086) lt!122737) ((_ is Found!1086) lt!122737) (not ((_ is MissingZero!1086) lt!122737)) (and (bvsge (index!6514 lt!122737) #b00000000000000000000000000000000) (bvslt (index!6514 lt!122737) (size!6095 (_keys!6652 thiss!1504))))) (or ((_ is Undefined!1086) lt!122737) ((_ is Found!1086) lt!122737) ((_ is MissingZero!1086) lt!122737) (not ((_ is MissingVacant!1086) lt!122737)) (and (bvsge (index!6517 lt!122737) #b00000000000000000000000000000000) (bvslt (index!6517 lt!122737) (size!6095 (_keys!6652 thiss!1504))))) (or ((_ is Undefined!1086) lt!122737) (ite ((_ is Found!1086) lt!122737) (= (select (arr!5752 (_keys!6652 thiss!1504)) (index!6515 lt!122737)) key!932) (ite ((_ is MissingZero!1086) lt!122737) (= (select (arr!5752 (_keys!6652 thiss!1504)) (index!6514 lt!122737)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1086) lt!122737) (= (select (arr!5752 (_keys!6652 thiss!1504)) (index!6517 lt!122737)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60051 (= lt!122737 e!159164)))

(declare-fun c!40966 () Bool)

(assert (=> d!60051 (= c!40966 (and ((_ is Intermediate!1086) lt!122736) (undefined!1898 lt!122736)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12121 (_ BitVec 32)) SeekEntryResult!1086)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60051 (= lt!122736 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10647 thiss!1504)) key!932 (_keys!6652 thiss!1504) (mask!10647 thiss!1504)))))

(assert (=> d!60051 (validMask!0 (mask!10647 thiss!1504))))

(assert (=> d!60051 (= (seekEntryOrOpen!0 key!932 (_keys!6652 thiss!1504) (mask!10647 thiss!1504)) lt!122737)))

(declare-fun b!245340 () Bool)

(assert (=> b!245340 (= e!159164 Undefined!1086)))

(declare-fun b!245341 () Bool)

(assert (=> b!245341 (= e!159165 (Found!1086 (index!6516 lt!122736)))))

(assert (= (and d!60051 c!40966) b!245340))

(assert (= (and d!60051 (not c!40966)) b!245337))

(assert (= (and b!245337 c!40968) b!245341))

(assert (= (and b!245337 (not c!40968)) b!245339))

(assert (= (and b!245339 c!40967) b!245338))

(assert (= (and b!245339 (not c!40967)) b!245336))

(declare-fun m!262459 () Bool)

(assert (=> b!245336 m!262459))

(declare-fun m!262461 () Bool)

(assert (=> b!245337 m!262461))

(declare-fun m!262463 () Bool)

(assert (=> d!60051 m!262463))

(assert (=> d!60051 m!262463))

(declare-fun m!262465 () Bool)

(assert (=> d!60051 m!262465))

(assert (=> d!60051 m!262301))

(declare-fun m!262467 () Bool)

(assert (=> d!60051 m!262467))

(declare-fun m!262469 () Bool)

(assert (=> d!60051 m!262469))

(declare-fun m!262471 () Bool)

(assert (=> d!60051 m!262471))

(assert (=> b!245148 d!60051))

(assert (=> bm!22865 d!60037))

(declare-fun d!60053 () Bool)

(assert (=> d!60053 (= (inRange!0 index!297 (mask!10647 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10647 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!245150 d!60053))

(declare-fun d!60055 () Bool)

(declare-fun e!159171 () Bool)

(assert (=> d!60055 e!159171))

(declare-fun res!120313 () Bool)

(assert (=> d!60055 (=> res!120313 e!159171)))

(declare-fun lt!122749 () Bool)

(assert (=> d!60055 (= res!120313 (not lt!122749))))

(declare-fun lt!122748 () Bool)

(assert (=> d!60055 (= lt!122749 lt!122748)))

(declare-fun lt!122750 () Unit!7566)

(declare-fun e!159172 () Unit!7566)

(assert (=> d!60055 (= lt!122750 e!159172)))

(declare-fun c!40971 () Bool)

(assert (=> d!60055 (= c!40971 lt!122748)))

(declare-fun containsKey!278 (List!3658 (_ BitVec 64)) Bool)

(assert (=> d!60055 (= lt!122748 (containsKey!278 (toList!1844 (getCurrentListMap!1353 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504))) key!932))))

(assert (=> d!60055 (= (contains!1757 (getCurrentListMap!1353 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)) key!932) lt!122749)))

(declare-fun b!245348 () Bool)

(declare-fun lt!122747 () Unit!7566)

(assert (=> b!245348 (= e!159172 lt!122747)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!227 (List!3658 (_ BitVec 64)) Unit!7566)

(assert (=> b!245348 (= lt!122747 (lemmaContainsKeyImpliesGetValueByKeyDefined!227 (toList!1844 (getCurrentListMap!1353 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504))) key!932))))

(declare-datatypes ((Option!292 0))(
  ( (Some!291 (v!5301 V!8201)) (None!290) )
))
(declare-fun isDefined!228 (Option!292) Bool)

(declare-fun getValueByKey!286 (List!3658 (_ BitVec 64)) Option!292)

(assert (=> b!245348 (isDefined!228 (getValueByKey!286 (toList!1844 (getCurrentListMap!1353 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504))) key!932))))

(declare-fun b!245349 () Bool)

(declare-fun Unit!7574 () Unit!7566)

(assert (=> b!245349 (= e!159172 Unit!7574)))

(declare-fun b!245350 () Bool)

(assert (=> b!245350 (= e!159171 (isDefined!228 (getValueByKey!286 (toList!1844 (getCurrentListMap!1353 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504))) key!932)))))

(assert (= (and d!60055 c!40971) b!245348))

(assert (= (and d!60055 (not c!40971)) b!245349))

(assert (= (and d!60055 (not res!120313)) b!245350))

(declare-fun m!262473 () Bool)

(assert (=> d!60055 m!262473))

(declare-fun m!262475 () Bool)

(assert (=> b!245348 m!262475))

(declare-fun m!262477 () Bool)

(assert (=> b!245348 m!262477))

(assert (=> b!245348 m!262477))

(declare-fun m!262479 () Bool)

(assert (=> b!245348 m!262479))

(assert (=> b!245350 m!262477))

(assert (=> b!245350 m!262477))

(assert (=> b!245350 m!262479))

(assert (=> b!245150 d!60055))

(declare-fun b!245393 () Bool)

(declare-fun e!159207 () ListLongMap!3657)

(declare-fun e!159204 () ListLongMap!3657)

(assert (=> b!245393 (= e!159207 e!159204)))

(declare-fun c!40985 () Bool)

(assert (=> b!245393 (= c!40985 (and (not (= (bvand (extraKeys!4276 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4276 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!245394 () Bool)

(declare-fun e!159209 () Bool)

(declare-fun e!159202 () Bool)

(assert (=> b!245394 (= e!159209 e!159202)))

(declare-fun res!120332 () Bool)

(assert (=> b!245394 (=> (not res!120332) (not e!159202))))

(declare-fun lt!122801 () ListLongMap!3657)

(assert (=> b!245394 (= res!120332 (contains!1757 lt!122801 (select (arr!5752 (_keys!6652 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!245394 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6095 (_keys!6652 thiss!1504))))))

(declare-fun b!245395 () Bool)

(declare-fun e!159203 () Bool)

(declare-fun call!22909 () Bool)

(assert (=> b!245395 (= e!159203 (not call!22909))))

(declare-fun bm!22900 () Bool)

(declare-fun call!22908 () Bool)

(assert (=> bm!22900 (= call!22908 (contains!1757 lt!122801 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!245396 () Bool)

(declare-fun call!22906 () ListLongMap!3657)

(assert (=> b!245396 (= e!159204 call!22906)))

(declare-fun bm!22901 () Bool)

(assert (=> bm!22901 (= call!22909 (contains!1757 lt!122801 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!40988 () Bool)

(declare-fun call!22903 () ListLongMap!3657)

(declare-fun bm!22902 () Bool)

(declare-fun call!22907 () ListLongMap!3657)

(declare-fun call!22905 () ListLongMap!3657)

(declare-fun call!22904 () ListLongMap!3657)

(declare-fun +!663 (ListLongMap!3657 tuple2!4754) ListLongMap!3657)

(assert (=> bm!22902 (= call!22904 (+!663 (ite c!40988 call!22905 (ite c!40985 call!22903 call!22907)) (ite (or c!40988 c!40985) (tuple2!4755 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4380 thiss!1504)) (tuple2!4755 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4380 thiss!1504)))))))

(declare-fun b!245397 () Bool)

(declare-fun e!159200 () Bool)

(declare-fun apply!230 (ListLongMap!3657 (_ BitVec 64)) V!8201)

(assert (=> b!245397 (= e!159200 (= (apply!230 lt!122801 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4380 thiss!1504)))))

(declare-fun b!245398 () Bool)

(declare-fun e!159211 () ListLongMap!3657)

(assert (=> b!245398 (= e!159211 call!22906)))

(declare-fun b!245399 () Bool)

(declare-fun e!159210 () Bool)

(assert (=> b!245399 (= e!159210 e!159203)))

(declare-fun c!40984 () Bool)

(assert (=> b!245399 (= c!40984 (not (= (bvand (extraKeys!4276 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!245400 () Bool)

(declare-fun res!120337 () Bool)

(assert (=> b!245400 (=> (not res!120337) (not e!159210))))

(declare-fun e!159205 () Bool)

(assert (=> b!245400 (= res!120337 e!159205)))

(declare-fun c!40987 () Bool)

(assert (=> b!245400 (= c!40987 (not (= (bvand (extraKeys!4276 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!245401 () Bool)

(declare-fun res!120336 () Bool)

(assert (=> b!245401 (=> (not res!120336) (not e!159210))))

(assert (=> b!245401 (= res!120336 e!159209)))

(declare-fun res!120339 () Bool)

(assert (=> b!245401 (=> res!120339 e!159209)))

(declare-fun e!159206 () Bool)

(assert (=> b!245401 (= res!120339 (not e!159206))))

(declare-fun res!120334 () Bool)

(assert (=> b!245401 (=> (not res!120334) (not e!159206))))

(assert (=> b!245401 (= res!120334 (bvslt #b00000000000000000000000000000000 (size!6095 (_keys!6652 thiss!1504))))))

(declare-fun bm!22903 () Bool)

(assert (=> bm!22903 (= call!22907 call!22903)))

(declare-fun b!245402 () Bool)

(assert (=> b!245402 (= e!159203 e!159200)))

(declare-fun res!120340 () Bool)

(assert (=> b!245402 (= res!120340 call!22909)))

(assert (=> b!245402 (=> (not res!120340) (not e!159200))))

(declare-fun b!245403 () Bool)

(declare-fun e!159201 () Bool)

(assert (=> b!245403 (= e!159201 (validKeyInArray!0 (select (arr!5752 (_keys!6652 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22904 () Bool)

(assert (=> bm!22904 (= call!22906 call!22904)))

(declare-fun b!245404 () Bool)

(declare-fun e!159208 () Unit!7566)

(declare-fun lt!122816 () Unit!7566)

(assert (=> b!245404 (= e!159208 lt!122816)))

(declare-fun lt!122796 () ListLongMap!3657)

(declare-fun getCurrentListMapNoExtraKeys!546 (array!12121 array!12119 (_ BitVec 32) (_ BitVec 32) V!8201 V!8201 (_ BitVec 32) Int) ListLongMap!3657)

(assert (=> b!245404 (= lt!122796 (getCurrentListMapNoExtraKeys!546 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)))))

(declare-fun lt!122795 () (_ BitVec 64))

(assert (=> b!245404 (= lt!122795 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122800 () (_ BitVec 64))

(assert (=> b!245404 (= lt!122800 (select (arr!5752 (_keys!6652 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122810 () Unit!7566)

(declare-fun addStillContains!206 (ListLongMap!3657 (_ BitVec 64) V!8201 (_ BitVec 64)) Unit!7566)

(assert (=> b!245404 (= lt!122810 (addStillContains!206 lt!122796 lt!122795 (zeroValue!4380 thiss!1504) lt!122800))))

(assert (=> b!245404 (contains!1757 (+!663 lt!122796 (tuple2!4755 lt!122795 (zeroValue!4380 thiss!1504))) lt!122800)))

(declare-fun lt!122805 () Unit!7566)

(assert (=> b!245404 (= lt!122805 lt!122810)))

(declare-fun lt!122813 () ListLongMap!3657)

(assert (=> b!245404 (= lt!122813 (getCurrentListMapNoExtraKeys!546 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)))))

(declare-fun lt!122802 () (_ BitVec 64))

(assert (=> b!245404 (= lt!122802 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122803 () (_ BitVec 64))

(assert (=> b!245404 (= lt!122803 (select (arr!5752 (_keys!6652 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122798 () Unit!7566)

(declare-fun addApplyDifferent!206 (ListLongMap!3657 (_ BitVec 64) V!8201 (_ BitVec 64)) Unit!7566)

(assert (=> b!245404 (= lt!122798 (addApplyDifferent!206 lt!122813 lt!122802 (minValue!4380 thiss!1504) lt!122803))))

(assert (=> b!245404 (= (apply!230 (+!663 lt!122813 (tuple2!4755 lt!122802 (minValue!4380 thiss!1504))) lt!122803) (apply!230 lt!122813 lt!122803))))

(declare-fun lt!122799 () Unit!7566)

(assert (=> b!245404 (= lt!122799 lt!122798)))

(declare-fun lt!122815 () ListLongMap!3657)

(assert (=> b!245404 (= lt!122815 (getCurrentListMapNoExtraKeys!546 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)))))

(declare-fun lt!122814 () (_ BitVec 64))

(assert (=> b!245404 (= lt!122814 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122811 () (_ BitVec 64))

(assert (=> b!245404 (= lt!122811 (select (arr!5752 (_keys!6652 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122804 () Unit!7566)

(assert (=> b!245404 (= lt!122804 (addApplyDifferent!206 lt!122815 lt!122814 (zeroValue!4380 thiss!1504) lt!122811))))

(assert (=> b!245404 (= (apply!230 (+!663 lt!122815 (tuple2!4755 lt!122814 (zeroValue!4380 thiss!1504))) lt!122811) (apply!230 lt!122815 lt!122811))))

(declare-fun lt!122809 () Unit!7566)

(assert (=> b!245404 (= lt!122809 lt!122804)))

(declare-fun lt!122807 () ListLongMap!3657)

(assert (=> b!245404 (= lt!122807 (getCurrentListMapNoExtraKeys!546 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)))))

(declare-fun lt!122806 () (_ BitVec 64))

(assert (=> b!245404 (= lt!122806 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122808 () (_ BitVec 64))

(assert (=> b!245404 (= lt!122808 (select (arr!5752 (_keys!6652 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245404 (= lt!122816 (addApplyDifferent!206 lt!122807 lt!122806 (minValue!4380 thiss!1504) lt!122808))))

(assert (=> b!245404 (= (apply!230 (+!663 lt!122807 (tuple2!4755 lt!122806 (minValue!4380 thiss!1504))) lt!122808) (apply!230 lt!122807 lt!122808))))

(declare-fun b!245405 () Bool)

(assert (=> b!245405 (= e!159211 call!22907)))

(declare-fun b!245406 () Bool)

(declare-fun e!159199 () Bool)

(assert (=> b!245406 (= e!159199 (= (apply!230 lt!122801 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4380 thiss!1504)))))

(declare-fun b!245407 () Bool)

(assert (=> b!245407 (= e!159205 (not call!22908))))

(declare-fun b!245408 () Bool)

(declare-fun c!40989 () Bool)

(assert (=> b!245408 (= c!40989 (and (not (= (bvand (extraKeys!4276 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4276 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!245408 (= e!159204 e!159211)))

(declare-fun b!245409 () Bool)

(assert (=> b!245409 (= e!159207 (+!663 call!22904 (tuple2!4755 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4380 thiss!1504))))))

(declare-fun b!245410 () Bool)

(declare-fun Unit!7575 () Unit!7566)

(assert (=> b!245410 (= e!159208 Unit!7575)))

(declare-fun b!245411 () Bool)

(assert (=> b!245411 (= e!159206 (validKeyInArray!0 (select (arr!5752 (_keys!6652 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22905 () Bool)

(assert (=> bm!22905 (= call!22905 (getCurrentListMapNoExtraKeys!546 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)))))

(declare-fun b!245412 () Bool)

(assert (=> b!245412 (= e!159205 e!159199)))

(declare-fun res!120333 () Bool)

(assert (=> b!245412 (= res!120333 call!22908)))

(assert (=> b!245412 (=> (not res!120333) (not e!159199))))

(declare-fun bm!22906 () Bool)

(assert (=> bm!22906 (= call!22903 call!22905)))

(declare-fun b!245413 () Bool)

(declare-fun get!2948 (ValueCell!2864 V!8201) V!8201)

(declare-fun dynLambda!564 (Int (_ BitVec 64)) V!8201)

(assert (=> b!245413 (= e!159202 (= (apply!230 lt!122801 (select (arr!5752 (_keys!6652 thiss!1504)) #b00000000000000000000000000000000)) (get!2948 (select (arr!5751 (_values!4522 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!564 (defaultEntry!4539 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245413 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6094 (_values!4522 thiss!1504))))))

(assert (=> b!245413 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6095 (_keys!6652 thiss!1504))))))

(declare-fun d!60057 () Bool)

(assert (=> d!60057 e!159210))

(declare-fun res!120338 () Bool)

(assert (=> d!60057 (=> (not res!120338) (not e!159210))))

(assert (=> d!60057 (= res!120338 (or (bvsge #b00000000000000000000000000000000 (size!6095 (_keys!6652 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6095 (_keys!6652 thiss!1504))))))))

(declare-fun lt!122797 () ListLongMap!3657)

(assert (=> d!60057 (= lt!122801 lt!122797)))

(declare-fun lt!122812 () Unit!7566)

(assert (=> d!60057 (= lt!122812 e!159208)))

(declare-fun c!40986 () Bool)

(assert (=> d!60057 (= c!40986 e!159201)))

(declare-fun res!120335 () Bool)

(assert (=> d!60057 (=> (not res!120335) (not e!159201))))

(assert (=> d!60057 (= res!120335 (bvslt #b00000000000000000000000000000000 (size!6095 (_keys!6652 thiss!1504))))))

(assert (=> d!60057 (= lt!122797 e!159207)))

(assert (=> d!60057 (= c!40988 (and (not (= (bvand (extraKeys!4276 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4276 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60057 (validMask!0 (mask!10647 thiss!1504))))

(assert (=> d!60057 (= (getCurrentListMap!1353 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4539 thiss!1504)) lt!122801)))

(assert (= (and d!60057 c!40988) b!245409))

(assert (= (and d!60057 (not c!40988)) b!245393))

(assert (= (and b!245393 c!40985) b!245396))

(assert (= (and b!245393 (not c!40985)) b!245408))

(assert (= (and b!245408 c!40989) b!245398))

(assert (= (and b!245408 (not c!40989)) b!245405))

(assert (= (or b!245398 b!245405) bm!22903))

(assert (= (or b!245396 bm!22903) bm!22906))

(assert (= (or b!245396 b!245398) bm!22904))

(assert (= (or b!245409 bm!22906) bm!22905))

(assert (= (or b!245409 bm!22904) bm!22902))

(assert (= (and d!60057 res!120335) b!245403))

(assert (= (and d!60057 c!40986) b!245404))

(assert (= (and d!60057 (not c!40986)) b!245410))

(assert (= (and d!60057 res!120338) b!245401))

(assert (= (and b!245401 res!120334) b!245411))

(assert (= (and b!245401 (not res!120339)) b!245394))

(assert (= (and b!245394 res!120332) b!245413))

(assert (= (and b!245401 res!120336) b!245400))

(assert (= (and b!245400 c!40987) b!245412))

(assert (= (and b!245400 (not c!40987)) b!245407))

(assert (= (and b!245412 res!120333) b!245406))

(assert (= (or b!245412 b!245407) bm!22900))

(assert (= (and b!245400 res!120337) b!245399))

(assert (= (and b!245399 c!40984) b!245402))

(assert (= (and b!245399 (not c!40984)) b!245395))

(assert (= (and b!245402 res!120340) b!245397))

(assert (= (or b!245402 b!245395) bm!22901))

(declare-fun b_lambda!8005 () Bool)

(assert (=> (not b_lambda!8005) (not b!245413)))

(declare-fun t!8666 () Bool)

(declare-fun tb!2965 () Bool)

(assert (=> (and b!245138 (= (defaultEntry!4539 thiss!1504) (defaultEntry!4539 thiss!1504)) t!8666) tb!2965))

(declare-fun result!5233 () Bool)

(assert (=> tb!2965 (= result!5233 tp_is_empty!6415)))

(assert (=> b!245413 t!8666))

(declare-fun b_and!13521 () Bool)

(assert (= b_and!13515 (and (=> t!8666 result!5233) b_and!13521)))

(declare-fun m!262481 () Bool)

(assert (=> bm!22905 m!262481))

(assert (=> b!245394 m!262443))

(assert (=> b!245394 m!262443))

(declare-fun m!262483 () Bool)

(assert (=> b!245394 m!262483))

(assert (=> d!60057 m!262301))

(declare-fun m!262485 () Bool)

(assert (=> b!245409 m!262485))

(declare-fun m!262487 () Bool)

(assert (=> b!245413 m!262487))

(declare-fun m!262489 () Bool)

(assert (=> b!245413 m!262489))

(assert (=> b!245413 m!262487))

(declare-fun m!262491 () Bool)

(assert (=> b!245413 m!262491))

(assert (=> b!245413 m!262443))

(assert (=> b!245413 m!262443))

(declare-fun m!262493 () Bool)

(assert (=> b!245413 m!262493))

(assert (=> b!245413 m!262489))

(declare-fun m!262495 () Bool)

(assert (=> bm!22901 m!262495))

(declare-fun m!262497 () Bool)

(assert (=> b!245406 m!262497))

(declare-fun m!262499 () Bool)

(assert (=> bm!22900 m!262499))

(declare-fun m!262501 () Bool)

(assert (=> b!245404 m!262501))

(declare-fun m!262503 () Bool)

(assert (=> b!245404 m!262503))

(declare-fun m!262505 () Bool)

(assert (=> b!245404 m!262505))

(declare-fun m!262507 () Bool)

(assert (=> b!245404 m!262507))

(declare-fun m!262509 () Bool)

(assert (=> b!245404 m!262509))

(declare-fun m!262511 () Bool)

(assert (=> b!245404 m!262511))

(declare-fun m!262513 () Bool)

(assert (=> b!245404 m!262513))

(declare-fun m!262515 () Bool)

(assert (=> b!245404 m!262515))

(assert (=> b!245404 m!262443))

(assert (=> b!245404 m!262515))

(declare-fun m!262517 () Bool)

(assert (=> b!245404 m!262517))

(declare-fun m!262519 () Bool)

(assert (=> b!245404 m!262519))

(declare-fun m!262521 () Bool)

(assert (=> b!245404 m!262521))

(assert (=> b!245404 m!262505))

(declare-fun m!262523 () Bool)

(assert (=> b!245404 m!262523))

(declare-fun m!262525 () Bool)

(assert (=> b!245404 m!262525))

(assert (=> b!245404 m!262481))

(declare-fun m!262527 () Bool)

(assert (=> b!245404 m!262527))

(declare-fun m!262529 () Bool)

(assert (=> b!245404 m!262529))

(assert (=> b!245404 m!262501))

(assert (=> b!245404 m!262511))

(assert (=> b!245403 m!262443))

(assert (=> b!245403 m!262443))

(assert (=> b!245403 m!262449))

(declare-fun m!262531 () Bool)

(assert (=> bm!22902 m!262531))

(declare-fun m!262533 () Bool)

(assert (=> b!245397 m!262533))

(assert (=> b!245411 m!262443))

(assert (=> b!245411 m!262443))

(assert (=> b!245411 m!262449))

(assert (=> b!245150 d!60057))

(declare-fun d!60059 () Bool)

(declare-fun res!120347 () Bool)

(declare-fun e!159214 () Bool)

(assert (=> d!60059 (=> (not res!120347) (not e!159214))))

(declare-fun simpleValid!253 (LongMapFixedSize!3628) Bool)

(assert (=> d!60059 (= res!120347 (simpleValid!253 thiss!1504))))

(assert (=> d!60059 (= (valid!1431 thiss!1504) e!159214)))

(declare-fun b!245422 () Bool)

(declare-fun res!120348 () Bool)

(assert (=> b!245422 (=> (not res!120348) (not e!159214))))

(assert (=> b!245422 (= res!120348 (= (arrayCountValidKeys!0 (_keys!6652 thiss!1504) #b00000000000000000000000000000000 (size!6095 (_keys!6652 thiss!1504))) (_size!1863 thiss!1504)))))

(declare-fun b!245423 () Bool)

(declare-fun res!120349 () Bool)

(assert (=> b!245423 (=> (not res!120349) (not e!159214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12121 (_ BitVec 32)) Bool)

(assert (=> b!245423 (= res!120349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6652 thiss!1504) (mask!10647 thiss!1504)))))

(declare-fun b!245424 () Bool)

(assert (=> b!245424 (= e!159214 (arrayNoDuplicates!0 (_keys!6652 thiss!1504) #b00000000000000000000000000000000 Nil!3654))))

(assert (= (and d!60059 res!120347) b!245422))

(assert (= (and b!245422 res!120348) b!245423))

(assert (= (and b!245423 res!120349) b!245424))

(declare-fun m!262535 () Bool)

(assert (=> d!60059 m!262535))

(assert (=> b!245422 m!262309))

(declare-fun m!262537 () Bool)

(assert (=> b!245423 m!262537))

(declare-fun m!262539 () Bool)

(assert (=> b!245424 m!262539))

(assert (=> start!23332 d!60059))

(declare-fun d!60061 () Bool)

(declare-fun e!159217 () Bool)

(assert (=> d!60061 e!159217))

(declare-fun res!120355 () Bool)

(assert (=> d!60061 (=> (not res!120355) (not e!159217))))

(declare-fun lt!122822 () SeekEntryResult!1086)

(assert (=> d!60061 (= res!120355 ((_ is Found!1086) lt!122822))))

(assert (=> d!60061 (= lt!122822 (seekEntryOrOpen!0 key!932 (_keys!6652 thiss!1504) (mask!10647 thiss!1504)))))

(declare-fun lt!122821 () Unit!7566)

(declare-fun choose!1154 (array!12121 array!12119 (_ BitVec 32) (_ BitVec 32) V!8201 V!8201 (_ BitVec 64) Int) Unit!7566)

(assert (=> d!60061 (= lt!122821 (choose!1154 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 (defaultEntry!4539 thiss!1504)))))

(assert (=> d!60061 (validMask!0 (mask!10647 thiss!1504))))

(assert (=> d!60061 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!376 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 (defaultEntry!4539 thiss!1504)) lt!122821)))

(declare-fun b!245429 () Bool)

(declare-fun res!120354 () Bool)

(assert (=> b!245429 (=> (not res!120354) (not e!159217))))

(assert (=> b!245429 (= res!120354 (inRange!0 (index!6515 lt!122822) (mask!10647 thiss!1504)))))

(declare-fun b!245430 () Bool)

(assert (=> b!245430 (= e!159217 (= (select (arr!5752 (_keys!6652 thiss!1504)) (index!6515 lt!122822)) key!932))))

(assert (=> b!245430 (and (bvsge (index!6515 lt!122822) #b00000000000000000000000000000000) (bvslt (index!6515 lt!122822) (size!6095 (_keys!6652 thiss!1504))))))

(assert (= (and d!60061 res!120355) b!245429))

(assert (= (and b!245429 res!120354) b!245430))

(assert (=> d!60061 m!262325))

(declare-fun m!262541 () Bool)

(assert (=> d!60061 m!262541))

(assert (=> d!60061 m!262301))

(declare-fun m!262543 () Bool)

(assert (=> b!245429 m!262543))

(declare-fun m!262545 () Bool)

(assert (=> b!245430 m!262545))

(assert (=> b!245135 d!60061))

(declare-fun b!245447 () Bool)

(declare-fun res!120364 () Bool)

(declare-fun e!159229 () Bool)

(assert (=> b!245447 (=> (not res!120364) (not e!159229))))

(declare-fun call!22915 () Bool)

(assert (=> b!245447 (= res!120364 call!22915)))

(declare-fun e!159227 () Bool)

(assert (=> b!245447 (= e!159227 e!159229)))

(declare-fun b!245448 () Bool)

(declare-fun e!159228 () Bool)

(assert (=> b!245448 (= e!159228 e!159227)))

(declare-fun c!40995 () Bool)

(declare-fun lt!122827 () SeekEntryResult!1086)

(assert (=> b!245448 (= c!40995 ((_ is MissingVacant!1086) lt!122827))))

(declare-fun d!60063 () Bool)

(assert (=> d!60063 e!159228))

(declare-fun c!40994 () Bool)

(assert (=> d!60063 (= c!40994 ((_ is MissingZero!1086) lt!122827))))

(assert (=> d!60063 (= lt!122827 (seekEntryOrOpen!0 key!932 (_keys!6652 thiss!1504) (mask!10647 thiss!1504)))))

(declare-fun lt!122828 () Unit!7566)

(declare-fun choose!1155 (array!12121 array!12119 (_ BitVec 32) (_ BitVec 32) V!8201 V!8201 (_ BitVec 64) Int) Unit!7566)

(assert (=> d!60063 (= lt!122828 (choose!1155 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 (defaultEntry!4539 thiss!1504)))))

(assert (=> d!60063 (validMask!0 (mask!10647 thiss!1504))))

(assert (=> d!60063 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!373 (_keys!6652 thiss!1504) (_values!4522 thiss!1504) (mask!10647 thiss!1504) (extraKeys!4276 thiss!1504) (zeroValue!4380 thiss!1504) (minValue!4380 thiss!1504) key!932 (defaultEntry!4539 thiss!1504)) lt!122828)))

(declare-fun b!245449 () Bool)

(declare-fun e!159226 () Bool)

(declare-fun call!22914 () Bool)

(assert (=> b!245449 (= e!159226 (not call!22914))))

(declare-fun b!245450 () Bool)

(assert (=> b!245450 (= e!159228 e!159226)))

(declare-fun res!120367 () Bool)

(assert (=> b!245450 (= res!120367 call!22915)))

(assert (=> b!245450 (=> (not res!120367) (not e!159226))))

(declare-fun b!245451 () Bool)

(assert (=> b!245451 (= e!159229 (not call!22914))))

(declare-fun b!245452 () Bool)

(declare-fun res!120365 () Bool)

(assert (=> b!245452 (=> (not res!120365) (not e!159229))))

(assert (=> b!245452 (= res!120365 (= (select (arr!5752 (_keys!6652 thiss!1504)) (index!6517 lt!122827)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245452 (and (bvsge (index!6517 lt!122827) #b00000000000000000000000000000000) (bvslt (index!6517 lt!122827) (size!6095 (_keys!6652 thiss!1504))))))

(declare-fun b!245453 () Bool)

(assert (=> b!245453 (= e!159227 ((_ is Undefined!1086) lt!122827))))

(declare-fun bm!22911 () Bool)

(assert (=> bm!22911 (= call!22915 (inRange!0 (ite c!40994 (index!6514 lt!122827) (index!6517 lt!122827)) (mask!10647 thiss!1504)))))

(declare-fun bm!22912 () Bool)

(assert (=> bm!22912 (= call!22914 (arrayContainsKey!0 (_keys!6652 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245454 () Bool)

(assert (=> b!245454 (and (bvsge (index!6514 lt!122827) #b00000000000000000000000000000000) (bvslt (index!6514 lt!122827) (size!6095 (_keys!6652 thiss!1504))))))

(declare-fun res!120366 () Bool)

(assert (=> b!245454 (= res!120366 (= (select (arr!5752 (_keys!6652 thiss!1504)) (index!6514 lt!122827)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245454 (=> (not res!120366) (not e!159226))))

(assert (= (and d!60063 c!40994) b!245450))

(assert (= (and d!60063 (not c!40994)) b!245448))

(assert (= (and b!245450 res!120367) b!245454))

(assert (= (and b!245454 res!120366) b!245449))

(assert (= (and b!245448 c!40995) b!245447))

(assert (= (and b!245448 (not c!40995)) b!245453))

(assert (= (and b!245447 res!120364) b!245452))

(assert (= (and b!245452 res!120365) b!245451))

(assert (= (or b!245450 b!245447) bm!22911))

(assert (= (or b!245449 b!245451) bm!22912))

(declare-fun m!262547 () Bool)

(assert (=> b!245454 m!262547))

(declare-fun m!262549 () Bool)

(assert (=> b!245452 m!262549))

(declare-fun m!262551 () Bool)

(assert (=> bm!22911 m!262551))

(assert (=> d!60063 m!262325))

(declare-fun m!262553 () Bool)

(assert (=> d!60063 m!262553))

(assert (=> d!60063 m!262301))

(assert (=> bm!22912 m!262313))

(assert (=> b!245141 d!60063))

(declare-fun d!60065 () Bool)

(assert (=> d!60065 (= (array_inv!3795 (_keys!6652 thiss!1504)) (bvsge (size!6095 (_keys!6652 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245138 d!60065))

(declare-fun d!60067 () Bool)

(assert (=> d!60067 (= (array_inv!3796 (_values!4522 thiss!1504)) (bvsge (size!6094 (_values!4522 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245138 d!60067))

(declare-fun mapNonEmpty!10891 () Bool)

(declare-fun mapRes!10891 () Bool)

(declare-fun tp!22906 () Bool)

(declare-fun e!159234 () Bool)

(assert (=> mapNonEmpty!10891 (= mapRes!10891 (and tp!22906 e!159234))))

(declare-fun mapRest!10891 () (Array (_ BitVec 32) ValueCell!2864))

(declare-fun mapKey!10891 () (_ BitVec 32))

(declare-fun mapValue!10891 () ValueCell!2864)

(assert (=> mapNonEmpty!10891 (= mapRest!10882 (store mapRest!10891 mapKey!10891 mapValue!10891))))

(declare-fun condMapEmpty!10891 () Bool)

(declare-fun mapDefault!10891 () ValueCell!2864)

(assert (=> mapNonEmpty!10882 (= condMapEmpty!10891 (= mapRest!10882 ((as const (Array (_ BitVec 32) ValueCell!2864)) mapDefault!10891)))))

(declare-fun e!159235 () Bool)

(assert (=> mapNonEmpty!10882 (= tp!22891 (and e!159235 mapRes!10891))))

(declare-fun b!245462 () Bool)

(assert (=> b!245462 (= e!159235 tp_is_empty!6415)))

(declare-fun mapIsEmpty!10891 () Bool)

(assert (=> mapIsEmpty!10891 mapRes!10891))

(declare-fun b!245461 () Bool)

(assert (=> b!245461 (= e!159234 tp_is_empty!6415)))

(assert (= (and mapNonEmpty!10882 condMapEmpty!10891) mapIsEmpty!10891))

(assert (= (and mapNonEmpty!10882 (not condMapEmpty!10891)) mapNonEmpty!10891))

(assert (= (and mapNonEmpty!10891 ((_ is ValueCellFull!2864) mapValue!10891)) b!245461))

(assert (= (and mapNonEmpty!10882 ((_ is ValueCellFull!2864) mapDefault!10891)) b!245462))

(declare-fun m!262555 () Bool)

(assert (=> mapNonEmpty!10891 m!262555))

(declare-fun b_lambda!8007 () Bool)

(assert (= b_lambda!8005 (or (and b!245138 b_free!6553) b_lambda!8007)))

(check-sat (not d!60059) (not b!245423) b_and!13521 (not d!60035) (not b!245429) (not bm!22902) (not d!60049) (not b!245282) (not bm!22900) (not b!245304) (not bm!22911) (not b!245296) (not d!60051) (not bm!22912) (not b!245350) (not b!245406) (not b!245411) (not bm!22905) (not b!245286) (not bm!22901) (not b!245283) (not b!245403) (not bm!22885) (not b_lambda!8007) (not b!245323) (not b!245394) (not b!245404) (not b!245295) (not b!245409) (not b_next!6553) (not b!245397) (not b!245298) (not b!245314) (not bm!22884) (not d!60061) (not d!60045) (not b!245413) (not b!245424) (not b!245348) (not d!60063) (not mapNonEmpty!10891) (not d!60055) (not b!245318) (not bm!22881) (not d!60057) (not b!245336) tp_is_empty!6415 (not b!245422))
(check-sat b_and!13521 (not b_next!6553))
