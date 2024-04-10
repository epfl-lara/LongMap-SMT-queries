; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91996 () Bool)

(assert start!91996)

(declare-fun b!1046259 () Bool)

(declare-fun b_free!21169 () Bool)

(declare-fun b_next!21169 () Bool)

(assert (=> b!1046259 (= b_free!21169 (not b_next!21169))))

(declare-fun tp!74768 () Bool)

(declare-fun b_and!33833 () Bool)

(assert (=> b!1046259 (= tp!74768 b_and!33833)))

(declare-fun b!1046258 () Bool)

(declare-datatypes ((Unit!34205 0))(
  ( (Unit!34206) )
))
(declare-fun e!593195 () Unit!34205)

(declare-fun Unit!34207 () Unit!34205)

(assert (=> b!1046258 (= e!593195 Unit!34207)))

(declare-fun lt!462189 () Unit!34205)

(declare-datatypes ((V!38059 0))(
  ( (V!38060 (val!12495 Int)) )
))
(declare-datatypes ((ValueCell!11741 0))(
  ( (ValueCellFull!11741 (v!15092 V!38059)) (EmptyCell!11741) )
))
(declare-datatypes ((array!65956 0))(
  ( (array!65957 (arr!31723 (Array (_ BitVec 32) (_ BitVec 64))) (size!32258 (_ BitVec 32))) )
))
(declare-datatypes ((array!65958 0))(
  ( (array!65959 (arr!31724 (Array (_ BitVec 32) ValueCell!11741)) (size!32259 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6076 0))(
  ( (LongMapFixedSize!6077 (defaultEntry!6436 Int) (mask!30581 (_ BitVec 32)) (extraKeys!6164 (_ BitVec 32)) (zeroValue!6270 V!38059) (minValue!6270 V!38059) (_size!3093 (_ BitVec 32)) (_keys!11710 array!65956) (_values!6459 array!65958) (_vacant!3093 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15842 0))(
  ( (tuple2!15843 (_1!7932 Unit!34205) (_2!7932 LongMapFixedSize!6076)) )
))
(declare-fun lt!462192 () tuple2!15842)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun lemmaKeyInListMapIsInArray!358 (array!65956 array!65958 (_ BitVec 32) (_ BitVec 32) V!38059 V!38059 (_ BitVec 64) Int) Unit!34205)

(assert (=> b!1046258 (= lt!462189 (lemmaKeyInListMapIsInArray!358 (_keys!11710 (_2!7932 lt!462192)) (_values!6459 (_2!7932 lt!462192)) (mask!30581 (_2!7932 lt!462192)) (extraKeys!6164 (_2!7932 lt!462192)) (zeroValue!6270 (_2!7932 lt!462192)) (minValue!6270 (_2!7932 lt!462192)) key!909 (defaultEntry!6436 (_2!7932 lt!462192))))))

(declare-fun c!106376 () Bool)

(assert (=> b!1046258 (= c!106376 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!696515 () Bool)

(declare-fun e!593193 () Bool)

(assert (=> b!1046258 (= res!696515 e!593193)))

(declare-fun e!593189 () Bool)

(assert (=> b!1046258 (=> (not res!696515) (not e!593189))))

(assert (=> b!1046258 e!593189))

(declare-fun e!593194 () Bool)

(declare-fun thiss!1427 () LongMapFixedSize!6076)

(declare-fun tp_is_empty!24889 () Bool)

(declare-fun e!593191 () Bool)

(declare-fun array_inv!24505 (array!65956) Bool)

(declare-fun array_inv!24506 (array!65958) Bool)

(assert (=> b!1046259 (= e!593194 (and tp!74768 tp_is_empty!24889 (array_inv!24505 (_keys!11710 thiss!1427)) (array_inv!24506 (_values!6459 thiss!1427)) e!593191))))

(declare-fun b!1046260 () Bool)

(declare-fun e!593196 () Bool)

(assert (=> b!1046260 (= e!593196 tp_is_empty!24889)))

(declare-fun mapIsEmpty!38978 () Bool)

(declare-fun mapRes!38978 () Bool)

(assert (=> mapIsEmpty!38978 mapRes!38978))

(declare-fun e!593192 () Bool)

(declare-fun b!1046261 () Bool)

(declare-datatypes ((tuple2!15844 0))(
  ( (tuple2!15845 (_1!7933 (_ BitVec 64)) (_2!7933 V!38059)) )
))
(declare-datatypes ((List!22042 0))(
  ( (Nil!22039) (Cons!22038 (h!23246 tuple2!15844) (t!31342 List!22042)) )
))
(declare-datatypes ((ListLongMap!13817 0))(
  ( (ListLongMap!13818 (toList!6924 List!22042)) )
))
(declare-fun map!14828 (LongMapFixedSize!6076) ListLongMap!13817)

(declare-fun -!551 (ListLongMap!13817 (_ BitVec 64)) ListLongMap!13817)

(assert (=> b!1046261 (= e!593192 (= (map!14828 (_2!7932 lt!462192)) (-!551 (map!14828 thiss!1427) key!909)))))

(declare-fun b!1046262 () Bool)

(declare-fun e!593199 () Bool)

(assert (=> b!1046262 (= e!593199 tp_is_empty!24889)))

(declare-fun b!1046263 () Bool)

(declare-fun res!696516 () Bool)

(declare-fun e!593190 () Bool)

(assert (=> b!1046263 (=> (not res!696516) (not e!593190))))

(assert (=> b!1046263 (= res!696516 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1046264 () Bool)

(declare-fun e!593197 () Bool)

(assert (=> b!1046264 (= e!593197 (not e!593192))))

(declare-fun res!696513 () Bool)

(assert (=> b!1046264 (=> (not res!696513) (not e!593192))))

(declare-fun valid!2281 (LongMapFixedSize!6076) Bool)

(assert (=> b!1046264 (= res!696513 (valid!2281 (_2!7932 lt!462192)))))

(declare-fun lt!462194 () Unit!34205)

(assert (=> b!1046264 (= lt!462194 e!593195)))

(declare-fun c!106377 () Bool)

(declare-fun contains!6094 (ListLongMap!13817 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3972 (array!65956 array!65958 (_ BitVec 32) (_ BitVec 32) V!38059 V!38059 (_ BitVec 32) Int) ListLongMap!13817)

(assert (=> b!1046264 (= c!106377 (contains!6094 (getCurrentListMap!3972 (_keys!11710 (_2!7932 lt!462192)) (_values!6459 (_2!7932 lt!462192)) (mask!30581 (_2!7932 lt!462192)) (extraKeys!6164 (_2!7932 lt!462192)) (zeroValue!6270 (_2!7932 lt!462192)) (minValue!6270 (_2!7932 lt!462192)) #b00000000000000000000000000000000 (defaultEntry!6436 (_2!7932 lt!462192))) key!909))))

(declare-fun lt!462191 () array!65958)

(declare-fun lt!462190 () array!65956)

(declare-fun Unit!34208 () Unit!34205)

(declare-fun Unit!34209 () Unit!34205)

(assert (=> b!1046264 (= lt!462192 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3093 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15843 Unit!34208 (LongMapFixedSize!6077 (defaultEntry!6436 thiss!1427) (mask!30581 thiss!1427) (extraKeys!6164 thiss!1427) (zeroValue!6270 thiss!1427) (minValue!6270 thiss!1427) (bvsub (_size!3093 thiss!1427) #b00000000000000000000000000000001) lt!462190 lt!462191 (bvadd #b00000000000000000000000000000001 (_vacant!3093 thiss!1427)))) (tuple2!15843 Unit!34209 (LongMapFixedSize!6077 (defaultEntry!6436 thiss!1427) (mask!30581 thiss!1427) (extraKeys!6164 thiss!1427) (zeroValue!6270 thiss!1427) (minValue!6270 thiss!1427) (bvsub (_size!3093 thiss!1427) #b00000000000000000000000000000001) lt!462190 lt!462191 (_vacant!3093 thiss!1427)))))))

(assert (=> b!1046264 (= (-!551 (getCurrentListMap!3972 (_keys!11710 thiss!1427) (_values!6459 thiss!1427) (mask!30581 thiss!1427) (extraKeys!6164 thiss!1427) (zeroValue!6270 thiss!1427) (minValue!6270 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6436 thiss!1427)) key!909) (getCurrentListMap!3972 lt!462190 lt!462191 (mask!30581 thiss!1427) (extraKeys!6164 thiss!1427) (zeroValue!6270 thiss!1427) (minValue!6270 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6436 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9860 0))(
  ( (MissingZero!9860 (index!41811 (_ BitVec 32))) (Found!9860 (index!41812 (_ BitVec 32))) (Intermediate!9860 (undefined!10672 Bool) (index!41813 (_ BitVec 32)) (x!93490 (_ BitVec 32))) (Undefined!9860) (MissingVacant!9860 (index!41814 (_ BitVec 32))) )
))
(declare-fun lt!462187 () SeekEntryResult!9860)

(declare-fun dynLambda!2021 (Int (_ BitVec 64)) V!38059)

(assert (=> b!1046264 (= lt!462191 (array!65959 (store (arr!31724 (_values!6459 thiss!1427)) (index!41812 lt!462187) (ValueCellFull!11741 (dynLambda!2021 (defaultEntry!6436 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32259 (_values!6459 thiss!1427))))))

(declare-fun lt!462186 () Unit!34205)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!72 (array!65956 array!65958 (_ BitVec 32) (_ BitVec 32) V!38059 V!38059 (_ BitVec 32) (_ BitVec 64) Int) Unit!34205)

(assert (=> b!1046264 (= lt!462186 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!72 (_keys!11710 thiss!1427) (_values!6459 thiss!1427) (mask!30581 thiss!1427) (extraKeys!6164 thiss!1427) (zeroValue!6270 thiss!1427) (minValue!6270 thiss!1427) (index!41812 lt!462187) key!909 (defaultEntry!6436 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1046264 (not (arrayContainsKey!0 lt!462190 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!462184 () Unit!34205)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65956 (_ BitVec 32) (_ BitVec 64)) Unit!34205)

(assert (=> b!1046264 (= lt!462184 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11710 thiss!1427) (index!41812 lt!462187) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65956 (_ BitVec 32)) Bool)

(assert (=> b!1046264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!462190 (mask!30581 thiss!1427))))

(declare-fun lt!462193 () Unit!34205)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65956 (_ BitVec 32) (_ BitVec 32)) Unit!34205)

(assert (=> b!1046264 (= lt!462193 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11710 thiss!1427) (index!41812 lt!462187) (mask!30581 thiss!1427)))))

(declare-datatypes ((List!22043 0))(
  ( (Nil!22040) (Cons!22039 (h!23247 (_ BitVec 64)) (t!31343 List!22043)) )
))
(declare-fun arrayNoDuplicates!0 (array!65956 (_ BitVec 32) List!22043) Bool)

(assert (=> b!1046264 (arrayNoDuplicates!0 lt!462190 #b00000000000000000000000000000000 Nil!22040)))

(declare-fun lt!462188 () Unit!34205)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65956 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22043) Unit!34205)

(assert (=> b!1046264 (= lt!462188 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11710 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41812 lt!462187) #b00000000000000000000000000000000 Nil!22040))))

(declare-fun arrayCountValidKeys!0 (array!65956 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1046264 (= (arrayCountValidKeys!0 lt!462190 #b00000000000000000000000000000000 (size!32258 (_keys!11710 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11710 thiss!1427) #b00000000000000000000000000000000 (size!32258 (_keys!11710 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1046264 (= lt!462190 (array!65957 (store (arr!31723 (_keys!11710 thiss!1427)) (index!41812 lt!462187) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32258 (_keys!11710 thiss!1427))))))

(declare-fun lt!462185 () Unit!34205)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65956 (_ BitVec 32) (_ BitVec 64)) Unit!34205)

(assert (=> b!1046264 (= lt!462185 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11710 thiss!1427) (index!41812 lt!462187) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1046265 () Bool)

(assert (=> b!1046265 (= e!593193 (arrayContainsKey!0 (_keys!11710 (_2!7932 lt!462192)) key!909 #b00000000000000000000000000000000))))

(declare-fun b!1046266 () Bool)

(assert (=> b!1046266 (= e!593189 false)))

(declare-fun res!696512 () Bool)

(assert (=> start!91996 (=> (not res!696512) (not e!593190))))

(assert (=> start!91996 (= res!696512 (valid!2281 thiss!1427))))

(assert (=> start!91996 e!593190))

(assert (=> start!91996 e!593194))

(assert (=> start!91996 true))

(declare-fun b!1046267 () Bool)

(assert (=> b!1046267 (= e!593190 e!593197)))

(declare-fun res!696514 () Bool)

(assert (=> b!1046267 (=> (not res!696514) (not e!593197))))

(assert (=> b!1046267 (= res!696514 (is-Found!9860 lt!462187))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65956 (_ BitVec 32)) SeekEntryResult!9860)

(assert (=> b!1046267 (= lt!462187 (seekEntry!0 key!909 (_keys!11710 thiss!1427) (mask!30581 thiss!1427)))))

(declare-fun b!1046268 () Bool)

(assert (=> b!1046268 (= e!593191 (and e!593196 mapRes!38978))))

(declare-fun condMapEmpty!38978 () Bool)

(declare-fun mapDefault!38978 () ValueCell!11741)

