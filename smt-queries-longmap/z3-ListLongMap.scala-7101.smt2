; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90050 () Bool)

(assert start!90050)

(declare-fun b!1031230 () Bool)

(declare-fun b_free!20659 () Bool)

(declare-fun b_next!20659 () Bool)

(assert (=> b!1031230 (= b_free!20659 (not b_next!20659))))

(declare-fun tp!73047 () Bool)

(declare-fun b_and!33059 () Bool)

(assert (=> b!1031230 (= tp!73047 b_and!33059)))

(declare-fun b!1031226 () Bool)

(declare-fun e!582428 () Bool)

(declare-fun e!582434 () Bool)

(assert (=> b!1031226 (= e!582428 (not e!582434))))

(declare-fun res!689543 () Bool)

(assert (=> b!1031226 (=> res!689543 e!582434)))

(declare-datatypes ((V!37379 0))(
  ( (V!37380 (val!12240 Int)) )
))
(declare-datatypes ((ValueCell!11486 0))(
  ( (ValueCellFull!11486 (v!14816 V!37379)) (EmptyCell!11486) )
))
(declare-datatypes ((Unit!33619 0))(
  ( (Unit!33620) )
))
(declare-datatypes ((array!64761 0))(
  ( (array!64762 (arr!31182 (Array (_ BitVec 32) (_ BitVec 64))) (size!31701 (_ BitVec 32))) )
))
(declare-datatypes ((array!64763 0))(
  ( (array!64764 (arr!31183 (Array (_ BitVec 32) ValueCell!11486)) (size!31702 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5566 0))(
  ( (LongMapFixedSize!5567 (defaultEntry!6157 Int) (mask!29948 (_ BitVec 32)) (extraKeys!5889 (_ BitVec 32)) (zeroValue!5993 V!37379) (minValue!5993 V!37379) (_size!2838 (_ BitVec 32)) (_keys!11326 array!64761) (_values!6180 array!64763) (_vacant!2838 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15742 0))(
  ( (tuple2!15743 (_1!7882 Unit!33619) (_2!7882 LongMapFixedSize!5566)) )
))
(declare-fun lt!455114 () tuple2!15742)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15744 0))(
  ( (tuple2!15745 (_1!7883 (_ BitVec 64)) (_2!7883 V!37379)) )
))
(declare-datatypes ((List!21900 0))(
  ( (Nil!21897) (Cons!21896 (h!23098 tuple2!15744) (t!31045 List!21900)) )
))
(declare-datatypes ((ListLongMap!13799 0))(
  ( (ListLongMap!13800 (toList!6915 List!21900)) )
))
(declare-fun contains!5971 (ListLongMap!13799 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3882 (array!64761 array!64763 (_ BitVec 32) (_ BitVec 32) V!37379 V!37379 (_ BitVec 32) Int) ListLongMap!13799)

(assert (=> b!1031226 (= res!689543 (not (contains!5971 (getCurrentListMap!3882 (_keys!11326 (_2!7882 lt!455114)) (_values!6180 (_2!7882 lt!455114)) (mask!29948 (_2!7882 lt!455114)) (extraKeys!5889 (_2!7882 lt!455114)) (zeroValue!5993 (_2!7882 lt!455114)) (minValue!5993 (_2!7882 lt!455114)) #b00000000000000000000000000000000 (defaultEntry!6157 (_2!7882 lt!455114))) key!909)))))

(declare-fun lt!455118 () array!64763)

(declare-fun lt!455112 () array!64761)

(declare-fun thiss!1427 () LongMapFixedSize!5566)

(declare-fun Unit!33621 () Unit!33619)

(declare-fun Unit!33622 () Unit!33619)

(assert (=> b!1031226 (= lt!455114 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2838 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15743 Unit!33621 (LongMapFixedSize!5567 (defaultEntry!6157 thiss!1427) (mask!29948 thiss!1427) (extraKeys!5889 thiss!1427) (zeroValue!5993 thiss!1427) (minValue!5993 thiss!1427) (bvsub (_size!2838 thiss!1427) #b00000000000000000000000000000001) lt!455112 lt!455118 (bvadd #b00000000000000000000000000000001 (_vacant!2838 thiss!1427)))) (tuple2!15743 Unit!33622 (LongMapFixedSize!5567 (defaultEntry!6157 thiss!1427) (mask!29948 thiss!1427) (extraKeys!5889 thiss!1427) (zeroValue!5993 thiss!1427) (minValue!5993 thiss!1427) (bvsub (_size!2838 thiss!1427) #b00000000000000000000000000000001) lt!455112 lt!455118 (_vacant!2838 thiss!1427)))))))

(declare-fun -!507 (ListLongMap!13799 (_ BitVec 64)) ListLongMap!13799)

(assert (=> b!1031226 (= (-!507 (getCurrentListMap!3882 (_keys!11326 thiss!1427) (_values!6180 thiss!1427) (mask!29948 thiss!1427) (extraKeys!5889 thiss!1427) (zeroValue!5993 thiss!1427) (minValue!5993 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6157 thiss!1427)) key!909) (getCurrentListMap!3882 lt!455112 lt!455118 (mask!29948 thiss!1427) (extraKeys!5889 thiss!1427) (zeroValue!5993 thiss!1427) (minValue!5993 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6157 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9696 0))(
  ( (MissingZero!9696 (index!41155 (_ BitVec 32))) (Found!9696 (index!41156 (_ BitVec 32))) (Intermediate!9696 (undefined!10508 Bool) (index!41157 (_ BitVec 32)) (x!91829 (_ BitVec 32))) (Undefined!9696) (MissingVacant!9696 (index!41158 (_ BitVec 32))) )
))
(declare-fun lt!455115 () SeekEntryResult!9696)

(declare-fun dynLambda!1969 (Int (_ BitVec 64)) V!37379)

(assert (=> b!1031226 (= lt!455118 (array!64764 (store (arr!31183 (_values!6180 thiss!1427)) (index!41156 lt!455115) (ValueCellFull!11486 (dynLambda!1969 (defaultEntry!6157 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31702 (_values!6180 thiss!1427))))))

(declare-fun lt!455119 () Unit!33619)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!32 (array!64761 array!64763 (_ BitVec 32) (_ BitVec 32) V!37379 V!37379 (_ BitVec 32) (_ BitVec 64) Int) Unit!33619)

(assert (=> b!1031226 (= lt!455119 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!32 (_keys!11326 thiss!1427) (_values!6180 thiss!1427) (mask!29948 thiss!1427) (extraKeys!5889 thiss!1427) (zeroValue!5993 thiss!1427) (minValue!5993 thiss!1427) (index!41156 lt!455115) key!909 (defaultEntry!6157 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031226 (not (arrayContainsKey!0 lt!455112 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455116 () Unit!33619)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64761 (_ BitVec 32) (_ BitVec 64)) Unit!33619)

(assert (=> b!1031226 (= lt!455116 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11326 thiss!1427) (index!41156 lt!455115) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64761 (_ BitVec 32)) Bool)

(assert (=> b!1031226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455112 (mask!29948 thiss!1427))))

(declare-fun lt!455121 () Unit!33619)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64761 (_ BitVec 32) (_ BitVec 32)) Unit!33619)

(assert (=> b!1031226 (= lt!455121 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11326 thiss!1427) (index!41156 lt!455115) (mask!29948 thiss!1427)))))

(declare-datatypes ((List!21901 0))(
  ( (Nil!21898) (Cons!21897 (h!23099 (_ BitVec 64)) (t!31046 List!21901)) )
))
(declare-fun arrayNoDuplicates!0 (array!64761 (_ BitVec 32) List!21901) Bool)

(assert (=> b!1031226 (arrayNoDuplicates!0 lt!455112 #b00000000000000000000000000000000 Nil!21898)))

(declare-fun lt!455117 () Unit!33619)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64761 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21901) Unit!33619)

(assert (=> b!1031226 (= lt!455117 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11326 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41156 lt!455115) #b00000000000000000000000000000000 Nil!21898))))

(declare-fun arrayCountValidKeys!0 (array!64761 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031226 (= (arrayCountValidKeys!0 lt!455112 #b00000000000000000000000000000000 (size!31701 (_keys!11326 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11326 thiss!1427) #b00000000000000000000000000000000 (size!31701 (_keys!11326 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031226 (= lt!455112 (array!64762 (store (arr!31182 (_keys!11326 thiss!1427)) (index!41156 lt!455115) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31701 (_keys!11326 thiss!1427))))))

(declare-fun lt!455120 () Unit!33619)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64761 (_ BitVec 32) (_ BitVec 64)) Unit!33619)

(assert (=> b!1031226 (= lt!455120 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11326 thiss!1427) (index!41156 lt!455115) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031227 () Bool)

(declare-fun res!689546 () Bool)

(assert (=> b!1031227 (=> res!689546 e!582434)))

(assert (=> b!1031227 (= res!689546 (or (not (= (size!31702 (_values!6180 (_2!7882 lt!455114))) (bvadd #b00000000000000000000000000000001 (mask!29948 (_2!7882 lt!455114))))) (not (= (size!31701 (_keys!11326 (_2!7882 lt!455114))) (size!31702 (_values!6180 (_2!7882 lt!455114))))) (bvslt (mask!29948 (_2!7882 lt!455114)) #b00000000000000000000000000000000) (bvslt (extraKeys!5889 (_2!7882 lt!455114)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5889 (_2!7882 lt!455114)) #b00000000000000000000000000000011)))))

(declare-fun b!1031228 () Bool)

(assert (=> b!1031228 (= e!582434 true)))

(declare-fun lt!455113 () Bool)

(assert (=> b!1031228 (= lt!455113 (arrayNoDuplicates!0 (_keys!11326 (_2!7882 lt!455114)) #b00000000000000000000000000000000 Nil!21898))))

(declare-fun b!1031229 () Bool)

(declare-fun e!582427 () Bool)

(declare-fun e!582430 () Bool)

(declare-fun mapRes!38022 () Bool)

(assert (=> b!1031229 (= e!582427 (and e!582430 mapRes!38022))))

(declare-fun condMapEmpty!38022 () Bool)

(declare-fun mapDefault!38022 () ValueCell!11486)

(assert (=> b!1031229 (= condMapEmpty!38022 (= (arr!31183 (_values!6180 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11486)) mapDefault!38022)))))

(declare-fun e!582429 () Bool)

(declare-fun tp_is_empty!24379 () Bool)

(declare-fun array_inv!24139 (array!64761) Bool)

(declare-fun array_inv!24140 (array!64763) Bool)

(assert (=> b!1031230 (= e!582429 (and tp!73047 tp_is_empty!24379 (array_inv!24139 (_keys!11326 thiss!1427)) (array_inv!24140 (_values!6180 thiss!1427)) e!582427))))

(declare-fun res!689547 () Bool)

(declare-fun e!582433 () Bool)

(assert (=> start!90050 (=> (not res!689547) (not e!582433))))

(declare-fun valid!2098 (LongMapFixedSize!5566) Bool)

(assert (=> start!90050 (= res!689547 (valid!2098 thiss!1427))))

(assert (=> start!90050 e!582433))

(assert (=> start!90050 e!582429))

(assert (=> start!90050 true))

(declare-fun mapNonEmpty!38022 () Bool)

(declare-fun tp!73048 () Bool)

(declare-fun e!582431 () Bool)

(assert (=> mapNonEmpty!38022 (= mapRes!38022 (and tp!73048 e!582431))))

(declare-fun mapKey!38022 () (_ BitVec 32))

(declare-fun mapValue!38022 () ValueCell!11486)

(declare-fun mapRest!38022 () (Array (_ BitVec 32) ValueCell!11486))

(assert (=> mapNonEmpty!38022 (= (arr!31183 (_values!6180 thiss!1427)) (store mapRest!38022 mapKey!38022 mapValue!38022))))

(declare-fun b!1031231 () Bool)

(declare-fun res!689548 () Bool)

(assert (=> b!1031231 (=> res!689548 e!582434)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031231 (= res!689548 (not (validMask!0 (mask!29948 (_2!7882 lt!455114)))))))

(declare-fun b!1031232 () Bool)

(assert (=> b!1031232 (= e!582431 tp_is_empty!24379)))

(declare-fun b!1031233 () Bool)

(declare-fun res!689542 () Bool)

(assert (=> b!1031233 (=> res!689542 e!582434)))

(assert (=> b!1031233 (= res!689542 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11326 (_2!7882 lt!455114)) (mask!29948 (_2!7882 lt!455114)))))))

(declare-fun b!1031234 () Bool)

(declare-fun res!689544 () Bool)

(assert (=> b!1031234 (=> (not res!689544) (not e!582433))))

(assert (=> b!1031234 (= res!689544 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1031235 () Bool)

(assert (=> b!1031235 (= e!582433 e!582428)))

(declare-fun res!689545 () Bool)

(assert (=> b!1031235 (=> (not res!689545) (not e!582428))))

(get-info :version)

(assert (=> b!1031235 (= res!689545 ((_ is Found!9696) lt!455115))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64761 (_ BitVec 32)) SeekEntryResult!9696)

(assert (=> b!1031235 (= lt!455115 (seekEntry!0 key!909 (_keys!11326 thiss!1427) (mask!29948 thiss!1427)))))

(declare-fun b!1031236 () Bool)

(assert (=> b!1031236 (= e!582430 tp_is_empty!24379)))

(declare-fun mapIsEmpty!38022 () Bool)

(assert (=> mapIsEmpty!38022 mapRes!38022))

(assert (= (and start!90050 res!689547) b!1031234))

(assert (= (and b!1031234 res!689544) b!1031235))

(assert (= (and b!1031235 res!689545) b!1031226))

(assert (= (and b!1031226 (not res!689543)) b!1031231))

(assert (= (and b!1031231 (not res!689548)) b!1031227))

(assert (= (and b!1031227 (not res!689546)) b!1031233))

(assert (= (and b!1031233 (not res!689542)) b!1031228))

(assert (= (and b!1031229 condMapEmpty!38022) mapIsEmpty!38022))

(assert (= (and b!1031229 (not condMapEmpty!38022)) mapNonEmpty!38022))

(assert (= (and mapNonEmpty!38022 ((_ is ValueCellFull!11486) mapValue!38022)) b!1031232))

(assert (= (and b!1031229 ((_ is ValueCellFull!11486) mapDefault!38022)) b!1031236))

(assert (= b!1031230 b!1031229))

(assert (= start!90050 b!1031230))

(declare-fun b_lambda!15981 () Bool)

(assert (=> (not b_lambda!15981) (not b!1031226)))

(declare-fun t!31044 () Bool)

(declare-fun tb!6969 () Bool)

(assert (=> (and b!1031230 (= (defaultEntry!6157 thiss!1427) (defaultEntry!6157 thiss!1427)) t!31044) tb!6969))

(declare-fun result!14275 () Bool)

(assert (=> tb!6969 (= result!14275 tp_is_empty!24379)))

(assert (=> b!1031226 t!31044))

(declare-fun b_and!33061 () Bool)

(assert (= b_and!33059 (and (=> t!31044 result!14275) b_and!33061)))

(declare-fun m!950845 () Bool)

(assert (=> b!1031230 m!950845))

(declare-fun m!950847 () Bool)

(assert (=> b!1031230 m!950847))

(declare-fun m!950849 () Bool)

(assert (=> b!1031235 m!950849))

(declare-fun m!950851 () Bool)

(assert (=> b!1031228 m!950851))

(declare-fun m!950853 () Bool)

(assert (=> b!1031231 m!950853))

(declare-fun m!950855 () Bool)

(assert (=> b!1031233 m!950855))

(declare-fun m!950857 () Bool)

(assert (=> mapNonEmpty!38022 m!950857))

(declare-fun m!950859 () Bool)

(assert (=> start!90050 m!950859))

(declare-fun m!950861 () Bool)

(assert (=> b!1031226 m!950861))

(declare-fun m!950863 () Bool)

(assert (=> b!1031226 m!950863))

(declare-fun m!950865 () Bool)

(assert (=> b!1031226 m!950865))

(declare-fun m!950867 () Bool)

(assert (=> b!1031226 m!950867))

(declare-fun m!950869 () Bool)

(assert (=> b!1031226 m!950869))

(declare-fun m!950871 () Bool)

(assert (=> b!1031226 m!950871))

(declare-fun m!950873 () Bool)

(assert (=> b!1031226 m!950873))

(declare-fun m!950875 () Bool)

(assert (=> b!1031226 m!950875))

(declare-fun m!950877 () Bool)

(assert (=> b!1031226 m!950877))

(declare-fun m!950879 () Bool)

(assert (=> b!1031226 m!950879))

(declare-fun m!950881 () Bool)

(assert (=> b!1031226 m!950881))

(declare-fun m!950883 () Bool)

(assert (=> b!1031226 m!950883))

(declare-fun m!950885 () Bool)

(assert (=> b!1031226 m!950885))

(declare-fun m!950887 () Bool)

(assert (=> b!1031226 m!950887))

(assert (=> b!1031226 m!950885))

(assert (=> b!1031226 m!950871))

(declare-fun m!950889 () Bool)

(assert (=> b!1031226 m!950889))

(declare-fun m!950891 () Bool)

(assert (=> b!1031226 m!950891))

(declare-fun m!950893 () Bool)

(assert (=> b!1031226 m!950893))

(declare-fun m!950895 () Bool)

(assert (=> b!1031226 m!950895))

(check-sat (not b!1031226) (not b!1031228) (not b_lambda!15981) tp_is_empty!24379 (not b!1031231) (not b_next!20659) (not b!1031233) (not b!1031230) (not start!90050) b_and!33061 (not b!1031235) (not mapNonEmpty!38022))
(check-sat b_and!33061 (not b_next!20659))
