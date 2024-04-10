; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90072 () Bool)

(assert start!90072)

(declare-fun b!1031733 () Bool)

(declare-fun b_free!20679 () Bool)

(declare-fun b_next!20679 () Bool)

(assert (=> b!1031733 (= b_free!20679 (not b_next!20679))))

(declare-fun tp!73107 () Bool)

(declare-fun b_and!33125 () Bool)

(assert (=> b!1031733 (= tp!73107 b_and!33125)))

(declare-fun b!1031732 () Bool)

(declare-datatypes ((Unit!33757 0))(
  ( (Unit!33758) )
))
(declare-fun e!582769 () Unit!33757)

(declare-fun Unit!33759 () Unit!33757)

(assert (=> b!1031732 (= e!582769 Unit!33759)))

(declare-fun lt!455626 () Unit!33757)

(declare-datatypes ((V!37405 0))(
  ( (V!37406 (val!12250 Int)) )
))
(declare-datatypes ((ValueCell!11496 0))(
  ( (ValueCellFull!11496 (v!14827 V!37405)) (EmptyCell!11496) )
))
(declare-datatypes ((array!64862 0))(
  ( (array!64863 (arr!31233 (Array (_ BitVec 32) (_ BitVec 64))) (size!31750 (_ BitVec 32))) )
))
(declare-datatypes ((array!64864 0))(
  ( (array!64865 (arr!31234 (Array (_ BitVec 32) ValueCell!11496)) (size!31751 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5586 0))(
  ( (LongMapFixedSize!5587 (defaultEntry!6167 Int) (mask!29969 (_ BitVec 32)) (extraKeys!5899 (_ BitVec 32)) (zeroValue!6003 V!37405) (minValue!6003 V!37405) (_size!2848 (_ BitVec 32)) (_keys!11340 array!64862) (_values!6190 array!64864) (_vacant!2848 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15684 0))(
  ( (tuple2!15685 (_1!7853 Unit!33757) (_2!7853 LongMapFixedSize!5586)) )
))
(declare-fun lt!455627 () tuple2!15684)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun lemmaKeyInListMapIsInArray!344 (array!64862 array!64864 (_ BitVec 32) (_ BitVec 32) V!37405 V!37405 (_ BitVec 64) Int) Unit!33757)

(assert (=> b!1031732 (= lt!455626 (lemmaKeyInListMapIsInArray!344 (_keys!11340 (_2!7853 lt!455627)) (_values!6190 (_2!7853 lt!455627)) (mask!29969 (_2!7853 lt!455627)) (extraKeys!5899 (_2!7853 lt!455627)) (zeroValue!6003 (_2!7853 lt!455627)) (minValue!6003 (_2!7853 lt!455627)) key!909 (defaultEntry!6167 (_2!7853 lt!455627))))))

(declare-fun c!104240 () Bool)

(assert (=> b!1031732 (= c!104240 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!689804 () Bool)

(declare-fun e!582775 () Bool)

(assert (=> b!1031732 (= res!689804 e!582775)))

(declare-fun e!582776 () Bool)

(assert (=> b!1031732 (=> (not res!689804) (not e!582776))))

(assert (=> b!1031732 e!582776))

(declare-fun thiss!1427 () LongMapFixedSize!5586)

(declare-fun e!582772 () Bool)

(declare-fun tp_is_empty!24399 () Bool)

(declare-fun e!582774 () Bool)

(declare-fun array_inv!24175 (array!64862) Bool)

(declare-fun array_inv!24176 (array!64864) Bool)

(assert (=> b!1031733 (= e!582774 (and tp!73107 tp_is_empty!24399 (array_inv!24175 (_keys!11340 thiss!1427)) (array_inv!24176 (_values!6190 thiss!1427)) e!582772))))

(declare-fun b!1031734 () Bool)

(declare-fun e!582771 () Bool)

(declare-fun mapRes!38052 () Bool)

(assert (=> b!1031734 (= e!582772 (and e!582771 mapRes!38052))))

(declare-fun condMapEmpty!38052 () Bool)

(declare-fun mapDefault!38052 () ValueCell!11496)

(assert (=> b!1031734 (= condMapEmpty!38052 (= (arr!31234 (_values!6190 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11496)) mapDefault!38052)))))

(declare-fun b!1031735 () Bool)

(declare-fun arrayContainsKey!0 (array!64862 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031735 (= e!582775 (arrayContainsKey!0 (_keys!11340 (_2!7853 lt!455627)) key!909 #b00000000000000000000000000000000))))

(declare-fun res!689805 () Bool)

(declare-fun e!582773 () Bool)

(assert (=> start!90072 (=> (not res!689805) (not e!582773))))

(declare-fun valid!2114 (LongMapFixedSize!5586) Bool)

(assert (=> start!90072 (= res!689805 (valid!2114 thiss!1427))))

(assert (=> start!90072 e!582773))

(assert (=> start!90072 e!582774))

(assert (=> start!90072 true))

(declare-fun b!1031736 () Bool)

(assert (=> b!1031736 (= e!582776 false)))

(declare-fun b!1031737 () Bool)

(declare-fun e!582777 () Bool)

(assert (=> b!1031737 (= e!582777 (not true))))

(declare-fun lt!455631 () Bool)

(assert (=> b!1031737 (= lt!455631 (valid!2114 (_2!7853 lt!455627)))))

(declare-fun lt!455629 () Unit!33757)

(assert (=> b!1031737 (= lt!455629 e!582769)))

(declare-fun c!104241 () Bool)

(declare-datatypes ((tuple2!15686 0))(
  ( (tuple2!15687 (_1!7854 (_ BitVec 64)) (_2!7854 V!37405)) )
))
(declare-datatypes ((List!21877 0))(
  ( (Nil!21874) (Cons!21873 (h!23075 tuple2!15686) (t!31051 List!21877)) )
))
(declare-datatypes ((ListLongMap!13735 0))(
  ( (ListLongMap!13736 (toList!6883 List!21877)) )
))
(declare-fun contains!5997 (ListLongMap!13735 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3931 (array!64862 array!64864 (_ BitVec 32) (_ BitVec 32) V!37405 V!37405 (_ BitVec 32) Int) ListLongMap!13735)

(assert (=> b!1031737 (= c!104241 (contains!5997 (getCurrentListMap!3931 (_keys!11340 (_2!7853 lt!455627)) (_values!6190 (_2!7853 lt!455627)) (mask!29969 (_2!7853 lt!455627)) (extraKeys!5899 (_2!7853 lt!455627)) (zeroValue!6003 (_2!7853 lt!455627)) (minValue!6003 (_2!7853 lt!455627)) #b00000000000000000000000000000000 (defaultEntry!6167 (_2!7853 lt!455627))) key!909))))

(declare-fun lt!455632 () array!64862)

(declare-fun lt!455630 () array!64864)

(declare-fun Unit!33760 () Unit!33757)

(declare-fun Unit!33761 () Unit!33757)

(assert (=> b!1031737 (= lt!455627 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2848 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15685 Unit!33760 (LongMapFixedSize!5587 (defaultEntry!6167 thiss!1427) (mask!29969 thiss!1427) (extraKeys!5899 thiss!1427) (zeroValue!6003 thiss!1427) (minValue!6003 thiss!1427) (bvsub (_size!2848 thiss!1427) #b00000000000000000000000000000001) lt!455632 lt!455630 (bvadd #b00000000000000000000000000000001 (_vacant!2848 thiss!1427)))) (tuple2!15685 Unit!33761 (LongMapFixedSize!5587 (defaultEntry!6167 thiss!1427) (mask!29969 thiss!1427) (extraKeys!5899 thiss!1427) (zeroValue!6003 thiss!1427) (minValue!6003 thiss!1427) (bvsub (_size!2848 thiss!1427) #b00000000000000000000000000000001) lt!455632 lt!455630 (_vacant!2848 thiss!1427)))))))

(declare-fun -!510 (ListLongMap!13735 (_ BitVec 64)) ListLongMap!13735)

(assert (=> b!1031737 (= (-!510 (getCurrentListMap!3931 (_keys!11340 thiss!1427) (_values!6190 thiss!1427) (mask!29969 thiss!1427) (extraKeys!5899 thiss!1427) (zeroValue!6003 thiss!1427) (minValue!6003 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6167 thiss!1427)) key!909) (getCurrentListMap!3931 lt!455632 lt!455630 (mask!29969 thiss!1427) (extraKeys!5899 thiss!1427) (zeroValue!6003 thiss!1427) (minValue!6003 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6167 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9713 0))(
  ( (MissingZero!9713 (index!41223 (_ BitVec 32))) (Found!9713 (index!41224 (_ BitVec 32))) (Intermediate!9713 (undefined!10525 Bool) (index!41225 (_ BitVec 32)) (x!91893 (_ BitVec 32))) (Undefined!9713) (MissingVacant!9713 (index!41226 (_ BitVec 32))) )
))
(declare-fun lt!455633 () SeekEntryResult!9713)

(declare-fun dynLambda!1980 (Int (_ BitVec 64)) V!37405)

(assert (=> b!1031737 (= lt!455630 (array!64865 (store (arr!31234 (_values!6190 thiss!1427)) (index!41224 lt!455633) (ValueCellFull!11496 (dynLambda!1980 (defaultEntry!6167 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31751 (_values!6190 thiss!1427))))))

(declare-fun lt!455624 () Unit!33757)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!36 (array!64862 array!64864 (_ BitVec 32) (_ BitVec 32) V!37405 V!37405 (_ BitVec 32) (_ BitVec 64) Int) Unit!33757)

(assert (=> b!1031737 (= lt!455624 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!36 (_keys!11340 thiss!1427) (_values!6190 thiss!1427) (mask!29969 thiss!1427) (extraKeys!5899 thiss!1427) (zeroValue!6003 thiss!1427) (minValue!6003 thiss!1427) (index!41224 lt!455633) key!909 (defaultEntry!6167 thiss!1427)))))

(assert (=> b!1031737 (not (arrayContainsKey!0 lt!455632 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455628 () Unit!33757)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64862 (_ BitVec 32) (_ BitVec 64)) Unit!33757)

(assert (=> b!1031737 (= lt!455628 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11340 thiss!1427) (index!41224 lt!455633) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64862 (_ BitVec 32)) Bool)

(assert (=> b!1031737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455632 (mask!29969 thiss!1427))))

(declare-fun lt!455622 () Unit!33757)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64862 (_ BitVec 32) (_ BitVec 32)) Unit!33757)

(assert (=> b!1031737 (= lt!455622 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11340 thiss!1427) (index!41224 lt!455633) (mask!29969 thiss!1427)))))

(declare-datatypes ((List!21878 0))(
  ( (Nil!21875) (Cons!21874 (h!23076 (_ BitVec 64)) (t!31052 List!21878)) )
))
(declare-fun arrayNoDuplicates!0 (array!64862 (_ BitVec 32) List!21878) Bool)

(assert (=> b!1031737 (arrayNoDuplicates!0 lt!455632 #b00000000000000000000000000000000 Nil!21875)))

(declare-fun lt!455625 () Unit!33757)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64862 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21878) Unit!33757)

(assert (=> b!1031737 (= lt!455625 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11340 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41224 lt!455633) #b00000000000000000000000000000000 Nil!21875))))

(declare-fun arrayCountValidKeys!0 (array!64862 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031737 (= (arrayCountValidKeys!0 lt!455632 #b00000000000000000000000000000000 (size!31750 (_keys!11340 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11340 thiss!1427) #b00000000000000000000000000000000 (size!31750 (_keys!11340 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031737 (= lt!455632 (array!64863 (store (arr!31233 (_keys!11340 thiss!1427)) (index!41224 lt!455633) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31750 (_keys!11340 thiss!1427))))))

(declare-fun lt!455623 () Unit!33757)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64862 (_ BitVec 32) (_ BitVec 64)) Unit!33757)

(assert (=> b!1031737 (= lt!455623 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11340 thiss!1427) (index!41224 lt!455633) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031738 () Bool)

(assert (=> b!1031738 (= e!582775 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5899 (_2!7853 lt!455627)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5899 (_2!7853 lt!455627)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!38052 () Bool)

(assert (=> mapIsEmpty!38052 mapRes!38052))

(declare-fun b!1031739 () Bool)

(declare-fun e!582768 () Bool)

(assert (=> b!1031739 (= e!582768 tp_is_empty!24399)))

(declare-fun b!1031740 () Bool)

(assert (=> b!1031740 (= e!582773 e!582777)))

(declare-fun res!689806 () Bool)

(assert (=> b!1031740 (=> (not res!689806) (not e!582777))))

(get-info :version)

(assert (=> b!1031740 (= res!689806 ((_ is Found!9713) lt!455633))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64862 (_ BitVec 32)) SeekEntryResult!9713)

(assert (=> b!1031740 (= lt!455633 (seekEntry!0 key!909 (_keys!11340 thiss!1427) (mask!29969 thiss!1427)))))

(declare-fun b!1031741 () Bool)

(declare-fun Unit!33762 () Unit!33757)

(assert (=> b!1031741 (= e!582769 Unit!33762)))

(declare-fun b!1031742 () Bool)

(assert (=> b!1031742 (= e!582771 tp_is_empty!24399)))

(declare-fun mapNonEmpty!38052 () Bool)

(declare-fun tp!73108 () Bool)

(assert (=> mapNonEmpty!38052 (= mapRes!38052 (and tp!73108 e!582768))))

(declare-fun mapKey!38052 () (_ BitVec 32))

(declare-fun mapValue!38052 () ValueCell!11496)

(declare-fun mapRest!38052 () (Array (_ BitVec 32) ValueCell!11496))

(assert (=> mapNonEmpty!38052 (= (arr!31234 (_values!6190 thiss!1427)) (store mapRest!38052 mapKey!38052 mapValue!38052))))

(declare-fun b!1031743 () Bool)

(declare-fun res!689807 () Bool)

(assert (=> b!1031743 (=> (not res!689807) (not e!582773))))

(assert (=> b!1031743 (= res!689807 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!90072 res!689805) b!1031743))

(assert (= (and b!1031743 res!689807) b!1031740))

(assert (= (and b!1031740 res!689806) b!1031737))

(assert (= (and b!1031737 c!104241) b!1031732))

(assert (= (and b!1031737 (not c!104241)) b!1031741))

(assert (= (and b!1031732 c!104240) b!1031735))

(assert (= (and b!1031732 (not c!104240)) b!1031738))

(assert (= (and b!1031732 res!689804) b!1031736))

(assert (= (and b!1031734 condMapEmpty!38052) mapIsEmpty!38052))

(assert (= (and b!1031734 (not condMapEmpty!38052)) mapNonEmpty!38052))

(assert (= (and mapNonEmpty!38052 ((_ is ValueCellFull!11496) mapValue!38052)) b!1031739))

(assert (= (and b!1031734 ((_ is ValueCellFull!11496) mapDefault!38052)) b!1031742))

(assert (= b!1031733 b!1031734))

(assert (= start!90072 b!1031733))

(declare-fun b_lambda!16023 () Bool)

(assert (=> (not b_lambda!16023) (not b!1031737)))

(declare-fun t!31050 () Bool)

(declare-fun tb!6997 () Bool)

(assert (=> (and b!1031733 (= (defaultEntry!6167 thiss!1427) (defaultEntry!6167 thiss!1427)) t!31050) tb!6997))

(declare-fun result!14323 () Bool)

(assert (=> tb!6997 (= result!14323 tp_is_empty!24399)))

(assert (=> b!1031737 t!31050))

(declare-fun b_and!33127 () Bool)

(assert (= b_and!33125 (and (=> t!31050 result!14323) b_and!33127)))

(declare-fun m!951985 () Bool)

(assert (=> b!1031732 m!951985))

(declare-fun m!951987 () Bool)

(assert (=> b!1031735 m!951987))

(declare-fun m!951989 () Bool)

(assert (=> mapNonEmpty!38052 m!951989))

(declare-fun m!951991 () Bool)

(assert (=> b!1031733 m!951991))

(declare-fun m!951993 () Bool)

(assert (=> b!1031733 m!951993))

(declare-fun m!951995 () Bool)

(assert (=> b!1031740 m!951995))

(declare-fun m!951997 () Bool)

(assert (=> b!1031737 m!951997))

(declare-fun m!951999 () Bool)

(assert (=> b!1031737 m!951999))

(declare-fun m!952001 () Bool)

(assert (=> b!1031737 m!952001))

(declare-fun m!952003 () Bool)

(assert (=> b!1031737 m!952003))

(declare-fun m!952005 () Bool)

(assert (=> b!1031737 m!952005))

(declare-fun m!952007 () Bool)

(assert (=> b!1031737 m!952007))

(declare-fun m!952009 () Bool)

(assert (=> b!1031737 m!952009))

(declare-fun m!952011 () Bool)

(assert (=> b!1031737 m!952011))

(declare-fun m!952013 () Bool)

(assert (=> b!1031737 m!952013))

(declare-fun m!952015 () Bool)

(assert (=> b!1031737 m!952015))

(assert (=> b!1031737 m!952011))

(declare-fun m!952017 () Bool)

(assert (=> b!1031737 m!952017))

(declare-fun m!952019 () Bool)

(assert (=> b!1031737 m!952019))

(declare-fun m!952021 () Bool)

(assert (=> b!1031737 m!952021))

(declare-fun m!952023 () Bool)

(assert (=> b!1031737 m!952023))

(declare-fun m!952025 () Bool)

(assert (=> b!1031737 m!952025))

(assert (=> b!1031737 m!952003))

(declare-fun m!952027 () Bool)

(assert (=> b!1031737 m!952027))

(declare-fun m!952029 () Bool)

(assert (=> b!1031737 m!952029))

(declare-fun m!952031 () Bool)

(assert (=> b!1031737 m!952031))

(declare-fun m!952033 () Bool)

(assert (=> b!1031737 m!952033))

(declare-fun m!952035 () Bool)

(assert (=> start!90072 m!952035))

(check-sat (not b!1031735) (not b!1031733) (not b!1031732) tp_is_empty!24399 (not b_lambda!16023) (not b!1031740) b_and!33127 (not b!1031737) (not mapNonEmpty!38052) (not start!90072) (not b_next!20679))
(check-sat b_and!33127 (not b_next!20679))
