; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91658 () Bool)

(assert start!91658)

(declare-fun b!1043329 () Bool)

(declare-fun b_free!21097 () Bool)

(declare-fun b_next!21097 () Bool)

(assert (=> b!1043329 (= b_free!21097 (not b_next!21097))))

(declare-fun tp!74528 () Bool)

(declare-fun b_and!33603 () Bool)

(assert (=> b!1043329 (= tp!74528 b_and!33603)))

(declare-fun mapNonEmpty!38846 () Bool)

(declare-fun mapRes!38846 () Bool)

(declare-fun tp!74529 () Bool)

(declare-fun e!591143 () Bool)

(assert (=> mapNonEmpty!38846 (= mapRes!38846 (and tp!74529 e!591143))))

(declare-datatypes ((V!37963 0))(
  ( (V!37964 (val!12459 Int)) )
))
(declare-datatypes ((ValueCell!11705 0))(
  ( (ValueCellFull!11705 (v!15049 V!37963)) (EmptyCell!11705) )
))
(declare-fun mapValue!38846 () ValueCell!11705)

(declare-datatypes ((array!65735 0))(
  ( (array!65736 (arr!31620 (Array (_ BitVec 32) (_ BitVec 64))) (size!32157 (_ BitVec 32))) )
))
(declare-datatypes ((array!65737 0))(
  ( (array!65738 (arr!31621 (Array (_ BitVec 32) ValueCell!11705)) (size!32158 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6004 0))(
  ( (LongMapFixedSize!6005 (defaultEntry!6384 Int) (mask!30470 (_ BitVec 32)) (extraKeys!6112 (_ BitVec 32)) (zeroValue!6218 V!37963) (minValue!6218 V!37963) (_size!3057 (_ BitVec 32)) (_keys!11638 array!65735) (_values!6407 array!65737) (_vacant!3057 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6004)

(declare-fun mapKey!38846 () (_ BitVec 32))

(declare-fun mapRest!38846 () (Array (_ BitVec 32) ValueCell!11705))

(assert (=> mapNonEmpty!38846 (= (arr!31621 (_values!6407 thiss!1427)) (store mapRest!38846 mapKey!38846 mapValue!38846))))

(declare-fun mapIsEmpty!38846 () Bool)

(assert (=> mapIsEmpty!38846 mapRes!38846))

(declare-fun b!1043326 () Bool)

(declare-fun tp_is_empty!24817 () Bool)

(assert (=> b!1043326 (= e!591143 tp_is_empty!24817)))

(declare-fun b!1043327 () Bool)

(declare-fun e!591139 () Bool)

(declare-datatypes ((SeekEntryResult!9832 0))(
  ( (MissingZero!9832 (index!41699 (_ BitVec 32))) (Found!9832 (index!41700 (_ BitVec 32))) (Intermediate!9832 (undefined!10644 Bool) (index!41701 (_ BitVec 32)) (x!93163 (_ BitVec 32))) (Undefined!9832) (MissingVacant!9832 (index!41702 (_ BitVec 32))) )
))
(declare-fun lt!459774 () SeekEntryResult!9832)

(assert (=> b!1043327 (= e!591139 (not (and (bvsge (index!41700 lt!459774) #b00000000000000000000000000000000) (bvslt (index!41700 lt!459774) (size!32157 (_keys!11638 thiss!1427))))))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun lt!459775 () array!65735)

(declare-datatypes ((tuple2!15812 0))(
  ( (tuple2!15813 (_1!7917 (_ BitVec 64)) (_2!7917 V!37963)) )
))
(declare-datatypes ((List!22028 0))(
  ( (Nil!22025) (Cons!22024 (h!23232 tuple2!15812) (t!31235 List!22028)) )
))
(declare-datatypes ((ListLongMap!13835 0))(
  ( (ListLongMap!13836 (toList!6933 List!22028)) )
))
(declare-fun -!525 (ListLongMap!13835 (_ BitVec 64)) ListLongMap!13835)

(declare-fun getCurrentListMap!3899 (array!65735 array!65737 (_ BitVec 32) (_ BitVec 32) V!37963 V!37963 (_ BitVec 32) Int) ListLongMap!13835)

(declare-fun dynLambda!1986 (Int (_ BitVec 64)) V!37963)

(assert (=> b!1043327 (= (-!525 (getCurrentListMap!3899 (_keys!11638 thiss!1427) (_values!6407 thiss!1427) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)) key!909) (getCurrentListMap!3899 lt!459775 (array!65738 (store (arr!31621 (_values!6407 thiss!1427)) (index!41700 lt!459774) (ValueCellFull!11705 (dynLambda!1986 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32158 (_values!6407 thiss!1427))) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-datatypes ((Unit!33961 0))(
  ( (Unit!33962) )
))
(declare-fun lt!459772 () Unit!33961)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!47 (array!65735 array!65737 (_ BitVec 32) (_ BitVec 32) V!37963 V!37963 (_ BitVec 32) (_ BitVec 64) Int) Unit!33961)

(assert (=> b!1043327 (= lt!459772 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!47 (_keys!11638 thiss!1427) (_values!6407 thiss!1427) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) (index!41700 lt!459774) key!909 (defaultEntry!6384 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043327 (not (arrayContainsKey!0 lt!459775 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!459771 () Unit!33961)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65735 (_ BitVec 32) (_ BitVec 64)) Unit!33961)

(assert (=> b!1043327 (= lt!459771 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11638 thiss!1427) (index!41700 lt!459774) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65735 (_ BitVec 32)) Bool)

(assert (=> b!1043327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459775 (mask!30470 thiss!1427))))

(declare-fun lt!459770 () Unit!33961)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65735 (_ BitVec 32) (_ BitVec 32)) Unit!33961)

(assert (=> b!1043327 (= lt!459770 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11638 thiss!1427) (index!41700 lt!459774) (mask!30470 thiss!1427)))))

(declare-datatypes ((List!22029 0))(
  ( (Nil!22026) (Cons!22025 (h!23233 (_ BitVec 64)) (t!31236 List!22029)) )
))
(declare-fun arrayNoDuplicates!0 (array!65735 (_ BitVec 32) List!22029) Bool)

(assert (=> b!1043327 (arrayNoDuplicates!0 lt!459775 #b00000000000000000000000000000000 Nil!22026)))

(declare-fun lt!459776 () Unit!33961)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65735 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22029) Unit!33961)

(assert (=> b!1043327 (= lt!459776 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11638 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41700 lt!459774) #b00000000000000000000000000000000 Nil!22026))))

(declare-fun arrayCountValidKeys!0 (array!65735 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043327 (= (arrayCountValidKeys!0 lt!459775 #b00000000000000000000000000000000 (size!32157 (_keys!11638 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11638 thiss!1427) #b00000000000000000000000000000000 (size!32157 (_keys!11638 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043327 (= lt!459775 (array!65736 (store (arr!31620 (_keys!11638 thiss!1427)) (index!41700 lt!459774) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32157 (_keys!11638 thiss!1427))))))

(declare-fun lt!459773 () Unit!33961)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65735 (_ BitVec 32) (_ BitVec 64)) Unit!33961)

(assert (=> b!1043327 (= lt!459773 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11638 thiss!1427) (index!41700 lt!459774) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!695120 () Bool)

(declare-fun e!591137 () Bool)

(assert (=> start!91658 (=> (not res!695120) (not e!591137))))

(declare-fun valid!2247 (LongMapFixedSize!6004) Bool)

(assert (=> start!91658 (= res!695120 (valid!2247 thiss!1427))))

(assert (=> start!91658 e!591137))

(declare-fun e!591142 () Bool)

(assert (=> start!91658 e!591142))

(assert (=> start!91658 true))

(declare-fun b!1043328 () Bool)

(declare-fun e!591141 () Bool)

(assert (=> b!1043328 (= e!591141 tp_is_empty!24817)))

(declare-fun e!591138 () Bool)

(declare-fun array_inv!24435 (array!65735) Bool)

(declare-fun array_inv!24436 (array!65737) Bool)

(assert (=> b!1043329 (= e!591142 (and tp!74528 tp_is_empty!24817 (array_inv!24435 (_keys!11638 thiss!1427)) (array_inv!24436 (_values!6407 thiss!1427)) e!591138))))

(declare-fun b!1043330 () Bool)

(declare-fun res!695118 () Bool)

(assert (=> b!1043330 (=> (not res!695118) (not e!591137))))

(assert (=> b!1043330 (= res!695118 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1043331 () Bool)

(assert (=> b!1043331 (= e!591137 e!591139)))

(declare-fun res!695119 () Bool)

(assert (=> b!1043331 (=> (not res!695119) (not e!591139))))

(get-info :version)

(assert (=> b!1043331 (= res!695119 ((_ is Found!9832) lt!459774))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65735 (_ BitVec 32)) SeekEntryResult!9832)

(assert (=> b!1043331 (= lt!459774 (seekEntry!0 key!909 (_keys!11638 thiss!1427) (mask!30470 thiss!1427)))))

(declare-fun b!1043332 () Bool)

(assert (=> b!1043332 (= e!591138 (and e!591141 mapRes!38846))))

(declare-fun condMapEmpty!38846 () Bool)

(declare-fun mapDefault!38846 () ValueCell!11705)

(assert (=> b!1043332 (= condMapEmpty!38846 (= (arr!31621 (_values!6407 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11705)) mapDefault!38846)))))

(assert (= (and start!91658 res!695120) b!1043330))

(assert (= (and b!1043330 res!695118) b!1043331))

(assert (= (and b!1043331 res!695119) b!1043327))

(assert (= (and b!1043332 condMapEmpty!38846) mapIsEmpty!38846))

(assert (= (and b!1043332 (not condMapEmpty!38846)) mapNonEmpty!38846))

(assert (= (and mapNonEmpty!38846 ((_ is ValueCellFull!11705) mapValue!38846)) b!1043326))

(assert (= (and b!1043332 ((_ is ValueCellFull!11705) mapDefault!38846)) b!1043328))

(assert (= b!1043329 b!1043332))

(assert (= start!91658 b!1043329))

(declare-fun b_lambda!16135 () Bool)

(assert (=> (not b_lambda!16135) (not b!1043327)))

(declare-fun t!31234 () Bool)

(declare-fun tb!7029 () Bool)

(assert (=> (and b!1043329 (= (defaultEntry!6384 thiss!1427) (defaultEntry!6384 thiss!1427)) t!31234) tb!7029))

(declare-fun result!14487 () Bool)

(assert (=> tb!7029 (= result!14487 tp_is_empty!24817)))

(assert (=> b!1043327 t!31234))

(declare-fun b_and!33605 () Bool)

(assert (= b_and!33603 (and (=> t!31234 result!14487) b_and!33605)))

(declare-fun m!962079 () Bool)

(assert (=> b!1043327 m!962079))

(declare-fun m!962081 () Bool)

(assert (=> b!1043327 m!962081))

(declare-fun m!962083 () Bool)

(assert (=> b!1043327 m!962083))

(declare-fun m!962085 () Bool)

(assert (=> b!1043327 m!962085))

(declare-fun m!962087 () Bool)

(assert (=> b!1043327 m!962087))

(declare-fun m!962089 () Bool)

(assert (=> b!1043327 m!962089))

(declare-fun m!962091 () Bool)

(assert (=> b!1043327 m!962091))

(declare-fun m!962093 () Bool)

(assert (=> b!1043327 m!962093))

(declare-fun m!962095 () Bool)

(assert (=> b!1043327 m!962095))

(assert (=> b!1043327 m!962093))

(declare-fun m!962097 () Bool)

(assert (=> b!1043327 m!962097))

(declare-fun m!962099 () Bool)

(assert (=> b!1043327 m!962099))

(declare-fun m!962101 () Bool)

(assert (=> b!1043327 m!962101))

(declare-fun m!962103 () Bool)

(assert (=> b!1043327 m!962103))

(declare-fun m!962105 () Bool)

(assert (=> b!1043327 m!962105))

(declare-fun m!962107 () Bool)

(assert (=> b!1043327 m!962107))

(declare-fun m!962109 () Bool)

(assert (=> b!1043327 m!962109))

(declare-fun m!962111 () Bool)

(assert (=> b!1043331 m!962111))

(declare-fun m!962113 () Bool)

(assert (=> b!1043329 m!962113))

(declare-fun m!962115 () Bool)

(assert (=> b!1043329 m!962115))

(declare-fun m!962117 () Bool)

(assert (=> start!91658 m!962117))

(declare-fun m!962119 () Bool)

(assert (=> mapNonEmpty!38846 m!962119))

(check-sat (not b_lambda!16135) (not b!1043329) (not b!1043327) (not b_next!21097) b_and!33605 (not mapNonEmpty!38846) (not start!91658) (not b!1043331) tp_is_empty!24817)
(check-sat b_and!33605 (not b_next!21097))
(get-model)

(declare-fun b_lambda!16141 () Bool)

(assert (= b_lambda!16135 (or (and b!1043329 b_free!21097) b_lambda!16141)))

(check-sat (not b!1043329) (not b!1043327) (not b_next!21097) b_and!33605 (not mapNonEmpty!38846) (not b_lambda!16141) (not start!91658) (not b!1043331) tp_is_empty!24817)
(check-sat b_and!33605 (not b_next!21097))
(get-model)

(declare-fun d!126111 () Bool)

(declare-fun res!695145 () Bool)

(declare-fun e!591188 () Bool)

(assert (=> d!126111 (=> (not res!695145) (not e!591188))))

(declare-fun simpleValid!446 (LongMapFixedSize!6004) Bool)

(assert (=> d!126111 (= res!695145 (simpleValid!446 thiss!1427))))

(assert (=> d!126111 (= (valid!2247 thiss!1427) e!591188)))

(declare-fun b!1043387 () Bool)

(declare-fun res!695146 () Bool)

(assert (=> b!1043387 (=> (not res!695146) (not e!591188))))

(assert (=> b!1043387 (= res!695146 (= (arrayCountValidKeys!0 (_keys!11638 thiss!1427) #b00000000000000000000000000000000 (size!32157 (_keys!11638 thiss!1427))) (_size!3057 thiss!1427)))))

(declare-fun b!1043388 () Bool)

(declare-fun res!695147 () Bool)

(assert (=> b!1043388 (=> (not res!695147) (not e!591188))))

(assert (=> b!1043388 (= res!695147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11638 thiss!1427) (mask!30470 thiss!1427)))))

(declare-fun b!1043389 () Bool)

(assert (=> b!1043389 (= e!591188 (arrayNoDuplicates!0 (_keys!11638 thiss!1427) #b00000000000000000000000000000000 Nil!22026))))

(assert (= (and d!126111 res!695145) b!1043387))

(assert (= (and b!1043387 res!695146) b!1043388))

(assert (= (and b!1043388 res!695147) b!1043389))

(declare-fun m!962205 () Bool)

(assert (=> d!126111 m!962205))

(assert (=> b!1043387 m!962089))

(declare-fun m!962207 () Bool)

(assert (=> b!1043388 m!962207))

(declare-fun m!962209 () Bool)

(assert (=> b!1043389 m!962209))

(assert (=> start!91658 d!126111))

(declare-fun d!126113 () Bool)

(assert (=> d!126113 (= (array_inv!24435 (_keys!11638 thiss!1427)) (bvsge (size!32157 (_keys!11638 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043329 d!126113))

(declare-fun d!126115 () Bool)

(assert (=> d!126115 (= (array_inv!24436 (_values!6407 thiss!1427)) (bvsge (size!32158 (_values!6407 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043329 d!126115))

(declare-fun b!1043402 () Bool)

(declare-fun e!591195 () SeekEntryResult!9832)

(assert (=> b!1043402 (= e!591195 Undefined!9832)))

(declare-fun b!1043403 () Bool)

(declare-fun e!591197 () SeekEntryResult!9832)

(assert (=> b!1043403 (= e!591195 e!591197)))

(declare-fun lt!459830 () (_ BitVec 64))

(declare-fun lt!459828 () SeekEntryResult!9832)

(assert (=> b!1043403 (= lt!459830 (select (arr!31620 (_keys!11638 thiss!1427)) (index!41701 lt!459828)))))

(declare-fun c!105902 () Bool)

(assert (=> b!1043403 (= c!105902 (= lt!459830 key!909))))

(declare-fun b!1043404 () Bool)

(declare-fun e!591196 () SeekEntryResult!9832)

(declare-fun lt!459829 () SeekEntryResult!9832)

(assert (=> b!1043404 (= e!591196 (ite ((_ is MissingVacant!9832) lt!459829) (MissingZero!9832 (index!41702 lt!459829)) lt!459829))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65735 (_ BitVec 32)) SeekEntryResult!9832)

(assert (=> b!1043404 (= lt!459829 (seekKeyOrZeroReturnVacant!0 (x!93163 lt!459828) (index!41701 lt!459828) (index!41701 lt!459828) key!909 (_keys!11638 thiss!1427) (mask!30470 thiss!1427)))))

(declare-fun b!1043405 () Bool)

(assert (=> b!1043405 (= e!591196 (MissingZero!9832 (index!41701 lt!459828)))))

(declare-fun d!126117 () Bool)

(declare-fun lt!459827 () SeekEntryResult!9832)

(assert (=> d!126117 (and (or ((_ is MissingVacant!9832) lt!459827) (not ((_ is Found!9832) lt!459827)) (and (bvsge (index!41700 lt!459827) #b00000000000000000000000000000000) (bvslt (index!41700 lt!459827) (size!32157 (_keys!11638 thiss!1427))))) (not ((_ is MissingVacant!9832) lt!459827)) (or (not ((_ is Found!9832) lt!459827)) (= (select (arr!31620 (_keys!11638 thiss!1427)) (index!41700 lt!459827)) key!909)))))

(assert (=> d!126117 (= lt!459827 e!591195)))

(declare-fun c!105900 () Bool)

(assert (=> d!126117 (= c!105900 (and ((_ is Intermediate!9832) lt!459828) (undefined!10644 lt!459828)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65735 (_ BitVec 32)) SeekEntryResult!9832)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126117 (= lt!459828 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30470 thiss!1427)) key!909 (_keys!11638 thiss!1427) (mask!30470 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!126117 (validMask!0 (mask!30470 thiss!1427))))

(assert (=> d!126117 (= (seekEntry!0 key!909 (_keys!11638 thiss!1427) (mask!30470 thiss!1427)) lt!459827)))

(declare-fun b!1043406 () Bool)

(assert (=> b!1043406 (= e!591197 (Found!9832 (index!41701 lt!459828)))))

(declare-fun b!1043407 () Bool)

(declare-fun c!105901 () Bool)

(assert (=> b!1043407 (= c!105901 (= lt!459830 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1043407 (= e!591197 e!591196)))

(assert (= (and d!126117 c!105900) b!1043402))

(assert (= (and d!126117 (not c!105900)) b!1043403))

(assert (= (and b!1043403 c!105902) b!1043406))

(assert (= (and b!1043403 (not c!105902)) b!1043407))

(assert (= (and b!1043407 c!105901) b!1043405))

(assert (= (and b!1043407 (not c!105901)) b!1043404))

(declare-fun m!962211 () Bool)

(assert (=> b!1043403 m!962211))

(declare-fun m!962213 () Bool)

(assert (=> b!1043404 m!962213))

(declare-fun m!962215 () Bool)

(assert (=> d!126117 m!962215))

(declare-fun m!962217 () Bool)

(assert (=> d!126117 m!962217))

(assert (=> d!126117 m!962217))

(declare-fun m!962219 () Bool)

(assert (=> d!126117 m!962219))

(declare-fun m!962221 () Bool)

(assert (=> d!126117 m!962221))

(assert (=> b!1043331 d!126117))

(declare-fun d!126119 () Bool)

(declare-fun e!591200 () Bool)

(assert (=> d!126119 e!591200))

(declare-fun res!695150 () Bool)

(assert (=> d!126119 (=> (not res!695150) (not e!591200))))

(assert (=> d!126119 (= res!695150 (bvslt (index!41700 lt!459774) (size!32157 (_keys!11638 thiss!1427))))))

(declare-fun lt!459833 () Unit!33961)

(declare-fun choose!121 (array!65735 (_ BitVec 32) (_ BitVec 64)) Unit!33961)

(assert (=> d!126119 (= lt!459833 (choose!121 (_keys!11638 thiss!1427) (index!41700 lt!459774) key!909))))

(assert (=> d!126119 (bvsge (index!41700 lt!459774) #b00000000000000000000000000000000)))

(assert (=> d!126119 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11638 thiss!1427) (index!41700 lt!459774) key!909) lt!459833)))

(declare-fun b!1043410 () Bool)

(assert (=> b!1043410 (= e!591200 (not (arrayContainsKey!0 (array!65736 (store (arr!31620 (_keys!11638 thiss!1427)) (index!41700 lt!459774) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32157 (_keys!11638 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126119 res!695150) b!1043410))

(declare-fun m!962223 () Bool)

(assert (=> d!126119 m!962223))

(assert (=> b!1043410 m!962083))

(declare-fun m!962225 () Bool)

(assert (=> b!1043410 m!962225))

(assert (=> b!1043327 d!126119))

(declare-fun d!126121 () Bool)

(declare-fun e!591203 () Bool)

(assert (=> d!126121 e!591203))

(declare-fun res!695153 () Bool)

(assert (=> d!126121 (=> (not res!695153) (not e!591203))))

(assert (=> d!126121 (= res!695153 (and (bvsge (index!41700 lt!459774) #b00000000000000000000000000000000) (bvslt (index!41700 lt!459774) (size!32157 (_keys!11638 thiss!1427)))))))

(declare-fun lt!459836 () Unit!33961)

(declare-fun choose!1715 (array!65735 array!65737 (_ BitVec 32) (_ BitVec 32) V!37963 V!37963 (_ BitVec 32) (_ BitVec 64) Int) Unit!33961)

(assert (=> d!126121 (= lt!459836 (choose!1715 (_keys!11638 thiss!1427) (_values!6407 thiss!1427) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) (index!41700 lt!459774) key!909 (defaultEntry!6384 thiss!1427)))))

(assert (=> d!126121 (validMask!0 (mask!30470 thiss!1427))))

(assert (=> d!126121 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!47 (_keys!11638 thiss!1427) (_values!6407 thiss!1427) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) (index!41700 lt!459774) key!909 (defaultEntry!6384 thiss!1427)) lt!459836)))

(declare-fun b!1043413 () Bool)

(assert (=> b!1043413 (= e!591203 (= (-!525 (getCurrentListMap!3899 (_keys!11638 thiss!1427) (_values!6407 thiss!1427) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)) key!909) (getCurrentListMap!3899 (array!65736 (store (arr!31620 (_keys!11638 thiss!1427)) (index!41700 lt!459774) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32157 (_keys!11638 thiss!1427))) (array!65738 (store (arr!31621 (_values!6407 thiss!1427)) (index!41700 lt!459774) (ValueCellFull!11705 (dynLambda!1986 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32158 (_values!6407 thiss!1427))) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427))))))

(assert (=> b!1043413 (bvslt (index!41700 lt!459774) (size!32158 (_values!6407 thiss!1427)))))

(assert (= (and d!126121 res!695153) b!1043413))

(declare-fun b_lambda!16143 () Bool)

(assert (=> (not b_lambda!16143) (not b!1043413)))

(assert (=> b!1043413 t!31234))

(declare-fun b_and!33615 () Bool)

(assert (= b_and!33605 (and (=> t!31234 result!14487) b_and!33615)))

(declare-fun m!962227 () Bool)

(assert (=> d!126121 m!962227))

(assert (=> d!126121 m!962221))

(declare-fun m!962229 () Bool)

(assert (=> b!1043413 m!962229))

(assert (=> b!1043413 m!962093))

(assert (=> b!1043413 m!962101))

(assert (=> b!1043413 m!962093))

(assert (=> b!1043413 m!962095))

(assert (=> b!1043413 m!962091))

(assert (=> b!1043413 m!962083))

(assert (=> b!1043327 d!126121))

(declare-fun b!1043424 () Bool)

(declare-fun e!591213 () Bool)

(declare-fun call!44202 () Bool)

(assert (=> b!1043424 (= e!591213 call!44202)))

(declare-fun b!1043425 () Bool)

(declare-fun e!591212 () Bool)

(assert (=> b!1043425 (= e!591212 e!591213)))

(declare-fun c!105905 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1043425 (= c!105905 (validKeyInArray!0 (select (arr!31620 lt!459775) #b00000000000000000000000000000000)))))

(declare-fun bm!44199 () Bool)

(assert (=> bm!44199 (= call!44202 (arrayNoDuplicates!0 lt!459775 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105905 (Cons!22025 (select (arr!31620 lt!459775) #b00000000000000000000000000000000) Nil!22026) Nil!22026)))))

(declare-fun b!1043426 () Bool)

(declare-fun e!591214 () Bool)

(assert (=> b!1043426 (= e!591214 e!591212)))

(declare-fun res!695160 () Bool)

(assert (=> b!1043426 (=> (not res!695160) (not e!591212))))

(declare-fun e!591215 () Bool)

(assert (=> b!1043426 (= res!695160 (not e!591215))))

(declare-fun res!695161 () Bool)

(assert (=> b!1043426 (=> (not res!695161) (not e!591215))))

(assert (=> b!1043426 (= res!695161 (validKeyInArray!0 (select (arr!31620 lt!459775) #b00000000000000000000000000000000)))))

(declare-fun d!126123 () Bool)

(declare-fun res!695162 () Bool)

(assert (=> d!126123 (=> res!695162 e!591214)))

(assert (=> d!126123 (= res!695162 (bvsge #b00000000000000000000000000000000 (size!32157 lt!459775)))))

(assert (=> d!126123 (= (arrayNoDuplicates!0 lt!459775 #b00000000000000000000000000000000 Nil!22026) e!591214)))

(declare-fun b!1043427 () Bool)

(assert (=> b!1043427 (= e!591213 call!44202)))

(declare-fun b!1043428 () Bool)

(declare-fun contains!6042 (List!22029 (_ BitVec 64)) Bool)

(assert (=> b!1043428 (= e!591215 (contains!6042 Nil!22026 (select (arr!31620 lt!459775) #b00000000000000000000000000000000)))))

(assert (= (and d!126123 (not res!695162)) b!1043426))

(assert (= (and b!1043426 res!695161) b!1043428))

(assert (= (and b!1043426 res!695160) b!1043425))

(assert (= (and b!1043425 c!105905) b!1043424))

(assert (= (and b!1043425 (not c!105905)) b!1043427))

(assert (= (or b!1043424 b!1043427) bm!44199))

(declare-fun m!962231 () Bool)

(assert (=> b!1043425 m!962231))

(assert (=> b!1043425 m!962231))

(declare-fun m!962233 () Bool)

(assert (=> b!1043425 m!962233))

(assert (=> bm!44199 m!962231))

(declare-fun m!962235 () Bool)

(assert (=> bm!44199 m!962235))

(assert (=> b!1043426 m!962231))

(assert (=> b!1043426 m!962231))

(assert (=> b!1043426 m!962233))

(assert (=> b!1043428 m!962231))

(assert (=> b!1043428 m!962231))

(declare-fun m!962237 () Bool)

(assert (=> b!1043428 m!962237))

(assert (=> b!1043327 d!126123))

(declare-fun d!126125 () Bool)

(declare-fun lt!459839 () (_ BitVec 32))

(assert (=> d!126125 (and (bvsge lt!459839 #b00000000000000000000000000000000) (bvsle lt!459839 (bvsub (size!32157 lt!459775) #b00000000000000000000000000000000)))))

(declare-fun e!591221 () (_ BitVec 32))

(assert (=> d!126125 (= lt!459839 e!591221)))

(declare-fun c!105911 () Bool)

(assert (=> d!126125 (= c!105911 (bvsge #b00000000000000000000000000000000 (size!32157 (_keys!11638 thiss!1427))))))

(assert (=> d!126125 (and (bvsle #b00000000000000000000000000000000 (size!32157 (_keys!11638 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32157 (_keys!11638 thiss!1427)) (size!32157 lt!459775)))))

(assert (=> d!126125 (= (arrayCountValidKeys!0 lt!459775 #b00000000000000000000000000000000 (size!32157 (_keys!11638 thiss!1427))) lt!459839)))

(declare-fun b!1043437 () Bool)

(assert (=> b!1043437 (= e!591221 #b00000000000000000000000000000000)))

(declare-fun b!1043438 () Bool)

(declare-fun e!591220 () (_ BitVec 32))

(assert (=> b!1043438 (= e!591221 e!591220)))

(declare-fun c!105910 () Bool)

(assert (=> b!1043438 (= c!105910 (validKeyInArray!0 (select (arr!31620 lt!459775) #b00000000000000000000000000000000)))))

(declare-fun b!1043439 () Bool)

(declare-fun call!44205 () (_ BitVec 32))

(assert (=> b!1043439 (= e!591220 call!44205)))

(declare-fun bm!44202 () Bool)

(assert (=> bm!44202 (= call!44205 (arrayCountValidKeys!0 lt!459775 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32157 (_keys!11638 thiss!1427))))))

(declare-fun b!1043440 () Bool)

(assert (=> b!1043440 (= e!591220 (bvadd #b00000000000000000000000000000001 call!44205))))

(assert (= (and d!126125 c!105911) b!1043437))

(assert (= (and d!126125 (not c!105911)) b!1043438))

(assert (= (and b!1043438 c!105910) b!1043440))

(assert (= (and b!1043438 (not c!105910)) b!1043439))

(assert (= (or b!1043440 b!1043439) bm!44202))

(assert (=> b!1043438 m!962231))

(assert (=> b!1043438 m!962231))

(assert (=> b!1043438 m!962233))

(declare-fun m!962239 () Bool)

(assert (=> bm!44202 m!962239))

(assert (=> b!1043327 d!126125))

(declare-fun b!1043483 () Bool)

(declare-fun res!695182 () Bool)

(declare-fun e!591248 () Bool)

(assert (=> b!1043483 (=> (not res!695182) (not e!591248))))

(declare-fun e!591254 () Bool)

(assert (=> b!1043483 (= res!695182 e!591254)))

(declare-fun c!105924 () Bool)

(assert (=> b!1043483 (= c!105924 (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1043484 () Bool)

(declare-fun e!591258 () Unit!33961)

(declare-fun Unit!33965 () Unit!33961)

(assert (=> b!1043484 (= e!591258 Unit!33965)))

(declare-fun b!1043485 () Bool)

(declare-fun e!591256 () ListLongMap!13835)

(declare-fun call!44226 () ListLongMap!13835)

(assert (=> b!1043485 (= e!591256 call!44226)))

(declare-fun b!1043486 () Bool)

(declare-fun e!591257 () Bool)

(assert (=> b!1043486 (= e!591257 (validKeyInArray!0 (select (arr!31620 (_keys!11638 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043487 () Bool)

(declare-fun c!105926 () Bool)

(assert (=> b!1043487 (= c!105926 (and (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!591252 () ListLongMap!13835)

(assert (=> b!1043487 (= e!591256 e!591252)))

(declare-fun bm!44217 () Bool)

(declare-fun call!44223 () ListLongMap!13835)

(declare-fun call!44222 () ListLongMap!13835)

(assert (=> bm!44217 (= call!44223 call!44222)))

(declare-fun b!1043488 () Bool)

(declare-fun e!591259 () ListLongMap!13835)

(declare-fun call!44224 () ListLongMap!13835)

(declare-fun +!3132 (ListLongMap!13835 tuple2!15812) ListLongMap!13835)

(assert (=> b!1043488 (= e!591259 (+!3132 call!44224 (tuple2!15813 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6218 thiss!1427))))))

(declare-fun b!1043489 () Bool)

(declare-fun res!695189 () Bool)

(assert (=> b!1043489 (=> (not res!695189) (not e!591248))))

(declare-fun e!591251 () Bool)

(assert (=> b!1043489 (= res!695189 e!591251)))

(declare-fun res!695181 () Bool)

(assert (=> b!1043489 (=> res!695181 e!591251)))

(assert (=> b!1043489 (= res!695181 (not e!591257))))

(declare-fun res!695186 () Bool)

(assert (=> b!1043489 (=> (not res!695186) (not e!591257))))

(assert (=> b!1043489 (= res!695186 (bvslt #b00000000000000000000000000000000 (size!32157 (_keys!11638 thiss!1427))))))

(declare-fun bm!44218 () Bool)

(assert (=> bm!44218 (= call!44226 call!44224)))

(declare-fun b!1043490 () Bool)

(declare-fun e!591253 () Bool)

(declare-fun lt!459893 () ListLongMap!13835)

(declare-fun apply!901 (ListLongMap!13835 (_ BitVec 64)) V!37963)

(declare-fun get!16536 (ValueCell!11705 V!37963) V!37963)

(assert (=> b!1043490 (= e!591253 (= (apply!901 lt!459893 (select (arr!31620 (_keys!11638 thiss!1427)) #b00000000000000000000000000000000)) (get!16536 (select (arr!31621 (_values!6407 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1986 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1043490 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32158 (_values!6407 thiss!1427))))))

(assert (=> b!1043490 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32157 (_keys!11638 thiss!1427))))))

(declare-fun bm!44220 () Bool)

(declare-fun call!44221 () ListLongMap!13835)

(declare-fun getCurrentListMapNoExtraKeys!3567 (array!65735 array!65737 (_ BitVec 32) (_ BitVec 32) V!37963 V!37963 (_ BitVec 32) Int) ListLongMap!13835)

(assert (=> bm!44220 (= call!44221 (getCurrentListMapNoExtraKeys!3567 (_keys!11638 thiss!1427) (_values!6407 thiss!1427) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun bm!44221 () Bool)

(assert (=> bm!44221 (= call!44222 call!44221)))

(declare-fun b!1043491 () Bool)

(assert (=> b!1043491 (= e!591252 call!44226)))

(declare-fun b!1043492 () Bool)

(declare-fun e!591249 () Bool)

(assert (=> b!1043492 (= e!591248 e!591249)))

(declare-fun c!105929 () Bool)

(assert (=> b!1043492 (= c!105929 (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1043493 () Bool)

(assert (=> b!1043493 (= e!591252 call!44223)))

(declare-fun b!1043494 () Bool)

(declare-fun call!44225 () Bool)

(assert (=> b!1043494 (= e!591254 (not call!44225))))

(declare-fun b!1043495 () Bool)

(declare-fun e!591260 () Bool)

(assert (=> b!1043495 (= e!591249 e!591260)))

(declare-fun res!695184 () Bool)

(declare-fun call!44220 () Bool)

(assert (=> b!1043495 (= res!695184 call!44220)))

(assert (=> b!1043495 (=> (not res!695184) (not e!591260))))

(declare-fun b!1043496 () Bool)

(assert (=> b!1043496 (= e!591251 e!591253)))

(declare-fun res!695187 () Bool)

(assert (=> b!1043496 (=> (not res!695187) (not e!591253))))

(declare-fun contains!6043 (ListLongMap!13835 (_ BitVec 64)) Bool)

(assert (=> b!1043496 (= res!695187 (contains!6043 lt!459893 (select (arr!31620 (_keys!11638 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1043496 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32157 (_keys!11638 thiss!1427))))))

(declare-fun b!1043497 () Bool)

(assert (=> b!1043497 (= e!591260 (= (apply!901 lt!459893 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6218 thiss!1427)))))

(declare-fun b!1043498 () Bool)

(assert (=> b!1043498 (= e!591249 (not call!44220))))

(declare-fun b!1043499 () Bool)

(declare-fun e!591255 () Bool)

(assert (=> b!1043499 (= e!591255 (validKeyInArray!0 (select (arr!31620 (_keys!11638 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun c!105925 () Bool)

(declare-fun c!105928 () Bool)

(declare-fun bm!44219 () Bool)

(assert (=> bm!44219 (= call!44224 (+!3132 (ite c!105928 call!44221 (ite c!105925 call!44222 call!44223)) (ite (or c!105928 c!105925) (tuple2!15813 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6218 thiss!1427)) (tuple2!15813 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6218 thiss!1427)))))))

(declare-fun d!126127 () Bool)

(assert (=> d!126127 e!591248))

(declare-fun res!695183 () Bool)

(assert (=> d!126127 (=> (not res!695183) (not e!591248))))

(assert (=> d!126127 (= res!695183 (or (bvsge #b00000000000000000000000000000000 (size!32157 (_keys!11638 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32157 (_keys!11638 thiss!1427))))))))

(declare-fun lt!459895 () ListLongMap!13835)

(assert (=> d!126127 (= lt!459893 lt!459895)))

(declare-fun lt!459900 () Unit!33961)

(assert (=> d!126127 (= lt!459900 e!591258)))

(declare-fun c!105927 () Bool)

(assert (=> d!126127 (= c!105927 e!591255)))

(declare-fun res!695188 () Bool)

(assert (=> d!126127 (=> (not res!695188) (not e!591255))))

(assert (=> d!126127 (= res!695188 (bvslt #b00000000000000000000000000000000 (size!32157 (_keys!11638 thiss!1427))))))

(assert (=> d!126127 (= lt!459895 e!591259)))

(assert (=> d!126127 (= c!105928 (and (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126127 (validMask!0 (mask!30470 thiss!1427))))

(assert (=> d!126127 (= (getCurrentListMap!3899 (_keys!11638 thiss!1427) (_values!6407 thiss!1427) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)) lt!459893)))

(declare-fun bm!44222 () Bool)

(assert (=> bm!44222 (= call!44225 (contains!6043 lt!459893 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043500 () Bool)

(declare-fun lt!459892 () Unit!33961)

(assert (=> b!1043500 (= e!591258 lt!459892)))

(declare-fun lt!459901 () ListLongMap!13835)

(assert (=> b!1043500 (= lt!459901 (getCurrentListMapNoExtraKeys!3567 (_keys!11638 thiss!1427) (_values!6407 thiss!1427) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun lt!459886 () (_ BitVec 64))

(assert (=> b!1043500 (= lt!459886 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!459888 () (_ BitVec 64))

(assert (=> b!1043500 (= lt!459888 (select (arr!31620 (_keys!11638 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459898 () Unit!33961)

(declare-fun addStillContains!620 (ListLongMap!13835 (_ BitVec 64) V!37963 (_ BitVec 64)) Unit!33961)

(assert (=> b!1043500 (= lt!459898 (addStillContains!620 lt!459901 lt!459886 (zeroValue!6218 thiss!1427) lt!459888))))

(assert (=> b!1043500 (contains!6043 (+!3132 lt!459901 (tuple2!15813 lt!459886 (zeroValue!6218 thiss!1427))) lt!459888)))

(declare-fun lt!459887 () Unit!33961)

(assert (=> b!1043500 (= lt!459887 lt!459898)))

(declare-fun lt!459899 () ListLongMap!13835)

(assert (=> b!1043500 (= lt!459899 (getCurrentListMapNoExtraKeys!3567 (_keys!11638 thiss!1427) (_values!6407 thiss!1427) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun lt!459884 () (_ BitVec 64))

(assert (=> b!1043500 (= lt!459884 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!459897 () (_ BitVec 64))

(assert (=> b!1043500 (= lt!459897 (select (arr!31620 (_keys!11638 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459896 () Unit!33961)

(declare-fun addApplyDifferent!476 (ListLongMap!13835 (_ BitVec 64) V!37963 (_ BitVec 64)) Unit!33961)

(assert (=> b!1043500 (= lt!459896 (addApplyDifferent!476 lt!459899 lt!459884 (minValue!6218 thiss!1427) lt!459897))))

(assert (=> b!1043500 (= (apply!901 (+!3132 lt!459899 (tuple2!15813 lt!459884 (minValue!6218 thiss!1427))) lt!459897) (apply!901 lt!459899 lt!459897))))

(declare-fun lt!459902 () Unit!33961)

(assert (=> b!1043500 (= lt!459902 lt!459896)))

(declare-fun lt!459904 () ListLongMap!13835)

(assert (=> b!1043500 (= lt!459904 (getCurrentListMapNoExtraKeys!3567 (_keys!11638 thiss!1427) (_values!6407 thiss!1427) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun lt!459885 () (_ BitVec 64))

(assert (=> b!1043500 (= lt!459885 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!459891 () (_ BitVec 64))

(assert (=> b!1043500 (= lt!459891 (select (arr!31620 (_keys!11638 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459903 () Unit!33961)

(assert (=> b!1043500 (= lt!459903 (addApplyDifferent!476 lt!459904 lt!459885 (zeroValue!6218 thiss!1427) lt!459891))))

(assert (=> b!1043500 (= (apply!901 (+!3132 lt!459904 (tuple2!15813 lt!459885 (zeroValue!6218 thiss!1427))) lt!459891) (apply!901 lt!459904 lt!459891))))

(declare-fun lt!459889 () Unit!33961)

(assert (=> b!1043500 (= lt!459889 lt!459903)))

(declare-fun lt!459905 () ListLongMap!13835)

(assert (=> b!1043500 (= lt!459905 (getCurrentListMapNoExtraKeys!3567 (_keys!11638 thiss!1427) (_values!6407 thiss!1427) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun lt!459894 () (_ BitVec 64))

(assert (=> b!1043500 (= lt!459894 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!459890 () (_ BitVec 64))

(assert (=> b!1043500 (= lt!459890 (select (arr!31620 (_keys!11638 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043500 (= lt!459892 (addApplyDifferent!476 lt!459905 lt!459894 (minValue!6218 thiss!1427) lt!459890))))

(assert (=> b!1043500 (= (apply!901 (+!3132 lt!459905 (tuple2!15813 lt!459894 (minValue!6218 thiss!1427))) lt!459890) (apply!901 lt!459905 lt!459890))))

(declare-fun bm!44223 () Bool)

(assert (=> bm!44223 (= call!44220 (contains!6043 lt!459893 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043501 () Bool)

(declare-fun e!591250 () Bool)

(assert (=> b!1043501 (= e!591250 (= (apply!901 lt!459893 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6218 thiss!1427)))))

(declare-fun b!1043502 () Bool)

(assert (=> b!1043502 (= e!591254 e!591250)))

(declare-fun res!695185 () Bool)

(assert (=> b!1043502 (= res!695185 call!44225)))

(assert (=> b!1043502 (=> (not res!695185) (not e!591250))))

(declare-fun b!1043503 () Bool)

(assert (=> b!1043503 (= e!591259 e!591256)))

(assert (=> b!1043503 (= c!105925 (and (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!126127 c!105928) b!1043488))

(assert (= (and d!126127 (not c!105928)) b!1043503))

(assert (= (and b!1043503 c!105925) b!1043485))

(assert (= (and b!1043503 (not c!105925)) b!1043487))

(assert (= (and b!1043487 c!105926) b!1043491))

(assert (= (and b!1043487 (not c!105926)) b!1043493))

(assert (= (or b!1043491 b!1043493) bm!44217))

(assert (= (or b!1043485 bm!44217) bm!44221))

(assert (= (or b!1043485 b!1043491) bm!44218))

(assert (= (or b!1043488 bm!44221) bm!44220))

(assert (= (or b!1043488 bm!44218) bm!44219))

(assert (= (and d!126127 res!695188) b!1043499))

(assert (= (and d!126127 c!105927) b!1043500))

(assert (= (and d!126127 (not c!105927)) b!1043484))

(assert (= (and d!126127 res!695183) b!1043489))

(assert (= (and b!1043489 res!695186) b!1043486))

(assert (= (and b!1043489 (not res!695181)) b!1043496))

(assert (= (and b!1043496 res!695187) b!1043490))

(assert (= (and b!1043489 res!695189) b!1043483))

(assert (= (and b!1043483 c!105924) b!1043502))

(assert (= (and b!1043483 (not c!105924)) b!1043494))

(assert (= (and b!1043502 res!695185) b!1043501))

(assert (= (or b!1043502 b!1043494) bm!44222))

(assert (= (and b!1043483 res!695182) b!1043492))

(assert (= (and b!1043492 c!105929) b!1043495))

(assert (= (and b!1043492 (not c!105929)) b!1043498))

(assert (= (and b!1043495 res!695184) b!1043497))

(assert (= (or b!1043495 b!1043498) bm!44223))

(declare-fun b_lambda!16145 () Bool)

(assert (=> (not b_lambda!16145) (not b!1043490)))

(assert (=> b!1043490 t!31234))

(declare-fun b_and!33617 () Bool)

(assert (= b_and!33615 (and (=> t!31234 result!14487) b_and!33617)))

(declare-fun m!962241 () Bool)

(assert (=> bm!44220 m!962241))

(declare-fun m!962243 () Bool)

(assert (=> bm!44223 m!962243))

(declare-fun m!962245 () Bool)

(assert (=> b!1043499 m!962245))

(assert (=> b!1043499 m!962245))

(declare-fun m!962247 () Bool)

(assert (=> b!1043499 m!962247))

(declare-fun m!962249 () Bool)

(assert (=> b!1043497 m!962249))

(declare-fun m!962251 () Bool)

(assert (=> b!1043488 m!962251))

(assert (=> b!1043496 m!962245))

(assert (=> b!1043496 m!962245))

(declare-fun m!962253 () Bool)

(assert (=> b!1043496 m!962253))

(declare-fun m!962255 () Bool)

(assert (=> bm!44222 m!962255))

(assert (=> b!1043500 m!962241))

(declare-fun m!962257 () Bool)

(assert (=> b!1043500 m!962257))

(declare-fun m!962259 () Bool)

(assert (=> b!1043500 m!962259))

(declare-fun m!962261 () Bool)

(assert (=> b!1043500 m!962261))

(declare-fun m!962263 () Bool)

(assert (=> b!1043500 m!962263))

(declare-fun m!962265 () Bool)

(assert (=> b!1043500 m!962265))

(declare-fun m!962267 () Bool)

(assert (=> b!1043500 m!962267))

(assert (=> b!1043500 m!962263))

(declare-fun m!962269 () Bool)

(assert (=> b!1043500 m!962269))

(assert (=> b!1043500 m!962257))

(declare-fun m!962271 () Bool)

(assert (=> b!1043500 m!962271))

(declare-fun m!962273 () Bool)

(assert (=> b!1043500 m!962273))

(declare-fun m!962275 () Bool)

(assert (=> b!1043500 m!962275))

(declare-fun m!962277 () Bool)

(assert (=> b!1043500 m!962277))

(assert (=> b!1043500 m!962245))

(declare-fun m!962279 () Bool)

(assert (=> b!1043500 m!962279))

(declare-fun m!962281 () Bool)

(assert (=> b!1043500 m!962281))

(declare-fun m!962283 () Bool)

(assert (=> b!1043500 m!962283))

(assert (=> b!1043500 m!962265))

(assert (=> b!1043500 m!962283))

(declare-fun m!962285 () Bool)

(assert (=> b!1043500 m!962285))

(declare-fun m!962287 () Bool)

(assert (=> bm!44219 m!962287))

(assert (=> b!1043486 m!962245))

(assert (=> b!1043486 m!962245))

(assert (=> b!1043486 m!962247))

(declare-fun m!962289 () Bool)

(assert (=> b!1043501 m!962289))

(declare-fun m!962291 () Bool)

(assert (=> b!1043490 m!962291))

(assert (=> b!1043490 m!962101))

(declare-fun m!962293 () Bool)

(assert (=> b!1043490 m!962293))

(assert (=> b!1043490 m!962245))

(declare-fun m!962295 () Bool)

(assert (=> b!1043490 m!962295))

(assert (=> b!1043490 m!962101))

(assert (=> b!1043490 m!962245))

(assert (=> b!1043490 m!962291))

(assert (=> d!126127 m!962221))

(assert (=> b!1043327 d!126127))

(declare-fun d!126129 () Bool)

(declare-fun res!695194 () Bool)

(declare-fun e!591265 () Bool)

(assert (=> d!126129 (=> res!695194 e!591265)))

(assert (=> d!126129 (= res!695194 (= (select (arr!31620 lt!459775) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126129 (= (arrayContainsKey!0 lt!459775 key!909 #b00000000000000000000000000000000) e!591265)))

(declare-fun b!1043508 () Bool)

(declare-fun e!591266 () Bool)

(assert (=> b!1043508 (= e!591265 e!591266)))

(declare-fun res!695195 () Bool)

(assert (=> b!1043508 (=> (not res!695195) (not e!591266))))

(assert (=> b!1043508 (= res!695195 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32157 lt!459775)))))

(declare-fun b!1043509 () Bool)

(assert (=> b!1043509 (= e!591266 (arrayContainsKey!0 lt!459775 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126129 (not res!695194)) b!1043508))

(assert (= (and b!1043508 res!695195) b!1043509))

(assert (=> d!126129 m!962231))

(declare-fun m!962297 () Bool)

(assert (=> b!1043509 m!962297))

(assert (=> b!1043327 d!126129))

(declare-fun d!126131 () Bool)

(declare-fun lt!459908 () ListLongMap!13835)

(assert (=> d!126131 (not (contains!6043 lt!459908 key!909))))

(declare-fun removeStrictlySorted!58 (List!22028 (_ BitVec 64)) List!22028)

(assert (=> d!126131 (= lt!459908 (ListLongMap!13836 (removeStrictlySorted!58 (toList!6933 (getCurrentListMap!3899 (_keys!11638 thiss!1427) (_values!6407 thiss!1427) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427))) key!909)))))

(assert (=> d!126131 (= (-!525 (getCurrentListMap!3899 (_keys!11638 thiss!1427) (_values!6407 thiss!1427) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)) key!909) lt!459908)))

(declare-fun bs!30474 () Bool)

(assert (= bs!30474 d!126131))

(declare-fun m!962299 () Bool)

(assert (=> bs!30474 m!962299))

(declare-fun m!962301 () Bool)

(assert (=> bs!30474 m!962301))

(assert (=> b!1043327 d!126131))

(declare-fun d!126133 () Bool)

(declare-fun e!591269 () Bool)

(assert (=> d!126133 e!591269))

(declare-fun res!695198 () Bool)

(assert (=> d!126133 (=> (not res!695198) (not e!591269))))

(assert (=> d!126133 (= res!695198 (and (bvsge (index!41700 lt!459774) #b00000000000000000000000000000000) (bvslt (index!41700 lt!459774) (size!32157 (_keys!11638 thiss!1427)))))))

(declare-fun lt!459911 () Unit!33961)

(declare-fun choose!53 (array!65735 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22029) Unit!33961)

(assert (=> d!126133 (= lt!459911 (choose!53 (_keys!11638 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41700 lt!459774) #b00000000000000000000000000000000 Nil!22026))))

(assert (=> d!126133 (bvslt (size!32157 (_keys!11638 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126133 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11638 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41700 lt!459774) #b00000000000000000000000000000000 Nil!22026) lt!459911)))

(declare-fun b!1043512 () Bool)

(assert (=> b!1043512 (= e!591269 (arrayNoDuplicates!0 (array!65736 (store (arr!31620 (_keys!11638 thiss!1427)) (index!41700 lt!459774) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32157 (_keys!11638 thiss!1427))) #b00000000000000000000000000000000 Nil!22026))))

(assert (= (and d!126133 res!695198) b!1043512))

(declare-fun m!962303 () Bool)

(assert (=> d!126133 m!962303))

(assert (=> b!1043512 m!962083))

(declare-fun m!962305 () Bool)

(assert (=> b!1043512 m!962305))

(assert (=> b!1043327 d!126133))

(declare-fun d!126135 () Bool)

(declare-fun e!591272 () Bool)

(assert (=> d!126135 e!591272))

(declare-fun res!695201 () Bool)

(assert (=> d!126135 (=> (not res!695201) (not e!591272))))

(assert (=> d!126135 (= res!695201 (and (bvsge (index!41700 lt!459774) #b00000000000000000000000000000000) (bvslt (index!41700 lt!459774) (size!32157 (_keys!11638 thiss!1427)))))))

(declare-fun lt!459914 () Unit!33961)

(declare-fun choose!25 (array!65735 (_ BitVec 32) (_ BitVec 32)) Unit!33961)

(assert (=> d!126135 (= lt!459914 (choose!25 (_keys!11638 thiss!1427) (index!41700 lt!459774) (mask!30470 thiss!1427)))))

(assert (=> d!126135 (validMask!0 (mask!30470 thiss!1427))))

(assert (=> d!126135 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11638 thiss!1427) (index!41700 lt!459774) (mask!30470 thiss!1427)) lt!459914)))

(declare-fun b!1043515 () Bool)

(assert (=> b!1043515 (= e!591272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65736 (store (arr!31620 (_keys!11638 thiss!1427)) (index!41700 lt!459774) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32157 (_keys!11638 thiss!1427))) (mask!30470 thiss!1427)))))

(assert (= (and d!126135 res!695201) b!1043515))

(declare-fun m!962307 () Bool)

(assert (=> d!126135 m!962307))

(assert (=> d!126135 m!962221))

(assert (=> b!1043515 m!962083))

(declare-fun m!962309 () Bool)

(assert (=> b!1043515 m!962309))

(assert (=> b!1043327 d!126135))

(declare-fun b!1043516 () Bool)

(declare-fun res!695203 () Bool)

(declare-fun e!591273 () Bool)

(assert (=> b!1043516 (=> (not res!695203) (not e!591273))))

(declare-fun e!591279 () Bool)

(assert (=> b!1043516 (= res!695203 e!591279)))

(declare-fun c!105930 () Bool)

(assert (=> b!1043516 (= c!105930 (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1043517 () Bool)

(declare-fun e!591283 () Unit!33961)

(declare-fun Unit!33966 () Unit!33961)

(assert (=> b!1043517 (= e!591283 Unit!33966)))

(declare-fun b!1043518 () Bool)

(declare-fun e!591281 () ListLongMap!13835)

(declare-fun call!44233 () ListLongMap!13835)

(assert (=> b!1043518 (= e!591281 call!44233)))

(declare-fun b!1043519 () Bool)

(declare-fun e!591282 () Bool)

(assert (=> b!1043519 (= e!591282 (validKeyInArray!0 (select (arr!31620 lt!459775) #b00000000000000000000000000000000)))))

(declare-fun b!1043520 () Bool)

(declare-fun c!105932 () Bool)

(assert (=> b!1043520 (= c!105932 (and (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!591277 () ListLongMap!13835)

(assert (=> b!1043520 (= e!591281 e!591277)))

(declare-fun bm!44224 () Bool)

(declare-fun call!44230 () ListLongMap!13835)

(declare-fun call!44229 () ListLongMap!13835)

(assert (=> bm!44224 (= call!44230 call!44229)))

(declare-fun b!1043521 () Bool)

(declare-fun e!591284 () ListLongMap!13835)

(declare-fun call!44231 () ListLongMap!13835)

(assert (=> b!1043521 (= e!591284 (+!3132 call!44231 (tuple2!15813 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6218 thiss!1427))))))

(declare-fun b!1043522 () Bool)

(declare-fun res!695210 () Bool)

(assert (=> b!1043522 (=> (not res!695210) (not e!591273))))

(declare-fun e!591276 () Bool)

(assert (=> b!1043522 (= res!695210 e!591276)))

(declare-fun res!695202 () Bool)

(assert (=> b!1043522 (=> res!695202 e!591276)))

(assert (=> b!1043522 (= res!695202 (not e!591282))))

(declare-fun res!695207 () Bool)

(assert (=> b!1043522 (=> (not res!695207) (not e!591282))))

(assert (=> b!1043522 (= res!695207 (bvslt #b00000000000000000000000000000000 (size!32157 lt!459775)))))

(declare-fun bm!44225 () Bool)

(assert (=> bm!44225 (= call!44233 call!44231)))

(declare-fun e!591278 () Bool)

(declare-fun lt!459924 () ListLongMap!13835)

(declare-fun b!1043523 () Bool)

(assert (=> b!1043523 (= e!591278 (= (apply!901 lt!459924 (select (arr!31620 lt!459775) #b00000000000000000000000000000000)) (get!16536 (select (arr!31621 (array!65738 (store (arr!31621 (_values!6407 thiss!1427)) (index!41700 lt!459774) (ValueCellFull!11705 (dynLambda!1986 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32158 (_values!6407 thiss!1427)))) #b00000000000000000000000000000000) (dynLambda!1986 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1043523 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32158 (array!65738 (store (arr!31621 (_values!6407 thiss!1427)) (index!41700 lt!459774) (ValueCellFull!11705 (dynLambda!1986 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32158 (_values!6407 thiss!1427))))))))

(assert (=> b!1043523 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32157 lt!459775)))))

(declare-fun call!44228 () ListLongMap!13835)

(declare-fun bm!44227 () Bool)

(assert (=> bm!44227 (= call!44228 (getCurrentListMapNoExtraKeys!3567 lt!459775 (array!65738 (store (arr!31621 (_values!6407 thiss!1427)) (index!41700 lt!459774) (ValueCellFull!11705 (dynLambda!1986 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32158 (_values!6407 thiss!1427))) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun bm!44228 () Bool)

(assert (=> bm!44228 (= call!44229 call!44228)))

(declare-fun b!1043524 () Bool)

(assert (=> b!1043524 (= e!591277 call!44233)))

(declare-fun b!1043525 () Bool)

(declare-fun e!591274 () Bool)

(assert (=> b!1043525 (= e!591273 e!591274)))

(declare-fun c!105935 () Bool)

(assert (=> b!1043525 (= c!105935 (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1043526 () Bool)

(assert (=> b!1043526 (= e!591277 call!44230)))

(declare-fun b!1043527 () Bool)

(declare-fun call!44232 () Bool)

(assert (=> b!1043527 (= e!591279 (not call!44232))))

(declare-fun b!1043528 () Bool)

(declare-fun e!591285 () Bool)

(assert (=> b!1043528 (= e!591274 e!591285)))

(declare-fun res!695205 () Bool)

(declare-fun call!44227 () Bool)

(assert (=> b!1043528 (= res!695205 call!44227)))

(assert (=> b!1043528 (=> (not res!695205) (not e!591285))))

(declare-fun b!1043529 () Bool)

(assert (=> b!1043529 (= e!591276 e!591278)))

(declare-fun res!695208 () Bool)

(assert (=> b!1043529 (=> (not res!695208) (not e!591278))))

(assert (=> b!1043529 (= res!695208 (contains!6043 lt!459924 (select (arr!31620 lt!459775) #b00000000000000000000000000000000)))))

(assert (=> b!1043529 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32157 lt!459775)))))

(declare-fun b!1043530 () Bool)

(assert (=> b!1043530 (= e!591285 (= (apply!901 lt!459924 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6218 thiss!1427)))))

(declare-fun b!1043531 () Bool)

(assert (=> b!1043531 (= e!591274 (not call!44227))))

(declare-fun b!1043532 () Bool)

(declare-fun e!591280 () Bool)

(assert (=> b!1043532 (= e!591280 (validKeyInArray!0 (select (arr!31620 lt!459775) #b00000000000000000000000000000000)))))

(declare-fun c!105931 () Bool)

(declare-fun bm!44226 () Bool)

(declare-fun c!105934 () Bool)

(assert (=> bm!44226 (= call!44231 (+!3132 (ite c!105934 call!44228 (ite c!105931 call!44229 call!44230)) (ite (or c!105934 c!105931) (tuple2!15813 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6218 thiss!1427)) (tuple2!15813 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6218 thiss!1427)))))))

(declare-fun d!126137 () Bool)

(assert (=> d!126137 e!591273))

(declare-fun res!695204 () Bool)

(assert (=> d!126137 (=> (not res!695204) (not e!591273))))

(assert (=> d!126137 (= res!695204 (or (bvsge #b00000000000000000000000000000000 (size!32157 lt!459775)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32157 lt!459775)))))))

(declare-fun lt!459926 () ListLongMap!13835)

(assert (=> d!126137 (= lt!459924 lt!459926)))

(declare-fun lt!459931 () Unit!33961)

(assert (=> d!126137 (= lt!459931 e!591283)))

(declare-fun c!105933 () Bool)

(assert (=> d!126137 (= c!105933 e!591280)))

(declare-fun res!695209 () Bool)

(assert (=> d!126137 (=> (not res!695209) (not e!591280))))

(assert (=> d!126137 (= res!695209 (bvslt #b00000000000000000000000000000000 (size!32157 lt!459775)))))

(assert (=> d!126137 (= lt!459926 e!591284)))

(assert (=> d!126137 (= c!105934 (and (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126137 (validMask!0 (mask!30470 thiss!1427))))

(assert (=> d!126137 (= (getCurrentListMap!3899 lt!459775 (array!65738 (store (arr!31621 (_values!6407 thiss!1427)) (index!41700 lt!459774) (ValueCellFull!11705 (dynLambda!1986 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32158 (_values!6407 thiss!1427))) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)) lt!459924)))

(declare-fun bm!44229 () Bool)

(assert (=> bm!44229 (= call!44232 (contains!6043 lt!459924 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043533 () Bool)

(declare-fun lt!459923 () Unit!33961)

(assert (=> b!1043533 (= e!591283 lt!459923)))

(declare-fun lt!459932 () ListLongMap!13835)

(assert (=> b!1043533 (= lt!459932 (getCurrentListMapNoExtraKeys!3567 lt!459775 (array!65738 (store (arr!31621 (_values!6407 thiss!1427)) (index!41700 lt!459774) (ValueCellFull!11705 (dynLambda!1986 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32158 (_values!6407 thiss!1427))) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun lt!459917 () (_ BitVec 64))

(assert (=> b!1043533 (= lt!459917 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!459919 () (_ BitVec 64))

(assert (=> b!1043533 (= lt!459919 (select (arr!31620 lt!459775) #b00000000000000000000000000000000))))

(declare-fun lt!459929 () Unit!33961)

(assert (=> b!1043533 (= lt!459929 (addStillContains!620 lt!459932 lt!459917 (zeroValue!6218 thiss!1427) lt!459919))))

(assert (=> b!1043533 (contains!6043 (+!3132 lt!459932 (tuple2!15813 lt!459917 (zeroValue!6218 thiss!1427))) lt!459919)))

(declare-fun lt!459918 () Unit!33961)

(assert (=> b!1043533 (= lt!459918 lt!459929)))

(declare-fun lt!459930 () ListLongMap!13835)

(assert (=> b!1043533 (= lt!459930 (getCurrentListMapNoExtraKeys!3567 lt!459775 (array!65738 (store (arr!31621 (_values!6407 thiss!1427)) (index!41700 lt!459774) (ValueCellFull!11705 (dynLambda!1986 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32158 (_values!6407 thiss!1427))) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun lt!459915 () (_ BitVec 64))

(assert (=> b!1043533 (= lt!459915 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!459928 () (_ BitVec 64))

(assert (=> b!1043533 (= lt!459928 (select (arr!31620 lt!459775) #b00000000000000000000000000000000))))

(declare-fun lt!459927 () Unit!33961)

(assert (=> b!1043533 (= lt!459927 (addApplyDifferent!476 lt!459930 lt!459915 (minValue!6218 thiss!1427) lt!459928))))

(assert (=> b!1043533 (= (apply!901 (+!3132 lt!459930 (tuple2!15813 lt!459915 (minValue!6218 thiss!1427))) lt!459928) (apply!901 lt!459930 lt!459928))))

(declare-fun lt!459933 () Unit!33961)

(assert (=> b!1043533 (= lt!459933 lt!459927)))

(declare-fun lt!459935 () ListLongMap!13835)

(assert (=> b!1043533 (= lt!459935 (getCurrentListMapNoExtraKeys!3567 lt!459775 (array!65738 (store (arr!31621 (_values!6407 thiss!1427)) (index!41700 lt!459774) (ValueCellFull!11705 (dynLambda!1986 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32158 (_values!6407 thiss!1427))) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun lt!459916 () (_ BitVec 64))

(assert (=> b!1043533 (= lt!459916 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!459922 () (_ BitVec 64))

(assert (=> b!1043533 (= lt!459922 (select (arr!31620 lt!459775) #b00000000000000000000000000000000))))

(declare-fun lt!459934 () Unit!33961)

(assert (=> b!1043533 (= lt!459934 (addApplyDifferent!476 lt!459935 lt!459916 (zeroValue!6218 thiss!1427) lt!459922))))

(assert (=> b!1043533 (= (apply!901 (+!3132 lt!459935 (tuple2!15813 lt!459916 (zeroValue!6218 thiss!1427))) lt!459922) (apply!901 lt!459935 lt!459922))))

(declare-fun lt!459920 () Unit!33961)

(assert (=> b!1043533 (= lt!459920 lt!459934)))

(declare-fun lt!459936 () ListLongMap!13835)

(assert (=> b!1043533 (= lt!459936 (getCurrentListMapNoExtraKeys!3567 lt!459775 (array!65738 (store (arr!31621 (_values!6407 thiss!1427)) (index!41700 lt!459774) (ValueCellFull!11705 (dynLambda!1986 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32158 (_values!6407 thiss!1427))) (mask!30470 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-fun lt!459925 () (_ BitVec 64))

(assert (=> b!1043533 (= lt!459925 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!459921 () (_ BitVec 64))

(assert (=> b!1043533 (= lt!459921 (select (arr!31620 lt!459775) #b00000000000000000000000000000000))))

(assert (=> b!1043533 (= lt!459923 (addApplyDifferent!476 lt!459936 lt!459925 (minValue!6218 thiss!1427) lt!459921))))

(assert (=> b!1043533 (= (apply!901 (+!3132 lt!459936 (tuple2!15813 lt!459925 (minValue!6218 thiss!1427))) lt!459921) (apply!901 lt!459936 lt!459921))))

(declare-fun bm!44230 () Bool)

(assert (=> bm!44230 (= call!44227 (contains!6043 lt!459924 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043534 () Bool)

(declare-fun e!591275 () Bool)

(assert (=> b!1043534 (= e!591275 (= (apply!901 lt!459924 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6218 thiss!1427)))))

(declare-fun b!1043535 () Bool)

(assert (=> b!1043535 (= e!591279 e!591275)))

(declare-fun res!695206 () Bool)

(assert (=> b!1043535 (= res!695206 call!44232)))

(assert (=> b!1043535 (=> (not res!695206) (not e!591275))))

(declare-fun b!1043536 () Bool)

(assert (=> b!1043536 (= e!591284 e!591281)))

(assert (=> b!1043536 (= c!105931 (and (not (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6112 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!126137 c!105934) b!1043521))

(assert (= (and d!126137 (not c!105934)) b!1043536))

(assert (= (and b!1043536 c!105931) b!1043518))

(assert (= (and b!1043536 (not c!105931)) b!1043520))

(assert (= (and b!1043520 c!105932) b!1043524))

(assert (= (and b!1043520 (not c!105932)) b!1043526))

(assert (= (or b!1043524 b!1043526) bm!44224))

(assert (= (or b!1043518 bm!44224) bm!44228))

(assert (= (or b!1043518 b!1043524) bm!44225))

(assert (= (or b!1043521 bm!44228) bm!44227))

(assert (= (or b!1043521 bm!44225) bm!44226))

(assert (= (and d!126137 res!695209) b!1043532))

(assert (= (and d!126137 c!105933) b!1043533))

(assert (= (and d!126137 (not c!105933)) b!1043517))

(assert (= (and d!126137 res!695204) b!1043522))

(assert (= (and b!1043522 res!695207) b!1043519))

(assert (= (and b!1043522 (not res!695202)) b!1043529))

(assert (= (and b!1043529 res!695208) b!1043523))

(assert (= (and b!1043522 res!695210) b!1043516))

(assert (= (and b!1043516 c!105930) b!1043535))

(assert (= (and b!1043516 (not c!105930)) b!1043527))

(assert (= (and b!1043535 res!695206) b!1043534))

(assert (= (or b!1043535 b!1043527) bm!44229))

(assert (= (and b!1043516 res!695203) b!1043525))

(assert (= (and b!1043525 c!105935) b!1043528))

(assert (= (and b!1043525 (not c!105935)) b!1043531))

(assert (= (and b!1043528 res!695205) b!1043530))

(assert (= (or b!1043528 b!1043531) bm!44230))

(declare-fun b_lambda!16147 () Bool)

(assert (=> (not b_lambda!16147) (not b!1043523)))

(assert (=> b!1043523 t!31234))

(declare-fun b_and!33619 () Bool)

(assert (= b_and!33617 (and (=> t!31234 result!14487) b_and!33619)))

(declare-fun m!962311 () Bool)

(assert (=> bm!44227 m!962311))

(declare-fun m!962313 () Bool)

(assert (=> bm!44230 m!962313))

(assert (=> b!1043532 m!962231))

(assert (=> b!1043532 m!962231))

(assert (=> b!1043532 m!962233))

(declare-fun m!962315 () Bool)

(assert (=> b!1043530 m!962315))

(declare-fun m!962317 () Bool)

(assert (=> b!1043521 m!962317))

(assert (=> b!1043529 m!962231))

(assert (=> b!1043529 m!962231))

(declare-fun m!962319 () Bool)

(assert (=> b!1043529 m!962319))

(declare-fun m!962321 () Bool)

(assert (=> bm!44229 m!962321))

(assert (=> b!1043533 m!962311))

(declare-fun m!962323 () Bool)

(assert (=> b!1043533 m!962323))

(declare-fun m!962325 () Bool)

(assert (=> b!1043533 m!962325))

(declare-fun m!962327 () Bool)

(assert (=> b!1043533 m!962327))

(declare-fun m!962329 () Bool)

(assert (=> b!1043533 m!962329))

(declare-fun m!962331 () Bool)

(assert (=> b!1043533 m!962331))

(declare-fun m!962333 () Bool)

(assert (=> b!1043533 m!962333))

(assert (=> b!1043533 m!962329))

(declare-fun m!962335 () Bool)

(assert (=> b!1043533 m!962335))

(assert (=> b!1043533 m!962323))

(declare-fun m!962337 () Bool)

(assert (=> b!1043533 m!962337))

(declare-fun m!962339 () Bool)

(assert (=> b!1043533 m!962339))

(declare-fun m!962341 () Bool)

(assert (=> b!1043533 m!962341))

(declare-fun m!962343 () Bool)

(assert (=> b!1043533 m!962343))

(assert (=> b!1043533 m!962231))

(declare-fun m!962345 () Bool)

(assert (=> b!1043533 m!962345))

(declare-fun m!962347 () Bool)

(assert (=> b!1043533 m!962347))

(declare-fun m!962349 () Bool)

(assert (=> b!1043533 m!962349))

(assert (=> b!1043533 m!962331))

(assert (=> b!1043533 m!962349))

(declare-fun m!962351 () Bool)

(assert (=> b!1043533 m!962351))

(declare-fun m!962353 () Bool)

(assert (=> bm!44226 m!962353))

(assert (=> b!1043519 m!962231))

(assert (=> b!1043519 m!962231))

(assert (=> b!1043519 m!962233))

(declare-fun m!962355 () Bool)

(assert (=> b!1043534 m!962355))

(declare-fun m!962357 () Bool)

(assert (=> b!1043523 m!962357))

(assert (=> b!1043523 m!962101))

(declare-fun m!962359 () Bool)

(assert (=> b!1043523 m!962359))

(assert (=> b!1043523 m!962231))

(declare-fun m!962361 () Bool)

(assert (=> b!1043523 m!962361))

(assert (=> b!1043523 m!962101))

(assert (=> b!1043523 m!962231))

(assert (=> b!1043523 m!962357))

(assert (=> d!126137 m!962221))

(assert (=> b!1043327 d!126137))

(declare-fun d!126139 () Bool)

(declare-fun lt!459937 () (_ BitVec 32))

(assert (=> d!126139 (and (bvsge lt!459937 #b00000000000000000000000000000000) (bvsle lt!459937 (bvsub (size!32157 (_keys!11638 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!591287 () (_ BitVec 32))

(assert (=> d!126139 (= lt!459937 e!591287)))

(declare-fun c!105937 () Bool)

(assert (=> d!126139 (= c!105937 (bvsge #b00000000000000000000000000000000 (size!32157 (_keys!11638 thiss!1427))))))

(assert (=> d!126139 (and (bvsle #b00000000000000000000000000000000 (size!32157 (_keys!11638 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32157 (_keys!11638 thiss!1427)) (size!32157 (_keys!11638 thiss!1427))))))

(assert (=> d!126139 (= (arrayCountValidKeys!0 (_keys!11638 thiss!1427) #b00000000000000000000000000000000 (size!32157 (_keys!11638 thiss!1427))) lt!459937)))

(declare-fun b!1043537 () Bool)

(assert (=> b!1043537 (= e!591287 #b00000000000000000000000000000000)))

(declare-fun b!1043538 () Bool)

(declare-fun e!591286 () (_ BitVec 32))

(assert (=> b!1043538 (= e!591287 e!591286)))

(declare-fun c!105936 () Bool)

(assert (=> b!1043538 (= c!105936 (validKeyInArray!0 (select (arr!31620 (_keys!11638 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043539 () Bool)

(declare-fun call!44234 () (_ BitVec 32))

(assert (=> b!1043539 (= e!591286 call!44234)))

(declare-fun bm!44231 () Bool)

(assert (=> bm!44231 (= call!44234 (arrayCountValidKeys!0 (_keys!11638 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32157 (_keys!11638 thiss!1427))))))

(declare-fun b!1043540 () Bool)

(assert (=> b!1043540 (= e!591286 (bvadd #b00000000000000000000000000000001 call!44234))))

(assert (= (and d!126139 c!105937) b!1043537))

(assert (= (and d!126139 (not c!105937)) b!1043538))

(assert (= (and b!1043538 c!105936) b!1043540))

(assert (= (and b!1043538 (not c!105936)) b!1043539))

(assert (= (or b!1043540 b!1043539) bm!44231))

(assert (=> b!1043538 m!962245))

(assert (=> b!1043538 m!962245))

(assert (=> b!1043538 m!962247))

(declare-fun m!962363 () Bool)

(assert (=> bm!44231 m!962363))

(assert (=> b!1043327 d!126139))

(declare-fun b!1043549 () Bool)

(declare-fun e!591296 () Bool)

(declare-fun e!591295 () Bool)

(assert (=> b!1043549 (= e!591296 e!591295)))

(declare-fun lt!459945 () (_ BitVec 64))

(assert (=> b!1043549 (= lt!459945 (select (arr!31620 lt!459775) #b00000000000000000000000000000000))))

(declare-fun lt!459944 () Unit!33961)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65735 (_ BitVec 64) (_ BitVec 32)) Unit!33961)

(assert (=> b!1043549 (= lt!459944 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459775 lt!459945 #b00000000000000000000000000000000))))

(assert (=> b!1043549 (arrayContainsKey!0 lt!459775 lt!459945 #b00000000000000000000000000000000)))

(declare-fun lt!459946 () Unit!33961)

(assert (=> b!1043549 (= lt!459946 lt!459944)))

(declare-fun res!695215 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65735 (_ BitVec 32)) SeekEntryResult!9832)

(assert (=> b!1043549 (= res!695215 (= (seekEntryOrOpen!0 (select (arr!31620 lt!459775) #b00000000000000000000000000000000) lt!459775 (mask!30470 thiss!1427)) (Found!9832 #b00000000000000000000000000000000)))))

(assert (=> b!1043549 (=> (not res!695215) (not e!591295))))

(declare-fun b!1043550 () Bool)

(declare-fun call!44237 () Bool)

(assert (=> b!1043550 (= e!591295 call!44237)))

(declare-fun bm!44234 () Bool)

(assert (=> bm!44234 (= call!44237 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459775 (mask!30470 thiss!1427)))))

(declare-fun d!126141 () Bool)

(declare-fun res!695216 () Bool)

(declare-fun e!591294 () Bool)

(assert (=> d!126141 (=> res!695216 e!591294)))

(assert (=> d!126141 (= res!695216 (bvsge #b00000000000000000000000000000000 (size!32157 lt!459775)))))

(assert (=> d!126141 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459775 (mask!30470 thiss!1427)) e!591294)))

(declare-fun b!1043551 () Bool)

(assert (=> b!1043551 (= e!591294 e!591296)))

(declare-fun c!105940 () Bool)

(assert (=> b!1043551 (= c!105940 (validKeyInArray!0 (select (arr!31620 lt!459775) #b00000000000000000000000000000000)))))

(declare-fun b!1043552 () Bool)

(assert (=> b!1043552 (= e!591296 call!44237)))

(assert (= (and d!126141 (not res!695216)) b!1043551))

(assert (= (and b!1043551 c!105940) b!1043549))

(assert (= (and b!1043551 (not c!105940)) b!1043552))

(assert (= (and b!1043549 res!695215) b!1043550))

(assert (= (or b!1043550 b!1043552) bm!44234))

(assert (=> b!1043549 m!962231))

(declare-fun m!962365 () Bool)

(assert (=> b!1043549 m!962365))

(declare-fun m!962367 () Bool)

(assert (=> b!1043549 m!962367))

(assert (=> b!1043549 m!962231))

(declare-fun m!962369 () Bool)

(assert (=> b!1043549 m!962369))

(declare-fun m!962371 () Bool)

(assert (=> bm!44234 m!962371))

(assert (=> b!1043551 m!962231))

(assert (=> b!1043551 m!962231))

(assert (=> b!1043551 m!962233))

(assert (=> b!1043327 d!126141))

(declare-fun b!1043561 () Bool)

(declare-fun res!695228 () Bool)

(declare-fun e!591302 () Bool)

(assert (=> b!1043561 (=> (not res!695228) (not e!591302))))

(assert (=> b!1043561 (= res!695228 (validKeyInArray!0 (select (arr!31620 (_keys!11638 thiss!1427)) (index!41700 lt!459774))))))

(declare-fun b!1043562 () Bool)

(declare-fun res!695225 () Bool)

(assert (=> b!1043562 (=> (not res!695225) (not e!591302))))

(assert (=> b!1043562 (= res!695225 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1043563 () Bool)

(assert (=> b!1043563 (= e!591302 (bvslt (size!32157 (_keys!11638 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun d!126143 () Bool)

(declare-fun e!591301 () Bool)

(assert (=> d!126143 e!591301))

(declare-fun res!695226 () Bool)

(assert (=> d!126143 (=> (not res!695226) (not e!591301))))

(assert (=> d!126143 (= res!695226 (and (bvsge (index!41700 lt!459774) #b00000000000000000000000000000000) (bvslt (index!41700 lt!459774) (size!32157 (_keys!11638 thiss!1427)))))))

(declare-fun lt!459949 () Unit!33961)

(declare-fun choose!82 (array!65735 (_ BitVec 32) (_ BitVec 64)) Unit!33961)

(assert (=> d!126143 (= lt!459949 (choose!82 (_keys!11638 thiss!1427) (index!41700 lt!459774) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126143 e!591302))

(declare-fun res!695227 () Bool)

(assert (=> d!126143 (=> (not res!695227) (not e!591302))))

(assert (=> d!126143 (= res!695227 (and (bvsge (index!41700 lt!459774) #b00000000000000000000000000000000) (bvslt (index!41700 lt!459774) (size!32157 (_keys!11638 thiss!1427)))))))

(assert (=> d!126143 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11638 thiss!1427) (index!41700 lt!459774) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459949)))

(declare-fun b!1043564 () Bool)

(assert (=> b!1043564 (= e!591301 (= (arrayCountValidKeys!0 (array!65736 (store (arr!31620 (_keys!11638 thiss!1427)) (index!41700 lt!459774) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32157 (_keys!11638 thiss!1427))) #b00000000000000000000000000000000 (size!32157 (_keys!11638 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11638 thiss!1427) #b00000000000000000000000000000000 (size!32157 (_keys!11638 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!126143 res!695227) b!1043561))

(assert (= (and b!1043561 res!695228) b!1043562))

(assert (= (and b!1043562 res!695225) b!1043563))

(assert (= (and d!126143 res!695226) b!1043564))

(declare-fun m!962373 () Bool)

(assert (=> b!1043561 m!962373))

(assert (=> b!1043561 m!962373))

(declare-fun m!962375 () Bool)

(assert (=> b!1043561 m!962375))

(declare-fun m!962377 () Bool)

(assert (=> b!1043562 m!962377))

(declare-fun m!962379 () Bool)

(assert (=> d!126143 m!962379))

(assert (=> b!1043564 m!962083))

(declare-fun m!962381 () Bool)

(assert (=> b!1043564 m!962381))

(assert (=> b!1043564 m!962089))

(assert (=> b!1043327 d!126143))

(declare-fun b!1043571 () Bool)

(declare-fun e!591307 () Bool)

(assert (=> b!1043571 (= e!591307 tp_is_empty!24817)))

(declare-fun b!1043572 () Bool)

(declare-fun e!591308 () Bool)

(assert (=> b!1043572 (= e!591308 tp_is_empty!24817)))

(declare-fun mapNonEmpty!38855 () Bool)

(declare-fun mapRes!38855 () Bool)

(declare-fun tp!74544 () Bool)

(assert (=> mapNonEmpty!38855 (= mapRes!38855 (and tp!74544 e!591307))))

(declare-fun mapRest!38855 () (Array (_ BitVec 32) ValueCell!11705))

(declare-fun mapKey!38855 () (_ BitVec 32))

(declare-fun mapValue!38855 () ValueCell!11705)

(assert (=> mapNonEmpty!38855 (= mapRest!38846 (store mapRest!38855 mapKey!38855 mapValue!38855))))

(declare-fun mapIsEmpty!38855 () Bool)

(assert (=> mapIsEmpty!38855 mapRes!38855))

(declare-fun condMapEmpty!38855 () Bool)

(declare-fun mapDefault!38855 () ValueCell!11705)

(assert (=> mapNonEmpty!38846 (= condMapEmpty!38855 (= mapRest!38846 ((as const (Array (_ BitVec 32) ValueCell!11705)) mapDefault!38855)))))

(assert (=> mapNonEmpty!38846 (= tp!74529 (and e!591308 mapRes!38855))))

(assert (= (and mapNonEmpty!38846 condMapEmpty!38855) mapIsEmpty!38855))

(assert (= (and mapNonEmpty!38846 (not condMapEmpty!38855)) mapNonEmpty!38855))

(assert (= (and mapNonEmpty!38855 ((_ is ValueCellFull!11705) mapValue!38855)) b!1043571))

(assert (= (and mapNonEmpty!38846 ((_ is ValueCellFull!11705) mapDefault!38855)) b!1043572))

(declare-fun m!962383 () Bool)

(assert (=> mapNonEmpty!38855 m!962383))

(declare-fun b_lambda!16149 () Bool)

(assert (= b_lambda!16145 (or (and b!1043329 b_free!21097) b_lambda!16149)))

(declare-fun b_lambda!16151 () Bool)

(assert (= b_lambda!16147 (or (and b!1043329 b_free!21097) b_lambda!16151)))

(declare-fun b_lambda!16153 () Bool)

(assert (= b_lambda!16143 (or (and b!1043329 b_free!21097) b_lambda!16153)))

(check-sat (not bm!44226) (not b!1043515) (not b!1043509) (not b!1043425) (not b!1043549) (not b!1043551) (not b!1043534) (not b!1043523) (not b!1043426) (not bm!44230) (not b!1043538) (not b_lambda!16151) (not bm!44222) (not b!1043486) (not b!1043561) tp_is_empty!24817 (not d!126127) (not b!1043428) (not d!126111) (not b!1043500) (not bm!44229) (not b!1043519) (not b_lambda!16153) (not b!1043533) (not d!126137) (not bm!44223) (not b!1043388) (not d!126135) (not b!1043410) (not bm!44199) (not bm!44220) (not b!1043497) (not b!1043488) (not b!1043490) (not b!1043564) (not b!1043562) (not b!1043512) (not d!126133) (not d!126121) (not bm!44234) (not b!1043530) (not d!126143) (not b_next!21097) (not b!1043499) (not b!1043438) (not b!1043532) (not bm!44219) (not bm!44202) (not d!126117) (not mapNonEmpty!38855) (not b!1043529) (not bm!44231) (not d!126131) (not b_lambda!16141) (not d!126119) (not b!1043521) (not b!1043389) (not bm!44227) b_and!33619 (not b!1043413) (not b!1043496) (not b_lambda!16149) (not b!1043387) (not b!1043501) (not b!1043404))
(check-sat b_and!33619 (not b_next!21097))
