; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21962 () Bool)

(assert start!21962)

(declare-fun b!224501 () Bool)

(declare-fun b_free!6025 () Bool)

(declare-fun b_next!6025 () Bool)

(assert (=> b!224501 (= b_free!6025 (not b_next!6025))))

(declare-fun tp!21216 () Bool)

(declare-fun b_and!12897 () Bool)

(assert (=> b!224501 (= tp!21216 b_and!12897)))

(declare-fun b!224490 () Bool)

(declare-fun e!145729 () Bool)

(declare-fun call!20886 () Bool)

(assert (=> b!224490 (= e!145729 (not call!20886))))

(declare-fun b!224491 () Bool)

(declare-datatypes ((Unit!6706 0))(
  ( (Unit!6707) )
))
(declare-fun e!145723 () Unit!6706)

(declare-fun lt!113023 () Unit!6706)

(assert (=> b!224491 (= e!145723 lt!113023)))

(declare-datatypes ((V!7497 0))(
  ( (V!7498 (val!2988 Int)) )
))
(declare-datatypes ((ValueCell!2600 0))(
  ( (ValueCellFull!2600 (v!5002 V!7497)) (EmptyCell!2600) )
))
(declare-datatypes ((array!11009 0))(
  ( (array!11010 (arr!5223 (Array (_ BitVec 32) ValueCell!2600)) (size!5557 (_ BitVec 32))) )
))
(declare-datatypes ((array!11011 0))(
  ( (array!11012 (arr!5224 (Array (_ BitVec 32) (_ BitVec 64))) (size!5558 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3100 0))(
  ( (LongMapFixedSize!3101 (defaultEntry!4209 Int) (mask!10044 (_ BitVec 32)) (extraKeys!3946 (_ BitVec 32)) (zeroValue!4050 V!7497) (minValue!4050 V!7497) (_size!1599 (_ BitVec 32)) (_keys!6262 array!11011) (_values!4192 array!11009) (_vacant!1599 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3100)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!235 (array!11011 array!11009 (_ BitVec 32) (_ BitVec 32) V!7497 V!7497 (_ BitVec 64) Int) Unit!6706)

(assert (=> b!224491 (= lt!113023 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!235 (_keys!6262 thiss!1504) (_values!4192 thiss!1504) (mask!10044 thiss!1504) (extraKeys!3946 thiss!1504) (zeroValue!4050 thiss!1504) (minValue!4050 thiss!1504) key!932 (defaultEntry!4209 thiss!1504)))))

(declare-fun c!37222 () Bool)

(declare-datatypes ((SeekEntryResult!856 0))(
  ( (MissingZero!856 (index!5594 (_ BitVec 32))) (Found!856 (index!5595 (_ BitVec 32))) (Intermediate!856 (undefined!1668 Bool) (index!5596 (_ BitVec 32)) (x!23139 (_ BitVec 32))) (Undefined!856) (MissingVacant!856 (index!5597 (_ BitVec 32))) )
))
(declare-fun lt!113028 () SeekEntryResult!856)

(get-info :version)

(assert (=> b!224491 (= c!37222 ((_ is MissingZero!856) lt!113028))))

(declare-fun e!145731 () Bool)

(assert (=> b!224491 e!145731))

(declare-fun b!224492 () Bool)

(declare-fun e!145722 () Bool)

(assert (=> b!224492 (= e!145722 ((_ is Undefined!856) lt!113028))))

(declare-fun bm!20882 () Bool)

(declare-fun arrayContainsKey!0 (array!11011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20882 (= call!20886 (arrayContainsKey!0 (_keys!6262 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224493 () Bool)

(declare-fun e!145734 () Bool)

(declare-fun e!145732 () Bool)

(assert (=> b!224493 (= e!145734 e!145732)))

(declare-fun res!110458 () Bool)

(assert (=> b!224493 (=> (not res!110458) (not e!145732))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!224493 (= res!110458 (or (= lt!113028 (MissingZero!856 index!297)) (= lt!113028 (MissingVacant!856 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11011 (_ BitVec 32)) SeekEntryResult!856)

(assert (=> b!224493 (= lt!113028 (seekEntryOrOpen!0 key!932 (_keys!6262 thiss!1504) (mask!10044 thiss!1504)))))

(declare-fun b!224494 () Bool)

(declare-fun e!145721 () Bool)

(declare-fun tp_is_empty!5887 () Bool)

(assert (=> b!224494 (= e!145721 tp_is_empty!5887)))

(declare-fun b!224495 () Bool)

(declare-fun e!145728 () Bool)

(assert (=> b!224495 (= e!145728 tp_is_empty!5887)))

(declare-fun b!224496 () Bool)

(declare-fun res!110453 () Bool)

(declare-fun e!145726 () Bool)

(assert (=> b!224496 (=> (not res!110453) (not e!145726))))

(declare-fun call!20885 () Bool)

(assert (=> b!224496 (= res!110453 call!20885)))

(assert (=> b!224496 (= e!145731 e!145726)))

(declare-fun b!224497 () Bool)

(declare-fun res!110459 () Bool)

(assert (=> b!224497 (=> (not res!110459) (not e!145726))))

(assert (=> b!224497 (= res!110459 (= (select (arr!5224 (_keys!6262 thiss!1504)) (index!5594 lt!113028)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!224498 () Bool)

(assert (=> b!224498 (= e!145722 e!145729)))

(declare-fun res!110456 () Bool)

(assert (=> b!224498 (= res!110456 call!20885)))

(assert (=> b!224498 (=> (not res!110456) (not e!145729))))

(declare-fun b!224499 () Bool)

(declare-fun e!145733 () Bool)

(assert (=> b!224499 (= e!145732 e!145733)))

(declare-fun res!110455 () Bool)

(assert (=> b!224499 (=> (not res!110455) (not e!145733))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224499 (= res!110455 (inRange!0 index!297 (mask!10044 thiss!1504)))))

(declare-fun lt!113026 () Unit!6706)

(assert (=> b!224499 (= lt!113026 e!145723)))

(declare-fun c!37219 () Bool)

(declare-datatypes ((tuple2!4394 0))(
  ( (tuple2!4395 (_1!2208 (_ BitVec 64)) (_2!2208 V!7497)) )
))
(declare-datatypes ((List!3323 0))(
  ( (Nil!3320) (Cons!3319 (h!3967 tuple2!4394) (t!8273 List!3323)) )
))
(declare-datatypes ((ListLongMap!3297 0))(
  ( (ListLongMap!3298 (toList!1664 List!3323)) )
))
(declare-fun contains!1539 (ListLongMap!3297 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1173 (array!11011 array!11009 (_ BitVec 32) (_ BitVec 32) V!7497 V!7497 (_ BitVec 32) Int) ListLongMap!3297)

(assert (=> b!224499 (= c!37219 (contains!1539 (getCurrentListMap!1173 (_keys!6262 thiss!1504) (_values!4192 thiss!1504) (mask!10044 thiss!1504) (extraKeys!3946 thiss!1504) (zeroValue!4050 thiss!1504) (minValue!4050 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4209 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!10000 () Bool)

(declare-fun mapRes!10000 () Bool)

(assert (=> mapIsEmpty!10000 mapRes!10000))

(declare-fun b!224500 () Bool)

(declare-fun res!110452 () Bool)

(assert (=> b!224500 (= res!110452 (= (select (arr!5224 (_keys!6262 thiss!1504)) (index!5597 lt!113028)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!224500 (=> (not res!110452) (not e!145729))))

(declare-fun e!145727 () Bool)

(declare-fun e!145725 () Bool)

(declare-fun array_inv!3445 (array!11011) Bool)

(declare-fun array_inv!3446 (array!11009) Bool)

(assert (=> b!224501 (= e!145725 (and tp!21216 tp_is_empty!5887 (array_inv!3445 (_keys!6262 thiss!1504)) (array_inv!3446 (_values!4192 thiss!1504)) e!145727))))

(declare-fun b!224502 () Bool)

(declare-fun Unit!6708 () Unit!6706)

(assert (=> b!224502 (= e!145723 Unit!6708)))

(declare-fun lt!113029 () Unit!6706)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!235 (array!11011 array!11009 (_ BitVec 32) (_ BitVec 32) V!7497 V!7497 (_ BitVec 64) Int) Unit!6706)

(assert (=> b!224502 (= lt!113029 (lemmaInListMapThenSeekEntryOrOpenFindsIt!235 (_keys!6262 thiss!1504) (_values!4192 thiss!1504) (mask!10044 thiss!1504) (extraKeys!3946 thiss!1504) (zeroValue!4050 thiss!1504) (minValue!4050 thiss!1504) key!932 (defaultEntry!4209 thiss!1504)))))

(assert (=> b!224502 false))

(declare-fun b!224503 () Bool)

(declare-fun res!110457 () Bool)

(assert (=> b!224503 (=> (not res!110457) (not e!145734))))

(assert (=> b!224503 (= res!110457 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!20883 () Bool)

(assert (=> bm!20883 (= call!20885 (inRange!0 (ite c!37222 (index!5594 lt!113028) (index!5597 lt!113028)) (mask!10044 thiss!1504)))))

(declare-fun b!224504 () Bool)

(declare-fun c!37221 () Bool)

(assert (=> b!224504 (= c!37221 ((_ is MissingVacant!856) lt!113028))))

(assert (=> b!224504 (= e!145731 e!145722)))

(declare-fun b!224505 () Bool)

(assert (=> b!224505 (= e!145726 (not call!20886))))

(declare-fun b!224506 () Bool)

(assert (=> b!224506 (= e!145733 (not true))))

(declare-datatypes ((List!3324 0))(
  ( (Nil!3321) (Cons!3320 (h!3968 (_ BitVec 64)) (t!8274 List!3324)) )
))
(declare-fun arrayNoDuplicates!0 (array!11011 (_ BitVec 32) List!3324) Bool)

(assert (=> b!224506 (arrayNoDuplicates!0 (array!11012 (store (arr!5224 (_keys!6262 thiss!1504)) index!297 key!932) (size!5558 (_keys!6262 thiss!1504))) #b00000000000000000000000000000000 Nil!3321)))

(declare-fun lt!113024 () Unit!6706)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11011 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3324) Unit!6706)

(assert (=> b!224506 (= lt!113024 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6262 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3321))))

(declare-fun lt!113027 () Unit!6706)

(declare-fun e!145724 () Unit!6706)

(assert (=> b!224506 (= lt!113027 e!145724)))

(declare-fun c!37220 () Bool)

(assert (=> b!224506 (= c!37220 (arrayContainsKey!0 (_keys!6262 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224507 () Bool)

(declare-fun Unit!6709 () Unit!6706)

(assert (=> b!224507 (= e!145724 Unit!6709)))

(declare-fun res!110454 () Bool)

(assert (=> start!21962 (=> (not res!110454) (not e!145734))))

(declare-fun valid!1261 (LongMapFixedSize!3100) Bool)

(assert (=> start!21962 (= res!110454 (valid!1261 thiss!1504))))

(assert (=> start!21962 e!145734))

(assert (=> start!21962 e!145725))

(assert (=> start!21962 true))

(declare-fun mapNonEmpty!10000 () Bool)

(declare-fun tp!21217 () Bool)

(assert (=> mapNonEmpty!10000 (= mapRes!10000 (and tp!21217 e!145721))))

(declare-fun mapValue!10000 () ValueCell!2600)

(declare-fun mapRest!10000 () (Array (_ BitVec 32) ValueCell!2600))

(declare-fun mapKey!10000 () (_ BitVec 32))

(assert (=> mapNonEmpty!10000 (= (arr!5223 (_values!4192 thiss!1504)) (store mapRest!10000 mapKey!10000 mapValue!10000))))

(declare-fun b!224508 () Bool)

(assert (=> b!224508 (= e!145727 (and e!145728 mapRes!10000))))

(declare-fun condMapEmpty!10000 () Bool)

(declare-fun mapDefault!10000 () ValueCell!2600)

(assert (=> b!224508 (= condMapEmpty!10000 (= (arr!5223 (_values!4192 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2600)) mapDefault!10000)))))

(declare-fun b!224509 () Bool)

(declare-fun Unit!6710 () Unit!6706)

(assert (=> b!224509 (= e!145724 Unit!6710)))

(declare-fun lt!113025 () Unit!6706)

(declare-fun lemmaArrayContainsKeyThenInListMap!79 (array!11011 array!11009 (_ BitVec 32) (_ BitVec 32) V!7497 V!7497 (_ BitVec 64) (_ BitVec 32) Int) Unit!6706)

(assert (=> b!224509 (= lt!113025 (lemmaArrayContainsKeyThenInListMap!79 (_keys!6262 thiss!1504) (_values!4192 thiss!1504) (mask!10044 thiss!1504) (extraKeys!3946 thiss!1504) (zeroValue!4050 thiss!1504) (minValue!4050 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4209 thiss!1504)))))

(assert (=> b!224509 false))

(assert (= (and start!21962 res!110454) b!224503))

(assert (= (and b!224503 res!110457) b!224493))

(assert (= (and b!224493 res!110458) b!224499))

(assert (= (and b!224499 c!37219) b!224502))

(assert (= (and b!224499 (not c!37219)) b!224491))

(assert (= (and b!224491 c!37222) b!224496))

(assert (= (and b!224491 (not c!37222)) b!224504))

(assert (= (and b!224496 res!110453) b!224497))

(assert (= (and b!224497 res!110459) b!224505))

(assert (= (and b!224504 c!37221) b!224498))

(assert (= (and b!224504 (not c!37221)) b!224492))

(assert (= (and b!224498 res!110456) b!224500))

(assert (= (and b!224500 res!110452) b!224490))

(assert (= (or b!224496 b!224498) bm!20883))

(assert (= (or b!224505 b!224490) bm!20882))

(assert (= (and b!224499 res!110455) b!224506))

(assert (= (and b!224506 c!37220) b!224509))

(assert (= (and b!224506 (not c!37220)) b!224507))

(assert (= (and b!224508 condMapEmpty!10000) mapIsEmpty!10000))

(assert (= (and b!224508 (not condMapEmpty!10000)) mapNonEmpty!10000))

(assert (= (and mapNonEmpty!10000 ((_ is ValueCellFull!2600) mapValue!10000)) b!224494))

(assert (= (and b!224508 ((_ is ValueCellFull!2600) mapDefault!10000)) b!224495))

(assert (= b!224501 b!224508))

(assert (= start!21962 b!224501))

(declare-fun m!246925 () Bool)

(assert (=> b!224506 m!246925))

(declare-fun m!246927 () Bool)

(assert (=> b!224506 m!246927))

(declare-fun m!246929 () Bool)

(assert (=> b!224506 m!246929))

(declare-fun m!246931 () Bool)

(assert (=> b!224506 m!246931))

(declare-fun m!246933 () Bool)

(assert (=> b!224491 m!246933))

(declare-fun m!246935 () Bool)

(assert (=> b!224493 m!246935))

(declare-fun m!246937 () Bool)

(assert (=> b!224502 m!246937))

(assert (=> bm!20882 m!246931))

(declare-fun m!246939 () Bool)

(assert (=> start!21962 m!246939))

(declare-fun m!246941 () Bool)

(assert (=> b!224500 m!246941))

(declare-fun m!246943 () Bool)

(assert (=> b!224509 m!246943))

(declare-fun m!246945 () Bool)

(assert (=> b!224499 m!246945))

(declare-fun m!246947 () Bool)

(assert (=> b!224499 m!246947))

(assert (=> b!224499 m!246947))

(declare-fun m!246949 () Bool)

(assert (=> b!224499 m!246949))

(declare-fun m!246951 () Bool)

(assert (=> mapNonEmpty!10000 m!246951))

(declare-fun m!246953 () Bool)

(assert (=> bm!20883 m!246953))

(declare-fun m!246955 () Bool)

(assert (=> b!224497 m!246955))

(declare-fun m!246957 () Bool)

(assert (=> b!224501 m!246957))

(declare-fun m!246959 () Bool)

(assert (=> b!224501 m!246959))

(check-sat (not b!224509) (not b_next!6025) (not b!224499) b_and!12897 (not b!224502) (not b!224493) (not b!224491) (not mapNonEmpty!10000) (not bm!20883) (not bm!20882) (not b!224501) tp_is_empty!5887 (not start!21962) (not b!224506))
(check-sat b_and!12897 (not b_next!6025))
