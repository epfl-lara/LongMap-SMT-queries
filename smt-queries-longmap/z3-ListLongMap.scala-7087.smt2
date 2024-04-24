; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89842 () Bool)

(assert start!89842)

(declare-fun b!1029059 () Bool)

(declare-fun b_free!20575 () Bool)

(declare-fun b_next!20575 () Bool)

(assert (=> b!1029059 (= b_free!20575 (not b_next!20575))))

(declare-fun tp!72774 () Bool)

(declare-fun b_and!32843 () Bool)

(assert (=> b!1029059 (= tp!72774 b_and!32843)))

(declare-fun b!1029053 () Bool)

(declare-fun res!688352 () Bool)

(declare-fun e!580909 () Bool)

(assert (=> b!1029053 (=> (not res!688352) (not e!580909))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1029053 (= res!688352 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37874 () Bool)

(declare-fun mapRes!37874 () Bool)

(assert (=> mapIsEmpty!37874 mapRes!37874))

(declare-fun b!1029054 () Bool)

(declare-fun e!580913 () Bool)

(declare-fun tp_is_empty!24295 () Bool)

(assert (=> b!1029054 (= e!580913 tp_is_empty!24295)))

(declare-fun b!1029055 () Bool)

(declare-fun e!580910 () Bool)

(declare-fun e!580908 () Bool)

(assert (=> b!1029055 (= e!580910 (not e!580908))))

(declare-fun res!688355 () Bool)

(assert (=> b!1029055 (=> res!688355 e!580908)))

(declare-datatypes ((V!37267 0))(
  ( (V!37268 (val!12198 Int)) )
))
(declare-datatypes ((ValueCell!11444 0))(
  ( (ValueCellFull!11444 (v!14763 V!37267)) (EmptyCell!11444) )
))
(declare-datatypes ((Unit!33562 0))(
  ( (Unit!33563) )
))
(declare-datatypes ((array!64691 0))(
  ( (array!64692 (arr!31147 (Array (_ BitVec 32) (_ BitVec 64))) (size!31661 (_ BitVec 32))) )
))
(declare-datatypes ((array!64693 0))(
  ( (array!64694 (arr!31148 (Array (_ BitVec 32) ValueCell!11444)) (size!31662 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5482 0))(
  ( (LongMapFixedSize!5483 (defaultEntry!6095 Int) (mask!29879 (_ BitVec 32)) (extraKeys!5827 (_ BitVec 32)) (zeroValue!5931 V!37267) (minValue!5931 V!37267) (_size!2796 (_ BitVec 32)) (_keys!11282 array!64691) (_values!6118 array!64693) (_vacant!2796 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15538 0))(
  ( (tuple2!15539 (_1!7780 Unit!33562) (_2!7780 LongMapFixedSize!5482)) )
))
(declare-fun lt!453012 () tuple2!15538)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1029055 (= res!688355 (not (validMask!0 (mask!29879 (_2!7780 lt!453012)))))))

(declare-fun lt!453015 () array!64693)

(declare-fun lt!453011 () array!64691)

(declare-fun thiss!1427 () LongMapFixedSize!5482)

(declare-fun Unit!33564 () Unit!33562)

(declare-fun Unit!33565 () Unit!33562)

(assert (=> b!1029055 (= lt!453012 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2796 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15539 Unit!33564 (LongMapFixedSize!5483 (defaultEntry!6095 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (bvsub (_size!2796 thiss!1427) #b00000000000000000000000000000001) lt!453011 lt!453015 (bvadd #b00000000000000000000000000000001 (_vacant!2796 thiss!1427)))) (tuple2!15539 Unit!33565 (LongMapFixedSize!5483 (defaultEntry!6095 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (bvsub (_size!2796 thiss!1427) #b00000000000000000000000000000001) lt!453011 lt!453015 (_vacant!2796 thiss!1427)))))))

(declare-datatypes ((tuple2!15540 0))(
  ( (tuple2!15541 (_1!7781 (_ BitVec 64)) (_2!7781 V!37267)) )
))
(declare-datatypes ((List!21796 0))(
  ( (Nil!21793) (Cons!21792 (h!22999 tuple2!15540) (t!30858 List!21796)) )
))
(declare-datatypes ((ListLongMap!13679 0))(
  ( (ListLongMap!13680 (toList!6855 List!21796)) )
))
(declare-fun -!478 (ListLongMap!13679 (_ BitVec 64)) ListLongMap!13679)

(declare-fun getCurrentListMap!3901 (array!64691 array!64693 (_ BitVec 32) (_ BitVec 32) V!37267 V!37267 (_ BitVec 32) Int) ListLongMap!13679)

(assert (=> b!1029055 (= (-!478 (getCurrentListMap!3901 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)) key!909) (getCurrentListMap!3901 lt!453011 lt!453015 (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9630 0))(
  ( (MissingZero!9630 (index!40891 (_ BitVec 32))) (Found!9630 (index!40892 (_ BitVec 32))) (Intermediate!9630 (undefined!10442 Bool) (index!40893 (_ BitVec 32)) (x!91436 (_ BitVec 32))) (Undefined!9630) (MissingVacant!9630 (index!40894 (_ BitVec 32))) )
))
(declare-fun lt!453013 () SeekEntryResult!9630)

(declare-fun dynLambda!1972 (Int (_ BitVec 64)) V!37267)

(assert (=> b!1029055 (= lt!453015 (array!64694 (store (arr!31148 (_values!6118 thiss!1427)) (index!40892 lt!453013) (ValueCellFull!11444 (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31662 (_values!6118 thiss!1427))))))

(declare-fun lt!453016 () Unit!33562)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!4 (array!64691 array!64693 (_ BitVec 32) (_ BitVec 32) V!37267 V!37267 (_ BitVec 32) (_ BitVec 64) Int) Unit!33562)

(assert (=> b!1029055 (= lt!453016 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!4 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (index!40892 lt!453013) key!909 (defaultEntry!6095 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1029055 (not (arrayContainsKey!0 lt!453011 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!453010 () Unit!33562)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64691 (_ BitVec 32) (_ BitVec 64)) Unit!33562)

(assert (=> b!1029055 (= lt!453010 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11282 thiss!1427) (index!40892 lt!453013) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64691 (_ BitVec 32)) Bool)

(assert (=> b!1029055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453011 (mask!29879 thiss!1427))))

(declare-fun lt!453008 () Unit!33562)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64691 (_ BitVec 32) (_ BitVec 32)) Unit!33562)

(assert (=> b!1029055 (= lt!453008 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11282 thiss!1427) (index!40892 lt!453013) (mask!29879 thiss!1427)))))

(declare-datatypes ((List!21797 0))(
  ( (Nil!21794) (Cons!21793 (h!23000 (_ BitVec 64)) (t!30859 List!21797)) )
))
(declare-fun arrayNoDuplicates!0 (array!64691 (_ BitVec 32) List!21797) Bool)

(assert (=> b!1029055 (arrayNoDuplicates!0 lt!453011 #b00000000000000000000000000000000 Nil!21794)))

(declare-fun lt!453014 () Unit!33562)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64691 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21797) Unit!33562)

(assert (=> b!1029055 (= lt!453014 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11282 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40892 lt!453013) #b00000000000000000000000000000000 Nil!21794))))

(declare-fun arrayCountValidKeys!0 (array!64691 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1029055 (= (arrayCountValidKeys!0 lt!453011 #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11282 thiss!1427) #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1029055 (= lt!453011 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))))))

(declare-fun lt!453009 () Unit!33562)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64691 (_ BitVec 32) (_ BitVec 64)) Unit!33562)

(assert (=> b!1029055 (= lt!453009 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11282 thiss!1427) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029056 () Bool)

(declare-fun e!580911 () Bool)

(assert (=> b!1029056 (= e!580911 tp_is_empty!24295)))

(declare-fun mapNonEmpty!37874 () Bool)

(declare-fun tp!72773 () Bool)

(assert (=> mapNonEmpty!37874 (= mapRes!37874 (and tp!72773 e!580913))))

(declare-fun mapValue!37874 () ValueCell!11444)

(declare-fun mapKey!37874 () (_ BitVec 32))

(declare-fun mapRest!37874 () (Array (_ BitVec 32) ValueCell!11444))

(assert (=> mapNonEmpty!37874 (= (arr!31148 (_values!6118 thiss!1427)) (store mapRest!37874 mapKey!37874 mapValue!37874))))

(declare-fun res!688354 () Bool)

(assert (=> start!89842 (=> (not res!688354) (not e!580909))))

(declare-fun valid!2083 (LongMapFixedSize!5482) Bool)

(assert (=> start!89842 (= res!688354 (valid!2083 thiss!1427))))

(assert (=> start!89842 e!580909))

(declare-fun e!580912 () Bool)

(assert (=> start!89842 e!580912))

(assert (=> start!89842 true))

(declare-fun b!1029057 () Bool)

(declare-fun e!580914 () Bool)

(assert (=> b!1029057 (= e!580914 (and e!580911 mapRes!37874))))

(declare-fun condMapEmpty!37874 () Bool)

(declare-fun mapDefault!37874 () ValueCell!11444)

(assert (=> b!1029057 (= condMapEmpty!37874 (= (arr!31148 (_values!6118 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11444)) mapDefault!37874)))))

(declare-fun b!1029058 () Bool)

(assert (=> b!1029058 (= e!580909 e!580910)))

(declare-fun res!688353 () Bool)

(assert (=> b!1029058 (=> (not res!688353) (not e!580910))))

(get-info :version)

(assert (=> b!1029058 (= res!688353 ((_ is Found!9630) lt!453013))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64691 (_ BitVec 32)) SeekEntryResult!9630)

(assert (=> b!1029058 (= lt!453013 (seekEntry!0 key!909 (_keys!11282 thiss!1427) (mask!29879 thiss!1427)))))

(declare-fun array_inv!24127 (array!64691) Bool)

(declare-fun array_inv!24128 (array!64693) Bool)

(assert (=> b!1029059 (= e!580912 (and tp!72774 tp_is_empty!24295 (array_inv!24127 (_keys!11282 thiss!1427)) (array_inv!24128 (_values!6118 thiss!1427)) e!580914))))

(declare-fun b!1029060 () Bool)

(assert (=> b!1029060 (= e!580908 (= (size!31662 (_values!6118 (_2!7780 lt!453012))) (bvadd #b00000000000000000000000000000001 (mask!29879 (_2!7780 lt!453012)))))))

(assert (= (and start!89842 res!688354) b!1029053))

(assert (= (and b!1029053 res!688352) b!1029058))

(assert (= (and b!1029058 res!688353) b!1029055))

(assert (= (and b!1029055 (not res!688355)) b!1029060))

(assert (= (and b!1029057 condMapEmpty!37874) mapIsEmpty!37874))

(assert (= (and b!1029057 (not condMapEmpty!37874)) mapNonEmpty!37874))

(assert (= (and mapNonEmpty!37874 ((_ is ValueCellFull!11444) mapValue!37874)) b!1029054))

(assert (= (and b!1029057 ((_ is ValueCellFull!11444) mapDefault!37874)) b!1029056))

(assert (= b!1029059 b!1029057))

(assert (= start!89842 b!1029059))

(declare-fun b_lambda!15749 () Bool)

(assert (=> (not b_lambda!15749) (not b!1029055)))

(declare-fun t!30857 () Bool)

(declare-fun tb!6885 () Bool)

(assert (=> (and b!1029059 (= (defaultEntry!6095 thiss!1427) (defaultEntry!6095 thiss!1427)) t!30857) tb!6885))

(declare-fun result!14095 () Bool)

(assert (=> tb!6885 (= result!14095 tp_is_empty!24295)))

(assert (=> b!1029055 t!30857))

(declare-fun b_and!32845 () Bool)

(assert (= b_and!32843 (and (=> t!30857 result!14095) b_and!32845)))

(declare-fun m!947931 () Bool)

(assert (=> b!1029058 m!947931))

(declare-fun m!947933 () Bool)

(assert (=> mapNonEmpty!37874 m!947933))

(declare-fun m!947935 () Bool)

(assert (=> b!1029055 m!947935))

(declare-fun m!947937 () Bool)

(assert (=> b!1029055 m!947937))

(declare-fun m!947939 () Bool)

(assert (=> b!1029055 m!947939))

(declare-fun m!947941 () Bool)

(assert (=> b!1029055 m!947941))

(declare-fun m!947943 () Bool)

(assert (=> b!1029055 m!947943))

(declare-fun m!947945 () Bool)

(assert (=> b!1029055 m!947945))

(declare-fun m!947947 () Bool)

(assert (=> b!1029055 m!947947))

(declare-fun m!947949 () Bool)

(assert (=> b!1029055 m!947949))

(declare-fun m!947951 () Bool)

(assert (=> b!1029055 m!947951))

(declare-fun m!947953 () Bool)

(assert (=> b!1029055 m!947953))

(declare-fun m!947955 () Bool)

(assert (=> b!1029055 m!947955))

(assert (=> b!1029055 m!947953))

(declare-fun m!947957 () Bool)

(assert (=> b!1029055 m!947957))

(declare-fun m!947959 () Bool)

(assert (=> b!1029055 m!947959))

(declare-fun m!947961 () Bool)

(assert (=> b!1029055 m!947961))

(declare-fun m!947963 () Bool)

(assert (=> b!1029055 m!947963))

(declare-fun m!947965 () Bool)

(assert (=> b!1029055 m!947965))

(declare-fun m!947967 () Bool)

(assert (=> b!1029055 m!947967))

(declare-fun m!947969 () Bool)

(assert (=> start!89842 m!947969))

(declare-fun m!947971 () Bool)

(assert (=> b!1029059 m!947971))

(declare-fun m!947973 () Bool)

(assert (=> b!1029059 m!947973))

(check-sat (not b!1029058) tp_is_empty!24295 (not b!1029059) (not b_next!20575) (not b_lambda!15749) (not b!1029055) (not start!89842) b_and!32845 (not mapNonEmpty!37874))
(check-sat b_and!32845 (not b_next!20575))
(get-model)

(declare-fun b_lambda!15755 () Bool)

(assert (= b_lambda!15749 (or (and b!1029059 b_free!20575) b_lambda!15755)))

(check-sat (not b!1029058) tp_is_empty!24295 (not b!1029059) (not b_next!20575) (not b_lambda!15755) (not b!1029055) (not start!89842) b_and!32845 (not mapNonEmpty!37874))
(check-sat b_and!32845 (not b_next!20575))
(get-model)

(declare-fun d!123207 () Bool)

(declare-fun res!688386 () Bool)

(declare-fun e!580966 () Bool)

(assert (=> d!123207 (=> (not res!688386) (not e!580966))))

(declare-fun simpleValid!391 (LongMapFixedSize!5482) Bool)

(assert (=> d!123207 (= res!688386 (simpleValid!391 thiss!1427))))

(assert (=> d!123207 (= (valid!2083 thiss!1427) e!580966)))

(declare-fun b!1029121 () Bool)

(declare-fun res!688387 () Bool)

(assert (=> b!1029121 (=> (not res!688387) (not e!580966))))

(assert (=> b!1029121 (= res!688387 (= (arrayCountValidKeys!0 (_keys!11282 thiss!1427) #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))) (_size!2796 thiss!1427)))))

(declare-fun b!1029122 () Bool)

(declare-fun res!688388 () Bool)

(assert (=> b!1029122 (=> (not res!688388) (not e!580966))))

(assert (=> b!1029122 (= res!688388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11282 thiss!1427) (mask!29879 thiss!1427)))))

(declare-fun b!1029123 () Bool)

(assert (=> b!1029123 (= e!580966 (arrayNoDuplicates!0 (_keys!11282 thiss!1427) #b00000000000000000000000000000000 Nil!21794))))

(assert (= (and d!123207 res!688386) b!1029121))

(assert (= (and b!1029121 res!688387) b!1029122))

(assert (= (and b!1029122 res!688388) b!1029123))

(declare-fun m!948063 () Bool)

(assert (=> d!123207 m!948063))

(assert (=> b!1029121 m!947947))

(declare-fun m!948065 () Bool)

(assert (=> b!1029122 m!948065))

(declare-fun m!948067 () Bool)

(assert (=> b!1029123 m!948067))

(assert (=> start!89842 d!123207))

(declare-fun b!1029136 () Bool)

(declare-fun e!580973 () SeekEntryResult!9630)

(declare-fun lt!453082 () SeekEntryResult!9630)

(assert (=> b!1029136 (= e!580973 (MissingZero!9630 (index!40893 lt!453082)))))

(declare-fun b!1029137 () Bool)

(declare-fun e!580974 () SeekEntryResult!9630)

(assert (=> b!1029137 (= e!580974 Undefined!9630)))

(declare-fun b!1029138 () Bool)

(declare-fun e!580975 () SeekEntryResult!9630)

(assert (=> b!1029138 (= e!580974 e!580975)))

(declare-fun lt!453081 () (_ BitVec 64))

(assert (=> b!1029138 (= lt!453081 (select (arr!31147 (_keys!11282 thiss!1427)) (index!40893 lt!453082)))))

(declare-fun c!104035 () Bool)

(assert (=> b!1029138 (= c!104035 (= lt!453081 key!909))))

(declare-fun b!1029139 () Bool)

(assert (=> b!1029139 (= e!580975 (Found!9630 (index!40893 lt!453082)))))

(declare-fun b!1029140 () Bool)

(declare-fun c!104034 () Bool)

(assert (=> b!1029140 (= c!104034 (= lt!453081 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029140 (= e!580975 e!580973)))

(declare-fun b!1029141 () Bool)

(declare-fun lt!453080 () SeekEntryResult!9630)

(assert (=> b!1029141 (= e!580973 (ite ((_ is MissingVacant!9630) lt!453080) (MissingZero!9630 (index!40894 lt!453080)) lt!453080))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64691 (_ BitVec 32)) SeekEntryResult!9630)

(assert (=> b!1029141 (= lt!453080 (seekKeyOrZeroReturnVacant!0 (x!91436 lt!453082) (index!40893 lt!453082) (index!40893 lt!453082) key!909 (_keys!11282 thiss!1427) (mask!29879 thiss!1427)))))

(declare-fun d!123209 () Bool)

(declare-fun lt!453079 () SeekEntryResult!9630)

(assert (=> d!123209 (and (or ((_ is MissingVacant!9630) lt!453079) (not ((_ is Found!9630) lt!453079)) (and (bvsge (index!40892 lt!453079) #b00000000000000000000000000000000) (bvslt (index!40892 lt!453079) (size!31661 (_keys!11282 thiss!1427))))) (not ((_ is MissingVacant!9630) lt!453079)) (or (not ((_ is Found!9630) lt!453079)) (= (select (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453079)) key!909)))))

(assert (=> d!123209 (= lt!453079 e!580974)))

(declare-fun c!104036 () Bool)

(assert (=> d!123209 (= c!104036 (and ((_ is Intermediate!9630) lt!453082) (undefined!10442 lt!453082)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64691 (_ BitVec 32)) SeekEntryResult!9630)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!123209 (= lt!453082 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29879 thiss!1427)) key!909 (_keys!11282 thiss!1427) (mask!29879 thiss!1427)))))

(assert (=> d!123209 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123209 (= (seekEntry!0 key!909 (_keys!11282 thiss!1427) (mask!29879 thiss!1427)) lt!453079)))

(assert (= (and d!123209 c!104036) b!1029137))

(assert (= (and d!123209 (not c!104036)) b!1029138))

(assert (= (and b!1029138 c!104035) b!1029139))

(assert (= (and b!1029138 (not c!104035)) b!1029140))

(assert (= (and b!1029140 c!104034) b!1029136))

(assert (= (and b!1029140 (not c!104034)) b!1029141))

(declare-fun m!948069 () Bool)

(assert (=> b!1029138 m!948069))

(declare-fun m!948071 () Bool)

(assert (=> b!1029141 m!948071))

(declare-fun m!948073 () Bool)

(assert (=> d!123209 m!948073))

(declare-fun m!948075 () Bool)

(assert (=> d!123209 m!948075))

(assert (=> d!123209 m!948075))

(declare-fun m!948077 () Bool)

(assert (=> d!123209 m!948077))

(declare-fun m!948079 () Bool)

(assert (=> d!123209 m!948079))

(assert (=> b!1029058 d!123209))

(declare-fun d!123211 () Bool)

(assert (=> d!123211 (= (array_inv!24127 (_keys!11282 thiss!1427)) (bvsge (size!31661 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1029059 d!123211))

(declare-fun d!123213 () Bool)

(assert (=> d!123213 (= (array_inv!24128 (_values!6118 thiss!1427)) (bvsge (size!31662 (_values!6118 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1029059 d!123213))

(declare-fun b!1029152 () Bool)

(declare-fun e!580981 () Bool)

(assert (=> b!1029152 (= e!580981 (bvslt (size!31661 (_keys!11282 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1029150 () Bool)

(declare-fun res!688398 () Bool)

(assert (=> b!1029150 (=> (not res!688398) (not e!580981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1029150 (= res!688398 (validKeyInArray!0 (select (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013))))))

(declare-fun d!123215 () Bool)

(declare-fun e!580980 () Bool)

(assert (=> d!123215 e!580980))

(declare-fun res!688397 () Bool)

(assert (=> d!123215 (=> (not res!688397) (not e!580980))))

(assert (=> d!123215 (= res!688397 (and (bvsge (index!40892 lt!453013) #b00000000000000000000000000000000) (bvslt (index!40892 lt!453013) (size!31661 (_keys!11282 thiss!1427)))))))

(declare-fun lt!453085 () Unit!33562)

(declare-fun choose!82 (array!64691 (_ BitVec 32) (_ BitVec 64)) Unit!33562)

(assert (=> d!123215 (= lt!453085 (choose!82 (_keys!11282 thiss!1427) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123215 e!580981))

(declare-fun res!688399 () Bool)

(assert (=> d!123215 (=> (not res!688399) (not e!580981))))

(assert (=> d!123215 (= res!688399 (and (bvsge (index!40892 lt!453013) #b00000000000000000000000000000000) (bvslt (index!40892 lt!453013) (size!31661 (_keys!11282 thiss!1427)))))))

(assert (=> d!123215 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11282 thiss!1427) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) lt!453085)))

(declare-fun b!1029153 () Bool)

(assert (=> b!1029153 (= e!580980 (= (arrayCountValidKeys!0 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11282 thiss!1427) #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1029151 () Bool)

(declare-fun res!688400 () Bool)

(assert (=> b!1029151 (=> (not res!688400) (not e!580981))))

(assert (=> b!1029151 (= res!688400 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123215 res!688399) b!1029150))

(assert (= (and b!1029150 res!688398) b!1029151))

(assert (= (and b!1029151 res!688400) b!1029152))

(assert (= (and d!123215 res!688397) b!1029153))

(declare-fun m!948081 () Bool)

(assert (=> b!1029150 m!948081))

(assert (=> b!1029150 m!948081))

(declare-fun m!948083 () Bool)

(assert (=> b!1029150 m!948083))

(declare-fun m!948085 () Bool)

(assert (=> d!123215 m!948085))

(assert (=> b!1029153 m!947961))

(declare-fun m!948087 () Bool)

(assert (=> b!1029153 m!948087))

(assert (=> b!1029153 m!947947))

(declare-fun m!948089 () Bool)

(assert (=> b!1029151 m!948089))

(assert (=> b!1029055 d!123215))

(declare-fun d!123217 () Bool)

(declare-fun e!580984 () Bool)

(assert (=> d!123217 e!580984))

(declare-fun res!688403 () Bool)

(assert (=> d!123217 (=> (not res!688403) (not e!580984))))

(assert (=> d!123217 (= res!688403 (and (bvsge (index!40892 lt!453013) #b00000000000000000000000000000000) (bvslt (index!40892 lt!453013) (size!31661 (_keys!11282 thiss!1427)))))))

(declare-fun lt!453088 () Unit!33562)

(declare-fun choose!1686 (array!64691 array!64693 (_ BitVec 32) (_ BitVec 32) V!37267 V!37267 (_ BitVec 32) (_ BitVec 64) Int) Unit!33562)

(assert (=> d!123217 (= lt!453088 (choose!1686 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (index!40892 lt!453013) key!909 (defaultEntry!6095 thiss!1427)))))

(assert (=> d!123217 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123217 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!4 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (index!40892 lt!453013) key!909 (defaultEntry!6095 thiss!1427)) lt!453088)))

(declare-fun b!1029156 () Bool)

(assert (=> b!1029156 (= e!580984 (= (-!478 (getCurrentListMap!3901 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)) key!909) (getCurrentListMap!3901 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) (array!64694 (store (arr!31148 (_values!6118 thiss!1427)) (index!40892 lt!453013) (ValueCellFull!11444 (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31662 (_values!6118 thiss!1427))) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427))))))

(assert (=> b!1029156 (bvslt (index!40892 lt!453013) (size!31662 (_values!6118 thiss!1427)))))

(assert (= (and d!123217 res!688403) b!1029156))

(declare-fun b_lambda!15757 () Bool)

(assert (=> (not b_lambda!15757) (not b!1029156)))

(assert (=> b!1029156 t!30857))

(declare-fun b_and!32855 () Bool)

(assert (= b_and!32845 (and (=> t!30857 result!14095) b_and!32855)))

(declare-fun m!948091 () Bool)

(assert (=> d!123217 m!948091))

(assert (=> d!123217 m!948079))

(assert (=> b!1029156 m!947953))

(assert (=> b!1029156 m!947955))

(assert (=> b!1029156 m!947935))

(declare-fun m!948093 () Bool)

(assert (=> b!1029156 m!948093))

(assert (=> b!1029156 m!947961))

(assert (=> b!1029156 m!947953))

(assert (=> b!1029156 m!947959))

(assert (=> b!1029055 d!123217))

(declare-fun b!1029167 () Bool)

(declare-fun e!580996 () Bool)

(declare-fun call!43350 () Bool)

(assert (=> b!1029167 (= e!580996 call!43350)))

(declare-fun b!1029168 () Bool)

(assert (=> b!1029168 (= e!580996 call!43350)))

(declare-fun bm!43347 () Bool)

(declare-fun c!104039 () Bool)

(assert (=> bm!43347 (= call!43350 (arrayNoDuplicates!0 lt!453011 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104039 (Cons!21793 (select (arr!31147 lt!453011) #b00000000000000000000000000000000) Nil!21794) Nil!21794)))))

(declare-fun b!1029169 () Bool)

(declare-fun e!580994 () Bool)

(assert (=> b!1029169 (= e!580994 e!580996)))

(assert (=> b!1029169 (= c!104039 (validKeyInArray!0 (select (arr!31147 lt!453011) #b00000000000000000000000000000000)))))

(declare-fun b!1029170 () Bool)

(declare-fun e!580995 () Bool)

(assert (=> b!1029170 (= e!580995 e!580994)))

(declare-fun res!688410 () Bool)

(assert (=> b!1029170 (=> (not res!688410) (not e!580994))))

(declare-fun e!580993 () Bool)

(assert (=> b!1029170 (= res!688410 (not e!580993))))

(declare-fun res!688412 () Bool)

(assert (=> b!1029170 (=> (not res!688412) (not e!580993))))

(assert (=> b!1029170 (= res!688412 (validKeyInArray!0 (select (arr!31147 lt!453011) #b00000000000000000000000000000000)))))

(declare-fun d!123219 () Bool)

(declare-fun res!688411 () Bool)

(assert (=> d!123219 (=> res!688411 e!580995)))

(assert (=> d!123219 (= res!688411 (bvsge #b00000000000000000000000000000000 (size!31661 lt!453011)))))

(assert (=> d!123219 (= (arrayNoDuplicates!0 lt!453011 #b00000000000000000000000000000000 Nil!21794) e!580995)))

(declare-fun b!1029171 () Bool)

(declare-fun contains!5989 (List!21797 (_ BitVec 64)) Bool)

(assert (=> b!1029171 (= e!580993 (contains!5989 Nil!21794 (select (arr!31147 lt!453011) #b00000000000000000000000000000000)))))

(assert (= (and d!123219 (not res!688411)) b!1029170))

(assert (= (and b!1029170 res!688412) b!1029171))

(assert (= (and b!1029170 res!688410) b!1029169))

(assert (= (and b!1029169 c!104039) b!1029167))

(assert (= (and b!1029169 (not c!104039)) b!1029168))

(assert (= (or b!1029167 b!1029168) bm!43347))

(declare-fun m!948095 () Bool)

(assert (=> bm!43347 m!948095))

(declare-fun m!948097 () Bool)

(assert (=> bm!43347 m!948097))

(assert (=> b!1029169 m!948095))

(assert (=> b!1029169 m!948095))

(declare-fun m!948099 () Bool)

(assert (=> b!1029169 m!948099))

(assert (=> b!1029170 m!948095))

(assert (=> b!1029170 m!948095))

(assert (=> b!1029170 m!948099))

(assert (=> b!1029171 m!948095))

(assert (=> b!1029171 m!948095))

(declare-fun m!948101 () Bool)

(assert (=> b!1029171 m!948101))

(assert (=> b!1029055 d!123219))

(declare-fun d!123221 () Bool)

(declare-fun lt!453091 () ListLongMap!13679)

(declare-fun contains!5990 (ListLongMap!13679 (_ BitVec 64)) Bool)

(assert (=> d!123221 (not (contains!5990 lt!453091 key!909))))

(declare-fun removeStrictlySorted!49 (List!21796 (_ BitVec 64)) List!21796)

(assert (=> d!123221 (= lt!453091 (ListLongMap!13680 (removeStrictlySorted!49 (toList!6855 (getCurrentListMap!3901 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427))) key!909)))))

(assert (=> d!123221 (= (-!478 (getCurrentListMap!3901 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)) key!909) lt!453091)))

(declare-fun bs!30014 () Bool)

(assert (= bs!30014 d!123221))

(declare-fun m!948103 () Bool)

(assert (=> bs!30014 m!948103))

(declare-fun m!948105 () Bool)

(assert (=> bs!30014 m!948105))

(assert (=> b!1029055 d!123221))

(declare-fun d!123223 () Bool)

(declare-fun e!580999 () Bool)

(assert (=> d!123223 e!580999))

(declare-fun res!688415 () Bool)

(assert (=> d!123223 (=> (not res!688415) (not e!580999))))

(assert (=> d!123223 (= res!688415 (and (bvsge (index!40892 lt!453013) #b00000000000000000000000000000000) (bvslt (index!40892 lt!453013) (size!31661 (_keys!11282 thiss!1427)))))))

(declare-fun lt!453094 () Unit!33562)

(declare-fun choose!53 (array!64691 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21797) Unit!33562)

(assert (=> d!123223 (= lt!453094 (choose!53 (_keys!11282 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40892 lt!453013) #b00000000000000000000000000000000 Nil!21794))))

(assert (=> d!123223 (bvslt (size!31661 (_keys!11282 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!123223 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11282 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40892 lt!453013) #b00000000000000000000000000000000 Nil!21794) lt!453094)))

(declare-fun b!1029174 () Bool)

(assert (=> b!1029174 (= e!580999 (arrayNoDuplicates!0 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) #b00000000000000000000000000000000 Nil!21794))))

(assert (= (and d!123223 res!688415) b!1029174))

(declare-fun m!948107 () Bool)

(assert (=> d!123223 m!948107))

(assert (=> b!1029174 m!947961))

(declare-fun m!948109 () Bool)

(assert (=> b!1029174 m!948109))

(assert (=> b!1029055 d!123223))

(declare-fun b!1029183 () Bool)

(declare-fun e!581008 () Bool)

(declare-fun call!43353 () Bool)

(assert (=> b!1029183 (= e!581008 call!43353)))

(declare-fun d!123225 () Bool)

(declare-fun res!688421 () Bool)

(declare-fun e!581007 () Bool)

(assert (=> d!123225 (=> res!688421 e!581007)))

(assert (=> d!123225 (= res!688421 (bvsge #b00000000000000000000000000000000 (size!31661 lt!453011)))))

(assert (=> d!123225 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453011 (mask!29879 thiss!1427)) e!581007)))

(declare-fun bm!43350 () Bool)

(assert (=> bm!43350 (= call!43353 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!453011 (mask!29879 thiss!1427)))))

(declare-fun b!1029184 () Bool)

(declare-fun e!581006 () Bool)

(assert (=> b!1029184 (= e!581006 e!581008)))

(declare-fun lt!453103 () (_ BitVec 64))

(assert (=> b!1029184 (= lt!453103 (select (arr!31147 lt!453011) #b00000000000000000000000000000000))))

(declare-fun lt!453102 () Unit!33562)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64691 (_ BitVec 64) (_ BitVec 32)) Unit!33562)

(assert (=> b!1029184 (= lt!453102 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453011 lt!453103 #b00000000000000000000000000000000))))

(assert (=> b!1029184 (arrayContainsKey!0 lt!453011 lt!453103 #b00000000000000000000000000000000)))

(declare-fun lt!453101 () Unit!33562)

(assert (=> b!1029184 (= lt!453101 lt!453102)))

(declare-fun res!688420 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64691 (_ BitVec 32)) SeekEntryResult!9630)

(assert (=> b!1029184 (= res!688420 (= (seekEntryOrOpen!0 (select (arr!31147 lt!453011) #b00000000000000000000000000000000) lt!453011 (mask!29879 thiss!1427)) (Found!9630 #b00000000000000000000000000000000)))))

(assert (=> b!1029184 (=> (not res!688420) (not e!581008))))

(declare-fun b!1029185 () Bool)

(assert (=> b!1029185 (= e!581007 e!581006)))

(declare-fun c!104042 () Bool)

(assert (=> b!1029185 (= c!104042 (validKeyInArray!0 (select (arr!31147 lt!453011) #b00000000000000000000000000000000)))))

(declare-fun b!1029186 () Bool)

(assert (=> b!1029186 (= e!581006 call!43353)))

(assert (= (and d!123225 (not res!688421)) b!1029185))

(assert (= (and b!1029185 c!104042) b!1029184))

(assert (= (and b!1029185 (not c!104042)) b!1029186))

(assert (= (and b!1029184 res!688420) b!1029183))

(assert (= (or b!1029183 b!1029186) bm!43350))

(declare-fun m!948111 () Bool)

(assert (=> bm!43350 m!948111))

(assert (=> b!1029184 m!948095))

(declare-fun m!948113 () Bool)

(assert (=> b!1029184 m!948113))

(declare-fun m!948115 () Bool)

(assert (=> b!1029184 m!948115))

(assert (=> b!1029184 m!948095))

(declare-fun m!948117 () Bool)

(assert (=> b!1029184 m!948117))

(assert (=> b!1029185 m!948095))

(assert (=> b!1029185 m!948095))

(assert (=> b!1029185 m!948099))

(assert (=> b!1029055 d!123225))

(declare-fun b!1029195 () Bool)

(declare-fun e!581014 () (_ BitVec 32))

(declare-fun call!43356 () (_ BitVec 32))

(assert (=> b!1029195 (= e!581014 call!43356)))

(declare-fun bm!43353 () Bool)

(assert (=> bm!43353 (= call!43356 (arrayCountValidKeys!0 (_keys!11282 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31661 (_keys!11282 thiss!1427))))))

(declare-fun d!123227 () Bool)

(declare-fun lt!453106 () (_ BitVec 32))

(assert (=> d!123227 (and (bvsge lt!453106 #b00000000000000000000000000000000) (bvsle lt!453106 (bvsub (size!31661 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!581013 () (_ BitVec 32))

(assert (=> d!123227 (= lt!453106 e!581013)))

(declare-fun c!104048 () Bool)

(assert (=> d!123227 (= c!104048 (bvsge #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))))))

(assert (=> d!123227 (and (bvsle #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31661 (_keys!11282 thiss!1427)) (size!31661 (_keys!11282 thiss!1427))))))

(assert (=> d!123227 (= (arrayCountValidKeys!0 (_keys!11282 thiss!1427) #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))) lt!453106)))

(declare-fun b!1029196 () Bool)

(assert (=> b!1029196 (= e!581013 #b00000000000000000000000000000000)))

(declare-fun b!1029197 () Bool)

(assert (=> b!1029197 (= e!581013 e!581014)))

(declare-fun c!104047 () Bool)

(assert (=> b!1029197 (= c!104047 (validKeyInArray!0 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029198 () Bool)

(assert (=> b!1029198 (= e!581014 (bvadd #b00000000000000000000000000000001 call!43356))))

(assert (= (and d!123227 c!104048) b!1029196))

(assert (= (and d!123227 (not c!104048)) b!1029197))

(assert (= (and b!1029197 c!104047) b!1029198))

(assert (= (and b!1029197 (not c!104047)) b!1029195))

(assert (= (or b!1029198 b!1029195) bm!43353))

(declare-fun m!948119 () Bool)

(assert (=> bm!43353 m!948119))

(declare-fun m!948121 () Bool)

(assert (=> b!1029197 m!948121))

(assert (=> b!1029197 m!948121))

(declare-fun m!948123 () Bool)

(assert (=> b!1029197 m!948123))

(assert (=> b!1029055 d!123227))

(declare-fun b!1029241 () Bool)

(declare-fun e!581052 () Bool)

(declare-fun call!43373 () Bool)

(assert (=> b!1029241 (= e!581052 (not call!43373))))

(declare-fun bm!43368 () Bool)

(declare-fun call!43374 () ListLongMap!13679)

(declare-fun getCurrentListMapNoExtraKeys!3560 (array!64691 array!64693 (_ BitVec 32) (_ BitVec 32) V!37267 V!37267 (_ BitVec 32) Int) ListLongMap!13679)

(assert (=> bm!43368 (= call!43374 (getCurrentListMapNoExtraKeys!3560 lt!453011 lt!453015 (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun b!1029242 () Bool)

(declare-fun e!581053 () Unit!33562)

(declare-fun lt!453151 () Unit!33562)

(assert (=> b!1029242 (= e!581053 lt!453151)))

(declare-fun lt!453154 () ListLongMap!13679)

(assert (=> b!1029242 (= lt!453154 (getCurrentListMapNoExtraKeys!3560 lt!453011 lt!453015 (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!453161 () (_ BitVec 64))

(assert (=> b!1029242 (= lt!453161 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453164 () (_ BitVec 64))

(assert (=> b!1029242 (= lt!453164 (select (arr!31147 lt!453011) #b00000000000000000000000000000000))))

(declare-fun lt!453156 () Unit!33562)

(declare-fun addStillContains!619 (ListLongMap!13679 (_ BitVec 64) V!37267 (_ BitVec 64)) Unit!33562)

(assert (=> b!1029242 (= lt!453156 (addStillContains!619 lt!453154 lt!453161 (zeroValue!5931 thiss!1427) lt!453164))))

(declare-fun +!3120 (ListLongMap!13679 tuple2!15540) ListLongMap!13679)

(assert (=> b!1029242 (contains!5990 (+!3120 lt!453154 (tuple2!15541 lt!453161 (zeroValue!5931 thiss!1427))) lt!453164)))

(declare-fun lt!453162 () Unit!33562)

(assert (=> b!1029242 (= lt!453162 lt!453156)))

(declare-fun lt!453169 () ListLongMap!13679)

(assert (=> b!1029242 (= lt!453169 (getCurrentListMapNoExtraKeys!3560 lt!453011 lt!453015 (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!453152 () (_ BitVec 64))

(assert (=> b!1029242 (= lt!453152 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453160 () (_ BitVec 64))

(assert (=> b!1029242 (= lt!453160 (select (arr!31147 lt!453011) #b00000000000000000000000000000000))))

(declare-fun lt!453172 () Unit!33562)

(declare-fun addApplyDifferent!475 (ListLongMap!13679 (_ BitVec 64) V!37267 (_ BitVec 64)) Unit!33562)

(assert (=> b!1029242 (= lt!453172 (addApplyDifferent!475 lt!453169 lt!453152 (minValue!5931 thiss!1427) lt!453160))))

(declare-fun apply!909 (ListLongMap!13679 (_ BitVec 64)) V!37267)

(assert (=> b!1029242 (= (apply!909 (+!3120 lt!453169 (tuple2!15541 lt!453152 (minValue!5931 thiss!1427))) lt!453160) (apply!909 lt!453169 lt!453160))))

(declare-fun lt!453165 () Unit!33562)

(assert (=> b!1029242 (= lt!453165 lt!453172)))

(declare-fun lt!453159 () ListLongMap!13679)

(assert (=> b!1029242 (= lt!453159 (getCurrentListMapNoExtraKeys!3560 lt!453011 lt!453015 (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!453166 () (_ BitVec 64))

(assert (=> b!1029242 (= lt!453166 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453168 () (_ BitVec 64))

(assert (=> b!1029242 (= lt!453168 (select (arr!31147 lt!453011) #b00000000000000000000000000000000))))

(declare-fun lt!453163 () Unit!33562)

(assert (=> b!1029242 (= lt!453163 (addApplyDifferent!475 lt!453159 lt!453166 (zeroValue!5931 thiss!1427) lt!453168))))

(assert (=> b!1029242 (= (apply!909 (+!3120 lt!453159 (tuple2!15541 lt!453166 (zeroValue!5931 thiss!1427))) lt!453168) (apply!909 lt!453159 lt!453168))))

(declare-fun lt!453155 () Unit!33562)

(assert (=> b!1029242 (= lt!453155 lt!453163)))

(declare-fun lt!453167 () ListLongMap!13679)

(assert (=> b!1029242 (= lt!453167 (getCurrentListMapNoExtraKeys!3560 lt!453011 lt!453015 (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!453153 () (_ BitVec 64))

(assert (=> b!1029242 (= lt!453153 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453170 () (_ BitVec 64))

(assert (=> b!1029242 (= lt!453170 (select (arr!31147 lt!453011) #b00000000000000000000000000000000))))

(assert (=> b!1029242 (= lt!453151 (addApplyDifferent!475 lt!453167 lt!453153 (minValue!5931 thiss!1427) lt!453170))))

(assert (=> b!1029242 (= (apply!909 (+!3120 lt!453167 (tuple2!15541 lt!453153 (minValue!5931 thiss!1427))) lt!453170) (apply!909 lt!453167 lt!453170))))

(declare-fun b!1029243 () Bool)

(declare-fun e!581044 () Bool)

(declare-fun lt!453157 () ListLongMap!13679)

(assert (=> b!1029243 (= e!581044 (= (apply!909 lt!453157 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5931 thiss!1427)))))

(declare-fun b!1029244 () Bool)

(declare-fun e!581047 () ListLongMap!13679)

(declare-fun call!43376 () ListLongMap!13679)

(assert (=> b!1029244 (= e!581047 call!43376)))

(declare-fun bm!43369 () Bool)

(declare-fun call!43372 () ListLongMap!13679)

(declare-fun call!43377 () ListLongMap!13679)

(assert (=> bm!43369 (= call!43372 call!43377)))

(declare-fun d!123229 () Bool)

(declare-fun e!581046 () Bool)

(assert (=> d!123229 e!581046))

(declare-fun res!688442 () Bool)

(assert (=> d!123229 (=> (not res!688442) (not e!581046))))

(assert (=> d!123229 (= res!688442 (or (bvsge #b00000000000000000000000000000000 (size!31661 lt!453011)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31661 lt!453011)))))))

(declare-fun lt!453171 () ListLongMap!13679)

(assert (=> d!123229 (= lt!453157 lt!453171)))

(declare-fun lt!453158 () Unit!33562)

(assert (=> d!123229 (= lt!453158 e!581053)))

(declare-fun c!104066 () Bool)

(declare-fun e!581050 () Bool)

(assert (=> d!123229 (= c!104066 e!581050)))

(declare-fun res!688445 () Bool)

(assert (=> d!123229 (=> (not res!688445) (not e!581050))))

(assert (=> d!123229 (= res!688445 (bvslt #b00000000000000000000000000000000 (size!31661 lt!453011)))))

(declare-fun e!581041 () ListLongMap!13679)

(assert (=> d!123229 (= lt!453171 e!581041)))

(declare-fun c!104064 () Bool)

(assert (=> d!123229 (= c!104064 (and (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123229 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123229 (= (getCurrentListMap!3901 lt!453011 lt!453015 (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)) lt!453157)))

(declare-fun b!1029245 () Bool)

(assert (=> b!1029245 (= e!581050 (validKeyInArray!0 (select (arr!31147 lt!453011) #b00000000000000000000000000000000)))))

(declare-fun b!1029246 () Bool)

(declare-fun res!688441 () Bool)

(assert (=> b!1029246 (=> (not res!688441) (not e!581046))))

(declare-fun e!581051 () Bool)

(assert (=> b!1029246 (= res!688441 e!581051)))

(declare-fun c!104062 () Bool)

(assert (=> b!1029246 (= c!104062 (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1029247 () Bool)

(declare-fun e!581042 () Bool)

(assert (=> b!1029247 (= e!581042 (= (apply!909 lt!453157 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5931 thiss!1427)))))

(declare-fun b!1029248 () Bool)

(declare-fun e!581045 () Bool)

(declare-fun get!16370 (ValueCell!11444 V!37267) V!37267)

(assert (=> b!1029248 (= e!581045 (= (apply!909 lt!453157 (select (arr!31147 lt!453011) #b00000000000000000000000000000000)) (get!16370 (select (arr!31148 lt!453015) #b00000000000000000000000000000000) (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029248 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31662 lt!453015)))))

(assert (=> b!1029248 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31661 lt!453011)))))

(declare-fun b!1029249 () Bool)

(declare-fun e!581048 () Bool)

(assert (=> b!1029249 (= e!581048 (validKeyInArray!0 (select (arr!31147 lt!453011) #b00000000000000000000000000000000)))))

(declare-fun b!1029250 () Bool)

(assert (=> b!1029250 (= e!581046 e!581052)))

(declare-fun c!104065 () Bool)

(assert (=> b!1029250 (= c!104065 (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029251 () Bool)

(declare-fun res!688443 () Bool)

(assert (=> b!1029251 (=> (not res!688443) (not e!581046))))

(declare-fun e!581043 () Bool)

(assert (=> b!1029251 (= res!688443 e!581043)))

(declare-fun res!688440 () Bool)

(assert (=> b!1029251 (=> res!688440 e!581043)))

(assert (=> b!1029251 (= res!688440 (not e!581048))))

(declare-fun res!688448 () Bool)

(assert (=> b!1029251 (=> (not res!688448) (not e!581048))))

(assert (=> b!1029251 (= res!688448 (bvslt #b00000000000000000000000000000000 (size!31661 lt!453011)))))

(declare-fun b!1029252 () Bool)

(assert (=> b!1029252 (= e!581051 e!581042)))

(declare-fun res!688447 () Bool)

(declare-fun call!43371 () Bool)

(assert (=> b!1029252 (= res!688447 call!43371)))

(assert (=> b!1029252 (=> (not res!688447) (not e!581042))))

(declare-fun b!1029253 () Bool)

(declare-fun c!104063 () Bool)

(assert (=> b!1029253 (= c!104063 (and (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!581049 () ListLongMap!13679)

(assert (=> b!1029253 (= e!581049 e!581047)))

(declare-fun bm!43370 () Bool)

(declare-fun call!43375 () ListLongMap!13679)

(assert (=> bm!43370 (= call!43376 call!43375)))

(declare-fun bm!43371 () Bool)

(declare-fun c!104061 () Bool)

(assert (=> bm!43371 (= call!43377 (+!3120 (ite c!104064 call!43374 (ite c!104061 call!43375 call!43376)) (ite (or c!104064 c!104061) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(declare-fun bm!43372 () Bool)

(assert (=> bm!43372 (= call!43373 (contains!5990 lt!453157 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43373 () Bool)

(assert (=> bm!43373 (= call!43375 call!43374)))

(declare-fun b!1029254 () Bool)

(assert (=> b!1029254 (= e!581052 e!581044)))

(declare-fun res!688446 () Bool)

(assert (=> b!1029254 (= res!688446 call!43373)))

(assert (=> b!1029254 (=> (not res!688446) (not e!581044))))

(declare-fun b!1029255 () Bool)

(assert (=> b!1029255 (= e!581041 e!581049)))

(assert (=> b!1029255 (= c!104061 (and (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43374 () Bool)

(assert (=> bm!43374 (= call!43371 (contains!5990 lt!453157 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029256 () Bool)

(assert (=> b!1029256 (= e!581043 e!581045)))

(declare-fun res!688444 () Bool)

(assert (=> b!1029256 (=> (not res!688444) (not e!581045))))

(assert (=> b!1029256 (= res!688444 (contains!5990 lt!453157 (select (arr!31147 lt!453011) #b00000000000000000000000000000000)))))

(assert (=> b!1029256 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31661 lt!453011)))))

(declare-fun b!1029257 () Bool)

(assert (=> b!1029257 (= e!581041 (+!3120 call!43377 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))

(declare-fun b!1029258 () Bool)

(assert (=> b!1029258 (= e!581049 call!43372)))

(declare-fun b!1029259 () Bool)

(assert (=> b!1029259 (= e!581051 (not call!43371))))

(declare-fun b!1029260 () Bool)

(declare-fun Unit!33574 () Unit!33562)

(assert (=> b!1029260 (= e!581053 Unit!33574)))

(declare-fun b!1029261 () Bool)

(assert (=> b!1029261 (= e!581047 call!43372)))

(assert (= (and d!123229 c!104064) b!1029257))

(assert (= (and d!123229 (not c!104064)) b!1029255))

(assert (= (and b!1029255 c!104061) b!1029258))

(assert (= (and b!1029255 (not c!104061)) b!1029253))

(assert (= (and b!1029253 c!104063) b!1029261))

(assert (= (and b!1029253 (not c!104063)) b!1029244))

(assert (= (or b!1029261 b!1029244) bm!43370))

(assert (= (or b!1029258 bm!43370) bm!43373))

(assert (= (or b!1029258 b!1029261) bm!43369))

(assert (= (or b!1029257 bm!43373) bm!43368))

(assert (= (or b!1029257 bm!43369) bm!43371))

(assert (= (and d!123229 res!688445) b!1029245))

(assert (= (and d!123229 c!104066) b!1029242))

(assert (= (and d!123229 (not c!104066)) b!1029260))

(assert (= (and d!123229 res!688442) b!1029251))

(assert (= (and b!1029251 res!688448) b!1029249))

(assert (= (and b!1029251 (not res!688440)) b!1029256))

(assert (= (and b!1029256 res!688444) b!1029248))

(assert (= (and b!1029251 res!688443) b!1029246))

(assert (= (and b!1029246 c!104062) b!1029252))

(assert (= (and b!1029246 (not c!104062)) b!1029259))

(assert (= (and b!1029252 res!688447) b!1029247))

(assert (= (or b!1029252 b!1029259) bm!43374))

(assert (= (and b!1029246 res!688441) b!1029250))

(assert (= (and b!1029250 c!104065) b!1029254))

(assert (= (and b!1029250 (not c!104065)) b!1029241))

(assert (= (and b!1029254 res!688446) b!1029243))

(assert (= (or b!1029254 b!1029241) bm!43372))

(declare-fun b_lambda!15759 () Bool)

(assert (=> (not b_lambda!15759) (not b!1029248)))

(assert (=> b!1029248 t!30857))

(declare-fun b_and!32857 () Bool)

(assert (= b_and!32855 (and (=> t!30857 result!14095) b_and!32857)))

(declare-fun m!948125 () Bool)

(assert (=> b!1029248 m!948125))

(assert (=> b!1029248 m!947959))

(declare-fun m!948127 () Bool)

(assert (=> b!1029248 m!948127))

(assert (=> b!1029248 m!948095))

(declare-fun m!948129 () Bool)

(assert (=> b!1029248 m!948129))

(assert (=> b!1029248 m!947959))

(assert (=> b!1029248 m!948095))

(assert (=> b!1029248 m!948125))

(assert (=> b!1029245 m!948095))

(assert (=> b!1029245 m!948095))

(assert (=> b!1029245 m!948099))

(assert (=> b!1029256 m!948095))

(assert (=> b!1029256 m!948095))

(declare-fun m!948131 () Bool)

(assert (=> b!1029256 m!948131))

(assert (=> b!1029249 m!948095))

(assert (=> b!1029249 m!948095))

(assert (=> b!1029249 m!948099))

(declare-fun m!948133 () Bool)

(assert (=> bm!43371 m!948133))

(declare-fun m!948135 () Bool)

(assert (=> b!1029243 m!948135))

(declare-fun m!948137 () Bool)

(assert (=> b!1029257 m!948137))

(declare-fun m!948139 () Bool)

(assert (=> bm!43372 m!948139))

(declare-fun m!948141 () Bool)

(assert (=> bm!43374 m!948141))

(declare-fun m!948143 () Bool)

(assert (=> b!1029242 m!948143))

(declare-fun m!948145 () Bool)

(assert (=> b!1029242 m!948145))

(declare-fun m!948147 () Bool)

(assert (=> b!1029242 m!948147))

(declare-fun m!948149 () Bool)

(assert (=> b!1029242 m!948149))

(declare-fun m!948151 () Bool)

(assert (=> b!1029242 m!948151))

(declare-fun m!948153 () Bool)

(assert (=> b!1029242 m!948153))

(declare-fun m!948155 () Bool)

(assert (=> b!1029242 m!948155))

(assert (=> b!1029242 m!948149))

(declare-fun m!948157 () Bool)

(assert (=> b!1029242 m!948157))

(declare-fun m!948159 () Bool)

(assert (=> b!1029242 m!948159))

(declare-fun m!948161 () Bool)

(assert (=> b!1029242 m!948161))

(declare-fun m!948163 () Bool)

(assert (=> b!1029242 m!948163))

(declare-fun m!948165 () Bool)

(assert (=> b!1029242 m!948165))

(assert (=> b!1029242 m!948095))

(assert (=> b!1029242 m!948151))

(declare-fun m!948167 () Bool)

(assert (=> b!1029242 m!948167))

(assert (=> b!1029242 m!948143))

(declare-fun m!948169 () Bool)

(assert (=> b!1029242 m!948169))

(declare-fun m!948171 () Bool)

(assert (=> b!1029242 m!948171))

(assert (=> b!1029242 m!948159))

(declare-fun m!948173 () Bool)

(assert (=> b!1029242 m!948173))

(declare-fun m!948175 () Bool)

(assert (=> b!1029247 m!948175))

(assert (=> d!123229 m!948079))

(assert (=> bm!43368 m!948155))

(assert (=> b!1029055 d!123229))

(declare-fun d!123231 () Bool)

(declare-fun res!688453 () Bool)

(declare-fun e!581058 () Bool)

(assert (=> d!123231 (=> res!688453 e!581058)))

(assert (=> d!123231 (= res!688453 (= (select (arr!31147 lt!453011) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123231 (= (arrayContainsKey!0 lt!453011 key!909 #b00000000000000000000000000000000) e!581058)))

(declare-fun b!1029266 () Bool)

(declare-fun e!581059 () Bool)

(assert (=> b!1029266 (= e!581058 e!581059)))

(declare-fun res!688454 () Bool)

(assert (=> b!1029266 (=> (not res!688454) (not e!581059))))

(assert (=> b!1029266 (= res!688454 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31661 lt!453011)))))

(declare-fun b!1029267 () Bool)

(assert (=> b!1029267 (= e!581059 (arrayContainsKey!0 lt!453011 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123231 (not res!688453)) b!1029266))

(assert (= (and b!1029266 res!688454) b!1029267))

(assert (=> d!123231 m!948095))

(declare-fun m!948177 () Bool)

(assert (=> b!1029267 m!948177))

(assert (=> b!1029055 d!123231))

(declare-fun b!1029268 () Bool)

(declare-fun e!581071 () Bool)

(declare-fun call!43380 () Bool)

(assert (=> b!1029268 (= e!581071 (not call!43380))))

(declare-fun bm!43375 () Bool)

(declare-fun call!43381 () ListLongMap!13679)

(assert (=> bm!43375 (= call!43381 (getCurrentListMapNoExtraKeys!3560 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun b!1029269 () Bool)

(declare-fun e!581072 () Unit!33562)

(declare-fun lt!453173 () Unit!33562)

(assert (=> b!1029269 (= e!581072 lt!453173)))

(declare-fun lt!453176 () ListLongMap!13679)

(assert (=> b!1029269 (= lt!453176 (getCurrentListMapNoExtraKeys!3560 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!453183 () (_ BitVec 64))

(assert (=> b!1029269 (= lt!453183 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453186 () (_ BitVec 64))

(assert (=> b!1029269 (= lt!453186 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453178 () Unit!33562)

(assert (=> b!1029269 (= lt!453178 (addStillContains!619 lt!453176 lt!453183 (zeroValue!5931 thiss!1427) lt!453186))))

(assert (=> b!1029269 (contains!5990 (+!3120 lt!453176 (tuple2!15541 lt!453183 (zeroValue!5931 thiss!1427))) lt!453186)))

(declare-fun lt!453184 () Unit!33562)

(assert (=> b!1029269 (= lt!453184 lt!453178)))

(declare-fun lt!453191 () ListLongMap!13679)

(assert (=> b!1029269 (= lt!453191 (getCurrentListMapNoExtraKeys!3560 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!453174 () (_ BitVec 64))

(assert (=> b!1029269 (= lt!453174 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453182 () (_ BitVec 64))

(assert (=> b!1029269 (= lt!453182 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453194 () Unit!33562)

(assert (=> b!1029269 (= lt!453194 (addApplyDifferent!475 lt!453191 lt!453174 (minValue!5931 thiss!1427) lt!453182))))

(assert (=> b!1029269 (= (apply!909 (+!3120 lt!453191 (tuple2!15541 lt!453174 (minValue!5931 thiss!1427))) lt!453182) (apply!909 lt!453191 lt!453182))))

(declare-fun lt!453187 () Unit!33562)

(assert (=> b!1029269 (= lt!453187 lt!453194)))

(declare-fun lt!453181 () ListLongMap!13679)

(assert (=> b!1029269 (= lt!453181 (getCurrentListMapNoExtraKeys!3560 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!453188 () (_ BitVec 64))

(assert (=> b!1029269 (= lt!453188 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453190 () (_ BitVec 64))

(assert (=> b!1029269 (= lt!453190 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453185 () Unit!33562)

(assert (=> b!1029269 (= lt!453185 (addApplyDifferent!475 lt!453181 lt!453188 (zeroValue!5931 thiss!1427) lt!453190))))

(assert (=> b!1029269 (= (apply!909 (+!3120 lt!453181 (tuple2!15541 lt!453188 (zeroValue!5931 thiss!1427))) lt!453190) (apply!909 lt!453181 lt!453190))))

(declare-fun lt!453177 () Unit!33562)

(assert (=> b!1029269 (= lt!453177 lt!453185)))

(declare-fun lt!453189 () ListLongMap!13679)

(assert (=> b!1029269 (= lt!453189 (getCurrentListMapNoExtraKeys!3560 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!453175 () (_ BitVec 64))

(assert (=> b!1029269 (= lt!453175 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453192 () (_ BitVec 64))

(assert (=> b!1029269 (= lt!453192 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1029269 (= lt!453173 (addApplyDifferent!475 lt!453189 lt!453175 (minValue!5931 thiss!1427) lt!453192))))

(assert (=> b!1029269 (= (apply!909 (+!3120 lt!453189 (tuple2!15541 lt!453175 (minValue!5931 thiss!1427))) lt!453192) (apply!909 lt!453189 lt!453192))))

(declare-fun b!1029270 () Bool)

(declare-fun e!581063 () Bool)

(declare-fun lt!453179 () ListLongMap!13679)

(assert (=> b!1029270 (= e!581063 (= (apply!909 lt!453179 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5931 thiss!1427)))))

(declare-fun b!1029271 () Bool)

(declare-fun e!581066 () ListLongMap!13679)

(declare-fun call!43383 () ListLongMap!13679)

(assert (=> b!1029271 (= e!581066 call!43383)))

(declare-fun bm!43376 () Bool)

(declare-fun call!43379 () ListLongMap!13679)

(declare-fun call!43384 () ListLongMap!13679)

(assert (=> bm!43376 (= call!43379 call!43384)))

(declare-fun d!123233 () Bool)

(declare-fun e!581065 () Bool)

(assert (=> d!123233 e!581065))

(declare-fun res!688457 () Bool)

(assert (=> d!123233 (=> (not res!688457) (not e!581065))))

(assert (=> d!123233 (= res!688457 (or (bvsge #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))))))))

(declare-fun lt!453193 () ListLongMap!13679)

(assert (=> d!123233 (= lt!453179 lt!453193)))

(declare-fun lt!453180 () Unit!33562)

(assert (=> d!123233 (= lt!453180 e!581072)))

(declare-fun c!104072 () Bool)

(declare-fun e!581069 () Bool)

(assert (=> d!123233 (= c!104072 e!581069)))

(declare-fun res!688460 () Bool)

(assert (=> d!123233 (=> (not res!688460) (not e!581069))))

(assert (=> d!123233 (= res!688460 (bvslt #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))))))

(declare-fun e!581060 () ListLongMap!13679)

(assert (=> d!123233 (= lt!453193 e!581060)))

(declare-fun c!104070 () Bool)

(assert (=> d!123233 (= c!104070 (and (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123233 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123233 (= (getCurrentListMap!3901 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)) lt!453179)))

(declare-fun b!1029272 () Bool)

(assert (=> b!1029272 (= e!581069 (validKeyInArray!0 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029273 () Bool)

(declare-fun res!688456 () Bool)

(assert (=> b!1029273 (=> (not res!688456) (not e!581065))))

(declare-fun e!581070 () Bool)

(assert (=> b!1029273 (= res!688456 e!581070)))

(declare-fun c!104068 () Bool)

(assert (=> b!1029273 (= c!104068 (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1029274 () Bool)

(declare-fun e!581061 () Bool)

(assert (=> b!1029274 (= e!581061 (= (apply!909 lt!453179 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5931 thiss!1427)))))

(declare-fun b!1029275 () Bool)

(declare-fun e!581064 () Bool)

(assert (=> b!1029275 (= e!581064 (= (apply!909 lt!453179 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)) (get!16370 (select (arr!31148 (_values!6118 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029275 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31662 (_values!6118 thiss!1427))))))

(assert (=> b!1029275 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))))))

(declare-fun b!1029276 () Bool)

(declare-fun e!581067 () Bool)

(assert (=> b!1029276 (= e!581067 (validKeyInArray!0 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029277 () Bool)

(assert (=> b!1029277 (= e!581065 e!581071)))

(declare-fun c!104071 () Bool)

(assert (=> b!1029277 (= c!104071 (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029278 () Bool)

(declare-fun res!688458 () Bool)

(assert (=> b!1029278 (=> (not res!688458) (not e!581065))))

(declare-fun e!581062 () Bool)

(assert (=> b!1029278 (= res!688458 e!581062)))

(declare-fun res!688455 () Bool)

(assert (=> b!1029278 (=> res!688455 e!581062)))

(assert (=> b!1029278 (= res!688455 (not e!581067))))

(declare-fun res!688463 () Bool)

(assert (=> b!1029278 (=> (not res!688463) (not e!581067))))

(assert (=> b!1029278 (= res!688463 (bvslt #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))))))

(declare-fun b!1029279 () Bool)

(assert (=> b!1029279 (= e!581070 e!581061)))

(declare-fun res!688462 () Bool)

(declare-fun call!43378 () Bool)

(assert (=> b!1029279 (= res!688462 call!43378)))

(assert (=> b!1029279 (=> (not res!688462) (not e!581061))))

(declare-fun b!1029280 () Bool)

(declare-fun c!104069 () Bool)

(assert (=> b!1029280 (= c!104069 (and (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!581068 () ListLongMap!13679)

(assert (=> b!1029280 (= e!581068 e!581066)))

(declare-fun bm!43377 () Bool)

(declare-fun call!43382 () ListLongMap!13679)

(assert (=> bm!43377 (= call!43383 call!43382)))

(declare-fun bm!43378 () Bool)

(declare-fun c!104067 () Bool)

(assert (=> bm!43378 (= call!43384 (+!3120 (ite c!104070 call!43381 (ite c!104067 call!43382 call!43383)) (ite (or c!104070 c!104067) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(declare-fun bm!43379 () Bool)

(assert (=> bm!43379 (= call!43380 (contains!5990 lt!453179 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43380 () Bool)

(assert (=> bm!43380 (= call!43382 call!43381)))

(declare-fun b!1029281 () Bool)

(assert (=> b!1029281 (= e!581071 e!581063)))

(declare-fun res!688461 () Bool)

(assert (=> b!1029281 (= res!688461 call!43380)))

(assert (=> b!1029281 (=> (not res!688461) (not e!581063))))

(declare-fun b!1029282 () Bool)

(assert (=> b!1029282 (= e!581060 e!581068)))

(assert (=> b!1029282 (= c!104067 (and (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43381 () Bool)

(assert (=> bm!43381 (= call!43378 (contains!5990 lt!453179 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029283 () Bool)

(assert (=> b!1029283 (= e!581062 e!581064)))

(declare-fun res!688459 () Bool)

(assert (=> b!1029283 (=> (not res!688459) (not e!581064))))

(assert (=> b!1029283 (= res!688459 (contains!5990 lt!453179 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029283 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))))))

(declare-fun b!1029284 () Bool)

(assert (=> b!1029284 (= e!581060 (+!3120 call!43384 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))

(declare-fun b!1029285 () Bool)

(assert (=> b!1029285 (= e!581068 call!43379)))

(declare-fun b!1029286 () Bool)

(assert (=> b!1029286 (= e!581070 (not call!43378))))

(declare-fun b!1029287 () Bool)

(declare-fun Unit!33575 () Unit!33562)

(assert (=> b!1029287 (= e!581072 Unit!33575)))

(declare-fun b!1029288 () Bool)

(assert (=> b!1029288 (= e!581066 call!43379)))

(assert (= (and d!123233 c!104070) b!1029284))

(assert (= (and d!123233 (not c!104070)) b!1029282))

(assert (= (and b!1029282 c!104067) b!1029285))

(assert (= (and b!1029282 (not c!104067)) b!1029280))

(assert (= (and b!1029280 c!104069) b!1029288))

(assert (= (and b!1029280 (not c!104069)) b!1029271))

(assert (= (or b!1029288 b!1029271) bm!43377))

(assert (= (or b!1029285 bm!43377) bm!43380))

(assert (= (or b!1029285 b!1029288) bm!43376))

(assert (= (or b!1029284 bm!43380) bm!43375))

(assert (= (or b!1029284 bm!43376) bm!43378))

(assert (= (and d!123233 res!688460) b!1029272))

(assert (= (and d!123233 c!104072) b!1029269))

(assert (= (and d!123233 (not c!104072)) b!1029287))

(assert (= (and d!123233 res!688457) b!1029278))

(assert (= (and b!1029278 res!688463) b!1029276))

(assert (= (and b!1029278 (not res!688455)) b!1029283))

(assert (= (and b!1029283 res!688459) b!1029275))

(assert (= (and b!1029278 res!688458) b!1029273))

(assert (= (and b!1029273 c!104068) b!1029279))

(assert (= (and b!1029273 (not c!104068)) b!1029286))

(assert (= (and b!1029279 res!688462) b!1029274))

(assert (= (or b!1029279 b!1029286) bm!43381))

(assert (= (and b!1029273 res!688456) b!1029277))

(assert (= (and b!1029277 c!104071) b!1029281))

(assert (= (and b!1029277 (not c!104071)) b!1029268))

(assert (= (and b!1029281 res!688461) b!1029270))

(assert (= (or b!1029281 b!1029268) bm!43379))

(declare-fun b_lambda!15761 () Bool)

(assert (=> (not b_lambda!15761) (not b!1029275)))

(assert (=> b!1029275 t!30857))

(declare-fun b_and!32859 () Bool)

(assert (= b_and!32857 (and (=> t!30857 result!14095) b_and!32859)))

(declare-fun m!948179 () Bool)

(assert (=> b!1029275 m!948179))

(assert (=> b!1029275 m!947959))

(declare-fun m!948181 () Bool)

(assert (=> b!1029275 m!948181))

(assert (=> b!1029275 m!948121))

(declare-fun m!948183 () Bool)

(assert (=> b!1029275 m!948183))

(assert (=> b!1029275 m!947959))

(assert (=> b!1029275 m!948121))

(assert (=> b!1029275 m!948179))

(assert (=> b!1029272 m!948121))

(assert (=> b!1029272 m!948121))

(assert (=> b!1029272 m!948123))

(assert (=> b!1029283 m!948121))

(assert (=> b!1029283 m!948121))

(declare-fun m!948185 () Bool)

(assert (=> b!1029283 m!948185))

(assert (=> b!1029276 m!948121))

(assert (=> b!1029276 m!948121))

(assert (=> b!1029276 m!948123))

(declare-fun m!948187 () Bool)

(assert (=> bm!43378 m!948187))

(declare-fun m!948189 () Bool)

(assert (=> b!1029270 m!948189))

(declare-fun m!948191 () Bool)

(assert (=> b!1029284 m!948191))

(declare-fun m!948193 () Bool)

(assert (=> bm!43379 m!948193))

(declare-fun m!948195 () Bool)

(assert (=> bm!43381 m!948195))

(declare-fun m!948197 () Bool)

(assert (=> b!1029269 m!948197))

(declare-fun m!948199 () Bool)

(assert (=> b!1029269 m!948199))

(declare-fun m!948201 () Bool)

(assert (=> b!1029269 m!948201))

(declare-fun m!948203 () Bool)

(assert (=> b!1029269 m!948203))

(declare-fun m!948205 () Bool)

(assert (=> b!1029269 m!948205))

(declare-fun m!948207 () Bool)

(assert (=> b!1029269 m!948207))

(declare-fun m!948209 () Bool)

(assert (=> b!1029269 m!948209))

(assert (=> b!1029269 m!948203))

(declare-fun m!948211 () Bool)

(assert (=> b!1029269 m!948211))

(declare-fun m!948213 () Bool)

(assert (=> b!1029269 m!948213))

(declare-fun m!948215 () Bool)

(assert (=> b!1029269 m!948215))

(declare-fun m!948217 () Bool)

(assert (=> b!1029269 m!948217))

(declare-fun m!948219 () Bool)

(assert (=> b!1029269 m!948219))

(assert (=> b!1029269 m!948121))

(assert (=> b!1029269 m!948205))

(declare-fun m!948221 () Bool)

(assert (=> b!1029269 m!948221))

(assert (=> b!1029269 m!948197))

(declare-fun m!948223 () Bool)

(assert (=> b!1029269 m!948223))

(declare-fun m!948225 () Bool)

(assert (=> b!1029269 m!948225))

(assert (=> b!1029269 m!948213))

(declare-fun m!948227 () Bool)

(assert (=> b!1029269 m!948227))

(declare-fun m!948229 () Bool)

(assert (=> b!1029274 m!948229))

(assert (=> d!123233 m!948079))

(assert (=> bm!43375 m!948209))

(assert (=> b!1029055 d!123233))

(declare-fun d!123235 () Bool)

(declare-fun e!581075 () Bool)

(assert (=> d!123235 e!581075))

(declare-fun res!688466 () Bool)

(assert (=> d!123235 (=> (not res!688466) (not e!581075))))

(assert (=> d!123235 (= res!688466 (bvslt (index!40892 lt!453013) (size!31661 (_keys!11282 thiss!1427))))))

(declare-fun lt!453197 () Unit!33562)

(declare-fun choose!121 (array!64691 (_ BitVec 32) (_ BitVec 64)) Unit!33562)

(assert (=> d!123235 (= lt!453197 (choose!121 (_keys!11282 thiss!1427) (index!40892 lt!453013) key!909))))

(assert (=> d!123235 (bvsge (index!40892 lt!453013) #b00000000000000000000000000000000)))

(assert (=> d!123235 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11282 thiss!1427) (index!40892 lt!453013) key!909) lt!453197)))

(declare-fun b!1029291 () Bool)

(assert (=> b!1029291 (= e!581075 (not (arrayContainsKey!0 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!123235 res!688466) b!1029291))

(declare-fun m!948231 () Bool)

(assert (=> d!123235 m!948231))

(assert (=> b!1029291 m!947961))

(declare-fun m!948233 () Bool)

(assert (=> b!1029291 m!948233))

(assert (=> b!1029055 d!123235))

(declare-fun b!1029292 () Bool)

(declare-fun e!581077 () (_ BitVec 32))

(declare-fun call!43385 () (_ BitVec 32))

(assert (=> b!1029292 (= e!581077 call!43385)))

(declare-fun bm!43382 () Bool)

(assert (=> bm!43382 (= call!43385 (arrayCountValidKeys!0 lt!453011 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31661 (_keys!11282 thiss!1427))))))

(declare-fun d!123237 () Bool)

(declare-fun lt!453198 () (_ BitVec 32))

(assert (=> d!123237 (and (bvsge lt!453198 #b00000000000000000000000000000000) (bvsle lt!453198 (bvsub (size!31661 lt!453011) #b00000000000000000000000000000000)))))

(declare-fun e!581076 () (_ BitVec 32))

(assert (=> d!123237 (= lt!453198 e!581076)))

(declare-fun c!104074 () Bool)

(assert (=> d!123237 (= c!104074 (bvsge #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))))))

(assert (=> d!123237 (and (bvsle #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31661 (_keys!11282 thiss!1427)) (size!31661 lt!453011)))))

(assert (=> d!123237 (= (arrayCountValidKeys!0 lt!453011 #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))) lt!453198)))

(declare-fun b!1029293 () Bool)

(assert (=> b!1029293 (= e!581076 #b00000000000000000000000000000000)))

(declare-fun b!1029294 () Bool)

(assert (=> b!1029294 (= e!581076 e!581077)))

(declare-fun c!104073 () Bool)

(assert (=> b!1029294 (= c!104073 (validKeyInArray!0 (select (arr!31147 lt!453011) #b00000000000000000000000000000000)))))

(declare-fun b!1029295 () Bool)

(assert (=> b!1029295 (= e!581077 (bvadd #b00000000000000000000000000000001 call!43385))))

(assert (= (and d!123237 c!104074) b!1029293))

(assert (= (and d!123237 (not c!104074)) b!1029294))

(assert (= (and b!1029294 c!104073) b!1029295))

(assert (= (and b!1029294 (not c!104073)) b!1029292))

(assert (= (or b!1029295 b!1029292) bm!43382))

(declare-fun m!948235 () Bool)

(assert (=> bm!43382 m!948235))

(assert (=> b!1029294 m!948095))

(assert (=> b!1029294 m!948095))

(assert (=> b!1029294 m!948099))

(assert (=> b!1029055 d!123237))

(declare-fun d!123239 () Bool)

(assert (=> d!123239 (= (validMask!0 (mask!29879 (_2!7780 lt!453012))) (and (or (= (mask!29879 (_2!7780 lt!453012)) #b00000000000000000000000000000111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000000000000000000000001111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000000000000000000000011111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000000000000000000000111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000000000000000000001111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000000000000000000011111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000000000000000000111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000000000000000001111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000000000000000011111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000000000000000111111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000000000000001111111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000000000000011111111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000000000000111111111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000000000001111111111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000000000011111111111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000000000111111111111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000000001111111111111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000000011111111111111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000000111111111111111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000001111111111111111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000011111111111111111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000000111111111111111111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000001111111111111111111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000011111111111111111111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00000111111111111111111111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00001111111111111111111111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00011111111111111111111111111111) (= (mask!29879 (_2!7780 lt!453012)) #b00111111111111111111111111111111)) (bvsle (mask!29879 (_2!7780 lt!453012)) #b00111111111111111111111111111111)))))

(assert (=> b!1029055 d!123239))

(declare-fun d!123241 () Bool)

(declare-fun e!581080 () Bool)

(assert (=> d!123241 e!581080))

(declare-fun res!688469 () Bool)

(assert (=> d!123241 (=> (not res!688469) (not e!581080))))

(assert (=> d!123241 (= res!688469 (and (bvsge (index!40892 lt!453013) #b00000000000000000000000000000000) (bvslt (index!40892 lt!453013) (size!31661 (_keys!11282 thiss!1427)))))))

(declare-fun lt!453201 () Unit!33562)

(declare-fun choose!25 (array!64691 (_ BitVec 32) (_ BitVec 32)) Unit!33562)

(assert (=> d!123241 (= lt!453201 (choose!25 (_keys!11282 thiss!1427) (index!40892 lt!453013) (mask!29879 thiss!1427)))))

(assert (=> d!123241 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123241 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11282 thiss!1427) (index!40892 lt!453013) (mask!29879 thiss!1427)) lt!453201)))

(declare-fun b!1029298 () Bool)

(assert (=> b!1029298 (= e!581080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) (mask!29879 thiss!1427)))))

(assert (= (and d!123241 res!688469) b!1029298))

(declare-fun m!948237 () Bool)

(assert (=> d!123241 m!948237))

(assert (=> d!123241 m!948079))

(assert (=> b!1029298 m!947961))

(declare-fun m!948239 () Bool)

(assert (=> b!1029298 m!948239))

(assert (=> b!1029055 d!123241))

(declare-fun b!1029305 () Bool)

(declare-fun e!581086 () Bool)

(assert (=> b!1029305 (= e!581086 tp_is_empty!24295)))

(declare-fun mapIsEmpty!37883 () Bool)

(declare-fun mapRes!37883 () Bool)

(assert (=> mapIsEmpty!37883 mapRes!37883))

(declare-fun mapNonEmpty!37883 () Bool)

(declare-fun tp!72789 () Bool)

(assert (=> mapNonEmpty!37883 (= mapRes!37883 (and tp!72789 e!581086))))

(declare-fun mapValue!37883 () ValueCell!11444)

(declare-fun mapRest!37883 () (Array (_ BitVec 32) ValueCell!11444))

(declare-fun mapKey!37883 () (_ BitVec 32))

(assert (=> mapNonEmpty!37883 (= mapRest!37874 (store mapRest!37883 mapKey!37883 mapValue!37883))))

(declare-fun b!1029306 () Bool)

(declare-fun e!581085 () Bool)

(assert (=> b!1029306 (= e!581085 tp_is_empty!24295)))

(declare-fun condMapEmpty!37883 () Bool)

(declare-fun mapDefault!37883 () ValueCell!11444)

(assert (=> mapNonEmpty!37874 (= condMapEmpty!37883 (= mapRest!37874 ((as const (Array (_ BitVec 32) ValueCell!11444)) mapDefault!37883)))))

(assert (=> mapNonEmpty!37874 (= tp!72773 (and e!581085 mapRes!37883))))

(assert (= (and mapNonEmpty!37874 condMapEmpty!37883) mapIsEmpty!37883))

(assert (= (and mapNonEmpty!37874 (not condMapEmpty!37883)) mapNonEmpty!37883))

(assert (= (and mapNonEmpty!37883 ((_ is ValueCellFull!11444) mapValue!37883)) b!1029305))

(assert (= (and mapNonEmpty!37874 ((_ is ValueCellFull!11444) mapDefault!37883)) b!1029306))

(declare-fun m!948241 () Bool)

(assert (=> mapNonEmpty!37883 m!948241))

(declare-fun b_lambda!15763 () Bool)

(assert (= b_lambda!15761 (or (and b!1029059 b_free!20575) b_lambda!15763)))

(declare-fun b_lambda!15765 () Bool)

(assert (= b_lambda!15759 (or (and b!1029059 b_free!20575) b_lambda!15765)))

(declare-fun b_lambda!15767 () Bool)

(assert (= b_lambda!15757 (or (and b!1029059 b_free!20575) b_lambda!15767)))

(check-sat (not bm!43375) (not b_lambda!15765) (not mapNonEmpty!37883) (not b!1029245) (not b!1029275) (not b!1029276) (not d!123215) (not bm!43382) (not b!1029242) (not b!1029272) (not d!123217) (not bm!43379) (not d!123241) (not b!1029294) (not b!1029284) tp_is_empty!24295 (not b_lambda!15767) (not b!1029247) (not bm!43368) (not d!123209) (not b_lambda!15763) (not d!123221) (not bm!43378) (not d!123207) (not b!1029174) (not d!123233) (not b_next!20575) (not b!1029248) (not d!123229) (not bm!43381) (not b!1029274) (not b!1029185) (not b!1029171) b_and!32859 (not b!1029269) (not d!123235) (not b!1029170) (not b!1029153) (not bm!43347) (not b!1029197) (not bm!43350) (not b!1029270) (not b!1029291) (not b!1029283) (not b_lambda!15755) (not d!123223) (not b!1029156) (not b!1029243) (not bm!43374) (not b!1029267) (not bm!43371) (not b!1029184) (not b!1029256) (not bm!43353) (not b!1029298) (not b!1029150) (not b!1029249) (not b!1029151) (not b!1029123) (not b!1029257) (not b!1029121) (not bm!43372) (not b!1029169) (not b!1029122) (not b!1029141))
(check-sat b_and!32859 (not b_next!20575))
(get-model)

(declare-fun d!123243 () Bool)

(assert (=> d!123243 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1029151 d!123243))

(declare-fun b!1029331 () Bool)

(declare-fun e!581103 () ListLongMap!13679)

(declare-fun call!43388 () ListLongMap!13679)

(assert (=> b!1029331 (= e!581103 call!43388)))

(declare-fun b!1029332 () Bool)

(declare-fun e!581107 () Bool)

(declare-fun e!581106 () Bool)

(assert (=> b!1029332 (= e!581107 e!581106)))

(declare-fun c!104083 () Bool)

(assert (=> b!1029332 (= c!104083 (bvslt #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))))))

(declare-fun b!1029333 () Bool)

(declare-fun res!688481 () Bool)

(declare-fun e!581102 () Bool)

(assert (=> b!1029333 (=> (not res!688481) (not e!581102))))

(declare-fun lt!453217 () ListLongMap!13679)

(assert (=> b!1029333 (= res!688481 (not (contains!5990 lt!453217 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029334 () Bool)

(declare-fun lt!453216 () Unit!33562)

(declare-fun lt!453221 () Unit!33562)

(assert (=> b!1029334 (= lt!453216 lt!453221)))

(declare-fun lt!453220 () ListLongMap!13679)

(declare-fun lt!453222 () V!37267)

(declare-fun lt!453219 () (_ BitVec 64))

(declare-fun lt!453218 () (_ BitVec 64))

(assert (=> b!1029334 (not (contains!5990 (+!3120 lt!453220 (tuple2!15541 lt!453218 lt!453222)) lt!453219))))

(declare-fun addStillNotContains!240 (ListLongMap!13679 (_ BitVec 64) V!37267 (_ BitVec 64)) Unit!33562)

(assert (=> b!1029334 (= lt!453221 (addStillNotContains!240 lt!453220 lt!453218 lt!453222 lt!453219))))

(assert (=> b!1029334 (= lt!453219 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1029334 (= lt!453222 (get!16370 (select (arr!31148 (_values!6118 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1029334 (= lt!453218 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1029334 (= lt!453220 call!43388)))

(assert (=> b!1029334 (= e!581103 (+!3120 call!43388 (tuple2!15541 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000) (get!16370 (select (arr!31148 (_values!6118 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1029335 () Bool)

(declare-fun isEmpty!926 (ListLongMap!13679) Bool)

(assert (=> b!1029335 (= e!581106 (isEmpty!926 lt!453217))))

(declare-fun b!1029336 () Bool)

(assert (=> b!1029336 (= e!581102 e!581107)))

(declare-fun c!104085 () Bool)

(declare-fun e!581101 () Bool)

(assert (=> b!1029336 (= c!104085 e!581101)))

(declare-fun res!688478 () Bool)

(assert (=> b!1029336 (=> (not res!688478) (not e!581101))))

(assert (=> b!1029336 (= res!688478 (bvslt #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))))))

(declare-fun b!1029337 () Bool)

(assert (=> b!1029337 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))))))

(assert (=> b!1029337 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31662 (_values!6118 thiss!1427))))))

(declare-fun e!581104 () Bool)

(assert (=> b!1029337 (= e!581104 (= (apply!909 lt!453217 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)) (get!16370 (select (arr!31148 (_values!6118 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1029339 () Bool)

(assert (=> b!1029339 (= e!581107 e!581104)))

(assert (=> b!1029339 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))))))

(declare-fun res!688479 () Bool)

(assert (=> b!1029339 (= res!688479 (contains!5990 lt!453217 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029339 (=> (not res!688479) (not e!581104))))

(declare-fun bm!43385 () Bool)

(assert (=> bm!43385 (= call!43388 (getCurrentListMapNoExtraKeys!3560 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6095 thiss!1427)))))

(declare-fun b!1029340 () Bool)

(assert (=> b!1029340 (= e!581106 (= lt!453217 (getCurrentListMapNoExtraKeys!3560 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6095 thiss!1427))))))

(declare-fun b!1029341 () Bool)

(declare-fun e!581105 () ListLongMap!13679)

(assert (=> b!1029341 (= e!581105 (ListLongMap!13680 Nil!21793))))

(declare-fun b!1029342 () Bool)

(assert (=> b!1029342 (= e!581101 (validKeyInArray!0 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029342 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1029338 () Bool)

(assert (=> b!1029338 (= e!581105 e!581103)))

(declare-fun c!104084 () Bool)

(assert (=> b!1029338 (= c!104084 (validKeyInArray!0 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123245 () Bool)

(assert (=> d!123245 e!581102))

(declare-fun res!688480 () Bool)

(assert (=> d!123245 (=> (not res!688480) (not e!581102))))

(assert (=> d!123245 (= res!688480 (not (contains!5990 lt!453217 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123245 (= lt!453217 e!581105)))

(declare-fun c!104086 () Bool)

(assert (=> d!123245 (= c!104086 (bvsge #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))))))

(assert (=> d!123245 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123245 (= (getCurrentListMapNoExtraKeys!3560 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)) lt!453217)))

(assert (= (and d!123245 c!104086) b!1029341))

(assert (= (and d!123245 (not c!104086)) b!1029338))

(assert (= (and b!1029338 c!104084) b!1029334))

(assert (= (and b!1029338 (not c!104084)) b!1029331))

(assert (= (or b!1029334 b!1029331) bm!43385))

(assert (= (and d!123245 res!688480) b!1029333))

(assert (= (and b!1029333 res!688481) b!1029336))

(assert (= (and b!1029336 res!688478) b!1029342))

(assert (= (and b!1029336 c!104085) b!1029339))

(assert (= (and b!1029336 (not c!104085)) b!1029332))

(assert (= (and b!1029339 res!688479) b!1029337))

(assert (= (and b!1029332 c!104083) b!1029340))

(assert (= (and b!1029332 (not c!104083)) b!1029335))

(declare-fun b_lambda!15769 () Bool)

(assert (=> (not b_lambda!15769) (not b!1029334)))

(assert (=> b!1029334 t!30857))

(declare-fun b_and!32861 () Bool)

(assert (= b_and!32859 (and (=> t!30857 result!14095) b_and!32861)))

(declare-fun b_lambda!15771 () Bool)

(assert (=> (not b_lambda!15771) (not b!1029337)))

(assert (=> b!1029337 t!30857))

(declare-fun b_and!32863 () Bool)

(assert (= b_and!32861 (and (=> t!30857 result!14095) b_and!32863)))

(declare-fun m!948243 () Bool)

(assert (=> b!1029333 m!948243))

(declare-fun m!948245 () Bool)

(assert (=> b!1029335 m!948245))

(assert (=> b!1029337 m!948121))

(assert (=> b!1029337 m!948121))

(declare-fun m!948247 () Bool)

(assert (=> b!1029337 m!948247))

(assert (=> b!1029337 m!947959))

(assert (=> b!1029337 m!948179))

(assert (=> b!1029337 m!948179))

(assert (=> b!1029337 m!947959))

(assert (=> b!1029337 m!948181))

(declare-fun m!948249 () Bool)

(assert (=> d!123245 m!948249))

(assert (=> d!123245 m!948079))

(assert (=> b!1029339 m!948121))

(assert (=> b!1029339 m!948121))

(declare-fun m!948251 () Bool)

(assert (=> b!1029339 m!948251))

(declare-fun m!948253 () Bool)

(assert (=> b!1029340 m!948253))

(assert (=> b!1029342 m!948121))

(assert (=> b!1029342 m!948121))

(assert (=> b!1029342 m!948123))

(assert (=> b!1029334 m!948121))

(declare-fun m!948255 () Bool)

(assert (=> b!1029334 m!948255))

(declare-fun m!948257 () Bool)

(assert (=> b!1029334 m!948257))

(declare-fun m!948259 () Bool)

(assert (=> b!1029334 m!948259))

(assert (=> b!1029334 m!947959))

(declare-fun m!948261 () Bool)

(assert (=> b!1029334 m!948261))

(assert (=> b!1029334 m!948257))

(assert (=> b!1029334 m!948179))

(assert (=> b!1029334 m!948179))

(assert (=> b!1029334 m!947959))

(assert (=> b!1029334 m!948181))

(assert (=> bm!43385 m!948253))

(assert (=> b!1029338 m!948121))

(assert (=> b!1029338 m!948121))

(assert (=> b!1029338 m!948123))

(assert (=> bm!43375 d!123245))

(declare-fun d!123247 () Bool)

(declare-fun e!581112 () Bool)

(assert (=> d!123247 e!581112))

(declare-fun res!688484 () Bool)

(assert (=> d!123247 (=> res!688484 e!581112)))

(declare-fun lt!453231 () Bool)

(assert (=> d!123247 (= res!688484 (not lt!453231))))

(declare-fun lt!453232 () Bool)

(assert (=> d!123247 (= lt!453231 lt!453232)))

(declare-fun lt!453234 () Unit!33562)

(declare-fun e!581113 () Unit!33562)

(assert (=> d!123247 (= lt!453234 e!581113)))

(declare-fun c!104089 () Bool)

(assert (=> d!123247 (= c!104089 lt!453232)))

(declare-fun containsKey!561 (List!21796 (_ BitVec 64)) Bool)

(assert (=> d!123247 (= lt!453232 (containsKey!561 (toList!6855 lt!453091) key!909))))

(assert (=> d!123247 (= (contains!5990 lt!453091 key!909) lt!453231)))

(declare-fun b!1029349 () Bool)

(declare-fun lt!453233 () Unit!33562)

(assert (=> b!1029349 (= e!581113 lt!453233)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!392 (List!21796 (_ BitVec 64)) Unit!33562)

(assert (=> b!1029349 (= lt!453233 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6855 lt!453091) key!909))))

(declare-datatypes ((Option!631 0))(
  ( (Some!630 (v!14767 V!37267)) (None!629) )
))
(declare-fun isDefined!430 (Option!631) Bool)

(declare-fun getValueByKey!580 (List!21796 (_ BitVec 64)) Option!631)

(assert (=> b!1029349 (isDefined!430 (getValueByKey!580 (toList!6855 lt!453091) key!909))))

(declare-fun b!1029350 () Bool)

(declare-fun Unit!33576 () Unit!33562)

(assert (=> b!1029350 (= e!581113 Unit!33576)))

(declare-fun b!1029351 () Bool)

(assert (=> b!1029351 (= e!581112 (isDefined!430 (getValueByKey!580 (toList!6855 lt!453091) key!909)))))

(assert (= (and d!123247 c!104089) b!1029349))

(assert (= (and d!123247 (not c!104089)) b!1029350))

(assert (= (and d!123247 (not res!688484)) b!1029351))

(declare-fun m!948263 () Bool)

(assert (=> d!123247 m!948263))

(declare-fun m!948265 () Bool)

(assert (=> b!1029349 m!948265))

(declare-fun m!948267 () Bool)

(assert (=> b!1029349 m!948267))

(assert (=> b!1029349 m!948267))

(declare-fun m!948269 () Bool)

(assert (=> b!1029349 m!948269))

(assert (=> b!1029351 m!948267))

(assert (=> b!1029351 m!948267))

(assert (=> b!1029351 m!948269))

(assert (=> d!123221 d!123247))

(declare-fun b!1029362 () Bool)

(declare-fun e!581121 () List!21796)

(declare-fun $colon$colon!599 (List!21796 tuple2!15540) List!21796)

(assert (=> b!1029362 (= e!581121 ($colon$colon!599 (removeStrictlySorted!49 (t!30858 (toList!6855 (getCurrentListMap!3901 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))) key!909) (h!22999 (toList!6855 (getCurrentListMap!3901 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427))))))))

(declare-fun b!1029363 () Bool)

(declare-fun e!581122 () List!21796)

(assert (=> b!1029363 (= e!581122 (t!30858 (toList!6855 (getCurrentListMap!3901 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))))

(declare-fun b!1029364 () Bool)

(declare-fun e!581120 () Bool)

(declare-fun lt!453237 () List!21796)

(assert (=> b!1029364 (= e!581120 (not (containsKey!561 lt!453237 key!909)))))

(declare-fun d!123249 () Bool)

(assert (=> d!123249 e!581120))

(declare-fun res!688487 () Bool)

(assert (=> d!123249 (=> (not res!688487) (not e!581120))))

(declare-fun isStrictlySorted!702 (List!21796) Bool)

(assert (=> d!123249 (= res!688487 (isStrictlySorted!702 lt!453237))))

(assert (=> d!123249 (= lt!453237 e!581122)))

(declare-fun c!104094 () Bool)

(assert (=> d!123249 (= c!104094 (and ((_ is Cons!21792) (toList!6855 (getCurrentListMap!3901 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))) (= (_1!7781 (h!22999 (toList!6855 (getCurrentListMap!3901 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427))))) key!909)))))

(assert (=> d!123249 (isStrictlySorted!702 (toList!6855 (getCurrentListMap!3901 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427))))))

(assert (=> d!123249 (= (removeStrictlySorted!49 (toList!6855 (getCurrentListMap!3901 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427))) key!909) lt!453237)))

(declare-fun b!1029365 () Bool)

(assert (=> b!1029365 (= e!581121 Nil!21793)))

(declare-fun b!1029366 () Bool)

(assert (=> b!1029366 (= e!581122 e!581121)))

(declare-fun c!104095 () Bool)

(assert (=> b!1029366 (= c!104095 (and ((_ is Cons!21792) (toList!6855 (getCurrentListMap!3901 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))) (not (= (_1!7781 (h!22999 (toList!6855 (getCurrentListMap!3901 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427))))) key!909))))))

(assert (= (and d!123249 c!104094) b!1029363))

(assert (= (and d!123249 (not c!104094)) b!1029366))

(assert (= (and b!1029366 c!104095) b!1029362))

(assert (= (and b!1029366 (not c!104095)) b!1029365))

(assert (= (and d!123249 res!688487) b!1029364))

(declare-fun m!948271 () Bool)

(assert (=> b!1029362 m!948271))

(assert (=> b!1029362 m!948271))

(declare-fun m!948273 () Bool)

(assert (=> b!1029362 m!948273))

(declare-fun m!948275 () Bool)

(assert (=> b!1029364 m!948275))

(declare-fun m!948277 () Bool)

(assert (=> d!123249 m!948277))

(declare-fun m!948279 () Bool)

(assert (=> d!123249 m!948279))

(assert (=> d!123221 d!123249))

(declare-fun d!123251 () Bool)

(declare-fun e!581123 () Bool)

(assert (=> d!123251 e!581123))

(declare-fun res!688488 () Bool)

(assert (=> d!123251 (=> res!688488 e!581123)))

(declare-fun lt!453238 () Bool)

(assert (=> d!123251 (= res!688488 (not lt!453238))))

(declare-fun lt!453239 () Bool)

(assert (=> d!123251 (= lt!453238 lt!453239)))

(declare-fun lt!453241 () Unit!33562)

(declare-fun e!581124 () Unit!33562)

(assert (=> d!123251 (= lt!453241 e!581124)))

(declare-fun c!104096 () Bool)

(assert (=> d!123251 (= c!104096 lt!453239)))

(assert (=> d!123251 (= lt!453239 (containsKey!561 (toList!6855 lt!453179) (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123251 (= (contains!5990 lt!453179 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)) lt!453238)))

(declare-fun b!1029367 () Bool)

(declare-fun lt!453240 () Unit!33562)

(assert (=> b!1029367 (= e!581124 lt!453240)))

(assert (=> b!1029367 (= lt!453240 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6855 lt!453179) (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1029367 (isDefined!430 (getValueByKey!580 (toList!6855 lt!453179) (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029368 () Bool)

(declare-fun Unit!33577 () Unit!33562)

(assert (=> b!1029368 (= e!581124 Unit!33577)))

(declare-fun b!1029369 () Bool)

(assert (=> b!1029369 (= e!581123 (isDefined!430 (getValueByKey!580 (toList!6855 lt!453179) (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!123251 c!104096) b!1029367))

(assert (= (and d!123251 (not c!104096)) b!1029368))

(assert (= (and d!123251 (not res!688488)) b!1029369))

(assert (=> d!123251 m!948121))

(declare-fun m!948281 () Bool)

(assert (=> d!123251 m!948281))

(assert (=> b!1029367 m!948121))

(declare-fun m!948283 () Bool)

(assert (=> b!1029367 m!948283))

(assert (=> b!1029367 m!948121))

(declare-fun m!948285 () Bool)

(assert (=> b!1029367 m!948285))

(assert (=> b!1029367 m!948285))

(declare-fun m!948287 () Bool)

(assert (=> b!1029367 m!948287))

(assert (=> b!1029369 m!948121))

(assert (=> b!1029369 m!948285))

(assert (=> b!1029369 m!948285))

(assert (=> b!1029369 m!948287))

(assert (=> b!1029283 d!123251))

(declare-fun b!1029370 () Bool)

(declare-fun e!581127 () Bool)

(declare-fun call!43389 () Bool)

(assert (=> b!1029370 (= e!581127 call!43389)))

(declare-fun d!123253 () Bool)

(declare-fun res!688490 () Bool)

(declare-fun e!581126 () Bool)

(assert (=> d!123253 (=> res!688490 e!581126)))

(assert (=> d!123253 (= res!688490 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31661 lt!453011)))))

(assert (=> d!123253 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!453011 (mask!29879 thiss!1427)) e!581126)))

(declare-fun bm!43386 () Bool)

(assert (=> bm!43386 (= call!43389 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!453011 (mask!29879 thiss!1427)))))

(declare-fun b!1029371 () Bool)

(declare-fun e!581125 () Bool)

(assert (=> b!1029371 (= e!581125 e!581127)))

(declare-fun lt!453244 () (_ BitVec 64))

(assert (=> b!1029371 (= lt!453244 (select (arr!31147 lt!453011) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!453243 () Unit!33562)

(assert (=> b!1029371 (= lt!453243 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453011 lt!453244 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1029371 (arrayContainsKey!0 lt!453011 lt!453244 #b00000000000000000000000000000000)))

(declare-fun lt!453242 () Unit!33562)

(assert (=> b!1029371 (= lt!453242 lt!453243)))

(declare-fun res!688489 () Bool)

(assert (=> b!1029371 (= res!688489 (= (seekEntryOrOpen!0 (select (arr!31147 lt!453011) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!453011 (mask!29879 thiss!1427)) (Found!9630 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1029371 (=> (not res!688489) (not e!581127))))

(declare-fun b!1029372 () Bool)

(assert (=> b!1029372 (= e!581126 e!581125)))

(declare-fun c!104097 () Bool)

(assert (=> b!1029372 (= c!104097 (validKeyInArray!0 (select (arr!31147 lt!453011) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1029373 () Bool)

(assert (=> b!1029373 (= e!581125 call!43389)))

(assert (= (and d!123253 (not res!688490)) b!1029372))

(assert (= (and b!1029372 c!104097) b!1029371))

(assert (= (and b!1029372 (not c!104097)) b!1029373))

(assert (= (and b!1029371 res!688489) b!1029370))

(assert (= (or b!1029370 b!1029373) bm!43386))

(declare-fun m!948289 () Bool)

(assert (=> bm!43386 m!948289))

(declare-fun m!948291 () Bool)

(assert (=> b!1029371 m!948291))

(declare-fun m!948293 () Bool)

(assert (=> b!1029371 m!948293))

(declare-fun m!948295 () Bool)

(assert (=> b!1029371 m!948295))

(assert (=> b!1029371 m!948291))

(declare-fun m!948297 () Bool)

(assert (=> b!1029371 m!948297))

(assert (=> b!1029372 m!948291))

(assert (=> b!1029372 m!948291))

(declare-fun m!948299 () Bool)

(assert (=> b!1029372 m!948299))

(assert (=> bm!43350 d!123253))

(declare-fun d!123255 () Bool)

(assert (=> d!123255 (not (arrayContainsKey!0 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!123255 true))

(declare-fun _$59!11 () Unit!33562)

(assert (=> d!123255 (= (choose!121 (_keys!11282 thiss!1427) (index!40892 lt!453013) key!909) _$59!11)))

(declare-fun bs!30015 () Bool)

(assert (= bs!30015 d!123255))

(assert (=> bs!30015 m!947961))

(assert (=> bs!30015 m!948233))

(assert (=> d!123235 d!123255))

(declare-fun b!1029374 () Bool)

(declare-fun e!581129 () (_ BitVec 32))

(declare-fun call!43390 () (_ BitVec 32))

(assert (=> b!1029374 (= e!581129 call!43390)))

(declare-fun bm!43387 () Bool)

(assert (=> bm!43387 (= call!43390 (arrayCountValidKeys!0 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31661 (_keys!11282 thiss!1427))))))

(declare-fun d!123257 () Bool)

(declare-fun lt!453245 () (_ BitVec 32))

(assert (=> d!123257 (and (bvsge lt!453245 #b00000000000000000000000000000000) (bvsle lt!453245 (bvsub (size!31661 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun e!581128 () (_ BitVec 32))

(assert (=> d!123257 (= lt!453245 e!581128)))

(declare-fun c!104099 () Bool)

(assert (=> d!123257 (= c!104099 (bvsge #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))))))

(assert (=> d!123257 (and (bvsle #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31661 (_keys!11282 thiss!1427)) (size!31661 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))))))))

(assert (=> d!123257 (= (arrayCountValidKeys!0 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))) lt!453245)))

(declare-fun b!1029375 () Bool)

(assert (=> b!1029375 (= e!581128 #b00000000000000000000000000000000)))

(declare-fun b!1029376 () Bool)

(assert (=> b!1029376 (= e!581128 e!581129)))

(declare-fun c!104098 () Bool)

(assert (=> b!1029376 (= c!104098 (validKeyInArray!0 (select (arr!31147 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1029377 () Bool)

(assert (=> b!1029377 (= e!581129 (bvadd #b00000000000000000000000000000001 call!43390))))

(assert (= (and d!123257 c!104099) b!1029375))

(assert (= (and d!123257 (not c!104099)) b!1029376))

(assert (= (and b!1029376 c!104098) b!1029377))

(assert (= (and b!1029376 (not c!104098)) b!1029374))

(assert (= (or b!1029377 b!1029374) bm!43387))

(declare-fun m!948301 () Bool)

(assert (=> bm!43387 m!948301))

(declare-fun m!948303 () Bool)

(assert (=> b!1029376 m!948303))

(assert (=> b!1029376 m!948303))

(declare-fun m!948305 () Bool)

(assert (=> b!1029376 m!948305))

(assert (=> b!1029153 d!123257))

(assert (=> b!1029153 d!123227))

(declare-fun d!123259 () Bool)

(assert (=> d!123259 (= (validKeyInArray!0 (select (arr!31147 lt!453011) #b00000000000000000000000000000000)) (and (not (= (select (arr!31147 lt!453011) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31147 lt!453011) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029185 d!123259))

(declare-fun d!123261 () Bool)

(assert (=> d!123261 (= (validMask!0 (mask!29879 thiss!1427)) (and (or (= (mask!29879 thiss!1427) #b00000000000000000000000000000111) (= (mask!29879 thiss!1427) #b00000000000000000000000000001111) (= (mask!29879 thiss!1427) #b00000000000000000000000000011111) (= (mask!29879 thiss!1427) #b00000000000000000000000000111111) (= (mask!29879 thiss!1427) #b00000000000000000000000001111111) (= (mask!29879 thiss!1427) #b00000000000000000000000011111111) (= (mask!29879 thiss!1427) #b00000000000000000000000111111111) (= (mask!29879 thiss!1427) #b00000000000000000000001111111111) (= (mask!29879 thiss!1427) #b00000000000000000000011111111111) (= (mask!29879 thiss!1427) #b00000000000000000000111111111111) (= (mask!29879 thiss!1427) #b00000000000000000001111111111111) (= (mask!29879 thiss!1427) #b00000000000000000011111111111111) (= (mask!29879 thiss!1427) #b00000000000000000111111111111111) (= (mask!29879 thiss!1427) #b00000000000000001111111111111111) (= (mask!29879 thiss!1427) #b00000000000000011111111111111111) (= (mask!29879 thiss!1427) #b00000000000000111111111111111111) (= (mask!29879 thiss!1427) #b00000000000001111111111111111111) (= (mask!29879 thiss!1427) #b00000000000011111111111111111111) (= (mask!29879 thiss!1427) #b00000000000111111111111111111111) (= (mask!29879 thiss!1427) #b00000000001111111111111111111111) (= (mask!29879 thiss!1427) #b00000000011111111111111111111111) (= (mask!29879 thiss!1427) #b00000000111111111111111111111111) (= (mask!29879 thiss!1427) #b00000001111111111111111111111111) (= (mask!29879 thiss!1427) #b00000011111111111111111111111111) (= (mask!29879 thiss!1427) #b00000111111111111111111111111111) (= (mask!29879 thiss!1427) #b00001111111111111111111111111111) (= (mask!29879 thiss!1427) #b00011111111111111111111111111111) (= (mask!29879 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29879 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!123229 d!123261))

(assert (=> b!1029121 d!123227))

(declare-fun d!123263 () Bool)

(declare-fun res!688491 () Bool)

(declare-fun e!581130 () Bool)

(assert (=> d!123263 (=> res!688491 e!581130)))

(assert (=> d!123263 (= res!688491 (= (select (arr!31147 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123263 (= (arrayContainsKey!0 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) key!909 #b00000000000000000000000000000000) e!581130)))

(declare-fun b!1029378 () Bool)

(declare-fun e!581131 () Bool)

(assert (=> b!1029378 (= e!581130 e!581131)))

(declare-fun res!688492 () Bool)

(assert (=> b!1029378 (=> (not res!688492) (not e!581131))))

(assert (=> b!1029378 (= res!688492 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31661 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))))))))

(declare-fun b!1029379 () Bool)

(assert (=> b!1029379 (= e!581131 (arrayContainsKey!0 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123263 (not res!688491)) b!1029378))

(assert (= (and b!1029378 res!688492) b!1029379))

(assert (=> d!123263 m!948303))

(declare-fun m!948307 () Bool)

(assert (=> b!1029379 m!948307))

(assert (=> b!1029291 d!123263))

(declare-fun d!123265 () Bool)

(declare-fun e!581134 () Bool)

(assert (=> d!123265 e!581134))

(declare-fun res!688497 () Bool)

(assert (=> d!123265 (=> (not res!688497) (not e!581134))))

(declare-fun lt!453256 () ListLongMap!13679)

(assert (=> d!123265 (= res!688497 (contains!5990 lt!453256 (_1!7781 (ite (or c!104064 c!104061) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(declare-fun lt!453255 () List!21796)

(assert (=> d!123265 (= lt!453256 (ListLongMap!13680 lt!453255))))

(declare-fun lt!453257 () Unit!33562)

(declare-fun lt!453254 () Unit!33562)

(assert (=> d!123265 (= lt!453257 lt!453254)))

(assert (=> d!123265 (= (getValueByKey!580 lt!453255 (_1!7781 (ite (or c!104064 c!104061) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))) (Some!630 (_2!7781 (ite (or c!104064 c!104061) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!276 (List!21796 (_ BitVec 64) V!37267) Unit!33562)

(assert (=> d!123265 (= lt!453254 (lemmaContainsTupThenGetReturnValue!276 lt!453255 (_1!7781 (ite (or c!104064 c!104061) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) (_2!7781 (ite (or c!104064 c!104061) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(declare-fun insertStrictlySorted!369 (List!21796 (_ BitVec 64) V!37267) List!21796)

(assert (=> d!123265 (= lt!453255 (insertStrictlySorted!369 (toList!6855 (ite c!104064 call!43374 (ite c!104061 call!43375 call!43376))) (_1!7781 (ite (or c!104064 c!104061) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) (_2!7781 (ite (or c!104064 c!104061) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(assert (=> d!123265 (= (+!3120 (ite c!104064 call!43374 (ite c!104061 call!43375 call!43376)) (ite (or c!104064 c!104061) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) lt!453256)))

(declare-fun b!1029384 () Bool)

(declare-fun res!688498 () Bool)

(assert (=> b!1029384 (=> (not res!688498) (not e!581134))))

(assert (=> b!1029384 (= res!688498 (= (getValueByKey!580 (toList!6855 lt!453256) (_1!7781 (ite (or c!104064 c!104061) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))) (Some!630 (_2!7781 (ite (or c!104064 c!104061) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))))

(declare-fun b!1029385 () Bool)

(declare-fun contains!5991 (List!21796 tuple2!15540) Bool)

(assert (=> b!1029385 (= e!581134 (contains!5991 (toList!6855 lt!453256) (ite (or c!104064 c!104061) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(assert (= (and d!123265 res!688497) b!1029384))

(assert (= (and b!1029384 res!688498) b!1029385))

(declare-fun m!948309 () Bool)

(assert (=> d!123265 m!948309))

(declare-fun m!948311 () Bool)

(assert (=> d!123265 m!948311))

(declare-fun m!948313 () Bool)

(assert (=> d!123265 m!948313))

(declare-fun m!948315 () Bool)

(assert (=> d!123265 m!948315))

(declare-fun m!948317 () Bool)

(assert (=> b!1029384 m!948317))

(declare-fun m!948319 () Bool)

(assert (=> b!1029385 m!948319))

(assert (=> bm!43371 d!123265))

(declare-fun b!1029386 () Bool)

(declare-fun e!581138 () Bool)

(declare-fun call!43391 () Bool)

(assert (=> b!1029386 (= e!581138 call!43391)))

(declare-fun b!1029387 () Bool)

(assert (=> b!1029387 (= e!581138 call!43391)))

(declare-fun bm!43388 () Bool)

(declare-fun c!104100 () Bool)

(assert (=> bm!43388 (= call!43391 (arrayNoDuplicates!0 (_keys!11282 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104100 (Cons!21793 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000) Nil!21794) Nil!21794)))))

(declare-fun b!1029388 () Bool)

(declare-fun e!581136 () Bool)

(assert (=> b!1029388 (= e!581136 e!581138)))

(assert (=> b!1029388 (= c!104100 (validKeyInArray!0 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029389 () Bool)

(declare-fun e!581137 () Bool)

(assert (=> b!1029389 (= e!581137 e!581136)))

(declare-fun res!688499 () Bool)

(assert (=> b!1029389 (=> (not res!688499) (not e!581136))))

(declare-fun e!581135 () Bool)

(assert (=> b!1029389 (= res!688499 (not e!581135))))

(declare-fun res!688501 () Bool)

(assert (=> b!1029389 (=> (not res!688501) (not e!581135))))

(assert (=> b!1029389 (= res!688501 (validKeyInArray!0 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123267 () Bool)

(declare-fun res!688500 () Bool)

(assert (=> d!123267 (=> res!688500 e!581137)))

(assert (=> d!123267 (= res!688500 (bvsge #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))))))

(assert (=> d!123267 (= (arrayNoDuplicates!0 (_keys!11282 thiss!1427) #b00000000000000000000000000000000 Nil!21794) e!581137)))

(declare-fun b!1029390 () Bool)

(assert (=> b!1029390 (= e!581135 (contains!5989 Nil!21794 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123267 (not res!688500)) b!1029389))

(assert (= (and b!1029389 res!688501) b!1029390))

(assert (= (and b!1029389 res!688499) b!1029388))

(assert (= (and b!1029388 c!104100) b!1029386))

(assert (= (and b!1029388 (not c!104100)) b!1029387))

(assert (= (or b!1029386 b!1029387) bm!43388))

(assert (=> bm!43388 m!948121))

(declare-fun m!948321 () Bool)

(assert (=> bm!43388 m!948321))

(assert (=> b!1029388 m!948121))

(assert (=> b!1029388 m!948121))

(assert (=> b!1029388 m!948123))

(assert (=> b!1029389 m!948121))

(assert (=> b!1029389 m!948121))

(assert (=> b!1029389 m!948123))

(assert (=> b!1029390 m!948121))

(assert (=> b!1029390 m!948121))

(declare-fun m!948323 () Bool)

(assert (=> b!1029390 m!948323))

(assert (=> b!1029123 d!123267))

(declare-fun d!123269 () Bool)

(declare-fun e!581139 () Bool)

(assert (=> d!123269 e!581139))

(declare-fun res!688502 () Bool)

(assert (=> d!123269 (=> (not res!688502) (not e!581139))))

(declare-fun lt!453260 () ListLongMap!13679)

(assert (=> d!123269 (= res!688502 (contains!5990 lt!453260 (_1!7781 (ite (or c!104070 c!104067) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(declare-fun lt!453259 () List!21796)

(assert (=> d!123269 (= lt!453260 (ListLongMap!13680 lt!453259))))

(declare-fun lt!453261 () Unit!33562)

(declare-fun lt!453258 () Unit!33562)

(assert (=> d!123269 (= lt!453261 lt!453258)))

(assert (=> d!123269 (= (getValueByKey!580 lt!453259 (_1!7781 (ite (or c!104070 c!104067) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))) (Some!630 (_2!7781 (ite (or c!104070 c!104067) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(assert (=> d!123269 (= lt!453258 (lemmaContainsTupThenGetReturnValue!276 lt!453259 (_1!7781 (ite (or c!104070 c!104067) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) (_2!7781 (ite (or c!104070 c!104067) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(assert (=> d!123269 (= lt!453259 (insertStrictlySorted!369 (toList!6855 (ite c!104070 call!43381 (ite c!104067 call!43382 call!43383))) (_1!7781 (ite (or c!104070 c!104067) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) (_2!7781 (ite (or c!104070 c!104067) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(assert (=> d!123269 (= (+!3120 (ite c!104070 call!43381 (ite c!104067 call!43382 call!43383)) (ite (or c!104070 c!104067) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) lt!453260)))

(declare-fun b!1029391 () Bool)

(declare-fun res!688503 () Bool)

(assert (=> b!1029391 (=> (not res!688503) (not e!581139))))

(assert (=> b!1029391 (= res!688503 (= (getValueByKey!580 (toList!6855 lt!453260) (_1!7781 (ite (or c!104070 c!104067) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))) (Some!630 (_2!7781 (ite (or c!104070 c!104067) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))))

(declare-fun b!1029392 () Bool)

(assert (=> b!1029392 (= e!581139 (contains!5991 (toList!6855 lt!453260) (ite (or c!104070 c!104067) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(assert (= (and d!123269 res!688502) b!1029391))

(assert (= (and b!1029391 res!688503) b!1029392))

(declare-fun m!948325 () Bool)

(assert (=> d!123269 m!948325))

(declare-fun m!948327 () Bool)

(assert (=> d!123269 m!948327))

(declare-fun m!948329 () Bool)

(assert (=> d!123269 m!948329))

(declare-fun m!948331 () Bool)

(assert (=> d!123269 m!948331))

(declare-fun m!948333 () Bool)

(assert (=> b!1029391 m!948333))

(declare-fun m!948335 () Bool)

(assert (=> b!1029392 m!948335))

(assert (=> bm!43378 d!123269))

(declare-fun d!123271 () Bool)

(assert (=> d!123271 (= (arrayCountValidKeys!0 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11282 thiss!1427) #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!123271 true))

(declare-fun _$79!8 () Unit!33562)

(assert (=> d!123271 (= (choose!82 (_keys!11282 thiss!1427) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!8)))

(declare-fun bs!30016 () Bool)

(assert (= bs!30016 d!123271))

(assert (=> bs!30016 m!947961))

(assert (=> bs!30016 m!948087))

(assert (=> bs!30016 m!947947))

(assert (=> d!123215 d!123271))

(declare-fun b!1029393 () Bool)

(declare-fun e!581143 () Bool)

(declare-fun call!43392 () Bool)

(assert (=> b!1029393 (= e!581143 call!43392)))

(declare-fun b!1029394 () Bool)

(assert (=> b!1029394 (= e!581143 call!43392)))

(declare-fun c!104101 () Bool)

(declare-fun bm!43389 () Bool)

(assert (=> bm!43389 (= call!43392 (arrayNoDuplicates!0 lt!453011 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!104101 (Cons!21793 (select (arr!31147 lt!453011) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!104039 (Cons!21793 (select (arr!31147 lt!453011) #b00000000000000000000000000000000) Nil!21794) Nil!21794)) (ite c!104039 (Cons!21793 (select (arr!31147 lt!453011) #b00000000000000000000000000000000) Nil!21794) Nil!21794))))))

(declare-fun b!1029395 () Bool)

(declare-fun e!581141 () Bool)

(assert (=> b!1029395 (= e!581141 e!581143)))

(assert (=> b!1029395 (= c!104101 (validKeyInArray!0 (select (arr!31147 lt!453011) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1029396 () Bool)

(declare-fun e!581142 () Bool)

(assert (=> b!1029396 (= e!581142 e!581141)))

(declare-fun res!688504 () Bool)

(assert (=> b!1029396 (=> (not res!688504) (not e!581141))))

(declare-fun e!581140 () Bool)

(assert (=> b!1029396 (= res!688504 (not e!581140))))

(declare-fun res!688506 () Bool)

(assert (=> b!1029396 (=> (not res!688506) (not e!581140))))

(assert (=> b!1029396 (= res!688506 (validKeyInArray!0 (select (arr!31147 lt!453011) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!123273 () Bool)

(declare-fun res!688505 () Bool)

(assert (=> d!123273 (=> res!688505 e!581142)))

(assert (=> d!123273 (= res!688505 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31661 lt!453011)))))

(assert (=> d!123273 (= (arrayNoDuplicates!0 lt!453011 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104039 (Cons!21793 (select (arr!31147 lt!453011) #b00000000000000000000000000000000) Nil!21794) Nil!21794)) e!581142)))

(declare-fun b!1029397 () Bool)

(assert (=> b!1029397 (= e!581140 (contains!5989 (ite c!104039 (Cons!21793 (select (arr!31147 lt!453011) #b00000000000000000000000000000000) Nil!21794) Nil!21794) (select (arr!31147 lt!453011) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!123273 (not res!688505)) b!1029396))

(assert (= (and b!1029396 res!688506) b!1029397))

(assert (= (and b!1029396 res!688504) b!1029395))

(assert (= (and b!1029395 c!104101) b!1029393))

(assert (= (and b!1029395 (not c!104101)) b!1029394))

(assert (= (or b!1029393 b!1029394) bm!43389))

(assert (=> bm!43389 m!948291))

(declare-fun m!948337 () Bool)

(assert (=> bm!43389 m!948337))

(assert (=> b!1029395 m!948291))

(assert (=> b!1029395 m!948291))

(assert (=> b!1029395 m!948299))

(assert (=> b!1029396 m!948291))

(assert (=> b!1029396 m!948291))

(assert (=> b!1029396 m!948299))

(assert (=> b!1029397 m!948291))

(assert (=> b!1029397 m!948291))

(declare-fun m!948339 () Bool)

(assert (=> b!1029397 m!948339))

(assert (=> bm!43347 d!123273))

(assert (=> b!1029294 d!123259))

(declare-fun d!123275 () Bool)

(declare-fun lt!453264 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!511 (List!21797) (InoxSet (_ BitVec 64)))

(assert (=> d!123275 (= lt!453264 (select (content!511 Nil!21794) (select (arr!31147 lt!453011) #b00000000000000000000000000000000)))))

(declare-fun e!581149 () Bool)

(assert (=> d!123275 (= lt!453264 e!581149)))

(declare-fun res!688511 () Bool)

(assert (=> d!123275 (=> (not res!688511) (not e!581149))))

(assert (=> d!123275 (= res!688511 ((_ is Cons!21793) Nil!21794))))

(assert (=> d!123275 (= (contains!5989 Nil!21794 (select (arr!31147 lt!453011) #b00000000000000000000000000000000)) lt!453264)))

(declare-fun b!1029402 () Bool)

(declare-fun e!581148 () Bool)

(assert (=> b!1029402 (= e!581149 e!581148)))

(declare-fun res!688512 () Bool)

(assert (=> b!1029402 (=> res!688512 e!581148)))

(assert (=> b!1029402 (= res!688512 (= (h!23000 Nil!21794) (select (arr!31147 lt!453011) #b00000000000000000000000000000000)))))

(declare-fun b!1029403 () Bool)

(assert (=> b!1029403 (= e!581148 (contains!5989 (t!30859 Nil!21794) (select (arr!31147 lt!453011) #b00000000000000000000000000000000)))))

(assert (= (and d!123275 res!688511) b!1029402))

(assert (= (and b!1029402 (not res!688512)) b!1029403))

(declare-fun m!948341 () Bool)

(assert (=> d!123275 m!948341))

(assert (=> d!123275 m!948095))

(declare-fun m!948343 () Bool)

(assert (=> d!123275 m!948343))

(assert (=> b!1029403 m!948095))

(declare-fun m!948345 () Bool)

(assert (=> b!1029403 m!948345))

(assert (=> b!1029171 d!123275))

(declare-fun d!123277 () Bool)

(declare-fun get!16371 (Option!631) V!37267)

(assert (=> d!123277 (= (apply!909 lt!453157 (select (arr!31147 lt!453011) #b00000000000000000000000000000000)) (get!16371 (getValueByKey!580 (toList!6855 lt!453157) (select (arr!31147 lt!453011) #b00000000000000000000000000000000))))))

(declare-fun bs!30017 () Bool)

(assert (= bs!30017 d!123277))

(assert (=> bs!30017 m!948095))

(declare-fun m!948347 () Bool)

(assert (=> bs!30017 m!948347))

(assert (=> bs!30017 m!948347))

(declare-fun m!948349 () Bool)

(assert (=> bs!30017 m!948349))

(assert (=> b!1029248 d!123277))

(declare-fun d!123279 () Bool)

(declare-fun c!104104 () Bool)

(assert (=> d!123279 (= c!104104 ((_ is ValueCellFull!11444) (select (arr!31148 lt!453015) #b00000000000000000000000000000000)))))

(declare-fun e!581152 () V!37267)

(assert (=> d!123279 (= (get!16370 (select (arr!31148 lt!453015) #b00000000000000000000000000000000) (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!581152)))

(declare-fun b!1029408 () Bool)

(declare-fun get!16372 (ValueCell!11444 V!37267) V!37267)

(assert (=> b!1029408 (= e!581152 (get!16372 (select (arr!31148 lt!453015) #b00000000000000000000000000000000) (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029409 () Bool)

(declare-fun get!16373 (ValueCell!11444 V!37267) V!37267)

(assert (=> b!1029409 (= e!581152 (get!16373 (select (arr!31148 lt!453015) #b00000000000000000000000000000000) (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123279 c!104104) b!1029408))

(assert (= (and d!123279 (not c!104104)) b!1029409))

(assert (=> b!1029408 m!948125))

(assert (=> b!1029408 m!947959))

(declare-fun m!948351 () Bool)

(assert (=> b!1029408 m!948351))

(assert (=> b!1029409 m!948125))

(assert (=> b!1029409 m!947959))

(declare-fun m!948353 () Bool)

(assert (=> b!1029409 m!948353))

(assert (=> b!1029248 d!123279))

(declare-fun d!123281 () Bool)

(assert (=> d!123281 (= (validKeyInArray!0 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029197 d!123281))

(declare-fun b!1029410 () Bool)

(declare-fun e!581154 () (_ BitVec 32))

(declare-fun call!43393 () (_ BitVec 32))

(assert (=> b!1029410 (= e!581154 call!43393)))

(declare-fun bm!43390 () Bool)

(assert (=> bm!43390 (= call!43393 (arrayCountValidKeys!0 lt!453011 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31661 (_keys!11282 thiss!1427))))))

(declare-fun d!123283 () Bool)

(declare-fun lt!453265 () (_ BitVec 32))

(assert (=> d!123283 (and (bvsge lt!453265 #b00000000000000000000000000000000) (bvsle lt!453265 (bvsub (size!31661 lt!453011) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!581153 () (_ BitVec 32))

(assert (=> d!123283 (= lt!453265 e!581153)))

(declare-fun c!104106 () Bool)

(assert (=> d!123283 (= c!104106 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31661 (_keys!11282 thiss!1427))))))

(assert (=> d!123283 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31661 (_keys!11282 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31661 (_keys!11282 thiss!1427)) (size!31661 lt!453011)))))

(assert (=> d!123283 (= (arrayCountValidKeys!0 lt!453011 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31661 (_keys!11282 thiss!1427))) lt!453265)))

(declare-fun b!1029411 () Bool)

(assert (=> b!1029411 (= e!581153 #b00000000000000000000000000000000)))

(declare-fun b!1029412 () Bool)

(assert (=> b!1029412 (= e!581153 e!581154)))

(declare-fun c!104105 () Bool)

(assert (=> b!1029412 (= c!104105 (validKeyInArray!0 (select (arr!31147 lt!453011) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1029413 () Bool)

(assert (=> b!1029413 (= e!581154 (bvadd #b00000000000000000000000000000001 call!43393))))

(assert (= (and d!123283 c!104106) b!1029411))

(assert (= (and d!123283 (not c!104106)) b!1029412))

(assert (= (and b!1029412 c!104105) b!1029413))

(assert (= (and b!1029412 (not c!104105)) b!1029410))

(assert (= (or b!1029413 b!1029410) bm!43390))

(declare-fun m!948355 () Bool)

(assert (=> bm!43390 m!948355))

(assert (=> b!1029412 m!948291))

(assert (=> b!1029412 m!948291))

(assert (=> b!1029412 m!948299))

(assert (=> bm!43382 d!123283))

(declare-fun d!123285 () Bool)

(assert (=> d!123285 (= (apply!909 lt!453179 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)) (get!16371 (getValueByKey!580 (toList!6855 lt!453179) (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30018 () Bool)

(assert (= bs!30018 d!123285))

(assert (=> bs!30018 m!948121))

(assert (=> bs!30018 m!948285))

(assert (=> bs!30018 m!948285))

(declare-fun m!948357 () Bool)

(assert (=> bs!30018 m!948357))

(assert (=> b!1029275 d!123285))

(declare-fun d!123287 () Bool)

(declare-fun c!104107 () Bool)

(assert (=> d!123287 (= c!104107 ((_ is ValueCellFull!11444) (select (arr!31148 (_values!6118 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!581155 () V!37267)

(assert (=> d!123287 (= (get!16370 (select (arr!31148 (_values!6118 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!581155)))

(declare-fun b!1029414 () Bool)

(assert (=> b!1029414 (= e!581155 (get!16372 (select (arr!31148 (_values!6118 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029415 () Bool)

(assert (=> b!1029415 (= e!581155 (get!16373 (select (arr!31148 (_values!6118 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123287 c!104107) b!1029414))

(assert (= (and d!123287 (not c!104107)) b!1029415))

(assert (=> b!1029414 m!948179))

(assert (=> b!1029414 m!947959))

(declare-fun m!948359 () Bool)

(assert (=> b!1029414 m!948359))

(assert (=> b!1029415 m!948179))

(assert (=> b!1029415 m!947959))

(declare-fun m!948361 () Bool)

(assert (=> b!1029415 m!948361))

(assert (=> b!1029275 d!123287))

(declare-fun b!1029416 () Bool)

(declare-fun e!581157 () (_ BitVec 32))

(declare-fun call!43394 () (_ BitVec 32))

(assert (=> b!1029416 (= e!581157 call!43394)))

(declare-fun bm!43391 () Bool)

(assert (=> bm!43391 (= call!43394 (arrayCountValidKeys!0 (_keys!11282 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31661 (_keys!11282 thiss!1427))))))

(declare-fun d!123289 () Bool)

(declare-fun lt!453266 () (_ BitVec 32))

(assert (=> d!123289 (and (bvsge lt!453266 #b00000000000000000000000000000000) (bvsle lt!453266 (bvsub (size!31661 (_keys!11282 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!581156 () (_ BitVec 32))

(assert (=> d!123289 (= lt!453266 e!581156)))

(declare-fun c!104109 () Bool)

(assert (=> d!123289 (= c!104109 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31661 (_keys!11282 thiss!1427))))))

(assert (=> d!123289 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31661 (_keys!11282 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31661 (_keys!11282 thiss!1427)) (size!31661 (_keys!11282 thiss!1427))))))

(assert (=> d!123289 (= (arrayCountValidKeys!0 (_keys!11282 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31661 (_keys!11282 thiss!1427))) lt!453266)))

(declare-fun b!1029417 () Bool)

(assert (=> b!1029417 (= e!581156 #b00000000000000000000000000000000)))

(declare-fun b!1029418 () Bool)

(assert (=> b!1029418 (= e!581156 e!581157)))

(declare-fun c!104108 () Bool)

(assert (=> b!1029418 (= c!104108 (validKeyInArray!0 (select (arr!31147 (_keys!11282 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1029419 () Bool)

(assert (=> b!1029419 (= e!581157 (bvadd #b00000000000000000000000000000001 call!43394))))

(assert (= (and d!123289 c!104109) b!1029417))

(assert (= (and d!123289 (not c!104109)) b!1029418))

(assert (= (and b!1029418 c!104108) b!1029419))

(assert (= (and b!1029418 (not c!104108)) b!1029416))

(assert (= (or b!1029419 b!1029416) bm!43391))

(declare-fun m!948363 () Bool)

(assert (=> bm!43391 m!948363))

(declare-fun m!948365 () Bool)

(assert (=> b!1029418 m!948365))

(assert (=> b!1029418 m!948365))

(declare-fun m!948367 () Bool)

(assert (=> b!1029418 m!948367))

(assert (=> bm!43353 d!123289))

(assert (=> d!123233 d!123261))

(declare-fun d!123291 () Bool)

(assert (=> d!123291 (= (apply!909 lt!453157 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16371 (getValueByKey!580 (toList!6855 lt!453157) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30019 () Bool)

(assert (= bs!30019 d!123291))

(declare-fun m!948369 () Bool)

(assert (=> bs!30019 m!948369))

(assert (=> bs!30019 m!948369))

(declare-fun m!948371 () Bool)

(assert (=> bs!30019 m!948371))

(assert (=> b!1029243 d!123291))

(declare-fun d!123293 () Bool)

(assert (=> d!123293 (= (apply!909 lt!453179 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16371 (getValueByKey!580 (toList!6855 lt!453179) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30020 () Bool)

(assert (= bs!30020 d!123293))

(declare-fun m!948373 () Bool)

(assert (=> bs!30020 m!948373))

(assert (=> bs!30020 m!948373))

(declare-fun m!948375 () Bool)

(assert (=> bs!30020 m!948375))

(assert (=> b!1029270 d!123293))

(declare-fun d!123295 () Bool)

(declare-fun res!688513 () Bool)

(declare-fun e!581158 () Bool)

(assert (=> d!123295 (=> res!688513 e!581158)))

(assert (=> d!123295 (= res!688513 (= (select (arr!31147 lt!453011) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!123295 (= (arrayContainsKey!0 lt!453011 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!581158)))

(declare-fun b!1029420 () Bool)

(declare-fun e!581159 () Bool)

(assert (=> b!1029420 (= e!581158 e!581159)))

(declare-fun res!688514 () Bool)

(assert (=> b!1029420 (=> (not res!688514) (not e!581159))))

(assert (=> b!1029420 (= res!688514 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31661 lt!453011)))))

(declare-fun b!1029421 () Bool)

(assert (=> b!1029421 (= e!581159 (arrayContainsKey!0 lt!453011 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!123295 (not res!688513)) b!1029420))

(assert (= (and b!1029420 res!688514) b!1029421))

(assert (=> d!123295 m!948291))

(declare-fun m!948377 () Bool)

(assert (=> b!1029421 m!948377))

(assert (=> b!1029267 d!123295))

(declare-fun b!1029422 () Bool)

(declare-fun e!581162 () ListLongMap!13679)

(declare-fun call!43395 () ListLongMap!13679)

(assert (=> b!1029422 (= e!581162 call!43395)))

(declare-fun b!1029423 () Bool)

(declare-fun e!581166 () Bool)

(declare-fun e!581165 () Bool)

(assert (=> b!1029423 (= e!581166 e!581165)))

(declare-fun c!104110 () Bool)

(assert (=> b!1029423 (= c!104110 (bvslt #b00000000000000000000000000000000 (size!31661 lt!453011)))))

(declare-fun b!1029424 () Bool)

(declare-fun res!688518 () Bool)

(declare-fun e!581161 () Bool)

(assert (=> b!1029424 (=> (not res!688518) (not e!581161))))

(declare-fun lt!453268 () ListLongMap!13679)

(assert (=> b!1029424 (= res!688518 (not (contains!5990 lt!453268 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029425 () Bool)

(declare-fun lt!453267 () Unit!33562)

(declare-fun lt!453272 () Unit!33562)

(assert (=> b!1029425 (= lt!453267 lt!453272)))

(declare-fun lt!453269 () (_ BitVec 64))

(declare-fun lt!453271 () ListLongMap!13679)

(declare-fun lt!453273 () V!37267)

(declare-fun lt!453270 () (_ BitVec 64))

(assert (=> b!1029425 (not (contains!5990 (+!3120 lt!453271 (tuple2!15541 lt!453269 lt!453273)) lt!453270))))

(assert (=> b!1029425 (= lt!453272 (addStillNotContains!240 lt!453271 lt!453269 lt!453273 lt!453270))))

(assert (=> b!1029425 (= lt!453270 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1029425 (= lt!453273 (get!16370 (select (arr!31148 lt!453015) #b00000000000000000000000000000000) (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1029425 (= lt!453269 (select (arr!31147 lt!453011) #b00000000000000000000000000000000))))

(assert (=> b!1029425 (= lt!453271 call!43395)))

(assert (=> b!1029425 (= e!581162 (+!3120 call!43395 (tuple2!15541 (select (arr!31147 lt!453011) #b00000000000000000000000000000000) (get!16370 (select (arr!31148 lt!453015) #b00000000000000000000000000000000) (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1029426 () Bool)

(assert (=> b!1029426 (= e!581165 (isEmpty!926 lt!453268))))

(declare-fun b!1029427 () Bool)

(assert (=> b!1029427 (= e!581161 e!581166)))

(declare-fun c!104112 () Bool)

(declare-fun e!581160 () Bool)

(assert (=> b!1029427 (= c!104112 e!581160)))

(declare-fun res!688515 () Bool)

(assert (=> b!1029427 (=> (not res!688515) (not e!581160))))

(assert (=> b!1029427 (= res!688515 (bvslt #b00000000000000000000000000000000 (size!31661 lt!453011)))))

(declare-fun b!1029428 () Bool)

(assert (=> b!1029428 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31661 lt!453011)))))

(assert (=> b!1029428 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31662 lt!453015)))))

(declare-fun e!581163 () Bool)

(assert (=> b!1029428 (= e!581163 (= (apply!909 lt!453268 (select (arr!31147 lt!453011) #b00000000000000000000000000000000)) (get!16370 (select (arr!31148 lt!453015) #b00000000000000000000000000000000) (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1029430 () Bool)

(assert (=> b!1029430 (= e!581166 e!581163)))

(assert (=> b!1029430 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31661 lt!453011)))))

(declare-fun res!688516 () Bool)

(assert (=> b!1029430 (= res!688516 (contains!5990 lt!453268 (select (arr!31147 lt!453011) #b00000000000000000000000000000000)))))

(assert (=> b!1029430 (=> (not res!688516) (not e!581163))))

(declare-fun bm!43392 () Bool)

(assert (=> bm!43392 (= call!43395 (getCurrentListMapNoExtraKeys!3560 lt!453011 lt!453015 (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6095 thiss!1427)))))

(declare-fun b!1029431 () Bool)

(assert (=> b!1029431 (= e!581165 (= lt!453268 (getCurrentListMapNoExtraKeys!3560 lt!453011 lt!453015 (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6095 thiss!1427))))))

(declare-fun b!1029432 () Bool)

(declare-fun e!581164 () ListLongMap!13679)

(assert (=> b!1029432 (= e!581164 (ListLongMap!13680 Nil!21793))))

(declare-fun b!1029433 () Bool)

(assert (=> b!1029433 (= e!581160 (validKeyInArray!0 (select (arr!31147 lt!453011) #b00000000000000000000000000000000)))))

(assert (=> b!1029433 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1029429 () Bool)

(assert (=> b!1029429 (= e!581164 e!581162)))

(declare-fun c!104111 () Bool)

(assert (=> b!1029429 (= c!104111 (validKeyInArray!0 (select (arr!31147 lt!453011) #b00000000000000000000000000000000)))))

(declare-fun d!123297 () Bool)

(assert (=> d!123297 e!581161))

(declare-fun res!688517 () Bool)

(assert (=> d!123297 (=> (not res!688517) (not e!581161))))

(assert (=> d!123297 (= res!688517 (not (contains!5990 lt!453268 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123297 (= lt!453268 e!581164)))

(declare-fun c!104113 () Bool)

(assert (=> d!123297 (= c!104113 (bvsge #b00000000000000000000000000000000 (size!31661 lt!453011)))))

(assert (=> d!123297 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123297 (= (getCurrentListMapNoExtraKeys!3560 lt!453011 lt!453015 (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)) lt!453268)))

(assert (= (and d!123297 c!104113) b!1029432))

(assert (= (and d!123297 (not c!104113)) b!1029429))

(assert (= (and b!1029429 c!104111) b!1029425))

(assert (= (and b!1029429 (not c!104111)) b!1029422))

(assert (= (or b!1029425 b!1029422) bm!43392))

(assert (= (and d!123297 res!688517) b!1029424))

(assert (= (and b!1029424 res!688518) b!1029427))

(assert (= (and b!1029427 res!688515) b!1029433))

(assert (= (and b!1029427 c!104112) b!1029430))

(assert (= (and b!1029427 (not c!104112)) b!1029423))

(assert (= (and b!1029430 res!688516) b!1029428))

(assert (= (and b!1029423 c!104110) b!1029431))

(assert (= (and b!1029423 (not c!104110)) b!1029426))

(declare-fun b_lambda!15773 () Bool)

(assert (=> (not b_lambda!15773) (not b!1029425)))

(assert (=> b!1029425 t!30857))

(declare-fun b_and!32865 () Bool)

(assert (= b_and!32863 (and (=> t!30857 result!14095) b_and!32865)))

(declare-fun b_lambda!15775 () Bool)

(assert (=> (not b_lambda!15775) (not b!1029428)))

(assert (=> b!1029428 t!30857))

(declare-fun b_and!32867 () Bool)

(assert (= b_and!32865 (and (=> t!30857 result!14095) b_and!32867)))

(declare-fun m!948379 () Bool)

(assert (=> b!1029424 m!948379))

(declare-fun m!948381 () Bool)

(assert (=> b!1029426 m!948381))

(assert (=> b!1029428 m!948095))

(assert (=> b!1029428 m!948095))

(declare-fun m!948383 () Bool)

(assert (=> b!1029428 m!948383))

(assert (=> b!1029428 m!947959))

(assert (=> b!1029428 m!948125))

(assert (=> b!1029428 m!948125))

(assert (=> b!1029428 m!947959))

(assert (=> b!1029428 m!948127))

(declare-fun m!948385 () Bool)

(assert (=> d!123297 m!948385))

(assert (=> d!123297 m!948079))

(assert (=> b!1029430 m!948095))

(assert (=> b!1029430 m!948095))

(declare-fun m!948387 () Bool)

(assert (=> b!1029430 m!948387))

(declare-fun m!948389 () Bool)

(assert (=> b!1029431 m!948389))

(assert (=> b!1029433 m!948095))

(assert (=> b!1029433 m!948095))

(assert (=> b!1029433 m!948099))

(assert (=> b!1029425 m!948095))

(declare-fun m!948391 () Bool)

(assert (=> b!1029425 m!948391))

(declare-fun m!948393 () Bool)

(assert (=> b!1029425 m!948393))

(declare-fun m!948395 () Bool)

(assert (=> b!1029425 m!948395))

(assert (=> b!1029425 m!947959))

(declare-fun m!948397 () Bool)

(assert (=> b!1029425 m!948397))

(assert (=> b!1029425 m!948393))

(assert (=> b!1029425 m!948125))

(assert (=> b!1029425 m!948125))

(assert (=> b!1029425 m!947959))

(assert (=> b!1029425 m!948127))

(assert (=> bm!43392 m!948389))

(assert (=> b!1029429 m!948095))

(assert (=> b!1029429 m!948095))

(assert (=> b!1029429 m!948099))

(assert (=> bm!43368 d!123297))

(declare-fun d!123299 () Bool)

(declare-fun e!581167 () Bool)

(assert (=> d!123299 e!581167))

(declare-fun res!688519 () Bool)

(assert (=> d!123299 (=> res!688519 e!581167)))

(declare-fun lt!453274 () Bool)

(assert (=> d!123299 (= res!688519 (not lt!453274))))

(declare-fun lt!453275 () Bool)

(assert (=> d!123299 (= lt!453274 lt!453275)))

(declare-fun lt!453277 () Unit!33562)

(declare-fun e!581168 () Unit!33562)

(assert (=> d!123299 (= lt!453277 e!581168)))

(declare-fun c!104114 () Bool)

(assert (=> d!123299 (= c!104114 lt!453275)))

(assert (=> d!123299 (= lt!453275 (containsKey!561 (toList!6855 lt!453157) (select (arr!31147 lt!453011) #b00000000000000000000000000000000)))))

(assert (=> d!123299 (= (contains!5990 lt!453157 (select (arr!31147 lt!453011) #b00000000000000000000000000000000)) lt!453274)))

(declare-fun b!1029434 () Bool)

(declare-fun lt!453276 () Unit!33562)

(assert (=> b!1029434 (= e!581168 lt!453276)))

(assert (=> b!1029434 (= lt!453276 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6855 lt!453157) (select (arr!31147 lt!453011) #b00000000000000000000000000000000)))))

(assert (=> b!1029434 (isDefined!430 (getValueByKey!580 (toList!6855 lt!453157) (select (arr!31147 lt!453011) #b00000000000000000000000000000000)))))

(declare-fun b!1029435 () Bool)

(declare-fun Unit!33578 () Unit!33562)

(assert (=> b!1029435 (= e!581168 Unit!33578)))

(declare-fun b!1029436 () Bool)

(assert (=> b!1029436 (= e!581167 (isDefined!430 (getValueByKey!580 (toList!6855 lt!453157) (select (arr!31147 lt!453011) #b00000000000000000000000000000000))))))

(assert (= (and d!123299 c!104114) b!1029434))

(assert (= (and d!123299 (not c!104114)) b!1029435))

(assert (= (and d!123299 (not res!688519)) b!1029436))

(assert (=> d!123299 m!948095))

(declare-fun m!948399 () Bool)

(assert (=> d!123299 m!948399))

(assert (=> b!1029434 m!948095))

(declare-fun m!948401 () Bool)

(assert (=> b!1029434 m!948401))

(assert (=> b!1029434 m!948095))

(assert (=> b!1029434 m!948347))

(assert (=> b!1029434 m!948347))

(declare-fun m!948403 () Bool)

(assert (=> b!1029434 m!948403))

(assert (=> b!1029436 m!948095))

(assert (=> b!1029436 m!948347))

(assert (=> b!1029436 m!948347))

(assert (=> b!1029436 m!948403))

(assert (=> b!1029256 d!123299))

(declare-fun d!123301 () Bool)

(declare-fun e!581169 () Bool)

(assert (=> d!123301 e!581169))

(declare-fun res!688520 () Bool)

(assert (=> d!123301 (=> res!688520 e!581169)))

(declare-fun lt!453278 () Bool)

(assert (=> d!123301 (= res!688520 (not lt!453278))))

(declare-fun lt!453279 () Bool)

(assert (=> d!123301 (= lt!453278 lt!453279)))

(declare-fun lt!453281 () Unit!33562)

(declare-fun e!581170 () Unit!33562)

(assert (=> d!123301 (= lt!453281 e!581170)))

(declare-fun c!104115 () Bool)

(assert (=> d!123301 (= c!104115 lt!453279)))

(assert (=> d!123301 (= lt!453279 (containsKey!561 (toList!6855 lt!453157) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123301 (= (contains!5990 lt!453157 #b0000000000000000000000000000000000000000000000000000000000000000) lt!453278)))

(declare-fun b!1029437 () Bool)

(declare-fun lt!453280 () Unit!33562)

(assert (=> b!1029437 (= e!581170 lt!453280)))

(assert (=> b!1029437 (= lt!453280 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6855 lt!453157) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029437 (isDefined!430 (getValueByKey!580 (toList!6855 lt!453157) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029438 () Bool)

(declare-fun Unit!33579 () Unit!33562)

(assert (=> b!1029438 (= e!581170 Unit!33579)))

(declare-fun b!1029439 () Bool)

(assert (=> b!1029439 (= e!581169 (isDefined!430 (getValueByKey!580 (toList!6855 lt!453157) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123301 c!104115) b!1029437))

(assert (= (and d!123301 (not c!104115)) b!1029438))

(assert (= (and d!123301 (not res!688520)) b!1029439))

(declare-fun m!948405 () Bool)

(assert (=> d!123301 m!948405))

(declare-fun m!948407 () Bool)

(assert (=> b!1029437 m!948407))

(declare-fun m!948409 () Bool)

(assert (=> b!1029437 m!948409))

(assert (=> b!1029437 m!948409))

(declare-fun m!948411 () Bool)

(assert (=> b!1029437 m!948411))

(assert (=> b!1029439 m!948409))

(assert (=> b!1029439 m!948409))

(assert (=> b!1029439 m!948411))

(assert (=> bm!43374 d!123301))

(declare-fun d!123303 () Bool)

(assert (=> d!123303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) (mask!29879 thiss!1427))))

(assert (=> d!123303 true))

(declare-fun _$44!9 () Unit!33562)

(assert (=> d!123303 (= (choose!25 (_keys!11282 thiss!1427) (index!40892 lt!453013) (mask!29879 thiss!1427)) _$44!9)))

(declare-fun bs!30021 () Bool)

(assert (= bs!30021 d!123303))

(assert (=> bs!30021 m!947961))

(assert (=> bs!30021 m!948239))

(assert (=> d!123241 d!123303))

(assert (=> d!123241 d!123261))

(declare-fun d!123305 () Bool)

(declare-fun e!581171 () Bool)

(assert (=> d!123305 e!581171))

(declare-fun res!688521 () Bool)

(assert (=> d!123305 (=> res!688521 e!581171)))

(declare-fun lt!453282 () Bool)

(assert (=> d!123305 (= res!688521 (not lt!453282))))

(declare-fun lt!453283 () Bool)

(assert (=> d!123305 (= lt!453282 lt!453283)))

(declare-fun lt!453285 () Unit!33562)

(declare-fun e!581172 () Unit!33562)

(assert (=> d!123305 (= lt!453285 e!581172)))

(declare-fun c!104116 () Bool)

(assert (=> d!123305 (= c!104116 lt!453283)))

(assert (=> d!123305 (= lt!453283 (containsKey!561 (toList!6855 lt!453179) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123305 (= (contains!5990 lt!453179 #b0000000000000000000000000000000000000000000000000000000000000000) lt!453282)))

(declare-fun b!1029440 () Bool)

(declare-fun lt!453284 () Unit!33562)

(assert (=> b!1029440 (= e!581172 lt!453284)))

(assert (=> b!1029440 (= lt!453284 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6855 lt!453179) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029440 (isDefined!430 (getValueByKey!580 (toList!6855 lt!453179) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029441 () Bool)

(declare-fun Unit!33580 () Unit!33562)

(assert (=> b!1029441 (= e!581172 Unit!33580)))

(declare-fun b!1029442 () Bool)

(assert (=> b!1029442 (= e!581171 (isDefined!430 (getValueByKey!580 (toList!6855 lt!453179) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123305 c!104116) b!1029440))

(assert (= (and d!123305 (not c!104116)) b!1029441))

(assert (= (and d!123305 (not res!688521)) b!1029442))

(declare-fun m!948413 () Bool)

(assert (=> d!123305 m!948413))

(declare-fun m!948415 () Bool)

(assert (=> b!1029440 m!948415))

(declare-fun m!948417 () Bool)

(assert (=> b!1029440 m!948417))

(assert (=> b!1029440 m!948417))

(declare-fun m!948419 () Bool)

(assert (=> b!1029440 m!948419))

(assert (=> b!1029442 m!948417))

(assert (=> b!1029442 m!948417))

(assert (=> b!1029442 m!948419))

(assert (=> bm!43381 d!123305))

(declare-fun d!123307 () Bool)

(assert (=> d!123307 (arrayContainsKey!0 lt!453011 lt!453103 #b00000000000000000000000000000000)))

(declare-fun lt!453288 () Unit!33562)

(declare-fun choose!13 (array!64691 (_ BitVec 64) (_ BitVec 32)) Unit!33562)

(assert (=> d!123307 (= lt!453288 (choose!13 lt!453011 lt!453103 #b00000000000000000000000000000000))))

(assert (=> d!123307 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!123307 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453011 lt!453103 #b00000000000000000000000000000000) lt!453288)))

(declare-fun bs!30022 () Bool)

(assert (= bs!30022 d!123307))

(assert (=> bs!30022 m!948115))

(declare-fun m!948421 () Bool)

(assert (=> bs!30022 m!948421))

(assert (=> b!1029184 d!123307))

(declare-fun d!123309 () Bool)

(declare-fun res!688522 () Bool)

(declare-fun e!581173 () Bool)

(assert (=> d!123309 (=> res!688522 e!581173)))

(assert (=> d!123309 (= res!688522 (= (select (arr!31147 lt!453011) #b00000000000000000000000000000000) lt!453103))))

(assert (=> d!123309 (= (arrayContainsKey!0 lt!453011 lt!453103 #b00000000000000000000000000000000) e!581173)))

(declare-fun b!1029443 () Bool)

(declare-fun e!581174 () Bool)

(assert (=> b!1029443 (= e!581173 e!581174)))

(declare-fun res!688523 () Bool)

(assert (=> b!1029443 (=> (not res!688523) (not e!581174))))

(assert (=> b!1029443 (= res!688523 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31661 lt!453011)))))

(declare-fun b!1029444 () Bool)

(assert (=> b!1029444 (= e!581174 (arrayContainsKey!0 lt!453011 lt!453103 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123309 (not res!688522)) b!1029443))

(assert (= (and b!1029443 res!688523) b!1029444))

(assert (=> d!123309 m!948095))

(declare-fun m!948423 () Bool)

(assert (=> b!1029444 m!948423))

(assert (=> b!1029184 d!123309))

(declare-fun b!1029457 () Bool)

(declare-fun e!581182 () SeekEntryResult!9630)

(declare-fun e!581183 () SeekEntryResult!9630)

(assert (=> b!1029457 (= e!581182 e!581183)))

(declare-fun lt!453296 () (_ BitVec 64))

(declare-fun lt!453297 () SeekEntryResult!9630)

(assert (=> b!1029457 (= lt!453296 (select (arr!31147 lt!453011) (index!40893 lt!453297)))))

(declare-fun c!104124 () Bool)

(assert (=> b!1029457 (= c!104124 (= lt!453296 (select (arr!31147 lt!453011) #b00000000000000000000000000000000)))))

(declare-fun b!1029458 () Bool)

(assert (=> b!1029458 (= e!581183 (Found!9630 (index!40893 lt!453297)))))

(declare-fun d!123311 () Bool)

(declare-fun lt!453295 () SeekEntryResult!9630)

(assert (=> d!123311 (and (or ((_ is Undefined!9630) lt!453295) (not ((_ is Found!9630) lt!453295)) (and (bvsge (index!40892 lt!453295) #b00000000000000000000000000000000) (bvslt (index!40892 lt!453295) (size!31661 lt!453011)))) (or ((_ is Undefined!9630) lt!453295) ((_ is Found!9630) lt!453295) (not ((_ is MissingZero!9630) lt!453295)) (and (bvsge (index!40891 lt!453295) #b00000000000000000000000000000000) (bvslt (index!40891 lt!453295) (size!31661 lt!453011)))) (or ((_ is Undefined!9630) lt!453295) ((_ is Found!9630) lt!453295) ((_ is MissingZero!9630) lt!453295) (not ((_ is MissingVacant!9630) lt!453295)) (and (bvsge (index!40894 lt!453295) #b00000000000000000000000000000000) (bvslt (index!40894 lt!453295) (size!31661 lt!453011)))) (or ((_ is Undefined!9630) lt!453295) (ite ((_ is Found!9630) lt!453295) (= (select (arr!31147 lt!453011) (index!40892 lt!453295)) (select (arr!31147 lt!453011) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9630) lt!453295) (= (select (arr!31147 lt!453011) (index!40891 lt!453295)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9630) lt!453295) (= (select (arr!31147 lt!453011) (index!40894 lt!453295)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!123311 (= lt!453295 e!581182)))

(declare-fun c!104123 () Bool)

(assert (=> d!123311 (= c!104123 (and ((_ is Intermediate!9630) lt!453297) (undefined!10442 lt!453297)))))

(assert (=> d!123311 (= lt!453297 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31147 lt!453011) #b00000000000000000000000000000000) (mask!29879 thiss!1427)) (select (arr!31147 lt!453011) #b00000000000000000000000000000000) lt!453011 (mask!29879 thiss!1427)))))

(assert (=> d!123311 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123311 (= (seekEntryOrOpen!0 (select (arr!31147 lt!453011) #b00000000000000000000000000000000) lt!453011 (mask!29879 thiss!1427)) lt!453295)))

(declare-fun b!1029459 () Bool)

(declare-fun c!104125 () Bool)

(assert (=> b!1029459 (= c!104125 (= lt!453296 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!581181 () SeekEntryResult!9630)

(assert (=> b!1029459 (= e!581183 e!581181)))

(declare-fun b!1029460 () Bool)

(assert (=> b!1029460 (= e!581181 (MissingZero!9630 (index!40893 lt!453297)))))

(declare-fun b!1029461 () Bool)

(assert (=> b!1029461 (= e!581181 (seekKeyOrZeroReturnVacant!0 (x!91436 lt!453297) (index!40893 lt!453297) (index!40893 lt!453297) (select (arr!31147 lt!453011) #b00000000000000000000000000000000) lt!453011 (mask!29879 thiss!1427)))))

(declare-fun b!1029462 () Bool)

(assert (=> b!1029462 (= e!581182 Undefined!9630)))

(assert (= (and d!123311 c!104123) b!1029462))

(assert (= (and d!123311 (not c!104123)) b!1029457))

(assert (= (and b!1029457 c!104124) b!1029458))

(assert (= (and b!1029457 (not c!104124)) b!1029459))

(assert (= (and b!1029459 c!104125) b!1029460))

(assert (= (and b!1029459 (not c!104125)) b!1029461))

(declare-fun m!948425 () Bool)

(assert (=> b!1029457 m!948425))

(declare-fun m!948427 () Bool)

(assert (=> d!123311 m!948427))

(assert (=> d!123311 m!948095))

(declare-fun m!948429 () Bool)

(assert (=> d!123311 m!948429))

(assert (=> d!123311 m!948079))

(declare-fun m!948431 () Bool)

(assert (=> d!123311 m!948431))

(declare-fun m!948433 () Bool)

(assert (=> d!123311 m!948433))

(assert (=> d!123311 m!948095))

(assert (=> d!123311 m!948427))

(declare-fun m!948435 () Bool)

(assert (=> d!123311 m!948435))

(assert (=> b!1029461 m!948095))

(declare-fun m!948437 () Bool)

(assert (=> b!1029461 m!948437))

(assert (=> b!1029184 d!123311))

(declare-fun b!1029471 () Bool)

(declare-fun res!688534 () Bool)

(declare-fun e!581186 () Bool)

(assert (=> b!1029471 (=> (not res!688534) (not e!581186))))

(assert (=> b!1029471 (= res!688534 (and (= (size!31662 (_values!6118 thiss!1427)) (bvadd (mask!29879 thiss!1427) #b00000000000000000000000000000001)) (= (size!31661 (_keys!11282 thiss!1427)) (size!31662 (_values!6118 thiss!1427))) (bvsge (_size!2796 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2796 thiss!1427) (bvadd (mask!29879 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1029473 () Bool)

(declare-fun res!688533 () Bool)

(assert (=> b!1029473 (=> (not res!688533) (not e!581186))))

(declare-fun size!31667 (LongMapFixedSize!5482) (_ BitVec 32))

(assert (=> b!1029473 (= res!688533 (= (size!31667 thiss!1427) (bvadd (_size!2796 thiss!1427) (bvsdiv (bvadd (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!123313 () Bool)

(declare-fun res!688535 () Bool)

(assert (=> d!123313 (=> (not res!688535) (not e!581186))))

(assert (=> d!123313 (= res!688535 (validMask!0 (mask!29879 thiss!1427)))))

(assert (=> d!123313 (= (simpleValid!391 thiss!1427) e!581186)))

(declare-fun b!1029474 () Bool)

(assert (=> b!1029474 (= e!581186 (and (bvsge (extraKeys!5827 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5827 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2796 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1029472 () Bool)

(declare-fun res!688532 () Bool)

(assert (=> b!1029472 (=> (not res!688532) (not e!581186))))

(assert (=> b!1029472 (= res!688532 (bvsge (size!31667 thiss!1427) (_size!2796 thiss!1427)))))

(assert (= (and d!123313 res!688535) b!1029471))

(assert (= (and b!1029471 res!688534) b!1029472))

(assert (= (and b!1029472 res!688532) b!1029473))

(assert (= (and b!1029473 res!688533) b!1029474))

(declare-fun m!948439 () Bool)

(assert (=> b!1029473 m!948439))

(assert (=> d!123313 m!948079))

(assert (=> b!1029472 m!948439))

(assert (=> d!123207 d!123313))

(declare-fun b!1029487 () Bool)

(declare-fun e!581195 () SeekEntryResult!9630)

(assert (=> b!1029487 (= e!581195 (MissingVacant!9630 (index!40893 lt!453082)))))

(declare-fun b!1029488 () Bool)

(declare-fun c!104134 () Bool)

(declare-fun lt!453303 () (_ BitVec 64))

(assert (=> b!1029488 (= c!104134 (= lt!453303 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!581193 () SeekEntryResult!9630)

(assert (=> b!1029488 (= e!581193 e!581195)))

(declare-fun lt!453302 () SeekEntryResult!9630)

(declare-fun d!123315 () Bool)

(assert (=> d!123315 (and (or ((_ is Undefined!9630) lt!453302) (not ((_ is Found!9630) lt!453302)) (and (bvsge (index!40892 lt!453302) #b00000000000000000000000000000000) (bvslt (index!40892 lt!453302) (size!31661 (_keys!11282 thiss!1427))))) (or ((_ is Undefined!9630) lt!453302) ((_ is Found!9630) lt!453302) (not ((_ is MissingVacant!9630) lt!453302)) (not (= (index!40894 lt!453302) (index!40893 lt!453082))) (and (bvsge (index!40894 lt!453302) #b00000000000000000000000000000000) (bvslt (index!40894 lt!453302) (size!31661 (_keys!11282 thiss!1427))))) (or ((_ is Undefined!9630) lt!453302) (ite ((_ is Found!9630) lt!453302) (= (select (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453302)) key!909) (and ((_ is MissingVacant!9630) lt!453302) (= (index!40894 lt!453302) (index!40893 lt!453082)) (= (select (arr!31147 (_keys!11282 thiss!1427)) (index!40894 lt!453302)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!581194 () SeekEntryResult!9630)

(assert (=> d!123315 (= lt!453302 e!581194)))

(declare-fun c!104132 () Bool)

(assert (=> d!123315 (= c!104132 (bvsge (x!91436 lt!453082) #b01111111111111111111111111111110))))

(assert (=> d!123315 (= lt!453303 (select (arr!31147 (_keys!11282 thiss!1427)) (index!40893 lt!453082)))))

(assert (=> d!123315 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123315 (= (seekKeyOrZeroReturnVacant!0 (x!91436 lt!453082) (index!40893 lt!453082) (index!40893 lt!453082) key!909 (_keys!11282 thiss!1427) (mask!29879 thiss!1427)) lt!453302)))

(declare-fun b!1029489 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1029489 (= e!581195 (seekKeyOrZeroReturnVacant!0 (bvadd (x!91436 lt!453082) #b00000000000000000000000000000001) (nextIndex!0 (index!40893 lt!453082) (bvadd (x!91436 lt!453082) #b00000000000000000000000000000001) (mask!29879 thiss!1427)) (index!40893 lt!453082) key!909 (_keys!11282 thiss!1427) (mask!29879 thiss!1427)))))

(declare-fun b!1029490 () Bool)

(assert (=> b!1029490 (= e!581193 (Found!9630 (index!40893 lt!453082)))))

(declare-fun b!1029491 () Bool)

(assert (=> b!1029491 (= e!581194 Undefined!9630)))

(declare-fun b!1029492 () Bool)

(assert (=> b!1029492 (= e!581194 e!581193)))

(declare-fun c!104133 () Bool)

(assert (=> b!1029492 (= c!104133 (= lt!453303 key!909))))

(assert (= (and d!123315 c!104132) b!1029491))

(assert (= (and d!123315 (not c!104132)) b!1029492))

(assert (= (and b!1029492 c!104133) b!1029490))

(assert (= (and b!1029492 (not c!104133)) b!1029488))

(assert (= (and b!1029488 c!104134) b!1029487))

(assert (= (and b!1029488 (not c!104134)) b!1029489))

(declare-fun m!948441 () Bool)

(assert (=> d!123315 m!948441))

(declare-fun m!948443 () Bool)

(assert (=> d!123315 m!948443))

(assert (=> d!123315 m!948069))

(assert (=> d!123315 m!948079))

(declare-fun m!948445 () Bool)

(assert (=> b!1029489 m!948445))

(assert (=> b!1029489 m!948445))

(declare-fun m!948447 () Bool)

(assert (=> b!1029489 m!948447))

(assert (=> b!1029141 d!123315))

(declare-fun d!123317 () Bool)

(declare-fun e!581196 () Bool)

(assert (=> d!123317 e!581196))

(declare-fun res!688536 () Bool)

(assert (=> d!123317 (=> res!688536 e!581196)))

(declare-fun lt!453304 () Bool)

(assert (=> d!123317 (= res!688536 (not lt!453304))))

(declare-fun lt!453305 () Bool)

(assert (=> d!123317 (= lt!453304 lt!453305)))

(declare-fun lt!453307 () Unit!33562)

(declare-fun e!581197 () Unit!33562)

(assert (=> d!123317 (= lt!453307 e!581197)))

(declare-fun c!104135 () Bool)

(assert (=> d!123317 (= c!104135 lt!453305)))

(assert (=> d!123317 (= lt!453305 (containsKey!561 (toList!6855 lt!453157) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123317 (= (contains!5990 lt!453157 #b1000000000000000000000000000000000000000000000000000000000000000) lt!453304)))

(declare-fun b!1029493 () Bool)

(declare-fun lt!453306 () Unit!33562)

(assert (=> b!1029493 (= e!581197 lt!453306)))

(assert (=> b!1029493 (= lt!453306 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6855 lt!453157) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029493 (isDefined!430 (getValueByKey!580 (toList!6855 lt!453157) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029494 () Bool)

(declare-fun Unit!33581 () Unit!33562)

(assert (=> b!1029494 (= e!581197 Unit!33581)))

(declare-fun b!1029495 () Bool)

(assert (=> b!1029495 (= e!581196 (isDefined!430 (getValueByKey!580 (toList!6855 lt!453157) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123317 c!104135) b!1029493))

(assert (= (and d!123317 (not c!104135)) b!1029494))

(assert (= (and d!123317 (not res!688536)) b!1029495))

(declare-fun m!948449 () Bool)

(assert (=> d!123317 m!948449))

(declare-fun m!948451 () Bool)

(assert (=> b!1029493 m!948451))

(assert (=> b!1029493 m!948369))

(assert (=> b!1029493 m!948369))

(declare-fun m!948453 () Bool)

(assert (=> b!1029493 m!948453))

(assert (=> b!1029495 m!948369))

(assert (=> b!1029495 m!948369))

(assert (=> b!1029495 m!948453))

(assert (=> bm!43372 d!123317))

(declare-fun b!1029496 () Bool)

(declare-fun e!581200 () Bool)

(declare-fun call!43396 () Bool)

(assert (=> b!1029496 (= e!581200 call!43396)))

(declare-fun d!123319 () Bool)

(declare-fun res!688538 () Bool)

(declare-fun e!581199 () Bool)

(assert (=> d!123319 (=> res!688538 e!581199)))

(assert (=> d!123319 (= res!688538 (bvsge #b00000000000000000000000000000000 (size!31661 (_keys!11282 thiss!1427))))))

(assert (=> d!123319 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11282 thiss!1427) (mask!29879 thiss!1427)) e!581199)))

(declare-fun bm!43393 () Bool)

(assert (=> bm!43393 (= call!43396 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11282 thiss!1427) (mask!29879 thiss!1427)))))

(declare-fun b!1029497 () Bool)

(declare-fun e!581198 () Bool)

(assert (=> b!1029497 (= e!581198 e!581200)))

(declare-fun lt!453310 () (_ BitVec 64))

(assert (=> b!1029497 (= lt!453310 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453309 () Unit!33562)

(assert (=> b!1029497 (= lt!453309 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11282 thiss!1427) lt!453310 #b00000000000000000000000000000000))))

(assert (=> b!1029497 (arrayContainsKey!0 (_keys!11282 thiss!1427) lt!453310 #b00000000000000000000000000000000)))

(declare-fun lt!453308 () Unit!33562)

(assert (=> b!1029497 (= lt!453308 lt!453309)))

(declare-fun res!688537 () Bool)

(assert (=> b!1029497 (= res!688537 (= (seekEntryOrOpen!0 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000) (_keys!11282 thiss!1427) (mask!29879 thiss!1427)) (Found!9630 #b00000000000000000000000000000000)))))

(assert (=> b!1029497 (=> (not res!688537) (not e!581200))))

(declare-fun b!1029498 () Bool)

(assert (=> b!1029498 (= e!581199 e!581198)))

(declare-fun c!104136 () Bool)

(assert (=> b!1029498 (= c!104136 (validKeyInArray!0 (select (arr!31147 (_keys!11282 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1029499 () Bool)

(assert (=> b!1029499 (= e!581198 call!43396)))

(assert (= (and d!123319 (not res!688538)) b!1029498))

(assert (= (and b!1029498 c!104136) b!1029497))

(assert (= (and b!1029498 (not c!104136)) b!1029499))

(assert (= (and b!1029497 res!688537) b!1029496))

(assert (= (or b!1029496 b!1029499) bm!43393))

(declare-fun m!948455 () Bool)

(assert (=> bm!43393 m!948455))

(assert (=> b!1029497 m!948121))

(declare-fun m!948457 () Bool)

(assert (=> b!1029497 m!948457))

(declare-fun m!948459 () Bool)

(assert (=> b!1029497 m!948459))

(assert (=> b!1029497 m!948121))

(declare-fun m!948461 () Bool)

(assert (=> b!1029497 m!948461))

(assert (=> b!1029498 m!948121))

(assert (=> b!1029498 m!948121))

(assert (=> b!1029498 m!948123))

(assert (=> b!1029122 d!123319))

(declare-fun b!1029500 () Bool)

(declare-fun e!581203 () Bool)

(declare-fun call!43397 () Bool)

(assert (=> b!1029500 (= e!581203 call!43397)))

(declare-fun d!123321 () Bool)

(declare-fun res!688540 () Bool)

(declare-fun e!581202 () Bool)

(assert (=> d!123321 (=> res!688540 e!581202)))

(assert (=> d!123321 (= res!688540 (bvsge #b00000000000000000000000000000000 (size!31661 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))))))))

(assert (=> d!123321 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) (mask!29879 thiss!1427)) e!581202)))

(declare-fun bm!43394 () Bool)

(assert (=> bm!43394 (= call!43397 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) (mask!29879 thiss!1427)))))

(declare-fun b!1029501 () Bool)

(declare-fun e!581201 () Bool)

(assert (=> b!1029501 (= e!581201 e!581203)))

(declare-fun lt!453313 () (_ BitVec 64))

(assert (=> b!1029501 (= lt!453313 (select (arr!31147 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453312 () Unit!33562)

(assert (=> b!1029501 (= lt!453312 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) lt!453313 #b00000000000000000000000000000000))))

(assert (=> b!1029501 (arrayContainsKey!0 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) lt!453313 #b00000000000000000000000000000000)))

(declare-fun lt!453311 () Unit!33562)

(assert (=> b!1029501 (= lt!453311 lt!453312)))

(declare-fun res!688539 () Bool)

(assert (=> b!1029501 (= res!688539 (= (seekEntryOrOpen!0 (select (arr!31147 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427)))) #b00000000000000000000000000000000) (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) (mask!29879 thiss!1427)) (Found!9630 #b00000000000000000000000000000000)))))

(assert (=> b!1029501 (=> (not res!688539) (not e!581203))))

(declare-fun b!1029502 () Bool)

(assert (=> b!1029502 (= e!581202 e!581201)))

(declare-fun c!104137 () Bool)

(assert (=> b!1029502 (= c!104137 (validKeyInArray!0 (select (arr!31147 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1029503 () Bool)

(assert (=> b!1029503 (= e!581201 call!43397)))

(assert (= (and d!123321 (not res!688540)) b!1029502))

(assert (= (and b!1029502 c!104137) b!1029501))

(assert (= (and b!1029502 (not c!104137)) b!1029503))

(assert (= (and b!1029501 res!688539) b!1029500))

(assert (= (or b!1029500 b!1029503) bm!43394))

(declare-fun m!948463 () Bool)

(assert (=> bm!43394 m!948463))

(assert (=> b!1029501 m!948303))

(declare-fun m!948465 () Bool)

(assert (=> b!1029501 m!948465))

(declare-fun m!948467 () Bool)

(assert (=> b!1029501 m!948467))

(assert (=> b!1029501 m!948303))

(declare-fun m!948469 () Bool)

(assert (=> b!1029501 m!948469))

(assert (=> b!1029502 m!948303))

(assert (=> b!1029502 m!948303))

(assert (=> b!1029502 m!948305))

(assert (=> b!1029298 d!123321))

(declare-fun d!123323 () Bool)

(declare-fun e!581204 () Bool)

(assert (=> d!123323 e!581204))

(declare-fun res!688541 () Bool)

(assert (=> d!123323 (=> res!688541 e!581204)))

(declare-fun lt!453314 () Bool)

(assert (=> d!123323 (= res!688541 (not lt!453314))))

(declare-fun lt!453315 () Bool)

(assert (=> d!123323 (= lt!453314 lt!453315)))

(declare-fun lt!453317 () Unit!33562)

(declare-fun e!581205 () Unit!33562)

(assert (=> d!123323 (= lt!453317 e!581205)))

(declare-fun c!104138 () Bool)

(assert (=> d!123323 (= c!104138 lt!453315)))

(assert (=> d!123323 (= lt!453315 (containsKey!561 (toList!6855 lt!453179) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123323 (= (contains!5990 lt!453179 #b1000000000000000000000000000000000000000000000000000000000000000) lt!453314)))

(declare-fun b!1029504 () Bool)

(declare-fun lt!453316 () Unit!33562)

(assert (=> b!1029504 (= e!581205 lt!453316)))

(assert (=> b!1029504 (= lt!453316 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6855 lt!453179) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1029504 (isDefined!430 (getValueByKey!580 (toList!6855 lt!453179) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029505 () Bool)

(declare-fun Unit!33582 () Unit!33562)

(assert (=> b!1029505 (= e!581205 Unit!33582)))

(declare-fun b!1029506 () Bool)

(assert (=> b!1029506 (= e!581204 (isDefined!430 (getValueByKey!580 (toList!6855 lt!453179) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123323 c!104138) b!1029504))

(assert (= (and d!123323 (not c!104138)) b!1029505))

(assert (= (and d!123323 (not res!688541)) b!1029506))

(declare-fun m!948471 () Bool)

(assert (=> d!123323 m!948471))

(declare-fun m!948473 () Bool)

(assert (=> b!1029504 m!948473))

(assert (=> b!1029504 m!948373))

(assert (=> b!1029504 m!948373))

(declare-fun m!948475 () Bool)

(assert (=> b!1029504 m!948475))

(assert (=> b!1029506 m!948373))

(assert (=> b!1029506 m!948373))

(assert (=> b!1029506 m!948475))

(assert (=> bm!43379 d!123323))

(assert (=> b!1029169 d!123259))

(assert (=> b!1029170 d!123259))

(assert (=> b!1029249 d!123259))

(declare-fun b!1029507 () Bool)

(declare-fun e!581209 () Bool)

(declare-fun call!43398 () Bool)

(assert (=> b!1029507 (= e!581209 call!43398)))

(declare-fun b!1029508 () Bool)

(assert (=> b!1029508 (= e!581209 call!43398)))

(declare-fun c!104139 () Bool)

(declare-fun bm!43395 () Bool)

(assert (=> bm!43395 (= call!43398 (arrayNoDuplicates!0 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104139 (Cons!21793 (select (arr!31147 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427)))) #b00000000000000000000000000000000) Nil!21794) Nil!21794)))))

(declare-fun b!1029509 () Bool)

(declare-fun e!581207 () Bool)

(assert (=> b!1029509 (= e!581207 e!581209)))

(assert (=> b!1029509 (= c!104139 (validKeyInArray!0 (select (arr!31147 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1029510 () Bool)

(declare-fun e!581208 () Bool)

(assert (=> b!1029510 (= e!581208 e!581207)))

(declare-fun res!688542 () Bool)

(assert (=> b!1029510 (=> (not res!688542) (not e!581207))))

(declare-fun e!581206 () Bool)

(assert (=> b!1029510 (= res!688542 (not e!581206))))

(declare-fun res!688544 () Bool)

(assert (=> b!1029510 (=> (not res!688544) (not e!581206))))

(assert (=> b!1029510 (= res!688544 (validKeyInArray!0 (select (arr!31147 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!123325 () Bool)

(declare-fun res!688543 () Bool)

(assert (=> d!123325 (=> res!688543 e!581208)))

(assert (=> d!123325 (= res!688543 (bvsge #b00000000000000000000000000000000 (size!31661 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))))))))

(assert (=> d!123325 (= (arrayNoDuplicates!0 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) #b00000000000000000000000000000000 Nil!21794) e!581208)))

(declare-fun b!1029511 () Bool)

(assert (=> b!1029511 (= e!581206 (contains!5989 Nil!21794 (select (arr!31147 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!123325 (not res!688543)) b!1029510))

(assert (= (and b!1029510 res!688544) b!1029511))

(assert (= (and b!1029510 res!688542) b!1029509))

(assert (= (and b!1029509 c!104139) b!1029507))

(assert (= (and b!1029509 (not c!104139)) b!1029508))

(assert (= (or b!1029507 b!1029508) bm!43395))

(assert (=> bm!43395 m!948303))

(declare-fun m!948477 () Bool)

(assert (=> bm!43395 m!948477))

(assert (=> b!1029509 m!948303))

(assert (=> b!1029509 m!948303))

(assert (=> b!1029509 m!948305))

(assert (=> b!1029510 m!948303))

(assert (=> b!1029510 m!948303))

(assert (=> b!1029510 m!948305))

(assert (=> b!1029511 m!948303))

(assert (=> b!1029511 m!948303))

(declare-fun m!948479 () Bool)

(assert (=> b!1029511 m!948479))

(assert (=> b!1029174 d!123325))

(assert (=> b!1029276 d!123281))

(declare-fun d!123327 () Bool)

(assert (=> d!123327 (= (apply!909 lt!453157 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16371 (getValueByKey!580 (toList!6855 lt!453157) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30023 () Bool)

(assert (= bs!30023 d!123327))

(assert (=> bs!30023 m!948409))

(assert (=> bs!30023 m!948409))

(declare-fun m!948481 () Bool)

(assert (=> bs!30023 m!948481))

(assert (=> b!1029247 d!123327))

(declare-fun d!123329 () Bool)

(assert (=> d!123329 (= (-!478 (getCurrentListMap!3901 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)) key!909) (getCurrentListMap!3901 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) (array!64694 (store (arr!31148 (_values!6118 thiss!1427)) (index!40892 lt!453013) (ValueCellFull!11444 (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31662 (_values!6118 thiss!1427))) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(assert (=> d!123329 true))

(declare-fun _$9!35 () Unit!33562)

(assert (=> d!123329 (= (choose!1686 (_keys!11282 thiss!1427) (_values!6118 thiss!1427) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (index!40892 lt!453013) key!909 (defaultEntry!6095 thiss!1427)) _$9!35)))

(declare-fun b_lambda!15777 () Bool)

(assert (=> (not b_lambda!15777) (not d!123329)))

(assert (=> d!123329 t!30857))

(declare-fun b_and!32869 () Bool)

(assert (= b_and!32867 (and (=> t!30857 result!14095) b_and!32869)))

(assert (=> d!123329 m!947935))

(assert (=> d!123329 m!947953))

(assert (=> d!123329 m!947955))

(assert (=> d!123329 m!947953))

(assert (=> d!123329 m!947961))

(assert (=> d!123329 m!948093))

(assert (=> d!123329 m!947959))

(assert (=> d!123217 d!123329))

(assert (=> d!123217 d!123261))

(declare-fun b!1029530 () Bool)

(declare-fun e!581221 () Bool)

(declare-fun lt!453323 () SeekEntryResult!9630)

(assert (=> b!1029530 (= e!581221 (bvsge (x!91436 lt!453323) #b01111111111111111111111111111110))))

(declare-fun b!1029531 () Bool)

(declare-fun e!581224 () SeekEntryResult!9630)

(assert (=> b!1029531 (= e!581224 (Intermediate!9630 false (toIndex!0 key!909 (mask!29879 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1029532 () Bool)

(assert (=> b!1029532 (and (bvsge (index!40893 lt!453323) #b00000000000000000000000000000000) (bvslt (index!40893 lt!453323) (size!31661 (_keys!11282 thiss!1427))))))

(declare-fun res!688552 () Bool)

(assert (=> b!1029532 (= res!688552 (= (select (arr!31147 (_keys!11282 thiss!1427)) (index!40893 lt!453323)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!581223 () Bool)

(assert (=> b!1029532 (=> res!688552 e!581223)))

(declare-fun b!1029533 () Bool)

(assert (=> b!1029533 (and (bvsge (index!40893 lt!453323) #b00000000000000000000000000000000) (bvslt (index!40893 lt!453323) (size!31661 (_keys!11282 thiss!1427))))))

(declare-fun res!688553 () Bool)

(assert (=> b!1029533 (= res!688553 (= (select (arr!31147 (_keys!11282 thiss!1427)) (index!40893 lt!453323)) key!909))))

(assert (=> b!1029533 (=> res!688553 e!581223)))

(declare-fun e!581220 () Bool)

(assert (=> b!1029533 (= e!581220 e!581223)))

(declare-fun b!1029534 () Bool)

(declare-fun e!581222 () SeekEntryResult!9630)

(assert (=> b!1029534 (= e!581222 e!581224)))

(declare-fun c!104146 () Bool)

(declare-fun lt!453322 () (_ BitVec 64))

(assert (=> b!1029534 (= c!104146 (or (= lt!453322 key!909) (= (bvadd lt!453322 lt!453322) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1029535 () Bool)

(assert (=> b!1029535 (= e!581222 (Intermediate!9630 true (toIndex!0 key!909 (mask!29879 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1029536 () Bool)

(assert (=> b!1029536 (and (bvsge (index!40893 lt!453323) #b00000000000000000000000000000000) (bvslt (index!40893 lt!453323) (size!31661 (_keys!11282 thiss!1427))))))

(assert (=> b!1029536 (= e!581223 (= (select (arr!31147 (_keys!11282 thiss!1427)) (index!40893 lt!453323)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029537 () Bool)

(assert (=> b!1029537 (= e!581221 e!581220)))

(declare-fun res!688551 () Bool)

(assert (=> b!1029537 (= res!688551 (and ((_ is Intermediate!9630) lt!453323) (not (undefined!10442 lt!453323)) (bvslt (x!91436 lt!453323) #b01111111111111111111111111111110) (bvsge (x!91436 lt!453323) #b00000000000000000000000000000000) (bvsge (x!91436 lt!453323) #b00000000000000000000000000000000)))))

(assert (=> b!1029537 (=> (not res!688551) (not e!581220))))

(declare-fun b!1029538 () Bool)

(assert (=> b!1029538 (= e!581224 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!29879 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!29879 thiss!1427)) key!909 (_keys!11282 thiss!1427) (mask!29879 thiss!1427)))))

(declare-fun d!123331 () Bool)

(assert (=> d!123331 e!581221))

(declare-fun c!104148 () Bool)

(assert (=> d!123331 (= c!104148 (and ((_ is Intermediate!9630) lt!453323) (undefined!10442 lt!453323)))))

(assert (=> d!123331 (= lt!453323 e!581222)))

(declare-fun c!104147 () Bool)

(assert (=> d!123331 (= c!104147 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!123331 (= lt!453322 (select (arr!31147 (_keys!11282 thiss!1427)) (toIndex!0 key!909 (mask!29879 thiss!1427))))))

(assert (=> d!123331 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123331 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29879 thiss!1427)) key!909 (_keys!11282 thiss!1427) (mask!29879 thiss!1427)) lt!453323)))

(assert (= (and d!123331 c!104147) b!1029535))

(assert (= (and d!123331 (not c!104147)) b!1029534))

(assert (= (and b!1029534 c!104146) b!1029531))

(assert (= (and b!1029534 (not c!104146)) b!1029538))

(assert (= (and d!123331 c!104148) b!1029530))

(assert (= (and d!123331 (not c!104148)) b!1029537))

(assert (= (and b!1029537 res!688551) b!1029533))

(assert (= (and b!1029533 (not res!688553)) b!1029532))

(assert (= (and b!1029532 (not res!688552)) b!1029536))

(declare-fun m!948483 () Bool)

(assert (=> b!1029536 m!948483))

(assert (=> b!1029532 m!948483))

(assert (=> d!123331 m!948075))

(declare-fun m!948485 () Bool)

(assert (=> d!123331 m!948485))

(assert (=> d!123331 m!948079))

(assert (=> b!1029538 m!948075))

(declare-fun m!948487 () Bool)

(assert (=> b!1029538 m!948487))

(assert (=> b!1029538 m!948487))

(declare-fun m!948489 () Bool)

(assert (=> b!1029538 m!948489))

(assert (=> b!1029533 m!948483))

(assert (=> d!123209 d!123331))

(declare-fun d!123333 () Bool)

(declare-fun lt!453329 () (_ BitVec 32))

(declare-fun lt!453328 () (_ BitVec 32))

(assert (=> d!123333 (= lt!453329 (bvmul (bvxor lt!453328 (bvlshr lt!453328 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!123333 (= lt!453328 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!123333 (and (bvsge (mask!29879 thiss!1427) #b00000000000000000000000000000000) (let ((res!688554 (let ((h!23005 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!91472 (bvmul (bvxor h!23005 (bvlshr h!23005 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!91472 (bvlshr x!91472 #b00000000000000000000000000001101)) (mask!29879 thiss!1427)))))) (and (bvslt res!688554 (bvadd (mask!29879 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!688554 #b00000000000000000000000000000000))))))

(assert (=> d!123333 (= (toIndex!0 key!909 (mask!29879 thiss!1427)) (bvand (bvxor lt!453329 (bvlshr lt!453329 #b00000000000000000000000000001101)) (mask!29879 thiss!1427)))))

(assert (=> d!123209 d!123333))

(assert (=> d!123209 d!123261))

(declare-fun d!123335 () Bool)

(assert (=> d!123335 (arrayNoDuplicates!0 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) #b00000000000000000000000000000000 Nil!21794)))

(assert (=> d!123335 true))

(declare-fun _$66!32 () Unit!33562)

(assert (=> d!123335 (= (choose!53 (_keys!11282 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40892 lt!453013) #b00000000000000000000000000000000 Nil!21794) _$66!32)))

(declare-fun bs!30024 () Bool)

(assert (= bs!30024 d!123335))

(assert (=> bs!30024 m!947961))

(assert (=> bs!30024 m!948109))

(assert (=> d!123223 d!123335))

(declare-fun d!123337 () Bool)

(assert (=> d!123337 (= (apply!909 lt!453179 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16371 (getValueByKey!580 (toList!6855 lt!453179) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30025 () Bool)

(assert (= bs!30025 d!123337))

(assert (=> bs!30025 m!948417))

(assert (=> bs!30025 m!948417))

(declare-fun m!948491 () Bool)

(assert (=> bs!30025 m!948491))

(assert (=> b!1029274 d!123337))

(assert (=> b!1029156 d!123221))

(assert (=> b!1029156 d!123233))

(declare-fun b!1029539 () Bool)

(declare-fun e!581236 () Bool)

(declare-fun call!43401 () Bool)

(assert (=> b!1029539 (= e!581236 (not call!43401))))

(declare-fun bm!43396 () Bool)

(declare-fun call!43402 () ListLongMap!13679)

(assert (=> bm!43396 (= call!43402 (getCurrentListMapNoExtraKeys!3560 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) (array!64694 (store (arr!31148 (_values!6118 thiss!1427)) (index!40892 lt!453013) (ValueCellFull!11444 (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31662 (_values!6118 thiss!1427))) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun b!1029540 () Bool)

(declare-fun e!581237 () Unit!33562)

(declare-fun lt!453330 () Unit!33562)

(assert (=> b!1029540 (= e!581237 lt!453330)))

(declare-fun lt!453333 () ListLongMap!13679)

(assert (=> b!1029540 (= lt!453333 (getCurrentListMapNoExtraKeys!3560 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) (array!64694 (store (arr!31148 (_values!6118 thiss!1427)) (index!40892 lt!453013) (ValueCellFull!11444 (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31662 (_values!6118 thiss!1427))) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!453340 () (_ BitVec 64))

(assert (=> b!1029540 (= lt!453340 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453343 () (_ BitVec 64))

(assert (=> b!1029540 (= lt!453343 (select (arr!31147 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453335 () Unit!33562)

(assert (=> b!1029540 (= lt!453335 (addStillContains!619 lt!453333 lt!453340 (zeroValue!5931 thiss!1427) lt!453343))))

(assert (=> b!1029540 (contains!5990 (+!3120 lt!453333 (tuple2!15541 lt!453340 (zeroValue!5931 thiss!1427))) lt!453343)))

(declare-fun lt!453341 () Unit!33562)

(assert (=> b!1029540 (= lt!453341 lt!453335)))

(declare-fun lt!453348 () ListLongMap!13679)

(assert (=> b!1029540 (= lt!453348 (getCurrentListMapNoExtraKeys!3560 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) (array!64694 (store (arr!31148 (_values!6118 thiss!1427)) (index!40892 lt!453013) (ValueCellFull!11444 (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31662 (_values!6118 thiss!1427))) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!453331 () (_ BitVec 64))

(assert (=> b!1029540 (= lt!453331 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453339 () (_ BitVec 64))

(assert (=> b!1029540 (= lt!453339 (select (arr!31147 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453351 () Unit!33562)

(assert (=> b!1029540 (= lt!453351 (addApplyDifferent!475 lt!453348 lt!453331 (minValue!5931 thiss!1427) lt!453339))))

(assert (=> b!1029540 (= (apply!909 (+!3120 lt!453348 (tuple2!15541 lt!453331 (minValue!5931 thiss!1427))) lt!453339) (apply!909 lt!453348 lt!453339))))

(declare-fun lt!453344 () Unit!33562)

(assert (=> b!1029540 (= lt!453344 lt!453351)))

(declare-fun lt!453338 () ListLongMap!13679)

(assert (=> b!1029540 (= lt!453338 (getCurrentListMapNoExtraKeys!3560 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) (array!64694 (store (arr!31148 (_values!6118 thiss!1427)) (index!40892 lt!453013) (ValueCellFull!11444 (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31662 (_values!6118 thiss!1427))) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!453345 () (_ BitVec 64))

(assert (=> b!1029540 (= lt!453345 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453347 () (_ BitVec 64))

(assert (=> b!1029540 (= lt!453347 (select (arr!31147 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!453342 () Unit!33562)

(assert (=> b!1029540 (= lt!453342 (addApplyDifferent!475 lt!453338 lt!453345 (zeroValue!5931 thiss!1427) lt!453347))))

(assert (=> b!1029540 (= (apply!909 (+!3120 lt!453338 (tuple2!15541 lt!453345 (zeroValue!5931 thiss!1427))) lt!453347) (apply!909 lt!453338 lt!453347))))

(declare-fun lt!453334 () Unit!33562)

(assert (=> b!1029540 (= lt!453334 lt!453342)))

(declare-fun lt!453346 () ListLongMap!13679)

(assert (=> b!1029540 (= lt!453346 (getCurrentListMapNoExtraKeys!3560 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) (array!64694 (store (arr!31148 (_values!6118 thiss!1427)) (index!40892 lt!453013) (ValueCellFull!11444 (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31662 (_values!6118 thiss!1427))) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!453332 () (_ BitVec 64))

(assert (=> b!1029540 (= lt!453332 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453349 () (_ BitVec 64))

(assert (=> b!1029540 (= lt!453349 (select (arr!31147 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427)))) #b00000000000000000000000000000000))))

(assert (=> b!1029540 (= lt!453330 (addApplyDifferent!475 lt!453346 lt!453332 (minValue!5931 thiss!1427) lt!453349))))

(assert (=> b!1029540 (= (apply!909 (+!3120 lt!453346 (tuple2!15541 lt!453332 (minValue!5931 thiss!1427))) lt!453349) (apply!909 lt!453346 lt!453349))))

(declare-fun b!1029541 () Bool)

(declare-fun e!581228 () Bool)

(declare-fun lt!453336 () ListLongMap!13679)

(assert (=> b!1029541 (= e!581228 (= (apply!909 lt!453336 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5931 thiss!1427)))))

(declare-fun b!1029542 () Bool)

(declare-fun e!581231 () ListLongMap!13679)

(declare-fun call!43404 () ListLongMap!13679)

(assert (=> b!1029542 (= e!581231 call!43404)))

(declare-fun bm!43397 () Bool)

(declare-fun call!43400 () ListLongMap!13679)

(declare-fun call!43405 () ListLongMap!13679)

(assert (=> bm!43397 (= call!43400 call!43405)))

(declare-fun d!123339 () Bool)

(declare-fun e!581230 () Bool)

(assert (=> d!123339 e!581230))

(declare-fun res!688557 () Bool)

(assert (=> d!123339 (=> (not res!688557) (not e!581230))))

(assert (=> d!123339 (= res!688557 (or (bvsge #b00000000000000000000000000000000 (size!31661 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31661 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))))))))))

(declare-fun lt!453350 () ListLongMap!13679)

(assert (=> d!123339 (= lt!453336 lt!453350)))

(declare-fun lt!453337 () Unit!33562)

(assert (=> d!123339 (= lt!453337 e!581237)))

(declare-fun c!104154 () Bool)

(declare-fun e!581234 () Bool)

(assert (=> d!123339 (= c!104154 e!581234)))

(declare-fun res!688560 () Bool)

(assert (=> d!123339 (=> (not res!688560) (not e!581234))))

(assert (=> d!123339 (= res!688560 (bvslt #b00000000000000000000000000000000 (size!31661 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))))))))

(declare-fun e!581225 () ListLongMap!13679)

(assert (=> d!123339 (= lt!453350 e!581225)))

(declare-fun c!104152 () Bool)

(assert (=> d!123339 (= c!104152 (and (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123339 (validMask!0 (mask!29879 thiss!1427))))

(assert (=> d!123339 (= (getCurrentListMap!3901 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))) (array!64694 (store (arr!31148 (_values!6118 thiss!1427)) (index!40892 lt!453013) (ValueCellFull!11444 (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31662 (_values!6118 thiss!1427))) (mask!29879 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)) lt!453336)))

(declare-fun b!1029543 () Bool)

(assert (=> b!1029543 (= e!581234 (validKeyInArray!0 (select (arr!31147 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1029544 () Bool)

(declare-fun res!688556 () Bool)

(assert (=> b!1029544 (=> (not res!688556) (not e!581230))))

(declare-fun e!581235 () Bool)

(assert (=> b!1029544 (= res!688556 e!581235)))

(declare-fun c!104150 () Bool)

(assert (=> b!1029544 (= c!104150 (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1029545 () Bool)

(declare-fun e!581226 () Bool)

(assert (=> b!1029545 (= e!581226 (= (apply!909 lt!453336 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5931 thiss!1427)))))

(declare-fun e!581229 () Bool)

(declare-fun b!1029546 () Bool)

(assert (=> b!1029546 (= e!581229 (= (apply!909 lt!453336 (select (arr!31147 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427)))) #b00000000000000000000000000000000)) (get!16370 (select (arr!31148 (array!64694 (store (arr!31148 (_values!6118 thiss!1427)) (index!40892 lt!453013) (ValueCellFull!11444 (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31662 (_values!6118 thiss!1427)))) #b00000000000000000000000000000000) (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029546 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31662 (array!64694 (store (arr!31148 (_values!6118 thiss!1427)) (index!40892 lt!453013) (ValueCellFull!11444 (dynLambda!1972 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31662 (_values!6118 thiss!1427))))))))

(assert (=> b!1029546 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31661 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))))))))

(declare-fun b!1029547 () Bool)

(declare-fun e!581232 () Bool)

(assert (=> b!1029547 (= e!581232 (validKeyInArray!0 (select (arr!31147 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1029548 () Bool)

(assert (=> b!1029548 (= e!581230 e!581236)))

(declare-fun c!104153 () Bool)

(assert (=> b!1029548 (= c!104153 (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1029549 () Bool)

(declare-fun res!688558 () Bool)

(assert (=> b!1029549 (=> (not res!688558) (not e!581230))))

(declare-fun e!581227 () Bool)

(assert (=> b!1029549 (= res!688558 e!581227)))

(declare-fun res!688555 () Bool)

(assert (=> b!1029549 (=> res!688555 e!581227)))

(assert (=> b!1029549 (= res!688555 (not e!581232))))

(declare-fun res!688563 () Bool)

(assert (=> b!1029549 (=> (not res!688563) (not e!581232))))

(assert (=> b!1029549 (= res!688563 (bvslt #b00000000000000000000000000000000 (size!31661 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))))))))

(declare-fun b!1029550 () Bool)

(assert (=> b!1029550 (= e!581235 e!581226)))

(declare-fun res!688562 () Bool)

(declare-fun call!43399 () Bool)

(assert (=> b!1029550 (= res!688562 call!43399)))

(assert (=> b!1029550 (=> (not res!688562) (not e!581226))))

(declare-fun b!1029551 () Bool)

(declare-fun c!104151 () Bool)

(assert (=> b!1029551 (= c!104151 (and (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!581233 () ListLongMap!13679)

(assert (=> b!1029551 (= e!581233 e!581231)))

(declare-fun bm!43398 () Bool)

(declare-fun call!43403 () ListLongMap!13679)

(assert (=> bm!43398 (= call!43404 call!43403)))

(declare-fun c!104149 () Bool)

(declare-fun bm!43399 () Bool)

(assert (=> bm!43399 (= call!43405 (+!3120 (ite c!104152 call!43402 (ite c!104149 call!43403 call!43404)) (ite (or c!104152 c!104149) (tuple2!15541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(declare-fun bm!43400 () Bool)

(assert (=> bm!43400 (= call!43401 (contains!5990 lt!453336 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43401 () Bool)

(assert (=> bm!43401 (= call!43403 call!43402)))

(declare-fun b!1029552 () Bool)

(assert (=> b!1029552 (= e!581236 e!581228)))

(declare-fun res!688561 () Bool)

(assert (=> b!1029552 (= res!688561 call!43401)))

(assert (=> b!1029552 (=> (not res!688561) (not e!581228))))

(declare-fun b!1029553 () Bool)

(assert (=> b!1029553 (= e!581225 e!581233)))

(assert (=> b!1029553 (= c!104149 (and (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43402 () Bool)

(assert (=> bm!43402 (= call!43399 (contains!5990 lt!453336 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029554 () Bool)

(assert (=> b!1029554 (= e!581227 e!581229)))

(declare-fun res!688559 () Bool)

(assert (=> b!1029554 (=> (not res!688559) (not e!581229))))

(assert (=> b!1029554 (= res!688559 (contains!5990 lt!453336 (select (arr!31147 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> b!1029554 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31661 (array!64692 (store (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31661 (_keys!11282 thiss!1427))))))))

(declare-fun b!1029555 () Bool)

(assert (=> b!1029555 (= e!581225 (+!3120 call!43405 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))

(declare-fun b!1029556 () Bool)

(assert (=> b!1029556 (= e!581233 call!43400)))

(declare-fun b!1029557 () Bool)

(assert (=> b!1029557 (= e!581235 (not call!43399))))

(declare-fun b!1029558 () Bool)

(declare-fun Unit!33583 () Unit!33562)

(assert (=> b!1029558 (= e!581237 Unit!33583)))

(declare-fun b!1029559 () Bool)

(assert (=> b!1029559 (= e!581231 call!43400)))

(assert (= (and d!123339 c!104152) b!1029555))

(assert (= (and d!123339 (not c!104152)) b!1029553))

(assert (= (and b!1029553 c!104149) b!1029556))

(assert (= (and b!1029553 (not c!104149)) b!1029551))

(assert (= (and b!1029551 c!104151) b!1029559))

(assert (= (and b!1029551 (not c!104151)) b!1029542))

(assert (= (or b!1029559 b!1029542) bm!43398))

(assert (= (or b!1029556 bm!43398) bm!43401))

(assert (= (or b!1029556 b!1029559) bm!43397))

(assert (= (or b!1029555 bm!43401) bm!43396))

(assert (= (or b!1029555 bm!43397) bm!43399))

(assert (= (and d!123339 res!688560) b!1029543))

(assert (= (and d!123339 c!104154) b!1029540))

(assert (= (and d!123339 (not c!104154)) b!1029558))

(assert (= (and d!123339 res!688557) b!1029549))

(assert (= (and b!1029549 res!688563) b!1029547))

(assert (= (and b!1029549 (not res!688555)) b!1029554))

(assert (= (and b!1029554 res!688559) b!1029546))

(assert (= (and b!1029549 res!688558) b!1029544))

(assert (= (and b!1029544 c!104150) b!1029550))

(assert (= (and b!1029544 (not c!104150)) b!1029557))

(assert (= (and b!1029550 res!688562) b!1029545))

(assert (= (or b!1029550 b!1029557) bm!43402))

(assert (= (and b!1029544 res!688556) b!1029548))

(assert (= (and b!1029548 c!104153) b!1029552))

(assert (= (and b!1029548 (not c!104153)) b!1029539))

(assert (= (and b!1029552 res!688561) b!1029541))

(assert (= (or b!1029552 b!1029539) bm!43400))

(declare-fun b_lambda!15779 () Bool)

(assert (=> (not b_lambda!15779) (not b!1029546)))

(assert (=> b!1029546 t!30857))

(declare-fun b_and!32871 () Bool)

(assert (= b_and!32869 (and (=> t!30857 result!14095) b_and!32871)))

(declare-fun m!948493 () Bool)

(assert (=> b!1029546 m!948493))

(assert (=> b!1029546 m!947959))

(declare-fun m!948495 () Bool)

(assert (=> b!1029546 m!948495))

(assert (=> b!1029546 m!948303))

(declare-fun m!948497 () Bool)

(assert (=> b!1029546 m!948497))

(assert (=> b!1029546 m!947959))

(assert (=> b!1029546 m!948303))

(assert (=> b!1029546 m!948493))

(assert (=> b!1029543 m!948303))

(assert (=> b!1029543 m!948303))

(assert (=> b!1029543 m!948305))

(assert (=> b!1029554 m!948303))

(assert (=> b!1029554 m!948303))

(declare-fun m!948499 () Bool)

(assert (=> b!1029554 m!948499))

(assert (=> b!1029547 m!948303))

(assert (=> b!1029547 m!948303))

(assert (=> b!1029547 m!948305))

(declare-fun m!948501 () Bool)

(assert (=> bm!43399 m!948501))

(declare-fun m!948503 () Bool)

(assert (=> b!1029541 m!948503))

(declare-fun m!948505 () Bool)

(assert (=> b!1029555 m!948505))

(declare-fun m!948507 () Bool)

(assert (=> bm!43400 m!948507))

(declare-fun m!948509 () Bool)

(assert (=> bm!43402 m!948509))

(declare-fun m!948511 () Bool)

(assert (=> b!1029540 m!948511))

(declare-fun m!948513 () Bool)

(assert (=> b!1029540 m!948513))

(declare-fun m!948515 () Bool)

(assert (=> b!1029540 m!948515))

(declare-fun m!948517 () Bool)

(assert (=> b!1029540 m!948517))

(declare-fun m!948519 () Bool)

(assert (=> b!1029540 m!948519))

(declare-fun m!948521 () Bool)

(assert (=> b!1029540 m!948521))

(declare-fun m!948523 () Bool)

(assert (=> b!1029540 m!948523))

(assert (=> b!1029540 m!948517))

(declare-fun m!948525 () Bool)

(assert (=> b!1029540 m!948525))

(declare-fun m!948527 () Bool)

(assert (=> b!1029540 m!948527))

(declare-fun m!948529 () Bool)

(assert (=> b!1029540 m!948529))

(declare-fun m!948531 () Bool)

(assert (=> b!1029540 m!948531))

(declare-fun m!948533 () Bool)

(assert (=> b!1029540 m!948533))

(assert (=> b!1029540 m!948303))

(assert (=> b!1029540 m!948519))

(declare-fun m!948535 () Bool)

(assert (=> b!1029540 m!948535))

(assert (=> b!1029540 m!948511))

(declare-fun m!948537 () Bool)

(assert (=> b!1029540 m!948537))

(declare-fun m!948539 () Bool)

(assert (=> b!1029540 m!948539))

(assert (=> b!1029540 m!948527))

(declare-fun m!948541 () Bool)

(assert (=> b!1029540 m!948541))

(declare-fun m!948543 () Bool)

(assert (=> b!1029545 m!948543))

(assert (=> d!123339 m!948079))

(assert (=> bm!43396 m!948523))

(assert (=> b!1029156 d!123339))

(assert (=> b!1029245 d!123259))

(assert (=> b!1029272 d!123281))

(declare-fun d!123341 () Bool)

(assert (=> d!123341 (= (apply!909 (+!3120 lt!453159 (tuple2!15541 lt!453166 (zeroValue!5931 thiss!1427))) lt!453168) (get!16371 (getValueByKey!580 (toList!6855 (+!3120 lt!453159 (tuple2!15541 lt!453166 (zeroValue!5931 thiss!1427)))) lt!453168)))))

(declare-fun bs!30026 () Bool)

(assert (= bs!30026 d!123341))

(declare-fun m!948545 () Bool)

(assert (=> bs!30026 m!948545))

(assert (=> bs!30026 m!948545))

(declare-fun m!948547 () Bool)

(assert (=> bs!30026 m!948547))

(assert (=> b!1029242 d!123341))

(declare-fun d!123343 () Bool)

(assert (=> d!123343 (= (apply!909 (+!3120 lt!453167 (tuple2!15541 lt!453153 (minValue!5931 thiss!1427))) lt!453170) (apply!909 lt!453167 lt!453170))))

(declare-fun lt!453354 () Unit!33562)

(declare-fun choose!1687 (ListLongMap!13679 (_ BitVec 64) V!37267 (_ BitVec 64)) Unit!33562)

(assert (=> d!123343 (= lt!453354 (choose!1687 lt!453167 lt!453153 (minValue!5931 thiss!1427) lt!453170))))

(declare-fun e!581240 () Bool)

(assert (=> d!123343 e!581240))

(declare-fun res!688566 () Bool)

(assert (=> d!123343 (=> (not res!688566) (not e!581240))))

(assert (=> d!123343 (= res!688566 (contains!5990 lt!453167 lt!453170))))

(assert (=> d!123343 (= (addApplyDifferent!475 lt!453167 lt!453153 (minValue!5931 thiss!1427) lt!453170) lt!453354)))

(declare-fun b!1029563 () Bool)

(assert (=> b!1029563 (= e!581240 (not (= lt!453170 lt!453153)))))

(assert (= (and d!123343 res!688566) b!1029563))

(assert (=> d!123343 m!948163))

(assert (=> d!123343 m!948151))

(assert (=> d!123343 m!948153))

(declare-fun m!948549 () Bool)

(assert (=> d!123343 m!948549))

(declare-fun m!948551 () Bool)

(assert (=> d!123343 m!948551))

(assert (=> d!123343 m!948151))

(assert (=> b!1029242 d!123343))

(declare-fun d!123345 () Bool)

(assert (=> d!123345 (= (apply!909 (+!3120 lt!453169 (tuple2!15541 lt!453152 (minValue!5931 thiss!1427))) lt!453160) (apply!909 lt!453169 lt!453160))))

(declare-fun lt!453355 () Unit!33562)

(assert (=> d!123345 (= lt!453355 (choose!1687 lt!453169 lt!453152 (minValue!5931 thiss!1427) lt!453160))))

(declare-fun e!581241 () Bool)

(assert (=> d!123345 e!581241))

(declare-fun res!688567 () Bool)

(assert (=> d!123345 (=> (not res!688567) (not e!581241))))

(assert (=> d!123345 (= res!688567 (contains!5990 lt!453169 lt!453160))))

(assert (=> d!123345 (= (addApplyDifferent!475 lt!453169 lt!453152 (minValue!5931 thiss!1427) lt!453160) lt!453355)))

(declare-fun b!1029564 () Bool)

(assert (=> b!1029564 (= e!581241 (not (= lt!453160 lt!453152)))))

(assert (= (and d!123345 res!688567) b!1029564))

(assert (=> d!123345 m!948165))

(assert (=> d!123345 m!948143))

(assert (=> d!123345 m!948145))

(declare-fun m!948553 () Bool)

(assert (=> d!123345 m!948553))

(declare-fun m!948555 () Bool)

(assert (=> d!123345 m!948555))

(assert (=> d!123345 m!948143))

(assert (=> b!1029242 d!123345))

(declare-fun d!123347 () Bool)

(assert (=> d!123347 (= (apply!909 (+!3120 lt!453167 (tuple2!15541 lt!453153 (minValue!5931 thiss!1427))) lt!453170) (get!16371 (getValueByKey!580 (toList!6855 (+!3120 lt!453167 (tuple2!15541 lt!453153 (minValue!5931 thiss!1427)))) lt!453170)))))

(declare-fun bs!30027 () Bool)

(assert (= bs!30027 d!123347))

(declare-fun m!948557 () Bool)

(assert (=> bs!30027 m!948557))

(assert (=> bs!30027 m!948557))

(declare-fun m!948559 () Bool)

(assert (=> bs!30027 m!948559))

(assert (=> b!1029242 d!123347))

(declare-fun d!123349 () Bool)

(declare-fun e!581242 () Bool)

(assert (=> d!123349 e!581242))

(declare-fun res!688568 () Bool)

(assert (=> d!123349 (=> (not res!688568) (not e!581242))))

(declare-fun lt!453358 () ListLongMap!13679)

(assert (=> d!123349 (= res!688568 (contains!5990 lt!453358 (_1!7781 (tuple2!15541 lt!453152 (minValue!5931 thiss!1427)))))))

(declare-fun lt!453357 () List!21796)

(assert (=> d!123349 (= lt!453358 (ListLongMap!13680 lt!453357))))

(declare-fun lt!453359 () Unit!33562)

(declare-fun lt!453356 () Unit!33562)

(assert (=> d!123349 (= lt!453359 lt!453356)))

(assert (=> d!123349 (= (getValueByKey!580 lt!453357 (_1!7781 (tuple2!15541 lt!453152 (minValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 lt!453152 (minValue!5931 thiss!1427)))))))

(assert (=> d!123349 (= lt!453356 (lemmaContainsTupThenGetReturnValue!276 lt!453357 (_1!7781 (tuple2!15541 lt!453152 (minValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 lt!453152 (minValue!5931 thiss!1427)))))))

(assert (=> d!123349 (= lt!453357 (insertStrictlySorted!369 (toList!6855 lt!453169) (_1!7781 (tuple2!15541 lt!453152 (minValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 lt!453152 (minValue!5931 thiss!1427)))))))

(assert (=> d!123349 (= (+!3120 lt!453169 (tuple2!15541 lt!453152 (minValue!5931 thiss!1427))) lt!453358)))

(declare-fun b!1029565 () Bool)

(declare-fun res!688569 () Bool)

(assert (=> b!1029565 (=> (not res!688569) (not e!581242))))

(assert (=> b!1029565 (= res!688569 (= (getValueByKey!580 (toList!6855 lt!453358) (_1!7781 (tuple2!15541 lt!453152 (minValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 lt!453152 (minValue!5931 thiss!1427))))))))

(declare-fun b!1029566 () Bool)

(assert (=> b!1029566 (= e!581242 (contains!5991 (toList!6855 lt!453358) (tuple2!15541 lt!453152 (minValue!5931 thiss!1427))))))

(assert (= (and d!123349 res!688568) b!1029565))

(assert (= (and b!1029565 res!688569) b!1029566))

(declare-fun m!948561 () Bool)

(assert (=> d!123349 m!948561))

(declare-fun m!948563 () Bool)

(assert (=> d!123349 m!948563))

(declare-fun m!948565 () Bool)

(assert (=> d!123349 m!948565))

(declare-fun m!948567 () Bool)

(assert (=> d!123349 m!948567))

(declare-fun m!948569 () Bool)

(assert (=> b!1029565 m!948569))

(declare-fun m!948571 () Bool)

(assert (=> b!1029566 m!948571))

(assert (=> b!1029242 d!123349))

(declare-fun d!123351 () Bool)

(assert (=> d!123351 (= (apply!909 lt!453159 lt!453168) (get!16371 (getValueByKey!580 (toList!6855 lt!453159) lt!453168)))))

(declare-fun bs!30028 () Bool)

(assert (= bs!30028 d!123351))

(declare-fun m!948573 () Bool)

(assert (=> bs!30028 m!948573))

(assert (=> bs!30028 m!948573))

(declare-fun m!948575 () Bool)

(assert (=> bs!30028 m!948575))

(assert (=> b!1029242 d!123351))

(declare-fun d!123353 () Bool)

(declare-fun e!581243 () Bool)

(assert (=> d!123353 e!581243))

(declare-fun res!688570 () Bool)

(assert (=> d!123353 (=> res!688570 e!581243)))

(declare-fun lt!453360 () Bool)

(assert (=> d!123353 (= res!688570 (not lt!453360))))

(declare-fun lt!453361 () Bool)

(assert (=> d!123353 (= lt!453360 lt!453361)))

(declare-fun lt!453363 () Unit!33562)

(declare-fun e!581244 () Unit!33562)

(assert (=> d!123353 (= lt!453363 e!581244)))

(declare-fun c!104155 () Bool)

(assert (=> d!123353 (= c!104155 lt!453361)))

(assert (=> d!123353 (= lt!453361 (containsKey!561 (toList!6855 (+!3120 lt!453154 (tuple2!15541 lt!453161 (zeroValue!5931 thiss!1427)))) lt!453164))))

(assert (=> d!123353 (= (contains!5990 (+!3120 lt!453154 (tuple2!15541 lt!453161 (zeroValue!5931 thiss!1427))) lt!453164) lt!453360)))

(declare-fun b!1029567 () Bool)

(declare-fun lt!453362 () Unit!33562)

(assert (=> b!1029567 (= e!581244 lt!453362)))

(assert (=> b!1029567 (= lt!453362 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6855 (+!3120 lt!453154 (tuple2!15541 lt!453161 (zeroValue!5931 thiss!1427)))) lt!453164))))

(assert (=> b!1029567 (isDefined!430 (getValueByKey!580 (toList!6855 (+!3120 lt!453154 (tuple2!15541 lt!453161 (zeroValue!5931 thiss!1427)))) lt!453164))))

(declare-fun b!1029568 () Bool)

(declare-fun Unit!33584 () Unit!33562)

(assert (=> b!1029568 (= e!581244 Unit!33584)))

(declare-fun b!1029569 () Bool)

(assert (=> b!1029569 (= e!581243 (isDefined!430 (getValueByKey!580 (toList!6855 (+!3120 lt!453154 (tuple2!15541 lt!453161 (zeroValue!5931 thiss!1427)))) lt!453164)))))

(assert (= (and d!123353 c!104155) b!1029567))

(assert (= (and d!123353 (not c!104155)) b!1029568))

(assert (= (and d!123353 (not res!688570)) b!1029569))

(declare-fun m!948577 () Bool)

(assert (=> d!123353 m!948577))

(declare-fun m!948579 () Bool)

(assert (=> b!1029567 m!948579))

(declare-fun m!948581 () Bool)

(assert (=> b!1029567 m!948581))

(assert (=> b!1029567 m!948581))

(declare-fun m!948583 () Bool)

(assert (=> b!1029567 m!948583))

(assert (=> b!1029569 m!948581))

(assert (=> b!1029569 m!948581))

(assert (=> b!1029569 m!948583))

(assert (=> b!1029242 d!123353))

(declare-fun d!123355 () Bool)

(assert (=> d!123355 (= (apply!909 lt!453169 lt!453160) (get!16371 (getValueByKey!580 (toList!6855 lt!453169) lt!453160)))))

(declare-fun bs!30029 () Bool)

(assert (= bs!30029 d!123355))

(declare-fun m!948585 () Bool)

(assert (=> bs!30029 m!948585))

(assert (=> bs!30029 m!948585))

(declare-fun m!948587 () Bool)

(assert (=> bs!30029 m!948587))

(assert (=> b!1029242 d!123355))

(declare-fun d!123357 () Bool)

(assert (=> d!123357 (contains!5990 (+!3120 lt!453154 (tuple2!15541 lt!453161 (zeroValue!5931 thiss!1427))) lt!453164)))

(declare-fun lt!453366 () Unit!33562)

(declare-fun choose!1688 (ListLongMap!13679 (_ BitVec 64) V!37267 (_ BitVec 64)) Unit!33562)

(assert (=> d!123357 (= lt!453366 (choose!1688 lt!453154 lt!453161 (zeroValue!5931 thiss!1427) lt!453164))))

(assert (=> d!123357 (contains!5990 lt!453154 lt!453164)))

(assert (=> d!123357 (= (addStillContains!619 lt!453154 lt!453161 (zeroValue!5931 thiss!1427) lt!453164) lt!453366)))

(declare-fun bs!30030 () Bool)

(assert (= bs!30030 d!123357))

(assert (=> bs!30030 m!948159))

(assert (=> bs!30030 m!948159))

(assert (=> bs!30030 m!948173))

(declare-fun m!948589 () Bool)

(assert (=> bs!30030 m!948589))

(declare-fun m!948591 () Bool)

(assert (=> bs!30030 m!948591))

(assert (=> b!1029242 d!123357))

(declare-fun d!123359 () Bool)

(declare-fun e!581245 () Bool)

(assert (=> d!123359 e!581245))

(declare-fun res!688571 () Bool)

(assert (=> d!123359 (=> (not res!688571) (not e!581245))))

(declare-fun lt!453369 () ListLongMap!13679)

(assert (=> d!123359 (= res!688571 (contains!5990 lt!453369 (_1!7781 (tuple2!15541 lt!453153 (minValue!5931 thiss!1427)))))))

(declare-fun lt!453368 () List!21796)

(assert (=> d!123359 (= lt!453369 (ListLongMap!13680 lt!453368))))

(declare-fun lt!453370 () Unit!33562)

(declare-fun lt!453367 () Unit!33562)

(assert (=> d!123359 (= lt!453370 lt!453367)))

(assert (=> d!123359 (= (getValueByKey!580 lt!453368 (_1!7781 (tuple2!15541 lt!453153 (minValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 lt!453153 (minValue!5931 thiss!1427)))))))

(assert (=> d!123359 (= lt!453367 (lemmaContainsTupThenGetReturnValue!276 lt!453368 (_1!7781 (tuple2!15541 lt!453153 (minValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 lt!453153 (minValue!5931 thiss!1427)))))))

(assert (=> d!123359 (= lt!453368 (insertStrictlySorted!369 (toList!6855 lt!453167) (_1!7781 (tuple2!15541 lt!453153 (minValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 lt!453153 (minValue!5931 thiss!1427)))))))

(assert (=> d!123359 (= (+!3120 lt!453167 (tuple2!15541 lt!453153 (minValue!5931 thiss!1427))) lt!453369)))

(declare-fun b!1029571 () Bool)

(declare-fun res!688572 () Bool)

(assert (=> b!1029571 (=> (not res!688572) (not e!581245))))

(assert (=> b!1029571 (= res!688572 (= (getValueByKey!580 (toList!6855 lt!453369) (_1!7781 (tuple2!15541 lt!453153 (minValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 lt!453153 (minValue!5931 thiss!1427))))))))

(declare-fun b!1029572 () Bool)

(assert (=> b!1029572 (= e!581245 (contains!5991 (toList!6855 lt!453369) (tuple2!15541 lt!453153 (minValue!5931 thiss!1427))))))

(assert (= (and d!123359 res!688571) b!1029571))

(assert (= (and b!1029571 res!688572) b!1029572))

(declare-fun m!948593 () Bool)

(assert (=> d!123359 m!948593))

(declare-fun m!948595 () Bool)

(assert (=> d!123359 m!948595))

(declare-fun m!948597 () Bool)

(assert (=> d!123359 m!948597))

(declare-fun m!948599 () Bool)

(assert (=> d!123359 m!948599))

(declare-fun m!948601 () Bool)

(assert (=> b!1029571 m!948601))

(declare-fun m!948603 () Bool)

(assert (=> b!1029572 m!948603))

(assert (=> b!1029242 d!123359))

(declare-fun d!123361 () Bool)

(assert (=> d!123361 (= (apply!909 lt!453167 lt!453170) (get!16371 (getValueByKey!580 (toList!6855 lt!453167) lt!453170)))))

(declare-fun bs!30031 () Bool)

(assert (= bs!30031 d!123361))

(declare-fun m!948605 () Bool)

(assert (=> bs!30031 m!948605))

(assert (=> bs!30031 m!948605))

(declare-fun m!948607 () Bool)

(assert (=> bs!30031 m!948607))

(assert (=> b!1029242 d!123361))

(declare-fun d!123363 () Bool)

(declare-fun e!581246 () Bool)

(assert (=> d!123363 e!581246))

(declare-fun res!688573 () Bool)

(assert (=> d!123363 (=> (not res!688573) (not e!581246))))

(declare-fun lt!453373 () ListLongMap!13679)

(assert (=> d!123363 (= res!688573 (contains!5990 lt!453373 (_1!7781 (tuple2!15541 lt!453161 (zeroValue!5931 thiss!1427)))))))

(declare-fun lt!453372 () List!21796)

(assert (=> d!123363 (= lt!453373 (ListLongMap!13680 lt!453372))))

(declare-fun lt!453374 () Unit!33562)

(declare-fun lt!453371 () Unit!33562)

(assert (=> d!123363 (= lt!453374 lt!453371)))

(assert (=> d!123363 (= (getValueByKey!580 lt!453372 (_1!7781 (tuple2!15541 lt!453161 (zeroValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 lt!453161 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!123363 (= lt!453371 (lemmaContainsTupThenGetReturnValue!276 lt!453372 (_1!7781 (tuple2!15541 lt!453161 (zeroValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 lt!453161 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!123363 (= lt!453372 (insertStrictlySorted!369 (toList!6855 lt!453154) (_1!7781 (tuple2!15541 lt!453161 (zeroValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 lt!453161 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!123363 (= (+!3120 lt!453154 (tuple2!15541 lt!453161 (zeroValue!5931 thiss!1427))) lt!453373)))

(declare-fun b!1029573 () Bool)

(declare-fun res!688574 () Bool)

(assert (=> b!1029573 (=> (not res!688574) (not e!581246))))

(assert (=> b!1029573 (= res!688574 (= (getValueByKey!580 (toList!6855 lt!453373) (_1!7781 (tuple2!15541 lt!453161 (zeroValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 lt!453161 (zeroValue!5931 thiss!1427))))))))

(declare-fun b!1029574 () Bool)

(assert (=> b!1029574 (= e!581246 (contains!5991 (toList!6855 lt!453373) (tuple2!15541 lt!453161 (zeroValue!5931 thiss!1427))))))

(assert (= (and d!123363 res!688573) b!1029573))

(assert (= (and b!1029573 res!688574) b!1029574))

(declare-fun m!948609 () Bool)

(assert (=> d!123363 m!948609))

(declare-fun m!948611 () Bool)

(assert (=> d!123363 m!948611))

(declare-fun m!948613 () Bool)

(assert (=> d!123363 m!948613))

(declare-fun m!948615 () Bool)

(assert (=> d!123363 m!948615))

(declare-fun m!948617 () Bool)

(assert (=> b!1029573 m!948617))

(declare-fun m!948619 () Bool)

(assert (=> b!1029574 m!948619))

(assert (=> b!1029242 d!123363))

(declare-fun d!123365 () Bool)

(assert (=> d!123365 (= (apply!909 (+!3120 lt!453169 (tuple2!15541 lt!453152 (minValue!5931 thiss!1427))) lt!453160) (get!16371 (getValueByKey!580 (toList!6855 (+!3120 lt!453169 (tuple2!15541 lt!453152 (minValue!5931 thiss!1427)))) lt!453160)))))

(declare-fun bs!30032 () Bool)

(assert (= bs!30032 d!123365))

(declare-fun m!948621 () Bool)

(assert (=> bs!30032 m!948621))

(assert (=> bs!30032 m!948621))

(declare-fun m!948623 () Bool)

(assert (=> bs!30032 m!948623))

(assert (=> b!1029242 d!123365))

(declare-fun d!123367 () Bool)

(declare-fun e!581247 () Bool)

(assert (=> d!123367 e!581247))

(declare-fun res!688575 () Bool)

(assert (=> d!123367 (=> (not res!688575) (not e!581247))))

(declare-fun lt!453377 () ListLongMap!13679)

(assert (=> d!123367 (= res!688575 (contains!5990 lt!453377 (_1!7781 (tuple2!15541 lt!453166 (zeroValue!5931 thiss!1427)))))))

(declare-fun lt!453376 () List!21796)

(assert (=> d!123367 (= lt!453377 (ListLongMap!13680 lt!453376))))

(declare-fun lt!453378 () Unit!33562)

(declare-fun lt!453375 () Unit!33562)

(assert (=> d!123367 (= lt!453378 lt!453375)))

(assert (=> d!123367 (= (getValueByKey!580 lt!453376 (_1!7781 (tuple2!15541 lt!453166 (zeroValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 lt!453166 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!123367 (= lt!453375 (lemmaContainsTupThenGetReturnValue!276 lt!453376 (_1!7781 (tuple2!15541 lt!453166 (zeroValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 lt!453166 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!123367 (= lt!453376 (insertStrictlySorted!369 (toList!6855 lt!453159) (_1!7781 (tuple2!15541 lt!453166 (zeroValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 lt!453166 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!123367 (= (+!3120 lt!453159 (tuple2!15541 lt!453166 (zeroValue!5931 thiss!1427))) lt!453377)))

(declare-fun b!1029575 () Bool)

(declare-fun res!688576 () Bool)

(assert (=> b!1029575 (=> (not res!688576) (not e!581247))))

(assert (=> b!1029575 (= res!688576 (= (getValueByKey!580 (toList!6855 lt!453377) (_1!7781 (tuple2!15541 lt!453166 (zeroValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 lt!453166 (zeroValue!5931 thiss!1427))))))))

(declare-fun b!1029576 () Bool)

(assert (=> b!1029576 (= e!581247 (contains!5991 (toList!6855 lt!453377) (tuple2!15541 lt!453166 (zeroValue!5931 thiss!1427))))))

(assert (= (and d!123367 res!688575) b!1029575))

(assert (= (and b!1029575 res!688576) b!1029576))

(declare-fun m!948625 () Bool)

(assert (=> d!123367 m!948625))

(declare-fun m!948627 () Bool)

(assert (=> d!123367 m!948627))

(declare-fun m!948629 () Bool)

(assert (=> d!123367 m!948629))

(declare-fun m!948631 () Bool)

(assert (=> d!123367 m!948631))

(declare-fun m!948633 () Bool)

(assert (=> b!1029575 m!948633))

(declare-fun m!948635 () Bool)

(assert (=> b!1029576 m!948635))

(assert (=> b!1029242 d!123367))

(declare-fun d!123369 () Bool)

(assert (=> d!123369 (= (apply!909 (+!3120 lt!453159 (tuple2!15541 lt!453166 (zeroValue!5931 thiss!1427))) lt!453168) (apply!909 lt!453159 lt!453168))))

(declare-fun lt!453379 () Unit!33562)

(assert (=> d!123369 (= lt!453379 (choose!1687 lt!453159 lt!453166 (zeroValue!5931 thiss!1427) lt!453168))))

(declare-fun e!581248 () Bool)

(assert (=> d!123369 e!581248))

(declare-fun res!688577 () Bool)

(assert (=> d!123369 (=> (not res!688577) (not e!581248))))

(assert (=> d!123369 (= res!688577 (contains!5990 lt!453159 lt!453168))))

(assert (=> d!123369 (= (addApplyDifferent!475 lt!453159 lt!453166 (zeroValue!5931 thiss!1427) lt!453168) lt!453379)))

(declare-fun b!1029577 () Bool)

(assert (=> b!1029577 (= e!581248 (not (= lt!453168 lt!453166)))))

(assert (= (and d!123369 res!688577) b!1029577))

(assert (=> d!123369 m!948169))

(assert (=> d!123369 m!948149))

(assert (=> d!123369 m!948157))

(declare-fun m!948637 () Bool)

(assert (=> d!123369 m!948637))

(declare-fun m!948639 () Bool)

(assert (=> d!123369 m!948639))

(assert (=> d!123369 m!948149))

(assert (=> b!1029242 d!123369))

(assert (=> b!1029242 d!123297))

(declare-fun d!123371 () Bool)

(declare-fun e!581249 () Bool)

(assert (=> d!123371 e!581249))

(declare-fun res!688578 () Bool)

(assert (=> d!123371 (=> (not res!688578) (not e!581249))))

(declare-fun lt!453382 () ListLongMap!13679)

(assert (=> d!123371 (= res!688578 (contains!5990 lt!453382 (_1!7781 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(declare-fun lt!453381 () List!21796)

(assert (=> d!123371 (= lt!453382 (ListLongMap!13680 lt!453381))))

(declare-fun lt!453383 () Unit!33562)

(declare-fun lt!453380 () Unit!33562)

(assert (=> d!123371 (= lt!453383 lt!453380)))

(assert (=> d!123371 (= (getValueByKey!580 lt!453381 (_1!7781 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(assert (=> d!123371 (= lt!453380 (lemmaContainsTupThenGetReturnValue!276 lt!453381 (_1!7781 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(assert (=> d!123371 (= lt!453381 (insertStrictlySorted!369 (toList!6855 call!43377) (_1!7781 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(assert (=> d!123371 (= (+!3120 call!43377 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))) lt!453382)))

(declare-fun b!1029578 () Bool)

(declare-fun res!688579 () Bool)

(assert (=> b!1029578 (=> (not res!688579) (not e!581249))))

(assert (=> b!1029578 (= res!688579 (= (getValueByKey!580 (toList!6855 lt!453382) (_1!7781 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(declare-fun b!1029579 () Bool)

(assert (=> b!1029579 (= e!581249 (contains!5991 (toList!6855 lt!453382) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))

(assert (= (and d!123371 res!688578) b!1029578))

(assert (= (and b!1029578 res!688579) b!1029579))

(declare-fun m!948641 () Bool)

(assert (=> d!123371 m!948641))

(declare-fun m!948643 () Bool)

(assert (=> d!123371 m!948643))

(declare-fun m!948645 () Bool)

(assert (=> d!123371 m!948645))

(declare-fun m!948647 () Bool)

(assert (=> d!123371 m!948647))

(declare-fun m!948649 () Bool)

(assert (=> b!1029578 m!948649))

(declare-fun m!948651 () Bool)

(assert (=> b!1029579 m!948651))

(assert (=> b!1029257 d!123371))

(declare-fun d!123373 () Bool)

(assert (=> d!123373 (= (validKeyInArray!0 (select (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013))) (and (not (= (select (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31147 (_keys!11282 thiss!1427)) (index!40892 lt!453013)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1029150 d!123373))

(declare-fun d!123375 () Bool)

(assert (=> d!123375 (= (apply!909 lt!453189 lt!453192) (get!16371 (getValueByKey!580 (toList!6855 lt!453189) lt!453192)))))

(declare-fun bs!30033 () Bool)

(assert (= bs!30033 d!123375))

(declare-fun m!948653 () Bool)

(assert (=> bs!30033 m!948653))

(assert (=> bs!30033 m!948653))

(declare-fun m!948655 () Bool)

(assert (=> bs!30033 m!948655))

(assert (=> b!1029269 d!123375))

(declare-fun d!123377 () Bool)

(declare-fun e!581250 () Bool)

(assert (=> d!123377 e!581250))

(declare-fun res!688580 () Bool)

(assert (=> d!123377 (=> (not res!688580) (not e!581250))))

(declare-fun lt!453386 () ListLongMap!13679)

(assert (=> d!123377 (= res!688580 (contains!5990 lt!453386 (_1!7781 (tuple2!15541 lt!453174 (minValue!5931 thiss!1427)))))))

(declare-fun lt!453385 () List!21796)

(assert (=> d!123377 (= lt!453386 (ListLongMap!13680 lt!453385))))

(declare-fun lt!453387 () Unit!33562)

(declare-fun lt!453384 () Unit!33562)

(assert (=> d!123377 (= lt!453387 lt!453384)))

(assert (=> d!123377 (= (getValueByKey!580 lt!453385 (_1!7781 (tuple2!15541 lt!453174 (minValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 lt!453174 (minValue!5931 thiss!1427)))))))

(assert (=> d!123377 (= lt!453384 (lemmaContainsTupThenGetReturnValue!276 lt!453385 (_1!7781 (tuple2!15541 lt!453174 (minValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 lt!453174 (minValue!5931 thiss!1427)))))))

(assert (=> d!123377 (= lt!453385 (insertStrictlySorted!369 (toList!6855 lt!453191) (_1!7781 (tuple2!15541 lt!453174 (minValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 lt!453174 (minValue!5931 thiss!1427)))))))

(assert (=> d!123377 (= (+!3120 lt!453191 (tuple2!15541 lt!453174 (minValue!5931 thiss!1427))) lt!453386)))

(declare-fun b!1029580 () Bool)

(declare-fun res!688581 () Bool)

(assert (=> b!1029580 (=> (not res!688581) (not e!581250))))

(assert (=> b!1029580 (= res!688581 (= (getValueByKey!580 (toList!6855 lt!453386) (_1!7781 (tuple2!15541 lt!453174 (minValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 lt!453174 (minValue!5931 thiss!1427))))))))

(declare-fun b!1029581 () Bool)

(assert (=> b!1029581 (= e!581250 (contains!5991 (toList!6855 lt!453386) (tuple2!15541 lt!453174 (minValue!5931 thiss!1427))))))

(assert (= (and d!123377 res!688580) b!1029580))

(assert (= (and b!1029580 res!688581) b!1029581))

(declare-fun m!948657 () Bool)

(assert (=> d!123377 m!948657))

(declare-fun m!948659 () Bool)

(assert (=> d!123377 m!948659))

(declare-fun m!948661 () Bool)

(assert (=> d!123377 m!948661))

(declare-fun m!948663 () Bool)

(assert (=> d!123377 m!948663))

(declare-fun m!948665 () Bool)

(assert (=> b!1029580 m!948665))

(declare-fun m!948667 () Bool)

(assert (=> b!1029581 m!948667))

(assert (=> b!1029269 d!123377))

(declare-fun d!123379 () Bool)

(assert (=> d!123379 (= (apply!909 (+!3120 lt!453189 (tuple2!15541 lt!453175 (minValue!5931 thiss!1427))) lt!453192) (get!16371 (getValueByKey!580 (toList!6855 (+!3120 lt!453189 (tuple2!15541 lt!453175 (minValue!5931 thiss!1427)))) lt!453192)))))

(declare-fun bs!30034 () Bool)

(assert (= bs!30034 d!123379))

(declare-fun m!948669 () Bool)

(assert (=> bs!30034 m!948669))

(assert (=> bs!30034 m!948669))

(declare-fun m!948671 () Bool)

(assert (=> bs!30034 m!948671))

(assert (=> b!1029269 d!123379))

(declare-fun d!123381 () Bool)

(assert (=> d!123381 (= (apply!909 (+!3120 lt!453191 (tuple2!15541 lt!453174 (minValue!5931 thiss!1427))) lt!453182) (apply!909 lt!453191 lt!453182))))

(declare-fun lt!453388 () Unit!33562)

(assert (=> d!123381 (= lt!453388 (choose!1687 lt!453191 lt!453174 (minValue!5931 thiss!1427) lt!453182))))

(declare-fun e!581251 () Bool)

(assert (=> d!123381 e!581251))

(declare-fun res!688582 () Bool)

(assert (=> d!123381 (=> (not res!688582) (not e!581251))))

(assert (=> d!123381 (= res!688582 (contains!5990 lt!453191 lt!453182))))

(assert (=> d!123381 (= (addApplyDifferent!475 lt!453191 lt!453174 (minValue!5931 thiss!1427) lt!453182) lt!453388)))

(declare-fun b!1029582 () Bool)

(assert (=> b!1029582 (= e!581251 (not (= lt!453182 lt!453174)))))

(assert (= (and d!123381 res!688582) b!1029582))

(assert (=> d!123381 m!948219))

(assert (=> d!123381 m!948197))

(assert (=> d!123381 m!948199))

(declare-fun m!948673 () Bool)

(assert (=> d!123381 m!948673))

(declare-fun m!948675 () Bool)

(assert (=> d!123381 m!948675))

(assert (=> d!123381 m!948197))

(assert (=> b!1029269 d!123381))

(declare-fun d!123383 () Bool)

(assert (=> d!123383 (= (apply!909 (+!3120 lt!453181 (tuple2!15541 lt!453188 (zeroValue!5931 thiss!1427))) lt!453190) (apply!909 lt!453181 lt!453190))))

(declare-fun lt!453389 () Unit!33562)

(assert (=> d!123383 (= lt!453389 (choose!1687 lt!453181 lt!453188 (zeroValue!5931 thiss!1427) lt!453190))))

(declare-fun e!581252 () Bool)

(assert (=> d!123383 e!581252))

(declare-fun res!688583 () Bool)

(assert (=> d!123383 (=> (not res!688583) (not e!581252))))

(assert (=> d!123383 (= res!688583 (contains!5990 lt!453181 lt!453190))))

(assert (=> d!123383 (= (addApplyDifferent!475 lt!453181 lt!453188 (zeroValue!5931 thiss!1427) lt!453190) lt!453389)))

(declare-fun b!1029583 () Bool)

(assert (=> b!1029583 (= e!581252 (not (= lt!453190 lt!453188)))))

(assert (= (and d!123383 res!688583) b!1029583))

(assert (=> d!123383 m!948223))

(assert (=> d!123383 m!948203))

(assert (=> d!123383 m!948211))

(declare-fun m!948677 () Bool)

(assert (=> d!123383 m!948677))

(declare-fun m!948679 () Bool)

(assert (=> d!123383 m!948679))

(assert (=> d!123383 m!948203))

(assert (=> b!1029269 d!123383))

(declare-fun d!123385 () Bool)

(assert (=> d!123385 (= (apply!909 (+!3120 lt!453191 (tuple2!15541 lt!453174 (minValue!5931 thiss!1427))) lt!453182) (get!16371 (getValueByKey!580 (toList!6855 (+!3120 lt!453191 (tuple2!15541 lt!453174 (minValue!5931 thiss!1427)))) lt!453182)))))

(declare-fun bs!30035 () Bool)

(assert (= bs!30035 d!123385))

(declare-fun m!948681 () Bool)

(assert (=> bs!30035 m!948681))

(assert (=> bs!30035 m!948681))

(declare-fun m!948683 () Bool)

(assert (=> bs!30035 m!948683))

(assert (=> b!1029269 d!123385))

(declare-fun d!123387 () Bool)

(assert (=> d!123387 (= (apply!909 lt!453181 lt!453190) (get!16371 (getValueByKey!580 (toList!6855 lt!453181) lt!453190)))))

(declare-fun bs!30036 () Bool)

(assert (= bs!30036 d!123387))

(declare-fun m!948685 () Bool)

(assert (=> bs!30036 m!948685))

(assert (=> bs!30036 m!948685))

(declare-fun m!948687 () Bool)

(assert (=> bs!30036 m!948687))

(assert (=> b!1029269 d!123387))

(declare-fun d!123389 () Bool)

(declare-fun e!581253 () Bool)

(assert (=> d!123389 e!581253))

(declare-fun res!688584 () Bool)

(assert (=> d!123389 (=> (not res!688584) (not e!581253))))

(declare-fun lt!453392 () ListLongMap!13679)

(assert (=> d!123389 (= res!688584 (contains!5990 lt!453392 (_1!7781 (tuple2!15541 lt!453188 (zeroValue!5931 thiss!1427)))))))

(declare-fun lt!453391 () List!21796)

(assert (=> d!123389 (= lt!453392 (ListLongMap!13680 lt!453391))))

(declare-fun lt!453393 () Unit!33562)

(declare-fun lt!453390 () Unit!33562)

(assert (=> d!123389 (= lt!453393 lt!453390)))

(assert (=> d!123389 (= (getValueByKey!580 lt!453391 (_1!7781 (tuple2!15541 lt!453188 (zeroValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 lt!453188 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!123389 (= lt!453390 (lemmaContainsTupThenGetReturnValue!276 lt!453391 (_1!7781 (tuple2!15541 lt!453188 (zeroValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 lt!453188 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!123389 (= lt!453391 (insertStrictlySorted!369 (toList!6855 lt!453181) (_1!7781 (tuple2!15541 lt!453188 (zeroValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 lt!453188 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!123389 (= (+!3120 lt!453181 (tuple2!15541 lt!453188 (zeroValue!5931 thiss!1427))) lt!453392)))

(declare-fun b!1029584 () Bool)

(declare-fun res!688585 () Bool)

(assert (=> b!1029584 (=> (not res!688585) (not e!581253))))

(assert (=> b!1029584 (= res!688585 (= (getValueByKey!580 (toList!6855 lt!453392) (_1!7781 (tuple2!15541 lt!453188 (zeroValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 lt!453188 (zeroValue!5931 thiss!1427))))))))

(declare-fun b!1029585 () Bool)

(assert (=> b!1029585 (= e!581253 (contains!5991 (toList!6855 lt!453392) (tuple2!15541 lt!453188 (zeroValue!5931 thiss!1427))))))

(assert (= (and d!123389 res!688584) b!1029584))

(assert (= (and b!1029584 res!688585) b!1029585))

(declare-fun m!948689 () Bool)

(assert (=> d!123389 m!948689))

(declare-fun m!948691 () Bool)

(assert (=> d!123389 m!948691))

(declare-fun m!948693 () Bool)

(assert (=> d!123389 m!948693))

(declare-fun m!948695 () Bool)

(assert (=> d!123389 m!948695))

(declare-fun m!948697 () Bool)

(assert (=> b!1029584 m!948697))

(declare-fun m!948699 () Bool)

(assert (=> b!1029585 m!948699))

(assert (=> b!1029269 d!123389))

(declare-fun d!123391 () Bool)

(assert (=> d!123391 (contains!5990 (+!3120 lt!453176 (tuple2!15541 lt!453183 (zeroValue!5931 thiss!1427))) lt!453186)))

(declare-fun lt!453394 () Unit!33562)

(assert (=> d!123391 (= lt!453394 (choose!1688 lt!453176 lt!453183 (zeroValue!5931 thiss!1427) lt!453186))))

(assert (=> d!123391 (contains!5990 lt!453176 lt!453186)))

(assert (=> d!123391 (= (addStillContains!619 lt!453176 lt!453183 (zeroValue!5931 thiss!1427) lt!453186) lt!453394)))

(declare-fun bs!30037 () Bool)

(assert (= bs!30037 d!123391))

(assert (=> bs!30037 m!948213))

(assert (=> bs!30037 m!948213))

(assert (=> bs!30037 m!948227))

(declare-fun m!948701 () Bool)

(assert (=> bs!30037 m!948701))

(declare-fun m!948703 () Bool)

(assert (=> bs!30037 m!948703))

(assert (=> b!1029269 d!123391))

(assert (=> b!1029269 d!123245))

(declare-fun d!123393 () Bool)

(declare-fun e!581254 () Bool)

(assert (=> d!123393 e!581254))

(declare-fun res!688586 () Bool)

(assert (=> d!123393 (=> (not res!688586) (not e!581254))))

(declare-fun lt!453397 () ListLongMap!13679)

(assert (=> d!123393 (= res!688586 (contains!5990 lt!453397 (_1!7781 (tuple2!15541 lt!453175 (minValue!5931 thiss!1427)))))))

(declare-fun lt!453396 () List!21796)

(assert (=> d!123393 (= lt!453397 (ListLongMap!13680 lt!453396))))

(declare-fun lt!453398 () Unit!33562)

(declare-fun lt!453395 () Unit!33562)

(assert (=> d!123393 (= lt!453398 lt!453395)))

(assert (=> d!123393 (= (getValueByKey!580 lt!453396 (_1!7781 (tuple2!15541 lt!453175 (minValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 lt!453175 (minValue!5931 thiss!1427)))))))

(assert (=> d!123393 (= lt!453395 (lemmaContainsTupThenGetReturnValue!276 lt!453396 (_1!7781 (tuple2!15541 lt!453175 (minValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 lt!453175 (minValue!5931 thiss!1427)))))))

(assert (=> d!123393 (= lt!453396 (insertStrictlySorted!369 (toList!6855 lt!453189) (_1!7781 (tuple2!15541 lt!453175 (minValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 lt!453175 (minValue!5931 thiss!1427)))))))

(assert (=> d!123393 (= (+!3120 lt!453189 (tuple2!15541 lt!453175 (minValue!5931 thiss!1427))) lt!453397)))

(declare-fun b!1029586 () Bool)

(declare-fun res!688587 () Bool)

(assert (=> b!1029586 (=> (not res!688587) (not e!581254))))

(assert (=> b!1029586 (= res!688587 (= (getValueByKey!580 (toList!6855 lt!453397) (_1!7781 (tuple2!15541 lt!453175 (minValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 lt!453175 (minValue!5931 thiss!1427))))))))

(declare-fun b!1029587 () Bool)

(assert (=> b!1029587 (= e!581254 (contains!5991 (toList!6855 lt!453397) (tuple2!15541 lt!453175 (minValue!5931 thiss!1427))))))

(assert (= (and d!123393 res!688586) b!1029586))

(assert (= (and b!1029586 res!688587) b!1029587))

(declare-fun m!948705 () Bool)

(assert (=> d!123393 m!948705))

(declare-fun m!948707 () Bool)

(assert (=> d!123393 m!948707))

(declare-fun m!948709 () Bool)

(assert (=> d!123393 m!948709))

(declare-fun m!948711 () Bool)

(assert (=> d!123393 m!948711))

(declare-fun m!948713 () Bool)

(assert (=> b!1029586 m!948713))

(declare-fun m!948715 () Bool)

(assert (=> b!1029587 m!948715))

(assert (=> b!1029269 d!123393))

(declare-fun d!123395 () Bool)

(assert (=> d!123395 (= (apply!909 (+!3120 lt!453181 (tuple2!15541 lt!453188 (zeroValue!5931 thiss!1427))) lt!453190) (get!16371 (getValueByKey!580 (toList!6855 (+!3120 lt!453181 (tuple2!15541 lt!453188 (zeroValue!5931 thiss!1427)))) lt!453190)))))

(declare-fun bs!30038 () Bool)

(assert (= bs!30038 d!123395))

(declare-fun m!948717 () Bool)

(assert (=> bs!30038 m!948717))

(assert (=> bs!30038 m!948717))

(declare-fun m!948719 () Bool)

(assert (=> bs!30038 m!948719))

(assert (=> b!1029269 d!123395))

(declare-fun d!123397 () Bool)

(assert (=> d!123397 (= (apply!909 lt!453191 lt!453182) (get!16371 (getValueByKey!580 (toList!6855 lt!453191) lt!453182)))))

(declare-fun bs!30039 () Bool)

(assert (= bs!30039 d!123397))

(declare-fun m!948721 () Bool)

(assert (=> bs!30039 m!948721))

(assert (=> bs!30039 m!948721))

(declare-fun m!948723 () Bool)

(assert (=> bs!30039 m!948723))

(assert (=> b!1029269 d!123397))

(declare-fun d!123399 () Bool)

(declare-fun e!581255 () Bool)

(assert (=> d!123399 e!581255))

(declare-fun res!688588 () Bool)

(assert (=> d!123399 (=> res!688588 e!581255)))

(declare-fun lt!453399 () Bool)

(assert (=> d!123399 (= res!688588 (not lt!453399))))

(declare-fun lt!453400 () Bool)

(assert (=> d!123399 (= lt!453399 lt!453400)))

(declare-fun lt!453402 () Unit!33562)

(declare-fun e!581256 () Unit!33562)

(assert (=> d!123399 (= lt!453402 e!581256)))

(declare-fun c!104156 () Bool)

(assert (=> d!123399 (= c!104156 lt!453400)))

(assert (=> d!123399 (= lt!453400 (containsKey!561 (toList!6855 (+!3120 lt!453176 (tuple2!15541 lt!453183 (zeroValue!5931 thiss!1427)))) lt!453186))))

(assert (=> d!123399 (= (contains!5990 (+!3120 lt!453176 (tuple2!15541 lt!453183 (zeroValue!5931 thiss!1427))) lt!453186) lt!453399)))

(declare-fun b!1029588 () Bool)

(declare-fun lt!453401 () Unit!33562)

(assert (=> b!1029588 (= e!581256 lt!453401)))

(assert (=> b!1029588 (= lt!453401 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6855 (+!3120 lt!453176 (tuple2!15541 lt!453183 (zeroValue!5931 thiss!1427)))) lt!453186))))

(assert (=> b!1029588 (isDefined!430 (getValueByKey!580 (toList!6855 (+!3120 lt!453176 (tuple2!15541 lt!453183 (zeroValue!5931 thiss!1427)))) lt!453186))))

(declare-fun b!1029589 () Bool)

(declare-fun Unit!33585 () Unit!33562)

(assert (=> b!1029589 (= e!581256 Unit!33585)))

(declare-fun b!1029590 () Bool)

(assert (=> b!1029590 (= e!581255 (isDefined!430 (getValueByKey!580 (toList!6855 (+!3120 lt!453176 (tuple2!15541 lt!453183 (zeroValue!5931 thiss!1427)))) lt!453186)))))

(assert (= (and d!123399 c!104156) b!1029588))

(assert (= (and d!123399 (not c!104156)) b!1029589))

(assert (= (and d!123399 (not res!688588)) b!1029590))

(declare-fun m!948725 () Bool)

(assert (=> d!123399 m!948725))

(declare-fun m!948727 () Bool)

(assert (=> b!1029588 m!948727))

(declare-fun m!948729 () Bool)

(assert (=> b!1029588 m!948729))

(assert (=> b!1029588 m!948729))

(declare-fun m!948731 () Bool)

(assert (=> b!1029588 m!948731))

(assert (=> b!1029590 m!948729))

(assert (=> b!1029590 m!948729))

(assert (=> b!1029590 m!948731))

(assert (=> b!1029269 d!123399))

(declare-fun d!123401 () Bool)

(declare-fun e!581257 () Bool)

(assert (=> d!123401 e!581257))

(declare-fun res!688589 () Bool)

(assert (=> d!123401 (=> (not res!688589) (not e!581257))))

(declare-fun lt!453405 () ListLongMap!13679)

(assert (=> d!123401 (= res!688589 (contains!5990 lt!453405 (_1!7781 (tuple2!15541 lt!453183 (zeroValue!5931 thiss!1427)))))))

(declare-fun lt!453404 () List!21796)

(assert (=> d!123401 (= lt!453405 (ListLongMap!13680 lt!453404))))

(declare-fun lt!453406 () Unit!33562)

(declare-fun lt!453403 () Unit!33562)

(assert (=> d!123401 (= lt!453406 lt!453403)))

(assert (=> d!123401 (= (getValueByKey!580 lt!453404 (_1!7781 (tuple2!15541 lt!453183 (zeroValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 lt!453183 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!123401 (= lt!453403 (lemmaContainsTupThenGetReturnValue!276 lt!453404 (_1!7781 (tuple2!15541 lt!453183 (zeroValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 lt!453183 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!123401 (= lt!453404 (insertStrictlySorted!369 (toList!6855 lt!453176) (_1!7781 (tuple2!15541 lt!453183 (zeroValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 lt!453183 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!123401 (= (+!3120 lt!453176 (tuple2!15541 lt!453183 (zeroValue!5931 thiss!1427))) lt!453405)))

(declare-fun b!1029591 () Bool)

(declare-fun res!688590 () Bool)

(assert (=> b!1029591 (=> (not res!688590) (not e!581257))))

(assert (=> b!1029591 (= res!688590 (= (getValueByKey!580 (toList!6855 lt!453405) (_1!7781 (tuple2!15541 lt!453183 (zeroValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 lt!453183 (zeroValue!5931 thiss!1427))))))))

(declare-fun b!1029592 () Bool)

(assert (=> b!1029592 (= e!581257 (contains!5991 (toList!6855 lt!453405) (tuple2!15541 lt!453183 (zeroValue!5931 thiss!1427))))))

(assert (= (and d!123401 res!688589) b!1029591))

(assert (= (and b!1029591 res!688590) b!1029592))

(declare-fun m!948733 () Bool)

(assert (=> d!123401 m!948733))

(declare-fun m!948735 () Bool)

(assert (=> d!123401 m!948735))

(declare-fun m!948737 () Bool)

(assert (=> d!123401 m!948737))

(declare-fun m!948739 () Bool)

(assert (=> d!123401 m!948739))

(declare-fun m!948741 () Bool)

(assert (=> b!1029591 m!948741))

(declare-fun m!948743 () Bool)

(assert (=> b!1029592 m!948743))

(assert (=> b!1029269 d!123401))

(declare-fun d!123403 () Bool)

(assert (=> d!123403 (= (apply!909 (+!3120 lt!453189 (tuple2!15541 lt!453175 (minValue!5931 thiss!1427))) lt!453192) (apply!909 lt!453189 lt!453192))))

(declare-fun lt!453407 () Unit!33562)

(assert (=> d!123403 (= lt!453407 (choose!1687 lt!453189 lt!453175 (minValue!5931 thiss!1427) lt!453192))))

(declare-fun e!581258 () Bool)

(assert (=> d!123403 e!581258))

(declare-fun res!688591 () Bool)

(assert (=> d!123403 (=> (not res!688591) (not e!581258))))

(assert (=> d!123403 (= res!688591 (contains!5990 lt!453189 lt!453192))))

(assert (=> d!123403 (= (addApplyDifferent!475 lt!453189 lt!453175 (minValue!5931 thiss!1427) lt!453192) lt!453407)))

(declare-fun b!1029593 () Bool)

(assert (=> b!1029593 (= e!581258 (not (= lt!453192 lt!453175)))))

(assert (= (and d!123403 res!688591) b!1029593))

(assert (=> d!123403 m!948217))

(assert (=> d!123403 m!948205))

(assert (=> d!123403 m!948207))

(declare-fun m!948745 () Bool)

(assert (=> d!123403 m!948745))

(declare-fun m!948747 () Bool)

(assert (=> d!123403 m!948747))

(assert (=> d!123403 m!948205))

(assert (=> b!1029269 d!123403))

(declare-fun d!123405 () Bool)

(declare-fun e!581259 () Bool)

(assert (=> d!123405 e!581259))

(declare-fun res!688592 () Bool)

(assert (=> d!123405 (=> (not res!688592) (not e!581259))))

(declare-fun lt!453410 () ListLongMap!13679)

(assert (=> d!123405 (= res!688592 (contains!5990 lt!453410 (_1!7781 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(declare-fun lt!453409 () List!21796)

(assert (=> d!123405 (= lt!453410 (ListLongMap!13680 lt!453409))))

(declare-fun lt!453411 () Unit!33562)

(declare-fun lt!453408 () Unit!33562)

(assert (=> d!123405 (= lt!453411 lt!453408)))

(assert (=> d!123405 (= (getValueByKey!580 lt!453409 (_1!7781 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(assert (=> d!123405 (= lt!453408 (lemmaContainsTupThenGetReturnValue!276 lt!453409 (_1!7781 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(assert (=> d!123405 (= lt!453409 (insertStrictlySorted!369 (toList!6855 call!43384) (_1!7781 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))) (_2!7781 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(assert (=> d!123405 (= (+!3120 call!43384 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))) lt!453410)))

(declare-fun b!1029594 () Bool)

(declare-fun res!688593 () Bool)

(assert (=> b!1029594 (=> (not res!688593) (not e!581259))))

(assert (=> b!1029594 (= res!688593 (= (getValueByKey!580 (toList!6855 lt!453410) (_1!7781 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) (Some!630 (_2!7781 (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(declare-fun b!1029595 () Bool)

(assert (=> b!1029595 (= e!581259 (contains!5991 (toList!6855 lt!453410) (tuple2!15541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))

(assert (= (and d!123405 res!688592) b!1029594))

(assert (= (and b!1029594 res!688593) b!1029595))

(declare-fun m!948749 () Bool)

(assert (=> d!123405 m!948749))

(declare-fun m!948751 () Bool)

(assert (=> d!123405 m!948751))

(declare-fun m!948753 () Bool)

(assert (=> d!123405 m!948753))

(declare-fun m!948755 () Bool)

(assert (=> d!123405 m!948755))

(declare-fun m!948757 () Bool)

(assert (=> b!1029594 m!948757))

(declare-fun m!948759 () Bool)

(assert (=> b!1029595 m!948759))

(assert (=> b!1029284 d!123405))

(declare-fun b!1029596 () Bool)

(declare-fun e!581261 () Bool)

(assert (=> b!1029596 (= e!581261 tp_is_empty!24295)))

(declare-fun mapIsEmpty!37884 () Bool)

(declare-fun mapRes!37884 () Bool)

(assert (=> mapIsEmpty!37884 mapRes!37884))

(declare-fun mapNonEmpty!37884 () Bool)

(declare-fun tp!72790 () Bool)

(assert (=> mapNonEmpty!37884 (= mapRes!37884 (and tp!72790 e!581261))))

(declare-fun mapValue!37884 () ValueCell!11444)

(declare-fun mapRest!37884 () (Array (_ BitVec 32) ValueCell!11444))

(declare-fun mapKey!37884 () (_ BitVec 32))

(assert (=> mapNonEmpty!37884 (= mapRest!37883 (store mapRest!37884 mapKey!37884 mapValue!37884))))

(declare-fun b!1029597 () Bool)

(declare-fun e!581260 () Bool)

(assert (=> b!1029597 (= e!581260 tp_is_empty!24295)))

(declare-fun condMapEmpty!37884 () Bool)

(declare-fun mapDefault!37884 () ValueCell!11444)

(assert (=> mapNonEmpty!37883 (= condMapEmpty!37884 (= mapRest!37883 ((as const (Array (_ BitVec 32) ValueCell!11444)) mapDefault!37884)))))

(assert (=> mapNonEmpty!37883 (= tp!72789 (and e!581260 mapRes!37884))))

(assert (= (and mapNonEmpty!37883 condMapEmpty!37884) mapIsEmpty!37884))

(assert (= (and mapNonEmpty!37883 (not condMapEmpty!37884)) mapNonEmpty!37884))

(assert (= (and mapNonEmpty!37884 ((_ is ValueCellFull!11444) mapValue!37884)) b!1029596))

(assert (= (and mapNonEmpty!37883 ((_ is ValueCellFull!11444) mapDefault!37884)) b!1029597))

(declare-fun m!948761 () Bool)

(assert (=> mapNonEmpty!37884 m!948761))

(declare-fun b_lambda!15781 () Bool)

(assert (= b_lambda!15777 (or (and b!1029059 b_free!20575) b_lambda!15781)))

(declare-fun b_lambda!15783 () Bool)

(assert (= b_lambda!15779 (or (and b!1029059 b_free!20575) b_lambda!15783)))

(declare-fun b_lambda!15785 () Bool)

(assert (= b_lambda!15769 (or (and b!1029059 b_free!20575) b_lambda!15785)))

(declare-fun b_lambda!15787 () Bool)

(assert (= b_lambda!15771 (or (and b!1029059 b_free!20575) b_lambda!15787)))

(declare-fun b_lambda!15789 () Bool)

(assert (= b_lambda!15775 (or (and b!1029059 b_free!20575) b_lambda!15789)))

(declare-fun b_lambda!15791 () Bool)

(assert (= b_lambda!15773 (or (and b!1029059 b_free!20575) b_lambda!15791)))

(check-sat (not d!123265) (not d!123359) (not b!1029367) (not d!123339) (not b!1029543) (not bm!43385) (not b!1029502) (not d!123379) (not d!123371) (not b_lambda!15783) (not b!1029587) (not d!123323) (not bm!43399) tp_is_empty!24295 (not b!1029338) (not b!1029389) (not b!1029351) (not d!123269) (not bm!43392) (not b!1029371) (not d!123345) (not d!123391) (not b!1029433) (not b!1029424) (not bm!43386) (not b!1029364) (not b!1029379) (not b!1029431) (not b_lambda!15767) (not b!1029592) (not b_lambda!15765) (not b!1029388) (not d!123355) (not b_lambda!15781) (not b!1029573) (not b_lambda!15789) (not d!123405) (not b!1029565) (not bm!43391) (not b_lambda!15763) (not d!123399) (not b!1029576) (not d!123347) (not bm!43388) (not d!123383) (not d!123271) (not b!1029591) (not d!123311) (not d!123369) (not d!123349) (not b!1029588) (not d!123337) (not b!1029339) (not b!1029342) (not d!123343) (not bm!43387) (not b!1029395) (not b!1029437) (not bm!43402) (not b_next!20575) (not b!1029409) (not b!1029595) (not d!123291) (not d!123353) (not d!123387) (not b!1029444) (not b!1029428) (not b!1029572) (not b!1029493) (not d!123285) (not b!1029430) (not b!1029372) (not d!123381) (not b!1029362) (not bm!43390) (not d!123327) (not b!1029509) (not b!1029334) (not b!1029574) (not b!1029594) (not d!123305) (not b!1029397) (not b!1029495) (not d!123331) (not b_lambda!15785) (not b!1029567) (not b!1029510) (not d!123395) (not d!123301) (not d!123363) (not b!1029547) (not d!123247) (not d!123249) (not bm!43394) (not d!123375) (not b!1029586) (not d!123275) (not b!1029349) (not d!123315) (not b!1029415) b_and!32871 (not b!1029489) (not b!1029412) (not b!1029580) (not d!123297) (not b!1029440) (not b!1029541) (not b!1029403) (not b!1029426) (not d!123365) (not d!123351) (not b!1029390) (not b_lambda!15787) (not d!123293) (not b!1029504) (not b!1029546) (not b!1029569) (not d!123313) (not b!1029584) (not b!1029408) (not b!1029340) (not d!123393) (not b_lambda!15791) (not b!1029497) (not b!1029418) (not b!1029538) (not b!1029575) (not b!1029540) (not b!1029545) (not b!1029581) (not b!1029566) (not b_lambda!15755) (not b!1029511) (not d!123329) (not bm!43389) (not b!1029498) (not b!1029473) (not d!123389) (not b!1029442) (not b!1029392) (not b!1029461) (not d!123317) (not b!1029578) (not bm!43393) (not b!1029501) (not b!1029554) (not b!1029571) (not b!1029436) (not b!1029429) (not b!1029333) (not d!123335) (not d!123245) (not b!1029472) (not b!1029425) (not d!123385) (not d!123377) (not bm!43400) (not b!1029421) (not b!1029391) (not d!123341) (not b!1029335) (not b!1029555) (not b!1029434) (not d!123255) (not mapNonEmpty!37884) (not d!123357) (not d!123401) (not d!123251) (not b!1029585) (not d!123397) (not d!123403) (not b!1029376) (not b!1029414) (not b!1029396) (not bm!43395) (not b!1029384) (not b!1029337) (not b!1029439) (not d!123361) (not d!123303) (not b!1029590) (not bm!43396) (not d!123367) (not d!123307) (not b!1029385) (not b!1029369) (not b!1029579) (not d!123299) (not b!1029506) (not d!123277))
(check-sat b_and!32871 (not b_next!20575))
