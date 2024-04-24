; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91894 () Bool)

(assert start!91894)

(declare-fun b!1044798 () Bool)

(declare-fun b_free!21097 () Bool)

(declare-fun b_next!21097 () Bool)

(assert (=> b!1044798 (= b_free!21097 (not b_next!21097))))

(declare-fun tp!74528 () Bool)

(declare-fun b_and!33639 () Bool)

(assert (=> b!1044798 (= tp!74528 b_and!33639)))

(declare-fun mapIsEmpty!38846 () Bool)

(declare-fun mapRes!38846 () Bool)

(assert (=> mapIsEmpty!38846 mapRes!38846))

(declare-fun b!1044793 () Bool)

(declare-fun e!592077 () Bool)

(declare-fun e!592072 () Bool)

(assert (=> b!1044793 (= e!592077 e!592072)))

(declare-fun res!695696 () Bool)

(assert (=> b!1044793 (=> (not res!695696) (not e!592072))))

(declare-datatypes ((SeekEntryResult!9788 0))(
  ( (MissingZero!9788 (index!41523 (_ BitVec 32))) (Found!9788 (index!41524 (_ BitVec 32))) (Intermediate!9788 (undefined!10600 Bool) (index!41525 (_ BitVec 32)) (x!93144 (_ BitVec 32))) (Undefined!9788) (MissingVacant!9788 (index!41526 (_ BitVec 32))) )
))
(declare-fun lt!460491 () SeekEntryResult!9788)

(get-info :version)

(assert (=> b!1044793 (= res!695696 ((_ is Found!9788) lt!460491))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37963 0))(
  ( (V!37964 (val!12459 Int)) )
))
(declare-datatypes ((ValueCell!11705 0))(
  ( (ValueCellFull!11705 (v!15046 V!37963)) (EmptyCell!11705) )
))
(declare-datatypes ((array!65845 0))(
  ( (array!65846 (arr!31669 (Array (_ BitVec 32) (_ BitVec 64))) (size!32205 (_ BitVec 32))) )
))
(declare-datatypes ((array!65847 0))(
  ( (array!65848 (arr!31670 (Array (_ BitVec 32) ValueCell!11705)) (size!32206 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6004 0))(
  ( (LongMapFixedSize!6005 (defaultEntry!6384 Int) (mask!30535 (_ BitVec 32)) (extraKeys!6112 (_ BitVec 32)) (zeroValue!6218 V!37963) (minValue!6218 V!37963) (_size!3057 (_ BitVec 32)) (_keys!11680 array!65845) (_values!6407 array!65847) (_vacant!3057 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6004)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65845 (_ BitVec 32)) SeekEntryResult!9788)

(assert (=> b!1044793 (= lt!460491 (seekEntry!0 key!909 (_keys!11680 thiss!1427) (mask!30535 thiss!1427)))))

(declare-fun b!1044794 () Bool)

(declare-fun e!592074 () Bool)

(declare-fun e!592071 () Bool)

(assert (=> b!1044794 (= e!592074 (and e!592071 mapRes!38846))))

(declare-fun condMapEmpty!38846 () Bool)

(declare-fun mapDefault!38846 () ValueCell!11705)

(assert (=> b!1044794 (= condMapEmpty!38846 (= (arr!31670 (_values!6407 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11705)) mapDefault!38846)))))

(declare-fun mapNonEmpty!38846 () Bool)

(declare-fun tp!74529 () Bool)

(declare-fun e!592075 () Bool)

(assert (=> mapNonEmpty!38846 (= mapRes!38846 (and tp!74529 e!592075))))

(declare-fun mapRest!38846 () (Array (_ BitVec 32) ValueCell!11705))

(declare-fun mapKey!38846 () (_ BitVec 32))

(declare-fun mapValue!38846 () ValueCell!11705)

(assert (=> mapNonEmpty!38846 (= (arr!31670 (_values!6407 thiss!1427)) (store mapRest!38846 mapKey!38846 mapValue!38846))))

(declare-fun b!1044795 () Bool)

(assert (=> b!1044795 (= e!592072 (not (and (bvsge (index!41524 lt!460491) #b00000000000000000000000000000000) (bvslt (index!41524 lt!460491) (size!32205 (_keys!11680 thiss!1427))))))))

(declare-fun lt!460488 () array!65845)

(declare-datatypes ((tuple2!15734 0))(
  ( (tuple2!15735 (_1!7878 (_ BitVec 64)) (_2!7878 V!37963)) )
))
(declare-datatypes ((List!21981 0))(
  ( (Nil!21978) (Cons!21977 (h!23194 tuple2!15734) (t!31189 List!21981)) )
))
(declare-datatypes ((ListLongMap!13769 0))(
  ( (ListLongMap!13770 (toList!6900 List!21981)) )
))
(declare-fun -!523 (ListLongMap!13769 (_ BitVec 64)) ListLongMap!13769)

(declare-fun getCurrentListMap!3944 (array!65845 array!65847 (_ BitVec 32) (_ BitVec 32) V!37963 V!37963 (_ BitVec 32) Int) ListLongMap!13769)

(declare-fun dynLambda!2015 (Int (_ BitVec 64)) V!37963)

(assert (=> b!1044795 (= (-!523 (getCurrentListMap!3944 (_keys!11680 thiss!1427) (_values!6407 thiss!1427) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)) key!909) (getCurrentListMap!3944 lt!460488 (array!65848 (store (arr!31670 (_values!6407 thiss!1427)) (index!41524 lt!460491) (ValueCellFull!11705 (dynLambda!2015 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32206 (_values!6407 thiss!1427))) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-datatypes ((Unit!34085 0))(
  ( (Unit!34086) )
))
(declare-fun lt!460490 () Unit!34085)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!45 (array!65845 array!65847 (_ BitVec 32) (_ BitVec 32) V!37963 V!37963 (_ BitVec 32) (_ BitVec 64) Int) Unit!34085)

(assert (=> b!1044795 (= lt!460490 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!45 (_keys!11680 thiss!1427) (_values!6407 thiss!1427) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) (index!41524 lt!460491) key!909 (defaultEntry!6384 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1044795 (not (arrayContainsKey!0 lt!460488 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!460485 () Unit!34085)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65845 (_ BitVec 32) (_ BitVec 64)) Unit!34085)

(assert (=> b!1044795 (= lt!460485 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11680 thiss!1427) (index!41524 lt!460491) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65845 (_ BitVec 32)) Bool)

(assert (=> b!1044795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460488 (mask!30535 thiss!1427))))

(declare-fun lt!460489 () Unit!34085)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65845 (_ BitVec 32) (_ BitVec 32)) Unit!34085)

(assert (=> b!1044795 (= lt!460489 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11680 thiss!1427) (index!41524 lt!460491) (mask!30535 thiss!1427)))))

(declare-datatypes ((List!21982 0))(
  ( (Nil!21979) (Cons!21978 (h!23195 (_ BitVec 64)) (t!31190 List!21982)) )
))
(declare-fun arrayNoDuplicates!0 (array!65845 (_ BitVec 32) List!21982) Bool)

(assert (=> b!1044795 (arrayNoDuplicates!0 lt!460488 #b00000000000000000000000000000000 Nil!21979)))

(declare-fun lt!460486 () Unit!34085)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65845 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21982) Unit!34085)

(assert (=> b!1044795 (= lt!460486 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11680 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41524 lt!460491) #b00000000000000000000000000000000 Nil!21979))))

(declare-fun arrayCountValidKeys!0 (array!65845 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1044795 (= (arrayCountValidKeys!0 lt!460488 #b00000000000000000000000000000000 (size!32205 (_keys!11680 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11680 thiss!1427) #b00000000000000000000000000000000 (size!32205 (_keys!11680 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1044795 (= lt!460488 (array!65846 (store (arr!31669 (_keys!11680 thiss!1427)) (index!41524 lt!460491) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32205 (_keys!11680 thiss!1427))))))

(declare-fun lt!460487 () Unit!34085)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65845 (_ BitVec 32) (_ BitVec 64)) Unit!34085)

(assert (=> b!1044795 (= lt!460487 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11680 thiss!1427) (index!41524 lt!460491) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044796 () Bool)

(declare-fun tp_is_empty!24817 () Bool)

(assert (=> b!1044796 (= e!592071 tp_is_empty!24817)))

(declare-fun b!1044797 () Bool)

(assert (=> b!1044797 (= e!592075 tp_is_empty!24817)))

(declare-fun e!592073 () Bool)

(declare-fun array_inv!24475 (array!65845) Bool)

(declare-fun array_inv!24476 (array!65847) Bool)

(assert (=> b!1044798 (= e!592073 (and tp!74528 tp_is_empty!24817 (array_inv!24475 (_keys!11680 thiss!1427)) (array_inv!24476 (_values!6407 thiss!1427)) e!592074))))

(declare-fun b!1044792 () Bool)

(declare-fun res!695695 () Bool)

(assert (=> b!1044792 (=> (not res!695695) (not e!592077))))

(assert (=> b!1044792 (= res!695695 (not (= key!909 (bvneg key!909))))))

(declare-fun res!695697 () Bool)

(assert (=> start!91894 (=> (not res!695697) (not e!592077))))

(declare-fun valid!2258 (LongMapFixedSize!6004) Bool)

(assert (=> start!91894 (= res!695697 (valid!2258 thiss!1427))))

(assert (=> start!91894 e!592077))

(assert (=> start!91894 e!592073))

(assert (=> start!91894 true))

(assert (= (and start!91894 res!695697) b!1044792))

(assert (= (and b!1044792 res!695695) b!1044793))

(assert (= (and b!1044793 res!695696) b!1044795))

(assert (= (and b!1044794 condMapEmpty!38846) mapIsEmpty!38846))

(assert (= (and b!1044794 (not condMapEmpty!38846)) mapNonEmpty!38846))

(assert (= (and mapNonEmpty!38846 ((_ is ValueCellFull!11705) mapValue!38846)) b!1044797))

(assert (= (and b!1044794 ((_ is ValueCellFull!11705) mapDefault!38846)) b!1044796))

(assert (= b!1044798 b!1044794))

(assert (= start!91894 b!1044798))

(declare-fun b_lambda!16167 () Bool)

(assert (=> (not b_lambda!16167) (not b!1044795)))

(declare-fun t!31188 () Bool)

(declare-fun tb!7029 () Bool)

(assert (=> (and b!1044798 (= (defaultEntry!6384 thiss!1427) (defaultEntry!6384 thiss!1427)) t!31188) tb!7029))

(declare-fun result!14487 () Bool)

(assert (=> tb!7029 (= result!14487 tp_is_empty!24817)))

(assert (=> b!1044795 t!31188))

(declare-fun b_and!33641 () Bool)

(assert (= b_and!33639 (and (=> t!31188 result!14487) b_and!33641)))

(declare-fun m!964363 () Bool)

(assert (=> start!91894 m!964363))

(declare-fun m!964365 () Bool)

(assert (=> mapNonEmpty!38846 m!964365))

(declare-fun m!964367 () Bool)

(assert (=> b!1044798 m!964367))

(declare-fun m!964369 () Bool)

(assert (=> b!1044798 m!964369))

(declare-fun m!964371 () Bool)

(assert (=> b!1044793 m!964371))

(declare-fun m!964373 () Bool)

(assert (=> b!1044795 m!964373))

(declare-fun m!964375 () Bool)

(assert (=> b!1044795 m!964375))

(declare-fun m!964377 () Bool)

(assert (=> b!1044795 m!964377))

(declare-fun m!964379 () Bool)

(assert (=> b!1044795 m!964379))

(declare-fun m!964381 () Bool)

(assert (=> b!1044795 m!964381))

(declare-fun m!964383 () Bool)

(assert (=> b!1044795 m!964383))

(declare-fun m!964385 () Bool)

(assert (=> b!1044795 m!964385))

(declare-fun m!964387 () Bool)

(assert (=> b!1044795 m!964387))

(declare-fun m!964389 () Bool)

(assert (=> b!1044795 m!964389))

(declare-fun m!964391 () Bool)

(assert (=> b!1044795 m!964391))

(declare-fun m!964393 () Bool)

(assert (=> b!1044795 m!964393))

(declare-fun m!964395 () Bool)

(assert (=> b!1044795 m!964395))

(declare-fun m!964397 () Bool)

(assert (=> b!1044795 m!964397))

(declare-fun m!964399 () Bool)

(assert (=> b!1044795 m!964399))

(declare-fun m!964401 () Bool)

(assert (=> b!1044795 m!964401))

(declare-fun m!964403 () Bool)

(assert (=> b!1044795 m!964403))

(assert (=> b!1044795 m!964385))

(check-sat (not b!1044798) tp_is_empty!24817 (not start!91894) b_and!33641 (not b!1044793) (not b_next!21097) (not mapNonEmpty!38846) (not b_lambda!16167) (not b!1044795))
(check-sat b_and!33641 (not b_next!21097))
(get-model)

(declare-fun b_lambda!16173 () Bool)

(assert (= b_lambda!16167 (or (and b!1044798 b_free!21097) b_lambda!16173)))

(check-sat (not b!1044798) tp_is_empty!24817 (not start!91894) b_and!33641 (not b!1044795) (not b_lambda!16173) (not b!1044793) (not b_next!21097) (not mapNonEmpty!38846))
(check-sat b_and!33641 (not b_next!21097))
(get-model)

(declare-fun d!126723 () Bool)

(assert (=> d!126723 (= (array_inv!24475 (_keys!11680 thiss!1427)) (bvsge (size!32205 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044798 d!126723))

(declare-fun d!126725 () Bool)

(assert (=> d!126725 (= (array_inv!24476 (_values!6407 thiss!1427)) (bvsge (size!32206 (_values!6407 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044798 d!126725))

(declare-fun b!1044859 () Bool)

(declare-fun e!592128 () SeekEntryResult!9788)

(declare-fun lt!460543 () SeekEntryResult!9788)

(assert (=> b!1044859 (= e!592128 (ite ((_ is MissingVacant!9788) lt!460543) (MissingZero!9788 (index!41526 lt!460543)) lt!460543))))

(declare-fun lt!460542 () SeekEntryResult!9788)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65845 (_ BitVec 32)) SeekEntryResult!9788)

(assert (=> b!1044859 (= lt!460543 (seekKeyOrZeroReturnVacant!0 (x!93144 lt!460542) (index!41525 lt!460542) (index!41525 lt!460542) key!909 (_keys!11680 thiss!1427) (mask!30535 thiss!1427)))))

(declare-fun b!1044860 () Bool)

(declare-fun c!106351 () Bool)

(declare-fun lt!460545 () (_ BitVec 64))

(assert (=> b!1044860 (= c!106351 (= lt!460545 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!592127 () SeekEntryResult!9788)

(assert (=> b!1044860 (= e!592127 e!592128)))

(declare-fun d!126727 () Bool)

(declare-fun lt!460544 () SeekEntryResult!9788)

(assert (=> d!126727 (and (or ((_ is MissingVacant!9788) lt!460544) (not ((_ is Found!9788) lt!460544)) (and (bvsge (index!41524 lt!460544) #b00000000000000000000000000000000) (bvslt (index!41524 lt!460544) (size!32205 (_keys!11680 thiss!1427))))) (not ((_ is MissingVacant!9788) lt!460544)) (or (not ((_ is Found!9788) lt!460544)) (= (select (arr!31669 (_keys!11680 thiss!1427)) (index!41524 lt!460544)) key!909)))))

(declare-fun e!592126 () SeekEntryResult!9788)

(assert (=> d!126727 (= lt!460544 e!592126)))

(declare-fun c!106350 () Bool)

(assert (=> d!126727 (= c!106350 (and ((_ is Intermediate!9788) lt!460542) (undefined!10600 lt!460542)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65845 (_ BitVec 32)) SeekEntryResult!9788)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126727 (= lt!460542 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30535 thiss!1427)) key!909 (_keys!11680 thiss!1427) (mask!30535 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!126727 (validMask!0 (mask!30535 thiss!1427))))

(assert (=> d!126727 (= (seekEntry!0 key!909 (_keys!11680 thiss!1427) (mask!30535 thiss!1427)) lt!460544)))

(declare-fun b!1044861 () Bool)

(assert (=> b!1044861 (= e!592126 Undefined!9788)))

(declare-fun b!1044862 () Bool)

(assert (=> b!1044862 (= e!592127 (Found!9788 (index!41525 lt!460542)))))

(declare-fun b!1044863 () Bool)

(assert (=> b!1044863 (= e!592126 e!592127)))

(assert (=> b!1044863 (= lt!460545 (select (arr!31669 (_keys!11680 thiss!1427)) (index!41525 lt!460542)))))

(declare-fun c!106349 () Bool)

(assert (=> b!1044863 (= c!106349 (= lt!460545 key!909))))

(declare-fun b!1044864 () Bool)

(assert (=> b!1044864 (= e!592128 (MissingZero!9788 (index!41525 lt!460542)))))

(assert (= (and d!126727 c!106350) b!1044861))

(assert (= (and d!126727 (not c!106350)) b!1044863))

(assert (= (and b!1044863 c!106349) b!1044862))

(assert (= (and b!1044863 (not c!106349)) b!1044860))

(assert (= (and b!1044860 c!106351) b!1044864))

(assert (= (and b!1044860 (not c!106351)) b!1044859))

(declare-fun m!964489 () Bool)

(assert (=> b!1044859 m!964489))

(declare-fun m!964491 () Bool)

(assert (=> d!126727 m!964491))

(declare-fun m!964493 () Bool)

(assert (=> d!126727 m!964493))

(assert (=> d!126727 m!964493))

(declare-fun m!964495 () Bool)

(assert (=> d!126727 m!964495))

(declare-fun m!964497 () Bool)

(assert (=> d!126727 m!964497))

(declare-fun m!964499 () Bool)

(assert (=> b!1044863 m!964499))

(assert (=> b!1044793 d!126727))

(declare-fun b!1044873 () Bool)

(declare-fun e!592135 () Bool)

(declare-fun call!44292 () Bool)

(assert (=> b!1044873 (= e!592135 call!44292)))

(declare-fun b!1044874 () Bool)

(declare-fun e!592136 () Bool)

(assert (=> b!1044874 (= e!592136 call!44292)))

(declare-fun b!1044875 () Bool)

(declare-fun e!592137 () Bool)

(assert (=> b!1044875 (= e!592137 e!592135)))

(declare-fun c!106354 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1044875 (= c!106354 (validKeyInArray!0 (select (arr!31669 lt!460488) #b00000000000000000000000000000000)))))

(declare-fun d!126729 () Bool)

(declare-fun res!695720 () Bool)

(assert (=> d!126729 (=> res!695720 e!592137)))

(assert (=> d!126729 (= res!695720 (bvsge #b00000000000000000000000000000000 (size!32205 lt!460488)))))

(assert (=> d!126729 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460488 (mask!30535 thiss!1427)) e!592137)))

(declare-fun b!1044876 () Bool)

(assert (=> b!1044876 (= e!592135 e!592136)))

(declare-fun lt!460552 () (_ BitVec 64))

(assert (=> b!1044876 (= lt!460552 (select (arr!31669 lt!460488) #b00000000000000000000000000000000))))

(declare-fun lt!460554 () Unit!34085)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65845 (_ BitVec 64) (_ BitVec 32)) Unit!34085)

(assert (=> b!1044876 (= lt!460554 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!460488 lt!460552 #b00000000000000000000000000000000))))

(assert (=> b!1044876 (arrayContainsKey!0 lt!460488 lt!460552 #b00000000000000000000000000000000)))

(declare-fun lt!460553 () Unit!34085)

(assert (=> b!1044876 (= lt!460553 lt!460554)))

(declare-fun res!695721 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65845 (_ BitVec 32)) SeekEntryResult!9788)

(assert (=> b!1044876 (= res!695721 (= (seekEntryOrOpen!0 (select (arr!31669 lt!460488) #b00000000000000000000000000000000) lt!460488 (mask!30535 thiss!1427)) (Found!9788 #b00000000000000000000000000000000)))))

(assert (=> b!1044876 (=> (not res!695721) (not e!592136))))

(declare-fun bm!44289 () Bool)

(assert (=> bm!44289 (= call!44292 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!460488 (mask!30535 thiss!1427)))))

(assert (= (and d!126729 (not res!695720)) b!1044875))

(assert (= (and b!1044875 c!106354) b!1044876))

(assert (= (and b!1044875 (not c!106354)) b!1044873))

(assert (= (and b!1044876 res!695721) b!1044874))

(assert (= (or b!1044874 b!1044873) bm!44289))

(declare-fun m!964501 () Bool)

(assert (=> b!1044875 m!964501))

(assert (=> b!1044875 m!964501))

(declare-fun m!964503 () Bool)

(assert (=> b!1044875 m!964503))

(assert (=> b!1044876 m!964501))

(declare-fun m!964505 () Bool)

(assert (=> b!1044876 m!964505))

(declare-fun m!964507 () Bool)

(assert (=> b!1044876 m!964507))

(assert (=> b!1044876 m!964501))

(declare-fun m!964509 () Bool)

(assert (=> b!1044876 m!964509))

(declare-fun m!964511 () Bool)

(assert (=> bm!44289 m!964511))

(assert (=> b!1044795 d!126729))

(declare-fun b!1044919 () Bool)

(declare-fun e!592173 () Bool)

(declare-fun lt!460600 () ListLongMap!13769)

(declare-fun apply!917 (ListLongMap!13769 (_ BitVec 64)) V!37963)

(assert (=> b!1044919 (= e!592173 (= (apply!917 lt!460600 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6218 thiss!1427)))))

(declare-fun d!126731 () Bool)

(declare-fun e!592170 () Bool)

(assert (=> d!126731 e!592170))

(declare-fun res!695740 () Bool)

(assert (=> d!126731 (=> (not res!695740) (not e!592170))))

(assert (=> d!126731 (= res!695740 (or (bvsge #b00000000000000000000000000000000 (size!32205 lt!460488)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32205 lt!460488)))))))

(declare-fun lt!460609 () ListLongMap!13769)

(assert (=> d!126731 (= lt!460600 lt!460609)))

(declare-fun lt!460617 () Unit!34085)

(declare-fun e!592167 () Unit!34085)

(assert (=> d!126731 (= lt!460617 e!592167)))

(declare-fun c!106370 () Bool)

(declare-fun e!592168 () Bool)

(assert (=> d!126731 (= c!106370 e!592168)))

(declare-fun res!695745 () Bool)

(assert (=> d!126731 (=> (not res!695745) (not e!592168))))

(assert (=> d!126731 (= res!695745 (bvslt #b00000000000000000000000000000000 (size!32205 lt!460488)))))

(declare-fun e!592174 () ListLongMap!13769)

(assert (=> d!126731 (= lt!460609 e!592174)))

(declare-fun c!106368 () Bool)

(assert (=> d!126731 (= c!106368 (and (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126731 (validMask!0 (mask!30535 thiss!1427))))

(assert (=> d!126731 (= (getCurrentListMap!3944 lt!460488 (array!65848 (store (arr!31670 (_values!6407 thiss!1427)) (index!41524 lt!460491) (ValueCellFull!11705 (dynLambda!2015 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32206 (_values!6407 thiss!1427))) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)) lt!460600)))

(declare-fun b!1044920 () Bool)

(declare-fun e!592175 () Bool)

(assert (=> b!1044920 (= e!592175 (validKeyInArray!0 (select (arr!31669 lt!460488) #b00000000000000000000000000000000)))))

(declare-fun bm!44304 () Bool)

(declare-fun c!106372 () Bool)

(declare-fun call!44310 () ListLongMap!13769)

(declare-fun call!44313 () ListLongMap!13769)

(declare-fun call!44308 () ListLongMap!13769)

(declare-fun call!44312 () ListLongMap!13769)

(declare-fun +!3128 (ListLongMap!13769 tuple2!15734) ListLongMap!13769)

(assert (=> bm!44304 (= call!44308 (+!3128 (ite c!106368 call!44313 (ite c!106372 call!44310 call!44312)) (ite (or c!106368 c!106372) (tuple2!15735 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6218 thiss!1427)) (tuple2!15735 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6218 thiss!1427)))))))

(declare-fun bm!44305 () Bool)

(assert (=> bm!44305 (= call!44312 call!44310)))

(declare-fun bm!44306 () Bool)

(assert (=> bm!44306 (= call!44310 call!44313)))

(declare-fun bm!44307 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3568 (array!65845 array!65847 (_ BitVec 32) (_ BitVec 32) V!37963 V!37963 (_ BitVec 32) Int) ListLongMap!13769)

(assert (=> bm!44307 (= call!44313 (getCurrentListMapNoExtraKeys!3568 lt!460488 (array!65848 (store (arr!31670 (_values!6407 thiss!1427)) (index!41524 lt!460491) (ValueCellFull!11705 (dynLambda!2015 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32206 (_values!6407 thiss!1427))) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun b!1044921 () Bool)

(declare-fun Unit!34089 () Unit!34085)

(assert (=> b!1044921 (= e!592167 Unit!34089)))

(declare-fun b!1044922 () Bool)

(declare-fun e!592165 () Bool)

(declare-fun e!592166 () Bool)

(assert (=> b!1044922 (= e!592165 e!592166)))

(declare-fun res!695743 () Bool)

(declare-fun call!44307 () Bool)

(assert (=> b!1044922 (= res!695743 call!44307)))

(assert (=> b!1044922 (=> (not res!695743) (not e!592166))))

(declare-fun b!1044923 () Bool)

(declare-fun e!592171 () ListLongMap!13769)

(assert (=> b!1044923 (= e!592171 call!44312)))

(declare-fun b!1044924 () Bool)

(declare-fun e!592164 () Bool)

(declare-fun call!44309 () Bool)

(assert (=> b!1044924 (= e!592164 (not call!44309))))

(declare-fun b!1044925 () Bool)

(assert (=> b!1044925 (= e!592174 (+!3128 call!44308 (tuple2!15735 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6218 thiss!1427))))))

(declare-fun bm!44308 () Bool)

(declare-fun call!44311 () ListLongMap!13769)

(assert (=> bm!44308 (= call!44311 call!44308)))

(declare-fun bm!44309 () Bool)

(declare-fun contains!6088 (ListLongMap!13769 (_ BitVec 64)) Bool)

(assert (=> bm!44309 (= call!44307 (contains!6088 lt!460600 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044926 () Bool)

(assert (=> b!1044926 (= e!592165 (not call!44307))))

(declare-fun b!1044927 () Bool)

(declare-fun e!592169 () Bool)

(declare-fun e!592172 () Bool)

(assert (=> b!1044927 (= e!592169 e!592172)))

(declare-fun res!695746 () Bool)

(assert (=> b!1044927 (=> (not res!695746) (not e!592172))))

(assert (=> b!1044927 (= res!695746 (contains!6088 lt!460600 (select (arr!31669 lt!460488) #b00000000000000000000000000000000)))))

(assert (=> b!1044927 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32205 lt!460488)))))

(declare-fun b!1044928 () Bool)

(declare-fun get!16570 (ValueCell!11705 V!37963) V!37963)

(assert (=> b!1044928 (= e!592172 (= (apply!917 lt!460600 (select (arr!31669 lt!460488) #b00000000000000000000000000000000)) (get!16570 (select (arr!31670 (array!65848 (store (arr!31670 (_values!6407 thiss!1427)) (index!41524 lt!460491) (ValueCellFull!11705 (dynLambda!2015 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32206 (_values!6407 thiss!1427)))) #b00000000000000000000000000000000) (dynLambda!2015 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044928 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32206 (array!65848 (store (arr!31670 (_values!6407 thiss!1427)) (index!41524 lt!460491) (ValueCellFull!11705 (dynLambda!2015 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32206 (_values!6407 thiss!1427))))))))

(assert (=> b!1044928 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32205 lt!460488)))))

(declare-fun b!1044929 () Bool)

(assert (=> b!1044929 (= e!592170 e!592165)))

(declare-fun c!106371 () Bool)

(assert (=> b!1044929 (= c!106371 (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044930 () Bool)

(assert (=> b!1044930 (= e!592171 call!44311)))

(declare-fun b!1044931 () Bool)

(assert (=> b!1044931 (= e!592164 e!592173)))

(declare-fun res!695741 () Bool)

(assert (=> b!1044931 (= res!695741 call!44309)))

(assert (=> b!1044931 (=> (not res!695741) (not e!592173))))

(declare-fun b!1044932 () Bool)

(assert (=> b!1044932 (= e!592168 (validKeyInArray!0 (select (arr!31669 lt!460488) #b00000000000000000000000000000000)))))

(declare-fun b!1044933 () Bool)

(declare-fun lt!460608 () Unit!34085)

(assert (=> b!1044933 (= e!592167 lt!460608)))

(declare-fun lt!460613 () ListLongMap!13769)

(assert (=> b!1044933 (= lt!460613 (getCurrentListMapNoExtraKeys!3568 lt!460488 (array!65848 (store (arr!31670 (_values!6407 thiss!1427)) (index!41524 lt!460491) (ValueCellFull!11705 (dynLambda!2015 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32206 (_values!6407 thiss!1427))) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun lt!460603 () (_ BitVec 64))

(assert (=> b!1044933 (= lt!460603 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460602 () (_ BitVec 64))

(assert (=> b!1044933 (= lt!460602 (select (arr!31669 lt!460488) #b00000000000000000000000000000000))))

(declare-fun lt!460601 () Unit!34085)

(declare-fun addStillContains!627 (ListLongMap!13769 (_ BitVec 64) V!37963 (_ BitVec 64)) Unit!34085)

(assert (=> b!1044933 (= lt!460601 (addStillContains!627 lt!460613 lt!460603 (zeroValue!6218 thiss!1427) lt!460602))))

(assert (=> b!1044933 (contains!6088 (+!3128 lt!460613 (tuple2!15735 lt!460603 (zeroValue!6218 thiss!1427))) lt!460602)))

(declare-fun lt!460599 () Unit!34085)

(assert (=> b!1044933 (= lt!460599 lt!460601)))

(declare-fun lt!460605 () ListLongMap!13769)

(assert (=> b!1044933 (= lt!460605 (getCurrentListMapNoExtraKeys!3568 lt!460488 (array!65848 (store (arr!31670 (_values!6407 thiss!1427)) (index!41524 lt!460491) (ValueCellFull!11705 (dynLambda!2015 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32206 (_values!6407 thiss!1427))) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun lt!460618 () (_ BitVec 64))

(assert (=> b!1044933 (= lt!460618 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460616 () (_ BitVec 64))

(assert (=> b!1044933 (= lt!460616 (select (arr!31669 lt!460488) #b00000000000000000000000000000000))))

(declare-fun lt!460620 () Unit!34085)

(declare-fun addApplyDifferent!483 (ListLongMap!13769 (_ BitVec 64) V!37963 (_ BitVec 64)) Unit!34085)

(assert (=> b!1044933 (= lt!460620 (addApplyDifferent!483 lt!460605 lt!460618 (minValue!6218 thiss!1427) lt!460616))))

(assert (=> b!1044933 (= (apply!917 (+!3128 lt!460605 (tuple2!15735 lt!460618 (minValue!6218 thiss!1427))) lt!460616) (apply!917 lt!460605 lt!460616))))

(declare-fun lt!460615 () Unit!34085)

(assert (=> b!1044933 (= lt!460615 lt!460620)))

(declare-fun lt!460611 () ListLongMap!13769)

(assert (=> b!1044933 (= lt!460611 (getCurrentListMapNoExtraKeys!3568 lt!460488 (array!65848 (store (arr!31670 (_values!6407 thiss!1427)) (index!41524 lt!460491) (ValueCellFull!11705 (dynLambda!2015 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32206 (_values!6407 thiss!1427))) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun lt!460614 () (_ BitVec 64))

(assert (=> b!1044933 (= lt!460614 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460610 () (_ BitVec 64))

(assert (=> b!1044933 (= lt!460610 (select (arr!31669 lt!460488) #b00000000000000000000000000000000))))

(declare-fun lt!460604 () Unit!34085)

(assert (=> b!1044933 (= lt!460604 (addApplyDifferent!483 lt!460611 lt!460614 (zeroValue!6218 thiss!1427) lt!460610))))

(assert (=> b!1044933 (= (apply!917 (+!3128 lt!460611 (tuple2!15735 lt!460614 (zeroValue!6218 thiss!1427))) lt!460610) (apply!917 lt!460611 lt!460610))))

(declare-fun lt!460606 () Unit!34085)

(assert (=> b!1044933 (= lt!460606 lt!460604)))

(declare-fun lt!460607 () ListLongMap!13769)

(assert (=> b!1044933 (= lt!460607 (getCurrentListMapNoExtraKeys!3568 lt!460488 (array!65848 (store (arr!31670 (_values!6407 thiss!1427)) (index!41524 lt!460491) (ValueCellFull!11705 (dynLambda!2015 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32206 (_values!6407 thiss!1427))) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun lt!460619 () (_ BitVec 64))

(assert (=> b!1044933 (= lt!460619 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460612 () (_ BitVec 64))

(assert (=> b!1044933 (= lt!460612 (select (arr!31669 lt!460488) #b00000000000000000000000000000000))))

(assert (=> b!1044933 (= lt!460608 (addApplyDifferent!483 lt!460607 lt!460619 (minValue!6218 thiss!1427) lt!460612))))

(assert (=> b!1044933 (= (apply!917 (+!3128 lt!460607 (tuple2!15735 lt!460619 (minValue!6218 thiss!1427))) lt!460612) (apply!917 lt!460607 lt!460612))))

(declare-fun b!1044934 () Bool)

(assert (=> b!1044934 (= e!592166 (= (apply!917 lt!460600 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6218 thiss!1427)))))

(declare-fun bm!44310 () Bool)

(assert (=> bm!44310 (= call!44309 (contains!6088 lt!460600 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044935 () Bool)

(declare-fun res!695742 () Bool)

(assert (=> b!1044935 (=> (not res!695742) (not e!592170))))

(assert (=> b!1044935 (= res!695742 e!592164)))

(declare-fun c!106369 () Bool)

(assert (=> b!1044935 (= c!106369 (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1044936 () Bool)

(declare-fun res!695748 () Bool)

(assert (=> b!1044936 (=> (not res!695748) (not e!592170))))

(assert (=> b!1044936 (= res!695748 e!592169)))

(declare-fun res!695747 () Bool)

(assert (=> b!1044936 (=> res!695747 e!592169)))

(assert (=> b!1044936 (= res!695747 (not e!592175))))

(declare-fun res!695744 () Bool)

(assert (=> b!1044936 (=> (not res!695744) (not e!592175))))

(assert (=> b!1044936 (= res!695744 (bvslt #b00000000000000000000000000000000 (size!32205 lt!460488)))))

(declare-fun b!1044937 () Bool)

(declare-fun e!592176 () ListLongMap!13769)

(assert (=> b!1044937 (= e!592174 e!592176)))

(assert (=> b!1044937 (= c!106372 (and (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044938 () Bool)

(declare-fun c!106367 () Bool)

(assert (=> b!1044938 (= c!106367 (and (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1044938 (= e!592176 e!592171)))

(declare-fun b!1044939 () Bool)

(assert (=> b!1044939 (= e!592176 call!44311)))

(assert (= (and d!126731 c!106368) b!1044925))

(assert (= (and d!126731 (not c!106368)) b!1044937))

(assert (= (and b!1044937 c!106372) b!1044939))

(assert (= (and b!1044937 (not c!106372)) b!1044938))

(assert (= (and b!1044938 c!106367) b!1044930))

(assert (= (and b!1044938 (not c!106367)) b!1044923))

(assert (= (or b!1044930 b!1044923) bm!44305))

(assert (= (or b!1044939 bm!44305) bm!44306))

(assert (= (or b!1044939 b!1044930) bm!44308))

(assert (= (or b!1044925 bm!44306) bm!44307))

(assert (= (or b!1044925 bm!44308) bm!44304))

(assert (= (and d!126731 res!695745) b!1044932))

(assert (= (and d!126731 c!106370) b!1044933))

(assert (= (and d!126731 (not c!106370)) b!1044921))

(assert (= (and d!126731 res!695740) b!1044936))

(assert (= (and b!1044936 res!695744) b!1044920))

(assert (= (and b!1044936 (not res!695747)) b!1044927))

(assert (= (and b!1044927 res!695746) b!1044928))

(assert (= (and b!1044936 res!695748) b!1044935))

(assert (= (and b!1044935 c!106369) b!1044931))

(assert (= (and b!1044935 (not c!106369)) b!1044924))

(assert (= (and b!1044931 res!695741) b!1044919))

(assert (= (or b!1044931 b!1044924) bm!44310))

(assert (= (and b!1044935 res!695742) b!1044929))

(assert (= (and b!1044929 c!106371) b!1044922))

(assert (= (and b!1044929 (not c!106371)) b!1044926))

(assert (= (and b!1044922 res!695743) b!1044934))

(assert (= (or b!1044922 b!1044926) bm!44309))

(declare-fun b_lambda!16175 () Bool)

(assert (=> (not b_lambda!16175) (not b!1044928)))

(assert (=> b!1044928 t!31188))

(declare-fun b_and!33651 () Bool)

(assert (= b_and!33641 (and (=> t!31188 result!14487) b_and!33651)))

(assert (=> b!1044920 m!964501))

(assert (=> b!1044920 m!964501))

(assert (=> b!1044920 m!964503))

(declare-fun m!964513 () Bool)

(assert (=> bm!44309 m!964513))

(declare-fun m!964515 () Bool)

(assert (=> bm!44310 m!964515))

(assert (=> b!1044928 m!964393))

(assert (=> b!1044928 m!964501))

(declare-fun m!964517 () Bool)

(assert (=> b!1044928 m!964517))

(assert (=> b!1044928 m!964393))

(declare-fun m!964519 () Bool)

(assert (=> b!1044928 m!964519))

(assert (=> b!1044928 m!964517))

(assert (=> b!1044928 m!964501))

(declare-fun m!964521 () Bool)

(assert (=> b!1044928 m!964521))

(declare-fun m!964523 () Bool)

(assert (=> b!1044919 m!964523))

(declare-fun m!964525 () Bool)

(assert (=> bm!44307 m!964525))

(declare-fun m!964527 () Bool)

(assert (=> bm!44304 m!964527))

(declare-fun m!964529 () Bool)

(assert (=> b!1044933 m!964529))

(declare-fun m!964531 () Bool)

(assert (=> b!1044933 m!964531))

(declare-fun m!964533 () Bool)

(assert (=> b!1044933 m!964533))

(declare-fun m!964535 () Bool)

(assert (=> b!1044933 m!964535))

(assert (=> b!1044933 m!964501))

(assert (=> b!1044933 m!964533))

(declare-fun m!964537 () Bool)

(assert (=> b!1044933 m!964537))

(declare-fun m!964539 () Bool)

(assert (=> b!1044933 m!964539))

(declare-fun m!964541 () Bool)

(assert (=> b!1044933 m!964541))

(declare-fun m!964543 () Bool)

(assert (=> b!1044933 m!964543))

(assert (=> b!1044933 m!964543))

(declare-fun m!964545 () Bool)

(assert (=> b!1044933 m!964545))

(declare-fun m!964547 () Bool)

(assert (=> b!1044933 m!964547))

(declare-fun m!964549 () Bool)

(assert (=> b!1044933 m!964549))

(declare-fun m!964551 () Bool)

(assert (=> b!1044933 m!964551))

(assert (=> b!1044933 m!964547))

(declare-fun m!964553 () Bool)

(assert (=> b!1044933 m!964553))

(declare-fun m!964555 () Bool)

(assert (=> b!1044933 m!964555))

(assert (=> b!1044933 m!964531))

(declare-fun m!964557 () Bool)

(assert (=> b!1044933 m!964557))

(assert (=> b!1044933 m!964525))

(assert (=> d!126731 m!964497))

(assert (=> b!1044927 m!964501))

(assert (=> b!1044927 m!964501))

(declare-fun m!964559 () Bool)

(assert (=> b!1044927 m!964559))

(declare-fun m!964561 () Bool)

(assert (=> b!1044934 m!964561))

(declare-fun m!964563 () Bool)

(assert (=> b!1044925 m!964563))

(assert (=> b!1044932 m!964501))

(assert (=> b!1044932 m!964501))

(assert (=> b!1044932 m!964503))

(assert (=> b!1044795 d!126731))

(declare-fun bm!44313 () Bool)

(declare-fun call!44316 () (_ BitVec 32))

(assert (=> bm!44313 (= call!44316 (arrayCountValidKeys!0 lt!460488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32205 (_keys!11680 thiss!1427))))))

(declare-fun b!1044948 () Bool)

(declare-fun e!592181 () (_ BitVec 32))

(declare-fun e!592182 () (_ BitVec 32))

(assert (=> b!1044948 (= e!592181 e!592182)))

(declare-fun c!106377 () Bool)

(assert (=> b!1044948 (= c!106377 (validKeyInArray!0 (select (arr!31669 lt!460488) #b00000000000000000000000000000000)))))

(declare-fun d!126733 () Bool)

(declare-fun lt!460623 () (_ BitVec 32))

(assert (=> d!126733 (and (bvsge lt!460623 #b00000000000000000000000000000000) (bvsle lt!460623 (bvsub (size!32205 lt!460488) #b00000000000000000000000000000000)))))

(assert (=> d!126733 (= lt!460623 e!592181)))

(declare-fun c!106378 () Bool)

(assert (=> d!126733 (= c!106378 (bvsge #b00000000000000000000000000000000 (size!32205 (_keys!11680 thiss!1427))))))

(assert (=> d!126733 (and (bvsle #b00000000000000000000000000000000 (size!32205 (_keys!11680 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32205 (_keys!11680 thiss!1427)) (size!32205 lt!460488)))))

(assert (=> d!126733 (= (arrayCountValidKeys!0 lt!460488 #b00000000000000000000000000000000 (size!32205 (_keys!11680 thiss!1427))) lt!460623)))

(declare-fun b!1044949 () Bool)

(assert (=> b!1044949 (= e!592182 (bvadd #b00000000000000000000000000000001 call!44316))))

(declare-fun b!1044950 () Bool)

(assert (=> b!1044950 (= e!592182 call!44316)))

(declare-fun b!1044951 () Bool)

(assert (=> b!1044951 (= e!592181 #b00000000000000000000000000000000)))

(assert (= (and d!126733 c!106378) b!1044951))

(assert (= (and d!126733 (not c!106378)) b!1044948))

(assert (= (and b!1044948 c!106377) b!1044949))

(assert (= (and b!1044948 (not c!106377)) b!1044950))

(assert (= (or b!1044949 b!1044950) bm!44313))

(declare-fun m!964565 () Bool)

(assert (=> bm!44313 m!964565))

(assert (=> b!1044948 m!964501))

(assert (=> b!1044948 m!964501))

(assert (=> b!1044948 m!964503))

(assert (=> b!1044795 d!126733))

(declare-fun b!1044960 () Bool)

(declare-fun res!695758 () Bool)

(declare-fun e!592188 () Bool)

(assert (=> b!1044960 (=> (not res!695758) (not e!592188))))

(assert (=> b!1044960 (= res!695758 (validKeyInArray!0 (select (arr!31669 (_keys!11680 thiss!1427)) (index!41524 lt!460491))))))

(declare-fun b!1044962 () Bool)

(assert (=> b!1044962 (= e!592188 (bvslt (size!32205 (_keys!11680 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1044961 () Bool)

(declare-fun res!695757 () Bool)

(assert (=> b!1044961 (=> (not res!695757) (not e!592188))))

(assert (=> b!1044961 (= res!695757 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!126735 () Bool)

(declare-fun e!592187 () Bool)

(assert (=> d!126735 e!592187))

(declare-fun res!695760 () Bool)

(assert (=> d!126735 (=> (not res!695760) (not e!592187))))

(assert (=> d!126735 (= res!695760 (and (bvsge (index!41524 lt!460491) #b00000000000000000000000000000000) (bvslt (index!41524 lt!460491) (size!32205 (_keys!11680 thiss!1427)))))))

(declare-fun lt!460626 () Unit!34085)

(declare-fun choose!82 (array!65845 (_ BitVec 32) (_ BitVec 64)) Unit!34085)

(assert (=> d!126735 (= lt!460626 (choose!82 (_keys!11680 thiss!1427) (index!41524 lt!460491) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126735 e!592188))

(declare-fun res!695759 () Bool)

(assert (=> d!126735 (=> (not res!695759) (not e!592188))))

(assert (=> d!126735 (= res!695759 (and (bvsge (index!41524 lt!460491) #b00000000000000000000000000000000) (bvslt (index!41524 lt!460491) (size!32205 (_keys!11680 thiss!1427)))))))

(assert (=> d!126735 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11680 thiss!1427) (index!41524 lt!460491) #b1000000000000000000000000000000000000000000000000000000000000000) lt!460626)))

(declare-fun b!1044963 () Bool)

(assert (=> b!1044963 (= e!592187 (= (arrayCountValidKeys!0 (array!65846 (store (arr!31669 (_keys!11680 thiss!1427)) (index!41524 lt!460491) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32205 (_keys!11680 thiss!1427))) #b00000000000000000000000000000000 (size!32205 (_keys!11680 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11680 thiss!1427) #b00000000000000000000000000000000 (size!32205 (_keys!11680 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!126735 res!695759) b!1044960))

(assert (= (and b!1044960 res!695758) b!1044961))

(assert (= (and b!1044961 res!695757) b!1044962))

(assert (= (and d!126735 res!695760) b!1044963))

(declare-fun m!964567 () Bool)

(assert (=> b!1044960 m!964567))

(assert (=> b!1044960 m!964567))

(declare-fun m!964569 () Bool)

(assert (=> b!1044960 m!964569))

(declare-fun m!964571 () Bool)

(assert (=> b!1044961 m!964571))

(declare-fun m!964573 () Bool)

(assert (=> d!126735 m!964573))

(assert (=> b!1044963 m!964379))

(declare-fun m!964575 () Bool)

(assert (=> b!1044963 m!964575))

(assert (=> b!1044963 m!964399))

(assert (=> b!1044795 d!126735))

(declare-fun d!126737 () Bool)

(declare-fun res!695765 () Bool)

(declare-fun e!592193 () Bool)

(assert (=> d!126737 (=> res!695765 e!592193)))

(assert (=> d!126737 (= res!695765 (= (select (arr!31669 lt!460488) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126737 (= (arrayContainsKey!0 lt!460488 key!909 #b00000000000000000000000000000000) e!592193)))

(declare-fun b!1044968 () Bool)

(declare-fun e!592194 () Bool)

(assert (=> b!1044968 (= e!592193 e!592194)))

(declare-fun res!695766 () Bool)

(assert (=> b!1044968 (=> (not res!695766) (not e!592194))))

(assert (=> b!1044968 (= res!695766 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32205 lt!460488)))))

(declare-fun b!1044969 () Bool)

(assert (=> b!1044969 (= e!592194 (arrayContainsKey!0 lt!460488 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126737 (not res!695765)) b!1044968))

(assert (= (and b!1044968 res!695766) b!1044969))

(assert (=> d!126737 m!964501))

(declare-fun m!964577 () Bool)

(assert (=> b!1044969 m!964577))

(assert (=> b!1044795 d!126737))

(declare-fun d!126739 () Bool)

(declare-fun lt!460629 () ListLongMap!13769)

(assert (=> d!126739 (not (contains!6088 lt!460629 key!909))))

(declare-fun removeStrictlySorted!57 (List!21981 (_ BitVec 64)) List!21981)

(assert (=> d!126739 (= lt!460629 (ListLongMap!13770 (removeStrictlySorted!57 (toList!6900 (getCurrentListMap!3944 (_keys!11680 thiss!1427) (_values!6407 thiss!1427) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427))) key!909)))))

(assert (=> d!126739 (= (-!523 (getCurrentListMap!3944 (_keys!11680 thiss!1427) (_values!6407 thiss!1427) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)) key!909) lt!460629)))

(declare-fun bs!30523 () Bool)

(assert (= bs!30523 d!126739))

(declare-fun m!964579 () Bool)

(assert (=> bs!30523 m!964579))

(declare-fun m!964581 () Bool)

(assert (=> bs!30523 m!964581))

(assert (=> b!1044795 d!126739))

(declare-fun d!126741 () Bool)

(declare-fun e!592197 () Bool)

(assert (=> d!126741 e!592197))

(declare-fun res!695769 () Bool)

(assert (=> d!126741 (=> (not res!695769) (not e!592197))))

(assert (=> d!126741 (= res!695769 (and (bvsge (index!41524 lt!460491) #b00000000000000000000000000000000) (bvslt (index!41524 lt!460491) (size!32205 (_keys!11680 thiss!1427)))))))

(declare-fun lt!460632 () Unit!34085)

(declare-fun choose!53 (array!65845 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21982) Unit!34085)

(assert (=> d!126741 (= lt!460632 (choose!53 (_keys!11680 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41524 lt!460491) #b00000000000000000000000000000000 Nil!21979))))

(assert (=> d!126741 (bvslt (size!32205 (_keys!11680 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126741 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11680 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41524 lt!460491) #b00000000000000000000000000000000 Nil!21979) lt!460632)))

(declare-fun b!1044972 () Bool)

(assert (=> b!1044972 (= e!592197 (arrayNoDuplicates!0 (array!65846 (store (arr!31669 (_keys!11680 thiss!1427)) (index!41524 lt!460491) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32205 (_keys!11680 thiss!1427))) #b00000000000000000000000000000000 Nil!21979))))

(assert (= (and d!126741 res!695769) b!1044972))

(declare-fun m!964583 () Bool)

(assert (=> d!126741 m!964583))

(assert (=> b!1044972 m!964379))

(declare-fun m!964585 () Bool)

(assert (=> b!1044972 m!964585))

(assert (=> b!1044795 d!126741))

(declare-fun d!126743 () Bool)

(declare-fun e!592200 () Bool)

(assert (=> d!126743 e!592200))

(declare-fun res!695772 () Bool)

(assert (=> d!126743 (=> (not res!695772) (not e!592200))))

(assert (=> d!126743 (= res!695772 (and (bvsge (index!41524 lt!460491) #b00000000000000000000000000000000) (bvslt (index!41524 lt!460491) (size!32205 (_keys!11680 thiss!1427)))))))

(declare-fun lt!460635 () Unit!34085)

(declare-fun choose!1712 (array!65845 array!65847 (_ BitVec 32) (_ BitVec 32) V!37963 V!37963 (_ BitVec 32) (_ BitVec 64) Int) Unit!34085)

(assert (=> d!126743 (= lt!460635 (choose!1712 (_keys!11680 thiss!1427) (_values!6407 thiss!1427) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) (index!41524 lt!460491) key!909 (defaultEntry!6384 thiss!1427)))))

(assert (=> d!126743 (validMask!0 (mask!30535 thiss!1427))))

(assert (=> d!126743 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!45 (_keys!11680 thiss!1427) (_values!6407 thiss!1427) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) (index!41524 lt!460491) key!909 (defaultEntry!6384 thiss!1427)) lt!460635)))

(declare-fun b!1044975 () Bool)

(assert (=> b!1044975 (= e!592200 (= (-!523 (getCurrentListMap!3944 (_keys!11680 thiss!1427) (_values!6407 thiss!1427) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)) key!909) (getCurrentListMap!3944 (array!65846 (store (arr!31669 (_keys!11680 thiss!1427)) (index!41524 lt!460491) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32205 (_keys!11680 thiss!1427))) (array!65848 (store (arr!31670 (_values!6407 thiss!1427)) (index!41524 lt!460491) (ValueCellFull!11705 (dynLambda!2015 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32206 (_values!6407 thiss!1427))) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427))))))

(assert (=> b!1044975 (bvslt (index!41524 lt!460491) (size!32206 (_values!6407 thiss!1427)))))

(assert (= (and d!126743 res!695772) b!1044975))

(declare-fun b_lambda!16177 () Bool)

(assert (=> (not b_lambda!16177) (not b!1044975)))

(assert (=> b!1044975 t!31188))

(declare-fun b_and!33653 () Bool)

(assert (= b_and!33651 (and (=> t!31188 result!14487) b_and!33653)))

(declare-fun m!964587 () Bool)

(assert (=> d!126743 m!964587))

(assert (=> d!126743 m!964497))

(assert (=> b!1044975 m!964381))

(assert (=> b!1044975 m!964385))

(declare-fun m!964589 () Bool)

(assert (=> b!1044975 m!964589))

(assert (=> b!1044975 m!964393))

(assert (=> b!1044975 m!964385))

(assert (=> b!1044975 m!964387))

(assert (=> b!1044975 m!964379))

(assert (=> b!1044795 d!126743))

(declare-fun b!1044976 () Bool)

(declare-fun e!592210 () Bool)

(declare-fun lt!460637 () ListLongMap!13769)

(assert (=> b!1044976 (= e!592210 (= (apply!917 lt!460637 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6218 thiss!1427)))))

(declare-fun d!126745 () Bool)

(declare-fun e!592207 () Bool)

(assert (=> d!126745 e!592207))

(declare-fun res!695773 () Bool)

(assert (=> d!126745 (=> (not res!695773) (not e!592207))))

(assert (=> d!126745 (= res!695773 (or (bvsge #b00000000000000000000000000000000 (size!32205 (_keys!11680 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32205 (_keys!11680 thiss!1427))))))))

(declare-fun lt!460646 () ListLongMap!13769)

(assert (=> d!126745 (= lt!460637 lt!460646)))

(declare-fun lt!460654 () Unit!34085)

(declare-fun e!592204 () Unit!34085)

(assert (=> d!126745 (= lt!460654 e!592204)))

(declare-fun c!106382 () Bool)

(declare-fun e!592205 () Bool)

(assert (=> d!126745 (= c!106382 e!592205)))

(declare-fun res!695778 () Bool)

(assert (=> d!126745 (=> (not res!695778) (not e!592205))))

(assert (=> d!126745 (= res!695778 (bvslt #b00000000000000000000000000000000 (size!32205 (_keys!11680 thiss!1427))))))

(declare-fun e!592211 () ListLongMap!13769)

(assert (=> d!126745 (= lt!460646 e!592211)))

(declare-fun c!106380 () Bool)

(assert (=> d!126745 (= c!106380 (and (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126745 (validMask!0 (mask!30535 thiss!1427))))

(assert (=> d!126745 (= (getCurrentListMap!3944 (_keys!11680 thiss!1427) (_values!6407 thiss!1427) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)) lt!460637)))

(declare-fun b!1044977 () Bool)

(declare-fun e!592212 () Bool)

(assert (=> b!1044977 (= e!592212 (validKeyInArray!0 (select (arr!31669 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun call!44322 () ListLongMap!13769)

(declare-fun call!44318 () ListLongMap!13769)

(declare-fun call!44320 () ListLongMap!13769)

(declare-fun call!44323 () ListLongMap!13769)

(declare-fun bm!44314 () Bool)

(declare-fun c!106384 () Bool)

(assert (=> bm!44314 (= call!44318 (+!3128 (ite c!106380 call!44323 (ite c!106384 call!44320 call!44322)) (ite (or c!106380 c!106384) (tuple2!15735 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6218 thiss!1427)) (tuple2!15735 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6218 thiss!1427)))))))

(declare-fun bm!44315 () Bool)

(assert (=> bm!44315 (= call!44322 call!44320)))

(declare-fun bm!44316 () Bool)

(assert (=> bm!44316 (= call!44320 call!44323)))

(declare-fun bm!44317 () Bool)

(assert (=> bm!44317 (= call!44323 (getCurrentListMapNoExtraKeys!3568 (_keys!11680 thiss!1427) (_values!6407 thiss!1427) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun b!1044978 () Bool)

(declare-fun Unit!34090 () Unit!34085)

(assert (=> b!1044978 (= e!592204 Unit!34090)))

(declare-fun b!1044979 () Bool)

(declare-fun e!592202 () Bool)

(declare-fun e!592203 () Bool)

(assert (=> b!1044979 (= e!592202 e!592203)))

(declare-fun res!695776 () Bool)

(declare-fun call!44317 () Bool)

(assert (=> b!1044979 (= res!695776 call!44317)))

(assert (=> b!1044979 (=> (not res!695776) (not e!592203))))

(declare-fun b!1044980 () Bool)

(declare-fun e!592208 () ListLongMap!13769)

(assert (=> b!1044980 (= e!592208 call!44322)))

(declare-fun b!1044981 () Bool)

(declare-fun e!592201 () Bool)

(declare-fun call!44319 () Bool)

(assert (=> b!1044981 (= e!592201 (not call!44319))))

(declare-fun b!1044982 () Bool)

(assert (=> b!1044982 (= e!592211 (+!3128 call!44318 (tuple2!15735 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6218 thiss!1427))))))

(declare-fun bm!44318 () Bool)

(declare-fun call!44321 () ListLongMap!13769)

(assert (=> bm!44318 (= call!44321 call!44318)))

(declare-fun bm!44319 () Bool)

(assert (=> bm!44319 (= call!44317 (contains!6088 lt!460637 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044983 () Bool)

(assert (=> b!1044983 (= e!592202 (not call!44317))))

(declare-fun b!1044984 () Bool)

(declare-fun e!592206 () Bool)

(declare-fun e!592209 () Bool)

(assert (=> b!1044984 (= e!592206 e!592209)))

(declare-fun res!695779 () Bool)

(assert (=> b!1044984 (=> (not res!695779) (not e!592209))))

(assert (=> b!1044984 (= res!695779 (contains!6088 lt!460637 (select (arr!31669 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1044984 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32205 (_keys!11680 thiss!1427))))))

(declare-fun b!1044985 () Bool)

(assert (=> b!1044985 (= e!592209 (= (apply!917 lt!460637 (select (arr!31669 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000)) (get!16570 (select (arr!31670 (_values!6407 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2015 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044985 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32206 (_values!6407 thiss!1427))))))

(assert (=> b!1044985 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32205 (_keys!11680 thiss!1427))))))

(declare-fun b!1044986 () Bool)

(assert (=> b!1044986 (= e!592207 e!592202)))

(declare-fun c!106383 () Bool)

(assert (=> b!1044986 (= c!106383 (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044987 () Bool)

(assert (=> b!1044987 (= e!592208 call!44321)))

(declare-fun b!1044988 () Bool)

(assert (=> b!1044988 (= e!592201 e!592210)))

(declare-fun res!695774 () Bool)

(assert (=> b!1044988 (= res!695774 call!44319)))

(assert (=> b!1044988 (=> (not res!695774) (not e!592210))))

(declare-fun b!1044989 () Bool)

(assert (=> b!1044989 (= e!592205 (validKeyInArray!0 (select (arr!31669 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1044990 () Bool)

(declare-fun lt!460645 () Unit!34085)

(assert (=> b!1044990 (= e!592204 lt!460645)))

(declare-fun lt!460650 () ListLongMap!13769)

(assert (=> b!1044990 (= lt!460650 (getCurrentListMapNoExtraKeys!3568 (_keys!11680 thiss!1427) (_values!6407 thiss!1427) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun lt!460640 () (_ BitVec 64))

(assert (=> b!1044990 (= lt!460640 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460639 () (_ BitVec 64))

(assert (=> b!1044990 (= lt!460639 (select (arr!31669 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460638 () Unit!34085)

(assert (=> b!1044990 (= lt!460638 (addStillContains!627 lt!460650 lt!460640 (zeroValue!6218 thiss!1427) lt!460639))))

(assert (=> b!1044990 (contains!6088 (+!3128 lt!460650 (tuple2!15735 lt!460640 (zeroValue!6218 thiss!1427))) lt!460639)))

(declare-fun lt!460636 () Unit!34085)

(assert (=> b!1044990 (= lt!460636 lt!460638)))

(declare-fun lt!460642 () ListLongMap!13769)

(assert (=> b!1044990 (= lt!460642 (getCurrentListMapNoExtraKeys!3568 (_keys!11680 thiss!1427) (_values!6407 thiss!1427) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun lt!460655 () (_ BitVec 64))

(assert (=> b!1044990 (= lt!460655 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460653 () (_ BitVec 64))

(assert (=> b!1044990 (= lt!460653 (select (arr!31669 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460657 () Unit!34085)

(assert (=> b!1044990 (= lt!460657 (addApplyDifferent!483 lt!460642 lt!460655 (minValue!6218 thiss!1427) lt!460653))))

(assert (=> b!1044990 (= (apply!917 (+!3128 lt!460642 (tuple2!15735 lt!460655 (minValue!6218 thiss!1427))) lt!460653) (apply!917 lt!460642 lt!460653))))

(declare-fun lt!460652 () Unit!34085)

(assert (=> b!1044990 (= lt!460652 lt!460657)))

(declare-fun lt!460648 () ListLongMap!13769)

(assert (=> b!1044990 (= lt!460648 (getCurrentListMapNoExtraKeys!3568 (_keys!11680 thiss!1427) (_values!6407 thiss!1427) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun lt!460651 () (_ BitVec 64))

(assert (=> b!1044990 (= lt!460651 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460647 () (_ BitVec 64))

(assert (=> b!1044990 (= lt!460647 (select (arr!31669 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460641 () Unit!34085)

(assert (=> b!1044990 (= lt!460641 (addApplyDifferent!483 lt!460648 lt!460651 (zeroValue!6218 thiss!1427) lt!460647))))

(assert (=> b!1044990 (= (apply!917 (+!3128 lt!460648 (tuple2!15735 lt!460651 (zeroValue!6218 thiss!1427))) lt!460647) (apply!917 lt!460648 lt!460647))))

(declare-fun lt!460643 () Unit!34085)

(assert (=> b!1044990 (= lt!460643 lt!460641)))

(declare-fun lt!460644 () ListLongMap!13769)

(assert (=> b!1044990 (= lt!460644 (getCurrentListMapNoExtraKeys!3568 (_keys!11680 thiss!1427) (_values!6407 thiss!1427) (mask!30535 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun lt!460656 () (_ BitVec 64))

(assert (=> b!1044990 (= lt!460656 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460649 () (_ BitVec 64))

(assert (=> b!1044990 (= lt!460649 (select (arr!31669 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044990 (= lt!460645 (addApplyDifferent!483 lt!460644 lt!460656 (minValue!6218 thiss!1427) lt!460649))))

(assert (=> b!1044990 (= (apply!917 (+!3128 lt!460644 (tuple2!15735 lt!460656 (minValue!6218 thiss!1427))) lt!460649) (apply!917 lt!460644 lt!460649))))

(declare-fun b!1044991 () Bool)

(assert (=> b!1044991 (= e!592203 (= (apply!917 lt!460637 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6218 thiss!1427)))))

(declare-fun bm!44320 () Bool)

(assert (=> bm!44320 (= call!44319 (contains!6088 lt!460637 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044992 () Bool)

(declare-fun res!695775 () Bool)

(assert (=> b!1044992 (=> (not res!695775) (not e!592207))))

(assert (=> b!1044992 (= res!695775 e!592201)))

(declare-fun c!106381 () Bool)

(assert (=> b!1044992 (= c!106381 (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1044993 () Bool)

(declare-fun res!695781 () Bool)

(assert (=> b!1044993 (=> (not res!695781) (not e!592207))))

(assert (=> b!1044993 (= res!695781 e!592206)))

(declare-fun res!695780 () Bool)

(assert (=> b!1044993 (=> res!695780 e!592206)))

(assert (=> b!1044993 (= res!695780 (not e!592212))))

(declare-fun res!695777 () Bool)

(assert (=> b!1044993 (=> (not res!695777) (not e!592212))))

(assert (=> b!1044993 (= res!695777 (bvslt #b00000000000000000000000000000000 (size!32205 (_keys!11680 thiss!1427))))))

(declare-fun b!1044994 () Bool)

(declare-fun e!592213 () ListLongMap!13769)

(assert (=> b!1044994 (= e!592211 e!592213)))

(assert (=> b!1044994 (= c!106384 (and (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044995 () Bool)

(declare-fun c!106379 () Bool)

(assert (=> b!1044995 (= c!106379 (and (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1044995 (= e!592213 e!592208)))

(declare-fun b!1044996 () Bool)

(assert (=> b!1044996 (= e!592213 call!44321)))

(assert (= (and d!126745 c!106380) b!1044982))

(assert (= (and d!126745 (not c!106380)) b!1044994))

(assert (= (and b!1044994 c!106384) b!1044996))

(assert (= (and b!1044994 (not c!106384)) b!1044995))

(assert (= (and b!1044995 c!106379) b!1044987))

(assert (= (and b!1044995 (not c!106379)) b!1044980))

(assert (= (or b!1044987 b!1044980) bm!44315))

(assert (= (or b!1044996 bm!44315) bm!44316))

(assert (= (or b!1044996 b!1044987) bm!44318))

(assert (= (or b!1044982 bm!44316) bm!44317))

(assert (= (or b!1044982 bm!44318) bm!44314))

(assert (= (and d!126745 res!695778) b!1044989))

(assert (= (and d!126745 c!106382) b!1044990))

(assert (= (and d!126745 (not c!106382)) b!1044978))

(assert (= (and d!126745 res!695773) b!1044993))

(assert (= (and b!1044993 res!695777) b!1044977))

(assert (= (and b!1044993 (not res!695780)) b!1044984))

(assert (= (and b!1044984 res!695779) b!1044985))

(assert (= (and b!1044993 res!695781) b!1044992))

(assert (= (and b!1044992 c!106381) b!1044988))

(assert (= (and b!1044992 (not c!106381)) b!1044981))

(assert (= (and b!1044988 res!695774) b!1044976))

(assert (= (or b!1044988 b!1044981) bm!44320))

(assert (= (and b!1044992 res!695775) b!1044986))

(assert (= (and b!1044986 c!106383) b!1044979))

(assert (= (and b!1044986 (not c!106383)) b!1044983))

(assert (= (and b!1044979 res!695776) b!1044991))

(assert (= (or b!1044979 b!1044983) bm!44319))

(declare-fun b_lambda!16179 () Bool)

(assert (=> (not b_lambda!16179) (not b!1044985)))

(assert (=> b!1044985 t!31188))

(declare-fun b_and!33655 () Bool)

(assert (= b_and!33653 (and (=> t!31188 result!14487) b_and!33655)))

(declare-fun m!964591 () Bool)

(assert (=> b!1044977 m!964591))

(assert (=> b!1044977 m!964591))

(declare-fun m!964593 () Bool)

(assert (=> b!1044977 m!964593))

(declare-fun m!964595 () Bool)

(assert (=> bm!44319 m!964595))

(declare-fun m!964597 () Bool)

(assert (=> bm!44320 m!964597))

(assert (=> b!1044985 m!964393))

(assert (=> b!1044985 m!964591))

(declare-fun m!964599 () Bool)

(assert (=> b!1044985 m!964599))

(assert (=> b!1044985 m!964393))

(declare-fun m!964601 () Bool)

(assert (=> b!1044985 m!964601))

(assert (=> b!1044985 m!964599))

(assert (=> b!1044985 m!964591))

(declare-fun m!964603 () Bool)

(assert (=> b!1044985 m!964603))

(declare-fun m!964605 () Bool)

(assert (=> b!1044976 m!964605))

(declare-fun m!964607 () Bool)

(assert (=> bm!44317 m!964607))

(declare-fun m!964609 () Bool)

(assert (=> bm!44314 m!964609))

(declare-fun m!964611 () Bool)

(assert (=> b!1044990 m!964611))

(declare-fun m!964613 () Bool)

(assert (=> b!1044990 m!964613))

(declare-fun m!964615 () Bool)

(assert (=> b!1044990 m!964615))

(declare-fun m!964617 () Bool)

(assert (=> b!1044990 m!964617))

(assert (=> b!1044990 m!964591))

(assert (=> b!1044990 m!964615))

(declare-fun m!964619 () Bool)

(assert (=> b!1044990 m!964619))

(declare-fun m!964621 () Bool)

(assert (=> b!1044990 m!964621))

(declare-fun m!964623 () Bool)

(assert (=> b!1044990 m!964623))

(declare-fun m!964625 () Bool)

(assert (=> b!1044990 m!964625))

(assert (=> b!1044990 m!964625))

(declare-fun m!964627 () Bool)

(assert (=> b!1044990 m!964627))

(declare-fun m!964629 () Bool)

(assert (=> b!1044990 m!964629))

(declare-fun m!964631 () Bool)

(assert (=> b!1044990 m!964631))

(declare-fun m!964633 () Bool)

(assert (=> b!1044990 m!964633))

(assert (=> b!1044990 m!964629))

(declare-fun m!964635 () Bool)

(assert (=> b!1044990 m!964635))

(declare-fun m!964637 () Bool)

(assert (=> b!1044990 m!964637))

(assert (=> b!1044990 m!964613))

(declare-fun m!964639 () Bool)

(assert (=> b!1044990 m!964639))

(assert (=> b!1044990 m!964607))

(assert (=> d!126745 m!964497))

(assert (=> b!1044984 m!964591))

(assert (=> b!1044984 m!964591))

(declare-fun m!964641 () Bool)

(assert (=> b!1044984 m!964641))

(declare-fun m!964643 () Bool)

(assert (=> b!1044991 m!964643))

(declare-fun m!964645 () Bool)

(assert (=> b!1044982 m!964645))

(assert (=> b!1044989 m!964591))

(assert (=> b!1044989 m!964591))

(assert (=> b!1044989 m!964593))

(assert (=> b!1044795 d!126745))

(declare-fun d!126747 () Bool)

(declare-fun e!592216 () Bool)

(assert (=> d!126747 e!592216))

(declare-fun res!695784 () Bool)

(assert (=> d!126747 (=> (not res!695784) (not e!592216))))

(assert (=> d!126747 (= res!695784 (bvslt (index!41524 lt!460491) (size!32205 (_keys!11680 thiss!1427))))))

(declare-fun lt!460660 () Unit!34085)

(declare-fun choose!121 (array!65845 (_ BitVec 32) (_ BitVec 64)) Unit!34085)

(assert (=> d!126747 (= lt!460660 (choose!121 (_keys!11680 thiss!1427) (index!41524 lt!460491) key!909))))

(assert (=> d!126747 (bvsge (index!41524 lt!460491) #b00000000000000000000000000000000)))

(assert (=> d!126747 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11680 thiss!1427) (index!41524 lt!460491) key!909) lt!460660)))

(declare-fun b!1044999 () Bool)

(assert (=> b!1044999 (= e!592216 (not (arrayContainsKey!0 (array!65846 (store (arr!31669 (_keys!11680 thiss!1427)) (index!41524 lt!460491) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32205 (_keys!11680 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126747 res!695784) b!1044999))

(declare-fun m!964647 () Bool)

(assert (=> d!126747 m!964647))

(assert (=> b!1044999 m!964379))

(declare-fun m!964649 () Bool)

(assert (=> b!1044999 m!964649))

(assert (=> b!1044795 d!126747))

(declare-fun bm!44321 () Bool)

(declare-fun call!44324 () (_ BitVec 32))

(assert (=> bm!44321 (= call!44324 (arrayCountValidKeys!0 (_keys!11680 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32205 (_keys!11680 thiss!1427))))))

(declare-fun b!1045000 () Bool)

(declare-fun e!592217 () (_ BitVec 32))

(declare-fun e!592218 () (_ BitVec 32))

(assert (=> b!1045000 (= e!592217 e!592218)))

(declare-fun c!106385 () Bool)

(assert (=> b!1045000 (= c!106385 (validKeyInArray!0 (select (arr!31669 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!126749 () Bool)

(declare-fun lt!460661 () (_ BitVec 32))

(assert (=> d!126749 (and (bvsge lt!460661 #b00000000000000000000000000000000) (bvsle lt!460661 (bvsub (size!32205 (_keys!11680 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126749 (= lt!460661 e!592217)))

(declare-fun c!106386 () Bool)

(assert (=> d!126749 (= c!106386 (bvsge #b00000000000000000000000000000000 (size!32205 (_keys!11680 thiss!1427))))))

(assert (=> d!126749 (and (bvsle #b00000000000000000000000000000000 (size!32205 (_keys!11680 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32205 (_keys!11680 thiss!1427)) (size!32205 (_keys!11680 thiss!1427))))))

(assert (=> d!126749 (= (arrayCountValidKeys!0 (_keys!11680 thiss!1427) #b00000000000000000000000000000000 (size!32205 (_keys!11680 thiss!1427))) lt!460661)))

(declare-fun b!1045001 () Bool)

(assert (=> b!1045001 (= e!592218 (bvadd #b00000000000000000000000000000001 call!44324))))

(declare-fun b!1045002 () Bool)

(assert (=> b!1045002 (= e!592218 call!44324)))

(declare-fun b!1045003 () Bool)

(assert (=> b!1045003 (= e!592217 #b00000000000000000000000000000000)))

(assert (= (and d!126749 c!106386) b!1045003))

(assert (= (and d!126749 (not c!106386)) b!1045000))

(assert (= (and b!1045000 c!106385) b!1045001))

(assert (= (and b!1045000 (not c!106385)) b!1045002))

(assert (= (or b!1045001 b!1045002) bm!44321))

(declare-fun m!964651 () Bool)

(assert (=> bm!44321 m!964651))

(assert (=> b!1045000 m!964591))

(assert (=> b!1045000 m!964591))

(assert (=> b!1045000 m!964593))

(assert (=> b!1044795 d!126749))

(declare-fun d!126751 () Bool)

(declare-fun e!592221 () Bool)

(assert (=> d!126751 e!592221))

(declare-fun res!695787 () Bool)

(assert (=> d!126751 (=> (not res!695787) (not e!592221))))

(assert (=> d!126751 (= res!695787 (and (bvsge (index!41524 lt!460491) #b00000000000000000000000000000000) (bvslt (index!41524 lt!460491) (size!32205 (_keys!11680 thiss!1427)))))))

(declare-fun lt!460664 () Unit!34085)

(declare-fun choose!25 (array!65845 (_ BitVec 32) (_ BitVec 32)) Unit!34085)

(assert (=> d!126751 (= lt!460664 (choose!25 (_keys!11680 thiss!1427) (index!41524 lt!460491) (mask!30535 thiss!1427)))))

(assert (=> d!126751 (validMask!0 (mask!30535 thiss!1427))))

(assert (=> d!126751 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11680 thiss!1427) (index!41524 lt!460491) (mask!30535 thiss!1427)) lt!460664)))

(declare-fun b!1045006 () Bool)

(assert (=> b!1045006 (= e!592221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65846 (store (arr!31669 (_keys!11680 thiss!1427)) (index!41524 lt!460491) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32205 (_keys!11680 thiss!1427))) (mask!30535 thiss!1427)))))

(assert (= (and d!126751 res!695787) b!1045006))

(declare-fun m!964653 () Bool)

(assert (=> d!126751 m!964653))

(assert (=> d!126751 m!964497))

(assert (=> b!1045006 m!964379))

(declare-fun m!964655 () Bool)

(assert (=> b!1045006 m!964655))

(assert (=> b!1044795 d!126751))

(declare-fun b!1045017 () Bool)

(declare-fun e!592233 () Bool)

(declare-fun e!592232 () Bool)

(assert (=> b!1045017 (= e!592233 e!592232)))

(declare-fun c!106389 () Bool)

(assert (=> b!1045017 (= c!106389 (validKeyInArray!0 (select (arr!31669 lt!460488) #b00000000000000000000000000000000)))))

(declare-fun b!1045018 () Bool)

(declare-fun call!44327 () Bool)

(assert (=> b!1045018 (= e!592232 call!44327)))

(declare-fun d!126753 () Bool)

(declare-fun res!695794 () Bool)

(declare-fun e!592231 () Bool)

(assert (=> d!126753 (=> res!695794 e!592231)))

(assert (=> d!126753 (= res!695794 (bvsge #b00000000000000000000000000000000 (size!32205 lt!460488)))))

(assert (=> d!126753 (= (arrayNoDuplicates!0 lt!460488 #b00000000000000000000000000000000 Nil!21979) e!592231)))

(declare-fun b!1045019 () Bool)

(declare-fun e!592230 () Bool)

(declare-fun contains!6089 (List!21982 (_ BitVec 64)) Bool)

(assert (=> b!1045019 (= e!592230 (contains!6089 Nil!21979 (select (arr!31669 lt!460488) #b00000000000000000000000000000000)))))

(declare-fun bm!44324 () Bool)

(assert (=> bm!44324 (= call!44327 (arrayNoDuplicates!0 lt!460488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106389 (Cons!21978 (select (arr!31669 lt!460488) #b00000000000000000000000000000000) Nil!21979) Nil!21979)))))

(declare-fun b!1045020 () Bool)

(assert (=> b!1045020 (= e!592231 e!592233)))

(declare-fun res!695796 () Bool)

(assert (=> b!1045020 (=> (not res!695796) (not e!592233))))

(assert (=> b!1045020 (= res!695796 (not e!592230))))

(declare-fun res!695795 () Bool)

(assert (=> b!1045020 (=> (not res!695795) (not e!592230))))

(assert (=> b!1045020 (= res!695795 (validKeyInArray!0 (select (arr!31669 lt!460488) #b00000000000000000000000000000000)))))

(declare-fun b!1045021 () Bool)

(assert (=> b!1045021 (= e!592232 call!44327)))

(assert (= (and d!126753 (not res!695794)) b!1045020))

(assert (= (and b!1045020 res!695795) b!1045019))

(assert (= (and b!1045020 res!695796) b!1045017))

(assert (= (and b!1045017 c!106389) b!1045018))

(assert (= (and b!1045017 (not c!106389)) b!1045021))

(assert (= (or b!1045018 b!1045021) bm!44324))

(assert (=> b!1045017 m!964501))

(assert (=> b!1045017 m!964501))

(assert (=> b!1045017 m!964503))

(assert (=> b!1045019 m!964501))

(assert (=> b!1045019 m!964501))

(declare-fun m!964657 () Bool)

(assert (=> b!1045019 m!964657))

(assert (=> bm!44324 m!964501))

(declare-fun m!964659 () Bool)

(assert (=> bm!44324 m!964659))

(assert (=> b!1045020 m!964501))

(assert (=> b!1045020 m!964501))

(assert (=> b!1045020 m!964503))

(assert (=> b!1044795 d!126753))

(declare-fun d!126755 () Bool)

(declare-fun res!695803 () Bool)

(declare-fun e!592236 () Bool)

(assert (=> d!126755 (=> (not res!695803) (not e!592236))))

(declare-fun simpleValid!446 (LongMapFixedSize!6004) Bool)

(assert (=> d!126755 (= res!695803 (simpleValid!446 thiss!1427))))

(assert (=> d!126755 (= (valid!2258 thiss!1427) e!592236)))

(declare-fun b!1045028 () Bool)

(declare-fun res!695804 () Bool)

(assert (=> b!1045028 (=> (not res!695804) (not e!592236))))

(assert (=> b!1045028 (= res!695804 (= (arrayCountValidKeys!0 (_keys!11680 thiss!1427) #b00000000000000000000000000000000 (size!32205 (_keys!11680 thiss!1427))) (_size!3057 thiss!1427)))))

(declare-fun b!1045029 () Bool)

(declare-fun res!695805 () Bool)

(assert (=> b!1045029 (=> (not res!695805) (not e!592236))))

(assert (=> b!1045029 (= res!695805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11680 thiss!1427) (mask!30535 thiss!1427)))))

(declare-fun b!1045030 () Bool)

(assert (=> b!1045030 (= e!592236 (arrayNoDuplicates!0 (_keys!11680 thiss!1427) #b00000000000000000000000000000000 Nil!21979))))

(assert (= (and d!126755 res!695803) b!1045028))

(assert (= (and b!1045028 res!695804) b!1045029))

(assert (= (and b!1045029 res!695805) b!1045030))

(declare-fun m!964661 () Bool)

(assert (=> d!126755 m!964661))

(assert (=> b!1045028 m!964399))

(declare-fun m!964663 () Bool)

(assert (=> b!1045029 m!964663))

(declare-fun m!964665 () Bool)

(assert (=> b!1045030 m!964665))

(assert (=> start!91894 d!126755))

(declare-fun b!1045037 () Bool)

(declare-fun e!592242 () Bool)

(assert (=> b!1045037 (= e!592242 tp_is_empty!24817)))

(declare-fun b!1045038 () Bool)

(declare-fun e!592241 () Bool)

(assert (=> b!1045038 (= e!592241 tp_is_empty!24817)))

(declare-fun mapIsEmpty!38855 () Bool)

(declare-fun mapRes!38855 () Bool)

(assert (=> mapIsEmpty!38855 mapRes!38855))

(declare-fun mapNonEmpty!38855 () Bool)

(declare-fun tp!74544 () Bool)

(assert (=> mapNonEmpty!38855 (= mapRes!38855 (and tp!74544 e!592242))))

(declare-fun mapRest!38855 () (Array (_ BitVec 32) ValueCell!11705))

(declare-fun mapKey!38855 () (_ BitVec 32))

(declare-fun mapValue!38855 () ValueCell!11705)

(assert (=> mapNonEmpty!38855 (= mapRest!38846 (store mapRest!38855 mapKey!38855 mapValue!38855))))

(declare-fun condMapEmpty!38855 () Bool)

(declare-fun mapDefault!38855 () ValueCell!11705)

(assert (=> mapNonEmpty!38846 (= condMapEmpty!38855 (= mapRest!38846 ((as const (Array (_ BitVec 32) ValueCell!11705)) mapDefault!38855)))))

(assert (=> mapNonEmpty!38846 (= tp!74529 (and e!592241 mapRes!38855))))

(assert (= (and mapNonEmpty!38846 condMapEmpty!38855) mapIsEmpty!38855))

(assert (= (and mapNonEmpty!38846 (not condMapEmpty!38855)) mapNonEmpty!38855))

(assert (= (and mapNonEmpty!38855 ((_ is ValueCellFull!11705) mapValue!38855)) b!1045037))

(assert (= (and mapNonEmpty!38846 ((_ is ValueCellFull!11705) mapDefault!38855)) b!1045038))

(declare-fun m!964667 () Bool)

(assert (=> mapNonEmpty!38855 m!964667))

(declare-fun b_lambda!16181 () Bool)

(assert (= b_lambda!16175 (or (and b!1044798 b_free!21097) b_lambda!16181)))

(declare-fun b_lambda!16183 () Bool)

(assert (= b_lambda!16177 (or (and b!1044798 b_free!21097) b_lambda!16183)))

(declare-fun b_lambda!16185 () Bool)

(assert (= b_lambda!16179 (or (and b!1044798 b_free!21097) b_lambda!16185)))

(check-sat (not b!1044960) (not bm!44319) (not b!1044963) (not b!1045006) (not d!126745) (not b!1044933) (not b!1044919) (not b!1045017) (not d!126755) (not b!1044927) (not b!1044984) (not mapNonEmpty!38855) (not b_next!21097) (not b!1044961) (not d!126743) (not b!1044972) (not b!1045028) (not bm!44314) (not d!126735) (not b!1044975) (not b!1045029) (not b!1044928) (not b!1044977) (not bm!44313) (not d!126739) (not bm!44309) (not b!1045019) (not b!1044932) b_and!33655 (not b!1044999) (not b!1044969) (not d!126731) (not d!126747) tp_is_empty!24817 (not b!1044985) (not b!1044989) (not b!1044875) (not bm!44321) (not b!1044925) (not b_lambda!16181) (not d!126751) (not bm!44320) (not b!1044991) (not bm!44289) (not b!1044976) (not b_lambda!16185) (not b!1044876) (not bm!44317) (not bm!44307) (not b_lambda!16173) (not bm!44304) (not b!1044990) (not b!1045030) (not b!1045000) (not b_lambda!16183) (not d!126727) (not b!1044982) (not b!1044859) (not b!1044934) (not bm!44310) (not d!126741) (not b!1044920) (not b!1044948) (not bm!44324) (not b!1045020))
(check-sat b_and!33655 (not b_next!21097))
