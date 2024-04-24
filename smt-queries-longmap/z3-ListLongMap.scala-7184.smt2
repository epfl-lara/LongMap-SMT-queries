; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92218 () Bool)

(assert start!92218)

(declare-fun b!1047378 () Bool)

(declare-fun b_free!21157 () Bool)

(declare-fun b_next!21157 () Bool)

(assert (=> b!1047378 (= b_free!21157 (not b_next!21157))))

(declare-fun tp!74733 () Bool)

(declare-fun b_and!33819 () Bool)

(assert (=> b!1047378 (= tp!74733 b_and!33819)))

(declare-fun b!1047368 () Bool)

(declare-fun e!593878 () Bool)

(declare-fun e!593875 () Bool)

(assert (=> b!1047368 (= e!593878 (not e!593875))))

(declare-fun res!696930 () Bool)

(assert (=> b!1047368 (=> res!696930 e!593875)))

(declare-datatypes ((V!38043 0))(
  ( (V!38044 (val!12489 Int)) )
))
(declare-datatypes ((ValueCell!11735 0))(
  ( (ValueCellFull!11735 (v!15082 V!38043)) (EmptyCell!11735) )
))
(declare-datatypes ((Unit!34199 0))(
  ( (Unit!34200) )
))
(declare-datatypes ((array!65981 0))(
  ( (array!65982 (arr!31729 (Array (_ BitVec 32) (_ BitVec 64))) (size!32265 (_ BitVec 32))) )
))
(declare-datatypes ((array!65983 0))(
  ( (array!65984 (arr!31730 (Array (_ BitVec 32) ValueCell!11735)) (size!32266 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6064 0))(
  ( (LongMapFixedSize!6065 (defaultEntry!6430 Int) (mask!30631 (_ BitVec 32)) (extraKeys!6158 (_ BitVec 32)) (zeroValue!6264 V!38043) (minValue!6264 V!38043) (_size!3087 (_ BitVec 32)) (_keys!11742 array!65981) (_values!6453 array!65983) (_vacant!3087 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15820 0))(
  ( (tuple2!15821 (_1!7921 Unit!34199) (_2!7921 LongMapFixedSize!6064)) )
))
(declare-fun lt!462517 () tuple2!15820)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15822 0))(
  ( (tuple2!15823 (_1!7922 (_ BitVec 64)) (_2!7922 V!38043)) )
))
(declare-datatypes ((List!22026 0))(
  ( (Nil!22023) (Cons!22022 (h!23239 tuple2!15822) (t!31306 List!22026)) )
))
(declare-datatypes ((ListLongMap!13813 0))(
  ( (ListLongMap!13814 (toList!6922 List!22026)) )
))
(declare-fun contains!6117 (ListLongMap!13813 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3966 (array!65981 array!65983 (_ BitVec 32) (_ BitVec 32) V!38043 V!38043 (_ BitVec 32) Int) ListLongMap!13813)

(assert (=> b!1047368 (= res!696930 (not (contains!6117 (getCurrentListMap!3966 (_keys!11742 (_2!7921 lt!462517)) (_values!6453 (_2!7921 lt!462517)) (mask!30631 (_2!7921 lt!462517)) (extraKeys!6158 (_2!7921 lt!462517)) (zeroValue!6264 (_2!7921 lt!462517)) (minValue!6264 (_2!7921 lt!462517)) #b00000000000000000000000000000000 (defaultEntry!6430 (_2!7921 lt!462517))) key!909)))))

(declare-fun lt!462523 () array!65983)

(declare-fun lt!462526 () array!65981)

(declare-fun thiss!1427 () LongMapFixedSize!6064)

(declare-fun Unit!34201 () Unit!34199)

(declare-fun Unit!34202 () Unit!34199)

(assert (=> b!1047368 (= lt!462517 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3087 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15821 Unit!34201 (LongMapFixedSize!6065 (defaultEntry!6430 thiss!1427) (mask!30631 thiss!1427) (extraKeys!6158 thiss!1427) (zeroValue!6264 thiss!1427) (minValue!6264 thiss!1427) (bvsub (_size!3087 thiss!1427) #b00000000000000000000000000000001) lt!462526 lt!462523 (bvadd #b00000000000000000000000000000001 (_vacant!3087 thiss!1427)))) (tuple2!15821 Unit!34202 (LongMapFixedSize!6065 (defaultEntry!6430 thiss!1427) (mask!30631 thiss!1427) (extraKeys!6158 thiss!1427) (zeroValue!6264 thiss!1427) (minValue!6264 thiss!1427) (bvsub (_size!3087 thiss!1427) #b00000000000000000000000000000001) lt!462526 lt!462523 (_vacant!3087 thiss!1427)))))))

(declare-fun -!545 (ListLongMap!13813 (_ BitVec 64)) ListLongMap!13813)

(assert (=> b!1047368 (= (-!545 (getCurrentListMap!3966 (_keys!11742 thiss!1427) (_values!6453 thiss!1427) (mask!30631 thiss!1427) (extraKeys!6158 thiss!1427) (zeroValue!6264 thiss!1427) (minValue!6264 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6430 thiss!1427)) key!909) (getCurrentListMap!3966 lt!462526 lt!462523 (mask!30631 thiss!1427) (extraKeys!6158 thiss!1427) (zeroValue!6264 thiss!1427) (minValue!6264 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6430 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9813 0))(
  ( (MissingZero!9813 (index!41623 (_ BitVec 32))) (Found!9813 (index!41624 (_ BitVec 32))) (Intermediate!9813 (undefined!10625 Bool) (index!41625 (_ BitVec 32)) (x!93437 (_ BitVec 32))) (Undefined!9813) (MissingVacant!9813 (index!41626 (_ BitVec 32))) )
))
(declare-fun lt!462525 () SeekEntryResult!9813)

(declare-fun dynLambda!2037 (Int (_ BitVec 64)) V!38043)

(assert (=> b!1047368 (= lt!462523 (array!65984 (store (arr!31730 (_values!6453 thiss!1427)) (index!41624 lt!462525) (ValueCellFull!11735 (dynLambda!2037 (defaultEntry!6430 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32266 (_values!6453 thiss!1427))))))

(declare-fun lt!462522 () Unit!34199)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!67 (array!65981 array!65983 (_ BitVec 32) (_ BitVec 32) V!38043 V!38043 (_ BitVec 32) (_ BitVec 64) Int) Unit!34199)

(assert (=> b!1047368 (= lt!462522 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!67 (_keys!11742 thiss!1427) (_values!6453 thiss!1427) (mask!30631 thiss!1427) (extraKeys!6158 thiss!1427) (zeroValue!6264 thiss!1427) (minValue!6264 thiss!1427) (index!41624 lt!462525) key!909 (defaultEntry!6430 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1047368 (not (arrayContainsKey!0 lt!462526 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!462518 () Unit!34199)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65981 (_ BitVec 32) (_ BitVec 64)) Unit!34199)

(assert (=> b!1047368 (= lt!462518 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11742 thiss!1427) (index!41624 lt!462525) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65981 (_ BitVec 32)) Bool)

(assert (=> b!1047368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!462526 (mask!30631 thiss!1427))))

(declare-fun lt!462520 () Unit!34199)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65981 (_ BitVec 32) (_ BitVec 32)) Unit!34199)

(assert (=> b!1047368 (= lt!462520 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11742 thiss!1427) (index!41624 lt!462525) (mask!30631 thiss!1427)))))

(declare-datatypes ((List!22027 0))(
  ( (Nil!22024) (Cons!22023 (h!23240 (_ BitVec 64)) (t!31307 List!22027)) )
))
(declare-fun arrayNoDuplicates!0 (array!65981 (_ BitVec 32) List!22027) Bool)

(assert (=> b!1047368 (arrayNoDuplicates!0 lt!462526 #b00000000000000000000000000000000 Nil!22024)))

(declare-fun lt!462519 () Unit!34199)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65981 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22027) Unit!34199)

(assert (=> b!1047368 (= lt!462519 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11742 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41624 lt!462525) #b00000000000000000000000000000000 Nil!22024))))

(declare-fun arrayCountValidKeys!0 (array!65981 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1047368 (= (arrayCountValidKeys!0 lt!462526 #b00000000000000000000000000000000 (size!32265 (_keys!11742 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11742 thiss!1427) #b00000000000000000000000000000000 (size!32265 (_keys!11742 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1047368 (= lt!462526 (array!65982 (store (arr!31729 (_keys!11742 thiss!1427)) (index!41624 lt!462525) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32265 (_keys!11742 thiss!1427))))))

(declare-fun lt!462524 () Unit!34199)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65981 (_ BitVec 32) (_ BitVec 64)) Unit!34199)

(assert (=> b!1047368 (= lt!462524 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11742 thiss!1427) (index!41624 lt!462525) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1047369 () Bool)

(declare-fun e!593873 () Bool)

(declare-fun tp_is_empty!24877 () Bool)

(assert (=> b!1047369 (= e!593873 tp_is_empty!24877)))

(declare-fun b!1047370 () Bool)

(declare-fun e!593876 () Bool)

(declare-fun mapRes!38960 () Bool)

(assert (=> b!1047370 (= e!593876 (and e!593873 mapRes!38960))))

(declare-fun condMapEmpty!38960 () Bool)

(declare-fun mapDefault!38960 () ValueCell!11735)

(assert (=> b!1047370 (= condMapEmpty!38960 (= (arr!31730 (_values!6453 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11735)) mapDefault!38960)))))

(declare-fun b!1047372 () Bool)

(declare-fun res!696932 () Bool)

(assert (=> b!1047372 (=> res!696932 e!593875)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1047372 (= res!696932 (not (validMask!0 (mask!30631 (_2!7921 lt!462517)))))))

(declare-fun b!1047373 () Bool)

(declare-fun res!696933 () Bool)

(assert (=> b!1047373 (=> res!696933 e!593875)))

(assert (=> b!1047373 (= res!696933 (or (not (= (size!32266 (_values!6453 (_2!7921 lt!462517))) (bvadd #b00000000000000000000000000000001 (mask!30631 (_2!7921 lt!462517))))) (not (= (size!32265 (_keys!11742 (_2!7921 lt!462517))) (size!32266 (_values!6453 (_2!7921 lt!462517))))) (bvslt (mask!30631 (_2!7921 lt!462517)) #b00000000000000000000000000000000) (bvslt (extraKeys!6158 (_2!7921 lt!462517)) #b00000000000000000000000000000000) (bvsgt (extraKeys!6158 (_2!7921 lt!462517)) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!38960 () Bool)

(assert (=> mapIsEmpty!38960 mapRes!38960))

(declare-fun b!1047374 () Bool)

(declare-fun res!696929 () Bool)

(declare-fun e!593877 () Bool)

(assert (=> b!1047374 (=> (not res!696929) (not e!593877))))

(assert (=> b!1047374 (= res!696929 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1047375 () Bool)

(declare-fun res!696931 () Bool)

(assert (=> b!1047375 (=> res!696931 e!593875)))

(assert (=> b!1047375 (= res!696931 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11742 (_2!7921 lt!462517)) (mask!30631 (_2!7921 lt!462517)))))))

(declare-fun b!1047376 () Bool)

(assert (=> b!1047376 (= e!593875 true)))

(declare-fun lt!462521 () Bool)

(assert (=> b!1047376 (= lt!462521 (arrayNoDuplicates!0 (_keys!11742 (_2!7921 lt!462517)) #b00000000000000000000000000000000 Nil!22024))))

(declare-fun b!1047377 () Bool)

(declare-fun e!593879 () Bool)

(assert (=> b!1047377 (= e!593879 tp_is_empty!24877)))

(declare-fun res!696927 () Bool)

(assert (=> start!92218 (=> (not res!696927) (not e!593877))))

(declare-fun valid!2281 (LongMapFixedSize!6064) Bool)

(assert (=> start!92218 (= res!696927 (valid!2281 thiss!1427))))

(assert (=> start!92218 e!593877))

(declare-fun e!593874 () Bool)

(assert (=> start!92218 e!593874))

(assert (=> start!92218 true))

(declare-fun b!1047371 () Bool)

(assert (=> b!1047371 (= e!593877 e!593878)))

(declare-fun res!696928 () Bool)

(assert (=> b!1047371 (=> (not res!696928) (not e!593878))))

(get-info :version)

(assert (=> b!1047371 (= res!696928 ((_ is Found!9813) lt!462525))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65981 (_ BitVec 32)) SeekEntryResult!9813)

(assert (=> b!1047371 (= lt!462525 (seekEntry!0 key!909 (_keys!11742 thiss!1427) (mask!30631 thiss!1427)))))

(declare-fun array_inv!24521 (array!65981) Bool)

(declare-fun array_inv!24522 (array!65983) Bool)

(assert (=> b!1047378 (= e!593874 (and tp!74733 tp_is_empty!24877 (array_inv!24521 (_keys!11742 thiss!1427)) (array_inv!24522 (_values!6453 thiss!1427)) e!593876))))

(declare-fun mapNonEmpty!38960 () Bool)

(declare-fun tp!74732 () Bool)

(assert (=> mapNonEmpty!38960 (= mapRes!38960 (and tp!74732 e!593879))))

(declare-fun mapValue!38960 () ValueCell!11735)

(declare-fun mapKey!38960 () (_ BitVec 32))

(declare-fun mapRest!38960 () (Array (_ BitVec 32) ValueCell!11735))

(assert (=> mapNonEmpty!38960 (= (arr!31730 (_values!6453 thiss!1427)) (store mapRest!38960 mapKey!38960 mapValue!38960))))

(assert (= (and start!92218 res!696927) b!1047374))

(assert (= (and b!1047374 res!696929) b!1047371))

(assert (= (and b!1047371 res!696928) b!1047368))

(assert (= (and b!1047368 (not res!696930)) b!1047372))

(assert (= (and b!1047372 (not res!696932)) b!1047373))

(assert (= (and b!1047373 (not res!696933)) b!1047375))

(assert (= (and b!1047375 (not res!696931)) b!1047376))

(assert (= (and b!1047370 condMapEmpty!38960) mapIsEmpty!38960))

(assert (= (and b!1047370 (not condMapEmpty!38960)) mapNonEmpty!38960))

(assert (= (and mapNonEmpty!38960 ((_ is ValueCellFull!11735) mapValue!38960)) b!1047377))

(assert (= (and b!1047370 ((_ is ValueCellFull!11735) mapDefault!38960)) b!1047369))

(assert (= b!1047378 b!1047370))

(assert (= start!92218 b!1047378))

(declare-fun b_lambda!16351 () Bool)

(assert (=> (not b_lambda!16351) (not b!1047368)))

(declare-fun t!31305 () Bool)

(declare-fun tb!7101 () Bool)

(assert (=> (and b!1047378 (= (defaultEntry!6430 thiss!1427) (defaultEntry!6430 thiss!1427)) t!31305) tb!7101))

(declare-fun result!14635 () Bool)

(assert (=> tb!7101 (= result!14635 tp_is_empty!24877)))

(assert (=> b!1047368 t!31305))

(declare-fun b_and!33821 () Bool)

(assert (= b_and!33819 (and (=> t!31305 result!14635) b_and!33821)))

(declare-fun m!967621 () Bool)

(assert (=> b!1047378 m!967621))

(declare-fun m!967623 () Bool)

(assert (=> b!1047378 m!967623))

(declare-fun m!967625 () Bool)

(assert (=> b!1047368 m!967625))

(declare-fun m!967627 () Bool)

(assert (=> b!1047368 m!967627))

(declare-fun m!967629 () Bool)

(assert (=> b!1047368 m!967629))

(assert (=> b!1047368 m!967625))

(declare-fun m!967631 () Bool)

(assert (=> b!1047368 m!967631))

(declare-fun m!967633 () Bool)

(assert (=> b!1047368 m!967633))

(declare-fun m!967635 () Bool)

(assert (=> b!1047368 m!967635))

(declare-fun m!967637 () Bool)

(assert (=> b!1047368 m!967637))

(declare-fun m!967639 () Bool)

(assert (=> b!1047368 m!967639))

(assert (=> b!1047368 m!967637))

(declare-fun m!967641 () Bool)

(assert (=> b!1047368 m!967641))

(declare-fun m!967643 () Bool)

(assert (=> b!1047368 m!967643))

(declare-fun m!967645 () Bool)

(assert (=> b!1047368 m!967645))

(declare-fun m!967647 () Bool)

(assert (=> b!1047368 m!967647))

(declare-fun m!967649 () Bool)

(assert (=> b!1047368 m!967649))

(declare-fun m!967651 () Bool)

(assert (=> b!1047368 m!967651))

(declare-fun m!967653 () Bool)

(assert (=> b!1047368 m!967653))

(declare-fun m!967655 () Bool)

(assert (=> b!1047368 m!967655))

(declare-fun m!967657 () Bool)

(assert (=> b!1047368 m!967657))

(declare-fun m!967659 () Bool)

(assert (=> b!1047368 m!967659))

(declare-fun m!967661 () Bool)

(assert (=> b!1047376 m!967661))

(declare-fun m!967663 () Bool)

(assert (=> mapNonEmpty!38960 m!967663))

(declare-fun m!967665 () Bool)

(assert (=> b!1047371 m!967665))

(declare-fun m!967667 () Bool)

(assert (=> b!1047375 m!967667))

(declare-fun m!967669 () Bool)

(assert (=> start!92218 m!967669))

(declare-fun m!967671 () Bool)

(assert (=> b!1047372 m!967671))

(check-sat (not b!1047375) (not b!1047378) (not start!92218) (not b!1047368) b_and!33821 (not b!1047372) (not b_lambda!16351) (not mapNonEmpty!38960) (not b_next!21157) (not b!1047371) (not b!1047376) tp_is_empty!24877)
(check-sat b_and!33821 (not b_next!21157))
