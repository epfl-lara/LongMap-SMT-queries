; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90082 () Bool)

(assert start!90082)

(declare-fun b!1031923 () Bool)

(declare-fun b_free!20689 () Bool)

(declare-fun b_next!20689 () Bool)

(assert (=> b!1031923 (= b_free!20689 (not b_next!20689))))

(declare-fun tp!73137 () Bool)

(declare-fun b_and!33145 () Bool)

(assert (=> b!1031923 (= tp!73137 b_and!33145)))

(declare-fun b!1031922 () Bool)

(declare-fun e!582924 () Bool)

(declare-fun tp_is_empty!24409 () Bool)

(assert (=> b!1031922 (= e!582924 tp_is_empty!24409)))

(declare-fun e!582923 () Bool)

(declare-fun e!582918 () Bool)

(declare-datatypes ((V!37419 0))(
  ( (V!37420 (val!12255 Int)) )
))
(declare-datatypes ((ValueCell!11501 0))(
  ( (ValueCellFull!11501 (v!14832 V!37419)) (EmptyCell!11501) )
))
(declare-datatypes ((array!64882 0))(
  ( (array!64883 (arr!31243 (Array (_ BitVec 32) (_ BitVec 64))) (size!31760 (_ BitVec 32))) )
))
(declare-datatypes ((array!64884 0))(
  ( (array!64885 (arr!31244 (Array (_ BitVec 32) ValueCell!11501)) (size!31761 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5596 0))(
  ( (LongMapFixedSize!5597 (defaultEntry!6172 Int) (mask!29978 (_ BitVec 32)) (extraKeys!5904 (_ BitVec 32)) (zeroValue!6008 V!37419) (minValue!6008 V!37419) (_size!2853 (_ BitVec 32)) (_keys!11345 array!64882) (_values!6195 array!64884) (_vacant!2853 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5596)

(declare-fun array_inv!24185 (array!64882) Bool)

(declare-fun array_inv!24186 (array!64884) Bool)

(assert (=> b!1031923 (= e!582918 (and tp!73137 tp_is_empty!24409 (array_inv!24185 (_keys!11345 thiss!1427)) (array_inv!24186 (_values!6195 thiss!1427)) e!582923))))

(declare-fun b!1031924 () Bool)

(declare-fun e!582919 () Bool)

(assert (=> b!1031924 (= e!582919 false)))

(declare-fun b!1031925 () Bool)

(declare-fun e!582920 () Bool)

(assert (=> b!1031925 (= e!582920 (not true))))

(declare-fun lt!455803 () Bool)

(declare-datatypes ((Unit!33783 0))(
  ( (Unit!33784) )
))
(declare-datatypes ((tuple2!15702 0))(
  ( (tuple2!15703 (_1!7862 Unit!33783) (_2!7862 LongMapFixedSize!5596)) )
))
(declare-fun lt!455807 () tuple2!15702)

(declare-fun valid!2118 (LongMapFixedSize!5596) Bool)

(assert (=> b!1031925 (= lt!455803 (valid!2118 (_2!7862 lt!455807)))))

(declare-fun lt!455813 () Unit!33783)

(declare-fun e!582922 () Unit!33783)

(assert (=> b!1031925 (= lt!455813 e!582922)))

(declare-fun c!104271 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15704 0))(
  ( (tuple2!15705 (_1!7863 (_ BitVec 64)) (_2!7863 V!37419)) )
))
(declare-datatypes ((List!21885 0))(
  ( (Nil!21882) (Cons!21881 (h!23083 tuple2!15704) (t!31069 List!21885)) )
))
(declare-datatypes ((ListLongMap!13743 0))(
  ( (ListLongMap!13744 (toList!6887 List!21885)) )
))
(declare-fun contains!6001 (ListLongMap!13743 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3935 (array!64882 array!64884 (_ BitVec 32) (_ BitVec 32) V!37419 V!37419 (_ BitVec 32) Int) ListLongMap!13743)

(assert (=> b!1031925 (= c!104271 (contains!6001 (getCurrentListMap!3935 (_keys!11345 (_2!7862 lt!455807)) (_values!6195 (_2!7862 lt!455807)) (mask!29978 (_2!7862 lt!455807)) (extraKeys!5904 (_2!7862 lt!455807)) (zeroValue!6008 (_2!7862 lt!455807)) (minValue!6008 (_2!7862 lt!455807)) #b00000000000000000000000000000000 (defaultEntry!6172 (_2!7862 lt!455807))) key!909))))

(declare-fun lt!455808 () array!64882)

(declare-fun lt!455802 () array!64884)

(declare-fun Unit!33785 () Unit!33783)

(declare-fun Unit!33786 () Unit!33783)

(assert (=> b!1031925 (= lt!455807 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2853 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15703 Unit!33785 (LongMapFixedSize!5597 (defaultEntry!6172 thiss!1427) (mask!29978 thiss!1427) (extraKeys!5904 thiss!1427) (zeroValue!6008 thiss!1427) (minValue!6008 thiss!1427) (bvsub (_size!2853 thiss!1427) #b00000000000000000000000000000001) lt!455808 lt!455802 (bvadd #b00000000000000000000000000000001 (_vacant!2853 thiss!1427)))) (tuple2!15703 Unit!33786 (LongMapFixedSize!5597 (defaultEntry!6172 thiss!1427) (mask!29978 thiss!1427) (extraKeys!5904 thiss!1427) (zeroValue!6008 thiss!1427) (minValue!6008 thiss!1427) (bvsub (_size!2853 thiss!1427) #b00000000000000000000000000000001) lt!455808 lt!455802 (_vacant!2853 thiss!1427)))))))

(declare-fun -!514 (ListLongMap!13743 (_ BitVec 64)) ListLongMap!13743)

(assert (=> b!1031925 (= (-!514 (getCurrentListMap!3935 (_keys!11345 thiss!1427) (_values!6195 thiss!1427) (mask!29978 thiss!1427) (extraKeys!5904 thiss!1427) (zeroValue!6008 thiss!1427) (minValue!6008 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6172 thiss!1427)) key!909) (getCurrentListMap!3935 lt!455808 lt!455802 (mask!29978 thiss!1427) (extraKeys!5904 thiss!1427) (zeroValue!6008 thiss!1427) (minValue!6008 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6172 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9718 0))(
  ( (MissingZero!9718 (index!41243 (_ BitVec 32))) (Found!9718 (index!41244 (_ BitVec 32))) (Intermediate!9718 (undefined!10530 Bool) (index!41245 (_ BitVec 32)) (x!91924 (_ BitVec 32))) (Undefined!9718) (MissingVacant!9718 (index!41246 (_ BitVec 32))) )
))
(declare-fun lt!455810 () SeekEntryResult!9718)

(declare-fun dynLambda!1984 (Int (_ BitVec 64)) V!37419)

(assert (=> b!1031925 (= lt!455802 (array!64885 (store (arr!31244 (_values!6195 thiss!1427)) (index!41244 lt!455810) (ValueCellFull!11501 (dynLambda!1984 (defaultEntry!6172 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31761 (_values!6195 thiss!1427))))))

(declare-fun lt!455804 () Unit!33783)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!40 (array!64882 array!64884 (_ BitVec 32) (_ BitVec 32) V!37419 V!37419 (_ BitVec 32) (_ BitVec 64) Int) Unit!33783)

(assert (=> b!1031925 (= lt!455804 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!40 (_keys!11345 thiss!1427) (_values!6195 thiss!1427) (mask!29978 thiss!1427) (extraKeys!5904 thiss!1427) (zeroValue!6008 thiss!1427) (minValue!6008 thiss!1427) (index!41244 lt!455810) key!909 (defaultEntry!6172 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031925 (not (arrayContainsKey!0 lt!455808 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455806 () Unit!33783)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64882 (_ BitVec 32) (_ BitVec 64)) Unit!33783)

(assert (=> b!1031925 (= lt!455806 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11345 thiss!1427) (index!41244 lt!455810) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64882 (_ BitVec 32)) Bool)

(assert (=> b!1031925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455808 (mask!29978 thiss!1427))))

(declare-fun lt!455811 () Unit!33783)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64882 (_ BitVec 32) (_ BitVec 32)) Unit!33783)

(assert (=> b!1031925 (= lt!455811 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11345 thiss!1427) (index!41244 lt!455810) (mask!29978 thiss!1427)))))

(declare-datatypes ((List!21886 0))(
  ( (Nil!21883) (Cons!21882 (h!23084 (_ BitVec 64)) (t!31070 List!21886)) )
))
(declare-fun arrayNoDuplicates!0 (array!64882 (_ BitVec 32) List!21886) Bool)

(assert (=> b!1031925 (arrayNoDuplicates!0 lt!455808 #b00000000000000000000000000000000 Nil!21883)))

(declare-fun lt!455809 () Unit!33783)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64882 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21886) Unit!33783)

(assert (=> b!1031925 (= lt!455809 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11345 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41244 lt!455810) #b00000000000000000000000000000000 Nil!21883))))

(declare-fun arrayCountValidKeys!0 (array!64882 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031925 (= (arrayCountValidKeys!0 lt!455808 #b00000000000000000000000000000000 (size!31760 (_keys!11345 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11345 thiss!1427) #b00000000000000000000000000000000 (size!31760 (_keys!11345 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031925 (= lt!455808 (array!64883 (store (arr!31243 (_keys!11345 thiss!1427)) (index!41244 lt!455810) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31760 (_keys!11345 thiss!1427))))))

(declare-fun lt!455805 () Unit!33783)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64882 (_ BitVec 32) (_ BitVec 64)) Unit!33783)

(assert (=> b!1031925 (= lt!455805 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11345 thiss!1427) (index!41244 lt!455810) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031926 () Bool)

(declare-fun e!582927 () Bool)

(assert (=> b!1031926 (= e!582927 (arrayContainsKey!0 (_keys!11345 (_2!7862 lt!455807)) key!909 #b00000000000000000000000000000000))))

(declare-fun b!1031927 () Bool)

(declare-fun e!582925 () Bool)

(assert (=> b!1031927 (= e!582925 e!582920)))

(declare-fun res!689867 () Bool)

(assert (=> b!1031927 (=> (not res!689867) (not e!582920))))

(assert (=> b!1031927 (= res!689867 (is-Found!9718 lt!455810))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64882 (_ BitVec 32)) SeekEntryResult!9718)

(assert (=> b!1031927 (= lt!455810 (seekEntry!0 key!909 (_keys!11345 thiss!1427) (mask!29978 thiss!1427)))))

(declare-fun mapIsEmpty!38067 () Bool)

(declare-fun mapRes!38067 () Bool)

(assert (=> mapIsEmpty!38067 mapRes!38067))

(declare-fun b!1031928 () Bool)

(declare-fun Unit!33787 () Unit!33783)

(assert (=> b!1031928 (= e!582922 Unit!33787)))

(declare-fun res!689866 () Bool)

(assert (=> start!90082 (=> (not res!689866) (not e!582925))))

(assert (=> start!90082 (= res!689866 (valid!2118 thiss!1427))))

(assert (=> start!90082 e!582925))

(assert (=> start!90082 e!582918))

(assert (=> start!90082 true))

(declare-fun mapNonEmpty!38067 () Bool)

(declare-fun tp!73138 () Bool)

(assert (=> mapNonEmpty!38067 (= mapRes!38067 (and tp!73138 e!582924))))

(declare-fun mapValue!38067 () ValueCell!11501)

(declare-fun mapKey!38067 () (_ BitVec 32))

(declare-fun mapRest!38067 () (Array (_ BitVec 32) ValueCell!11501))

(assert (=> mapNonEmpty!38067 (= (arr!31244 (_values!6195 thiss!1427)) (store mapRest!38067 mapKey!38067 mapValue!38067))))

(declare-fun b!1031929 () Bool)

(assert (=> b!1031929 (= e!582927 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5904 (_2!7862 lt!455807)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5904 (_2!7862 lt!455807)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1031930 () Bool)

(declare-fun res!689864 () Bool)

(assert (=> b!1031930 (=> (not res!689864) (not e!582925))))

(assert (=> b!1031930 (= res!689864 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1031931 () Bool)

(declare-fun Unit!33788 () Unit!33783)

(assert (=> b!1031931 (= e!582922 Unit!33788)))

(declare-fun lt!455812 () Unit!33783)

(declare-fun lemmaKeyInListMapIsInArray!349 (array!64882 array!64884 (_ BitVec 32) (_ BitVec 32) V!37419 V!37419 (_ BitVec 64) Int) Unit!33783)

(assert (=> b!1031931 (= lt!455812 (lemmaKeyInListMapIsInArray!349 (_keys!11345 (_2!7862 lt!455807)) (_values!6195 (_2!7862 lt!455807)) (mask!29978 (_2!7862 lt!455807)) (extraKeys!5904 (_2!7862 lt!455807)) (zeroValue!6008 (_2!7862 lt!455807)) (minValue!6008 (_2!7862 lt!455807)) key!909 (defaultEntry!6172 (_2!7862 lt!455807))))))

(declare-fun c!104270 () Bool)

(assert (=> b!1031931 (= c!104270 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!689865 () Bool)

(assert (=> b!1031931 (= res!689865 e!582927)))

(assert (=> b!1031931 (=> (not res!689865) (not e!582919))))

(assert (=> b!1031931 e!582919))

(declare-fun b!1031932 () Bool)

(declare-fun e!582926 () Bool)

(assert (=> b!1031932 (= e!582926 tp_is_empty!24409)))

(declare-fun b!1031933 () Bool)

(assert (=> b!1031933 (= e!582923 (and e!582926 mapRes!38067))))

(declare-fun condMapEmpty!38067 () Bool)

(declare-fun mapDefault!38067 () ValueCell!11501)

