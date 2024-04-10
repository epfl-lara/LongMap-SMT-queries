; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21966 () Bool)

(assert start!21966)

(declare-fun b!224904 () Bool)

(declare-fun b_free!6033 () Bool)

(declare-fun b_next!6033 () Bool)

(assert (=> b!224904 (= b_free!6033 (not b_next!6033))))

(declare-fun tp!21240 () Bool)

(declare-fun b_and!12931 () Bool)

(assert (=> b!224904 (= tp!21240 b_and!12931)))

(declare-fun b!224902 () Bool)

(declare-fun c!37295 () Bool)

(declare-datatypes ((SeekEntryResult!862 0))(
  ( (MissingZero!862 (index!5618 (_ BitVec 32))) (Found!862 (index!5619 (_ BitVec 32))) (Intermediate!862 (undefined!1674 Bool) (index!5620 (_ BitVec 32)) (x!23154 (_ BitVec 32))) (Undefined!862) (MissingVacant!862 (index!5621 (_ BitVec 32))) )
))
(declare-fun lt!113313 () SeekEntryResult!862)

(get-info :version)

(assert (=> b!224902 (= c!37295 ((_ is MissingVacant!862) lt!113313))))

(declare-fun e!146001 () Bool)

(declare-fun e!146003 () Bool)

(assert (=> b!224902 (= e!146001 e!146003)))

(declare-fun b!224903 () Bool)

(declare-fun res!110677 () Bool)

(declare-fun e!145998 () Bool)

(assert (=> b!224903 (=> (not res!110677) (not e!145998))))

(declare-datatypes ((V!7507 0))(
  ( (V!7508 (val!2992 Int)) )
))
(declare-datatypes ((ValueCell!2604 0))(
  ( (ValueCellFull!2604 (v!5012 V!7507)) (EmptyCell!2604) )
))
(declare-datatypes ((array!11033 0))(
  ( (array!11034 (arr!5236 (Array (_ BitVec 32) ValueCell!2604)) (size!5569 (_ BitVec 32))) )
))
(declare-datatypes ((array!11035 0))(
  ( (array!11036 (arr!5237 (Array (_ BitVec 32) (_ BitVec 64))) (size!5570 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3108 0))(
  ( (LongMapFixedSize!3109 (defaultEntry!4213 Int) (mask!10051 (_ BitVec 32)) (extraKeys!3950 (_ BitVec 32)) (zeroValue!4054 V!7507) (minValue!4054 V!7507) (_size!1603 (_ BitVec 32)) (_keys!6267 array!11035) (_values!4196 array!11033) (_vacant!1603 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3108)

(assert (=> b!224903 (= res!110677 (= (select (arr!5237 (_keys!6267 thiss!1504)) (index!5618 lt!113313)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!145996 () Bool)

(declare-fun e!146004 () Bool)

(declare-fun tp_is_empty!5895 () Bool)

(declare-fun array_inv!3465 (array!11035) Bool)

(declare-fun array_inv!3466 (array!11033) Bool)

(assert (=> b!224904 (= e!145996 (and tp!21240 tp_is_empty!5895 (array_inv!3465 (_keys!6267 thiss!1504)) (array_inv!3466 (_values!4196 thiss!1504)) e!146004))))

(declare-fun b!224905 () Bool)

(declare-fun res!110675 () Bool)

(declare-fun e!146005 () Bool)

(assert (=> b!224905 (=> res!110675 e!146005)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!224905 (= res!110675 (not (validKeyInArray!0 key!932)))))

(declare-fun mapIsEmpty!10012 () Bool)

(declare-fun mapRes!10012 () Bool)

(assert (=> mapIsEmpty!10012 mapRes!10012))

(declare-fun b!224906 () Bool)

(declare-fun res!110676 () Bool)

(assert (=> b!224906 (=> res!110676 e!146005)))

(declare-fun lt!113308 () Bool)

(assert (=> b!224906 (= res!110676 lt!113308)))

(declare-fun b!224907 () Bool)

(declare-fun e!145995 () Bool)

(assert (=> b!224907 (= e!145995 (not e!146005))))

(declare-fun res!110679 () Bool)

(assert (=> b!224907 (=> res!110679 e!146005)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!224907 (= res!110679 (not (validMask!0 (mask!10051 thiss!1504))))))

(declare-fun lt!113311 () array!11035)

(declare-fun arrayCountValidKeys!0 (array!11035 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!224907 (= (arrayCountValidKeys!0 lt!113311 #b00000000000000000000000000000000 (size!5570 (_keys!6267 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6267 thiss!1504) #b00000000000000000000000000000000 (size!5570 (_keys!6267 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((Unit!6770 0))(
  ( (Unit!6771) )
))
(declare-fun lt!113315 () Unit!6770)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11035 (_ BitVec 32) (_ BitVec 64)) Unit!6770)

(assert (=> b!224907 (= lt!113315 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6267 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3344 0))(
  ( (Nil!3341) (Cons!3340 (h!3988 (_ BitVec 64)) (t!8303 List!3344)) )
))
(declare-fun arrayNoDuplicates!0 (array!11035 (_ BitVec 32) List!3344) Bool)

(assert (=> b!224907 (arrayNoDuplicates!0 lt!113311 #b00000000000000000000000000000000 Nil!3341)))

(assert (=> b!224907 (= lt!113311 (array!11036 (store (arr!5237 (_keys!6267 thiss!1504)) index!297 key!932) (size!5570 (_keys!6267 thiss!1504))))))

(declare-fun lt!113309 () Unit!6770)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11035 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3344) Unit!6770)

(assert (=> b!224907 (= lt!113309 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6267 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3341))))

(declare-fun lt!113317 () Unit!6770)

(declare-fun e!145999 () Unit!6770)

(assert (=> b!224907 (= lt!113317 e!145999)))

(declare-fun c!37293 () Bool)

(assert (=> b!224907 (= c!37293 lt!113308)))

(declare-fun arrayContainsKey!0 (array!11035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224907 (= lt!113308 (arrayContainsKey!0 (_keys!6267 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224908 () Bool)

(declare-fun e!146000 () Unit!6770)

(declare-fun Unit!6772 () Unit!6770)

(assert (=> b!224908 (= e!146000 Unit!6772)))

(declare-fun lt!113312 () Unit!6770)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!243 (array!11035 array!11033 (_ BitVec 32) (_ BitVec 32) V!7507 V!7507 (_ BitVec 64) Int) Unit!6770)

(assert (=> b!224908 (= lt!113312 (lemmaInListMapThenSeekEntryOrOpenFindsIt!243 (_keys!6267 thiss!1504) (_values!4196 thiss!1504) (mask!10051 thiss!1504) (extraKeys!3950 thiss!1504) (zeroValue!4054 thiss!1504) (minValue!4054 thiss!1504) key!932 (defaultEntry!4213 thiss!1504)))))

(assert (=> b!224908 false))

(declare-fun res!110678 () Bool)

(declare-fun e!146006 () Bool)

(assert (=> start!21966 (=> (not res!110678) (not e!146006))))

(declare-fun valid!1253 (LongMapFixedSize!3108) Bool)

(assert (=> start!21966 (= res!110678 (valid!1253 thiss!1504))))

(assert (=> start!21966 e!146006))

(assert (=> start!21966 e!145996))

(assert (=> start!21966 true))

(declare-fun b!224909 () Bool)

(assert (=> b!224909 (= e!146003 ((_ is Undefined!862) lt!113313))))

(declare-fun b!224910 () Bool)

(declare-fun e!146008 () Bool)

(declare-fun call!20934 () Bool)

(assert (=> b!224910 (= e!146008 (not call!20934))))

(declare-fun b!224911 () Bool)

(declare-fun lt!113314 () Unit!6770)

(assert (=> b!224911 (= e!146000 lt!113314)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!254 (array!11035 array!11033 (_ BitVec 32) (_ BitVec 32) V!7507 V!7507 (_ BitVec 64) Int) Unit!6770)

(assert (=> b!224911 (= lt!113314 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!254 (_keys!6267 thiss!1504) (_values!4196 thiss!1504) (mask!10051 thiss!1504) (extraKeys!3950 thiss!1504) (zeroValue!4054 thiss!1504) (minValue!4054 thiss!1504) key!932 (defaultEntry!4213 thiss!1504)))))

(declare-fun c!37294 () Bool)

(assert (=> b!224911 (= c!37294 ((_ is MissingZero!862) lt!113313))))

(assert (=> b!224911 e!146001))

(declare-fun b!224912 () Bool)

(declare-fun e!146002 () Bool)

(assert (=> b!224912 (= e!146006 e!146002)))

(declare-fun res!110669 () Bool)

(assert (=> b!224912 (=> (not res!110669) (not e!146002))))

(assert (=> b!224912 (= res!110669 (or (= lt!113313 (MissingZero!862 index!297)) (= lt!113313 (MissingVacant!862 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11035 (_ BitVec 32)) SeekEntryResult!862)

(assert (=> b!224912 (= lt!113313 (seekEntryOrOpen!0 key!932 (_keys!6267 thiss!1504) (mask!10051 thiss!1504)))))

(declare-fun call!20933 () Bool)

(declare-fun bm!20930 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20930 (= call!20933 (inRange!0 (ite c!37294 (index!5618 lt!113313) (index!5621 lt!113313)) (mask!10051 thiss!1504)))))

(declare-fun b!224913 () Bool)

(declare-fun Unit!6773 () Unit!6770)

(assert (=> b!224913 (= e!145999 Unit!6773)))

(declare-fun lt!113316 () Unit!6770)

(declare-fun lemmaArrayContainsKeyThenInListMap!82 (array!11035 array!11033 (_ BitVec 32) (_ BitVec 32) V!7507 V!7507 (_ BitVec 64) (_ BitVec 32) Int) Unit!6770)

(assert (=> b!224913 (= lt!113316 (lemmaArrayContainsKeyThenInListMap!82 (_keys!6267 thiss!1504) (_values!4196 thiss!1504) (mask!10051 thiss!1504) (extraKeys!3950 thiss!1504) (zeroValue!4054 thiss!1504) (minValue!4054 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4213 thiss!1504)))))

(assert (=> b!224913 false))

(declare-fun b!224914 () Bool)

(declare-fun e!145997 () Bool)

(assert (=> b!224914 (= e!146004 (and e!145997 mapRes!10012))))

(declare-fun condMapEmpty!10012 () Bool)

(declare-fun mapDefault!10012 () ValueCell!2604)

(assert (=> b!224914 (= condMapEmpty!10012 (= (arr!5236 (_values!4196 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2604)) mapDefault!10012)))))

(declare-fun b!224915 () Bool)

(declare-fun Unit!6774 () Unit!6770)

(assert (=> b!224915 (= e!145999 Unit!6774)))

(declare-fun b!224916 () Bool)

(declare-fun e!146007 () Bool)

(assert (=> b!224916 (= e!146007 tp_is_empty!5895)))

(declare-fun bm!20931 () Bool)

(assert (=> bm!20931 (= call!20934 (arrayContainsKey!0 (_keys!6267 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224917 () Bool)

(declare-fun res!110673 () Bool)

(assert (=> b!224917 (=> (not res!110673) (not e!146006))))

(assert (=> b!224917 (= res!110673 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!224918 () Bool)

(assert (=> b!224918 (= e!146005 true)))

(declare-fun lt!113318 () Bool)

(assert (=> b!224918 (= lt!113318 (arrayNoDuplicates!0 (_keys!6267 thiss!1504) #b00000000000000000000000000000000 Nil!3341))))

(declare-fun mapNonEmpty!10012 () Bool)

(declare-fun tp!21241 () Bool)

(assert (=> mapNonEmpty!10012 (= mapRes!10012 (and tp!21241 e!146007))))

(declare-fun mapKey!10012 () (_ BitVec 32))

(declare-fun mapValue!10012 () ValueCell!2604)

(declare-fun mapRest!10012 () (Array (_ BitVec 32) ValueCell!2604))

(assert (=> mapNonEmpty!10012 (= (arr!5236 (_values!4196 thiss!1504)) (store mapRest!10012 mapKey!10012 mapValue!10012))))

(declare-fun b!224919 () Bool)

(assert (=> b!224919 (= e!145998 (not call!20934))))

(declare-fun b!224920 () Bool)

(assert (=> b!224920 (= e!146002 e!145995)))

(declare-fun res!110670 () Bool)

(assert (=> b!224920 (=> (not res!110670) (not e!145995))))

(assert (=> b!224920 (= res!110670 (inRange!0 index!297 (mask!10051 thiss!1504)))))

(declare-fun lt!113310 () Unit!6770)

(assert (=> b!224920 (= lt!113310 e!146000)))

(declare-fun c!37296 () Bool)

(declare-datatypes ((tuple2!4432 0))(
  ( (tuple2!4433 (_1!2227 (_ BitVec 64)) (_2!2227 V!7507)) )
))
(declare-datatypes ((List!3345 0))(
  ( (Nil!3342) (Cons!3341 (h!3989 tuple2!4432) (t!8304 List!3345)) )
))
(declare-datatypes ((ListLongMap!3345 0))(
  ( (ListLongMap!3346 (toList!1688 List!3345)) )
))
(declare-fun contains!1562 (ListLongMap!3345 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1216 (array!11035 array!11033 (_ BitVec 32) (_ BitVec 32) V!7507 V!7507 (_ BitVec 32) Int) ListLongMap!3345)

(assert (=> b!224920 (= c!37296 (contains!1562 (getCurrentListMap!1216 (_keys!6267 thiss!1504) (_values!4196 thiss!1504) (mask!10051 thiss!1504) (extraKeys!3950 thiss!1504) (zeroValue!4054 thiss!1504) (minValue!4054 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4213 thiss!1504)) key!932))))

(declare-fun b!224921 () Bool)

(declare-fun res!110680 () Bool)

(assert (=> b!224921 (=> res!110680 e!146005)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11035 (_ BitVec 32)) Bool)

(assert (=> b!224921 (= res!110680 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6267 thiss!1504) (mask!10051 thiss!1504))))))

(declare-fun b!224922 () Bool)

(declare-fun res!110672 () Bool)

(assert (=> b!224922 (= res!110672 (= (select (arr!5237 (_keys!6267 thiss!1504)) (index!5621 lt!113313)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!224922 (=> (not res!110672) (not e!146008))))

(declare-fun b!224923 () Bool)

(declare-fun res!110671 () Bool)

(assert (=> b!224923 (=> (not res!110671) (not e!145998))))

(assert (=> b!224923 (= res!110671 call!20933)))

(assert (=> b!224923 (= e!146001 e!145998)))

(declare-fun b!224924 () Bool)

(assert (=> b!224924 (= e!145997 tp_is_empty!5895)))

(declare-fun b!224925 () Bool)

(assert (=> b!224925 (= e!146003 e!146008)))

(declare-fun res!110674 () Bool)

(assert (=> b!224925 (= res!110674 call!20933)))

(assert (=> b!224925 (=> (not res!110674) (not e!146008))))

(declare-fun b!224926 () Bool)

(declare-fun res!110668 () Bool)

(assert (=> b!224926 (=> res!110668 e!146005)))

(assert (=> b!224926 (= res!110668 (or (not (= (size!5570 (_keys!6267 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10051 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5570 (_keys!6267 thiss!1504)))))))

(assert (= (and start!21966 res!110678) b!224917))

(assert (= (and b!224917 res!110673) b!224912))

(assert (= (and b!224912 res!110669) b!224920))

(assert (= (and b!224920 c!37296) b!224908))

(assert (= (and b!224920 (not c!37296)) b!224911))

(assert (= (and b!224911 c!37294) b!224923))

(assert (= (and b!224911 (not c!37294)) b!224902))

(assert (= (and b!224923 res!110671) b!224903))

(assert (= (and b!224903 res!110677) b!224919))

(assert (= (and b!224902 c!37295) b!224925))

(assert (= (and b!224902 (not c!37295)) b!224909))

(assert (= (and b!224925 res!110674) b!224922))

(assert (= (and b!224922 res!110672) b!224910))

(assert (= (or b!224923 b!224925) bm!20930))

(assert (= (or b!224919 b!224910) bm!20931))

(assert (= (and b!224920 res!110670) b!224907))

(assert (= (and b!224907 c!37293) b!224913))

(assert (= (and b!224907 (not c!37293)) b!224915))

(assert (= (and b!224907 (not res!110679)) b!224926))

(assert (= (and b!224926 (not res!110668)) b!224905))

(assert (= (and b!224905 (not res!110675)) b!224906))

(assert (= (and b!224906 (not res!110676)) b!224921))

(assert (= (and b!224921 (not res!110680)) b!224918))

(assert (= (and b!224914 condMapEmpty!10012) mapIsEmpty!10012))

(assert (= (and b!224914 (not condMapEmpty!10012)) mapNonEmpty!10012))

(assert (= (and mapNonEmpty!10012 ((_ is ValueCellFull!2604) mapValue!10012)) b!224916))

(assert (= (and b!224914 ((_ is ValueCellFull!2604) mapDefault!10012)) b!224924))

(assert (= b!224904 b!224914))

(assert (= start!21966 b!224904))

(declare-fun m!247699 () Bool)

(assert (=> bm!20931 m!247699))

(declare-fun m!247701 () Bool)

(assert (=> b!224921 m!247701))

(declare-fun m!247703 () Bool)

(assert (=> b!224922 m!247703))

(declare-fun m!247705 () Bool)

(assert (=> b!224908 m!247705))

(declare-fun m!247707 () Bool)

(assert (=> bm!20930 m!247707))

(declare-fun m!247709 () Bool)

(assert (=> b!224904 m!247709))

(declare-fun m!247711 () Bool)

(assert (=> b!224904 m!247711))

(declare-fun m!247713 () Bool)

(assert (=> b!224912 m!247713))

(declare-fun m!247715 () Bool)

(assert (=> b!224920 m!247715))

(declare-fun m!247717 () Bool)

(assert (=> b!224920 m!247717))

(assert (=> b!224920 m!247717))

(declare-fun m!247719 () Bool)

(assert (=> b!224920 m!247719))

(declare-fun m!247721 () Bool)

(assert (=> mapNonEmpty!10012 m!247721))

(declare-fun m!247723 () Bool)

(assert (=> start!21966 m!247723))

(declare-fun m!247725 () Bool)

(assert (=> b!224905 m!247725))

(declare-fun m!247727 () Bool)

(assert (=> b!224918 m!247727))

(declare-fun m!247729 () Bool)

(assert (=> b!224913 m!247729))

(declare-fun m!247731 () Bool)

(assert (=> b!224911 m!247731))

(declare-fun m!247733 () Bool)

(assert (=> b!224907 m!247733))

(declare-fun m!247735 () Bool)

(assert (=> b!224907 m!247735))

(declare-fun m!247737 () Bool)

(assert (=> b!224907 m!247737))

(declare-fun m!247739 () Bool)

(assert (=> b!224907 m!247739))

(assert (=> b!224907 m!247699))

(declare-fun m!247741 () Bool)

(assert (=> b!224907 m!247741))

(declare-fun m!247743 () Bool)

(assert (=> b!224907 m!247743))

(declare-fun m!247745 () Bool)

(assert (=> b!224907 m!247745))

(declare-fun m!247747 () Bool)

(assert (=> b!224903 m!247747))

(check-sat (not b!224913) b_and!12931 (not bm!20930) (not bm!20931) (not start!21966) tp_is_empty!5895 (not b!224918) (not b!224908) (not b!224912) (not b!224905) (not b_next!6033) (not b!224920) (not b!224911) (not b!224907) (not b!224904) (not mapNonEmpty!10012) (not b!224921))
(check-sat b_and!12931 (not b_next!6033))
