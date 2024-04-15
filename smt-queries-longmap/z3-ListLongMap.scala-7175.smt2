; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91694 () Bool)

(assert start!91694)

(declare-fun b!1043592 () Bool)

(declare-fun b_free!21103 () Bool)

(declare-fun b_next!21103 () Bool)

(assert (=> b!1043592 (= b_free!21103 (not b_next!21103))))

(declare-fun tp!74550 () Bool)

(declare-fun b_and!33621 () Bool)

(assert (=> b!1043592 (= tp!74550 b_and!33621)))

(declare-fun b!1043587 () Bool)

(declare-fun res!695237 () Bool)

(declare-fun e!591326 () Bool)

(assert (=> b!1043587 (=> (not res!695237) (not e!591326))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1043587 (= res!695237 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1043588 () Bool)

(declare-fun e!591327 () Bool)

(declare-datatypes ((SeekEntryResult!9835 0))(
  ( (MissingZero!9835 (index!41711 (_ BitVec 32))) (Found!9835 (index!41712 (_ BitVec 32))) (Intermediate!9835 (undefined!10647 Bool) (index!41713 (_ BitVec 32)) (x!93190 (_ BitVec 32))) (Undefined!9835) (MissingVacant!9835 (index!41714 (_ BitVec 32))) )
))
(declare-fun lt!459968 () SeekEntryResult!9835)

(declare-datatypes ((V!37971 0))(
  ( (V!37972 (val!12462 Int)) )
))
(declare-datatypes ((ValueCell!11708 0))(
  ( (ValueCellFull!11708 (v!15052 V!37971)) (EmptyCell!11708) )
))
(declare-datatypes ((array!65749 0))(
  ( (array!65750 (arr!31626 (Array (_ BitVec 32) (_ BitVec 64))) (size!32163 (_ BitVec 32))) )
))
(declare-datatypes ((array!65751 0))(
  ( (array!65752 (arr!31627 (Array (_ BitVec 32) ValueCell!11708)) (size!32164 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6010 0))(
  ( (LongMapFixedSize!6011 (defaultEntry!6389 Int) (mask!30480 (_ BitVec 32)) (extraKeys!6117 (_ BitVec 32)) (zeroValue!6223 V!37971) (minValue!6223 V!37971) (_size!3060 (_ BitVec 32)) (_keys!11645 array!65749) (_values!6412 array!65751) (_vacant!3060 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6010)

(assert (=> b!1043588 (= e!591327 (not (and (bvsge (index!41712 lt!459968) #b00000000000000000000000000000000) (bvslt (index!41712 lt!459968) (size!32164 (_values!6412 thiss!1427))))))))

(declare-fun lt!459966 () array!65749)

(declare-datatypes ((tuple2!15816 0))(
  ( (tuple2!15817 (_1!7919 (_ BitVec 64)) (_2!7919 V!37971)) )
))
(declare-datatypes ((List!22032 0))(
  ( (Nil!22029) (Cons!22028 (h!23236 tuple2!15816) (t!31245 List!22032)) )
))
(declare-datatypes ((ListLongMap!13839 0))(
  ( (ListLongMap!13840 (toList!6935 List!22032)) )
))
(declare-fun -!527 (ListLongMap!13839 (_ BitVec 64)) ListLongMap!13839)

(declare-fun getCurrentListMap!3901 (array!65749 array!65751 (_ BitVec 32) (_ BitVec 32) V!37971 V!37971 (_ BitVec 32) Int) ListLongMap!13839)

(declare-fun dynLambda!1988 (Int (_ BitVec 64)) V!37971)

(assert (=> b!1043588 (= (-!527 (getCurrentListMap!3901 (_keys!11645 thiss!1427) (_values!6412 thiss!1427) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)) key!909) (getCurrentListMap!3901 lt!459966 (array!65752 (store (arr!31627 (_values!6412 thiss!1427)) (index!41712 lt!459968) (ValueCellFull!11708 (dynLambda!1988 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32164 (_values!6412 thiss!1427))) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-datatypes ((Unit!33967 0))(
  ( (Unit!33968) )
))
(declare-fun lt!459970 () Unit!33967)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!49 (array!65749 array!65751 (_ BitVec 32) (_ BitVec 32) V!37971 V!37971 (_ BitVec 32) (_ BitVec 64) Int) Unit!33967)

(assert (=> b!1043588 (= lt!459970 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!49 (_keys!11645 thiss!1427) (_values!6412 thiss!1427) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) (index!41712 lt!459968) key!909 (defaultEntry!6389 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043588 (not (arrayContainsKey!0 lt!459966 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!459967 () Unit!33967)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65749 (_ BitVec 32) (_ BitVec 64)) Unit!33967)

(assert (=> b!1043588 (= lt!459967 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11645 thiss!1427) (index!41712 lt!459968) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65749 (_ BitVec 32)) Bool)

(assert (=> b!1043588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459966 (mask!30480 thiss!1427))))

(declare-fun lt!459965 () Unit!33967)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65749 (_ BitVec 32) (_ BitVec 32)) Unit!33967)

(assert (=> b!1043588 (= lt!459965 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11645 thiss!1427) (index!41712 lt!459968) (mask!30480 thiss!1427)))))

(declare-datatypes ((List!22033 0))(
  ( (Nil!22030) (Cons!22029 (h!23237 (_ BitVec 64)) (t!31246 List!22033)) )
))
(declare-fun arrayNoDuplicates!0 (array!65749 (_ BitVec 32) List!22033) Bool)

(assert (=> b!1043588 (arrayNoDuplicates!0 lt!459966 #b00000000000000000000000000000000 Nil!22030)))

(declare-fun lt!459969 () Unit!33967)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65749 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22033) Unit!33967)

(assert (=> b!1043588 (= lt!459969 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11645 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41712 lt!459968) #b00000000000000000000000000000000 Nil!22030))))

(declare-fun arrayCountValidKeys!0 (array!65749 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043588 (= (arrayCountValidKeys!0 lt!459966 #b00000000000000000000000000000000 (size!32163 (_keys!11645 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11645 thiss!1427) #b00000000000000000000000000000000 (size!32163 (_keys!11645 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043588 (= lt!459966 (array!65750 (store (arr!31626 (_keys!11645 thiss!1427)) (index!41712 lt!459968) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32163 (_keys!11645 thiss!1427))))))

(declare-fun lt!459964 () Unit!33967)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65749 (_ BitVec 32) (_ BitVec 64)) Unit!33967)

(assert (=> b!1043588 (= lt!459964 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11645 thiss!1427) (index!41712 lt!459968) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!695235 () Bool)

(assert (=> start!91694 (=> (not res!695235) (not e!591326))))

(declare-fun valid!2250 (LongMapFixedSize!6010) Bool)

(assert (=> start!91694 (= res!695235 (valid!2250 thiss!1427))))

(assert (=> start!91694 e!591326))

(declare-fun e!591329 () Bool)

(assert (=> start!91694 e!591329))

(assert (=> start!91694 true))

(declare-fun b!1043589 () Bool)

(declare-fun e!591325 () Bool)

(declare-fun e!591328 () Bool)

(declare-fun mapRes!38858 () Bool)

(assert (=> b!1043589 (= e!591325 (and e!591328 mapRes!38858))))

(declare-fun condMapEmpty!38858 () Bool)

(declare-fun mapDefault!38858 () ValueCell!11708)

(assert (=> b!1043589 (= condMapEmpty!38858 (= (arr!31627 (_values!6412 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11708)) mapDefault!38858)))))

(declare-fun b!1043590 () Bool)

(assert (=> b!1043590 (= e!591326 e!591327)))

(declare-fun res!695236 () Bool)

(assert (=> b!1043590 (=> (not res!695236) (not e!591327))))

(get-info :version)

(assert (=> b!1043590 (= res!695236 ((_ is Found!9835) lt!459968))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65749 (_ BitVec 32)) SeekEntryResult!9835)

(assert (=> b!1043590 (= lt!459968 (seekEntry!0 key!909 (_keys!11645 thiss!1427) (mask!30480 thiss!1427)))))

(declare-fun b!1043591 () Bool)

(declare-fun tp_is_empty!24823 () Bool)

(assert (=> b!1043591 (= e!591328 tp_is_empty!24823)))

(declare-fun array_inv!24441 (array!65749) Bool)

(declare-fun array_inv!24442 (array!65751) Bool)

(assert (=> b!1043592 (= e!591329 (and tp!74550 tp_is_empty!24823 (array_inv!24441 (_keys!11645 thiss!1427)) (array_inv!24442 (_values!6412 thiss!1427)) e!591325))))

(declare-fun mapNonEmpty!38858 () Bool)

(declare-fun tp!74549 () Bool)

(declare-fun e!591323 () Bool)

(assert (=> mapNonEmpty!38858 (= mapRes!38858 (and tp!74549 e!591323))))

(declare-fun mapValue!38858 () ValueCell!11708)

(declare-fun mapKey!38858 () (_ BitVec 32))

(declare-fun mapRest!38858 () (Array (_ BitVec 32) ValueCell!11708))

(assert (=> mapNonEmpty!38858 (= (arr!31627 (_values!6412 thiss!1427)) (store mapRest!38858 mapKey!38858 mapValue!38858))))

(declare-fun mapIsEmpty!38858 () Bool)

(assert (=> mapIsEmpty!38858 mapRes!38858))

(declare-fun b!1043593 () Bool)

(assert (=> b!1043593 (= e!591323 tp_is_empty!24823)))

(assert (= (and start!91694 res!695235) b!1043587))

(assert (= (and b!1043587 res!695237) b!1043590))

(assert (= (and b!1043590 res!695236) b!1043588))

(assert (= (and b!1043589 condMapEmpty!38858) mapIsEmpty!38858))

(assert (= (and b!1043589 (not condMapEmpty!38858)) mapNonEmpty!38858))

(assert (= (and mapNonEmpty!38858 ((_ is ValueCellFull!11708) mapValue!38858)) b!1043593))

(assert (= (and b!1043589 ((_ is ValueCellFull!11708) mapDefault!38858)) b!1043591))

(assert (= b!1043592 b!1043589))

(assert (= start!91694 b!1043592))

(declare-fun b_lambda!16155 () Bool)

(assert (=> (not b_lambda!16155) (not b!1043588)))

(declare-fun t!31244 () Bool)

(declare-fun tb!7035 () Bool)

(assert (=> (and b!1043592 (= (defaultEntry!6389 thiss!1427) (defaultEntry!6389 thiss!1427)) t!31244) tb!7035))

(declare-fun result!14501 () Bool)

(assert (=> tb!7035 (= result!14501 tp_is_empty!24823)))

(assert (=> b!1043588 t!31244))

(declare-fun b_and!33623 () Bool)

(assert (= b_and!33621 (and (=> t!31244 result!14501) b_and!33623)))

(declare-fun m!962385 () Bool)

(assert (=> b!1043592 m!962385))

(declare-fun m!962387 () Bool)

(assert (=> b!1043592 m!962387))

(declare-fun m!962389 () Bool)

(assert (=> b!1043590 m!962389))

(declare-fun m!962391 () Bool)

(assert (=> b!1043588 m!962391))

(declare-fun m!962393 () Bool)

(assert (=> b!1043588 m!962393))

(declare-fun m!962395 () Bool)

(assert (=> b!1043588 m!962395))

(declare-fun m!962397 () Bool)

(assert (=> b!1043588 m!962397))

(declare-fun m!962399 () Bool)

(assert (=> b!1043588 m!962399))

(declare-fun m!962401 () Bool)

(assert (=> b!1043588 m!962401))

(declare-fun m!962403 () Bool)

(assert (=> b!1043588 m!962403))

(declare-fun m!962405 () Bool)

(assert (=> b!1043588 m!962405))

(declare-fun m!962407 () Bool)

(assert (=> b!1043588 m!962407))

(declare-fun m!962409 () Bool)

(assert (=> b!1043588 m!962409))

(declare-fun m!962411 () Bool)

(assert (=> b!1043588 m!962411))

(declare-fun m!962413 () Bool)

(assert (=> b!1043588 m!962413))

(declare-fun m!962415 () Bool)

(assert (=> b!1043588 m!962415))

(declare-fun m!962417 () Bool)

(assert (=> b!1043588 m!962417))

(declare-fun m!962419 () Bool)

(assert (=> b!1043588 m!962419))

(assert (=> b!1043588 m!962407))

(declare-fun m!962421 () Bool)

(assert (=> b!1043588 m!962421))

(declare-fun m!962423 () Bool)

(assert (=> mapNonEmpty!38858 m!962423))

(declare-fun m!962425 () Bool)

(assert (=> start!91694 m!962425))

(check-sat (not b!1043590) (not b!1043592) tp_is_empty!24823 (not b_lambda!16155) (not b!1043588) (not start!91694) (not mapNonEmpty!38858) (not b_next!21103) b_and!33623)
(check-sat b_and!33623 (not b_next!21103))
(get-model)

(declare-fun b_lambda!16161 () Bool)

(assert (= b_lambda!16155 (or (and b!1043592 b_free!21103) b_lambda!16161)))

(check-sat (not b!1043590) (not b_lambda!16161) (not b!1043592) tp_is_empty!24823 (not b!1043588) (not start!91694) (not mapNonEmpty!38858) (not b_next!21103) b_and!33623)
(check-sat b_and!33623 (not b_next!21103))
(get-model)

(declare-fun d!126147 () Bool)

(declare-fun res!695262 () Bool)

(declare-fun e!591374 () Bool)

(assert (=> d!126147 (=> (not res!695262) (not e!591374))))

(declare-fun simpleValid!447 (LongMapFixedSize!6010) Bool)

(assert (=> d!126147 (= res!695262 (simpleValid!447 thiss!1427))))

(assert (=> d!126147 (= (valid!2250 thiss!1427) e!591374)))

(declare-fun b!1043648 () Bool)

(declare-fun res!695263 () Bool)

(assert (=> b!1043648 (=> (not res!695263) (not e!591374))))

(assert (=> b!1043648 (= res!695263 (= (arrayCountValidKeys!0 (_keys!11645 thiss!1427) #b00000000000000000000000000000000 (size!32163 (_keys!11645 thiss!1427))) (_size!3060 thiss!1427)))))

(declare-fun b!1043649 () Bool)

(declare-fun res!695264 () Bool)

(assert (=> b!1043649 (=> (not res!695264) (not e!591374))))

(assert (=> b!1043649 (= res!695264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11645 thiss!1427) (mask!30480 thiss!1427)))))

(declare-fun b!1043650 () Bool)

(assert (=> b!1043650 (= e!591374 (arrayNoDuplicates!0 (_keys!11645 thiss!1427) #b00000000000000000000000000000000 Nil!22030))))

(assert (= (and d!126147 res!695262) b!1043648))

(assert (= (and b!1043648 res!695263) b!1043649))

(assert (= (and b!1043649 res!695264) b!1043650))

(declare-fun m!962511 () Bool)

(assert (=> d!126147 m!962511))

(assert (=> b!1043648 m!962401))

(declare-fun m!962513 () Bool)

(assert (=> b!1043649 m!962513))

(declare-fun m!962515 () Bool)

(assert (=> b!1043650 m!962515))

(assert (=> start!91694 d!126147))

(declare-fun d!126149 () Bool)

(assert (=> d!126149 (= (array_inv!24441 (_keys!11645 thiss!1427)) (bvsge (size!32163 (_keys!11645 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043592 d!126149))

(declare-fun d!126151 () Bool)

(assert (=> d!126151 (= (array_inv!24442 (_values!6412 thiss!1427)) (bvsge (size!32164 (_values!6412 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043592 d!126151))

(declare-fun d!126153 () Bool)

(declare-fun e!591377 () Bool)

(assert (=> d!126153 e!591377))

(declare-fun res!695267 () Bool)

(assert (=> d!126153 (=> (not res!695267) (not e!591377))))

(assert (=> d!126153 (= res!695267 (bvslt (index!41712 lt!459968) (size!32163 (_keys!11645 thiss!1427))))))

(declare-fun lt!460015 () Unit!33967)

(declare-fun choose!121 (array!65749 (_ BitVec 32) (_ BitVec 64)) Unit!33967)

(assert (=> d!126153 (= lt!460015 (choose!121 (_keys!11645 thiss!1427) (index!41712 lt!459968) key!909))))

(assert (=> d!126153 (bvsge (index!41712 lt!459968) #b00000000000000000000000000000000)))

(assert (=> d!126153 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11645 thiss!1427) (index!41712 lt!459968) key!909) lt!460015)))

(declare-fun b!1043653 () Bool)

(assert (=> b!1043653 (= e!591377 (not (arrayContainsKey!0 (array!65750 (store (arr!31626 (_keys!11645 thiss!1427)) (index!41712 lt!459968) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32163 (_keys!11645 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126153 res!695267) b!1043653))

(declare-fun m!962517 () Bool)

(assert (=> d!126153 m!962517))

(assert (=> b!1043653 m!962409))

(declare-fun m!962519 () Bool)

(assert (=> b!1043653 m!962519))

(assert (=> b!1043588 d!126153))

(declare-fun d!126155 () Bool)

(declare-fun e!591380 () Bool)

(assert (=> d!126155 e!591380))

(declare-fun res!695270 () Bool)

(assert (=> d!126155 (=> (not res!695270) (not e!591380))))

(assert (=> d!126155 (= res!695270 (and (bvsge (index!41712 lt!459968) #b00000000000000000000000000000000) (bvslt (index!41712 lt!459968) (size!32163 (_keys!11645 thiss!1427)))))))

(declare-fun lt!460018 () Unit!33967)

(declare-fun choose!1716 (array!65749 array!65751 (_ BitVec 32) (_ BitVec 32) V!37971 V!37971 (_ BitVec 32) (_ BitVec 64) Int) Unit!33967)

(assert (=> d!126155 (= lt!460018 (choose!1716 (_keys!11645 thiss!1427) (_values!6412 thiss!1427) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) (index!41712 lt!459968) key!909 (defaultEntry!6389 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!126155 (validMask!0 (mask!30480 thiss!1427))))

(assert (=> d!126155 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!49 (_keys!11645 thiss!1427) (_values!6412 thiss!1427) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) (index!41712 lt!459968) key!909 (defaultEntry!6389 thiss!1427)) lt!460018)))

(declare-fun b!1043656 () Bool)

(assert (=> b!1043656 (= e!591380 (= (-!527 (getCurrentListMap!3901 (_keys!11645 thiss!1427) (_values!6412 thiss!1427) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)) key!909) (getCurrentListMap!3901 (array!65750 (store (arr!31626 (_keys!11645 thiss!1427)) (index!41712 lt!459968) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32163 (_keys!11645 thiss!1427))) (array!65752 (store (arr!31627 (_values!6412 thiss!1427)) (index!41712 lt!459968) (ValueCellFull!11708 (dynLambda!1988 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32164 (_values!6412 thiss!1427))) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427))))))

(assert (=> b!1043656 (bvslt (index!41712 lt!459968) (size!32164 (_values!6412 thiss!1427)))))

(assert (= (and d!126155 res!695270) b!1043656))

(declare-fun b_lambda!16163 () Bool)

(assert (=> (not b_lambda!16163) (not b!1043656)))

(assert (=> b!1043656 t!31244))

(declare-fun b_and!33633 () Bool)

(assert (= b_and!33623 (and (=> t!31244 result!14501) b_and!33633)))

(declare-fun m!962521 () Bool)

(assert (=> d!126155 m!962521))

(declare-fun m!962523 () Bool)

(assert (=> d!126155 m!962523))

(assert (=> b!1043656 m!962395))

(assert (=> b!1043656 m!962407))

(assert (=> b!1043656 m!962407))

(assert (=> b!1043656 m!962421))

(assert (=> b!1043656 m!962409))

(declare-fun m!962525 () Bool)

(assert (=> b!1043656 m!962525))

(assert (=> b!1043656 m!962411))

(assert (=> b!1043588 d!126155))

(declare-fun b!1043699 () Bool)

(declare-fun e!591414 () Bool)

(declare-fun e!591411 () Bool)

(assert (=> b!1043699 (= e!591414 e!591411)))

(declare-fun res!695290 () Bool)

(declare-fun call!44258 () Bool)

(assert (=> b!1043699 (= res!695290 call!44258)))

(assert (=> b!1043699 (=> (not res!695290) (not e!591411))))

(declare-fun b!1043700 () Bool)

(declare-fun e!591413 () ListLongMap!13839)

(declare-fun call!44255 () ListLongMap!13839)

(declare-fun +!3133 (ListLongMap!13839 tuple2!15816) ListLongMap!13839)

(assert (=> b!1043700 (= e!591413 (+!3133 call!44255 (tuple2!15817 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6223 thiss!1427))))))

(declare-fun b!1043701 () Bool)

(declare-fun res!695289 () Bool)

(declare-fun e!591410 () Bool)

(assert (=> b!1043701 (=> (not res!695289) (not e!591410))))

(declare-fun e!591416 () Bool)

(assert (=> b!1043701 (= res!695289 e!591416)))

(declare-fun c!105956 () Bool)

(assert (=> b!1043701 (= c!105956 (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1043702 () Bool)

(declare-fun e!591415 () ListLongMap!13839)

(declare-fun call!44253 () ListLongMap!13839)

(assert (=> b!1043702 (= e!591415 call!44253)))

(declare-fun bm!44249 () Bool)

(declare-fun call!44257 () Bool)

(declare-fun lt!460068 () ListLongMap!13839)

(declare-fun contains!6044 (ListLongMap!13839 (_ BitVec 64)) Bool)

(assert (=> bm!44249 (= call!44257 (contains!6044 lt!460068 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44250 () Bool)

(declare-fun call!44254 () ListLongMap!13839)

(declare-fun call!44256 () ListLongMap!13839)

(assert (=> bm!44250 (= call!44254 call!44256)))

(declare-fun b!1043703 () Bool)

(declare-fun e!591417 () ListLongMap!13839)

(assert (=> b!1043703 (= e!591413 e!591417)))

(declare-fun c!105953 () Bool)

(assert (=> b!1043703 (= c!105953 (and (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!44252 () ListLongMap!13839)

(declare-fun c!105957 () Bool)

(declare-fun bm!44251 () Bool)

(assert (=> bm!44251 (= call!44255 (+!3133 (ite c!105957 call!44256 (ite c!105953 call!44254 call!44252)) (ite (or c!105957 c!105953) (tuple2!15817 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6223 thiss!1427)) (tuple2!15817 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6223 thiss!1427)))))))

(declare-fun b!1043704 () Bool)

(assert (=> b!1043704 (= e!591415 call!44252)))

(declare-fun b!1043705 () Bool)

(declare-fun res!695292 () Bool)

(assert (=> b!1043705 (=> (not res!695292) (not e!591410))))

(declare-fun e!591419 () Bool)

(assert (=> b!1043705 (= res!695292 e!591419)))

(declare-fun res!695297 () Bool)

(assert (=> b!1043705 (=> res!695297 e!591419)))

(declare-fun e!591409 () Bool)

(assert (=> b!1043705 (= res!695297 (not e!591409))))

(declare-fun res!695293 () Bool)

(assert (=> b!1043705 (=> (not res!695293) (not e!591409))))

(assert (=> b!1043705 (= res!695293 (bvslt #b00000000000000000000000000000000 (size!32163 (_keys!11645 thiss!1427))))))

(declare-fun b!1043706 () Bool)

(assert (=> b!1043706 (= e!591417 call!44253)))

(declare-fun bm!44252 () Bool)

(assert (=> bm!44252 (= call!44252 call!44254)))

(declare-fun b!1043707 () Bool)

(assert (=> b!1043707 (= e!591414 (not call!44258))))

(declare-fun b!1043708 () Bool)

(assert (=> b!1043708 (= e!591410 e!591414)))

(declare-fun c!105954 () Bool)

(assert (=> b!1043708 (= c!105954 (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1043709 () Bool)

(declare-fun e!591418 () Bool)

(declare-fun apply!902 (ListLongMap!13839 (_ BitVec 64)) V!37971)

(assert (=> b!1043709 (= e!591418 (= (apply!902 lt!460068 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6223 thiss!1427)))))

(declare-fun bm!44253 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3568 (array!65749 array!65751 (_ BitVec 32) (_ BitVec 32) V!37971 V!37971 (_ BitVec 32) Int) ListLongMap!13839)

(assert (=> bm!44253 (= call!44256 (getCurrentListMapNoExtraKeys!3568 (_keys!11645 thiss!1427) (_values!6412 thiss!1427) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun b!1043710 () Bool)

(declare-fun e!591412 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1043710 (= e!591412 (validKeyInArray!0 (select (arr!31626 (_keys!11645 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043711 () Bool)

(declare-fun e!591408 () Unit!33967)

(declare-fun Unit!33973 () Unit!33967)

(assert (=> b!1043711 (= e!591408 Unit!33973)))

(declare-fun b!1043712 () Bool)

(assert (=> b!1043712 (= e!591409 (validKeyInArray!0 (select (arr!31626 (_keys!11645 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1043713 () Bool)

(declare-fun e!591407 () Bool)

(declare-fun get!16539 (ValueCell!11708 V!37971) V!37971)

(assert (=> b!1043713 (= e!591407 (= (apply!902 lt!460068 (select (arr!31626 (_keys!11645 thiss!1427)) #b00000000000000000000000000000000)) (get!16539 (select (arr!31627 (_values!6412 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1988 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1043713 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32164 (_values!6412 thiss!1427))))))

(assert (=> b!1043713 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32163 (_keys!11645 thiss!1427))))))

(declare-fun b!1043714 () Bool)

(assert (=> b!1043714 (= e!591416 (not call!44257))))

(declare-fun d!126157 () Bool)

(assert (=> d!126157 e!591410))

(declare-fun res!695296 () Bool)

(assert (=> d!126157 (=> (not res!695296) (not e!591410))))

(assert (=> d!126157 (= res!695296 (or (bvsge #b00000000000000000000000000000000 (size!32163 (_keys!11645 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32163 (_keys!11645 thiss!1427))))))))

(declare-fun lt!460070 () ListLongMap!13839)

(assert (=> d!126157 (= lt!460068 lt!460070)))

(declare-fun lt!460073 () Unit!33967)

(assert (=> d!126157 (= lt!460073 e!591408)))

(declare-fun c!105955 () Bool)

(assert (=> d!126157 (= c!105955 e!591412)))

(declare-fun res!695291 () Bool)

(assert (=> d!126157 (=> (not res!695291) (not e!591412))))

(assert (=> d!126157 (= res!695291 (bvslt #b00000000000000000000000000000000 (size!32163 (_keys!11645 thiss!1427))))))

(assert (=> d!126157 (= lt!460070 e!591413)))

(assert (=> d!126157 (= c!105957 (and (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126157 (validMask!0 (mask!30480 thiss!1427))))

(assert (=> d!126157 (= (getCurrentListMap!3901 (_keys!11645 thiss!1427) (_values!6412 thiss!1427) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)) lt!460068)))

(declare-fun b!1043715 () Bool)

(declare-fun lt!460079 () Unit!33967)

(assert (=> b!1043715 (= e!591408 lt!460079)))

(declare-fun lt!460069 () ListLongMap!13839)

(assert (=> b!1043715 (= lt!460069 (getCurrentListMapNoExtraKeys!3568 (_keys!11645 thiss!1427) (_values!6412 thiss!1427) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun lt!460067 () (_ BitVec 64))

(assert (=> b!1043715 (= lt!460067 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460075 () (_ BitVec 64))

(assert (=> b!1043715 (= lt!460075 (select (arr!31626 (_keys!11645 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460071 () Unit!33967)

(declare-fun addStillContains!621 (ListLongMap!13839 (_ BitVec 64) V!37971 (_ BitVec 64)) Unit!33967)

(assert (=> b!1043715 (= lt!460071 (addStillContains!621 lt!460069 lt!460067 (zeroValue!6223 thiss!1427) lt!460075))))

(assert (=> b!1043715 (contains!6044 (+!3133 lt!460069 (tuple2!15817 lt!460067 (zeroValue!6223 thiss!1427))) lt!460075)))

(declare-fun lt!460083 () Unit!33967)

(assert (=> b!1043715 (= lt!460083 lt!460071)))

(declare-fun lt!460066 () ListLongMap!13839)

(assert (=> b!1043715 (= lt!460066 (getCurrentListMapNoExtraKeys!3568 (_keys!11645 thiss!1427) (_values!6412 thiss!1427) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun lt!460076 () (_ BitVec 64))

(assert (=> b!1043715 (= lt!460076 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460074 () (_ BitVec 64))

(assert (=> b!1043715 (= lt!460074 (select (arr!31626 (_keys!11645 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460084 () Unit!33967)

(declare-fun addApplyDifferent!477 (ListLongMap!13839 (_ BitVec 64) V!37971 (_ BitVec 64)) Unit!33967)

(assert (=> b!1043715 (= lt!460084 (addApplyDifferent!477 lt!460066 lt!460076 (minValue!6223 thiss!1427) lt!460074))))

(assert (=> b!1043715 (= (apply!902 (+!3133 lt!460066 (tuple2!15817 lt!460076 (minValue!6223 thiss!1427))) lt!460074) (apply!902 lt!460066 lt!460074))))

(declare-fun lt!460081 () Unit!33967)

(assert (=> b!1043715 (= lt!460081 lt!460084)))

(declare-fun lt!460077 () ListLongMap!13839)

(assert (=> b!1043715 (= lt!460077 (getCurrentListMapNoExtraKeys!3568 (_keys!11645 thiss!1427) (_values!6412 thiss!1427) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun lt!460065 () (_ BitVec 64))

(assert (=> b!1043715 (= lt!460065 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460080 () (_ BitVec 64))

(assert (=> b!1043715 (= lt!460080 (select (arr!31626 (_keys!11645 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!460072 () Unit!33967)

(assert (=> b!1043715 (= lt!460072 (addApplyDifferent!477 lt!460077 lt!460065 (zeroValue!6223 thiss!1427) lt!460080))))

(assert (=> b!1043715 (= (apply!902 (+!3133 lt!460077 (tuple2!15817 lt!460065 (zeroValue!6223 thiss!1427))) lt!460080) (apply!902 lt!460077 lt!460080))))

(declare-fun lt!460063 () Unit!33967)

(assert (=> b!1043715 (= lt!460063 lt!460072)))

(declare-fun lt!460082 () ListLongMap!13839)

(assert (=> b!1043715 (= lt!460082 (getCurrentListMapNoExtraKeys!3568 (_keys!11645 thiss!1427) (_values!6412 thiss!1427) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun lt!460064 () (_ BitVec 64))

(assert (=> b!1043715 (= lt!460064 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460078 () (_ BitVec 64))

(assert (=> b!1043715 (= lt!460078 (select (arr!31626 (_keys!11645 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1043715 (= lt!460079 (addApplyDifferent!477 lt!460082 lt!460064 (minValue!6223 thiss!1427) lt!460078))))

(assert (=> b!1043715 (= (apply!902 (+!3133 lt!460082 (tuple2!15817 lt!460064 (minValue!6223 thiss!1427))) lt!460078) (apply!902 lt!460082 lt!460078))))

(declare-fun b!1043716 () Bool)

(assert (=> b!1043716 (= e!591419 e!591407)))

(declare-fun res!695294 () Bool)

(assert (=> b!1043716 (=> (not res!695294) (not e!591407))))

(assert (=> b!1043716 (= res!695294 (contains!6044 lt!460068 (select (arr!31626 (_keys!11645 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1043716 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32163 (_keys!11645 thiss!1427))))))

(declare-fun bm!44254 () Bool)

(assert (=> bm!44254 (= call!44258 (contains!6044 lt!460068 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44255 () Bool)

(assert (=> bm!44255 (= call!44253 call!44255)))

(declare-fun b!1043717 () Bool)

(declare-fun c!105958 () Bool)

(assert (=> b!1043717 (= c!105958 (and (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1043717 (= e!591417 e!591415)))

(declare-fun b!1043718 () Bool)

(assert (=> b!1043718 (= e!591411 (= (apply!902 lt!460068 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6223 thiss!1427)))))

(declare-fun b!1043719 () Bool)

(assert (=> b!1043719 (= e!591416 e!591418)))

(declare-fun res!695295 () Bool)

(assert (=> b!1043719 (= res!695295 call!44257)))

(assert (=> b!1043719 (=> (not res!695295) (not e!591418))))

(assert (= (and d!126157 c!105957) b!1043700))

(assert (= (and d!126157 (not c!105957)) b!1043703))

(assert (= (and b!1043703 c!105953) b!1043706))

(assert (= (and b!1043703 (not c!105953)) b!1043717))

(assert (= (and b!1043717 c!105958) b!1043702))

(assert (= (and b!1043717 (not c!105958)) b!1043704))

(assert (= (or b!1043702 b!1043704) bm!44252))

(assert (= (or b!1043706 bm!44252) bm!44250))

(assert (= (or b!1043706 b!1043702) bm!44255))

(assert (= (or b!1043700 bm!44250) bm!44253))

(assert (= (or b!1043700 bm!44255) bm!44251))

(assert (= (and d!126157 res!695291) b!1043710))

(assert (= (and d!126157 c!105955) b!1043715))

(assert (= (and d!126157 (not c!105955)) b!1043711))

(assert (= (and d!126157 res!695296) b!1043705))

(assert (= (and b!1043705 res!695293) b!1043712))

(assert (= (and b!1043705 (not res!695297)) b!1043716))

(assert (= (and b!1043716 res!695294) b!1043713))

(assert (= (and b!1043705 res!695292) b!1043701))

(assert (= (and b!1043701 c!105956) b!1043719))

(assert (= (and b!1043701 (not c!105956)) b!1043714))

(assert (= (and b!1043719 res!695295) b!1043709))

(assert (= (or b!1043719 b!1043714) bm!44249))

(assert (= (and b!1043701 res!695289) b!1043708))

(assert (= (and b!1043708 c!105954) b!1043699))

(assert (= (and b!1043708 (not c!105954)) b!1043707))

(assert (= (and b!1043699 res!695290) b!1043718))

(assert (= (or b!1043699 b!1043707) bm!44254))

(declare-fun b_lambda!16165 () Bool)

(assert (=> (not b_lambda!16165) (not b!1043713)))

(assert (=> b!1043713 t!31244))

(declare-fun b_and!33635 () Bool)

(assert (= b_and!33633 (and (=> t!31244 result!14501) b_and!33635)))

(declare-fun m!962527 () Bool)

(assert (=> bm!44253 m!962527))

(declare-fun m!962529 () Bool)

(assert (=> b!1043713 m!962529))

(declare-fun m!962531 () Bool)

(assert (=> b!1043713 m!962531))

(assert (=> b!1043713 m!962411))

(declare-fun m!962533 () Bool)

(assert (=> b!1043713 m!962533))

(assert (=> b!1043713 m!962411))

(declare-fun m!962535 () Bool)

(assert (=> b!1043713 m!962535))

(assert (=> b!1043713 m!962529))

(assert (=> b!1043713 m!962533))

(assert (=> d!126157 m!962523))

(assert (=> b!1043710 m!962529))

(assert (=> b!1043710 m!962529))

(declare-fun m!962537 () Bool)

(assert (=> b!1043710 m!962537))

(declare-fun m!962539 () Bool)

(assert (=> bm!44251 m!962539))

(declare-fun m!962541 () Bool)

(assert (=> bm!44249 m!962541))

(assert (=> b!1043716 m!962529))

(assert (=> b!1043716 m!962529))

(declare-fun m!962543 () Bool)

(assert (=> b!1043716 m!962543))

(assert (=> b!1043715 m!962527))

(declare-fun m!962545 () Bool)

(assert (=> b!1043715 m!962545))

(declare-fun m!962547 () Bool)

(assert (=> b!1043715 m!962547))

(declare-fun m!962549 () Bool)

(assert (=> b!1043715 m!962549))

(declare-fun m!962551 () Bool)

(assert (=> b!1043715 m!962551))

(declare-fun m!962553 () Bool)

(assert (=> b!1043715 m!962553))

(declare-fun m!962555 () Bool)

(assert (=> b!1043715 m!962555))

(declare-fun m!962557 () Bool)

(assert (=> b!1043715 m!962557))

(declare-fun m!962559 () Bool)

(assert (=> b!1043715 m!962559))

(assert (=> b!1043715 m!962545))

(declare-fun m!962561 () Bool)

(assert (=> b!1043715 m!962561))

(assert (=> b!1043715 m!962529))

(assert (=> b!1043715 m!962553))

(declare-fun m!962563 () Bool)

(assert (=> b!1043715 m!962563))

(declare-fun m!962565 () Bool)

(assert (=> b!1043715 m!962565))

(declare-fun m!962567 () Bool)

(assert (=> b!1043715 m!962567))

(assert (=> b!1043715 m!962549))

(declare-fun m!962569 () Bool)

(assert (=> b!1043715 m!962569))

(declare-fun m!962571 () Bool)

(assert (=> b!1043715 m!962571))

(declare-fun m!962573 () Bool)

(assert (=> b!1043715 m!962573))

(assert (=> b!1043715 m!962557))

(assert (=> b!1043712 m!962529))

(assert (=> b!1043712 m!962529))

(assert (=> b!1043712 m!962537))

(declare-fun m!962575 () Bool)

(assert (=> b!1043718 m!962575))

(declare-fun m!962577 () Bool)

(assert (=> bm!44254 m!962577))

(declare-fun m!962579 () Bool)

(assert (=> b!1043700 m!962579))

(declare-fun m!962581 () Bool)

(assert (=> b!1043709 m!962581))

(assert (=> b!1043588 d!126157))

(declare-fun d!126159 () Bool)

(declare-fun res!695302 () Bool)

(declare-fun e!591424 () Bool)

(assert (=> d!126159 (=> res!695302 e!591424)))

(assert (=> d!126159 (= res!695302 (= (select (arr!31626 lt!459966) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126159 (= (arrayContainsKey!0 lt!459966 key!909 #b00000000000000000000000000000000) e!591424)))

(declare-fun b!1043724 () Bool)

(declare-fun e!591425 () Bool)

(assert (=> b!1043724 (= e!591424 e!591425)))

(declare-fun res!695303 () Bool)

(assert (=> b!1043724 (=> (not res!695303) (not e!591425))))

(assert (=> b!1043724 (= res!695303 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32163 lt!459966)))))

(declare-fun b!1043725 () Bool)

(assert (=> b!1043725 (= e!591425 (arrayContainsKey!0 lt!459966 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126159 (not res!695302)) b!1043724))

(assert (= (and b!1043724 res!695303) b!1043725))

(declare-fun m!962583 () Bool)

(assert (=> d!126159 m!962583))

(declare-fun m!962585 () Bool)

(assert (=> b!1043725 m!962585))

(assert (=> b!1043588 d!126159))

(declare-fun b!1043726 () Bool)

(declare-fun e!591433 () Bool)

(declare-fun e!591430 () Bool)

(assert (=> b!1043726 (= e!591433 e!591430)))

(declare-fun res!695305 () Bool)

(declare-fun call!44265 () Bool)

(assert (=> b!1043726 (= res!695305 call!44265)))

(assert (=> b!1043726 (=> (not res!695305) (not e!591430))))

(declare-fun b!1043727 () Bool)

(declare-fun e!591432 () ListLongMap!13839)

(declare-fun call!44262 () ListLongMap!13839)

(assert (=> b!1043727 (= e!591432 (+!3133 call!44262 (tuple2!15817 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6223 thiss!1427))))))

(declare-fun b!1043728 () Bool)

(declare-fun res!695304 () Bool)

(declare-fun e!591429 () Bool)

(assert (=> b!1043728 (=> (not res!695304) (not e!591429))))

(declare-fun e!591435 () Bool)

(assert (=> b!1043728 (= res!695304 e!591435)))

(declare-fun c!105962 () Bool)

(assert (=> b!1043728 (= c!105962 (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1043729 () Bool)

(declare-fun e!591434 () ListLongMap!13839)

(declare-fun call!44260 () ListLongMap!13839)

(assert (=> b!1043729 (= e!591434 call!44260)))

(declare-fun bm!44256 () Bool)

(declare-fun call!44264 () Bool)

(declare-fun lt!460090 () ListLongMap!13839)

(assert (=> bm!44256 (= call!44264 (contains!6044 lt!460090 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44257 () Bool)

(declare-fun call!44261 () ListLongMap!13839)

(declare-fun call!44263 () ListLongMap!13839)

(assert (=> bm!44257 (= call!44261 call!44263)))

(declare-fun b!1043730 () Bool)

(declare-fun e!591436 () ListLongMap!13839)

(assert (=> b!1043730 (= e!591432 e!591436)))

(declare-fun c!105959 () Bool)

(assert (=> b!1043730 (= c!105959 (and (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!105963 () Bool)

(declare-fun call!44259 () ListLongMap!13839)

(declare-fun bm!44258 () Bool)

(assert (=> bm!44258 (= call!44262 (+!3133 (ite c!105963 call!44263 (ite c!105959 call!44261 call!44259)) (ite (or c!105963 c!105959) (tuple2!15817 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6223 thiss!1427)) (tuple2!15817 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6223 thiss!1427)))))))

(declare-fun b!1043731 () Bool)

(assert (=> b!1043731 (= e!591434 call!44259)))

(declare-fun b!1043732 () Bool)

(declare-fun res!695307 () Bool)

(assert (=> b!1043732 (=> (not res!695307) (not e!591429))))

(declare-fun e!591438 () Bool)

(assert (=> b!1043732 (= res!695307 e!591438)))

(declare-fun res!695312 () Bool)

(assert (=> b!1043732 (=> res!695312 e!591438)))

(declare-fun e!591428 () Bool)

(assert (=> b!1043732 (= res!695312 (not e!591428))))

(declare-fun res!695308 () Bool)

(assert (=> b!1043732 (=> (not res!695308) (not e!591428))))

(assert (=> b!1043732 (= res!695308 (bvslt #b00000000000000000000000000000000 (size!32163 lt!459966)))))

(declare-fun b!1043733 () Bool)

(assert (=> b!1043733 (= e!591436 call!44260)))

(declare-fun bm!44259 () Bool)

(assert (=> bm!44259 (= call!44259 call!44261)))

(declare-fun b!1043734 () Bool)

(assert (=> b!1043734 (= e!591433 (not call!44265))))

(declare-fun b!1043735 () Bool)

(assert (=> b!1043735 (= e!591429 e!591433)))

(declare-fun c!105960 () Bool)

(assert (=> b!1043735 (= c!105960 (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1043736 () Bool)

(declare-fun e!591437 () Bool)

(assert (=> b!1043736 (= e!591437 (= (apply!902 lt!460090 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6223 thiss!1427)))))

(declare-fun bm!44260 () Bool)

(assert (=> bm!44260 (= call!44263 (getCurrentListMapNoExtraKeys!3568 lt!459966 (array!65752 (store (arr!31627 (_values!6412 thiss!1427)) (index!41712 lt!459968) (ValueCellFull!11708 (dynLambda!1988 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32164 (_values!6412 thiss!1427))) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun b!1043737 () Bool)

(declare-fun e!591431 () Bool)

(assert (=> b!1043737 (= e!591431 (validKeyInArray!0 (select (arr!31626 lt!459966) #b00000000000000000000000000000000)))))

(declare-fun b!1043738 () Bool)

(declare-fun e!591427 () Unit!33967)

(declare-fun Unit!33974 () Unit!33967)

(assert (=> b!1043738 (= e!591427 Unit!33974)))

(declare-fun b!1043739 () Bool)

(assert (=> b!1043739 (= e!591428 (validKeyInArray!0 (select (arr!31626 lt!459966) #b00000000000000000000000000000000)))))

(declare-fun b!1043740 () Bool)

(declare-fun e!591426 () Bool)

(assert (=> b!1043740 (= e!591426 (= (apply!902 lt!460090 (select (arr!31626 lt!459966) #b00000000000000000000000000000000)) (get!16539 (select (arr!31627 (array!65752 (store (arr!31627 (_values!6412 thiss!1427)) (index!41712 lt!459968) (ValueCellFull!11708 (dynLambda!1988 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32164 (_values!6412 thiss!1427)))) #b00000000000000000000000000000000) (dynLambda!1988 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1043740 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32164 (array!65752 (store (arr!31627 (_values!6412 thiss!1427)) (index!41712 lt!459968) (ValueCellFull!11708 (dynLambda!1988 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32164 (_values!6412 thiss!1427))))))))

(assert (=> b!1043740 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32163 lt!459966)))))

(declare-fun b!1043741 () Bool)

(assert (=> b!1043741 (= e!591435 (not call!44264))))

(declare-fun d!126161 () Bool)

(assert (=> d!126161 e!591429))

(declare-fun res!695311 () Bool)

(assert (=> d!126161 (=> (not res!695311) (not e!591429))))

(assert (=> d!126161 (= res!695311 (or (bvsge #b00000000000000000000000000000000 (size!32163 lt!459966)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32163 lt!459966)))))))

(declare-fun lt!460092 () ListLongMap!13839)

(assert (=> d!126161 (= lt!460090 lt!460092)))

(declare-fun lt!460095 () Unit!33967)

(assert (=> d!126161 (= lt!460095 e!591427)))

(declare-fun c!105961 () Bool)

(assert (=> d!126161 (= c!105961 e!591431)))

(declare-fun res!695306 () Bool)

(assert (=> d!126161 (=> (not res!695306) (not e!591431))))

(assert (=> d!126161 (= res!695306 (bvslt #b00000000000000000000000000000000 (size!32163 lt!459966)))))

(assert (=> d!126161 (= lt!460092 e!591432)))

(assert (=> d!126161 (= c!105963 (and (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126161 (validMask!0 (mask!30480 thiss!1427))))

(assert (=> d!126161 (= (getCurrentListMap!3901 lt!459966 (array!65752 (store (arr!31627 (_values!6412 thiss!1427)) (index!41712 lt!459968) (ValueCellFull!11708 (dynLambda!1988 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32164 (_values!6412 thiss!1427))) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)) lt!460090)))

(declare-fun b!1043742 () Bool)

(declare-fun lt!460101 () Unit!33967)

(assert (=> b!1043742 (= e!591427 lt!460101)))

(declare-fun lt!460091 () ListLongMap!13839)

(assert (=> b!1043742 (= lt!460091 (getCurrentListMapNoExtraKeys!3568 lt!459966 (array!65752 (store (arr!31627 (_values!6412 thiss!1427)) (index!41712 lt!459968) (ValueCellFull!11708 (dynLambda!1988 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32164 (_values!6412 thiss!1427))) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun lt!460089 () (_ BitVec 64))

(assert (=> b!1043742 (= lt!460089 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460097 () (_ BitVec 64))

(assert (=> b!1043742 (= lt!460097 (select (arr!31626 lt!459966) #b00000000000000000000000000000000))))

(declare-fun lt!460093 () Unit!33967)

(assert (=> b!1043742 (= lt!460093 (addStillContains!621 lt!460091 lt!460089 (zeroValue!6223 thiss!1427) lt!460097))))

(assert (=> b!1043742 (contains!6044 (+!3133 lt!460091 (tuple2!15817 lt!460089 (zeroValue!6223 thiss!1427))) lt!460097)))

(declare-fun lt!460105 () Unit!33967)

(assert (=> b!1043742 (= lt!460105 lt!460093)))

(declare-fun lt!460088 () ListLongMap!13839)

(assert (=> b!1043742 (= lt!460088 (getCurrentListMapNoExtraKeys!3568 lt!459966 (array!65752 (store (arr!31627 (_values!6412 thiss!1427)) (index!41712 lt!459968) (ValueCellFull!11708 (dynLambda!1988 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32164 (_values!6412 thiss!1427))) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun lt!460098 () (_ BitVec 64))

(assert (=> b!1043742 (= lt!460098 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460096 () (_ BitVec 64))

(assert (=> b!1043742 (= lt!460096 (select (arr!31626 lt!459966) #b00000000000000000000000000000000))))

(declare-fun lt!460106 () Unit!33967)

(assert (=> b!1043742 (= lt!460106 (addApplyDifferent!477 lt!460088 lt!460098 (minValue!6223 thiss!1427) lt!460096))))

(assert (=> b!1043742 (= (apply!902 (+!3133 lt!460088 (tuple2!15817 lt!460098 (minValue!6223 thiss!1427))) lt!460096) (apply!902 lt!460088 lt!460096))))

(declare-fun lt!460103 () Unit!33967)

(assert (=> b!1043742 (= lt!460103 lt!460106)))

(declare-fun lt!460099 () ListLongMap!13839)

(assert (=> b!1043742 (= lt!460099 (getCurrentListMapNoExtraKeys!3568 lt!459966 (array!65752 (store (arr!31627 (_values!6412 thiss!1427)) (index!41712 lt!459968) (ValueCellFull!11708 (dynLambda!1988 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32164 (_values!6412 thiss!1427))) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun lt!460087 () (_ BitVec 64))

(assert (=> b!1043742 (= lt!460087 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460102 () (_ BitVec 64))

(assert (=> b!1043742 (= lt!460102 (select (arr!31626 lt!459966) #b00000000000000000000000000000000))))

(declare-fun lt!460094 () Unit!33967)

(assert (=> b!1043742 (= lt!460094 (addApplyDifferent!477 lt!460099 lt!460087 (zeroValue!6223 thiss!1427) lt!460102))))

(assert (=> b!1043742 (= (apply!902 (+!3133 lt!460099 (tuple2!15817 lt!460087 (zeroValue!6223 thiss!1427))) lt!460102) (apply!902 lt!460099 lt!460102))))

(declare-fun lt!460085 () Unit!33967)

(assert (=> b!1043742 (= lt!460085 lt!460094)))

(declare-fun lt!460104 () ListLongMap!13839)

(assert (=> b!1043742 (= lt!460104 (getCurrentListMapNoExtraKeys!3568 lt!459966 (array!65752 (store (arr!31627 (_values!6412 thiss!1427)) (index!41712 lt!459968) (ValueCellFull!11708 (dynLambda!1988 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32164 (_values!6412 thiss!1427))) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-fun lt!460086 () (_ BitVec 64))

(assert (=> b!1043742 (= lt!460086 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!460100 () (_ BitVec 64))

(assert (=> b!1043742 (= lt!460100 (select (arr!31626 lt!459966) #b00000000000000000000000000000000))))

(assert (=> b!1043742 (= lt!460101 (addApplyDifferent!477 lt!460104 lt!460086 (minValue!6223 thiss!1427) lt!460100))))

(assert (=> b!1043742 (= (apply!902 (+!3133 lt!460104 (tuple2!15817 lt!460086 (minValue!6223 thiss!1427))) lt!460100) (apply!902 lt!460104 lt!460100))))

(declare-fun b!1043743 () Bool)

(assert (=> b!1043743 (= e!591438 e!591426)))

(declare-fun res!695309 () Bool)

(assert (=> b!1043743 (=> (not res!695309) (not e!591426))))

(assert (=> b!1043743 (= res!695309 (contains!6044 lt!460090 (select (arr!31626 lt!459966) #b00000000000000000000000000000000)))))

(assert (=> b!1043743 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32163 lt!459966)))))

(declare-fun bm!44261 () Bool)

(assert (=> bm!44261 (= call!44265 (contains!6044 lt!460090 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44262 () Bool)

(assert (=> bm!44262 (= call!44260 call!44262)))

(declare-fun b!1043744 () Bool)

(declare-fun c!105964 () Bool)

(assert (=> b!1043744 (= c!105964 (and (not (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6117 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1043744 (= e!591436 e!591434)))

(declare-fun b!1043745 () Bool)

(assert (=> b!1043745 (= e!591430 (= (apply!902 lt!460090 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6223 thiss!1427)))))

(declare-fun b!1043746 () Bool)

(assert (=> b!1043746 (= e!591435 e!591437)))

(declare-fun res!695310 () Bool)

(assert (=> b!1043746 (= res!695310 call!44264)))

(assert (=> b!1043746 (=> (not res!695310) (not e!591437))))

(assert (= (and d!126161 c!105963) b!1043727))

(assert (= (and d!126161 (not c!105963)) b!1043730))

(assert (= (and b!1043730 c!105959) b!1043733))

(assert (= (and b!1043730 (not c!105959)) b!1043744))

(assert (= (and b!1043744 c!105964) b!1043729))

(assert (= (and b!1043744 (not c!105964)) b!1043731))

(assert (= (or b!1043729 b!1043731) bm!44259))

(assert (= (or b!1043733 bm!44259) bm!44257))

(assert (= (or b!1043733 b!1043729) bm!44262))

(assert (= (or b!1043727 bm!44257) bm!44260))

(assert (= (or b!1043727 bm!44262) bm!44258))

(assert (= (and d!126161 res!695306) b!1043737))

(assert (= (and d!126161 c!105961) b!1043742))

(assert (= (and d!126161 (not c!105961)) b!1043738))

(assert (= (and d!126161 res!695311) b!1043732))

(assert (= (and b!1043732 res!695308) b!1043739))

(assert (= (and b!1043732 (not res!695312)) b!1043743))

(assert (= (and b!1043743 res!695309) b!1043740))

(assert (= (and b!1043732 res!695307) b!1043728))

(assert (= (and b!1043728 c!105962) b!1043746))

(assert (= (and b!1043728 (not c!105962)) b!1043741))

(assert (= (and b!1043746 res!695310) b!1043736))

(assert (= (or b!1043746 b!1043741) bm!44256))

(assert (= (and b!1043728 res!695304) b!1043735))

(assert (= (and b!1043735 c!105960) b!1043726))

(assert (= (and b!1043735 (not c!105960)) b!1043734))

(assert (= (and b!1043726 res!695305) b!1043745))

(assert (= (or b!1043726 b!1043734) bm!44261))

(declare-fun b_lambda!16167 () Bool)

(assert (=> (not b_lambda!16167) (not b!1043740)))

(assert (=> b!1043740 t!31244))

(declare-fun b_and!33637 () Bool)

(assert (= b_and!33635 (and (=> t!31244 result!14501) b_and!33637)))

(declare-fun m!962587 () Bool)

(assert (=> bm!44260 m!962587))

(assert (=> b!1043740 m!962583))

(declare-fun m!962589 () Bool)

(assert (=> b!1043740 m!962589))

(assert (=> b!1043740 m!962411))

(declare-fun m!962591 () Bool)

(assert (=> b!1043740 m!962591))

(assert (=> b!1043740 m!962411))

(declare-fun m!962593 () Bool)

(assert (=> b!1043740 m!962593))

(assert (=> b!1043740 m!962583))

(assert (=> b!1043740 m!962591))

(assert (=> d!126161 m!962523))

(assert (=> b!1043737 m!962583))

(assert (=> b!1043737 m!962583))

(declare-fun m!962595 () Bool)

(assert (=> b!1043737 m!962595))

(declare-fun m!962597 () Bool)

(assert (=> bm!44258 m!962597))

(declare-fun m!962599 () Bool)

(assert (=> bm!44256 m!962599))

(assert (=> b!1043743 m!962583))

(assert (=> b!1043743 m!962583))

(declare-fun m!962601 () Bool)

(assert (=> b!1043743 m!962601))

(assert (=> b!1043742 m!962587))

(declare-fun m!962603 () Bool)

(assert (=> b!1043742 m!962603))

(declare-fun m!962605 () Bool)

(assert (=> b!1043742 m!962605))

(declare-fun m!962607 () Bool)

(assert (=> b!1043742 m!962607))

(declare-fun m!962609 () Bool)

(assert (=> b!1043742 m!962609))

(declare-fun m!962611 () Bool)

(assert (=> b!1043742 m!962611))

(declare-fun m!962613 () Bool)

(assert (=> b!1043742 m!962613))

(declare-fun m!962615 () Bool)

(assert (=> b!1043742 m!962615))

(declare-fun m!962617 () Bool)

(assert (=> b!1043742 m!962617))

(assert (=> b!1043742 m!962603))

(declare-fun m!962619 () Bool)

(assert (=> b!1043742 m!962619))

(assert (=> b!1043742 m!962583))

(assert (=> b!1043742 m!962611))

(declare-fun m!962621 () Bool)

(assert (=> b!1043742 m!962621))

(declare-fun m!962623 () Bool)

(assert (=> b!1043742 m!962623))

(declare-fun m!962625 () Bool)

(assert (=> b!1043742 m!962625))

(assert (=> b!1043742 m!962607))

(declare-fun m!962627 () Bool)

(assert (=> b!1043742 m!962627))

(declare-fun m!962629 () Bool)

(assert (=> b!1043742 m!962629))

(declare-fun m!962631 () Bool)

(assert (=> b!1043742 m!962631))

(assert (=> b!1043742 m!962615))

(assert (=> b!1043739 m!962583))

(assert (=> b!1043739 m!962583))

(assert (=> b!1043739 m!962595))

(declare-fun m!962633 () Bool)

(assert (=> b!1043745 m!962633))

(declare-fun m!962635 () Bool)

(assert (=> bm!44261 m!962635))

(declare-fun m!962637 () Bool)

(assert (=> b!1043727 m!962637))

(declare-fun m!962639 () Bool)

(assert (=> b!1043736 m!962639))

(assert (=> b!1043588 d!126161))

(declare-fun d!126163 () Bool)

(declare-fun lt!460109 () ListLongMap!13839)

(assert (=> d!126163 (not (contains!6044 lt!460109 key!909))))

(declare-fun removeStrictlySorted!59 (List!22032 (_ BitVec 64)) List!22032)

(assert (=> d!126163 (= lt!460109 (ListLongMap!13840 (removeStrictlySorted!59 (toList!6935 (getCurrentListMap!3901 (_keys!11645 thiss!1427) (_values!6412 thiss!1427) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427))) key!909)))))

(assert (=> d!126163 (= (-!527 (getCurrentListMap!3901 (_keys!11645 thiss!1427) (_values!6412 thiss!1427) (mask!30480 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)) key!909) lt!460109)))

(declare-fun bs!30478 () Bool)

(assert (= bs!30478 d!126163))

(declare-fun m!962641 () Bool)

(assert (=> bs!30478 m!962641))

(declare-fun m!962643 () Bool)

(assert (=> bs!30478 m!962643))

(assert (=> b!1043588 d!126163))

(declare-fun bm!44265 () Bool)

(declare-fun call!44268 () Bool)

(assert (=> bm!44265 (= call!44268 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459966 (mask!30480 thiss!1427)))))

(declare-fun b!1043755 () Bool)

(declare-fun e!591446 () Bool)

(declare-fun e!591445 () Bool)

(assert (=> b!1043755 (= e!591446 e!591445)))

(declare-fun c!105967 () Bool)

(assert (=> b!1043755 (= c!105967 (validKeyInArray!0 (select (arr!31626 lt!459966) #b00000000000000000000000000000000)))))

(declare-fun b!1043757 () Bool)

(declare-fun e!591447 () Bool)

(assert (=> b!1043757 (= e!591447 call!44268)))

(declare-fun b!1043758 () Bool)

(assert (=> b!1043758 (= e!591445 e!591447)))

(declare-fun lt!460117 () (_ BitVec 64))

(assert (=> b!1043758 (= lt!460117 (select (arr!31626 lt!459966) #b00000000000000000000000000000000))))

(declare-fun lt!460118 () Unit!33967)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65749 (_ BitVec 64) (_ BitVec 32)) Unit!33967)

(assert (=> b!1043758 (= lt!460118 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459966 lt!460117 #b00000000000000000000000000000000))))

(assert (=> b!1043758 (arrayContainsKey!0 lt!459966 lt!460117 #b00000000000000000000000000000000)))

(declare-fun lt!460116 () Unit!33967)

(assert (=> b!1043758 (= lt!460116 lt!460118)))

(declare-fun res!695318 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65749 (_ BitVec 32)) SeekEntryResult!9835)

(assert (=> b!1043758 (= res!695318 (= (seekEntryOrOpen!0 (select (arr!31626 lt!459966) #b00000000000000000000000000000000) lt!459966 (mask!30480 thiss!1427)) (Found!9835 #b00000000000000000000000000000000)))))

(assert (=> b!1043758 (=> (not res!695318) (not e!591447))))

(declare-fun b!1043756 () Bool)

(assert (=> b!1043756 (= e!591445 call!44268)))

(declare-fun d!126165 () Bool)

(declare-fun res!695317 () Bool)

(assert (=> d!126165 (=> res!695317 e!591446)))

(assert (=> d!126165 (= res!695317 (bvsge #b00000000000000000000000000000000 (size!32163 lt!459966)))))

(assert (=> d!126165 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459966 (mask!30480 thiss!1427)) e!591446)))

(assert (= (and d!126165 (not res!695317)) b!1043755))

(assert (= (and b!1043755 c!105967) b!1043758))

(assert (= (and b!1043755 (not c!105967)) b!1043756))

(assert (= (and b!1043758 res!695318) b!1043757))

(assert (= (or b!1043757 b!1043756) bm!44265))

(declare-fun m!962645 () Bool)

(assert (=> bm!44265 m!962645))

(assert (=> b!1043755 m!962583))

(assert (=> b!1043755 m!962583))

(assert (=> b!1043755 m!962595))

(assert (=> b!1043758 m!962583))

(declare-fun m!962647 () Bool)

(assert (=> b!1043758 m!962647))

(declare-fun m!962649 () Bool)

(assert (=> b!1043758 m!962649))

(assert (=> b!1043758 m!962583))

(declare-fun m!962651 () Bool)

(assert (=> b!1043758 m!962651))

(assert (=> b!1043588 d!126165))

(declare-fun d!126167 () Bool)

(declare-fun e!591450 () Bool)

(assert (=> d!126167 e!591450))

(declare-fun res!695321 () Bool)

(assert (=> d!126167 (=> (not res!695321) (not e!591450))))

(assert (=> d!126167 (= res!695321 (and (bvsge (index!41712 lt!459968) #b00000000000000000000000000000000) (bvslt (index!41712 lt!459968) (size!32163 (_keys!11645 thiss!1427)))))))

(declare-fun lt!460121 () Unit!33967)

(declare-fun choose!25 (array!65749 (_ BitVec 32) (_ BitVec 32)) Unit!33967)

(assert (=> d!126167 (= lt!460121 (choose!25 (_keys!11645 thiss!1427) (index!41712 lt!459968) (mask!30480 thiss!1427)))))

(assert (=> d!126167 (validMask!0 (mask!30480 thiss!1427))))

(assert (=> d!126167 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11645 thiss!1427) (index!41712 lt!459968) (mask!30480 thiss!1427)) lt!460121)))

(declare-fun b!1043761 () Bool)

(assert (=> b!1043761 (= e!591450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65750 (store (arr!31626 (_keys!11645 thiss!1427)) (index!41712 lt!459968) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32163 (_keys!11645 thiss!1427))) (mask!30480 thiss!1427)))))

(assert (= (and d!126167 res!695321) b!1043761))

(declare-fun m!962653 () Bool)

(assert (=> d!126167 m!962653))

(assert (=> d!126167 m!962523))

(assert (=> b!1043761 m!962409))

(declare-fun m!962655 () Bool)

(assert (=> b!1043761 m!962655))

(assert (=> b!1043588 d!126167))

(declare-fun b!1043772 () Bool)

(declare-fun e!591461 () Bool)

(declare-fun call!44271 () Bool)

(assert (=> b!1043772 (= e!591461 call!44271)))

(declare-fun b!1043773 () Bool)

(declare-fun e!591460 () Bool)

(declare-fun contains!6045 (List!22033 (_ BitVec 64)) Bool)

(assert (=> b!1043773 (= e!591460 (contains!6045 Nil!22030 (select (arr!31626 lt!459966) #b00000000000000000000000000000000)))))

(declare-fun bm!44268 () Bool)

(declare-fun c!105970 () Bool)

(assert (=> bm!44268 (= call!44271 (arrayNoDuplicates!0 lt!459966 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105970 (Cons!22029 (select (arr!31626 lt!459966) #b00000000000000000000000000000000) Nil!22030) Nil!22030)))))

(declare-fun b!1043774 () Bool)

(assert (=> b!1043774 (= e!591461 call!44271)))

(declare-fun b!1043775 () Bool)

(declare-fun e!591462 () Bool)

(assert (=> b!1043775 (= e!591462 e!591461)))

(assert (=> b!1043775 (= c!105970 (validKeyInArray!0 (select (arr!31626 lt!459966) #b00000000000000000000000000000000)))))

(declare-fun b!1043776 () Bool)

(declare-fun e!591459 () Bool)

(assert (=> b!1043776 (= e!591459 e!591462)))

(declare-fun res!695329 () Bool)

(assert (=> b!1043776 (=> (not res!695329) (not e!591462))))

(assert (=> b!1043776 (= res!695329 (not e!591460))))

(declare-fun res!695328 () Bool)

(assert (=> b!1043776 (=> (not res!695328) (not e!591460))))

(assert (=> b!1043776 (= res!695328 (validKeyInArray!0 (select (arr!31626 lt!459966) #b00000000000000000000000000000000)))))

(declare-fun d!126169 () Bool)

(declare-fun res!695330 () Bool)

(assert (=> d!126169 (=> res!695330 e!591459)))

(assert (=> d!126169 (= res!695330 (bvsge #b00000000000000000000000000000000 (size!32163 lt!459966)))))

(assert (=> d!126169 (= (arrayNoDuplicates!0 lt!459966 #b00000000000000000000000000000000 Nil!22030) e!591459)))

(assert (= (and d!126169 (not res!695330)) b!1043776))

(assert (= (and b!1043776 res!695328) b!1043773))

(assert (= (and b!1043776 res!695329) b!1043775))

(assert (= (and b!1043775 c!105970) b!1043774))

(assert (= (and b!1043775 (not c!105970)) b!1043772))

(assert (= (or b!1043774 b!1043772) bm!44268))

(assert (=> b!1043773 m!962583))

(assert (=> b!1043773 m!962583))

(declare-fun m!962657 () Bool)

(assert (=> b!1043773 m!962657))

(assert (=> bm!44268 m!962583))

(declare-fun m!962659 () Bool)

(assert (=> bm!44268 m!962659))

(assert (=> b!1043775 m!962583))

(assert (=> b!1043775 m!962583))

(assert (=> b!1043775 m!962595))

(assert (=> b!1043776 m!962583))

(assert (=> b!1043776 m!962583))

(assert (=> b!1043776 m!962595))

(assert (=> b!1043588 d!126169))

(declare-fun d!126171 () Bool)

(declare-fun lt!460124 () (_ BitVec 32))

(assert (=> d!126171 (and (bvsge lt!460124 #b00000000000000000000000000000000) (bvsle lt!460124 (bvsub (size!32163 lt!459966) #b00000000000000000000000000000000)))))

(declare-fun e!591467 () (_ BitVec 32))

(assert (=> d!126171 (= lt!460124 e!591467)))

(declare-fun c!105975 () Bool)

(assert (=> d!126171 (= c!105975 (bvsge #b00000000000000000000000000000000 (size!32163 (_keys!11645 thiss!1427))))))

(assert (=> d!126171 (and (bvsle #b00000000000000000000000000000000 (size!32163 (_keys!11645 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32163 (_keys!11645 thiss!1427)) (size!32163 lt!459966)))))

(assert (=> d!126171 (= (arrayCountValidKeys!0 lt!459966 #b00000000000000000000000000000000 (size!32163 (_keys!11645 thiss!1427))) lt!460124)))

(declare-fun b!1043785 () Bool)

(declare-fun e!591468 () (_ BitVec 32))

(declare-fun call!44274 () (_ BitVec 32))

(assert (=> b!1043785 (= e!591468 call!44274)))

(declare-fun b!1043786 () Bool)

(assert (=> b!1043786 (= e!591467 #b00000000000000000000000000000000)))

(declare-fun b!1043787 () Bool)

(assert (=> b!1043787 (= e!591468 (bvadd #b00000000000000000000000000000001 call!44274))))

(declare-fun bm!44271 () Bool)

(assert (=> bm!44271 (= call!44274 (arrayCountValidKeys!0 lt!459966 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32163 (_keys!11645 thiss!1427))))))

(declare-fun b!1043788 () Bool)

(assert (=> b!1043788 (= e!591467 e!591468)))

(declare-fun c!105976 () Bool)

(assert (=> b!1043788 (= c!105976 (validKeyInArray!0 (select (arr!31626 lt!459966) #b00000000000000000000000000000000)))))

(assert (= (and d!126171 c!105975) b!1043786))

(assert (= (and d!126171 (not c!105975)) b!1043788))

(assert (= (and b!1043788 c!105976) b!1043787))

(assert (= (and b!1043788 (not c!105976)) b!1043785))

(assert (= (or b!1043787 b!1043785) bm!44271))

(declare-fun m!962661 () Bool)

(assert (=> bm!44271 m!962661))

(assert (=> b!1043788 m!962583))

(assert (=> b!1043788 m!962583))

(assert (=> b!1043788 m!962595))

(assert (=> b!1043588 d!126171))

(declare-fun d!126173 () Bool)

(declare-fun lt!460125 () (_ BitVec 32))

(assert (=> d!126173 (and (bvsge lt!460125 #b00000000000000000000000000000000) (bvsle lt!460125 (bvsub (size!32163 (_keys!11645 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!591469 () (_ BitVec 32))

(assert (=> d!126173 (= lt!460125 e!591469)))

(declare-fun c!105977 () Bool)

(assert (=> d!126173 (= c!105977 (bvsge #b00000000000000000000000000000000 (size!32163 (_keys!11645 thiss!1427))))))

(assert (=> d!126173 (and (bvsle #b00000000000000000000000000000000 (size!32163 (_keys!11645 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32163 (_keys!11645 thiss!1427)) (size!32163 (_keys!11645 thiss!1427))))))

(assert (=> d!126173 (= (arrayCountValidKeys!0 (_keys!11645 thiss!1427) #b00000000000000000000000000000000 (size!32163 (_keys!11645 thiss!1427))) lt!460125)))

(declare-fun b!1043789 () Bool)

(declare-fun e!591470 () (_ BitVec 32))

(declare-fun call!44275 () (_ BitVec 32))

(assert (=> b!1043789 (= e!591470 call!44275)))

(declare-fun b!1043790 () Bool)

(assert (=> b!1043790 (= e!591469 #b00000000000000000000000000000000)))

(declare-fun b!1043791 () Bool)

(assert (=> b!1043791 (= e!591470 (bvadd #b00000000000000000000000000000001 call!44275))))

(declare-fun bm!44272 () Bool)

(assert (=> bm!44272 (= call!44275 (arrayCountValidKeys!0 (_keys!11645 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32163 (_keys!11645 thiss!1427))))))

(declare-fun b!1043792 () Bool)

(assert (=> b!1043792 (= e!591469 e!591470)))

(declare-fun c!105978 () Bool)

(assert (=> b!1043792 (= c!105978 (validKeyInArray!0 (select (arr!31626 (_keys!11645 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126173 c!105977) b!1043790))

(assert (= (and d!126173 (not c!105977)) b!1043792))

(assert (= (and b!1043792 c!105978) b!1043791))

(assert (= (and b!1043792 (not c!105978)) b!1043789))

(assert (= (or b!1043791 b!1043789) bm!44272))

(declare-fun m!962663 () Bool)

(assert (=> bm!44272 m!962663))

(assert (=> b!1043792 m!962529))

(assert (=> b!1043792 m!962529))

(assert (=> b!1043792 m!962537))

(assert (=> b!1043588 d!126173))

(declare-fun b!1043802 () Bool)

(declare-fun res!695342 () Bool)

(declare-fun e!591476 () Bool)

(assert (=> b!1043802 (=> (not res!695342) (not e!591476))))

(assert (=> b!1043802 (= res!695342 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1043801 () Bool)

(declare-fun res!695340 () Bool)

(assert (=> b!1043801 (=> (not res!695340) (not e!591476))))

(assert (=> b!1043801 (= res!695340 (validKeyInArray!0 (select (arr!31626 (_keys!11645 thiss!1427)) (index!41712 lt!459968))))))

(declare-fun b!1043803 () Bool)

(assert (=> b!1043803 (= e!591476 (bvslt (size!32163 (_keys!11645 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun d!126175 () Bool)

(declare-fun e!591475 () Bool)

(assert (=> d!126175 e!591475))

(declare-fun res!695339 () Bool)

(assert (=> d!126175 (=> (not res!695339) (not e!591475))))

(assert (=> d!126175 (= res!695339 (and (bvsge (index!41712 lt!459968) #b00000000000000000000000000000000) (bvslt (index!41712 lt!459968) (size!32163 (_keys!11645 thiss!1427)))))))

(declare-fun lt!460128 () Unit!33967)

(declare-fun choose!82 (array!65749 (_ BitVec 32) (_ BitVec 64)) Unit!33967)

(assert (=> d!126175 (= lt!460128 (choose!82 (_keys!11645 thiss!1427) (index!41712 lt!459968) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126175 e!591476))

(declare-fun res!695341 () Bool)

(assert (=> d!126175 (=> (not res!695341) (not e!591476))))

(assert (=> d!126175 (= res!695341 (and (bvsge (index!41712 lt!459968) #b00000000000000000000000000000000) (bvslt (index!41712 lt!459968) (size!32163 (_keys!11645 thiss!1427)))))))

(assert (=> d!126175 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11645 thiss!1427) (index!41712 lt!459968) #b1000000000000000000000000000000000000000000000000000000000000000) lt!460128)))

(declare-fun b!1043804 () Bool)

(assert (=> b!1043804 (= e!591475 (= (arrayCountValidKeys!0 (array!65750 (store (arr!31626 (_keys!11645 thiss!1427)) (index!41712 lt!459968) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32163 (_keys!11645 thiss!1427))) #b00000000000000000000000000000000 (size!32163 (_keys!11645 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11645 thiss!1427) #b00000000000000000000000000000000 (size!32163 (_keys!11645 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!126175 res!695341) b!1043801))

(assert (= (and b!1043801 res!695340) b!1043802))

(assert (= (and b!1043802 res!695342) b!1043803))

(assert (= (and d!126175 res!695339) b!1043804))

(declare-fun m!962665 () Bool)

(assert (=> b!1043802 m!962665))

(declare-fun m!962667 () Bool)

(assert (=> b!1043801 m!962667))

(assert (=> b!1043801 m!962667))

(declare-fun m!962669 () Bool)

(assert (=> b!1043801 m!962669))

(declare-fun m!962671 () Bool)

(assert (=> d!126175 m!962671))

(assert (=> b!1043804 m!962409))

(declare-fun m!962673 () Bool)

(assert (=> b!1043804 m!962673))

(assert (=> b!1043804 m!962401))

(assert (=> b!1043588 d!126175))

(declare-fun d!126177 () Bool)

(declare-fun e!591479 () Bool)

(assert (=> d!126177 e!591479))

(declare-fun res!695345 () Bool)

(assert (=> d!126177 (=> (not res!695345) (not e!591479))))

(assert (=> d!126177 (= res!695345 (and (bvsge (index!41712 lt!459968) #b00000000000000000000000000000000) (bvslt (index!41712 lt!459968) (size!32163 (_keys!11645 thiss!1427)))))))

(declare-fun lt!460131 () Unit!33967)

(declare-fun choose!53 (array!65749 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22033) Unit!33967)

(assert (=> d!126177 (= lt!460131 (choose!53 (_keys!11645 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41712 lt!459968) #b00000000000000000000000000000000 Nil!22030))))

(assert (=> d!126177 (bvslt (size!32163 (_keys!11645 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126177 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11645 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41712 lt!459968) #b00000000000000000000000000000000 Nil!22030) lt!460131)))

(declare-fun b!1043807 () Bool)

(assert (=> b!1043807 (= e!591479 (arrayNoDuplicates!0 (array!65750 (store (arr!31626 (_keys!11645 thiss!1427)) (index!41712 lt!459968) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32163 (_keys!11645 thiss!1427))) #b00000000000000000000000000000000 Nil!22030))))

(assert (= (and d!126177 res!695345) b!1043807))

(declare-fun m!962675 () Bool)

(assert (=> d!126177 m!962675))

(assert (=> b!1043807 m!962409))

(declare-fun m!962677 () Bool)

(assert (=> b!1043807 m!962677))

(assert (=> b!1043588 d!126177))

(declare-fun b!1043820 () Bool)

(declare-fun e!591486 () SeekEntryResult!9835)

(declare-fun lt!460141 () SeekEntryResult!9835)

(assert (=> b!1043820 (= e!591486 (Found!9835 (index!41713 lt!460141)))))

(declare-fun d!126179 () Bool)

(declare-fun lt!460140 () SeekEntryResult!9835)

(assert (=> d!126179 (and (or ((_ is MissingVacant!9835) lt!460140) (not ((_ is Found!9835) lt!460140)) (and (bvsge (index!41712 lt!460140) #b00000000000000000000000000000000) (bvslt (index!41712 lt!460140) (size!32163 (_keys!11645 thiss!1427))))) (not ((_ is MissingVacant!9835) lt!460140)) (or (not ((_ is Found!9835) lt!460140)) (= (select (arr!31626 (_keys!11645 thiss!1427)) (index!41712 lt!460140)) key!909)))))

(declare-fun e!591487 () SeekEntryResult!9835)

(assert (=> d!126179 (= lt!460140 e!591487)))

(declare-fun c!105985 () Bool)

(assert (=> d!126179 (= c!105985 (and ((_ is Intermediate!9835) lt!460141) (undefined!10647 lt!460141)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65749 (_ BitVec 32)) SeekEntryResult!9835)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126179 (= lt!460141 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30480 thiss!1427)) key!909 (_keys!11645 thiss!1427) (mask!30480 thiss!1427)))))

(assert (=> d!126179 (validMask!0 (mask!30480 thiss!1427))))

(assert (=> d!126179 (= (seekEntry!0 key!909 (_keys!11645 thiss!1427) (mask!30480 thiss!1427)) lt!460140)))

(declare-fun b!1043821 () Bool)

(assert (=> b!1043821 (= e!591487 Undefined!9835)))

(declare-fun b!1043822 () Bool)

(declare-fun e!591488 () SeekEntryResult!9835)

(assert (=> b!1043822 (= e!591488 (MissingZero!9835 (index!41713 lt!460141)))))

(declare-fun b!1043823 () Bool)

(declare-fun lt!460142 () SeekEntryResult!9835)

(assert (=> b!1043823 (= e!591488 (ite ((_ is MissingVacant!9835) lt!460142) (MissingZero!9835 (index!41714 lt!460142)) lt!460142))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65749 (_ BitVec 32)) SeekEntryResult!9835)

(assert (=> b!1043823 (= lt!460142 (seekKeyOrZeroReturnVacant!0 (x!93190 lt!460141) (index!41713 lt!460141) (index!41713 lt!460141) key!909 (_keys!11645 thiss!1427) (mask!30480 thiss!1427)))))

(declare-fun b!1043824 () Bool)

(assert (=> b!1043824 (= e!591487 e!591486)))

(declare-fun lt!460143 () (_ BitVec 64))

(assert (=> b!1043824 (= lt!460143 (select (arr!31626 (_keys!11645 thiss!1427)) (index!41713 lt!460141)))))

(declare-fun c!105986 () Bool)

(assert (=> b!1043824 (= c!105986 (= lt!460143 key!909))))

(declare-fun b!1043825 () Bool)

(declare-fun c!105987 () Bool)

(assert (=> b!1043825 (= c!105987 (= lt!460143 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1043825 (= e!591486 e!591488)))

(assert (= (and d!126179 c!105985) b!1043821))

(assert (= (and d!126179 (not c!105985)) b!1043824))

(assert (= (and b!1043824 c!105986) b!1043820))

(assert (= (and b!1043824 (not c!105986)) b!1043825))

(assert (= (and b!1043825 c!105987) b!1043822))

(assert (= (and b!1043825 (not c!105987)) b!1043823))

(declare-fun m!962679 () Bool)

(assert (=> d!126179 m!962679))

(declare-fun m!962681 () Bool)

(assert (=> d!126179 m!962681))

(assert (=> d!126179 m!962681))

(declare-fun m!962683 () Bool)

(assert (=> d!126179 m!962683))

(assert (=> d!126179 m!962523))

(declare-fun m!962685 () Bool)

(assert (=> b!1043823 m!962685))

(declare-fun m!962687 () Bool)

(assert (=> b!1043824 m!962687))

(assert (=> b!1043590 d!126179))

(declare-fun mapIsEmpty!38867 () Bool)

(declare-fun mapRes!38867 () Bool)

(assert (=> mapIsEmpty!38867 mapRes!38867))

(declare-fun b!1043832 () Bool)

(declare-fun e!591494 () Bool)

(assert (=> b!1043832 (= e!591494 tp_is_empty!24823)))

(declare-fun b!1043833 () Bool)

(declare-fun e!591493 () Bool)

(assert (=> b!1043833 (= e!591493 tp_is_empty!24823)))

(declare-fun mapNonEmpty!38867 () Bool)

(declare-fun tp!74565 () Bool)

(assert (=> mapNonEmpty!38867 (= mapRes!38867 (and tp!74565 e!591494))))

(declare-fun mapKey!38867 () (_ BitVec 32))

(declare-fun mapValue!38867 () ValueCell!11708)

(declare-fun mapRest!38867 () (Array (_ BitVec 32) ValueCell!11708))

(assert (=> mapNonEmpty!38867 (= mapRest!38858 (store mapRest!38867 mapKey!38867 mapValue!38867))))

(declare-fun condMapEmpty!38867 () Bool)

(declare-fun mapDefault!38867 () ValueCell!11708)

(assert (=> mapNonEmpty!38858 (= condMapEmpty!38867 (= mapRest!38858 ((as const (Array (_ BitVec 32) ValueCell!11708)) mapDefault!38867)))))

(assert (=> mapNonEmpty!38858 (= tp!74549 (and e!591493 mapRes!38867))))

(assert (= (and mapNonEmpty!38858 condMapEmpty!38867) mapIsEmpty!38867))

(assert (= (and mapNonEmpty!38858 (not condMapEmpty!38867)) mapNonEmpty!38867))

(assert (= (and mapNonEmpty!38867 ((_ is ValueCellFull!11708) mapValue!38867)) b!1043832))

(assert (= (and mapNonEmpty!38858 ((_ is ValueCellFull!11708) mapDefault!38867)) b!1043833))

(declare-fun m!962689 () Bool)

(assert (=> mapNonEmpty!38867 m!962689))

(declare-fun b_lambda!16169 () Bool)

(assert (= b_lambda!16167 (or (and b!1043592 b_free!21103) b_lambda!16169)))

(declare-fun b_lambda!16171 () Bool)

(assert (= b_lambda!16165 (or (and b!1043592 b_free!21103) b_lambda!16171)))

(declare-fun b_lambda!16173 () Bool)

(assert (= b_lambda!16163 (or (and b!1043592 b_free!21103) b_lambda!16173)))

(check-sat (not b!1043710) (not b!1043736) (not b!1043712) (not bm!44268) (not b!1043737) (not d!126161) (not d!126153) (not b!1043745) (not bm!44256) (not b_lambda!16171) (not b!1043773) (not d!126147) (not b!1043649) (not d!126167) (not b!1043758) (not b!1043656) b_and!33637 (not bm!44271) (not b!1043739) (not b!1043727) (not b_lambda!16161) (not bm!44253) (not b!1043718) (not mapNonEmpty!38867) (not b!1043801) (not b!1043715) (not bm!44251) (not b!1043713) (not b!1043802) (not bm!44260) (not d!126163) (not b!1043650) (not d!126155) (not b!1043648) (not b!1043700) (not b_lambda!16173) (not d!126157) (not b!1043788) tp_is_empty!24823 (not b!1043709) (not b!1043742) (not bm!44265) (not b!1043804) (not b!1043743) (not bm!44258) (not b!1043716) (not b!1043775) (not b!1043792) (not b!1043807) (not b!1043740) (not b_next!21103) (not bm!44249) (not bm!44272) (not b!1043725) (not b!1043761) (not d!126179) (not bm!44254) (not b!1043755) (not b!1043776) (not b_lambda!16169) (not d!126175) (not bm!44261) (not b!1043823) (not b!1043653) (not d!126177))
(check-sat b_and!33637 (not b_next!21103))
