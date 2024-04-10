; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92000 () Bool)

(assert start!92000)

(declare-fun b!1046346 () Bool)

(declare-fun b_free!21173 () Bool)

(declare-fun b_next!21173 () Bool)

(assert (=> b!1046346 (= b_free!21173 (not b_next!21173))))

(declare-fun tp!74781 () Bool)

(declare-fun b_and!33841 () Bool)

(assert (=> b!1046346 (= tp!74781 b_and!33841)))

(declare-fun e!593259 () Bool)

(declare-fun b!1046340 () Bool)

(declare-datatypes ((V!38063 0))(
  ( (V!38064 (val!12497 Int)) )
))
(declare-datatypes ((ValueCell!11743 0))(
  ( (ValueCellFull!11743 (v!15094 V!38063)) (EmptyCell!11743) )
))
(declare-datatypes ((Unit!34216 0))(
  ( (Unit!34217) )
))
(declare-datatypes ((array!65964 0))(
  ( (array!65965 (arr!31727 (Array (_ BitVec 32) (_ BitVec 64))) (size!32262 (_ BitVec 32))) )
))
(declare-datatypes ((array!65966 0))(
  ( (array!65967 (arr!31728 (Array (_ BitVec 32) ValueCell!11743)) (size!32263 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6080 0))(
  ( (LongMapFixedSize!6081 (defaultEntry!6438 Int) (mask!30583 (_ BitVec 32)) (extraKeys!6166 (_ BitVec 32)) (zeroValue!6272 V!38063) (minValue!6272 V!38063) (_size!3095 (_ BitVec 32)) (_keys!11712 array!65964) (_values!6461 array!65966) (_vacant!3095 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15850 0))(
  ( (tuple2!15851 (_1!7936 Unit!34216) (_2!7936 LongMapFixedSize!6080)) )
))
(declare-fun lt!462251 () tuple2!15850)

(declare-fun thiss!1427 () LongMapFixedSize!6080)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15852 0))(
  ( (tuple2!15853 (_1!7937 (_ BitVec 64)) (_2!7937 V!38063)) )
))
(declare-datatypes ((List!22046 0))(
  ( (Nil!22043) (Cons!22042 (h!23250 tuple2!15852) (t!31350 List!22046)) )
))
(declare-datatypes ((ListLongMap!13821 0))(
  ( (ListLongMap!13822 (toList!6926 List!22046)) )
))
(declare-fun map!14830 (LongMapFixedSize!6080) ListLongMap!13821)

(declare-fun -!553 (ListLongMap!13821 (_ BitVec 64)) ListLongMap!13821)

(assert (=> b!1046340 (= e!593259 (= (map!14830 (_2!7936 lt!462251)) (-!553 (map!14830 thiss!1427) key!909)))))

(declare-fun b!1046341 () Bool)

(declare-fun e!593258 () Bool)

(assert (=> b!1046341 (= e!593258 (not e!593259))))

(declare-fun res!696545 () Bool)

(assert (=> b!1046341 (=> (not res!696545) (not e!593259))))

(declare-fun valid!2283 (LongMapFixedSize!6080) Bool)

(assert (=> b!1046341 (= res!696545 (valid!2283 (_2!7936 lt!462251)))))

(declare-fun lt!462260 () Unit!34216)

(declare-fun e!593256 () Unit!34216)

(assert (=> b!1046341 (= lt!462260 e!593256)))

(declare-fun c!106389 () Bool)

(declare-fun contains!6096 (ListLongMap!13821 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3974 (array!65964 array!65966 (_ BitVec 32) (_ BitVec 32) V!38063 V!38063 (_ BitVec 32) Int) ListLongMap!13821)

(assert (=> b!1046341 (= c!106389 (contains!6096 (getCurrentListMap!3974 (_keys!11712 (_2!7936 lt!462251)) (_values!6461 (_2!7936 lt!462251)) (mask!30583 (_2!7936 lt!462251)) (extraKeys!6166 (_2!7936 lt!462251)) (zeroValue!6272 (_2!7936 lt!462251)) (minValue!6272 (_2!7936 lt!462251)) #b00000000000000000000000000000000 (defaultEntry!6438 (_2!7936 lt!462251))) key!909))))

(declare-fun lt!462255 () array!65966)

(declare-fun lt!462252 () array!65964)

(declare-fun Unit!34218 () Unit!34216)

(declare-fun Unit!34219 () Unit!34216)

(assert (=> b!1046341 (= lt!462251 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3095 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15851 Unit!34218 (LongMapFixedSize!6081 (defaultEntry!6438 thiss!1427) (mask!30583 thiss!1427) (extraKeys!6166 thiss!1427) (zeroValue!6272 thiss!1427) (minValue!6272 thiss!1427) (bvsub (_size!3095 thiss!1427) #b00000000000000000000000000000001) lt!462252 lt!462255 (bvadd #b00000000000000000000000000000001 (_vacant!3095 thiss!1427)))) (tuple2!15851 Unit!34219 (LongMapFixedSize!6081 (defaultEntry!6438 thiss!1427) (mask!30583 thiss!1427) (extraKeys!6166 thiss!1427) (zeroValue!6272 thiss!1427) (minValue!6272 thiss!1427) (bvsub (_size!3095 thiss!1427) #b00000000000000000000000000000001) lt!462252 lt!462255 (_vacant!3095 thiss!1427)))))))

(assert (=> b!1046341 (= (-!553 (getCurrentListMap!3974 (_keys!11712 thiss!1427) (_values!6461 thiss!1427) (mask!30583 thiss!1427) (extraKeys!6166 thiss!1427) (zeroValue!6272 thiss!1427) (minValue!6272 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6438 thiss!1427)) key!909) (getCurrentListMap!3974 lt!462252 lt!462255 (mask!30583 thiss!1427) (extraKeys!6166 thiss!1427) (zeroValue!6272 thiss!1427) (minValue!6272 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6438 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9862 0))(
  ( (MissingZero!9862 (index!41819 (_ BitVec 32))) (Found!9862 (index!41820 (_ BitVec 32))) (Intermediate!9862 (undefined!10674 Bool) (index!41821 (_ BitVec 32)) (x!93496 (_ BitVec 32))) (Undefined!9862) (MissingVacant!9862 (index!41822 (_ BitVec 32))) )
))
(declare-fun lt!462258 () SeekEntryResult!9862)

(declare-fun dynLambda!2023 (Int (_ BitVec 64)) V!38063)

(assert (=> b!1046341 (= lt!462255 (array!65967 (store (arr!31728 (_values!6461 thiss!1427)) (index!41820 lt!462258) (ValueCellFull!11743 (dynLambda!2023 (defaultEntry!6438 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32263 (_values!6461 thiss!1427))))))

(declare-fun lt!462256 () Unit!34216)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!74 (array!65964 array!65966 (_ BitVec 32) (_ BitVec 32) V!38063 V!38063 (_ BitVec 32) (_ BitVec 64) Int) Unit!34216)

(assert (=> b!1046341 (= lt!462256 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!74 (_keys!11712 thiss!1427) (_values!6461 thiss!1427) (mask!30583 thiss!1427) (extraKeys!6166 thiss!1427) (zeroValue!6272 thiss!1427) (minValue!6272 thiss!1427) (index!41820 lt!462258) key!909 (defaultEntry!6438 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1046341 (not (arrayContainsKey!0 lt!462252 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!462253 () Unit!34216)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65964 (_ BitVec 32) (_ BitVec 64)) Unit!34216)

(assert (=> b!1046341 (= lt!462253 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11712 thiss!1427) (index!41820 lt!462258) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65964 (_ BitVec 32)) Bool)

(assert (=> b!1046341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!462252 (mask!30583 thiss!1427))))

(declare-fun lt!462259 () Unit!34216)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65964 (_ BitVec 32) (_ BitVec 32)) Unit!34216)

(assert (=> b!1046341 (= lt!462259 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11712 thiss!1427) (index!41820 lt!462258) (mask!30583 thiss!1427)))))

(declare-datatypes ((List!22047 0))(
  ( (Nil!22044) (Cons!22043 (h!23251 (_ BitVec 64)) (t!31351 List!22047)) )
))
(declare-fun arrayNoDuplicates!0 (array!65964 (_ BitVec 32) List!22047) Bool)

(assert (=> b!1046341 (arrayNoDuplicates!0 lt!462252 #b00000000000000000000000000000000 Nil!22044)))

(declare-fun lt!462250 () Unit!34216)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65964 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22047) Unit!34216)

(assert (=> b!1046341 (= lt!462250 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11712 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41820 lt!462258) #b00000000000000000000000000000000 Nil!22044))))

(declare-fun arrayCountValidKeys!0 (array!65964 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1046341 (= (arrayCountValidKeys!0 lt!462252 #b00000000000000000000000000000000 (size!32262 (_keys!11712 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11712 thiss!1427) #b00000000000000000000000000000000 (size!32262 (_keys!11712 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1046341 (= lt!462252 (array!65965 (store (arr!31727 (_keys!11712 thiss!1427)) (index!41820 lt!462258) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32262 (_keys!11712 thiss!1427))))))

(declare-fun lt!462257 () Unit!34216)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65964 (_ BitVec 32) (_ BitVec 64)) Unit!34216)

(assert (=> b!1046341 (= lt!462257 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11712 thiss!1427) (index!41820 lt!462258) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1046342 () Bool)

(declare-fun e!593257 () Bool)

(assert (=> b!1046342 (= e!593257 e!593258)))

(declare-fun res!696544 () Bool)

(assert (=> b!1046342 (=> (not res!696544) (not e!593258))))

(assert (=> b!1046342 (= res!696544 (is-Found!9862 lt!462258))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65964 (_ BitVec 32)) SeekEntryResult!9862)

(assert (=> b!1046342 (= lt!462258 (seekEntry!0 key!909 (_keys!11712 thiss!1427) (mask!30583 thiss!1427)))))

(declare-fun mapIsEmpty!38984 () Bool)

(declare-fun mapRes!38984 () Bool)

(assert (=> mapIsEmpty!38984 mapRes!38984))

(declare-fun b!1046343 () Bool)

(declare-fun e!593262 () Bool)

(declare-fun tp_is_empty!24893 () Bool)

(assert (=> b!1046343 (= e!593262 tp_is_empty!24893)))

(declare-fun res!696543 () Bool)

(assert (=> start!92000 (=> (not res!696543) (not e!593257))))

(assert (=> start!92000 (= res!696543 (valid!2283 thiss!1427))))

(assert (=> start!92000 e!593257))

(declare-fun e!593264 () Bool)

(assert (=> start!92000 e!593264))

(assert (=> start!92000 true))

(declare-fun b!1046344 () Bool)

(declare-fun Unit!34220 () Unit!34216)

(assert (=> b!1046344 (= e!593256 Unit!34220)))

(declare-fun lt!462254 () Unit!34216)

(declare-fun lemmaKeyInListMapIsInArray!360 (array!65964 array!65966 (_ BitVec 32) (_ BitVec 32) V!38063 V!38063 (_ BitVec 64) Int) Unit!34216)

(assert (=> b!1046344 (= lt!462254 (lemmaKeyInListMapIsInArray!360 (_keys!11712 (_2!7936 lt!462251)) (_values!6461 (_2!7936 lt!462251)) (mask!30583 (_2!7936 lt!462251)) (extraKeys!6166 (_2!7936 lt!462251)) (zeroValue!6272 (_2!7936 lt!462251)) (minValue!6272 (_2!7936 lt!462251)) key!909 (defaultEntry!6438 (_2!7936 lt!462251))))))

(declare-fun c!106388 () Bool)

(assert (=> b!1046344 (= c!106388 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!696542 () Bool)

(declare-fun e!593261 () Bool)

(assert (=> b!1046344 (= res!696542 e!593261)))

(declare-fun e!593263 () Bool)

(assert (=> b!1046344 (=> (not res!696542) (not e!593263))))

(assert (=> b!1046344 e!593263))

(declare-fun b!1046345 () Bool)

(declare-fun res!696546 () Bool)

(assert (=> b!1046345 (=> (not res!696546) (not e!593257))))

(assert (=> b!1046345 (= res!696546 (not (= key!909 (bvneg key!909))))))

(declare-fun e!593255 () Bool)

(declare-fun array_inv!24509 (array!65964) Bool)

(declare-fun array_inv!24510 (array!65966) Bool)

(assert (=> b!1046346 (= e!593264 (and tp!74781 tp_is_empty!24893 (array_inv!24509 (_keys!11712 thiss!1427)) (array_inv!24510 (_values!6461 thiss!1427)) e!593255))))

(declare-fun b!1046347 () Bool)

(assert (=> b!1046347 (= e!593261 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!6166 (_2!7936 lt!462251)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6166 (_2!7936 lt!462251)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1046348 () Bool)

(declare-fun e!593265 () Bool)

(assert (=> b!1046348 (= e!593255 (and e!593265 mapRes!38984))))

(declare-fun condMapEmpty!38984 () Bool)

(declare-fun mapDefault!38984 () ValueCell!11743)

