; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92224 () Bool)

(assert start!92224)

(declare-fun b!1047473 () Bool)

(declare-fun b_free!21163 () Bool)

(declare-fun b_next!21163 () Bool)

(assert (=> b!1047473 (= b_free!21163 (not b_next!21163))))

(declare-fun tp!74750 () Bool)

(declare-fun b_and!33831 () Bool)

(assert (=> b!1047473 (= tp!74750 b_and!33831)))

(declare-fun res!696987 () Bool)

(declare-fun e!593955 () Bool)

(assert (=> start!92224 (=> (not res!696987) (not e!593955))))

(declare-datatypes ((V!38051 0))(
  ( (V!38052 (val!12492 Int)) )
))
(declare-datatypes ((ValueCell!11738 0))(
  ( (ValueCellFull!11738 (v!15085 V!38051)) (EmptyCell!11738) )
))
(declare-datatypes ((array!65993 0))(
  ( (array!65994 (arr!31735 (Array (_ BitVec 32) (_ BitVec 64))) (size!32271 (_ BitVec 32))) )
))
(declare-datatypes ((array!65995 0))(
  ( (array!65996 (arr!31736 (Array (_ BitVec 32) ValueCell!11738)) (size!32272 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6070 0))(
  ( (LongMapFixedSize!6071 (defaultEntry!6433 Int) (mask!30636 (_ BitVec 32)) (extraKeys!6161 (_ BitVec 32)) (zeroValue!6267 V!38051) (minValue!6267 V!38051) (_size!3090 (_ BitVec 32)) (_keys!11745 array!65993) (_values!6456 array!65995) (_vacant!3090 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6070)

(declare-fun valid!2283 (LongMapFixedSize!6070) Bool)

(assert (=> start!92224 (= res!696987 (valid!2283 thiss!1427))))

(assert (=> start!92224 e!593955))

(declare-fun e!593950 () Bool)

(assert (=> start!92224 e!593950))

(assert (=> start!92224 true))

(declare-fun b!1047471 () Bool)

(declare-fun e!593951 () Bool)

(declare-fun tp_is_empty!24883 () Bool)

(assert (=> b!1047471 (= e!593951 tp_is_empty!24883)))

(declare-fun b!1047472 () Bool)

(declare-fun e!593949 () Bool)

(declare-fun mapRes!38969 () Bool)

(assert (=> b!1047472 (= e!593949 (and e!593951 mapRes!38969))))

(declare-fun condMapEmpty!38969 () Bool)

(declare-fun mapDefault!38969 () ValueCell!11738)

(assert (=> b!1047472 (= condMapEmpty!38969 (= (arr!31736 (_values!6456 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11738)) mapDefault!38969)))))

(declare-fun array_inv!24525 (array!65993) Bool)

(declare-fun array_inv!24526 (array!65995) Bool)

(assert (=> b!1047473 (= e!593950 (and tp!74750 tp_is_empty!24883 (array_inv!24525 (_keys!11745 thiss!1427)) (array_inv!24526 (_values!6456 thiss!1427)) e!593949))))

(declare-fun b!1047474 () Bool)

(declare-fun e!593954 () Bool)

(assert (=> b!1047474 (= e!593955 e!593954)))

(declare-fun res!696986 () Bool)

(assert (=> b!1047474 (=> (not res!696986) (not e!593954))))

(declare-datatypes ((SeekEntryResult!9815 0))(
  ( (MissingZero!9815 (index!41631 (_ BitVec 32))) (Found!9815 (index!41632 (_ BitVec 32))) (Intermediate!9815 (undefined!10627 Bool) (index!41633 (_ BitVec 32)) (x!93453 (_ BitVec 32))) (Undefined!9815) (MissingVacant!9815 (index!41634 (_ BitVec 32))) )
))
(declare-fun lt!462614 () SeekEntryResult!9815)

(get-info :version)

(assert (=> b!1047474 (= res!696986 ((_ is Found!9815) lt!462614))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65993 (_ BitVec 32)) SeekEntryResult!9815)

(assert (=> b!1047474 (= lt!462614 (seekEntry!0 key!909 (_keys!11745 thiss!1427) (mask!30636 thiss!1427)))))

(declare-fun b!1047475 () Bool)

(declare-fun e!593952 () Bool)

(declare-datatypes ((Unit!34205 0))(
  ( (Unit!34206) )
))
(declare-datatypes ((tuple2!15826 0))(
  ( (tuple2!15827 (_1!7924 Unit!34205) (_2!7924 LongMapFixedSize!6070)) )
))
(declare-fun lt!462615 () tuple2!15826)

(assert (=> b!1047475 (= e!593952 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!6161 (_2!7924 lt!462615)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6161 (_2!7924 lt!462615)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1047476 () Bool)

(declare-fun e!593953 () Bool)

(assert (=> b!1047476 (= e!593953 false)))

(assert (=> b!1047476 e!593952))

(declare-fun c!106775 () Bool)

(assert (=> b!1047476 (= c!106775 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!462612 () Unit!34205)

(declare-fun lemmaKeyInListMapIsInArray!351 (array!65993 array!65995 (_ BitVec 32) (_ BitVec 32) V!38051 V!38051 (_ BitVec 64) Int) Unit!34205)

(assert (=> b!1047476 (= lt!462612 (lemmaKeyInListMapIsInArray!351 (_keys!11745 (_2!7924 lt!462615)) (_values!6456 (_2!7924 lt!462615)) (mask!30636 (_2!7924 lt!462615)) (extraKeys!6161 (_2!7924 lt!462615)) (zeroValue!6267 (_2!7924 lt!462615)) (minValue!6267 (_2!7924 lt!462615)) key!909 (defaultEntry!6433 (_2!7924 lt!462615))))))

(declare-fun b!1047477 () Bool)

(declare-fun res!696985 () Bool)

(assert (=> b!1047477 (=> (not res!696985) (not e!593955))))

(assert (=> b!1047477 (= res!696985 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1047478 () Bool)

(declare-fun e!593948 () Bool)

(assert (=> b!1047478 (= e!593948 tp_is_empty!24883)))

(declare-fun b!1047479 () Bool)

(assert (=> b!1047479 (= e!593954 (not e!593953))))

(declare-fun res!696984 () Bool)

(assert (=> b!1047479 (=> res!696984 e!593953)))

(declare-datatypes ((tuple2!15828 0))(
  ( (tuple2!15829 (_1!7925 (_ BitVec 64)) (_2!7925 V!38051)) )
))
(declare-datatypes ((List!22029 0))(
  ( (Nil!22026) (Cons!22025 (h!23242 tuple2!15828) (t!31315 List!22029)) )
))
(declare-datatypes ((ListLongMap!13815 0))(
  ( (ListLongMap!13816 (toList!6923 List!22029)) )
))
(declare-fun contains!6118 (ListLongMap!13815 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3967 (array!65993 array!65995 (_ BitVec 32) (_ BitVec 32) V!38051 V!38051 (_ BitVec 32) Int) ListLongMap!13815)

(assert (=> b!1047479 (= res!696984 (not (contains!6118 (getCurrentListMap!3967 (_keys!11745 (_2!7924 lt!462615)) (_values!6456 (_2!7924 lt!462615)) (mask!30636 (_2!7924 lt!462615)) (extraKeys!6161 (_2!7924 lt!462615)) (zeroValue!6267 (_2!7924 lt!462615)) (minValue!6267 (_2!7924 lt!462615)) #b00000000000000000000000000000000 (defaultEntry!6433 (_2!7924 lt!462615))) key!909)))))

(declare-fun lt!462611 () array!65995)

(declare-fun lt!462613 () array!65993)

(declare-fun Unit!34207 () Unit!34205)

(declare-fun Unit!34208 () Unit!34205)

(assert (=> b!1047479 (= lt!462615 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3090 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15827 Unit!34207 (LongMapFixedSize!6071 (defaultEntry!6433 thiss!1427) (mask!30636 thiss!1427) (extraKeys!6161 thiss!1427) (zeroValue!6267 thiss!1427) (minValue!6267 thiss!1427) (bvsub (_size!3090 thiss!1427) #b00000000000000000000000000000001) lt!462613 lt!462611 (bvadd #b00000000000000000000000000000001 (_vacant!3090 thiss!1427)))) (tuple2!15827 Unit!34208 (LongMapFixedSize!6071 (defaultEntry!6433 thiss!1427) (mask!30636 thiss!1427) (extraKeys!6161 thiss!1427) (zeroValue!6267 thiss!1427) (minValue!6267 thiss!1427) (bvsub (_size!3090 thiss!1427) #b00000000000000000000000000000001) lt!462613 lt!462611 (_vacant!3090 thiss!1427)))))))

(declare-fun -!546 (ListLongMap!13815 (_ BitVec 64)) ListLongMap!13815)

(assert (=> b!1047479 (= (-!546 (getCurrentListMap!3967 (_keys!11745 thiss!1427) (_values!6456 thiss!1427) (mask!30636 thiss!1427) (extraKeys!6161 thiss!1427) (zeroValue!6267 thiss!1427) (minValue!6267 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6433 thiss!1427)) key!909) (getCurrentListMap!3967 lt!462613 lt!462611 (mask!30636 thiss!1427) (extraKeys!6161 thiss!1427) (zeroValue!6267 thiss!1427) (minValue!6267 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6433 thiss!1427)))))

(declare-fun dynLambda!2038 (Int (_ BitVec 64)) V!38051)

(assert (=> b!1047479 (= lt!462611 (array!65996 (store (arr!31736 (_values!6456 thiss!1427)) (index!41632 lt!462614) (ValueCellFull!11738 (dynLambda!2038 (defaultEntry!6433 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32272 (_values!6456 thiss!1427))))))

(declare-fun lt!462609 () Unit!34205)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!68 (array!65993 array!65995 (_ BitVec 32) (_ BitVec 32) V!38051 V!38051 (_ BitVec 32) (_ BitVec 64) Int) Unit!34205)

(assert (=> b!1047479 (= lt!462609 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!68 (_keys!11745 thiss!1427) (_values!6456 thiss!1427) (mask!30636 thiss!1427) (extraKeys!6161 thiss!1427) (zeroValue!6267 thiss!1427) (minValue!6267 thiss!1427) (index!41632 lt!462614) key!909 (defaultEntry!6433 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1047479 (not (arrayContainsKey!0 lt!462613 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!462616 () Unit!34205)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65993 (_ BitVec 32) (_ BitVec 64)) Unit!34205)

(assert (=> b!1047479 (= lt!462616 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11745 thiss!1427) (index!41632 lt!462614) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65993 (_ BitVec 32)) Bool)

(assert (=> b!1047479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!462613 (mask!30636 thiss!1427))))

(declare-fun lt!462607 () Unit!34205)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65993 (_ BitVec 32) (_ BitVec 32)) Unit!34205)

(assert (=> b!1047479 (= lt!462607 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11745 thiss!1427) (index!41632 lt!462614) (mask!30636 thiss!1427)))))

(declare-datatypes ((List!22030 0))(
  ( (Nil!22027) (Cons!22026 (h!23243 (_ BitVec 64)) (t!31316 List!22030)) )
))
(declare-fun arrayNoDuplicates!0 (array!65993 (_ BitVec 32) List!22030) Bool)

(assert (=> b!1047479 (arrayNoDuplicates!0 lt!462613 #b00000000000000000000000000000000 Nil!22027)))

(declare-fun lt!462610 () Unit!34205)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65993 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22030) Unit!34205)

(assert (=> b!1047479 (= lt!462610 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11745 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41632 lt!462614) #b00000000000000000000000000000000 Nil!22027))))

(declare-fun arrayCountValidKeys!0 (array!65993 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1047479 (= (arrayCountValidKeys!0 lt!462613 #b00000000000000000000000000000000 (size!32271 (_keys!11745 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11745 thiss!1427) #b00000000000000000000000000000000 (size!32271 (_keys!11745 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1047479 (= lt!462613 (array!65994 (store (arr!31735 (_keys!11745 thiss!1427)) (index!41632 lt!462614) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32271 (_keys!11745 thiss!1427))))))

(declare-fun lt!462608 () Unit!34205)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65993 (_ BitVec 32) (_ BitVec 64)) Unit!34205)

(assert (=> b!1047479 (= lt!462608 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11745 thiss!1427) (index!41632 lt!462614) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!38969 () Bool)

(declare-fun tp!74751 () Bool)

(assert (=> mapNonEmpty!38969 (= mapRes!38969 (and tp!74751 e!593948))))

(declare-fun mapRest!38969 () (Array (_ BitVec 32) ValueCell!11738))

(declare-fun mapKey!38969 () (_ BitVec 32))

(declare-fun mapValue!38969 () ValueCell!11738)

(assert (=> mapNonEmpty!38969 (= (arr!31736 (_values!6456 thiss!1427)) (store mapRest!38969 mapKey!38969 mapValue!38969))))

(declare-fun mapIsEmpty!38969 () Bool)

(assert (=> mapIsEmpty!38969 mapRes!38969))

(declare-fun b!1047480 () Bool)

(assert (=> b!1047480 (= e!593952 (arrayContainsKey!0 (_keys!11745 (_2!7924 lt!462615)) key!909 #b00000000000000000000000000000000))))

(assert (= (and start!92224 res!696987) b!1047477))

(assert (= (and b!1047477 res!696985) b!1047474))

(assert (= (and b!1047474 res!696986) b!1047479))

(assert (= (and b!1047479 (not res!696984)) b!1047476))

(assert (= (and b!1047476 c!106775) b!1047480))

(assert (= (and b!1047476 (not c!106775)) b!1047475))

(assert (= (and b!1047472 condMapEmpty!38969) mapIsEmpty!38969))

(assert (= (and b!1047472 (not condMapEmpty!38969)) mapNonEmpty!38969))

(assert (= (and mapNonEmpty!38969 ((_ is ValueCellFull!11738) mapValue!38969)) b!1047478))

(assert (= (and b!1047472 ((_ is ValueCellFull!11738) mapDefault!38969)) b!1047471))

(assert (= b!1047473 b!1047472))

(assert (= start!92224 b!1047473))

(declare-fun b_lambda!16357 () Bool)

(assert (=> (not b_lambda!16357) (not b!1047479)))

(declare-fun t!31314 () Bool)

(declare-fun tb!7107 () Bool)

(assert (=> (and b!1047473 (= (defaultEntry!6433 thiss!1427) (defaultEntry!6433 thiss!1427)) t!31314) tb!7107))

(declare-fun result!14647 () Bool)

(assert (=> tb!7107 (= result!14647 tp_is_empty!24883)))

(assert (=> b!1047479 t!31314))

(declare-fun b_and!33833 () Bool)

(assert (= b_and!33831 (and (=> t!31314 result!14647) b_and!33833)))

(declare-fun m!967777 () Bool)

(assert (=> b!1047476 m!967777))

(declare-fun m!967779 () Bool)

(assert (=> b!1047473 m!967779))

(declare-fun m!967781 () Bool)

(assert (=> b!1047473 m!967781))

(declare-fun m!967783 () Bool)

(assert (=> mapNonEmpty!38969 m!967783))

(declare-fun m!967785 () Bool)

(assert (=> b!1047479 m!967785))

(declare-fun m!967787 () Bool)

(assert (=> b!1047479 m!967787))

(declare-fun m!967789 () Bool)

(assert (=> b!1047479 m!967789))

(declare-fun m!967791 () Bool)

(assert (=> b!1047479 m!967791))

(declare-fun m!967793 () Bool)

(assert (=> b!1047479 m!967793))

(declare-fun m!967795 () Bool)

(assert (=> b!1047479 m!967795))

(declare-fun m!967797 () Bool)

(assert (=> b!1047479 m!967797))

(declare-fun m!967799 () Bool)

(assert (=> b!1047479 m!967799))

(declare-fun m!967801 () Bool)

(assert (=> b!1047479 m!967801))

(declare-fun m!967803 () Bool)

(assert (=> b!1047479 m!967803))

(declare-fun m!967805 () Bool)

(assert (=> b!1047479 m!967805))

(declare-fun m!967807 () Bool)

(assert (=> b!1047479 m!967807))

(declare-fun m!967809 () Bool)

(assert (=> b!1047479 m!967809))

(assert (=> b!1047479 m!967807))

(declare-fun m!967811 () Bool)

(assert (=> b!1047479 m!967811))

(declare-fun m!967813 () Bool)

(assert (=> b!1047479 m!967813))

(declare-fun m!967815 () Bool)

(assert (=> b!1047479 m!967815))

(declare-fun m!967817 () Bool)

(assert (=> b!1047479 m!967817))

(assert (=> b!1047479 m!967803))

(declare-fun m!967819 () Bool)

(assert (=> b!1047479 m!967819))

(declare-fun m!967821 () Bool)

(assert (=> start!92224 m!967821))

(declare-fun m!967823 () Bool)

(assert (=> b!1047474 m!967823))

(declare-fun m!967825 () Bool)

(assert (=> b!1047480 m!967825))

(check-sat tp_is_empty!24883 (not b_next!21163) (not b!1047473) (not start!92224) b_and!33833 (not b_lambda!16357) (not b!1047479) (not b!1047476) (not b!1047474) (not mapNonEmpty!38969) (not b!1047480))
(check-sat b_and!33833 (not b_next!21163))
