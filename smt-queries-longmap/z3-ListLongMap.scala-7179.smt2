; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91854 () Bool)

(assert start!91854)

(declare-fun b!1044953 () Bool)

(declare-fun b_free!21129 () Bool)

(declare-fun b_next!21129 () Bool)

(assert (=> b!1044953 (= b_free!21129 (not b_next!21129))))

(declare-fun tp!74640 () Bool)

(declare-fun b_and!33729 () Bool)

(assert (=> b!1044953 (= tp!74640 b_and!33729)))

(declare-fun b!1044950 () Bool)

(declare-fun e!592270 () Bool)

(declare-fun e!592268 () Bool)

(declare-fun mapRes!38909 () Bool)

(assert (=> b!1044950 (= e!592270 (and e!592268 mapRes!38909))))

(declare-fun condMapEmpty!38909 () Bool)

(declare-datatypes ((V!38005 0))(
  ( (V!38006 (val!12475 Int)) )
))
(declare-datatypes ((ValueCell!11721 0))(
  ( (ValueCellFull!11721 (v!15069 V!38005)) (EmptyCell!11721) )
))
(declare-datatypes ((array!65870 0))(
  ( (array!65871 (arr!31683 (Array (_ BitVec 32) (_ BitVec 64))) (size!32218 (_ BitVec 32))) )
))
(declare-datatypes ((array!65872 0))(
  ( (array!65873 (arr!31684 (Array (_ BitVec 32) ValueCell!11721)) (size!32219 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6036 0))(
  ( (LongMapFixedSize!6037 (defaultEntry!6410 Int) (mask!30529 (_ BitVec 32)) (extraKeys!6138 (_ BitVec 32)) (zeroValue!6244 V!38005) (minValue!6244 V!38005) (_size!3073 (_ BitVec 32)) (_keys!11678 array!65870) (_values!6433 array!65872) (_vacant!3073 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6036)

(declare-fun mapDefault!38909 () ValueCell!11721)

(assert (=> b!1044950 (= condMapEmpty!38909 (= (arr!31684 (_values!6433 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11721)) mapDefault!38909)))))

(declare-fun res!695870 () Bool)

(declare-fun e!592271 () Bool)

(assert (=> start!91854 (=> (not res!695870) (not e!592271))))

(declare-fun valid!2265 (LongMapFixedSize!6036) Bool)

(assert (=> start!91854 (= res!695870 (valid!2265 thiss!1427))))

(assert (=> start!91854 e!592271))

(declare-fun e!592273 () Bool)

(assert (=> start!91854 e!592273))

(assert (=> start!91854 true))

(declare-fun b!1044951 () Bool)

(declare-fun res!695873 () Bool)

(declare-fun e!592275 () Bool)

(assert (=> b!1044951 (=> res!695873 e!592275)))

(declare-datatypes ((Unit!34125 0))(
  ( (Unit!34126) )
))
(declare-datatypes ((tuple2!15774 0))(
  ( (tuple2!15775 (_1!7898 Unit!34125) (_2!7898 LongMapFixedSize!6036)) )
))
(declare-fun lt!461132 () tuple2!15774)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1044951 (= res!695873 (not (validMask!0 (mask!30529 (_2!7898 lt!461132)))))))

(declare-fun mapIsEmpty!38909 () Bool)

(assert (=> mapIsEmpty!38909 mapRes!38909))

(declare-fun b!1044952 () Bool)

(declare-fun e!592272 () Bool)

(assert (=> b!1044952 (= e!592272 (not e!592275))))

(declare-fun res!695872 () Bool)

(assert (=> b!1044952 (=> res!695872 e!592275)))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15776 0))(
  ( (tuple2!15777 (_1!7899 (_ BitVec 64)) (_2!7899 V!38005)) )
))
(declare-datatypes ((List!22012 0))(
  ( (Nil!22009) (Cons!22008 (h!23216 tuple2!15776) (t!31266 List!22012)) )
))
(declare-datatypes ((ListLongMap!13787 0))(
  ( (ListLongMap!13788 (toList!6909 List!22012)) )
))
(declare-fun contains!6076 (ListLongMap!13787 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3957 (array!65870 array!65872 (_ BitVec 32) (_ BitVec 32) V!38005 V!38005 (_ BitVec 32) Int) ListLongMap!13787)

(assert (=> b!1044952 (= res!695872 (not (contains!6076 (getCurrentListMap!3957 (_keys!11678 (_2!7898 lt!461132)) (_values!6433 (_2!7898 lt!461132)) (mask!30529 (_2!7898 lt!461132)) (extraKeys!6138 (_2!7898 lt!461132)) (zeroValue!6244 (_2!7898 lt!461132)) (minValue!6244 (_2!7898 lt!461132)) #b00000000000000000000000000000000 (defaultEntry!6410 (_2!7898 lt!461132))) key!909)))))

(declare-fun lt!461129 () array!65872)

(declare-fun lt!461135 () array!65870)

(declare-fun Unit!34127 () Unit!34125)

(declare-fun Unit!34128 () Unit!34125)

(assert (=> b!1044952 (= lt!461132 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3073 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15775 Unit!34127 (LongMapFixedSize!6037 (defaultEntry!6410 thiss!1427) (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) (bvsub (_size!3073 thiss!1427) #b00000000000000000000000000000001) lt!461135 lt!461129 (bvadd #b00000000000000000000000000000001 (_vacant!3073 thiss!1427)))) (tuple2!15775 Unit!34128 (LongMapFixedSize!6037 (defaultEntry!6410 thiss!1427) (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) (bvsub (_size!3073 thiss!1427) #b00000000000000000000000000000001) lt!461135 lt!461129 (_vacant!3073 thiss!1427)))))))

(declare-fun -!536 (ListLongMap!13787 (_ BitVec 64)) ListLongMap!13787)

(assert (=> b!1044952 (= (-!536 (getCurrentListMap!3957 (_keys!11678 thiss!1427) (_values!6433 thiss!1427) (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6410 thiss!1427)) key!909) (getCurrentListMap!3957 lt!461135 lt!461129 (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6410 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9844 0))(
  ( (MissingZero!9844 (index!41747 (_ BitVec 32))) (Found!9844 (index!41748 (_ BitVec 32))) (Intermediate!9844 (undefined!10656 Bool) (index!41749 (_ BitVec 32)) (x!93324 (_ BitVec 32))) (Undefined!9844) (MissingVacant!9844 (index!41750 (_ BitVec 32))) )
))
(declare-fun lt!461127 () SeekEntryResult!9844)

(declare-fun dynLambda!2006 (Int (_ BitVec 64)) V!38005)

(assert (=> b!1044952 (= lt!461129 (array!65873 (store (arr!31684 (_values!6433 thiss!1427)) (index!41748 lt!461127) (ValueCellFull!11721 (dynLambda!2006 (defaultEntry!6410 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32219 (_values!6433 thiss!1427))))))

(declare-fun lt!461128 () Unit!34125)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!57 (array!65870 array!65872 (_ BitVec 32) (_ BitVec 32) V!38005 V!38005 (_ BitVec 32) (_ BitVec 64) Int) Unit!34125)

(assert (=> b!1044952 (= lt!461128 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!57 (_keys!11678 thiss!1427) (_values!6433 thiss!1427) (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) (index!41748 lt!461127) key!909 (defaultEntry!6410 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1044952 (not (arrayContainsKey!0 lt!461135 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!461133 () Unit!34125)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65870 (_ BitVec 32) (_ BitVec 64)) Unit!34125)

(assert (=> b!1044952 (= lt!461133 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11678 thiss!1427) (index!41748 lt!461127) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65870 (_ BitVec 32)) Bool)

(assert (=> b!1044952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461135 (mask!30529 thiss!1427))))

(declare-fun lt!461130 () Unit!34125)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65870 (_ BitVec 32) (_ BitVec 32)) Unit!34125)

(assert (=> b!1044952 (= lt!461130 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11678 thiss!1427) (index!41748 lt!461127) (mask!30529 thiss!1427)))))

(declare-datatypes ((List!22013 0))(
  ( (Nil!22010) (Cons!22009 (h!23217 (_ BitVec 64)) (t!31267 List!22013)) )
))
(declare-fun arrayNoDuplicates!0 (array!65870 (_ BitVec 32) List!22013) Bool)

(assert (=> b!1044952 (arrayNoDuplicates!0 lt!461135 #b00000000000000000000000000000000 Nil!22010)))

(declare-fun lt!461134 () Unit!34125)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65870 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22013) Unit!34125)

(assert (=> b!1044952 (= lt!461134 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11678 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41748 lt!461127) #b00000000000000000000000000000000 Nil!22010))))

(declare-fun arrayCountValidKeys!0 (array!65870 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1044952 (= (arrayCountValidKeys!0 lt!461135 #b00000000000000000000000000000000 (size!32218 (_keys!11678 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11678 thiss!1427) #b00000000000000000000000000000000 (size!32218 (_keys!11678 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1044952 (= lt!461135 (array!65871 (store (arr!31683 (_keys!11678 thiss!1427)) (index!41748 lt!461127) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32218 (_keys!11678 thiss!1427))))))

(declare-fun lt!461131 () Unit!34125)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65870 (_ BitVec 32) (_ BitVec 64)) Unit!34125)

(assert (=> b!1044952 (= lt!461131 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11678 thiss!1427) (index!41748 lt!461127) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun tp_is_empty!24849 () Bool)

(declare-fun array_inv!24473 (array!65870) Bool)

(declare-fun array_inv!24474 (array!65872) Bool)

(assert (=> b!1044953 (= e!592273 (and tp!74640 tp_is_empty!24849 (array_inv!24473 (_keys!11678 thiss!1427)) (array_inv!24474 (_values!6433 thiss!1427)) e!592270))))

(declare-fun b!1044954 () Bool)

(declare-fun e!592269 () Bool)

(assert (=> b!1044954 (= e!592269 tp_is_empty!24849)))

(declare-fun b!1044955 () Bool)

(assert (=> b!1044955 (= e!592268 tp_is_empty!24849)))

(declare-fun b!1044956 () Bool)

(assert (=> b!1044956 (= e!592275 (or (not (= (size!32219 (_values!6433 (_2!7898 lt!461132))) (bvadd #b00000000000000000000000000000001 (mask!30529 (_2!7898 lt!461132))))) (not (= (size!32218 (_keys!11678 (_2!7898 lt!461132))) (size!32219 (_values!6433 (_2!7898 lt!461132))))) (bvsge (mask!30529 (_2!7898 lt!461132)) #b00000000000000000000000000000000)))))

(declare-fun b!1044957 () Bool)

(declare-fun res!695871 () Bool)

(assert (=> b!1044957 (=> (not res!695871) (not e!592271))))

(assert (=> b!1044957 (= res!695871 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38909 () Bool)

(declare-fun tp!74639 () Bool)

(assert (=> mapNonEmpty!38909 (= mapRes!38909 (and tp!74639 e!592269))))

(declare-fun mapRest!38909 () (Array (_ BitVec 32) ValueCell!11721))

(declare-fun mapValue!38909 () ValueCell!11721)

(declare-fun mapKey!38909 () (_ BitVec 32))

(assert (=> mapNonEmpty!38909 (= (arr!31684 (_values!6433 thiss!1427)) (store mapRest!38909 mapKey!38909 mapValue!38909))))

(declare-fun b!1044958 () Bool)

(assert (=> b!1044958 (= e!592271 e!592272)))

(declare-fun res!695874 () Bool)

(assert (=> b!1044958 (=> (not res!695874) (not e!592272))))

(get-info :version)

(assert (=> b!1044958 (= res!695874 ((_ is Found!9844) lt!461127))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65870 (_ BitVec 32)) SeekEntryResult!9844)

(assert (=> b!1044958 (= lt!461127 (seekEntry!0 key!909 (_keys!11678 thiss!1427) (mask!30529 thiss!1427)))))

(assert (= (and start!91854 res!695870) b!1044957))

(assert (= (and b!1044957 res!695871) b!1044958))

(assert (= (and b!1044958 res!695874) b!1044952))

(assert (= (and b!1044952 (not res!695872)) b!1044951))

(assert (= (and b!1044951 (not res!695873)) b!1044956))

(assert (= (and b!1044950 condMapEmpty!38909) mapIsEmpty!38909))

(assert (= (and b!1044950 (not condMapEmpty!38909)) mapNonEmpty!38909))

(assert (= (and mapNonEmpty!38909 ((_ is ValueCellFull!11721) mapValue!38909)) b!1044954))

(assert (= (and b!1044950 ((_ is ValueCellFull!11721) mapDefault!38909)) b!1044955))

(assert (= b!1044953 b!1044950))

(assert (= start!91854 b!1044953))

(declare-fun b_lambda!16265 () Bool)

(assert (=> (not b_lambda!16265) (not b!1044952)))

(declare-fun t!31265 () Bool)

(declare-fun tb!7075 () Bool)

(assert (=> (and b!1044953 (= (defaultEntry!6410 thiss!1427) (defaultEntry!6410 thiss!1427)) t!31265) tb!7075))

(declare-fun result!14575 () Bool)

(assert (=> tb!7075 (= result!14575 tp_is_empty!24849)))

(assert (=> b!1044952 t!31265))

(declare-fun b_and!33731 () Bool)

(assert (= b_and!33729 (and (=> t!31265 result!14575) b_and!33731)))

(declare-fun m!964529 () Bool)

(assert (=> b!1044951 m!964529))

(declare-fun m!964531 () Bool)

(assert (=> b!1044953 m!964531))

(declare-fun m!964533 () Bool)

(assert (=> b!1044953 m!964533))

(declare-fun m!964535 () Bool)

(assert (=> mapNonEmpty!38909 m!964535))

(declare-fun m!964537 () Bool)

(assert (=> start!91854 m!964537))

(declare-fun m!964539 () Bool)

(assert (=> b!1044958 m!964539))

(declare-fun m!964541 () Bool)

(assert (=> b!1044952 m!964541))

(declare-fun m!964543 () Bool)

(assert (=> b!1044952 m!964543))

(declare-fun m!964545 () Bool)

(assert (=> b!1044952 m!964545))

(declare-fun m!964547 () Bool)

(assert (=> b!1044952 m!964547))

(declare-fun m!964549 () Bool)

(assert (=> b!1044952 m!964549))

(declare-fun m!964551 () Bool)

(assert (=> b!1044952 m!964551))

(declare-fun m!964553 () Bool)

(assert (=> b!1044952 m!964553))

(declare-fun m!964555 () Bool)

(assert (=> b!1044952 m!964555))

(declare-fun m!964557 () Bool)

(assert (=> b!1044952 m!964557))

(declare-fun m!964559 () Bool)

(assert (=> b!1044952 m!964559))

(declare-fun m!964561 () Bool)

(assert (=> b!1044952 m!964561))

(declare-fun m!964563 () Bool)

(assert (=> b!1044952 m!964563))

(declare-fun m!964565 () Bool)

(assert (=> b!1044952 m!964565))

(declare-fun m!964567 () Bool)

(assert (=> b!1044952 m!964567))

(assert (=> b!1044952 m!964563))

(declare-fun m!964569 () Bool)

(assert (=> b!1044952 m!964569))

(assert (=> b!1044952 m!964545))

(declare-fun m!964571 () Bool)

(assert (=> b!1044952 m!964571))

(declare-fun m!964573 () Bool)

(assert (=> b!1044952 m!964573))

(declare-fun m!964575 () Bool)

(assert (=> b!1044952 m!964575))

(check-sat (not b_lambda!16265) (not mapNonEmpty!38909) b_and!33731 (not start!91854) (not b!1044953) (not b!1044951) (not b_next!21129) tp_is_empty!24849 (not b!1044952) (not b!1044958))
(check-sat b_and!33731 (not b_next!21129))
(get-model)

(declare-fun b_lambda!16269 () Bool)

(assert (= b_lambda!16265 (or (and b!1044953 b_free!21129) b_lambda!16269)))

(check-sat (not mapNonEmpty!38909) b_and!33731 (not b_lambda!16269) (not start!91854) (not b!1044953) (not b!1044951) (not b_next!21129) tp_is_empty!24849 (not b!1044952) (not b!1044958))
(check-sat b_and!33731 (not b_next!21129))
(get-model)

(declare-fun d!126459 () Bool)

(declare-fun e!592302 () Bool)

(assert (=> d!126459 e!592302))

(declare-fun res!695892 () Bool)

(assert (=> d!126459 (=> (not res!695892) (not e!592302))))

(assert (=> d!126459 (= res!695892 (and (bvsge (index!41748 lt!461127) #b00000000000000000000000000000000) (bvslt (index!41748 lt!461127) (size!32218 (_keys!11678 thiss!1427)))))))

(declare-fun lt!461165 () Unit!34125)

(declare-fun choose!25 (array!65870 (_ BitVec 32) (_ BitVec 32)) Unit!34125)

(assert (=> d!126459 (= lt!461165 (choose!25 (_keys!11678 thiss!1427) (index!41748 lt!461127) (mask!30529 thiss!1427)))))

(assert (=> d!126459 (validMask!0 (mask!30529 thiss!1427))))

(assert (=> d!126459 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11678 thiss!1427) (index!41748 lt!461127) (mask!30529 thiss!1427)) lt!461165)))

(declare-fun b!1044992 () Bool)

(assert (=> b!1044992 (= e!592302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65871 (store (arr!31683 (_keys!11678 thiss!1427)) (index!41748 lt!461127) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32218 (_keys!11678 thiss!1427))) (mask!30529 thiss!1427)))))

(assert (= (and d!126459 res!695892) b!1044992))

(declare-fun m!964625 () Bool)

(assert (=> d!126459 m!964625))

(declare-fun m!964627 () Bool)

(assert (=> d!126459 m!964627))

(assert (=> b!1044992 m!964573))

(declare-fun m!964629 () Bool)

(assert (=> b!1044992 m!964629))

(assert (=> b!1044952 d!126459))

(declare-fun d!126461 () Bool)

(declare-fun res!695897 () Bool)

(declare-fun e!592307 () Bool)

(assert (=> d!126461 (=> res!695897 e!592307)))

(assert (=> d!126461 (= res!695897 (= (select (arr!31683 lt!461135) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126461 (= (arrayContainsKey!0 lt!461135 key!909 #b00000000000000000000000000000000) e!592307)))

(declare-fun b!1044997 () Bool)

(declare-fun e!592308 () Bool)

(assert (=> b!1044997 (= e!592307 e!592308)))

(declare-fun res!695898 () Bool)

(assert (=> b!1044997 (=> (not res!695898) (not e!592308))))

(assert (=> b!1044997 (= res!695898 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32218 lt!461135)))))

(declare-fun b!1044998 () Bool)

(assert (=> b!1044998 (= e!592308 (arrayContainsKey!0 lt!461135 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126461 (not res!695897)) b!1044997))

(assert (= (and b!1044997 res!695898) b!1044998))

(declare-fun m!964631 () Bool)

(assert (=> d!126461 m!964631))

(declare-fun m!964633 () Bool)

(assert (=> b!1044998 m!964633))

(assert (=> b!1044952 d!126461))

(declare-fun b!1045009 () Bool)

(declare-fun e!592318 () Bool)

(declare-fun contains!6078 (List!22013 (_ BitVec 64)) Bool)

(assert (=> b!1045009 (= e!592318 (contains!6078 Nil!22010 (select (arr!31683 lt!461135) #b00000000000000000000000000000000)))))

(declare-fun b!1045010 () Bool)

(declare-fun e!592320 () Bool)

(declare-fun call!44436 () Bool)

(assert (=> b!1045010 (= e!592320 call!44436)))

(declare-fun b!1045011 () Bool)

(assert (=> b!1045011 (= e!592320 call!44436)))

(declare-fun d!126463 () Bool)

(declare-fun res!695905 () Bool)

(declare-fun e!592319 () Bool)

(assert (=> d!126463 (=> res!695905 e!592319)))

(assert (=> d!126463 (= res!695905 (bvsge #b00000000000000000000000000000000 (size!32218 lt!461135)))))

(assert (=> d!126463 (= (arrayNoDuplicates!0 lt!461135 #b00000000000000000000000000000000 Nil!22010) e!592319)))

(declare-fun bm!44433 () Bool)

(declare-fun c!106197 () Bool)

(assert (=> bm!44433 (= call!44436 (arrayNoDuplicates!0 lt!461135 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106197 (Cons!22009 (select (arr!31683 lt!461135) #b00000000000000000000000000000000) Nil!22010) Nil!22010)))))

(declare-fun b!1045012 () Bool)

(declare-fun e!592317 () Bool)

(assert (=> b!1045012 (= e!592319 e!592317)))

(declare-fun res!695906 () Bool)

(assert (=> b!1045012 (=> (not res!695906) (not e!592317))))

(assert (=> b!1045012 (= res!695906 (not e!592318))))

(declare-fun res!695907 () Bool)

(assert (=> b!1045012 (=> (not res!695907) (not e!592318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1045012 (= res!695907 (validKeyInArray!0 (select (arr!31683 lt!461135) #b00000000000000000000000000000000)))))

(declare-fun b!1045013 () Bool)

(assert (=> b!1045013 (= e!592317 e!592320)))

(assert (=> b!1045013 (= c!106197 (validKeyInArray!0 (select (arr!31683 lt!461135) #b00000000000000000000000000000000)))))

(assert (= (and d!126463 (not res!695905)) b!1045012))

(assert (= (and b!1045012 res!695907) b!1045009))

(assert (= (and b!1045012 res!695906) b!1045013))

(assert (= (and b!1045013 c!106197) b!1045010))

(assert (= (and b!1045013 (not c!106197)) b!1045011))

(assert (= (or b!1045010 b!1045011) bm!44433))

(assert (=> b!1045009 m!964631))

(assert (=> b!1045009 m!964631))

(declare-fun m!964635 () Bool)

(assert (=> b!1045009 m!964635))

(assert (=> bm!44433 m!964631))

(declare-fun m!964637 () Bool)

(assert (=> bm!44433 m!964637))

(assert (=> b!1045012 m!964631))

(assert (=> b!1045012 m!964631))

(declare-fun m!964639 () Bool)

(assert (=> b!1045012 m!964639))

(assert (=> b!1045013 m!964631))

(assert (=> b!1045013 m!964631))

(assert (=> b!1045013 m!964639))

(assert (=> b!1044952 d!126463))

(declare-fun b!1045056 () Bool)

(declare-fun e!592354 () Bool)

(declare-fun lt!461228 () ListLongMap!13787)

(declare-fun apply!913 (ListLongMap!13787 (_ BitVec 64)) V!38005)

(assert (=> b!1045056 (= e!592354 (= (apply!913 lt!461228 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6244 thiss!1427)))))

(declare-fun bm!44448 () Bool)

(declare-fun call!44452 () ListLongMap!13787)

(declare-fun call!44456 () ListLongMap!13787)

(assert (=> bm!44448 (= call!44452 call!44456)))

(declare-fun b!1045057 () Bool)

(declare-fun e!592351 () Bool)

(declare-fun e!592352 () Bool)

(assert (=> b!1045057 (= e!592351 e!592352)))

(declare-fun res!695928 () Bool)

(declare-fun call!44451 () Bool)

(assert (=> b!1045057 (= res!695928 call!44451)))

(assert (=> b!1045057 (=> (not res!695928) (not e!592352))))

(declare-fun b!1045058 () Bool)

(declare-fun e!592353 () Bool)

(assert (=> b!1045058 (= e!592353 (validKeyInArray!0 (select (arr!31683 (_keys!11678 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44449 () Bool)

(declare-fun call!44453 () ListLongMap!13787)

(declare-fun call!44454 () ListLongMap!13787)

(assert (=> bm!44449 (= call!44453 call!44454)))

(declare-fun bm!44450 () Bool)

(assert (=> bm!44450 (= call!44451 (contains!6076 lt!461228 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045060 () Bool)

(declare-fun e!592357 () Bool)

(assert (=> b!1045060 (= e!592357 e!592354)))

(declare-fun res!695933 () Bool)

(declare-fun call!44455 () Bool)

(assert (=> b!1045060 (= res!695933 call!44455)))

(assert (=> b!1045060 (=> (not res!695933) (not e!592354))))

(declare-fun c!106211 () Bool)

(declare-fun c!106214 () Bool)

(declare-fun call!44457 () ListLongMap!13787)

(declare-fun bm!44451 () Bool)

(declare-fun +!3111 (ListLongMap!13787 tuple2!15776) ListLongMap!13787)

(assert (=> bm!44451 (= call!44456 (+!3111 (ite c!106214 call!44454 (ite c!106211 call!44453 call!44457)) (ite (or c!106214 c!106211) (tuple2!15777 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6244 thiss!1427)) (tuple2!15777 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6244 thiss!1427)))))))

(declare-fun b!1045061 () Bool)

(declare-fun e!592347 () ListLongMap!13787)

(assert (=> b!1045061 (= e!592347 (+!3111 call!44456 (tuple2!15777 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6244 thiss!1427))))))

(declare-fun bm!44452 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3527 (array!65870 array!65872 (_ BitVec 32) (_ BitVec 32) V!38005 V!38005 (_ BitVec 32) Int) ListLongMap!13787)

(assert (=> bm!44452 (= call!44454 (getCurrentListMapNoExtraKeys!3527 (_keys!11678 thiss!1427) (_values!6433 thiss!1427) (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6410 thiss!1427)))))

(declare-fun bm!44453 () Bool)

(assert (=> bm!44453 (= call!44455 (contains!6076 lt!461228 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045062 () Bool)

(declare-fun e!592359 () ListLongMap!13787)

(assert (=> b!1045062 (= e!592359 call!44452)))

(declare-fun b!1045063 () Bool)

(declare-fun e!592350 () Unit!34125)

(declare-fun lt!461230 () Unit!34125)

(assert (=> b!1045063 (= e!592350 lt!461230)))

(declare-fun lt!461214 () ListLongMap!13787)

(assert (=> b!1045063 (= lt!461214 (getCurrentListMapNoExtraKeys!3527 (_keys!11678 thiss!1427) (_values!6433 thiss!1427) (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6410 thiss!1427)))))

(declare-fun lt!461215 () (_ BitVec 64))

(assert (=> b!1045063 (= lt!461215 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461212 () (_ BitVec 64))

(assert (=> b!1045063 (= lt!461212 (select (arr!31683 (_keys!11678 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461224 () Unit!34125)

(declare-fun addStillContains!632 (ListLongMap!13787 (_ BitVec 64) V!38005 (_ BitVec 64)) Unit!34125)

(assert (=> b!1045063 (= lt!461224 (addStillContains!632 lt!461214 lt!461215 (zeroValue!6244 thiss!1427) lt!461212))))

(assert (=> b!1045063 (contains!6076 (+!3111 lt!461214 (tuple2!15777 lt!461215 (zeroValue!6244 thiss!1427))) lt!461212)))

(declare-fun lt!461231 () Unit!34125)

(assert (=> b!1045063 (= lt!461231 lt!461224)))

(declare-fun lt!461211 () ListLongMap!13787)

(assert (=> b!1045063 (= lt!461211 (getCurrentListMapNoExtraKeys!3527 (_keys!11678 thiss!1427) (_values!6433 thiss!1427) (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6410 thiss!1427)))))

(declare-fun lt!461210 () (_ BitVec 64))

(assert (=> b!1045063 (= lt!461210 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461219 () (_ BitVec 64))

(assert (=> b!1045063 (= lt!461219 (select (arr!31683 (_keys!11678 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461218 () Unit!34125)

(declare-fun addApplyDifferent!492 (ListLongMap!13787 (_ BitVec 64) V!38005 (_ BitVec 64)) Unit!34125)

(assert (=> b!1045063 (= lt!461218 (addApplyDifferent!492 lt!461211 lt!461210 (minValue!6244 thiss!1427) lt!461219))))

(assert (=> b!1045063 (= (apply!913 (+!3111 lt!461211 (tuple2!15777 lt!461210 (minValue!6244 thiss!1427))) lt!461219) (apply!913 lt!461211 lt!461219))))

(declare-fun lt!461226 () Unit!34125)

(assert (=> b!1045063 (= lt!461226 lt!461218)))

(declare-fun lt!461227 () ListLongMap!13787)

(assert (=> b!1045063 (= lt!461227 (getCurrentListMapNoExtraKeys!3527 (_keys!11678 thiss!1427) (_values!6433 thiss!1427) (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6410 thiss!1427)))))

(declare-fun lt!461223 () (_ BitVec 64))

(assert (=> b!1045063 (= lt!461223 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461217 () (_ BitVec 64))

(assert (=> b!1045063 (= lt!461217 (select (arr!31683 (_keys!11678 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461220 () Unit!34125)

(assert (=> b!1045063 (= lt!461220 (addApplyDifferent!492 lt!461227 lt!461223 (zeroValue!6244 thiss!1427) lt!461217))))

(assert (=> b!1045063 (= (apply!913 (+!3111 lt!461227 (tuple2!15777 lt!461223 (zeroValue!6244 thiss!1427))) lt!461217) (apply!913 lt!461227 lt!461217))))

(declare-fun lt!461229 () Unit!34125)

(assert (=> b!1045063 (= lt!461229 lt!461220)))

(declare-fun lt!461222 () ListLongMap!13787)

(assert (=> b!1045063 (= lt!461222 (getCurrentListMapNoExtraKeys!3527 (_keys!11678 thiss!1427) (_values!6433 thiss!1427) (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6410 thiss!1427)))))

(declare-fun lt!461221 () (_ BitVec 64))

(assert (=> b!1045063 (= lt!461221 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461225 () (_ BitVec 64))

(assert (=> b!1045063 (= lt!461225 (select (arr!31683 (_keys!11678 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045063 (= lt!461230 (addApplyDifferent!492 lt!461222 lt!461221 (minValue!6244 thiss!1427) lt!461225))))

(assert (=> b!1045063 (= (apply!913 (+!3111 lt!461222 (tuple2!15777 lt!461221 (minValue!6244 thiss!1427))) lt!461225) (apply!913 lt!461222 lt!461225))))

(declare-fun b!1045064 () Bool)

(assert (=> b!1045064 (= e!592357 (not call!44455))))

(declare-fun b!1045065 () Bool)

(declare-fun e!592348 () Bool)

(declare-fun get!16556 (ValueCell!11721 V!38005) V!38005)

(assert (=> b!1045065 (= e!592348 (= (apply!913 lt!461228 (select (arr!31683 (_keys!11678 thiss!1427)) #b00000000000000000000000000000000)) (get!16556 (select (arr!31684 (_values!6433 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2006 (defaultEntry!6410 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32219 (_values!6433 thiss!1427))))))

(assert (=> b!1045065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32218 (_keys!11678 thiss!1427))))))

(declare-fun b!1045066 () Bool)

(declare-fun e!592349 () ListLongMap!13787)

(assert (=> b!1045066 (= e!592349 call!44452)))

(declare-fun d!126465 () Bool)

(declare-fun e!592356 () Bool)

(assert (=> d!126465 e!592356))

(declare-fun res!695929 () Bool)

(assert (=> d!126465 (=> (not res!695929) (not e!592356))))

(assert (=> d!126465 (= res!695929 (or (bvsge #b00000000000000000000000000000000 (size!32218 (_keys!11678 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32218 (_keys!11678 thiss!1427))))))))

(declare-fun lt!461216 () ListLongMap!13787)

(assert (=> d!126465 (= lt!461228 lt!461216)))

(declare-fun lt!461213 () Unit!34125)

(assert (=> d!126465 (= lt!461213 e!592350)))

(declare-fun c!106215 () Bool)

(assert (=> d!126465 (= c!106215 e!592353)))

(declare-fun res!695927 () Bool)

(assert (=> d!126465 (=> (not res!695927) (not e!592353))))

(assert (=> d!126465 (= res!695927 (bvslt #b00000000000000000000000000000000 (size!32218 (_keys!11678 thiss!1427))))))

(assert (=> d!126465 (= lt!461216 e!592347)))

(assert (=> d!126465 (= c!106214 (and (not (= (bvand (extraKeys!6138 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6138 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126465 (validMask!0 (mask!30529 thiss!1427))))

(assert (=> d!126465 (= (getCurrentListMap!3957 (_keys!11678 thiss!1427) (_values!6433 thiss!1427) (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6410 thiss!1427)) lt!461228)))

(declare-fun b!1045059 () Bool)

(declare-fun Unit!34133 () Unit!34125)

(assert (=> b!1045059 (= e!592350 Unit!34133)))

(declare-fun b!1045067 () Bool)

(declare-fun e!592358 () Bool)

(assert (=> b!1045067 (= e!592358 (validKeyInArray!0 (select (arr!31683 (_keys!11678 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1045068 () Bool)

(declare-fun c!106213 () Bool)

(assert (=> b!1045068 (= c!106213 (and (not (= (bvand (extraKeys!6138 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6138 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1045068 (= e!592359 e!592349)))

(declare-fun b!1045069 () Bool)

(assert (=> b!1045069 (= e!592356 e!592357)))

(declare-fun c!106210 () Bool)

(assert (=> b!1045069 (= c!106210 (not (= (bvand (extraKeys!6138 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045070 () Bool)

(declare-fun e!592355 () Bool)

(assert (=> b!1045070 (= e!592355 e!592348)))

(declare-fun res!695934 () Bool)

(assert (=> b!1045070 (=> (not res!695934) (not e!592348))))

(assert (=> b!1045070 (= res!695934 (contains!6076 lt!461228 (select (arr!31683 (_keys!11678 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1045070 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32218 (_keys!11678 thiss!1427))))))

(declare-fun b!1045071 () Bool)

(assert (=> b!1045071 (= e!592347 e!592359)))

(assert (=> b!1045071 (= c!106211 (and (not (= (bvand (extraKeys!6138 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6138 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44454 () Bool)

(assert (=> bm!44454 (= call!44457 call!44453)))

(declare-fun b!1045072 () Bool)

(assert (=> b!1045072 (= e!592352 (= (apply!913 lt!461228 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6244 thiss!1427)))))

(declare-fun b!1045073 () Bool)

(declare-fun res!695931 () Bool)

(assert (=> b!1045073 (=> (not res!695931) (not e!592356))))

(assert (=> b!1045073 (= res!695931 e!592351)))

(declare-fun c!106212 () Bool)

(assert (=> b!1045073 (= c!106212 (not (= (bvand (extraKeys!6138 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1045074 () Bool)

(declare-fun res!695930 () Bool)

(assert (=> b!1045074 (=> (not res!695930) (not e!592356))))

(assert (=> b!1045074 (= res!695930 e!592355)))

(declare-fun res!695932 () Bool)

(assert (=> b!1045074 (=> res!695932 e!592355)))

(assert (=> b!1045074 (= res!695932 (not e!592358))))

(declare-fun res!695926 () Bool)

(assert (=> b!1045074 (=> (not res!695926) (not e!592358))))

(assert (=> b!1045074 (= res!695926 (bvslt #b00000000000000000000000000000000 (size!32218 (_keys!11678 thiss!1427))))))

(declare-fun b!1045075 () Bool)

(assert (=> b!1045075 (= e!592351 (not call!44451))))

(declare-fun b!1045076 () Bool)

(assert (=> b!1045076 (= e!592349 call!44457)))

(assert (= (and d!126465 c!106214) b!1045061))

(assert (= (and d!126465 (not c!106214)) b!1045071))

(assert (= (and b!1045071 c!106211) b!1045062))

(assert (= (and b!1045071 (not c!106211)) b!1045068))

(assert (= (and b!1045068 c!106213) b!1045066))

(assert (= (and b!1045068 (not c!106213)) b!1045076))

(assert (= (or b!1045066 b!1045076) bm!44454))

(assert (= (or b!1045062 bm!44454) bm!44449))

(assert (= (or b!1045062 b!1045066) bm!44448))

(assert (= (or b!1045061 bm!44449) bm!44452))

(assert (= (or b!1045061 bm!44448) bm!44451))

(assert (= (and d!126465 res!695927) b!1045058))

(assert (= (and d!126465 c!106215) b!1045063))

(assert (= (and d!126465 (not c!106215)) b!1045059))

(assert (= (and d!126465 res!695929) b!1045074))

(assert (= (and b!1045074 res!695926) b!1045067))

(assert (= (and b!1045074 (not res!695932)) b!1045070))

(assert (= (and b!1045070 res!695934) b!1045065))

(assert (= (and b!1045074 res!695930) b!1045073))

(assert (= (and b!1045073 c!106212) b!1045057))

(assert (= (and b!1045073 (not c!106212)) b!1045075))

(assert (= (and b!1045057 res!695928) b!1045072))

(assert (= (or b!1045057 b!1045075) bm!44450))

(assert (= (and b!1045073 res!695931) b!1045069))

(assert (= (and b!1045069 c!106210) b!1045060))

(assert (= (and b!1045069 (not c!106210)) b!1045064))

(assert (= (and b!1045060 res!695933) b!1045056))

(assert (= (or b!1045060 b!1045064) bm!44453))

(declare-fun b_lambda!16271 () Bool)

(assert (=> (not b_lambda!16271) (not b!1045065)))

(assert (=> b!1045065 t!31265))

(declare-fun b_and!33737 () Bool)

(assert (= b_and!33731 (and (=> t!31265 result!14575) b_and!33737)))

(declare-fun m!964641 () Bool)

(assert (=> b!1045061 m!964641))

(declare-fun m!964643 () Bool)

(assert (=> b!1045065 m!964643))

(assert (=> b!1045065 m!964569))

(declare-fun m!964645 () Bool)

(assert (=> b!1045065 m!964645))

(assert (=> b!1045065 m!964569))

(declare-fun m!964647 () Bool)

(assert (=> b!1045065 m!964647))

(assert (=> b!1045065 m!964643))

(assert (=> b!1045065 m!964647))

(declare-fun m!964649 () Bool)

(assert (=> b!1045065 m!964649))

(assert (=> d!126465 m!964627))

(declare-fun m!964651 () Bool)

(assert (=> bm!44453 m!964651))

(declare-fun m!964653 () Bool)

(assert (=> b!1045063 m!964653))

(declare-fun m!964655 () Bool)

(assert (=> b!1045063 m!964655))

(declare-fun m!964657 () Bool)

(assert (=> b!1045063 m!964657))

(declare-fun m!964659 () Bool)

(assert (=> b!1045063 m!964659))

(declare-fun m!964661 () Bool)

(assert (=> b!1045063 m!964661))

(declare-fun m!964663 () Bool)

(assert (=> b!1045063 m!964663))

(declare-fun m!964665 () Bool)

(assert (=> b!1045063 m!964665))

(assert (=> b!1045063 m!964663))

(declare-fun m!964667 () Bool)

(assert (=> b!1045063 m!964667))

(declare-fun m!964669 () Bool)

(assert (=> b!1045063 m!964669))

(declare-fun m!964671 () Bool)

(assert (=> b!1045063 m!964671))

(declare-fun m!964673 () Bool)

(assert (=> b!1045063 m!964673))

(assert (=> b!1045063 m!964671))

(declare-fun m!964675 () Bool)

(assert (=> b!1045063 m!964675))

(assert (=> b!1045063 m!964647))

(assert (=> b!1045063 m!964669))

(declare-fun m!964677 () Bool)

(assert (=> b!1045063 m!964677))

(assert (=> b!1045063 m!964653))

(declare-fun m!964679 () Bool)

(assert (=> b!1045063 m!964679))

(declare-fun m!964681 () Bool)

(assert (=> b!1045063 m!964681))

(declare-fun m!964683 () Bool)

(assert (=> b!1045063 m!964683))

(declare-fun m!964685 () Bool)

(assert (=> b!1045072 m!964685))

(assert (=> bm!44452 m!964681))

(assert (=> b!1045070 m!964647))

(assert (=> b!1045070 m!964647))

(declare-fun m!964687 () Bool)

(assert (=> b!1045070 m!964687))

(declare-fun m!964689 () Bool)

(assert (=> bm!44450 m!964689))

(declare-fun m!964691 () Bool)

(assert (=> bm!44451 m!964691))

(declare-fun m!964693 () Bool)

(assert (=> b!1045056 m!964693))

(assert (=> b!1045067 m!964647))

(assert (=> b!1045067 m!964647))

(declare-fun m!964695 () Bool)

(assert (=> b!1045067 m!964695))

(assert (=> b!1045058 m!964647))

(assert (=> b!1045058 m!964647))

(assert (=> b!1045058 m!964695))

(assert (=> b!1044952 d!126465))

(declare-fun d!126467 () Bool)

(declare-fun lt!461234 () ListLongMap!13787)

(assert (=> d!126467 (not (contains!6076 lt!461234 key!909))))

(declare-fun removeStrictlySorted!63 (List!22012 (_ BitVec 64)) List!22012)

(assert (=> d!126467 (= lt!461234 (ListLongMap!13788 (removeStrictlySorted!63 (toList!6909 (getCurrentListMap!3957 (_keys!11678 thiss!1427) (_values!6433 thiss!1427) (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6410 thiss!1427))) key!909)))))

(assert (=> d!126467 (= (-!536 (getCurrentListMap!3957 (_keys!11678 thiss!1427) (_values!6433 thiss!1427) (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6410 thiss!1427)) key!909) lt!461234)))

(declare-fun bs!30523 () Bool)

(assert (= bs!30523 d!126467))

(declare-fun m!964697 () Bool)

(assert (=> bs!30523 m!964697))

(declare-fun m!964699 () Bool)

(assert (=> bs!30523 m!964699))

(assert (=> b!1044952 d!126467))

(declare-fun bm!44457 () Bool)

(declare-fun call!44460 () (_ BitVec 32))

(assert (=> bm!44457 (= call!44460 (arrayCountValidKeys!0 lt!461135 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32218 (_keys!11678 thiss!1427))))))

(declare-fun b!1045085 () Bool)

(declare-fun e!592364 () (_ BitVec 32))

(assert (=> b!1045085 (= e!592364 call!44460)))

(declare-fun b!1045086 () Bool)

(declare-fun e!592365 () (_ BitVec 32))

(assert (=> b!1045086 (= e!592365 #b00000000000000000000000000000000)))

(declare-fun b!1045087 () Bool)

(assert (=> b!1045087 (= e!592365 e!592364)))

(declare-fun c!106220 () Bool)

(assert (=> b!1045087 (= c!106220 (validKeyInArray!0 (select (arr!31683 lt!461135) #b00000000000000000000000000000000)))))

(declare-fun b!1045088 () Bool)

(assert (=> b!1045088 (= e!592364 (bvadd #b00000000000000000000000000000001 call!44460))))

(declare-fun d!126469 () Bool)

(declare-fun lt!461237 () (_ BitVec 32))

(assert (=> d!126469 (and (bvsge lt!461237 #b00000000000000000000000000000000) (bvsle lt!461237 (bvsub (size!32218 lt!461135) #b00000000000000000000000000000000)))))

(assert (=> d!126469 (= lt!461237 e!592365)))

(declare-fun c!106221 () Bool)

(assert (=> d!126469 (= c!106221 (bvsge #b00000000000000000000000000000000 (size!32218 (_keys!11678 thiss!1427))))))

(assert (=> d!126469 (and (bvsle #b00000000000000000000000000000000 (size!32218 (_keys!11678 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32218 (_keys!11678 thiss!1427)) (size!32218 lt!461135)))))

(assert (=> d!126469 (= (arrayCountValidKeys!0 lt!461135 #b00000000000000000000000000000000 (size!32218 (_keys!11678 thiss!1427))) lt!461237)))

(assert (= (and d!126469 c!106221) b!1045086))

(assert (= (and d!126469 (not c!106221)) b!1045087))

(assert (= (and b!1045087 c!106220) b!1045088))

(assert (= (and b!1045087 (not c!106220)) b!1045085))

(assert (= (or b!1045088 b!1045085) bm!44457))

(declare-fun m!964701 () Bool)

(assert (=> bm!44457 m!964701))

(assert (=> b!1045087 m!964631))

(assert (=> b!1045087 m!964631))

(assert (=> b!1045087 m!964639))

(assert (=> b!1044952 d!126469))

(declare-fun d!126471 () Bool)

(declare-fun e!592370 () Bool)

(assert (=> d!126471 e!592370))

(declare-fun res!695937 () Bool)

(assert (=> d!126471 (=> res!695937 e!592370)))

(declare-fun lt!461249 () Bool)

(assert (=> d!126471 (= res!695937 (not lt!461249))))

(declare-fun lt!461247 () Bool)

(assert (=> d!126471 (= lt!461249 lt!461247)))

(declare-fun lt!461248 () Unit!34125)

(declare-fun e!592371 () Unit!34125)

(assert (=> d!126471 (= lt!461248 e!592371)))

(declare-fun c!106224 () Bool)

(assert (=> d!126471 (= c!106224 lt!461247)))

(declare-fun containsKey!568 (List!22012 (_ BitVec 64)) Bool)

(assert (=> d!126471 (= lt!461247 (containsKey!568 (toList!6909 (getCurrentListMap!3957 (_keys!11678 (_2!7898 lt!461132)) (_values!6433 (_2!7898 lt!461132)) (mask!30529 (_2!7898 lt!461132)) (extraKeys!6138 (_2!7898 lt!461132)) (zeroValue!6244 (_2!7898 lt!461132)) (minValue!6244 (_2!7898 lt!461132)) #b00000000000000000000000000000000 (defaultEntry!6410 (_2!7898 lt!461132)))) key!909))))

(assert (=> d!126471 (= (contains!6076 (getCurrentListMap!3957 (_keys!11678 (_2!7898 lt!461132)) (_values!6433 (_2!7898 lt!461132)) (mask!30529 (_2!7898 lt!461132)) (extraKeys!6138 (_2!7898 lt!461132)) (zeroValue!6244 (_2!7898 lt!461132)) (minValue!6244 (_2!7898 lt!461132)) #b00000000000000000000000000000000 (defaultEntry!6410 (_2!7898 lt!461132))) key!909) lt!461249)))

(declare-fun b!1045095 () Bool)

(declare-fun lt!461246 () Unit!34125)

(assert (=> b!1045095 (= e!592371 lt!461246)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!401 (List!22012 (_ BitVec 64)) Unit!34125)

(assert (=> b!1045095 (= lt!461246 (lemmaContainsKeyImpliesGetValueByKeyDefined!401 (toList!6909 (getCurrentListMap!3957 (_keys!11678 (_2!7898 lt!461132)) (_values!6433 (_2!7898 lt!461132)) (mask!30529 (_2!7898 lt!461132)) (extraKeys!6138 (_2!7898 lt!461132)) (zeroValue!6244 (_2!7898 lt!461132)) (minValue!6244 (_2!7898 lt!461132)) #b00000000000000000000000000000000 (defaultEntry!6410 (_2!7898 lt!461132)))) key!909))))

(declare-datatypes ((Option!644 0))(
  ( (Some!643 (v!15071 V!38005)) (None!642) )
))
(declare-fun isDefined!440 (Option!644) Bool)

(declare-fun getValueByKey!593 (List!22012 (_ BitVec 64)) Option!644)

(assert (=> b!1045095 (isDefined!440 (getValueByKey!593 (toList!6909 (getCurrentListMap!3957 (_keys!11678 (_2!7898 lt!461132)) (_values!6433 (_2!7898 lt!461132)) (mask!30529 (_2!7898 lt!461132)) (extraKeys!6138 (_2!7898 lt!461132)) (zeroValue!6244 (_2!7898 lt!461132)) (minValue!6244 (_2!7898 lt!461132)) #b00000000000000000000000000000000 (defaultEntry!6410 (_2!7898 lt!461132)))) key!909))))

(declare-fun b!1045096 () Bool)

(declare-fun Unit!34134 () Unit!34125)

(assert (=> b!1045096 (= e!592371 Unit!34134)))

(declare-fun b!1045097 () Bool)

(assert (=> b!1045097 (= e!592370 (isDefined!440 (getValueByKey!593 (toList!6909 (getCurrentListMap!3957 (_keys!11678 (_2!7898 lt!461132)) (_values!6433 (_2!7898 lt!461132)) (mask!30529 (_2!7898 lt!461132)) (extraKeys!6138 (_2!7898 lt!461132)) (zeroValue!6244 (_2!7898 lt!461132)) (minValue!6244 (_2!7898 lt!461132)) #b00000000000000000000000000000000 (defaultEntry!6410 (_2!7898 lt!461132)))) key!909)))))

(assert (= (and d!126471 c!106224) b!1045095))

(assert (= (and d!126471 (not c!106224)) b!1045096))

(assert (= (and d!126471 (not res!695937)) b!1045097))

(declare-fun m!964703 () Bool)

(assert (=> d!126471 m!964703))

(declare-fun m!964705 () Bool)

(assert (=> b!1045095 m!964705))

(declare-fun m!964707 () Bool)

(assert (=> b!1045095 m!964707))

(assert (=> b!1045095 m!964707))

(declare-fun m!964709 () Bool)

(assert (=> b!1045095 m!964709))

(assert (=> b!1045097 m!964707))

(assert (=> b!1045097 m!964707))

(assert (=> b!1045097 m!964709))

(assert (=> b!1044952 d!126471))

(declare-fun d!126473 () Bool)

(declare-fun e!592374 () Bool)

(assert (=> d!126473 e!592374))

(declare-fun res!695940 () Bool)

(assert (=> d!126473 (=> (not res!695940) (not e!592374))))

(assert (=> d!126473 (= res!695940 (and (bvsge (index!41748 lt!461127) #b00000000000000000000000000000000) (bvslt (index!41748 lt!461127) (size!32218 (_keys!11678 thiss!1427)))))))

(declare-fun lt!461252 () Unit!34125)

(declare-fun choose!53 (array!65870 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22013) Unit!34125)

(assert (=> d!126473 (= lt!461252 (choose!53 (_keys!11678 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41748 lt!461127) #b00000000000000000000000000000000 Nil!22010))))

(assert (=> d!126473 (bvslt (size!32218 (_keys!11678 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126473 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11678 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41748 lt!461127) #b00000000000000000000000000000000 Nil!22010) lt!461252)))

(declare-fun b!1045100 () Bool)

(assert (=> b!1045100 (= e!592374 (arrayNoDuplicates!0 (array!65871 (store (arr!31683 (_keys!11678 thiss!1427)) (index!41748 lt!461127) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32218 (_keys!11678 thiss!1427))) #b00000000000000000000000000000000 Nil!22010))))

(assert (= (and d!126473 res!695940) b!1045100))

(declare-fun m!964711 () Bool)

(assert (=> d!126473 m!964711))

(assert (=> b!1045100 m!964573))

(declare-fun m!964713 () Bool)

(assert (=> b!1045100 m!964713))

(assert (=> b!1044952 d!126473))

(declare-fun b!1045109 () Bool)

(declare-fun e!592383 () Bool)

(declare-fun e!592381 () Bool)

(assert (=> b!1045109 (= e!592383 e!592381)))

(declare-fun c!106227 () Bool)

(assert (=> b!1045109 (= c!106227 (validKeyInArray!0 (select (arr!31683 lt!461135) #b00000000000000000000000000000000)))))

(declare-fun d!126475 () Bool)

(declare-fun res!695945 () Bool)

(assert (=> d!126475 (=> res!695945 e!592383)))

(assert (=> d!126475 (= res!695945 (bvsge #b00000000000000000000000000000000 (size!32218 lt!461135)))))

(assert (=> d!126475 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461135 (mask!30529 thiss!1427)) e!592383)))

(declare-fun bm!44460 () Bool)

(declare-fun call!44463 () Bool)

(assert (=> bm!44460 (= call!44463 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!461135 (mask!30529 thiss!1427)))))

(declare-fun b!1045110 () Bool)

(declare-fun e!592382 () Bool)

(assert (=> b!1045110 (= e!592382 call!44463)))

(declare-fun b!1045111 () Bool)

(assert (=> b!1045111 (= e!592381 e!592382)))

(declare-fun lt!461259 () (_ BitVec 64))

(assert (=> b!1045111 (= lt!461259 (select (arr!31683 lt!461135) #b00000000000000000000000000000000))))

(declare-fun lt!461260 () Unit!34125)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65870 (_ BitVec 64) (_ BitVec 32)) Unit!34125)

(assert (=> b!1045111 (= lt!461260 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!461135 lt!461259 #b00000000000000000000000000000000))))

(assert (=> b!1045111 (arrayContainsKey!0 lt!461135 lt!461259 #b00000000000000000000000000000000)))

(declare-fun lt!461261 () Unit!34125)

(assert (=> b!1045111 (= lt!461261 lt!461260)))

(declare-fun res!695946 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65870 (_ BitVec 32)) SeekEntryResult!9844)

(assert (=> b!1045111 (= res!695946 (= (seekEntryOrOpen!0 (select (arr!31683 lt!461135) #b00000000000000000000000000000000) lt!461135 (mask!30529 thiss!1427)) (Found!9844 #b00000000000000000000000000000000)))))

(assert (=> b!1045111 (=> (not res!695946) (not e!592382))))

(declare-fun b!1045112 () Bool)

(assert (=> b!1045112 (= e!592381 call!44463)))

(assert (= (and d!126475 (not res!695945)) b!1045109))

(assert (= (and b!1045109 c!106227) b!1045111))

(assert (= (and b!1045109 (not c!106227)) b!1045112))

(assert (= (and b!1045111 res!695946) b!1045110))

(assert (= (or b!1045110 b!1045112) bm!44460))

(assert (=> b!1045109 m!964631))

(assert (=> b!1045109 m!964631))

(assert (=> b!1045109 m!964639))

(declare-fun m!964715 () Bool)

(assert (=> bm!44460 m!964715))

(assert (=> b!1045111 m!964631))

(declare-fun m!964717 () Bool)

(assert (=> b!1045111 m!964717))

(declare-fun m!964719 () Bool)

(assert (=> b!1045111 m!964719))

(assert (=> b!1045111 m!964631))

(declare-fun m!964721 () Bool)

(assert (=> b!1045111 m!964721))

(assert (=> b!1044952 d!126475))

(declare-fun d!126477 () Bool)

(declare-fun e!592386 () Bool)

(assert (=> d!126477 e!592386))

(declare-fun res!695949 () Bool)

(assert (=> d!126477 (=> (not res!695949) (not e!592386))))

(assert (=> d!126477 (= res!695949 (bvslt (index!41748 lt!461127) (size!32218 (_keys!11678 thiss!1427))))))

(declare-fun lt!461264 () Unit!34125)

(declare-fun choose!121 (array!65870 (_ BitVec 32) (_ BitVec 64)) Unit!34125)

(assert (=> d!126477 (= lt!461264 (choose!121 (_keys!11678 thiss!1427) (index!41748 lt!461127) key!909))))

(assert (=> d!126477 (bvsge (index!41748 lt!461127) #b00000000000000000000000000000000)))

(assert (=> d!126477 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11678 thiss!1427) (index!41748 lt!461127) key!909) lt!461264)))

(declare-fun b!1045115 () Bool)

(assert (=> b!1045115 (= e!592386 (not (arrayContainsKey!0 (array!65871 (store (arr!31683 (_keys!11678 thiss!1427)) (index!41748 lt!461127) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32218 (_keys!11678 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126477 res!695949) b!1045115))

(declare-fun m!964723 () Bool)

(assert (=> d!126477 m!964723))

(assert (=> b!1045115 m!964573))

(declare-fun m!964725 () Bool)

(assert (=> b!1045115 m!964725))

(assert (=> b!1044952 d!126477))

(declare-fun bm!44461 () Bool)

(declare-fun call!44464 () (_ BitVec 32))

(assert (=> bm!44461 (= call!44464 (arrayCountValidKeys!0 (_keys!11678 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32218 (_keys!11678 thiss!1427))))))

(declare-fun b!1045116 () Bool)

(declare-fun e!592387 () (_ BitVec 32))

(assert (=> b!1045116 (= e!592387 call!44464)))

(declare-fun b!1045117 () Bool)

(declare-fun e!592388 () (_ BitVec 32))

(assert (=> b!1045117 (= e!592388 #b00000000000000000000000000000000)))

(declare-fun b!1045118 () Bool)

(assert (=> b!1045118 (= e!592388 e!592387)))

(declare-fun c!106228 () Bool)

(assert (=> b!1045118 (= c!106228 (validKeyInArray!0 (select (arr!31683 (_keys!11678 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1045119 () Bool)

(assert (=> b!1045119 (= e!592387 (bvadd #b00000000000000000000000000000001 call!44464))))

(declare-fun d!126479 () Bool)

(declare-fun lt!461265 () (_ BitVec 32))

(assert (=> d!126479 (and (bvsge lt!461265 #b00000000000000000000000000000000) (bvsle lt!461265 (bvsub (size!32218 (_keys!11678 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126479 (= lt!461265 e!592388)))

(declare-fun c!106229 () Bool)

(assert (=> d!126479 (= c!106229 (bvsge #b00000000000000000000000000000000 (size!32218 (_keys!11678 thiss!1427))))))

(assert (=> d!126479 (and (bvsle #b00000000000000000000000000000000 (size!32218 (_keys!11678 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32218 (_keys!11678 thiss!1427)) (size!32218 (_keys!11678 thiss!1427))))))

(assert (=> d!126479 (= (arrayCountValidKeys!0 (_keys!11678 thiss!1427) #b00000000000000000000000000000000 (size!32218 (_keys!11678 thiss!1427))) lt!461265)))

(assert (= (and d!126479 c!106229) b!1045117))

(assert (= (and d!126479 (not c!106229)) b!1045118))

(assert (= (and b!1045118 c!106228) b!1045119))

(assert (= (and b!1045118 (not c!106228)) b!1045116))

(assert (= (or b!1045119 b!1045116) bm!44461))

(declare-fun m!964727 () Bool)

(assert (=> bm!44461 m!964727))

(assert (=> b!1045118 m!964647))

(assert (=> b!1045118 m!964647))

(assert (=> b!1045118 m!964695))

(assert (=> b!1044952 d!126479))

(declare-fun d!126481 () Bool)

(declare-fun e!592391 () Bool)

(assert (=> d!126481 e!592391))

(declare-fun res!695952 () Bool)

(assert (=> d!126481 (=> (not res!695952) (not e!592391))))

(assert (=> d!126481 (= res!695952 (and (bvsge (index!41748 lt!461127) #b00000000000000000000000000000000) (bvslt (index!41748 lt!461127) (size!32218 (_keys!11678 thiss!1427)))))))

(declare-fun lt!461268 () Unit!34125)

(declare-fun choose!1713 (array!65870 array!65872 (_ BitVec 32) (_ BitVec 32) V!38005 V!38005 (_ BitVec 32) (_ BitVec 64) Int) Unit!34125)

(assert (=> d!126481 (= lt!461268 (choose!1713 (_keys!11678 thiss!1427) (_values!6433 thiss!1427) (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) (index!41748 lt!461127) key!909 (defaultEntry!6410 thiss!1427)))))

(assert (=> d!126481 (validMask!0 (mask!30529 thiss!1427))))

(assert (=> d!126481 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!57 (_keys!11678 thiss!1427) (_values!6433 thiss!1427) (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) (index!41748 lt!461127) key!909 (defaultEntry!6410 thiss!1427)) lt!461268)))

(declare-fun b!1045122 () Bool)

(assert (=> b!1045122 (= e!592391 (= (-!536 (getCurrentListMap!3957 (_keys!11678 thiss!1427) (_values!6433 thiss!1427) (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6410 thiss!1427)) key!909) (getCurrentListMap!3957 (array!65871 (store (arr!31683 (_keys!11678 thiss!1427)) (index!41748 lt!461127) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32218 (_keys!11678 thiss!1427))) (array!65873 (store (arr!31684 (_values!6433 thiss!1427)) (index!41748 lt!461127) (ValueCellFull!11721 (dynLambda!2006 (defaultEntry!6410 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32219 (_values!6433 thiss!1427))) (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6410 thiss!1427))))))

(assert (=> b!1045122 (bvslt (index!41748 lt!461127) (size!32219 (_values!6433 thiss!1427)))))

(assert (= (and d!126481 res!695952) b!1045122))

(declare-fun b_lambda!16273 () Bool)

(assert (=> (not b_lambda!16273) (not b!1045122)))

(assert (=> b!1045122 t!31265))

(declare-fun b_and!33739 () Bool)

(assert (= b_and!33737 (and (=> t!31265 result!14575) b_and!33739)))

(declare-fun m!964729 () Bool)

(assert (=> d!126481 m!964729))

(assert (=> d!126481 m!964627))

(assert (=> b!1045122 m!964569))

(assert (=> b!1045122 m!964563))

(assert (=> b!1045122 m!964565))

(assert (=> b!1045122 m!964561))

(assert (=> b!1045122 m!964573))

(assert (=> b!1045122 m!964563))

(declare-fun m!964731 () Bool)

(assert (=> b!1045122 m!964731))

(assert (=> b!1044952 d!126481))

(declare-fun b!1045123 () Bool)

(declare-fun e!592399 () Bool)

(declare-fun lt!461287 () ListLongMap!13787)

(assert (=> b!1045123 (= e!592399 (= (apply!913 lt!461287 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6244 (_2!7898 lt!461132))))))

(declare-fun bm!44462 () Bool)

(declare-fun call!44466 () ListLongMap!13787)

(declare-fun call!44470 () ListLongMap!13787)

(assert (=> bm!44462 (= call!44466 call!44470)))

(declare-fun b!1045124 () Bool)

(declare-fun e!592396 () Bool)

(declare-fun e!592397 () Bool)

(assert (=> b!1045124 (= e!592396 e!592397)))

(declare-fun res!695955 () Bool)

(declare-fun call!44465 () Bool)

(assert (=> b!1045124 (= res!695955 call!44465)))

(assert (=> b!1045124 (=> (not res!695955) (not e!592397))))

(declare-fun b!1045125 () Bool)

(declare-fun e!592398 () Bool)

(assert (=> b!1045125 (= e!592398 (validKeyInArray!0 (select (arr!31683 (_keys!11678 (_2!7898 lt!461132))) #b00000000000000000000000000000000)))))

(declare-fun bm!44463 () Bool)

(declare-fun call!44467 () ListLongMap!13787)

(declare-fun call!44468 () ListLongMap!13787)

(assert (=> bm!44463 (= call!44467 call!44468)))

(declare-fun bm!44464 () Bool)

(assert (=> bm!44464 (= call!44465 (contains!6076 lt!461287 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045127 () Bool)

(declare-fun e!592402 () Bool)

(assert (=> b!1045127 (= e!592402 e!592399)))

(declare-fun res!695960 () Bool)

(declare-fun call!44469 () Bool)

(assert (=> b!1045127 (= res!695960 call!44469)))

(assert (=> b!1045127 (=> (not res!695960) (not e!592399))))

(declare-fun call!44471 () ListLongMap!13787)

(declare-fun c!106234 () Bool)

(declare-fun c!106231 () Bool)

(declare-fun bm!44465 () Bool)

(assert (=> bm!44465 (= call!44470 (+!3111 (ite c!106234 call!44468 (ite c!106231 call!44467 call!44471)) (ite (or c!106234 c!106231) (tuple2!15777 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6244 (_2!7898 lt!461132))) (tuple2!15777 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6244 (_2!7898 lt!461132))))))))

(declare-fun b!1045128 () Bool)

(declare-fun e!592392 () ListLongMap!13787)

(assert (=> b!1045128 (= e!592392 (+!3111 call!44470 (tuple2!15777 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6244 (_2!7898 lt!461132)))))))

(declare-fun bm!44466 () Bool)

(assert (=> bm!44466 (= call!44468 (getCurrentListMapNoExtraKeys!3527 (_keys!11678 (_2!7898 lt!461132)) (_values!6433 (_2!7898 lt!461132)) (mask!30529 (_2!7898 lt!461132)) (extraKeys!6138 (_2!7898 lt!461132)) (zeroValue!6244 (_2!7898 lt!461132)) (minValue!6244 (_2!7898 lt!461132)) #b00000000000000000000000000000000 (defaultEntry!6410 (_2!7898 lt!461132))))))

(declare-fun bm!44467 () Bool)

(assert (=> bm!44467 (= call!44469 (contains!6076 lt!461287 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045129 () Bool)

(declare-fun e!592404 () ListLongMap!13787)

(assert (=> b!1045129 (= e!592404 call!44466)))

(declare-fun b!1045130 () Bool)

(declare-fun e!592395 () Unit!34125)

(declare-fun lt!461289 () Unit!34125)

(assert (=> b!1045130 (= e!592395 lt!461289)))

(declare-fun lt!461273 () ListLongMap!13787)

(assert (=> b!1045130 (= lt!461273 (getCurrentListMapNoExtraKeys!3527 (_keys!11678 (_2!7898 lt!461132)) (_values!6433 (_2!7898 lt!461132)) (mask!30529 (_2!7898 lt!461132)) (extraKeys!6138 (_2!7898 lt!461132)) (zeroValue!6244 (_2!7898 lt!461132)) (minValue!6244 (_2!7898 lt!461132)) #b00000000000000000000000000000000 (defaultEntry!6410 (_2!7898 lt!461132))))))

(declare-fun lt!461274 () (_ BitVec 64))

(assert (=> b!1045130 (= lt!461274 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461271 () (_ BitVec 64))

(assert (=> b!1045130 (= lt!461271 (select (arr!31683 (_keys!11678 (_2!7898 lt!461132))) #b00000000000000000000000000000000))))

(declare-fun lt!461283 () Unit!34125)

(assert (=> b!1045130 (= lt!461283 (addStillContains!632 lt!461273 lt!461274 (zeroValue!6244 (_2!7898 lt!461132)) lt!461271))))

(assert (=> b!1045130 (contains!6076 (+!3111 lt!461273 (tuple2!15777 lt!461274 (zeroValue!6244 (_2!7898 lt!461132)))) lt!461271)))

(declare-fun lt!461290 () Unit!34125)

(assert (=> b!1045130 (= lt!461290 lt!461283)))

(declare-fun lt!461270 () ListLongMap!13787)

(assert (=> b!1045130 (= lt!461270 (getCurrentListMapNoExtraKeys!3527 (_keys!11678 (_2!7898 lt!461132)) (_values!6433 (_2!7898 lt!461132)) (mask!30529 (_2!7898 lt!461132)) (extraKeys!6138 (_2!7898 lt!461132)) (zeroValue!6244 (_2!7898 lt!461132)) (minValue!6244 (_2!7898 lt!461132)) #b00000000000000000000000000000000 (defaultEntry!6410 (_2!7898 lt!461132))))))

(declare-fun lt!461269 () (_ BitVec 64))

(assert (=> b!1045130 (= lt!461269 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461278 () (_ BitVec 64))

(assert (=> b!1045130 (= lt!461278 (select (arr!31683 (_keys!11678 (_2!7898 lt!461132))) #b00000000000000000000000000000000))))

(declare-fun lt!461277 () Unit!34125)

(assert (=> b!1045130 (= lt!461277 (addApplyDifferent!492 lt!461270 lt!461269 (minValue!6244 (_2!7898 lt!461132)) lt!461278))))

(assert (=> b!1045130 (= (apply!913 (+!3111 lt!461270 (tuple2!15777 lt!461269 (minValue!6244 (_2!7898 lt!461132)))) lt!461278) (apply!913 lt!461270 lt!461278))))

(declare-fun lt!461285 () Unit!34125)

(assert (=> b!1045130 (= lt!461285 lt!461277)))

(declare-fun lt!461286 () ListLongMap!13787)

(assert (=> b!1045130 (= lt!461286 (getCurrentListMapNoExtraKeys!3527 (_keys!11678 (_2!7898 lt!461132)) (_values!6433 (_2!7898 lt!461132)) (mask!30529 (_2!7898 lt!461132)) (extraKeys!6138 (_2!7898 lt!461132)) (zeroValue!6244 (_2!7898 lt!461132)) (minValue!6244 (_2!7898 lt!461132)) #b00000000000000000000000000000000 (defaultEntry!6410 (_2!7898 lt!461132))))))

(declare-fun lt!461282 () (_ BitVec 64))

(assert (=> b!1045130 (= lt!461282 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461276 () (_ BitVec 64))

(assert (=> b!1045130 (= lt!461276 (select (arr!31683 (_keys!11678 (_2!7898 lt!461132))) #b00000000000000000000000000000000))))

(declare-fun lt!461279 () Unit!34125)

(assert (=> b!1045130 (= lt!461279 (addApplyDifferent!492 lt!461286 lt!461282 (zeroValue!6244 (_2!7898 lt!461132)) lt!461276))))

(assert (=> b!1045130 (= (apply!913 (+!3111 lt!461286 (tuple2!15777 lt!461282 (zeroValue!6244 (_2!7898 lt!461132)))) lt!461276) (apply!913 lt!461286 lt!461276))))

(declare-fun lt!461288 () Unit!34125)

(assert (=> b!1045130 (= lt!461288 lt!461279)))

(declare-fun lt!461281 () ListLongMap!13787)

(assert (=> b!1045130 (= lt!461281 (getCurrentListMapNoExtraKeys!3527 (_keys!11678 (_2!7898 lt!461132)) (_values!6433 (_2!7898 lt!461132)) (mask!30529 (_2!7898 lt!461132)) (extraKeys!6138 (_2!7898 lt!461132)) (zeroValue!6244 (_2!7898 lt!461132)) (minValue!6244 (_2!7898 lt!461132)) #b00000000000000000000000000000000 (defaultEntry!6410 (_2!7898 lt!461132))))))

(declare-fun lt!461280 () (_ BitVec 64))

(assert (=> b!1045130 (= lt!461280 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461284 () (_ BitVec 64))

(assert (=> b!1045130 (= lt!461284 (select (arr!31683 (_keys!11678 (_2!7898 lt!461132))) #b00000000000000000000000000000000))))

(assert (=> b!1045130 (= lt!461289 (addApplyDifferent!492 lt!461281 lt!461280 (minValue!6244 (_2!7898 lt!461132)) lt!461284))))

(assert (=> b!1045130 (= (apply!913 (+!3111 lt!461281 (tuple2!15777 lt!461280 (minValue!6244 (_2!7898 lt!461132)))) lt!461284) (apply!913 lt!461281 lt!461284))))

(declare-fun b!1045131 () Bool)

(assert (=> b!1045131 (= e!592402 (not call!44469))))

(declare-fun b!1045132 () Bool)

(declare-fun e!592393 () Bool)

(assert (=> b!1045132 (= e!592393 (= (apply!913 lt!461287 (select (arr!31683 (_keys!11678 (_2!7898 lt!461132))) #b00000000000000000000000000000000)) (get!16556 (select (arr!31684 (_values!6433 (_2!7898 lt!461132))) #b00000000000000000000000000000000) (dynLambda!2006 (defaultEntry!6410 (_2!7898 lt!461132)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045132 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32219 (_values!6433 (_2!7898 lt!461132)))))))

(assert (=> b!1045132 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32218 (_keys!11678 (_2!7898 lt!461132)))))))

(declare-fun b!1045133 () Bool)

(declare-fun e!592394 () ListLongMap!13787)

(assert (=> b!1045133 (= e!592394 call!44466)))

(declare-fun d!126483 () Bool)

(declare-fun e!592401 () Bool)

(assert (=> d!126483 e!592401))

(declare-fun res!695956 () Bool)

(assert (=> d!126483 (=> (not res!695956) (not e!592401))))

(assert (=> d!126483 (= res!695956 (or (bvsge #b00000000000000000000000000000000 (size!32218 (_keys!11678 (_2!7898 lt!461132)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32218 (_keys!11678 (_2!7898 lt!461132)))))))))

(declare-fun lt!461275 () ListLongMap!13787)

(assert (=> d!126483 (= lt!461287 lt!461275)))

(declare-fun lt!461272 () Unit!34125)

(assert (=> d!126483 (= lt!461272 e!592395)))

(declare-fun c!106235 () Bool)

(assert (=> d!126483 (= c!106235 e!592398)))

(declare-fun res!695954 () Bool)

(assert (=> d!126483 (=> (not res!695954) (not e!592398))))

(assert (=> d!126483 (= res!695954 (bvslt #b00000000000000000000000000000000 (size!32218 (_keys!11678 (_2!7898 lt!461132)))))))

(assert (=> d!126483 (= lt!461275 e!592392)))

(assert (=> d!126483 (= c!106234 (and (not (= (bvand (extraKeys!6138 (_2!7898 lt!461132)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6138 (_2!7898 lt!461132)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126483 (validMask!0 (mask!30529 (_2!7898 lt!461132)))))

(assert (=> d!126483 (= (getCurrentListMap!3957 (_keys!11678 (_2!7898 lt!461132)) (_values!6433 (_2!7898 lt!461132)) (mask!30529 (_2!7898 lt!461132)) (extraKeys!6138 (_2!7898 lt!461132)) (zeroValue!6244 (_2!7898 lt!461132)) (minValue!6244 (_2!7898 lt!461132)) #b00000000000000000000000000000000 (defaultEntry!6410 (_2!7898 lt!461132))) lt!461287)))

(declare-fun b!1045126 () Bool)

(declare-fun Unit!34135 () Unit!34125)

(assert (=> b!1045126 (= e!592395 Unit!34135)))

(declare-fun b!1045134 () Bool)

(declare-fun e!592403 () Bool)

(assert (=> b!1045134 (= e!592403 (validKeyInArray!0 (select (arr!31683 (_keys!11678 (_2!7898 lt!461132))) #b00000000000000000000000000000000)))))

(declare-fun b!1045135 () Bool)

(declare-fun c!106233 () Bool)

(assert (=> b!1045135 (= c!106233 (and (not (= (bvand (extraKeys!6138 (_2!7898 lt!461132)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6138 (_2!7898 lt!461132)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1045135 (= e!592404 e!592394)))

(declare-fun b!1045136 () Bool)

(assert (=> b!1045136 (= e!592401 e!592402)))

(declare-fun c!106230 () Bool)

(assert (=> b!1045136 (= c!106230 (not (= (bvand (extraKeys!6138 (_2!7898 lt!461132)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045137 () Bool)

(declare-fun e!592400 () Bool)

(assert (=> b!1045137 (= e!592400 e!592393)))

(declare-fun res!695961 () Bool)

(assert (=> b!1045137 (=> (not res!695961) (not e!592393))))

(assert (=> b!1045137 (= res!695961 (contains!6076 lt!461287 (select (arr!31683 (_keys!11678 (_2!7898 lt!461132))) #b00000000000000000000000000000000)))))

(assert (=> b!1045137 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32218 (_keys!11678 (_2!7898 lt!461132)))))))

(declare-fun b!1045138 () Bool)

(assert (=> b!1045138 (= e!592392 e!592404)))

(assert (=> b!1045138 (= c!106231 (and (not (= (bvand (extraKeys!6138 (_2!7898 lt!461132)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6138 (_2!7898 lt!461132)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44468 () Bool)

(assert (=> bm!44468 (= call!44471 call!44467)))

(declare-fun b!1045139 () Bool)

(assert (=> b!1045139 (= e!592397 (= (apply!913 lt!461287 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6244 (_2!7898 lt!461132))))))

(declare-fun b!1045140 () Bool)

(declare-fun res!695958 () Bool)

(assert (=> b!1045140 (=> (not res!695958) (not e!592401))))

(assert (=> b!1045140 (= res!695958 e!592396)))

(declare-fun c!106232 () Bool)

(assert (=> b!1045140 (= c!106232 (not (= (bvand (extraKeys!6138 (_2!7898 lt!461132)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1045141 () Bool)

(declare-fun res!695957 () Bool)

(assert (=> b!1045141 (=> (not res!695957) (not e!592401))))

(assert (=> b!1045141 (= res!695957 e!592400)))

(declare-fun res!695959 () Bool)

(assert (=> b!1045141 (=> res!695959 e!592400)))

(assert (=> b!1045141 (= res!695959 (not e!592403))))

(declare-fun res!695953 () Bool)

(assert (=> b!1045141 (=> (not res!695953) (not e!592403))))

(assert (=> b!1045141 (= res!695953 (bvslt #b00000000000000000000000000000000 (size!32218 (_keys!11678 (_2!7898 lt!461132)))))))

(declare-fun b!1045142 () Bool)

(assert (=> b!1045142 (= e!592396 (not call!44465))))

(declare-fun b!1045143 () Bool)

(assert (=> b!1045143 (= e!592394 call!44471)))

(assert (= (and d!126483 c!106234) b!1045128))

(assert (= (and d!126483 (not c!106234)) b!1045138))

(assert (= (and b!1045138 c!106231) b!1045129))

(assert (= (and b!1045138 (not c!106231)) b!1045135))

(assert (= (and b!1045135 c!106233) b!1045133))

(assert (= (and b!1045135 (not c!106233)) b!1045143))

(assert (= (or b!1045133 b!1045143) bm!44468))

(assert (= (or b!1045129 bm!44468) bm!44463))

(assert (= (or b!1045129 b!1045133) bm!44462))

(assert (= (or b!1045128 bm!44463) bm!44466))

(assert (= (or b!1045128 bm!44462) bm!44465))

(assert (= (and d!126483 res!695954) b!1045125))

(assert (= (and d!126483 c!106235) b!1045130))

(assert (= (and d!126483 (not c!106235)) b!1045126))

(assert (= (and d!126483 res!695956) b!1045141))

(assert (= (and b!1045141 res!695953) b!1045134))

(assert (= (and b!1045141 (not res!695959)) b!1045137))

(assert (= (and b!1045137 res!695961) b!1045132))

(assert (= (and b!1045141 res!695957) b!1045140))

(assert (= (and b!1045140 c!106232) b!1045124))

(assert (= (and b!1045140 (not c!106232)) b!1045142))

(assert (= (and b!1045124 res!695955) b!1045139))

(assert (= (or b!1045124 b!1045142) bm!44464))

(assert (= (and b!1045140 res!695958) b!1045136))

(assert (= (and b!1045136 c!106230) b!1045127))

(assert (= (and b!1045136 (not c!106230)) b!1045131))

(assert (= (and b!1045127 res!695960) b!1045123))

(assert (= (or b!1045127 b!1045131) bm!44467))

(declare-fun b_lambda!16275 () Bool)

(assert (=> (not b_lambda!16275) (not b!1045132)))

(declare-fun tb!7079 () Bool)

(declare-fun t!31273 () Bool)

(assert (=> (and b!1044953 (= (defaultEntry!6410 thiss!1427) (defaultEntry!6410 (_2!7898 lt!461132))) t!31273) tb!7079))

(declare-fun result!14583 () Bool)

(assert (=> tb!7079 (= result!14583 tp_is_empty!24849)))

(assert (=> b!1045132 t!31273))

(declare-fun b_and!33741 () Bool)

(assert (= b_and!33739 (and (=> t!31273 result!14583) b_and!33741)))

(declare-fun m!964733 () Bool)

(assert (=> b!1045128 m!964733))

(declare-fun m!964735 () Bool)

(assert (=> b!1045132 m!964735))

(declare-fun m!964737 () Bool)

(assert (=> b!1045132 m!964737))

(declare-fun m!964739 () Bool)

(assert (=> b!1045132 m!964739))

(assert (=> b!1045132 m!964737))

(declare-fun m!964741 () Bool)

(assert (=> b!1045132 m!964741))

(assert (=> b!1045132 m!964735))

(assert (=> b!1045132 m!964741))

(declare-fun m!964743 () Bool)

(assert (=> b!1045132 m!964743))

(assert (=> d!126483 m!964529))

(declare-fun m!964745 () Bool)

(assert (=> bm!44467 m!964745))

(declare-fun m!964747 () Bool)

(assert (=> b!1045130 m!964747))

(declare-fun m!964749 () Bool)

(assert (=> b!1045130 m!964749))

(declare-fun m!964751 () Bool)

(assert (=> b!1045130 m!964751))

(declare-fun m!964753 () Bool)

(assert (=> b!1045130 m!964753))

(declare-fun m!964755 () Bool)

(assert (=> b!1045130 m!964755))

(declare-fun m!964757 () Bool)

(assert (=> b!1045130 m!964757))

(declare-fun m!964759 () Bool)

(assert (=> b!1045130 m!964759))

(assert (=> b!1045130 m!964757))

(declare-fun m!964761 () Bool)

(assert (=> b!1045130 m!964761))

(declare-fun m!964763 () Bool)

(assert (=> b!1045130 m!964763))

(declare-fun m!964765 () Bool)

(assert (=> b!1045130 m!964765))

(declare-fun m!964767 () Bool)

(assert (=> b!1045130 m!964767))

(assert (=> b!1045130 m!964765))

(declare-fun m!964769 () Bool)

(assert (=> b!1045130 m!964769))

(assert (=> b!1045130 m!964741))

(assert (=> b!1045130 m!964763))

(declare-fun m!964771 () Bool)

(assert (=> b!1045130 m!964771))

(assert (=> b!1045130 m!964747))

(declare-fun m!964773 () Bool)

(assert (=> b!1045130 m!964773))

(declare-fun m!964775 () Bool)

(assert (=> b!1045130 m!964775))

(declare-fun m!964777 () Bool)

(assert (=> b!1045130 m!964777))

(declare-fun m!964779 () Bool)

(assert (=> b!1045139 m!964779))

(assert (=> bm!44466 m!964775))

(assert (=> b!1045137 m!964741))

(assert (=> b!1045137 m!964741))

(declare-fun m!964781 () Bool)

(assert (=> b!1045137 m!964781))

(declare-fun m!964783 () Bool)

(assert (=> bm!44464 m!964783))

(declare-fun m!964785 () Bool)

(assert (=> bm!44465 m!964785))

(declare-fun m!964787 () Bool)

(assert (=> b!1045123 m!964787))

(assert (=> b!1045134 m!964741))

(assert (=> b!1045134 m!964741))

(declare-fun m!964789 () Bool)

(assert (=> b!1045134 m!964789))

(assert (=> b!1045125 m!964741))

(assert (=> b!1045125 m!964741))

(assert (=> b!1045125 m!964789))

(assert (=> b!1044952 d!126483))

(declare-fun b!1045153 () Bool)

(declare-fun res!695973 () Bool)

(declare-fun e!592410 () Bool)

(assert (=> b!1045153 (=> (not res!695973) (not e!592410))))

(assert (=> b!1045153 (= res!695973 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1045155 () Bool)

(declare-fun e!592409 () Bool)

(assert (=> b!1045155 (= e!592409 (= (arrayCountValidKeys!0 (array!65871 (store (arr!31683 (_keys!11678 thiss!1427)) (index!41748 lt!461127) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32218 (_keys!11678 thiss!1427))) #b00000000000000000000000000000000 (size!32218 (_keys!11678 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11678 thiss!1427) #b00000000000000000000000000000000 (size!32218 (_keys!11678 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!126485 () Bool)

(assert (=> d!126485 e!592409))

(declare-fun res!695970 () Bool)

(assert (=> d!126485 (=> (not res!695970) (not e!592409))))

(assert (=> d!126485 (= res!695970 (and (bvsge (index!41748 lt!461127) #b00000000000000000000000000000000) (bvslt (index!41748 lt!461127) (size!32218 (_keys!11678 thiss!1427)))))))

(declare-fun lt!461293 () Unit!34125)

(declare-fun choose!82 (array!65870 (_ BitVec 32) (_ BitVec 64)) Unit!34125)

(assert (=> d!126485 (= lt!461293 (choose!82 (_keys!11678 thiss!1427) (index!41748 lt!461127) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126485 e!592410))

(declare-fun res!695971 () Bool)

(assert (=> d!126485 (=> (not res!695971) (not e!592410))))

(assert (=> d!126485 (= res!695971 (and (bvsge (index!41748 lt!461127) #b00000000000000000000000000000000) (bvslt (index!41748 lt!461127) (size!32218 (_keys!11678 thiss!1427)))))))

(assert (=> d!126485 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11678 thiss!1427) (index!41748 lt!461127) #b1000000000000000000000000000000000000000000000000000000000000000) lt!461293)))

(declare-fun b!1045152 () Bool)

(declare-fun res!695972 () Bool)

(assert (=> b!1045152 (=> (not res!695972) (not e!592410))))

(assert (=> b!1045152 (= res!695972 (validKeyInArray!0 (select (arr!31683 (_keys!11678 thiss!1427)) (index!41748 lt!461127))))))

(declare-fun b!1045154 () Bool)

(assert (=> b!1045154 (= e!592410 (bvslt (size!32218 (_keys!11678 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!126485 res!695971) b!1045152))

(assert (= (and b!1045152 res!695972) b!1045153))

(assert (= (and b!1045153 res!695973) b!1045154))

(assert (= (and d!126485 res!695970) b!1045155))

(declare-fun m!964791 () Bool)

(assert (=> b!1045153 m!964791))

(assert (=> b!1045155 m!964573))

(declare-fun m!964793 () Bool)

(assert (=> b!1045155 m!964793))

(assert (=> b!1045155 m!964557))

(declare-fun m!964795 () Bool)

(assert (=> d!126485 m!964795))

(declare-fun m!964797 () Bool)

(assert (=> b!1045152 m!964797))

(assert (=> b!1045152 m!964797))

(declare-fun m!964799 () Bool)

(assert (=> b!1045152 m!964799))

(assert (=> b!1044952 d!126485))

(declare-fun b!1045156 () Bool)

(declare-fun e!592418 () Bool)

(declare-fun lt!461312 () ListLongMap!13787)

(assert (=> b!1045156 (= e!592418 (= (apply!913 lt!461312 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6244 thiss!1427)))))

(declare-fun bm!44469 () Bool)

(declare-fun call!44473 () ListLongMap!13787)

(declare-fun call!44477 () ListLongMap!13787)

(assert (=> bm!44469 (= call!44473 call!44477)))

(declare-fun b!1045157 () Bool)

(declare-fun e!592415 () Bool)

(declare-fun e!592416 () Bool)

(assert (=> b!1045157 (= e!592415 e!592416)))

(declare-fun res!695976 () Bool)

(declare-fun call!44472 () Bool)

(assert (=> b!1045157 (= res!695976 call!44472)))

(assert (=> b!1045157 (=> (not res!695976) (not e!592416))))

(declare-fun b!1045158 () Bool)

(declare-fun e!592417 () Bool)

(assert (=> b!1045158 (= e!592417 (validKeyInArray!0 (select (arr!31683 lt!461135) #b00000000000000000000000000000000)))))

(declare-fun bm!44470 () Bool)

(declare-fun call!44474 () ListLongMap!13787)

(declare-fun call!44475 () ListLongMap!13787)

(assert (=> bm!44470 (= call!44474 call!44475)))

(declare-fun bm!44471 () Bool)

(assert (=> bm!44471 (= call!44472 (contains!6076 lt!461312 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045160 () Bool)

(declare-fun e!592421 () Bool)

(assert (=> b!1045160 (= e!592421 e!592418)))

(declare-fun res!695981 () Bool)

(declare-fun call!44476 () Bool)

(assert (=> b!1045160 (= res!695981 call!44476)))

(assert (=> b!1045160 (=> (not res!695981) (not e!592418))))

(declare-fun bm!44472 () Bool)

(declare-fun call!44478 () ListLongMap!13787)

(declare-fun c!106240 () Bool)

(declare-fun c!106237 () Bool)

(assert (=> bm!44472 (= call!44477 (+!3111 (ite c!106240 call!44475 (ite c!106237 call!44474 call!44478)) (ite (or c!106240 c!106237) (tuple2!15777 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6244 thiss!1427)) (tuple2!15777 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6244 thiss!1427)))))))

(declare-fun b!1045161 () Bool)

(declare-fun e!592411 () ListLongMap!13787)

(assert (=> b!1045161 (= e!592411 (+!3111 call!44477 (tuple2!15777 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6244 thiss!1427))))))

(declare-fun bm!44473 () Bool)

(assert (=> bm!44473 (= call!44475 (getCurrentListMapNoExtraKeys!3527 lt!461135 lt!461129 (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6410 thiss!1427)))))

(declare-fun bm!44474 () Bool)

(assert (=> bm!44474 (= call!44476 (contains!6076 lt!461312 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045162 () Bool)

(declare-fun e!592423 () ListLongMap!13787)

(assert (=> b!1045162 (= e!592423 call!44473)))

(declare-fun b!1045163 () Bool)

(declare-fun e!592414 () Unit!34125)

(declare-fun lt!461314 () Unit!34125)

(assert (=> b!1045163 (= e!592414 lt!461314)))

(declare-fun lt!461298 () ListLongMap!13787)

(assert (=> b!1045163 (= lt!461298 (getCurrentListMapNoExtraKeys!3527 lt!461135 lt!461129 (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6410 thiss!1427)))))

(declare-fun lt!461299 () (_ BitVec 64))

(assert (=> b!1045163 (= lt!461299 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461296 () (_ BitVec 64))

(assert (=> b!1045163 (= lt!461296 (select (arr!31683 lt!461135) #b00000000000000000000000000000000))))

(declare-fun lt!461308 () Unit!34125)

(assert (=> b!1045163 (= lt!461308 (addStillContains!632 lt!461298 lt!461299 (zeroValue!6244 thiss!1427) lt!461296))))

(assert (=> b!1045163 (contains!6076 (+!3111 lt!461298 (tuple2!15777 lt!461299 (zeroValue!6244 thiss!1427))) lt!461296)))

(declare-fun lt!461315 () Unit!34125)

(assert (=> b!1045163 (= lt!461315 lt!461308)))

(declare-fun lt!461295 () ListLongMap!13787)

(assert (=> b!1045163 (= lt!461295 (getCurrentListMapNoExtraKeys!3527 lt!461135 lt!461129 (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6410 thiss!1427)))))

(declare-fun lt!461294 () (_ BitVec 64))

(assert (=> b!1045163 (= lt!461294 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461303 () (_ BitVec 64))

(assert (=> b!1045163 (= lt!461303 (select (arr!31683 lt!461135) #b00000000000000000000000000000000))))

(declare-fun lt!461302 () Unit!34125)

(assert (=> b!1045163 (= lt!461302 (addApplyDifferent!492 lt!461295 lt!461294 (minValue!6244 thiss!1427) lt!461303))))

(assert (=> b!1045163 (= (apply!913 (+!3111 lt!461295 (tuple2!15777 lt!461294 (minValue!6244 thiss!1427))) lt!461303) (apply!913 lt!461295 lt!461303))))

(declare-fun lt!461310 () Unit!34125)

(assert (=> b!1045163 (= lt!461310 lt!461302)))

(declare-fun lt!461311 () ListLongMap!13787)

(assert (=> b!1045163 (= lt!461311 (getCurrentListMapNoExtraKeys!3527 lt!461135 lt!461129 (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6410 thiss!1427)))))

(declare-fun lt!461307 () (_ BitVec 64))

(assert (=> b!1045163 (= lt!461307 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461301 () (_ BitVec 64))

(assert (=> b!1045163 (= lt!461301 (select (arr!31683 lt!461135) #b00000000000000000000000000000000))))

(declare-fun lt!461304 () Unit!34125)

(assert (=> b!1045163 (= lt!461304 (addApplyDifferent!492 lt!461311 lt!461307 (zeroValue!6244 thiss!1427) lt!461301))))

(assert (=> b!1045163 (= (apply!913 (+!3111 lt!461311 (tuple2!15777 lt!461307 (zeroValue!6244 thiss!1427))) lt!461301) (apply!913 lt!461311 lt!461301))))

(declare-fun lt!461313 () Unit!34125)

(assert (=> b!1045163 (= lt!461313 lt!461304)))

(declare-fun lt!461306 () ListLongMap!13787)

(assert (=> b!1045163 (= lt!461306 (getCurrentListMapNoExtraKeys!3527 lt!461135 lt!461129 (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6410 thiss!1427)))))

(declare-fun lt!461305 () (_ BitVec 64))

(assert (=> b!1045163 (= lt!461305 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461309 () (_ BitVec 64))

(assert (=> b!1045163 (= lt!461309 (select (arr!31683 lt!461135) #b00000000000000000000000000000000))))

(assert (=> b!1045163 (= lt!461314 (addApplyDifferent!492 lt!461306 lt!461305 (minValue!6244 thiss!1427) lt!461309))))

(assert (=> b!1045163 (= (apply!913 (+!3111 lt!461306 (tuple2!15777 lt!461305 (minValue!6244 thiss!1427))) lt!461309) (apply!913 lt!461306 lt!461309))))

(declare-fun b!1045164 () Bool)

(assert (=> b!1045164 (= e!592421 (not call!44476))))

(declare-fun b!1045165 () Bool)

(declare-fun e!592412 () Bool)

(assert (=> b!1045165 (= e!592412 (= (apply!913 lt!461312 (select (arr!31683 lt!461135) #b00000000000000000000000000000000)) (get!16556 (select (arr!31684 lt!461129) #b00000000000000000000000000000000) (dynLambda!2006 (defaultEntry!6410 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045165 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32219 lt!461129)))))

(assert (=> b!1045165 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32218 lt!461135)))))

(declare-fun b!1045166 () Bool)

(declare-fun e!592413 () ListLongMap!13787)

(assert (=> b!1045166 (= e!592413 call!44473)))

(declare-fun d!126487 () Bool)

(declare-fun e!592420 () Bool)

(assert (=> d!126487 e!592420))

(declare-fun res!695977 () Bool)

(assert (=> d!126487 (=> (not res!695977) (not e!592420))))

(assert (=> d!126487 (= res!695977 (or (bvsge #b00000000000000000000000000000000 (size!32218 lt!461135)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32218 lt!461135)))))))

(declare-fun lt!461300 () ListLongMap!13787)

(assert (=> d!126487 (= lt!461312 lt!461300)))

(declare-fun lt!461297 () Unit!34125)

(assert (=> d!126487 (= lt!461297 e!592414)))

(declare-fun c!106241 () Bool)

(assert (=> d!126487 (= c!106241 e!592417)))

(declare-fun res!695975 () Bool)

(assert (=> d!126487 (=> (not res!695975) (not e!592417))))

(assert (=> d!126487 (= res!695975 (bvslt #b00000000000000000000000000000000 (size!32218 lt!461135)))))

(assert (=> d!126487 (= lt!461300 e!592411)))

(assert (=> d!126487 (= c!106240 (and (not (= (bvand (extraKeys!6138 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6138 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126487 (validMask!0 (mask!30529 thiss!1427))))

(assert (=> d!126487 (= (getCurrentListMap!3957 lt!461135 lt!461129 (mask!30529 thiss!1427) (extraKeys!6138 thiss!1427) (zeroValue!6244 thiss!1427) (minValue!6244 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6410 thiss!1427)) lt!461312)))

(declare-fun b!1045159 () Bool)

(declare-fun Unit!34136 () Unit!34125)

(assert (=> b!1045159 (= e!592414 Unit!34136)))

(declare-fun b!1045167 () Bool)

(declare-fun e!592422 () Bool)

(assert (=> b!1045167 (= e!592422 (validKeyInArray!0 (select (arr!31683 lt!461135) #b00000000000000000000000000000000)))))

(declare-fun b!1045168 () Bool)

(declare-fun c!106239 () Bool)

(assert (=> b!1045168 (= c!106239 (and (not (= (bvand (extraKeys!6138 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6138 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1045168 (= e!592423 e!592413)))

(declare-fun b!1045169 () Bool)

(assert (=> b!1045169 (= e!592420 e!592421)))

(declare-fun c!106236 () Bool)

(assert (=> b!1045169 (= c!106236 (not (= (bvand (extraKeys!6138 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045170 () Bool)

(declare-fun e!592419 () Bool)

(assert (=> b!1045170 (= e!592419 e!592412)))

(declare-fun res!695982 () Bool)

(assert (=> b!1045170 (=> (not res!695982) (not e!592412))))

(assert (=> b!1045170 (= res!695982 (contains!6076 lt!461312 (select (arr!31683 lt!461135) #b00000000000000000000000000000000)))))

(assert (=> b!1045170 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32218 lt!461135)))))

(declare-fun b!1045171 () Bool)

(assert (=> b!1045171 (= e!592411 e!592423)))

(assert (=> b!1045171 (= c!106237 (and (not (= (bvand (extraKeys!6138 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6138 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44475 () Bool)

(assert (=> bm!44475 (= call!44478 call!44474)))

(declare-fun b!1045172 () Bool)

(assert (=> b!1045172 (= e!592416 (= (apply!913 lt!461312 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6244 thiss!1427)))))

(declare-fun b!1045173 () Bool)

(declare-fun res!695979 () Bool)

(assert (=> b!1045173 (=> (not res!695979) (not e!592420))))

(assert (=> b!1045173 (= res!695979 e!592415)))

(declare-fun c!106238 () Bool)

(assert (=> b!1045173 (= c!106238 (not (= (bvand (extraKeys!6138 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1045174 () Bool)

(declare-fun res!695978 () Bool)

(assert (=> b!1045174 (=> (not res!695978) (not e!592420))))

(assert (=> b!1045174 (= res!695978 e!592419)))

(declare-fun res!695980 () Bool)

(assert (=> b!1045174 (=> res!695980 e!592419)))

(assert (=> b!1045174 (= res!695980 (not e!592422))))

(declare-fun res!695974 () Bool)

(assert (=> b!1045174 (=> (not res!695974) (not e!592422))))

(assert (=> b!1045174 (= res!695974 (bvslt #b00000000000000000000000000000000 (size!32218 lt!461135)))))

(declare-fun b!1045175 () Bool)

(assert (=> b!1045175 (= e!592415 (not call!44472))))

(declare-fun b!1045176 () Bool)

(assert (=> b!1045176 (= e!592413 call!44478)))

(assert (= (and d!126487 c!106240) b!1045161))

(assert (= (and d!126487 (not c!106240)) b!1045171))

(assert (= (and b!1045171 c!106237) b!1045162))

(assert (= (and b!1045171 (not c!106237)) b!1045168))

(assert (= (and b!1045168 c!106239) b!1045166))

(assert (= (and b!1045168 (not c!106239)) b!1045176))

(assert (= (or b!1045166 b!1045176) bm!44475))

(assert (= (or b!1045162 bm!44475) bm!44470))

(assert (= (or b!1045162 b!1045166) bm!44469))

(assert (= (or b!1045161 bm!44470) bm!44473))

(assert (= (or b!1045161 bm!44469) bm!44472))

(assert (= (and d!126487 res!695975) b!1045158))

(assert (= (and d!126487 c!106241) b!1045163))

(assert (= (and d!126487 (not c!106241)) b!1045159))

(assert (= (and d!126487 res!695977) b!1045174))

(assert (= (and b!1045174 res!695974) b!1045167))

(assert (= (and b!1045174 (not res!695980)) b!1045170))

(assert (= (and b!1045170 res!695982) b!1045165))

(assert (= (and b!1045174 res!695978) b!1045173))

(assert (= (and b!1045173 c!106238) b!1045157))

(assert (= (and b!1045173 (not c!106238)) b!1045175))

(assert (= (and b!1045157 res!695976) b!1045172))

(assert (= (or b!1045157 b!1045175) bm!44471))

(assert (= (and b!1045173 res!695979) b!1045169))

(assert (= (and b!1045169 c!106236) b!1045160))

(assert (= (and b!1045169 (not c!106236)) b!1045164))

(assert (= (and b!1045160 res!695981) b!1045156))

(assert (= (or b!1045160 b!1045164) bm!44474))

(declare-fun b_lambda!16277 () Bool)

(assert (=> (not b_lambda!16277) (not b!1045165)))

(assert (=> b!1045165 t!31265))

(declare-fun b_and!33743 () Bool)

(assert (= b_and!33741 (and (=> t!31265 result!14575) b_and!33743)))

(declare-fun m!964801 () Bool)

(assert (=> b!1045161 m!964801))

(declare-fun m!964803 () Bool)

(assert (=> b!1045165 m!964803))

(assert (=> b!1045165 m!964569))

(declare-fun m!964805 () Bool)

(assert (=> b!1045165 m!964805))

(assert (=> b!1045165 m!964569))

(assert (=> b!1045165 m!964631))

(assert (=> b!1045165 m!964803))

(assert (=> b!1045165 m!964631))

(declare-fun m!964807 () Bool)

(assert (=> b!1045165 m!964807))

(assert (=> d!126487 m!964627))

(declare-fun m!964809 () Bool)

(assert (=> bm!44474 m!964809))

(declare-fun m!964811 () Bool)

(assert (=> b!1045163 m!964811))

(declare-fun m!964813 () Bool)

(assert (=> b!1045163 m!964813))

(declare-fun m!964815 () Bool)

(assert (=> b!1045163 m!964815))

(declare-fun m!964817 () Bool)

(assert (=> b!1045163 m!964817))

(declare-fun m!964819 () Bool)

(assert (=> b!1045163 m!964819))

(declare-fun m!964821 () Bool)

(assert (=> b!1045163 m!964821))

(declare-fun m!964823 () Bool)

(assert (=> b!1045163 m!964823))

(assert (=> b!1045163 m!964821))

(declare-fun m!964825 () Bool)

(assert (=> b!1045163 m!964825))

(declare-fun m!964827 () Bool)

(assert (=> b!1045163 m!964827))

(declare-fun m!964829 () Bool)

(assert (=> b!1045163 m!964829))

(declare-fun m!964831 () Bool)

(assert (=> b!1045163 m!964831))

(assert (=> b!1045163 m!964829))

(declare-fun m!964833 () Bool)

(assert (=> b!1045163 m!964833))

(assert (=> b!1045163 m!964631))

(assert (=> b!1045163 m!964827))

(declare-fun m!964835 () Bool)

(assert (=> b!1045163 m!964835))

(assert (=> b!1045163 m!964811))

(declare-fun m!964837 () Bool)

(assert (=> b!1045163 m!964837))

(declare-fun m!964839 () Bool)

(assert (=> b!1045163 m!964839))

(declare-fun m!964841 () Bool)

(assert (=> b!1045163 m!964841))

(declare-fun m!964843 () Bool)

(assert (=> b!1045172 m!964843))

(assert (=> bm!44473 m!964839))

(assert (=> b!1045170 m!964631))

(assert (=> b!1045170 m!964631))

(declare-fun m!964845 () Bool)

(assert (=> b!1045170 m!964845))

(declare-fun m!964847 () Bool)

(assert (=> bm!44471 m!964847))

(declare-fun m!964849 () Bool)

(assert (=> bm!44472 m!964849))

(declare-fun m!964851 () Bool)

(assert (=> b!1045156 m!964851))

(assert (=> b!1045167 m!964631))

(assert (=> b!1045167 m!964631))

(assert (=> b!1045167 m!964639))

(assert (=> b!1045158 m!964631))

(assert (=> b!1045158 m!964631))

(assert (=> b!1045158 m!964639))

(assert (=> b!1044952 d!126487))

(declare-fun d!126489 () Bool)

(assert (=> d!126489 (= (array_inv!24473 (_keys!11678 thiss!1427)) (bvsge (size!32218 (_keys!11678 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044953 d!126489))

(declare-fun d!126491 () Bool)

(assert (=> d!126491 (= (array_inv!24474 (_values!6433 thiss!1427)) (bvsge (size!32219 (_values!6433 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1044953 d!126491))

(declare-fun d!126493 () Bool)

(assert (=> d!126493 (= (validMask!0 (mask!30529 (_2!7898 lt!461132))) (and (or (= (mask!30529 (_2!7898 lt!461132)) #b00000000000000000000000000000111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000000000000000000000001111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000000000000000000000011111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000000000000000000000111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000000000000000000001111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000000000000000000011111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000000000000000000111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000000000000000001111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000000000000000011111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000000000000000111111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000000000000001111111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000000000000011111111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000000000000111111111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000000000001111111111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000000000011111111111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000000000111111111111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000000001111111111111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000000011111111111111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000000111111111111111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000001111111111111111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000011111111111111111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000000111111111111111111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000001111111111111111111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000011111111111111111111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00000111111111111111111111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00001111111111111111111111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00011111111111111111111111111111) (= (mask!30529 (_2!7898 lt!461132)) #b00111111111111111111111111111111)) (bvsle (mask!30529 (_2!7898 lt!461132)) #b00111111111111111111111111111111)))))

(assert (=> b!1044951 d!126493))

(declare-fun b!1045189 () Bool)

(declare-fun e!592431 () SeekEntryResult!9844)

(declare-fun e!592430 () SeekEntryResult!9844)

(assert (=> b!1045189 (= e!592431 e!592430)))

(declare-fun lt!461325 () (_ BitVec 64))

(declare-fun lt!461326 () SeekEntryResult!9844)

(assert (=> b!1045189 (= lt!461325 (select (arr!31683 (_keys!11678 thiss!1427)) (index!41749 lt!461326)))))

(declare-fun c!106248 () Bool)

(assert (=> b!1045189 (= c!106248 (= lt!461325 key!909))))

(declare-fun b!1045190 () Bool)

(assert (=> b!1045190 (= e!592431 Undefined!9844)))

(declare-fun b!1045191 () Bool)

(declare-fun c!106249 () Bool)

(assert (=> b!1045191 (= c!106249 (= lt!461325 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!592432 () SeekEntryResult!9844)

(assert (=> b!1045191 (= e!592430 e!592432)))

(declare-fun d!126495 () Bool)

(declare-fun lt!461324 () SeekEntryResult!9844)

(assert (=> d!126495 (and (or ((_ is MissingVacant!9844) lt!461324) (not ((_ is Found!9844) lt!461324)) (and (bvsge (index!41748 lt!461324) #b00000000000000000000000000000000) (bvslt (index!41748 lt!461324) (size!32218 (_keys!11678 thiss!1427))))) (not ((_ is MissingVacant!9844) lt!461324)) (or (not ((_ is Found!9844) lt!461324)) (= (select (arr!31683 (_keys!11678 thiss!1427)) (index!41748 lt!461324)) key!909)))))

(assert (=> d!126495 (= lt!461324 e!592431)))

(declare-fun c!106250 () Bool)

(assert (=> d!126495 (= c!106250 (and ((_ is Intermediate!9844) lt!461326) (undefined!10656 lt!461326)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65870 (_ BitVec 32)) SeekEntryResult!9844)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126495 (= lt!461326 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30529 thiss!1427)) key!909 (_keys!11678 thiss!1427) (mask!30529 thiss!1427)))))

(assert (=> d!126495 (validMask!0 (mask!30529 thiss!1427))))

(assert (=> d!126495 (= (seekEntry!0 key!909 (_keys!11678 thiss!1427) (mask!30529 thiss!1427)) lt!461324)))

(declare-fun b!1045192 () Bool)

(declare-fun lt!461327 () SeekEntryResult!9844)

(assert (=> b!1045192 (= e!592432 (ite ((_ is MissingVacant!9844) lt!461327) (MissingZero!9844 (index!41750 lt!461327)) lt!461327))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65870 (_ BitVec 32)) SeekEntryResult!9844)

(assert (=> b!1045192 (= lt!461327 (seekKeyOrZeroReturnVacant!0 (x!93324 lt!461326) (index!41749 lt!461326) (index!41749 lt!461326) key!909 (_keys!11678 thiss!1427) (mask!30529 thiss!1427)))))

(declare-fun b!1045193 () Bool)

(assert (=> b!1045193 (= e!592430 (Found!9844 (index!41749 lt!461326)))))

(declare-fun b!1045194 () Bool)

(assert (=> b!1045194 (= e!592432 (MissingZero!9844 (index!41749 lt!461326)))))

(assert (= (and d!126495 c!106250) b!1045190))

(assert (= (and d!126495 (not c!106250)) b!1045189))

(assert (= (and b!1045189 c!106248) b!1045193))

(assert (= (and b!1045189 (not c!106248)) b!1045191))

(assert (= (and b!1045191 c!106249) b!1045194))

(assert (= (and b!1045191 (not c!106249)) b!1045192))

(declare-fun m!964853 () Bool)

(assert (=> b!1045189 m!964853))

(declare-fun m!964855 () Bool)

(assert (=> d!126495 m!964855))

(declare-fun m!964857 () Bool)

(assert (=> d!126495 m!964857))

(assert (=> d!126495 m!964857))

(declare-fun m!964859 () Bool)

(assert (=> d!126495 m!964859))

(assert (=> d!126495 m!964627))

(declare-fun m!964861 () Bool)

(assert (=> b!1045192 m!964861))

(assert (=> b!1044958 d!126495))

(declare-fun d!126497 () Bool)

(declare-fun res!695989 () Bool)

(declare-fun e!592435 () Bool)

(assert (=> d!126497 (=> (not res!695989) (not e!592435))))

(declare-fun simpleValid!451 (LongMapFixedSize!6036) Bool)

(assert (=> d!126497 (= res!695989 (simpleValid!451 thiss!1427))))

(assert (=> d!126497 (= (valid!2265 thiss!1427) e!592435)))

(declare-fun b!1045201 () Bool)

(declare-fun res!695990 () Bool)

(assert (=> b!1045201 (=> (not res!695990) (not e!592435))))

(assert (=> b!1045201 (= res!695990 (= (arrayCountValidKeys!0 (_keys!11678 thiss!1427) #b00000000000000000000000000000000 (size!32218 (_keys!11678 thiss!1427))) (_size!3073 thiss!1427)))))

(declare-fun b!1045202 () Bool)

(declare-fun res!695991 () Bool)

(assert (=> b!1045202 (=> (not res!695991) (not e!592435))))

(assert (=> b!1045202 (= res!695991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11678 thiss!1427) (mask!30529 thiss!1427)))))

(declare-fun b!1045203 () Bool)

(assert (=> b!1045203 (= e!592435 (arrayNoDuplicates!0 (_keys!11678 thiss!1427) #b00000000000000000000000000000000 Nil!22010))))

(assert (= (and d!126497 res!695989) b!1045201))

(assert (= (and b!1045201 res!695990) b!1045202))

(assert (= (and b!1045202 res!695991) b!1045203))

(declare-fun m!964863 () Bool)

(assert (=> d!126497 m!964863))

(assert (=> b!1045201 m!964557))

(declare-fun m!964865 () Bool)

(assert (=> b!1045202 m!964865))

(declare-fun m!964867 () Bool)

(assert (=> b!1045203 m!964867))

(assert (=> start!91854 d!126497))

(declare-fun condMapEmpty!38915 () Bool)

(declare-fun mapDefault!38915 () ValueCell!11721)

(assert (=> mapNonEmpty!38909 (= condMapEmpty!38915 (= mapRest!38909 ((as const (Array (_ BitVec 32) ValueCell!11721)) mapDefault!38915)))))

(declare-fun e!592441 () Bool)

(declare-fun mapRes!38915 () Bool)

(assert (=> mapNonEmpty!38909 (= tp!74639 (and e!592441 mapRes!38915))))

(declare-fun b!1045210 () Bool)

(declare-fun e!592440 () Bool)

(assert (=> b!1045210 (= e!592440 tp_is_empty!24849)))

(declare-fun mapIsEmpty!38915 () Bool)

(assert (=> mapIsEmpty!38915 mapRes!38915))

(declare-fun mapNonEmpty!38915 () Bool)

(declare-fun tp!74649 () Bool)

(assert (=> mapNonEmpty!38915 (= mapRes!38915 (and tp!74649 e!592440))))

(declare-fun mapValue!38915 () ValueCell!11721)

(declare-fun mapRest!38915 () (Array (_ BitVec 32) ValueCell!11721))

(declare-fun mapKey!38915 () (_ BitVec 32))

(assert (=> mapNonEmpty!38915 (= mapRest!38909 (store mapRest!38915 mapKey!38915 mapValue!38915))))

(declare-fun b!1045211 () Bool)

(assert (=> b!1045211 (= e!592441 tp_is_empty!24849)))

(assert (= (and mapNonEmpty!38909 condMapEmpty!38915) mapIsEmpty!38915))

(assert (= (and mapNonEmpty!38909 (not condMapEmpty!38915)) mapNonEmpty!38915))

(assert (= (and mapNonEmpty!38915 ((_ is ValueCellFull!11721) mapValue!38915)) b!1045210))

(assert (= (and mapNonEmpty!38909 ((_ is ValueCellFull!11721) mapDefault!38915)) b!1045211))

(declare-fun m!964869 () Bool)

(assert (=> mapNonEmpty!38915 m!964869))

(declare-fun b_lambda!16279 () Bool)

(assert (= b_lambda!16277 (or (and b!1044953 b_free!21129) b_lambda!16279)))

(declare-fun b_lambda!16281 () Bool)

(assert (= b_lambda!16271 (or (and b!1044953 b_free!21129) b_lambda!16281)))

(declare-fun b_lambda!16283 () Bool)

(assert (= b_lambda!16273 (or (and b!1044953 b_free!21129) b_lambda!16283)))

(check-sat (not b!1045167) (not mapNonEmpty!38915) (not d!126487) (not d!126473) (not b!1045130) (not b!1045201) (not b!1045012) (not bm!44466) (not b!1045202) (not b!1044998) (not b_lambda!16281) (not bm!44472) (not b!1045067) (not b!1045203) (not b!1045158) (not d!126495) (not b!1045161) (not b!1045097) (not bm!44464) (not b!1045125) (not d!126471) (not b!1045109) (not b_lambda!16279) (not d!126467) (not b!1045139) (not bm!44451) (not b!1045009) (not b!1045070) (not b!1044992) (not b!1045087) (not b!1045065) (not b!1045170) (not bm!44450) (not b!1045192) (not d!126483) (not b!1045115) (not b!1045072) (not b!1045095) (not b_lambda!16269) (not bm!44460) (not bm!44473) (not b!1045153) (not b!1045063) (not d!126481) (not b!1045172) (not b_next!21129) (not b!1045056) (not bm!44471) (not bm!44467) (not b!1045165) (not bm!44457) (not d!126477) (not b_lambda!16283) (not b!1045058) b_and!33743 (not bm!44453) (not b!1045100) (not b!1045156) (not b!1045128) (not bm!44433) (not d!126459) (not b!1045163) (not b!1045137) tp_is_empty!24849 (not b!1045118) (not b!1045111) (not b!1045122) (not b!1045134) (not b!1045132) (not bm!44465) (not bm!44461) (not b!1045155) (not b!1045123) (not bm!44452) (not d!126497) (not b!1045013) (not d!126485) (not d!126465) (not b!1045061) (not bm!44474) (not b_lambda!16275) (not b!1045152))
(check-sat b_and!33743 (not b_next!21129))
