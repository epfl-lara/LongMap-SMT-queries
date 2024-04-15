; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90014 () Bool)

(assert start!90014)

(declare-fun b!1030597 () Bool)

(declare-fun b_free!20623 () Bool)

(declare-fun b_next!20623 () Bool)

(assert (=> b!1030597 (= b_free!20623 (not b_next!20623))))

(declare-fun tp!72940 () Bool)

(declare-fun b_and!32987 () Bool)

(assert (=> b!1030597 (= tp!72940 b_and!32987)))

(declare-fun b!1030596 () Bool)

(declare-fun e!581997 () Bool)

(declare-fun tp_is_empty!24343 () Bool)

(assert (=> b!1030596 (= e!581997 tp_is_empty!24343)))

(declare-fun mapNonEmpty!37968 () Bool)

(declare-fun mapRes!37968 () Bool)

(declare-fun tp!72939 () Bool)

(assert (=> mapNonEmpty!37968 (= mapRes!37968 (and tp!72939 e!581997))))

(declare-datatypes ((V!37331 0))(
  ( (V!37332 (val!12222 Int)) )
))
(declare-datatypes ((ValueCell!11468 0))(
  ( (ValueCellFull!11468 (v!14798 V!37331)) (EmptyCell!11468) )
))
(declare-fun mapRest!37968 () (Array (_ BitVec 32) ValueCell!11468))

(declare-fun mapKey!37968 () (_ BitVec 32))

(declare-datatypes ((array!64689 0))(
  ( (array!64690 (arr!31146 (Array (_ BitVec 32) (_ BitVec 64))) (size!31665 (_ BitVec 32))) )
))
(declare-datatypes ((array!64691 0))(
  ( (array!64692 (arr!31147 (Array (_ BitVec 32) ValueCell!11468)) (size!31666 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5530 0))(
  ( (LongMapFixedSize!5531 (defaultEntry!6139 Int) (mask!29918 (_ BitVec 32)) (extraKeys!5871 (_ BitVec 32)) (zeroValue!5975 V!37331) (minValue!5975 V!37331) (_size!2820 (_ BitVec 32)) (_keys!11308 array!64689) (_values!6162 array!64691) (_vacant!2820 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5530)

(declare-fun mapValue!37968 () ValueCell!11468)

(assert (=> mapNonEmpty!37968 (= (arr!31147 (_values!6162 thiss!1427)) (store mapRest!37968 mapKey!37968 mapValue!37968))))

(declare-fun mapIsEmpty!37968 () Bool)

(assert (=> mapIsEmpty!37968 mapRes!37968))

(declare-fun e!582001 () Bool)

(declare-fun e!582000 () Bool)

(declare-fun array_inv!24111 (array!64689) Bool)

(declare-fun array_inv!24112 (array!64691) Bool)

(assert (=> b!1030597 (= e!582001 (and tp!72940 tp_is_empty!24343 (array_inv!24111 (_keys!11308 thiss!1427)) (array_inv!24112 (_values!6162 thiss!1427)) e!582000))))

(declare-fun b!1030598 () Bool)

(declare-fun e!582002 () Bool)

(assert (=> b!1030598 (= e!582000 (and e!582002 mapRes!37968))))

(declare-fun condMapEmpty!37968 () Bool)

(declare-fun mapDefault!37968 () ValueCell!11468)

(assert (=> b!1030598 (= condMapEmpty!37968 (= (arr!31147 (_values!6162 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11468)) mapDefault!37968)))))

(declare-fun b!1030599 () Bool)

(declare-fun e!581996 () Bool)

(declare-fun e!581995 () Bool)

(assert (=> b!1030599 (= e!581996 (not e!581995))))

(declare-fun res!689170 () Bool)

(assert (=> b!1030599 (=> res!689170 e!581995)))

(declare-datatypes ((Unit!33559 0))(
  ( (Unit!33560) )
))
(declare-datatypes ((tuple2!15682 0))(
  ( (tuple2!15683 (_1!7852 Unit!33559) (_2!7852 LongMapFixedSize!5530)) )
))
(declare-fun lt!454580 () tuple2!15682)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15684 0))(
  ( (tuple2!15685 (_1!7853 (_ BitVec 64)) (_2!7853 V!37331)) )
))
(declare-datatypes ((List!21874 0))(
  ( (Nil!21871) (Cons!21870 (h!23072 tuple2!15684) (t!30983 List!21874)) )
))
(declare-datatypes ((ListLongMap!13775 0))(
  ( (ListLongMap!13776 (toList!6903 List!21874)) )
))
(declare-fun contains!5959 (ListLongMap!13775 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3870 (array!64689 array!64691 (_ BitVec 32) (_ BitVec 32) V!37331 V!37331 (_ BitVec 32) Int) ListLongMap!13775)

(assert (=> b!1030599 (= res!689170 (not (contains!5959 (getCurrentListMap!3870 (_keys!11308 (_2!7852 lt!454580)) (_values!6162 (_2!7852 lt!454580)) (mask!29918 (_2!7852 lt!454580)) (extraKeys!5871 (_2!7852 lt!454580)) (zeroValue!5975 (_2!7852 lt!454580)) (minValue!5975 (_2!7852 lt!454580)) #b00000000000000000000000000000000 (defaultEntry!6139 (_2!7852 lt!454580))) key!909)))))

(declare-fun lt!454581 () array!64689)

(declare-fun lt!454576 () array!64691)

(declare-fun Unit!33561 () Unit!33559)

(declare-fun Unit!33562 () Unit!33559)

(assert (=> b!1030599 (= lt!454580 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2820 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15683 Unit!33561 (LongMapFixedSize!5531 (defaultEntry!6139 thiss!1427) (mask!29918 thiss!1427) (extraKeys!5871 thiss!1427) (zeroValue!5975 thiss!1427) (minValue!5975 thiss!1427) (bvsub (_size!2820 thiss!1427) #b00000000000000000000000000000001) lt!454581 lt!454576 (bvadd #b00000000000000000000000000000001 (_vacant!2820 thiss!1427)))) (tuple2!15683 Unit!33562 (LongMapFixedSize!5531 (defaultEntry!6139 thiss!1427) (mask!29918 thiss!1427) (extraKeys!5871 thiss!1427) (zeroValue!5975 thiss!1427) (minValue!5975 thiss!1427) (bvsub (_size!2820 thiss!1427) #b00000000000000000000000000000001) lt!454581 lt!454576 (_vacant!2820 thiss!1427)))))))

(declare-fun -!495 (ListLongMap!13775 (_ BitVec 64)) ListLongMap!13775)

(assert (=> b!1030599 (= (-!495 (getCurrentListMap!3870 (_keys!11308 thiss!1427) (_values!6162 thiss!1427) (mask!29918 thiss!1427) (extraKeys!5871 thiss!1427) (zeroValue!5975 thiss!1427) (minValue!5975 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6139 thiss!1427)) key!909) (getCurrentListMap!3870 lt!454581 lt!454576 (mask!29918 thiss!1427) (extraKeys!5871 thiss!1427) (zeroValue!5975 thiss!1427) (minValue!5975 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6139 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9682 0))(
  ( (MissingZero!9682 (index!41099 (_ BitVec 32))) (Found!9682 (index!41100 (_ BitVec 32))) (Intermediate!9682 (undefined!10494 Bool) (index!41101 (_ BitVec 32)) (x!91731 (_ BitVec 32))) (Undefined!9682) (MissingVacant!9682 (index!41102 (_ BitVec 32))) )
))
(declare-fun lt!454575 () SeekEntryResult!9682)

(declare-fun dynLambda!1957 (Int (_ BitVec 64)) V!37331)

(assert (=> b!1030599 (= lt!454576 (array!64692 (store (arr!31147 (_values!6162 thiss!1427)) (index!41100 lt!454575) (ValueCellFull!11468 (dynLambda!1957 (defaultEntry!6139 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31666 (_values!6162 thiss!1427))))))

(declare-fun lt!454572 () Unit!33559)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!20 (array!64689 array!64691 (_ BitVec 32) (_ BitVec 32) V!37331 V!37331 (_ BitVec 32) (_ BitVec 64) Int) Unit!33559)

(assert (=> b!1030599 (= lt!454572 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!20 (_keys!11308 thiss!1427) (_values!6162 thiss!1427) (mask!29918 thiss!1427) (extraKeys!5871 thiss!1427) (zeroValue!5975 thiss!1427) (minValue!5975 thiss!1427) (index!41100 lt!454575) key!909 (defaultEntry!6139 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1030599 (not (arrayContainsKey!0 lt!454581 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454578 () Unit!33559)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64689 (_ BitVec 32) (_ BitVec 64)) Unit!33559)

(assert (=> b!1030599 (= lt!454578 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11308 thiss!1427) (index!41100 lt!454575) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64689 (_ BitVec 32)) Bool)

(assert (=> b!1030599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454581 (mask!29918 thiss!1427))))

(declare-fun lt!454573 () Unit!33559)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64689 (_ BitVec 32) (_ BitVec 32)) Unit!33559)

(assert (=> b!1030599 (= lt!454573 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11308 thiss!1427) (index!41100 lt!454575) (mask!29918 thiss!1427)))))

(declare-datatypes ((List!21875 0))(
  ( (Nil!21872) (Cons!21871 (h!23073 (_ BitVec 64)) (t!30984 List!21875)) )
))
(declare-fun arrayNoDuplicates!0 (array!64689 (_ BitVec 32) List!21875) Bool)

(assert (=> b!1030599 (arrayNoDuplicates!0 lt!454581 #b00000000000000000000000000000000 Nil!21872)))

(declare-fun lt!454574 () Unit!33559)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64689 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21875) Unit!33559)

(assert (=> b!1030599 (= lt!454574 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11308 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41100 lt!454575) #b00000000000000000000000000000000 Nil!21872))))

(declare-fun arrayCountValidKeys!0 (array!64689 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030599 (= (arrayCountValidKeys!0 lt!454581 #b00000000000000000000000000000000 (size!31665 (_keys!11308 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11308 thiss!1427) #b00000000000000000000000000000000 (size!31665 (_keys!11308 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1030599 (= lt!454581 (array!64690 (store (arr!31146 (_keys!11308 thiss!1427)) (index!41100 lt!454575) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31665 (_keys!11308 thiss!1427))))))

(declare-fun lt!454577 () Unit!33559)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64689 (_ BitVec 32) (_ BitVec 64)) Unit!33559)

(assert (=> b!1030599 (= lt!454577 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11308 thiss!1427) (index!41100 lt!454575) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030600 () Bool)

(assert (=> b!1030600 (= e!581995 true)))

(declare-fun lt!454579 () Bool)

(assert (=> b!1030600 (= lt!454579 (arrayNoDuplicates!0 (_keys!11308 (_2!7852 lt!454580)) #b00000000000000000000000000000000 Nil!21872))))

(declare-fun b!1030601 () Bool)

(assert (=> b!1030601 (= e!582002 tp_is_empty!24343)))

(declare-fun b!1030602 () Bool)

(declare-fun res!689165 () Bool)

(assert (=> b!1030602 (=> res!689165 e!581995)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1030602 (= res!689165 (not (validMask!0 (mask!29918 (_2!7852 lt!454580)))))))

(declare-fun b!1030603 () Bool)

(declare-fun res!689169 () Bool)

(assert (=> b!1030603 (=> res!689169 e!581995)))

(assert (=> b!1030603 (= res!689169 (or (not (= (size!31666 (_values!6162 (_2!7852 lt!454580))) (bvadd #b00000000000000000000000000000001 (mask!29918 (_2!7852 lt!454580))))) (not (= (size!31665 (_keys!11308 (_2!7852 lt!454580))) (size!31666 (_values!6162 (_2!7852 lt!454580))))) (bvslt (mask!29918 (_2!7852 lt!454580)) #b00000000000000000000000000000000) (bvslt (extraKeys!5871 (_2!7852 lt!454580)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5871 (_2!7852 lt!454580)) #b00000000000000000000000000000011)))))

(declare-fun b!1030604 () Bool)

(declare-fun res!689166 () Bool)

(declare-fun e!581998 () Bool)

(assert (=> b!1030604 (=> (not res!689166) (not e!581998))))

(assert (=> b!1030604 (= res!689166 (not (= key!909 (bvneg key!909))))))

(declare-fun res!689168 () Bool)

(assert (=> start!90014 (=> (not res!689168) (not e!581998))))

(declare-fun valid!2084 (LongMapFixedSize!5530) Bool)

(assert (=> start!90014 (= res!689168 (valid!2084 thiss!1427))))

(assert (=> start!90014 e!581998))

(assert (=> start!90014 e!582001))

(assert (=> start!90014 true))

(declare-fun b!1030605 () Bool)

(declare-fun res!689164 () Bool)

(assert (=> b!1030605 (=> res!689164 e!581995)))

(assert (=> b!1030605 (= res!689164 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11308 (_2!7852 lt!454580)) (mask!29918 (_2!7852 lt!454580)))))))

(declare-fun b!1030606 () Bool)

(assert (=> b!1030606 (= e!581998 e!581996)))

(declare-fun res!689167 () Bool)

(assert (=> b!1030606 (=> (not res!689167) (not e!581996))))

(get-info :version)

(assert (=> b!1030606 (= res!689167 ((_ is Found!9682) lt!454575))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64689 (_ BitVec 32)) SeekEntryResult!9682)

(assert (=> b!1030606 (= lt!454575 (seekEntry!0 key!909 (_keys!11308 thiss!1427) (mask!29918 thiss!1427)))))

(assert (= (and start!90014 res!689168) b!1030604))

(assert (= (and b!1030604 res!689166) b!1030606))

(assert (= (and b!1030606 res!689167) b!1030599))

(assert (= (and b!1030599 (not res!689170)) b!1030602))

(assert (= (and b!1030602 (not res!689165)) b!1030603))

(assert (= (and b!1030603 (not res!689169)) b!1030605))

(assert (= (and b!1030605 (not res!689164)) b!1030600))

(assert (= (and b!1030598 condMapEmpty!37968) mapIsEmpty!37968))

(assert (= (and b!1030598 (not condMapEmpty!37968)) mapNonEmpty!37968))

(assert (= (and mapNonEmpty!37968 ((_ is ValueCellFull!11468) mapValue!37968)) b!1030596))

(assert (= (and b!1030598 ((_ is ValueCellFull!11468) mapDefault!37968)) b!1030601))

(assert (= b!1030597 b!1030598))

(assert (= start!90014 b!1030597))

(declare-fun b_lambda!15945 () Bool)

(assert (=> (not b_lambda!15945) (not b!1030599)))

(declare-fun t!30982 () Bool)

(declare-fun tb!6933 () Bool)

(assert (=> (and b!1030597 (= (defaultEntry!6139 thiss!1427) (defaultEntry!6139 thiss!1427)) t!30982) tb!6933))

(declare-fun result!14203 () Bool)

(assert (=> tb!6933 (= result!14203 tp_is_empty!24343)))

(assert (=> b!1030599 t!30982))

(declare-fun b_and!32989 () Bool)

(assert (= b_and!32987 (and (=> t!30982 result!14203) b_and!32989)))

(declare-fun m!949909 () Bool)

(assert (=> b!1030602 m!949909))

(declare-fun m!949911 () Bool)

(assert (=> mapNonEmpty!37968 m!949911))

(declare-fun m!949913 () Bool)

(assert (=> b!1030599 m!949913))

(declare-fun m!949915 () Bool)

(assert (=> b!1030599 m!949915))

(declare-fun m!949917 () Bool)

(assert (=> b!1030599 m!949917))

(declare-fun m!949919 () Bool)

(assert (=> b!1030599 m!949919))

(declare-fun m!949921 () Bool)

(assert (=> b!1030599 m!949921))

(declare-fun m!949923 () Bool)

(assert (=> b!1030599 m!949923))

(declare-fun m!949925 () Bool)

(assert (=> b!1030599 m!949925))

(declare-fun m!949927 () Bool)

(assert (=> b!1030599 m!949927))

(declare-fun m!949929 () Bool)

(assert (=> b!1030599 m!949929))

(declare-fun m!949931 () Bool)

(assert (=> b!1030599 m!949931))

(declare-fun m!949933 () Bool)

(assert (=> b!1030599 m!949933))

(declare-fun m!949935 () Bool)

(assert (=> b!1030599 m!949935))

(declare-fun m!949937 () Bool)

(assert (=> b!1030599 m!949937))

(declare-fun m!949939 () Bool)

(assert (=> b!1030599 m!949939))

(assert (=> b!1030599 m!949933))

(declare-fun m!949941 () Bool)

(assert (=> b!1030599 m!949941))

(assert (=> b!1030599 m!949931))

(declare-fun m!949943 () Bool)

(assert (=> b!1030599 m!949943))

(declare-fun m!949945 () Bool)

(assert (=> b!1030599 m!949945))

(declare-fun m!949947 () Bool)

(assert (=> b!1030599 m!949947))

(declare-fun m!949949 () Bool)

(assert (=> b!1030606 m!949949))

(declare-fun m!949951 () Bool)

(assert (=> start!90014 m!949951))

(declare-fun m!949953 () Bool)

(assert (=> b!1030605 m!949953))

(declare-fun m!949955 () Bool)

(assert (=> b!1030597 m!949955))

(declare-fun m!949957 () Bool)

(assert (=> b!1030597 m!949957))

(declare-fun m!949959 () Bool)

(assert (=> b!1030600 m!949959))

(check-sat (not b!1030605) (not b!1030597) (not b!1030602) (not b_lambda!15945) b_and!32989 (not b_next!20623) (not start!90014) (not b!1030599) (not mapNonEmpty!37968) (not b!1030606) (not b!1030600) tp_is_empty!24343)
(check-sat b_and!32989 (not b_next!20623))
