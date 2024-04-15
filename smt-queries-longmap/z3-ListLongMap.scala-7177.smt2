; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91770 () Bool)

(assert start!91770)

(declare-fun b!1044158 () Bool)

(declare-fun b_free!21115 () Bool)

(declare-fun b_next!21115 () Bool)

(assert (=> b!1044158 (= b_free!21115 (not b_next!21115))))

(declare-fun tp!74591 () Bool)

(declare-fun b_and!33659 () Bool)

(assert (=> b!1044158 (= tp!74591 b_and!33659)))

(declare-fun b!1044152 () Bool)

(declare-fun res!695497 () Bool)

(declare-fun e!591727 () Bool)

(assert (=> b!1044152 (=> res!695497 e!591727)))

(declare-datatypes ((V!37987 0))(
  ( (V!37988 (val!12468 Int)) )
))
(declare-datatypes ((ValueCell!11714 0))(
  ( (ValueCellFull!11714 (v!15059 V!37987)) (EmptyCell!11714) )
))
(declare-datatypes ((Unit!33989 0))(
  ( (Unit!33990) )
))
(declare-datatypes ((array!65777 0))(
  ( (array!65778 (arr!31638 (Array (_ BitVec 32) (_ BitVec 64))) (size!32175 (_ BitVec 32))) )
))
(declare-datatypes ((array!65779 0))(
  ( (array!65780 (arr!31639 (Array (_ BitVec 32) ValueCell!11714)) (size!32176 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6022 0))(
  ( (LongMapFixedSize!6023 (defaultEntry!6399 Int) (mask!30501 (_ BitVec 32)) (extraKeys!6127 (_ BitVec 32)) (zeroValue!6233 V!37987) (minValue!6233 V!37987) (_size!3066 (_ BitVec 32)) (_keys!11659 array!65777) (_values!6422 array!65779) (_vacant!3066 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15832 0))(
  ( (tuple2!15833 (_1!7927 Unit!33989) (_2!7927 LongMapFixedSize!6022)) )
))
(declare-fun lt!460414 () tuple2!15832)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1044152 (= res!695497 (not (validMask!0 (mask!30501 (_2!7927 lt!460414)))))))

(declare-fun b!1044153 () Bool)

(assert (=> b!1044153 (= e!591727 (= (size!32176 (_values!6422 (_2!7927 lt!460414))) (bvadd #b00000000000000000000000000000001 (mask!30501 (_2!7927 lt!460414)))))))

(declare-fun b!1044154 () Bool)

(declare-fun res!695496 () Bool)

(declare-fun e!591729 () Bool)

(assert (=> b!1044154 (=> (not res!695496) (not e!591729))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1044154 (= res!695496 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1044155 () Bool)

(declare-fun e!591731 () Bool)

(assert (=> b!1044155 (= e!591729 e!591731)))

(declare-fun res!695494 () Bool)

(assert (=> b!1044155 (=> (not res!695494) (not e!591731))))

(declare-datatypes ((SeekEntryResult!9840 0))(
  ( (MissingZero!9840 (index!41731 (_ BitVec 32))) (Found!9840 (index!41732 (_ BitVec 32))) (Intermediate!9840 (undefined!10652 Bool) (index!41733 (_ BitVec 32)) (x!93251 (_ BitVec 32))) (Undefined!9840) (MissingVacant!9840 (index!41734 (_ BitVec 32))) )
))
(declare-fun lt!460410 () SeekEntryResult!9840)

(get-info :version)

(assert (=> b!1044155 (= res!695494 ((_ is Found!9840) lt!460410))))

(declare-fun thiss!1427 () LongMapFixedSize!6022)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65777 (_ BitVec 32)) SeekEntryResult!9840)

(assert (=> b!1044155 (= lt!460410 (seekEntry!0 key!909 (_keys!11659 thiss!1427) (mask!30501 thiss!1427)))))

(declare-fun res!695498 () Bool)

(assert (=> start!91770 (=> (not res!695498) (not e!591729))))

(declare-fun valid!2255 (LongMapFixedSize!6022) Bool)

(assert (=> start!91770 (= res!695498 (valid!2255 thiss!1427))))

(assert (=> start!91770 e!591729))

(declare-fun e!591725 () Bool)

(assert (=> start!91770 e!591725))

(assert (=> start!91770 true))

(declare-fun b!1044156 () Bool)

(declare-fun e!591728 () Bool)

(declare-fun e!591726 () Bool)

(declare-fun mapRes!38882 () Bool)

(assert (=> b!1044156 (= e!591728 (and e!591726 mapRes!38882))))

(declare-fun condMapEmpty!38882 () Bool)

(declare-fun mapDefault!38882 () ValueCell!11714)

(assert (=> b!1044156 (= condMapEmpty!38882 (= (arr!31639 (_values!6422 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11714)) mapDefault!38882)))))

(declare-fun mapIsEmpty!38882 () Bool)

(assert (=> mapIsEmpty!38882 mapRes!38882))

(declare-fun b!1044157 () Bool)

(declare-fun tp_is_empty!24835 () Bool)

(assert (=> b!1044157 (= e!591726 tp_is_empty!24835)))

(declare-fun array_inv!24451 (array!65777) Bool)

(declare-fun array_inv!24452 (array!65779) Bool)

(assert (=> b!1044158 (= e!591725 (and tp!74591 tp_is_empty!24835 (array_inv!24451 (_keys!11659 thiss!1427)) (array_inv!24452 (_values!6422 thiss!1427)) e!591728))))

(declare-fun b!1044159 () Bool)

(declare-fun e!591730 () Bool)

(assert (=> b!1044159 (= e!591730 tp_is_empty!24835)))

(declare-fun mapNonEmpty!38882 () Bool)

(declare-fun tp!74592 () Bool)

(assert (=> mapNonEmpty!38882 (= mapRes!38882 (and tp!74592 e!591730))))

(declare-fun mapValue!38882 () ValueCell!11714)

(declare-fun mapKey!38882 () (_ BitVec 32))

(declare-fun mapRest!38882 () (Array (_ BitVec 32) ValueCell!11714))

(assert (=> mapNonEmpty!38882 (= (arr!31639 (_values!6422 thiss!1427)) (store mapRest!38882 mapKey!38882 mapValue!38882))))

(declare-fun b!1044160 () Bool)

(assert (=> b!1044160 (= e!591731 (not e!591727))))

(declare-fun res!695495 () Bool)

(assert (=> b!1044160 (=> res!695495 e!591727)))

(declare-datatypes ((tuple2!15834 0))(
  ( (tuple2!15835 (_1!7928 (_ BitVec 64)) (_2!7928 V!37987)) )
))
(declare-datatypes ((List!22042 0))(
  ( (Nil!22039) (Cons!22038 (h!23246 tuple2!15834) (t!31269 List!22042)) )
))
(declare-datatypes ((ListLongMap!13849 0))(
  ( (ListLongMap!13850 (toList!6940 List!22042)) )
))
(declare-fun contains!6049 (ListLongMap!13849 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3906 (array!65777 array!65779 (_ BitVec 32) (_ BitVec 32) V!37987 V!37987 (_ BitVec 32) Int) ListLongMap!13849)

(assert (=> b!1044160 (= res!695495 (not (contains!6049 (getCurrentListMap!3906 (_keys!11659 (_2!7927 lt!460414)) (_values!6422 (_2!7927 lt!460414)) (mask!30501 (_2!7927 lt!460414)) (extraKeys!6127 (_2!7927 lt!460414)) (zeroValue!6233 (_2!7927 lt!460414)) (minValue!6233 (_2!7927 lt!460414)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7927 lt!460414))) key!909)))))

(declare-fun lt!460413 () array!65779)

(declare-fun lt!460411 () array!65777)

(declare-fun Unit!33991 () Unit!33989)

(declare-fun Unit!33992 () Unit!33989)

(assert (=> b!1044160 (= lt!460414 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3066 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15833 Unit!33991 (LongMapFixedSize!6023 (defaultEntry!6399 thiss!1427) (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) (bvsub (_size!3066 thiss!1427) #b00000000000000000000000000000001) lt!460411 lt!460413 (bvadd #b00000000000000000000000000000001 (_vacant!3066 thiss!1427)))) (tuple2!15833 Unit!33992 (LongMapFixedSize!6023 (defaultEntry!6399 thiss!1427) (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) (bvsub (_size!3066 thiss!1427) #b00000000000000000000000000000001) lt!460411 lt!460413 (_vacant!3066 thiss!1427)))))))

(declare-fun -!532 (ListLongMap!13849 (_ BitVec 64)) ListLongMap!13849)

(assert (=> b!1044160 (= (-!532 (getCurrentListMap!3906 (_keys!11659 thiss!1427) (_values!6422 thiss!1427) (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)) key!909) (getCurrentListMap!3906 lt!460411 lt!460413 (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun dynLambda!1993 (Int (_ BitVec 64)) V!37987)

(assert (=> b!1044160 (= lt!460413 (array!65780 (store (arr!31639 (_values!6422 thiss!1427)) (index!41732 lt!460410) (ValueCellFull!11714 (dynLambda!1993 (defaultEntry!6399 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32176 (_values!6422 thiss!1427))))))

(declare-fun lt!460409 () Unit!33989)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!54 (array!65777 array!65779 (_ BitVec 32) (_ BitVec 32) V!37987 V!37987 (_ BitVec 32) (_ BitVec 64) Int) Unit!33989)

(assert (=> b!1044160 (= lt!460409 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!54 (_keys!11659 thiss!1427) (_values!6422 thiss!1427) (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) (index!41732 lt!460410) key!909 (defaultEntry!6399 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1044160 (not (arrayContainsKey!0 lt!460411 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!460408 () Unit!33989)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65777 (_ BitVec 32) (_ BitVec 64)) Unit!33989)

(assert (=> b!1044160 (= lt!460408 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11659 thiss!1427) (index!41732 lt!460410) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65777 (_ BitVec 32)) Bool)

(assert (=> b!1044160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460411 (mask!30501 thiss!1427))))

(declare-fun lt!460412 () Unit!33989)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65777 (_ BitVec 32) (_ BitVec 32)) Unit!33989)

(assert (=> b!1044160 (= lt!460412 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11659 thiss!1427) (index!41732 lt!460410) (mask!30501 thiss!1427)))))

(declare-datatypes ((List!22043 0))(
  ( (Nil!22040) (Cons!22039 (h!23247 (_ BitVec 64)) (t!31270 List!22043)) )
))
(declare-fun arrayNoDuplicates!0 (array!65777 (_ BitVec 32) List!22043) Bool)

(assert (=> b!1044160 (arrayNoDuplicates!0 lt!460411 #b00000000000000000000000000000000 Nil!22040)))

(declare-fun lt!460416 () Unit!33989)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65777 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22043) Unit!33989)

(assert (=> b!1044160 (= lt!460416 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11659 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41732 lt!460410) #b00000000000000000000000000000000 Nil!22040))))

(declare-fun arrayCountValidKeys!0 (array!65777 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1044160 (= (arrayCountValidKeys!0 lt!460411 #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11659 thiss!1427) #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1044160 (= lt!460411 (array!65778 (store (arr!31638 (_keys!11659 thiss!1427)) (index!41732 lt!460410) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32175 (_keys!11659 thiss!1427))))))

(declare-fun lt!460415 () Unit!33989)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65777 (_ BitVec 32) (_ BitVec 64)) Unit!33989)

(assert (=> b!1044160 (= lt!460415 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11659 thiss!1427) (index!41732 lt!460410) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!91770 res!695498) b!1044154))

(assert (= (and b!1044154 res!695496) b!1044155))

(assert (= (and b!1044155 res!695494) b!1044160))

(assert (= (and b!1044160 (not res!695495)) b!1044152))

(assert (= (and b!1044152 (not res!695497)) b!1044153))

(assert (= (and b!1044156 condMapEmpty!38882) mapIsEmpty!38882))

(assert (= (and b!1044156 (not condMapEmpty!38882)) mapNonEmpty!38882))

(assert (= (and mapNonEmpty!38882 ((_ is ValueCellFull!11714) mapValue!38882)) b!1044159))

(assert (= (and b!1044156 ((_ is ValueCellFull!11714) mapDefault!38882)) b!1044157))

(assert (= b!1044158 b!1044156))

(assert (= start!91770 b!1044158))

(declare-fun b_lambda!16197 () Bool)

(assert (=> (not b_lambda!16197) (not b!1044160)))

(declare-fun t!31268 () Bool)

(declare-fun tb!7049 () Bool)

(assert (=> (and b!1044158 (= (defaultEntry!6399 thiss!1427) (defaultEntry!6399 thiss!1427)) t!31268) tb!7049))

(declare-fun result!14531 () Bool)

(assert (=> tb!7049 (= result!14531 tp_is_empty!24835)))

(assert (=> b!1044160 t!31268))

(declare-fun b_and!33661 () Bool)

(assert (= b_and!33659 (and (=> t!31268 result!14531) b_and!33661)))

(declare-fun m!963081 () Bool)

(assert (=> b!1044160 m!963081))

(declare-fun m!963083 () Bool)

(assert (=> b!1044160 m!963083))

(declare-fun m!963085 () Bool)

(assert (=> b!1044160 m!963085))

(declare-fun m!963087 () Bool)

(assert (=> b!1044160 m!963087))

(declare-fun m!963089 () Bool)

(assert (=> b!1044160 m!963089))

(declare-fun m!963091 () Bool)

(assert (=> b!1044160 m!963091))

(declare-fun m!963093 () Bool)

(assert (=> b!1044160 m!963093))

(declare-fun m!963095 () Bool)

(assert (=> b!1044160 m!963095))

(declare-fun m!963097 () Bool)

(assert (=> b!1044160 m!963097))

(declare-fun m!963099 () Bool)

(assert (=> b!1044160 m!963099))

(declare-fun m!963101 () Bool)

(assert (=> b!1044160 m!963101))

(declare-fun m!963103 () Bool)

(assert (=> b!1044160 m!963103))

(declare-fun m!963105 () Bool)

(assert (=> b!1044160 m!963105))

(declare-fun m!963107 () Bool)

(assert (=> b!1044160 m!963107))

(assert (=> b!1044160 m!963101))

(declare-fun m!963109 () Bool)

(assert (=> b!1044160 m!963109))

(assert (=> b!1044160 m!963103))

(declare-fun m!963111 () Bool)

(assert (=> b!1044160 m!963111))

(declare-fun m!963113 () Bool)

(assert (=> b!1044160 m!963113))

(declare-fun m!963115 () Bool)

(assert (=> b!1044160 m!963115))

(declare-fun m!963117 () Bool)

(assert (=> mapNonEmpty!38882 m!963117))

(declare-fun m!963119 () Bool)

(assert (=> b!1044152 m!963119))

(declare-fun m!963121 () Bool)

(assert (=> b!1044158 m!963121))

(declare-fun m!963123 () Bool)

(assert (=> b!1044158 m!963123))

(declare-fun m!963125 () Bool)

(assert (=> b!1044155 m!963125))

(declare-fun m!963127 () Bool)

(assert (=> start!91770 m!963127))

(check-sat (not b_lambda!16197) (not start!91770) (not b!1044158) (not b!1044155) (not b!1044160) tp_is_empty!24835 (not b_next!21115) (not mapNonEmpty!38882) (not b!1044152) b_and!33661)
(check-sat b_and!33661 (not b_next!21115))
(get-model)

(declare-fun b_lambda!16203 () Bool)

(assert (= b_lambda!16197 (or (and b!1044158 b_free!21115) b_lambda!16203)))

(check-sat (not start!91770) (not b!1044158) (not b!1044155) (not b_lambda!16203) (not b!1044160) tp_is_empty!24835 (not b_next!21115) (not mapNonEmpty!38882) (not b!1044152) b_and!33661)
(check-sat b_and!33661 (not b_next!21115))
(get-model)

(declare-fun d!126225 () Bool)

(assert (=> d!126225 (= (validMask!0 (mask!30501 (_2!7927 lt!460414))) (and (or (= (mask!30501 (_2!7927 lt!460414)) #b00000000000000000000000000000111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000000000000000000000001111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000000000000000000000011111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000000000000000000000111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000000000000000000001111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000000000000000000011111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000000000000000000111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000000000000000001111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000000000000000011111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000000000000000111111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000000000000001111111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000000000000011111111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000000000000111111111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000000000001111111111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000000000011111111111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000000000111111111111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000000001111111111111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000000011111111111111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000000111111111111111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000001111111111111111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000011111111111111111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000000111111111111111111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000001111111111111111111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000011111111111111111111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00000111111111111111111111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00001111111111111111111111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00011111111111111111111111111111) (= (mask!30501 (_2!7927 lt!460414)) #b00111111111111111111111111111111)) (bvsle (mask!30501 (_2!7927 lt!460414)) #b00111111111111111111111111111111)))))

(assert (=> b!1044152 d!126225))

(declare-fun b!1044263 () Bool)

(declare-fun e!591816 () ListLongMap!13849)

(declare-fun call!44339 () ListLongMap!13849)

(assert (=> b!1044263 (= e!591816 call!44339)))

(declare-fun b!1044264 () Bool)

(declare-fun e!591818 () Bool)

(declare-fun call!44336 () Bool)

(assert (=> b!1044264 (= e!591818 (not call!44336))))

(declare-fun b!1044265 () Bool)

(declare-fun call!44335 () ListLongMap!13849)

(assert (=> b!1044265 (= e!591816 call!44335)))

(declare-fun b!1044266 () Bool)

(declare-fun e!591815 () Bool)

(assert (=> b!1044266 (= e!591818 e!591815)))

(declare-fun res!695547 () Bool)

(assert (=> b!1044266 (= res!695547 call!44336)))

(assert (=> b!1044266 (=> (not res!695547) (not e!591815))))

(declare-fun b!1044267 () Bool)

(declare-fun res!695548 () Bool)

(declare-fun e!591810 () Bool)

(assert (=> b!1044267 (=> (not res!695548) (not e!591810))))

(assert (=> b!1044267 (= res!695548 e!591818)))

(declare-fun c!106058 () Bool)

(assert (=> b!1044267 (= c!106058 (not (= (bvand (extraKeys!6127 (_2!7927 lt!460414)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1044269 () Bool)

(declare-fun e!591807 () Bool)

(assert (=> b!1044269 (= e!591810 e!591807)))

(declare-fun c!106056 () Bool)

(assert (=> b!1044269 (= c!106056 (not (= (bvand (extraKeys!6127 (_2!7927 lt!460414)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044270 () Bool)

(declare-fun e!591817 () ListLongMap!13849)

(declare-fun call!44341 () ListLongMap!13849)

(declare-fun +!3135 (ListLongMap!13849 tuple2!15834) ListLongMap!13849)

(assert (=> b!1044270 (= e!591817 (+!3135 call!44341 (tuple2!15835 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6233 (_2!7927 lt!460414)))))))

(declare-fun b!1044271 () Bool)

(declare-fun e!591811 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1044271 (= e!591811 (validKeyInArray!0 (select (arr!31638 (_keys!11659 (_2!7927 lt!460414))) #b00000000000000000000000000000000)))))

(declare-fun bm!44332 () Bool)

(assert (=> bm!44332 (= call!44335 call!44341)))

(declare-fun call!44340 () ListLongMap!13849)

(declare-fun c!106061 () Bool)

(declare-fun call!44337 () ListLongMap!13849)

(declare-fun bm!44333 () Bool)

(declare-fun c!106057 () Bool)

(assert (=> bm!44333 (= call!44341 (+!3135 (ite c!106057 call!44340 (ite c!106061 call!44337 call!44339)) (ite (or c!106057 c!106061) (tuple2!15835 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6233 (_2!7927 lt!460414))) (tuple2!15835 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6233 (_2!7927 lt!460414))))))))

(declare-fun bm!44334 () Bool)

(declare-fun call!44338 () Bool)

(declare-fun lt!460529 () ListLongMap!13849)

(assert (=> bm!44334 (= call!44338 (contains!6049 lt!460529 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44335 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3570 (array!65777 array!65779 (_ BitVec 32) (_ BitVec 32) V!37987 V!37987 (_ BitVec 32) Int) ListLongMap!13849)

(assert (=> bm!44335 (= call!44340 (getCurrentListMapNoExtraKeys!3570 (_keys!11659 (_2!7927 lt!460414)) (_values!6422 (_2!7927 lt!460414)) (mask!30501 (_2!7927 lt!460414)) (extraKeys!6127 (_2!7927 lt!460414)) (zeroValue!6233 (_2!7927 lt!460414)) (minValue!6233 (_2!7927 lt!460414)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7927 lt!460414))))))

(declare-fun b!1044272 () Bool)

(declare-fun e!591819 () Unit!33989)

(declare-fun lt!460526 () Unit!33989)

(assert (=> b!1044272 (= e!591819 lt!460526)))

(declare-fun lt!460516 () ListLongMap!13849)

(assert (=> b!1044272 (= lt!460516 (getCurrentListMapNoExtraKeys!3570 (_keys!11659 (_2!7927 lt!460414)) (_values!6422 (_2!7927 lt!460414)) (mask!30501 (_2!7927 lt!460414)) (extraKeys!6127 (_2!7927 lt!460414)) (zeroValue!6233 (_2!7927 lt!460414)) (minValue!6233 (_2!7927 lt!460414)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7927 lt!460414))))))

(declare-fun lt!460518 () (_ BitVec 64))

(assert (=> b!1044272 (= lt!460518 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460521 () (_ BitVec 64))

(assert (=> b!1044272 (= lt!460521 (select (arr!31638 (_keys!11659 (_2!7927 lt!460414))) #b00000000000000000000000000000000))))

(declare-fun lt!460532 () Unit!33989)

(declare-fun addStillContains!623 (ListLongMap!13849 (_ BitVec 64) V!37987 (_ BitVec 64)) Unit!33989)

(assert (=> b!1044272 (= lt!460532 (addStillContains!623 lt!460516 lt!460518 (zeroValue!6233 (_2!7927 lt!460414)) lt!460521))))

(assert (=> b!1044272 (contains!6049 (+!3135 lt!460516 (tuple2!15835 lt!460518 (zeroValue!6233 (_2!7927 lt!460414)))) lt!460521)))

(declare-fun lt!460523 () Unit!33989)

(assert (=> b!1044272 (= lt!460523 lt!460532)))

(declare-fun lt!460525 () ListLongMap!13849)

(assert (=> b!1044272 (= lt!460525 (getCurrentListMapNoExtraKeys!3570 (_keys!11659 (_2!7927 lt!460414)) (_values!6422 (_2!7927 lt!460414)) (mask!30501 (_2!7927 lt!460414)) (extraKeys!6127 (_2!7927 lt!460414)) (zeroValue!6233 (_2!7927 lt!460414)) (minValue!6233 (_2!7927 lt!460414)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7927 lt!460414))))))

(declare-fun lt!460533 () (_ BitVec 64))

(assert (=> b!1044272 (= lt!460533 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460522 () (_ BitVec 64))

(assert (=> b!1044272 (= lt!460522 (select (arr!31638 (_keys!11659 (_2!7927 lt!460414))) #b00000000000000000000000000000000))))

(declare-fun lt!460519 () Unit!33989)

(declare-fun addApplyDifferent!479 (ListLongMap!13849 (_ BitVec 64) V!37987 (_ BitVec 64)) Unit!33989)

(assert (=> b!1044272 (= lt!460519 (addApplyDifferent!479 lt!460525 lt!460533 (minValue!6233 (_2!7927 lt!460414)) lt!460522))))

(declare-fun apply!904 (ListLongMap!13849 (_ BitVec 64)) V!37987)

(assert (=> b!1044272 (= (apply!904 (+!3135 lt!460525 (tuple2!15835 lt!460533 (minValue!6233 (_2!7927 lt!460414)))) lt!460522) (apply!904 lt!460525 lt!460522))))

(declare-fun lt!460520 () Unit!33989)

(assert (=> b!1044272 (= lt!460520 lt!460519)))

(declare-fun lt!460524 () ListLongMap!13849)

(assert (=> b!1044272 (= lt!460524 (getCurrentListMapNoExtraKeys!3570 (_keys!11659 (_2!7927 lt!460414)) (_values!6422 (_2!7927 lt!460414)) (mask!30501 (_2!7927 lt!460414)) (extraKeys!6127 (_2!7927 lt!460414)) (zeroValue!6233 (_2!7927 lt!460414)) (minValue!6233 (_2!7927 lt!460414)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7927 lt!460414))))))

(declare-fun lt!460531 () (_ BitVec 64))

(assert (=> b!1044272 (= lt!460531 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460515 () (_ BitVec 64))

(assert (=> b!1044272 (= lt!460515 (select (arr!31638 (_keys!11659 (_2!7927 lt!460414))) #b00000000000000000000000000000000))))

(declare-fun lt!460534 () Unit!33989)

(assert (=> b!1044272 (= lt!460534 (addApplyDifferent!479 lt!460524 lt!460531 (zeroValue!6233 (_2!7927 lt!460414)) lt!460515))))

(assert (=> b!1044272 (= (apply!904 (+!3135 lt!460524 (tuple2!15835 lt!460531 (zeroValue!6233 (_2!7927 lt!460414)))) lt!460515) (apply!904 lt!460524 lt!460515))))

(declare-fun lt!460530 () Unit!33989)

(assert (=> b!1044272 (= lt!460530 lt!460534)))

(declare-fun lt!460527 () ListLongMap!13849)

(assert (=> b!1044272 (= lt!460527 (getCurrentListMapNoExtraKeys!3570 (_keys!11659 (_2!7927 lt!460414)) (_values!6422 (_2!7927 lt!460414)) (mask!30501 (_2!7927 lt!460414)) (extraKeys!6127 (_2!7927 lt!460414)) (zeroValue!6233 (_2!7927 lt!460414)) (minValue!6233 (_2!7927 lt!460414)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7927 lt!460414))))))

(declare-fun lt!460536 () (_ BitVec 64))

(assert (=> b!1044272 (= lt!460536 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460517 () (_ BitVec 64))

(assert (=> b!1044272 (= lt!460517 (select (arr!31638 (_keys!11659 (_2!7927 lt!460414))) #b00000000000000000000000000000000))))

(assert (=> b!1044272 (= lt!460526 (addApplyDifferent!479 lt!460527 lt!460536 (minValue!6233 (_2!7927 lt!460414)) lt!460517))))

(assert (=> b!1044272 (= (apply!904 (+!3135 lt!460527 (tuple2!15835 lt!460536 (minValue!6233 (_2!7927 lt!460414)))) lt!460517) (apply!904 lt!460527 lt!460517))))

(declare-fun b!1044273 () Bool)

(declare-fun e!591808 () ListLongMap!13849)

(assert (=> b!1044273 (= e!591808 call!44335)))

(declare-fun b!1044274 () Bool)

(assert (=> b!1044274 (= e!591815 (= (apply!904 lt!460529 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6233 (_2!7927 lt!460414))))))

(declare-fun b!1044275 () Bool)

(assert (=> b!1044275 (= e!591807 (not call!44338))))

(declare-fun b!1044276 () Bool)

(declare-fun res!695551 () Bool)

(assert (=> b!1044276 (=> (not res!695551) (not e!591810))))

(declare-fun e!591809 () Bool)

(assert (=> b!1044276 (= res!695551 e!591809)))

(declare-fun res!695554 () Bool)

(assert (=> b!1044276 (=> res!695554 e!591809)))

(assert (=> b!1044276 (= res!695554 (not e!591811))))

(declare-fun res!695553 () Bool)

(assert (=> b!1044276 (=> (not res!695553) (not e!591811))))

(assert (=> b!1044276 (= res!695553 (bvslt #b00000000000000000000000000000000 (size!32175 (_keys!11659 (_2!7927 lt!460414)))))))

(declare-fun b!1044277 () Bool)

(declare-fun c!106060 () Bool)

(assert (=> b!1044277 (= c!106060 (and (not (= (bvand (extraKeys!6127 (_2!7927 lt!460414)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6127 (_2!7927 lt!460414)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1044277 (= e!591808 e!591816)))

(declare-fun b!1044278 () Bool)

(declare-fun Unit!33997 () Unit!33989)

(assert (=> b!1044278 (= e!591819 Unit!33997)))

(declare-fun bm!44336 () Bool)

(assert (=> bm!44336 (= call!44336 (contains!6049 lt!460529 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44337 () Bool)

(assert (=> bm!44337 (= call!44337 call!44340)))

(declare-fun bm!44338 () Bool)

(assert (=> bm!44338 (= call!44339 call!44337)))

(declare-fun b!1044279 () Bool)

(declare-fun e!591812 () Bool)

(assert (=> b!1044279 (= e!591812 (validKeyInArray!0 (select (arr!31638 (_keys!11659 (_2!7927 lt!460414))) #b00000000000000000000000000000000)))))

(declare-fun b!1044280 () Bool)

(declare-fun e!591814 () Bool)

(assert (=> b!1044280 (= e!591809 e!591814)))

(declare-fun res!695550 () Bool)

(assert (=> b!1044280 (=> (not res!695550) (not e!591814))))

(assert (=> b!1044280 (= res!695550 (contains!6049 lt!460529 (select (arr!31638 (_keys!11659 (_2!7927 lt!460414))) #b00000000000000000000000000000000)))))

(assert (=> b!1044280 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32175 (_keys!11659 (_2!7927 lt!460414)))))))

(declare-fun b!1044281 () Bool)

(assert (=> b!1044281 (= e!591817 e!591808)))

(assert (=> b!1044281 (= c!106061 (and (not (= (bvand (extraKeys!6127 (_2!7927 lt!460414)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6127 (_2!7927 lt!460414)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044282 () Bool)

(declare-fun e!591813 () Bool)

(assert (=> b!1044282 (= e!591813 (= (apply!904 lt!460529 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6233 (_2!7927 lt!460414))))))

(declare-fun b!1044283 () Bool)

(assert (=> b!1044283 (= e!591807 e!591813)))

(declare-fun res!695549 () Bool)

(assert (=> b!1044283 (= res!695549 call!44338)))

(assert (=> b!1044283 (=> (not res!695549) (not e!591813))))

(declare-fun b!1044268 () Bool)

(declare-fun get!16545 (ValueCell!11714 V!37987) V!37987)

(assert (=> b!1044268 (= e!591814 (= (apply!904 lt!460529 (select (arr!31638 (_keys!11659 (_2!7927 lt!460414))) #b00000000000000000000000000000000)) (get!16545 (select (arr!31639 (_values!6422 (_2!7927 lt!460414))) #b00000000000000000000000000000000) (dynLambda!1993 (defaultEntry!6399 (_2!7927 lt!460414)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044268 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32176 (_values!6422 (_2!7927 lt!460414)))))))

(assert (=> b!1044268 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32175 (_keys!11659 (_2!7927 lt!460414)))))))

(declare-fun d!126227 () Bool)

(assert (=> d!126227 e!591810))

(declare-fun res!695552 () Bool)

(assert (=> d!126227 (=> (not res!695552) (not e!591810))))

(assert (=> d!126227 (= res!695552 (or (bvsge #b00000000000000000000000000000000 (size!32175 (_keys!11659 (_2!7927 lt!460414)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32175 (_keys!11659 (_2!7927 lt!460414)))))))))

(declare-fun lt!460535 () ListLongMap!13849)

(assert (=> d!126227 (= lt!460529 lt!460535)))

(declare-fun lt!460528 () Unit!33989)

(assert (=> d!126227 (= lt!460528 e!591819)))

(declare-fun c!106059 () Bool)

(assert (=> d!126227 (= c!106059 e!591812)))

(declare-fun res!695555 () Bool)

(assert (=> d!126227 (=> (not res!695555) (not e!591812))))

(assert (=> d!126227 (= res!695555 (bvslt #b00000000000000000000000000000000 (size!32175 (_keys!11659 (_2!7927 lt!460414)))))))

(assert (=> d!126227 (= lt!460535 e!591817)))

(assert (=> d!126227 (= c!106057 (and (not (= (bvand (extraKeys!6127 (_2!7927 lt!460414)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6127 (_2!7927 lt!460414)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126227 (validMask!0 (mask!30501 (_2!7927 lt!460414)))))

(assert (=> d!126227 (= (getCurrentListMap!3906 (_keys!11659 (_2!7927 lt!460414)) (_values!6422 (_2!7927 lt!460414)) (mask!30501 (_2!7927 lt!460414)) (extraKeys!6127 (_2!7927 lt!460414)) (zeroValue!6233 (_2!7927 lt!460414)) (minValue!6233 (_2!7927 lt!460414)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7927 lt!460414))) lt!460529)))

(assert (= (and d!126227 c!106057) b!1044270))

(assert (= (and d!126227 (not c!106057)) b!1044281))

(assert (= (and b!1044281 c!106061) b!1044273))

(assert (= (and b!1044281 (not c!106061)) b!1044277))

(assert (= (and b!1044277 c!106060) b!1044265))

(assert (= (and b!1044277 (not c!106060)) b!1044263))

(assert (= (or b!1044265 b!1044263) bm!44338))

(assert (= (or b!1044273 bm!44338) bm!44337))

(assert (= (or b!1044273 b!1044265) bm!44332))

(assert (= (or b!1044270 bm!44337) bm!44335))

(assert (= (or b!1044270 bm!44332) bm!44333))

(assert (= (and d!126227 res!695555) b!1044279))

(assert (= (and d!126227 c!106059) b!1044272))

(assert (= (and d!126227 (not c!106059)) b!1044278))

(assert (= (and d!126227 res!695552) b!1044276))

(assert (= (and b!1044276 res!695553) b!1044271))

(assert (= (and b!1044276 (not res!695554)) b!1044280))

(assert (= (and b!1044280 res!695550) b!1044268))

(assert (= (and b!1044276 res!695551) b!1044267))

(assert (= (and b!1044267 c!106058) b!1044266))

(assert (= (and b!1044267 (not c!106058)) b!1044264))

(assert (= (and b!1044266 res!695547) b!1044274))

(assert (= (or b!1044266 b!1044264) bm!44336))

(assert (= (and b!1044267 res!695548) b!1044269))

(assert (= (and b!1044269 c!106056) b!1044283))

(assert (= (and b!1044269 (not c!106056)) b!1044275))

(assert (= (and b!1044283 res!695549) b!1044282))

(assert (= (or b!1044283 b!1044275) bm!44334))

(declare-fun b_lambda!16205 () Bool)

(assert (=> (not b_lambda!16205) (not b!1044268)))

(declare-fun t!31278 () Bool)

(declare-fun tb!7055 () Bool)

(assert (=> (and b!1044158 (= (defaultEntry!6399 thiss!1427) (defaultEntry!6399 (_2!7927 lt!460414))) t!31278) tb!7055))

(declare-fun result!14543 () Bool)

(assert (=> tb!7055 (= result!14543 tp_is_empty!24835)))

(assert (=> b!1044268 t!31278))

(declare-fun b_and!33671 () Bool)

(assert (= b_and!33661 (and (=> t!31278 result!14543) b_and!33671)))

(assert (=> d!126227 m!963119))

(declare-fun m!963225 () Bool)

(assert (=> bm!44334 m!963225))

(declare-fun m!963227 () Bool)

(assert (=> b!1044271 m!963227))

(assert (=> b!1044271 m!963227))

(declare-fun m!963229 () Bool)

(assert (=> b!1044271 m!963229))

(declare-fun m!963231 () Bool)

(assert (=> b!1044270 m!963231))

(declare-fun m!963233 () Bool)

(assert (=> bm!44335 m!963233))

(assert (=> b!1044280 m!963227))

(assert (=> b!1044280 m!963227))

(declare-fun m!963235 () Bool)

(assert (=> b!1044280 m!963235))

(declare-fun m!963237 () Bool)

(assert (=> b!1044282 m!963237))

(declare-fun m!963239 () Bool)

(assert (=> b!1044272 m!963239))

(declare-fun m!963241 () Bool)

(assert (=> b!1044272 m!963241))

(declare-fun m!963243 () Bool)

(assert (=> b!1044272 m!963243))

(declare-fun m!963245 () Bool)

(assert (=> b!1044272 m!963245))

(assert (=> b!1044272 m!963233))

(declare-fun m!963247 () Bool)

(assert (=> b!1044272 m!963247))

(declare-fun m!963249 () Bool)

(assert (=> b!1044272 m!963249))

(declare-fun m!963251 () Bool)

(assert (=> b!1044272 m!963251))

(declare-fun m!963253 () Bool)

(assert (=> b!1044272 m!963253))

(declare-fun m!963255 () Bool)

(assert (=> b!1044272 m!963255))

(declare-fun m!963257 () Bool)

(assert (=> b!1044272 m!963257))

(declare-fun m!963259 () Bool)

(assert (=> b!1044272 m!963259))

(assert (=> b!1044272 m!963247))

(declare-fun m!963261 () Bool)

(assert (=> b!1044272 m!963261))

(declare-fun m!963263 () Bool)

(assert (=> b!1044272 m!963263))

(assert (=> b!1044272 m!963241))

(assert (=> b!1044272 m!963253))

(declare-fun m!963265 () Bool)

(assert (=> b!1044272 m!963265))

(assert (=> b!1044272 m!963245))

(declare-fun m!963267 () Bool)

(assert (=> b!1044272 m!963267))

(assert (=> b!1044272 m!963227))

(declare-fun m!963269 () Bool)

(assert (=> bm!44336 m!963269))

(declare-fun m!963271 () Bool)

(assert (=> b!1044268 m!963271))

(declare-fun m!963273 () Bool)

(assert (=> b!1044268 m!963273))

(assert (=> b!1044268 m!963227))

(assert (=> b!1044268 m!963227))

(declare-fun m!963275 () Bool)

(assert (=> b!1044268 m!963275))

(assert (=> b!1044268 m!963271))

(assert (=> b!1044268 m!963273))

(declare-fun m!963277 () Bool)

(assert (=> b!1044268 m!963277))

(declare-fun m!963279 () Bool)

(assert (=> bm!44333 m!963279))

(declare-fun m!963281 () Bool)

(assert (=> b!1044274 m!963281))

(assert (=> b!1044279 m!963227))

(assert (=> b!1044279 m!963227))

(assert (=> b!1044279 m!963229))

(assert (=> b!1044160 d!126227))

(declare-fun d!126229 () Bool)

(declare-fun e!591822 () Bool)

(assert (=> d!126229 e!591822))

(declare-fun res!695558 () Bool)

(assert (=> d!126229 (=> (not res!695558) (not e!591822))))

(assert (=> d!126229 (= res!695558 (and (bvsge (index!41732 lt!460410) #b00000000000000000000000000000000) (bvslt (index!41732 lt!460410) (size!32175 (_keys!11659 thiss!1427)))))))

(declare-fun lt!460539 () Unit!33989)

(declare-fun choose!25 (array!65777 (_ BitVec 32) (_ BitVec 32)) Unit!33989)

(assert (=> d!126229 (= lt!460539 (choose!25 (_keys!11659 thiss!1427) (index!41732 lt!460410) (mask!30501 thiss!1427)))))

(assert (=> d!126229 (validMask!0 (mask!30501 thiss!1427))))

(assert (=> d!126229 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11659 thiss!1427) (index!41732 lt!460410) (mask!30501 thiss!1427)) lt!460539)))

(declare-fun b!1044286 () Bool)

(assert (=> b!1044286 (= e!591822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65778 (store (arr!31638 (_keys!11659 thiss!1427)) (index!41732 lt!460410) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32175 (_keys!11659 thiss!1427))) (mask!30501 thiss!1427)))))

(assert (= (and d!126229 res!695558) b!1044286))

(declare-fun m!963283 () Bool)

(assert (=> d!126229 m!963283))

(declare-fun m!963285 () Bool)

(assert (=> d!126229 m!963285))

(assert (=> b!1044286 m!963087))

(declare-fun m!963287 () Bool)

(assert (=> b!1044286 m!963287))

(assert (=> b!1044160 d!126229))

(declare-fun d!126231 () Bool)

(declare-fun e!591825 () Bool)

(assert (=> d!126231 e!591825))

(declare-fun res!695561 () Bool)

(assert (=> d!126231 (=> (not res!695561) (not e!591825))))

(assert (=> d!126231 (= res!695561 (and (bvsge (index!41732 lt!460410) #b00000000000000000000000000000000) (bvslt (index!41732 lt!460410) (size!32175 (_keys!11659 thiss!1427)))))))

(declare-fun lt!460542 () Unit!33989)

(declare-fun choose!53 (array!65777 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22043) Unit!33989)

(assert (=> d!126231 (= lt!460542 (choose!53 (_keys!11659 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41732 lt!460410) #b00000000000000000000000000000000 Nil!22040))))

(assert (=> d!126231 (bvslt (size!32175 (_keys!11659 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126231 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11659 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41732 lt!460410) #b00000000000000000000000000000000 Nil!22040) lt!460542)))

(declare-fun b!1044289 () Bool)

(assert (=> b!1044289 (= e!591825 (arrayNoDuplicates!0 (array!65778 (store (arr!31638 (_keys!11659 thiss!1427)) (index!41732 lt!460410) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32175 (_keys!11659 thiss!1427))) #b00000000000000000000000000000000 Nil!22040))))

(assert (= (and d!126231 res!695561) b!1044289))

(declare-fun m!963289 () Bool)

(assert (=> d!126231 m!963289))

(assert (=> b!1044289 m!963087))

(declare-fun m!963291 () Bool)

(assert (=> b!1044289 m!963291))

(assert (=> b!1044160 d!126231))

(declare-fun d!126233 () Bool)

(declare-fun lt!460545 () ListLongMap!13849)

(assert (=> d!126233 (not (contains!6049 lt!460545 key!909))))

(declare-fun removeStrictlySorted!61 (List!22042 (_ BitVec 64)) List!22042)

(assert (=> d!126233 (= lt!460545 (ListLongMap!13850 (removeStrictlySorted!61 (toList!6940 (getCurrentListMap!3906 (_keys!11659 thiss!1427) (_values!6422 thiss!1427) (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427))) key!909)))))

(assert (=> d!126233 (= (-!532 (getCurrentListMap!3906 (_keys!11659 thiss!1427) (_values!6422 thiss!1427) (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)) key!909) lt!460545)))

(declare-fun bs!30486 () Bool)

(assert (= bs!30486 d!126233))

(declare-fun m!963293 () Bool)

(assert (=> bs!30486 m!963293))

(declare-fun m!963295 () Bool)

(assert (=> bs!30486 m!963295))

(assert (=> b!1044160 d!126233))

(declare-fun d!126235 () Bool)

(declare-fun e!591828 () Bool)

(assert (=> d!126235 e!591828))

(declare-fun res!695564 () Bool)

(assert (=> d!126235 (=> (not res!695564) (not e!591828))))

(assert (=> d!126235 (= res!695564 (bvslt (index!41732 lt!460410) (size!32175 (_keys!11659 thiss!1427))))))

(declare-fun lt!460548 () Unit!33989)

(declare-fun choose!121 (array!65777 (_ BitVec 32) (_ BitVec 64)) Unit!33989)

(assert (=> d!126235 (= lt!460548 (choose!121 (_keys!11659 thiss!1427) (index!41732 lt!460410) key!909))))

(assert (=> d!126235 (bvsge (index!41732 lt!460410) #b00000000000000000000000000000000)))

(assert (=> d!126235 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11659 thiss!1427) (index!41732 lt!460410) key!909) lt!460548)))

(declare-fun b!1044292 () Bool)

(assert (=> b!1044292 (= e!591828 (not (arrayContainsKey!0 (array!65778 (store (arr!31638 (_keys!11659 thiss!1427)) (index!41732 lt!460410) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32175 (_keys!11659 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126235 res!695564) b!1044292))

(declare-fun m!963297 () Bool)

(assert (=> d!126235 m!963297))

(assert (=> b!1044292 m!963087))

(declare-fun m!963299 () Bool)

(assert (=> b!1044292 m!963299))

(assert (=> b!1044160 d!126235))

(declare-fun b!1044301 () Bool)

(declare-fun e!591834 () (_ BitVec 32))

(declare-fun e!591833 () (_ BitVec 32))

(assert (=> b!1044301 (= e!591834 e!591833)))

(declare-fun c!106066 () Bool)

(assert (=> b!1044301 (= c!106066 (validKeyInArray!0 (select (arr!31638 lt!460411) #b00000000000000000000000000000000)))))

(declare-fun d!126237 () Bool)

(declare-fun lt!460551 () (_ BitVec 32))

(assert (=> d!126237 (and (bvsge lt!460551 #b00000000000000000000000000000000) (bvsle lt!460551 (bvsub (size!32175 lt!460411) #b00000000000000000000000000000000)))))

(assert (=> d!126237 (= lt!460551 e!591834)))

(declare-fun c!106067 () Bool)

(assert (=> d!126237 (= c!106067 (bvsge #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))))))

(assert (=> d!126237 (and (bvsle #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32175 (_keys!11659 thiss!1427)) (size!32175 lt!460411)))))

(assert (=> d!126237 (= (arrayCountValidKeys!0 lt!460411 #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))) lt!460551)))

(declare-fun b!1044302 () Bool)

(assert (=> b!1044302 (= e!591834 #b00000000000000000000000000000000)))

(declare-fun b!1044303 () Bool)

(declare-fun call!44344 () (_ BitVec 32))

(assert (=> b!1044303 (= e!591833 (bvadd #b00000000000000000000000000000001 call!44344))))

(declare-fun b!1044304 () Bool)

(assert (=> b!1044304 (= e!591833 call!44344)))

(declare-fun bm!44341 () Bool)

(assert (=> bm!44341 (= call!44344 (arrayCountValidKeys!0 lt!460411 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32175 (_keys!11659 thiss!1427))))))

(assert (= (and d!126237 c!106067) b!1044302))

(assert (= (and d!126237 (not c!106067)) b!1044301))

(assert (= (and b!1044301 c!106066) b!1044303))

(assert (= (and b!1044301 (not c!106066)) b!1044304))

(assert (= (or b!1044303 b!1044304) bm!44341))

(declare-fun m!963301 () Bool)

(assert (=> b!1044301 m!963301))

(assert (=> b!1044301 m!963301))

(declare-fun m!963303 () Bool)

(assert (=> b!1044301 m!963303))

(declare-fun m!963305 () Bool)

(assert (=> bm!44341 m!963305))

(assert (=> b!1044160 d!126237))

(declare-fun b!1044305 () Bool)

(declare-fun e!591836 () (_ BitVec 32))

(declare-fun e!591835 () (_ BitVec 32))

(assert (=> b!1044305 (= e!591836 e!591835)))

(declare-fun c!106068 () Bool)

(assert (=> b!1044305 (= c!106068 (validKeyInArray!0 (select (arr!31638 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!126239 () Bool)

(declare-fun lt!460552 () (_ BitVec 32))

(assert (=> d!126239 (and (bvsge lt!460552 #b00000000000000000000000000000000) (bvsle lt!460552 (bvsub (size!32175 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126239 (= lt!460552 e!591836)))

(declare-fun c!106069 () Bool)

(assert (=> d!126239 (= c!106069 (bvsge #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))))))

(assert (=> d!126239 (and (bvsle #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32175 (_keys!11659 thiss!1427)) (size!32175 (_keys!11659 thiss!1427))))))

(assert (=> d!126239 (= (arrayCountValidKeys!0 (_keys!11659 thiss!1427) #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))) lt!460552)))

(declare-fun b!1044306 () Bool)

(assert (=> b!1044306 (= e!591836 #b00000000000000000000000000000000)))

(declare-fun b!1044307 () Bool)

(declare-fun call!44345 () (_ BitVec 32))

(assert (=> b!1044307 (= e!591835 (bvadd #b00000000000000000000000000000001 call!44345))))

(declare-fun b!1044308 () Bool)

(assert (=> b!1044308 (= e!591835 call!44345)))

(declare-fun bm!44342 () Bool)

(assert (=> bm!44342 (= call!44345 (arrayCountValidKeys!0 (_keys!11659 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32175 (_keys!11659 thiss!1427))))))

(assert (= (and d!126239 c!106069) b!1044306))

(assert (= (and d!126239 (not c!106069)) b!1044305))

(assert (= (and b!1044305 c!106068) b!1044307))

(assert (= (and b!1044305 (not c!106068)) b!1044308))

(assert (= (or b!1044307 b!1044308) bm!44342))

(declare-fun m!963307 () Bool)

(assert (=> b!1044305 m!963307))

(assert (=> b!1044305 m!963307))

(declare-fun m!963309 () Bool)

(assert (=> b!1044305 m!963309))

(declare-fun m!963311 () Bool)

(assert (=> bm!44342 m!963311))

(assert (=> b!1044160 d!126239))

(declare-fun b!1044320 () Bool)

(declare-fun e!591841 () Bool)

(assert (=> b!1044320 (= e!591841 (= (arrayCountValidKeys!0 (array!65778 (store (arr!31638 (_keys!11659 thiss!1427)) (index!41732 lt!460410) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32175 (_keys!11659 thiss!1427))) #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11659 thiss!1427) #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1044319 () Bool)

(declare-fun e!591842 () Bool)

(assert (=> b!1044319 (= e!591842 (bvslt (size!32175 (_keys!11659 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1044317 () Bool)

(declare-fun res!695575 () Bool)

(assert (=> b!1044317 (=> (not res!695575) (not e!591842))))

(assert (=> b!1044317 (= res!695575 (validKeyInArray!0 (select (arr!31638 (_keys!11659 thiss!1427)) (index!41732 lt!460410))))))

(declare-fun b!1044318 () Bool)

(declare-fun res!695576 () Bool)

(assert (=> b!1044318 (=> (not res!695576) (not e!591842))))

(assert (=> b!1044318 (= res!695576 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!126241 () Bool)

(assert (=> d!126241 e!591841))

(declare-fun res!695573 () Bool)

(assert (=> d!126241 (=> (not res!695573) (not e!591841))))

(assert (=> d!126241 (= res!695573 (and (bvsge (index!41732 lt!460410) #b00000000000000000000000000000000) (bvslt (index!41732 lt!460410) (size!32175 (_keys!11659 thiss!1427)))))))

(declare-fun lt!460555 () Unit!33989)

(declare-fun choose!82 (array!65777 (_ BitVec 32) (_ BitVec 64)) Unit!33989)

(assert (=> d!126241 (= lt!460555 (choose!82 (_keys!11659 thiss!1427) (index!41732 lt!460410) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126241 e!591842))

(declare-fun res!695574 () Bool)

(assert (=> d!126241 (=> (not res!695574) (not e!591842))))

(assert (=> d!126241 (= res!695574 (and (bvsge (index!41732 lt!460410) #b00000000000000000000000000000000) (bvslt (index!41732 lt!460410) (size!32175 (_keys!11659 thiss!1427)))))))

(assert (=> d!126241 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11659 thiss!1427) (index!41732 lt!460410) #b1000000000000000000000000000000000000000000000000000000000000000) lt!460555)))

(assert (= (and d!126241 res!695574) b!1044317))

(assert (= (and b!1044317 res!695575) b!1044318))

(assert (= (and b!1044318 res!695576) b!1044319))

(assert (= (and d!126241 res!695573) b!1044320))

(assert (=> b!1044320 m!963087))

(declare-fun m!963313 () Bool)

(assert (=> b!1044320 m!963313))

(assert (=> b!1044320 m!963093))

(declare-fun m!963315 () Bool)

(assert (=> b!1044317 m!963315))

(assert (=> b!1044317 m!963315))

(declare-fun m!963317 () Bool)

(assert (=> b!1044317 m!963317))

(declare-fun m!963319 () Bool)

(assert (=> b!1044318 m!963319))

(declare-fun m!963321 () Bool)

(assert (=> d!126241 m!963321))

(assert (=> b!1044160 d!126241))

(declare-fun b!1044321 () Bool)

(declare-fun e!591852 () ListLongMap!13849)

(declare-fun call!44350 () ListLongMap!13849)

(assert (=> b!1044321 (= e!591852 call!44350)))

(declare-fun b!1044322 () Bool)

(declare-fun e!591854 () Bool)

(declare-fun call!44347 () Bool)

(assert (=> b!1044322 (= e!591854 (not call!44347))))

(declare-fun b!1044323 () Bool)

(declare-fun call!44346 () ListLongMap!13849)

(assert (=> b!1044323 (= e!591852 call!44346)))

(declare-fun b!1044324 () Bool)

(declare-fun e!591851 () Bool)

(assert (=> b!1044324 (= e!591854 e!591851)))

(declare-fun res!695577 () Bool)

(assert (=> b!1044324 (= res!695577 call!44347)))

(assert (=> b!1044324 (=> (not res!695577) (not e!591851))))

(declare-fun b!1044325 () Bool)

(declare-fun res!695578 () Bool)

(declare-fun e!591846 () Bool)

(assert (=> b!1044325 (=> (not res!695578) (not e!591846))))

(assert (=> b!1044325 (= res!695578 e!591854)))

(declare-fun c!106072 () Bool)

(assert (=> b!1044325 (= c!106072 (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1044327 () Bool)

(declare-fun e!591843 () Bool)

(assert (=> b!1044327 (= e!591846 e!591843)))

(declare-fun c!106070 () Bool)

(assert (=> b!1044327 (= c!106070 (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044328 () Bool)

(declare-fun e!591853 () ListLongMap!13849)

(declare-fun call!44352 () ListLongMap!13849)

(assert (=> b!1044328 (= e!591853 (+!3135 call!44352 (tuple2!15835 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6233 thiss!1427))))))

(declare-fun b!1044329 () Bool)

(declare-fun e!591847 () Bool)

(assert (=> b!1044329 (= e!591847 (validKeyInArray!0 (select (arr!31638 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44343 () Bool)

(assert (=> bm!44343 (= call!44346 call!44352)))

(declare-fun bm!44344 () Bool)

(declare-fun call!44351 () ListLongMap!13849)

(declare-fun c!106075 () Bool)

(declare-fun call!44348 () ListLongMap!13849)

(declare-fun c!106071 () Bool)

(assert (=> bm!44344 (= call!44352 (+!3135 (ite c!106071 call!44351 (ite c!106075 call!44348 call!44350)) (ite (or c!106071 c!106075) (tuple2!15835 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6233 thiss!1427)) (tuple2!15835 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6233 thiss!1427)))))))

(declare-fun bm!44345 () Bool)

(declare-fun call!44349 () Bool)

(declare-fun lt!460570 () ListLongMap!13849)

(assert (=> bm!44345 (= call!44349 (contains!6049 lt!460570 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44346 () Bool)

(assert (=> bm!44346 (= call!44351 (getCurrentListMapNoExtraKeys!3570 (_keys!11659 thiss!1427) (_values!6422 thiss!1427) (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun b!1044330 () Bool)

(declare-fun e!591855 () Unit!33989)

(declare-fun lt!460567 () Unit!33989)

(assert (=> b!1044330 (= e!591855 lt!460567)))

(declare-fun lt!460557 () ListLongMap!13849)

(assert (=> b!1044330 (= lt!460557 (getCurrentListMapNoExtraKeys!3570 (_keys!11659 thiss!1427) (_values!6422 thiss!1427) (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun lt!460559 () (_ BitVec 64))

(assert (=> b!1044330 (= lt!460559 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460562 () (_ BitVec 64))

(assert (=> b!1044330 (= lt!460562 (select (arr!31638 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460573 () Unit!33989)

(assert (=> b!1044330 (= lt!460573 (addStillContains!623 lt!460557 lt!460559 (zeroValue!6233 thiss!1427) lt!460562))))

(assert (=> b!1044330 (contains!6049 (+!3135 lt!460557 (tuple2!15835 lt!460559 (zeroValue!6233 thiss!1427))) lt!460562)))

(declare-fun lt!460564 () Unit!33989)

(assert (=> b!1044330 (= lt!460564 lt!460573)))

(declare-fun lt!460566 () ListLongMap!13849)

(assert (=> b!1044330 (= lt!460566 (getCurrentListMapNoExtraKeys!3570 (_keys!11659 thiss!1427) (_values!6422 thiss!1427) (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun lt!460574 () (_ BitVec 64))

(assert (=> b!1044330 (= lt!460574 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460563 () (_ BitVec 64))

(assert (=> b!1044330 (= lt!460563 (select (arr!31638 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460560 () Unit!33989)

(assert (=> b!1044330 (= lt!460560 (addApplyDifferent!479 lt!460566 lt!460574 (minValue!6233 thiss!1427) lt!460563))))

(assert (=> b!1044330 (= (apply!904 (+!3135 lt!460566 (tuple2!15835 lt!460574 (minValue!6233 thiss!1427))) lt!460563) (apply!904 lt!460566 lt!460563))))

(declare-fun lt!460561 () Unit!33989)

(assert (=> b!1044330 (= lt!460561 lt!460560)))

(declare-fun lt!460565 () ListLongMap!13849)

(assert (=> b!1044330 (= lt!460565 (getCurrentListMapNoExtraKeys!3570 (_keys!11659 thiss!1427) (_values!6422 thiss!1427) (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun lt!460572 () (_ BitVec 64))

(assert (=> b!1044330 (= lt!460572 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460556 () (_ BitVec 64))

(assert (=> b!1044330 (= lt!460556 (select (arr!31638 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460575 () Unit!33989)

(assert (=> b!1044330 (= lt!460575 (addApplyDifferent!479 lt!460565 lt!460572 (zeroValue!6233 thiss!1427) lt!460556))))

(assert (=> b!1044330 (= (apply!904 (+!3135 lt!460565 (tuple2!15835 lt!460572 (zeroValue!6233 thiss!1427))) lt!460556) (apply!904 lt!460565 lt!460556))))

(declare-fun lt!460571 () Unit!33989)

(assert (=> b!1044330 (= lt!460571 lt!460575)))

(declare-fun lt!460568 () ListLongMap!13849)

(assert (=> b!1044330 (= lt!460568 (getCurrentListMapNoExtraKeys!3570 (_keys!11659 thiss!1427) (_values!6422 thiss!1427) (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun lt!460577 () (_ BitVec 64))

(assert (=> b!1044330 (= lt!460577 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460558 () (_ BitVec 64))

(assert (=> b!1044330 (= lt!460558 (select (arr!31638 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044330 (= lt!460567 (addApplyDifferent!479 lt!460568 lt!460577 (minValue!6233 thiss!1427) lt!460558))))

(assert (=> b!1044330 (= (apply!904 (+!3135 lt!460568 (tuple2!15835 lt!460577 (minValue!6233 thiss!1427))) lt!460558) (apply!904 lt!460568 lt!460558))))

(declare-fun b!1044331 () Bool)

(declare-fun e!591844 () ListLongMap!13849)

(assert (=> b!1044331 (= e!591844 call!44346)))

(declare-fun b!1044332 () Bool)

(assert (=> b!1044332 (= e!591851 (= (apply!904 lt!460570 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6233 thiss!1427)))))

(declare-fun b!1044333 () Bool)

(assert (=> b!1044333 (= e!591843 (not call!44349))))

(declare-fun b!1044334 () Bool)

(declare-fun res!695581 () Bool)

(assert (=> b!1044334 (=> (not res!695581) (not e!591846))))

(declare-fun e!591845 () Bool)

(assert (=> b!1044334 (= res!695581 e!591845)))

(declare-fun res!695584 () Bool)

(assert (=> b!1044334 (=> res!695584 e!591845)))

(assert (=> b!1044334 (= res!695584 (not e!591847))))

(declare-fun res!695583 () Bool)

(assert (=> b!1044334 (=> (not res!695583) (not e!591847))))

(assert (=> b!1044334 (= res!695583 (bvslt #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))))))

(declare-fun b!1044335 () Bool)

(declare-fun c!106074 () Bool)

(assert (=> b!1044335 (= c!106074 (and (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1044335 (= e!591844 e!591852)))

(declare-fun b!1044336 () Bool)

(declare-fun Unit!33998 () Unit!33989)

(assert (=> b!1044336 (= e!591855 Unit!33998)))

(declare-fun bm!44347 () Bool)

(assert (=> bm!44347 (= call!44347 (contains!6049 lt!460570 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44348 () Bool)

(assert (=> bm!44348 (= call!44348 call!44351)))

(declare-fun bm!44349 () Bool)

(assert (=> bm!44349 (= call!44350 call!44348)))

(declare-fun b!1044337 () Bool)

(declare-fun e!591848 () Bool)

(assert (=> b!1044337 (= e!591848 (validKeyInArray!0 (select (arr!31638 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1044338 () Bool)

(declare-fun e!591850 () Bool)

(assert (=> b!1044338 (= e!591845 e!591850)))

(declare-fun res!695580 () Bool)

(assert (=> b!1044338 (=> (not res!695580) (not e!591850))))

(assert (=> b!1044338 (= res!695580 (contains!6049 lt!460570 (select (arr!31638 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1044338 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))))))

(declare-fun b!1044339 () Bool)

(assert (=> b!1044339 (= e!591853 e!591844)))

(assert (=> b!1044339 (= c!106075 (and (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044340 () Bool)

(declare-fun e!591849 () Bool)

(assert (=> b!1044340 (= e!591849 (= (apply!904 lt!460570 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6233 thiss!1427)))))

(declare-fun b!1044341 () Bool)

(assert (=> b!1044341 (= e!591843 e!591849)))

(declare-fun res!695579 () Bool)

(assert (=> b!1044341 (= res!695579 call!44349)))

(assert (=> b!1044341 (=> (not res!695579) (not e!591849))))

(declare-fun b!1044326 () Bool)

(assert (=> b!1044326 (= e!591850 (= (apply!904 lt!460570 (select (arr!31638 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000)) (get!16545 (select (arr!31639 (_values!6422 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1993 (defaultEntry!6399 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044326 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32176 (_values!6422 thiss!1427))))))

(assert (=> b!1044326 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))))))

(declare-fun d!126243 () Bool)

(assert (=> d!126243 e!591846))

(declare-fun res!695582 () Bool)

(assert (=> d!126243 (=> (not res!695582) (not e!591846))))

(assert (=> d!126243 (= res!695582 (or (bvsge #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))))))))

(declare-fun lt!460576 () ListLongMap!13849)

(assert (=> d!126243 (= lt!460570 lt!460576)))

(declare-fun lt!460569 () Unit!33989)

(assert (=> d!126243 (= lt!460569 e!591855)))

(declare-fun c!106073 () Bool)

(assert (=> d!126243 (= c!106073 e!591848)))

(declare-fun res!695585 () Bool)

(assert (=> d!126243 (=> (not res!695585) (not e!591848))))

(assert (=> d!126243 (= res!695585 (bvslt #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))))))

(assert (=> d!126243 (= lt!460576 e!591853)))

(assert (=> d!126243 (= c!106071 (and (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126243 (validMask!0 (mask!30501 thiss!1427))))

(assert (=> d!126243 (= (getCurrentListMap!3906 (_keys!11659 thiss!1427) (_values!6422 thiss!1427) (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)) lt!460570)))

(assert (= (and d!126243 c!106071) b!1044328))

(assert (= (and d!126243 (not c!106071)) b!1044339))

(assert (= (and b!1044339 c!106075) b!1044331))

(assert (= (and b!1044339 (not c!106075)) b!1044335))

(assert (= (and b!1044335 c!106074) b!1044323))

(assert (= (and b!1044335 (not c!106074)) b!1044321))

(assert (= (or b!1044323 b!1044321) bm!44349))

(assert (= (or b!1044331 bm!44349) bm!44348))

(assert (= (or b!1044331 b!1044323) bm!44343))

(assert (= (or b!1044328 bm!44348) bm!44346))

(assert (= (or b!1044328 bm!44343) bm!44344))

(assert (= (and d!126243 res!695585) b!1044337))

(assert (= (and d!126243 c!106073) b!1044330))

(assert (= (and d!126243 (not c!106073)) b!1044336))

(assert (= (and d!126243 res!695582) b!1044334))

(assert (= (and b!1044334 res!695583) b!1044329))

(assert (= (and b!1044334 (not res!695584)) b!1044338))

(assert (= (and b!1044338 res!695580) b!1044326))

(assert (= (and b!1044334 res!695581) b!1044325))

(assert (= (and b!1044325 c!106072) b!1044324))

(assert (= (and b!1044325 (not c!106072)) b!1044322))

(assert (= (and b!1044324 res!695577) b!1044332))

(assert (= (or b!1044324 b!1044322) bm!44347))

(assert (= (and b!1044325 res!695578) b!1044327))

(assert (= (and b!1044327 c!106070) b!1044341))

(assert (= (and b!1044327 (not c!106070)) b!1044333))

(assert (= (and b!1044341 res!695579) b!1044340))

(assert (= (or b!1044341 b!1044333) bm!44345))

(declare-fun b_lambda!16207 () Bool)

(assert (=> (not b_lambda!16207) (not b!1044326)))

(assert (=> b!1044326 t!31268))

(declare-fun b_and!33673 () Bool)

(assert (= b_and!33671 (and (=> t!31268 result!14531) b_and!33673)))

(assert (=> d!126243 m!963285))

(declare-fun m!963323 () Bool)

(assert (=> bm!44345 m!963323))

(assert (=> b!1044329 m!963307))

(assert (=> b!1044329 m!963307))

(assert (=> b!1044329 m!963309))

(declare-fun m!963325 () Bool)

(assert (=> b!1044328 m!963325))

(declare-fun m!963327 () Bool)

(assert (=> bm!44346 m!963327))

(assert (=> b!1044338 m!963307))

(assert (=> b!1044338 m!963307))

(declare-fun m!963329 () Bool)

(assert (=> b!1044338 m!963329))

(declare-fun m!963331 () Bool)

(assert (=> b!1044340 m!963331))

(declare-fun m!963333 () Bool)

(assert (=> b!1044330 m!963333))

(declare-fun m!963335 () Bool)

(assert (=> b!1044330 m!963335))

(declare-fun m!963337 () Bool)

(assert (=> b!1044330 m!963337))

(declare-fun m!963339 () Bool)

(assert (=> b!1044330 m!963339))

(assert (=> b!1044330 m!963327))

(declare-fun m!963341 () Bool)

(assert (=> b!1044330 m!963341))

(declare-fun m!963343 () Bool)

(assert (=> b!1044330 m!963343))

(declare-fun m!963345 () Bool)

(assert (=> b!1044330 m!963345))

(declare-fun m!963347 () Bool)

(assert (=> b!1044330 m!963347))

(declare-fun m!963349 () Bool)

(assert (=> b!1044330 m!963349))

(declare-fun m!963351 () Bool)

(assert (=> b!1044330 m!963351))

(declare-fun m!963353 () Bool)

(assert (=> b!1044330 m!963353))

(assert (=> b!1044330 m!963341))

(declare-fun m!963355 () Bool)

(assert (=> b!1044330 m!963355))

(declare-fun m!963357 () Bool)

(assert (=> b!1044330 m!963357))

(assert (=> b!1044330 m!963335))

(assert (=> b!1044330 m!963347))

(declare-fun m!963359 () Bool)

(assert (=> b!1044330 m!963359))

(assert (=> b!1044330 m!963339))

(declare-fun m!963361 () Bool)

(assert (=> b!1044330 m!963361))

(assert (=> b!1044330 m!963307))

(declare-fun m!963363 () Bool)

(assert (=> bm!44347 m!963363))

(declare-fun m!963365 () Bool)

(assert (=> b!1044326 m!963365))

(assert (=> b!1044326 m!963115))

(assert (=> b!1044326 m!963307))

(assert (=> b!1044326 m!963307))

(declare-fun m!963367 () Bool)

(assert (=> b!1044326 m!963367))

(assert (=> b!1044326 m!963365))

(assert (=> b!1044326 m!963115))

(declare-fun m!963369 () Bool)

(assert (=> b!1044326 m!963369))

(declare-fun m!963371 () Bool)

(assert (=> bm!44344 m!963371))

(declare-fun m!963373 () Bool)

(assert (=> b!1044332 m!963373))

(assert (=> b!1044337 m!963307))

(assert (=> b!1044337 m!963307))

(assert (=> b!1044337 m!963309))

(assert (=> b!1044160 d!126243))

(declare-fun d!126245 () Bool)

(declare-fun e!591858 () Bool)

(assert (=> d!126245 e!591858))

(declare-fun res!695588 () Bool)

(assert (=> d!126245 (=> (not res!695588) (not e!591858))))

(assert (=> d!126245 (= res!695588 (and (bvsge (index!41732 lt!460410) #b00000000000000000000000000000000) (bvslt (index!41732 lt!460410) (size!32175 (_keys!11659 thiss!1427)))))))

(declare-fun lt!460580 () Unit!33989)

(declare-fun choose!1718 (array!65777 array!65779 (_ BitVec 32) (_ BitVec 32) V!37987 V!37987 (_ BitVec 32) (_ BitVec 64) Int) Unit!33989)

(assert (=> d!126245 (= lt!460580 (choose!1718 (_keys!11659 thiss!1427) (_values!6422 thiss!1427) (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) (index!41732 lt!460410) key!909 (defaultEntry!6399 thiss!1427)))))

(assert (=> d!126245 (validMask!0 (mask!30501 thiss!1427))))

(assert (=> d!126245 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!54 (_keys!11659 thiss!1427) (_values!6422 thiss!1427) (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) (index!41732 lt!460410) key!909 (defaultEntry!6399 thiss!1427)) lt!460580)))

(declare-fun b!1044344 () Bool)

(assert (=> b!1044344 (= e!591858 (= (-!532 (getCurrentListMap!3906 (_keys!11659 thiss!1427) (_values!6422 thiss!1427) (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)) key!909) (getCurrentListMap!3906 (array!65778 (store (arr!31638 (_keys!11659 thiss!1427)) (index!41732 lt!460410) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32175 (_keys!11659 thiss!1427))) (array!65780 (store (arr!31639 (_values!6422 thiss!1427)) (index!41732 lt!460410) (ValueCellFull!11714 (dynLambda!1993 (defaultEntry!6399 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32176 (_values!6422 thiss!1427))) (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427))))))

(assert (=> b!1044344 (bvslt (index!41732 lt!460410) (size!32176 (_values!6422 thiss!1427)))))

(assert (= (and d!126245 res!695588) b!1044344))

(declare-fun b_lambda!16209 () Bool)

(assert (=> (not b_lambda!16209) (not b!1044344)))

(assert (=> b!1044344 t!31268))

(declare-fun b_and!33675 () Bool)

(assert (= b_and!33673 (and (=> t!31268 result!14531) b_and!33675)))

(declare-fun m!963375 () Bool)

(assert (=> d!126245 m!963375))

(assert (=> d!126245 m!963285))

(assert (=> b!1044344 m!963087))

(declare-fun m!963377 () Bool)

(assert (=> b!1044344 m!963377))

(assert (=> b!1044344 m!963115))

(assert (=> b!1044344 m!963103))

(assert (=> b!1044344 m!963111))

(assert (=> b!1044344 m!963103))

(assert (=> b!1044344 m!963081))

(assert (=> b!1044160 d!126245))

(declare-fun b!1044345 () Bool)

(declare-fun e!591868 () ListLongMap!13849)

(declare-fun call!44357 () ListLongMap!13849)

(assert (=> b!1044345 (= e!591868 call!44357)))

(declare-fun b!1044346 () Bool)

(declare-fun e!591870 () Bool)

(declare-fun call!44354 () Bool)

(assert (=> b!1044346 (= e!591870 (not call!44354))))

(declare-fun b!1044347 () Bool)

(declare-fun call!44353 () ListLongMap!13849)

(assert (=> b!1044347 (= e!591868 call!44353)))

(declare-fun b!1044348 () Bool)

(declare-fun e!591867 () Bool)

(assert (=> b!1044348 (= e!591870 e!591867)))

(declare-fun res!695589 () Bool)

(assert (=> b!1044348 (= res!695589 call!44354)))

(assert (=> b!1044348 (=> (not res!695589) (not e!591867))))

(declare-fun b!1044349 () Bool)

(declare-fun res!695590 () Bool)

(declare-fun e!591862 () Bool)

(assert (=> b!1044349 (=> (not res!695590) (not e!591862))))

(assert (=> b!1044349 (= res!695590 e!591870)))

(declare-fun c!106078 () Bool)

(assert (=> b!1044349 (= c!106078 (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1044351 () Bool)

(declare-fun e!591859 () Bool)

(assert (=> b!1044351 (= e!591862 e!591859)))

(declare-fun c!106076 () Bool)

(assert (=> b!1044351 (= c!106076 (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044352 () Bool)

(declare-fun e!591869 () ListLongMap!13849)

(declare-fun call!44359 () ListLongMap!13849)

(assert (=> b!1044352 (= e!591869 (+!3135 call!44359 (tuple2!15835 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6233 thiss!1427))))))

(declare-fun b!1044353 () Bool)

(declare-fun e!591863 () Bool)

(assert (=> b!1044353 (= e!591863 (validKeyInArray!0 (select (arr!31638 lt!460411) #b00000000000000000000000000000000)))))

(declare-fun bm!44350 () Bool)

(assert (=> bm!44350 (= call!44353 call!44359)))

(declare-fun c!106077 () Bool)

(declare-fun call!44355 () ListLongMap!13849)

(declare-fun c!106081 () Bool)

(declare-fun bm!44351 () Bool)

(declare-fun call!44358 () ListLongMap!13849)

(assert (=> bm!44351 (= call!44359 (+!3135 (ite c!106077 call!44358 (ite c!106081 call!44355 call!44357)) (ite (or c!106077 c!106081) (tuple2!15835 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6233 thiss!1427)) (tuple2!15835 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6233 thiss!1427)))))))

(declare-fun bm!44352 () Bool)

(declare-fun call!44356 () Bool)

(declare-fun lt!460595 () ListLongMap!13849)

(assert (=> bm!44352 (= call!44356 (contains!6049 lt!460595 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44353 () Bool)

(assert (=> bm!44353 (= call!44358 (getCurrentListMapNoExtraKeys!3570 lt!460411 lt!460413 (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun b!1044354 () Bool)

(declare-fun e!591871 () Unit!33989)

(declare-fun lt!460592 () Unit!33989)

(assert (=> b!1044354 (= e!591871 lt!460592)))

(declare-fun lt!460582 () ListLongMap!13849)

(assert (=> b!1044354 (= lt!460582 (getCurrentListMapNoExtraKeys!3570 lt!460411 lt!460413 (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun lt!460584 () (_ BitVec 64))

(assert (=> b!1044354 (= lt!460584 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460587 () (_ BitVec 64))

(assert (=> b!1044354 (= lt!460587 (select (arr!31638 lt!460411) #b00000000000000000000000000000000))))

(declare-fun lt!460598 () Unit!33989)

(assert (=> b!1044354 (= lt!460598 (addStillContains!623 lt!460582 lt!460584 (zeroValue!6233 thiss!1427) lt!460587))))

(assert (=> b!1044354 (contains!6049 (+!3135 lt!460582 (tuple2!15835 lt!460584 (zeroValue!6233 thiss!1427))) lt!460587)))

(declare-fun lt!460589 () Unit!33989)

(assert (=> b!1044354 (= lt!460589 lt!460598)))

(declare-fun lt!460591 () ListLongMap!13849)

(assert (=> b!1044354 (= lt!460591 (getCurrentListMapNoExtraKeys!3570 lt!460411 lt!460413 (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun lt!460599 () (_ BitVec 64))

(assert (=> b!1044354 (= lt!460599 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460588 () (_ BitVec 64))

(assert (=> b!1044354 (= lt!460588 (select (arr!31638 lt!460411) #b00000000000000000000000000000000))))

(declare-fun lt!460585 () Unit!33989)

(assert (=> b!1044354 (= lt!460585 (addApplyDifferent!479 lt!460591 lt!460599 (minValue!6233 thiss!1427) lt!460588))))

(assert (=> b!1044354 (= (apply!904 (+!3135 lt!460591 (tuple2!15835 lt!460599 (minValue!6233 thiss!1427))) lt!460588) (apply!904 lt!460591 lt!460588))))

(declare-fun lt!460586 () Unit!33989)

(assert (=> b!1044354 (= lt!460586 lt!460585)))

(declare-fun lt!460590 () ListLongMap!13849)

(assert (=> b!1044354 (= lt!460590 (getCurrentListMapNoExtraKeys!3570 lt!460411 lt!460413 (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun lt!460597 () (_ BitVec 64))

(assert (=> b!1044354 (= lt!460597 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460581 () (_ BitVec 64))

(assert (=> b!1044354 (= lt!460581 (select (arr!31638 lt!460411) #b00000000000000000000000000000000))))

(declare-fun lt!460600 () Unit!33989)

(assert (=> b!1044354 (= lt!460600 (addApplyDifferent!479 lt!460590 lt!460597 (zeroValue!6233 thiss!1427) lt!460581))))

(assert (=> b!1044354 (= (apply!904 (+!3135 lt!460590 (tuple2!15835 lt!460597 (zeroValue!6233 thiss!1427))) lt!460581) (apply!904 lt!460590 lt!460581))))

(declare-fun lt!460596 () Unit!33989)

(assert (=> b!1044354 (= lt!460596 lt!460600)))

(declare-fun lt!460593 () ListLongMap!13849)

(assert (=> b!1044354 (= lt!460593 (getCurrentListMapNoExtraKeys!3570 lt!460411 lt!460413 (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun lt!460602 () (_ BitVec 64))

(assert (=> b!1044354 (= lt!460602 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460583 () (_ BitVec 64))

(assert (=> b!1044354 (= lt!460583 (select (arr!31638 lt!460411) #b00000000000000000000000000000000))))

(assert (=> b!1044354 (= lt!460592 (addApplyDifferent!479 lt!460593 lt!460602 (minValue!6233 thiss!1427) lt!460583))))

(assert (=> b!1044354 (= (apply!904 (+!3135 lt!460593 (tuple2!15835 lt!460602 (minValue!6233 thiss!1427))) lt!460583) (apply!904 lt!460593 lt!460583))))

(declare-fun b!1044355 () Bool)

(declare-fun e!591860 () ListLongMap!13849)

(assert (=> b!1044355 (= e!591860 call!44353)))

(declare-fun b!1044356 () Bool)

(assert (=> b!1044356 (= e!591867 (= (apply!904 lt!460595 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6233 thiss!1427)))))

(declare-fun b!1044357 () Bool)

(assert (=> b!1044357 (= e!591859 (not call!44356))))

(declare-fun b!1044358 () Bool)

(declare-fun res!695593 () Bool)

(assert (=> b!1044358 (=> (not res!695593) (not e!591862))))

(declare-fun e!591861 () Bool)

(assert (=> b!1044358 (= res!695593 e!591861)))

(declare-fun res!695596 () Bool)

(assert (=> b!1044358 (=> res!695596 e!591861)))

(assert (=> b!1044358 (= res!695596 (not e!591863))))

(declare-fun res!695595 () Bool)

(assert (=> b!1044358 (=> (not res!695595) (not e!591863))))

(assert (=> b!1044358 (= res!695595 (bvslt #b00000000000000000000000000000000 (size!32175 lt!460411)))))

(declare-fun b!1044359 () Bool)

(declare-fun c!106080 () Bool)

(assert (=> b!1044359 (= c!106080 (and (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1044359 (= e!591860 e!591868)))

(declare-fun b!1044360 () Bool)

(declare-fun Unit!33999 () Unit!33989)

(assert (=> b!1044360 (= e!591871 Unit!33999)))

(declare-fun bm!44354 () Bool)

(assert (=> bm!44354 (= call!44354 (contains!6049 lt!460595 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44355 () Bool)

(assert (=> bm!44355 (= call!44355 call!44358)))

(declare-fun bm!44356 () Bool)

(assert (=> bm!44356 (= call!44357 call!44355)))

(declare-fun b!1044361 () Bool)

(declare-fun e!591864 () Bool)

(assert (=> b!1044361 (= e!591864 (validKeyInArray!0 (select (arr!31638 lt!460411) #b00000000000000000000000000000000)))))

(declare-fun b!1044362 () Bool)

(declare-fun e!591866 () Bool)

(assert (=> b!1044362 (= e!591861 e!591866)))

(declare-fun res!695592 () Bool)

(assert (=> b!1044362 (=> (not res!695592) (not e!591866))))

(assert (=> b!1044362 (= res!695592 (contains!6049 lt!460595 (select (arr!31638 lt!460411) #b00000000000000000000000000000000)))))

(assert (=> b!1044362 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32175 lt!460411)))))

(declare-fun b!1044363 () Bool)

(assert (=> b!1044363 (= e!591869 e!591860)))

(assert (=> b!1044363 (= c!106081 (and (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1044364 () Bool)

(declare-fun e!591865 () Bool)

(assert (=> b!1044364 (= e!591865 (= (apply!904 lt!460595 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6233 thiss!1427)))))

(declare-fun b!1044365 () Bool)

(assert (=> b!1044365 (= e!591859 e!591865)))

(declare-fun res!695591 () Bool)

(assert (=> b!1044365 (= res!695591 call!44356)))

(assert (=> b!1044365 (=> (not res!695591) (not e!591865))))

(declare-fun b!1044350 () Bool)

(assert (=> b!1044350 (= e!591866 (= (apply!904 lt!460595 (select (arr!31638 lt!460411) #b00000000000000000000000000000000)) (get!16545 (select (arr!31639 lt!460413) #b00000000000000000000000000000000) (dynLambda!1993 (defaultEntry!6399 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1044350 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32176 lt!460413)))))

(assert (=> b!1044350 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32175 lt!460411)))))

(declare-fun d!126247 () Bool)

(assert (=> d!126247 e!591862))

(declare-fun res!695594 () Bool)

(assert (=> d!126247 (=> (not res!695594) (not e!591862))))

(assert (=> d!126247 (= res!695594 (or (bvsge #b00000000000000000000000000000000 (size!32175 lt!460411)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32175 lt!460411)))))))

(declare-fun lt!460601 () ListLongMap!13849)

(assert (=> d!126247 (= lt!460595 lt!460601)))

(declare-fun lt!460594 () Unit!33989)

(assert (=> d!126247 (= lt!460594 e!591871)))

(declare-fun c!106079 () Bool)

(assert (=> d!126247 (= c!106079 e!591864)))

(declare-fun res!695597 () Bool)

(assert (=> d!126247 (=> (not res!695597) (not e!591864))))

(assert (=> d!126247 (= res!695597 (bvslt #b00000000000000000000000000000000 (size!32175 lt!460411)))))

(assert (=> d!126247 (= lt!460601 e!591869)))

(assert (=> d!126247 (= c!106077 (and (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6127 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126247 (validMask!0 (mask!30501 thiss!1427))))

(assert (=> d!126247 (= (getCurrentListMap!3906 lt!460411 lt!460413 (mask!30501 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)) lt!460595)))

(assert (= (and d!126247 c!106077) b!1044352))

(assert (= (and d!126247 (not c!106077)) b!1044363))

(assert (= (and b!1044363 c!106081) b!1044355))

(assert (= (and b!1044363 (not c!106081)) b!1044359))

(assert (= (and b!1044359 c!106080) b!1044347))

(assert (= (and b!1044359 (not c!106080)) b!1044345))

(assert (= (or b!1044347 b!1044345) bm!44356))

(assert (= (or b!1044355 bm!44356) bm!44355))

(assert (= (or b!1044355 b!1044347) bm!44350))

(assert (= (or b!1044352 bm!44355) bm!44353))

(assert (= (or b!1044352 bm!44350) bm!44351))

(assert (= (and d!126247 res!695597) b!1044361))

(assert (= (and d!126247 c!106079) b!1044354))

(assert (= (and d!126247 (not c!106079)) b!1044360))

(assert (= (and d!126247 res!695594) b!1044358))

(assert (= (and b!1044358 res!695595) b!1044353))

(assert (= (and b!1044358 (not res!695596)) b!1044362))

(assert (= (and b!1044362 res!695592) b!1044350))

(assert (= (and b!1044358 res!695593) b!1044349))

(assert (= (and b!1044349 c!106078) b!1044348))

(assert (= (and b!1044349 (not c!106078)) b!1044346))

(assert (= (and b!1044348 res!695589) b!1044356))

(assert (= (or b!1044348 b!1044346) bm!44354))

(assert (= (and b!1044349 res!695590) b!1044351))

(assert (= (and b!1044351 c!106076) b!1044365))

(assert (= (and b!1044351 (not c!106076)) b!1044357))

(assert (= (and b!1044365 res!695591) b!1044364))

(assert (= (or b!1044365 b!1044357) bm!44352))

(declare-fun b_lambda!16211 () Bool)

(assert (=> (not b_lambda!16211) (not b!1044350)))

(assert (=> b!1044350 t!31268))

(declare-fun b_and!33677 () Bool)

(assert (= b_and!33675 (and (=> t!31268 result!14531) b_and!33677)))

(assert (=> d!126247 m!963285))

(declare-fun m!963379 () Bool)

(assert (=> bm!44352 m!963379))

(assert (=> b!1044353 m!963301))

(assert (=> b!1044353 m!963301))

(assert (=> b!1044353 m!963303))

(declare-fun m!963381 () Bool)

(assert (=> b!1044352 m!963381))

(declare-fun m!963383 () Bool)

(assert (=> bm!44353 m!963383))

(assert (=> b!1044362 m!963301))

(assert (=> b!1044362 m!963301))

(declare-fun m!963385 () Bool)

(assert (=> b!1044362 m!963385))

(declare-fun m!963387 () Bool)

(assert (=> b!1044364 m!963387))

(declare-fun m!963389 () Bool)

(assert (=> b!1044354 m!963389))

(declare-fun m!963391 () Bool)

(assert (=> b!1044354 m!963391))

(declare-fun m!963393 () Bool)

(assert (=> b!1044354 m!963393))

(declare-fun m!963395 () Bool)

(assert (=> b!1044354 m!963395))

(assert (=> b!1044354 m!963383))

(declare-fun m!963397 () Bool)

(assert (=> b!1044354 m!963397))

(declare-fun m!963399 () Bool)

(assert (=> b!1044354 m!963399))

(declare-fun m!963401 () Bool)

(assert (=> b!1044354 m!963401))

(declare-fun m!963403 () Bool)

(assert (=> b!1044354 m!963403))

(declare-fun m!963405 () Bool)

(assert (=> b!1044354 m!963405))

(declare-fun m!963407 () Bool)

(assert (=> b!1044354 m!963407))

(declare-fun m!963409 () Bool)

(assert (=> b!1044354 m!963409))

(assert (=> b!1044354 m!963397))

(declare-fun m!963411 () Bool)

(assert (=> b!1044354 m!963411))

(declare-fun m!963413 () Bool)

(assert (=> b!1044354 m!963413))

(assert (=> b!1044354 m!963391))

(assert (=> b!1044354 m!963403))

(declare-fun m!963415 () Bool)

(assert (=> b!1044354 m!963415))

(assert (=> b!1044354 m!963395))

(declare-fun m!963417 () Bool)

(assert (=> b!1044354 m!963417))

(assert (=> b!1044354 m!963301))

(declare-fun m!963419 () Bool)

(assert (=> bm!44354 m!963419))

(declare-fun m!963421 () Bool)

(assert (=> b!1044350 m!963421))

(assert (=> b!1044350 m!963115))

(assert (=> b!1044350 m!963301))

(assert (=> b!1044350 m!963301))

(declare-fun m!963423 () Bool)

(assert (=> b!1044350 m!963423))

(assert (=> b!1044350 m!963421))

(assert (=> b!1044350 m!963115))

(declare-fun m!963425 () Bool)

(assert (=> b!1044350 m!963425))

(declare-fun m!963427 () Bool)

(assert (=> bm!44351 m!963427))

(declare-fun m!963429 () Bool)

(assert (=> b!1044356 m!963429))

(assert (=> b!1044361 m!963301))

(assert (=> b!1044361 m!963301))

(assert (=> b!1044361 m!963303))

(assert (=> b!1044160 d!126247))

(declare-fun d!126249 () Bool)

(declare-fun e!591877 () Bool)

(assert (=> d!126249 e!591877))

(declare-fun res!695600 () Bool)

(assert (=> d!126249 (=> res!695600 e!591877)))

(declare-fun lt!460611 () Bool)

(assert (=> d!126249 (= res!695600 (not lt!460611))))

(declare-fun lt!460613 () Bool)

(assert (=> d!126249 (= lt!460611 lt!460613)))

(declare-fun lt!460614 () Unit!33989)

(declare-fun e!591876 () Unit!33989)

(assert (=> d!126249 (= lt!460614 e!591876)))

(declare-fun c!106084 () Bool)

(assert (=> d!126249 (= c!106084 lt!460613)))

(declare-fun containsKey!566 (List!22042 (_ BitVec 64)) Bool)

(assert (=> d!126249 (= lt!460613 (containsKey!566 (toList!6940 (getCurrentListMap!3906 (_keys!11659 (_2!7927 lt!460414)) (_values!6422 (_2!7927 lt!460414)) (mask!30501 (_2!7927 lt!460414)) (extraKeys!6127 (_2!7927 lt!460414)) (zeroValue!6233 (_2!7927 lt!460414)) (minValue!6233 (_2!7927 lt!460414)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7927 lt!460414)))) key!909))))

(assert (=> d!126249 (= (contains!6049 (getCurrentListMap!3906 (_keys!11659 (_2!7927 lt!460414)) (_values!6422 (_2!7927 lt!460414)) (mask!30501 (_2!7927 lt!460414)) (extraKeys!6127 (_2!7927 lt!460414)) (zeroValue!6233 (_2!7927 lt!460414)) (minValue!6233 (_2!7927 lt!460414)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7927 lt!460414))) key!909) lt!460611)))

(declare-fun b!1044372 () Bool)

(declare-fun lt!460612 () Unit!33989)

(assert (=> b!1044372 (= e!591876 lt!460612)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!398 (List!22042 (_ BitVec 64)) Unit!33989)

(assert (=> b!1044372 (= lt!460612 (lemmaContainsKeyImpliesGetValueByKeyDefined!398 (toList!6940 (getCurrentListMap!3906 (_keys!11659 (_2!7927 lt!460414)) (_values!6422 (_2!7927 lt!460414)) (mask!30501 (_2!7927 lt!460414)) (extraKeys!6127 (_2!7927 lt!460414)) (zeroValue!6233 (_2!7927 lt!460414)) (minValue!6233 (_2!7927 lt!460414)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7927 lt!460414)))) key!909))))

(declare-datatypes ((Option!644 0))(
  ( (Some!643 (v!15062 V!37987)) (None!642) )
))
(declare-fun isDefined!441 (Option!644) Bool)

(declare-fun getValueByKey!593 (List!22042 (_ BitVec 64)) Option!644)

(assert (=> b!1044372 (isDefined!441 (getValueByKey!593 (toList!6940 (getCurrentListMap!3906 (_keys!11659 (_2!7927 lt!460414)) (_values!6422 (_2!7927 lt!460414)) (mask!30501 (_2!7927 lt!460414)) (extraKeys!6127 (_2!7927 lt!460414)) (zeroValue!6233 (_2!7927 lt!460414)) (minValue!6233 (_2!7927 lt!460414)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7927 lt!460414)))) key!909))))

(declare-fun b!1044373 () Bool)

(declare-fun Unit!34000 () Unit!33989)

(assert (=> b!1044373 (= e!591876 Unit!34000)))

(declare-fun b!1044374 () Bool)

(assert (=> b!1044374 (= e!591877 (isDefined!441 (getValueByKey!593 (toList!6940 (getCurrentListMap!3906 (_keys!11659 (_2!7927 lt!460414)) (_values!6422 (_2!7927 lt!460414)) (mask!30501 (_2!7927 lt!460414)) (extraKeys!6127 (_2!7927 lt!460414)) (zeroValue!6233 (_2!7927 lt!460414)) (minValue!6233 (_2!7927 lt!460414)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7927 lt!460414)))) key!909)))))

(assert (= (and d!126249 c!106084) b!1044372))

(assert (= (and d!126249 (not c!106084)) b!1044373))

(assert (= (and d!126249 (not res!695600)) b!1044374))

(declare-fun m!963431 () Bool)

(assert (=> d!126249 m!963431))

(declare-fun m!963433 () Bool)

(assert (=> b!1044372 m!963433))

(declare-fun m!963435 () Bool)

(assert (=> b!1044372 m!963435))

(assert (=> b!1044372 m!963435))

(declare-fun m!963437 () Bool)

(assert (=> b!1044372 m!963437))

(assert (=> b!1044374 m!963435))

(assert (=> b!1044374 m!963435))

(assert (=> b!1044374 m!963437))

(assert (=> b!1044160 d!126249))

(declare-fun d!126251 () Bool)

(declare-fun res!695605 () Bool)

(declare-fun e!591882 () Bool)

(assert (=> d!126251 (=> res!695605 e!591882)))

(assert (=> d!126251 (= res!695605 (= (select (arr!31638 lt!460411) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126251 (= (arrayContainsKey!0 lt!460411 key!909 #b00000000000000000000000000000000) e!591882)))

(declare-fun b!1044379 () Bool)

(declare-fun e!591883 () Bool)

(assert (=> b!1044379 (= e!591882 e!591883)))

(declare-fun res!695606 () Bool)

(assert (=> b!1044379 (=> (not res!695606) (not e!591883))))

(assert (=> b!1044379 (= res!695606 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32175 lt!460411)))))

(declare-fun b!1044380 () Bool)

(assert (=> b!1044380 (= e!591883 (arrayContainsKey!0 lt!460411 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126251 (not res!695605)) b!1044379))

(assert (= (and b!1044379 res!695606) b!1044380))

(assert (=> d!126251 m!963301))

(declare-fun m!963439 () Bool)

(assert (=> b!1044380 m!963439))

(assert (=> b!1044160 d!126251))

(declare-fun b!1044389 () Bool)

(declare-fun e!591890 () Bool)

(declare-fun call!44362 () Bool)

(assert (=> b!1044389 (= e!591890 call!44362)))

(declare-fun b!1044390 () Bool)

(declare-fun e!591891 () Bool)

(assert (=> b!1044390 (= e!591891 e!591890)))

(declare-fun c!106087 () Bool)

(assert (=> b!1044390 (= c!106087 (validKeyInArray!0 (select (arr!31638 lt!460411) #b00000000000000000000000000000000)))))

(declare-fun d!126253 () Bool)

(declare-fun res!695612 () Bool)

(assert (=> d!126253 (=> res!695612 e!591891)))

(assert (=> d!126253 (= res!695612 (bvsge #b00000000000000000000000000000000 (size!32175 lt!460411)))))

(assert (=> d!126253 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460411 (mask!30501 thiss!1427)) e!591891)))

(declare-fun b!1044391 () Bool)

(declare-fun e!591892 () Bool)

(assert (=> b!1044391 (= e!591890 e!591892)))

(declare-fun lt!460621 () (_ BitVec 64))

(assert (=> b!1044391 (= lt!460621 (select (arr!31638 lt!460411) #b00000000000000000000000000000000))))

(declare-fun lt!460623 () Unit!33989)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65777 (_ BitVec 64) (_ BitVec 32)) Unit!33989)

(assert (=> b!1044391 (= lt!460623 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!460411 lt!460621 #b00000000000000000000000000000000))))

(assert (=> b!1044391 (arrayContainsKey!0 lt!460411 lt!460621 #b00000000000000000000000000000000)))

(declare-fun lt!460622 () Unit!33989)

(assert (=> b!1044391 (= lt!460622 lt!460623)))

(declare-fun res!695611 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65777 (_ BitVec 32)) SeekEntryResult!9840)

(assert (=> b!1044391 (= res!695611 (= (seekEntryOrOpen!0 (select (arr!31638 lt!460411) #b00000000000000000000000000000000) lt!460411 (mask!30501 thiss!1427)) (Found!9840 #b00000000000000000000000000000000)))))

(assert (=> b!1044391 (=> (not res!695611) (not e!591892))))

(declare-fun bm!44359 () Bool)

(assert (=> bm!44359 (= call!44362 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!460411 (mask!30501 thiss!1427)))))

(declare-fun b!1044392 () Bool)

(assert (=> b!1044392 (= e!591892 call!44362)))

(assert (= (and d!126253 (not res!695612)) b!1044390))

(assert (= (and b!1044390 c!106087) b!1044391))

(assert (= (and b!1044390 (not c!106087)) b!1044389))

(assert (= (and b!1044391 res!695611) b!1044392))

(assert (= (or b!1044392 b!1044389) bm!44359))

(assert (=> b!1044390 m!963301))

(assert (=> b!1044390 m!963301))

(assert (=> b!1044390 m!963303))

(assert (=> b!1044391 m!963301))

(declare-fun m!963441 () Bool)

(assert (=> b!1044391 m!963441))

(declare-fun m!963443 () Bool)

(assert (=> b!1044391 m!963443))

(assert (=> b!1044391 m!963301))

(declare-fun m!963445 () Bool)

(assert (=> b!1044391 m!963445))

(declare-fun m!963447 () Bool)

(assert (=> bm!44359 m!963447))

(assert (=> b!1044160 d!126253))

(declare-fun d!126255 () Bool)

(declare-fun res!695620 () Bool)

(declare-fun e!591904 () Bool)

(assert (=> d!126255 (=> res!695620 e!591904)))

(assert (=> d!126255 (= res!695620 (bvsge #b00000000000000000000000000000000 (size!32175 lt!460411)))))

(assert (=> d!126255 (= (arrayNoDuplicates!0 lt!460411 #b00000000000000000000000000000000 Nil!22040) e!591904)))

(declare-fun b!1044403 () Bool)

(declare-fun e!591902 () Bool)

(declare-fun call!44365 () Bool)

(assert (=> b!1044403 (= e!591902 call!44365)))

(declare-fun bm!44362 () Bool)

(declare-fun c!106090 () Bool)

(assert (=> bm!44362 (= call!44365 (arrayNoDuplicates!0 lt!460411 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106090 (Cons!22039 (select (arr!31638 lt!460411) #b00000000000000000000000000000000) Nil!22040) Nil!22040)))))

(declare-fun b!1044404 () Bool)

(declare-fun e!591903 () Bool)

(assert (=> b!1044404 (= e!591904 e!591903)))

(declare-fun res!695621 () Bool)

(assert (=> b!1044404 (=> (not res!695621) (not e!591903))))

(declare-fun e!591901 () Bool)

(assert (=> b!1044404 (= res!695621 (not e!591901))))

(declare-fun res!695619 () Bool)

(assert (=> b!1044404 (=> (not res!695619) (not e!591901))))

(assert (=> b!1044404 (= res!695619 (validKeyInArray!0 (select (arr!31638 lt!460411) #b00000000000000000000000000000000)))))

(declare-fun b!1044405 () Bool)

(declare-fun contains!6051 (List!22043 (_ BitVec 64)) Bool)

(assert (=> b!1044405 (= e!591901 (contains!6051 Nil!22040 (select (arr!31638 lt!460411) #b00000000000000000000000000000000)))))

(declare-fun b!1044406 () Bool)

(assert (=> b!1044406 (= e!591903 e!591902)))

(assert (=> b!1044406 (= c!106090 (validKeyInArray!0 (select (arr!31638 lt!460411) #b00000000000000000000000000000000)))))

(declare-fun b!1044407 () Bool)

(assert (=> b!1044407 (= e!591902 call!44365)))

(assert (= (and d!126255 (not res!695620)) b!1044404))

(assert (= (and b!1044404 res!695619) b!1044405))

(assert (= (and b!1044404 res!695621) b!1044406))

(assert (= (and b!1044406 c!106090) b!1044407))

(assert (= (and b!1044406 (not c!106090)) b!1044403))

(assert (= (or b!1044407 b!1044403) bm!44362))

(assert (=> bm!44362 m!963301))

(declare-fun m!963449 () Bool)

(assert (=> bm!44362 m!963449))

(assert (=> b!1044404 m!963301))

(assert (=> b!1044404 m!963301))

(assert (=> b!1044404 m!963303))

(assert (=> b!1044405 m!963301))

(assert (=> b!1044405 m!963301))

(declare-fun m!963451 () Bool)

(assert (=> b!1044405 m!963451))

(assert (=> b!1044406 m!963301))

(assert (=> b!1044406 m!963301))

(assert (=> b!1044406 m!963303))

(assert (=> b!1044160 d!126255))

(declare-fun d!126257 () Bool)

(declare-fun res!695628 () Bool)

(declare-fun e!591907 () Bool)

(assert (=> d!126257 (=> (not res!695628) (not e!591907))))

(declare-fun simpleValid!449 (LongMapFixedSize!6022) Bool)

(assert (=> d!126257 (= res!695628 (simpleValid!449 thiss!1427))))

(assert (=> d!126257 (= (valid!2255 thiss!1427) e!591907)))

(declare-fun b!1044414 () Bool)

(declare-fun res!695629 () Bool)

(assert (=> b!1044414 (=> (not res!695629) (not e!591907))))

(assert (=> b!1044414 (= res!695629 (= (arrayCountValidKeys!0 (_keys!11659 thiss!1427) #b00000000000000000000000000000000 (size!32175 (_keys!11659 thiss!1427))) (_size!3066 thiss!1427)))))

(declare-fun b!1044415 () Bool)

(declare-fun res!695630 () Bool)

(assert (=> b!1044415 (=> (not res!695630) (not e!591907))))

(assert (=> b!1044415 (= res!695630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11659 thiss!1427) (mask!30501 thiss!1427)))))

(declare-fun b!1044416 () Bool)

(assert (=> b!1044416 (= e!591907 (arrayNoDuplicates!0 (_keys!11659 thiss!1427) #b00000000000000000000000000000000 Nil!22040))))

(assert (= (and d!126257 res!695628) b!1044414))

(assert (= (and b!1044414 res!695629) b!1044415))

(assert (= (and b!1044415 res!695630) b!1044416))

(declare-fun m!963453 () Bool)

(assert (=> d!126257 m!963453))

(assert (=> b!1044414 m!963093))

(declare-fun m!963455 () Bool)

(assert (=> b!1044415 m!963455))

(declare-fun m!963457 () Bool)

(assert (=> b!1044416 m!963457))

(assert (=> start!91770 d!126257))

(declare-fun b!1044429 () Bool)

(declare-fun e!591916 () SeekEntryResult!9840)

(declare-fun e!591914 () SeekEntryResult!9840)

(assert (=> b!1044429 (= e!591916 e!591914)))

(declare-fun lt!460635 () (_ BitVec 64))

(declare-fun lt!460634 () SeekEntryResult!9840)

(assert (=> b!1044429 (= lt!460635 (select (arr!31638 (_keys!11659 thiss!1427)) (index!41733 lt!460634)))))

(declare-fun c!106098 () Bool)

(assert (=> b!1044429 (= c!106098 (= lt!460635 key!909))))

(declare-fun b!1044430 () Bool)

(declare-fun e!591915 () SeekEntryResult!9840)

(assert (=> b!1044430 (= e!591915 (MissingZero!9840 (index!41733 lt!460634)))))

(declare-fun b!1044431 () Bool)

(declare-fun c!106099 () Bool)

(assert (=> b!1044431 (= c!106099 (= lt!460635 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1044431 (= e!591914 e!591915)))

(declare-fun b!1044432 () Bool)

(assert (=> b!1044432 (= e!591914 (Found!9840 (index!41733 lt!460634)))))

(declare-fun d!126259 () Bool)

(declare-fun lt!460632 () SeekEntryResult!9840)

(assert (=> d!126259 (and (or ((_ is MissingVacant!9840) lt!460632) (not ((_ is Found!9840) lt!460632)) (and (bvsge (index!41732 lt!460632) #b00000000000000000000000000000000) (bvslt (index!41732 lt!460632) (size!32175 (_keys!11659 thiss!1427))))) (not ((_ is MissingVacant!9840) lt!460632)) (or (not ((_ is Found!9840) lt!460632)) (= (select (arr!31638 (_keys!11659 thiss!1427)) (index!41732 lt!460632)) key!909)))))

(assert (=> d!126259 (= lt!460632 e!591916)))

(declare-fun c!106097 () Bool)

(assert (=> d!126259 (= c!106097 (and ((_ is Intermediate!9840) lt!460634) (undefined!10652 lt!460634)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65777 (_ BitVec 32)) SeekEntryResult!9840)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126259 (= lt!460634 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30501 thiss!1427)) key!909 (_keys!11659 thiss!1427) (mask!30501 thiss!1427)))))

(assert (=> d!126259 (validMask!0 (mask!30501 thiss!1427))))

(assert (=> d!126259 (= (seekEntry!0 key!909 (_keys!11659 thiss!1427) (mask!30501 thiss!1427)) lt!460632)))

(declare-fun b!1044433 () Bool)

(assert (=> b!1044433 (= e!591916 Undefined!9840)))

(declare-fun b!1044434 () Bool)

(declare-fun lt!460633 () SeekEntryResult!9840)

(assert (=> b!1044434 (= e!591915 (ite ((_ is MissingVacant!9840) lt!460633) (MissingZero!9840 (index!41734 lt!460633)) lt!460633))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65777 (_ BitVec 32)) SeekEntryResult!9840)

(assert (=> b!1044434 (= lt!460633 (seekKeyOrZeroReturnVacant!0 (x!93251 lt!460634) (index!41733 lt!460634) (index!41733 lt!460634) key!909 (_keys!11659 thiss!1427) (mask!30501 thiss!1427)))))

(assert (= (and d!126259 c!106097) b!1044433))

(assert (= (and d!126259 (not c!106097)) b!1044429))

(assert (= (and b!1044429 c!106098) b!1044432))

(assert (= (and b!1044429 (not c!106098)) b!1044431))

(assert (= (and b!1044431 c!106099) b!1044430))

(assert (= (and b!1044431 (not c!106099)) b!1044434))

(declare-fun m!963459 () Bool)

(assert (=> b!1044429 m!963459))

(declare-fun m!963461 () Bool)

(assert (=> d!126259 m!963461))

(declare-fun m!963463 () Bool)

(assert (=> d!126259 m!963463))

(assert (=> d!126259 m!963463))

(declare-fun m!963465 () Bool)

(assert (=> d!126259 m!963465))

(assert (=> d!126259 m!963285))

(declare-fun m!963467 () Bool)

(assert (=> b!1044434 m!963467))

(assert (=> b!1044155 d!126259))

(declare-fun d!126261 () Bool)

(assert (=> d!126261 (= (array_inv!24451 (_keys!11659 thiss!1427)) (bvsge (size!32175 (_keys!11659 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044158 d!126261))

(declare-fun d!126263 () Bool)

(assert (=> d!126263 (= (array_inv!24452 (_values!6422 thiss!1427)) (bvsge (size!32176 (_values!6422 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044158 d!126263))

(declare-fun mapNonEmpty!38891 () Bool)

(declare-fun mapRes!38891 () Bool)

(declare-fun tp!74607 () Bool)

(declare-fun e!591921 () Bool)

(assert (=> mapNonEmpty!38891 (= mapRes!38891 (and tp!74607 e!591921))))

(declare-fun mapKey!38891 () (_ BitVec 32))

(declare-fun mapRest!38891 () (Array (_ BitVec 32) ValueCell!11714))

(declare-fun mapValue!38891 () ValueCell!11714)

(assert (=> mapNonEmpty!38891 (= mapRest!38882 (store mapRest!38891 mapKey!38891 mapValue!38891))))

(declare-fun b!1044441 () Bool)

(assert (=> b!1044441 (= e!591921 tp_is_empty!24835)))

(declare-fun condMapEmpty!38891 () Bool)

(declare-fun mapDefault!38891 () ValueCell!11714)

(assert (=> mapNonEmpty!38882 (= condMapEmpty!38891 (= mapRest!38882 ((as const (Array (_ BitVec 32) ValueCell!11714)) mapDefault!38891)))))

(declare-fun e!591922 () Bool)

(assert (=> mapNonEmpty!38882 (= tp!74592 (and e!591922 mapRes!38891))))

(declare-fun b!1044442 () Bool)

(assert (=> b!1044442 (= e!591922 tp_is_empty!24835)))

(declare-fun mapIsEmpty!38891 () Bool)

(assert (=> mapIsEmpty!38891 mapRes!38891))

(assert (= (and mapNonEmpty!38882 condMapEmpty!38891) mapIsEmpty!38891))

(assert (= (and mapNonEmpty!38882 (not condMapEmpty!38891)) mapNonEmpty!38891))

(assert (= (and mapNonEmpty!38891 ((_ is ValueCellFull!11714) mapValue!38891)) b!1044441))

(assert (= (and mapNonEmpty!38882 ((_ is ValueCellFull!11714) mapDefault!38891)) b!1044442))

(declare-fun m!963469 () Bool)

(assert (=> mapNonEmpty!38891 m!963469))

(declare-fun b_lambda!16213 () Bool)

(assert (= b_lambda!16211 (or (and b!1044158 b_free!21115) b_lambda!16213)))

(declare-fun b_lambda!16215 () Bool)

(assert (= b_lambda!16207 (or (and b!1044158 b_free!21115) b_lambda!16215)))

(declare-fun b_lambda!16217 () Bool)

(assert (= b_lambda!16209 (or (and b!1044158 b_free!21115) b_lambda!16217)))

(check-sat (not b!1044350) (not bm!44346) (not b!1044318) (not b!1044354) (not bm!44333) (not d!126227) (not d!126257) (not b!1044270) (not b!1044356) (not bm!44341) (not d!126247) (not d!126259) (not b_lambda!16217) (not b!1044286) (not bm!44354) (not b!1044282) b_and!33677 (not bm!44351) (not b!1044268) (not b!1044271) (not b!1044364) (not b!1044391) (not bm!44345) (not b!1044340) (not b!1044289) (not b!1044330) (not b!1044414) (not b!1044337) (not b!1044415) (not b!1044390) (not d!126233) (not d!126235) (not b!1044344) (not b!1044280) (not b!1044292) (not b_lambda!16203) (not b!1044353) (not b!1044361) (not b!1044305) (not d!126249) (not b!1044406) (not b!1044374) (not b!1044279) (not bm!44359) (not bm!44362) tp_is_empty!24835 (not b!1044328) (not b!1044362) (not bm!44347) (not b!1044326) (not b!1044404) (not b!1044272) (not b!1044301) (not b!1044317) (not b!1044380) (not b_lambda!16213) (not b!1044274) (not d!126229) (not bm!44334) (not b_next!21115) (not b_lambda!16215) (not b!1044405) (not b_lambda!16205) (not b!1044434) (not bm!44342) (not bm!44353) (not b!1044320) (not b!1044352) (not mapNonEmpty!38891) (not bm!44335) (not d!126245) (not d!126231) (not bm!44344) (not bm!44336) (not b!1044372) (not b!1044332) (not d!126241) (not b!1044338) (not b!1044329) (not d!126243) (not bm!44352) (not b!1044416))
(check-sat b_and!33677 (not b_next!21115))
