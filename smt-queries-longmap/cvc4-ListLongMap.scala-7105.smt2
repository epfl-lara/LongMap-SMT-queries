; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90080 () Bool)

(assert start!90080)

(declare-fun b!1031889 () Bool)

(declare-fun b_free!20687 () Bool)

(declare-fun b_next!20687 () Bool)

(assert (=> b!1031889 (= b_free!20687 (not b_next!20687))))

(declare-fun tp!73132 () Bool)

(declare-fun b_and!33141 () Bool)

(assert (=> b!1031889 (= tp!73132 b_and!33141)))

(declare-fun b!1031884 () Bool)

(declare-datatypes ((Unit!33777 0))(
  ( (Unit!33778) )
))
(declare-fun e!582893 () Unit!33777)

(declare-fun Unit!33779 () Unit!33777)

(assert (=> b!1031884 (= e!582893 Unit!33779)))

(declare-fun mapIsEmpty!38064 () Bool)

(declare-fun mapRes!38064 () Bool)

(assert (=> mapIsEmpty!38064 mapRes!38064))

(declare-fun b!1031886 () Bool)

(declare-fun e!582897 () Bool)

(declare-datatypes ((V!37415 0))(
  ( (V!37416 (val!12254 Int)) )
))
(declare-datatypes ((ValueCell!11500 0))(
  ( (ValueCellFull!11500 (v!14831 V!37415)) (EmptyCell!11500) )
))
(declare-datatypes ((array!64878 0))(
  ( (array!64879 (arr!31241 (Array (_ BitVec 32) (_ BitVec 64))) (size!31758 (_ BitVec 32))) )
))
(declare-datatypes ((array!64880 0))(
  ( (array!64881 (arr!31242 (Array (_ BitVec 32) ValueCell!11500)) (size!31759 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5594 0))(
  ( (LongMapFixedSize!5595 (defaultEntry!6171 Int) (mask!29975 (_ BitVec 32)) (extraKeys!5903 (_ BitVec 32)) (zeroValue!6007 V!37415) (minValue!6007 V!37415) (_size!2852 (_ BitVec 32)) (_keys!11344 array!64878) (_values!6194 array!64880) (_vacant!2852 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15698 0))(
  ( (tuple2!15699 (_1!7860 Unit!33777) (_2!7860 LongMapFixedSize!5594)) )
))
(declare-fun lt!455770 () tuple2!15698)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031886 (= e!582897 (arrayContainsKey!0 (_keys!11344 (_2!7860 lt!455770)) key!909 #b00000000000000000000000000000000))))

(declare-fun b!1031887 () Bool)

(declare-fun e!582896 () Bool)

(declare-fun tp_is_empty!24407 () Bool)

(assert (=> b!1031887 (= e!582896 tp_is_empty!24407)))

(declare-fun b!1031888 () Bool)

(declare-fun e!582894 () Bool)

(declare-fun e!582895 () Bool)

(assert (=> b!1031888 (= e!582894 e!582895)))

(declare-fun res!689852 () Bool)

(assert (=> b!1031888 (=> (not res!689852) (not e!582895))))

(declare-datatypes ((SeekEntryResult!9717 0))(
  ( (MissingZero!9717 (index!41239 (_ BitVec 32))) (Found!9717 (index!41240 (_ BitVec 32))) (Intermediate!9717 (undefined!10529 Bool) (index!41241 (_ BitVec 32)) (x!91913 (_ BitVec 32))) (Undefined!9717) (MissingVacant!9717 (index!41242 (_ BitVec 32))) )
))
(declare-fun lt!455767 () SeekEntryResult!9717)

(assert (=> b!1031888 (= res!689852 (is-Found!9717 lt!455767))))

(declare-fun thiss!1427 () LongMapFixedSize!5594)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64878 (_ BitVec 32)) SeekEntryResult!9717)

(assert (=> b!1031888 (= lt!455767 (seekEntry!0 key!909 (_keys!11344 thiss!1427) (mask!29975 thiss!1427)))))

(declare-fun e!582890 () Bool)

(declare-fun e!582891 () Bool)

(declare-fun array_inv!24183 (array!64878) Bool)

(declare-fun array_inv!24184 (array!64880) Bool)

(assert (=> b!1031889 (= e!582890 (and tp!73132 tp_is_empty!24407 (array_inv!24183 (_keys!11344 thiss!1427)) (array_inv!24184 (_values!6194 thiss!1427)) e!582891))))

(declare-fun mapNonEmpty!38064 () Bool)

(declare-fun tp!73131 () Bool)

(declare-fun e!582892 () Bool)

(assert (=> mapNonEmpty!38064 (= mapRes!38064 (and tp!73131 e!582892))))

(declare-fun mapKey!38064 () (_ BitVec 32))

(declare-fun mapRest!38064 () (Array (_ BitVec 32) ValueCell!11500))

(declare-fun mapValue!38064 () ValueCell!11500)

(assert (=> mapNonEmpty!38064 (= (arr!31242 (_values!6194 thiss!1427)) (store mapRest!38064 mapKey!38064 mapValue!38064))))

(declare-fun b!1031890 () Bool)

(declare-fun res!689855 () Bool)

(assert (=> b!1031890 (=> (not res!689855) (not e!582894))))

(assert (=> b!1031890 (= res!689855 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1031891 () Bool)

(declare-fun e!582888 () Bool)

(assert (=> b!1031891 (= e!582888 false)))

(declare-fun b!1031892 () Bool)

(assert (=> b!1031892 (= e!582895 (not true))))

(declare-fun lt!455775 () Bool)

(declare-fun valid!2117 (LongMapFixedSize!5594) Bool)

(assert (=> b!1031892 (= lt!455775 (valid!2117 (_2!7860 lt!455770)))))

(declare-fun lt!455771 () Unit!33777)

(assert (=> b!1031892 (= lt!455771 e!582893)))

(declare-fun c!104265 () Bool)

(declare-datatypes ((tuple2!15700 0))(
  ( (tuple2!15701 (_1!7861 (_ BitVec 64)) (_2!7861 V!37415)) )
))
(declare-datatypes ((List!21883 0))(
  ( (Nil!21880) (Cons!21879 (h!23081 tuple2!15700) (t!31065 List!21883)) )
))
(declare-datatypes ((ListLongMap!13741 0))(
  ( (ListLongMap!13742 (toList!6886 List!21883)) )
))
(declare-fun contains!6000 (ListLongMap!13741 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3934 (array!64878 array!64880 (_ BitVec 32) (_ BitVec 32) V!37415 V!37415 (_ BitVec 32) Int) ListLongMap!13741)

(assert (=> b!1031892 (= c!104265 (contains!6000 (getCurrentListMap!3934 (_keys!11344 (_2!7860 lt!455770)) (_values!6194 (_2!7860 lt!455770)) (mask!29975 (_2!7860 lt!455770)) (extraKeys!5903 (_2!7860 lt!455770)) (zeroValue!6007 (_2!7860 lt!455770)) (minValue!6007 (_2!7860 lt!455770)) #b00000000000000000000000000000000 (defaultEntry!6171 (_2!7860 lt!455770))) key!909))))

(declare-fun lt!455768 () array!64880)

(declare-fun lt!455773 () array!64878)

(declare-fun Unit!33780 () Unit!33777)

(declare-fun Unit!33781 () Unit!33777)

(assert (=> b!1031892 (= lt!455770 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2852 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15699 Unit!33780 (LongMapFixedSize!5595 (defaultEntry!6171 thiss!1427) (mask!29975 thiss!1427) (extraKeys!5903 thiss!1427) (zeroValue!6007 thiss!1427) (minValue!6007 thiss!1427) (bvsub (_size!2852 thiss!1427) #b00000000000000000000000000000001) lt!455773 lt!455768 (bvadd #b00000000000000000000000000000001 (_vacant!2852 thiss!1427)))) (tuple2!15699 Unit!33781 (LongMapFixedSize!5595 (defaultEntry!6171 thiss!1427) (mask!29975 thiss!1427) (extraKeys!5903 thiss!1427) (zeroValue!6007 thiss!1427) (minValue!6007 thiss!1427) (bvsub (_size!2852 thiss!1427) #b00000000000000000000000000000001) lt!455773 lt!455768 (_vacant!2852 thiss!1427)))))))

(declare-fun -!513 (ListLongMap!13741 (_ BitVec 64)) ListLongMap!13741)

(assert (=> b!1031892 (= (-!513 (getCurrentListMap!3934 (_keys!11344 thiss!1427) (_values!6194 thiss!1427) (mask!29975 thiss!1427) (extraKeys!5903 thiss!1427) (zeroValue!6007 thiss!1427) (minValue!6007 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6171 thiss!1427)) key!909) (getCurrentListMap!3934 lt!455773 lt!455768 (mask!29975 thiss!1427) (extraKeys!5903 thiss!1427) (zeroValue!6007 thiss!1427) (minValue!6007 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6171 thiss!1427)))))

(declare-fun dynLambda!1983 (Int (_ BitVec 64)) V!37415)

(assert (=> b!1031892 (= lt!455768 (array!64881 (store (arr!31242 (_values!6194 thiss!1427)) (index!41240 lt!455767) (ValueCellFull!11500 (dynLambda!1983 (defaultEntry!6171 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31759 (_values!6194 thiss!1427))))))

(declare-fun lt!455777 () Unit!33777)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!39 (array!64878 array!64880 (_ BitVec 32) (_ BitVec 32) V!37415 V!37415 (_ BitVec 32) (_ BitVec 64) Int) Unit!33777)

(assert (=> b!1031892 (= lt!455777 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!39 (_keys!11344 thiss!1427) (_values!6194 thiss!1427) (mask!29975 thiss!1427) (extraKeys!5903 thiss!1427) (zeroValue!6007 thiss!1427) (minValue!6007 thiss!1427) (index!41240 lt!455767) key!909 (defaultEntry!6171 thiss!1427)))))

(assert (=> b!1031892 (not (arrayContainsKey!0 lt!455773 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455766 () Unit!33777)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64878 (_ BitVec 32) (_ BitVec 64)) Unit!33777)

(assert (=> b!1031892 (= lt!455766 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11344 thiss!1427) (index!41240 lt!455767) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64878 (_ BitVec 32)) Bool)

(assert (=> b!1031892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455773 (mask!29975 thiss!1427))))

(declare-fun lt!455774 () Unit!33777)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64878 (_ BitVec 32) (_ BitVec 32)) Unit!33777)

(assert (=> b!1031892 (= lt!455774 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11344 thiss!1427) (index!41240 lt!455767) (mask!29975 thiss!1427)))))

(declare-datatypes ((List!21884 0))(
  ( (Nil!21881) (Cons!21880 (h!23082 (_ BitVec 64)) (t!31066 List!21884)) )
))
(declare-fun arrayNoDuplicates!0 (array!64878 (_ BitVec 32) List!21884) Bool)

(assert (=> b!1031892 (arrayNoDuplicates!0 lt!455773 #b00000000000000000000000000000000 Nil!21881)))

(declare-fun lt!455776 () Unit!33777)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64878 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21884) Unit!33777)

(assert (=> b!1031892 (= lt!455776 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11344 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41240 lt!455767) #b00000000000000000000000000000000 Nil!21881))))

(declare-fun arrayCountValidKeys!0 (array!64878 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031892 (= (arrayCountValidKeys!0 lt!455773 #b00000000000000000000000000000000 (size!31758 (_keys!11344 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11344 thiss!1427) #b00000000000000000000000000000000 (size!31758 (_keys!11344 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031892 (= lt!455773 (array!64879 (store (arr!31241 (_keys!11344 thiss!1427)) (index!41240 lt!455767) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31758 (_keys!11344 thiss!1427))))))

(declare-fun lt!455769 () Unit!33777)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64878 (_ BitVec 32) (_ BitVec 64)) Unit!33777)

(assert (=> b!1031892 (= lt!455769 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11344 thiss!1427) (index!41240 lt!455767) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031893 () Bool)

(declare-fun Unit!33782 () Unit!33777)

(assert (=> b!1031893 (= e!582893 Unit!33782)))

(declare-fun lt!455772 () Unit!33777)

(declare-fun lemmaKeyInListMapIsInArray!348 (array!64878 array!64880 (_ BitVec 32) (_ BitVec 32) V!37415 V!37415 (_ BitVec 64) Int) Unit!33777)

(assert (=> b!1031893 (= lt!455772 (lemmaKeyInListMapIsInArray!348 (_keys!11344 (_2!7860 lt!455770)) (_values!6194 (_2!7860 lt!455770)) (mask!29975 (_2!7860 lt!455770)) (extraKeys!5903 (_2!7860 lt!455770)) (zeroValue!6007 (_2!7860 lt!455770)) (minValue!6007 (_2!7860 lt!455770)) key!909 (defaultEntry!6171 (_2!7860 lt!455770))))))

(declare-fun c!104264 () Bool)

(assert (=> b!1031893 (= c!104264 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!689854 () Bool)

(assert (=> b!1031893 (= res!689854 e!582897)))

(assert (=> b!1031893 (=> (not res!689854) (not e!582888))))

(assert (=> b!1031893 e!582888))

(declare-fun b!1031894 () Bool)

(assert (=> b!1031894 (= e!582892 tp_is_empty!24407)))

(declare-fun b!1031895 () Bool)

(assert (=> b!1031895 (= e!582897 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5903 (_2!7860 lt!455770)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5903 (_2!7860 lt!455770)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!689853 () Bool)

(assert (=> start!90080 (=> (not res!689853) (not e!582894))))

(assert (=> start!90080 (= res!689853 (valid!2117 thiss!1427))))

(assert (=> start!90080 e!582894))

(assert (=> start!90080 e!582890))

(assert (=> start!90080 true))

(declare-fun b!1031885 () Bool)

(assert (=> b!1031885 (= e!582891 (and e!582896 mapRes!38064))))

(declare-fun condMapEmpty!38064 () Bool)

(declare-fun mapDefault!38064 () ValueCell!11500)

