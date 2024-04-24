; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21962 () Bool)

(assert start!21962)

(declare-fun b!224697 () Bool)

(declare-fun b_free!6025 () Bool)

(declare-fun b_next!6025 () Bool)

(assert (=> b!224697 (= b_free!6025 (not b_next!6025))))

(declare-fun tp!21216 () Bool)

(declare-fun b_and!12937 () Bool)

(assert (=> b!224697 (= tp!21216 b_and!12937)))

(declare-fun b!224684 () Bool)

(declare-datatypes ((Unit!6726 0))(
  ( (Unit!6727) )
))
(declare-fun e!145852 () Unit!6726)

(declare-fun Unit!6728 () Unit!6726)

(assert (=> b!224684 (= e!145852 Unit!6728)))

(declare-fun lt!113264 () Unit!6726)

(declare-datatypes ((V!7497 0))(
  ( (V!7498 (val!2988 Int)) )
))
(declare-datatypes ((ValueCell!2600 0))(
  ( (ValueCellFull!2600 (v!5009 V!7497)) (EmptyCell!2600) )
))
(declare-datatypes ((array!11015 0))(
  ( (array!11016 (arr!5227 (Array (_ BitVec 32) ValueCell!2600)) (size!5560 (_ BitVec 32))) )
))
(declare-datatypes ((array!11017 0))(
  ( (array!11018 (arr!5228 (Array (_ BitVec 32) (_ BitVec 64))) (size!5561 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3100 0))(
  ( (LongMapFixedSize!3101 (defaultEntry!4209 Int) (mask!10045 (_ BitVec 32)) (extraKeys!3946 (_ BitVec 32)) (zeroValue!4050 V!7497) (minValue!4050 V!7497) (_size!1599 (_ BitVec 32)) (_keys!6263 array!11017) (_values!4192 array!11015) (_vacant!1599 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3100)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!76 (array!11017 array!11015 (_ BitVec 32) (_ BitVec 32) V!7497 V!7497 (_ BitVec 64) (_ BitVec 32) Int) Unit!6726)

(assert (=> b!224684 (= lt!113264 (lemmaArrayContainsKeyThenInListMap!76 (_keys!6263 thiss!1504) (_values!4192 thiss!1504) (mask!10045 thiss!1504) (extraKeys!3946 thiss!1504) (zeroValue!4050 thiss!1504) (minValue!4050 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4209 thiss!1504)))))

(assert (=> b!224684 false))

(declare-fun b!224685 () Bool)

(declare-fun e!145857 () Unit!6726)

(declare-fun lt!113265 () Unit!6726)

(assert (=> b!224685 (= e!145857 lt!113265)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!230 (array!11017 array!11015 (_ BitVec 32) (_ BitVec 32) V!7497 V!7497 (_ BitVec 64) Int) Unit!6726)

(assert (=> b!224685 (= lt!113265 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!230 (_keys!6263 thiss!1504) (_values!4192 thiss!1504) (mask!10045 thiss!1504) (extraKeys!3946 thiss!1504) (zeroValue!4050 thiss!1504) (minValue!4050 thiss!1504) key!932 (defaultEntry!4209 thiss!1504)))))

(declare-fun c!37258 () Bool)

(declare-datatypes ((SeekEntryResult!832 0))(
  ( (MissingZero!832 (index!5498 (_ BitVec 32))) (Found!832 (index!5499 (_ BitVec 32))) (Intermediate!832 (undefined!1644 Bool) (index!5500 (_ BitVec 32)) (x!23116 (_ BitVec 32))) (Undefined!832) (MissingVacant!832 (index!5501 (_ BitVec 32))) )
))
(declare-fun lt!113266 () SeekEntryResult!832)

(get-info :version)

(assert (=> b!224685 (= c!37258 ((_ is MissingZero!832) lt!113266))))

(declare-fun e!145853 () Bool)

(assert (=> b!224685 e!145853))

(declare-fun bm!20894 () Bool)

(declare-fun call!20897 () Bool)

(declare-fun arrayContainsKey!0 (array!11017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20894 (= call!20897 (arrayContainsKey!0 (_keys!6263 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10000 () Bool)

(declare-fun mapRes!10000 () Bool)

(assert (=> mapIsEmpty!10000 mapRes!10000))

(declare-fun b!224686 () Bool)

(declare-fun e!145848 () Bool)

(declare-fun e!145850 () Bool)

(assert (=> b!224686 (= e!145848 e!145850)))

(declare-fun res!110573 () Bool)

(assert (=> b!224686 (=> (not res!110573) (not e!145850))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!224686 (= res!110573 (or (= lt!113266 (MissingZero!832 index!297)) (= lt!113266 (MissingVacant!832 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11017 (_ BitVec 32)) SeekEntryResult!832)

(assert (=> b!224686 (= lt!113266 (seekEntryOrOpen!0 key!932 (_keys!6263 thiss!1504) (mask!10045 thiss!1504)))))

(declare-fun b!224687 () Bool)

(declare-fun res!110569 () Bool)

(declare-fun e!145855 () Bool)

(assert (=> b!224687 (=> (not res!110569) (not e!145855))))

(declare-fun call!20898 () Bool)

(assert (=> b!224687 (= res!110569 call!20898)))

(assert (=> b!224687 (= e!145853 e!145855)))

(declare-fun b!224688 () Bool)

(declare-fun c!37260 () Bool)

(assert (=> b!224688 (= c!37260 ((_ is MissingVacant!832) lt!113266))))

(declare-fun e!145847 () Bool)

(assert (=> b!224688 (= e!145853 e!145847)))

(declare-fun b!224689 () Bool)

(declare-fun e!145858 () Bool)

(declare-fun tp_is_empty!5887 () Bool)

(assert (=> b!224689 (= e!145858 tp_is_empty!5887)))

(declare-fun mapNonEmpty!10000 () Bool)

(declare-fun tp!21217 () Bool)

(assert (=> mapNonEmpty!10000 (= mapRes!10000 (and tp!21217 e!145858))))

(declare-fun mapValue!10000 () ValueCell!2600)

(declare-fun mapRest!10000 () (Array (_ BitVec 32) ValueCell!2600))

(declare-fun mapKey!10000 () (_ BitVec 32))

(assert (=> mapNonEmpty!10000 (= (arr!5227 (_values!4192 thiss!1504)) (store mapRest!10000 mapKey!10000 mapValue!10000))))

(declare-fun b!224690 () Bool)

(declare-fun e!145859 () Bool)

(assert (=> b!224690 (= e!145850 e!145859)))

(declare-fun res!110568 () Bool)

(assert (=> b!224690 (=> (not res!110568) (not e!145859))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224690 (= res!110568 (inRange!0 index!297 (mask!10045 thiss!1504)))))

(declare-fun lt!113269 () Unit!6726)

(assert (=> b!224690 (= lt!113269 e!145857)))

(declare-fun c!37259 () Bool)

(declare-datatypes ((tuple2!4342 0))(
  ( (tuple2!4343 (_1!2182 (_ BitVec 64)) (_2!2182 V!7497)) )
))
(declare-datatypes ((List!3247 0))(
  ( (Nil!3244) (Cons!3243 (h!3891 tuple2!4342) (t!8198 List!3247)) )
))
(declare-datatypes ((ListLongMap!3257 0))(
  ( (ListLongMap!3258 (toList!1644 List!3247)) )
))
(declare-fun contains!1533 (ListLongMap!3257 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1176 (array!11017 array!11015 (_ BitVec 32) (_ BitVec 32) V!7497 V!7497 (_ BitVec 32) Int) ListLongMap!3257)

(assert (=> b!224690 (= c!37259 (contains!1533 (getCurrentListMap!1176 (_keys!6263 thiss!1504) (_values!4192 thiss!1504) (mask!10045 thiss!1504) (extraKeys!3946 thiss!1504) (zeroValue!4050 thiss!1504) (minValue!4050 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4209 thiss!1504)) key!932))))

(declare-fun b!224691 () Bool)

(declare-fun res!110572 () Bool)

(assert (=> b!224691 (= res!110572 (= (select (arr!5228 (_keys!6263 thiss!1504)) (index!5501 lt!113266)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!145856 () Bool)

(assert (=> b!224691 (=> (not res!110572) (not e!145856))))

(declare-fun b!224692 () Bool)

(declare-fun res!110575 () Bool)

(assert (=> b!224692 (=> (not res!110575) (not e!145855))))

(assert (=> b!224692 (= res!110575 (= (select (arr!5228 (_keys!6263 thiss!1504)) (index!5498 lt!113266)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!224693 () Bool)

(assert (=> b!224693 (= e!145856 (not call!20897))))

(declare-fun res!110571 () Bool)

(assert (=> start!21962 (=> (not res!110571) (not e!145848))))

(declare-fun valid!1255 (LongMapFixedSize!3100) Bool)

(assert (=> start!21962 (= res!110571 (valid!1255 thiss!1504))))

(assert (=> start!21962 e!145848))

(declare-fun e!145846 () Bool)

(assert (=> start!21962 e!145846))

(assert (=> start!21962 true))

(declare-fun b!224694 () Bool)

(declare-fun res!110574 () Bool)

(assert (=> b!224694 (=> (not res!110574) (not e!145848))))

(assert (=> b!224694 (= res!110574 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!224695 () Bool)

(declare-fun Unit!6729 () Unit!6726)

(assert (=> b!224695 (= e!145857 Unit!6729)))

(declare-fun lt!113268 () Unit!6726)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!239 (array!11017 array!11015 (_ BitVec 32) (_ BitVec 32) V!7497 V!7497 (_ BitVec 64) Int) Unit!6726)

(assert (=> b!224695 (= lt!113268 (lemmaInListMapThenSeekEntryOrOpenFindsIt!239 (_keys!6263 thiss!1504) (_values!4192 thiss!1504) (mask!10045 thiss!1504) (extraKeys!3946 thiss!1504) (zeroValue!4050 thiss!1504) (minValue!4050 thiss!1504) key!932 (defaultEntry!4209 thiss!1504)))))

(assert (=> b!224695 false))

(declare-fun b!224696 () Bool)

(declare-fun e!145849 () Bool)

(assert (=> b!224696 (= e!145849 tp_is_empty!5887)))

(declare-fun e!145851 () Bool)

(declare-fun array_inv!3435 (array!11017) Bool)

(declare-fun array_inv!3436 (array!11015) Bool)

(assert (=> b!224697 (= e!145846 (and tp!21216 tp_is_empty!5887 (array_inv!3435 (_keys!6263 thiss!1504)) (array_inv!3436 (_values!4192 thiss!1504)) e!145851))))

(declare-fun b!224698 () Bool)

(assert (=> b!224698 (= e!145859 (not true))))

(declare-datatypes ((List!3248 0))(
  ( (Nil!3245) (Cons!3244 (h!3892 (_ BitVec 64)) (t!8199 List!3248)) )
))
(declare-fun arrayNoDuplicates!0 (array!11017 (_ BitVec 32) List!3248) Bool)

(assert (=> b!224698 (arrayNoDuplicates!0 (array!11018 (store (arr!5228 (_keys!6263 thiss!1504)) index!297 key!932) (size!5561 (_keys!6263 thiss!1504))) #b00000000000000000000000000000000 Nil!3245)))

(declare-fun lt!113267 () Unit!6726)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11017 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3248) Unit!6726)

(assert (=> b!224698 (= lt!113267 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6263 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3245))))

(declare-fun lt!113263 () Unit!6726)

(assert (=> b!224698 (= lt!113263 e!145852)))

(declare-fun c!37261 () Bool)

(assert (=> b!224698 (= c!37261 (arrayContainsKey!0 (_keys!6263 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224699 () Bool)

(assert (=> b!224699 (= e!145847 e!145856)))

(declare-fun res!110570 () Bool)

(assert (=> b!224699 (= res!110570 call!20898)))

(assert (=> b!224699 (=> (not res!110570) (not e!145856))))

(declare-fun b!224700 () Bool)

(assert (=> b!224700 (= e!145851 (and e!145849 mapRes!10000))))

(declare-fun condMapEmpty!10000 () Bool)

(declare-fun mapDefault!10000 () ValueCell!2600)

(assert (=> b!224700 (= condMapEmpty!10000 (= (arr!5227 (_values!4192 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2600)) mapDefault!10000)))))

(declare-fun b!224701 () Bool)

(declare-fun Unit!6730 () Unit!6726)

(assert (=> b!224701 (= e!145852 Unit!6730)))

(declare-fun b!224702 () Bool)

(assert (=> b!224702 (= e!145855 (not call!20897))))

(declare-fun b!224703 () Bool)

(assert (=> b!224703 (= e!145847 ((_ is Undefined!832) lt!113266))))

(declare-fun bm!20895 () Bool)

(assert (=> bm!20895 (= call!20898 (inRange!0 (ite c!37258 (index!5498 lt!113266) (index!5501 lt!113266)) (mask!10045 thiss!1504)))))

(assert (= (and start!21962 res!110571) b!224694))

(assert (= (and b!224694 res!110574) b!224686))

(assert (= (and b!224686 res!110573) b!224690))

(assert (= (and b!224690 c!37259) b!224695))

(assert (= (and b!224690 (not c!37259)) b!224685))

(assert (= (and b!224685 c!37258) b!224687))

(assert (= (and b!224685 (not c!37258)) b!224688))

(assert (= (and b!224687 res!110569) b!224692))

(assert (= (and b!224692 res!110575) b!224702))

(assert (= (and b!224688 c!37260) b!224699))

(assert (= (and b!224688 (not c!37260)) b!224703))

(assert (= (and b!224699 res!110570) b!224691))

(assert (= (and b!224691 res!110572) b!224693))

(assert (= (or b!224687 b!224699) bm!20895))

(assert (= (or b!224702 b!224693) bm!20894))

(assert (= (and b!224690 res!110568) b!224698))

(assert (= (and b!224698 c!37261) b!224684))

(assert (= (and b!224698 (not c!37261)) b!224701))

(assert (= (and b!224700 condMapEmpty!10000) mapIsEmpty!10000))

(assert (= (and b!224700 (not condMapEmpty!10000)) mapNonEmpty!10000))

(assert (= (and mapNonEmpty!10000 ((_ is ValueCellFull!2600) mapValue!10000)) b!224689))

(assert (= (and b!224700 ((_ is ValueCellFull!2600) mapDefault!10000)) b!224696))

(assert (= b!224697 b!224700))

(assert (= start!21962 b!224697))

(declare-fun m!247723 () Bool)

(assert (=> bm!20894 m!247723))

(declare-fun m!247725 () Bool)

(assert (=> bm!20895 m!247725))

(declare-fun m!247727 () Bool)

(assert (=> b!224692 m!247727))

(declare-fun m!247729 () Bool)

(assert (=> b!224686 m!247729))

(declare-fun m!247731 () Bool)

(assert (=> b!224684 m!247731))

(declare-fun m!247733 () Bool)

(assert (=> b!224691 m!247733))

(declare-fun m!247735 () Bool)

(assert (=> mapNonEmpty!10000 m!247735))

(declare-fun m!247737 () Bool)

(assert (=> b!224698 m!247737))

(declare-fun m!247739 () Bool)

(assert (=> b!224698 m!247739))

(declare-fun m!247741 () Bool)

(assert (=> b!224698 m!247741))

(assert (=> b!224698 m!247723))

(declare-fun m!247743 () Bool)

(assert (=> b!224685 m!247743))

(declare-fun m!247745 () Bool)

(assert (=> start!21962 m!247745))

(declare-fun m!247747 () Bool)

(assert (=> b!224697 m!247747))

(declare-fun m!247749 () Bool)

(assert (=> b!224697 m!247749))

(declare-fun m!247751 () Bool)

(assert (=> b!224695 m!247751))

(declare-fun m!247753 () Bool)

(assert (=> b!224690 m!247753))

(declare-fun m!247755 () Bool)

(assert (=> b!224690 m!247755))

(assert (=> b!224690 m!247755))

(declare-fun m!247757 () Bool)

(assert (=> b!224690 m!247757))

(check-sat (not b!224697) (not b!224684) (not b!224686) (not b!224698) (not b_next!6025) (not bm!20895) (not start!21962) (not mapNonEmpty!10000) tp_is_empty!5887 (not b!224695) (not b!224685) (not bm!20894) (not b!224690) b_and!12937)
(check-sat b_and!12937 (not b_next!6025))
