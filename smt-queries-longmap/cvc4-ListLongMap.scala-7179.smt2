; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91856 () Bool)

(assert start!91856)

(declare-fun b!1044987 () Bool)

(declare-fun b_free!21131 () Bool)

(declare-fun b_next!21131 () Bool)

(assert (=> b!1044987 (= b_free!21131 (not b_next!21131))))

(declare-fun tp!74646 () Bool)

(declare-fun b_and!33733 () Bool)

(assert (=> b!1044987 (= tp!74646 b_and!33733)))

(declare-fun b!1044979 () Bool)

(declare-fun e!592295 () Bool)

(declare-fun tp_is_empty!24851 () Bool)

(assert (=> b!1044979 (= e!592295 tp_is_empty!24851)))

(declare-fun mapNonEmpty!38912 () Bool)

(declare-fun mapRes!38912 () Bool)

(declare-fun tp!74645 () Bool)

(assert (=> mapNonEmpty!38912 (= mapRes!38912 (and tp!74645 e!592295))))

(declare-datatypes ((V!38007 0))(
  ( (V!38008 (val!12476 Int)) )
))
(declare-datatypes ((ValueCell!11722 0))(
  ( (ValueCellFull!11722 (v!15070 V!38007)) (EmptyCell!11722) )
))
(declare-fun mapRest!38912 () (Array (_ BitVec 32) ValueCell!11722))

(declare-fun mapValue!38912 () ValueCell!11722)

(declare-fun mapKey!38912 () (_ BitVec 32))

(declare-datatypes ((array!65874 0))(
  ( (array!65875 (arr!31685 (Array (_ BitVec 32) (_ BitVec 64))) (size!32220 (_ BitVec 32))) )
))
(declare-datatypes ((array!65876 0))(
  ( (array!65877 (arr!31686 (Array (_ BitVec 32) ValueCell!11722)) (size!32221 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6038 0))(
  ( (LongMapFixedSize!6039 (defaultEntry!6411 Int) (mask!30530 (_ BitVec 32)) (extraKeys!6139 (_ BitVec 32)) (zeroValue!6245 V!38007) (minValue!6245 V!38007) (_size!3074 (_ BitVec 32)) (_keys!11679 array!65874) (_values!6434 array!65876) (_vacant!3074 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6038)

(assert (=> mapNonEmpty!38912 (= (arr!31686 (_values!6434 thiss!1427)) (store mapRest!38912 mapKey!38912 mapValue!38912))))

(declare-fun b!1044980 () Bool)

(declare-fun res!695885 () Bool)

(declare-fun e!592294 () Bool)

(assert (=> b!1044980 (=> res!695885 e!592294)))

(declare-datatypes ((Unit!34129 0))(
  ( (Unit!34130) )
))
(declare-datatypes ((tuple2!15778 0))(
  ( (tuple2!15779 (_1!7900 Unit!34129) (_2!7900 LongMapFixedSize!6038)) )
))
(declare-fun lt!461156 () tuple2!15778)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1044980 (= res!695885 (not (validMask!0 (mask!30530 (_2!7900 lt!461156)))))))

(declare-fun b!1044981 () Bool)

(assert (=> b!1044981 (= e!592294 (or (not (= (size!32221 (_values!6434 (_2!7900 lt!461156))) (bvadd #b00000000000000000000000000000001 (mask!30530 (_2!7900 lt!461156))))) (not (= (size!32220 (_keys!11679 (_2!7900 lt!461156))) (size!32221 (_values!6434 (_2!7900 lt!461156))))) (bvsge (mask!30530 (_2!7900 lt!461156)) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!38912 () Bool)

(assert (=> mapIsEmpty!38912 mapRes!38912))

(declare-fun res!695888 () Bool)

(declare-fun e!592298 () Bool)

(assert (=> start!91856 (=> (not res!695888) (not e!592298))))

(declare-fun valid!2266 (LongMapFixedSize!6038) Bool)

(assert (=> start!91856 (= res!695888 (valid!2266 thiss!1427))))

(assert (=> start!91856 e!592298))

(declare-fun e!592297 () Bool)

(assert (=> start!91856 e!592297))

(assert (=> start!91856 true))

(declare-fun b!1044982 () Bool)

(declare-fun e!592299 () Bool)

(assert (=> b!1044982 (= e!592299 tp_is_empty!24851)))

(declare-fun b!1044983 () Bool)

(declare-fun e!592292 () Bool)

(assert (=> b!1044983 (= e!592292 (not e!592294))))

(declare-fun res!695886 () Bool)

(assert (=> b!1044983 (=> res!695886 e!592294)))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15780 0))(
  ( (tuple2!15781 (_1!7901 (_ BitVec 64)) (_2!7901 V!38007)) )
))
(declare-datatypes ((List!22014 0))(
  ( (Nil!22011) (Cons!22010 (h!23218 tuple2!15780) (t!31270 List!22014)) )
))
(declare-datatypes ((ListLongMap!13789 0))(
  ( (ListLongMap!13790 (toList!6910 List!22014)) )
))
(declare-fun contains!6077 (ListLongMap!13789 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3958 (array!65874 array!65876 (_ BitVec 32) (_ BitVec 32) V!38007 V!38007 (_ BitVec 32) Int) ListLongMap!13789)

(assert (=> b!1044983 (= res!695886 (not (contains!6077 (getCurrentListMap!3958 (_keys!11679 (_2!7900 lt!461156)) (_values!6434 (_2!7900 lt!461156)) (mask!30530 (_2!7900 lt!461156)) (extraKeys!6139 (_2!7900 lt!461156)) (zeroValue!6245 (_2!7900 lt!461156)) (minValue!6245 (_2!7900 lt!461156)) #b00000000000000000000000000000000 (defaultEntry!6411 (_2!7900 lt!461156))) key!909)))))

(declare-fun lt!461158 () array!65876)

(declare-fun lt!461161 () array!65874)

(declare-fun Unit!34131 () Unit!34129)

(declare-fun Unit!34132 () Unit!34129)

(assert (=> b!1044983 (= lt!461156 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3074 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15779 Unit!34131 (LongMapFixedSize!6039 (defaultEntry!6411 thiss!1427) (mask!30530 thiss!1427) (extraKeys!6139 thiss!1427) (zeroValue!6245 thiss!1427) (minValue!6245 thiss!1427) (bvsub (_size!3074 thiss!1427) #b00000000000000000000000000000001) lt!461161 lt!461158 (bvadd #b00000000000000000000000000000001 (_vacant!3074 thiss!1427)))) (tuple2!15779 Unit!34132 (LongMapFixedSize!6039 (defaultEntry!6411 thiss!1427) (mask!30530 thiss!1427) (extraKeys!6139 thiss!1427) (zeroValue!6245 thiss!1427) (minValue!6245 thiss!1427) (bvsub (_size!3074 thiss!1427) #b00000000000000000000000000000001) lt!461161 lt!461158 (_vacant!3074 thiss!1427)))))))

(declare-fun -!537 (ListLongMap!13789 (_ BitVec 64)) ListLongMap!13789)

(assert (=> b!1044983 (= (-!537 (getCurrentListMap!3958 (_keys!11679 thiss!1427) (_values!6434 thiss!1427) (mask!30530 thiss!1427) (extraKeys!6139 thiss!1427) (zeroValue!6245 thiss!1427) (minValue!6245 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6411 thiss!1427)) key!909) (getCurrentListMap!3958 lt!461161 lt!461158 (mask!30530 thiss!1427) (extraKeys!6139 thiss!1427) (zeroValue!6245 thiss!1427) (minValue!6245 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6411 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9845 0))(
  ( (MissingZero!9845 (index!41751 (_ BitVec 32))) (Found!9845 (index!41752 (_ BitVec 32))) (Intermediate!9845 (undefined!10657 Bool) (index!41753 (_ BitVec 32)) (x!93327 (_ BitVec 32))) (Undefined!9845) (MissingVacant!9845 (index!41754 (_ BitVec 32))) )
))
(declare-fun lt!461159 () SeekEntryResult!9845)

(declare-fun dynLambda!2007 (Int (_ BitVec 64)) V!38007)

(assert (=> b!1044983 (= lt!461158 (array!65877 (store (arr!31686 (_values!6434 thiss!1427)) (index!41752 lt!461159) (ValueCellFull!11722 (dynLambda!2007 (defaultEntry!6411 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32221 (_values!6434 thiss!1427))))))

(declare-fun lt!461160 () Unit!34129)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!58 (array!65874 array!65876 (_ BitVec 32) (_ BitVec 32) V!38007 V!38007 (_ BitVec 32) (_ BitVec 64) Int) Unit!34129)

(assert (=> b!1044983 (= lt!461160 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!58 (_keys!11679 thiss!1427) (_values!6434 thiss!1427) (mask!30530 thiss!1427) (extraKeys!6139 thiss!1427) (zeroValue!6245 thiss!1427) (minValue!6245 thiss!1427) (index!41752 lt!461159) key!909 (defaultEntry!6411 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1044983 (not (arrayContainsKey!0 lt!461161 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!461162 () Unit!34129)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65874 (_ BitVec 32) (_ BitVec 64)) Unit!34129)

(assert (=> b!1044983 (= lt!461162 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11679 thiss!1427) (index!41752 lt!461159) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65874 (_ BitVec 32)) Bool)

(assert (=> b!1044983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461161 (mask!30530 thiss!1427))))

(declare-fun lt!461154 () Unit!34129)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65874 (_ BitVec 32) (_ BitVec 32)) Unit!34129)

(assert (=> b!1044983 (= lt!461154 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11679 thiss!1427) (index!41752 lt!461159) (mask!30530 thiss!1427)))))

(declare-datatypes ((List!22015 0))(
  ( (Nil!22012) (Cons!22011 (h!23219 (_ BitVec 64)) (t!31271 List!22015)) )
))
(declare-fun arrayNoDuplicates!0 (array!65874 (_ BitVec 32) List!22015) Bool)

(assert (=> b!1044983 (arrayNoDuplicates!0 lt!461161 #b00000000000000000000000000000000 Nil!22012)))

(declare-fun lt!461157 () Unit!34129)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65874 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22015) Unit!34129)

(assert (=> b!1044983 (= lt!461157 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11679 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41752 lt!461159) #b00000000000000000000000000000000 Nil!22012))))

(declare-fun arrayCountValidKeys!0 (array!65874 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1044983 (= (arrayCountValidKeys!0 lt!461161 #b00000000000000000000000000000000 (size!32220 (_keys!11679 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11679 thiss!1427) #b00000000000000000000000000000000 (size!32220 (_keys!11679 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1044983 (= lt!461161 (array!65875 (store (arr!31685 (_keys!11679 thiss!1427)) (index!41752 lt!461159) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32220 (_keys!11679 thiss!1427))))))

(declare-fun lt!461155 () Unit!34129)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65874 (_ BitVec 32) (_ BitVec 64)) Unit!34129)

(assert (=> b!1044983 (= lt!461155 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11679 thiss!1427) (index!41752 lt!461159) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044984 () Bool)

(declare-fun e!592293 () Bool)

(assert (=> b!1044984 (= e!592293 (and e!592299 mapRes!38912))))

(declare-fun condMapEmpty!38912 () Bool)

(declare-fun mapDefault!38912 () ValueCell!11722)

