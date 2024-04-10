; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91982 () Bool)

(assert start!91982)

(declare-fun b!1046020 () Bool)

(declare-fun b_free!21155 () Bool)

(declare-fun b_next!21155 () Bool)

(assert (=> b!1046020 (= b_free!21155 (not b_next!21155))))

(declare-fun tp!74727 () Bool)

(declare-fun b_and!33805 () Bool)

(assert (=> b!1046020 (= tp!74727 b_and!33805)))

(declare-fun b!1046018 () Bool)

(declare-fun res!696400 () Bool)

(declare-fun e!593010 () Bool)

(assert (=> b!1046018 (=> res!696400 e!593010)))

(declare-datatypes ((V!38039 0))(
  ( (V!38040 (val!12488 Int)) )
))
(declare-datatypes ((ValueCell!11734 0))(
  ( (ValueCellFull!11734 (v!15085 V!38039)) (EmptyCell!11734) )
))
(declare-datatypes ((Unit!34177 0))(
  ( (Unit!34178) )
))
(declare-datatypes ((array!65928 0))(
  ( (array!65929 (arr!31709 (Array (_ BitVec 32) (_ BitVec 64))) (size!32244 (_ BitVec 32))) )
))
(declare-datatypes ((array!65930 0))(
  ( (array!65931 (arr!31710 (Array (_ BitVec 32) ValueCell!11734)) (size!32245 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6062 0))(
  ( (LongMapFixedSize!6063 (defaultEntry!6429 Int) (mask!30568 (_ BitVec 32)) (extraKeys!6157 (_ BitVec 32)) (zeroValue!6263 V!38039) (minValue!6263 V!38039) (_size!3086 (_ BitVec 32)) (_keys!11703 array!65928) (_values!6452 array!65930) (_vacant!3086 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15814 0))(
  ( (tuple2!15815 (_1!7918 Unit!34177) (_2!7918 LongMapFixedSize!6062)) )
))
(declare-fun lt!461980 () tuple2!15814)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1046018 (= res!696400 (not (validMask!0 (mask!30568 (_2!7918 lt!461980)))))))

(declare-fun b!1046019 () Bool)

(declare-fun res!696397 () Bool)

(assert (=> b!1046019 (=> res!696397 e!593010)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65928 (_ BitVec 32)) Bool)

(assert (=> b!1046019 (= res!696397 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11703 (_2!7918 lt!461980)) (mask!30568 (_2!7918 lt!461980)))))))

(declare-fun e!593006 () Bool)

(declare-fun tp_is_empty!24875 () Bool)

(declare-fun thiss!1427 () LongMapFixedSize!6062)

(declare-fun e!593011 () Bool)

(declare-fun array_inv!24491 (array!65928) Bool)

(declare-fun array_inv!24492 (array!65930) Bool)

(assert (=> b!1046020 (= e!593011 (and tp!74727 tp_is_empty!24875 (array_inv!24491 (_keys!11703 thiss!1427)) (array_inv!24492 (_values!6452 thiss!1427)) e!593006))))

(declare-fun mapIsEmpty!38957 () Bool)

(declare-fun mapRes!38957 () Bool)

(assert (=> mapIsEmpty!38957 mapRes!38957))

(declare-fun b!1046021 () Bool)

(declare-datatypes ((List!22028 0))(
  ( (Nil!22025) (Cons!22024 (h!23232 (_ BitVec 64)) (t!31314 List!22028)) )
))
(declare-fun arrayNoDuplicates!0 (array!65928 (_ BitVec 32) List!22028) Bool)

(assert (=> b!1046021 (= e!593010 (arrayNoDuplicates!0 (_keys!11703 (_2!7918 lt!461980)) #b00000000000000000000000000000000 Nil!22025))))

(declare-fun b!1046022 () Bool)

(declare-fun e!593013 () Bool)

(assert (=> b!1046022 (= e!593013 tp_is_empty!24875)))

(declare-fun b!1046023 () Bool)

(declare-fun e!593012 () Bool)

(assert (=> b!1046023 (= e!593012 tp_is_empty!24875)))

(declare-fun b!1046024 () Bool)

(declare-fun e!593007 () Bool)

(assert (=> b!1046024 (= e!593007 (not e!593010))))

(declare-fun res!696401 () Bool)

(assert (=> b!1046024 (=> res!696401 e!593010)))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15816 0))(
  ( (tuple2!15817 (_1!7919 (_ BitVec 64)) (_2!7919 V!38039)) )
))
(declare-datatypes ((List!22029 0))(
  ( (Nil!22026) (Cons!22025 (h!23233 tuple2!15816) (t!31315 List!22029)) )
))
(declare-datatypes ((ListLongMap!13803 0))(
  ( (ListLongMap!13804 (toList!6917 List!22029)) )
))
(declare-fun contains!6087 (ListLongMap!13803 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3965 (array!65928 array!65930 (_ BitVec 32) (_ BitVec 32) V!38039 V!38039 (_ BitVec 32) Int) ListLongMap!13803)

(assert (=> b!1046024 (= res!696401 (not (contains!6087 (getCurrentListMap!3965 (_keys!11703 (_2!7918 lt!461980)) (_values!6452 (_2!7918 lt!461980)) (mask!30568 (_2!7918 lt!461980)) (extraKeys!6157 (_2!7918 lt!461980)) (zeroValue!6263 (_2!7918 lt!461980)) (minValue!6263 (_2!7918 lt!461980)) #b00000000000000000000000000000000 (defaultEntry!6429 (_2!7918 lt!461980))) key!909)))))

(declare-fun lt!461974 () array!65930)

(declare-fun lt!461981 () array!65928)

(declare-fun Unit!34179 () Unit!34177)

(declare-fun Unit!34180 () Unit!34177)

(assert (=> b!1046024 (= lt!461980 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3086 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15815 Unit!34179 (LongMapFixedSize!6063 (defaultEntry!6429 thiss!1427) (mask!30568 thiss!1427) (extraKeys!6157 thiss!1427) (zeroValue!6263 thiss!1427) (minValue!6263 thiss!1427) (bvsub (_size!3086 thiss!1427) #b00000000000000000000000000000001) lt!461981 lt!461974 (bvadd #b00000000000000000000000000000001 (_vacant!3086 thiss!1427)))) (tuple2!15815 Unit!34180 (LongMapFixedSize!6063 (defaultEntry!6429 thiss!1427) (mask!30568 thiss!1427) (extraKeys!6157 thiss!1427) (zeroValue!6263 thiss!1427) (minValue!6263 thiss!1427) (bvsub (_size!3086 thiss!1427) #b00000000000000000000000000000001) lt!461981 lt!461974 (_vacant!3086 thiss!1427)))))))

(declare-fun -!544 (ListLongMap!13803 (_ BitVec 64)) ListLongMap!13803)

(assert (=> b!1046024 (= (-!544 (getCurrentListMap!3965 (_keys!11703 thiss!1427) (_values!6452 thiss!1427) (mask!30568 thiss!1427) (extraKeys!6157 thiss!1427) (zeroValue!6263 thiss!1427) (minValue!6263 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6429 thiss!1427)) key!909) (getCurrentListMap!3965 lt!461981 lt!461974 (mask!30568 thiss!1427) (extraKeys!6157 thiss!1427) (zeroValue!6263 thiss!1427) (minValue!6263 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6429 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9853 0))(
  ( (MissingZero!9853 (index!41783 (_ BitVec 32))) (Found!9853 (index!41784 (_ BitVec 32))) (Intermediate!9853 (undefined!10665 Bool) (index!41785 (_ BitVec 32)) (x!93445 (_ BitVec 32))) (Undefined!9853) (MissingVacant!9853 (index!41786 (_ BitVec 32))) )
))
(declare-fun lt!461976 () SeekEntryResult!9853)

(declare-fun dynLambda!2014 (Int (_ BitVec 64)) V!38039)

(assert (=> b!1046024 (= lt!461974 (array!65931 (store (arr!31710 (_values!6452 thiss!1427)) (index!41784 lt!461976) (ValueCellFull!11734 (dynLambda!2014 (defaultEntry!6429 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32245 (_values!6452 thiss!1427))))))

(declare-fun lt!461978 () Unit!34177)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!65 (array!65928 array!65930 (_ BitVec 32) (_ BitVec 32) V!38039 V!38039 (_ BitVec 32) (_ BitVec 64) Int) Unit!34177)

(assert (=> b!1046024 (= lt!461978 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!65 (_keys!11703 thiss!1427) (_values!6452 thiss!1427) (mask!30568 thiss!1427) (extraKeys!6157 thiss!1427) (zeroValue!6263 thiss!1427) (minValue!6263 thiss!1427) (index!41784 lt!461976) key!909 (defaultEntry!6429 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1046024 (not (arrayContainsKey!0 lt!461981 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!461979 () Unit!34177)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65928 (_ BitVec 32) (_ BitVec 64)) Unit!34177)

(assert (=> b!1046024 (= lt!461979 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11703 thiss!1427) (index!41784 lt!461976) key!909))))

(assert (=> b!1046024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461981 (mask!30568 thiss!1427))))

(declare-fun lt!461975 () Unit!34177)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65928 (_ BitVec 32) (_ BitVec 32)) Unit!34177)

(assert (=> b!1046024 (= lt!461975 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11703 thiss!1427) (index!41784 lt!461976) (mask!30568 thiss!1427)))))

(assert (=> b!1046024 (arrayNoDuplicates!0 lt!461981 #b00000000000000000000000000000000 Nil!22025)))

(declare-fun lt!461973 () Unit!34177)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65928 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22028) Unit!34177)

(assert (=> b!1046024 (= lt!461973 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11703 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41784 lt!461976) #b00000000000000000000000000000000 Nil!22025))))

(declare-fun arrayCountValidKeys!0 (array!65928 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1046024 (= (arrayCountValidKeys!0 lt!461981 #b00000000000000000000000000000000 (size!32244 (_keys!11703 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11703 thiss!1427) #b00000000000000000000000000000000 (size!32244 (_keys!11703 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1046024 (= lt!461981 (array!65929 (store (arr!31709 (_keys!11703 thiss!1427)) (index!41784 lt!461976) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32244 (_keys!11703 thiss!1427))))))

(declare-fun lt!461977 () Unit!34177)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65928 (_ BitVec 32) (_ BitVec 64)) Unit!34177)

(assert (=> b!1046024 (= lt!461977 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11703 thiss!1427) (index!41784 lt!461976) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1046025 () Bool)

(declare-fun e!593009 () Bool)

(assert (=> b!1046025 (= e!593009 e!593007)))

(declare-fun res!696396 () Bool)

(assert (=> b!1046025 (=> (not res!696396) (not e!593007))))

(assert (=> b!1046025 (= res!696396 (is-Found!9853 lt!461976))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65928 (_ BitVec 32)) SeekEntryResult!9853)

(assert (=> b!1046025 (= lt!461976 (seekEntry!0 key!909 (_keys!11703 thiss!1427) (mask!30568 thiss!1427)))))

(declare-fun res!696402 () Bool)

(assert (=> start!91982 (=> (not res!696402) (not e!593009))))

(declare-fun valid!2274 (LongMapFixedSize!6062) Bool)

(assert (=> start!91982 (= res!696402 (valid!2274 thiss!1427))))

(assert (=> start!91982 e!593009))

(assert (=> start!91982 e!593011))

(assert (=> start!91982 true))

(declare-fun b!1046026 () Bool)

(declare-fun res!696399 () Bool)

(assert (=> b!1046026 (=> res!696399 e!593010)))

(assert (=> b!1046026 (= res!696399 (or (not (= (size!32245 (_values!6452 (_2!7918 lt!461980))) (bvadd #b00000000000000000000000000000001 (mask!30568 (_2!7918 lt!461980))))) (not (= (size!32244 (_keys!11703 (_2!7918 lt!461980))) (size!32245 (_values!6452 (_2!7918 lt!461980))))) (bvslt (mask!30568 (_2!7918 lt!461980)) #b00000000000000000000000000000000) (bvslt (extraKeys!6157 (_2!7918 lt!461980)) #b00000000000000000000000000000000) (bvsgt (extraKeys!6157 (_2!7918 lt!461980)) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!38957 () Bool)

(declare-fun tp!74726 () Bool)

(assert (=> mapNonEmpty!38957 (= mapRes!38957 (and tp!74726 e!593013))))

(declare-fun mapKey!38957 () (_ BitVec 32))

(declare-fun mapValue!38957 () ValueCell!11734)

(declare-fun mapRest!38957 () (Array (_ BitVec 32) ValueCell!11734))

(assert (=> mapNonEmpty!38957 (= (arr!31710 (_values!6452 thiss!1427)) (store mapRest!38957 mapKey!38957 mapValue!38957))))

(declare-fun b!1046027 () Bool)

(assert (=> b!1046027 (= e!593006 (and e!593012 mapRes!38957))))

(declare-fun condMapEmpty!38957 () Bool)

(declare-fun mapDefault!38957 () ValueCell!11734)

