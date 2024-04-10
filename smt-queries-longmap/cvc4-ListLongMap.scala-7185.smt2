; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91994 () Bool)

(assert start!91994)

(declare-fun b!1046225 () Bool)

(declare-fun b_free!21167 () Bool)

(declare-fun b_next!21167 () Bool)

(assert (=> b!1046225 (= b_free!21167 (not b_next!21167))))

(declare-fun tp!74762 () Bool)

(declare-fun b_and!33829 () Bool)

(assert (=> b!1046225 (= tp!74762 b_and!33829)))

(declare-fun mapIsEmpty!38975 () Bool)

(declare-fun mapRes!38975 () Bool)

(assert (=> mapIsEmpty!38975 mapRes!38975))

(declare-fun b!1046221 () Bool)

(declare-fun e!593163 () Bool)

(declare-fun tp_is_empty!24887 () Bool)

(assert (=> b!1046221 (= e!593163 tp_is_empty!24887)))

(declare-fun b!1046222 () Bool)

(declare-fun e!593164 () Bool)

(assert (=> b!1046222 (= e!593164 false)))

(declare-fun e!593162 () Bool)

(assert (=> b!1046222 e!593162))

(declare-fun c!106371 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1046222 (= c!106371 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!34201 0))(
  ( (Unit!34202) )
))
(declare-fun lt!462159 () Unit!34201)

(declare-datatypes ((V!38055 0))(
  ( (V!38056 (val!12494 Int)) )
))
(declare-datatypes ((ValueCell!11740 0))(
  ( (ValueCellFull!11740 (v!15091 V!38055)) (EmptyCell!11740) )
))
(declare-datatypes ((array!65952 0))(
  ( (array!65953 (arr!31721 (Array (_ BitVec 32) (_ BitVec 64))) (size!32256 (_ BitVec 32))) )
))
(declare-datatypes ((array!65954 0))(
  ( (array!65955 (arr!31722 (Array (_ BitVec 32) ValueCell!11740)) (size!32257 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6074 0))(
  ( (LongMapFixedSize!6075 (defaultEntry!6435 Int) (mask!30578 (_ BitVec 32)) (extraKeys!6163 (_ BitVec 32)) (zeroValue!6269 V!38055) (minValue!6269 V!38055) (_size!3092 (_ BitVec 32)) (_keys!11709 array!65952) (_values!6458 array!65954) (_vacant!3092 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15838 0))(
  ( (tuple2!15839 (_1!7930 Unit!34201) (_2!7930 LongMapFixedSize!6074)) )
))
(declare-fun lt!462160 () tuple2!15838)

(declare-fun lemmaKeyInListMapIsInArray!357 (array!65952 array!65954 (_ BitVec 32) (_ BitVec 32) V!38055 V!38055 (_ BitVec 64) Int) Unit!34201)

(assert (=> b!1046222 (= lt!462159 (lemmaKeyInListMapIsInArray!357 (_keys!11709 (_2!7930 lt!462160)) (_values!6458 (_2!7930 lt!462160)) (mask!30578 (_2!7930 lt!462160)) (extraKeys!6163 (_2!7930 lt!462160)) (zeroValue!6269 (_2!7930 lt!462160)) (minValue!6269 (_2!7930 lt!462160)) key!909 (defaultEntry!6435 (_2!7930 lt!462160))))))

(declare-fun b!1046223 () Bool)

(declare-fun e!593158 () Bool)

(assert (=> b!1046223 (= e!593158 (not e!593164))))

(declare-fun res!696501 () Bool)

(assert (=> b!1046223 (=> res!696501 e!593164)))

(declare-datatypes ((tuple2!15840 0))(
  ( (tuple2!15841 (_1!7931 (_ BitVec 64)) (_2!7931 V!38055)) )
))
(declare-datatypes ((List!22040 0))(
  ( (Nil!22037) (Cons!22036 (h!23244 tuple2!15840) (t!31338 List!22040)) )
))
(declare-datatypes ((ListLongMap!13815 0))(
  ( (ListLongMap!13816 (toList!6923 List!22040)) )
))
(declare-fun contains!6093 (ListLongMap!13815 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3971 (array!65952 array!65954 (_ BitVec 32) (_ BitVec 32) V!38055 V!38055 (_ BitVec 32) Int) ListLongMap!13815)

(assert (=> b!1046223 (= res!696501 (not (contains!6093 (getCurrentListMap!3971 (_keys!11709 (_2!7930 lt!462160)) (_values!6458 (_2!7930 lt!462160)) (mask!30578 (_2!7930 lt!462160)) (extraKeys!6163 (_2!7930 lt!462160)) (zeroValue!6269 (_2!7930 lt!462160)) (minValue!6269 (_2!7930 lt!462160)) #b00000000000000000000000000000000 (defaultEntry!6435 (_2!7930 lt!462160))) key!909)))))

(declare-fun lt!462158 () array!65952)

(declare-fun thiss!1427 () LongMapFixedSize!6074)

(declare-fun lt!462153 () array!65954)

(declare-fun Unit!34203 () Unit!34201)

(declare-fun Unit!34204 () Unit!34201)

(assert (=> b!1046223 (= lt!462160 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3092 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15839 Unit!34203 (LongMapFixedSize!6075 (defaultEntry!6435 thiss!1427) (mask!30578 thiss!1427) (extraKeys!6163 thiss!1427) (zeroValue!6269 thiss!1427) (minValue!6269 thiss!1427) (bvsub (_size!3092 thiss!1427) #b00000000000000000000000000000001) lt!462158 lt!462153 (bvadd #b00000000000000000000000000000001 (_vacant!3092 thiss!1427)))) (tuple2!15839 Unit!34204 (LongMapFixedSize!6075 (defaultEntry!6435 thiss!1427) (mask!30578 thiss!1427) (extraKeys!6163 thiss!1427) (zeroValue!6269 thiss!1427) (minValue!6269 thiss!1427) (bvsub (_size!3092 thiss!1427) #b00000000000000000000000000000001) lt!462158 lt!462153 (_vacant!3092 thiss!1427)))))))

(declare-fun -!550 (ListLongMap!13815 (_ BitVec 64)) ListLongMap!13815)

(assert (=> b!1046223 (= (-!550 (getCurrentListMap!3971 (_keys!11709 thiss!1427) (_values!6458 thiss!1427) (mask!30578 thiss!1427) (extraKeys!6163 thiss!1427) (zeroValue!6269 thiss!1427) (minValue!6269 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6435 thiss!1427)) key!909) (getCurrentListMap!3971 lt!462158 lt!462153 (mask!30578 thiss!1427) (extraKeys!6163 thiss!1427) (zeroValue!6269 thiss!1427) (minValue!6269 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6435 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9859 0))(
  ( (MissingZero!9859 (index!41807 (_ BitVec 32))) (Found!9859 (index!41808 (_ BitVec 32))) (Intermediate!9859 (undefined!10671 Bool) (index!41809 (_ BitVec 32)) (x!93479 (_ BitVec 32))) (Undefined!9859) (MissingVacant!9859 (index!41810 (_ BitVec 32))) )
))
(declare-fun lt!462152 () SeekEntryResult!9859)

(declare-fun dynLambda!2020 (Int (_ BitVec 64)) V!38055)

(assert (=> b!1046223 (= lt!462153 (array!65955 (store (arr!31722 (_values!6458 thiss!1427)) (index!41808 lt!462152) (ValueCellFull!11740 (dynLambda!2020 (defaultEntry!6435 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32257 (_values!6458 thiss!1427))))))

(declare-fun lt!462156 () Unit!34201)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!71 (array!65952 array!65954 (_ BitVec 32) (_ BitVec 32) V!38055 V!38055 (_ BitVec 32) (_ BitVec 64) Int) Unit!34201)

(assert (=> b!1046223 (= lt!462156 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!71 (_keys!11709 thiss!1427) (_values!6458 thiss!1427) (mask!30578 thiss!1427) (extraKeys!6163 thiss!1427) (zeroValue!6269 thiss!1427) (minValue!6269 thiss!1427) (index!41808 lt!462152) key!909 (defaultEntry!6435 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65952 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1046223 (not (arrayContainsKey!0 lt!462158 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!462154 () Unit!34201)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65952 (_ BitVec 32) (_ BitVec 64)) Unit!34201)

(assert (=> b!1046223 (= lt!462154 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11709 thiss!1427) (index!41808 lt!462152) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65952 (_ BitVec 32)) Bool)

(assert (=> b!1046223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!462158 (mask!30578 thiss!1427))))

(declare-fun lt!462161 () Unit!34201)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65952 (_ BitVec 32) (_ BitVec 32)) Unit!34201)

(assert (=> b!1046223 (= lt!462161 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11709 thiss!1427) (index!41808 lt!462152) (mask!30578 thiss!1427)))))

(declare-datatypes ((List!22041 0))(
  ( (Nil!22038) (Cons!22037 (h!23245 (_ BitVec 64)) (t!31339 List!22041)) )
))
(declare-fun arrayNoDuplicates!0 (array!65952 (_ BitVec 32) List!22041) Bool)

(assert (=> b!1046223 (arrayNoDuplicates!0 lt!462158 #b00000000000000000000000000000000 Nil!22038)))

(declare-fun lt!462155 () Unit!34201)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65952 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22041) Unit!34201)

(assert (=> b!1046223 (= lt!462155 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11709 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41808 lt!462152) #b00000000000000000000000000000000 Nil!22038))))

(declare-fun arrayCountValidKeys!0 (array!65952 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1046223 (= (arrayCountValidKeys!0 lt!462158 #b00000000000000000000000000000000 (size!32256 (_keys!11709 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11709 thiss!1427) #b00000000000000000000000000000000 (size!32256 (_keys!11709 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1046223 (= lt!462158 (array!65953 (store (arr!31721 (_keys!11709 thiss!1427)) (index!41808 lt!462152) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32256 (_keys!11709 thiss!1427))))))

(declare-fun lt!462157 () Unit!34201)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65952 (_ BitVec 32) (_ BitVec 64)) Unit!34201)

(assert (=> b!1046223 (= lt!462157 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11709 thiss!1427) (index!41808 lt!462152) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1046224 () Bool)

(declare-fun e!593166 () Bool)

(assert (=> b!1046224 (= e!593166 e!593158)))

(declare-fun res!696500 () Bool)

(assert (=> b!1046224 (=> (not res!696500) (not e!593158))))

(assert (=> b!1046224 (= res!696500 (is-Found!9859 lt!462152))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65952 (_ BitVec 32)) SeekEntryResult!9859)

(assert (=> b!1046224 (= lt!462152 (seekEntry!0 key!909 (_keys!11709 thiss!1427) (mask!30578 thiss!1427)))))

(declare-fun mapNonEmpty!38975 () Bool)

(declare-fun tp!74763 () Bool)

(declare-fun e!593160 () Bool)

(assert (=> mapNonEmpty!38975 (= mapRes!38975 (and tp!74763 e!593160))))

(declare-fun mapValue!38975 () ValueCell!11740)

(declare-fun mapKey!38975 () (_ BitVec 32))

(declare-fun mapRest!38975 () (Array (_ BitVec 32) ValueCell!11740))

(assert (=> mapNonEmpty!38975 (= (arr!31722 (_values!6458 thiss!1427)) (store mapRest!38975 mapKey!38975 mapValue!38975))))

(declare-fun e!593161 () Bool)

(declare-fun e!593165 () Bool)

(declare-fun array_inv!24503 (array!65952) Bool)

(declare-fun array_inv!24504 (array!65954) Bool)

(assert (=> b!1046225 (= e!593165 (and tp!74762 tp_is_empty!24887 (array_inv!24503 (_keys!11709 thiss!1427)) (array_inv!24504 (_values!6458 thiss!1427)) e!593161))))

(declare-fun b!1046226 () Bool)

(assert (=> b!1046226 (= e!593162 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!6163 (_2!7930 lt!462160)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6163 (_2!7930 lt!462160)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1046227 () Bool)

(declare-fun res!696499 () Bool)

(assert (=> b!1046227 (=> (not res!696499) (not e!593166))))

(assert (=> b!1046227 (= res!696499 (not (= key!909 (bvneg key!909))))))

(declare-fun res!696498 () Bool)

(assert (=> start!91994 (=> (not res!696498) (not e!593166))))

(declare-fun valid!2280 (LongMapFixedSize!6074) Bool)

(assert (=> start!91994 (= res!696498 (valid!2280 thiss!1427))))

(assert (=> start!91994 e!593166))

(assert (=> start!91994 e!593165))

(assert (=> start!91994 true))

(declare-fun b!1046220 () Bool)

(assert (=> b!1046220 (= e!593162 (arrayContainsKey!0 (_keys!11709 (_2!7930 lt!462160)) key!909 #b00000000000000000000000000000000))))

(declare-fun b!1046228 () Bool)

(assert (=> b!1046228 (= e!593160 tp_is_empty!24887)))

(declare-fun b!1046229 () Bool)

(assert (=> b!1046229 (= e!593161 (and e!593163 mapRes!38975))))

(declare-fun condMapEmpty!38975 () Bool)

(declare-fun mapDefault!38975 () ValueCell!11740)

