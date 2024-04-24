; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92006 () Bool)

(assert start!92006)

(declare-fun b!1045619 () Bool)

(declare-fun b_free!21115 () Bool)

(declare-fun b_next!21115 () Bool)

(assert (=> b!1045619 (= b_free!21115 (not b_next!21115))))

(declare-fun tp!74592 () Bool)

(declare-fun b_and!33695 () Bool)

(assert (=> b!1045619 (= tp!74592 b_and!33695)))

(declare-fun tp_is_empty!24835 () Bool)

(declare-fun e!592661 () Bool)

(declare-datatypes ((V!37987 0))(
  ( (V!37988 (val!12468 Int)) )
))
(declare-datatypes ((ValueCell!11714 0))(
  ( (ValueCellFull!11714 (v!15056 V!37987)) (EmptyCell!11714) )
))
(declare-datatypes ((array!65887 0))(
  ( (array!65888 (arr!31687 (Array (_ BitVec 32) (_ BitVec 64))) (size!32223 (_ BitVec 32))) )
))
(declare-datatypes ((array!65889 0))(
  ( (array!65890 (arr!31688 (Array (_ BitVec 32) ValueCell!11714)) (size!32224 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6022 0))(
  ( (LongMapFixedSize!6023 (defaultEntry!6399 Int) (mask!30566 (_ BitVec 32)) (extraKeys!6127 (_ BitVec 32)) (zeroValue!6233 V!37987) (minValue!6233 V!37987) (_size!3066 (_ BitVec 32)) (_keys!11701 array!65887) (_values!6422 array!65889) (_vacant!3066 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6022)

(declare-fun e!592662 () Bool)

(declare-fun array_inv!24487 (array!65887) Bool)

(declare-fun array_inv!24488 (array!65889) Bool)

(assert (=> b!1045619 (= e!592662 (and tp!74592 tp_is_empty!24835 (array_inv!24487 (_keys!11701 thiss!1427)) (array_inv!24488 (_values!6422 thiss!1427)) e!592661))))

(declare-fun b!1045620 () Bool)

(declare-fun e!592660 () Bool)

(declare-fun e!592666 () Bool)

(assert (=> b!1045620 (= e!592660 (not e!592666))))

(declare-fun res!696074 () Bool)

(assert (=> b!1045620 (=> res!696074 e!592666)))

(declare-datatypes ((Unit!34111 0))(
  ( (Unit!34112) )
))
(declare-datatypes ((tuple2!15752 0))(
  ( (tuple2!15753 (_1!7887 Unit!34111) (_2!7887 LongMapFixedSize!6022)) )
))
(declare-fun lt!461126 () tuple2!15752)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15754 0))(
  ( (tuple2!15755 (_1!7888 (_ BitVec 64)) (_2!7888 V!37987)) )
))
(declare-datatypes ((List!21993 0))(
  ( (Nil!21990) (Cons!21989 (h!23206 tuple2!15754) (t!31221 List!21993)) )
))
(declare-datatypes ((ListLongMap!13781 0))(
  ( (ListLongMap!13782 (toList!6906 List!21993)) )
))
(declare-fun contains!6096 (ListLongMap!13781 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3950 (array!65887 array!65889 (_ BitVec 32) (_ BitVec 32) V!37987 V!37987 (_ BitVec 32) Int) ListLongMap!13781)

(assert (=> b!1045620 (= res!696074 (not (contains!6096 (getCurrentListMap!3950 (_keys!11701 (_2!7887 lt!461126)) (_values!6422 (_2!7887 lt!461126)) (mask!30566 (_2!7887 lt!461126)) (extraKeys!6127 (_2!7887 lt!461126)) (zeroValue!6233 (_2!7887 lt!461126)) (minValue!6233 (_2!7887 lt!461126)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7887 lt!461126))) key!909)))))

(declare-fun lt!461130 () array!65887)

(declare-fun lt!461128 () array!65889)

(declare-fun Unit!34113 () Unit!34111)

(declare-fun Unit!34114 () Unit!34111)

(assert (=> b!1045620 (= lt!461126 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3066 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15753 Unit!34113 (LongMapFixedSize!6023 (defaultEntry!6399 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) (bvsub (_size!3066 thiss!1427) #b00000000000000000000000000000001) lt!461130 lt!461128 (bvadd #b00000000000000000000000000000001 (_vacant!3066 thiss!1427)))) (tuple2!15753 Unit!34114 (LongMapFixedSize!6023 (defaultEntry!6399 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) (bvsub (_size!3066 thiss!1427) #b00000000000000000000000000000001) lt!461130 lt!461128 (_vacant!3066 thiss!1427)))))))

(declare-fun -!529 (ListLongMap!13781 (_ BitVec 64)) ListLongMap!13781)

(assert (=> b!1045620 (= (-!529 (getCurrentListMap!3950 (_keys!11701 thiss!1427) (_values!6422 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)) key!909) (getCurrentListMap!3950 lt!461130 lt!461128 (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9795 0))(
  ( (MissingZero!9795 (index!41551 (_ BitVec 32))) (Found!9795 (index!41552 (_ BitVec 32))) (Intermediate!9795 (undefined!10607 Bool) (index!41553 (_ BitVec 32)) (x!93231 (_ BitVec 32))) (Undefined!9795) (MissingVacant!9795 (index!41554 (_ BitVec 32))) )
))
(declare-fun lt!461125 () SeekEntryResult!9795)

(declare-fun dynLambda!2021 (Int (_ BitVec 64)) V!37987)

(assert (=> b!1045620 (= lt!461128 (array!65890 (store (arr!31688 (_values!6422 thiss!1427)) (index!41552 lt!461125) (ValueCellFull!11714 (dynLambda!2021 (defaultEntry!6399 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32224 (_values!6422 thiss!1427))))))

(declare-fun lt!461129 () Unit!34111)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!51 (array!65887 array!65889 (_ BitVec 32) (_ BitVec 32) V!37987 V!37987 (_ BitVec 32) (_ BitVec 64) Int) Unit!34111)

(assert (=> b!1045620 (= lt!461129 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!51 (_keys!11701 thiss!1427) (_values!6422 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) (index!41552 lt!461125) key!909 (defaultEntry!6399 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1045620 (not (arrayContainsKey!0 lt!461130 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!461124 () Unit!34111)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65887 (_ BitVec 32) (_ BitVec 64)) Unit!34111)

(assert (=> b!1045620 (= lt!461124 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11701 thiss!1427) (index!41552 lt!461125) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65887 (_ BitVec 32)) Bool)

(assert (=> b!1045620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461130 (mask!30566 thiss!1427))))

(declare-fun lt!461131 () Unit!34111)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65887 (_ BitVec 32) (_ BitVec 32)) Unit!34111)

(assert (=> b!1045620 (= lt!461131 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11701 thiss!1427) (index!41552 lt!461125) (mask!30566 thiss!1427)))))

(declare-datatypes ((List!21994 0))(
  ( (Nil!21991) (Cons!21990 (h!23207 (_ BitVec 64)) (t!31222 List!21994)) )
))
(declare-fun arrayNoDuplicates!0 (array!65887 (_ BitVec 32) List!21994) Bool)

(assert (=> b!1045620 (arrayNoDuplicates!0 lt!461130 #b00000000000000000000000000000000 Nil!21991)))

(declare-fun lt!461123 () Unit!34111)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65887 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21994) Unit!34111)

(assert (=> b!1045620 (= lt!461123 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11701 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41552 lt!461125) #b00000000000000000000000000000000 Nil!21991))))

(declare-fun arrayCountValidKeys!0 (array!65887 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1045620 (= (arrayCountValidKeys!0 lt!461130 #b00000000000000000000000000000000 (size!32223 (_keys!11701 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11701 thiss!1427) #b00000000000000000000000000000000 (size!32223 (_keys!11701 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1045620 (= lt!461130 (array!65888 (store (arr!31687 (_keys!11701 thiss!1427)) (index!41552 lt!461125) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32223 (_keys!11701 thiss!1427))))))

(declare-fun lt!461127 () Unit!34111)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65887 (_ BitVec 32) (_ BitVec 64)) Unit!34111)

(assert (=> b!1045620 (= lt!461127 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11701 thiss!1427) (index!41552 lt!461125) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045621 () Bool)

(declare-fun e!592663 () Bool)

(assert (=> b!1045621 (= e!592663 tp_is_empty!24835)))

(declare-fun b!1045622 () Bool)

(declare-fun e!592665 () Bool)

(assert (=> b!1045622 (= e!592665 e!592660)))

(declare-fun res!696072 () Bool)

(assert (=> b!1045622 (=> (not res!696072) (not e!592660))))

(get-info :version)

(assert (=> b!1045622 (= res!696072 ((_ is Found!9795) lt!461125))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65887 (_ BitVec 32)) SeekEntryResult!9795)

(assert (=> b!1045622 (= lt!461125 (seekEntry!0 key!909 (_keys!11701 thiss!1427) (mask!30566 thiss!1427)))))

(declare-fun b!1045623 () Bool)

(declare-fun res!696071 () Bool)

(assert (=> b!1045623 (=> (not res!696071) (not e!592665))))

(assert (=> b!1045623 (= res!696071 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1045624 () Bool)

(assert (=> b!1045624 (= e!592666 (= (size!32224 (_values!6422 (_2!7887 lt!461126))) (bvadd #b00000000000000000000000000000001 (mask!30566 (_2!7887 lt!461126)))))))

(declare-fun mapIsEmpty!38882 () Bool)

(declare-fun mapRes!38882 () Bool)

(assert (=> mapIsEmpty!38882 mapRes!38882))

(declare-fun b!1045625 () Bool)

(declare-fun res!696075 () Bool)

(assert (=> b!1045625 (=> res!696075 e!592666)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1045625 (= res!696075 (not (validMask!0 (mask!30566 (_2!7887 lt!461126)))))))

(declare-fun mapNonEmpty!38882 () Bool)

(declare-fun tp!74591 () Bool)

(declare-fun e!592659 () Bool)

(assert (=> mapNonEmpty!38882 (= mapRes!38882 (and tp!74591 e!592659))))

(declare-fun mapKey!38882 () (_ BitVec 32))

(declare-fun mapRest!38882 () (Array (_ BitVec 32) ValueCell!11714))

(declare-fun mapValue!38882 () ValueCell!11714)

(assert (=> mapNonEmpty!38882 (= (arr!31688 (_values!6422 thiss!1427)) (store mapRest!38882 mapKey!38882 mapValue!38882))))

(declare-fun b!1045626 () Bool)

(assert (=> b!1045626 (= e!592659 tp_is_empty!24835)))

(declare-fun res!696073 () Bool)

(assert (=> start!92006 (=> (not res!696073) (not e!592665))))

(declare-fun valid!2266 (LongMapFixedSize!6022) Bool)

(assert (=> start!92006 (= res!696073 (valid!2266 thiss!1427))))

(assert (=> start!92006 e!592665))

(assert (=> start!92006 e!592662))

(assert (=> start!92006 true))

(declare-fun b!1045618 () Bool)

(assert (=> b!1045618 (= e!592661 (and e!592663 mapRes!38882))))

(declare-fun condMapEmpty!38882 () Bool)

(declare-fun mapDefault!38882 () ValueCell!11714)

(assert (=> b!1045618 (= condMapEmpty!38882 (= (arr!31688 (_values!6422 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11714)) mapDefault!38882)))))

(assert (= (and start!92006 res!696073) b!1045623))

(assert (= (and b!1045623 res!696071) b!1045622))

(assert (= (and b!1045622 res!696072) b!1045620))

(assert (= (and b!1045620 (not res!696074)) b!1045625))

(assert (= (and b!1045625 (not res!696075)) b!1045624))

(assert (= (and b!1045618 condMapEmpty!38882) mapIsEmpty!38882))

(assert (= (and b!1045618 (not condMapEmpty!38882)) mapNonEmpty!38882))

(assert (= (and mapNonEmpty!38882 ((_ is ValueCellFull!11714) mapValue!38882)) b!1045626))

(assert (= (and b!1045618 ((_ is ValueCellFull!11714) mapDefault!38882)) b!1045621))

(assert (= b!1045619 b!1045618))

(assert (= start!92006 b!1045619))

(declare-fun b_lambda!16229 () Bool)

(assert (=> (not b_lambda!16229) (not b!1045620)))

(declare-fun t!31220 () Bool)

(declare-fun tb!7049 () Bool)

(assert (=> (and b!1045619 (= (defaultEntry!6399 thiss!1427) (defaultEntry!6399 thiss!1427)) t!31220) tb!7049))

(declare-fun result!14531 () Bool)

(assert (=> tb!7049 (= result!14531 tp_is_empty!24835)))

(assert (=> b!1045620 t!31220))

(declare-fun b_and!33697 () Bool)

(assert (= b_and!33695 (and (=> t!31220 result!14531) b_and!33697)))

(declare-fun m!965365 () Bool)

(assert (=> b!1045625 m!965365))

(declare-fun m!965367 () Bool)

(assert (=> b!1045620 m!965367))

(declare-fun m!965369 () Bool)

(assert (=> b!1045620 m!965369))

(declare-fun m!965371 () Bool)

(assert (=> b!1045620 m!965371))

(declare-fun m!965373 () Bool)

(assert (=> b!1045620 m!965373))

(declare-fun m!965375 () Bool)

(assert (=> b!1045620 m!965375))

(declare-fun m!965377 () Bool)

(assert (=> b!1045620 m!965377))

(declare-fun m!965379 () Bool)

(assert (=> b!1045620 m!965379))

(declare-fun m!965381 () Bool)

(assert (=> b!1045620 m!965381))

(declare-fun m!965383 () Bool)

(assert (=> b!1045620 m!965383))

(declare-fun m!965385 () Bool)

(assert (=> b!1045620 m!965385))

(declare-fun m!965387 () Bool)

(assert (=> b!1045620 m!965387))

(declare-fun m!965389 () Bool)

(assert (=> b!1045620 m!965389))

(assert (=> b!1045620 m!965367))

(declare-fun m!965391 () Bool)

(assert (=> b!1045620 m!965391))

(assert (=> b!1045620 m!965381))

(declare-fun m!965393 () Bool)

(assert (=> b!1045620 m!965393))

(declare-fun m!965395 () Bool)

(assert (=> b!1045620 m!965395))

(declare-fun m!965397 () Bool)

(assert (=> b!1045620 m!965397))

(declare-fun m!965399 () Bool)

(assert (=> b!1045620 m!965399))

(declare-fun m!965401 () Bool)

(assert (=> b!1045620 m!965401))

(declare-fun m!965403 () Bool)

(assert (=> start!92006 m!965403))

(declare-fun m!965405 () Bool)

(assert (=> mapNonEmpty!38882 m!965405))

(declare-fun m!965407 () Bool)

(assert (=> b!1045619 m!965407))

(declare-fun m!965409 () Bool)

(assert (=> b!1045619 m!965409))

(declare-fun m!965411 () Bool)

(assert (=> b!1045622 m!965411))

(check-sat tp_is_empty!24835 b_and!33697 (not b!1045620) (not b_next!21115) (not b!1045622) (not mapNonEmpty!38882) (not b!1045625) (not b!1045619) (not b_lambda!16229) (not start!92006))
(check-sat b_and!33697 (not b_next!21115))
(get-model)

(declare-fun b_lambda!16235 () Bool)

(assert (= b_lambda!16229 (or (and b!1045619 b_free!21115) b_lambda!16235)))

(check-sat tp_is_empty!24835 b_and!33697 (not b!1045620) (not b_next!21115) (not b!1045622) (not mapNonEmpty!38882) (not b!1045625) (not b!1045619) (not b_lambda!16235) (not start!92006))
(check-sat b_and!33697 (not b_next!21115))
(get-model)

(declare-fun d!126837 () Bool)

(declare-fun lt!461195 () SeekEntryResult!9795)

(assert (=> d!126837 (and (or ((_ is MissingVacant!9795) lt!461195) (not ((_ is Found!9795) lt!461195)) (and (bvsge (index!41552 lt!461195) #b00000000000000000000000000000000) (bvslt (index!41552 lt!461195) (size!32223 (_keys!11701 thiss!1427))))) (not ((_ is MissingVacant!9795) lt!461195)) (or (not ((_ is Found!9795) lt!461195)) (= (select (arr!31687 (_keys!11701 thiss!1427)) (index!41552 lt!461195)) key!909)))))

(declare-fun e!592723 () SeekEntryResult!9795)

(assert (=> d!126837 (= lt!461195 e!592723)))

(declare-fun c!106500 () Bool)

(declare-fun lt!461197 () SeekEntryResult!9795)

(assert (=> d!126837 (= c!106500 (and ((_ is Intermediate!9795) lt!461197) (undefined!10607 lt!461197)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65887 (_ BitVec 32)) SeekEntryResult!9795)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126837 (= lt!461197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30566 thiss!1427)) key!909 (_keys!11701 thiss!1427) (mask!30566 thiss!1427)))))

(assert (=> d!126837 (validMask!0 (mask!30566 thiss!1427))))

(assert (=> d!126837 (= (seekEntry!0 key!909 (_keys!11701 thiss!1427) (mask!30566 thiss!1427)) lt!461195)))

(declare-fun b!1045699 () Bool)

(declare-fun e!592722 () SeekEntryResult!9795)

(assert (=> b!1045699 (= e!592723 e!592722)))

(declare-fun lt!461194 () (_ BitVec 64))

(assert (=> b!1045699 (= lt!461194 (select (arr!31687 (_keys!11701 thiss!1427)) (index!41553 lt!461197)))))

(declare-fun c!106501 () Bool)

(assert (=> b!1045699 (= c!106501 (= lt!461194 key!909))))

(declare-fun b!1045700 () Bool)

(assert (=> b!1045700 (= e!592722 (Found!9795 (index!41553 lt!461197)))))

(declare-fun b!1045701 () Bool)

(declare-fun e!592721 () SeekEntryResult!9795)

(assert (=> b!1045701 (= e!592721 (MissingZero!9795 (index!41553 lt!461197)))))

(declare-fun b!1045702 () Bool)

(assert (=> b!1045702 (= e!592723 Undefined!9795)))

(declare-fun b!1045703 () Bool)

(declare-fun c!106499 () Bool)

(assert (=> b!1045703 (= c!106499 (= lt!461194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1045703 (= e!592722 e!592721)))

(declare-fun b!1045704 () Bool)

(declare-fun lt!461196 () SeekEntryResult!9795)

(assert (=> b!1045704 (= e!592721 (ite ((_ is MissingVacant!9795) lt!461196) (MissingZero!9795 (index!41554 lt!461196)) lt!461196))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65887 (_ BitVec 32)) SeekEntryResult!9795)

(assert (=> b!1045704 (= lt!461196 (seekKeyOrZeroReturnVacant!0 (x!93231 lt!461197) (index!41553 lt!461197) (index!41553 lt!461197) key!909 (_keys!11701 thiss!1427) (mask!30566 thiss!1427)))))

(assert (= (and d!126837 c!106500) b!1045702))

(assert (= (and d!126837 (not c!106500)) b!1045699))

(assert (= (and b!1045699 c!106501) b!1045700))

(assert (= (and b!1045699 (not c!106501)) b!1045703))

(assert (= (and b!1045703 c!106499) b!1045701))

(assert (= (and b!1045703 (not c!106499)) b!1045704))

(declare-fun m!965509 () Bool)

(assert (=> d!126837 m!965509))

(declare-fun m!965511 () Bool)

(assert (=> d!126837 m!965511))

(assert (=> d!126837 m!965511))

(declare-fun m!965513 () Bool)

(assert (=> d!126837 m!965513))

(declare-fun m!965515 () Bool)

(assert (=> d!126837 m!965515))

(declare-fun m!965517 () Bool)

(assert (=> b!1045699 m!965517))

(declare-fun m!965519 () Bool)

(assert (=> b!1045704 m!965519))

(assert (=> b!1045622 d!126837))

(declare-fun d!126839 () Bool)

(declare-fun res!696112 () Bool)

(declare-fun e!592726 () Bool)

(assert (=> d!126839 (=> (not res!696112) (not e!592726))))

(declare-fun simpleValid!449 (LongMapFixedSize!6022) Bool)

(assert (=> d!126839 (= res!696112 (simpleValid!449 thiss!1427))))

(assert (=> d!126839 (= (valid!2266 thiss!1427) e!592726)))

(declare-fun b!1045711 () Bool)

(declare-fun res!696113 () Bool)

(assert (=> b!1045711 (=> (not res!696113) (not e!592726))))

(assert (=> b!1045711 (= res!696113 (= (arrayCountValidKeys!0 (_keys!11701 thiss!1427) #b00000000000000000000000000000000 (size!32223 (_keys!11701 thiss!1427))) (_size!3066 thiss!1427)))))

(declare-fun b!1045712 () Bool)

(declare-fun res!696114 () Bool)

(assert (=> b!1045712 (=> (not res!696114) (not e!592726))))

(assert (=> b!1045712 (= res!696114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11701 thiss!1427) (mask!30566 thiss!1427)))))

(declare-fun b!1045713 () Bool)

(assert (=> b!1045713 (= e!592726 (arrayNoDuplicates!0 (_keys!11701 thiss!1427) #b00000000000000000000000000000000 Nil!21991))))

(assert (= (and d!126839 res!696112) b!1045711))

(assert (= (and b!1045711 res!696113) b!1045712))

(assert (= (and b!1045712 res!696114) b!1045713))

(declare-fun m!965521 () Bool)

(assert (=> d!126839 m!965521))

(assert (=> b!1045711 m!965379))

(declare-fun m!965523 () Bool)

(assert (=> b!1045712 m!965523))

(declare-fun m!965525 () Bool)

(assert (=> b!1045713 m!965525))

(assert (=> start!92006 d!126839))

(declare-fun d!126841 () Bool)

(assert (=> d!126841 (= (validMask!0 (mask!30566 (_2!7887 lt!461126))) (and (or (= (mask!30566 (_2!7887 lt!461126)) #b00000000000000000000000000000111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000000000000000000000001111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000000000000000000000011111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000000000000000000000111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000000000000000000001111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000000000000000000011111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000000000000000000111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000000000000000001111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000000000000000011111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000000000000000111111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000000000000001111111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000000000000011111111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000000000000111111111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000000000001111111111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000000000011111111111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000000000111111111111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000000001111111111111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000000011111111111111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000000111111111111111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000001111111111111111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000011111111111111111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000000111111111111111111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000001111111111111111111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000011111111111111111111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00000111111111111111111111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00001111111111111111111111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00011111111111111111111111111111) (= (mask!30566 (_2!7887 lt!461126)) #b00111111111111111111111111111111)) (bvsle (mask!30566 (_2!7887 lt!461126)) #b00111111111111111111111111111111)))))

(assert (=> b!1045625 d!126841))

(declare-fun d!126843 () Bool)

(declare-fun e!592729 () Bool)

(assert (=> d!126843 e!592729))

(declare-fun res!696117 () Bool)

(assert (=> d!126843 (=> (not res!696117) (not e!592729))))

(assert (=> d!126843 (= res!696117 (and (bvsge (index!41552 lt!461125) #b00000000000000000000000000000000) (bvslt (index!41552 lt!461125) (size!32223 (_keys!11701 thiss!1427)))))))

(declare-fun lt!461200 () Unit!34111)

(declare-fun choose!53 (array!65887 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21994) Unit!34111)

(assert (=> d!126843 (= lt!461200 (choose!53 (_keys!11701 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41552 lt!461125) #b00000000000000000000000000000000 Nil!21991))))

(assert (=> d!126843 (bvslt (size!32223 (_keys!11701 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126843 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11701 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41552 lt!461125) #b00000000000000000000000000000000 Nil!21991) lt!461200)))

(declare-fun b!1045716 () Bool)

(assert (=> b!1045716 (= e!592729 (arrayNoDuplicates!0 (array!65888 (store (arr!31687 (_keys!11701 thiss!1427)) (index!41552 lt!461125) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32223 (_keys!11701 thiss!1427))) #b00000000000000000000000000000000 Nil!21991))))

(assert (= (and d!126843 res!696117) b!1045716))

(declare-fun m!965527 () Bool)

(assert (=> d!126843 m!965527))

(assert (=> b!1045716 m!965371))

(declare-fun m!965529 () Bool)

(assert (=> b!1045716 m!965529))

(assert (=> b!1045620 d!126843))

(declare-fun b!1045759 () Bool)

(declare-fun res!696141 () Bool)

(declare-fun e!592764 () Bool)

(assert (=> b!1045759 (=> (not res!696141) (not e!592764))))

(declare-fun e!592761 () Bool)

(assert (=> b!1045759 (= res!696141 e!592761)))

(declare-fun c!106514 () Bool)

(assert (=> b!1045759 (= c!106514 (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1045760 () Bool)

(declare-fun e!592765 () Bool)

(declare-fun lt!461265 () ListLongMap!13781)

(declare-fun apply!920 (ListLongMap!13781 (_ BitVec 64)) V!37987)

(assert (=> b!1045760 (= e!592765 (= (apply!920 lt!461265 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6233 thiss!1427)))))

(declare-fun b!1045761 () Bool)

(declare-fun e!592758 () ListLongMap!13781)

(declare-fun call!44428 () ListLongMap!13781)

(assert (=> b!1045761 (= e!592758 call!44428)))

(declare-fun b!1045762 () Bool)

(declare-fun e!592766 () Bool)

(assert (=> b!1045762 (= e!592764 e!592766)))

(declare-fun c!106515 () Bool)

(assert (=> b!1045762 (= c!106515 (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44422 () Bool)

(declare-fun call!44430 () ListLongMap!13781)

(declare-fun call!44431 () ListLongMap!13781)

(assert (=> bm!44422 (= call!44430 call!44431)))

(declare-fun b!1045763 () Bool)

(declare-fun e!592760 () Bool)

(assert (=> b!1045763 (= e!592760 (= (apply!920 lt!461265 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6233 thiss!1427)))))

(declare-fun b!1045764 () Bool)

(declare-fun e!592759 () Bool)

(declare-fun e!592756 () Bool)

(assert (=> b!1045764 (= e!592759 e!592756)))

(declare-fun res!696138 () Bool)

(assert (=> b!1045764 (=> (not res!696138) (not e!592756))))

(assert (=> b!1045764 (= res!696138 (contains!6096 lt!461265 (select (arr!31687 (_keys!11701 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1045764 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32223 (_keys!11701 thiss!1427))))))

(declare-fun bm!44423 () Bool)

(declare-fun call!44429 () ListLongMap!13781)

(declare-fun c!106519 () Bool)

(declare-fun c!106516 () Bool)

(declare-fun call!44426 () ListLongMap!13781)

(declare-fun +!3131 (ListLongMap!13781 tuple2!15754) ListLongMap!13781)

(assert (=> bm!44423 (= call!44431 (+!3131 (ite c!106516 call!44429 (ite c!106519 call!44426 call!44428)) (ite (or c!106516 c!106519) (tuple2!15755 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6233 thiss!1427)) (tuple2!15755 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6233 thiss!1427)))))))

(declare-fun b!1045765 () Bool)

(declare-fun e!592767 () Unit!34111)

(declare-fun Unit!34123 () Unit!34111)

(assert (=> b!1045765 (= e!592767 Unit!34123)))

(declare-fun b!1045766 () Bool)

(declare-fun call!44425 () Bool)

(assert (=> b!1045766 (= e!592766 (not call!44425))))

(declare-fun b!1045767 () Bool)

(declare-fun lt!461245 () Unit!34111)

(assert (=> b!1045767 (= e!592767 lt!461245)))

(declare-fun lt!461252 () ListLongMap!13781)

(declare-fun getCurrentListMapNoExtraKeys!3571 (array!65887 array!65889 (_ BitVec 32) (_ BitVec 32) V!37987 V!37987 (_ BitVec 32) Int) ListLongMap!13781)

(assert (=> b!1045767 (= lt!461252 (getCurrentListMapNoExtraKeys!3571 (_keys!11701 thiss!1427) (_values!6422 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun lt!461263 () (_ BitVec 64))

(assert (=> b!1045767 (= lt!461263 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461251 () (_ BitVec 64))

(assert (=> b!1045767 (= lt!461251 (select (arr!31687 (_keys!11701 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461259 () Unit!34111)

(declare-fun addStillContains!630 (ListLongMap!13781 (_ BitVec 64) V!37987 (_ BitVec 64)) Unit!34111)

(assert (=> b!1045767 (= lt!461259 (addStillContains!630 lt!461252 lt!461263 (zeroValue!6233 thiss!1427) lt!461251))))

(assert (=> b!1045767 (contains!6096 (+!3131 lt!461252 (tuple2!15755 lt!461263 (zeroValue!6233 thiss!1427))) lt!461251)))

(declare-fun lt!461256 () Unit!34111)

(assert (=> b!1045767 (= lt!461256 lt!461259)))

(declare-fun lt!461246 () ListLongMap!13781)

(assert (=> b!1045767 (= lt!461246 (getCurrentListMapNoExtraKeys!3571 (_keys!11701 thiss!1427) (_values!6422 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun lt!461250 () (_ BitVec 64))

(assert (=> b!1045767 (= lt!461250 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461260 () (_ BitVec 64))

(assert (=> b!1045767 (= lt!461260 (select (arr!31687 (_keys!11701 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461248 () Unit!34111)

(declare-fun addApplyDifferent!486 (ListLongMap!13781 (_ BitVec 64) V!37987 (_ BitVec 64)) Unit!34111)

(assert (=> b!1045767 (= lt!461248 (addApplyDifferent!486 lt!461246 lt!461250 (minValue!6233 thiss!1427) lt!461260))))

(assert (=> b!1045767 (= (apply!920 (+!3131 lt!461246 (tuple2!15755 lt!461250 (minValue!6233 thiss!1427))) lt!461260) (apply!920 lt!461246 lt!461260))))

(declare-fun lt!461255 () Unit!34111)

(assert (=> b!1045767 (= lt!461255 lt!461248)))

(declare-fun lt!461249 () ListLongMap!13781)

(assert (=> b!1045767 (= lt!461249 (getCurrentListMapNoExtraKeys!3571 (_keys!11701 thiss!1427) (_values!6422 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun lt!461261 () (_ BitVec 64))

(assert (=> b!1045767 (= lt!461261 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461254 () (_ BitVec 64))

(assert (=> b!1045767 (= lt!461254 (select (arr!31687 (_keys!11701 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461262 () Unit!34111)

(assert (=> b!1045767 (= lt!461262 (addApplyDifferent!486 lt!461249 lt!461261 (zeroValue!6233 thiss!1427) lt!461254))))

(assert (=> b!1045767 (= (apply!920 (+!3131 lt!461249 (tuple2!15755 lt!461261 (zeroValue!6233 thiss!1427))) lt!461254) (apply!920 lt!461249 lt!461254))))

(declare-fun lt!461266 () Unit!34111)

(assert (=> b!1045767 (= lt!461266 lt!461262)))

(declare-fun lt!461258 () ListLongMap!13781)

(assert (=> b!1045767 (= lt!461258 (getCurrentListMapNoExtraKeys!3571 (_keys!11701 thiss!1427) (_values!6422 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun lt!461264 () (_ BitVec 64))

(assert (=> b!1045767 (= lt!461264 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461247 () (_ BitVec 64))

(assert (=> b!1045767 (= lt!461247 (select (arr!31687 (_keys!11701 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045767 (= lt!461245 (addApplyDifferent!486 lt!461258 lt!461264 (minValue!6233 thiss!1427) lt!461247))))

(assert (=> b!1045767 (= (apply!920 (+!3131 lt!461258 (tuple2!15755 lt!461264 (minValue!6233 thiss!1427))) lt!461247) (apply!920 lt!461258 lt!461247))))

(declare-fun b!1045768 () Bool)

(assert (=> b!1045768 (= e!592758 call!44430)))

(declare-fun b!1045769 () Bool)

(declare-fun get!16579 (ValueCell!11714 V!37987) V!37987)

(assert (=> b!1045769 (= e!592756 (= (apply!920 lt!461265 (select (arr!31687 (_keys!11701 thiss!1427)) #b00000000000000000000000000000000)) (get!16579 (select (arr!31688 (_values!6422 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2021 (defaultEntry!6399 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045769 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32224 (_values!6422 thiss!1427))))))

(assert (=> b!1045769 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32223 (_keys!11701 thiss!1427))))))

(declare-fun b!1045770 () Bool)

(assert (=> b!1045770 (= e!592766 e!592760)))

(declare-fun res!696143 () Bool)

(assert (=> b!1045770 (= res!696143 call!44425)))

(assert (=> b!1045770 (=> (not res!696143) (not e!592760))))

(declare-fun b!1045771 () Bool)

(declare-fun e!592763 () ListLongMap!13781)

(assert (=> b!1045771 (= e!592763 call!44430)))

(declare-fun b!1045772 () Bool)

(declare-fun e!592757 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1045772 (= e!592757 (validKeyInArray!0 (select (arr!31687 (_keys!11701 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44424 () Bool)

(declare-fun call!44427 () Bool)

(assert (=> bm!44424 (= call!44427 (contains!6096 lt!461265 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!126845 () Bool)

(assert (=> d!126845 e!592764))

(declare-fun res!696140 () Bool)

(assert (=> d!126845 (=> (not res!696140) (not e!592764))))

(assert (=> d!126845 (= res!696140 (or (bvsge #b00000000000000000000000000000000 (size!32223 (_keys!11701 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32223 (_keys!11701 thiss!1427))))))))

(declare-fun lt!461253 () ListLongMap!13781)

(assert (=> d!126845 (= lt!461265 lt!461253)))

(declare-fun lt!461257 () Unit!34111)

(assert (=> d!126845 (= lt!461257 e!592767)))

(declare-fun c!106517 () Bool)

(declare-fun e!592768 () Bool)

(assert (=> d!126845 (= c!106517 e!592768)))

(declare-fun res!696144 () Bool)

(assert (=> d!126845 (=> (not res!696144) (not e!592768))))

(assert (=> d!126845 (= res!696144 (bvslt #b00000000000000000000000000000000 (size!32223 (_keys!11701 thiss!1427))))))

(declare-fun e!592762 () ListLongMap!13781)

(assert (=> d!126845 (= lt!461253 e!592762)))

(assert (=> d!126845 (= c!106516 (and (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126845 (validMask!0 (mask!30566 thiss!1427))))

(assert (=> d!126845 (= (getCurrentListMap!3950 (_keys!11701 thiss!1427) (_values!6422 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)) lt!461265)))

(declare-fun bm!44425 () Bool)

(assert (=> bm!44425 (= call!44425 (contains!6096 lt!461265 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045773 () Bool)

(assert (=> b!1045773 (= e!592761 (not call!44427))))

(declare-fun bm!44426 () Bool)

(assert (=> bm!44426 (= call!44428 call!44426)))

(declare-fun bm!44427 () Bool)

(assert (=> bm!44427 (= call!44426 call!44429)))

(declare-fun b!1045774 () Bool)

(assert (=> b!1045774 (= e!592762 e!592763)))

(assert (=> b!1045774 (= c!106519 (and (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045775 () Bool)

(assert (=> b!1045775 (= e!592768 (validKeyInArray!0 (select (arr!31687 (_keys!11701 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1045776 () Bool)

(declare-fun res!696137 () Bool)

(assert (=> b!1045776 (=> (not res!696137) (not e!592764))))

(assert (=> b!1045776 (= res!696137 e!592759)))

(declare-fun res!696142 () Bool)

(assert (=> b!1045776 (=> res!696142 e!592759)))

(assert (=> b!1045776 (= res!696142 (not e!592757))))

(declare-fun res!696139 () Bool)

(assert (=> b!1045776 (=> (not res!696139) (not e!592757))))

(assert (=> b!1045776 (= res!696139 (bvslt #b00000000000000000000000000000000 (size!32223 (_keys!11701 thiss!1427))))))

(declare-fun b!1045777 () Bool)

(assert (=> b!1045777 (= e!592761 e!592765)))

(declare-fun res!696136 () Bool)

(assert (=> b!1045777 (= res!696136 call!44427)))

(assert (=> b!1045777 (=> (not res!696136) (not e!592765))))

(declare-fun b!1045778 () Bool)

(declare-fun c!106518 () Bool)

(assert (=> b!1045778 (= c!106518 (and (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1045778 (= e!592763 e!592758)))

(declare-fun bm!44428 () Bool)

(assert (=> bm!44428 (= call!44429 (getCurrentListMapNoExtraKeys!3571 (_keys!11701 thiss!1427) (_values!6422 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun b!1045779 () Bool)

(assert (=> b!1045779 (= e!592762 (+!3131 call!44431 (tuple2!15755 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6233 thiss!1427))))))

(assert (= (and d!126845 c!106516) b!1045779))

(assert (= (and d!126845 (not c!106516)) b!1045774))

(assert (= (and b!1045774 c!106519) b!1045771))

(assert (= (and b!1045774 (not c!106519)) b!1045778))

(assert (= (and b!1045778 c!106518) b!1045768))

(assert (= (and b!1045778 (not c!106518)) b!1045761))

(assert (= (or b!1045768 b!1045761) bm!44426))

(assert (= (or b!1045771 bm!44426) bm!44427))

(assert (= (or b!1045771 b!1045768) bm!44422))

(assert (= (or b!1045779 bm!44427) bm!44428))

(assert (= (or b!1045779 bm!44422) bm!44423))

(assert (= (and d!126845 res!696144) b!1045775))

(assert (= (and d!126845 c!106517) b!1045767))

(assert (= (and d!126845 (not c!106517)) b!1045765))

(assert (= (and d!126845 res!696140) b!1045776))

(assert (= (and b!1045776 res!696139) b!1045772))

(assert (= (and b!1045776 (not res!696142)) b!1045764))

(assert (= (and b!1045764 res!696138) b!1045769))

(assert (= (and b!1045776 res!696137) b!1045759))

(assert (= (and b!1045759 c!106514) b!1045777))

(assert (= (and b!1045759 (not c!106514)) b!1045773))

(assert (= (and b!1045777 res!696136) b!1045760))

(assert (= (or b!1045777 b!1045773) bm!44424))

(assert (= (and b!1045759 res!696141) b!1045762))

(assert (= (and b!1045762 c!106515) b!1045770))

(assert (= (and b!1045762 (not c!106515)) b!1045766))

(assert (= (and b!1045770 res!696143) b!1045763))

(assert (= (or b!1045770 b!1045766) bm!44425))

(declare-fun b_lambda!16237 () Bool)

(assert (=> (not b_lambda!16237) (not b!1045769)))

(assert (=> b!1045769 t!31220))

(declare-fun b_and!33707 () Bool)

(assert (= b_and!33697 (and (=> t!31220 result!14531) b_and!33707)))

(assert (=> d!126845 m!965515))

(declare-fun m!965531 () Bool)

(assert (=> b!1045764 m!965531))

(assert (=> b!1045764 m!965531))

(declare-fun m!965533 () Bool)

(assert (=> b!1045764 m!965533))

(declare-fun m!965535 () Bool)

(assert (=> bm!44428 m!965535))

(assert (=> b!1045775 m!965531))

(assert (=> b!1045775 m!965531))

(declare-fun m!965537 () Bool)

(assert (=> b!1045775 m!965537))

(declare-fun m!965539 () Bool)

(assert (=> b!1045760 m!965539))

(assert (=> b!1045772 m!965531))

(assert (=> b!1045772 m!965531))

(assert (=> b!1045772 m!965537))

(declare-fun m!965541 () Bool)

(assert (=> bm!44424 m!965541))

(declare-fun m!965543 () Bool)

(assert (=> b!1045767 m!965543))

(declare-fun m!965545 () Bool)

(assert (=> b!1045767 m!965545))

(declare-fun m!965547 () Bool)

(assert (=> b!1045767 m!965547))

(declare-fun m!965549 () Bool)

(assert (=> b!1045767 m!965549))

(declare-fun m!965551 () Bool)

(assert (=> b!1045767 m!965551))

(declare-fun m!965553 () Bool)

(assert (=> b!1045767 m!965553))

(declare-fun m!965555 () Bool)

(assert (=> b!1045767 m!965555))

(declare-fun m!965557 () Bool)

(assert (=> b!1045767 m!965557))

(assert (=> b!1045767 m!965555))

(declare-fun m!965559 () Bool)

(assert (=> b!1045767 m!965559))

(assert (=> b!1045767 m!965559))

(declare-fun m!965561 () Bool)

(assert (=> b!1045767 m!965561))

(assert (=> b!1045767 m!965545))

(declare-fun m!965563 () Bool)

(assert (=> b!1045767 m!965563))

(assert (=> b!1045767 m!965535))

(assert (=> b!1045767 m!965551))

(declare-fun m!965565 () Bool)

(assert (=> b!1045767 m!965565))

(assert (=> b!1045767 m!965531))

(declare-fun m!965567 () Bool)

(assert (=> b!1045767 m!965567))

(declare-fun m!965569 () Bool)

(assert (=> b!1045767 m!965569))

(declare-fun m!965571 () Bool)

(assert (=> b!1045767 m!965571))

(declare-fun m!965573 () Bool)

(assert (=> bm!44423 m!965573))

(declare-fun m!965575 () Bool)

(assert (=> b!1045763 m!965575))

(assert (=> b!1045769 m!965401))

(assert (=> b!1045769 m!965531))

(declare-fun m!965577 () Bool)

(assert (=> b!1045769 m!965577))

(declare-fun m!965579 () Bool)

(assert (=> b!1045769 m!965579))

(assert (=> b!1045769 m!965401))

(declare-fun m!965581 () Bool)

(assert (=> b!1045769 m!965581))

(assert (=> b!1045769 m!965531))

(assert (=> b!1045769 m!965579))

(declare-fun m!965583 () Bool)

(assert (=> b!1045779 m!965583))

(declare-fun m!965585 () Bool)

(assert (=> bm!44425 m!965585))

(assert (=> b!1045620 d!126845))

(declare-fun d!126847 () Bool)

(declare-fun lt!461269 () ListLongMap!13781)

(assert (=> d!126847 (not (contains!6096 lt!461269 key!909))))

(declare-fun removeStrictlySorted!60 (List!21993 (_ BitVec 64)) List!21993)

(assert (=> d!126847 (= lt!461269 (ListLongMap!13782 (removeStrictlySorted!60 (toList!6906 (getCurrentListMap!3950 (_keys!11701 thiss!1427) (_values!6422 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427))) key!909)))))

(assert (=> d!126847 (= (-!529 (getCurrentListMap!3950 (_keys!11701 thiss!1427) (_values!6422 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)) key!909) lt!461269)))

(declare-fun bs!30535 () Bool)

(assert (= bs!30535 d!126847))

(declare-fun m!965587 () Bool)

(assert (=> bs!30535 m!965587))

(declare-fun m!965589 () Bool)

(assert (=> bs!30535 m!965589))

(assert (=> b!1045620 d!126847))

(declare-fun b!1045788 () Bool)

(declare-fun res!696154 () Bool)

(declare-fun e!592773 () Bool)

(assert (=> b!1045788 (=> (not res!696154) (not e!592773))))

(assert (=> b!1045788 (= res!696154 (validKeyInArray!0 (select (arr!31687 (_keys!11701 thiss!1427)) (index!41552 lt!461125))))))

(declare-fun b!1045791 () Bool)

(declare-fun e!592774 () Bool)

(assert (=> b!1045791 (= e!592774 (= (arrayCountValidKeys!0 (array!65888 (store (arr!31687 (_keys!11701 thiss!1427)) (index!41552 lt!461125) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32223 (_keys!11701 thiss!1427))) #b00000000000000000000000000000000 (size!32223 (_keys!11701 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11701 thiss!1427) #b00000000000000000000000000000000 (size!32223 (_keys!11701 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1045790 () Bool)

(assert (=> b!1045790 (= e!592773 (bvslt (size!32223 (_keys!11701 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1045789 () Bool)

(declare-fun res!696156 () Bool)

(assert (=> b!1045789 (=> (not res!696156) (not e!592773))))

(assert (=> b!1045789 (= res!696156 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!126849 () Bool)

(assert (=> d!126849 e!592774))

(declare-fun res!696153 () Bool)

(assert (=> d!126849 (=> (not res!696153) (not e!592774))))

(assert (=> d!126849 (= res!696153 (and (bvsge (index!41552 lt!461125) #b00000000000000000000000000000000) (bvslt (index!41552 lt!461125) (size!32223 (_keys!11701 thiss!1427)))))))

(declare-fun lt!461272 () Unit!34111)

(declare-fun choose!82 (array!65887 (_ BitVec 32) (_ BitVec 64)) Unit!34111)

(assert (=> d!126849 (= lt!461272 (choose!82 (_keys!11701 thiss!1427) (index!41552 lt!461125) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126849 e!592773))

(declare-fun res!696155 () Bool)

(assert (=> d!126849 (=> (not res!696155) (not e!592773))))

(assert (=> d!126849 (= res!696155 (and (bvsge (index!41552 lt!461125) #b00000000000000000000000000000000) (bvslt (index!41552 lt!461125) (size!32223 (_keys!11701 thiss!1427)))))))

(assert (=> d!126849 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11701 thiss!1427) (index!41552 lt!461125) #b1000000000000000000000000000000000000000000000000000000000000000) lt!461272)))

(assert (= (and d!126849 res!696155) b!1045788))

(assert (= (and b!1045788 res!696154) b!1045789))

(assert (= (and b!1045789 res!696156) b!1045790))

(assert (= (and d!126849 res!696153) b!1045791))

(declare-fun m!965591 () Bool)

(assert (=> b!1045788 m!965591))

(assert (=> b!1045788 m!965591))

(declare-fun m!965593 () Bool)

(assert (=> b!1045788 m!965593))

(assert (=> b!1045791 m!965371))

(declare-fun m!965595 () Bool)

(assert (=> b!1045791 m!965595))

(assert (=> b!1045791 m!965379))

(declare-fun m!965597 () Bool)

(assert (=> b!1045789 m!965597))

(declare-fun m!965599 () Bool)

(assert (=> d!126849 m!965599))

(assert (=> b!1045620 d!126849))

(declare-fun b!1045802 () Bool)

(declare-fun e!592785 () Bool)

(declare-fun contains!6099 (List!21994 (_ BitVec 64)) Bool)

(assert (=> b!1045802 (= e!592785 (contains!6099 Nil!21991 (select (arr!31687 lt!461130) #b00000000000000000000000000000000)))))

(declare-fun b!1045803 () Bool)

(declare-fun e!592786 () Bool)

(declare-fun call!44434 () Bool)

(assert (=> b!1045803 (= e!592786 call!44434)))

(declare-fun d!126851 () Bool)

(declare-fun res!696164 () Bool)

(declare-fun e!592783 () Bool)

(assert (=> d!126851 (=> res!696164 e!592783)))

(assert (=> d!126851 (= res!696164 (bvsge #b00000000000000000000000000000000 (size!32223 lt!461130)))))

(assert (=> d!126851 (= (arrayNoDuplicates!0 lt!461130 #b00000000000000000000000000000000 Nil!21991) e!592783)))

(declare-fun bm!44431 () Bool)

(declare-fun c!106522 () Bool)

(assert (=> bm!44431 (= call!44434 (arrayNoDuplicates!0 lt!461130 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106522 (Cons!21990 (select (arr!31687 lt!461130) #b00000000000000000000000000000000) Nil!21991) Nil!21991)))))

(declare-fun b!1045804 () Bool)

(assert (=> b!1045804 (= e!592786 call!44434)))

(declare-fun b!1045805 () Bool)

(declare-fun e!592784 () Bool)

(assert (=> b!1045805 (= e!592783 e!592784)))

(declare-fun res!696165 () Bool)

(assert (=> b!1045805 (=> (not res!696165) (not e!592784))))

(assert (=> b!1045805 (= res!696165 (not e!592785))))

(declare-fun res!696163 () Bool)

(assert (=> b!1045805 (=> (not res!696163) (not e!592785))))

(assert (=> b!1045805 (= res!696163 (validKeyInArray!0 (select (arr!31687 lt!461130) #b00000000000000000000000000000000)))))

(declare-fun b!1045806 () Bool)

(assert (=> b!1045806 (= e!592784 e!592786)))

(assert (=> b!1045806 (= c!106522 (validKeyInArray!0 (select (arr!31687 lt!461130) #b00000000000000000000000000000000)))))

(assert (= (and d!126851 (not res!696164)) b!1045805))

(assert (= (and b!1045805 res!696163) b!1045802))

(assert (= (and b!1045805 res!696165) b!1045806))

(assert (= (and b!1045806 c!106522) b!1045804))

(assert (= (and b!1045806 (not c!106522)) b!1045803))

(assert (= (or b!1045804 b!1045803) bm!44431))

(declare-fun m!965601 () Bool)

(assert (=> b!1045802 m!965601))

(assert (=> b!1045802 m!965601))

(declare-fun m!965603 () Bool)

(assert (=> b!1045802 m!965603))

(assert (=> bm!44431 m!965601))

(declare-fun m!965605 () Bool)

(assert (=> bm!44431 m!965605))

(assert (=> b!1045805 m!965601))

(assert (=> b!1045805 m!965601))

(declare-fun m!965607 () Bool)

(assert (=> b!1045805 m!965607))

(assert (=> b!1045806 m!965601))

(assert (=> b!1045806 m!965601))

(assert (=> b!1045806 m!965607))

(assert (=> b!1045620 d!126851))

(declare-fun b!1045815 () Bool)

(declare-fun e!592793 () Bool)

(declare-fun call!44437 () Bool)

(assert (=> b!1045815 (= e!592793 call!44437)))

(declare-fun b!1045816 () Bool)

(declare-fun e!592795 () Bool)

(assert (=> b!1045816 (= e!592795 e!592793)))

(declare-fun c!106525 () Bool)

(assert (=> b!1045816 (= c!106525 (validKeyInArray!0 (select (arr!31687 lt!461130) #b00000000000000000000000000000000)))))

(declare-fun bm!44434 () Bool)

(assert (=> bm!44434 (= call!44437 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!461130 (mask!30566 thiss!1427)))))

(declare-fun b!1045818 () Bool)

(declare-fun e!592794 () Bool)

(assert (=> b!1045818 (= e!592793 e!592794)))

(declare-fun lt!461280 () (_ BitVec 64))

(assert (=> b!1045818 (= lt!461280 (select (arr!31687 lt!461130) #b00000000000000000000000000000000))))

(declare-fun lt!461279 () Unit!34111)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65887 (_ BitVec 64) (_ BitVec 32)) Unit!34111)

(assert (=> b!1045818 (= lt!461279 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!461130 lt!461280 #b00000000000000000000000000000000))))

(assert (=> b!1045818 (arrayContainsKey!0 lt!461130 lt!461280 #b00000000000000000000000000000000)))

(declare-fun lt!461281 () Unit!34111)

(assert (=> b!1045818 (= lt!461281 lt!461279)))

(declare-fun res!696171 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65887 (_ BitVec 32)) SeekEntryResult!9795)

(assert (=> b!1045818 (= res!696171 (= (seekEntryOrOpen!0 (select (arr!31687 lt!461130) #b00000000000000000000000000000000) lt!461130 (mask!30566 thiss!1427)) (Found!9795 #b00000000000000000000000000000000)))))

(assert (=> b!1045818 (=> (not res!696171) (not e!592794))))

(declare-fun b!1045817 () Bool)

(assert (=> b!1045817 (= e!592794 call!44437)))

(declare-fun d!126853 () Bool)

(declare-fun res!696170 () Bool)

(assert (=> d!126853 (=> res!696170 e!592795)))

(assert (=> d!126853 (= res!696170 (bvsge #b00000000000000000000000000000000 (size!32223 lt!461130)))))

(assert (=> d!126853 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461130 (mask!30566 thiss!1427)) e!592795)))

(assert (= (and d!126853 (not res!696170)) b!1045816))

(assert (= (and b!1045816 c!106525) b!1045818))

(assert (= (and b!1045816 (not c!106525)) b!1045815))

(assert (= (and b!1045818 res!696171) b!1045817))

(assert (= (or b!1045817 b!1045815) bm!44434))

(assert (=> b!1045816 m!965601))

(assert (=> b!1045816 m!965601))

(assert (=> b!1045816 m!965607))

(declare-fun m!965609 () Bool)

(assert (=> bm!44434 m!965609))

(assert (=> b!1045818 m!965601))

(declare-fun m!965611 () Bool)

(assert (=> b!1045818 m!965611))

(declare-fun m!965613 () Bool)

(assert (=> b!1045818 m!965613))

(assert (=> b!1045818 m!965601))

(declare-fun m!965615 () Bool)

(assert (=> b!1045818 m!965615))

(assert (=> b!1045620 d!126853))

(declare-fun b!1045819 () Bool)

(declare-fun res!696177 () Bool)

(declare-fun e!592804 () Bool)

(assert (=> b!1045819 (=> (not res!696177) (not e!592804))))

(declare-fun e!592801 () Bool)

(assert (=> b!1045819 (= res!696177 e!592801)))

(declare-fun c!106526 () Bool)

(assert (=> b!1045819 (= c!106526 (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1045820 () Bool)

(declare-fun e!592805 () Bool)

(declare-fun lt!461302 () ListLongMap!13781)

(assert (=> b!1045820 (= e!592805 (= (apply!920 lt!461302 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6233 thiss!1427)))))

(declare-fun b!1045821 () Bool)

(declare-fun e!592798 () ListLongMap!13781)

(declare-fun call!44441 () ListLongMap!13781)

(assert (=> b!1045821 (= e!592798 call!44441)))

(declare-fun b!1045822 () Bool)

(declare-fun e!592806 () Bool)

(assert (=> b!1045822 (= e!592804 e!592806)))

(declare-fun c!106527 () Bool)

(assert (=> b!1045822 (= c!106527 (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44435 () Bool)

(declare-fun call!44443 () ListLongMap!13781)

(declare-fun call!44444 () ListLongMap!13781)

(assert (=> bm!44435 (= call!44443 call!44444)))

(declare-fun b!1045823 () Bool)

(declare-fun e!592800 () Bool)

(assert (=> b!1045823 (= e!592800 (= (apply!920 lt!461302 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6233 thiss!1427)))))

(declare-fun b!1045824 () Bool)

(declare-fun e!592799 () Bool)

(declare-fun e!592796 () Bool)

(assert (=> b!1045824 (= e!592799 e!592796)))

(declare-fun res!696174 () Bool)

(assert (=> b!1045824 (=> (not res!696174) (not e!592796))))

(assert (=> b!1045824 (= res!696174 (contains!6096 lt!461302 (select (arr!31687 lt!461130) #b00000000000000000000000000000000)))))

(assert (=> b!1045824 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32223 lt!461130)))))

(declare-fun call!44442 () ListLongMap!13781)

(declare-fun call!44439 () ListLongMap!13781)

(declare-fun bm!44436 () Bool)

(declare-fun c!106528 () Bool)

(declare-fun c!106531 () Bool)

(assert (=> bm!44436 (= call!44444 (+!3131 (ite c!106528 call!44442 (ite c!106531 call!44439 call!44441)) (ite (or c!106528 c!106531) (tuple2!15755 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6233 thiss!1427)) (tuple2!15755 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6233 thiss!1427)))))))

(declare-fun b!1045825 () Bool)

(declare-fun e!592807 () Unit!34111)

(declare-fun Unit!34124 () Unit!34111)

(assert (=> b!1045825 (= e!592807 Unit!34124)))

(declare-fun b!1045826 () Bool)

(declare-fun call!44438 () Bool)

(assert (=> b!1045826 (= e!592806 (not call!44438))))

(declare-fun b!1045827 () Bool)

(declare-fun lt!461282 () Unit!34111)

(assert (=> b!1045827 (= e!592807 lt!461282)))

(declare-fun lt!461289 () ListLongMap!13781)

(assert (=> b!1045827 (= lt!461289 (getCurrentListMapNoExtraKeys!3571 lt!461130 lt!461128 (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun lt!461300 () (_ BitVec 64))

(assert (=> b!1045827 (= lt!461300 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461288 () (_ BitVec 64))

(assert (=> b!1045827 (= lt!461288 (select (arr!31687 lt!461130) #b00000000000000000000000000000000))))

(declare-fun lt!461296 () Unit!34111)

(assert (=> b!1045827 (= lt!461296 (addStillContains!630 lt!461289 lt!461300 (zeroValue!6233 thiss!1427) lt!461288))))

(assert (=> b!1045827 (contains!6096 (+!3131 lt!461289 (tuple2!15755 lt!461300 (zeroValue!6233 thiss!1427))) lt!461288)))

(declare-fun lt!461293 () Unit!34111)

(assert (=> b!1045827 (= lt!461293 lt!461296)))

(declare-fun lt!461283 () ListLongMap!13781)

(assert (=> b!1045827 (= lt!461283 (getCurrentListMapNoExtraKeys!3571 lt!461130 lt!461128 (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun lt!461287 () (_ BitVec 64))

(assert (=> b!1045827 (= lt!461287 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461297 () (_ BitVec 64))

(assert (=> b!1045827 (= lt!461297 (select (arr!31687 lt!461130) #b00000000000000000000000000000000))))

(declare-fun lt!461285 () Unit!34111)

(assert (=> b!1045827 (= lt!461285 (addApplyDifferent!486 lt!461283 lt!461287 (minValue!6233 thiss!1427) lt!461297))))

(assert (=> b!1045827 (= (apply!920 (+!3131 lt!461283 (tuple2!15755 lt!461287 (minValue!6233 thiss!1427))) lt!461297) (apply!920 lt!461283 lt!461297))))

(declare-fun lt!461292 () Unit!34111)

(assert (=> b!1045827 (= lt!461292 lt!461285)))

(declare-fun lt!461286 () ListLongMap!13781)

(assert (=> b!1045827 (= lt!461286 (getCurrentListMapNoExtraKeys!3571 lt!461130 lt!461128 (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun lt!461298 () (_ BitVec 64))

(assert (=> b!1045827 (= lt!461298 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461291 () (_ BitVec 64))

(assert (=> b!1045827 (= lt!461291 (select (arr!31687 lt!461130) #b00000000000000000000000000000000))))

(declare-fun lt!461299 () Unit!34111)

(assert (=> b!1045827 (= lt!461299 (addApplyDifferent!486 lt!461286 lt!461298 (zeroValue!6233 thiss!1427) lt!461291))))

(assert (=> b!1045827 (= (apply!920 (+!3131 lt!461286 (tuple2!15755 lt!461298 (zeroValue!6233 thiss!1427))) lt!461291) (apply!920 lt!461286 lt!461291))))

(declare-fun lt!461303 () Unit!34111)

(assert (=> b!1045827 (= lt!461303 lt!461299)))

(declare-fun lt!461295 () ListLongMap!13781)

(assert (=> b!1045827 (= lt!461295 (getCurrentListMapNoExtraKeys!3571 lt!461130 lt!461128 (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun lt!461301 () (_ BitVec 64))

(assert (=> b!1045827 (= lt!461301 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461284 () (_ BitVec 64))

(assert (=> b!1045827 (= lt!461284 (select (arr!31687 lt!461130) #b00000000000000000000000000000000))))

(assert (=> b!1045827 (= lt!461282 (addApplyDifferent!486 lt!461295 lt!461301 (minValue!6233 thiss!1427) lt!461284))))

(assert (=> b!1045827 (= (apply!920 (+!3131 lt!461295 (tuple2!15755 lt!461301 (minValue!6233 thiss!1427))) lt!461284) (apply!920 lt!461295 lt!461284))))

(declare-fun b!1045828 () Bool)

(assert (=> b!1045828 (= e!592798 call!44443)))

(declare-fun b!1045829 () Bool)

(assert (=> b!1045829 (= e!592796 (= (apply!920 lt!461302 (select (arr!31687 lt!461130) #b00000000000000000000000000000000)) (get!16579 (select (arr!31688 lt!461128) #b00000000000000000000000000000000) (dynLambda!2021 (defaultEntry!6399 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045829 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32224 lt!461128)))))

(assert (=> b!1045829 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32223 lt!461130)))))

(declare-fun b!1045830 () Bool)

(assert (=> b!1045830 (= e!592806 e!592800)))

(declare-fun res!696179 () Bool)

(assert (=> b!1045830 (= res!696179 call!44438)))

(assert (=> b!1045830 (=> (not res!696179) (not e!592800))))

(declare-fun b!1045831 () Bool)

(declare-fun e!592803 () ListLongMap!13781)

(assert (=> b!1045831 (= e!592803 call!44443)))

(declare-fun b!1045832 () Bool)

(declare-fun e!592797 () Bool)

(assert (=> b!1045832 (= e!592797 (validKeyInArray!0 (select (arr!31687 lt!461130) #b00000000000000000000000000000000)))))

(declare-fun bm!44437 () Bool)

(declare-fun call!44440 () Bool)

(assert (=> bm!44437 (= call!44440 (contains!6096 lt!461302 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!126855 () Bool)

(assert (=> d!126855 e!592804))

(declare-fun res!696176 () Bool)

(assert (=> d!126855 (=> (not res!696176) (not e!592804))))

(assert (=> d!126855 (= res!696176 (or (bvsge #b00000000000000000000000000000000 (size!32223 lt!461130)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32223 lt!461130)))))))

(declare-fun lt!461290 () ListLongMap!13781)

(assert (=> d!126855 (= lt!461302 lt!461290)))

(declare-fun lt!461294 () Unit!34111)

(assert (=> d!126855 (= lt!461294 e!592807)))

(declare-fun c!106529 () Bool)

(declare-fun e!592808 () Bool)

(assert (=> d!126855 (= c!106529 e!592808)))

(declare-fun res!696180 () Bool)

(assert (=> d!126855 (=> (not res!696180) (not e!592808))))

(assert (=> d!126855 (= res!696180 (bvslt #b00000000000000000000000000000000 (size!32223 lt!461130)))))

(declare-fun e!592802 () ListLongMap!13781)

(assert (=> d!126855 (= lt!461290 e!592802)))

(assert (=> d!126855 (= c!106528 (and (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126855 (validMask!0 (mask!30566 thiss!1427))))

(assert (=> d!126855 (= (getCurrentListMap!3950 lt!461130 lt!461128 (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)) lt!461302)))

(declare-fun bm!44438 () Bool)

(assert (=> bm!44438 (= call!44438 (contains!6096 lt!461302 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045833 () Bool)

(assert (=> b!1045833 (= e!592801 (not call!44440))))

(declare-fun bm!44439 () Bool)

(assert (=> bm!44439 (= call!44441 call!44439)))

(declare-fun bm!44440 () Bool)

(assert (=> bm!44440 (= call!44439 call!44442)))

(declare-fun b!1045834 () Bool)

(assert (=> b!1045834 (= e!592802 e!592803)))

(assert (=> b!1045834 (= c!106531 (and (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045835 () Bool)

(assert (=> b!1045835 (= e!592808 (validKeyInArray!0 (select (arr!31687 lt!461130) #b00000000000000000000000000000000)))))

(declare-fun b!1045836 () Bool)

(declare-fun res!696173 () Bool)

(assert (=> b!1045836 (=> (not res!696173) (not e!592804))))

(assert (=> b!1045836 (= res!696173 e!592799)))

(declare-fun res!696178 () Bool)

(assert (=> b!1045836 (=> res!696178 e!592799)))

(assert (=> b!1045836 (= res!696178 (not e!592797))))

(declare-fun res!696175 () Bool)

(assert (=> b!1045836 (=> (not res!696175) (not e!592797))))

(assert (=> b!1045836 (= res!696175 (bvslt #b00000000000000000000000000000000 (size!32223 lt!461130)))))

(declare-fun b!1045837 () Bool)

(assert (=> b!1045837 (= e!592801 e!592805)))

(declare-fun res!696172 () Bool)

(assert (=> b!1045837 (= res!696172 call!44440)))

(assert (=> b!1045837 (=> (not res!696172) (not e!592805))))

(declare-fun b!1045838 () Bool)

(declare-fun c!106530 () Bool)

(assert (=> b!1045838 (= c!106530 (and (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1045838 (= e!592803 e!592798)))

(declare-fun bm!44441 () Bool)

(assert (=> bm!44441 (= call!44442 (getCurrentListMapNoExtraKeys!3571 lt!461130 lt!461128 (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun b!1045839 () Bool)

(assert (=> b!1045839 (= e!592802 (+!3131 call!44444 (tuple2!15755 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6233 thiss!1427))))))

(assert (= (and d!126855 c!106528) b!1045839))

(assert (= (and d!126855 (not c!106528)) b!1045834))

(assert (= (and b!1045834 c!106531) b!1045831))

(assert (= (and b!1045834 (not c!106531)) b!1045838))

(assert (= (and b!1045838 c!106530) b!1045828))

(assert (= (and b!1045838 (not c!106530)) b!1045821))

(assert (= (or b!1045828 b!1045821) bm!44439))

(assert (= (or b!1045831 bm!44439) bm!44440))

(assert (= (or b!1045831 b!1045828) bm!44435))

(assert (= (or b!1045839 bm!44440) bm!44441))

(assert (= (or b!1045839 bm!44435) bm!44436))

(assert (= (and d!126855 res!696180) b!1045835))

(assert (= (and d!126855 c!106529) b!1045827))

(assert (= (and d!126855 (not c!106529)) b!1045825))

(assert (= (and d!126855 res!696176) b!1045836))

(assert (= (and b!1045836 res!696175) b!1045832))

(assert (= (and b!1045836 (not res!696178)) b!1045824))

(assert (= (and b!1045824 res!696174) b!1045829))

(assert (= (and b!1045836 res!696173) b!1045819))

(assert (= (and b!1045819 c!106526) b!1045837))

(assert (= (and b!1045819 (not c!106526)) b!1045833))

(assert (= (and b!1045837 res!696172) b!1045820))

(assert (= (or b!1045837 b!1045833) bm!44437))

(assert (= (and b!1045819 res!696177) b!1045822))

(assert (= (and b!1045822 c!106527) b!1045830))

(assert (= (and b!1045822 (not c!106527)) b!1045826))

(assert (= (and b!1045830 res!696179) b!1045823))

(assert (= (or b!1045830 b!1045826) bm!44438))

(declare-fun b_lambda!16239 () Bool)

(assert (=> (not b_lambda!16239) (not b!1045829)))

(assert (=> b!1045829 t!31220))

(declare-fun b_and!33709 () Bool)

(assert (= b_and!33707 (and (=> t!31220 result!14531) b_and!33709)))

(assert (=> d!126855 m!965515))

(assert (=> b!1045824 m!965601))

(assert (=> b!1045824 m!965601))

(declare-fun m!965617 () Bool)

(assert (=> b!1045824 m!965617))

(declare-fun m!965619 () Bool)

(assert (=> bm!44441 m!965619))

(assert (=> b!1045835 m!965601))

(assert (=> b!1045835 m!965601))

(assert (=> b!1045835 m!965607))

(declare-fun m!965621 () Bool)

(assert (=> b!1045820 m!965621))

(assert (=> b!1045832 m!965601))

(assert (=> b!1045832 m!965601))

(assert (=> b!1045832 m!965607))

(declare-fun m!965623 () Bool)

(assert (=> bm!44437 m!965623))

(declare-fun m!965625 () Bool)

(assert (=> b!1045827 m!965625))

(declare-fun m!965627 () Bool)

(assert (=> b!1045827 m!965627))

(declare-fun m!965629 () Bool)

(assert (=> b!1045827 m!965629))

(declare-fun m!965631 () Bool)

(assert (=> b!1045827 m!965631))

(declare-fun m!965633 () Bool)

(assert (=> b!1045827 m!965633))

(declare-fun m!965635 () Bool)

(assert (=> b!1045827 m!965635))

(declare-fun m!965637 () Bool)

(assert (=> b!1045827 m!965637))

(declare-fun m!965639 () Bool)

(assert (=> b!1045827 m!965639))

(assert (=> b!1045827 m!965637))

(declare-fun m!965641 () Bool)

(assert (=> b!1045827 m!965641))

(assert (=> b!1045827 m!965641))

(declare-fun m!965643 () Bool)

(assert (=> b!1045827 m!965643))

(assert (=> b!1045827 m!965627))

(declare-fun m!965645 () Bool)

(assert (=> b!1045827 m!965645))

(assert (=> b!1045827 m!965619))

(assert (=> b!1045827 m!965633))

(declare-fun m!965647 () Bool)

(assert (=> b!1045827 m!965647))

(assert (=> b!1045827 m!965601))

(declare-fun m!965649 () Bool)

(assert (=> b!1045827 m!965649))

(declare-fun m!965651 () Bool)

(assert (=> b!1045827 m!965651))

(declare-fun m!965653 () Bool)

(assert (=> b!1045827 m!965653))

(declare-fun m!965655 () Bool)

(assert (=> bm!44436 m!965655))

(declare-fun m!965657 () Bool)

(assert (=> b!1045823 m!965657))

(assert (=> b!1045829 m!965401))

(assert (=> b!1045829 m!965601))

(declare-fun m!965659 () Bool)

(assert (=> b!1045829 m!965659))

(declare-fun m!965661 () Bool)

(assert (=> b!1045829 m!965661))

(assert (=> b!1045829 m!965401))

(declare-fun m!965663 () Bool)

(assert (=> b!1045829 m!965663))

(assert (=> b!1045829 m!965601))

(assert (=> b!1045829 m!965661))

(declare-fun m!965665 () Bool)

(assert (=> b!1045839 m!965665))

(declare-fun m!965667 () Bool)

(assert (=> bm!44438 m!965667))

(assert (=> b!1045620 d!126855))

(declare-fun d!126857 () Bool)

(declare-fun e!592814 () Bool)

(assert (=> d!126857 e!592814))

(declare-fun res!696183 () Bool)

(assert (=> d!126857 (=> res!696183 e!592814)))

(declare-fun lt!461313 () Bool)

(assert (=> d!126857 (= res!696183 (not lt!461313))))

(declare-fun lt!461315 () Bool)

(assert (=> d!126857 (= lt!461313 lt!461315)))

(declare-fun lt!461312 () Unit!34111)

(declare-fun e!592813 () Unit!34111)

(assert (=> d!126857 (= lt!461312 e!592813)))

(declare-fun c!106534 () Bool)

(assert (=> d!126857 (= c!106534 lt!461315)))

(declare-fun containsKey!568 (List!21993 (_ BitVec 64)) Bool)

(assert (=> d!126857 (= lt!461315 (containsKey!568 (toList!6906 (getCurrentListMap!3950 (_keys!11701 (_2!7887 lt!461126)) (_values!6422 (_2!7887 lt!461126)) (mask!30566 (_2!7887 lt!461126)) (extraKeys!6127 (_2!7887 lt!461126)) (zeroValue!6233 (_2!7887 lt!461126)) (minValue!6233 (_2!7887 lt!461126)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7887 lt!461126)))) key!909))))

(assert (=> d!126857 (= (contains!6096 (getCurrentListMap!3950 (_keys!11701 (_2!7887 lt!461126)) (_values!6422 (_2!7887 lt!461126)) (mask!30566 (_2!7887 lt!461126)) (extraKeys!6127 (_2!7887 lt!461126)) (zeroValue!6233 (_2!7887 lt!461126)) (minValue!6233 (_2!7887 lt!461126)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7887 lt!461126))) key!909) lt!461313)))

(declare-fun b!1045846 () Bool)

(declare-fun lt!461314 () Unit!34111)

(assert (=> b!1045846 (= e!592813 lt!461314)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!399 (List!21993 (_ BitVec 64)) Unit!34111)

(assert (=> b!1045846 (= lt!461314 (lemmaContainsKeyImpliesGetValueByKeyDefined!399 (toList!6906 (getCurrentListMap!3950 (_keys!11701 (_2!7887 lt!461126)) (_values!6422 (_2!7887 lt!461126)) (mask!30566 (_2!7887 lt!461126)) (extraKeys!6127 (_2!7887 lt!461126)) (zeroValue!6233 (_2!7887 lt!461126)) (minValue!6233 (_2!7887 lt!461126)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7887 lt!461126)))) key!909))))

(declare-datatypes ((Option!638 0))(
  ( (Some!637 (v!15059 V!37987)) (None!636) )
))
(declare-fun isDefined!437 (Option!638) Bool)

(declare-fun getValueByKey!587 (List!21993 (_ BitVec 64)) Option!638)

(assert (=> b!1045846 (isDefined!437 (getValueByKey!587 (toList!6906 (getCurrentListMap!3950 (_keys!11701 (_2!7887 lt!461126)) (_values!6422 (_2!7887 lt!461126)) (mask!30566 (_2!7887 lt!461126)) (extraKeys!6127 (_2!7887 lt!461126)) (zeroValue!6233 (_2!7887 lt!461126)) (minValue!6233 (_2!7887 lt!461126)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7887 lt!461126)))) key!909))))

(declare-fun b!1045847 () Bool)

(declare-fun Unit!34125 () Unit!34111)

(assert (=> b!1045847 (= e!592813 Unit!34125)))

(declare-fun b!1045848 () Bool)

(assert (=> b!1045848 (= e!592814 (isDefined!437 (getValueByKey!587 (toList!6906 (getCurrentListMap!3950 (_keys!11701 (_2!7887 lt!461126)) (_values!6422 (_2!7887 lt!461126)) (mask!30566 (_2!7887 lt!461126)) (extraKeys!6127 (_2!7887 lt!461126)) (zeroValue!6233 (_2!7887 lt!461126)) (minValue!6233 (_2!7887 lt!461126)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7887 lt!461126)))) key!909)))))

(assert (= (and d!126857 c!106534) b!1045846))

(assert (= (and d!126857 (not c!106534)) b!1045847))

(assert (= (and d!126857 (not res!696183)) b!1045848))

(declare-fun m!965669 () Bool)

(assert (=> d!126857 m!965669))

(declare-fun m!965671 () Bool)

(assert (=> b!1045846 m!965671))

(declare-fun m!965673 () Bool)

(assert (=> b!1045846 m!965673))

(assert (=> b!1045846 m!965673))

(declare-fun m!965675 () Bool)

(assert (=> b!1045846 m!965675))

(assert (=> b!1045848 m!965673))

(assert (=> b!1045848 m!965673))

(assert (=> b!1045848 m!965675))

(assert (=> b!1045620 d!126857))

(declare-fun d!126859 () Bool)

(declare-fun e!592817 () Bool)

(assert (=> d!126859 e!592817))

(declare-fun res!696186 () Bool)

(assert (=> d!126859 (=> (not res!696186) (not e!592817))))

(assert (=> d!126859 (= res!696186 (and (bvsge (index!41552 lt!461125) #b00000000000000000000000000000000) (bvslt (index!41552 lt!461125) (size!32223 (_keys!11701 thiss!1427)))))))

(declare-fun lt!461318 () Unit!34111)

(declare-fun choose!25 (array!65887 (_ BitVec 32) (_ BitVec 32)) Unit!34111)

(assert (=> d!126859 (= lt!461318 (choose!25 (_keys!11701 thiss!1427) (index!41552 lt!461125) (mask!30566 thiss!1427)))))

(assert (=> d!126859 (validMask!0 (mask!30566 thiss!1427))))

(assert (=> d!126859 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11701 thiss!1427) (index!41552 lt!461125) (mask!30566 thiss!1427)) lt!461318)))

(declare-fun b!1045851 () Bool)

(assert (=> b!1045851 (= e!592817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65888 (store (arr!31687 (_keys!11701 thiss!1427)) (index!41552 lt!461125) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32223 (_keys!11701 thiss!1427))) (mask!30566 thiss!1427)))))

(assert (= (and d!126859 res!696186) b!1045851))

(declare-fun m!965677 () Bool)

(assert (=> d!126859 m!965677))

(assert (=> d!126859 m!965515))

(assert (=> b!1045851 m!965371))

(declare-fun m!965679 () Bool)

(assert (=> b!1045851 m!965679))

(assert (=> b!1045620 d!126859))

(declare-fun d!126861 () Bool)

(declare-fun res!696191 () Bool)

(declare-fun e!592822 () Bool)

(assert (=> d!126861 (=> res!696191 e!592822)))

(assert (=> d!126861 (= res!696191 (= (select (arr!31687 lt!461130) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126861 (= (arrayContainsKey!0 lt!461130 key!909 #b00000000000000000000000000000000) e!592822)))

(declare-fun b!1045856 () Bool)

(declare-fun e!592823 () Bool)

(assert (=> b!1045856 (= e!592822 e!592823)))

(declare-fun res!696192 () Bool)

(assert (=> b!1045856 (=> (not res!696192) (not e!592823))))

(assert (=> b!1045856 (= res!696192 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32223 lt!461130)))))

(declare-fun b!1045857 () Bool)

(assert (=> b!1045857 (= e!592823 (arrayContainsKey!0 lt!461130 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126861 (not res!696191)) b!1045856))

(assert (= (and b!1045856 res!696192) b!1045857))

(assert (=> d!126861 m!965601))

(declare-fun m!965681 () Bool)

(assert (=> b!1045857 m!965681))

(assert (=> b!1045620 d!126861))

(declare-fun b!1045858 () Bool)

(declare-fun res!696198 () Bool)

(declare-fun e!592832 () Bool)

(assert (=> b!1045858 (=> (not res!696198) (not e!592832))))

(declare-fun e!592829 () Bool)

(assert (=> b!1045858 (= res!696198 e!592829)))

(declare-fun c!106535 () Bool)

(assert (=> b!1045858 (= c!106535 (not (= (bvand (extraKeys!6127 (_2!7887 lt!461126)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1045859 () Bool)

(declare-fun e!592833 () Bool)

(declare-fun lt!461339 () ListLongMap!13781)

(assert (=> b!1045859 (= e!592833 (= (apply!920 lt!461339 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6233 (_2!7887 lt!461126))))))

(declare-fun b!1045860 () Bool)

(declare-fun e!592826 () ListLongMap!13781)

(declare-fun call!44448 () ListLongMap!13781)

(assert (=> b!1045860 (= e!592826 call!44448)))

(declare-fun b!1045861 () Bool)

(declare-fun e!592834 () Bool)

(assert (=> b!1045861 (= e!592832 e!592834)))

(declare-fun c!106536 () Bool)

(assert (=> b!1045861 (= c!106536 (not (= (bvand (extraKeys!6127 (_2!7887 lt!461126)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44442 () Bool)

(declare-fun call!44450 () ListLongMap!13781)

(declare-fun call!44451 () ListLongMap!13781)

(assert (=> bm!44442 (= call!44450 call!44451)))

(declare-fun b!1045862 () Bool)

(declare-fun e!592828 () Bool)

(assert (=> b!1045862 (= e!592828 (= (apply!920 lt!461339 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6233 (_2!7887 lt!461126))))))

(declare-fun b!1045863 () Bool)

(declare-fun e!592827 () Bool)

(declare-fun e!592824 () Bool)

(assert (=> b!1045863 (= e!592827 e!592824)))

(declare-fun res!696195 () Bool)

(assert (=> b!1045863 (=> (not res!696195) (not e!592824))))

(assert (=> b!1045863 (= res!696195 (contains!6096 lt!461339 (select (arr!31687 (_keys!11701 (_2!7887 lt!461126))) #b00000000000000000000000000000000)))))

(assert (=> b!1045863 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32223 (_keys!11701 (_2!7887 lt!461126)))))))

(declare-fun call!44446 () ListLongMap!13781)

(declare-fun bm!44443 () Bool)

(declare-fun call!44449 () ListLongMap!13781)

(declare-fun c!106540 () Bool)

(declare-fun c!106537 () Bool)

(assert (=> bm!44443 (= call!44451 (+!3131 (ite c!106537 call!44449 (ite c!106540 call!44446 call!44448)) (ite (or c!106537 c!106540) (tuple2!15755 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6233 (_2!7887 lt!461126))) (tuple2!15755 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6233 (_2!7887 lt!461126))))))))

(declare-fun b!1045864 () Bool)

(declare-fun e!592835 () Unit!34111)

(declare-fun Unit!34126 () Unit!34111)

(assert (=> b!1045864 (= e!592835 Unit!34126)))

(declare-fun b!1045865 () Bool)

(declare-fun call!44445 () Bool)

(assert (=> b!1045865 (= e!592834 (not call!44445))))

(declare-fun b!1045866 () Bool)

(declare-fun lt!461319 () Unit!34111)

(assert (=> b!1045866 (= e!592835 lt!461319)))

(declare-fun lt!461326 () ListLongMap!13781)

(assert (=> b!1045866 (= lt!461326 (getCurrentListMapNoExtraKeys!3571 (_keys!11701 (_2!7887 lt!461126)) (_values!6422 (_2!7887 lt!461126)) (mask!30566 (_2!7887 lt!461126)) (extraKeys!6127 (_2!7887 lt!461126)) (zeroValue!6233 (_2!7887 lt!461126)) (minValue!6233 (_2!7887 lt!461126)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7887 lt!461126))))))

(declare-fun lt!461337 () (_ BitVec 64))

(assert (=> b!1045866 (= lt!461337 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461325 () (_ BitVec 64))

(assert (=> b!1045866 (= lt!461325 (select (arr!31687 (_keys!11701 (_2!7887 lt!461126))) #b00000000000000000000000000000000))))

(declare-fun lt!461333 () Unit!34111)

(assert (=> b!1045866 (= lt!461333 (addStillContains!630 lt!461326 lt!461337 (zeroValue!6233 (_2!7887 lt!461126)) lt!461325))))

(assert (=> b!1045866 (contains!6096 (+!3131 lt!461326 (tuple2!15755 lt!461337 (zeroValue!6233 (_2!7887 lt!461126)))) lt!461325)))

(declare-fun lt!461330 () Unit!34111)

(assert (=> b!1045866 (= lt!461330 lt!461333)))

(declare-fun lt!461320 () ListLongMap!13781)

(assert (=> b!1045866 (= lt!461320 (getCurrentListMapNoExtraKeys!3571 (_keys!11701 (_2!7887 lt!461126)) (_values!6422 (_2!7887 lt!461126)) (mask!30566 (_2!7887 lt!461126)) (extraKeys!6127 (_2!7887 lt!461126)) (zeroValue!6233 (_2!7887 lt!461126)) (minValue!6233 (_2!7887 lt!461126)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7887 lt!461126))))))

(declare-fun lt!461324 () (_ BitVec 64))

(assert (=> b!1045866 (= lt!461324 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461334 () (_ BitVec 64))

(assert (=> b!1045866 (= lt!461334 (select (arr!31687 (_keys!11701 (_2!7887 lt!461126))) #b00000000000000000000000000000000))))

(declare-fun lt!461322 () Unit!34111)

(assert (=> b!1045866 (= lt!461322 (addApplyDifferent!486 lt!461320 lt!461324 (minValue!6233 (_2!7887 lt!461126)) lt!461334))))

(assert (=> b!1045866 (= (apply!920 (+!3131 lt!461320 (tuple2!15755 lt!461324 (minValue!6233 (_2!7887 lt!461126)))) lt!461334) (apply!920 lt!461320 lt!461334))))

(declare-fun lt!461329 () Unit!34111)

(assert (=> b!1045866 (= lt!461329 lt!461322)))

(declare-fun lt!461323 () ListLongMap!13781)

(assert (=> b!1045866 (= lt!461323 (getCurrentListMapNoExtraKeys!3571 (_keys!11701 (_2!7887 lt!461126)) (_values!6422 (_2!7887 lt!461126)) (mask!30566 (_2!7887 lt!461126)) (extraKeys!6127 (_2!7887 lt!461126)) (zeroValue!6233 (_2!7887 lt!461126)) (minValue!6233 (_2!7887 lt!461126)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7887 lt!461126))))))

(declare-fun lt!461335 () (_ BitVec 64))

(assert (=> b!1045866 (= lt!461335 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461328 () (_ BitVec 64))

(assert (=> b!1045866 (= lt!461328 (select (arr!31687 (_keys!11701 (_2!7887 lt!461126))) #b00000000000000000000000000000000))))

(declare-fun lt!461336 () Unit!34111)

(assert (=> b!1045866 (= lt!461336 (addApplyDifferent!486 lt!461323 lt!461335 (zeroValue!6233 (_2!7887 lt!461126)) lt!461328))))

(assert (=> b!1045866 (= (apply!920 (+!3131 lt!461323 (tuple2!15755 lt!461335 (zeroValue!6233 (_2!7887 lt!461126)))) lt!461328) (apply!920 lt!461323 lt!461328))))

(declare-fun lt!461340 () Unit!34111)

(assert (=> b!1045866 (= lt!461340 lt!461336)))

(declare-fun lt!461332 () ListLongMap!13781)

(assert (=> b!1045866 (= lt!461332 (getCurrentListMapNoExtraKeys!3571 (_keys!11701 (_2!7887 lt!461126)) (_values!6422 (_2!7887 lt!461126)) (mask!30566 (_2!7887 lt!461126)) (extraKeys!6127 (_2!7887 lt!461126)) (zeroValue!6233 (_2!7887 lt!461126)) (minValue!6233 (_2!7887 lt!461126)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7887 lt!461126))))))

(declare-fun lt!461338 () (_ BitVec 64))

(assert (=> b!1045866 (= lt!461338 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461321 () (_ BitVec 64))

(assert (=> b!1045866 (= lt!461321 (select (arr!31687 (_keys!11701 (_2!7887 lt!461126))) #b00000000000000000000000000000000))))

(assert (=> b!1045866 (= lt!461319 (addApplyDifferent!486 lt!461332 lt!461338 (minValue!6233 (_2!7887 lt!461126)) lt!461321))))

(assert (=> b!1045866 (= (apply!920 (+!3131 lt!461332 (tuple2!15755 lt!461338 (minValue!6233 (_2!7887 lt!461126)))) lt!461321) (apply!920 lt!461332 lt!461321))))

(declare-fun b!1045867 () Bool)

(assert (=> b!1045867 (= e!592826 call!44450)))

(declare-fun b!1045868 () Bool)

(assert (=> b!1045868 (= e!592824 (= (apply!920 lt!461339 (select (arr!31687 (_keys!11701 (_2!7887 lt!461126))) #b00000000000000000000000000000000)) (get!16579 (select (arr!31688 (_values!6422 (_2!7887 lt!461126))) #b00000000000000000000000000000000) (dynLambda!2021 (defaultEntry!6399 (_2!7887 lt!461126)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045868 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32224 (_values!6422 (_2!7887 lt!461126)))))))

(assert (=> b!1045868 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32223 (_keys!11701 (_2!7887 lt!461126)))))))

(declare-fun b!1045869 () Bool)

(assert (=> b!1045869 (= e!592834 e!592828)))

(declare-fun res!696200 () Bool)

(assert (=> b!1045869 (= res!696200 call!44445)))

(assert (=> b!1045869 (=> (not res!696200) (not e!592828))))

(declare-fun b!1045870 () Bool)

(declare-fun e!592831 () ListLongMap!13781)

(assert (=> b!1045870 (= e!592831 call!44450)))

(declare-fun b!1045871 () Bool)

(declare-fun e!592825 () Bool)

(assert (=> b!1045871 (= e!592825 (validKeyInArray!0 (select (arr!31687 (_keys!11701 (_2!7887 lt!461126))) #b00000000000000000000000000000000)))))

(declare-fun bm!44444 () Bool)

(declare-fun call!44447 () Bool)

(assert (=> bm!44444 (= call!44447 (contains!6096 lt!461339 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!126863 () Bool)

(assert (=> d!126863 e!592832))

(declare-fun res!696197 () Bool)

(assert (=> d!126863 (=> (not res!696197) (not e!592832))))

(assert (=> d!126863 (= res!696197 (or (bvsge #b00000000000000000000000000000000 (size!32223 (_keys!11701 (_2!7887 lt!461126)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32223 (_keys!11701 (_2!7887 lt!461126)))))))))

(declare-fun lt!461327 () ListLongMap!13781)

(assert (=> d!126863 (= lt!461339 lt!461327)))

(declare-fun lt!461331 () Unit!34111)

(assert (=> d!126863 (= lt!461331 e!592835)))

(declare-fun c!106538 () Bool)

(declare-fun e!592836 () Bool)

(assert (=> d!126863 (= c!106538 e!592836)))

(declare-fun res!696201 () Bool)

(assert (=> d!126863 (=> (not res!696201) (not e!592836))))

(assert (=> d!126863 (= res!696201 (bvslt #b00000000000000000000000000000000 (size!32223 (_keys!11701 (_2!7887 lt!461126)))))))

(declare-fun e!592830 () ListLongMap!13781)

(assert (=> d!126863 (= lt!461327 e!592830)))

(assert (=> d!126863 (= c!106537 (and (not (= (bvand (extraKeys!6127 (_2!7887 lt!461126)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6127 (_2!7887 lt!461126)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126863 (validMask!0 (mask!30566 (_2!7887 lt!461126)))))

(assert (=> d!126863 (= (getCurrentListMap!3950 (_keys!11701 (_2!7887 lt!461126)) (_values!6422 (_2!7887 lt!461126)) (mask!30566 (_2!7887 lt!461126)) (extraKeys!6127 (_2!7887 lt!461126)) (zeroValue!6233 (_2!7887 lt!461126)) (minValue!6233 (_2!7887 lt!461126)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7887 lt!461126))) lt!461339)))

(declare-fun bm!44445 () Bool)

(assert (=> bm!44445 (= call!44445 (contains!6096 lt!461339 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045872 () Bool)

(assert (=> b!1045872 (= e!592829 (not call!44447))))

(declare-fun bm!44446 () Bool)

(assert (=> bm!44446 (= call!44448 call!44446)))

(declare-fun bm!44447 () Bool)

(assert (=> bm!44447 (= call!44446 call!44449)))

(declare-fun b!1045873 () Bool)

(assert (=> b!1045873 (= e!592830 e!592831)))

(assert (=> b!1045873 (= c!106540 (and (not (= (bvand (extraKeys!6127 (_2!7887 lt!461126)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6127 (_2!7887 lt!461126)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045874 () Bool)

(assert (=> b!1045874 (= e!592836 (validKeyInArray!0 (select (arr!31687 (_keys!11701 (_2!7887 lt!461126))) #b00000000000000000000000000000000)))))

(declare-fun b!1045875 () Bool)

(declare-fun res!696194 () Bool)

(assert (=> b!1045875 (=> (not res!696194) (not e!592832))))

(assert (=> b!1045875 (= res!696194 e!592827)))

(declare-fun res!696199 () Bool)

(assert (=> b!1045875 (=> res!696199 e!592827)))

(assert (=> b!1045875 (= res!696199 (not e!592825))))

(declare-fun res!696196 () Bool)

(assert (=> b!1045875 (=> (not res!696196) (not e!592825))))

(assert (=> b!1045875 (= res!696196 (bvslt #b00000000000000000000000000000000 (size!32223 (_keys!11701 (_2!7887 lt!461126)))))))

(declare-fun b!1045876 () Bool)

(assert (=> b!1045876 (= e!592829 e!592833)))

(declare-fun res!696193 () Bool)

(assert (=> b!1045876 (= res!696193 call!44447)))

(assert (=> b!1045876 (=> (not res!696193) (not e!592833))))

(declare-fun b!1045877 () Bool)

(declare-fun c!106539 () Bool)

(assert (=> b!1045877 (= c!106539 (and (not (= (bvand (extraKeys!6127 (_2!7887 lt!461126)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6127 (_2!7887 lt!461126)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1045877 (= e!592831 e!592826)))

(declare-fun bm!44448 () Bool)

(assert (=> bm!44448 (= call!44449 (getCurrentListMapNoExtraKeys!3571 (_keys!11701 (_2!7887 lt!461126)) (_values!6422 (_2!7887 lt!461126)) (mask!30566 (_2!7887 lt!461126)) (extraKeys!6127 (_2!7887 lt!461126)) (zeroValue!6233 (_2!7887 lt!461126)) (minValue!6233 (_2!7887 lt!461126)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7887 lt!461126))))))

(declare-fun b!1045878 () Bool)

(assert (=> b!1045878 (= e!592830 (+!3131 call!44451 (tuple2!15755 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6233 (_2!7887 lt!461126)))))))

(assert (= (and d!126863 c!106537) b!1045878))

(assert (= (and d!126863 (not c!106537)) b!1045873))

(assert (= (and b!1045873 c!106540) b!1045870))

(assert (= (and b!1045873 (not c!106540)) b!1045877))

(assert (= (and b!1045877 c!106539) b!1045867))

(assert (= (and b!1045877 (not c!106539)) b!1045860))

(assert (= (or b!1045867 b!1045860) bm!44446))

(assert (= (or b!1045870 bm!44446) bm!44447))

(assert (= (or b!1045870 b!1045867) bm!44442))

(assert (= (or b!1045878 bm!44447) bm!44448))

(assert (= (or b!1045878 bm!44442) bm!44443))

(assert (= (and d!126863 res!696201) b!1045874))

(assert (= (and d!126863 c!106538) b!1045866))

(assert (= (and d!126863 (not c!106538)) b!1045864))

(assert (= (and d!126863 res!696197) b!1045875))

(assert (= (and b!1045875 res!696196) b!1045871))

(assert (= (and b!1045875 (not res!696199)) b!1045863))

(assert (= (and b!1045863 res!696195) b!1045868))

(assert (= (and b!1045875 res!696194) b!1045858))

(assert (= (and b!1045858 c!106535) b!1045876))

(assert (= (and b!1045858 (not c!106535)) b!1045872))

(assert (= (and b!1045876 res!696193) b!1045859))

(assert (= (or b!1045876 b!1045872) bm!44444))

(assert (= (and b!1045858 res!696198) b!1045861))

(assert (= (and b!1045861 c!106536) b!1045869))

(assert (= (and b!1045861 (not c!106536)) b!1045865))

(assert (= (and b!1045869 res!696200) b!1045862))

(assert (= (or b!1045869 b!1045865) bm!44445))

(declare-fun b_lambda!16241 () Bool)

(assert (=> (not b_lambda!16241) (not b!1045868)))

(declare-fun tb!7055 () Bool)

(declare-fun t!31232 () Bool)

(assert (=> (and b!1045619 (= (defaultEntry!6399 thiss!1427) (defaultEntry!6399 (_2!7887 lt!461126))) t!31232) tb!7055))

(declare-fun result!14543 () Bool)

(assert (=> tb!7055 (= result!14543 tp_is_empty!24835)))

(assert (=> b!1045868 t!31232))

(declare-fun b_and!33711 () Bool)

(assert (= b_and!33709 (and (=> t!31232 result!14543) b_and!33711)))

(assert (=> d!126863 m!965365))

(declare-fun m!965683 () Bool)

(assert (=> b!1045863 m!965683))

(assert (=> b!1045863 m!965683))

(declare-fun m!965685 () Bool)

(assert (=> b!1045863 m!965685))

(declare-fun m!965687 () Bool)

(assert (=> bm!44448 m!965687))

(assert (=> b!1045874 m!965683))

(assert (=> b!1045874 m!965683))

(declare-fun m!965689 () Bool)

(assert (=> b!1045874 m!965689))

(declare-fun m!965691 () Bool)

(assert (=> b!1045859 m!965691))

(assert (=> b!1045871 m!965683))

(assert (=> b!1045871 m!965683))

(assert (=> b!1045871 m!965689))

(declare-fun m!965693 () Bool)

(assert (=> bm!44444 m!965693))

(declare-fun m!965695 () Bool)

(assert (=> b!1045866 m!965695))

(declare-fun m!965697 () Bool)

(assert (=> b!1045866 m!965697))

(declare-fun m!965699 () Bool)

(assert (=> b!1045866 m!965699))

(declare-fun m!965701 () Bool)

(assert (=> b!1045866 m!965701))

(declare-fun m!965703 () Bool)

(assert (=> b!1045866 m!965703))

(declare-fun m!965705 () Bool)

(assert (=> b!1045866 m!965705))

(declare-fun m!965707 () Bool)

(assert (=> b!1045866 m!965707))

(declare-fun m!965709 () Bool)

(assert (=> b!1045866 m!965709))

(assert (=> b!1045866 m!965707))

(declare-fun m!965711 () Bool)

(assert (=> b!1045866 m!965711))

(assert (=> b!1045866 m!965711))

(declare-fun m!965713 () Bool)

(assert (=> b!1045866 m!965713))

(assert (=> b!1045866 m!965697))

(declare-fun m!965715 () Bool)

(assert (=> b!1045866 m!965715))

(assert (=> b!1045866 m!965687))

(assert (=> b!1045866 m!965703))

(declare-fun m!965717 () Bool)

(assert (=> b!1045866 m!965717))

(assert (=> b!1045866 m!965683))

(declare-fun m!965719 () Bool)

(assert (=> b!1045866 m!965719))

(declare-fun m!965721 () Bool)

(assert (=> b!1045866 m!965721))

(declare-fun m!965723 () Bool)

(assert (=> b!1045866 m!965723))

(declare-fun m!965725 () Bool)

(assert (=> bm!44443 m!965725))

(declare-fun m!965727 () Bool)

(assert (=> b!1045862 m!965727))

(declare-fun m!965729 () Bool)

(assert (=> b!1045868 m!965729))

(assert (=> b!1045868 m!965683))

(declare-fun m!965731 () Bool)

(assert (=> b!1045868 m!965731))

(declare-fun m!965733 () Bool)

(assert (=> b!1045868 m!965733))

(assert (=> b!1045868 m!965729))

(declare-fun m!965735 () Bool)

(assert (=> b!1045868 m!965735))

(assert (=> b!1045868 m!965683))

(assert (=> b!1045868 m!965733))

(declare-fun m!965737 () Bool)

(assert (=> b!1045878 m!965737))

(declare-fun m!965739 () Bool)

(assert (=> bm!44445 m!965739))

(assert (=> b!1045620 d!126863))

(declare-fun bm!44451 () Bool)

(declare-fun call!44454 () (_ BitVec 32))

(assert (=> bm!44451 (= call!44454 (arrayCountValidKeys!0 lt!461130 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32223 (_keys!11701 thiss!1427))))))

(declare-fun b!1045887 () Bool)

(declare-fun e!592841 () (_ BitVec 32))

(declare-fun e!592842 () (_ BitVec 32))

(assert (=> b!1045887 (= e!592841 e!592842)))

(declare-fun c!106545 () Bool)

(assert (=> b!1045887 (= c!106545 (validKeyInArray!0 (select (arr!31687 lt!461130) #b00000000000000000000000000000000)))))

(declare-fun b!1045888 () Bool)

(assert (=> b!1045888 (= e!592842 call!44454)))

(declare-fun d!126865 () Bool)

(declare-fun lt!461343 () (_ BitVec 32))

(assert (=> d!126865 (and (bvsge lt!461343 #b00000000000000000000000000000000) (bvsle lt!461343 (bvsub (size!32223 lt!461130) #b00000000000000000000000000000000)))))

(assert (=> d!126865 (= lt!461343 e!592841)))

(declare-fun c!106546 () Bool)

(assert (=> d!126865 (= c!106546 (bvsge #b00000000000000000000000000000000 (size!32223 (_keys!11701 thiss!1427))))))

(assert (=> d!126865 (and (bvsle #b00000000000000000000000000000000 (size!32223 (_keys!11701 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32223 (_keys!11701 thiss!1427)) (size!32223 lt!461130)))))

(assert (=> d!126865 (= (arrayCountValidKeys!0 lt!461130 #b00000000000000000000000000000000 (size!32223 (_keys!11701 thiss!1427))) lt!461343)))

(declare-fun b!1045889 () Bool)

(assert (=> b!1045889 (= e!592842 (bvadd #b00000000000000000000000000000001 call!44454))))

(declare-fun b!1045890 () Bool)

(assert (=> b!1045890 (= e!592841 #b00000000000000000000000000000000)))

(assert (= (and d!126865 c!106546) b!1045890))

(assert (= (and d!126865 (not c!106546)) b!1045887))

(assert (= (and b!1045887 c!106545) b!1045889))

(assert (= (and b!1045887 (not c!106545)) b!1045888))

(assert (= (or b!1045889 b!1045888) bm!44451))

(declare-fun m!965741 () Bool)

(assert (=> bm!44451 m!965741))

(assert (=> b!1045887 m!965601))

(assert (=> b!1045887 m!965601))

(assert (=> b!1045887 m!965607))

(assert (=> b!1045620 d!126865))

(declare-fun d!126867 () Bool)

(declare-fun e!592845 () Bool)

(assert (=> d!126867 e!592845))

(declare-fun res!696204 () Bool)

(assert (=> d!126867 (=> (not res!696204) (not e!592845))))

(assert (=> d!126867 (= res!696204 (bvslt (index!41552 lt!461125) (size!32223 (_keys!11701 thiss!1427))))))

(declare-fun lt!461346 () Unit!34111)

(declare-fun choose!121 (array!65887 (_ BitVec 32) (_ BitVec 64)) Unit!34111)

(assert (=> d!126867 (= lt!461346 (choose!121 (_keys!11701 thiss!1427) (index!41552 lt!461125) key!909))))

(assert (=> d!126867 (bvsge (index!41552 lt!461125) #b00000000000000000000000000000000)))

(assert (=> d!126867 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11701 thiss!1427) (index!41552 lt!461125) key!909) lt!461346)))

(declare-fun b!1045893 () Bool)

(assert (=> b!1045893 (= e!592845 (not (arrayContainsKey!0 (array!65888 (store (arr!31687 (_keys!11701 thiss!1427)) (index!41552 lt!461125) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32223 (_keys!11701 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126867 res!696204) b!1045893))

(declare-fun m!965743 () Bool)

(assert (=> d!126867 m!965743))

(assert (=> b!1045893 m!965371))

(declare-fun m!965745 () Bool)

(assert (=> b!1045893 m!965745))

(assert (=> b!1045620 d!126867))

(declare-fun bm!44452 () Bool)

(declare-fun call!44455 () (_ BitVec 32))

(assert (=> bm!44452 (= call!44455 (arrayCountValidKeys!0 (_keys!11701 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32223 (_keys!11701 thiss!1427))))))

(declare-fun b!1045894 () Bool)

(declare-fun e!592846 () (_ BitVec 32))

(declare-fun e!592847 () (_ BitVec 32))

(assert (=> b!1045894 (= e!592846 e!592847)))

(declare-fun c!106547 () Bool)

(assert (=> b!1045894 (= c!106547 (validKeyInArray!0 (select (arr!31687 (_keys!11701 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1045895 () Bool)

(assert (=> b!1045895 (= e!592847 call!44455)))

(declare-fun d!126869 () Bool)

(declare-fun lt!461347 () (_ BitVec 32))

(assert (=> d!126869 (and (bvsge lt!461347 #b00000000000000000000000000000000) (bvsle lt!461347 (bvsub (size!32223 (_keys!11701 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126869 (= lt!461347 e!592846)))

(declare-fun c!106548 () Bool)

(assert (=> d!126869 (= c!106548 (bvsge #b00000000000000000000000000000000 (size!32223 (_keys!11701 thiss!1427))))))

(assert (=> d!126869 (and (bvsle #b00000000000000000000000000000000 (size!32223 (_keys!11701 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32223 (_keys!11701 thiss!1427)) (size!32223 (_keys!11701 thiss!1427))))))

(assert (=> d!126869 (= (arrayCountValidKeys!0 (_keys!11701 thiss!1427) #b00000000000000000000000000000000 (size!32223 (_keys!11701 thiss!1427))) lt!461347)))

(declare-fun b!1045896 () Bool)

(assert (=> b!1045896 (= e!592847 (bvadd #b00000000000000000000000000000001 call!44455))))

(declare-fun b!1045897 () Bool)

(assert (=> b!1045897 (= e!592846 #b00000000000000000000000000000000)))

(assert (= (and d!126869 c!106548) b!1045897))

(assert (= (and d!126869 (not c!106548)) b!1045894))

(assert (= (and b!1045894 c!106547) b!1045896))

(assert (= (and b!1045894 (not c!106547)) b!1045895))

(assert (= (or b!1045896 b!1045895) bm!44452))

(declare-fun m!965747 () Bool)

(assert (=> bm!44452 m!965747))

(assert (=> b!1045894 m!965531))

(assert (=> b!1045894 m!965531))

(assert (=> b!1045894 m!965537))

(assert (=> b!1045620 d!126869))

(declare-fun d!126871 () Bool)

(declare-fun e!592850 () Bool)

(assert (=> d!126871 e!592850))

(declare-fun res!696207 () Bool)

(assert (=> d!126871 (=> (not res!696207) (not e!592850))))

(assert (=> d!126871 (= res!696207 (and (bvsge (index!41552 lt!461125) #b00000000000000000000000000000000) (bvslt (index!41552 lt!461125) (size!32223 (_keys!11701 thiss!1427)))))))

(declare-fun lt!461350 () Unit!34111)

(declare-fun choose!1715 (array!65887 array!65889 (_ BitVec 32) (_ BitVec 32) V!37987 V!37987 (_ BitVec 32) (_ BitVec 64) Int) Unit!34111)

(assert (=> d!126871 (= lt!461350 (choose!1715 (_keys!11701 thiss!1427) (_values!6422 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) (index!41552 lt!461125) key!909 (defaultEntry!6399 thiss!1427)))))

(assert (=> d!126871 (validMask!0 (mask!30566 thiss!1427))))

(assert (=> d!126871 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!51 (_keys!11701 thiss!1427) (_values!6422 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) (index!41552 lt!461125) key!909 (defaultEntry!6399 thiss!1427)) lt!461350)))

(declare-fun b!1045900 () Bool)

(assert (=> b!1045900 (= e!592850 (= (-!529 (getCurrentListMap!3950 (_keys!11701 thiss!1427) (_values!6422 thiss!1427) (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)) key!909) (getCurrentListMap!3950 (array!65888 (store (arr!31687 (_keys!11701 thiss!1427)) (index!41552 lt!461125) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32223 (_keys!11701 thiss!1427))) (array!65890 (store (arr!31688 (_values!6422 thiss!1427)) (index!41552 lt!461125) (ValueCellFull!11714 (dynLambda!2021 (defaultEntry!6399 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32224 (_values!6422 thiss!1427))) (mask!30566 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427))))))

(assert (=> b!1045900 (bvslt (index!41552 lt!461125) (size!32224 (_values!6422 thiss!1427)))))

(assert (= (and d!126871 res!696207) b!1045900))

(declare-fun b_lambda!16243 () Bool)

(assert (=> (not b_lambda!16243) (not b!1045900)))

(assert (=> b!1045900 t!31220))

(declare-fun b_and!33713 () Bool)

(assert (= b_and!33711 (and (=> t!31220 result!14531) b_and!33713)))

(declare-fun m!965749 () Bool)

(assert (=> d!126871 m!965749))

(assert (=> d!126871 m!965515))

(declare-fun m!965751 () Bool)

(assert (=> b!1045900 m!965751))

(assert (=> b!1045900 m!965401))

(assert (=> b!1045900 m!965381))

(assert (=> b!1045900 m!965393))

(assert (=> b!1045900 m!965381))

(assert (=> b!1045900 m!965371))

(assert (=> b!1045900 m!965389))

(assert (=> b!1045620 d!126871))

(declare-fun d!126873 () Bool)

(assert (=> d!126873 (= (array_inv!24487 (_keys!11701 thiss!1427)) (bvsge (size!32223 (_keys!11701 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045619 d!126873))

(declare-fun d!126875 () Bool)

(assert (=> d!126875 (= (array_inv!24488 (_values!6422 thiss!1427)) (bvsge (size!32224 (_values!6422 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045619 d!126875))

(declare-fun b!1045907 () Bool)

(declare-fun e!592855 () Bool)

(assert (=> b!1045907 (= e!592855 tp_is_empty!24835)))

(declare-fun b!1045908 () Bool)

(declare-fun e!592856 () Bool)

(assert (=> b!1045908 (= e!592856 tp_is_empty!24835)))

(declare-fun condMapEmpty!38891 () Bool)

(declare-fun mapDefault!38891 () ValueCell!11714)

(assert (=> mapNonEmpty!38882 (= condMapEmpty!38891 (= mapRest!38882 ((as const (Array (_ BitVec 32) ValueCell!11714)) mapDefault!38891)))))

(declare-fun mapRes!38891 () Bool)

(assert (=> mapNonEmpty!38882 (= tp!74591 (and e!592856 mapRes!38891))))

(declare-fun mapNonEmpty!38891 () Bool)

(declare-fun tp!74607 () Bool)

(assert (=> mapNonEmpty!38891 (= mapRes!38891 (and tp!74607 e!592855))))

(declare-fun mapRest!38891 () (Array (_ BitVec 32) ValueCell!11714))

(declare-fun mapKey!38891 () (_ BitVec 32))

(declare-fun mapValue!38891 () ValueCell!11714)

(assert (=> mapNonEmpty!38891 (= mapRest!38882 (store mapRest!38891 mapKey!38891 mapValue!38891))))

(declare-fun mapIsEmpty!38891 () Bool)

(assert (=> mapIsEmpty!38891 mapRes!38891))

(assert (= (and mapNonEmpty!38882 condMapEmpty!38891) mapIsEmpty!38891))

(assert (= (and mapNonEmpty!38882 (not condMapEmpty!38891)) mapNonEmpty!38891))

(assert (= (and mapNonEmpty!38891 ((_ is ValueCellFull!11714) mapValue!38891)) b!1045907))

(assert (= (and mapNonEmpty!38882 ((_ is ValueCellFull!11714) mapDefault!38891)) b!1045908))

(declare-fun m!965753 () Bool)

(assert (=> mapNonEmpty!38891 m!965753))

(declare-fun b_lambda!16245 () Bool)

(assert (= b_lambda!16239 (or (and b!1045619 b_free!21115) b_lambda!16245)))

(declare-fun b_lambda!16247 () Bool)

(assert (= b_lambda!16243 (or (and b!1045619 b_free!21115) b_lambda!16247)))

(declare-fun b_lambda!16249 () Bool)

(assert (= b_lambda!16237 (or (and b!1045619 b_free!21115) b_lambda!16249)))

(check-sat (not b!1045713) (not bm!44424) (not bm!44428) (not b!1045791) (not b!1045871) (not b!1045893) (not bm!44431) tp_is_empty!24835 (not b!1045894) (not b!1045818) (not b!1045862) (not b!1045820) (not d!126847) (not b!1045846) (not b!1045829) (not b!1045779) (not bm!44434) (not bm!44445) (not b!1045806) (not b!1045802) (not b_lambda!16247) (not bm!44448) (not b_next!21115) (not d!126837) (not d!126839) (not b!1045857) (not b!1045704) (not d!126863) (not b_lambda!16241) (not b!1045832) (not bm!44451) (not b!1045839) (not bm!44444) (not b!1045887) (not d!126857) b_and!33713 (not b!1045788) (not b!1045827) (not b!1045716) (not d!126845) (not b!1045878) (not b!1045859) (not b_lambda!16245) (not b!1045763) (not b!1045851) (not b!1045772) (not b!1045863) (not b_lambda!16249) (not d!126859) (not b!1045805) (not b!1045760) (not b!1045900) (not b!1045712) (not bm!44452) (not bm!44437) (not bm!44441) (not b!1045816) (not d!126871) (not b!1045848) (not bm!44438) (not b!1045874) (not bm!44425) (not b_lambda!16235) (not b!1045824) (not bm!44436) (not mapNonEmpty!38891) (not b!1045711) (not b!1045866) (not b!1045823) (not d!126849) (not b!1045789) (not b!1045868) (not bm!44423) (not b!1045835) (not b!1045769) (not d!126843) (not b!1045775) (not d!126867) (not d!126855) (not b!1045767) (not bm!44443) (not b!1045764))
(check-sat b_and!33713 (not b_next!21115))
