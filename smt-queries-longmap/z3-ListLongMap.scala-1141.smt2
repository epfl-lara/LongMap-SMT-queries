; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23578 () Bool)

(assert start!23578)

(declare-fun b!247884 () Bool)

(declare-fun b_free!6597 () Bool)

(declare-fun b_next!6597 () Bool)

(assert (=> b!247884 (= b_free!6597 (not b_next!6597))))

(declare-fun tp!23038 () Bool)

(declare-fun b_and!13599 () Bool)

(assert (=> b!247884 (= tp!23038 b_and!13599)))

(declare-fun b!247880 () Bool)

(declare-datatypes ((Unit!7673 0))(
  ( (Unit!7674) )
))
(declare-fun e!160817 () Unit!7673)

(declare-fun Unit!7675 () Unit!7673)

(assert (=> b!247880 (= e!160817 Unit!7675)))

(declare-fun b!247881 () Bool)

(declare-fun e!160804 () Unit!7673)

(declare-fun lt!124127 () Unit!7673)

(assert (=> b!247881 (= e!160804 lt!124127)))

(declare-datatypes ((V!8259 0))(
  ( (V!8260 (val!3274 Int)) )
))
(declare-datatypes ((ValueCell!2886 0))(
  ( (ValueCellFull!2886 (v!5332 V!8259)) (EmptyCell!2886) )
))
(declare-datatypes ((array!12225 0))(
  ( (array!12226 (arr!5800 (Array (_ BitVec 32) ValueCell!2886)) (size!6143 (_ BitVec 32))) )
))
(declare-datatypes ((array!12227 0))(
  ( (array!12228 (arr!5801 (Array (_ BitVec 32) (_ BitVec 64))) (size!6144 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3672 0))(
  ( (LongMapFixedSize!3673 (defaultEntry!4585 Int) (mask!10727 (_ BitVec 32)) (extraKeys!4322 (_ BitVec 32)) (zeroValue!4426 V!8259) (minValue!4426 V!8259) (_size!1885 (_ BitVec 32)) (_keys!6707 array!12227) (_values!4568 array!12225) (_vacant!1885 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3672)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!390 (array!12227 array!12225 (_ BitVec 32) (_ BitVec 32) V!8259 V!8259 (_ BitVec 64) Int) Unit!7673)

(assert (=> b!247881 (= lt!124127 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!390 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) key!932 (defaultEntry!4585 thiss!1504)))))

(declare-fun c!41509 () Bool)

(declare-datatypes ((SeekEntryResult!1107 0))(
  ( (MissingZero!1107 (index!6598 (_ BitVec 32))) (Found!1107 (index!6599 (_ BitVec 32))) (Intermediate!1107 (undefined!1919 Bool) (index!6600 (_ BitVec 32)) (x!24551 (_ BitVec 32))) (Undefined!1107) (MissingVacant!1107 (index!6601 (_ BitVec 32))) )
))
(declare-fun lt!124128 () SeekEntryResult!1107)

(get-info :version)

(assert (=> b!247881 (= c!41509 ((_ is MissingZero!1107) lt!124128))))

(declare-fun e!160811 () Bool)

(assert (=> b!247881 e!160811))

(declare-fun b!247882 () Bool)

(declare-fun e!160812 () Bool)

(declare-fun tp_is_empty!6459 () Bool)

(assert (=> b!247882 (= e!160812 tp_is_empty!6459)))

(declare-fun b!247883 () Bool)

(declare-fun res!121484 () Bool)

(declare-fun e!160808 () Bool)

(assert (=> b!247883 (=> res!121484 e!160808)))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!247883 (= res!121484 (or (not (= (size!6144 (_keys!6707 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10727 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6144 (_keys!6707 thiss!1504)))))))

(declare-fun e!160818 () Bool)

(declare-fun e!160805 () Bool)

(declare-fun array_inv!3831 (array!12227) Bool)

(declare-fun array_inv!3832 (array!12225) Bool)

(assert (=> b!247884 (= e!160818 (and tp!23038 tp_is_empty!6459 (array_inv!3831 (_keys!6707 thiss!1504)) (array_inv!3832 (_values!4568 thiss!1504)) e!160805))))

(declare-fun b!247885 () Bool)

(declare-fun res!121491 () Bool)

(declare-fun e!160813 () Bool)

(assert (=> b!247885 (=> (not res!121491) (not e!160813))))

(assert (=> b!247885 (= res!121491 (= (select (arr!5801 (_keys!6707 thiss!1504)) (index!6598 lt!124128)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!247886 () Bool)

(declare-fun mapRes!10964 () Bool)

(assert (=> b!247886 (= e!160805 (and e!160812 mapRes!10964))))

(declare-fun condMapEmpty!10964 () Bool)

(declare-fun mapDefault!10964 () ValueCell!2886)

(assert (=> b!247886 (= condMapEmpty!10964 (= (arr!5800 (_values!4568 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2886)) mapDefault!10964)))))

(declare-fun b!247887 () Bool)

(declare-fun res!121492 () Bool)

(assert (=> b!247887 (= res!121492 (= (select (arr!5801 (_keys!6707 thiss!1504)) (index!6601 lt!124128)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!160810 () Bool)

(assert (=> b!247887 (=> (not res!121492) (not e!160810))))

(declare-fun b!247888 () Bool)

(declare-fun e!160814 () Bool)

(assert (=> b!247888 (= e!160814 tp_is_empty!6459)))

(declare-fun b!247889 () Bool)

(declare-fun e!160809 () Bool)

(assert (=> b!247889 (= e!160809 ((_ is Undefined!1107) lt!124128))))

(declare-fun bm!23209 () Bool)

(declare-fun call!23213 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23209 (= call!23213 (inRange!0 (ite c!41509 (index!6598 lt!124128) (index!6601 lt!124128)) (mask!10727 thiss!1504)))))

(declare-fun bm!23210 () Bool)

(declare-fun call!23212 () Bool)

(declare-fun arrayContainsKey!0 (array!12227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23210 (= call!23212 (arrayContainsKey!0 (_keys!6707 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247890 () Bool)

(declare-fun e!160816 () Bool)

(assert (=> b!247890 (= e!160816 (not e!160808))))

(declare-fun res!121486 () Bool)

(assert (=> b!247890 (=> res!121486 e!160808)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!247890 (= res!121486 (not (validMask!0 (mask!10727 thiss!1504))))))

(declare-fun lt!124125 () array!12227)

(declare-fun arrayCountValidKeys!0 (array!12227 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!247890 (= (arrayCountValidKeys!0 lt!124125 #b00000000000000000000000000000000 (size!6144 (_keys!6707 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6707 thiss!1504) #b00000000000000000000000000000000 (size!6144 (_keys!6707 thiss!1504)))))))

(declare-fun lt!124124 () Unit!7673)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12227 (_ BitVec 32) (_ BitVec 64)) Unit!7673)

(assert (=> b!247890 (= lt!124124 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6707 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3701 0))(
  ( (Nil!3698) (Cons!3697 (h!4355 (_ BitVec 64)) (t!8724 List!3701)) )
))
(declare-fun arrayNoDuplicates!0 (array!12227 (_ BitVec 32) List!3701) Bool)

(assert (=> b!247890 (arrayNoDuplicates!0 lt!124125 #b00000000000000000000000000000000 Nil!3698)))

(assert (=> b!247890 (= lt!124125 (array!12228 (store (arr!5801 (_keys!6707 thiss!1504)) index!297 key!932) (size!6144 (_keys!6707 thiss!1504))))))

(declare-fun lt!124131 () Unit!7673)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12227 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3701) Unit!7673)

(assert (=> b!247890 (= lt!124131 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6707 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3698))))

(declare-fun lt!124123 () Unit!7673)

(assert (=> b!247890 (= lt!124123 e!160817)))

(declare-fun c!41510 () Bool)

(declare-fun lt!124126 () Bool)

(assert (=> b!247890 (= c!41510 lt!124126)))

(assert (=> b!247890 (= lt!124126 (arrayContainsKey!0 (_keys!6707 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247891 () Bool)

(declare-fun e!160815 () Bool)

(declare-fun e!160806 () Bool)

(assert (=> b!247891 (= e!160815 e!160806)))

(declare-fun res!121489 () Bool)

(assert (=> b!247891 (=> (not res!121489) (not e!160806))))

(assert (=> b!247891 (= res!121489 (or (= lt!124128 (MissingZero!1107 index!297)) (= lt!124128 (MissingVacant!1107 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12227 (_ BitVec 32)) SeekEntryResult!1107)

(assert (=> b!247891 (= lt!124128 (seekEntryOrOpen!0 key!932 (_keys!6707 thiss!1504) (mask!10727 thiss!1504)))))

(declare-fun b!247892 () Bool)

(declare-fun res!121488 () Bool)

(assert (=> b!247892 (=> (not res!121488) (not e!160815))))

(assert (=> b!247892 (= res!121488 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!247893 () Bool)

(declare-fun res!121494 () Bool)

(assert (=> b!247893 (=> (not res!121494) (not e!160813))))

(assert (=> b!247893 (= res!121494 call!23213)))

(assert (=> b!247893 (= e!160811 e!160813)))

(declare-fun b!247894 () Bool)

(declare-fun res!121495 () Bool)

(assert (=> b!247894 (=> res!121495 e!160808)))

(assert (=> b!247894 (= res!121495 lt!124126)))

(declare-fun b!247895 () Bool)

(assert (=> b!247895 (= e!160813 (not call!23212))))

(declare-fun b!247896 () Bool)

(declare-fun res!121493 () Bool)

(assert (=> b!247896 (=> res!121493 e!160808)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!247896 (= res!121493 (not (validKeyInArray!0 key!932)))))

(declare-fun b!247897 () Bool)

(declare-fun Unit!7676 () Unit!7673)

(assert (=> b!247897 (= e!160817 Unit!7676)))

(declare-fun lt!124129 () Unit!7673)

(declare-fun lemmaArrayContainsKeyThenInListMap!190 (array!12227 array!12225 (_ BitVec 32) (_ BitVec 32) V!8259 V!8259 (_ BitVec 64) (_ BitVec 32) Int) Unit!7673)

(assert (=> b!247897 (= lt!124129 (lemmaArrayContainsKeyThenInListMap!190 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4585 thiss!1504)))))

(assert (=> b!247897 false))

(declare-fun b!247898 () Bool)

(declare-fun Unit!7677 () Unit!7673)

(assert (=> b!247898 (= e!160804 Unit!7677)))

(declare-fun lt!124130 () Unit!7673)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!386 (array!12227 array!12225 (_ BitVec 32) (_ BitVec 32) V!8259 V!8259 (_ BitVec 64) Int) Unit!7673)

(assert (=> b!247898 (= lt!124130 (lemmaInListMapThenSeekEntryOrOpenFindsIt!386 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) key!932 (defaultEntry!4585 thiss!1504)))))

(assert (=> b!247898 false))

(declare-fun b!247899 () Bool)

(declare-fun c!41508 () Bool)

(assert (=> b!247899 (= c!41508 ((_ is MissingVacant!1107) lt!124128))))

(assert (=> b!247899 (= e!160811 e!160809)))

(declare-fun mapIsEmpty!10964 () Bool)

(assert (=> mapIsEmpty!10964 mapRes!10964))

(declare-fun mapNonEmpty!10964 () Bool)

(declare-fun tp!23039 () Bool)

(assert (=> mapNonEmpty!10964 (= mapRes!10964 (and tp!23039 e!160814))))

(declare-fun mapKey!10964 () (_ BitVec 32))

(declare-fun mapRest!10964 () (Array (_ BitVec 32) ValueCell!2886))

(declare-fun mapValue!10964 () ValueCell!2886)

(assert (=> mapNonEmpty!10964 (= (arr!5800 (_values!4568 thiss!1504)) (store mapRest!10964 mapKey!10964 mapValue!10964))))

(declare-fun b!247900 () Bool)

(assert (=> b!247900 (= e!160810 (not call!23212))))

(declare-fun res!121487 () Bool)

(assert (=> start!23578 (=> (not res!121487) (not e!160815))))

(declare-fun valid!1437 (LongMapFixedSize!3672) Bool)

(assert (=> start!23578 (= res!121487 (valid!1437 thiss!1504))))

(assert (=> start!23578 e!160815))

(assert (=> start!23578 e!160818))

(assert (=> start!23578 true))

(declare-fun b!247901 () Bool)

(assert (=> b!247901 (= e!160806 e!160816)))

(declare-fun res!121490 () Bool)

(assert (=> b!247901 (=> (not res!121490) (not e!160816))))

(assert (=> b!247901 (= res!121490 (inRange!0 index!297 (mask!10727 thiss!1504)))))

(declare-fun lt!124122 () Unit!7673)

(assert (=> b!247901 (= lt!124122 e!160804)))

(declare-fun c!41507 () Bool)

(declare-datatypes ((tuple2!4820 0))(
  ( (tuple2!4821 (_1!2421 (_ BitVec 64)) (_2!2421 V!8259)) )
))
(declare-datatypes ((List!3702 0))(
  ( (Nil!3699) (Cons!3698 (h!4356 tuple2!4820) (t!8725 List!3702)) )
))
(declare-datatypes ((ListLongMap!3733 0))(
  ( (ListLongMap!3734 (toList!1882 List!3702)) )
))
(declare-fun contains!1796 (ListLongMap!3733 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1410 (array!12227 array!12225 (_ BitVec 32) (_ BitVec 32) V!8259 V!8259 (_ BitVec 32) Int) ListLongMap!3733)

(assert (=> b!247901 (= c!41507 (contains!1796 (getCurrentListMap!1410 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4585 thiss!1504)) key!932))))

(declare-fun b!247902 () Bool)

(assert (=> b!247902 (= e!160809 e!160810)))

(declare-fun res!121485 () Bool)

(assert (=> b!247902 (= res!121485 call!23213)))

(assert (=> b!247902 (=> (not res!121485) (not e!160810))))

(declare-fun b!247903 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12227 (_ BitVec 32)) Bool)

(assert (=> b!247903 (= e!160808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6707 thiss!1504) (mask!10727 thiss!1504)))))

(assert (= (and start!23578 res!121487) b!247892))

(assert (= (and b!247892 res!121488) b!247891))

(assert (= (and b!247891 res!121489) b!247901))

(assert (= (and b!247901 c!41507) b!247898))

(assert (= (and b!247901 (not c!41507)) b!247881))

(assert (= (and b!247881 c!41509) b!247893))

(assert (= (and b!247881 (not c!41509)) b!247899))

(assert (= (and b!247893 res!121494) b!247885))

(assert (= (and b!247885 res!121491) b!247895))

(assert (= (and b!247899 c!41508) b!247902))

(assert (= (and b!247899 (not c!41508)) b!247889))

(assert (= (and b!247902 res!121485) b!247887))

(assert (= (and b!247887 res!121492) b!247900))

(assert (= (or b!247893 b!247902) bm!23209))

(assert (= (or b!247895 b!247900) bm!23210))

(assert (= (and b!247901 res!121490) b!247890))

(assert (= (and b!247890 c!41510) b!247897))

(assert (= (and b!247890 (not c!41510)) b!247880))

(assert (= (and b!247890 (not res!121486)) b!247883))

(assert (= (and b!247883 (not res!121484)) b!247896))

(assert (= (and b!247896 (not res!121493)) b!247894))

(assert (= (and b!247894 (not res!121495)) b!247903))

(assert (= (and b!247886 condMapEmpty!10964) mapIsEmpty!10964))

(assert (= (and b!247886 (not condMapEmpty!10964)) mapNonEmpty!10964))

(assert (= (and mapNonEmpty!10964 ((_ is ValueCellFull!2886) mapValue!10964)) b!247888))

(assert (= (and b!247886 ((_ is ValueCellFull!2886) mapDefault!10964)) b!247882))

(assert (= b!247884 b!247886))

(assert (= start!23578 b!247884))

(declare-fun m!264805 () Bool)

(assert (=> b!247897 m!264805))

(declare-fun m!264807 () Bool)

(assert (=> b!247903 m!264807))

(declare-fun m!264809 () Bool)

(assert (=> b!247896 m!264809))

(declare-fun m!264811 () Bool)

(assert (=> bm!23210 m!264811))

(declare-fun m!264813 () Bool)

(assert (=> b!247898 m!264813))

(declare-fun m!264815 () Bool)

(assert (=> b!247891 m!264815))

(declare-fun m!264817 () Bool)

(assert (=> b!247901 m!264817))

(declare-fun m!264819 () Bool)

(assert (=> b!247901 m!264819))

(assert (=> b!247901 m!264819))

(declare-fun m!264821 () Bool)

(assert (=> b!247901 m!264821))

(declare-fun m!264823 () Bool)

(assert (=> b!247887 m!264823))

(declare-fun m!264825 () Bool)

(assert (=> b!247881 m!264825))

(declare-fun m!264827 () Bool)

(assert (=> b!247885 m!264827))

(declare-fun m!264829 () Bool)

(assert (=> bm!23209 m!264829))

(declare-fun m!264831 () Bool)

(assert (=> b!247884 m!264831))

(declare-fun m!264833 () Bool)

(assert (=> b!247884 m!264833))

(declare-fun m!264835 () Bool)

(assert (=> b!247890 m!264835))

(assert (=> b!247890 m!264811))

(declare-fun m!264837 () Bool)

(assert (=> b!247890 m!264837))

(declare-fun m!264839 () Bool)

(assert (=> b!247890 m!264839))

(declare-fun m!264841 () Bool)

(assert (=> b!247890 m!264841))

(declare-fun m!264843 () Bool)

(assert (=> b!247890 m!264843))

(declare-fun m!264845 () Bool)

(assert (=> b!247890 m!264845))

(declare-fun m!264847 () Bool)

(assert (=> b!247890 m!264847))

(declare-fun m!264849 () Bool)

(assert (=> mapNonEmpty!10964 m!264849))

(declare-fun m!264851 () Bool)

(assert (=> start!23578 m!264851))

(check-sat (not b_next!6597) (not mapNonEmpty!10964) (not b!247891) (not b!247884) (not b!247897) (not b!247896) b_and!13599 (not b!247881) (not bm!23209) (not start!23578) (not b!247898) (not b!247890) (not bm!23210) (not b!247901) tp_is_empty!6459 (not b!247903))
(check-sat b_and!13599 (not b_next!6597))
(get-model)

(declare-fun b!247988 () Bool)

(declare-fun e!160871 () SeekEntryResult!1107)

(assert (=> b!247988 (= e!160871 Undefined!1107)))

(declare-fun d!60483 () Bool)

(declare-fun lt!124168 () SeekEntryResult!1107)

(assert (=> d!60483 (and (or ((_ is Undefined!1107) lt!124168) (not ((_ is Found!1107) lt!124168)) (and (bvsge (index!6599 lt!124168) #b00000000000000000000000000000000) (bvslt (index!6599 lt!124168) (size!6144 (_keys!6707 thiss!1504))))) (or ((_ is Undefined!1107) lt!124168) ((_ is Found!1107) lt!124168) (not ((_ is MissingZero!1107) lt!124168)) (and (bvsge (index!6598 lt!124168) #b00000000000000000000000000000000) (bvslt (index!6598 lt!124168) (size!6144 (_keys!6707 thiss!1504))))) (or ((_ is Undefined!1107) lt!124168) ((_ is Found!1107) lt!124168) ((_ is MissingZero!1107) lt!124168) (not ((_ is MissingVacant!1107) lt!124168)) (and (bvsge (index!6601 lt!124168) #b00000000000000000000000000000000) (bvslt (index!6601 lt!124168) (size!6144 (_keys!6707 thiss!1504))))) (or ((_ is Undefined!1107) lt!124168) (ite ((_ is Found!1107) lt!124168) (= (select (arr!5801 (_keys!6707 thiss!1504)) (index!6599 lt!124168)) key!932) (ite ((_ is MissingZero!1107) lt!124168) (= (select (arr!5801 (_keys!6707 thiss!1504)) (index!6598 lt!124168)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1107) lt!124168) (= (select (arr!5801 (_keys!6707 thiss!1504)) (index!6601 lt!124168)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60483 (= lt!124168 e!160871)))

(declare-fun c!41531 () Bool)

(declare-fun lt!124170 () SeekEntryResult!1107)

(assert (=> d!60483 (= c!41531 (and ((_ is Intermediate!1107) lt!124170) (undefined!1919 lt!124170)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12227 (_ BitVec 32)) SeekEntryResult!1107)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60483 (= lt!124170 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10727 thiss!1504)) key!932 (_keys!6707 thiss!1504) (mask!10727 thiss!1504)))))

(assert (=> d!60483 (validMask!0 (mask!10727 thiss!1504))))

(assert (=> d!60483 (= (seekEntryOrOpen!0 key!932 (_keys!6707 thiss!1504) (mask!10727 thiss!1504)) lt!124168)))

(declare-fun e!160870 () SeekEntryResult!1107)

(declare-fun b!247989 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12227 (_ BitVec 32)) SeekEntryResult!1107)

(assert (=> b!247989 (= e!160870 (seekKeyOrZeroReturnVacant!0 (x!24551 lt!124170) (index!6600 lt!124170) (index!6600 lt!124170) key!932 (_keys!6707 thiss!1504) (mask!10727 thiss!1504)))))

(declare-fun b!247990 () Bool)

(declare-fun c!41529 () Bool)

(declare-fun lt!124169 () (_ BitVec 64))

(assert (=> b!247990 (= c!41529 (= lt!124169 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!160872 () SeekEntryResult!1107)

(assert (=> b!247990 (= e!160872 e!160870)))

(declare-fun b!247991 () Bool)

(assert (=> b!247991 (= e!160871 e!160872)))

(assert (=> b!247991 (= lt!124169 (select (arr!5801 (_keys!6707 thiss!1504)) (index!6600 lt!124170)))))

(declare-fun c!41530 () Bool)

(assert (=> b!247991 (= c!41530 (= lt!124169 key!932))))

(declare-fun b!247992 () Bool)

(assert (=> b!247992 (= e!160870 (MissingZero!1107 (index!6600 lt!124170)))))

(declare-fun b!247993 () Bool)

(assert (=> b!247993 (= e!160872 (Found!1107 (index!6600 lt!124170)))))

(assert (= (and d!60483 c!41531) b!247988))

(assert (= (and d!60483 (not c!41531)) b!247991))

(assert (= (and b!247991 c!41530) b!247993))

(assert (= (and b!247991 (not c!41530)) b!247990))

(assert (= (and b!247990 c!41529) b!247992))

(assert (= (and b!247990 (not c!41529)) b!247989))

(declare-fun m!264901 () Bool)

(assert (=> d!60483 m!264901))

(declare-fun m!264903 () Bool)

(assert (=> d!60483 m!264903))

(declare-fun m!264905 () Bool)

(assert (=> d!60483 m!264905))

(assert (=> d!60483 m!264835))

(assert (=> d!60483 m!264903))

(declare-fun m!264907 () Bool)

(assert (=> d!60483 m!264907))

(declare-fun m!264909 () Bool)

(assert (=> d!60483 m!264909))

(declare-fun m!264911 () Bool)

(assert (=> b!247989 m!264911))

(declare-fun m!264913 () Bool)

(assert (=> b!247991 m!264913))

(assert (=> b!247891 d!60483))

(declare-fun d!60485 () Bool)

(assert (=> d!60485 (= (array_inv!3831 (_keys!6707 thiss!1504)) (bvsge (size!6144 (_keys!6707 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!247884 d!60485))

(declare-fun d!60487 () Bool)

(assert (=> d!60487 (= (array_inv!3832 (_values!4568 thiss!1504)) (bvsge (size!6143 (_values!4568 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!247884 d!60487))

(declare-fun d!60489 () Bool)

(assert (=> d!60489 (= (inRange!0 index!297 (mask!10727 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10727 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!247901 d!60489))

(declare-fun d!60491 () Bool)

(declare-fun e!160878 () Bool)

(assert (=> d!60491 e!160878))

(declare-fun res!121534 () Bool)

(assert (=> d!60491 (=> res!121534 e!160878)))

(declare-fun lt!124180 () Bool)

(assert (=> d!60491 (= res!121534 (not lt!124180))))

(declare-fun lt!124179 () Bool)

(assert (=> d!60491 (= lt!124180 lt!124179)))

(declare-fun lt!124182 () Unit!7673)

(declare-fun e!160877 () Unit!7673)

(assert (=> d!60491 (= lt!124182 e!160877)))

(declare-fun c!41534 () Bool)

(assert (=> d!60491 (= c!41534 lt!124179)))

(declare-fun containsKey!285 (List!3702 (_ BitVec 64)) Bool)

(assert (=> d!60491 (= lt!124179 (containsKey!285 (toList!1882 (getCurrentListMap!1410 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4585 thiss!1504))) key!932))))

(assert (=> d!60491 (= (contains!1796 (getCurrentListMap!1410 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4585 thiss!1504)) key!932) lt!124180)))

(declare-fun b!248000 () Bool)

(declare-fun lt!124181 () Unit!7673)

(assert (=> b!248000 (= e!160877 lt!124181)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!233 (List!3702 (_ BitVec 64)) Unit!7673)

(assert (=> b!248000 (= lt!124181 (lemmaContainsKeyImpliesGetValueByKeyDefined!233 (toList!1882 (getCurrentListMap!1410 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4585 thiss!1504))) key!932))))

(declare-datatypes ((Option!299 0))(
  ( (Some!298 (v!5334 V!8259)) (None!297) )
))
(declare-fun isDefined!234 (Option!299) Bool)

(declare-fun getValueByKey!293 (List!3702 (_ BitVec 64)) Option!299)

(assert (=> b!248000 (isDefined!234 (getValueByKey!293 (toList!1882 (getCurrentListMap!1410 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4585 thiss!1504))) key!932))))

(declare-fun b!248001 () Bool)

(declare-fun Unit!7681 () Unit!7673)

(assert (=> b!248001 (= e!160877 Unit!7681)))

(declare-fun b!248002 () Bool)

(assert (=> b!248002 (= e!160878 (isDefined!234 (getValueByKey!293 (toList!1882 (getCurrentListMap!1410 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4585 thiss!1504))) key!932)))))

(assert (= (and d!60491 c!41534) b!248000))

(assert (= (and d!60491 (not c!41534)) b!248001))

(assert (= (and d!60491 (not res!121534)) b!248002))

(declare-fun m!264915 () Bool)

(assert (=> d!60491 m!264915))

(declare-fun m!264917 () Bool)

(assert (=> b!248000 m!264917))

(declare-fun m!264919 () Bool)

(assert (=> b!248000 m!264919))

(assert (=> b!248000 m!264919))

(declare-fun m!264921 () Bool)

(assert (=> b!248000 m!264921))

(assert (=> b!248002 m!264919))

(assert (=> b!248002 m!264919))

(assert (=> b!248002 m!264921))

(assert (=> b!247901 d!60491))

(declare-fun b!248045 () Bool)

(declare-fun e!160905 () Bool)

(assert (=> b!248045 (= e!160905 (validKeyInArray!0 (select (arr!5801 (_keys!6707 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23231 () Bool)

(declare-fun call!23240 () Bool)

(declare-fun lt!124231 () ListLongMap!3733)

(assert (=> bm!23231 (= call!23240 (contains!1796 lt!124231 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!248046 () Bool)

(declare-fun e!160912 () Bool)

(assert (=> b!248046 (= e!160912 (validKeyInArray!0 (select (arr!5801 (_keys!6707 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248047 () Bool)

(declare-fun e!160913 () Bool)

(declare-fun e!160907 () Bool)

(assert (=> b!248047 (= e!160913 e!160907)))

(declare-fun res!121558 () Bool)

(assert (=> b!248047 (= res!121558 call!23240)))

(assert (=> b!248047 (=> (not res!121558) (not e!160907))))

(declare-fun b!248048 () Bool)

(declare-fun e!160906 () ListLongMap!3733)

(declare-fun call!23239 () ListLongMap!3733)

(assert (=> b!248048 (= e!160906 call!23239)))

(declare-fun b!248049 () Bool)

(declare-fun e!160910 () Unit!7673)

(declare-fun lt!124239 () Unit!7673)

(assert (=> b!248049 (= e!160910 lt!124239)))

(declare-fun lt!124230 () ListLongMap!3733)

(declare-fun getCurrentListMapNoExtraKeys!557 (array!12227 array!12225 (_ BitVec 32) (_ BitVec 32) V!8259 V!8259 (_ BitVec 32) Int) ListLongMap!3733)

(assert (=> b!248049 (= lt!124230 (getCurrentListMapNoExtraKeys!557 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4585 thiss!1504)))))

(declare-fun lt!124244 () (_ BitVec 64))

(assert (=> b!248049 (= lt!124244 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124236 () (_ BitVec 64))

(assert (=> b!248049 (= lt!124236 (select (arr!5801 (_keys!6707 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124247 () Unit!7673)

(declare-fun addStillContains!211 (ListLongMap!3733 (_ BitVec 64) V!8259 (_ BitVec 64)) Unit!7673)

(assert (=> b!248049 (= lt!124247 (addStillContains!211 lt!124230 lt!124244 (zeroValue!4426 thiss!1504) lt!124236))))

(declare-fun +!662 (ListLongMap!3733 tuple2!4820) ListLongMap!3733)

(assert (=> b!248049 (contains!1796 (+!662 lt!124230 (tuple2!4821 lt!124244 (zeroValue!4426 thiss!1504))) lt!124236)))

(declare-fun lt!124233 () Unit!7673)

(assert (=> b!248049 (= lt!124233 lt!124247)))

(declare-fun lt!124234 () ListLongMap!3733)

(assert (=> b!248049 (= lt!124234 (getCurrentListMapNoExtraKeys!557 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4585 thiss!1504)))))

(declare-fun lt!124242 () (_ BitVec 64))

(assert (=> b!248049 (= lt!124242 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124241 () (_ BitVec 64))

(assert (=> b!248049 (= lt!124241 (select (arr!5801 (_keys!6707 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124229 () Unit!7673)

(declare-fun addApplyDifferent!211 (ListLongMap!3733 (_ BitVec 64) V!8259 (_ BitVec 64)) Unit!7673)

(assert (=> b!248049 (= lt!124229 (addApplyDifferent!211 lt!124234 lt!124242 (minValue!4426 thiss!1504) lt!124241))))

(declare-fun apply!235 (ListLongMap!3733 (_ BitVec 64)) V!8259)

(assert (=> b!248049 (= (apply!235 (+!662 lt!124234 (tuple2!4821 lt!124242 (minValue!4426 thiss!1504))) lt!124241) (apply!235 lt!124234 lt!124241))))

(declare-fun lt!124248 () Unit!7673)

(assert (=> b!248049 (= lt!124248 lt!124229)))

(declare-fun lt!124228 () ListLongMap!3733)

(assert (=> b!248049 (= lt!124228 (getCurrentListMapNoExtraKeys!557 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4585 thiss!1504)))))

(declare-fun lt!124227 () (_ BitVec 64))

(assert (=> b!248049 (= lt!124227 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124246 () (_ BitVec 64))

(assert (=> b!248049 (= lt!124246 (select (arr!5801 (_keys!6707 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124243 () Unit!7673)

(assert (=> b!248049 (= lt!124243 (addApplyDifferent!211 lt!124228 lt!124227 (zeroValue!4426 thiss!1504) lt!124246))))

(assert (=> b!248049 (= (apply!235 (+!662 lt!124228 (tuple2!4821 lt!124227 (zeroValue!4426 thiss!1504))) lt!124246) (apply!235 lt!124228 lt!124246))))

(declare-fun lt!124235 () Unit!7673)

(assert (=> b!248049 (= lt!124235 lt!124243)))

(declare-fun lt!124245 () ListLongMap!3733)

(assert (=> b!248049 (= lt!124245 (getCurrentListMapNoExtraKeys!557 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4585 thiss!1504)))))

(declare-fun lt!124238 () (_ BitVec 64))

(assert (=> b!248049 (= lt!124238 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124237 () (_ BitVec 64))

(assert (=> b!248049 (= lt!124237 (select (arr!5801 (_keys!6707 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248049 (= lt!124239 (addApplyDifferent!211 lt!124245 lt!124238 (minValue!4426 thiss!1504) lt!124237))))

(assert (=> b!248049 (= (apply!235 (+!662 lt!124245 (tuple2!4821 lt!124238 (minValue!4426 thiss!1504))) lt!124237) (apply!235 lt!124245 lt!124237))))

(declare-fun b!248050 () Bool)

(declare-fun e!160915 () Bool)

(declare-fun get!2976 (ValueCell!2886 V!8259) V!8259)

(declare-fun dynLambda!578 (Int (_ BitVec 64)) V!8259)

(assert (=> b!248050 (= e!160915 (= (apply!235 lt!124231 (select (arr!5801 (_keys!6707 thiss!1504)) #b00000000000000000000000000000000)) (get!2976 (select (arr!5800 (_values!4568 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!578 (defaultEntry!4585 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!248050 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6143 (_values!4568 thiss!1504))))))

(assert (=> b!248050 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6144 (_keys!6707 thiss!1504))))))

(declare-fun b!248052 () Bool)

(declare-fun e!160916 () Bool)

(declare-fun e!160909 () Bool)

(assert (=> b!248052 (= e!160916 e!160909)))

(declare-fun res!121561 () Bool)

(declare-fun call!23237 () Bool)

(assert (=> b!248052 (= res!121561 call!23237)))

(assert (=> b!248052 (=> (not res!121561) (not e!160909))))

(declare-fun b!248053 () Bool)

(assert (=> b!248053 (= e!160907 (= (apply!235 lt!124231 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4426 thiss!1504)))))

(declare-fun c!41550 () Bool)

(declare-fun bm!23232 () Bool)

(declare-fun call!23234 () ListLongMap!3733)

(declare-fun call!23236 () ListLongMap!3733)

(declare-fun c!41552 () Bool)

(declare-fun call!23235 () ListLongMap!3733)

(assert (=> bm!23232 (= call!23234 (+!662 (ite c!41552 call!23235 (ite c!41550 call!23236 call!23239)) (ite (or c!41552 c!41550) (tuple2!4821 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4426 thiss!1504)) (tuple2!4821 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4426 thiss!1504)))))))

(declare-fun b!248054 () Bool)

(assert (=> b!248054 (= e!160916 (not call!23237))))

(declare-fun b!248055 () Bool)

(declare-fun e!160908 () Bool)

(assert (=> b!248055 (= e!160908 e!160916)))

(declare-fun c!41551 () Bool)

(assert (=> b!248055 (= c!41551 (not (= (bvand (extraKeys!4322 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!248056 () Bool)

(declare-fun Unit!7682 () Unit!7673)

(assert (=> b!248056 (= e!160910 Unit!7682)))

(declare-fun bm!23233 () Bool)

(assert (=> bm!23233 (= call!23236 call!23235)))

(declare-fun bm!23234 () Bool)

(assert (=> bm!23234 (= call!23235 (getCurrentListMapNoExtraKeys!557 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4585 thiss!1504)))))

(declare-fun b!248057 () Bool)

(declare-fun e!160917 () ListLongMap!3733)

(assert (=> b!248057 (= e!160917 (+!662 call!23234 (tuple2!4821 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4426 thiss!1504))))))

(declare-fun bm!23235 () Bool)

(assert (=> bm!23235 (= call!23239 call!23236)))

(declare-fun b!248058 () Bool)

(assert (=> b!248058 (= e!160909 (= (apply!235 lt!124231 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4426 thiss!1504)))))

(declare-fun b!248059 () Bool)

(declare-fun e!160914 () ListLongMap!3733)

(declare-fun call!23238 () ListLongMap!3733)

(assert (=> b!248059 (= e!160914 call!23238)))

(declare-fun b!248060 () Bool)

(declare-fun c!41548 () Bool)

(assert (=> b!248060 (= c!41548 (and (not (= (bvand (extraKeys!4322 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4322 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!248060 (= e!160914 e!160906)))

(declare-fun b!248061 () Bool)

(declare-fun res!121559 () Bool)

(assert (=> b!248061 (=> (not res!121559) (not e!160908))))

(declare-fun e!160911 () Bool)

(assert (=> b!248061 (= res!121559 e!160911)))

(declare-fun res!121555 () Bool)

(assert (=> b!248061 (=> res!121555 e!160911)))

(assert (=> b!248061 (= res!121555 (not e!160905))))

(declare-fun res!121560 () Bool)

(assert (=> b!248061 (=> (not res!121560) (not e!160905))))

(assert (=> b!248061 (= res!121560 (bvslt #b00000000000000000000000000000000 (size!6144 (_keys!6707 thiss!1504))))))

(declare-fun b!248062 () Bool)

(assert (=> b!248062 (= e!160917 e!160914)))

(assert (=> b!248062 (= c!41550 (and (not (= (bvand (extraKeys!4322 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4322 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!248063 () Bool)

(declare-fun res!121556 () Bool)

(assert (=> b!248063 (=> (not res!121556) (not e!160908))))

(assert (=> b!248063 (= res!121556 e!160913)))

(declare-fun c!41547 () Bool)

(assert (=> b!248063 (= c!41547 (not (= (bvand (extraKeys!4322 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!248064 () Bool)

(assert (=> b!248064 (= e!160906 call!23238)))

(declare-fun bm!23236 () Bool)

(assert (=> bm!23236 (= call!23238 call!23234)))

(declare-fun d!60493 () Bool)

(assert (=> d!60493 e!160908))

(declare-fun res!121553 () Bool)

(assert (=> d!60493 (=> (not res!121553) (not e!160908))))

(assert (=> d!60493 (= res!121553 (or (bvsge #b00000000000000000000000000000000 (size!6144 (_keys!6707 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6144 (_keys!6707 thiss!1504))))))))

(declare-fun lt!124232 () ListLongMap!3733)

(assert (=> d!60493 (= lt!124231 lt!124232)))

(declare-fun lt!124240 () Unit!7673)

(assert (=> d!60493 (= lt!124240 e!160910)))

(declare-fun c!41549 () Bool)

(assert (=> d!60493 (= c!41549 e!160912)))

(declare-fun res!121557 () Bool)

(assert (=> d!60493 (=> (not res!121557) (not e!160912))))

(assert (=> d!60493 (= res!121557 (bvslt #b00000000000000000000000000000000 (size!6144 (_keys!6707 thiss!1504))))))

(assert (=> d!60493 (= lt!124232 e!160917)))

(assert (=> d!60493 (= c!41552 (and (not (= (bvand (extraKeys!4322 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4322 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60493 (validMask!0 (mask!10727 thiss!1504))))

(assert (=> d!60493 (= (getCurrentListMap!1410 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4585 thiss!1504)) lt!124231)))

(declare-fun b!248051 () Bool)

(assert (=> b!248051 (= e!160911 e!160915)))

(declare-fun res!121554 () Bool)

(assert (=> b!248051 (=> (not res!121554) (not e!160915))))

(assert (=> b!248051 (= res!121554 (contains!1796 lt!124231 (select (arr!5801 (_keys!6707 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!248051 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6144 (_keys!6707 thiss!1504))))))

(declare-fun b!248065 () Bool)

(assert (=> b!248065 (= e!160913 (not call!23240))))

(declare-fun bm!23237 () Bool)

(assert (=> bm!23237 (= call!23237 (contains!1796 lt!124231 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60493 c!41552) b!248057))

(assert (= (and d!60493 (not c!41552)) b!248062))

(assert (= (and b!248062 c!41550) b!248059))

(assert (= (and b!248062 (not c!41550)) b!248060))

(assert (= (and b!248060 c!41548) b!248064))

(assert (= (and b!248060 (not c!41548)) b!248048))

(assert (= (or b!248064 b!248048) bm!23235))

(assert (= (or b!248059 bm!23235) bm!23233))

(assert (= (or b!248059 b!248064) bm!23236))

(assert (= (or b!248057 bm!23233) bm!23234))

(assert (= (or b!248057 bm!23236) bm!23232))

(assert (= (and d!60493 res!121557) b!248046))

(assert (= (and d!60493 c!41549) b!248049))

(assert (= (and d!60493 (not c!41549)) b!248056))

(assert (= (and d!60493 res!121553) b!248061))

(assert (= (and b!248061 res!121560) b!248045))

(assert (= (and b!248061 (not res!121555)) b!248051))

(assert (= (and b!248051 res!121554) b!248050))

(assert (= (and b!248061 res!121559) b!248063))

(assert (= (and b!248063 c!41547) b!248047))

(assert (= (and b!248063 (not c!41547)) b!248065))

(assert (= (and b!248047 res!121558) b!248053))

(assert (= (or b!248047 b!248065) bm!23231))

(assert (= (and b!248063 res!121556) b!248055))

(assert (= (and b!248055 c!41551) b!248052))

(assert (= (and b!248055 (not c!41551)) b!248054))

(assert (= (and b!248052 res!121561) b!248058))

(assert (= (or b!248052 b!248054) bm!23237))

(declare-fun b_lambda!8051 () Bool)

(assert (=> (not b_lambda!8051) (not b!248050)))

(declare-fun t!8727 () Bool)

(declare-fun tb!2983 () Bool)

(assert (=> (and b!247884 (= (defaultEntry!4585 thiss!1504) (defaultEntry!4585 thiss!1504)) t!8727) tb!2983))

(declare-fun result!5271 () Bool)

(assert (=> tb!2983 (= result!5271 tp_is_empty!6459)))

(assert (=> b!248050 t!8727))

(declare-fun b_and!13603 () Bool)

(assert (= b_and!13599 (and (=> t!8727 result!5271) b_and!13603)))

(declare-fun m!264923 () Bool)

(assert (=> bm!23231 m!264923))

(declare-fun m!264925 () Bool)

(assert (=> b!248049 m!264925))

(declare-fun m!264927 () Bool)

(assert (=> b!248049 m!264927))

(declare-fun m!264929 () Bool)

(assert (=> b!248049 m!264929))

(declare-fun m!264931 () Bool)

(assert (=> b!248049 m!264931))

(declare-fun m!264933 () Bool)

(assert (=> b!248049 m!264933))

(declare-fun m!264935 () Bool)

(assert (=> b!248049 m!264935))

(declare-fun m!264937 () Bool)

(assert (=> b!248049 m!264937))

(declare-fun m!264939 () Bool)

(assert (=> b!248049 m!264939))

(declare-fun m!264941 () Bool)

(assert (=> b!248049 m!264941))

(declare-fun m!264943 () Bool)

(assert (=> b!248049 m!264943))

(declare-fun m!264945 () Bool)

(assert (=> b!248049 m!264945))

(assert (=> b!248049 m!264927))

(declare-fun m!264947 () Bool)

(assert (=> b!248049 m!264947))

(declare-fun m!264949 () Bool)

(assert (=> b!248049 m!264949))

(declare-fun m!264951 () Bool)

(assert (=> b!248049 m!264951))

(assert (=> b!248049 m!264933))

(assert (=> b!248049 m!264949))

(declare-fun m!264953 () Bool)

(assert (=> b!248049 m!264953))

(assert (=> b!248049 m!264937))

(declare-fun m!264955 () Bool)

(assert (=> b!248049 m!264955))

(declare-fun m!264957 () Bool)

(assert (=> b!248049 m!264957))

(declare-fun m!264959 () Bool)

(assert (=> bm!23232 m!264959))

(assert (=> b!248050 m!264941))

(declare-fun m!264961 () Bool)

(assert (=> b!248050 m!264961))

(assert (=> b!248050 m!264941))

(declare-fun m!264963 () Bool)

(assert (=> b!248050 m!264963))

(assert (=> b!248050 m!264963))

(declare-fun m!264965 () Bool)

(assert (=> b!248050 m!264965))

(declare-fun m!264967 () Bool)

(assert (=> b!248050 m!264967))

(assert (=> b!248050 m!264965))

(assert (=> b!248051 m!264941))

(assert (=> b!248051 m!264941))

(declare-fun m!264969 () Bool)

(assert (=> b!248051 m!264969))

(assert (=> b!248046 m!264941))

(assert (=> b!248046 m!264941))

(declare-fun m!264971 () Bool)

(assert (=> b!248046 m!264971))

(declare-fun m!264973 () Bool)

(assert (=> b!248058 m!264973))

(declare-fun m!264975 () Bool)

(assert (=> b!248053 m!264975))

(declare-fun m!264977 () Bool)

(assert (=> b!248057 m!264977))

(assert (=> bm!23234 m!264955))

(assert (=> d!60493 m!264835))

(assert (=> b!248045 m!264941))

(assert (=> b!248045 m!264941))

(assert (=> b!248045 m!264971))

(declare-fun m!264979 () Bool)

(assert (=> bm!23237 m!264979))

(assert (=> b!247901 d!60493))

(declare-fun b!248076 () Bool)

(declare-fun e!160926 () Bool)

(declare-fun call!23243 () Bool)

(assert (=> b!248076 (= e!160926 call!23243)))

(declare-fun b!248077 () Bool)

(declare-fun e!160924 () Bool)

(assert (=> b!248077 (= e!160926 e!160924)))

(declare-fun lt!124255 () (_ BitVec 64))

(assert (=> b!248077 (= lt!124255 (select (arr!5801 (_keys!6707 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124257 () Unit!7673)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12227 (_ BitVec 64) (_ BitVec 32)) Unit!7673)

(assert (=> b!248077 (= lt!124257 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6707 thiss!1504) lt!124255 #b00000000000000000000000000000000))))

(assert (=> b!248077 (arrayContainsKey!0 (_keys!6707 thiss!1504) lt!124255 #b00000000000000000000000000000000)))

(declare-fun lt!124256 () Unit!7673)

(assert (=> b!248077 (= lt!124256 lt!124257)))

(declare-fun res!121567 () Bool)

(assert (=> b!248077 (= res!121567 (= (seekEntryOrOpen!0 (select (arr!5801 (_keys!6707 thiss!1504)) #b00000000000000000000000000000000) (_keys!6707 thiss!1504) (mask!10727 thiss!1504)) (Found!1107 #b00000000000000000000000000000000)))))

(assert (=> b!248077 (=> (not res!121567) (not e!160924))))

(declare-fun bm!23240 () Bool)

(assert (=> bm!23240 (= call!23243 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6707 thiss!1504) (mask!10727 thiss!1504)))))

(declare-fun b!248078 () Bool)

(declare-fun e!160925 () Bool)

(assert (=> b!248078 (= e!160925 e!160926)))

(declare-fun c!41555 () Bool)

(assert (=> b!248078 (= c!41555 (validKeyInArray!0 (select (arr!5801 (_keys!6707 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248079 () Bool)

(assert (=> b!248079 (= e!160924 call!23243)))

(declare-fun d!60495 () Bool)

(declare-fun res!121566 () Bool)

(assert (=> d!60495 (=> res!121566 e!160925)))

(assert (=> d!60495 (= res!121566 (bvsge #b00000000000000000000000000000000 (size!6144 (_keys!6707 thiss!1504))))))

(assert (=> d!60495 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6707 thiss!1504) (mask!10727 thiss!1504)) e!160925)))

(assert (= (and d!60495 (not res!121566)) b!248078))

(assert (= (and b!248078 c!41555) b!248077))

(assert (= (and b!248078 (not c!41555)) b!248076))

(assert (= (and b!248077 res!121567) b!248079))

(assert (= (or b!248079 b!248076) bm!23240))

(assert (=> b!248077 m!264941))

(declare-fun m!264981 () Bool)

(assert (=> b!248077 m!264981))

(declare-fun m!264983 () Bool)

(assert (=> b!248077 m!264983))

(assert (=> b!248077 m!264941))

(declare-fun m!264985 () Bool)

(assert (=> b!248077 m!264985))

(declare-fun m!264987 () Bool)

(assert (=> bm!23240 m!264987))

(assert (=> b!248078 m!264941))

(assert (=> b!248078 m!264941))

(assert (=> b!248078 m!264971))

(assert (=> b!247903 d!60495))

(declare-fun d!60497 () Bool)

(assert (=> d!60497 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!247896 d!60497))

(declare-fun d!60499 () Bool)

(declare-fun e!160929 () Bool)

(assert (=> d!60499 e!160929))

(declare-fun res!121573 () Bool)

(assert (=> d!60499 (=> (not res!121573) (not e!160929))))

(declare-fun lt!124262 () SeekEntryResult!1107)

(assert (=> d!60499 (= res!121573 ((_ is Found!1107) lt!124262))))

(assert (=> d!60499 (= lt!124262 (seekEntryOrOpen!0 key!932 (_keys!6707 thiss!1504) (mask!10727 thiss!1504)))))

(declare-fun lt!124263 () Unit!7673)

(declare-fun choose!1164 (array!12227 array!12225 (_ BitVec 32) (_ BitVec 32) V!8259 V!8259 (_ BitVec 64) Int) Unit!7673)

(assert (=> d!60499 (= lt!124263 (choose!1164 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) key!932 (defaultEntry!4585 thiss!1504)))))

(assert (=> d!60499 (validMask!0 (mask!10727 thiss!1504))))

(assert (=> d!60499 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!386 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) key!932 (defaultEntry!4585 thiss!1504)) lt!124263)))

(declare-fun b!248084 () Bool)

(declare-fun res!121572 () Bool)

(assert (=> b!248084 (=> (not res!121572) (not e!160929))))

(assert (=> b!248084 (= res!121572 (inRange!0 (index!6599 lt!124262) (mask!10727 thiss!1504)))))

(declare-fun b!248085 () Bool)

(assert (=> b!248085 (= e!160929 (= (select (arr!5801 (_keys!6707 thiss!1504)) (index!6599 lt!124262)) key!932))))

(assert (=> b!248085 (and (bvsge (index!6599 lt!124262) #b00000000000000000000000000000000) (bvslt (index!6599 lt!124262) (size!6144 (_keys!6707 thiss!1504))))))

(assert (= (and d!60499 res!121573) b!248084))

(assert (= (and b!248084 res!121572) b!248085))

(assert (=> d!60499 m!264815))

(declare-fun m!264989 () Bool)

(assert (=> d!60499 m!264989))

(assert (=> d!60499 m!264835))

(declare-fun m!264991 () Bool)

(assert (=> b!248084 m!264991))

(declare-fun m!264993 () Bool)

(assert (=> b!248085 m!264993))

(assert (=> b!247898 d!60499))

(declare-fun d!60501 () Bool)

(assert (=> d!60501 (contains!1796 (getCurrentListMap!1410 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4585 thiss!1504)) key!932)))

(declare-fun lt!124266 () Unit!7673)

(declare-fun choose!1165 (array!12227 array!12225 (_ BitVec 32) (_ BitVec 32) V!8259 V!8259 (_ BitVec 64) (_ BitVec 32) Int) Unit!7673)

(assert (=> d!60501 (= lt!124266 (choose!1165 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4585 thiss!1504)))))

(assert (=> d!60501 (validMask!0 (mask!10727 thiss!1504))))

(assert (=> d!60501 (= (lemmaArrayContainsKeyThenInListMap!190 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4585 thiss!1504)) lt!124266)))

(declare-fun bs!8931 () Bool)

(assert (= bs!8931 d!60501))

(assert (=> bs!8931 m!264819))

(assert (=> bs!8931 m!264819))

(assert (=> bs!8931 m!264821))

(declare-fun m!264995 () Bool)

(assert (=> bs!8931 m!264995))

(assert (=> bs!8931 m!264835))

(assert (=> b!247897 d!60501))

(declare-fun d!60503 () Bool)

(assert (=> d!60503 (= (inRange!0 (ite c!41509 (index!6598 lt!124128) (index!6601 lt!124128)) (mask!10727 thiss!1504)) (and (bvsge (ite c!41509 (index!6598 lt!124128) (index!6601 lt!124128)) #b00000000000000000000000000000000) (bvslt (ite c!41509 (index!6598 lt!124128) (index!6601 lt!124128)) (bvadd (mask!10727 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23209 d!60503))

(declare-fun b!248094 () Bool)

(declare-fun res!121582 () Bool)

(declare-fun e!160935 () Bool)

(assert (=> b!248094 (=> (not res!121582) (not e!160935))))

(assert (=> b!248094 (= res!121582 (not (validKeyInArray!0 (select (arr!5801 (_keys!6707 thiss!1504)) index!297))))))

(declare-fun e!160934 () Bool)

(declare-fun b!248097 () Bool)

(assert (=> b!248097 (= e!160934 (= (arrayCountValidKeys!0 (array!12228 (store (arr!5801 (_keys!6707 thiss!1504)) index!297 key!932) (size!6144 (_keys!6707 thiss!1504))) #b00000000000000000000000000000000 (size!6144 (_keys!6707 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6707 thiss!1504) #b00000000000000000000000000000000 (size!6144 (_keys!6707 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun d!60505 () Bool)

(assert (=> d!60505 e!160934))

(declare-fun res!121585 () Bool)

(assert (=> d!60505 (=> (not res!121585) (not e!160934))))

(assert (=> d!60505 (= res!121585 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6144 (_keys!6707 thiss!1504)))))))

(declare-fun lt!124269 () Unit!7673)

(declare-fun choose!1 (array!12227 (_ BitVec 32) (_ BitVec 64)) Unit!7673)

(assert (=> d!60505 (= lt!124269 (choose!1 (_keys!6707 thiss!1504) index!297 key!932))))

(assert (=> d!60505 e!160935))

(declare-fun res!121583 () Bool)

(assert (=> d!60505 (=> (not res!121583) (not e!160935))))

(assert (=> d!60505 (= res!121583 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6144 (_keys!6707 thiss!1504)))))))

(assert (=> d!60505 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6707 thiss!1504) index!297 key!932) lt!124269)))

(declare-fun b!248095 () Bool)

(declare-fun res!121584 () Bool)

(assert (=> b!248095 (=> (not res!121584) (not e!160935))))

(assert (=> b!248095 (= res!121584 (validKeyInArray!0 key!932))))

(declare-fun b!248096 () Bool)

(assert (=> b!248096 (= e!160935 (bvslt (size!6144 (_keys!6707 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!60505 res!121583) b!248094))

(assert (= (and b!248094 res!121582) b!248095))

(assert (= (and b!248095 res!121584) b!248096))

(assert (= (and d!60505 res!121585) b!248097))

(declare-fun m!264997 () Bool)

(assert (=> b!248094 m!264997))

(assert (=> b!248094 m!264997))

(declare-fun m!264999 () Bool)

(assert (=> b!248094 m!264999))

(assert (=> b!248097 m!264843))

(declare-fun m!265001 () Bool)

(assert (=> b!248097 m!265001))

(assert (=> b!248097 m!264845))

(declare-fun m!265003 () Bool)

(assert (=> d!60505 m!265003))

(assert (=> b!248095 m!264809))

(assert (=> b!247890 d!60505))

(declare-fun d!60507 () Bool)

(declare-fun res!121590 () Bool)

(declare-fun e!160940 () Bool)

(assert (=> d!60507 (=> res!121590 e!160940)))

(assert (=> d!60507 (= res!121590 (= (select (arr!5801 (_keys!6707 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60507 (= (arrayContainsKey!0 (_keys!6707 thiss!1504) key!932 #b00000000000000000000000000000000) e!160940)))

(declare-fun b!248102 () Bool)

(declare-fun e!160941 () Bool)

(assert (=> b!248102 (= e!160940 e!160941)))

(declare-fun res!121591 () Bool)

(assert (=> b!248102 (=> (not res!121591) (not e!160941))))

(assert (=> b!248102 (= res!121591 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6144 (_keys!6707 thiss!1504))))))

(declare-fun b!248103 () Bool)

(assert (=> b!248103 (= e!160941 (arrayContainsKey!0 (_keys!6707 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60507 (not res!121590)) b!248102))

(assert (= (and b!248102 res!121591) b!248103))

(assert (=> d!60507 m!264941))

(declare-fun m!265005 () Bool)

(assert (=> b!248103 m!265005))

(assert (=> b!247890 d!60507))

(declare-fun d!60509 () Bool)

(declare-fun lt!124272 () (_ BitVec 32))

(assert (=> d!60509 (and (bvsge lt!124272 #b00000000000000000000000000000000) (bvsle lt!124272 (bvsub (size!6144 (_keys!6707 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!160947 () (_ BitVec 32))

(assert (=> d!60509 (= lt!124272 e!160947)))

(declare-fun c!41560 () Bool)

(assert (=> d!60509 (= c!41560 (bvsge #b00000000000000000000000000000000 (size!6144 (_keys!6707 thiss!1504))))))

(assert (=> d!60509 (and (bvsle #b00000000000000000000000000000000 (size!6144 (_keys!6707 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6144 (_keys!6707 thiss!1504)) (size!6144 (_keys!6707 thiss!1504))))))

(assert (=> d!60509 (= (arrayCountValidKeys!0 (_keys!6707 thiss!1504) #b00000000000000000000000000000000 (size!6144 (_keys!6707 thiss!1504))) lt!124272)))

(declare-fun b!248112 () Bool)

(declare-fun e!160946 () (_ BitVec 32))

(assert (=> b!248112 (= e!160947 e!160946)))

(declare-fun c!41561 () Bool)

(assert (=> b!248112 (= c!41561 (validKeyInArray!0 (select (arr!5801 (_keys!6707 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248113 () Bool)

(declare-fun call!23246 () (_ BitVec 32))

(assert (=> b!248113 (= e!160946 (bvadd #b00000000000000000000000000000001 call!23246))))

(declare-fun b!248114 () Bool)

(assert (=> b!248114 (= e!160947 #b00000000000000000000000000000000)))

(declare-fun b!248115 () Bool)

(assert (=> b!248115 (= e!160946 call!23246)))

(declare-fun bm!23243 () Bool)

(assert (=> bm!23243 (= call!23246 (arrayCountValidKeys!0 (_keys!6707 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6144 (_keys!6707 thiss!1504))))))

(assert (= (and d!60509 c!41560) b!248114))

(assert (= (and d!60509 (not c!41560)) b!248112))

(assert (= (and b!248112 c!41561) b!248113))

(assert (= (and b!248112 (not c!41561)) b!248115))

(assert (= (or b!248113 b!248115) bm!23243))

(assert (=> b!248112 m!264941))

(assert (=> b!248112 m!264941))

(assert (=> b!248112 m!264971))

(declare-fun m!265007 () Bool)

(assert (=> bm!23243 m!265007))

(assert (=> b!247890 d!60509))

(declare-fun d!60511 () Bool)

(assert (=> d!60511 (= (validMask!0 (mask!10727 thiss!1504)) (and (or (= (mask!10727 thiss!1504) #b00000000000000000000000000000111) (= (mask!10727 thiss!1504) #b00000000000000000000000000001111) (= (mask!10727 thiss!1504) #b00000000000000000000000000011111) (= (mask!10727 thiss!1504) #b00000000000000000000000000111111) (= (mask!10727 thiss!1504) #b00000000000000000000000001111111) (= (mask!10727 thiss!1504) #b00000000000000000000000011111111) (= (mask!10727 thiss!1504) #b00000000000000000000000111111111) (= (mask!10727 thiss!1504) #b00000000000000000000001111111111) (= (mask!10727 thiss!1504) #b00000000000000000000011111111111) (= (mask!10727 thiss!1504) #b00000000000000000000111111111111) (= (mask!10727 thiss!1504) #b00000000000000000001111111111111) (= (mask!10727 thiss!1504) #b00000000000000000011111111111111) (= (mask!10727 thiss!1504) #b00000000000000000111111111111111) (= (mask!10727 thiss!1504) #b00000000000000001111111111111111) (= (mask!10727 thiss!1504) #b00000000000000011111111111111111) (= (mask!10727 thiss!1504) #b00000000000000111111111111111111) (= (mask!10727 thiss!1504) #b00000000000001111111111111111111) (= (mask!10727 thiss!1504) #b00000000000011111111111111111111) (= (mask!10727 thiss!1504) #b00000000000111111111111111111111) (= (mask!10727 thiss!1504) #b00000000001111111111111111111111) (= (mask!10727 thiss!1504) #b00000000011111111111111111111111) (= (mask!10727 thiss!1504) #b00000000111111111111111111111111) (= (mask!10727 thiss!1504) #b00000001111111111111111111111111) (= (mask!10727 thiss!1504) #b00000011111111111111111111111111) (= (mask!10727 thiss!1504) #b00000111111111111111111111111111) (= (mask!10727 thiss!1504) #b00001111111111111111111111111111) (= (mask!10727 thiss!1504) #b00011111111111111111111111111111) (= (mask!10727 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10727 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!247890 d!60511))

(declare-fun d!60513 () Bool)

(declare-fun lt!124273 () (_ BitVec 32))

(assert (=> d!60513 (and (bvsge lt!124273 #b00000000000000000000000000000000) (bvsle lt!124273 (bvsub (size!6144 lt!124125) #b00000000000000000000000000000000)))))

(declare-fun e!160949 () (_ BitVec 32))

(assert (=> d!60513 (= lt!124273 e!160949)))

(declare-fun c!41562 () Bool)

(assert (=> d!60513 (= c!41562 (bvsge #b00000000000000000000000000000000 (size!6144 (_keys!6707 thiss!1504))))))

(assert (=> d!60513 (and (bvsle #b00000000000000000000000000000000 (size!6144 (_keys!6707 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6144 (_keys!6707 thiss!1504)) (size!6144 lt!124125)))))

(assert (=> d!60513 (= (arrayCountValidKeys!0 lt!124125 #b00000000000000000000000000000000 (size!6144 (_keys!6707 thiss!1504))) lt!124273)))

(declare-fun b!248116 () Bool)

(declare-fun e!160948 () (_ BitVec 32))

(assert (=> b!248116 (= e!160949 e!160948)))

(declare-fun c!41563 () Bool)

(assert (=> b!248116 (= c!41563 (validKeyInArray!0 (select (arr!5801 lt!124125) #b00000000000000000000000000000000)))))

(declare-fun b!248117 () Bool)

(declare-fun call!23247 () (_ BitVec 32))

(assert (=> b!248117 (= e!160948 (bvadd #b00000000000000000000000000000001 call!23247))))

(declare-fun b!248118 () Bool)

(assert (=> b!248118 (= e!160949 #b00000000000000000000000000000000)))

(declare-fun b!248119 () Bool)

(assert (=> b!248119 (= e!160948 call!23247)))

(declare-fun bm!23244 () Bool)

(assert (=> bm!23244 (= call!23247 (arrayCountValidKeys!0 lt!124125 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6144 (_keys!6707 thiss!1504))))))

(assert (= (and d!60513 c!41562) b!248118))

(assert (= (and d!60513 (not c!41562)) b!248116))

(assert (= (and b!248116 c!41563) b!248117))

(assert (= (and b!248116 (not c!41563)) b!248119))

(assert (= (or b!248117 b!248119) bm!23244))

(declare-fun m!265009 () Bool)

(assert (=> b!248116 m!265009))

(assert (=> b!248116 m!265009))

(declare-fun m!265011 () Bool)

(assert (=> b!248116 m!265011))

(declare-fun m!265013 () Bool)

(assert (=> bm!23244 m!265013))

(assert (=> b!247890 d!60513))

(declare-fun b!248130 () Bool)

(declare-fun e!160960 () Bool)

(declare-fun contains!1797 (List!3701 (_ BitVec 64)) Bool)

(assert (=> b!248130 (= e!160960 (contains!1797 Nil!3698 (select (arr!5801 lt!124125) #b00000000000000000000000000000000)))))

(declare-fun d!60515 () Bool)

(declare-fun res!121598 () Bool)

(declare-fun e!160961 () Bool)

(assert (=> d!60515 (=> res!121598 e!160961)))

(assert (=> d!60515 (= res!121598 (bvsge #b00000000000000000000000000000000 (size!6144 lt!124125)))))

(assert (=> d!60515 (= (arrayNoDuplicates!0 lt!124125 #b00000000000000000000000000000000 Nil!3698) e!160961)))

(declare-fun b!248131 () Bool)

(declare-fun e!160959 () Bool)

(declare-fun call!23250 () Bool)

(assert (=> b!248131 (= e!160959 call!23250)))

(declare-fun b!248132 () Bool)

(declare-fun e!160958 () Bool)

(assert (=> b!248132 (= e!160958 e!160959)))

(declare-fun c!41566 () Bool)

(assert (=> b!248132 (= c!41566 (validKeyInArray!0 (select (arr!5801 lt!124125) #b00000000000000000000000000000000)))))

(declare-fun b!248133 () Bool)

(assert (=> b!248133 (= e!160961 e!160958)))

(declare-fun res!121599 () Bool)

(assert (=> b!248133 (=> (not res!121599) (not e!160958))))

(assert (=> b!248133 (= res!121599 (not e!160960))))

(declare-fun res!121600 () Bool)

(assert (=> b!248133 (=> (not res!121600) (not e!160960))))

(assert (=> b!248133 (= res!121600 (validKeyInArray!0 (select (arr!5801 lt!124125) #b00000000000000000000000000000000)))))

(declare-fun b!248134 () Bool)

(assert (=> b!248134 (= e!160959 call!23250)))

(declare-fun bm!23247 () Bool)

(assert (=> bm!23247 (= call!23250 (arrayNoDuplicates!0 lt!124125 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41566 (Cons!3697 (select (arr!5801 lt!124125) #b00000000000000000000000000000000) Nil!3698) Nil!3698)))))

(assert (= (and d!60515 (not res!121598)) b!248133))

(assert (= (and b!248133 res!121600) b!248130))

(assert (= (and b!248133 res!121599) b!248132))

(assert (= (and b!248132 c!41566) b!248131))

(assert (= (and b!248132 (not c!41566)) b!248134))

(assert (= (or b!248131 b!248134) bm!23247))

(assert (=> b!248130 m!265009))

(assert (=> b!248130 m!265009))

(declare-fun m!265015 () Bool)

(assert (=> b!248130 m!265015))

(assert (=> b!248132 m!265009))

(assert (=> b!248132 m!265009))

(assert (=> b!248132 m!265011))

(assert (=> b!248133 m!265009))

(assert (=> b!248133 m!265009))

(assert (=> b!248133 m!265011))

(assert (=> bm!23247 m!265009))

(declare-fun m!265017 () Bool)

(assert (=> bm!23247 m!265017))

(assert (=> b!247890 d!60515))

(declare-fun d!60517 () Bool)

(declare-fun e!160964 () Bool)

(assert (=> d!60517 e!160964))

(declare-fun res!121603 () Bool)

(assert (=> d!60517 (=> (not res!121603) (not e!160964))))

(assert (=> d!60517 (= res!121603 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6144 (_keys!6707 thiss!1504)))))))

(declare-fun lt!124276 () Unit!7673)

(declare-fun choose!41 (array!12227 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3701) Unit!7673)

(assert (=> d!60517 (= lt!124276 (choose!41 (_keys!6707 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3698))))

(assert (=> d!60517 (bvslt (size!6144 (_keys!6707 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60517 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6707 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3698) lt!124276)))

(declare-fun b!248137 () Bool)

(assert (=> b!248137 (= e!160964 (arrayNoDuplicates!0 (array!12228 (store (arr!5801 (_keys!6707 thiss!1504)) index!297 key!932) (size!6144 (_keys!6707 thiss!1504))) #b00000000000000000000000000000000 Nil!3698))))

(assert (= (and d!60517 res!121603) b!248137))

(declare-fun m!265019 () Bool)

(assert (=> d!60517 m!265019))

(assert (=> b!248137 m!264843))

(declare-fun m!265021 () Bool)

(assert (=> b!248137 m!265021))

(assert (=> b!247890 d!60517))

(declare-fun d!60519 () Bool)

(declare-fun res!121610 () Bool)

(declare-fun e!160967 () Bool)

(assert (=> d!60519 (=> (not res!121610) (not e!160967))))

(declare-fun simpleValid!258 (LongMapFixedSize!3672) Bool)

(assert (=> d!60519 (= res!121610 (simpleValid!258 thiss!1504))))

(assert (=> d!60519 (= (valid!1437 thiss!1504) e!160967)))

(declare-fun b!248144 () Bool)

(declare-fun res!121611 () Bool)

(assert (=> b!248144 (=> (not res!121611) (not e!160967))))

(assert (=> b!248144 (= res!121611 (= (arrayCountValidKeys!0 (_keys!6707 thiss!1504) #b00000000000000000000000000000000 (size!6144 (_keys!6707 thiss!1504))) (_size!1885 thiss!1504)))))

(declare-fun b!248145 () Bool)

(declare-fun res!121612 () Bool)

(assert (=> b!248145 (=> (not res!121612) (not e!160967))))

(assert (=> b!248145 (= res!121612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6707 thiss!1504) (mask!10727 thiss!1504)))))

(declare-fun b!248146 () Bool)

(assert (=> b!248146 (= e!160967 (arrayNoDuplicates!0 (_keys!6707 thiss!1504) #b00000000000000000000000000000000 Nil!3698))))

(assert (= (and d!60519 res!121610) b!248144))

(assert (= (and b!248144 res!121611) b!248145))

(assert (= (and b!248145 res!121612) b!248146))

(declare-fun m!265023 () Bool)

(assert (=> d!60519 m!265023))

(assert (=> b!248144 m!264845))

(assert (=> b!248145 m!264807))

(declare-fun m!265025 () Bool)

(assert (=> b!248146 m!265025))

(assert (=> start!23578 d!60519))

(declare-fun b!248163 () Bool)

(declare-fun e!160979 () Bool)

(declare-fun call!23256 () Bool)

(assert (=> b!248163 (= e!160979 (not call!23256))))

(declare-fun b!248164 () Bool)

(declare-fun lt!124281 () SeekEntryResult!1107)

(assert (=> b!248164 (and (bvsge (index!6598 lt!124281) #b00000000000000000000000000000000) (bvslt (index!6598 lt!124281) (size!6144 (_keys!6707 thiss!1504))))))

(declare-fun res!121622 () Bool)

(assert (=> b!248164 (= res!121622 (= (select (arr!5801 (_keys!6707 thiss!1504)) (index!6598 lt!124281)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248164 (=> (not res!121622) (not e!160979))))

(declare-fun b!248165 () Bool)

(declare-fun e!160977 () Bool)

(assert (=> b!248165 (= e!160977 e!160979)))

(declare-fun res!121623 () Bool)

(declare-fun call!23255 () Bool)

(assert (=> b!248165 (= res!121623 call!23255)))

(assert (=> b!248165 (=> (not res!121623) (not e!160979))))

(declare-fun bm!23252 () Bool)

(declare-fun c!41571 () Bool)

(assert (=> bm!23252 (= call!23255 (inRange!0 (ite c!41571 (index!6598 lt!124281) (index!6601 lt!124281)) (mask!10727 thiss!1504)))))

(declare-fun b!248166 () Bool)

(declare-fun e!160978 () Bool)

(assert (=> b!248166 (= e!160978 (not call!23256))))

(declare-fun b!248167 () Bool)

(declare-fun res!121624 () Bool)

(assert (=> b!248167 (=> (not res!121624) (not e!160978))))

(assert (=> b!248167 (= res!121624 call!23255)))

(declare-fun e!160976 () Bool)

(assert (=> b!248167 (= e!160976 e!160978)))

(declare-fun bm!23253 () Bool)

(assert (=> bm!23253 (= call!23256 (arrayContainsKey!0 (_keys!6707 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun d!60521 () Bool)

(assert (=> d!60521 e!160977))

(assert (=> d!60521 (= c!41571 ((_ is MissingZero!1107) lt!124281))))

(assert (=> d!60521 (= lt!124281 (seekEntryOrOpen!0 key!932 (_keys!6707 thiss!1504) (mask!10727 thiss!1504)))))

(declare-fun lt!124282 () Unit!7673)

(declare-fun choose!1166 (array!12227 array!12225 (_ BitVec 32) (_ BitVec 32) V!8259 V!8259 (_ BitVec 64) Int) Unit!7673)

(assert (=> d!60521 (= lt!124282 (choose!1166 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) key!932 (defaultEntry!4585 thiss!1504)))))

(assert (=> d!60521 (validMask!0 (mask!10727 thiss!1504))))

(assert (=> d!60521 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!390 (_keys!6707 thiss!1504) (_values!4568 thiss!1504) (mask!10727 thiss!1504) (extraKeys!4322 thiss!1504) (zeroValue!4426 thiss!1504) (minValue!4426 thiss!1504) key!932 (defaultEntry!4585 thiss!1504)) lt!124282)))

(declare-fun b!248168 () Bool)

(assert (=> b!248168 (= e!160976 ((_ is Undefined!1107) lt!124281))))

(declare-fun b!248169 () Bool)

(declare-fun res!121621 () Bool)

(assert (=> b!248169 (=> (not res!121621) (not e!160978))))

(assert (=> b!248169 (= res!121621 (= (select (arr!5801 (_keys!6707 thiss!1504)) (index!6601 lt!124281)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248169 (and (bvsge (index!6601 lt!124281) #b00000000000000000000000000000000) (bvslt (index!6601 lt!124281) (size!6144 (_keys!6707 thiss!1504))))))

(declare-fun b!248170 () Bool)

(assert (=> b!248170 (= e!160977 e!160976)))

(declare-fun c!41572 () Bool)

(assert (=> b!248170 (= c!41572 ((_ is MissingVacant!1107) lt!124281))))

(assert (= (and d!60521 c!41571) b!248165))

(assert (= (and d!60521 (not c!41571)) b!248170))

(assert (= (and b!248165 res!121623) b!248164))

(assert (= (and b!248164 res!121622) b!248163))

(assert (= (and b!248170 c!41572) b!248167))

(assert (= (and b!248170 (not c!41572)) b!248168))

(assert (= (and b!248167 res!121624) b!248169))

(assert (= (and b!248169 res!121621) b!248166))

(assert (= (or b!248165 b!248167) bm!23252))

(assert (= (or b!248163 b!248166) bm!23253))

(declare-fun m!265027 () Bool)

(assert (=> b!248169 m!265027))

(declare-fun m!265029 () Bool)

(assert (=> b!248164 m!265029))

(assert (=> bm!23253 m!264811))

(declare-fun m!265031 () Bool)

(assert (=> bm!23252 m!265031))

(assert (=> d!60521 m!264815))

(declare-fun m!265033 () Bool)

(assert (=> d!60521 m!265033))

(assert (=> d!60521 m!264835))

(assert (=> b!247881 d!60521))

(assert (=> bm!23210 d!60507))

(declare-fun condMapEmpty!10970 () Bool)

(declare-fun mapDefault!10970 () ValueCell!2886)

(assert (=> mapNonEmpty!10964 (= condMapEmpty!10970 (= mapRest!10964 ((as const (Array (_ BitVec 32) ValueCell!2886)) mapDefault!10970)))))

(declare-fun e!160984 () Bool)

(declare-fun mapRes!10970 () Bool)

(assert (=> mapNonEmpty!10964 (= tp!23039 (and e!160984 mapRes!10970))))

(declare-fun b!248177 () Bool)

(declare-fun e!160985 () Bool)

(assert (=> b!248177 (= e!160985 tp_is_empty!6459)))

(declare-fun mapNonEmpty!10970 () Bool)

(declare-fun tp!23048 () Bool)

(assert (=> mapNonEmpty!10970 (= mapRes!10970 (and tp!23048 e!160985))))

(declare-fun mapValue!10970 () ValueCell!2886)

(declare-fun mapRest!10970 () (Array (_ BitVec 32) ValueCell!2886))

(declare-fun mapKey!10970 () (_ BitVec 32))

(assert (=> mapNonEmpty!10970 (= mapRest!10964 (store mapRest!10970 mapKey!10970 mapValue!10970))))

(declare-fun mapIsEmpty!10970 () Bool)

(assert (=> mapIsEmpty!10970 mapRes!10970))

(declare-fun b!248178 () Bool)

(assert (=> b!248178 (= e!160984 tp_is_empty!6459)))

(assert (= (and mapNonEmpty!10964 condMapEmpty!10970) mapIsEmpty!10970))

(assert (= (and mapNonEmpty!10964 (not condMapEmpty!10970)) mapNonEmpty!10970))

(assert (= (and mapNonEmpty!10970 ((_ is ValueCellFull!2886) mapValue!10970)) b!248177))

(assert (= (and mapNonEmpty!10964 ((_ is ValueCellFull!2886) mapDefault!10970)) b!248178))

(declare-fun m!265035 () Bool)

(assert (=> mapNonEmpty!10970 m!265035))

(declare-fun b_lambda!8053 () Bool)

(assert (= b_lambda!8051 (or (and b!247884 b_free!6597) b_lambda!8053)))

(check-sat (not b!248146) (not d!60519) (not b!248094) (not d!60493) (not b!248002) (not bm!23234) (not b!248103) (not bm!23232) (not b!248077) (not b!248097) (not bm!23247) (not b!248049) (not b_next!6597) (not d!60483) (not b!248112) (not b!248144) (not b!247989) (not bm!23231) (not bm!23244) (not b!248116) (not d!60505) (not b_lambda!8053) (not b!248050) (not b!248058) (not b!248051) (not b!248095) (not b!248053) (not d!60501) (not b!248137) (not b!248078) (not bm!23253) (not bm!23237) (not bm!23243) (not bm!23252) (not b!248132) (not b!248045) (not b!248084) (not b!248130) (not d!60521) (not d!60517) tp_is_empty!6459 (not b!248133) (not b!248145) (not b!248046) (not d!60491) (not b!248057) (not d!60499) (not b!248000) (not bm!23240) b_and!13603 (not mapNonEmpty!10970))
(check-sat b_and!13603 (not b_next!6597))
