; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91990 () Bool)

(assert start!91990)

(declare-fun b!1046162 () Bool)

(declare-fun b_free!21163 () Bool)

(declare-fun b_next!21163 () Bool)

(assert (=> b!1046162 (= b_free!21163 (not b_next!21163))))

(declare-fun tp!74750 () Bool)

(declare-fun b_and!33821 () Bool)

(assert (=> b!1046162 (= tp!74750 b_and!33821)))

(declare-fun b!1046156 () Bool)

(declare-fun res!696477 () Bool)

(declare-fun e!593107 () Bool)

(assert (=> b!1046156 (=> (not res!696477) (not e!593107))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1046156 (= res!696477 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1046157 () Bool)

(declare-fun e!593111 () Bool)

(declare-datatypes ((V!38051 0))(
  ( (V!38052 (val!12492 Int)) )
))
(declare-datatypes ((ValueCell!11738 0))(
  ( (ValueCellFull!11738 (v!15089 V!38051)) (EmptyCell!11738) )
))
(declare-datatypes ((Unit!34193 0))(
  ( (Unit!34194) )
))
(declare-datatypes ((array!65944 0))(
  ( (array!65945 (arr!31717 (Array (_ BitVec 32) (_ BitVec 64))) (size!32252 (_ BitVec 32))) )
))
(declare-datatypes ((array!65946 0))(
  ( (array!65947 (arr!31718 (Array (_ BitVec 32) ValueCell!11738)) (size!32253 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6070 0))(
  ( (LongMapFixedSize!6071 (defaultEntry!6433 Int) (mask!30576 (_ BitVec 32)) (extraKeys!6161 (_ BitVec 32)) (zeroValue!6267 V!38051) (minValue!6267 V!38051) (_size!3090 (_ BitVec 32)) (_keys!11707 array!65944) (_values!6456 array!65946) (_vacant!3090 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15830 0))(
  ( (tuple2!15831 (_1!7926 Unit!34193) (_2!7926 LongMapFixedSize!6070)) )
))
(declare-fun lt!462092 () tuple2!15830)

(declare-fun arrayContainsKey!0 (array!65944 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1046157 (= e!593111 (arrayContainsKey!0 (_keys!11707 (_2!7926 lt!462092)) key!909 #b00000000000000000000000000000000))))

(declare-fun res!696475 () Bool)

(assert (=> start!91990 (=> (not res!696475) (not e!593107))))

(declare-fun thiss!1427 () LongMapFixedSize!6070)

(declare-fun valid!2278 (LongMapFixedSize!6070) Bool)

(assert (=> start!91990 (= res!696475 (valid!2278 thiss!1427))))

(assert (=> start!91990 e!593107))

(declare-fun e!593112 () Bool)

(assert (=> start!91990 e!593112))

(assert (=> start!91990 true))

(declare-fun b!1046158 () Bool)

(declare-fun e!593104 () Bool)

(assert (=> b!1046158 (= e!593104 false)))

(assert (=> b!1046158 e!593111))

(declare-fun c!106365 () Bool)

(assert (=> b!1046158 (= c!106365 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!462093 () Unit!34193)

(declare-fun lemmaKeyInListMapIsInArray!355 (array!65944 array!65946 (_ BitVec 32) (_ BitVec 32) V!38051 V!38051 (_ BitVec 64) Int) Unit!34193)

(assert (=> b!1046158 (= lt!462093 (lemmaKeyInListMapIsInArray!355 (_keys!11707 (_2!7926 lt!462092)) (_values!6456 (_2!7926 lt!462092)) (mask!30576 (_2!7926 lt!462092)) (extraKeys!6161 (_2!7926 lt!462092)) (zeroValue!6267 (_2!7926 lt!462092)) (minValue!6267 (_2!7926 lt!462092)) key!909 (defaultEntry!6433 (_2!7926 lt!462092))))))

(declare-fun b!1046159 () Bool)

(declare-fun e!593105 () Bool)

(declare-fun tp_is_empty!24883 () Bool)

(assert (=> b!1046159 (= e!593105 tp_is_empty!24883)))

(declare-fun mapIsEmpty!38969 () Bool)

(declare-fun mapRes!38969 () Bool)

(assert (=> mapIsEmpty!38969 mapRes!38969))

(declare-fun b!1046160 () Bool)

(declare-fun e!593110 () Bool)

(assert (=> b!1046160 (= e!593107 e!593110)))

(declare-fun res!696474 () Bool)

(assert (=> b!1046160 (=> (not res!696474) (not e!593110))))

(declare-datatypes ((SeekEntryResult!9857 0))(
  ( (MissingZero!9857 (index!41799 (_ BitVec 32))) (Found!9857 (index!41800 (_ BitVec 32))) (Intermediate!9857 (undefined!10669 Bool) (index!41801 (_ BitVec 32)) (x!93473 (_ BitVec 32))) (Undefined!9857) (MissingVacant!9857 (index!41802 (_ BitVec 32))) )
))
(declare-fun lt!462095 () SeekEntryResult!9857)

(assert (=> b!1046160 (= res!696474 (is-Found!9857 lt!462095))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65944 (_ BitVec 32)) SeekEntryResult!9857)

(assert (=> b!1046160 (= lt!462095 (seekEntry!0 key!909 (_keys!11707 thiss!1427) (mask!30576 thiss!1427)))))

(declare-fun b!1046161 () Bool)

(assert (=> b!1046161 (= e!593111 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!6161 (_2!7926 lt!462092)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6161 (_2!7926 lt!462092)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun e!593109 () Bool)

(declare-fun array_inv!24499 (array!65944) Bool)

(declare-fun array_inv!24500 (array!65946) Bool)

(assert (=> b!1046162 (= e!593112 (and tp!74750 tp_is_empty!24883 (array_inv!24499 (_keys!11707 thiss!1427)) (array_inv!24500 (_values!6456 thiss!1427)) e!593109))))

(declare-fun b!1046163 () Bool)

(assert (=> b!1046163 (= e!593110 (not e!593104))))

(declare-fun res!696476 () Bool)

(assert (=> b!1046163 (=> res!696476 e!593104)))

(declare-datatypes ((tuple2!15832 0))(
  ( (tuple2!15833 (_1!7927 (_ BitVec 64)) (_2!7927 V!38051)) )
))
(declare-datatypes ((List!22036 0))(
  ( (Nil!22033) (Cons!22032 (h!23240 tuple2!15832) (t!31330 List!22036)) )
))
(declare-datatypes ((ListLongMap!13811 0))(
  ( (ListLongMap!13812 (toList!6921 List!22036)) )
))
(declare-fun contains!6091 (ListLongMap!13811 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3969 (array!65944 array!65946 (_ BitVec 32) (_ BitVec 32) V!38051 V!38051 (_ BitVec 32) Int) ListLongMap!13811)

(assert (=> b!1046163 (= res!696476 (not (contains!6091 (getCurrentListMap!3969 (_keys!11707 (_2!7926 lt!462092)) (_values!6456 (_2!7926 lt!462092)) (mask!30576 (_2!7926 lt!462092)) (extraKeys!6161 (_2!7926 lt!462092)) (zeroValue!6267 (_2!7926 lt!462092)) (minValue!6267 (_2!7926 lt!462092)) #b00000000000000000000000000000000 (defaultEntry!6433 (_2!7926 lt!462092))) key!909)))))

(declare-fun lt!462097 () array!65944)

(declare-fun lt!462096 () array!65946)

(declare-fun Unit!34195 () Unit!34193)

(declare-fun Unit!34196 () Unit!34193)

(assert (=> b!1046163 (= lt!462092 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3090 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15831 Unit!34195 (LongMapFixedSize!6071 (defaultEntry!6433 thiss!1427) (mask!30576 thiss!1427) (extraKeys!6161 thiss!1427) (zeroValue!6267 thiss!1427) (minValue!6267 thiss!1427) (bvsub (_size!3090 thiss!1427) #b00000000000000000000000000000001) lt!462097 lt!462096 (bvadd #b00000000000000000000000000000001 (_vacant!3090 thiss!1427)))) (tuple2!15831 Unit!34196 (LongMapFixedSize!6071 (defaultEntry!6433 thiss!1427) (mask!30576 thiss!1427) (extraKeys!6161 thiss!1427) (zeroValue!6267 thiss!1427) (minValue!6267 thiss!1427) (bvsub (_size!3090 thiss!1427) #b00000000000000000000000000000001) lt!462097 lt!462096 (_vacant!3090 thiss!1427)))))))

(declare-fun -!548 (ListLongMap!13811 (_ BitVec 64)) ListLongMap!13811)

(assert (=> b!1046163 (= (-!548 (getCurrentListMap!3969 (_keys!11707 thiss!1427) (_values!6456 thiss!1427) (mask!30576 thiss!1427) (extraKeys!6161 thiss!1427) (zeroValue!6267 thiss!1427) (minValue!6267 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6433 thiss!1427)) key!909) (getCurrentListMap!3969 lt!462097 lt!462096 (mask!30576 thiss!1427) (extraKeys!6161 thiss!1427) (zeroValue!6267 thiss!1427) (minValue!6267 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6433 thiss!1427)))))

(declare-fun dynLambda!2018 (Int (_ BitVec 64)) V!38051)

(assert (=> b!1046163 (= lt!462096 (array!65947 (store (arr!31718 (_values!6456 thiss!1427)) (index!41800 lt!462095) (ValueCellFull!11738 (dynLambda!2018 (defaultEntry!6433 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32253 (_values!6456 thiss!1427))))))

(declare-fun lt!462101 () Unit!34193)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!69 (array!65944 array!65946 (_ BitVec 32) (_ BitVec 32) V!38051 V!38051 (_ BitVec 32) (_ BitVec 64) Int) Unit!34193)

(assert (=> b!1046163 (= lt!462101 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!69 (_keys!11707 thiss!1427) (_values!6456 thiss!1427) (mask!30576 thiss!1427) (extraKeys!6161 thiss!1427) (zeroValue!6267 thiss!1427) (minValue!6267 thiss!1427) (index!41800 lt!462095) key!909 (defaultEntry!6433 thiss!1427)))))

(assert (=> b!1046163 (not (arrayContainsKey!0 lt!462097 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!462100 () Unit!34193)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65944 (_ BitVec 32) (_ BitVec 64)) Unit!34193)

(assert (=> b!1046163 (= lt!462100 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11707 thiss!1427) (index!41800 lt!462095) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65944 (_ BitVec 32)) Bool)

(assert (=> b!1046163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!462097 (mask!30576 thiss!1427))))

(declare-fun lt!462094 () Unit!34193)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65944 (_ BitVec 32) (_ BitVec 32)) Unit!34193)

(assert (=> b!1046163 (= lt!462094 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11707 thiss!1427) (index!41800 lt!462095) (mask!30576 thiss!1427)))))

(declare-datatypes ((List!22037 0))(
  ( (Nil!22034) (Cons!22033 (h!23241 (_ BitVec 64)) (t!31331 List!22037)) )
))
(declare-fun arrayNoDuplicates!0 (array!65944 (_ BitVec 32) List!22037) Bool)

(assert (=> b!1046163 (arrayNoDuplicates!0 lt!462097 #b00000000000000000000000000000000 Nil!22034)))

(declare-fun lt!462098 () Unit!34193)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65944 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22037) Unit!34193)

(assert (=> b!1046163 (= lt!462098 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11707 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41800 lt!462095) #b00000000000000000000000000000000 Nil!22034))))

(declare-fun arrayCountValidKeys!0 (array!65944 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1046163 (= (arrayCountValidKeys!0 lt!462097 #b00000000000000000000000000000000 (size!32252 (_keys!11707 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11707 thiss!1427) #b00000000000000000000000000000000 (size!32252 (_keys!11707 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1046163 (= lt!462097 (array!65945 (store (arr!31717 (_keys!11707 thiss!1427)) (index!41800 lt!462095) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32252 (_keys!11707 thiss!1427))))))

(declare-fun lt!462099 () Unit!34193)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65944 (_ BitVec 32) (_ BitVec 64)) Unit!34193)

(assert (=> b!1046163 (= lt!462099 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11707 thiss!1427) (index!41800 lt!462095) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!38969 () Bool)

(declare-fun tp!74751 () Bool)

(declare-fun e!593106 () Bool)

(assert (=> mapNonEmpty!38969 (= mapRes!38969 (and tp!74751 e!593106))))

(declare-fun mapValue!38969 () ValueCell!11738)

(declare-fun mapRest!38969 () (Array (_ BitVec 32) ValueCell!11738))

(declare-fun mapKey!38969 () (_ BitVec 32))

(assert (=> mapNonEmpty!38969 (= (arr!31718 (_values!6456 thiss!1427)) (store mapRest!38969 mapKey!38969 mapValue!38969))))

(declare-fun b!1046164 () Bool)

(assert (=> b!1046164 (= e!593106 tp_is_empty!24883)))

(declare-fun b!1046165 () Bool)

(assert (=> b!1046165 (= e!593109 (and e!593105 mapRes!38969))))

(declare-fun condMapEmpty!38969 () Bool)

(declare-fun mapDefault!38969 () ValueCell!11738)

