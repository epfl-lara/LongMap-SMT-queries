; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90086 () Bool)

(assert start!90086)

(declare-fun b!1031891 () Bool)

(declare-fun b_free!20695 () Bool)

(declare-fun b_next!20695 () Bool)

(assert (=> b!1031891 (= b_free!20695 (not b_next!20695))))

(declare-fun tp!73156 () Bool)

(declare-fun b_and!33131 () Bool)

(assert (=> b!1031891 (= tp!73156 b_and!33131)))

(declare-fun b!1031885 () Bool)

(declare-fun e!582920 () Bool)

(declare-fun tp_is_empty!24415 () Bool)

(assert (=> b!1031885 (= e!582920 tp_is_empty!24415)))

(declare-fun b!1031886 () Bool)

(declare-fun e!582926 () Bool)

(declare-fun e!582924 () Bool)

(declare-fun mapRes!38076 () Bool)

(assert (=> b!1031886 (= e!582926 (and e!582924 mapRes!38076))))

(declare-fun condMapEmpty!38076 () Bool)

(declare-datatypes ((V!37427 0))(
  ( (V!37428 (val!12258 Int)) )
))
(declare-datatypes ((ValueCell!11504 0))(
  ( (ValueCellFull!11504 (v!14834 V!37427)) (EmptyCell!11504) )
))
(declare-datatypes ((array!64833 0))(
  ( (array!64834 (arr!31218 (Array (_ BitVec 32) (_ BitVec 64))) (size!31737 (_ BitVec 32))) )
))
(declare-datatypes ((array!64835 0))(
  ( (array!64836 (arr!31219 (Array (_ BitVec 32) ValueCell!11504)) (size!31738 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5602 0))(
  ( (LongMapFixedSize!5603 (defaultEntry!6175 Int) (mask!29978 (_ BitVec 32)) (extraKeys!5907 (_ BitVec 32)) (zeroValue!6011 V!37427) (minValue!6011 V!37427) (_size!2856 (_ BitVec 32)) (_keys!11344 array!64833) (_values!6198 array!64835) (_vacant!2856 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5602)

(declare-fun mapDefault!38076 () ValueCell!11504)

(assert (=> b!1031886 (= condMapEmpty!38076 (= (arr!31219 (_values!6198 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11504)) mapDefault!38076)))))

(declare-fun b!1031887 () Bool)

(declare-fun e!582925 () Bool)

(declare-fun e!582922 () Bool)

(assert (=> b!1031887 (= e!582925 e!582922)))

(declare-fun res!689834 () Bool)

(assert (=> b!1031887 (=> (not res!689834) (not e!582922))))

(declare-datatypes ((SeekEntryResult!9711 0))(
  ( (MissingZero!9711 (index!41215 (_ BitVec 32))) (Found!9711 (index!41216 (_ BitVec 32))) (Intermediate!9711 (undefined!10523 Bool) (index!41217 (_ BitVec 32)) (x!91928 (_ BitVec 32))) (Undefined!9711) (MissingVacant!9711 (index!41218 (_ BitVec 32))) )
))
(declare-fun lt!455713 () SeekEntryResult!9711)

(get-info :version)

(assert (=> b!1031887 (= res!689834 ((_ is Found!9711) lt!455713))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64833 (_ BitVec 32)) SeekEntryResult!9711)

(assert (=> b!1031887 (= lt!455713 (seekEntry!0 key!909 (_keys!11344 thiss!1427) (mask!29978 thiss!1427)))))

(declare-fun b!1031888 () Bool)

(declare-fun res!689835 () Bool)

(assert (=> b!1031888 (=> (not res!689835) (not e!582925))))

(assert (=> b!1031888 (= res!689835 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1031889 () Bool)

(declare-fun e!582918 () Bool)

(assert (=> b!1031889 (= e!582918 false)))

(declare-fun b!1031890 () Bool)

(declare-fun e!582921 () Bool)

(declare-datatypes ((Unit!33685 0))(
  ( (Unit!33686) )
))
(declare-datatypes ((tuple2!15796 0))(
  ( (tuple2!15797 (_1!7909 Unit!33685) (_2!7909 LongMapFixedSize!5602)) )
))
(declare-fun lt!455710 () tuple2!15796)

(declare-fun arrayContainsKey!0 (array!64833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031890 (= e!582921 (arrayContainsKey!0 (_keys!11344 (_2!7909 lt!455710)) key!909 #b00000000000000000000000000000000))))

(declare-fun e!582923 () Bool)

(declare-fun array_inv!24159 (array!64833) Bool)

(declare-fun array_inv!24160 (array!64835) Bool)

(assert (=> b!1031891 (= e!582923 (and tp!73156 tp_is_empty!24415 (array_inv!24159 (_keys!11344 thiss!1427)) (array_inv!24160 (_values!6198 thiss!1427)) e!582926))))

(declare-fun b!1031892 () Bool)

(assert (=> b!1031892 (= e!582924 tp_is_empty!24415)))

(declare-fun b!1031893 () Bool)

(declare-fun e!582917 () Unit!33685)

(declare-fun Unit!33687 () Unit!33685)

(assert (=> b!1031893 (= e!582917 Unit!33687)))

(declare-fun b!1031894 () Bool)

(assert (=> b!1031894 (= e!582922 (not true))))

(declare-fun lt!455719 () Bool)

(declare-fun valid!2110 (LongMapFixedSize!5602) Bool)

(assert (=> b!1031894 (= lt!455719 (valid!2110 (_2!7909 lt!455710)))))

(declare-fun lt!455715 () Unit!33685)

(assert (=> b!1031894 (= lt!455715 e!582917)))

(declare-fun c!104250 () Bool)

(declare-datatypes ((tuple2!15798 0))(
  ( (tuple2!15799 (_1!7910 (_ BitVec 64)) (_2!7910 V!37427)) )
))
(declare-datatypes ((List!21927 0))(
  ( (Nil!21924) (Cons!21923 (h!23125 tuple2!15798) (t!31108 List!21927)) )
))
(declare-datatypes ((ListLongMap!13825 0))(
  ( (ListLongMap!13826 (toList!6928 List!21927)) )
))
(declare-fun contains!5984 (ListLongMap!13825 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3895 (array!64833 array!64835 (_ BitVec 32) (_ BitVec 32) V!37427 V!37427 (_ BitVec 32) Int) ListLongMap!13825)

(assert (=> b!1031894 (= c!104250 (contains!5984 (getCurrentListMap!3895 (_keys!11344 (_2!7909 lt!455710)) (_values!6198 (_2!7909 lt!455710)) (mask!29978 (_2!7909 lt!455710)) (extraKeys!5907 (_2!7909 lt!455710)) (zeroValue!6011 (_2!7909 lt!455710)) (minValue!6011 (_2!7909 lt!455710)) #b00000000000000000000000000000000 (defaultEntry!6175 (_2!7909 lt!455710))) key!909))))

(declare-fun lt!455712 () array!64833)

(declare-fun lt!455716 () array!64835)

(declare-fun Unit!33688 () Unit!33685)

(declare-fun Unit!33689 () Unit!33685)

(assert (=> b!1031894 (= lt!455710 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2856 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15797 Unit!33688 (LongMapFixedSize!5603 (defaultEntry!6175 thiss!1427) (mask!29978 thiss!1427) (extraKeys!5907 thiss!1427) (zeroValue!6011 thiss!1427) (minValue!6011 thiss!1427) (bvsub (_size!2856 thiss!1427) #b00000000000000000000000000000001) lt!455712 lt!455716 (bvadd #b00000000000000000000000000000001 (_vacant!2856 thiss!1427)))) (tuple2!15797 Unit!33689 (LongMapFixedSize!5603 (defaultEntry!6175 thiss!1427) (mask!29978 thiss!1427) (extraKeys!5907 thiss!1427) (zeroValue!6011 thiss!1427) (minValue!6011 thiss!1427) (bvsub (_size!2856 thiss!1427) #b00000000000000000000000000000001) lt!455712 lt!455716 (_vacant!2856 thiss!1427)))))))

(declare-fun -!520 (ListLongMap!13825 (_ BitVec 64)) ListLongMap!13825)

(assert (=> b!1031894 (= (-!520 (getCurrentListMap!3895 (_keys!11344 thiss!1427) (_values!6198 thiss!1427) (mask!29978 thiss!1427) (extraKeys!5907 thiss!1427) (zeroValue!6011 thiss!1427) (minValue!6011 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6175 thiss!1427)) key!909) (getCurrentListMap!3895 lt!455712 lt!455716 (mask!29978 thiss!1427) (extraKeys!5907 thiss!1427) (zeroValue!6011 thiss!1427) (minValue!6011 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6175 thiss!1427)))))

(declare-fun dynLambda!1982 (Int (_ BitVec 64)) V!37427)

(assert (=> b!1031894 (= lt!455716 (array!64836 (store (arr!31219 (_values!6198 thiss!1427)) (index!41216 lt!455713) (ValueCellFull!11504 (dynLambda!1982 (defaultEntry!6175 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31738 (_values!6198 thiss!1427))))))

(declare-fun lt!455717 () Unit!33685)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!45 (array!64833 array!64835 (_ BitVec 32) (_ BitVec 32) V!37427 V!37427 (_ BitVec 32) (_ BitVec 64) Int) Unit!33685)

(assert (=> b!1031894 (= lt!455717 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!45 (_keys!11344 thiss!1427) (_values!6198 thiss!1427) (mask!29978 thiss!1427) (extraKeys!5907 thiss!1427) (zeroValue!6011 thiss!1427) (minValue!6011 thiss!1427) (index!41216 lt!455713) key!909 (defaultEntry!6175 thiss!1427)))))

(assert (=> b!1031894 (not (arrayContainsKey!0 lt!455712 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455720 () Unit!33685)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64833 (_ BitVec 32) (_ BitVec 64)) Unit!33685)

(assert (=> b!1031894 (= lt!455720 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11344 thiss!1427) (index!41216 lt!455713) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64833 (_ BitVec 32)) Bool)

(assert (=> b!1031894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455712 (mask!29978 thiss!1427))))

(declare-fun lt!455718 () Unit!33685)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64833 (_ BitVec 32) (_ BitVec 32)) Unit!33685)

(assert (=> b!1031894 (= lt!455718 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11344 thiss!1427) (index!41216 lt!455713) (mask!29978 thiss!1427)))))

(declare-datatypes ((List!21928 0))(
  ( (Nil!21925) (Cons!21924 (h!23126 (_ BitVec 64)) (t!31109 List!21928)) )
))
(declare-fun arrayNoDuplicates!0 (array!64833 (_ BitVec 32) List!21928) Bool)

(assert (=> b!1031894 (arrayNoDuplicates!0 lt!455712 #b00000000000000000000000000000000 Nil!21925)))

(declare-fun lt!455721 () Unit!33685)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64833 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21928) Unit!33685)

(assert (=> b!1031894 (= lt!455721 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11344 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41216 lt!455713) #b00000000000000000000000000000000 Nil!21925))))

(declare-fun arrayCountValidKeys!0 (array!64833 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031894 (= (arrayCountValidKeys!0 lt!455712 #b00000000000000000000000000000000 (size!31737 (_keys!11344 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11344 thiss!1427) #b00000000000000000000000000000000 (size!31737 (_keys!11344 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031894 (= lt!455712 (array!64834 (store (arr!31218 (_keys!11344 thiss!1427)) (index!41216 lt!455713) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31737 (_keys!11344 thiss!1427))))))

(declare-fun lt!455714 () Unit!33685)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64833 (_ BitVec 32) (_ BitVec 64)) Unit!33685)

(assert (=> b!1031894 (= lt!455714 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11344 thiss!1427) (index!41216 lt!455713) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38076 () Bool)

(assert (=> mapIsEmpty!38076 mapRes!38076))

(declare-fun b!1031895 () Bool)

(declare-fun Unit!33690 () Unit!33685)

(assert (=> b!1031895 (= e!582917 Unit!33690)))

(declare-fun lt!455711 () Unit!33685)

(declare-fun lemmaKeyInListMapIsInArray!330 (array!64833 array!64835 (_ BitVec 32) (_ BitVec 32) V!37427 V!37427 (_ BitVec 64) Int) Unit!33685)

(assert (=> b!1031895 (= lt!455711 (lemmaKeyInListMapIsInArray!330 (_keys!11344 (_2!7909 lt!455710)) (_values!6198 (_2!7909 lt!455710)) (mask!29978 (_2!7909 lt!455710)) (extraKeys!5907 (_2!7909 lt!455710)) (zeroValue!6011 (_2!7909 lt!455710)) (minValue!6011 (_2!7909 lt!455710)) key!909 (defaultEntry!6175 (_2!7909 lt!455710))))))

(declare-fun c!104249 () Bool)

(assert (=> b!1031895 (= c!104249 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!689833 () Bool)

(assert (=> b!1031895 (= res!689833 e!582921)))

(assert (=> b!1031895 (=> (not res!689833) (not e!582918))))

(assert (=> b!1031895 e!582918))

(declare-fun res!689836 () Bool)

(assert (=> start!90086 (=> (not res!689836) (not e!582925))))

(assert (=> start!90086 (= res!689836 (valid!2110 thiss!1427))))

(assert (=> start!90086 e!582925))

(assert (=> start!90086 e!582923))

(assert (=> start!90086 true))

(declare-fun mapNonEmpty!38076 () Bool)

(declare-fun tp!73155 () Bool)

(assert (=> mapNonEmpty!38076 (= mapRes!38076 (and tp!73155 e!582920))))

(declare-fun mapRest!38076 () (Array (_ BitVec 32) ValueCell!11504))

(declare-fun mapKey!38076 () (_ BitVec 32))

(declare-fun mapValue!38076 () ValueCell!11504)

(assert (=> mapNonEmpty!38076 (= (arr!31219 (_values!6198 thiss!1427)) (store mapRest!38076 mapKey!38076 mapValue!38076))))

(declare-fun b!1031896 () Bool)

(assert (=> b!1031896 (= e!582921 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5907 (_2!7909 lt!455710)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5907 (_2!7909 lt!455710)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!90086 res!689836) b!1031888))

(assert (= (and b!1031888 res!689835) b!1031887))

(assert (= (and b!1031887 res!689834) b!1031894))

(assert (= (and b!1031894 c!104250) b!1031895))

(assert (= (and b!1031894 (not c!104250)) b!1031893))

(assert (= (and b!1031895 c!104249) b!1031890))

(assert (= (and b!1031895 (not c!104249)) b!1031896))

(assert (= (and b!1031895 res!689833) b!1031889))

(assert (= (and b!1031886 condMapEmpty!38076) mapIsEmpty!38076))

(assert (= (and b!1031886 (not condMapEmpty!38076)) mapNonEmpty!38076))

(assert (= (and mapNonEmpty!38076 ((_ is ValueCellFull!11504) mapValue!38076)) b!1031885))

(assert (= (and b!1031886 ((_ is ValueCellFull!11504) mapDefault!38076)) b!1031892))

(assert (= b!1031891 b!1031886))

(assert (= start!90086 b!1031891))

(declare-fun b_lambda!16017 () Bool)

(assert (=> (not b_lambda!16017) (not b!1031894)))

(declare-fun t!31107 () Bool)

(declare-fun tb!7005 () Bool)

(assert (=> (and b!1031891 (= (defaultEntry!6175 thiss!1427) (defaultEntry!6175 thiss!1427)) t!31107) tb!7005))

(declare-fun result!14347 () Bool)

(assert (=> tb!7005 (= result!14347 tp_is_empty!24415)))

(assert (=> b!1031894 t!31107))

(declare-fun b_and!33133 () Bool)

(assert (= b_and!33131 (and (=> t!31107 result!14347) b_and!33133)))

(declare-fun m!951781 () Bool)

(assert (=> b!1031887 m!951781))

(declare-fun m!951783 () Bool)

(assert (=> b!1031895 m!951783))

(declare-fun m!951785 () Bool)

(assert (=> b!1031894 m!951785))

(declare-fun m!951787 () Bool)

(assert (=> b!1031894 m!951787))

(declare-fun m!951789 () Bool)

(assert (=> b!1031894 m!951789))

(declare-fun m!951791 () Bool)

(assert (=> b!1031894 m!951791))

(declare-fun m!951793 () Bool)

(assert (=> b!1031894 m!951793))

(declare-fun m!951795 () Bool)

(assert (=> b!1031894 m!951795))

(declare-fun m!951797 () Bool)

(assert (=> b!1031894 m!951797))

(declare-fun m!951799 () Bool)

(assert (=> b!1031894 m!951799))

(assert (=> b!1031894 m!951797))

(declare-fun m!951801 () Bool)

(assert (=> b!1031894 m!951801))

(declare-fun m!951803 () Bool)

(assert (=> b!1031894 m!951803))

(declare-fun m!951805 () Bool)

(assert (=> b!1031894 m!951805))

(declare-fun m!951807 () Bool)

(assert (=> b!1031894 m!951807))

(declare-fun m!951809 () Bool)

(assert (=> b!1031894 m!951809))

(declare-fun m!951811 () Bool)

(assert (=> b!1031894 m!951811))

(declare-fun m!951813 () Bool)

(assert (=> b!1031894 m!951813))

(declare-fun m!951815 () Bool)

(assert (=> b!1031894 m!951815))

(declare-fun m!951817 () Bool)

(assert (=> b!1031894 m!951817))

(declare-fun m!951819 () Bool)

(assert (=> b!1031894 m!951819))

(declare-fun m!951821 () Bool)

(assert (=> b!1031894 m!951821))

(assert (=> b!1031894 m!951803))

(declare-fun m!951823 () Bool)

(assert (=> b!1031891 m!951823))

(declare-fun m!951825 () Bool)

(assert (=> b!1031891 m!951825))

(declare-fun m!951827 () Bool)

(assert (=> mapNonEmpty!38076 m!951827))

(declare-fun m!951829 () Bool)

(assert (=> b!1031890 m!951829))

(declare-fun m!951831 () Bool)

(assert (=> start!90086 m!951831))

(check-sat (not b!1031894) (not b!1031895) (not b!1031890) (not b_lambda!16017) (not b!1031887) (not mapNonEmpty!38076) tp_is_empty!24415 b_and!33133 (not start!90086) (not b_next!20695) (not b!1031891))
(check-sat b_and!33133 (not b_next!20695))
