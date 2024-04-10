; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91984 () Bool)

(assert start!91984)

(declare-fun b!1046054 () Bool)

(declare-fun b_free!21157 () Bool)

(declare-fun b_next!21157 () Bool)

(assert (=> b!1046054 (= b_free!21157 (not b_next!21157))))

(declare-fun tp!74732 () Bool)

(declare-fun b_and!33809 () Bool)

(assert (=> b!1046054 (= tp!74732 b_and!33809)))

(declare-fun tp_is_empty!24877 () Bool)

(declare-fun e!593036 () Bool)

(declare-datatypes ((V!38043 0))(
  ( (V!38044 (val!12489 Int)) )
))
(declare-datatypes ((ValueCell!11735 0))(
  ( (ValueCellFull!11735 (v!15086 V!38043)) (EmptyCell!11735) )
))
(declare-datatypes ((array!65932 0))(
  ( (array!65933 (arr!31711 (Array (_ BitVec 32) (_ BitVec 64))) (size!32246 (_ BitVec 32))) )
))
(declare-datatypes ((array!65934 0))(
  ( (array!65935 (arr!31712 (Array (_ BitVec 32) ValueCell!11735)) (size!32247 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6064 0))(
  ( (LongMapFixedSize!6065 (defaultEntry!6430 Int) (mask!30571 (_ BitVec 32)) (extraKeys!6158 (_ BitVec 32)) (zeroValue!6264 V!38043) (minValue!6264 V!38043) (_size!3087 (_ BitVec 32)) (_keys!11704 array!65932) (_values!6453 array!65934) (_vacant!3087 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6064)

(declare-fun e!593030 () Bool)

(declare-fun array_inv!24493 (array!65932) Bool)

(declare-fun array_inv!24494 (array!65934) Bool)

(assert (=> b!1046054 (= e!593036 (and tp!74732 tp_is_empty!24877 (array_inv!24493 (_keys!11704 thiss!1427)) (array_inv!24494 (_values!6453 thiss!1427)) e!593030))))

(declare-fun b!1046055 () Bool)

(declare-fun e!593032 () Bool)

(declare-fun e!593035 () Bool)

(assert (=> b!1046055 (= e!593032 (not e!593035))))

(declare-fun res!696421 () Bool)

(assert (=> b!1046055 (=> res!696421 e!593035)))

(declare-datatypes ((Unit!34181 0))(
  ( (Unit!34182) )
))
(declare-datatypes ((tuple2!15818 0))(
  ( (tuple2!15819 (_1!7920 Unit!34181) (_2!7920 LongMapFixedSize!6064)) )
))
(declare-fun lt!462004 () tuple2!15818)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15820 0))(
  ( (tuple2!15821 (_1!7921 (_ BitVec 64)) (_2!7921 V!38043)) )
))
(declare-datatypes ((List!22030 0))(
  ( (Nil!22027) (Cons!22026 (h!23234 tuple2!15820) (t!31318 List!22030)) )
))
(declare-datatypes ((ListLongMap!13805 0))(
  ( (ListLongMap!13806 (toList!6918 List!22030)) )
))
(declare-fun contains!6088 (ListLongMap!13805 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3966 (array!65932 array!65934 (_ BitVec 32) (_ BitVec 32) V!38043 V!38043 (_ BitVec 32) Int) ListLongMap!13805)

(assert (=> b!1046055 (= res!696421 (not (contains!6088 (getCurrentListMap!3966 (_keys!11704 (_2!7920 lt!462004)) (_values!6453 (_2!7920 lt!462004)) (mask!30571 (_2!7920 lt!462004)) (extraKeys!6158 (_2!7920 lt!462004)) (zeroValue!6264 (_2!7920 lt!462004)) (minValue!6264 (_2!7920 lt!462004)) #b00000000000000000000000000000000 (defaultEntry!6430 (_2!7920 lt!462004))) key!909)))))

(declare-fun lt!462005 () array!65934)

(declare-fun lt!462002 () array!65932)

(declare-fun Unit!34183 () Unit!34181)

(declare-fun Unit!34184 () Unit!34181)

(assert (=> b!1046055 (= lt!462004 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3087 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15819 Unit!34183 (LongMapFixedSize!6065 (defaultEntry!6430 thiss!1427) (mask!30571 thiss!1427) (extraKeys!6158 thiss!1427) (zeroValue!6264 thiss!1427) (minValue!6264 thiss!1427) (bvsub (_size!3087 thiss!1427) #b00000000000000000000000000000001) lt!462002 lt!462005 (bvadd #b00000000000000000000000000000001 (_vacant!3087 thiss!1427)))) (tuple2!15819 Unit!34184 (LongMapFixedSize!6065 (defaultEntry!6430 thiss!1427) (mask!30571 thiss!1427) (extraKeys!6158 thiss!1427) (zeroValue!6264 thiss!1427) (minValue!6264 thiss!1427) (bvsub (_size!3087 thiss!1427) #b00000000000000000000000000000001) lt!462002 lt!462005 (_vacant!3087 thiss!1427)))))))

(declare-fun -!545 (ListLongMap!13805 (_ BitVec 64)) ListLongMap!13805)

(assert (=> b!1046055 (= (-!545 (getCurrentListMap!3966 (_keys!11704 thiss!1427) (_values!6453 thiss!1427) (mask!30571 thiss!1427) (extraKeys!6158 thiss!1427) (zeroValue!6264 thiss!1427) (minValue!6264 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6430 thiss!1427)) key!909) (getCurrentListMap!3966 lt!462002 lt!462005 (mask!30571 thiss!1427) (extraKeys!6158 thiss!1427) (zeroValue!6264 thiss!1427) (minValue!6264 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6430 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9854 0))(
  ( (MissingZero!9854 (index!41787 (_ BitVec 32))) (Found!9854 (index!41788 (_ BitVec 32))) (Intermediate!9854 (undefined!10666 Bool) (index!41789 (_ BitVec 32)) (x!93456 (_ BitVec 32))) (Undefined!9854) (MissingVacant!9854 (index!41790 (_ BitVec 32))) )
))
(declare-fun lt!462011 () SeekEntryResult!9854)

(declare-fun dynLambda!2015 (Int (_ BitVec 64)) V!38043)

(assert (=> b!1046055 (= lt!462005 (array!65935 (store (arr!31712 (_values!6453 thiss!1427)) (index!41788 lt!462011) (ValueCellFull!11735 (dynLambda!2015 (defaultEntry!6430 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32247 (_values!6453 thiss!1427))))))

(declare-fun lt!462009 () Unit!34181)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!66 (array!65932 array!65934 (_ BitVec 32) (_ BitVec 32) V!38043 V!38043 (_ BitVec 32) (_ BitVec 64) Int) Unit!34181)

(assert (=> b!1046055 (= lt!462009 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!66 (_keys!11704 thiss!1427) (_values!6453 thiss!1427) (mask!30571 thiss!1427) (extraKeys!6158 thiss!1427) (zeroValue!6264 thiss!1427) (minValue!6264 thiss!1427) (index!41788 lt!462011) key!909 (defaultEntry!6430 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1046055 (not (arrayContainsKey!0 lt!462002 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!462010 () Unit!34181)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65932 (_ BitVec 32) (_ BitVec 64)) Unit!34181)

(assert (=> b!1046055 (= lt!462010 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11704 thiss!1427) (index!41788 lt!462011) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65932 (_ BitVec 32)) Bool)

(assert (=> b!1046055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!462002 (mask!30571 thiss!1427))))

(declare-fun lt!462003 () Unit!34181)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65932 (_ BitVec 32) (_ BitVec 32)) Unit!34181)

(assert (=> b!1046055 (= lt!462003 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11704 thiss!1427) (index!41788 lt!462011) (mask!30571 thiss!1427)))))

(declare-datatypes ((List!22031 0))(
  ( (Nil!22028) (Cons!22027 (h!23235 (_ BitVec 64)) (t!31319 List!22031)) )
))
(declare-fun arrayNoDuplicates!0 (array!65932 (_ BitVec 32) List!22031) Bool)

(assert (=> b!1046055 (arrayNoDuplicates!0 lt!462002 #b00000000000000000000000000000000 Nil!22028)))

(declare-fun lt!462006 () Unit!34181)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65932 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22031) Unit!34181)

(assert (=> b!1046055 (= lt!462006 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11704 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41788 lt!462011) #b00000000000000000000000000000000 Nil!22028))))

(declare-fun arrayCountValidKeys!0 (array!65932 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1046055 (= (arrayCountValidKeys!0 lt!462002 #b00000000000000000000000000000000 (size!32246 (_keys!11704 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11704 thiss!1427) #b00000000000000000000000000000000 (size!32246 (_keys!11704 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1046055 (= lt!462002 (array!65933 (store (arr!31711 (_keys!11704 thiss!1427)) (index!41788 lt!462011) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32246 (_keys!11704 thiss!1427))))))

(declare-fun lt!462007 () Unit!34181)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65932 (_ BitVec 32) (_ BitVec 64)) Unit!34181)

(assert (=> b!1046055 (= lt!462007 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11704 thiss!1427) (index!41788 lt!462011) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!38960 () Bool)

(declare-fun mapRes!38960 () Bool)

(declare-fun tp!74733 () Bool)

(declare-fun e!593037 () Bool)

(assert (=> mapNonEmpty!38960 (= mapRes!38960 (and tp!74733 e!593037))))

(declare-fun mapValue!38960 () ValueCell!11735)

(declare-fun mapKey!38960 () (_ BitVec 32))

(declare-fun mapRest!38960 () (Array (_ BitVec 32) ValueCell!11735))

(assert (=> mapNonEmpty!38960 (= (arr!31712 (_values!6453 thiss!1427)) (store mapRest!38960 mapKey!38960 mapValue!38960))))

(declare-fun b!1046056 () Bool)

(assert (=> b!1046056 (= e!593037 tp_is_empty!24877)))

(declare-fun b!1046057 () Bool)

(declare-fun res!696417 () Bool)

(assert (=> b!1046057 (=> res!696417 e!593035)))

(assert (=> b!1046057 (= res!696417 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11704 (_2!7920 lt!462004)) (mask!30571 (_2!7920 lt!462004)))))))

(declare-fun mapIsEmpty!38960 () Bool)

(assert (=> mapIsEmpty!38960 mapRes!38960))

(declare-fun b!1046053 () Bool)

(declare-fun e!593031 () Bool)

(assert (=> b!1046053 (= e!593031 e!593032)))

(declare-fun res!696422 () Bool)

(assert (=> b!1046053 (=> (not res!696422) (not e!593032))))

(assert (=> b!1046053 (= res!696422 (is-Found!9854 lt!462011))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65932 (_ BitVec 32)) SeekEntryResult!9854)

(assert (=> b!1046053 (= lt!462011 (seekEntry!0 key!909 (_keys!11704 thiss!1427) (mask!30571 thiss!1427)))))

(declare-fun res!696423 () Bool)

(assert (=> start!91984 (=> (not res!696423) (not e!593031))))

(declare-fun valid!2275 (LongMapFixedSize!6064) Bool)

(assert (=> start!91984 (= res!696423 (valid!2275 thiss!1427))))

(assert (=> start!91984 e!593031))

(assert (=> start!91984 e!593036))

(assert (=> start!91984 true))

(declare-fun b!1046058 () Bool)

(declare-fun e!593033 () Bool)

(assert (=> b!1046058 (= e!593033 tp_is_empty!24877)))

(declare-fun b!1046059 () Bool)

(declare-fun res!696420 () Bool)

(assert (=> b!1046059 (=> res!696420 e!593035)))

(assert (=> b!1046059 (= res!696420 (or (not (= (size!32247 (_values!6453 (_2!7920 lt!462004))) (bvadd #b00000000000000000000000000000001 (mask!30571 (_2!7920 lt!462004))))) (not (= (size!32246 (_keys!11704 (_2!7920 lt!462004))) (size!32247 (_values!6453 (_2!7920 lt!462004))))) (bvslt (mask!30571 (_2!7920 lt!462004)) #b00000000000000000000000000000000) (bvslt (extraKeys!6158 (_2!7920 lt!462004)) #b00000000000000000000000000000000) (bvsgt (extraKeys!6158 (_2!7920 lt!462004)) #b00000000000000000000000000000011)))))

(declare-fun b!1046060 () Bool)

(assert (=> b!1046060 (= e!593030 (and e!593033 mapRes!38960))))

(declare-fun condMapEmpty!38960 () Bool)

(declare-fun mapDefault!38960 () ValueCell!11735)

