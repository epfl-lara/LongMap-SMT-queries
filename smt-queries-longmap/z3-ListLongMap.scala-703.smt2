; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16724 () Bool)

(assert start!16724)

(declare-fun b!167877 () Bool)

(declare-fun b_free!4029 () Bool)

(declare-fun b_next!4029 () Bool)

(assert (=> b!167877 (= b_free!4029 (not b_next!4029))))

(declare-fun tp!14688 () Bool)

(declare-fun b_and!10443 () Bool)

(assert (=> b!167877 (= tp!14688 b_and!10443)))

(declare-fun e!110302 () Bool)

(declare-fun e!110304 () Bool)

(declare-datatypes ((V!4755 0))(
  ( (V!4756 (val!1960 Int)) )
))
(declare-datatypes ((ValueCell!1572 0))(
  ( (ValueCellFull!1572 (v!3825 V!4755)) (EmptyCell!1572) )
))
(declare-datatypes ((array!6759 0))(
  ( (array!6760 (arr!3215 (Array (_ BitVec 32) (_ BitVec 64))) (size!3503 (_ BitVec 32))) )
))
(declare-datatypes ((array!6761 0))(
  ( (array!6762 (arr!3216 (Array (_ BitVec 32) ValueCell!1572)) (size!3504 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2052 0))(
  ( (LongMapFixedSize!2053 (defaultEntry!3468 Int) (mask!8223 (_ BitVec 32)) (extraKeys!3209 (_ BitVec 32)) (zeroValue!3311 V!4755) (minValue!3311 V!4755) (_size!1075 (_ BitVec 32)) (_keys!5293 array!6759) (_values!3451 array!6761) (_vacant!1075 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2052)

(declare-fun tp_is_empty!3831 () Bool)

(declare-fun array_inv!2067 (array!6759) Bool)

(declare-fun array_inv!2068 (array!6761) Bool)

(assert (=> b!167877 (= e!110304 (and tp!14688 tp_is_empty!3831 (array_inv!2067 (_keys!5293 thiss!1248)) (array_inv!2068 (_values!3451 thiss!1248)) e!110302))))

(declare-fun b!167878 () Bool)

(declare-fun e!110309 () Bool)

(assert (=> b!167878 (= e!110309 true)))

(declare-fun lt!83928 () Bool)

(declare-datatypes ((List!2140 0))(
  ( (Nil!2137) (Cons!2136 (h!2753 (_ BitVec 64)) (t!6942 List!2140)) )
))
(declare-fun arrayNoDuplicates!0 (array!6759 (_ BitVec 32) List!2140) Bool)

(assert (=> b!167878 (= lt!83928 (arrayNoDuplicates!0 (_keys!5293 thiss!1248) #b00000000000000000000000000000000 Nil!2137))))

(declare-fun b!167879 () Bool)

(declare-fun e!110306 () Bool)

(declare-fun e!110307 () Bool)

(assert (=> b!167879 (= e!110306 e!110307)))

(declare-fun res!79877 () Bool)

(assert (=> b!167879 (=> (not res!79877) (not e!110307))))

(declare-datatypes ((SeekEntryResult!488 0))(
  ( (MissingZero!488 (index!4120 (_ BitVec 32))) (Found!488 (index!4121 (_ BitVec 32))) (Intermediate!488 (undefined!1300 Bool) (index!4122 (_ BitVec 32)) (x!18564 (_ BitVec 32))) (Undefined!488) (MissingVacant!488 (index!4123 (_ BitVec 32))) )
))
(declare-fun lt!83923 () SeekEntryResult!488)

(get-info :version)

(assert (=> b!167879 (= res!79877 (and (not ((_ is Undefined!488) lt!83923)) (not ((_ is MissingVacant!488) lt!83923)) (not ((_ is MissingZero!488) lt!83923)) ((_ is Found!488) lt!83923)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6759 (_ BitVec 32)) SeekEntryResult!488)

(assert (=> b!167879 (= lt!83923 (seekEntryOrOpen!0 key!828 (_keys!5293 thiss!1248) (mask!8223 thiss!1248)))))

(declare-fun mapNonEmpty!6465 () Bool)

(declare-fun mapRes!6465 () Bool)

(declare-fun tp!14687 () Bool)

(declare-fun e!110305 () Bool)

(assert (=> mapNonEmpty!6465 (= mapRes!6465 (and tp!14687 e!110305))))

(declare-fun mapValue!6465 () ValueCell!1572)

(declare-fun mapKey!6465 () (_ BitVec 32))

(declare-fun mapRest!6465 () (Array (_ BitVec 32) ValueCell!1572))

(assert (=> mapNonEmpty!6465 (= (arr!3216 (_values!3451 thiss!1248)) (store mapRest!6465 mapKey!6465 mapValue!6465))))

(declare-fun b!167880 () Bool)

(assert (=> b!167880 (= e!110307 (not e!110309))))

(declare-fun res!79878 () Bool)

(assert (=> b!167880 (=> res!79878 e!110309)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167880 (= res!79878 (not (validMask!0 (mask!8223 thiss!1248))))))

(declare-datatypes ((tuple2!3152 0))(
  ( (tuple2!3153 (_1!1587 (_ BitVec 64)) (_2!1587 V!4755)) )
))
(declare-datatypes ((List!2141 0))(
  ( (Nil!2138) (Cons!2137 (h!2754 tuple2!3152) (t!6943 List!2141)) )
))
(declare-datatypes ((ListLongMap!2107 0))(
  ( (ListLongMap!2108 (toList!1069 List!2141)) )
))
(declare-fun lt!83924 () ListLongMap!2107)

(declare-fun v!309 () V!4755)

(declare-fun +!221 (ListLongMap!2107 tuple2!3152) ListLongMap!2107)

(declare-fun getCurrentListMap!727 (array!6759 array!6761 (_ BitVec 32) (_ BitVec 32) V!4755 V!4755 (_ BitVec 32) Int) ListLongMap!2107)

(assert (=> b!167880 (= (+!221 lt!83924 (tuple2!3153 key!828 v!309)) (getCurrentListMap!727 (_keys!5293 thiss!1248) (array!6762 (store (arr!3216 (_values!3451 thiss!1248)) (index!4121 lt!83923) (ValueCellFull!1572 v!309)) (size!3504 (_values!3451 thiss!1248))) (mask!8223 thiss!1248) (extraKeys!3209 thiss!1248) (zeroValue!3311 thiss!1248) (minValue!3311 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3468 thiss!1248)))))

(declare-datatypes ((Unit!5148 0))(
  ( (Unit!5149) )
))
(declare-fun lt!83927 () Unit!5148)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!76 (array!6759 array!6761 (_ BitVec 32) (_ BitVec 32) V!4755 V!4755 (_ BitVec 32) (_ BitVec 64) V!4755 Int) Unit!5148)

(assert (=> b!167880 (= lt!83927 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!76 (_keys!5293 thiss!1248) (_values!3451 thiss!1248) (mask!8223 thiss!1248) (extraKeys!3209 thiss!1248) (zeroValue!3311 thiss!1248) (minValue!3311 thiss!1248) (index!4121 lt!83923) key!828 v!309 (defaultEntry!3468 thiss!1248)))))

(declare-fun lt!83929 () Unit!5148)

(declare-fun e!110308 () Unit!5148)

(assert (=> b!167880 (= lt!83929 e!110308)))

(declare-fun c!30325 () Bool)

(declare-fun contains!1111 (ListLongMap!2107 (_ BitVec 64)) Bool)

(assert (=> b!167880 (= c!30325 (contains!1111 lt!83924 key!828))))

(assert (=> b!167880 (= lt!83924 (getCurrentListMap!727 (_keys!5293 thiss!1248) (_values!3451 thiss!1248) (mask!8223 thiss!1248) (extraKeys!3209 thiss!1248) (zeroValue!3311 thiss!1248) (minValue!3311 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3468 thiss!1248)))))

(declare-fun b!167881 () Bool)

(declare-fun lt!83926 () Unit!5148)

(assert (=> b!167881 (= e!110308 lt!83926)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!112 (array!6759 array!6761 (_ BitVec 32) (_ BitVec 32) V!4755 V!4755 (_ BitVec 64) Int) Unit!5148)

(assert (=> b!167881 (= lt!83926 (lemmaInListMapThenSeekEntryOrOpenFindsIt!112 (_keys!5293 thiss!1248) (_values!3451 thiss!1248) (mask!8223 thiss!1248) (extraKeys!3209 thiss!1248) (zeroValue!3311 thiss!1248) (minValue!3311 thiss!1248) key!828 (defaultEntry!3468 thiss!1248)))))

(declare-fun res!79880 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167881 (= res!79880 (inRange!0 (index!4121 lt!83923) (mask!8223 thiss!1248)))))

(declare-fun e!110301 () Bool)

(assert (=> b!167881 (=> (not res!79880) (not e!110301))))

(assert (=> b!167881 e!110301))

(declare-fun b!167882 () Bool)

(declare-fun res!79879 () Bool)

(assert (=> b!167882 (=> (not res!79879) (not e!110306))))

(assert (=> b!167882 (= res!79879 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167883 () Bool)

(declare-fun e!110303 () Bool)

(assert (=> b!167883 (= e!110303 tp_is_empty!3831)))

(declare-fun b!167884 () Bool)

(assert (=> b!167884 (= e!110301 (= (select (arr!3215 (_keys!5293 thiss!1248)) (index!4121 lt!83923)) key!828))))

(declare-fun res!79875 () Bool)

(assert (=> start!16724 (=> (not res!79875) (not e!110306))))

(declare-fun valid!892 (LongMapFixedSize!2052) Bool)

(assert (=> start!16724 (= res!79875 (valid!892 thiss!1248))))

(assert (=> start!16724 e!110306))

(assert (=> start!16724 e!110304))

(assert (=> start!16724 true))

(assert (=> start!16724 tp_is_empty!3831))

(declare-fun mapIsEmpty!6465 () Bool)

(assert (=> mapIsEmpty!6465 mapRes!6465))

(declare-fun b!167885 () Bool)

(declare-fun res!79876 () Bool)

(assert (=> b!167885 (=> res!79876 e!110309)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6759 (_ BitVec 32)) Bool)

(assert (=> b!167885 (= res!79876 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5293 thiss!1248) (mask!8223 thiss!1248))))))

(declare-fun b!167886 () Bool)

(declare-fun res!79881 () Bool)

(assert (=> b!167886 (=> res!79881 e!110309)))

(assert (=> b!167886 (= res!79881 (or (not (= (size!3504 (_values!3451 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8223 thiss!1248)))) (not (= (size!3503 (_keys!5293 thiss!1248)) (size!3504 (_values!3451 thiss!1248)))) (bvslt (mask!8223 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3209 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3209 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!167887 () Bool)

(assert (=> b!167887 (= e!110305 tp_is_empty!3831)))

(declare-fun b!167888 () Bool)

(assert (=> b!167888 (= e!110302 (and e!110303 mapRes!6465))))

(declare-fun condMapEmpty!6465 () Bool)

(declare-fun mapDefault!6465 () ValueCell!1572)

(assert (=> b!167888 (= condMapEmpty!6465 (= (arr!3216 (_values!3451 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1572)) mapDefault!6465)))))

(declare-fun b!167889 () Bool)

(declare-fun Unit!5150 () Unit!5148)

(assert (=> b!167889 (= e!110308 Unit!5150)))

(declare-fun lt!83925 () Unit!5148)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!113 (array!6759 array!6761 (_ BitVec 32) (_ BitVec 32) V!4755 V!4755 (_ BitVec 64) Int) Unit!5148)

(assert (=> b!167889 (= lt!83925 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!113 (_keys!5293 thiss!1248) (_values!3451 thiss!1248) (mask!8223 thiss!1248) (extraKeys!3209 thiss!1248) (zeroValue!3311 thiss!1248) (minValue!3311 thiss!1248) key!828 (defaultEntry!3468 thiss!1248)))))

(assert (=> b!167889 false))

(assert (= (and start!16724 res!79875) b!167882))

(assert (= (and b!167882 res!79879) b!167879))

(assert (= (and b!167879 res!79877) b!167880))

(assert (= (and b!167880 c!30325) b!167881))

(assert (= (and b!167880 (not c!30325)) b!167889))

(assert (= (and b!167881 res!79880) b!167884))

(assert (= (and b!167880 (not res!79878)) b!167886))

(assert (= (and b!167886 (not res!79881)) b!167885))

(assert (= (and b!167885 (not res!79876)) b!167878))

(assert (= (and b!167888 condMapEmpty!6465) mapIsEmpty!6465))

(assert (= (and b!167888 (not condMapEmpty!6465)) mapNonEmpty!6465))

(assert (= (and mapNonEmpty!6465 ((_ is ValueCellFull!1572) mapValue!6465)) b!167887))

(assert (= (and b!167888 ((_ is ValueCellFull!1572) mapDefault!6465)) b!167883))

(assert (= b!167877 b!167888))

(assert (= start!16724 b!167877))

(declare-fun m!196995 () Bool)

(assert (=> b!167884 m!196995))

(declare-fun m!196997 () Bool)

(assert (=> b!167885 m!196997))

(declare-fun m!196999 () Bool)

(assert (=> b!167880 m!196999))

(declare-fun m!197001 () Bool)

(assert (=> b!167880 m!197001))

(declare-fun m!197003 () Bool)

(assert (=> b!167880 m!197003))

(declare-fun m!197005 () Bool)

(assert (=> b!167880 m!197005))

(declare-fun m!197007 () Bool)

(assert (=> b!167880 m!197007))

(declare-fun m!197009 () Bool)

(assert (=> b!167880 m!197009))

(declare-fun m!197011 () Bool)

(assert (=> b!167880 m!197011))

(declare-fun m!197013 () Bool)

(assert (=> b!167881 m!197013))

(declare-fun m!197015 () Bool)

(assert (=> b!167881 m!197015))

(declare-fun m!197017 () Bool)

(assert (=> b!167877 m!197017))

(declare-fun m!197019 () Bool)

(assert (=> b!167877 m!197019))

(declare-fun m!197021 () Bool)

(assert (=> b!167878 m!197021))

(declare-fun m!197023 () Bool)

(assert (=> start!16724 m!197023))

(declare-fun m!197025 () Bool)

(assert (=> b!167889 m!197025))

(declare-fun m!197027 () Bool)

(assert (=> b!167879 m!197027))

(declare-fun m!197029 () Bool)

(assert (=> mapNonEmpty!6465 m!197029))

(check-sat tp_is_empty!3831 (not b!167885) (not b_next!4029) (not b!167877) (not b!167878) b_and!10443 (not mapNonEmpty!6465) (not b!167881) (not start!16724) (not b!167889) (not b!167880) (not b!167879))
(check-sat b_and!10443 (not b_next!4029))
