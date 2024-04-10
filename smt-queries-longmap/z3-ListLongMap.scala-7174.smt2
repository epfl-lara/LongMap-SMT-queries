; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91662 () Bool)

(assert start!91662)

(declare-fun b!1043504 () Bool)

(declare-fun b_free!21099 () Bool)

(declare-fun b_next!21099 () Bool)

(assert (=> b!1043504 (= b_free!21099 (not b_next!21099))))

(declare-fun tp!74535 () Bool)

(declare-fun b_and!33633 () Bool)

(assert (=> b!1043504 (= tp!74535 b_and!33633)))

(declare-fun mapNonEmpty!38849 () Bool)

(declare-fun mapRes!38849 () Bool)

(declare-fun tp!74534 () Bool)

(declare-fun e!591253 () Bool)

(assert (=> mapNonEmpty!38849 (= mapRes!38849 (and tp!74534 e!591253))))

(declare-datatypes ((V!37965 0))(
  ( (V!37966 (val!12460 Int)) )
))
(declare-datatypes ((ValueCell!11706 0))(
  ( (ValueCellFull!11706 (v!15051 V!37965)) (EmptyCell!11706) )
))
(declare-fun mapRest!38849 () (Array (_ BitVec 32) ValueCell!11706))

(declare-datatypes ((array!65800 0))(
  ( (array!65801 (arr!31653 (Array (_ BitVec 32) (_ BitVec 64))) (size!32188 (_ BitVec 32))) )
))
(declare-datatypes ((array!65802 0))(
  ( (array!65803 (arr!31654 (Array (_ BitVec 32) ValueCell!11706)) (size!32189 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6006 0))(
  ( (LongMapFixedSize!6007 (defaultEntry!6385 Int) (mask!30476 (_ BitVec 32)) (extraKeys!6113 (_ BitVec 32)) (zeroValue!6219 V!37965) (minValue!6219 V!37965) (_size!3058 (_ BitVec 32)) (_keys!11643 array!65800) (_values!6408 array!65802) (_vacant!3058 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6006)

(declare-fun mapValue!38849 () ValueCell!11706)

(declare-fun mapKey!38849 () (_ BitVec 32))

(assert (=> mapNonEmpty!38849 (= (arr!31654 (_values!6408 thiss!1427)) (store mapRest!38849 mapKey!38849 mapValue!38849))))

(declare-fun b!1043500 () Bool)

(declare-fun res!695194 () Bool)

(declare-fun e!591250 () Bool)

(assert (=> b!1043500 (=> (not res!695194) (not e!591250))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1043500 (= res!695194 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1043501 () Bool)

(declare-fun e!591254 () Bool)

(declare-fun tp_is_empty!24819 () Bool)

(assert (=> b!1043501 (= e!591254 tp_is_empty!24819)))

(declare-fun b!1043502 () Bool)

(declare-fun e!591255 () Bool)

(assert (=> b!1043502 (= e!591255 (and e!591254 mapRes!38849))))

(declare-fun condMapEmpty!38849 () Bool)

(declare-fun mapDefault!38849 () ValueCell!11706)

(assert (=> b!1043502 (= condMapEmpty!38849 (= (arr!31654 (_values!6408 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11706)) mapDefault!38849)))))

(declare-fun e!591251 () Bool)

(declare-fun array_inv!24453 (array!65800) Bool)

(declare-fun array_inv!24454 (array!65802) Bool)

(assert (=> b!1043504 (= e!591251 (and tp!74535 tp_is_empty!24819 (array_inv!24453 (_keys!11643 thiss!1427)) (array_inv!24454 (_values!6408 thiss!1427)) e!591255))))

(declare-fun b!1043505 () Bool)

(declare-fun e!591252 () Bool)

(assert (=> b!1043505 (= e!591250 e!591252)))

(declare-fun res!695195 () Bool)

(assert (=> b!1043505 (=> (not res!695195) (not e!591252))))

(declare-datatypes ((SeekEntryResult!9832 0))(
  ( (MissingZero!9832 (index!41699 (_ BitVec 32))) (Found!9832 (index!41700 (_ BitVec 32))) (Intermediate!9832 (undefined!10644 Bool) (index!41701 (_ BitVec 32)) (x!93168 (_ BitVec 32))) (Undefined!9832) (MissingVacant!9832 (index!41702 (_ BitVec 32))) )
))
(declare-fun lt!459994 () SeekEntryResult!9832)

(get-info :version)

(assert (=> b!1043505 (= res!695195 ((_ is Found!9832) lt!459994))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65800 (_ BitVec 32)) SeekEntryResult!9832)

(assert (=> b!1043505 (= lt!459994 (seekEntry!0 key!909 (_keys!11643 thiss!1427) (mask!30476 thiss!1427)))))

(declare-fun mapIsEmpty!38849 () Bool)

(assert (=> mapIsEmpty!38849 mapRes!38849))

(declare-fun b!1043506 () Bool)

(assert (=> b!1043506 (= e!591252 (not (and (bvsge (index!41700 lt!459994) #b00000000000000000000000000000000) (bvslt (index!41700 lt!459994) (size!32188 (_keys!11643 thiss!1427))))))))

(declare-fun lt!459995 () array!65800)

(declare-datatypes ((tuple2!15736 0))(
  ( (tuple2!15737 (_1!7879 (_ BitVec 64)) (_2!7879 V!37965)) )
))
(declare-datatypes ((List!21990 0))(
  ( (Nil!21987) (Cons!21986 (h!23194 tuple2!15736) (t!31208 List!21990)) )
))
(declare-datatypes ((ListLongMap!13765 0))(
  ( (ListLongMap!13766 (toList!6898 List!21990)) )
))
(declare-fun -!525 (ListLongMap!13765 (_ BitVec 64)) ListLongMap!13765)

(declare-fun getCurrentListMap!3946 (array!65800 array!65802 (_ BitVec 32) (_ BitVec 32) V!37965 V!37965 (_ BitVec 32) Int) ListLongMap!13765)

(declare-fun dynLambda!1995 (Int (_ BitVec 64)) V!37965)

(assert (=> b!1043506 (= (-!525 (getCurrentListMap!3946 (_keys!11643 thiss!1427) (_values!6408 thiss!1427) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6385 thiss!1427)) key!909) (getCurrentListMap!3946 lt!459995 (array!65803 (store (arr!31654 (_values!6408 thiss!1427)) (index!41700 lt!459994) (ValueCellFull!11706 (dynLambda!1995 (defaultEntry!6385 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32189 (_values!6408 thiss!1427))) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6385 thiss!1427)))))

(declare-datatypes ((Unit!34071 0))(
  ( (Unit!34072) )
))
(declare-fun lt!459996 () Unit!34071)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!46 (array!65800 array!65802 (_ BitVec 32) (_ BitVec 32) V!37965 V!37965 (_ BitVec 32) (_ BitVec 64) Int) Unit!34071)

(assert (=> b!1043506 (= lt!459996 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!46 (_keys!11643 thiss!1427) (_values!6408 thiss!1427) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) (index!41700 lt!459994) key!909 (defaultEntry!6385 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043506 (not (arrayContainsKey!0 lt!459995 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!459993 () Unit!34071)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65800 (_ BitVec 32) (_ BitVec 64)) Unit!34071)

(assert (=> b!1043506 (= lt!459993 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11643 thiss!1427) (index!41700 lt!459994) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65800 (_ BitVec 32)) Bool)

(assert (=> b!1043506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459995 (mask!30476 thiss!1427))))

(declare-fun lt!459991 () Unit!34071)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65800 (_ BitVec 32) (_ BitVec 32)) Unit!34071)

(assert (=> b!1043506 (= lt!459991 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11643 thiss!1427) (index!41700 lt!459994) (mask!30476 thiss!1427)))))

(declare-datatypes ((List!21991 0))(
  ( (Nil!21988) (Cons!21987 (h!23195 (_ BitVec 64)) (t!31209 List!21991)) )
))
(declare-fun arrayNoDuplicates!0 (array!65800 (_ BitVec 32) List!21991) Bool)

(assert (=> b!1043506 (arrayNoDuplicates!0 lt!459995 #b00000000000000000000000000000000 Nil!21988)))

(declare-fun lt!459997 () Unit!34071)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65800 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21991) Unit!34071)

(assert (=> b!1043506 (= lt!459997 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11643 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41700 lt!459994) #b00000000000000000000000000000000 Nil!21988))))

(declare-fun arrayCountValidKeys!0 (array!65800 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043506 (= (arrayCountValidKeys!0 lt!459995 #b00000000000000000000000000000000 (size!32188 (_keys!11643 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11643 thiss!1427) #b00000000000000000000000000000000 (size!32188 (_keys!11643 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043506 (= lt!459995 (array!65801 (store (arr!31653 (_keys!11643 thiss!1427)) (index!41700 lt!459994) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32188 (_keys!11643 thiss!1427))))))

(declare-fun lt!459992 () Unit!34071)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65800 (_ BitVec 32) (_ BitVec 64)) Unit!34071)

(assert (=> b!1043506 (= lt!459992 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11643 thiss!1427) (index!41700 lt!459994) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!695196 () Bool)

(assert (=> start!91662 (=> (not res!695196) (not e!591250))))

(declare-fun valid!2254 (LongMapFixedSize!6006) Bool)

(assert (=> start!91662 (= res!695196 (valid!2254 thiss!1427))))

(assert (=> start!91662 e!591250))

(assert (=> start!91662 e!591251))

(assert (=> start!91662 true))

(declare-fun b!1043503 () Bool)

(assert (=> b!1043503 (= e!591253 tp_is_empty!24819)))

(assert (= (and start!91662 res!695196) b!1043500))

(assert (= (and b!1043500 res!695194) b!1043505))

(assert (= (and b!1043505 res!695195) b!1043506))

(assert (= (and b!1043502 condMapEmpty!38849) mapIsEmpty!38849))

(assert (= (and b!1043502 (not condMapEmpty!38849)) mapNonEmpty!38849))

(assert (= (and mapNonEmpty!38849 ((_ is ValueCellFull!11706) mapValue!38849)) b!1043503))

(assert (= (and b!1043502 ((_ is ValueCellFull!11706) mapDefault!38849)) b!1043501))

(assert (= b!1043504 b!1043502))

(assert (= start!91662 b!1043504))

(declare-fun b_lambda!16159 () Bool)

(assert (=> (not b_lambda!16159) (not b!1043506)))

(declare-fun t!31207 () Bool)

(declare-fun tb!7039 () Bool)

(assert (=> (and b!1043504 (= (defaultEntry!6385 thiss!1427) (defaultEntry!6385 thiss!1427)) t!31207) tb!7039))

(declare-fun result!14499 () Bool)

(assert (=> tb!7039 (= result!14499 tp_is_empty!24819)))

(assert (=> b!1043506 t!31207))

(declare-fun b_and!33635 () Bool)

(assert (= b_and!33633 (and (=> t!31207 result!14499) b_and!33635)))

(declare-fun m!962741 () Bool)

(assert (=> start!91662 m!962741))

(declare-fun m!962743 () Bool)

(assert (=> b!1043505 m!962743))

(declare-fun m!962745 () Bool)

(assert (=> b!1043504 m!962745))

(declare-fun m!962747 () Bool)

(assert (=> b!1043504 m!962747))

(declare-fun m!962749 () Bool)

(assert (=> b!1043506 m!962749))

(declare-fun m!962751 () Bool)

(assert (=> b!1043506 m!962751))

(declare-fun m!962753 () Bool)

(assert (=> b!1043506 m!962753))

(declare-fun m!962755 () Bool)

(assert (=> b!1043506 m!962755))

(declare-fun m!962757 () Bool)

(assert (=> b!1043506 m!962757))

(declare-fun m!962759 () Bool)

(assert (=> b!1043506 m!962759))

(declare-fun m!962761 () Bool)

(assert (=> b!1043506 m!962761))

(declare-fun m!962763 () Bool)

(assert (=> b!1043506 m!962763))

(declare-fun m!962765 () Bool)

(assert (=> b!1043506 m!962765))

(declare-fun m!962767 () Bool)

(assert (=> b!1043506 m!962767))

(assert (=> b!1043506 m!962765))

(declare-fun m!962769 () Bool)

(assert (=> b!1043506 m!962769))

(declare-fun m!962771 () Bool)

(assert (=> b!1043506 m!962771))

(declare-fun m!962773 () Bool)

(assert (=> b!1043506 m!962773))

(declare-fun m!962775 () Bool)

(assert (=> b!1043506 m!962775))

(declare-fun m!962777 () Bool)

(assert (=> b!1043506 m!962777))

(declare-fun m!962779 () Bool)

(assert (=> b!1043506 m!962779))

(declare-fun m!962781 () Bool)

(assert (=> mapNonEmpty!38849 m!962781))

(check-sat tp_is_empty!24819 (not b!1043504) (not b_lambda!16159) (not mapNonEmpty!38849) (not b!1043506) (not b!1043505) (not b_next!21099) (not start!91662) b_and!33635)
(check-sat b_and!33635 (not b_next!21099))
(get-model)

(declare-fun b_lambda!16163 () Bool)

(assert (= b_lambda!16159 (or (and b!1043504 b_free!21099) b_lambda!16163)))

(check-sat tp_is_empty!24819 (not b!1043504) (not mapNonEmpty!38849) (not b_lambda!16163) (not b!1043506) (not b!1043505) (not b_next!21099) (not start!91662) b_and!33635)
(check-sat b_and!33635 (not b_next!21099))
(get-model)

(declare-fun d!126261 () Bool)

(declare-fun e!591279 () Bool)

(assert (=> d!126261 e!591279))

(declare-fun res!695208 () Bool)

(assert (=> d!126261 (=> (not res!695208) (not e!591279))))

(assert (=> d!126261 (= res!695208 (bvslt (index!41700 lt!459994) (size!32188 (_keys!11643 thiss!1427))))))

(declare-fun lt!460021 () Unit!34071)

(declare-fun choose!121 (array!65800 (_ BitVec 32) (_ BitVec 64)) Unit!34071)

(assert (=> d!126261 (= lt!460021 (choose!121 (_keys!11643 thiss!1427) (index!41700 lt!459994) key!909))))

(assert (=> d!126261 (bvsge (index!41700 lt!459994) #b00000000000000000000000000000000)))

(assert (=> d!126261 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11643 thiss!1427) (index!41700 lt!459994) key!909) lt!460021)))

(declare-fun b!1043534 () Bool)

(assert (=> b!1043534 (= e!591279 (not (arrayContainsKey!0 (array!65801 (store (arr!31653 (_keys!11643 thiss!1427)) (index!41700 lt!459994) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32188 (_keys!11643 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126261 res!695208) b!1043534))

(declare-fun m!962825 () Bool)

(assert (=> d!126261 m!962825))

(assert (=> b!1043534 m!962769))

(declare-fun m!962827 () Bool)

(assert (=> b!1043534 m!962827))

(assert (=> b!1043506 d!126261))

(declare-fun b!1043577 () Bool)

(declare-fun e!591312 () Bool)

(declare-fun lt!460080 () ListLongMap!13765)

(declare-fun apply!908 (ListLongMap!13765 (_ BitVec 64)) V!37965)

(assert (=> b!1043577 (= e!591312 (= (apply!908 lt!460080 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6219 thiss!1427)))))

(declare-fun b!1043578 () Bool)

(declare-fun e!591307 () ListLongMap!13765)

(declare-fun call!44238 () ListLongMap!13765)

(declare-fun +!3106 (ListLongMap!13765 tuple2!15736) ListLongMap!13765)

(assert (=> b!1043578 (= e!591307 (+!3106 call!44238 (tuple2!15737 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6219 thiss!1427))))))

(declare-fun bm!44234 () Bool)

(declare-fun call!44239 () ListLongMap!13765)

(declare-fun call!44237 () ListLongMap!13765)

(assert (=> bm!44234 (= call!44239 call!44237)))

(declare-fun b!1043580 () Bool)

(declare-fun e!591315 () Bool)

(declare-fun get!16541 (ValueCell!11706 V!37965) V!37965)

(assert (=> b!1043580 (= e!591315 (= (apply!908 lt!460080 (select (arr!31653 (_keys!11643 thiss!1427)) #b00000000000000000000000000000000)) (get!16541 (select (arr!31654 (_values!6408 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1995 (defaultEntry!6385 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1043580 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32189 (_values!6408 thiss!1427))))))

(assert (=> b!1043580 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32188 (_keys!11643 thiss!1427))))))

(declare-fun b!1043581 () Bool)

(declare-fun res!695234 () Bool)

(declare-fun e!591318 () Bool)

(assert (=> b!1043581 (=> (not res!695234) (not e!591318))))

(declare-fun e!591313 () Bool)

(assert (=> b!1043581 (= res!695234 e!591313)))

(declare-fun c!105949 () Bool)

(assert (=> b!1043581 (= c!105949 (not (= (bvand (extraKeys!6113 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1043582 () Bool)

(declare-fun e!591308 () Bool)

(assert (=> b!1043582 (= e!591308 e!591315)))

(declare-fun res!695230 () Bool)

(assert (=> b!1043582 (=> (not res!695230) (not e!591315))))

(declare-fun contains!6062 (ListLongMap!13765 (_ BitVec 64)) Bool)

(assert (=> b!1043582 (= res!695230 (contains!6062 lt!460080 (select (arr!31653 (_keys!11643 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1043582 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32188 (_keys!11643 thiss!1427))))))

(declare-fun b!1043583 () Bool)

(declare-fun res!695229 () Bool)

(assert (=> b!1043583 (=> (not res!695229) (not e!591318))))

(assert (=> b!1043583 (= res!695229 e!591308)))

(declare-fun res!695227 () Bool)

(assert (=> b!1043583 (=> res!695227 e!591308)))

(declare-fun e!591317 () Bool)

(assert (=> b!1043583 (= res!695227 (not e!591317))))

(declare-fun res!695231 () Bool)

(assert (=> b!1043583 (=> (not res!695231) (not e!591317))))

(assert (=> b!1043583 (= res!695231 (bvslt #b00000000000000000000000000000000 (size!32188 (_keys!11643 thiss!1427))))))

(declare-fun b!1043584 () Bool)

(declare-fun e!591314 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1043584 (= e!591314 (validKeyInArray!0 (select (arr!31653 (_keys!11643 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043585 () Bool)

(declare-fun e!591306 () ListLongMap!13765)

(assert (=> b!1043585 (= e!591307 e!591306)))

(declare-fun c!105948 () Bool)

(assert (=> b!1043585 (= c!105948 (and (not (= (bvand (extraKeys!6113 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6113 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1043586 () Bool)

(declare-fun c!105947 () Bool)

(assert (=> b!1043586 (= c!105947 (and (not (= (bvand (extraKeys!6113 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6113 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!591311 () ListLongMap!13765)

(assert (=> b!1043586 (= e!591306 e!591311)))

(declare-fun b!1043587 () Bool)

(declare-fun call!44242 () Bool)

(assert (=> b!1043587 (= e!591313 (not call!44242))))

(declare-fun b!1043588 () Bool)

(declare-fun e!591310 () Bool)

(declare-fun e!591316 () Bool)

(assert (=> b!1043588 (= e!591310 e!591316)))

(declare-fun res!695235 () Bool)

(declare-fun call!44241 () Bool)

(assert (=> b!1043588 (= res!695235 call!44241)))

(assert (=> b!1043588 (=> (not res!695235) (not e!591316))))

(declare-fun bm!44235 () Bool)

(declare-fun call!44240 () ListLongMap!13765)

(assert (=> bm!44235 (= call!44240 call!44239)))

(declare-fun d!126263 () Bool)

(assert (=> d!126263 e!591318))

(declare-fun res!695233 () Bool)

(assert (=> d!126263 (=> (not res!695233) (not e!591318))))

(assert (=> d!126263 (= res!695233 (or (bvsge #b00000000000000000000000000000000 (size!32188 (_keys!11643 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32188 (_keys!11643 thiss!1427))))))))

(declare-fun lt!460071 () ListLongMap!13765)

(assert (=> d!126263 (= lt!460080 lt!460071)))

(declare-fun lt!460084 () Unit!34071)

(declare-fun e!591309 () Unit!34071)

(assert (=> d!126263 (= lt!460084 e!591309)))

(declare-fun c!105946 () Bool)

(assert (=> d!126263 (= c!105946 e!591314)))

(declare-fun res!695228 () Bool)

(assert (=> d!126263 (=> (not res!695228) (not e!591314))))

(assert (=> d!126263 (= res!695228 (bvslt #b00000000000000000000000000000000 (size!32188 (_keys!11643 thiss!1427))))))

(assert (=> d!126263 (= lt!460071 e!591307)))

(declare-fun c!105950 () Bool)

(assert (=> d!126263 (= c!105950 (and (not (= (bvand (extraKeys!6113 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6113 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!126263 (validMask!0 (mask!30476 thiss!1427))))

(assert (=> d!126263 (= (getCurrentListMap!3946 (_keys!11643 thiss!1427) (_values!6408 thiss!1427) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6385 thiss!1427)) lt!460080)))

(declare-fun b!1043579 () Bool)

(declare-fun Unit!34075 () Unit!34071)

(assert (=> b!1043579 (= e!591309 Unit!34075)))

(declare-fun bm!44236 () Bool)

(assert (=> bm!44236 (= call!44242 (contains!6062 lt!460080 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44237 () Bool)

(declare-fun call!44243 () ListLongMap!13765)

(assert (=> bm!44237 (= call!44243 call!44238)))

(declare-fun b!1043589 () Bool)

(assert (=> b!1043589 (= e!591316 (= (apply!908 lt!460080 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6219 thiss!1427)))))

(declare-fun b!1043590 () Bool)

(assert (=> b!1043590 (= e!591317 (validKeyInArray!0 (select (arr!31653 (_keys!11643 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043591 () Bool)

(assert (=> b!1043591 (= e!591318 e!591310)))

(declare-fun c!105945 () Bool)

(assert (=> b!1043591 (= c!105945 (not (= (bvand (extraKeys!6113 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1043592 () Bool)

(assert (=> b!1043592 (= e!591311 call!44243)))

(declare-fun bm!44238 () Bool)

(assert (=> bm!44238 (= call!44241 (contains!6062 lt!460080 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043593 () Bool)

(assert (=> b!1043593 (= e!591313 e!591312)))

(declare-fun res!695232 () Bool)

(assert (=> b!1043593 (= res!695232 call!44242)))

(assert (=> b!1043593 (=> (not res!695232) (not e!591312))))

(declare-fun b!1043594 () Bool)

(assert (=> b!1043594 (= e!591306 call!44243)))

(declare-fun bm!44239 () Bool)

(assert (=> bm!44239 (= call!44238 (+!3106 (ite c!105950 call!44237 (ite c!105948 call!44239 call!44240)) (ite (or c!105950 c!105948) (tuple2!15737 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6219 thiss!1427)) (tuple2!15737 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6219 thiss!1427)))))))

(declare-fun b!1043595 () Bool)

(declare-fun lt!460087 () Unit!34071)

(assert (=> b!1043595 (= e!591309 lt!460087)))

(declare-fun lt!460069 () ListLongMap!13765)

(declare-fun getCurrentListMapNoExtraKeys!3522 (array!65800 array!65802 (_ BitVec 32) (_ BitVec 32) V!37965 V!37965 (_ BitVec 32) Int) ListLongMap!13765)

(assert (=> b!1043595 (= lt!460069 (getCurrentListMapNoExtraKeys!3522 (_keys!11643 thiss!1427) (_values!6408 thiss!1427) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6385 thiss!1427)))))

(declare-fun lt!460072 () (_ BitVec 64))

(assert (=> b!1043595 (= lt!460072 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460077 () (_ BitVec 64))

(assert (=> b!1043595 (= lt!460077 (select (arr!31653 (_keys!11643 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460085 () Unit!34071)

(declare-fun addStillContains!627 (ListLongMap!13765 (_ BitVec 64) V!37965 (_ BitVec 64)) Unit!34071)

(assert (=> b!1043595 (= lt!460085 (addStillContains!627 lt!460069 lt!460072 (zeroValue!6219 thiss!1427) lt!460077))))

(assert (=> b!1043595 (contains!6062 (+!3106 lt!460069 (tuple2!15737 lt!460072 (zeroValue!6219 thiss!1427))) lt!460077)))

(declare-fun lt!460073 () Unit!34071)

(assert (=> b!1043595 (= lt!460073 lt!460085)))

(declare-fun lt!460083 () ListLongMap!13765)

(assert (=> b!1043595 (= lt!460083 (getCurrentListMapNoExtraKeys!3522 (_keys!11643 thiss!1427) (_values!6408 thiss!1427) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6385 thiss!1427)))))

(declare-fun lt!460075 () (_ BitVec 64))

(assert (=> b!1043595 (= lt!460075 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460086 () (_ BitVec 64))

(assert (=> b!1043595 (= lt!460086 (select (arr!31653 (_keys!11643 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460067 () Unit!34071)

(declare-fun addApplyDifferent!487 (ListLongMap!13765 (_ BitVec 64) V!37965 (_ BitVec 64)) Unit!34071)

(assert (=> b!1043595 (= lt!460067 (addApplyDifferent!487 lt!460083 lt!460075 (minValue!6219 thiss!1427) lt!460086))))

(assert (=> b!1043595 (= (apply!908 (+!3106 lt!460083 (tuple2!15737 lt!460075 (minValue!6219 thiss!1427))) lt!460086) (apply!908 lt!460083 lt!460086))))

(declare-fun lt!460076 () Unit!34071)

(assert (=> b!1043595 (= lt!460076 lt!460067)))

(declare-fun lt!460066 () ListLongMap!13765)

(assert (=> b!1043595 (= lt!460066 (getCurrentListMapNoExtraKeys!3522 (_keys!11643 thiss!1427) (_values!6408 thiss!1427) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6385 thiss!1427)))))

(declare-fun lt!460068 () (_ BitVec 64))

(assert (=> b!1043595 (= lt!460068 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460081 () (_ BitVec 64))

(assert (=> b!1043595 (= lt!460081 (select (arr!31653 (_keys!11643 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460074 () Unit!34071)

(assert (=> b!1043595 (= lt!460074 (addApplyDifferent!487 lt!460066 lt!460068 (zeroValue!6219 thiss!1427) lt!460081))))

(assert (=> b!1043595 (= (apply!908 (+!3106 lt!460066 (tuple2!15737 lt!460068 (zeroValue!6219 thiss!1427))) lt!460081) (apply!908 lt!460066 lt!460081))))

(declare-fun lt!460082 () Unit!34071)

(assert (=> b!1043595 (= lt!460082 lt!460074)))

(declare-fun lt!460070 () ListLongMap!13765)

(assert (=> b!1043595 (= lt!460070 (getCurrentListMapNoExtraKeys!3522 (_keys!11643 thiss!1427) (_values!6408 thiss!1427) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6385 thiss!1427)))))

(declare-fun lt!460078 () (_ BitVec 64))

(assert (=> b!1043595 (= lt!460078 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460079 () (_ BitVec 64))

(assert (=> b!1043595 (= lt!460079 (select (arr!31653 (_keys!11643 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043595 (= lt!460087 (addApplyDifferent!487 lt!460070 lt!460078 (minValue!6219 thiss!1427) lt!460079))))

(assert (=> b!1043595 (= (apply!908 (+!3106 lt!460070 (tuple2!15737 lt!460078 (minValue!6219 thiss!1427))) lt!460079) (apply!908 lt!460070 lt!460079))))

(declare-fun b!1043596 () Bool)

(assert (=> b!1043596 (= e!591310 (not call!44241))))

(declare-fun bm!44240 () Bool)

(assert (=> bm!44240 (= call!44237 (getCurrentListMapNoExtraKeys!3522 (_keys!11643 thiss!1427) (_values!6408 thiss!1427) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6385 thiss!1427)))))

(declare-fun b!1043597 () Bool)

(assert (=> b!1043597 (= e!591311 call!44240)))

(assert (= (and d!126263 c!105950) b!1043578))

(assert (= (and d!126263 (not c!105950)) b!1043585))

(assert (= (and b!1043585 c!105948) b!1043594))

(assert (= (and b!1043585 (not c!105948)) b!1043586))

(assert (= (and b!1043586 c!105947) b!1043592))

(assert (= (and b!1043586 (not c!105947)) b!1043597))

(assert (= (or b!1043592 b!1043597) bm!44235))

(assert (= (or b!1043594 bm!44235) bm!44234))

(assert (= (or b!1043594 b!1043592) bm!44237))

(assert (= (or b!1043578 bm!44234) bm!44240))

(assert (= (or b!1043578 bm!44237) bm!44239))

(assert (= (and d!126263 res!695228) b!1043584))

(assert (= (and d!126263 c!105946) b!1043595))

(assert (= (and d!126263 (not c!105946)) b!1043579))

(assert (= (and d!126263 res!695233) b!1043583))

(assert (= (and b!1043583 res!695231) b!1043590))

(assert (= (and b!1043583 (not res!695227)) b!1043582))

(assert (= (and b!1043582 res!695230) b!1043580))

(assert (= (and b!1043583 res!695229) b!1043581))

(assert (= (and b!1043581 c!105949) b!1043593))

(assert (= (and b!1043581 (not c!105949)) b!1043587))

(assert (= (and b!1043593 res!695232) b!1043577))

(assert (= (or b!1043593 b!1043587) bm!44236))

(assert (= (and b!1043581 res!695234) b!1043591))

(assert (= (and b!1043591 c!105945) b!1043588))

(assert (= (and b!1043591 (not c!105945)) b!1043596))

(assert (= (and b!1043588 res!695235) b!1043589))

(assert (= (or b!1043588 b!1043596) bm!44238))

(declare-fun b_lambda!16165 () Bool)

(assert (=> (not b_lambda!16165) (not b!1043580)))

(assert (=> b!1043580 t!31207))

(declare-fun b_and!33641 () Bool)

(assert (= b_and!33635 (and (=> t!31207 result!14499) b_and!33641)))

(declare-fun m!962829 () Bool)

(assert (=> d!126263 m!962829))

(declare-fun m!962831 () Bool)

(assert (=> bm!44236 m!962831))

(declare-fun m!962833 () Bool)

(assert (=> b!1043584 m!962833))

(assert (=> b!1043584 m!962833))

(declare-fun m!962835 () Bool)

(assert (=> b!1043584 m!962835))

(declare-fun m!962837 () Bool)

(assert (=> b!1043595 m!962837))

(declare-fun m!962839 () Bool)

(assert (=> b!1043595 m!962839))

(declare-fun m!962841 () Bool)

(assert (=> b!1043595 m!962841))

(assert (=> b!1043595 m!962833))

(declare-fun m!962843 () Bool)

(assert (=> b!1043595 m!962843))

(declare-fun m!962845 () Bool)

(assert (=> b!1043595 m!962845))

(declare-fun m!962847 () Bool)

(assert (=> b!1043595 m!962847))

(declare-fun m!962849 () Bool)

(assert (=> b!1043595 m!962849))

(declare-fun m!962851 () Bool)

(assert (=> b!1043595 m!962851))

(assert (=> b!1043595 m!962845))

(declare-fun m!962853 () Bool)

(assert (=> b!1043595 m!962853))

(declare-fun m!962855 () Bool)

(assert (=> b!1043595 m!962855))

(assert (=> b!1043595 m!962839))

(declare-fun m!962857 () Bool)

(assert (=> b!1043595 m!962857))

(declare-fun m!962859 () Bool)

(assert (=> b!1043595 m!962859))

(declare-fun m!962861 () Bool)

(assert (=> b!1043595 m!962861))

(assert (=> b!1043595 m!962847))

(declare-fun m!962863 () Bool)

(assert (=> b!1043595 m!962863))

(declare-fun m!962865 () Bool)

(assert (=> b!1043595 m!962865))

(assert (=> b!1043595 m!962843))

(declare-fun m!962867 () Bool)

(assert (=> b!1043595 m!962867))

(assert (=> b!1043580 m!962833))

(assert (=> b!1043580 m!962779))

(declare-fun m!962869 () Bool)

(assert (=> b!1043580 m!962869))

(assert (=> b!1043580 m!962779))

(declare-fun m!962871 () Bool)

(assert (=> b!1043580 m!962871))

(assert (=> b!1043580 m!962869))

(assert (=> b!1043580 m!962833))

(declare-fun m!962873 () Bool)

(assert (=> b!1043580 m!962873))

(declare-fun m!962875 () Bool)

(assert (=> bm!44239 m!962875))

(declare-fun m!962877 () Bool)

(assert (=> b!1043589 m!962877))

(assert (=> b!1043582 m!962833))

(assert (=> b!1043582 m!962833))

(declare-fun m!962879 () Bool)

(assert (=> b!1043582 m!962879))

(declare-fun m!962881 () Bool)

(assert (=> b!1043578 m!962881))

(assert (=> b!1043590 m!962833))

(assert (=> b!1043590 m!962833))

(assert (=> b!1043590 m!962835))

(declare-fun m!962883 () Bool)

(assert (=> bm!44238 m!962883))

(assert (=> bm!44240 m!962865))

(declare-fun m!962885 () Bool)

(assert (=> b!1043577 m!962885))

(assert (=> b!1043506 d!126263))

(declare-fun d!126265 () Bool)

(declare-fun lt!460090 () ListLongMap!13765)

(assert (=> d!126265 (not (contains!6062 lt!460090 key!909))))

(declare-fun removeStrictlySorted!58 (List!21990 (_ BitVec 64)) List!21990)

(assert (=> d!126265 (= lt!460090 (ListLongMap!13766 (removeStrictlySorted!58 (toList!6898 (getCurrentListMap!3946 (_keys!11643 thiss!1427) (_values!6408 thiss!1427) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6385 thiss!1427))) key!909)))))

(assert (=> d!126265 (= (-!525 (getCurrentListMap!3946 (_keys!11643 thiss!1427) (_values!6408 thiss!1427) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6385 thiss!1427)) key!909) lt!460090)))

(declare-fun bs!30503 () Bool)

(assert (= bs!30503 d!126265))

(declare-fun m!962887 () Bool)

(assert (=> bs!30503 m!962887))

(declare-fun m!962889 () Bool)

(assert (=> bs!30503 m!962889))

(assert (=> b!1043506 d!126265))

(declare-fun bm!44243 () Bool)

(declare-fun call!44246 () (_ BitVec 32))

(assert (=> bm!44243 (= call!44246 (arrayCountValidKeys!0 lt!459995 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32188 (_keys!11643 thiss!1427))))))

(declare-fun b!1043606 () Bool)

(declare-fun e!591323 () (_ BitVec 32))

(assert (=> b!1043606 (= e!591323 #b00000000000000000000000000000000)))

(declare-fun b!1043607 () Bool)

(declare-fun e!591324 () (_ BitVec 32))

(assert (=> b!1043607 (= e!591324 (bvadd #b00000000000000000000000000000001 call!44246))))

(declare-fun b!1043608 () Bool)

(assert (=> b!1043608 (= e!591324 call!44246)))

(declare-fun d!126267 () Bool)

(declare-fun lt!460093 () (_ BitVec 32))

(assert (=> d!126267 (and (bvsge lt!460093 #b00000000000000000000000000000000) (bvsle lt!460093 (bvsub (size!32188 lt!459995) #b00000000000000000000000000000000)))))

(assert (=> d!126267 (= lt!460093 e!591323)))

(declare-fun c!105956 () Bool)

(assert (=> d!126267 (= c!105956 (bvsge #b00000000000000000000000000000000 (size!32188 (_keys!11643 thiss!1427))))))

(assert (=> d!126267 (and (bvsle #b00000000000000000000000000000000 (size!32188 (_keys!11643 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32188 (_keys!11643 thiss!1427)) (size!32188 lt!459995)))))

(assert (=> d!126267 (= (arrayCountValidKeys!0 lt!459995 #b00000000000000000000000000000000 (size!32188 (_keys!11643 thiss!1427))) lt!460093)))

(declare-fun b!1043609 () Bool)

(assert (=> b!1043609 (= e!591323 e!591324)))

(declare-fun c!105955 () Bool)

(assert (=> b!1043609 (= c!105955 (validKeyInArray!0 (select (arr!31653 lt!459995) #b00000000000000000000000000000000)))))

(assert (= (and d!126267 c!105956) b!1043606))

(assert (= (and d!126267 (not c!105956)) b!1043609))

(assert (= (and b!1043609 c!105955) b!1043607))

(assert (= (and b!1043609 (not c!105955)) b!1043608))

(assert (= (or b!1043607 b!1043608) bm!44243))

(declare-fun m!962891 () Bool)

(assert (=> bm!44243 m!962891))

(declare-fun m!962893 () Bool)

(assert (=> b!1043609 m!962893))

(assert (=> b!1043609 m!962893))

(declare-fun m!962895 () Bool)

(assert (=> b!1043609 m!962895))

(assert (=> b!1043506 d!126267))

(declare-fun d!126269 () Bool)

(declare-fun res!695240 () Bool)

(declare-fun e!591329 () Bool)

(assert (=> d!126269 (=> res!695240 e!591329)))

(assert (=> d!126269 (= res!695240 (= (select (arr!31653 lt!459995) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126269 (= (arrayContainsKey!0 lt!459995 key!909 #b00000000000000000000000000000000) e!591329)))

(declare-fun b!1043614 () Bool)

(declare-fun e!591330 () Bool)

(assert (=> b!1043614 (= e!591329 e!591330)))

(declare-fun res!695241 () Bool)

(assert (=> b!1043614 (=> (not res!695241) (not e!591330))))

(assert (=> b!1043614 (= res!695241 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32188 lt!459995)))))

(declare-fun b!1043615 () Bool)

(assert (=> b!1043615 (= e!591330 (arrayContainsKey!0 lt!459995 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126269 (not res!695240)) b!1043614))

(assert (= (and b!1043614 res!695241) b!1043615))

(assert (=> d!126269 m!962893))

(declare-fun m!962897 () Bool)

(assert (=> b!1043615 m!962897))

(assert (=> b!1043506 d!126269))

(declare-fun b!1043625 () Bool)

(declare-fun res!695253 () Bool)

(declare-fun e!591336 () Bool)

(assert (=> b!1043625 (=> (not res!695253) (not e!591336))))

(assert (=> b!1043625 (= res!695253 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!126271 () Bool)

(declare-fun e!591335 () Bool)

(assert (=> d!126271 e!591335))

(declare-fun res!695251 () Bool)

(assert (=> d!126271 (=> (not res!695251) (not e!591335))))

(assert (=> d!126271 (= res!695251 (and (bvsge (index!41700 lt!459994) #b00000000000000000000000000000000) (bvslt (index!41700 lt!459994) (size!32188 (_keys!11643 thiss!1427)))))))

(declare-fun lt!460096 () Unit!34071)

(declare-fun choose!82 (array!65800 (_ BitVec 32) (_ BitVec 64)) Unit!34071)

(assert (=> d!126271 (= lt!460096 (choose!82 (_keys!11643 thiss!1427) (index!41700 lt!459994) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126271 e!591336))

(declare-fun res!695252 () Bool)

(assert (=> d!126271 (=> (not res!695252) (not e!591336))))

(assert (=> d!126271 (= res!695252 (and (bvsge (index!41700 lt!459994) #b00000000000000000000000000000000) (bvslt (index!41700 lt!459994) (size!32188 (_keys!11643 thiss!1427)))))))

(assert (=> d!126271 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11643 thiss!1427) (index!41700 lt!459994) #b1000000000000000000000000000000000000000000000000000000000000000) lt!460096)))

(declare-fun b!1043626 () Bool)

(assert (=> b!1043626 (= e!591336 (bvslt (size!32188 (_keys!11643 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1043624 () Bool)

(declare-fun res!695250 () Bool)

(assert (=> b!1043624 (=> (not res!695250) (not e!591336))))

(assert (=> b!1043624 (= res!695250 (validKeyInArray!0 (select (arr!31653 (_keys!11643 thiss!1427)) (index!41700 lt!459994))))))

(declare-fun b!1043627 () Bool)

(assert (=> b!1043627 (= e!591335 (= (arrayCountValidKeys!0 (array!65801 (store (arr!31653 (_keys!11643 thiss!1427)) (index!41700 lt!459994) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32188 (_keys!11643 thiss!1427))) #b00000000000000000000000000000000 (size!32188 (_keys!11643 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11643 thiss!1427) #b00000000000000000000000000000000 (size!32188 (_keys!11643 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!126271 res!695252) b!1043624))

(assert (= (and b!1043624 res!695250) b!1043625))

(assert (= (and b!1043625 res!695253) b!1043626))

(assert (= (and d!126271 res!695251) b!1043627))

(declare-fun m!962899 () Bool)

(assert (=> b!1043625 m!962899))

(declare-fun m!962901 () Bool)

(assert (=> d!126271 m!962901))

(declare-fun m!962903 () Bool)

(assert (=> b!1043624 m!962903))

(assert (=> b!1043624 m!962903))

(declare-fun m!962905 () Bool)

(assert (=> b!1043624 m!962905))

(assert (=> b!1043627 m!962769))

(declare-fun m!962907 () Bool)

(assert (=> b!1043627 m!962907))

(assert (=> b!1043627 m!962775))

(assert (=> b!1043506 d!126271))

(declare-fun b!1043628 () Bool)

(declare-fun e!591343 () Bool)

(declare-fun lt!460111 () ListLongMap!13765)

(assert (=> b!1043628 (= e!591343 (= (apply!908 lt!460111 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6219 thiss!1427)))))

(declare-fun b!1043629 () Bool)

(declare-fun e!591338 () ListLongMap!13765)

(declare-fun call!44248 () ListLongMap!13765)

(assert (=> b!1043629 (= e!591338 (+!3106 call!44248 (tuple2!15737 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6219 thiss!1427))))))

(declare-fun bm!44244 () Bool)

(declare-fun call!44249 () ListLongMap!13765)

(declare-fun call!44247 () ListLongMap!13765)

(assert (=> bm!44244 (= call!44249 call!44247)))

(declare-fun e!591346 () Bool)

(declare-fun b!1043631 () Bool)

(assert (=> b!1043631 (= e!591346 (= (apply!908 lt!460111 (select (arr!31653 lt!459995) #b00000000000000000000000000000000)) (get!16541 (select (arr!31654 (array!65803 (store (arr!31654 (_values!6408 thiss!1427)) (index!41700 lt!459994) (ValueCellFull!11706 (dynLambda!1995 (defaultEntry!6385 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32189 (_values!6408 thiss!1427)))) #b00000000000000000000000000000000) (dynLambda!1995 (defaultEntry!6385 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1043631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32189 (array!65803 (store (arr!31654 (_values!6408 thiss!1427)) (index!41700 lt!459994) (ValueCellFull!11706 (dynLambda!1995 (defaultEntry!6385 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32189 (_values!6408 thiss!1427))))))))

(assert (=> b!1043631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32188 lt!459995)))))

(declare-fun b!1043632 () Bool)

(declare-fun res!695261 () Bool)

(declare-fun e!591349 () Bool)

(assert (=> b!1043632 (=> (not res!695261) (not e!591349))))

(declare-fun e!591344 () Bool)

(assert (=> b!1043632 (= res!695261 e!591344)))

(declare-fun c!105961 () Bool)

(assert (=> b!1043632 (= c!105961 (not (= (bvand (extraKeys!6113 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1043633 () Bool)

(declare-fun e!591339 () Bool)

(assert (=> b!1043633 (= e!591339 e!591346)))

(declare-fun res!695257 () Bool)

(assert (=> b!1043633 (=> (not res!695257) (not e!591346))))

(assert (=> b!1043633 (= res!695257 (contains!6062 lt!460111 (select (arr!31653 lt!459995) #b00000000000000000000000000000000)))))

(assert (=> b!1043633 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32188 lt!459995)))))

(declare-fun b!1043634 () Bool)

(declare-fun res!695256 () Bool)

(assert (=> b!1043634 (=> (not res!695256) (not e!591349))))

(assert (=> b!1043634 (= res!695256 e!591339)))

(declare-fun res!695254 () Bool)

(assert (=> b!1043634 (=> res!695254 e!591339)))

(declare-fun e!591348 () Bool)

(assert (=> b!1043634 (= res!695254 (not e!591348))))

(declare-fun res!695258 () Bool)

(assert (=> b!1043634 (=> (not res!695258) (not e!591348))))

(assert (=> b!1043634 (= res!695258 (bvslt #b00000000000000000000000000000000 (size!32188 lt!459995)))))

(declare-fun b!1043635 () Bool)

(declare-fun e!591345 () Bool)

(assert (=> b!1043635 (= e!591345 (validKeyInArray!0 (select (arr!31653 lt!459995) #b00000000000000000000000000000000)))))

(declare-fun b!1043636 () Bool)

(declare-fun e!591337 () ListLongMap!13765)

(assert (=> b!1043636 (= e!591338 e!591337)))

(declare-fun c!105960 () Bool)

(assert (=> b!1043636 (= c!105960 (and (not (= (bvand (extraKeys!6113 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6113 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1043637 () Bool)

(declare-fun c!105959 () Bool)

(assert (=> b!1043637 (= c!105959 (and (not (= (bvand (extraKeys!6113 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6113 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!591342 () ListLongMap!13765)

(assert (=> b!1043637 (= e!591337 e!591342)))

(declare-fun b!1043638 () Bool)

(declare-fun call!44252 () Bool)

(assert (=> b!1043638 (= e!591344 (not call!44252))))

(declare-fun b!1043639 () Bool)

(declare-fun e!591341 () Bool)

(declare-fun e!591347 () Bool)

(assert (=> b!1043639 (= e!591341 e!591347)))

(declare-fun res!695262 () Bool)

(declare-fun call!44251 () Bool)

(assert (=> b!1043639 (= res!695262 call!44251)))

(assert (=> b!1043639 (=> (not res!695262) (not e!591347))))

(declare-fun bm!44245 () Bool)

(declare-fun call!44250 () ListLongMap!13765)

(assert (=> bm!44245 (= call!44250 call!44249)))

(declare-fun d!126273 () Bool)

(assert (=> d!126273 e!591349))

(declare-fun res!695260 () Bool)

(assert (=> d!126273 (=> (not res!695260) (not e!591349))))

(assert (=> d!126273 (= res!695260 (or (bvsge #b00000000000000000000000000000000 (size!32188 lt!459995)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32188 lt!459995)))))))

(declare-fun lt!460102 () ListLongMap!13765)

(assert (=> d!126273 (= lt!460111 lt!460102)))

(declare-fun lt!460115 () Unit!34071)

(declare-fun e!591340 () Unit!34071)

(assert (=> d!126273 (= lt!460115 e!591340)))

(declare-fun c!105958 () Bool)

(assert (=> d!126273 (= c!105958 e!591345)))

(declare-fun res!695255 () Bool)

(assert (=> d!126273 (=> (not res!695255) (not e!591345))))

(assert (=> d!126273 (= res!695255 (bvslt #b00000000000000000000000000000000 (size!32188 lt!459995)))))

(assert (=> d!126273 (= lt!460102 e!591338)))

(declare-fun c!105962 () Bool)

(assert (=> d!126273 (= c!105962 (and (not (= (bvand (extraKeys!6113 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6113 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126273 (validMask!0 (mask!30476 thiss!1427))))

(assert (=> d!126273 (= (getCurrentListMap!3946 lt!459995 (array!65803 (store (arr!31654 (_values!6408 thiss!1427)) (index!41700 lt!459994) (ValueCellFull!11706 (dynLambda!1995 (defaultEntry!6385 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32189 (_values!6408 thiss!1427))) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6385 thiss!1427)) lt!460111)))

(declare-fun b!1043630 () Bool)

(declare-fun Unit!34076 () Unit!34071)

(assert (=> b!1043630 (= e!591340 Unit!34076)))

(declare-fun bm!44246 () Bool)

(assert (=> bm!44246 (= call!44252 (contains!6062 lt!460111 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44247 () Bool)

(declare-fun call!44253 () ListLongMap!13765)

(assert (=> bm!44247 (= call!44253 call!44248)))

(declare-fun b!1043640 () Bool)

(assert (=> b!1043640 (= e!591347 (= (apply!908 lt!460111 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6219 thiss!1427)))))

(declare-fun b!1043641 () Bool)

(assert (=> b!1043641 (= e!591348 (validKeyInArray!0 (select (arr!31653 lt!459995) #b00000000000000000000000000000000)))))

(declare-fun b!1043642 () Bool)

(assert (=> b!1043642 (= e!591349 e!591341)))

(declare-fun c!105957 () Bool)

(assert (=> b!1043642 (= c!105957 (not (= (bvand (extraKeys!6113 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1043643 () Bool)

(assert (=> b!1043643 (= e!591342 call!44253)))

(declare-fun bm!44248 () Bool)

(assert (=> bm!44248 (= call!44251 (contains!6062 lt!460111 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043644 () Bool)

(assert (=> b!1043644 (= e!591344 e!591343)))

(declare-fun res!695259 () Bool)

(assert (=> b!1043644 (= res!695259 call!44252)))

(assert (=> b!1043644 (=> (not res!695259) (not e!591343))))

(declare-fun b!1043645 () Bool)

(assert (=> b!1043645 (= e!591337 call!44253)))

(declare-fun bm!44249 () Bool)

(assert (=> bm!44249 (= call!44248 (+!3106 (ite c!105962 call!44247 (ite c!105960 call!44249 call!44250)) (ite (or c!105962 c!105960) (tuple2!15737 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6219 thiss!1427)) (tuple2!15737 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6219 thiss!1427)))))))

(declare-fun b!1043646 () Bool)

(declare-fun lt!460118 () Unit!34071)

(assert (=> b!1043646 (= e!591340 lt!460118)))

(declare-fun lt!460100 () ListLongMap!13765)

(assert (=> b!1043646 (= lt!460100 (getCurrentListMapNoExtraKeys!3522 lt!459995 (array!65803 (store (arr!31654 (_values!6408 thiss!1427)) (index!41700 lt!459994) (ValueCellFull!11706 (dynLambda!1995 (defaultEntry!6385 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32189 (_values!6408 thiss!1427))) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6385 thiss!1427)))))

(declare-fun lt!460103 () (_ BitVec 64))

(assert (=> b!1043646 (= lt!460103 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460108 () (_ BitVec 64))

(assert (=> b!1043646 (= lt!460108 (select (arr!31653 lt!459995) #b00000000000000000000000000000000))))

(declare-fun lt!460116 () Unit!34071)

(assert (=> b!1043646 (= lt!460116 (addStillContains!627 lt!460100 lt!460103 (zeroValue!6219 thiss!1427) lt!460108))))

(assert (=> b!1043646 (contains!6062 (+!3106 lt!460100 (tuple2!15737 lt!460103 (zeroValue!6219 thiss!1427))) lt!460108)))

(declare-fun lt!460104 () Unit!34071)

(assert (=> b!1043646 (= lt!460104 lt!460116)))

(declare-fun lt!460114 () ListLongMap!13765)

(assert (=> b!1043646 (= lt!460114 (getCurrentListMapNoExtraKeys!3522 lt!459995 (array!65803 (store (arr!31654 (_values!6408 thiss!1427)) (index!41700 lt!459994) (ValueCellFull!11706 (dynLambda!1995 (defaultEntry!6385 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32189 (_values!6408 thiss!1427))) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6385 thiss!1427)))))

(declare-fun lt!460106 () (_ BitVec 64))

(assert (=> b!1043646 (= lt!460106 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460117 () (_ BitVec 64))

(assert (=> b!1043646 (= lt!460117 (select (arr!31653 lt!459995) #b00000000000000000000000000000000))))

(declare-fun lt!460098 () Unit!34071)

(assert (=> b!1043646 (= lt!460098 (addApplyDifferent!487 lt!460114 lt!460106 (minValue!6219 thiss!1427) lt!460117))))

(assert (=> b!1043646 (= (apply!908 (+!3106 lt!460114 (tuple2!15737 lt!460106 (minValue!6219 thiss!1427))) lt!460117) (apply!908 lt!460114 lt!460117))))

(declare-fun lt!460107 () Unit!34071)

(assert (=> b!1043646 (= lt!460107 lt!460098)))

(declare-fun lt!460097 () ListLongMap!13765)

(assert (=> b!1043646 (= lt!460097 (getCurrentListMapNoExtraKeys!3522 lt!459995 (array!65803 (store (arr!31654 (_values!6408 thiss!1427)) (index!41700 lt!459994) (ValueCellFull!11706 (dynLambda!1995 (defaultEntry!6385 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32189 (_values!6408 thiss!1427))) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6385 thiss!1427)))))

(declare-fun lt!460099 () (_ BitVec 64))

(assert (=> b!1043646 (= lt!460099 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460112 () (_ BitVec 64))

(assert (=> b!1043646 (= lt!460112 (select (arr!31653 lt!459995) #b00000000000000000000000000000000))))

(declare-fun lt!460105 () Unit!34071)

(assert (=> b!1043646 (= lt!460105 (addApplyDifferent!487 lt!460097 lt!460099 (zeroValue!6219 thiss!1427) lt!460112))))

(assert (=> b!1043646 (= (apply!908 (+!3106 lt!460097 (tuple2!15737 lt!460099 (zeroValue!6219 thiss!1427))) lt!460112) (apply!908 lt!460097 lt!460112))))

(declare-fun lt!460113 () Unit!34071)

(assert (=> b!1043646 (= lt!460113 lt!460105)))

(declare-fun lt!460101 () ListLongMap!13765)

(assert (=> b!1043646 (= lt!460101 (getCurrentListMapNoExtraKeys!3522 lt!459995 (array!65803 (store (arr!31654 (_values!6408 thiss!1427)) (index!41700 lt!459994) (ValueCellFull!11706 (dynLambda!1995 (defaultEntry!6385 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32189 (_values!6408 thiss!1427))) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6385 thiss!1427)))))

(declare-fun lt!460109 () (_ BitVec 64))

(assert (=> b!1043646 (= lt!460109 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460110 () (_ BitVec 64))

(assert (=> b!1043646 (= lt!460110 (select (arr!31653 lt!459995) #b00000000000000000000000000000000))))

(assert (=> b!1043646 (= lt!460118 (addApplyDifferent!487 lt!460101 lt!460109 (minValue!6219 thiss!1427) lt!460110))))

(assert (=> b!1043646 (= (apply!908 (+!3106 lt!460101 (tuple2!15737 lt!460109 (minValue!6219 thiss!1427))) lt!460110) (apply!908 lt!460101 lt!460110))))

(declare-fun b!1043647 () Bool)

(assert (=> b!1043647 (= e!591341 (not call!44251))))

(declare-fun bm!44250 () Bool)

(assert (=> bm!44250 (= call!44247 (getCurrentListMapNoExtraKeys!3522 lt!459995 (array!65803 (store (arr!31654 (_values!6408 thiss!1427)) (index!41700 lt!459994) (ValueCellFull!11706 (dynLambda!1995 (defaultEntry!6385 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32189 (_values!6408 thiss!1427))) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6385 thiss!1427)))))

(declare-fun b!1043648 () Bool)

(assert (=> b!1043648 (= e!591342 call!44250)))

(assert (= (and d!126273 c!105962) b!1043629))

(assert (= (and d!126273 (not c!105962)) b!1043636))

(assert (= (and b!1043636 c!105960) b!1043645))

(assert (= (and b!1043636 (not c!105960)) b!1043637))

(assert (= (and b!1043637 c!105959) b!1043643))

(assert (= (and b!1043637 (not c!105959)) b!1043648))

(assert (= (or b!1043643 b!1043648) bm!44245))

(assert (= (or b!1043645 bm!44245) bm!44244))

(assert (= (or b!1043645 b!1043643) bm!44247))

(assert (= (or b!1043629 bm!44244) bm!44250))

(assert (= (or b!1043629 bm!44247) bm!44249))

(assert (= (and d!126273 res!695255) b!1043635))

(assert (= (and d!126273 c!105958) b!1043646))

(assert (= (and d!126273 (not c!105958)) b!1043630))

(assert (= (and d!126273 res!695260) b!1043634))

(assert (= (and b!1043634 res!695258) b!1043641))

(assert (= (and b!1043634 (not res!695254)) b!1043633))

(assert (= (and b!1043633 res!695257) b!1043631))

(assert (= (and b!1043634 res!695256) b!1043632))

(assert (= (and b!1043632 c!105961) b!1043644))

(assert (= (and b!1043632 (not c!105961)) b!1043638))

(assert (= (and b!1043644 res!695259) b!1043628))

(assert (= (or b!1043644 b!1043638) bm!44246))

(assert (= (and b!1043632 res!695261) b!1043642))

(assert (= (and b!1043642 c!105957) b!1043639))

(assert (= (and b!1043642 (not c!105957)) b!1043647))

(assert (= (and b!1043639 res!695262) b!1043640))

(assert (= (or b!1043639 b!1043647) bm!44248))

(declare-fun b_lambda!16167 () Bool)

(assert (=> (not b_lambda!16167) (not b!1043631)))

(assert (=> b!1043631 t!31207))

(declare-fun b_and!33643 () Bool)

(assert (= b_and!33641 (and (=> t!31207 result!14499) b_and!33643)))

(assert (=> d!126273 m!962829))

(declare-fun m!962909 () Bool)

(assert (=> bm!44246 m!962909))

(assert (=> b!1043635 m!962893))

(assert (=> b!1043635 m!962893))

(assert (=> b!1043635 m!962895))

(declare-fun m!962911 () Bool)

(assert (=> b!1043646 m!962911))

(declare-fun m!962913 () Bool)

(assert (=> b!1043646 m!962913))

(declare-fun m!962915 () Bool)

(assert (=> b!1043646 m!962915))

(assert (=> b!1043646 m!962893))

(declare-fun m!962917 () Bool)

(assert (=> b!1043646 m!962917))

(declare-fun m!962919 () Bool)

(assert (=> b!1043646 m!962919))

(declare-fun m!962921 () Bool)

(assert (=> b!1043646 m!962921))

(declare-fun m!962923 () Bool)

(assert (=> b!1043646 m!962923))

(declare-fun m!962925 () Bool)

(assert (=> b!1043646 m!962925))

(assert (=> b!1043646 m!962919))

(declare-fun m!962927 () Bool)

(assert (=> b!1043646 m!962927))

(declare-fun m!962929 () Bool)

(assert (=> b!1043646 m!962929))

(assert (=> b!1043646 m!962913))

(declare-fun m!962931 () Bool)

(assert (=> b!1043646 m!962931))

(declare-fun m!962933 () Bool)

(assert (=> b!1043646 m!962933))

(declare-fun m!962935 () Bool)

(assert (=> b!1043646 m!962935))

(assert (=> b!1043646 m!962921))

(declare-fun m!962937 () Bool)

(assert (=> b!1043646 m!962937))

(declare-fun m!962939 () Bool)

(assert (=> b!1043646 m!962939))

(assert (=> b!1043646 m!962917))

(declare-fun m!962941 () Bool)

(assert (=> b!1043646 m!962941))

(assert (=> b!1043631 m!962893))

(assert (=> b!1043631 m!962779))

(declare-fun m!962943 () Bool)

(assert (=> b!1043631 m!962943))

(assert (=> b!1043631 m!962779))

(declare-fun m!962945 () Bool)

(assert (=> b!1043631 m!962945))

(assert (=> b!1043631 m!962943))

(assert (=> b!1043631 m!962893))

(declare-fun m!962947 () Bool)

(assert (=> b!1043631 m!962947))

(declare-fun m!962949 () Bool)

(assert (=> bm!44249 m!962949))

(declare-fun m!962951 () Bool)

(assert (=> b!1043640 m!962951))

(assert (=> b!1043633 m!962893))

(assert (=> b!1043633 m!962893))

(declare-fun m!962953 () Bool)

(assert (=> b!1043633 m!962953))

(declare-fun m!962955 () Bool)

(assert (=> b!1043629 m!962955))

(assert (=> b!1043641 m!962893))

(assert (=> b!1043641 m!962893))

(assert (=> b!1043641 m!962895))

(declare-fun m!962957 () Bool)

(assert (=> bm!44248 m!962957))

(assert (=> bm!44250 m!962939))

(declare-fun m!962959 () Bool)

(assert (=> b!1043628 m!962959))

(assert (=> b!1043506 d!126273))

(declare-fun d!126275 () Bool)

(declare-fun res!695267 () Bool)

(declare-fun e!591357 () Bool)

(assert (=> d!126275 (=> res!695267 e!591357)))

(assert (=> d!126275 (= res!695267 (bvsge #b00000000000000000000000000000000 (size!32188 lt!459995)))))

(assert (=> d!126275 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459995 (mask!30476 thiss!1427)) e!591357)))

(declare-fun b!1043657 () Bool)

(declare-fun e!591358 () Bool)

(assert (=> b!1043657 (= e!591357 e!591358)))

(declare-fun c!105965 () Bool)

(assert (=> b!1043657 (= c!105965 (validKeyInArray!0 (select (arr!31653 lt!459995) #b00000000000000000000000000000000)))))

(declare-fun b!1043658 () Bool)

(declare-fun e!591356 () Bool)

(assert (=> b!1043658 (= e!591358 e!591356)))

(declare-fun lt!460126 () (_ BitVec 64))

(assert (=> b!1043658 (= lt!460126 (select (arr!31653 lt!459995) #b00000000000000000000000000000000))))

(declare-fun lt!460127 () Unit!34071)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65800 (_ BitVec 64) (_ BitVec 32)) Unit!34071)

(assert (=> b!1043658 (= lt!460127 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459995 lt!460126 #b00000000000000000000000000000000))))

(assert (=> b!1043658 (arrayContainsKey!0 lt!459995 lt!460126 #b00000000000000000000000000000000)))

(declare-fun lt!460125 () Unit!34071)

(assert (=> b!1043658 (= lt!460125 lt!460127)))

(declare-fun res!695268 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65800 (_ BitVec 32)) SeekEntryResult!9832)

(assert (=> b!1043658 (= res!695268 (= (seekEntryOrOpen!0 (select (arr!31653 lt!459995) #b00000000000000000000000000000000) lt!459995 (mask!30476 thiss!1427)) (Found!9832 #b00000000000000000000000000000000)))))

(assert (=> b!1043658 (=> (not res!695268) (not e!591356))))

(declare-fun b!1043659 () Bool)

(declare-fun call!44256 () Bool)

(assert (=> b!1043659 (= e!591358 call!44256)))

(declare-fun bm!44253 () Bool)

(assert (=> bm!44253 (= call!44256 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459995 (mask!30476 thiss!1427)))))

(declare-fun b!1043660 () Bool)

(assert (=> b!1043660 (= e!591356 call!44256)))

(assert (= (and d!126275 (not res!695267)) b!1043657))

(assert (= (and b!1043657 c!105965) b!1043658))

(assert (= (and b!1043657 (not c!105965)) b!1043659))

(assert (= (and b!1043658 res!695268) b!1043660))

(assert (= (or b!1043660 b!1043659) bm!44253))

(assert (=> b!1043657 m!962893))

(assert (=> b!1043657 m!962893))

(assert (=> b!1043657 m!962895))

(assert (=> b!1043658 m!962893))

(declare-fun m!962961 () Bool)

(assert (=> b!1043658 m!962961))

(declare-fun m!962963 () Bool)

(assert (=> b!1043658 m!962963))

(assert (=> b!1043658 m!962893))

(declare-fun m!962965 () Bool)

(assert (=> b!1043658 m!962965))

(declare-fun m!962967 () Bool)

(assert (=> bm!44253 m!962967))

(assert (=> b!1043506 d!126275))

(declare-fun bm!44254 () Bool)

(declare-fun call!44257 () (_ BitVec 32))

(assert (=> bm!44254 (= call!44257 (arrayCountValidKeys!0 (_keys!11643 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32188 (_keys!11643 thiss!1427))))))

(declare-fun b!1043661 () Bool)

(declare-fun e!591359 () (_ BitVec 32))

(assert (=> b!1043661 (= e!591359 #b00000000000000000000000000000000)))

(declare-fun b!1043662 () Bool)

(declare-fun e!591360 () (_ BitVec 32))

(assert (=> b!1043662 (= e!591360 (bvadd #b00000000000000000000000000000001 call!44257))))

(declare-fun b!1043663 () Bool)

(assert (=> b!1043663 (= e!591360 call!44257)))

(declare-fun d!126277 () Bool)

(declare-fun lt!460128 () (_ BitVec 32))

(assert (=> d!126277 (and (bvsge lt!460128 #b00000000000000000000000000000000) (bvsle lt!460128 (bvsub (size!32188 (_keys!11643 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126277 (= lt!460128 e!591359)))

(declare-fun c!105967 () Bool)

(assert (=> d!126277 (= c!105967 (bvsge #b00000000000000000000000000000000 (size!32188 (_keys!11643 thiss!1427))))))

(assert (=> d!126277 (and (bvsle #b00000000000000000000000000000000 (size!32188 (_keys!11643 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32188 (_keys!11643 thiss!1427)) (size!32188 (_keys!11643 thiss!1427))))))

(assert (=> d!126277 (= (arrayCountValidKeys!0 (_keys!11643 thiss!1427) #b00000000000000000000000000000000 (size!32188 (_keys!11643 thiss!1427))) lt!460128)))

(declare-fun b!1043664 () Bool)

(assert (=> b!1043664 (= e!591359 e!591360)))

(declare-fun c!105966 () Bool)

(assert (=> b!1043664 (= c!105966 (validKeyInArray!0 (select (arr!31653 (_keys!11643 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126277 c!105967) b!1043661))

(assert (= (and d!126277 (not c!105967)) b!1043664))

(assert (= (and b!1043664 c!105966) b!1043662))

(assert (= (and b!1043664 (not c!105966)) b!1043663))

(assert (= (or b!1043662 b!1043663) bm!44254))

(declare-fun m!962969 () Bool)

(assert (=> bm!44254 m!962969))

(assert (=> b!1043664 m!962833))

(assert (=> b!1043664 m!962833))

(assert (=> b!1043664 m!962835))

(assert (=> b!1043506 d!126277))

(declare-fun d!126279 () Bool)

(declare-fun e!591363 () Bool)

(assert (=> d!126279 e!591363))

(declare-fun res!695271 () Bool)

(assert (=> d!126279 (=> (not res!695271) (not e!591363))))

(assert (=> d!126279 (= res!695271 (and (bvsge (index!41700 lt!459994) #b00000000000000000000000000000000) (bvslt (index!41700 lt!459994) (size!32188 (_keys!11643 thiss!1427)))))))

(declare-fun lt!460131 () Unit!34071)

(declare-fun choose!25 (array!65800 (_ BitVec 32) (_ BitVec 32)) Unit!34071)

(assert (=> d!126279 (= lt!460131 (choose!25 (_keys!11643 thiss!1427) (index!41700 lt!459994) (mask!30476 thiss!1427)))))

(assert (=> d!126279 (validMask!0 (mask!30476 thiss!1427))))

(assert (=> d!126279 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11643 thiss!1427) (index!41700 lt!459994) (mask!30476 thiss!1427)) lt!460131)))

(declare-fun b!1043667 () Bool)

(assert (=> b!1043667 (= e!591363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65801 (store (arr!31653 (_keys!11643 thiss!1427)) (index!41700 lt!459994) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32188 (_keys!11643 thiss!1427))) (mask!30476 thiss!1427)))))

(assert (= (and d!126279 res!695271) b!1043667))

(declare-fun m!962971 () Bool)

(assert (=> d!126279 m!962971))

(assert (=> d!126279 m!962829))

(assert (=> b!1043667 m!962769))

(declare-fun m!962973 () Bool)

(assert (=> b!1043667 m!962973))

(assert (=> b!1043506 d!126279))

(declare-fun b!1043678 () Bool)

(declare-fun e!591372 () Bool)

(declare-fun call!44260 () Bool)

(assert (=> b!1043678 (= e!591372 call!44260)))

(declare-fun b!1043679 () Bool)

(assert (=> b!1043679 (= e!591372 call!44260)))

(declare-fun b!1043680 () Bool)

(declare-fun e!591374 () Bool)

(declare-fun e!591375 () Bool)

(assert (=> b!1043680 (= e!591374 e!591375)))

(declare-fun res!695279 () Bool)

(assert (=> b!1043680 (=> (not res!695279) (not e!591375))))

(declare-fun e!591373 () Bool)

(assert (=> b!1043680 (= res!695279 (not e!591373))))

(declare-fun res!695280 () Bool)

(assert (=> b!1043680 (=> (not res!695280) (not e!591373))))

(assert (=> b!1043680 (= res!695280 (validKeyInArray!0 (select (arr!31653 lt!459995) #b00000000000000000000000000000000)))))

(declare-fun bm!44257 () Bool)

(declare-fun c!105970 () Bool)

(assert (=> bm!44257 (= call!44260 (arrayNoDuplicates!0 lt!459995 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105970 (Cons!21987 (select (arr!31653 lt!459995) #b00000000000000000000000000000000) Nil!21988) Nil!21988)))))

(declare-fun b!1043682 () Bool)

(declare-fun contains!6063 (List!21991 (_ BitVec 64)) Bool)

(assert (=> b!1043682 (= e!591373 (contains!6063 Nil!21988 (select (arr!31653 lt!459995) #b00000000000000000000000000000000)))))

(declare-fun d!126281 () Bool)

(declare-fun res!695278 () Bool)

(assert (=> d!126281 (=> res!695278 e!591374)))

(assert (=> d!126281 (= res!695278 (bvsge #b00000000000000000000000000000000 (size!32188 lt!459995)))))

(assert (=> d!126281 (= (arrayNoDuplicates!0 lt!459995 #b00000000000000000000000000000000 Nil!21988) e!591374)))

(declare-fun b!1043681 () Bool)

(assert (=> b!1043681 (= e!591375 e!591372)))

(assert (=> b!1043681 (= c!105970 (validKeyInArray!0 (select (arr!31653 lt!459995) #b00000000000000000000000000000000)))))

(assert (= (and d!126281 (not res!695278)) b!1043680))

(assert (= (and b!1043680 res!695280) b!1043682))

(assert (= (and b!1043680 res!695279) b!1043681))

(assert (= (and b!1043681 c!105970) b!1043678))

(assert (= (and b!1043681 (not c!105970)) b!1043679))

(assert (= (or b!1043678 b!1043679) bm!44257))

(assert (=> b!1043680 m!962893))

(assert (=> b!1043680 m!962893))

(assert (=> b!1043680 m!962895))

(assert (=> bm!44257 m!962893))

(declare-fun m!962975 () Bool)

(assert (=> bm!44257 m!962975))

(assert (=> b!1043682 m!962893))

(assert (=> b!1043682 m!962893))

(declare-fun m!962977 () Bool)

(assert (=> b!1043682 m!962977))

(assert (=> b!1043681 m!962893))

(assert (=> b!1043681 m!962893))

(assert (=> b!1043681 m!962895))

(assert (=> b!1043506 d!126281))

(declare-fun d!126283 () Bool)

(declare-fun e!591378 () Bool)

(assert (=> d!126283 e!591378))

(declare-fun res!695283 () Bool)

(assert (=> d!126283 (=> (not res!695283) (not e!591378))))

(assert (=> d!126283 (= res!695283 (and (bvsge (index!41700 lt!459994) #b00000000000000000000000000000000) (bvslt (index!41700 lt!459994) (size!32188 (_keys!11643 thiss!1427)))))))

(declare-fun lt!460134 () Unit!34071)

(declare-fun choose!1708 (array!65800 array!65802 (_ BitVec 32) (_ BitVec 32) V!37965 V!37965 (_ BitVec 32) (_ BitVec 64) Int) Unit!34071)

(assert (=> d!126283 (= lt!460134 (choose!1708 (_keys!11643 thiss!1427) (_values!6408 thiss!1427) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) (index!41700 lt!459994) key!909 (defaultEntry!6385 thiss!1427)))))

(assert (=> d!126283 (validMask!0 (mask!30476 thiss!1427))))

(assert (=> d!126283 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!46 (_keys!11643 thiss!1427) (_values!6408 thiss!1427) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) (index!41700 lt!459994) key!909 (defaultEntry!6385 thiss!1427)) lt!460134)))

(declare-fun b!1043685 () Bool)

(assert (=> b!1043685 (= e!591378 (= (-!525 (getCurrentListMap!3946 (_keys!11643 thiss!1427) (_values!6408 thiss!1427) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6385 thiss!1427)) key!909) (getCurrentListMap!3946 (array!65801 (store (arr!31653 (_keys!11643 thiss!1427)) (index!41700 lt!459994) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32188 (_keys!11643 thiss!1427))) (array!65803 (store (arr!31654 (_values!6408 thiss!1427)) (index!41700 lt!459994) (ValueCellFull!11706 (dynLambda!1995 (defaultEntry!6385 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32189 (_values!6408 thiss!1427))) (mask!30476 thiss!1427) (extraKeys!6113 thiss!1427) (zeroValue!6219 thiss!1427) (minValue!6219 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6385 thiss!1427))))))

(assert (=> b!1043685 (bvslt (index!41700 lt!459994) (size!32189 (_values!6408 thiss!1427)))))

(assert (= (and d!126283 res!695283) b!1043685))

(declare-fun b_lambda!16169 () Bool)

(assert (=> (not b_lambda!16169) (not b!1043685)))

(assert (=> b!1043685 t!31207))

(declare-fun b_and!33645 () Bool)

(assert (= b_and!33643 (and (=> t!31207 result!14499) b_and!33645)))

(declare-fun m!962979 () Bool)

(assert (=> d!126283 m!962979))

(assert (=> d!126283 m!962829))

(assert (=> b!1043685 m!962765))

(assert (=> b!1043685 m!962769))

(assert (=> b!1043685 m!962765))

(assert (=> b!1043685 m!962767))

(declare-fun m!962981 () Bool)

(assert (=> b!1043685 m!962981))

(assert (=> b!1043685 m!962763))

(assert (=> b!1043685 m!962779))

(assert (=> b!1043506 d!126283))

(declare-fun d!126285 () Bool)

(declare-fun e!591381 () Bool)

(assert (=> d!126285 e!591381))

(declare-fun res!695286 () Bool)

(assert (=> d!126285 (=> (not res!695286) (not e!591381))))

(assert (=> d!126285 (= res!695286 (and (bvsge (index!41700 lt!459994) #b00000000000000000000000000000000) (bvslt (index!41700 lt!459994) (size!32188 (_keys!11643 thiss!1427)))))))

(declare-fun lt!460137 () Unit!34071)

(declare-fun choose!53 (array!65800 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21991) Unit!34071)

(assert (=> d!126285 (= lt!460137 (choose!53 (_keys!11643 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41700 lt!459994) #b00000000000000000000000000000000 Nil!21988))))

(assert (=> d!126285 (bvslt (size!32188 (_keys!11643 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126285 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11643 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41700 lt!459994) #b00000000000000000000000000000000 Nil!21988) lt!460137)))

(declare-fun b!1043688 () Bool)

(assert (=> b!1043688 (= e!591381 (arrayNoDuplicates!0 (array!65801 (store (arr!31653 (_keys!11643 thiss!1427)) (index!41700 lt!459994) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32188 (_keys!11643 thiss!1427))) #b00000000000000000000000000000000 Nil!21988))))

(assert (= (and d!126285 res!695286) b!1043688))

(declare-fun m!962983 () Bool)

(assert (=> d!126285 m!962983))

(assert (=> b!1043688 m!962769))

(declare-fun m!962985 () Bool)

(assert (=> b!1043688 m!962985))

(assert (=> b!1043506 d!126285))

(declare-fun d!126287 () Bool)

(assert (=> d!126287 (= (array_inv!24453 (_keys!11643 thiss!1427)) (bvsge (size!32188 (_keys!11643 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043504 d!126287))

(declare-fun d!126289 () Bool)

(assert (=> d!126289 (= (array_inv!24454 (_values!6408 thiss!1427)) (bvsge (size!32189 (_values!6408 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043504 d!126289))

(declare-fun d!126291 () Bool)

(declare-fun res!695293 () Bool)

(declare-fun e!591384 () Bool)

(assert (=> d!126291 (=> (not res!695293) (not e!591384))))

(declare-fun simpleValid!446 (LongMapFixedSize!6006) Bool)

(assert (=> d!126291 (= res!695293 (simpleValid!446 thiss!1427))))

(assert (=> d!126291 (= (valid!2254 thiss!1427) e!591384)))

(declare-fun b!1043695 () Bool)

(declare-fun res!695294 () Bool)

(assert (=> b!1043695 (=> (not res!695294) (not e!591384))))

(assert (=> b!1043695 (= res!695294 (= (arrayCountValidKeys!0 (_keys!11643 thiss!1427) #b00000000000000000000000000000000 (size!32188 (_keys!11643 thiss!1427))) (_size!3058 thiss!1427)))))

(declare-fun b!1043696 () Bool)

(declare-fun res!695295 () Bool)

(assert (=> b!1043696 (=> (not res!695295) (not e!591384))))

(assert (=> b!1043696 (= res!695295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11643 thiss!1427) (mask!30476 thiss!1427)))))

(declare-fun b!1043697 () Bool)

(assert (=> b!1043697 (= e!591384 (arrayNoDuplicates!0 (_keys!11643 thiss!1427) #b00000000000000000000000000000000 Nil!21988))))

(assert (= (and d!126291 res!695293) b!1043695))

(assert (= (and b!1043695 res!695294) b!1043696))

(assert (= (and b!1043696 res!695295) b!1043697))

(declare-fun m!962987 () Bool)

(assert (=> d!126291 m!962987))

(assert (=> b!1043695 m!962775))

(declare-fun m!962989 () Bool)

(assert (=> b!1043696 m!962989))

(declare-fun m!962991 () Bool)

(assert (=> b!1043697 m!962991))

(assert (=> start!91662 d!126291))

(declare-fun b!1043710 () Bool)

(declare-fun e!591393 () SeekEntryResult!9832)

(declare-fun lt!460146 () SeekEntryResult!9832)

(assert (=> b!1043710 (= e!591393 (MissingZero!9832 (index!41701 lt!460146)))))

(declare-fun b!1043711 () Bool)

(declare-fun e!591392 () SeekEntryResult!9832)

(declare-fun e!591391 () SeekEntryResult!9832)

(assert (=> b!1043711 (= e!591392 e!591391)))

(declare-fun lt!460147 () (_ BitVec 64))

(assert (=> b!1043711 (= lt!460147 (select (arr!31653 (_keys!11643 thiss!1427)) (index!41701 lt!460146)))))

(declare-fun c!105978 () Bool)

(assert (=> b!1043711 (= c!105978 (= lt!460147 key!909))))

(declare-fun b!1043712 () Bool)

(declare-fun lt!460149 () SeekEntryResult!9832)

(assert (=> b!1043712 (= e!591393 (ite ((_ is MissingVacant!9832) lt!460149) (MissingZero!9832 (index!41702 lt!460149)) lt!460149))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65800 (_ BitVec 32)) SeekEntryResult!9832)

(assert (=> b!1043712 (= lt!460149 (seekKeyOrZeroReturnVacant!0 (x!93168 lt!460146) (index!41701 lt!460146) (index!41701 lt!460146) key!909 (_keys!11643 thiss!1427) (mask!30476 thiss!1427)))))

(declare-fun d!126293 () Bool)

(declare-fun lt!460148 () SeekEntryResult!9832)

(assert (=> d!126293 (and (or ((_ is MissingVacant!9832) lt!460148) (not ((_ is Found!9832) lt!460148)) (and (bvsge (index!41700 lt!460148) #b00000000000000000000000000000000) (bvslt (index!41700 lt!460148) (size!32188 (_keys!11643 thiss!1427))))) (not ((_ is MissingVacant!9832) lt!460148)) (or (not ((_ is Found!9832) lt!460148)) (= (select (arr!31653 (_keys!11643 thiss!1427)) (index!41700 lt!460148)) key!909)))))

(assert (=> d!126293 (= lt!460148 e!591392)))

(declare-fun c!105977 () Bool)

(assert (=> d!126293 (= c!105977 (and ((_ is Intermediate!9832) lt!460146) (undefined!10644 lt!460146)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65800 (_ BitVec 32)) SeekEntryResult!9832)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126293 (= lt!460146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30476 thiss!1427)) key!909 (_keys!11643 thiss!1427) (mask!30476 thiss!1427)))))

(assert (=> d!126293 (validMask!0 (mask!30476 thiss!1427))))

(assert (=> d!126293 (= (seekEntry!0 key!909 (_keys!11643 thiss!1427) (mask!30476 thiss!1427)) lt!460148)))

(declare-fun b!1043713 () Bool)

(declare-fun c!105979 () Bool)

(assert (=> b!1043713 (= c!105979 (= lt!460147 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1043713 (= e!591391 e!591393)))

(declare-fun b!1043714 () Bool)

(assert (=> b!1043714 (= e!591392 Undefined!9832)))

(declare-fun b!1043715 () Bool)

(assert (=> b!1043715 (= e!591391 (Found!9832 (index!41701 lt!460146)))))

(assert (= (and d!126293 c!105977) b!1043714))

(assert (= (and d!126293 (not c!105977)) b!1043711))

(assert (= (and b!1043711 c!105978) b!1043715))

(assert (= (and b!1043711 (not c!105978)) b!1043713))

(assert (= (and b!1043713 c!105979) b!1043710))

(assert (= (and b!1043713 (not c!105979)) b!1043712))

(declare-fun m!962993 () Bool)

(assert (=> b!1043711 m!962993))

(declare-fun m!962995 () Bool)

(assert (=> b!1043712 m!962995))

(declare-fun m!962997 () Bool)

(assert (=> d!126293 m!962997))

(declare-fun m!962999 () Bool)

(assert (=> d!126293 m!962999))

(assert (=> d!126293 m!962999))

(declare-fun m!963001 () Bool)

(assert (=> d!126293 m!963001))

(assert (=> d!126293 m!962829))

(assert (=> b!1043505 d!126293))

(declare-fun b!1043722 () Bool)

(declare-fun e!591399 () Bool)

(assert (=> b!1043722 (= e!591399 tp_is_empty!24819)))

(declare-fun mapIsEmpty!38855 () Bool)

(declare-fun mapRes!38855 () Bool)

(assert (=> mapIsEmpty!38855 mapRes!38855))

(declare-fun condMapEmpty!38855 () Bool)

(declare-fun mapDefault!38855 () ValueCell!11706)

(assert (=> mapNonEmpty!38849 (= condMapEmpty!38855 (= mapRest!38849 ((as const (Array (_ BitVec 32) ValueCell!11706)) mapDefault!38855)))))

(declare-fun e!591398 () Bool)

(assert (=> mapNonEmpty!38849 (= tp!74534 (and e!591398 mapRes!38855))))

(declare-fun b!1043723 () Bool)

(assert (=> b!1043723 (= e!591398 tp_is_empty!24819)))

(declare-fun mapNonEmpty!38855 () Bool)

(declare-fun tp!74544 () Bool)

(assert (=> mapNonEmpty!38855 (= mapRes!38855 (and tp!74544 e!591399))))

(declare-fun mapValue!38855 () ValueCell!11706)

(declare-fun mapKey!38855 () (_ BitVec 32))

(declare-fun mapRest!38855 () (Array (_ BitVec 32) ValueCell!11706))

(assert (=> mapNonEmpty!38855 (= mapRest!38849 (store mapRest!38855 mapKey!38855 mapValue!38855))))

(assert (= (and mapNonEmpty!38849 condMapEmpty!38855) mapIsEmpty!38855))

(assert (= (and mapNonEmpty!38849 (not condMapEmpty!38855)) mapNonEmpty!38855))

(assert (= (and mapNonEmpty!38855 ((_ is ValueCellFull!11706) mapValue!38855)) b!1043722))

(assert (= (and mapNonEmpty!38849 ((_ is ValueCellFull!11706) mapDefault!38855)) b!1043723))

(declare-fun m!963003 () Bool)

(assert (=> mapNonEmpty!38855 m!963003))

(declare-fun b_lambda!16171 () Bool)

(assert (= b_lambda!16165 (or (and b!1043504 b_free!21099) b_lambda!16171)))

(declare-fun b_lambda!16173 () Bool)

(assert (= b_lambda!16169 (or (and b!1043504 b_free!21099) b_lambda!16173)))

(declare-fun b_lambda!16175 () Bool)

(assert (= b_lambda!16167 (or (and b!1043504 b_free!21099) b_lambda!16175)))

(check-sat (not b!1043658) (not d!126271) (not b!1043628) (not b!1043641) (not b_lambda!16171) (not b!1043640) (not b_lambda!16173) (not b_next!21099) (not b!1043624) (not b!1043589) (not d!126279) (not b!1043635) (not b!1043697) (not b!1043582) (not b!1043595) (not bm!44249) (not b!1043633) (not b!1043590) (not d!126291) (not b!1043685) tp_is_empty!24819 (not b!1043578) (not b!1043681) (not b!1043577) (not bm!44236) (not b!1043609) (not bm!44250) (not d!126293) (not b!1043627) (not b!1043682) (not mapNonEmpty!38855) (not b!1043696) (not b!1043629) (not bm!44248) (not bm!44254) (not b!1043534) (not b!1043631) b_and!33645 (not b!1043712) (not bm!44239) (not b!1043646) (not b!1043680) (not d!126273) (not b_lambda!16163) (not b!1043667) (not d!126283) (not bm!44240) (not bm!44243) (not b!1043584) (not b!1043580) (not b!1043657) (not bm!44246) (not d!126261) (not bm!44253) (not d!126285) (not d!126265) (not bm!44257) (not b_lambda!16175) (not b!1043688) (not b!1043625) (not d!126263) (not b!1043695) (not bm!44238) (not b!1043664) (not b!1043615))
(check-sat b_and!33645 (not b_next!21099))
