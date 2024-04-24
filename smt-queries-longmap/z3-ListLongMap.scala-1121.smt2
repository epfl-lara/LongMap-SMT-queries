; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22976 () Bool)

(assert start!22976)

(declare-fun b!240788 () Bool)

(declare-fun b_free!6475 () Bool)

(declare-fun b_next!6475 () Bool)

(assert (=> b!240788 (= b_free!6475 (not b_next!6475))))

(declare-fun tp!22629 () Bool)

(declare-fun b_and!13455 () Bool)

(assert (=> b!240788 (= tp!22629 b_and!13455)))

(declare-fun b!240773 () Bool)

(declare-datatypes ((Unit!7382 0))(
  ( (Unit!7383) )
))
(declare-fun e!156255 () Unit!7382)

(declare-fun lt!121098 () Unit!7382)

(assert (=> b!240773 (= e!156255 lt!121098)))

(declare-datatypes ((V!8097 0))(
  ( (V!8098 (val!3213 Int)) )
))
(declare-datatypes ((ValueCell!2825 0))(
  ( (ValueCellFull!2825 (v!5252 V!8097)) (EmptyCell!2825) )
))
(declare-datatypes ((array!11951 0))(
  ( (array!11952 (arr!5677 (Array (_ BitVec 32) ValueCell!2825)) (size!6018 (_ BitVec 32))) )
))
(declare-datatypes ((array!11953 0))(
  ( (array!11954 (arr!5678 (Array (_ BitVec 32) (_ BitVec 64))) (size!6019 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3550 0))(
  ( (LongMapFixedSize!3551 (defaultEntry!4460 Int) (mask!10520 (_ BitVec 32)) (extraKeys!4197 (_ BitVec 32)) (zeroValue!4301 V!8097) (minValue!4301 V!8097) (_size!1824 (_ BitVec 32)) (_keys!6562 array!11953) (_values!4443 array!11951) (_vacant!1824 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3550)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!337 (array!11953 array!11951 (_ BitVec 32) (_ BitVec 32) V!8097 V!8097 (_ BitVec 64) Int) Unit!7382)

(assert (=> b!240773 (= lt!121098 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!337 (_keys!6562 thiss!1504) (_values!4443 thiss!1504) (mask!10520 thiss!1504) (extraKeys!4197 thiss!1504) (zeroValue!4301 thiss!1504) (minValue!4301 thiss!1504) key!932 (defaultEntry!4460 thiss!1504)))))

(declare-fun c!40104 () Bool)

(declare-datatypes ((SeekEntryResult!1017 0))(
  ( (MissingZero!1017 (index!6238 (_ BitVec 32))) (Found!1017 (index!6239 (_ BitVec 32))) (Intermediate!1017 (undefined!1829 Bool) (index!6240 (_ BitVec 32)) (x!24145 (_ BitVec 32))) (Undefined!1017) (MissingVacant!1017 (index!6241 (_ BitVec 32))) )
))
(declare-fun lt!121103 () SeekEntryResult!1017)

(get-info :version)

(assert (=> b!240773 (= c!40104 ((_ is MissingZero!1017) lt!121103))))

(declare-fun e!156254 () Bool)

(assert (=> b!240773 e!156254))

(declare-fun b!240774 () Bool)

(declare-fun e!156257 () Bool)

(declare-fun e!156264 () Bool)

(assert (=> b!240774 (= e!156257 e!156264)))

(declare-fun res!118071 () Bool)

(assert (=> b!240774 (=> (not res!118071) (not e!156264))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!240774 (= res!118071 (inRange!0 index!297 (mask!10520 thiss!1504)))))

(declare-fun lt!121100 () Unit!7382)

(assert (=> b!240774 (= lt!121100 e!156255)))

(declare-fun c!40102 () Bool)

(declare-fun lt!121101 () Bool)

(assert (=> b!240774 (= c!40102 lt!121101)))

(declare-datatypes ((tuple2!4660 0))(
  ( (tuple2!4661 (_1!2341 (_ BitVec 64)) (_2!2341 V!8097)) )
))
(declare-datatypes ((List!3538 0))(
  ( (Nil!3535) (Cons!3534 (h!4190 tuple2!4660) (t!8525 List!3538)) )
))
(declare-datatypes ((ListLongMap!3575 0))(
  ( (ListLongMap!3576 (toList!1803 List!3538)) )
))
(declare-fun contains!1705 (ListLongMap!3575 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1335 (array!11953 array!11951 (_ BitVec 32) (_ BitVec 32) V!8097 V!8097 (_ BitVec 32) Int) ListLongMap!3575)

(assert (=> b!240774 (= lt!121101 (contains!1705 (getCurrentListMap!1335 (_keys!6562 thiss!1504) (_values!4443 thiss!1504) (mask!10520 thiss!1504) (extraKeys!4197 thiss!1504) (zeroValue!4301 thiss!1504) (minValue!4301 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4460 thiss!1504)) key!932))))

(declare-fun call!22374 () Bool)

(declare-fun bm!22370 () Bool)

(assert (=> bm!22370 (= call!22374 (inRange!0 (ite c!40104 (index!6238 lt!121103) (index!6241 lt!121103)) (mask!10520 thiss!1504)))))

(declare-fun b!240775 () Bool)

(declare-fun e!156260 () Bool)

(declare-fun e!156263 () Bool)

(assert (=> b!240775 (= e!156260 e!156263)))

(declare-fun res!118069 () Bool)

(assert (=> b!240775 (= res!118069 call!22374)))

(assert (=> b!240775 (=> (not res!118069) (not e!156263))))

(declare-fun b!240776 () Bool)

(declare-fun e!156256 () Bool)

(declare-fun tp_is_empty!6337 () Bool)

(assert (=> b!240776 (= e!156256 tp_is_empty!6337)))

(declare-fun b!240777 () Bool)

(declare-fun e!156258 () Bool)

(declare-fun mapRes!10737 () Bool)

(assert (=> b!240777 (= e!156258 (and e!156256 mapRes!10737))))

(declare-fun condMapEmpty!10737 () Bool)

(declare-fun mapDefault!10737 () ValueCell!2825)

(assert (=> b!240777 (= condMapEmpty!10737 (= (arr!5677 (_values!4443 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2825)) mapDefault!10737)))))

(declare-fun b!240778 () Bool)

(declare-fun e!156253 () Bool)

(declare-fun call!22373 () Bool)

(assert (=> b!240778 (= e!156253 (not call!22373))))

(declare-fun b!240779 () Bool)

(declare-fun res!118066 () Bool)

(assert (=> b!240779 (=> (not res!118066) (not e!156264))))

(declare-fun arrayContainsKey!0 (array!11953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!240779 (= res!118066 (arrayContainsKey!0 (_keys!6562 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240780 () Bool)

(declare-fun Unit!7384 () Unit!7382)

(assert (=> b!240780 (= e!156255 Unit!7384)))

(declare-fun lt!121099 () Unit!7382)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!344 (array!11953 array!11951 (_ BitVec 32) (_ BitVec 32) V!8097 V!8097 (_ BitVec 64) Int) Unit!7382)

(assert (=> b!240780 (= lt!121099 (lemmaInListMapThenSeekEntryOrOpenFindsIt!344 (_keys!6562 thiss!1504) (_values!4443 thiss!1504) (mask!10520 thiss!1504) (extraKeys!4197 thiss!1504) (zeroValue!4301 thiss!1504) (minValue!4301 thiss!1504) key!932 (defaultEntry!4460 thiss!1504)))))

(assert (=> b!240780 false))

(declare-fun b!240781 () Bool)

(declare-fun res!118067 () Bool)

(declare-fun e!156261 () Bool)

(assert (=> b!240781 (=> (not res!118067) (not e!156261))))

(assert (=> b!240781 (= res!118067 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!240782 () Bool)

(declare-fun e!156252 () Bool)

(assert (=> b!240782 (= e!156252 tp_is_empty!6337)))

(declare-fun b!240783 () Bool)

(declare-fun res!118070 () Bool)

(assert (=> b!240783 (=> (not res!118070) (not e!156253))))

(assert (=> b!240783 (= res!118070 (= (select (arr!5678 (_keys!6562 thiss!1504)) (index!6238 lt!121103)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240784 () Bool)

(assert (=> b!240784 (= e!156260 ((_ is Undefined!1017) lt!121103))))

(declare-fun b!240785 () Bool)

(assert (=> b!240785 (= e!156261 e!156257)))

(declare-fun res!118073 () Bool)

(assert (=> b!240785 (=> (not res!118073) (not e!156257))))

(assert (=> b!240785 (= res!118073 (or (= lt!121103 (MissingZero!1017 index!297)) (= lt!121103 (MissingVacant!1017 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11953 (_ BitVec 32)) SeekEntryResult!1017)

(assert (=> b!240785 (= lt!121103 (seekEntryOrOpen!0 key!932 (_keys!6562 thiss!1504) (mask!10520 thiss!1504)))))

(declare-fun b!240786 () Bool)

(assert (=> b!240786 (= e!156263 (not call!22373))))

(declare-fun bm!22371 () Bool)

(assert (=> bm!22371 (= call!22373 (arrayContainsKey!0 (_keys!6562 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240787 () Bool)

(declare-fun c!40103 () Bool)

(assert (=> b!240787 (= c!40103 ((_ is MissingVacant!1017) lt!121103))))

(assert (=> b!240787 (= e!156254 e!156260)))

(declare-fun e!156262 () Bool)

(declare-fun array_inv!3727 (array!11953) Bool)

(declare-fun array_inv!3728 (array!11951) Bool)

(assert (=> b!240788 (= e!156262 (and tp!22629 tp_is_empty!6337 (array_inv!3727 (_keys!6562 thiss!1504)) (array_inv!3728 (_values!4443 thiss!1504)) e!156258))))

(declare-fun b!240789 () Bool)

(declare-fun res!118068 () Bool)

(assert (=> b!240789 (=> (not res!118068) (not e!156253))))

(assert (=> b!240789 (= res!118068 call!22374)))

(assert (=> b!240789 (= e!156254 e!156253)))

(declare-fun b!240790 () Bool)

(assert (=> b!240790 (= e!156264 (not false))))

(assert (=> b!240790 lt!121101))

(declare-fun lt!121102 () Unit!7382)

(declare-fun lemmaArrayContainsKeyThenInListMap!157 (array!11953 array!11951 (_ BitVec 32) (_ BitVec 32) V!8097 V!8097 (_ BitVec 64) (_ BitVec 32) Int) Unit!7382)

(assert (=> b!240790 (= lt!121102 (lemmaArrayContainsKeyThenInListMap!157 (_keys!6562 thiss!1504) (_values!4443 thiss!1504) (mask!10520 thiss!1504) (extraKeys!4197 thiss!1504) (zeroValue!4301 thiss!1504) (minValue!4301 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4460 thiss!1504)))))

(declare-fun mapNonEmpty!10737 () Bool)

(declare-fun tp!22628 () Bool)

(assert (=> mapNonEmpty!10737 (= mapRes!10737 (and tp!22628 e!156252))))

(declare-fun mapRest!10737 () (Array (_ BitVec 32) ValueCell!2825))

(declare-fun mapKey!10737 () (_ BitVec 32))

(declare-fun mapValue!10737 () ValueCell!2825)

(assert (=> mapNonEmpty!10737 (= (arr!5677 (_values!4443 thiss!1504)) (store mapRest!10737 mapKey!10737 mapValue!10737))))

(declare-fun res!118072 () Bool)

(assert (=> start!22976 (=> (not res!118072) (not e!156261))))

(declare-fun valid!1408 (LongMapFixedSize!3550) Bool)

(assert (=> start!22976 (= res!118072 (valid!1408 thiss!1504))))

(assert (=> start!22976 e!156261))

(assert (=> start!22976 e!156262))

(assert (=> start!22976 true))

(declare-fun b!240791 () Bool)

(declare-fun res!118065 () Bool)

(assert (=> b!240791 (= res!118065 (= (select (arr!5678 (_keys!6562 thiss!1504)) (index!6241 lt!121103)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240791 (=> (not res!118065) (not e!156263))))

(declare-fun mapIsEmpty!10737 () Bool)

(assert (=> mapIsEmpty!10737 mapRes!10737))

(assert (= (and start!22976 res!118072) b!240781))

(assert (= (and b!240781 res!118067) b!240785))

(assert (= (and b!240785 res!118073) b!240774))

(assert (= (and b!240774 c!40102) b!240780))

(assert (= (and b!240774 (not c!40102)) b!240773))

(assert (= (and b!240773 c!40104) b!240789))

(assert (= (and b!240773 (not c!40104)) b!240787))

(assert (= (and b!240789 res!118068) b!240783))

(assert (= (and b!240783 res!118070) b!240778))

(assert (= (and b!240787 c!40103) b!240775))

(assert (= (and b!240787 (not c!40103)) b!240784))

(assert (= (and b!240775 res!118069) b!240791))

(assert (= (and b!240791 res!118065) b!240786))

(assert (= (or b!240789 b!240775) bm!22370))

(assert (= (or b!240778 b!240786) bm!22371))

(assert (= (and b!240774 res!118071) b!240779))

(assert (= (and b!240779 res!118066) b!240790))

(assert (= (and b!240777 condMapEmpty!10737) mapIsEmpty!10737))

(assert (= (and b!240777 (not condMapEmpty!10737)) mapNonEmpty!10737))

(assert (= (and mapNonEmpty!10737 ((_ is ValueCellFull!2825) mapValue!10737)) b!240782))

(assert (= (and b!240777 ((_ is ValueCellFull!2825) mapDefault!10737)) b!240776))

(assert (= b!240788 b!240777))

(assert (= start!22976 b!240788))

(declare-fun m!260347 () Bool)

(assert (=> bm!22371 m!260347))

(declare-fun m!260349 () Bool)

(assert (=> b!240790 m!260349))

(declare-fun m!260351 () Bool)

(assert (=> b!240785 m!260351))

(declare-fun m!260353 () Bool)

(assert (=> b!240783 m!260353))

(declare-fun m!260355 () Bool)

(assert (=> mapNonEmpty!10737 m!260355))

(declare-fun m!260357 () Bool)

(assert (=> b!240773 m!260357))

(declare-fun m!260359 () Bool)

(assert (=> bm!22370 m!260359))

(declare-fun m!260361 () Bool)

(assert (=> start!22976 m!260361))

(declare-fun m!260363 () Bool)

(assert (=> b!240780 m!260363))

(declare-fun m!260365 () Bool)

(assert (=> b!240774 m!260365))

(declare-fun m!260367 () Bool)

(assert (=> b!240774 m!260367))

(assert (=> b!240774 m!260367))

(declare-fun m!260369 () Bool)

(assert (=> b!240774 m!260369))

(declare-fun m!260371 () Bool)

(assert (=> b!240788 m!260371))

(declare-fun m!260373 () Bool)

(assert (=> b!240788 m!260373))

(declare-fun m!260375 () Bool)

(assert (=> b!240791 m!260375))

(assert (=> b!240779 m!260347))

(check-sat (not bm!22370) (not b_next!6475) (not b!240780) (not start!22976) (not b!240790) (not b!240774) (not b!240773) (not b!240779) (not bm!22371) (not b!240785) (not b!240788) tp_is_empty!6337 (not mapNonEmpty!10737) b_and!13455)
(check-sat b_and!13455 (not b_next!6475))
