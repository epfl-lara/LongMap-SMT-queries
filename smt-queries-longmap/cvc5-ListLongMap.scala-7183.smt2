; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91978 () Bool)

(assert start!91978)

(declare-fun b!1045953 () Bool)

(declare-fun b_free!21151 () Bool)

(declare-fun b_next!21151 () Bool)

(assert (=> b!1045953 (= b_free!21151 (not b_next!21151))))

(declare-fun tp!74715 () Bool)

(declare-fun b_and!33797 () Bool)

(assert (=> b!1045953 (= tp!74715 b_and!33797)))

(declare-fun b!1045948 () Bool)

(declare-fun e!592965 () Bool)

(declare-datatypes ((V!38035 0))(
  ( (V!38036 (val!12486 Int)) )
))
(declare-datatypes ((ValueCell!11732 0))(
  ( (ValueCellFull!11732 (v!15083 V!38035)) (EmptyCell!11732) )
))
(declare-datatypes ((Unit!34169 0))(
  ( (Unit!34170) )
))
(declare-datatypes ((array!65920 0))(
  ( (array!65921 (arr!31705 (Array (_ BitVec 32) (_ BitVec 64))) (size!32240 (_ BitVec 32))) )
))
(declare-datatypes ((array!65922 0))(
  ( (array!65923 (arr!31706 (Array (_ BitVec 32) ValueCell!11732)) (size!32241 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6058 0))(
  ( (LongMapFixedSize!6059 (defaultEntry!6427 Int) (mask!30566 (_ BitVec 32)) (extraKeys!6155 (_ BitVec 32)) (zeroValue!6261 V!38035) (minValue!6261 V!38035) (_size!3084 (_ BitVec 32)) (_keys!11701 array!65920) (_values!6450 array!65922) (_vacant!3084 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15806 0))(
  ( (tuple2!15807 (_1!7914 Unit!34169) (_2!7914 LongMapFixedSize!6058)) )
))
(declare-fun lt!461924 () tuple2!15806)

(declare-datatypes ((List!22024 0))(
  ( (Nil!22021) (Cons!22020 (h!23228 (_ BitVec 64)) (t!31306 List!22024)) )
))
(declare-fun arrayNoDuplicates!0 (array!65920 (_ BitVec 32) List!22024) Bool)

(assert (=> b!1045948 (= e!592965 (arrayNoDuplicates!0 (_keys!11701 (_2!7914 lt!461924)) #b00000000000000000000000000000000 Nil!22021))))

(declare-fun b!1045949 () Bool)

(declare-fun e!592961 () Bool)

(declare-fun e!592963 () Bool)

(assert (=> b!1045949 (= e!592961 e!592963)))

(declare-fun res!696355 () Bool)

(assert (=> b!1045949 (=> (not res!696355) (not e!592963))))

(declare-datatypes ((SeekEntryResult!9851 0))(
  ( (MissingZero!9851 (index!41775 (_ BitVec 32))) (Found!9851 (index!41776 (_ BitVec 32))) (Intermediate!9851 (undefined!10663 Bool) (index!41777 (_ BitVec 32)) (x!93439 (_ BitVec 32))) (Undefined!9851) (MissingVacant!9851 (index!41778 (_ BitVec 32))) )
))
(declare-fun lt!461927 () SeekEntryResult!9851)

(assert (=> b!1045949 (= res!696355 (is-Found!9851 lt!461927))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun thiss!1427 () LongMapFixedSize!6058)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65920 (_ BitVec 32)) SeekEntryResult!9851)

(assert (=> b!1045949 (= lt!461927 (seekEntry!0 key!909 (_keys!11701 thiss!1427) (mask!30566 thiss!1427)))))

(declare-fun b!1045950 () Bool)

(declare-fun res!696354 () Bool)

(assert (=> b!1045950 (=> (not res!696354) (not e!592961))))

(assert (=> b!1045950 (= res!696354 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1045951 () Bool)

(declare-fun res!696360 () Bool)

(assert (=> b!1045951 (=> res!696360 e!592965)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65920 (_ BitVec 32)) Bool)

(assert (=> b!1045951 (= res!696360 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11701 (_2!7914 lt!461924)) (mask!30566 (_2!7914 lt!461924)))))))

(declare-fun mapIsEmpty!38951 () Bool)

(declare-fun mapRes!38951 () Bool)

(assert (=> mapIsEmpty!38951 mapRes!38951))

(declare-fun b!1045952 () Bool)

(assert (=> b!1045952 (= e!592963 (not e!592965))))

(declare-fun res!696357 () Bool)

(assert (=> b!1045952 (=> res!696357 e!592965)))

(declare-datatypes ((tuple2!15808 0))(
  ( (tuple2!15809 (_1!7915 (_ BitVec 64)) (_2!7915 V!38035)) )
))
(declare-datatypes ((List!22025 0))(
  ( (Nil!22022) (Cons!22021 (h!23229 tuple2!15808) (t!31307 List!22025)) )
))
(declare-datatypes ((ListLongMap!13799 0))(
  ( (ListLongMap!13800 (toList!6915 List!22025)) )
))
(declare-fun contains!6085 (ListLongMap!13799 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3963 (array!65920 array!65922 (_ BitVec 32) (_ BitVec 32) V!38035 V!38035 (_ BitVec 32) Int) ListLongMap!13799)

(assert (=> b!1045952 (= res!696357 (not (contains!6085 (getCurrentListMap!3963 (_keys!11701 (_2!7914 lt!461924)) (_values!6450 (_2!7914 lt!461924)) (mask!30566 (_2!7914 lt!461924)) (extraKeys!6155 (_2!7914 lt!461924)) (zeroValue!6261 (_2!7914 lt!461924)) (minValue!6261 (_2!7914 lt!461924)) #b00000000000000000000000000000000 (defaultEntry!6427 (_2!7914 lt!461924))) key!909)))))

(declare-fun lt!461926 () array!65922)

(declare-fun lt!461925 () array!65920)

(declare-fun Unit!34171 () Unit!34169)

(declare-fun Unit!34172 () Unit!34169)

(assert (=> b!1045952 (= lt!461924 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3084 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15807 Unit!34171 (LongMapFixedSize!6059 (defaultEntry!6427 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6155 thiss!1427) (zeroValue!6261 thiss!1427) (minValue!6261 thiss!1427) (bvsub (_size!3084 thiss!1427) #b00000000000000000000000000000001) lt!461925 lt!461926 (bvadd #b00000000000000000000000000000001 (_vacant!3084 thiss!1427)))) (tuple2!15807 Unit!34172 (LongMapFixedSize!6059 (defaultEntry!6427 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6155 thiss!1427) (zeroValue!6261 thiss!1427) (minValue!6261 thiss!1427) (bvsub (_size!3084 thiss!1427) #b00000000000000000000000000000001) lt!461925 lt!461926 (_vacant!3084 thiss!1427)))))))

(declare-fun -!542 (ListLongMap!13799 (_ BitVec 64)) ListLongMap!13799)

(assert (=> b!1045952 (= (-!542 (getCurrentListMap!3963 (_keys!11701 thiss!1427) (_values!6450 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6155 thiss!1427) (zeroValue!6261 thiss!1427) (minValue!6261 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6427 thiss!1427)) key!909) (getCurrentListMap!3963 lt!461925 lt!461926 (mask!30566 thiss!1427) (extraKeys!6155 thiss!1427) (zeroValue!6261 thiss!1427) (minValue!6261 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6427 thiss!1427)))))

(declare-fun dynLambda!2012 (Int (_ BitVec 64)) V!38035)

(assert (=> b!1045952 (= lt!461926 (array!65923 (store (arr!31706 (_values!6450 thiss!1427)) (index!41776 lt!461927) (ValueCellFull!11732 (dynLambda!2012 (defaultEntry!6427 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32241 (_values!6450 thiss!1427))))))

(declare-fun lt!461921 () Unit!34169)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!63 (array!65920 array!65922 (_ BitVec 32) (_ BitVec 32) V!38035 V!38035 (_ BitVec 32) (_ BitVec 64) Int) Unit!34169)

(assert (=> b!1045952 (= lt!461921 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!63 (_keys!11701 thiss!1427) (_values!6450 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6155 thiss!1427) (zeroValue!6261 thiss!1427) (minValue!6261 thiss!1427) (index!41776 lt!461927) key!909 (defaultEntry!6427 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1045952 (not (arrayContainsKey!0 lt!461925 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!461923 () Unit!34169)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65920 (_ BitVec 32) (_ BitVec 64)) Unit!34169)

(assert (=> b!1045952 (= lt!461923 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11701 thiss!1427) (index!41776 lt!461927) key!909))))

(assert (=> b!1045952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461925 (mask!30566 thiss!1427))))

(declare-fun lt!461922 () Unit!34169)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65920 (_ BitVec 32) (_ BitVec 32)) Unit!34169)

(assert (=> b!1045952 (= lt!461922 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11701 thiss!1427) (index!41776 lt!461927) (mask!30566 thiss!1427)))))

(assert (=> b!1045952 (arrayNoDuplicates!0 lt!461925 #b00000000000000000000000000000000 Nil!22021)))

(declare-fun lt!461920 () Unit!34169)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65920 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22024) Unit!34169)

(assert (=> b!1045952 (= lt!461920 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11701 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41776 lt!461927) #b00000000000000000000000000000000 Nil!22021))))

(declare-fun arrayCountValidKeys!0 (array!65920 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1045952 (= (arrayCountValidKeys!0 lt!461925 #b00000000000000000000000000000000 (size!32240 (_keys!11701 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11701 thiss!1427) #b00000000000000000000000000000000 (size!32240 (_keys!11701 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1045952 (= lt!461925 (array!65921 (store (arr!31705 (_keys!11701 thiss!1427)) (index!41776 lt!461927) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32240 (_keys!11701 thiss!1427))))))

(declare-fun lt!461919 () Unit!34169)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65920 (_ BitVec 32) (_ BitVec 64)) Unit!34169)

(assert (=> b!1045952 (= lt!461919 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11701 thiss!1427) (index!41776 lt!461927) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!592958 () Bool)

(declare-fun tp_is_empty!24871 () Bool)

(declare-fun e!592959 () Bool)

(declare-fun array_inv!24487 (array!65920) Bool)

(declare-fun array_inv!24488 (array!65922) Bool)

(assert (=> b!1045953 (= e!592959 (and tp!74715 tp_is_empty!24871 (array_inv!24487 (_keys!11701 thiss!1427)) (array_inv!24488 (_values!6450 thiss!1427)) e!592958))))

(declare-fun mapNonEmpty!38951 () Bool)

(declare-fun tp!74714 () Bool)

(declare-fun e!592960 () Bool)

(assert (=> mapNonEmpty!38951 (= mapRes!38951 (and tp!74714 e!592960))))

(declare-fun mapValue!38951 () ValueCell!11732)

(declare-fun mapKey!38951 () (_ BitVec 32))

(declare-fun mapRest!38951 () (Array (_ BitVec 32) ValueCell!11732))

(assert (=> mapNonEmpty!38951 (= (arr!31706 (_values!6450 thiss!1427)) (store mapRest!38951 mapKey!38951 mapValue!38951))))

(declare-fun res!696359 () Bool)

(assert (=> start!91978 (=> (not res!696359) (not e!592961))))

(declare-fun valid!2272 (LongMapFixedSize!6058) Bool)

(assert (=> start!91978 (= res!696359 (valid!2272 thiss!1427))))

(assert (=> start!91978 e!592961))

(assert (=> start!91978 e!592959))

(assert (=> start!91978 true))

(declare-fun b!1045954 () Bool)

(declare-fun e!592964 () Bool)

(assert (=> b!1045954 (= e!592964 tp_is_empty!24871)))

(declare-fun b!1045955 () Bool)

(declare-fun res!696358 () Bool)

(assert (=> b!1045955 (=> res!696358 e!592965)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1045955 (= res!696358 (not (validMask!0 (mask!30566 (_2!7914 lt!461924)))))))

(declare-fun b!1045956 () Bool)

(assert (=> b!1045956 (= e!592960 tp_is_empty!24871)))

(declare-fun b!1045957 () Bool)

(declare-fun res!696356 () Bool)

(assert (=> b!1045957 (=> res!696356 e!592965)))

(assert (=> b!1045957 (= res!696356 (or (not (= (size!32241 (_values!6450 (_2!7914 lt!461924))) (bvadd #b00000000000000000000000000000001 (mask!30566 (_2!7914 lt!461924))))) (not (= (size!32240 (_keys!11701 (_2!7914 lt!461924))) (size!32241 (_values!6450 (_2!7914 lt!461924))))) (bvslt (mask!30566 (_2!7914 lt!461924)) #b00000000000000000000000000000000) (bvslt (extraKeys!6155 (_2!7914 lt!461924)) #b00000000000000000000000000000000) (bvsgt (extraKeys!6155 (_2!7914 lt!461924)) #b00000000000000000000000000000011)))))

(declare-fun b!1045958 () Bool)

(assert (=> b!1045958 (= e!592958 (and e!592964 mapRes!38951))))

(declare-fun condMapEmpty!38951 () Bool)

(declare-fun mapDefault!38951 () ValueCell!11732)

