; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91988 () Bool)

(assert start!91988)

(declare-fun b!1046129 () Bool)

(declare-fun b_free!21161 () Bool)

(declare-fun b_next!21161 () Bool)

(assert (=> b!1046129 (= b_free!21161 (not b_next!21161))))

(declare-fun tp!74745 () Bool)

(declare-fun b_and!33817 () Bool)

(assert (=> b!1046129 (= tp!74745 b_and!33817)))

(declare-fun b!1046123 () Bool)

(declare-fun res!696462 () Bool)

(declare-fun e!593084 () Bool)

(assert (=> b!1046123 (=> (not res!696462) (not e!593084))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1046123 (= res!696462 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1046124 () Bool)

(declare-fun e!593085 () Bool)

(assert (=> b!1046124 (= e!593085 true)))

(declare-fun lt!462062 () Bool)

(declare-datatypes ((V!38047 0))(
  ( (V!38048 (val!12491 Int)) )
))
(declare-datatypes ((ValueCell!11737 0))(
  ( (ValueCellFull!11737 (v!15088 V!38047)) (EmptyCell!11737) )
))
(declare-datatypes ((Unit!34189 0))(
  ( (Unit!34190) )
))
(declare-datatypes ((array!65940 0))(
  ( (array!65941 (arr!31715 (Array (_ BitVec 32) (_ BitVec 64))) (size!32250 (_ BitVec 32))) )
))
(declare-datatypes ((array!65942 0))(
  ( (array!65943 (arr!31716 (Array (_ BitVec 32) ValueCell!11737)) (size!32251 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6068 0))(
  ( (LongMapFixedSize!6069 (defaultEntry!6432 Int) (mask!30573 (_ BitVec 32)) (extraKeys!6160 (_ BitVec 32)) (zeroValue!6266 V!38047) (minValue!6266 V!38047) (_size!3089 (_ BitVec 32)) (_keys!11706 array!65940) (_values!6455 array!65942) (_vacant!3089 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15826 0))(
  ( (tuple2!15827 (_1!7924 Unit!34189) (_2!7924 LongMapFixedSize!6068)) )
))
(declare-fun lt!462070 () tuple2!15826)

(declare-datatypes ((List!22034 0))(
  ( (Nil!22031) (Cons!22030 (h!23238 (_ BitVec 64)) (t!31326 List!22034)) )
))
(declare-fun arrayNoDuplicates!0 (array!65940 (_ BitVec 32) List!22034) Bool)

(assert (=> b!1046124 (= lt!462062 (arrayNoDuplicates!0 (_keys!11706 (_2!7924 lt!462070)) #b00000000000000000000000000000000 Nil!22031))))

(declare-fun b!1046126 () Bool)

(declare-fun res!696464 () Bool)

(assert (=> b!1046126 (=> res!696464 e!593085)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1046126 (= res!696464 (not (validMask!0 (mask!30573 (_2!7924 lt!462070)))))))

(declare-fun b!1046127 () Bool)

(declare-fun e!593081 () Bool)

(assert (=> b!1046127 (= e!593081 (not e!593085))))

(declare-fun res!696461 () Bool)

(assert (=> b!1046127 (=> res!696461 e!593085)))

(declare-datatypes ((tuple2!15828 0))(
  ( (tuple2!15829 (_1!7925 (_ BitVec 64)) (_2!7925 V!38047)) )
))
(declare-datatypes ((List!22035 0))(
  ( (Nil!22032) (Cons!22031 (h!23239 tuple2!15828) (t!31327 List!22035)) )
))
(declare-datatypes ((ListLongMap!13809 0))(
  ( (ListLongMap!13810 (toList!6920 List!22035)) )
))
(declare-fun contains!6090 (ListLongMap!13809 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3968 (array!65940 array!65942 (_ BitVec 32) (_ BitVec 32) V!38047 V!38047 (_ BitVec 32) Int) ListLongMap!13809)

(assert (=> b!1046127 (= res!696461 (not (contains!6090 (getCurrentListMap!3968 (_keys!11706 (_2!7924 lt!462070)) (_values!6455 (_2!7924 lt!462070)) (mask!30573 (_2!7924 lt!462070)) (extraKeys!6160 (_2!7924 lt!462070)) (zeroValue!6266 (_2!7924 lt!462070)) (minValue!6266 (_2!7924 lt!462070)) #b00000000000000000000000000000000 (defaultEntry!6432 (_2!7924 lt!462070))) key!909)))))

(declare-fun lt!462068 () array!65942)

(declare-fun thiss!1427 () LongMapFixedSize!6068)

(declare-fun lt!462066 () array!65940)

(declare-fun Unit!34191 () Unit!34189)

(declare-fun Unit!34192 () Unit!34189)

(assert (=> b!1046127 (= lt!462070 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3089 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15827 Unit!34191 (LongMapFixedSize!6069 (defaultEntry!6432 thiss!1427) (mask!30573 thiss!1427) (extraKeys!6160 thiss!1427) (zeroValue!6266 thiss!1427) (minValue!6266 thiss!1427) (bvsub (_size!3089 thiss!1427) #b00000000000000000000000000000001) lt!462066 lt!462068 (bvadd #b00000000000000000000000000000001 (_vacant!3089 thiss!1427)))) (tuple2!15827 Unit!34192 (LongMapFixedSize!6069 (defaultEntry!6432 thiss!1427) (mask!30573 thiss!1427) (extraKeys!6160 thiss!1427) (zeroValue!6266 thiss!1427) (minValue!6266 thiss!1427) (bvsub (_size!3089 thiss!1427) #b00000000000000000000000000000001) lt!462066 lt!462068 (_vacant!3089 thiss!1427)))))))

(declare-fun -!547 (ListLongMap!13809 (_ BitVec 64)) ListLongMap!13809)

(assert (=> b!1046127 (= (-!547 (getCurrentListMap!3968 (_keys!11706 thiss!1427) (_values!6455 thiss!1427) (mask!30573 thiss!1427) (extraKeys!6160 thiss!1427) (zeroValue!6266 thiss!1427) (minValue!6266 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6432 thiss!1427)) key!909) (getCurrentListMap!3968 lt!462066 lt!462068 (mask!30573 thiss!1427) (extraKeys!6160 thiss!1427) (zeroValue!6266 thiss!1427) (minValue!6266 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6432 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9856 0))(
  ( (MissingZero!9856 (index!41795 (_ BitVec 32))) (Found!9856 (index!41796 (_ BitVec 32))) (Intermediate!9856 (undefined!10668 Bool) (index!41797 (_ BitVec 32)) (x!93462 (_ BitVec 32))) (Undefined!9856) (MissingVacant!9856 (index!41798 (_ BitVec 32))) )
))
(declare-fun lt!462069 () SeekEntryResult!9856)

(declare-fun dynLambda!2017 (Int (_ BitVec 64)) V!38047)

(assert (=> b!1046127 (= lt!462068 (array!65943 (store (arr!31716 (_values!6455 thiss!1427)) (index!41796 lt!462069) (ValueCellFull!11737 (dynLambda!2017 (defaultEntry!6432 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32251 (_values!6455 thiss!1427))))))

(declare-fun lt!462067 () Unit!34189)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!68 (array!65940 array!65942 (_ BitVec 32) (_ BitVec 32) V!38047 V!38047 (_ BitVec 32) (_ BitVec 64) Int) Unit!34189)

(assert (=> b!1046127 (= lt!462067 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!68 (_keys!11706 thiss!1427) (_values!6455 thiss!1427) (mask!30573 thiss!1427) (extraKeys!6160 thiss!1427) (zeroValue!6266 thiss!1427) (minValue!6266 thiss!1427) (index!41796 lt!462069) key!909 (defaultEntry!6432 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1046127 (not (arrayContainsKey!0 lt!462066 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!462071 () Unit!34189)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65940 (_ BitVec 32) (_ BitVec 64)) Unit!34189)

(assert (=> b!1046127 (= lt!462071 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11706 thiss!1427) (index!41796 lt!462069) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65940 (_ BitVec 32)) Bool)

(assert (=> b!1046127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!462066 (mask!30573 thiss!1427))))

(declare-fun lt!462064 () Unit!34189)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65940 (_ BitVec 32) (_ BitVec 32)) Unit!34189)

(assert (=> b!1046127 (= lt!462064 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11706 thiss!1427) (index!41796 lt!462069) (mask!30573 thiss!1427)))))

(assert (=> b!1046127 (arrayNoDuplicates!0 lt!462066 #b00000000000000000000000000000000 Nil!22031)))

(declare-fun lt!462065 () Unit!34189)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65940 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22034) Unit!34189)

(assert (=> b!1046127 (= lt!462065 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11706 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41796 lt!462069) #b00000000000000000000000000000000 Nil!22031))))

(declare-fun arrayCountValidKeys!0 (array!65940 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1046127 (= (arrayCountValidKeys!0 lt!462066 #b00000000000000000000000000000000 (size!32250 (_keys!11706 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11706 thiss!1427) #b00000000000000000000000000000000 (size!32250 (_keys!11706 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1046127 (= lt!462066 (array!65941 (store (arr!31715 (_keys!11706 thiss!1427)) (index!41796 lt!462069) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32250 (_keys!11706 thiss!1427))))))

(declare-fun lt!462063 () Unit!34189)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65940 (_ BitVec 32) (_ BitVec 64)) Unit!34189)

(assert (=> b!1046127 (= lt!462063 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11706 thiss!1427) (index!41796 lt!462069) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1046128 () Bool)

(declare-fun res!696463 () Bool)

(assert (=> b!1046128 (=> res!696463 e!593085)))

(assert (=> b!1046128 (= res!696463 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11706 (_2!7924 lt!462070)) (mask!30573 (_2!7924 lt!462070)))))))

(declare-fun mapNonEmpty!38966 () Bool)

(declare-fun mapRes!38966 () Bool)

(declare-fun tp!74744 () Bool)

(declare-fun e!593083 () Bool)

(assert (=> mapNonEmpty!38966 (= mapRes!38966 (and tp!74744 e!593083))))

(declare-fun mapValue!38966 () ValueCell!11737)

(declare-fun mapKey!38966 () (_ BitVec 32))

(declare-fun mapRest!38966 () (Array (_ BitVec 32) ValueCell!11737))

(assert (=> mapNonEmpty!38966 (= (arr!31716 (_values!6455 thiss!1427)) (store mapRest!38966 mapKey!38966 mapValue!38966))))

(declare-fun tp_is_empty!24881 () Bool)

(declare-fun e!593082 () Bool)

(declare-fun e!593080 () Bool)

(declare-fun array_inv!24497 (array!65940) Bool)

(declare-fun array_inv!24498 (array!65942) Bool)

(assert (=> b!1046129 (= e!593082 (and tp!74745 tp_is_empty!24881 (array_inv!24497 (_keys!11706 thiss!1427)) (array_inv!24498 (_values!6455 thiss!1427)) e!593080))))

(declare-fun b!1046130 () Bool)

(assert (=> b!1046130 (= e!593084 e!593081)))

(declare-fun res!696459 () Bool)

(assert (=> b!1046130 (=> (not res!696459) (not e!593081))))

(assert (=> b!1046130 (= res!696459 (is-Found!9856 lt!462069))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65940 (_ BitVec 32)) SeekEntryResult!9856)

(assert (=> b!1046130 (= lt!462069 (seekEntry!0 key!909 (_keys!11706 thiss!1427) (mask!30573 thiss!1427)))))

(declare-fun b!1046125 () Bool)

(declare-fun res!696460 () Bool)

(assert (=> b!1046125 (=> res!696460 e!593085)))

(assert (=> b!1046125 (= res!696460 (or (not (= (size!32251 (_values!6455 (_2!7924 lt!462070))) (bvadd #b00000000000000000000000000000001 (mask!30573 (_2!7924 lt!462070))))) (not (= (size!32250 (_keys!11706 (_2!7924 lt!462070))) (size!32251 (_values!6455 (_2!7924 lt!462070))))) (bvslt (mask!30573 (_2!7924 lt!462070)) #b00000000000000000000000000000000) (bvslt (extraKeys!6160 (_2!7924 lt!462070)) #b00000000000000000000000000000000) (bvsgt (extraKeys!6160 (_2!7924 lt!462070)) #b00000000000000000000000000000011)))))

(declare-fun res!696465 () Bool)

(assert (=> start!91988 (=> (not res!696465) (not e!593084))))

(declare-fun valid!2277 (LongMapFixedSize!6068) Bool)

(assert (=> start!91988 (= res!696465 (valid!2277 thiss!1427))))

(assert (=> start!91988 e!593084))

(assert (=> start!91988 e!593082))

(assert (=> start!91988 true))

(declare-fun mapIsEmpty!38966 () Bool)

(assert (=> mapIsEmpty!38966 mapRes!38966))

(declare-fun b!1046131 () Bool)

(assert (=> b!1046131 (= e!593083 tp_is_empty!24881)))

(declare-fun b!1046132 () Bool)

(declare-fun e!593079 () Bool)

(assert (=> b!1046132 (= e!593080 (and e!593079 mapRes!38966))))

(declare-fun condMapEmpty!38966 () Bool)

(declare-fun mapDefault!38966 () ValueCell!11737)

