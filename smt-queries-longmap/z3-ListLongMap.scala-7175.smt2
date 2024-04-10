; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91698 () Bool)

(assert start!91698)

(declare-fun b!1043763 () Bool)

(declare-fun b_free!21105 () Bool)

(declare-fun b_next!21105 () Bool)

(assert (=> b!1043763 (= b_free!21105 (not b_next!21105))))

(declare-fun tp!74555 () Bool)

(declare-fun b_and!33651 () Bool)

(assert (=> b!1043763 (= tp!74555 b_and!33651)))

(declare-fun b!1043761 () Bool)

(declare-fun e!591438 () Bool)

(declare-fun tp_is_empty!24825 () Bool)

(assert (=> b!1043761 (= e!591438 tp_is_empty!24825)))

(declare-fun b!1043762 () Bool)

(declare-fun res!695312 () Bool)

(declare-fun e!591441 () Bool)

(assert (=> b!1043762 (=> (not res!695312) (not e!591441))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1043762 (= res!695312 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38861 () Bool)

(declare-fun mapRes!38861 () Bool)

(declare-fun tp!74556 () Bool)

(assert (=> mapNonEmpty!38861 (= mapRes!38861 (and tp!74556 e!591438))))

(declare-datatypes ((V!37973 0))(
  ( (V!37974 (val!12463 Int)) )
))
(declare-datatypes ((ValueCell!11709 0))(
  ( (ValueCellFull!11709 (v!15054 V!37973)) (EmptyCell!11709) )
))
(declare-fun mapRest!38861 () (Array (_ BitVec 32) ValueCell!11709))

(declare-fun mapKey!38861 () (_ BitVec 32))

(declare-fun mapValue!38861 () ValueCell!11709)

(declare-datatypes ((array!65814 0))(
  ( (array!65815 (arr!31659 (Array (_ BitVec 32) (_ BitVec 64))) (size!32194 (_ BitVec 32))) )
))
(declare-datatypes ((array!65816 0))(
  ( (array!65817 (arr!31660 (Array (_ BitVec 32) ValueCell!11709)) (size!32195 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6012 0))(
  ( (LongMapFixedSize!6013 (defaultEntry!6390 Int) (mask!30486 (_ BitVec 32)) (extraKeys!6118 (_ BitVec 32)) (zeroValue!6224 V!37973) (minValue!6224 V!37973) (_size!3061 (_ BitVec 32)) (_keys!11650 array!65814) (_values!6413 array!65816) (_vacant!3061 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6012)

(assert (=> mapNonEmpty!38861 (= (arr!31660 (_values!6413 thiss!1427)) (store mapRest!38861 mapKey!38861 mapValue!38861))))

(declare-fun res!695311 () Bool)

(assert (=> start!91698 (=> (not res!695311) (not e!591441))))

(declare-fun valid!2255 (LongMapFixedSize!6012) Bool)

(assert (=> start!91698 (= res!695311 (valid!2255 thiss!1427))))

(assert (=> start!91698 e!591441))

(declare-fun e!591435 () Bool)

(assert (=> start!91698 e!591435))

(assert (=> start!91698 true))

(declare-fun e!591439 () Bool)

(declare-fun array_inv!24457 (array!65814) Bool)

(declare-fun array_inv!24458 (array!65816) Bool)

(assert (=> b!1043763 (= e!591435 (and tp!74555 tp_is_empty!24825 (array_inv!24457 (_keys!11650 thiss!1427)) (array_inv!24458 (_values!6413 thiss!1427)) e!591439))))

(declare-fun mapIsEmpty!38861 () Bool)

(assert (=> mapIsEmpty!38861 mapRes!38861))

(declare-fun b!1043764 () Bool)

(declare-fun e!591436 () Bool)

(declare-datatypes ((SeekEntryResult!9835 0))(
  ( (MissingZero!9835 (index!41711 (_ BitVec 32))) (Found!9835 (index!41712 (_ BitVec 32))) (Intermediate!9835 (undefined!10647 Bool) (index!41713 (_ BitVec 32)) (x!93195 (_ BitVec 32))) (Undefined!9835) (MissingVacant!9835 (index!41714 (_ BitVec 32))) )
))
(declare-fun lt!460190 () SeekEntryResult!9835)

(assert (=> b!1043764 (= e!591436 (not (and (bvsge (index!41712 lt!460190) #b00000000000000000000000000000000) (bvslt (index!41712 lt!460190) (size!32195 (_values!6413 thiss!1427))))))))

(declare-fun lt!460189 () array!65814)

(declare-datatypes ((tuple2!15742 0))(
  ( (tuple2!15743 (_1!7882 (_ BitVec 64)) (_2!7882 V!37973)) )
))
(declare-datatypes ((List!21996 0))(
  ( (Nil!21993) (Cons!21992 (h!23200 tuple2!15742) (t!31220 List!21996)) )
))
(declare-datatypes ((ListLongMap!13771 0))(
  ( (ListLongMap!13772 (toList!6901 List!21996)) )
))
(declare-fun -!528 (ListLongMap!13771 (_ BitVec 64)) ListLongMap!13771)

(declare-fun getCurrentListMap!3949 (array!65814 array!65816 (_ BitVec 32) (_ BitVec 32) V!37973 V!37973 (_ BitVec 32) Int) ListLongMap!13771)

(declare-fun dynLambda!1998 (Int (_ BitVec 64)) V!37973)

(assert (=> b!1043764 (= (-!528 (getCurrentListMap!3949 (_keys!11650 thiss!1427) (_values!6413 thiss!1427) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6390 thiss!1427)) key!909) (getCurrentListMap!3949 lt!460189 (array!65817 (store (arr!31660 (_values!6413 thiss!1427)) (index!41712 lt!460190) (ValueCellFull!11709 (dynLambda!1998 (defaultEntry!6390 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32195 (_values!6413 thiss!1427))) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6390 thiss!1427)))))

(declare-datatypes ((Unit!34079 0))(
  ( (Unit!34080) )
))
(declare-fun lt!460191 () Unit!34079)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!49 (array!65814 array!65816 (_ BitVec 32) (_ BitVec 32) V!37973 V!37973 (_ BitVec 32) (_ BitVec 64) Int) Unit!34079)

(assert (=> b!1043764 (= lt!460191 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!49 (_keys!11650 thiss!1427) (_values!6413 thiss!1427) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) (index!41712 lt!460190) key!909 (defaultEntry!6390 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043764 (not (arrayContainsKey!0 lt!460189 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!460188 () Unit!34079)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65814 (_ BitVec 32) (_ BitVec 64)) Unit!34079)

(assert (=> b!1043764 (= lt!460188 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11650 thiss!1427) (index!41712 lt!460190) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65814 (_ BitVec 32)) Bool)

(assert (=> b!1043764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460189 (mask!30486 thiss!1427))))

(declare-fun lt!460185 () Unit!34079)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65814 (_ BitVec 32) (_ BitVec 32)) Unit!34079)

(assert (=> b!1043764 (= lt!460185 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11650 thiss!1427) (index!41712 lt!460190) (mask!30486 thiss!1427)))))

(declare-datatypes ((List!21997 0))(
  ( (Nil!21994) (Cons!21993 (h!23201 (_ BitVec 64)) (t!31221 List!21997)) )
))
(declare-fun arrayNoDuplicates!0 (array!65814 (_ BitVec 32) List!21997) Bool)

(assert (=> b!1043764 (arrayNoDuplicates!0 lt!460189 #b00000000000000000000000000000000 Nil!21994)))

(declare-fun lt!460186 () Unit!34079)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65814 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21997) Unit!34079)

(assert (=> b!1043764 (= lt!460186 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11650 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41712 lt!460190) #b00000000000000000000000000000000 Nil!21994))))

(declare-fun arrayCountValidKeys!0 (array!65814 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043764 (= (arrayCountValidKeys!0 lt!460189 #b00000000000000000000000000000000 (size!32194 (_keys!11650 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11650 thiss!1427) #b00000000000000000000000000000000 (size!32194 (_keys!11650 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043764 (= lt!460189 (array!65815 (store (arr!31659 (_keys!11650 thiss!1427)) (index!41712 lt!460190) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32194 (_keys!11650 thiss!1427))))))

(declare-fun lt!460187 () Unit!34079)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65814 (_ BitVec 32) (_ BitVec 64)) Unit!34079)

(assert (=> b!1043764 (= lt!460187 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11650 thiss!1427) (index!41712 lt!460190) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043765 () Bool)

(declare-fun e!591437 () Bool)

(assert (=> b!1043765 (= e!591439 (and e!591437 mapRes!38861))))

(declare-fun condMapEmpty!38861 () Bool)

(declare-fun mapDefault!38861 () ValueCell!11709)

(assert (=> b!1043765 (= condMapEmpty!38861 (= (arr!31660 (_values!6413 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11709)) mapDefault!38861)))))

(declare-fun b!1043766 () Bool)

(assert (=> b!1043766 (= e!591441 e!591436)))

(declare-fun res!695313 () Bool)

(assert (=> b!1043766 (=> (not res!695313) (not e!591436))))

(get-info :version)

(assert (=> b!1043766 (= res!695313 ((_ is Found!9835) lt!460190))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65814 (_ BitVec 32)) SeekEntryResult!9835)

(assert (=> b!1043766 (= lt!460190 (seekEntry!0 key!909 (_keys!11650 thiss!1427) (mask!30486 thiss!1427)))))

(declare-fun b!1043767 () Bool)

(assert (=> b!1043767 (= e!591437 tp_is_empty!24825)))

(assert (= (and start!91698 res!695311) b!1043762))

(assert (= (and b!1043762 res!695312) b!1043766))

(assert (= (and b!1043766 res!695313) b!1043764))

(assert (= (and b!1043765 condMapEmpty!38861) mapIsEmpty!38861))

(assert (= (and b!1043765 (not condMapEmpty!38861)) mapNonEmpty!38861))

(assert (= (and mapNonEmpty!38861 ((_ is ValueCellFull!11709) mapValue!38861)) b!1043761))

(assert (= (and b!1043765 ((_ is ValueCellFull!11709) mapDefault!38861)) b!1043767))

(assert (= b!1043763 b!1043765))

(assert (= start!91698 b!1043763))

(declare-fun b_lambda!16179 () Bool)

(assert (=> (not b_lambda!16179) (not b!1043764)))

(declare-fun t!31219 () Bool)

(declare-fun tb!7045 () Bool)

(assert (=> (and b!1043763 (= (defaultEntry!6390 thiss!1427) (defaultEntry!6390 thiss!1427)) t!31219) tb!7045))

(declare-fun result!14513 () Bool)

(assert (=> tb!7045 (= result!14513 tp_is_empty!24825)))

(assert (=> b!1043764 t!31219))

(declare-fun b_and!33653 () Bool)

(assert (= b_and!33651 (and (=> t!31219 result!14513) b_and!33653)))

(declare-fun m!963047 () Bool)

(assert (=> b!1043766 m!963047))

(declare-fun m!963049 () Bool)

(assert (=> b!1043763 m!963049))

(declare-fun m!963051 () Bool)

(assert (=> b!1043763 m!963051))

(declare-fun m!963053 () Bool)

(assert (=> b!1043764 m!963053))

(declare-fun m!963055 () Bool)

(assert (=> b!1043764 m!963055))

(declare-fun m!963057 () Bool)

(assert (=> b!1043764 m!963057))

(declare-fun m!963059 () Bool)

(assert (=> b!1043764 m!963059))

(declare-fun m!963061 () Bool)

(assert (=> b!1043764 m!963061))

(declare-fun m!963063 () Bool)

(assert (=> b!1043764 m!963063))

(declare-fun m!963065 () Bool)

(assert (=> b!1043764 m!963065))

(declare-fun m!963067 () Bool)

(assert (=> b!1043764 m!963067))

(declare-fun m!963069 () Bool)

(assert (=> b!1043764 m!963069))

(declare-fun m!963071 () Bool)

(assert (=> b!1043764 m!963071))

(declare-fun m!963073 () Bool)

(assert (=> b!1043764 m!963073))

(declare-fun m!963075 () Bool)

(assert (=> b!1043764 m!963075))

(declare-fun m!963077 () Bool)

(assert (=> b!1043764 m!963077))

(declare-fun m!963079 () Bool)

(assert (=> b!1043764 m!963079))

(declare-fun m!963081 () Bool)

(assert (=> b!1043764 m!963081))

(declare-fun m!963083 () Bool)

(assert (=> b!1043764 m!963083))

(assert (=> b!1043764 m!963075))

(declare-fun m!963085 () Bool)

(assert (=> start!91698 m!963085))

(declare-fun m!963087 () Bool)

(assert (=> mapNonEmpty!38861 m!963087))

(check-sat (not start!91698) (not b!1043764) (not b_lambda!16179) b_and!33653 (not b!1043766) tp_is_empty!24825 (not b!1043763) (not b_next!21105) (not mapNonEmpty!38861))
(check-sat b_and!33653 (not b_next!21105))
(get-model)

(declare-fun b_lambda!16183 () Bool)

(assert (= b_lambda!16179 (or (and b!1043763 b_free!21105) b_lambda!16183)))

(check-sat (not start!91698) (not b!1043764) (not b_lambda!16183) b_and!33653 (not b!1043766) tp_is_empty!24825 (not b!1043763) (not b_next!21105) (not mapNonEmpty!38861))
(check-sat b_and!33653 (not b_next!21105))
(get-model)

(declare-fun b!1043805 () Bool)

(declare-fun e!591469 () SeekEntryResult!9835)

(declare-fun lt!460223 () SeekEntryResult!9835)

(assert (=> b!1043805 (= e!591469 (ite ((_ is MissingVacant!9835) lt!460223) (MissingZero!9835 (index!41714 lt!460223)) lt!460223))))

(declare-fun lt!460222 () SeekEntryResult!9835)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65814 (_ BitVec 32)) SeekEntryResult!9835)

(assert (=> b!1043805 (= lt!460223 (seekKeyOrZeroReturnVacant!0 (x!93195 lt!460222) (index!41713 lt!460222) (index!41713 lt!460222) key!909 (_keys!11650 thiss!1427) (mask!30486 thiss!1427)))))

(declare-fun b!1043806 () Bool)

(declare-fun e!591470 () SeekEntryResult!9835)

(assert (=> b!1043806 (= e!591470 Undefined!9835)))

(declare-fun d!126297 () Bool)

(declare-fun lt!460221 () SeekEntryResult!9835)

(assert (=> d!126297 (and (or ((_ is MissingVacant!9835) lt!460221) (not ((_ is Found!9835) lt!460221)) (and (bvsge (index!41712 lt!460221) #b00000000000000000000000000000000) (bvslt (index!41712 lt!460221) (size!32194 (_keys!11650 thiss!1427))))) (not ((_ is MissingVacant!9835) lt!460221)) (or (not ((_ is Found!9835) lt!460221)) (= (select (arr!31659 (_keys!11650 thiss!1427)) (index!41712 lt!460221)) key!909)))))

(assert (=> d!126297 (= lt!460221 e!591470)))

(declare-fun c!105986 () Bool)

(assert (=> d!126297 (= c!105986 (and ((_ is Intermediate!9835) lt!460222) (undefined!10647 lt!460222)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65814 (_ BitVec 32)) SeekEntryResult!9835)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126297 (= lt!460222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30486 thiss!1427)) key!909 (_keys!11650 thiss!1427) (mask!30486 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!126297 (validMask!0 (mask!30486 thiss!1427))))

(assert (=> d!126297 (= (seekEntry!0 key!909 (_keys!11650 thiss!1427) (mask!30486 thiss!1427)) lt!460221)))

(declare-fun b!1043807 () Bool)

(declare-fun e!591471 () SeekEntryResult!9835)

(assert (=> b!1043807 (= e!591471 (Found!9835 (index!41713 lt!460222)))))

(declare-fun b!1043808 () Bool)

(assert (=> b!1043808 (= e!591470 e!591471)))

(declare-fun lt!460224 () (_ BitVec 64))

(assert (=> b!1043808 (= lt!460224 (select (arr!31659 (_keys!11650 thiss!1427)) (index!41713 lt!460222)))))

(declare-fun c!105987 () Bool)

(assert (=> b!1043808 (= c!105987 (= lt!460224 key!909))))

(declare-fun b!1043809 () Bool)

(assert (=> b!1043809 (= e!591469 (MissingZero!9835 (index!41713 lt!460222)))))

(declare-fun b!1043810 () Bool)

(declare-fun c!105988 () Bool)

(assert (=> b!1043810 (= c!105988 (= lt!460224 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1043810 (= e!591471 e!591469)))

(assert (= (and d!126297 c!105986) b!1043806))

(assert (= (and d!126297 (not c!105986)) b!1043808))

(assert (= (and b!1043808 c!105987) b!1043807))

(assert (= (and b!1043808 (not c!105987)) b!1043810))

(assert (= (and b!1043810 c!105988) b!1043809))

(assert (= (and b!1043810 (not c!105988)) b!1043805))

(declare-fun m!963131 () Bool)

(assert (=> b!1043805 m!963131))

(declare-fun m!963133 () Bool)

(assert (=> d!126297 m!963133))

(declare-fun m!963135 () Bool)

(assert (=> d!126297 m!963135))

(assert (=> d!126297 m!963135))

(declare-fun m!963137 () Bool)

(assert (=> d!126297 m!963137))

(declare-fun m!963139 () Bool)

(assert (=> d!126297 m!963139))

(declare-fun m!963141 () Bool)

(assert (=> b!1043808 m!963141))

(assert (=> b!1043766 d!126297))

(declare-fun d!126299 () Bool)

(declare-fun res!695329 () Bool)

(declare-fun e!591474 () Bool)

(assert (=> d!126299 (=> (not res!695329) (not e!591474))))

(declare-fun simpleValid!447 (LongMapFixedSize!6012) Bool)

(assert (=> d!126299 (= res!695329 (simpleValid!447 thiss!1427))))

(assert (=> d!126299 (= (valid!2255 thiss!1427) e!591474)))

(declare-fun b!1043817 () Bool)

(declare-fun res!695330 () Bool)

(assert (=> b!1043817 (=> (not res!695330) (not e!591474))))

(assert (=> b!1043817 (= res!695330 (= (arrayCountValidKeys!0 (_keys!11650 thiss!1427) #b00000000000000000000000000000000 (size!32194 (_keys!11650 thiss!1427))) (_size!3061 thiss!1427)))))

(declare-fun b!1043818 () Bool)

(declare-fun res!695331 () Bool)

(assert (=> b!1043818 (=> (not res!695331) (not e!591474))))

(assert (=> b!1043818 (= res!695331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11650 thiss!1427) (mask!30486 thiss!1427)))))

(declare-fun b!1043819 () Bool)

(assert (=> b!1043819 (= e!591474 (arrayNoDuplicates!0 (_keys!11650 thiss!1427) #b00000000000000000000000000000000 Nil!21994))))

(assert (= (and d!126299 res!695329) b!1043817))

(assert (= (and b!1043817 res!695330) b!1043818))

(assert (= (and b!1043818 res!695331) b!1043819))

(declare-fun m!963143 () Bool)

(assert (=> d!126299 m!963143))

(assert (=> b!1043817 m!963057))

(declare-fun m!963145 () Bool)

(assert (=> b!1043818 m!963145))

(declare-fun m!963147 () Bool)

(assert (=> b!1043819 m!963147))

(assert (=> start!91698 d!126299))

(declare-fun bm!44272 () Bool)

(declare-fun call!44281 () ListLongMap!13771)

(declare-fun call!44278 () ListLongMap!13771)

(assert (=> bm!44272 (= call!44281 call!44278)))

(declare-fun b!1043862 () Bool)

(declare-fun res!695354 () Bool)

(declare-fun e!591507 () Bool)

(assert (=> b!1043862 (=> (not res!695354) (not e!591507))))

(declare-fun e!591504 () Bool)

(assert (=> b!1043862 (= res!695354 e!591504)))

(declare-fun c!106002 () Bool)

(assert (=> b!1043862 (= c!106002 (not (= (bvand (extraKeys!6118 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1043863 () Bool)

(declare-fun res!695350 () Bool)

(assert (=> b!1043863 (=> (not res!695350) (not e!591507))))

(declare-fun e!591501 () Bool)

(assert (=> b!1043863 (= res!695350 e!591501)))

(declare-fun res!695358 () Bool)

(assert (=> b!1043863 (=> res!695358 e!591501)))

(declare-fun e!591512 () Bool)

(assert (=> b!1043863 (= res!695358 (not e!591512))))

(declare-fun res!695357 () Bool)

(assert (=> b!1043863 (=> (not res!695357) (not e!591512))))

(assert (=> b!1043863 (= res!695357 (bvslt #b00000000000000000000000000000000 (size!32194 lt!460189)))))

(declare-fun b!1043864 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1043864 (= e!591512 (validKeyInArray!0 (select (arr!31659 lt!460189) #b00000000000000000000000000000000)))))

(declare-fun d!126301 () Bool)

(assert (=> d!126301 e!591507))

(declare-fun res!695356 () Bool)

(assert (=> d!126301 (=> (not res!695356) (not e!591507))))

(assert (=> d!126301 (= res!695356 (or (bvsge #b00000000000000000000000000000000 (size!32194 lt!460189)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32194 lt!460189)))))))

(declare-fun lt!460281 () ListLongMap!13771)

(declare-fun lt!460289 () ListLongMap!13771)

(assert (=> d!126301 (= lt!460281 lt!460289)))

(declare-fun lt!460286 () Unit!34079)

(declare-fun e!591513 () Unit!34079)

(assert (=> d!126301 (= lt!460286 e!591513)))

(declare-fun c!106004 () Bool)

(declare-fun e!591509 () Bool)

(assert (=> d!126301 (= c!106004 e!591509)))

(declare-fun res!695351 () Bool)

(assert (=> d!126301 (=> (not res!695351) (not e!591509))))

(assert (=> d!126301 (= res!695351 (bvslt #b00000000000000000000000000000000 (size!32194 lt!460189)))))

(declare-fun e!591510 () ListLongMap!13771)

(assert (=> d!126301 (= lt!460289 e!591510)))

(declare-fun c!106005 () Bool)

(assert (=> d!126301 (= c!106005 (and (not (= (bvand (extraKeys!6118 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6118 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126301 (validMask!0 (mask!30486 thiss!1427))))

(assert (=> d!126301 (= (getCurrentListMap!3949 lt!460189 (array!65817 (store (arr!31660 (_values!6413 thiss!1427)) (index!41712 lt!460190) (ValueCellFull!11709 (dynLambda!1998 (defaultEntry!6390 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32195 (_values!6413 thiss!1427))) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6390 thiss!1427)) lt!460281)))

(declare-fun b!1043865 () Bool)

(declare-fun Unit!34081 () Unit!34079)

(assert (=> b!1043865 (= e!591513 Unit!34081)))

(declare-fun b!1043866 () Bool)

(declare-fun e!591503 () Bool)

(declare-fun call!44280 () Bool)

(assert (=> b!1043866 (= e!591503 (not call!44280))))

(declare-fun b!1043867 () Bool)

(declare-fun e!591508 () Bool)

(assert (=> b!1043867 (= e!591504 e!591508)))

(declare-fun res!695352 () Bool)

(declare-fun call!44276 () Bool)

(assert (=> b!1043867 (= res!695352 call!44276)))

(assert (=> b!1043867 (=> (not res!695352) (not e!591508))))

(declare-fun c!106003 () Bool)

(declare-fun bm!44273 () Bool)

(declare-fun call!44279 () ListLongMap!13771)

(declare-fun call!44277 () ListLongMap!13771)

(declare-fun +!3107 (ListLongMap!13771 tuple2!15742) ListLongMap!13771)

(assert (=> bm!44273 (= call!44277 (+!3107 (ite c!106005 call!44279 (ite c!106003 call!44278 call!44281)) (ite (or c!106005 c!106003) (tuple2!15743 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6224 thiss!1427)) (tuple2!15743 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6224 thiss!1427)))))))

(declare-fun bm!44274 () Bool)

(declare-fun contains!6064 (ListLongMap!13771 (_ BitVec 64)) Bool)

(assert (=> bm!44274 (= call!44280 (contains!6064 lt!460281 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043868 () Bool)

(assert (=> b!1043868 (= e!591509 (validKeyInArray!0 (select (arr!31659 lt!460189) #b00000000000000000000000000000000)))))

(declare-fun b!1043869 () Bool)

(assert (=> b!1043869 (= e!591510 (+!3107 call!44277 (tuple2!15743 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6224 thiss!1427))))))

(declare-fun b!1043870 () Bool)

(declare-fun e!591502 () ListLongMap!13771)

(declare-fun call!44275 () ListLongMap!13771)

(assert (=> b!1043870 (= e!591502 call!44275)))

(declare-fun b!1043871 () Bool)

(declare-fun e!591511 () Bool)

(assert (=> b!1043871 (= e!591501 e!591511)))

(declare-fun res!695353 () Bool)

(assert (=> b!1043871 (=> (not res!695353) (not e!591511))))

(assert (=> b!1043871 (= res!695353 (contains!6064 lt!460281 (select (arr!31659 lt!460189) #b00000000000000000000000000000000)))))

(assert (=> b!1043871 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32194 lt!460189)))))

(declare-fun b!1043872 () Bool)

(assert (=> b!1043872 (= e!591507 e!591503)))

(declare-fun c!106001 () Bool)

(assert (=> b!1043872 (= c!106001 (not (= (bvand (extraKeys!6118 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44275 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3523 (array!65814 array!65816 (_ BitVec 32) (_ BitVec 32) V!37973 V!37973 (_ BitVec 32) Int) ListLongMap!13771)

(assert (=> bm!44275 (= call!44279 (getCurrentListMapNoExtraKeys!3523 lt!460189 (array!65817 (store (arr!31660 (_values!6413 thiss!1427)) (index!41712 lt!460190) (ValueCellFull!11709 (dynLambda!1998 (defaultEntry!6390 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32195 (_values!6413 thiss!1427))) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6390 thiss!1427)))))

(declare-fun b!1043873 () Bool)

(declare-fun apply!909 (ListLongMap!13771 (_ BitVec 64)) V!37973)

(declare-fun get!16544 (ValueCell!11709 V!37973) V!37973)

(assert (=> b!1043873 (= e!591511 (= (apply!909 lt!460281 (select (arr!31659 lt!460189) #b00000000000000000000000000000000)) (get!16544 (select (arr!31660 (array!65817 (store (arr!31660 (_values!6413 thiss!1427)) (index!41712 lt!460190) (ValueCellFull!11709 (dynLambda!1998 (defaultEntry!6390 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32195 (_values!6413 thiss!1427)))) #b00000000000000000000000000000000) (dynLambda!1998 (defaultEntry!6390 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1043873 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32195 (array!65817 (store (arr!31660 (_values!6413 thiss!1427)) (index!41712 lt!460190) (ValueCellFull!11709 (dynLambda!1998 (defaultEntry!6390 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32195 (_values!6413 thiss!1427))))))))

(assert (=> b!1043873 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32194 lt!460189)))))

(declare-fun b!1043874 () Bool)

(declare-fun e!591506 () Bool)

(assert (=> b!1043874 (= e!591503 e!591506)))

(declare-fun res!695355 () Bool)

(assert (=> b!1043874 (= res!695355 call!44280)))

(assert (=> b!1043874 (=> (not res!695355) (not e!591506))))

(declare-fun b!1043875 () Bool)

(declare-fun e!591505 () ListLongMap!13771)

(assert (=> b!1043875 (= e!591505 call!44275)))

(declare-fun b!1043876 () Bool)

(assert (=> b!1043876 (= e!591510 e!591505)))

(assert (=> b!1043876 (= c!106003 (and (not (= (bvand (extraKeys!6118 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6118 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1043877 () Bool)

(assert (=> b!1043877 (= e!591508 (= (apply!909 lt!460281 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6224 thiss!1427)))))

(declare-fun bm!44276 () Bool)

(assert (=> bm!44276 (= call!44275 call!44277)))

(declare-fun b!1043878 () Bool)

(declare-fun lt!460285 () Unit!34079)

(assert (=> b!1043878 (= e!591513 lt!460285)))

(declare-fun lt!460271 () ListLongMap!13771)

(assert (=> b!1043878 (= lt!460271 (getCurrentListMapNoExtraKeys!3523 lt!460189 (array!65817 (store (arr!31660 (_values!6413 thiss!1427)) (index!41712 lt!460190) (ValueCellFull!11709 (dynLambda!1998 (defaultEntry!6390 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32195 (_values!6413 thiss!1427))) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6390 thiss!1427)))))

(declare-fun lt!460272 () (_ BitVec 64))

(assert (=> b!1043878 (= lt!460272 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460273 () (_ BitVec 64))

(assert (=> b!1043878 (= lt!460273 (select (arr!31659 lt!460189) #b00000000000000000000000000000000))))

(declare-fun lt!460275 () Unit!34079)

(declare-fun addStillContains!628 (ListLongMap!13771 (_ BitVec 64) V!37973 (_ BitVec 64)) Unit!34079)

(assert (=> b!1043878 (= lt!460275 (addStillContains!628 lt!460271 lt!460272 (zeroValue!6224 thiss!1427) lt!460273))))

(assert (=> b!1043878 (contains!6064 (+!3107 lt!460271 (tuple2!15743 lt!460272 (zeroValue!6224 thiss!1427))) lt!460273)))

(declare-fun lt!460288 () Unit!34079)

(assert (=> b!1043878 (= lt!460288 lt!460275)))

(declare-fun lt!460269 () ListLongMap!13771)

(assert (=> b!1043878 (= lt!460269 (getCurrentListMapNoExtraKeys!3523 lt!460189 (array!65817 (store (arr!31660 (_values!6413 thiss!1427)) (index!41712 lt!460190) (ValueCellFull!11709 (dynLambda!1998 (defaultEntry!6390 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32195 (_values!6413 thiss!1427))) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6390 thiss!1427)))))

(declare-fun lt!460276 () (_ BitVec 64))

(assert (=> b!1043878 (= lt!460276 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460282 () (_ BitVec 64))

(assert (=> b!1043878 (= lt!460282 (select (arr!31659 lt!460189) #b00000000000000000000000000000000))))

(declare-fun lt!460287 () Unit!34079)

(declare-fun addApplyDifferent!488 (ListLongMap!13771 (_ BitVec 64) V!37973 (_ BitVec 64)) Unit!34079)

(assert (=> b!1043878 (= lt!460287 (addApplyDifferent!488 lt!460269 lt!460276 (minValue!6224 thiss!1427) lt!460282))))

(assert (=> b!1043878 (= (apply!909 (+!3107 lt!460269 (tuple2!15743 lt!460276 (minValue!6224 thiss!1427))) lt!460282) (apply!909 lt!460269 lt!460282))))

(declare-fun lt!460274 () Unit!34079)

(assert (=> b!1043878 (= lt!460274 lt!460287)))

(declare-fun lt!460284 () ListLongMap!13771)

(assert (=> b!1043878 (= lt!460284 (getCurrentListMapNoExtraKeys!3523 lt!460189 (array!65817 (store (arr!31660 (_values!6413 thiss!1427)) (index!41712 lt!460190) (ValueCellFull!11709 (dynLambda!1998 (defaultEntry!6390 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32195 (_values!6413 thiss!1427))) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6390 thiss!1427)))))

(declare-fun lt!460283 () (_ BitVec 64))

(assert (=> b!1043878 (= lt!460283 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460270 () (_ BitVec 64))

(assert (=> b!1043878 (= lt!460270 (select (arr!31659 lt!460189) #b00000000000000000000000000000000))))

(declare-fun lt!460280 () Unit!34079)

(assert (=> b!1043878 (= lt!460280 (addApplyDifferent!488 lt!460284 lt!460283 (zeroValue!6224 thiss!1427) lt!460270))))

(assert (=> b!1043878 (= (apply!909 (+!3107 lt!460284 (tuple2!15743 lt!460283 (zeroValue!6224 thiss!1427))) lt!460270) (apply!909 lt!460284 lt!460270))))

(declare-fun lt!460290 () Unit!34079)

(assert (=> b!1043878 (= lt!460290 lt!460280)))

(declare-fun lt!460278 () ListLongMap!13771)

(assert (=> b!1043878 (= lt!460278 (getCurrentListMapNoExtraKeys!3523 lt!460189 (array!65817 (store (arr!31660 (_values!6413 thiss!1427)) (index!41712 lt!460190) (ValueCellFull!11709 (dynLambda!1998 (defaultEntry!6390 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32195 (_values!6413 thiss!1427))) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6390 thiss!1427)))))

(declare-fun lt!460279 () (_ BitVec 64))

(assert (=> b!1043878 (= lt!460279 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460277 () (_ BitVec 64))

(assert (=> b!1043878 (= lt!460277 (select (arr!31659 lt!460189) #b00000000000000000000000000000000))))

(assert (=> b!1043878 (= lt!460285 (addApplyDifferent!488 lt!460278 lt!460279 (minValue!6224 thiss!1427) lt!460277))))

(assert (=> b!1043878 (= (apply!909 (+!3107 lt!460278 (tuple2!15743 lt!460279 (minValue!6224 thiss!1427))) lt!460277) (apply!909 lt!460278 lt!460277))))

(declare-fun b!1043879 () Bool)

(declare-fun c!106006 () Bool)

(assert (=> b!1043879 (= c!106006 (and (not (= (bvand (extraKeys!6118 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6118 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1043879 (= e!591505 e!591502)))

(declare-fun bm!44277 () Bool)

(assert (=> bm!44277 (= call!44276 (contains!6064 lt!460281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043880 () Bool)

(assert (=> b!1043880 (= e!591502 call!44281)))

(declare-fun b!1043881 () Bool)

(assert (=> b!1043881 (= e!591504 (not call!44276))))

(declare-fun bm!44278 () Bool)

(assert (=> bm!44278 (= call!44278 call!44279)))

(declare-fun b!1043882 () Bool)

(assert (=> b!1043882 (= e!591506 (= (apply!909 lt!460281 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6224 thiss!1427)))))

(assert (= (and d!126301 c!106005) b!1043869))

(assert (= (and d!126301 (not c!106005)) b!1043876))

(assert (= (and b!1043876 c!106003) b!1043875))

(assert (= (and b!1043876 (not c!106003)) b!1043879))

(assert (= (and b!1043879 c!106006) b!1043870))

(assert (= (and b!1043879 (not c!106006)) b!1043880))

(assert (= (or b!1043870 b!1043880) bm!44272))

(assert (= (or b!1043875 bm!44272) bm!44278))

(assert (= (or b!1043875 b!1043870) bm!44276))

(assert (= (or b!1043869 bm!44278) bm!44275))

(assert (= (or b!1043869 bm!44276) bm!44273))

(assert (= (and d!126301 res!695351) b!1043868))

(assert (= (and d!126301 c!106004) b!1043878))

(assert (= (and d!126301 (not c!106004)) b!1043865))

(assert (= (and d!126301 res!695356) b!1043863))

(assert (= (and b!1043863 res!695357) b!1043864))

(assert (= (and b!1043863 (not res!695358)) b!1043871))

(assert (= (and b!1043871 res!695353) b!1043873))

(assert (= (and b!1043863 res!695350) b!1043862))

(assert (= (and b!1043862 c!106002) b!1043867))

(assert (= (and b!1043862 (not c!106002)) b!1043881))

(assert (= (and b!1043867 res!695352) b!1043877))

(assert (= (or b!1043867 b!1043881) bm!44277))

(assert (= (and b!1043862 res!695354) b!1043872))

(assert (= (and b!1043872 c!106001) b!1043874))

(assert (= (and b!1043872 (not c!106001)) b!1043866))

(assert (= (and b!1043874 res!695355) b!1043882))

(assert (= (or b!1043874 b!1043866) bm!44274))

(declare-fun b_lambda!16185 () Bool)

(assert (=> (not b_lambda!16185) (not b!1043873)))

(assert (=> b!1043873 t!31219))

(declare-fun b_and!33659 () Bool)

(assert (= b_and!33653 (and (=> t!31219 result!14513) b_and!33659)))

(assert (=> b!1043873 m!963069))

(declare-fun m!963149 () Bool)

(assert (=> b!1043873 m!963149))

(assert (=> b!1043873 m!963069))

(declare-fun m!963151 () Bool)

(assert (=> b!1043873 m!963151))

(assert (=> b!1043873 m!963149))

(declare-fun m!963153 () Bool)

(assert (=> b!1043873 m!963153))

(declare-fun m!963155 () Bool)

(assert (=> b!1043873 m!963155))

(assert (=> b!1043873 m!963153))

(declare-fun m!963157 () Bool)

(assert (=> bm!44274 m!963157))

(assert (=> b!1043868 m!963153))

(assert (=> b!1043868 m!963153))

(declare-fun m!963159 () Bool)

(assert (=> b!1043868 m!963159))

(declare-fun m!963161 () Bool)

(assert (=> bm!44273 m!963161))

(declare-fun m!963163 () Bool)

(assert (=> b!1043878 m!963163))

(declare-fun m!963165 () Bool)

(assert (=> b!1043878 m!963165))

(declare-fun m!963167 () Bool)

(assert (=> b!1043878 m!963167))

(declare-fun m!963169 () Bool)

(assert (=> b!1043878 m!963169))

(declare-fun m!963171 () Bool)

(assert (=> b!1043878 m!963171))

(declare-fun m!963173 () Bool)

(assert (=> b!1043878 m!963173))

(declare-fun m!963175 () Bool)

(assert (=> b!1043878 m!963175))

(declare-fun m!963177 () Bool)

(assert (=> b!1043878 m!963177))

(assert (=> b!1043878 m!963175))

(declare-fun m!963179 () Bool)

(assert (=> b!1043878 m!963179))

(declare-fun m!963181 () Bool)

(assert (=> b!1043878 m!963181))

(assert (=> b!1043878 m!963167))

(declare-fun m!963183 () Bool)

(assert (=> b!1043878 m!963183))

(declare-fun m!963185 () Bool)

(assert (=> b!1043878 m!963185))

(declare-fun m!963187 () Bool)

(assert (=> b!1043878 m!963187))

(declare-fun m!963189 () Bool)

(assert (=> b!1043878 m!963189))

(declare-fun m!963191 () Bool)

(assert (=> b!1043878 m!963191))

(assert (=> b!1043878 m!963163))

(assert (=> b!1043878 m!963153))

(assert (=> b!1043878 m!963185))

(declare-fun m!963193 () Bool)

(assert (=> b!1043878 m!963193))

(assert (=> d!126301 m!963139))

(declare-fun m!963195 () Bool)

(assert (=> b!1043869 m!963195))

(declare-fun m!963197 () Bool)

(assert (=> b!1043882 m!963197))

(assert (=> b!1043871 m!963153))

(assert (=> b!1043871 m!963153))

(declare-fun m!963199 () Bool)

(assert (=> b!1043871 m!963199))

(declare-fun m!963201 () Bool)

(assert (=> b!1043877 m!963201))

(assert (=> b!1043864 m!963153))

(assert (=> b!1043864 m!963153))

(assert (=> b!1043864 m!963159))

(assert (=> bm!44275 m!963171))

(declare-fun m!963203 () Bool)

(assert (=> bm!44277 m!963203))

(assert (=> b!1043764 d!126301))

(declare-fun d!126303 () Bool)

(declare-fun e!591516 () Bool)

(assert (=> d!126303 e!591516))

(declare-fun res!695361 () Bool)

(assert (=> d!126303 (=> (not res!695361) (not e!591516))))

(assert (=> d!126303 (= res!695361 (and (bvsge (index!41712 lt!460190) #b00000000000000000000000000000000) (bvslt (index!41712 lt!460190) (size!32194 (_keys!11650 thiss!1427)))))))

(declare-fun lt!460293 () Unit!34079)

(declare-fun choose!53 (array!65814 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21997) Unit!34079)

(assert (=> d!126303 (= lt!460293 (choose!53 (_keys!11650 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41712 lt!460190) #b00000000000000000000000000000000 Nil!21994))))

(assert (=> d!126303 (bvslt (size!32194 (_keys!11650 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126303 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11650 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41712 lt!460190) #b00000000000000000000000000000000 Nil!21994) lt!460293)))

(declare-fun b!1043885 () Bool)

(assert (=> b!1043885 (= e!591516 (arrayNoDuplicates!0 (array!65815 (store (arr!31659 (_keys!11650 thiss!1427)) (index!41712 lt!460190) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32194 (_keys!11650 thiss!1427))) #b00000000000000000000000000000000 Nil!21994))))

(assert (= (and d!126303 res!695361) b!1043885))

(declare-fun m!963205 () Bool)

(assert (=> d!126303 m!963205))

(assert (=> b!1043885 m!963071))

(declare-fun m!963207 () Bool)

(assert (=> b!1043885 m!963207))

(assert (=> b!1043764 d!126303))

(declare-fun b!1043897 () Bool)

(declare-fun e!591521 () Bool)

(assert (=> b!1043897 (= e!591521 (= (arrayCountValidKeys!0 (array!65815 (store (arr!31659 (_keys!11650 thiss!1427)) (index!41712 lt!460190) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32194 (_keys!11650 thiss!1427))) #b00000000000000000000000000000000 (size!32194 (_keys!11650 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11650 thiss!1427) #b00000000000000000000000000000000 (size!32194 (_keys!11650 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!126305 () Bool)

(assert (=> d!126305 e!591521))

(declare-fun res!695373 () Bool)

(assert (=> d!126305 (=> (not res!695373) (not e!591521))))

(assert (=> d!126305 (= res!695373 (and (bvsge (index!41712 lt!460190) #b00000000000000000000000000000000) (bvslt (index!41712 lt!460190) (size!32194 (_keys!11650 thiss!1427)))))))

(declare-fun lt!460296 () Unit!34079)

(declare-fun choose!82 (array!65814 (_ BitVec 32) (_ BitVec 64)) Unit!34079)

(assert (=> d!126305 (= lt!460296 (choose!82 (_keys!11650 thiss!1427) (index!41712 lt!460190) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!591522 () Bool)

(assert (=> d!126305 e!591522))

(declare-fun res!695370 () Bool)

(assert (=> d!126305 (=> (not res!695370) (not e!591522))))

(assert (=> d!126305 (= res!695370 (and (bvsge (index!41712 lt!460190) #b00000000000000000000000000000000) (bvslt (index!41712 lt!460190) (size!32194 (_keys!11650 thiss!1427)))))))

(assert (=> d!126305 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11650 thiss!1427) (index!41712 lt!460190) #b1000000000000000000000000000000000000000000000000000000000000000) lt!460296)))

(declare-fun b!1043896 () Bool)

(assert (=> b!1043896 (= e!591522 (bvslt (size!32194 (_keys!11650 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1043895 () Bool)

(declare-fun res!695371 () Bool)

(assert (=> b!1043895 (=> (not res!695371) (not e!591522))))

(assert (=> b!1043895 (= res!695371 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1043894 () Bool)

(declare-fun res!695372 () Bool)

(assert (=> b!1043894 (=> (not res!695372) (not e!591522))))

(assert (=> b!1043894 (= res!695372 (validKeyInArray!0 (select (arr!31659 (_keys!11650 thiss!1427)) (index!41712 lt!460190))))))

(assert (= (and d!126305 res!695370) b!1043894))

(assert (= (and b!1043894 res!695372) b!1043895))

(assert (= (and b!1043895 res!695371) b!1043896))

(assert (= (and d!126305 res!695373) b!1043897))

(assert (=> b!1043897 m!963071))

(declare-fun m!963209 () Bool)

(assert (=> b!1043897 m!963209))

(assert (=> b!1043897 m!963057))

(declare-fun m!963211 () Bool)

(assert (=> d!126305 m!963211))

(declare-fun m!963213 () Bool)

(assert (=> b!1043895 m!963213))

(declare-fun m!963215 () Bool)

(assert (=> b!1043894 m!963215))

(assert (=> b!1043894 m!963215))

(declare-fun m!963217 () Bool)

(assert (=> b!1043894 m!963217))

(assert (=> b!1043764 d!126305))

(declare-fun b!1043906 () Bool)

(declare-fun e!591531 () Bool)

(declare-fun call!44284 () Bool)

(assert (=> b!1043906 (= e!591531 call!44284)))

(declare-fun b!1043907 () Bool)

(declare-fun e!591529 () Bool)

(declare-fun e!591530 () Bool)

(assert (=> b!1043907 (= e!591529 e!591530)))

(declare-fun c!106009 () Bool)

(assert (=> b!1043907 (= c!106009 (validKeyInArray!0 (select (arr!31659 lt!460189) #b00000000000000000000000000000000)))))

(declare-fun bm!44281 () Bool)

(assert (=> bm!44281 (= call!44284 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!460189 (mask!30486 thiss!1427)))))

(declare-fun d!126307 () Bool)

(declare-fun res!695379 () Bool)

(assert (=> d!126307 (=> res!695379 e!591529)))

(assert (=> d!126307 (= res!695379 (bvsge #b00000000000000000000000000000000 (size!32194 lt!460189)))))

(assert (=> d!126307 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460189 (mask!30486 thiss!1427)) e!591529)))

(declare-fun b!1043908 () Bool)

(assert (=> b!1043908 (= e!591530 call!44284)))

(declare-fun b!1043909 () Bool)

(assert (=> b!1043909 (= e!591530 e!591531)))

(declare-fun lt!460305 () (_ BitVec 64))

(assert (=> b!1043909 (= lt!460305 (select (arr!31659 lt!460189) #b00000000000000000000000000000000))))

(declare-fun lt!460304 () Unit!34079)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65814 (_ BitVec 64) (_ BitVec 32)) Unit!34079)

(assert (=> b!1043909 (= lt!460304 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!460189 lt!460305 #b00000000000000000000000000000000))))

(assert (=> b!1043909 (arrayContainsKey!0 lt!460189 lt!460305 #b00000000000000000000000000000000)))

(declare-fun lt!460303 () Unit!34079)

(assert (=> b!1043909 (= lt!460303 lt!460304)))

(declare-fun res!695378 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65814 (_ BitVec 32)) SeekEntryResult!9835)

(assert (=> b!1043909 (= res!695378 (= (seekEntryOrOpen!0 (select (arr!31659 lt!460189) #b00000000000000000000000000000000) lt!460189 (mask!30486 thiss!1427)) (Found!9835 #b00000000000000000000000000000000)))))

(assert (=> b!1043909 (=> (not res!695378) (not e!591531))))

(assert (= (and d!126307 (not res!695379)) b!1043907))

(assert (= (and b!1043907 c!106009) b!1043909))

(assert (= (and b!1043907 (not c!106009)) b!1043908))

(assert (= (and b!1043909 res!695378) b!1043906))

(assert (= (or b!1043906 b!1043908) bm!44281))

(assert (=> b!1043907 m!963153))

(assert (=> b!1043907 m!963153))

(assert (=> b!1043907 m!963159))

(declare-fun m!963219 () Bool)

(assert (=> bm!44281 m!963219))

(assert (=> b!1043909 m!963153))

(declare-fun m!963221 () Bool)

(assert (=> b!1043909 m!963221))

(declare-fun m!963223 () Bool)

(assert (=> b!1043909 m!963223))

(assert (=> b!1043909 m!963153))

(declare-fun m!963225 () Bool)

(assert (=> b!1043909 m!963225))

(assert (=> b!1043764 d!126307))

(declare-fun bm!44282 () Bool)

(declare-fun call!44291 () ListLongMap!13771)

(declare-fun call!44288 () ListLongMap!13771)

(assert (=> bm!44282 (= call!44291 call!44288)))

(declare-fun b!1043910 () Bool)

(declare-fun res!695384 () Bool)

(declare-fun e!591538 () Bool)

(assert (=> b!1043910 (=> (not res!695384) (not e!591538))))

(declare-fun e!591535 () Bool)

(assert (=> b!1043910 (= res!695384 e!591535)))

(declare-fun c!106011 () Bool)

(assert (=> b!1043910 (= c!106011 (not (= (bvand (extraKeys!6118 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1043911 () Bool)

(declare-fun res!695380 () Bool)

(assert (=> b!1043911 (=> (not res!695380) (not e!591538))))

(declare-fun e!591532 () Bool)

(assert (=> b!1043911 (= res!695380 e!591532)))

(declare-fun res!695388 () Bool)

(assert (=> b!1043911 (=> res!695388 e!591532)))

(declare-fun e!591543 () Bool)

(assert (=> b!1043911 (= res!695388 (not e!591543))))

(declare-fun res!695387 () Bool)

(assert (=> b!1043911 (=> (not res!695387) (not e!591543))))

(assert (=> b!1043911 (= res!695387 (bvslt #b00000000000000000000000000000000 (size!32194 (_keys!11650 thiss!1427))))))

(declare-fun b!1043912 () Bool)

(assert (=> b!1043912 (= e!591543 (validKeyInArray!0 (select (arr!31659 (_keys!11650 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!126309 () Bool)

(assert (=> d!126309 e!591538))

(declare-fun res!695386 () Bool)

(assert (=> d!126309 (=> (not res!695386) (not e!591538))))

(assert (=> d!126309 (= res!695386 (or (bvsge #b00000000000000000000000000000000 (size!32194 (_keys!11650 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32194 (_keys!11650 thiss!1427))))))))

(declare-fun lt!460318 () ListLongMap!13771)

(declare-fun lt!460326 () ListLongMap!13771)

(assert (=> d!126309 (= lt!460318 lt!460326)))

(declare-fun lt!460323 () Unit!34079)

(declare-fun e!591544 () Unit!34079)

(assert (=> d!126309 (= lt!460323 e!591544)))

(declare-fun c!106013 () Bool)

(declare-fun e!591540 () Bool)

(assert (=> d!126309 (= c!106013 e!591540)))

(declare-fun res!695381 () Bool)

(assert (=> d!126309 (=> (not res!695381) (not e!591540))))

(assert (=> d!126309 (= res!695381 (bvslt #b00000000000000000000000000000000 (size!32194 (_keys!11650 thiss!1427))))))

(declare-fun e!591541 () ListLongMap!13771)

(assert (=> d!126309 (= lt!460326 e!591541)))

(declare-fun c!106014 () Bool)

(assert (=> d!126309 (= c!106014 (and (not (= (bvand (extraKeys!6118 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6118 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126309 (validMask!0 (mask!30486 thiss!1427))))

(assert (=> d!126309 (= (getCurrentListMap!3949 (_keys!11650 thiss!1427) (_values!6413 thiss!1427) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6390 thiss!1427)) lt!460318)))

(declare-fun b!1043913 () Bool)

(declare-fun Unit!34082 () Unit!34079)

(assert (=> b!1043913 (= e!591544 Unit!34082)))

(declare-fun b!1043914 () Bool)

(declare-fun e!591534 () Bool)

(declare-fun call!44290 () Bool)

(assert (=> b!1043914 (= e!591534 (not call!44290))))

(declare-fun b!1043915 () Bool)

(declare-fun e!591539 () Bool)

(assert (=> b!1043915 (= e!591535 e!591539)))

(declare-fun res!695382 () Bool)

(declare-fun call!44286 () Bool)

(assert (=> b!1043915 (= res!695382 call!44286)))

(assert (=> b!1043915 (=> (not res!695382) (not e!591539))))

(declare-fun call!44287 () ListLongMap!13771)

(declare-fun bm!44283 () Bool)

(declare-fun c!106012 () Bool)

(declare-fun call!44289 () ListLongMap!13771)

(assert (=> bm!44283 (= call!44287 (+!3107 (ite c!106014 call!44289 (ite c!106012 call!44288 call!44291)) (ite (or c!106014 c!106012) (tuple2!15743 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6224 thiss!1427)) (tuple2!15743 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6224 thiss!1427)))))))

(declare-fun bm!44284 () Bool)

(assert (=> bm!44284 (= call!44290 (contains!6064 lt!460318 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043916 () Bool)

(assert (=> b!1043916 (= e!591540 (validKeyInArray!0 (select (arr!31659 (_keys!11650 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043917 () Bool)

(assert (=> b!1043917 (= e!591541 (+!3107 call!44287 (tuple2!15743 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6224 thiss!1427))))))

(declare-fun b!1043918 () Bool)

(declare-fun e!591533 () ListLongMap!13771)

(declare-fun call!44285 () ListLongMap!13771)

(assert (=> b!1043918 (= e!591533 call!44285)))

(declare-fun b!1043919 () Bool)

(declare-fun e!591542 () Bool)

(assert (=> b!1043919 (= e!591532 e!591542)))

(declare-fun res!695383 () Bool)

(assert (=> b!1043919 (=> (not res!695383) (not e!591542))))

(assert (=> b!1043919 (= res!695383 (contains!6064 lt!460318 (select (arr!31659 (_keys!11650 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1043919 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32194 (_keys!11650 thiss!1427))))))

(declare-fun b!1043920 () Bool)

(assert (=> b!1043920 (= e!591538 e!591534)))

(declare-fun c!106010 () Bool)

(assert (=> b!1043920 (= c!106010 (not (= (bvand (extraKeys!6118 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44285 () Bool)

(assert (=> bm!44285 (= call!44289 (getCurrentListMapNoExtraKeys!3523 (_keys!11650 thiss!1427) (_values!6413 thiss!1427) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6390 thiss!1427)))))

(declare-fun b!1043921 () Bool)

(assert (=> b!1043921 (= e!591542 (= (apply!909 lt!460318 (select (arr!31659 (_keys!11650 thiss!1427)) #b00000000000000000000000000000000)) (get!16544 (select (arr!31660 (_values!6413 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1998 (defaultEntry!6390 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1043921 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32195 (_values!6413 thiss!1427))))))

(assert (=> b!1043921 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32194 (_keys!11650 thiss!1427))))))

(declare-fun b!1043922 () Bool)

(declare-fun e!591537 () Bool)

(assert (=> b!1043922 (= e!591534 e!591537)))

(declare-fun res!695385 () Bool)

(assert (=> b!1043922 (= res!695385 call!44290)))

(assert (=> b!1043922 (=> (not res!695385) (not e!591537))))

(declare-fun b!1043923 () Bool)

(declare-fun e!591536 () ListLongMap!13771)

(assert (=> b!1043923 (= e!591536 call!44285)))

(declare-fun b!1043924 () Bool)

(assert (=> b!1043924 (= e!591541 e!591536)))

(assert (=> b!1043924 (= c!106012 (and (not (= (bvand (extraKeys!6118 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6118 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1043925 () Bool)

(assert (=> b!1043925 (= e!591539 (= (apply!909 lt!460318 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6224 thiss!1427)))))

(declare-fun bm!44286 () Bool)

(assert (=> bm!44286 (= call!44285 call!44287)))

(declare-fun b!1043926 () Bool)

(declare-fun lt!460322 () Unit!34079)

(assert (=> b!1043926 (= e!591544 lt!460322)))

(declare-fun lt!460308 () ListLongMap!13771)

(assert (=> b!1043926 (= lt!460308 (getCurrentListMapNoExtraKeys!3523 (_keys!11650 thiss!1427) (_values!6413 thiss!1427) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6390 thiss!1427)))))

(declare-fun lt!460309 () (_ BitVec 64))

(assert (=> b!1043926 (= lt!460309 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460310 () (_ BitVec 64))

(assert (=> b!1043926 (= lt!460310 (select (arr!31659 (_keys!11650 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460312 () Unit!34079)

(assert (=> b!1043926 (= lt!460312 (addStillContains!628 lt!460308 lt!460309 (zeroValue!6224 thiss!1427) lt!460310))))

(assert (=> b!1043926 (contains!6064 (+!3107 lt!460308 (tuple2!15743 lt!460309 (zeroValue!6224 thiss!1427))) lt!460310)))

(declare-fun lt!460325 () Unit!34079)

(assert (=> b!1043926 (= lt!460325 lt!460312)))

(declare-fun lt!460306 () ListLongMap!13771)

(assert (=> b!1043926 (= lt!460306 (getCurrentListMapNoExtraKeys!3523 (_keys!11650 thiss!1427) (_values!6413 thiss!1427) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6390 thiss!1427)))))

(declare-fun lt!460313 () (_ BitVec 64))

(assert (=> b!1043926 (= lt!460313 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460319 () (_ BitVec 64))

(assert (=> b!1043926 (= lt!460319 (select (arr!31659 (_keys!11650 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460324 () Unit!34079)

(assert (=> b!1043926 (= lt!460324 (addApplyDifferent!488 lt!460306 lt!460313 (minValue!6224 thiss!1427) lt!460319))))

(assert (=> b!1043926 (= (apply!909 (+!3107 lt!460306 (tuple2!15743 lt!460313 (minValue!6224 thiss!1427))) lt!460319) (apply!909 lt!460306 lt!460319))))

(declare-fun lt!460311 () Unit!34079)

(assert (=> b!1043926 (= lt!460311 lt!460324)))

(declare-fun lt!460321 () ListLongMap!13771)

(assert (=> b!1043926 (= lt!460321 (getCurrentListMapNoExtraKeys!3523 (_keys!11650 thiss!1427) (_values!6413 thiss!1427) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6390 thiss!1427)))))

(declare-fun lt!460320 () (_ BitVec 64))

(assert (=> b!1043926 (= lt!460320 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460307 () (_ BitVec 64))

(assert (=> b!1043926 (= lt!460307 (select (arr!31659 (_keys!11650 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460317 () Unit!34079)

(assert (=> b!1043926 (= lt!460317 (addApplyDifferent!488 lt!460321 lt!460320 (zeroValue!6224 thiss!1427) lt!460307))))

(assert (=> b!1043926 (= (apply!909 (+!3107 lt!460321 (tuple2!15743 lt!460320 (zeroValue!6224 thiss!1427))) lt!460307) (apply!909 lt!460321 lt!460307))))

(declare-fun lt!460327 () Unit!34079)

(assert (=> b!1043926 (= lt!460327 lt!460317)))

(declare-fun lt!460315 () ListLongMap!13771)

(assert (=> b!1043926 (= lt!460315 (getCurrentListMapNoExtraKeys!3523 (_keys!11650 thiss!1427) (_values!6413 thiss!1427) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6390 thiss!1427)))))

(declare-fun lt!460316 () (_ BitVec 64))

(assert (=> b!1043926 (= lt!460316 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460314 () (_ BitVec 64))

(assert (=> b!1043926 (= lt!460314 (select (arr!31659 (_keys!11650 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043926 (= lt!460322 (addApplyDifferent!488 lt!460315 lt!460316 (minValue!6224 thiss!1427) lt!460314))))

(assert (=> b!1043926 (= (apply!909 (+!3107 lt!460315 (tuple2!15743 lt!460316 (minValue!6224 thiss!1427))) lt!460314) (apply!909 lt!460315 lt!460314))))

(declare-fun b!1043927 () Bool)

(declare-fun c!106015 () Bool)

(assert (=> b!1043927 (= c!106015 (and (not (= (bvand (extraKeys!6118 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6118 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1043927 (= e!591536 e!591533)))

(declare-fun bm!44287 () Bool)

(assert (=> bm!44287 (= call!44286 (contains!6064 lt!460318 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043928 () Bool)

(assert (=> b!1043928 (= e!591533 call!44291)))

(declare-fun b!1043929 () Bool)

(assert (=> b!1043929 (= e!591535 (not call!44286))))

(declare-fun bm!44288 () Bool)

(assert (=> bm!44288 (= call!44288 call!44289)))

(declare-fun b!1043930 () Bool)

(assert (=> b!1043930 (= e!591537 (= (apply!909 lt!460318 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6224 thiss!1427)))))

(assert (= (and d!126309 c!106014) b!1043917))

(assert (= (and d!126309 (not c!106014)) b!1043924))

(assert (= (and b!1043924 c!106012) b!1043923))

(assert (= (and b!1043924 (not c!106012)) b!1043927))

(assert (= (and b!1043927 c!106015) b!1043918))

(assert (= (and b!1043927 (not c!106015)) b!1043928))

(assert (= (or b!1043918 b!1043928) bm!44282))

(assert (= (or b!1043923 bm!44282) bm!44288))

(assert (= (or b!1043923 b!1043918) bm!44286))

(assert (= (or b!1043917 bm!44288) bm!44285))

(assert (= (or b!1043917 bm!44286) bm!44283))

(assert (= (and d!126309 res!695381) b!1043916))

(assert (= (and d!126309 c!106013) b!1043926))

(assert (= (and d!126309 (not c!106013)) b!1043913))

(assert (= (and d!126309 res!695386) b!1043911))

(assert (= (and b!1043911 res!695387) b!1043912))

(assert (= (and b!1043911 (not res!695388)) b!1043919))

(assert (= (and b!1043919 res!695383) b!1043921))

(assert (= (and b!1043911 res!695380) b!1043910))

(assert (= (and b!1043910 c!106011) b!1043915))

(assert (= (and b!1043910 (not c!106011)) b!1043929))

(assert (= (and b!1043915 res!695382) b!1043925))

(assert (= (or b!1043915 b!1043929) bm!44287))

(assert (= (and b!1043910 res!695384) b!1043920))

(assert (= (and b!1043920 c!106010) b!1043922))

(assert (= (and b!1043920 (not c!106010)) b!1043914))

(assert (= (and b!1043922 res!695385) b!1043930))

(assert (= (or b!1043922 b!1043914) bm!44284))

(declare-fun b_lambda!16187 () Bool)

(assert (=> (not b_lambda!16187) (not b!1043921)))

(assert (=> b!1043921 t!31219))

(declare-fun b_and!33661 () Bool)

(assert (= b_and!33659 (and (=> t!31219 result!14513) b_and!33661)))

(assert (=> b!1043921 m!963069))

(declare-fun m!963227 () Bool)

(assert (=> b!1043921 m!963227))

(assert (=> b!1043921 m!963069))

(declare-fun m!963229 () Bool)

(assert (=> b!1043921 m!963229))

(assert (=> b!1043921 m!963227))

(declare-fun m!963231 () Bool)

(assert (=> b!1043921 m!963231))

(declare-fun m!963233 () Bool)

(assert (=> b!1043921 m!963233))

(assert (=> b!1043921 m!963231))

(declare-fun m!963235 () Bool)

(assert (=> bm!44284 m!963235))

(assert (=> b!1043916 m!963231))

(assert (=> b!1043916 m!963231))

(declare-fun m!963237 () Bool)

(assert (=> b!1043916 m!963237))

(declare-fun m!963239 () Bool)

(assert (=> bm!44283 m!963239))

(declare-fun m!963241 () Bool)

(assert (=> b!1043926 m!963241))

(declare-fun m!963243 () Bool)

(assert (=> b!1043926 m!963243))

(declare-fun m!963245 () Bool)

(assert (=> b!1043926 m!963245))

(declare-fun m!963247 () Bool)

(assert (=> b!1043926 m!963247))

(declare-fun m!963249 () Bool)

(assert (=> b!1043926 m!963249))

(declare-fun m!963251 () Bool)

(assert (=> b!1043926 m!963251))

(declare-fun m!963253 () Bool)

(assert (=> b!1043926 m!963253))

(declare-fun m!963255 () Bool)

(assert (=> b!1043926 m!963255))

(assert (=> b!1043926 m!963253))

(declare-fun m!963257 () Bool)

(assert (=> b!1043926 m!963257))

(declare-fun m!963259 () Bool)

(assert (=> b!1043926 m!963259))

(assert (=> b!1043926 m!963245))

(declare-fun m!963261 () Bool)

(assert (=> b!1043926 m!963261))

(declare-fun m!963263 () Bool)

(assert (=> b!1043926 m!963263))

(declare-fun m!963265 () Bool)

(assert (=> b!1043926 m!963265))

(declare-fun m!963267 () Bool)

(assert (=> b!1043926 m!963267))

(declare-fun m!963269 () Bool)

(assert (=> b!1043926 m!963269))

(assert (=> b!1043926 m!963241))

(assert (=> b!1043926 m!963231))

(assert (=> b!1043926 m!963263))

(declare-fun m!963271 () Bool)

(assert (=> b!1043926 m!963271))

(assert (=> d!126309 m!963139))

(declare-fun m!963273 () Bool)

(assert (=> b!1043917 m!963273))

(declare-fun m!963275 () Bool)

(assert (=> b!1043930 m!963275))

(assert (=> b!1043919 m!963231))

(assert (=> b!1043919 m!963231))

(declare-fun m!963277 () Bool)

(assert (=> b!1043919 m!963277))

(declare-fun m!963279 () Bool)

(assert (=> b!1043925 m!963279))

(assert (=> b!1043912 m!963231))

(assert (=> b!1043912 m!963231))

(assert (=> b!1043912 m!963237))

(assert (=> bm!44285 m!963249))

(declare-fun m!963281 () Bool)

(assert (=> bm!44287 m!963281))

(assert (=> b!1043764 d!126309))

(declare-fun d!126311 () Bool)

(declare-fun e!591547 () Bool)

(assert (=> d!126311 e!591547))

(declare-fun res!695391 () Bool)

(assert (=> d!126311 (=> (not res!695391) (not e!591547))))

(assert (=> d!126311 (= res!695391 (and (bvsge (index!41712 lt!460190) #b00000000000000000000000000000000) (bvslt (index!41712 lt!460190) (size!32194 (_keys!11650 thiss!1427)))))))

(declare-fun lt!460330 () Unit!34079)

(declare-fun choose!1709 (array!65814 array!65816 (_ BitVec 32) (_ BitVec 32) V!37973 V!37973 (_ BitVec 32) (_ BitVec 64) Int) Unit!34079)

(assert (=> d!126311 (= lt!460330 (choose!1709 (_keys!11650 thiss!1427) (_values!6413 thiss!1427) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) (index!41712 lt!460190) key!909 (defaultEntry!6390 thiss!1427)))))

(assert (=> d!126311 (validMask!0 (mask!30486 thiss!1427))))

(assert (=> d!126311 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!49 (_keys!11650 thiss!1427) (_values!6413 thiss!1427) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) (index!41712 lt!460190) key!909 (defaultEntry!6390 thiss!1427)) lt!460330)))

(declare-fun b!1043933 () Bool)

(assert (=> b!1043933 (= e!591547 (= (-!528 (getCurrentListMap!3949 (_keys!11650 thiss!1427) (_values!6413 thiss!1427) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6390 thiss!1427)) key!909) (getCurrentListMap!3949 (array!65815 (store (arr!31659 (_keys!11650 thiss!1427)) (index!41712 lt!460190) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32194 (_keys!11650 thiss!1427))) (array!65817 (store (arr!31660 (_values!6413 thiss!1427)) (index!41712 lt!460190) (ValueCellFull!11709 (dynLambda!1998 (defaultEntry!6390 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32195 (_values!6413 thiss!1427))) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6390 thiss!1427))))))

(assert (=> b!1043933 (bvslt (index!41712 lt!460190) (size!32195 (_values!6413 thiss!1427)))))

(assert (= (and d!126311 res!695391) b!1043933))

(declare-fun b_lambda!16189 () Bool)

(assert (=> (not b_lambda!16189) (not b!1043933)))

(assert (=> b!1043933 t!31219))

(declare-fun b_and!33663 () Bool)

(assert (= b_and!33661 (and (=> t!31219 result!14513) b_and!33663)))

(declare-fun m!963283 () Bool)

(assert (=> d!126311 m!963283))

(assert (=> d!126311 m!963139))

(assert (=> b!1043933 m!963075))

(assert (=> b!1043933 m!963077))

(assert (=> b!1043933 m!963055))

(assert (=> b!1043933 m!963071))

(declare-fun m!963285 () Bool)

(assert (=> b!1043933 m!963285))

(assert (=> b!1043933 m!963075))

(assert (=> b!1043933 m!963069))

(assert (=> b!1043764 d!126311))

(declare-fun d!126313 () Bool)

(declare-fun e!591550 () Bool)

(assert (=> d!126313 e!591550))

(declare-fun res!695394 () Bool)

(assert (=> d!126313 (=> (not res!695394) (not e!591550))))

(assert (=> d!126313 (= res!695394 (and (bvsge (index!41712 lt!460190) #b00000000000000000000000000000000) (bvslt (index!41712 lt!460190) (size!32194 (_keys!11650 thiss!1427)))))))

(declare-fun lt!460333 () Unit!34079)

(declare-fun choose!25 (array!65814 (_ BitVec 32) (_ BitVec 32)) Unit!34079)

(assert (=> d!126313 (= lt!460333 (choose!25 (_keys!11650 thiss!1427) (index!41712 lt!460190) (mask!30486 thiss!1427)))))

(assert (=> d!126313 (validMask!0 (mask!30486 thiss!1427))))

(assert (=> d!126313 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11650 thiss!1427) (index!41712 lt!460190) (mask!30486 thiss!1427)) lt!460333)))

(declare-fun b!1043936 () Bool)

(assert (=> b!1043936 (= e!591550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65815 (store (arr!31659 (_keys!11650 thiss!1427)) (index!41712 lt!460190) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32194 (_keys!11650 thiss!1427))) (mask!30486 thiss!1427)))))

(assert (= (and d!126313 res!695394) b!1043936))

(declare-fun m!963287 () Bool)

(assert (=> d!126313 m!963287))

(assert (=> d!126313 m!963139))

(assert (=> b!1043936 m!963071))

(declare-fun m!963289 () Bool)

(assert (=> b!1043936 m!963289))

(assert (=> b!1043764 d!126313))

(declare-fun bm!44291 () Bool)

(declare-fun call!44294 () (_ BitVec 32))

(assert (=> bm!44291 (= call!44294 (arrayCountValidKeys!0 (_keys!11650 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32194 (_keys!11650 thiss!1427))))))

(declare-fun b!1043945 () Bool)

(declare-fun e!591555 () (_ BitVec 32))

(assert (=> b!1043945 (= e!591555 (bvadd #b00000000000000000000000000000001 call!44294))))

(declare-fun b!1043946 () Bool)

(assert (=> b!1043946 (= e!591555 call!44294)))

(declare-fun d!126315 () Bool)

(declare-fun lt!460336 () (_ BitVec 32))

(assert (=> d!126315 (and (bvsge lt!460336 #b00000000000000000000000000000000) (bvsle lt!460336 (bvsub (size!32194 (_keys!11650 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!591556 () (_ BitVec 32))

(assert (=> d!126315 (= lt!460336 e!591556)))

(declare-fun c!106020 () Bool)

(assert (=> d!126315 (= c!106020 (bvsge #b00000000000000000000000000000000 (size!32194 (_keys!11650 thiss!1427))))))

(assert (=> d!126315 (and (bvsle #b00000000000000000000000000000000 (size!32194 (_keys!11650 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32194 (_keys!11650 thiss!1427)) (size!32194 (_keys!11650 thiss!1427))))))

(assert (=> d!126315 (= (arrayCountValidKeys!0 (_keys!11650 thiss!1427) #b00000000000000000000000000000000 (size!32194 (_keys!11650 thiss!1427))) lt!460336)))

(declare-fun b!1043947 () Bool)

(assert (=> b!1043947 (= e!591556 #b00000000000000000000000000000000)))

(declare-fun b!1043948 () Bool)

(assert (=> b!1043948 (= e!591556 e!591555)))

(declare-fun c!106021 () Bool)

(assert (=> b!1043948 (= c!106021 (validKeyInArray!0 (select (arr!31659 (_keys!11650 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126315 c!106020) b!1043947))

(assert (= (and d!126315 (not c!106020)) b!1043948))

(assert (= (and b!1043948 c!106021) b!1043945))

(assert (= (and b!1043948 (not c!106021)) b!1043946))

(assert (= (or b!1043945 b!1043946) bm!44291))

(declare-fun m!963291 () Bool)

(assert (=> bm!44291 m!963291))

(assert (=> b!1043948 m!963231))

(assert (=> b!1043948 m!963231))

(assert (=> b!1043948 m!963237))

(assert (=> b!1043764 d!126315))

(declare-fun b!1043959 () Bool)

(declare-fun e!591568 () Bool)

(declare-fun call!44297 () Bool)

(assert (=> b!1043959 (= e!591568 call!44297)))

(declare-fun b!1043960 () Bool)

(assert (=> b!1043960 (= e!591568 call!44297)))

(declare-fun b!1043961 () Bool)

(declare-fun e!591567 () Bool)

(assert (=> b!1043961 (= e!591567 e!591568)))

(declare-fun c!106024 () Bool)

(assert (=> b!1043961 (= c!106024 (validKeyInArray!0 (select (arr!31659 lt!460189) #b00000000000000000000000000000000)))))

(declare-fun d!126317 () Bool)

(declare-fun res!695402 () Bool)

(declare-fun e!591566 () Bool)

(assert (=> d!126317 (=> res!695402 e!591566)))

(assert (=> d!126317 (= res!695402 (bvsge #b00000000000000000000000000000000 (size!32194 lt!460189)))))

(assert (=> d!126317 (= (arrayNoDuplicates!0 lt!460189 #b00000000000000000000000000000000 Nil!21994) e!591566)))

(declare-fun b!1043962 () Bool)

(assert (=> b!1043962 (= e!591566 e!591567)))

(declare-fun res!695401 () Bool)

(assert (=> b!1043962 (=> (not res!695401) (not e!591567))))

(declare-fun e!591565 () Bool)

(assert (=> b!1043962 (= res!695401 (not e!591565))))

(declare-fun res!695403 () Bool)

(assert (=> b!1043962 (=> (not res!695403) (not e!591565))))

(assert (=> b!1043962 (= res!695403 (validKeyInArray!0 (select (arr!31659 lt!460189) #b00000000000000000000000000000000)))))

(declare-fun bm!44294 () Bool)

(assert (=> bm!44294 (= call!44297 (arrayNoDuplicates!0 lt!460189 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106024 (Cons!21993 (select (arr!31659 lt!460189) #b00000000000000000000000000000000) Nil!21994) Nil!21994)))))

(declare-fun b!1043963 () Bool)

(declare-fun contains!6065 (List!21997 (_ BitVec 64)) Bool)

(assert (=> b!1043963 (= e!591565 (contains!6065 Nil!21994 (select (arr!31659 lt!460189) #b00000000000000000000000000000000)))))

(assert (= (and d!126317 (not res!695402)) b!1043962))

(assert (= (and b!1043962 res!695403) b!1043963))

(assert (= (and b!1043962 res!695401) b!1043961))

(assert (= (and b!1043961 c!106024) b!1043959))

(assert (= (and b!1043961 (not c!106024)) b!1043960))

(assert (= (or b!1043959 b!1043960) bm!44294))

(assert (=> b!1043961 m!963153))

(assert (=> b!1043961 m!963153))

(assert (=> b!1043961 m!963159))

(assert (=> b!1043962 m!963153))

(assert (=> b!1043962 m!963153))

(assert (=> b!1043962 m!963159))

(assert (=> bm!44294 m!963153))

(declare-fun m!963293 () Bool)

(assert (=> bm!44294 m!963293))

(assert (=> b!1043963 m!963153))

(assert (=> b!1043963 m!963153))

(declare-fun m!963295 () Bool)

(assert (=> b!1043963 m!963295))

(assert (=> b!1043764 d!126317))

(declare-fun d!126319 () Bool)

(declare-fun e!591571 () Bool)

(assert (=> d!126319 e!591571))

(declare-fun res!695406 () Bool)

(assert (=> d!126319 (=> (not res!695406) (not e!591571))))

(assert (=> d!126319 (= res!695406 (bvslt (index!41712 lt!460190) (size!32194 (_keys!11650 thiss!1427))))))

(declare-fun lt!460339 () Unit!34079)

(declare-fun choose!121 (array!65814 (_ BitVec 32) (_ BitVec 64)) Unit!34079)

(assert (=> d!126319 (= lt!460339 (choose!121 (_keys!11650 thiss!1427) (index!41712 lt!460190) key!909))))

(assert (=> d!126319 (bvsge (index!41712 lt!460190) #b00000000000000000000000000000000)))

(assert (=> d!126319 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11650 thiss!1427) (index!41712 lt!460190) key!909) lt!460339)))

(declare-fun b!1043966 () Bool)

(assert (=> b!1043966 (= e!591571 (not (arrayContainsKey!0 (array!65815 (store (arr!31659 (_keys!11650 thiss!1427)) (index!41712 lt!460190) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32194 (_keys!11650 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126319 res!695406) b!1043966))

(declare-fun m!963297 () Bool)

(assert (=> d!126319 m!963297))

(assert (=> b!1043966 m!963071))

(declare-fun m!963299 () Bool)

(assert (=> b!1043966 m!963299))

(assert (=> b!1043764 d!126319))

(declare-fun bm!44295 () Bool)

(declare-fun call!44298 () (_ BitVec 32))

(assert (=> bm!44295 (= call!44298 (arrayCountValidKeys!0 lt!460189 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32194 (_keys!11650 thiss!1427))))))

(declare-fun b!1043967 () Bool)

(declare-fun e!591572 () (_ BitVec 32))

(assert (=> b!1043967 (= e!591572 (bvadd #b00000000000000000000000000000001 call!44298))))

(declare-fun b!1043968 () Bool)

(assert (=> b!1043968 (= e!591572 call!44298)))

(declare-fun d!126321 () Bool)

(declare-fun lt!460340 () (_ BitVec 32))

(assert (=> d!126321 (and (bvsge lt!460340 #b00000000000000000000000000000000) (bvsle lt!460340 (bvsub (size!32194 lt!460189) #b00000000000000000000000000000000)))))

(declare-fun e!591573 () (_ BitVec 32))

(assert (=> d!126321 (= lt!460340 e!591573)))

(declare-fun c!106025 () Bool)

(assert (=> d!126321 (= c!106025 (bvsge #b00000000000000000000000000000000 (size!32194 (_keys!11650 thiss!1427))))))

(assert (=> d!126321 (and (bvsle #b00000000000000000000000000000000 (size!32194 (_keys!11650 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32194 (_keys!11650 thiss!1427)) (size!32194 lt!460189)))))

(assert (=> d!126321 (= (arrayCountValidKeys!0 lt!460189 #b00000000000000000000000000000000 (size!32194 (_keys!11650 thiss!1427))) lt!460340)))

(declare-fun b!1043969 () Bool)

(assert (=> b!1043969 (= e!591573 #b00000000000000000000000000000000)))

(declare-fun b!1043970 () Bool)

(assert (=> b!1043970 (= e!591573 e!591572)))

(declare-fun c!106026 () Bool)

(assert (=> b!1043970 (= c!106026 (validKeyInArray!0 (select (arr!31659 lt!460189) #b00000000000000000000000000000000)))))

(assert (= (and d!126321 c!106025) b!1043969))

(assert (= (and d!126321 (not c!106025)) b!1043970))

(assert (= (and b!1043970 c!106026) b!1043967))

(assert (= (and b!1043970 (not c!106026)) b!1043968))

(assert (= (or b!1043967 b!1043968) bm!44295))

(declare-fun m!963301 () Bool)

(assert (=> bm!44295 m!963301))

(assert (=> b!1043970 m!963153))

(assert (=> b!1043970 m!963153))

(assert (=> b!1043970 m!963159))

(assert (=> b!1043764 d!126321))

(declare-fun d!126323 () Bool)

(declare-fun lt!460343 () ListLongMap!13771)

(assert (=> d!126323 (not (contains!6064 lt!460343 key!909))))

(declare-fun removeStrictlySorted!59 (List!21996 (_ BitVec 64)) List!21996)

(assert (=> d!126323 (= lt!460343 (ListLongMap!13772 (removeStrictlySorted!59 (toList!6901 (getCurrentListMap!3949 (_keys!11650 thiss!1427) (_values!6413 thiss!1427) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6390 thiss!1427))) key!909)))))

(assert (=> d!126323 (= (-!528 (getCurrentListMap!3949 (_keys!11650 thiss!1427) (_values!6413 thiss!1427) (mask!30486 thiss!1427) (extraKeys!6118 thiss!1427) (zeroValue!6224 thiss!1427) (minValue!6224 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6390 thiss!1427)) key!909) lt!460343)))

(declare-fun bs!30507 () Bool)

(assert (= bs!30507 d!126323))

(declare-fun m!963303 () Bool)

(assert (=> bs!30507 m!963303))

(declare-fun m!963305 () Bool)

(assert (=> bs!30507 m!963305))

(assert (=> b!1043764 d!126323))

(declare-fun d!126325 () Bool)

(declare-fun res!695411 () Bool)

(declare-fun e!591578 () Bool)

(assert (=> d!126325 (=> res!695411 e!591578)))

(assert (=> d!126325 (= res!695411 (= (select (arr!31659 lt!460189) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126325 (= (arrayContainsKey!0 lt!460189 key!909 #b00000000000000000000000000000000) e!591578)))

(declare-fun b!1043975 () Bool)

(declare-fun e!591579 () Bool)

(assert (=> b!1043975 (= e!591578 e!591579)))

(declare-fun res!695412 () Bool)

(assert (=> b!1043975 (=> (not res!695412) (not e!591579))))

(assert (=> b!1043975 (= res!695412 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32194 lt!460189)))))

(declare-fun b!1043976 () Bool)

(assert (=> b!1043976 (= e!591579 (arrayContainsKey!0 lt!460189 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126325 (not res!695411)) b!1043975))

(assert (= (and b!1043975 res!695412) b!1043976))

(assert (=> d!126325 m!963153))

(declare-fun m!963307 () Bool)

(assert (=> b!1043976 m!963307))

(assert (=> b!1043764 d!126325))

(declare-fun d!126327 () Bool)

(assert (=> d!126327 (= (array_inv!24457 (_keys!11650 thiss!1427)) (bvsge (size!32194 (_keys!11650 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043763 d!126327))

(declare-fun d!126329 () Bool)

(assert (=> d!126329 (= (array_inv!24458 (_values!6413 thiss!1427)) (bvsge (size!32195 (_values!6413 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043763 d!126329))

(declare-fun b!1043983 () Bool)

(declare-fun e!591585 () Bool)

(assert (=> b!1043983 (= e!591585 tp_is_empty!24825)))

(declare-fun mapIsEmpty!38867 () Bool)

(declare-fun mapRes!38867 () Bool)

(assert (=> mapIsEmpty!38867 mapRes!38867))

(declare-fun b!1043984 () Bool)

(declare-fun e!591584 () Bool)

(assert (=> b!1043984 (= e!591584 tp_is_empty!24825)))

(declare-fun mapNonEmpty!38867 () Bool)

(declare-fun tp!74565 () Bool)

(assert (=> mapNonEmpty!38867 (= mapRes!38867 (and tp!74565 e!591585))))

(declare-fun mapKey!38867 () (_ BitVec 32))

(declare-fun mapRest!38867 () (Array (_ BitVec 32) ValueCell!11709))

(declare-fun mapValue!38867 () ValueCell!11709)

(assert (=> mapNonEmpty!38867 (= mapRest!38861 (store mapRest!38867 mapKey!38867 mapValue!38867))))

(declare-fun condMapEmpty!38867 () Bool)

(declare-fun mapDefault!38867 () ValueCell!11709)

(assert (=> mapNonEmpty!38861 (= condMapEmpty!38867 (= mapRest!38861 ((as const (Array (_ BitVec 32) ValueCell!11709)) mapDefault!38867)))))

(assert (=> mapNonEmpty!38861 (= tp!74556 (and e!591584 mapRes!38867))))

(assert (= (and mapNonEmpty!38861 condMapEmpty!38867) mapIsEmpty!38867))

(assert (= (and mapNonEmpty!38861 (not condMapEmpty!38867)) mapNonEmpty!38867))

(assert (= (and mapNonEmpty!38867 ((_ is ValueCellFull!11709) mapValue!38867)) b!1043983))

(assert (= (and mapNonEmpty!38861 ((_ is ValueCellFull!11709) mapDefault!38867)) b!1043984))

(declare-fun m!963309 () Bool)

(assert (=> mapNonEmpty!38867 m!963309))

(declare-fun b_lambda!16191 () Bool)

(assert (= b_lambda!16187 (or (and b!1043763 b_free!21105) b_lambda!16191)))

(declare-fun b_lambda!16193 () Bool)

(assert (= b_lambda!16189 (or (and b!1043763 b_free!21105) b_lambda!16193)))

(declare-fun b_lambda!16195 () Bool)

(assert (= b_lambda!16185 (or (and b!1043763 b_free!21105) b_lambda!16195)))

(check-sat (not b!1043869) (not b!1043871) (not b!1043805) (not d!126297) (not b!1043907) (not b!1043926) (not d!126305) (not b_next!21105) (not b!1043885) (not b!1043882) (not b!1043933) (not bm!44284) (not bm!44287) (not bm!44275) (not b!1043919) (not d!126309) (not d!126313) (not bm!44281) (not b!1043819) (not b!1043895) (not b!1043897) (not b!1043877) (not d!126319) (not b!1043909) (not b!1043868) (not bm!44274) (not b_lambda!16193) (not d!126323) b_and!33663 (not bm!44285) (not b!1043873) (not mapNonEmpty!38867) (not d!126299) (not b!1043878) (not d!126301) (not b_lambda!16191) (not d!126311) (not b!1043917) (not b!1043936) (not bm!44283) (not b_lambda!16183) (not b!1043921) (not b!1043916) (not b!1043961) (not b!1043925) (not b!1043894) (not b!1043970) (not bm!44295) (not bm!44291) (not bm!44277) (not b!1043912) (not bm!44294) (not b!1043864) tp_is_empty!24825 (not b!1043963) (not b!1043948) (not b!1043962) (not b!1043966) (not b_lambda!16195) (not b!1043930) (not b!1043976) (not bm!44273) (not b!1043817) (not b!1043818) (not d!126303))
(check-sat b_and!33663 (not b_next!21105))
