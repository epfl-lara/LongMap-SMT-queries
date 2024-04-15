; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91810 () Bool)

(assert start!91810)

(declare-fun b!1044465 () Bool)

(declare-fun b_free!21121 () Bool)

(declare-fun b_next!21121 () Bool)

(assert (=> b!1044465 (= b_free!21121 (not b_next!21121))))

(declare-fun tp!74612 () Bool)

(declare-fun b_and!33679 () Bool)

(assert (=> b!1044465 (= tp!74612 b_and!33679)))

(declare-fun mapIsEmpty!38894 () Bool)

(declare-fun mapRes!38894 () Bool)

(assert (=> mapIsEmpty!38894 mapRes!38894))

(declare-fun b!1044461 () Bool)

(declare-fun res!695645 () Bool)

(declare-fun e!591939 () Bool)

(assert (=> b!1044461 (=> (not res!695645) (not e!591939))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1044461 (= res!695645 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1044462 () Bool)

(declare-fun e!591945 () Bool)

(declare-fun e!591942 () Bool)

(assert (=> b!1044462 (= e!591945 (and e!591942 mapRes!38894))))

(declare-fun condMapEmpty!38894 () Bool)

(declare-datatypes ((V!37995 0))(
  ( (V!37996 (val!12471 Int)) )
))
(declare-datatypes ((ValueCell!11717 0))(
  ( (ValueCellFull!11717 (v!15063 V!37995)) (EmptyCell!11717) )
))
(declare-datatypes ((array!65791 0))(
  ( (array!65792 (arr!31644 (Array (_ BitVec 32) (_ BitVec 64))) (size!32181 (_ BitVec 32))) )
))
(declare-datatypes ((array!65793 0))(
  ( (array!65794 (arr!31645 (Array (_ BitVec 32) ValueCell!11717)) (size!32182 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6028 0))(
  ( (LongMapFixedSize!6029 (defaultEntry!6404 Int) (mask!30512 (_ BitVec 32)) (extraKeys!6132 (_ BitVec 32)) (zeroValue!6238 V!37995) (minValue!6238 V!37995) (_size!3069 (_ BitVec 32)) (_keys!11666 array!65791) (_values!6427 array!65793) (_vacant!3069 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6028)

(declare-fun mapDefault!38894 () ValueCell!11717)

(assert (=> b!1044462 (= condMapEmpty!38894 (= (arr!31645 (_values!6427 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11717)) mapDefault!38894)))))

(declare-fun res!695644 () Bool)

(assert (=> start!91810 (=> (not res!695644) (not e!591939))))

(declare-fun valid!2258 (LongMapFixedSize!6028) Bool)

(assert (=> start!91810 (= res!695644 (valid!2258 thiss!1427))))

(assert (=> start!91810 e!591939))

(declare-fun e!591941 () Bool)

(assert (=> start!91810 e!591941))

(assert (=> start!91810 true))

(declare-fun b!1044463 () Bool)

(declare-fun e!591940 () Bool)

(declare-fun e!591946 () Bool)

(assert (=> b!1044463 (= e!591940 (not e!591946))))

(declare-fun res!695641 () Bool)

(assert (=> b!1044463 (=> res!695641 e!591946)))

(declare-datatypes ((Unit!34001 0))(
  ( (Unit!34002) )
))
(declare-datatypes ((tuple2!15840 0))(
  ( (tuple2!15841 (_1!7931 Unit!34001) (_2!7931 LongMapFixedSize!6028)) )
))
(declare-fun lt!460660 () tuple2!15840)

(declare-datatypes ((tuple2!15842 0))(
  ( (tuple2!15843 (_1!7932 (_ BitVec 64)) (_2!7932 V!37995)) )
))
(declare-datatypes ((List!22046 0))(
  ( (Nil!22043) (Cons!22042 (h!23250 tuple2!15842) (t!31281 List!22046)) )
))
(declare-datatypes ((ListLongMap!13853 0))(
  ( (ListLongMap!13854 (toList!6942 List!22046)) )
))
(declare-fun contains!6052 (ListLongMap!13853 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3908 (array!65791 array!65793 (_ BitVec 32) (_ BitVec 32) V!37995 V!37995 (_ BitVec 32) Int) ListLongMap!13853)

(assert (=> b!1044463 (= res!695641 (not (contains!6052 (getCurrentListMap!3908 (_keys!11666 (_2!7931 lt!460660)) (_values!6427 (_2!7931 lt!460660)) (mask!30512 (_2!7931 lt!460660)) (extraKeys!6132 (_2!7931 lt!460660)) (zeroValue!6238 (_2!7931 lt!460660)) (minValue!6238 (_2!7931 lt!460660)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7931 lt!460660))) key!909)))))

(declare-fun lt!460662 () array!65793)

(declare-fun lt!460658 () array!65791)

(declare-fun Unit!34003 () Unit!34001)

(declare-fun Unit!34004 () Unit!34001)

(assert (=> b!1044463 (= lt!460660 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3069 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15841 Unit!34003 (LongMapFixedSize!6029 (defaultEntry!6404 thiss!1427) (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) (bvsub (_size!3069 thiss!1427) #b00000000000000000000000000000001) lt!460658 lt!460662 (bvadd #b00000000000000000000000000000001 (_vacant!3069 thiss!1427)))) (tuple2!15841 Unit!34004 (LongMapFixedSize!6029 (defaultEntry!6404 thiss!1427) (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) (bvsub (_size!3069 thiss!1427) #b00000000000000000000000000000001) lt!460658 lt!460662 (_vacant!3069 thiss!1427)))))))

(declare-fun -!534 (ListLongMap!13853 (_ BitVec 64)) ListLongMap!13853)

(assert (=> b!1044463 (= (-!534 (getCurrentListMap!3908 (_keys!11666 thiss!1427) (_values!6427 thiss!1427) (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)) key!909) (getCurrentListMap!3908 lt!460658 lt!460662 (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9842 0))(
  ( (MissingZero!9842 (index!41739 (_ BitVec 32))) (Found!9842 (index!41740 (_ BitVec 32))) (Intermediate!9842 (undefined!10654 Bool) (index!41741 (_ BitVec 32)) (x!93285 (_ BitVec 32))) (Undefined!9842) (MissingVacant!9842 (index!41742 (_ BitVec 32))) )
))
(declare-fun lt!460656 () SeekEntryResult!9842)

(declare-fun dynLambda!1995 (Int (_ BitVec 64)) V!37995)

(assert (=> b!1044463 (= lt!460662 (array!65794 (store (arr!31645 (_values!6427 thiss!1427)) (index!41740 lt!460656) (ValueCellFull!11717 (dynLambda!1995 (defaultEntry!6404 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32182 (_values!6427 thiss!1427))))))

(declare-fun lt!460659 () Unit!34001)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!56 (array!65791 array!65793 (_ BitVec 32) (_ BitVec 32) V!37995 V!37995 (_ BitVec 32) (_ BitVec 64) Int) Unit!34001)

(assert (=> b!1044463 (= lt!460659 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!56 (_keys!11666 thiss!1427) (_values!6427 thiss!1427) (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) (index!41740 lt!460656) key!909 (defaultEntry!6404 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1044463 (not (arrayContainsKey!0 lt!460658 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!460654 () Unit!34001)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65791 (_ BitVec 32) (_ BitVec 64)) Unit!34001)

(assert (=> b!1044463 (= lt!460654 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11666 thiss!1427) (index!41740 lt!460656) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65791 (_ BitVec 32)) Bool)

(assert (=> b!1044463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460658 (mask!30512 thiss!1427))))

(declare-fun lt!460655 () Unit!34001)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65791 (_ BitVec 32) (_ BitVec 32)) Unit!34001)

(assert (=> b!1044463 (= lt!460655 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11666 thiss!1427) (index!41740 lt!460656) (mask!30512 thiss!1427)))))

(declare-datatypes ((List!22047 0))(
  ( (Nil!22044) (Cons!22043 (h!23251 (_ BitVec 64)) (t!31282 List!22047)) )
))
(declare-fun arrayNoDuplicates!0 (array!65791 (_ BitVec 32) List!22047) Bool)

(assert (=> b!1044463 (arrayNoDuplicates!0 lt!460658 #b00000000000000000000000000000000 Nil!22044)))

(declare-fun lt!460661 () Unit!34001)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65791 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22047) Unit!34001)

(assert (=> b!1044463 (= lt!460661 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11666 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41740 lt!460656) #b00000000000000000000000000000000 Nil!22044))))

(declare-fun arrayCountValidKeys!0 (array!65791 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1044463 (= (arrayCountValidKeys!0 lt!460658 #b00000000000000000000000000000000 (size!32181 (_keys!11666 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11666 thiss!1427) #b00000000000000000000000000000000 (size!32181 (_keys!11666 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1044463 (= lt!460658 (array!65792 (store (arr!31644 (_keys!11666 thiss!1427)) (index!41740 lt!460656) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32181 (_keys!11666 thiss!1427))))))

(declare-fun lt!460657 () Unit!34001)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65791 (_ BitVec 32) (_ BitVec 64)) Unit!34001)

(assert (=> b!1044463 (= lt!460657 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11666 thiss!1427) (index!41740 lt!460656) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!38894 () Bool)

(declare-fun tp!74613 () Bool)

(declare-fun e!591944 () Bool)

(assert (=> mapNonEmpty!38894 (= mapRes!38894 (and tp!74613 e!591944))))

(declare-fun mapKey!38894 () (_ BitVec 32))

(declare-fun mapValue!38894 () ValueCell!11717)

(declare-fun mapRest!38894 () (Array (_ BitVec 32) ValueCell!11717))

(assert (=> mapNonEmpty!38894 (= (arr!31645 (_values!6427 thiss!1427)) (store mapRest!38894 mapKey!38894 mapValue!38894))))

(declare-fun b!1044464 () Bool)

(declare-fun res!695643 () Bool)

(assert (=> b!1044464 (=> res!695643 e!591946)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1044464 (= res!695643 (not (validMask!0 (mask!30512 (_2!7931 lt!460660)))))))

(declare-fun tp_is_empty!24841 () Bool)

(declare-fun array_inv!24455 (array!65791) Bool)

(declare-fun array_inv!24456 (array!65793) Bool)

(assert (=> b!1044465 (= e!591941 (and tp!74612 tp_is_empty!24841 (array_inv!24455 (_keys!11666 thiss!1427)) (array_inv!24456 (_values!6427 thiss!1427)) e!591945))))

(declare-fun b!1044466 () Bool)

(assert (=> b!1044466 (= e!591944 tp_is_empty!24841)))

(declare-fun b!1044467 () Bool)

(assert (=> b!1044467 (= e!591942 tp_is_empty!24841)))

(declare-fun b!1044468 () Bool)

(assert (=> b!1044468 (= e!591939 e!591940)))

(declare-fun res!695642 () Bool)

(assert (=> b!1044468 (=> (not res!695642) (not e!591940))))

(get-info :version)

(assert (=> b!1044468 (= res!695642 ((_ is Found!9842) lt!460656))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65791 (_ BitVec 32)) SeekEntryResult!9842)

(assert (=> b!1044468 (= lt!460656 (seekEntry!0 key!909 (_keys!11666 thiss!1427) (mask!30512 thiss!1427)))))

(declare-fun b!1044469 () Bool)

(assert (=> b!1044469 (= e!591946 (or (not (= (size!32182 (_values!6427 (_2!7931 lt!460660))) (bvadd #b00000000000000000000000000000001 (mask!30512 (_2!7931 lt!460660))))) (= (size!32181 (_keys!11666 (_2!7931 lt!460660))) (size!32182 (_values!6427 (_2!7931 lt!460660))))))))

(assert (= (and start!91810 res!695644) b!1044461))

(assert (= (and b!1044461 res!695645) b!1044468))

(assert (= (and b!1044468 res!695642) b!1044463))

(assert (= (and b!1044463 (not res!695641)) b!1044464))

(assert (= (and b!1044464 (not res!695643)) b!1044469))

(assert (= (and b!1044462 condMapEmpty!38894) mapIsEmpty!38894))

(assert (= (and b!1044462 (not condMapEmpty!38894)) mapNonEmpty!38894))

(assert (= (and mapNonEmpty!38894 ((_ is ValueCellFull!11717) mapValue!38894)) b!1044466))

(assert (= (and b!1044462 ((_ is ValueCellFull!11717) mapDefault!38894)) b!1044467))

(assert (= b!1044465 b!1044462))

(assert (= start!91810 b!1044465))

(declare-fun b_lambda!16219 () Bool)

(assert (=> (not b_lambda!16219) (not b!1044463)))

(declare-fun t!31280 () Bool)

(declare-fun tb!7057 () Bool)

(assert (=> (and b!1044465 (= (defaultEntry!6404 thiss!1427) (defaultEntry!6404 thiss!1427)) t!31280) tb!7057))

(declare-fun result!14547 () Bool)

(assert (=> tb!7057 (= result!14547 tp_is_empty!24841)))

(assert (=> b!1044463 t!31280))

(declare-fun b_and!33681 () Bool)

(assert (= b_and!33679 (and (=> t!31280 result!14547) b_and!33681)))

(declare-fun m!963471 () Bool)

(assert (=> start!91810 m!963471))

(declare-fun m!963473 () Bool)

(assert (=> b!1044463 m!963473))

(declare-fun m!963475 () Bool)

(assert (=> b!1044463 m!963475))

(declare-fun m!963477 () Bool)

(assert (=> b!1044463 m!963477))

(declare-fun m!963479 () Bool)

(assert (=> b!1044463 m!963479))

(declare-fun m!963481 () Bool)

(assert (=> b!1044463 m!963481))

(declare-fun m!963483 () Bool)

(assert (=> b!1044463 m!963483))

(declare-fun m!963485 () Bool)

(assert (=> b!1044463 m!963485))

(declare-fun m!963487 () Bool)

(assert (=> b!1044463 m!963487))

(declare-fun m!963489 () Bool)

(assert (=> b!1044463 m!963489))

(assert (=> b!1044463 m!963487))

(declare-fun m!963491 () Bool)

(assert (=> b!1044463 m!963491))

(assert (=> b!1044463 m!963485))

(declare-fun m!963493 () Bool)

(assert (=> b!1044463 m!963493))

(declare-fun m!963495 () Bool)

(assert (=> b!1044463 m!963495))

(declare-fun m!963497 () Bool)

(assert (=> b!1044463 m!963497))

(declare-fun m!963499 () Bool)

(assert (=> b!1044463 m!963499))

(declare-fun m!963501 () Bool)

(assert (=> b!1044463 m!963501))

(declare-fun m!963503 () Bool)

(assert (=> b!1044463 m!963503))

(declare-fun m!963505 () Bool)

(assert (=> b!1044463 m!963505))

(declare-fun m!963507 () Bool)

(assert (=> b!1044463 m!963507))

(declare-fun m!963509 () Bool)

(assert (=> mapNonEmpty!38894 m!963509))

(declare-fun m!963511 () Bool)

(assert (=> b!1044465 m!963511))

(declare-fun m!963513 () Bool)

(assert (=> b!1044465 m!963513))

(declare-fun m!963515 () Bool)

(assert (=> b!1044464 m!963515))

(declare-fun m!963517 () Bool)

(assert (=> b!1044468 m!963517))

(check-sat b_and!33681 (not start!91810) tp_is_empty!24841 (not b!1044464) (not b_next!21121) (not b_lambda!16219) (not b!1044465) (not mapNonEmpty!38894) (not b!1044463) (not b!1044468))
(check-sat b_and!33681 (not b_next!21121))
(get-model)

(declare-fun b_lambda!16225 () Bool)

(assert (= b_lambda!16219 (or (and b!1044465 b_free!21121) b_lambda!16225)))

(check-sat b_and!33681 (not start!91810) tp_is_empty!24841 (not b_lambda!16225) (not b!1044464) (not b_next!21121) (not b!1044465) (not mapNonEmpty!38894) (not b!1044463) (not b!1044468))
(check-sat b_and!33681 (not b_next!21121))
(get-model)

(declare-fun d!126267 () Bool)

(assert (=> d!126267 (= (array_inv!24455 (_keys!11666 thiss!1427)) (bvsge (size!32181 (_keys!11666 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044465 d!126267))

(declare-fun d!126269 () Bool)

(assert (=> d!126269 (= (array_inv!24456 (_values!6427 thiss!1427)) (bvsge (size!32182 (_values!6427 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044465 d!126269))

(declare-fun d!126271 () Bool)

(declare-fun res!695682 () Bool)

(declare-fun e!591997 () Bool)

(assert (=> d!126271 (=> (not res!695682) (not e!591997))))

(declare-fun simpleValid!450 (LongMapFixedSize!6028) Bool)

(assert (=> d!126271 (= res!695682 (simpleValid!450 thiss!1427))))

(assert (=> d!126271 (= (valid!2258 thiss!1427) e!591997)))

(declare-fun b!1044536 () Bool)

(declare-fun res!695683 () Bool)

(assert (=> b!1044536 (=> (not res!695683) (not e!591997))))

(assert (=> b!1044536 (= res!695683 (= (arrayCountValidKeys!0 (_keys!11666 thiss!1427) #b00000000000000000000000000000000 (size!32181 (_keys!11666 thiss!1427))) (_size!3069 thiss!1427)))))

(declare-fun b!1044537 () Bool)

(declare-fun res!695684 () Bool)

(assert (=> b!1044537 (=> (not res!695684) (not e!591997))))

(assert (=> b!1044537 (= res!695684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11666 thiss!1427) (mask!30512 thiss!1427)))))

(declare-fun b!1044538 () Bool)

(assert (=> b!1044538 (= e!591997 (arrayNoDuplicates!0 (_keys!11666 thiss!1427) #b00000000000000000000000000000000 Nil!22044))))

(assert (= (and d!126271 res!695682) b!1044536))

(assert (= (and b!1044536 res!695683) b!1044537))

(assert (= (and b!1044537 res!695684) b!1044538))

(declare-fun m!963615 () Bool)

(assert (=> d!126271 m!963615))

(assert (=> b!1044536 m!963481))

(declare-fun m!963617 () Bool)

(assert (=> b!1044537 m!963617))

(declare-fun m!963619 () Bool)

(assert (=> b!1044538 m!963619))

(assert (=> start!91810 d!126271))

(declare-fun b!1044551 () Bool)

(declare-fun e!592005 () SeekEntryResult!9842)

(declare-fun lt!460725 () SeekEntryResult!9842)

(assert (=> b!1044551 (= e!592005 (ite ((_ is MissingVacant!9842) lt!460725) (MissingZero!9842 (index!41742 lt!460725)) lt!460725))))

(declare-fun lt!460726 () SeekEntryResult!9842)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65791 (_ BitVec 32)) SeekEntryResult!9842)

(assert (=> b!1044551 (= lt!460725 (seekKeyOrZeroReturnVacant!0 (x!93285 lt!460726) (index!41741 lt!460726) (index!41741 lt!460726) key!909 (_keys!11666 thiss!1427) (mask!30512 thiss!1427)))))

(declare-fun b!1044552 () Bool)

(declare-fun e!592004 () SeekEntryResult!9842)

(assert (=> b!1044552 (= e!592004 Undefined!9842)))

(declare-fun d!126273 () Bool)

(declare-fun lt!460728 () SeekEntryResult!9842)

(assert (=> d!126273 (and (or ((_ is MissingVacant!9842) lt!460728) (not ((_ is Found!9842) lt!460728)) (and (bvsge (index!41740 lt!460728) #b00000000000000000000000000000000) (bvslt (index!41740 lt!460728) (size!32181 (_keys!11666 thiss!1427))))) (not ((_ is MissingVacant!9842) lt!460728)) (or (not ((_ is Found!9842) lt!460728)) (= (select (arr!31644 (_keys!11666 thiss!1427)) (index!41740 lt!460728)) key!909)))))

(assert (=> d!126273 (= lt!460728 e!592004)))

(declare-fun c!106106 () Bool)

(assert (=> d!126273 (= c!106106 (and ((_ is Intermediate!9842) lt!460726) (undefined!10654 lt!460726)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65791 (_ BitVec 32)) SeekEntryResult!9842)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126273 (= lt!460726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30512 thiss!1427)) key!909 (_keys!11666 thiss!1427) (mask!30512 thiss!1427)))))

(assert (=> d!126273 (validMask!0 (mask!30512 thiss!1427))))

(assert (=> d!126273 (= (seekEntry!0 key!909 (_keys!11666 thiss!1427) (mask!30512 thiss!1427)) lt!460728)))

(declare-fun b!1044553 () Bool)

(declare-fun e!592006 () SeekEntryResult!9842)

(assert (=> b!1044553 (= e!592006 (Found!9842 (index!41741 lt!460726)))))

(declare-fun b!1044554 () Bool)

(declare-fun c!106108 () Bool)

(declare-fun lt!460727 () (_ BitVec 64))

(assert (=> b!1044554 (= c!106108 (= lt!460727 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1044554 (= e!592006 e!592005)))

(declare-fun b!1044555 () Bool)

(assert (=> b!1044555 (= e!592005 (MissingZero!9842 (index!41741 lt!460726)))))

(declare-fun b!1044556 () Bool)

(assert (=> b!1044556 (= e!592004 e!592006)))

(assert (=> b!1044556 (= lt!460727 (select (arr!31644 (_keys!11666 thiss!1427)) (index!41741 lt!460726)))))

(declare-fun c!106107 () Bool)

(assert (=> b!1044556 (= c!106107 (= lt!460727 key!909))))

(assert (= (and d!126273 c!106106) b!1044552))

(assert (= (and d!126273 (not c!106106)) b!1044556))

(assert (= (and b!1044556 c!106107) b!1044553))

(assert (= (and b!1044556 (not c!106107)) b!1044554))

(assert (= (and b!1044554 c!106108) b!1044555))

(assert (= (and b!1044554 (not c!106108)) b!1044551))

(declare-fun m!963621 () Bool)

(assert (=> b!1044551 m!963621))

(declare-fun m!963623 () Bool)

(assert (=> d!126273 m!963623))

(declare-fun m!963625 () Bool)

(assert (=> d!126273 m!963625))

(assert (=> d!126273 m!963625))

(declare-fun m!963627 () Bool)

(assert (=> d!126273 m!963627))

(declare-fun m!963629 () Bool)

(assert (=> d!126273 m!963629))

(declare-fun m!963631 () Bool)

(assert (=> b!1044556 m!963631))

(assert (=> b!1044468 d!126273))

(declare-fun b!1044599 () Bool)

(declare-fun e!592038 () ListLongMap!13853)

(declare-fun call!44382 () ListLongMap!13853)

(declare-fun +!3136 (ListLongMap!13853 tuple2!15842) ListLongMap!13853)

(assert (=> b!1044599 (= e!592038 (+!3136 call!44382 (tuple2!15843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6238 (_2!7931 lt!460660)))))))

(declare-fun b!1044600 () Bool)

(declare-fun e!592033 () Bool)

(declare-fun call!44383 () Bool)

(assert (=> b!1044600 (= e!592033 (not call!44383))))

(declare-fun bm!44377 () Bool)

(declare-fun call!44384 () Bool)

(declare-fun lt!460794 () ListLongMap!13853)

(assert (=> bm!44377 (= call!44384 (contains!6052 lt!460794 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044602 () Bool)

(declare-fun e!592037 () Unit!34001)

(declare-fun Unit!34011 () Unit!34001)

(assert (=> b!1044602 (= e!592037 Unit!34011)))

(declare-fun b!1044603 () Bool)

(declare-fun e!592044 () Bool)

(assert (=> b!1044603 (= e!592033 e!592044)))

(declare-fun res!695707 () Bool)

(assert (=> b!1044603 (= res!695707 call!44383)))

(assert (=> b!1044603 (=> (not res!695707) (not e!592044))))

(declare-fun b!1044604 () Bool)

(declare-fun lt!460787 () Unit!34001)

(assert (=> b!1044604 (= e!592037 lt!460787)))

(declare-fun lt!460783 () ListLongMap!13853)

(declare-fun getCurrentListMapNoExtraKeys!3571 (array!65791 array!65793 (_ BitVec 32) (_ BitVec 32) V!37995 V!37995 (_ BitVec 32) Int) ListLongMap!13853)

(assert (=> b!1044604 (= lt!460783 (getCurrentListMapNoExtraKeys!3571 (_keys!11666 (_2!7931 lt!460660)) (_values!6427 (_2!7931 lt!460660)) (mask!30512 (_2!7931 lt!460660)) (extraKeys!6132 (_2!7931 lt!460660)) (zeroValue!6238 (_2!7931 lt!460660)) (minValue!6238 (_2!7931 lt!460660)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7931 lt!460660))))))

(declare-fun lt!460777 () (_ BitVec 64))

(assert (=> b!1044604 (= lt!460777 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460788 () (_ BitVec 64))

(assert (=> b!1044604 (= lt!460788 (select (arr!31644 (_keys!11666 (_2!7931 lt!460660))) #b00000000000000000000000000000000))))

(declare-fun lt!460779 () Unit!34001)

(declare-fun addStillContains!624 (ListLongMap!13853 (_ BitVec 64) V!37995 (_ BitVec 64)) Unit!34001)

(assert (=> b!1044604 (= lt!460779 (addStillContains!624 lt!460783 lt!460777 (zeroValue!6238 (_2!7931 lt!460660)) lt!460788))))

(assert (=> b!1044604 (contains!6052 (+!3136 lt!460783 (tuple2!15843 lt!460777 (zeroValue!6238 (_2!7931 lt!460660)))) lt!460788)))

(declare-fun lt!460781 () Unit!34001)

(assert (=> b!1044604 (= lt!460781 lt!460779)))

(declare-fun lt!460780 () ListLongMap!13853)

(assert (=> b!1044604 (= lt!460780 (getCurrentListMapNoExtraKeys!3571 (_keys!11666 (_2!7931 lt!460660)) (_values!6427 (_2!7931 lt!460660)) (mask!30512 (_2!7931 lt!460660)) (extraKeys!6132 (_2!7931 lt!460660)) (zeroValue!6238 (_2!7931 lt!460660)) (minValue!6238 (_2!7931 lt!460660)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7931 lt!460660))))))

(declare-fun lt!460773 () (_ BitVec 64))

(assert (=> b!1044604 (= lt!460773 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460785 () (_ BitVec 64))

(assert (=> b!1044604 (= lt!460785 (select (arr!31644 (_keys!11666 (_2!7931 lt!460660))) #b00000000000000000000000000000000))))

(declare-fun lt!460775 () Unit!34001)

(declare-fun addApplyDifferent!480 (ListLongMap!13853 (_ BitVec 64) V!37995 (_ BitVec 64)) Unit!34001)

(assert (=> b!1044604 (= lt!460775 (addApplyDifferent!480 lt!460780 lt!460773 (minValue!6238 (_2!7931 lt!460660)) lt!460785))))

(declare-fun apply!905 (ListLongMap!13853 (_ BitVec 64)) V!37995)

(assert (=> b!1044604 (= (apply!905 (+!3136 lt!460780 (tuple2!15843 lt!460773 (minValue!6238 (_2!7931 lt!460660)))) lt!460785) (apply!905 lt!460780 lt!460785))))

(declare-fun lt!460784 () Unit!34001)

(assert (=> b!1044604 (= lt!460784 lt!460775)))

(declare-fun lt!460774 () ListLongMap!13853)

(assert (=> b!1044604 (= lt!460774 (getCurrentListMapNoExtraKeys!3571 (_keys!11666 (_2!7931 lt!460660)) (_values!6427 (_2!7931 lt!460660)) (mask!30512 (_2!7931 lt!460660)) (extraKeys!6132 (_2!7931 lt!460660)) (zeroValue!6238 (_2!7931 lt!460660)) (minValue!6238 (_2!7931 lt!460660)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7931 lt!460660))))))

(declare-fun lt!460790 () (_ BitVec 64))

(assert (=> b!1044604 (= lt!460790 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460789 () (_ BitVec 64))

(assert (=> b!1044604 (= lt!460789 (select (arr!31644 (_keys!11666 (_2!7931 lt!460660))) #b00000000000000000000000000000000))))

(declare-fun lt!460786 () Unit!34001)

(assert (=> b!1044604 (= lt!460786 (addApplyDifferent!480 lt!460774 lt!460790 (zeroValue!6238 (_2!7931 lt!460660)) lt!460789))))

(assert (=> b!1044604 (= (apply!905 (+!3136 lt!460774 (tuple2!15843 lt!460790 (zeroValue!6238 (_2!7931 lt!460660)))) lt!460789) (apply!905 lt!460774 lt!460789))))

(declare-fun lt!460778 () Unit!34001)

(assert (=> b!1044604 (= lt!460778 lt!460786)))

(declare-fun lt!460782 () ListLongMap!13853)

(assert (=> b!1044604 (= lt!460782 (getCurrentListMapNoExtraKeys!3571 (_keys!11666 (_2!7931 lt!460660)) (_values!6427 (_2!7931 lt!460660)) (mask!30512 (_2!7931 lt!460660)) (extraKeys!6132 (_2!7931 lt!460660)) (zeroValue!6238 (_2!7931 lt!460660)) (minValue!6238 (_2!7931 lt!460660)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7931 lt!460660))))))

(declare-fun lt!460776 () (_ BitVec 64))

(assert (=> b!1044604 (= lt!460776 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460792 () (_ BitVec 64))

(assert (=> b!1044604 (= lt!460792 (select (arr!31644 (_keys!11666 (_2!7931 lt!460660))) #b00000000000000000000000000000000))))

(assert (=> b!1044604 (= lt!460787 (addApplyDifferent!480 lt!460782 lt!460776 (minValue!6238 (_2!7931 lt!460660)) lt!460792))))

(assert (=> b!1044604 (= (apply!905 (+!3136 lt!460782 (tuple2!15843 lt!460776 (minValue!6238 (_2!7931 lt!460660)))) lt!460792) (apply!905 lt!460782 lt!460792))))

(declare-fun call!44380 () ListLongMap!13853)

(declare-fun call!44386 () ListLongMap!13853)

(declare-fun bm!44378 () Bool)

(declare-fun c!106124 () Bool)

(declare-fun c!106121 () Bool)

(declare-fun call!44381 () ListLongMap!13853)

(assert (=> bm!44378 (= call!44382 (+!3136 (ite c!106124 call!44381 (ite c!106121 call!44380 call!44386)) (ite (or c!106124 c!106121) (tuple2!15843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6238 (_2!7931 lt!460660))) (tuple2!15843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6238 (_2!7931 lt!460660))))))))

(declare-fun b!1044605 () Bool)

(declare-fun res!695710 () Bool)

(declare-fun e!592043 () Bool)

(assert (=> b!1044605 (=> (not res!695710) (not e!592043))))

(declare-fun e!592045 () Bool)

(assert (=> b!1044605 (= res!695710 e!592045)))

(declare-fun c!106126 () Bool)

(assert (=> b!1044605 (= c!106126 (not (= (bvand (extraKeys!6132 (_2!7931 lt!460660)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!44379 () Bool)

(assert (=> bm!44379 (= call!44386 call!44380)))

(declare-fun b!1044606 () Bool)

(declare-fun e!592041 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1044606 (= e!592041 (validKeyInArray!0 (select (arr!31644 (_keys!11666 (_2!7931 lt!460660))) #b00000000000000000000000000000000)))))

(declare-fun bm!44380 () Bool)

(assert (=> bm!44380 (= call!44383 (contains!6052 lt!460794 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044607 () Bool)

(declare-fun res!695706 () Bool)

(assert (=> b!1044607 (=> (not res!695706) (not e!592043))))

(declare-fun e!592039 () Bool)

(assert (=> b!1044607 (= res!695706 e!592039)))

(declare-fun res!695711 () Bool)

(assert (=> b!1044607 (=> res!695711 e!592039)))

(declare-fun e!592042 () Bool)

(assert (=> b!1044607 (= res!695711 (not e!592042))))

(declare-fun res!695709 () Bool)

(assert (=> b!1044607 (=> (not res!695709) (not e!592042))))

(assert (=> b!1044607 (= res!695709 (bvslt #b00000000000000000000000000000000 (size!32181 (_keys!11666 (_2!7931 lt!460660)))))))

(declare-fun b!1044608 () Bool)

(declare-fun e!592036 () ListLongMap!13853)

(assert (=> b!1044608 (= e!592038 e!592036)))

(assert (=> b!1044608 (= c!106121 (and (not (= (bvand (extraKeys!6132 (_2!7931 lt!460660)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6132 (_2!7931 lt!460660)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044609 () Bool)

(declare-fun e!592040 () Bool)

(assert (=> b!1044609 (= e!592040 (= (apply!905 lt!460794 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6238 (_2!7931 lt!460660))))))

(declare-fun b!1044610 () Bool)

(declare-fun e!592034 () ListLongMap!13853)

(assert (=> b!1044610 (= e!592034 call!44386)))

(declare-fun b!1044611 () Bool)

(declare-fun call!44385 () ListLongMap!13853)

(assert (=> b!1044611 (= e!592034 call!44385)))

(declare-fun d!126275 () Bool)

(assert (=> d!126275 e!592043))

(declare-fun res!695704 () Bool)

(assert (=> d!126275 (=> (not res!695704) (not e!592043))))

(assert (=> d!126275 (= res!695704 (or (bvsge #b00000000000000000000000000000000 (size!32181 (_keys!11666 (_2!7931 lt!460660)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32181 (_keys!11666 (_2!7931 lt!460660)))))))))

(declare-fun lt!460793 () ListLongMap!13853)

(assert (=> d!126275 (= lt!460794 lt!460793)))

(declare-fun lt!460791 () Unit!34001)

(assert (=> d!126275 (= lt!460791 e!592037)))

(declare-fun c!106122 () Bool)

(assert (=> d!126275 (= c!106122 e!592041)))

(declare-fun res!695703 () Bool)

(assert (=> d!126275 (=> (not res!695703) (not e!592041))))

(assert (=> d!126275 (= res!695703 (bvslt #b00000000000000000000000000000000 (size!32181 (_keys!11666 (_2!7931 lt!460660)))))))

(assert (=> d!126275 (= lt!460793 e!592038)))

(assert (=> d!126275 (= c!106124 (and (not (= (bvand (extraKeys!6132 (_2!7931 lt!460660)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6132 (_2!7931 lt!460660)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126275 (validMask!0 (mask!30512 (_2!7931 lt!460660)))))

(assert (=> d!126275 (= (getCurrentListMap!3908 (_keys!11666 (_2!7931 lt!460660)) (_values!6427 (_2!7931 lt!460660)) (mask!30512 (_2!7931 lt!460660)) (extraKeys!6132 (_2!7931 lt!460660)) (zeroValue!6238 (_2!7931 lt!460660)) (minValue!6238 (_2!7931 lt!460660)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7931 lt!460660))) lt!460794)))

(declare-fun b!1044601 () Bool)

(assert (=> b!1044601 (= e!592045 e!592040)))

(declare-fun res!695705 () Bool)

(assert (=> b!1044601 (= res!695705 call!44384)))

(assert (=> b!1044601 (=> (not res!695705) (not e!592040))))

(declare-fun b!1044612 () Bool)

(assert (=> b!1044612 (= e!592043 e!592033)))

(declare-fun c!106125 () Bool)

(assert (=> b!1044612 (= c!106125 (not (= (bvand (extraKeys!6132 (_2!7931 lt!460660)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44381 () Bool)

(assert (=> bm!44381 (= call!44385 call!44382)))

(declare-fun b!1044613 () Bool)

(declare-fun e!592035 () Bool)

(declare-fun get!16548 (ValueCell!11717 V!37995) V!37995)

(assert (=> b!1044613 (= e!592035 (= (apply!905 lt!460794 (select (arr!31644 (_keys!11666 (_2!7931 lt!460660))) #b00000000000000000000000000000000)) (get!16548 (select (arr!31645 (_values!6427 (_2!7931 lt!460660))) #b00000000000000000000000000000000) (dynLambda!1995 (defaultEntry!6404 (_2!7931 lt!460660)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044613 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32182 (_values!6427 (_2!7931 lt!460660)))))))

(assert (=> b!1044613 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32181 (_keys!11666 (_2!7931 lt!460660)))))))

(declare-fun b!1044614 () Bool)

(assert (=> b!1044614 (= e!592045 (not call!44384))))

(declare-fun bm!44382 () Bool)

(assert (=> bm!44382 (= call!44381 (getCurrentListMapNoExtraKeys!3571 (_keys!11666 (_2!7931 lt!460660)) (_values!6427 (_2!7931 lt!460660)) (mask!30512 (_2!7931 lt!460660)) (extraKeys!6132 (_2!7931 lt!460660)) (zeroValue!6238 (_2!7931 lt!460660)) (minValue!6238 (_2!7931 lt!460660)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7931 lt!460660))))))

(declare-fun bm!44383 () Bool)

(assert (=> bm!44383 (= call!44380 call!44381)))

(declare-fun b!1044615 () Bool)

(assert (=> b!1044615 (= e!592036 call!44385)))

(declare-fun b!1044616 () Bool)

(assert (=> b!1044616 (= e!592042 (validKeyInArray!0 (select (arr!31644 (_keys!11666 (_2!7931 lt!460660))) #b00000000000000000000000000000000)))))

(declare-fun b!1044617 () Bool)

(assert (=> b!1044617 (= e!592039 e!592035)))

(declare-fun res!695708 () Bool)

(assert (=> b!1044617 (=> (not res!695708) (not e!592035))))

(assert (=> b!1044617 (= res!695708 (contains!6052 lt!460794 (select (arr!31644 (_keys!11666 (_2!7931 lt!460660))) #b00000000000000000000000000000000)))))

(assert (=> b!1044617 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32181 (_keys!11666 (_2!7931 lt!460660)))))))

(declare-fun b!1044618 () Bool)

(declare-fun c!106123 () Bool)

(assert (=> b!1044618 (= c!106123 (and (not (= (bvand (extraKeys!6132 (_2!7931 lt!460660)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6132 (_2!7931 lt!460660)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1044618 (= e!592036 e!592034)))

(declare-fun b!1044619 () Bool)

(assert (=> b!1044619 (= e!592044 (= (apply!905 lt!460794 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6238 (_2!7931 lt!460660))))))

(assert (= (and d!126275 c!106124) b!1044599))

(assert (= (and d!126275 (not c!106124)) b!1044608))

(assert (= (and b!1044608 c!106121) b!1044615))

(assert (= (and b!1044608 (not c!106121)) b!1044618))

(assert (= (and b!1044618 c!106123) b!1044611))

(assert (= (and b!1044618 (not c!106123)) b!1044610))

(assert (= (or b!1044611 b!1044610) bm!44379))

(assert (= (or b!1044615 bm!44379) bm!44383))

(assert (= (or b!1044615 b!1044611) bm!44381))

(assert (= (or b!1044599 bm!44383) bm!44382))

(assert (= (or b!1044599 bm!44381) bm!44378))

(assert (= (and d!126275 res!695703) b!1044606))

(assert (= (and d!126275 c!106122) b!1044604))

(assert (= (and d!126275 (not c!106122)) b!1044602))

(assert (= (and d!126275 res!695704) b!1044607))

(assert (= (and b!1044607 res!695709) b!1044616))

(assert (= (and b!1044607 (not res!695711)) b!1044617))

(assert (= (and b!1044617 res!695708) b!1044613))

(assert (= (and b!1044607 res!695706) b!1044605))

(assert (= (and b!1044605 c!106126) b!1044601))

(assert (= (and b!1044605 (not c!106126)) b!1044614))

(assert (= (and b!1044601 res!695705) b!1044609))

(assert (= (or b!1044601 b!1044614) bm!44377))

(assert (= (and b!1044605 res!695710) b!1044612))

(assert (= (and b!1044612 c!106125) b!1044603))

(assert (= (and b!1044612 (not c!106125)) b!1044600))

(assert (= (and b!1044603 res!695707) b!1044619))

(assert (= (or b!1044603 b!1044600) bm!44380))

(declare-fun b_lambda!16227 () Bool)

(assert (=> (not b_lambda!16227) (not b!1044613)))

(declare-fun tb!7063 () Bool)

(declare-fun t!31290 () Bool)

(assert (=> (and b!1044465 (= (defaultEntry!6404 thiss!1427) (defaultEntry!6404 (_2!7931 lt!460660))) t!31290) tb!7063))

(declare-fun result!14559 () Bool)

(assert (=> tb!7063 (= result!14559 tp_is_empty!24841)))

(assert (=> b!1044613 t!31290))

(declare-fun b_and!33691 () Bool)

(assert (= b_and!33681 (and (=> t!31290 result!14559) b_and!33691)))

(declare-fun m!963633 () Bool)

(assert (=> b!1044616 m!963633))

(assert (=> b!1044616 m!963633))

(declare-fun m!963635 () Bool)

(assert (=> b!1044616 m!963635))

(assert (=> d!126275 m!963515))

(declare-fun m!963637 () Bool)

(assert (=> b!1044619 m!963637))

(assert (=> b!1044617 m!963633))

(assert (=> b!1044617 m!963633))

(declare-fun m!963639 () Bool)

(assert (=> b!1044617 m!963639))

(declare-fun m!963641 () Bool)

(assert (=> b!1044604 m!963641))

(declare-fun m!963643 () Bool)

(assert (=> b!1044604 m!963643))

(declare-fun m!963645 () Bool)

(assert (=> b!1044604 m!963645))

(declare-fun m!963647 () Bool)

(assert (=> b!1044604 m!963647))

(declare-fun m!963649 () Bool)

(assert (=> b!1044604 m!963649))

(declare-fun m!963651 () Bool)

(assert (=> b!1044604 m!963651))

(declare-fun m!963653 () Bool)

(assert (=> b!1044604 m!963653))

(declare-fun m!963655 () Bool)

(assert (=> b!1044604 m!963655))

(assert (=> b!1044604 m!963643))

(declare-fun m!963657 () Bool)

(assert (=> b!1044604 m!963657))

(declare-fun m!963659 () Bool)

(assert (=> b!1044604 m!963659))

(declare-fun m!963661 () Bool)

(assert (=> b!1044604 m!963661))

(declare-fun m!963663 () Bool)

(assert (=> b!1044604 m!963663))

(assert (=> b!1044604 m!963659))

(assert (=> b!1044604 m!963649))

(declare-fun m!963665 () Bool)

(assert (=> b!1044604 m!963665))

(declare-fun m!963667 () Bool)

(assert (=> b!1044604 m!963667))

(declare-fun m!963669 () Bool)

(assert (=> b!1044604 m!963669))

(assert (=> b!1044604 m!963653))

(assert (=> b!1044604 m!963633))

(declare-fun m!963671 () Bool)

(assert (=> b!1044604 m!963671))

(declare-fun m!963673 () Bool)

(assert (=> b!1044599 m!963673))

(assert (=> b!1044606 m!963633))

(assert (=> b!1044606 m!963633))

(assert (=> b!1044606 m!963635))

(declare-fun m!963675 () Bool)

(assert (=> b!1044613 m!963675))

(declare-fun m!963677 () Bool)

(assert (=> b!1044613 m!963677))

(assert (=> b!1044613 m!963675))

(declare-fun m!963679 () Bool)

(assert (=> b!1044613 m!963679))

(assert (=> b!1044613 m!963633))

(declare-fun m!963681 () Bool)

(assert (=> b!1044613 m!963681))

(assert (=> b!1044613 m!963677))

(assert (=> b!1044613 m!963633))

(assert (=> bm!44382 m!963647))

(declare-fun m!963683 () Bool)

(assert (=> bm!44378 m!963683))

(declare-fun m!963685 () Bool)

(assert (=> b!1044609 m!963685))

(declare-fun m!963687 () Bool)

(assert (=> bm!44377 m!963687))

(declare-fun m!963689 () Bool)

(assert (=> bm!44380 m!963689))

(assert (=> b!1044463 d!126275))

(declare-fun d!126277 () Bool)

(declare-fun e!592048 () Bool)

(assert (=> d!126277 e!592048))

(declare-fun res!695714 () Bool)

(assert (=> d!126277 (=> (not res!695714) (not e!592048))))

(assert (=> d!126277 (= res!695714 (and (bvsge (index!41740 lt!460656) #b00000000000000000000000000000000) (bvslt (index!41740 lt!460656) (size!32181 (_keys!11666 thiss!1427)))))))

(declare-fun lt!460797 () Unit!34001)

(declare-fun choose!53 (array!65791 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22047) Unit!34001)

(assert (=> d!126277 (= lt!460797 (choose!53 (_keys!11666 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41740 lt!460656) #b00000000000000000000000000000000 Nil!22044))))

(assert (=> d!126277 (bvslt (size!32181 (_keys!11666 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126277 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11666 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41740 lt!460656) #b00000000000000000000000000000000 Nil!22044) lt!460797)))

(declare-fun b!1044622 () Bool)

(assert (=> b!1044622 (= e!592048 (arrayNoDuplicates!0 (array!65792 (store (arr!31644 (_keys!11666 thiss!1427)) (index!41740 lt!460656) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32181 (_keys!11666 thiss!1427))) #b00000000000000000000000000000000 Nil!22044))))

(assert (= (and d!126277 res!695714) b!1044622))

(declare-fun m!963691 () Bool)

(assert (=> d!126277 m!963691))

(assert (=> b!1044622 m!963483))

(declare-fun m!963693 () Bool)

(assert (=> b!1044622 m!963693))

(assert (=> b!1044463 d!126277))

(declare-fun b!1044623 () Bool)

(declare-fun e!592054 () ListLongMap!13853)

(declare-fun call!44389 () ListLongMap!13853)

(assert (=> b!1044623 (= e!592054 (+!3136 call!44389 (tuple2!15843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6238 thiss!1427))))))

(declare-fun b!1044624 () Bool)

(declare-fun e!592049 () Bool)

(declare-fun call!44390 () Bool)

(assert (=> b!1044624 (= e!592049 (not call!44390))))

(declare-fun bm!44384 () Bool)

(declare-fun call!44391 () Bool)

(declare-fun lt!460819 () ListLongMap!13853)

(assert (=> bm!44384 (= call!44391 (contains!6052 lt!460819 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044626 () Bool)

(declare-fun e!592053 () Unit!34001)

(declare-fun Unit!34012 () Unit!34001)

(assert (=> b!1044626 (= e!592053 Unit!34012)))

(declare-fun b!1044627 () Bool)

(declare-fun e!592060 () Bool)

(assert (=> b!1044627 (= e!592049 e!592060)))

(declare-fun res!695719 () Bool)

(assert (=> b!1044627 (= res!695719 call!44390)))

(assert (=> b!1044627 (=> (not res!695719) (not e!592060))))

(declare-fun b!1044628 () Bool)

(declare-fun lt!460812 () Unit!34001)

(assert (=> b!1044628 (= e!592053 lt!460812)))

(declare-fun lt!460808 () ListLongMap!13853)

(assert (=> b!1044628 (= lt!460808 (getCurrentListMapNoExtraKeys!3571 lt!460658 lt!460662 (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun lt!460802 () (_ BitVec 64))

(assert (=> b!1044628 (= lt!460802 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460813 () (_ BitVec 64))

(assert (=> b!1044628 (= lt!460813 (select (arr!31644 lt!460658) #b00000000000000000000000000000000))))

(declare-fun lt!460804 () Unit!34001)

(assert (=> b!1044628 (= lt!460804 (addStillContains!624 lt!460808 lt!460802 (zeroValue!6238 thiss!1427) lt!460813))))

(assert (=> b!1044628 (contains!6052 (+!3136 lt!460808 (tuple2!15843 lt!460802 (zeroValue!6238 thiss!1427))) lt!460813)))

(declare-fun lt!460806 () Unit!34001)

(assert (=> b!1044628 (= lt!460806 lt!460804)))

(declare-fun lt!460805 () ListLongMap!13853)

(assert (=> b!1044628 (= lt!460805 (getCurrentListMapNoExtraKeys!3571 lt!460658 lt!460662 (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun lt!460798 () (_ BitVec 64))

(assert (=> b!1044628 (= lt!460798 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460810 () (_ BitVec 64))

(assert (=> b!1044628 (= lt!460810 (select (arr!31644 lt!460658) #b00000000000000000000000000000000))))

(declare-fun lt!460800 () Unit!34001)

(assert (=> b!1044628 (= lt!460800 (addApplyDifferent!480 lt!460805 lt!460798 (minValue!6238 thiss!1427) lt!460810))))

(assert (=> b!1044628 (= (apply!905 (+!3136 lt!460805 (tuple2!15843 lt!460798 (minValue!6238 thiss!1427))) lt!460810) (apply!905 lt!460805 lt!460810))))

(declare-fun lt!460809 () Unit!34001)

(assert (=> b!1044628 (= lt!460809 lt!460800)))

(declare-fun lt!460799 () ListLongMap!13853)

(assert (=> b!1044628 (= lt!460799 (getCurrentListMapNoExtraKeys!3571 lt!460658 lt!460662 (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun lt!460815 () (_ BitVec 64))

(assert (=> b!1044628 (= lt!460815 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460814 () (_ BitVec 64))

(assert (=> b!1044628 (= lt!460814 (select (arr!31644 lt!460658) #b00000000000000000000000000000000))))

(declare-fun lt!460811 () Unit!34001)

(assert (=> b!1044628 (= lt!460811 (addApplyDifferent!480 lt!460799 lt!460815 (zeroValue!6238 thiss!1427) lt!460814))))

(assert (=> b!1044628 (= (apply!905 (+!3136 lt!460799 (tuple2!15843 lt!460815 (zeroValue!6238 thiss!1427))) lt!460814) (apply!905 lt!460799 lt!460814))))

(declare-fun lt!460803 () Unit!34001)

(assert (=> b!1044628 (= lt!460803 lt!460811)))

(declare-fun lt!460807 () ListLongMap!13853)

(assert (=> b!1044628 (= lt!460807 (getCurrentListMapNoExtraKeys!3571 lt!460658 lt!460662 (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun lt!460801 () (_ BitVec 64))

(assert (=> b!1044628 (= lt!460801 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460817 () (_ BitVec 64))

(assert (=> b!1044628 (= lt!460817 (select (arr!31644 lt!460658) #b00000000000000000000000000000000))))

(assert (=> b!1044628 (= lt!460812 (addApplyDifferent!480 lt!460807 lt!460801 (minValue!6238 thiss!1427) lt!460817))))

(assert (=> b!1044628 (= (apply!905 (+!3136 lt!460807 (tuple2!15843 lt!460801 (minValue!6238 thiss!1427))) lt!460817) (apply!905 lt!460807 lt!460817))))

(declare-fun c!106130 () Bool)

(declare-fun call!44388 () ListLongMap!13853)

(declare-fun bm!44385 () Bool)

(declare-fun call!44393 () ListLongMap!13853)

(declare-fun c!106127 () Bool)

(declare-fun call!44387 () ListLongMap!13853)

(assert (=> bm!44385 (= call!44389 (+!3136 (ite c!106130 call!44388 (ite c!106127 call!44387 call!44393)) (ite (or c!106130 c!106127) (tuple2!15843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6238 thiss!1427)) (tuple2!15843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6238 thiss!1427)))))))

(declare-fun b!1044629 () Bool)

(declare-fun res!695722 () Bool)

(declare-fun e!592059 () Bool)

(assert (=> b!1044629 (=> (not res!695722) (not e!592059))))

(declare-fun e!592061 () Bool)

(assert (=> b!1044629 (= res!695722 e!592061)))

(declare-fun c!106132 () Bool)

(assert (=> b!1044629 (= c!106132 (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!44386 () Bool)

(assert (=> bm!44386 (= call!44393 call!44387)))

(declare-fun b!1044630 () Bool)

(declare-fun e!592057 () Bool)

(assert (=> b!1044630 (= e!592057 (validKeyInArray!0 (select (arr!31644 lt!460658) #b00000000000000000000000000000000)))))

(declare-fun bm!44387 () Bool)

(assert (=> bm!44387 (= call!44390 (contains!6052 lt!460819 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044631 () Bool)

(declare-fun res!695718 () Bool)

(assert (=> b!1044631 (=> (not res!695718) (not e!592059))))

(declare-fun e!592055 () Bool)

(assert (=> b!1044631 (= res!695718 e!592055)))

(declare-fun res!695723 () Bool)

(assert (=> b!1044631 (=> res!695723 e!592055)))

(declare-fun e!592058 () Bool)

(assert (=> b!1044631 (= res!695723 (not e!592058))))

(declare-fun res!695721 () Bool)

(assert (=> b!1044631 (=> (not res!695721) (not e!592058))))

(assert (=> b!1044631 (= res!695721 (bvslt #b00000000000000000000000000000000 (size!32181 lt!460658)))))

(declare-fun b!1044632 () Bool)

(declare-fun e!592052 () ListLongMap!13853)

(assert (=> b!1044632 (= e!592054 e!592052)))

(assert (=> b!1044632 (= c!106127 (and (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044633 () Bool)

(declare-fun e!592056 () Bool)

(assert (=> b!1044633 (= e!592056 (= (apply!905 lt!460819 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6238 thiss!1427)))))

(declare-fun b!1044634 () Bool)

(declare-fun e!592050 () ListLongMap!13853)

(assert (=> b!1044634 (= e!592050 call!44393)))

(declare-fun b!1044635 () Bool)

(declare-fun call!44392 () ListLongMap!13853)

(assert (=> b!1044635 (= e!592050 call!44392)))

(declare-fun d!126279 () Bool)

(assert (=> d!126279 e!592059))

(declare-fun res!695716 () Bool)

(assert (=> d!126279 (=> (not res!695716) (not e!592059))))

(assert (=> d!126279 (= res!695716 (or (bvsge #b00000000000000000000000000000000 (size!32181 lt!460658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32181 lt!460658)))))))

(declare-fun lt!460818 () ListLongMap!13853)

(assert (=> d!126279 (= lt!460819 lt!460818)))

(declare-fun lt!460816 () Unit!34001)

(assert (=> d!126279 (= lt!460816 e!592053)))

(declare-fun c!106128 () Bool)

(assert (=> d!126279 (= c!106128 e!592057)))

(declare-fun res!695715 () Bool)

(assert (=> d!126279 (=> (not res!695715) (not e!592057))))

(assert (=> d!126279 (= res!695715 (bvslt #b00000000000000000000000000000000 (size!32181 lt!460658)))))

(assert (=> d!126279 (= lt!460818 e!592054)))

(assert (=> d!126279 (= c!106130 (and (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126279 (validMask!0 (mask!30512 thiss!1427))))

(assert (=> d!126279 (= (getCurrentListMap!3908 lt!460658 lt!460662 (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)) lt!460819)))

(declare-fun b!1044625 () Bool)

(assert (=> b!1044625 (= e!592061 e!592056)))

(declare-fun res!695717 () Bool)

(assert (=> b!1044625 (= res!695717 call!44391)))

(assert (=> b!1044625 (=> (not res!695717) (not e!592056))))

(declare-fun b!1044636 () Bool)

(assert (=> b!1044636 (= e!592059 e!592049)))

(declare-fun c!106131 () Bool)

(assert (=> b!1044636 (= c!106131 (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44388 () Bool)

(assert (=> bm!44388 (= call!44392 call!44389)))

(declare-fun b!1044637 () Bool)

(declare-fun e!592051 () Bool)

(assert (=> b!1044637 (= e!592051 (= (apply!905 lt!460819 (select (arr!31644 lt!460658) #b00000000000000000000000000000000)) (get!16548 (select (arr!31645 lt!460662) #b00000000000000000000000000000000) (dynLambda!1995 (defaultEntry!6404 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044637 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32182 lt!460662)))))

(assert (=> b!1044637 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32181 lt!460658)))))

(declare-fun b!1044638 () Bool)

(assert (=> b!1044638 (= e!592061 (not call!44391))))

(declare-fun bm!44389 () Bool)

(assert (=> bm!44389 (= call!44388 (getCurrentListMapNoExtraKeys!3571 lt!460658 lt!460662 (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun bm!44390 () Bool)

(assert (=> bm!44390 (= call!44387 call!44388)))

(declare-fun b!1044639 () Bool)

(assert (=> b!1044639 (= e!592052 call!44392)))

(declare-fun b!1044640 () Bool)

(assert (=> b!1044640 (= e!592058 (validKeyInArray!0 (select (arr!31644 lt!460658) #b00000000000000000000000000000000)))))

(declare-fun b!1044641 () Bool)

(assert (=> b!1044641 (= e!592055 e!592051)))

(declare-fun res!695720 () Bool)

(assert (=> b!1044641 (=> (not res!695720) (not e!592051))))

(assert (=> b!1044641 (= res!695720 (contains!6052 lt!460819 (select (arr!31644 lt!460658) #b00000000000000000000000000000000)))))

(assert (=> b!1044641 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32181 lt!460658)))))

(declare-fun b!1044642 () Bool)

(declare-fun c!106129 () Bool)

(assert (=> b!1044642 (= c!106129 (and (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1044642 (= e!592052 e!592050)))

(declare-fun b!1044643 () Bool)

(assert (=> b!1044643 (= e!592060 (= (apply!905 lt!460819 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6238 thiss!1427)))))

(assert (= (and d!126279 c!106130) b!1044623))

(assert (= (and d!126279 (not c!106130)) b!1044632))

(assert (= (and b!1044632 c!106127) b!1044639))

(assert (= (and b!1044632 (not c!106127)) b!1044642))

(assert (= (and b!1044642 c!106129) b!1044635))

(assert (= (and b!1044642 (not c!106129)) b!1044634))

(assert (= (or b!1044635 b!1044634) bm!44386))

(assert (= (or b!1044639 bm!44386) bm!44390))

(assert (= (or b!1044639 b!1044635) bm!44388))

(assert (= (or b!1044623 bm!44390) bm!44389))

(assert (= (or b!1044623 bm!44388) bm!44385))

(assert (= (and d!126279 res!695715) b!1044630))

(assert (= (and d!126279 c!106128) b!1044628))

(assert (= (and d!126279 (not c!106128)) b!1044626))

(assert (= (and d!126279 res!695716) b!1044631))

(assert (= (and b!1044631 res!695721) b!1044640))

(assert (= (and b!1044631 (not res!695723)) b!1044641))

(assert (= (and b!1044641 res!695720) b!1044637))

(assert (= (and b!1044631 res!695718) b!1044629))

(assert (= (and b!1044629 c!106132) b!1044625))

(assert (= (and b!1044629 (not c!106132)) b!1044638))

(assert (= (and b!1044625 res!695717) b!1044633))

(assert (= (or b!1044625 b!1044638) bm!44384))

(assert (= (and b!1044629 res!695722) b!1044636))

(assert (= (and b!1044636 c!106131) b!1044627))

(assert (= (and b!1044636 (not c!106131)) b!1044624))

(assert (= (and b!1044627 res!695719) b!1044643))

(assert (= (or b!1044627 b!1044624) bm!44387))

(declare-fun b_lambda!16229 () Bool)

(assert (=> (not b_lambda!16229) (not b!1044637)))

(assert (=> b!1044637 t!31280))

(declare-fun b_and!33693 () Bool)

(assert (= b_and!33691 (and (=> t!31280 result!14547) b_and!33693)))

(declare-fun m!963695 () Bool)

(assert (=> b!1044640 m!963695))

(assert (=> b!1044640 m!963695))

(declare-fun m!963697 () Bool)

(assert (=> b!1044640 m!963697))

(assert (=> d!126279 m!963629))

(declare-fun m!963699 () Bool)

(assert (=> b!1044643 m!963699))

(assert (=> b!1044641 m!963695))

(assert (=> b!1044641 m!963695))

(declare-fun m!963701 () Bool)

(assert (=> b!1044641 m!963701))

(declare-fun m!963703 () Bool)

(assert (=> b!1044628 m!963703))

(declare-fun m!963705 () Bool)

(assert (=> b!1044628 m!963705))

(declare-fun m!963707 () Bool)

(assert (=> b!1044628 m!963707))

(declare-fun m!963709 () Bool)

(assert (=> b!1044628 m!963709))

(declare-fun m!963711 () Bool)

(assert (=> b!1044628 m!963711))

(declare-fun m!963713 () Bool)

(assert (=> b!1044628 m!963713))

(declare-fun m!963715 () Bool)

(assert (=> b!1044628 m!963715))

(declare-fun m!963717 () Bool)

(assert (=> b!1044628 m!963717))

(assert (=> b!1044628 m!963705))

(declare-fun m!963719 () Bool)

(assert (=> b!1044628 m!963719))

(declare-fun m!963721 () Bool)

(assert (=> b!1044628 m!963721))

(declare-fun m!963723 () Bool)

(assert (=> b!1044628 m!963723))

(declare-fun m!963725 () Bool)

(assert (=> b!1044628 m!963725))

(assert (=> b!1044628 m!963721))

(assert (=> b!1044628 m!963711))

(declare-fun m!963727 () Bool)

(assert (=> b!1044628 m!963727))

(declare-fun m!963729 () Bool)

(assert (=> b!1044628 m!963729))

(declare-fun m!963731 () Bool)

(assert (=> b!1044628 m!963731))

(assert (=> b!1044628 m!963715))

(assert (=> b!1044628 m!963695))

(declare-fun m!963733 () Bool)

(assert (=> b!1044628 m!963733))

(declare-fun m!963735 () Bool)

(assert (=> b!1044623 m!963735))

(assert (=> b!1044630 m!963695))

(assert (=> b!1044630 m!963695))

(assert (=> b!1044630 m!963697))

(assert (=> b!1044637 m!963495))

(declare-fun m!963737 () Bool)

(assert (=> b!1044637 m!963737))

(assert (=> b!1044637 m!963495))

(declare-fun m!963739 () Bool)

(assert (=> b!1044637 m!963739))

(assert (=> b!1044637 m!963695))

(declare-fun m!963741 () Bool)

(assert (=> b!1044637 m!963741))

(assert (=> b!1044637 m!963737))

(assert (=> b!1044637 m!963695))

(assert (=> bm!44389 m!963709))

(declare-fun m!963743 () Bool)

(assert (=> bm!44385 m!963743))

(declare-fun m!963745 () Bool)

(assert (=> b!1044633 m!963745))

(declare-fun m!963747 () Bool)

(assert (=> bm!44384 m!963747))

(declare-fun m!963749 () Bool)

(assert (=> bm!44387 m!963749))

(assert (=> b!1044463 d!126279))

(declare-fun b!1044644 () Bool)

(declare-fun e!592067 () ListLongMap!13853)

(declare-fun call!44396 () ListLongMap!13853)

(assert (=> b!1044644 (= e!592067 (+!3136 call!44396 (tuple2!15843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6238 thiss!1427))))))

(declare-fun b!1044645 () Bool)

(declare-fun e!592062 () Bool)

(declare-fun call!44397 () Bool)

(assert (=> b!1044645 (= e!592062 (not call!44397))))

(declare-fun bm!44391 () Bool)

(declare-fun call!44398 () Bool)

(declare-fun lt!460841 () ListLongMap!13853)

(assert (=> bm!44391 (= call!44398 (contains!6052 lt!460841 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044647 () Bool)

(declare-fun e!592066 () Unit!34001)

(declare-fun Unit!34013 () Unit!34001)

(assert (=> b!1044647 (= e!592066 Unit!34013)))

(declare-fun b!1044648 () Bool)

(declare-fun e!592073 () Bool)

(assert (=> b!1044648 (= e!592062 e!592073)))

(declare-fun res!695728 () Bool)

(assert (=> b!1044648 (= res!695728 call!44397)))

(assert (=> b!1044648 (=> (not res!695728) (not e!592073))))

(declare-fun b!1044649 () Bool)

(declare-fun lt!460834 () Unit!34001)

(assert (=> b!1044649 (= e!592066 lt!460834)))

(declare-fun lt!460830 () ListLongMap!13853)

(assert (=> b!1044649 (= lt!460830 (getCurrentListMapNoExtraKeys!3571 (_keys!11666 thiss!1427) (_values!6427 thiss!1427) (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun lt!460824 () (_ BitVec 64))

(assert (=> b!1044649 (= lt!460824 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460835 () (_ BitVec 64))

(assert (=> b!1044649 (= lt!460835 (select (arr!31644 (_keys!11666 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460826 () Unit!34001)

(assert (=> b!1044649 (= lt!460826 (addStillContains!624 lt!460830 lt!460824 (zeroValue!6238 thiss!1427) lt!460835))))

(assert (=> b!1044649 (contains!6052 (+!3136 lt!460830 (tuple2!15843 lt!460824 (zeroValue!6238 thiss!1427))) lt!460835)))

(declare-fun lt!460828 () Unit!34001)

(assert (=> b!1044649 (= lt!460828 lt!460826)))

(declare-fun lt!460827 () ListLongMap!13853)

(assert (=> b!1044649 (= lt!460827 (getCurrentListMapNoExtraKeys!3571 (_keys!11666 thiss!1427) (_values!6427 thiss!1427) (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun lt!460820 () (_ BitVec 64))

(assert (=> b!1044649 (= lt!460820 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460832 () (_ BitVec 64))

(assert (=> b!1044649 (= lt!460832 (select (arr!31644 (_keys!11666 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460822 () Unit!34001)

(assert (=> b!1044649 (= lt!460822 (addApplyDifferent!480 lt!460827 lt!460820 (minValue!6238 thiss!1427) lt!460832))))

(assert (=> b!1044649 (= (apply!905 (+!3136 lt!460827 (tuple2!15843 lt!460820 (minValue!6238 thiss!1427))) lt!460832) (apply!905 lt!460827 lt!460832))))

(declare-fun lt!460831 () Unit!34001)

(assert (=> b!1044649 (= lt!460831 lt!460822)))

(declare-fun lt!460821 () ListLongMap!13853)

(assert (=> b!1044649 (= lt!460821 (getCurrentListMapNoExtraKeys!3571 (_keys!11666 thiss!1427) (_values!6427 thiss!1427) (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun lt!460837 () (_ BitVec 64))

(assert (=> b!1044649 (= lt!460837 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460836 () (_ BitVec 64))

(assert (=> b!1044649 (= lt!460836 (select (arr!31644 (_keys!11666 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460833 () Unit!34001)

(assert (=> b!1044649 (= lt!460833 (addApplyDifferent!480 lt!460821 lt!460837 (zeroValue!6238 thiss!1427) lt!460836))))

(assert (=> b!1044649 (= (apply!905 (+!3136 lt!460821 (tuple2!15843 lt!460837 (zeroValue!6238 thiss!1427))) lt!460836) (apply!905 lt!460821 lt!460836))))

(declare-fun lt!460825 () Unit!34001)

(assert (=> b!1044649 (= lt!460825 lt!460833)))

(declare-fun lt!460829 () ListLongMap!13853)

(assert (=> b!1044649 (= lt!460829 (getCurrentListMapNoExtraKeys!3571 (_keys!11666 thiss!1427) (_values!6427 thiss!1427) (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun lt!460823 () (_ BitVec 64))

(assert (=> b!1044649 (= lt!460823 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460839 () (_ BitVec 64))

(assert (=> b!1044649 (= lt!460839 (select (arr!31644 (_keys!11666 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044649 (= lt!460834 (addApplyDifferent!480 lt!460829 lt!460823 (minValue!6238 thiss!1427) lt!460839))))

(assert (=> b!1044649 (= (apply!905 (+!3136 lt!460829 (tuple2!15843 lt!460823 (minValue!6238 thiss!1427))) lt!460839) (apply!905 lt!460829 lt!460839))))

(declare-fun c!106133 () Bool)

(declare-fun bm!44392 () Bool)

(declare-fun c!106136 () Bool)

(declare-fun call!44394 () ListLongMap!13853)

(declare-fun call!44395 () ListLongMap!13853)

(declare-fun call!44400 () ListLongMap!13853)

(assert (=> bm!44392 (= call!44396 (+!3136 (ite c!106136 call!44395 (ite c!106133 call!44394 call!44400)) (ite (or c!106136 c!106133) (tuple2!15843 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6238 thiss!1427)) (tuple2!15843 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6238 thiss!1427)))))))

(declare-fun b!1044650 () Bool)

(declare-fun res!695731 () Bool)

(declare-fun e!592072 () Bool)

(assert (=> b!1044650 (=> (not res!695731) (not e!592072))))

(declare-fun e!592074 () Bool)

(assert (=> b!1044650 (= res!695731 e!592074)))

(declare-fun c!106138 () Bool)

(assert (=> b!1044650 (= c!106138 (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!44393 () Bool)

(assert (=> bm!44393 (= call!44400 call!44394)))

(declare-fun b!1044651 () Bool)

(declare-fun e!592070 () Bool)

(assert (=> b!1044651 (= e!592070 (validKeyInArray!0 (select (arr!31644 (_keys!11666 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44394 () Bool)

(assert (=> bm!44394 (= call!44397 (contains!6052 lt!460841 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044652 () Bool)

(declare-fun res!695727 () Bool)

(assert (=> b!1044652 (=> (not res!695727) (not e!592072))))

(declare-fun e!592068 () Bool)

(assert (=> b!1044652 (= res!695727 e!592068)))

(declare-fun res!695732 () Bool)

(assert (=> b!1044652 (=> res!695732 e!592068)))

(declare-fun e!592071 () Bool)

(assert (=> b!1044652 (= res!695732 (not e!592071))))

(declare-fun res!695730 () Bool)

(assert (=> b!1044652 (=> (not res!695730) (not e!592071))))

(assert (=> b!1044652 (= res!695730 (bvslt #b00000000000000000000000000000000 (size!32181 (_keys!11666 thiss!1427))))))

(declare-fun b!1044653 () Bool)

(declare-fun e!592065 () ListLongMap!13853)

(assert (=> b!1044653 (= e!592067 e!592065)))

(assert (=> b!1044653 (= c!106133 (and (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044654 () Bool)

(declare-fun e!592069 () Bool)

(assert (=> b!1044654 (= e!592069 (= (apply!905 lt!460841 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6238 thiss!1427)))))

(declare-fun b!1044655 () Bool)

(declare-fun e!592063 () ListLongMap!13853)

(assert (=> b!1044655 (= e!592063 call!44400)))

(declare-fun b!1044656 () Bool)

(declare-fun call!44399 () ListLongMap!13853)

(assert (=> b!1044656 (= e!592063 call!44399)))

(declare-fun d!126281 () Bool)

(assert (=> d!126281 e!592072))

(declare-fun res!695725 () Bool)

(assert (=> d!126281 (=> (not res!695725) (not e!592072))))

(assert (=> d!126281 (= res!695725 (or (bvsge #b00000000000000000000000000000000 (size!32181 (_keys!11666 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32181 (_keys!11666 thiss!1427))))))))

(declare-fun lt!460840 () ListLongMap!13853)

(assert (=> d!126281 (= lt!460841 lt!460840)))

(declare-fun lt!460838 () Unit!34001)

(assert (=> d!126281 (= lt!460838 e!592066)))

(declare-fun c!106134 () Bool)

(assert (=> d!126281 (= c!106134 e!592070)))

(declare-fun res!695724 () Bool)

(assert (=> d!126281 (=> (not res!695724) (not e!592070))))

(assert (=> d!126281 (= res!695724 (bvslt #b00000000000000000000000000000000 (size!32181 (_keys!11666 thiss!1427))))))

(assert (=> d!126281 (= lt!460840 e!592067)))

(assert (=> d!126281 (= c!106136 (and (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126281 (validMask!0 (mask!30512 thiss!1427))))

(assert (=> d!126281 (= (getCurrentListMap!3908 (_keys!11666 thiss!1427) (_values!6427 thiss!1427) (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)) lt!460841)))

(declare-fun b!1044646 () Bool)

(assert (=> b!1044646 (= e!592074 e!592069)))

(declare-fun res!695726 () Bool)

(assert (=> b!1044646 (= res!695726 call!44398)))

(assert (=> b!1044646 (=> (not res!695726) (not e!592069))))

(declare-fun b!1044657 () Bool)

(assert (=> b!1044657 (= e!592072 e!592062)))

(declare-fun c!106137 () Bool)

(assert (=> b!1044657 (= c!106137 (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44395 () Bool)

(assert (=> bm!44395 (= call!44399 call!44396)))

(declare-fun b!1044658 () Bool)

(declare-fun e!592064 () Bool)

(assert (=> b!1044658 (= e!592064 (= (apply!905 lt!460841 (select (arr!31644 (_keys!11666 thiss!1427)) #b00000000000000000000000000000000)) (get!16548 (select (arr!31645 (_values!6427 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1995 (defaultEntry!6404 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044658 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32182 (_values!6427 thiss!1427))))))

(assert (=> b!1044658 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32181 (_keys!11666 thiss!1427))))))

(declare-fun b!1044659 () Bool)

(assert (=> b!1044659 (= e!592074 (not call!44398))))

(declare-fun bm!44396 () Bool)

(assert (=> bm!44396 (= call!44395 (getCurrentListMapNoExtraKeys!3571 (_keys!11666 thiss!1427) (_values!6427 thiss!1427) (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun bm!44397 () Bool)

(assert (=> bm!44397 (= call!44394 call!44395)))

(declare-fun b!1044660 () Bool)

(assert (=> b!1044660 (= e!592065 call!44399)))

(declare-fun b!1044661 () Bool)

(assert (=> b!1044661 (= e!592071 (validKeyInArray!0 (select (arr!31644 (_keys!11666 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1044662 () Bool)

(assert (=> b!1044662 (= e!592068 e!592064)))

(declare-fun res!695729 () Bool)

(assert (=> b!1044662 (=> (not res!695729) (not e!592064))))

(assert (=> b!1044662 (= res!695729 (contains!6052 lt!460841 (select (arr!31644 (_keys!11666 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1044662 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32181 (_keys!11666 thiss!1427))))))

(declare-fun b!1044663 () Bool)

(declare-fun c!106135 () Bool)

(assert (=> b!1044663 (= c!106135 (and (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1044663 (= e!592065 e!592063)))

(declare-fun b!1044664 () Bool)

(assert (=> b!1044664 (= e!592073 (= (apply!905 lt!460841 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6238 thiss!1427)))))

(assert (= (and d!126281 c!106136) b!1044644))

(assert (= (and d!126281 (not c!106136)) b!1044653))

(assert (= (and b!1044653 c!106133) b!1044660))

(assert (= (and b!1044653 (not c!106133)) b!1044663))

(assert (= (and b!1044663 c!106135) b!1044656))

(assert (= (and b!1044663 (not c!106135)) b!1044655))

(assert (= (or b!1044656 b!1044655) bm!44393))

(assert (= (or b!1044660 bm!44393) bm!44397))

(assert (= (or b!1044660 b!1044656) bm!44395))

(assert (= (or b!1044644 bm!44397) bm!44396))

(assert (= (or b!1044644 bm!44395) bm!44392))

(assert (= (and d!126281 res!695724) b!1044651))

(assert (= (and d!126281 c!106134) b!1044649))

(assert (= (and d!126281 (not c!106134)) b!1044647))

(assert (= (and d!126281 res!695725) b!1044652))

(assert (= (and b!1044652 res!695730) b!1044661))

(assert (= (and b!1044652 (not res!695732)) b!1044662))

(assert (= (and b!1044662 res!695729) b!1044658))

(assert (= (and b!1044652 res!695727) b!1044650))

(assert (= (and b!1044650 c!106138) b!1044646))

(assert (= (and b!1044650 (not c!106138)) b!1044659))

(assert (= (and b!1044646 res!695726) b!1044654))

(assert (= (or b!1044646 b!1044659) bm!44391))

(assert (= (and b!1044650 res!695731) b!1044657))

(assert (= (and b!1044657 c!106137) b!1044648))

(assert (= (and b!1044657 (not c!106137)) b!1044645))

(assert (= (and b!1044648 res!695728) b!1044664))

(assert (= (or b!1044648 b!1044645) bm!44394))

(declare-fun b_lambda!16231 () Bool)

(assert (=> (not b_lambda!16231) (not b!1044658)))

(assert (=> b!1044658 t!31280))

(declare-fun b_and!33695 () Bool)

(assert (= b_and!33693 (and (=> t!31280 result!14547) b_and!33695)))

(declare-fun m!963751 () Bool)

(assert (=> b!1044661 m!963751))

(assert (=> b!1044661 m!963751))

(declare-fun m!963753 () Bool)

(assert (=> b!1044661 m!963753))

(assert (=> d!126281 m!963629))

(declare-fun m!963755 () Bool)

(assert (=> b!1044664 m!963755))

(assert (=> b!1044662 m!963751))

(assert (=> b!1044662 m!963751))

(declare-fun m!963757 () Bool)

(assert (=> b!1044662 m!963757))

(declare-fun m!963759 () Bool)

(assert (=> b!1044649 m!963759))

(declare-fun m!963761 () Bool)

(assert (=> b!1044649 m!963761))

(declare-fun m!963763 () Bool)

(assert (=> b!1044649 m!963763))

(declare-fun m!963765 () Bool)

(assert (=> b!1044649 m!963765))

(declare-fun m!963767 () Bool)

(assert (=> b!1044649 m!963767))

(declare-fun m!963769 () Bool)

(assert (=> b!1044649 m!963769))

(declare-fun m!963771 () Bool)

(assert (=> b!1044649 m!963771))

(declare-fun m!963773 () Bool)

(assert (=> b!1044649 m!963773))

(assert (=> b!1044649 m!963761))

(declare-fun m!963775 () Bool)

(assert (=> b!1044649 m!963775))

(declare-fun m!963777 () Bool)

(assert (=> b!1044649 m!963777))

(declare-fun m!963779 () Bool)

(assert (=> b!1044649 m!963779))

(declare-fun m!963781 () Bool)

(assert (=> b!1044649 m!963781))

(assert (=> b!1044649 m!963777))

(assert (=> b!1044649 m!963767))

(declare-fun m!963783 () Bool)

(assert (=> b!1044649 m!963783))

(declare-fun m!963785 () Bool)

(assert (=> b!1044649 m!963785))

(declare-fun m!963787 () Bool)

(assert (=> b!1044649 m!963787))

(assert (=> b!1044649 m!963771))

(assert (=> b!1044649 m!963751))

(declare-fun m!963789 () Bool)

(assert (=> b!1044649 m!963789))

(declare-fun m!963791 () Bool)

(assert (=> b!1044644 m!963791))

(assert (=> b!1044651 m!963751))

(assert (=> b!1044651 m!963751))

(assert (=> b!1044651 m!963753))

(assert (=> b!1044658 m!963495))

(declare-fun m!963793 () Bool)

(assert (=> b!1044658 m!963793))

(assert (=> b!1044658 m!963495))

(declare-fun m!963795 () Bool)

(assert (=> b!1044658 m!963795))

(assert (=> b!1044658 m!963751))

(declare-fun m!963797 () Bool)

(assert (=> b!1044658 m!963797))

(assert (=> b!1044658 m!963793))

(assert (=> b!1044658 m!963751))

(assert (=> bm!44396 m!963765))

(declare-fun m!963799 () Bool)

(assert (=> bm!44392 m!963799))

(declare-fun m!963801 () Bool)

(assert (=> b!1044654 m!963801))

(declare-fun m!963803 () Bool)

(assert (=> bm!44391 m!963803))

(declare-fun m!963805 () Bool)

(assert (=> bm!44394 m!963805))

(assert (=> b!1044463 d!126281))

(declare-fun d!126283 () Bool)

(declare-fun lt!460844 () ListLongMap!13853)

(assert (=> d!126283 (not (contains!6052 lt!460844 key!909))))

(declare-fun removeStrictlySorted!62 (List!22046 (_ BitVec 64)) List!22046)

(assert (=> d!126283 (= lt!460844 (ListLongMap!13854 (removeStrictlySorted!62 (toList!6942 (getCurrentListMap!3908 (_keys!11666 thiss!1427) (_values!6427 thiss!1427) (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427))) key!909)))))

(assert (=> d!126283 (= (-!534 (getCurrentListMap!3908 (_keys!11666 thiss!1427) (_values!6427 thiss!1427) (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)) key!909) lt!460844)))

(declare-fun bs!30490 () Bool)

(assert (= bs!30490 d!126283))

(declare-fun m!963807 () Bool)

(assert (=> bs!30490 m!963807))

(declare-fun m!963809 () Bool)

(assert (=> bs!30490 m!963809))

(assert (=> b!1044463 d!126283))

(declare-fun d!126285 () Bool)

(declare-fun e!592080 () Bool)

(assert (=> d!126285 e!592080))

(declare-fun res!695735 () Bool)

(assert (=> d!126285 (=> res!695735 e!592080)))

(declare-fun lt!460854 () Bool)

(assert (=> d!126285 (= res!695735 (not lt!460854))))

(declare-fun lt!460856 () Bool)

(assert (=> d!126285 (= lt!460854 lt!460856)))

(declare-fun lt!460855 () Unit!34001)

(declare-fun e!592079 () Unit!34001)

(assert (=> d!126285 (= lt!460855 e!592079)))

(declare-fun c!106141 () Bool)

(assert (=> d!126285 (= c!106141 lt!460856)))

(declare-fun containsKey!567 (List!22046 (_ BitVec 64)) Bool)

(assert (=> d!126285 (= lt!460856 (containsKey!567 (toList!6942 (getCurrentListMap!3908 (_keys!11666 (_2!7931 lt!460660)) (_values!6427 (_2!7931 lt!460660)) (mask!30512 (_2!7931 lt!460660)) (extraKeys!6132 (_2!7931 lt!460660)) (zeroValue!6238 (_2!7931 lt!460660)) (minValue!6238 (_2!7931 lt!460660)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7931 lt!460660)))) key!909))))

(assert (=> d!126285 (= (contains!6052 (getCurrentListMap!3908 (_keys!11666 (_2!7931 lt!460660)) (_values!6427 (_2!7931 lt!460660)) (mask!30512 (_2!7931 lt!460660)) (extraKeys!6132 (_2!7931 lt!460660)) (zeroValue!6238 (_2!7931 lt!460660)) (minValue!6238 (_2!7931 lt!460660)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7931 lt!460660))) key!909) lt!460854)))

(declare-fun b!1044671 () Bool)

(declare-fun lt!460853 () Unit!34001)

(assert (=> b!1044671 (= e!592079 lt!460853)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!399 (List!22046 (_ BitVec 64)) Unit!34001)

(assert (=> b!1044671 (= lt!460853 (lemmaContainsKeyImpliesGetValueByKeyDefined!399 (toList!6942 (getCurrentListMap!3908 (_keys!11666 (_2!7931 lt!460660)) (_values!6427 (_2!7931 lt!460660)) (mask!30512 (_2!7931 lt!460660)) (extraKeys!6132 (_2!7931 lt!460660)) (zeroValue!6238 (_2!7931 lt!460660)) (minValue!6238 (_2!7931 lt!460660)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7931 lt!460660)))) key!909))))

(declare-datatypes ((Option!645 0))(
  ( (Some!644 (v!15066 V!37995)) (None!643) )
))
(declare-fun isDefined!442 (Option!645) Bool)

(declare-fun getValueByKey!594 (List!22046 (_ BitVec 64)) Option!645)

(assert (=> b!1044671 (isDefined!442 (getValueByKey!594 (toList!6942 (getCurrentListMap!3908 (_keys!11666 (_2!7931 lt!460660)) (_values!6427 (_2!7931 lt!460660)) (mask!30512 (_2!7931 lt!460660)) (extraKeys!6132 (_2!7931 lt!460660)) (zeroValue!6238 (_2!7931 lt!460660)) (minValue!6238 (_2!7931 lt!460660)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7931 lt!460660)))) key!909))))

(declare-fun b!1044672 () Bool)

(declare-fun Unit!34014 () Unit!34001)

(assert (=> b!1044672 (= e!592079 Unit!34014)))

(declare-fun b!1044673 () Bool)

(assert (=> b!1044673 (= e!592080 (isDefined!442 (getValueByKey!594 (toList!6942 (getCurrentListMap!3908 (_keys!11666 (_2!7931 lt!460660)) (_values!6427 (_2!7931 lt!460660)) (mask!30512 (_2!7931 lt!460660)) (extraKeys!6132 (_2!7931 lt!460660)) (zeroValue!6238 (_2!7931 lt!460660)) (minValue!6238 (_2!7931 lt!460660)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7931 lt!460660)))) key!909)))))

(assert (= (and d!126285 c!106141) b!1044671))

(assert (= (and d!126285 (not c!106141)) b!1044672))

(assert (= (and d!126285 (not res!695735)) b!1044673))

(declare-fun m!963811 () Bool)

(assert (=> d!126285 m!963811))

(declare-fun m!963813 () Bool)

(assert (=> b!1044671 m!963813))

(declare-fun m!963815 () Bool)

(assert (=> b!1044671 m!963815))

(assert (=> b!1044671 m!963815))

(declare-fun m!963817 () Bool)

(assert (=> b!1044671 m!963817))

(assert (=> b!1044673 m!963815))

(assert (=> b!1044673 m!963815))

(assert (=> b!1044673 m!963817))

(assert (=> b!1044463 d!126285))

(declare-fun d!126287 () Bool)

(declare-fun e!592083 () Bool)

(assert (=> d!126287 e!592083))

(declare-fun res!695738 () Bool)

(assert (=> d!126287 (=> (not res!695738) (not e!592083))))

(assert (=> d!126287 (= res!695738 (and (bvsge (index!41740 lt!460656) #b00000000000000000000000000000000) (bvslt (index!41740 lt!460656) (size!32181 (_keys!11666 thiss!1427)))))))

(declare-fun lt!460859 () Unit!34001)

(declare-fun choose!25 (array!65791 (_ BitVec 32) (_ BitVec 32)) Unit!34001)

(assert (=> d!126287 (= lt!460859 (choose!25 (_keys!11666 thiss!1427) (index!41740 lt!460656) (mask!30512 thiss!1427)))))

(assert (=> d!126287 (validMask!0 (mask!30512 thiss!1427))))

(assert (=> d!126287 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11666 thiss!1427) (index!41740 lt!460656) (mask!30512 thiss!1427)) lt!460859)))

(declare-fun b!1044676 () Bool)

(assert (=> b!1044676 (= e!592083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65792 (store (arr!31644 (_keys!11666 thiss!1427)) (index!41740 lt!460656) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32181 (_keys!11666 thiss!1427))) (mask!30512 thiss!1427)))))

(assert (= (and d!126287 res!695738) b!1044676))

(declare-fun m!963819 () Bool)

(assert (=> d!126287 m!963819))

(assert (=> d!126287 m!963629))

(assert (=> b!1044676 m!963483))

(declare-fun m!963821 () Bool)

(assert (=> b!1044676 m!963821))

(assert (=> b!1044463 d!126287))

(declare-fun b!1044685 () Bool)

(declare-fun e!592088 () (_ BitVec 32))

(declare-fun call!44403 () (_ BitVec 32))

(assert (=> b!1044685 (= e!592088 call!44403)))

(declare-fun b!1044686 () Bool)

(assert (=> b!1044686 (= e!592088 (bvadd #b00000000000000000000000000000001 call!44403))))

(declare-fun d!126289 () Bool)

(declare-fun lt!460862 () (_ BitVec 32))

(assert (=> d!126289 (and (bvsge lt!460862 #b00000000000000000000000000000000) (bvsle lt!460862 (bvsub (size!32181 lt!460658) #b00000000000000000000000000000000)))))

(declare-fun e!592089 () (_ BitVec 32))

(assert (=> d!126289 (= lt!460862 e!592089)))

(declare-fun c!106146 () Bool)

(assert (=> d!126289 (= c!106146 (bvsge #b00000000000000000000000000000000 (size!32181 (_keys!11666 thiss!1427))))))

(assert (=> d!126289 (and (bvsle #b00000000000000000000000000000000 (size!32181 (_keys!11666 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32181 (_keys!11666 thiss!1427)) (size!32181 lt!460658)))))

(assert (=> d!126289 (= (arrayCountValidKeys!0 lt!460658 #b00000000000000000000000000000000 (size!32181 (_keys!11666 thiss!1427))) lt!460862)))

(declare-fun b!1044687 () Bool)

(assert (=> b!1044687 (= e!592089 #b00000000000000000000000000000000)))

(declare-fun b!1044688 () Bool)

(assert (=> b!1044688 (= e!592089 e!592088)))

(declare-fun c!106147 () Bool)

(assert (=> b!1044688 (= c!106147 (validKeyInArray!0 (select (arr!31644 lt!460658) #b00000000000000000000000000000000)))))

(declare-fun bm!44400 () Bool)

(assert (=> bm!44400 (= call!44403 (arrayCountValidKeys!0 lt!460658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32181 (_keys!11666 thiss!1427))))))

(assert (= (and d!126289 c!106146) b!1044687))

(assert (= (and d!126289 (not c!106146)) b!1044688))

(assert (= (and b!1044688 c!106147) b!1044686))

(assert (= (and b!1044688 (not c!106147)) b!1044685))

(assert (= (or b!1044686 b!1044685) bm!44400))

(assert (=> b!1044688 m!963695))

(assert (=> b!1044688 m!963695))

(assert (=> b!1044688 m!963697))

(declare-fun m!963823 () Bool)

(assert (=> bm!44400 m!963823))

(assert (=> b!1044463 d!126289))

(declare-fun d!126291 () Bool)

(declare-fun e!592092 () Bool)

(assert (=> d!126291 e!592092))

(declare-fun res!695741 () Bool)

(assert (=> d!126291 (=> (not res!695741) (not e!592092))))

(assert (=> d!126291 (= res!695741 (bvslt (index!41740 lt!460656) (size!32181 (_keys!11666 thiss!1427))))))

(declare-fun lt!460865 () Unit!34001)

(declare-fun choose!121 (array!65791 (_ BitVec 32) (_ BitVec 64)) Unit!34001)

(assert (=> d!126291 (= lt!460865 (choose!121 (_keys!11666 thiss!1427) (index!41740 lt!460656) key!909))))

(assert (=> d!126291 (bvsge (index!41740 lt!460656) #b00000000000000000000000000000000)))

(assert (=> d!126291 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11666 thiss!1427) (index!41740 lt!460656) key!909) lt!460865)))

(declare-fun b!1044691 () Bool)

(assert (=> b!1044691 (= e!592092 (not (arrayContainsKey!0 (array!65792 (store (arr!31644 (_keys!11666 thiss!1427)) (index!41740 lt!460656) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32181 (_keys!11666 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126291 res!695741) b!1044691))

(declare-fun m!963825 () Bool)

(assert (=> d!126291 m!963825))

(assert (=> b!1044691 m!963483))

(declare-fun m!963827 () Bool)

(assert (=> b!1044691 m!963827))

(assert (=> b!1044463 d!126291))

(declare-fun b!1044702 () Bool)

(declare-fun e!592101 () Bool)

(declare-fun contains!6054 (List!22047 (_ BitVec 64)) Bool)

(assert (=> b!1044702 (= e!592101 (contains!6054 Nil!22044 (select (arr!31644 lt!460658) #b00000000000000000000000000000000)))))

(declare-fun b!1044703 () Bool)

(declare-fun e!592104 () Bool)

(declare-fun call!44406 () Bool)

(assert (=> b!1044703 (= e!592104 call!44406)))

(declare-fun b!1044704 () Bool)

(assert (=> b!1044704 (= e!592104 call!44406)))

(declare-fun b!1044705 () Bool)

(declare-fun e!592103 () Bool)

(declare-fun e!592102 () Bool)

(assert (=> b!1044705 (= e!592103 e!592102)))

(declare-fun res!695750 () Bool)

(assert (=> b!1044705 (=> (not res!695750) (not e!592102))))

(assert (=> b!1044705 (= res!695750 (not e!592101))))

(declare-fun res!695748 () Bool)

(assert (=> b!1044705 (=> (not res!695748) (not e!592101))))

(assert (=> b!1044705 (= res!695748 (validKeyInArray!0 (select (arr!31644 lt!460658) #b00000000000000000000000000000000)))))

(declare-fun bm!44403 () Bool)

(declare-fun c!106150 () Bool)

(assert (=> bm!44403 (= call!44406 (arrayNoDuplicates!0 lt!460658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106150 (Cons!22043 (select (arr!31644 lt!460658) #b00000000000000000000000000000000) Nil!22044) Nil!22044)))))

(declare-fun d!126293 () Bool)

(declare-fun res!695749 () Bool)

(assert (=> d!126293 (=> res!695749 e!592103)))

(assert (=> d!126293 (= res!695749 (bvsge #b00000000000000000000000000000000 (size!32181 lt!460658)))))

(assert (=> d!126293 (= (arrayNoDuplicates!0 lt!460658 #b00000000000000000000000000000000 Nil!22044) e!592103)))

(declare-fun b!1044706 () Bool)

(assert (=> b!1044706 (= e!592102 e!592104)))

(assert (=> b!1044706 (= c!106150 (validKeyInArray!0 (select (arr!31644 lt!460658) #b00000000000000000000000000000000)))))

(assert (= (and d!126293 (not res!695749)) b!1044705))

(assert (= (and b!1044705 res!695748) b!1044702))

(assert (= (and b!1044705 res!695750) b!1044706))

(assert (= (and b!1044706 c!106150) b!1044703))

(assert (= (and b!1044706 (not c!106150)) b!1044704))

(assert (= (or b!1044703 b!1044704) bm!44403))

(assert (=> b!1044702 m!963695))

(assert (=> b!1044702 m!963695))

(declare-fun m!963829 () Bool)

(assert (=> b!1044702 m!963829))

(assert (=> b!1044705 m!963695))

(assert (=> b!1044705 m!963695))

(assert (=> b!1044705 m!963697))

(assert (=> bm!44403 m!963695))

(declare-fun m!963831 () Bool)

(assert (=> bm!44403 m!963831))

(assert (=> b!1044706 m!963695))

(assert (=> b!1044706 m!963695))

(assert (=> b!1044706 m!963697))

(assert (=> b!1044463 d!126293))

(declare-fun d!126295 () Bool)

(declare-fun res!695755 () Bool)

(declare-fun e!592109 () Bool)

(assert (=> d!126295 (=> res!695755 e!592109)))

(assert (=> d!126295 (= res!695755 (= (select (arr!31644 lt!460658) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126295 (= (arrayContainsKey!0 lt!460658 key!909 #b00000000000000000000000000000000) e!592109)))

(declare-fun b!1044711 () Bool)

(declare-fun e!592110 () Bool)

(assert (=> b!1044711 (= e!592109 e!592110)))

(declare-fun res!695756 () Bool)

(assert (=> b!1044711 (=> (not res!695756) (not e!592110))))

(assert (=> b!1044711 (= res!695756 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32181 lt!460658)))))

(declare-fun b!1044712 () Bool)

(assert (=> b!1044712 (= e!592110 (arrayContainsKey!0 lt!460658 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126295 (not res!695755)) b!1044711))

(assert (= (and b!1044711 res!695756) b!1044712))

(assert (=> d!126295 m!963695))

(declare-fun m!963833 () Bool)

(assert (=> b!1044712 m!963833))

(assert (=> b!1044463 d!126295))

(declare-fun b!1044713 () Bool)

(declare-fun e!592111 () (_ BitVec 32))

(declare-fun call!44407 () (_ BitVec 32))

(assert (=> b!1044713 (= e!592111 call!44407)))

(declare-fun b!1044714 () Bool)

(assert (=> b!1044714 (= e!592111 (bvadd #b00000000000000000000000000000001 call!44407))))

(declare-fun d!126297 () Bool)

(declare-fun lt!460866 () (_ BitVec 32))

(assert (=> d!126297 (and (bvsge lt!460866 #b00000000000000000000000000000000) (bvsle lt!460866 (bvsub (size!32181 (_keys!11666 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!592112 () (_ BitVec 32))

(assert (=> d!126297 (= lt!460866 e!592112)))

(declare-fun c!106151 () Bool)

(assert (=> d!126297 (= c!106151 (bvsge #b00000000000000000000000000000000 (size!32181 (_keys!11666 thiss!1427))))))

(assert (=> d!126297 (and (bvsle #b00000000000000000000000000000000 (size!32181 (_keys!11666 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32181 (_keys!11666 thiss!1427)) (size!32181 (_keys!11666 thiss!1427))))))

(assert (=> d!126297 (= (arrayCountValidKeys!0 (_keys!11666 thiss!1427) #b00000000000000000000000000000000 (size!32181 (_keys!11666 thiss!1427))) lt!460866)))

(declare-fun b!1044715 () Bool)

(assert (=> b!1044715 (= e!592112 #b00000000000000000000000000000000)))

(declare-fun b!1044716 () Bool)

(assert (=> b!1044716 (= e!592112 e!592111)))

(declare-fun c!106152 () Bool)

(assert (=> b!1044716 (= c!106152 (validKeyInArray!0 (select (arr!31644 (_keys!11666 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44404 () Bool)

(assert (=> bm!44404 (= call!44407 (arrayCountValidKeys!0 (_keys!11666 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32181 (_keys!11666 thiss!1427))))))

(assert (= (and d!126297 c!106151) b!1044715))

(assert (= (and d!126297 (not c!106151)) b!1044716))

(assert (= (and b!1044716 c!106152) b!1044714))

(assert (= (and b!1044716 (not c!106152)) b!1044713))

(assert (= (or b!1044714 b!1044713) bm!44404))

(assert (=> b!1044716 m!963751))

(assert (=> b!1044716 m!963751))

(assert (=> b!1044716 m!963753))

(declare-fun m!963835 () Bool)

(assert (=> bm!44404 m!963835))

(assert (=> b!1044463 d!126297))

(declare-fun d!126299 () Bool)

(declare-fun e!592117 () Bool)

(assert (=> d!126299 e!592117))

(declare-fun res!695765 () Bool)

(assert (=> d!126299 (=> (not res!695765) (not e!592117))))

(assert (=> d!126299 (= res!695765 (and (bvsge (index!41740 lt!460656) #b00000000000000000000000000000000) (bvslt (index!41740 lt!460656) (size!32181 (_keys!11666 thiss!1427)))))))

(declare-fun lt!460869 () Unit!34001)

(declare-fun choose!82 (array!65791 (_ BitVec 32) (_ BitVec 64)) Unit!34001)

(assert (=> d!126299 (= lt!460869 (choose!82 (_keys!11666 thiss!1427) (index!41740 lt!460656) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!592118 () Bool)

(assert (=> d!126299 e!592118))

(declare-fun res!695766 () Bool)

(assert (=> d!126299 (=> (not res!695766) (not e!592118))))

(assert (=> d!126299 (= res!695766 (and (bvsge (index!41740 lt!460656) #b00000000000000000000000000000000) (bvslt (index!41740 lt!460656) (size!32181 (_keys!11666 thiss!1427)))))))

(assert (=> d!126299 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11666 thiss!1427) (index!41740 lt!460656) #b1000000000000000000000000000000000000000000000000000000000000000) lt!460869)))

(declare-fun b!1044725 () Bool)

(declare-fun res!695767 () Bool)

(assert (=> b!1044725 (=> (not res!695767) (not e!592118))))

(assert (=> b!1044725 (= res!695767 (validKeyInArray!0 (select (arr!31644 (_keys!11666 thiss!1427)) (index!41740 lt!460656))))))

(declare-fun b!1044726 () Bool)

(declare-fun res!695768 () Bool)

(assert (=> b!1044726 (=> (not res!695768) (not e!592118))))

(assert (=> b!1044726 (= res!695768 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1044728 () Bool)

(assert (=> b!1044728 (= e!592117 (= (arrayCountValidKeys!0 (array!65792 (store (arr!31644 (_keys!11666 thiss!1427)) (index!41740 lt!460656) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32181 (_keys!11666 thiss!1427))) #b00000000000000000000000000000000 (size!32181 (_keys!11666 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11666 thiss!1427) #b00000000000000000000000000000000 (size!32181 (_keys!11666 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1044727 () Bool)

(assert (=> b!1044727 (= e!592118 (bvslt (size!32181 (_keys!11666 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!126299 res!695766) b!1044725))

(assert (= (and b!1044725 res!695767) b!1044726))

(assert (= (and b!1044726 res!695768) b!1044727))

(assert (= (and d!126299 res!695765) b!1044728))

(declare-fun m!963837 () Bool)

(assert (=> d!126299 m!963837))

(declare-fun m!963839 () Bool)

(assert (=> b!1044725 m!963839))

(assert (=> b!1044725 m!963839))

(declare-fun m!963841 () Bool)

(assert (=> b!1044725 m!963841))

(declare-fun m!963843 () Bool)

(assert (=> b!1044726 m!963843))

(assert (=> b!1044728 m!963483))

(declare-fun m!963845 () Bool)

(assert (=> b!1044728 m!963845))

(assert (=> b!1044728 m!963481))

(assert (=> b!1044463 d!126299))

(declare-fun b!1044737 () Bool)

(declare-fun e!592127 () Bool)

(declare-fun call!44410 () Bool)

(assert (=> b!1044737 (= e!592127 call!44410)))

(declare-fun d!126301 () Bool)

(declare-fun res!695774 () Bool)

(declare-fun e!592125 () Bool)

(assert (=> d!126301 (=> res!695774 e!592125)))

(assert (=> d!126301 (= res!695774 (bvsge #b00000000000000000000000000000000 (size!32181 lt!460658)))))

(assert (=> d!126301 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460658 (mask!30512 thiss!1427)) e!592125)))

(declare-fun b!1044738 () Bool)

(declare-fun e!592126 () Bool)

(assert (=> b!1044738 (= e!592127 e!592126)))

(declare-fun lt!460878 () (_ BitVec 64))

(assert (=> b!1044738 (= lt!460878 (select (arr!31644 lt!460658) #b00000000000000000000000000000000))))

(declare-fun lt!460877 () Unit!34001)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65791 (_ BitVec 64) (_ BitVec 32)) Unit!34001)

(assert (=> b!1044738 (= lt!460877 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!460658 lt!460878 #b00000000000000000000000000000000))))

(assert (=> b!1044738 (arrayContainsKey!0 lt!460658 lt!460878 #b00000000000000000000000000000000)))

(declare-fun lt!460876 () Unit!34001)

(assert (=> b!1044738 (= lt!460876 lt!460877)))

(declare-fun res!695773 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65791 (_ BitVec 32)) SeekEntryResult!9842)

(assert (=> b!1044738 (= res!695773 (= (seekEntryOrOpen!0 (select (arr!31644 lt!460658) #b00000000000000000000000000000000) lt!460658 (mask!30512 thiss!1427)) (Found!9842 #b00000000000000000000000000000000)))))

(assert (=> b!1044738 (=> (not res!695773) (not e!592126))))

(declare-fun b!1044739 () Bool)

(assert (=> b!1044739 (= e!592125 e!592127)))

(declare-fun c!106155 () Bool)

(assert (=> b!1044739 (= c!106155 (validKeyInArray!0 (select (arr!31644 lt!460658) #b00000000000000000000000000000000)))))

(declare-fun bm!44407 () Bool)

(assert (=> bm!44407 (= call!44410 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!460658 (mask!30512 thiss!1427)))))

(declare-fun b!1044740 () Bool)

(assert (=> b!1044740 (= e!592126 call!44410)))

(assert (= (and d!126301 (not res!695774)) b!1044739))

(assert (= (and b!1044739 c!106155) b!1044738))

(assert (= (and b!1044739 (not c!106155)) b!1044737))

(assert (= (and b!1044738 res!695773) b!1044740))

(assert (= (or b!1044740 b!1044737) bm!44407))

(assert (=> b!1044738 m!963695))

(declare-fun m!963847 () Bool)

(assert (=> b!1044738 m!963847))

(declare-fun m!963849 () Bool)

(assert (=> b!1044738 m!963849))

(assert (=> b!1044738 m!963695))

(declare-fun m!963851 () Bool)

(assert (=> b!1044738 m!963851))

(assert (=> b!1044739 m!963695))

(assert (=> b!1044739 m!963695))

(assert (=> b!1044739 m!963697))

(declare-fun m!963853 () Bool)

(assert (=> bm!44407 m!963853))

(assert (=> b!1044463 d!126301))

(declare-fun d!126303 () Bool)

(declare-fun e!592130 () Bool)

(assert (=> d!126303 e!592130))

(declare-fun res!695777 () Bool)

(assert (=> d!126303 (=> (not res!695777) (not e!592130))))

(assert (=> d!126303 (= res!695777 (and (bvsge (index!41740 lt!460656) #b00000000000000000000000000000000) (bvslt (index!41740 lt!460656) (size!32181 (_keys!11666 thiss!1427)))))))

(declare-fun lt!460881 () Unit!34001)

(declare-fun choose!1719 (array!65791 array!65793 (_ BitVec 32) (_ BitVec 32) V!37995 V!37995 (_ BitVec 32) (_ BitVec 64) Int) Unit!34001)

(assert (=> d!126303 (= lt!460881 (choose!1719 (_keys!11666 thiss!1427) (_values!6427 thiss!1427) (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) (index!41740 lt!460656) key!909 (defaultEntry!6404 thiss!1427)))))

(assert (=> d!126303 (validMask!0 (mask!30512 thiss!1427))))

(assert (=> d!126303 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!56 (_keys!11666 thiss!1427) (_values!6427 thiss!1427) (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) (index!41740 lt!460656) key!909 (defaultEntry!6404 thiss!1427)) lt!460881)))

(declare-fun b!1044743 () Bool)

(assert (=> b!1044743 (= e!592130 (= (-!534 (getCurrentListMap!3908 (_keys!11666 thiss!1427) (_values!6427 thiss!1427) (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)) key!909) (getCurrentListMap!3908 (array!65792 (store (arr!31644 (_keys!11666 thiss!1427)) (index!41740 lt!460656) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32181 (_keys!11666 thiss!1427))) (array!65794 (store (arr!31645 (_values!6427 thiss!1427)) (index!41740 lt!460656) (ValueCellFull!11717 (dynLambda!1995 (defaultEntry!6404 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32182 (_values!6427 thiss!1427))) (mask!30512 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427))))))

(assert (=> b!1044743 (bvslt (index!41740 lt!460656) (size!32182 (_values!6427 thiss!1427)))))

(assert (= (and d!126303 res!695777) b!1044743))

(declare-fun b_lambda!16233 () Bool)

(assert (=> (not b_lambda!16233) (not b!1044743)))

(assert (=> b!1044743 t!31280))

(declare-fun b_and!33697 () Bool)

(assert (= b_and!33695 (and (=> t!31280 result!14547) b_and!33697)))

(declare-fun m!963855 () Bool)

(assert (=> d!126303 m!963855))

(assert (=> d!126303 m!963629))

(assert (=> b!1044743 m!963497))

(assert (=> b!1044743 m!963483))

(declare-fun m!963857 () Bool)

(assert (=> b!1044743 m!963857))

(assert (=> b!1044743 m!963495))

(assert (=> b!1044743 m!963487))

(assert (=> b!1044743 m!963489))

(assert (=> b!1044743 m!963487))

(assert (=> b!1044463 d!126303))

(declare-fun d!126305 () Bool)

(assert (=> d!126305 (= (validMask!0 (mask!30512 (_2!7931 lt!460660))) (and (or (= (mask!30512 (_2!7931 lt!460660)) #b00000000000000000000000000000111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000000000000000000000001111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000000000000000000000011111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000000000000000000000111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000000000000000000001111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000000000000000000011111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000000000000000000111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000000000000000001111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000000000000000011111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000000000000000111111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000000000000001111111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000000000000011111111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000000000000111111111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000000000001111111111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000000000011111111111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000000000111111111111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000000001111111111111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000000011111111111111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000000111111111111111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000001111111111111111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000011111111111111111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000000111111111111111111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000001111111111111111111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000011111111111111111111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00000111111111111111111111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00001111111111111111111111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00011111111111111111111111111111) (= (mask!30512 (_2!7931 lt!460660)) #b00111111111111111111111111111111)) (bvsle (mask!30512 (_2!7931 lt!460660)) #b00111111111111111111111111111111)))))

(assert (=> b!1044464 d!126305))

(declare-fun mapNonEmpty!38903 () Bool)

(declare-fun mapRes!38903 () Bool)

(declare-fun tp!74628 () Bool)

(declare-fun e!592135 () Bool)

(assert (=> mapNonEmpty!38903 (= mapRes!38903 (and tp!74628 e!592135))))

(declare-fun mapRest!38903 () (Array (_ BitVec 32) ValueCell!11717))

(declare-fun mapKey!38903 () (_ BitVec 32))

(declare-fun mapValue!38903 () ValueCell!11717)

(assert (=> mapNonEmpty!38903 (= mapRest!38894 (store mapRest!38903 mapKey!38903 mapValue!38903))))

(declare-fun condMapEmpty!38903 () Bool)

(declare-fun mapDefault!38903 () ValueCell!11717)

(assert (=> mapNonEmpty!38894 (= condMapEmpty!38903 (= mapRest!38894 ((as const (Array (_ BitVec 32) ValueCell!11717)) mapDefault!38903)))))

(declare-fun e!592136 () Bool)

(assert (=> mapNonEmpty!38894 (= tp!74613 (and e!592136 mapRes!38903))))

(declare-fun mapIsEmpty!38903 () Bool)

(assert (=> mapIsEmpty!38903 mapRes!38903))

(declare-fun b!1044751 () Bool)

(assert (=> b!1044751 (= e!592136 tp_is_empty!24841)))

(declare-fun b!1044750 () Bool)

(assert (=> b!1044750 (= e!592135 tp_is_empty!24841)))

(assert (= (and mapNonEmpty!38894 condMapEmpty!38903) mapIsEmpty!38903))

(assert (= (and mapNonEmpty!38894 (not condMapEmpty!38903)) mapNonEmpty!38903))

(assert (= (and mapNonEmpty!38903 ((_ is ValueCellFull!11717) mapValue!38903)) b!1044750))

(assert (= (and mapNonEmpty!38894 ((_ is ValueCellFull!11717) mapDefault!38903)) b!1044751))

(declare-fun m!963859 () Bool)

(assert (=> mapNonEmpty!38903 m!963859))

(declare-fun b_lambda!16235 () Bool)

(assert (= b_lambda!16233 (or (and b!1044465 b_free!21121) b_lambda!16235)))

(declare-fun b_lambda!16237 () Bool)

(assert (= b_lambda!16229 (or (and b!1044465 b_free!21121) b_lambda!16237)))

(declare-fun b_lambda!16239 () Bool)

(assert (= b_lambda!16231 (or (and b!1044465 b_free!21121) b_lambda!16239)))

(check-sat (not d!126275) (not b!1044537) (not bm!44377) (not d!126271) (not bm!44392) (not b!1044599) (not b!1044738) (not b!1044628) (not d!126281) (not b!1044705) (not b!1044622) (not d!126273) (not b!1044640) (not d!126303) (not bm!44389) (not b_lambda!16227) (not b!1044673) (not b!1044644) (not bm!44403) (not bm!44404) (not b!1044706) (not bm!44380) (not bm!44385) (not b!1044658) (not d!126277) (not b!1044604) (not b!1044743) (not d!126299) (not b_lambda!16237) (not b!1044609) (not b!1044664) (not b!1044651) (not b!1044613) (not b!1044649) (not b!1044716) (not b!1044662) (not d!126283) (not b!1044654) (not b!1044726) (not b!1044688) (not b!1044617) (not bm!44400) (not b!1044691) (not b!1044641) (not d!126287) (not b!1044725) tp_is_empty!24841 (not bm!44407) (not b!1044671) (not d!126291) (not d!126285) (not b!1044538) (not b!1044676) (not bm!44384) (not b_lambda!16235) (not b!1044661) (not b_lambda!16225) (not b!1044702) (not b!1044712) (not b!1044616) (not b!1044637) (not b!1044606) (not b!1044633) (not b_next!21121) b_and!33697 (not bm!44378) (not b!1044536) (not bm!44391) (not b!1044643) (not mapNonEmpty!38903) (not b!1044619) (not b_lambda!16239) (not b!1044739) (not bm!44382) (not b!1044728) (not b!1044551) (not bm!44396) (not b!1044630) (not d!126279) (not bm!44387) (not b!1044623) (not bm!44394))
(check-sat b_and!33697 (not b_next!21121))
