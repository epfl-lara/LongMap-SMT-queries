; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21872 () Bool)

(assert start!21872)

(declare-fun b!220918 () Bool)

(declare-fun b_free!5935 () Bool)

(declare-fun b_next!5935 () Bool)

(assert (=> b!220918 (= b_free!5935 (not b_next!5935))))

(declare-fun tp!20946 () Bool)

(declare-fun b_and!12847 () Bool)

(assert (=> b!220918 (= tp!20946 b_and!12847)))

(declare-fun b!220899 () Bool)

(declare-fun e!143601 () Bool)

(declare-fun e!143596 () Bool)

(declare-fun mapRes!9865 () Bool)

(assert (=> b!220899 (= e!143601 (and e!143596 mapRes!9865))))

(declare-fun condMapEmpty!9865 () Bool)

(declare-datatypes ((V!7377 0))(
  ( (V!7378 (val!2943 Int)) )
))
(declare-datatypes ((ValueCell!2555 0))(
  ( (ValueCellFull!2555 (v!4964 V!7377)) (EmptyCell!2555) )
))
(declare-datatypes ((array!10835 0))(
  ( (array!10836 (arr!5137 (Array (_ BitVec 32) ValueCell!2555)) (size!5470 (_ BitVec 32))) )
))
(declare-datatypes ((array!10837 0))(
  ( (array!10838 (arr!5138 (Array (_ BitVec 32) (_ BitVec 64))) (size!5471 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3010 0))(
  ( (LongMapFixedSize!3011 (defaultEntry!4164 Int) (mask!9970 (_ BitVec 32)) (extraKeys!3901 (_ BitVec 32)) (zeroValue!4005 V!7377) (minValue!4005 V!7377) (_size!1554 (_ BitVec 32)) (_keys!6218 array!10837) (_values!4147 array!10835) (_vacant!1554 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3010)

(declare-fun mapDefault!9865 () ValueCell!2555)

(assert (=> b!220899 (= condMapEmpty!9865 (= (arr!5137 (_values!4147 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2555)) mapDefault!9865)))))

(declare-fun b!220900 () Bool)

(declare-fun res!108337 () Bool)

(declare-fun e!143599 () Bool)

(assert (=> b!220900 (=> (not res!108337) (not e!143599))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!220900 (= res!108337 (arrayContainsKey!0 (_keys!6218 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220901 () Bool)

(declare-fun e!143595 () Bool)

(declare-fun e!143605 () Bool)

(assert (=> b!220901 (= e!143595 e!143605)))

(declare-fun res!108336 () Bool)

(assert (=> b!220901 (=> (not res!108336) (not e!143605))))

(declare-datatypes ((SeekEntryResult!792 0))(
  ( (MissingZero!792 (index!5338 (_ BitVec 32))) (Found!792 (index!5339 (_ BitVec 32))) (Intermediate!792 (undefined!1604 Bool) (index!5340 (_ BitVec 32)) (x!22956 (_ BitVec 32))) (Undefined!792) (MissingVacant!792 (index!5341 (_ BitVec 32))) )
))
(declare-fun lt!112336 () SeekEntryResult!792)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!220901 (= res!108336 (or (= lt!112336 (MissingZero!792 index!297)) (= lt!112336 (MissingVacant!792 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10837 (_ BitVec 32)) SeekEntryResult!792)

(assert (=> b!220901 (= lt!112336 (seekEntryOrOpen!0 key!932 (_keys!6218 thiss!1504) (mask!9970 thiss!1504)))))

(declare-fun b!220902 () Bool)

(declare-fun res!108339 () Bool)

(declare-fun e!143603 () Bool)

(assert (=> b!220902 (=> (not res!108339) (not e!143603))))

(assert (=> b!220902 (= res!108339 (= (select (arr!5138 (_keys!6218 thiss!1504)) (index!5338 lt!112336)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!9865 () Bool)

(declare-fun tp!20947 () Bool)

(declare-fun e!143600 () Bool)

(assert (=> mapNonEmpty!9865 (= mapRes!9865 (and tp!20947 e!143600))))

(declare-fun mapValue!9865 () ValueCell!2555)

(declare-fun mapKey!9865 () (_ BitVec 32))

(declare-fun mapRest!9865 () (Array (_ BitVec 32) ValueCell!2555))

(assert (=> mapNonEmpty!9865 (= (arr!5137 (_values!4147 thiss!1504)) (store mapRest!9865 mapKey!9865 mapValue!9865))))

(declare-fun b!220903 () Bool)

(declare-fun e!143604 () Bool)

(declare-fun e!143594 () Bool)

(assert (=> b!220903 (= e!143604 e!143594)))

(declare-fun res!108346 () Bool)

(declare-fun call!20627 () Bool)

(assert (=> b!220903 (= res!108346 call!20627)))

(assert (=> b!220903 (=> (not res!108346) (not e!143594))))

(declare-fun b!220904 () Bool)

(get-info :version)

(assert (=> b!220904 (= e!143604 ((_ is Undefined!792) lt!112336))))

(declare-fun b!220905 () Bool)

(declare-fun call!20628 () Bool)

(assert (=> b!220905 (= e!143594 (not call!20628))))

(declare-fun res!108338 () Bool)

(assert (=> start!21872 (=> (not res!108338) (not e!143595))))

(declare-fun valid!1224 (LongMapFixedSize!3010) Bool)

(assert (=> start!21872 (= res!108338 (valid!1224 thiss!1504))))

(assert (=> start!21872 e!143595))

(declare-fun e!143598 () Bool)

(assert (=> start!21872 e!143598))

(assert (=> start!21872 true))

(declare-fun bm!20624 () Bool)

(declare-fun c!36752 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20624 (= call!20627 (inRange!0 (ite c!36752 (index!5338 lt!112336) (index!5341 lt!112336)) (mask!9970 thiss!1504)))))

(declare-fun b!220906 () Bool)

(declare-fun c!36753 () Bool)

(assert (=> b!220906 (= c!36753 ((_ is MissingVacant!792) lt!112336))))

(declare-fun e!143597 () Bool)

(assert (=> b!220906 (= e!143597 e!143604)))

(declare-fun b!220907 () Bool)

(declare-fun res!108341 () Bool)

(assert (=> b!220907 (= res!108341 (= (select (arr!5138 (_keys!6218 thiss!1504)) (index!5341 lt!112336)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!220907 (=> (not res!108341) (not e!143594))))

(declare-fun b!220908 () Bool)

(declare-fun res!108345 () Bool)

(assert (=> b!220908 (=> (not res!108345) (not e!143599))))

(assert (=> b!220908 (= res!108345 (and (= (size!5470 (_values!4147 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9970 thiss!1504))) (= (size!5471 (_keys!6218 thiss!1504)) (size!5470 (_values!4147 thiss!1504))) (bvsge (mask!9970 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3901 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3901 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!220909 () Bool)

(assert (=> b!220909 (= e!143599 false)))

(declare-fun lt!112332 () Bool)

(declare-datatypes ((List!3179 0))(
  ( (Nil!3176) (Cons!3175 (h!3823 (_ BitVec 64)) (t!8130 List!3179)) )
))
(declare-fun arrayNoDuplicates!0 (array!10837 (_ BitVec 32) List!3179) Bool)

(assert (=> b!220909 (= lt!112332 (arrayNoDuplicates!0 (_keys!6218 thiss!1504) #b00000000000000000000000000000000 Nil!3176))))

(declare-fun b!220910 () Bool)

(declare-datatypes ((Unit!6564 0))(
  ( (Unit!6565) )
))
(declare-fun e!143602 () Unit!6564)

(declare-fun Unit!6566 () Unit!6564)

(assert (=> b!220910 (= e!143602 Unit!6566)))

(declare-fun lt!112335 () Unit!6564)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!204 (array!10837 array!10835 (_ BitVec 32) (_ BitVec 32) V!7377 V!7377 (_ BitVec 64) Int) Unit!6564)

(assert (=> b!220910 (= lt!112335 (lemmaInListMapThenSeekEntryOrOpenFindsIt!204 (_keys!6218 thiss!1504) (_values!4147 thiss!1504) (mask!9970 thiss!1504) (extraKeys!3901 thiss!1504) (zeroValue!4005 thiss!1504) (minValue!4005 thiss!1504) key!932 (defaultEntry!4164 thiss!1504)))))

(assert (=> b!220910 false))

(declare-fun b!220911 () Bool)

(declare-fun lt!112334 () Unit!6564)

(assert (=> b!220911 (= e!143602 lt!112334)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!199 (array!10837 array!10835 (_ BitVec 32) (_ BitVec 32) V!7377 V!7377 (_ BitVec 64) Int) Unit!6564)

(assert (=> b!220911 (= lt!112334 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!199 (_keys!6218 thiss!1504) (_values!4147 thiss!1504) (mask!9970 thiss!1504) (extraKeys!3901 thiss!1504) (zeroValue!4005 thiss!1504) (minValue!4005 thiss!1504) key!932 (defaultEntry!4164 thiss!1504)))))

(assert (=> b!220911 (= c!36752 ((_ is MissingZero!792) lt!112336))))

(assert (=> b!220911 e!143597))

(declare-fun b!220912 () Bool)

(declare-fun res!108335 () Bool)

(assert (=> b!220912 (=> (not res!108335) (not e!143595))))

(assert (=> b!220912 (= res!108335 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220913 () Bool)

(declare-fun res!108340 () Bool)

(assert (=> b!220913 (=> (not res!108340) (not e!143599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10837 (_ BitVec 32)) Bool)

(assert (=> b!220913 (= res!108340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6218 thiss!1504) (mask!9970 thiss!1504)))))

(declare-fun b!220914 () Bool)

(declare-fun tp_is_empty!5797 () Bool)

(assert (=> b!220914 (= e!143596 tp_is_empty!5797)))

(declare-fun b!220915 () Bool)

(declare-fun res!108342 () Bool)

(assert (=> b!220915 (=> (not res!108342) (not e!143603))))

(assert (=> b!220915 (= res!108342 call!20627)))

(assert (=> b!220915 (= e!143597 e!143603)))

(declare-fun b!220916 () Bool)

(assert (=> b!220916 (= e!143600 tp_is_empty!5797)))

(declare-fun b!220917 () Bool)

(declare-fun res!108344 () Bool)

(assert (=> b!220917 (=> (not res!108344) (not e!143599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220917 (= res!108344 (validMask!0 (mask!9970 thiss!1504)))))

(declare-fun array_inv!3371 (array!10837) Bool)

(declare-fun array_inv!3372 (array!10835) Bool)

(assert (=> b!220918 (= e!143598 (and tp!20946 tp_is_empty!5797 (array_inv!3371 (_keys!6218 thiss!1504)) (array_inv!3372 (_values!4147 thiss!1504)) e!143601))))

(declare-fun mapIsEmpty!9865 () Bool)

(assert (=> mapIsEmpty!9865 mapRes!9865))

(declare-fun b!220919 () Bool)

(assert (=> b!220919 (= e!143605 e!143599)))

(declare-fun res!108343 () Bool)

(assert (=> b!220919 (=> (not res!108343) (not e!143599))))

(assert (=> b!220919 (= res!108343 (inRange!0 index!297 (mask!9970 thiss!1504)))))

(declare-fun lt!112333 () Unit!6564)

(assert (=> b!220919 (= lt!112333 e!143602)))

(declare-fun c!36754 () Bool)

(declare-datatypes ((tuple2!4284 0))(
  ( (tuple2!4285 (_1!2153 (_ BitVec 64)) (_2!2153 V!7377)) )
))
(declare-datatypes ((List!3180 0))(
  ( (Nil!3177) (Cons!3176 (h!3824 tuple2!4284) (t!8131 List!3180)) )
))
(declare-datatypes ((ListLongMap!3199 0))(
  ( (ListLongMap!3200 (toList!1615 List!3180)) )
))
(declare-fun contains!1472 (ListLongMap!3199 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1147 (array!10837 array!10835 (_ BitVec 32) (_ BitVec 32) V!7377 V!7377 (_ BitVec 32) Int) ListLongMap!3199)

(assert (=> b!220919 (= c!36754 (contains!1472 (getCurrentListMap!1147 (_keys!6218 thiss!1504) (_values!4147 thiss!1504) (mask!9970 thiss!1504) (extraKeys!3901 thiss!1504) (zeroValue!4005 thiss!1504) (minValue!4005 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4164 thiss!1504)) key!932))))

(declare-fun bm!20625 () Bool)

(assert (=> bm!20625 (= call!20628 (arrayContainsKey!0 (_keys!6218 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220920 () Bool)

(assert (=> b!220920 (= e!143603 (not call!20628))))

(assert (= (and start!21872 res!108338) b!220912))

(assert (= (and b!220912 res!108335) b!220901))

(assert (= (and b!220901 res!108336) b!220919))

(assert (= (and b!220919 c!36754) b!220910))

(assert (= (and b!220919 (not c!36754)) b!220911))

(assert (= (and b!220911 c!36752) b!220915))

(assert (= (and b!220911 (not c!36752)) b!220906))

(assert (= (and b!220915 res!108342) b!220902))

(assert (= (and b!220902 res!108339) b!220920))

(assert (= (and b!220906 c!36753) b!220903))

(assert (= (and b!220906 (not c!36753)) b!220904))

(assert (= (and b!220903 res!108346) b!220907))

(assert (= (and b!220907 res!108341) b!220905))

(assert (= (or b!220915 b!220903) bm!20624))

(assert (= (or b!220920 b!220905) bm!20625))

(assert (= (and b!220919 res!108343) b!220900))

(assert (= (and b!220900 res!108337) b!220917))

(assert (= (and b!220917 res!108344) b!220908))

(assert (= (and b!220908 res!108345) b!220913))

(assert (= (and b!220913 res!108340) b!220909))

(assert (= (and b!220899 condMapEmpty!9865) mapIsEmpty!9865))

(assert (= (and b!220899 (not condMapEmpty!9865)) mapNonEmpty!9865))

(assert (= (and mapNonEmpty!9865 ((_ is ValueCellFull!2555) mapValue!9865)) b!220916))

(assert (= (and b!220899 ((_ is ValueCellFull!2555) mapDefault!9865)) b!220914))

(assert (= b!220918 b!220899))

(assert (= start!21872 b!220918))

(declare-fun m!245959 () Bool)

(assert (=> b!220902 m!245959))

(declare-fun m!245961 () Bool)

(assert (=> mapNonEmpty!9865 m!245961))

(declare-fun m!245963 () Bool)

(assert (=> bm!20625 m!245963))

(declare-fun m!245965 () Bool)

(assert (=> b!220901 m!245965))

(declare-fun m!245967 () Bool)

(assert (=> bm!20624 m!245967))

(declare-fun m!245969 () Bool)

(assert (=> b!220909 m!245969))

(declare-fun m!245971 () Bool)

(assert (=> b!220919 m!245971))

(declare-fun m!245973 () Bool)

(assert (=> b!220919 m!245973))

(assert (=> b!220919 m!245973))

(declare-fun m!245975 () Bool)

(assert (=> b!220919 m!245975))

(declare-fun m!245977 () Bool)

(assert (=> b!220913 m!245977))

(declare-fun m!245979 () Bool)

(assert (=> b!220911 m!245979))

(declare-fun m!245981 () Bool)

(assert (=> start!21872 m!245981))

(declare-fun m!245983 () Bool)

(assert (=> b!220917 m!245983))

(declare-fun m!245985 () Bool)

(assert (=> b!220907 m!245985))

(assert (=> b!220900 m!245963))

(declare-fun m!245987 () Bool)

(assert (=> b!220918 m!245987))

(declare-fun m!245989 () Bool)

(assert (=> b!220918 m!245989))

(declare-fun m!245991 () Bool)

(assert (=> b!220910 m!245991))

(check-sat tp_is_empty!5797 (not b_next!5935) b_and!12847 (not b!220911) (not b!220917) (not bm!20625) (not b!220900) (not b!220901) (not mapNonEmpty!9865) (not bm!20624) (not b!220909) (not b!220918) (not b!220919) (not b!220910) (not b!220913) (not start!21872))
(check-sat b_and!12847 (not b_next!5935))
