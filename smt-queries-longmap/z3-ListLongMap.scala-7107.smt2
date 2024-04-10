; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90090 () Bool)

(assert start!90090)

(declare-fun b!1032085 () Bool)

(declare-fun b_free!20697 () Bool)

(declare-fun b_next!20697 () Bool)

(assert (=> b!1032085 (= b_free!20697 (not b_next!20697))))

(declare-fun tp!73162 () Bool)

(declare-fun b_and!33161 () Bool)

(assert (=> b!1032085 (= tp!73162 b_and!33161)))

(declare-fun mapIsEmpty!38079 () Bool)

(declare-fun mapRes!38079 () Bool)

(assert (=> mapIsEmpty!38079 mapRes!38079))

(declare-fun b!1032074 () Bool)

(declare-fun e!583046 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37429 0))(
  ( (V!37430 (val!12259 Int)) )
))
(declare-datatypes ((ValueCell!11505 0))(
  ( (ValueCellFull!11505 (v!14836 V!37429)) (EmptyCell!11505) )
))
(declare-datatypes ((Unit!33806 0))(
  ( (Unit!33807) )
))
(declare-datatypes ((array!64898 0))(
  ( (array!64899 (arr!31251 (Array (_ BitVec 32) (_ BitVec 64))) (size!31768 (_ BitVec 32))) )
))
(declare-datatypes ((array!64900 0))(
  ( (array!64901 (arr!31252 (Array (_ BitVec 32) ValueCell!11505)) (size!31769 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5604 0))(
  ( (LongMapFixedSize!5605 (defaultEntry!6176 Int) (mask!29984 (_ BitVec 32)) (extraKeys!5908 (_ BitVec 32)) (zeroValue!6012 V!37429) (minValue!6012 V!37429) (_size!2857 (_ BitVec 32)) (_keys!11349 array!64898) (_values!6199 array!64900) (_vacant!2857 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15718 0))(
  ( (tuple2!15719 (_1!7870 Unit!33806) (_2!7870 LongMapFixedSize!5604)) )
))
(declare-fun lt!455950 () tuple2!15718)

(assert (=> b!1032074 (= e!583046 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5908 (_2!7870 lt!455950)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5908 (_2!7870 lt!455950)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1032075 () Bool)

(declare-fun res!689915 () Bool)

(declare-fun e!583045 () Bool)

(assert (=> b!1032075 (=> (not res!689915) (not e!583045))))

(assert (=> b!1032075 (= res!689915 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1032076 () Bool)

(declare-fun e!583041 () Bool)

(assert (=> b!1032076 (= e!583045 e!583041)))

(declare-fun res!689913 () Bool)

(assert (=> b!1032076 (=> (not res!689913) (not e!583041))))

(declare-datatypes ((SeekEntryResult!9722 0))(
  ( (MissingZero!9722 (index!41259 (_ BitVec 32))) (Found!9722 (index!41260 (_ BitVec 32))) (Intermediate!9722 (undefined!10534 Bool) (index!41261 (_ BitVec 32)) (x!91944 (_ BitVec 32))) (Undefined!9722) (MissingVacant!9722 (index!41262 (_ BitVec 32))) )
))
(declare-fun lt!455948 () SeekEntryResult!9722)

(get-info :version)

(assert (=> b!1032076 (= res!689913 ((_ is Found!9722) lt!455948))))

(declare-fun thiss!1427 () LongMapFixedSize!5604)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64898 (_ BitVec 32)) SeekEntryResult!9722)

(assert (=> b!1032076 (= lt!455948 (seekEntry!0 key!909 (_keys!11349 thiss!1427) (mask!29984 thiss!1427)))))

(declare-fun b!1032077 () Bool)

(declare-fun e!583047 () Bool)

(declare-fun e!583044 () Bool)

(assert (=> b!1032077 (= e!583047 (and e!583044 mapRes!38079))))

(declare-fun condMapEmpty!38079 () Bool)

(declare-fun mapDefault!38079 () ValueCell!11505)

(assert (=> b!1032077 (= condMapEmpty!38079 (= (arr!31252 (_values!6199 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11505)) mapDefault!38079)))))

(declare-fun mapNonEmpty!38079 () Bool)

(declare-fun tp!73161 () Bool)

(declare-fun e!583043 () Bool)

(assert (=> mapNonEmpty!38079 (= mapRes!38079 (and tp!73161 e!583043))))

(declare-fun mapValue!38079 () ValueCell!11505)

(declare-fun mapKey!38079 () (_ BitVec 32))

(declare-fun mapRest!38079 () (Array (_ BitVec 32) ValueCell!11505))

(assert (=> mapNonEmpty!38079 (= (arr!31252 (_values!6199 thiss!1427)) (store mapRest!38079 mapKey!38079 mapValue!38079))))

(declare-fun b!1032078 () Bool)

(declare-fun e!583039 () Unit!33806)

(declare-fun Unit!33808 () Unit!33806)

(assert (=> b!1032078 (= e!583039 Unit!33808)))

(declare-fun lt!455947 () Unit!33806)

(declare-fun lemmaKeyInListMapIsInArray!353 (array!64898 array!64900 (_ BitVec 32) (_ BitVec 32) V!37429 V!37429 (_ BitVec 64) Int) Unit!33806)

(assert (=> b!1032078 (= lt!455947 (lemmaKeyInListMapIsInArray!353 (_keys!11349 (_2!7870 lt!455950)) (_values!6199 (_2!7870 lt!455950)) (mask!29984 (_2!7870 lt!455950)) (extraKeys!5908 (_2!7870 lt!455950)) (zeroValue!6012 (_2!7870 lt!455950)) (minValue!6012 (_2!7870 lt!455950)) key!909 (defaultEntry!6176 (_2!7870 lt!455950))))))

(declare-fun c!104295 () Bool)

(assert (=> b!1032078 (= c!104295 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!689914 () Bool)

(assert (=> b!1032078 (= res!689914 e!583046)))

(declare-fun e!583040 () Bool)

(assert (=> b!1032078 (=> (not res!689914) (not e!583040))))

(assert (=> b!1032078 e!583040))

(declare-fun res!689912 () Bool)

(assert (=> start!90090 (=> (not res!689912) (not e!583045))))

(declare-fun valid!2122 (LongMapFixedSize!5604) Bool)

(assert (=> start!90090 (= res!689912 (valid!2122 thiss!1427))))

(assert (=> start!90090 e!583045))

(declare-fun e!583042 () Bool)

(assert (=> start!90090 e!583042))

(assert (=> start!90090 true))

(declare-fun b!1032079 () Bool)

(declare-fun tp_is_empty!24417 () Bool)

(assert (=> b!1032079 (= e!583043 tp_is_empty!24417)))

(declare-fun b!1032080 () Bool)

(assert (=> b!1032080 (= e!583041 (not true))))

(declare-fun lt!455953 () Bool)

(assert (=> b!1032080 (= lt!455953 (valid!2122 (_2!7870 lt!455950)))))

(declare-fun lt!455949 () Unit!33806)

(assert (=> b!1032080 (= lt!455949 e!583039)))

(declare-fun c!104294 () Bool)

(declare-datatypes ((tuple2!15720 0))(
  ( (tuple2!15721 (_1!7871 (_ BitVec 64)) (_2!7871 V!37429)) )
))
(declare-datatypes ((List!21893 0))(
  ( (Nil!21890) (Cons!21889 (h!23091 tuple2!15720) (t!31085 List!21893)) )
))
(declare-datatypes ((ListLongMap!13751 0))(
  ( (ListLongMap!13752 (toList!6891 List!21893)) )
))
(declare-fun contains!6005 (ListLongMap!13751 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3939 (array!64898 array!64900 (_ BitVec 32) (_ BitVec 32) V!37429 V!37429 (_ BitVec 32) Int) ListLongMap!13751)

(assert (=> b!1032080 (= c!104294 (contains!6005 (getCurrentListMap!3939 (_keys!11349 (_2!7870 lt!455950)) (_values!6199 (_2!7870 lt!455950)) (mask!29984 (_2!7870 lt!455950)) (extraKeys!5908 (_2!7870 lt!455950)) (zeroValue!6012 (_2!7870 lt!455950)) (minValue!6012 (_2!7870 lt!455950)) #b00000000000000000000000000000000 (defaultEntry!6176 (_2!7870 lt!455950))) key!909))))

(declare-fun lt!455954 () array!64898)

(declare-fun lt!455955 () array!64900)

(declare-fun Unit!33809 () Unit!33806)

(declare-fun Unit!33810 () Unit!33806)

(assert (=> b!1032080 (= lt!455950 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2857 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15719 Unit!33809 (LongMapFixedSize!5605 (defaultEntry!6176 thiss!1427) (mask!29984 thiss!1427) (extraKeys!5908 thiss!1427) (zeroValue!6012 thiss!1427) (minValue!6012 thiss!1427) (bvsub (_size!2857 thiss!1427) #b00000000000000000000000000000001) lt!455954 lt!455955 (bvadd #b00000000000000000000000000000001 (_vacant!2857 thiss!1427)))) (tuple2!15719 Unit!33810 (LongMapFixedSize!5605 (defaultEntry!6176 thiss!1427) (mask!29984 thiss!1427) (extraKeys!5908 thiss!1427) (zeroValue!6012 thiss!1427) (minValue!6012 thiss!1427) (bvsub (_size!2857 thiss!1427) #b00000000000000000000000000000001) lt!455954 lt!455955 (_vacant!2857 thiss!1427)))))))

(declare-fun -!518 (ListLongMap!13751 (_ BitVec 64)) ListLongMap!13751)

(assert (=> b!1032080 (= (-!518 (getCurrentListMap!3939 (_keys!11349 thiss!1427) (_values!6199 thiss!1427) (mask!29984 thiss!1427) (extraKeys!5908 thiss!1427) (zeroValue!6012 thiss!1427) (minValue!6012 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6176 thiss!1427)) key!909) (getCurrentListMap!3939 lt!455954 lt!455955 (mask!29984 thiss!1427) (extraKeys!5908 thiss!1427) (zeroValue!6012 thiss!1427) (minValue!6012 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6176 thiss!1427)))))

(declare-fun dynLambda!1988 (Int (_ BitVec 64)) V!37429)

(assert (=> b!1032080 (= lt!455955 (array!64901 (store (arr!31252 (_values!6199 thiss!1427)) (index!41260 lt!455948) (ValueCellFull!11505 (dynLambda!1988 (defaultEntry!6176 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31769 (_values!6199 thiss!1427))))))

(declare-fun lt!455957 () Unit!33806)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!44 (array!64898 array!64900 (_ BitVec 32) (_ BitVec 32) V!37429 V!37429 (_ BitVec 32) (_ BitVec 64) Int) Unit!33806)

(assert (=> b!1032080 (= lt!455957 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!44 (_keys!11349 thiss!1427) (_values!6199 thiss!1427) (mask!29984 thiss!1427) (extraKeys!5908 thiss!1427) (zeroValue!6012 thiss!1427) (minValue!6012 thiss!1427) (index!41260 lt!455948) key!909 (defaultEntry!6176 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032080 (not (arrayContainsKey!0 lt!455954 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455951 () Unit!33806)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64898 (_ BitVec 32) (_ BitVec 64)) Unit!33806)

(assert (=> b!1032080 (= lt!455951 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11349 thiss!1427) (index!41260 lt!455948) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64898 (_ BitVec 32)) Bool)

(assert (=> b!1032080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455954 (mask!29984 thiss!1427))))

(declare-fun lt!455956 () Unit!33806)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64898 (_ BitVec 32) (_ BitVec 32)) Unit!33806)

(assert (=> b!1032080 (= lt!455956 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11349 thiss!1427) (index!41260 lt!455948) (mask!29984 thiss!1427)))))

(declare-datatypes ((List!21894 0))(
  ( (Nil!21891) (Cons!21890 (h!23092 (_ BitVec 64)) (t!31086 List!21894)) )
))
(declare-fun arrayNoDuplicates!0 (array!64898 (_ BitVec 32) List!21894) Bool)

(assert (=> b!1032080 (arrayNoDuplicates!0 lt!455954 #b00000000000000000000000000000000 Nil!21891)))

(declare-fun lt!455952 () Unit!33806)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64898 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21894) Unit!33806)

(assert (=> b!1032080 (= lt!455952 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11349 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41260 lt!455948) #b00000000000000000000000000000000 Nil!21891))))

(declare-fun arrayCountValidKeys!0 (array!64898 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032080 (= (arrayCountValidKeys!0 lt!455954 #b00000000000000000000000000000000 (size!31768 (_keys!11349 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11349 thiss!1427) #b00000000000000000000000000000000 (size!31768 (_keys!11349 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1032080 (= lt!455954 (array!64899 (store (arr!31251 (_keys!11349 thiss!1427)) (index!41260 lt!455948) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31768 (_keys!11349 thiss!1427))))))

(declare-fun lt!455946 () Unit!33806)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64898 (_ BitVec 32) (_ BitVec 64)) Unit!33806)

(assert (=> b!1032080 (= lt!455946 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11349 thiss!1427) (index!41260 lt!455948) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1032081 () Bool)

(assert (=> b!1032081 (= e!583040 false)))

(declare-fun b!1032082 () Bool)

(assert (=> b!1032082 (= e!583046 (arrayContainsKey!0 (_keys!11349 (_2!7870 lt!455950)) key!909 #b00000000000000000000000000000000))))

(declare-fun b!1032083 () Bool)

(assert (=> b!1032083 (= e!583044 tp_is_empty!24417)))

(declare-fun b!1032084 () Bool)

(declare-fun Unit!33811 () Unit!33806)

(assert (=> b!1032084 (= e!583039 Unit!33811)))

(declare-fun array_inv!24193 (array!64898) Bool)

(declare-fun array_inv!24194 (array!64900) Bool)

(assert (=> b!1032085 (= e!583042 (and tp!73162 tp_is_empty!24417 (array_inv!24193 (_keys!11349 thiss!1427)) (array_inv!24194 (_values!6199 thiss!1427)) e!583047))))

(assert (= (and start!90090 res!689912) b!1032075))

(assert (= (and b!1032075 res!689915) b!1032076))

(assert (= (and b!1032076 res!689913) b!1032080))

(assert (= (and b!1032080 c!104294) b!1032078))

(assert (= (and b!1032080 (not c!104294)) b!1032084))

(assert (= (and b!1032078 c!104295) b!1032082))

(assert (= (and b!1032078 (not c!104295)) b!1032074))

(assert (= (and b!1032078 res!689914) b!1032081))

(assert (= (and b!1032077 condMapEmpty!38079) mapIsEmpty!38079))

(assert (= (and b!1032077 (not condMapEmpty!38079)) mapNonEmpty!38079))

(assert (= (and mapNonEmpty!38079 ((_ is ValueCellFull!11505) mapValue!38079)) b!1032079))

(assert (= (and b!1032077 ((_ is ValueCellFull!11505) mapDefault!38079)) b!1032083))

(assert (= b!1032085 b!1032077))

(assert (= start!90090 b!1032085))

(declare-fun b_lambda!16041 () Bool)

(assert (=> (not b_lambda!16041) (not b!1032080)))

(declare-fun t!31084 () Bool)

(declare-fun tb!7015 () Bool)

(assert (=> (and b!1032085 (= (defaultEntry!6176 thiss!1427) (defaultEntry!6176 thiss!1427)) t!31084) tb!7015))

(declare-fun result!14359 () Bool)

(assert (=> tb!7015 (= result!14359 tp_is_empty!24417)))

(assert (=> b!1032080 t!31084))

(declare-fun b_and!33163 () Bool)

(assert (= b_and!33161 (and (=> t!31084 result!14359) b_and!33163)))

(declare-fun m!952453 () Bool)

(assert (=> start!90090 m!952453))

(declare-fun m!952455 () Bool)

(assert (=> b!1032082 m!952455))

(declare-fun m!952457 () Bool)

(assert (=> mapNonEmpty!38079 m!952457))

(declare-fun m!952459 () Bool)

(assert (=> b!1032080 m!952459))

(declare-fun m!952461 () Bool)

(assert (=> b!1032080 m!952461))

(declare-fun m!952463 () Bool)

(assert (=> b!1032080 m!952463))

(declare-fun m!952465 () Bool)

(assert (=> b!1032080 m!952465))

(declare-fun m!952467 () Bool)

(assert (=> b!1032080 m!952467))

(declare-fun m!952469 () Bool)

(assert (=> b!1032080 m!952469))

(declare-fun m!952471 () Bool)

(assert (=> b!1032080 m!952471))

(declare-fun m!952473 () Bool)

(assert (=> b!1032080 m!952473))

(declare-fun m!952475 () Bool)

(assert (=> b!1032080 m!952475))

(declare-fun m!952477 () Bool)

(assert (=> b!1032080 m!952477))

(declare-fun m!952479 () Bool)

(assert (=> b!1032080 m!952479))

(assert (=> b!1032080 m!952465))

(declare-fun m!952481 () Bool)

(assert (=> b!1032080 m!952481))

(declare-fun m!952483 () Bool)

(assert (=> b!1032080 m!952483))

(declare-fun m!952485 () Bool)

(assert (=> b!1032080 m!952485))

(declare-fun m!952487 () Bool)

(assert (=> b!1032080 m!952487))

(declare-fun m!952489 () Bool)

(assert (=> b!1032080 m!952489))

(declare-fun m!952491 () Bool)

(assert (=> b!1032080 m!952491))

(declare-fun m!952493 () Bool)

(assert (=> b!1032080 m!952493))

(assert (=> b!1032080 m!952469))

(declare-fun m!952495 () Bool)

(assert (=> b!1032080 m!952495))

(declare-fun m!952497 () Bool)

(assert (=> b!1032085 m!952497))

(declare-fun m!952499 () Bool)

(assert (=> b!1032085 m!952499))

(declare-fun m!952501 () Bool)

(assert (=> b!1032076 m!952501))

(declare-fun m!952503 () Bool)

(assert (=> b!1032078 m!952503))

(check-sat (not b!1032076) (not b!1032080) (not start!90090) (not mapNonEmpty!38079) (not b!1032082) (not b!1032085) tp_is_empty!24417 (not b!1032078) (not b_next!20697) (not b_lambda!16041) b_and!33163)
(check-sat b_and!33163 (not b_next!20697))
