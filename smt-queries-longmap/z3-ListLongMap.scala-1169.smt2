; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25022 () Bool)

(assert start!25022)

(declare-fun b!260854 () Bool)

(declare-fun b_free!6763 () Bool)

(declare-fun b_next!6763 () Bool)

(assert (=> b!260854 (= b_free!6763 (not b_next!6763))))

(declare-fun tp!23615 () Bool)

(declare-fun b_and!13897 () Bool)

(assert (=> b!260854 (= tp!23615 b_and!13897)))

(declare-fun b!260848 () Bool)

(declare-datatypes ((Unit!8084 0))(
  ( (Unit!8085) )
))
(declare-fun e!169033 () Unit!8084)

(declare-fun Unit!8086 () Unit!8084)

(assert (=> b!260848 (= e!169033 Unit!8086)))

(declare-fun lt!131648 () Unit!8084)

(declare-datatypes ((V!8481 0))(
  ( (V!8482 (val!3357 Int)) )
))
(declare-datatypes ((ValueCell!2969 0))(
  ( (ValueCellFull!2969 (v!5477 V!8481)) (EmptyCell!2969) )
))
(declare-datatypes ((array!12603 0))(
  ( (array!12604 (arr!5965 (Array (_ BitVec 32) ValueCell!2969)) (size!6315 (_ BitVec 32))) )
))
(declare-datatypes ((array!12605 0))(
  ( (array!12606 (arr!5966 (Array (_ BitVec 32) (_ BitVec 64))) (size!6316 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3838 0))(
  ( (LongMapFixedSize!3839 (defaultEntry!4807 Int) (mask!11144 (_ BitVec 32)) (extraKeys!4544 (_ BitVec 32)) (zeroValue!4648 V!8481) (minValue!4648 V!8481) (_size!1968 (_ BitVec 32)) (_keys!6991 array!12605) (_values!4790 array!12603) (_vacant!1968 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3838)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!258 (array!12605 array!12603 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 64) (_ BitVec 32) Int) Unit!8084)

(assert (=> b!260848 (= lt!131648 (lemmaArrayContainsKeyThenInListMap!258 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(assert (=> b!260848 false))

(declare-fun b!260849 () Bool)

(declare-fun e!169041 () Bool)

(declare-fun e!169031 () Bool)

(assert (=> b!260849 (= e!169041 e!169031)))

(declare-fun res!127478 () Bool)

(assert (=> b!260849 (=> (not res!127478) (not e!169031))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260849 (= res!127478 (inRange!0 index!297 (mask!11144 thiss!1504)))))

(declare-fun lt!131651 () Unit!8084)

(declare-fun e!169035 () Unit!8084)

(assert (=> b!260849 (= lt!131651 e!169035)))

(declare-fun c!44368 () Bool)

(declare-datatypes ((tuple2!4860 0))(
  ( (tuple2!4861 (_1!2441 (_ BitVec 64)) (_2!2441 V!8481)) )
))
(declare-datatypes ((List!3738 0))(
  ( (Nil!3735) (Cons!3734 (h!4399 tuple2!4860) (t!8801 List!3738)) )
))
(declare-datatypes ((ListLongMap!3775 0))(
  ( (ListLongMap!3776 (toList!1903 List!3738)) )
))
(declare-fun lt!131643 () ListLongMap!3775)

(declare-fun contains!1870 (ListLongMap!3775 (_ BitVec 64)) Bool)

(assert (=> b!260849 (= c!44368 (contains!1870 lt!131643 key!932))))

(declare-fun getCurrentListMap!1435 (array!12605 array!12603 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 32) Int) ListLongMap!3775)

(assert (=> b!260849 (= lt!131643 (getCurrentListMap!1435 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun b!260850 () Bool)

(declare-fun e!169038 () Bool)

(declare-fun e!169039 () Bool)

(assert (=> b!260850 (= e!169038 e!169039)))

(declare-fun res!127483 () Bool)

(declare-fun call!24867 () Bool)

(assert (=> b!260850 (= res!127483 call!24867)))

(assert (=> b!260850 (=> (not res!127483) (not e!169039))))

(declare-fun b!260851 () Bool)

(declare-fun c!44367 () Bool)

(declare-datatypes ((SeekEntryResult!1151 0))(
  ( (MissingZero!1151 (index!6774 (_ BitVec 32))) (Found!1151 (index!6775 (_ BitVec 32))) (Intermediate!1151 (undefined!1963 Bool) (index!6776 (_ BitVec 32)) (x!25115 (_ BitVec 32))) (Undefined!1151) (MissingVacant!1151 (index!6777 (_ BitVec 32))) )
))
(declare-fun lt!131646 () SeekEntryResult!1151)

(get-info :version)

(assert (=> b!260851 (= c!44367 ((_ is MissingVacant!1151) lt!131646))))

(declare-fun e!169042 () Bool)

(assert (=> b!260851 (= e!169042 e!169038)))

(declare-fun b!260852 () Bool)

(declare-fun e!169043 () Bool)

(assert (=> b!260852 (= e!169031 (not e!169043))))

(declare-fun res!127475 () Bool)

(assert (=> b!260852 (=> res!127475 e!169043)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!260852 (= res!127475 (not (validMask!0 (mask!11144 thiss!1504))))))

(declare-fun lt!131647 () array!12605)

(declare-fun arrayCountValidKeys!0 (array!12605 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!260852 (= (arrayCountValidKeys!0 lt!131647 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!131649 () Unit!8084)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12605 (_ BitVec 32)) Unit!8084)

(assert (=> b!260852 (= lt!131649 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!131647 index!297))))

(declare-fun arrayContainsKey!0 (array!12605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!260852 (arrayContainsKey!0 lt!131647 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!131650 () Unit!8084)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12605 (_ BitVec 64) (_ BitVec 32)) Unit!8084)

(assert (=> b!260852 (= lt!131650 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131647 key!932 index!297))))

(declare-fun v!346 () V!8481)

(declare-fun +!700 (ListLongMap!3775 tuple2!4860) ListLongMap!3775)

(assert (=> b!260852 (= (+!700 lt!131643 (tuple2!4861 key!932 v!346)) (getCurrentListMap!1435 lt!131647 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131656 () Unit!8084)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!115 (array!12605 array!12603 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 32) (_ BitVec 64) V!8481 Int) Unit!8084)

(assert (=> b!260852 (= lt!131656 (lemmaAddValidKeyToArrayThenAddPairToListMap!115 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) index!297 key!932 v!346 (defaultEntry!4807 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12605 (_ BitVec 32)) Bool)

(assert (=> b!260852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!131647 (mask!11144 thiss!1504))))

(declare-fun lt!131654 () Unit!8084)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12605 (_ BitVec 32) (_ BitVec 32)) Unit!8084)

(assert (=> b!260852 (= lt!131654 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6991 thiss!1504) index!297 (mask!11144 thiss!1504)))))

(assert (=> b!260852 (= (arrayCountValidKeys!0 lt!131647 #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6991 thiss!1504) #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504)))))))

(declare-fun lt!131652 () Unit!8084)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12605 (_ BitVec 32) (_ BitVec 64)) Unit!8084)

(assert (=> b!260852 (= lt!131652 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6991 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3739 0))(
  ( (Nil!3736) (Cons!3735 (h!4400 (_ BitVec 64)) (t!8802 List!3739)) )
))
(declare-fun arrayNoDuplicates!0 (array!12605 (_ BitVec 32) List!3739) Bool)

(assert (=> b!260852 (arrayNoDuplicates!0 lt!131647 #b00000000000000000000000000000000 Nil!3736)))

(assert (=> b!260852 (= lt!131647 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))))))

(declare-fun lt!131645 () Unit!8084)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12605 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3739) Unit!8084)

(assert (=> b!260852 (= lt!131645 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6991 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3736))))

(declare-fun lt!131655 () Unit!8084)

(assert (=> b!260852 (= lt!131655 e!169033)))

(declare-fun c!44370 () Bool)

(assert (=> b!260852 (= c!44370 (arrayContainsKey!0 (_keys!6991 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!260853 () Bool)

(assert (=> b!260853 (= e!169043 (or (not (= (size!6315 (_values!4790 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11144 thiss!1504)))) (not (= (size!6316 (_keys!6991 thiss!1504)) (size!6315 (_values!4790 thiss!1504)))) (bvslt (mask!11144 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4544 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4544 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun e!169040 () Bool)

(declare-fun tp_is_empty!6625 () Bool)

(declare-fun e!169030 () Bool)

(declare-fun array_inv!3929 (array!12605) Bool)

(declare-fun array_inv!3930 (array!12603) Bool)

(assert (=> b!260854 (= e!169040 (and tp!23615 tp_is_empty!6625 (array_inv!3929 (_keys!6991 thiss!1504)) (array_inv!3930 (_values!4790 thiss!1504)) e!169030))))

(declare-fun bm!24864 () Bool)

(declare-fun c!44369 () Bool)

(assert (=> bm!24864 (= call!24867 (inRange!0 (ite c!44369 (index!6774 lt!131646) (index!6777 lt!131646)) (mask!11144 thiss!1504)))))

(declare-fun b!260855 () Bool)

(declare-fun Unit!8087 () Unit!8084)

(assert (=> b!260855 (= e!169033 Unit!8087)))

(declare-fun b!260856 () Bool)

(declare-fun lt!131653 () Unit!8084)

(assert (=> b!260856 (= e!169035 lt!131653)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!432 (array!12605 array!12603 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 64) Int) Unit!8084)

(assert (=> b!260856 (= lt!131653 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!432 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 (defaultEntry!4807 thiss!1504)))))

(assert (=> b!260856 (= c!44369 ((_ is MissingZero!1151) lt!131646))))

(assert (=> b!260856 e!169042))

(declare-fun mapNonEmpty!11292 () Bool)

(declare-fun mapRes!11292 () Bool)

(declare-fun tp!23616 () Bool)

(declare-fun e!169032 () Bool)

(assert (=> mapNonEmpty!11292 (= mapRes!11292 (and tp!23616 e!169032))))

(declare-fun mapRest!11292 () (Array (_ BitVec 32) ValueCell!2969))

(declare-fun mapKey!11292 () (_ BitVec 32))

(declare-fun mapValue!11292 () ValueCell!2969)

(assert (=> mapNonEmpty!11292 (= (arr!5965 (_values!4790 thiss!1504)) (store mapRest!11292 mapKey!11292 mapValue!11292))))

(declare-fun res!127480 () Bool)

(declare-fun e!169036 () Bool)

(assert (=> start!25022 (=> (not res!127480) (not e!169036))))

(declare-fun valid!1505 (LongMapFixedSize!3838) Bool)

(assert (=> start!25022 (= res!127480 (valid!1505 thiss!1504))))

(assert (=> start!25022 e!169036))

(assert (=> start!25022 e!169040))

(assert (=> start!25022 true))

(assert (=> start!25022 tp_is_empty!6625))

(declare-fun b!260857 () Bool)

(declare-fun e!169037 () Bool)

(assert (=> b!260857 (= e!169030 (and e!169037 mapRes!11292))))

(declare-fun condMapEmpty!11292 () Bool)

(declare-fun mapDefault!11292 () ValueCell!2969)

(assert (=> b!260857 (= condMapEmpty!11292 (= (arr!5965 (_values!4790 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2969)) mapDefault!11292)))))

(declare-fun b!260858 () Bool)

(assert (=> b!260858 (= e!169036 e!169041)))

(declare-fun res!127477 () Bool)

(assert (=> b!260858 (=> (not res!127477) (not e!169041))))

(assert (=> b!260858 (= res!127477 (or (= lt!131646 (MissingZero!1151 index!297)) (= lt!131646 (MissingVacant!1151 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12605 (_ BitVec 32)) SeekEntryResult!1151)

(assert (=> b!260858 (= lt!131646 (seekEntryOrOpen!0 key!932 (_keys!6991 thiss!1504) (mask!11144 thiss!1504)))))

(declare-fun b!260859 () Bool)

(declare-fun res!127479 () Bool)

(declare-fun e!169029 () Bool)

(assert (=> b!260859 (=> (not res!127479) (not e!169029))))

(assert (=> b!260859 (= res!127479 (= (select (arr!5966 (_keys!6991 thiss!1504)) (index!6774 lt!131646)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260860 () Bool)

(assert (=> b!260860 (= e!169032 tp_is_empty!6625)))

(declare-fun b!260861 () Bool)

(declare-fun Unit!8088 () Unit!8084)

(assert (=> b!260861 (= e!169035 Unit!8088)))

(declare-fun lt!131644 () Unit!8084)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!441 (array!12605 array!12603 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 64) Int) Unit!8084)

(assert (=> b!260861 (= lt!131644 (lemmaInListMapThenSeekEntryOrOpenFindsIt!441 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 (defaultEntry!4807 thiss!1504)))))

(assert (=> b!260861 false))

(declare-fun b!260862 () Bool)

(declare-fun res!127482 () Bool)

(assert (=> b!260862 (=> (not res!127482) (not e!169036))))

(assert (=> b!260862 (= res!127482 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!260863 () Bool)

(declare-fun call!24868 () Bool)

(assert (=> b!260863 (= e!169029 (not call!24868))))

(declare-fun b!260864 () Bool)

(assert (=> b!260864 (= e!169037 tp_is_empty!6625)))

(declare-fun b!260865 () Bool)

(declare-fun res!127481 () Bool)

(assert (=> b!260865 (= res!127481 (= (select (arr!5966 (_keys!6991 thiss!1504)) (index!6777 lt!131646)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260865 (=> (not res!127481) (not e!169039))))

(declare-fun b!260866 () Bool)

(assert (=> b!260866 (= e!169038 ((_ is Undefined!1151) lt!131646))))

(declare-fun b!260867 () Bool)

(declare-fun res!127476 () Bool)

(assert (=> b!260867 (=> (not res!127476) (not e!169029))))

(assert (=> b!260867 (= res!127476 call!24867)))

(assert (=> b!260867 (= e!169042 e!169029)))

(declare-fun mapIsEmpty!11292 () Bool)

(assert (=> mapIsEmpty!11292 mapRes!11292))

(declare-fun bm!24865 () Bool)

(assert (=> bm!24865 (= call!24868 (arrayContainsKey!0 (_keys!6991 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!260868 () Bool)

(assert (=> b!260868 (= e!169039 (not call!24868))))

(assert (= (and start!25022 res!127480) b!260862))

(assert (= (and b!260862 res!127482) b!260858))

(assert (= (and b!260858 res!127477) b!260849))

(assert (= (and b!260849 c!44368) b!260861))

(assert (= (and b!260849 (not c!44368)) b!260856))

(assert (= (and b!260856 c!44369) b!260867))

(assert (= (and b!260856 (not c!44369)) b!260851))

(assert (= (and b!260867 res!127476) b!260859))

(assert (= (and b!260859 res!127479) b!260863))

(assert (= (and b!260851 c!44367) b!260850))

(assert (= (and b!260851 (not c!44367)) b!260866))

(assert (= (and b!260850 res!127483) b!260865))

(assert (= (and b!260865 res!127481) b!260868))

(assert (= (or b!260867 b!260850) bm!24864))

(assert (= (or b!260863 b!260868) bm!24865))

(assert (= (and b!260849 res!127478) b!260852))

(assert (= (and b!260852 c!44370) b!260848))

(assert (= (and b!260852 (not c!44370)) b!260855))

(assert (= (and b!260852 (not res!127475)) b!260853))

(assert (= (and b!260857 condMapEmpty!11292) mapIsEmpty!11292))

(assert (= (and b!260857 (not condMapEmpty!11292)) mapNonEmpty!11292))

(assert (= (and mapNonEmpty!11292 ((_ is ValueCellFull!2969) mapValue!11292)) b!260860))

(assert (= (and b!260857 ((_ is ValueCellFull!2969) mapDefault!11292)) b!260864))

(assert (= b!260854 b!260857))

(assert (= start!25022 b!260854))

(declare-fun m!276865 () Bool)

(assert (=> b!260852 m!276865))

(declare-fun m!276867 () Bool)

(assert (=> b!260852 m!276867))

(declare-fun m!276869 () Bool)

(assert (=> b!260852 m!276869))

(declare-fun m!276871 () Bool)

(assert (=> b!260852 m!276871))

(declare-fun m!276873 () Bool)

(assert (=> b!260852 m!276873))

(declare-fun m!276875 () Bool)

(assert (=> b!260852 m!276875))

(declare-fun m!276877 () Bool)

(assert (=> b!260852 m!276877))

(declare-fun m!276879 () Bool)

(assert (=> b!260852 m!276879))

(declare-fun m!276881 () Bool)

(assert (=> b!260852 m!276881))

(declare-fun m!276883 () Bool)

(assert (=> b!260852 m!276883))

(declare-fun m!276885 () Bool)

(assert (=> b!260852 m!276885))

(declare-fun m!276887 () Bool)

(assert (=> b!260852 m!276887))

(declare-fun m!276889 () Bool)

(assert (=> b!260852 m!276889))

(declare-fun m!276891 () Bool)

(assert (=> b!260852 m!276891))

(declare-fun m!276893 () Bool)

(assert (=> b!260852 m!276893))

(declare-fun m!276895 () Bool)

(assert (=> b!260852 m!276895))

(declare-fun m!276897 () Bool)

(assert (=> b!260852 m!276897))

(declare-fun m!276899 () Bool)

(assert (=> b!260852 m!276899))

(declare-fun m!276901 () Bool)

(assert (=> b!260859 m!276901))

(declare-fun m!276903 () Bool)

(assert (=> mapNonEmpty!11292 m!276903))

(assert (=> bm!24865 m!276867))

(declare-fun m!276905 () Bool)

(assert (=> b!260861 m!276905))

(declare-fun m!276907 () Bool)

(assert (=> b!260856 m!276907))

(declare-fun m!276909 () Bool)

(assert (=> b!260865 m!276909))

(declare-fun m!276911 () Bool)

(assert (=> start!25022 m!276911))

(declare-fun m!276913 () Bool)

(assert (=> b!260858 m!276913))

(declare-fun m!276915 () Bool)

(assert (=> b!260854 m!276915))

(declare-fun m!276917 () Bool)

(assert (=> b!260854 m!276917))

(declare-fun m!276919 () Bool)

(assert (=> b!260849 m!276919))

(declare-fun m!276921 () Bool)

(assert (=> b!260849 m!276921))

(declare-fun m!276923 () Bool)

(assert (=> b!260849 m!276923))

(declare-fun m!276925 () Bool)

(assert (=> b!260848 m!276925))

(declare-fun m!276927 () Bool)

(assert (=> bm!24864 m!276927))

(check-sat (not b!260848) (not bm!24865) (not mapNonEmpty!11292) (not start!25022) tp_is_empty!6625 (not b!260849) (not b_next!6763) (not b!260852) (not b!260854) (not b!260856) b_and!13897 (not b!260861) (not bm!24864) (not b!260858))
(check-sat b_and!13897 (not b_next!6763))
(get-model)

(declare-fun d!62777 () Bool)

(declare-fun res!127542 () Bool)

(declare-fun e!169138 () Bool)

(assert (=> d!62777 (=> res!127542 e!169138)))

(assert (=> d!62777 (= res!127542 (= (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62777 (= (arrayContainsKey!0 (_keys!6991 thiss!1504) key!932 #b00000000000000000000000000000000) e!169138)))

(declare-fun b!260999 () Bool)

(declare-fun e!169139 () Bool)

(assert (=> b!260999 (= e!169138 e!169139)))

(declare-fun res!127543 () Bool)

(assert (=> b!260999 (=> (not res!127543) (not e!169139))))

(assert (=> b!260999 (= res!127543 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6316 (_keys!6991 thiss!1504))))))

(declare-fun b!261000 () Bool)

(assert (=> b!261000 (= e!169139 (arrayContainsKey!0 (_keys!6991 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62777 (not res!127542)) b!260999))

(assert (= (and b!260999 res!127543) b!261000))

(declare-fun m!277057 () Bool)

(assert (=> d!62777 m!277057))

(declare-fun m!277059 () Bool)

(assert (=> b!261000 m!277059))

(assert (=> bm!24865 d!62777))

(declare-fun d!62779 () Bool)

(assert (=> d!62779 (= (inRange!0 (ite c!44369 (index!6774 lt!131646) (index!6777 lt!131646)) (mask!11144 thiss!1504)) (and (bvsge (ite c!44369 (index!6774 lt!131646) (index!6777 lt!131646)) #b00000000000000000000000000000000) (bvslt (ite c!44369 (index!6774 lt!131646) (index!6777 lt!131646)) (bvadd (mask!11144 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24864 d!62779))

(declare-fun e!169147 () SeekEntryResult!1151)

(declare-fun lt!131748 () SeekEntryResult!1151)

(declare-fun b!261013 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12605 (_ BitVec 32)) SeekEntryResult!1151)

(assert (=> b!261013 (= e!169147 (seekKeyOrZeroReturnVacant!0 (x!25115 lt!131748) (index!6776 lt!131748) (index!6776 lt!131748) key!932 (_keys!6991 thiss!1504) (mask!11144 thiss!1504)))))

(declare-fun b!261014 () Bool)

(declare-fun e!169148 () SeekEntryResult!1151)

(declare-fun e!169146 () SeekEntryResult!1151)

(assert (=> b!261014 (= e!169148 e!169146)))

(declare-fun lt!131749 () (_ BitVec 64))

(assert (=> b!261014 (= lt!131749 (select (arr!5966 (_keys!6991 thiss!1504)) (index!6776 lt!131748)))))

(declare-fun c!44403 () Bool)

(assert (=> b!261014 (= c!44403 (= lt!131749 key!932))))

(declare-fun d!62781 () Bool)

(declare-fun lt!131747 () SeekEntryResult!1151)

(assert (=> d!62781 (and (or ((_ is Undefined!1151) lt!131747) (not ((_ is Found!1151) lt!131747)) (and (bvsge (index!6775 lt!131747) #b00000000000000000000000000000000) (bvslt (index!6775 lt!131747) (size!6316 (_keys!6991 thiss!1504))))) (or ((_ is Undefined!1151) lt!131747) ((_ is Found!1151) lt!131747) (not ((_ is MissingZero!1151) lt!131747)) (and (bvsge (index!6774 lt!131747) #b00000000000000000000000000000000) (bvslt (index!6774 lt!131747) (size!6316 (_keys!6991 thiss!1504))))) (or ((_ is Undefined!1151) lt!131747) ((_ is Found!1151) lt!131747) ((_ is MissingZero!1151) lt!131747) (not ((_ is MissingVacant!1151) lt!131747)) (and (bvsge (index!6777 lt!131747) #b00000000000000000000000000000000) (bvslt (index!6777 lt!131747) (size!6316 (_keys!6991 thiss!1504))))) (or ((_ is Undefined!1151) lt!131747) (ite ((_ is Found!1151) lt!131747) (= (select (arr!5966 (_keys!6991 thiss!1504)) (index!6775 lt!131747)) key!932) (ite ((_ is MissingZero!1151) lt!131747) (= (select (arr!5966 (_keys!6991 thiss!1504)) (index!6774 lt!131747)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1151) lt!131747) (= (select (arr!5966 (_keys!6991 thiss!1504)) (index!6777 lt!131747)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62781 (= lt!131747 e!169148)))

(declare-fun c!44401 () Bool)

(assert (=> d!62781 (= c!44401 (and ((_ is Intermediate!1151) lt!131748) (undefined!1963 lt!131748)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12605 (_ BitVec 32)) SeekEntryResult!1151)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!62781 (= lt!131748 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11144 thiss!1504)) key!932 (_keys!6991 thiss!1504) (mask!11144 thiss!1504)))))

(assert (=> d!62781 (validMask!0 (mask!11144 thiss!1504))))

(assert (=> d!62781 (= (seekEntryOrOpen!0 key!932 (_keys!6991 thiss!1504) (mask!11144 thiss!1504)) lt!131747)))

(declare-fun b!261015 () Bool)

(declare-fun c!44402 () Bool)

(assert (=> b!261015 (= c!44402 (= lt!131749 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261015 (= e!169146 e!169147)))

(declare-fun b!261016 () Bool)

(assert (=> b!261016 (= e!169146 (Found!1151 (index!6776 lt!131748)))))

(declare-fun b!261017 () Bool)

(assert (=> b!261017 (= e!169147 (MissingZero!1151 (index!6776 lt!131748)))))

(declare-fun b!261018 () Bool)

(assert (=> b!261018 (= e!169148 Undefined!1151)))

(assert (= (and d!62781 c!44401) b!261018))

(assert (= (and d!62781 (not c!44401)) b!261014))

(assert (= (and b!261014 c!44403) b!261016))

(assert (= (and b!261014 (not c!44403)) b!261015))

(assert (= (and b!261015 c!44402) b!261017))

(assert (= (and b!261015 (not c!44402)) b!261013))

(declare-fun m!277061 () Bool)

(assert (=> b!261013 m!277061))

(declare-fun m!277063 () Bool)

(assert (=> b!261014 m!277063))

(declare-fun m!277065 () Bool)

(assert (=> d!62781 m!277065))

(declare-fun m!277067 () Bool)

(assert (=> d!62781 m!277067))

(declare-fun m!277069 () Bool)

(assert (=> d!62781 m!277069))

(assert (=> d!62781 m!276865))

(declare-fun m!277071 () Bool)

(assert (=> d!62781 m!277071))

(assert (=> d!62781 m!277069))

(declare-fun m!277073 () Bool)

(assert (=> d!62781 m!277073))

(assert (=> b!260858 d!62781))

(declare-fun d!62783 () Bool)

(assert (=> d!62783 (= (inRange!0 index!297 (mask!11144 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11144 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!260849 d!62783))

(declare-fun d!62785 () Bool)

(declare-fun e!169153 () Bool)

(assert (=> d!62785 e!169153))

(declare-fun res!127546 () Bool)

(assert (=> d!62785 (=> res!127546 e!169153)))

(declare-fun lt!131759 () Bool)

(assert (=> d!62785 (= res!127546 (not lt!131759))))

(declare-fun lt!131758 () Bool)

(assert (=> d!62785 (= lt!131759 lt!131758)))

(declare-fun lt!131760 () Unit!8084)

(declare-fun e!169154 () Unit!8084)

(assert (=> d!62785 (= lt!131760 e!169154)))

(declare-fun c!44406 () Bool)

(assert (=> d!62785 (= c!44406 lt!131758)))

(declare-fun containsKey!309 (List!3738 (_ BitVec 64)) Bool)

(assert (=> d!62785 (= lt!131758 (containsKey!309 (toList!1903 lt!131643) key!932))))

(assert (=> d!62785 (= (contains!1870 lt!131643 key!932) lt!131759)))

(declare-fun b!261025 () Bool)

(declare-fun lt!131761 () Unit!8084)

(assert (=> b!261025 (= e!169154 lt!131761)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!257 (List!3738 (_ BitVec 64)) Unit!8084)

(assert (=> b!261025 (= lt!131761 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1903 lt!131643) key!932))))

(declare-datatypes ((Option!324 0))(
  ( (Some!323 (v!5482 V!8481)) (None!322) )
))
(declare-fun isDefined!258 (Option!324) Bool)

(declare-fun getValueByKey!318 (List!3738 (_ BitVec 64)) Option!324)

(assert (=> b!261025 (isDefined!258 (getValueByKey!318 (toList!1903 lt!131643) key!932))))

(declare-fun b!261026 () Bool)

(declare-fun Unit!8097 () Unit!8084)

(assert (=> b!261026 (= e!169154 Unit!8097)))

(declare-fun b!261027 () Bool)

(assert (=> b!261027 (= e!169153 (isDefined!258 (getValueByKey!318 (toList!1903 lt!131643) key!932)))))

(assert (= (and d!62785 c!44406) b!261025))

(assert (= (and d!62785 (not c!44406)) b!261026))

(assert (= (and d!62785 (not res!127546)) b!261027))

(declare-fun m!277075 () Bool)

(assert (=> d!62785 m!277075))

(declare-fun m!277077 () Bool)

(assert (=> b!261025 m!277077))

(declare-fun m!277079 () Bool)

(assert (=> b!261025 m!277079))

(assert (=> b!261025 m!277079))

(declare-fun m!277081 () Bool)

(assert (=> b!261025 m!277081))

(assert (=> b!261027 m!277079))

(assert (=> b!261027 m!277079))

(assert (=> b!261027 m!277081))

(assert (=> b!260849 d!62785))

(declare-fun bm!24892 () Bool)

(declare-fun call!24895 () ListLongMap!3775)

(declare-fun call!24901 () ListLongMap!3775)

(assert (=> bm!24892 (= call!24895 call!24901)))

(declare-fun bm!24893 () Bool)

(declare-fun call!24897 () Bool)

(declare-fun lt!131806 () ListLongMap!3775)

(assert (=> bm!24893 (= call!24897 (contains!1870 lt!131806 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261070 () Bool)

(declare-fun e!169182 () ListLongMap!3775)

(declare-fun call!24896 () ListLongMap!3775)

(assert (=> b!261070 (= e!169182 (+!700 call!24896 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))

(declare-fun b!261071 () Bool)

(declare-fun e!169191 () Bool)

(assert (=> b!261071 (= e!169191 (not call!24897))))

(declare-fun b!261072 () Bool)

(declare-fun res!127565 () Bool)

(declare-fun e!169193 () Bool)

(assert (=> b!261072 (=> (not res!127565) (not e!169193))))

(declare-fun e!169183 () Bool)

(assert (=> b!261072 (= res!127565 e!169183)))

(declare-fun res!127570 () Bool)

(assert (=> b!261072 (=> res!127570 e!169183)))

(declare-fun e!169190 () Bool)

(assert (=> b!261072 (= res!127570 (not e!169190))))

(declare-fun res!127567 () Bool)

(assert (=> b!261072 (=> (not res!127567) (not e!169190))))

(assert (=> b!261072 (= res!127567 (bvslt #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))))))

(declare-fun b!261073 () Bool)

(declare-fun e!169181 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!261073 (= e!169181 (validKeyInArray!0 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!261074 () Bool)

(declare-fun e!169187 () ListLongMap!3775)

(assert (=> b!261074 (= e!169182 e!169187)))

(declare-fun c!44419 () Bool)

(assert (=> b!261074 (= c!44419 (and (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!261075 () Bool)

(declare-fun c!44423 () Bool)

(assert (=> b!261075 (= c!44423 (and (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!169189 () ListLongMap!3775)

(assert (=> b!261075 (= e!169187 e!169189)))

(declare-fun b!261076 () Bool)

(declare-fun e!169192 () Bool)

(assert (=> b!261076 (= e!169191 e!169192)))

(declare-fun res!127568 () Bool)

(assert (=> b!261076 (= res!127568 call!24897)))

(assert (=> b!261076 (=> (not res!127568) (not e!169192))))

(declare-fun b!261077 () Bool)

(declare-fun call!24899 () ListLongMap!3775)

(assert (=> b!261077 (= e!169187 call!24899)))

(declare-fun b!261078 () Bool)

(declare-fun e!169186 () Unit!8084)

(declare-fun lt!131814 () Unit!8084)

(assert (=> b!261078 (= e!169186 lt!131814)))

(declare-fun lt!131808 () ListLongMap!3775)

(declare-fun getCurrentListMapNoExtraKeys!575 (array!12605 array!12603 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 32) Int) ListLongMap!3775)

(assert (=> b!261078 (= lt!131808 (getCurrentListMapNoExtraKeys!575 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131817 () (_ BitVec 64))

(assert (=> b!261078 (= lt!131817 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131813 () (_ BitVec 64))

(assert (=> b!261078 (= lt!131813 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131826 () Unit!8084)

(declare-fun addStillContains!235 (ListLongMap!3775 (_ BitVec 64) V!8481 (_ BitVec 64)) Unit!8084)

(assert (=> b!261078 (= lt!131826 (addStillContains!235 lt!131808 lt!131817 (zeroValue!4648 thiss!1504) lt!131813))))

(assert (=> b!261078 (contains!1870 (+!700 lt!131808 (tuple2!4861 lt!131817 (zeroValue!4648 thiss!1504))) lt!131813)))

(declare-fun lt!131812 () Unit!8084)

(assert (=> b!261078 (= lt!131812 lt!131826)))

(declare-fun lt!131827 () ListLongMap!3775)

(assert (=> b!261078 (= lt!131827 (getCurrentListMapNoExtraKeys!575 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131818 () (_ BitVec 64))

(assert (=> b!261078 (= lt!131818 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131825 () (_ BitVec 64))

(assert (=> b!261078 (= lt!131825 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131821 () Unit!8084)

(declare-fun addApplyDifferent!235 (ListLongMap!3775 (_ BitVec 64) V!8481 (_ BitVec 64)) Unit!8084)

(assert (=> b!261078 (= lt!131821 (addApplyDifferent!235 lt!131827 lt!131818 (minValue!4648 thiss!1504) lt!131825))))

(declare-fun apply!259 (ListLongMap!3775 (_ BitVec 64)) V!8481)

(assert (=> b!261078 (= (apply!259 (+!700 lt!131827 (tuple2!4861 lt!131818 (minValue!4648 thiss!1504))) lt!131825) (apply!259 lt!131827 lt!131825))))

(declare-fun lt!131824 () Unit!8084)

(assert (=> b!261078 (= lt!131824 lt!131821)))

(declare-fun lt!131810 () ListLongMap!3775)

(assert (=> b!261078 (= lt!131810 (getCurrentListMapNoExtraKeys!575 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131822 () (_ BitVec 64))

(assert (=> b!261078 (= lt!131822 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131807 () (_ BitVec 64))

(assert (=> b!261078 (= lt!131807 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131816 () Unit!8084)

(assert (=> b!261078 (= lt!131816 (addApplyDifferent!235 lt!131810 lt!131822 (zeroValue!4648 thiss!1504) lt!131807))))

(assert (=> b!261078 (= (apply!259 (+!700 lt!131810 (tuple2!4861 lt!131822 (zeroValue!4648 thiss!1504))) lt!131807) (apply!259 lt!131810 lt!131807))))

(declare-fun lt!131819 () Unit!8084)

(assert (=> b!261078 (= lt!131819 lt!131816)))

(declare-fun lt!131820 () ListLongMap!3775)

(assert (=> b!261078 (= lt!131820 (getCurrentListMapNoExtraKeys!575 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131823 () (_ BitVec 64))

(assert (=> b!261078 (= lt!131823 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131815 () (_ BitVec 64))

(assert (=> b!261078 (= lt!131815 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!261078 (= lt!131814 (addApplyDifferent!235 lt!131820 lt!131823 (minValue!4648 thiss!1504) lt!131815))))

(assert (=> b!261078 (= (apply!259 (+!700 lt!131820 (tuple2!4861 lt!131823 (minValue!4648 thiss!1504))) lt!131815) (apply!259 lt!131820 lt!131815))))

(declare-fun d!62787 () Bool)

(assert (=> d!62787 e!169193))

(declare-fun res!127572 () Bool)

(assert (=> d!62787 (=> (not res!127572) (not e!169193))))

(assert (=> d!62787 (= res!127572 (or (bvsge #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))))))))

(declare-fun lt!131809 () ListLongMap!3775)

(assert (=> d!62787 (= lt!131806 lt!131809)))

(declare-fun lt!131811 () Unit!8084)

(assert (=> d!62787 (= lt!131811 e!169186)))

(declare-fun c!44420 () Bool)

(assert (=> d!62787 (= c!44420 e!169181)))

(declare-fun res!127573 () Bool)

(assert (=> d!62787 (=> (not res!127573) (not e!169181))))

(assert (=> d!62787 (= res!127573 (bvslt #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))))))

(assert (=> d!62787 (= lt!131809 e!169182)))

(declare-fun c!44421 () Bool)

(assert (=> d!62787 (= c!44421 (and (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62787 (validMask!0 (mask!11144 thiss!1504))))

(assert (=> d!62787 (= (getCurrentListMap!1435 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) lt!131806)))

(declare-fun b!261079 () Bool)

(declare-fun e!169185 () Bool)

(declare-fun e!169188 () Bool)

(assert (=> b!261079 (= e!169185 e!169188)))

(declare-fun res!127571 () Bool)

(declare-fun call!24898 () Bool)

(assert (=> b!261079 (= res!127571 call!24898)))

(assert (=> b!261079 (=> (not res!127571) (not e!169188))))

(declare-fun bm!24894 () Bool)

(assert (=> bm!24894 (= call!24899 call!24896)))

(declare-fun b!261080 () Bool)

(assert (=> b!261080 (= e!169192 (= (apply!259 lt!131806 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4648 thiss!1504)))))

(declare-fun b!261081 () Bool)

(declare-fun e!169184 () Bool)

(declare-fun get!3083 (ValueCell!2969 V!8481) V!8481)

(declare-fun dynLambda!602 (Int (_ BitVec 64)) V!8481)

(assert (=> b!261081 (= e!169184 (= (apply!259 lt!131806 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)) (get!3083 (select (arr!5965 (_values!4790 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261081 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6315 (_values!4790 thiss!1504))))))

(assert (=> b!261081 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))))))

(declare-fun b!261082 () Bool)

(assert (=> b!261082 (= e!169185 (not call!24898))))

(declare-fun bm!24895 () Bool)

(assert (=> bm!24895 (= call!24898 (contains!1870 lt!131806 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261083 () Bool)

(declare-fun Unit!8098 () Unit!8084)

(assert (=> b!261083 (= e!169186 Unit!8098)))

(declare-fun bm!24896 () Bool)

(declare-fun call!24900 () ListLongMap!3775)

(assert (=> bm!24896 (= call!24900 call!24895)))

(declare-fun b!261084 () Bool)

(assert (=> b!261084 (= e!169193 e!169185)))

(declare-fun c!44424 () Bool)

(assert (=> b!261084 (= c!44424 (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!261085 () Bool)

(assert (=> b!261085 (= e!169189 call!24899)))

(declare-fun b!261086 () Bool)

(declare-fun res!127566 () Bool)

(assert (=> b!261086 (=> (not res!127566) (not e!169193))))

(assert (=> b!261086 (= res!127566 e!169191)))

(declare-fun c!44422 () Bool)

(assert (=> b!261086 (= c!44422 (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!261087 () Bool)

(assert (=> b!261087 (= e!169190 (validKeyInArray!0 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!261088 () Bool)

(assert (=> b!261088 (= e!169183 e!169184)))

(declare-fun res!127569 () Bool)

(assert (=> b!261088 (=> (not res!127569) (not e!169184))))

(assert (=> b!261088 (= res!127569 (contains!1870 lt!131806 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!261088 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))))))

(declare-fun b!261089 () Bool)

(assert (=> b!261089 (= e!169188 (= (apply!259 lt!131806 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4648 thiss!1504)))))

(declare-fun bm!24897 () Bool)

(assert (=> bm!24897 (= call!24901 (getCurrentListMapNoExtraKeys!575 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun bm!24898 () Bool)

(assert (=> bm!24898 (= call!24896 (+!700 (ite c!44421 call!24901 (ite c!44419 call!24895 call!24900)) (ite (or c!44421 c!44419) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(declare-fun b!261090 () Bool)

(assert (=> b!261090 (= e!169189 call!24900)))

(assert (= (and d!62787 c!44421) b!261070))

(assert (= (and d!62787 (not c!44421)) b!261074))

(assert (= (and b!261074 c!44419) b!261077))

(assert (= (and b!261074 (not c!44419)) b!261075))

(assert (= (and b!261075 c!44423) b!261085))

(assert (= (and b!261075 (not c!44423)) b!261090))

(assert (= (or b!261085 b!261090) bm!24896))

(assert (= (or b!261077 bm!24896) bm!24892))

(assert (= (or b!261077 b!261085) bm!24894))

(assert (= (or b!261070 bm!24892) bm!24897))

(assert (= (or b!261070 bm!24894) bm!24898))

(assert (= (and d!62787 res!127573) b!261073))

(assert (= (and d!62787 c!44420) b!261078))

(assert (= (and d!62787 (not c!44420)) b!261083))

(assert (= (and d!62787 res!127572) b!261072))

(assert (= (and b!261072 res!127567) b!261087))

(assert (= (and b!261072 (not res!127570)) b!261088))

(assert (= (and b!261088 res!127569) b!261081))

(assert (= (and b!261072 res!127565) b!261086))

(assert (= (and b!261086 c!44422) b!261076))

(assert (= (and b!261086 (not c!44422)) b!261071))

(assert (= (and b!261076 res!127568) b!261080))

(assert (= (or b!261076 b!261071) bm!24893))

(assert (= (and b!261086 res!127566) b!261084))

(assert (= (and b!261084 c!44424) b!261079))

(assert (= (and b!261084 (not c!44424)) b!261082))

(assert (= (and b!261079 res!127571) b!261089))

(assert (= (or b!261079 b!261082) bm!24895))

(declare-fun b_lambda!8309 () Bool)

(assert (=> (not b_lambda!8309) (not b!261081)))

(declare-fun t!8806 () Bool)

(declare-fun tb!3023 () Bool)

(assert (=> (and b!260854 (= (defaultEntry!4807 thiss!1504) (defaultEntry!4807 thiss!1504)) t!8806) tb!3023))

(declare-fun result!5407 () Bool)

(assert (=> tb!3023 (= result!5407 tp_is_empty!6625)))

(assert (=> b!261081 t!8806))

(declare-fun b_and!13903 () Bool)

(assert (= b_and!13897 (and (=> t!8806 result!5407) b_and!13903)))

(assert (=> b!261087 m!277057))

(assert (=> b!261087 m!277057))

(declare-fun m!277083 () Bool)

(assert (=> b!261087 m!277083))

(declare-fun m!277085 () Bool)

(assert (=> b!261078 m!277085))

(declare-fun m!277087 () Bool)

(assert (=> b!261078 m!277087))

(declare-fun m!277089 () Bool)

(assert (=> b!261078 m!277089))

(declare-fun m!277091 () Bool)

(assert (=> b!261078 m!277091))

(assert (=> b!261078 m!277057))

(declare-fun m!277093 () Bool)

(assert (=> b!261078 m!277093))

(declare-fun m!277095 () Bool)

(assert (=> b!261078 m!277095))

(declare-fun m!277097 () Bool)

(assert (=> b!261078 m!277097))

(declare-fun m!277099 () Bool)

(assert (=> b!261078 m!277099))

(assert (=> b!261078 m!277089))

(declare-fun m!277101 () Bool)

(assert (=> b!261078 m!277101))

(assert (=> b!261078 m!277087))

(declare-fun m!277103 () Bool)

(assert (=> b!261078 m!277103))

(declare-fun m!277105 () Bool)

(assert (=> b!261078 m!277105))

(declare-fun m!277107 () Bool)

(assert (=> b!261078 m!277107))

(assert (=> b!261078 m!277105))

(declare-fun m!277109 () Bool)

(assert (=> b!261078 m!277109))

(declare-fun m!277111 () Bool)

(assert (=> b!261078 m!277111))

(assert (=> b!261078 m!277109))

(declare-fun m!277113 () Bool)

(assert (=> b!261078 m!277113))

(declare-fun m!277115 () Bool)

(assert (=> b!261078 m!277115))

(declare-fun m!277117 () Bool)

(assert (=> b!261080 m!277117))

(assert (=> d!62787 m!276865))

(declare-fun m!277119 () Bool)

(assert (=> b!261070 m!277119))

(declare-fun m!277121 () Bool)

(assert (=> bm!24898 m!277121))

(assert (=> b!261073 m!277057))

(assert (=> b!261073 m!277057))

(assert (=> b!261073 m!277083))

(declare-fun m!277123 () Bool)

(assert (=> bm!24893 m!277123))

(assert (=> b!261088 m!277057))

(assert (=> b!261088 m!277057))

(declare-fun m!277125 () Bool)

(assert (=> b!261088 m!277125))

(declare-fun m!277127 () Bool)

(assert (=> b!261081 m!277127))

(declare-fun m!277129 () Bool)

(assert (=> b!261081 m!277129))

(declare-fun m!277131 () Bool)

(assert (=> b!261081 m!277131))

(assert (=> b!261081 m!277057))

(assert (=> b!261081 m!277057))

(declare-fun m!277133 () Bool)

(assert (=> b!261081 m!277133))

(assert (=> b!261081 m!277127))

(assert (=> b!261081 m!277129))

(declare-fun m!277135 () Bool)

(assert (=> bm!24895 m!277135))

(declare-fun m!277137 () Bool)

(assert (=> b!261089 m!277137))

(assert (=> bm!24897 m!277085))

(assert (=> b!260849 d!62787))

(declare-fun d!62789 () Bool)

(assert (=> d!62789 (= (array_inv!3929 (_keys!6991 thiss!1504)) (bvsge (size!6316 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!260854 d!62789))

(declare-fun d!62791 () Bool)

(assert (=> d!62791 (= (array_inv!3930 (_values!4790 thiss!1504)) (bvsge (size!6315 (_values!4790 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!260854 d!62791))

(declare-fun d!62793 () Bool)

(assert (=> d!62793 (contains!1870 (getCurrentListMap!1435 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) key!932)))

(declare-fun lt!131830 () Unit!8084)

(declare-fun choose!1279 (array!12605 array!12603 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 64) (_ BitVec 32) Int) Unit!8084)

(assert (=> d!62793 (= lt!131830 (choose!1279 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(assert (=> d!62793 (validMask!0 (mask!11144 thiss!1504))))

(assert (=> d!62793 (= (lemmaArrayContainsKeyThenInListMap!258 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) lt!131830)))

(declare-fun bs!9216 () Bool)

(assert (= bs!9216 d!62793))

(assert (=> bs!9216 m!276923))

(assert (=> bs!9216 m!276923))

(declare-fun m!277139 () Bool)

(assert (=> bs!9216 m!277139))

(declare-fun m!277141 () Bool)

(assert (=> bs!9216 m!277141))

(assert (=> bs!9216 m!276865))

(assert (=> b!260848 d!62793))

(declare-fun d!62795 () Bool)

(declare-fun e!169196 () Bool)

(assert (=> d!62795 e!169196))

(declare-fun res!127579 () Bool)

(assert (=> d!62795 (=> (not res!127579) (not e!169196))))

(declare-fun lt!131835 () SeekEntryResult!1151)

(assert (=> d!62795 (= res!127579 ((_ is Found!1151) lt!131835))))

(assert (=> d!62795 (= lt!131835 (seekEntryOrOpen!0 key!932 (_keys!6991 thiss!1504) (mask!11144 thiss!1504)))))

(declare-fun lt!131836 () Unit!8084)

(declare-fun choose!1280 (array!12605 array!12603 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 64) Int) Unit!8084)

(assert (=> d!62795 (= lt!131836 (choose!1280 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 (defaultEntry!4807 thiss!1504)))))

(assert (=> d!62795 (validMask!0 (mask!11144 thiss!1504))))

(assert (=> d!62795 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!441 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 (defaultEntry!4807 thiss!1504)) lt!131836)))

(declare-fun b!261097 () Bool)

(declare-fun res!127578 () Bool)

(assert (=> b!261097 (=> (not res!127578) (not e!169196))))

(assert (=> b!261097 (= res!127578 (inRange!0 (index!6775 lt!131835) (mask!11144 thiss!1504)))))

(declare-fun b!261098 () Bool)

(assert (=> b!261098 (= e!169196 (= (select (arr!5966 (_keys!6991 thiss!1504)) (index!6775 lt!131835)) key!932))))

(assert (=> b!261098 (and (bvsge (index!6775 lt!131835) #b00000000000000000000000000000000) (bvslt (index!6775 lt!131835) (size!6316 (_keys!6991 thiss!1504))))))

(assert (= (and d!62795 res!127579) b!261097))

(assert (= (and b!261097 res!127578) b!261098))

(assert (=> d!62795 m!276913))

(declare-fun m!277143 () Bool)

(assert (=> d!62795 m!277143))

(assert (=> d!62795 m!276865))

(declare-fun m!277145 () Bool)

(assert (=> b!261097 m!277145))

(declare-fun m!277147 () Bool)

(assert (=> b!261098 m!277147))

(assert (=> b!260861 d!62795))

(declare-fun d!62797 () Bool)

(declare-fun res!127586 () Bool)

(declare-fun e!169199 () Bool)

(assert (=> d!62797 (=> (not res!127586) (not e!169199))))

(declare-fun simpleValid!282 (LongMapFixedSize!3838) Bool)

(assert (=> d!62797 (= res!127586 (simpleValid!282 thiss!1504))))

(assert (=> d!62797 (= (valid!1505 thiss!1504) e!169199)))

(declare-fun b!261105 () Bool)

(declare-fun res!127587 () Bool)

(assert (=> b!261105 (=> (not res!127587) (not e!169199))))

(assert (=> b!261105 (= res!127587 (= (arrayCountValidKeys!0 (_keys!6991 thiss!1504) #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))) (_size!1968 thiss!1504)))))

(declare-fun b!261106 () Bool)

(declare-fun res!127588 () Bool)

(assert (=> b!261106 (=> (not res!127588) (not e!169199))))

(assert (=> b!261106 (= res!127588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6991 thiss!1504) (mask!11144 thiss!1504)))))

(declare-fun b!261107 () Bool)

(assert (=> b!261107 (= e!169199 (arrayNoDuplicates!0 (_keys!6991 thiss!1504) #b00000000000000000000000000000000 Nil!3736))))

(assert (= (and d!62797 res!127586) b!261105))

(assert (= (and b!261105 res!127587) b!261106))

(assert (= (and b!261106 res!127588) b!261107))

(declare-fun m!277149 () Bool)

(assert (=> d!62797 m!277149))

(assert (=> b!261105 m!276897))

(declare-fun m!277151 () Bool)

(assert (=> b!261106 m!277151))

(declare-fun m!277153 () Bool)

(assert (=> b!261107 m!277153))

(assert (=> start!25022 d!62797))

(declare-fun d!62799 () Bool)

(declare-fun e!169202 () Bool)

(assert (=> d!62799 e!169202))

(declare-fun res!127593 () Bool)

(assert (=> d!62799 (=> (not res!127593) (not e!169202))))

(declare-fun lt!131848 () ListLongMap!3775)

(assert (=> d!62799 (= res!127593 (contains!1870 lt!131848 (_1!2441 (tuple2!4861 key!932 v!346))))))

(declare-fun lt!131847 () List!3738)

(assert (=> d!62799 (= lt!131848 (ListLongMap!3776 lt!131847))))

(declare-fun lt!131846 () Unit!8084)

(declare-fun lt!131845 () Unit!8084)

(assert (=> d!62799 (= lt!131846 lt!131845)))

(assert (=> d!62799 (= (getValueByKey!318 lt!131847 (_1!2441 (tuple2!4861 key!932 v!346))) (Some!323 (_2!2441 (tuple2!4861 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!174 (List!3738 (_ BitVec 64) V!8481) Unit!8084)

(assert (=> d!62799 (= lt!131845 (lemmaContainsTupThenGetReturnValue!174 lt!131847 (_1!2441 (tuple2!4861 key!932 v!346)) (_2!2441 (tuple2!4861 key!932 v!346))))))

(declare-fun insertStrictlySorted!177 (List!3738 (_ BitVec 64) V!8481) List!3738)

(assert (=> d!62799 (= lt!131847 (insertStrictlySorted!177 (toList!1903 lt!131643) (_1!2441 (tuple2!4861 key!932 v!346)) (_2!2441 (tuple2!4861 key!932 v!346))))))

(assert (=> d!62799 (= (+!700 lt!131643 (tuple2!4861 key!932 v!346)) lt!131848)))

(declare-fun b!261112 () Bool)

(declare-fun res!127594 () Bool)

(assert (=> b!261112 (=> (not res!127594) (not e!169202))))

(assert (=> b!261112 (= res!127594 (= (getValueByKey!318 (toList!1903 lt!131848) (_1!2441 (tuple2!4861 key!932 v!346))) (Some!323 (_2!2441 (tuple2!4861 key!932 v!346)))))))

(declare-fun b!261113 () Bool)

(declare-fun contains!1872 (List!3738 tuple2!4860) Bool)

(assert (=> b!261113 (= e!169202 (contains!1872 (toList!1903 lt!131848) (tuple2!4861 key!932 v!346)))))

(assert (= (and d!62799 res!127593) b!261112))

(assert (= (and b!261112 res!127594) b!261113))

(declare-fun m!277155 () Bool)

(assert (=> d!62799 m!277155))

(declare-fun m!277157 () Bool)

(assert (=> d!62799 m!277157))

(declare-fun m!277159 () Bool)

(assert (=> d!62799 m!277159))

(declare-fun m!277161 () Bool)

(assert (=> d!62799 m!277161))

(declare-fun m!277163 () Bool)

(assert (=> b!261112 m!277163))

(declare-fun m!277165 () Bool)

(assert (=> b!261113 m!277165))

(assert (=> b!260852 d!62799))

(declare-fun b!261122 () Bool)

(declare-fun res!127604 () Bool)

(declare-fun e!169208 () Bool)

(assert (=> b!261122 (=> (not res!127604) (not e!169208))))

(assert (=> b!261122 (= res!127604 (not (validKeyInArray!0 (select (arr!5966 (_keys!6991 thiss!1504)) index!297))))))

(declare-fun b!261123 () Bool)

(declare-fun res!127603 () Bool)

(assert (=> b!261123 (=> (not res!127603) (not e!169208))))

(assert (=> b!261123 (= res!127603 (validKeyInArray!0 key!932))))

(declare-fun b!261124 () Bool)

(assert (=> b!261124 (= e!169208 (bvslt (size!6316 (_keys!6991 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!261125 () Bool)

(declare-fun e!169207 () Bool)

(assert (=> b!261125 (= e!169207 (= (arrayCountValidKeys!0 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6991 thiss!1504) #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun d!62801 () Bool)

(assert (=> d!62801 e!169207))

(declare-fun res!127606 () Bool)

(assert (=> d!62801 (=> (not res!127606) (not e!169207))))

(assert (=> d!62801 (= res!127606 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6316 (_keys!6991 thiss!1504)))))))

(declare-fun lt!131851 () Unit!8084)

(declare-fun choose!1 (array!12605 (_ BitVec 32) (_ BitVec 64)) Unit!8084)

(assert (=> d!62801 (= lt!131851 (choose!1 (_keys!6991 thiss!1504) index!297 key!932))))

(assert (=> d!62801 e!169208))

(declare-fun res!127605 () Bool)

(assert (=> d!62801 (=> (not res!127605) (not e!169208))))

(assert (=> d!62801 (= res!127605 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6316 (_keys!6991 thiss!1504)))))))

(assert (=> d!62801 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6991 thiss!1504) index!297 key!932) lt!131851)))

(assert (= (and d!62801 res!127605) b!261122))

(assert (= (and b!261122 res!127604) b!261123))

(assert (= (and b!261123 res!127603) b!261124))

(assert (= (and d!62801 res!127606) b!261125))

(declare-fun m!277167 () Bool)

(assert (=> b!261122 m!277167))

(assert (=> b!261122 m!277167))

(declare-fun m!277169 () Bool)

(assert (=> b!261122 m!277169))

(declare-fun m!277171 () Bool)

(assert (=> b!261123 m!277171))

(assert (=> b!261125 m!276885))

(declare-fun m!277173 () Bool)

(assert (=> b!261125 m!277173))

(assert (=> b!261125 m!276897))

(declare-fun m!277175 () Bool)

(assert (=> d!62801 m!277175))

(assert (=> b!260852 d!62801))

(declare-fun d!62803 () Bool)

(declare-fun res!127607 () Bool)

(declare-fun e!169209 () Bool)

(assert (=> d!62803 (=> res!127607 e!169209)))

(assert (=> d!62803 (= res!127607 (= (select (arr!5966 lt!131647) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62803 (= (arrayContainsKey!0 lt!131647 key!932 #b00000000000000000000000000000000) e!169209)))

(declare-fun b!261126 () Bool)

(declare-fun e!169210 () Bool)

(assert (=> b!261126 (= e!169209 e!169210)))

(declare-fun res!127608 () Bool)

(assert (=> b!261126 (=> (not res!127608) (not e!169210))))

(assert (=> b!261126 (= res!127608 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6316 lt!131647)))))

(declare-fun b!261127 () Bool)

(assert (=> b!261127 (= e!169210 (arrayContainsKey!0 lt!131647 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62803 (not res!127607)) b!261126))

(assert (= (and b!261126 res!127608) b!261127))

(declare-fun m!277177 () Bool)

(assert (=> d!62803 m!277177))

(declare-fun m!277179 () Bool)

(assert (=> b!261127 m!277179))

(assert (=> b!260852 d!62803))

(declare-fun bm!24899 () Bool)

(declare-fun call!24902 () ListLongMap!3775)

(declare-fun call!24908 () ListLongMap!3775)

(assert (=> bm!24899 (= call!24902 call!24908)))

(declare-fun bm!24900 () Bool)

(declare-fun call!24904 () Bool)

(declare-fun lt!131852 () ListLongMap!3775)

(assert (=> bm!24900 (= call!24904 (contains!1870 lt!131852 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261128 () Bool)

(declare-fun e!169212 () ListLongMap!3775)

(declare-fun call!24903 () ListLongMap!3775)

(assert (=> b!261128 (= e!169212 (+!700 call!24903 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))

(declare-fun b!261129 () Bool)

(declare-fun e!169221 () Bool)

(assert (=> b!261129 (= e!169221 (not call!24904))))

(declare-fun b!261130 () Bool)

(declare-fun res!127609 () Bool)

(declare-fun e!169223 () Bool)

(assert (=> b!261130 (=> (not res!127609) (not e!169223))))

(declare-fun e!169213 () Bool)

(assert (=> b!261130 (= res!127609 e!169213)))

(declare-fun res!127614 () Bool)

(assert (=> b!261130 (=> res!127614 e!169213)))

(declare-fun e!169220 () Bool)

(assert (=> b!261130 (= res!127614 (not e!169220))))

(declare-fun res!127611 () Bool)

(assert (=> b!261130 (=> (not res!127611) (not e!169220))))

(assert (=> b!261130 (= res!127611 (bvslt #b00000000000000000000000000000000 (size!6316 lt!131647)))))

(declare-fun b!261131 () Bool)

(declare-fun e!169211 () Bool)

(assert (=> b!261131 (= e!169211 (validKeyInArray!0 (select (arr!5966 lt!131647) #b00000000000000000000000000000000)))))

(declare-fun b!261132 () Bool)

(declare-fun e!169217 () ListLongMap!3775)

(assert (=> b!261132 (= e!169212 e!169217)))

(declare-fun c!44425 () Bool)

(assert (=> b!261132 (= c!44425 (and (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!261133 () Bool)

(declare-fun c!44429 () Bool)

(assert (=> b!261133 (= c!44429 (and (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!169219 () ListLongMap!3775)

(assert (=> b!261133 (= e!169217 e!169219)))

(declare-fun b!261134 () Bool)

(declare-fun e!169222 () Bool)

(assert (=> b!261134 (= e!169221 e!169222)))

(declare-fun res!127612 () Bool)

(assert (=> b!261134 (= res!127612 call!24904)))

(assert (=> b!261134 (=> (not res!127612) (not e!169222))))

(declare-fun b!261135 () Bool)

(declare-fun call!24906 () ListLongMap!3775)

(assert (=> b!261135 (= e!169217 call!24906)))

(declare-fun b!261136 () Bool)

(declare-fun e!169216 () Unit!8084)

(declare-fun lt!131860 () Unit!8084)

(assert (=> b!261136 (= e!169216 lt!131860)))

(declare-fun lt!131854 () ListLongMap!3775)

(assert (=> b!261136 (= lt!131854 (getCurrentListMapNoExtraKeys!575 lt!131647 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131863 () (_ BitVec 64))

(assert (=> b!261136 (= lt!131863 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131859 () (_ BitVec 64))

(assert (=> b!261136 (= lt!131859 (select (arr!5966 lt!131647) #b00000000000000000000000000000000))))

(declare-fun lt!131872 () Unit!8084)

(assert (=> b!261136 (= lt!131872 (addStillContains!235 lt!131854 lt!131863 (zeroValue!4648 thiss!1504) lt!131859))))

(assert (=> b!261136 (contains!1870 (+!700 lt!131854 (tuple2!4861 lt!131863 (zeroValue!4648 thiss!1504))) lt!131859)))

(declare-fun lt!131858 () Unit!8084)

(assert (=> b!261136 (= lt!131858 lt!131872)))

(declare-fun lt!131873 () ListLongMap!3775)

(assert (=> b!261136 (= lt!131873 (getCurrentListMapNoExtraKeys!575 lt!131647 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131864 () (_ BitVec 64))

(assert (=> b!261136 (= lt!131864 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131871 () (_ BitVec 64))

(assert (=> b!261136 (= lt!131871 (select (arr!5966 lt!131647) #b00000000000000000000000000000000))))

(declare-fun lt!131867 () Unit!8084)

(assert (=> b!261136 (= lt!131867 (addApplyDifferent!235 lt!131873 lt!131864 (minValue!4648 thiss!1504) lt!131871))))

(assert (=> b!261136 (= (apply!259 (+!700 lt!131873 (tuple2!4861 lt!131864 (minValue!4648 thiss!1504))) lt!131871) (apply!259 lt!131873 lt!131871))))

(declare-fun lt!131870 () Unit!8084)

(assert (=> b!261136 (= lt!131870 lt!131867)))

(declare-fun lt!131856 () ListLongMap!3775)

(assert (=> b!261136 (= lt!131856 (getCurrentListMapNoExtraKeys!575 lt!131647 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131868 () (_ BitVec 64))

(assert (=> b!261136 (= lt!131868 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131853 () (_ BitVec 64))

(assert (=> b!261136 (= lt!131853 (select (arr!5966 lt!131647) #b00000000000000000000000000000000))))

(declare-fun lt!131862 () Unit!8084)

(assert (=> b!261136 (= lt!131862 (addApplyDifferent!235 lt!131856 lt!131868 (zeroValue!4648 thiss!1504) lt!131853))))

(assert (=> b!261136 (= (apply!259 (+!700 lt!131856 (tuple2!4861 lt!131868 (zeroValue!4648 thiss!1504))) lt!131853) (apply!259 lt!131856 lt!131853))))

(declare-fun lt!131865 () Unit!8084)

(assert (=> b!261136 (= lt!131865 lt!131862)))

(declare-fun lt!131866 () ListLongMap!3775)

(assert (=> b!261136 (= lt!131866 (getCurrentListMapNoExtraKeys!575 lt!131647 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131869 () (_ BitVec 64))

(assert (=> b!261136 (= lt!131869 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131861 () (_ BitVec 64))

(assert (=> b!261136 (= lt!131861 (select (arr!5966 lt!131647) #b00000000000000000000000000000000))))

(assert (=> b!261136 (= lt!131860 (addApplyDifferent!235 lt!131866 lt!131869 (minValue!4648 thiss!1504) lt!131861))))

(assert (=> b!261136 (= (apply!259 (+!700 lt!131866 (tuple2!4861 lt!131869 (minValue!4648 thiss!1504))) lt!131861) (apply!259 lt!131866 lt!131861))))

(declare-fun d!62805 () Bool)

(assert (=> d!62805 e!169223))

(declare-fun res!127616 () Bool)

(assert (=> d!62805 (=> (not res!127616) (not e!169223))))

(assert (=> d!62805 (= res!127616 (or (bvsge #b00000000000000000000000000000000 (size!6316 lt!131647)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6316 lt!131647)))))))

(declare-fun lt!131855 () ListLongMap!3775)

(assert (=> d!62805 (= lt!131852 lt!131855)))

(declare-fun lt!131857 () Unit!8084)

(assert (=> d!62805 (= lt!131857 e!169216)))

(declare-fun c!44426 () Bool)

(assert (=> d!62805 (= c!44426 e!169211)))

(declare-fun res!127617 () Bool)

(assert (=> d!62805 (=> (not res!127617) (not e!169211))))

(assert (=> d!62805 (= res!127617 (bvslt #b00000000000000000000000000000000 (size!6316 lt!131647)))))

(assert (=> d!62805 (= lt!131855 e!169212)))

(declare-fun c!44427 () Bool)

(assert (=> d!62805 (= c!44427 (and (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62805 (validMask!0 (mask!11144 thiss!1504))))

(assert (=> d!62805 (= (getCurrentListMap!1435 lt!131647 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) lt!131852)))

(declare-fun b!261137 () Bool)

(declare-fun e!169215 () Bool)

(declare-fun e!169218 () Bool)

(assert (=> b!261137 (= e!169215 e!169218)))

(declare-fun res!127615 () Bool)

(declare-fun call!24905 () Bool)

(assert (=> b!261137 (= res!127615 call!24905)))

(assert (=> b!261137 (=> (not res!127615) (not e!169218))))

(declare-fun bm!24901 () Bool)

(assert (=> bm!24901 (= call!24906 call!24903)))

(declare-fun b!261138 () Bool)

(assert (=> b!261138 (= e!169222 (= (apply!259 lt!131852 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4648 thiss!1504)))))

(declare-fun e!169214 () Bool)

(declare-fun b!261139 () Bool)

(assert (=> b!261139 (= e!169214 (= (apply!259 lt!131852 (select (arr!5966 lt!131647) #b00000000000000000000000000000000)) (get!3083 (select (arr!5965 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261139 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6315 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))))))))

(assert (=> b!261139 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6316 lt!131647)))))

(declare-fun b!261140 () Bool)

(assert (=> b!261140 (= e!169215 (not call!24905))))

(declare-fun bm!24902 () Bool)

(assert (=> bm!24902 (= call!24905 (contains!1870 lt!131852 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261141 () Bool)

(declare-fun Unit!8099 () Unit!8084)

(assert (=> b!261141 (= e!169216 Unit!8099)))

(declare-fun bm!24903 () Bool)

(declare-fun call!24907 () ListLongMap!3775)

(assert (=> bm!24903 (= call!24907 call!24902)))

(declare-fun b!261142 () Bool)

(assert (=> b!261142 (= e!169223 e!169215)))

(declare-fun c!44430 () Bool)

(assert (=> b!261142 (= c!44430 (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!261143 () Bool)

(assert (=> b!261143 (= e!169219 call!24906)))

(declare-fun b!261144 () Bool)

(declare-fun res!127610 () Bool)

(assert (=> b!261144 (=> (not res!127610) (not e!169223))))

(assert (=> b!261144 (= res!127610 e!169221)))

(declare-fun c!44428 () Bool)

(assert (=> b!261144 (= c!44428 (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!261145 () Bool)

(assert (=> b!261145 (= e!169220 (validKeyInArray!0 (select (arr!5966 lt!131647) #b00000000000000000000000000000000)))))

(declare-fun b!261146 () Bool)

(assert (=> b!261146 (= e!169213 e!169214)))

(declare-fun res!127613 () Bool)

(assert (=> b!261146 (=> (not res!127613) (not e!169214))))

(assert (=> b!261146 (= res!127613 (contains!1870 lt!131852 (select (arr!5966 lt!131647) #b00000000000000000000000000000000)))))

(assert (=> b!261146 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6316 lt!131647)))))

(declare-fun b!261147 () Bool)

(assert (=> b!261147 (= e!169218 (= (apply!259 lt!131852 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4648 thiss!1504)))))

(declare-fun bm!24904 () Bool)

(assert (=> bm!24904 (= call!24908 (getCurrentListMapNoExtraKeys!575 lt!131647 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun bm!24905 () Bool)

(assert (=> bm!24905 (= call!24903 (+!700 (ite c!44427 call!24908 (ite c!44425 call!24902 call!24907)) (ite (or c!44427 c!44425) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(declare-fun b!261148 () Bool)

(assert (=> b!261148 (= e!169219 call!24907)))

(assert (= (and d!62805 c!44427) b!261128))

(assert (= (and d!62805 (not c!44427)) b!261132))

(assert (= (and b!261132 c!44425) b!261135))

(assert (= (and b!261132 (not c!44425)) b!261133))

(assert (= (and b!261133 c!44429) b!261143))

(assert (= (and b!261133 (not c!44429)) b!261148))

(assert (= (or b!261143 b!261148) bm!24903))

(assert (= (or b!261135 bm!24903) bm!24899))

(assert (= (or b!261135 b!261143) bm!24901))

(assert (= (or b!261128 bm!24899) bm!24904))

(assert (= (or b!261128 bm!24901) bm!24905))

(assert (= (and d!62805 res!127617) b!261131))

(assert (= (and d!62805 c!44426) b!261136))

(assert (= (and d!62805 (not c!44426)) b!261141))

(assert (= (and d!62805 res!127616) b!261130))

(assert (= (and b!261130 res!127611) b!261145))

(assert (= (and b!261130 (not res!127614)) b!261146))

(assert (= (and b!261146 res!127613) b!261139))

(assert (= (and b!261130 res!127609) b!261144))

(assert (= (and b!261144 c!44428) b!261134))

(assert (= (and b!261144 (not c!44428)) b!261129))

(assert (= (and b!261134 res!127612) b!261138))

(assert (= (or b!261134 b!261129) bm!24900))

(assert (= (and b!261144 res!127610) b!261142))

(assert (= (and b!261142 c!44430) b!261137))

(assert (= (and b!261142 (not c!44430)) b!261140))

(assert (= (and b!261137 res!127615) b!261147))

(assert (= (or b!261137 b!261140) bm!24902))

(declare-fun b_lambda!8311 () Bool)

(assert (=> (not b_lambda!8311) (not b!261139)))

(assert (=> b!261139 t!8806))

(declare-fun b_and!13905 () Bool)

(assert (= b_and!13903 (and (=> t!8806 result!5407) b_and!13905)))

(assert (=> b!261145 m!277177))

(assert (=> b!261145 m!277177))

(declare-fun m!277181 () Bool)

(assert (=> b!261145 m!277181))

(declare-fun m!277183 () Bool)

(assert (=> b!261136 m!277183))

(declare-fun m!277185 () Bool)

(assert (=> b!261136 m!277185))

(declare-fun m!277187 () Bool)

(assert (=> b!261136 m!277187))

(declare-fun m!277189 () Bool)

(assert (=> b!261136 m!277189))

(assert (=> b!261136 m!277177))

(declare-fun m!277191 () Bool)

(assert (=> b!261136 m!277191))

(declare-fun m!277193 () Bool)

(assert (=> b!261136 m!277193))

(declare-fun m!277195 () Bool)

(assert (=> b!261136 m!277195))

(declare-fun m!277197 () Bool)

(assert (=> b!261136 m!277197))

(assert (=> b!261136 m!277187))

(declare-fun m!277199 () Bool)

(assert (=> b!261136 m!277199))

(assert (=> b!261136 m!277185))

(declare-fun m!277201 () Bool)

(assert (=> b!261136 m!277201))

(declare-fun m!277203 () Bool)

(assert (=> b!261136 m!277203))

(declare-fun m!277205 () Bool)

(assert (=> b!261136 m!277205))

(assert (=> b!261136 m!277203))

(declare-fun m!277207 () Bool)

(assert (=> b!261136 m!277207))

(declare-fun m!277209 () Bool)

(assert (=> b!261136 m!277209))

(assert (=> b!261136 m!277207))

(declare-fun m!277211 () Bool)

(assert (=> b!261136 m!277211))

(declare-fun m!277213 () Bool)

(assert (=> b!261136 m!277213))

(declare-fun m!277215 () Bool)

(assert (=> b!261138 m!277215))

(assert (=> d!62805 m!276865))

(declare-fun m!277217 () Bool)

(assert (=> b!261128 m!277217))

(declare-fun m!277219 () Bool)

(assert (=> bm!24905 m!277219))

(assert (=> b!261131 m!277177))

(assert (=> b!261131 m!277177))

(assert (=> b!261131 m!277181))

(declare-fun m!277221 () Bool)

(assert (=> bm!24900 m!277221))

(assert (=> b!261146 m!277177))

(assert (=> b!261146 m!277177))

(declare-fun m!277223 () Bool)

(assert (=> b!261146 m!277223))

(declare-fun m!277225 () Bool)

(assert (=> b!261139 m!277225))

(assert (=> b!261139 m!277129))

(declare-fun m!277227 () Bool)

(assert (=> b!261139 m!277227))

(assert (=> b!261139 m!277177))

(assert (=> b!261139 m!277177))

(declare-fun m!277229 () Bool)

(assert (=> b!261139 m!277229))

(assert (=> b!261139 m!277225))

(assert (=> b!261139 m!277129))

(declare-fun m!277231 () Bool)

(assert (=> bm!24902 m!277231))

(declare-fun m!277233 () Bool)

(assert (=> b!261147 m!277233))

(assert (=> bm!24904 m!277183))

(assert (=> b!260852 d!62805))

(declare-fun d!62807 () Bool)

(declare-fun e!169226 () Bool)

(assert (=> d!62807 e!169226))

(declare-fun res!127620 () Bool)

(assert (=> d!62807 (=> (not res!127620) (not e!169226))))

(assert (=> d!62807 (= res!127620 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6316 (_keys!6991 thiss!1504))) (bvslt index!297 (size!6315 (_values!4790 thiss!1504)))))))

(declare-fun lt!131876 () Unit!8084)

(declare-fun choose!1281 (array!12605 array!12603 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 32) (_ BitVec 64) V!8481 Int) Unit!8084)

(assert (=> d!62807 (= lt!131876 (choose!1281 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) index!297 key!932 v!346 (defaultEntry!4807 thiss!1504)))))

(assert (=> d!62807 (validMask!0 (mask!11144 thiss!1504))))

(assert (=> d!62807 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!115 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) index!297 key!932 v!346 (defaultEntry!4807 thiss!1504)) lt!131876)))

(declare-fun b!261151 () Bool)

(assert (=> b!261151 (= e!169226 (= (+!700 (getCurrentListMap!1435 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) (tuple2!4861 key!932 v!346)) (getCurrentListMap!1435 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504))))))

(assert (= (and d!62807 res!127620) b!261151))

(declare-fun m!277235 () Bool)

(assert (=> d!62807 m!277235))

(assert (=> d!62807 m!276865))

(assert (=> b!261151 m!276875))

(assert (=> b!261151 m!276923))

(assert (=> b!261151 m!276885))

(assert (=> b!261151 m!276923))

(declare-fun m!277237 () Bool)

(assert (=> b!261151 m!277237))

(declare-fun m!277239 () Bool)

(assert (=> b!261151 m!277239))

(assert (=> b!260852 d!62807))

(declare-fun d!62809 () Bool)

(assert (=> d!62809 (= (validMask!0 (mask!11144 thiss!1504)) (and (or (= (mask!11144 thiss!1504) #b00000000000000000000000000000111) (= (mask!11144 thiss!1504) #b00000000000000000000000000001111) (= (mask!11144 thiss!1504) #b00000000000000000000000000011111) (= (mask!11144 thiss!1504) #b00000000000000000000000000111111) (= (mask!11144 thiss!1504) #b00000000000000000000000001111111) (= (mask!11144 thiss!1504) #b00000000000000000000000011111111) (= (mask!11144 thiss!1504) #b00000000000000000000000111111111) (= (mask!11144 thiss!1504) #b00000000000000000000001111111111) (= (mask!11144 thiss!1504) #b00000000000000000000011111111111) (= (mask!11144 thiss!1504) #b00000000000000000000111111111111) (= (mask!11144 thiss!1504) #b00000000000000000001111111111111) (= (mask!11144 thiss!1504) #b00000000000000000011111111111111) (= (mask!11144 thiss!1504) #b00000000000000000111111111111111) (= (mask!11144 thiss!1504) #b00000000000000001111111111111111) (= (mask!11144 thiss!1504) #b00000000000000011111111111111111) (= (mask!11144 thiss!1504) #b00000000000000111111111111111111) (= (mask!11144 thiss!1504) #b00000000000001111111111111111111) (= (mask!11144 thiss!1504) #b00000000000011111111111111111111) (= (mask!11144 thiss!1504) #b00000000000111111111111111111111) (= (mask!11144 thiss!1504) #b00000000001111111111111111111111) (= (mask!11144 thiss!1504) #b00000000011111111111111111111111) (= (mask!11144 thiss!1504) #b00000000111111111111111111111111) (= (mask!11144 thiss!1504) #b00000001111111111111111111111111) (= (mask!11144 thiss!1504) #b00000011111111111111111111111111) (= (mask!11144 thiss!1504) #b00000111111111111111111111111111) (= (mask!11144 thiss!1504) #b00001111111111111111111111111111) (= (mask!11144 thiss!1504) #b00011111111111111111111111111111) (= (mask!11144 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11144 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!260852 d!62809))

(declare-fun d!62811 () Bool)

(assert (=> d!62811 (= (arrayCountValidKeys!0 lt!131647 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!131879 () Unit!8084)

(declare-fun choose!2 (array!12605 (_ BitVec 32)) Unit!8084)

(assert (=> d!62811 (= lt!131879 (choose!2 lt!131647 index!297))))

(declare-fun e!169229 () Bool)

(assert (=> d!62811 e!169229))

(declare-fun res!127625 () Bool)

(assert (=> d!62811 (=> (not res!127625) (not e!169229))))

(assert (=> d!62811 (= res!127625 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6316 lt!131647))))))

(assert (=> d!62811 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!131647 index!297) lt!131879)))

(declare-fun b!261156 () Bool)

(declare-fun res!127626 () Bool)

(assert (=> b!261156 (=> (not res!127626) (not e!169229))))

(assert (=> b!261156 (= res!127626 (validKeyInArray!0 (select (arr!5966 lt!131647) index!297)))))

(declare-fun b!261157 () Bool)

(assert (=> b!261157 (= e!169229 (bvslt (size!6316 lt!131647) #b01111111111111111111111111111111))))

(assert (= (and d!62811 res!127625) b!261156))

(assert (= (and b!261156 res!127626) b!261157))

(declare-fun m!277241 () Bool)

(assert (=> d!62811 m!277241))

(declare-fun m!277243 () Bool)

(assert (=> d!62811 m!277243))

(declare-fun m!277245 () Bool)

(assert (=> b!261156 m!277245))

(assert (=> b!261156 m!277245))

(declare-fun m!277247 () Bool)

(assert (=> b!261156 m!277247))

(assert (=> b!260852 d!62811))

(declare-fun d!62813 () Bool)

(declare-fun res!127632 () Bool)

(declare-fun e!169236 () Bool)

(assert (=> d!62813 (=> res!127632 e!169236)))

(assert (=> d!62813 (= res!127632 (bvsge #b00000000000000000000000000000000 (size!6316 lt!131647)))))

(assert (=> d!62813 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!131647 (mask!11144 thiss!1504)) e!169236)))

(declare-fun b!261166 () Bool)

(declare-fun e!169237 () Bool)

(assert (=> b!261166 (= e!169236 e!169237)))

(declare-fun c!44433 () Bool)

(assert (=> b!261166 (= c!44433 (validKeyInArray!0 (select (arr!5966 lt!131647) #b00000000000000000000000000000000)))))

(declare-fun bm!24908 () Bool)

(declare-fun call!24911 () Bool)

(assert (=> bm!24908 (= call!24911 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!131647 (mask!11144 thiss!1504)))))

(declare-fun b!261167 () Bool)

(assert (=> b!261167 (= e!169237 call!24911)))

(declare-fun b!261168 () Bool)

(declare-fun e!169238 () Bool)

(assert (=> b!261168 (= e!169237 e!169238)))

(declare-fun lt!131887 () (_ BitVec 64))

(assert (=> b!261168 (= lt!131887 (select (arr!5966 lt!131647) #b00000000000000000000000000000000))))

(declare-fun lt!131888 () Unit!8084)

(assert (=> b!261168 (= lt!131888 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131647 lt!131887 #b00000000000000000000000000000000))))

(assert (=> b!261168 (arrayContainsKey!0 lt!131647 lt!131887 #b00000000000000000000000000000000)))

(declare-fun lt!131886 () Unit!8084)

(assert (=> b!261168 (= lt!131886 lt!131888)))

(declare-fun res!127631 () Bool)

(assert (=> b!261168 (= res!127631 (= (seekEntryOrOpen!0 (select (arr!5966 lt!131647) #b00000000000000000000000000000000) lt!131647 (mask!11144 thiss!1504)) (Found!1151 #b00000000000000000000000000000000)))))

(assert (=> b!261168 (=> (not res!127631) (not e!169238))))

(declare-fun b!261169 () Bool)

(assert (=> b!261169 (= e!169238 call!24911)))

(assert (= (and d!62813 (not res!127632)) b!261166))

(assert (= (and b!261166 c!44433) b!261168))

(assert (= (and b!261166 (not c!44433)) b!261167))

(assert (= (and b!261168 res!127631) b!261169))

(assert (= (or b!261169 b!261167) bm!24908))

(assert (=> b!261166 m!277177))

(assert (=> b!261166 m!277177))

(assert (=> b!261166 m!277181))

(declare-fun m!277249 () Bool)

(assert (=> bm!24908 m!277249))

(assert (=> b!261168 m!277177))

(declare-fun m!277251 () Bool)

(assert (=> b!261168 m!277251))

(declare-fun m!277253 () Bool)

(assert (=> b!261168 m!277253))

(assert (=> b!261168 m!277177))

(declare-fun m!277255 () Bool)

(assert (=> b!261168 m!277255))

(assert (=> b!260852 d!62813))

(declare-fun d!62815 () Bool)

(declare-fun e!169241 () Bool)

(assert (=> d!62815 e!169241))

(declare-fun res!127635 () Bool)

(assert (=> d!62815 (=> (not res!127635) (not e!169241))))

(assert (=> d!62815 (= res!127635 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6316 (_keys!6991 thiss!1504)))))))

(declare-fun lt!131891 () Unit!8084)

(declare-fun choose!41 (array!12605 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3739) Unit!8084)

(assert (=> d!62815 (= lt!131891 (choose!41 (_keys!6991 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3736))))

(assert (=> d!62815 (bvslt (size!6316 (_keys!6991 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!62815 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6991 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3736) lt!131891)))

(declare-fun b!261172 () Bool)

(assert (=> b!261172 (= e!169241 (arrayNoDuplicates!0 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) #b00000000000000000000000000000000 Nil!3736))))

(assert (= (and d!62815 res!127635) b!261172))

(declare-fun m!277257 () Bool)

(assert (=> d!62815 m!277257))

(assert (=> b!261172 m!276885))

(declare-fun m!277259 () Bool)

(assert (=> b!261172 m!277259))

(assert (=> b!260852 d!62815))

(declare-fun d!62817 () Bool)

(assert (=> d!62817 (arrayContainsKey!0 lt!131647 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!131894 () Unit!8084)

(declare-fun choose!13 (array!12605 (_ BitVec 64) (_ BitVec 32)) Unit!8084)

(assert (=> d!62817 (= lt!131894 (choose!13 lt!131647 key!932 index!297))))

(assert (=> d!62817 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!62817 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131647 key!932 index!297) lt!131894)))

(declare-fun bs!9217 () Bool)

(assert (= bs!9217 d!62817))

(assert (=> bs!9217 m!276871))

(declare-fun m!277261 () Bool)

(assert (=> bs!9217 m!277261))

(assert (=> b!260852 d!62817))

(declare-fun b!261181 () Bool)

(declare-fun e!169247 () (_ BitVec 32))

(declare-fun call!24914 () (_ BitVec 32))

(assert (=> b!261181 (= e!169247 (bvadd #b00000000000000000000000000000001 call!24914))))

(declare-fun bm!24911 () Bool)

(assert (=> bm!24911 (= call!24914 (arrayCountValidKeys!0 lt!131647 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6316 (_keys!6991 thiss!1504))))))

(declare-fun b!261182 () Bool)

(declare-fun e!169246 () (_ BitVec 32))

(assert (=> b!261182 (= e!169246 e!169247)))

(declare-fun c!44439 () Bool)

(assert (=> b!261182 (= c!44439 (validKeyInArray!0 (select (arr!5966 lt!131647) #b00000000000000000000000000000000)))))

(declare-fun b!261183 () Bool)

(assert (=> b!261183 (= e!169247 call!24914)))

(declare-fun d!62819 () Bool)

(declare-fun lt!131897 () (_ BitVec 32))

(assert (=> d!62819 (and (bvsge lt!131897 #b00000000000000000000000000000000) (bvsle lt!131897 (bvsub (size!6316 lt!131647) #b00000000000000000000000000000000)))))

(assert (=> d!62819 (= lt!131897 e!169246)))

(declare-fun c!44438 () Bool)

(assert (=> d!62819 (= c!44438 (bvsge #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))))))

(assert (=> d!62819 (and (bvsle #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6316 (_keys!6991 thiss!1504)) (size!6316 lt!131647)))))

(assert (=> d!62819 (= (arrayCountValidKeys!0 lt!131647 #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))) lt!131897)))

(declare-fun b!261184 () Bool)

(assert (=> b!261184 (= e!169246 #b00000000000000000000000000000000)))

(assert (= (and d!62819 c!44438) b!261184))

(assert (= (and d!62819 (not c!44438)) b!261182))

(assert (= (and b!261182 c!44439) b!261181))

(assert (= (and b!261182 (not c!44439)) b!261183))

(assert (= (or b!261181 b!261183) bm!24911))

(declare-fun m!277263 () Bool)

(assert (=> bm!24911 m!277263))

(assert (=> b!261182 m!277177))

(assert (=> b!261182 m!277177))

(assert (=> b!261182 m!277181))

(assert (=> b!260852 d!62819))

(assert (=> b!260852 d!62777))

(declare-fun d!62821 () Bool)

(declare-fun e!169250 () Bool)

(assert (=> d!62821 e!169250))

(declare-fun res!127638 () Bool)

(assert (=> d!62821 (=> (not res!127638) (not e!169250))))

(assert (=> d!62821 (= res!127638 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6316 (_keys!6991 thiss!1504)))))))

(declare-fun lt!131900 () Unit!8084)

(declare-fun choose!102 ((_ BitVec 64) array!12605 (_ BitVec 32) (_ BitVec 32)) Unit!8084)

(assert (=> d!62821 (= lt!131900 (choose!102 key!932 (_keys!6991 thiss!1504) index!297 (mask!11144 thiss!1504)))))

(assert (=> d!62821 (validMask!0 (mask!11144 thiss!1504))))

(assert (=> d!62821 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6991 thiss!1504) index!297 (mask!11144 thiss!1504)) lt!131900)))

(declare-fun b!261187 () Bool)

(assert (=> b!261187 (= e!169250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) (mask!11144 thiss!1504)))))

(assert (= (and d!62821 res!127638) b!261187))

(declare-fun m!277265 () Bool)

(assert (=> d!62821 m!277265))

(assert (=> d!62821 m!276865))

(assert (=> b!261187 m!276885))

(declare-fun m!277267 () Bool)

(assert (=> b!261187 m!277267))

(assert (=> b!260852 d!62821))

(declare-fun b!261188 () Bool)

(declare-fun e!169252 () (_ BitVec 32))

(declare-fun call!24915 () (_ BitVec 32))

(assert (=> b!261188 (= e!169252 (bvadd #b00000000000000000000000000000001 call!24915))))

(declare-fun bm!24912 () Bool)

(assert (=> bm!24912 (= call!24915 (arrayCountValidKeys!0 lt!131647 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!261189 () Bool)

(declare-fun e!169251 () (_ BitVec 32))

(assert (=> b!261189 (= e!169251 e!169252)))

(declare-fun c!44441 () Bool)

(assert (=> b!261189 (= c!44441 (validKeyInArray!0 (select (arr!5966 lt!131647) index!297)))))

(declare-fun b!261190 () Bool)

(assert (=> b!261190 (= e!169252 call!24915)))

(declare-fun d!62823 () Bool)

(declare-fun lt!131901 () (_ BitVec 32))

(assert (=> d!62823 (and (bvsge lt!131901 #b00000000000000000000000000000000) (bvsle lt!131901 (bvsub (size!6316 lt!131647) index!297)))))

(assert (=> d!62823 (= lt!131901 e!169251)))

(declare-fun c!44440 () Bool)

(assert (=> d!62823 (= c!44440 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62823 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6316 lt!131647)))))

(assert (=> d!62823 (= (arrayCountValidKeys!0 lt!131647 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!131901)))

(declare-fun b!261191 () Bool)

(assert (=> b!261191 (= e!169251 #b00000000000000000000000000000000)))

(assert (= (and d!62823 c!44440) b!261191))

(assert (= (and d!62823 (not c!44440)) b!261189))

(assert (= (and b!261189 c!44441) b!261188))

(assert (= (and b!261189 (not c!44441)) b!261190))

(assert (= (or b!261188 b!261190) bm!24912))

(declare-fun m!277269 () Bool)

(assert (=> bm!24912 m!277269))

(assert (=> b!261189 m!277245))

(assert (=> b!261189 m!277245))

(assert (=> b!261189 m!277247))

(assert (=> b!260852 d!62823))

(declare-fun b!261192 () Bool)

(declare-fun e!169254 () (_ BitVec 32))

(declare-fun call!24916 () (_ BitVec 32))

(assert (=> b!261192 (= e!169254 (bvadd #b00000000000000000000000000000001 call!24916))))

(declare-fun bm!24913 () Bool)

(assert (=> bm!24913 (= call!24916 (arrayCountValidKeys!0 (_keys!6991 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6316 (_keys!6991 thiss!1504))))))

(declare-fun b!261193 () Bool)

(declare-fun e!169253 () (_ BitVec 32))

(assert (=> b!261193 (= e!169253 e!169254)))

(declare-fun c!44443 () Bool)

(assert (=> b!261193 (= c!44443 (validKeyInArray!0 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!261194 () Bool)

(assert (=> b!261194 (= e!169254 call!24916)))

(declare-fun d!62825 () Bool)

(declare-fun lt!131902 () (_ BitVec 32))

(assert (=> d!62825 (and (bvsge lt!131902 #b00000000000000000000000000000000) (bvsle lt!131902 (bvsub (size!6316 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!62825 (= lt!131902 e!169253)))

(declare-fun c!44442 () Bool)

(assert (=> d!62825 (= c!44442 (bvsge #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))))))

(assert (=> d!62825 (and (bvsle #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6316 (_keys!6991 thiss!1504)) (size!6316 (_keys!6991 thiss!1504))))))

(assert (=> d!62825 (= (arrayCountValidKeys!0 (_keys!6991 thiss!1504) #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))) lt!131902)))

(declare-fun b!261195 () Bool)

(assert (=> b!261195 (= e!169253 #b00000000000000000000000000000000)))

(assert (= (and d!62825 c!44442) b!261195))

(assert (= (and d!62825 (not c!44442)) b!261193))

(assert (= (and b!261193 c!44443) b!261192))

(assert (= (and b!261193 (not c!44443)) b!261194))

(assert (= (or b!261192 b!261194) bm!24913))

(declare-fun m!277271 () Bool)

(assert (=> bm!24913 m!277271))

(assert (=> b!261193 m!277057))

(assert (=> b!261193 m!277057))

(assert (=> b!261193 m!277083))

(assert (=> b!260852 d!62825))

(declare-fun b!261206 () Bool)

(declare-fun e!169264 () Bool)

(declare-fun e!169263 () Bool)

(assert (=> b!261206 (= e!169264 e!169263)))

(declare-fun c!44446 () Bool)

(assert (=> b!261206 (= c!44446 (validKeyInArray!0 (select (arr!5966 lt!131647) #b00000000000000000000000000000000)))))

(declare-fun b!261207 () Bool)

(declare-fun call!24919 () Bool)

(assert (=> b!261207 (= e!169263 call!24919)))

(declare-fun d!62827 () Bool)

(declare-fun res!127645 () Bool)

(declare-fun e!169265 () Bool)

(assert (=> d!62827 (=> res!127645 e!169265)))

(assert (=> d!62827 (= res!127645 (bvsge #b00000000000000000000000000000000 (size!6316 lt!131647)))))

(assert (=> d!62827 (= (arrayNoDuplicates!0 lt!131647 #b00000000000000000000000000000000 Nil!3736) e!169265)))

(declare-fun bm!24916 () Bool)

(assert (=> bm!24916 (= call!24919 (arrayNoDuplicates!0 lt!131647 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44446 (Cons!3735 (select (arr!5966 lt!131647) #b00000000000000000000000000000000) Nil!3736) Nil!3736)))))

(declare-fun b!261208 () Bool)

(assert (=> b!261208 (= e!169265 e!169264)))

(declare-fun res!127646 () Bool)

(assert (=> b!261208 (=> (not res!127646) (not e!169264))))

(declare-fun e!169266 () Bool)

(assert (=> b!261208 (= res!127646 (not e!169266))))

(declare-fun res!127647 () Bool)

(assert (=> b!261208 (=> (not res!127647) (not e!169266))))

(assert (=> b!261208 (= res!127647 (validKeyInArray!0 (select (arr!5966 lt!131647) #b00000000000000000000000000000000)))))

(declare-fun b!261209 () Bool)

(declare-fun contains!1873 (List!3739 (_ BitVec 64)) Bool)

(assert (=> b!261209 (= e!169266 (contains!1873 Nil!3736 (select (arr!5966 lt!131647) #b00000000000000000000000000000000)))))

(declare-fun b!261210 () Bool)

(assert (=> b!261210 (= e!169263 call!24919)))

(assert (= (and d!62827 (not res!127645)) b!261208))

(assert (= (and b!261208 res!127647) b!261209))

(assert (= (and b!261208 res!127646) b!261206))

(assert (= (and b!261206 c!44446) b!261207))

(assert (= (and b!261206 (not c!44446)) b!261210))

(assert (= (or b!261207 b!261210) bm!24916))

(assert (=> b!261206 m!277177))

(assert (=> b!261206 m!277177))

(assert (=> b!261206 m!277181))

(assert (=> bm!24916 m!277177))

(declare-fun m!277273 () Bool)

(assert (=> bm!24916 m!277273))

(assert (=> b!261208 m!277177))

(assert (=> b!261208 m!277177))

(assert (=> b!261208 m!277181))

(assert (=> b!261209 m!277177))

(assert (=> b!261209 m!277177))

(declare-fun m!277275 () Bool)

(assert (=> b!261209 m!277275))

(assert (=> b!260852 d!62827))

(declare-fun b!261228 () Bool)

(declare-fun res!127658 () Bool)

(declare-fun e!169278 () Bool)

(assert (=> b!261228 (=> (not res!127658) (not e!169278))))

(declare-fun call!24924 () Bool)

(assert (=> b!261228 (= res!127658 call!24924)))

(declare-fun e!169277 () Bool)

(assert (=> b!261228 (= e!169277 e!169278)))

(declare-fun bm!24921 () Bool)

(declare-fun call!24925 () Bool)

(assert (=> bm!24921 (= call!24925 (arrayContainsKey!0 (_keys!6991 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261229 () Bool)

(declare-fun lt!131908 () SeekEntryResult!1151)

(assert (=> b!261229 (and (bvsge (index!6774 lt!131908) #b00000000000000000000000000000000) (bvslt (index!6774 lt!131908) (size!6316 (_keys!6991 thiss!1504))))))

(declare-fun res!127659 () Bool)

(assert (=> b!261229 (= res!127659 (= (select (arr!5966 (_keys!6991 thiss!1504)) (index!6774 lt!131908)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169276 () Bool)

(assert (=> b!261229 (=> (not res!127659) (not e!169276))))

(declare-fun b!261230 () Bool)

(declare-fun e!169275 () Bool)

(assert (=> b!261230 (= e!169275 e!169277)))

(declare-fun c!44452 () Bool)

(assert (=> b!261230 (= c!44452 ((_ is MissingVacant!1151) lt!131908))))

(declare-fun b!261231 () Bool)

(assert (=> b!261231 (= e!169278 (not call!24925))))

(declare-fun b!261232 () Bool)

(assert (=> b!261232 (= e!169275 e!169276)))

(declare-fun res!127657 () Bool)

(assert (=> b!261232 (= res!127657 call!24924)))

(assert (=> b!261232 (=> (not res!127657) (not e!169276))))

(declare-fun bm!24922 () Bool)

(declare-fun c!44451 () Bool)

(assert (=> bm!24922 (= call!24924 (inRange!0 (ite c!44451 (index!6774 lt!131908) (index!6777 lt!131908)) (mask!11144 thiss!1504)))))

(declare-fun b!261227 () Bool)

(declare-fun res!127656 () Bool)

(assert (=> b!261227 (=> (not res!127656) (not e!169278))))

(assert (=> b!261227 (= res!127656 (= (select (arr!5966 (_keys!6991 thiss!1504)) (index!6777 lt!131908)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261227 (and (bvsge (index!6777 lt!131908) #b00000000000000000000000000000000) (bvslt (index!6777 lt!131908) (size!6316 (_keys!6991 thiss!1504))))))

(declare-fun d!62829 () Bool)

(assert (=> d!62829 e!169275))

(assert (=> d!62829 (= c!44451 ((_ is MissingZero!1151) lt!131908))))

(assert (=> d!62829 (= lt!131908 (seekEntryOrOpen!0 key!932 (_keys!6991 thiss!1504) (mask!11144 thiss!1504)))))

(declare-fun lt!131907 () Unit!8084)

(declare-fun choose!1282 (array!12605 array!12603 (_ BitVec 32) (_ BitVec 32) V!8481 V!8481 (_ BitVec 64) Int) Unit!8084)

(assert (=> d!62829 (= lt!131907 (choose!1282 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 (defaultEntry!4807 thiss!1504)))))

(assert (=> d!62829 (validMask!0 (mask!11144 thiss!1504))))

(assert (=> d!62829 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!432 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 (defaultEntry!4807 thiss!1504)) lt!131907)))

(declare-fun b!261233 () Bool)

(assert (=> b!261233 (= e!169277 ((_ is Undefined!1151) lt!131908))))

(declare-fun b!261234 () Bool)

(assert (=> b!261234 (= e!169276 (not call!24925))))

(assert (= (and d!62829 c!44451) b!261232))

(assert (= (and d!62829 (not c!44451)) b!261230))

(assert (= (and b!261232 res!127657) b!261229))

(assert (= (and b!261229 res!127659) b!261234))

(assert (= (and b!261230 c!44452) b!261228))

(assert (= (and b!261230 (not c!44452)) b!261233))

(assert (= (and b!261228 res!127658) b!261227))

(assert (= (and b!261227 res!127656) b!261231))

(assert (= (or b!261232 b!261228) bm!24922))

(assert (= (or b!261234 b!261231) bm!24921))

(assert (=> bm!24921 m!276867))

(assert (=> d!62829 m!276913))

(declare-fun m!277277 () Bool)

(assert (=> d!62829 m!277277))

(assert (=> d!62829 m!276865))

(declare-fun m!277279 () Bool)

(assert (=> bm!24922 m!277279))

(declare-fun m!277281 () Bool)

(assert (=> b!261229 m!277281))

(declare-fun m!277283 () Bool)

(assert (=> b!261227 m!277283))

(assert (=> b!260856 d!62829))

(declare-fun mapIsEmpty!11301 () Bool)

(declare-fun mapRes!11301 () Bool)

(assert (=> mapIsEmpty!11301 mapRes!11301))

(declare-fun b!261241 () Bool)

(declare-fun e!169284 () Bool)

(assert (=> b!261241 (= e!169284 tp_is_empty!6625)))

(declare-fun mapNonEmpty!11301 () Bool)

(declare-fun tp!23631 () Bool)

(assert (=> mapNonEmpty!11301 (= mapRes!11301 (and tp!23631 e!169284))))

(declare-fun mapKey!11301 () (_ BitVec 32))

(declare-fun mapValue!11301 () ValueCell!2969)

(declare-fun mapRest!11301 () (Array (_ BitVec 32) ValueCell!2969))

(assert (=> mapNonEmpty!11301 (= mapRest!11292 (store mapRest!11301 mapKey!11301 mapValue!11301))))

(declare-fun b!261242 () Bool)

(declare-fun e!169283 () Bool)

(assert (=> b!261242 (= e!169283 tp_is_empty!6625)))

(declare-fun condMapEmpty!11301 () Bool)

(declare-fun mapDefault!11301 () ValueCell!2969)

(assert (=> mapNonEmpty!11292 (= condMapEmpty!11301 (= mapRest!11292 ((as const (Array (_ BitVec 32) ValueCell!2969)) mapDefault!11301)))))

(assert (=> mapNonEmpty!11292 (= tp!23616 (and e!169283 mapRes!11301))))

(assert (= (and mapNonEmpty!11292 condMapEmpty!11301) mapIsEmpty!11301))

(assert (= (and mapNonEmpty!11292 (not condMapEmpty!11301)) mapNonEmpty!11301))

(assert (= (and mapNonEmpty!11301 ((_ is ValueCellFull!2969) mapValue!11301)) b!261241))

(assert (= (and mapNonEmpty!11292 ((_ is ValueCellFull!2969) mapDefault!11301)) b!261242))

(declare-fun m!277285 () Bool)

(assert (=> mapNonEmpty!11301 m!277285))

(declare-fun b_lambda!8313 () Bool)

(assert (= b_lambda!8309 (or (and b!260854 b_free!6763) b_lambda!8313)))

(declare-fun b_lambda!8315 () Bool)

(assert (= b_lambda!8311 (or (and b!260854 b_free!6763) b_lambda!8315)))

(check-sat (not b!261070) (not b!261187) (not b!261113) (not bm!24893) (not d!62799) (not b!261127) (not d!62787) (not b!261000) (not d!62781) (not b!261013) (not d!62801) (not b!261138) (not b!261168) (not bm!24902) (not b!261189) (not bm!24904) (not d!62811) (not bm!24898) (not b!261166) (not b!261087) (not b!261089) (not b!261078) (not d!62793) (not b!261156) (not b!261209) (not b!261107) (not b!261080) (not d!62795) (not b!261073) (not b!261081) (not d!62817) (not bm!24922) (not d!62829) tp_is_empty!6625 b_and!13905 (not b!261146) (not bm!24911) (not b!261208) (not d!62815) (not bm!24895) (not b!261128) (not b!261136) (not bm!24905) (not b!261123) (not b!261182) (not d!62797) (not b!261088) (not b!261206) (not b!261131) (not bm!24900) (not b!261097) (not bm!24912) (not b!261125) (not b!261112) (not b_next!6763) (not bm!24916) (not bm!24913) (not b!261027) (not b!261025) (not mapNonEmpty!11301) (not b!261106) (not bm!24897) (not b!261147) (not d!62805) (not bm!24921) (not b!261151) (not d!62785) (not d!62807) (not d!62821) (not b!261172) (not bm!24908) (not b_lambda!8315) (not b_lambda!8313) (not b!261193) (not b!261122) (not b!261139) (not b!261105) (not b!261145))
(check-sat b_and!13905 (not b_next!6763))
(get-model)

(declare-fun d!62831 () Bool)

(declare-fun e!169285 () Bool)

(assert (=> d!62831 e!169285))

(declare-fun res!127660 () Bool)

(assert (=> d!62831 (=> res!127660 e!169285)))

(declare-fun lt!131910 () Bool)

(assert (=> d!62831 (= res!127660 (not lt!131910))))

(declare-fun lt!131909 () Bool)

(assert (=> d!62831 (= lt!131910 lt!131909)))

(declare-fun lt!131911 () Unit!8084)

(declare-fun e!169286 () Unit!8084)

(assert (=> d!62831 (= lt!131911 e!169286)))

(declare-fun c!44453 () Bool)

(assert (=> d!62831 (= c!44453 lt!131909)))

(assert (=> d!62831 (= lt!131909 (containsKey!309 (toList!1903 (getCurrentListMap!1435 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504))) key!932))))

(assert (=> d!62831 (= (contains!1870 (getCurrentListMap!1435 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) key!932) lt!131910)))

(declare-fun b!261243 () Bool)

(declare-fun lt!131912 () Unit!8084)

(assert (=> b!261243 (= e!169286 lt!131912)))

(assert (=> b!261243 (= lt!131912 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1903 (getCurrentListMap!1435 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504))) key!932))))

(assert (=> b!261243 (isDefined!258 (getValueByKey!318 (toList!1903 (getCurrentListMap!1435 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504))) key!932))))

(declare-fun b!261244 () Bool)

(declare-fun Unit!8100 () Unit!8084)

(assert (=> b!261244 (= e!169286 Unit!8100)))

(declare-fun b!261245 () Bool)

(assert (=> b!261245 (= e!169285 (isDefined!258 (getValueByKey!318 (toList!1903 (getCurrentListMap!1435 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504))) key!932)))))

(assert (= (and d!62831 c!44453) b!261243))

(assert (= (and d!62831 (not c!44453)) b!261244))

(assert (= (and d!62831 (not res!127660)) b!261245))

(declare-fun m!277287 () Bool)

(assert (=> d!62831 m!277287))

(declare-fun m!277289 () Bool)

(assert (=> b!261243 m!277289))

(declare-fun m!277291 () Bool)

(assert (=> b!261243 m!277291))

(assert (=> b!261243 m!277291))

(declare-fun m!277293 () Bool)

(assert (=> b!261243 m!277293))

(assert (=> b!261245 m!277291))

(assert (=> b!261245 m!277291))

(assert (=> b!261245 m!277293))

(assert (=> d!62793 d!62831))

(assert (=> d!62793 d!62787))

(declare-fun d!62833 () Bool)

(assert (=> d!62833 (contains!1870 (getCurrentListMap!1435 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) key!932)))

(assert (=> d!62833 true))

(declare-fun _$17!92 () Unit!8084)

(assert (=> d!62833 (= (choose!1279 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) _$17!92)))

(declare-fun bs!9218 () Bool)

(assert (= bs!9218 d!62833))

(assert (=> bs!9218 m!276923))

(assert (=> bs!9218 m!276923))

(assert (=> bs!9218 m!277139))

(assert (=> d!62793 d!62833))

(assert (=> d!62793 d!62809))

(assert (=> d!62795 d!62781))

(declare-fun d!62835 () Bool)

(declare-fun e!169289 () Bool)

(assert (=> d!62835 e!169289))

(declare-fun res!127666 () Bool)

(assert (=> d!62835 (=> (not res!127666) (not e!169289))))

(declare-fun lt!131915 () SeekEntryResult!1151)

(assert (=> d!62835 (= res!127666 ((_ is Found!1151) lt!131915))))

(assert (=> d!62835 (= lt!131915 (seekEntryOrOpen!0 key!932 (_keys!6991 thiss!1504) (mask!11144 thiss!1504)))))

(assert (=> d!62835 true))

(declare-fun _$33!183 () Unit!8084)

(assert (=> d!62835 (= (choose!1280 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 (defaultEntry!4807 thiss!1504)) _$33!183)))

(declare-fun b!261250 () Bool)

(declare-fun res!127665 () Bool)

(assert (=> b!261250 (=> (not res!127665) (not e!169289))))

(assert (=> b!261250 (= res!127665 (inRange!0 (index!6775 lt!131915) (mask!11144 thiss!1504)))))

(declare-fun b!261251 () Bool)

(assert (=> b!261251 (= e!169289 (= (select (arr!5966 (_keys!6991 thiss!1504)) (index!6775 lt!131915)) key!932))))

(assert (= (and d!62835 res!127666) b!261250))

(assert (= (and b!261250 res!127665) b!261251))

(assert (=> d!62835 m!276913))

(declare-fun m!277295 () Bool)

(assert (=> b!261250 m!277295))

(declare-fun m!277297 () Bool)

(assert (=> b!261251 m!277297))

(assert (=> d!62795 d!62835))

(assert (=> d!62795 d!62809))

(declare-fun b!261252 () Bool)

(declare-fun e!169291 () Bool)

(declare-fun e!169290 () Bool)

(assert (=> b!261252 (= e!169291 e!169290)))

(declare-fun c!44454 () Bool)

(assert (=> b!261252 (= c!44454 (validKeyInArray!0 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!261253 () Bool)

(declare-fun call!24926 () Bool)

(assert (=> b!261253 (= e!169290 call!24926)))

(declare-fun d!62837 () Bool)

(declare-fun res!127667 () Bool)

(declare-fun e!169292 () Bool)

(assert (=> d!62837 (=> res!127667 e!169292)))

(assert (=> d!62837 (= res!127667 (bvsge #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))))))

(assert (=> d!62837 (= (arrayNoDuplicates!0 (_keys!6991 thiss!1504) #b00000000000000000000000000000000 Nil!3736) e!169292)))

(declare-fun bm!24923 () Bool)

(assert (=> bm!24923 (= call!24926 (arrayNoDuplicates!0 (_keys!6991 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44454 (Cons!3735 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000) Nil!3736) Nil!3736)))))

(declare-fun b!261254 () Bool)

(assert (=> b!261254 (= e!169292 e!169291)))

(declare-fun res!127668 () Bool)

(assert (=> b!261254 (=> (not res!127668) (not e!169291))))

(declare-fun e!169293 () Bool)

(assert (=> b!261254 (= res!127668 (not e!169293))))

(declare-fun res!127669 () Bool)

(assert (=> b!261254 (=> (not res!127669) (not e!169293))))

(assert (=> b!261254 (= res!127669 (validKeyInArray!0 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!261255 () Bool)

(assert (=> b!261255 (= e!169293 (contains!1873 Nil!3736 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!261256 () Bool)

(assert (=> b!261256 (= e!169290 call!24926)))

(assert (= (and d!62837 (not res!127667)) b!261254))

(assert (= (and b!261254 res!127669) b!261255))

(assert (= (and b!261254 res!127668) b!261252))

(assert (= (and b!261252 c!44454) b!261253))

(assert (= (and b!261252 (not c!44454)) b!261256))

(assert (= (or b!261253 b!261256) bm!24923))

(assert (=> b!261252 m!277057))

(assert (=> b!261252 m!277057))

(assert (=> b!261252 m!277083))

(assert (=> bm!24923 m!277057))

(declare-fun m!277299 () Bool)

(assert (=> bm!24923 m!277299))

(assert (=> b!261254 m!277057))

(assert (=> b!261254 m!277057))

(assert (=> b!261254 m!277083))

(assert (=> b!261255 m!277057))

(assert (=> b!261255 m!277057))

(declare-fun m!277301 () Bool)

(assert (=> b!261255 m!277301))

(assert (=> b!261107 d!62837))

(declare-fun d!62839 () Bool)

(assert (=> d!62839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) (mask!11144 thiss!1504))))

(assert (=> d!62839 true))

(declare-fun _$56!42 () Unit!8084)

(assert (=> d!62839 (= (choose!102 key!932 (_keys!6991 thiss!1504) index!297 (mask!11144 thiss!1504)) _$56!42)))

(declare-fun bs!9219 () Bool)

(assert (= bs!9219 d!62839))

(assert (=> bs!9219 m!276885))

(assert (=> bs!9219 m!277267))

(assert (=> d!62821 d!62839))

(assert (=> d!62821 d!62809))

(declare-fun b!261281 () Bool)

(declare-fun e!169309 () ListLongMap!3775)

(assert (=> b!261281 (= e!169309 (ListLongMap!3776 Nil!3735))))

(declare-fun b!261283 () Bool)

(declare-fun e!169311 () ListLongMap!3775)

(declare-fun call!24929 () ListLongMap!3775)

(assert (=> b!261283 (= e!169311 call!24929)))

(declare-fun b!261284 () Bool)

(declare-fun res!127680 () Bool)

(declare-fun e!169308 () Bool)

(assert (=> b!261284 (=> (not res!127680) (not e!169308))))

(declare-fun lt!131932 () ListLongMap!3775)

(assert (=> b!261284 (= res!127680 (not (contains!1870 lt!131932 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!261285 () Bool)

(assert (=> b!261285 (= e!169309 e!169311)))

(declare-fun c!44466 () Bool)

(assert (=> b!261285 (= c!44466 (validKeyInArray!0 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!261286 () Bool)

(declare-fun e!169312 () Bool)

(declare-fun e!169314 () Bool)

(assert (=> b!261286 (= e!169312 e!169314)))

(declare-fun c!44463 () Bool)

(assert (=> b!261286 (= c!44463 (bvslt #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))))))

(declare-fun b!261287 () Bool)

(declare-fun isEmpty!544 (ListLongMap!3775) Bool)

(assert (=> b!261287 (= e!169314 (isEmpty!544 lt!131932))))

(declare-fun b!261288 () Bool)

(assert (=> b!261288 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))))))

(assert (=> b!261288 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6315 (_values!4790 thiss!1504))))))

(declare-fun e!169310 () Bool)

(assert (=> b!261288 (= e!169310 (= (apply!259 lt!131932 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)) (get!3083 (select (arr!5965 (_values!4790 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!261289 () Bool)

(declare-fun e!169313 () Bool)

(assert (=> b!261289 (= e!169313 (validKeyInArray!0 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!261289 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!261290 () Bool)

(assert (=> b!261290 (= e!169308 e!169312)))

(declare-fun c!44465 () Bool)

(assert (=> b!261290 (= c!44465 e!169313)))

(declare-fun res!127679 () Bool)

(assert (=> b!261290 (=> (not res!127679) (not e!169313))))

(assert (=> b!261290 (= res!127679 (bvslt #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))))))

(declare-fun b!261291 () Bool)

(declare-fun lt!131934 () Unit!8084)

(declare-fun lt!131933 () Unit!8084)

(assert (=> b!261291 (= lt!131934 lt!131933)))

(declare-fun lt!131936 () (_ BitVec 64))

(declare-fun lt!131931 () V!8481)

(declare-fun lt!131930 () ListLongMap!3775)

(declare-fun lt!131935 () (_ BitVec 64))

(assert (=> b!261291 (not (contains!1870 (+!700 lt!131930 (tuple2!4861 lt!131936 lt!131931)) lt!131935))))

(declare-fun addStillNotContains!130 (ListLongMap!3775 (_ BitVec 64) V!8481 (_ BitVec 64)) Unit!8084)

(assert (=> b!261291 (= lt!131933 (addStillNotContains!130 lt!131930 lt!131936 lt!131931 lt!131935))))

(assert (=> b!261291 (= lt!131935 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!261291 (= lt!131931 (get!3083 (select (arr!5965 (_values!4790 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261291 (= lt!131936 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!261291 (= lt!131930 call!24929)))

(assert (=> b!261291 (= e!169311 (+!700 call!24929 (tuple2!4861 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000) (get!3083 (select (arr!5965 (_values!4790 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!62841 () Bool)

(assert (=> d!62841 e!169308))

(declare-fun res!127681 () Bool)

(assert (=> d!62841 (=> (not res!127681) (not e!169308))))

(assert (=> d!62841 (= res!127681 (not (contains!1870 lt!131932 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62841 (= lt!131932 e!169309)))

(declare-fun c!44464 () Bool)

(assert (=> d!62841 (= c!44464 (bvsge #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))))))

(assert (=> d!62841 (validMask!0 (mask!11144 thiss!1504))))

(assert (=> d!62841 (= (getCurrentListMapNoExtraKeys!575 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) lt!131932)))

(declare-fun b!261282 () Bool)

(assert (=> b!261282 (= e!169314 (= lt!131932 (getCurrentListMapNoExtraKeys!575 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4807 thiss!1504))))))

(declare-fun b!261292 () Bool)

(assert (=> b!261292 (= e!169312 e!169310)))

(assert (=> b!261292 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))))))

(declare-fun res!127678 () Bool)

(assert (=> b!261292 (= res!127678 (contains!1870 lt!131932 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!261292 (=> (not res!127678) (not e!169310))))

(declare-fun bm!24926 () Bool)

(assert (=> bm!24926 (= call!24929 (getCurrentListMapNoExtraKeys!575 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4807 thiss!1504)))))

(assert (= (and d!62841 c!44464) b!261281))

(assert (= (and d!62841 (not c!44464)) b!261285))

(assert (= (and b!261285 c!44466) b!261291))

(assert (= (and b!261285 (not c!44466)) b!261283))

(assert (= (or b!261291 b!261283) bm!24926))

(assert (= (and d!62841 res!127681) b!261284))

(assert (= (and b!261284 res!127680) b!261290))

(assert (= (and b!261290 res!127679) b!261289))

(assert (= (and b!261290 c!44465) b!261292))

(assert (= (and b!261290 (not c!44465)) b!261286))

(assert (= (and b!261292 res!127678) b!261288))

(assert (= (and b!261286 c!44463) b!261282))

(assert (= (and b!261286 (not c!44463)) b!261287))

(declare-fun b_lambda!8317 () Bool)

(assert (=> (not b_lambda!8317) (not b!261288)))

(assert (=> b!261288 t!8806))

(declare-fun b_and!13907 () Bool)

(assert (= b_and!13905 (and (=> t!8806 result!5407) b_and!13907)))

(declare-fun b_lambda!8319 () Bool)

(assert (=> (not b_lambda!8319) (not b!261291)))

(assert (=> b!261291 t!8806))

(declare-fun b_and!13909 () Bool)

(assert (= b_and!13907 (and (=> t!8806 result!5407) b_and!13909)))

(declare-fun m!277303 () Bool)

(assert (=> b!261291 m!277303))

(declare-fun m!277305 () Bool)

(assert (=> b!261291 m!277305))

(assert (=> b!261291 m!277127))

(assert (=> b!261291 m!277129))

(assert (=> b!261291 m!277057))

(declare-fun m!277307 () Bool)

(assert (=> b!261291 m!277307))

(assert (=> b!261291 m!277303))

(assert (=> b!261291 m!277127))

(assert (=> b!261291 m!277129))

(assert (=> b!261291 m!277131))

(declare-fun m!277309 () Bool)

(assert (=> b!261291 m!277309))

(assert (=> b!261288 m!277057))

(declare-fun m!277311 () Bool)

(assert (=> b!261288 m!277311))

(assert (=> b!261288 m!277127))

(assert (=> b!261288 m!277129))

(assert (=> b!261288 m!277057))

(assert (=> b!261288 m!277127))

(assert (=> b!261288 m!277129))

(assert (=> b!261288 m!277131))

(assert (=> b!261289 m!277057))

(assert (=> b!261289 m!277057))

(assert (=> b!261289 m!277083))

(assert (=> b!261292 m!277057))

(assert (=> b!261292 m!277057))

(declare-fun m!277313 () Bool)

(assert (=> b!261292 m!277313))

(assert (=> b!261285 m!277057))

(assert (=> b!261285 m!277057))

(assert (=> b!261285 m!277083))

(declare-fun m!277315 () Bool)

(assert (=> bm!24926 m!277315))

(declare-fun m!277317 () Bool)

(assert (=> b!261284 m!277317))

(assert (=> b!261282 m!277315))

(declare-fun m!277319 () Bool)

(assert (=> b!261287 m!277319))

(declare-fun m!277321 () Bool)

(assert (=> d!62841 m!277321))

(assert (=> d!62841 m!276865))

(assert (=> bm!24897 d!62841))

(declare-fun d!62843 () Bool)

(declare-fun e!169315 () Bool)

(assert (=> d!62843 e!169315))

(declare-fun res!127682 () Bool)

(assert (=> d!62843 (=> res!127682 e!169315)))

(declare-fun lt!131938 () Bool)

(assert (=> d!62843 (= res!127682 (not lt!131938))))

(declare-fun lt!131937 () Bool)

(assert (=> d!62843 (= lt!131938 lt!131937)))

(declare-fun lt!131939 () Unit!8084)

(declare-fun e!169316 () Unit!8084)

(assert (=> d!62843 (= lt!131939 e!169316)))

(declare-fun c!44467 () Bool)

(assert (=> d!62843 (= c!44467 lt!131937)))

(assert (=> d!62843 (= lt!131937 (containsKey!309 (toList!1903 lt!131806) (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!62843 (= (contains!1870 lt!131806 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)) lt!131938)))

(declare-fun b!261293 () Bool)

(declare-fun lt!131940 () Unit!8084)

(assert (=> b!261293 (= e!169316 lt!131940)))

(assert (=> b!261293 (= lt!131940 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1903 lt!131806) (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!261293 (isDefined!258 (getValueByKey!318 (toList!1903 lt!131806) (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!261294 () Bool)

(declare-fun Unit!8101 () Unit!8084)

(assert (=> b!261294 (= e!169316 Unit!8101)))

(declare-fun b!261295 () Bool)

(assert (=> b!261295 (= e!169315 (isDefined!258 (getValueByKey!318 (toList!1903 lt!131806) (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!62843 c!44467) b!261293))

(assert (= (and d!62843 (not c!44467)) b!261294))

(assert (= (and d!62843 (not res!127682)) b!261295))

(assert (=> d!62843 m!277057))

(declare-fun m!277323 () Bool)

(assert (=> d!62843 m!277323))

(assert (=> b!261293 m!277057))

(declare-fun m!277325 () Bool)

(assert (=> b!261293 m!277325))

(assert (=> b!261293 m!277057))

(declare-fun m!277327 () Bool)

(assert (=> b!261293 m!277327))

(assert (=> b!261293 m!277327))

(declare-fun m!277329 () Bool)

(assert (=> b!261293 m!277329))

(assert (=> b!261295 m!277057))

(assert (=> b!261295 m!277327))

(assert (=> b!261295 m!277327))

(assert (=> b!261295 m!277329))

(assert (=> b!261088 d!62843))

(declare-fun b!261296 () Bool)

(declare-fun e!169318 () (_ BitVec 32))

(declare-fun call!24930 () (_ BitVec 32))

(assert (=> b!261296 (= e!169318 (bvadd #b00000000000000000000000000000001 call!24930))))

(declare-fun bm!24927 () Bool)

(assert (=> bm!24927 (= call!24930 (arrayCountValidKeys!0 lt!131647 (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(declare-fun b!261297 () Bool)

(declare-fun e!169317 () (_ BitVec 32))

(assert (=> b!261297 (= e!169317 e!169318)))

(declare-fun c!44469 () Bool)

(assert (=> b!261297 (= c!44469 (validKeyInArray!0 (select (arr!5966 lt!131647) index!297)))))

(declare-fun b!261298 () Bool)

(assert (=> b!261298 (= e!169318 call!24930)))

(declare-fun d!62845 () Bool)

(declare-fun lt!131941 () (_ BitVec 32))

(assert (=> d!62845 (and (bvsge lt!131941 #b00000000000000000000000000000000) (bvsle lt!131941 (bvsub (size!6316 lt!131647) index!297)))))

(assert (=> d!62845 (= lt!131941 e!169317)))

(declare-fun c!44468 () Bool)

(assert (=> d!62845 (= c!44468 (bvsge index!297 (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (=> d!62845 (and (bvsle index!297 (bvadd index!297 #b00000000000000000000000000000001)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd index!297 #b00000000000000000000000000000001) (size!6316 lt!131647)))))

(assert (=> d!62845 (= (arrayCountValidKeys!0 lt!131647 index!297 (bvadd index!297 #b00000000000000000000000000000001)) lt!131941)))

(declare-fun b!261299 () Bool)

(assert (=> b!261299 (= e!169317 #b00000000000000000000000000000000)))

(assert (= (and d!62845 c!44468) b!261299))

(assert (= (and d!62845 (not c!44468)) b!261297))

(assert (= (and b!261297 c!44469) b!261296))

(assert (= (and b!261297 (not c!44469)) b!261298))

(assert (= (or b!261296 b!261298) bm!24927))

(declare-fun m!277331 () Bool)

(assert (=> bm!24927 m!277331))

(assert (=> b!261297 m!277245))

(assert (=> b!261297 m!277245))

(assert (=> b!261297 m!277247))

(assert (=> d!62811 d!62845))

(declare-fun d!62847 () Bool)

(assert (=> d!62847 (= (arrayCountValidKeys!0 lt!131647 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(assert (=> d!62847 true))

(declare-fun _$85!30 () Unit!8084)

(assert (=> d!62847 (= (choose!2 lt!131647 index!297) _$85!30)))

(declare-fun bs!9220 () Bool)

(assert (= bs!9220 d!62847))

(assert (=> bs!9220 m!277241))

(assert (=> d!62811 d!62847))

(declare-fun d!62849 () Bool)

(assert (=> d!62849 (= (validKeyInArray!0 (select (arr!5966 lt!131647) index!297)) (and (not (= (select (arr!5966 lt!131647) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5966 lt!131647) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261156 d!62849))

(declare-fun d!62851 () Bool)

(declare-fun e!169319 () Bool)

(assert (=> d!62851 e!169319))

(declare-fun res!127683 () Bool)

(assert (=> d!62851 (=> (not res!127683) (not e!169319))))

(declare-fun lt!131945 () ListLongMap!3775)

(assert (=> d!62851 (= res!127683 (contains!1870 lt!131945 (_1!2441 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(declare-fun lt!131944 () List!3738)

(assert (=> d!62851 (= lt!131945 (ListLongMap!3776 lt!131944))))

(declare-fun lt!131943 () Unit!8084)

(declare-fun lt!131942 () Unit!8084)

(assert (=> d!62851 (= lt!131943 lt!131942)))

(assert (=> d!62851 (= (getValueByKey!318 lt!131944 (_1!2441 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(assert (=> d!62851 (= lt!131942 (lemmaContainsTupThenGetReturnValue!174 lt!131944 (_1!2441 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(assert (=> d!62851 (= lt!131944 (insertStrictlySorted!177 (toList!1903 call!24896) (_1!2441 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(assert (=> d!62851 (= (+!700 call!24896 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))) lt!131945)))

(declare-fun b!261300 () Bool)

(declare-fun res!127684 () Bool)

(assert (=> b!261300 (=> (not res!127684) (not e!169319))))

(assert (=> b!261300 (= res!127684 (= (getValueByKey!318 (toList!1903 lt!131945) (_1!2441 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(declare-fun b!261301 () Bool)

(assert (=> b!261301 (= e!169319 (contains!1872 (toList!1903 lt!131945) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))

(assert (= (and d!62851 res!127683) b!261300))

(assert (= (and b!261300 res!127684) b!261301))

(declare-fun m!277333 () Bool)

(assert (=> d!62851 m!277333))

(declare-fun m!277335 () Bool)

(assert (=> d!62851 m!277335))

(declare-fun m!277337 () Bool)

(assert (=> d!62851 m!277337))

(declare-fun m!277339 () Bool)

(assert (=> d!62851 m!277339))

(declare-fun m!277341 () Bool)

(assert (=> b!261300 m!277341))

(declare-fun m!277343 () Bool)

(assert (=> b!261301 m!277343))

(assert (=> b!261070 d!62851))

(declare-fun d!62853 () Bool)

(declare-fun lt!131948 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!175 (List!3739) (InoxSet (_ BitVec 64)))

(assert (=> d!62853 (= lt!131948 (select (content!175 Nil!3736) (select (arr!5966 lt!131647) #b00000000000000000000000000000000)))))

(declare-fun e!169324 () Bool)

(assert (=> d!62853 (= lt!131948 e!169324)))

(declare-fun res!127690 () Bool)

(assert (=> d!62853 (=> (not res!127690) (not e!169324))))

(assert (=> d!62853 (= res!127690 ((_ is Cons!3735) Nil!3736))))

(assert (=> d!62853 (= (contains!1873 Nil!3736 (select (arr!5966 lt!131647) #b00000000000000000000000000000000)) lt!131948)))

(declare-fun b!261306 () Bool)

(declare-fun e!169325 () Bool)

(assert (=> b!261306 (= e!169324 e!169325)))

(declare-fun res!127689 () Bool)

(assert (=> b!261306 (=> res!127689 e!169325)))

(assert (=> b!261306 (= res!127689 (= (h!4400 Nil!3736) (select (arr!5966 lt!131647) #b00000000000000000000000000000000)))))

(declare-fun b!261307 () Bool)

(assert (=> b!261307 (= e!169325 (contains!1873 (t!8802 Nil!3736) (select (arr!5966 lt!131647) #b00000000000000000000000000000000)))))

(assert (= (and d!62853 res!127690) b!261306))

(assert (= (and b!261306 (not res!127689)) b!261307))

(declare-fun m!277345 () Bool)

(assert (=> d!62853 m!277345))

(assert (=> d!62853 m!277177))

(declare-fun m!277347 () Bool)

(assert (=> d!62853 m!277347))

(assert (=> b!261307 m!277177))

(declare-fun m!277349 () Bool)

(assert (=> b!261307 m!277349))

(assert (=> b!261209 d!62853))

(declare-fun d!62855 () Bool)

(declare-fun e!169326 () Bool)

(assert (=> d!62855 e!169326))

(declare-fun res!127691 () Bool)

(assert (=> d!62855 (=> res!127691 e!169326)))

(declare-fun lt!131950 () Bool)

(assert (=> d!62855 (= res!127691 (not lt!131950))))

(declare-fun lt!131949 () Bool)

(assert (=> d!62855 (= lt!131950 lt!131949)))

(declare-fun lt!131951 () Unit!8084)

(declare-fun e!169327 () Unit!8084)

(assert (=> d!62855 (= lt!131951 e!169327)))

(declare-fun c!44470 () Bool)

(assert (=> d!62855 (= c!44470 lt!131949)))

(assert (=> d!62855 (= lt!131949 (containsKey!309 (toList!1903 lt!131852) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62855 (= (contains!1870 lt!131852 #b1000000000000000000000000000000000000000000000000000000000000000) lt!131950)))

(declare-fun b!261308 () Bool)

(declare-fun lt!131952 () Unit!8084)

(assert (=> b!261308 (= e!169327 lt!131952)))

(assert (=> b!261308 (= lt!131952 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1903 lt!131852) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261308 (isDefined!258 (getValueByKey!318 (toList!1903 lt!131852) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261309 () Bool)

(declare-fun Unit!8102 () Unit!8084)

(assert (=> b!261309 (= e!169327 Unit!8102)))

(declare-fun b!261310 () Bool)

(assert (=> b!261310 (= e!169326 (isDefined!258 (getValueByKey!318 (toList!1903 lt!131852) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62855 c!44470) b!261308))

(assert (= (and d!62855 (not c!44470)) b!261309))

(assert (= (and d!62855 (not res!127691)) b!261310))

(declare-fun m!277351 () Bool)

(assert (=> d!62855 m!277351))

(declare-fun m!277353 () Bool)

(assert (=> b!261308 m!277353))

(declare-fun m!277355 () Bool)

(assert (=> b!261308 m!277355))

(assert (=> b!261308 m!277355))

(declare-fun m!277357 () Bool)

(assert (=> b!261308 m!277357))

(assert (=> b!261310 m!277355))

(assert (=> b!261310 m!277355))

(assert (=> b!261310 m!277357))

(assert (=> bm!24902 d!62855))

(assert (=> b!261105 d!62825))

(declare-fun d!62857 () Bool)

(assert (=> d!62857 (= (validKeyInArray!0 (select (arr!5966 lt!131647) #b00000000000000000000000000000000)) (and (not (= (select (arr!5966 lt!131647) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5966 lt!131647) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261182 d!62857))

(declare-fun b!261319 () Bool)

(declare-fun e!169332 () Option!324)

(assert (=> b!261319 (= e!169332 (Some!323 (_2!2441 (h!4399 (toList!1903 lt!131848)))))))

(declare-fun e!169333 () Option!324)

(declare-fun b!261321 () Bool)

(assert (=> b!261321 (= e!169333 (getValueByKey!318 (t!8801 (toList!1903 lt!131848)) (_1!2441 (tuple2!4861 key!932 v!346))))))

(declare-fun b!261320 () Bool)

(assert (=> b!261320 (= e!169332 e!169333)))

(declare-fun c!44476 () Bool)

(assert (=> b!261320 (= c!44476 (and ((_ is Cons!3734) (toList!1903 lt!131848)) (not (= (_1!2441 (h!4399 (toList!1903 lt!131848))) (_1!2441 (tuple2!4861 key!932 v!346))))))))

(declare-fun d!62859 () Bool)

(declare-fun c!44475 () Bool)

(assert (=> d!62859 (= c!44475 (and ((_ is Cons!3734) (toList!1903 lt!131848)) (= (_1!2441 (h!4399 (toList!1903 lt!131848))) (_1!2441 (tuple2!4861 key!932 v!346)))))))

(assert (=> d!62859 (= (getValueByKey!318 (toList!1903 lt!131848) (_1!2441 (tuple2!4861 key!932 v!346))) e!169332)))

(declare-fun b!261322 () Bool)

(assert (=> b!261322 (= e!169333 None!322)))

(assert (= (and d!62859 c!44475) b!261319))

(assert (= (and d!62859 (not c!44475)) b!261320))

(assert (= (and b!261320 c!44476) b!261321))

(assert (= (and b!261320 (not c!44476)) b!261322))

(declare-fun m!277359 () Bool)

(assert (=> b!261321 m!277359))

(assert (=> b!261112 d!62859))

(declare-fun b!261323 () Bool)

(declare-fun e!169335 () Bool)

(declare-fun e!169334 () Bool)

(assert (=> b!261323 (= e!169335 e!169334)))

(declare-fun c!44477 () Bool)

(assert (=> b!261323 (= c!44477 (validKeyInArray!0 (select (arr!5966 lt!131647) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!261324 () Bool)

(declare-fun call!24931 () Bool)

(assert (=> b!261324 (= e!169334 call!24931)))

(declare-fun d!62861 () Bool)

(declare-fun res!127692 () Bool)

(declare-fun e!169336 () Bool)

(assert (=> d!62861 (=> res!127692 e!169336)))

(assert (=> d!62861 (= res!127692 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6316 lt!131647)))))

(assert (=> d!62861 (= (arrayNoDuplicates!0 lt!131647 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44446 (Cons!3735 (select (arr!5966 lt!131647) #b00000000000000000000000000000000) Nil!3736) Nil!3736)) e!169336)))

(declare-fun bm!24928 () Bool)

(assert (=> bm!24928 (= call!24931 (arrayNoDuplicates!0 lt!131647 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!44477 (Cons!3735 (select (arr!5966 lt!131647) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44446 (Cons!3735 (select (arr!5966 lt!131647) #b00000000000000000000000000000000) Nil!3736) Nil!3736)) (ite c!44446 (Cons!3735 (select (arr!5966 lt!131647) #b00000000000000000000000000000000) Nil!3736) Nil!3736))))))

(declare-fun b!261325 () Bool)

(assert (=> b!261325 (= e!169336 e!169335)))

(declare-fun res!127693 () Bool)

(assert (=> b!261325 (=> (not res!127693) (not e!169335))))

(declare-fun e!169337 () Bool)

(assert (=> b!261325 (= res!127693 (not e!169337))))

(declare-fun res!127694 () Bool)

(assert (=> b!261325 (=> (not res!127694) (not e!169337))))

(assert (=> b!261325 (= res!127694 (validKeyInArray!0 (select (arr!5966 lt!131647) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!261326 () Bool)

(assert (=> b!261326 (= e!169337 (contains!1873 (ite c!44446 (Cons!3735 (select (arr!5966 lt!131647) #b00000000000000000000000000000000) Nil!3736) Nil!3736) (select (arr!5966 lt!131647) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!261327 () Bool)

(assert (=> b!261327 (= e!169334 call!24931)))

(assert (= (and d!62861 (not res!127692)) b!261325))

(assert (= (and b!261325 res!127694) b!261326))

(assert (= (and b!261325 res!127693) b!261323))

(assert (= (and b!261323 c!44477) b!261324))

(assert (= (and b!261323 (not c!44477)) b!261327))

(assert (= (or b!261324 b!261327) bm!24928))

(declare-fun m!277361 () Bool)

(assert (=> b!261323 m!277361))

(assert (=> b!261323 m!277361))

(declare-fun m!277363 () Bool)

(assert (=> b!261323 m!277363))

(assert (=> bm!24928 m!277361))

(declare-fun m!277365 () Bool)

(assert (=> bm!24928 m!277365))

(assert (=> b!261325 m!277361))

(assert (=> b!261325 m!277361))

(assert (=> b!261325 m!277363))

(assert (=> b!261326 m!277361))

(assert (=> b!261326 m!277361))

(declare-fun m!277367 () Bool)

(assert (=> b!261326 m!277367))

(assert (=> bm!24916 d!62861))

(declare-fun d!62863 () Bool)

(declare-fun get!3084 (Option!324) V!8481)

(assert (=> d!62863 (= (apply!259 lt!131852 (select (arr!5966 lt!131647) #b00000000000000000000000000000000)) (get!3084 (getValueByKey!318 (toList!1903 lt!131852) (select (arr!5966 lt!131647) #b00000000000000000000000000000000))))))

(declare-fun bs!9221 () Bool)

(assert (= bs!9221 d!62863))

(assert (=> bs!9221 m!277177))

(declare-fun m!277369 () Bool)

(assert (=> bs!9221 m!277369))

(assert (=> bs!9221 m!277369))

(declare-fun m!277371 () Bool)

(assert (=> bs!9221 m!277371))

(assert (=> b!261139 d!62863))

(declare-fun d!62865 () Bool)

(declare-fun c!44480 () Bool)

(assert (=> d!62865 (= c!44480 ((_ is ValueCellFull!2969) (select (arr!5965 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!169340 () V!8481)

(assert (=> d!62865 (= (get!3083 (select (arr!5965 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!169340)))

(declare-fun b!261332 () Bool)

(declare-fun get!3085 (ValueCell!2969 V!8481) V!8481)

(assert (=> b!261332 (= e!169340 (get!3085 (select (arr!5965 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!261333 () Bool)

(declare-fun get!3086 (ValueCell!2969 V!8481) V!8481)

(assert (=> b!261333 (= e!169340 (get!3086 (select (arr!5965 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62865 c!44480) b!261332))

(assert (= (and d!62865 (not c!44480)) b!261333))

(assert (=> b!261332 m!277225))

(assert (=> b!261332 m!277129))

(declare-fun m!277373 () Bool)

(assert (=> b!261332 m!277373))

(assert (=> b!261333 m!277225))

(assert (=> b!261333 m!277129))

(declare-fun m!277375 () Bool)

(assert (=> b!261333 m!277375))

(assert (=> b!261139 d!62865))

(assert (=> b!261206 d!62857))

(assert (=> bm!24921 d!62777))

(assert (=> b!261166 d!62857))

(assert (=> b!261189 d!62849))

(declare-fun d!62867 () Bool)

(assert (=> d!62867 (= (apply!259 lt!131806 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)) (get!3084 (getValueByKey!318 (toList!1903 lt!131806) (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9222 () Bool)

(assert (= bs!9222 d!62867))

(assert (=> bs!9222 m!277057))

(assert (=> bs!9222 m!277327))

(assert (=> bs!9222 m!277327))

(declare-fun m!277377 () Bool)

(assert (=> bs!9222 m!277377))

(assert (=> b!261081 d!62867))

(declare-fun d!62869 () Bool)

(declare-fun c!44481 () Bool)

(assert (=> d!62869 (= c!44481 ((_ is ValueCellFull!2969) (select (arr!5965 (_values!4790 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!169341 () V!8481)

(assert (=> d!62869 (= (get!3083 (select (arr!5965 (_values!4790 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!169341)))

(declare-fun b!261334 () Bool)

(assert (=> b!261334 (= e!169341 (get!3085 (select (arr!5965 (_values!4790 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!261335 () Bool)

(assert (=> b!261335 (= e!169341 (get!3086 (select (arr!5965 (_values!4790 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62869 c!44481) b!261334))

(assert (= (and d!62869 (not c!44481)) b!261335))

(assert (=> b!261334 m!277127))

(assert (=> b!261334 m!277129))

(declare-fun m!277379 () Bool)

(assert (=> b!261334 m!277379))

(assert (=> b!261335 m!277127))

(assert (=> b!261335 m!277129))

(declare-fun m!277381 () Bool)

(assert (=> b!261335 m!277381))

(assert (=> b!261081 d!62869))

(assert (=> d!62817 d!62803))

(declare-fun d!62871 () Bool)

(assert (=> d!62871 (arrayContainsKey!0 lt!131647 key!932 #b00000000000000000000000000000000)))

(assert (=> d!62871 true))

(declare-fun _$60!387 () Unit!8084)

(assert (=> d!62871 (= (choose!13 lt!131647 key!932 index!297) _$60!387)))

(declare-fun bs!9223 () Bool)

(assert (= bs!9223 d!62871))

(assert (=> bs!9223 m!276871))

(assert (=> d!62817 d!62871))

(declare-fun d!62873 () Bool)

(declare-fun e!169342 () Bool)

(assert (=> d!62873 e!169342))

(declare-fun res!127695 () Bool)

(assert (=> d!62873 (=> res!127695 e!169342)))

(declare-fun lt!131954 () Bool)

(assert (=> d!62873 (= res!127695 (not lt!131954))))

(declare-fun lt!131953 () Bool)

(assert (=> d!62873 (= lt!131954 lt!131953)))

(declare-fun lt!131955 () Unit!8084)

(declare-fun e!169343 () Unit!8084)

(assert (=> d!62873 (= lt!131955 e!169343)))

(declare-fun c!44482 () Bool)

(assert (=> d!62873 (= c!44482 lt!131953)))

(assert (=> d!62873 (= lt!131953 (containsKey!309 (toList!1903 lt!131848) (_1!2441 (tuple2!4861 key!932 v!346))))))

(assert (=> d!62873 (= (contains!1870 lt!131848 (_1!2441 (tuple2!4861 key!932 v!346))) lt!131954)))

(declare-fun b!261336 () Bool)

(declare-fun lt!131956 () Unit!8084)

(assert (=> b!261336 (= e!169343 lt!131956)))

(assert (=> b!261336 (= lt!131956 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1903 lt!131848) (_1!2441 (tuple2!4861 key!932 v!346))))))

(assert (=> b!261336 (isDefined!258 (getValueByKey!318 (toList!1903 lt!131848) (_1!2441 (tuple2!4861 key!932 v!346))))))

(declare-fun b!261337 () Bool)

(declare-fun Unit!8103 () Unit!8084)

(assert (=> b!261337 (= e!169343 Unit!8103)))

(declare-fun b!261338 () Bool)

(assert (=> b!261338 (= e!169342 (isDefined!258 (getValueByKey!318 (toList!1903 lt!131848) (_1!2441 (tuple2!4861 key!932 v!346)))))))

(assert (= (and d!62873 c!44482) b!261336))

(assert (= (and d!62873 (not c!44482)) b!261337))

(assert (= (and d!62873 (not res!127695)) b!261338))

(declare-fun m!277383 () Bool)

(assert (=> d!62873 m!277383))

(declare-fun m!277385 () Bool)

(assert (=> b!261336 m!277385))

(assert (=> b!261336 m!277163))

(assert (=> b!261336 m!277163))

(declare-fun m!277387 () Bool)

(assert (=> b!261336 m!277387))

(assert (=> b!261338 m!277163))

(assert (=> b!261338 m!277163))

(assert (=> b!261338 m!277387))

(assert (=> d!62799 d!62873))

(declare-fun b!261339 () Bool)

(declare-fun e!169344 () Option!324)

(assert (=> b!261339 (= e!169344 (Some!323 (_2!2441 (h!4399 lt!131847))))))

(declare-fun b!261341 () Bool)

(declare-fun e!169345 () Option!324)

(assert (=> b!261341 (= e!169345 (getValueByKey!318 (t!8801 lt!131847) (_1!2441 (tuple2!4861 key!932 v!346))))))

(declare-fun b!261340 () Bool)

(assert (=> b!261340 (= e!169344 e!169345)))

(declare-fun c!44484 () Bool)

(assert (=> b!261340 (= c!44484 (and ((_ is Cons!3734) lt!131847) (not (= (_1!2441 (h!4399 lt!131847)) (_1!2441 (tuple2!4861 key!932 v!346))))))))

(declare-fun d!62875 () Bool)

(declare-fun c!44483 () Bool)

(assert (=> d!62875 (= c!44483 (and ((_ is Cons!3734) lt!131847) (= (_1!2441 (h!4399 lt!131847)) (_1!2441 (tuple2!4861 key!932 v!346)))))))

(assert (=> d!62875 (= (getValueByKey!318 lt!131847 (_1!2441 (tuple2!4861 key!932 v!346))) e!169344)))

(declare-fun b!261342 () Bool)

(assert (=> b!261342 (= e!169345 None!322)))

(assert (= (and d!62875 c!44483) b!261339))

(assert (= (and d!62875 (not c!44483)) b!261340))

(assert (= (and b!261340 c!44484) b!261341))

(assert (= (and b!261340 (not c!44484)) b!261342))

(declare-fun m!277389 () Bool)

(assert (=> b!261341 m!277389))

(assert (=> d!62799 d!62875))

(declare-fun d!62877 () Bool)

(assert (=> d!62877 (= (getValueByKey!318 lt!131847 (_1!2441 (tuple2!4861 key!932 v!346))) (Some!323 (_2!2441 (tuple2!4861 key!932 v!346))))))

(declare-fun lt!131959 () Unit!8084)

(declare-fun choose!1283 (List!3738 (_ BitVec 64) V!8481) Unit!8084)

(assert (=> d!62877 (= lt!131959 (choose!1283 lt!131847 (_1!2441 (tuple2!4861 key!932 v!346)) (_2!2441 (tuple2!4861 key!932 v!346))))))

(declare-fun e!169348 () Bool)

(assert (=> d!62877 e!169348))

(declare-fun res!127700 () Bool)

(assert (=> d!62877 (=> (not res!127700) (not e!169348))))

(declare-fun isStrictlySorted!363 (List!3738) Bool)

(assert (=> d!62877 (= res!127700 (isStrictlySorted!363 lt!131847))))

(assert (=> d!62877 (= (lemmaContainsTupThenGetReturnValue!174 lt!131847 (_1!2441 (tuple2!4861 key!932 v!346)) (_2!2441 (tuple2!4861 key!932 v!346))) lt!131959)))

(declare-fun b!261347 () Bool)

(declare-fun res!127701 () Bool)

(assert (=> b!261347 (=> (not res!127701) (not e!169348))))

(assert (=> b!261347 (= res!127701 (containsKey!309 lt!131847 (_1!2441 (tuple2!4861 key!932 v!346))))))

(declare-fun b!261348 () Bool)

(assert (=> b!261348 (= e!169348 (contains!1872 lt!131847 (tuple2!4861 (_1!2441 (tuple2!4861 key!932 v!346)) (_2!2441 (tuple2!4861 key!932 v!346)))))))

(assert (= (and d!62877 res!127700) b!261347))

(assert (= (and b!261347 res!127701) b!261348))

(assert (=> d!62877 m!277157))

(declare-fun m!277391 () Bool)

(assert (=> d!62877 m!277391))

(declare-fun m!277393 () Bool)

(assert (=> d!62877 m!277393))

(declare-fun m!277395 () Bool)

(assert (=> b!261347 m!277395))

(declare-fun m!277397 () Bool)

(assert (=> b!261348 m!277397))

(assert (=> d!62799 d!62877))

(declare-fun e!169363 () Bool)

(declare-fun lt!131962 () List!3738)

(declare-fun b!261369 () Bool)

(assert (=> b!261369 (= e!169363 (contains!1872 lt!131962 (tuple2!4861 (_1!2441 (tuple2!4861 key!932 v!346)) (_2!2441 (tuple2!4861 key!932 v!346)))))))

(declare-fun bm!24935 () Bool)

(declare-fun call!24938 () List!3738)

(declare-fun call!24940 () List!3738)

(assert (=> bm!24935 (= call!24938 call!24940)))

(declare-fun b!261370 () Bool)

(declare-fun e!169361 () List!3738)

(declare-fun call!24939 () List!3738)

(assert (=> b!261370 (= e!169361 call!24939)))

(declare-fun c!44496 () Bool)

(declare-fun b!261371 () Bool)

(assert (=> b!261371 (= c!44496 (and ((_ is Cons!3734) (toList!1903 lt!131643)) (bvsgt (_1!2441 (h!4399 (toList!1903 lt!131643))) (_1!2441 (tuple2!4861 key!932 v!346)))))))

(declare-fun e!169359 () List!3738)

(assert (=> b!261371 (= e!169359 e!169361)))

(declare-fun b!261372 () Bool)

(declare-fun res!127707 () Bool)

(assert (=> b!261372 (=> (not res!127707) (not e!169363))))

(assert (=> b!261372 (= res!127707 (containsKey!309 lt!131962 (_1!2441 (tuple2!4861 key!932 v!346))))))

(declare-fun e!169360 () List!3738)

(declare-fun b!261373 () Bool)

(assert (=> b!261373 (= e!169360 (insertStrictlySorted!177 (t!8801 (toList!1903 lt!131643)) (_1!2441 (tuple2!4861 key!932 v!346)) (_2!2441 (tuple2!4861 key!932 v!346))))))

(declare-fun b!261375 () Bool)

(assert (=> b!261375 (= e!169361 call!24939)))

(declare-fun b!261376 () Bool)

(declare-fun e!169362 () List!3738)

(assert (=> b!261376 (= e!169362 call!24940)))

(declare-fun bm!24936 () Bool)

(declare-fun c!44493 () Bool)

(declare-fun $colon$colon!106 (List!3738 tuple2!4860) List!3738)

(assert (=> bm!24936 (= call!24940 ($colon$colon!106 e!169360 (ite c!44493 (h!4399 (toList!1903 lt!131643)) (tuple2!4861 (_1!2441 (tuple2!4861 key!932 v!346)) (_2!2441 (tuple2!4861 key!932 v!346))))))))

(declare-fun c!44495 () Bool)

(assert (=> bm!24936 (= c!44495 c!44493)))

(declare-fun bm!24937 () Bool)

(assert (=> bm!24937 (= call!24939 call!24938)))

(declare-fun b!261377 () Bool)

(declare-fun c!44494 () Bool)

(assert (=> b!261377 (= e!169360 (ite c!44494 (t!8801 (toList!1903 lt!131643)) (ite c!44496 (Cons!3734 (h!4399 (toList!1903 lt!131643)) (t!8801 (toList!1903 lt!131643))) Nil!3735)))))

(declare-fun b!261378 () Bool)

(assert (=> b!261378 (= e!169362 e!169359)))

(assert (=> b!261378 (= c!44494 (and ((_ is Cons!3734) (toList!1903 lt!131643)) (= (_1!2441 (h!4399 (toList!1903 lt!131643))) (_1!2441 (tuple2!4861 key!932 v!346)))))))

(declare-fun b!261374 () Bool)

(assert (=> b!261374 (= e!169359 call!24938)))

(declare-fun d!62879 () Bool)

(assert (=> d!62879 e!169363))

(declare-fun res!127706 () Bool)

(assert (=> d!62879 (=> (not res!127706) (not e!169363))))

(assert (=> d!62879 (= res!127706 (isStrictlySorted!363 lt!131962))))

(assert (=> d!62879 (= lt!131962 e!169362)))

(assert (=> d!62879 (= c!44493 (and ((_ is Cons!3734) (toList!1903 lt!131643)) (bvslt (_1!2441 (h!4399 (toList!1903 lt!131643))) (_1!2441 (tuple2!4861 key!932 v!346)))))))

(assert (=> d!62879 (isStrictlySorted!363 (toList!1903 lt!131643))))

(assert (=> d!62879 (= (insertStrictlySorted!177 (toList!1903 lt!131643) (_1!2441 (tuple2!4861 key!932 v!346)) (_2!2441 (tuple2!4861 key!932 v!346))) lt!131962)))

(assert (= (and d!62879 c!44493) b!261376))

(assert (= (and d!62879 (not c!44493)) b!261378))

(assert (= (and b!261378 c!44494) b!261374))

(assert (= (and b!261378 (not c!44494)) b!261371))

(assert (= (and b!261371 c!44496) b!261375))

(assert (= (and b!261371 (not c!44496)) b!261370))

(assert (= (or b!261375 b!261370) bm!24937))

(assert (= (or b!261374 bm!24937) bm!24935))

(assert (= (or b!261376 bm!24935) bm!24936))

(assert (= (and bm!24936 c!44495) b!261373))

(assert (= (and bm!24936 (not c!44495)) b!261377))

(assert (= (and d!62879 res!127706) b!261372))

(assert (= (and b!261372 res!127707) b!261369))

(declare-fun m!277399 () Bool)

(assert (=> b!261369 m!277399))

(declare-fun m!277401 () Bool)

(assert (=> bm!24936 m!277401))

(declare-fun m!277403 () Bool)

(assert (=> d!62879 m!277403))

(declare-fun m!277405 () Bool)

(assert (=> d!62879 m!277405))

(declare-fun m!277407 () Bool)

(assert (=> b!261373 m!277407))

(declare-fun m!277409 () Bool)

(assert (=> b!261372 m!277409))

(assert (=> d!62799 d!62879))

(declare-fun d!62881 () Bool)

(declare-fun e!169364 () Bool)

(assert (=> d!62881 e!169364))

(declare-fun res!127708 () Bool)

(assert (=> d!62881 (=> (not res!127708) (not e!169364))))

(declare-fun lt!131966 () ListLongMap!3775)

(assert (=> d!62881 (= res!127708 (contains!1870 lt!131966 (_1!2441 (tuple2!4861 key!932 v!346))))))

(declare-fun lt!131965 () List!3738)

(assert (=> d!62881 (= lt!131966 (ListLongMap!3776 lt!131965))))

(declare-fun lt!131964 () Unit!8084)

(declare-fun lt!131963 () Unit!8084)

(assert (=> d!62881 (= lt!131964 lt!131963)))

(assert (=> d!62881 (= (getValueByKey!318 lt!131965 (_1!2441 (tuple2!4861 key!932 v!346))) (Some!323 (_2!2441 (tuple2!4861 key!932 v!346))))))

(assert (=> d!62881 (= lt!131963 (lemmaContainsTupThenGetReturnValue!174 lt!131965 (_1!2441 (tuple2!4861 key!932 v!346)) (_2!2441 (tuple2!4861 key!932 v!346))))))

(assert (=> d!62881 (= lt!131965 (insertStrictlySorted!177 (toList!1903 (getCurrentListMap!1435 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504))) (_1!2441 (tuple2!4861 key!932 v!346)) (_2!2441 (tuple2!4861 key!932 v!346))))))

(assert (=> d!62881 (= (+!700 (getCurrentListMap!1435 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) (tuple2!4861 key!932 v!346)) lt!131966)))

(declare-fun b!261379 () Bool)

(declare-fun res!127709 () Bool)

(assert (=> b!261379 (=> (not res!127709) (not e!169364))))

(assert (=> b!261379 (= res!127709 (= (getValueByKey!318 (toList!1903 lt!131966) (_1!2441 (tuple2!4861 key!932 v!346))) (Some!323 (_2!2441 (tuple2!4861 key!932 v!346)))))))

(declare-fun b!261380 () Bool)

(assert (=> b!261380 (= e!169364 (contains!1872 (toList!1903 lt!131966) (tuple2!4861 key!932 v!346)))))

(assert (= (and d!62881 res!127708) b!261379))

(assert (= (and b!261379 res!127709) b!261380))

(declare-fun m!277411 () Bool)

(assert (=> d!62881 m!277411))

(declare-fun m!277413 () Bool)

(assert (=> d!62881 m!277413))

(declare-fun m!277415 () Bool)

(assert (=> d!62881 m!277415))

(declare-fun m!277417 () Bool)

(assert (=> d!62881 m!277417))

(declare-fun m!277419 () Bool)

(assert (=> b!261379 m!277419))

(declare-fun m!277421 () Bool)

(assert (=> b!261380 m!277421))

(assert (=> b!261151 d!62881))

(assert (=> b!261151 d!62787))

(declare-fun bm!24938 () Bool)

(declare-fun call!24941 () ListLongMap!3775)

(declare-fun call!24947 () ListLongMap!3775)

(assert (=> bm!24938 (= call!24941 call!24947)))

(declare-fun bm!24939 () Bool)

(declare-fun call!24943 () Bool)

(declare-fun lt!131967 () ListLongMap!3775)

(assert (=> bm!24939 (= call!24943 (contains!1870 lt!131967 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261381 () Bool)

(declare-fun e!169366 () ListLongMap!3775)

(declare-fun call!24942 () ListLongMap!3775)

(assert (=> b!261381 (= e!169366 (+!700 call!24942 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))

(declare-fun b!261382 () Bool)

(declare-fun e!169375 () Bool)

(assert (=> b!261382 (= e!169375 (not call!24943))))

(declare-fun b!261383 () Bool)

(declare-fun res!127710 () Bool)

(declare-fun e!169377 () Bool)

(assert (=> b!261383 (=> (not res!127710) (not e!169377))))

(declare-fun e!169367 () Bool)

(assert (=> b!261383 (= res!127710 e!169367)))

(declare-fun res!127715 () Bool)

(assert (=> b!261383 (=> res!127715 e!169367)))

(declare-fun e!169374 () Bool)

(assert (=> b!261383 (= res!127715 (not e!169374))))

(declare-fun res!127712 () Bool)

(assert (=> b!261383 (=> (not res!127712) (not e!169374))))

(assert (=> b!261383 (= res!127712 (bvslt #b00000000000000000000000000000000 (size!6316 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))))))))

(declare-fun e!169365 () Bool)

(declare-fun b!261384 () Bool)

(assert (=> b!261384 (= e!169365 (validKeyInArray!0 (select (arr!5966 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!261385 () Bool)

(declare-fun e!169371 () ListLongMap!3775)

(assert (=> b!261385 (= e!169366 e!169371)))

(declare-fun c!44497 () Bool)

(assert (=> b!261385 (= c!44497 (and (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!261386 () Bool)

(declare-fun c!44501 () Bool)

(assert (=> b!261386 (= c!44501 (and (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!169373 () ListLongMap!3775)

(assert (=> b!261386 (= e!169371 e!169373)))

(declare-fun b!261387 () Bool)

(declare-fun e!169376 () Bool)

(assert (=> b!261387 (= e!169375 e!169376)))

(declare-fun res!127713 () Bool)

(assert (=> b!261387 (= res!127713 call!24943)))

(assert (=> b!261387 (=> (not res!127713) (not e!169376))))

(declare-fun b!261388 () Bool)

(declare-fun call!24945 () ListLongMap!3775)

(assert (=> b!261388 (= e!169371 call!24945)))

(declare-fun b!261389 () Bool)

(declare-fun e!169370 () Unit!8084)

(declare-fun lt!131975 () Unit!8084)

(assert (=> b!261389 (= e!169370 lt!131975)))

(declare-fun lt!131969 () ListLongMap!3775)

(assert (=> b!261389 (= lt!131969 (getCurrentListMapNoExtraKeys!575 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131978 () (_ BitVec 64))

(assert (=> b!261389 (= lt!131978 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131974 () (_ BitVec 64))

(assert (=> b!261389 (= lt!131974 (select (arr!5966 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131987 () Unit!8084)

(assert (=> b!261389 (= lt!131987 (addStillContains!235 lt!131969 lt!131978 (zeroValue!4648 thiss!1504) lt!131974))))

(assert (=> b!261389 (contains!1870 (+!700 lt!131969 (tuple2!4861 lt!131978 (zeroValue!4648 thiss!1504))) lt!131974)))

(declare-fun lt!131973 () Unit!8084)

(assert (=> b!261389 (= lt!131973 lt!131987)))

(declare-fun lt!131988 () ListLongMap!3775)

(assert (=> b!261389 (= lt!131988 (getCurrentListMapNoExtraKeys!575 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131979 () (_ BitVec 64))

(assert (=> b!261389 (= lt!131979 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131986 () (_ BitVec 64))

(assert (=> b!261389 (= lt!131986 (select (arr!5966 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131982 () Unit!8084)

(assert (=> b!261389 (= lt!131982 (addApplyDifferent!235 lt!131988 lt!131979 (minValue!4648 thiss!1504) lt!131986))))

(assert (=> b!261389 (= (apply!259 (+!700 lt!131988 (tuple2!4861 lt!131979 (minValue!4648 thiss!1504))) lt!131986) (apply!259 lt!131988 lt!131986))))

(declare-fun lt!131985 () Unit!8084)

(assert (=> b!261389 (= lt!131985 lt!131982)))

(declare-fun lt!131971 () ListLongMap!3775)

(assert (=> b!261389 (= lt!131971 (getCurrentListMapNoExtraKeys!575 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131983 () (_ BitVec 64))

(assert (=> b!261389 (= lt!131983 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131968 () (_ BitVec 64))

(assert (=> b!261389 (= lt!131968 (select (arr!5966 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131977 () Unit!8084)

(assert (=> b!261389 (= lt!131977 (addApplyDifferent!235 lt!131971 lt!131983 (zeroValue!4648 thiss!1504) lt!131968))))

(assert (=> b!261389 (= (apply!259 (+!700 lt!131971 (tuple2!4861 lt!131983 (zeroValue!4648 thiss!1504))) lt!131968) (apply!259 lt!131971 lt!131968))))

(declare-fun lt!131980 () Unit!8084)

(assert (=> b!261389 (= lt!131980 lt!131977)))

(declare-fun lt!131981 () ListLongMap!3775)

(assert (=> b!261389 (= lt!131981 (getCurrentListMapNoExtraKeys!575 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun lt!131984 () (_ BitVec 64))

(assert (=> b!261389 (= lt!131984 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131976 () (_ BitVec 64))

(assert (=> b!261389 (= lt!131976 (select (arr!5966 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504)))) #b00000000000000000000000000000000))))

(assert (=> b!261389 (= lt!131975 (addApplyDifferent!235 lt!131981 lt!131984 (minValue!4648 thiss!1504) lt!131976))))

(assert (=> b!261389 (= (apply!259 (+!700 lt!131981 (tuple2!4861 lt!131984 (minValue!4648 thiss!1504))) lt!131976) (apply!259 lt!131981 lt!131976))))

(declare-fun d!62883 () Bool)

(assert (=> d!62883 e!169377))

(declare-fun res!127717 () Bool)

(assert (=> d!62883 (=> (not res!127717) (not e!169377))))

(assert (=> d!62883 (= res!127717 (or (bvsge #b00000000000000000000000000000000 (size!6316 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6316 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))))))))))

(declare-fun lt!131970 () ListLongMap!3775)

(assert (=> d!62883 (= lt!131967 lt!131970)))

(declare-fun lt!131972 () Unit!8084)

(assert (=> d!62883 (= lt!131972 e!169370)))

(declare-fun c!44498 () Bool)

(assert (=> d!62883 (= c!44498 e!169365)))

(declare-fun res!127718 () Bool)

(assert (=> d!62883 (=> (not res!127718) (not e!169365))))

(assert (=> d!62883 (= res!127718 (bvslt #b00000000000000000000000000000000 (size!6316 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))))))))

(assert (=> d!62883 (= lt!131970 e!169366)))

(declare-fun c!44499 () Bool)

(assert (=> d!62883 (= c!44499 (and (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62883 (validMask!0 (mask!11144 thiss!1504))))

(assert (=> d!62883 (= (getCurrentListMap!1435 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) lt!131967)))

(declare-fun b!261390 () Bool)

(declare-fun e!169369 () Bool)

(declare-fun e!169372 () Bool)

(assert (=> b!261390 (= e!169369 e!169372)))

(declare-fun res!127716 () Bool)

(declare-fun call!24944 () Bool)

(assert (=> b!261390 (= res!127716 call!24944)))

(assert (=> b!261390 (=> (not res!127716) (not e!169372))))

(declare-fun bm!24940 () Bool)

(assert (=> bm!24940 (= call!24945 call!24942)))

(declare-fun b!261391 () Bool)

(assert (=> b!261391 (= e!169376 (= (apply!259 lt!131967 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4648 thiss!1504)))))

(declare-fun b!261392 () Bool)

(declare-fun e!169368 () Bool)

(assert (=> b!261392 (= e!169368 (= (apply!259 lt!131967 (select (arr!5966 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504)))) #b00000000000000000000000000000000)) (get!3083 (select (arr!5965 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261392 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6315 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))))))))

(assert (=> b!261392 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6316 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))))))))

(declare-fun b!261393 () Bool)

(assert (=> b!261393 (= e!169369 (not call!24944))))

(declare-fun bm!24941 () Bool)

(assert (=> bm!24941 (= call!24944 (contains!1870 lt!131967 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261394 () Bool)

(declare-fun Unit!8104 () Unit!8084)

(assert (=> b!261394 (= e!169370 Unit!8104)))

(declare-fun bm!24942 () Bool)

(declare-fun call!24946 () ListLongMap!3775)

(assert (=> bm!24942 (= call!24946 call!24941)))

(declare-fun b!261395 () Bool)

(assert (=> b!261395 (= e!169377 e!169369)))

(declare-fun c!44502 () Bool)

(assert (=> b!261395 (= c!44502 (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!261396 () Bool)

(assert (=> b!261396 (= e!169373 call!24945)))

(declare-fun b!261397 () Bool)

(declare-fun res!127711 () Bool)

(assert (=> b!261397 (=> (not res!127711) (not e!169377))))

(assert (=> b!261397 (= res!127711 e!169375)))

(declare-fun c!44500 () Bool)

(assert (=> b!261397 (= c!44500 (not (= (bvand (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!261398 () Bool)

(assert (=> b!261398 (= e!169374 (validKeyInArray!0 (select (arr!5966 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!261399 () Bool)

(assert (=> b!261399 (= e!169367 e!169368)))

(declare-fun res!127714 () Bool)

(assert (=> b!261399 (=> (not res!127714) (not e!169368))))

(assert (=> b!261399 (= res!127714 (contains!1870 lt!131967 (select (arr!5966 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!261399 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6316 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))))))))

(declare-fun b!261400 () Bool)

(assert (=> b!261400 (= e!169372 (= (apply!259 lt!131967 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4648 thiss!1504)))))

(declare-fun bm!24943 () Bool)

(assert (=> bm!24943 (= call!24947 (getCurrentListMapNoExtraKeys!575 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(declare-fun bm!24944 () Bool)

(assert (=> bm!24944 (= call!24942 (+!700 (ite c!44499 call!24947 (ite c!44497 call!24941 call!24946)) (ite (or c!44499 c!44497) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(declare-fun b!261401 () Bool)

(assert (=> b!261401 (= e!169373 call!24946)))

(assert (= (and d!62883 c!44499) b!261381))

(assert (= (and d!62883 (not c!44499)) b!261385))

(assert (= (and b!261385 c!44497) b!261388))

(assert (= (and b!261385 (not c!44497)) b!261386))

(assert (= (and b!261386 c!44501) b!261396))

(assert (= (and b!261386 (not c!44501)) b!261401))

(assert (= (or b!261396 b!261401) bm!24942))

(assert (= (or b!261388 bm!24942) bm!24938))

(assert (= (or b!261388 b!261396) bm!24940))

(assert (= (or b!261381 bm!24938) bm!24943))

(assert (= (or b!261381 bm!24940) bm!24944))

(assert (= (and d!62883 res!127718) b!261384))

(assert (= (and d!62883 c!44498) b!261389))

(assert (= (and d!62883 (not c!44498)) b!261394))

(assert (= (and d!62883 res!127717) b!261383))

(assert (= (and b!261383 res!127712) b!261398))

(assert (= (and b!261383 (not res!127715)) b!261399))

(assert (= (and b!261399 res!127714) b!261392))

(assert (= (and b!261383 res!127710) b!261397))

(assert (= (and b!261397 c!44500) b!261387))

(assert (= (and b!261397 (not c!44500)) b!261382))

(assert (= (and b!261387 res!127713) b!261391))

(assert (= (or b!261387 b!261382) bm!24939))

(assert (= (and b!261397 res!127711) b!261395))

(assert (= (and b!261395 c!44502) b!261390))

(assert (= (and b!261395 (not c!44502)) b!261393))

(assert (= (and b!261390 res!127716) b!261400))

(assert (= (or b!261390 b!261393) bm!24941))

(declare-fun b_lambda!8321 () Bool)

(assert (=> (not b_lambda!8321) (not b!261392)))

(assert (=> b!261392 t!8806))

(declare-fun b_and!13911 () Bool)

(assert (= b_and!13909 (and (=> t!8806 result!5407) b_and!13911)))

(declare-fun m!277423 () Bool)

(assert (=> b!261398 m!277423))

(assert (=> b!261398 m!277423))

(declare-fun m!277425 () Bool)

(assert (=> b!261398 m!277425))

(declare-fun m!277427 () Bool)

(assert (=> b!261389 m!277427))

(declare-fun m!277429 () Bool)

(assert (=> b!261389 m!277429))

(declare-fun m!277431 () Bool)

(assert (=> b!261389 m!277431))

(declare-fun m!277433 () Bool)

(assert (=> b!261389 m!277433))

(assert (=> b!261389 m!277423))

(declare-fun m!277435 () Bool)

(assert (=> b!261389 m!277435))

(declare-fun m!277437 () Bool)

(assert (=> b!261389 m!277437))

(declare-fun m!277439 () Bool)

(assert (=> b!261389 m!277439))

(declare-fun m!277441 () Bool)

(assert (=> b!261389 m!277441))

(assert (=> b!261389 m!277431))

(declare-fun m!277443 () Bool)

(assert (=> b!261389 m!277443))

(assert (=> b!261389 m!277429))

(declare-fun m!277445 () Bool)

(assert (=> b!261389 m!277445))

(declare-fun m!277447 () Bool)

(assert (=> b!261389 m!277447))

(declare-fun m!277449 () Bool)

(assert (=> b!261389 m!277449))

(assert (=> b!261389 m!277447))

(declare-fun m!277451 () Bool)

(assert (=> b!261389 m!277451))

(declare-fun m!277453 () Bool)

(assert (=> b!261389 m!277453))

(assert (=> b!261389 m!277451))

(declare-fun m!277455 () Bool)

(assert (=> b!261389 m!277455))

(declare-fun m!277457 () Bool)

(assert (=> b!261389 m!277457))

(declare-fun m!277459 () Bool)

(assert (=> b!261391 m!277459))

(assert (=> d!62883 m!276865))

(declare-fun m!277461 () Bool)

(assert (=> b!261381 m!277461))

(declare-fun m!277463 () Bool)

(assert (=> bm!24944 m!277463))

(assert (=> b!261384 m!277423))

(assert (=> b!261384 m!277423))

(assert (=> b!261384 m!277425))

(declare-fun m!277465 () Bool)

(assert (=> bm!24939 m!277465))

(assert (=> b!261399 m!277423))

(assert (=> b!261399 m!277423))

(declare-fun m!277467 () Bool)

(assert (=> b!261399 m!277467))

(assert (=> b!261392 m!277225))

(assert (=> b!261392 m!277129))

(assert (=> b!261392 m!277227))

(assert (=> b!261392 m!277423))

(assert (=> b!261392 m!277423))

(declare-fun m!277469 () Bool)

(assert (=> b!261392 m!277469))

(assert (=> b!261392 m!277225))

(assert (=> b!261392 m!277129))

(declare-fun m!277471 () Bool)

(assert (=> bm!24941 m!277471))

(declare-fun m!277473 () Bool)

(assert (=> b!261400 m!277473))

(assert (=> bm!24943 m!277427))

(assert (=> b!261151 d!62883))

(assert (=> d!62805 d!62809))

(assert (=> b!261131 d!62857))

(declare-fun d!62885 () Bool)

(declare-fun e!169378 () Bool)

(assert (=> d!62885 e!169378))

(declare-fun res!127719 () Bool)

(assert (=> d!62885 (=> (not res!127719) (not e!169378))))

(declare-fun lt!131992 () ListLongMap!3775)

(assert (=> d!62885 (= res!127719 (contains!1870 lt!131992 (_1!2441 (ite (or c!44427 c!44425) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(declare-fun lt!131991 () List!3738)

(assert (=> d!62885 (= lt!131992 (ListLongMap!3776 lt!131991))))

(declare-fun lt!131990 () Unit!8084)

(declare-fun lt!131989 () Unit!8084)

(assert (=> d!62885 (= lt!131990 lt!131989)))

(assert (=> d!62885 (= (getValueByKey!318 lt!131991 (_1!2441 (ite (or c!44427 c!44425) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))) (Some!323 (_2!2441 (ite (or c!44427 c!44425) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(assert (=> d!62885 (= lt!131989 (lemmaContainsTupThenGetReturnValue!174 lt!131991 (_1!2441 (ite (or c!44427 c!44425) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) (_2!2441 (ite (or c!44427 c!44425) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(assert (=> d!62885 (= lt!131991 (insertStrictlySorted!177 (toList!1903 (ite c!44427 call!24908 (ite c!44425 call!24902 call!24907))) (_1!2441 (ite (or c!44427 c!44425) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) (_2!2441 (ite (or c!44427 c!44425) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(assert (=> d!62885 (= (+!700 (ite c!44427 call!24908 (ite c!44425 call!24902 call!24907)) (ite (or c!44427 c!44425) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) lt!131992)))

(declare-fun b!261402 () Bool)

(declare-fun res!127720 () Bool)

(assert (=> b!261402 (=> (not res!127720) (not e!169378))))

(assert (=> b!261402 (= res!127720 (= (getValueByKey!318 (toList!1903 lt!131992) (_1!2441 (ite (or c!44427 c!44425) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))) (Some!323 (_2!2441 (ite (or c!44427 c!44425) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))))

(declare-fun b!261403 () Bool)

(assert (=> b!261403 (= e!169378 (contains!1872 (toList!1903 lt!131992) (ite (or c!44427 c!44425) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(assert (= (and d!62885 res!127719) b!261402))

(assert (= (and b!261402 res!127720) b!261403))

(declare-fun m!277475 () Bool)

(assert (=> d!62885 m!277475))

(declare-fun m!277477 () Bool)

(assert (=> d!62885 m!277477))

(declare-fun m!277479 () Bool)

(assert (=> d!62885 m!277479))

(declare-fun m!277481 () Bool)

(assert (=> d!62885 m!277481))

(declare-fun m!277483 () Bool)

(assert (=> b!261402 m!277483))

(declare-fun m!277485 () Bool)

(assert (=> b!261403 m!277485))

(assert (=> bm!24905 d!62885))

(declare-fun d!62887 () Bool)

(declare-fun e!169379 () Bool)

(assert (=> d!62887 e!169379))

(declare-fun res!127721 () Bool)

(assert (=> d!62887 (=> (not res!127721) (not e!169379))))

(declare-fun lt!131996 () ListLongMap!3775)

(assert (=> d!62887 (= res!127721 (contains!1870 lt!131996 (_1!2441 (tuple2!4861 lt!131818 (minValue!4648 thiss!1504)))))))

(declare-fun lt!131995 () List!3738)

(assert (=> d!62887 (= lt!131996 (ListLongMap!3776 lt!131995))))

(declare-fun lt!131994 () Unit!8084)

(declare-fun lt!131993 () Unit!8084)

(assert (=> d!62887 (= lt!131994 lt!131993)))

(assert (=> d!62887 (= (getValueByKey!318 lt!131995 (_1!2441 (tuple2!4861 lt!131818 (minValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 lt!131818 (minValue!4648 thiss!1504)))))))

(assert (=> d!62887 (= lt!131993 (lemmaContainsTupThenGetReturnValue!174 lt!131995 (_1!2441 (tuple2!4861 lt!131818 (minValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 lt!131818 (minValue!4648 thiss!1504)))))))

(assert (=> d!62887 (= lt!131995 (insertStrictlySorted!177 (toList!1903 lt!131827) (_1!2441 (tuple2!4861 lt!131818 (minValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 lt!131818 (minValue!4648 thiss!1504)))))))

(assert (=> d!62887 (= (+!700 lt!131827 (tuple2!4861 lt!131818 (minValue!4648 thiss!1504))) lt!131996)))

(declare-fun b!261404 () Bool)

(declare-fun res!127722 () Bool)

(assert (=> b!261404 (=> (not res!127722) (not e!169379))))

(assert (=> b!261404 (= res!127722 (= (getValueByKey!318 (toList!1903 lt!131996) (_1!2441 (tuple2!4861 lt!131818 (minValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 lt!131818 (minValue!4648 thiss!1504))))))))

(declare-fun b!261405 () Bool)

(assert (=> b!261405 (= e!169379 (contains!1872 (toList!1903 lt!131996) (tuple2!4861 lt!131818 (minValue!4648 thiss!1504))))))

(assert (= (and d!62887 res!127721) b!261404))

(assert (= (and b!261404 res!127722) b!261405))

(declare-fun m!277487 () Bool)

(assert (=> d!62887 m!277487))

(declare-fun m!277489 () Bool)

(assert (=> d!62887 m!277489))

(declare-fun m!277491 () Bool)

(assert (=> d!62887 m!277491))

(declare-fun m!277493 () Bool)

(assert (=> d!62887 m!277493))

(declare-fun m!277495 () Bool)

(assert (=> b!261404 m!277495))

(declare-fun m!277497 () Bool)

(assert (=> b!261405 m!277497))

(assert (=> b!261078 d!62887))

(declare-fun d!62889 () Bool)

(assert (=> d!62889 (= (apply!259 (+!700 lt!131820 (tuple2!4861 lt!131823 (minValue!4648 thiss!1504))) lt!131815) (get!3084 (getValueByKey!318 (toList!1903 (+!700 lt!131820 (tuple2!4861 lt!131823 (minValue!4648 thiss!1504)))) lt!131815)))))

(declare-fun bs!9224 () Bool)

(assert (= bs!9224 d!62889))

(declare-fun m!277499 () Bool)

(assert (=> bs!9224 m!277499))

(assert (=> bs!9224 m!277499))

(declare-fun m!277501 () Bool)

(assert (=> bs!9224 m!277501))

(assert (=> b!261078 d!62889))

(declare-fun d!62891 () Bool)

(declare-fun e!169380 () Bool)

(assert (=> d!62891 e!169380))

(declare-fun res!127723 () Bool)

(assert (=> d!62891 (=> (not res!127723) (not e!169380))))

(declare-fun lt!132000 () ListLongMap!3775)

(assert (=> d!62891 (= res!127723 (contains!1870 lt!132000 (_1!2441 (tuple2!4861 lt!131823 (minValue!4648 thiss!1504)))))))

(declare-fun lt!131999 () List!3738)

(assert (=> d!62891 (= lt!132000 (ListLongMap!3776 lt!131999))))

(declare-fun lt!131998 () Unit!8084)

(declare-fun lt!131997 () Unit!8084)

(assert (=> d!62891 (= lt!131998 lt!131997)))

(assert (=> d!62891 (= (getValueByKey!318 lt!131999 (_1!2441 (tuple2!4861 lt!131823 (minValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 lt!131823 (minValue!4648 thiss!1504)))))))

(assert (=> d!62891 (= lt!131997 (lemmaContainsTupThenGetReturnValue!174 lt!131999 (_1!2441 (tuple2!4861 lt!131823 (minValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 lt!131823 (minValue!4648 thiss!1504)))))))

(assert (=> d!62891 (= lt!131999 (insertStrictlySorted!177 (toList!1903 lt!131820) (_1!2441 (tuple2!4861 lt!131823 (minValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 lt!131823 (minValue!4648 thiss!1504)))))))

(assert (=> d!62891 (= (+!700 lt!131820 (tuple2!4861 lt!131823 (minValue!4648 thiss!1504))) lt!132000)))

(declare-fun b!261406 () Bool)

(declare-fun res!127724 () Bool)

(assert (=> b!261406 (=> (not res!127724) (not e!169380))))

(assert (=> b!261406 (= res!127724 (= (getValueByKey!318 (toList!1903 lt!132000) (_1!2441 (tuple2!4861 lt!131823 (minValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 lt!131823 (minValue!4648 thiss!1504))))))))

(declare-fun b!261407 () Bool)

(assert (=> b!261407 (= e!169380 (contains!1872 (toList!1903 lt!132000) (tuple2!4861 lt!131823 (minValue!4648 thiss!1504))))))

(assert (= (and d!62891 res!127723) b!261406))

(assert (= (and b!261406 res!127724) b!261407))

(declare-fun m!277503 () Bool)

(assert (=> d!62891 m!277503))

(declare-fun m!277505 () Bool)

(assert (=> d!62891 m!277505))

(declare-fun m!277507 () Bool)

(assert (=> d!62891 m!277507))

(declare-fun m!277509 () Bool)

(assert (=> d!62891 m!277509))

(declare-fun m!277511 () Bool)

(assert (=> b!261406 m!277511))

(declare-fun m!277513 () Bool)

(assert (=> b!261407 m!277513))

(assert (=> b!261078 d!62891))

(declare-fun d!62893 () Bool)

(declare-fun e!169381 () Bool)

(assert (=> d!62893 e!169381))

(declare-fun res!127725 () Bool)

(assert (=> d!62893 (=> res!127725 e!169381)))

(declare-fun lt!132002 () Bool)

(assert (=> d!62893 (= res!127725 (not lt!132002))))

(declare-fun lt!132001 () Bool)

(assert (=> d!62893 (= lt!132002 lt!132001)))

(declare-fun lt!132003 () Unit!8084)

(declare-fun e!169382 () Unit!8084)

(assert (=> d!62893 (= lt!132003 e!169382)))

(declare-fun c!44503 () Bool)

(assert (=> d!62893 (= c!44503 lt!132001)))

(assert (=> d!62893 (= lt!132001 (containsKey!309 (toList!1903 (+!700 lt!131808 (tuple2!4861 lt!131817 (zeroValue!4648 thiss!1504)))) lt!131813))))

(assert (=> d!62893 (= (contains!1870 (+!700 lt!131808 (tuple2!4861 lt!131817 (zeroValue!4648 thiss!1504))) lt!131813) lt!132002)))

(declare-fun b!261408 () Bool)

(declare-fun lt!132004 () Unit!8084)

(assert (=> b!261408 (= e!169382 lt!132004)))

(assert (=> b!261408 (= lt!132004 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1903 (+!700 lt!131808 (tuple2!4861 lt!131817 (zeroValue!4648 thiss!1504)))) lt!131813))))

(assert (=> b!261408 (isDefined!258 (getValueByKey!318 (toList!1903 (+!700 lt!131808 (tuple2!4861 lt!131817 (zeroValue!4648 thiss!1504)))) lt!131813))))

(declare-fun b!261409 () Bool)

(declare-fun Unit!8105 () Unit!8084)

(assert (=> b!261409 (= e!169382 Unit!8105)))

(declare-fun b!261410 () Bool)

(assert (=> b!261410 (= e!169381 (isDefined!258 (getValueByKey!318 (toList!1903 (+!700 lt!131808 (tuple2!4861 lt!131817 (zeroValue!4648 thiss!1504)))) lt!131813)))))

(assert (= (and d!62893 c!44503) b!261408))

(assert (= (and d!62893 (not c!44503)) b!261409))

(assert (= (and d!62893 (not res!127725)) b!261410))

(declare-fun m!277515 () Bool)

(assert (=> d!62893 m!277515))

(declare-fun m!277517 () Bool)

(assert (=> b!261408 m!277517))

(declare-fun m!277519 () Bool)

(assert (=> b!261408 m!277519))

(assert (=> b!261408 m!277519))

(declare-fun m!277521 () Bool)

(assert (=> b!261408 m!277521))

(assert (=> b!261410 m!277519))

(assert (=> b!261410 m!277519))

(assert (=> b!261410 m!277521))

(assert (=> b!261078 d!62893))

(declare-fun d!62895 () Bool)

(assert (=> d!62895 (= (apply!259 lt!131810 lt!131807) (get!3084 (getValueByKey!318 (toList!1903 lt!131810) lt!131807)))))

(declare-fun bs!9225 () Bool)

(assert (= bs!9225 d!62895))

(declare-fun m!277523 () Bool)

(assert (=> bs!9225 m!277523))

(assert (=> bs!9225 m!277523))

(declare-fun m!277525 () Bool)

(assert (=> bs!9225 m!277525))

(assert (=> b!261078 d!62895))

(declare-fun d!62897 () Bool)

(assert (=> d!62897 (= (apply!259 lt!131820 lt!131815) (get!3084 (getValueByKey!318 (toList!1903 lt!131820) lt!131815)))))

(declare-fun bs!9226 () Bool)

(assert (= bs!9226 d!62897))

(declare-fun m!277527 () Bool)

(assert (=> bs!9226 m!277527))

(assert (=> bs!9226 m!277527))

(declare-fun m!277529 () Bool)

(assert (=> bs!9226 m!277529))

(assert (=> b!261078 d!62897))

(declare-fun d!62899 () Bool)

(assert (=> d!62899 (contains!1870 (+!700 lt!131808 (tuple2!4861 lt!131817 (zeroValue!4648 thiss!1504))) lt!131813)))

(declare-fun lt!132007 () Unit!8084)

(declare-fun choose!1284 (ListLongMap!3775 (_ BitVec 64) V!8481 (_ BitVec 64)) Unit!8084)

(assert (=> d!62899 (= lt!132007 (choose!1284 lt!131808 lt!131817 (zeroValue!4648 thiss!1504) lt!131813))))

(assert (=> d!62899 (contains!1870 lt!131808 lt!131813)))

(assert (=> d!62899 (= (addStillContains!235 lt!131808 lt!131817 (zeroValue!4648 thiss!1504) lt!131813) lt!132007)))

(declare-fun bs!9227 () Bool)

(assert (= bs!9227 d!62899))

(assert (=> bs!9227 m!277109))

(assert (=> bs!9227 m!277109))

(assert (=> bs!9227 m!277113))

(declare-fun m!277531 () Bool)

(assert (=> bs!9227 m!277531))

(declare-fun m!277533 () Bool)

(assert (=> bs!9227 m!277533))

(assert (=> b!261078 d!62899))

(declare-fun d!62901 () Bool)

(declare-fun e!169383 () Bool)

(assert (=> d!62901 e!169383))

(declare-fun res!127726 () Bool)

(assert (=> d!62901 (=> (not res!127726) (not e!169383))))

(declare-fun lt!132011 () ListLongMap!3775)

(assert (=> d!62901 (= res!127726 (contains!1870 lt!132011 (_1!2441 (tuple2!4861 lt!131822 (zeroValue!4648 thiss!1504)))))))

(declare-fun lt!132010 () List!3738)

(assert (=> d!62901 (= lt!132011 (ListLongMap!3776 lt!132010))))

(declare-fun lt!132009 () Unit!8084)

(declare-fun lt!132008 () Unit!8084)

(assert (=> d!62901 (= lt!132009 lt!132008)))

(assert (=> d!62901 (= (getValueByKey!318 lt!132010 (_1!2441 (tuple2!4861 lt!131822 (zeroValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 lt!131822 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62901 (= lt!132008 (lemmaContainsTupThenGetReturnValue!174 lt!132010 (_1!2441 (tuple2!4861 lt!131822 (zeroValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 lt!131822 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62901 (= lt!132010 (insertStrictlySorted!177 (toList!1903 lt!131810) (_1!2441 (tuple2!4861 lt!131822 (zeroValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 lt!131822 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62901 (= (+!700 lt!131810 (tuple2!4861 lt!131822 (zeroValue!4648 thiss!1504))) lt!132011)))

(declare-fun b!261412 () Bool)

(declare-fun res!127727 () Bool)

(assert (=> b!261412 (=> (not res!127727) (not e!169383))))

(assert (=> b!261412 (= res!127727 (= (getValueByKey!318 (toList!1903 lt!132011) (_1!2441 (tuple2!4861 lt!131822 (zeroValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 lt!131822 (zeroValue!4648 thiss!1504))))))))

(declare-fun b!261413 () Bool)

(assert (=> b!261413 (= e!169383 (contains!1872 (toList!1903 lt!132011) (tuple2!4861 lt!131822 (zeroValue!4648 thiss!1504))))))

(assert (= (and d!62901 res!127726) b!261412))

(assert (= (and b!261412 res!127727) b!261413))

(declare-fun m!277535 () Bool)

(assert (=> d!62901 m!277535))

(declare-fun m!277537 () Bool)

(assert (=> d!62901 m!277537))

(declare-fun m!277539 () Bool)

(assert (=> d!62901 m!277539))

(declare-fun m!277541 () Bool)

(assert (=> d!62901 m!277541))

(declare-fun m!277543 () Bool)

(assert (=> b!261412 m!277543))

(declare-fun m!277545 () Bool)

(assert (=> b!261413 m!277545))

(assert (=> b!261078 d!62901))

(assert (=> b!261078 d!62841))

(declare-fun d!62903 () Bool)

(assert (=> d!62903 (= (apply!259 (+!700 lt!131827 (tuple2!4861 lt!131818 (minValue!4648 thiss!1504))) lt!131825) (get!3084 (getValueByKey!318 (toList!1903 (+!700 lt!131827 (tuple2!4861 lt!131818 (minValue!4648 thiss!1504)))) lt!131825)))))

(declare-fun bs!9228 () Bool)

(assert (= bs!9228 d!62903))

(declare-fun m!277547 () Bool)

(assert (=> bs!9228 m!277547))

(assert (=> bs!9228 m!277547))

(declare-fun m!277549 () Bool)

(assert (=> bs!9228 m!277549))

(assert (=> b!261078 d!62903))

(declare-fun d!62905 () Bool)

(declare-fun e!169384 () Bool)

(assert (=> d!62905 e!169384))

(declare-fun res!127728 () Bool)

(assert (=> d!62905 (=> (not res!127728) (not e!169384))))

(declare-fun lt!132015 () ListLongMap!3775)

(assert (=> d!62905 (= res!127728 (contains!1870 lt!132015 (_1!2441 (tuple2!4861 lt!131817 (zeroValue!4648 thiss!1504)))))))

(declare-fun lt!132014 () List!3738)

(assert (=> d!62905 (= lt!132015 (ListLongMap!3776 lt!132014))))

(declare-fun lt!132013 () Unit!8084)

(declare-fun lt!132012 () Unit!8084)

(assert (=> d!62905 (= lt!132013 lt!132012)))

(assert (=> d!62905 (= (getValueByKey!318 lt!132014 (_1!2441 (tuple2!4861 lt!131817 (zeroValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 lt!131817 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62905 (= lt!132012 (lemmaContainsTupThenGetReturnValue!174 lt!132014 (_1!2441 (tuple2!4861 lt!131817 (zeroValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 lt!131817 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62905 (= lt!132014 (insertStrictlySorted!177 (toList!1903 lt!131808) (_1!2441 (tuple2!4861 lt!131817 (zeroValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 lt!131817 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62905 (= (+!700 lt!131808 (tuple2!4861 lt!131817 (zeroValue!4648 thiss!1504))) lt!132015)))

(declare-fun b!261414 () Bool)

(declare-fun res!127729 () Bool)

(assert (=> b!261414 (=> (not res!127729) (not e!169384))))

(assert (=> b!261414 (= res!127729 (= (getValueByKey!318 (toList!1903 lt!132015) (_1!2441 (tuple2!4861 lt!131817 (zeroValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 lt!131817 (zeroValue!4648 thiss!1504))))))))

(declare-fun b!261415 () Bool)

(assert (=> b!261415 (= e!169384 (contains!1872 (toList!1903 lt!132015) (tuple2!4861 lt!131817 (zeroValue!4648 thiss!1504))))))

(assert (= (and d!62905 res!127728) b!261414))

(assert (= (and b!261414 res!127729) b!261415))

(declare-fun m!277551 () Bool)

(assert (=> d!62905 m!277551))

(declare-fun m!277553 () Bool)

(assert (=> d!62905 m!277553))

(declare-fun m!277555 () Bool)

(assert (=> d!62905 m!277555))

(declare-fun m!277557 () Bool)

(assert (=> d!62905 m!277557))

(declare-fun m!277559 () Bool)

(assert (=> b!261414 m!277559))

(declare-fun m!277561 () Bool)

(assert (=> b!261415 m!277561))

(assert (=> b!261078 d!62905))

(declare-fun d!62907 () Bool)

(assert (=> d!62907 (= (apply!259 (+!700 lt!131810 (tuple2!4861 lt!131822 (zeroValue!4648 thiss!1504))) lt!131807) (apply!259 lt!131810 lt!131807))))

(declare-fun lt!132018 () Unit!8084)

(declare-fun choose!1285 (ListLongMap!3775 (_ BitVec 64) V!8481 (_ BitVec 64)) Unit!8084)

(assert (=> d!62907 (= lt!132018 (choose!1285 lt!131810 lt!131822 (zeroValue!4648 thiss!1504) lt!131807))))

(declare-fun e!169387 () Bool)

(assert (=> d!62907 e!169387))

(declare-fun res!127732 () Bool)

(assert (=> d!62907 (=> (not res!127732) (not e!169387))))

(assert (=> d!62907 (= res!127732 (contains!1870 lt!131810 lt!131807))))

(assert (=> d!62907 (= (addApplyDifferent!235 lt!131810 lt!131822 (zeroValue!4648 thiss!1504) lt!131807) lt!132018)))

(declare-fun b!261419 () Bool)

(assert (=> b!261419 (= e!169387 (not (= lt!131807 lt!131822)))))

(assert (= (and d!62907 res!127732) b!261419))

(declare-fun m!277563 () Bool)

(assert (=> d!62907 m!277563))

(assert (=> d!62907 m!277087))

(assert (=> d!62907 m!277103))

(assert (=> d!62907 m!277087))

(declare-fun m!277565 () Bool)

(assert (=> d!62907 m!277565))

(assert (=> d!62907 m!277115))

(assert (=> b!261078 d!62907))

(declare-fun d!62909 () Bool)

(assert (=> d!62909 (= (apply!259 lt!131827 lt!131825) (get!3084 (getValueByKey!318 (toList!1903 lt!131827) lt!131825)))))

(declare-fun bs!9229 () Bool)

(assert (= bs!9229 d!62909))

(declare-fun m!277567 () Bool)

(assert (=> bs!9229 m!277567))

(assert (=> bs!9229 m!277567))

(declare-fun m!277569 () Bool)

(assert (=> bs!9229 m!277569))

(assert (=> b!261078 d!62909))

(declare-fun d!62911 () Bool)

(assert (=> d!62911 (= (apply!259 (+!700 lt!131827 (tuple2!4861 lt!131818 (minValue!4648 thiss!1504))) lt!131825) (apply!259 lt!131827 lt!131825))))

(declare-fun lt!132019 () Unit!8084)

(assert (=> d!62911 (= lt!132019 (choose!1285 lt!131827 lt!131818 (minValue!4648 thiss!1504) lt!131825))))

(declare-fun e!169388 () Bool)

(assert (=> d!62911 e!169388))

(declare-fun res!127733 () Bool)

(assert (=> d!62911 (=> (not res!127733) (not e!169388))))

(assert (=> d!62911 (= res!127733 (contains!1870 lt!131827 lt!131825))))

(assert (=> d!62911 (= (addApplyDifferent!235 lt!131827 lt!131818 (minValue!4648 thiss!1504) lt!131825) lt!132019)))

(declare-fun b!261420 () Bool)

(assert (=> b!261420 (= e!169388 (not (= lt!131825 lt!131818)))))

(assert (= (and d!62911 res!127733) b!261420))

(declare-fun m!277571 () Bool)

(assert (=> d!62911 m!277571))

(assert (=> d!62911 m!277089))

(assert (=> d!62911 m!277091))

(assert (=> d!62911 m!277089))

(declare-fun m!277573 () Bool)

(assert (=> d!62911 m!277573))

(assert (=> d!62911 m!277101))

(assert (=> b!261078 d!62911))

(declare-fun d!62913 () Bool)

(assert (=> d!62913 (= (apply!259 (+!700 lt!131810 (tuple2!4861 lt!131822 (zeroValue!4648 thiss!1504))) lt!131807) (get!3084 (getValueByKey!318 (toList!1903 (+!700 lt!131810 (tuple2!4861 lt!131822 (zeroValue!4648 thiss!1504)))) lt!131807)))))

(declare-fun bs!9230 () Bool)

(assert (= bs!9230 d!62913))

(declare-fun m!277575 () Bool)

(assert (=> bs!9230 m!277575))

(assert (=> bs!9230 m!277575))

(declare-fun m!277577 () Bool)

(assert (=> bs!9230 m!277577))

(assert (=> b!261078 d!62913))

(declare-fun d!62915 () Bool)

(assert (=> d!62915 (= (apply!259 (+!700 lt!131820 (tuple2!4861 lt!131823 (minValue!4648 thiss!1504))) lt!131815) (apply!259 lt!131820 lt!131815))))

(declare-fun lt!132020 () Unit!8084)

(assert (=> d!62915 (= lt!132020 (choose!1285 lt!131820 lt!131823 (minValue!4648 thiss!1504) lt!131815))))

(declare-fun e!169389 () Bool)

(assert (=> d!62915 e!169389))

(declare-fun res!127734 () Bool)

(assert (=> d!62915 (=> (not res!127734) (not e!169389))))

(assert (=> d!62915 (= res!127734 (contains!1870 lt!131820 lt!131815))))

(assert (=> d!62915 (= (addApplyDifferent!235 lt!131820 lt!131823 (minValue!4648 thiss!1504) lt!131815) lt!132020)))

(declare-fun b!261421 () Bool)

(assert (=> b!261421 (= e!169389 (not (= lt!131815 lt!131823)))))

(assert (= (and d!62915 res!127734) b!261421))

(declare-fun m!277579 () Bool)

(assert (=> d!62915 m!277579))

(assert (=> d!62915 m!277105))

(assert (=> d!62915 m!277107))

(assert (=> d!62915 m!277105))

(declare-fun m!277581 () Bool)

(assert (=> d!62915 m!277581))

(assert (=> d!62915 m!277093))

(assert (=> b!261078 d!62915))

(declare-fun d!62917 () Bool)

(assert (=> d!62917 (= (apply!259 lt!131852 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3084 (getValueByKey!318 (toList!1903 lt!131852) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9231 () Bool)

(assert (= bs!9231 d!62917))

(assert (=> bs!9231 m!277355))

(assert (=> bs!9231 m!277355))

(declare-fun m!277583 () Bool)

(assert (=> bs!9231 m!277583))

(assert (=> b!261147 d!62917))

(declare-fun d!62919 () Bool)

(declare-fun isEmpty!545 (Option!324) Bool)

(assert (=> d!62919 (= (isDefined!258 (getValueByKey!318 (toList!1903 lt!131643) key!932)) (not (isEmpty!545 (getValueByKey!318 (toList!1903 lt!131643) key!932))))))

(declare-fun bs!9232 () Bool)

(assert (= bs!9232 d!62919))

(assert (=> bs!9232 m!277079))

(declare-fun m!277585 () Bool)

(assert (=> bs!9232 m!277585))

(assert (=> b!261027 d!62919))

(declare-fun b!261422 () Bool)

(declare-fun e!169390 () Option!324)

(assert (=> b!261422 (= e!169390 (Some!323 (_2!2441 (h!4399 (toList!1903 lt!131643)))))))

(declare-fun b!261424 () Bool)

(declare-fun e!169391 () Option!324)

(assert (=> b!261424 (= e!169391 (getValueByKey!318 (t!8801 (toList!1903 lt!131643)) key!932))))

(declare-fun b!261423 () Bool)

(assert (=> b!261423 (= e!169390 e!169391)))

(declare-fun c!44505 () Bool)

(assert (=> b!261423 (= c!44505 (and ((_ is Cons!3734) (toList!1903 lt!131643)) (not (= (_1!2441 (h!4399 (toList!1903 lt!131643))) key!932))))))

(declare-fun d!62921 () Bool)

(declare-fun c!44504 () Bool)

(assert (=> d!62921 (= c!44504 (and ((_ is Cons!3734) (toList!1903 lt!131643)) (= (_1!2441 (h!4399 (toList!1903 lt!131643))) key!932)))))

(assert (=> d!62921 (= (getValueByKey!318 (toList!1903 lt!131643) key!932) e!169390)))

(declare-fun b!261425 () Bool)

(assert (=> b!261425 (= e!169391 None!322)))

(assert (= (and d!62921 c!44504) b!261422))

(assert (= (and d!62921 (not c!44504)) b!261423))

(assert (= (and b!261423 c!44505) b!261424))

(assert (= (and b!261423 (not c!44505)) b!261425))

(declare-fun m!277587 () Bool)

(assert (=> b!261424 m!277587))

(assert (=> b!261027 d!62921))

(declare-fun d!62923 () Bool)

(assert (=> d!62923 (= (validKeyInArray!0 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261193 d!62923))

(declare-fun d!62925 () Bool)

(assert (=> d!62925 (arrayNoDuplicates!0 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) #b00000000000000000000000000000000 Nil!3736)))

(assert (=> d!62925 true))

(declare-fun _$65!95 () Unit!8084)

(assert (=> d!62925 (= (choose!41 (_keys!6991 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3736) _$65!95)))

(declare-fun bs!9233 () Bool)

(assert (= bs!9233 d!62925))

(assert (=> bs!9233 m!276885))

(assert (=> bs!9233 m!277259))

(assert (=> d!62815 d!62925))

(declare-fun d!62927 () Bool)

(assert (=> d!62927 (= (+!700 (getCurrentListMap!1435 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) (tuple2!4861 key!932 v!346)) (getCurrentListMap!1435 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)))))

(assert (=> d!62927 true))

(declare-fun _$3!64 () Unit!8084)

(assert (=> d!62927 (= (choose!1281 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) index!297 key!932 v!346 (defaultEntry!4807 thiss!1504)) _$3!64)))

(declare-fun bs!9234 () Bool)

(assert (= bs!9234 d!62927))

(assert (=> bs!9234 m!276885))

(assert (=> bs!9234 m!276875))

(assert (=> bs!9234 m!276923))

(assert (=> bs!9234 m!276923))

(assert (=> bs!9234 m!277237))

(assert (=> bs!9234 m!277239))

(assert (=> d!62807 d!62927))

(assert (=> d!62807 d!62809))

(declare-fun b!261426 () Bool)

(declare-fun e!169393 () Bool)

(declare-fun e!169392 () Bool)

(assert (=> b!261426 (= e!169393 e!169392)))

(declare-fun c!44506 () Bool)

(assert (=> b!261426 (= c!44506 (validKeyInArray!0 (select (arr!5966 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!261427 () Bool)

(declare-fun call!24948 () Bool)

(assert (=> b!261427 (= e!169392 call!24948)))

(declare-fun d!62929 () Bool)

(declare-fun res!127735 () Bool)

(declare-fun e!169394 () Bool)

(assert (=> d!62929 (=> res!127735 e!169394)))

(assert (=> d!62929 (= res!127735 (bvsge #b00000000000000000000000000000000 (size!6316 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))))))))

(assert (=> d!62929 (= (arrayNoDuplicates!0 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) #b00000000000000000000000000000000 Nil!3736) e!169394)))

(declare-fun bm!24945 () Bool)

(assert (=> bm!24945 (= call!24948 (arrayNoDuplicates!0 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44506 (Cons!3735 (select (arr!5966 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504)))) #b00000000000000000000000000000000) Nil!3736) Nil!3736)))))

(declare-fun b!261428 () Bool)

(assert (=> b!261428 (= e!169394 e!169393)))

(declare-fun res!127736 () Bool)

(assert (=> b!261428 (=> (not res!127736) (not e!169393))))

(declare-fun e!169395 () Bool)

(assert (=> b!261428 (= res!127736 (not e!169395))))

(declare-fun res!127737 () Bool)

(assert (=> b!261428 (=> (not res!127737) (not e!169395))))

(assert (=> b!261428 (= res!127737 (validKeyInArray!0 (select (arr!5966 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!261429 () Bool)

(assert (=> b!261429 (= e!169395 (contains!1873 Nil!3736 (select (arr!5966 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!261430 () Bool)

(assert (=> b!261430 (= e!169392 call!24948)))

(assert (= (and d!62929 (not res!127735)) b!261428))

(assert (= (and b!261428 res!127737) b!261429))

(assert (= (and b!261428 res!127736) b!261426))

(assert (= (and b!261426 c!44506) b!261427))

(assert (= (and b!261426 (not c!44506)) b!261430))

(assert (= (or b!261427 b!261430) bm!24945))

(assert (=> b!261426 m!277423))

(assert (=> b!261426 m!277423))

(assert (=> b!261426 m!277425))

(assert (=> bm!24945 m!277423))

(declare-fun m!277589 () Bool)

(assert (=> bm!24945 m!277589))

(assert (=> b!261428 m!277423))

(assert (=> b!261428 m!277423))

(assert (=> b!261428 m!277425))

(assert (=> b!261429 m!277423))

(assert (=> b!261429 m!277423))

(declare-fun m!277591 () Bool)

(assert (=> b!261429 m!277591))

(assert (=> b!261172 d!62929))

(declare-fun d!62931 () Bool)

(assert (=> d!62931 (isDefined!258 (getValueByKey!318 (toList!1903 lt!131643) key!932))))

(declare-fun lt!132023 () Unit!8084)

(declare-fun choose!1286 (List!3738 (_ BitVec 64)) Unit!8084)

(assert (=> d!62931 (= lt!132023 (choose!1286 (toList!1903 lt!131643) key!932))))

(declare-fun e!169398 () Bool)

(assert (=> d!62931 e!169398))

(declare-fun res!127740 () Bool)

(assert (=> d!62931 (=> (not res!127740) (not e!169398))))

(assert (=> d!62931 (= res!127740 (isStrictlySorted!363 (toList!1903 lt!131643)))))

(assert (=> d!62931 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1903 lt!131643) key!932) lt!132023)))

(declare-fun b!261433 () Bool)

(assert (=> b!261433 (= e!169398 (containsKey!309 (toList!1903 lt!131643) key!932))))

(assert (= (and d!62931 res!127740) b!261433))

(assert (=> d!62931 m!277079))

(assert (=> d!62931 m!277079))

(assert (=> d!62931 m!277081))

(declare-fun m!277593 () Bool)

(assert (=> d!62931 m!277593))

(assert (=> d!62931 m!277405))

(assert (=> b!261433 m!277075))

(assert (=> b!261025 d!62931))

(assert (=> b!261025 d!62919))

(assert (=> b!261025 d!62921))

(declare-fun d!62933 () Bool)

(assert (=> d!62933 (= (validKeyInArray!0 (select (arr!5966 (_keys!6991 thiss!1504)) index!297)) (and (not (= (select (arr!5966 (_keys!6991 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5966 (_keys!6991 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261122 d!62933))

(declare-fun d!62935 () Bool)

(declare-fun res!127741 () Bool)

(declare-fun e!169399 () Bool)

(assert (=> d!62935 (=> res!127741 e!169399)))

(assert (=> d!62935 (= res!127741 (= (select (arr!5966 lt!131647) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62935 (= (arrayContainsKey!0 lt!131647 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!169399)))

(declare-fun b!261434 () Bool)

(declare-fun e!169400 () Bool)

(assert (=> b!261434 (= e!169399 e!169400)))

(declare-fun res!127742 () Bool)

(assert (=> b!261434 (=> (not res!127742) (not e!169400))))

(assert (=> b!261434 (= res!127742 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6316 lt!131647)))))

(declare-fun b!261435 () Bool)

(assert (=> b!261435 (= e!169400 (arrayContainsKey!0 lt!131647 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62935 (not res!127741)) b!261434))

(assert (= (and b!261434 res!127742) b!261435))

(assert (=> d!62935 m!277361))

(declare-fun m!277595 () Bool)

(assert (=> b!261435 m!277595))

(assert (=> b!261127 d!62935))

(declare-fun d!62937 () Bool)

(declare-fun e!169401 () Bool)

(assert (=> d!62937 e!169401))

(declare-fun res!127743 () Bool)

(assert (=> d!62937 (=> res!127743 e!169401)))

(declare-fun lt!132025 () Bool)

(assert (=> d!62937 (= res!127743 (not lt!132025))))

(declare-fun lt!132024 () Bool)

(assert (=> d!62937 (= lt!132025 lt!132024)))

(declare-fun lt!132026 () Unit!8084)

(declare-fun e!169402 () Unit!8084)

(assert (=> d!62937 (= lt!132026 e!169402)))

(declare-fun c!44507 () Bool)

(assert (=> d!62937 (= c!44507 lt!132024)))

(assert (=> d!62937 (= lt!132024 (containsKey!309 (toList!1903 lt!131852) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62937 (= (contains!1870 lt!131852 #b0000000000000000000000000000000000000000000000000000000000000000) lt!132025)))

(declare-fun b!261436 () Bool)

(declare-fun lt!132027 () Unit!8084)

(assert (=> b!261436 (= e!169402 lt!132027)))

(assert (=> b!261436 (= lt!132027 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1903 lt!131852) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261436 (isDefined!258 (getValueByKey!318 (toList!1903 lt!131852) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261437 () Bool)

(declare-fun Unit!8106 () Unit!8084)

(assert (=> b!261437 (= e!169402 Unit!8106)))

(declare-fun b!261438 () Bool)

(assert (=> b!261438 (= e!169401 (isDefined!258 (getValueByKey!318 (toList!1903 lt!131852) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62937 c!44507) b!261436))

(assert (= (and d!62937 (not c!44507)) b!261437))

(assert (= (and d!62937 (not res!127743)) b!261438))

(declare-fun m!277597 () Bool)

(assert (=> d!62937 m!277597))

(declare-fun m!277599 () Bool)

(assert (=> b!261436 m!277599))

(declare-fun m!277601 () Bool)

(assert (=> b!261436 m!277601))

(assert (=> b!261436 m!277601))

(declare-fun m!277603 () Bool)

(assert (=> b!261436 m!277603))

(assert (=> b!261438 m!277601))

(assert (=> b!261438 m!277601))

(assert (=> b!261438 m!277603))

(assert (=> bm!24900 d!62937))

(assert (=> b!261145 d!62857))

(assert (=> b!261073 d!62923))

(declare-fun d!62939 () Bool)

(declare-fun e!169403 () Bool)

(assert (=> d!62939 e!169403))

(declare-fun res!127744 () Bool)

(assert (=> d!62939 (=> (not res!127744) (not e!169403))))

(declare-fun lt!132031 () ListLongMap!3775)

(assert (=> d!62939 (= res!127744 (contains!1870 lt!132031 (_1!2441 (ite (or c!44421 c!44419) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(declare-fun lt!132030 () List!3738)

(assert (=> d!62939 (= lt!132031 (ListLongMap!3776 lt!132030))))

(declare-fun lt!132029 () Unit!8084)

(declare-fun lt!132028 () Unit!8084)

(assert (=> d!62939 (= lt!132029 lt!132028)))

(assert (=> d!62939 (= (getValueByKey!318 lt!132030 (_1!2441 (ite (or c!44421 c!44419) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))) (Some!323 (_2!2441 (ite (or c!44421 c!44419) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(assert (=> d!62939 (= lt!132028 (lemmaContainsTupThenGetReturnValue!174 lt!132030 (_1!2441 (ite (or c!44421 c!44419) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) (_2!2441 (ite (or c!44421 c!44419) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(assert (=> d!62939 (= lt!132030 (insertStrictlySorted!177 (toList!1903 (ite c!44421 call!24901 (ite c!44419 call!24895 call!24900))) (_1!2441 (ite (or c!44421 c!44419) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) (_2!2441 (ite (or c!44421 c!44419) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(assert (=> d!62939 (= (+!700 (ite c!44421 call!24901 (ite c!44419 call!24895 call!24900)) (ite (or c!44421 c!44419) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) lt!132031)))

(declare-fun b!261439 () Bool)

(declare-fun res!127745 () Bool)

(assert (=> b!261439 (=> (not res!127745) (not e!169403))))

(assert (=> b!261439 (= res!127745 (= (getValueByKey!318 (toList!1903 lt!132031) (_1!2441 (ite (or c!44421 c!44419) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))) (Some!323 (_2!2441 (ite (or c!44421 c!44419) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))))

(declare-fun b!261440 () Bool)

(assert (=> b!261440 (= e!169403 (contains!1872 (toList!1903 lt!132031) (ite (or c!44421 c!44419) (tuple2!4861 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4648 thiss!1504)) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(assert (= (and d!62939 res!127744) b!261439))

(assert (= (and b!261439 res!127745) b!261440))

(declare-fun m!277605 () Bool)

(assert (=> d!62939 m!277605))

(declare-fun m!277607 () Bool)

(assert (=> d!62939 m!277607))

(declare-fun m!277609 () Bool)

(assert (=> d!62939 m!277609))

(declare-fun m!277611 () Bool)

(assert (=> d!62939 m!277611))

(declare-fun m!277613 () Bool)

(assert (=> b!261439 m!277613))

(declare-fun m!277615 () Bool)

(assert (=> b!261440 m!277615))

(assert (=> bm!24898 d!62939))

(declare-fun d!62941 () Bool)

(assert (=> d!62941 (= (apply!259 lt!131806 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3084 (getValueByKey!318 (toList!1903 lt!131806) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9235 () Bool)

(assert (= bs!9235 d!62941))

(declare-fun m!277617 () Bool)

(assert (=> bs!9235 m!277617))

(assert (=> bs!9235 m!277617))

(declare-fun m!277619 () Bool)

(assert (=> bs!9235 m!277619))

(assert (=> b!261089 d!62941))

(declare-fun d!62943 () Bool)

(assert (=> d!62943 (= (inRange!0 (ite c!44451 (index!6774 lt!131908) (index!6777 lt!131908)) (mask!11144 thiss!1504)) (and (bvsge (ite c!44451 (index!6774 lt!131908) (index!6777 lt!131908)) #b00000000000000000000000000000000) (bvslt (ite c!44451 (index!6774 lt!131908) (index!6777 lt!131908)) (bvadd (mask!11144 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24922 d!62943))

(declare-fun d!62945 () Bool)

(declare-fun res!127747 () Bool)

(declare-fun e!169404 () Bool)

(assert (=> d!62945 (=> res!127747 e!169404)))

(assert (=> d!62945 (= res!127747 (bvsge #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))))))

(assert (=> d!62945 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6991 thiss!1504) (mask!11144 thiss!1504)) e!169404)))

(declare-fun b!261441 () Bool)

(declare-fun e!169405 () Bool)

(assert (=> b!261441 (= e!169404 e!169405)))

(declare-fun c!44508 () Bool)

(assert (=> b!261441 (= c!44508 (validKeyInArray!0 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24946 () Bool)

(declare-fun call!24949 () Bool)

(assert (=> bm!24946 (= call!24949 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6991 thiss!1504) (mask!11144 thiss!1504)))))

(declare-fun b!261442 () Bool)

(assert (=> b!261442 (= e!169405 call!24949)))

(declare-fun b!261443 () Bool)

(declare-fun e!169406 () Bool)

(assert (=> b!261443 (= e!169405 e!169406)))

(declare-fun lt!132033 () (_ BitVec 64))

(assert (=> b!261443 (= lt!132033 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132034 () Unit!8084)

(assert (=> b!261443 (= lt!132034 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6991 thiss!1504) lt!132033 #b00000000000000000000000000000000))))

(assert (=> b!261443 (arrayContainsKey!0 (_keys!6991 thiss!1504) lt!132033 #b00000000000000000000000000000000)))

(declare-fun lt!132032 () Unit!8084)

(assert (=> b!261443 (= lt!132032 lt!132034)))

(declare-fun res!127746 () Bool)

(assert (=> b!261443 (= res!127746 (= (seekEntryOrOpen!0 (select (arr!5966 (_keys!6991 thiss!1504)) #b00000000000000000000000000000000) (_keys!6991 thiss!1504) (mask!11144 thiss!1504)) (Found!1151 #b00000000000000000000000000000000)))))

(assert (=> b!261443 (=> (not res!127746) (not e!169406))))

(declare-fun b!261444 () Bool)

(assert (=> b!261444 (= e!169406 call!24949)))

(assert (= (and d!62945 (not res!127747)) b!261441))

(assert (= (and b!261441 c!44508) b!261443))

(assert (= (and b!261441 (not c!44508)) b!261442))

(assert (= (and b!261443 res!127746) b!261444))

(assert (= (or b!261444 b!261442) bm!24946))

(assert (=> b!261441 m!277057))

(assert (=> b!261441 m!277057))

(assert (=> b!261441 m!277083))

(declare-fun m!277621 () Bool)

(assert (=> bm!24946 m!277621))

(assert (=> b!261443 m!277057))

(declare-fun m!277623 () Bool)

(assert (=> b!261443 m!277623))

(declare-fun m!277625 () Bool)

(assert (=> b!261443 m!277625))

(assert (=> b!261443 m!277057))

(declare-fun m!277627 () Bool)

(assert (=> b!261443 m!277627))

(assert (=> b!261106 d!62945))

(declare-fun d!62947 () Bool)

(declare-fun res!127749 () Bool)

(declare-fun e!169407 () Bool)

(assert (=> d!62947 (=> res!127749 e!169407)))

(assert (=> d!62947 (= res!127749 (bvsge #b00000000000000000000000000000000 (size!6316 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))))))))

(assert (=> d!62947 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) (mask!11144 thiss!1504)) e!169407)))

(declare-fun b!261445 () Bool)

(declare-fun e!169408 () Bool)

(assert (=> b!261445 (= e!169407 e!169408)))

(declare-fun c!44509 () Bool)

(assert (=> b!261445 (= c!44509 (validKeyInArray!0 (select (arr!5966 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun bm!24947 () Bool)

(declare-fun call!24950 () Bool)

(assert (=> bm!24947 (= call!24950 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) (mask!11144 thiss!1504)))))

(declare-fun b!261446 () Bool)

(assert (=> b!261446 (= e!169408 call!24950)))

(declare-fun b!261447 () Bool)

(declare-fun e!169409 () Bool)

(assert (=> b!261447 (= e!169408 e!169409)))

(declare-fun lt!132036 () (_ BitVec 64))

(assert (=> b!261447 (= lt!132036 (select (arr!5966 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!132037 () Unit!8084)

(assert (=> b!261447 (= lt!132037 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) lt!132036 #b00000000000000000000000000000000))))

(assert (=> b!261447 (arrayContainsKey!0 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) lt!132036 #b00000000000000000000000000000000)))

(declare-fun lt!132035 () Unit!8084)

(assert (=> b!261447 (= lt!132035 lt!132037)))

(declare-fun res!127748 () Bool)

(assert (=> b!261447 (= res!127748 (= (seekEntryOrOpen!0 (select (arr!5966 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504)))) #b00000000000000000000000000000000) (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) (mask!11144 thiss!1504)) (Found!1151 #b00000000000000000000000000000000)))))

(assert (=> b!261447 (=> (not res!127748) (not e!169409))))

(declare-fun b!261448 () Bool)

(assert (=> b!261448 (= e!169409 call!24950)))

(assert (= (and d!62947 (not res!127749)) b!261445))

(assert (= (and b!261445 c!44509) b!261447))

(assert (= (and b!261445 (not c!44509)) b!261446))

(assert (= (and b!261447 res!127748) b!261448))

(assert (= (or b!261448 b!261446) bm!24947))

(assert (=> b!261445 m!277423))

(assert (=> b!261445 m!277423))

(assert (=> b!261445 m!277425))

(declare-fun m!277629 () Bool)

(assert (=> bm!24947 m!277629))

(assert (=> b!261447 m!277423))

(declare-fun m!277631 () Bool)

(assert (=> b!261447 m!277631))

(declare-fun m!277633 () Bool)

(assert (=> b!261447 m!277633))

(assert (=> b!261447 m!277423))

(declare-fun m!277635 () Bool)

(assert (=> b!261447 m!277635))

(assert (=> b!261187 d!62947))

(declare-fun b!261459 () Bool)

(declare-fun res!127761 () Bool)

(declare-fun e!169412 () Bool)

(assert (=> b!261459 (=> (not res!127761) (not e!169412))))

(declare-fun size!6321 (LongMapFixedSize!3838) (_ BitVec 32))

(assert (=> b!261459 (= res!127761 (= (size!6321 thiss!1504) (bvadd (_size!1968 thiss!1504) (bvsdiv (bvadd (extraKeys!4544 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!261458 () Bool)

(declare-fun res!127758 () Bool)

(assert (=> b!261458 (=> (not res!127758) (not e!169412))))

(assert (=> b!261458 (= res!127758 (bvsge (size!6321 thiss!1504) (_size!1968 thiss!1504)))))

(declare-fun d!62949 () Bool)

(declare-fun res!127760 () Bool)

(assert (=> d!62949 (=> (not res!127760) (not e!169412))))

(assert (=> d!62949 (= res!127760 (validMask!0 (mask!11144 thiss!1504)))))

(assert (=> d!62949 (= (simpleValid!282 thiss!1504) e!169412)))

(declare-fun b!261460 () Bool)

(assert (=> b!261460 (= e!169412 (and (bvsge (extraKeys!4544 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4544 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1968 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!261457 () Bool)

(declare-fun res!127759 () Bool)

(assert (=> b!261457 (=> (not res!127759) (not e!169412))))

(assert (=> b!261457 (= res!127759 (and (= (size!6315 (_values!4790 thiss!1504)) (bvadd (mask!11144 thiss!1504) #b00000000000000000000000000000001)) (= (size!6316 (_keys!6991 thiss!1504)) (size!6315 (_values!4790 thiss!1504))) (bvsge (_size!1968 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1968 thiss!1504) (bvadd (mask!11144 thiss!1504) #b00000000000000000000000000000001))))))

(assert (= (and d!62949 res!127760) b!261457))

(assert (= (and b!261457 res!127759) b!261458))

(assert (= (and b!261458 res!127758) b!261459))

(assert (= (and b!261459 res!127761) b!261460))

(declare-fun m!277637 () Bool)

(assert (=> b!261459 m!277637))

(assert (=> b!261458 m!277637))

(assert (=> d!62949 m!276865))

(assert (=> d!62797 d!62949))

(declare-fun d!62951 () Bool)

(declare-fun e!169413 () Bool)

(assert (=> d!62951 e!169413))

(declare-fun res!127762 () Bool)

(assert (=> d!62951 (=> res!127762 e!169413)))

(declare-fun lt!132039 () Bool)

(assert (=> d!62951 (= res!127762 (not lt!132039))))

(declare-fun lt!132038 () Bool)

(assert (=> d!62951 (= lt!132039 lt!132038)))

(declare-fun lt!132040 () Unit!8084)

(declare-fun e!169414 () Unit!8084)

(assert (=> d!62951 (= lt!132040 e!169414)))

(declare-fun c!44510 () Bool)

(assert (=> d!62951 (= c!44510 lt!132038)))

(assert (=> d!62951 (= lt!132038 (containsKey!309 (toList!1903 lt!131806) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62951 (= (contains!1870 lt!131806 #b0000000000000000000000000000000000000000000000000000000000000000) lt!132039)))

(declare-fun b!261461 () Bool)

(declare-fun lt!132041 () Unit!8084)

(assert (=> b!261461 (= e!169414 lt!132041)))

(assert (=> b!261461 (= lt!132041 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1903 lt!131806) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261461 (isDefined!258 (getValueByKey!318 (toList!1903 lt!131806) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261462 () Bool)

(declare-fun Unit!8107 () Unit!8084)

(assert (=> b!261462 (= e!169414 Unit!8107)))

(declare-fun b!261463 () Bool)

(assert (=> b!261463 (= e!169413 (isDefined!258 (getValueByKey!318 (toList!1903 lt!131806) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62951 c!44510) b!261461))

(assert (= (and d!62951 (not c!44510)) b!261462))

(assert (= (and d!62951 (not res!127762)) b!261463))

(declare-fun m!277639 () Bool)

(assert (=> d!62951 m!277639))

(declare-fun m!277641 () Bool)

(assert (=> b!261461 m!277641))

(declare-fun m!277643 () Bool)

(assert (=> b!261461 m!277643))

(assert (=> b!261461 m!277643))

(declare-fun m!277645 () Bool)

(assert (=> b!261461 m!277645))

(assert (=> b!261463 m!277643))

(assert (=> b!261463 m!277643))

(assert (=> b!261463 m!277645))

(assert (=> bm!24893 d!62951))

(assert (=> b!261087 d!62923))

(assert (=> b!261208 d!62857))

(declare-fun d!62953 () Bool)

(declare-fun lt!132044 () Bool)

(declare-fun content!176 (List!3738) (InoxSet tuple2!4860))

(assert (=> d!62953 (= lt!132044 (select (content!176 (toList!1903 lt!131848)) (tuple2!4861 key!932 v!346)))))

(declare-fun e!169420 () Bool)

(assert (=> d!62953 (= lt!132044 e!169420)))

(declare-fun res!127767 () Bool)

(assert (=> d!62953 (=> (not res!127767) (not e!169420))))

(assert (=> d!62953 (= res!127767 ((_ is Cons!3734) (toList!1903 lt!131848)))))

(assert (=> d!62953 (= (contains!1872 (toList!1903 lt!131848) (tuple2!4861 key!932 v!346)) lt!132044)))

(declare-fun b!261468 () Bool)

(declare-fun e!169419 () Bool)

(assert (=> b!261468 (= e!169420 e!169419)))

(declare-fun res!127768 () Bool)

(assert (=> b!261468 (=> res!127768 e!169419)))

(assert (=> b!261468 (= res!127768 (= (h!4399 (toList!1903 lt!131848)) (tuple2!4861 key!932 v!346)))))

(declare-fun b!261469 () Bool)

(assert (=> b!261469 (= e!169419 (contains!1872 (t!8801 (toList!1903 lt!131848)) (tuple2!4861 key!932 v!346)))))

(assert (= (and d!62953 res!127767) b!261468))

(assert (= (and b!261468 (not res!127768)) b!261469))

(declare-fun m!277647 () Bool)

(assert (=> d!62953 m!277647))

(declare-fun m!277649 () Bool)

(assert (=> d!62953 m!277649))

(declare-fun m!277651 () Bool)

(assert (=> b!261469 m!277651))

(assert (=> b!261113 d!62953))

(declare-fun d!62955 () Bool)

(assert (=> d!62955 (arrayContainsKey!0 lt!131647 lt!131887 #b00000000000000000000000000000000)))

(declare-fun lt!132045 () Unit!8084)

(assert (=> d!62955 (= lt!132045 (choose!13 lt!131647 lt!131887 #b00000000000000000000000000000000))))

(assert (=> d!62955 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!62955 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131647 lt!131887 #b00000000000000000000000000000000) lt!132045)))

(declare-fun bs!9236 () Bool)

(assert (= bs!9236 d!62955))

(assert (=> bs!9236 m!277253))

(declare-fun m!277653 () Bool)

(assert (=> bs!9236 m!277653))

(assert (=> b!261168 d!62955))

(declare-fun d!62957 () Bool)

(declare-fun res!127769 () Bool)

(declare-fun e!169421 () Bool)

(assert (=> d!62957 (=> res!127769 e!169421)))

(assert (=> d!62957 (= res!127769 (= (select (arr!5966 lt!131647) #b00000000000000000000000000000000) lt!131887))))

(assert (=> d!62957 (= (arrayContainsKey!0 lt!131647 lt!131887 #b00000000000000000000000000000000) e!169421)))

(declare-fun b!261470 () Bool)

(declare-fun e!169422 () Bool)

(assert (=> b!261470 (= e!169421 e!169422)))

(declare-fun res!127770 () Bool)

(assert (=> b!261470 (=> (not res!127770) (not e!169422))))

(assert (=> b!261470 (= res!127770 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6316 lt!131647)))))

(declare-fun b!261471 () Bool)

(assert (=> b!261471 (= e!169422 (arrayContainsKey!0 lt!131647 lt!131887 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62957 (not res!127769)) b!261470))

(assert (= (and b!261470 res!127770) b!261471))

(assert (=> d!62957 m!277177))

(declare-fun m!277655 () Bool)

(assert (=> b!261471 m!277655))

(assert (=> b!261168 d!62957))

(declare-fun e!169424 () SeekEntryResult!1151)

(declare-fun b!261472 () Bool)

(declare-fun lt!132047 () SeekEntryResult!1151)

(assert (=> b!261472 (= e!169424 (seekKeyOrZeroReturnVacant!0 (x!25115 lt!132047) (index!6776 lt!132047) (index!6776 lt!132047) (select (arr!5966 lt!131647) #b00000000000000000000000000000000) lt!131647 (mask!11144 thiss!1504)))))

(declare-fun b!261473 () Bool)

(declare-fun e!169425 () SeekEntryResult!1151)

(declare-fun e!169423 () SeekEntryResult!1151)

(assert (=> b!261473 (= e!169425 e!169423)))

(declare-fun lt!132048 () (_ BitVec 64))

(assert (=> b!261473 (= lt!132048 (select (arr!5966 lt!131647) (index!6776 lt!132047)))))

(declare-fun c!44513 () Bool)

(assert (=> b!261473 (= c!44513 (= lt!132048 (select (arr!5966 lt!131647) #b00000000000000000000000000000000)))))

(declare-fun d!62959 () Bool)

(declare-fun lt!132046 () SeekEntryResult!1151)

(assert (=> d!62959 (and (or ((_ is Undefined!1151) lt!132046) (not ((_ is Found!1151) lt!132046)) (and (bvsge (index!6775 lt!132046) #b00000000000000000000000000000000) (bvslt (index!6775 lt!132046) (size!6316 lt!131647)))) (or ((_ is Undefined!1151) lt!132046) ((_ is Found!1151) lt!132046) (not ((_ is MissingZero!1151) lt!132046)) (and (bvsge (index!6774 lt!132046) #b00000000000000000000000000000000) (bvslt (index!6774 lt!132046) (size!6316 lt!131647)))) (or ((_ is Undefined!1151) lt!132046) ((_ is Found!1151) lt!132046) ((_ is MissingZero!1151) lt!132046) (not ((_ is MissingVacant!1151) lt!132046)) (and (bvsge (index!6777 lt!132046) #b00000000000000000000000000000000) (bvslt (index!6777 lt!132046) (size!6316 lt!131647)))) (or ((_ is Undefined!1151) lt!132046) (ite ((_ is Found!1151) lt!132046) (= (select (arr!5966 lt!131647) (index!6775 lt!132046)) (select (arr!5966 lt!131647) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1151) lt!132046) (= (select (arr!5966 lt!131647) (index!6774 lt!132046)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1151) lt!132046) (= (select (arr!5966 lt!131647) (index!6777 lt!132046)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62959 (= lt!132046 e!169425)))

(declare-fun c!44511 () Bool)

(assert (=> d!62959 (= c!44511 (and ((_ is Intermediate!1151) lt!132047) (undefined!1963 lt!132047)))))

(assert (=> d!62959 (= lt!132047 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5966 lt!131647) #b00000000000000000000000000000000) (mask!11144 thiss!1504)) (select (arr!5966 lt!131647) #b00000000000000000000000000000000) lt!131647 (mask!11144 thiss!1504)))))

(assert (=> d!62959 (validMask!0 (mask!11144 thiss!1504))))

(assert (=> d!62959 (= (seekEntryOrOpen!0 (select (arr!5966 lt!131647) #b00000000000000000000000000000000) lt!131647 (mask!11144 thiss!1504)) lt!132046)))

(declare-fun b!261474 () Bool)

(declare-fun c!44512 () Bool)

(assert (=> b!261474 (= c!44512 (= lt!132048 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261474 (= e!169423 e!169424)))

(declare-fun b!261475 () Bool)

(assert (=> b!261475 (= e!169423 (Found!1151 (index!6776 lt!132047)))))

(declare-fun b!261476 () Bool)

(assert (=> b!261476 (= e!169424 (MissingZero!1151 (index!6776 lt!132047)))))

(declare-fun b!261477 () Bool)

(assert (=> b!261477 (= e!169425 Undefined!1151)))

(assert (= (and d!62959 c!44511) b!261477))

(assert (= (and d!62959 (not c!44511)) b!261473))

(assert (= (and b!261473 c!44513) b!261475))

(assert (= (and b!261473 (not c!44513)) b!261474))

(assert (= (and b!261474 c!44512) b!261476))

(assert (= (and b!261474 (not c!44512)) b!261472))

(assert (=> b!261472 m!277177))

(declare-fun m!277657 () Bool)

(assert (=> b!261472 m!277657))

(declare-fun m!277659 () Bool)

(assert (=> b!261473 m!277659))

(declare-fun m!277661 () Bool)

(assert (=> d!62959 m!277661))

(declare-fun m!277663 () Bool)

(assert (=> d!62959 m!277663))

(assert (=> d!62959 m!277177))

(declare-fun m!277665 () Bool)

(assert (=> d!62959 m!277665))

(assert (=> d!62959 m!276865))

(declare-fun m!277667 () Bool)

(assert (=> d!62959 m!277667))

(assert (=> d!62959 m!277665))

(assert (=> d!62959 m!277177))

(declare-fun m!277669 () Bool)

(assert (=> d!62959 m!277669))

(assert (=> b!261168 d!62959))

(assert (=> d!62787 d!62809))

(declare-fun d!62961 () Bool)

(declare-fun res!127772 () Bool)

(declare-fun e!169426 () Bool)

(assert (=> d!62961 (=> res!127772 e!169426)))

(assert (=> d!62961 (= res!127772 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6316 lt!131647)))))

(assert (=> d!62961 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!131647 (mask!11144 thiss!1504)) e!169426)))

(declare-fun b!261478 () Bool)

(declare-fun e!169427 () Bool)

(assert (=> b!261478 (= e!169426 e!169427)))

(declare-fun c!44514 () Bool)

(assert (=> b!261478 (= c!44514 (validKeyInArray!0 (select (arr!5966 lt!131647) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!24948 () Bool)

(declare-fun call!24951 () Bool)

(assert (=> bm!24948 (= call!24951 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!131647 (mask!11144 thiss!1504)))))

(declare-fun b!261479 () Bool)

(assert (=> b!261479 (= e!169427 call!24951)))

(declare-fun b!261480 () Bool)

(declare-fun e!169428 () Bool)

(assert (=> b!261480 (= e!169427 e!169428)))

(declare-fun lt!132050 () (_ BitVec 64))

(assert (=> b!261480 (= lt!132050 (select (arr!5966 lt!131647) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!132051 () Unit!8084)

(assert (=> b!261480 (= lt!132051 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131647 lt!132050 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!261480 (arrayContainsKey!0 lt!131647 lt!132050 #b00000000000000000000000000000000)))

(declare-fun lt!132049 () Unit!8084)

(assert (=> b!261480 (= lt!132049 lt!132051)))

(declare-fun res!127771 () Bool)

(assert (=> b!261480 (= res!127771 (= (seekEntryOrOpen!0 (select (arr!5966 lt!131647) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!131647 (mask!11144 thiss!1504)) (Found!1151 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!261480 (=> (not res!127771) (not e!169428))))

(declare-fun b!261481 () Bool)

(assert (=> b!261481 (= e!169428 call!24951)))

(assert (= (and d!62961 (not res!127772)) b!261478))

(assert (= (and b!261478 c!44514) b!261480))

(assert (= (and b!261478 (not c!44514)) b!261479))

(assert (= (and b!261480 res!127771) b!261481))

(assert (= (or b!261481 b!261479) bm!24948))

(assert (=> b!261478 m!277361))

(assert (=> b!261478 m!277361))

(assert (=> b!261478 m!277363))

(declare-fun m!277671 () Bool)

(assert (=> bm!24948 m!277671))

(assert (=> b!261480 m!277361))

(declare-fun m!277673 () Bool)

(assert (=> b!261480 m!277673))

(declare-fun m!277675 () Bool)

(assert (=> b!261480 m!277675))

(assert (=> b!261480 m!277361))

(declare-fun m!277677 () Bool)

(assert (=> b!261480 m!277677))

(assert (=> bm!24908 d!62961))

(declare-fun d!62963 () Bool)

(assert (=> d!62963 (= (apply!259 lt!131852 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3084 (getValueByKey!318 (toList!1903 lt!131852) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9237 () Bool)

(assert (= bs!9237 d!62963))

(assert (=> bs!9237 m!277601))

(assert (=> bs!9237 m!277601))

(declare-fun m!277679 () Bool)

(assert (=> bs!9237 m!277679))

(assert (=> b!261138 d!62963))

(declare-fun b!261482 () Bool)

(declare-fun e!169430 () (_ BitVec 32))

(declare-fun call!24952 () (_ BitVec 32))

(assert (=> b!261482 (= e!169430 (bvadd #b00000000000000000000000000000001 call!24952))))

(declare-fun bm!24949 () Bool)

(assert (=> bm!24949 (= call!24952 (arrayCountValidKeys!0 lt!131647 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6316 (_keys!6991 thiss!1504))))))

(declare-fun b!261483 () Bool)

(declare-fun e!169429 () (_ BitVec 32))

(assert (=> b!261483 (= e!169429 e!169430)))

(declare-fun c!44516 () Bool)

(assert (=> b!261483 (= c!44516 (validKeyInArray!0 (select (arr!5966 lt!131647) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!261484 () Bool)

(assert (=> b!261484 (= e!169430 call!24952)))

(declare-fun d!62965 () Bool)

(declare-fun lt!132052 () (_ BitVec 32))

(assert (=> d!62965 (and (bvsge lt!132052 #b00000000000000000000000000000000) (bvsle lt!132052 (bvsub (size!6316 lt!131647) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!62965 (= lt!132052 e!169429)))

(declare-fun c!44515 () Bool)

(assert (=> d!62965 (= c!44515 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6316 (_keys!6991 thiss!1504))))))

(assert (=> d!62965 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6316 (_keys!6991 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6316 (_keys!6991 thiss!1504)) (size!6316 lt!131647)))))

(assert (=> d!62965 (= (arrayCountValidKeys!0 lt!131647 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6316 (_keys!6991 thiss!1504))) lt!132052)))

(declare-fun b!261485 () Bool)

(assert (=> b!261485 (= e!169429 #b00000000000000000000000000000000)))

(assert (= (and d!62965 c!44515) b!261485))

(assert (= (and d!62965 (not c!44515)) b!261483))

(assert (= (and b!261483 c!44516) b!261482))

(assert (= (and b!261483 (not c!44516)) b!261484))

(assert (= (or b!261482 b!261484) bm!24949))

(declare-fun m!277681 () Bool)

(assert (=> bm!24949 m!277681))

(assert (=> b!261483 m!277361))

(assert (=> b!261483 m!277361))

(assert (=> b!261483 m!277363))

(assert (=> bm!24911 d!62965))

(declare-fun d!62967 () Bool)

(declare-fun e!169431 () Bool)

(assert (=> d!62967 e!169431))

(declare-fun res!127773 () Bool)

(assert (=> d!62967 (=> res!127773 e!169431)))

(declare-fun lt!132054 () Bool)

(assert (=> d!62967 (= res!127773 (not lt!132054))))

(declare-fun lt!132053 () Bool)

(assert (=> d!62967 (= lt!132054 lt!132053)))

(declare-fun lt!132055 () Unit!8084)

(declare-fun e!169432 () Unit!8084)

(assert (=> d!62967 (= lt!132055 e!169432)))

(declare-fun c!44517 () Bool)

(assert (=> d!62967 (= c!44517 lt!132053)))

(assert (=> d!62967 (= lt!132053 (containsKey!309 (toList!1903 lt!131806) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62967 (= (contains!1870 lt!131806 #b1000000000000000000000000000000000000000000000000000000000000000) lt!132054)))

(declare-fun b!261486 () Bool)

(declare-fun lt!132056 () Unit!8084)

(assert (=> b!261486 (= e!169432 lt!132056)))

(assert (=> b!261486 (= lt!132056 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1903 lt!131806) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261486 (isDefined!258 (getValueByKey!318 (toList!1903 lt!131806) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261487 () Bool)

(declare-fun Unit!8108 () Unit!8084)

(assert (=> b!261487 (= e!169432 Unit!8108)))

(declare-fun b!261488 () Bool)

(assert (=> b!261488 (= e!169431 (isDefined!258 (getValueByKey!318 (toList!1903 lt!131806) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62967 c!44517) b!261486))

(assert (= (and d!62967 (not c!44517)) b!261487))

(assert (= (and d!62967 (not res!127773)) b!261488))

(declare-fun m!277683 () Bool)

(assert (=> d!62967 m!277683))

(declare-fun m!277685 () Bool)

(assert (=> b!261486 m!277685))

(assert (=> b!261486 m!277617))

(assert (=> b!261486 m!277617))

(declare-fun m!277687 () Bool)

(assert (=> b!261486 m!277687))

(assert (=> b!261488 m!277617))

(assert (=> b!261488 m!277617))

(assert (=> b!261488 m!277687))

(assert (=> bm!24895 d!62967))

(declare-fun d!62969 () Bool)

(declare-fun res!127774 () Bool)

(declare-fun e!169433 () Bool)

(assert (=> d!62969 (=> res!127774 e!169433)))

(assert (=> d!62969 (= res!127774 (= (select (arr!5966 (_keys!6991 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62969 (= (arrayContainsKey!0 (_keys!6991 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!169433)))

(declare-fun b!261489 () Bool)

(declare-fun e!169434 () Bool)

(assert (=> b!261489 (= e!169433 e!169434)))

(declare-fun res!127775 () Bool)

(assert (=> b!261489 (=> (not res!127775) (not e!169434))))

(assert (=> b!261489 (= res!127775 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6316 (_keys!6991 thiss!1504))))))

(declare-fun b!261490 () Bool)

(assert (=> b!261490 (= e!169434 (arrayContainsKey!0 (_keys!6991 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62969 (not res!127774)) b!261489))

(assert (= (and b!261489 res!127775) b!261490))

(declare-fun m!277689 () Bool)

(assert (=> d!62969 m!277689))

(declare-fun m!277691 () Bool)

(assert (=> b!261490 m!277691))

(assert (=> b!261000 d!62969))

(declare-fun d!62971 () Bool)

(assert (=> d!62971 (= (apply!259 lt!131873 lt!131871) (get!3084 (getValueByKey!318 (toList!1903 lt!131873) lt!131871)))))

(declare-fun bs!9238 () Bool)

(assert (= bs!9238 d!62971))

(declare-fun m!277693 () Bool)

(assert (=> bs!9238 m!277693))

(assert (=> bs!9238 m!277693))

(declare-fun m!277695 () Bool)

(assert (=> bs!9238 m!277695))

(assert (=> b!261136 d!62971))

(declare-fun d!62973 () Bool)

(assert (=> d!62973 (= (apply!259 (+!700 lt!131856 (tuple2!4861 lt!131868 (zeroValue!4648 thiss!1504))) lt!131853) (get!3084 (getValueByKey!318 (toList!1903 (+!700 lt!131856 (tuple2!4861 lt!131868 (zeroValue!4648 thiss!1504)))) lt!131853)))))

(declare-fun bs!9239 () Bool)

(assert (= bs!9239 d!62973))

(declare-fun m!277697 () Bool)

(assert (=> bs!9239 m!277697))

(assert (=> bs!9239 m!277697))

(declare-fun m!277699 () Bool)

(assert (=> bs!9239 m!277699))

(assert (=> b!261136 d!62973))

(declare-fun d!62975 () Bool)

(assert (=> d!62975 (= (apply!259 (+!700 lt!131856 (tuple2!4861 lt!131868 (zeroValue!4648 thiss!1504))) lt!131853) (apply!259 lt!131856 lt!131853))))

(declare-fun lt!132057 () Unit!8084)

(assert (=> d!62975 (= lt!132057 (choose!1285 lt!131856 lt!131868 (zeroValue!4648 thiss!1504) lt!131853))))

(declare-fun e!169435 () Bool)

(assert (=> d!62975 e!169435))

(declare-fun res!127776 () Bool)

(assert (=> d!62975 (=> (not res!127776) (not e!169435))))

(assert (=> d!62975 (= res!127776 (contains!1870 lt!131856 lt!131853))))

(assert (=> d!62975 (= (addApplyDifferent!235 lt!131856 lt!131868 (zeroValue!4648 thiss!1504) lt!131853) lt!132057)))

(declare-fun b!261491 () Bool)

(assert (=> b!261491 (= e!169435 (not (= lt!131853 lt!131868)))))

(assert (= (and d!62975 res!127776) b!261491))

(declare-fun m!277701 () Bool)

(assert (=> d!62975 m!277701))

(assert (=> d!62975 m!277185))

(assert (=> d!62975 m!277201))

(assert (=> d!62975 m!277185))

(declare-fun m!277703 () Bool)

(assert (=> d!62975 m!277703))

(assert (=> d!62975 m!277213))

(assert (=> b!261136 d!62975))

(declare-fun d!62977 () Bool)

(declare-fun e!169436 () Bool)

(assert (=> d!62977 e!169436))

(declare-fun res!127777 () Bool)

(assert (=> d!62977 (=> (not res!127777) (not e!169436))))

(declare-fun lt!132061 () ListLongMap!3775)

(assert (=> d!62977 (= res!127777 (contains!1870 lt!132061 (_1!2441 (tuple2!4861 lt!131863 (zeroValue!4648 thiss!1504)))))))

(declare-fun lt!132060 () List!3738)

(assert (=> d!62977 (= lt!132061 (ListLongMap!3776 lt!132060))))

(declare-fun lt!132059 () Unit!8084)

(declare-fun lt!132058 () Unit!8084)

(assert (=> d!62977 (= lt!132059 lt!132058)))

(assert (=> d!62977 (= (getValueByKey!318 lt!132060 (_1!2441 (tuple2!4861 lt!131863 (zeroValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 lt!131863 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62977 (= lt!132058 (lemmaContainsTupThenGetReturnValue!174 lt!132060 (_1!2441 (tuple2!4861 lt!131863 (zeroValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 lt!131863 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62977 (= lt!132060 (insertStrictlySorted!177 (toList!1903 lt!131854) (_1!2441 (tuple2!4861 lt!131863 (zeroValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 lt!131863 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62977 (= (+!700 lt!131854 (tuple2!4861 lt!131863 (zeroValue!4648 thiss!1504))) lt!132061)))

(declare-fun b!261492 () Bool)

(declare-fun res!127778 () Bool)

(assert (=> b!261492 (=> (not res!127778) (not e!169436))))

(assert (=> b!261492 (= res!127778 (= (getValueByKey!318 (toList!1903 lt!132061) (_1!2441 (tuple2!4861 lt!131863 (zeroValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 lt!131863 (zeroValue!4648 thiss!1504))))))))

(declare-fun b!261493 () Bool)

(assert (=> b!261493 (= e!169436 (contains!1872 (toList!1903 lt!132061) (tuple2!4861 lt!131863 (zeroValue!4648 thiss!1504))))))

(assert (= (and d!62977 res!127777) b!261492))

(assert (= (and b!261492 res!127778) b!261493))

(declare-fun m!277705 () Bool)

(assert (=> d!62977 m!277705))

(declare-fun m!277707 () Bool)

(assert (=> d!62977 m!277707))

(declare-fun m!277709 () Bool)

(assert (=> d!62977 m!277709))

(declare-fun m!277711 () Bool)

(assert (=> d!62977 m!277711))

(declare-fun m!277713 () Bool)

(assert (=> b!261492 m!277713))

(declare-fun m!277715 () Bool)

(assert (=> b!261493 m!277715))

(assert (=> b!261136 d!62977))

(declare-fun d!62979 () Bool)

(assert (=> d!62979 (contains!1870 (+!700 lt!131854 (tuple2!4861 lt!131863 (zeroValue!4648 thiss!1504))) lt!131859)))

(declare-fun lt!132062 () Unit!8084)

(assert (=> d!62979 (= lt!132062 (choose!1284 lt!131854 lt!131863 (zeroValue!4648 thiss!1504) lt!131859))))

(assert (=> d!62979 (contains!1870 lt!131854 lt!131859)))

(assert (=> d!62979 (= (addStillContains!235 lt!131854 lt!131863 (zeroValue!4648 thiss!1504) lt!131859) lt!132062)))

(declare-fun bs!9240 () Bool)

(assert (= bs!9240 d!62979))

(assert (=> bs!9240 m!277207))

(assert (=> bs!9240 m!277207))

(assert (=> bs!9240 m!277211))

(declare-fun m!277717 () Bool)

(assert (=> bs!9240 m!277717))

(declare-fun m!277719 () Bool)

(assert (=> bs!9240 m!277719))

(assert (=> b!261136 d!62979))

(declare-fun d!62981 () Bool)

(assert (=> d!62981 (= (apply!259 (+!700 lt!131866 (tuple2!4861 lt!131869 (minValue!4648 thiss!1504))) lt!131861) (get!3084 (getValueByKey!318 (toList!1903 (+!700 lt!131866 (tuple2!4861 lt!131869 (minValue!4648 thiss!1504)))) lt!131861)))))

(declare-fun bs!9241 () Bool)

(assert (= bs!9241 d!62981))

(declare-fun m!277721 () Bool)

(assert (=> bs!9241 m!277721))

(assert (=> bs!9241 m!277721))

(declare-fun m!277723 () Bool)

(assert (=> bs!9241 m!277723))

(assert (=> b!261136 d!62981))

(declare-fun b!261494 () Bool)

(declare-fun e!169438 () ListLongMap!3775)

(assert (=> b!261494 (= e!169438 (ListLongMap!3776 Nil!3735))))

(declare-fun b!261496 () Bool)

(declare-fun e!169440 () ListLongMap!3775)

(declare-fun call!24953 () ListLongMap!3775)

(assert (=> b!261496 (= e!169440 call!24953)))

(declare-fun b!261497 () Bool)

(declare-fun res!127781 () Bool)

(declare-fun e!169437 () Bool)

(assert (=> b!261497 (=> (not res!127781) (not e!169437))))

(declare-fun lt!132065 () ListLongMap!3775)

(assert (=> b!261497 (= res!127781 (not (contains!1870 lt!132065 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!261498 () Bool)

(assert (=> b!261498 (= e!169438 e!169440)))

(declare-fun c!44521 () Bool)

(assert (=> b!261498 (= c!44521 (validKeyInArray!0 (select (arr!5966 lt!131647) #b00000000000000000000000000000000)))))

(declare-fun b!261499 () Bool)

(declare-fun e!169441 () Bool)

(declare-fun e!169443 () Bool)

(assert (=> b!261499 (= e!169441 e!169443)))

(declare-fun c!44518 () Bool)

(assert (=> b!261499 (= c!44518 (bvslt #b00000000000000000000000000000000 (size!6316 lt!131647)))))

(declare-fun b!261500 () Bool)

(assert (=> b!261500 (= e!169443 (isEmpty!544 lt!132065))))

(declare-fun b!261501 () Bool)

(assert (=> b!261501 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6316 lt!131647)))))

(assert (=> b!261501 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6315 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))))))))

(declare-fun e!169439 () Bool)

(assert (=> b!261501 (= e!169439 (= (apply!259 lt!132065 (select (arr!5966 lt!131647) #b00000000000000000000000000000000)) (get!3083 (select (arr!5965 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!261502 () Bool)

(declare-fun e!169442 () Bool)

(assert (=> b!261502 (= e!169442 (validKeyInArray!0 (select (arr!5966 lt!131647) #b00000000000000000000000000000000)))))

(assert (=> b!261502 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!261503 () Bool)

(assert (=> b!261503 (= e!169437 e!169441)))

(declare-fun c!44520 () Bool)

(assert (=> b!261503 (= c!44520 e!169442)))

(declare-fun res!127780 () Bool)

(assert (=> b!261503 (=> (not res!127780) (not e!169442))))

(assert (=> b!261503 (= res!127780 (bvslt #b00000000000000000000000000000000 (size!6316 lt!131647)))))

(declare-fun b!261504 () Bool)

(declare-fun lt!132067 () Unit!8084)

(declare-fun lt!132066 () Unit!8084)

(assert (=> b!261504 (= lt!132067 lt!132066)))

(declare-fun lt!132068 () (_ BitVec 64))

(declare-fun lt!132069 () (_ BitVec 64))

(declare-fun lt!132063 () ListLongMap!3775)

(declare-fun lt!132064 () V!8481)

(assert (=> b!261504 (not (contains!1870 (+!700 lt!132063 (tuple2!4861 lt!132069 lt!132064)) lt!132068))))

(assert (=> b!261504 (= lt!132066 (addStillNotContains!130 lt!132063 lt!132069 lt!132064 lt!132068))))

(assert (=> b!261504 (= lt!132068 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!261504 (= lt!132064 (get!3083 (select (arr!5965 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261504 (= lt!132069 (select (arr!5966 lt!131647) #b00000000000000000000000000000000))))

(assert (=> b!261504 (= lt!132063 call!24953)))

(assert (=> b!261504 (= e!169440 (+!700 call!24953 (tuple2!4861 (select (arr!5966 lt!131647) #b00000000000000000000000000000000) (get!3083 (select (arr!5965 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4807 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!62983 () Bool)

(assert (=> d!62983 e!169437))

(declare-fun res!127782 () Bool)

(assert (=> d!62983 (=> (not res!127782) (not e!169437))))

(assert (=> d!62983 (= res!127782 (not (contains!1870 lt!132065 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62983 (= lt!132065 e!169438)))

(declare-fun c!44519 () Bool)

(assert (=> d!62983 (= c!44519 (bvsge #b00000000000000000000000000000000 (size!6316 lt!131647)))))

(assert (=> d!62983 (validMask!0 (mask!11144 thiss!1504))))

(assert (=> d!62983 (= (getCurrentListMapNoExtraKeys!575 lt!131647 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4807 thiss!1504)) lt!132065)))

(declare-fun b!261495 () Bool)

(assert (=> b!261495 (= e!169443 (= lt!132065 (getCurrentListMapNoExtraKeys!575 lt!131647 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4807 thiss!1504))))))

(declare-fun b!261505 () Bool)

(assert (=> b!261505 (= e!169441 e!169439)))

(assert (=> b!261505 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6316 lt!131647)))))

(declare-fun res!127779 () Bool)

(assert (=> b!261505 (= res!127779 (contains!1870 lt!132065 (select (arr!5966 lt!131647) #b00000000000000000000000000000000)))))

(assert (=> b!261505 (=> (not res!127779) (not e!169439))))

(declare-fun bm!24950 () Bool)

(assert (=> bm!24950 (= call!24953 (getCurrentListMapNoExtraKeys!575 lt!131647 (array!12604 (store (arr!5965 (_values!4790 thiss!1504)) index!297 (ValueCellFull!2969 v!346)) (size!6315 (_values!4790 thiss!1504))) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4807 thiss!1504)))))

(assert (= (and d!62983 c!44519) b!261494))

(assert (= (and d!62983 (not c!44519)) b!261498))

(assert (= (and b!261498 c!44521) b!261504))

(assert (= (and b!261498 (not c!44521)) b!261496))

(assert (= (or b!261504 b!261496) bm!24950))

(assert (= (and d!62983 res!127782) b!261497))

(assert (= (and b!261497 res!127781) b!261503))

(assert (= (and b!261503 res!127780) b!261502))

(assert (= (and b!261503 c!44520) b!261505))

(assert (= (and b!261503 (not c!44520)) b!261499))

(assert (= (and b!261505 res!127779) b!261501))

(assert (= (and b!261499 c!44518) b!261495))

(assert (= (and b!261499 (not c!44518)) b!261500))

(declare-fun b_lambda!8323 () Bool)

(assert (=> (not b_lambda!8323) (not b!261501)))

(assert (=> b!261501 t!8806))

(declare-fun b_and!13913 () Bool)

(assert (= b_and!13911 (and (=> t!8806 result!5407) b_and!13913)))

(declare-fun b_lambda!8325 () Bool)

(assert (=> (not b_lambda!8325) (not b!261504)))

(assert (=> b!261504 t!8806))

(declare-fun b_and!13915 () Bool)

(assert (= b_and!13913 (and (=> t!8806 result!5407) b_and!13915)))

(declare-fun m!277725 () Bool)

(assert (=> b!261504 m!277725))

(declare-fun m!277727 () Bool)

(assert (=> b!261504 m!277727))

(assert (=> b!261504 m!277225))

(assert (=> b!261504 m!277129))

(assert (=> b!261504 m!277177))

(declare-fun m!277729 () Bool)

(assert (=> b!261504 m!277729))

(assert (=> b!261504 m!277725))

(assert (=> b!261504 m!277225))

(assert (=> b!261504 m!277129))

(assert (=> b!261504 m!277227))

(declare-fun m!277731 () Bool)

(assert (=> b!261504 m!277731))

(assert (=> b!261501 m!277177))

(declare-fun m!277733 () Bool)

(assert (=> b!261501 m!277733))

(assert (=> b!261501 m!277225))

(assert (=> b!261501 m!277129))

(assert (=> b!261501 m!277177))

(assert (=> b!261501 m!277225))

(assert (=> b!261501 m!277129))

(assert (=> b!261501 m!277227))

(assert (=> b!261502 m!277177))

(assert (=> b!261502 m!277177))

(assert (=> b!261502 m!277181))

(assert (=> b!261505 m!277177))

(assert (=> b!261505 m!277177))

(declare-fun m!277735 () Bool)

(assert (=> b!261505 m!277735))

(assert (=> b!261498 m!277177))

(assert (=> b!261498 m!277177))

(assert (=> b!261498 m!277181))

(declare-fun m!277737 () Bool)

(assert (=> bm!24950 m!277737))

(declare-fun m!277739 () Bool)

(assert (=> b!261497 m!277739))

(assert (=> b!261495 m!277737))

(declare-fun m!277741 () Bool)

(assert (=> b!261500 m!277741))

(declare-fun m!277743 () Bool)

(assert (=> d!62983 m!277743))

(assert (=> d!62983 m!276865))

(assert (=> b!261136 d!62983))

(declare-fun d!62985 () Bool)

(declare-fun e!169444 () Bool)

(assert (=> d!62985 e!169444))

(declare-fun res!127783 () Bool)

(assert (=> d!62985 (=> (not res!127783) (not e!169444))))

(declare-fun lt!132073 () ListLongMap!3775)

(assert (=> d!62985 (= res!127783 (contains!1870 lt!132073 (_1!2441 (tuple2!4861 lt!131864 (minValue!4648 thiss!1504)))))))

(declare-fun lt!132072 () List!3738)

(assert (=> d!62985 (= lt!132073 (ListLongMap!3776 lt!132072))))

(declare-fun lt!132071 () Unit!8084)

(declare-fun lt!132070 () Unit!8084)

(assert (=> d!62985 (= lt!132071 lt!132070)))

(assert (=> d!62985 (= (getValueByKey!318 lt!132072 (_1!2441 (tuple2!4861 lt!131864 (minValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 lt!131864 (minValue!4648 thiss!1504)))))))

(assert (=> d!62985 (= lt!132070 (lemmaContainsTupThenGetReturnValue!174 lt!132072 (_1!2441 (tuple2!4861 lt!131864 (minValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 lt!131864 (minValue!4648 thiss!1504)))))))

(assert (=> d!62985 (= lt!132072 (insertStrictlySorted!177 (toList!1903 lt!131873) (_1!2441 (tuple2!4861 lt!131864 (minValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 lt!131864 (minValue!4648 thiss!1504)))))))

(assert (=> d!62985 (= (+!700 lt!131873 (tuple2!4861 lt!131864 (minValue!4648 thiss!1504))) lt!132073)))

(declare-fun b!261506 () Bool)

(declare-fun res!127784 () Bool)

(assert (=> b!261506 (=> (not res!127784) (not e!169444))))

(assert (=> b!261506 (= res!127784 (= (getValueByKey!318 (toList!1903 lt!132073) (_1!2441 (tuple2!4861 lt!131864 (minValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 lt!131864 (minValue!4648 thiss!1504))))))))

(declare-fun b!261507 () Bool)

(assert (=> b!261507 (= e!169444 (contains!1872 (toList!1903 lt!132073) (tuple2!4861 lt!131864 (minValue!4648 thiss!1504))))))

(assert (= (and d!62985 res!127783) b!261506))

(assert (= (and b!261506 res!127784) b!261507))

(declare-fun m!277745 () Bool)

(assert (=> d!62985 m!277745))

(declare-fun m!277747 () Bool)

(assert (=> d!62985 m!277747))

(declare-fun m!277749 () Bool)

(assert (=> d!62985 m!277749))

(declare-fun m!277751 () Bool)

(assert (=> d!62985 m!277751))

(declare-fun m!277753 () Bool)

(assert (=> b!261506 m!277753))

(declare-fun m!277755 () Bool)

(assert (=> b!261507 m!277755))

(assert (=> b!261136 d!62985))

(declare-fun d!62987 () Bool)

(assert (=> d!62987 (= (apply!259 (+!700 lt!131873 (tuple2!4861 lt!131864 (minValue!4648 thiss!1504))) lt!131871) (get!3084 (getValueByKey!318 (toList!1903 (+!700 lt!131873 (tuple2!4861 lt!131864 (minValue!4648 thiss!1504)))) lt!131871)))))

(declare-fun bs!9242 () Bool)

(assert (= bs!9242 d!62987))

(declare-fun m!277757 () Bool)

(assert (=> bs!9242 m!277757))

(assert (=> bs!9242 m!277757))

(declare-fun m!277759 () Bool)

(assert (=> bs!9242 m!277759))

(assert (=> b!261136 d!62987))

(declare-fun d!62989 () Bool)

(assert (=> d!62989 (= (apply!259 (+!700 lt!131866 (tuple2!4861 lt!131869 (minValue!4648 thiss!1504))) lt!131861) (apply!259 lt!131866 lt!131861))))

(declare-fun lt!132074 () Unit!8084)

(assert (=> d!62989 (= lt!132074 (choose!1285 lt!131866 lt!131869 (minValue!4648 thiss!1504) lt!131861))))

(declare-fun e!169445 () Bool)

(assert (=> d!62989 e!169445))

(declare-fun res!127785 () Bool)

(assert (=> d!62989 (=> (not res!127785) (not e!169445))))

(assert (=> d!62989 (= res!127785 (contains!1870 lt!131866 lt!131861))))

(assert (=> d!62989 (= (addApplyDifferent!235 lt!131866 lt!131869 (minValue!4648 thiss!1504) lt!131861) lt!132074)))

(declare-fun b!261508 () Bool)

(assert (=> b!261508 (= e!169445 (not (= lt!131861 lt!131869)))))

(assert (= (and d!62989 res!127785) b!261508))

(declare-fun m!277761 () Bool)

(assert (=> d!62989 m!277761))

(assert (=> d!62989 m!277203))

(assert (=> d!62989 m!277205))

(assert (=> d!62989 m!277203))

(declare-fun m!277763 () Bool)

(assert (=> d!62989 m!277763))

(assert (=> d!62989 m!277191))

(assert (=> b!261136 d!62989))

(declare-fun d!62991 () Bool)

(declare-fun e!169446 () Bool)

(assert (=> d!62991 e!169446))

(declare-fun res!127786 () Bool)

(assert (=> d!62991 (=> (not res!127786) (not e!169446))))

(declare-fun lt!132078 () ListLongMap!3775)

(assert (=> d!62991 (= res!127786 (contains!1870 lt!132078 (_1!2441 (tuple2!4861 lt!131868 (zeroValue!4648 thiss!1504)))))))

(declare-fun lt!132077 () List!3738)

(assert (=> d!62991 (= lt!132078 (ListLongMap!3776 lt!132077))))

(declare-fun lt!132076 () Unit!8084)

(declare-fun lt!132075 () Unit!8084)

(assert (=> d!62991 (= lt!132076 lt!132075)))

(assert (=> d!62991 (= (getValueByKey!318 lt!132077 (_1!2441 (tuple2!4861 lt!131868 (zeroValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 lt!131868 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62991 (= lt!132075 (lemmaContainsTupThenGetReturnValue!174 lt!132077 (_1!2441 (tuple2!4861 lt!131868 (zeroValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 lt!131868 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62991 (= lt!132077 (insertStrictlySorted!177 (toList!1903 lt!131856) (_1!2441 (tuple2!4861 lt!131868 (zeroValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 lt!131868 (zeroValue!4648 thiss!1504)))))))

(assert (=> d!62991 (= (+!700 lt!131856 (tuple2!4861 lt!131868 (zeroValue!4648 thiss!1504))) lt!132078)))

(declare-fun b!261509 () Bool)

(declare-fun res!127787 () Bool)

(assert (=> b!261509 (=> (not res!127787) (not e!169446))))

(assert (=> b!261509 (= res!127787 (= (getValueByKey!318 (toList!1903 lt!132078) (_1!2441 (tuple2!4861 lt!131868 (zeroValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 lt!131868 (zeroValue!4648 thiss!1504))))))))

(declare-fun b!261510 () Bool)

(assert (=> b!261510 (= e!169446 (contains!1872 (toList!1903 lt!132078) (tuple2!4861 lt!131868 (zeroValue!4648 thiss!1504))))))

(assert (= (and d!62991 res!127786) b!261509))

(assert (= (and b!261509 res!127787) b!261510))

(declare-fun m!277765 () Bool)

(assert (=> d!62991 m!277765))

(declare-fun m!277767 () Bool)

(assert (=> d!62991 m!277767))

(declare-fun m!277769 () Bool)

(assert (=> d!62991 m!277769))

(declare-fun m!277771 () Bool)

(assert (=> d!62991 m!277771))

(declare-fun m!277773 () Bool)

(assert (=> b!261509 m!277773))

(declare-fun m!277775 () Bool)

(assert (=> b!261510 m!277775))

(assert (=> b!261136 d!62991))

(declare-fun d!62993 () Bool)

(assert (=> d!62993 (= (apply!259 lt!131866 lt!131861) (get!3084 (getValueByKey!318 (toList!1903 lt!131866) lt!131861)))))

(declare-fun bs!9243 () Bool)

(assert (= bs!9243 d!62993))

(declare-fun m!277777 () Bool)

(assert (=> bs!9243 m!277777))

(assert (=> bs!9243 m!277777))

(declare-fun m!277779 () Bool)

(assert (=> bs!9243 m!277779))

(assert (=> b!261136 d!62993))

(declare-fun d!62995 () Bool)

(assert (=> d!62995 (= (apply!259 (+!700 lt!131873 (tuple2!4861 lt!131864 (minValue!4648 thiss!1504))) lt!131871) (apply!259 lt!131873 lt!131871))))

(declare-fun lt!132079 () Unit!8084)

(assert (=> d!62995 (= lt!132079 (choose!1285 lt!131873 lt!131864 (minValue!4648 thiss!1504) lt!131871))))

(declare-fun e!169447 () Bool)

(assert (=> d!62995 e!169447))

(declare-fun res!127788 () Bool)

(assert (=> d!62995 (=> (not res!127788) (not e!169447))))

(assert (=> d!62995 (= res!127788 (contains!1870 lt!131873 lt!131871))))

(assert (=> d!62995 (= (addApplyDifferent!235 lt!131873 lt!131864 (minValue!4648 thiss!1504) lt!131871) lt!132079)))

(declare-fun b!261511 () Bool)

(assert (=> b!261511 (= e!169447 (not (= lt!131871 lt!131864)))))

(assert (= (and d!62995 res!127788) b!261511))

(declare-fun m!277781 () Bool)

(assert (=> d!62995 m!277781))

(assert (=> d!62995 m!277187))

(assert (=> d!62995 m!277189))

(assert (=> d!62995 m!277187))

(declare-fun m!277783 () Bool)

(assert (=> d!62995 m!277783))

(assert (=> d!62995 m!277199))

(assert (=> b!261136 d!62995))

(declare-fun d!62997 () Bool)

(declare-fun e!169448 () Bool)

(assert (=> d!62997 e!169448))

(declare-fun res!127789 () Bool)

(assert (=> d!62997 (=> res!127789 e!169448)))

(declare-fun lt!132081 () Bool)

(assert (=> d!62997 (= res!127789 (not lt!132081))))

(declare-fun lt!132080 () Bool)

(assert (=> d!62997 (= lt!132081 lt!132080)))

(declare-fun lt!132082 () Unit!8084)

(declare-fun e!169449 () Unit!8084)

(assert (=> d!62997 (= lt!132082 e!169449)))

(declare-fun c!44522 () Bool)

(assert (=> d!62997 (= c!44522 lt!132080)))

(assert (=> d!62997 (= lt!132080 (containsKey!309 (toList!1903 (+!700 lt!131854 (tuple2!4861 lt!131863 (zeroValue!4648 thiss!1504)))) lt!131859))))

(assert (=> d!62997 (= (contains!1870 (+!700 lt!131854 (tuple2!4861 lt!131863 (zeroValue!4648 thiss!1504))) lt!131859) lt!132081)))

(declare-fun b!261512 () Bool)

(declare-fun lt!132083 () Unit!8084)

(assert (=> b!261512 (= e!169449 lt!132083)))

(assert (=> b!261512 (= lt!132083 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1903 (+!700 lt!131854 (tuple2!4861 lt!131863 (zeroValue!4648 thiss!1504)))) lt!131859))))

(assert (=> b!261512 (isDefined!258 (getValueByKey!318 (toList!1903 (+!700 lt!131854 (tuple2!4861 lt!131863 (zeroValue!4648 thiss!1504)))) lt!131859))))

(declare-fun b!261513 () Bool)

(declare-fun Unit!8109 () Unit!8084)

(assert (=> b!261513 (= e!169449 Unit!8109)))

(declare-fun b!261514 () Bool)

(assert (=> b!261514 (= e!169448 (isDefined!258 (getValueByKey!318 (toList!1903 (+!700 lt!131854 (tuple2!4861 lt!131863 (zeroValue!4648 thiss!1504)))) lt!131859)))))

(assert (= (and d!62997 c!44522) b!261512))

(assert (= (and d!62997 (not c!44522)) b!261513))

(assert (= (and d!62997 (not res!127789)) b!261514))

(declare-fun m!277785 () Bool)

(assert (=> d!62997 m!277785))

(declare-fun m!277787 () Bool)

(assert (=> b!261512 m!277787))

(declare-fun m!277789 () Bool)

(assert (=> b!261512 m!277789))

(assert (=> b!261512 m!277789))

(declare-fun m!277791 () Bool)

(assert (=> b!261512 m!277791))

(assert (=> b!261514 m!277789))

(assert (=> b!261514 m!277789))

(assert (=> b!261514 m!277791))

(assert (=> b!261136 d!62997))

(declare-fun d!62999 () Bool)

(declare-fun e!169450 () Bool)

(assert (=> d!62999 e!169450))

(declare-fun res!127790 () Bool)

(assert (=> d!62999 (=> (not res!127790) (not e!169450))))

(declare-fun lt!132087 () ListLongMap!3775)

(assert (=> d!62999 (= res!127790 (contains!1870 lt!132087 (_1!2441 (tuple2!4861 lt!131869 (minValue!4648 thiss!1504)))))))

(declare-fun lt!132086 () List!3738)

(assert (=> d!62999 (= lt!132087 (ListLongMap!3776 lt!132086))))

(declare-fun lt!132085 () Unit!8084)

(declare-fun lt!132084 () Unit!8084)

(assert (=> d!62999 (= lt!132085 lt!132084)))

(assert (=> d!62999 (= (getValueByKey!318 lt!132086 (_1!2441 (tuple2!4861 lt!131869 (minValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 lt!131869 (minValue!4648 thiss!1504)))))))

(assert (=> d!62999 (= lt!132084 (lemmaContainsTupThenGetReturnValue!174 lt!132086 (_1!2441 (tuple2!4861 lt!131869 (minValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 lt!131869 (minValue!4648 thiss!1504)))))))

(assert (=> d!62999 (= lt!132086 (insertStrictlySorted!177 (toList!1903 lt!131866) (_1!2441 (tuple2!4861 lt!131869 (minValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 lt!131869 (minValue!4648 thiss!1504)))))))

(assert (=> d!62999 (= (+!700 lt!131866 (tuple2!4861 lt!131869 (minValue!4648 thiss!1504))) lt!132087)))

(declare-fun b!261515 () Bool)

(declare-fun res!127791 () Bool)

(assert (=> b!261515 (=> (not res!127791) (not e!169450))))

(assert (=> b!261515 (= res!127791 (= (getValueByKey!318 (toList!1903 lt!132087) (_1!2441 (tuple2!4861 lt!131869 (minValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 lt!131869 (minValue!4648 thiss!1504))))))))

(declare-fun b!261516 () Bool)

(assert (=> b!261516 (= e!169450 (contains!1872 (toList!1903 lt!132087) (tuple2!4861 lt!131869 (minValue!4648 thiss!1504))))))

(assert (= (and d!62999 res!127790) b!261515))

(assert (= (and b!261515 res!127791) b!261516))

(declare-fun m!277793 () Bool)

(assert (=> d!62999 m!277793))

(declare-fun m!277795 () Bool)

(assert (=> d!62999 m!277795))

(declare-fun m!277797 () Bool)

(assert (=> d!62999 m!277797))

(declare-fun m!277799 () Bool)

(assert (=> d!62999 m!277799))

(declare-fun m!277801 () Bool)

(assert (=> b!261515 m!277801))

(declare-fun m!277803 () Bool)

(assert (=> b!261516 m!277803))

(assert (=> b!261136 d!62999))

(declare-fun d!63001 () Bool)

(assert (=> d!63001 (= (apply!259 lt!131856 lt!131853) (get!3084 (getValueByKey!318 (toList!1903 lt!131856) lt!131853)))))

(declare-fun bs!9244 () Bool)

(assert (= bs!9244 d!63001))

(declare-fun m!277805 () Bool)

(assert (=> bs!9244 m!277805))

(assert (=> bs!9244 m!277805))

(declare-fun m!277807 () Bool)

(assert (=> bs!9244 m!277807))

(assert (=> b!261136 d!63001))

(declare-fun d!63003 () Bool)

(assert (=> d!63003 (= (arrayCountValidKeys!0 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6991 thiss!1504) #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!63003 true))

(declare-fun _$84!45 () Unit!8084)

(assert (=> d!63003 (= (choose!1 (_keys!6991 thiss!1504) index!297 key!932) _$84!45)))

(declare-fun bs!9245 () Bool)

(assert (= bs!9245 d!63003))

(assert (=> bs!9245 m!276885))

(assert (=> bs!9245 m!277173))

(assert (=> bs!9245 m!276897))

(assert (=> d!62801 d!63003))

(declare-fun b!261517 () Bool)

(declare-fun e!169452 () (_ BitVec 32))

(declare-fun call!24954 () (_ BitVec 32))

(assert (=> b!261517 (= e!169452 (bvadd #b00000000000000000000000000000001 call!24954))))

(declare-fun bm!24951 () Bool)

(assert (=> bm!24951 (= call!24954 (arrayCountValidKeys!0 lt!131647 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!261518 () Bool)

(declare-fun e!169451 () (_ BitVec 32))

(assert (=> b!261518 (= e!169451 e!169452)))

(declare-fun c!44524 () Bool)

(assert (=> b!261518 (= c!44524 (validKeyInArray!0 (select (arr!5966 lt!131647) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun b!261519 () Bool)

(assert (=> b!261519 (= e!169452 call!24954)))

(declare-fun d!63005 () Bool)

(declare-fun lt!132088 () (_ BitVec 32))

(assert (=> d!63005 (and (bvsge lt!132088 #b00000000000000000000000000000000) (bvsle lt!132088 (bvsub (size!6316 lt!131647) (bvadd index!297 #b00000000000000000000000000000001))))))

(assert (=> d!63005 (= lt!132088 e!169451)))

(declare-fun c!44523 () Bool)

(assert (=> d!63005 (= c!44523 (bvsge (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!63005 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) (bvsge (bvadd index!297 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6316 lt!131647)))))

(assert (=> d!63005 (= (arrayCountValidKeys!0 lt!131647 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) lt!132088)))

(declare-fun b!261520 () Bool)

(assert (=> b!261520 (= e!169451 #b00000000000000000000000000000000)))

(assert (= (and d!63005 c!44523) b!261520))

(assert (= (and d!63005 (not c!44523)) b!261518))

(assert (= (and b!261518 c!44524) b!261517))

(assert (= (and b!261518 (not c!44524)) b!261519))

(assert (= (or b!261517 b!261519) bm!24951))

(declare-fun m!277809 () Bool)

(assert (=> bm!24951 m!277809))

(declare-fun m!277811 () Bool)

(assert (=> b!261518 m!277811))

(assert (=> b!261518 m!277811))

(declare-fun m!277813 () Bool)

(assert (=> b!261518 m!277813))

(assert (=> bm!24912 d!63005))

(declare-fun d!63007 () Bool)

(declare-fun res!127796 () Bool)

(declare-fun e!169457 () Bool)

(assert (=> d!63007 (=> res!127796 e!169457)))

(assert (=> d!63007 (= res!127796 (and ((_ is Cons!3734) (toList!1903 lt!131643)) (= (_1!2441 (h!4399 (toList!1903 lt!131643))) key!932)))))

(assert (=> d!63007 (= (containsKey!309 (toList!1903 lt!131643) key!932) e!169457)))

(declare-fun b!261525 () Bool)

(declare-fun e!169458 () Bool)

(assert (=> b!261525 (= e!169457 e!169458)))

(declare-fun res!127797 () Bool)

(assert (=> b!261525 (=> (not res!127797) (not e!169458))))

(assert (=> b!261525 (= res!127797 (and (or (not ((_ is Cons!3734) (toList!1903 lt!131643))) (bvsle (_1!2441 (h!4399 (toList!1903 lt!131643))) key!932)) ((_ is Cons!3734) (toList!1903 lt!131643)) (bvslt (_1!2441 (h!4399 (toList!1903 lt!131643))) key!932)))))

(declare-fun b!261526 () Bool)

(assert (=> b!261526 (= e!169458 (containsKey!309 (t!8801 (toList!1903 lt!131643)) key!932))))

(assert (= (and d!63007 (not res!127796)) b!261525))

(assert (= (and b!261525 res!127797) b!261526))

(declare-fun m!277815 () Bool)

(assert (=> b!261526 m!277815))

(assert (=> d!62785 d!63007))

(declare-fun b!261539 () Bool)

(declare-fun e!169467 () SeekEntryResult!1151)

(declare-fun e!169466 () SeekEntryResult!1151)

(assert (=> b!261539 (= e!169467 e!169466)))

(declare-fun c!44533 () Bool)

(declare-fun lt!132093 () (_ BitVec 64))

(assert (=> b!261539 (= c!44533 (= lt!132093 key!932))))

(declare-fun lt!132094 () SeekEntryResult!1151)

(declare-fun d!63009 () Bool)

(assert (=> d!63009 (and (or ((_ is Undefined!1151) lt!132094) (not ((_ is Found!1151) lt!132094)) (and (bvsge (index!6775 lt!132094) #b00000000000000000000000000000000) (bvslt (index!6775 lt!132094) (size!6316 (_keys!6991 thiss!1504))))) (or ((_ is Undefined!1151) lt!132094) ((_ is Found!1151) lt!132094) (not ((_ is MissingVacant!1151) lt!132094)) (not (= (index!6777 lt!132094) (index!6776 lt!131748))) (and (bvsge (index!6777 lt!132094) #b00000000000000000000000000000000) (bvslt (index!6777 lt!132094) (size!6316 (_keys!6991 thiss!1504))))) (or ((_ is Undefined!1151) lt!132094) (ite ((_ is Found!1151) lt!132094) (= (select (arr!5966 (_keys!6991 thiss!1504)) (index!6775 lt!132094)) key!932) (and ((_ is MissingVacant!1151) lt!132094) (= (index!6777 lt!132094) (index!6776 lt!131748)) (= (select (arr!5966 (_keys!6991 thiss!1504)) (index!6777 lt!132094)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!63009 (= lt!132094 e!169467)))

(declare-fun c!44531 () Bool)

(assert (=> d!63009 (= c!44531 (bvsge (x!25115 lt!131748) #b01111111111111111111111111111110))))

(assert (=> d!63009 (= lt!132093 (select (arr!5966 (_keys!6991 thiss!1504)) (index!6776 lt!131748)))))

(assert (=> d!63009 (validMask!0 (mask!11144 thiss!1504))))

(assert (=> d!63009 (= (seekKeyOrZeroReturnVacant!0 (x!25115 lt!131748) (index!6776 lt!131748) (index!6776 lt!131748) key!932 (_keys!6991 thiss!1504) (mask!11144 thiss!1504)) lt!132094)))

(declare-fun b!261540 () Bool)

(assert (=> b!261540 (= e!169467 Undefined!1151)))

(declare-fun b!261541 () Bool)

(declare-fun e!169465 () SeekEntryResult!1151)

(assert (=> b!261541 (= e!169465 (MissingVacant!1151 (index!6776 lt!131748)))))

(declare-fun b!261542 () Bool)

(declare-fun c!44532 () Bool)

(assert (=> b!261542 (= c!44532 (= lt!132093 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261542 (= e!169466 e!169465)))

(declare-fun b!261543 () Bool)

(assert (=> b!261543 (= e!169466 (Found!1151 (index!6776 lt!131748)))))

(declare-fun b!261544 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!261544 (= e!169465 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25115 lt!131748) #b00000000000000000000000000000001) (nextIndex!0 (index!6776 lt!131748) (bvadd (x!25115 lt!131748) #b00000000000000000000000000000001) (mask!11144 thiss!1504)) (index!6776 lt!131748) key!932 (_keys!6991 thiss!1504) (mask!11144 thiss!1504)))))

(assert (= (and d!63009 c!44531) b!261540))

(assert (= (and d!63009 (not c!44531)) b!261539))

(assert (= (and b!261539 c!44533) b!261543))

(assert (= (and b!261539 (not c!44533)) b!261542))

(assert (= (and b!261542 c!44532) b!261541))

(assert (= (and b!261542 (not c!44532)) b!261544))

(declare-fun m!277817 () Bool)

(assert (=> d!63009 m!277817))

(declare-fun m!277819 () Bool)

(assert (=> d!63009 m!277819))

(assert (=> d!63009 m!277063))

(assert (=> d!63009 m!276865))

(declare-fun m!277821 () Bool)

(assert (=> b!261544 m!277821))

(assert (=> b!261544 m!277821))

(declare-fun m!277823 () Bool)

(assert (=> b!261544 m!277823))

(assert (=> b!261013 d!63009))

(declare-fun d!63011 () Bool)

(assert (=> d!63011 (= (apply!259 lt!131806 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3084 (getValueByKey!318 (toList!1903 lt!131806) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9246 () Bool)

(assert (= bs!9246 d!63011))

(assert (=> bs!9246 m!277643))

(assert (=> bs!9246 m!277643))

(declare-fun m!277825 () Bool)

(assert (=> bs!9246 m!277825))

(assert (=> b!261080 d!63011))

(declare-fun d!63013 () Bool)

(assert (=> d!63013 (= (inRange!0 (index!6775 lt!131835) (mask!11144 thiss!1504)) (and (bvsge (index!6775 lt!131835) #b00000000000000000000000000000000) (bvslt (index!6775 lt!131835) (bvadd (mask!11144 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!261097 d!63013))

(declare-fun b!261545 () Bool)

(declare-fun e!169469 () (_ BitVec 32))

(declare-fun call!24955 () (_ BitVec 32))

(assert (=> b!261545 (= e!169469 (bvadd #b00000000000000000000000000000001 call!24955))))

(declare-fun bm!24952 () Bool)

(assert (=> bm!24952 (= call!24955 (arrayCountValidKeys!0 (_keys!6991 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6316 (_keys!6991 thiss!1504))))))

(declare-fun b!261546 () Bool)

(declare-fun e!169468 () (_ BitVec 32))

(assert (=> b!261546 (= e!169468 e!169469)))

(declare-fun c!44535 () Bool)

(assert (=> b!261546 (= c!44535 (validKeyInArray!0 (select (arr!5966 (_keys!6991 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!261547 () Bool)

(assert (=> b!261547 (= e!169469 call!24955)))

(declare-fun d!63015 () Bool)

(declare-fun lt!132095 () (_ BitVec 32))

(assert (=> d!63015 (and (bvsge lt!132095 #b00000000000000000000000000000000) (bvsle lt!132095 (bvsub (size!6316 (_keys!6991 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!63015 (= lt!132095 e!169468)))

(declare-fun c!44534 () Bool)

(assert (=> d!63015 (= c!44534 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6316 (_keys!6991 thiss!1504))))))

(assert (=> d!63015 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6316 (_keys!6991 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6316 (_keys!6991 thiss!1504)) (size!6316 (_keys!6991 thiss!1504))))))

(assert (=> d!63015 (= (arrayCountValidKeys!0 (_keys!6991 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6316 (_keys!6991 thiss!1504))) lt!132095)))

(declare-fun b!261548 () Bool)

(assert (=> b!261548 (= e!169468 #b00000000000000000000000000000000)))

(assert (= (and d!63015 c!44534) b!261548))

(assert (= (and d!63015 (not c!44534)) b!261546))

(assert (= (and b!261546 c!44535) b!261545))

(assert (= (and b!261546 (not c!44535)) b!261547))

(assert (= (or b!261545 b!261547) bm!24952))

(declare-fun m!277827 () Bool)

(assert (=> bm!24952 m!277827))

(assert (=> b!261546 m!277689))

(assert (=> b!261546 m!277689))

(declare-fun m!277829 () Bool)

(assert (=> b!261546 m!277829))

(assert (=> bm!24913 d!63015))

(assert (=> bm!24904 d!62983))

(declare-fun b!261549 () Bool)

(declare-fun e!169471 () (_ BitVec 32))

(declare-fun call!24956 () (_ BitVec 32))

(assert (=> b!261549 (= e!169471 (bvadd #b00000000000000000000000000000001 call!24956))))

(declare-fun bm!24953 () Bool)

(assert (=> bm!24953 (= call!24956 (arrayCountValidKeys!0 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6316 (_keys!6991 thiss!1504))))))

(declare-fun b!261550 () Bool)

(declare-fun e!169470 () (_ BitVec 32))

(assert (=> b!261550 (= e!169470 e!169471)))

(declare-fun c!44537 () Bool)

(assert (=> b!261550 (= c!44537 (validKeyInArray!0 (select (arr!5966 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!261551 () Bool)

(assert (=> b!261551 (= e!169471 call!24956)))

(declare-fun d!63017 () Bool)

(declare-fun lt!132096 () (_ BitVec 32))

(assert (=> d!63017 (and (bvsge lt!132096 #b00000000000000000000000000000000) (bvsle lt!132096 (bvsub (size!6316 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!63017 (= lt!132096 e!169470)))

(declare-fun c!44536 () Bool)

(assert (=> d!63017 (= c!44536 (bvsge #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))))))

(assert (=> d!63017 (and (bvsle #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6316 (_keys!6991 thiss!1504)) (size!6316 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))))))))

(assert (=> d!63017 (= (arrayCountValidKeys!0 (array!12606 (store (arr!5966 (_keys!6991 thiss!1504)) index!297 key!932) (size!6316 (_keys!6991 thiss!1504))) #b00000000000000000000000000000000 (size!6316 (_keys!6991 thiss!1504))) lt!132096)))

(declare-fun b!261552 () Bool)

(assert (=> b!261552 (= e!169470 #b00000000000000000000000000000000)))

(assert (= (and d!63017 c!44536) b!261552))

(assert (= (and d!63017 (not c!44536)) b!261550))

(assert (= (and b!261550 c!44537) b!261549))

(assert (= (and b!261550 (not c!44537)) b!261551))

(assert (= (or b!261549 b!261551) bm!24953))

(declare-fun m!277831 () Bool)

(assert (=> bm!24953 m!277831))

(assert (=> b!261550 m!277423))

(assert (=> b!261550 m!277423))

(assert (=> b!261550 m!277425))

(assert (=> b!261125 d!63017))

(assert (=> b!261125 d!62825))

(assert (=> d!62829 d!62781))

(declare-fun c!44543 () Bool)

(declare-fun lt!132099 () SeekEntryResult!1151)

(declare-fun call!24962 () Bool)

(declare-fun bm!24958 () Bool)

(assert (=> bm!24958 (= call!24962 (inRange!0 (ite c!44543 (index!6774 lt!132099) (index!6777 lt!132099)) (mask!11144 thiss!1504)))))

(declare-fun b!261569 () Bool)

(declare-fun res!127808 () Bool)

(assert (=> b!261569 (= res!127808 (= (select (arr!5966 (_keys!6991 thiss!1504)) (index!6774 lt!132099)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169482 () Bool)

(assert (=> b!261569 (=> (not res!127808) (not e!169482))))

(declare-fun d!63019 () Bool)

(declare-fun e!169481 () Bool)

(assert (=> d!63019 e!169481))

(assert (=> d!63019 (= c!44543 ((_ is MissingZero!1151) lt!132099))))

(assert (=> d!63019 (= lt!132099 (seekEntryOrOpen!0 key!932 (_keys!6991 thiss!1504) (mask!11144 thiss!1504)))))

(assert (=> d!63019 true))

(declare-fun _$34!1128 () Unit!8084)

(assert (=> d!63019 (= (choose!1282 (_keys!6991 thiss!1504) (_values!4790 thiss!1504) (mask!11144 thiss!1504) (extraKeys!4544 thiss!1504) (zeroValue!4648 thiss!1504) (minValue!4648 thiss!1504) key!932 (defaultEntry!4807 thiss!1504)) _$34!1128)))

(declare-fun b!261570 () Bool)

(declare-fun e!169480 () Bool)

(assert (=> b!261570 (= e!169481 e!169480)))

(declare-fun c!44542 () Bool)

(assert (=> b!261570 (= c!44542 ((_ is MissingVacant!1151) lt!132099))))

(declare-fun b!261571 () Bool)

(declare-fun res!127807 () Bool)

(declare-fun e!169483 () Bool)

(assert (=> b!261571 (=> (not res!127807) (not e!169483))))

(assert (=> b!261571 (= res!127807 call!24962)))

(assert (=> b!261571 (= e!169480 e!169483)))

(declare-fun b!261572 () Bool)

(declare-fun res!127809 () Bool)

(assert (=> b!261572 (=> (not res!127809) (not e!169483))))

(assert (=> b!261572 (= res!127809 (= (select (arr!5966 (_keys!6991 thiss!1504)) (index!6777 lt!132099)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24959 () Bool)

(declare-fun call!24961 () Bool)

(assert (=> bm!24959 (= call!24961 (arrayContainsKey!0 (_keys!6991 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261573 () Bool)

(assert (=> b!261573 (= e!169480 ((_ is Undefined!1151) lt!132099))))

(declare-fun b!261574 () Bool)

(assert (=> b!261574 (= e!169481 e!169482)))

(declare-fun res!127806 () Bool)

(assert (=> b!261574 (= res!127806 call!24962)))

(assert (=> b!261574 (=> (not res!127806) (not e!169482))))

(declare-fun b!261575 () Bool)

(assert (=> b!261575 (= e!169482 (not call!24961))))

(declare-fun b!261576 () Bool)

(assert (=> b!261576 (= e!169483 (not call!24961))))

(assert (= (and d!63019 c!44543) b!261574))

(assert (= (and d!63019 (not c!44543)) b!261570))

(assert (= (and b!261574 res!127806) b!261569))

(assert (= (and b!261569 res!127808) b!261575))

(assert (= (and b!261570 c!44542) b!261571))

(assert (= (and b!261570 (not c!44542)) b!261573))

(assert (= (and b!261571 res!127807) b!261572))

(assert (= (and b!261572 res!127809) b!261576))

(assert (= (or b!261574 b!261571) bm!24958))

(assert (= (or b!261575 b!261576) bm!24959))

(declare-fun m!277833 () Bool)

(assert (=> b!261572 m!277833))

(declare-fun m!277835 () Bool)

(assert (=> b!261569 m!277835))

(assert (=> bm!24959 m!276867))

(declare-fun m!277837 () Bool)

(assert (=> bm!24958 m!277837))

(assert (=> d!63019 m!276913))

(assert (=> d!62829 d!63019))

(assert (=> d!62829 d!62809))

(declare-fun d!63021 () Bool)

(declare-fun e!169484 () Bool)

(assert (=> d!63021 e!169484))

(declare-fun res!127810 () Bool)

(assert (=> d!63021 (=> res!127810 e!169484)))

(declare-fun lt!132101 () Bool)

(assert (=> d!63021 (= res!127810 (not lt!132101))))

(declare-fun lt!132100 () Bool)

(assert (=> d!63021 (= lt!132101 lt!132100)))

(declare-fun lt!132102 () Unit!8084)

(declare-fun e!169485 () Unit!8084)

(assert (=> d!63021 (= lt!132102 e!169485)))

(declare-fun c!44544 () Bool)

(assert (=> d!63021 (= c!44544 lt!132100)))

(assert (=> d!63021 (= lt!132100 (containsKey!309 (toList!1903 lt!131852) (select (arr!5966 lt!131647) #b00000000000000000000000000000000)))))

(assert (=> d!63021 (= (contains!1870 lt!131852 (select (arr!5966 lt!131647) #b00000000000000000000000000000000)) lt!132101)))

(declare-fun b!261577 () Bool)

(declare-fun lt!132103 () Unit!8084)

(assert (=> b!261577 (= e!169485 lt!132103)))

(assert (=> b!261577 (= lt!132103 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1903 lt!131852) (select (arr!5966 lt!131647) #b00000000000000000000000000000000)))))

(assert (=> b!261577 (isDefined!258 (getValueByKey!318 (toList!1903 lt!131852) (select (arr!5966 lt!131647) #b00000000000000000000000000000000)))))

(declare-fun b!261578 () Bool)

(declare-fun Unit!8110 () Unit!8084)

(assert (=> b!261578 (= e!169485 Unit!8110)))

(declare-fun b!261579 () Bool)

(assert (=> b!261579 (= e!169484 (isDefined!258 (getValueByKey!318 (toList!1903 lt!131852) (select (arr!5966 lt!131647) #b00000000000000000000000000000000))))))

(assert (= (and d!63021 c!44544) b!261577))

(assert (= (and d!63021 (not c!44544)) b!261578))

(assert (= (and d!63021 (not res!127810)) b!261579))

(assert (=> d!63021 m!277177))

(declare-fun m!277839 () Bool)

(assert (=> d!63021 m!277839))

(assert (=> b!261577 m!277177))

(declare-fun m!277841 () Bool)

(assert (=> b!261577 m!277841))

(assert (=> b!261577 m!277177))

(assert (=> b!261577 m!277369))

(assert (=> b!261577 m!277369))

(declare-fun m!277843 () Bool)

(assert (=> b!261577 m!277843))

(assert (=> b!261579 m!277177))

(assert (=> b!261579 m!277369))

(assert (=> b!261579 m!277369))

(assert (=> b!261579 m!277843))

(assert (=> b!261146 d!63021))

(declare-fun d!63023 () Bool)

(assert (=> d!63023 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261123 d!63023))

(declare-fun d!63025 () Bool)

(declare-fun e!169496 () Bool)

(assert (=> d!63025 e!169496))

(declare-fun c!44553 () Bool)

(declare-fun lt!132109 () SeekEntryResult!1151)

(assert (=> d!63025 (= c!44553 (and ((_ is Intermediate!1151) lt!132109) (undefined!1963 lt!132109)))))

(declare-fun e!169500 () SeekEntryResult!1151)

(assert (=> d!63025 (= lt!132109 e!169500)))

(declare-fun c!44552 () Bool)

(assert (=> d!63025 (= c!44552 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!132108 () (_ BitVec 64))

(assert (=> d!63025 (= lt!132108 (select (arr!5966 (_keys!6991 thiss!1504)) (toIndex!0 key!932 (mask!11144 thiss!1504))))))

(assert (=> d!63025 (validMask!0 (mask!11144 thiss!1504))))

(assert (=> d!63025 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11144 thiss!1504)) key!932 (_keys!6991 thiss!1504) (mask!11144 thiss!1504)) lt!132109)))

(declare-fun b!261598 () Bool)

(declare-fun e!169499 () Bool)

(assert (=> b!261598 (= e!169496 e!169499)))

(declare-fun res!127818 () Bool)

(assert (=> b!261598 (= res!127818 (and ((_ is Intermediate!1151) lt!132109) (not (undefined!1963 lt!132109)) (bvslt (x!25115 lt!132109) #b01111111111111111111111111111110) (bvsge (x!25115 lt!132109) #b00000000000000000000000000000000) (bvsge (x!25115 lt!132109) #b00000000000000000000000000000000)))))

(assert (=> b!261598 (=> (not res!127818) (not e!169499))))

(declare-fun b!261599 () Bool)

(assert (=> b!261599 (and (bvsge (index!6776 lt!132109) #b00000000000000000000000000000000) (bvslt (index!6776 lt!132109) (size!6316 (_keys!6991 thiss!1504))))))

(declare-fun res!127819 () Bool)

(assert (=> b!261599 (= res!127819 (= (select (arr!5966 (_keys!6991 thiss!1504)) (index!6776 lt!132109)) key!932))))

(declare-fun e!169497 () Bool)

(assert (=> b!261599 (=> res!127819 e!169497)))

(assert (=> b!261599 (= e!169499 e!169497)))

(declare-fun b!261600 () Bool)

(declare-fun e!169498 () SeekEntryResult!1151)

(assert (=> b!261600 (= e!169498 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!11144 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!11144 thiss!1504)) key!932 (_keys!6991 thiss!1504) (mask!11144 thiss!1504)))))

(declare-fun b!261601 () Bool)

(assert (=> b!261601 (and (bvsge (index!6776 lt!132109) #b00000000000000000000000000000000) (bvslt (index!6776 lt!132109) (size!6316 (_keys!6991 thiss!1504))))))

(assert (=> b!261601 (= e!169497 (= (select (arr!5966 (_keys!6991 thiss!1504)) (index!6776 lt!132109)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261602 () Bool)

(assert (=> b!261602 (= e!169496 (bvsge (x!25115 lt!132109) #b01111111111111111111111111111110))))

(declare-fun b!261603 () Bool)

(assert (=> b!261603 (and (bvsge (index!6776 lt!132109) #b00000000000000000000000000000000) (bvslt (index!6776 lt!132109) (size!6316 (_keys!6991 thiss!1504))))))

(declare-fun res!127817 () Bool)

(assert (=> b!261603 (= res!127817 (= (select (arr!5966 (_keys!6991 thiss!1504)) (index!6776 lt!132109)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261603 (=> res!127817 e!169497)))

(declare-fun b!261604 () Bool)

(assert (=> b!261604 (= e!169498 (Intermediate!1151 false (toIndex!0 key!932 (mask!11144 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!261605 () Bool)

(assert (=> b!261605 (= e!169500 (Intermediate!1151 true (toIndex!0 key!932 (mask!11144 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!261606 () Bool)

(assert (=> b!261606 (= e!169500 e!169498)))

(declare-fun c!44551 () Bool)

(assert (=> b!261606 (= c!44551 (or (= lt!132108 key!932) (= (bvadd lt!132108 lt!132108) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63025 c!44552) b!261605))

(assert (= (and d!63025 (not c!44552)) b!261606))

(assert (= (and b!261606 c!44551) b!261604))

(assert (= (and b!261606 (not c!44551)) b!261600))

(assert (= (and d!63025 c!44553) b!261602))

(assert (= (and d!63025 (not c!44553)) b!261598))

(assert (= (and b!261598 res!127818) b!261599))

(assert (= (and b!261599 (not res!127819)) b!261603))

(assert (= (and b!261603 (not res!127817)) b!261601))

(declare-fun m!277845 () Bool)

(assert (=> b!261601 m!277845))

(assert (=> b!261599 m!277845))

(assert (=> b!261603 m!277845))

(assert (=> b!261600 m!277069))

(declare-fun m!277847 () Bool)

(assert (=> b!261600 m!277847))

(assert (=> b!261600 m!277847))

(declare-fun m!277849 () Bool)

(assert (=> b!261600 m!277849))

(assert (=> d!63025 m!277069))

(declare-fun m!277851 () Bool)

(assert (=> d!63025 m!277851))

(assert (=> d!63025 m!276865))

(assert (=> d!62781 d!63025))

(declare-fun d!63027 () Bool)

(declare-fun lt!132115 () (_ BitVec 32))

(declare-fun lt!132114 () (_ BitVec 32))

(assert (=> d!63027 (= lt!132115 (bvmul (bvxor lt!132114 (bvlshr lt!132114 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!63027 (= lt!132114 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!63027 (and (bvsge (mask!11144 thiss!1504) #b00000000000000000000000000000000) (let ((res!127820 (let ((h!4403 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!25134 (bvmul (bvxor h!4403 (bvlshr h!4403 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!25134 (bvlshr x!25134 #b00000000000000000000000000001101)) (mask!11144 thiss!1504)))))) (and (bvslt res!127820 (bvadd (mask!11144 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!127820 #b00000000000000000000000000000000))))))

(assert (=> d!63027 (= (toIndex!0 key!932 (mask!11144 thiss!1504)) (bvand (bvxor lt!132115 (bvlshr lt!132115 #b00000000000000000000000000001101)) (mask!11144 thiss!1504)))))

(assert (=> d!62781 d!63027))

(assert (=> d!62781 d!62809))

(declare-fun d!63029 () Bool)

(declare-fun e!169501 () Bool)

(assert (=> d!63029 e!169501))

(declare-fun res!127821 () Bool)

(assert (=> d!63029 (=> (not res!127821) (not e!169501))))

(declare-fun lt!132119 () ListLongMap!3775)

(assert (=> d!63029 (= res!127821 (contains!1870 lt!132119 (_1!2441 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(declare-fun lt!132118 () List!3738)

(assert (=> d!63029 (= lt!132119 (ListLongMap!3776 lt!132118))))

(declare-fun lt!132117 () Unit!8084)

(declare-fun lt!132116 () Unit!8084)

(assert (=> d!63029 (= lt!132117 lt!132116)))

(assert (=> d!63029 (= (getValueByKey!318 lt!132118 (_1!2441 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(assert (=> d!63029 (= lt!132116 (lemmaContainsTupThenGetReturnValue!174 lt!132118 (_1!2441 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(assert (=> d!63029 (= lt!132118 (insertStrictlySorted!177 (toList!1903 call!24903) (_1!2441 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))) (_2!2441 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))))))

(assert (=> d!63029 (= (+!700 call!24903 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))) lt!132119)))

(declare-fun b!261607 () Bool)

(declare-fun res!127822 () Bool)

(assert (=> b!261607 (=> (not res!127822) (not e!169501))))

(assert (=> b!261607 (= res!127822 (= (getValueByKey!318 (toList!1903 lt!132119) (_1!2441 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504)))) (Some!323 (_2!2441 (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))))

(declare-fun b!261608 () Bool)

(assert (=> b!261608 (= e!169501 (contains!1872 (toList!1903 lt!132119) (tuple2!4861 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4648 thiss!1504))))))

(assert (= (and d!63029 res!127821) b!261607))

(assert (= (and b!261607 res!127822) b!261608))

(declare-fun m!277853 () Bool)

(assert (=> d!63029 m!277853))

(declare-fun m!277855 () Bool)

(assert (=> d!63029 m!277855))

(declare-fun m!277857 () Bool)

(assert (=> d!63029 m!277857))

(declare-fun m!277859 () Bool)

(assert (=> d!63029 m!277859))

(declare-fun m!277861 () Bool)

(assert (=> b!261607 m!277861))

(declare-fun m!277863 () Bool)

(assert (=> b!261608 m!277863))

(assert (=> b!261128 d!63029))

(declare-fun mapIsEmpty!11302 () Bool)

(declare-fun mapRes!11302 () Bool)

(assert (=> mapIsEmpty!11302 mapRes!11302))

(declare-fun b!261609 () Bool)

(declare-fun e!169503 () Bool)

(assert (=> b!261609 (= e!169503 tp_is_empty!6625)))

(declare-fun mapNonEmpty!11302 () Bool)

(declare-fun tp!23632 () Bool)

(assert (=> mapNonEmpty!11302 (= mapRes!11302 (and tp!23632 e!169503))))

(declare-fun mapRest!11302 () (Array (_ BitVec 32) ValueCell!2969))

(declare-fun mapKey!11302 () (_ BitVec 32))

(declare-fun mapValue!11302 () ValueCell!2969)

(assert (=> mapNonEmpty!11302 (= mapRest!11301 (store mapRest!11302 mapKey!11302 mapValue!11302))))

(declare-fun b!261610 () Bool)

(declare-fun e!169502 () Bool)

(assert (=> b!261610 (= e!169502 tp_is_empty!6625)))

(declare-fun condMapEmpty!11302 () Bool)

(declare-fun mapDefault!11302 () ValueCell!2969)

(assert (=> mapNonEmpty!11301 (= condMapEmpty!11302 (= mapRest!11301 ((as const (Array (_ BitVec 32) ValueCell!2969)) mapDefault!11302)))))

(assert (=> mapNonEmpty!11301 (= tp!23631 (and e!169502 mapRes!11302))))

(assert (= (and mapNonEmpty!11301 condMapEmpty!11302) mapIsEmpty!11302))

(assert (= (and mapNonEmpty!11301 (not condMapEmpty!11302)) mapNonEmpty!11302))

(assert (= (and mapNonEmpty!11302 ((_ is ValueCellFull!2969) mapValue!11302)) b!261609))

(assert (= (and mapNonEmpty!11301 ((_ is ValueCellFull!2969) mapDefault!11302)) b!261610))

(declare-fun m!277865 () Bool)

(assert (=> mapNonEmpty!11302 m!277865))

(declare-fun b_lambda!8327 () Bool)

(assert (= b_lambda!8321 (or (and b!260854 b_free!6763) b_lambda!8327)))

(declare-fun b_lambda!8329 () Bool)

(assert (= b_lambda!8317 (or (and b!260854 b_free!6763) b_lambda!8329)))

(declare-fun b_lambda!8331 () Bool)

(assert (= b_lambda!8325 (or (and b!260854 b_free!6763) b_lambda!8331)))

(declare-fun b_lambda!8333 () Bool)

(assert (= b_lambda!8323 (or (and b!260854 b_free!6763) b_lambda!8333)))

(declare-fun b_lambda!8335 () Bool)

(assert (= b_lambda!8319 (or (and b!260854 b_free!6763) b_lambda!8335)))

(check-sat (not b!261333) (not b!261486) (not b!261469) (not bm!24947) (not d!63029) (not b!261347) (not b!261510) (not b!261514) (not b!261415) (not bm!24945) (not d!62911) (not b!261509) (not bm!24950) (not b_lambda!8327) (not b!261414) (not d!62841) (not b!261492) (not b!261443) (not b!261512) (not bm!24948) (not b!261348) (not d!62989) (not b!261289) (not b!261338) (not b!261334) (not b!261501) (not d!62877) (not d!62995) (not b!261515) (not b!261335) (not d!62991) (not d!63001) (not b!261579) (not b!261326) (not d!62937) (not d!62987) (not d!62897) (not d!62907) (not b!261310) (not bm!24959) (not b!261332) (not d!62873) (not b!261300) (not b!261369) (not d!62891) (not b!261546) (not b!261399) (not b!261426) (not d!62999) (not b!261504) (not b!261287) (not d!62973) (not b!261282) (not bm!24926) (not bm!24958) (not d!62903) (not b!261373) (not d!62839) (not d!62971) (not b!261439) (not b!261459) (not d!62915) (not b!261381) (not b!261341) (not b!261488) (not b!261405) (not b!261526) (not b!261389) (not b!261502) (not b!261379) (not d!62975) (not b!261323) (not b!261288) (not b!261245) (not d!63025) (not d!63003) (not d!62913) (not d!62959) (not b!261544) (not d!62941) (not d!62831) (not d!62835) (not b!261600) (not d!62833) (not d!63021) (not b!261461) (not bm!24936) tp_is_empty!6625 (not b!261301) (not b!261507) (not bm!24939) (not b!261407) (not d!62889) (not b!261607) (not b!261505) (not b!261400) (not bm!24944) (not b!261428) (not d!62981) (not b!261307) (not b!261412) (not d!62851) (not b!261336) (not bm!24941) (not b!261550) (not b!261284) (not b!261577) (not bm!24949) (not d!62997) (not d!62887) (not d!62949) (not b!261497) (not bm!24927) (not d!63019) (not bm!24923) (not d!62983) (not bm!24946) (not b!261480) (not d!62905) (not b!261447) (not b!261297) (not b!261478) (not d!62853) (not d!62847) (not d!62893) (not b!261429) (not b!261250) (not bm!24943) (not d!62953) (not b_lambda!8335) (not d!62863) (not d!62917) (not b!261380) (not b!261392) (not b_next!6763) (not d!62963) (not b!261406) (not b!261493) (not b!261433) (not d!62879) (not d!62899) (not d!62951) (not d!63009) b_and!13915 (not b!261506) (not d!63011) (not b!261498) (not b_lambda!8333) (not b!261291) (not d!62843) (not d!62881) (not b!261410) (not b!261398) (not b!261413) (not d!62977) (not bm!24953) (not b!261441) (not b_lambda!8329) (not b_lambda!8331) (not d!62909) (not d!62871) (not b!261408) (not b!261500) (not d!62939) (not b!261435) (not b!261292) (not b!261445) (not b!261404) (not d!62855) (not b!261495) (not b!261255) (not d!62919) (not b_lambda!8315) (not bm!24928) (not b!261402) (not b!261254) (not b!261293) (not b!261440) (not b!261463) (not b!261308) (not b!261325) (not d!62955) (not b!261424) (not b_lambda!8313) (not b!261321) (not b!261608) (not d!62883) (not b!261436) (not b!261391) (not mapNonEmpty!11302) (not b!261372) (not b!261471) (not d!62931) (not d!62867) (not b!261403) (not b!261243) (not d!62967) (not bm!24952) (not b!261490) (not b!261458) (not d!62885) (not d!62979) (not b!261518) (not b!261285) (not b!261438) (not d!62985) (not bm!24951) (not d!62925) (not b!261295) (not d!62993) (not b!261252) (not b!261472) (not b!261516) (not d!62895) (not b!261384) (not b!261483) (not d!62901) (not d!62927))
(check-sat b_and!13915 (not b_next!6763))
