; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24918 () Bool)

(assert start!24918)

(declare-fun b!259851 () Bool)

(declare-fun b_free!6757 () Bool)

(declare-fun b_next!6757 () Bool)

(assert (=> b!259851 (= b_free!6757 (not b_next!6757))))

(declare-fun tp!23594 () Bool)

(declare-fun b_and!13837 () Bool)

(assert (=> b!259851 (= tp!23594 b_and!13837)))

(declare-fun mapIsEmpty!11279 () Bool)

(declare-fun mapRes!11279 () Bool)

(assert (=> mapIsEmpty!11279 mapRes!11279))

(declare-fun b!259849 () Bool)

(declare-fun res!127000 () Bool)

(declare-fun e!168410 () Bool)

(assert (=> b!259849 (=> (not res!127000) (not e!168410))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!259849 (= res!127000 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!259850 () Bool)

(declare-fun e!168406 () Bool)

(declare-fun call!24756 () Bool)

(assert (=> b!259850 (= e!168406 (not call!24756))))

(declare-fun e!168413 () Bool)

(declare-fun e!168411 () Bool)

(declare-datatypes ((V!8473 0))(
  ( (V!8474 (val!3354 Int)) )
))
(declare-datatypes ((ValueCell!2966 0))(
  ( (ValueCellFull!2966 (v!5461 V!8473)) (EmptyCell!2966) )
))
(declare-datatypes ((array!12583 0))(
  ( (array!12584 (arr!5955 (Array (_ BitVec 32) ValueCell!2966)) (size!6305 (_ BitVec 32))) )
))
(declare-datatypes ((array!12585 0))(
  ( (array!12586 (arr!5956 (Array (_ BitVec 32) (_ BitVec 64))) (size!6306 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3832 0))(
  ( (LongMapFixedSize!3833 (defaultEntry!4794 Int) (mask!11119 (_ BitVec 32)) (extraKeys!4531 (_ BitVec 32)) (zeroValue!4635 V!8473) (minValue!4635 V!8473) (_size!1965 (_ BitVec 32)) (_keys!6973 array!12585) (_values!4777 array!12583) (_vacant!1965 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3832)

(declare-fun tp_is_empty!6619 () Bool)

(declare-fun array_inv!3939 (array!12585) Bool)

(declare-fun array_inv!3940 (array!12583) Bool)

(assert (=> b!259851 (= e!168411 (and tp!23594 tp_is_empty!6619 (array_inv!3939 (_keys!6973 thiss!1504)) (array_inv!3940 (_values!4777 thiss!1504)) e!168413))))

(declare-fun b!259852 () Bool)

(declare-fun e!168403 () Bool)

(declare-fun e!168401 () Bool)

(assert (=> b!259852 (= e!168403 e!168401)))

(declare-fun res!126997 () Bool)

(assert (=> b!259852 (=> (not res!126997) (not e!168401))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!259852 (= res!126997 (inRange!0 index!297 (mask!11119 thiss!1504)))))

(declare-datatypes ((Unit!8037 0))(
  ( (Unit!8038) )
))
(declare-fun lt!130899 () Unit!8037)

(declare-fun e!168402 () Unit!8037)

(assert (=> b!259852 (= lt!130899 e!168402)))

(declare-fun c!44133 () Bool)

(declare-datatypes ((tuple2!4894 0))(
  ( (tuple2!4895 (_1!2458 (_ BitVec 64)) (_2!2458 V!8473)) )
))
(declare-datatypes ((List!3792 0))(
  ( (Nil!3789) (Cons!3788 (h!4452 tuple2!4894) (t!8852 List!3792)) )
))
(declare-datatypes ((ListLongMap!3797 0))(
  ( (ListLongMap!3798 (toList!1914 List!3792)) )
))
(declare-fun lt!130910 () ListLongMap!3797)

(declare-fun contains!1870 (ListLongMap!3797 (_ BitVec 64)) Bool)

(assert (=> b!259852 (= c!44133 (contains!1870 lt!130910 key!932))))

(declare-fun getCurrentListMap!1423 (array!12585 array!12583 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 32) Int) ListLongMap!3797)

(assert (=> b!259852 (= lt!130910 (getCurrentListMap!1423 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun b!259853 () Bool)

(declare-fun res!126996 () Bool)

(declare-datatypes ((SeekEntryResult!1177 0))(
  ( (MissingZero!1177 (index!6878 (_ BitVec 32))) (Found!1177 (index!6879 (_ BitVec 32))) (Intermediate!1177 (undefined!1989 Bool) (index!6880 (_ BitVec 32)) (x!25114 (_ BitVec 32))) (Undefined!1177) (MissingVacant!1177 (index!6881 (_ BitVec 32))) )
))
(declare-fun lt!130906 () SeekEntryResult!1177)

(assert (=> b!259853 (= res!126996 (= (select (arr!5956 (_keys!6973 thiss!1504)) (index!6881 lt!130906)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168407 () Bool)

(assert (=> b!259853 (=> (not res!126996) (not e!168407))))

(declare-fun b!259854 () Bool)

(assert (=> b!259854 (= e!168407 (not call!24756))))

(declare-fun b!259855 () Bool)

(declare-fun c!44134 () Bool)

(get-info :version)

(assert (=> b!259855 (= c!44134 ((_ is MissingVacant!1177) lt!130906))))

(declare-fun e!168405 () Bool)

(declare-fun e!168408 () Bool)

(assert (=> b!259855 (= e!168405 e!168408)))

(declare-fun b!259856 () Bool)

(declare-fun e!168400 () Bool)

(assert (=> b!259856 (= e!168400 (or (not (= (size!6305 (_values!4777 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11119 thiss!1504)))) (not (= (size!6306 (_keys!6973 thiss!1504)) (size!6305 (_values!4777 thiss!1504)))) (bvslt (mask!11119 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4531 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun call!24755 () Bool)

(declare-fun c!44136 () Bool)

(declare-fun bm!24752 () Bool)

(assert (=> bm!24752 (= call!24755 (inRange!0 (ite c!44136 (index!6878 lt!130906) (index!6881 lt!130906)) (mask!11119 thiss!1504)))))

(declare-fun b!259857 () Bool)

(assert (=> b!259857 (= e!168401 (not e!168400))))

(declare-fun res!126995 () Bool)

(assert (=> b!259857 (=> res!126995 e!168400)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!259857 (= res!126995 (not (validMask!0 (mask!11119 thiss!1504))))))

(declare-fun lt!130908 () array!12585)

(declare-fun arrayCountValidKeys!0 (array!12585 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!259857 (= (arrayCountValidKeys!0 lt!130908 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!130898 () Unit!8037)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12585 (_ BitVec 32)) Unit!8037)

(assert (=> b!259857 (= lt!130898 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!130908 index!297))))

(declare-fun arrayContainsKey!0 (array!12585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!259857 (arrayContainsKey!0 lt!130908 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!130904 () Unit!8037)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12585 (_ BitVec 64) (_ BitVec 32)) Unit!8037)

(assert (=> b!259857 (= lt!130904 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130908 key!932 index!297))))

(declare-fun v!346 () V!8473)

(declare-fun +!701 (ListLongMap!3797 tuple2!4894) ListLongMap!3797)

(assert (=> b!259857 (= (+!701 lt!130910 (tuple2!4895 key!932 v!346)) (getCurrentListMap!1423 lt!130908 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!130905 () Unit!8037)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!112 (array!12585 array!12583 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 32) (_ BitVec 64) V!8473 Int) Unit!8037)

(assert (=> b!259857 (= lt!130905 (lemmaAddValidKeyToArrayThenAddPairToListMap!112 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) index!297 key!932 v!346 (defaultEntry!4794 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12585 (_ BitVec 32)) Bool)

(assert (=> b!259857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!130908 (mask!11119 thiss!1504))))

(declare-fun lt!130900 () Unit!8037)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12585 (_ BitVec 32) (_ BitVec 32)) Unit!8037)

(assert (=> b!259857 (= lt!130900 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6973 thiss!1504) index!297 (mask!11119 thiss!1504)))))

(assert (=> b!259857 (= (arrayCountValidKeys!0 lt!130908 #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6973 thiss!1504) #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504)))))))

(declare-fun lt!130902 () Unit!8037)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12585 (_ BitVec 32) (_ BitVec 64)) Unit!8037)

(assert (=> b!259857 (= lt!130902 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6973 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3793 0))(
  ( (Nil!3790) (Cons!3789 (h!4453 (_ BitVec 64)) (t!8853 List!3793)) )
))
(declare-fun arrayNoDuplicates!0 (array!12585 (_ BitVec 32) List!3793) Bool)

(assert (=> b!259857 (arrayNoDuplicates!0 lt!130908 #b00000000000000000000000000000000 Nil!3790)))

(assert (=> b!259857 (= lt!130908 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))))))

(declare-fun lt!130909 () Unit!8037)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12585 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3793) Unit!8037)

(assert (=> b!259857 (= lt!130909 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6973 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3790))))

(declare-fun lt!130907 () Unit!8037)

(declare-fun e!168409 () Unit!8037)

(assert (=> b!259857 (= lt!130907 e!168409)))

(declare-fun c!44135 () Bool)

(assert (=> b!259857 (= c!44135 (arrayContainsKey!0 (_keys!6973 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!259858 () Bool)

(declare-fun Unit!8039 () Unit!8037)

(assert (=> b!259858 (= e!168402 Unit!8039)))

(declare-fun lt!130901 () Unit!8037)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!437 (array!12585 array!12583 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 64) Int) Unit!8037)

(assert (=> b!259858 (= lt!130901 (lemmaInListMapThenSeekEntryOrOpenFindsIt!437 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 (defaultEntry!4794 thiss!1504)))))

(assert (=> b!259858 false))

(declare-fun b!259859 () Bool)

(declare-fun Unit!8040 () Unit!8037)

(assert (=> b!259859 (= e!168409 Unit!8040)))

(declare-fun b!259860 () Bool)

(declare-fun e!168404 () Bool)

(assert (=> b!259860 (= e!168404 tp_is_empty!6619)))

(declare-fun b!259861 () Bool)

(assert (=> b!259861 (= e!168410 e!168403)))

(declare-fun res!126999 () Bool)

(assert (=> b!259861 (=> (not res!126999) (not e!168403))))

(assert (=> b!259861 (= res!126999 (or (= lt!130906 (MissingZero!1177 index!297)) (= lt!130906 (MissingVacant!1177 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12585 (_ BitVec 32)) SeekEntryResult!1177)

(assert (=> b!259861 (= lt!130906 (seekEntryOrOpen!0 key!932 (_keys!6973 thiss!1504) (mask!11119 thiss!1504)))))

(declare-fun b!259862 () Bool)

(declare-fun res!126994 () Bool)

(assert (=> b!259862 (=> (not res!126994) (not e!168406))))

(assert (=> b!259862 (= res!126994 call!24755)))

(assert (=> b!259862 (= e!168405 e!168406)))

(declare-fun b!259863 () Bool)

(assert (=> b!259863 (= e!168408 e!168407)))

(declare-fun res!126993 () Bool)

(assert (=> b!259863 (= res!126993 call!24755)))

(assert (=> b!259863 (=> (not res!126993) (not e!168407))))

(declare-fun b!259864 () Bool)

(assert (=> b!259864 (= e!168408 ((_ is Undefined!1177) lt!130906))))

(declare-fun b!259865 () Bool)

(declare-fun lt!130903 () Unit!8037)

(assert (=> b!259865 (= e!168402 lt!130903)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!439 (array!12585 array!12583 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 64) Int) Unit!8037)

(assert (=> b!259865 (= lt!130903 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!439 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 (defaultEntry!4794 thiss!1504)))))

(assert (=> b!259865 (= c!44136 ((_ is MissingZero!1177) lt!130906))))

(assert (=> b!259865 e!168405))

(declare-fun b!259866 () Bool)

(declare-fun e!168399 () Bool)

(assert (=> b!259866 (= e!168399 tp_is_empty!6619)))

(declare-fun b!259867 () Bool)

(declare-fun Unit!8041 () Unit!8037)

(assert (=> b!259867 (= e!168409 Unit!8041)))

(declare-fun lt!130911 () Unit!8037)

(declare-fun lemmaArrayContainsKeyThenInListMap!250 (array!12585 array!12583 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 64) (_ BitVec 32) Int) Unit!8037)

(assert (=> b!259867 (= lt!130911 (lemmaArrayContainsKeyThenInListMap!250 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(assert (=> b!259867 false))

(declare-fun bm!24753 () Bool)

(assert (=> bm!24753 (= call!24756 (arrayContainsKey!0 (_keys!6973 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!11279 () Bool)

(declare-fun tp!23593 () Bool)

(assert (=> mapNonEmpty!11279 (= mapRes!11279 (and tp!23593 e!168399))))

(declare-fun mapValue!11279 () ValueCell!2966)

(declare-fun mapKey!11279 () (_ BitVec 32))

(declare-fun mapRest!11279 () (Array (_ BitVec 32) ValueCell!2966))

(assert (=> mapNonEmpty!11279 (= (arr!5955 (_values!4777 thiss!1504)) (store mapRest!11279 mapKey!11279 mapValue!11279))))

(declare-fun res!127001 () Bool)

(assert (=> start!24918 (=> (not res!127001) (not e!168410))))

(declare-fun valid!1500 (LongMapFixedSize!3832) Bool)

(assert (=> start!24918 (= res!127001 (valid!1500 thiss!1504))))

(assert (=> start!24918 e!168410))

(assert (=> start!24918 e!168411))

(assert (=> start!24918 true))

(assert (=> start!24918 tp_is_empty!6619))

(declare-fun b!259868 () Bool)

(assert (=> b!259868 (= e!168413 (and e!168404 mapRes!11279))))

(declare-fun condMapEmpty!11279 () Bool)

(declare-fun mapDefault!11279 () ValueCell!2966)

(assert (=> b!259868 (= condMapEmpty!11279 (= (arr!5955 (_values!4777 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2966)) mapDefault!11279)))))

(declare-fun b!259869 () Bool)

(declare-fun res!126998 () Bool)

(assert (=> b!259869 (=> (not res!126998) (not e!168406))))

(assert (=> b!259869 (= res!126998 (= (select (arr!5956 (_keys!6973 thiss!1504)) (index!6878 lt!130906)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!24918 res!127001) b!259849))

(assert (= (and b!259849 res!127000) b!259861))

(assert (= (and b!259861 res!126999) b!259852))

(assert (= (and b!259852 c!44133) b!259858))

(assert (= (and b!259852 (not c!44133)) b!259865))

(assert (= (and b!259865 c!44136) b!259862))

(assert (= (and b!259865 (not c!44136)) b!259855))

(assert (= (and b!259862 res!126994) b!259869))

(assert (= (and b!259869 res!126998) b!259850))

(assert (= (and b!259855 c!44134) b!259863))

(assert (= (and b!259855 (not c!44134)) b!259864))

(assert (= (and b!259863 res!126993) b!259853))

(assert (= (and b!259853 res!126996) b!259854))

(assert (= (or b!259862 b!259863) bm!24752))

(assert (= (or b!259850 b!259854) bm!24753))

(assert (= (and b!259852 res!126997) b!259857))

(assert (= (and b!259857 c!44135) b!259867))

(assert (= (and b!259857 (not c!44135)) b!259859))

(assert (= (and b!259857 (not res!126995)) b!259856))

(assert (= (and b!259868 condMapEmpty!11279) mapIsEmpty!11279))

(assert (= (and b!259868 (not condMapEmpty!11279)) mapNonEmpty!11279))

(assert (= (and mapNonEmpty!11279 ((_ is ValueCellFull!2966) mapValue!11279)) b!259866))

(assert (= (and b!259868 ((_ is ValueCellFull!2966) mapDefault!11279)) b!259860))

(assert (= b!259851 b!259868))

(assert (= start!24918 b!259851))

(declare-fun m!275065 () Bool)

(assert (=> mapNonEmpty!11279 m!275065))

(declare-fun m!275067 () Bool)

(assert (=> b!259865 m!275067))

(declare-fun m!275069 () Bool)

(assert (=> bm!24753 m!275069))

(declare-fun m!275071 () Bool)

(assert (=> b!259869 m!275071))

(declare-fun m!275073 () Bool)

(assert (=> b!259853 m!275073))

(declare-fun m!275075 () Bool)

(assert (=> b!259851 m!275075))

(declare-fun m!275077 () Bool)

(assert (=> b!259851 m!275077))

(declare-fun m!275079 () Bool)

(assert (=> b!259857 m!275079))

(assert (=> b!259857 m!275069))

(declare-fun m!275081 () Bool)

(assert (=> b!259857 m!275081))

(declare-fun m!275083 () Bool)

(assert (=> b!259857 m!275083))

(declare-fun m!275085 () Bool)

(assert (=> b!259857 m!275085))

(declare-fun m!275087 () Bool)

(assert (=> b!259857 m!275087))

(declare-fun m!275089 () Bool)

(assert (=> b!259857 m!275089))

(declare-fun m!275091 () Bool)

(assert (=> b!259857 m!275091))

(declare-fun m!275093 () Bool)

(assert (=> b!259857 m!275093))

(declare-fun m!275095 () Bool)

(assert (=> b!259857 m!275095))

(declare-fun m!275097 () Bool)

(assert (=> b!259857 m!275097))

(declare-fun m!275099 () Bool)

(assert (=> b!259857 m!275099))

(declare-fun m!275101 () Bool)

(assert (=> b!259857 m!275101))

(declare-fun m!275103 () Bool)

(assert (=> b!259857 m!275103))

(declare-fun m!275105 () Bool)

(assert (=> b!259857 m!275105))

(declare-fun m!275107 () Bool)

(assert (=> b!259857 m!275107))

(declare-fun m!275109 () Bool)

(assert (=> b!259857 m!275109))

(declare-fun m!275111 () Bool)

(assert (=> b!259857 m!275111))

(declare-fun m!275113 () Bool)

(assert (=> b!259861 m!275113))

(declare-fun m!275115 () Bool)

(assert (=> b!259858 m!275115))

(declare-fun m!275117 () Bool)

(assert (=> start!24918 m!275117))

(declare-fun m!275119 () Bool)

(assert (=> b!259852 m!275119))

(declare-fun m!275121 () Bool)

(assert (=> b!259852 m!275121))

(declare-fun m!275123 () Bool)

(assert (=> b!259852 m!275123))

(declare-fun m!275125 () Bool)

(assert (=> b!259867 m!275125))

(declare-fun m!275127 () Bool)

(assert (=> bm!24752 m!275127))

(check-sat (not bm!24752) (not b_next!6757) (not b!259867) (not b!259857) (not mapNonEmpty!11279) b_and!13837 (not b!259861) (not bm!24753) (not b!259851) (not start!24918) (not b!259858) tp_is_empty!6619 (not b!259852) (not b!259865))
(check-sat b_and!13837 (not b_next!6757))
(get-model)

(declare-fun d!62299 () Bool)

(assert (=> d!62299 (= (inRange!0 index!297 (mask!11119 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11119 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!259852 d!62299))

(declare-fun d!62301 () Bool)

(declare-fun e!168508 () Bool)

(assert (=> d!62301 e!168508))

(declare-fun res!127058 () Bool)

(assert (=> d!62301 (=> res!127058 e!168508)))

(declare-fun lt!131004 () Bool)

(assert (=> d!62301 (= res!127058 (not lt!131004))))

(declare-fun lt!131007 () Bool)

(assert (=> d!62301 (= lt!131004 lt!131007)))

(declare-fun lt!131006 () Unit!8037)

(declare-fun e!168509 () Unit!8037)

(assert (=> d!62301 (= lt!131006 e!168509)))

(declare-fun c!44163 () Bool)

(assert (=> d!62301 (= c!44163 lt!131007)))

(declare-fun containsKey!306 (List!3792 (_ BitVec 64)) Bool)

(assert (=> d!62301 (= lt!131007 (containsKey!306 (toList!1914 lt!130910) key!932))))

(assert (=> d!62301 (= (contains!1870 lt!130910 key!932) lt!131004)))

(declare-fun b!260002 () Bool)

(declare-fun lt!131005 () Unit!8037)

(assert (=> b!260002 (= e!168509 lt!131005)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!255 (List!3792 (_ BitVec 64)) Unit!8037)

(assert (=> b!260002 (= lt!131005 (lemmaContainsKeyImpliesGetValueByKeyDefined!255 (toList!1914 lt!130910) key!932))))

(declare-datatypes ((Option!320 0))(
  ( (Some!319 (v!5466 V!8473)) (None!318) )
))
(declare-fun isDefined!256 (Option!320) Bool)

(declare-fun getValueByKey!314 (List!3792 (_ BitVec 64)) Option!320)

(assert (=> b!260002 (isDefined!256 (getValueByKey!314 (toList!1914 lt!130910) key!932))))

(declare-fun b!260003 () Bool)

(declare-fun Unit!8050 () Unit!8037)

(assert (=> b!260003 (= e!168509 Unit!8050)))

(declare-fun b!260004 () Bool)

(assert (=> b!260004 (= e!168508 (isDefined!256 (getValueByKey!314 (toList!1914 lt!130910) key!932)))))

(assert (= (and d!62301 c!44163) b!260002))

(assert (= (and d!62301 (not c!44163)) b!260003))

(assert (= (and d!62301 (not res!127058)) b!260004))

(declare-fun m!275257 () Bool)

(assert (=> d!62301 m!275257))

(declare-fun m!275259 () Bool)

(assert (=> b!260002 m!275259))

(declare-fun m!275261 () Bool)

(assert (=> b!260002 m!275261))

(assert (=> b!260002 m!275261))

(declare-fun m!275263 () Bool)

(assert (=> b!260002 m!275263))

(assert (=> b!260004 m!275261))

(assert (=> b!260004 m!275261))

(assert (=> b!260004 m!275263))

(assert (=> b!259852 d!62301))

(declare-fun b!260047 () Bool)

(declare-fun e!168547 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!260047 (= e!168547 (validKeyInArray!0 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!260048 () Bool)

(declare-fun e!168548 () ListLongMap!3797)

(declare-fun call!24786 () ListLongMap!3797)

(assert (=> b!260048 (= e!168548 call!24786)))

(declare-fun b!260049 () Bool)

(declare-fun res!127083 () Bool)

(declare-fun e!168543 () Bool)

(assert (=> b!260049 (=> (not res!127083) (not e!168543))))

(declare-fun e!168541 () Bool)

(assert (=> b!260049 (= res!127083 e!168541)))

(declare-fun c!44176 () Bool)

(assert (=> b!260049 (= c!44176 (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!260050 () Bool)

(declare-fun e!168539 () Bool)

(assert (=> b!260050 (= e!168543 e!168539)))

(declare-fun c!44181 () Bool)

(assert (=> b!260050 (= c!44181 (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!260051 () Bool)

(declare-fun call!24784 () Bool)

(assert (=> b!260051 (= e!168539 (not call!24784))))

(declare-fun b!260052 () Bool)

(declare-fun e!168537 () Unit!8037)

(declare-fun Unit!8051 () Unit!8037)

(assert (=> b!260052 (= e!168537 Unit!8051)))

(declare-fun bm!24780 () Bool)

(declare-fun call!24785 () ListLongMap!3797)

(declare-fun getCurrentListMapNoExtraKeys!574 (array!12585 array!12583 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 32) Int) ListLongMap!3797)

(assert (=> bm!24780 (= call!24785 (getCurrentListMapNoExtraKeys!574 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun b!260053 () Bool)

(declare-fun e!168546 () Bool)

(assert (=> b!260053 (= e!168541 e!168546)))

(declare-fun res!127082 () Bool)

(declare-fun call!24789 () Bool)

(assert (=> b!260053 (= res!127082 call!24789)))

(assert (=> b!260053 (=> (not res!127082) (not e!168546))))

(declare-fun b!260054 () Bool)

(declare-fun call!24788 () ListLongMap!3797)

(assert (=> b!260054 (= e!168548 call!24788)))

(declare-fun b!260055 () Bool)

(declare-fun e!168542 () Bool)

(assert (=> b!260055 (= e!168542 (validKeyInArray!0 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24781 () Bool)

(declare-fun call!24783 () ListLongMap!3797)

(assert (=> bm!24781 (= call!24783 call!24785)))

(declare-fun bm!24782 () Bool)

(declare-fun lt!131059 () ListLongMap!3797)

(assert (=> bm!24782 (= call!24784 (contains!1870 lt!131059 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260056 () Bool)

(declare-fun e!168538 () Bool)

(declare-fun e!168545 () Bool)

(assert (=> b!260056 (= e!168538 e!168545)))

(declare-fun res!127079 () Bool)

(assert (=> b!260056 (=> (not res!127079) (not e!168545))))

(assert (=> b!260056 (= res!127079 (contains!1870 lt!131059 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!260056 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))))))

(declare-fun b!260057 () Bool)

(declare-fun lt!131067 () Unit!8037)

(assert (=> b!260057 (= e!168537 lt!131067)))

(declare-fun lt!131057 () ListLongMap!3797)

(assert (=> b!260057 (= lt!131057 (getCurrentListMapNoExtraKeys!574 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131063 () (_ BitVec 64))

(assert (=> b!260057 (= lt!131063 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131061 () (_ BitVec 64))

(assert (=> b!260057 (= lt!131061 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131071 () Unit!8037)

(declare-fun addStillContains!234 (ListLongMap!3797 (_ BitVec 64) V!8473 (_ BitVec 64)) Unit!8037)

(assert (=> b!260057 (= lt!131071 (addStillContains!234 lt!131057 lt!131063 (zeroValue!4635 thiss!1504) lt!131061))))

(assert (=> b!260057 (contains!1870 (+!701 lt!131057 (tuple2!4895 lt!131063 (zeroValue!4635 thiss!1504))) lt!131061)))

(declare-fun lt!131054 () Unit!8037)

(assert (=> b!260057 (= lt!131054 lt!131071)))

(declare-fun lt!131068 () ListLongMap!3797)

(assert (=> b!260057 (= lt!131068 (getCurrentListMapNoExtraKeys!574 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131060 () (_ BitVec 64))

(assert (=> b!260057 (= lt!131060 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131070 () (_ BitVec 64))

(assert (=> b!260057 (= lt!131070 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131053 () Unit!8037)

(declare-fun addApplyDifferent!234 (ListLongMap!3797 (_ BitVec 64) V!8473 (_ BitVec 64)) Unit!8037)

(assert (=> b!260057 (= lt!131053 (addApplyDifferent!234 lt!131068 lt!131060 (minValue!4635 thiss!1504) lt!131070))))

(declare-fun apply!258 (ListLongMap!3797 (_ BitVec 64)) V!8473)

(assert (=> b!260057 (= (apply!258 (+!701 lt!131068 (tuple2!4895 lt!131060 (minValue!4635 thiss!1504))) lt!131070) (apply!258 lt!131068 lt!131070))))

(declare-fun lt!131052 () Unit!8037)

(assert (=> b!260057 (= lt!131052 lt!131053)))

(declare-fun lt!131062 () ListLongMap!3797)

(assert (=> b!260057 (= lt!131062 (getCurrentListMapNoExtraKeys!574 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131056 () (_ BitVec 64))

(assert (=> b!260057 (= lt!131056 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131055 () (_ BitVec 64))

(assert (=> b!260057 (= lt!131055 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131065 () Unit!8037)

(assert (=> b!260057 (= lt!131065 (addApplyDifferent!234 lt!131062 lt!131056 (zeroValue!4635 thiss!1504) lt!131055))))

(assert (=> b!260057 (= (apply!258 (+!701 lt!131062 (tuple2!4895 lt!131056 (zeroValue!4635 thiss!1504))) lt!131055) (apply!258 lt!131062 lt!131055))))

(declare-fun lt!131072 () Unit!8037)

(assert (=> b!260057 (= lt!131072 lt!131065)))

(declare-fun lt!131064 () ListLongMap!3797)

(assert (=> b!260057 (= lt!131064 (getCurrentListMapNoExtraKeys!574 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131058 () (_ BitVec 64))

(assert (=> b!260057 (= lt!131058 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131069 () (_ BitVec 64))

(assert (=> b!260057 (= lt!131069 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!260057 (= lt!131067 (addApplyDifferent!234 lt!131064 lt!131058 (minValue!4635 thiss!1504) lt!131069))))

(assert (=> b!260057 (= (apply!258 (+!701 lt!131064 (tuple2!4895 lt!131058 (minValue!4635 thiss!1504))) lt!131069) (apply!258 lt!131064 lt!131069))))

(declare-fun b!260058 () Bool)

(declare-fun e!168536 () Bool)

(assert (=> b!260058 (= e!168539 e!168536)))

(declare-fun res!127077 () Bool)

(assert (=> b!260058 (= res!127077 call!24784)))

(assert (=> b!260058 (=> (not res!127077) (not e!168536))))

(declare-fun b!260059 () Bool)

(assert (=> b!260059 (= e!168546 (= (apply!258 lt!131059 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4635 thiss!1504)))))

(declare-fun b!260060 () Bool)

(declare-fun e!168540 () ListLongMap!3797)

(declare-fun e!168544 () ListLongMap!3797)

(assert (=> b!260060 (= e!168540 e!168544)))

(declare-fun c!44177 () Bool)

(assert (=> b!260060 (= c!44177 (and (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24783 () Bool)

(assert (=> bm!24783 (= call!24786 call!24783)))

(declare-fun b!260061 () Bool)

(assert (=> b!260061 (= e!168536 (= (apply!258 lt!131059 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4635 thiss!1504)))))

(declare-fun b!260062 () Bool)

(declare-fun get!3065 (ValueCell!2966 V!8473) V!8473)

(declare-fun dynLambda!592 (Int (_ BitVec 64)) V!8473)

(assert (=> b!260062 (= e!168545 (= (apply!258 lt!131059 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)) (get!3065 (select (arr!5955 (_values!4777 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!592 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260062 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6305 (_values!4777 thiss!1504))))))

(assert (=> b!260062 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))))))

(declare-fun b!260063 () Bool)

(assert (=> b!260063 (= e!168544 call!24788)))

(declare-fun call!24787 () ListLongMap!3797)

(declare-fun c!44179 () Bool)

(declare-fun bm!24784 () Bool)

(assert (=> bm!24784 (= call!24787 (+!701 (ite c!44179 call!24785 (ite c!44177 call!24783 call!24786)) (ite (or c!44179 c!44177) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(declare-fun b!260064 () Bool)

(assert (=> b!260064 (= e!168540 (+!701 call!24787 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))

(declare-fun b!260065 () Bool)

(declare-fun res!127081 () Bool)

(assert (=> b!260065 (=> (not res!127081) (not e!168543))))

(assert (=> b!260065 (= res!127081 e!168538)))

(declare-fun res!127078 () Bool)

(assert (=> b!260065 (=> res!127078 e!168538)))

(assert (=> b!260065 (= res!127078 (not e!168542))))

(declare-fun res!127085 () Bool)

(assert (=> b!260065 (=> (not res!127085) (not e!168542))))

(assert (=> b!260065 (= res!127085 (bvslt #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))))))

(declare-fun bm!24785 () Bool)

(assert (=> bm!24785 (= call!24789 (contains!1870 lt!131059 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260066 () Bool)

(assert (=> b!260066 (= e!168541 (not call!24789))))

(declare-fun d!62303 () Bool)

(assert (=> d!62303 e!168543))

(declare-fun res!127084 () Bool)

(assert (=> d!62303 (=> (not res!127084) (not e!168543))))

(assert (=> d!62303 (= res!127084 (or (bvsge #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))))))))

(declare-fun lt!131073 () ListLongMap!3797)

(assert (=> d!62303 (= lt!131059 lt!131073)))

(declare-fun lt!131066 () Unit!8037)

(assert (=> d!62303 (= lt!131066 e!168537)))

(declare-fun c!44178 () Bool)

(assert (=> d!62303 (= c!44178 e!168547)))

(declare-fun res!127080 () Bool)

(assert (=> d!62303 (=> (not res!127080) (not e!168547))))

(assert (=> d!62303 (= res!127080 (bvslt #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))))))

(assert (=> d!62303 (= lt!131073 e!168540)))

(assert (=> d!62303 (= c!44179 (and (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62303 (validMask!0 (mask!11119 thiss!1504))))

(assert (=> d!62303 (= (getCurrentListMap!1423 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) lt!131059)))

(declare-fun bm!24786 () Bool)

(assert (=> bm!24786 (= call!24788 call!24787)))

(declare-fun b!260067 () Bool)

(declare-fun c!44180 () Bool)

(assert (=> b!260067 (= c!44180 (and (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!260067 (= e!168544 e!168548)))

(assert (= (and d!62303 c!44179) b!260064))

(assert (= (and d!62303 (not c!44179)) b!260060))

(assert (= (and b!260060 c!44177) b!260063))

(assert (= (and b!260060 (not c!44177)) b!260067))

(assert (= (and b!260067 c!44180) b!260054))

(assert (= (and b!260067 (not c!44180)) b!260048))

(assert (= (or b!260054 b!260048) bm!24783))

(assert (= (or b!260063 bm!24783) bm!24781))

(assert (= (or b!260063 b!260054) bm!24786))

(assert (= (or b!260064 bm!24781) bm!24780))

(assert (= (or b!260064 bm!24786) bm!24784))

(assert (= (and d!62303 res!127080) b!260047))

(assert (= (and d!62303 c!44178) b!260057))

(assert (= (and d!62303 (not c!44178)) b!260052))

(assert (= (and d!62303 res!127084) b!260065))

(assert (= (and b!260065 res!127085) b!260055))

(assert (= (and b!260065 (not res!127078)) b!260056))

(assert (= (and b!260056 res!127079) b!260062))

(assert (= (and b!260065 res!127081) b!260049))

(assert (= (and b!260049 c!44176) b!260053))

(assert (= (and b!260049 (not c!44176)) b!260066))

(assert (= (and b!260053 res!127082) b!260059))

(assert (= (or b!260053 b!260066) bm!24785))

(assert (= (and b!260049 res!127083) b!260050))

(assert (= (and b!260050 c!44181) b!260058))

(assert (= (and b!260050 (not c!44181)) b!260051))

(assert (= (and b!260058 res!127077) b!260061))

(assert (= (or b!260058 b!260051) bm!24782))

(declare-fun b_lambda!8241 () Bool)

(assert (=> (not b_lambda!8241) (not b!260062)))

(declare-fun t!8859 () Bool)

(declare-fun tb!3021 () Bool)

(assert (=> (and b!259851 (= (defaultEntry!4794 thiss!1504) (defaultEntry!4794 thiss!1504)) t!8859) tb!3021))

(declare-fun result!5401 () Bool)

(assert (=> tb!3021 (= result!5401 tp_is_empty!6619)))

(assert (=> b!260062 t!8859))

(declare-fun b_and!13843 () Bool)

(assert (= b_and!13837 (and (=> t!8859 result!5401) b_and!13843)))

(declare-fun m!275265 () Bool)

(assert (=> bm!24785 m!275265))

(declare-fun m!275267 () Bool)

(assert (=> bm!24780 m!275267))

(declare-fun m!275269 () Bool)

(assert (=> b!260056 m!275269))

(assert (=> b!260056 m!275269))

(declare-fun m!275271 () Bool)

(assert (=> b!260056 m!275271))

(assert (=> b!260062 m!275269))

(declare-fun m!275273 () Bool)

(assert (=> b!260062 m!275273))

(declare-fun m!275275 () Bool)

(assert (=> b!260062 m!275275))

(declare-fun m!275277 () Bool)

(assert (=> b!260062 m!275277))

(declare-fun m!275279 () Bool)

(assert (=> b!260062 m!275279))

(assert (=> b!260062 m!275269))

(assert (=> b!260062 m!275275))

(assert (=> b!260062 m!275277))

(declare-fun m!275281 () Bool)

(assert (=> bm!24784 m!275281))

(declare-fun m!275283 () Bool)

(assert (=> b!260059 m!275283))

(declare-fun m!275285 () Bool)

(assert (=> b!260061 m!275285))

(declare-fun m!275287 () Bool)

(assert (=> b!260064 m!275287))

(assert (=> b!260055 m!275269))

(assert (=> b!260055 m!275269))

(declare-fun m!275289 () Bool)

(assert (=> b!260055 m!275289))

(declare-fun m!275291 () Bool)

(assert (=> b!260057 m!275291))

(declare-fun m!275293 () Bool)

(assert (=> b!260057 m!275293))

(declare-fun m!275295 () Bool)

(assert (=> b!260057 m!275295))

(declare-fun m!275297 () Bool)

(assert (=> b!260057 m!275297))

(assert (=> b!260057 m!275295))

(declare-fun m!275299 () Bool)

(assert (=> b!260057 m!275299))

(declare-fun m!275301 () Bool)

(assert (=> b!260057 m!275301))

(assert (=> b!260057 m!275301))

(declare-fun m!275303 () Bool)

(assert (=> b!260057 m!275303))

(assert (=> b!260057 m!275267))

(declare-fun m!275305 () Bool)

(assert (=> b!260057 m!275305))

(declare-fun m!275307 () Bool)

(assert (=> b!260057 m!275307))

(declare-fun m!275309 () Bool)

(assert (=> b!260057 m!275309))

(declare-fun m!275311 () Bool)

(assert (=> b!260057 m!275311))

(declare-fun m!275313 () Bool)

(assert (=> b!260057 m!275313))

(declare-fun m!275315 () Bool)

(assert (=> b!260057 m!275315))

(assert (=> b!260057 m!275269))

(declare-fun m!275317 () Bool)

(assert (=> b!260057 m!275317))

(assert (=> b!260057 m!275291))

(declare-fun m!275319 () Bool)

(assert (=> b!260057 m!275319))

(assert (=> b!260057 m!275307))

(declare-fun m!275321 () Bool)

(assert (=> bm!24782 m!275321))

(assert (=> d!62303 m!275079))

(assert (=> b!260047 m!275269))

(assert (=> b!260047 m!275269))

(assert (=> b!260047 m!275289))

(assert (=> b!259852 d!62303))

(declare-fun lt!131082 () SeekEntryResult!1177)

(declare-fun e!168555 () SeekEntryResult!1177)

(declare-fun b!260082 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12585 (_ BitVec 32)) SeekEntryResult!1177)

(assert (=> b!260082 (= e!168555 (seekKeyOrZeroReturnVacant!0 (x!25114 lt!131082) (index!6880 lt!131082) (index!6880 lt!131082) key!932 (_keys!6973 thiss!1504) (mask!11119 thiss!1504)))))

(declare-fun b!260083 () Bool)

(declare-fun e!168556 () SeekEntryResult!1177)

(assert (=> b!260083 (= e!168556 Undefined!1177)))

(declare-fun b!260084 () Bool)

(declare-fun e!168557 () SeekEntryResult!1177)

(assert (=> b!260084 (= e!168557 (Found!1177 (index!6880 lt!131082)))))

(declare-fun d!62305 () Bool)

(declare-fun lt!131080 () SeekEntryResult!1177)

(assert (=> d!62305 (and (or ((_ is Undefined!1177) lt!131080) (not ((_ is Found!1177) lt!131080)) (and (bvsge (index!6879 lt!131080) #b00000000000000000000000000000000) (bvslt (index!6879 lt!131080) (size!6306 (_keys!6973 thiss!1504))))) (or ((_ is Undefined!1177) lt!131080) ((_ is Found!1177) lt!131080) (not ((_ is MissingZero!1177) lt!131080)) (and (bvsge (index!6878 lt!131080) #b00000000000000000000000000000000) (bvslt (index!6878 lt!131080) (size!6306 (_keys!6973 thiss!1504))))) (or ((_ is Undefined!1177) lt!131080) ((_ is Found!1177) lt!131080) ((_ is MissingZero!1177) lt!131080) (not ((_ is MissingVacant!1177) lt!131080)) (and (bvsge (index!6881 lt!131080) #b00000000000000000000000000000000) (bvslt (index!6881 lt!131080) (size!6306 (_keys!6973 thiss!1504))))) (or ((_ is Undefined!1177) lt!131080) (ite ((_ is Found!1177) lt!131080) (= (select (arr!5956 (_keys!6973 thiss!1504)) (index!6879 lt!131080)) key!932) (ite ((_ is MissingZero!1177) lt!131080) (= (select (arr!5956 (_keys!6973 thiss!1504)) (index!6878 lt!131080)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1177) lt!131080) (= (select (arr!5956 (_keys!6973 thiss!1504)) (index!6881 lt!131080)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62305 (= lt!131080 e!168556)))

(declare-fun c!44190 () Bool)

(assert (=> d!62305 (= c!44190 (and ((_ is Intermediate!1177) lt!131082) (undefined!1989 lt!131082)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12585 (_ BitVec 32)) SeekEntryResult!1177)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!62305 (= lt!131082 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11119 thiss!1504)) key!932 (_keys!6973 thiss!1504) (mask!11119 thiss!1504)))))

(assert (=> d!62305 (validMask!0 (mask!11119 thiss!1504))))

(assert (=> d!62305 (= (seekEntryOrOpen!0 key!932 (_keys!6973 thiss!1504) (mask!11119 thiss!1504)) lt!131080)))

(declare-fun b!260085 () Bool)

(assert (=> b!260085 (= e!168555 (MissingZero!1177 (index!6880 lt!131082)))))

(declare-fun b!260086 () Bool)

(assert (=> b!260086 (= e!168556 e!168557)))

(declare-fun lt!131081 () (_ BitVec 64))

(assert (=> b!260086 (= lt!131081 (select (arr!5956 (_keys!6973 thiss!1504)) (index!6880 lt!131082)))))

(declare-fun c!44188 () Bool)

(assert (=> b!260086 (= c!44188 (= lt!131081 key!932))))

(declare-fun b!260087 () Bool)

(declare-fun c!44189 () Bool)

(assert (=> b!260087 (= c!44189 (= lt!131081 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260087 (= e!168557 e!168555)))

(assert (= (and d!62305 c!44190) b!260083))

(assert (= (and d!62305 (not c!44190)) b!260086))

(assert (= (and b!260086 c!44188) b!260084))

(assert (= (and b!260086 (not c!44188)) b!260087))

(assert (= (and b!260087 c!44189) b!260085))

(assert (= (and b!260087 (not c!44189)) b!260082))

(declare-fun m!275323 () Bool)

(assert (=> b!260082 m!275323))

(declare-fun m!275325 () Bool)

(assert (=> d!62305 m!275325))

(declare-fun m!275327 () Bool)

(assert (=> d!62305 m!275327))

(declare-fun m!275329 () Bool)

(assert (=> d!62305 m!275329))

(declare-fun m!275331 () Bool)

(assert (=> d!62305 m!275331))

(assert (=> d!62305 m!275329))

(declare-fun m!275333 () Bool)

(assert (=> d!62305 m!275333))

(assert (=> d!62305 m!275079))

(declare-fun m!275335 () Bool)

(assert (=> b!260086 m!275335))

(assert (=> b!259861 d!62305))

(declare-fun d!62307 () Bool)

(declare-fun res!127092 () Bool)

(declare-fun e!168560 () Bool)

(assert (=> d!62307 (=> (not res!127092) (not e!168560))))

(declare-fun simpleValid!281 (LongMapFixedSize!3832) Bool)

(assert (=> d!62307 (= res!127092 (simpleValid!281 thiss!1504))))

(assert (=> d!62307 (= (valid!1500 thiss!1504) e!168560)))

(declare-fun b!260094 () Bool)

(declare-fun res!127093 () Bool)

(assert (=> b!260094 (=> (not res!127093) (not e!168560))))

(assert (=> b!260094 (= res!127093 (= (arrayCountValidKeys!0 (_keys!6973 thiss!1504) #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))) (_size!1965 thiss!1504)))))

(declare-fun b!260095 () Bool)

(declare-fun res!127094 () Bool)

(assert (=> b!260095 (=> (not res!127094) (not e!168560))))

(assert (=> b!260095 (= res!127094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6973 thiss!1504) (mask!11119 thiss!1504)))))

(declare-fun b!260096 () Bool)

(assert (=> b!260096 (= e!168560 (arrayNoDuplicates!0 (_keys!6973 thiss!1504) #b00000000000000000000000000000000 Nil!3790))))

(assert (= (and d!62307 res!127092) b!260094))

(assert (= (and b!260094 res!127093) b!260095))

(assert (= (and b!260095 res!127094) b!260096))

(declare-fun m!275337 () Bool)

(assert (=> d!62307 m!275337))

(assert (=> b!260094 m!275109))

(declare-fun m!275339 () Bool)

(assert (=> b!260095 m!275339))

(declare-fun m!275341 () Bool)

(assert (=> b!260096 m!275341))

(assert (=> start!24918 d!62307))

(declare-fun d!62309 () Bool)

(assert (=> d!62309 (= (inRange!0 (ite c!44136 (index!6878 lt!130906) (index!6881 lt!130906)) (mask!11119 thiss!1504)) (and (bvsge (ite c!44136 (index!6878 lt!130906) (index!6881 lt!130906)) #b00000000000000000000000000000000) (bvslt (ite c!44136 (index!6878 lt!130906) (index!6881 lt!130906)) (bvadd (mask!11119 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24752 d!62309))

(declare-fun b!260113 () Bool)

(declare-fun res!127103 () Bool)

(declare-fun e!168571 () Bool)

(assert (=> b!260113 (=> (not res!127103) (not e!168571))))

(declare-fun lt!131088 () SeekEntryResult!1177)

(assert (=> b!260113 (= res!127103 (= (select (arr!5956 (_keys!6973 thiss!1504)) (index!6881 lt!131088)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260113 (and (bvsge (index!6881 lt!131088) #b00000000000000000000000000000000) (bvslt (index!6881 lt!131088) (size!6306 (_keys!6973 thiss!1504))))))

(declare-fun bm!24791 () Bool)

(declare-fun c!44196 () Bool)

(declare-fun call!24794 () Bool)

(assert (=> bm!24791 (= call!24794 (inRange!0 (ite c!44196 (index!6878 lt!131088) (index!6881 lt!131088)) (mask!11119 thiss!1504)))))

(declare-fun b!260114 () Bool)

(declare-fun res!127105 () Bool)

(assert (=> b!260114 (=> (not res!127105) (not e!168571))))

(assert (=> b!260114 (= res!127105 call!24794)))

(declare-fun e!168570 () Bool)

(assert (=> b!260114 (= e!168570 e!168571)))

(declare-fun b!260115 () Bool)

(declare-fun e!168569 () Bool)

(assert (=> b!260115 (= e!168569 e!168570)))

(declare-fun c!44195 () Bool)

(assert (=> b!260115 (= c!44195 ((_ is MissingVacant!1177) lt!131088))))

(declare-fun b!260116 () Bool)

(declare-fun e!168572 () Bool)

(assert (=> b!260116 (= e!168569 e!168572)))

(declare-fun res!127104 () Bool)

(assert (=> b!260116 (= res!127104 call!24794)))

(assert (=> b!260116 (=> (not res!127104) (not e!168572))))

(declare-fun b!260117 () Bool)

(declare-fun call!24795 () Bool)

(assert (=> b!260117 (= e!168571 (not call!24795))))

(declare-fun bm!24792 () Bool)

(assert (=> bm!24792 (= call!24795 (arrayContainsKey!0 (_keys!6973 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!260119 () Bool)

(assert (=> b!260119 (= e!168570 ((_ is Undefined!1177) lt!131088))))

(declare-fun b!260120 () Bool)

(assert (=> b!260120 (and (bvsge (index!6878 lt!131088) #b00000000000000000000000000000000) (bvslt (index!6878 lt!131088) (size!6306 (_keys!6973 thiss!1504))))))

(declare-fun res!127106 () Bool)

(assert (=> b!260120 (= res!127106 (= (select (arr!5956 (_keys!6973 thiss!1504)) (index!6878 lt!131088)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260120 (=> (not res!127106) (not e!168572))))

(declare-fun b!260118 () Bool)

(assert (=> b!260118 (= e!168572 (not call!24795))))

(declare-fun d!62311 () Bool)

(assert (=> d!62311 e!168569))

(assert (=> d!62311 (= c!44196 ((_ is MissingZero!1177) lt!131088))))

(assert (=> d!62311 (= lt!131088 (seekEntryOrOpen!0 key!932 (_keys!6973 thiss!1504) (mask!11119 thiss!1504)))))

(declare-fun lt!131087 () Unit!8037)

(declare-fun choose!1271 (array!12585 array!12583 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 64) Int) Unit!8037)

(assert (=> d!62311 (= lt!131087 (choose!1271 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 (defaultEntry!4794 thiss!1504)))))

(assert (=> d!62311 (validMask!0 (mask!11119 thiss!1504))))

(assert (=> d!62311 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!439 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 (defaultEntry!4794 thiss!1504)) lt!131087)))

(assert (= (and d!62311 c!44196) b!260116))

(assert (= (and d!62311 (not c!44196)) b!260115))

(assert (= (and b!260116 res!127104) b!260120))

(assert (= (and b!260120 res!127106) b!260118))

(assert (= (and b!260115 c!44195) b!260114))

(assert (= (and b!260115 (not c!44195)) b!260119))

(assert (= (and b!260114 res!127105) b!260113))

(assert (= (and b!260113 res!127103) b!260117))

(assert (= (or b!260116 b!260114) bm!24791))

(assert (= (or b!260118 b!260117) bm!24792))

(declare-fun m!275343 () Bool)

(assert (=> b!260120 m!275343))

(declare-fun m!275345 () Bool)

(assert (=> b!260113 m!275345))

(assert (=> d!62311 m!275113))

(declare-fun m!275347 () Bool)

(assert (=> d!62311 m!275347))

(assert (=> d!62311 m!275079))

(assert (=> bm!24792 m!275069))

(declare-fun m!275349 () Bool)

(assert (=> bm!24791 m!275349))

(assert (=> b!259865 d!62311))

(declare-fun d!62313 () Bool)

(assert (=> d!62313 (= (array_inv!3939 (_keys!6973 thiss!1504)) (bvsge (size!6306 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!259851 d!62313))

(declare-fun d!62315 () Bool)

(assert (=> d!62315 (= (array_inv!3940 (_values!4777 thiss!1504)) (bvsge (size!6305 (_values!4777 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!259851 d!62315))

(declare-fun d!62317 () Bool)

(declare-fun e!168575 () Bool)

(assert (=> d!62317 e!168575))

(declare-fun res!127112 () Bool)

(assert (=> d!62317 (=> (not res!127112) (not e!168575))))

(declare-fun lt!131094 () SeekEntryResult!1177)

(assert (=> d!62317 (= res!127112 ((_ is Found!1177) lt!131094))))

(assert (=> d!62317 (= lt!131094 (seekEntryOrOpen!0 key!932 (_keys!6973 thiss!1504) (mask!11119 thiss!1504)))))

(declare-fun lt!131093 () Unit!8037)

(declare-fun choose!1272 (array!12585 array!12583 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 64) Int) Unit!8037)

(assert (=> d!62317 (= lt!131093 (choose!1272 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 (defaultEntry!4794 thiss!1504)))))

(assert (=> d!62317 (validMask!0 (mask!11119 thiss!1504))))

(assert (=> d!62317 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!437 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 (defaultEntry!4794 thiss!1504)) lt!131093)))

(declare-fun b!260125 () Bool)

(declare-fun res!127111 () Bool)

(assert (=> b!260125 (=> (not res!127111) (not e!168575))))

(assert (=> b!260125 (= res!127111 (inRange!0 (index!6879 lt!131094) (mask!11119 thiss!1504)))))

(declare-fun b!260126 () Bool)

(assert (=> b!260126 (= e!168575 (= (select (arr!5956 (_keys!6973 thiss!1504)) (index!6879 lt!131094)) key!932))))

(assert (=> b!260126 (and (bvsge (index!6879 lt!131094) #b00000000000000000000000000000000) (bvslt (index!6879 lt!131094) (size!6306 (_keys!6973 thiss!1504))))))

(assert (= (and d!62317 res!127112) b!260125))

(assert (= (and b!260125 res!127111) b!260126))

(assert (=> d!62317 m!275113))

(declare-fun m!275351 () Bool)

(assert (=> d!62317 m!275351))

(assert (=> d!62317 m!275079))

(declare-fun m!275353 () Bool)

(assert (=> b!260125 m!275353))

(declare-fun m!275355 () Bool)

(assert (=> b!260126 m!275355))

(assert (=> b!259858 d!62317))

(declare-fun d!62319 () Bool)

(assert (=> d!62319 (contains!1870 (getCurrentListMap!1423 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) key!932)))

(declare-fun lt!131097 () Unit!8037)

(declare-fun choose!1273 (array!12585 array!12583 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 64) (_ BitVec 32) Int) Unit!8037)

(assert (=> d!62319 (= lt!131097 (choose!1273 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(assert (=> d!62319 (validMask!0 (mask!11119 thiss!1504))))

(assert (=> d!62319 (= (lemmaArrayContainsKeyThenInListMap!250 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) lt!131097)))

(declare-fun bs!9138 () Bool)

(assert (= bs!9138 d!62319))

(assert (=> bs!9138 m!275123))

(assert (=> bs!9138 m!275123))

(declare-fun m!275357 () Bool)

(assert (=> bs!9138 m!275357))

(declare-fun m!275359 () Bool)

(assert (=> bs!9138 m!275359))

(assert (=> bs!9138 m!275079))

(assert (=> b!259867 d!62319))

(declare-fun b!260135 () Bool)

(declare-fun res!127122 () Bool)

(declare-fun e!168581 () Bool)

(assert (=> b!260135 (=> (not res!127122) (not e!168581))))

(assert (=> b!260135 (= res!127122 (not (validKeyInArray!0 (select (arr!5956 (_keys!6973 thiss!1504)) index!297))))))

(declare-fun b!260137 () Bool)

(assert (=> b!260137 (= e!168581 (bvslt (size!6306 (_keys!6973 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!260136 () Bool)

(declare-fun res!127124 () Bool)

(assert (=> b!260136 (=> (not res!127124) (not e!168581))))

(assert (=> b!260136 (= res!127124 (validKeyInArray!0 key!932))))

(declare-fun e!168580 () Bool)

(declare-fun b!260138 () Bool)

(assert (=> b!260138 (= e!168580 (= (arrayCountValidKeys!0 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6973 thiss!1504) #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun d!62321 () Bool)

(assert (=> d!62321 e!168580))

(declare-fun res!127121 () Bool)

(assert (=> d!62321 (=> (not res!127121) (not e!168580))))

(assert (=> d!62321 (= res!127121 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6306 (_keys!6973 thiss!1504)))))))

(declare-fun lt!131100 () Unit!8037)

(declare-fun choose!1 (array!12585 (_ BitVec 32) (_ BitVec 64)) Unit!8037)

(assert (=> d!62321 (= lt!131100 (choose!1 (_keys!6973 thiss!1504) index!297 key!932))))

(assert (=> d!62321 e!168581))

(declare-fun res!127123 () Bool)

(assert (=> d!62321 (=> (not res!127123) (not e!168581))))

(assert (=> d!62321 (= res!127123 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6306 (_keys!6973 thiss!1504)))))))

(assert (=> d!62321 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6973 thiss!1504) index!297 key!932) lt!131100)))

(assert (= (and d!62321 res!127123) b!260135))

(assert (= (and b!260135 res!127122) b!260136))

(assert (= (and b!260136 res!127124) b!260137))

(assert (= (and d!62321 res!127121) b!260138))

(declare-fun m!275361 () Bool)

(assert (=> b!260135 m!275361))

(assert (=> b!260135 m!275361))

(declare-fun m!275363 () Bool)

(assert (=> b!260135 m!275363))

(declare-fun m!275365 () Bool)

(assert (=> b!260136 m!275365))

(assert (=> b!260138 m!275099))

(declare-fun m!275367 () Bool)

(assert (=> b!260138 m!275367))

(assert (=> b!260138 m!275109))

(declare-fun m!275369 () Bool)

(assert (=> d!62321 m!275369))

(assert (=> b!259857 d!62321))

(declare-fun d!62323 () Bool)

(declare-fun e!168584 () Bool)

(assert (=> d!62323 e!168584))

(declare-fun res!127127 () Bool)

(assert (=> d!62323 (=> (not res!127127) (not e!168584))))

(assert (=> d!62323 (= res!127127 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6306 (_keys!6973 thiss!1504))) (bvslt index!297 (size!6305 (_values!4777 thiss!1504)))))))

(declare-fun lt!131103 () Unit!8037)

(declare-fun choose!1274 (array!12585 array!12583 (_ BitVec 32) (_ BitVec 32) V!8473 V!8473 (_ BitVec 32) (_ BitVec 64) V!8473 Int) Unit!8037)

(assert (=> d!62323 (= lt!131103 (choose!1274 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) index!297 key!932 v!346 (defaultEntry!4794 thiss!1504)))))

(assert (=> d!62323 (validMask!0 (mask!11119 thiss!1504))))

(assert (=> d!62323 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!112 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) index!297 key!932 v!346 (defaultEntry!4794 thiss!1504)) lt!131103)))

(declare-fun b!260141 () Bool)

(assert (=> b!260141 (= e!168584 (= (+!701 (getCurrentListMap!1423 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) (tuple2!4895 key!932 v!346)) (getCurrentListMap!1423 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504))))))

(assert (= (and d!62323 res!127127) b!260141))

(declare-fun m!275371 () Bool)

(assert (=> d!62323 m!275371))

(assert (=> d!62323 m!275079))

(assert (=> b!260141 m!275099))

(assert (=> b!260141 m!275083))

(declare-fun m!275373 () Bool)

(assert (=> b!260141 m!275373))

(assert (=> b!260141 m!275123))

(declare-fun m!275375 () Bool)

(assert (=> b!260141 m!275375))

(assert (=> b!260141 m!275123))

(assert (=> b!259857 d!62323))

(declare-fun d!62325 () Bool)

(assert (=> d!62325 (= (validMask!0 (mask!11119 thiss!1504)) (and (or (= (mask!11119 thiss!1504) #b00000000000000000000000000000111) (= (mask!11119 thiss!1504) #b00000000000000000000000000001111) (= (mask!11119 thiss!1504) #b00000000000000000000000000011111) (= (mask!11119 thiss!1504) #b00000000000000000000000000111111) (= (mask!11119 thiss!1504) #b00000000000000000000000001111111) (= (mask!11119 thiss!1504) #b00000000000000000000000011111111) (= (mask!11119 thiss!1504) #b00000000000000000000000111111111) (= (mask!11119 thiss!1504) #b00000000000000000000001111111111) (= (mask!11119 thiss!1504) #b00000000000000000000011111111111) (= (mask!11119 thiss!1504) #b00000000000000000000111111111111) (= (mask!11119 thiss!1504) #b00000000000000000001111111111111) (= (mask!11119 thiss!1504) #b00000000000000000011111111111111) (= (mask!11119 thiss!1504) #b00000000000000000111111111111111) (= (mask!11119 thiss!1504) #b00000000000000001111111111111111) (= (mask!11119 thiss!1504) #b00000000000000011111111111111111) (= (mask!11119 thiss!1504) #b00000000000000111111111111111111) (= (mask!11119 thiss!1504) #b00000000000001111111111111111111) (= (mask!11119 thiss!1504) #b00000000000011111111111111111111) (= (mask!11119 thiss!1504) #b00000000000111111111111111111111) (= (mask!11119 thiss!1504) #b00000000001111111111111111111111) (= (mask!11119 thiss!1504) #b00000000011111111111111111111111) (= (mask!11119 thiss!1504) #b00000000111111111111111111111111) (= (mask!11119 thiss!1504) #b00000001111111111111111111111111) (= (mask!11119 thiss!1504) #b00000011111111111111111111111111) (= (mask!11119 thiss!1504) #b00000111111111111111111111111111) (= (mask!11119 thiss!1504) #b00001111111111111111111111111111) (= (mask!11119 thiss!1504) #b00011111111111111111111111111111) (= (mask!11119 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11119 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!259857 d!62325))

(declare-fun d!62327 () Bool)

(assert (=> d!62327 (arrayContainsKey!0 lt!130908 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!131106 () Unit!8037)

(declare-fun choose!13 (array!12585 (_ BitVec 64) (_ BitVec 32)) Unit!8037)

(assert (=> d!62327 (= lt!131106 (choose!13 lt!130908 key!932 index!297))))

(assert (=> d!62327 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!62327 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130908 key!932 index!297) lt!131106)))

(declare-fun bs!9139 () Bool)

(assert (= bs!9139 d!62327))

(assert (=> bs!9139 m!275087))

(declare-fun m!275377 () Bool)

(assert (=> bs!9139 m!275377))

(assert (=> b!259857 d!62327))

(declare-fun d!62329 () Bool)

(declare-fun e!168587 () Bool)

(assert (=> d!62329 e!168587))

(declare-fun res!127133 () Bool)

(assert (=> d!62329 (=> (not res!127133) (not e!168587))))

(declare-fun lt!131118 () ListLongMap!3797)

(assert (=> d!62329 (= res!127133 (contains!1870 lt!131118 (_1!2458 (tuple2!4895 key!932 v!346))))))

(declare-fun lt!131116 () List!3792)

(assert (=> d!62329 (= lt!131118 (ListLongMap!3798 lt!131116))))

(declare-fun lt!131115 () Unit!8037)

(declare-fun lt!131117 () Unit!8037)

(assert (=> d!62329 (= lt!131115 lt!131117)))

(assert (=> d!62329 (= (getValueByKey!314 lt!131116 (_1!2458 (tuple2!4895 key!932 v!346))) (Some!319 (_2!2458 (tuple2!4895 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!173 (List!3792 (_ BitVec 64) V!8473) Unit!8037)

(assert (=> d!62329 (= lt!131117 (lemmaContainsTupThenGetReturnValue!173 lt!131116 (_1!2458 (tuple2!4895 key!932 v!346)) (_2!2458 (tuple2!4895 key!932 v!346))))))

(declare-fun insertStrictlySorted!176 (List!3792 (_ BitVec 64) V!8473) List!3792)

(assert (=> d!62329 (= lt!131116 (insertStrictlySorted!176 (toList!1914 lt!130910) (_1!2458 (tuple2!4895 key!932 v!346)) (_2!2458 (tuple2!4895 key!932 v!346))))))

(assert (=> d!62329 (= (+!701 lt!130910 (tuple2!4895 key!932 v!346)) lt!131118)))

(declare-fun b!260146 () Bool)

(declare-fun res!127132 () Bool)

(assert (=> b!260146 (=> (not res!127132) (not e!168587))))

(assert (=> b!260146 (= res!127132 (= (getValueByKey!314 (toList!1914 lt!131118) (_1!2458 (tuple2!4895 key!932 v!346))) (Some!319 (_2!2458 (tuple2!4895 key!932 v!346)))))))

(declare-fun b!260147 () Bool)

(declare-fun contains!1873 (List!3792 tuple2!4894) Bool)

(assert (=> b!260147 (= e!168587 (contains!1873 (toList!1914 lt!131118) (tuple2!4895 key!932 v!346)))))

(assert (= (and d!62329 res!127133) b!260146))

(assert (= (and b!260146 res!127132) b!260147))

(declare-fun m!275379 () Bool)

(assert (=> d!62329 m!275379))

(declare-fun m!275381 () Bool)

(assert (=> d!62329 m!275381))

(declare-fun m!275383 () Bool)

(assert (=> d!62329 m!275383))

(declare-fun m!275385 () Bool)

(assert (=> d!62329 m!275385))

(declare-fun m!275387 () Bool)

(assert (=> b!260146 m!275387))

(declare-fun m!275389 () Bool)

(assert (=> b!260147 m!275389))

(assert (=> b!259857 d!62329))

(declare-fun bm!24795 () Bool)

(declare-fun call!24798 () Bool)

(assert (=> bm!24795 (= call!24798 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!130908 (mask!11119 thiss!1504)))))

(declare-fun b!260156 () Bool)

(declare-fun e!168595 () Bool)

(declare-fun e!168594 () Bool)

(assert (=> b!260156 (= e!168595 e!168594)))

(declare-fun lt!131127 () (_ BitVec 64))

(assert (=> b!260156 (= lt!131127 (select (arr!5956 lt!130908) #b00000000000000000000000000000000))))

(declare-fun lt!131125 () Unit!8037)

(assert (=> b!260156 (= lt!131125 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130908 lt!131127 #b00000000000000000000000000000000))))

(assert (=> b!260156 (arrayContainsKey!0 lt!130908 lt!131127 #b00000000000000000000000000000000)))

(declare-fun lt!131126 () Unit!8037)

(assert (=> b!260156 (= lt!131126 lt!131125)))

(declare-fun res!127138 () Bool)

(assert (=> b!260156 (= res!127138 (= (seekEntryOrOpen!0 (select (arr!5956 lt!130908) #b00000000000000000000000000000000) lt!130908 (mask!11119 thiss!1504)) (Found!1177 #b00000000000000000000000000000000)))))

(assert (=> b!260156 (=> (not res!127138) (not e!168594))))

(declare-fun d!62331 () Bool)

(declare-fun res!127139 () Bool)

(declare-fun e!168596 () Bool)

(assert (=> d!62331 (=> res!127139 e!168596)))

(assert (=> d!62331 (= res!127139 (bvsge #b00000000000000000000000000000000 (size!6306 lt!130908)))))

(assert (=> d!62331 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!130908 (mask!11119 thiss!1504)) e!168596)))

(declare-fun b!260157 () Bool)

(assert (=> b!260157 (= e!168594 call!24798)))

(declare-fun b!260158 () Bool)

(assert (=> b!260158 (= e!168595 call!24798)))

(declare-fun b!260159 () Bool)

(assert (=> b!260159 (= e!168596 e!168595)))

(declare-fun c!44199 () Bool)

(assert (=> b!260159 (= c!44199 (validKeyInArray!0 (select (arr!5956 lt!130908) #b00000000000000000000000000000000)))))

(assert (= (and d!62331 (not res!127139)) b!260159))

(assert (= (and b!260159 c!44199) b!260156))

(assert (= (and b!260159 (not c!44199)) b!260158))

(assert (= (and b!260156 res!127138) b!260157))

(assert (= (or b!260157 b!260158) bm!24795))

(declare-fun m!275391 () Bool)

(assert (=> bm!24795 m!275391))

(declare-fun m!275393 () Bool)

(assert (=> b!260156 m!275393))

(declare-fun m!275395 () Bool)

(assert (=> b!260156 m!275395))

(declare-fun m!275397 () Bool)

(assert (=> b!260156 m!275397))

(assert (=> b!260156 m!275393))

(declare-fun m!275399 () Bool)

(assert (=> b!260156 m!275399))

(assert (=> b!260159 m!275393))

(assert (=> b!260159 m!275393))

(declare-fun m!275401 () Bool)

(assert (=> b!260159 m!275401))

(assert (=> b!259857 d!62331))

(declare-fun b!260168 () Bool)

(declare-fun e!168601 () (_ BitVec 32))

(declare-fun call!24801 () (_ BitVec 32))

(assert (=> b!260168 (= e!168601 call!24801)))

(declare-fun b!260169 () Bool)

(declare-fun e!168602 () (_ BitVec 32))

(assert (=> b!260169 (= e!168602 #b00000000000000000000000000000000)))

(declare-fun b!260170 () Bool)

(assert (=> b!260170 (= e!168601 (bvadd #b00000000000000000000000000000001 call!24801))))

(declare-fun b!260171 () Bool)

(assert (=> b!260171 (= e!168602 e!168601)))

(declare-fun c!44204 () Bool)

(assert (=> b!260171 (= c!44204 (validKeyInArray!0 (select (arr!5956 lt!130908) #b00000000000000000000000000000000)))))

(declare-fun d!62333 () Bool)

(declare-fun lt!131130 () (_ BitVec 32))

(assert (=> d!62333 (and (bvsge lt!131130 #b00000000000000000000000000000000) (bvsle lt!131130 (bvsub (size!6306 lt!130908) #b00000000000000000000000000000000)))))

(assert (=> d!62333 (= lt!131130 e!168602)))

(declare-fun c!44205 () Bool)

(assert (=> d!62333 (= c!44205 (bvsge #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))))))

(assert (=> d!62333 (and (bvsle #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6306 (_keys!6973 thiss!1504)) (size!6306 lt!130908)))))

(assert (=> d!62333 (= (arrayCountValidKeys!0 lt!130908 #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))) lt!131130)))

(declare-fun bm!24798 () Bool)

(assert (=> bm!24798 (= call!24801 (arrayCountValidKeys!0 lt!130908 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6306 (_keys!6973 thiss!1504))))))

(assert (= (and d!62333 c!44205) b!260169))

(assert (= (and d!62333 (not c!44205)) b!260171))

(assert (= (and b!260171 c!44204) b!260170))

(assert (= (and b!260171 (not c!44204)) b!260168))

(assert (= (or b!260170 b!260168) bm!24798))

(assert (=> b!260171 m!275393))

(assert (=> b!260171 m!275393))

(assert (=> b!260171 m!275401))

(declare-fun m!275403 () Bool)

(assert (=> bm!24798 m!275403))

(assert (=> b!259857 d!62333))

(declare-fun d!62335 () Bool)

(declare-fun e!168605 () Bool)

(assert (=> d!62335 e!168605))

(declare-fun res!127142 () Bool)

(assert (=> d!62335 (=> (not res!127142) (not e!168605))))

(assert (=> d!62335 (= res!127142 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6306 (_keys!6973 thiss!1504)))))))

(declare-fun lt!131133 () Unit!8037)

(declare-fun choose!41 (array!12585 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3793) Unit!8037)

(assert (=> d!62335 (= lt!131133 (choose!41 (_keys!6973 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3790))))

(assert (=> d!62335 (bvslt (size!6306 (_keys!6973 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!62335 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6973 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3790) lt!131133)))

(declare-fun b!260174 () Bool)

(assert (=> b!260174 (= e!168605 (arrayNoDuplicates!0 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) #b00000000000000000000000000000000 Nil!3790))))

(assert (= (and d!62335 res!127142) b!260174))

(declare-fun m!275405 () Bool)

(assert (=> d!62335 m!275405))

(assert (=> b!260174 m!275099))

(declare-fun m!275407 () Bool)

(assert (=> b!260174 m!275407))

(assert (=> b!259857 d!62335))

(declare-fun b!260175 () Bool)

(declare-fun e!168606 () (_ BitVec 32))

(declare-fun call!24802 () (_ BitVec 32))

(assert (=> b!260175 (= e!168606 call!24802)))

(declare-fun b!260176 () Bool)

(declare-fun e!168607 () (_ BitVec 32))

(assert (=> b!260176 (= e!168607 #b00000000000000000000000000000000)))

(declare-fun b!260177 () Bool)

(assert (=> b!260177 (= e!168606 (bvadd #b00000000000000000000000000000001 call!24802))))

(declare-fun b!260178 () Bool)

(assert (=> b!260178 (= e!168607 e!168606)))

(declare-fun c!44206 () Bool)

(assert (=> b!260178 (= c!44206 (validKeyInArray!0 (select (arr!5956 lt!130908) index!297)))))

(declare-fun d!62337 () Bool)

(declare-fun lt!131134 () (_ BitVec 32))

(assert (=> d!62337 (and (bvsge lt!131134 #b00000000000000000000000000000000) (bvsle lt!131134 (bvsub (size!6306 lt!130908) index!297)))))

(assert (=> d!62337 (= lt!131134 e!168607)))

(declare-fun c!44207 () Bool)

(assert (=> d!62337 (= c!44207 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62337 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6306 lt!130908)))))

(assert (=> d!62337 (= (arrayCountValidKeys!0 lt!130908 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!131134)))

(declare-fun bm!24799 () Bool)

(assert (=> bm!24799 (= call!24802 (arrayCountValidKeys!0 lt!130908 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (= (and d!62337 c!44207) b!260176))

(assert (= (and d!62337 (not c!44207)) b!260178))

(assert (= (and b!260178 c!44206) b!260177))

(assert (= (and b!260178 (not c!44206)) b!260175))

(assert (= (or b!260177 b!260175) bm!24799))

(declare-fun m!275409 () Bool)

(assert (=> b!260178 m!275409))

(assert (=> b!260178 m!275409))

(declare-fun m!275411 () Bool)

(assert (=> b!260178 m!275411))

(declare-fun m!275413 () Bool)

(assert (=> bm!24799 m!275413))

(assert (=> b!259857 d!62337))

(declare-fun b!260179 () Bool)

(declare-fun e!168619 () Bool)

(assert (=> b!260179 (= e!168619 (validKeyInArray!0 (select (arr!5956 lt!130908) #b00000000000000000000000000000000)))))

(declare-fun b!260180 () Bool)

(declare-fun e!168620 () ListLongMap!3797)

(declare-fun call!24806 () ListLongMap!3797)

(assert (=> b!260180 (= e!168620 call!24806)))

(declare-fun b!260181 () Bool)

(declare-fun res!127149 () Bool)

(declare-fun e!168615 () Bool)

(assert (=> b!260181 (=> (not res!127149) (not e!168615))))

(declare-fun e!168613 () Bool)

(assert (=> b!260181 (= res!127149 e!168613)))

(declare-fun c!44208 () Bool)

(assert (=> b!260181 (= c!44208 (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!260182 () Bool)

(declare-fun e!168611 () Bool)

(assert (=> b!260182 (= e!168615 e!168611)))

(declare-fun c!44213 () Bool)

(assert (=> b!260182 (= c!44213 (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!260183 () Bool)

(declare-fun call!24804 () Bool)

(assert (=> b!260183 (= e!168611 (not call!24804))))

(declare-fun b!260184 () Bool)

(declare-fun e!168609 () Unit!8037)

(declare-fun Unit!8052 () Unit!8037)

(assert (=> b!260184 (= e!168609 Unit!8052)))

(declare-fun bm!24800 () Bool)

(declare-fun call!24805 () ListLongMap!3797)

(assert (=> bm!24800 (= call!24805 (getCurrentListMapNoExtraKeys!574 lt!130908 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun b!260185 () Bool)

(declare-fun e!168618 () Bool)

(assert (=> b!260185 (= e!168613 e!168618)))

(declare-fun res!127148 () Bool)

(declare-fun call!24809 () Bool)

(assert (=> b!260185 (= res!127148 call!24809)))

(assert (=> b!260185 (=> (not res!127148) (not e!168618))))

(declare-fun b!260186 () Bool)

(declare-fun call!24808 () ListLongMap!3797)

(assert (=> b!260186 (= e!168620 call!24808)))

(declare-fun b!260187 () Bool)

(declare-fun e!168614 () Bool)

(assert (=> b!260187 (= e!168614 (validKeyInArray!0 (select (arr!5956 lt!130908) #b00000000000000000000000000000000)))))

(declare-fun bm!24801 () Bool)

(declare-fun call!24803 () ListLongMap!3797)

(assert (=> bm!24801 (= call!24803 call!24805)))

(declare-fun bm!24802 () Bool)

(declare-fun lt!131142 () ListLongMap!3797)

(assert (=> bm!24802 (= call!24804 (contains!1870 lt!131142 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260188 () Bool)

(declare-fun e!168610 () Bool)

(declare-fun e!168617 () Bool)

(assert (=> b!260188 (= e!168610 e!168617)))

(declare-fun res!127145 () Bool)

(assert (=> b!260188 (=> (not res!127145) (not e!168617))))

(assert (=> b!260188 (= res!127145 (contains!1870 lt!131142 (select (arr!5956 lt!130908) #b00000000000000000000000000000000)))))

(assert (=> b!260188 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6306 lt!130908)))))

(declare-fun b!260189 () Bool)

(declare-fun lt!131150 () Unit!8037)

(assert (=> b!260189 (= e!168609 lt!131150)))

(declare-fun lt!131140 () ListLongMap!3797)

(assert (=> b!260189 (= lt!131140 (getCurrentListMapNoExtraKeys!574 lt!130908 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131146 () (_ BitVec 64))

(assert (=> b!260189 (= lt!131146 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131144 () (_ BitVec 64))

(assert (=> b!260189 (= lt!131144 (select (arr!5956 lt!130908) #b00000000000000000000000000000000))))

(declare-fun lt!131154 () Unit!8037)

(assert (=> b!260189 (= lt!131154 (addStillContains!234 lt!131140 lt!131146 (zeroValue!4635 thiss!1504) lt!131144))))

(assert (=> b!260189 (contains!1870 (+!701 lt!131140 (tuple2!4895 lt!131146 (zeroValue!4635 thiss!1504))) lt!131144)))

(declare-fun lt!131137 () Unit!8037)

(assert (=> b!260189 (= lt!131137 lt!131154)))

(declare-fun lt!131151 () ListLongMap!3797)

(assert (=> b!260189 (= lt!131151 (getCurrentListMapNoExtraKeys!574 lt!130908 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131143 () (_ BitVec 64))

(assert (=> b!260189 (= lt!131143 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131153 () (_ BitVec 64))

(assert (=> b!260189 (= lt!131153 (select (arr!5956 lt!130908) #b00000000000000000000000000000000))))

(declare-fun lt!131136 () Unit!8037)

(assert (=> b!260189 (= lt!131136 (addApplyDifferent!234 lt!131151 lt!131143 (minValue!4635 thiss!1504) lt!131153))))

(assert (=> b!260189 (= (apply!258 (+!701 lt!131151 (tuple2!4895 lt!131143 (minValue!4635 thiss!1504))) lt!131153) (apply!258 lt!131151 lt!131153))))

(declare-fun lt!131135 () Unit!8037)

(assert (=> b!260189 (= lt!131135 lt!131136)))

(declare-fun lt!131145 () ListLongMap!3797)

(assert (=> b!260189 (= lt!131145 (getCurrentListMapNoExtraKeys!574 lt!130908 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131139 () (_ BitVec 64))

(assert (=> b!260189 (= lt!131139 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131138 () (_ BitVec 64))

(assert (=> b!260189 (= lt!131138 (select (arr!5956 lt!130908) #b00000000000000000000000000000000))))

(declare-fun lt!131148 () Unit!8037)

(assert (=> b!260189 (= lt!131148 (addApplyDifferent!234 lt!131145 lt!131139 (zeroValue!4635 thiss!1504) lt!131138))))

(assert (=> b!260189 (= (apply!258 (+!701 lt!131145 (tuple2!4895 lt!131139 (zeroValue!4635 thiss!1504))) lt!131138) (apply!258 lt!131145 lt!131138))))

(declare-fun lt!131155 () Unit!8037)

(assert (=> b!260189 (= lt!131155 lt!131148)))

(declare-fun lt!131147 () ListLongMap!3797)

(assert (=> b!260189 (= lt!131147 (getCurrentListMapNoExtraKeys!574 lt!130908 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131141 () (_ BitVec 64))

(assert (=> b!260189 (= lt!131141 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131152 () (_ BitVec 64))

(assert (=> b!260189 (= lt!131152 (select (arr!5956 lt!130908) #b00000000000000000000000000000000))))

(assert (=> b!260189 (= lt!131150 (addApplyDifferent!234 lt!131147 lt!131141 (minValue!4635 thiss!1504) lt!131152))))

(assert (=> b!260189 (= (apply!258 (+!701 lt!131147 (tuple2!4895 lt!131141 (minValue!4635 thiss!1504))) lt!131152) (apply!258 lt!131147 lt!131152))))

(declare-fun b!260190 () Bool)

(declare-fun e!168608 () Bool)

(assert (=> b!260190 (= e!168611 e!168608)))

(declare-fun res!127143 () Bool)

(assert (=> b!260190 (= res!127143 call!24804)))

(assert (=> b!260190 (=> (not res!127143) (not e!168608))))

(declare-fun b!260191 () Bool)

(assert (=> b!260191 (= e!168618 (= (apply!258 lt!131142 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4635 thiss!1504)))))

(declare-fun b!260192 () Bool)

(declare-fun e!168612 () ListLongMap!3797)

(declare-fun e!168616 () ListLongMap!3797)

(assert (=> b!260192 (= e!168612 e!168616)))

(declare-fun c!44209 () Bool)

(assert (=> b!260192 (= c!44209 (and (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24803 () Bool)

(assert (=> bm!24803 (= call!24806 call!24803)))

(declare-fun b!260193 () Bool)

(assert (=> b!260193 (= e!168608 (= (apply!258 lt!131142 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4635 thiss!1504)))))

(declare-fun b!260194 () Bool)

(assert (=> b!260194 (= e!168617 (= (apply!258 lt!131142 (select (arr!5956 lt!130908) #b00000000000000000000000000000000)) (get!3065 (select (arr!5955 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!592 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260194 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6305 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))))))))

(assert (=> b!260194 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6306 lt!130908)))))

(declare-fun b!260195 () Bool)

(assert (=> b!260195 (= e!168616 call!24808)))

(declare-fun bm!24804 () Bool)

(declare-fun call!24807 () ListLongMap!3797)

(declare-fun c!44211 () Bool)

(assert (=> bm!24804 (= call!24807 (+!701 (ite c!44211 call!24805 (ite c!44209 call!24803 call!24806)) (ite (or c!44211 c!44209) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(declare-fun b!260196 () Bool)

(assert (=> b!260196 (= e!168612 (+!701 call!24807 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))

(declare-fun b!260197 () Bool)

(declare-fun res!127147 () Bool)

(assert (=> b!260197 (=> (not res!127147) (not e!168615))))

(assert (=> b!260197 (= res!127147 e!168610)))

(declare-fun res!127144 () Bool)

(assert (=> b!260197 (=> res!127144 e!168610)))

(assert (=> b!260197 (= res!127144 (not e!168614))))

(declare-fun res!127151 () Bool)

(assert (=> b!260197 (=> (not res!127151) (not e!168614))))

(assert (=> b!260197 (= res!127151 (bvslt #b00000000000000000000000000000000 (size!6306 lt!130908)))))

(declare-fun bm!24805 () Bool)

(assert (=> bm!24805 (= call!24809 (contains!1870 lt!131142 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260198 () Bool)

(assert (=> b!260198 (= e!168613 (not call!24809))))

(declare-fun d!62339 () Bool)

(assert (=> d!62339 e!168615))

(declare-fun res!127150 () Bool)

(assert (=> d!62339 (=> (not res!127150) (not e!168615))))

(assert (=> d!62339 (= res!127150 (or (bvsge #b00000000000000000000000000000000 (size!6306 lt!130908)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6306 lt!130908)))))))

(declare-fun lt!131156 () ListLongMap!3797)

(assert (=> d!62339 (= lt!131142 lt!131156)))

(declare-fun lt!131149 () Unit!8037)

(assert (=> d!62339 (= lt!131149 e!168609)))

(declare-fun c!44210 () Bool)

(assert (=> d!62339 (= c!44210 e!168619)))

(declare-fun res!127146 () Bool)

(assert (=> d!62339 (=> (not res!127146) (not e!168619))))

(assert (=> d!62339 (= res!127146 (bvslt #b00000000000000000000000000000000 (size!6306 lt!130908)))))

(assert (=> d!62339 (= lt!131156 e!168612)))

(assert (=> d!62339 (= c!44211 (and (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62339 (validMask!0 (mask!11119 thiss!1504))))

(assert (=> d!62339 (= (getCurrentListMap!1423 lt!130908 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) lt!131142)))

(declare-fun bm!24806 () Bool)

(assert (=> bm!24806 (= call!24808 call!24807)))

(declare-fun b!260199 () Bool)

(declare-fun c!44212 () Bool)

(assert (=> b!260199 (= c!44212 (and (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!260199 (= e!168616 e!168620)))

(assert (= (and d!62339 c!44211) b!260196))

(assert (= (and d!62339 (not c!44211)) b!260192))

(assert (= (and b!260192 c!44209) b!260195))

(assert (= (and b!260192 (not c!44209)) b!260199))

(assert (= (and b!260199 c!44212) b!260186))

(assert (= (and b!260199 (not c!44212)) b!260180))

(assert (= (or b!260186 b!260180) bm!24803))

(assert (= (or b!260195 bm!24803) bm!24801))

(assert (= (or b!260195 b!260186) bm!24806))

(assert (= (or b!260196 bm!24801) bm!24800))

(assert (= (or b!260196 bm!24806) bm!24804))

(assert (= (and d!62339 res!127146) b!260179))

(assert (= (and d!62339 c!44210) b!260189))

(assert (= (and d!62339 (not c!44210)) b!260184))

(assert (= (and d!62339 res!127150) b!260197))

(assert (= (and b!260197 res!127151) b!260187))

(assert (= (and b!260197 (not res!127144)) b!260188))

(assert (= (and b!260188 res!127145) b!260194))

(assert (= (and b!260197 res!127147) b!260181))

(assert (= (and b!260181 c!44208) b!260185))

(assert (= (and b!260181 (not c!44208)) b!260198))

(assert (= (and b!260185 res!127148) b!260191))

(assert (= (or b!260185 b!260198) bm!24805))

(assert (= (and b!260181 res!127149) b!260182))

(assert (= (and b!260182 c!44213) b!260190))

(assert (= (and b!260182 (not c!44213)) b!260183))

(assert (= (and b!260190 res!127143) b!260193))

(assert (= (or b!260190 b!260183) bm!24802))

(declare-fun b_lambda!8243 () Bool)

(assert (=> (not b_lambda!8243) (not b!260194)))

(assert (=> b!260194 t!8859))

(declare-fun b_and!13845 () Bool)

(assert (= b_and!13843 (and (=> t!8859 result!5401) b_and!13845)))

(declare-fun m!275415 () Bool)

(assert (=> bm!24805 m!275415))

(declare-fun m!275417 () Bool)

(assert (=> bm!24800 m!275417))

(assert (=> b!260188 m!275393))

(assert (=> b!260188 m!275393))

(declare-fun m!275419 () Bool)

(assert (=> b!260188 m!275419))

(assert (=> b!260194 m!275393))

(declare-fun m!275421 () Bool)

(assert (=> b!260194 m!275421))

(declare-fun m!275423 () Bool)

(assert (=> b!260194 m!275423))

(assert (=> b!260194 m!275277))

(declare-fun m!275425 () Bool)

(assert (=> b!260194 m!275425))

(assert (=> b!260194 m!275393))

(assert (=> b!260194 m!275423))

(assert (=> b!260194 m!275277))

(declare-fun m!275427 () Bool)

(assert (=> bm!24804 m!275427))

(declare-fun m!275429 () Bool)

(assert (=> b!260191 m!275429))

(declare-fun m!275431 () Bool)

(assert (=> b!260193 m!275431))

(declare-fun m!275433 () Bool)

(assert (=> b!260196 m!275433))

(assert (=> b!260187 m!275393))

(assert (=> b!260187 m!275393))

(assert (=> b!260187 m!275401))

(declare-fun m!275435 () Bool)

(assert (=> b!260189 m!275435))

(declare-fun m!275437 () Bool)

(assert (=> b!260189 m!275437))

(declare-fun m!275439 () Bool)

(assert (=> b!260189 m!275439))

(declare-fun m!275441 () Bool)

(assert (=> b!260189 m!275441))

(assert (=> b!260189 m!275439))

(declare-fun m!275443 () Bool)

(assert (=> b!260189 m!275443))

(declare-fun m!275445 () Bool)

(assert (=> b!260189 m!275445))

(assert (=> b!260189 m!275445))

(declare-fun m!275447 () Bool)

(assert (=> b!260189 m!275447))

(assert (=> b!260189 m!275417))

(declare-fun m!275449 () Bool)

(assert (=> b!260189 m!275449))

(declare-fun m!275451 () Bool)

(assert (=> b!260189 m!275451))

(declare-fun m!275453 () Bool)

(assert (=> b!260189 m!275453))

(declare-fun m!275455 () Bool)

(assert (=> b!260189 m!275455))

(declare-fun m!275457 () Bool)

(assert (=> b!260189 m!275457))

(declare-fun m!275459 () Bool)

(assert (=> b!260189 m!275459))

(assert (=> b!260189 m!275393))

(declare-fun m!275461 () Bool)

(assert (=> b!260189 m!275461))

(assert (=> b!260189 m!275435))

(declare-fun m!275463 () Bool)

(assert (=> b!260189 m!275463))

(assert (=> b!260189 m!275451))

(declare-fun m!275465 () Bool)

(assert (=> bm!24802 m!275465))

(assert (=> d!62339 m!275079))

(assert (=> b!260179 m!275393))

(assert (=> b!260179 m!275393))

(assert (=> b!260179 m!275401))

(assert (=> b!259857 d!62339))

(declare-fun d!62341 () Bool)

(assert (=> d!62341 (= (arrayCountValidKeys!0 lt!130908 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!131159 () Unit!8037)

(declare-fun choose!2 (array!12585 (_ BitVec 32)) Unit!8037)

(assert (=> d!62341 (= lt!131159 (choose!2 lt!130908 index!297))))

(declare-fun e!168623 () Bool)

(assert (=> d!62341 e!168623))

(declare-fun res!127156 () Bool)

(assert (=> d!62341 (=> (not res!127156) (not e!168623))))

(assert (=> d!62341 (= res!127156 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6306 lt!130908))))))

(assert (=> d!62341 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!130908 index!297) lt!131159)))

(declare-fun b!260204 () Bool)

(declare-fun res!127157 () Bool)

(assert (=> b!260204 (=> (not res!127157) (not e!168623))))

(assert (=> b!260204 (= res!127157 (validKeyInArray!0 (select (arr!5956 lt!130908) index!297)))))

(declare-fun b!260205 () Bool)

(assert (=> b!260205 (= e!168623 (bvslt (size!6306 lt!130908) #b01111111111111111111111111111111))))

(assert (= (and d!62341 res!127156) b!260204))

(assert (= (and b!260204 res!127157) b!260205))

(declare-fun m!275467 () Bool)

(assert (=> d!62341 m!275467))

(declare-fun m!275469 () Bool)

(assert (=> d!62341 m!275469))

(assert (=> b!260204 m!275409))

(assert (=> b!260204 m!275409))

(assert (=> b!260204 m!275411))

(assert (=> b!259857 d!62341))

(declare-fun b!260216 () Bool)

(declare-fun e!168632 () Bool)

(declare-fun e!168633 () Bool)

(assert (=> b!260216 (= e!168632 e!168633)))

(declare-fun res!127164 () Bool)

(assert (=> b!260216 (=> (not res!127164) (not e!168633))))

(declare-fun e!168635 () Bool)

(assert (=> b!260216 (= res!127164 (not e!168635))))

(declare-fun res!127166 () Bool)

(assert (=> b!260216 (=> (not res!127166) (not e!168635))))

(assert (=> b!260216 (= res!127166 (validKeyInArray!0 (select (arr!5956 lt!130908) #b00000000000000000000000000000000)))))

(declare-fun b!260217 () Bool)

(declare-fun e!168634 () Bool)

(declare-fun call!24812 () Bool)

(assert (=> b!260217 (= e!168634 call!24812)))

(declare-fun d!62343 () Bool)

(declare-fun res!127165 () Bool)

(assert (=> d!62343 (=> res!127165 e!168632)))

(assert (=> d!62343 (= res!127165 (bvsge #b00000000000000000000000000000000 (size!6306 lt!130908)))))

(assert (=> d!62343 (= (arrayNoDuplicates!0 lt!130908 #b00000000000000000000000000000000 Nil!3790) e!168632)))

(declare-fun b!260218 () Bool)

(assert (=> b!260218 (= e!168633 e!168634)))

(declare-fun c!44216 () Bool)

(assert (=> b!260218 (= c!44216 (validKeyInArray!0 (select (arr!5956 lt!130908) #b00000000000000000000000000000000)))))

(declare-fun bm!24809 () Bool)

(assert (=> bm!24809 (= call!24812 (arrayNoDuplicates!0 lt!130908 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44216 (Cons!3789 (select (arr!5956 lt!130908) #b00000000000000000000000000000000) Nil!3790) Nil!3790)))))

(declare-fun b!260219 () Bool)

(declare-fun contains!1874 (List!3793 (_ BitVec 64)) Bool)

(assert (=> b!260219 (= e!168635 (contains!1874 Nil!3790 (select (arr!5956 lt!130908) #b00000000000000000000000000000000)))))

(declare-fun b!260220 () Bool)

(assert (=> b!260220 (= e!168634 call!24812)))

(assert (= (and d!62343 (not res!127165)) b!260216))

(assert (= (and b!260216 res!127166) b!260219))

(assert (= (and b!260216 res!127164) b!260218))

(assert (= (and b!260218 c!44216) b!260217))

(assert (= (and b!260218 (not c!44216)) b!260220))

(assert (= (or b!260217 b!260220) bm!24809))

(assert (=> b!260216 m!275393))

(assert (=> b!260216 m!275393))

(assert (=> b!260216 m!275401))

(assert (=> b!260218 m!275393))

(assert (=> b!260218 m!275393))

(assert (=> b!260218 m!275401))

(assert (=> bm!24809 m!275393))

(declare-fun m!275471 () Bool)

(assert (=> bm!24809 m!275471))

(assert (=> b!260219 m!275393))

(assert (=> b!260219 m!275393))

(declare-fun m!275473 () Bool)

(assert (=> b!260219 m!275473))

(assert (=> b!259857 d!62343))

(declare-fun d!62345 () Bool)

(declare-fun res!127171 () Bool)

(declare-fun e!168640 () Bool)

(assert (=> d!62345 (=> res!127171 e!168640)))

(assert (=> d!62345 (= res!127171 (= (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62345 (= (arrayContainsKey!0 (_keys!6973 thiss!1504) key!932 #b00000000000000000000000000000000) e!168640)))

(declare-fun b!260225 () Bool)

(declare-fun e!168641 () Bool)

(assert (=> b!260225 (= e!168640 e!168641)))

(declare-fun res!127172 () Bool)

(assert (=> b!260225 (=> (not res!127172) (not e!168641))))

(assert (=> b!260225 (= res!127172 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6306 (_keys!6973 thiss!1504))))))

(declare-fun b!260226 () Bool)

(assert (=> b!260226 (= e!168641 (arrayContainsKey!0 (_keys!6973 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62345 (not res!127171)) b!260225))

(assert (= (and b!260225 res!127172) b!260226))

(assert (=> d!62345 m!275269))

(declare-fun m!275475 () Bool)

(assert (=> b!260226 m!275475))

(assert (=> b!259857 d!62345))

(declare-fun d!62347 () Bool)

(declare-fun e!168644 () Bool)

(assert (=> d!62347 e!168644))

(declare-fun res!127175 () Bool)

(assert (=> d!62347 (=> (not res!127175) (not e!168644))))

(assert (=> d!62347 (= res!127175 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6306 (_keys!6973 thiss!1504)))))))

(declare-fun lt!131162 () Unit!8037)

(declare-fun choose!102 ((_ BitVec 64) array!12585 (_ BitVec 32) (_ BitVec 32)) Unit!8037)

(assert (=> d!62347 (= lt!131162 (choose!102 key!932 (_keys!6973 thiss!1504) index!297 (mask!11119 thiss!1504)))))

(assert (=> d!62347 (validMask!0 (mask!11119 thiss!1504))))

(assert (=> d!62347 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6973 thiss!1504) index!297 (mask!11119 thiss!1504)) lt!131162)))

(declare-fun b!260229 () Bool)

(assert (=> b!260229 (= e!168644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) (mask!11119 thiss!1504)))))

(assert (= (and d!62347 res!127175) b!260229))

(declare-fun m!275477 () Bool)

(assert (=> d!62347 m!275477))

(assert (=> d!62347 m!275079))

(assert (=> b!260229 m!275099))

(declare-fun m!275479 () Bool)

(assert (=> b!260229 m!275479))

(assert (=> b!259857 d!62347))

(declare-fun b!260230 () Bool)

(declare-fun e!168645 () (_ BitVec 32))

(declare-fun call!24813 () (_ BitVec 32))

(assert (=> b!260230 (= e!168645 call!24813)))

(declare-fun b!260231 () Bool)

(declare-fun e!168646 () (_ BitVec 32))

(assert (=> b!260231 (= e!168646 #b00000000000000000000000000000000)))

(declare-fun b!260232 () Bool)

(assert (=> b!260232 (= e!168645 (bvadd #b00000000000000000000000000000001 call!24813))))

(declare-fun b!260233 () Bool)

(assert (=> b!260233 (= e!168646 e!168645)))

(declare-fun c!44217 () Bool)

(assert (=> b!260233 (= c!44217 (validKeyInArray!0 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!62349 () Bool)

(declare-fun lt!131163 () (_ BitVec 32))

(assert (=> d!62349 (and (bvsge lt!131163 #b00000000000000000000000000000000) (bvsle lt!131163 (bvsub (size!6306 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!62349 (= lt!131163 e!168646)))

(declare-fun c!44218 () Bool)

(assert (=> d!62349 (= c!44218 (bvsge #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))))))

(assert (=> d!62349 (and (bvsle #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6306 (_keys!6973 thiss!1504)) (size!6306 (_keys!6973 thiss!1504))))))

(assert (=> d!62349 (= (arrayCountValidKeys!0 (_keys!6973 thiss!1504) #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))) lt!131163)))

(declare-fun bm!24810 () Bool)

(assert (=> bm!24810 (= call!24813 (arrayCountValidKeys!0 (_keys!6973 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6306 (_keys!6973 thiss!1504))))))

(assert (= (and d!62349 c!44218) b!260231))

(assert (= (and d!62349 (not c!44218)) b!260233))

(assert (= (and b!260233 c!44217) b!260232))

(assert (= (and b!260233 (not c!44217)) b!260230))

(assert (= (or b!260232 b!260230) bm!24810))

(assert (=> b!260233 m!275269))

(assert (=> b!260233 m!275269))

(assert (=> b!260233 m!275289))

(declare-fun m!275481 () Bool)

(assert (=> bm!24810 m!275481))

(assert (=> b!259857 d!62349))

(declare-fun d!62351 () Bool)

(declare-fun res!127176 () Bool)

(declare-fun e!168647 () Bool)

(assert (=> d!62351 (=> res!127176 e!168647)))

(assert (=> d!62351 (= res!127176 (= (select (arr!5956 lt!130908) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62351 (= (arrayContainsKey!0 lt!130908 key!932 #b00000000000000000000000000000000) e!168647)))

(declare-fun b!260234 () Bool)

(declare-fun e!168648 () Bool)

(assert (=> b!260234 (= e!168647 e!168648)))

(declare-fun res!127177 () Bool)

(assert (=> b!260234 (=> (not res!127177) (not e!168648))))

(assert (=> b!260234 (= res!127177 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6306 lt!130908)))))

(declare-fun b!260235 () Bool)

(assert (=> b!260235 (= e!168648 (arrayContainsKey!0 lt!130908 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62351 (not res!127176)) b!260234))

(assert (= (and b!260234 res!127177) b!260235))

(assert (=> d!62351 m!275393))

(declare-fun m!275483 () Bool)

(assert (=> b!260235 m!275483))

(assert (=> b!259857 d!62351))

(assert (=> bm!24753 d!62345))

(declare-fun b!260242 () Bool)

(declare-fun e!168653 () Bool)

(assert (=> b!260242 (= e!168653 tp_is_empty!6619)))

(declare-fun condMapEmpty!11288 () Bool)

(declare-fun mapDefault!11288 () ValueCell!2966)

(assert (=> mapNonEmpty!11279 (= condMapEmpty!11288 (= mapRest!11279 ((as const (Array (_ BitVec 32) ValueCell!2966)) mapDefault!11288)))))

(declare-fun e!168654 () Bool)

(declare-fun mapRes!11288 () Bool)

(assert (=> mapNonEmpty!11279 (= tp!23593 (and e!168654 mapRes!11288))))

(declare-fun b!260243 () Bool)

(assert (=> b!260243 (= e!168654 tp_is_empty!6619)))

(declare-fun mapNonEmpty!11288 () Bool)

(declare-fun tp!23609 () Bool)

(assert (=> mapNonEmpty!11288 (= mapRes!11288 (and tp!23609 e!168653))))

(declare-fun mapKey!11288 () (_ BitVec 32))

(declare-fun mapRest!11288 () (Array (_ BitVec 32) ValueCell!2966))

(declare-fun mapValue!11288 () ValueCell!2966)

(assert (=> mapNonEmpty!11288 (= mapRest!11279 (store mapRest!11288 mapKey!11288 mapValue!11288))))

(declare-fun mapIsEmpty!11288 () Bool)

(assert (=> mapIsEmpty!11288 mapRes!11288))

(assert (= (and mapNonEmpty!11279 condMapEmpty!11288) mapIsEmpty!11288))

(assert (= (and mapNonEmpty!11279 (not condMapEmpty!11288)) mapNonEmpty!11288))

(assert (= (and mapNonEmpty!11288 ((_ is ValueCellFull!2966) mapValue!11288)) b!260242))

(assert (= (and mapNonEmpty!11279 ((_ is ValueCellFull!2966) mapDefault!11288)) b!260243))

(declare-fun m!275485 () Bool)

(assert (=> mapNonEmpty!11288 m!275485))

(declare-fun b_lambda!8245 () Bool)

(assert (= b_lambda!8243 (or (and b!259851 b_free!6757) b_lambda!8245)))

(declare-fun b_lambda!8247 () Bool)

(assert (= b_lambda!8241 (or (and b!259851 b_free!6757) b_lambda!8247)))

(check-sat (not b!260188) (not b!260135) (not b!260146) (not b_lambda!8245) (not bm!24798) (not d!62319) (not b!260226) (not d!62327) (not b!260096) (not b!260216) (not b!260156) (not bm!24785) (not b!260189) (not d!62347) (not bm!24800) b_and!13845 (not bm!24792) (not b!260004) (not b!260187) (not bm!24810) (not b!260147) (not d!62317) (not bm!24784) (not d!62339) tp_is_empty!6619 (not bm!24802) (not b!260136) (not b!260233) (not b_next!6757) (not b!260061) (not b!260159) (not b!260002) (not b!260204) (not bm!24791) (not b!260191) (not b!260219) (not d!62321) (not b!260171) (not mapNonEmpty!11288) (not bm!24809) (not b!260082) (not b!260196) (not b!260179) (not b!260194) (not b!260193) (not d!62307) (not d!62303) (not b!260064) (not b!260055) (not b!260094) (not d!62311) (not bm!24805) (not d!62305) (not d!62301) (not b_lambda!8247) (not b!260056) (not bm!24795) (not b!260125) (not d!62323) (not bm!24780) (not bm!24782) (not b!260218) (not b!260138) (not d!62329) (not b!260047) (not b!260235) (not bm!24804) (not b!260062) (not b!260178) (not b!260174) (not b!260057) (not b!260095) (not b!260059) (not d!62335) (not b!260141) (not bm!24799) (not b!260229) (not d!62341))
(check-sat b_and!13845 (not b_next!6757))
(get-model)

(declare-fun d!62353 () Bool)

(assert (=> d!62353 (= (validKeyInArray!0 (select (arr!5956 lt!130908) #b00000000000000000000000000000000)) (and (not (= (select (arr!5956 lt!130908) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5956 lt!130908) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260159 d!62353))

(assert (=> d!62317 d!62305))

(declare-fun d!62355 () Bool)

(declare-fun e!168657 () Bool)

(assert (=> d!62355 e!168657))

(declare-fun res!127183 () Bool)

(assert (=> d!62355 (=> (not res!127183) (not e!168657))))

(declare-fun lt!131166 () SeekEntryResult!1177)

(assert (=> d!62355 (= res!127183 ((_ is Found!1177) lt!131166))))

(assert (=> d!62355 (= lt!131166 (seekEntryOrOpen!0 key!932 (_keys!6973 thiss!1504) (mask!11119 thiss!1504)))))

(assert (=> d!62355 true))

(declare-fun _$33!180 () Unit!8037)

(assert (=> d!62355 (= (choose!1272 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 (defaultEntry!4794 thiss!1504)) _$33!180)))

(declare-fun b!260248 () Bool)

(declare-fun res!127182 () Bool)

(assert (=> b!260248 (=> (not res!127182) (not e!168657))))

(assert (=> b!260248 (= res!127182 (inRange!0 (index!6879 lt!131166) (mask!11119 thiss!1504)))))

(declare-fun b!260249 () Bool)

(assert (=> b!260249 (= e!168657 (= (select (arr!5956 (_keys!6973 thiss!1504)) (index!6879 lt!131166)) key!932))))

(assert (= (and d!62355 res!127183) b!260248))

(assert (= (and b!260248 res!127182) b!260249))

(assert (=> d!62355 m!275113))

(declare-fun m!275487 () Bool)

(assert (=> b!260248 m!275487))

(declare-fun m!275489 () Bool)

(assert (=> b!260249 m!275489))

(assert (=> d!62317 d!62355))

(assert (=> d!62317 d!62325))

(declare-fun d!62357 () Bool)

(declare-fun e!168658 () Bool)

(assert (=> d!62357 e!168658))

(declare-fun res!127184 () Bool)

(assert (=> d!62357 (=> res!127184 e!168658)))

(declare-fun lt!131167 () Bool)

(assert (=> d!62357 (= res!127184 (not lt!131167))))

(declare-fun lt!131170 () Bool)

(assert (=> d!62357 (= lt!131167 lt!131170)))

(declare-fun lt!131169 () Unit!8037)

(declare-fun e!168659 () Unit!8037)

(assert (=> d!62357 (= lt!131169 e!168659)))

(declare-fun c!44219 () Bool)

(assert (=> d!62357 (= c!44219 lt!131170)))

(assert (=> d!62357 (= lt!131170 (containsKey!306 (toList!1914 lt!131142) (select (arr!5956 lt!130908) #b00000000000000000000000000000000)))))

(assert (=> d!62357 (= (contains!1870 lt!131142 (select (arr!5956 lt!130908) #b00000000000000000000000000000000)) lt!131167)))

(declare-fun b!260250 () Bool)

(declare-fun lt!131168 () Unit!8037)

(assert (=> b!260250 (= e!168659 lt!131168)))

(assert (=> b!260250 (= lt!131168 (lemmaContainsKeyImpliesGetValueByKeyDefined!255 (toList!1914 lt!131142) (select (arr!5956 lt!130908) #b00000000000000000000000000000000)))))

(assert (=> b!260250 (isDefined!256 (getValueByKey!314 (toList!1914 lt!131142) (select (arr!5956 lt!130908) #b00000000000000000000000000000000)))))

(declare-fun b!260251 () Bool)

(declare-fun Unit!8053 () Unit!8037)

(assert (=> b!260251 (= e!168659 Unit!8053)))

(declare-fun b!260252 () Bool)

(assert (=> b!260252 (= e!168658 (isDefined!256 (getValueByKey!314 (toList!1914 lt!131142) (select (arr!5956 lt!130908) #b00000000000000000000000000000000))))))

(assert (= (and d!62357 c!44219) b!260250))

(assert (= (and d!62357 (not c!44219)) b!260251))

(assert (= (and d!62357 (not res!127184)) b!260252))

(assert (=> d!62357 m!275393))

(declare-fun m!275491 () Bool)

(assert (=> d!62357 m!275491))

(assert (=> b!260250 m!275393))

(declare-fun m!275493 () Bool)

(assert (=> b!260250 m!275493))

(assert (=> b!260250 m!275393))

(declare-fun m!275495 () Bool)

(assert (=> b!260250 m!275495))

(assert (=> b!260250 m!275495))

(declare-fun m!275497 () Bool)

(assert (=> b!260250 m!275497))

(assert (=> b!260252 m!275393))

(assert (=> b!260252 m!275495))

(assert (=> b!260252 m!275495))

(assert (=> b!260252 m!275497))

(assert (=> b!260188 d!62357))

(declare-fun d!62359 () Bool)

(declare-fun e!168660 () Bool)

(assert (=> d!62359 e!168660))

(declare-fun res!127185 () Bool)

(assert (=> d!62359 (=> res!127185 e!168660)))

(declare-fun lt!131171 () Bool)

(assert (=> d!62359 (= res!127185 (not lt!131171))))

(declare-fun lt!131174 () Bool)

(assert (=> d!62359 (= lt!131171 lt!131174)))

(declare-fun lt!131173 () Unit!8037)

(declare-fun e!168661 () Unit!8037)

(assert (=> d!62359 (= lt!131173 e!168661)))

(declare-fun c!44220 () Bool)

(assert (=> d!62359 (= c!44220 lt!131174)))

(assert (=> d!62359 (= lt!131174 (containsKey!306 (toList!1914 lt!131059) (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!62359 (= (contains!1870 lt!131059 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)) lt!131171)))

(declare-fun b!260253 () Bool)

(declare-fun lt!131172 () Unit!8037)

(assert (=> b!260253 (= e!168661 lt!131172)))

(assert (=> b!260253 (= lt!131172 (lemmaContainsKeyImpliesGetValueByKeyDefined!255 (toList!1914 lt!131059) (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!260253 (isDefined!256 (getValueByKey!314 (toList!1914 lt!131059) (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!260254 () Bool)

(declare-fun Unit!8054 () Unit!8037)

(assert (=> b!260254 (= e!168661 Unit!8054)))

(declare-fun b!260255 () Bool)

(assert (=> b!260255 (= e!168660 (isDefined!256 (getValueByKey!314 (toList!1914 lt!131059) (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!62359 c!44220) b!260253))

(assert (= (and d!62359 (not c!44220)) b!260254))

(assert (= (and d!62359 (not res!127185)) b!260255))

(assert (=> d!62359 m!275269))

(declare-fun m!275499 () Bool)

(assert (=> d!62359 m!275499))

(assert (=> b!260253 m!275269))

(declare-fun m!275501 () Bool)

(assert (=> b!260253 m!275501))

(assert (=> b!260253 m!275269))

(declare-fun m!275503 () Bool)

(assert (=> b!260253 m!275503))

(assert (=> b!260253 m!275503))

(declare-fun m!275505 () Bool)

(assert (=> b!260253 m!275505))

(assert (=> b!260255 m!275269))

(assert (=> b!260255 m!275503))

(assert (=> b!260255 m!275503))

(assert (=> b!260255 m!275505))

(assert (=> b!260056 d!62359))

(declare-fun d!62361 () Bool)

(assert (=> d!62361 (= (validKeyInArray!0 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260233 d!62361))

(declare-fun d!62363 () Bool)

(declare-fun get!3066 (Option!320) V!8473)

(assert (=> d!62363 (= (apply!258 lt!131142 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3066 (getValueByKey!314 (toList!1914 lt!131142) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9140 () Bool)

(assert (= bs!9140 d!62363))

(declare-fun m!275507 () Bool)

(assert (=> bs!9140 m!275507))

(assert (=> bs!9140 m!275507))

(declare-fun m!275509 () Bool)

(assert (=> bs!9140 m!275509))

(assert (=> b!260193 d!62363))

(declare-fun b!260256 () Bool)

(declare-fun e!168662 () (_ BitVec 32))

(declare-fun call!24814 () (_ BitVec 32))

(assert (=> b!260256 (= e!168662 call!24814)))

(declare-fun b!260257 () Bool)

(declare-fun e!168663 () (_ BitVec 32))

(assert (=> b!260257 (= e!168663 #b00000000000000000000000000000000)))

(declare-fun b!260258 () Bool)

(assert (=> b!260258 (= e!168662 (bvadd #b00000000000000000000000000000001 call!24814))))

(declare-fun b!260259 () Bool)

(assert (=> b!260259 (= e!168663 e!168662)))

(declare-fun c!44221 () Bool)

(assert (=> b!260259 (= c!44221 (validKeyInArray!0 (select (arr!5956 lt!130908) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun d!62365 () Bool)

(declare-fun lt!131175 () (_ BitVec 32))

(assert (=> d!62365 (and (bvsge lt!131175 #b00000000000000000000000000000000) (bvsle lt!131175 (bvsub (size!6306 lt!130908) (bvadd index!297 #b00000000000000000000000000000001))))))

(assert (=> d!62365 (= lt!131175 e!168663)))

(declare-fun c!44222 () Bool)

(assert (=> d!62365 (= c!44222 (bvsge (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62365 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) (bvsge (bvadd index!297 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6306 lt!130908)))))

(assert (=> d!62365 (= (arrayCountValidKeys!0 lt!130908 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) lt!131175)))

(declare-fun bm!24811 () Bool)

(assert (=> bm!24811 (= call!24814 (arrayCountValidKeys!0 lt!130908 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (= (and d!62365 c!44222) b!260257))

(assert (= (and d!62365 (not c!44222)) b!260259))

(assert (= (and b!260259 c!44221) b!260258))

(assert (= (and b!260259 (not c!44221)) b!260256))

(assert (= (or b!260258 b!260256) bm!24811))

(declare-fun m!275511 () Bool)

(assert (=> b!260259 m!275511))

(assert (=> b!260259 m!275511))

(declare-fun m!275513 () Bool)

(assert (=> b!260259 m!275513))

(declare-fun m!275515 () Bool)

(assert (=> bm!24811 m!275515))

(assert (=> bm!24799 d!62365))

(declare-fun d!62367 () Bool)

(assert (=> d!62367 (= (validKeyInArray!0 (select (arr!5956 lt!130908) index!297)) (and (not (= (select (arr!5956 lt!130908) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5956 lt!130908) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260204 d!62367))

(declare-fun b!260260 () Bool)

(declare-fun e!168664 () (_ BitVec 32))

(declare-fun call!24815 () (_ BitVec 32))

(assert (=> b!260260 (= e!168664 call!24815)))

(declare-fun b!260261 () Bool)

(declare-fun e!168665 () (_ BitVec 32))

(assert (=> b!260261 (= e!168665 #b00000000000000000000000000000000)))

(declare-fun b!260262 () Bool)

(assert (=> b!260262 (= e!168664 (bvadd #b00000000000000000000000000000001 call!24815))))

(declare-fun b!260263 () Bool)

(assert (=> b!260263 (= e!168665 e!168664)))

(declare-fun c!44223 () Bool)

(assert (=> b!260263 (= c!44223 (validKeyInArray!0 (select (arr!5956 lt!130908) index!297)))))

(declare-fun d!62369 () Bool)

(declare-fun lt!131176 () (_ BitVec 32))

(assert (=> d!62369 (and (bvsge lt!131176 #b00000000000000000000000000000000) (bvsle lt!131176 (bvsub (size!6306 lt!130908) index!297)))))

(assert (=> d!62369 (= lt!131176 e!168665)))

(declare-fun c!44224 () Bool)

(assert (=> d!62369 (= c!44224 (bvsge index!297 (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (=> d!62369 (and (bvsle index!297 (bvadd index!297 #b00000000000000000000000000000001)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd index!297 #b00000000000000000000000000000001) (size!6306 lt!130908)))))

(assert (=> d!62369 (= (arrayCountValidKeys!0 lt!130908 index!297 (bvadd index!297 #b00000000000000000000000000000001)) lt!131176)))

(declare-fun bm!24812 () Bool)

(assert (=> bm!24812 (= call!24815 (arrayCountValidKeys!0 lt!130908 (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (= (and d!62369 c!44224) b!260261))

(assert (= (and d!62369 (not c!44224)) b!260263))

(assert (= (and b!260263 c!44223) b!260262))

(assert (= (and b!260263 (not c!44223)) b!260260))

(assert (= (or b!260262 b!260260) bm!24812))

(assert (=> b!260263 m!275409))

(assert (=> b!260263 m!275409))

(assert (=> b!260263 m!275411))

(declare-fun m!275517 () Bool)

(assert (=> bm!24812 m!275517))

(assert (=> d!62341 d!62369))

(declare-fun d!62371 () Bool)

(assert (=> d!62371 (= (arrayCountValidKeys!0 lt!130908 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(assert (=> d!62371 true))

(declare-fun _$85!27 () Unit!8037)

(assert (=> d!62371 (= (choose!2 lt!130908 index!297) _$85!27)))

(declare-fun bs!9141 () Bool)

(assert (= bs!9141 d!62371))

(assert (=> bs!9141 m!275467))

(assert (=> d!62341 d!62371))

(declare-fun d!62373 () Bool)

(declare-fun e!168666 () Bool)

(assert (=> d!62373 e!168666))

(declare-fun res!127187 () Bool)

(assert (=> d!62373 (=> (not res!127187) (not e!168666))))

(declare-fun lt!131180 () ListLongMap!3797)

(assert (=> d!62373 (= res!127187 (contains!1870 lt!131180 (_1!2458 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(declare-fun lt!131178 () List!3792)

(assert (=> d!62373 (= lt!131180 (ListLongMap!3798 lt!131178))))

(declare-fun lt!131177 () Unit!8037)

(declare-fun lt!131179 () Unit!8037)

(assert (=> d!62373 (= lt!131177 lt!131179)))

(assert (=> d!62373 (= (getValueByKey!314 lt!131178 (_1!2458 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(assert (=> d!62373 (= lt!131179 (lemmaContainsTupThenGetReturnValue!173 lt!131178 (_1!2458 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(assert (=> d!62373 (= lt!131178 (insertStrictlySorted!176 (toList!1914 call!24807) (_1!2458 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(assert (=> d!62373 (= (+!701 call!24807 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))) lt!131180)))

(declare-fun b!260264 () Bool)

(declare-fun res!127186 () Bool)

(assert (=> b!260264 (=> (not res!127186) (not e!168666))))

(assert (=> b!260264 (= res!127186 (= (getValueByKey!314 (toList!1914 lt!131180) (_1!2458 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(declare-fun b!260265 () Bool)

(assert (=> b!260265 (= e!168666 (contains!1873 (toList!1914 lt!131180) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))

(assert (= (and d!62373 res!127187) b!260264))

(assert (= (and b!260264 res!127186) b!260265))

(declare-fun m!275519 () Bool)

(assert (=> d!62373 m!275519))

(declare-fun m!275521 () Bool)

(assert (=> d!62373 m!275521))

(declare-fun m!275523 () Bool)

(assert (=> d!62373 m!275523))

(declare-fun m!275525 () Bool)

(assert (=> d!62373 m!275525))

(declare-fun m!275527 () Bool)

(assert (=> b!260264 m!275527))

(declare-fun m!275529 () Bool)

(assert (=> b!260265 m!275529))

(assert (=> b!260196 d!62373))

(declare-fun b!260266 () Bool)

(declare-fun e!168667 () (_ BitVec 32))

(declare-fun call!24816 () (_ BitVec 32))

(assert (=> b!260266 (= e!168667 call!24816)))

(declare-fun b!260267 () Bool)

(declare-fun e!168668 () (_ BitVec 32))

(assert (=> b!260267 (= e!168668 #b00000000000000000000000000000000)))

(declare-fun b!260268 () Bool)

(assert (=> b!260268 (= e!168667 (bvadd #b00000000000000000000000000000001 call!24816))))

(declare-fun b!260269 () Bool)

(assert (=> b!260269 (= e!168668 e!168667)))

(declare-fun c!44225 () Bool)

(assert (=> b!260269 (= c!44225 (validKeyInArray!0 (select (arr!5956 lt!130908) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!62375 () Bool)

(declare-fun lt!131181 () (_ BitVec 32))

(assert (=> d!62375 (and (bvsge lt!131181 #b00000000000000000000000000000000) (bvsle lt!131181 (bvsub (size!6306 lt!130908) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!62375 (= lt!131181 e!168668)))

(declare-fun c!44226 () Bool)

(assert (=> d!62375 (= c!44226 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6306 (_keys!6973 thiss!1504))))))

(assert (=> d!62375 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6306 (_keys!6973 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6306 (_keys!6973 thiss!1504)) (size!6306 lt!130908)))))

(assert (=> d!62375 (= (arrayCountValidKeys!0 lt!130908 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6306 (_keys!6973 thiss!1504))) lt!131181)))

(declare-fun bm!24813 () Bool)

(assert (=> bm!24813 (= call!24816 (arrayCountValidKeys!0 lt!130908 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6306 (_keys!6973 thiss!1504))))))

(assert (= (and d!62375 c!44226) b!260267))

(assert (= (and d!62375 (not c!44226)) b!260269))

(assert (= (and b!260269 c!44225) b!260268))

(assert (= (and b!260269 (not c!44225)) b!260266))

(assert (= (or b!260268 b!260266) bm!24813))

(declare-fun m!275531 () Bool)

(assert (=> b!260269 m!275531))

(assert (=> b!260269 m!275531))

(declare-fun m!275533 () Bool)

(assert (=> b!260269 m!275533))

(declare-fun m!275535 () Bool)

(assert (=> bm!24813 m!275535))

(assert (=> bm!24798 d!62375))

(declare-fun d!62377 () Bool)

(declare-fun res!127188 () Bool)

(declare-fun e!168669 () Bool)

(assert (=> d!62377 (=> res!127188 e!168669)))

(assert (=> d!62377 (= res!127188 (= (select (arr!5956 (_keys!6973 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62377 (= (arrayContainsKey!0 (_keys!6973 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!168669)))

(declare-fun b!260270 () Bool)

(declare-fun e!168670 () Bool)

(assert (=> b!260270 (= e!168669 e!168670)))

(declare-fun res!127189 () Bool)

(assert (=> b!260270 (=> (not res!127189) (not e!168670))))

(assert (=> b!260270 (= res!127189 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6306 (_keys!6973 thiss!1504))))))

(declare-fun b!260271 () Bool)

(assert (=> b!260271 (= e!168670 (arrayContainsKey!0 (_keys!6973 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62377 (not res!127188)) b!260270))

(assert (= (and b!260270 res!127189) b!260271))

(declare-fun m!275537 () Bool)

(assert (=> d!62377 m!275537))

(declare-fun m!275539 () Bool)

(assert (=> b!260271 m!275539))

(assert (=> b!260226 d!62377))

(declare-fun d!62379 () Bool)

(assert (=> d!62379 (= (apply!258 lt!131059 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3066 (getValueByKey!314 (toList!1914 lt!131059) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9142 () Bool)

(assert (= bs!9142 d!62379))

(declare-fun m!275541 () Bool)

(assert (=> bs!9142 m!275541))

(assert (=> bs!9142 m!275541))

(declare-fun m!275543 () Bool)

(assert (=> bs!9142 m!275543))

(assert (=> b!260061 d!62379))

(assert (=> d!62303 d!62325))

(assert (=> b!260047 d!62361))

(declare-fun d!62381 () Bool)

(declare-fun e!168671 () Bool)

(assert (=> d!62381 e!168671))

(declare-fun res!127191 () Bool)

(assert (=> d!62381 (=> (not res!127191) (not e!168671))))

(declare-fun lt!131185 () ListLongMap!3797)

(assert (=> d!62381 (= res!127191 (contains!1870 lt!131185 (_1!2458 (ite (or c!44179 c!44177) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(declare-fun lt!131183 () List!3792)

(assert (=> d!62381 (= lt!131185 (ListLongMap!3798 lt!131183))))

(declare-fun lt!131182 () Unit!8037)

(declare-fun lt!131184 () Unit!8037)

(assert (=> d!62381 (= lt!131182 lt!131184)))

(assert (=> d!62381 (= (getValueByKey!314 lt!131183 (_1!2458 (ite (or c!44179 c!44177) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))) (Some!319 (_2!2458 (ite (or c!44179 c!44177) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(assert (=> d!62381 (= lt!131184 (lemmaContainsTupThenGetReturnValue!173 lt!131183 (_1!2458 (ite (or c!44179 c!44177) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) (_2!2458 (ite (or c!44179 c!44177) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(assert (=> d!62381 (= lt!131183 (insertStrictlySorted!176 (toList!1914 (ite c!44179 call!24785 (ite c!44177 call!24783 call!24786))) (_1!2458 (ite (or c!44179 c!44177) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) (_2!2458 (ite (or c!44179 c!44177) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(assert (=> d!62381 (= (+!701 (ite c!44179 call!24785 (ite c!44177 call!24783 call!24786)) (ite (or c!44179 c!44177) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) lt!131185)))

(declare-fun b!260272 () Bool)

(declare-fun res!127190 () Bool)

(assert (=> b!260272 (=> (not res!127190) (not e!168671))))

(assert (=> b!260272 (= res!127190 (= (getValueByKey!314 (toList!1914 lt!131185) (_1!2458 (ite (or c!44179 c!44177) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))) (Some!319 (_2!2458 (ite (or c!44179 c!44177) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))))

(declare-fun b!260273 () Bool)

(assert (=> b!260273 (= e!168671 (contains!1873 (toList!1914 lt!131185) (ite (or c!44179 c!44177) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(assert (= (and d!62381 res!127191) b!260272))

(assert (= (and b!260272 res!127190) b!260273))

(declare-fun m!275545 () Bool)

(assert (=> d!62381 m!275545))

(declare-fun m!275547 () Bool)

(assert (=> d!62381 m!275547))

(declare-fun m!275549 () Bool)

(assert (=> d!62381 m!275549))

(declare-fun m!275551 () Bool)

(assert (=> d!62381 m!275551))

(declare-fun m!275553 () Bool)

(assert (=> b!260272 m!275553))

(declare-fun m!275555 () Bool)

(assert (=> b!260273 m!275555))

(assert (=> bm!24784 d!62381))

(declare-fun b!260286 () Bool)

(declare-fun e!168678 () SeekEntryResult!1177)

(declare-fun e!168680 () SeekEntryResult!1177)

(assert (=> b!260286 (= e!168678 e!168680)))

(declare-fun c!44235 () Bool)

(declare-fun lt!131191 () (_ BitVec 64))

(assert (=> b!260286 (= c!44235 (= lt!131191 key!932))))

(declare-fun b!260287 () Bool)

(assert (=> b!260287 (= e!168680 (Found!1177 (index!6880 lt!131082)))))

(declare-fun b!260288 () Bool)

(assert (=> b!260288 (= e!168678 Undefined!1177)))

(declare-fun b!260289 () Bool)

(declare-fun e!168679 () SeekEntryResult!1177)

(assert (=> b!260289 (= e!168679 (MissingVacant!1177 (index!6880 lt!131082)))))

(declare-fun b!260290 () Bool)

(declare-fun c!44233 () Bool)

(assert (=> b!260290 (= c!44233 (= lt!131191 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260290 (= e!168680 e!168679)))

(declare-fun b!260291 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!260291 (= e!168679 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25114 lt!131082) #b00000000000000000000000000000001) (nextIndex!0 (index!6880 lt!131082) (x!25114 lt!131082) (mask!11119 thiss!1504)) (index!6880 lt!131082) key!932 (_keys!6973 thiss!1504) (mask!11119 thiss!1504)))))

(declare-fun lt!131190 () SeekEntryResult!1177)

(declare-fun d!62383 () Bool)

(assert (=> d!62383 (and (or ((_ is Undefined!1177) lt!131190) (not ((_ is Found!1177) lt!131190)) (and (bvsge (index!6879 lt!131190) #b00000000000000000000000000000000) (bvslt (index!6879 lt!131190) (size!6306 (_keys!6973 thiss!1504))))) (or ((_ is Undefined!1177) lt!131190) ((_ is Found!1177) lt!131190) (not ((_ is MissingVacant!1177) lt!131190)) (not (= (index!6881 lt!131190) (index!6880 lt!131082))) (and (bvsge (index!6881 lt!131190) #b00000000000000000000000000000000) (bvslt (index!6881 lt!131190) (size!6306 (_keys!6973 thiss!1504))))) (or ((_ is Undefined!1177) lt!131190) (ite ((_ is Found!1177) lt!131190) (= (select (arr!5956 (_keys!6973 thiss!1504)) (index!6879 lt!131190)) key!932) (and ((_ is MissingVacant!1177) lt!131190) (= (index!6881 lt!131190) (index!6880 lt!131082)) (= (select (arr!5956 (_keys!6973 thiss!1504)) (index!6881 lt!131190)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!62383 (= lt!131190 e!168678)))

(declare-fun c!44234 () Bool)

(assert (=> d!62383 (= c!44234 (bvsge (x!25114 lt!131082) #b01111111111111111111111111111110))))

(assert (=> d!62383 (= lt!131191 (select (arr!5956 (_keys!6973 thiss!1504)) (index!6880 lt!131082)))))

(assert (=> d!62383 (validMask!0 (mask!11119 thiss!1504))))

(assert (=> d!62383 (= (seekKeyOrZeroReturnVacant!0 (x!25114 lt!131082) (index!6880 lt!131082) (index!6880 lt!131082) key!932 (_keys!6973 thiss!1504) (mask!11119 thiss!1504)) lt!131190)))

(assert (= (and d!62383 c!44234) b!260288))

(assert (= (and d!62383 (not c!44234)) b!260286))

(assert (= (and b!260286 c!44235) b!260287))

(assert (= (and b!260286 (not c!44235)) b!260290))

(assert (= (and b!260290 c!44233) b!260289))

(assert (= (and b!260290 (not c!44233)) b!260291))

(declare-fun m!275557 () Bool)

(assert (=> b!260291 m!275557))

(assert (=> b!260291 m!275557))

(declare-fun m!275559 () Bool)

(assert (=> b!260291 m!275559))

(declare-fun m!275561 () Bool)

(assert (=> d!62383 m!275561))

(declare-fun m!275563 () Bool)

(assert (=> d!62383 m!275563))

(assert (=> d!62383 m!275335))

(assert (=> d!62383 m!275079))

(assert (=> b!260082 d!62383))

(declare-fun b!260302 () Bool)

(declare-fun res!127203 () Bool)

(declare-fun e!168683 () Bool)

(assert (=> b!260302 (=> (not res!127203) (not e!168683))))

(declare-fun size!6311 (LongMapFixedSize!3832) (_ BitVec 32))

(assert (=> b!260302 (= res!127203 (= (size!6311 thiss!1504) (bvadd (_size!1965 thiss!1504) (bvsdiv (bvadd (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!260301 () Bool)

(declare-fun res!127201 () Bool)

(assert (=> b!260301 (=> (not res!127201) (not e!168683))))

(assert (=> b!260301 (= res!127201 (bvsge (size!6311 thiss!1504) (_size!1965 thiss!1504)))))

(declare-fun d!62385 () Bool)

(declare-fun res!127202 () Bool)

(assert (=> d!62385 (=> (not res!127202) (not e!168683))))

(assert (=> d!62385 (= res!127202 (validMask!0 (mask!11119 thiss!1504)))))

(assert (=> d!62385 (= (simpleValid!281 thiss!1504) e!168683)))

(declare-fun b!260300 () Bool)

(declare-fun res!127200 () Bool)

(assert (=> b!260300 (=> (not res!127200) (not e!168683))))

(assert (=> b!260300 (= res!127200 (and (= (size!6305 (_values!4777 thiss!1504)) (bvadd (mask!11119 thiss!1504) #b00000000000000000000000000000001)) (= (size!6306 (_keys!6973 thiss!1504)) (size!6305 (_values!4777 thiss!1504))) (bvsge (_size!1965 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1965 thiss!1504) (bvadd (mask!11119 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!260303 () Bool)

(assert (=> b!260303 (= e!168683 (and (bvsge (extraKeys!4531 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4531 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1965 thiss!1504) #b00000000000000000000000000000000)))))

(assert (= (and d!62385 res!127202) b!260300))

(assert (= (and b!260300 res!127200) b!260301))

(assert (= (and b!260301 res!127201) b!260302))

(assert (= (and b!260302 res!127203) b!260303))

(declare-fun m!275565 () Bool)

(assert (=> b!260302 m!275565))

(assert (=> b!260301 m!275565))

(assert (=> d!62385 m!275079))

(assert (=> d!62307 d!62385))

(declare-fun bm!24814 () Bool)

(declare-fun call!24817 () Bool)

(assert (=> bm!24814 (= call!24817 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6973 thiss!1504) (mask!11119 thiss!1504)))))

(declare-fun b!260304 () Bool)

(declare-fun e!168685 () Bool)

(declare-fun e!168684 () Bool)

(assert (=> b!260304 (= e!168685 e!168684)))

(declare-fun lt!131194 () (_ BitVec 64))

(assert (=> b!260304 (= lt!131194 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131192 () Unit!8037)

(assert (=> b!260304 (= lt!131192 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6973 thiss!1504) lt!131194 #b00000000000000000000000000000000))))

(assert (=> b!260304 (arrayContainsKey!0 (_keys!6973 thiss!1504) lt!131194 #b00000000000000000000000000000000)))

(declare-fun lt!131193 () Unit!8037)

(assert (=> b!260304 (= lt!131193 lt!131192)))

(declare-fun res!127204 () Bool)

(assert (=> b!260304 (= res!127204 (= (seekEntryOrOpen!0 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000) (_keys!6973 thiss!1504) (mask!11119 thiss!1504)) (Found!1177 #b00000000000000000000000000000000)))))

(assert (=> b!260304 (=> (not res!127204) (not e!168684))))

(declare-fun d!62387 () Bool)

(declare-fun res!127205 () Bool)

(declare-fun e!168686 () Bool)

(assert (=> d!62387 (=> res!127205 e!168686)))

(assert (=> d!62387 (= res!127205 (bvsge #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))))))

(assert (=> d!62387 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6973 thiss!1504) (mask!11119 thiss!1504)) e!168686)))

(declare-fun b!260305 () Bool)

(assert (=> b!260305 (= e!168684 call!24817)))

(declare-fun b!260306 () Bool)

(assert (=> b!260306 (= e!168685 call!24817)))

(declare-fun b!260307 () Bool)

(assert (=> b!260307 (= e!168686 e!168685)))

(declare-fun c!44236 () Bool)

(assert (=> b!260307 (= c!44236 (validKeyInArray!0 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!62387 (not res!127205)) b!260307))

(assert (= (and b!260307 c!44236) b!260304))

(assert (= (and b!260307 (not c!44236)) b!260306))

(assert (= (and b!260304 res!127204) b!260305))

(assert (= (or b!260305 b!260306) bm!24814))

(declare-fun m!275567 () Bool)

(assert (=> bm!24814 m!275567))

(assert (=> b!260304 m!275269))

(declare-fun m!275569 () Bool)

(assert (=> b!260304 m!275569))

(declare-fun m!275571 () Bool)

(assert (=> b!260304 m!275571))

(assert (=> b!260304 m!275269))

(declare-fun m!275573 () Bool)

(assert (=> b!260304 m!275573))

(assert (=> b!260307 m!275269))

(assert (=> b!260307 m!275269))

(assert (=> b!260307 m!275289))

(assert (=> b!260095 d!62387))

(declare-fun b!260332 () Bool)

(declare-fun res!127217 () Bool)

(declare-fun e!168707 () Bool)

(assert (=> b!260332 (=> (not res!127217) (not e!168707))))

(declare-fun lt!131209 () ListLongMap!3797)

(assert (=> b!260332 (= res!127217 (not (contains!1870 lt!131209 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!260333 () Bool)

(declare-fun lt!131215 () Unit!8037)

(declare-fun lt!131212 () Unit!8037)

(assert (=> b!260333 (= lt!131215 lt!131212)))

(declare-fun lt!131211 () (_ BitVec 64))

(declare-fun lt!131210 () ListLongMap!3797)

(declare-fun lt!131213 () (_ BitVec 64))

(declare-fun lt!131214 () V!8473)

(assert (=> b!260333 (not (contains!1870 (+!701 lt!131210 (tuple2!4895 lt!131211 lt!131214)) lt!131213))))

(declare-fun addStillNotContains!128 (ListLongMap!3797 (_ BitVec 64) V!8473 (_ BitVec 64)) Unit!8037)

(assert (=> b!260333 (= lt!131212 (addStillNotContains!128 lt!131210 lt!131211 lt!131214 lt!131213))))

(assert (=> b!260333 (= lt!131213 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!260333 (= lt!131214 (get!3065 (select (arr!5955 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!592 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260333 (= lt!131211 (select (arr!5956 lt!130908) #b00000000000000000000000000000000))))

(declare-fun call!24820 () ListLongMap!3797)

(assert (=> b!260333 (= lt!131210 call!24820)))

(declare-fun e!168705 () ListLongMap!3797)

(assert (=> b!260333 (= e!168705 (+!701 call!24820 (tuple2!4895 (select (arr!5956 lt!130908) #b00000000000000000000000000000000) (get!3065 (select (arr!5955 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!592 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!260334 () Bool)

(declare-fun e!168706 () Bool)

(assert (=> b!260334 (= e!168706 (validKeyInArray!0 (select (arr!5956 lt!130908) #b00000000000000000000000000000000)))))

(assert (=> b!260334 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!260335 () Bool)

(declare-fun e!168701 () Bool)

(declare-fun isEmpty!540 (ListLongMap!3797) Bool)

(assert (=> b!260335 (= e!168701 (isEmpty!540 lt!131209))))

(declare-fun b!260336 () Bool)

(declare-fun e!168704 () ListLongMap!3797)

(assert (=> b!260336 (= e!168704 e!168705)))

(declare-fun c!44245 () Bool)

(assert (=> b!260336 (= c!44245 (validKeyInArray!0 (select (arr!5956 lt!130908) #b00000000000000000000000000000000)))))

(declare-fun d!62389 () Bool)

(assert (=> d!62389 e!168707))

(declare-fun res!127216 () Bool)

(assert (=> d!62389 (=> (not res!127216) (not e!168707))))

(assert (=> d!62389 (= res!127216 (not (contains!1870 lt!131209 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62389 (= lt!131209 e!168704)))

(declare-fun c!44246 () Bool)

(assert (=> d!62389 (= c!44246 (bvsge #b00000000000000000000000000000000 (size!6306 lt!130908)))))

(assert (=> d!62389 (validMask!0 (mask!11119 thiss!1504))))

(assert (=> d!62389 (= (getCurrentListMapNoExtraKeys!574 lt!130908 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) lt!131209)))

(declare-fun b!260337 () Bool)

(assert (=> b!260337 (= e!168704 (ListLongMap!3798 Nil!3789))))

(declare-fun b!260338 () Bool)

(declare-fun e!168703 () Bool)

(assert (=> b!260338 (= e!168703 e!168701)))

(declare-fun c!44248 () Bool)

(assert (=> b!260338 (= c!44248 (bvslt #b00000000000000000000000000000000 (size!6306 lt!130908)))))

(declare-fun b!260339 () Bool)

(assert (=> b!260339 (= e!168707 e!168703)))

(declare-fun c!44247 () Bool)

(assert (=> b!260339 (= c!44247 e!168706)))

(declare-fun res!127214 () Bool)

(assert (=> b!260339 (=> (not res!127214) (not e!168706))))

(assert (=> b!260339 (= res!127214 (bvslt #b00000000000000000000000000000000 (size!6306 lt!130908)))))

(declare-fun b!260340 () Bool)

(assert (=> b!260340 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6306 lt!130908)))))

(assert (=> b!260340 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6305 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))))))))

(declare-fun e!168702 () Bool)

(assert (=> b!260340 (= e!168702 (= (apply!258 lt!131209 (select (arr!5956 lt!130908) #b00000000000000000000000000000000)) (get!3065 (select (arr!5955 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!592 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!260341 () Bool)

(assert (=> b!260341 (= e!168705 call!24820)))

(declare-fun b!260342 () Bool)

(assert (=> b!260342 (= e!168703 e!168702)))

(assert (=> b!260342 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6306 lt!130908)))))

(declare-fun res!127215 () Bool)

(assert (=> b!260342 (= res!127215 (contains!1870 lt!131209 (select (arr!5956 lt!130908) #b00000000000000000000000000000000)))))

(assert (=> b!260342 (=> (not res!127215) (not e!168702))))

(declare-fun b!260343 () Bool)

(assert (=> b!260343 (= e!168701 (= lt!131209 (getCurrentListMapNoExtraKeys!574 lt!130908 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4794 thiss!1504))))))

(declare-fun bm!24817 () Bool)

(assert (=> bm!24817 (= call!24820 (getCurrentListMapNoExtraKeys!574 lt!130908 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4794 thiss!1504)))))

(assert (= (and d!62389 c!44246) b!260337))

(assert (= (and d!62389 (not c!44246)) b!260336))

(assert (= (and b!260336 c!44245) b!260333))

(assert (= (and b!260336 (not c!44245)) b!260341))

(assert (= (or b!260333 b!260341) bm!24817))

(assert (= (and d!62389 res!127216) b!260332))

(assert (= (and b!260332 res!127217) b!260339))

(assert (= (and b!260339 res!127214) b!260334))

(assert (= (and b!260339 c!44247) b!260342))

(assert (= (and b!260339 (not c!44247)) b!260338))

(assert (= (and b!260342 res!127215) b!260340))

(assert (= (and b!260338 c!44248) b!260343))

(assert (= (and b!260338 (not c!44248)) b!260335))

(declare-fun b_lambda!8249 () Bool)

(assert (=> (not b_lambda!8249) (not b!260333)))

(assert (=> b!260333 t!8859))

(declare-fun b_and!13847 () Bool)

(assert (= b_and!13845 (and (=> t!8859 result!5401) b_and!13847)))

(declare-fun b_lambda!8251 () Bool)

(assert (=> (not b_lambda!8251) (not b!260340)))

(assert (=> b!260340 t!8859))

(declare-fun b_and!13849 () Bool)

(assert (= b_and!13847 (and (=> t!8859 result!5401) b_and!13849)))

(declare-fun m!275575 () Bool)

(assert (=> b!260332 m!275575))

(declare-fun m!275577 () Bool)

(assert (=> bm!24817 m!275577))

(declare-fun m!275579 () Bool)

(assert (=> b!260335 m!275579))

(declare-fun m!275581 () Bool)

(assert (=> d!62389 m!275581))

(assert (=> d!62389 m!275079))

(assert (=> b!260340 m!275423))

(assert (=> b!260340 m!275423))

(assert (=> b!260340 m!275277))

(assert (=> b!260340 m!275425))

(assert (=> b!260340 m!275393))

(declare-fun m!275583 () Bool)

(assert (=> b!260340 m!275583))

(assert (=> b!260340 m!275393))

(assert (=> b!260340 m!275277))

(assert (=> b!260342 m!275393))

(assert (=> b!260342 m!275393))

(declare-fun m!275585 () Bool)

(assert (=> b!260342 m!275585))

(assert (=> b!260333 m!275423))

(assert (=> b!260333 m!275423))

(assert (=> b!260333 m!275277))

(assert (=> b!260333 m!275425))

(assert (=> b!260333 m!275393))

(assert (=> b!260333 m!275277))

(declare-fun m!275587 () Bool)

(assert (=> b!260333 m!275587))

(declare-fun m!275589 () Bool)

(assert (=> b!260333 m!275589))

(assert (=> b!260333 m!275589))

(declare-fun m!275591 () Bool)

(assert (=> b!260333 m!275591))

(declare-fun m!275593 () Bool)

(assert (=> b!260333 m!275593))

(assert (=> b!260343 m!275577))

(assert (=> b!260336 m!275393))

(assert (=> b!260336 m!275393))

(assert (=> b!260336 m!275401))

(assert (=> b!260334 m!275393))

(assert (=> b!260334 m!275393))

(assert (=> b!260334 m!275401))

(assert (=> bm!24800 d!62389))

(declare-fun d!62391 () Bool)

(declare-fun res!127218 () Bool)

(declare-fun e!168708 () Bool)

(assert (=> d!62391 (=> res!127218 e!168708)))

(assert (=> d!62391 (= res!127218 (= (select (arr!5956 lt!130908) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62391 (= (arrayContainsKey!0 lt!130908 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!168708)))

(declare-fun b!260344 () Bool)

(declare-fun e!168709 () Bool)

(assert (=> b!260344 (= e!168708 e!168709)))

(declare-fun res!127219 () Bool)

(assert (=> b!260344 (=> (not res!127219) (not e!168709))))

(assert (=> b!260344 (= res!127219 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6306 lt!130908)))))

(declare-fun b!260345 () Bool)

(assert (=> b!260345 (= e!168709 (arrayContainsKey!0 lt!130908 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62391 (not res!127218)) b!260344))

(assert (= (and b!260344 res!127219) b!260345))

(assert (=> d!62391 m!275531))

(declare-fun m!275595 () Bool)

(assert (=> b!260345 m!275595))

(assert (=> b!260235 d!62391))

(declare-fun bm!24818 () Bool)

(declare-fun call!24821 () Bool)

(assert (=> bm!24818 (= call!24821 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!130908 (mask!11119 thiss!1504)))))

(declare-fun b!260346 () Bool)

(declare-fun e!168711 () Bool)

(declare-fun e!168710 () Bool)

(assert (=> b!260346 (= e!168711 e!168710)))

(declare-fun lt!131218 () (_ BitVec 64))

(assert (=> b!260346 (= lt!131218 (select (arr!5956 lt!130908) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!131216 () Unit!8037)

(assert (=> b!260346 (= lt!131216 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130908 lt!131218 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!260346 (arrayContainsKey!0 lt!130908 lt!131218 #b00000000000000000000000000000000)))

(declare-fun lt!131217 () Unit!8037)

(assert (=> b!260346 (= lt!131217 lt!131216)))

(declare-fun res!127220 () Bool)

(assert (=> b!260346 (= res!127220 (= (seekEntryOrOpen!0 (select (arr!5956 lt!130908) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!130908 (mask!11119 thiss!1504)) (Found!1177 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!260346 (=> (not res!127220) (not e!168710))))

(declare-fun d!62393 () Bool)

(declare-fun res!127221 () Bool)

(declare-fun e!168712 () Bool)

(assert (=> d!62393 (=> res!127221 e!168712)))

(assert (=> d!62393 (= res!127221 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6306 lt!130908)))))

(assert (=> d!62393 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!130908 (mask!11119 thiss!1504)) e!168712)))

(declare-fun b!260347 () Bool)

(assert (=> b!260347 (= e!168710 call!24821)))

(declare-fun b!260348 () Bool)

(assert (=> b!260348 (= e!168711 call!24821)))

(declare-fun b!260349 () Bool)

(assert (=> b!260349 (= e!168712 e!168711)))

(declare-fun c!44249 () Bool)

(assert (=> b!260349 (= c!44249 (validKeyInArray!0 (select (arr!5956 lt!130908) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!62393 (not res!127221)) b!260349))

(assert (= (and b!260349 c!44249) b!260346))

(assert (= (and b!260349 (not c!44249)) b!260348))

(assert (= (and b!260346 res!127220) b!260347))

(assert (= (or b!260347 b!260348) bm!24818))

(declare-fun m!275597 () Bool)

(assert (=> bm!24818 m!275597))

(assert (=> b!260346 m!275531))

(declare-fun m!275599 () Bool)

(assert (=> b!260346 m!275599))

(declare-fun m!275601 () Bool)

(assert (=> b!260346 m!275601))

(assert (=> b!260346 m!275531))

(declare-fun m!275603 () Bool)

(assert (=> b!260346 m!275603))

(assert (=> b!260349 m!275531))

(assert (=> b!260349 m!275531))

(assert (=> b!260349 m!275533))

(assert (=> bm!24795 d!62393))

(declare-fun b!260350 () Bool)

(declare-fun res!127225 () Bool)

(declare-fun e!168719 () Bool)

(assert (=> b!260350 (=> (not res!127225) (not e!168719))))

(declare-fun lt!131219 () ListLongMap!3797)

(assert (=> b!260350 (= res!127225 (not (contains!1870 lt!131219 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!260351 () Bool)

(declare-fun lt!131225 () Unit!8037)

(declare-fun lt!131222 () Unit!8037)

(assert (=> b!260351 (= lt!131225 lt!131222)))

(declare-fun lt!131220 () ListLongMap!3797)

(declare-fun lt!131223 () (_ BitVec 64))

(declare-fun lt!131221 () (_ BitVec 64))

(declare-fun lt!131224 () V!8473)

(assert (=> b!260351 (not (contains!1870 (+!701 lt!131220 (tuple2!4895 lt!131221 lt!131224)) lt!131223))))

(assert (=> b!260351 (= lt!131222 (addStillNotContains!128 lt!131220 lt!131221 lt!131224 lt!131223))))

(assert (=> b!260351 (= lt!131223 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!260351 (= lt!131224 (get!3065 (select (arr!5955 (_values!4777 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!592 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260351 (= lt!131221 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!24822 () ListLongMap!3797)

(assert (=> b!260351 (= lt!131220 call!24822)))

(declare-fun e!168717 () ListLongMap!3797)

(assert (=> b!260351 (= e!168717 (+!701 call!24822 (tuple2!4895 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000) (get!3065 (select (arr!5955 (_values!4777 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!592 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!260352 () Bool)

(declare-fun e!168718 () Bool)

(assert (=> b!260352 (= e!168718 (validKeyInArray!0 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!260352 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!260353 () Bool)

(declare-fun e!168713 () Bool)

(assert (=> b!260353 (= e!168713 (isEmpty!540 lt!131219))))

(declare-fun b!260354 () Bool)

(declare-fun e!168716 () ListLongMap!3797)

(assert (=> b!260354 (= e!168716 e!168717)))

(declare-fun c!44250 () Bool)

(assert (=> b!260354 (= c!44250 (validKeyInArray!0 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!62395 () Bool)

(assert (=> d!62395 e!168719))

(declare-fun res!127224 () Bool)

(assert (=> d!62395 (=> (not res!127224) (not e!168719))))

(assert (=> d!62395 (= res!127224 (not (contains!1870 lt!131219 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62395 (= lt!131219 e!168716)))

(declare-fun c!44251 () Bool)

(assert (=> d!62395 (= c!44251 (bvsge #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))))))

(assert (=> d!62395 (validMask!0 (mask!11119 thiss!1504))))

(assert (=> d!62395 (= (getCurrentListMapNoExtraKeys!574 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) lt!131219)))

(declare-fun b!260355 () Bool)

(assert (=> b!260355 (= e!168716 (ListLongMap!3798 Nil!3789))))

(declare-fun b!260356 () Bool)

(declare-fun e!168715 () Bool)

(assert (=> b!260356 (= e!168715 e!168713)))

(declare-fun c!44253 () Bool)

(assert (=> b!260356 (= c!44253 (bvslt #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))))))

(declare-fun b!260357 () Bool)

(assert (=> b!260357 (= e!168719 e!168715)))

(declare-fun c!44252 () Bool)

(assert (=> b!260357 (= c!44252 e!168718)))

(declare-fun res!127222 () Bool)

(assert (=> b!260357 (=> (not res!127222) (not e!168718))))

(assert (=> b!260357 (= res!127222 (bvslt #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))))))

(declare-fun b!260358 () Bool)

(assert (=> b!260358 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))))))

(assert (=> b!260358 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6305 (_values!4777 thiss!1504))))))

(declare-fun e!168714 () Bool)

(assert (=> b!260358 (= e!168714 (= (apply!258 lt!131219 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)) (get!3065 (select (arr!5955 (_values!4777 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!592 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!260359 () Bool)

(assert (=> b!260359 (= e!168717 call!24822)))

(declare-fun b!260360 () Bool)

(assert (=> b!260360 (= e!168715 e!168714)))

(assert (=> b!260360 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))))))

(declare-fun res!127223 () Bool)

(assert (=> b!260360 (= res!127223 (contains!1870 lt!131219 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!260360 (=> (not res!127223) (not e!168714))))

(declare-fun b!260361 () Bool)

(assert (=> b!260361 (= e!168713 (= lt!131219 (getCurrentListMapNoExtraKeys!574 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4794 thiss!1504))))))

(declare-fun bm!24819 () Bool)

(assert (=> bm!24819 (= call!24822 (getCurrentListMapNoExtraKeys!574 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4794 thiss!1504)))))

(assert (= (and d!62395 c!44251) b!260355))

(assert (= (and d!62395 (not c!44251)) b!260354))

(assert (= (and b!260354 c!44250) b!260351))

(assert (= (and b!260354 (not c!44250)) b!260359))

(assert (= (or b!260351 b!260359) bm!24819))

(assert (= (and d!62395 res!127224) b!260350))

(assert (= (and b!260350 res!127225) b!260357))

(assert (= (and b!260357 res!127222) b!260352))

(assert (= (and b!260357 c!44252) b!260360))

(assert (= (and b!260357 (not c!44252)) b!260356))

(assert (= (and b!260360 res!127223) b!260358))

(assert (= (and b!260356 c!44253) b!260361))

(assert (= (and b!260356 (not c!44253)) b!260353))

(declare-fun b_lambda!8253 () Bool)

(assert (=> (not b_lambda!8253) (not b!260351)))

(assert (=> b!260351 t!8859))

(declare-fun b_and!13851 () Bool)

(assert (= b_and!13849 (and (=> t!8859 result!5401) b_and!13851)))

(declare-fun b_lambda!8255 () Bool)

(assert (=> (not b_lambda!8255) (not b!260358)))

(assert (=> b!260358 t!8859))

(declare-fun b_and!13853 () Bool)

(assert (= b_and!13851 (and (=> t!8859 result!5401) b_and!13853)))

(declare-fun m!275605 () Bool)

(assert (=> b!260350 m!275605))

(declare-fun m!275607 () Bool)

(assert (=> bm!24819 m!275607))

(declare-fun m!275609 () Bool)

(assert (=> b!260353 m!275609))

(declare-fun m!275611 () Bool)

(assert (=> d!62395 m!275611))

(assert (=> d!62395 m!275079))

(assert (=> b!260358 m!275275))

(assert (=> b!260358 m!275275))

(assert (=> b!260358 m!275277))

(assert (=> b!260358 m!275279))

(assert (=> b!260358 m!275269))

(declare-fun m!275613 () Bool)

(assert (=> b!260358 m!275613))

(assert (=> b!260358 m!275269))

(assert (=> b!260358 m!275277))

(assert (=> b!260360 m!275269))

(assert (=> b!260360 m!275269))

(declare-fun m!275615 () Bool)

(assert (=> b!260360 m!275615))

(assert (=> b!260351 m!275275))

(assert (=> b!260351 m!275275))

(assert (=> b!260351 m!275277))

(assert (=> b!260351 m!275279))

(assert (=> b!260351 m!275269))

(assert (=> b!260351 m!275277))

(declare-fun m!275617 () Bool)

(assert (=> b!260351 m!275617))

(declare-fun m!275619 () Bool)

(assert (=> b!260351 m!275619))

(assert (=> b!260351 m!275619))

(declare-fun m!275621 () Bool)

(assert (=> b!260351 m!275621))

(declare-fun m!275623 () Bool)

(assert (=> b!260351 m!275623))

(assert (=> b!260361 m!275607))

(assert (=> b!260354 m!275269))

(assert (=> b!260354 m!275269))

(assert (=> b!260354 m!275289))

(assert (=> b!260352 m!275269))

(assert (=> b!260352 m!275269))

(assert (=> b!260352 m!275289))

(assert (=> bm!24780 d!62395))

(declare-fun d!62397 () Bool)

(assert (=> d!62397 (isDefined!256 (getValueByKey!314 (toList!1914 lt!130910) key!932))))

(declare-fun lt!131228 () Unit!8037)

(declare-fun choose!1275 (List!3792 (_ BitVec 64)) Unit!8037)

(assert (=> d!62397 (= lt!131228 (choose!1275 (toList!1914 lt!130910) key!932))))

(declare-fun e!168722 () Bool)

(assert (=> d!62397 e!168722))

(declare-fun res!127228 () Bool)

(assert (=> d!62397 (=> (not res!127228) (not e!168722))))

(declare-fun isStrictlySorted!370 (List!3792) Bool)

(assert (=> d!62397 (= res!127228 (isStrictlySorted!370 (toList!1914 lt!130910)))))

(assert (=> d!62397 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!255 (toList!1914 lt!130910) key!932) lt!131228)))

(declare-fun b!260364 () Bool)

(assert (=> b!260364 (= e!168722 (containsKey!306 (toList!1914 lt!130910) key!932))))

(assert (= (and d!62397 res!127228) b!260364))

(assert (=> d!62397 m!275261))

(assert (=> d!62397 m!275261))

(assert (=> d!62397 m!275263))

(declare-fun m!275625 () Bool)

(assert (=> d!62397 m!275625))

(declare-fun m!275627 () Bool)

(assert (=> d!62397 m!275627))

(assert (=> b!260364 m!275257))

(assert (=> b!260002 d!62397))

(declare-fun d!62399 () Bool)

(declare-fun isEmpty!541 (Option!320) Bool)

(assert (=> d!62399 (= (isDefined!256 (getValueByKey!314 (toList!1914 lt!130910) key!932)) (not (isEmpty!541 (getValueByKey!314 (toList!1914 lt!130910) key!932))))))

(declare-fun bs!9143 () Bool)

(assert (= bs!9143 d!62399))

(assert (=> bs!9143 m!275261))

(declare-fun m!275629 () Bool)

(assert (=> bs!9143 m!275629))

(assert (=> b!260002 d!62399))

(declare-fun b!260375 () Bool)

(declare-fun e!168728 () Option!320)

(assert (=> b!260375 (= e!168728 (getValueByKey!314 (t!8852 (toList!1914 lt!130910)) key!932))))

(declare-fun b!260373 () Bool)

(declare-fun e!168727 () Option!320)

(assert (=> b!260373 (= e!168727 (Some!319 (_2!2458 (h!4452 (toList!1914 lt!130910)))))))

(declare-fun d!62401 () Bool)

(declare-fun c!44258 () Bool)

(assert (=> d!62401 (= c!44258 (and ((_ is Cons!3788) (toList!1914 lt!130910)) (= (_1!2458 (h!4452 (toList!1914 lt!130910))) key!932)))))

(assert (=> d!62401 (= (getValueByKey!314 (toList!1914 lt!130910) key!932) e!168727)))

(declare-fun b!260374 () Bool)

(assert (=> b!260374 (= e!168727 e!168728)))

(declare-fun c!44259 () Bool)

(assert (=> b!260374 (= c!44259 (and ((_ is Cons!3788) (toList!1914 lt!130910)) (not (= (_1!2458 (h!4452 (toList!1914 lt!130910))) key!932))))))

(declare-fun b!260376 () Bool)

(assert (=> b!260376 (= e!168728 None!318)))

(assert (= (and d!62401 c!44258) b!260373))

(assert (= (and d!62401 (not c!44258)) b!260374))

(assert (= (and b!260374 c!44259) b!260375))

(assert (= (and b!260374 (not c!44259)) b!260376))

(declare-fun m!275631 () Bool)

(assert (=> b!260375 m!275631))

(assert (=> b!260002 d!62401))

(declare-fun b!260379 () Bool)

(declare-fun e!168730 () Option!320)

(assert (=> b!260379 (= e!168730 (getValueByKey!314 (t!8852 (toList!1914 lt!131118)) (_1!2458 (tuple2!4895 key!932 v!346))))))

(declare-fun b!260377 () Bool)

(declare-fun e!168729 () Option!320)

(assert (=> b!260377 (= e!168729 (Some!319 (_2!2458 (h!4452 (toList!1914 lt!131118)))))))

(declare-fun c!44260 () Bool)

(declare-fun d!62403 () Bool)

(assert (=> d!62403 (= c!44260 (and ((_ is Cons!3788) (toList!1914 lt!131118)) (= (_1!2458 (h!4452 (toList!1914 lt!131118))) (_1!2458 (tuple2!4895 key!932 v!346)))))))

(assert (=> d!62403 (= (getValueByKey!314 (toList!1914 lt!131118) (_1!2458 (tuple2!4895 key!932 v!346))) e!168729)))

(declare-fun b!260378 () Bool)

(assert (=> b!260378 (= e!168729 e!168730)))

(declare-fun c!44261 () Bool)

(assert (=> b!260378 (= c!44261 (and ((_ is Cons!3788) (toList!1914 lt!131118)) (not (= (_1!2458 (h!4452 (toList!1914 lt!131118))) (_1!2458 (tuple2!4895 key!932 v!346))))))))

(declare-fun b!260380 () Bool)

(assert (=> b!260380 (= e!168730 None!318)))

(assert (= (and d!62403 c!44260) b!260377))

(assert (= (and d!62403 (not c!44260)) b!260378))

(assert (= (and b!260378 c!44261) b!260379))

(assert (= (and b!260378 (not c!44261)) b!260380))

(declare-fun m!275633 () Bool)

(assert (=> b!260379 m!275633))

(assert (=> b!260146 d!62403))

(assert (=> b!260004 d!62399))

(assert (=> b!260004 d!62401))

(declare-fun b!260381 () Bool)

(declare-fun e!168731 () Bool)

(declare-fun e!168732 () Bool)

(assert (=> b!260381 (= e!168731 e!168732)))

(declare-fun res!127229 () Bool)

(assert (=> b!260381 (=> (not res!127229) (not e!168732))))

(declare-fun e!168734 () Bool)

(assert (=> b!260381 (= res!127229 (not e!168734))))

(declare-fun res!127231 () Bool)

(assert (=> b!260381 (=> (not res!127231) (not e!168734))))

(assert (=> b!260381 (= res!127231 (validKeyInArray!0 (select (arr!5956 lt!130908) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!260382 () Bool)

(declare-fun e!168733 () Bool)

(declare-fun call!24823 () Bool)

(assert (=> b!260382 (= e!168733 call!24823)))

(declare-fun d!62405 () Bool)

(declare-fun res!127230 () Bool)

(assert (=> d!62405 (=> res!127230 e!168731)))

(assert (=> d!62405 (= res!127230 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6306 lt!130908)))))

(assert (=> d!62405 (= (arrayNoDuplicates!0 lt!130908 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44216 (Cons!3789 (select (arr!5956 lt!130908) #b00000000000000000000000000000000) Nil!3790) Nil!3790)) e!168731)))

(declare-fun b!260383 () Bool)

(assert (=> b!260383 (= e!168732 e!168733)))

(declare-fun c!44262 () Bool)

(assert (=> b!260383 (= c!44262 (validKeyInArray!0 (select (arr!5956 lt!130908) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!24820 () Bool)

(assert (=> bm!24820 (= call!24823 (arrayNoDuplicates!0 lt!130908 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!44262 (Cons!3789 (select (arr!5956 lt!130908) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44216 (Cons!3789 (select (arr!5956 lt!130908) #b00000000000000000000000000000000) Nil!3790) Nil!3790)) (ite c!44216 (Cons!3789 (select (arr!5956 lt!130908) #b00000000000000000000000000000000) Nil!3790) Nil!3790))))))

(declare-fun b!260384 () Bool)

(assert (=> b!260384 (= e!168734 (contains!1874 (ite c!44216 (Cons!3789 (select (arr!5956 lt!130908) #b00000000000000000000000000000000) Nil!3790) Nil!3790) (select (arr!5956 lt!130908) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!260385 () Bool)

(assert (=> b!260385 (= e!168733 call!24823)))

(assert (= (and d!62405 (not res!127230)) b!260381))

(assert (= (and b!260381 res!127231) b!260384))

(assert (= (and b!260381 res!127229) b!260383))

(assert (= (and b!260383 c!44262) b!260382))

(assert (= (and b!260383 (not c!44262)) b!260385))

(assert (= (or b!260382 b!260385) bm!24820))

(assert (=> b!260381 m!275531))

(assert (=> b!260381 m!275531))

(assert (=> b!260381 m!275533))

(assert (=> b!260383 m!275531))

(assert (=> b!260383 m!275531))

(assert (=> b!260383 m!275533))

(assert (=> bm!24820 m!275531))

(declare-fun m!275635 () Bool)

(assert (=> bm!24820 m!275635))

(assert (=> b!260384 m!275531))

(assert (=> b!260384 m!275531))

(declare-fun m!275637 () Bool)

(assert (=> b!260384 m!275637))

(assert (=> bm!24809 d!62405))

(assert (=> bm!24792 d!62345))

(declare-fun d!62407 () Bool)

(declare-fun lt!131231 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!172 (List!3793) (InoxSet (_ BitVec 64)))

(assert (=> d!62407 (= lt!131231 (select (content!172 Nil!3790) (select (arr!5956 lt!130908) #b00000000000000000000000000000000)))))

(declare-fun e!168740 () Bool)

(assert (=> d!62407 (= lt!131231 e!168740)))

(declare-fun res!127237 () Bool)

(assert (=> d!62407 (=> (not res!127237) (not e!168740))))

(assert (=> d!62407 (= res!127237 ((_ is Cons!3789) Nil!3790))))

(assert (=> d!62407 (= (contains!1874 Nil!3790 (select (arr!5956 lt!130908) #b00000000000000000000000000000000)) lt!131231)))

(declare-fun b!260390 () Bool)

(declare-fun e!168739 () Bool)

(assert (=> b!260390 (= e!168740 e!168739)))

(declare-fun res!127236 () Bool)

(assert (=> b!260390 (=> res!127236 e!168739)))

(assert (=> b!260390 (= res!127236 (= (h!4453 Nil!3790) (select (arr!5956 lt!130908) #b00000000000000000000000000000000)))))

(declare-fun b!260391 () Bool)

(assert (=> b!260391 (= e!168739 (contains!1874 (t!8853 Nil!3790) (select (arr!5956 lt!130908) #b00000000000000000000000000000000)))))

(assert (= (and d!62407 res!127237) b!260390))

(assert (= (and b!260390 (not res!127236)) b!260391))

(declare-fun m!275639 () Bool)

(assert (=> d!62407 m!275639))

(assert (=> d!62407 m!275393))

(declare-fun m!275641 () Bool)

(assert (=> d!62407 m!275641))

(assert (=> b!260391 m!275393))

(declare-fun m!275643 () Bool)

(assert (=> b!260391 m!275643))

(assert (=> b!260219 d!62407))

(declare-fun d!62409 () Bool)

(declare-fun lt!131234 () Bool)

(declare-fun content!173 (List!3792) (InoxSet tuple2!4894))

(assert (=> d!62409 (= lt!131234 (select (content!173 (toList!1914 lt!131118)) (tuple2!4895 key!932 v!346)))))

(declare-fun e!168745 () Bool)

(assert (=> d!62409 (= lt!131234 e!168745)))

(declare-fun res!127243 () Bool)

(assert (=> d!62409 (=> (not res!127243) (not e!168745))))

(assert (=> d!62409 (= res!127243 ((_ is Cons!3788) (toList!1914 lt!131118)))))

(assert (=> d!62409 (= (contains!1873 (toList!1914 lt!131118) (tuple2!4895 key!932 v!346)) lt!131234)))

(declare-fun b!260396 () Bool)

(declare-fun e!168746 () Bool)

(assert (=> b!260396 (= e!168745 e!168746)))

(declare-fun res!127242 () Bool)

(assert (=> b!260396 (=> res!127242 e!168746)))

(assert (=> b!260396 (= res!127242 (= (h!4452 (toList!1914 lt!131118)) (tuple2!4895 key!932 v!346)))))

(declare-fun b!260397 () Bool)

(assert (=> b!260397 (= e!168746 (contains!1873 (t!8852 (toList!1914 lt!131118)) (tuple2!4895 key!932 v!346)))))

(assert (= (and d!62409 res!127243) b!260396))

(assert (= (and b!260396 (not res!127242)) b!260397))

(declare-fun m!275645 () Bool)

(assert (=> d!62409 m!275645))

(declare-fun m!275647 () Bool)

(assert (=> d!62409 m!275647))

(declare-fun m!275649 () Bool)

(assert (=> b!260397 m!275649))

(assert (=> b!260147 d!62409))

(declare-fun d!62411 () Bool)

(assert (=> d!62411 (= (apply!258 (+!701 lt!131145 (tuple2!4895 lt!131139 (zeroValue!4635 thiss!1504))) lt!131138) (apply!258 lt!131145 lt!131138))))

(declare-fun lt!131237 () Unit!8037)

(declare-fun choose!1276 (ListLongMap!3797 (_ BitVec 64) V!8473 (_ BitVec 64)) Unit!8037)

(assert (=> d!62411 (= lt!131237 (choose!1276 lt!131145 lt!131139 (zeroValue!4635 thiss!1504) lt!131138))))

(declare-fun e!168749 () Bool)

(assert (=> d!62411 e!168749))

(declare-fun res!127246 () Bool)

(assert (=> d!62411 (=> (not res!127246) (not e!168749))))

(assert (=> d!62411 (= res!127246 (contains!1870 lt!131145 lt!131138))))

(assert (=> d!62411 (= (addApplyDifferent!234 lt!131145 lt!131139 (zeroValue!4635 thiss!1504) lt!131138) lt!131237)))

(declare-fun b!260401 () Bool)

(assert (=> b!260401 (= e!168749 (not (= lt!131138 lt!131139)))))

(assert (= (and d!62411 res!127246) b!260401))

(assert (=> d!62411 m!275451))

(declare-fun m!275651 () Bool)

(assert (=> d!62411 m!275651))

(declare-fun m!275653 () Bool)

(assert (=> d!62411 m!275653))

(assert (=> d!62411 m!275459))

(assert (=> d!62411 m!275451))

(assert (=> d!62411 m!275453))

(assert (=> b!260189 d!62411))

(declare-fun d!62413 () Bool)

(assert (=> d!62413 (= (apply!258 (+!701 lt!131147 (tuple2!4895 lt!131141 (minValue!4635 thiss!1504))) lt!131152) (get!3066 (getValueByKey!314 (toList!1914 (+!701 lt!131147 (tuple2!4895 lt!131141 (minValue!4635 thiss!1504)))) lt!131152)))))

(declare-fun bs!9144 () Bool)

(assert (= bs!9144 d!62413))

(declare-fun m!275655 () Bool)

(assert (=> bs!9144 m!275655))

(assert (=> bs!9144 m!275655))

(declare-fun m!275657 () Bool)

(assert (=> bs!9144 m!275657))

(assert (=> b!260189 d!62413))

(declare-fun d!62415 () Bool)

(assert (=> d!62415 (= (apply!258 (+!701 lt!131145 (tuple2!4895 lt!131139 (zeroValue!4635 thiss!1504))) lt!131138) (get!3066 (getValueByKey!314 (toList!1914 (+!701 lt!131145 (tuple2!4895 lt!131139 (zeroValue!4635 thiss!1504)))) lt!131138)))))

(declare-fun bs!9145 () Bool)

(assert (= bs!9145 d!62415))

(declare-fun m!275659 () Bool)

(assert (=> bs!9145 m!275659))

(assert (=> bs!9145 m!275659))

(declare-fun m!275661 () Bool)

(assert (=> bs!9145 m!275661))

(assert (=> b!260189 d!62415))

(declare-fun d!62417 () Bool)

(declare-fun e!168750 () Bool)

(assert (=> d!62417 e!168750))

(declare-fun res!127248 () Bool)

(assert (=> d!62417 (=> (not res!127248) (not e!168750))))

(declare-fun lt!131241 () ListLongMap!3797)

(assert (=> d!62417 (= res!127248 (contains!1870 lt!131241 (_1!2458 (tuple2!4895 lt!131146 (zeroValue!4635 thiss!1504)))))))

(declare-fun lt!131239 () List!3792)

(assert (=> d!62417 (= lt!131241 (ListLongMap!3798 lt!131239))))

(declare-fun lt!131238 () Unit!8037)

(declare-fun lt!131240 () Unit!8037)

(assert (=> d!62417 (= lt!131238 lt!131240)))

(assert (=> d!62417 (= (getValueByKey!314 lt!131239 (_1!2458 (tuple2!4895 lt!131146 (zeroValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 lt!131146 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62417 (= lt!131240 (lemmaContainsTupThenGetReturnValue!173 lt!131239 (_1!2458 (tuple2!4895 lt!131146 (zeroValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 lt!131146 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62417 (= lt!131239 (insertStrictlySorted!176 (toList!1914 lt!131140) (_1!2458 (tuple2!4895 lt!131146 (zeroValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 lt!131146 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62417 (= (+!701 lt!131140 (tuple2!4895 lt!131146 (zeroValue!4635 thiss!1504))) lt!131241)))

(declare-fun b!260402 () Bool)

(declare-fun res!127247 () Bool)

(assert (=> b!260402 (=> (not res!127247) (not e!168750))))

(assert (=> b!260402 (= res!127247 (= (getValueByKey!314 (toList!1914 lt!131241) (_1!2458 (tuple2!4895 lt!131146 (zeroValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 lt!131146 (zeroValue!4635 thiss!1504))))))))

(declare-fun b!260403 () Bool)

(assert (=> b!260403 (= e!168750 (contains!1873 (toList!1914 lt!131241) (tuple2!4895 lt!131146 (zeroValue!4635 thiss!1504))))))

(assert (= (and d!62417 res!127248) b!260402))

(assert (= (and b!260402 res!127247) b!260403))

(declare-fun m!275663 () Bool)

(assert (=> d!62417 m!275663))

(declare-fun m!275665 () Bool)

(assert (=> d!62417 m!275665))

(declare-fun m!275667 () Bool)

(assert (=> d!62417 m!275667))

(declare-fun m!275669 () Bool)

(assert (=> d!62417 m!275669))

(declare-fun m!275671 () Bool)

(assert (=> b!260402 m!275671))

(declare-fun m!275673 () Bool)

(assert (=> b!260403 m!275673))

(assert (=> b!260189 d!62417))

(declare-fun d!62419 () Bool)

(declare-fun e!168751 () Bool)

(assert (=> d!62419 e!168751))

(declare-fun res!127250 () Bool)

(assert (=> d!62419 (=> (not res!127250) (not e!168751))))

(declare-fun lt!131245 () ListLongMap!3797)

(assert (=> d!62419 (= res!127250 (contains!1870 lt!131245 (_1!2458 (tuple2!4895 lt!131143 (minValue!4635 thiss!1504)))))))

(declare-fun lt!131243 () List!3792)

(assert (=> d!62419 (= lt!131245 (ListLongMap!3798 lt!131243))))

(declare-fun lt!131242 () Unit!8037)

(declare-fun lt!131244 () Unit!8037)

(assert (=> d!62419 (= lt!131242 lt!131244)))

(assert (=> d!62419 (= (getValueByKey!314 lt!131243 (_1!2458 (tuple2!4895 lt!131143 (minValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 lt!131143 (minValue!4635 thiss!1504)))))))

(assert (=> d!62419 (= lt!131244 (lemmaContainsTupThenGetReturnValue!173 lt!131243 (_1!2458 (tuple2!4895 lt!131143 (minValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 lt!131143 (minValue!4635 thiss!1504)))))))

(assert (=> d!62419 (= lt!131243 (insertStrictlySorted!176 (toList!1914 lt!131151) (_1!2458 (tuple2!4895 lt!131143 (minValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 lt!131143 (minValue!4635 thiss!1504)))))))

(assert (=> d!62419 (= (+!701 lt!131151 (tuple2!4895 lt!131143 (minValue!4635 thiss!1504))) lt!131245)))

(declare-fun b!260404 () Bool)

(declare-fun res!127249 () Bool)

(assert (=> b!260404 (=> (not res!127249) (not e!168751))))

(assert (=> b!260404 (= res!127249 (= (getValueByKey!314 (toList!1914 lt!131245) (_1!2458 (tuple2!4895 lt!131143 (minValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 lt!131143 (minValue!4635 thiss!1504))))))))

(declare-fun b!260405 () Bool)

(assert (=> b!260405 (= e!168751 (contains!1873 (toList!1914 lt!131245) (tuple2!4895 lt!131143 (minValue!4635 thiss!1504))))))

(assert (= (and d!62419 res!127250) b!260404))

(assert (= (and b!260404 res!127249) b!260405))

(declare-fun m!275675 () Bool)

(assert (=> d!62419 m!275675))

(declare-fun m!275677 () Bool)

(assert (=> d!62419 m!275677))

(declare-fun m!275679 () Bool)

(assert (=> d!62419 m!275679))

(declare-fun m!275681 () Bool)

(assert (=> d!62419 m!275681))

(declare-fun m!275683 () Bool)

(assert (=> b!260404 m!275683))

(declare-fun m!275685 () Bool)

(assert (=> b!260405 m!275685))

(assert (=> b!260189 d!62419))

(declare-fun d!62421 () Bool)

(declare-fun e!168752 () Bool)

(assert (=> d!62421 e!168752))

(declare-fun res!127251 () Bool)

(assert (=> d!62421 (=> res!127251 e!168752)))

(declare-fun lt!131246 () Bool)

(assert (=> d!62421 (= res!127251 (not lt!131246))))

(declare-fun lt!131249 () Bool)

(assert (=> d!62421 (= lt!131246 lt!131249)))

(declare-fun lt!131248 () Unit!8037)

(declare-fun e!168753 () Unit!8037)

(assert (=> d!62421 (= lt!131248 e!168753)))

(declare-fun c!44263 () Bool)

(assert (=> d!62421 (= c!44263 lt!131249)))

(assert (=> d!62421 (= lt!131249 (containsKey!306 (toList!1914 (+!701 lt!131140 (tuple2!4895 lt!131146 (zeroValue!4635 thiss!1504)))) lt!131144))))

(assert (=> d!62421 (= (contains!1870 (+!701 lt!131140 (tuple2!4895 lt!131146 (zeroValue!4635 thiss!1504))) lt!131144) lt!131246)))

(declare-fun b!260406 () Bool)

(declare-fun lt!131247 () Unit!8037)

(assert (=> b!260406 (= e!168753 lt!131247)))

(assert (=> b!260406 (= lt!131247 (lemmaContainsKeyImpliesGetValueByKeyDefined!255 (toList!1914 (+!701 lt!131140 (tuple2!4895 lt!131146 (zeroValue!4635 thiss!1504)))) lt!131144))))

(assert (=> b!260406 (isDefined!256 (getValueByKey!314 (toList!1914 (+!701 lt!131140 (tuple2!4895 lt!131146 (zeroValue!4635 thiss!1504)))) lt!131144))))

(declare-fun b!260407 () Bool)

(declare-fun Unit!8055 () Unit!8037)

(assert (=> b!260407 (= e!168753 Unit!8055)))

(declare-fun b!260408 () Bool)

(assert (=> b!260408 (= e!168752 (isDefined!256 (getValueByKey!314 (toList!1914 (+!701 lt!131140 (tuple2!4895 lt!131146 (zeroValue!4635 thiss!1504)))) lt!131144)))))

(assert (= (and d!62421 c!44263) b!260406))

(assert (= (and d!62421 (not c!44263)) b!260407))

(assert (= (and d!62421 (not res!127251)) b!260408))

(declare-fun m!275687 () Bool)

(assert (=> d!62421 m!275687))

(declare-fun m!275689 () Bool)

(assert (=> b!260406 m!275689))

(declare-fun m!275691 () Bool)

(assert (=> b!260406 m!275691))

(assert (=> b!260406 m!275691))

(declare-fun m!275693 () Bool)

(assert (=> b!260406 m!275693))

(assert (=> b!260408 m!275691))

(assert (=> b!260408 m!275691))

(assert (=> b!260408 m!275693))

(assert (=> b!260189 d!62421))

(declare-fun d!62423 () Bool)

(assert (=> d!62423 (contains!1870 (+!701 lt!131140 (tuple2!4895 lt!131146 (zeroValue!4635 thiss!1504))) lt!131144)))

(declare-fun lt!131252 () Unit!8037)

(declare-fun choose!1277 (ListLongMap!3797 (_ BitVec 64) V!8473 (_ BitVec 64)) Unit!8037)

(assert (=> d!62423 (= lt!131252 (choose!1277 lt!131140 lt!131146 (zeroValue!4635 thiss!1504) lt!131144))))

(assert (=> d!62423 (contains!1870 lt!131140 lt!131144)))

(assert (=> d!62423 (= (addStillContains!234 lt!131140 lt!131146 (zeroValue!4635 thiss!1504) lt!131144) lt!131252)))

(declare-fun bs!9146 () Bool)

(assert (= bs!9146 d!62423))

(assert (=> bs!9146 m!275445))

(assert (=> bs!9146 m!275445))

(assert (=> bs!9146 m!275447))

(declare-fun m!275695 () Bool)

(assert (=> bs!9146 m!275695))

(declare-fun m!275697 () Bool)

(assert (=> bs!9146 m!275697))

(assert (=> b!260189 d!62423))

(declare-fun d!62425 () Bool)

(assert (=> d!62425 (= (apply!258 lt!131147 lt!131152) (get!3066 (getValueByKey!314 (toList!1914 lt!131147) lt!131152)))))

(declare-fun bs!9147 () Bool)

(assert (= bs!9147 d!62425))

(declare-fun m!275699 () Bool)

(assert (=> bs!9147 m!275699))

(assert (=> bs!9147 m!275699))

(declare-fun m!275701 () Bool)

(assert (=> bs!9147 m!275701))

(assert (=> b!260189 d!62425))

(declare-fun d!62427 () Bool)

(assert (=> d!62427 (= (apply!258 (+!701 lt!131147 (tuple2!4895 lt!131141 (minValue!4635 thiss!1504))) lt!131152) (apply!258 lt!131147 lt!131152))))

(declare-fun lt!131253 () Unit!8037)

(assert (=> d!62427 (= lt!131253 (choose!1276 lt!131147 lt!131141 (minValue!4635 thiss!1504) lt!131152))))

(declare-fun e!168754 () Bool)

(assert (=> d!62427 e!168754))

(declare-fun res!127252 () Bool)

(assert (=> d!62427 (=> (not res!127252) (not e!168754))))

(assert (=> d!62427 (= res!127252 (contains!1870 lt!131147 lt!131152))))

(assert (=> d!62427 (= (addApplyDifferent!234 lt!131147 lt!131141 (minValue!4635 thiss!1504) lt!131152) lt!131253)))

(declare-fun b!260410 () Bool)

(assert (=> b!260410 (= e!168754 (not (= lt!131152 lt!131141)))))

(assert (= (and d!62427 res!127252) b!260410))

(assert (=> d!62427 m!275439))

(declare-fun m!275703 () Bool)

(assert (=> d!62427 m!275703))

(declare-fun m!275705 () Bool)

(assert (=> d!62427 m!275705))

(assert (=> d!62427 m!275449))

(assert (=> d!62427 m!275439))

(assert (=> d!62427 m!275441))

(assert (=> b!260189 d!62427))

(declare-fun d!62429 () Bool)

(declare-fun e!168755 () Bool)

(assert (=> d!62429 e!168755))

(declare-fun res!127254 () Bool)

(assert (=> d!62429 (=> (not res!127254) (not e!168755))))

(declare-fun lt!131257 () ListLongMap!3797)

(assert (=> d!62429 (= res!127254 (contains!1870 lt!131257 (_1!2458 (tuple2!4895 lt!131139 (zeroValue!4635 thiss!1504)))))))

(declare-fun lt!131255 () List!3792)

(assert (=> d!62429 (= lt!131257 (ListLongMap!3798 lt!131255))))

(declare-fun lt!131254 () Unit!8037)

(declare-fun lt!131256 () Unit!8037)

(assert (=> d!62429 (= lt!131254 lt!131256)))

(assert (=> d!62429 (= (getValueByKey!314 lt!131255 (_1!2458 (tuple2!4895 lt!131139 (zeroValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 lt!131139 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62429 (= lt!131256 (lemmaContainsTupThenGetReturnValue!173 lt!131255 (_1!2458 (tuple2!4895 lt!131139 (zeroValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 lt!131139 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62429 (= lt!131255 (insertStrictlySorted!176 (toList!1914 lt!131145) (_1!2458 (tuple2!4895 lt!131139 (zeroValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 lt!131139 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62429 (= (+!701 lt!131145 (tuple2!4895 lt!131139 (zeroValue!4635 thiss!1504))) lt!131257)))

(declare-fun b!260411 () Bool)

(declare-fun res!127253 () Bool)

(assert (=> b!260411 (=> (not res!127253) (not e!168755))))

(assert (=> b!260411 (= res!127253 (= (getValueByKey!314 (toList!1914 lt!131257) (_1!2458 (tuple2!4895 lt!131139 (zeroValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 lt!131139 (zeroValue!4635 thiss!1504))))))))

(declare-fun b!260412 () Bool)

(assert (=> b!260412 (= e!168755 (contains!1873 (toList!1914 lt!131257) (tuple2!4895 lt!131139 (zeroValue!4635 thiss!1504))))))

(assert (= (and d!62429 res!127254) b!260411))

(assert (= (and b!260411 res!127253) b!260412))

(declare-fun m!275707 () Bool)

(assert (=> d!62429 m!275707))

(declare-fun m!275709 () Bool)

(assert (=> d!62429 m!275709))

(declare-fun m!275711 () Bool)

(assert (=> d!62429 m!275711))

(declare-fun m!275713 () Bool)

(assert (=> d!62429 m!275713))

(declare-fun m!275715 () Bool)

(assert (=> b!260411 m!275715))

(declare-fun m!275717 () Bool)

(assert (=> b!260412 m!275717))

(assert (=> b!260189 d!62429))

(declare-fun d!62431 () Bool)

(assert (=> d!62431 (= (apply!258 (+!701 lt!131151 (tuple2!4895 lt!131143 (minValue!4635 thiss!1504))) lt!131153) (apply!258 lt!131151 lt!131153))))

(declare-fun lt!131258 () Unit!8037)

(assert (=> d!62431 (= lt!131258 (choose!1276 lt!131151 lt!131143 (minValue!4635 thiss!1504) lt!131153))))

(declare-fun e!168756 () Bool)

(assert (=> d!62431 e!168756))

(declare-fun res!127255 () Bool)

(assert (=> d!62431 (=> (not res!127255) (not e!168756))))

(assert (=> d!62431 (= res!127255 (contains!1870 lt!131151 lt!131153))))

(assert (=> d!62431 (= (addApplyDifferent!234 lt!131151 lt!131143 (minValue!4635 thiss!1504) lt!131153) lt!131258)))

(declare-fun b!260413 () Bool)

(assert (=> b!260413 (= e!168756 (not (= lt!131153 lt!131143)))))

(assert (= (and d!62431 res!127255) b!260413))

(assert (=> d!62431 m!275435))

(declare-fun m!275719 () Bool)

(assert (=> d!62431 m!275719))

(declare-fun m!275721 () Bool)

(assert (=> d!62431 m!275721))

(assert (=> d!62431 m!275455))

(assert (=> d!62431 m!275435))

(assert (=> d!62431 m!275463))

(assert (=> b!260189 d!62431))

(declare-fun d!62433 () Bool)

(assert (=> d!62433 (= (apply!258 (+!701 lt!131151 (tuple2!4895 lt!131143 (minValue!4635 thiss!1504))) lt!131153) (get!3066 (getValueByKey!314 (toList!1914 (+!701 lt!131151 (tuple2!4895 lt!131143 (minValue!4635 thiss!1504)))) lt!131153)))))

(declare-fun bs!9148 () Bool)

(assert (= bs!9148 d!62433))

(declare-fun m!275723 () Bool)

(assert (=> bs!9148 m!275723))

(assert (=> bs!9148 m!275723))

(declare-fun m!275725 () Bool)

(assert (=> bs!9148 m!275725))

(assert (=> b!260189 d!62433))

(assert (=> b!260189 d!62389))

(declare-fun d!62435 () Bool)

(assert (=> d!62435 (= (apply!258 lt!131145 lt!131138) (get!3066 (getValueByKey!314 (toList!1914 lt!131145) lt!131138)))))

(declare-fun bs!9149 () Bool)

(assert (= bs!9149 d!62435))

(declare-fun m!275727 () Bool)

(assert (=> bs!9149 m!275727))

(assert (=> bs!9149 m!275727))

(declare-fun m!275729 () Bool)

(assert (=> bs!9149 m!275729))

(assert (=> b!260189 d!62435))

(declare-fun d!62437 () Bool)

(declare-fun e!168757 () Bool)

(assert (=> d!62437 e!168757))

(declare-fun res!127257 () Bool)

(assert (=> d!62437 (=> (not res!127257) (not e!168757))))

(declare-fun lt!131262 () ListLongMap!3797)

(assert (=> d!62437 (= res!127257 (contains!1870 lt!131262 (_1!2458 (tuple2!4895 lt!131141 (minValue!4635 thiss!1504)))))))

(declare-fun lt!131260 () List!3792)

(assert (=> d!62437 (= lt!131262 (ListLongMap!3798 lt!131260))))

(declare-fun lt!131259 () Unit!8037)

(declare-fun lt!131261 () Unit!8037)

(assert (=> d!62437 (= lt!131259 lt!131261)))

(assert (=> d!62437 (= (getValueByKey!314 lt!131260 (_1!2458 (tuple2!4895 lt!131141 (minValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 lt!131141 (minValue!4635 thiss!1504)))))))

(assert (=> d!62437 (= lt!131261 (lemmaContainsTupThenGetReturnValue!173 lt!131260 (_1!2458 (tuple2!4895 lt!131141 (minValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 lt!131141 (minValue!4635 thiss!1504)))))))

(assert (=> d!62437 (= lt!131260 (insertStrictlySorted!176 (toList!1914 lt!131147) (_1!2458 (tuple2!4895 lt!131141 (minValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 lt!131141 (minValue!4635 thiss!1504)))))))

(assert (=> d!62437 (= (+!701 lt!131147 (tuple2!4895 lt!131141 (minValue!4635 thiss!1504))) lt!131262)))

(declare-fun b!260414 () Bool)

(declare-fun res!127256 () Bool)

(assert (=> b!260414 (=> (not res!127256) (not e!168757))))

(assert (=> b!260414 (= res!127256 (= (getValueByKey!314 (toList!1914 lt!131262) (_1!2458 (tuple2!4895 lt!131141 (minValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 lt!131141 (minValue!4635 thiss!1504))))))))

(declare-fun b!260415 () Bool)

(assert (=> b!260415 (= e!168757 (contains!1873 (toList!1914 lt!131262) (tuple2!4895 lt!131141 (minValue!4635 thiss!1504))))))

(assert (= (and d!62437 res!127257) b!260414))

(assert (= (and b!260414 res!127256) b!260415))

(declare-fun m!275731 () Bool)

(assert (=> d!62437 m!275731))

(declare-fun m!275733 () Bool)

(assert (=> d!62437 m!275733))

(declare-fun m!275735 () Bool)

(assert (=> d!62437 m!275735))

(declare-fun m!275737 () Bool)

(assert (=> d!62437 m!275737))

(declare-fun m!275739 () Bool)

(assert (=> b!260414 m!275739))

(declare-fun m!275741 () Bool)

(assert (=> b!260415 m!275741))

(assert (=> b!260189 d!62437))

(declare-fun d!62439 () Bool)

(assert (=> d!62439 (= (apply!258 lt!131151 lt!131153) (get!3066 (getValueByKey!314 (toList!1914 lt!131151) lt!131153)))))

(declare-fun bs!9150 () Bool)

(assert (= bs!9150 d!62439))

(declare-fun m!275743 () Bool)

(assert (=> bs!9150 m!275743))

(assert (=> bs!9150 m!275743))

(declare-fun m!275745 () Bool)

(assert (=> bs!9150 m!275745))

(assert (=> b!260189 d!62439))

(assert (=> b!260055 d!62361))

(declare-fun d!62441 () Bool)

(declare-fun e!168758 () Bool)

(assert (=> d!62441 e!168758))

(declare-fun res!127258 () Bool)

(assert (=> d!62441 (=> res!127258 e!168758)))

(declare-fun lt!131263 () Bool)

(assert (=> d!62441 (= res!127258 (not lt!131263))))

(declare-fun lt!131266 () Bool)

(assert (=> d!62441 (= lt!131263 lt!131266)))

(declare-fun lt!131265 () Unit!8037)

(declare-fun e!168759 () Unit!8037)

(assert (=> d!62441 (= lt!131265 e!168759)))

(declare-fun c!44264 () Bool)

(assert (=> d!62441 (= c!44264 lt!131266)))

(assert (=> d!62441 (= lt!131266 (containsKey!306 (toList!1914 lt!131059) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62441 (= (contains!1870 lt!131059 #b1000000000000000000000000000000000000000000000000000000000000000) lt!131263)))

(declare-fun b!260416 () Bool)

(declare-fun lt!131264 () Unit!8037)

(assert (=> b!260416 (= e!168759 lt!131264)))

(assert (=> b!260416 (= lt!131264 (lemmaContainsKeyImpliesGetValueByKeyDefined!255 (toList!1914 lt!131059) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260416 (isDefined!256 (getValueByKey!314 (toList!1914 lt!131059) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260417 () Bool)

(declare-fun Unit!8056 () Unit!8037)

(assert (=> b!260417 (= e!168759 Unit!8056)))

(declare-fun b!260418 () Bool)

(assert (=> b!260418 (= e!168758 (isDefined!256 (getValueByKey!314 (toList!1914 lt!131059) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62441 c!44264) b!260416))

(assert (= (and d!62441 (not c!44264)) b!260417))

(assert (= (and d!62441 (not res!127258)) b!260418))

(declare-fun m!275747 () Bool)

(assert (=> d!62441 m!275747))

(declare-fun m!275749 () Bool)

(assert (=> b!260416 m!275749))

(assert (=> b!260416 m!275541))

(assert (=> b!260416 m!275541))

(declare-fun m!275751 () Bool)

(assert (=> b!260416 m!275751))

(assert (=> b!260418 m!275541))

(assert (=> b!260418 m!275541))

(assert (=> b!260418 m!275751))

(assert (=> bm!24782 d!62441))

(declare-fun d!62443 () Bool)

(assert (=> d!62443 (= (apply!258 lt!131142 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3066 (getValueByKey!314 (toList!1914 lt!131142) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9151 () Bool)

(assert (= bs!9151 d!62443))

(declare-fun m!275753 () Bool)

(assert (=> bs!9151 m!275753))

(assert (=> bs!9151 m!275753))

(declare-fun m!275755 () Bool)

(assert (=> bs!9151 m!275755))

(assert (=> b!260191 d!62443))

(declare-fun d!62445 () Bool)

(declare-fun res!127263 () Bool)

(declare-fun e!168764 () Bool)

(assert (=> d!62445 (=> res!127263 e!168764)))

(assert (=> d!62445 (= res!127263 (and ((_ is Cons!3788) (toList!1914 lt!130910)) (= (_1!2458 (h!4452 (toList!1914 lt!130910))) key!932)))))

(assert (=> d!62445 (= (containsKey!306 (toList!1914 lt!130910) key!932) e!168764)))

(declare-fun b!260423 () Bool)

(declare-fun e!168765 () Bool)

(assert (=> b!260423 (= e!168764 e!168765)))

(declare-fun res!127264 () Bool)

(assert (=> b!260423 (=> (not res!127264) (not e!168765))))

(assert (=> b!260423 (= res!127264 (and (or (not ((_ is Cons!3788) (toList!1914 lt!130910))) (bvsle (_1!2458 (h!4452 (toList!1914 lt!130910))) key!932)) ((_ is Cons!3788) (toList!1914 lt!130910)) (bvslt (_1!2458 (h!4452 (toList!1914 lt!130910))) key!932)))))

(declare-fun b!260424 () Bool)

(assert (=> b!260424 (= e!168765 (containsKey!306 (t!8852 (toList!1914 lt!130910)) key!932))))

(assert (= (and d!62445 (not res!127263)) b!260423))

(assert (= (and b!260423 res!127264) b!260424))

(declare-fun m!275757 () Bool)

(assert (=> b!260424 m!275757))

(assert (=> d!62301 d!62445))

(declare-fun d!62447 () Bool)

(assert (=> d!62447 (= (apply!258 (+!701 lt!131064 (tuple2!4895 lt!131058 (minValue!4635 thiss!1504))) lt!131069) (apply!258 lt!131064 lt!131069))))

(declare-fun lt!131267 () Unit!8037)

(assert (=> d!62447 (= lt!131267 (choose!1276 lt!131064 lt!131058 (minValue!4635 thiss!1504) lt!131069))))

(declare-fun e!168766 () Bool)

(assert (=> d!62447 e!168766))

(declare-fun res!127265 () Bool)

(assert (=> d!62447 (=> (not res!127265) (not e!168766))))

(assert (=> d!62447 (= res!127265 (contains!1870 lt!131064 lt!131069))))

(assert (=> d!62447 (= (addApplyDifferent!234 lt!131064 lt!131058 (minValue!4635 thiss!1504) lt!131069) lt!131267)))

(declare-fun b!260425 () Bool)

(assert (=> b!260425 (= e!168766 (not (= lt!131069 lt!131058)))))

(assert (= (and d!62447 res!127265) b!260425))

(assert (=> d!62447 m!275295))

(declare-fun m!275759 () Bool)

(assert (=> d!62447 m!275759))

(declare-fun m!275761 () Bool)

(assert (=> d!62447 m!275761))

(assert (=> d!62447 m!275305))

(assert (=> d!62447 m!275295))

(assert (=> d!62447 m!275297))

(assert (=> b!260057 d!62447))

(declare-fun d!62449 () Bool)

(assert (=> d!62449 (= (apply!258 (+!701 lt!131064 (tuple2!4895 lt!131058 (minValue!4635 thiss!1504))) lt!131069) (get!3066 (getValueByKey!314 (toList!1914 (+!701 lt!131064 (tuple2!4895 lt!131058 (minValue!4635 thiss!1504)))) lt!131069)))))

(declare-fun bs!9152 () Bool)

(assert (= bs!9152 d!62449))

(declare-fun m!275763 () Bool)

(assert (=> bs!9152 m!275763))

(assert (=> bs!9152 m!275763))

(declare-fun m!275765 () Bool)

(assert (=> bs!9152 m!275765))

(assert (=> b!260057 d!62449))

(declare-fun d!62451 () Bool)

(assert (=> d!62451 (= (apply!258 (+!701 lt!131062 (tuple2!4895 lt!131056 (zeroValue!4635 thiss!1504))) lt!131055) (apply!258 lt!131062 lt!131055))))

(declare-fun lt!131268 () Unit!8037)

(assert (=> d!62451 (= lt!131268 (choose!1276 lt!131062 lt!131056 (zeroValue!4635 thiss!1504) lt!131055))))

(declare-fun e!168767 () Bool)

(assert (=> d!62451 e!168767))

(declare-fun res!127266 () Bool)

(assert (=> d!62451 (=> (not res!127266) (not e!168767))))

(assert (=> d!62451 (= res!127266 (contains!1870 lt!131062 lt!131055))))

(assert (=> d!62451 (= (addApplyDifferent!234 lt!131062 lt!131056 (zeroValue!4635 thiss!1504) lt!131055) lt!131268)))

(declare-fun b!260426 () Bool)

(assert (=> b!260426 (= e!168767 (not (= lt!131055 lt!131056)))))

(assert (= (and d!62451 res!127266) b!260426))

(assert (=> d!62451 m!275307))

(declare-fun m!275767 () Bool)

(assert (=> d!62451 m!275767))

(declare-fun m!275769 () Bool)

(assert (=> d!62451 m!275769))

(assert (=> d!62451 m!275315))

(assert (=> d!62451 m!275307))

(assert (=> d!62451 m!275309))

(assert (=> b!260057 d!62451))

(declare-fun d!62453 () Bool)

(declare-fun e!168768 () Bool)

(assert (=> d!62453 e!168768))

(declare-fun res!127268 () Bool)

(assert (=> d!62453 (=> (not res!127268) (not e!168768))))

(declare-fun lt!131272 () ListLongMap!3797)

(assert (=> d!62453 (= res!127268 (contains!1870 lt!131272 (_1!2458 (tuple2!4895 lt!131058 (minValue!4635 thiss!1504)))))))

(declare-fun lt!131270 () List!3792)

(assert (=> d!62453 (= lt!131272 (ListLongMap!3798 lt!131270))))

(declare-fun lt!131269 () Unit!8037)

(declare-fun lt!131271 () Unit!8037)

(assert (=> d!62453 (= lt!131269 lt!131271)))

(assert (=> d!62453 (= (getValueByKey!314 lt!131270 (_1!2458 (tuple2!4895 lt!131058 (minValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 lt!131058 (minValue!4635 thiss!1504)))))))

(assert (=> d!62453 (= lt!131271 (lemmaContainsTupThenGetReturnValue!173 lt!131270 (_1!2458 (tuple2!4895 lt!131058 (minValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 lt!131058 (minValue!4635 thiss!1504)))))))

(assert (=> d!62453 (= lt!131270 (insertStrictlySorted!176 (toList!1914 lt!131064) (_1!2458 (tuple2!4895 lt!131058 (minValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 lt!131058 (minValue!4635 thiss!1504)))))))

(assert (=> d!62453 (= (+!701 lt!131064 (tuple2!4895 lt!131058 (minValue!4635 thiss!1504))) lt!131272)))

(declare-fun b!260427 () Bool)

(declare-fun res!127267 () Bool)

(assert (=> b!260427 (=> (not res!127267) (not e!168768))))

(assert (=> b!260427 (= res!127267 (= (getValueByKey!314 (toList!1914 lt!131272) (_1!2458 (tuple2!4895 lt!131058 (minValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 lt!131058 (minValue!4635 thiss!1504))))))))

(declare-fun b!260428 () Bool)

(assert (=> b!260428 (= e!168768 (contains!1873 (toList!1914 lt!131272) (tuple2!4895 lt!131058 (minValue!4635 thiss!1504))))))

(assert (= (and d!62453 res!127268) b!260427))

(assert (= (and b!260427 res!127267) b!260428))

(declare-fun m!275771 () Bool)

(assert (=> d!62453 m!275771))

(declare-fun m!275773 () Bool)

(assert (=> d!62453 m!275773))

(declare-fun m!275775 () Bool)

(assert (=> d!62453 m!275775))

(declare-fun m!275777 () Bool)

(assert (=> d!62453 m!275777))

(declare-fun m!275779 () Bool)

(assert (=> b!260427 m!275779))

(declare-fun m!275781 () Bool)

(assert (=> b!260428 m!275781))

(assert (=> b!260057 d!62453))

(declare-fun d!62455 () Bool)

(assert (=> d!62455 (= (apply!258 (+!701 lt!131062 (tuple2!4895 lt!131056 (zeroValue!4635 thiss!1504))) lt!131055) (get!3066 (getValueByKey!314 (toList!1914 (+!701 lt!131062 (tuple2!4895 lt!131056 (zeroValue!4635 thiss!1504)))) lt!131055)))))

(declare-fun bs!9153 () Bool)

(assert (= bs!9153 d!62455))

(declare-fun m!275783 () Bool)

(assert (=> bs!9153 m!275783))

(assert (=> bs!9153 m!275783))

(declare-fun m!275785 () Bool)

(assert (=> bs!9153 m!275785))

(assert (=> b!260057 d!62455))

(declare-fun d!62457 () Bool)

(declare-fun e!168769 () Bool)

(assert (=> d!62457 e!168769))

(declare-fun res!127269 () Bool)

(assert (=> d!62457 (=> res!127269 e!168769)))

(declare-fun lt!131273 () Bool)

(assert (=> d!62457 (= res!127269 (not lt!131273))))

(declare-fun lt!131276 () Bool)

(assert (=> d!62457 (= lt!131273 lt!131276)))

(declare-fun lt!131275 () Unit!8037)

(declare-fun e!168770 () Unit!8037)

(assert (=> d!62457 (= lt!131275 e!168770)))

(declare-fun c!44265 () Bool)

(assert (=> d!62457 (= c!44265 lt!131276)))

(assert (=> d!62457 (= lt!131276 (containsKey!306 (toList!1914 (+!701 lt!131057 (tuple2!4895 lt!131063 (zeroValue!4635 thiss!1504)))) lt!131061))))

(assert (=> d!62457 (= (contains!1870 (+!701 lt!131057 (tuple2!4895 lt!131063 (zeroValue!4635 thiss!1504))) lt!131061) lt!131273)))

(declare-fun b!260429 () Bool)

(declare-fun lt!131274 () Unit!8037)

(assert (=> b!260429 (= e!168770 lt!131274)))

(assert (=> b!260429 (= lt!131274 (lemmaContainsKeyImpliesGetValueByKeyDefined!255 (toList!1914 (+!701 lt!131057 (tuple2!4895 lt!131063 (zeroValue!4635 thiss!1504)))) lt!131061))))

(assert (=> b!260429 (isDefined!256 (getValueByKey!314 (toList!1914 (+!701 lt!131057 (tuple2!4895 lt!131063 (zeroValue!4635 thiss!1504)))) lt!131061))))

(declare-fun b!260430 () Bool)

(declare-fun Unit!8057 () Unit!8037)

(assert (=> b!260430 (= e!168770 Unit!8057)))

(declare-fun b!260431 () Bool)

(assert (=> b!260431 (= e!168769 (isDefined!256 (getValueByKey!314 (toList!1914 (+!701 lt!131057 (tuple2!4895 lt!131063 (zeroValue!4635 thiss!1504)))) lt!131061)))))

(assert (= (and d!62457 c!44265) b!260429))

(assert (= (and d!62457 (not c!44265)) b!260430))

(assert (= (and d!62457 (not res!127269)) b!260431))

(declare-fun m!275787 () Bool)

(assert (=> d!62457 m!275787))

(declare-fun m!275789 () Bool)

(assert (=> b!260429 m!275789))

(declare-fun m!275791 () Bool)

(assert (=> b!260429 m!275791))

(assert (=> b!260429 m!275791))

(declare-fun m!275793 () Bool)

(assert (=> b!260429 m!275793))

(assert (=> b!260431 m!275791))

(assert (=> b!260431 m!275791))

(assert (=> b!260431 m!275793))

(assert (=> b!260057 d!62457))

(declare-fun d!62459 () Bool)

(assert (=> d!62459 (= (apply!258 lt!131068 lt!131070) (get!3066 (getValueByKey!314 (toList!1914 lt!131068) lt!131070)))))

(declare-fun bs!9154 () Bool)

(assert (= bs!9154 d!62459))

(declare-fun m!275795 () Bool)

(assert (=> bs!9154 m!275795))

(assert (=> bs!9154 m!275795))

(declare-fun m!275797 () Bool)

(assert (=> bs!9154 m!275797))

(assert (=> b!260057 d!62459))

(declare-fun d!62461 () Bool)

(assert (=> d!62461 (= (apply!258 lt!131064 lt!131069) (get!3066 (getValueByKey!314 (toList!1914 lt!131064) lt!131069)))))

(declare-fun bs!9155 () Bool)

(assert (= bs!9155 d!62461))

(declare-fun m!275799 () Bool)

(assert (=> bs!9155 m!275799))

(assert (=> bs!9155 m!275799))

(declare-fun m!275801 () Bool)

(assert (=> bs!9155 m!275801))

(assert (=> b!260057 d!62461))

(declare-fun d!62463 () Bool)

(assert (=> d!62463 (= (apply!258 (+!701 lt!131068 (tuple2!4895 lt!131060 (minValue!4635 thiss!1504))) lt!131070) (apply!258 lt!131068 lt!131070))))

(declare-fun lt!131277 () Unit!8037)

(assert (=> d!62463 (= lt!131277 (choose!1276 lt!131068 lt!131060 (minValue!4635 thiss!1504) lt!131070))))

(declare-fun e!168771 () Bool)

(assert (=> d!62463 e!168771))

(declare-fun res!127270 () Bool)

(assert (=> d!62463 (=> (not res!127270) (not e!168771))))

(assert (=> d!62463 (= res!127270 (contains!1870 lt!131068 lt!131070))))

(assert (=> d!62463 (= (addApplyDifferent!234 lt!131068 lt!131060 (minValue!4635 thiss!1504) lt!131070) lt!131277)))

(declare-fun b!260432 () Bool)

(assert (=> b!260432 (= e!168771 (not (= lt!131070 lt!131060)))))

(assert (= (and d!62463 res!127270) b!260432))

(assert (=> d!62463 m!275291))

(declare-fun m!275803 () Bool)

(assert (=> d!62463 m!275803))

(declare-fun m!275805 () Bool)

(assert (=> d!62463 m!275805))

(assert (=> d!62463 m!275311))

(assert (=> d!62463 m!275291))

(assert (=> d!62463 m!275319))

(assert (=> b!260057 d!62463))

(declare-fun d!62465 () Bool)

(assert (=> d!62465 (contains!1870 (+!701 lt!131057 (tuple2!4895 lt!131063 (zeroValue!4635 thiss!1504))) lt!131061)))

(declare-fun lt!131278 () Unit!8037)

(assert (=> d!62465 (= lt!131278 (choose!1277 lt!131057 lt!131063 (zeroValue!4635 thiss!1504) lt!131061))))

(assert (=> d!62465 (contains!1870 lt!131057 lt!131061)))

(assert (=> d!62465 (= (addStillContains!234 lt!131057 lt!131063 (zeroValue!4635 thiss!1504) lt!131061) lt!131278)))

(declare-fun bs!9156 () Bool)

(assert (= bs!9156 d!62465))

(assert (=> bs!9156 m!275301))

(assert (=> bs!9156 m!275301))

(assert (=> bs!9156 m!275303))

(declare-fun m!275807 () Bool)

(assert (=> bs!9156 m!275807))

(declare-fun m!275809 () Bool)

(assert (=> bs!9156 m!275809))

(assert (=> b!260057 d!62465))

(declare-fun d!62467 () Bool)

(declare-fun e!168772 () Bool)

(assert (=> d!62467 e!168772))

(declare-fun res!127272 () Bool)

(assert (=> d!62467 (=> (not res!127272) (not e!168772))))

(declare-fun lt!131282 () ListLongMap!3797)

(assert (=> d!62467 (= res!127272 (contains!1870 lt!131282 (_1!2458 (tuple2!4895 lt!131060 (minValue!4635 thiss!1504)))))))

(declare-fun lt!131280 () List!3792)

(assert (=> d!62467 (= lt!131282 (ListLongMap!3798 lt!131280))))

(declare-fun lt!131279 () Unit!8037)

(declare-fun lt!131281 () Unit!8037)

(assert (=> d!62467 (= lt!131279 lt!131281)))

(assert (=> d!62467 (= (getValueByKey!314 lt!131280 (_1!2458 (tuple2!4895 lt!131060 (minValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 lt!131060 (minValue!4635 thiss!1504)))))))

(assert (=> d!62467 (= lt!131281 (lemmaContainsTupThenGetReturnValue!173 lt!131280 (_1!2458 (tuple2!4895 lt!131060 (minValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 lt!131060 (minValue!4635 thiss!1504)))))))

(assert (=> d!62467 (= lt!131280 (insertStrictlySorted!176 (toList!1914 lt!131068) (_1!2458 (tuple2!4895 lt!131060 (minValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 lt!131060 (minValue!4635 thiss!1504)))))))

(assert (=> d!62467 (= (+!701 lt!131068 (tuple2!4895 lt!131060 (minValue!4635 thiss!1504))) lt!131282)))

(declare-fun b!260433 () Bool)

(declare-fun res!127271 () Bool)

(assert (=> b!260433 (=> (not res!127271) (not e!168772))))

(assert (=> b!260433 (= res!127271 (= (getValueByKey!314 (toList!1914 lt!131282) (_1!2458 (tuple2!4895 lt!131060 (minValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 lt!131060 (minValue!4635 thiss!1504))))))))

(declare-fun b!260434 () Bool)

(assert (=> b!260434 (= e!168772 (contains!1873 (toList!1914 lt!131282) (tuple2!4895 lt!131060 (minValue!4635 thiss!1504))))))

(assert (= (and d!62467 res!127272) b!260433))

(assert (= (and b!260433 res!127271) b!260434))

(declare-fun m!275811 () Bool)

(assert (=> d!62467 m!275811))

(declare-fun m!275813 () Bool)

(assert (=> d!62467 m!275813))

(declare-fun m!275815 () Bool)

(assert (=> d!62467 m!275815))

(declare-fun m!275817 () Bool)

(assert (=> d!62467 m!275817))

(declare-fun m!275819 () Bool)

(assert (=> b!260433 m!275819))

(declare-fun m!275821 () Bool)

(assert (=> b!260434 m!275821))

(assert (=> b!260057 d!62467))

(declare-fun d!62469 () Bool)

(assert (=> d!62469 (= (apply!258 lt!131062 lt!131055) (get!3066 (getValueByKey!314 (toList!1914 lt!131062) lt!131055)))))

(declare-fun bs!9157 () Bool)

(assert (= bs!9157 d!62469))

(declare-fun m!275823 () Bool)

(assert (=> bs!9157 m!275823))

(assert (=> bs!9157 m!275823))

(declare-fun m!275825 () Bool)

(assert (=> bs!9157 m!275825))

(assert (=> b!260057 d!62469))

(assert (=> b!260057 d!62395))

(declare-fun d!62471 () Bool)

(declare-fun e!168773 () Bool)

(assert (=> d!62471 e!168773))

(declare-fun res!127274 () Bool)

(assert (=> d!62471 (=> (not res!127274) (not e!168773))))

(declare-fun lt!131286 () ListLongMap!3797)

(assert (=> d!62471 (= res!127274 (contains!1870 lt!131286 (_1!2458 (tuple2!4895 lt!131063 (zeroValue!4635 thiss!1504)))))))

(declare-fun lt!131284 () List!3792)

(assert (=> d!62471 (= lt!131286 (ListLongMap!3798 lt!131284))))

(declare-fun lt!131283 () Unit!8037)

(declare-fun lt!131285 () Unit!8037)

(assert (=> d!62471 (= lt!131283 lt!131285)))

(assert (=> d!62471 (= (getValueByKey!314 lt!131284 (_1!2458 (tuple2!4895 lt!131063 (zeroValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 lt!131063 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62471 (= lt!131285 (lemmaContainsTupThenGetReturnValue!173 lt!131284 (_1!2458 (tuple2!4895 lt!131063 (zeroValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 lt!131063 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62471 (= lt!131284 (insertStrictlySorted!176 (toList!1914 lt!131057) (_1!2458 (tuple2!4895 lt!131063 (zeroValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 lt!131063 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62471 (= (+!701 lt!131057 (tuple2!4895 lt!131063 (zeroValue!4635 thiss!1504))) lt!131286)))

(declare-fun b!260435 () Bool)

(declare-fun res!127273 () Bool)

(assert (=> b!260435 (=> (not res!127273) (not e!168773))))

(assert (=> b!260435 (= res!127273 (= (getValueByKey!314 (toList!1914 lt!131286) (_1!2458 (tuple2!4895 lt!131063 (zeroValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 lt!131063 (zeroValue!4635 thiss!1504))))))))

(declare-fun b!260436 () Bool)

(assert (=> b!260436 (= e!168773 (contains!1873 (toList!1914 lt!131286) (tuple2!4895 lt!131063 (zeroValue!4635 thiss!1504))))))

(assert (= (and d!62471 res!127274) b!260435))

(assert (= (and b!260435 res!127273) b!260436))

(declare-fun m!275827 () Bool)

(assert (=> d!62471 m!275827))

(declare-fun m!275829 () Bool)

(assert (=> d!62471 m!275829))

(declare-fun m!275831 () Bool)

(assert (=> d!62471 m!275831))

(declare-fun m!275833 () Bool)

(assert (=> d!62471 m!275833))

(declare-fun m!275835 () Bool)

(assert (=> b!260435 m!275835))

(declare-fun m!275837 () Bool)

(assert (=> b!260436 m!275837))

(assert (=> b!260057 d!62471))

(declare-fun d!62473 () Bool)

(declare-fun e!168774 () Bool)

(assert (=> d!62473 e!168774))

(declare-fun res!127276 () Bool)

(assert (=> d!62473 (=> (not res!127276) (not e!168774))))

(declare-fun lt!131290 () ListLongMap!3797)

(assert (=> d!62473 (= res!127276 (contains!1870 lt!131290 (_1!2458 (tuple2!4895 lt!131056 (zeroValue!4635 thiss!1504)))))))

(declare-fun lt!131288 () List!3792)

(assert (=> d!62473 (= lt!131290 (ListLongMap!3798 lt!131288))))

(declare-fun lt!131287 () Unit!8037)

(declare-fun lt!131289 () Unit!8037)

(assert (=> d!62473 (= lt!131287 lt!131289)))

(assert (=> d!62473 (= (getValueByKey!314 lt!131288 (_1!2458 (tuple2!4895 lt!131056 (zeroValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 lt!131056 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62473 (= lt!131289 (lemmaContainsTupThenGetReturnValue!173 lt!131288 (_1!2458 (tuple2!4895 lt!131056 (zeroValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 lt!131056 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62473 (= lt!131288 (insertStrictlySorted!176 (toList!1914 lt!131062) (_1!2458 (tuple2!4895 lt!131056 (zeroValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 lt!131056 (zeroValue!4635 thiss!1504)))))))

(assert (=> d!62473 (= (+!701 lt!131062 (tuple2!4895 lt!131056 (zeroValue!4635 thiss!1504))) lt!131290)))

(declare-fun b!260437 () Bool)

(declare-fun res!127275 () Bool)

(assert (=> b!260437 (=> (not res!127275) (not e!168774))))

(assert (=> b!260437 (= res!127275 (= (getValueByKey!314 (toList!1914 lt!131290) (_1!2458 (tuple2!4895 lt!131056 (zeroValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 lt!131056 (zeroValue!4635 thiss!1504))))))))

(declare-fun b!260438 () Bool)

(assert (=> b!260438 (= e!168774 (contains!1873 (toList!1914 lt!131290) (tuple2!4895 lt!131056 (zeroValue!4635 thiss!1504))))))

(assert (= (and d!62473 res!127276) b!260437))

(assert (= (and b!260437 res!127275) b!260438))

(declare-fun m!275839 () Bool)

(assert (=> d!62473 m!275839))

(declare-fun m!275841 () Bool)

(assert (=> d!62473 m!275841))

(declare-fun m!275843 () Bool)

(assert (=> d!62473 m!275843))

(declare-fun m!275845 () Bool)

(assert (=> d!62473 m!275845))

(declare-fun m!275847 () Bool)

(assert (=> b!260437 m!275847))

(declare-fun m!275849 () Bool)

(assert (=> b!260438 m!275849))

(assert (=> b!260057 d!62473))

(declare-fun d!62475 () Bool)

(assert (=> d!62475 (= (apply!258 (+!701 lt!131068 (tuple2!4895 lt!131060 (minValue!4635 thiss!1504))) lt!131070) (get!3066 (getValueByKey!314 (toList!1914 (+!701 lt!131068 (tuple2!4895 lt!131060 (minValue!4635 thiss!1504)))) lt!131070)))))

(declare-fun bs!9158 () Bool)

(assert (= bs!9158 d!62475))

(declare-fun m!275851 () Bool)

(assert (=> bs!9158 m!275851))

(assert (=> bs!9158 m!275851))

(declare-fun m!275853 () Bool)

(assert (=> bs!9158 m!275853))

(assert (=> b!260057 d!62475))

(declare-fun d!62477 () Bool)

(assert (=> d!62477 (= (+!701 (getCurrentListMap!1423 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) (tuple2!4895 key!932 v!346)) (getCurrentListMap!1423 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(assert (=> d!62477 true))

(declare-fun _$3!61 () Unit!8037)

(assert (=> d!62477 (= (choose!1274 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) index!297 key!932 v!346 (defaultEntry!4794 thiss!1504)) _$3!61)))

(declare-fun bs!9159 () Bool)

(assert (= bs!9159 d!62477))

(assert (=> bs!9159 m!275373))

(assert (=> bs!9159 m!275099))

(assert (=> bs!9159 m!275083))

(assert (=> bs!9159 m!275123))

(assert (=> bs!9159 m!275375))

(assert (=> bs!9159 m!275123))

(assert (=> d!62323 d!62477))

(assert (=> d!62323 d!62325))

(declare-fun d!62479 () Bool)

(assert (=> d!62479 (= (apply!258 lt!131059 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3066 (getValueByKey!314 (toList!1914 lt!131059) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9160 () Bool)

(assert (= bs!9160 d!62479))

(declare-fun m!275855 () Bool)

(assert (=> bs!9160 m!275855))

(assert (=> bs!9160 m!275855))

(declare-fun m!275857 () Bool)

(assert (=> bs!9160 m!275857))

(assert (=> b!260059 d!62479))

(assert (=> b!260178 d!62367))

(assert (=> d!62311 d!62305))

(declare-fun b!260455 () Bool)

(declare-fun e!168784 () Bool)

(declare-fun e!168786 () Bool)

(assert (=> b!260455 (= e!168784 e!168786)))

(declare-fun c!44270 () Bool)

(declare-fun lt!131293 () SeekEntryResult!1177)

(assert (=> b!260455 (= c!44270 ((_ is MissingVacant!1177) lt!131293))))

(declare-fun b!260456 () Bool)

(assert (=> b!260456 (= e!168786 ((_ is Undefined!1177) lt!131293))))

(declare-fun b!260457 () Bool)

(declare-fun res!127287 () Bool)

(declare-fun e!168785 () Bool)

(assert (=> b!260457 (=> (not res!127287) (not e!168785))))

(declare-fun call!24829 () Bool)

(assert (=> b!260457 (= res!127287 call!24829)))

(assert (=> b!260457 (= e!168786 e!168785)))

(declare-fun d!62481 () Bool)

(assert (=> d!62481 e!168784))

(declare-fun c!44271 () Bool)

(assert (=> d!62481 (= c!44271 ((_ is MissingZero!1177) lt!131293))))

(assert (=> d!62481 (= lt!131293 (seekEntryOrOpen!0 key!932 (_keys!6973 thiss!1504) (mask!11119 thiss!1504)))))

(assert (=> d!62481 true))

(declare-fun _$34!1125 () Unit!8037)

(assert (=> d!62481 (= (choose!1271 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 (defaultEntry!4794 thiss!1504)) _$34!1125)))

(declare-fun b!260458 () Bool)

(declare-fun e!168783 () Bool)

(assert (=> b!260458 (= e!168784 e!168783)))

(declare-fun res!127285 () Bool)

(assert (=> b!260458 (= res!127285 call!24829)))

(assert (=> b!260458 (=> (not res!127285) (not e!168783))))

(declare-fun bm!24825 () Bool)

(declare-fun call!24828 () Bool)

(assert (=> bm!24825 (= call!24828 (arrayContainsKey!0 (_keys!6973 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!260459 () Bool)

(declare-fun res!127288 () Bool)

(assert (=> b!260459 (=> (not res!127288) (not e!168785))))

(assert (=> b!260459 (= res!127288 (= (select (arr!5956 (_keys!6973 thiss!1504)) (index!6881 lt!131293)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260460 () Bool)

(assert (=> b!260460 (= e!168783 (not call!24828))))

(declare-fun b!260461 () Bool)

(declare-fun res!127286 () Bool)

(assert (=> b!260461 (= res!127286 (= (select (arr!5956 (_keys!6973 thiss!1504)) (index!6878 lt!131293)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260461 (=> (not res!127286) (not e!168783))))

(declare-fun b!260462 () Bool)

(assert (=> b!260462 (= e!168785 (not call!24828))))

(declare-fun bm!24826 () Bool)

(assert (=> bm!24826 (= call!24829 (inRange!0 (ite c!44271 (index!6878 lt!131293) (index!6881 lt!131293)) (mask!11119 thiss!1504)))))

(assert (= (and d!62481 c!44271) b!260458))

(assert (= (and d!62481 (not c!44271)) b!260455))

(assert (= (and b!260458 res!127285) b!260461))

(assert (= (and b!260461 res!127286) b!260460))

(assert (= (and b!260455 c!44270) b!260457))

(assert (= (and b!260455 (not c!44270)) b!260456))

(assert (= (and b!260457 res!127287) b!260459))

(assert (= (and b!260459 res!127288) b!260462))

(assert (= (or b!260458 b!260457) bm!24826))

(assert (= (or b!260460 b!260462) bm!24825))

(declare-fun m!275859 () Bool)

(assert (=> b!260461 m!275859))

(assert (=> d!62481 m!275113))

(declare-fun m!275861 () Bool)

(assert (=> bm!24826 m!275861))

(declare-fun m!275863 () Bool)

(assert (=> b!260459 m!275863))

(assert (=> bm!24825 m!275069))

(assert (=> d!62311 d!62481))

(assert (=> d!62311 d!62325))

(declare-fun b!260463 () Bool)

(declare-fun e!168787 () (_ BitVec 32))

(declare-fun call!24830 () (_ BitVec 32))

(assert (=> b!260463 (= e!168787 call!24830)))

(declare-fun b!260464 () Bool)

(declare-fun e!168788 () (_ BitVec 32))

(assert (=> b!260464 (= e!168788 #b00000000000000000000000000000000)))

(declare-fun b!260465 () Bool)

(assert (=> b!260465 (= e!168787 (bvadd #b00000000000000000000000000000001 call!24830))))

(declare-fun b!260466 () Bool)

(assert (=> b!260466 (= e!168788 e!168787)))

(declare-fun c!44272 () Bool)

(assert (=> b!260466 (= c!44272 (validKeyInArray!0 (select (arr!5956 (_keys!6973 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!62483 () Bool)

(declare-fun lt!131294 () (_ BitVec 32))

(assert (=> d!62483 (and (bvsge lt!131294 #b00000000000000000000000000000000) (bvsle lt!131294 (bvsub (size!6306 (_keys!6973 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!62483 (= lt!131294 e!168788)))

(declare-fun c!44273 () Bool)

(assert (=> d!62483 (= c!44273 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6306 (_keys!6973 thiss!1504))))))

(assert (=> d!62483 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6306 (_keys!6973 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6306 (_keys!6973 thiss!1504)) (size!6306 (_keys!6973 thiss!1504))))))

(assert (=> d!62483 (= (arrayCountValidKeys!0 (_keys!6973 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6306 (_keys!6973 thiss!1504))) lt!131294)))

(declare-fun bm!24827 () Bool)

(assert (=> bm!24827 (= call!24830 (arrayCountValidKeys!0 (_keys!6973 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6306 (_keys!6973 thiss!1504))))))

(assert (= (and d!62483 c!44273) b!260464))

(assert (= (and d!62483 (not c!44273)) b!260466))

(assert (= (and b!260466 c!44272) b!260465))

(assert (= (and b!260466 (not c!44272)) b!260463))

(assert (= (or b!260465 b!260463) bm!24827))

(assert (=> b!260466 m!275537))

(assert (=> b!260466 m!275537))

(declare-fun m!275865 () Bool)

(assert (=> b!260466 m!275865))

(declare-fun m!275867 () Bool)

(assert (=> bm!24827 m!275867))

(assert (=> bm!24810 d!62483))

(declare-fun d!62485 () Bool)

(declare-fun e!168789 () Bool)

(assert (=> d!62485 e!168789))

(declare-fun res!127290 () Bool)

(assert (=> d!62485 (=> (not res!127290) (not e!168789))))

(declare-fun lt!131298 () ListLongMap!3797)

(assert (=> d!62485 (= res!127290 (contains!1870 lt!131298 (_1!2458 (tuple2!4895 key!932 v!346))))))

(declare-fun lt!131296 () List!3792)

(assert (=> d!62485 (= lt!131298 (ListLongMap!3798 lt!131296))))

(declare-fun lt!131295 () Unit!8037)

(declare-fun lt!131297 () Unit!8037)

(assert (=> d!62485 (= lt!131295 lt!131297)))

(assert (=> d!62485 (= (getValueByKey!314 lt!131296 (_1!2458 (tuple2!4895 key!932 v!346))) (Some!319 (_2!2458 (tuple2!4895 key!932 v!346))))))

(assert (=> d!62485 (= lt!131297 (lemmaContainsTupThenGetReturnValue!173 lt!131296 (_1!2458 (tuple2!4895 key!932 v!346)) (_2!2458 (tuple2!4895 key!932 v!346))))))

(assert (=> d!62485 (= lt!131296 (insertStrictlySorted!176 (toList!1914 (getCurrentListMap!1423 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504))) (_1!2458 (tuple2!4895 key!932 v!346)) (_2!2458 (tuple2!4895 key!932 v!346))))))

(assert (=> d!62485 (= (+!701 (getCurrentListMap!1423 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) (tuple2!4895 key!932 v!346)) lt!131298)))

(declare-fun b!260467 () Bool)

(declare-fun res!127289 () Bool)

(assert (=> b!260467 (=> (not res!127289) (not e!168789))))

(assert (=> b!260467 (= res!127289 (= (getValueByKey!314 (toList!1914 lt!131298) (_1!2458 (tuple2!4895 key!932 v!346))) (Some!319 (_2!2458 (tuple2!4895 key!932 v!346)))))))

(declare-fun b!260468 () Bool)

(assert (=> b!260468 (= e!168789 (contains!1873 (toList!1914 lt!131298) (tuple2!4895 key!932 v!346)))))

(assert (= (and d!62485 res!127290) b!260467))

(assert (= (and b!260467 res!127289) b!260468))

(declare-fun m!275869 () Bool)

(assert (=> d!62485 m!275869))

(declare-fun m!275871 () Bool)

(assert (=> d!62485 m!275871))

(declare-fun m!275873 () Bool)

(assert (=> d!62485 m!275873))

(declare-fun m!275875 () Bool)

(assert (=> d!62485 m!275875))

(declare-fun m!275877 () Bool)

(assert (=> b!260467 m!275877))

(declare-fun m!275879 () Bool)

(assert (=> b!260468 m!275879))

(assert (=> b!260141 d!62485))

(assert (=> b!260141 d!62303))

(declare-fun e!168801 () Bool)

(declare-fun b!260469 () Bool)

(assert (=> b!260469 (= e!168801 (validKeyInArray!0 (select (arr!5956 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!260470 () Bool)

(declare-fun e!168802 () ListLongMap!3797)

(declare-fun call!24834 () ListLongMap!3797)

(assert (=> b!260470 (= e!168802 call!24834)))

(declare-fun b!260471 () Bool)

(declare-fun res!127297 () Bool)

(declare-fun e!168797 () Bool)

(assert (=> b!260471 (=> (not res!127297) (not e!168797))))

(declare-fun e!168795 () Bool)

(assert (=> b!260471 (= res!127297 e!168795)))

(declare-fun c!44274 () Bool)

(assert (=> b!260471 (= c!44274 (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!260472 () Bool)

(declare-fun e!168793 () Bool)

(assert (=> b!260472 (= e!168797 e!168793)))

(declare-fun c!44279 () Bool)

(assert (=> b!260472 (= c!44279 (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!260473 () Bool)

(declare-fun call!24832 () Bool)

(assert (=> b!260473 (= e!168793 (not call!24832))))

(declare-fun b!260474 () Bool)

(declare-fun e!168791 () Unit!8037)

(declare-fun Unit!8058 () Unit!8037)

(assert (=> b!260474 (= e!168791 Unit!8058)))

(declare-fun bm!24828 () Bool)

(declare-fun call!24833 () ListLongMap!3797)

(assert (=> bm!24828 (= call!24833 (getCurrentListMapNoExtraKeys!574 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun b!260475 () Bool)

(declare-fun e!168800 () Bool)

(assert (=> b!260475 (= e!168795 e!168800)))

(declare-fun res!127296 () Bool)

(declare-fun call!24837 () Bool)

(assert (=> b!260475 (= res!127296 call!24837)))

(assert (=> b!260475 (=> (not res!127296) (not e!168800))))

(declare-fun b!260476 () Bool)

(declare-fun call!24836 () ListLongMap!3797)

(assert (=> b!260476 (= e!168802 call!24836)))

(declare-fun b!260477 () Bool)

(declare-fun e!168796 () Bool)

(assert (=> b!260477 (= e!168796 (validKeyInArray!0 (select (arr!5956 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun bm!24829 () Bool)

(declare-fun call!24831 () ListLongMap!3797)

(assert (=> bm!24829 (= call!24831 call!24833)))

(declare-fun bm!24830 () Bool)

(declare-fun lt!131306 () ListLongMap!3797)

(assert (=> bm!24830 (= call!24832 (contains!1870 lt!131306 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260478 () Bool)

(declare-fun e!168792 () Bool)

(declare-fun e!168799 () Bool)

(assert (=> b!260478 (= e!168792 e!168799)))

(declare-fun res!127293 () Bool)

(assert (=> b!260478 (=> (not res!127293) (not e!168799))))

(assert (=> b!260478 (= res!127293 (contains!1870 lt!131306 (select (arr!5956 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!260478 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6306 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))))))))

(declare-fun b!260479 () Bool)

(declare-fun lt!131314 () Unit!8037)

(assert (=> b!260479 (= e!168791 lt!131314)))

(declare-fun lt!131304 () ListLongMap!3797)

(assert (=> b!260479 (= lt!131304 (getCurrentListMapNoExtraKeys!574 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131310 () (_ BitVec 64))

(assert (=> b!260479 (= lt!131310 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131308 () (_ BitVec 64))

(assert (=> b!260479 (= lt!131308 (select (arr!5956 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131318 () Unit!8037)

(assert (=> b!260479 (= lt!131318 (addStillContains!234 lt!131304 lt!131310 (zeroValue!4635 thiss!1504) lt!131308))))

(assert (=> b!260479 (contains!1870 (+!701 lt!131304 (tuple2!4895 lt!131310 (zeroValue!4635 thiss!1504))) lt!131308)))

(declare-fun lt!131301 () Unit!8037)

(assert (=> b!260479 (= lt!131301 lt!131318)))

(declare-fun lt!131315 () ListLongMap!3797)

(assert (=> b!260479 (= lt!131315 (getCurrentListMapNoExtraKeys!574 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131307 () (_ BitVec 64))

(assert (=> b!260479 (= lt!131307 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131317 () (_ BitVec 64))

(assert (=> b!260479 (= lt!131317 (select (arr!5956 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131300 () Unit!8037)

(assert (=> b!260479 (= lt!131300 (addApplyDifferent!234 lt!131315 lt!131307 (minValue!4635 thiss!1504) lt!131317))))

(assert (=> b!260479 (= (apply!258 (+!701 lt!131315 (tuple2!4895 lt!131307 (minValue!4635 thiss!1504))) lt!131317) (apply!258 lt!131315 lt!131317))))

(declare-fun lt!131299 () Unit!8037)

(assert (=> b!260479 (= lt!131299 lt!131300)))

(declare-fun lt!131309 () ListLongMap!3797)

(assert (=> b!260479 (= lt!131309 (getCurrentListMapNoExtraKeys!574 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131303 () (_ BitVec 64))

(assert (=> b!260479 (= lt!131303 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131302 () (_ BitVec 64))

(assert (=> b!260479 (= lt!131302 (select (arr!5956 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131312 () Unit!8037)

(assert (=> b!260479 (= lt!131312 (addApplyDifferent!234 lt!131309 lt!131303 (zeroValue!4635 thiss!1504) lt!131302))))

(assert (=> b!260479 (= (apply!258 (+!701 lt!131309 (tuple2!4895 lt!131303 (zeroValue!4635 thiss!1504))) lt!131302) (apply!258 lt!131309 lt!131302))))

(declare-fun lt!131319 () Unit!8037)

(assert (=> b!260479 (= lt!131319 lt!131312)))

(declare-fun lt!131311 () ListLongMap!3797)

(assert (=> b!260479 (= lt!131311 (getCurrentListMapNoExtraKeys!574 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)))))

(declare-fun lt!131305 () (_ BitVec 64))

(assert (=> b!260479 (= lt!131305 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131316 () (_ BitVec 64))

(assert (=> b!260479 (= lt!131316 (select (arr!5956 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504)))) #b00000000000000000000000000000000))))

(assert (=> b!260479 (= lt!131314 (addApplyDifferent!234 lt!131311 lt!131305 (minValue!4635 thiss!1504) lt!131316))))

(assert (=> b!260479 (= (apply!258 (+!701 lt!131311 (tuple2!4895 lt!131305 (minValue!4635 thiss!1504))) lt!131316) (apply!258 lt!131311 lt!131316))))

(declare-fun b!260480 () Bool)

(declare-fun e!168790 () Bool)

(assert (=> b!260480 (= e!168793 e!168790)))

(declare-fun res!127291 () Bool)

(assert (=> b!260480 (= res!127291 call!24832)))

(assert (=> b!260480 (=> (not res!127291) (not e!168790))))

(declare-fun b!260481 () Bool)

(assert (=> b!260481 (= e!168800 (= (apply!258 lt!131306 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4635 thiss!1504)))))

(declare-fun b!260482 () Bool)

(declare-fun e!168794 () ListLongMap!3797)

(declare-fun e!168798 () ListLongMap!3797)

(assert (=> b!260482 (= e!168794 e!168798)))

(declare-fun c!44275 () Bool)

(assert (=> b!260482 (= c!44275 (and (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!24831 () Bool)

(assert (=> bm!24831 (= call!24834 call!24831)))

(declare-fun b!260483 () Bool)

(assert (=> b!260483 (= e!168790 (= (apply!258 lt!131306 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4635 thiss!1504)))))

(declare-fun b!260484 () Bool)

(assert (=> b!260484 (= e!168799 (= (apply!258 lt!131306 (select (arr!5956 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504)))) #b00000000000000000000000000000000)) (get!3065 (select (arr!5955 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!592 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260484 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6305 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))))))))

(assert (=> b!260484 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6306 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))))))))

(declare-fun b!260485 () Bool)

(assert (=> b!260485 (= e!168798 call!24836)))

(declare-fun bm!24832 () Bool)

(declare-fun c!44277 () Bool)

(declare-fun call!24835 () ListLongMap!3797)

(assert (=> bm!24832 (= call!24835 (+!701 (ite c!44277 call!24833 (ite c!44275 call!24831 call!24834)) (ite (or c!44277 c!44275) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(declare-fun b!260486 () Bool)

(assert (=> b!260486 (= e!168794 (+!701 call!24835 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))

(declare-fun b!260487 () Bool)

(declare-fun res!127295 () Bool)

(assert (=> b!260487 (=> (not res!127295) (not e!168797))))

(assert (=> b!260487 (= res!127295 e!168792)))

(declare-fun res!127292 () Bool)

(assert (=> b!260487 (=> res!127292 e!168792)))

(assert (=> b!260487 (= res!127292 (not e!168796))))

(declare-fun res!127299 () Bool)

(assert (=> b!260487 (=> (not res!127299) (not e!168796))))

(assert (=> b!260487 (= res!127299 (bvslt #b00000000000000000000000000000000 (size!6306 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))))))))

(declare-fun bm!24833 () Bool)

(assert (=> bm!24833 (= call!24837 (contains!1870 lt!131306 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260488 () Bool)

(assert (=> b!260488 (= e!168795 (not call!24837))))

(declare-fun d!62487 () Bool)

(assert (=> d!62487 e!168797))

(declare-fun res!127298 () Bool)

(assert (=> d!62487 (=> (not res!127298) (not e!168797))))

(assert (=> d!62487 (= res!127298 (or (bvsge #b00000000000000000000000000000000 (size!6306 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6306 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))))))))))

(declare-fun lt!131320 () ListLongMap!3797)

(assert (=> d!62487 (= lt!131306 lt!131320)))

(declare-fun lt!131313 () Unit!8037)

(assert (=> d!62487 (= lt!131313 e!168791)))

(declare-fun c!44276 () Bool)

(assert (=> d!62487 (= c!44276 e!168801)))

(declare-fun res!127294 () Bool)

(assert (=> d!62487 (=> (not res!127294) (not e!168801))))

(assert (=> d!62487 (= res!127294 (bvslt #b00000000000000000000000000000000 (size!6306 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))))))))

(assert (=> d!62487 (= lt!131320 e!168794)))

(assert (=> d!62487 (= c!44277 (and (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62487 (validMask!0 (mask!11119 thiss!1504))))

(assert (=> d!62487 (= (getCurrentListMap!1423 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504))) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) lt!131306)))

(declare-fun bm!24834 () Bool)

(assert (=> bm!24834 (= call!24836 call!24835)))

(declare-fun b!260489 () Bool)

(declare-fun c!44278 () Bool)

(assert (=> b!260489 (= c!44278 (and (not (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4531 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!260489 (= e!168798 e!168802)))

(assert (= (and d!62487 c!44277) b!260486))

(assert (= (and d!62487 (not c!44277)) b!260482))

(assert (= (and b!260482 c!44275) b!260485))

(assert (= (and b!260482 (not c!44275)) b!260489))

(assert (= (and b!260489 c!44278) b!260476))

(assert (= (and b!260489 (not c!44278)) b!260470))

(assert (= (or b!260476 b!260470) bm!24831))

(assert (= (or b!260485 bm!24831) bm!24829))

(assert (= (or b!260485 b!260476) bm!24834))

(assert (= (or b!260486 bm!24829) bm!24828))

(assert (= (or b!260486 bm!24834) bm!24832))

(assert (= (and d!62487 res!127294) b!260469))

(assert (= (and d!62487 c!44276) b!260479))

(assert (= (and d!62487 (not c!44276)) b!260474))

(assert (= (and d!62487 res!127298) b!260487))

(assert (= (and b!260487 res!127299) b!260477))

(assert (= (and b!260487 (not res!127292)) b!260478))

(assert (= (and b!260478 res!127293) b!260484))

(assert (= (and b!260487 res!127295) b!260471))

(assert (= (and b!260471 c!44274) b!260475))

(assert (= (and b!260471 (not c!44274)) b!260488))

(assert (= (and b!260475 res!127296) b!260481))

(assert (= (or b!260475 b!260488) bm!24833))

(assert (= (and b!260471 res!127297) b!260472))

(assert (= (and b!260472 c!44279) b!260480))

(assert (= (and b!260472 (not c!44279)) b!260473))

(assert (= (and b!260480 res!127291) b!260483))

(assert (= (or b!260480 b!260473) bm!24830))

(declare-fun b_lambda!8257 () Bool)

(assert (=> (not b_lambda!8257) (not b!260484)))

(assert (=> b!260484 t!8859))

(declare-fun b_and!13855 () Bool)

(assert (= b_and!13853 (and (=> t!8859 result!5401) b_and!13855)))

(declare-fun m!275881 () Bool)

(assert (=> bm!24833 m!275881))

(declare-fun m!275883 () Bool)

(assert (=> bm!24828 m!275883))

(declare-fun m!275885 () Bool)

(assert (=> b!260478 m!275885))

(assert (=> b!260478 m!275885))

(declare-fun m!275887 () Bool)

(assert (=> b!260478 m!275887))

(assert (=> b!260484 m!275885))

(declare-fun m!275889 () Bool)

(assert (=> b!260484 m!275889))

(assert (=> b!260484 m!275423))

(assert (=> b!260484 m!275277))

(assert (=> b!260484 m!275425))

(assert (=> b!260484 m!275885))

(assert (=> b!260484 m!275423))

(assert (=> b!260484 m!275277))

(declare-fun m!275891 () Bool)

(assert (=> bm!24832 m!275891))

(declare-fun m!275893 () Bool)

(assert (=> b!260481 m!275893))

(declare-fun m!275895 () Bool)

(assert (=> b!260483 m!275895))

(declare-fun m!275897 () Bool)

(assert (=> b!260486 m!275897))

(assert (=> b!260477 m!275885))

(assert (=> b!260477 m!275885))

(declare-fun m!275899 () Bool)

(assert (=> b!260477 m!275899))

(declare-fun m!275901 () Bool)

(assert (=> b!260479 m!275901))

(declare-fun m!275903 () Bool)

(assert (=> b!260479 m!275903))

(declare-fun m!275905 () Bool)

(assert (=> b!260479 m!275905))

(declare-fun m!275907 () Bool)

(assert (=> b!260479 m!275907))

(assert (=> b!260479 m!275905))

(declare-fun m!275909 () Bool)

(assert (=> b!260479 m!275909))

(declare-fun m!275911 () Bool)

(assert (=> b!260479 m!275911))

(assert (=> b!260479 m!275911))

(declare-fun m!275913 () Bool)

(assert (=> b!260479 m!275913))

(assert (=> b!260479 m!275883))

(declare-fun m!275915 () Bool)

(assert (=> b!260479 m!275915))

(declare-fun m!275917 () Bool)

(assert (=> b!260479 m!275917))

(declare-fun m!275919 () Bool)

(assert (=> b!260479 m!275919))

(declare-fun m!275921 () Bool)

(assert (=> b!260479 m!275921))

(declare-fun m!275923 () Bool)

(assert (=> b!260479 m!275923))

(declare-fun m!275925 () Bool)

(assert (=> b!260479 m!275925))

(assert (=> b!260479 m!275885))

(declare-fun m!275927 () Bool)

(assert (=> b!260479 m!275927))

(assert (=> b!260479 m!275901))

(declare-fun m!275929 () Bool)

(assert (=> b!260479 m!275929))

(assert (=> b!260479 m!275917))

(declare-fun m!275931 () Bool)

(assert (=> bm!24830 m!275931))

(assert (=> d!62487 m!275079))

(assert (=> b!260469 m!275885))

(assert (=> b!260469 m!275885))

(assert (=> b!260469 m!275899))

(assert (=> b!260141 d!62487))

(declare-fun d!62489 () Bool)

(assert (=> d!62489 (= (apply!258 lt!131142 (select (arr!5956 lt!130908) #b00000000000000000000000000000000)) (get!3066 (getValueByKey!314 (toList!1914 lt!131142) (select (arr!5956 lt!130908) #b00000000000000000000000000000000))))))

(declare-fun bs!9161 () Bool)

(assert (= bs!9161 d!62489))

(assert (=> bs!9161 m!275393))

(assert (=> bs!9161 m!275495))

(assert (=> bs!9161 m!275495))

(declare-fun m!275933 () Bool)

(assert (=> bs!9161 m!275933))

(assert (=> b!260194 d!62489))

(declare-fun d!62491 () Bool)

(declare-fun c!44282 () Bool)

(assert (=> d!62491 (= c!44282 ((_ is ValueCellFull!2966) (select (arr!5955 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!168805 () V!8473)

(assert (=> d!62491 (= (get!3065 (select (arr!5955 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!592 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!168805)))

(declare-fun b!260494 () Bool)

(declare-fun get!3067 (ValueCell!2966 V!8473) V!8473)

(assert (=> b!260494 (= e!168805 (get!3067 (select (arr!5955 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!592 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!260495 () Bool)

(declare-fun get!3068 (ValueCell!2966 V!8473) V!8473)

(assert (=> b!260495 (= e!168805 (get!3068 (select (arr!5955 (array!12584 (store (arr!5955 (_values!4777 thiss!1504)) index!297 (ValueCellFull!2966 v!346)) (size!6305 (_values!4777 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!592 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62491 c!44282) b!260494))

(assert (= (and d!62491 (not c!44282)) b!260495))

(assert (=> b!260494 m!275423))

(assert (=> b!260494 m!275277))

(declare-fun m!275935 () Bool)

(assert (=> b!260494 m!275935))

(assert (=> b!260495 m!275423))

(assert (=> b!260495 m!275277))

(declare-fun m!275937 () Bool)

(assert (=> b!260495 m!275937))

(assert (=> b!260194 d!62491))

(declare-fun b!260514 () Bool)

(declare-fun e!168817 () SeekEntryResult!1177)

(assert (=> b!260514 (= e!168817 (Intermediate!1177 false (toIndex!0 key!932 (mask!11119 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun d!62493 () Bool)

(declare-fun e!168818 () Bool)

(assert (=> d!62493 e!168818))

(declare-fun c!44290 () Bool)

(declare-fun lt!131325 () SeekEntryResult!1177)

(assert (=> d!62493 (= c!44290 (and ((_ is Intermediate!1177) lt!131325) (undefined!1989 lt!131325)))))

(declare-fun e!168816 () SeekEntryResult!1177)

(assert (=> d!62493 (= lt!131325 e!168816)))

(declare-fun c!44289 () Bool)

(assert (=> d!62493 (= c!44289 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!131326 () (_ BitVec 64))

(assert (=> d!62493 (= lt!131326 (select (arr!5956 (_keys!6973 thiss!1504)) (toIndex!0 key!932 (mask!11119 thiss!1504))))))

(assert (=> d!62493 (validMask!0 (mask!11119 thiss!1504))))

(assert (=> d!62493 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11119 thiss!1504)) key!932 (_keys!6973 thiss!1504) (mask!11119 thiss!1504)) lt!131325)))

(declare-fun b!260515 () Bool)

(assert (=> b!260515 (and (bvsge (index!6880 lt!131325) #b00000000000000000000000000000000) (bvslt (index!6880 lt!131325) (size!6306 (_keys!6973 thiss!1504))))))

(declare-fun res!127306 () Bool)

(assert (=> b!260515 (= res!127306 (= (select (arr!5956 (_keys!6973 thiss!1504)) (index!6880 lt!131325)) key!932))))

(declare-fun e!168819 () Bool)

(assert (=> b!260515 (=> res!127306 e!168819)))

(declare-fun e!168820 () Bool)

(assert (=> b!260515 (= e!168820 e!168819)))

(declare-fun b!260516 () Bool)

(assert (=> b!260516 (and (bvsge (index!6880 lt!131325) #b00000000000000000000000000000000) (bvslt (index!6880 lt!131325) (size!6306 (_keys!6973 thiss!1504))))))

(assert (=> b!260516 (= e!168819 (= (select (arr!5956 (_keys!6973 thiss!1504)) (index!6880 lt!131325)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260517 () Bool)

(assert (=> b!260517 (= e!168817 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!11119 thiss!1504)) #b00000000000000000000000000000000 (mask!11119 thiss!1504)) key!932 (_keys!6973 thiss!1504) (mask!11119 thiss!1504)))))

(declare-fun b!260518 () Bool)

(assert (=> b!260518 (and (bvsge (index!6880 lt!131325) #b00000000000000000000000000000000) (bvslt (index!6880 lt!131325) (size!6306 (_keys!6973 thiss!1504))))))

(declare-fun res!127307 () Bool)

(assert (=> b!260518 (= res!127307 (= (select (arr!5956 (_keys!6973 thiss!1504)) (index!6880 lt!131325)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260518 (=> res!127307 e!168819)))

(declare-fun b!260519 () Bool)

(assert (=> b!260519 (= e!168818 e!168820)))

(declare-fun res!127308 () Bool)

(assert (=> b!260519 (= res!127308 (and ((_ is Intermediate!1177) lt!131325) (not (undefined!1989 lt!131325)) (bvslt (x!25114 lt!131325) #b01111111111111111111111111111110) (bvsge (x!25114 lt!131325) #b00000000000000000000000000000000) (bvsge (x!25114 lt!131325) #b00000000000000000000000000000000)))))

(assert (=> b!260519 (=> (not res!127308) (not e!168820))))

(declare-fun b!260520 () Bool)

(assert (=> b!260520 (= e!168816 (Intermediate!1177 true (toIndex!0 key!932 (mask!11119 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!260521 () Bool)

(assert (=> b!260521 (= e!168818 (bvsge (x!25114 lt!131325) #b01111111111111111111111111111110))))

(declare-fun b!260522 () Bool)

(assert (=> b!260522 (= e!168816 e!168817)))

(declare-fun c!44291 () Bool)

(assert (=> b!260522 (= c!44291 (or (= lt!131326 key!932) (= (bvadd lt!131326 lt!131326) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62493 c!44289) b!260520))

(assert (= (and d!62493 (not c!44289)) b!260522))

(assert (= (and b!260522 c!44291) b!260514))

(assert (= (and b!260522 (not c!44291)) b!260517))

(assert (= (and d!62493 c!44290) b!260521))

(assert (= (and d!62493 (not c!44290)) b!260519))

(assert (= (and b!260519 res!127308) b!260515))

(assert (= (and b!260515 (not res!127306)) b!260518))

(assert (= (and b!260518 (not res!127307)) b!260516))

(assert (=> d!62493 m!275329))

(declare-fun m!275939 () Bool)

(assert (=> d!62493 m!275939))

(assert (=> d!62493 m!275079))

(declare-fun m!275941 () Bool)

(assert (=> b!260516 m!275941))

(assert (=> b!260517 m!275329))

(declare-fun m!275943 () Bool)

(assert (=> b!260517 m!275943))

(assert (=> b!260517 m!275943))

(declare-fun m!275945 () Bool)

(assert (=> b!260517 m!275945))

(assert (=> b!260515 m!275941))

(assert (=> b!260518 m!275941))

(assert (=> d!62305 d!62493))

(declare-fun d!62495 () Bool)

(declare-fun lt!131332 () (_ BitVec 32))

(declare-fun lt!131331 () (_ BitVec 32))

(assert (=> d!62495 (= lt!131332 (bvmul (bvxor lt!131331 (bvlshr lt!131331 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!62495 (= lt!131331 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!62495 (and (bvsge (mask!11119 thiss!1504) #b00000000000000000000000000000000) (let ((res!127309 (let ((h!4458 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!25134 (bvmul (bvxor h!4458 (bvlshr h!4458 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!25134 (bvlshr x!25134 #b00000000000000000000000000001101)) (mask!11119 thiss!1504)))))) (and (bvslt res!127309 (bvadd (mask!11119 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!127309 #b00000000000000000000000000000000))))))

(assert (=> d!62495 (= (toIndex!0 key!932 (mask!11119 thiss!1504)) (bvand (bvxor lt!131332 (bvlshr lt!131332 #b00000000000000000000000000001101)) (mask!11119 thiss!1504)))))

(assert (=> d!62305 d!62495))

(assert (=> d!62305 d!62325))

(declare-fun d!62497 () Bool)

(declare-fun e!168821 () Bool)

(assert (=> d!62497 e!168821))

(declare-fun res!127311 () Bool)

(assert (=> d!62497 (=> (not res!127311) (not e!168821))))

(declare-fun lt!131336 () ListLongMap!3797)

(assert (=> d!62497 (= res!127311 (contains!1870 lt!131336 (_1!2458 (ite (or c!44211 c!44209) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(declare-fun lt!131334 () List!3792)

(assert (=> d!62497 (= lt!131336 (ListLongMap!3798 lt!131334))))

(declare-fun lt!131333 () Unit!8037)

(declare-fun lt!131335 () Unit!8037)

(assert (=> d!62497 (= lt!131333 lt!131335)))

(assert (=> d!62497 (= (getValueByKey!314 lt!131334 (_1!2458 (ite (or c!44211 c!44209) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))) (Some!319 (_2!2458 (ite (or c!44211 c!44209) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(assert (=> d!62497 (= lt!131335 (lemmaContainsTupThenGetReturnValue!173 lt!131334 (_1!2458 (ite (or c!44211 c!44209) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) (_2!2458 (ite (or c!44211 c!44209) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(assert (=> d!62497 (= lt!131334 (insertStrictlySorted!176 (toList!1914 (ite c!44211 call!24805 (ite c!44209 call!24803 call!24806))) (_1!2458 (ite (or c!44211 c!44209) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) (_2!2458 (ite (or c!44211 c!44209) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(assert (=> d!62497 (= (+!701 (ite c!44211 call!24805 (ite c!44209 call!24803 call!24806)) (ite (or c!44211 c!44209) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) lt!131336)))

(declare-fun b!260523 () Bool)

(declare-fun res!127310 () Bool)

(assert (=> b!260523 (=> (not res!127310) (not e!168821))))

(assert (=> b!260523 (= res!127310 (= (getValueByKey!314 (toList!1914 lt!131336) (_1!2458 (ite (or c!44211 c!44209) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))) (Some!319 (_2!2458 (ite (or c!44211 c!44209) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))))

(declare-fun b!260524 () Bool)

(assert (=> b!260524 (= e!168821 (contains!1873 (toList!1914 lt!131336) (ite (or c!44211 c!44209) (tuple2!4895 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4635 thiss!1504)) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(assert (= (and d!62497 res!127311) b!260523))

(assert (= (and b!260523 res!127310) b!260524))

(declare-fun m!275947 () Bool)

(assert (=> d!62497 m!275947))

(declare-fun m!275949 () Bool)

(assert (=> d!62497 m!275949))

(declare-fun m!275951 () Bool)

(assert (=> d!62497 m!275951))

(declare-fun m!275953 () Bool)

(assert (=> d!62497 m!275953))

(declare-fun m!275955 () Bool)

(assert (=> b!260523 m!275955))

(declare-fun m!275957 () Bool)

(assert (=> b!260524 m!275957))

(assert (=> bm!24804 d!62497))

(assert (=> b!260171 d!62353))

(declare-fun d!62499 () Bool)

(assert (=> d!62499 (= (validKeyInArray!0 (select (arr!5956 (_keys!6973 thiss!1504)) index!297)) (and (not (= (select (arr!5956 (_keys!6973 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5956 (_keys!6973 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260135 d!62499))

(declare-fun d!62501 () Bool)

(assert (=> d!62501 (= (apply!258 lt!131059 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)) (get!3066 (getValueByKey!314 (toList!1914 lt!131059) (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9162 () Bool)

(assert (= bs!9162 d!62501))

(assert (=> bs!9162 m!275269))

(assert (=> bs!9162 m!275503))

(assert (=> bs!9162 m!275503))

(declare-fun m!275959 () Bool)

(assert (=> bs!9162 m!275959))

(assert (=> b!260062 d!62501))

(declare-fun d!62503 () Bool)

(declare-fun c!44292 () Bool)

(assert (=> d!62503 (= c!44292 ((_ is ValueCellFull!2966) (select (arr!5955 (_values!4777 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!168822 () V!8473)

(assert (=> d!62503 (= (get!3065 (select (arr!5955 (_values!4777 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!592 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!168822)))

(declare-fun b!260525 () Bool)

(assert (=> b!260525 (= e!168822 (get!3067 (select (arr!5955 (_values!4777 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!592 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!260526 () Bool)

(assert (=> b!260526 (= e!168822 (get!3068 (select (arr!5955 (_values!4777 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!592 (defaultEntry!4794 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62503 c!44292) b!260525))

(assert (= (and d!62503 (not c!44292)) b!260526))

(assert (=> b!260525 m!275275))

(assert (=> b!260525 m!275277))

(declare-fun m!275961 () Bool)

(assert (=> b!260525 m!275961))

(assert (=> b!260526 m!275275))

(assert (=> b!260526 m!275277))

(declare-fun m!275963 () Bool)

(assert (=> b!260526 m!275963))

(assert (=> b!260062 d!62503))

(declare-fun call!24838 () Bool)

(declare-fun bm!24835 () Bool)

(assert (=> bm!24835 (= call!24838 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) (mask!11119 thiss!1504)))))

(declare-fun b!260527 () Bool)

(declare-fun e!168824 () Bool)

(declare-fun e!168823 () Bool)

(assert (=> b!260527 (= e!168824 e!168823)))

(declare-fun lt!131339 () (_ BitVec 64))

(assert (=> b!260527 (= lt!131339 (select (arr!5956 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131337 () Unit!8037)

(assert (=> b!260527 (= lt!131337 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) lt!131339 #b00000000000000000000000000000000))))

(assert (=> b!260527 (arrayContainsKey!0 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) lt!131339 #b00000000000000000000000000000000)))

(declare-fun lt!131338 () Unit!8037)

(assert (=> b!260527 (= lt!131338 lt!131337)))

(declare-fun res!127312 () Bool)

(assert (=> b!260527 (= res!127312 (= (seekEntryOrOpen!0 (select (arr!5956 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504)))) #b00000000000000000000000000000000) (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) (mask!11119 thiss!1504)) (Found!1177 #b00000000000000000000000000000000)))))

(assert (=> b!260527 (=> (not res!127312) (not e!168823))))

(declare-fun d!62505 () Bool)

(declare-fun res!127313 () Bool)

(declare-fun e!168825 () Bool)

(assert (=> d!62505 (=> res!127313 e!168825)))

(assert (=> d!62505 (= res!127313 (bvsge #b00000000000000000000000000000000 (size!6306 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))))))))

(assert (=> d!62505 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) (mask!11119 thiss!1504)) e!168825)))

(declare-fun b!260528 () Bool)

(assert (=> b!260528 (= e!168823 call!24838)))

(declare-fun b!260529 () Bool)

(assert (=> b!260529 (= e!168824 call!24838)))

(declare-fun b!260530 () Bool)

(assert (=> b!260530 (= e!168825 e!168824)))

(declare-fun c!44293 () Bool)

(assert (=> b!260530 (= c!44293 (validKeyInArray!0 (select (arr!5956 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!62505 (not res!127313)) b!260530))

(assert (= (and b!260530 c!44293) b!260527))

(assert (= (and b!260530 (not c!44293)) b!260529))

(assert (= (and b!260527 res!127312) b!260528))

(assert (= (or b!260528 b!260529) bm!24835))

(declare-fun m!275965 () Bool)

(assert (=> bm!24835 m!275965))

(assert (=> b!260527 m!275885))

(declare-fun m!275967 () Bool)

(assert (=> b!260527 m!275967))

(declare-fun m!275969 () Bool)

(assert (=> b!260527 m!275969))

(assert (=> b!260527 m!275885))

(declare-fun m!275971 () Bool)

(assert (=> b!260527 m!275971))

(assert (=> b!260530 m!275885))

(assert (=> b!260530 m!275885))

(assert (=> b!260530 m!275899))

(assert (=> b!260229 d!62505))

(assert (=> b!260179 d!62353))

(declare-fun d!62507 () Bool)

(assert (=> d!62507 (= (inRange!0 (index!6879 lt!131094) (mask!11119 thiss!1504)) (and (bvsge (index!6879 lt!131094) #b00000000000000000000000000000000) (bvslt (index!6879 lt!131094) (bvadd (mask!11119 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!260125 d!62507))

(declare-fun d!62509 () Bool)

(assert (=> d!62509 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260136 d!62509))

(declare-fun b!260531 () Bool)

(declare-fun e!168826 () Bool)

(declare-fun e!168827 () Bool)

(assert (=> b!260531 (= e!168826 e!168827)))

(declare-fun res!127314 () Bool)

(assert (=> b!260531 (=> (not res!127314) (not e!168827))))

(declare-fun e!168829 () Bool)

(assert (=> b!260531 (= res!127314 (not e!168829))))

(declare-fun res!127316 () Bool)

(assert (=> b!260531 (=> (not res!127316) (not e!168829))))

(assert (=> b!260531 (= res!127316 (validKeyInArray!0 (select (arr!5956 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!260532 () Bool)

(declare-fun e!168828 () Bool)

(declare-fun call!24839 () Bool)

(assert (=> b!260532 (= e!168828 call!24839)))

(declare-fun d!62511 () Bool)

(declare-fun res!127315 () Bool)

(assert (=> d!62511 (=> res!127315 e!168826)))

(assert (=> d!62511 (= res!127315 (bvsge #b00000000000000000000000000000000 (size!6306 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))))))))

(assert (=> d!62511 (= (arrayNoDuplicates!0 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) #b00000000000000000000000000000000 Nil!3790) e!168826)))

(declare-fun b!260533 () Bool)

(assert (=> b!260533 (= e!168827 e!168828)))

(declare-fun c!44294 () Bool)

(assert (=> b!260533 (= c!44294 (validKeyInArray!0 (select (arr!5956 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun bm!24836 () Bool)

(assert (=> bm!24836 (= call!24839 (arrayNoDuplicates!0 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44294 (Cons!3789 (select (arr!5956 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504)))) #b00000000000000000000000000000000) Nil!3790) Nil!3790)))))

(declare-fun b!260534 () Bool)

(assert (=> b!260534 (= e!168829 (contains!1874 Nil!3790 (select (arr!5956 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!260535 () Bool)

(assert (=> b!260535 (= e!168828 call!24839)))

(assert (= (and d!62511 (not res!127315)) b!260531))

(assert (= (and b!260531 res!127316) b!260534))

(assert (= (and b!260531 res!127314) b!260533))

(assert (= (and b!260533 c!44294) b!260532))

(assert (= (and b!260533 (not c!44294)) b!260535))

(assert (= (or b!260532 b!260535) bm!24836))

(assert (=> b!260531 m!275885))

(assert (=> b!260531 m!275885))

(assert (=> b!260531 m!275899))

(assert (=> b!260533 m!275885))

(assert (=> b!260533 m!275885))

(assert (=> b!260533 m!275899))

(assert (=> bm!24836 m!275885))

(declare-fun m!275973 () Bool)

(assert (=> bm!24836 m!275973))

(assert (=> b!260534 m!275885))

(assert (=> b!260534 m!275885))

(declare-fun m!275975 () Bool)

(assert (=> b!260534 m!275975))

(assert (=> b!260174 d!62511))

(declare-fun d!62513 () Bool)

(declare-fun e!168830 () Bool)

(assert (=> d!62513 e!168830))

(declare-fun res!127317 () Bool)

(assert (=> d!62513 (=> res!127317 e!168830)))

(declare-fun lt!131340 () Bool)

(assert (=> d!62513 (= res!127317 (not lt!131340))))

(declare-fun lt!131343 () Bool)

(assert (=> d!62513 (= lt!131340 lt!131343)))

(declare-fun lt!131342 () Unit!8037)

(declare-fun e!168831 () Unit!8037)

(assert (=> d!62513 (= lt!131342 e!168831)))

(declare-fun c!44295 () Bool)

(assert (=> d!62513 (= c!44295 lt!131343)))

(assert (=> d!62513 (= lt!131343 (containsKey!306 (toList!1914 lt!131118) (_1!2458 (tuple2!4895 key!932 v!346))))))

(assert (=> d!62513 (= (contains!1870 lt!131118 (_1!2458 (tuple2!4895 key!932 v!346))) lt!131340)))

(declare-fun b!260536 () Bool)

(declare-fun lt!131341 () Unit!8037)

(assert (=> b!260536 (= e!168831 lt!131341)))

(assert (=> b!260536 (= lt!131341 (lemmaContainsKeyImpliesGetValueByKeyDefined!255 (toList!1914 lt!131118) (_1!2458 (tuple2!4895 key!932 v!346))))))

(assert (=> b!260536 (isDefined!256 (getValueByKey!314 (toList!1914 lt!131118) (_1!2458 (tuple2!4895 key!932 v!346))))))

(declare-fun b!260537 () Bool)

(declare-fun Unit!8059 () Unit!8037)

(assert (=> b!260537 (= e!168831 Unit!8059)))

(declare-fun b!260538 () Bool)

(assert (=> b!260538 (= e!168830 (isDefined!256 (getValueByKey!314 (toList!1914 lt!131118) (_1!2458 (tuple2!4895 key!932 v!346)))))))

(assert (= (and d!62513 c!44295) b!260536))

(assert (= (and d!62513 (not c!44295)) b!260537))

(assert (= (and d!62513 (not res!127317)) b!260538))

(declare-fun m!275977 () Bool)

(assert (=> d!62513 m!275977))

(declare-fun m!275979 () Bool)

(assert (=> b!260536 m!275979))

(assert (=> b!260536 m!275387))

(assert (=> b!260536 m!275387))

(declare-fun m!275981 () Bool)

(assert (=> b!260536 m!275981))

(assert (=> b!260538 m!275387))

(assert (=> b!260538 m!275387))

(assert (=> b!260538 m!275981))

(assert (=> d!62329 d!62513))

(declare-fun b!260541 () Bool)

(declare-fun e!168833 () Option!320)

(assert (=> b!260541 (= e!168833 (getValueByKey!314 (t!8852 lt!131116) (_1!2458 (tuple2!4895 key!932 v!346))))))

(declare-fun b!260539 () Bool)

(declare-fun e!168832 () Option!320)

(assert (=> b!260539 (= e!168832 (Some!319 (_2!2458 (h!4452 lt!131116))))))

(declare-fun d!62515 () Bool)

(declare-fun c!44296 () Bool)

(assert (=> d!62515 (= c!44296 (and ((_ is Cons!3788) lt!131116) (= (_1!2458 (h!4452 lt!131116)) (_1!2458 (tuple2!4895 key!932 v!346)))))))

(assert (=> d!62515 (= (getValueByKey!314 lt!131116 (_1!2458 (tuple2!4895 key!932 v!346))) e!168832)))

(declare-fun b!260540 () Bool)

(assert (=> b!260540 (= e!168832 e!168833)))

(declare-fun c!44297 () Bool)

(assert (=> b!260540 (= c!44297 (and ((_ is Cons!3788) lt!131116) (not (= (_1!2458 (h!4452 lt!131116)) (_1!2458 (tuple2!4895 key!932 v!346))))))))

(declare-fun b!260542 () Bool)

(assert (=> b!260542 (= e!168833 None!318)))

(assert (= (and d!62515 c!44296) b!260539))

(assert (= (and d!62515 (not c!44296)) b!260540))

(assert (= (and b!260540 c!44297) b!260541))

(assert (= (and b!260540 (not c!44297)) b!260542))

(declare-fun m!275983 () Bool)

(assert (=> b!260541 m!275983))

(assert (=> d!62329 d!62515))

(declare-fun d!62517 () Bool)

(assert (=> d!62517 (= (getValueByKey!314 lt!131116 (_1!2458 (tuple2!4895 key!932 v!346))) (Some!319 (_2!2458 (tuple2!4895 key!932 v!346))))))

(declare-fun lt!131346 () Unit!8037)

(declare-fun choose!1278 (List!3792 (_ BitVec 64) V!8473) Unit!8037)

(assert (=> d!62517 (= lt!131346 (choose!1278 lt!131116 (_1!2458 (tuple2!4895 key!932 v!346)) (_2!2458 (tuple2!4895 key!932 v!346))))))

(declare-fun e!168836 () Bool)

(assert (=> d!62517 e!168836))

(declare-fun res!127322 () Bool)

(assert (=> d!62517 (=> (not res!127322) (not e!168836))))

(assert (=> d!62517 (= res!127322 (isStrictlySorted!370 lt!131116))))

(assert (=> d!62517 (= (lemmaContainsTupThenGetReturnValue!173 lt!131116 (_1!2458 (tuple2!4895 key!932 v!346)) (_2!2458 (tuple2!4895 key!932 v!346))) lt!131346)))

(declare-fun b!260547 () Bool)

(declare-fun res!127323 () Bool)

(assert (=> b!260547 (=> (not res!127323) (not e!168836))))

(assert (=> b!260547 (= res!127323 (containsKey!306 lt!131116 (_1!2458 (tuple2!4895 key!932 v!346))))))

(declare-fun b!260548 () Bool)

(assert (=> b!260548 (= e!168836 (contains!1873 lt!131116 (tuple2!4895 (_1!2458 (tuple2!4895 key!932 v!346)) (_2!2458 (tuple2!4895 key!932 v!346)))))))

(assert (= (and d!62517 res!127322) b!260547))

(assert (= (and b!260547 res!127323) b!260548))

(assert (=> d!62517 m!275381))

(declare-fun m!275985 () Bool)

(assert (=> d!62517 m!275985))

(declare-fun m!275987 () Bool)

(assert (=> d!62517 m!275987))

(declare-fun m!275989 () Bool)

(assert (=> b!260547 m!275989))

(declare-fun m!275991 () Bool)

(assert (=> b!260548 m!275991))

(assert (=> d!62329 d!62517))

(declare-fun bm!24843 () Bool)

(declare-fun call!24848 () List!3792)

(declare-fun call!24846 () List!3792)

(assert (=> bm!24843 (= call!24848 call!24846)))

(declare-fun c!44308 () Bool)

(declare-fun c!44309 () Bool)

(declare-fun e!168850 () List!3792)

(declare-fun b!260569 () Bool)

(assert (=> b!260569 (= e!168850 (ite c!44309 (t!8852 (toList!1914 lt!130910)) (ite c!44308 (Cons!3788 (h!4452 (toList!1914 lt!130910)) (t!8852 (toList!1914 lt!130910))) Nil!3789)))))

(declare-fun b!260570 () Bool)

(assert (=> b!260570 (= c!44308 (and ((_ is Cons!3788) (toList!1914 lt!130910)) (bvsgt (_1!2458 (h!4452 (toList!1914 lt!130910))) (_1!2458 (tuple2!4895 key!932 v!346)))))))

(declare-fun e!168849 () List!3792)

(declare-fun e!168851 () List!3792)

(assert (=> b!260570 (= e!168849 e!168851)))

(declare-fun b!260571 () Bool)

(declare-fun res!127329 () Bool)

(declare-fun e!168848 () Bool)

(assert (=> b!260571 (=> (not res!127329) (not e!168848))))

(declare-fun lt!131349 () List!3792)

(assert (=> b!260571 (= res!127329 (containsKey!306 lt!131349 (_1!2458 (tuple2!4895 key!932 v!346))))))

(declare-fun c!44307 () Bool)

(declare-fun bm!24844 () Bool)

(declare-fun $colon$colon!105 (List!3792 tuple2!4894) List!3792)

(assert (=> bm!24844 (= call!24846 ($colon$colon!105 e!168850 (ite c!44307 (h!4452 (toList!1914 lt!130910)) (tuple2!4895 (_1!2458 (tuple2!4895 key!932 v!346)) (_2!2458 (tuple2!4895 key!932 v!346))))))))

(declare-fun c!44306 () Bool)

(assert (=> bm!24844 (= c!44306 c!44307)))

(declare-fun b!260572 () Bool)

(declare-fun e!168847 () List!3792)

(assert (=> b!260572 (= e!168847 call!24846)))

(declare-fun b!260573 () Bool)

(declare-fun call!24847 () List!3792)

(assert (=> b!260573 (= e!168851 call!24847)))

(declare-fun b!260574 () Bool)

(assert (=> b!260574 (= e!168849 call!24848)))

(declare-fun b!260576 () Bool)

(assert (=> b!260576 (= e!168847 e!168849)))

(assert (=> b!260576 (= c!44309 (and ((_ is Cons!3788) (toList!1914 lt!130910)) (= (_1!2458 (h!4452 (toList!1914 lt!130910))) (_1!2458 (tuple2!4895 key!932 v!346)))))))

(declare-fun bm!24845 () Bool)

(assert (=> bm!24845 (= call!24847 call!24848)))

(declare-fun b!260577 () Bool)

(assert (=> b!260577 (= e!168851 call!24847)))

(declare-fun b!260578 () Bool)

(assert (=> b!260578 (= e!168850 (insertStrictlySorted!176 (t!8852 (toList!1914 lt!130910)) (_1!2458 (tuple2!4895 key!932 v!346)) (_2!2458 (tuple2!4895 key!932 v!346))))))

(declare-fun b!260575 () Bool)

(assert (=> b!260575 (= e!168848 (contains!1873 lt!131349 (tuple2!4895 (_1!2458 (tuple2!4895 key!932 v!346)) (_2!2458 (tuple2!4895 key!932 v!346)))))))

(declare-fun d!62519 () Bool)

(assert (=> d!62519 e!168848))

(declare-fun res!127328 () Bool)

(assert (=> d!62519 (=> (not res!127328) (not e!168848))))

(assert (=> d!62519 (= res!127328 (isStrictlySorted!370 lt!131349))))

(assert (=> d!62519 (= lt!131349 e!168847)))

(assert (=> d!62519 (= c!44307 (and ((_ is Cons!3788) (toList!1914 lt!130910)) (bvslt (_1!2458 (h!4452 (toList!1914 lt!130910))) (_1!2458 (tuple2!4895 key!932 v!346)))))))

(assert (=> d!62519 (isStrictlySorted!370 (toList!1914 lt!130910))))

(assert (=> d!62519 (= (insertStrictlySorted!176 (toList!1914 lt!130910) (_1!2458 (tuple2!4895 key!932 v!346)) (_2!2458 (tuple2!4895 key!932 v!346))) lt!131349)))

(assert (= (and d!62519 c!44307) b!260572))

(assert (= (and d!62519 (not c!44307)) b!260576))

(assert (= (and b!260576 c!44309) b!260574))

(assert (= (and b!260576 (not c!44309)) b!260570))

(assert (= (and b!260570 c!44308) b!260573))

(assert (= (and b!260570 (not c!44308)) b!260577))

(assert (= (or b!260573 b!260577) bm!24845))

(assert (= (or b!260574 bm!24845) bm!24843))

(assert (= (or b!260572 bm!24843) bm!24844))

(assert (= (and bm!24844 c!44306) b!260578))

(assert (= (and bm!24844 (not c!44306)) b!260569))

(assert (= (and d!62519 res!127328) b!260571))

(assert (= (and b!260571 res!127329) b!260575))

(declare-fun m!275993 () Bool)

(assert (=> d!62519 m!275993))

(assert (=> d!62519 m!275627))

(declare-fun m!275995 () Bool)

(assert (=> bm!24844 m!275995))

(declare-fun m!275997 () Bool)

(assert (=> b!260571 m!275997))

(declare-fun m!275999 () Bool)

(assert (=> b!260575 m!275999))

(declare-fun m!276001 () Bool)

(assert (=> b!260578 m!276001))

(assert (=> d!62329 d!62519))

(declare-fun d!62521 () Bool)

(declare-fun e!168852 () Bool)

(assert (=> d!62521 e!168852))

(declare-fun res!127330 () Bool)

(assert (=> d!62521 (=> res!127330 e!168852)))

(declare-fun lt!131350 () Bool)

(assert (=> d!62521 (= res!127330 (not lt!131350))))

(declare-fun lt!131353 () Bool)

(assert (=> d!62521 (= lt!131350 lt!131353)))

(declare-fun lt!131352 () Unit!8037)

(declare-fun e!168853 () Unit!8037)

(assert (=> d!62521 (= lt!131352 e!168853)))

(declare-fun c!44310 () Bool)

(assert (=> d!62521 (= c!44310 lt!131353)))

(assert (=> d!62521 (= lt!131353 (containsKey!306 (toList!1914 lt!131142) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62521 (= (contains!1870 lt!131142 #b0000000000000000000000000000000000000000000000000000000000000000) lt!131350)))

(declare-fun b!260579 () Bool)

(declare-fun lt!131351 () Unit!8037)

(assert (=> b!260579 (= e!168853 lt!131351)))

(assert (=> b!260579 (= lt!131351 (lemmaContainsKeyImpliesGetValueByKeyDefined!255 (toList!1914 lt!131142) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260579 (isDefined!256 (getValueByKey!314 (toList!1914 lt!131142) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260580 () Bool)

(declare-fun Unit!8060 () Unit!8037)

(assert (=> b!260580 (= e!168853 Unit!8060)))

(declare-fun b!260581 () Bool)

(assert (=> b!260581 (= e!168852 (isDefined!256 (getValueByKey!314 (toList!1914 lt!131142) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62521 c!44310) b!260579))

(assert (= (and d!62521 (not c!44310)) b!260580))

(assert (= (and d!62521 (not res!127330)) b!260581))

(declare-fun m!276003 () Bool)

(assert (=> d!62521 m!276003))

(declare-fun m!276005 () Bool)

(assert (=> b!260579 m!276005))

(assert (=> b!260579 m!275753))

(assert (=> b!260579 m!275753))

(declare-fun m!276007 () Bool)

(assert (=> b!260579 m!276007))

(assert (=> b!260581 m!275753))

(assert (=> b!260581 m!275753))

(assert (=> b!260581 m!276007))

(assert (=> bm!24805 d!62521))

(declare-fun d!62523 () Bool)

(assert (=> d!62523 (arrayNoDuplicates!0 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) #b00000000000000000000000000000000 Nil!3790)))

(assert (=> d!62523 true))

(declare-fun _$65!92 () Unit!8037)

(assert (=> d!62523 (= (choose!41 (_keys!6973 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3790) _$65!92)))

(declare-fun bs!9163 () Bool)

(assert (= bs!9163 d!62523))

(assert (=> bs!9163 m!275099))

(assert (=> bs!9163 m!275407))

(assert (=> d!62335 d!62523))

(declare-fun d!62525 () Bool)

(assert (=> d!62525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) (mask!11119 thiss!1504))))

(assert (=> d!62525 true))

(declare-fun _$56!39 () Unit!8037)

(assert (=> d!62525 (= (choose!102 key!932 (_keys!6973 thiss!1504) index!297 (mask!11119 thiss!1504)) _$56!39)))

(declare-fun bs!9164 () Bool)

(assert (= bs!9164 d!62525))

(assert (=> bs!9164 m!275099))

(assert (=> bs!9164 m!275479))

(assert (=> d!62347 d!62525))

(assert (=> d!62347 d!62325))

(declare-fun b!260582 () Bool)

(declare-fun e!168854 () (_ BitVec 32))

(declare-fun call!24849 () (_ BitVec 32))

(assert (=> b!260582 (= e!168854 call!24849)))

(declare-fun b!260583 () Bool)

(declare-fun e!168855 () (_ BitVec 32))

(assert (=> b!260583 (= e!168855 #b00000000000000000000000000000000)))

(declare-fun b!260584 () Bool)

(assert (=> b!260584 (= e!168854 (bvadd #b00000000000000000000000000000001 call!24849))))

(declare-fun b!260585 () Bool)

(assert (=> b!260585 (= e!168855 e!168854)))

(declare-fun c!44311 () Bool)

(assert (=> b!260585 (= c!44311 (validKeyInArray!0 (select (arr!5956 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!62527 () Bool)

(declare-fun lt!131354 () (_ BitVec 32))

(assert (=> d!62527 (and (bvsge lt!131354 #b00000000000000000000000000000000) (bvsle lt!131354 (bvsub (size!6306 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!62527 (= lt!131354 e!168855)))

(declare-fun c!44312 () Bool)

(assert (=> d!62527 (= c!44312 (bvsge #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))))))

(assert (=> d!62527 (and (bvsle #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6306 (_keys!6973 thiss!1504)) (size!6306 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))))))))

(assert (=> d!62527 (= (arrayCountValidKeys!0 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))) lt!131354)))

(declare-fun bm!24846 () Bool)

(assert (=> bm!24846 (= call!24849 (arrayCountValidKeys!0 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6306 (_keys!6973 thiss!1504))))))

(assert (= (and d!62527 c!44312) b!260583))

(assert (= (and d!62527 (not c!44312)) b!260585))

(assert (= (and b!260585 c!44311) b!260584))

(assert (= (and b!260585 (not c!44311)) b!260582))

(assert (= (or b!260584 b!260582) bm!24846))

(assert (=> b!260585 m!275885))

(assert (=> b!260585 m!275885))

(assert (=> b!260585 m!275899))

(declare-fun m!276009 () Bool)

(assert (=> bm!24846 m!276009))

(assert (=> b!260138 d!62527))

(assert (=> b!260138 d!62349))

(declare-fun d!62529 () Bool)

(declare-fun e!168856 () Bool)

(assert (=> d!62529 e!168856))

(declare-fun res!127332 () Bool)

(assert (=> d!62529 (=> (not res!127332) (not e!168856))))

(declare-fun lt!131358 () ListLongMap!3797)

(assert (=> d!62529 (= res!127332 (contains!1870 lt!131358 (_1!2458 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(declare-fun lt!131356 () List!3792)

(assert (=> d!62529 (= lt!131358 (ListLongMap!3798 lt!131356))))

(declare-fun lt!131355 () Unit!8037)

(declare-fun lt!131357 () Unit!8037)

(assert (=> d!62529 (= lt!131355 lt!131357)))

(assert (=> d!62529 (= (getValueByKey!314 lt!131356 (_1!2458 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(assert (=> d!62529 (= lt!131357 (lemmaContainsTupThenGetReturnValue!173 lt!131356 (_1!2458 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(assert (=> d!62529 (= lt!131356 (insertStrictlySorted!176 (toList!1914 call!24787) (_1!2458 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))) (_2!2458 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))))))

(assert (=> d!62529 (= (+!701 call!24787 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))) lt!131358)))

(declare-fun b!260586 () Bool)

(declare-fun res!127331 () Bool)

(assert (=> b!260586 (=> (not res!127331) (not e!168856))))

(assert (=> b!260586 (= res!127331 (= (getValueByKey!314 (toList!1914 lt!131358) (_1!2458 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504)))) (Some!319 (_2!2458 (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))))

(declare-fun b!260587 () Bool)

(assert (=> b!260587 (= e!168856 (contains!1873 (toList!1914 lt!131358) (tuple2!4895 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4635 thiss!1504))))))

(assert (= (and d!62529 res!127332) b!260586))

(assert (= (and b!260586 res!127331) b!260587))

(declare-fun m!276011 () Bool)

(assert (=> d!62529 m!276011))

(declare-fun m!276013 () Bool)

(assert (=> d!62529 m!276013))

(declare-fun m!276015 () Bool)

(assert (=> d!62529 m!276015))

(declare-fun m!276017 () Bool)

(assert (=> d!62529 m!276017))

(declare-fun m!276019 () Bool)

(assert (=> b!260586 m!276019))

(declare-fun m!276021 () Bool)

(assert (=> b!260587 m!276021))

(assert (=> b!260064 d!62529))

(assert (=> d!62339 d!62325))

(declare-fun d!62531 () Bool)

(assert (=> d!62531 (= (inRange!0 (ite c!44196 (index!6878 lt!131088) (index!6881 lt!131088)) (mask!11119 thiss!1504)) (and (bvsge (ite c!44196 (index!6878 lt!131088) (index!6881 lt!131088)) #b00000000000000000000000000000000) (bvslt (ite c!44196 (index!6878 lt!131088) (index!6881 lt!131088)) (bvadd (mask!11119 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24791 d!62531))

(declare-fun d!62533 () Bool)

(declare-fun e!168857 () Bool)

(assert (=> d!62533 e!168857))

(declare-fun res!127333 () Bool)

(assert (=> d!62533 (=> res!127333 e!168857)))

(declare-fun lt!131359 () Bool)

(assert (=> d!62533 (= res!127333 (not lt!131359))))

(declare-fun lt!131362 () Bool)

(assert (=> d!62533 (= lt!131359 lt!131362)))

(declare-fun lt!131361 () Unit!8037)

(declare-fun e!168858 () Unit!8037)

(assert (=> d!62533 (= lt!131361 e!168858)))

(declare-fun c!44313 () Bool)

(assert (=> d!62533 (= c!44313 lt!131362)))

(assert (=> d!62533 (= lt!131362 (containsKey!306 (toList!1914 lt!131059) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62533 (= (contains!1870 lt!131059 #b0000000000000000000000000000000000000000000000000000000000000000) lt!131359)))

(declare-fun b!260588 () Bool)

(declare-fun lt!131360 () Unit!8037)

(assert (=> b!260588 (= e!168858 lt!131360)))

(assert (=> b!260588 (= lt!131360 (lemmaContainsKeyImpliesGetValueByKeyDefined!255 (toList!1914 lt!131059) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260588 (isDefined!256 (getValueByKey!314 (toList!1914 lt!131059) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260589 () Bool)

(declare-fun Unit!8061 () Unit!8037)

(assert (=> b!260589 (= e!168858 Unit!8061)))

(declare-fun b!260590 () Bool)

(assert (=> b!260590 (= e!168857 (isDefined!256 (getValueByKey!314 (toList!1914 lt!131059) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62533 c!44313) b!260588))

(assert (= (and d!62533 (not c!44313)) b!260589))

(assert (= (and d!62533 (not res!127333)) b!260590))

(declare-fun m!276023 () Bool)

(assert (=> d!62533 m!276023))

(declare-fun m!276025 () Bool)

(assert (=> b!260588 m!276025))

(assert (=> b!260588 m!275855))

(assert (=> b!260588 m!275855))

(declare-fun m!276027 () Bool)

(assert (=> b!260588 m!276027))

(assert (=> b!260590 m!275855))

(assert (=> b!260590 m!275855))

(assert (=> b!260590 m!276027))

(assert (=> bm!24785 d!62533))

(assert (=> b!260094 d!62349))

(declare-fun b!260591 () Bool)

(declare-fun e!168859 () Bool)

(declare-fun e!168860 () Bool)

(assert (=> b!260591 (= e!168859 e!168860)))

(declare-fun res!127334 () Bool)

(assert (=> b!260591 (=> (not res!127334) (not e!168860))))

(declare-fun e!168862 () Bool)

(assert (=> b!260591 (= res!127334 (not e!168862))))

(declare-fun res!127336 () Bool)

(assert (=> b!260591 (=> (not res!127336) (not e!168862))))

(assert (=> b!260591 (= res!127336 (validKeyInArray!0 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!260592 () Bool)

(declare-fun e!168861 () Bool)

(declare-fun call!24850 () Bool)

(assert (=> b!260592 (= e!168861 call!24850)))

(declare-fun d!62535 () Bool)

(declare-fun res!127335 () Bool)

(assert (=> d!62535 (=> res!127335 e!168859)))

(assert (=> d!62535 (= res!127335 (bvsge #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))))))

(assert (=> d!62535 (= (arrayNoDuplicates!0 (_keys!6973 thiss!1504) #b00000000000000000000000000000000 Nil!3790) e!168859)))

(declare-fun b!260593 () Bool)

(assert (=> b!260593 (= e!168860 e!168861)))

(declare-fun c!44314 () Bool)

(assert (=> b!260593 (= c!44314 (validKeyInArray!0 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24847 () Bool)

(assert (=> bm!24847 (= call!24850 (arrayNoDuplicates!0 (_keys!6973 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44314 (Cons!3789 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000) Nil!3790) Nil!3790)))))

(declare-fun b!260594 () Bool)

(assert (=> b!260594 (= e!168862 (contains!1874 Nil!3790 (select (arr!5956 (_keys!6973 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!260595 () Bool)

(assert (=> b!260595 (= e!168861 call!24850)))

(assert (= (and d!62535 (not res!127335)) b!260591))

(assert (= (and b!260591 res!127336) b!260594))

(assert (= (and b!260591 res!127334) b!260593))

(assert (= (and b!260593 c!44314) b!260592))

(assert (= (and b!260593 (not c!44314)) b!260595))

(assert (= (or b!260592 b!260595) bm!24847))

(assert (=> b!260591 m!275269))

(assert (=> b!260591 m!275269))

(assert (=> b!260591 m!275289))

(assert (=> b!260593 m!275269))

(assert (=> b!260593 m!275269))

(assert (=> b!260593 m!275289))

(assert (=> bm!24847 m!275269))

(declare-fun m!276029 () Bool)

(assert (=> bm!24847 m!276029))

(assert (=> b!260594 m!275269))

(assert (=> b!260594 m!275269))

(declare-fun m!276031 () Bool)

(assert (=> b!260594 m!276031))

(assert (=> b!260096 d!62535))

(declare-fun d!62537 () Bool)

(declare-fun e!168863 () Bool)

(assert (=> d!62537 e!168863))

(declare-fun res!127337 () Bool)

(assert (=> d!62537 (=> res!127337 e!168863)))

(declare-fun lt!131363 () Bool)

(assert (=> d!62537 (= res!127337 (not lt!131363))))

(declare-fun lt!131366 () Bool)

(assert (=> d!62537 (= lt!131363 lt!131366)))

(declare-fun lt!131365 () Unit!8037)

(declare-fun e!168864 () Unit!8037)

(assert (=> d!62537 (= lt!131365 e!168864)))

(declare-fun c!44315 () Bool)

(assert (=> d!62537 (= c!44315 lt!131366)))

(assert (=> d!62537 (= lt!131366 (containsKey!306 (toList!1914 (getCurrentListMap!1423 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504))) key!932))))

(assert (=> d!62537 (= (contains!1870 (getCurrentListMap!1423 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) key!932) lt!131363)))

(declare-fun b!260596 () Bool)

(declare-fun lt!131364 () Unit!8037)

(assert (=> b!260596 (= e!168864 lt!131364)))

(assert (=> b!260596 (= lt!131364 (lemmaContainsKeyImpliesGetValueByKeyDefined!255 (toList!1914 (getCurrentListMap!1423 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504))) key!932))))

(assert (=> b!260596 (isDefined!256 (getValueByKey!314 (toList!1914 (getCurrentListMap!1423 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504))) key!932))))

(declare-fun b!260597 () Bool)

(declare-fun Unit!8062 () Unit!8037)

(assert (=> b!260597 (= e!168864 Unit!8062)))

(declare-fun b!260598 () Bool)

(assert (=> b!260598 (= e!168863 (isDefined!256 (getValueByKey!314 (toList!1914 (getCurrentListMap!1423 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504))) key!932)))))

(assert (= (and d!62537 c!44315) b!260596))

(assert (= (and d!62537 (not c!44315)) b!260597))

(assert (= (and d!62537 (not res!127337)) b!260598))

(declare-fun m!276033 () Bool)

(assert (=> d!62537 m!276033))

(declare-fun m!276035 () Bool)

(assert (=> b!260596 m!276035))

(declare-fun m!276037 () Bool)

(assert (=> b!260596 m!276037))

(assert (=> b!260596 m!276037))

(declare-fun m!276039 () Bool)

(assert (=> b!260596 m!276039))

(assert (=> b!260598 m!276037))

(assert (=> b!260598 m!276037))

(assert (=> b!260598 m!276039))

(assert (=> d!62319 d!62537))

(assert (=> d!62319 d!62303))

(declare-fun d!62539 () Bool)

(assert (=> d!62539 (contains!1870 (getCurrentListMap!1423 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) key!932)))

(assert (=> d!62539 true))

(declare-fun _$17!89 () Unit!8037)

(assert (=> d!62539 (= (choose!1273 (_keys!6973 thiss!1504) (_values!4777 thiss!1504) (mask!11119 thiss!1504) (extraKeys!4531 thiss!1504) (zeroValue!4635 thiss!1504) (minValue!4635 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4794 thiss!1504)) _$17!89)))

(declare-fun bs!9165 () Bool)

(assert (= bs!9165 d!62539))

(assert (=> bs!9165 m!275123))

(assert (=> bs!9165 m!275123))

(assert (=> bs!9165 m!275357))

(assert (=> d!62319 d!62539))

(assert (=> d!62319 d!62325))

(assert (=> b!260216 d!62353))

(declare-fun d!62541 () Bool)

(assert (=> d!62541 (= (arrayCountValidKeys!0 (array!12586 (store (arr!5956 (_keys!6973 thiss!1504)) index!297 key!932) (size!6306 (_keys!6973 thiss!1504))) #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6973 thiss!1504) #b00000000000000000000000000000000 (size!6306 (_keys!6973 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!62541 true))

(declare-fun _$84!42 () Unit!8037)

(assert (=> d!62541 (= (choose!1 (_keys!6973 thiss!1504) index!297 key!932) _$84!42)))

(declare-fun bs!9166 () Bool)

(assert (= bs!9166 d!62541))

(assert (=> bs!9166 m!275099))

(assert (=> bs!9166 m!275367))

(assert (=> bs!9166 m!275109))

(assert (=> d!62321 d!62541))

(assert (=> b!260187 d!62353))

(declare-fun d!62543 () Bool)

(assert (=> d!62543 (arrayContainsKey!0 lt!130908 lt!131127 #b00000000000000000000000000000000)))

(declare-fun lt!131367 () Unit!8037)

(assert (=> d!62543 (= lt!131367 (choose!13 lt!130908 lt!131127 #b00000000000000000000000000000000))))

(assert (=> d!62543 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!62543 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!130908 lt!131127 #b00000000000000000000000000000000) lt!131367)))

(declare-fun bs!9167 () Bool)

(assert (= bs!9167 d!62543))

(assert (=> bs!9167 m!275397))

(declare-fun m!276041 () Bool)

(assert (=> bs!9167 m!276041))

(assert (=> b!260156 d!62543))

(declare-fun d!62545 () Bool)

(declare-fun res!127338 () Bool)

(declare-fun e!168865 () Bool)

(assert (=> d!62545 (=> res!127338 e!168865)))

(assert (=> d!62545 (= res!127338 (= (select (arr!5956 lt!130908) #b00000000000000000000000000000000) lt!131127))))

(assert (=> d!62545 (= (arrayContainsKey!0 lt!130908 lt!131127 #b00000000000000000000000000000000) e!168865)))

(declare-fun b!260599 () Bool)

(declare-fun e!168866 () Bool)

(assert (=> b!260599 (= e!168865 e!168866)))

(declare-fun res!127339 () Bool)

(assert (=> b!260599 (=> (not res!127339) (not e!168866))))

(assert (=> b!260599 (= res!127339 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6306 lt!130908)))))

(declare-fun b!260600 () Bool)

(assert (=> b!260600 (= e!168866 (arrayContainsKey!0 lt!130908 lt!131127 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62545 (not res!127338)) b!260599))

(assert (= (and b!260599 res!127339) b!260600))

(assert (=> d!62545 m!275393))

(declare-fun m!276043 () Bool)

(assert (=> b!260600 m!276043))

(assert (=> b!260156 d!62545))

(declare-fun b!260601 () Bool)

(declare-fun lt!131370 () SeekEntryResult!1177)

(declare-fun e!168867 () SeekEntryResult!1177)

(assert (=> b!260601 (= e!168867 (seekKeyOrZeroReturnVacant!0 (x!25114 lt!131370) (index!6880 lt!131370) (index!6880 lt!131370) (select (arr!5956 lt!130908) #b00000000000000000000000000000000) lt!130908 (mask!11119 thiss!1504)))))

(declare-fun b!260602 () Bool)

(declare-fun e!168868 () SeekEntryResult!1177)

(assert (=> b!260602 (= e!168868 Undefined!1177)))

(declare-fun b!260603 () Bool)

(declare-fun e!168869 () SeekEntryResult!1177)

(assert (=> b!260603 (= e!168869 (Found!1177 (index!6880 lt!131370)))))

(declare-fun d!62547 () Bool)

(declare-fun lt!131368 () SeekEntryResult!1177)

(assert (=> d!62547 (and (or ((_ is Undefined!1177) lt!131368) (not ((_ is Found!1177) lt!131368)) (and (bvsge (index!6879 lt!131368) #b00000000000000000000000000000000) (bvslt (index!6879 lt!131368) (size!6306 lt!130908)))) (or ((_ is Undefined!1177) lt!131368) ((_ is Found!1177) lt!131368) (not ((_ is MissingZero!1177) lt!131368)) (and (bvsge (index!6878 lt!131368) #b00000000000000000000000000000000) (bvslt (index!6878 lt!131368) (size!6306 lt!130908)))) (or ((_ is Undefined!1177) lt!131368) ((_ is Found!1177) lt!131368) ((_ is MissingZero!1177) lt!131368) (not ((_ is MissingVacant!1177) lt!131368)) (and (bvsge (index!6881 lt!131368) #b00000000000000000000000000000000) (bvslt (index!6881 lt!131368) (size!6306 lt!130908)))) (or ((_ is Undefined!1177) lt!131368) (ite ((_ is Found!1177) lt!131368) (= (select (arr!5956 lt!130908) (index!6879 lt!131368)) (select (arr!5956 lt!130908) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1177) lt!131368) (= (select (arr!5956 lt!130908) (index!6878 lt!131368)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1177) lt!131368) (= (select (arr!5956 lt!130908) (index!6881 lt!131368)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62547 (= lt!131368 e!168868)))

(declare-fun c!44318 () Bool)

(assert (=> d!62547 (= c!44318 (and ((_ is Intermediate!1177) lt!131370) (undefined!1989 lt!131370)))))

(assert (=> d!62547 (= lt!131370 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5956 lt!130908) #b00000000000000000000000000000000) (mask!11119 thiss!1504)) (select (arr!5956 lt!130908) #b00000000000000000000000000000000) lt!130908 (mask!11119 thiss!1504)))))

(assert (=> d!62547 (validMask!0 (mask!11119 thiss!1504))))

(assert (=> d!62547 (= (seekEntryOrOpen!0 (select (arr!5956 lt!130908) #b00000000000000000000000000000000) lt!130908 (mask!11119 thiss!1504)) lt!131368)))

(declare-fun b!260604 () Bool)

(assert (=> b!260604 (= e!168867 (MissingZero!1177 (index!6880 lt!131370)))))

(declare-fun b!260605 () Bool)

(assert (=> b!260605 (= e!168868 e!168869)))

(declare-fun lt!131369 () (_ BitVec 64))

(assert (=> b!260605 (= lt!131369 (select (arr!5956 lt!130908) (index!6880 lt!131370)))))

(declare-fun c!44316 () Bool)

(assert (=> b!260605 (= c!44316 (= lt!131369 (select (arr!5956 lt!130908) #b00000000000000000000000000000000)))))

(declare-fun b!260606 () Bool)

(declare-fun c!44317 () Bool)

(assert (=> b!260606 (= c!44317 (= lt!131369 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260606 (= e!168869 e!168867)))

(assert (= (and d!62547 c!44318) b!260602))

(assert (= (and d!62547 (not c!44318)) b!260605))

(assert (= (and b!260605 c!44316) b!260603))

(assert (= (and b!260605 (not c!44316)) b!260606))

(assert (= (and b!260606 c!44317) b!260604))

(assert (= (and b!260606 (not c!44317)) b!260601))

(assert (=> b!260601 m!275393))

(declare-fun m!276045 () Bool)

(assert (=> b!260601 m!276045))

(declare-fun m!276047 () Bool)

(assert (=> d!62547 m!276047))

(declare-fun m!276049 () Bool)

(assert (=> d!62547 m!276049))

(assert (=> d!62547 m!275393))

(declare-fun m!276051 () Bool)

(assert (=> d!62547 m!276051))

(declare-fun m!276053 () Bool)

(assert (=> d!62547 m!276053))

(assert (=> d!62547 m!276051))

(assert (=> d!62547 m!275393))

(declare-fun m!276055 () Bool)

(assert (=> d!62547 m!276055))

(assert (=> d!62547 m!275079))

(declare-fun m!276057 () Bool)

(assert (=> b!260605 m!276057))

(assert (=> b!260156 d!62547))

(assert (=> d!62327 d!62351))

(declare-fun d!62549 () Bool)

(assert (=> d!62549 (arrayContainsKey!0 lt!130908 key!932 #b00000000000000000000000000000000)))

(assert (=> d!62549 true))

(declare-fun _$60!381 () Unit!8037)

(assert (=> d!62549 (= (choose!13 lt!130908 key!932 index!297) _$60!381)))

(declare-fun bs!9168 () Bool)

(assert (= bs!9168 d!62549))

(assert (=> bs!9168 m!275087))

(assert (=> d!62327 d!62549))

(assert (=> b!260218 d!62353))

(declare-fun d!62551 () Bool)

(declare-fun e!168870 () Bool)

(assert (=> d!62551 e!168870))

(declare-fun res!127340 () Bool)

(assert (=> d!62551 (=> res!127340 e!168870)))

(declare-fun lt!131371 () Bool)

(assert (=> d!62551 (= res!127340 (not lt!131371))))

(declare-fun lt!131374 () Bool)

(assert (=> d!62551 (= lt!131371 lt!131374)))

(declare-fun lt!131373 () Unit!8037)

(declare-fun e!168871 () Unit!8037)

(assert (=> d!62551 (= lt!131373 e!168871)))

(declare-fun c!44319 () Bool)

(assert (=> d!62551 (= c!44319 lt!131374)))

(assert (=> d!62551 (= lt!131374 (containsKey!306 (toList!1914 lt!131142) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62551 (= (contains!1870 lt!131142 #b1000000000000000000000000000000000000000000000000000000000000000) lt!131371)))

(declare-fun b!260607 () Bool)

(declare-fun lt!131372 () Unit!8037)

(assert (=> b!260607 (= e!168871 lt!131372)))

(assert (=> b!260607 (= lt!131372 (lemmaContainsKeyImpliesGetValueByKeyDefined!255 (toList!1914 lt!131142) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260607 (isDefined!256 (getValueByKey!314 (toList!1914 lt!131142) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260608 () Bool)

(declare-fun Unit!8063 () Unit!8037)

(assert (=> b!260608 (= e!168871 Unit!8063)))

(declare-fun b!260609 () Bool)

(assert (=> b!260609 (= e!168870 (isDefined!256 (getValueByKey!314 (toList!1914 lt!131142) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62551 c!44319) b!260607))

(assert (= (and d!62551 (not c!44319)) b!260608))

(assert (= (and d!62551 (not res!127340)) b!260609))

(declare-fun m!276059 () Bool)

(assert (=> d!62551 m!276059))

(declare-fun m!276061 () Bool)

(assert (=> b!260607 m!276061))

(assert (=> b!260607 m!275507))

(assert (=> b!260607 m!275507))

(declare-fun m!276063 () Bool)

(assert (=> b!260607 m!276063))

(assert (=> b!260609 m!275507))

(assert (=> b!260609 m!275507))

(assert (=> b!260609 m!276063))

(assert (=> bm!24802 d!62551))

(declare-fun b!260610 () Bool)

(declare-fun e!168872 () Bool)

(assert (=> b!260610 (= e!168872 tp_is_empty!6619)))

(declare-fun condMapEmpty!11289 () Bool)

(declare-fun mapDefault!11289 () ValueCell!2966)

(assert (=> mapNonEmpty!11288 (= condMapEmpty!11289 (= mapRest!11288 ((as const (Array (_ BitVec 32) ValueCell!2966)) mapDefault!11289)))))

(declare-fun e!168873 () Bool)

(declare-fun mapRes!11289 () Bool)

(assert (=> mapNonEmpty!11288 (= tp!23609 (and e!168873 mapRes!11289))))

(declare-fun b!260611 () Bool)

(assert (=> b!260611 (= e!168873 tp_is_empty!6619)))

(declare-fun mapNonEmpty!11289 () Bool)

(declare-fun tp!23610 () Bool)

(assert (=> mapNonEmpty!11289 (= mapRes!11289 (and tp!23610 e!168872))))

(declare-fun mapValue!11289 () ValueCell!2966)

(declare-fun mapKey!11289 () (_ BitVec 32))

(declare-fun mapRest!11289 () (Array (_ BitVec 32) ValueCell!2966))

(assert (=> mapNonEmpty!11289 (= mapRest!11288 (store mapRest!11289 mapKey!11289 mapValue!11289))))

(declare-fun mapIsEmpty!11289 () Bool)

(assert (=> mapIsEmpty!11289 mapRes!11289))

(assert (= (and mapNonEmpty!11288 condMapEmpty!11289) mapIsEmpty!11289))

(assert (= (and mapNonEmpty!11288 (not condMapEmpty!11289)) mapNonEmpty!11289))

(assert (= (and mapNonEmpty!11289 ((_ is ValueCellFull!2966) mapValue!11289)) b!260610))

(assert (= (and mapNonEmpty!11288 ((_ is ValueCellFull!2966) mapDefault!11289)) b!260611))

(declare-fun m!276065 () Bool)

(assert (=> mapNonEmpty!11289 m!276065))

(declare-fun b_lambda!8259 () Bool)

(assert (= b_lambda!8251 (or (and b!259851 b_free!6757) b_lambda!8259)))

(declare-fun b_lambda!8261 () Bool)

(assert (= b_lambda!8257 (or (and b!259851 b_free!6757) b_lambda!8261)))

(declare-fun b_lambda!8263 () Bool)

(assert (= b_lambda!8249 (or (and b!259851 b_free!6757) b_lambda!8263)))

(declare-fun b_lambda!8265 () Bool)

(assert (= b_lambda!8253 (or (and b!259851 b_free!6757) b_lambda!8265)))

(declare-fun b_lambda!8267 () Bool)

(assert (= b_lambda!8255 (or (and b!259851 b_free!6757) b_lambda!8267)))

(check-sat (not b!260495) (not b!260391) (not b_lambda!8261) (not b!260343) (not b!260397) (not bm!24835) (not b!260601) (not b!260358) (not bm!24847) (not d!62397) (not d!62517) (not b!260263) (not d!62463) (not b!260524) (not b!260342) (not d!62547) (not b!260590) (not d!62551) (not d!62431) (not b!260547) (not b!260403) (not b!260291) (not b!260598) (not d!62383) (not b!260486) (not d!62469) (not d!62427) (not d!62513) (not d!62549) (not b!260424) (not b!260405) (not d!62457) (not b!260301) (not b!260379) (not d!62413) (not bm!24828) (not b!260609) (not b!260435) (not bm!24818) (not d!62379) (not b!260273) (not d!62419) tp_is_empty!6619 (not d!62451) (not b!260585) (not d!62485) (not d!62459) (not b!260538) (not b!260335) (not d!62479) (not d!62489) (not d!62421) (not bm!24827) (not d!62415) (not bm!24826) (not b!260438) (not b!260302) (not b_next!6757) (not b!260468) (not bm!24814) (not b!260332) (not d!62539) (not b!260269) (not b!260466) (not bm!24833) (not b!260600) (not d!62475) (not d!62373) (not b!260415) (not b!260412) (not d!62385) (not b!260467) (not b!260587) (not b!260588) (not d!62439) (not b!260352) (not bm!24813) (not d!62449) (not bm!24820) (not b!260360) (not b!260264) (not bm!24830) (not bm!24846) (not b!260523) (not d!62417) (not b!260517) (not d!62435) (not bm!24819) (not b!260575) (not b!260433) (not mapNonEmpty!11289) (not bm!24836) (not b!260607) (not b!260255) (not d!62443) (not bm!24811) (not bm!24844) (not b!260494) (not b!260408) (not b!260579) (not b!260406) (not b!260418) (not b!260250) (not b!260259) (not b!260345) (not b!260333) (not b!260253) (not d!62409) (not d!62355) (not d!62465) (not d!62541) (not d!62537) (not b_lambda!8259) (not d!62471) (not d!62461) (not b!260402) (not b!260304) (not b_lambda!8267) (not d!62521) (not b!260593) (not d!62497) (not b!260307) (not d!62453) (not b!260530) (not d!62359) (not b!260428) (not d!62363) (not b!260248) (not b!260481) (not d!62407) (not b!260364) (not b!260383) (not d!62399) (not b!260351) (not d!62533) (not b!260427) (not d!62447) (not d!62543) (not b!260354) (not b_lambda!8245) (not d!62473) (not b!260536) (not d!62525) (not b!260548) (not b!260469) (not b!260483) (not d!62389) (not b!260340) (not d!62437) (not b!260334) (not b!260252) (not b!260416) (not d!62523) (not b!260479) (not d!62429) (not b_lambda!8247) (not d!62395) (not bm!24812) (not d!62357) (not d!62529) (not d!62371) (not b!260350) (not b!260541) (not b!260478) (not b!260361) (not b!260434) (not b!260477) (not d!62425) (not d!62411) (not b!260271) (not b!260581) (not b!260596) (not b!260591) (not b!260272) (not b!260429) (not bm!24817) (not d!62481) (not b!260578) (not b!260411) (not b!260525) (not b!260436) (not d!62477) (not bm!24825) (not b!260533) (not b!260414) (not b!260526) (not b!260534) (not b!260437) (not d!62519) (not b!260349) (not d!62467) b_and!13855 (not b!260404) (not d!62381) (not b!260586) (not b!260353) (not bm!24832) (not b!260594) (not b!260571) (not b!260431) (not b!260346) (not d!62455) (not b_lambda!8265) (not b!260527) (not d!62493) (not b!260265) (not b!260336) (not b!260384) (not b!260381) (not d!62441) (not d!62501) (not d!62433) (not b_lambda!8263) (not d!62487) (not b!260484) (not b!260375) (not d!62423) (not b!260531))
(check-sat b_and!13855 (not b_next!6757))
