; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90088 () Bool)

(assert start!90088)

(declare-fun b!1032044 () Bool)

(declare-fun b_free!20695 () Bool)

(declare-fun b_next!20695 () Bool)

(assert (=> b!1032044 (= b_free!20695 (not b_next!20695))))

(declare-fun tp!73155 () Bool)

(declare-fun b_and!33157 () Bool)

(assert (=> b!1032044 (= tp!73155 b_and!33157)))

(declare-fun b!1032036 () Bool)

(declare-datatypes ((Unit!33800 0))(
  ( (Unit!33801) )
))
(declare-fun e!583017 () Unit!33800)

(declare-fun Unit!33802 () Unit!33800)

(assert (=> b!1032036 (= e!583017 Unit!33802)))

(declare-fun res!689901 () Bool)

(declare-fun e!583012 () Bool)

(assert (=> start!90088 (=> (not res!689901) (not e!583012))))

(declare-datatypes ((V!37427 0))(
  ( (V!37428 (val!12258 Int)) )
))
(declare-datatypes ((ValueCell!11504 0))(
  ( (ValueCellFull!11504 (v!14835 V!37427)) (EmptyCell!11504) )
))
(declare-datatypes ((array!64894 0))(
  ( (array!64895 (arr!31249 (Array (_ BitVec 32) (_ BitVec 64))) (size!31766 (_ BitVec 32))) )
))
(declare-datatypes ((array!64896 0))(
  ( (array!64897 (arr!31250 (Array (_ BitVec 32) ValueCell!11504)) (size!31767 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5602 0))(
  ( (LongMapFixedSize!5603 (defaultEntry!6175 Int) (mask!29983 (_ BitVec 32)) (extraKeys!5907 (_ BitVec 32)) (zeroValue!6011 V!37427) (minValue!6011 V!37427) (_size!2856 (_ BitVec 32)) (_keys!11348 array!64894) (_values!6198 array!64896) (_vacant!2856 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5602)

(declare-fun valid!2121 (LongMapFixedSize!5602) Bool)

(assert (=> start!90088 (= res!689901 (valid!2121 thiss!1427))))

(assert (=> start!90088 e!583012))

(declare-fun e!583014 () Bool)

(assert (=> start!90088 e!583014))

(assert (=> start!90088 true))

(declare-fun b!1032037 () Bool)

(declare-fun e!583008 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15714 0))(
  ( (tuple2!15715 (_1!7868 Unit!33800) (_2!7868 LongMapFixedSize!5602)) )
))
(declare-fun lt!455916 () tuple2!15714)

(assert (=> b!1032037 (= e!583008 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5907 (_2!7868 lt!455916)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5907 (_2!7868 lt!455916)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1032038 () Bool)

(declare-fun e!583009 () Bool)

(assert (=> b!1032038 (= e!583012 e!583009)))

(declare-fun res!689900 () Bool)

(assert (=> b!1032038 (=> (not res!689900) (not e!583009))))

(declare-datatypes ((SeekEntryResult!9721 0))(
  ( (MissingZero!9721 (index!41255 (_ BitVec 32))) (Found!9721 (index!41256 (_ BitVec 32))) (Intermediate!9721 (undefined!10533 Bool) (index!41257 (_ BitVec 32)) (x!91941 (_ BitVec 32))) (Undefined!9721) (MissingVacant!9721 (index!41258 (_ BitVec 32))) )
))
(declare-fun lt!455910 () SeekEntryResult!9721)

(assert (=> b!1032038 (= res!689900 (is-Found!9721 lt!455910))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64894 (_ BitVec 32)) SeekEntryResult!9721)

(assert (=> b!1032038 (= lt!455910 (seekEntry!0 key!909 (_keys!11348 thiss!1427) (mask!29983 thiss!1427)))))

(declare-fun b!1032039 () Bool)

(declare-fun e!583010 () Bool)

(declare-fun tp_is_empty!24415 () Bool)

(assert (=> b!1032039 (= e!583010 tp_is_empty!24415)))

(declare-fun b!1032040 () Bool)

(declare-fun Unit!33803 () Unit!33800)

(assert (=> b!1032040 (= e!583017 Unit!33803)))

(declare-fun lt!455914 () Unit!33800)

(declare-fun lemmaKeyInListMapIsInArray!352 (array!64894 array!64896 (_ BitVec 32) (_ BitVec 32) V!37427 V!37427 (_ BitVec 64) Int) Unit!33800)

(assert (=> b!1032040 (= lt!455914 (lemmaKeyInListMapIsInArray!352 (_keys!11348 (_2!7868 lt!455916)) (_values!6198 (_2!7868 lt!455916)) (mask!29983 (_2!7868 lt!455916)) (extraKeys!5907 (_2!7868 lt!455916)) (zeroValue!6011 (_2!7868 lt!455916)) (minValue!6011 (_2!7868 lt!455916)) key!909 (defaultEntry!6175 (_2!7868 lt!455916))))))

(declare-fun c!104288 () Bool)

(assert (=> b!1032040 (= c!104288 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!689902 () Bool)

(assert (=> b!1032040 (= res!689902 e!583008)))

(declare-fun e!583015 () Bool)

(assert (=> b!1032040 (=> (not res!689902) (not e!583015))))

(assert (=> b!1032040 e!583015))

(declare-fun b!1032041 () Bool)

(assert (=> b!1032041 (= e!583009 (not true))))

(declare-fun lt!455913 () Bool)

(assert (=> b!1032041 (= lt!455913 (valid!2121 (_2!7868 lt!455916)))))

(declare-fun lt!455911 () Unit!33800)

(assert (=> b!1032041 (= lt!455911 e!583017)))

(declare-fun c!104289 () Bool)

(declare-datatypes ((tuple2!15716 0))(
  ( (tuple2!15717 (_1!7869 (_ BitVec 64)) (_2!7869 V!37427)) )
))
(declare-datatypes ((List!21891 0))(
  ( (Nil!21888) (Cons!21887 (h!23089 tuple2!15716) (t!31081 List!21891)) )
))
(declare-datatypes ((ListLongMap!13749 0))(
  ( (ListLongMap!13750 (toList!6890 List!21891)) )
))
(declare-fun contains!6004 (ListLongMap!13749 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3938 (array!64894 array!64896 (_ BitVec 32) (_ BitVec 32) V!37427 V!37427 (_ BitVec 32) Int) ListLongMap!13749)

(assert (=> b!1032041 (= c!104289 (contains!6004 (getCurrentListMap!3938 (_keys!11348 (_2!7868 lt!455916)) (_values!6198 (_2!7868 lt!455916)) (mask!29983 (_2!7868 lt!455916)) (extraKeys!5907 (_2!7868 lt!455916)) (zeroValue!6011 (_2!7868 lt!455916)) (minValue!6011 (_2!7868 lt!455916)) #b00000000000000000000000000000000 (defaultEntry!6175 (_2!7868 lt!455916))) key!909))))

(declare-fun lt!455912 () array!64896)

(declare-fun lt!455921 () array!64894)

(declare-fun Unit!33804 () Unit!33800)

(declare-fun Unit!33805 () Unit!33800)

(assert (=> b!1032041 (= lt!455916 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2856 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15715 Unit!33804 (LongMapFixedSize!5603 (defaultEntry!6175 thiss!1427) (mask!29983 thiss!1427) (extraKeys!5907 thiss!1427) (zeroValue!6011 thiss!1427) (minValue!6011 thiss!1427) (bvsub (_size!2856 thiss!1427) #b00000000000000000000000000000001) lt!455921 lt!455912 (bvadd #b00000000000000000000000000000001 (_vacant!2856 thiss!1427)))) (tuple2!15715 Unit!33805 (LongMapFixedSize!5603 (defaultEntry!6175 thiss!1427) (mask!29983 thiss!1427) (extraKeys!5907 thiss!1427) (zeroValue!6011 thiss!1427) (minValue!6011 thiss!1427) (bvsub (_size!2856 thiss!1427) #b00000000000000000000000000000001) lt!455921 lt!455912 (_vacant!2856 thiss!1427)))))))

(declare-fun -!517 (ListLongMap!13749 (_ BitVec 64)) ListLongMap!13749)

(assert (=> b!1032041 (= (-!517 (getCurrentListMap!3938 (_keys!11348 thiss!1427) (_values!6198 thiss!1427) (mask!29983 thiss!1427) (extraKeys!5907 thiss!1427) (zeroValue!6011 thiss!1427) (minValue!6011 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6175 thiss!1427)) key!909) (getCurrentListMap!3938 lt!455921 lt!455912 (mask!29983 thiss!1427) (extraKeys!5907 thiss!1427) (zeroValue!6011 thiss!1427) (minValue!6011 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6175 thiss!1427)))))

(declare-fun dynLambda!1987 (Int (_ BitVec 64)) V!37427)

(assert (=> b!1032041 (= lt!455912 (array!64897 (store (arr!31250 (_values!6198 thiss!1427)) (index!41256 lt!455910) (ValueCellFull!11504 (dynLambda!1987 (defaultEntry!6175 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31767 (_values!6198 thiss!1427))))))

(declare-fun lt!455915 () Unit!33800)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!43 (array!64894 array!64896 (_ BitVec 32) (_ BitVec 32) V!37427 V!37427 (_ BitVec 32) (_ BitVec 64) Int) Unit!33800)

(assert (=> b!1032041 (= lt!455915 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!43 (_keys!11348 thiss!1427) (_values!6198 thiss!1427) (mask!29983 thiss!1427) (extraKeys!5907 thiss!1427) (zeroValue!6011 thiss!1427) (minValue!6011 thiss!1427) (index!41256 lt!455910) key!909 (defaultEntry!6175 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032041 (not (arrayContainsKey!0 lt!455921 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455917 () Unit!33800)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64894 (_ BitVec 32) (_ BitVec 64)) Unit!33800)

(assert (=> b!1032041 (= lt!455917 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11348 thiss!1427) (index!41256 lt!455910) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64894 (_ BitVec 32)) Bool)

(assert (=> b!1032041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455921 (mask!29983 thiss!1427))))

(declare-fun lt!455919 () Unit!33800)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64894 (_ BitVec 32) (_ BitVec 32)) Unit!33800)

(assert (=> b!1032041 (= lt!455919 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11348 thiss!1427) (index!41256 lt!455910) (mask!29983 thiss!1427)))))

(declare-datatypes ((List!21892 0))(
  ( (Nil!21889) (Cons!21888 (h!23090 (_ BitVec 64)) (t!31082 List!21892)) )
))
(declare-fun arrayNoDuplicates!0 (array!64894 (_ BitVec 32) List!21892) Bool)

(assert (=> b!1032041 (arrayNoDuplicates!0 lt!455921 #b00000000000000000000000000000000 Nil!21889)))

(declare-fun lt!455920 () Unit!33800)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64894 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21892) Unit!33800)

(assert (=> b!1032041 (= lt!455920 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11348 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41256 lt!455910) #b00000000000000000000000000000000 Nil!21889))))

(declare-fun arrayCountValidKeys!0 (array!64894 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032041 (= (arrayCountValidKeys!0 lt!455921 #b00000000000000000000000000000000 (size!31766 (_keys!11348 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11348 thiss!1427) #b00000000000000000000000000000000 (size!31766 (_keys!11348 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1032041 (= lt!455921 (array!64895 (store (arr!31249 (_keys!11348 thiss!1427)) (index!41256 lt!455910) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31766 (_keys!11348 thiss!1427))))))

(declare-fun lt!455918 () Unit!33800)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64894 (_ BitVec 32) (_ BitVec 64)) Unit!33800)

(assert (=> b!1032041 (= lt!455918 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11348 thiss!1427) (index!41256 lt!455910) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1032042 () Bool)

(assert (=> b!1032042 (= e!583008 (arrayContainsKey!0 (_keys!11348 (_2!7868 lt!455916)) key!909 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!38076 () Bool)

(declare-fun mapRes!38076 () Bool)

(assert (=> mapIsEmpty!38076 mapRes!38076))

(declare-fun mapNonEmpty!38076 () Bool)

(declare-fun tp!73156 () Bool)

(declare-fun e!583016 () Bool)

(assert (=> mapNonEmpty!38076 (= mapRes!38076 (and tp!73156 e!583016))))

(declare-fun mapValue!38076 () ValueCell!11504)

(declare-fun mapKey!38076 () (_ BitVec 32))

(declare-fun mapRest!38076 () (Array (_ BitVec 32) ValueCell!11504))

(assert (=> mapNonEmpty!38076 (= (arr!31250 (_values!6198 thiss!1427)) (store mapRest!38076 mapKey!38076 mapValue!38076))))

(declare-fun b!1032043 () Bool)

(assert (=> b!1032043 (= e!583016 tp_is_empty!24415)))

(declare-fun e!583011 () Bool)

(declare-fun array_inv!24191 (array!64894) Bool)

(declare-fun array_inv!24192 (array!64896) Bool)

(assert (=> b!1032044 (= e!583014 (and tp!73155 tp_is_empty!24415 (array_inv!24191 (_keys!11348 thiss!1427)) (array_inv!24192 (_values!6198 thiss!1427)) e!583011))))

(declare-fun b!1032045 () Bool)

(assert (=> b!1032045 (= e!583015 false)))

(declare-fun b!1032046 () Bool)

(declare-fun res!689903 () Bool)

(assert (=> b!1032046 (=> (not res!689903) (not e!583012))))

(assert (=> b!1032046 (= res!689903 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1032047 () Bool)

(assert (=> b!1032047 (= e!583011 (and e!583010 mapRes!38076))))

(declare-fun condMapEmpty!38076 () Bool)

(declare-fun mapDefault!38076 () ValueCell!11504)

