; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90212 () Bool)

(assert start!90212)

(declare-fun b!1031758 () Bool)

(declare-fun b_free!20617 () Bool)

(declare-fun b_next!20617 () Bool)

(assert (=> b!1031758 (= b_free!20617 (not b_next!20617))))

(declare-fun tp!72919 () Bool)

(declare-fun b_and!33005 () Bool)

(assert (=> b!1031758 (= tp!72919 b_and!33005)))

(declare-fun b!1031756 () Bool)

(declare-fun e!582730 () Bool)

(declare-fun tp_is_empty!24337 () Bool)

(assert (=> b!1031756 (= e!582730 tp_is_empty!24337)))

(declare-fun b!1031757 () Bool)

(declare-fun e!582727 () Bool)

(declare-datatypes ((V!37323 0))(
  ( (V!37324 (val!12219 Int)) )
))
(declare-datatypes ((ValueCell!11465 0))(
  ( (ValueCellFull!11465 (v!14792 V!37323)) (EmptyCell!11465) )
))
(declare-datatypes ((Unit!33674 0))(
  ( (Unit!33675) )
))
(declare-datatypes ((array!64785 0))(
  ( (array!64786 (arr!31189 (Array (_ BitVec 32) (_ BitVec 64))) (size!31707 (_ BitVec 32))) )
))
(declare-datatypes ((array!64787 0))(
  ( (array!64788 (arr!31190 (Array (_ BitVec 32) ValueCell!11465)) (size!31708 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5524 0))(
  ( (LongMapFixedSize!5525 (defaultEntry!6134 Int) (mask!29972 (_ BitVec 32)) (extraKeys!5866 (_ BitVec 32)) (zeroValue!5970 V!37323) (minValue!5970 V!37323) (_size!2817 (_ BitVec 32)) (_keys!11343 array!64785) (_values!6157 array!64787) (_vacant!2817 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15600 0))(
  ( (tuple2!15601 (_1!7811 Unit!33674) (_2!7811 LongMapFixedSize!5524)) )
))
(declare-fun lt!455072 () tuple2!15600)

(assert (=> b!1031757 (= e!582727 (bvsle #b00000000000000000000000000000000 (size!31707 (_keys!11343 (_2!7811 lt!455072)))))))

(declare-fun e!582728 () Bool)

(declare-fun e!582734 () Bool)

(declare-fun thiss!1427 () LongMapFixedSize!5524)

(declare-fun array_inv!24155 (array!64785) Bool)

(declare-fun array_inv!24156 (array!64787) Bool)

(assert (=> b!1031758 (= e!582728 (and tp!72919 tp_is_empty!24337 (array_inv!24155 (_keys!11343 thiss!1427)) (array_inv!24156 (_values!6157 thiss!1427)) e!582734))))

(declare-fun b!1031759 () Bool)

(declare-fun mapRes!37956 () Bool)

(assert (=> b!1031759 (= e!582734 (and e!582730 mapRes!37956))))

(declare-fun condMapEmpty!37956 () Bool)

(declare-fun mapDefault!37956 () ValueCell!11465)

(assert (=> b!1031759 (= condMapEmpty!37956 (= (arr!31190 (_values!6157 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11465)) mapDefault!37956)))))

(declare-fun b!1031760 () Bool)

(declare-fun res!689585 () Bool)

(declare-fun e!582733 () Bool)

(assert (=> b!1031760 (=> (not res!689585) (not e!582733))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1031760 (= res!689585 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37956 () Bool)

(assert (=> mapIsEmpty!37956 mapRes!37956))

(declare-fun mapNonEmpty!37956 () Bool)

(declare-fun tp!72918 () Bool)

(declare-fun e!582731 () Bool)

(assert (=> mapNonEmpty!37956 (= mapRes!37956 (and tp!72918 e!582731))))

(declare-fun mapRest!37956 () (Array (_ BitVec 32) ValueCell!11465))

(declare-fun mapValue!37956 () ValueCell!11465)

(declare-fun mapKey!37956 () (_ BitVec 32))

(assert (=> mapNonEmpty!37956 (= (arr!31190 (_values!6157 thiss!1427)) (store mapRest!37956 mapKey!37956 mapValue!37956))))

(declare-fun res!689589 () Bool)

(assert (=> start!90212 (=> (not res!689589) (not e!582733))))

(declare-fun valid!2099 (LongMapFixedSize!5524) Bool)

(assert (=> start!90212 (= res!689589 (valid!2099 thiss!1427))))

(assert (=> start!90212 e!582733))

(assert (=> start!90212 e!582728))

(assert (=> start!90212 true))

(declare-fun b!1031761 () Bool)

(declare-fun res!689587 () Bool)

(assert (=> b!1031761 (=> res!689587 e!582727)))

(declare-datatypes ((List!21825 0))(
  ( (Nil!21822) (Cons!21821 (h!23032 (_ BitVec 64)) (t!30929 List!21825)) )
))
(declare-fun arrayNoDuplicates!0 (array!64785 (_ BitVec 32) List!21825) Bool)

(assert (=> b!1031761 (= res!689587 (not (arrayNoDuplicates!0 (_keys!11343 (_2!7811 lt!455072)) #b00000000000000000000000000000000 Nil!21822)))))

(declare-fun b!1031762 () Bool)

(declare-fun res!689588 () Bool)

(assert (=> b!1031762 (=> res!689588 e!582727)))

(assert (=> b!1031762 (= res!689588 (or (not (= (size!31708 (_values!6157 (_2!7811 lt!455072))) (bvadd #b00000000000000000000000000000001 (mask!29972 (_2!7811 lt!455072))))) (not (= (size!31707 (_keys!11343 (_2!7811 lt!455072))) (size!31708 (_values!6157 (_2!7811 lt!455072))))) (bvslt (mask!29972 (_2!7811 lt!455072)) #b00000000000000000000000000000000) (bvslt (extraKeys!5866 (_2!7811 lt!455072)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5866 (_2!7811 lt!455072)) #b00000000000000000000000000000011)))))

(declare-fun b!1031763 () Bool)

(declare-fun e!582729 () Bool)

(assert (=> b!1031763 (= e!582733 e!582729)))

(declare-fun res!689584 () Bool)

(assert (=> b!1031763 (=> (not res!689584) (not e!582729))))

(declare-datatypes ((SeekEntryResult!9645 0))(
  ( (MissingZero!9645 (index!40951 (_ BitVec 32))) (Found!9645 (index!40952 (_ BitVec 32))) (Intermediate!9645 (undefined!10457 Bool) (index!40953 (_ BitVec 32)) (x!91687 (_ BitVec 32))) (Undefined!9645) (MissingVacant!9645 (index!40954 (_ BitVec 32))) )
))
(declare-fun lt!455077 () SeekEntryResult!9645)

(get-info :version)

(assert (=> b!1031763 (= res!689584 ((_ is Found!9645) lt!455077))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64785 (_ BitVec 32)) SeekEntryResult!9645)

(assert (=> b!1031763 (= lt!455077 (seekEntry!0 key!909 (_keys!11343 thiss!1427) (mask!29972 thiss!1427)))))

(declare-fun b!1031764 () Bool)

(assert (=> b!1031764 (= e!582729 (not e!582727))))

(declare-fun res!689586 () Bool)

(assert (=> b!1031764 (=> res!689586 e!582727)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031764 (= res!689586 (not (validMask!0 (mask!29972 (_2!7811 lt!455072)))))))

(declare-fun lt!455075 () array!64785)

(declare-fun lt!455078 () array!64787)

(declare-fun Unit!33676 () Unit!33674)

(declare-fun Unit!33677 () Unit!33674)

(assert (=> b!1031764 (= lt!455072 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2817 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15601 Unit!33676 (LongMapFixedSize!5525 (defaultEntry!6134 thiss!1427) (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) (bvsub (_size!2817 thiss!1427) #b00000000000000000000000000000001) lt!455075 lt!455078 (bvadd #b00000000000000000000000000000001 (_vacant!2817 thiss!1427)))) (tuple2!15601 Unit!33677 (LongMapFixedSize!5525 (defaultEntry!6134 thiss!1427) (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) (bvsub (_size!2817 thiss!1427) #b00000000000000000000000000000001) lt!455075 lt!455078 (_vacant!2817 thiss!1427)))))))

(declare-datatypes ((tuple2!15602 0))(
  ( (tuple2!15603 (_1!7812 (_ BitVec 64)) (_2!7812 V!37323)) )
))
(declare-datatypes ((List!21826 0))(
  ( (Nil!21823) (Cons!21822 (h!23033 tuple2!15602) (t!30930 List!21826)) )
))
(declare-datatypes ((ListLongMap!13707 0))(
  ( (ListLongMap!13708 (toList!6869 List!21826)) )
))
(declare-fun -!492 (ListLongMap!13707 (_ BitVec 64)) ListLongMap!13707)

(declare-fun getCurrentListMap!3915 (array!64785 array!64787 (_ BitVec 32) (_ BitVec 32) V!37323 V!37323 (_ BitVec 32) Int) ListLongMap!13707)

(assert (=> b!1031764 (= (-!492 (getCurrentListMap!3915 (_keys!11343 thiss!1427) (_values!6157 thiss!1427) (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)) key!909) (getCurrentListMap!3915 lt!455075 lt!455078 (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun dynLambda!1986 (Int (_ BitVec 64)) V!37323)

(assert (=> b!1031764 (= lt!455078 (array!64788 (store (arr!31190 (_values!6157 thiss!1427)) (index!40952 lt!455077) (ValueCellFull!11465 (dynLambda!1986 (defaultEntry!6134 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31708 (_values!6157 thiss!1427))))))

(declare-fun lt!455073 () Unit!33674)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!18 (array!64785 array!64787 (_ BitVec 32) (_ BitVec 32) V!37323 V!37323 (_ BitVec 32) (_ BitVec 64) Int) Unit!33674)

(assert (=> b!1031764 (= lt!455073 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!18 (_keys!11343 thiss!1427) (_values!6157 thiss!1427) (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) (index!40952 lt!455077) key!909 (defaultEntry!6134 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031764 (not (arrayContainsKey!0 lt!455075 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455076 () Unit!33674)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64785 (_ BitVec 32) (_ BitVec 64)) Unit!33674)

(assert (=> b!1031764 (= lt!455076 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11343 thiss!1427) (index!40952 lt!455077) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64785 (_ BitVec 32)) Bool)

(assert (=> b!1031764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455075 (mask!29972 thiss!1427))))

(declare-fun lt!455070 () Unit!33674)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64785 (_ BitVec 32) (_ BitVec 32)) Unit!33674)

(assert (=> b!1031764 (= lt!455070 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11343 thiss!1427) (index!40952 lt!455077) (mask!29972 thiss!1427)))))

(assert (=> b!1031764 (arrayNoDuplicates!0 lt!455075 #b00000000000000000000000000000000 Nil!21822)))

(declare-fun lt!455071 () Unit!33674)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64785 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21825) Unit!33674)

(assert (=> b!1031764 (= lt!455071 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11343 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40952 lt!455077) #b00000000000000000000000000000000 Nil!21822))))

(declare-fun arrayCountValidKeys!0 (array!64785 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031764 (= (arrayCountValidKeys!0 lt!455075 #b00000000000000000000000000000000 (size!31707 (_keys!11343 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11343 thiss!1427) #b00000000000000000000000000000000 (size!31707 (_keys!11343 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031764 (= lt!455075 (array!64786 (store (arr!31189 (_keys!11343 thiss!1427)) (index!40952 lt!455077) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31707 (_keys!11343 thiss!1427))))))

(declare-fun lt!455074 () Unit!33674)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64785 (_ BitVec 32) (_ BitVec 64)) Unit!33674)

(assert (=> b!1031764 (= lt!455074 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11343 thiss!1427) (index!40952 lt!455077) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031765 () Bool)

(assert (=> b!1031765 (= e!582731 tp_is_empty!24337)))

(declare-fun b!1031766 () Bool)

(declare-fun res!689583 () Bool)

(assert (=> b!1031766 (=> res!689583 e!582727)))

(assert (=> b!1031766 (= res!689583 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11343 (_2!7811 lt!455072)) (mask!29972 (_2!7811 lt!455072)))))))

(assert (= (and start!90212 res!689589) b!1031760))

(assert (= (and b!1031760 res!689585) b!1031763))

(assert (= (and b!1031763 res!689584) b!1031764))

(assert (= (and b!1031764 (not res!689586)) b!1031762))

(assert (= (and b!1031762 (not res!689588)) b!1031766))

(assert (= (and b!1031766 (not res!689583)) b!1031761))

(assert (= (and b!1031761 (not res!689587)) b!1031757))

(assert (= (and b!1031759 condMapEmpty!37956) mapIsEmpty!37956))

(assert (= (and b!1031759 (not condMapEmpty!37956)) mapNonEmpty!37956))

(assert (= (and mapNonEmpty!37956 ((_ is ValueCellFull!11465) mapValue!37956)) b!1031765))

(assert (= (and b!1031759 ((_ is ValueCellFull!11465) mapDefault!37956)) b!1031756))

(assert (= b!1031758 b!1031759))

(assert (= start!90212 b!1031758))

(declare-fun b_lambda!15957 () Bool)

(assert (=> (not b_lambda!15957) (not b!1031764)))

(declare-fun t!30928 () Bool)

(declare-fun tb!6927 () Bool)

(assert (=> (and b!1031758 (= (defaultEntry!6134 thiss!1427) (defaultEntry!6134 thiss!1427)) t!30928) tb!6927))

(declare-fun result!14189 () Bool)

(assert (=> tb!6927 (= result!14189 tp_is_empty!24337)))

(assert (=> b!1031764 t!30928))

(declare-fun b_and!33007 () Bool)

(assert (= b_and!33005 (and (=> t!30928 result!14189) b_and!33007)))

(declare-fun m!951853 () Bool)

(assert (=> b!1031763 m!951853))

(declare-fun m!951855 () Bool)

(assert (=> start!90212 m!951855))

(declare-fun m!951857 () Bool)

(assert (=> b!1031764 m!951857))

(declare-fun m!951859 () Bool)

(assert (=> b!1031764 m!951859))

(declare-fun m!951861 () Bool)

(assert (=> b!1031764 m!951861))

(declare-fun m!951863 () Bool)

(assert (=> b!1031764 m!951863))

(declare-fun m!951865 () Bool)

(assert (=> b!1031764 m!951865))

(declare-fun m!951867 () Bool)

(assert (=> b!1031764 m!951867))

(declare-fun m!951869 () Bool)

(assert (=> b!1031764 m!951869))

(declare-fun m!951871 () Bool)

(assert (=> b!1031764 m!951871))

(declare-fun m!951873 () Bool)

(assert (=> b!1031764 m!951873))

(declare-fun m!951875 () Bool)

(assert (=> b!1031764 m!951875))

(declare-fun m!951877 () Bool)

(assert (=> b!1031764 m!951877))

(declare-fun m!951879 () Bool)

(assert (=> b!1031764 m!951879))

(assert (=> b!1031764 m!951877))

(declare-fun m!951881 () Bool)

(assert (=> b!1031764 m!951881))

(declare-fun m!951883 () Bool)

(assert (=> b!1031764 m!951883))

(declare-fun m!951885 () Bool)

(assert (=> b!1031764 m!951885))

(declare-fun m!951887 () Bool)

(assert (=> b!1031764 m!951887))

(declare-fun m!951889 () Bool)

(assert (=> b!1031764 m!951889))

(declare-fun m!951891 () Bool)

(assert (=> mapNonEmpty!37956 m!951891))

(declare-fun m!951893 () Bool)

(assert (=> b!1031758 m!951893))

(declare-fun m!951895 () Bool)

(assert (=> b!1031758 m!951895))

(declare-fun m!951897 () Bool)

(assert (=> b!1031761 m!951897))

(declare-fun m!951899 () Bool)

(assert (=> b!1031766 m!951899))

(check-sat (not b!1031758) (not mapNonEmpty!37956) tp_is_empty!24337 (not start!90212) (not b!1031766) b_and!33007 (not b!1031763) (not b_next!20617) (not b!1031764) (not b_lambda!15957) (not b!1031761))
(check-sat b_and!33007 (not b_next!20617))
(get-model)

(declare-fun b_lambda!15963 () Bool)

(assert (= b_lambda!15957 (or (and b!1031758 b_free!20617) b_lambda!15963)))

(check-sat (not b_lambda!15963) (not b!1031758) (not mapNonEmpty!37956) tp_is_empty!24337 (not start!90212) (not b!1031766) (not b!1031761) b_and!33007 (not b!1031763) (not b_next!20617) (not b!1031764))
(check-sat b_and!33007 (not b_next!20617))
(get-model)

(declare-fun b!1031851 () Bool)

(declare-fun e!582791 () SeekEntryResult!9645)

(declare-fun e!582789 () SeekEntryResult!9645)

(assert (=> b!1031851 (= e!582791 e!582789)))

(declare-fun lt!455142 () (_ BitVec 64))

(declare-fun lt!455144 () SeekEntryResult!9645)

(assert (=> b!1031851 (= lt!455142 (select (arr!31189 (_keys!11343 thiss!1427)) (index!40953 lt!455144)))))

(declare-fun c!104597 () Bool)

(assert (=> b!1031851 (= c!104597 (= lt!455142 key!909))))

(declare-fun b!1031852 () Bool)

(declare-fun c!104599 () Bool)

(assert (=> b!1031852 (= c!104599 (= lt!455142 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!582790 () SeekEntryResult!9645)

(assert (=> b!1031852 (= e!582789 e!582790)))

(declare-fun b!1031853 () Bool)

(assert (=> b!1031853 (= e!582791 Undefined!9645)))

(declare-fun b!1031854 () Bool)

(declare-fun lt!455143 () SeekEntryResult!9645)

(assert (=> b!1031854 (= e!582790 (ite ((_ is MissingVacant!9645) lt!455143) (MissingZero!9645 (index!40954 lt!455143)) lt!455143))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64785 (_ BitVec 32)) SeekEntryResult!9645)

(assert (=> b!1031854 (= lt!455143 (seekKeyOrZeroReturnVacant!0 (x!91687 lt!455144) (index!40953 lt!455144) (index!40953 lt!455144) key!909 (_keys!11343 thiss!1427) (mask!29972 thiss!1427)))))

(declare-fun b!1031855 () Bool)

(assert (=> b!1031855 (= e!582790 (MissingZero!9645 (index!40953 lt!455144)))))

(declare-fun d!124057 () Bool)

(declare-fun lt!455141 () SeekEntryResult!9645)

(assert (=> d!124057 (and (or ((_ is MissingVacant!9645) lt!455141) (not ((_ is Found!9645) lt!455141)) (and (bvsge (index!40952 lt!455141) #b00000000000000000000000000000000) (bvslt (index!40952 lt!455141) (size!31707 (_keys!11343 thiss!1427))))) (not ((_ is MissingVacant!9645) lt!455141)) (or (not ((_ is Found!9645) lt!455141)) (= (select (arr!31189 (_keys!11343 thiss!1427)) (index!40952 lt!455141)) key!909)))))

(assert (=> d!124057 (= lt!455141 e!582791)))

(declare-fun c!104598 () Bool)

(assert (=> d!124057 (= c!104598 (and ((_ is Intermediate!9645) lt!455144) (undefined!10457 lt!455144)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64785 (_ BitVec 32)) SeekEntryResult!9645)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!124057 (= lt!455144 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29972 thiss!1427)) key!909 (_keys!11343 thiss!1427) (mask!29972 thiss!1427)))))

(assert (=> d!124057 (validMask!0 (mask!29972 thiss!1427))))

(assert (=> d!124057 (= (seekEntry!0 key!909 (_keys!11343 thiss!1427) (mask!29972 thiss!1427)) lt!455141)))

(declare-fun b!1031856 () Bool)

(assert (=> b!1031856 (= e!582789 (Found!9645 (index!40953 lt!455144)))))

(assert (= (and d!124057 c!104598) b!1031853))

(assert (= (and d!124057 (not c!104598)) b!1031851))

(assert (= (and b!1031851 c!104597) b!1031856))

(assert (= (and b!1031851 (not c!104597)) b!1031852))

(assert (= (and b!1031852 c!104599) b!1031855))

(assert (= (and b!1031852 (not c!104599)) b!1031854))

(declare-fun m!951997 () Bool)

(assert (=> b!1031851 m!951997))

(declare-fun m!951999 () Bool)

(assert (=> b!1031854 m!951999))

(declare-fun m!952001 () Bool)

(assert (=> d!124057 m!952001))

(declare-fun m!952003 () Bool)

(assert (=> d!124057 m!952003))

(assert (=> d!124057 m!952003))

(declare-fun m!952005 () Bool)

(assert (=> d!124057 m!952005))

(declare-fun m!952007 () Bool)

(assert (=> d!124057 m!952007))

(assert (=> b!1031763 d!124057))

(declare-fun d!124059 () Bool)

(declare-fun res!689638 () Bool)

(declare-fun e!582794 () Bool)

(assert (=> d!124059 (=> (not res!689638) (not e!582794))))

(declare-fun simpleValid!396 (LongMapFixedSize!5524) Bool)

(assert (=> d!124059 (= res!689638 (simpleValid!396 thiss!1427))))

(assert (=> d!124059 (= (valid!2099 thiss!1427) e!582794)))

(declare-fun b!1031863 () Bool)

(declare-fun res!689639 () Bool)

(assert (=> b!1031863 (=> (not res!689639) (not e!582794))))

(assert (=> b!1031863 (= res!689639 (= (arrayCountValidKeys!0 (_keys!11343 thiss!1427) #b00000000000000000000000000000000 (size!31707 (_keys!11343 thiss!1427))) (_size!2817 thiss!1427)))))

(declare-fun b!1031864 () Bool)

(declare-fun res!689640 () Bool)

(assert (=> b!1031864 (=> (not res!689640) (not e!582794))))

(assert (=> b!1031864 (= res!689640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11343 thiss!1427) (mask!29972 thiss!1427)))))

(declare-fun b!1031865 () Bool)

(assert (=> b!1031865 (= e!582794 (arrayNoDuplicates!0 (_keys!11343 thiss!1427) #b00000000000000000000000000000000 Nil!21822))))

(assert (= (and d!124059 res!689638) b!1031863))

(assert (= (and b!1031863 res!689639) b!1031864))

(assert (= (and b!1031864 res!689640) b!1031865))

(declare-fun m!952009 () Bool)

(assert (=> d!124059 m!952009))

(assert (=> b!1031863 m!951871))

(declare-fun m!952011 () Bool)

(assert (=> b!1031864 m!952011))

(declare-fun m!952013 () Bool)

(assert (=> b!1031865 m!952013))

(assert (=> start!90212 d!124059))

(declare-fun d!124061 () Bool)

(assert (=> d!124061 (= (array_inv!24155 (_keys!11343 thiss!1427)) (bvsge (size!31707 (_keys!11343 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1031758 d!124061))

(declare-fun d!124063 () Bool)

(assert (=> d!124063 (= (array_inv!24156 (_values!6157 thiss!1427)) (bvsge (size!31708 (_values!6157 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1031758 d!124063))

(declare-fun bm!43617 () Bool)

(declare-fun call!43620 () Bool)

(declare-fun c!104602 () Bool)

(assert (=> bm!43617 (= call!43620 (arrayNoDuplicates!0 (_keys!11343 (_2!7811 lt!455072)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104602 (Cons!21821 (select (arr!31189 (_keys!11343 (_2!7811 lt!455072))) #b00000000000000000000000000000000) Nil!21822) Nil!21822)))))

(declare-fun b!1031876 () Bool)

(declare-fun e!582806 () Bool)

(assert (=> b!1031876 (= e!582806 call!43620)))

(declare-fun b!1031877 () Bool)

(declare-fun e!582804 () Bool)

(assert (=> b!1031877 (= e!582804 e!582806)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1031877 (= c!104602 (validKeyInArray!0 (select (arr!31189 (_keys!11343 (_2!7811 lt!455072))) #b00000000000000000000000000000000)))))

(declare-fun b!1031878 () Bool)

(declare-fun e!582805 () Bool)

(assert (=> b!1031878 (= e!582805 e!582804)))

(declare-fun res!689649 () Bool)

(assert (=> b!1031878 (=> (not res!689649) (not e!582804))))

(declare-fun e!582803 () Bool)

(assert (=> b!1031878 (= res!689649 (not e!582803))))

(declare-fun res!689647 () Bool)

(assert (=> b!1031878 (=> (not res!689647) (not e!582803))))

(assert (=> b!1031878 (= res!689647 (validKeyInArray!0 (select (arr!31189 (_keys!11343 (_2!7811 lt!455072))) #b00000000000000000000000000000000)))))

(declare-fun b!1031879 () Bool)

(assert (=> b!1031879 (= e!582806 call!43620)))

(declare-fun b!1031880 () Bool)

(declare-fun contains!6003 (List!21825 (_ BitVec 64)) Bool)

(assert (=> b!1031880 (= e!582803 (contains!6003 Nil!21822 (select (arr!31189 (_keys!11343 (_2!7811 lt!455072))) #b00000000000000000000000000000000)))))

(declare-fun d!124065 () Bool)

(declare-fun res!689648 () Bool)

(assert (=> d!124065 (=> res!689648 e!582805)))

(assert (=> d!124065 (= res!689648 (bvsge #b00000000000000000000000000000000 (size!31707 (_keys!11343 (_2!7811 lt!455072)))))))

(assert (=> d!124065 (= (arrayNoDuplicates!0 (_keys!11343 (_2!7811 lt!455072)) #b00000000000000000000000000000000 Nil!21822) e!582805)))

(assert (= (and d!124065 (not res!689648)) b!1031878))

(assert (= (and b!1031878 res!689647) b!1031880))

(assert (= (and b!1031878 res!689649) b!1031877))

(assert (= (and b!1031877 c!104602) b!1031879))

(assert (= (and b!1031877 (not c!104602)) b!1031876))

(assert (= (or b!1031879 b!1031876) bm!43617))

(declare-fun m!952015 () Bool)

(assert (=> bm!43617 m!952015))

(declare-fun m!952017 () Bool)

(assert (=> bm!43617 m!952017))

(assert (=> b!1031877 m!952015))

(assert (=> b!1031877 m!952015))

(declare-fun m!952019 () Bool)

(assert (=> b!1031877 m!952019))

(assert (=> b!1031878 m!952015))

(assert (=> b!1031878 m!952015))

(assert (=> b!1031878 m!952019))

(assert (=> b!1031880 m!952015))

(assert (=> b!1031880 m!952015))

(declare-fun m!952021 () Bool)

(assert (=> b!1031880 m!952021))

(assert (=> b!1031761 d!124065))

(declare-fun d!124067 () Bool)

(declare-fun res!689654 () Bool)

(declare-fun e!582813 () Bool)

(assert (=> d!124067 (=> res!689654 e!582813)))

(assert (=> d!124067 (= res!689654 (bvsge #b00000000000000000000000000000000 (size!31707 (_keys!11343 (_2!7811 lt!455072)))))))

(assert (=> d!124067 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11343 (_2!7811 lt!455072)) (mask!29972 (_2!7811 lt!455072))) e!582813)))

(declare-fun b!1031889 () Bool)

(declare-fun e!582815 () Bool)

(assert (=> b!1031889 (= e!582813 e!582815)))

(declare-fun c!104605 () Bool)

(assert (=> b!1031889 (= c!104605 (validKeyInArray!0 (select (arr!31189 (_keys!11343 (_2!7811 lt!455072))) #b00000000000000000000000000000000)))))

(declare-fun bm!43620 () Bool)

(declare-fun call!43623 () Bool)

(assert (=> bm!43620 (= call!43623 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11343 (_2!7811 lt!455072)) (mask!29972 (_2!7811 lt!455072))))))

(declare-fun b!1031890 () Bool)

(assert (=> b!1031890 (= e!582815 call!43623)))

(declare-fun b!1031891 () Bool)

(declare-fun e!582814 () Bool)

(assert (=> b!1031891 (= e!582814 call!43623)))

(declare-fun b!1031892 () Bool)

(assert (=> b!1031892 (= e!582815 e!582814)))

(declare-fun lt!455153 () (_ BitVec 64))

(assert (=> b!1031892 (= lt!455153 (select (arr!31189 (_keys!11343 (_2!7811 lt!455072))) #b00000000000000000000000000000000))))

(declare-fun lt!455152 () Unit!33674)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64785 (_ BitVec 64) (_ BitVec 32)) Unit!33674)

(assert (=> b!1031892 (= lt!455152 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11343 (_2!7811 lt!455072)) lt!455153 #b00000000000000000000000000000000))))

(assert (=> b!1031892 (arrayContainsKey!0 (_keys!11343 (_2!7811 lt!455072)) lt!455153 #b00000000000000000000000000000000)))

(declare-fun lt!455151 () Unit!33674)

(assert (=> b!1031892 (= lt!455151 lt!455152)))

(declare-fun res!689655 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64785 (_ BitVec 32)) SeekEntryResult!9645)

(assert (=> b!1031892 (= res!689655 (= (seekEntryOrOpen!0 (select (arr!31189 (_keys!11343 (_2!7811 lt!455072))) #b00000000000000000000000000000000) (_keys!11343 (_2!7811 lt!455072)) (mask!29972 (_2!7811 lt!455072))) (Found!9645 #b00000000000000000000000000000000)))))

(assert (=> b!1031892 (=> (not res!689655) (not e!582814))))

(assert (= (and d!124067 (not res!689654)) b!1031889))

(assert (= (and b!1031889 c!104605) b!1031892))

(assert (= (and b!1031889 (not c!104605)) b!1031890))

(assert (= (and b!1031892 res!689655) b!1031891))

(assert (= (or b!1031891 b!1031890) bm!43620))

(assert (=> b!1031889 m!952015))

(assert (=> b!1031889 m!952015))

(assert (=> b!1031889 m!952019))

(declare-fun m!952023 () Bool)

(assert (=> bm!43620 m!952023))

(assert (=> b!1031892 m!952015))

(declare-fun m!952025 () Bool)

(assert (=> b!1031892 m!952025))

(declare-fun m!952027 () Bool)

(assert (=> b!1031892 m!952027))

(assert (=> b!1031892 m!952015))

(declare-fun m!952029 () Bool)

(assert (=> b!1031892 m!952029))

(assert (=> b!1031766 d!124067))

(declare-fun b!1031901 () Bool)

(declare-fun e!582821 () (_ BitVec 32))

(declare-fun call!43626 () (_ BitVec 32))

(assert (=> b!1031901 (= e!582821 call!43626)))

(declare-fun d!124069 () Bool)

(declare-fun lt!455156 () (_ BitVec 32))

(assert (=> d!124069 (and (bvsge lt!455156 #b00000000000000000000000000000000) (bvsle lt!455156 (bvsub (size!31707 lt!455075) #b00000000000000000000000000000000)))))

(declare-fun e!582820 () (_ BitVec 32))

(assert (=> d!124069 (= lt!455156 e!582820)))

(declare-fun c!104611 () Bool)

(assert (=> d!124069 (= c!104611 (bvsge #b00000000000000000000000000000000 (size!31707 (_keys!11343 thiss!1427))))))

(assert (=> d!124069 (and (bvsle #b00000000000000000000000000000000 (size!31707 (_keys!11343 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31707 (_keys!11343 thiss!1427)) (size!31707 lt!455075)))))

(assert (=> d!124069 (= (arrayCountValidKeys!0 lt!455075 #b00000000000000000000000000000000 (size!31707 (_keys!11343 thiss!1427))) lt!455156)))

(declare-fun bm!43623 () Bool)

(assert (=> bm!43623 (= call!43626 (arrayCountValidKeys!0 lt!455075 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31707 (_keys!11343 thiss!1427))))))

(declare-fun b!1031902 () Bool)

(assert (=> b!1031902 (= e!582820 e!582821)))

(declare-fun c!104610 () Bool)

(assert (=> b!1031902 (= c!104610 (validKeyInArray!0 (select (arr!31189 lt!455075) #b00000000000000000000000000000000)))))

(declare-fun b!1031903 () Bool)

(assert (=> b!1031903 (= e!582820 #b00000000000000000000000000000000)))

(declare-fun b!1031904 () Bool)

(assert (=> b!1031904 (= e!582821 (bvadd #b00000000000000000000000000000001 call!43626))))

(assert (= (and d!124069 c!104611) b!1031903))

(assert (= (and d!124069 (not c!104611)) b!1031902))

(assert (= (and b!1031902 c!104610) b!1031904))

(assert (= (and b!1031902 (not c!104610)) b!1031901))

(assert (= (or b!1031904 b!1031901) bm!43623))

(declare-fun m!952031 () Bool)

(assert (=> bm!43623 m!952031))

(declare-fun m!952033 () Bool)

(assert (=> b!1031902 m!952033))

(assert (=> b!1031902 m!952033))

(declare-fun m!952035 () Bool)

(assert (=> b!1031902 m!952035))

(assert (=> b!1031764 d!124069))

(declare-fun b!1031947 () Bool)

(declare-fun e!582859 () Bool)

(declare-fun call!43641 () Bool)

(assert (=> b!1031947 (= e!582859 (not call!43641))))

(declare-fun b!1031948 () Bool)

(declare-fun e!582855 () ListLongMap!13707)

(declare-fun call!43644 () ListLongMap!13707)

(assert (=> b!1031948 (= e!582855 call!43644)))

(declare-fun d!124071 () Bool)

(declare-fun e!582854 () Bool)

(assert (=> d!124071 e!582854))

(declare-fun res!689679 () Bool)

(assert (=> d!124071 (=> (not res!689679) (not e!582854))))

(assert (=> d!124071 (= res!689679 (or (bvsge #b00000000000000000000000000000000 (size!31707 (_keys!11343 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31707 (_keys!11343 thiss!1427))))))))

(declare-fun lt!455203 () ListLongMap!13707)

(declare-fun lt!455207 () ListLongMap!13707)

(assert (=> d!124071 (= lt!455203 lt!455207)))

(declare-fun lt!455214 () Unit!33674)

(declare-fun e!582856 () Unit!33674)

(assert (=> d!124071 (= lt!455214 e!582856)))

(declare-fun c!104627 () Bool)

(declare-fun e!582860 () Bool)

(assert (=> d!124071 (= c!104627 e!582860)))

(declare-fun res!689680 () Bool)

(assert (=> d!124071 (=> (not res!689680) (not e!582860))))

(assert (=> d!124071 (= res!689680 (bvslt #b00000000000000000000000000000000 (size!31707 (_keys!11343 thiss!1427))))))

(declare-fun e!582858 () ListLongMap!13707)

(assert (=> d!124071 (= lt!455207 e!582858)))

(declare-fun c!104628 () Bool)

(assert (=> d!124071 (= c!104628 (and (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!124071 (validMask!0 (mask!29972 thiss!1427))))

(assert (=> d!124071 (= (getCurrentListMap!3915 (_keys!11343 thiss!1427) (_values!6157 thiss!1427) (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)) lt!455203)))

(declare-fun b!1031949 () Bool)

(declare-fun e!582852 () ListLongMap!13707)

(assert (=> b!1031949 (= e!582852 call!43644)))

(declare-fun b!1031950 () Bool)

(declare-fun res!689676 () Bool)

(assert (=> b!1031950 (=> (not res!689676) (not e!582854))))

(declare-fun e!582850 () Bool)

(assert (=> b!1031950 (= res!689676 e!582850)))

(declare-fun res!689682 () Bool)

(assert (=> b!1031950 (=> res!689682 e!582850)))

(declare-fun e!582848 () Bool)

(assert (=> b!1031950 (= res!689682 (not e!582848))))

(declare-fun res!689678 () Bool)

(assert (=> b!1031950 (=> (not res!689678) (not e!582848))))

(assert (=> b!1031950 (= res!689678 (bvslt #b00000000000000000000000000000000 (size!31707 (_keys!11343 thiss!1427))))))

(declare-fun b!1031951 () Bool)

(declare-fun lt!455216 () Unit!33674)

(assert (=> b!1031951 (= e!582856 lt!455216)))

(declare-fun lt!455215 () ListLongMap!13707)

(declare-fun getCurrentListMapNoExtraKeys!3565 (array!64785 array!64787 (_ BitVec 32) (_ BitVec 32) V!37323 V!37323 (_ BitVec 32) Int) ListLongMap!13707)

(assert (=> b!1031951 (= lt!455215 (getCurrentListMapNoExtraKeys!3565 (_keys!11343 thiss!1427) (_values!6157 thiss!1427) (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun lt!455206 () (_ BitVec 64))

(assert (=> b!1031951 (= lt!455206 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!455212 () (_ BitVec 64))

(assert (=> b!1031951 (= lt!455212 (select (arr!31189 (_keys!11343 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!455205 () Unit!33674)

(declare-fun addStillContains!624 (ListLongMap!13707 (_ BitVec 64) V!37323 (_ BitVec 64)) Unit!33674)

(assert (=> b!1031951 (= lt!455205 (addStillContains!624 lt!455215 lt!455206 (zeroValue!5970 thiss!1427) lt!455212))))

(declare-fun contains!6004 (ListLongMap!13707 (_ BitVec 64)) Bool)

(declare-fun +!3125 (ListLongMap!13707 tuple2!15602) ListLongMap!13707)

(assert (=> b!1031951 (contains!6004 (+!3125 lt!455215 (tuple2!15603 lt!455206 (zeroValue!5970 thiss!1427))) lt!455212)))

(declare-fun lt!455210 () Unit!33674)

(assert (=> b!1031951 (= lt!455210 lt!455205)))

(declare-fun lt!455217 () ListLongMap!13707)

(assert (=> b!1031951 (= lt!455217 (getCurrentListMapNoExtraKeys!3565 (_keys!11343 thiss!1427) (_values!6157 thiss!1427) (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun lt!455201 () (_ BitVec 64))

(assert (=> b!1031951 (= lt!455201 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!455222 () (_ BitVec 64))

(assert (=> b!1031951 (= lt!455222 (select (arr!31189 (_keys!11343 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!455204 () Unit!33674)

(declare-fun addApplyDifferent!480 (ListLongMap!13707 (_ BitVec 64) V!37323 (_ BitVec 64)) Unit!33674)

(assert (=> b!1031951 (= lt!455204 (addApplyDifferent!480 lt!455217 lt!455201 (minValue!5970 thiss!1427) lt!455222))))

(declare-fun apply!914 (ListLongMap!13707 (_ BitVec 64)) V!37323)

(assert (=> b!1031951 (= (apply!914 (+!3125 lt!455217 (tuple2!15603 lt!455201 (minValue!5970 thiss!1427))) lt!455222) (apply!914 lt!455217 lt!455222))))

(declare-fun lt!455219 () Unit!33674)

(assert (=> b!1031951 (= lt!455219 lt!455204)))

(declare-fun lt!455218 () ListLongMap!13707)

(assert (=> b!1031951 (= lt!455218 (getCurrentListMapNoExtraKeys!3565 (_keys!11343 thiss!1427) (_values!6157 thiss!1427) (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun lt!455221 () (_ BitVec 64))

(assert (=> b!1031951 (= lt!455221 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!455211 () (_ BitVec 64))

(assert (=> b!1031951 (= lt!455211 (select (arr!31189 (_keys!11343 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!455220 () Unit!33674)

(assert (=> b!1031951 (= lt!455220 (addApplyDifferent!480 lt!455218 lt!455221 (zeroValue!5970 thiss!1427) lt!455211))))

(assert (=> b!1031951 (= (apply!914 (+!3125 lt!455218 (tuple2!15603 lt!455221 (zeroValue!5970 thiss!1427))) lt!455211) (apply!914 lt!455218 lt!455211))))

(declare-fun lt!455208 () Unit!33674)

(assert (=> b!1031951 (= lt!455208 lt!455220)))

(declare-fun lt!455202 () ListLongMap!13707)

(assert (=> b!1031951 (= lt!455202 (getCurrentListMapNoExtraKeys!3565 (_keys!11343 thiss!1427) (_values!6157 thiss!1427) (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun lt!455213 () (_ BitVec 64))

(assert (=> b!1031951 (= lt!455213 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!455209 () (_ BitVec 64))

(assert (=> b!1031951 (= lt!455209 (select (arr!31189 (_keys!11343 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1031951 (= lt!455216 (addApplyDifferent!480 lt!455202 lt!455213 (minValue!5970 thiss!1427) lt!455209))))

(assert (=> b!1031951 (= (apply!914 (+!3125 lt!455202 (tuple2!15603 lt!455213 (minValue!5970 thiss!1427))) lt!455209) (apply!914 lt!455202 lt!455209))))

(declare-fun b!1031952 () Bool)

(declare-fun e!582857 () Bool)

(assert (=> b!1031952 (= e!582857 (= (apply!914 lt!455203 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5970 thiss!1427)))))

(declare-fun bm!43638 () Bool)

(declare-fun call!43647 () ListLongMap!13707)

(declare-fun call!43645 () ListLongMap!13707)

(assert (=> bm!43638 (= call!43647 call!43645)))

(declare-fun bm!43639 () Bool)

(assert (=> bm!43639 (= call!43645 (getCurrentListMapNoExtraKeys!3565 (_keys!11343 thiss!1427) (_values!6157 thiss!1427) (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun b!1031953 () Bool)

(declare-fun res!689674 () Bool)

(assert (=> b!1031953 (=> (not res!689674) (not e!582854))))

(assert (=> b!1031953 (= res!689674 e!582859)))

(declare-fun c!104625 () Bool)

(assert (=> b!1031953 (= c!104625 (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1031954 () Bool)

(assert (=> b!1031954 (= e!582860 (validKeyInArray!0 (select (arr!31189 (_keys!11343 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1031955 () Bool)

(assert (=> b!1031955 (= e!582858 e!582855)))

(declare-fun c!104626 () Bool)

(assert (=> b!1031955 (= c!104626 (and (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1031956 () Bool)

(declare-fun e!582849 () Bool)

(assert (=> b!1031956 (= e!582859 e!582849)))

(declare-fun res!689677 () Bool)

(assert (=> b!1031956 (= res!689677 call!43641)))

(assert (=> b!1031956 (=> (not res!689677) (not e!582849))))

(declare-fun bm!43640 () Bool)

(assert (=> bm!43640 (= call!43641 (contains!6004 lt!455203 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031957 () Bool)

(declare-fun e!582851 () Bool)

(declare-fun get!16401 (ValueCell!11465 V!37323) V!37323)

(assert (=> b!1031957 (= e!582851 (= (apply!914 lt!455203 (select (arr!31189 (_keys!11343 thiss!1427)) #b00000000000000000000000000000000)) (get!16401 (select (arr!31190 (_values!6157 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1986 (defaultEntry!6134 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1031957 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31708 (_values!6157 thiss!1427))))))

(assert (=> b!1031957 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31707 (_keys!11343 thiss!1427))))))

(declare-fun bm!43641 () Bool)

(declare-fun call!43646 () Bool)

(assert (=> bm!43641 (= call!43646 (contains!6004 lt!455203 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031958 () Bool)

(declare-fun call!43642 () ListLongMap!13707)

(assert (=> b!1031958 (= e!582852 call!43642)))

(declare-fun b!1031959 () Bool)

(declare-fun call!43643 () ListLongMap!13707)

(assert (=> b!1031959 (= e!582858 (+!3125 call!43643 (tuple2!15603 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5970 thiss!1427))))))

(declare-fun b!1031960 () Bool)

(declare-fun Unit!33680 () Unit!33674)

(assert (=> b!1031960 (= e!582856 Unit!33680)))

(declare-fun b!1031961 () Bool)

(declare-fun e!582853 () Bool)

(assert (=> b!1031961 (= e!582853 e!582857)))

(declare-fun res!689681 () Bool)

(assert (=> b!1031961 (= res!689681 call!43646)))

(assert (=> b!1031961 (=> (not res!689681) (not e!582857))))

(declare-fun bm!43642 () Bool)

(assert (=> bm!43642 (= call!43642 call!43647)))

(declare-fun b!1031962 () Bool)

(assert (=> b!1031962 (= e!582853 (not call!43646))))

(declare-fun b!1031963 () Bool)

(declare-fun c!104624 () Bool)

(assert (=> b!1031963 (= c!104624 (and (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1031963 (= e!582855 e!582852)))

(declare-fun bm!43643 () Bool)

(assert (=> bm!43643 (= call!43644 call!43643)))

(declare-fun bm!43644 () Bool)

(assert (=> bm!43644 (= call!43643 (+!3125 (ite c!104628 call!43645 (ite c!104626 call!43647 call!43642)) (ite (or c!104628 c!104626) (tuple2!15603 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5970 thiss!1427)) (tuple2!15603 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5970 thiss!1427)))))))

(declare-fun b!1031964 () Bool)

(assert (=> b!1031964 (= e!582849 (= (apply!914 lt!455203 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5970 thiss!1427)))))

(declare-fun b!1031965 () Bool)

(assert (=> b!1031965 (= e!582848 (validKeyInArray!0 (select (arr!31189 (_keys!11343 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1031966 () Bool)

(assert (=> b!1031966 (= e!582850 e!582851)))

(declare-fun res!689675 () Bool)

(assert (=> b!1031966 (=> (not res!689675) (not e!582851))))

(assert (=> b!1031966 (= res!689675 (contains!6004 lt!455203 (select (arr!31189 (_keys!11343 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1031966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31707 (_keys!11343 thiss!1427))))))

(declare-fun b!1031967 () Bool)

(assert (=> b!1031967 (= e!582854 e!582853)))

(declare-fun c!104629 () Bool)

(assert (=> b!1031967 (= c!104629 (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!124071 c!104628) b!1031959))

(assert (= (and d!124071 (not c!104628)) b!1031955))

(assert (= (and b!1031955 c!104626) b!1031948))

(assert (= (and b!1031955 (not c!104626)) b!1031963))

(assert (= (and b!1031963 c!104624) b!1031949))

(assert (= (and b!1031963 (not c!104624)) b!1031958))

(assert (= (or b!1031949 b!1031958) bm!43642))

(assert (= (or b!1031948 bm!43642) bm!43638))

(assert (= (or b!1031948 b!1031949) bm!43643))

(assert (= (or b!1031959 bm!43638) bm!43639))

(assert (= (or b!1031959 bm!43643) bm!43644))

(assert (= (and d!124071 res!689680) b!1031954))

(assert (= (and d!124071 c!104627) b!1031951))

(assert (= (and d!124071 (not c!104627)) b!1031960))

(assert (= (and d!124071 res!689679) b!1031950))

(assert (= (and b!1031950 res!689678) b!1031965))

(assert (= (and b!1031950 (not res!689682)) b!1031966))

(assert (= (and b!1031966 res!689675) b!1031957))

(assert (= (and b!1031950 res!689676) b!1031953))

(assert (= (and b!1031953 c!104625) b!1031956))

(assert (= (and b!1031953 (not c!104625)) b!1031947))

(assert (= (and b!1031956 res!689677) b!1031964))

(assert (= (or b!1031956 b!1031947) bm!43640))

(assert (= (and b!1031953 res!689674) b!1031967))

(assert (= (and b!1031967 c!104629) b!1031961))

(assert (= (and b!1031967 (not c!104629)) b!1031962))

(assert (= (and b!1031961 res!689681) b!1031952))

(assert (= (or b!1031961 b!1031962) bm!43641))

(declare-fun b_lambda!15965 () Bool)

(assert (=> (not b_lambda!15965) (not b!1031957)))

(assert (=> b!1031957 t!30928))

(declare-fun b_and!33017 () Bool)

(assert (= b_and!33007 (and (=> t!30928 result!14189) b_and!33017)))

(declare-fun m!952037 () Bool)

(assert (=> b!1031965 m!952037))

(assert (=> b!1031965 m!952037))

(declare-fun m!952039 () Bool)

(assert (=> b!1031965 m!952039))

(declare-fun m!952041 () Bool)

(assert (=> b!1031964 m!952041))

(declare-fun m!952043 () Bool)

(assert (=> b!1031959 m!952043))

(declare-fun m!952045 () Bool)

(assert (=> bm!43639 m!952045))

(declare-fun m!952047 () Bool)

(assert (=> bm!43644 m!952047))

(declare-fun m!952049 () Bool)

(assert (=> b!1031952 m!952049))

(declare-fun m!952051 () Bool)

(assert (=> b!1031951 m!952051))

(declare-fun m!952053 () Bool)

(assert (=> b!1031951 m!952053))

(declare-fun m!952055 () Bool)

(assert (=> b!1031951 m!952055))

(declare-fun m!952057 () Bool)

(assert (=> b!1031951 m!952057))

(assert (=> b!1031951 m!952045))

(declare-fun m!952059 () Bool)

(assert (=> b!1031951 m!952059))

(assert (=> b!1031951 m!952037))

(assert (=> b!1031951 m!952057))

(declare-fun m!952061 () Bool)

(assert (=> b!1031951 m!952061))

(declare-fun m!952063 () Bool)

(assert (=> b!1031951 m!952063))

(declare-fun m!952065 () Bool)

(assert (=> b!1031951 m!952065))

(declare-fun m!952067 () Bool)

(assert (=> b!1031951 m!952067))

(declare-fun m!952069 () Bool)

(assert (=> b!1031951 m!952069))

(declare-fun m!952071 () Bool)

(assert (=> b!1031951 m!952071))

(declare-fun m!952073 () Bool)

(assert (=> b!1031951 m!952073))

(assert (=> b!1031951 m!952067))

(assert (=> b!1031951 m!952071))

(declare-fun m!952075 () Bool)

(assert (=> b!1031951 m!952075))

(assert (=> b!1031951 m!952063))

(declare-fun m!952077 () Bool)

(assert (=> b!1031951 m!952077))

(declare-fun m!952079 () Bool)

(assert (=> b!1031951 m!952079))

(declare-fun m!952081 () Bool)

(assert (=> bm!43641 m!952081))

(declare-fun m!952083 () Bool)

(assert (=> bm!43640 m!952083))

(assert (=> b!1031966 m!952037))

(assert (=> b!1031966 m!952037))

(declare-fun m!952085 () Bool)

(assert (=> b!1031966 m!952085))

(assert (=> b!1031954 m!952037))

(assert (=> b!1031954 m!952037))

(assert (=> b!1031954 m!952039))

(assert (=> d!124071 m!952007))

(assert (=> b!1031957 m!951885))

(assert (=> b!1031957 m!952037))

(declare-fun m!952087 () Bool)

(assert (=> b!1031957 m!952087))

(assert (=> b!1031957 m!951885))

(declare-fun m!952089 () Bool)

(assert (=> b!1031957 m!952089))

(assert (=> b!1031957 m!952037))

(declare-fun m!952091 () Bool)

(assert (=> b!1031957 m!952091))

(assert (=> b!1031957 m!952087))

(assert (=> b!1031764 d!124071))

(declare-fun d!124073 () Bool)

(declare-fun e!582863 () Bool)

(assert (=> d!124073 e!582863))

(declare-fun res!689685 () Bool)

(assert (=> d!124073 (=> (not res!689685) (not e!582863))))

(assert (=> d!124073 (= res!689685 (and (bvsge (index!40952 lt!455077) #b00000000000000000000000000000000) (bvslt (index!40952 lt!455077) (size!31707 (_keys!11343 thiss!1427)))))))

(declare-fun lt!455225 () Unit!33674)

(declare-fun choose!53 (array!64785 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21825) Unit!33674)

(assert (=> d!124073 (= lt!455225 (choose!53 (_keys!11343 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40952 lt!455077) #b00000000000000000000000000000000 Nil!21822))))

(assert (=> d!124073 (bvslt (size!31707 (_keys!11343 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!124073 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11343 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40952 lt!455077) #b00000000000000000000000000000000 Nil!21822) lt!455225)))

(declare-fun b!1031970 () Bool)

(assert (=> b!1031970 (= e!582863 (arrayNoDuplicates!0 (array!64786 (store (arr!31189 (_keys!11343 thiss!1427)) (index!40952 lt!455077) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31707 (_keys!11343 thiss!1427))) #b00000000000000000000000000000000 Nil!21822))))

(assert (= (and d!124073 res!689685) b!1031970))

(declare-fun m!952093 () Bool)

(assert (=> d!124073 m!952093))

(assert (=> b!1031970 m!951857))

(declare-fun m!952095 () Bool)

(assert (=> b!1031970 m!952095))

(assert (=> b!1031764 d!124073))

(declare-fun d!124075 () Bool)

(declare-fun res!689686 () Bool)

(declare-fun e!582864 () Bool)

(assert (=> d!124075 (=> res!689686 e!582864)))

(assert (=> d!124075 (= res!689686 (bvsge #b00000000000000000000000000000000 (size!31707 lt!455075)))))

(assert (=> d!124075 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455075 (mask!29972 thiss!1427)) e!582864)))

(declare-fun b!1031971 () Bool)

(declare-fun e!582866 () Bool)

(assert (=> b!1031971 (= e!582864 e!582866)))

(declare-fun c!104630 () Bool)

(assert (=> b!1031971 (= c!104630 (validKeyInArray!0 (select (arr!31189 lt!455075) #b00000000000000000000000000000000)))))

(declare-fun bm!43645 () Bool)

(declare-fun call!43648 () Bool)

(assert (=> bm!43645 (= call!43648 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!455075 (mask!29972 thiss!1427)))))

(declare-fun b!1031972 () Bool)

(assert (=> b!1031972 (= e!582866 call!43648)))

(declare-fun b!1031973 () Bool)

(declare-fun e!582865 () Bool)

(assert (=> b!1031973 (= e!582865 call!43648)))

(declare-fun b!1031974 () Bool)

(assert (=> b!1031974 (= e!582866 e!582865)))

(declare-fun lt!455228 () (_ BitVec 64))

(assert (=> b!1031974 (= lt!455228 (select (arr!31189 lt!455075) #b00000000000000000000000000000000))))

(declare-fun lt!455227 () Unit!33674)

(assert (=> b!1031974 (= lt!455227 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!455075 lt!455228 #b00000000000000000000000000000000))))

(assert (=> b!1031974 (arrayContainsKey!0 lt!455075 lt!455228 #b00000000000000000000000000000000)))

(declare-fun lt!455226 () Unit!33674)

(assert (=> b!1031974 (= lt!455226 lt!455227)))

(declare-fun res!689687 () Bool)

(assert (=> b!1031974 (= res!689687 (= (seekEntryOrOpen!0 (select (arr!31189 lt!455075) #b00000000000000000000000000000000) lt!455075 (mask!29972 thiss!1427)) (Found!9645 #b00000000000000000000000000000000)))))

(assert (=> b!1031974 (=> (not res!689687) (not e!582865))))

(assert (= (and d!124075 (not res!689686)) b!1031971))

(assert (= (and b!1031971 c!104630) b!1031974))

(assert (= (and b!1031971 (not c!104630)) b!1031972))

(assert (= (and b!1031974 res!689687) b!1031973))

(assert (= (or b!1031973 b!1031972) bm!43645))

(assert (=> b!1031971 m!952033))

(assert (=> b!1031971 m!952033))

(assert (=> b!1031971 m!952035))

(declare-fun m!952097 () Bool)

(assert (=> bm!43645 m!952097))

(assert (=> b!1031974 m!952033))

(declare-fun m!952099 () Bool)

(assert (=> b!1031974 m!952099))

(declare-fun m!952101 () Bool)

(assert (=> b!1031974 m!952101))

(assert (=> b!1031974 m!952033))

(declare-fun m!952103 () Bool)

(assert (=> b!1031974 m!952103))

(assert (=> b!1031764 d!124075))

(declare-fun d!124077 () Bool)

(declare-fun e!582869 () Bool)

(assert (=> d!124077 e!582869))

(declare-fun res!689690 () Bool)

(assert (=> d!124077 (=> (not res!689690) (not e!582869))))

(assert (=> d!124077 (= res!689690 (bvslt (index!40952 lt!455077) (size!31707 (_keys!11343 thiss!1427))))))

(declare-fun lt!455231 () Unit!33674)

(declare-fun choose!121 (array!64785 (_ BitVec 32) (_ BitVec 64)) Unit!33674)

(assert (=> d!124077 (= lt!455231 (choose!121 (_keys!11343 thiss!1427) (index!40952 lt!455077) key!909))))

(assert (=> d!124077 (bvsge (index!40952 lt!455077) #b00000000000000000000000000000000)))

(assert (=> d!124077 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11343 thiss!1427) (index!40952 lt!455077) key!909) lt!455231)))

(declare-fun b!1031977 () Bool)

(assert (=> b!1031977 (= e!582869 (not (arrayContainsKey!0 (array!64786 (store (arr!31189 (_keys!11343 thiss!1427)) (index!40952 lt!455077) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31707 (_keys!11343 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!124077 res!689690) b!1031977))

(declare-fun m!952105 () Bool)

(assert (=> d!124077 m!952105))

(assert (=> b!1031977 m!951857))

(declare-fun m!952107 () Bool)

(assert (=> b!1031977 m!952107))

(assert (=> b!1031764 d!124077))

(declare-fun b!1031978 () Bool)

(declare-fun e!582881 () Bool)

(declare-fun call!43649 () Bool)

(assert (=> b!1031978 (= e!582881 (not call!43649))))

(declare-fun b!1031979 () Bool)

(declare-fun e!582877 () ListLongMap!13707)

(declare-fun call!43652 () ListLongMap!13707)

(assert (=> b!1031979 (= e!582877 call!43652)))

(declare-fun d!124079 () Bool)

(declare-fun e!582876 () Bool)

(assert (=> d!124079 e!582876))

(declare-fun res!689696 () Bool)

(assert (=> d!124079 (=> (not res!689696) (not e!582876))))

(assert (=> d!124079 (= res!689696 (or (bvsge #b00000000000000000000000000000000 (size!31707 lt!455075)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31707 lt!455075)))))))

(declare-fun lt!455234 () ListLongMap!13707)

(declare-fun lt!455238 () ListLongMap!13707)

(assert (=> d!124079 (= lt!455234 lt!455238)))

(declare-fun lt!455245 () Unit!33674)

(declare-fun e!582878 () Unit!33674)

(assert (=> d!124079 (= lt!455245 e!582878)))

(declare-fun c!104634 () Bool)

(declare-fun e!582882 () Bool)

(assert (=> d!124079 (= c!104634 e!582882)))

(declare-fun res!689697 () Bool)

(assert (=> d!124079 (=> (not res!689697) (not e!582882))))

(assert (=> d!124079 (= res!689697 (bvslt #b00000000000000000000000000000000 (size!31707 lt!455075)))))

(declare-fun e!582880 () ListLongMap!13707)

(assert (=> d!124079 (= lt!455238 e!582880)))

(declare-fun c!104635 () Bool)

(assert (=> d!124079 (= c!104635 (and (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!124079 (validMask!0 (mask!29972 thiss!1427))))

(assert (=> d!124079 (= (getCurrentListMap!3915 lt!455075 lt!455078 (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)) lt!455234)))

(declare-fun b!1031980 () Bool)

(declare-fun e!582874 () ListLongMap!13707)

(assert (=> b!1031980 (= e!582874 call!43652)))

(declare-fun b!1031981 () Bool)

(declare-fun res!689693 () Bool)

(assert (=> b!1031981 (=> (not res!689693) (not e!582876))))

(declare-fun e!582872 () Bool)

(assert (=> b!1031981 (= res!689693 e!582872)))

(declare-fun res!689699 () Bool)

(assert (=> b!1031981 (=> res!689699 e!582872)))

(declare-fun e!582870 () Bool)

(assert (=> b!1031981 (= res!689699 (not e!582870))))

(declare-fun res!689695 () Bool)

(assert (=> b!1031981 (=> (not res!689695) (not e!582870))))

(assert (=> b!1031981 (= res!689695 (bvslt #b00000000000000000000000000000000 (size!31707 lt!455075)))))

(declare-fun b!1031982 () Bool)

(declare-fun lt!455247 () Unit!33674)

(assert (=> b!1031982 (= e!582878 lt!455247)))

(declare-fun lt!455246 () ListLongMap!13707)

(assert (=> b!1031982 (= lt!455246 (getCurrentListMapNoExtraKeys!3565 lt!455075 lt!455078 (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun lt!455237 () (_ BitVec 64))

(assert (=> b!1031982 (= lt!455237 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!455243 () (_ BitVec 64))

(assert (=> b!1031982 (= lt!455243 (select (arr!31189 lt!455075) #b00000000000000000000000000000000))))

(declare-fun lt!455236 () Unit!33674)

(assert (=> b!1031982 (= lt!455236 (addStillContains!624 lt!455246 lt!455237 (zeroValue!5970 thiss!1427) lt!455243))))

(assert (=> b!1031982 (contains!6004 (+!3125 lt!455246 (tuple2!15603 lt!455237 (zeroValue!5970 thiss!1427))) lt!455243)))

(declare-fun lt!455241 () Unit!33674)

(assert (=> b!1031982 (= lt!455241 lt!455236)))

(declare-fun lt!455248 () ListLongMap!13707)

(assert (=> b!1031982 (= lt!455248 (getCurrentListMapNoExtraKeys!3565 lt!455075 lt!455078 (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun lt!455232 () (_ BitVec 64))

(assert (=> b!1031982 (= lt!455232 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!455253 () (_ BitVec 64))

(assert (=> b!1031982 (= lt!455253 (select (arr!31189 lt!455075) #b00000000000000000000000000000000))))

(declare-fun lt!455235 () Unit!33674)

(assert (=> b!1031982 (= lt!455235 (addApplyDifferent!480 lt!455248 lt!455232 (minValue!5970 thiss!1427) lt!455253))))

(assert (=> b!1031982 (= (apply!914 (+!3125 lt!455248 (tuple2!15603 lt!455232 (minValue!5970 thiss!1427))) lt!455253) (apply!914 lt!455248 lt!455253))))

(declare-fun lt!455250 () Unit!33674)

(assert (=> b!1031982 (= lt!455250 lt!455235)))

(declare-fun lt!455249 () ListLongMap!13707)

(assert (=> b!1031982 (= lt!455249 (getCurrentListMapNoExtraKeys!3565 lt!455075 lt!455078 (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun lt!455252 () (_ BitVec 64))

(assert (=> b!1031982 (= lt!455252 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!455242 () (_ BitVec 64))

(assert (=> b!1031982 (= lt!455242 (select (arr!31189 lt!455075) #b00000000000000000000000000000000))))

(declare-fun lt!455251 () Unit!33674)

(assert (=> b!1031982 (= lt!455251 (addApplyDifferent!480 lt!455249 lt!455252 (zeroValue!5970 thiss!1427) lt!455242))))

(assert (=> b!1031982 (= (apply!914 (+!3125 lt!455249 (tuple2!15603 lt!455252 (zeroValue!5970 thiss!1427))) lt!455242) (apply!914 lt!455249 lt!455242))))

(declare-fun lt!455239 () Unit!33674)

(assert (=> b!1031982 (= lt!455239 lt!455251)))

(declare-fun lt!455233 () ListLongMap!13707)

(assert (=> b!1031982 (= lt!455233 (getCurrentListMapNoExtraKeys!3565 lt!455075 lt!455078 (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun lt!455244 () (_ BitVec 64))

(assert (=> b!1031982 (= lt!455244 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!455240 () (_ BitVec 64))

(assert (=> b!1031982 (= lt!455240 (select (arr!31189 lt!455075) #b00000000000000000000000000000000))))

(assert (=> b!1031982 (= lt!455247 (addApplyDifferent!480 lt!455233 lt!455244 (minValue!5970 thiss!1427) lt!455240))))

(assert (=> b!1031982 (= (apply!914 (+!3125 lt!455233 (tuple2!15603 lt!455244 (minValue!5970 thiss!1427))) lt!455240) (apply!914 lt!455233 lt!455240))))

(declare-fun b!1031983 () Bool)

(declare-fun e!582879 () Bool)

(assert (=> b!1031983 (= e!582879 (= (apply!914 lt!455234 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5970 thiss!1427)))))

(declare-fun bm!43646 () Bool)

(declare-fun call!43655 () ListLongMap!13707)

(declare-fun call!43653 () ListLongMap!13707)

(assert (=> bm!43646 (= call!43655 call!43653)))

(declare-fun bm!43647 () Bool)

(assert (=> bm!43647 (= call!43653 (getCurrentListMapNoExtraKeys!3565 lt!455075 lt!455078 (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun b!1031984 () Bool)

(declare-fun res!689691 () Bool)

(assert (=> b!1031984 (=> (not res!689691) (not e!582876))))

(assert (=> b!1031984 (= res!689691 e!582881)))

(declare-fun c!104632 () Bool)

(assert (=> b!1031984 (= c!104632 (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1031985 () Bool)

(assert (=> b!1031985 (= e!582882 (validKeyInArray!0 (select (arr!31189 lt!455075) #b00000000000000000000000000000000)))))

(declare-fun b!1031986 () Bool)

(assert (=> b!1031986 (= e!582880 e!582877)))

(declare-fun c!104633 () Bool)

(assert (=> b!1031986 (= c!104633 (and (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1031987 () Bool)

(declare-fun e!582871 () Bool)

(assert (=> b!1031987 (= e!582881 e!582871)))

(declare-fun res!689694 () Bool)

(assert (=> b!1031987 (= res!689694 call!43649)))

(assert (=> b!1031987 (=> (not res!689694) (not e!582871))))

(declare-fun bm!43648 () Bool)

(assert (=> bm!43648 (= call!43649 (contains!6004 lt!455234 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031988 () Bool)

(declare-fun e!582873 () Bool)

(assert (=> b!1031988 (= e!582873 (= (apply!914 lt!455234 (select (arr!31189 lt!455075) #b00000000000000000000000000000000)) (get!16401 (select (arr!31190 lt!455078) #b00000000000000000000000000000000) (dynLambda!1986 (defaultEntry!6134 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1031988 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31708 lt!455078)))))

(assert (=> b!1031988 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31707 lt!455075)))))

(declare-fun bm!43649 () Bool)

(declare-fun call!43654 () Bool)

(assert (=> bm!43649 (= call!43654 (contains!6004 lt!455234 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031989 () Bool)

(declare-fun call!43650 () ListLongMap!13707)

(assert (=> b!1031989 (= e!582874 call!43650)))

(declare-fun b!1031990 () Bool)

(declare-fun call!43651 () ListLongMap!13707)

(assert (=> b!1031990 (= e!582880 (+!3125 call!43651 (tuple2!15603 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5970 thiss!1427))))))

(declare-fun b!1031991 () Bool)

(declare-fun Unit!33681 () Unit!33674)

(assert (=> b!1031991 (= e!582878 Unit!33681)))

(declare-fun b!1031992 () Bool)

(declare-fun e!582875 () Bool)

(assert (=> b!1031992 (= e!582875 e!582879)))

(declare-fun res!689698 () Bool)

(assert (=> b!1031992 (= res!689698 call!43654)))

(assert (=> b!1031992 (=> (not res!689698) (not e!582879))))

(declare-fun bm!43650 () Bool)

(assert (=> bm!43650 (= call!43650 call!43655)))

(declare-fun b!1031993 () Bool)

(assert (=> b!1031993 (= e!582875 (not call!43654))))

(declare-fun b!1031994 () Bool)

(declare-fun c!104631 () Bool)

(assert (=> b!1031994 (= c!104631 (and (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1031994 (= e!582877 e!582874)))

(declare-fun bm!43651 () Bool)

(assert (=> bm!43651 (= call!43652 call!43651)))

(declare-fun bm!43652 () Bool)

(assert (=> bm!43652 (= call!43651 (+!3125 (ite c!104635 call!43653 (ite c!104633 call!43655 call!43650)) (ite (or c!104635 c!104633) (tuple2!15603 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5970 thiss!1427)) (tuple2!15603 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5970 thiss!1427)))))))

(declare-fun b!1031995 () Bool)

(assert (=> b!1031995 (= e!582871 (= (apply!914 lt!455234 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5970 thiss!1427)))))

(declare-fun b!1031996 () Bool)

(assert (=> b!1031996 (= e!582870 (validKeyInArray!0 (select (arr!31189 lt!455075) #b00000000000000000000000000000000)))))

(declare-fun b!1031997 () Bool)

(assert (=> b!1031997 (= e!582872 e!582873)))

(declare-fun res!689692 () Bool)

(assert (=> b!1031997 (=> (not res!689692) (not e!582873))))

(assert (=> b!1031997 (= res!689692 (contains!6004 lt!455234 (select (arr!31189 lt!455075) #b00000000000000000000000000000000)))))

(assert (=> b!1031997 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31707 lt!455075)))))

(declare-fun b!1031998 () Bool)

(assert (=> b!1031998 (= e!582876 e!582875)))

(declare-fun c!104636 () Bool)

(assert (=> b!1031998 (= c!104636 (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!124079 c!104635) b!1031990))

(assert (= (and d!124079 (not c!104635)) b!1031986))

(assert (= (and b!1031986 c!104633) b!1031979))

(assert (= (and b!1031986 (not c!104633)) b!1031994))

(assert (= (and b!1031994 c!104631) b!1031980))

(assert (= (and b!1031994 (not c!104631)) b!1031989))

(assert (= (or b!1031980 b!1031989) bm!43650))

(assert (= (or b!1031979 bm!43650) bm!43646))

(assert (= (or b!1031979 b!1031980) bm!43651))

(assert (= (or b!1031990 bm!43646) bm!43647))

(assert (= (or b!1031990 bm!43651) bm!43652))

(assert (= (and d!124079 res!689697) b!1031985))

(assert (= (and d!124079 c!104634) b!1031982))

(assert (= (and d!124079 (not c!104634)) b!1031991))

(assert (= (and d!124079 res!689696) b!1031981))

(assert (= (and b!1031981 res!689695) b!1031996))

(assert (= (and b!1031981 (not res!689699)) b!1031997))

(assert (= (and b!1031997 res!689692) b!1031988))

(assert (= (and b!1031981 res!689693) b!1031984))

(assert (= (and b!1031984 c!104632) b!1031987))

(assert (= (and b!1031984 (not c!104632)) b!1031978))

(assert (= (and b!1031987 res!689694) b!1031995))

(assert (= (or b!1031987 b!1031978) bm!43648))

(assert (= (and b!1031984 res!689691) b!1031998))

(assert (= (and b!1031998 c!104636) b!1031992))

(assert (= (and b!1031998 (not c!104636)) b!1031993))

(assert (= (and b!1031992 res!689698) b!1031983))

(assert (= (or b!1031992 b!1031993) bm!43649))

(declare-fun b_lambda!15967 () Bool)

(assert (=> (not b_lambda!15967) (not b!1031988)))

(assert (=> b!1031988 t!30928))

(declare-fun b_and!33019 () Bool)

(assert (= b_and!33017 (and (=> t!30928 result!14189) b_and!33019)))

(assert (=> b!1031996 m!952033))

(assert (=> b!1031996 m!952033))

(assert (=> b!1031996 m!952035))

(declare-fun m!952109 () Bool)

(assert (=> b!1031995 m!952109))

(declare-fun m!952111 () Bool)

(assert (=> b!1031990 m!952111))

(declare-fun m!952113 () Bool)

(assert (=> bm!43647 m!952113))

(declare-fun m!952115 () Bool)

(assert (=> bm!43652 m!952115))

(declare-fun m!952117 () Bool)

(assert (=> b!1031983 m!952117))

(declare-fun m!952119 () Bool)

(assert (=> b!1031982 m!952119))

(declare-fun m!952121 () Bool)

(assert (=> b!1031982 m!952121))

(declare-fun m!952123 () Bool)

(assert (=> b!1031982 m!952123))

(declare-fun m!952125 () Bool)

(assert (=> b!1031982 m!952125))

(assert (=> b!1031982 m!952113))

(declare-fun m!952127 () Bool)

(assert (=> b!1031982 m!952127))

(assert (=> b!1031982 m!952033))

(assert (=> b!1031982 m!952125))

(declare-fun m!952129 () Bool)

(assert (=> b!1031982 m!952129))

(declare-fun m!952131 () Bool)

(assert (=> b!1031982 m!952131))

(declare-fun m!952133 () Bool)

(assert (=> b!1031982 m!952133))

(declare-fun m!952135 () Bool)

(assert (=> b!1031982 m!952135))

(declare-fun m!952137 () Bool)

(assert (=> b!1031982 m!952137))

(declare-fun m!952139 () Bool)

(assert (=> b!1031982 m!952139))

(declare-fun m!952141 () Bool)

(assert (=> b!1031982 m!952141))

(assert (=> b!1031982 m!952135))

(assert (=> b!1031982 m!952139))

(declare-fun m!952143 () Bool)

(assert (=> b!1031982 m!952143))

(assert (=> b!1031982 m!952131))

(declare-fun m!952145 () Bool)

(assert (=> b!1031982 m!952145))

(declare-fun m!952147 () Bool)

(assert (=> b!1031982 m!952147))

(declare-fun m!952149 () Bool)

(assert (=> bm!43649 m!952149))

(declare-fun m!952151 () Bool)

(assert (=> bm!43648 m!952151))

(assert (=> b!1031997 m!952033))

(assert (=> b!1031997 m!952033))

(declare-fun m!952153 () Bool)

(assert (=> b!1031997 m!952153))

(assert (=> b!1031985 m!952033))

(assert (=> b!1031985 m!952033))

(assert (=> b!1031985 m!952035))

(assert (=> d!124079 m!952007))

(assert (=> b!1031988 m!951885))

(assert (=> b!1031988 m!952033))

(declare-fun m!952155 () Bool)

(assert (=> b!1031988 m!952155))

(assert (=> b!1031988 m!951885))

(declare-fun m!952157 () Bool)

(assert (=> b!1031988 m!952157))

(assert (=> b!1031988 m!952033))

(declare-fun m!952159 () Bool)

(assert (=> b!1031988 m!952159))

(assert (=> b!1031988 m!952155))

(assert (=> b!1031764 d!124079))

(declare-fun bm!43653 () Bool)

(declare-fun call!43656 () Bool)

(declare-fun c!104637 () Bool)

(assert (=> bm!43653 (= call!43656 (arrayNoDuplicates!0 lt!455075 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104637 (Cons!21821 (select (arr!31189 lt!455075) #b00000000000000000000000000000000) Nil!21822) Nil!21822)))))

(declare-fun b!1031999 () Bool)

(declare-fun e!582886 () Bool)

(assert (=> b!1031999 (= e!582886 call!43656)))

(declare-fun b!1032000 () Bool)

(declare-fun e!582884 () Bool)

(assert (=> b!1032000 (= e!582884 e!582886)))

(assert (=> b!1032000 (= c!104637 (validKeyInArray!0 (select (arr!31189 lt!455075) #b00000000000000000000000000000000)))))

(declare-fun b!1032001 () Bool)

(declare-fun e!582885 () Bool)

(assert (=> b!1032001 (= e!582885 e!582884)))

(declare-fun res!689702 () Bool)

(assert (=> b!1032001 (=> (not res!689702) (not e!582884))))

(declare-fun e!582883 () Bool)

(assert (=> b!1032001 (= res!689702 (not e!582883))))

(declare-fun res!689700 () Bool)

(assert (=> b!1032001 (=> (not res!689700) (not e!582883))))

(assert (=> b!1032001 (= res!689700 (validKeyInArray!0 (select (arr!31189 lt!455075) #b00000000000000000000000000000000)))))

(declare-fun b!1032002 () Bool)

(assert (=> b!1032002 (= e!582886 call!43656)))

(declare-fun b!1032003 () Bool)

(assert (=> b!1032003 (= e!582883 (contains!6003 Nil!21822 (select (arr!31189 lt!455075) #b00000000000000000000000000000000)))))

(declare-fun d!124081 () Bool)

(declare-fun res!689701 () Bool)

(assert (=> d!124081 (=> res!689701 e!582885)))

(assert (=> d!124081 (= res!689701 (bvsge #b00000000000000000000000000000000 (size!31707 lt!455075)))))

(assert (=> d!124081 (= (arrayNoDuplicates!0 lt!455075 #b00000000000000000000000000000000 Nil!21822) e!582885)))

(assert (= (and d!124081 (not res!689701)) b!1032001))

(assert (= (and b!1032001 res!689700) b!1032003))

(assert (= (and b!1032001 res!689702) b!1032000))

(assert (= (and b!1032000 c!104637) b!1032002))

(assert (= (and b!1032000 (not c!104637)) b!1031999))

(assert (= (or b!1032002 b!1031999) bm!43653))

(assert (=> bm!43653 m!952033))

(declare-fun m!952161 () Bool)

(assert (=> bm!43653 m!952161))

(assert (=> b!1032000 m!952033))

(assert (=> b!1032000 m!952033))

(assert (=> b!1032000 m!952035))

(assert (=> b!1032001 m!952033))

(assert (=> b!1032001 m!952033))

(assert (=> b!1032001 m!952035))

(assert (=> b!1032003 m!952033))

(assert (=> b!1032003 m!952033))

(declare-fun m!952163 () Bool)

(assert (=> b!1032003 m!952163))

(assert (=> b!1031764 d!124081))

(declare-fun d!124083 () Bool)

(declare-fun lt!455256 () ListLongMap!13707)

(assert (=> d!124083 (not (contains!6004 lt!455256 key!909))))

(declare-fun removeStrictlySorted!54 (List!21826 (_ BitVec 64)) List!21826)

(assert (=> d!124083 (= lt!455256 (ListLongMap!13708 (removeStrictlySorted!54 (toList!6869 (getCurrentListMap!3915 (_keys!11343 thiss!1427) (_values!6157 thiss!1427) (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427))) key!909)))))

(assert (=> d!124083 (= (-!492 (getCurrentListMap!3915 (_keys!11343 thiss!1427) (_values!6157 thiss!1427) (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)) key!909) lt!455256)))

(declare-fun bs!30140 () Bool)

(assert (= bs!30140 d!124083))

(declare-fun m!952165 () Bool)

(assert (=> bs!30140 m!952165))

(declare-fun m!952167 () Bool)

(assert (=> bs!30140 m!952167))

(assert (=> b!1031764 d!124083))

(declare-fun d!124085 () Bool)

(declare-fun e!582889 () Bool)

(assert (=> d!124085 e!582889))

(declare-fun res!689705 () Bool)

(assert (=> d!124085 (=> (not res!689705) (not e!582889))))

(assert (=> d!124085 (= res!689705 (and (bvsge (index!40952 lt!455077) #b00000000000000000000000000000000) (bvslt (index!40952 lt!455077) (size!31707 (_keys!11343 thiss!1427)))))))

(declare-fun lt!455259 () Unit!33674)

(declare-fun choose!25 (array!64785 (_ BitVec 32) (_ BitVec 32)) Unit!33674)

(assert (=> d!124085 (= lt!455259 (choose!25 (_keys!11343 thiss!1427) (index!40952 lt!455077) (mask!29972 thiss!1427)))))

(assert (=> d!124085 (validMask!0 (mask!29972 thiss!1427))))

(assert (=> d!124085 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11343 thiss!1427) (index!40952 lt!455077) (mask!29972 thiss!1427)) lt!455259)))

(declare-fun b!1032006 () Bool)

(assert (=> b!1032006 (= e!582889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64786 (store (arr!31189 (_keys!11343 thiss!1427)) (index!40952 lt!455077) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31707 (_keys!11343 thiss!1427))) (mask!29972 thiss!1427)))))

(assert (= (and d!124085 res!689705) b!1032006))

(declare-fun m!952169 () Bool)

(assert (=> d!124085 m!952169))

(assert (=> d!124085 m!952007))

(assert (=> b!1032006 m!951857))

(declare-fun m!952171 () Bool)

(assert (=> b!1032006 m!952171))

(assert (=> b!1031764 d!124085))

(declare-fun d!124087 () Bool)

(declare-fun res!689710 () Bool)

(declare-fun e!582894 () Bool)

(assert (=> d!124087 (=> res!689710 e!582894)))

(assert (=> d!124087 (= res!689710 (= (select (arr!31189 lt!455075) #b00000000000000000000000000000000) key!909))))

(assert (=> d!124087 (= (arrayContainsKey!0 lt!455075 key!909 #b00000000000000000000000000000000) e!582894)))

(declare-fun b!1032011 () Bool)

(declare-fun e!582895 () Bool)

(assert (=> b!1032011 (= e!582894 e!582895)))

(declare-fun res!689711 () Bool)

(assert (=> b!1032011 (=> (not res!689711) (not e!582895))))

(assert (=> b!1032011 (= res!689711 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31707 lt!455075)))))

(declare-fun b!1032012 () Bool)

(assert (=> b!1032012 (= e!582895 (arrayContainsKey!0 lt!455075 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!124087 (not res!689710)) b!1032011))

(assert (= (and b!1032011 res!689711) b!1032012))

(assert (=> d!124087 m!952033))

(declare-fun m!952173 () Bool)

(assert (=> b!1032012 m!952173))

(assert (=> b!1031764 d!124087))

(declare-fun b!1032024 () Bool)

(declare-fun e!582900 () Bool)

(assert (=> b!1032024 (= e!582900 (= (arrayCountValidKeys!0 (array!64786 (store (arr!31189 (_keys!11343 thiss!1427)) (index!40952 lt!455077) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31707 (_keys!11343 thiss!1427))) #b00000000000000000000000000000000 (size!31707 (_keys!11343 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11343 thiss!1427) #b00000000000000000000000000000000 (size!31707 (_keys!11343 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1032021 () Bool)

(declare-fun res!689722 () Bool)

(declare-fun e!582901 () Bool)

(assert (=> b!1032021 (=> (not res!689722) (not e!582901))))

(assert (=> b!1032021 (= res!689722 (validKeyInArray!0 (select (arr!31189 (_keys!11343 thiss!1427)) (index!40952 lt!455077))))))

(declare-fun b!1032023 () Bool)

(assert (=> b!1032023 (= e!582901 (bvslt (size!31707 (_keys!11343 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1032022 () Bool)

(declare-fun res!689720 () Bool)

(assert (=> b!1032022 (=> (not res!689720) (not e!582901))))

(assert (=> b!1032022 (= res!689720 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!124089 () Bool)

(assert (=> d!124089 e!582900))

(declare-fun res!689723 () Bool)

(assert (=> d!124089 (=> (not res!689723) (not e!582900))))

(assert (=> d!124089 (= res!689723 (and (bvsge (index!40952 lt!455077) #b00000000000000000000000000000000) (bvslt (index!40952 lt!455077) (size!31707 (_keys!11343 thiss!1427)))))))

(declare-fun lt!455262 () Unit!33674)

(declare-fun choose!82 (array!64785 (_ BitVec 32) (_ BitVec 64)) Unit!33674)

(assert (=> d!124089 (= lt!455262 (choose!82 (_keys!11343 thiss!1427) (index!40952 lt!455077) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124089 e!582901))

(declare-fun res!689721 () Bool)

(assert (=> d!124089 (=> (not res!689721) (not e!582901))))

(assert (=> d!124089 (= res!689721 (and (bvsge (index!40952 lt!455077) #b00000000000000000000000000000000) (bvslt (index!40952 lt!455077) (size!31707 (_keys!11343 thiss!1427)))))))

(assert (=> d!124089 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11343 thiss!1427) (index!40952 lt!455077) #b1000000000000000000000000000000000000000000000000000000000000000) lt!455262)))

(assert (= (and d!124089 res!689721) b!1032021))

(assert (= (and b!1032021 res!689722) b!1032022))

(assert (= (and b!1032022 res!689720) b!1032023))

(assert (= (and d!124089 res!689723) b!1032024))

(assert (=> b!1032024 m!951857))

(declare-fun m!952175 () Bool)

(assert (=> b!1032024 m!952175))

(assert (=> b!1032024 m!951871))

(declare-fun m!952177 () Bool)

(assert (=> b!1032021 m!952177))

(assert (=> b!1032021 m!952177))

(declare-fun m!952179 () Bool)

(assert (=> b!1032021 m!952179))

(declare-fun m!952181 () Bool)

(assert (=> b!1032022 m!952181))

(declare-fun m!952183 () Bool)

(assert (=> d!124089 m!952183))

(assert (=> b!1031764 d!124089))

(declare-fun d!124091 () Bool)

(declare-fun e!582904 () Bool)

(assert (=> d!124091 e!582904))

(declare-fun res!689726 () Bool)

(assert (=> d!124091 (=> (not res!689726) (not e!582904))))

(assert (=> d!124091 (= res!689726 (and (bvsge (index!40952 lt!455077) #b00000000000000000000000000000000) (bvslt (index!40952 lt!455077) (size!31707 (_keys!11343 thiss!1427)))))))

(declare-fun lt!455265 () Unit!33674)

(declare-fun choose!1699 (array!64785 array!64787 (_ BitVec 32) (_ BitVec 32) V!37323 V!37323 (_ BitVec 32) (_ BitVec 64) Int) Unit!33674)

(assert (=> d!124091 (= lt!455265 (choose!1699 (_keys!11343 thiss!1427) (_values!6157 thiss!1427) (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) (index!40952 lt!455077) key!909 (defaultEntry!6134 thiss!1427)))))

(assert (=> d!124091 (validMask!0 (mask!29972 thiss!1427))))

(assert (=> d!124091 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!18 (_keys!11343 thiss!1427) (_values!6157 thiss!1427) (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) (index!40952 lt!455077) key!909 (defaultEntry!6134 thiss!1427)) lt!455265)))

(declare-fun b!1032027 () Bool)

(assert (=> b!1032027 (= e!582904 (= (-!492 (getCurrentListMap!3915 (_keys!11343 thiss!1427) (_values!6157 thiss!1427) (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)) key!909) (getCurrentListMap!3915 (array!64786 (store (arr!31189 (_keys!11343 thiss!1427)) (index!40952 lt!455077) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31707 (_keys!11343 thiss!1427))) (array!64788 (store (arr!31190 (_values!6157 thiss!1427)) (index!40952 lt!455077) (ValueCellFull!11465 (dynLambda!1986 (defaultEntry!6134 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31708 (_values!6157 thiss!1427))) (mask!29972 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427))))))

(assert (=> b!1032027 (bvslt (index!40952 lt!455077) (size!31708 (_values!6157 thiss!1427)))))

(assert (= (and d!124091 res!689726) b!1032027))

(declare-fun b_lambda!15969 () Bool)

(assert (=> (not b_lambda!15969) (not b!1032027)))

(assert (=> b!1032027 t!30928))

(declare-fun b_and!33021 () Bool)

(assert (= b_and!33019 (and (=> t!30928 result!14189) b_and!33021)))

(declare-fun m!952185 () Bool)

(assert (=> d!124091 m!952185))

(assert (=> d!124091 m!952007))

(assert (=> b!1032027 m!951883))

(assert (=> b!1032027 m!951877))

(assert (=> b!1032027 m!951879))

(assert (=> b!1032027 m!951885))

(assert (=> b!1032027 m!951857))

(declare-fun m!952187 () Bool)

(assert (=> b!1032027 m!952187))

(assert (=> b!1032027 m!951877))

(assert (=> b!1031764 d!124091))

(declare-fun b!1032028 () Bool)

(declare-fun e!582906 () (_ BitVec 32))

(declare-fun call!43657 () (_ BitVec 32))

(assert (=> b!1032028 (= e!582906 call!43657)))

(declare-fun d!124093 () Bool)

(declare-fun lt!455266 () (_ BitVec 32))

(assert (=> d!124093 (and (bvsge lt!455266 #b00000000000000000000000000000000) (bvsle lt!455266 (bvsub (size!31707 (_keys!11343 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!582905 () (_ BitVec 32))

(assert (=> d!124093 (= lt!455266 e!582905)))

(declare-fun c!104639 () Bool)

(assert (=> d!124093 (= c!104639 (bvsge #b00000000000000000000000000000000 (size!31707 (_keys!11343 thiss!1427))))))

(assert (=> d!124093 (and (bvsle #b00000000000000000000000000000000 (size!31707 (_keys!11343 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31707 (_keys!11343 thiss!1427)) (size!31707 (_keys!11343 thiss!1427))))))

(assert (=> d!124093 (= (arrayCountValidKeys!0 (_keys!11343 thiss!1427) #b00000000000000000000000000000000 (size!31707 (_keys!11343 thiss!1427))) lt!455266)))

(declare-fun bm!43654 () Bool)

(assert (=> bm!43654 (= call!43657 (arrayCountValidKeys!0 (_keys!11343 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31707 (_keys!11343 thiss!1427))))))

(declare-fun b!1032029 () Bool)

(assert (=> b!1032029 (= e!582905 e!582906)))

(declare-fun c!104638 () Bool)

(assert (=> b!1032029 (= c!104638 (validKeyInArray!0 (select (arr!31189 (_keys!11343 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032030 () Bool)

(assert (=> b!1032030 (= e!582905 #b00000000000000000000000000000000)))

(declare-fun b!1032031 () Bool)

(assert (=> b!1032031 (= e!582906 (bvadd #b00000000000000000000000000000001 call!43657))))

(assert (= (and d!124093 c!104639) b!1032030))

(assert (= (and d!124093 (not c!104639)) b!1032029))

(assert (= (and b!1032029 c!104638) b!1032031))

(assert (= (and b!1032029 (not c!104638)) b!1032028))

(assert (= (or b!1032031 b!1032028) bm!43654))

(declare-fun m!952189 () Bool)

(assert (=> bm!43654 m!952189))

(assert (=> b!1032029 m!952037))

(assert (=> b!1032029 m!952037))

(assert (=> b!1032029 m!952039))

(assert (=> b!1031764 d!124093))

(declare-fun d!124095 () Bool)

(assert (=> d!124095 (= (validMask!0 (mask!29972 (_2!7811 lt!455072))) (and (or (= (mask!29972 (_2!7811 lt!455072)) #b00000000000000000000000000000111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000000000000000000000001111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000000000000000000000011111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000000000000000000000111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000000000000000000001111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000000000000000000011111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000000000000000000111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000000000000000001111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000000000000000011111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000000000000000111111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000000000000001111111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000000000000011111111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000000000000111111111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000000000001111111111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000000000011111111111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000000000111111111111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000000001111111111111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000000011111111111111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000000111111111111111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000001111111111111111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000011111111111111111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000000111111111111111111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000001111111111111111111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000011111111111111111111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00000111111111111111111111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00001111111111111111111111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00011111111111111111111111111111) (= (mask!29972 (_2!7811 lt!455072)) #b00111111111111111111111111111111)) (bvsle (mask!29972 (_2!7811 lt!455072)) #b00111111111111111111111111111111)))))

(assert (=> b!1031764 d!124095))

(declare-fun mapNonEmpty!37965 () Bool)

(declare-fun mapRes!37965 () Bool)

(declare-fun tp!72934 () Bool)

(declare-fun e!582912 () Bool)

(assert (=> mapNonEmpty!37965 (= mapRes!37965 (and tp!72934 e!582912))))

(declare-fun mapKey!37965 () (_ BitVec 32))

(declare-fun mapValue!37965 () ValueCell!11465)

(declare-fun mapRest!37965 () (Array (_ BitVec 32) ValueCell!11465))

(assert (=> mapNonEmpty!37965 (= mapRest!37956 (store mapRest!37965 mapKey!37965 mapValue!37965))))

(declare-fun b!1032038 () Bool)

(assert (=> b!1032038 (= e!582912 tp_is_empty!24337)))

(declare-fun b!1032039 () Bool)

(declare-fun e!582911 () Bool)

(assert (=> b!1032039 (= e!582911 tp_is_empty!24337)))

(declare-fun condMapEmpty!37965 () Bool)

(declare-fun mapDefault!37965 () ValueCell!11465)

(assert (=> mapNonEmpty!37956 (= condMapEmpty!37965 (= mapRest!37956 ((as const (Array (_ BitVec 32) ValueCell!11465)) mapDefault!37965)))))

(assert (=> mapNonEmpty!37956 (= tp!72918 (and e!582911 mapRes!37965))))

(declare-fun mapIsEmpty!37965 () Bool)

(assert (=> mapIsEmpty!37965 mapRes!37965))

(assert (= (and mapNonEmpty!37956 condMapEmpty!37965) mapIsEmpty!37965))

(assert (= (and mapNonEmpty!37956 (not condMapEmpty!37965)) mapNonEmpty!37965))

(assert (= (and mapNonEmpty!37965 ((_ is ValueCellFull!11465) mapValue!37965)) b!1032038))

(assert (= (and mapNonEmpty!37956 ((_ is ValueCellFull!11465) mapDefault!37965)) b!1032039))

(declare-fun m!952191 () Bool)

(assert (=> mapNonEmpty!37965 m!952191))

(declare-fun b_lambda!15971 () Bool)

(assert (= b_lambda!15965 (or (and b!1031758 b_free!20617) b_lambda!15971)))

(declare-fun b_lambda!15973 () Bool)

(assert (= b_lambda!15969 (or (and b!1031758 b_free!20617) b_lambda!15973)))

(declare-fun b_lambda!15975 () Bool)

(assert (= b_lambda!15967 (or (and b!1031758 b_free!20617) b_lambda!15975)))

(check-sat (not bm!43653) (not mapNonEmpty!37965) (not d!124091) (not b!1032006) (not b!1031971) (not bm!43647) (not bm!43652) (not b!1032027) (not bm!43640) b_and!33021 (not b!1032021) (not d!124077) (not b!1031996) (not b!1032001) (not bm!43645) (not b_lambda!15973) (not b!1031889) (not bm!43654) (not d!124057) (not b!1031892) (not b_lambda!15963) (not b!1031959) (not b!1031952) (not b!1031865) (not d!124073) (not bm!43648) (not b!1031988) (not b!1031985) (not b!1031983) (not b!1031902) (not d!124079) (not bm!43620) (not b!1031982) tp_is_empty!24337 (not b!1031974) (not d!124089) (not b!1031966) (not b!1031965) (not b!1031970) (not b!1031954) (not b!1031977) (not bm!43617) (not b_lambda!15975) (not d!124071) (not b!1031990) (not bm!43623) (not bm!43639) (not b!1031995) (not b!1032029) (not bm!43644) (not b!1032022) (not b!1031877) (not b!1031880) (not b!1031854) (not bm!43641) (not d!124083) (not bm!43649) (not b_next!20617) (not b!1032012) (not b!1031863) (not d!124059) (not b!1031997) (not b!1031864) (not b_lambda!15971) (not b!1032024) (not d!124085) (not b!1032000) (not b!1031951) (not b!1032003) (not b!1031964) (not b!1031878) (not b!1031957))
(check-sat b_and!33021 (not b_next!20617))
