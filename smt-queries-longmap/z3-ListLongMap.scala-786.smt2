; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18730 () Bool)

(assert start!18730)

(declare-fun b!184901 () Bool)

(declare-fun b_free!4555 () Bool)

(declare-fun b_next!4555 () Bool)

(assert (=> b!184901 (= b_free!4555 (not b_next!4555))))

(declare-fun tp!16455 () Bool)

(declare-fun b_and!11125 () Bool)

(assert (=> b!184901 (= tp!16455 b_and!11125)))

(declare-fun b!184899 () Bool)

(declare-fun res!87429 () Bool)

(declare-fun e!121679 () Bool)

(assert (=> b!184899 (=> (not res!87429) (not e!121679))))

(declare-datatypes ((V!5417 0))(
  ( (V!5418 (val!2208 Int)) )
))
(declare-datatypes ((ValueCell!1820 0))(
  ( (ValueCellFull!1820 (v!4110 V!5417)) (EmptyCell!1820) )
))
(declare-datatypes ((array!7837 0))(
  ( (array!7838 (arr!3700 (Array (_ BitVec 32) (_ BitVec 64))) (size!4017 (_ BitVec 32))) )
))
(declare-datatypes ((array!7839 0))(
  ( (array!7840 (arr!3701 (Array (_ BitVec 32) ValueCell!1820)) (size!4018 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2548 0))(
  ( (LongMapFixedSize!2549 (defaultEntry!3773 Int) (mask!8870 (_ BitVec 32)) (extraKeys!3510 (_ BitVec 32)) (zeroValue!3614 V!5417) (minValue!3614 V!5417) (_size!1323 (_ BitVec 32)) (_keys!5707 array!7837) (_values!3756 array!7839) (_vacant!1323 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2548)

(assert (=> b!184899 (= res!87429 (and (= (size!4018 (_values!3756 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8870 thiss!1248))) (= (size!4017 (_keys!5707 thiss!1248)) (size!4018 (_values!3756 thiss!1248))) (bvsge (mask!8870 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3510 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3510 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!184900 () Bool)

(declare-fun e!121682 () Bool)

(assert (=> b!184900 (= e!121682 e!121679)))

(declare-fun res!87430 () Bool)

(assert (=> b!184900 (=> (not res!87430) (not e!121679))))

(declare-datatypes ((SeekEntryResult!630 0))(
  ( (MissingZero!630 (index!4690 (_ BitVec 32))) (Found!630 (index!4691 (_ BitVec 32))) (Intermediate!630 (undefined!1442 Bool) (index!4692 (_ BitVec 32)) (x!20105 (_ BitVec 32))) (Undefined!630) (MissingVacant!630 (index!4693 (_ BitVec 32))) )
))
(declare-fun lt!91358 () SeekEntryResult!630)

(get-info :version)

(assert (=> b!184900 (= res!87430 (and (not ((_ is Undefined!630) lt!91358)) (not ((_ is MissingVacant!630) lt!91358)) (not ((_ is MissingZero!630) lt!91358)) ((_ is Found!630) lt!91358)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7837 (_ BitVec 32)) SeekEntryResult!630)

(assert (=> b!184900 (= lt!91358 (seekEntryOrOpen!0 key!828 (_keys!5707 thiss!1248) (mask!8870 thiss!1248)))))

(declare-fun tp_is_empty!4327 () Bool)

(declare-fun e!121685 () Bool)

(declare-fun e!121681 () Bool)

(declare-fun array_inv!2393 (array!7837) Bool)

(declare-fun array_inv!2394 (array!7839) Bool)

(assert (=> b!184901 (= e!121681 (and tp!16455 tp_is_empty!4327 (array_inv!2393 (_keys!5707 thiss!1248)) (array_inv!2394 (_values!3756 thiss!1248)) e!121685))))

(declare-fun b!184902 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7837 (_ BitVec 32)) Bool)

(assert (=> b!184902 (= e!121679 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5707 thiss!1248) (mask!8870 thiss!1248))))))

(declare-fun b!184903 () Bool)

(declare-fun res!87427 () Bool)

(assert (=> b!184903 (=> (not res!87427) (not e!121679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!184903 (= res!87427 (validMask!0 (mask!8870 thiss!1248)))))

(declare-fun mapNonEmpty!7443 () Bool)

(declare-fun mapRes!7443 () Bool)

(declare-fun tp!16454 () Bool)

(declare-fun e!121680 () Bool)

(assert (=> mapNonEmpty!7443 (= mapRes!7443 (and tp!16454 e!121680))))

(declare-fun mapRest!7443 () (Array (_ BitVec 32) ValueCell!1820))

(declare-fun mapValue!7443 () ValueCell!1820)

(declare-fun mapKey!7443 () (_ BitVec 32))

(assert (=> mapNonEmpty!7443 (= (arr!3701 (_values!3756 thiss!1248)) (store mapRest!7443 mapKey!7443 mapValue!7443))))

(declare-fun b!184905 () Bool)

(declare-fun res!87431 () Bool)

(assert (=> b!184905 (=> (not res!87431) (not e!121679))))

(declare-datatypes ((tuple2!3404 0))(
  ( (tuple2!3405 (_1!1713 (_ BitVec 64)) (_2!1713 V!5417)) )
))
(declare-datatypes ((List!2342 0))(
  ( (Nil!2339) (Cons!2338 (h!2971 tuple2!3404) (t!7211 List!2342)) )
))
(declare-datatypes ((ListLongMap!2313 0))(
  ( (ListLongMap!2314 (toList!1172 List!2342)) )
))
(declare-fun contains!1272 (ListLongMap!2313 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!805 (array!7837 array!7839 (_ BitVec 32) (_ BitVec 32) V!5417 V!5417 (_ BitVec 32) Int) ListLongMap!2313)

(assert (=> b!184905 (= res!87431 (not (contains!1272 (getCurrentListMap!805 (_keys!5707 thiss!1248) (_values!3756 thiss!1248) (mask!8870 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248)) key!828)))))

(declare-fun mapIsEmpty!7443 () Bool)

(assert (=> mapIsEmpty!7443 mapRes!7443))

(declare-fun b!184906 () Bool)

(assert (=> b!184906 (= e!121680 tp_is_empty!4327)))

(declare-fun b!184907 () Bool)

(declare-fun res!87432 () Bool)

(assert (=> b!184907 (=> (not res!87432) (not e!121682))))

(assert (=> b!184907 (= res!87432 (not (= key!828 (bvneg key!828))))))

(declare-fun b!184908 () Bool)

(declare-fun e!121684 () Bool)

(assert (=> b!184908 (= e!121684 tp_is_empty!4327)))

(declare-fun b!184904 () Bool)

(assert (=> b!184904 (= e!121685 (and e!121684 mapRes!7443))))

(declare-fun condMapEmpty!7443 () Bool)

(declare-fun mapDefault!7443 () ValueCell!1820)

(assert (=> b!184904 (= condMapEmpty!7443 (= (arr!3701 (_values!3756 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1820)) mapDefault!7443)))))

(declare-fun res!87428 () Bool)

(assert (=> start!18730 (=> (not res!87428) (not e!121682))))

(declare-fun valid!1070 (LongMapFixedSize!2548) Bool)

(assert (=> start!18730 (= res!87428 (valid!1070 thiss!1248))))

(assert (=> start!18730 e!121682))

(assert (=> start!18730 e!121681))

(assert (=> start!18730 true))

(assert (= (and start!18730 res!87428) b!184907))

(assert (= (and b!184907 res!87432) b!184900))

(assert (= (and b!184900 res!87430) b!184905))

(assert (= (and b!184905 res!87431) b!184903))

(assert (= (and b!184903 res!87427) b!184899))

(assert (= (and b!184899 res!87429) b!184902))

(assert (= (and b!184904 condMapEmpty!7443) mapIsEmpty!7443))

(assert (= (and b!184904 (not condMapEmpty!7443)) mapNonEmpty!7443))

(assert (= (and mapNonEmpty!7443 ((_ is ValueCellFull!1820) mapValue!7443)) b!184906))

(assert (= (and b!184904 ((_ is ValueCellFull!1820) mapDefault!7443)) b!184908))

(assert (= b!184901 b!184904))

(assert (= start!18730 b!184901))

(declare-fun m!211777 () Bool)

(assert (=> start!18730 m!211777))

(declare-fun m!211779 () Bool)

(assert (=> mapNonEmpty!7443 m!211779))

(declare-fun m!211781 () Bool)

(assert (=> b!184901 m!211781))

(declare-fun m!211783 () Bool)

(assert (=> b!184901 m!211783))

(declare-fun m!211785 () Bool)

(assert (=> b!184900 m!211785))

(declare-fun m!211787 () Bool)

(assert (=> b!184902 m!211787))

(declare-fun m!211789 () Bool)

(assert (=> b!184903 m!211789))

(declare-fun m!211791 () Bool)

(assert (=> b!184905 m!211791))

(assert (=> b!184905 m!211791))

(declare-fun m!211793 () Bool)

(assert (=> b!184905 m!211793))

(check-sat (not b_next!4555) (not mapNonEmpty!7443) b_and!11125 (not b!184903) (not b!184905) (not start!18730) (not b!184902) (not b!184901) tp_is_empty!4327 (not b!184900))
(check-sat b_and!11125 (not b_next!4555))
(get-model)

(declare-fun b!184977 () Bool)

(declare-fun e!121736 () Bool)

(declare-fun call!18640 () Bool)

(assert (=> b!184977 (= e!121736 call!18640)))

(declare-fun b!184978 () Bool)

(declare-fun e!121734 () Bool)

(assert (=> b!184978 (= e!121734 call!18640)))

(declare-fun bm!18637 () Bool)

(assert (=> bm!18637 (= call!18640 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5707 thiss!1248) (mask!8870 thiss!1248)))))

(declare-fun d!54931 () Bool)

(declare-fun res!87474 () Bool)

(declare-fun e!121735 () Bool)

(assert (=> d!54931 (=> res!87474 e!121735)))

(assert (=> d!54931 (= res!87474 (bvsge #b00000000000000000000000000000000 (size!4017 (_keys!5707 thiss!1248))))))

(assert (=> d!54931 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5707 thiss!1248) (mask!8870 thiss!1248)) e!121735)))

(declare-fun b!184979 () Bool)

(assert (=> b!184979 (= e!121735 e!121734)))

(declare-fun c!33194 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!184979 (= c!33194 (validKeyInArray!0 (select (arr!3700 (_keys!5707 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184980 () Bool)

(assert (=> b!184980 (= e!121734 e!121736)))

(declare-fun lt!91372 () (_ BitVec 64))

(assert (=> b!184980 (= lt!91372 (select (arr!3700 (_keys!5707 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5555 0))(
  ( (Unit!5556) )
))
(declare-fun lt!91371 () Unit!5555)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7837 (_ BitVec 64) (_ BitVec 32)) Unit!5555)

(assert (=> b!184980 (= lt!91371 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5707 thiss!1248) lt!91372 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!184980 (arrayContainsKey!0 (_keys!5707 thiss!1248) lt!91372 #b00000000000000000000000000000000)))

(declare-fun lt!91373 () Unit!5555)

(assert (=> b!184980 (= lt!91373 lt!91371)))

(declare-fun res!87473 () Bool)

(assert (=> b!184980 (= res!87473 (= (seekEntryOrOpen!0 (select (arr!3700 (_keys!5707 thiss!1248)) #b00000000000000000000000000000000) (_keys!5707 thiss!1248) (mask!8870 thiss!1248)) (Found!630 #b00000000000000000000000000000000)))))

(assert (=> b!184980 (=> (not res!87473) (not e!121736))))

(assert (= (and d!54931 (not res!87474)) b!184979))

(assert (= (and b!184979 c!33194) b!184980))

(assert (= (and b!184979 (not c!33194)) b!184978))

(assert (= (and b!184980 res!87473) b!184977))

(assert (= (or b!184977 b!184978) bm!18637))

(declare-fun m!211831 () Bool)

(assert (=> bm!18637 m!211831))

(declare-fun m!211833 () Bool)

(assert (=> b!184979 m!211833))

(assert (=> b!184979 m!211833))

(declare-fun m!211835 () Bool)

(assert (=> b!184979 m!211835))

(assert (=> b!184980 m!211833))

(declare-fun m!211837 () Bool)

(assert (=> b!184980 m!211837))

(declare-fun m!211839 () Bool)

(assert (=> b!184980 m!211839))

(assert (=> b!184980 m!211833))

(declare-fun m!211841 () Bool)

(assert (=> b!184980 m!211841))

(assert (=> b!184902 d!54931))

(declare-fun d!54933 () Bool)

(declare-fun res!87481 () Bool)

(declare-fun e!121739 () Bool)

(assert (=> d!54933 (=> (not res!87481) (not e!121739))))

(declare-fun simpleValid!180 (LongMapFixedSize!2548) Bool)

(assert (=> d!54933 (= res!87481 (simpleValid!180 thiss!1248))))

(assert (=> d!54933 (= (valid!1070 thiss!1248) e!121739)))

(declare-fun b!184987 () Bool)

(declare-fun res!87482 () Bool)

(assert (=> b!184987 (=> (not res!87482) (not e!121739))))

(declare-fun arrayCountValidKeys!0 (array!7837 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!184987 (= res!87482 (= (arrayCountValidKeys!0 (_keys!5707 thiss!1248) #b00000000000000000000000000000000 (size!4017 (_keys!5707 thiss!1248))) (_size!1323 thiss!1248)))))

(declare-fun b!184988 () Bool)

(declare-fun res!87483 () Bool)

(assert (=> b!184988 (=> (not res!87483) (not e!121739))))

(assert (=> b!184988 (= res!87483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5707 thiss!1248) (mask!8870 thiss!1248)))))

(declare-fun b!184989 () Bool)

(declare-datatypes ((List!2345 0))(
  ( (Nil!2342) (Cons!2341 (h!2974 (_ BitVec 64)) (t!7216 List!2345)) )
))
(declare-fun arrayNoDuplicates!0 (array!7837 (_ BitVec 32) List!2345) Bool)

(assert (=> b!184989 (= e!121739 (arrayNoDuplicates!0 (_keys!5707 thiss!1248) #b00000000000000000000000000000000 Nil!2342))))

(assert (= (and d!54933 res!87481) b!184987))

(assert (= (and b!184987 res!87482) b!184988))

(assert (= (and b!184988 res!87483) b!184989))

(declare-fun m!211843 () Bool)

(assert (=> d!54933 m!211843))

(declare-fun m!211845 () Bool)

(assert (=> b!184987 m!211845))

(assert (=> b!184988 m!211787))

(declare-fun m!211847 () Bool)

(assert (=> b!184989 m!211847))

(assert (=> start!18730 d!54933))

(declare-fun d!54935 () Bool)

(assert (=> d!54935 (= (validMask!0 (mask!8870 thiss!1248)) (and (or (= (mask!8870 thiss!1248) #b00000000000000000000000000000111) (= (mask!8870 thiss!1248) #b00000000000000000000000000001111) (= (mask!8870 thiss!1248) #b00000000000000000000000000011111) (= (mask!8870 thiss!1248) #b00000000000000000000000000111111) (= (mask!8870 thiss!1248) #b00000000000000000000000001111111) (= (mask!8870 thiss!1248) #b00000000000000000000000011111111) (= (mask!8870 thiss!1248) #b00000000000000000000000111111111) (= (mask!8870 thiss!1248) #b00000000000000000000001111111111) (= (mask!8870 thiss!1248) #b00000000000000000000011111111111) (= (mask!8870 thiss!1248) #b00000000000000000000111111111111) (= (mask!8870 thiss!1248) #b00000000000000000001111111111111) (= (mask!8870 thiss!1248) #b00000000000000000011111111111111) (= (mask!8870 thiss!1248) #b00000000000000000111111111111111) (= (mask!8870 thiss!1248) #b00000000000000001111111111111111) (= (mask!8870 thiss!1248) #b00000000000000011111111111111111) (= (mask!8870 thiss!1248) #b00000000000000111111111111111111) (= (mask!8870 thiss!1248) #b00000000000001111111111111111111) (= (mask!8870 thiss!1248) #b00000000000011111111111111111111) (= (mask!8870 thiss!1248) #b00000000000111111111111111111111) (= (mask!8870 thiss!1248) #b00000000001111111111111111111111) (= (mask!8870 thiss!1248) #b00000000011111111111111111111111) (= (mask!8870 thiss!1248) #b00000000111111111111111111111111) (= (mask!8870 thiss!1248) #b00000001111111111111111111111111) (= (mask!8870 thiss!1248) #b00000011111111111111111111111111) (= (mask!8870 thiss!1248) #b00000111111111111111111111111111) (= (mask!8870 thiss!1248) #b00001111111111111111111111111111) (= (mask!8870 thiss!1248) #b00011111111111111111111111111111) (= (mask!8870 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8870 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!184903 d!54935))

(declare-fun d!54937 () Bool)

(declare-fun lt!91381 () SeekEntryResult!630)

(assert (=> d!54937 (and (or ((_ is Undefined!630) lt!91381) (not ((_ is Found!630) lt!91381)) (and (bvsge (index!4691 lt!91381) #b00000000000000000000000000000000) (bvslt (index!4691 lt!91381) (size!4017 (_keys!5707 thiss!1248))))) (or ((_ is Undefined!630) lt!91381) ((_ is Found!630) lt!91381) (not ((_ is MissingZero!630) lt!91381)) (and (bvsge (index!4690 lt!91381) #b00000000000000000000000000000000) (bvslt (index!4690 lt!91381) (size!4017 (_keys!5707 thiss!1248))))) (or ((_ is Undefined!630) lt!91381) ((_ is Found!630) lt!91381) ((_ is MissingZero!630) lt!91381) (not ((_ is MissingVacant!630) lt!91381)) (and (bvsge (index!4693 lt!91381) #b00000000000000000000000000000000) (bvslt (index!4693 lt!91381) (size!4017 (_keys!5707 thiss!1248))))) (or ((_ is Undefined!630) lt!91381) (ite ((_ is Found!630) lt!91381) (= (select (arr!3700 (_keys!5707 thiss!1248)) (index!4691 lt!91381)) key!828) (ite ((_ is MissingZero!630) lt!91381) (= (select (arr!3700 (_keys!5707 thiss!1248)) (index!4690 lt!91381)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!630) lt!91381) (= (select (arr!3700 (_keys!5707 thiss!1248)) (index!4693 lt!91381)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!121746 () SeekEntryResult!630)

(assert (=> d!54937 (= lt!91381 e!121746)))

(declare-fun c!33203 () Bool)

(declare-fun lt!91380 () SeekEntryResult!630)

(assert (=> d!54937 (= c!33203 (and ((_ is Intermediate!630) lt!91380) (undefined!1442 lt!91380)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7837 (_ BitVec 32)) SeekEntryResult!630)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54937 (= lt!91380 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8870 thiss!1248)) key!828 (_keys!5707 thiss!1248) (mask!8870 thiss!1248)))))

(assert (=> d!54937 (validMask!0 (mask!8870 thiss!1248))))

(assert (=> d!54937 (= (seekEntryOrOpen!0 key!828 (_keys!5707 thiss!1248) (mask!8870 thiss!1248)) lt!91381)))

(declare-fun e!121747 () SeekEntryResult!630)

(declare-fun b!185002 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7837 (_ BitVec 32)) SeekEntryResult!630)

(assert (=> b!185002 (= e!121747 (seekKeyOrZeroReturnVacant!0 (x!20105 lt!91380) (index!4692 lt!91380) (index!4692 lt!91380) key!828 (_keys!5707 thiss!1248) (mask!8870 thiss!1248)))))

(declare-fun b!185003 () Bool)

(declare-fun e!121748 () SeekEntryResult!630)

(assert (=> b!185003 (= e!121746 e!121748)))

(declare-fun lt!91382 () (_ BitVec 64))

(assert (=> b!185003 (= lt!91382 (select (arr!3700 (_keys!5707 thiss!1248)) (index!4692 lt!91380)))))

(declare-fun c!33201 () Bool)

(assert (=> b!185003 (= c!33201 (= lt!91382 key!828))))

(declare-fun b!185004 () Bool)

(assert (=> b!185004 (= e!121747 (MissingZero!630 (index!4692 lt!91380)))))

(declare-fun b!185005 () Bool)

(assert (=> b!185005 (= e!121748 (Found!630 (index!4692 lt!91380)))))

(declare-fun b!185006 () Bool)

(assert (=> b!185006 (= e!121746 Undefined!630)))

(declare-fun b!185007 () Bool)

(declare-fun c!33202 () Bool)

(assert (=> b!185007 (= c!33202 (= lt!91382 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!185007 (= e!121748 e!121747)))

(assert (= (and d!54937 c!33203) b!185006))

(assert (= (and d!54937 (not c!33203)) b!185003))

(assert (= (and b!185003 c!33201) b!185005))

(assert (= (and b!185003 (not c!33201)) b!185007))

(assert (= (and b!185007 c!33202) b!185004))

(assert (= (and b!185007 (not c!33202)) b!185002))

(declare-fun m!211849 () Bool)

(assert (=> d!54937 m!211849))

(declare-fun m!211851 () Bool)

(assert (=> d!54937 m!211851))

(declare-fun m!211853 () Bool)

(assert (=> d!54937 m!211853))

(declare-fun m!211855 () Bool)

(assert (=> d!54937 m!211855))

(assert (=> d!54937 m!211851))

(assert (=> d!54937 m!211789))

(declare-fun m!211857 () Bool)

(assert (=> d!54937 m!211857))

(declare-fun m!211859 () Bool)

(assert (=> b!185002 m!211859))

(declare-fun m!211861 () Bool)

(assert (=> b!185003 m!211861))

(assert (=> b!184900 d!54937))

(declare-fun d!54939 () Bool)

(declare-fun e!121754 () Bool)

(assert (=> d!54939 e!121754))

(declare-fun res!87486 () Bool)

(assert (=> d!54939 (=> res!87486 e!121754)))

(declare-fun lt!91392 () Bool)

(assert (=> d!54939 (= res!87486 (not lt!91392))))

(declare-fun lt!91393 () Bool)

(assert (=> d!54939 (= lt!91392 lt!91393)))

(declare-fun lt!91391 () Unit!5555)

(declare-fun e!121753 () Unit!5555)

(assert (=> d!54939 (= lt!91391 e!121753)))

(declare-fun c!33206 () Bool)

(assert (=> d!54939 (= c!33206 lt!91393)))

(declare-fun containsKey!223 (List!2342 (_ BitVec 64)) Bool)

(assert (=> d!54939 (= lt!91393 (containsKey!223 (toList!1172 (getCurrentListMap!805 (_keys!5707 thiss!1248) (_values!3756 thiss!1248) (mask!8870 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248))) key!828))))

(assert (=> d!54939 (= (contains!1272 (getCurrentListMap!805 (_keys!5707 thiss!1248) (_values!3756 thiss!1248) (mask!8870 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248)) key!828) lt!91392)))

(declare-fun b!185014 () Bool)

(declare-fun lt!91394 () Unit!5555)

(assert (=> b!185014 (= e!121753 lt!91394)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!172 (List!2342 (_ BitVec 64)) Unit!5555)

(assert (=> b!185014 (= lt!91394 (lemmaContainsKeyImpliesGetValueByKeyDefined!172 (toList!1172 (getCurrentListMap!805 (_keys!5707 thiss!1248) (_values!3756 thiss!1248) (mask!8870 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248))) key!828))))

(declare-datatypes ((Option!225 0))(
  ( (Some!224 (v!4113 V!5417)) (None!223) )
))
(declare-fun isDefined!173 (Option!225) Bool)

(declare-fun getValueByKey!219 (List!2342 (_ BitVec 64)) Option!225)

(assert (=> b!185014 (isDefined!173 (getValueByKey!219 (toList!1172 (getCurrentListMap!805 (_keys!5707 thiss!1248) (_values!3756 thiss!1248) (mask!8870 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248))) key!828))))

(declare-fun b!185015 () Bool)

(declare-fun Unit!5557 () Unit!5555)

(assert (=> b!185015 (= e!121753 Unit!5557)))

(declare-fun b!185016 () Bool)

(assert (=> b!185016 (= e!121754 (isDefined!173 (getValueByKey!219 (toList!1172 (getCurrentListMap!805 (_keys!5707 thiss!1248) (_values!3756 thiss!1248) (mask!8870 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248))) key!828)))))

(assert (= (and d!54939 c!33206) b!185014))

(assert (= (and d!54939 (not c!33206)) b!185015))

(assert (= (and d!54939 (not res!87486)) b!185016))

(declare-fun m!211863 () Bool)

(assert (=> d!54939 m!211863))

(declare-fun m!211865 () Bool)

(assert (=> b!185014 m!211865))

(declare-fun m!211867 () Bool)

(assert (=> b!185014 m!211867))

(assert (=> b!185014 m!211867))

(declare-fun m!211869 () Bool)

(assert (=> b!185014 m!211869))

(assert (=> b!185016 m!211867))

(assert (=> b!185016 m!211867))

(assert (=> b!185016 m!211869))

(assert (=> b!184905 d!54939))

(declare-fun b!185059 () Bool)

(declare-fun e!121786 () Bool)

(declare-fun call!18658 () Bool)

(assert (=> b!185059 (= e!121786 (not call!18658))))

(declare-fun b!185060 () Bool)

(declare-fun e!121790 () Bool)

(declare-fun lt!91454 () ListLongMap!2313)

(declare-fun apply!164 (ListLongMap!2313 (_ BitVec 64)) V!5417)

(declare-fun get!2129 (ValueCell!1820 V!5417) V!5417)

(declare-fun dynLambda!498 (Int (_ BitVec 64)) V!5417)

(assert (=> b!185060 (= e!121790 (= (apply!164 lt!91454 (select (arr!3700 (_keys!5707 thiss!1248)) #b00000000000000000000000000000000)) (get!2129 (select (arr!3701 (_values!3756 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!498 (defaultEntry!3773 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!185060 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4018 (_values!3756 thiss!1248))))))

(assert (=> b!185060 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4017 (_keys!5707 thiss!1248))))))

(declare-fun d!54941 () Bool)

(declare-fun e!121781 () Bool)

(assert (=> d!54941 e!121781))

(declare-fun res!87506 () Bool)

(assert (=> d!54941 (=> (not res!87506) (not e!121781))))

(assert (=> d!54941 (= res!87506 (or (bvsge #b00000000000000000000000000000000 (size!4017 (_keys!5707 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4017 (_keys!5707 thiss!1248))))))))

(declare-fun lt!91440 () ListLongMap!2313)

(assert (=> d!54941 (= lt!91454 lt!91440)))

(declare-fun lt!91455 () Unit!5555)

(declare-fun e!121791 () Unit!5555)

(assert (=> d!54941 (= lt!91455 e!121791)))

(declare-fun c!33223 () Bool)

(declare-fun e!121785 () Bool)

(assert (=> d!54941 (= c!33223 e!121785)))

(declare-fun res!87509 () Bool)

(assert (=> d!54941 (=> (not res!87509) (not e!121785))))

(assert (=> d!54941 (= res!87509 (bvslt #b00000000000000000000000000000000 (size!4017 (_keys!5707 thiss!1248))))))

(declare-fun e!121788 () ListLongMap!2313)

(assert (=> d!54941 (= lt!91440 e!121788)))

(declare-fun c!33222 () Bool)

(assert (=> d!54941 (= c!33222 (and (not (= (bvand (extraKeys!3510 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3510 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54941 (validMask!0 (mask!8870 thiss!1248))))

(assert (=> d!54941 (= (getCurrentListMap!805 (_keys!5707 thiss!1248) (_values!3756 thiss!1248) (mask!8870 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248)) lt!91454)))

(declare-fun bm!18652 () Bool)

(declare-fun call!18661 () Bool)

(assert (=> bm!18652 (= call!18661 (contains!1272 lt!91454 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18653 () Bool)

(declare-fun call!18659 () ListLongMap!2313)

(declare-fun call!18657 () ListLongMap!2313)

(assert (=> bm!18653 (= call!18659 call!18657)))

(declare-fun b!185061 () Bool)

(assert (=> b!185061 (= e!121785 (validKeyInArray!0 (select (arr!3700 (_keys!5707 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185062 () Bool)

(declare-fun e!121787 () Bool)

(assert (=> b!185062 (= e!121787 (= (apply!164 lt!91454 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3614 thiss!1248)))))

(declare-fun b!185063 () Bool)

(declare-fun res!87508 () Bool)

(assert (=> b!185063 (=> (not res!87508) (not e!121781))))

(assert (=> b!185063 (= res!87508 e!121786)))

(declare-fun c!33220 () Bool)

(assert (=> b!185063 (= c!33220 (not (= (bvand (extraKeys!3510 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!18654 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!185 (array!7837 array!7839 (_ BitVec 32) (_ BitVec 32) V!5417 V!5417 (_ BitVec 32) Int) ListLongMap!2313)

(assert (=> bm!18654 (= call!18657 (getCurrentListMapNoExtraKeys!185 (_keys!5707 thiss!1248) (_values!3756 thiss!1248) (mask!8870 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248)))))

(declare-fun b!185064 () Bool)

(declare-fun e!121782 () ListLongMap!2313)

(declare-fun call!18655 () ListLongMap!2313)

(assert (=> b!185064 (= e!121782 call!18655)))

(declare-fun call!18660 () ListLongMap!2313)

(declare-fun bm!18655 () Bool)

(declare-fun c!33224 () Bool)

(declare-fun +!281 (ListLongMap!2313 tuple2!3404) ListLongMap!2313)

(assert (=> bm!18655 (= call!18660 (+!281 (ite c!33222 call!18657 (ite c!33224 call!18659 call!18655)) (ite (or c!33222 c!33224) (tuple2!3405 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3614 thiss!1248)) (tuple2!3405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3614 thiss!1248)))))))

(declare-fun b!185065 () Bool)

(declare-fun lt!91444 () Unit!5555)

(assert (=> b!185065 (= e!121791 lt!91444)))

(declare-fun lt!91443 () ListLongMap!2313)

(assert (=> b!185065 (= lt!91443 (getCurrentListMapNoExtraKeys!185 (_keys!5707 thiss!1248) (_values!3756 thiss!1248) (mask!8870 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248)))))

(declare-fun lt!91459 () (_ BitVec 64))

(assert (=> b!185065 (= lt!91459 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91446 () (_ BitVec 64))

(assert (=> b!185065 (= lt!91446 (select (arr!3700 (_keys!5707 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91452 () Unit!5555)

(declare-fun addStillContains!140 (ListLongMap!2313 (_ BitVec 64) V!5417 (_ BitVec 64)) Unit!5555)

(assert (=> b!185065 (= lt!91452 (addStillContains!140 lt!91443 lt!91459 (zeroValue!3614 thiss!1248) lt!91446))))

(assert (=> b!185065 (contains!1272 (+!281 lt!91443 (tuple2!3405 lt!91459 (zeroValue!3614 thiss!1248))) lt!91446)))

(declare-fun lt!91448 () Unit!5555)

(assert (=> b!185065 (= lt!91448 lt!91452)))

(declare-fun lt!91457 () ListLongMap!2313)

(assert (=> b!185065 (= lt!91457 (getCurrentListMapNoExtraKeys!185 (_keys!5707 thiss!1248) (_values!3756 thiss!1248) (mask!8870 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248)))))

(declare-fun lt!91447 () (_ BitVec 64))

(assert (=> b!185065 (= lt!91447 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91450 () (_ BitVec 64))

(assert (=> b!185065 (= lt!91450 (select (arr!3700 (_keys!5707 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91441 () Unit!5555)

(declare-fun addApplyDifferent!140 (ListLongMap!2313 (_ BitVec 64) V!5417 (_ BitVec 64)) Unit!5555)

(assert (=> b!185065 (= lt!91441 (addApplyDifferent!140 lt!91457 lt!91447 (minValue!3614 thiss!1248) lt!91450))))

(assert (=> b!185065 (= (apply!164 (+!281 lt!91457 (tuple2!3405 lt!91447 (minValue!3614 thiss!1248))) lt!91450) (apply!164 lt!91457 lt!91450))))

(declare-fun lt!91442 () Unit!5555)

(assert (=> b!185065 (= lt!91442 lt!91441)))

(declare-fun lt!91456 () ListLongMap!2313)

(assert (=> b!185065 (= lt!91456 (getCurrentListMapNoExtraKeys!185 (_keys!5707 thiss!1248) (_values!3756 thiss!1248) (mask!8870 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248)))))

(declare-fun lt!91445 () (_ BitVec 64))

(assert (=> b!185065 (= lt!91445 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91458 () (_ BitVec 64))

(assert (=> b!185065 (= lt!91458 (select (arr!3700 (_keys!5707 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91449 () Unit!5555)

(assert (=> b!185065 (= lt!91449 (addApplyDifferent!140 lt!91456 lt!91445 (zeroValue!3614 thiss!1248) lt!91458))))

(assert (=> b!185065 (= (apply!164 (+!281 lt!91456 (tuple2!3405 lt!91445 (zeroValue!3614 thiss!1248))) lt!91458) (apply!164 lt!91456 lt!91458))))

(declare-fun lt!91453 () Unit!5555)

(assert (=> b!185065 (= lt!91453 lt!91449)))

(declare-fun lt!91460 () ListLongMap!2313)

(assert (=> b!185065 (= lt!91460 (getCurrentListMapNoExtraKeys!185 (_keys!5707 thiss!1248) (_values!3756 thiss!1248) (mask!8870 thiss!1248) (extraKeys!3510 thiss!1248) (zeroValue!3614 thiss!1248) (minValue!3614 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3773 thiss!1248)))))

(declare-fun lt!91439 () (_ BitVec 64))

(assert (=> b!185065 (= lt!91439 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91451 () (_ BitVec 64))

(assert (=> b!185065 (= lt!91451 (select (arr!3700 (_keys!5707 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185065 (= lt!91444 (addApplyDifferent!140 lt!91460 lt!91439 (minValue!3614 thiss!1248) lt!91451))))

(assert (=> b!185065 (= (apply!164 (+!281 lt!91460 (tuple2!3405 lt!91439 (minValue!3614 thiss!1248))) lt!91451) (apply!164 lt!91460 lt!91451))))

(declare-fun bm!18656 () Bool)

(assert (=> bm!18656 (= call!18658 (contains!1272 lt!91454 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!185066 () Bool)

(declare-fun e!121793 () Bool)

(assert (=> b!185066 (= e!121786 e!121793)))

(declare-fun res!87507 () Bool)

(assert (=> b!185066 (= res!87507 call!18658)))

(assert (=> b!185066 (=> (not res!87507) (not e!121793))))

(declare-fun b!185067 () Bool)

(declare-fun e!121792 () Bool)

(assert (=> b!185067 (= e!121792 (not call!18661))))

(declare-fun b!185068 () Bool)

(declare-fun e!121789 () Bool)

(assert (=> b!185068 (= e!121789 e!121790)))

(declare-fun res!87511 () Bool)

(assert (=> b!185068 (=> (not res!87511) (not e!121790))))

(assert (=> b!185068 (= res!87511 (contains!1272 lt!91454 (select (arr!3700 (_keys!5707 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!185068 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4017 (_keys!5707 thiss!1248))))))

(declare-fun b!185069 () Bool)

(declare-fun e!121783 () ListLongMap!2313)

(declare-fun call!18656 () ListLongMap!2313)

(assert (=> b!185069 (= e!121783 call!18656)))

(declare-fun b!185070 () Bool)

(declare-fun res!87505 () Bool)

(assert (=> b!185070 (=> (not res!87505) (not e!121781))))

(assert (=> b!185070 (= res!87505 e!121789)))

(declare-fun res!87512 () Bool)

(assert (=> b!185070 (=> res!87512 e!121789)))

(declare-fun e!121784 () Bool)

(assert (=> b!185070 (= res!87512 (not e!121784))))

(declare-fun res!87513 () Bool)

(assert (=> b!185070 (=> (not res!87513) (not e!121784))))

(assert (=> b!185070 (= res!87513 (bvslt #b00000000000000000000000000000000 (size!4017 (_keys!5707 thiss!1248))))))

(declare-fun b!185071 () Bool)

(assert (=> b!185071 (= e!121788 e!121783)))

(assert (=> b!185071 (= c!33224 (and (not (= (bvand (extraKeys!3510 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3510 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!185072 () Bool)

(declare-fun c!33219 () Bool)

(assert (=> b!185072 (= c!33219 (and (not (= (bvand (extraKeys!3510 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3510 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!185072 (= e!121783 e!121782)))

(declare-fun bm!18657 () Bool)

(assert (=> bm!18657 (= call!18655 call!18659)))

(declare-fun b!185073 () Bool)

(assert (=> b!185073 (= e!121781 e!121792)))

(declare-fun c!33221 () Bool)

(assert (=> b!185073 (= c!33221 (not (= (bvand (extraKeys!3510 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!185074 () Bool)

(assert (=> b!185074 (= e!121784 (validKeyInArray!0 (select (arr!3700 (_keys!5707 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185075 () Bool)

(declare-fun Unit!5558 () Unit!5555)

(assert (=> b!185075 (= e!121791 Unit!5558)))

(declare-fun bm!18658 () Bool)

(assert (=> bm!18658 (= call!18656 call!18660)))

(declare-fun b!185076 () Bool)

(assert (=> b!185076 (= e!121793 (= (apply!164 lt!91454 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3614 thiss!1248)))))

(declare-fun b!185077 () Bool)

(assert (=> b!185077 (= e!121788 (+!281 call!18660 (tuple2!3405 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3614 thiss!1248))))))

(declare-fun b!185078 () Bool)

(assert (=> b!185078 (= e!121792 e!121787)))

(declare-fun res!87510 () Bool)

(assert (=> b!185078 (= res!87510 call!18661)))

(assert (=> b!185078 (=> (not res!87510) (not e!121787))))

(declare-fun b!185079 () Bool)

(assert (=> b!185079 (= e!121782 call!18656)))

(assert (= (and d!54941 c!33222) b!185077))

(assert (= (and d!54941 (not c!33222)) b!185071))

(assert (= (and b!185071 c!33224) b!185069))

(assert (= (and b!185071 (not c!33224)) b!185072))

(assert (= (and b!185072 c!33219) b!185079))

(assert (= (and b!185072 (not c!33219)) b!185064))

(assert (= (or b!185079 b!185064) bm!18657))

(assert (= (or b!185069 bm!18657) bm!18653))

(assert (= (or b!185069 b!185079) bm!18658))

(assert (= (or b!185077 bm!18653) bm!18654))

(assert (= (or b!185077 bm!18658) bm!18655))

(assert (= (and d!54941 res!87509) b!185061))

(assert (= (and d!54941 c!33223) b!185065))

(assert (= (and d!54941 (not c!33223)) b!185075))

(assert (= (and d!54941 res!87506) b!185070))

(assert (= (and b!185070 res!87513) b!185074))

(assert (= (and b!185070 (not res!87512)) b!185068))

(assert (= (and b!185068 res!87511) b!185060))

(assert (= (and b!185070 res!87505) b!185063))

(assert (= (and b!185063 c!33220) b!185066))

(assert (= (and b!185063 (not c!33220)) b!185059))

(assert (= (and b!185066 res!87507) b!185076))

(assert (= (or b!185066 b!185059) bm!18656))

(assert (= (and b!185063 res!87508) b!185073))

(assert (= (and b!185073 c!33221) b!185078))

(assert (= (and b!185073 (not c!33221)) b!185067))

(assert (= (and b!185078 res!87510) b!185062))

(assert (= (or b!185078 b!185067) bm!18652))

(declare-fun b_lambda!7225 () Bool)

(assert (=> (not b_lambda!7225) (not b!185060)))

(declare-fun t!7215 () Bool)

(declare-fun tb!2831 () Bool)

(assert (=> (and b!184901 (= (defaultEntry!3773 thiss!1248) (defaultEntry!3773 thiss!1248)) t!7215) tb!2831))

(declare-fun result!4787 () Bool)

(assert (=> tb!2831 (= result!4787 tp_is_empty!4327)))

(assert (=> b!185060 t!7215))

(declare-fun b_and!11131 () Bool)

(assert (= b_and!11125 (and (=> t!7215 result!4787) b_and!11131)))

(declare-fun m!211871 () Bool)

(assert (=> bm!18652 m!211871))

(assert (=> b!185068 m!211833))

(assert (=> b!185068 m!211833))

(declare-fun m!211873 () Bool)

(assert (=> b!185068 m!211873))

(declare-fun m!211875 () Bool)

(assert (=> b!185076 m!211875))

(declare-fun m!211877 () Bool)

(assert (=> b!185062 m!211877))

(assert (=> b!185074 m!211833))

(assert (=> b!185074 m!211833))

(assert (=> b!185074 m!211835))

(assert (=> b!185061 m!211833))

(assert (=> b!185061 m!211833))

(assert (=> b!185061 m!211835))

(declare-fun m!211879 () Bool)

(assert (=> bm!18654 m!211879))

(declare-fun m!211881 () Bool)

(assert (=> b!185077 m!211881))

(declare-fun m!211883 () Bool)

(assert (=> bm!18655 m!211883))

(declare-fun m!211885 () Bool)

(assert (=> b!185060 m!211885))

(assert (=> b!185060 m!211833))

(assert (=> b!185060 m!211833))

(declare-fun m!211887 () Bool)

(assert (=> b!185060 m!211887))

(declare-fun m!211889 () Bool)

(assert (=> b!185060 m!211889))

(assert (=> b!185060 m!211885))

(assert (=> b!185060 m!211889))

(declare-fun m!211891 () Bool)

(assert (=> b!185060 m!211891))

(declare-fun m!211893 () Bool)

(assert (=> b!185065 m!211893))

(declare-fun m!211895 () Bool)

(assert (=> b!185065 m!211895))

(assert (=> b!185065 m!211879))

(declare-fun m!211897 () Bool)

(assert (=> b!185065 m!211897))

(declare-fun m!211899 () Bool)

(assert (=> b!185065 m!211899))

(assert (=> b!185065 m!211899))

(declare-fun m!211901 () Bool)

(assert (=> b!185065 m!211901))

(declare-fun m!211903 () Bool)

(assert (=> b!185065 m!211903))

(declare-fun m!211905 () Bool)

(assert (=> b!185065 m!211905))

(declare-fun m!211907 () Bool)

(assert (=> b!185065 m!211907))

(assert (=> b!185065 m!211833))

(declare-fun m!211909 () Bool)

(assert (=> b!185065 m!211909))

(declare-fun m!211911 () Bool)

(assert (=> b!185065 m!211911))

(declare-fun m!211913 () Bool)

(assert (=> b!185065 m!211913))

(declare-fun m!211915 () Bool)

(assert (=> b!185065 m!211915))

(assert (=> b!185065 m!211907))

(declare-fun m!211917 () Bool)

(assert (=> b!185065 m!211917))

(declare-fun m!211919 () Bool)

(assert (=> b!185065 m!211919))

(assert (=> b!185065 m!211911))

(assert (=> b!185065 m!211903))

(declare-fun m!211921 () Bool)

(assert (=> b!185065 m!211921))

(assert (=> d!54941 m!211789))

(declare-fun m!211923 () Bool)

(assert (=> bm!18656 m!211923))

(assert (=> b!184905 d!54941))

(declare-fun d!54943 () Bool)

(assert (=> d!54943 (= (array_inv!2393 (_keys!5707 thiss!1248)) (bvsge (size!4017 (_keys!5707 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184901 d!54943))

(declare-fun d!54945 () Bool)

(assert (=> d!54945 (= (array_inv!2394 (_values!3756 thiss!1248)) (bvsge (size!4018 (_values!3756 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184901 d!54945))

(declare-fun mapNonEmpty!7452 () Bool)

(declare-fun mapRes!7452 () Bool)

(declare-fun tp!16470 () Bool)

(declare-fun e!121798 () Bool)

(assert (=> mapNonEmpty!7452 (= mapRes!7452 (and tp!16470 e!121798))))

(declare-fun mapRest!7452 () (Array (_ BitVec 32) ValueCell!1820))

(declare-fun mapValue!7452 () ValueCell!1820)

(declare-fun mapKey!7452 () (_ BitVec 32))

(assert (=> mapNonEmpty!7452 (= mapRest!7443 (store mapRest!7452 mapKey!7452 mapValue!7452))))

(declare-fun b!185089 () Bool)

(declare-fun e!121799 () Bool)

(assert (=> b!185089 (= e!121799 tp_is_empty!4327)))

(declare-fun mapIsEmpty!7452 () Bool)

(assert (=> mapIsEmpty!7452 mapRes!7452))

(declare-fun b!185088 () Bool)

(assert (=> b!185088 (= e!121798 tp_is_empty!4327)))

(declare-fun condMapEmpty!7452 () Bool)

(declare-fun mapDefault!7452 () ValueCell!1820)

(assert (=> mapNonEmpty!7443 (= condMapEmpty!7452 (= mapRest!7443 ((as const (Array (_ BitVec 32) ValueCell!1820)) mapDefault!7452)))))

(assert (=> mapNonEmpty!7443 (= tp!16454 (and e!121799 mapRes!7452))))

(assert (= (and mapNonEmpty!7443 condMapEmpty!7452) mapIsEmpty!7452))

(assert (= (and mapNonEmpty!7443 (not condMapEmpty!7452)) mapNonEmpty!7452))

(assert (= (and mapNonEmpty!7452 ((_ is ValueCellFull!1820) mapValue!7452)) b!185088))

(assert (= (and mapNonEmpty!7443 ((_ is ValueCellFull!1820) mapDefault!7452)) b!185089))

(declare-fun m!211925 () Bool)

(assert (=> mapNonEmpty!7452 m!211925))

(declare-fun b_lambda!7227 () Bool)

(assert (= b_lambda!7225 (or (and b!184901 b_free!4555) b_lambda!7227)))

(check-sat (not b!184979) b_and!11131 (not b!184988) (not b!185076) (not b!184987) (not bm!18656) (not bm!18652) (not bm!18654) tp_is_empty!4327 (not b_lambda!7227) (not b_next!4555) (not d!54941) (not bm!18637) (not b!185065) (not b!185014) (not bm!18655) (not b!185002) (not b!185062) (not b!184989) (not b!185061) (not d!54933) (not b!185016) (not d!54937) (not d!54939) (not b!185077) (not b!185074) (not b!184980) (not b!185068) (not mapNonEmpty!7452) (not b!185060))
(check-sat b_and!11131 (not b_next!4555))
