; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22004 () Bool)

(assert start!22004)

(declare-fun b!226225 () Bool)

(declare-fun b_free!6067 () Bool)

(declare-fun b_next!6067 () Bool)

(assert (=> b!226225 (= b_free!6067 (not b_next!6067))))

(declare-fun tp!21343 () Bool)

(declare-fun b_and!12979 () Bool)

(assert (=> b!226225 (= tp!21343 b_and!12979)))

(declare-fun b!226224 () Bool)

(declare-fun res!111355 () Bool)

(declare-fun e!146797 () Bool)

(assert (=> b!226224 (=> res!111355 e!146797)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!226224 (= res!111355 (not (validKeyInArray!0 key!932)))))

(declare-fun e!146792 () Bool)

(declare-fun e!146786 () Bool)

(declare-fun tp_is_empty!5929 () Bool)

(declare-datatypes ((V!7553 0))(
  ( (V!7554 (val!3009 Int)) )
))
(declare-datatypes ((ValueCell!2621 0))(
  ( (ValueCellFull!2621 (v!5030 V!7553)) (EmptyCell!2621) )
))
(declare-datatypes ((array!11099 0))(
  ( (array!11100 (arr!5269 (Array (_ BitVec 32) ValueCell!2621)) (size!5602 (_ BitVec 32))) )
))
(declare-datatypes ((array!11101 0))(
  ( (array!11102 (arr!5270 (Array (_ BitVec 32) (_ BitVec 64))) (size!5603 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3142 0))(
  ( (LongMapFixedSize!3143 (defaultEntry!4230 Int) (mask!10080 (_ BitVec 32)) (extraKeys!3967 (_ BitVec 32)) (zeroValue!4071 V!7553) (minValue!4071 V!7553) (_size!1620 (_ BitVec 32)) (_keys!6284 array!11101) (_values!4213 array!11099) (_vacant!1620 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3142)

(declare-fun array_inv!3461 (array!11101) Bool)

(declare-fun array_inv!3462 (array!11099) Bool)

(assert (=> b!226225 (= e!146792 (and tp!21343 tp_is_empty!5929 (array_inv!3461 (_keys!6284 thiss!1504)) (array_inv!3462 (_values!4213 thiss!1504)) e!146786))))

(declare-fun b!226226 () Bool)

(declare-datatypes ((Unit!6808 0))(
  ( (Unit!6809) )
))
(declare-fun e!146791 () Unit!6808)

(declare-fun lt!113934 () Unit!6808)

(assert (=> b!226226 (= e!146791 lt!113934)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!244 (array!11101 array!11099 (_ BitVec 32) (_ BitVec 32) V!7553 V!7553 (_ BitVec 64) Int) Unit!6808)

(assert (=> b!226226 (= lt!113934 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!244 (_keys!6284 thiss!1504) (_values!4213 thiss!1504) (mask!10080 thiss!1504) (extraKeys!3967 thiss!1504) (zeroValue!4071 thiss!1504) (minValue!4071 thiss!1504) key!932 (defaultEntry!4230 thiss!1504)))))

(declare-fun c!37512 () Bool)

(declare-datatypes ((SeekEntryResult!850 0))(
  ( (MissingZero!850 (index!5570 (_ BitVec 32))) (Found!850 (index!5571 (_ BitVec 32))) (Intermediate!850 (undefined!1662 Bool) (index!5572 (_ BitVec 32)) (x!23190 (_ BitVec 32))) (Undefined!850) (MissingVacant!850 (index!5573 (_ BitVec 32))) )
))
(declare-fun lt!113933 () SeekEntryResult!850)

(get-info :version)

(assert (=> b!226226 (= c!37512 ((_ is MissingZero!850) lt!113933))))

(declare-fun e!146785 () Bool)

(assert (=> b!226226 e!146785))

(declare-fun b!226227 () Bool)

(declare-fun res!111356 () Bool)

(declare-fun e!146784 () Bool)

(assert (=> b!226227 (=> (not res!111356) (not e!146784))))

(declare-fun call!21023 () Bool)

(assert (=> b!226227 (= res!111356 call!21023)))

(assert (=> b!226227 (= e!146785 e!146784)))

(declare-fun mapIsEmpty!10063 () Bool)

(declare-fun mapRes!10063 () Bool)

(assert (=> mapIsEmpty!10063 mapRes!10063))

(declare-fun b!226228 () Bool)

(declare-fun e!146787 () Unit!6808)

(declare-fun Unit!6810 () Unit!6808)

(assert (=> b!226228 (= e!146787 Unit!6810)))

(declare-fun bm!21020 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21020 (= call!21023 (inRange!0 (ite c!37512 (index!5570 lt!113933) (index!5573 lt!113933)) (mask!10080 thiss!1504)))))

(declare-fun b!226230 () Bool)

(declare-fun e!146789 () Bool)

(declare-fun call!21024 () Bool)

(assert (=> b!226230 (= e!146789 (not call!21024))))

(declare-fun b!226231 () Bool)

(declare-fun e!146798 () Bool)

(declare-fun e!146795 () Bool)

(assert (=> b!226231 (= e!146798 e!146795)))

(declare-fun res!111363 () Bool)

(assert (=> b!226231 (=> (not res!111363) (not e!146795))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!226231 (= res!111363 (or (= lt!113933 (MissingZero!850 index!297)) (= lt!113933 (MissingVacant!850 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11101 (_ BitVec 32)) SeekEntryResult!850)

(assert (=> b!226231 (= lt!113933 (seekEntryOrOpen!0 key!932 (_keys!6284 thiss!1504) (mask!10080 thiss!1504)))))

(declare-fun b!226232 () Bool)

(declare-fun res!111364 () Bool)

(assert (=> b!226232 (=> res!111364 e!146797)))

(declare-fun lt!113930 () Bool)

(assert (=> b!226232 (= res!111364 lt!113930)))

(declare-fun bm!21021 () Bool)

(declare-fun arrayContainsKey!0 (array!11101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21021 (= call!21024 (arrayContainsKey!0 (_keys!6284 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226233 () Bool)

(declare-fun c!37511 () Bool)

(assert (=> b!226233 (= c!37511 ((_ is MissingVacant!850) lt!113933))))

(declare-fun e!146793 () Bool)

(assert (=> b!226233 (= e!146785 e!146793)))

(declare-fun b!226234 () Bool)

(declare-fun res!111354 () Bool)

(assert (=> b!226234 (=> res!111354 e!146797)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11101 (_ BitVec 32)) Bool)

(assert (=> b!226234 (= res!111354 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6284 thiss!1504) (mask!10080 thiss!1504))))))

(declare-fun b!226235 () Bool)

(declare-fun res!111357 () Bool)

(assert (=> b!226235 (=> res!111357 e!146797)))

(assert (=> b!226235 (= res!111357 (or (not (= (size!5603 (_keys!6284 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10080 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5603 (_keys!6284 thiss!1504)))))))

(declare-fun b!226236 () Bool)

(declare-fun e!146794 () Bool)

(assert (=> b!226236 (= e!146794 tp_is_empty!5929)))

(declare-fun b!226237 () Bool)

(declare-fun e!146796 () Bool)

(assert (=> b!226237 (= e!146796 (not e!146797))))

(declare-fun res!111352 () Bool)

(assert (=> b!226237 (=> res!111352 e!146797)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226237 (= res!111352 (not (validMask!0 (mask!10080 thiss!1504))))))

(declare-fun lt!113936 () array!11101)

(declare-fun arrayCountValidKeys!0 (array!11101 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226237 (= (arrayCountValidKeys!0 lt!113936 #b00000000000000000000000000000000 (size!5603 (_keys!6284 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6284 thiss!1504) #b00000000000000000000000000000000 (size!5603 (_keys!6284 thiss!1504)))))))

(declare-fun lt!113931 () Unit!6808)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11101 (_ BitVec 32) (_ BitVec 64)) Unit!6808)

(assert (=> b!226237 (= lt!113931 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6284 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3281 0))(
  ( (Nil!3278) (Cons!3277 (h!3925 (_ BitVec 64)) (t!8232 List!3281)) )
))
(declare-fun arrayNoDuplicates!0 (array!11101 (_ BitVec 32) List!3281) Bool)

(assert (=> b!226237 (arrayNoDuplicates!0 lt!113936 #b00000000000000000000000000000000 Nil!3278)))

(assert (=> b!226237 (= lt!113936 (array!11102 (store (arr!5270 (_keys!6284 thiss!1504)) index!297 key!932) (size!5603 (_keys!6284 thiss!1504))))))

(declare-fun lt!113937 () Unit!6808)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11101 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3281) Unit!6808)

(assert (=> b!226237 (= lt!113937 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6284 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3278))))

(declare-fun lt!113929 () Unit!6808)

(assert (=> b!226237 (= lt!113929 e!146787)))

(declare-fun c!37513 () Bool)

(assert (=> b!226237 (= c!37513 lt!113930)))

(assert (=> b!226237 (= lt!113930 (arrayContainsKey!0 (_keys!6284 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226238 () Bool)

(assert (=> b!226238 (= e!146786 (and e!146794 mapRes!10063))))

(declare-fun condMapEmpty!10063 () Bool)

(declare-fun mapDefault!10063 () ValueCell!2621)

(assert (=> b!226238 (= condMapEmpty!10063 (= (arr!5269 (_values!4213 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2621)) mapDefault!10063)))))

(declare-fun res!111360 () Bool)

(assert (=> start!22004 (=> (not res!111360) (not e!146798))))

(declare-fun valid!1269 (LongMapFixedSize!3142) Bool)

(assert (=> start!22004 (= res!111360 (valid!1269 thiss!1504))))

(assert (=> start!22004 e!146798))

(assert (=> start!22004 e!146792))

(assert (=> start!22004 true))

(declare-fun b!226229 () Bool)

(declare-fun e!146788 () Bool)

(assert (=> b!226229 (= e!146788 tp_is_empty!5929)))

(declare-fun mapNonEmpty!10063 () Bool)

(declare-fun tp!21342 () Bool)

(assert (=> mapNonEmpty!10063 (= mapRes!10063 (and tp!21342 e!146788))))

(declare-fun mapRest!10063 () (Array (_ BitVec 32) ValueCell!2621))

(declare-fun mapKey!10063 () (_ BitVec 32))

(declare-fun mapValue!10063 () ValueCell!2621)

(assert (=> mapNonEmpty!10063 (= (arr!5269 (_values!4213 thiss!1504)) (store mapRest!10063 mapKey!10063 mapValue!10063))))

(declare-fun b!226239 () Bool)

(declare-fun res!111362 () Bool)

(assert (=> b!226239 (= res!111362 (= (select (arr!5270 (_keys!6284 thiss!1504)) (index!5573 lt!113933)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!226239 (=> (not res!111362) (not e!146789))))

(declare-fun b!226240 () Bool)

(assert (=> b!226240 (= e!146793 ((_ is Undefined!850) lt!113933))))

(declare-fun b!226241 () Bool)

(assert (=> b!226241 (= e!146793 e!146789)))

(declare-fun res!111353 () Bool)

(assert (=> b!226241 (= res!111353 call!21023)))

(assert (=> b!226241 (=> (not res!111353) (not e!146789))))

(declare-fun b!226242 () Bool)

(declare-fun res!111361 () Bool)

(assert (=> b!226242 (=> (not res!111361) (not e!146784))))

(assert (=> b!226242 (= res!111361 (= (select (arr!5270 (_keys!6284 thiss!1504)) (index!5570 lt!113933)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!226243 () Bool)

(declare-fun Unit!6811 () Unit!6808)

(assert (=> b!226243 (= e!146787 Unit!6811)))

(declare-fun lt!113938 () Unit!6808)

(declare-fun lemmaArrayContainsKeyThenInListMap!92 (array!11101 array!11099 (_ BitVec 32) (_ BitVec 32) V!7553 V!7553 (_ BitVec 64) (_ BitVec 32) Int) Unit!6808)

(assert (=> b!226243 (= lt!113938 (lemmaArrayContainsKeyThenInListMap!92 (_keys!6284 thiss!1504) (_values!4213 thiss!1504) (mask!10080 thiss!1504) (extraKeys!3967 thiss!1504) (zeroValue!4071 thiss!1504) (minValue!4071 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4230 thiss!1504)))))

(assert (=> b!226243 false))

(declare-fun b!226244 () Bool)

(assert (=> b!226244 (= e!146784 (not call!21024))))

(declare-fun b!226245 () Bool)

(declare-fun Unit!6812 () Unit!6808)

(assert (=> b!226245 (= e!146791 Unit!6812)))

(declare-fun lt!113935 () Unit!6808)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!253 (array!11101 array!11099 (_ BitVec 32) (_ BitVec 32) V!7553 V!7553 (_ BitVec 64) Int) Unit!6808)

(assert (=> b!226245 (= lt!113935 (lemmaInListMapThenSeekEntryOrOpenFindsIt!253 (_keys!6284 thiss!1504) (_values!4213 thiss!1504) (mask!10080 thiss!1504) (extraKeys!3967 thiss!1504) (zeroValue!4071 thiss!1504) (minValue!4071 thiss!1504) key!932 (defaultEntry!4230 thiss!1504)))))

(assert (=> b!226245 false))

(declare-fun b!226246 () Bool)

(declare-fun res!111359 () Bool)

(assert (=> b!226246 (=> (not res!111359) (not e!146798))))

(assert (=> b!226246 (= res!111359 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!226247 () Bool)

(assert (=> b!226247 (= e!146797 true)))

(declare-fun lt!113928 () Bool)

(assert (=> b!226247 (= lt!113928 (arrayNoDuplicates!0 (_keys!6284 thiss!1504) #b00000000000000000000000000000000 Nil!3278))))

(declare-fun b!226248 () Bool)

(assert (=> b!226248 (= e!146795 e!146796)))

(declare-fun res!111358 () Bool)

(assert (=> b!226248 (=> (not res!111358) (not e!146796))))

(assert (=> b!226248 (= res!111358 (inRange!0 index!297 (mask!10080 thiss!1504)))))

(declare-fun lt!113932 () Unit!6808)

(assert (=> b!226248 (= lt!113932 e!146791)))

(declare-fun c!37510 () Bool)

(declare-datatypes ((tuple2!4372 0))(
  ( (tuple2!4373 (_1!2197 (_ BitVec 64)) (_2!2197 V!7553)) )
))
(declare-datatypes ((List!3282 0))(
  ( (Nil!3279) (Cons!3278 (h!3926 tuple2!4372) (t!8233 List!3282)) )
))
(declare-datatypes ((ListLongMap!3287 0))(
  ( (ListLongMap!3288 (toList!1659 List!3282)) )
))
(declare-fun contains!1548 (ListLongMap!3287 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1191 (array!11101 array!11099 (_ BitVec 32) (_ BitVec 32) V!7553 V!7553 (_ BitVec 32) Int) ListLongMap!3287)

(assert (=> b!226248 (= c!37510 (contains!1548 (getCurrentListMap!1191 (_keys!6284 thiss!1504) (_values!4213 thiss!1504) (mask!10080 thiss!1504) (extraKeys!3967 thiss!1504) (zeroValue!4071 thiss!1504) (minValue!4071 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4230 thiss!1504)) key!932))))

(assert (= (and start!22004 res!111360) b!226246))

(assert (= (and b!226246 res!111359) b!226231))

(assert (= (and b!226231 res!111363) b!226248))

(assert (= (and b!226248 c!37510) b!226245))

(assert (= (and b!226248 (not c!37510)) b!226226))

(assert (= (and b!226226 c!37512) b!226227))

(assert (= (and b!226226 (not c!37512)) b!226233))

(assert (= (and b!226227 res!111356) b!226242))

(assert (= (and b!226242 res!111361) b!226244))

(assert (= (and b!226233 c!37511) b!226241))

(assert (= (and b!226233 (not c!37511)) b!226240))

(assert (= (and b!226241 res!111353) b!226239))

(assert (= (and b!226239 res!111362) b!226230))

(assert (= (or b!226227 b!226241) bm!21020))

(assert (= (or b!226244 b!226230) bm!21021))

(assert (= (and b!226248 res!111358) b!226237))

(assert (= (and b!226237 c!37513) b!226243))

(assert (= (and b!226237 (not c!37513)) b!226228))

(assert (= (and b!226237 (not res!111352)) b!226235))

(assert (= (and b!226235 (not res!111357)) b!226224))

(assert (= (and b!226224 (not res!111355)) b!226232))

(assert (= (and b!226232 (not res!111364)) b!226234))

(assert (= (and b!226234 (not res!111354)) b!226247))

(assert (= (and b!226238 condMapEmpty!10063) mapIsEmpty!10063))

(assert (= (and b!226238 (not condMapEmpty!10063)) mapNonEmpty!10063))

(assert (= (and mapNonEmpty!10063 ((_ is ValueCellFull!2621) mapValue!10063)) b!226229))

(assert (= (and b!226238 ((_ is ValueCellFull!2621) mapDefault!10063)) b!226236))

(assert (= b!226225 b!226238))

(assert (= start!22004 b!226225))

(declare-fun m!248731 () Bool)

(assert (=> b!226226 m!248731))

(declare-fun m!248733 () Bool)

(assert (=> b!226237 m!248733))

(declare-fun m!248735 () Bool)

(assert (=> b!226237 m!248735))

(declare-fun m!248737 () Bool)

(assert (=> b!226237 m!248737))

(declare-fun m!248739 () Bool)

(assert (=> b!226237 m!248739))

(declare-fun m!248741 () Bool)

(assert (=> b!226237 m!248741))

(declare-fun m!248743 () Bool)

(assert (=> b!226237 m!248743))

(declare-fun m!248745 () Bool)

(assert (=> b!226237 m!248745))

(declare-fun m!248747 () Bool)

(assert (=> b!226237 m!248747))

(declare-fun m!248749 () Bool)

(assert (=> b!226224 m!248749))

(declare-fun m!248751 () Bool)

(assert (=> b!226225 m!248751))

(declare-fun m!248753 () Bool)

(assert (=> b!226225 m!248753))

(declare-fun m!248755 () Bool)

(assert (=> b!226245 m!248755))

(declare-fun m!248757 () Bool)

(assert (=> mapNonEmpty!10063 m!248757))

(declare-fun m!248759 () Bool)

(assert (=> b!226247 m!248759))

(declare-fun m!248761 () Bool)

(assert (=> b!226242 m!248761))

(declare-fun m!248763 () Bool)

(assert (=> b!226234 m!248763))

(declare-fun m!248765 () Bool)

(assert (=> b!226231 m!248765))

(declare-fun m!248767 () Bool)

(assert (=> start!22004 m!248767))

(declare-fun m!248769 () Bool)

(assert (=> b!226248 m!248769))

(declare-fun m!248771 () Bool)

(assert (=> b!226248 m!248771))

(assert (=> b!226248 m!248771))

(declare-fun m!248773 () Bool)

(assert (=> b!226248 m!248773))

(declare-fun m!248775 () Bool)

(assert (=> bm!21020 m!248775))

(assert (=> bm!21021 m!248735))

(declare-fun m!248777 () Bool)

(assert (=> b!226239 m!248777))

(declare-fun m!248779 () Bool)

(assert (=> b!226243 m!248779))

(check-sat (not start!22004) (not mapNonEmpty!10063) b_and!12979 (not b!226225) (not b!226247) tp_is_empty!5929 (not b!226234) (not b!226248) (not b!226224) (not bm!21020) (not bm!21021) (not b_next!6067) (not b!226226) (not b!226231) (not b!226237) (not b!226245) (not b!226243))
(check-sat b_and!12979 (not b_next!6067))
