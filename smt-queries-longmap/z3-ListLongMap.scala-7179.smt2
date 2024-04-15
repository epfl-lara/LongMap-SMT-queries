; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91850 () Bool)

(assert start!91850)

(declare-fun b!1044774 () Bool)

(declare-fun b_free!21127 () Bool)

(declare-fun b_next!21127 () Bool)

(assert (=> b!1044774 (= b_free!21127 (not b_next!21127))))

(declare-fun tp!74633 () Bool)

(declare-fun b_and!33699 () Bool)

(assert (=> b!1044774 (= tp!74633 b_and!33699)))

(declare-fun b!1044770 () Bool)

(declare-fun e!592157 () Bool)

(declare-fun tp_is_empty!24847 () Bool)

(assert (=> b!1044770 (= e!592157 tp_is_empty!24847)))

(declare-fun b!1044771 () Bool)

(declare-fun e!592155 () Bool)

(declare-fun mapRes!38906 () Bool)

(assert (=> b!1044771 (= e!592155 (and e!592157 mapRes!38906))))

(declare-fun condMapEmpty!38906 () Bool)

(declare-datatypes ((V!38003 0))(
  ( (V!38004 (val!12474 Int)) )
))
(declare-datatypes ((ValueCell!11720 0))(
  ( (ValueCellFull!11720 (v!15067 V!38003)) (EmptyCell!11720) )
))
(declare-datatypes ((array!65805 0))(
  ( (array!65806 (arr!31650 (Array (_ BitVec 32) (_ BitVec 64))) (size!32187 (_ BitVec 32))) )
))
(declare-datatypes ((array!65807 0))(
  ( (array!65808 (arr!31651 (Array (_ BitVec 32) ValueCell!11720)) (size!32188 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6034 0))(
  ( (LongMapFixedSize!6035 (defaultEntry!6409 Int) (mask!30523 (_ BitVec 32)) (extraKeys!6137 (_ BitVec 32)) (zeroValue!6243 V!38003) (minValue!6243 V!38003) (_size!3072 (_ BitVec 32)) (_keys!11673 array!65805) (_values!6432 array!65807) (_vacant!3072 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6034)

(declare-fun mapDefault!38906 () ValueCell!11720)

(assert (=> b!1044771 (= condMapEmpty!38906 (= (arr!31651 (_values!6432 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11720)) mapDefault!38906)))))

(declare-fun res!695791 () Bool)

(declare-fun e!592159 () Bool)

(assert (=> start!91850 (=> (not res!695791) (not e!592159))))

(declare-fun valid!2260 (LongMapFixedSize!6034) Bool)

(assert (=> start!91850 (= res!695791 (valid!2260 thiss!1427))))

(assert (=> start!91850 e!592159))

(declare-fun e!592158 () Bool)

(assert (=> start!91850 e!592158))

(assert (=> start!91850 true))

(declare-fun b!1044772 () Bool)

(declare-fun e!592153 () Bool)

(declare-datatypes ((Unit!34015 0))(
  ( (Unit!34016) )
))
(declare-datatypes ((tuple2!15850 0))(
  ( (tuple2!15851 (_1!7936 Unit!34015) (_2!7936 LongMapFixedSize!6034)) )
))
(declare-fun lt!460906 () tuple2!15850)

(assert (=> b!1044772 (= e!592153 (or (not (= (size!32188 (_values!6432 (_2!7936 lt!460906))) (bvadd #b00000000000000000000000000000001 (mask!30523 (_2!7936 lt!460906))))) (not (= (size!32187 (_keys!11673 (_2!7936 lt!460906))) (size!32188 (_values!6432 (_2!7936 lt!460906))))) (bvsge (mask!30523 (_2!7936 lt!460906)) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!38906 () Bool)

(assert (=> mapIsEmpty!38906 mapRes!38906))

(declare-fun b!1044773 () Bool)

(declare-fun e!592154 () Bool)

(assert (=> b!1044773 (= e!592154 (not e!592153))))

(declare-fun res!695790 () Bool)

(assert (=> b!1044773 (=> res!695790 e!592153)))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15852 0))(
  ( (tuple2!15853 (_1!7937 (_ BitVec 64)) (_2!7937 V!38003)) )
))
(declare-datatypes ((List!22050 0))(
  ( (Nil!22047) (Cons!22046 (h!23254 tuple2!15852) (t!31293 List!22050)) )
))
(declare-datatypes ((ListLongMap!13857 0))(
  ( (ListLongMap!13858 (toList!6944 List!22050)) )
))
(declare-fun contains!6055 (ListLongMap!13857 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3910 (array!65805 array!65807 (_ BitVec 32) (_ BitVec 32) V!38003 V!38003 (_ BitVec 32) Int) ListLongMap!13857)

(assert (=> b!1044773 (= res!695790 (not (contains!6055 (getCurrentListMap!3910 (_keys!11673 (_2!7936 lt!460906)) (_values!6432 (_2!7936 lt!460906)) (mask!30523 (_2!7936 lt!460906)) (extraKeys!6137 (_2!7936 lt!460906)) (zeroValue!6243 (_2!7936 lt!460906)) (minValue!6243 (_2!7936 lt!460906)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7936 lt!460906))) key!909)))))

(declare-fun lt!460900 () array!65805)

(declare-fun lt!460901 () array!65807)

(declare-fun Unit!34017 () Unit!34015)

(declare-fun Unit!34018 () Unit!34015)

(assert (=> b!1044773 (= lt!460906 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3072 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15851 Unit!34017 (LongMapFixedSize!6035 (defaultEntry!6409 thiss!1427) (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) (bvsub (_size!3072 thiss!1427) #b00000000000000000000000000000001) lt!460900 lt!460901 (bvadd #b00000000000000000000000000000001 (_vacant!3072 thiss!1427)))) (tuple2!15851 Unit!34018 (LongMapFixedSize!6035 (defaultEntry!6409 thiss!1427) (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) (bvsub (_size!3072 thiss!1427) #b00000000000000000000000000000001) lt!460900 lt!460901 (_vacant!3072 thiss!1427)))))))

(declare-fun -!536 (ListLongMap!13857 (_ BitVec 64)) ListLongMap!13857)

(assert (=> b!1044773 (= (-!536 (getCurrentListMap!3910 (_keys!11673 thiss!1427) (_values!6432 thiss!1427) (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)) key!909) (getCurrentListMap!3910 lt!460900 lt!460901 (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9845 0))(
  ( (MissingZero!9845 (index!41751 (_ BitVec 32))) (Found!9845 (index!41752 (_ BitVec 32))) (Intermediate!9845 (undefined!10657 Bool) (index!41753 (_ BitVec 32)) (x!93320 (_ BitVec 32))) (Undefined!9845) (MissingVacant!9845 (index!41754 (_ BitVec 32))) )
))
(declare-fun lt!460907 () SeekEntryResult!9845)

(declare-fun dynLambda!1997 (Int (_ BitVec 64)) V!38003)

(assert (=> b!1044773 (= lt!460901 (array!65808 (store (arr!31651 (_values!6432 thiss!1427)) (index!41752 lt!460907) (ValueCellFull!11720 (dynLambda!1997 (defaultEntry!6409 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32188 (_values!6432 thiss!1427))))))

(declare-fun lt!460904 () Unit!34015)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!58 (array!65805 array!65807 (_ BitVec 32) (_ BitVec 32) V!38003 V!38003 (_ BitVec 32) (_ BitVec 64) Int) Unit!34015)

(assert (=> b!1044773 (= lt!460904 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!58 (_keys!11673 thiss!1427) (_values!6432 thiss!1427) (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) (index!41752 lt!460907) key!909 (defaultEntry!6409 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1044773 (not (arrayContainsKey!0 lt!460900 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!460903 () Unit!34015)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65805 (_ BitVec 32) (_ BitVec 64)) Unit!34015)

(assert (=> b!1044773 (= lt!460903 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11673 thiss!1427) (index!41752 lt!460907) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65805 (_ BitVec 32)) Bool)

(assert (=> b!1044773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460900 (mask!30523 thiss!1427))))

(declare-fun lt!460905 () Unit!34015)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65805 (_ BitVec 32) (_ BitVec 32)) Unit!34015)

(assert (=> b!1044773 (= lt!460905 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11673 thiss!1427) (index!41752 lt!460907) (mask!30523 thiss!1427)))))

(declare-datatypes ((List!22051 0))(
  ( (Nil!22048) (Cons!22047 (h!23255 (_ BitVec 64)) (t!31294 List!22051)) )
))
(declare-fun arrayNoDuplicates!0 (array!65805 (_ BitVec 32) List!22051) Bool)

(assert (=> b!1044773 (arrayNoDuplicates!0 lt!460900 #b00000000000000000000000000000000 Nil!22048)))

(declare-fun lt!460902 () Unit!34015)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65805 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22051) Unit!34015)

(assert (=> b!1044773 (= lt!460902 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11673 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41752 lt!460907) #b00000000000000000000000000000000 Nil!22048))))

(declare-fun arrayCountValidKeys!0 (array!65805 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1044773 (= (arrayCountValidKeys!0 lt!460900 #b00000000000000000000000000000000 (size!32187 (_keys!11673 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11673 thiss!1427) #b00000000000000000000000000000000 (size!32187 (_keys!11673 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1044773 (= lt!460900 (array!65806 (store (arr!31650 (_keys!11673 thiss!1427)) (index!41752 lt!460907) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32187 (_keys!11673 thiss!1427))))))

(declare-fun lt!460908 () Unit!34015)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65805 (_ BitVec 32) (_ BitVec 64)) Unit!34015)

(assert (=> b!1044773 (= lt!460908 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11673 thiss!1427) (index!41752 lt!460907) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun array_inv!24459 (array!65805) Bool)

(declare-fun array_inv!24460 (array!65807) Bool)

(assert (=> b!1044774 (= e!592158 (and tp!74633 tp_is_empty!24847 (array_inv!24459 (_keys!11673 thiss!1427)) (array_inv!24460 (_values!6432 thiss!1427)) e!592155))))

(declare-fun b!1044775 () Bool)

(declare-fun e!592160 () Bool)

(assert (=> b!1044775 (= e!592160 tp_is_empty!24847)))

(declare-fun b!1044776 () Bool)

(declare-fun res!695788 () Bool)

(assert (=> b!1044776 (=> (not res!695788) (not e!592159))))

(assert (=> b!1044776 (= res!695788 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1044777 () Bool)

(assert (=> b!1044777 (= e!592159 e!592154)))

(declare-fun res!695792 () Bool)

(assert (=> b!1044777 (=> (not res!695792) (not e!592154))))

(get-info :version)

(assert (=> b!1044777 (= res!695792 ((_ is Found!9845) lt!460907))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65805 (_ BitVec 32)) SeekEntryResult!9845)

(assert (=> b!1044777 (= lt!460907 (seekEntry!0 key!909 (_keys!11673 thiss!1427) (mask!30523 thiss!1427)))))

(declare-fun b!1044778 () Bool)

(declare-fun res!695789 () Bool)

(assert (=> b!1044778 (=> res!695789 e!592153)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1044778 (= res!695789 (not (validMask!0 (mask!30523 (_2!7936 lt!460906)))))))

(declare-fun mapNonEmpty!38906 () Bool)

(declare-fun tp!74634 () Bool)

(assert (=> mapNonEmpty!38906 (= mapRes!38906 (and tp!74634 e!592160))))

(declare-fun mapValue!38906 () ValueCell!11720)

(declare-fun mapRest!38906 () (Array (_ BitVec 32) ValueCell!11720))

(declare-fun mapKey!38906 () (_ BitVec 32))

(assert (=> mapNonEmpty!38906 (= (arr!31651 (_values!6432 thiss!1427)) (store mapRest!38906 mapKey!38906 mapValue!38906))))

(assert (= (and start!91850 res!695791) b!1044776))

(assert (= (and b!1044776 res!695788) b!1044777))

(assert (= (and b!1044777 res!695792) b!1044773))

(assert (= (and b!1044773 (not res!695790)) b!1044778))

(assert (= (and b!1044778 (not res!695789)) b!1044772))

(assert (= (and b!1044771 condMapEmpty!38906) mapIsEmpty!38906))

(assert (= (and b!1044771 (not condMapEmpty!38906)) mapNonEmpty!38906))

(assert (= (and mapNonEmpty!38906 ((_ is ValueCellFull!11720) mapValue!38906)) b!1044775))

(assert (= (and b!1044771 ((_ is ValueCellFull!11720) mapDefault!38906)) b!1044770))

(assert (= b!1044774 b!1044771))

(assert (= start!91850 b!1044774))

(declare-fun b_lambda!16241 () Bool)

(assert (=> (not b_lambda!16241) (not b!1044773)))

(declare-fun t!31292 () Bool)

(declare-fun tb!7065 () Bool)

(assert (=> (and b!1044774 (= (defaultEntry!6409 thiss!1427) (defaultEntry!6409 thiss!1427)) t!31292) tb!7065))

(declare-fun result!14563 () Bool)

(assert (=> tb!7065 (= result!14563 tp_is_empty!24847)))

(assert (=> b!1044773 t!31292))

(declare-fun b_and!33701 () Bool)

(assert (= b_and!33699 (and (=> t!31292 result!14563) b_and!33701)))

(declare-fun m!963861 () Bool)

(assert (=> b!1044773 m!963861))

(declare-fun m!963863 () Bool)

(assert (=> b!1044773 m!963863))

(assert (=> b!1044773 m!963863))

(declare-fun m!963865 () Bool)

(assert (=> b!1044773 m!963865))

(declare-fun m!963867 () Bool)

(assert (=> b!1044773 m!963867))

(declare-fun m!963869 () Bool)

(assert (=> b!1044773 m!963869))

(declare-fun m!963871 () Bool)

(assert (=> b!1044773 m!963871))

(declare-fun m!963873 () Bool)

(assert (=> b!1044773 m!963873))

(assert (=> b!1044773 m!963871))

(declare-fun m!963875 () Bool)

(assert (=> b!1044773 m!963875))

(declare-fun m!963877 () Bool)

(assert (=> b!1044773 m!963877))

(declare-fun m!963879 () Bool)

(assert (=> b!1044773 m!963879))

(declare-fun m!963881 () Bool)

(assert (=> b!1044773 m!963881))

(declare-fun m!963883 () Bool)

(assert (=> b!1044773 m!963883))

(declare-fun m!963885 () Bool)

(assert (=> b!1044773 m!963885))

(declare-fun m!963887 () Bool)

(assert (=> b!1044773 m!963887))

(declare-fun m!963889 () Bool)

(assert (=> b!1044773 m!963889))

(declare-fun m!963891 () Bool)

(assert (=> b!1044773 m!963891))

(declare-fun m!963893 () Bool)

(assert (=> b!1044773 m!963893))

(declare-fun m!963895 () Bool)

(assert (=> b!1044773 m!963895))

(declare-fun m!963897 () Bool)

(assert (=> b!1044774 m!963897))

(declare-fun m!963899 () Bool)

(assert (=> b!1044774 m!963899))

(declare-fun m!963901 () Bool)

(assert (=> mapNonEmpty!38906 m!963901))

(declare-fun m!963903 () Bool)

(assert (=> b!1044777 m!963903))

(declare-fun m!963905 () Bool)

(assert (=> b!1044778 m!963905))

(declare-fun m!963907 () Bool)

(assert (=> start!91850 m!963907))

(check-sat (not mapNonEmpty!38906) (not b_next!21127) (not b!1044778) (not b!1044774) (not b_lambda!16241) (not start!91850) (not b!1044773) tp_is_empty!24847 (not b!1044777) b_and!33701)
(check-sat b_and!33701 (not b_next!21127))
(get-model)

(declare-fun b_lambda!16247 () Bool)

(assert (= b_lambda!16241 (or (and b!1044774 b_free!21127) b_lambda!16247)))

(check-sat (not mapNonEmpty!38906) (not b_lambda!16247) (not b_next!21127) (not b!1044778) (not b!1044774) (not start!91850) (not b!1044773) tp_is_empty!24847 (not b!1044777) b_and!33701)
(check-sat b_and!33701 (not b_next!21127))
(get-model)

(declare-fun d!126309 () Bool)

(declare-fun res!695829 () Bool)

(declare-fun e!592211 () Bool)

(assert (=> d!126309 (=> (not res!695829) (not e!592211))))

(declare-fun simpleValid!451 (LongMapFixedSize!6034) Bool)

(assert (=> d!126309 (= res!695829 (simpleValid!451 thiss!1427))))

(assert (=> d!126309 (= (valid!2260 thiss!1427) e!592211)))

(declare-fun b!1044845 () Bool)

(declare-fun res!695830 () Bool)

(assert (=> b!1044845 (=> (not res!695830) (not e!592211))))

(assert (=> b!1044845 (= res!695830 (= (arrayCountValidKeys!0 (_keys!11673 thiss!1427) #b00000000000000000000000000000000 (size!32187 (_keys!11673 thiss!1427))) (_size!3072 thiss!1427)))))

(declare-fun b!1044846 () Bool)

(declare-fun res!695831 () Bool)

(assert (=> b!1044846 (=> (not res!695831) (not e!592211))))

(assert (=> b!1044846 (= res!695831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11673 thiss!1427) (mask!30523 thiss!1427)))))

(declare-fun b!1044847 () Bool)

(assert (=> b!1044847 (= e!592211 (arrayNoDuplicates!0 (_keys!11673 thiss!1427) #b00000000000000000000000000000000 Nil!22048))))

(assert (= (and d!126309 res!695829) b!1044845))

(assert (= (and b!1044845 res!695830) b!1044846))

(assert (= (and b!1044846 res!695831) b!1044847))

(declare-fun m!964005 () Bool)

(assert (=> d!126309 m!964005))

(assert (=> b!1044845 m!963869))

(declare-fun m!964007 () Bool)

(assert (=> b!1044846 m!964007))

(declare-fun m!964009 () Bool)

(assert (=> b!1044847 m!964009))

(assert (=> start!91850 d!126309))

(declare-fun b!1044860 () Bool)

(declare-fun e!592220 () SeekEntryResult!9845)

(declare-fun lt!460974 () SeekEntryResult!9845)

(assert (=> b!1044860 (= e!592220 (ite ((_ is MissingVacant!9845) lt!460974) (MissingZero!9845 (index!41754 lt!460974)) lt!460974))))

(declare-fun lt!460973 () SeekEntryResult!9845)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65805 (_ BitVec 32)) SeekEntryResult!9845)

(assert (=> b!1044860 (= lt!460974 (seekKeyOrZeroReturnVacant!0 (x!93320 lt!460973) (index!41753 lt!460973) (index!41753 lt!460973) key!909 (_keys!11673 thiss!1427) (mask!30523 thiss!1427)))))

(declare-fun b!1044861 () Bool)

(declare-fun e!592219 () SeekEntryResult!9845)

(assert (=> b!1044861 (= e!592219 (Found!9845 (index!41753 lt!460973)))))

(declare-fun b!1044862 () Bool)

(declare-fun c!106164 () Bool)

(declare-fun lt!460972 () (_ BitVec 64))

(assert (=> b!1044862 (= c!106164 (= lt!460972 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1044862 (= e!592219 e!592220)))

(declare-fun b!1044863 () Bool)

(assert (=> b!1044863 (= e!592220 (MissingZero!9845 (index!41753 lt!460973)))))

(declare-fun b!1044864 () Bool)

(declare-fun e!592218 () SeekEntryResult!9845)

(assert (=> b!1044864 (= e!592218 e!592219)))

(assert (=> b!1044864 (= lt!460972 (select (arr!31650 (_keys!11673 thiss!1427)) (index!41753 lt!460973)))))

(declare-fun c!106162 () Bool)

(assert (=> b!1044864 (= c!106162 (= lt!460972 key!909))))

(declare-fun b!1044865 () Bool)

(assert (=> b!1044865 (= e!592218 Undefined!9845)))

(declare-fun d!126311 () Bool)

(declare-fun lt!460971 () SeekEntryResult!9845)

(assert (=> d!126311 (and (or ((_ is MissingVacant!9845) lt!460971) (not ((_ is Found!9845) lt!460971)) (and (bvsge (index!41752 lt!460971) #b00000000000000000000000000000000) (bvslt (index!41752 lt!460971) (size!32187 (_keys!11673 thiss!1427))))) (not ((_ is MissingVacant!9845) lt!460971)) (or (not ((_ is Found!9845) lt!460971)) (= (select (arr!31650 (_keys!11673 thiss!1427)) (index!41752 lt!460971)) key!909)))))

(assert (=> d!126311 (= lt!460971 e!592218)))

(declare-fun c!106163 () Bool)

(assert (=> d!126311 (= c!106163 (and ((_ is Intermediate!9845) lt!460973) (undefined!10657 lt!460973)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65805 (_ BitVec 32)) SeekEntryResult!9845)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126311 (= lt!460973 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30523 thiss!1427)) key!909 (_keys!11673 thiss!1427) (mask!30523 thiss!1427)))))

(assert (=> d!126311 (validMask!0 (mask!30523 thiss!1427))))

(assert (=> d!126311 (= (seekEntry!0 key!909 (_keys!11673 thiss!1427) (mask!30523 thiss!1427)) lt!460971)))

(assert (= (and d!126311 c!106163) b!1044865))

(assert (= (and d!126311 (not c!106163)) b!1044864))

(assert (= (and b!1044864 c!106162) b!1044861))

(assert (= (and b!1044864 (not c!106162)) b!1044862))

(assert (= (and b!1044862 c!106164) b!1044863))

(assert (= (and b!1044862 (not c!106164)) b!1044860))

(declare-fun m!964011 () Bool)

(assert (=> b!1044860 m!964011))

(declare-fun m!964013 () Bool)

(assert (=> b!1044864 m!964013))

(declare-fun m!964015 () Bool)

(assert (=> d!126311 m!964015))

(declare-fun m!964017 () Bool)

(assert (=> d!126311 m!964017))

(assert (=> d!126311 m!964017))

(declare-fun m!964019 () Bool)

(assert (=> d!126311 m!964019))

(declare-fun m!964021 () Bool)

(assert (=> d!126311 m!964021))

(assert (=> b!1044777 d!126311))

(declare-fun d!126313 () Bool)

(assert (=> d!126313 (= (validMask!0 (mask!30523 (_2!7936 lt!460906))) (and (or (= (mask!30523 (_2!7936 lt!460906)) #b00000000000000000000000000000111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000000000000000000000001111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000000000000000000000011111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000000000000000000000111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000000000000000000001111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000000000000000000011111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000000000000000000111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000000000000000001111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000000000000000011111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000000000000000111111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000000000000001111111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000000000000011111111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000000000000111111111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000000000001111111111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000000000011111111111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000000000111111111111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000000001111111111111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000000011111111111111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000000111111111111111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000001111111111111111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000011111111111111111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000000111111111111111111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000001111111111111111111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000011111111111111111111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00000111111111111111111111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00001111111111111111111111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00011111111111111111111111111111) (= (mask!30523 (_2!7936 lt!460906)) #b00111111111111111111111111111111)) (bvsle (mask!30523 (_2!7936 lt!460906)) #b00111111111111111111111111111111)))))

(assert (=> b!1044778 d!126313))

(declare-fun d!126315 () Bool)

(declare-fun e!592226 () Bool)

(assert (=> d!126315 e!592226))

(declare-fun res!695841 () Bool)

(assert (=> d!126315 (=> (not res!695841) (not e!592226))))

(assert (=> d!126315 (= res!695841 (and (bvsge (index!41752 lt!460907) #b00000000000000000000000000000000) (bvslt (index!41752 lt!460907) (size!32187 (_keys!11673 thiss!1427)))))))

(declare-fun lt!460977 () Unit!34015)

(declare-fun choose!82 (array!65805 (_ BitVec 32) (_ BitVec 64)) Unit!34015)

(assert (=> d!126315 (= lt!460977 (choose!82 (_keys!11673 thiss!1427) (index!41752 lt!460907) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!592225 () Bool)

(assert (=> d!126315 e!592225))

(declare-fun res!695842 () Bool)

(assert (=> d!126315 (=> (not res!695842) (not e!592225))))

(assert (=> d!126315 (= res!695842 (and (bvsge (index!41752 lt!460907) #b00000000000000000000000000000000) (bvslt (index!41752 lt!460907) (size!32187 (_keys!11673 thiss!1427)))))))

(assert (=> d!126315 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11673 thiss!1427) (index!41752 lt!460907) #b1000000000000000000000000000000000000000000000000000000000000000) lt!460977)))

(declare-fun b!1044876 () Bool)

(assert (=> b!1044876 (= e!592225 (bvslt (size!32187 (_keys!11673 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1044874 () Bool)

(declare-fun res!695843 () Bool)

(assert (=> b!1044874 (=> (not res!695843) (not e!592225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1044874 (= res!695843 (validKeyInArray!0 (select (arr!31650 (_keys!11673 thiss!1427)) (index!41752 lt!460907))))))

(declare-fun b!1044875 () Bool)

(declare-fun res!695840 () Bool)

(assert (=> b!1044875 (=> (not res!695840) (not e!592225))))

(assert (=> b!1044875 (= res!695840 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1044877 () Bool)

(assert (=> b!1044877 (= e!592226 (= (arrayCountValidKeys!0 (array!65806 (store (arr!31650 (_keys!11673 thiss!1427)) (index!41752 lt!460907) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32187 (_keys!11673 thiss!1427))) #b00000000000000000000000000000000 (size!32187 (_keys!11673 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11673 thiss!1427) #b00000000000000000000000000000000 (size!32187 (_keys!11673 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!126315 res!695842) b!1044874))

(assert (= (and b!1044874 res!695843) b!1044875))

(assert (= (and b!1044875 res!695840) b!1044876))

(assert (= (and d!126315 res!695841) b!1044877))

(declare-fun m!964023 () Bool)

(assert (=> d!126315 m!964023))

(declare-fun m!964025 () Bool)

(assert (=> b!1044874 m!964025))

(assert (=> b!1044874 m!964025))

(declare-fun m!964027 () Bool)

(assert (=> b!1044874 m!964027))

(declare-fun m!964029 () Bool)

(assert (=> b!1044875 m!964029))

(assert (=> b!1044877 m!963889))

(declare-fun m!964031 () Bool)

(assert (=> b!1044877 m!964031))

(assert (=> b!1044877 m!963869))

(assert (=> b!1044773 d!126315))

(declare-fun b!1044920 () Bool)

(declare-fun e!592262 () Bool)

(assert (=> b!1044920 (= e!592262 (validKeyInArray!0 (select (arr!31650 lt!460900) #b00000000000000000000000000000000)))))

(declare-fun bm!44422 () Bool)

(declare-fun call!44426 () Bool)

(declare-fun lt!461035 () ListLongMap!13857)

(assert (=> bm!44422 (= call!44426 (contains!6055 lt!461035 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044921 () Bool)

(declare-fun e!592255 () Unit!34015)

(declare-fun lt!461036 () Unit!34015)

(assert (=> b!1044921 (= e!592255 lt!461036)))

(declare-fun lt!461024 () ListLongMap!13857)

(declare-fun getCurrentListMapNoExtraKeys!3572 (array!65805 array!65807 (_ BitVec 32) (_ BitVec 32) V!38003 V!38003 (_ BitVec 32) Int) ListLongMap!13857)

(assert (=> b!1044921 (= lt!461024 (getCurrentListMapNoExtraKeys!3572 lt!460900 lt!460901 (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun lt!461023 () (_ BitVec 64))

(assert (=> b!1044921 (= lt!461023 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461022 () (_ BitVec 64))

(assert (=> b!1044921 (= lt!461022 (select (arr!31650 lt!460900) #b00000000000000000000000000000000))))

(declare-fun lt!461030 () Unit!34015)

(declare-fun addStillContains!625 (ListLongMap!13857 (_ BitVec 64) V!38003 (_ BitVec 64)) Unit!34015)

(assert (=> b!1044921 (= lt!461030 (addStillContains!625 lt!461024 lt!461023 (zeroValue!6243 thiss!1427) lt!461022))))

(declare-fun +!3137 (ListLongMap!13857 tuple2!15852) ListLongMap!13857)

(assert (=> b!1044921 (contains!6055 (+!3137 lt!461024 (tuple2!15853 lt!461023 (zeroValue!6243 thiss!1427))) lt!461022)))

(declare-fun lt!461043 () Unit!34015)

(assert (=> b!1044921 (= lt!461043 lt!461030)))

(declare-fun lt!461037 () ListLongMap!13857)

(assert (=> b!1044921 (= lt!461037 (getCurrentListMapNoExtraKeys!3572 lt!460900 lt!460901 (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun lt!461042 () (_ BitVec 64))

(assert (=> b!1044921 (= lt!461042 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461026 () (_ BitVec 64))

(assert (=> b!1044921 (= lt!461026 (select (arr!31650 lt!460900) #b00000000000000000000000000000000))))

(declare-fun lt!461033 () Unit!34015)

(declare-fun addApplyDifferent!481 (ListLongMap!13857 (_ BitVec 64) V!38003 (_ BitVec 64)) Unit!34015)

(assert (=> b!1044921 (= lt!461033 (addApplyDifferent!481 lt!461037 lt!461042 (minValue!6243 thiss!1427) lt!461026))))

(declare-fun apply!906 (ListLongMap!13857 (_ BitVec 64)) V!38003)

(assert (=> b!1044921 (= (apply!906 (+!3137 lt!461037 (tuple2!15853 lt!461042 (minValue!6243 thiss!1427))) lt!461026) (apply!906 lt!461037 lt!461026))))

(declare-fun lt!461039 () Unit!34015)

(assert (=> b!1044921 (= lt!461039 lt!461033)))

(declare-fun lt!461038 () ListLongMap!13857)

(assert (=> b!1044921 (= lt!461038 (getCurrentListMapNoExtraKeys!3572 lt!460900 lt!460901 (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun lt!461029 () (_ BitVec 64))

(assert (=> b!1044921 (= lt!461029 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461028 () (_ BitVec 64))

(assert (=> b!1044921 (= lt!461028 (select (arr!31650 lt!460900) #b00000000000000000000000000000000))))

(declare-fun lt!461040 () Unit!34015)

(assert (=> b!1044921 (= lt!461040 (addApplyDifferent!481 lt!461038 lt!461029 (zeroValue!6243 thiss!1427) lt!461028))))

(assert (=> b!1044921 (= (apply!906 (+!3137 lt!461038 (tuple2!15853 lt!461029 (zeroValue!6243 thiss!1427))) lt!461028) (apply!906 lt!461038 lt!461028))))

(declare-fun lt!461027 () Unit!34015)

(assert (=> b!1044921 (= lt!461027 lt!461040)))

(declare-fun lt!461034 () ListLongMap!13857)

(assert (=> b!1044921 (= lt!461034 (getCurrentListMapNoExtraKeys!3572 lt!460900 lt!460901 (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun lt!461025 () (_ BitVec 64))

(assert (=> b!1044921 (= lt!461025 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461032 () (_ BitVec 64))

(assert (=> b!1044921 (= lt!461032 (select (arr!31650 lt!460900) #b00000000000000000000000000000000))))

(assert (=> b!1044921 (= lt!461036 (addApplyDifferent!481 lt!461034 lt!461025 (minValue!6243 thiss!1427) lt!461032))))

(assert (=> b!1044921 (= (apply!906 (+!3137 lt!461034 (tuple2!15853 lt!461025 (minValue!6243 thiss!1427))) lt!461032) (apply!906 lt!461034 lt!461032))))

(declare-fun call!44431 () ListLongMap!13857)

(declare-fun bm!44423 () Bool)

(assert (=> bm!44423 (= call!44431 (getCurrentListMapNoExtraKeys!3572 lt!460900 lt!460901 (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun b!1044922 () Bool)

(declare-fun e!592264 () Bool)

(assert (=> b!1044922 (= e!592264 (not call!44426))))

(declare-fun b!1044923 () Bool)

(declare-fun e!592258 () Bool)

(declare-fun e!592253 () Bool)

(assert (=> b!1044923 (= e!592258 e!592253)))

(declare-fun res!695868 () Bool)

(declare-fun call!44427 () Bool)

(assert (=> b!1044923 (= res!695868 call!44427)))

(assert (=> b!1044923 (=> (not res!695868) (not e!592253))))

(declare-fun bm!44424 () Bool)

(assert (=> bm!44424 (= call!44427 (contains!6055 lt!461035 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044924 () Bool)

(declare-fun res!695866 () Bool)

(declare-fun e!592265 () Bool)

(assert (=> b!1044924 (=> (not res!695866) (not e!592265))))

(declare-fun e!592256 () Bool)

(assert (=> b!1044924 (= res!695866 e!592256)))

(declare-fun res!695862 () Bool)

(assert (=> b!1044924 (=> res!695862 e!592256)))

(declare-fun e!592254 () Bool)

(assert (=> b!1044924 (= res!695862 (not e!592254))))

(declare-fun res!695865 () Bool)

(assert (=> b!1044924 (=> (not res!695865) (not e!592254))))

(assert (=> b!1044924 (= res!695865 (bvslt #b00000000000000000000000000000000 (size!32187 lt!460900)))))

(declare-fun d!126317 () Bool)

(assert (=> d!126317 e!592265))

(declare-fun res!695863 () Bool)

(assert (=> d!126317 (=> (not res!695863) (not e!592265))))

(assert (=> d!126317 (= res!695863 (or (bvsge #b00000000000000000000000000000000 (size!32187 lt!460900)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32187 lt!460900)))))))

(declare-fun lt!461031 () ListLongMap!13857)

(assert (=> d!126317 (= lt!461035 lt!461031)))

(declare-fun lt!461041 () Unit!34015)

(assert (=> d!126317 (= lt!461041 e!592255)))

(declare-fun c!106181 () Bool)

(assert (=> d!126317 (= c!106181 e!592262)))

(declare-fun res!695867 () Bool)

(assert (=> d!126317 (=> (not res!695867) (not e!592262))))

(assert (=> d!126317 (= res!695867 (bvslt #b00000000000000000000000000000000 (size!32187 lt!460900)))))

(declare-fun e!592261 () ListLongMap!13857)

(assert (=> d!126317 (= lt!461031 e!592261)))

(declare-fun c!106182 () Bool)

(assert (=> d!126317 (= c!106182 (and (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126317 (validMask!0 (mask!30523 thiss!1427))))

(assert (=> d!126317 (= (getCurrentListMap!3910 lt!460900 lt!460901 (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)) lt!461035)))

(declare-fun bm!44425 () Bool)

(declare-fun call!44425 () ListLongMap!13857)

(assert (=> bm!44425 (= call!44425 call!44431)))

(declare-fun b!1044925 () Bool)

(assert (=> b!1044925 (= e!592265 e!592258)))

(declare-fun c!106179 () Bool)

(assert (=> b!1044925 (= c!106179 (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44426 () Bool)

(declare-fun call!44429 () ListLongMap!13857)

(declare-fun call!44430 () ListLongMap!13857)

(assert (=> bm!44426 (= call!44429 call!44430)))

(declare-fun b!1044926 () Bool)

(assert (=> b!1044926 (= e!592254 (validKeyInArray!0 (select (arr!31650 lt!460900) #b00000000000000000000000000000000)))))

(declare-fun b!1044927 () Bool)

(assert (=> b!1044927 (= e!592258 (not call!44427))))

(declare-fun b!1044928 () Bool)

(declare-fun e!592263 () Bool)

(assert (=> b!1044928 (= e!592263 (= (apply!906 lt!461035 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6243 thiss!1427)))))

(declare-fun e!592257 () Bool)

(declare-fun b!1044929 () Bool)

(declare-fun get!16551 (ValueCell!11720 V!38003) V!38003)

(assert (=> b!1044929 (= e!592257 (= (apply!906 lt!461035 (select (arr!31650 lt!460900) #b00000000000000000000000000000000)) (get!16551 (select (arr!31651 lt!460901) #b00000000000000000000000000000000) (dynLambda!1997 (defaultEntry!6409 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044929 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32188 lt!460901)))))

(assert (=> b!1044929 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32187 lt!460900)))))

(declare-fun b!1044930 () Bool)

(declare-fun e!592260 () ListLongMap!13857)

(assert (=> b!1044930 (= e!592260 call!44429)))

(declare-fun b!1044931 () Bool)

(assert (=> b!1044931 (= e!592261 e!592260)))

(declare-fun c!106180 () Bool)

(assert (=> b!1044931 (= c!106180 (and (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044932 () Bool)

(declare-fun c!106178 () Bool)

(assert (=> b!1044932 (= c!106178 (and (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!592259 () ListLongMap!13857)

(assert (=> b!1044932 (= e!592260 e!592259)))

(declare-fun b!1044933 () Bool)

(declare-fun res!695869 () Bool)

(assert (=> b!1044933 (=> (not res!695869) (not e!592265))))

(assert (=> b!1044933 (= res!695869 e!592264)))

(declare-fun c!106177 () Bool)

(assert (=> b!1044933 (= c!106177 (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!44428 () ListLongMap!13857)

(declare-fun bm!44427 () Bool)

(assert (=> bm!44427 (= call!44430 (+!3137 (ite c!106182 call!44431 (ite c!106180 call!44425 call!44428)) (ite (or c!106182 c!106180) (tuple2!15853 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6243 thiss!1427)) (tuple2!15853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6243 thiss!1427)))))))

(declare-fun bm!44428 () Bool)

(assert (=> bm!44428 (= call!44428 call!44425)))

(declare-fun b!1044934 () Bool)

(assert (=> b!1044934 (= e!592253 (= (apply!906 lt!461035 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6243 thiss!1427)))))

(declare-fun b!1044935 () Bool)

(assert (=> b!1044935 (= e!592256 e!592257)))

(declare-fun res!695870 () Bool)

(assert (=> b!1044935 (=> (not res!695870) (not e!592257))))

(assert (=> b!1044935 (= res!695870 (contains!6055 lt!461035 (select (arr!31650 lt!460900) #b00000000000000000000000000000000)))))

(assert (=> b!1044935 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32187 lt!460900)))))

(declare-fun b!1044936 () Bool)

(assert (=> b!1044936 (= e!592264 e!592263)))

(declare-fun res!695864 () Bool)

(assert (=> b!1044936 (= res!695864 call!44426)))

(assert (=> b!1044936 (=> (not res!695864) (not e!592263))))

(declare-fun b!1044937 () Bool)

(assert (=> b!1044937 (= e!592261 (+!3137 call!44430 (tuple2!15853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6243 thiss!1427))))))

(declare-fun b!1044938 () Bool)

(assert (=> b!1044938 (= e!592259 call!44428)))

(declare-fun b!1044939 () Bool)

(assert (=> b!1044939 (= e!592259 call!44429)))

(declare-fun b!1044940 () Bool)

(declare-fun Unit!34019 () Unit!34015)

(assert (=> b!1044940 (= e!592255 Unit!34019)))

(assert (= (and d!126317 c!106182) b!1044937))

(assert (= (and d!126317 (not c!106182)) b!1044931))

(assert (= (and b!1044931 c!106180) b!1044930))

(assert (= (and b!1044931 (not c!106180)) b!1044932))

(assert (= (and b!1044932 c!106178) b!1044939))

(assert (= (and b!1044932 (not c!106178)) b!1044938))

(assert (= (or b!1044939 b!1044938) bm!44428))

(assert (= (or b!1044930 bm!44428) bm!44425))

(assert (= (or b!1044930 b!1044939) bm!44426))

(assert (= (or b!1044937 bm!44425) bm!44423))

(assert (= (or b!1044937 bm!44426) bm!44427))

(assert (= (and d!126317 res!695867) b!1044920))

(assert (= (and d!126317 c!106181) b!1044921))

(assert (= (and d!126317 (not c!106181)) b!1044940))

(assert (= (and d!126317 res!695863) b!1044924))

(assert (= (and b!1044924 res!695865) b!1044926))

(assert (= (and b!1044924 (not res!695862)) b!1044935))

(assert (= (and b!1044935 res!695870) b!1044929))

(assert (= (and b!1044924 res!695866) b!1044933))

(assert (= (and b!1044933 c!106177) b!1044936))

(assert (= (and b!1044933 (not c!106177)) b!1044922))

(assert (= (and b!1044936 res!695864) b!1044928))

(assert (= (or b!1044936 b!1044922) bm!44422))

(assert (= (and b!1044933 res!695869) b!1044925))

(assert (= (and b!1044925 c!106179) b!1044923))

(assert (= (and b!1044925 (not c!106179)) b!1044927))

(assert (= (and b!1044923 res!695868) b!1044934))

(assert (= (or b!1044923 b!1044927) bm!44424))

(declare-fun b_lambda!16249 () Bool)

(assert (=> (not b_lambda!16249) (not b!1044929)))

(assert (=> b!1044929 t!31292))

(declare-fun b_and!33711 () Bool)

(assert (= b_and!33701 (and (=> t!31292 result!14563) b_and!33711)))

(declare-fun m!964033 () Bool)

(assert (=> bm!44424 m!964033))

(declare-fun m!964035 () Bool)

(assert (=> b!1044937 m!964035))

(declare-fun m!964037 () Bool)

(assert (=> b!1044929 m!964037))

(declare-fun m!964039 () Bool)

(assert (=> b!1044929 m!964039))

(declare-fun m!964041 () Bool)

(assert (=> b!1044929 m!964041))

(assert (=> b!1044929 m!964037))

(assert (=> b!1044929 m!963895))

(declare-fun m!964043 () Bool)

(assert (=> b!1044929 m!964043))

(assert (=> b!1044929 m!963895))

(assert (=> b!1044929 m!964039))

(declare-fun m!964045 () Bool)

(assert (=> b!1044928 m!964045))

(declare-fun m!964047 () Bool)

(assert (=> bm!44422 m!964047))

(declare-fun m!964049 () Bool)

(assert (=> b!1044921 m!964049))

(declare-fun m!964051 () Bool)

(assert (=> b!1044921 m!964051))

(declare-fun m!964053 () Bool)

(assert (=> b!1044921 m!964053))

(assert (=> b!1044921 m!964051))

(declare-fun m!964055 () Bool)

(assert (=> b!1044921 m!964055))

(declare-fun m!964057 () Bool)

(assert (=> b!1044921 m!964057))

(declare-fun m!964059 () Bool)

(assert (=> b!1044921 m!964059))

(assert (=> b!1044921 m!964055))

(declare-fun m!964061 () Bool)

(assert (=> b!1044921 m!964061))

(declare-fun m!964063 () Bool)

(assert (=> b!1044921 m!964063))

(declare-fun m!964065 () Bool)

(assert (=> b!1044921 m!964065))

(assert (=> b!1044921 m!964039))

(declare-fun m!964067 () Bool)

(assert (=> b!1044921 m!964067))

(declare-fun m!964069 () Bool)

(assert (=> b!1044921 m!964069))

(assert (=> b!1044921 m!964065))

(declare-fun m!964071 () Bool)

(assert (=> b!1044921 m!964071))

(declare-fun m!964073 () Bool)

(assert (=> b!1044921 m!964073))

(declare-fun m!964075 () Bool)

(assert (=> b!1044921 m!964075))

(declare-fun m!964077 () Bool)

(assert (=> b!1044921 m!964077))

(assert (=> b!1044921 m!964061))

(declare-fun m!964079 () Bool)

(assert (=> b!1044921 m!964079))

(declare-fun m!964081 () Bool)

(assert (=> b!1044934 m!964081))

(assert (=> d!126317 m!964021))

(assert (=> b!1044920 m!964039))

(assert (=> b!1044920 m!964039))

(declare-fun m!964083 () Bool)

(assert (=> b!1044920 m!964083))

(declare-fun m!964085 () Bool)

(assert (=> bm!44427 m!964085))

(assert (=> b!1044935 m!964039))

(assert (=> b!1044935 m!964039))

(declare-fun m!964087 () Bool)

(assert (=> b!1044935 m!964087))

(assert (=> b!1044926 m!964039))

(assert (=> b!1044926 m!964039))

(assert (=> b!1044926 m!964083))

(assert (=> bm!44423 m!964077))

(assert (=> b!1044773 d!126317))

(declare-fun d!126319 () Bool)

(declare-fun e!592268 () Bool)

(assert (=> d!126319 e!592268))

(declare-fun res!695873 () Bool)

(assert (=> d!126319 (=> (not res!695873) (not e!592268))))

(assert (=> d!126319 (= res!695873 (and (bvsge (index!41752 lt!460907) #b00000000000000000000000000000000) (bvslt (index!41752 lt!460907) (size!32187 (_keys!11673 thiss!1427)))))))

(declare-fun lt!461046 () Unit!34015)

(declare-fun choose!1720 (array!65805 array!65807 (_ BitVec 32) (_ BitVec 32) V!38003 V!38003 (_ BitVec 32) (_ BitVec 64) Int) Unit!34015)

(assert (=> d!126319 (= lt!461046 (choose!1720 (_keys!11673 thiss!1427) (_values!6432 thiss!1427) (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) (index!41752 lt!460907) key!909 (defaultEntry!6409 thiss!1427)))))

(assert (=> d!126319 (validMask!0 (mask!30523 thiss!1427))))

(assert (=> d!126319 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!58 (_keys!11673 thiss!1427) (_values!6432 thiss!1427) (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) (index!41752 lt!460907) key!909 (defaultEntry!6409 thiss!1427)) lt!461046)))

(declare-fun b!1044943 () Bool)

(assert (=> b!1044943 (= e!592268 (= (-!536 (getCurrentListMap!3910 (_keys!11673 thiss!1427) (_values!6432 thiss!1427) (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)) key!909) (getCurrentListMap!3910 (array!65806 (store (arr!31650 (_keys!11673 thiss!1427)) (index!41752 lt!460907) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32187 (_keys!11673 thiss!1427))) (array!65808 (store (arr!31651 (_values!6432 thiss!1427)) (index!41752 lt!460907) (ValueCellFull!11720 (dynLambda!1997 (defaultEntry!6409 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32188 (_values!6432 thiss!1427))) (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427))))))

(assert (=> b!1044943 (bvslt (index!41752 lt!460907) (size!32188 (_values!6432 thiss!1427)))))

(assert (= (and d!126319 res!695873) b!1044943))

(declare-fun b_lambda!16251 () Bool)

(assert (=> (not b_lambda!16251) (not b!1044943)))

(assert (=> b!1044943 t!31292))

(declare-fun b_and!33713 () Bool)

(assert (= b_and!33711 (and (=> t!31292 result!14563) b_and!33713)))

(declare-fun m!964089 () Bool)

(assert (=> d!126319 m!964089))

(assert (=> d!126319 m!964021))

(assert (=> b!1044943 m!963895))

(declare-fun m!964091 () Bool)

(assert (=> b!1044943 m!964091))

(assert (=> b!1044943 m!963883))

(assert (=> b!1044943 m!963889))

(assert (=> b!1044943 m!963871))

(assert (=> b!1044943 m!963871))

(assert (=> b!1044943 m!963873))

(assert (=> b!1044773 d!126319))

(declare-fun d!126321 () Bool)

(declare-fun lt!461049 () ListLongMap!13857)

(assert (=> d!126321 (not (contains!6055 lt!461049 key!909))))

(declare-fun removeStrictlySorted!63 (List!22050 (_ BitVec 64)) List!22050)

(assert (=> d!126321 (= lt!461049 (ListLongMap!13858 (removeStrictlySorted!63 (toList!6944 (getCurrentListMap!3910 (_keys!11673 thiss!1427) (_values!6432 thiss!1427) (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427))) key!909)))))

(assert (=> d!126321 (= (-!536 (getCurrentListMap!3910 (_keys!11673 thiss!1427) (_values!6432 thiss!1427) (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)) key!909) lt!461049)))

(declare-fun bs!30494 () Bool)

(assert (= bs!30494 d!126321))

(declare-fun m!964093 () Bool)

(assert (=> bs!30494 m!964093))

(declare-fun m!964095 () Bool)

(assert (=> bs!30494 m!964095))

(assert (=> b!1044773 d!126321))

(declare-fun d!126323 () Bool)

(declare-fun res!695878 () Bool)

(declare-fun e!592275 () Bool)

(assert (=> d!126323 (=> res!695878 e!592275)))

(assert (=> d!126323 (= res!695878 (bvsge #b00000000000000000000000000000000 (size!32187 lt!460900)))))

(assert (=> d!126323 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460900 (mask!30523 thiss!1427)) e!592275)))

(declare-fun b!1044952 () Bool)

(declare-fun e!592277 () Bool)

(assert (=> b!1044952 (= e!592275 e!592277)))

(declare-fun c!106185 () Bool)

(assert (=> b!1044952 (= c!106185 (validKeyInArray!0 (select (arr!31650 lt!460900) #b00000000000000000000000000000000)))))

(declare-fun b!1044953 () Bool)

(declare-fun call!44434 () Bool)

(assert (=> b!1044953 (= e!592277 call!44434)))

(declare-fun b!1044954 () Bool)

(declare-fun e!592276 () Bool)

(assert (=> b!1044954 (= e!592277 e!592276)))

(declare-fun lt!461058 () (_ BitVec 64))

(assert (=> b!1044954 (= lt!461058 (select (arr!31650 lt!460900) #b00000000000000000000000000000000))))

(declare-fun lt!461056 () Unit!34015)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65805 (_ BitVec 64) (_ BitVec 32)) Unit!34015)

(assert (=> b!1044954 (= lt!461056 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!460900 lt!461058 #b00000000000000000000000000000000))))

(assert (=> b!1044954 (arrayContainsKey!0 lt!460900 lt!461058 #b00000000000000000000000000000000)))

(declare-fun lt!461057 () Unit!34015)

(assert (=> b!1044954 (= lt!461057 lt!461056)))

(declare-fun res!695879 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65805 (_ BitVec 32)) SeekEntryResult!9845)

(assert (=> b!1044954 (= res!695879 (= (seekEntryOrOpen!0 (select (arr!31650 lt!460900) #b00000000000000000000000000000000) lt!460900 (mask!30523 thiss!1427)) (Found!9845 #b00000000000000000000000000000000)))))

(assert (=> b!1044954 (=> (not res!695879) (not e!592276))))

(declare-fun bm!44431 () Bool)

(assert (=> bm!44431 (= call!44434 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!460900 (mask!30523 thiss!1427)))))

(declare-fun b!1044955 () Bool)

(assert (=> b!1044955 (= e!592276 call!44434)))

(assert (= (and d!126323 (not res!695878)) b!1044952))

(assert (= (and b!1044952 c!106185) b!1044954))

(assert (= (and b!1044952 (not c!106185)) b!1044953))

(assert (= (and b!1044954 res!695879) b!1044955))

(assert (= (or b!1044955 b!1044953) bm!44431))

(assert (=> b!1044952 m!964039))

(assert (=> b!1044952 m!964039))

(assert (=> b!1044952 m!964083))

(assert (=> b!1044954 m!964039))

(declare-fun m!964097 () Bool)

(assert (=> b!1044954 m!964097))

(declare-fun m!964099 () Bool)

(assert (=> b!1044954 m!964099))

(assert (=> b!1044954 m!964039))

(declare-fun m!964101 () Bool)

(assert (=> b!1044954 m!964101))

(declare-fun m!964103 () Bool)

(assert (=> bm!44431 m!964103))

(assert (=> b!1044773 d!126323))

(declare-fun d!126325 () Bool)

(declare-fun e!592280 () Bool)

(assert (=> d!126325 e!592280))

(declare-fun res!695882 () Bool)

(assert (=> d!126325 (=> (not res!695882) (not e!592280))))

(assert (=> d!126325 (= res!695882 (bvslt (index!41752 lt!460907) (size!32187 (_keys!11673 thiss!1427))))))

(declare-fun lt!461061 () Unit!34015)

(declare-fun choose!121 (array!65805 (_ BitVec 32) (_ BitVec 64)) Unit!34015)

(assert (=> d!126325 (= lt!461061 (choose!121 (_keys!11673 thiss!1427) (index!41752 lt!460907) key!909))))

(assert (=> d!126325 (bvsge (index!41752 lt!460907) #b00000000000000000000000000000000)))

(assert (=> d!126325 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11673 thiss!1427) (index!41752 lt!460907) key!909) lt!461061)))

(declare-fun b!1044958 () Bool)

(assert (=> b!1044958 (= e!592280 (not (arrayContainsKey!0 (array!65806 (store (arr!31650 (_keys!11673 thiss!1427)) (index!41752 lt!460907) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32187 (_keys!11673 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126325 res!695882) b!1044958))

(declare-fun m!964105 () Bool)

(assert (=> d!126325 m!964105))

(assert (=> b!1044958 m!963889))

(declare-fun m!964107 () Bool)

(assert (=> b!1044958 m!964107))

(assert (=> b!1044773 d!126325))

(declare-fun d!126327 () Bool)

(declare-fun e!592286 () Bool)

(assert (=> d!126327 e!592286))

(declare-fun res!695885 () Bool)

(assert (=> d!126327 (=> res!695885 e!592286)))

(declare-fun lt!461073 () Bool)

(assert (=> d!126327 (= res!695885 (not lt!461073))))

(declare-fun lt!461072 () Bool)

(assert (=> d!126327 (= lt!461073 lt!461072)))

(declare-fun lt!461071 () Unit!34015)

(declare-fun e!592285 () Unit!34015)

(assert (=> d!126327 (= lt!461071 e!592285)))

(declare-fun c!106188 () Bool)

(assert (=> d!126327 (= c!106188 lt!461072)))

(declare-fun containsKey!568 (List!22050 (_ BitVec 64)) Bool)

(assert (=> d!126327 (= lt!461072 (containsKey!568 (toList!6944 (getCurrentListMap!3910 (_keys!11673 (_2!7936 lt!460906)) (_values!6432 (_2!7936 lt!460906)) (mask!30523 (_2!7936 lt!460906)) (extraKeys!6137 (_2!7936 lt!460906)) (zeroValue!6243 (_2!7936 lt!460906)) (minValue!6243 (_2!7936 lt!460906)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7936 lt!460906)))) key!909))))

(assert (=> d!126327 (= (contains!6055 (getCurrentListMap!3910 (_keys!11673 (_2!7936 lt!460906)) (_values!6432 (_2!7936 lt!460906)) (mask!30523 (_2!7936 lt!460906)) (extraKeys!6137 (_2!7936 lt!460906)) (zeroValue!6243 (_2!7936 lt!460906)) (minValue!6243 (_2!7936 lt!460906)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7936 lt!460906))) key!909) lt!461073)))

(declare-fun b!1044965 () Bool)

(declare-fun lt!461070 () Unit!34015)

(assert (=> b!1044965 (= e!592285 lt!461070)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!400 (List!22050 (_ BitVec 64)) Unit!34015)

(assert (=> b!1044965 (= lt!461070 (lemmaContainsKeyImpliesGetValueByKeyDefined!400 (toList!6944 (getCurrentListMap!3910 (_keys!11673 (_2!7936 lt!460906)) (_values!6432 (_2!7936 lt!460906)) (mask!30523 (_2!7936 lt!460906)) (extraKeys!6137 (_2!7936 lt!460906)) (zeroValue!6243 (_2!7936 lt!460906)) (minValue!6243 (_2!7936 lt!460906)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7936 lt!460906)))) key!909))))

(declare-datatypes ((Option!646 0))(
  ( (Some!645 (v!15070 V!38003)) (None!644) )
))
(declare-fun isDefined!443 (Option!646) Bool)

(declare-fun getValueByKey!595 (List!22050 (_ BitVec 64)) Option!646)

(assert (=> b!1044965 (isDefined!443 (getValueByKey!595 (toList!6944 (getCurrentListMap!3910 (_keys!11673 (_2!7936 lt!460906)) (_values!6432 (_2!7936 lt!460906)) (mask!30523 (_2!7936 lt!460906)) (extraKeys!6137 (_2!7936 lt!460906)) (zeroValue!6243 (_2!7936 lt!460906)) (minValue!6243 (_2!7936 lt!460906)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7936 lt!460906)))) key!909))))

(declare-fun b!1044966 () Bool)

(declare-fun Unit!34020 () Unit!34015)

(assert (=> b!1044966 (= e!592285 Unit!34020)))

(declare-fun b!1044967 () Bool)

(assert (=> b!1044967 (= e!592286 (isDefined!443 (getValueByKey!595 (toList!6944 (getCurrentListMap!3910 (_keys!11673 (_2!7936 lt!460906)) (_values!6432 (_2!7936 lt!460906)) (mask!30523 (_2!7936 lt!460906)) (extraKeys!6137 (_2!7936 lt!460906)) (zeroValue!6243 (_2!7936 lt!460906)) (minValue!6243 (_2!7936 lt!460906)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7936 lt!460906)))) key!909)))))

(assert (= (and d!126327 c!106188) b!1044965))

(assert (= (and d!126327 (not c!106188)) b!1044966))

(assert (= (and d!126327 (not res!695885)) b!1044967))

(declare-fun m!964109 () Bool)

(assert (=> d!126327 m!964109))

(declare-fun m!964111 () Bool)

(assert (=> b!1044965 m!964111))

(declare-fun m!964113 () Bool)

(assert (=> b!1044965 m!964113))

(assert (=> b!1044965 m!964113))

(declare-fun m!964115 () Bool)

(assert (=> b!1044965 m!964115))

(assert (=> b!1044967 m!964113))

(assert (=> b!1044967 m!964113))

(assert (=> b!1044967 m!964115))

(assert (=> b!1044773 d!126327))

(declare-fun d!126329 () Bool)

(declare-fun e!592289 () Bool)

(assert (=> d!126329 e!592289))

(declare-fun res!695888 () Bool)

(assert (=> d!126329 (=> (not res!695888) (not e!592289))))

(assert (=> d!126329 (= res!695888 (and (bvsge (index!41752 lt!460907) #b00000000000000000000000000000000) (bvslt (index!41752 lt!460907) (size!32187 (_keys!11673 thiss!1427)))))))

(declare-fun lt!461076 () Unit!34015)

(declare-fun choose!25 (array!65805 (_ BitVec 32) (_ BitVec 32)) Unit!34015)

(assert (=> d!126329 (= lt!461076 (choose!25 (_keys!11673 thiss!1427) (index!41752 lt!460907) (mask!30523 thiss!1427)))))

(assert (=> d!126329 (validMask!0 (mask!30523 thiss!1427))))

(assert (=> d!126329 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11673 thiss!1427) (index!41752 lt!460907) (mask!30523 thiss!1427)) lt!461076)))

(declare-fun b!1044970 () Bool)

(assert (=> b!1044970 (= e!592289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65806 (store (arr!31650 (_keys!11673 thiss!1427)) (index!41752 lt!460907) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32187 (_keys!11673 thiss!1427))) (mask!30523 thiss!1427)))))

(assert (= (and d!126329 res!695888) b!1044970))

(declare-fun m!964117 () Bool)

(assert (=> d!126329 m!964117))

(assert (=> d!126329 m!964021))

(assert (=> b!1044970 m!963889))

(declare-fun m!964119 () Bool)

(assert (=> b!1044970 m!964119))

(assert (=> b!1044773 d!126329))

(declare-fun d!126331 () Bool)

(declare-fun e!592292 () Bool)

(assert (=> d!126331 e!592292))

(declare-fun res!695891 () Bool)

(assert (=> d!126331 (=> (not res!695891) (not e!592292))))

(assert (=> d!126331 (= res!695891 (and (bvsge (index!41752 lt!460907) #b00000000000000000000000000000000) (bvslt (index!41752 lt!460907) (size!32187 (_keys!11673 thiss!1427)))))))

(declare-fun lt!461079 () Unit!34015)

(declare-fun choose!53 (array!65805 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22051) Unit!34015)

(assert (=> d!126331 (= lt!461079 (choose!53 (_keys!11673 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41752 lt!460907) #b00000000000000000000000000000000 Nil!22048))))

(assert (=> d!126331 (bvslt (size!32187 (_keys!11673 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126331 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11673 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41752 lt!460907) #b00000000000000000000000000000000 Nil!22048) lt!461079)))

(declare-fun b!1044973 () Bool)

(assert (=> b!1044973 (= e!592292 (arrayNoDuplicates!0 (array!65806 (store (arr!31650 (_keys!11673 thiss!1427)) (index!41752 lt!460907) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32187 (_keys!11673 thiss!1427))) #b00000000000000000000000000000000 Nil!22048))))

(assert (= (and d!126331 res!695891) b!1044973))

(declare-fun m!964121 () Bool)

(assert (=> d!126331 m!964121))

(assert (=> b!1044973 m!963889))

(declare-fun m!964123 () Bool)

(assert (=> b!1044973 m!964123))

(assert (=> b!1044773 d!126331))

(declare-fun b!1044984 () Bool)

(declare-fun e!592302 () Bool)

(declare-fun e!592303 () Bool)

(assert (=> b!1044984 (= e!592302 e!592303)))

(declare-fun res!695900 () Bool)

(assert (=> b!1044984 (=> (not res!695900) (not e!592303))))

(declare-fun e!592301 () Bool)

(assert (=> b!1044984 (= res!695900 (not e!592301))))

(declare-fun res!695899 () Bool)

(assert (=> b!1044984 (=> (not res!695899) (not e!592301))))

(assert (=> b!1044984 (= res!695899 (validKeyInArray!0 (select (arr!31650 lt!460900) #b00000000000000000000000000000000)))))

(declare-fun b!1044985 () Bool)

(declare-fun e!592304 () Bool)

(declare-fun call!44437 () Bool)

(assert (=> b!1044985 (= e!592304 call!44437)))

(declare-fun b!1044986 () Bool)

(assert (=> b!1044986 (= e!592303 e!592304)))

(declare-fun c!106191 () Bool)

(assert (=> b!1044986 (= c!106191 (validKeyInArray!0 (select (arr!31650 lt!460900) #b00000000000000000000000000000000)))))

(declare-fun d!126333 () Bool)

(declare-fun res!695898 () Bool)

(assert (=> d!126333 (=> res!695898 e!592302)))

(assert (=> d!126333 (= res!695898 (bvsge #b00000000000000000000000000000000 (size!32187 lt!460900)))))

(assert (=> d!126333 (= (arrayNoDuplicates!0 lt!460900 #b00000000000000000000000000000000 Nil!22048) e!592302)))

(declare-fun b!1044987 () Bool)

(declare-fun contains!6056 (List!22051 (_ BitVec 64)) Bool)

(assert (=> b!1044987 (= e!592301 (contains!6056 Nil!22048 (select (arr!31650 lt!460900) #b00000000000000000000000000000000)))))

(declare-fun b!1044988 () Bool)

(assert (=> b!1044988 (= e!592304 call!44437)))

(declare-fun bm!44434 () Bool)

(assert (=> bm!44434 (= call!44437 (arrayNoDuplicates!0 lt!460900 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106191 (Cons!22047 (select (arr!31650 lt!460900) #b00000000000000000000000000000000) Nil!22048) Nil!22048)))))

(assert (= (and d!126333 (not res!695898)) b!1044984))

(assert (= (and b!1044984 res!695899) b!1044987))

(assert (= (and b!1044984 res!695900) b!1044986))

(assert (= (and b!1044986 c!106191) b!1044988))

(assert (= (and b!1044986 (not c!106191)) b!1044985))

(assert (= (or b!1044988 b!1044985) bm!44434))

(assert (=> b!1044984 m!964039))

(assert (=> b!1044984 m!964039))

(assert (=> b!1044984 m!964083))

(assert (=> b!1044986 m!964039))

(assert (=> b!1044986 m!964039))

(assert (=> b!1044986 m!964083))

(assert (=> b!1044987 m!964039))

(assert (=> b!1044987 m!964039))

(declare-fun m!964125 () Bool)

(assert (=> b!1044987 m!964125))

(assert (=> bm!44434 m!964039))

(declare-fun m!964127 () Bool)

(assert (=> bm!44434 m!964127))

(assert (=> b!1044773 d!126333))

(declare-fun b!1044997 () Bool)

(declare-fun e!592309 () (_ BitVec 32))

(declare-fun e!592310 () (_ BitVec 32))

(assert (=> b!1044997 (= e!592309 e!592310)))

(declare-fun c!106196 () Bool)

(assert (=> b!1044997 (= c!106196 (validKeyInArray!0 (select (arr!31650 lt!460900) #b00000000000000000000000000000000)))))

(declare-fun b!1044998 () Bool)

(declare-fun call!44440 () (_ BitVec 32))

(assert (=> b!1044998 (= e!592310 call!44440)))

(declare-fun d!126335 () Bool)

(declare-fun lt!461082 () (_ BitVec 32))

(assert (=> d!126335 (and (bvsge lt!461082 #b00000000000000000000000000000000) (bvsle lt!461082 (bvsub (size!32187 lt!460900) #b00000000000000000000000000000000)))))

(assert (=> d!126335 (= lt!461082 e!592309)))

(declare-fun c!106197 () Bool)

(assert (=> d!126335 (= c!106197 (bvsge #b00000000000000000000000000000000 (size!32187 (_keys!11673 thiss!1427))))))

(assert (=> d!126335 (and (bvsle #b00000000000000000000000000000000 (size!32187 (_keys!11673 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32187 (_keys!11673 thiss!1427)) (size!32187 lt!460900)))))

(assert (=> d!126335 (= (arrayCountValidKeys!0 lt!460900 #b00000000000000000000000000000000 (size!32187 (_keys!11673 thiss!1427))) lt!461082)))

(declare-fun b!1044999 () Bool)

(assert (=> b!1044999 (= e!592309 #b00000000000000000000000000000000)))

(declare-fun b!1045000 () Bool)

(assert (=> b!1045000 (= e!592310 (bvadd #b00000000000000000000000000000001 call!44440))))

(declare-fun bm!44437 () Bool)

(assert (=> bm!44437 (= call!44440 (arrayCountValidKeys!0 lt!460900 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32187 (_keys!11673 thiss!1427))))))

(assert (= (and d!126335 c!106197) b!1044999))

(assert (= (and d!126335 (not c!106197)) b!1044997))

(assert (= (and b!1044997 c!106196) b!1045000))

(assert (= (and b!1044997 (not c!106196)) b!1044998))

(assert (= (or b!1045000 b!1044998) bm!44437))

(assert (=> b!1044997 m!964039))

(assert (=> b!1044997 m!964039))

(assert (=> b!1044997 m!964083))

(declare-fun m!964129 () Bool)

(assert (=> bm!44437 m!964129))

(assert (=> b!1044773 d!126335))

(declare-fun d!126337 () Bool)

(declare-fun res!695905 () Bool)

(declare-fun e!592315 () Bool)

(assert (=> d!126337 (=> res!695905 e!592315)))

(assert (=> d!126337 (= res!695905 (= (select (arr!31650 lt!460900) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126337 (= (arrayContainsKey!0 lt!460900 key!909 #b00000000000000000000000000000000) e!592315)))

(declare-fun b!1045005 () Bool)

(declare-fun e!592316 () Bool)

(assert (=> b!1045005 (= e!592315 e!592316)))

(declare-fun res!695906 () Bool)

(assert (=> b!1045005 (=> (not res!695906) (not e!592316))))

(assert (=> b!1045005 (= res!695906 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32187 lt!460900)))))

(declare-fun b!1045006 () Bool)

(assert (=> b!1045006 (= e!592316 (arrayContainsKey!0 lt!460900 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126337 (not res!695905)) b!1045005))

(assert (= (and b!1045005 res!695906) b!1045006))

(assert (=> d!126337 m!964039))

(declare-fun m!964131 () Bool)

(assert (=> b!1045006 m!964131))

(assert (=> b!1044773 d!126337))

(declare-fun b!1045007 () Bool)

(declare-fun e!592326 () Bool)

(assert (=> b!1045007 (= e!592326 (validKeyInArray!0 (select (arr!31650 (_keys!11673 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44438 () Bool)

(declare-fun call!44442 () Bool)

(declare-fun lt!461096 () ListLongMap!13857)

(assert (=> bm!44438 (= call!44442 (contains!6055 lt!461096 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045008 () Bool)

(declare-fun e!592319 () Unit!34015)

(declare-fun lt!461097 () Unit!34015)

(assert (=> b!1045008 (= e!592319 lt!461097)))

(declare-fun lt!461085 () ListLongMap!13857)

(assert (=> b!1045008 (= lt!461085 (getCurrentListMapNoExtraKeys!3572 (_keys!11673 thiss!1427) (_values!6432 thiss!1427) (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun lt!461084 () (_ BitVec 64))

(assert (=> b!1045008 (= lt!461084 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461083 () (_ BitVec 64))

(assert (=> b!1045008 (= lt!461083 (select (arr!31650 (_keys!11673 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461091 () Unit!34015)

(assert (=> b!1045008 (= lt!461091 (addStillContains!625 lt!461085 lt!461084 (zeroValue!6243 thiss!1427) lt!461083))))

(assert (=> b!1045008 (contains!6055 (+!3137 lt!461085 (tuple2!15853 lt!461084 (zeroValue!6243 thiss!1427))) lt!461083)))

(declare-fun lt!461104 () Unit!34015)

(assert (=> b!1045008 (= lt!461104 lt!461091)))

(declare-fun lt!461098 () ListLongMap!13857)

(assert (=> b!1045008 (= lt!461098 (getCurrentListMapNoExtraKeys!3572 (_keys!11673 thiss!1427) (_values!6432 thiss!1427) (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun lt!461103 () (_ BitVec 64))

(assert (=> b!1045008 (= lt!461103 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461087 () (_ BitVec 64))

(assert (=> b!1045008 (= lt!461087 (select (arr!31650 (_keys!11673 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461094 () Unit!34015)

(assert (=> b!1045008 (= lt!461094 (addApplyDifferent!481 lt!461098 lt!461103 (minValue!6243 thiss!1427) lt!461087))))

(assert (=> b!1045008 (= (apply!906 (+!3137 lt!461098 (tuple2!15853 lt!461103 (minValue!6243 thiss!1427))) lt!461087) (apply!906 lt!461098 lt!461087))))

(declare-fun lt!461100 () Unit!34015)

(assert (=> b!1045008 (= lt!461100 lt!461094)))

(declare-fun lt!461099 () ListLongMap!13857)

(assert (=> b!1045008 (= lt!461099 (getCurrentListMapNoExtraKeys!3572 (_keys!11673 thiss!1427) (_values!6432 thiss!1427) (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun lt!461090 () (_ BitVec 64))

(assert (=> b!1045008 (= lt!461090 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461089 () (_ BitVec 64))

(assert (=> b!1045008 (= lt!461089 (select (arr!31650 (_keys!11673 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461101 () Unit!34015)

(assert (=> b!1045008 (= lt!461101 (addApplyDifferent!481 lt!461099 lt!461090 (zeroValue!6243 thiss!1427) lt!461089))))

(assert (=> b!1045008 (= (apply!906 (+!3137 lt!461099 (tuple2!15853 lt!461090 (zeroValue!6243 thiss!1427))) lt!461089) (apply!906 lt!461099 lt!461089))))

(declare-fun lt!461088 () Unit!34015)

(assert (=> b!1045008 (= lt!461088 lt!461101)))

(declare-fun lt!461095 () ListLongMap!13857)

(assert (=> b!1045008 (= lt!461095 (getCurrentListMapNoExtraKeys!3572 (_keys!11673 thiss!1427) (_values!6432 thiss!1427) (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun lt!461086 () (_ BitVec 64))

(assert (=> b!1045008 (= lt!461086 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461093 () (_ BitVec 64))

(assert (=> b!1045008 (= lt!461093 (select (arr!31650 (_keys!11673 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045008 (= lt!461097 (addApplyDifferent!481 lt!461095 lt!461086 (minValue!6243 thiss!1427) lt!461093))))

(assert (=> b!1045008 (= (apply!906 (+!3137 lt!461095 (tuple2!15853 lt!461086 (minValue!6243 thiss!1427))) lt!461093) (apply!906 lt!461095 lt!461093))))

(declare-fun bm!44439 () Bool)

(declare-fun call!44447 () ListLongMap!13857)

(assert (=> bm!44439 (= call!44447 (getCurrentListMapNoExtraKeys!3572 (_keys!11673 thiss!1427) (_values!6432 thiss!1427) (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)))))

(declare-fun b!1045009 () Bool)

(declare-fun e!592328 () Bool)

(assert (=> b!1045009 (= e!592328 (not call!44442))))

(declare-fun b!1045010 () Bool)

(declare-fun e!592322 () Bool)

(declare-fun e!592317 () Bool)

(assert (=> b!1045010 (= e!592322 e!592317)))

(declare-fun res!695913 () Bool)

(declare-fun call!44443 () Bool)

(assert (=> b!1045010 (= res!695913 call!44443)))

(assert (=> b!1045010 (=> (not res!695913) (not e!592317))))

(declare-fun bm!44440 () Bool)

(assert (=> bm!44440 (= call!44443 (contains!6055 lt!461096 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045011 () Bool)

(declare-fun res!695911 () Bool)

(declare-fun e!592329 () Bool)

(assert (=> b!1045011 (=> (not res!695911) (not e!592329))))

(declare-fun e!592320 () Bool)

(assert (=> b!1045011 (= res!695911 e!592320)))

(declare-fun res!695907 () Bool)

(assert (=> b!1045011 (=> res!695907 e!592320)))

(declare-fun e!592318 () Bool)

(assert (=> b!1045011 (= res!695907 (not e!592318))))

(declare-fun res!695910 () Bool)

(assert (=> b!1045011 (=> (not res!695910) (not e!592318))))

(assert (=> b!1045011 (= res!695910 (bvslt #b00000000000000000000000000000000 (size!32187 (_keys!11673 thiss!1427))))))

(declare-fun d!126339 () Bool)

(assert (=> d!126339 e!592329))

(declare-fun res!695908 () Bool)

(assert (=> d!126339 (=> (not res!695908) (not e!592329))))

(assert (=> d!126339 (= res!695908 (or (bvsge #b00000000000000000000000000000000 (size!32187 (_keys!11673 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32187 (_keys!11673 thiss!1427))))))))

(declare-fun lt!461092 () ListLongMap!13857)

(assert (=> d!126339 (= lt!461096 lt!461092)))

(declare-fun lt!461102 () Unit!34015)

(assert (=> d!126339 (= lt!461102 e!592319)))

(declare-fun c!106202 () Bool)

(assert (=> d!126339 (= c!106202 e!592326)))

(declare-fun res!695912 () Bool)

(assert (=> d!126339 (=> (not res!695912) (not e!592326))))

(assert (=> d!126339 (= res!695912 (bvslt #b00000000000000000000000000000000 (size!32187 (_keys!11673 thiss!1427))))))

(declare-fun e!592325 () ListLongMap!13857)

(assert (=> d!126339 (= lt!461092 e!592325)))

(declare-fun c!106203 () Bool)

(assert (=> d!126339 (= c!106203 (and (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126339 (validMask!0 (mask!30523 thiss!1427))))

(assert (=> d!126339 (= (getCurrentListMap!3910 (_keys!11673 thiss!1427) (_values!6432 thiss!1427) (mask!30523 thiss!1427) (extraKeys!6137 thiss!1427) (zeroValue!6243 thiss!1427) (minValue!6243 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6409 thiss!1427)) lt!461096)))

(declare-fun bm!44441 () Bool)

(declare-fun call!44441 () ListLongMap!13857)

(assert (=> bm!44441 (= call!44441 call!44447)))

(declare-fun b!1045012 () Bool)

(assert (=> b!1045012 (= e!592329 e!592322)))

(declare-fun c!106200 () Bool)

(assert (=> b!1045012 (= c!106200 (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44442 () Bool)

(declare-fun call!44445 () ListLongMap!13857)

(declare-fun call!44446 () ListLongMap!13857)

(assert (=> bm!44442 (= call!44445 call!44446)))

(declare-fun b!1045013 () Bool)

(assert (=> b!1045013 (= e!592318 (validKeyInArray!0 (select (arr!31650 (_keys!11673 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1045014 () Bool)

(assert (=> b!1045014 (= e!592322 (not call!44443))))

(declare-fun b!1045015 () Bool)

(declare-fun e!592327 () Bool)

(assert (=> b!1045015 (= e!592327 (= (apply!906 lt!461096 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6243 thiss!1427)))))

(declare-fun b!1045016 () Bool)

(declare-fun e!592321 () Bool)

(assert (=> b!1045016 (= e!592321 (= (apply!906 lt!461096 (select (arr!31650 (_keys!11673 thiss!1427)) #b00000000000000000000000000000000)) (get!16551 (select (arr!31651 (_values!6432 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1997 (defaultEntry!6409 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045016 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32188 (_values!6432 thiss!1427))))))

(assert (=> b!1045016 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32187 (_keys!11673 thiss!1427))))))

(declare-fun b!1045017 () Bool)

(declare-fun e!592324 () ListLongMap!13857)

(assert (=> b!1045017 (= e!592324 call!44445)))

(declare-fun b!1045018 () Bool)

(assert (=> b!1045018 (= e!592325 e!592324)))

(declare-fun c!106201 () Bool)

(assert (=> b!1045018 (= c!106201 (and (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045019 () Bool)

(declare-fun c!106199 () Bool)

(assert (=> b!1045019 (= c!106199 (and (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!592323 () ListLongMap!13857)

(assert (=> b!1045019 (= e!592324 e!592323)))

(declare-fun b!1045020 () Bool)

(declare-fun res!695914 () Bool)

(assert (=> b!1045020 (=> (not res!695914) (not e!592329))))

(assert (=> b!1045020 (= res!695914 e!592328)))

(declare-fun c!106198 () Bool)

(assert (=> b!1045020 (= c!106198 (not (= (bvand (extraKeys!6137 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!44443 () Bool)

(declare-fun call!44444 () ListLongMap!13857)

(assert (=> bm!44443 (= call!44446 (+!3137 (ite c!106203 call!44447 (ite c!106201 call!44441 call!44444)) (ite (or c!106203 c!106201) (tuple2!15853 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6243 thiss!1427)) (tuple2!15853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6243 thiss!1427)))))))

(declare-fun bm!44444 () Bool)

(assert (=> bm!44444 (= call!44444 call!44441)))

(declare-fun b!1045021 () Bool)

(assert (=> b!1045021 (= e!592317 (= (apply!906 lt!461096 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6243 thiss!1427)))))

(declare-fun b!1045022 () Bool)

(assert (=> b!1045022 (= e!592320 e!592321)))

(declare-fun res!695915 () Bool)

(assert (=> b!1045022 (=> (not res!695915) (not e!592321))))

(assert (=> b!1045022 (= res!695915 (contains!6055 lt!461096 (select (arr!31650 (_keys!11673 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1045022 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32187 (_keys!11673 thiss!1427))))))

(declare-fun b!1045023 () Bool)

(assert (=> b!1045023 (= e!592328 e!592327)))

(declare-fun res!695909 () Bool)

(assert (=> b!1045023 (= res!695909 call!44442)))

(assert (=> b!1045023 (=> (not res!695909) (not e!592327))))

(declare-fun b!1045024 () Bool)

(assert (=> b!1045024 (= e!592325 (+!3137 call!44446 (tuple2!15853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6243 thiss!1427))))))

(declare-fun b!1045025 () Bool)

(assert (=> b!1045025 (= e!592323 call!44444)))

(declare-fun b!1045026 () Bool)

(assert (=> b!1045026 (= e!592323 call!44445)))

(declare-fun b!1045027 () Bool)

(declare-fun Unit!34021 () Unit!34015)

(assert (=> b!1045027 (= e!592319 Unit!34021)))

(assert (= (and d!126339 c!106203) b!1045024))

(assert (= (and d!126339 (not c!106203)) b!1045018))

(assert (= (and b!1045018 c!106201) b!1045017))

(assert (= (and b!1045018 (not c!106201)) b!1045019))

(assert (= (and b!1045019 c!106199) b!1045026))

(assert (= (and b!1045019 (not c!106199)) b!1045025))

(assert (= (or b!1045026 b!1045025) bm!44444))

(assert (= (or b!1045017 bm!44444) bm!44441))

(assert (= (or b!1045017 b!1045026) bm!44442))

(assert (= (or b!1045024 bm!44441) bm!44439))

(assert (= (or b!1045024 bm!44442) bm!44443))

(assert (= (and d!126339 res!695912) b!1045007))

(assert (= (and d!126339 c!106202) b!1045008))

(assert (= (and d!126339 (not c!106202)) b!1045027))

(assert (= (and d!126339 res!695908) b!1045011))

(assert (= (and b!1045011 res!695910) b!1045013))

(assert (= (and b!1045011 (not res!695907)) b!1045022))

(assert (= (and b!1045022 res!695915) b!1045016))

(assert (= (and b!1045011 res!695911) b!1045020))

(assert (= (and b!1045020 c!106198) b!1045023))

(assert (= (and b!1045020 (not c!106198)) b!1045009))

(assert (= (and b!1045023 res!695909) b!1045015))

(assert (= (or b!1045023 b!1045009) bm!44438))

(assert (= (and b!1045020 res!695914) b!1045012))

(assert (= (and b!1045012 c!106200) b!1045010))

(assert (= (and b!1045012 (not c!106200)) b!1045014))

(assert (= (and b!1045010 res!695913) b!1045021))

(assert (= (or b!1045010 b!1045014) bm!44440))

(declare-fun b_lambda!16253 () Bool)

(assert (=> (not b_lambda!16253) (not b!1045016)))

(assert (=> b!1045016 t!31292))

(declare-fun b_and!33715 () Bool)

(assert (= b_and!33713 (and (=> t!31292 result!14563) b_and!33715)))

(declare-fun m!964133 () Bool)

(assert (=> bm!44440 m!964133))

(declare-fun m!964135 () Bool)

(assert (=> b!1045024 m!964135))

(declare-fun m!964137 () Bool)

(assert (=> b!1045016 m!964137))

(declare-fun m!964139 () Bool)

(assert (=> b!1045016 m!964139))

(declare-fun m!964141 () Bool)

(assert (=> b!1045016 m!964141))

(assert (=> b!1045016 m!964137))

(assert (=> b!1045016 m!963895))

(declare-fun m!964143 () Bool)

(assert (=> b!1045016 m!964143))

(assert (=> b!1045016 m!963895))

(assert (=> b!1045016 m!964139))

(declare-fun m!964145 () Bool)

(assert (=> b!1045015 m!964145))

(declare-fun m!964147 () Bool)

(assert (=> bm!44438 m!964147))

(declare-fun m!964149 () Bool)

(assert (=> b!1045008 m!964149))

(declare-fun m!964151 () Bool)

(assert (=> b!1045008 m!964151))

(declare-fun m!964153 () Bool)

(assert (=> b!1045008 m!964153))

(assert (=> b!1045008 m!964151))

(declare-fun m!964155 () Bool)

(assert (=> b!1045008 m!964155))

(declare-fun m!964157 () Bool)

(assert (=> b!1045008 m!964157))

(declare-fun m!964159 () Bool)

(assert (=> b!1045008 m!964159))

(assert (=> b!1045008 m!964155))

(declare-fun m!964161 () Bool)

(assert (=> b!1045008 m!964161))

(declare-fun m!964163 () Bool)

(assert (=> b!1045008 m!964163))

(declare-fun m!964165 () Bool)

(assert (=> b!1045008 m!964165))

(assert (=> b!1045008 m!964139))

(declare-fun m!964167 () Bool)

(assert (=> b!1045008 m!964167))

(declare-fun m!964169 () Bool)

(assert (=> b!1045008 m!964169))

(assert (=> b!1045008 m!964165))

(declare-fun m!964171 () Bool)

(assert (=> b!1045008 m!964171))

(declare-fun m!964173 () Bool)

(assert (=> b!1045008 m!964173))

(declare-fun m!964175 () Bool)

(assert (=> b!1045008 m!964175))

(declare-fun m!964177 () Bool)

(assert (=> b!1045008 m!964177))

(assert (=> b!1045008 m!964161))

(declare-fun m!964179 () Bool)

(assert (=> b!1045008 m!964179))

(declare-fun m!964181 () Bool)

(assert (=> b!1045021 m!964181))

(assert (=> d!126339 m!964021))

(assert (=> b!1045007 m!964139))

(assert (=> b!1045007 m!964139))

(declare-fun m!964183 () Bool)

(assert (=> b!1045007 m!964183))

(declare-fun m!964185 () Bool)

(assert (=> bm!44443 m!964185))

(assert (=> b!1045022 m!964139))

(assert (=> b!1045022 m!964139))

(declare-fun m!964187 () Bool)

(assert (=> b!1045022 m!964187))

(assert (=> b!1045013 m!964139))

(assert (=> b!1045013 m!964139))

(assert (=> b!1045013 m!964183))

(assert (=> bm!44439 m!964177))

(assert (=> b!1044773 d!126339))

(declare-fun b!1045028 () Bool)

(declare-fun e!592330 () (_ BitVec 32))

(declare-fun e!592331 () (_ BitVec 32))

(assert (=> b!1045028 (= e!592330 e!592331)))

(declare-fun c!106204 () Bool)

(assert (=> b!1045028 (= c!106204 (validKeyInArray!0 (select (arr!31650 (_keys!11673 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1045029 () Bool)

(declare-fun call!44448 () (_ BitVec 32))

(assert (=> b!1045029 (= e!592331 call!44448)))

(declare-fun d!126341 () Bool)

(declare-fun lt!461105 () (_ BitVec 32))

(assert (=> d!126341 (and (bvsge lt!461105 #b00000000000000000000000000000000) (bvsle lt!461105 (bvsub (size!32187 (_keys!11673 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126341 (= lt!461105 e!592330)))

(declare-fun c!106205 () Bool)

(assert (=> d!126341 (= c!106205 (bvsge #b00000000000000000000000000000000 (size!32187 (_keys!11673 thiss!1427))))))

(assert (=> d!126341 (and (bvsle #b00000000000000000000000000000000 (size!32187 (_keys!11673 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32187 (_keys!11673 thiss!1427)) (size!32187 (_keys!11673 thiss!1427))))))

(assert (=> d!126341 (= (arrayCountValidKeys!0 (_keys!11673 thiss!1427) #b00000000000000000000000000000000 (size!32187 (_keys!11673 thiss!1427))) lt!461105)))

(declare-fun b!1045030 () Bool)

(assert (=> b!1045030 (= e!592330 #b00000000000000000000000000000000)))

(declare-fun b!1045031 () Bool)

(assert (=> b!1045031 (= e!592331 (bvadd #b00000000000000000000000000000001 call!44448))))

(declare-fun bm!44445 () Bool)

(assert (=> bm!44445 (= call!44448 (arrayCountValidKeys!0 (_keys!11673 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32187 (_keys!11673 thiss!1427))))))

(assert (= (and d!126341 c!106205) b!1045030))

(assert (= (and d!126341 (not c!106205)) b!1045028))

(assert (= (and b!1045028 c!106204) b!1045031))

(assert (= (and b!1045028 (not c!106204)) b!1045029))

(assert (= (or b!1045031 b!1045029) bm!44445))

(assert (=> b!1045028 m!964139))

(assert (=> b!1045028 m!964139))

(assert (=> b!1045028 m!964183))

(declare-fun m!964189 () Bool)

(assert (=> bm!44445 m!964189))

(assert (=> b!1044773 d!126341))

(declare-fun b!1045032 () Bool)

(declare-fun e!592341 () Bool)

(assert (=> b!1045032 (= e!592341 (validKeyInArray!0 (select (arr!31650 (_keys!11673 (_2!7936 lt!460906))) #b00000000000000000000000000000000)))))

(declare-fun bm!44446 () Bool)

(declare-fun call!44450 () Bool)

(declare-fun lt!461119 () ListLongMap!13857)

(assert (=> bm!44446 (= call!44450 (contains!6055 lt!461119 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045033 () Bool)

(declare-fun e!592334 () Unit!34015)

(declare-fun lt!461120 () Unit!34015)

(assert (=> b!1045033 (= e!592334 lt!461120)))

(declare-fun lt!461108 () ListLongMap!13857)

(assert (=> b!1045033 (= lt!461108 (getCurrentListMapNoExtraKeys!3572 (_keys!11673 (_2!7936 lt!460906)) (_values!6432 (_2!7936 lt!460906)) (mask!30523 (_2!7936 lt!460906)) (extraKeys!6137 (_2!7936 lt!460906)) (zeroValue!6243 (_2!7936 lt!460906)) (minValue!6243 (_2!7936 lt!460906)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7936 lt!460906))))))

(declare-fun lt!461107 () (_ BitVec 64))

(assert (=> b!1045033 (= lt!461107 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461106 () (_ BitVec 64))

(assert (=> b!1045033 (= lt!461106 (select (arr!31650 (_keys!11673 (_2!7936 lt!460906))) #b00000000000000000000000000000000))))

(declare-fun lt!461114 () Unit!34015)

(assert (=> b!1045033 (= lt!461114 (addStillContains!625 lt!461108 lt!461107 (zeroValue!6243 (_2!7936 lt!460906)) lt!461106))))

(assert (=> b!1045033 (contains!6055 (+!3137 lt!461108 (tuple2!15853 lt!461107 (zeroValue!6243 (_2!7936 lt!460906)))) lt!461106)))

(declare-fun lt!461127 () Unit!34015)

(assert (=> b!1045033 (= lt!461127 lt!461114)))

(declare-fun lt!461121 () ListLongMap!13857)

(assert (=> b!1045033 (= lt!461121 (getCurrentListMapNoExtraKeys!3572 (_keys!11673 (_2!7936 lt!460906)) (_values!6432 (_2!7936 lt!460906)) (mask!30523 (_2!7936 lt!460906)) (extraKeys!6137 (_2!7936 lt!460906)) (zeroValue!6243 (_2!7936 lt!460906)) (minValue!6243 (_2!7936 lt!460906)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7936 lt!460906))))))

(declare-fun lt!461126 () (_ BitVec 64))

(assert (=> b!1045033 (= lt!461126 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461110 () (_ BitVec 64))

(assert (=> b!1045033 (= lt!461110 (select (arr!31650 (_keys!11673 (_2!7936 lt!460906))) #b00000000000000000000000000000000))))

(declare-fun lt!461117 () Unit!34015)

(assert (=> b!1045033 (= lt!461117 (addApplyDifferent!481 lt!461121 lt!461126 (minValue!6243 (_2!7936 lt!460906)) lt!461110))))

(assert (=> b!1045033 (= (apply!906 (+!3137 lt!461121 (tuple2!15853 lt!461126 (minValue!6243 (_2!7936 lt!460906)))) lt!461110) (apply!906 lt!461121 lt!461110))))

(declare-fun lt!461123 () Unit!34015)

(assert (=> b!1045033 (= lt!461123 lt!461117)))

(declare-fun lt!461122 () ListLongMap!13857)

(assert (=> b!1045033 (= lt!461122 (getCurrentListMapNoExtraKeys!3572 (_keys!11673 (_2!7936 lt!460906)) (_values!6432 (_2!7936 lt!460906)) (mask!30523 (_2!7936 lt!460906)) (extraKeys!6137 (_2!7936 lt!460906)) (zeroValue!6243 (_2!7936 lt!460906)) (minValue!6243 (_2!7936 lt!460906)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7936 lt!460906))))))

(declare-fun lt!461113 () (_ BitVec 64))

(assert (=> b!1045033 (= lt!461113 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461112 () (_ BitVec 64))

(assert (=> b!1045033 (= lt!461112 (select (arr!31650 (_keys!11673 (_2!7936 lt!460906))) #b00000000000000000000000000000000))))

(declare-fun lt!461124 () Unit!34015)

(assert (=> b!1045033 (= lt!461124 (addApplyDifferent!481 lt!461122 lt!461113 (zeroValue!6243 (_2!7936 lt!460906)) lt!461112))))

(assert (=> b!1045033 (= (apply!906 (+!3137 lt!461122 (tuple2!15853 lt!461113 (zeroValue!6243 (_2!7936 lt!460906)))) lt!461112) (apply!906 lt!461122 lt!461112))))

(declare-fun lt!461111 () Unit!34015)

(assert (=> b!1045033 (= lt!461111 lt!461124)))

(declare-fun lt!461118 () ListLongMap!13857)

(assert (=> b!1045033 (= lt!461118 (getCurrentListMapNoExtraKeys!3572 (_keys!11673 (_2!7936 lt!460906)) (_values!6432 (_2!7936 lt!460906)) (mask!30523 (_2!7936 lt!460906)) (extraKeys!6137 (_2!7936 lt!460906)) (zeroValue!6243 (_2!7936 lt!460906)) (minValue!6243 (_2!7936 lt!460906)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7936 lt!460906))))))

(declare-fun lt!461109 () (_ BitVec 64))

(assert (=> b!1045033 (= lt!461109 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461116 () (_ BitVec 64))

(assert (=> b!1045033 (= lt!461116 (select (arr!31650 (_keys!11673 (_2!7936 lt!460906))) #b00000000000000000000000000000000))))

(assert (=> b!1045033 (= lt!461120 (addApplyDifferent!481 lt!461118 lt!461109 (minValue!6243 (_2!7936 lt!460906)) lt!461116))))

(assert (=> b!1045033 (= (apply!906 (+!3137 lt!461118 (tuple2!15853 lt!461109 (minValue!6243 (_2!7936 lt!460906)))) lt!461116) (apply!906 lt!461118 lt!461116))))

(declare-fun bm!44447 () Bool)

(declare-fun call!44455 () ListLongMap!13857)

(assert (=> bm!44447 (= call!44455 (getCurrentListMapNoExtraKeys!3572 (_keys!11673 (_2!7936 lt!460906)) (_values!6432 (_2!7936 lt!460906)) (mask!30523 (_2!7936 lt!460906)) (extraKeys!6137 (_2!7936 lt!460906)) (zeroValue!6243 (_2!7936 lt!460906)) (minValue!6243 (_2!7936 lt!460906)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7936 lt!460906))))))

(declare-fun b!1045034 () Bool)

(declare-fun e!592343 () Bool)

(assert (=> b!1045034 (= e!592343 (not call!44450))))

(declare-fun b!1045035 () Bool)

(declare-fun e!592337 () Bool)

(declare-fun e!592332 () Bool)

(assert (=> b!1045035 (= e!592337 e!592332)))

(declare-fun res!695922 () Bool)

(declare-fun call!44451 () Bool)

(assert (=> b!1045035 (= res!695922 call!44451)))

(assert (=> b!1045035 (=> (not res!695922) (not e!592332))))

(declare-fun bm!44448 () Bool)

(assert (=> bm!44448 (= call!44451 (contains!6055 lt!461119 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045036 () Bool)

(declare-fun res!695920 () Bool)

(declare-fun e!592344 () Bool)

(assert (=> b!1045036 (=> (not res!695920) (not e!592344))))

(declare-fun e!592335 () Bool)

(assert (=> b!1045036 (= res!695920 e!592335)))

(declare-fun res!695916 () Bool)

(assert (=> b!1045036 (=> res!695916 e!592335)))

(declare-fun e!592333 () Bool)

(assert (=> b!1045036 (= res!695916 (not e!592333))))

(declare-fun res!695919 () Bool)

(assert (=> b!1045036 (=> (not res!695919) (not e!592333))))

(assert (=> b!1045036 (= res!695919 (bvslt #b00000000000000000000000000000000 (size!32187 (_keys!11673 (_2!7936 lt!460906)))))))

(declare-fun d!126343 () Bool)

(assert (=> d!126343 e!592344))

(declare-fun res!695917 () Bool)

(assert (=> d!126343 (=> (not res!695917) (not e!592344))))

(assert (=> d!126343 (= res!695917 (or (bvsge #b00000000000000000000000000000000 (size!32187 (_keys!11673 (_2!7936 lt!460906)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32187 (_keys!11673 (_2!7936 lt!460906)))))))))

(declare-fun lt!461115 () ListLongMap!13857)

(assert (=> d!126343 (= lt!461119 lt!461115)))

(declare-fun lt!461125 () Unit!34015)

(assert (=> d!126343 (= lt!461125 e!592334)))

(declare-fun c!106210 () Bool)

(assert (=> d!126343 (= c!106210 e!592341)))

(declare-fun res!695921 () Bool)

(assert (=> d!126343 (=> (not res!695921) (not e!592341))))

(assert (=> d!126343 (= res!695921 (bvslt #b00000000000000000000000000000000 (size!32187 (_keys!11673 (_2!7936 lt!460906)))))))

(declare-fun e!592340 () ListLongMap!13857)

(assert (=> d!126343 (= lt!461115 e!592340)))

(declare-fun c!106211 () Bool)

(assert (=> d!126343 (= c!106211 (and (not (= (bvand (extraKeys!6137 (_2!7936 lt!460906)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6137 (_2!7936 lt!460906)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126343 (validMask!0 (mask!30523 (_2!7936 lt!460906)))))

(assert (=> d!126343 (= (getCurrentListMap!3910 (_keys!11673 (_2!7936 lt!460906)) (_values!6432 (_2!7936 lt!460906)) (mask!30523 (_2!7936 lt!460906)) (extraKeys!6137 (_2!7936 lt!460906)) (zeroValue!6243 (_2!7936 lt!460906)) (minValue!6243 (_2!7936 lt!460906)) #b00000000000000000000000000000000 (defaultEntry!6409 (_2!7936 lt!460906))) lt!461119)))

(declare-fun bm!44449 () Bool)

(declare-fun call!44449 () ListLongMap!13857)

(assert (=> bm!44449 (= call!44449 call!44455)))

(declare-fun b!1045037 () Bool)

(assert (=> b!1045037 (= e!592344 e!592337)))

(declare-fun c!106208 () Bool)

(assert (=> b!1045037 (= c!106208 (not (= (bvand (extraKeys!6137 (_2!7936 lt!460906)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44450 () Bool)

(declare-fun call!44453 () ListLongMap!13857)

(declare-fun call!44454 () ListLongMap!13857)

(assert (=> bm!44450 (= call!44453 call!44454)))

(declare-fun b!1045038 () Bool)

(assert (=> b!1045038 (= e!592333 (validKeyInArray!0 (select (arr!31650 (_keys!11673 (_2!7936 lt!460906))) #b00000000000000000000000000000000)))))

(declare-fun b!1045039 () Bool)

(assert (=> b!1045039 (= e!592337 (not call!44451))))

(declare-fun b!1045040 () Bool)

(declare-fun e!592342 () Bool)

(assert (=> b!1045040 (= e!592342 (= (apply!906 lt!461119 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6243 (_2!7936 lt!460906))))))

(declare-fun b!1045041 () Bool)

(declare-fun e!592336 () Bool)

(assert (=> b!1045041 (= e!592336 (= (apply!906 lt!461119 (select (arr!31650 (_keys!11673 (_2!7936 lt!460906))) #b00000000000000000000000000000000)) (get!16551 (select (arr!31651 (_values!6432 (_2!7936 lt!460906))) #b00000000000000000000000000000000) (dynLambda!1997 (defaultEntry!6409 (_2!7936 lt!460906)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045041 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32188 (_values!6432 (_2!7936 lt!460906)))))))

(assert (=> b!1045041 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32187 (_keys!11673 (_2!7936 lt!460906)))))))

(declare-fun b!1045042 () Bool)

(declare-fun e!592339 () ListLongMap!13857)

(assert (=> b!1045042 (= e!592339 call!44453)))

(declare-fun b!1045043 () Bool)

(assert (=> b!1045043 (= e!592340 e!592339)))

(declare-fun c!106209 () Bool)

(assert (=> b!1045043 (= c!106209 (and (not (= (bvand (extraKeys!6137 (_2!7936 lt!460906)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6137 (_2!7936 lt!460906)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045044 () Bool)

(declare-fun c!106207 () Bool)

(assert (=> b!1045044 (= c!106207 (and (not (= (bvand (extraKeys!6137 (_2!7936 lt!460906)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6137 (_2!7936 lt!460906)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!592338 () ListLongMap!13857)

(assert (=> b!1045044 (= e!592339 e!592338)))

(declare-fun b!1045045 () Bool)

(declare-fun res!695923 () Bool)

(assert (=> b!1045045 (=> (not res!695923) (not e!592344))))

(assert (=> b!1045045 (= res!695923 e!592343)))

(declare-fun c!106206 () Bool)

(assert (=> b!1045045 (= c!106206 (not (= (bvand (extraKeys!6137 (_2!7936 lt!460906)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!44451 () Bool)

(declare-fun call!44452 () ListLongMap!13857)

(assert (=> bm!44451 (= call!44454 (+!3137 (ite c!106211 call!44455 (ite c!106209 call!44449 call!44452)) (ite (or c!106211 c!106209) (tuple2!15853 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6243 (_2!7936 lt!460906))) (tuple2!15853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6243 (_2!7936 lt!460906))))))))

(declare-fun bm!44452 () Bool)

(assert (=> bm!44452 (= call!44452 call!44449)))

(declare-fun b!1045046 () Bool)

(assert (=> b!1045046 (= e!592332 (= (apply!906 lt!461119 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6243 (_2!7936 lt!460906))))))

(declare-fun b!1045047 () Bool)

(assert (=> b!1045047 (= e!592335 e!592336)))

(declare-fun res!695924 () Bool)

(assert (=> b!1045047 (=> (not res!695924) (not e!592336))))

(assert (=> b!1045047 (= res!695924 (contains!6055 lt!461119 (select (arr!31650 (_keys!11673 (_2!7936 lt!460906))) #b00000000000000000000000000000000)))))

(assert (=> b!1045047 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32187 (_keys!11673 (_2!7936 lt!460906)))))))

(declare-fun b!1045048 () Bool)

(assert (=> b!1045048 (= e!592343 e!592342)))

(declare-fun res!695918 () Bool)

(assert (=> b!1045048 (= res!695918 call!44450)))

(assert (=> b!1045048 (=> (not res!695918) (not e!592342))))

(declare-fun b!1045049 () Bool)

(assert (=> b!1045049 (= e!592340 (+!3137 call!44454 (tuple2!15853 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6243 (_2!7936 lt!460906)))))))

(declare-fun b!1045050 () Bool)

(assert (=> b!1045050 (= e!592338 call!44452)))

(declare-fun b!1045051 () Bool)

(assert (=> b!1045051 (= e!592338 call!44453)))

(declare-fun b!1045052 () Bool)

(declare-fun Unit!34022 () Unit!34015)

(assert (=> b!1045052 (= e!592334 Unit!34022)))

(assert (= (and d!126343 c!106211) b!1045049))

(assert (= (and d!126343 (not c!106211)) b!1045043))

(assert (= (and b!1045043 c!106209) b!1045042))

(assert (= (and b!1045043 (not c!106209)) b!1045044))

(assert (= (and b!1045044 c!106207) b!1045051))

(assert (= (and b!1045044 (not c!106207)) b!1045050))

(assert (= (or b!1045051 b!1045050) bm!44452))

(assert (= (or b!1045042 bm!44452) bm!44449))

(assert (= (or b!1045042 b!1045051) bm!44450))

(assert (= (or b!1045049 bm!44449) bm!44447))

(assert (= (or b!1045049 bm!44450) bm!44451))

(assert (= (and d!126343 res!695921) b!1045032))

(assert (= (and d!126343 c!106210) b!1045033))

(assert (= (and d!126343 (not c!106210)) b!1045052))

(assert (= (and d!126343 res!695917) b!1045036))

(assert (= (and b!1045036 res!695919) b!1045038))

(assert (= (and b!1045036 (not res!695916)) b!1045047))

(assert (= (and b!1045047 res!695924) b!1045041))

(assert (= (and b!1045036 res!695920) b!1045045))

(assert (= (and b!1045045 c!106206) b!1045048))

(assert (= (and b!1045045 (not c!106206)) b!1045034))

(assert (= (and b!1045048 res!695918) b!1045040))

(assert (= (or b!1045048 b!1045034) bm!44446))

(assert (= (and b!1045045 res!695923) b!1045037))

(assert (= (and b!1045037 c!106208) b!1045035))

(assert (= (and b!1045037 (not c!106208)) b!1045039))

(assert (= (and b!1045035 res!695922) b!1045046))

(assert (= (or b!1045035 b!1045039) bm!44448))

(declare-fun b_lambda!16255 () Bool)

(assert (=> (not b_lambda!16255) (not b!1045041)))

(declare-fun tb!7071 () Bool)

(declare-fun t!31300 () Bool)

(assert (=> (and b!1044774 (= (defaultEntry!6409 thiss!1427) (defaultEntry!6409 (_2!7936 lt!460906))) t!31300) tb!7071))

(declare-fun result!14575 () Bool)

(assert (=> tb!7071 (= result!14575 tp_is_empty!24847)))

(assert (=> b!1045041 t!31300))

(declare-fun b_and!33717 () Bool)

(assert (= b_and!33715 (and (=> t!31300 result!14575) b_and!33717)))

(declare-fun m!964191 () Bool)

(assert (=> bm!44448 m!964191))

(declare-fun m!964193 () Bool)

(assert (=> b!1045049 m!964193))

(declare-fun m!964195 () Bool)

(assert (=> b!1045041 m!964195))

(declare-fun m!964197 () Bool)

(assert (=> b!1045041 m!964197))

(declare-fun m!964199 () Bool)

(assert (=> b!1045041 m!964199))

(assert (=> b!1045041 m!964195))

(declare-fun m!964201 () Bool)

(assert (=> b!1045041 m!964201))

(declare-fun m!964203 () Bool)

(assert (=> b!1045041 m!964203))

(assert (=> b!1045041 m!964201))

(assert (=> b!1045041 m!964197))

(declare-fun m!964205 () Bool)

(assert (=> b!1045040 m!964205))

(declare-fun m!964207 () Bool)

(assert (=> bm!44446 m!964207))

(declare-fun m!964209 () Bool)

(assert (=> b!1045033 m!964209))

(declare-fun m!964211 () Bool)

(assert (=> b!1045033 m!964211))

(declare-fun m!964213 () Bool)

(assert (=> b!1045033 m!964213))

(assert (=> b!1045033 m!964211))

(declare-fun m!964215 () Bool)

(assert (=> b!1045033 m!964215))

(declare-fun m!964217 () Bool)

(assert (=> b!1045033 m!964217))

(declare-fun m!964219 () Bool)

(assert (=> b!1045033 m!964219))

(assert (=> b!1045033 m!964215))

(declare-fun m!964221 () Bool)

(assert (=> b!1045033 m!964221))

(declare-fun m!964223 () Bool)

(assert (=> b!1045033 m!964223))

(declare-fun m!964225 () Bool)

(assert (=> b!1045033 m!964225))

(assert (=> b!1045033 m!964197))

(declare-fun m!964227 () Bool)

(assert (=> b!1045033 m!964227))

(declare-fun m!964229 () Bool)

(assert (=> b!1045033 m!964229))

(assert (=> b!1045033 m!964225))

(declare-fun m!964231 () Bool)

(assert (=> b!1045033 m!964231))

(declare-fun m!964233 () Bool)

(assert (=> b!1045033 m!964233))

(declare-fun m!964235 () Bool)

(assert (=> b!1045033 m!964235))

(declare-fun m!964237 () Bool)

(assert (=> b!1045033 m!964237))

(assert (=> b!1045033 m!964221))

(declare-fun m!964239 () Bool)

(assert (=> b!1045033 m!964239))

(declare-fun m!964241 () Bool)

(assert (=> b!1045046 m!964241))

(assert (=> d!126343 m!963905))

(assert (=> b!1045032 m!964197))

(assert (=> b!1045032 m!964197))

(declare-fun m!964243 () Bool)

(assert (=> b!1045032 m!964243))

(declare-fun m!964245 () Bool)

(assert (=> bm!44451 m!964245))

(assert (=> b!1045047 m!964197))

(assert (=> b!1045047 m!964197))

(declare-fun m!964247 () Bool)

(assert (=> b!1045047 m!964247))

(assert (=> b!1045038 m!964197))

(assert (=> b!1045038 m!964197))

(assert (=> b!1045038 m!964243))

(assert (=> bm!44447 m!964237))

(assert (=> b!1044773 d!126343))

(declare-fun d!126345 () Bool)

(assert (=> d!126345 (= (array_inv!24459 (_keys!11673 thiss!1427)) (bvsge (size!32187 (_keys!11673 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044774 d!126345))

(declare-fun d!126347 () Bool)

(assert (=> d!126347 (= (array_inv!24460 (_values!6432 thiss!1427)) (bvsge (size!32188 (_values!6432 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044774 d!126347))

(declare-fun b!1045060 () Bool)

(declare-fun e!592350 () Bool)

(assert (=> b!1045060 (= e!592350 tp_is_empty!24847)))

(declare-fun b!1045059 () Bool)

(declare-fun e!592349 () Bool)

(assert (=> b!1045059 (= e!592349 tp_is_empty!24847)))

(declare-fun condMapEmpty!38915 () Bool)

(declare-fun mapDefault!38915 () ValueCell!11720)

(assert (=> mapNonEmpty!38906 (= condMapEmpty!38915 (= mapRest!38906 ((as const (Array (_ BitVec 32) ValueCell!11720)) mapDefault!38915)))))

(declare-fun mapRes!38915 () Bool)

(assert (=> mapNonEmpty!38906 (= tp!74634 (and e!592350 mapRes!38915))))

(declare-fun mapIsEmpty!38915 () Bool)

(assert (=> mapIsEmpty!38915 mapRes!38915))

(declare-fun mapNonEmpty!38915 () Bool)

(declare-fun tp!74649 () Bool)

(assert (=> mapNonEmpty!38915 (= mapRes!38915 (and tp!74649 e!592349))))

(declare-fun mapValue!38915 () ValueCell!11720)

(declare-fun mapRest!38915 () (Array (_ BitVec 32) ValueCell!11720))

(declare-fun mapKey!38915 () (_ BitVec 32))

(assert (=> mapNonEmpty!38915 (= mapRest!38906 (store mapRest!38915 mapKey!38915 mapValue!38915))))

(assert (= (and mapNonEmpty!38906 condMapEmpty!38915) mapIsEmpty!38915))

(assert (= (and mapNonEmpty!38906 (not condMapEmpty!38915)) mapNonEmpty!38915))

(assert (= (and mapNonEmpty!38915 ((_ is ValueCellFull!11720) mapValue!38915)) b!1045059))

(assert (= (and mapNonEmpty!38906 ((_ is ValueCellFull!11720) mapDefault!38915)) b!1045060))

(declare-fun m!964249 () Bool)

(assert (=> mapNonEmpty!38915 m!964249))

(declare-fun b_lambda!16257 () Bool)

(assert (= b_lambda!16253 (or (and b!1044774 b_free!21127) b_lambda!16257)))

(declare-fun b_lambda!16259 () Bool)

(assert (= b_lambda!16251 (or (and b!1044774 b_free!21127) b_lambda!16259)))

(declare-fun b_lambda!16261 () Bool)

(assert (= b_lambda!16249 (or (and b!1044774 b_free!21127) b_lambda!16261)))

(check-sat (not b!1044952) (not b!1044845) (not bm!44424) (not b!1045022) (not bm!44446) (not b!1044921) (not bm!44422) (not bm!44443) (not d!126339) (not bm!44427) (not b!1045041) (not b!1044920) (not b!1044860) (not d!126321) (not bm!44440) (not b!1044875) (not b!1044934) (not b!1044973) (not b!1044935) (not b!1045032) (not b!1044926) (not b!1044954) (not b!1044970) (not b!1044847) (not b_lambda!16247) (not bm!44445) (not bm!44448) (not b!1044986) (not b!1044943) (not b!1045028) (not b!1045015) (not b!1045049) (not b!1044997) (not bm!44434) (not mapNonEmpty!38915) (not b_next!21127) (not d!126343) (not bm!44423) (not bm!44431) (not b!1044928) (not d!126329) (not b!1045040) (not b!1044958) (not b!1044846) (not b!1045008) (not b!1044929) (not b_lambda!16255) (not b!1044965) (not b!1045024) (not b_lambda!16257) (not d!126311) (not b!1045007) (not bm!44439) (not bm!44451) (not b!1045016) (not b!1045006) (not bm!44437) (not b!1045046) (not b!1045047) (not d!126317) (not b!1044967) (not b!1044984) (not d!126325) b_and!33717 (not b_lambda!16261) (not b!1044877) (not d!126315) (not b!1045033) (not b!1045038) (not b!1045013) (not bm!44438) (not d!126331) (not bm!44447) (not d!126319) (not d!126327) (not b!1044937) (not b_lambda!16259) (not d!126309) (not b!1044874) tp_is_empty!24847 (not b!1044987) (not b!1045021))
(check-sat b_and!33717 (not b_next!21127))
