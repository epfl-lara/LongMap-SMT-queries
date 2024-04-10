; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91734 () Bool)

(assert start!91734)

(declare-fun b!1044029 () Bool)

(declare-fun b_free!21111 () Bool)

(declare-fun b_next!21111 () Bool)

(assert (=> b!1044029 (= b_free!21111 (not b_next!21111))))

(declare-fun tp!74577 () Bool)

(declare-fun b_and!33669 () Bool)

(assert (=> b!1044029 (= tp!74577 b_and!33669)))

(declare-fun mapNonEmpty!38873 () Bool)

(declare-fun mapRes!38873 () Bool)

(declare-fun tp!74576 () Bool)

(declare-fun e!591627 () Bool)

(assert (=> mapNonEmpty!38873 (= mapRes!38873 (and tp!74576 e!591627))))

(declare-fun mapKey!38873 () (_ BitVec 32))

(declare-datatypes ((V!37981 0))(
  ( (V!37982 (val!12466 Int)) )
))
(declare-datatypes ((ValueCell!11712 0))(
  ( (ValueCellFull!11712 (v!15057 V!37981)) (EmptyCell!11712) )
))
(declare-datatypes ((array!65828 0))(
  ( (array!65829 (arr!31665 (Array (_ BitVec 32) (_ BitVec 64))) (size!32200 (_ BitVec 32))) )
))
(declare-datatypes ((array!65830 0))(
  ( (array!65831 (arr!31666 (Array (_ BitVec 32) ValueCell!11712)) (size!32201 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6018 0))(
  ( (LongMapFixedSize!6019 (defaultEntry!6395 Int) (mask!30496 (_ BitVec 32)) (extraKeys!6123 (_ BitVec 32)) (zeroValue!6229 V!37981) (minValue!6229 V!37981) (_size!3064 (_ BitVec 32)) (_keys!11657 array!65828) (_values!6418 array!65830) (_vacant!3064 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6018)

(declare-fun mapValue!38873 () ValueCell!11712)

(declare-fun mapRest!38873 () (Array (_ BitVec 32) ValueCell!11712))

(assert (=> mapNonEmpty!38873 (= (arr!31666 (_values!6418 thiss!1427)) (store mapRest!38873 mapKey!38873 mapValue!38873))))

(declare-fun b!1044027 () Bool)

(declare-fun e!591632 () Bool)

(declare-fun e!591629 () Bool)

(assert (=> b!1044027 (= e!591632 e!591629)))

(declare-fun res!695434 () Bool)

(assert (=> b!1044027 (=> (not res!695434) (not e!591629))))

(declare-datatypes ((SeekEntryResult!9837 0))(
  ( (MissingZero!9837 (index!41719 (_ BitVec 32))) (Found!9837 (index!41720 (_ BitVec 32))) (Intermediate!9837 (undefined!10649 Bool) (index!41721 (_ BitVec 32)) (x!93221 (_ BitVec 32))) (Undefined!9837) (MissingVacant!9837 (index!41722 (_ BitVec 32))) )
))
(declare-fun lt!460393 () SeekEntryResult!9837)

(get-info :version)

(assert (=> b!1044027 (= res!695434 ((_ is Found!9837) lt!460393))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65828 (_ BitVec 32)) SeekEntryResult!9837)

(assert (=> b!1044027 (= lt!460393 (seekEntry!0 key!909 (_keys!11657 thiss!1427) (mask!30496 thiss!1427)))))

(declare-fun b!1044028 () Bool)

(declare-fun e!591628 () Bool)

(declare-fun e!591631 () Bool)

(assert (=> b!1044028 (= e!591628 (and e!591631 mapRes!38873))))

(declare-fun condMapEmpty!38873 () Bool)

(declare-fun mapDefault!38873 () ValueCell!11712)

(assert (=> b!1044028 (= condMapEmpty!38873 (= (arr!31666 (_values!6418 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11712)) mapDefault!38873)))))

(declare-fun tp_is_empty!24831 () Bool)

(declare-fun e!591630 () Bool)

(declare-fun array_inv!24459 (array!65828) Bool)

(declare-fun array_inv!24460 (array!65830) Bool)

(assert (=> b!1044029 (= e!591630 (and tp!74577 tp_is_empty!24831 (array_inv!24459 (_keys!11657 thiss!1427)) (array_inv!24460 (_values!6418 thiss!1427)) e!591628))))

(declare-fun b!1044030 () Bool)

(declare-fun e!591633 () Bool)

(declare-datatypes ((Unit!34087 0))(
  ( (Unit!34088) )
))
(declare-datatypes ((tuple2!15748 0))(
  ( (tuple2!15749 (_1!7885 Unit!34087) (_2!7885 LongMapFixedSize!6018)) )
))
(declare-fun lt!460394 () tuple2!15748)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1044030 (= e!591633 (validMask!0 (mask!30496 (_2!7885 lt!460394))))))

(declare-fun b!1044031 () Bool)

(assert (=> b!1044031 (= e!591627 tp_is_empty!24831)))

(declare-fun mapIsEmpty!38873 () Bool)

(assert (=> mapIsEmpty!38873 mapRes!38873))

(declare-fun b!1044032 () Bool)

(assert (=> b!1044032 (= e!591631 tp_is_empty!24831)))

(declare-fun res!695435 () Bool)

(assert (=> start!91734 (=> (not res!695435) (not e!591632))))

(declare-fun valid!2258 (LongMapFixedSize!6018) Bool)

(assert (=> start!91734 (= res!695435 (valid!2258 thiss!1427))))

(assert (=> start!91734 e!591632))

(assert (=> start!91734 e!591630))

(assert (=> start!91734 true))

(declare-fun b!1044033 () Bool)

(assert (=> b!1044033 (= e!591629 (not e!591633))))

(declare-fun res!695433 () Bool)

(assert (=> b!1044033 (=> res!695433 e!591633)))

(declare-datatypes ((tuple2!15750 0))(
  ( (tuple2!15751 (_1!7886 (_ BitVec 64)) (_2!7886 V!37981)) )
))
(declare-datatypes ((List!22000 0))(
  ( (Nil!21997) (Cons!21996 (h!23204 tuple2!15750) (t!31230 List!22000)) )
))
(declare-datatypes ((ListLongMap!13775 0))(
  ( (ListLongMap!13776 (toList!6903 List!22000)) )
))
(declare-fun contains!6067 (ListLongMap!13775 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3951 (array!65828 array!65830 (_ BitVec 32) (_ BitVec 32) V!37981 V!37981 (_ BitVec 32) Int) ListLongMap!13775)

(assert (=> b!1044033 (= res!695433 (not (contains!6067 (getCurrentListMap!3951 (_keys!11657 (_2!7885 lt!460394)) (_values!6418 (_2!7885 lt!460394)) (mask!30496 (_2!7885 lt!460394)) (extraKeys!6123 (_2!7885 lt!460394)) (zeroValue!6229 (_2!7885 lt!460394)) (minValue!6229 (_2!7885 lt!460394)) #b00000000000000000000000000000000 (defaultEntry!6395 (_2!7885 lt!460394))) key!909)))))

(declare-fun lt!460392 () array!65828)

(declare-fun lt!460390 () array!65830)

(declare-fun Unit!34089 () Unit!34087)

(declare-fun Unit!34090 () Unit!34087)

(assert (=> b!1044033 (= lt!460394 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3064 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15749 Unit!34089 (LongMapFixedSize!6019 (defaultEntry!6395 thiss!1427) (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) (bvsub (_size!3064 thiss!1427) #b00000000000000000000000000000001) lt!460392 lt!460390 (bvadd #b00000000000000000000000000000001 (_vacant!3064 thiss!1427)))) (tuple2!15749 Unit!34090 (LongMapFixedSize!6019 (defaultEntry!6395 thiss!1427) (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) (bvsub (_size!3064 thiss!1427) #b00000000000000000000000000000001) lt!460392 lt!460390 (_vacant!3064 thiss!1427)))))))

(declare-fun -!530 (ListLongMap!13775 (_ BitVec 64)) ListLongMap!13775)

(assert (=> b!1044033 (= (-!530 (getCurrentListMap!3951 (_keys!11657 thiss!1427) (_values!6418 thiss!1427) (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6395 thiss!1427)) key!909) (getCurrentListMap!3951 lt!460392 lt!460390 (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6395 thiss!1427)))))

(declare-fun dynLambda!2000 (Int (_ BitVec 64)) V!37981)

(assert (=> b!1044033 (= lt!460390 (array!65831 (store (arr!31666 (_values!6418 thiss!1427)) (index!41720 lt!460393) (ValueCellFull!11712 (dynLambda!2000 (defaultEntry!6395 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32201 (_values!6418 thiss!1427))))))

(declare-fun lt!460395 () Unit!34087)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!51 (array!65828 array!65830 (_ BitVec 32) (_ BitVec 32) V!37981 V!37981 (_ BitVec 32) (_ BitVec 64) Int) Unit!34087)

(assert (=> b!1044033 (= lt!460395 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!51 (_keys!11657 thiss!1427) (_values!6418 thiss!1427) (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) (index!41720 lt!460393) key!909 (defaultEntry!6395 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65828 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1044033 (not (arrayContainsKey!0 lt!460392 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!460396 () Unit!34087)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65828 (_ BitVec 32) (_ BitVec 64)) Unit!34087)

(assert (=> b!1044033 (= lt!460396 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11657 thiss!1427) (index!41720 lt!460393) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65828 (_ BitVec 32)) Bool)

(assert (=> b!1044033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460392 (mask!30496 thiss!1427))))

(declare-fun lt!460389 () Unit!34087)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65828 (_ BitVec 32) (_ BitVec 32)) Unit!34087)

(assert (=> b!1044033 (= lt!460389 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11657 thiss!1427) (index!41720 lt!460393) (mask!30496 thiss!1427)))))

(declare-datatypes ((List!22001 0))(
  ( (Nil!21998) (Cons!21997 (h!23205 (_ BitVec 64)) (t!31231 List!22001)) )
))
(declare-fun arrayNoDuplicates!0 (array!65828 (_ BitVec 32) List!22001) Bool)

(assert (=> b!1044033 (arrayNoDuplicates!0 lt!460392 #b00000000000000000000000000000000 Nil!21998)))

(declare-fun lt!460391 () Unit!34087)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65828 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22001) Unit!34087)

(assert (=> b!1044033 (= lt!460391 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11657 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41720 lt!460393) #b00000000000000000000000000000000 Nil!21998))))

(declare-fun arrayCountValidKeys!0 (array!65828 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1044033 (= (arrayCountValidKeys!0 lt!460392 #b00000000000000000000000000000000 (size!32200 (_keys!11657 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11657 thiss!1427) #b00000000000000000000000000000000 (size!32200 (_keys!11657 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1044033 (= lt!460392 (array!65829 (store (arr!31665 (_keys!11657 thiss!1427)) (index!41720 lt!460393) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32200 (_keys!11657 thiss!1427))))))

(declare-fun lt!460397 () Unit!34087)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65828 (_ BitVec 32) (_ BitVec 64)) Unit!34087)

(assert (=> b!1044033 (= lt!460397 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11657 thiss!1427) (index!41720 lt!460393) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044034 () Bool)

(declare-fun res!695436 () Bool)

(assert (=> b!1044034 (=> (not res!695436) (not e!591632))))

(assert (=> b!1044034 (= res!695436 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!91734 res!695435) b!1044034))

(assert (= (and b!1044034 res!695436) b!1044027))

(assert (= (and b!1044027 res!695434) b!1044033))

(assert (= (and b!1044033 (not res!695433)) b!1044030))

(assert (= (and b!1044028 condMapEmpty!38873) mapIsEmpty!38873))

(assert (= (and b!1044028 (not condMapEmpty!38873)) mapNonEmpty!38873))

(assert (= (and mapNonEmpty!38873 ((_ is ValueCellFull!11712) mapValue!38873)) b!1044031))

(assert (= (and b!1044028 ((_ is ValueCellFull!11712) mapDefault!38873)) b!1044032))

(assert (= b!1044029 b!1044028))

(assert (= start!91734 b!1044029))

(declare-fun b_lambda!16199 () Bool)

(assert (=> (not b_lambda!16199) (not b!1044033)))

(declare-fun t!31229 () Bool)

(declare-fun tb!7051 () Bool)

(assert (=> (and b!1044029 (= (defaultEntry!6395 thiss!1427) (defaultEntry!6395 thiss!1427)) t!31229) tb!7051))

(declare-fun result!14527 () Bool)

(assert (=> tb!7051 (= result!14527 tp_is_empty!24831)))

(assert (=> b!1044033 t!31229))

(declare-fun b_and!33671 () Bool)

(assert (= b_and!33669 (and (=> t!31229 result!14527) b_and!33671)))

(declare-fun m!963359 () Bool)

(assert (=> b!1044030 m!963359))

(declare-fun m!963361 () Bool)

(assert (=> start!91734 m!963361))

(declare-fun m!963363 () Bool)

(assert (=> b!1044027 m!963363))

(declare-fun m!963365 () Bool)

(assert (=> b!1044033 m!963365))

(declare-fun m!963367 () Bool)

(assert (=> b!1044033 m!963367))

(declare-fun m!963369 () Bool)

(assert (=> b!1044033 m!963369))

(declare-fun m!963371 () Bool)

(assert (=> b!1044033 m!963371))

(declare-fun m!963373 () Bool)

(assert (=> b!1044033 m!963373))

(declare-fun m!963375 () Bool)

(assert (=> b!1044033 m!963375))

(declare-fun m!963377 () Bool)

(assert (=> b!1044033 m!963377))

(declare-fun m!963379 () Bool)

(assert (=> b!1044033 m!963379))

(declare-fun m!963381 () Bool)

(assert (=> b!1044033 m!963381))

(declare-fun m!963383 () Bool)

(assert (=> b!1044033 m!963383))

(declare-fun m!963385 () Bool)

(assert (=> b!1044033 m!963385))

(assert (=> b!1044033 m!963365))

(declare-fun m!963387 () Bool)

(assert (=> b!1044033 m!963387))

(assert (=> b!1044033 m!963377))

(declare-fun m!963389 () Bool)

(assert (=> b!1044033 m!963389))

(declare-fun m!963391 () Bool)

(assert (=> b!1044033 m!963391))

(declare-fun m!963393 () Bool)

(assert (=> b!1044033 m!963393))

(declare-fun m!963395 () Bool)

(assert (=> b!1044033 m!963395))

(declare-fun m!963397 () Bool)

(assert (=> b!1044033 m!963397))

(declare-fun m!963399 () Bool)

(assert (=> b!1044033 m!963399))

(declare-fun m!963401 () Bool)

(assert (=> b!1044029 m!963401))

(declare-fun m!963403 () Bool)

(assert (=> b!1044029 m!963403))

(declare-fun m!963405 () Bool)

(assert (=> mapNonEmpty!38873 m!963405))

(check-sat (not b!1044029) (not b!1044030) b_and!33671 (not start!91734) (not b!1044027) (not b_next!21111) (not b_lambda!16199) tp_is_empty!24831 (not b!1044033) (not mapNonEmpty!38873))
(check-sat b_and!33671 (not b_next!21111))
(get-model)

(declare-fun b_lambda!16203 () Bool)

(assert (= b_lambda!16199 (or (and b!1044029 b_free!21111) b_lambda!16203)))

(check-sat (not b!1044029) (not b_lambda!16203) (not b!1044030) b_and!33671 (not start!91734) (not b!1044027) (not b_next!21111) tp_is_empty!24831 (not b!1044033) (not mapNonEmpty!38873))
(check-sat b_and!33671 (not b_next!21111))
(get-model)

(declare-fun d!126333 () Bool)

(assert (=> d!126333 (= (validMask!0 (mask!30496 (_2!7885 lt!460394))) (and (or (= (mask!30496 (_2!7885 lt!460394)) #b00000000000000000000000000000111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000000000000000000000001111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000000000000000000000011111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000000000000000000000111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000000000000000000001111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000000000000000000011111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000000000000000000111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000000000000000001111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000000000000000011111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000000000000000111111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000000000000001111111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000000000000011111111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000000000000111111111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000000000001111111111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000000000011111111111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000000000111111111111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000000001111111111111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000000011111111111111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000000111111111111111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000001111111111111111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000011111111111111111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000000111111111111111111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000001111111111111111111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000011111111111111111111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00000111111111111111111111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00001111111111111111111111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00011111111111111111111111111111) (= (mask!30496 (_2!7885 lt!460394)) #b00111111111111111111111111111111)) (bvsle (mask!30496 (_2!7885 lt!460394)) #b00111111111111111111111111111111)))))

(assert (=> b!1044030 d!126333))

(declare-fun d!126335 () Bool)

(assert (=> d!126335 (= (array_inv!24459 (_keys!11657 thiss!1427)) (bvsge (size!32200 (_keys!11657 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044029 d!126335))

(declare-fun d!126337 () Bool)

(assert (=> d!126337 (= (array_inv!24460 (_values!6418 thiss!1427)) (bvsge (size!32201 (_values!6418 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044029 d!126337))

(declare-fun d!126339 () Bool)

(declare-fun res!695453 () Bool)

(declare-fun e!591662 () Bool)

(assert (=> d!126339 (=> res!695453 e!591662)))

(assert (=> d!126339 (= res!695453 (= (select (arr!31665 lt!460392) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126339 (= (arrayContainsKey!0 lt!460392 key!909 #b00000000000000000000000000000000) e!591662)))

(declare-fun b!1044067 () Bool)

(declare-fun e!591663 () Bool)

(assert (=> b!1044067 (= e!591662 e!591663)))

(declare-fun res!695454 () Bool)

(assert (=> b!1044067 (=> (not res!695454) (not e!591663))))

(assert (=> b!1044067 (= res!695454 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32200 lt!460392)))))

(declare-fun b!1044068 () Bool)

(assert (=> b!1044068 (= e!591663 (arrayContainsKey!0 lt!460392 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126339 (not res!695453)) b!1044067))

(assert (= (and b!1044067 res!695454) b!1044068))

(declare-fun m!963455 () Bool)

(assert (=> d!126339 m!963455))

(declare-fun m!963457 () Bool)

(assert (=> b!1044068 m!963457))

(assert (=> b!1044033 d!126339))

(declare-fun b!1044077 () Bool)

(declare-fun res!695464 () Bool)

(declare-fun e!591668 () Bool)

(assert (=> b!1044077 (=> (not res!695464) (not e!591668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1044077 (= res!695464 (validKeyInArray!0 (select (arr!31665 (_keys!11657 thiss!1427)) (index!41720 lt!460393))))))

(declare-fun d!126341 () Bool)

(declare-fun e!591669 () Bool)

(assert (=> d!126341 e!591669))

(declare-fun res!695466 () Bool)

(assert (=> d!126341 (=> (not res!695466) (not e!591669))))

(assert (=> d!126341 (= res!695466 (and (bvsge (index!41720 lt!460393) #b00000000000000000000000000000000) (bvslt (index!41720 lt!460393) (size!32200 (_keys!11657 thiss!1427)))))))

(declare-fun lt!460427 () Unit!34087)

(declare-fun choose!82 (array!65828 (_ BitVec 32) (_ BitVec 64)) Unit!34087)

(assert (=> d!126341 (= lt!460427 (choose!82 (_keys!11657 thiss!1427) (index!41720 lt!460393) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126341 e!591668))

(declare-fun res!695463 () Bool)

(assert (=> d!126341 (=> (not res!695463) (not e!591668))))

(assert (=> d!126341 (= res!695463 (and (bvsge (index!41720 lt!460393) #b00000000000000000000000000000000) (bvslt (index!41720 lt!460393) (size!32200 (_keys!11657 thiss!1427)))))))

(assert (=> d!126341 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11657 thiss!1427) (index!41720 lt!460393) #b1000000000000000000000000000000000000000000000000000000000000000) lt!460427)))

(declare-fun b!1044079 () Bool)

(assert (=> b!1044079 (= e!591668 (bvslt (size!32200 (_keys!11657 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1044080 () Bool)

(assert (=> b!1044080 (= e!591669 (= (arrayCountValidKeys!0 (array!65829 (store (arr!31665 (_keys!11657 thiss!1427)) (index!41720 lt!460393) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32200 (_keys!11657 thiss!1427))) #b00000000000000000000000000000000 (size!32200 (_keys!11657 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11657 thiss!1427) #b00000000000000000000000000000000 (size!32200 (_keys!11657 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1044078 () Bool)

(declare-fun res!695465 () Bool)

(assert (=> b!1044078 (=> (not res!695465) (not e!591668))))

(assert (=> b!1044078 (= res!695465 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!126341 res!695463) b!1044077))

(assert (= (and b!1044077 res!695464) b!1044078))

(assert (= (and b!1044078 res!695465) b!1044079))

(assert (= (and d!126341 res!695466) b!1044080))

(declare-fun m!963459 () Bool)

(assert (=> b!1044077 m!963459))

(assert (=> b!1044077 m!963459))

(declare-fun m!963461 () Bool)

(assert (=> b!1044077 m!963461))

(declare-fun m!963463 () Bool)

(assert (=> d!126341 m!963463))

(assert (=> b!1044080 m!963367))

(declare-fun m!963465 () Bool)

(assert (=> b!1044080 m!963465))

(assert (=> b!1044080 m!963369))

(declare-fun m!963467 () Bool)

(assert (=> b!1044078 m!963467))

(assert (=> b!1044033 d!126341))

(declare-fun d!126343 () Bool)

(declare-fun e!591672 () Bool)

(assert (=> d!126343 e!591672))

(declare-fun res!695469 () Bool)

(assert (=> d!126343 (=> (not res!695469) (not e!591672))))

(assert (=> d!126343 (= res!695469 (and (bvsge (index!41720 lt!460393) #b00000000000000000000000000000000) (bvslt (index!41720 lt!460393) (size!32200 (_keys!11657 thiss!1427)))))))

(declare-fun lt!460430 () Unit!34087)

(declare-fun choose!25 (array!65828 (_ BitVec 32) (_ BitVec 32)) Unit!34087)

(assert (=> d!126343 (= lt!460430 (choose!25 (_keys!11657 thiss!1427) (index!41720 lt!460393) (mask!30496 thiss!1427)))))

(assert (=> d!126343 (validMask!0 (mask!30496 thiss!1427))))

(assert (=> d!126343 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11657 thiss!1427) (index!41720 lt!460393) (mask!30496 thiss!1427)) lt!460430)))

(declare-fun b!1044083 () Bool)

(assert (=> b!1044083 (= e!591672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65829 (store (arr!31665 (_keys!11657 thiss!1427)) (index!41720 lt!460393) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32200 (_keys!11657 thiss!1427))) (mask!30496 thiss!1427)))))

(assert (= (and d!126343 res!695469) b!1044083))

(declare-fun m!963469 () Bool)

(assert (=> d!126343 m!963469))

(declare-fun m!963471 () Bool)

(assert (=> d!126343 m!963471))

(assert (=> b!1044083 m!963367))

(declare-fun m!963473 () Bool)

(assert (=> b!1044083 m!963473))

(assert (=> b!1044033 d!126343))

(declare-fun b!1044126 () Bool)

(declare-fun e!591710 () Bool)

(declare-fun e!591704 () Bool)

(assert (=> b!1044126 (= e!591710 e!591704)))

(declare-fun c!106039 () Bool)

(assert (=> b!1044126 (= c!106039 (not (= (bvand (extraKeys!6123 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44310 () Bool)

(declare-fun call!44314 () Bool)

(declare-fun lt!460489 () ListLongMap!13775)

(assert (=> bm!44310 (= call!44314 (contains!6067 lt!460489 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!44316 () ListLongMap!13775)

(declare-fun call!44315 () ListLongMap!13775)

(declare-fun bm!44311 () Bool)

(declare-fun c!106044 () Bool)

(declare-fun call!44318 () ListLongMap!13775)

(declare-fun call!44313 () ListLongMap!13775)

(declare-fun c!106042 () Bool)

(declare-fun +!3108 (ListLongMap!13775 tuple2!15750) ListLongMap!13775)

(assert (=> bm!44311 (= call!44315 (+!3108 (ite c!106042 call!44313 (ite c!106044 call!44318 call!44316)) (ite (or c!106042 c!106044) (tuple2!15751 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6229 thiss!1427)) (tuple2!15751 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6229 thiss!1427)))))))

(declare-fun b!1044127 () Bool)

(declare-fun res!695489 () Bool)

(assert (=> b!1044127 (=> (not res!695489) (not e!591710))))

(declare-fun e!591702 () Bool)

(assert (=> b!1044127 (= res!695489 e!591702)))

(declare-fun res!695493 () Bool)

(assert (=> b!1044127 (=> res!695493 e!591702)))

(declare-fun e!591699 () Bool)

(assert (=> b!1044127 (= res!695493 (not e!591699))))

(declare-fun res!695490 () Bool)

(assert (=> b!1044127 (=> (not res!695490) (not e!591699))))

(assert (=> b!1044127 (= res!695490 (bvslt #b00000000000000000000000000000000 (size!32200 (_keys!11657 thiss!1427))))))

(declare-fun b!1044128 () Bool)

(declare-fun e!591701 () ListLongMap!13775)

(declare-fun e!591705 () ListLongMap!13775)

(assert (=> b!1044128 (= e!591701 e!591705)))

(assert (=> b!1044128 (= c!106044 (and (not (= (bvand (extraKeys!6123 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6123 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44312 () Bool)

(assert (=> bm!44312 (= call!44318 call!44313)))

(declare-fun b!1044129 () Bool)

(declare-fun call!44317 () ListLongMap!13775)

(assert (=> b!1044129 (= e!591705 call!44317)))

(declare-fun bm!44313 () Bool)

(assert (=> bm!44313 (= call!44316 call!44318)))

(declare-fun b!1044130 () Bool)

(declare-fun e!591706 () Bool)

(declare-fun apply!910 (ListLongMap!13775 (_ BitVec 64)) V!37981)

(declare-fun get!16547 (ValueCell!11712 V!37981) V!37981)

(assert (=> b!1044130 (= e!591706 (= (apply!910 lt!460489 (select (arr!31665 (_keys!11657 thiss!1427)) #b00000000000000000000000000000000)) (get!16547 (select (arr!31666 (_values!6418 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2000 (defaultEntry!6395 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044130 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32201 (_values!6418 thiss!1427))))))

(assert (=> b!1044130 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32200 (_keys!11657 thiss!1427))))))

(declare-fun b!1044131 () Bool)

(assert (=> b!1044131 (= e!591702 e!591706)))

(declare-fun res!695494 () Bool)

(assert (=> b!1044131 (=> (not res!695494) (not e!591706))))

(assert (=> b!1044131 (= res!695494 (contains!6067 lt!460489 (select (arr!31665 (_keys!11657 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1044131 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32200 (_keys!11657 thiss!1427))))))

(declare-fun b!1044132 () Bool)

(assert (=> b!1044132 (= e!591699 (validKeyInArray!0 (select (arr!31665 (_keys!11657 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1044133 () Bool)

(declare-fun c!106043 () Bool)

(assert (=> b!1044133 (= c!106043 (and (not (= (bvand (extraKeys!6123 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6123 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!591708 () ListLongMap!13775)

(assert (=> b!1044133 (= e!591705 e!591708)))

(declare-fun b!1044134 () Bool)

(declare-fun e!591707 () Unit!34087)

(declare-fun Unit!34091 () Unit!34087)

(assert (=> b!1044134 (= e!591707 Unit!34091)))

(declare-fun d!126345 () Bool)

(assert (=> d!126345 e!591710))

(declare-fun res!695492 () Bool)

(assert (=> d!126345 (=> (not res!695492) (not e!591710))))

(assert (=> d!126345 (= res!695492 (or (bvsge #b00000000000000000000000000000000 (size!32200 (_keys!11657 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32200 (_keys!11657 thiss!1427))))))))

(declare-fun lt!460493 () ListLongMap!13775)

(assert (=> d!126345 (= lt!460489 lt!460493)))

(declare-fun lt!460492 () Unit!34087)

(assert (=> d!126345 (= lt!460492 e!591707)))

(declare-fun c!106041 () Bool)

(declare-fun e!591709 () Bool)

(assert (=> d!126345 (= c!106041 e!591709)))

(declare-fun res!695491 () Bool)

(assert (=> d!126345 (=> (not res!695491) (not e!591709))))

(assert (=> d!126345 (= res!695491 (bvslt #b00000000000000000000000000000000 (size!32200 (_keys!11657 thiss!1427))))))

(assert (=> d!126345 (= lt!460493 e!591701)))

(assert (=> d!126345 (= c!106042 (and (not (= (bvand (extraKeys!6123 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6123 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126345 (validMask!0 (mask!30496 thiss!1427))))

(assert (=> d!126345 (= (getCurrentListMap!3951 (_keys!11657 thiss!1427) (_values!6418 thiss!1427) (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6395 thiss!1427)) lt!460489)))

(declare-fun b!1044135 () Bool)

(declare-fun e!591703 () Bool)

(declare-fun call!44319 () Bool)

(assert (=> b!1044135 (= e!591703 (not call!44319))))

(declare-fun b!1044136 () Bool)

(declare-fun res!695496 () Bool)

(assert (=> b!1044136 (=> (not res!695496) (not e!591710))))

(assert (=> b!1044136 (= res!695496 e!591703)))

(declare-fun c!106040 () Bool)

(assert (=> b!1044136 (= c!106040 (not (= (bvand (extraKeys!6123 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!44314 () Bool)

(assert (=> bm!44314 (= call!44319 (contains!6067 lt!460489 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044137 () Bool)

(declare-fun e!591700 () Bool)

(assert (=> b!1044137 (= e!591700 (= (apply!910 lt!460489 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6229 thiss!1427)))))

(declare-fun b!1044138 () Bool)

(assert (=> b!1044138 (= e!591708 call!44316)))

(declare-fun b!1044139 () Bool)

(assert (=> b!1044139 (= e!591704 e!591700)))

(declare-fun res!695488 () Bool)

(assert (=> b!1044139 (= res!695488 call!44314)))

(assert (=> b!1044139 (=> (not res!695488) (not e!591700))))

(declare-fun bm!44315 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3524 (array!65828 array!65830 (_ BitVec 32) (_ BitVec 32) V!37981 V!37981 (_ BitVec 32) Int) ListLongMap!13775)

(assert (=> bm!44315 (= call!44313 (getCurrentListMapNoExtraKeys!3524 (_keys!11657 thiss!1427) (_values!6418 thiss!1427) (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6395 thiss!1427)))))

(declare-fun b!1044140 () Bool)

(declare-fun lt!460480 () Unit!34087)

(assert (=> b!1044140 (= e!591707 lt!460480)))

(declare-fun lt!460496 () ListLongMap!13775)

(assert (=> b!1044140 (= lt!460496 (getCurrentListMapNoExtraKeys!3524 (_keys!11657 thiss!1427) (_values!6418 thiss!1427) (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6395 thiss!1427)))))

(declare-fun lt!460482 () (_ BitVec 64))

(assert (=> b!1044140 (= lt!460482 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460488 () (_ BitVec 64))

(assert (=> b!1044140 (= lt!460488 (select (arr!31665 (_keys!11657 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460494 () Unit!34087)

(declare-fun addStillContains!629 (ListLongMap!13775 (_ BitVec 64) V!37981 (_ BitVec 64)) Unit!34087)

(assert (=> b!1044140 (= lt!460494 (addStillContains!629 lt!460496 lt!460482 (zeroValue!6229 thiss!1427) lt!460488))))

(assert (=> b!1044140 (contains!6067 (+!3108 lt!460496 (tuple2!15751 lt!460482 (zeroValue!6229 thiss!1427))) lt!460488)))

(declare-fun lt!460486 () Unit!34087)

(assert (=> b!1044140 (= lt!460486 lt!460494)))

(declare-fun lt!460476 () ListLongMap!13775)

(assert (=> b!1044140 (= lt!460476 (getCurrentListMapNoExtraKeys!3524 (_keys!11657 thiss!1427) (_values!6418 thiss!1427) (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6395 thiss!1427)))))

(declare-fun lt!460485 () (_ BitVec 64))

(assert (=> b!1044140 (= lt!460485 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460479 () (_ BitVec 64))

(assert (=> b!1044140 (= lt!460479 (select (arr!31665 (_keys!11657 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460490 () Unit!34087)

(declare-fun addApplyDifferent!489 (ListLongMap!13775 (_ BitVec 64) V!37981 (_ BitVec 64)) Unit!34087)

(assert (=> b!1044140 (= lt!460490 (addApplyDifferent!489 lt!460476 lt!460485 (minValue!6229 thiss!1427) lt!460479))))

(assert (=> b!1044140 (= (apply!910 (+!3108 lt!460476 (tuple2!15751 lt!460485 (minValue!6229 thiss!1427))) lt!460479) (apply!910 lt!460476 lt!460479))))

(declare-fun lt!460495 () Unit!34087)

(assert (=> b!1044140 (= lt!460495 lt!460490)))

(declare-fun lt!460481 () ListLongMap!13775)

(assert (=> b!1044140 (= lt!460481 (getCurrentListMapNoExtraKeys!3524 (_keys!11657 thiss!1427) (_values!6418 thiss!1427) (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6395 thiss!1427)))))

(declare-fun lt!460484 () (_ BitVec 64))

(assert (=> b!1044140 (= lt!460484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460477 () (_ BitVec 64))

(assert (=> b!1044140 (= lt!460477 (select (arr!31665 (_keys!11657 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460491 () Unit!34087)

(assert (=> b!1044140 (= lt!460491 (addApplyDifferent!489 lt!460481 lt!460484 (zeroValue!6229 thiss!1427) lt!460477))))

(assert (=> b!1044140 (= (apply!910 (+!3108 lt!460481 (tuple2!15751 lt!460484 (zeroValue!6229 thiss!1427))) lt!460477) (apply!910 lt!460481 lt!460477))))

(declare-fun lt!460475 () Unit!34087)

(assert (=> b!1044140 (= lt!460475 lt!460491)))

(declare-fun lt!460483 () ListLongMap!13775)

(assert (=> b!1044140 (= lt!460483 (getCurrentListMapNoExtraKeys!3524 (_keys!11657 thiss!1427) (_values!6418 thiss!1427) (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6395 thiss!1427)))))

(declare-fun lt!460487 () (_ BitVec 64))

(assert (=> b!1044140 (= lt!460487 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460478 () (_ BitVec 64))

(assert (=> b!1044140 (= lt!460478 (select (arr!31665 (_keys!11657 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044140 (= lt!460480 (addApplyDifferent!489 lt!460483 lt!460487 (minValue!6229 thiss!1427) lt!460478))))

(assert (=> b!1044140 (= (apply!910 (+!3108 lt!460483 (tuple2!15751 lt!460487 (minValue!6229 thiss!1427))) lt!460478) (apply!910 lt!460483 lt!460478))))

(declare-fun b!1044141 () Bool)

(assert (=> b!1044141 (= e!591708 call!44317)))

(declare-fun bm!44316 () Bool)

(assert (=> bm!44316 (= call!44317 call!44315)))

(declare-fun b!1044142 () Bool)

(assert (=> b!1044142 (= e!591704 (not call!44314))))

(declare-fun b!1044143 () Bool)

(declare-fun e!591711 () Bool)

(assert (=> b!1044143 (= e!591703 e!591711)))

(declare-fun res!695495 () Bool)

(assert (=> b!1044143 (= res!695495 call!44319)))

(assert (=> b!1044143 (=> (not res!695495) (not e!591711))))

(declare-fun b!1044144 () Bool)

(assert (=> b!1044144 (= e!591709 (validKeyInArray!0 (select (arr!31665 (_keys!11657 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1044145 () Bool)

(assert (=> b!1044145 (= e!591701 (+!3108 call!44315 (tuple2!15751 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6229 thiss!1427))))))

(declare-fun b!1044146 () Bool)

(assert (=> b!1044146 (= e!591711 (= (apply!910 lt!460489 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6229 thiss!1427)))))

(assert (= (and d!126345 c!106042) b!1044145))

(assert (= (and d!126345 (not c!106042)) b!1044128))

(assert (= (and b!1044128 c!106044) b!1044129))

(assert (= (and b!1044128 (not c!106044)) b!1044133))

(assert (= (and b!1044133 c!106043) b!1044141))

(assert (= (and b!1044133 (not c!106043)) b!1044138))

(assert (= (or b!1044141 b!1044138) bm!44313))

(assert (= (or b!1044129 bm!44313) bm!44312))

(assert (= (or b!1044129 b!1044141) bm!44316))

(assert (= (or b!1044145 bm!44312) bm!44315))

(assert (= (or b!1044145 bm!44316) bm!44311))

(assert (= (and d!126345 res!695491) b!1044144))

(assert (= (and d!126345 c!106041) b!1044140))

(assert (= (and d!126345 (not c!106041)) b!1044134))

(assert (= (and d!126345 res!695492) b!1044127))

(assert (= (and b!1044127 res!695490) b!1044132))

(assert (= (and b!1044127 (not res!695493)) b!1044131))

(assert (= (and b!1044131 res!695494) b!1044130))

(assert (= (and b!1044127 res!695489) b!1044136))

(assert (= (and b!1044136 c!106040) b!1044143))

(assert (= (and b!1044136 (not c!106040)) b!1044135))

(assert (= (and b!1044143 res!695495) b!1044146))

(assert (= (or b!1044143 b!1044135) bm!44314))

(assert (= (and b!1044136 res!695496) b!1044126))

(assert (= (and b!1044126 c!106039) b!1044139))

(assert (= (and b!1044126 (not c!106039)) b!1044142))

(assert (= (and b!1044139 res!695488) b!1044137))

(assert (= (or b!1044139 b!1044142) bm!44310))

(declare-fun b_lambda!16205 () Bool)

(assert (=> (not b_lambda!16205) (not b!1044130)))

(assert (=> b!1044130 t!31229))

(declare-fun b_and!33677 () Bool)

(assert (= b_and!33671 (and (=> t!31229 result!14527) b_and!33677)))

(assert (=> d!126345 m!963471))

(declare-fun m!963475 () Bool)

(assert (=> bm!44311 m!963475))

(declare-fun m!963477 () Bool)

(assert (=> b!1044137 m!963477))

(declare-fun m!963479 () Bool)

(assert (=> b!1044140 m!963479))

(declare-fun m!963481 () Bool)

(assert (=> b!1044140 m!963481))

(declare-fun m!963483 () Bool)

(assert (=> b!1044140 m!963483))

(declare-fun m!963485 () Bool)

(assert (=> b!1044140 m!963485))

(declare-fun m!963487 () Bool)

(assert (=> b!1044140 m!963487))

(declare-fun m!963489 () Bool)

(assert (=> b!1044140 m!963489))

(declare-fun m!963491 () Bool)

(assert (=> b!1044140 m!963491))

(assert (=> b!1044140 m!963479))

(declare-fun m!963493 () Bool)

(assert (=> b!1044140 m!963493))

(declare-fun m!963495 () Bool)

(assert (=> b!1044140 m!963495))

(assert (=> b!1044140 m!963485))

(declare-fun m!963497 () Bool)

(assert (=> b!1044140 m!963497))

(declare-fun m!963499 () Bool)

(assert (=> b!1044140 m!963499))

(declare-fun m!963501 () Bool)

(assert (=> b!1044140 m!963501))

(declare-fun m!963503 () Bool)

(assert (=> b!1044140 m!963503))

(assert (=> b!1044140 m!963499))

(declare-fun m!963505 () Bool)

(assert (=> b!1044140 m!963505))

(assert (=> b!1044140 m!963495))

(declare-fun m!963507 () Bool)

(assert (=> b!1044140 m!963507))

(declare-fun m!963509 () Bool)

(assert (=> b!1044140 m!963509))

(declare-fun m!963511 () Bool)

(assert (=> b!1044140 m!963511))

(declare-fun m!963513 () Bool)

(assert (=> b!1044130 m!963513))

(assert (=> b!1044130 m!963399))

(assert (=> b!1044130 m!963513))

(assert (=> b!1044130 m!963399))

(declare-fun m!963515 () Bool)

(assert (=> b!1044130 m!963515))

(assert (=> b!1044130 m!963509))

(assert (=> b!1044130 m!963509))

(declare-fun m!963517 () Bool)

(assert (=> b!1044130 m!963517))

(assert (=> b!1044131 m!963509))

(assert (=> b!1044131 m!963509))

(declare-fun m!963519 () Bool)

(assert (=> b!1044131 m!963519))

(declare-fun m!963521 () Bool)

(assert (=> bm!44310 m!963521))

(declare-fun m!963523 () Bool)

(assert (=> b!1044146 m!963523))

(assert (=> b!1044132 m!963509))

(assert (=> b!1044132 m!963509))

(declare-fun m!963525 () Bool)

(assert (=> b!1044132 m!963525))

(assert (=> bm!44315 m!963501))

(assert (=> b!1044144 m!963509))

(assert (=> b!1044144 m!963509))

(assert (=> b!1044144 m!963525))

(declare-fun m!963527 () Bool)

(assert (=> bm!44314 m!963527))

(declare-fun m!963529 () Bool)

(assert (=> b!1044145 m!963529))

(assert (=> b!1044033 d!126345))

(declare-fun b!1044147 () Bool)

(declare-fun e!591723 () Bool)

(declare-fun e!591717 () Bool)

(assert (=> b!1044147 (= e!591723 e!591717)))

(declare-fun c!106045 () Bool)

(assert (=> b!1044147 (= c!106045 (not (= (bvand (extraKeys!6123 (_2!7885 lt!460394)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44317 () Bool)

(declare-fun call!44321 () Bool)

(declare-fun lt!460511 () ListLongMap!13775)

(assert (=> bm!44317 (= call!44321 (contains!6067 lt!460511 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!44322 () ListLongMap!13775)

(declare-fun c!106050 () Bool)

(declare-fun call!44323 () ListLongMap!13775)

(declare-fun bm!44318 () Bool)

(declare-fun c!106048 () Bool)

(declare-fun call!44325 () ListLongMap!13775)

(declare-fun call!44320 () ListLongMap!13775)

(assert (=> bm!44318 (= call!44322 (+!3108 (ite c!106048 call!44320 (ite c!106050 call!44325 call!44323)) (ite (or c!106048 c!106050) (tuple2!15751 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6229 (_2!7885 lt!460394))) (tuple2!15751 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6229 (_2!7885 lt!460394))))))))

(declare-fun b!1044148 () Bool)

(declare-fun res!695498 () Bool)

(assert (=> b!1044148 (=> (not res!695498) (not e!591723))))

(declare-fun e!591715 () Bool)

(assert (=> b!1044148 (= res!695498 e!591715)))

(declare-fun res!695502 () Bool)

(assert (=> b!1044148 (=> res!695502 e!591715)))

(declare-fun e!591712 () Bool)

(assert (=> b!1044148 (= res!695502 (not e!591712))))

(declare-fun res!695499 () Bool)

(assert (=> b!1044148 (=> (not res!695499) (not e!591712))))

(assert (=> b!1044148 (= res!695499 (bvslt #b00000000000000000000000000000000 (size!32200 (_keys!11657 (_2!7885 lt!460394)))))))

(declare-fun b!1044149 () Bool)

(declare-fun e!591714 () ListLongMap!13775)

(declare-fun e!591718 () ListLongMap!13775)

(assert (=> b!1044149 (= e!591714 e!591718)))

(assert (=> b!1044149 (= c!106050 (and (not (= (bvand (extraKeys!6123 (_2!7885 lt!460394)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6123 (_2!7885 lt!460394)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44319 () Bool)

(assert (=> bm!44319 (= call!44325 call!44320)))

(declare-fun b!1044150 () Bool)

(declare-fun call!44324 () ListLongMap!13775)

(assert (=> b!1044150 (= e!591718 call!44324)))

(declare-fun bm!44320 () Bool)

(assert (=> bm!44320 (= call!44323 call!44325)))

(declare-fun b!1044151 () Bool)

(declare-fun e!591719 () Bool)

(assert (=> b!1044151 (= e!591719 (= (apply!910 lt!460511 (select (arr!31665 (_keys!11657 (_2!7885 lt!460394))) #b00000000000000000000000000000000)) (get!16547 (select (arr!31666 (_values!6418 (_2!7885 lt!460394))) #b00000000000000000000000000000000) (dynLambda!2000 (defaultEntry!6395 (_2!7885 lt!460394)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044151 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32201 (_values!6418 (_2!7885 lt!460394)))))))

(assert (=> b!1044151 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32200 (_keys!11657 (_2!7885 lt!460394)))))))

(declare-fun b!1044152 () Bool)

(assert (=> b!1044152 (= e!591715 e!591719)))

(declare-fun res!695503 () Bool)

(assert (=> b!1044152 (=> (not res!695503) (not e!591719))))

(assert (=> b!1044152 (= res!695503 (contains!6067 lt!460511 (select (arr!31665 (_keys!11657 (_2!7885 lt!460394))) #b00000000000000000000000000000000)))))

(assert (=> b!1044152 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32200 (_keys!11657 (_2!7885 lt!460394)))))))

(declare-fun b!1044153 () Bool)

(assert (=> b!1044153 (= e!591712 (validKeyInArray!0 (select (arr!31665 (_keys!11657 (_2!7885 lt!460394))) #b00000000000000000000000000000000)))))

(declare-fun b!1044154 () Bool)

(declare-fun c!106049 () Bool)

(assert (=> b!1044154 (= c!106049 (and (not (= (bvand (extraKeys!6123 (_2!7885 lt!460394)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6123 (_2!7885 lt!460394)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!591721 () ListLongMap!13775)

(assert (=> b!1044154 (= e!591718 e!591721)))

(declare-fun b!1044155 () Bool)

(declare-fun e!591720 () Unit!34087)

(declare-fun Unit!34092 () Unit!34087)

(assert (=> b!1044155 (= e!591720 Unit!34092)))

(declare-fun d!126347 () Bool)

(assert (=> d!126347 e!591723))

(declare-fun res!695501 () Bool)

(assert (=> d!126347 (=> (not res!695501) (not e!591723))))

(assert (=> d!126347 (= res!695501 (or (bvsge #b00000000000000000000000000000000 (size!32200 (_keys!11657 (_2!7885 lt!460394)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32200 (_keys!11657 (_2!7885 lt!460394)))))))))

(declare-fun lt!460515 () ListLongMap!13775)

(assert (=> d!126347 (= lt!460511 lt!460515)))

(declare-fun lt!460514 () Unit!34087)

(assert (=> d!126347 (= lt!460514 e!591720)))

(declare-fun c!106047 () Bool)

(declare-fun e!591722 () Bool)

(assert (=> d!126347 (= c!106047 e!591722)))

(declare-fun res!695500 () Bool)

(assert (=> d!126347 (=> (not res!695500) (not e!591722))))

(assert (=> d!126347 (= res!695500 (bvslt #b00000000000000000000000000000000 (size!32200 (_keys!11657 (_2!7885 lt!460394)))))))

(assert (=> d!126347 (= lt!460515 e!591714)))

(assert (=> d!126347 (= c!106048 (and (not (= (bvand (extraKeys!6123 (_2!7885 lt!460394)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6123 (_2!7885 lt!460394)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126347 (validMask!0 (mask!30496 (_2!7885 lt!460394)))))

(assert (=> d!126347 (= (getCurrentListMap!3951 (_keys!11657 (_2!7885 lt!460394)) (_values!6418 (_2!7885 lt!460394)) (mask!30496 (_2!7885 lt!460394)) (extraKeys!6123 (_2!7885 lt!460394)) (zeroValue!6229 (_2!7885 lt!460394)) (minValue!6229 (_2!7885 lt!460394)) #b00000000000000000000000000000000 (defaultEntry!6395 (_2!7885 lt!460394))) lt!460511)))

(declare-fun b!1044156 () Bool)

(declare-fun e!591716 () Bool)

(declare-fun call!44326 () Bool)

(assert (=> b!1044156 (= e!591716 (not call!44326))))

(declare-fun b!1044157 () Bool)

(declare-fun res!695505 () Bool)

(assert (=> b!1044157 (=> (not res!695505) (not e!591723))))

(assert (=> b!1044157 (= res!695505 e!591716)))

(declare-fun c!106046 () Bool)

(assert (=> b!1044157 (= c!106046 (not (= (bvand (extraKeys!6123 (_2!7885 lt!460394)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!44321 () Bool)

(assert (=> bm!44321 (= call!44326 (contains!6067 lt!460511 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044158 () Bool)

(declare-fun e!591713 () Bool)

(assert (=> b!1044158 (= e!591713 (= (apply!910 lt!460511 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6229 (_2!7885 lt!460394))))))

(declare-fun b!1044159 () Bool)

(assert (=> b!1044159 (= e!591721 call!44323)))

(declare-fun b!1044160 () Bool)

(assert (=> b!1044160 (= e!591717 e!591713)))

(declare-fun res!695497 () Bool)

(assert (=> b!1044160 (= res!695497 call!44321)))

(assert (=> b!1044160 (=> (not res!695497) (not e!591713))))

(declare-fun bm!44322 () Bool)

(assert (=> bm!44322 (= call!44320 (getCurrentListMapNoExtraKeys!3524 (_keys!11657 (_2!7885 lt!460394)) (_values!6418 (_2!7885 lt!460394)) (mask!30496 (_2!7885 lt!460394)) (extraKeys!6123 (_2!7885 lt!460394)) (zeroValue!6229 (_2!7885 lt!460394)) (minValue!6229 (_2!7885 lt!460394)) #b00000000000000000000000000000000 (defaultEntry!6395 (_2!7885 lt!460394))))))

(declare-fun b!1044161 () Bool)

(declare-fun lt!460502 () Unit!34087)

(assert (=> b!1044161 (= e!591720 lt!460502)))

(declare-fun lt!460518 () ListLongMap!13775)

(assert (=> b!1044161 (= lt!460518 (getCurrentListMapNoExtraKeys!3524 (_keys!11657 (_2!7885 lt!460394)) (_values!6418 (_2!7885 lt!460394)) (mask!30496 (_2!7885 lt!460394)) (extraKeys!6123 (_2!7885 lt!460394)) (zeroValue!6229 (_2!7885 lt!460394)) (minValue!6229 (_2!7885 lt!460394)) #b00000000000000000000000000000000 (defaultEntry!6395 (_2!7885 lt!460394))))))

(declare-fun lt!460504 () (_ BitVec 64))

(assert (=> b!1044161 (= lt!460504 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460510 () (_ BitVec 64))

(assert (=> b!1044161 (= lt!460510 (select (arr!31665 (_keys!11657 (_2!7885 lt!460394))) #b00000000000000000000000000000000))))

(declare-fun lt!460516 () Unit!34087)

(assert (=> b!1044161 (= lt!460516 (addStillContains!629 lt!460518 lt!460504 (zeroValue!6229 (_2!7885 lt!460394)) lt!460510))))

(assert (=> b!1044161 (contains!6067 (+!3108 lt!460518 (tuple2!15751 lt!460504 (zeroValue!6229 (_2!7885 lt!460394)))) lt!460510)))

(declare-fun lt!460508 () Unit!34087)

(assert (=> b!1044161 (= lt!460508 lt!460516)))

(declare-fun lt!460498 () ListLongMap!13775)

(assert (=> b!1044161 (= lt!460498 (getCurrentListMapNoExtraKeys!3524 (_keys!11657 (_2!7885 lt!460394)) (_values!6418 (_2!7885 lt!460394)) (mask!30496 (_2!7885 lt!460394)) (extraKeys!6123 (_2!7885 lt!460394)) (zeroValue!6229 (_2!7885 lt!460394)) (minValue!6229 (_2!7885 lt!460394)) #b00000000000000000000000000000000 (defaultEntry!6395 (_2!7885 lt!460394))))))

(declare-fun lt!460507 () (_ BitVec 64))

(assert (=> b!1044161 (= lt!460507 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460501 () (_ BitVec 64))

(assert (=> b!1044161 (= lt!460501 (select (arr!31665 (_keys!11657 (_2!7885 lt!460394))) #b00000000000000000000000000000000))))

(declare-fun lt!460512 () Unit!34087)

(assert (=> b!1044161 (= lt!460512 (addApplyDifferent!489 lt!460498 lt!460507 (minValue!6229 (_2!7885 lt!460394)) lt!460501))))

(assert (=> b!1044161 (= (apply!910 (+!3108 lt!460498 (tuple2!15751 lt!460507 (minValue!6229 (_2!7885 lt!460394)))) lt!460501) (apply!910 lt!460498 lt!460501))))

(declare-fun lt!460517 () Unit!34087)

(assert (=> b!1044161 (= lt!460517 lt!460512)))

(declare-fun lt!460503 () ListLongMap!13775)

(assert (=> b!1044161 (= lt!460503 (getCurrentListMapNoExtraKeys!3524 (_keys!11657 (_2!7885 lt!460394)) (_values!6418 (_2!7885 lt!460394)) (mask!30496 (_2!7885 lt!460394)) (extraKeys!6123 (_2!7885 lt!460394)) (zeroValue!6229 (_2!7885 lt!460394)) (minValue!6229 (_2!7885 lt!460394)) #b00000000000000000000000000000000 (defaultEntry!6395 (_2!7885 lt!460394))))))

(declare-fun lt!460506 () (_ BitVec 64))

(assert (=> b!1044161 (= lt!460506 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460499 () (_ BitVec 64))

(assert (=> b!1044161 (= lt!460499 (select (arr!31665 (_keys!11657 (_2!7885 lt!460394))) #b00000000000000000000000000000000))))

(declare-fun lt!460513 () Unit!34087)

(assert (=> b!1044161 (= lt!460513 (addApplyDifferent!489 lt!460503 lt!460506 (zeroValue!6229 (_2!7885 lt!460394)) lt!460499))))

(assert (=> b!1044161 (= (apply!910 (+!3108 lt!460503 (tuple2!15751 lt!460506 (zeroValue!6229 (_2!7885 lt!460394)))) lt!460499) (apply!910 lt!460503 lt!460499))))

(declare-fun lt!460497 () Unit!34087)

(assert (=> b!1044161 (= lt!460497 lt!460513)))

(declare-fun lt!460505 () ListLongMap!13775)

(assert (=> b!1044161 (= lt!460505 (getCurrentListMapNoExtraKeys!3524 (_keys!11657 (_2!7885 lt!460394)) (_values!6418 (_2!7885 lt!460394)) (mask!30496 (_2!7885 lt!460394)) (extraKeys!6123 (_2!7885 lt!460394)) (zeroValue!6229 (_2!7885 lt!460394)) (minValue!6229 (_2!7885 lt!460394)) #b00000000000000000000000000000000 (defaultEntry!6395 (_2!7885 lt!460394))))))

(declare-fun lt!460509 () (_ BitVec 64))

(assert (=> b!1044161 (= lt!460509 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460500 () (_ BitVec 64))

(assert (=> b!1044161 (= lt!460500 (select (arr!31665 (_keys!11657 (_2!7885 lt!460394))) #b00000000000000000000000000000000))))

(assert (=> b!1044161 (= lt!460502 (addApplyDifferent!489 lt!460505 lt!460509 (minValue!6229 (_2!7885 lt!460394)) lt!460500))))

(assert (=> b!1044161 (= (apply!910 (+!3108 lt!460505 (tuple2!15751 lt!460509 (minValue!6229 (_2!7885 lt!460394)))) lt!460500) (apply!910 lt!460505 lt!460500))))

(declare-fun b!1044162 () Bool)

(assert (=> b!1044162 (= e!591721 call!44324)))

(declare-fun bm!44323 () Bool)

(assert (=> bm!44323 (= call!44324 call!44322)))

(declare-fun b!1044163 () Bool)

(assert (=> b!1044163 (= e!591717 (not call!44321))))

(declare-fun b!1044164 () Bool)

(declare-fun e!591724 () Bool)

(assert (=> b!1044164 (= e!591716 e!591724)))

(declare-fun res!695504 () Bool)

(assert (=> b!1044164 (= res!695504 call!44326)))

(assert (=> b!1044164 (=> (not res!695504) (not e!591724))))

(declare-fun b!1044165 () Bool)

(assert (=> b!1044165 (= e!591722 (validKeyInArray!0 (select (arr!31665 (_keys!11657 (_2!7885 lt!460394))) #b00000000000000000000000000000000)))))

(declare-fun b!1044166 () Bool)

(assert (=> b!1044166 (= e!591714 (+!3108 call!44322 (tuple2!15751 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6229 (_2!7885 lt!460394)))))))

(declare-fun b!1044167 () Bool)

(assert (=> b!1044167 (= e!591724 (= (apply!910 lt!460511 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6229 (_2!7885 lt!460394))))))

(assert (= (and d!126347 c!106048) b!1044166))

(assert (= (and d!126347 (not c!106048)) b!1044149))

(assert (= (and b!1044149 c!106050) b!1044150))

(assert (= (and b!1044149 (not c!106050)) b!1044154))

(assert (= (and b!1044154 c!106049) b!1044162))

(assert (= (and b!1044154 (not c!106049)) b!1044159))

(assert (= (or b!1044162 b!1044159) bm!44320))

(assert (= (or b!1044150 bm!44320) bm!44319))

(assert (= (or b!1044150 b!1044162) bm!44323))

(assert (= (or b!1044166 bm!44319) bm!44322))

(assert (= (or b!1044166 bm!44323) bm!44318))

(assert (= (and d!126347 res!695500) b!1044165))

(assert (= (and d!126347 c!106047) b!1044161))

(assert (= (and d!126347 (not c!106047)) b!1044155))

(assert (= (and d!126347 res!695501) b!1044148))

(assert (= (and b!1044148 res!695499) b!1044153))

(assert (= (and b!1044148 (not res!695502)) b!1044152))

(assert (= (and b!1044152 res!695503) b!1044151))

(assert (= (and b!1044148 res!695498) b!1044157))

(assert (= (and b!1044157 c!106046) b!1044164))

(assert (= (and b!1044157 (not c!106046)) b!1044156))

(assert (= (and b!1044164 res!695504) b!1044167))

(assert (= (or b!1044164 b!1044156) bm!44321))

(assert (= (and b!1044157 res!695505) b!1044147))

(assert (= (and b!1044147 c!106045) b!1044160))

(assert (= (and b!1044147 (not c!106045)) b!1044163))

(assert (= (and b!1044160 res!695497) b!1044158))

(assert (= (or b!1044160 b!1044163) bm!44317))

(declare-fun b_lambda!16207 () Bool)

(assert (=> (not b_lambda!16207) (not b!1044151)))

(declare-fun t!31235 () Bool)

(declare-fun tb!7055 () Bool)

(assert (=> (and b!1044029 (= (defaultEntry!6395 thiss!1427) (defaultEntry!6395 (_2!7885 lt!460394))) t!31235) tb!7055))

(declare-fun result!14535 () Bool)

(assert (=> tb!7055 (= result!14535 tp_is_empty!24831)))

(assert (=> b!1044151 t!31235))

(declare-fun b_and!33679 () Bool)

(assert (= b_and!33677 (and (=> t!31235 result!14535) b_and!33679)))

(assert (=> d!126347 m!963359))

(declare-fun m!963531 () Bool)

(assert (=> bm!44318 m!963531))

(declare-fun m!963533 () Bool)

(assert (=> b!1044158 m!963533))

(declare-fun m!963535 () Bool)

(assert (=> b!1044161 m!963535))

(declare-fun m!963537 () Bool)

(assert (=> b!1044161 m!963537))

(declare-fun m!963539 () Bool)

(assert (=> b!1044161 m!963539))

(declare-fun m!963541 () Bool)

(assert (=> b!1044161 m!963541))

(declare-fun m!963543 () Bool)

(assert (=> b!1044161 m!963543))

(declare-fun m!963545 () Bool)

(assert (=> b!1044161 m!963545))

(declare-fun m!963547 () Bool)

(assert (=> b!1044161 m!963547))

(assert (=> b!1044161 m!963535))

(declare-fun m!963549 () Bool)

(assert (=> b!1044161 m!963549))

(declare-fun m!963551 () Bool)

(assert (=> b!1044161 m!963551))

(assert (=> b!1044161 m!963541))

(declare-fun m!963553 () Bool)

(assert (=> b!1044161 m!963553))

(declare-fun m!963555 () Bool)

(assert (=> b!1044161 m!963555))

(declare-fun m!963557 () Bool)

(assert (=> b!1044161 m!963557))

(declare-fun m!963559 () Bool)

(assert (=> b!1044161 m!963559))

(assert (=> b!1044161 m!963555))

(declare-fun m!963561 () Bool)

(assert (=> b!1044161 m!963561))

(assert (=> b!1044161 m!963551))

(declare-fun m!963563 () Bool)

(assert (=> b!1044161 m!963563))

(declare-fun m!963565 () Bool)

(assert (=> b!1044161 m!963565))

(declare-fun m!963567 () Bool)

(assert (=> b!1044161 m!963567))

(declare-fun m!963569 () Bool)

(assert (=> b!1044151 m!963569))

(declare-fun m!963571 () Bool)

(assert (=> b!1044151 m!963571))

(assert (=> b!1044151 m!963569))

(assert (=> b!1044151 m!963571))

(declare-fun m!963573 () Bool)

(assert (=> b!1044151 m!963573))

(assert (=> b!1044151 m!963565))

(assert (=> b!1044151 m!963565))

(declare-fun m!963575 () Bool)

(assert (=> b!1044151 m!963575))

(assert (=> b!1044152 m!963565))

(assert (=> b!1044152 m!963565))

(declare-fun m!963577 () Bool)

(assert (=> b!1044152 m!963577))

(declare-fun m!963579 () Bool)

(assert (=> bm!44317 m!963579))

(declare-fun m!963581 () Bool)

(assert (=> b!1044167 m!963581))

(assert (=> b!1044153 m!963565))

(assert (=> b!1044153 m!963565))

(declare-fun m!963583 () Bool)

(assert (=> b!1044153 m!963583))

(assert (=> bm!44322 m!963557))

(assert (=> b!1044165 m!963565))

(assert (=> b!1044165 m!963565))

(assert (=> b!1044165 m!963583))

(declare-fun m!963585 () Bool)

(assert (=> bm!44321 m!963585))

(declare-fun m!963587 () Bool)

(assert (=> b!1044166 m!963587))

(assert (=> b!1044033 d!126347))

(declare-fun d!126349 () Bool)

(declare-fun e!591727 () Bool)

(assert (=> d!126349 e!591727))

(declare-fun res!695508 () Bool)

(assert (=> d!126349 (=> (not res!695508) (not e!591727))))

(assert (=> d!126349 (= res!695508 (bvslt (index!41720 lt!460393) (size!32200 (_keys!11657 thiss!1427))))))

(declare-fun lt!460521 () Unit!34087)

(declare-fun choose!121 (array!65828 (_ BitVec 32) (_ BitVec 64)) Unit!34087)

(assert (=> d!126349 (= lt!460521 (choose!121 (_keys!11657 thiss!1427) (index!41720 lt!460393) key!909))))

(assert (=> d!126349 (bvsge (index!41720 lt!460393) #b00000000000000000000000000000000)))

(assert (=> d!126349 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11657 thiss!1427) (index!41720 lt!460393) key!909) lt!460521)))

(declare-fun b!1044170 () Bool)

(assert (=> b!1044170 (= e!591727 (not (arrayContainsKey!0 (array!65829 (store (arr!31665 (_keys!11657 thiss!1427)) (index!41720 lt!460393) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32200 (_keys!11657 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126349 res!695508) b!1044170))

(declare-fun m!963589 () Bool)

(assert (=> d!126349 m!963589))

(assert (=> b!1044170 m!963367))

(declare-fun m!963591 () Bool)

(assert (=> b!1044170 m!963591))

(assert (=> b!1044033 d!126349))

(declare-fun d!126351 () Bool)

(declare-fun lt!460524 () (_ BitVec 32))

(assert (=> d!126351 (and (bvsge lt!460524 #b00000000000000000000000000000000) (bvsle lt!460524 (bvsub (size!32200 (_keys!11657 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!591733 () (_ BitVec 32))

(assert (=> d!126351 (= lt!460524 e!591733)))

(declare-fun c!106055 () Bool)

(assert (=> d!126351 (= c!106055 (bvsge #b00000000000000000000000000000000 (size!32200 (_keys!11657 thiss!1427))))))

(assert (=> d!126351 (and (bvsle #b00000000000000000000000000000000 (size!32200 (_keys!11657 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32200 (_keys!11657 thiss!1427)) (size!32200 (_keys!11657 thiss!1427))))))

(assert (=> d!126351 (= (arrayCountValidKeys!0 (_keys!11657 thiss!1427) #b00000000000000000000000000000000 (size!32200 (_keys!11657 thiss!1427))) lt!460524)))

(declare-fun bm!44326 () Bool)

(declare-fun call!44329 () (_ BitVec 32))

(assert (=> bm!44326 (= call!44329 (arrayCountValidKeys!0 (_keys!11657 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32200 (_keys!11657 thiss!1427))))))

(declare-fun b!1044179 () Bool)

(assert (=> b!1044179 (= e!591733 #b00000000000000000000000000000000)))

(declare-fun b!1044180 () Bool)

(declare-fun e!591732 () (_ BitVec 32))

(assert (=> b!1044180 (= e!591732 (bvadd #b00000000000000000000000000000001 call!44329))))

(declare-fun b!1044181 () Bool)

(assert (=> b!1044181 (= e!591732 call!44329)))

(declare-fun b!1044182 () Bool)

(assert (=> b!1044182 (= e!591733 e!591732)))

(declare-fun c!106056 () Bool)

(assert (=> b!1044182 (= c!106056 (validKeyInArray!0 (select (arr!31665 (_keys!11657 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126351 c!106055) b!1044179))

(assert (= (and d!126351 (not c!106055)) b!1044182))

(assert (= (and b!1044182 c!106056) b!1044180))

(assert (= (and b!1044182 (not c!106056)) b!1044181))

(assert (= (or b!1044180 b!1044181) bm!44326))

(declare-fun m!963593 () Bool)

(assert (=> bm!44326 m!963593))

(assert (=> b!1044182 m!963509))

(assert (=> b!1044182 m!963509))

(assert (=> b!1044182 m!963525))

(assert (=> b!1044033 d!126351))

(declare-fun d!126353 () Bool)

(declare-fun e!591736 () Bool)

(assert (=> d!126353 e!591736))

(declare-fun res!695511 () Bool)

(assert (=> d!126353 (=> (not res!695511) (not e!591736))))

(assert (=> d!126353 (= res!695511 (and (bvsge (index!41720 lt!460393) #b00000000000000000000000000000000) (bvslt (index!41720 lt!460393) (size!32200 (_keys!11657 thiss!1427)))))))

(declare-fun lt!460527 () Unit!34087)

(declare-fun choose!53 (array!65828 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22001) Unit!34087)

(assert (=> d!126353 (= lt!460527 (choose!53 (_keys!11657 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41720 lt!460393) #b00000000000000000000000000000000 Nil!21998))))

(assert (=> d!126353 (bvslt (size!32200 (_keys!11657 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126353 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11657 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41720 lt!460393) #b00000000000000000000000000000000 Nil!21998) lt!460527)))

(declare-fun b!1044185 () Bool)

(assert (=> b!1044185 (= e!591736 (arrayNoDuplicates!0 (array!65829 (store (arr!31665 (_keys!11657 thiss!1427)) (index!41720 lt!460393) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32200 (_keys!11657 thiss!1427))) #b00000000000000000000000000000000 Nil!21998))))

(assert (= (and d!126353 res!695511) b!1044185))

(declare-fun m!963595 () Bool)

(assert (=> d!126353 m!963595))

(assert (=> b!1044185 m!963367))

(declare-fun m!963597 () Bool)

(assert (=> b!1044185 m!963597))

(assert (=> b!1044033 d!126353))

(declare-fun d!126355 () Bool)

(declare-fun e!591739 () Bool)

(assert (=> d!126355 e!591739))

(declare-fun res!695514 () Bool)

(assert (=> d!126355 (=> (not res!695514) (not e!591739))))

(assert (=> d!126355 (= res!695514 (and (bvsge (index!41720 lt!460393) #b00000000000000000000000000000000) (bvslt (index!41720 lt!460393) (size!32200 (_keys!11657 thiss!1427)))))))

(declare-fun lt!460530 () Unit!34087)

(declare-fun choose!1710 (array!65828 array!65830 (_ BitVec 32) (_ BitVec 32) V!37981 V!37981 (_ BitVec 32) (_ BitVec 64) Int) Unit!34087)

(assert (=> d!126355 (= lt!460530 (choose!1710 (_keys!11657 thiss!1427) (_values!6418 thiss!1427) (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) (index!41720 lt!460393) key!909 (defaultEntry!6395 thiss!1427)))))

(assert (=> d!126355 (validMask!0 (mask!30496 thiss!1427))))

(assert (=> d!126355 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!51 (_keys!11657 thiss!1427) (_values!6418 thiss!1427) (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) (index!41720 lt!460393) key!909 (defaultEntry!6395 thiss!1427)) lt!460530)))

(declare-fun b!1044188 () Bool)

(assert (=> b!1044188 (= e!591739 (= (-!530 (getCurrentListMap!3951 (_keys!11657 thiss!1427) (_values!6418 thiss!1427) (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6395 thiss!1427)) key!909) (getCurrentListMap!3951 (array!65829 (store (arr!31665 (_keys!11657 thiss!1427)) (index!41720 lt!460393) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32200 (_keys!11657 thiss!1427))) (array!65831 (store (arr!31666 (_values!6418 thiss!1427)) (index!41720 lt!460393) (ValueCellFull!11712 (dynLambda!2000 (defaultEntry!6395 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32201 (_values!6418 thiss!1427))) (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6395 thiss!1427))))))

(assert (=> b!1044188 (bvslt (index!41720 lt!460393) (size!32201 (_values!6418 thiss!1427)))))

(assert (= (and d!126355 res!695514) b!1044188))

(declare-fun b_lambda!16209 () Bool)

(assert (=> (not b_lambda!16209) (not b!1044188)))

(assert (=> b!1044188 t!31229))

(declare-fun b_and!33681 () Bool)

(assert (= b_and!33679 (and (=> t!31229 result!14527) b_and!33681)))

(declare-fun m!963599 () Bool)

(assert (=> d!126355 m!963599))

(assert (=> d!126355 m!963471))

(declare-fun m!963601 () Bool)

(assert (=> b!1044188 m!963601))

(assert (=> b!1044188 m!963399))

(assert (=> b!1044188 m!963367))

(assert (=> b!1044188 m!963391))

(assert (=> b!1044188 m!963377))

(assert (=> b!1044188 m!963377))

(assert (=> b!1044188 m!963389))

(assert (=> b!1044033 d!126355))

(declare-fun d!126357 () Bool)

(declare-fun lt!460533 () ListLongMap!13775)

(assert (=> d!126357 (not (contains!6067 lt!460533 key!909))))

(declare-fun removeStrictlySorted!60 (List!22000 (_ BitVec 64)) List!22000)

(assert (=> d!126357 (= lt!460533 (ListLongMap!13776 (removeStrictlySorted!60 (toList!6903 (getCurrentListMap!3951 (_keys!11657 thiss!1427) (_values!6418 thiss!1427) (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6395 thiss!1427))) key!909)))))

(assert (=> d!126357 (= (-!530 (getCurrentListMap!3951 (_keys!11657 thiss!1427) (_values!6418 thiss!1427) (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6395 thiss!1427)) key!909) lt!460533)))

(declare-fun bs!30511 () Bool)

(assert (= bs!30511 d!126357))

(declare-fun m!963603 () Bool)

(assert (=> bs!30511 m!963603))

(declare-fun m!963605 () Bool)

(assert (=> bs!30511 m!963605))

(assert (=> b!1044033 d!126357))

(declare-fun b!1044197 () Bool)

(declare-fun e!591747 () Bool)

(declare-fun call!44332 () Bool)

(assert (=> b!1044197 (= e!591747 call!44332)))

(declare-fun b!1044198 () Bool)

(declare-fun e!591746 () Bool)

(assert (=> b!1044198 (= e!591746 call!44332)))

(declare-fun b!1044199 () Bool)

(declare-fun e!591748 () Bool)

(assert (=> b!1044199 (= e!591748 e!591747)))

(declare-fun c!106059 () Bool)

(assert (=> b!1044199 (= c!106059 (validKeyInArray!0 (select (arr!31665 lt!460392) #b00000000000000000000000000000000)))))

(declare-fun d!126359 () Bool)

(declare-fun res!695520 () Bool)

(assert (=> d!126359 (=> res!695520 e!591748)))

(assert (=> d!126359 (= res!695520 (bvsge #b00000000000000000000000000000000 (size!32200 lt!460392)))))

(assert (=> d!126359 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460392 (mask!30496 thiss!1427)) e!591748)))

(declare-fun bm!44329 () Bool)

(assert (=> bm!44329 (= call!44332 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!460392 (mask!30496 thiss!1427)))))

(declare-fun b!1044200 () Bool)

(assert (=> b!1044200 (= e!591747 e!591746)))

(declare-fun lt!460542 () (_ BitVec 64))

(assert (=> b!1044200 (= lt!460542 (select (arr!31665 lt!460392) #b00000000000000000000000000000000))))

(declare-fun lt!460541 () Unit!34087)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65828 (_ BitVec 64) (_ BitVec 32)) Unit!34087)

(assert (=> b!1044200 (= lt!460541 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!460392 lt!460542 #b00000000000000000000000000000000))))

(assert (=> b!1044200 (arrayContainsKey!0 lt!460392 lt!460542 #b00000000000000000000000000000000)))

(declare-fun lt!460540 () Unit!34087)

(assert (=> b!1044200 (= lt!460540 lt!460541)))

(declare-fun res!695519 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65828 (_ BitVec 32)) SeekEntryResult!9837)

(assert (=> b!1044200 (= res!695519 (= (seekEntryOrOpen!0 (select (arr!31665 lt!460392) #b00000000000000000000000000000000) lt!460392 (mask!30496 thiss!1427)) (Found!9837 #b00000000000000000000000000000000)))))

(assert (=> b!1044200 (=> (not res!695519) (not e!591746))))

(assert (= (and d!126359 (not res!695520)) b!1044199))

(assert (= (and b!1044199 c!106059) b!1044200))

(assert (= (and b!1044199 (not c!106059)) b!1044197))

(assert (= (and b!1044200 res!695519) b!1044198))

(assert (= (or b!1044198 b!1044197) bm!44329))

(assert (=> b!1044199 m!963455))

(assert (=> b!1044199 m!963455))

(declare-fun m!963607 () Bool)

(assert (=> b!1044199 m!963607))

(declare-fun m!963609 () Bool)

(assert (=> bm!44329 m!963609))

(assert (=> b!1044200 m!963455))

(declare-fun m!963611 () Bool)

(assert (=> b!1044200 m!963611))

(declare-fun m!963613 () Bool)

(assert (=> b!1044200 m!963613))

(assert (=> b!1044200 m!963455))

(declare-fun m!963615 () Bool)

(assert (=> b!1044200 m!963615))

(assert (=> b!1044033 d!126359))

(declare-fun d!126361 () Bool)

(declare-fun e!591753 () Bool)

(assert (=> d!126361 e!591753))

(declare-fun res!695523 () Bool)

(assert (=> d!126361 (=> res!695523 e!591753)))

(declare-fun lt!460552 () Bool)

(assert (=> d!126361 (= res!695523 (not lt!460552))))

(declare-fun lt!460554 () Bool)

(assert (=> d!126361 (= lt!460552 lt!460554)))

(declare-fun lt!460553 () Unit!34087)

(declare-fun e!591754 () Unit!34087)

(assert (=> d!126361 (= lt!460553 e!591754)))

(declare-fun c!106062 () Bool)

(assert (=> d!126361 (= c!106062 lt!460554)))

(declare-fun containsKey!565 (List!22000 (_ BitVec 64)) Bool)

(assert (=> d!126361 (= lt!460554 (containsKey!565 (toList!6903 (getCurrentListMap!3951 (_keys!11657 (_2!7885 lt!460394)) (_values!6418 (_2!7885 lt!460394)) (mask!30496 (_2!7885 lt!460394)) (extraKeys!6123 (_2!7885 lt!460394)) (zeroValue!6229 (_2!7885 lt!460394)) (minValue!6229 (_2!7885 lt!460394)) #b00000000000000000000000000000000 (defaultEntry!6395 (_2!7885 lt!460394)))) key!909))))

(assert (=> d!126361 (= (contains!6067 (getCurrentListMap!3951 (_keys!11657 (_2!7885 lt!460394)) (_values!6418 (_2!7885 lt!460394)) (mask!30496 (_2!7885 lt!460394)) (extraKeys!6123 (_2!7885 lt!460394)) (zeroValue!6229 (_2!7885 lt!460394)) (minValue!6229 (_2!7885 lt!460394)) #b00000000000000000000000000000000 (defaultEntry!6395 (_2!7885 lt!460394))) key!909) lt!460552)))

(declare-fun b!1044207 () Bool)

(declare-fun lt!460551 () Unit!34087)

(assert (=> b!1044207 (= e!591754 lt!460551)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!398 (List!22000 (_ BitVec 64)) Unit!34087)

(assert (=> b!1044207 (= lt!460551 (lemmaContainsKeyImpliesGetValueByKeyDefined!398 (toList!6903 (getCurrentListMap!3951 (_keys!11657 (_2!7885 lt!460394)) (_values!6418 (_2!7885 lt!460394)) (mask!30496 (_2!7885 lt!460394)) (extraKeys!6123 (_2!7885 lt!460394)) (zeroValue!6229 (_2!7885 lt!460394)) (minValue!6229 (_2!7885 lt!460394)) #b00000000000000000000000000000000 (defaultEntry!6395 (_2!7885 lt!460394)))) key!909))))

(declare-datatypes ((Option!641 0))(
  ( (Some!640 (v!15059 V!37981)) (None!639) )
))
(declare-fun isDefined!437 (Option!641) Bool)

(declare-fun getValueByKey!590 (List!22000 (_ BitVec 64)) Option!641)

(assert (=> b!1044207 (isDefined!437 (getValueByKey!590 (toList!6903 (getCurrentListMap!3951 (_keys!11657 (_2!7885 lt!460394)) (_values!6418 (_2!7885 lt!460394)) (mask!30496 (_2!7885 lt!460394)) (extraKeys!6123 (_2!7885 lt!460394)) (zeroValue!6229 (_2!7885 lt!460394)) (minValue!6229 (_2!7885 lt!460394)) #b00000000000000000000000000000000 (defaultEntry!6395 (_2!7885 lt!460394)))) key!909))))

(declare-fun b!1044208 () Bool)

(declare-fun Unit!34093 () Unit!34087)

(assert (=> b!1044208 (= e!591754 Unit!34093)))

(declare-fun b!1044209 () Bool)

(assert (=> b!1044209 (= e!591753 (isDefined!437 (getValueByKey!590 (toList!6903 (getCurrentListMap!3951 (_keys!11657 (_2!7885 lt!460394)) (_values!6418 (_2!7885 lt!460394)) (mask!30496 (_2!7885 lt!460394)) (extraKeys!6123 (_2!7885 lt!460394)) (zeroValue!6229 (_2!7885 lt!460394)) (minValue!6229 (_2!7885 lt!460394)) #b00000000000000000000000000000000 (defaultEntry!6395 (_2!7885 lt!460394)))) key!909)))))

(assert (= (and d!126361 c!106062) b!1044207))

(assert (= (and d!126361 (not c!106062)) b!1044208))

(assert (= (and d!126361 (not res!695523)) b!1044209))

(declare-fun m!963617 () Bool)

(assert (=> d!126361 m!963617))

(declare-fun m!963619 () Bool)

(assert (=> b!1044207 m!963619))

(declare-fun m!963621 () Bool)

(assert (=> b!1044207 m!963621))

(assert (=> b!1044207 m!963621))

(declare-fun m!963623 () Bool)

(assert (=> b!1044207 m!963623))

(assert (=> b!1044209 m!963621))

(assert (=> b!1044209 m!963621))

(assert (=> b!1044209 m!963623))

(assert (=> b!1044033 d!126361))

(declare-fun b!1044220 () Bool)

(declare-fun e!591764 () Bool)

(declare-fun e!591763 () Bool)

(assert (=> b!1044220 (= e!591764 e!591763)))

(declare-fun c!106065 () Bool)

(assert (=> b!1044220 (= c!106065 (validKeyInArray!0 (select (arr!31665 lt!460392) #b00000000000000000000000000000000)))))

(declare-fun d!126363 () Bool)

(declare-fun res!695531 () Bool)

(declare-fun e!591766 () Bool)

(assert (=> d!126363 (=> res!695531 e!591766)))

(assert (=> d!126363 (= res!695531 (bvsge #b00000000000000000000000000000000 (size!32200 lt!460392)))))

(assert (=> d!126363 (= (arrayNoDuplicates!0 lt!460392 #b00000000000000000000000000000000 Nil!21998) e!591766)))

(declare-fun bm!44332 () Bool)

(declare-fun call!44335 () Bool)

(assert (=> bm!44332 (= call!44335 (arrayNoDuplicates!0 lt!460392 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106065 (Cons!21997 (select (arr!31665 lt!460392) #b00000000000000000000000000000000) Nil!21998) Nil!21998)))))

(declare-fun b!1044221 () Bool)

(assert (=> b!1044221 (= e!591766 e!591764)))

(declare-fun res!695532 () Bool)

(assert (=> b!1044221 (=> (not res!695532) (not e!591764))))

(declare-fun e!591765 () Bool)

(assert (=> b!1044221 (= res!695532 (not e!591765))))

(declare-fun res!695530 () Bool)

(assert (=> b!1044221 (=> (not res!695530) (not e!591765))))

(assert (=> b!1044221 (= res!695530 (validKeyInArray!0 (select (arr!31665 lt!460392) #b00000000000000000000000000000000)))))

(declare-fun b!1044222 () Bool)

(declare-fun contains!6068 (List!22001 (_ BitVec 64)) Bool)

(assert (=> b!1044222 (= e!591765 (contains!6068 Nil!21998 (select (arr!31665 lt!460392) #b00000000000000000000000000000000)))))

(declare-fun b!1044223 () Bool)

(assert (=> b!1044223 (= e!591763 call!44335)))

(declare-fun b!1044224 () Bool)

(assert (=> b!1044224 (= e!591763 call!44335)))

(assert (= (and d!126363 (not res!695531)) b!1044221))

(assert (= (and b!1044221 res!695530) b!1044222))

(assert (= (and b!1044221 res!695532) b!1044220))

(assert (= (and b!1044220 c!106065) b!1044223))

(assert (= (and b!1044220 (not c!106065)) b!1044224))

(assert (= (or b!1044223 b!1044224) bm!44332))

(assert (=> b!1044220 m!963455))

(assert (=> b!1044220 m!963455))

(assert (=> b!1044220 m!963607))

(assert (=> bm!44332 m!963455))

(declare-fun m!963625 () Bool)

(assert (=> bm!44332 m!963625))

(assert (=> b!1044221 m!963455))

(assert (=> b!1044221 m!963455))

(assert (=> b!1044221 m!963607))

(assert (=> b!1044222 m!963455))

(assert (=> b!1044222 m!963455))

(declare-fun m!963627 () Bool)

(assert (=> b!1044222 m!963627))

(assert (=> b!1044033 d!126363))

(declare-fun d!126365 () Bool)

(declare-fun lt!460555 () (_ BitVec 32))

(assert (=> d!126365 (and (bvsge lt!460555 #b00000000000000000000000000000000) (bvsle lt!460555 (bvsub (size!32200 lt!460392) #b00000000000000000000000000000000)))))

(declare-fun e!591768 () (_ BitVec 32))

(assert (=> d!126365 (= lt!460555 e!591768)))

(declare-fun c!106066 () Bool)

(assert (=> d!126365 (= c!106066 (bvsge #b00000000000000000000000000000000 (size!32200 (_keys!11657 thiss!1427))))))

(assert (=> d!126365 (and (bvsle #b00000000000000000000000000000000 (size!32200 (_keys!11657 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32200 (_keys!11657 thiss!1427)) (size!32200 lt!460392)))))

(assert (=> d!126365 (= (arrayCountValidKeys!0 lt!460392 #b00000000000000000000000000000000 (size!32200 (_keys!11657 thiss!1427))) lt!460555)))

(declare-fun bm!44333 () Bool)

(declare-fun call!44336 () (_ BitVec 32))

(assert (=> bm!44333 (= call!44336 (arrayCountValidKeys!0 lt!460392 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32200 (_keys!11657 thiss!1427))))))

(declare-fun b!1044225 () Bool)

(assert (=> b!1044225 (= e!591768 #b00000000000000000000000000000000)))

(declare-fun b!1044226 () Bool)

(declare-fun e!591767 () (_ BitVec 32))

(assert (=> b!1044226 (= e!591767 (bvadd #b00000000000000000000000000000001 call!44336))))

(declare-fun b!1044227 () Bool)

(assert (=> b!1044227 (= e!591767 call!44336)))

(declare-fun b!1044228 () Bool)

(assert (=> b!1044228 (= e!591768 e!591767)))

(declare-fun c!106067 () Bool)

(assert (=> b!1044228 (= c!106067 (validKeyInArray!0 (select (arr!31665 lt!460392) #b00000000000000000000000000000000)))))

(assert (= (and d!126365 c!106066) b!1044225))

(assert (= (and d!126365 (not c!106066)) b!1044228))

(assert (= (and b!1044228 c!106067) b!1044226))

(assert (= (and b!1044228 (not c!106067)) b!1044227))

(assert (= (or b!1044226 b!1044227) bm!44333))

(declare-fun m!963629 () Bool)

(assert (=> bm!44333 m!963629))

(assert (=> b!1044228 m!963455))

(assert (=> b!1044228 m!963455))

(assert (=> b!1044228 m!963607))

(assert (=> b!1044033 d!126365))

(declare-fun b!1044229 () Bool)

(declare-fun e!591780 () Bool)

(declare-fun e!591774 () Bool)

(assert (=> b!1044229 (= e!591780 e!591774)))

(declare-fun c!106068 () Bool)

(assert (=> b!1044229 (= c!106068 (not (= (bvand (extraKeys!6123 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44334 () Bool)

(declare-fun call!44338 () Bool)

(declare-fun lt!460570 () ListLongMap!13775)

(assert (=> bm!44334 (= call!44338 (contains!6067 lt!460570 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!44340 () ListLongMap!13775)

(declare-fun c!106073 () Bool)

(declare-fun call!44339 () ListLongMap!13775)

(declare-fun c!106071 () Bool)

(declare-fun call!44342 () ListLongMap!13775)

(declare-fun call!44337 () ListLongMap!13775)

(declare-fun bm!44335 () Bool)

(assert (=> bm!44335 (= call!44339 (+!3108 (ite c!106071 call!44337 (ite c!106073 call!44342 call!44340)) (ite (or c!106071 c!106073) (tuple2!15751 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6229 thiss!1427)) (tuple2!15751 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6229 thiss!1427)))))))

(declare-fun b!1044230 () Bool)

(declare-fun res!695534 () Bool)

(assert (=> b!1044230 (=> (not res!695534) (not e!591780))))

(declare-fun e!591772 () Bool)

(assert (=> b!1044230 (= res!695534 e!591772)))

(declare-fun res!695538 () Bool)

(assert (=> b!1044230 (=> res!695538 e!591772)))

(declare-fun e!591769 () Bool)

(assert (=> b!1044230 (= res!695538 (not e!591769))))

(declare-fun res!695535 () Bool)

(assert (=> b!1044230 (=> (not res!695535) (not e!591769))))

(assert (=> b!1044230 (= res!695535 (bvslt #b00000000000000000000000000000000 (size!32200 lt!460392)))))

(declare-fun b!1044231 () Bool)

(declare-fun e!591771 () ListLongMap!13775)

(declare-fun e!591775 () ListLongMap!13775)

(assert (=> b!1044231 (= e!591771 e!591775)))

(assert (=> b!1044231 (= c!106073 (and (not (= (bvand (extraKeys!6123 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6123 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44336 () Bool)

(assert (=> bm!44336 (= call!44342 call!44337)))

(declare-fun b!1044232 () Bool)

(declare-fun call!44341 () ListLongMap!13775)

(assert (=> b!1044232 (= e!591775 call!44341)))

(declare-fun bm!44337 () Bool)

(assert (=> bm!44337 (= call!44340 call!44342)))

(declare-fun b!1044233 () Bool)

(declare-fun e!591776 () Bool)

(assert (=> b!1044233 (= e!591776 (= (apply!910 lt!460570 (select (arr!31665 lt!460392) #b00000000000000000000000000000000)) (get!16547 (select (arr!31666 lt!460390) #b00000000000000000000000000000000) (dynLambda!2000 (defaultEntry!6395 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044233 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32201 lt!460390)))))

(assert (=> b!1044233 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32200 lt!460392)))))

(declare-fun b!1044234 () Bool)

(assert (=> b!1044234 (= e!591772 e!591776)))

(declare-fun res!695539 () Bool)

(assert (=> b!1044234 (=> (not res!695539) (not e!591776))))

(assert (=> b!1044234 (= res!695539 (contains!6067 lt!460570 (select (arr!31665 lt!460392) #b00000000000000000000000000000000)))))

(assert (=> b!1044234 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32200 lt!460392)))))

(declare-fun b!1044235 () Bool)

(assert (=> b!1044235 (= e!591769 (validKeyInArray!0 (select (arr!31665 lt!460392) #b00000000000000000000000000000000)))))

(declare-fun b!1044236 () Bool)

(declare-fun c!106072 () Bool)

(assert (=> b!1044236 (= c!106072 (and (not (= (bvand (extraKeys!6123 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6123 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!591778 () ListLongMap!13775)

(assert (=> b!1044236 (= e!591775 e!591778)))

(declare-fun b!1044237 () Bool)

(declare-fun e!591777 () Unit!34087)

(declare-fun Unit!34094 () Unit!34087)

(assert (=> b!1044237 (= e!591777 Unit!34094)))

(declare-fun d!126367 () Bool)

(assert (=> d!126367 e!591780))

(declare-fun res!695537 () Bool)

(assert (=> d!126367 (=> (not res!695537) (not e!591780))))

(assert (=> d!126367 (= res!695537 (or (bvsge #b00000000000000000000000000000000 (size!32200 lt!460392)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32200 lt!460392)))))))

(declare-fun lt!460574 () ListLongMap!13775)

(assert (=> d!126367 (= lt!460570 lt!460574)))

(declare-fun lt!460573 () Unit!34087)

(assert (=> d!126367 (= lt!460573 e!591777)))

(declare-fun c!106070 () Bool)

(declare-fun e!591779 () Bool)

(assert (=> d!126367 (= c!106070 e!591779)))

(declare-fun res!695536 () Bool)

(assert (=> d!126367 (=> (not res!695536) (not e!591779))))

(assert (=> d!126367 (= res!695536 (bvslt #b00000000000000000000000000000000 (size!32200 lt!460392)))))

(assert (=> d!126367 (= lt!460574 e!591771)))

(assert (=> d!126367 (= c!106071 (and (not (= (bvand (extraKeys!6123 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6123 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126367 (validMask!0 (mask!30496 thiss!1427))))

(assert (=> d!126367 (= (getCurrentListMap!3951 lt!460392 lt!460390 (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6395 thiss!1427)) lt!460570)))

(declare-fun b!1044238 () Bool)

(declare-fun e!591773 () Bool)

(declare-fun call!44343 () Bool)

(assert (=> b!1044238 (= e!591773 (not call!44343))))

(declare-fun b!1044239 () Bool)

(declare-fun res!695541 () Bool)

(assert (=> b!1044239 (=> (not res!695541) (not e!591780))))

(assert (=> b!1044239 (= res!695541 e!591773)))

(declare-fun c!106069 () Bool)

(assert (=> b!1044239 (= c!106069 (not (= (bvand (extraKeys!6123 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!44338 () Bool)

(assert (=> bm!44338 (= call!44343 (contains!6067 lt!460570 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044240 () Bool)

(declare-fun e!591770 () Bool)

(assert (=> b!1044240 (= e!591770 (= (apply!910 lt!460570 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6229 thiss!1427)))))

(declare-fun b!1044241 () Bool)

(assert (=> b!1044241 (= e!591778 call!44340)))

(declare-fun b!1044242 () Bool)

(assert (=> b!1044242 (= e!591774 e!591770)))

(declare-fun res!695533 () Bool)

(assert (=> b!1044242 (= res!695533 call!44338)))

(assert (=> b!1044242 (=> (not res!695533) (not e!591770))))

(declare-fun bm!44339 () Bool)

(assert (=> bm!44339 (= call!44337 (getCurrentListMapNoExtraKeys!3524 lt!460392 lt!460390 (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6395 thiss!1427)))))

(declare-fun b!1044243 () Bool)

(declare-fun lt!460561 () Unit!34087)

(assert (=> b!1044243 (= e!591777 lt!460561)))

(declare-fun lt!460577 () ListLongMap!13775)

(assert (=> b!1044243 (= lt!460577 (getCurrentListMapNoExtraKeys!3524 lt!460392 lt!460390 (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6395 thiss!1427)))))

(declare-fun lt!460563 () (_ BitVec 64))

(assert (=> b!1044243 (= lt!460563 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460569 () (_ BitVec 64))

(assert (=> b!1044243 (= lt!460569 (select (arr!31665 lt!460392) #b00000000000000000000000000000000))))

(declare-fun lt!460575 () Unit!34087)

(assert (=> b!1044243 (= lt!460575 (addStillContains!629 lt!460577 lt!460563 (zeroValue!6229 thiss!1427) lt!460569))))

(assert (=> b!1044243 (contains!6067 (+!3108 lt!460577 (tuple2!15751 lt!460563 (zeroValue!6229 thiss!1427))) lt!460569)))

(declare-fun lt!460567 () Unit!34087)

(assert (=> b!1044243 (= lt!460567 lt!460575)))

(declare-fun lt!460557 () ListLongMap!13775)

(assert (=> b!1044243 (= lt!460557 (getCurrentListMapNoExtraKeys!3524 lt!460392 lt!460390 (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6395 thiss!1427)))))

(declare-fun lt!460566 () (_ BitVec 64))

(assert (=> b!1044243 (= lt!460566 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460560 () (_ BitVec 64))

(assert (=> b!1044243 (= lt!460560 (select (arr!31665 lt!460392) #b00000000000000000000000000000000))))

(declare-fun lt!460571 () Unit!34087)

(assert (=> b!1044243 (= lt!460571 (addApplyDifferent!489 lt!460557 lt!460566 (minValue!6229 thiss!1427) lt!460560))))

(assert (=> b!1044243 (= (apply!910 (+!3108 lt!460557 (tuple2!15751 lt!460566 (minValue!6229 thiss!1427))) lt!460560) (apply!910 lt!460557 lt!460560))))

(declare-fun lt!460576 () Unit!34087)

(assert (=> b!1044243 (= lt!460576 lt!460571)))

(declare-fun lt!460562 () ListLongMap!13775)

(assert (=> b!1044243 (= lt!460562 (getCurrentListMapNoExtraKeys!3524 lt!460392 lt!460390 (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6395 thiss!1427)))))

(declare-fun lt!460565 () (_ BitVec 64))

(assert (=> b!1044243 (= lt!460565 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460558 () (_ BitVec 64))

(assert (=> b!1044243 (= lt!460558 (select (arr!31665 lt!460392) #b00000000000000000000000000000000))))

(declare-fun lt!460572 () Unit!34087)

(assert (=> b!1044243 (= lt!460572 (addApplyDifferent!489 lt!460562 lt!460565 (zeroValue!6229 thiss!1427) lt!460558))))

(assert (=> b!1044243 (= (apply!910 (+!3108 lt!460562 (tuple2!15751 lt!460565 (zeroValue!6229 thiss!1427))) lt!460558) (apply!910 lt!460562 lt!460558))))

(declare-fun lt!460556 () Unit!34087)

(assert (=> b!1044243 (= lt!460556 lt!460572)))

(declare-fun lt!460564 () ListLongMap!13775)

(assert (=> b!1044243 (= lt!460564 (getCurrentListMapNoExtraKeys!3524 lt!460392 lt!460390 (mask!30496 thiss!1427) (extraKeys!6123 thiss!1427) (zeroValue!6229 thiss!1427) (minValue!6229 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6395 thiss!1427)))))

(declare-fun lt!460568 () (_ BitVec 64))

(assert (=> b!1044243 (= lt!460568 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460559 () (_ BitVec 64))

(assert (=> b!1044243 (= lt!460559 (select (arr!31665 lt!460392) #b00000000000000000000000000000000))))

(assert (=> b!1044243 (= lt!460561 (addApplyDifferent!489 lt!460564 lt!460568 (minValue!6229 thiss!1427) lt!460559))))

(assert (=> b!1044243 (= (apply!910 (+!3108 lt!460564 (tuple2!15751 lt!460568 (minValue!6229 thiss!1427))) lt!460559) (apply!910 lt!460564 lt!460559))))

(declare-fun b!1044244 () Bool)

(assert (=> b!1044244 (= e!591778 call!44341)))

(declare-fun bm!44340 () Bool)

(assert (=> bm!44340 (= call!44341 call!44339)))

(declare-fun b!1044245 () Bool)

(assert (=> b!1044245 (= e!591774 (not call!44338))))

(declare-fun b!1044246 () Bool)

(declare-fun e!591781 () Bool)

(assert (=> b!1044246 (= e!591773 e!591781)))

(declare-fun res!695540 () Bool)

(assert (=> b!1044246 (= res!695540 call!44343)))

(assert (=> b!1044246 (=> (not res!695540) (not e!591781))))

(declare-fun b!1044247 () Bool)

(assert (=> b!1044247 (= e!591779 (validKeyInArray!0 (select (arr!31665 lt!460392) #b00000000000000000000000000000000)))))

(declare-fun b!1044248 () Bool)

(assert (=> b!1044248 (= e!591771 (+!3108 call!44339 (tuple2!15751 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6229 thiss!1427))))))

(declare-fun b!1044249 () Bool)

(assert (=> b!1044249 (= e!591781 (= (apply!910 lt!460570 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6229 thiss!1427)))))

(assert (= (and d!126367 c!106071) b!1044248))

(assert (= (and d!126367 (not c!106071)) b!1044231))

(assert (= (and b!1044231 c!106073) b!1044232))

(assert (= (and b!1044231 (not c!106073)) b!1044236))

(assert (= (and b!1044236 c!106072) b!1044244))

(assert (= (and b!1044236 (not c!106072)) b!1044241))

(assert (= (or b!1044244 b!1044241) bm!44337))

(assert (= (or b!1044232 bm!44337) bm!44336))

(assert (= (or b!1044232 b!1044244) bm!44340))

(assert (= (or b!1044248 bm!44336) bm!44339))

(assert (= (or b!1044248 bm!44340) bm!44335))

(assert (= (and d!126367 res!695536) b!1044247))

(assert (= (and d!126367 c!106070) b!1044243))

(assert (= (and d!126367 (not c!106070)) b!1044237))

(assert (= (and d!126367 res!695537) b!1044230))

(assert (= (and b!1044230 res!695535) b!1044235))

(assert (= (and b!1044230 (not res!695538)) b!1044234))

(assert (= (and b!1044234 res!695539) b!1044233))

(assert (= (and b!1044230 res!695534) b!1044239))

(assert (= (and b!1044239 c!106069) b!1044246))

(assert (= (and b!1044239 (not c!106069)) b!1044238))

(assert (= (and b!1044246 res!695540) b!1044249))

(assert (= (or b!1044246 b!1044238) bm!44338))

(assert (= (and b!1044239 res!695541) b!1044229))

(assert (= (and b!1044229 c!106068) b!1044242))

(assert (= (and b!1044229 (not c!106068)) b!1044245))

(assert (= (and b!1044242 res!695533) b!1044240))

(assert (= (or b!1044242 b!1044245) bm!44334))

(declare-fun b_lambda!16211 () Bool)

(assert (=> (not b_lambda!16211) (not b!1044233)))

(assert (=> b!1044233 t!31229))

(declare-fun b_and!33683 () Bool)

(assert (= b_and!33681 (and (=> t!31229 result!14527) b_and!33683)))

(assert (=> d!126367 m!963471))

(declare-fun m!963631 () Bool)

(assert (=> bm!44335 m!963631))

(declare-fun m!963633 () Bool)

(assert (=> b!1044240 m!963633))

(declare-fun m!963635 () Bool)

(assert (=> b!1044243 m!963635))

(declare-fun m!963637 () Bool)

(assert (=> b!1044243 m!963637))

(declare-fun m!963639 () Bool)

(assert (=> b!1044243 m!963639))

(declare-fun m!963641 () Bool)

(assert (=> b!1044243 m!963641))

(declare-fun m!963643 () Bool)

(assert (=> b!1044243 m!963643))

(declare-fun m!963645 () Bool)

(assert (=> b!1044243 m!963645))

(declare-fun m!963647 () Bool)

(assert (=> b!1044243 m!963647))

(assert (=> b!1044243 m!963635))

(declare-fun m!963649 () Bool)

(assert (=> b!1044243 m!963649))

(declare-fun m!963651 () Bool)

(assert (=> b!1044243 m!963651))

(assert (=> b!1044243 m!963641))

(declare-fun m!963653 () Bool)

(assert (=> b!1044243 m!963653))

(declare-fun m!963655 () Bool)

(assert (=> b!1044243 m!963655))

(declare-fun m!963657 () Bool)

(assert (=> b!1044243 m!963657))

(declare-fun m!963659 () Bool)

(assert (=> b!1044243 m!963659))

(assert (=> b!1044243 m!963655))

(declare-fun m!963661 () Bool)

(assert (=> b!1044243 m!963661))

(assert (=> b!1044243 m!963651))

(declare-fun m!963663 () Bool)

(assert (=> b!1044243 m!963663))

(assert (=> b!1044243 m!963455))

(declare-fun m!963665 () Bool)

(assert (=> b!1044243 m!963665))

(declare-fun m!963667 () Bool)

(assert (=> b!1044233 m!963667))

(assert (=> b!1044233 m!963399))

(assert (=> b!1044233 m!963667))

(assert (=> b!1044233 m!963399))

(declare-fun m!963669 () Bool)

(assert (=> b!1044233 m!963669))

(assert (=> b!1044233 m!963455))

(assert (=> b!1044233 m!963455))

(declare-fun m!963671 () Bool)

(assert (=> b!1044233 m!963671))

(assert (=> b!1044234 m!963455))

(assert (=> b!1044234 m!963455))

(declare-fun m!963673 () Bool)

(assert (=> b!1044234 m!963673))

(declare-fun m!963675 () Bool)

(assert (=> bm!44334 m!963675))

(declare-fun m!963677 () Bool)

(assert (=> b!1044249 m!963677))

(assert (=> b!1044235 m!963455))

(assert (=> b!1044235 m!963455))

(assert (=> b!1044235 m!963607))

(assert (=> bm!44339 m!963657))

(assert (=> b!1044247 m!963455))

(assert (=> b!1044247 m!963455))

(assert (=> b!1044247 m!963607))

(declare-fun m!963679 () Bool)

(assert (=> bm!44338 m!963679))

(declare-fun m!963681 () Bool)

(assert (=> b!1044248 m!963681))

(assert (=> b!1044033 d!126367))

(declare-fun d!126369 () Bool)

(declare-fun res!695548 () Bool)

(declare-fun e!591784 () Bool)

(assert (=> d!126369 (=> (not res!695548) (not e!591784))))

(declare-fun simpleValid!448 (LongMapFixedSize!6018) Bool)

(assert (=> d!126369 (= res!695548 (simpleValid!448 thiss!1427))))

(assert (=> d!126369 (= (valid!2258 thiss!1427) e!591784)))

(declare-fun b!1044256 () Bool)

(declare-fun res!695549 () Bool)

(assert (=> b!1044256 (=> (not res!695549) (not e!591784))))

(assert (=> b!1044256 (= res!695549 (= (arrayCountValidKeys!0 (_keys!11657 thiss!1427) #b00000000000000000000000000000000 (size!32200 (_keys!11657 thiss!1427))) (_size!3064 thiss!1427)))))

(declare-fun b!1044257 () Bool)

(declare-fun res!695550 () Bool)

(assert (=> b!1044257 (=> (not res!695550) (not e!591784))))

(assert (=> b!1044257 (= res!695550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11657 thiss!1427) (mask!30496 thiss!1427)))))

(declare-fun b!1044258 () Bool)

(assert (=> b!1044258 (= e!591784 (arrayNoDuplicates!0 (_keys!11657 thiss!1427) #b00000000000000000000000000000000 Nil!21998))))

(assert (= (and d!126369 res!695548) b!1044256))

(assert (= (and b!1044256 res!695549) b!1044257))

(assert (= (and b!1044257 res!695550) b!1044258))

(declare-fun m!963683 () Bool)

(assert (=> d!126369 m!963683))

(assert (=> b!1044256 m!963369))

(declare-fun m!963685 () Bool)

(assert (=> b!1044257 m!963685))

(declare-fun m!963687 () Bool)

(assert (=> b!1044258 m!963687))

(assert (=> start!91734 d!126369))

(declare-fun d!126371 () Bool)

(declare-fun lt!460586 () SeekEntryResult!9837)

(assert (=> d!126371 (and (or ((_ is MissingVacant!9837) lt!460586) (not ((_ is Found!9837) lt!460586)) (and (bvsge (index!41720 lt!460586) #b00000000000000000000000000000000) (bvslt (index!41720 lt!460586) (size!32200 (_keys!11657 thiss!1427))))) (not ((_ is MissingVacant!9837) lt!460586)) (or (not ((_ is Found!9837) lt!460586)) (= (select (arr!31665 (_keys!11657 thiss!1427)) (index!41720 lt!460586)) key!909)))))

(declare-fun e!591793 () SeekEntryResult!9837)

(assert (=> d!126371 (= lt!460586 e!591793)))

(declare-fun c!106081 () Bool)

(declare-fun lt!460589 () SeekEntryResult!9837)

(assert (=> d!126371 (= c!106081 (and ((_ is Intermediate!9837) lt!460589) (undefined!10649 lt!460589)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65828 (_ BitVec 32)) SeekEntryResult!9837)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126371 (= lt!460589 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30496 thiss!1427)) key!909 (_keys!11657 thiss!1427) (mask!30496 thiss!1427)))))

(assert (=> d!126371 (validMask!0 (mask!30496 thiss!1427))))

(assert (=> d!126371 (= (seekEntry!0 key!909 (_keys!11657 thiss!1427) (mask!30496 thiss!1427)) lt!460586)))

(declare-fun b!1044271 () Bool)

(assert (=> b!1044271 (= e!591793 Undefined!9837)))

(declare-fun b!1044272 () Bool)

(declare-fun e!591792 () SeekEntryResult!9837)

(declare-fun lt!460587 () SeekEntryResult!9837)

(assert (=> b!1044272 (= e!591792 (ite ((_ is MissingVacant!9837) lt!460587) (MissingZero!9837 (index!41722 lt!460587)) lt!460587))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65828 (_ BitVec 32)) SeekEntryResult!9837)

(assert (=> b!1044272 (= lt!460587 (seekKeyOrZeroReturnVacant!0 (x!93221 lt!460589) (index!41721 lt!460589) (index!41721 lt!460589) key!909 (_keys!11657 thiss!1427) (mask!30496 thiss!1427)))))

(declare-fun b!1044273 () Bool)

(declare-fun c!106080 () Bool)

(declare-fun lt!460588 () (_ BitVec 64))

(assert (=> b!1044273 (= c!106080 (= lt!460588 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!591791 () SeekEntryResult!9837)

(assert (=> b!1044273 (= e!591791 e!591792)))

(declare-fun b!1044274 () Bool)

(assert (=> b!1044274 (= e!591791 (Found!9837 (index!41721 lt!460589)))))

(declare-fun b!1044275 () Bool)

(assert (=> b!1044275 (= e!591793 e!591791)))

(assert (=> b!1044275 (= lt!460588 (select (arr!31665 (_keys!11657 thiss!1427)) (index!41721 lt!460589)))))

(declare-fun c!106082 () Bool)

(assert (=> b!1044275 (= c!106082 (= lt!460588 key!909))))

(declare-fun b!1044276 () Bool)

(assert (=> b!1044276 (= e!591792 (MissingZero!9837 (index!41721 lt!460589)))))

(assert (= (and d!126371 c!106081) b!1044271))

(assert (= (and d!126371 (not c!106081)) b!1044275))

(assert (= (and b!1044275 c!106082) b!1044274))

(assert (= (and b!1044275 (not c!106082)) b!1044273))

(assert (= (and b!1044273 c!106080) b!1044276))

(assert (= (and b!1044273 (not c!106080)) b!1044272))

(declare-fun m!963689 () Bool)

(assert (=> d!126371 m!963689))

(declare-fun m!963691 () Bool)

(assert (=> d!126371 m!963691))

(assert (=> d!126371 m!963691))

(declare-fun m!963693 () Bool)

(assert (=> d!126371 m!963693))

(assert (=> d!126371 m!963471))

(declare-fun m!963695 () Bool)

(assert (=> b!1044272 m!963695))

(declare-fun m!963697 () Bool)

(assert (=> b!1044275 m!963697))

(assert (=> b!1044027 d!126371))

(declare-fun mapNonEmpty!38879 () Bool)

(declare-fun mapRes!38879 () Bool)

(declare-fun tp!74586 () Bool)

(declare-fun e!591798 () Bool)

(assert (=> mapNonEmpty!38879 (= mapRes!38879 (and tp!74586 e!591798))))

(declare-fun mapKey!38879 () (_ BitVec 32))

(declare-fun mapValue!38879 () ValueCell!11712)

(declare-fun mapRest!38879 () (Array (_ BitVec 32) ValueCell!11712))

(assert (=> mapNonEmpty!38879 (= mapRest!38873 (store mapRest!38879 mapKey!38879 mapValue!38879))))

(declare-fun mapIsEmpty!38879 () Bool)

(assert (=> mapIsEmpty!38879 mapRes!38879))

(declare-fun b!1044284 () Bool)

(declare-fun e!591799 () Bool)

(assert (=> b!1044284 (= e!591799 tp_is_empty!24831)))

(declare-fun condMapEmpty!38879 () Bool)

(declare-fun mapDefault!38879 () ValueCell!11712)

(assert (=> mapNonEmpty!38873 (= condMapEmpty!38879 (= mapRest!38873 ((as const (Array (_ BitVec 32) ValueCell!11712)) mapDefault!38879)))))

(assert (=> mapNonEmpty!38873 (= tp!74576 (and e!591799 mapRes!38879))))

(declare-fun b!1044283 () Bool)

(assert (=> b!1044283 (= e!591798 tp_is_empty!24831)))

(assert (= (and mapNonEmpty!38873 condMapEmpty!38879) mapIsEmpty!38879))

(assert (= (and mapNonEmpty!38873 (not condMapEmpty!38879)) mapNonEmpty!38879))

(assert (= (and mapNonEmpty!38879 ((_ is ValueCellFull!11712) mapValue!38879)) b!1044283))

(assert (= (and mapNonEmpty!38873 ((_ is ValueCellFull!11712) mapDefault!38879)) b!1044284))

(declare-fun m!963699 () Bool)

(assert (=> mapNonEmpty!38879 m!963699))

(declare-fun b_lambda!16213 () Bool)

(assert (= b_lambda!16209 (or (and b!1044029 b_free!21111) b_lambda!16213)))

(declare-fun b_lambda!16215 () Bool)

(assert (= b_lambda!16211 (or (and b!1044029 b_free!21111) b_lambda!16215)))

(declare-fun b_lambda!16217 () Bool)

(assert (= b_lambda!16205 (or (and b!1044029 b_free!21111) b_lambda!16217)))

(check-sat (not bm!44329) (not b!1044137) (not b!1044146) (not b!1044144) (not b!1044131) (not d!126361) (not b!1044083) (not b!1044249) (not b!1044258) (not bm!44333) (not bm!44322) (not d!126345) (not bm!44335) (not b_lambda!16217) (not b!1044248) (not b_lambda!16203) (not b!1044234) (not b!1044140) (not bm!44315) (not d!126353) (not b!1044243) (not d!126347) (not b!1044077) (not b!1044153) (not bm!44339) (not b!1044257) (not b!1044222) (not b!1044200) (not bm!44317) (not b!1044132) (not b!1044152) (not d!126355) (not b!1044256) (not b!1044199) (not bm!44311) (not b!1044209) (not bm!44314) (not b!1044221) (not d!126357) (not b_next!21111) (not bm!44334) (not b!1044207) (not b!1044188) (not b!1044130) (not b!1044158) (not b!1044161) (not d!126349) (not mapNonEmpty!38879) (not b_lambda!16213) (not b_lambda!16207) (not b!1044170) (not b!1044247) b_and!33683 (not b!1044078) (not b!1044220) (not b!1044228) (not bm!44326) (not b!1044235) (not b!1044080) (not d!126343) (not bm!44318) (not b_lambda!16215) (not b!1044182) (not bm!44338) (not b!1044166) (not b!1044233) (not d!126341) (not d!126367) (not d!126371) tp_is_empty!24831 (not b!1044165) (not bm!44310) (not b!1044185) (not b!1044240) (not d!126369) (not b!1044167) (not bm!44321) (not b!1044068) (not bm!44332) (not b!1044272) (not b!1044145) (not b!1044151))
(check-sat b_and!33683 (not b_next!21111))
