; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89610 () Bool)

(assert start!89610)

(declare-fun b!1027769 () Bool)

(declare-fun b_free!20577 () Bool)

(declare-fun b_next!20577 () Bool)

(assert (=> b!1027769 (= b_free!20577 (not b_next!20577))))

(declare-fun tp!72780 () Bool)

(declare-fun b_and!32837 () Bool)

(assert (=> b!1027769 (= tp!72780 b_and!32837)))

(declare-fun res!687856 () Bool)

(declare-fun e!580092 () Bool)

(assert (=> start!89610 (=> (not res!687856) (not e!580092))))

(declare-datatypes ((V!37269 0))(
  ( (V!37270 (val!12199 Int)) )
))
(declare-datatypes ((ValueCell!11445 0))(
  ( (ValueCellFull!11445 (v!14768 V!37269)) (EmptyCell!11445) )
))
(declare-datatypes ((array!64646 0))(
  ( (array!64647 (arr!31131 (Array (_ BitVec 32) (_ BitVec 64))) (size!31644 (_ BitVec 32))) )
))
(declare-datatypes ((array!64648 0))(
  ( (array!64649 (arr!31132 (Array (_ BitVec 32) ValueCell!11445)) (size!31645 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5484 0))(
  ( (LongMapFixedSize!5485 (defaultEntry!6096 Int) (mask!29820 (_ BitVec 32)) (extraKeys!5828 (_ BitVec 32)) (zeroValue!5932 V!37269) (minValue!5932 V!37269) (_size!2797 (_ BitVec 32)) (_keys!11245 array!64646) (_values!6119 array!64648) (_vacant!2797 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5484)

(declare-fun valid!2077 (LongMapFixedSize!5484) Bool)

(assert (=> start!89610 (= res!687856 (valid!2077 thiss!1427))))

(assert (=> start!89610 e!580092))

(declare-fun e!580095 () Bool)

(assert (=> start!89610 e!580095))

(assert (=> start!89610 true))

(declare-fun b!1027764 () Bool)

(declare-fun e!580091 () Bool)

(declare-fun tp_is_empty!24297 () Bool)

(assert (=> b!1027764 (= e!580091 tp_is_empty!24297)))

(declare-fun mapNonEmpty!37877 () Bool)

(declare-fun mapRes!37877 () Bool)

(declare-fun tp!72779 () Bool)

(declare-fun e!580094 () Bool)

(assert (=> mapNonEmpty!37877 (= mapRes!37877 (and tp!72779 e!580094))))

(declare-fun mapRest!37877 () (Array (_ BitVec 32) ValueCell!11445))

(declare-fun mapKey!37877 () (_ BitVec 32))

(declare-fun mapValue!37877 () ValueCell!11445)

(assert (=> mapNonEmpty!37877 (= (arr!31132 (_values!6119 thiss!1427)) (store mapRest!37877 mapKey!37877 mapValue!37877))))

(declare-fun b!1027765 () Bool)

(declare-fun e!580089 () Bool)

(declare-fun e!580093 () Bool)

(assert (=> b!1027765 (= e!580089 (not e!580093))))

(declare-fun res!687854 () Bool)

(assert (=> b!1027765 (=> res!687854 e!580093)))

(declare-datatypes ((Unit!33555 0))(
  ( (Unit!33556) )
))
(declare-datatypes ((tuple2!15534 0))(
  ( (tuple2!15535 (_1!7778 Unit!33555) (_2!7778 LongMapFixedSize!5484)) )
))
(declare-fun lt!452524 () tuple2!15534)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027765 (= res!687854 (not (validMask!0 (mask!29820 (_2!7778 lt!452524)))))))

(declare-fun lt!452522 () array!64646)

(declare-fun lt!452525 () array!64648)

(declare-fun Unit!33557 () Unit!33555)

(declare-fun Unit!33558 () Unit!33555)

(assert (=> b!1027765 (= lt!452524 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2797 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15535 Unit!33557 (LongMapFixedSize!5485 (defaultEntry!6096 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) (bvsub (_size!2797 thiss!1427) #b00000000000000000000000000000001) lt!452522 lt!452525 (bvadd #b00000000000000000000000000000001 (_vacant!2797 thiss!1427)))) (tuple2!15535 Unit!33558 (LongMapFixedSize!5485 (defaultEntry!6096 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) (bvsub (_size!2797 thiss!1427) #b00000000000000000000000000000001) lt!452522 lt!452525 (_vacant!2797 thiss!1427)))))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15536 0))(
  ( (tuple2!15537 (_1!7779 (_ BitVec 64)) (_2!7779 V!37269)) )
))
(declare-datatypes ((List!21811 0))(
  ( (Nil!21808) (Cons!21807 (h!23005 tuple2!15536) (t!30883 List!21811)) )
))
(declare-datatypes ((ListLongMap!13671 0))(
  ( (ListLongMap!13672 (toList!6851 List!21811)) )
))
(declare-fun -!478 (ListLongMap!13671 (_ BitVec 64)) ListLongMap!13671)

(declare-fun getCurrentListMap!3899 (array!64646 array!64648 (_ BitVec 32) (_ BitVec 32) V!37269 V!37269 (_ BitVec 32) Int) ListLongMap!13671)

(assert (=> b!1027765 (= (-!478 (getCurrentListMap!3899 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)) key!909) (getCurrentListMap!3899 lt!452522 lt!452525 (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9677 0))(
  ( (MissingZero!9677 (index!41079 (_ BitVec 32))) (Found!9677 (index!41080 (_ BitVec 32))) (Intermediate!9677 (undefined!10489 Bool) (index!41081 (_ BitVec 32)) (x!91463 (_ BitVec 32))) (Undefined!9677) (MissingVacant!9677 (index!41082 (_ BitVec 32))) )
))
(declare-fun lt!452520 () SeekEntryResult!9677)

(declare-fun dynLambda!1948 (Int (_ BitVec 64)) V!37269)

(assert (=> b!1027765 (= lt!452525 (array!64649 (store (arr!31132 (_values!6119 thiss!1427)) (index!41080 lt!452520) (ValueCellFull!11445 (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31645 (_values!6119 thiss!1427))))))

(declare-fun lt!452528 () Unit!33555)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!4 (array!64646 array!64648 (_ BitVec 32) (_ BitVec 32) V!37269 V!37269 (_ BitVec 32) (_ BitVec 64) Int) Unit!33555)

(assert (=> b!1027765 (= lt!452528 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!4 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) (index!41080 lt!452520) key!909 (defaultEntry!6096 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027765 (not (arrayContainsKey!0 lt!452522 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!452526 () Unit!33555)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64646 (_ BitVec 32) (_ BitVec 64)) Unit!33555)

(assert (=> b!1027765 (= lt!452526 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11245 thiss!1427) (index!41080 lt!452520) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64646 (_ BitVec 32)) Bool)

(assert (=> b!1027765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452522 (mask!29820 thiss!1427))))

(declare-fun lt!452527 () Unit!33555)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64646 (_ BitVec 32) (_ BitVec 32)) Unit!33555)

(assert (=> b!1027765 (= lt!452527 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11245 thiss!1427) (index!41080 lt!452520) (mask!29820 thiss!1427)))))

(declare-datatypes ((List!21812 0))(
  ( (Nil!21809) (Cons!21808 (h!23006 (_ BitVec 64)) (t!30884 List!21812)) )
))
(declare-fun arrayNoDuplicates!0 (array!64646 (_ BitVec 32) List!21812) Bool)

(assert (=> b!1027765 (arrayNoDuplicates!0 lt!452522 #b00000000000000000000000000000000 Nil!21809)))

(declare-fun lt!452523 () Unit!33555)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64646 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21812) Unit!33555)

(assert (=> b!1027765 (= lt!452523 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11245 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41080 lt!452520) #b00000000000000000000000000000000 Nil!21809))))

(declare-fun arrayCountValidKeys!0 (array!64646 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027765 (= (arrayCountValidKeys!0 lt!452522 #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11245 thiss!1427) #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027765 (= lt!452522 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))))))

(declare-fun lt!452521 () Unit!33555)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64646 (_ BitVec 32) (_ BitVec 64)) Unit!33555)

(assert (=> b!1027765 (= lt!452521 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11245 thiss!1427) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027766 () Bool)

(assert (=> b!1027766 (= e!580093 (= (size!31645 (_values!6119 (_2!7778 lt!452524))) (bvadd #b00000000000000000000000000000001 (mask!29820 (_2!7778 lt!452524)))))))

(declare-fun b!1027767 () Bool)

(assert (=> b!1027767 (= e!580094 tp_is_empty!24297)))

(declare-fun mapIsEmpty!37877 () Bool)

(assert (=> mapIsEmpty!37877 mapRes!37877))

(declare-fun b!1027768 () Bool)

(declare-fun res!687857 () Bool)

(assert (=> b!1027768 (=> (not res!687857) (not e!580092))))

(assert (=> b!1027768 (= res!687857 (not (= key!909 (bvneg key!909))))))

(declare-fun e!580090 () Bool)

(declare-fun array_inv!24101 (array!64646) Bool)

(declare-fun array_inv!24102 (array!64648) Bool)

(assert (=> b!1027769 (= e!580095 (and tp!72780 tp_is_empty!24297 (array_inv!24101 (_keys!11245 thiss!1427)) (array_inv!24102 (_values!6119 thiss!1427)) e!580090))))

(declare-fun b!1027770 () Bool)

(assert (=> b!1027770 (= e!580090 (and e!580091 mapRes!37877))))

(declare-fun condMapEmpty!37877 () Bool)

(declare-fun mapDefault!37877 () ValueCell!11445)

(assert (=> b!1027770 (= condMapEmpty!37877 (= (arr!31132 (_values!6119 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11445)) mapDefault!37877)))))

(declare-fun b!1027771 () Bool)

(assert (=> b!1027771 (= e!580092 e!580089)))

(declare-fun res!687855 () Bool)

(assert (=> b!1027771 (=> (not res!687855) (not e!580089))))

(get-info :version)

(assert (=> b!1027771 (= res!687855 ((_ is Found!9677) lt!452520))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64646 (_ BitVec 32)) SeekEntryResult!9677)

(assert (=> b!1027771 (= lt!452520 (seekEntry!0 key!909 (_keys!11245 thiss!1427) (mask!29820 thiss!1427)))))

(assert (= (and start!89610 res!687856) b!1027768))

(assert (= (and b!1027768 res!687857) b!1027771))

(assert (= (and b!1027771 res!687855) b!1027765))

(assert (= (and b!1027765 (not res!687854)) b!1027766))

(assert (= (and b!1027770 condMapEmpty!37877) mapIsEmpty!37877))

(assert (= (and b!1027770 (not condMapEmpty!37877)) mapNonEmpty!37877))

(assert (= (and mapNonEmpty!37877 ((_ is ValueCellFull!11445) mapValue!37877)) b!1027767))

(assert (= (and b!1027770 ((_ is ValueCellFull!11445) mapDefault!37877)) b!1027764))

(assert (= b!1027769 b!1027770))

(assert (= start!89610 b!1027769))

(declare-fun b_lambda!15741 () Bool)

(assert (=> (not b_lambda!15741) (not b!1027765)))

(declare-fun t!30882 () Bool)

(declare-fun tb!6895 () Bool)

(assert (=> (and b!1027769 (= (defaultEntry!6096 thiss!1427) (defaultEntry!6096 thiss!1427)) t!30882) tb!6895))

(declare-fun result!14107 () Bool)

(assert (=> tb!6895 (= result!14107 tp_is_empty!24297)))

(assert (=> b!1027765 t!30882))

(declare-fun b_and!32839 () Bool)

(assert (= b_and!32837 (and (=> t!30882 result!14107) b_and!32839)))

(declare-fun m!946311 () Bool)

(assert (=> b!1027765 m!946311))

(declare-fun m!946313 () Bool)

(assert (=> b!1027765 m!946313))

(declare-fun m!946315 () Bool)

(assert (=> b!1027765 m!946315))

(declare-fun m!946317 () Bool)

(assert (=> b!1027765 m!946317))

(declare-fun m!946319 () Bool)

(assert (=> b!1027765 m!946319))

(declare-fun m!946321 () Bool)

(assert (=> b!1027765 m!946321))

(declare-fun m!946323 () Bool)

(assert (=> b!1027765 m!946323))

(declare-fun m!946325 () Bool)

(assert (=> b!1027765 m!946325))

(declare-fun m!946327 () Bool)

(assert (=> b!1027765 m!946327))

(declare-fun m!946329 () Bool)

(assert (=> b!1027765 m!946329))

(declare-fun m!946331 () Bool)

(assert (=> b!1027765 m!946331))

(declare-fun m!946333 () Bool)

(assert (=> b!1027765 m!946333))

(declare-fun m!946335 () Bool)

(assert (=> b!1027765 m!946335))

(declare-fun m!946337 () Bool)

(assert (=> b!1027765 m!946337))

(assert (=> b!1027765 m!946323))

(declare-fun m!946339 () Bool)

(assert (=> b!1027765 m!946339))

(declare-fun m!946341 () Bool)

(assert (=> b!1027765 m!946341))

(declare-fun m!946343 () Bool)

(assert (=> b!1027765 m!946343))

(declare-fun m!946345 () Bool)

(assert (=> b!1027769 m!946345))

(declare-fun m!946347 () Bool)

(assert (=> b!1027769 m!946347))

(declare-fun m!946349 () Bool)

(assert (=> start!89610 m!946349))

(declare-fun m!946351 () Bool)

(assert (=> b!1027771 m!946351))

(declare-fun m!946353 () Bool)

(assert (=> mapNonEmpty!37877 m!946353))

(check-sat (not b!1027769) (not b_next!20577) (not mapNonEmpty!37877) (not b!1027765) b_and!32839 (not b_lambda!15741) tp_is_empty!24297 (not start!89610) (not b!1027771))
(check-sat b_and!32839 (not b_next!20577))
(get-model)

(declare-fun b_lambda!15745 () Bool)

(assert (= b_lambda!15741 (or (and b!1027769 b_free!20577) b_lambda!15745)))

(check-sat (not b!1027769) (not b_next!20577) (not mapNonEmpty!37877) (not b!1027765) tp_is_empty!24297 (not start!89610) (not b!1027771) (not b_lambda!15745) b_and!32839)
(check-sat b_and!32839 (not b_next!20577))
(get-model)

(declare-fun bm!43280 () Bool)

(declare-fun call!43283 () (_ BitVec 32))

(assert (=> bm!43280 (= call!43283 (arrayCountValidKeys!0 lt!452522 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31644 (_keys!11245 thiss!1427))))))

(declare-fun b!1027808 () Bool)

(declare-fun e!580125 () (_ BitVec 32))

(assert (=> b!1027808 (= e!580125 (bvadd #b00000000000000000000000000000001 call!43283))))

(declare-fun b!1027809 () Bool)

(assert (=> b!1027809 (= e!580125 call!43283)))

(declare-fun d!122745 () Bool)

(declare-fun lt!452558 () (_ BitVec 32))

(assert (=> d!122745 (and (bvsge lt!452558 #b00000000000000000000000000000000) (bvsle lt!452558 (bvsub (size!31644 lt!452522) #b00000000000000000000000000000000)))))

(declare-fun e!580126 () (_ BitVec 32))

(assert (=> d!122745 (= lt!452558 e!580126)))

(declare-fun c!103623 () Bool)

(assert (=> d!122745 (= c!103623 (bvsge #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))))))

(assert (=> d!122745 (and (bvsle #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31644 (_keys!11245 thiss!1427)) (size!31644 lt!452522)))))

(assert (=> d!122745 (= (arrayCountValidKeys!0 lt!452522 #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))) lt!452558)))

(declare-fun b!1027810 () Bool)

(assert (=> b!1027810 (= e!580126 #b00000000000000000000000000000000)))

(declare-fun b!1027811 () Bool)

(assert (=> b!1027811 (= e!580126 e!580125)))

(declare-fun c!103622 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1027811 (= c!103622 (validKeyInArray!0 (select (arr!31131 lt!452522) #b00000000000000000000000000000000)))))

(assert (= (and d!122745 c!103623) b!1027810))

(assert (= (and d!122745 (not c!103623)) b!1027811))

(assert (= (and b!1027811 c!103622) b!1027808))

(assert (= (and b!1027811 (not c!103622)) b!1027809))

(assert (= (or b!1027808 b!1027809) bm!43280))

(declare-fun m!946399 () Bool)

(assert (=> bm!43280 m!946399))

(declare-fun m!946401 () Bool)

(assert (=> b!1027811 m!946401))

(assert (=> b!1027811 m!946401))

(declare-fun m!946403 () Bool)

(assert (=> b!1027811 m!946403))

(assert (=> b!1027765 d!122745))

(declare-fun d!122747 () Bool)

(declare-fun res!687874 () Bool)

(declare-fun e!580131 () Bool)

(assert (=> d!122747 (=> res!687874 e!580131)))

(assert (=> d!122747 (= res!687874 (= (select (arr!31131 lt!452522) #b00000000000000000000000000000000) key!909))))

(assert (=> d!122747 (= (arrayContainsKey!0 lt!452522 key!909 #b00000000000000000000000000000000) e!580131)))

(declare-fun b!1027816 () Bool)

(declare-fun e!580132 () Bool)

(assert (=> b!1027816 (= e!580131 e!580132)))

(declare-fun res!687875 () Bool)

(assert (=> b!1027816 (=> (not res!687875) (not e!580132))))

(assert (=> b!1027816 (= res!687875 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31644 lt!452522)))))

(declare-fun b!1027817 () Bool)

(assert (=> b!1027817 (= e!580132 (arrayContainsKey!0 lt!452522 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!122747 (not res!687874)) b!1027816))

(assert (= (and b!1027816 res!687875) b!1027817))

(assert (=> d!122747 m!946401))

(declare-fun m!946405 () Bool)

(assert (=> b!1027817 m!946405))

(assert (=> b!1027765 d!122747))

(declare-fun d!122749 () Bool)

(assert (=> d!122749 (= (validMask!0 (mask!29820 (_2!7778 lt!452524))) (and (or (= (mask!29820 (_2!7778 lt!452524)) #b00000000000000000000000000000111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000000000000000000000001111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000000000000000000000011111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000000000000000000000111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000000000000000000001111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000000000000000000011111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000000000000000000111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000000000000000001111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000000000000000011111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000000000000000111111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000000000000001111111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000000000000011111111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000000000000111111111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000000000001111111111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000000000011111111111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000000000111111111111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000000001111111111111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000000011111111111111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000000111111111111111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000001111111111111111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000011111111111111111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000000111111111111111111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000001111111111111111111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000011111111111111111111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00000111111111111111111111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00001111111111111111111111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00011111111111111111111111111111) (= (mask!29820 (_2!7778 lt!452524)) #b00111111111111111111111111111111)) (bvsle (mask!29820 (_2!7778 lt!452524)) #b00111111111111111111111111111111)))))

(assert (=> b!1027765 d!122749))

(declare-fun d!122751 () Bool)

(declare-fun e!580135 () Bool)

(assert (=> d!122751 e!580135))

(declare-fun res!687878 () Bool)

(assert (=> d!122751 (=> (not res!687878) (not e!580135))))

(assert (=> d!122751 (= res!687878 (and (bvsge (index!41080 lt!452520) #b00000000000000000000000000000000) (bvslt (index!41080 lt!452520) (size!31644 (_keys!11245 thiss!1427)))))))

(declare-fun lt!452561 () Unit!33555)

(declare-fun choose!53 (array!64646 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21812) Unit!33555)

(assert (=> d!122751 (= lt!452561 (choose!53 (_keys!11245 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41080 lt!452520) #b00000000000000000000000000000000 Nil!21809))))

(assert (=> d!122751 (bvslt (size!31644 (_keys!11245 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!122751 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11245 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41080 lt!452520) #b00000000000000000000000000000000 Nil!21809) lt!452561)))

(declare-fun b!1027820 () Bool)

(assert (=> b!1027820 (= e!580135 (arrayNoDuplicates!0 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) #b00000000000000000000000000000000 Nil!21809))))

(assert (= (and d!122751 res!687878) b!1027820))

(declare-fun m!946407 () Bool)

(assert (=> d!122751 m!946407))

(assert (=> b!1027820 m!946335))

(declare-fun m!946409 () Bool)

(assert (=> b!1027820 m!946409))

(assert (=> b!1027765 d!122751))

(declare-fun b!1027832 () Bool)

(declare-fun e!580140 () Bool)

(assert (=> b!1027832 (= e!580140 (= (arrayCountValidKeys!0 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11245 thiss!1427) #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1027831 () Bool)

(declare-fun e!580141 () Bool)

(assert (=> b!1027831 (= e!580141 (bvslt (size!31644 (_keys!11245 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1027829 () Bool)

(declare-fun res!687888 () Bool)

(assert (=> b!1027829 (=> (not res!687888) (not e!580141))))

(assert (=> b!1027829 (= res!687888 (validKeyInArray!0 (select (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520))))))

(declare-fun b!1027830 () Bool)

(declare-fun res!687889 () Bool)

(assert (=> b!1027830 (=> (not res!687889) (not e!580141))))

(assert (=> b!1027830 (= res!687889 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!122753 () Bool)

(assert (=> d!122753 e!580140))

(declare-fun res!687890 () Bool)

(assert (=> d!122753 (=> (not res!687890) (not e!580140))))

(assert (=> d!122753 (= res!687890 (and (bvsge (index!41080 lt!452520) #b00000000000000000000000000000000) (bvslt (index!41080 lt!452520) (size!31644 (_keys!11245 thiss!1427)))))))

(declare-fun lt!452564 () Unit!33555)

(declare-fun choose!82 (array!64646 (_ BitVec 32) (_ BitVec 64)) Unit!33555)

(assert (=> d!122753 (= lt!452564 (choose!82 (_keys!11245 thiss!1427) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!122753 e!580141))

(declare-fun res!687887 () Bool)

(assert (=> d!122753 (=> (not res!687887) (not e!580141))))

(assert (=> d!122753 (= res!687887 (and (bvsge (index!41080 lt!452520) #b00000000000000000000000000000000) (bvslt (index!41080 lt!452520) (size!31644 (_keys!11245 thiss!1427)))))))

(assert (=> d!122753 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11245 thiss!1427) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) lt!452564)))

(assert (= (and d!122753 res!687887) b!1027829))

(assert (= (and b!1027829 res!687888) b!1027830))

(assert (= (and b!1027830 res!687889) b!1027831))

(assert (= (and d!122753 res!687890) b!1027832))

(assert (=> b!1027832 m!946335))

(declare-fun m!946411 () Bool)

(assert (=> b!1027832 m!946411))

(assert (=> b!1027832 m!946319))

(declare-fun m!946413 () Bool)

(assert (=> b!1027829 m!946413))

(assert (=> b!1027829 m!946413))

(declare-fun m!946415 () Bool)

(assert (=> b!1027829 m!946415))

(declare-fun m!946417 () Bool)

(assert (=> b!1027830 m!946417))

(declare-fun m!946419 () Bool)

(assert (=> d!122753 m!946419))

(assert (=> b!1027765 d!122753))

(declare-fun b!1027875 () Bool)

(declare-fun res!687911 () Bool)

(declare-fun e!580177 () Bool)

(assert (=> b!1027875 (=> (not res!687911) (not e!580177))))

(declare-fun e!580180 () Bool)

(assert (=> b!1027875 (= res!687911 e!580180)))

(declare-fun c!103638 () Bool)

(assert (=> b!1027875 (= c!103638 (not (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1027876 () Bool)

(declare-fun call!43303 () Bool)

(assert (=> b!1027876 (= e!580180 (not call!43303))))

(declare-fun bm!43295 () Bool)

(declare-fun call!43304 () ListLongMap!13671)

(declare-fun call!43301 () ListLongMap!13671)

(assert (=> bm!43295 (= call!43304 call!43301)))

(declare-fun b!1027878 () Bool)

(declare-fun e!580179 () Unit!33555)

(declare-fun Unit!33563 () Unit!33555)

(assert (=> b!1027878 (= e!580179 Unit!33563)))

(declare-fun b!1027879 () Bool)

(declare-fun res!687914 () Bool)

(assert (=> b!1027879 (=> (not res!687914) (not e!580177))))

(declare-fun e!580173 () Bool)

(assert (=> b!1027879 (= res!687914 e!580173)))

(declare-fun res!687916 () Bool)

(assert (=> b!1027879 (=> res!687916 e!580173)))

(declare-fun e!580175 () Bool)

(assert (=> b!1027879 (= res!687916 (not e!580175))))

(declare-fun res!687912 () Bool)

(assert (=> b!1027879 (=> (not res!687912) (not e!580175))))

(assert (=> b!1027879 (= res!687912 (bvslt #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))))))

(declare-fun bm!43296 () Bool)

(declare-fun call!43302 () ListLongMap!13671)

(assert (=> bm!43296 (= call!43302 call!43304)))

(declare-fun b!1027880 () Bool)

(assert (=> b!1027880 (= e!580175 (validKeyInArray!0 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43297 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3514 (array!64646 array!64648 (_ BitVec 32) (_ BitVec 32) V!37269 V!37269 (_ BitVec 32) Int) ListLongMap!13671)

(assert (=> bm!43297 (= call!43301 (getCurrentListMapNoExtraKeys!3514 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))))

(declare-fun b!1027881 () Bool)

(declare-fun e!580174 () Bool)

(assert (=> b!1027881 (= e!580177 e!580174)))

(declare-fun c!103637 () Bool)

(assert (=> b!1027881 (= c!103637 (not (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1027882 () Bool)

(declare-fun e!580171 () ListLongMap!13671)

(declare-fun call!43298 () ListLongMap!13671)

(assert (=> b!1027882 (= e!580171 call!43298)))

(declare-fun b!1027883 () Bool)

(declare-fun e!580168 () Bool)

(assert (=> b!1027883 (= e!580168 (validKeyInArray!0 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1027884 () Bool)

(declare-fun call!43300 () Bool)

(assert (=> b!1027884 (= e!580174 (not call!43300))))

(declare-fun b!1027885 () Bool)

(assert (=> b!1027885 (= e!580171 call!43302)))

(declare-fun bm!43298 () Bool)

(declare-fun lt!452618 () ListLongMap!13671)

(declare-fun contains!5964 (ListLongMap!13671 (_ BitVec 64)) Bool)

(assert (=> bm!43298 (= call!43300 (contains!5964 lt!452618 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027886 () Bool)

(declare-fun e!580170 () ListLongMap!13671)

(declare-fun e!580176 () ListLongMap!13671)

(assert (=> b!1027886 (= e!580170 e!580176)))

(declare-fun c!103639 () Bool)

(assert (=> b!1027886 (= c!103639 (and (not (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1027887 () Bool)

(declare-fun c!103641 () Bool)

(assert (=> b!1027887 (= c!103641 (and (not (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1027887 (= e!580176 e!580171)))

(declare-fun b!1027888 () Bool)

(declare-fun e!580178 () Bool)

(assert (=> b!1027888 (= e!580173 e!580178)))

(declare-fun res!687915 () Bool)

(assert (=> b!1027888 (=> (not res!687915) (not e!580178))))

(assert (=> b!1027888 (= res!687915 (contains!5964 lt!452618 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1027888 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))))))

(declare-fun d!122755 () Bool)

(assert (=> d!122755 e!580177))

(declare-fun res!687910 () Bool)

(assert (=> d!122755 (=> (not res!687910) (not e!580177))))

(assert (=> d!122755 (= res!687910 (or (bvsge #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))))))))

(declare-fun lt!452628 () ListLongMap!13671)

(assert (=> d!122755 (= lt!452618 lt!452628)))

(declare-fun lt!452610 () Unit!33555)

(assert (=> d!122755 (= lt!452610 e!580179)))

(declare-fun c!103636 () Bool)

(assert (=> d!122755 (= c!103636 e!580168)))

(declare-fun res!687909 () Bool)

(assert (=> d!122755 (=> (not res!687909) (not e!580168))))

(assert (=> d!122755 (= res!687909 (bvslt #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))))))

(assert (=> d!122755 (= lt!452628 e!580170)))

(declare-fun c!103640 () Bool)

(assert (=> d!122755 (= c!103640 (and (not (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!122755 (validMask!0 (mask!29820 thiss!1427))))

(assert (=> d!122755 (= (getCurrentListMap!3899 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)) lt!452618)))

(declare-fun b!1027877 () Bool)

(assert (=> b!1027877 (= e!580176 call!43298)))

(declare-fun b!1027889 () Bool)

(declare-fun apply!900 (ListLongMap!13671 (_ BitVec 64)) V!37269)

(declare-fun get!16341 (ValueCell!11445 V!37269) V!37269)

(assert (=> b!1027889 (= e!580178 (= (apply!900 lt!452618 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)) (get!16341 (select (arr!31132 (_values!6119 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1027889 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31645 (_values!6119 thiss!1427))))))

(assert (=> b!1027889 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))))))

(declare-fun b!1027890 () Bool)

(declare-fun e!580169 () Bool)

(assert (=> b!1027890 (= e!580174 e!580169)))

(declare-fun res!687913 () Bool)

(assert (=> b!1027890 (= res!687913 call!43300)))

(assert (=> b!1027890 (=> (not res!687913) (not e!580169))))

(declare-fun b!1027891 () Bool)

(declare-fun e!580172 () Bool)

(assert (=> b!1027891 (= e!580172 (= (apply!900 lt!452618 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5932 thiss!1427)))))

(declare-fun bm!43299 () Bool)

(assert (=> bm!43299 (= call!43303 (contains!5964 lt!452618 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43300 () Bool)

(declare-fun call!43299 () ListLongMap!13671)

(assert (=> bm!43300 (= call!43298 call!43299)))

(declare-fun b!1027892 () Bool)

(assert (=> b!1027892 (= e!580180 e!580172)))

(declare-fun res!687917 () Bool)

(assert (=> b!1027892 (= res!687917 call!43303)))

(assert (=> b!1027892 (=> (not res!687917) (not e!580172))))

(declare-fun b!1027893 () Bool)

(declare-fun lt!452622 () Unit!33555)

(assert (=> b!1027893 (= e!580179 lt!452622)))

(declare-fun lt!452612 () ListLongMap!13671)

(assert (=> b!1027893 (= lt!452612 (getCurrentListMapNoExtraKeys!3514 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))))

(declare-fun lt!452617 () (_ BitVec 64))

(assert (=> b!1027893 (= lt!452617 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452629 () (_ BitVec 64))

(assert (=> b!1027893 (= lt!452629 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452611 () Unit!33555)

(declare-fun addStillContains!619 (ListLongMap!13671 (_ BitVec 64) V!37269 (_ BitVec 64)) Unit!33555)

(assert (=> b!1027893 (= lt!452611 (addStillContains!619 lt!452612 lt!452617 (zeroValue!5932 thiss!1427) lt!452629))))

(declare-fun +!3098 (ListLongMap!13671 tuple2!15536) ListLongMap!13671)

(assert (=> b!1027893 (contains!5964 (+!3098 lt!452612 (tuple2!15537 lt!452617 (zeroValue!5932 thiss!1427))) lt!452629)))

(declare-fun lt!452619 () Unit!33555)

(assert (=> b!1027893 (= lt!452619 lt!452611)))

(declare-fun lt!452620 () ListLongMap!13671)

(assert (=> b!1027893 (= lt!452620 (getCurrentListMapNoExtraKeys!3514 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))))

(declare-fun lt!452623 () (_ BitVec 64))

(assert (=> b!1027893 (= lt!452623 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452613 () (_ BitVec 64))

(assert (=> b!1027893 (= lt!452613 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452624 () Unit!33555)

(declare-fun addApplyDifferent!479 (ListLongMap!13671 (_ BitVec 64) V!37269 (_ BitVec 64)) Unit!33555)

(assert (=> b!1027893 (= lt!452624 (addApplyDifferent!479 lt!452620 lt!452623 (minValue!5932 thiss!1427) lt!452613))))

(assert (=> b!1027893 (= (apply!900 (+!3098 lt!452620 (tuple2!15537 lt!452623 (minValue!5932 thiss!1427))) lt!452613) (apply!900 lt!452620 lt!452613))))

(declare-fun lt!452627 () Unit!33555)

(assert (=> b!1027893 (= lt!452627 lt!452624)))

(declare-fun lt!452615 () ListLongMap!13671)

(assert (=> b!1027893 (= lt!452615 (getCurrentListMapNoExtraKeys!3514 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))))

(declare-fun lt!452626 () (_ BitVec 64))

(assert (=> b!1027893 (= lt!452626 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452630 () (_ BitVec 64))

(assert (=> b!1027893 (= lt!452630 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452625 () Unit!33555)

(assert (=> b!1027893 (= lt!452625 (addApplyDifferent!479 lt!452615 lt!452626 (zeroValue!5932 thiss!1427) lt!452630))))

(assert (=> b!1027893 (= (apply!900 (+!3098 lt!452615 (tuple2!15537 lt!452626 (zeroValue!5932 thiss!1427))) lt!452630) (apply!900 lt!452615 lt!452630))))

(declare-fun lt!452609 () Unit!33555)

(assert (=> b!1027893 (= lt!452609 lt!452625)))

(declare-fun lt!452621 () ListLongMap!13671)

(assert (=> b!1027893 (= lt!452621 (getCurrentListMapNoExtraKeys!3514 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))))

(declare-fun lt!452616 () (_ BitVec 64))

(assert (=> b!1027893 (= lt!452616 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452614 () (_ BitVec 64))

(assert (=> b!1027893 (= lt!452614 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1027893 (= lt!452622 (addApplyDifferent!479 lt!452621 lt!452616 (minValue!5932 thiss!1427) lt!452614))))

(assert (=> b!1027893 (= (apply!900 (+!3098 lt!452621 (tuple2!15537 lt!452616 (minValue!5932 thiss!1427))) lt!452614) (apply!900 lt!452621 lt!452614))))

(declare-fun b!1027894 () Bool)

(assert (=> b!1027894 (= e!580169 (= (apply!900 lt!452618 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5932 thiss!1427)))))

(declare-fun bm!43301 () Bool)

(assert (=> bm!43301 (= call!43299 (+!3098 (ite c!103640 call!43301 (ite c!103639 call!43304 call!43302)) (ite (or c!103640 c!103639) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))))))

(declare-fun b!1027895 () Bool)

(assert (=> b!1027895 (= e!580170 (+!3098 call!43299 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))))))

(assert (= (and d!122755 c!103640) b!1027895))

(assert (= (and d!122755 (not c!103640)) b!1027886))

(assert (= (and b!1027886 c!103639) b!1027877))

(assert (= (and b!1027886 (not c!103639)) b!1027887))

(assert (= (and b!1027887 c!103641) b!1027882))

(assert (= (and b!1027887 (not c!103641)) b!1027885))

(assert (= (or b!1027882 b!1027885) bm!43296))

(assert (= (or b!1027877 bm!43296) bm!43295))

(assert (= (or b!1027877 b!1027882) bm!43300))

(assert (= (or b!1027895 bm!43295) bm!43297))

(assert (= (or b!1027895 bm!43300) bm!43301))

(assert (= (and d!122755 res!687909) b!1027883))

(assert (= (and d!122755 c!103636) b!1027893))

(assert (= (and d!122755 (not c!103636)) b!1027878))

(assert (= (and d!122755 res!687910) b!1027879))

(assert (= (and b!1027879 res!687912) b!1027880))

(assert (= (and b!1027879 (not res!687916)) b!1027888))

(assert (= (and b!1027888 res!687915) b!1027889))

(assert (= (and b!1027879 res!687914) b!1027875))

(assert (= (and b!1027875 c!103638) b!1027892))

(assert (= (and b!1027875 (not c!103638)) b!1027876))

(assert (= (and b!1027892 res!687917) b!1027891))

(assert (= (or b!1027892 b!1027876) bm!43299))

(assert (= (and b!1027875 res!687911) b!1027881))

(assert (= (and b!1027881 c!103637) b!1027890))

(assert (= (and b!1027881 (not c!103637)) b!1027884))

(assert (= (and b!1027890 res!687913) b!1027894))

(assert (= (or b!1027890 b!1027884) bm!43298))

(declare-fun b_lambda!15747 () Bool)

(assert (=> (not b_lambda!15747) (not b!1027889)))

(assert (=> b!1027889 t!30882))

(declare-fun b_and!32845 () Bool)

(assert (= b_and!32839 (and (=> t!30882 result!14107) b_and!32845)))

(assert (=> b!1027889 m!946343))

(declare-fun m!946421 () Bool)

(assert (=> b!1027889 m!946421))

(assert (=> b!1027889 m!946421))

(assert (=> b!1027889 m!946343))

(declare-fun m!946423 () Bool)

(assert (=> b!1027889 m!946423))

(declare-fun m!946425 () Bool)

(assert (=> b!1027889 m!946425))

(assert (=> b!1027889 m!946425))

(declare-fun m!946427 () Bool)

(assert (=> b!1027889 m!946427))

(assert (=> b!1027880 m!946425))

(assert (=> b!1027880 m!946425))

(declare-fun m!946429 () Bool)

(assert (=> b!1027880 m!946429))

(declare-fun m!946431 () Bool)

(assert (=> b!1027893 m!946431))

(declare-fun m!946433 () Bool)

(assert (=> b!1027893 m!946433))

(declare-fun m!946435 () Bool)

(assert (=> b!1027893 m!946435))

(declare-fun m!946437 () Bool)

(assert (=> b!1027893 m!946437))

(declare-fun m!946439 () Bool)

(assert (=> b!1027893 m!946439))

(declare-fun m!946441 () Bool)

(assert (=> b!1027893 m!946441))

(declare-fun m!946443 () Bool)

(assert (=> b!1027893 m!946443))

(assert (=> b!1027893 m!946425))

(declare-fun m!946445 () Bool)

(assert (=> b!1027893 m!946445))

(declare-fun m!946447 () Bool)

(assert (=> b!1027893 m!946447))

(declare-fun m!946449 () Bool)

(assert (=> b!1027893 m!946449))

(declare-fun m!946451 () Bool)

(assert (=> b!1027893 m!946451))

(declare-fun m!946453 () Bool)

(assert (=> b!1027893 m!946453))

(assert (=> b!1027893 m!946431))

(assert (=> b!1027893 m!946443))

(declare-fun m!946455 () Bool)

(assert (=> b!1027893 m!946455))

(assert (=> b!1027893 m!946435))

(assert (=> b!1027893 m!946449))

(declare-fun m!946457 () Bool)

(assert (=> b!1027893 m!946457))

(declare-fun m!946459 () Bool)

(assert (=> b!1027893 m!946459))

(declare-fun m!946461 () Bool)

(assert (=> b!1027893 m!946461))

(assert (=> b!1027888 m!946425))

(assert (=> b!1027888 m!946425))

(declare-fun m!946463 () Bool)

(assert (=> b!1027888 m!946463))

(declare-fun m!946465 () Bool)

(assert (=> bm!43301 m!946465))

(assert (=> b!1027883 m!946425))

(assert (=> b!1027883 m!946425))

(assert (=> b!1027883 m!946429))

(assert (=> bm!43297 m!946457))

(declare-fun m!946467 () Bool)

(assert (=> bm!43298 m!946467))

(declare-fun m!946469 () Bool)

(assert (=> b!1027894 m!946469))

(declare-fun m!946471 () Bool)

(assert (=> b!1027895 m!946471))

(declare-fun m!946473 () Bool)

(assert (=> bm!43299 m!946473))

(declare-fun m!946475 () Bool)

(assert (=> d!122755 m!946475))

(declare-fun m!946477 () Bool)

(assert (=> b!1027891 m!946477))

(assert (=> b!1027765 d!122755))

(declare-fun d!122757 () Bool)

(declare-fun lt!452633 () ListLongMap!13671)

(assert (=> d!122757 (not (contains!5964 lt!452633 key!909))))

(declare-fun removeStrictlySorted!50 (List!21811 (_ BitVec 64)) List!21811)

(assert (=> d!122757 (= lt!452633 (ListLongMap!13672 (removeStrictlySorted!50 (toList!6851 (getCurrentListMap!3899 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427))) key!909)))))

(assert (=> d!122757 (= (-!478 (getCurrentListMap!3899 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)) key!909) lt!452633)))

(declare-fun bs!29994 () Bool)

(assert (= bs!29994 d!122757))

(declare-fun m!946479 () Bool)

(assert (=> bs!29994 m!946479))

(declare-fun m!946481 () Bool)

(assert (=> bs!29994 m!946481))

(assert (=> b!1027765 d!122757))

(declare-fun d!122759 () Bool)

(declare-fun e!580183 () Bool)

(assert (=> d!122759 e!580183))

(declare-fun res!687920 () Bool)

(assert (=> d!122759 (=> (not res!687920) (not e!580183))))

(assert (=> d!122759 (= res!687920 (and (bvsge (index!41080 lt!452520) #b00000000000000000000000000000000) (bvslt (index!41080 lt!452520) (size!31644 (_keys!11245 thiss!1427)))))))

(declare-fun lt!452636 () Unit!33555)

(declare-fun choose!1682 (array!64646 array!64648 (_ BitVec 32) (_ BitVec 32) V!37269 V!37269 (_ BitVec 32) (_ BitVec 64) Int) Unit!33555)

(assert (=> d!122759 (= lt!452636 (choose!1682 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) (index!41080 lt!452520) key!909 (defaultEntry!6096 thiss!1427)))))

(assert (=> d!122759 (validMask!0 (mask!29820 thiss!1427))))

(assert (=> d!122759 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!4 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) (index!41080 lt!452520) key!909 (defaultEntry!6096 thiss!1427)) lt!452636)))

(declare-fun b!1027898 () Bool)

(assert (=> b!1027898 (= e!580183 (= (-!478 (getCurrentListMap!3899 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)) key!909) (getCurrentListMap!3899 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) (array!64649 (store (arr!31132 (_values!6119 thiss!1427)) (index!41080 lt!452520) (ValueCellFull!11445 (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31645 (_values!6119 thiss!1427))) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427))))))

(assert (=> b!1027898 (bvslt (index!41080 lt!452520) (size!31645 (_values!6119 thiss!1427)))))

(assert (= (and d!122759 res!687920) b!1027898))

(declare-fun b_lambda!15749 () Bool)

(assert (=> (not b_lambda!15749) (not b!1027898)))

(assert (=> b!1027898 t!30882))

(declare-fun b_and!32847 () Bool)

(assert (= b_and!32845 (and (=> t!30882 result!14107) b_and!32847)))

(declare-fun m!946483 () Bool)

(assert (=> d!122759 m!946483))

(assert (=> d!122759 m!946475))

(declare-fun m!946485 () Bool)

(assert (=> b!1027898 m!946485))

(assert (=> b!1027898 m!946323))

(assert (=> b!1027898 m!946339))

(assert (=> b!1027898 m!946343))

(assert (=> b!1027898 m!946323))

(assert (=> b!1027898 m!946335))

(assert (=> b!1027898 m!946331))

(assert (=> b!1027765 d!122759))

(declare-fun b!1027907 () Bool)

(declare-fun e!580192 () Bool)

(declare-fun call!43307 () Bool)

(assert (=> b!1027907 (= e!580192 call!43307)))

(declare-fun bm!43304 () Bool)

(assert (=> bm!43304 (= call!43307 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!452522 (mask!29820 thiss!1427)))))

(declare-fun b!1027908 () Bool)

(declare-fun e!580191 () Bool)

(assert (=> b!1027908 (= e!580191 e!580192)))

(declare-fun c!103644 () Bool)

(assert (=> b!1027908 (= c!103644 (validKeyInArray!0 (select (arr!31131 lt!452522) #b00000000000000000000000000000000)))))

(declare-fun b!1027910 () Bool)

(declare-fun e!580190 () Bool)

(assert (=> b!1027910 (= e!580190 call!43307)))

(declare-fun b!1027909 () Bool)

(assert (=> b!1027909 (= e!580192 e!580190)))

(declare-fun lt!452644 () (_ BitVec 64))

(assert (=> b!1027909 (= lt!452644 (select (arr!31131 lt!452522) #b00000000000000000000000000000000))))

(declare-fun lt!452643 () Unit!33555)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64646 (_ BitVec 64) (_ BitVec 32)) Unit!33555)

(assert (=> b!1027909 (= lt!452643 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!452522 lt!452644 #b00000000000000000000000000000000))))

(assert (=> b!1027909 (arrayContainsKey!0 lt!452522 lt!452644 #b00000000000000000000000000000000)))

(declare-fun lt!452645 () Unit!33555)

(assert (=> b!1027909 (= lt!452645 lt!452643)))

(declare-fun res!687925 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64646 (_ BitVec 32)) SeekEntryResult!9677)

(assert (=> b!1027909 (= res!687925 (= (seekEntryOrOpen!0 (select (arr!31131 lt!452522) #b00000000000000000000000000000000) lt!452522 (mask!29820 thiss!1427)) (Found!9677 #b00000000000000000000000000000000)))))

(assert (=> b!1027909 (=> (not res!687925) (not e!580190))))

(declare-fun d!122761 () Bool)

(declare-fun res!687926 () Bool)

(assert (=> d!122761 (=> res!687926 e!580191)))

(assert (=> d!122761 (= res!687926 (bvsge #b00000000000000000000000000000000 (size!31644 lt!452522)))))

(assert (=> d!122761 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452522 (mask!29820 thiss!1427)) e!580191)))

(assert (= (and d!122761 (not res!687926)) b!1027908))

(assert (= (and b!1027908 c!103644) b!1027909))

(assert (= (and b!1027908 (not c!103644)) b!1027907))

(assert (= (and b!1027909 res!687925) b!1027910))

(assert (= (or b!1027910 b!1027907) bm!43304))

(declare-fun m!946487 () Bool)

(assert (=> bm!43304 m!946487))

(assert (=> b!1027908 m!946401))

(assert (=> b!1027908 m!946401))

(assert (=> b!1027908 m!946403))

(assert (=> b!1027909 m!946401))

(declare-fun m!946489 () Bool)

(assert (=> b!1027909 m!946489))

(declare-fun m!946491 () Bool)

(assert (=> b!1027909 m!946491))

(assert (=> b!1027909 m!946401))

(declare-fun m!946493 () Bool)

(assert (=> b!1027909 m!946493))

(assert (=> b!1027765 d!122761))

(declare-fun b!1027911 () Bool)

(declare-fun res!687929 () Bool)

(declare-fun e!580202 () Bool)

(assert (=> b!1027911 (=> (not res!687929) (not e!580202))))

(declare-fun e!580205 () Bool)

(assert (=> b!1027911 (= res!687929 e!580205)))

(declare-fun c!103647 () Bool)

(assert (=> b!1027911 (= c!103647 (not (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1027912 () Bool)

(declare-fun call!43313 () Bool)

(assert (=> b!1027912 (= e!580205 (not call!43313))))

(declare-fun bm!43305 () Bool)

(declare-fun call!43314 () ListLongMap!13671)

(declare-fun call!43311 () ListLongMap!13671)

(assert (=> bm!43305 (= call!43314 call!43311)))

(declare-fun b!1027914 () Bool)

(declare-fun e!580204 () Unit!33555)

(declare-fun Unit!33564 () Unit!33555)

(assert (=> b!1027914 (= e!580204 Unit!33564)))

(declare-fun b!1027915 () Bool)

(declare-fun res!687932 () Bool)

(assert (=> b!1027915 (=> (not res!687932) (not e!580202))))

(declare-fun e!580198 () Bool)

(assert (=> b!1027915 (= res!687932 e!580198)))

(declare-fun res!687934 () Bool)

(assert (=> b!1027915 (=> res!687934 e!580198)))

(declare-fun e!580200 () Bool)

(assert (=> b!1027915 (= res!687934 (not e!580200))))

(declare-fun res!687930 () Bool)

(assert (=> b!1027915 (=> (not res!687930) (not e!580200))))

(assert (=> b!1027915 (= res!687930 (bvslt #b00000000000000000000000000000000 (size!31644 lt!452522)))))

(declare-fun bm!43306 () Bool)

(declare-fun call!43312 () ListLongMap!13671)

(assert (=> bm!43306 (= call!43312 call!43314)))

(declare-fun b!1027916 () Bool)

(assert (=> b!1027916 (= e!580200 (validKeyInArray!0 (select (arr!31131 lt!452522) #b00000000000000000000000000000000)))))

(declare-fun bm!43307 () Bool)

(assert (=> bm!43307 (= call!43311 (getCurrentListMapNoExtraKeys!3514 lt!452522 lt!452525 (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))))

(declare-fun b!1027917 () Bool)

(declare-fun e!580199 () Bool)

(assert (=> b!1027917 (= e!580202 e!580199)))

(declare-fun c!103646 () Bool)

(assert (=> b!1027917 (= c!103646 (not (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1027918 () Bool)

(declare-fun e!580196 () ListLongMap!13671)

(declare-fun call!43308 () ListLongMap!13671)

(assert (=> b!1027918 (= e!580196 call!43308)))

(declare-fun b!1027919 () Bool)

(declare-fun e!580193 () Bool)

(assert (=> b!1027919 (= e!580193 (validKeyInArray!0 (select (arr!31131 lt!452522) #b00000000000000000000000000000000)))))

(declare-fun b!1027920 () Bool)

(declare-fun call!43310 () Bool)

(assert (=> b!1027920 (= e!580199 (not call!43310))))

(declare-fun b!1027921 () Bool)

(assert (=> b!1027921 (= e!580196 call!43312)))

(declare-fun bm!43308 () Bool)

(declare-fun lt!452655 () ListLongMap!13671)

(assert (=> bm!43308 (= call!43310 (contains!5964 lt!452655 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027922 () Bool)

(declare-fun e!580195 () ListLongMap!13671)

(declare-fun e!580201 () ListLongMap!13671)

(assert (=> b!1027922 (= e!580195 e!580201)))

(declare-fun c!103648 () Bool)

(assert (=> b!1027922 (= c!103648 (and (not (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1027923 () Bool)

(declare-fun c!103650 () Bool)

(assert (=> b!1027923 (= c!103650 (and (not (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1027923 (= e!580201 e!580196)))

(declare-fun b!1027924 () Bool)

(declare-fun e!580203 () Bool)

(assert (=> b!1027924 (= e!580198 e!580203)))

(declare-fun res!687933 () Bool)

(assert (=> b!1027924 (=> (not res!687933) (not e!580203))))

(assert (=> b!1027924 (= res!687933 (contains!5964 lt!452655 (select (arr!31131 lt!452522) #b00000000000000000000000000000000)))))

(assert (=> b!1027924 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31644 lt!452522)))))

(declare-fun d!122763 () Bool)

(assert (=> d!122763 e!580202))

(declare-fun res!687928 () Bool)

(assert (=> d!122763 (=> (not res!687928) (not e!580202))))

(assert (=> d!122763 (= res!687928 (or (bvsge #b00000000000000000000000000000000 (size!31644 lt!452522)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31644 lt!452522)))))))

(declare-fun lt!452665 () ListLongMap!13671)

(assert (=> d!122763 (= lt!452655 lt!452665)))

(declare-fun lt!452647 () Unit!33555)

(assert (=> d!122763 (= lt!452647 e!580204)))

(declare-fun c!103645 () Bool)

(assert (=> d!122763 (= c!103645 e!580193)))

(declare-fun res!687927 () Bool)

(assert (=> d!122763 (=> (not res!687927) (not e!580193))))

(assert (=> d!122763 (= res!687927 (bvslt #b00000000000000000000000000000000 (size!31644 lt!452522)))))

(assert (=> d!122763 (= lt!452665 e!580195)))

(declare-fun c!103649 () Bool)

(assert (=> d!122763 (= c!103649 (and (not (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!122763 (validMask!0 (mask!29820 thiss!1427))))

(assert (=> d!122763 (= (getCurrentListMap!3899 lt!452522 lt!452525 (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)) lt!452655)))

(declare-fun b!1027913 () Bool)

(assert (=> b!1027913 (= e!580201 call!43308)))

(declare-fun b!1027925 () Bool)

(assert (=> b!1027925 (= e!580203 (= (apply!900 lt!452655 (select (arr!31131 lt!452522) #b00000000000000000000000000000000)) (get!16341 (select (arr!31132 lt!452525) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1027925 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31645 lt!452525)))))

(assert (=> b!1027925 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31644 lt!452522)))))

(declare-fun b!1027926 () Bool)

(declare-fun e!580194 () Bool)

(assert (=> b!1027926 (= e!580199 e!580194)))

(declare-fun res!687931 () Bool)

(assert (=> b!1027926 (= res!687931 call!43310)))

(assert (=> b!1027926 (=> (not res!687931) (not e!580194))))

(declare-fun b!1027927 () Bool)

(declare-fun e!580197 () Bool)

(assert (=> b!1027927 (= e!580197 (= (apply!900 lt!452655 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5932 thiss!1427)))))

(declare-fun bm!43309 () Bool)

(assert (=> bm!43309 (= call!43313 (contains!5964 lt!452655 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43310 () Bool)

(declare-fun call!43309 () ListLongMap!13671)

(assert (=> bm!43310 (= call!43308 call!43309)))

(declare-fun b!1027928 () Bool)

(assert (=> b!1027928 (= e!580205 e!580197)))

(declare-fun res!687935 () Bool)

(assert (=> b!1027928 (= res!687935 call!43313)))

(assert (=> b!1027928 (=> (not res!687935) (not e!580197))))

(declare-fun b!1027929 () Bool)

(declare-fun lt!452659 () Unit!33555)

(assert (=> b!1027929 (= e!580204 lt!452659)))

(declare-fun lt!452649 () ListLongMap!13671)

(assert (=> b!1027929 (= lt!452649 (getCurrentListMapNoExtraKeys!3514 lt!452522 lt!452525 (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))))

(declare-fun lt!452654 () (_ BitVec 64))

(assert (=> b!1027929 (= lt!452654 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452666 () (_ BitVec 64))

(assert (=> b!1027929 (= lt!452666 (select (arr!31131 lt!452522) #b00000000000000000000000000000000))))

(declare-fun lt!452648 () Unit!33555)

(assert (=> b!1027929 (= lt!452648 (addStillContains!619 lt!452649 lt!452654 (zeroValue!5932 thiss!1427) lt!452666))))

(assert (=> b!1027929 (contains!5964 (+!3098 lt!452649 (tuple2!15537 lt!452654 (zeroValue!5932 thiss!1427))) lt!452666)))

(declare-fun lt!452656 () Unit!33555)

(assert (=> b!1027929 (= lt!452656 lt!452648)))

(declare-fun lt!452657 () ListLongMap!13671)

(assert (=> b!1027929 (= lt!452657 (getCurrentListMapNoExtraKeys!3514 lt!452522 lt!452525 (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))))

(declare-fun lt!452660 () (_ BitVec 64))

(assert (=> b!1027929 (= lt!452660 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452650 () (_ BitVec 64))

(assert (=> b!1027929 (= lt!452650 (select (arr!31131 lt!452522) #b00000000000000000000000000000000))))

(declare-fun lt!452661 () Unit!33555)

(assert (=> b!1027929 (= lt!452661 (addApplyDifferent!479 lt!452657 lt!452660 (minValue!5932 thiss!1427) lt!452650))))

(assert (=> b!1027929 (= (apply!900 (+!3098 lt!452657 (tuple2!15537 lt!452660 (minValue!5932 thiss!1427))) lt!452650) (apply!900 lt!452657 lt!452650))))

(declare-fun lt!452664 () Unit!33555)

(assert (=> b!1027929 (= lt!452664 lt!452661)))

(declare-fun lt!452652 () ListLongMap!13671)

(assert (=> b!1027929 (= lt!452652 (getCurrentListMapNoExtraKeys!3514 lt!452522 lt!452525 (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))))

(declare-fun lt!452663 () (_ BitVec 64))

(assert (=> b!1027929 (= lt!452663 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452667 () (_ BitVec 64))

(assert (=> b!1027929 (= lt!452667 (select (arr!31131 lt!452522) #b00000000000000000000000000000000))))

(declare-fun lt!452662 () Unit!33555)

(assert (=> b!1027929 (= lt!452662 (addApplyDifferent!479 lt!452652 lt!452663 (zeroValue!5932 thiss!1427) lt!452667))))

(assert (=> b!1027929 (= (apply!900 (+!3098 lt!452652 (tuple2!15537 lt!452663 (zeroValue!5932 thiss!1427))) lt!452667) (apply!900 lt!452652 lt!452667))))

(declare-fun lt!452646 () Unit!33555)

(assert (=> b!1027929 (= lt!452646 lt!452662)))

(declare-fun lt!452658 () ListLongMap!13671)

(assert (=> b!1027929 (= lt!452658 (getCurrentListMapNoExtraKeys!3514 lt!452522 lt!452525 (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))))

(declare-fun lt!452653 () (_ BitVec 64))

(assert (=> b!1027929 (= lt!452653 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452651 () (_ BitVec 64))

(assert (=> b!1027929 (= lt!452651 (select (arr!31131 lt!452522) #b00000000000000000000000000000000))))

(assert (=> b!1027929 (= lt!452659 (addApplyDifferent!479 lt!452658 lt!452653 (minValue!5932 thiss!1427) lt!452651))))

(assert (=> b!1027929 (= (apply!900 (+!3098 lt!452658 (tuple2!15537 lt!452653 (minValue!5932 thiss!1427))) lt!452651) (apply!900 lt!452658 lt!452651))))

(declare-fun b!1027930 () Bool)

(assert (=> b!1027930 (= e!580194 (= (apply!900 lt!452655 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5932 thiss!1427)))))

(declare-fun bm!43311 () Bool)

(assert (=> bm!43311 (= call!43309 (+!3098 (ite c!103649 call!43311 (ite c!103648 call!43314 call!43312)) (ite (or c!103649 c!103648) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))))))

(declare-fun b!1027931 () Bool)

(assert (=> b!1027931 (= e!580195 (+!3098 call!43309 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))))))

(assert (= (and d!122763 c!103649) b!1027931))

(assert (= (and d!122763 (not c!103649)) b!1027922))

(assert (= (and b!1027922 c!103648) b!1027913))

(assert (= (and b!1027922 (not c!103648)) b!1027923))

(assert (= (and b!1027923 c!103650) b!1027918))

(assert (= (and b!1027923 (not c!103650)) b!1027921))

(assert (= (or b!1027918 b!1027921) bm!43306))

(assert (= (or b!1027913 bm!43306) bm!43305))

(assert (= (or b!1027913 b!1027918) bm!43310))

(assert (= (or b!1027931 bm!43305) bm!43307))

(assert (= (or b!1027931 bm!43310) bm!43311))

(assert (= (and d!122763 res!687927) b!1027919))

(assert (= (and d!122763 c!103645) b!1027929))

(assert (= (and d!122763 (not c!103645)) b!1027914))

(assert (= (and d!122763 res!687928) b!1027915))

(assert (= (and b!1027915 res!687930) b!1027916))

(assert (= (and b!1027915 (not res!687934)) b!1027924))

(assert (= (and b!1027924 res!687933) b!1027925))

(assert (= (and b!1027915 res!687932) b!1027911))

(assert (= (and b!1027911 c!103647) b!1027928))

(assert (= (and b!1027911 (not c!103647)) b!1027912))

(assert (= (and b!1027928 res!687935) b!1027927))

(assert (= (or b!1027928 b!1027912) bm!43309))

(assert (= (and b!1027911 res!687929) b!1027917))

(assert (= (and b!1027917 c!103646) b!1027926))

(assert (= (and b!1027917 (not c!103646)) b!1027920))

(assert (= (and b!1027926 res!687931) b!1027930))

(assert (= (or b!1027926 b!1027920) bm!43308))

(declare-fun b_lambda!15751 () Bool)

(assert (=> (not b_lambda!15751) (not b!1027925)))

(assert (=> b!1027925 t!30882))

(declare-fun b_and!32849 () Bool)

(assert (= b_and!32847 (and (=> t!30882 result!14107) b_and!32849)))

(assert (=> b!1027925 m!946343))

(declare-fun m!946495 () Bool)

(assert (=> b!1027925 m!946495))

(assert (=> b!1027925 m!946495))

(assert (=> b!1027925 m!946343))

(declare-fun m!946497 () Bool)

(assert (=> b!1027925 m!946497))

(assert (=> b!1027925 m!946401))

(assert (=> b!1027925 m!946401))

(declare-fun m!946499 () Bool)

(assert (=> b!1027925 m!946499))

(assert (=> b!1027916 m!946401))

(assert (=> b!1027916 m!946401))

(assert (=> b!1027916 m!946403))

(declare-fun m!946501 () Bool)

(assert (=> b!1027929 m!946501))

(declare-fun m!946503 () Bool)

(assert (=> b!1027929 m!946503))

(declare-fun m!946505 () Bool)

(assert (=> b!1027929 m!946505))

(declare-fun m!946507 () Bool)

(assert (=> b!1027929 m!946507))

(declare-fun m!946509 () Bool)

(assert (=> b!1027929 m!946509))

(declare-fun m!946511 () Bool)

(assert (=> b!1027929 m!946511))

(declare-fun m!946513 () Bool)

(assert (=> b!1027929 m!946513))

(assert (=> b!1027929 m!946401))

(declare-fun m!946515 () Bool)

(assert (=> b!1027929 m!946515))

(declare-fun m!946517 () Bool)

(assert (=> b!1027929 m!946517))

(declare-fun m!946519 () Bool)

(assert (=> b!1027929 m!946519))

(declare-fun m!946521 () Bool)

(assert (=> b!1027929 m!946521))

(declare-fun m!946523 () Bool)

(assert (=> b!1027929 m!946523))

(assert (=> b!1027929 m!946501))

(assert (=> b!1027929 m!946513))

(declare-fun m!946525 () Bool)

(assert (=> b!1027929 m!946525))

(assert (=> b!1027929 m!946505))

(assert (=> b!1027929 m!946519))

(declare-fun m!946527 () Bool)

(assert (=> b!1027929 m!946527))

(declare-fun m!946529 () Bool)

(assert (=> b!1027929 m!946529))

(declare-fun m!946531 () Bool)

(assert (=> b!1027929 m!946531))

(assert (=> b!1027924 m!946401))

(assert (=> b!1027924 m!946401))

(declare-fun m!946533 () Bool)

(assert (=> b!1027924 m!946533))

(declare-fun m!946535 () Bool)

(assert (=> bm!43311 m!946535))

(assert (=> b!1027919 m!946401))

(assert (=> b!1027919 m!946401))

(assert (=> b!1027919 m!946403))

(assert (=> bm!43307 m!946527))

(declare-fun m!946537 () Bool)

(assert (=> bm!43308 m!946537))

(declare-fun m!946539 () Bool)

(assert (=> b!1027930 m!946539))

(declare-fun m!946541 () Bool)

(assert (=> b!1027931 m!946541))

(declare-fun m!946543 () Bool)

(assert (=> bm!43309 m!946543))

(assert (=> d!122763 m!946475))

(declare-fun m!946545 () Bool)

(assert (=> b!1027927 m!946545))

(assert (=> b!1027765 d!122763))

(declare-fun bm!43312 () Bool)

(declare-fun call!43315 () (_ BitVec 32))

(assert (=> bm!43312 (= call!43315 (arrayCountValidKeys!0 (_keys!11245 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31644 (_keys!11245 thiss!1427))))))

(declare-fun b!1027932 () Bool)

(declare-fun e!580206 () (_ BitVec 32))

(assert (=> b!1027932 (= e!580206 (bvadd #b00000000000000000000000000000001 call!43315))))

(declare-fun b!1027933 () Bool)

(assert (=> b!1027933 (= e!580206 call!43315)))

(declare-fun d!122765 () Bool)

(declare-fun lt!452668 () (_ BitVec 32))

(assert (=> d!122765 (and (bvsge lt!452668 #b00000000000000000000000000000000) (bvsle lt!452668 (bvsub (size!31644 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!580207 () (_ BitVec 32))

(assert (=> d!122765 (= lt!452668 e!580207)))

(declare-fun c!103652 () Bool)

(assert (=> d!122765 (= c!103652 (bvsge #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))))))

(assert (=> d!122765 (and (bvsle #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31644 (_keys!11245 thiss!1427)) (size!31644 (_keys!11245 thiss!1427))))))

(assert (=> d!122765 (= (arrayCountValidKeys!0 (_keys!11245 thiss!1427) #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))) lt!452668)))

(declare-fun b!1027934 () Bool)

(assert (=> b!1027934 (= e!580207 #b00000000000000000000000000000000)))

(declare-fun b!1027935 () Bool)

(assert (=> b!1027935 (= e!580207 e!580206)))

(declare-fun c!103651 () Bool)

(assert (=> b!1027935 (= c!103651 (validKeyInArray!0 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!122765 c!103652) b!1027934))

(assert (= (and d!122765 (not c!103652)) b!1027935))

(assert (= (and b!1027935 c!103651) b!1027932))

(assert (= (and b!1027935 (not c!103651)) b!1027933))

(assert (= (or b!1027932 b!1027933) bm!43312))

(declare-fun m!946547 () Bool)

(assert (=> bm!43312 m!946547))

(assert (=> b!1027935 m!946425))

(assert (=> b!1027935 m!946425))

(assert (=> b!1027935 m!946429))

(assert (=> b!1027765 d!122765))

(declare-fun d!122767 () Bool)

(declare-fun e!580210 () Bool)

(assert (=> d!122767 e!580210))

(declare-fun res!687938 () Bool)

(assert (=> d!122767 (=> (not res!687938) (not e!580210))))

(assert (=> d!122767 (= res!687938 (bvslt (index!41080 lt!452520) (size!31644 (_keys!11245 thiss!1427))))))

(declare-fun lt!452671 () Unit!33555)

(declare-fun choose!121 (array!64646 (_ BitVec 32) (_ BitVec 64)) Unit!33555)

(assert (=> d!122767 (= lt!452671 (choose!121 (_keys!11245 thiss!1427) (index!41080 lt!452520) key!909))))

(assert (=> d!122767 (bvsge (index!41080 lt!452520) #b00000000000000000000000000000000)))

(assert (=> d!122767 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11245 thiss!1427) (index!41080 lt!452520) key!909) lt!452671)))

(declare-fun b!1027938 () Bool)

(assert (=> b!1027938 (= e!580210 (not (arrayContainsKey!0 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!122767 res!687938) b!1027938))

(declare-fun m!946549 () Bool)

(assert (=> d!122767 m!946549))

(assert (=> b!1027938 m!946335))

(declare-fun m!946551 () Bool)

(assert (=> b!1027938 m!946551))

(assert (=> b!1027765 d!122767))

(declare-fun b!1027949 () Bool)

(declare-fun e!580221 () Bool)

(declare-fun call!43318 () Bool)

(assert (=> b!1027949 (= e!580221 call!43318)))

(declare-fun b!1027950 () Bool)

(assert (=> b!1027950 (= e!580221 call!43318)))

(declare-fun bm!43315 () Bool)

(declare-fun c!103655 () Bool)

(assert (=> bm!43315 (= call!43318 (arrayNoDuplicates!0 lt!452522 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103655 (Cons!21808 (select (arr!31131 lt!452522) #b00000000000000000000000000000000) Nil!21809) Nil!21809)))))

(declare-fun b!1027951 () Bool)

(declare-fun e!580220 () Bool)

(declare-fun e!580222 () Bool)

(assert (=> b!1027951 (= e!580220 e!580222)))

(declare-fun res!687946 () Bool)

(assert (=> b!1027951 (=> (not res!687946) (not e!580222))))

(declare-fun e!580219 () Bool)

(assert (=> b!1027951 (= res!687946 (not e!580219))))

(declare-fun res!687947 () Bool)

(assert (=> b!1027951 (=> (not res!687947) (not e!580219))))

(assert (=> b!1027951 (= res!687947 (validKeyInArray!0 (select (arr!31131 lt!452522) #b00000000000000000000000000000000)))))

(declare-fun d!122769 () Bool)

(declare-fun res!687945 () Bool)

(assert (=> d!122769 (=> res!687945 e!580220)))

(assert (=> d!122769 (= res!687945 (bvsge #b00000000000000000000000000000000 (size!31644 lt!452522)))))

(assert (=> d!122769 (= (arrayNoDuplicates!0 lt!452522 #b00000000000000000000000000000000 Nil!21809) e!580220)))

(declare-fun b!1027952 () Bool)

(declare-fun contains!5965 (List!21812 (_ BitVec 64)) Bool)

(assert (=> b!1027952 (= e!580219 (contains!5965 Nil!21809 (select (arr!31131 lt!452522) #b00000000000000000000000000000000)))))

(declare-fun b!1027953 () Bool)

(assert (=> b!1027953 (= e!580222 e!580221)))

(assert (=> b!1027953 (= c!103655 (validKeyInArray!0 (select (arr!31131 lt!452522) #b00000000000000000000000000000000)))))

(assert (= (and d!122769 (not res!687945)) b!1027951))

(assert (= (and b!1027951 res!687947) b!1027952))

(assert (= (and b!1027951 res!687946) b!1027953))

(assert (= (and b!1027953 c!103655) b!1027949))

(assert (= (and b!1027953 (not c!103655)) b!1027950))

(assert (= (or b!1027949 b!1027950) bm!43315))

(assert (=> bm!43315 m!946401))

(declare-fun m!946553 () Bool)

(assert (=> bm!43315 m!946553))

(assert (=> b!1027951 m!946401))

(assert (=> b!1027951 m!946401))

(assert (=> b!1027951 m!946403))

(assert (=> b!1027952 m!946401))

(assert (=> b!1027952 m!946401))

(declare-fun m!946555 () Bool)

(assert (=> b!1027952 m!946555))

(assert (=> b!1027953 m!946401))

(assert (=> b!1027953 m!946401))

(assert (=> b!1027953 m!946403))

(assert (=> b!1027765 d!122769))

(declare-fun d!122771 () Bool)

(declare-fun e!580225 () Bool)

(assert (=> d!122771 e!580225))

(declare-fun res!687950 () Bool)

(assert (=> d!122771 (=> (not res!687950) (not e!580225))))

(assert (=> d!122771 (= res!687950 (and (bvsge (index!41080 lt!452520) #b00000000000000000000000000000000) (bvslt (index!41080 lt!452520) (size!31644 (_keys!11245 thiss!1427)))))))

(declare-fun lt!452674 () Unit!33555)

(declare-fun choose!25 (array!64646 (_ BitVec 32) (_ BitVec 32)) Unit!33555)

(assert (=> d!122771 (= lt!452674 (choose!25 (_keys!11245 thiss!1427) (index!41080 lt!452520) (mask!29820 thiss!1427)))))

(assert (=> d!122771 (validMask!0 (mask!29820 thiss!1427))))

(assert (=> d!122771 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11245 thiss!1427) (index!41080 lt!452520) (mask!29820 thiss!1427)) lt!452674)))

(declare-fun b!1027956 () Bool)

(assert (=> b!1027956 (= e!580225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) (mask!29820 thiss!1427)))))

(assert (= (and d!122771 res!687950) b!1027956))

(declare-fun m!946557 () Bool)

(assert (=> d!122771 m!946557))

(assert (=> d!122771 m!946475))

(assert (=> b!1027956 m!946335))

(declare-fun m!946559 () Bool)

(assert (=> b!1027956 m!946559))

(assert (=> b!1027765 d!122771))

(declare-fun d!122773 () Bool)

(declare-fun res!687957 () Bool)

(declare-fun e!580228 () Bool)

(assert (=> d!122773 (=> (not res!687957) (not e!580228))))

(declare-fun simpleValid!391 (LongMapFixedSize!5484) Bool)

(assert (=> d!122773 (= res!687957 (simpleValid!391 thiss!1427))))

(assert (=> d!122773 (= (valid!2077 thiss!1427) e!580228)))

(declare-fun b!1027963 () Bool)

(declare-fun res!687958 () Bool)

(assert (=> b!1027963 (=> (not res!687958) (not e!580228))))

(assert (=> b!1027963 (= res!687958 (= (arrayCountValidKeys!0 (_keys!11245 thiss!1427) #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))) (_size!2797 thiss!1427)))))

(declare-fun b!1027964 () Bool)

(declare-fun res!687959 () Bool)

(assert (=> b!1027964 (=> (not res!687959) (not e!580228))))

(assert (=> b!1027964 (= res!687959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11245 thiss!1427) (mask!29820 thiss!1427)))))

(declare-fun b!1027965 () Bool)

(assert (=> b!1027965 (= e!580228 (arrayNoDuplicates!0 (_keys!11245 thiss!1427) #b00000000000000000000000000000000 Nil!21809))))

(assert (= (and d!122773 res!687957) b!1027963))

(assert (= (and b!1027963 res!687958) b!1027964))

(assert (= (and b!1027964 res!687959) b!1027965))

(declare-fun m!946561 () Bool)

(assert (=> d!122773 m!946561))

(assert (=> b!1027963 m!946319))

(declare-fun m!946563 () Bool)

(assert (=> b!1027964 m!946563))

(declare-fun m!946565 () Bool)

(assert (=> b!1027965 m!946565))

(assert (=> start!89610 d!122773))

(declare-fun d!122775 () Bool)

(assert (=> d!122775 (= (array_inv!24101 (_keys!11245 thiss!1427)) (bvsge (size!31644 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1027769 d!122775))

(declare-fun d!122777 () Bool)

(assert (=> d!122777 (= (array_inv!24102 (_values!6119 thiss!1427)) (bvsge (size!31645 (_values!6119 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1027769 d!122777))

(declare-fun b!1027978 () Bool)

(declare-fun c!103664 () Bool)

(declare-fun lt!452686 () (_ BitVec 64))

(assert (=> b!1027978 (= c!103664 (= lt!452686 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!580235 () SeekEntryResult!9677)

(declare-fun e!580237 () SeekEntryResult!9677)

(assert (=> b!1027978 (= e!580235 e!580237)))

(declare-fun b!1027979 () Bool)

(declare-fun e!580236 () SeekEntryResult!9677)

(assert (=> b!1027979 (= e!580236 e!580235)))

(declare-fun lt!452683 () SeekEntryResult!9677)

(assert (=> b!1027979 (= lt!452686 (select (arr!31131 (_keys!11245 thiss!1427)) (index!41081 lt!452683)))))

(declare-fun c!103663 () Bool)

(assert (=> b!1027979 (= c!103663 (= lt!452686 key!909))))

(declare-fun b!1027980 () Bool)

(declare-fun lt!452684 () SeekEntryResult!9677)

(assert (=> b!1027980 (= e!580237 (ite ((_ is MissingVacant!9677) lt!452684) (MissingZero!9677 (index!41082 lt!452684)) lt!452684))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64646 (_ BitVec 32)) SeekEntryResult!9677)

(assert (=> b!1027980 (= lt!452684 (seekKeyOrZeroReturnVacant!0 (x!91463 lt!452683) (index!41081 lt!452683) (index!41081 lt!452683) key!909 (_keys!11245 thiss!1427) (mask!29820 thiss!1427)))))

(declare-fun b!1027982 () Bool)

(assert (=> b!1027982 (= e!580235 (Found!9677 (index!41081 lt!452683)))))

(declare-fun b!1027983 () Bool)

(assert (=> b!1027983 (= e!580236 Undefined!9677)))

(declare-fun b!1027981 () Bool)

(assert (=> b!1027981 (= e!580237 (MissingZero!9677 (index!41081 lt!452683)))))

(declare-fun d!122779 () Bool)

(declare-fun lt!452685 () SeekEntryResult!9677)

(assert (=> d!122779 (and (or ((_ is MissingVacant!9677) lt!452685) (not ((_ is Found!9677) lt!452685)) (and (bvsge (index!41080 lt!452685) #b00000000000000000000000000000000) (bvslt (index!41080 lt!452685) (size!31644 (_keys!11245 thiss!1427))))) (not ((_ is MissingVacant!9677) lt!452685)) (or (not ((_ is Found!9677) lt!452685)) (= (select (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452685)) key!909)))))

(assert (=> d!122779 (= lt!452685 e!580236)))

(declare-fun c!103662 () Bool)

(assert (=> d!122779 (= c!103662 (and ((_ is Intermediate!9677) lt!452683) (undefined!10489 lt!452683)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64646 (_ BitVec 32)) SeekEntryResult!9677)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!122779 (= lt!452683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29820 thiss!1427)) key!909 (_keys!11245 thiss!1427) (mask!29820 thiss!1427)))))

(assert (=> d!122779 (validMask!0 (mask!29820 thiss!1427))))

(assert (=> d!122779 (= (seekEntry!0 key!909 (_keys!11245 thiss!1427) (mask!29820 thiss!1427)) lt!452685)))

(assert (= (and d!122779 c!103662) b!1027983))

(assert (= (and d!122779 (not c!103662)) b!1027979))

(assert (= (and b!1027979 c!103663) b!1027982))

(assert (= (and b!1027979 (not c!103663)) b!1027978))

(assert (= (and b!1027978 c!103664) b!1027981))

(assert (= (and b!1027978 (not c!103664)) b!1027980))

(declare-fun m!946567 () Bool)

(assert (=> b!1027979 m!946567))

(declare-fun m!946569 () Bool)

(assert (=> b!1027980 m!946569))

(declare-fun m!946571 () Bool)

(assert (=> d!122779 m!946571))

(declare-fun m!946573 () Bool)

(assert (=> d!122779 m!946573))

(assert (=> d!122779 m!946573))

(declare-fun m!946575 () Bool)

(assert (=> d!122779 m!946575))

(assert (=> d!122779 m!946475))

(assert (=> b!1027771 d!122779))

(declare-fun mapNonEmpty!37883 () Bool)

(declare-fun mapRes!37883 () Bool)

(declare-fun tp!72789 () Bool)

(declare-fun e!580243 () Bool)

(assert (=> mapNonEmpty!37883 (= mapRes!37883 (and tp!72789 e!580243))))

(declare-fun mapRest!37883 () (Array (_ BitVec 32) ValueCell!11445))

(declare-fun mapValue!37883 () ValueCell!11445)

(declare-fun mapKey!37883 () (_ BitVec 32))

(assert (=> mapNonEmpty!37883 (= mapRest!37877 (store mapRest!37883 mapKey!37883 mapValue!37883))))

(declare-fun mapIsEmpty!37883 () Bool)

(assert (=> mapIsEmpty!37883 mapRes!37883))

(declare-fun condMapEmpty!37883 () Bool)

(declare-fun mapDefault!37883 () ValueCell!11445)

(assert (=> mapNonEmpty!37877 (= condMapEmpty!37883 (= mapRest!37877 ((as const (Array (_ BitVec 32) ValueCell!11445)) mapDefault!37883)))))

(declare-fun e!580242 () Bool)

(assert (=> mapNonEmpty!37877 (= tp!72779 (and e!580242 mapRes!37883))))

(declare-fun b!1027990 () Bool)

(assert (=> b!1027990 (= e!580243 tp_is_empty!24297)))

(declare-fun b!1027991 () Bool)

(assert (=> b!1027991 (= e!580242 tp_is_empty!24297)))

(assert (= (and mapNonEmpty!37877 condMapEmpty!37883) mapIsEmpty!37883))

(assert (= (and mapNonEmpty!37877 (not condMapEmpty!37883)) mapNonEmpty!37883))

(assert (= (and mapNonEmpty!37883 ((_ is ValueCellFull!11445) mapValue!37883)) b!1027990))

(assert (= (and mapNonEmpty!37877 ((_ is ValueCellFull!11445) mapDefault!37883)) b!1027991))

(declare-fun m!946577 () Bool)

(assert (=> mapNonEmpty!37883 m!946577))

(declare-fun b_lambda!15753 () Bool)

(assert (= b_lambda!15749 (or (and b!1027769 b_free!20577) b_lambda!15753)))

(declare-fun b_lambda!15755 () Bool)

(assert (= b_lambda!15751 (or (and b!1027769 b_free!20577) b_lambda!15755)))

(declare-fun b_lambda!15757 () Bool)

(assert (= b_lambda!15747 (or (and b!1027769 b_free!20577) b_lambda!15757)))

(check-sat (not b!1027895) (not b!1027894) (not d!122759) (not b!1027830) (not bm!43309) (not b!1027956) (not b!1027909) (not bm!43312) (not bm!43301) (not d!122751) (not bm!43299) (not b!1027891) (not b_next!20577) (not b!1027963) (not b!1027817) (not b!1027832) (not b!1027930) (not d!122753) (not bm!43304) (not d!122773) (not bm!43297) (not bm!43280) (not b!1027889) (not b!1027908) (not b!1027811) (not bm!43315) (not b!1027964) (not b!1027916) b_and!32849 (not d!122771) (not b!1027931) (not b!1027883) (not b_lambda!15755) (not d!122755) (not b!1027953) (not b!1027952) (not b!1027898) (not b!1027980) (not b!1027929) (not b!1027924) (not b!1027965) (not b!1027938) (not b!1027829) (not b_lambda!15745) (not bm!43311) (not bm!43298) (not b!1027888) (not b_lambda!15753) (not b!1027919) (not bm!43308) (not mapNonEmpty!37883) (not b!1027927) tp_is_empty!24297 (not b!1027935) (not bm!43307) (not b!1027951) (not d!122763) (not b!1027925) (not d!122767) (not d!122779) (not b!1027820) (not b_lambda!15757) (not b!1027880) (not d!122757) (not b!1027893))
(check-sat b_and!32849 (not b_next!20577))
(get-model)

(declare-fun d!122781 () Bool)

(assert (=> d!122781 (= (-!478 (getCurrentListMap!3899 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)) key!909) (getCurrentListMap!3899 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) (array!64649 (store (arr!31132 (_values!6119 thiss!1427)) (index!41080 lt!452520) (ValueCellFull!11445 (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31645 (_values!6119 thiss!1427))) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))))

(assert (=> d!122781 true))

(declare-fun _$9!35 () Unit!33555)

(assert (=> d!122781 (= (choose!1682 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) (index!41080 lt!452520) key!909 (defaultEntry!6096 thiss!1427)) _$9!35)))

(declare-fun b_lambda!15759 () Bool)

(assert (=> (not b_lambda!15759) (not d!122781)))

(assert (=> d!122781 t!30882))

(declare-fun b_and!32851 () Bool)

(assert (= b_and!32849 (and (=> t!30882 result!14107) b_and!32851)))

(assert (=> d!122781 m!946323))

(assert (=> d!122781 m!946339))

(assert (=> d!122781 m!946485))

(assert (=> d!122781 m!946331))

(assert (=> d!122781 m!946343))

(assert (=> d!122781 m!946335))

(assert (=> d!122781 m!946323))

(assert (=> d!122759 d!122781))

(declare-fun d!122783 () Bool)

(assert (=> d!122783 (= (validMask!0 (mask!29820 thiss!1427)) (and (or (= (mask!29820 thiss!1427) #b00000000000000000000000000000111) (= (mask!29820 thiss!1427) #b00000000000000000000000000001111) (= (mask!29820 thiss!1427) #b00000000000000000000000000011111) (= (mask!29820 thiss!1427) #b00000000000000000000000000111111) (= (mask!29820 thiss!1427) #b00000000000000000000000001111111) (= (mask!29820 thiss!1427) #b00000000000000000000000011111111) (= (mask!29820 thiss!1427) #b00000000000000000000000111111111) (= (mask!29820 thiss!1427) #b00000000000000000000001111111111) (= (mask!29820 thiss!1427) #b00000000000000000000011111111111) (= (mask!29820 thiss!1427) #b00000000000000000000111111111111) (= (mask!29820 thiss!1427) #b00000000000000000001111111111111) (= (mask!29820 thiss!1427) #b00000000000000000011111111111111) (= (mask!29820 thiss!1427) #b00000000000000000111111111111111) (= (mask!29820 thiss!1427) #b00000000000000001111111111111111) (= (mask!29820 thiss!1427) #b00000000000000011111111111111111) (= (mask!29820 thiss!1427) #b00000000000000111111111111111111) (= (mask!29820 thiss!1427) #b00000000000001111111111111111111) (= (mask!29820 thiss!1427) #b00000000000011111111111111111111) (= (mask!29820 thiss!1427) #b00000000000111111111111111111111) (= (mask!29820 thiss!1427) #b00000000001111111111111111111111) (= (mask!29820 thiss!1427) #b00000000011111111111111111111111) (= (mask!29820 thiss!1427) #b00000000111111111111111111111111) (= (mask!29820 thiss!1427) #b00000001111111111111111111111111) (= (mask!29820 thiss!1427) #b00000011111111111111111111111111) (= (mask!29820 thiss!1427) #b00000111111111111111111111111111) (= (mask!29820 thiss!1427) #b00001111111111111111111111111111) (= (mask!29820 thiss!1427) #b00011111111111111111111111111111) (= (mask!29820 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29820 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!122759 d!122783))

(assert (=> b!1027898 d!122757))

(assert (=> b!1027898 d!122755))

(declare-fun b!1027992 () Bool)

(declare-fun res!687962 () Bool)

(declare-fun e!580253 () Bool)

(assert (=> b!1027992 (=> (not res!687962) (not e!580253))))

(declare-fun e!580256 () Bool)

(assert (=> b!1027992 (= res!687962 e!580256)))

(declare-fun c!103667 () Bool)

(assert (=> b!1027992 (= c!103667 (not (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1027993 () Bool)

(declare-fun call!43324 () Bool)

(assert (=> b!1027993 (= e!580256 (not call!43324))))

(declare-fun bm!43316 () Bool)

(declare-fun call!43325 () ListLongMap!13671)

(declare-fun call!43322 () ListLongMap!13671)

(assert (=> bm!43316 (= call!43325 call!43322)))

(declare-fun b!1027995 () Bool)

(declare-fun e!580255 () Unit!33555)

(declare-fun Unit!33565 () Unit!33555)

(assert (=> b!1027995 (= e!580255 Unit!33565)))

(declare-fun b!1027996 () Bool)

(declare-fun res!687965 () Bool)

(assert (=> b!1027996 (=> (not res!687965) (not e!580253))))

(declare-fun e!580249 () Bool)

(assert (=> b!1027996 (= res!687965 e!580249)))

(declare-fun res!687967 () Bool)

(assert (=> b!1027996 (=> res!687967 e!580249)))

(declare-fun e!580251 () Bool)

(assert (=> b!1027996 (= res!687967 (not e!580251))))

(declare-fun res!687963 () Bool)

(assert (=> b!1027996 (=> (not res!687963) (not e!580251))))

(assert (=> b!1027996 (= res!687963 (bvslt #b00000000000000000000000000000000 (size!31644 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))))))))

(declare-fun bm!43317 () Bool)

(declare-fun call!43323 () ListLongMap!13671)

(assert (=> bm!43317 (= call!43323 call!43325)))

(declare-fun b!1027997 () Bool)

(assert (=> b!1027997 (= e!580251 (validKeyInArray!0 (select (arr!31131 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!43318 () Bool)

(assert (=> bm!43318 (= call!43322 (getCurrentListMapNoExtraKeys!3514 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) (array!64649 (store (arr!31132 (_values!6119 thiss!1427)) (index!41080 lt!452520) (ValueCellFull!11445 (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31645 (_values!6119 thiss!1427))) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))))

(declare-fun b!1027998 () Bool)

(declare-fun e!580250 () Bool)

(assert (=> b!1027998 (= e!580253 e!580250)))

(declare-fun c!103666 () Bool)

(assert (=> b!1027998 (= c!103666 (not (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1027999 () Bool)

(declare-fun e!580247 () ListLongMap!13671)

(declare-fun call!43319 () ListLongMap!13671)

(assert (=> b!1027999 (= e!580247 call!43319)))

(declare-fun b!1028000 () Bool)

(declare-fun e!580244 () Bool)

(assert (=> b!1028000 (= e!580244 (validKeyInArray!0 (select (arr!31131 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1028001 () Bool)

(declare-fun call!43321 () Bool)

(assert (=> b!1028001 (= e!580250 (not call!43321))))

(declare-fun b!1028002 () Bool)

(assert (=> b!1028002 (= e!580247 call!43323)))

(declare-fun bm!43319 () Bool)

(declare-fun lt!452696 () ListLongMap!13671)

(assert (=> bm!43319 (= call!43321 (contains!5964 lt!452696 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028003 () Bool)

(declare-fun e!580246 () ListLongMap!13671)

(declare-fun e!580252 () ListLongMap!13671)

(assert (=> b!1028003 (= e!580246 e!580252)))

(declare-fun c!103668 () Bool)

(assert (=> b!1028003 (= c!103668 (and (not (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1028004 () Bool)

(declare-fun c!103670 () Bool)

(assert (=> b!1028004 (= c!103670 (and (not (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1028004 (= e!580252 e!580247)))

(declare-fun b!1028005 () Bool)

(declare-fun e!580254 () Bool)

(assert (=> b!1028005 (= e!580249 e!580254)))

(declare-fun res!687966 () Bool)

(assert (=> b!1028005 (=> (not res!687966) (not e!580254))))

(assert (=> b!1028005 (= res!687966 (contains!5964 lt!452696 (select (arr!31131 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> b!1028005 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31644 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))))))))

(declare-fun d!122785 () Bool)

(assert (=> d!122785 e!580253))

(declare-fun res!687961 () Bool)

(assert (=> d!122785 (=> (not res!687961) (not e!580253))))

(assert (=> d!122785 (= res!687961 (or (bvsge #b00000000000000000000000000000000 (size!31644 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31644 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))))))))))

(declare-fun lt!452706 () ListLongMap!13671)

(assert (=> d!122785 (= lt!452696 lt!452706)))

(declare-fun lt!452688 () Unit!33555)

(assert (=> d!122785 (= lt!452688 e!580255)))

(declare-fun c!103665 () Bool)

(assert (=> d!122785 (= c!103665 e!580244)))

(declare-fun res!687960 () Bool)

(assert (=> d!122785 (=> (not res!687960) (not e!580244))))

(assert (=> d!122785 (= res!687960 (bvslt #b00000000000000000000000000000000 (size!31644 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))))))))

(assert (=> d!122785 (= lt!452706 e!580246)))

(declare-fun c!103669 () Bool)

(assert (=> d!122785 (= c!103669 (and (not (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5828 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!122785 (validMask!0 (mask!29820 thiss!1427))))

(assert (=> d!122785 (= (getCurrentListMap!3899 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) (array!64649 (store (arr!31132 (_values!6119 thiss!1427)) (index!41080 lt!452520) (ValueCellFull!11445 (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31645 (_values!6119 thiss!1427))) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)) lt!452696)))

(declare-fun b!1027994 () Bool)

(assert (=> b!1027994 (= e!580252 call!43319)))

(declare-fun b!1028006 () Bool)

(assert (=> b!1028006 (= e!580254 (= (apply!900 lt!452696 (select (arr!31131 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427)))) #b00000000000000000000000000000000)) (get!16341 (select (arr!31132 (array!64649 (store (arr!31132 (_values!6119 thiss!1427)) (index!41080 lt!452520) (ValueCellFull!11445 (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31645 (_values!6119 thiss!1427)))) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1028006 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31645 (array!64649 (store (arr!31132 (_values!6119 thiss!1427)) (index!41080 lt!452520) (ValueCellFull!11445 (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31645 (_values!6119 thiss!1427))))))))

(assert (=> b!1028006 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31644 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))))))))

(declare-fun b!1028007 () Bool)

(declare-fun e!580245 () Bool)

(assert (=> b!1028007 (= e!580250 e!580245)))

(declare-fun res!687964 () Bool)

(assert (=> b!1028007 (= res!687964 call!43321)))

(assert (=> b!1028007 (=> (not res!687964) (not e!580245))))

(declare-fun b!1028008 () Bool)

(declare-fun e!580248 () Bool)

(assert (=> b!1028008 (= e!580248 (= (apply!900 lt!452696 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5932 thiss!1427)))))

(declare-fun bm!43320 () Bool)

(assert (=> bm!43320 (= call!43324 (contains!5964 lt!452696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43321 () Bool)

(declare-fun call!43320 () ListLongMap!13671)

(assert (=> bm!43321 (= call!43319 call!43320)))

(declare-fun b!1028009 () Bool)

(assert (=> b!1028009 (= e!580256 e!580248)))

(declare-fun res!687968 () Bool)

(assert (=> b!1028009 (= res!687968 call!43324)))

(assert (=> b!1028009 (=> (not res!687968) (not e!580248))))

(declare-fun b!1028010 () Bool)

(declare-fun lt!452700 () Unit!33555)

(assert (=> b!1028010 (= e!580255 lt!452700)))

(declare-fun lt!452690 () ListLongMap!13671)

(assert (=> b!1028010 (= lt!452690 (getCurrentListMapNoExtraKeys!3514 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) (array!64649 (store (arr!31132 (_values!6119 thiss!1427)) (index!41080 lt!452520) (ValueCellFull!11445 (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31645 (_values!6119 thiss!1427))) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))))

(declare-fun lt!452695 () (_ BitVec 64))

(assert (=> b!1028010 (= lt!452695 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452707 () (_ BitVec 64))

(assert (=> b!1028010 (= lt!452707 (select (arr!31131 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!452689 () Unit!33555)

(assert (=> b!1028010 (= lt!452689 (addStillContains!619 lt!452690 lt!452695 (zeroValue!5932 thiss!1427) lt!452707))))

(assert (=> b!1028010 (contains!5964 (+!3098 lt!452690 (tuple2!15537 lt!452695 (zeroValue!5932 thiss!1427))) lt!452707)))

(declare-fun lt!452697 () Unit!33555)

(assert (=> b!1028010 (= lt!452697 lt!452689)))

(declare-fun lt!452698 () ListLongMap!13671)

(assert (=> b!1028010 (= lt!452698 (getCurrentListMapNoExtraKeys!3514 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) (array!64649 (store (arr!31132 (_values!6119 thiss!1427)) (index!41080 lt!452520) (ValueCellFull!11445 (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31645 (_values!6119 thiss!1427))) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))))

(declare-fun lt!452701 () (_ BitVec 64))

(assert (=> b!1028010 (= lt!452701 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452691 () (_ BitVec 64))

(assert (=> b!1028010 (= lt!452691 (select (arr!31131 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!452702 () Unit!33555)

(assert (=> b!1028010 (= lt!452702 (addApplyDifferent!479 lt!452698 lt!452701 (minValue!5932 thiss!1427) lt!452691))))

(assert (=> b!1028010 (= (apply!900 (+!3098 lt!452698 (tuple2!15537 lt!452701 (minValue!5932 thiss!1427))) lt!452691) (apply!900 lt!452698 lt!452691))))

(declare-fun lt!452705 () Unit!33555)

(assert (=> b!1028010 (= lt!452705 lt!452702)))

(declare-fun lt!452693 () ListLongMap!13671)

(assert (=> b!1028010 (= lt!452693 (getCurrentListMapNoExtraKeys!3514 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) (array!64649 (store (arr!31132 (_values!6119 thiss!1427)) (index!41080 lt!452520) (ValueCellFull!11445 (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31645 (_values!6119 thiss!1427))) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))))

(declare-fun lt!452704 () (_ BitVec 64))

(assert (=> b!1028010 (= lt!452704 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452708 () (_ BitVec 64))

(assert (=> b!1028010 (= lt!452708 (select (arr!31131 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!452703 () Unit!33555)

(assert (=> b!1028010 (= lt!452703 (addApplyDifferent!479 lt!452693 lt!452704 (zeroValue!5932 thiss!1427) lt!452708))))

(assert (=> b!1028010 (= (apply!900 (+!3098 lt!452693 (tuple2!15537 lt!452704 (zeroValue!5932 thiss!1427))) lt!452708) (apply!900 lt!452693 lt!452708))))

(declare-fun lt!452687 () Unit!33555)

(assert (=> b!1028010 (= lt!452687 lt!452703)))

(declare-fun lt!452699 () ListLongMap!13671)

(assert (=> b!1028010 (= lt!452699 (getCurrentListMapNoExtraKeys!3514 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) (array!64649 (store (arr!31132 (_values!6119 thiss!1427)) (index!41080 lt!452520) (ValueCellFull!11445 (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31645 (_values!6119 thiss!1427))) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))))

(declare-fun lt!452694 () (_ BitVec 64))

(assert (=> b!1028010 (= lt!452694 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452692 () (_ BitVec 64))

(assert (=> b!1028010 (= lt!452692 (select (arr!31131 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427)))) #b00000000000000000000000000000000))))

(assert (=> b!1028010 (= lt!452700 (addApplyDifferent!479 lt!452699 lt!452694 (minValue!5932 thiss!1427) lt!452692))))

(assert (=> b!1028010 (= (apply!900 (+!3098 lt!452699 (tuple2!15537 lt!452694 (minValue!5932 thiss!1427))) lt!452692) (apply!900 lt!452699 lt!452692))))

(declare-fun b!1028011 () Bool)

(assert (=> b!1028011 (= e!580245 (= (apply!900 lt!452696 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5932 thiss!1427)))))

(declare-fun bm!43322 () Bool)

(assert (=> bm!43322 (= call!43320 (+!3098 (ite c!103669 call!43322 (ite c!103668 call!43325 call!43323)) (ite (or c!103669 c!103668) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))))))

(declare-fun b!1028012 () Bool)

(assert (=> b!1028012 (= e!580246 (+!3098 call!43320 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))))))

(assert (= (and d!122785 c!103669) b!1028012))

(assert (= (and d!122785 (not c!103669)) b!1028003))

(assert (= (and b!1028003 c!103668) b!1027994))

(assert (= (and b!1028003 (not c!103668)) b!1028004))

(assert (= (and b!1028004 c!103670) b!1027999))

(assert (= (and b!1028004 (not c!103670)) b!1028002))

(assert (= (or b!1027999 b!1028002) bm!43317))

(assert (= (or b!1027994 bm!43317) bm!43316))

(assert (= (or b!1027994 b!1027999) bm!43321))

(assert (= (or b!1028012 bm!43316) bm!43318))

(assert (= (or b!1028012 bm!43321) bm!43322))

(assert (= (and d!122785 res!687960) b!1028000))

(assert (= (and d!122785 c!103665) b!1028010))

(assert (= (and d!122785 (not c!103665)) b!1027995))

(assert (= (and d!122785 res!687961) b!1027996))

(assert (= (and b!1027996 res!687963) b!1027997))

(assert (= (and b!1027996 (not res!687967)) b!1028005))

(assert (= (and b!1028005 res!687966) b!1028006))

(assert (= (and b!1027996 res!687965) b!1027992))

(assert (= (and b!1027992 c!103667) b!1028009))

(assert (= (and b!1027992 (not c!103667)) b!1027993))

(assert (= (and b!1028009 res!687968) b!1028008))

(assert (= (or b!1028009 b!1027993) bm!43320))

(assert (= (and b!1027992 res!687962) b!1027998))

(assert (= (and b!1027998 c!103666) b!1028007))

(assert (= (and b!1027998 (not c!103666)) b!1028001))

(assert (= (and b!1028007 res!687964) b!1028011))

(assert (= (or b!1028007 b!1028001) bm!43319))

(declare-fun b_lambda!15761 () Bool)

(assert (=> (not b_lambda!15761) (not b!1028006)))

(assert (=> b!1028006 t!30882))

(declare-fun b_and!32853 () Bool)

(assert (= b_and!32851 (and (=> t!30882 result!14107) b_and!32853)))

(assert (=> b!1028006 m!946343))

(declare-fun m!946579 () Bool)

(assert (=> b!1028006 m!946579))

(assert (=> b!1028006 m!946579))

(assert (=> b!1028006 m!946343))

(declare-fun m!946581 () Bool)

(assert (=> b!1028006 m!946581))

(declare-fun m!946583 () Bool)

(assert (=> b!1028006 m!946583))

(assert (=> b!1028006 m!946583))

(declare-fun m!946585 () Bool)

(assert (=> b!1028006 m!946585))

(assert (=> b!1027997 m!946583))

(assert (=> b!1027997 m!946583))

(declare-fun m!946587 () Bool)

(assert (=> b!1027997 m!946587))

(declare-fun m!946589 () Bool)

(assert (=> b!1028010 m!946589))

(declare-fun m!946591 () Bool)

(assert (=> b!1028010 m!946591))

(declare-fun m!946593 () Bool)

(assert (=> b!1028010 m!946593))

(declare-fun m!946595 () Bool)

(assert (=> b!1028010 m!946595))

(declare-fun m!946597 () Bool)

(assert (=> b!1028010 m!946597))

(declare-fun m!946599 () Bool)

(assert (=> b!1028010 m!946599))

(declare-fun m!946601 () Bool)

(assert (=> b!1028010 m!946601))

(assert (=> b!1028010 m!946583))

(declare-fun m!946603 () Bool)

(assert (=> b!1028010 m!946603))

(declare-fun m!946605 () Bool)

(assert (=> b!1028010 m!946605))

(declare-fun m!946607 () Bool)

(assert (=> b!1028010 m!946607))

(declare-fun m!946609 () Bool)

(assert (=> b!1028010 m!946609))

(declare-fun m!946611 () Bool)

(assert (=> b!1028010 m!946611))

(assert (=> b!1028010 m!946589))

(assert (=> b!1028010 m!946601))

(declare-fun m!946613 () Bool)

(assert (=> b!1028010 m!946613))

(assert (=> b!1028010 m!946593))

(assert (=> b!1028010 m!946607))

(declare-fun m!946615 () Bool)

(assert (=> b!1028010 m!946615))

(declare-fun m!946617 () Bool)

(assert (=> b!1028010 m!946617))

(declare-fun m!946619 () Bool)

(assert (=> b!1028010 m!946619))

(assert (=> b!1028005 m!946583))

(assert (=> b!1028005 m!946583))

(declare-fun m!946621 () Bool)

(assert (=> b!1028005 m!946621))

(declare-fun m!946623 () Bool)

(assert (=> bm!43322 m!946623))

(assert (=> b!1028000 m!946583))

(assert (=> b!1028000 m!946583))

(assert (=> b!1028000 m!946587))

(assert (=> bm!43318 m!946615))

(declare-fun m!946625 () Bool)

(assert (=> bm!43319 m!946625))

(declare-fun m!946627 () Bool)

(assert (=> b!1028011 m!946627))

(declare-fun m!946629 () Bool)

(assert (=> b!1028012 m!946629))

(declare-fun m!946631 () Bool)

(assert (=> bm!43320 m!946631))

(assert (=> d!122785 m!946475))

(declare-fun m!946633 () Bool)

(assert (=> b!1028008 m!946633))

(assert (=> b!1027898 d!122785))

(declare-fun d!122787 () Bool)

(declare-fun e!580261 () Bool)

(assert (=> d!122787 e!580261))

(declare-fun res!687971 () Bool)

(assert (=> d!122787 (=> res!687971 e!580261)))

(declare-fun lt!452720 () Bool)

(assert (=> d!122787 (= res!687971 (not lt!452720))))

(declare-fun lt!452718 () Bool)

(assert (=> d!122787 (= lt!452720 lt!452718)))

(declare-fun lt!452719 () Unit!33555)

(declare-fun e!580262 () Unit!33555)

(assert (=> d!122787 (= lt!452719 e!580262)))

(declare-fun c!103673 () Bool)

(assert (=> d!122787 (= c!103673 lt!452718)))

(declare-fun containsKey!559 (List!21811 (_ BitVec 64)) Bool)

(assert (=> d!122787 (= lt!452718 (containsKey!559 (toList!6851 lt!452655) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!122787 (= (contains!5964 lt!452655 #b0000000000000000000000000000000000000000000000000000000000000000) lt!452720)))

(declare-fun b!1028019 () Bool)

(declare-fun lt!452717 () Unit!33555)

(assert (=> b!1028019 (= e!580262 lt!452717)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!392 (List!21811 (_ BitVec 64)) Unit!33555)

(assert (=> b!1028019 (= lt!452717 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6851 lt!452655) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!635 0))(
  ( (Some!634 (v!14771 V!37269)) (None!633) )
))
(declare-fun isDefined!431 (Option!635) Bool)

(declare-fun getValueByKey!584 (List!21811 (_ BitVec 64)) Option!635)

(assert (=> b!1028019 (isDefined!431 (getValueByKey!584 (toList!6851 lt!452655) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028020 () Bool)

(declare-fun Unit!33566 () Unit!33555)

(assert (=> b!1028020 (= e!580262 Unit!33566)))

(declare-fun b!1028021 () Bool)

(assert (=> b!1028021 (= e!580261 (isDefined!431 (getValueByKey!584 (toList!6851 lt!452655) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!122787 c!103673) b!1028019))

(assert (= (and d!122787 (not c!103673)) b!1028020))

(assert (= (and d!122787 (not res!687971)) b!1028021))

(declare-fun m!946635 () Bool)

(assert (=> d!122787 m!946635))

(declare-fun m!946637 () Bool)

(assert (=> b!1028019 m!946637))

(declare-fun m!946639 () Bool)

(assert (=> b!1028019 m!946639))

(assert (=> b!1028019 m!946639))

(declare-fun m!946641 () Bool)

(assert (=> b!1028019 m!946641))

(assert (=> b!1028021 m!946639))

(assert (=> b!1028021 m!946639))

(assert (=> b!1028021 m!946641))

(assert (=> bm!43309 d!122787))

(declare-fun d!122789 () Bool)

(declare-fun e!580263 () Bool)

(assert (=> d!122789 e!580263))

(declare-fun res!687972 () Bool)

(assert (=> d!122789 (=> res!687972 e!580263)))

(declare-fun lt!452724 () Bool)

(assert (=> d!122789 (= res!687972 (not lt!452724))))

(declare-fun lt!452722 () Bool)

(assert (=> d!122789 (= lt!452724 lt!452722)))

(declare-fun lt!452723 () Unit!33555)

(declare-fun e!580264 () Unit!33555)

(assert (=> d!122789 (= lt!452723 e!580264)))

(declare-fun c!103674 () Bool)

(assert (=> d!122789 (= c!103674 lt!452722)))

(assert (=> d!122789 (= lt!452722 (containsKey!559 (toList!6851 lt!452618) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!122789 (= (contains!5964 lt!452618 #b0000000000000000000000000000000000000000000000000000000000000000) lt!452724)))

(declare-fun b!1028022 () Bool)

(declare-fun lt!452721 () Unit!33555)

(assert (=> b!1028022 (= e!580264 lt!452721)))

(assert (=> b!1028022 (= lt!452721 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6851 lt!452618) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1028022 (isDefined!431 (getValueByKey!584 (toList!6851 lt!452618) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028023 () Bool)

(declare-fun Unit!33567 () Unit!33555)

(assert (=> b!1028023 (= e!580264 Unit!33567)))

(declare-fun b!1028024 () Bool)

(assert (=> b!1028024 (= e!580263 (isDefined!431 (getValueByKey!584 (toList!6851 lt!452618) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!122789 c!103674) b!1028022))

(assert (= (and d!122789 (not c!103674)) b!1028023))

(assert (= (and d!122789 (not res!687972)) b!1028024))

(declare-fun m!946643 () Bool)

(assert (=> d!122789 m!946643))

(declare-fun m!946645 () Bool)

(assert (=> b!1028022 m!946645))

(declare-fun m!946647 () Bool)

(assert (=> b!1028022 m!946647))

(assert (=> b!1028022 m!946647))

(declare-fun m!946649 () Bool)

(assert (=> b!1028022 m!946649))

(assert (=> b!1028024 m!946647))

(assert (=> b!1028024 m!946647))

(assert (=> b!1028024 m!946649))

(assert (=> bm!43299 d!122789))

(declare-fun b!1028025 () Bool)

(declare-fun e!580267 () Bool)

(declare-fun call!43326 () Bool)

(assert (=> b!1028025 (= e!580267 call!43326)))

(declare-fun b!1028026 () Bool)

(assert (=> b!1028026 (= e!580267 call!43326)))

(declare-fun c!103675 () Bool)

(declare-fun bm!43323 () Bool)

(assert (=> bm!43323 (= call!43326 (arrayNoDuplicates!0 lt!452522 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!103675 (Cons!21808 (select (arr!31131 lt!452522) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!103655 (Cons!21808 (select (arr!31131 lt!452522) #b00000000000000000000000000000000) Nil!21809) Nil!21809)) (ite c!103655 (Cons!21808 (select (arr!31131 lt!452522) #b00000000000000000000000000000000) Nil!21809) Nil!21809))))))

(declare-fun b!1028027 () Bool)

(declare-fun e!580266 () Bool)

(declare-fun e!580268 () Bool)

(assert (=> b!1028027 (= e!580266 e!580268)))

(declare-fun res!687974 () Bool)

(assert (=> b!1028027 (=> (not res!687974) (not e!580268))))

(declare-fun e!580265 () Bool)

(assert (=> b!1028027 (= res!687974 (not e!580265))))

(declare-fun res!687975 () Bool)

(assert (=> b!1028027 (=> (not res!687975) (not e!580265))))

(assert (=> b!1028027 (= res!687975 (validKeyInArray!0 (select (arr!31131 lt!452522) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!122791 () Bool)

(declare-fun res!687973 () Bool)

(assert (=> d!122791 (=> res!687973 e!580266)))

(assert (=> d!122791 (= res!687973 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31644 lt!452522)))))

(assert (=> d!122791 (= (arrayNoDuplicates!0 lt!452522 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103655 (Cons!21808 (select (arr!31131 lt!452522) #b00000000000000000000000000000000) Nil!21809) Nil!21809)) e!580266)))

(declare-fun b!1028028 () Bool)

(assert (=> b!1028028 (= e!580265 (contains!5965 (ite c!103655 (Cons!21808 (select (arr!31131 lt!452522) #b00000000000000000000000000000000) Nil!21809) Nil!21809) (select (arr!31131 lt!452522) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1028029 () Bool)

(assert (=> b!1028029 (= e!580268 e!580267)))

(assert (=> b!1028029 (= c!103675 (validKeyInArray!0 (select (arr!31131 lt!452522) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!122791 (not res!687973)) b!1028027))

(assert (= (and b!1028027 res!687975) b!1028028))

(assert (= (and b!1028027 res!687974) b!1028029))

(assert (= (and b!1028029 c!103675) b!1028025))

(assert (= (and b!1028029 (not c!103675)) b!1028026))

(assert (= (or b!1028025 b!1028026) bm!43323))

(declare-fun m!946651 () Bool)

(assert (=> bm!43323 m!946651))

(declare-fun m!946653 () Bool)

(assert (=> bm!43323 m!946653))

(assert (=> b!1028027 m!946651))

(assert (=> b!1028027 m!946651))

(declare-fun m!946655 () Bool)

(assert (=> b!1028027 m!946655))

(assert (=> b!1028028 m!946651))

(assert (=> b!1028028 m!946651))

(declare-fun m!946657 () Bool)

(assert (=> b!1028028 m!946657))

(assert (=> b!1028029 m!946651))

(assert (=> b!1028029 m!946651))

(assert (=> b!1028029 m!946655))

(assert (=> bm!43315 d!122791))

(declare-fun d!122793 () Bool)

(declare-fun get!16342 (Option!635) V!37269)

(assert (=> d!122793 (= (apply!900 lt!452655 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16342 (getValueByKey!584 (toList!6851 lt!452655) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!29995 () Bool)

(assert (= bs!29995 d!122793))

(declare-fun m!946659 () Bool)

(assert (=> bs!29995 m!946659))

(assert (=> bs!29995 m!946659))

(declare-fun m!946661 () Bool)

(assert (=> bs!29995 m!946661))

(assert (=> b!1027930 d!122793))

(declare-fun d!122795 () Bool)

(assert (=> d!122795 (= (apply!900 lt!452618 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16342 (getValueByKey!584 (toList!6851 lt!452618) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!29996 () Bool)

(assert (= bs!29996 d!122795))

(declare-fun m!946663 () Bool)

(assert (=> bs!29996 m!946663))

(assert (=> bs!29996 m!946663))

(declare-fun m!946665 () Bool)

(assert (=> bs!29996 m!946665))

(assert (=> b!1027894 d!122795))

(declare-fun d!122797 () Bool)

(declare-fun lt!452727 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!508 (List!21812) (InoxSet (_ BitVec 64)))

(assert (=> d!122797 (= lt!452727 (select (content!508 Nil!21809) (select (arr!31131 lt!452522) #b00000000000000000000000000000000)))))

(declare-fun e!580274 () Bool)

(assert (=> d!122797 (= lt!452727 e!580274)))

(declare-fun res!687981 () Bool)

(assert (=> d!122797 (=> (not res!687981) (not e!580274))))

(assert (=> d!122797 (= res!687981 ((_ is Cons!21808) Nil!21809))))

(assert (=> d!122797 (= (contains!5965 Nil!21809 (select (arr!31131 lt!452522) #b00000000000000000000000000000000)) lt!452727)))

(declare-fun b!1028034 () Bool)

(declare-fun e!580273 () Bool)

(assert (=> b!1028034 (= e!580274 e!580273)))

(declare-fun res!687980 () Bool)

(assert (=> b!1028034 (=> res!687980 e!580273)))

(assert (=> b!1028034 (= res!687980 (= (h!23006 Nil!21809) (select (arr!31131 lt!452522) #b00000000000000000000000000000000)))))

(declare-fun b!1028035 () Bool)

(assert (=> b!1028035 (= e!580273 (contains!5965 (t!30884 Nil!21809) (select (arr!31131 lt!452522) #b00000000000000000000000000000000)))))

(assert (= (and d!122797 res!687981) b!1028034))

(assert (= (and b!1028034 (not res!687980)) b!1028035))

(declare-fun m!946667 () Bool)

(assert (=> d!122797 m!946667))

(assert (=> d!122797 m!946401))

(declare-fun m!946669 () Bool)

(assert (=> d!122797 m!946669))

(assert (=> b!1028035 m!946401))

(declare-fun m!946671 () Bool)

(assert (=> b!1028035 m!946671))

(assert (=> b!1027952 d!122797))

(declare-fun d!122799 () Bool)

(declare-fun e!580277 () Bool)

(assert (=> d!122799 e!580277))

(declare-fun res!687986 () Bool)

(assert (=> d!122799 (=> (not res!687986) (not e!580277))))

(declare-fun lt!452737 () ListLongMap!13671)

(assert (=> d!122799 (= res!687986 (contains!5964 lt!452737 (_1!7779 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))))))

(declare-fun lt!452736 () List!21811)

(assert (=> d!122799 (= lt!452737 (ListLongMap!13672 lt!452736))))

(declare-fun lt!452739 () Unit!33555)

(declare-fun lt!452738 () Unit!33555)

(assert (=> d!122799 (= lt!452739 lt!452738)))

(assert (=> d!122799 (= (getValueByKey!584 lt!452736 (_1!7779 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!275 (List!21811 (_ BitVec 64) V!37269) Unit!33555)

(assert (=> d!122799 (= lt!452738 (lemmaContainsTupThenGetReturnValue!275 lt!452736 (_1!7779 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))))))

(declare-fun insertStrictlySorted!368 (List!21811 (_ BitVec 64) V!37269) List!21811)

(assert (=> d!122799 (= lt!452736 (insertStrictlySorted!368 (toList!6851 call!43309) (_1!7779 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))))))

(assert (=> d!122799 (= (+!3098 call!43309 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))) lt!452737)))

(declare-fun b!1028040 () Bool)

(declare-fun res!687987 () Bool)

(assert (=> b!1028040 (=> (not res!687987) (not e!580277))))

(assert (=> b!1028040 (= res!687987 (= (getValueByKey!584 (toList!6851 lt!452737) (_1!7779 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))))))))

(declare-fun b!1028041 () Bool)

(declare-fun contains!5966 (List!21811 tuple2!15536) Bool)

(assert (=> b!1028041 (= e!580277 (contains!5966 (toList!6851 lt!452737) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))))))

(assert (= (and d!122799 res!687986) b!1028040))

(assert (= (and b!1028040 res!687987) b!1028041))

(declare-fun m!946673 () Bool)

(assert (=> d!122799 m!946673))

(declare-fun m!946675 () Bool)

(assert (=> d!122799 m!946675))

(declare-fun m!946677 () Bool)

(assert (=> d!122799 m!946677))

(declare-fun m!946679 () Bool)

(assert (=> d!122799 m!946679))

(declare-fun m!946681 () Bool)

(assert (=> b!1028040 m!946681))

(declare-fun m!946683 () Bool)

(assert (=> b!1028041 m!946683))

(assert (=> b!1027931 d!122799))

(declare-fun d!122801 () Bool)

(declare-fun e!580278 () Bool)

(assert (=> d!122801 e!580278))

(declare-fun res!687988 () Bool)

(assert (=> d!122801 (=> (not res!687988) (not e!580278))))

(declare-fun lt!452741 () ListLongMap!13671)

(assert (=> d!122801 (= res!687988 (contains!5964 lt!452741 (_1!7779 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))))))

(declare-fun lt!452740 () List!21811)

(assert (=> d!122801 (= lt!452741 (ListLongMap!13672 lt!452740))))

(declare-fun lt!452743 () Unit!33555)

(declare-fun lt!452742 () Unit!33555)

(assert (=> d!122801 (= lt!452743 lt!452742)))

(assert (=> d!122801 (= (getValueByKey!584 lt!452740 (_1!7779 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))))))

(assert (=> d!122801 (= lt!452742 (lemmaContainsTupThenGetReturnValue!275 lt!452740 (_1!7779 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))))))

(assert (=> d!122801 (= lt!452740 (insertStrictlySorted!368 (toList!6851 call!43299) (_1!7779 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))))))

(assert (=> d!122801 (= (+!3098 call!43299 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))) lt!452741)))

(declare-fun b!1028042 () Bool)

(declare-fun res!687989 () Bool)

(assert (=> b!1028042 (=> (not res!687989) (not e!580278))))

(assert (=> b!1028042 (= res!687989 (= (getValueByKey!584 (toList!6851 lt!452741) (_1!7779 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))))))))

(declare-fun b!1028043 () Bool)

(assert (=> b!1028043 (= e!580278 (contains!5966 (toList!6851 lt!452741) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))))))

(assert (= (and d!122801 res!687988) b!1028042))

(assert (= (and b!1028042 res!687989) b!1028043))

(declare-fun m!946685 () Bool)

(assert (=> d!122801 m!946685))

(declare-fun m!946687 () Bool)

(assert (=> d!122801 m!946687))

(declare-fun m!946689 () Bool)

(assert (=> d!122801 m!946689))

(declare-fun m!946691 () Bool)

(assert (=> d!122801 m!946691))

(declare-fun m!946693 () Bool)

(assert (=> b!1028042 m!946693))

(declare-fun m!946695 () Bool)

(assert (=> b!1028043 m!946695))

(assert (=> b!1027895 d!122801))

(declare-fun bm!43324 () Bool)

(declare-fun call!43327 () (_ BitVec 32))

(assert (=> bm!43324 (= call!43327 (arrayCountValidKeys!0 lt!452522 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31644 (_keys!11245 thiss!1427))))))

(declare-fun b!1028044 () Bool)

(declare-fun e!580279 () (_ BitVec 32))

(assert (=> b!1028044 (= e!580279 (bvadd #b00000000000000000000000000000001 call!43327))))

(declare-fun b!1028045 () Bool)

(assert (=> b!1028045 (= e!580279 call!43327)))

(declare-fun d!122803 () Bool)

(declare-fun lt!452744 () (_ BitVec 32))

(assert (=> d!122803 (and (bvsge lt!452744 #b00000000000000000000000000000000) (bvsle lt!452744 (bvsub (size!31644 lt!452522) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!580280 () (_ BitVec 32))

(assert (=> d!122803 (= lt!452744 e!580280)))

(declare-fun c!103677 () Bool)

(assert (=> d!122803 (= c!103677 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31644 (_keys!11245 thiss!1427))))))

(assert (=> d!122803 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31644 (_keys!11245 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31644 (_keys!11245 thiss!1427)) (size!31644 lt!452522)))))

(assert (=> d!122803 (= (arrayCountValidKeys!0 lt!452522 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31644 (_keys!11245 thiss!1427))) lt!452744)))

(declare-fun b!1028046 () Bool)

(assert (=> b!1028046 (= e!580280 #b00000000000000000000000000000000)))

(declare-fun b!1028047 () Bool)

(assert (=> b!1028047 (= e!580280 e!580279)))

(declare-fun c!103676 () Bool)

(assert (=> b!1028047 (= c!103676 (validKeyInArray!0 (select (arr!31131 lt!452522) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!122803 c!103677) b!1028046))

(assert (= (and d!122803 (not c!103677)) b!1028047))

(assert (= (and b!1028047 c!103676) b!1028044))

(assert (= (and b!1028047 (not c!103676)) b!1028045))

(assert (= (or b!1028044 b!1028045) bm!43324))

(declare-fun m!946697 () Bool)

(assert (=> bm!43324 m!946697))

(assert (=> b!1028047 m!946651))

(assert (=> b!1028047 m!946651))

(assert (=> b!1028047 m!946655))

(assert (=> bm!43280 d!122803))

(declare-fun bm!43325 () Bool)

(declare-fun call!43328 () (_ BitVec 32))

(assert (=> bm!43325 (= call!43328 (arrayCountValidKeys!0 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31644 (_keys!11245 thiss!1427))))))

(declare-fun b!1028048 () Bool)

(declare-fun e!580281 () (_ BitVec 32))

(assert (=> b!1028048 (= e!580281 (bvadd #b00000000000000000000000000000001 call!43328))))

(declare-fun b!1028049 () Bool)

(assert (=> b!1028049 (= e!580281 call!43328)))

(declare-fun d!122805 () Bool)

(declare-fun lt!452745 () (_ BitVec 32))

(assert (=> d!122805 (and (bvsge lt!452745 #b00000000000000000000000000000000) (bvsle lt!452745 (bvsub (size!31644 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun e!580282 () (_ BitVec 32))

(assert (=> d!122805 (= lt!452745 e!580282)))

(declare-fun c!103679 () Bool)

(assert (=> d!122805 (= c!103679 (bvsge #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))))))

(assert (=> d!122805 (and (bvsle #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31644 (_keys!11245 thiss!1427)) (size!31644 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))))))))

(assert (=> d!122805 (= (arrayCountValidKeys!0 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))) lt!452745)))

(declare-fun b!1028050 () Bool)

(assert (=> b!1028050 (= e!580282 #b00000000000000000000000000000000)))

(declare-fun b!1028051 () Bool)

(assert (=> b!1028051 (= e!580282 e!580281)))

(declare-fun c!103678 () Bool)

(assert (=> b!1028051 (= c!103678 (validKeyInArray!0 (select (arr!31131 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!122805 c!103679) b!1028050))

(assert (= (and d!122805 (not c!103679)) b!1028051))

(assert (= (and b!1028051 c!103678) b!1028048))

(assert (= (and b!1028051 (not c!103678)) b!1028049))

(assert (= (or b!1028048 b!1028049) bm!43325))

(declare-fun m!946699 () Bool)

(assert (=> bm!43325 m!946699))

(assert (=> b!1028051 m!946583))

(assert (=> b!1028051 m!946583))

(assert (=> b!1028051 m!946587))

(assert (=> b!1027832 d!122805))

(assert (=> b!1027832 d!122765))

(declare-fun d!122807 () Bool)

(assert (=> d!122807 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1027830 d!122807))

(declare-fun b!1028052 () Bool)

(declare-fun e!580285 () Bool)

(declare-fun call!43329 () Bool)

(assert (=> b!1028052 (= e!580285 call!43329)))

(declare-fun b!1028053 () Bool)

(assert (=> b!1028053 (= e!580285 call!43329)))

(declare-fun c!103680 () Bool)

(declare-fun bm!43326 () Bool)

(assert (=> bm!43326 (= call!43329 (arrayNoDuplicates!0 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103680 (Cons!21808 (select (arr!31131 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427)))) #b00000000000000000000000000000000) Nil!21809) Nil!21809)))))

(declare-fun b!1028054 () Bool)

(declare-fun e!580284 () Bool)

(declare-fun e!580286 () Bool)

(assert (=> b!1028054 (= e!580284 e!580286)))

(declare-fun res!687991 () Bool)

(assert (=> b!1028054 (=> (not res!687991) (not e!580286))))

(declare-fun e!580283 () Bool)

(assert (=> b!1028054 (= res!687991 (not e!580283))))

(declare-fun res!687992 () Bool)

(assert (=> b!1028054 (=> (not res!687992) (not e!580283))))

(assert (=> b!1028054 (= res!687992 (validKeyInArray!0 (select (arr!31131 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!122809 () Bool)

(declare-fun res!687990 () Bool)

(assert (=> d!122809 (=> res!687990 e!580284)))

(assert (=> d!122809 (= res!687990 (bvsge #b00000000000000000000000000000000 (size!31644 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))))))))

(assert (=> d!122809 (= (arrayNoDuplicates!0 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) #b00000000000000000000000000000000 Nil!21809) e!580284)))

(declare-fun b!1028055 () Bool)

(assert (=> b!1028055 (= e!580283 (contains!5965 Nil!21809 (select (arr!31131 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1028056 () Bool)

(assert (=> b!1028056 (= e!580286 e!580285)))

(assert (=> b!1028056 (= c!103680 (validKeyInArray!0 (select (arr!31131 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!122809 (not res!687990)) b!1028054))

(assert (= (and b!1028054 res!687992) b!1028055))

(assert (= (and b!1028054 res!687991) b!1028056))

(assert (= (and b!1028056 c!103680) b!1028052))

(assert (= (and b!1028056 (not c!103680)) b!1028053))

(assert (= (or b!1028052 b!1028053) bm!43326))

(assert (=> bm!43326 m!946583))

(declare-fun m!946701 () Bool)

(assert (=> bm!43326 m!946701))

(assert (=> b!1028054 m!946583))

(assert (=> b!1028054 m!946583))

(assert (=> b!1028054 m!946587))

(assert (=> b!1028055 m!946583))

(assert (=> b!1028055 m!946583))

(declare-fun m!946703 () Bool)

(assert (=> b!1028055 m!946703))

(assert (=> b!1028056 m!946583))

(assert (=> b!1028056 m!946583))

(assert (=> b!1028056 m!946587))

(assert (=> b!1027820 d!122809))

(declare-fun d!122811 () Bool)

(assert (=> d!122811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) (mask!29820 thiss!1427))))

(assert (=> d!122811 true))

(declare-fun _$44!9 () Unit!33555)

(assert (=> d!122811 (= (choose!25 (_keys!11245 thiss!1427) (index!41080 lt!452520) (mask!29820 thiss!1427)) _$44!9)))

(declare-fun bs!29997 () Bool)

(assert (= bs!29997 d!122811))

(assert (=> bs!29997 m!946335))

(assert (=> bs!29997 m!946559))

(assert (=> d!122771 d!122811))

(assert (=> d!122771 d!122783))

(declare-fun d!122813 () Bool)

(assert (=> d!122813 (= (validKeyInArray!0 (select (arr!31131 lt!452522) #b00000000000000000000000000000000)) (and (not (= (select (arr!31131 lt!452522) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31131 lt!452522) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1027916 d!122813))

(declare-fun d!122815 () Bool)

(assert (=> d!122815 (= (validKeyInArray!0 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1027880 d!122815))

(assert (=> b!1027919 d!122813))

(assert (=> b!1027883 d!122815))

(declare-fun b!1028057 () Bool)

(declare-fun e!580289 () Bool)

(declare-fun call!43330 () Bool)

(assert (=> b!1028057 (= e!580289 call!43330)))

(declare-fun bm!43327 () Bool)

(assert (=> bm!43327 (= call!43330 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11245 thiss!1427) (mask!29820 thiss!1427)))))

(declare-fun b!1028058 () Bool)

(declare-fun e!580288 () Bool)

(assert (=> b!1028058 (= e!580288 e!580289)))

(declare-fun c!103681 () Bool)

(assert (=> b!1028058 (= c!103681 (validKeyInArray!0 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028060 () Bool)

(declare-fun e!580287 () Bool)

(assert (=> b!1028060 (= e!580287 call!43330)))

(declare-fun b!1028059 () Bool)

(assert (=> b!1028059 (= e!580289 e!580287)))

(declare-fun lt!452747 () (_ BitVec 64))

(assert (=> b!1028059 (= lt!452747 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452746 () Unit!33555)

(assert (=> b!1028059 (= lt!452746 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11245 thiss!1427) lt!452747 #b00000000000000000000000000000000))))

(assert (=> b!1028059 (arrayContainsKey!0 (_keys!11245 thiss!1427) lt!452747 #b00000000000000000000000000000000)))

(declare-fun lt!452748 () Unit!33555)

(assert (=> b!1028059 (= lt!452748 lt!452746)))

(declare-fun res!687993 () Bool)

(assert (=> b!1028059 (= res!687993 (= (seekEntryOrOpen!0 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000) (_keys!11245 thiss!1427) (mask!29820 thiss!1427)) (Found!9677 #b00000000000000000000000000000000)))))

(assert (=> b!1028059 (=> (not res!687993) (not e!580287))))

(declare-fun d!122817 () Bool)

(declare-fun res!687994 () Bool)

(assert (=> d!122817 (=> res!687994 e!580288)))

(assert (=> d!122817 (= res!687994 (bvsge #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))))))

(assert (=> d!122817 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11245 thiss!1427) (mask!29820 thiss!1427)) e!580288)))

(assert (= (and d!122817 (not res!687994)) b!1028058))

(assert (= (and b!1028058 c!103681) b!1028059))

(assert (= (and b!1028058 (not c!103681)) b!1028057))

(assert (= (and b!1028059 res!687993) b!1028060))

(assert (= (or b!1028060 b!1028057) bm!43327))

(declare-fun m!946705 () Bool)

(assert (=> bm!43327 m!946705))

(assert (=> b!1028058 m!946425))

(assert (=> b!1028058 m!946425))

(assert (=> b!1028058 m!946429))

(assert (=> b!1028059 m!946425))

(declare-fun m!946707 () Bool)

(assert (=> b!1028059 m!946707))

(declare-fun m!946709 () Bool)

(assert (=> b!1028059 m!946709))

(assert (=> b!1028059 m!946425))

(declare-fun m!946711 () Bool)

(assert (=> b!1028059 m!946711))

(assert (=> b!1027964 d!122817))

(declare-fun b!1028079 () Bool)

(declare-fun e!580304 () SeekEntryResult!9677)

(declare-fun e!580301 () SeekEntryResult!9677)

(assert (=> b!1028079 (= e!580304 e!580301)))

(declare-fun c!103690 () Bool)

(declare-fun lt!452753 () (_ BitVec 64))

(assert (=> b!1028079 (= c!103690 (or (= lt!452753 key!909) (= (bvadd lt!452753 lt!452753) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1028080 () Bool)

(assert (=> b!1028080 (= e!580304 (Intermediate!9677 true (toIndex!0 key!909 (mask!29820 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1028081 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1028081 (= e!580301 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!29820 thiss!1427)) #b00000000000000000000000000000000 (mask!29820 thiss!1427)) key!909 (_keys!11245 thiss!1427) (mask!29820 thiss!1427)))))

(declare-fun b!1028082 () Bool)

(declare-fun lt!452754 () SeekEntryResult!9677)

(assert (=> b!1028082 (and (bvsge (index!41081 lt!452754) #b00000000000000000000000000000000) (bvslt (index!41081 lt!452754) (size!31644 (_keys!11245 thiss!1427))))))

(declare-fun res!688001 () Bool)

(assert (=> b!1028082 (= res!688001 (= (select (arr!31131 (_keys!11245 thiss!1427)) (index!41081 lt!452754)) key!909))))

(declare-fun e!580303 () Bool)

(assert (=> b!1028082 (=> res!688001 e!580303)))

(declare-fun e!580302 () Bool)

(assert (=> b!1028082 (= e!580302 e!580303)))

(declare-fun b!1028083 () Bool)

(declare-fun e!580300 () Bool)

(assert (=> b!1028083 (= e!580300 (bvsge (x!91463 lt!452754) #b01111111111111111111111111111110))))

(declare-fun b!1028084 () Bool)

(assert (=> b!1028084 (= e!580301 (Intermediate!9677 false (toIndex!0 key!909 (mask!29820 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1028085 () Bool)

(assert (=> b!1028085 (and (bvsge (index!41081 lt!452754) #b00000000000000000000000000000000) (bvslt (index!41081 lt!452754) (size!31644 (_keys!11245 thiss!1427))))))

(declare-fun res!688003 () Bool)

(assert (=> b!1028085 (= res!688003 (= (select (arr!31131 (_keys!11245 thiss!1427)) (index!41081 lt!452754)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1028085 (=> res!688003 e!580303)))

(declare-fun b!1028086 () Bool)

(assert (=> b!1028086 (and (bvsge (index!41081 lt!452754) #b00000000000000000000000000000000) (bvslt (index!41081 lt!452754) (size!31644 (_keys!11245 thiss!1427))))))

(assert (=> b!1028086 (= e!580303 (= (select (arr!31131 (_keys!11245 thiss!1427)) (index!41081 lt!452754)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!122819 () Bool)

(assert (=> d!122819 e!580300))

(declare-fun c!103689 () Bool)

(assert (=> d!122819 (= c!103689 (and ((_ is Intermediate!9677) lt!452754) (undefined!10489 lt!452754)))))

(assert (=> d!122819 (= lt!452754 e!580304)))

(declare-fun c!103688 () Bool)

(assert (=> d!122819 (= c!103688 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!122819 (= lt!452753 (select (arr!31131 (_keys!11245 thiss!1427)) (toIndex!0 key!909 (mask!29820 thiss!1427))))))

(assert (=> d!122819 (validMask!0 (mask!29820 thiss!1427))))

(assert (=> d!122819 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29820 thiss!1427)) key!909 (_keys!11245 thiss!1427) (mask!29820 thiss!1427)) lt!452754)))

(declare-fun b!1028087 () Bool)

(assert (=> b!1028087 (= e!580300 e!580302)))

(declare-fun res!688002 () Bool)

(assert (=> b!1028087 (= res!688002 (and ((_ is Intermediate!9677) lt!452754) (not (undefined!10489 lt!452754)) (bvslt (x!91463 lt!452754) #b01111111111111111111111111111110) (bvsge (x!91463 lt!452754) #b00000000000000000000000000000000) (bvsge (x!91463 lt!452754) #b00000000000000000000000000000000)))))

(assert (=> b!1028087 (=> (not res!688002) (not e!580302))))

(assert (= (and d!122819 c!103688) b!1028080))

(assert (= (and d!122819 (not c!103688)) b!1028079))

(assert (= (and b!1028079 c!103690) b!1028084))

(assert (= (and b!1028079 (not c!103690)) b!1028081))

(assert (= (and d!122819 c!103689) b!1028083))

(assert (= (and d!122819 (not c!103689)) b!1028087))

(assert (= (and b!1028087 res!688002) b!1028082))

(assert (= (and b!1028082 (not res!688001)) b!1028085))

(assert (= (and b!1028085 (not res!688003)) b!1028086))

(declare-fun m!946713 () Bool)

(assert (=> b!1028082 m!946713))

(assert (=> b!1028086 m!946713))

(assert (=> b!1028081 m!946573))

(declare-fun m!946715 () Bool)

(assert (=> b!1028081 m!946715))

(assert (=> b!1028081 m!946715))

(declare-fun m!946717 () Bool)

(assert (=> b!1028081 m!946717))

(assert (=> d!122819 m!946573))

(declare-fun m!946719 () Bool)

(assert (=> d!122819 m!946719))

(assert (=> d!122819 m!946475))

(assert (=> b!1028085 m!946713))

(assert (=> d!122779 d!122819))

(declare-fun d!122821 () Bool)

(declare-fun lt!452760 () (_ BitVec 32))

(declare-fun lt!452759 () (_ BitVec 32))

(assert (=> d!122821 (= lt!452760 (bvmul (bvxor lt!452759 (bvlshr lt!452759 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!122821 (= lt!452759 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!122821 (and (bvsge (mask!29820 thiss!1427) #b00000000000000000000000000000000) (let ((res!688004 (let ((h!23009 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!91494 (bvmul (bvxor h!23009 (bvlshr h!23009 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!91494 (bvlshr x!91494 #b00000000000000000000000000001101)) (mask!29820 thiss!1427)))))) (and (bvslt res!688004 (bvadd (mask!29820 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!688004 #b00000000000000000000000000000000))))))

(assert (=> d!122821 (= (toIndex!0 key!909 (mask!29820 thiss!1427)) (bvand (bvxor lt!452760 (bvlshr lt!452760 #b00000000000000000000000000001101)) (mask!29820 thiss!1427)))))

(assert (=> d!122779 d!122821))

(assert (=> d!122779 d!122783))

(declare-fun b!1028099 () Bool)

(declare-fun e!580307 () Bool)

(assert (=> b!1028099 (= e!580307 (and (bvsge (extraKeys!5828 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5828 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2797 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1028096 () Bool)

(declare-fun res!688016 () Bool)

(assert (=> b!1028096 (=> (not res!688016) (not e!580307))))

(assert (=> b!1028096 (= res!688016 (and (= (size!31645 (_values!6119 thiss!1427)) (bvadd (mask!29820 thiss!1427) #b00000000000000000000000000000001)) (= (size!31644 (_keys!11245 thiss!1427)) (size!31645 (_values!6119 thiss!1427))) (bvsge (_size!2797 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2797 thiss!1427) (bvadd (mask!29820 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1028098 () Bool)

(declare-fun res!688015 () Bool)

(assert (=> b!1028098 (=> (not res!688015) (not e!580307))))

(declare-fun size!31648 (LongMapFixedSize!5484) (_ BitVec 32))

(assert (=> b!1028098 (= res!688015 (= (size!31648 thiss!1427) (bvadd (_size!2797 thiss!1427) (bvsdiv (bvadd (extraKeys!5828 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!122823 () Bool)

(declare-fun res!688014 () Bool)

(assert (=> d!122823 (=> (not res!688014) (not e!580307))))

(assert (=> d!122823 (= res!688014 (validMask!0 (mask!29820 thiss!1427)))))

(assert (=> d!122823 (= (simpleValid!391 thiss!1427) e!580307)))

(declare-fun b!1028097 () Bool)

(declare-fun res!688013 () Bool)

(assert (=> b!1028097 (=> (not res!688013) (not e!580307))))

(assert (=> b!1028097 (= res!688013 (bvsge (size!31648 thiss!1427) (_size!2797 thiss!1427)))))

(assert (= (and d!122823 res!688014) b!1028096))

(assert (= (and b!1028096 res!688016) b!1028097))

(assert (= (and b!1028097 res!688013) b!1028098))

(assert (= (and b!1028098 res!688015) b!1028099))

(declare-fun m!946721 () Bool)

(assert (=> b!1028098 m!946721))

(assert (=> d!122823 m!946475))

(assert (=> b!1028097 m!946721))

(assert (=> d!122773 d!122823))

(declare-fun b!1028100 () Bool)

(declare-fun e!580310 () Bool)

(declare-fun call!43331 () Bool)

(assert (=> b!1028100 (= e!580310 call!43331)))

(declare-fun bm!43328 () Bool)

(assert (=> bm!43328 (= call!43331 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!452522 (mask!29820 thiss!1427)))))

(declare-fun b!1028101 () Bool)

(declare-fun e!580309 () Bool)

(assert (=> b!1028101 (= e!580309 e!580310)))

(declare-fun c!103691 () Bool)

(assert (=> b!1028101 (= c!103691 (validKeyInArray!0 (select (arr!31131 lt!452522) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1028103 () Bool)

(declare-fun e!580308 () Bool)

(assert (=> b!1028103 (= e!580308 call!43331)))

(declare-fun b!1028102 () Bool)

(assert (=> b!1028102 (= e!580310 e!580308)))

(declare-fun lt!452762 () (_ BitVec 64))

(assert (=> b!1028102 (= lt!452762 (select (arr!31131 lt!452522) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!452761 () Unit!33555)

(assert (=> b!1028102 (= lt!452761 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!452522 lt!452762 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1028102 (arrayContainsKey!0 lt!452522 lt!452762 #b00000000000000000000000000000000)))

(declare-fun lt!452763 () Unit!33555)

(assert (=> b!1028102 (= lt!452763 lt!452761)))

(declare-fun res!688017 () Bool)

(assert (=> b!1028102 (= res!688017 (= (seekEntryOrOpen!0 (select (arr!31131 lt!452522) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!452522 (mask!29820 thiss!1427)) (Found!9677 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1028102 (=> (not res!688017) (not e!580308))))

(declare-fun d!122825 () Bool)

(declare-fun res!688018 () Bool)

(assert (=> d!122825 (=> res!688018 e!580309)))

(assert (=> d!122825 (= res!688018 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31644 lt!452522)))))

(assert (=> d!122825 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!452522 (mask!29820 thiss!1427)) e!580309)))

(assert (= (and d!122825 (not res!688018)) b!1028101))

(assert (= (and b!1028101 c!103691) b!1028102))

(assert (= (and b!1028101 (not c!103691)) b!1028100))

(assert (= (and b!1028102 res!688017) b!1028103))

(assert (= (or b!1028103 b!1028100) bm!43328))

(declare-fun m!946723 () Bool)

(assert (=> bm!43328 m!946723))

(assert (=> b!1028101 m!946651))

(assert (=> b!1028101 m!946651))

(assert (=> b!1028101 m!946655))

(assert (=> b!1028102 m!946651))

(declare-fun m!946725 () Bool)

(assert (=> b!1028102 m!946725))

(declare-fun m!946727 () Bool)

(assert (=> b!1028102 m!946727))

(assert (=> b!1028102 m!946651))

(declare-fun m!946729 () Bool)

(assert (=> b!1028102 m!946729))

(assert (=> bm!43304 d!122825))

(declare-fun d!122827 () Bool)

(assert (=> d!122827 (arrayContainsKey!0 lt!452522 lt!452644 #b00000000000000000000000000000000)))

(declare-fun lt!452766 () Unit!33555)

(declare-fun choose!13 (array!64646 (_ BitVec 64) (_ BitVec 32)) Unit!33555)

(assert (=> d!122827 (= lt!452766 (choose!13 lt!452522 lt!452644 #b00000000000000000000000000000000))))

(assert (=> d!122827 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!122827 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!452522 lt!452644 #b00000000000000000000000000000000) lt!452766)))

(declare-fun bs!29998 () Bool)

(assert (= bs!29998 d!122827))

(assert (=> bs!29998 m!946491))

(declare-fun m!946731 () Bool)

(assert (=> bs!29998 m!946731))

(assert (=> b!1027909 d!122827))

(declare-fun d!122829 () Bool)

(declare-fun res!688019 () Bool)

(declare-fun e!580311 () Bool)

(assert (=> d!122829 (=> res!688019 e!580311)))

(assert (=> d!122829 (= res!688019 (= (select (arr!31131 lt!452522) #b00000000000000000000000000000000) lt!452644))))

(assert (=> d!122829 (= (arrayContainsKey!0 lt!452522 lt!452644 #b00000000000000000000000000000000) e!580311)))

(declare-fun b!1028104 () Bool)

(declare-fun e!580312 () Bool)

(assert (=> b!1028104 (= e!580311 e!580312)))

(declare-fun res!688020 () Bool)

(assert (=> b!1028104 (=> (not res!688020) (not e!580312))))

(assert (=> b!1028104 (= res!688020 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31644 lt!452522)))))

(declare-fun b!1028105 () Bool)

(assert (=> b!1028105 (= e!580312 (arrayContainsKey!0 lt!452522 lt!452644 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!122829 (not res!688019)) b!1028104))

(assert (= (and b!1028104 res!688020) b!1028105))

(assert (=> d!122829 m!946401))

(declare-fun m!946733 () Bool)

(assert (=> b!1028105 m!946733))

(assert (=> b!1027909 d!122829))

(declare-fun b!1028118 () Bool)

(declare-fun e!580320 () SeekEntryResult!9677)

(assert (=> b!1028118 (= e!580320 Undefined!9677)))

(declare-fun b!1028119 () Bool)

(declare-fun c!103700 () Bool)

(declare-fun lt!452773 () (_ BitVec 64))

(assert (=> b!1028119 (= c!103700 (= lt!452773 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!580319 () SeekEntryResult!9677)

(declare-fun e!580321 () SeekEntryResult!9677)

(assert (=> b!1028119 (= e!580319 e!580321)))

(declare-fun b!1028120 () Bool)

(assert (=> b!1028120 (= e!580320 e!580319)))

(declare-fun lt!452774 () SeekEntryResult!9677)

(assert (=> b!1028120 (= lt!452773 (select (arr!31131 lt!452522) (index!41081 lt!452774)))))

(declare-fun c!103698 () Bool)

(assert (=> b!1028120 (= c!103698 (= lt!452773 (select (arr!31131 lt!452522) #b00000000000000000000000000000000)))))

(declare-fun b!1028121 () Bool)

(assert (=> b!1028121 (= e!580321 (MissingZero!9677 (index!41081 lt!452774)))))

(declare-fun b!1028122 () Bool)

(assert (=> b!1028122 (= e!580319 (Found!9677 (index!41081 lt!452774)))))

(declare-fun d!122831 () Bool)

(declare-fun lt!452775 () SeekEntryResult!9677)

(assert (=> d!122831 (and (or ((_ is Undefined!9677) lt!452775) (not ((_ is Found!9677) lt!452775)) (and (bvsge (index!41080 lt!452775) #b00000000000000000000000000000000) (bvslt (index!41080 lt!452775) (size!31644 lt!452522)))) (or ((_ is Undefined!9677) lt!452775) ((_ is Found!9677) lt!452775) (not ((_ is MissingZero!9677) lt!452775)) (and (bvsge (index!41079 lt!452775) #b00000000000000000000000000000000) (bvslt (index!41079 lt!452775) (size!31644 lt!452522)))) (or ((_ is Undefined!9677) lt!452775) ((_ is Found!9677) lt!452775) ((_ is MissingZero!9677) lt!452775) (not ((_ is MissingVacant!9677) lt!452775)) (and (bvsge (index!41082 lt!452775) #b00000000000000000000000000000000) (bvslt (index!41082 lt!452775) (size!31644 lt!452522)))) (or ((_ is Undefined!9677) lt!452775) (ite ((_ is Found!9677) lt!452775) (= (select (arr!31131 lt!452522) (index!41080 lt!452775)) (select (arr!31131 lt!452522) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9677) lt!452775) (= (select (arr!31131 lt!452522) (index!41079 lt!452775)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9677) lt!452775) (= (select (arr!31131 lt!452522) (index!41082 lt!452775)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!122831 (= lt!452775 e!580320)))

(declare-fun c!103699 () Bool)

(assert (=> d!122831 (= c!103699 (and ((_ is Intermediate!9677) lt!452774) (undefined!10489 lt!452774)))))

(assert (=> d!122831 (= lt!452774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31131 lt!452522) #b00000000000000000000000000000000) (mask!29820 thiss!1427)) (select (arr!31131 lt!452522) #b00000000000000000000000000000000) lt!452522 (mask!29820 thiss!1427)))))

(assert (=> d!122831 (validMask!0 (mask!29820 thiss!1427))))

(assert (=> d!122831 (= (seekEntryOrOpen!0 (select (arr!31131 lt!452522) #b00000000000000000000000000000000) lt!452522 (mask!29820 thiss!1427)) lt!452775)))

(declare-fun b!1028123 () Bool)

(assert (=> b!1028123 (= e!580321 (seekKeyOrZeroReturnVacant!0 (x!91463 lt!452774) (index!41081 lt!452774) (index!41081 lt!452774) (select (arr!31131 lt!452522) #b00000000000000000000000000000000) lt!452522 (mask!29820 thiss!1427)))))

(assert (= (and d!122831 c!103699) b!1028118))

(assert (= (and d!122831 (not c!103699)) b!1028120))

(assert (= (and b!1028120 c!103698) b!1028122))

(assert (= (and b!1028120 (not c!103698)) b!1028119))

(assert (= (and b!1028119 c!103700) b!1028121))

(assert (= (and b!1028119 (not c!103700)) b!1028123))

(declare-fun m!946735 () Bool)

(assert (=> b!1028120 m!946735))

(assert (=> d!122831 m!946475))

(declare-fun m!946737 () Bool)

(assert (=> d!122831 m!946737))

(assert (=> d!122831 m!946401))

(declare-fun m!946739 () Bool)

(assert (=> d!122831 m!946739))

(declare-fun m!946741 () Bool)

(assert (=> d!122831 m!946741))

(assert (=> d!122831 m!946739))

(assert (=> d!122831 m!946401))

(declare-fun m!946743 () Bool)

(assert (=> d!122831 m!946743))

(declare-fun m!946745 () Bool)

(assert (=> d!122831 m!946745))

(assert (=> b!1028123 m!946401))

(declare-fun m!946747 () Bool)

(assert (=> b!1028123 m!946747))

(assert (=> b!1027909 d!122831))

(declare-fun d!122833 () Bool)

(declare-fun e!580322 () Bool)

(assert (=> d!122833 e!580322))

(declare-fun res!688021 () Bool)

(assert (=> d!122833 (=> res!688021 e!580322)))

(declare-fun lt!452779 () Bool)

(assert (=> d!122833 (= res!688021 (not lt!452779))))

(declare-fun lt!452777 () Bool)

(assert (=> d!122833 (= lt!452779 lt!452777)))

(declare-fun lt!452778 () Unit!33555)

(declare-fun e!580323 () Unit!33555)

(assert (=> d!122833 (= lt!452778 e!580323)))

(declare-fun c!103701 () Bool)

(assert (=> d!122833 (= c!103701 lt!452777)))

(assert (=> d!122833 (= lt!452777 (containsKey!559 (toList!6851 lt!452655) (select (arr!31131 lt!452522) #b00000000000000000000000000000000)))))

(assert (=> d!122833 (= (contains!5964 lt!452655 (select (arr!31131 lt!452522) #b00000000000000000000000000000000)) lt!452779)))

(declare-fun b!1028124 () Bool)

(declare-fun lt!452776 () Unit!33555)

(assert (=> b!1028124 (= e!580323 lt!452776)))

(assert (=> b!1028124 (= lt!452776 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6851 lt!452655) (select (arr!31131 lt!452522) #b00000000000000000000000000000000)))))

(assert (=> b!1028124 (isDefined!431 (getValueByKey!584 (toList!6851 lt!452655) (select (arr!31131 lt!452522) #b00000000000000000000000000000000)))))

(declare-fun b!1028125 () Bool)

(declare-fun Unit!33568 () Unit!33555)

(assert (=> b!1028125 (= e!580323 Unit!33568)))

(declare-fun b!1028126 () Bool)

(assert (=> b!1028126 (= e!580322 (isDefined!431 (getValueByKey!584 (toList!6851 lt!452655) (select (arr!31131 lt!452522) #b00000000000000000000000000000000))))))

(assert (= (and d!122833 c!103701) b!1028124))

(assert (= (and d!122833 (not c!103701)) b!1028125))

(assert (= (and d!122833 (not res!688021)) b!1028126))

(assert (=> d!122833 m!946401))

(declare-fun m!946749 () Bool)

(assert (=> d!122833 m!946749))

(assert (=> b!1028124 m!946401))

(declare-fun m!946751 () Bool)

(assert (=> b!1028124 m!946751))

(assert (=> b!1028124 m!946401))

(declare-fun m!946753 () Bool)

(assert (=> b!1028124 m!946753))

(assert (=> b!1028124 m!946753))

(declare-fun m!946755 () Bool)

(assert (=> b!1028124 m!946755))

(assert (=> b!1028126 m!946401))

(assert (=> b!1028126 m!946753))

(assert (=> b!1028126 m!946753))

(assert (=> b!1028126 m!946755))

(assert (=> b!1027924 d!122833))

(declare-fun d!122835 () Bool)

(declare-fun e!580324 () Bool)

(assert (=> d!122835 e!580324))

(declare-fun res!688022 () Bool)

(assert (=> d!122835 (=> res!688022 e!580324)))

(declare-fun lt!452783 () Bool)

(assert (=> d!122835 (= res!688022 (not lt!452783))))

(declare-fun lt!452781 () Bool)

(assert (=> d!122835 (= lt!452783 lt!452781)))

(declare-fun lt!452782 () Unit!33555)

(declare-fun e!580325 () Unit!33555)

(assert (=> d!122835 (= lt!452782 e!580325)))

(declare-fun c!103702 () Bool)

(assert (=> d!122835 (= c!103702 lt!452781)))

(assert (=> d!122835 (= lt!452781 (containsKey!559 (toList!6851 lt!452618) (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!122835 (= (contains!5964 lt!452618 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)) lt!452783)))

(declare-fun b!1028127 () Bool)

(declare-fun lt!452780 () Unit!33555)

(assert (=> b!1028127 (= e!580325 lt!452780)))

(assert (=> b!1028127 (= lt!452780 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6851 lt!452618) (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1028127 (isDefined!431 (getValueByKey!584 (toList!6851 lt!452618) (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028128 () Bool)

(declare-fun Unit!33569 () Unit!33555)

(assert (=> b!1028128 (= e!580325 Unit!33569)))

(declare-fun b!1028129 () Bool)

(assert (=> b!1028129 (= e!580324 (isDefined!431 (getValueByKey!584 (toList!6851 lt!452618) (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!122835 c!103702) b!1028127))

(assert (= (and d!122835 (not c!103702)) b!1028128))

(assert (= (and d!122835 (not res!688022)) b!1028129))

(assert (=> d!122835 m!946425))

(declare-fun m!946757 () Bool)

(assert (=> d!122835 m!946757))

(assert (=> b!1028127 m!946425))

(declare-fun m!946759 () Bool)

(assert (=> b!1028127 m!946759))

(assert (=> b!1028127 m!946425))

(declare-fun m!946761 () Bool)

(assert (=> b!1028127 m!946761))

(assert (=> b!1028127 m!946761))

(declare-fun m!946763 () Bool)

(assert (=> b!1028127 m!946763))

(assert (=> b!1028129 m!946425))

(assert (=> b!1028129 m!946761))

(assert (=> b!1028129 m!946761))

(assert (=> b!1028129 m!946763))

(assert (=> b!1027888 d!122835))

(declare-fun d!122837 () Bool)

(declare-fun res!688023 () Bool)

(declare-fun e!580326 () Bool)

(assert (=> d!122837 (=> res!688023 e!580326)))

(assert (=> d!122837 (= res!688023 (= (select (arr!31131 lt!452522) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!122837 (= (arrayContainsKey!0 lt!452522 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!580326)))

(declare-fun b!1028130 () Bool)

(declare-fun e!580327 () Bool)

(assert (=> b!1028130 (= e!580326 e!580327)))

(declare-fun res!688024 () Bool)

(assert (=> b!1028130 (=> (not res!688024) (not e!580327))))

(assert (=> b!1028130 (= res!688024 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31644 lt!452522)))))

(declare-fun b!1028131 () Bool)

(assert (=> b!1028131 (= e!580327 (arrayContainsKey!0 lt!452522 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!122837 (not res!688023)) b!1028130))

(assert (= (and b!1028130 res!688024) b!1028131))

(assert (=> d!122837 m!946651))

(declare-fun m!946765 () Bool)

(assert (=> b!1028131 m!946765))

(assert (=> b!1027817 d!122837))

(declare-fun b!1028144 () Bool)

(declare-fun c!103711 () Bool)

(declare-fun lt!452788 () (_ BitVec 64))

(assert (=> b!1028144 (= c!103711 (= lt!452788 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!580335 () SeekEntryResult!9677)

(declare-fun e!580336 () SeekEntryResult!9677)

(assert (=> b!1028144 (= e!580335 e!580336)))

(declare-fun b!1028145 () Bool)

(assert (=> b!1028145 (= e!580336 (seekKeyOrZeroReturnVacant!0 (bvadd (x!91463 lt!452683) #b00000000000000000000000000000001) (nextIndex!0 (index!41081 lt!452683) (x!91463 lt!452683) (mask!29820 thiss!1427)) (index!41081 lt!452683) key!909 (_keys!11245 thiss!1427) (mask!29820 thiss!1427)))))

(declare-fun lt!452789 () SeekEntryResult!9677)

(declare-fun d!122839 () Bool)

(assert (=> d!122839 (and (or ((_ is Undefined!9677) lt!452789) (not ((_ is Found!9677) lt!452789)) (and (bvsge (index!41080 lt!452789) #b00000000000000000000000000000000) (bvslt (index!41080 lt!452789) (size!31644 (_keys!11245 thiss!1427))))) (or ((_ is Undefined!9677) lt!452789) ((_ is Found!9677) lt!452789) (not ((_ is MissingVacant!9677) lt!452789)) (not (= (index!41082 lt!452789) (index!41081 lt!452683))) (and (bvsge (index!41082 lt!452789) #b00000000000000000000000000000000) (bvslt (index!41082 lt!452789) (size!31644 (_keys!11245 thiss!1427))))) (or ((_ is Undefined!9677) lt!452789) (ite ((_ is Found!9677) lt!452789) (= (select (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452789)) key!909) (and ((_ is MissingVacant!9677) lt!452789) (= (index!41082 lt!452789) (index!41081 lt!452683)) (= (select (arr!31131 (_keys!11245 thiss!1427)) (index!41082 lt!452789)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!580334 () SeekEntryResult!9677)

(assert (=> d!122839 (= lt!452789 e!580334)))

(declare-fun c!103710 () Bool)

(assert (=> d!122839 (= c!103710 (bvsge (x!91463 lt!452683) #b01111111111111111111111111111110))))

(assert (=> d!122839 (= lt!452788 (select (arr!31131 (_keys!11245 thiss!1427)) (index!41081 lt!452683)))))

(assert (=> d!122839 (validMask!0 (mask!29820 thiss!1427))))

(assert (=> d!122839 (= (seekKeyOrZeroReturnVacant!0 (x!91463 lt!452683) (index!41081 lt!452683) (index!41081 lt!452683) key!909 (_keys!11245 thiss!1427) (mask!29820 thiss!1427)) lt!452789)))

(declare-fun b!1028146 () Bool)

(assert (=> b!1028146 (= e!580334 Undefined!9677)))

(declare-fun b!1028147 () Bool)

(assert (=> b!1028147 (= e!580336 (MissingVacant!9677 (index!41081 lt!452683)))))

(declare-fun b!1028148 () Bool)

(assert (=> b!1028148 (= e!580334 e!580335)))

(declare-fun c!103709 () Bool)

(assert (=> b!1028148 (= c!103709 (= lt!452788 key!909))))

(declare-fun b!1028149 () Bool)

(assert (=> b!1028149 (= e!580335 (Found!9677 (index!41081 lt!452683)))))

(assert (= (and d!122839 c!103710) b!1028146))

(assert (= (and d!122839 (not c!103710)) b!1028148))

(assert (= (and b!1028148 c!103709) b!1028149))

(assert (= (and b!1028148 (not c!103709)) b!1028144))

(assert (= (and b!1028144 c!103711) b!1028147))

(assert (= (and b!1028144 (not c!103711)) b!1028145))

(declare-fun m!946767 () Bool)

(assert (=> b!1028145 m!946767))

(assert (=> b!1028145 m!946767))

(declare-fun m!946769 () Bool)

(assert (=> b!1028145 m!946769))

(declare-fun m!946771 () Bool)

(assert (=> d!122839 m!946771))

(declare-fun m!946773 () Bool)

(assert (=> d!122839 m!946773))

(assert (=> d!122839 m!946567))

(assert (=> d!122839 m!946475))

(assert (=> b!1027980 d!122839))

(declare-fun d!122841 () Bool)

(assert (=> d!122841 (= (apply!900 lt!452655 (select (arr!31131 lt!452522) #b00000000000000000000000000000000)) (get!16342 (getValueByKey!584 (toList!6851 lt!452655) (select (arr!31131 lt!452522) #b00000000000000000000000000000000))))))

(declare-fun bs!29999 () Bool)

(assert (= bs!29999 d!122841))

(assert (=> bs!29999 m!946401))

(assert (=> bs!29999 m!946753))

(assert (=> bs!29999 m!946753))

(declare-fun m!946775 () Bool)

(assert (=> bs!29999 m!946775))

(assert (=> b!1027925 d!122841))

(declare-fun d!122843 () Bool)

(declare-fun c!103714 () Bool)

(assert (=> d!122843 (= c!103714 ((_ is ValueCellFull!11445) (select (arr!31132 lt!452525) #b00000000000000000000000000000000)))))

(declare-fun e!580339 () V!37269)

(assert (=> d!122843 (= (get!16341 (select (arr!31132 lt!452525) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!580339)))

(declare-fun b!1028154 () Bool)

(declare-fun get!16343 (ValueCell!11445 V!37269) V!37269)

(assert (=> b!1028154 (= e!580339 (get!16343 (select (arr!31132 lt!452525) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1028155 () Bool)

(declare-fun get!16344 (ValueCell!11445 V!37269) V!37269)

(assert (=> b!1028155 (= e!580339 (get!16344 (select (arr!31132 lt!452525) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!122843 c!103714) b!1028154))

(assert (= (and d!122843 (not c!103714)) b!1028155))

(assert (=> b!1028154 m!946495))

(assert (=> b!1028154 m!946343))

(declare-fun m!946777 () Bool)

(assert (=> b!1028154 m!946777))

(assert (=> b!1028155 m!946495))

(assert (=> b!1028155 m!946343))

(declare-fun m!946779 () Bool)

(assert (=> b!1028155 m!946779))

(assert (=> b!1027925 d!122843))

(declare-fun d!122845 () Bool)

(assert (=> d!122845 (= (apply!900 lt!452618 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)) (get!16342 (getValueByKey!584 (toList!6851 lt!452618) (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30000 () Bool)

(assert (= bs!30000 d!122845))

(assert (=> bs!30000 m!946425))

(assert (=> bs!30000 m!946761))

(assert (=> bs!30000 m!946761))

(declare-fun m!946781 () Bool)

(assert (=> bs!30000 m!946781))

(assert (=> b!1027889 d!122845))

(declare-fun d!122847 () Bool)

(declare-fun c!103715 () Bool)

(assert (=> d!122847 (= c!103715 ((_ is ValueCellFull!11445) (select (arr!31132 (_values!6119 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!580340 () V!37269)

(assert (=> d!122847 (= (get!16341 (select (arr!31132 (_values!6119 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!580340)))

(declare-fun b!1028156 () Bool)

(assert (=> b!1028156 (= e!580340 (get!16343 (select (arr!31132 (_values!6119 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1028157 () Bool)

(assert (=> b!1028157 (= e!580340 (get!16344 (select (arr!31132 (_values!6119 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!122847 c!103715) b!1028156))

(assert (= (and d!122847 (not c!103715)) b!1028157))

(assert (=> b!1028156 m!946421))

(assert (=> b!1028156 m!946343))

(declare-fun m!946783 () Bool)

(assert (=> b!1028156 m!946783))

(assert (=> b!1028157 m!946421))

(assert (=> b!1028157 m!946343))

(declare-fun m!946785 () Bool)

(assert (=> b!1028157 m!946785))

(assert (=> b!1027889 d!122847))

(assert (=> d!122755 d!122783))

(assert (=> b!1027951 d!122813))

(declare-fun d!122849 () Bool)

(assert (=> d!122849 (= (apply!900 lt!452655 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16342 (getValueByKey!584 (toList!6851 lt!452655) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30001 () Bool)

(assert (= bs!30001 d!122849))

(assert (=> bs!30001 m!946639))

(assert (=> bs!30001 m!946639))

(declare-fun m!946787 () Bool)

(assert (=> bs!30001 m!946787))

(assert (=> b!1027927 d!122849))

(declare-fun d!122851 () Bool)

(assert (=> d!122851 (= (apply!900 lt!452618 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16342 (getValueByKey!584 (toList!6851 lt!452618) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30002 () Bool)

(assert (= bs!30002 d!122851))

(assert (=> bs!30002 m!946647))

(assert (=> bs!30002 m!946647))

(declare-fun m!946789 () Bool)

(assert (=> bs!30002 m!946789))

(assert (=> b!1027891 d!122851))

(declare-fun d!122853 () Bool)

(assert (=> d!122853 (= (validKeyInArray!0 (select (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520))) (and (not (= (select (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1027829 d!122853))

(declare-fun d!122855 () Bool)

(assert (=> d!122855 (= (apply!900 (+!3098 lt!452657 (tuple2!15537 lt!452660 (minValue!5932 thiss!1427))) lt!452650) (get!16342 (getValueByKey!584 (toList!6851 (+!3098 lt!452657 (tuple2!15537 lt!452660 (minValue!5932 thiss!1427)))) lt!452650)))))

(declare-fun bs!30003 () Bool)

(assert (= bs!30003 d!122855))

(declare-fun m!946791 () Bool)

(assert (=> bs!30003 m!946791))

(assert (=> bs!30003 m!946791))

(declare-fun m!946793 () Bool)

(assert (=> bs!30003 m!946793))

(assert (=> b!1027929 d!122855))

(declare-fun d!122857 () Bool)

(declare-fun e!580341 () Bool)

(assert (=> d!122857 e!580341))

(declare-fun res!688025 () Bool)

(assert (=> d!122857 (=> (not res!688025) (not e!580341))))

(declare-fun lt!452791 () ListLongMap!13671)

(assert (=> d!122857 (= res!688025 (contains!5964 lt!452791 (_1!7779 (tuple2!15537 lt!452653 (minValue!5932 thiss!1427)))))))

(declare-fun lt!452790 () List!21811)

(assert (=> d!122857 (= lt!452791 (ListLongMap!13672 lt!452790))))

(declare-fun lt!452793 () Unit!33555)

(declare-fun lt!452792 () Unit!33555)

(assert (=> d!122857 (= lt!452793 lt!452792)))

(assert (=> d!122857 (= (getValueByKey!584 lt!452790 (_1!7779 (tuple2!15537 lt!452653 (minValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 lt!452653 (minValue!5932 thiss!1427)))))))

(assert (=> d!122857 (= lt!452792 (lemmaContainsTupThenGetReturnValue!275 lt!452790 (_1!7779 (tuple2!15537 lt!452653 (minValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 lt!452653 (minValue!5932 thiss!1427)))))))

(assert (=> d!122857 (= lt!452790 (insertStrictlySorted!368 (toList!6851 lt!452658) (_1!7779 (tuple2!15537 lt!452653 (minValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 lt!452653 (minValue!5932 thiss!1427)))))))

(assert (=> d!122857 (= (+!3098 lt!452658 (tuple2!15537 lt!452653 (minValue!5932 thiss!1427))) lt!452791)))

(declare-fun b!1028158 () Bool)

(declare-fun res!688026 () Bool)

(assert (=> b!1028158 (=> (not res!688026) (not e!580341))))

(assert (=> b!1028158 (= res!688026 (= (getValueByKey!584 (toList!6851 lt!452791) (_1!7779 (tuple2!15537 lt!452653 (minValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 lt!452653 (minValue!5932 thiss!1427))))))))

(declare-fun b!1028159 () Bool)

(assert (=> b!1028159 (= e!580341 (contains!5966 (toList!6851 lt!452791) (tuple2!15537 lt!452653 (minValue!5932 thiss!1427))))))

(assert (= (and d!122857 res!688025) b!1028158))

(assert (= (and b!1028158 res!688026) b!1028159))

(declare-fun m!946795 () Bool)

(assert (=> d!122857 m!946795))

(declare-fun m!946797 () Bool)

(assert (=> d!122857 m!946797))

(declare-fun m!946799 () Bool)

(assert (=> d!122857 m!946799))

(declare-fun m!946801 () Bool)

(assert (=> d!122857 m!946801))

(declare-fun m!946803 () Bool)

(assert (=> b!1028158 m!946803))

(declare-fun m!946805 () Bool)

(assert (=> b!1028159 m!946805))

(assert (=> b!1027929 d!122857))

(declare-fun b!1028184 () Bool)

(declare-fun e!580358 () ListLongMap!13671)

(declare-fun call!43334 () ListLongMap!13671)

(assert (=> b!1028184 (= e!580358 call!43334)))

(declare-fun b!1028185 () Bool)

(declare-fun e!580360 () Bool)

(declare-fun e!580357 () Bool)

(assert (=> b!1028185 (= e!580360 e!580357)))

(assert (=> b!1028185 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31644 lt!452522)))))

(declare-fun res!688038 () Bool)

(declare-fun lt!452812 () ListLongMap!13671)

(assert (=> b!1028185 (= res!688038 (contains!5964 lt!452812 (select (arr!31131 lt!452522) #b00000000000000000000000000000000)))))

(assert (=> b!1028185 (=> (not res!688038) (not e!580357))))

(declare-fun b!1028186 () Bool)

(declare-fun e!580359 () ListLongMap!13671)

(assert (=> b!1028186 (= e!580359 (ListLongMap!13672 Nil!21808))))

(declare-fun d!122859 () Bool)

(declare-fun e!580361 () Bool)

(assert (=> d!122859 e!580361))

(declare-fun res!688036 () Bool)

(assert (=> d!122859 (=> (not res!688036) (not e!580361))))

(assert (=> d!122859 (= res!688036 (not (contains!5964 lt!452812 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!122859 (= lt!452812 e!580359)))

(declare-fun c!103727 () Bool)

(assert (=> d!122859 (= c!103727 (bvsge #b00000000000000000000000000000000 (size!31644 lt!452522)))))

(assert (=> d!122859 (validMask!0 (mask!29820 thiss!1427))))

(assert (=> d!122859 (= (getCurrentListMapNoExtraKeys!3514 lt!452522 lt!452525 (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)) lt!452812)))

(declare-fun b!1028187 () Bool)

(assert (=> b!1028187 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31644 lt!452522)))))

(assert (=> b!1028187 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31645 lt!452525)))))

(assert (=> b!1028187 (= e!580357 (= (apply!900 lt!452812 (select (arr!31131 lt!452522) #b00000000000000000000000000000000)) (get!16341 (select (arr!31132 lt!452525) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1028188 () Bool)

(declare-fun lt!452813 () Unit!33555)

(declare-fun lt!452808 () Unit!33555)

(assert (=> b!1028188 (= lt!452813 lt!452808)))

(declare-fun lt!452810 () V!37269)

(declare-fun lt!452811 () (_ BitVec 64))

(declare-fun lt!452814 () ListLongMap!13671)

(declare-fun lt!452809 () (_ BitVec 64))

(assert (=> b!1028188 (not (contains!5964 (+!3098 lt!452814 (tuple2!15537 lt!452811 lt!452810)) lt!452809))))

(declare-fun addStillNotContains!238 (ListLongMap!13671 (_ BitVec 64) V!37269 (_ BitVec 64)) Unit!33555)

(assert (=> b!1028188 (= lt!452808 (addStillNotContains!238 lt!452814 lt!452811 lt!452810 lt!452809))))

(assert (=> b!1028188 (= lt!452809 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1028188 (= lt!452810 (get!16341 (select (arr!31132 lt!452525) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1028188 (= lt!452811 (select (arr!31131 lt!452522) #b00000000000000000000000000000000))))

(assert (=> b!1028188 (= lt!452814 call!43334)))

(assert (=> b!1028188 (= e!580358 (+!3098 call!43334 (tuple2!15537 (select (arr!31131 lt!452522) #b00000000000000000000000000000000) (get!16341 (select (arr!31132 lt!452525) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1028189 () Bool)

(declare-fun res!688037 () Bool)

(assert (=> b!1028189 (=> (not res!688037) (not e!580361))))

(assert (=> b!1028189 (= res!688037 (not (contains!5964 lt!452812 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1028190 () Bool)

(declare-fun e!580362 () Bool)

(declare-fun isEmpty!922 (ListLongMap!13671) Bool)

(assert (=> b!1028190 (= e!580362 (isEmpty!922 lt!452812))))

(declare-fun b!1028191 () Bool)

(assert (=> b!1028191 (= e!580362 (= lt!452812 (getCurrentListMapNoExtraKeys!3514 lt!452522 lt!452525 (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6096 thiss!1427))))))

(declare-fun b!1028192 () Bool)

(declare-fun e!580356 () Bool)

(assert (=> b!1028192 (= e!580356 (validKeyInArray!0 (select (arr!31131 lt!452522) #b00000000000000000000000000000000)))))

(assert (=> b!1028192 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1028193 () Bool)

(assert (=> b!1028193 (= e!580360 e!580362)))

(declare-fun c!103726 () Bool)

(assert (=> b!1028193 (= c!103726 (bvslt #b00000000000000000000000000000000 (size!31644 lt!452522)))))

(declare-fun b!1028194 () Bool)

(assert (=> b!1028194 (= e!580359 e!580358)))

(declare-fun c!103724 () Bool)

(assert (=> b!1028194 (= c!103724 (validKeyInArray!0 (select (arr!31131 lt!452522) #b00000000000000000000000000000000)))))

(declare-fun b!1028195 () Bool)

(assert (=> b!1028195 (= e!580361 e!580360)))

(declare-fun c!103725 () Bool)

(assert (=> b!1028195 (= c!103725 e!580356)))

(declare-fun res!688035 () Bool)

(assert (=> b!1028195 (=> (not res!688035) (not e!580356))))

(assert (=> b!1028195 (= res!688035 (bvslt #b00000000000000000000000000000000 (size!31644 lt!452522)))))

(declare-fun bm!43331 () Bool)

(assert (=> bm!43331 (= call!43334 (getCurrentListMapNoExtraKeys!3514 lt!452522 lt!452525 (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6096 thiss!1427)))))

(assert (= (and d!122859 c!103727) b!1028186))

(assert (= (and d!122859 (not c!103727)) b!1028194))

(assert (= (and b!1028194 c!103724) b!1028188))

(assert (= (and b!1028194 (not c!103724)) b!1028184))

(assert (= (or b!1028188 b!1028184) bm!43331))

(assert (= (and d!122859 res!688036) b!1028189))

(assert (= (and b!1028189 res!688037) b!1028195))

(assert (= (and b!1028195 res!688035) b!1028192))

(assert (= (and b!1028195 c!103725) b!1028185))

(assert (= (and b!1028195 (not c!103725)) b!1028193))

(assert (= (and b!1028185 res!688038) b!1028187))

(assert (= (and b!1028193 c!103726) b!1028191))

(assert (= (and b!1028193 (not c!103726)) b!1028190))

(declare-fun b_lambda!15763 () Bool)

(assert (=> (not b_lambda!15763) (not b!1028187)))

(assert (=> b!1028187 t!30882))

(declare-fun b_and!32855 () Bool)

(assert (= b_and!32853 (and (=> t!30882 result!14107) b_and!32855)))

(declare-fun b_lambda!15765 () Bool)

(assert (=> (not b_lambda!15765) (not b!1028188)))

(assert (=> b!1028188 t!30882))

(declare-fun b_and!32857 () Bool)

(assert (= b_and!32855 (and (=> t!30882 result!14107) b_and!32857)))

(declare-fun m!946807 () Bool)

(assert (=> b!1028191 m!946807))

(assert (=> b!1028185 m!946401))

(assert (=> b!1028185 m!946401))

(declare-fun m!946809 () Bool)

(assert (=> b!1028185 m!946809))

(assert (=> b!1028194 m!946401))

(assert (=> b!1028194 m!946401))

(assert (=> b!1028194 m!946403))

(assert (=> bm!43331 m!946807))

(declare-fun m!946811 () Bool)

(assert (=> b!1028189 m!946811))

(declare-fun m!946813 () Bool)

(assert (=> d!122859 m!946813))

(assert (=> d!122859 m!946475))

(assert (=> b!1028187 m!946401))

(assert (=> b!1028187 m!946343))

(assert (=> b!1028187 m!946495))

(assert (=> b!1028187 m!946343))

(assert (=> b!1028187 m!946497))

(assert (=> b!1028187 m!946401))

(declare-fun m!946815 () Bool)

(assert (=> b!1028187 m!946815))

(assert (=> b!1028187 m!946495))

(assert (=> b!1028192 m!946401))

(assert (=> b!1028192 m!946401))

(assert (=> b!1028192 m!946403))

(declare-fun m!946817 () Bool)

(assert (=> b!1028190 m!946817))

(assert (=> b!1028188 m!946401))

(declare-fun m!946819 () Bool)

(assert (=> b!1028188 m!946819))

(assert (=> b!1028188 m!946343))

(assert (=> b!1028188 m!946495))

(assert (=> b!1028188 m!946343))

(assert (=> b!1028188 m!946497))

(assert (=> b!1028188 m!946495))

(declare-fun m!946821 () Bool)

(assert (=> b!1028188 m!946821))

(declare-fun m!946823 () Bool)

(assert (=> b!1028188 m!946823))

(declare-fun m!946825 () Bool)

(assert (=> b!1028188 m!946825))

(assert (=> b!1028188 m!946823))

(assert (=> b!1027929 d!122859))

(declare-fun d!122861 () Bool)

(declare-fun e!580363 () Bool)

(assert (=> d!122861 e!580363))

(declare-fun res!688039 () Bool)

(assert (=> d!122861 (=> (not res!688039) (not e!580363))))

(declare-fun lt!452816 () ListLongMap!13671)

(assert (=> d!122861 (= res!688039 (contains!5964 lt!452816 (_1!7779 (tuple2!15537 lt!452660 (minValue!5932 thiss!1427)))))))

(declare-fun lt!452815 () List!21811)

(assert (=> d!122861 (= lt!452816 (ListLongMap!13672 lt!452815))))

(declare-fun lt!452818 () Unit!33555)

(declare-fun lt!452817 () Unit!33555)

(assert (=> d!122861 (= lt!452818 lt!452817)))

(assert (=> d!122861 (= (getValueByKey!584 lt!452815 (_1!7779 (tuple2!15537 lt!452660 (minValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 lt!452660 (minValue!5932 thiss!1427)))))))

(assert (=> d!122861 (= lt!452817 (lemmaContainsTupThenGetReturnValue!275 lt!452815 (_1!7779 (tuple2!15537 lt!452660 (minValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 lt!452660 (minValue!5932 thiss!1427)))))))

(assert (=> d!122861 (= lt!452815 (insertStrictlySorted!368 (toList!6851 lt!452657) (_1!7779 (tuple2!15537 lt!452660 (minValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 lt!452660 (minValue!5932 thiss!1427)))))))

(assert (=> d!122861 (= (+!3098 lt!452657 (tuple2!15537 lt!452660 (minValue!5932 thiss!1427))) lt!452816)))

(declare-fun b!1028196 () Bool)

(declare-fun res!688040 () Bool)

(assert (=> b!1028196 (=> (not res!688040) (not e!580363))))

(assert (=> b!1028196 (= res!688040 (= (getValueByKey!584 (toList!6851 lt!452816) (_1!7779 (tuple2!15537 lt!452660 (minValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 lt!452660 (minValue!5932 thiss!1427))))))))

(declare-fun b!1028197 () Bool)

(assert (=> b!1028197 (= e!580363 (contains!5966 (toList!6851 lt!452816) (tuple2!15537 lt!452660 (minValue!5932 thiss!1427))))))

(assert (= (and d!122861 res!688039) b!1028196))

(assert (= (and b!1028196 res!688040) b!1028197))

(declare-fun m!946827 () Bool)

(assert (=> d!122861 m!946827))

(declare-fun m!946829 () Bool)

(assert (=> d!122861 m!946829))

(declare-fun m!946831 () Bool)

(assert (=> d!122861 m!946831))

(declare-fun m!946833 () Bool)

(assert (=> d!122861 m!946833))

(declare-fun m!946835 () Bool)

(assert (=> b!1028196 m!946835))

(declare-fun m!946837 () Bool)

(assert (=> b!1028197 m!946837))

(assert (=> b!1027929 d!122861))

(declare-fun d!122863 () Bool)

(assert (=> d!122863 (= (apply!900 (+!3098 lt!452652 (tuple2!15537 lt!452663 (zeroValue!5932 thiss!1427))) lt!452667) (get!16342 (getValueByKey!584 (toList!6851 (+!3098 lt!452652 (tuple2!15537 lt!452663 (zeroValue!5932 thiss!1427)))) lt!452667)))))

(declare-fun bs!30004 () Bool)

(assert (= bs!30004 d!122863))

(declare-fun m!946839 () Bool)

(assert (=> bs!30004 m!946839))

(assert (=> bs!30004 m!946839))

(declare-fun m!946841 () Bool)

(assert (=> bs!30004 m!946841))

(assert (=> b!1027929 d!122863))

(declare-fun d!122865 () Bool)

(assert (=> d!122865 (= (apply!900 (+!3098 lt!452658 (tuple2!15537 lt!452653 (minValue!5932 thiss!1427))) lt!452651) (get!16342 (getValueByKey!584 (toList!6851 (+!3098 lt!452658 (tuple2!15537 lt!452653 (minValue!5932 thiss!1427)))) lt!452651)))))

(declare-fun bs!30005 () Bool)

(assert (= bs!30005 d!122865))

(declare-fun m!946843 () Bool)

(assert (=> bs!30005 m!946843))

(assert (=> bs!30005 m!946843))

(declare-fun m!946845 () Bool)

(assert (=> bs!30005 m!946845))

(assert (=> b!1027929 d!122865))

(declare-fun d!122867 () Bool)

(assert (=> d!122867 (= (apply!900 (+!3098 lt!452658 (tuple2!15537 lt!452653 (minValue!5932 thiss!1427))) lt!452651) (apply!900 lt!452658 lt!452651))))

(declare-fun lt!452821 () Unit!33555)

(declare-fun choose!1683 (ListLongMap!13671 (_ BitVec 64) V!37269 (_ BitVec 64)) Unit!33555)

(assert (=> d!122867 (= lt!452821 (choose!1683 lt!452658 lt!452653 (minValue!5932 thiss!1427) lt!452651))))

(declare-fun e!580366 () Bool)

(assert (=> d!122867 e!580366))

(declare-fun res!688043 () Bool)

(assert (=> d!122867 (=> (not res!688043) (not e!580366))))

(assert (=> d!122867 (= res!688043 (contains!5964 lt!452658 lt!452651))))

(assert (=> d!122867 (= (addApplyDifferent!479 lt!452658 lt!452653 (minValue!5932 thiss!1427) lt!452651) lt!452821)))

(declare-fun b!1028201 () Bool)

(assert (=> b!1028201 (= e!580366 (not (= lt!452651 lt!452653)))))

(assert (= (and d!122867 res!688043) b!1028201))

(assert (=> d!122867 m!946519))

(assert (=> d!122867 m!946521))

(declare-fun m!946847 () Bool)

(assert (=> d!122867 m!946847))

(assert (=> d!122867 m!946519))

(assert (=> d!122867 m!946509))

(declare-fun m!946849 () Bool)

(assert (=> d!122867 m!946849))

(assert (=> b!1027929 d!122867))

(declare-fun d!122869 () Bool)

(assert (=> d!122869 (= (apply!900 (+!3098 lt!452652 (tuple2!15537 lt!452663 (zeroValue!5932 thiss!1427))) lt!452667) (apply!900 lt!452652 lt!452667))))

(declare-fun lt!452822 () Unit!33555)

(assert (=> d!122869 (= lt!452822 (choose!1683 lt!452652 lt!452663 (zeroValue!5932 thiss!1427) lt!452667))))

(declare-fun e!580367 () Bool)

(assert (=> d!122869 e!580367))

(declare-fun res!688044 () Bool)

(assert (=> d!122869 (=> (not res!688044) (not e!580367))))

(assert (=> d!122869 (= res!688044 (contains!5964 lt!452652 lt!452667))))

(assert (=> d!122869 (= (addApplyDifferent!479 lt!452652 lt!452663 (zeroValue!5932 thiss!1427) lt!452667) lt!452822)))

(declare-fun b!1028202 () Bool)

(assert (=> b!1028202 (= e!580367 (not (= lt!452667 lt!452663)))))

(assert (= (and d!122869 res!688044) b!1028202))

(assert (=> d!122869 m!946513))

(assert (=> d!122869 m!946525))

(declare-fun m!946851 () Bool)

(assert (=> d!122869 m!946851))

(assert (=> d!122869 m!946513))

(assert (=> d!122869 m!946531))

(declare-fun m!946853 () Bool)

(assert (=> d!122869 m!946853))

(assert (=> b!1027929 d!122869))

(declare-fun d!122871 () Bool)

(assert (=> d!122871 (= (apply!900 lt!452658 lt!452651) (get!16342 (getValueByKey!584 (toList!6851 lt!452658) lt!452651)))))

(declare-fun bs!30006 () Bool)

(assert (= bs!30006 d!122871))

(declare-fun m!946855 () Bool)

(assert (=> bs!30006 m!946855))

(assert (=> bs!30006 m!946855))

(declare-fun m!946857 () Bool)

(assert (=> bs!30006 m!946857))

(assert (=> b!1027929 d!122871))

(declare-fun d!122873 () Bool)

(assert (=> d!122873 (= (apply!900 lt!452652 lt!452667) (get!16342 (getValueByKey!584 (toList!6851 lt!452652) lt!452667)))))

(declare-fun bs!30007 () Bool)

(assert (= bs!30007 d!122873))

(declare-fun m!946859 () Bool)

(assert (=> bs!30007 m!946859))

(assert (=> bs!30007 m!946859))

(declare-fun m!946861 () Bool)

(assert (=> bs!30007 m!946861))

(assert (=> b!1027929 d!122873))

(declare-fun d!122875 () Bool)

(assert (=> d!122875 (= (apply!900 lt!452657 lt!452650) (get!16342 (getValueByKey!584 (toList!6851 lt!452657) lt!452650)))))

(declare-fun bs!30008 () Bool)

(assert (= bs!30008 d!122875))

(declare-fun m!946863 () Bool)

(assert (=> bs!30008 m!946863))

(assert (=> bs!30008 m!946863))

(declare-fun m!946865 () Bool)

(assert (=> bs!30008 m!946865))

(assert (=> b!1027929 d!122875))

(declare-fun d!122877 () Bool)

(declare-fun e!580368 () Bool)

(assert (=> d!122877 e!580368))

(declare-fun res!688045 () Bool)

(assert (=> d!122877 (=> res!688045 e!580368)))

(declare-fun lt!452826 () Bool)

(assert (=> d!122877 (= res!688045 (not lt!452826))))

(declare-fun lt!452824 () Bool)

(assert (=> d!122877 (= lt!452826 lt!452824)))

(declare-fun lt!452825 () Unit!33555)

(declare-fun e!580369 () Unit!33555)

(assert (=> d!122877 (= lt!452825 e!580369)))

(declare-fun c!103728 () Bool)

(assert (=> d!122877 (= c!103728 lt!452824)))

(assert (=> d!122877 (= lt!452824 (containsKey!559 (toList!6851 (+!3098 lt!452649 (tuple2!15537 lt!452654 (zeroValue!5932 thiss!1427)))) lt!452666))))

(assert (=> d!122877 (= (contains!5964 (+!3098 lt!452649 (tuple2!15537 lt!452654 (zeroValue!5932 thiss!1427))) lt!452666) lt!452826)))

(declare-fun b!1028203 () Bool)

(declare-fun lt!452823 () Unit!33555)

(assert (=> b!1028203 (= e!580369 lt!452823)))

(assert (=> b!1028203 (= lt!452823 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6851 (+!3098 lt!452649 (tuple2!15537 lt!452654 (zeroValue!5932 thiss!1427)))) lt!452666))))

(assert (=> b!1028203 (isDefined!431 (getValueByKey!584 (toList!6851 (+!3098 lt!452649 (tuple2!15537 lt!452654 (zeroValue!5932 thiss!1427)))) lt!452666))))

(declare-fun b!1028204 () Bool)

(declare-fun Unit!33570 () Unit!33555)

(assert (=> b!1028204 (= e!580369 Unit!33570)))

(declare-fun b!1028205 () Bool)

(assert (=> b!1028205 (= e!580368 (isDefined!431 (getValueByKey!584 (toList!6851 (+!3098 lt!452649 (tuple2!15537 lt!452654 (zeroValue!5932 thiss!1427)))) lt!452666)))))

(assert (= (and d!122877 c!103728) b!1028203))

(assert (= (and d!122877 (not c!103728)) b!1028204))

(assert (= (and d!122877 (not res!688045)) b!1028205))

(declare-fun m!946867 () Bool)

(assert (=> d!122877 m!946867))

(declare-fun m!946869 () Bool)

(assert (=> b!1028203 m!946869))

(declare-fun m!946871 () Bool)

(assert (=> b!1028203 m!946871))

(assert (=> b!1028203 m!946871))

(declare-fun m!946873 () Bool)

(assert (=> b!1028203 m!946873))

(assert (=> b!1028205 m!946871))

(assert (=> b!1028205 m!946871))

(assert (=> b!1028205 m!946873))

(assert (=> b!1027929 d!122877))

(declare-fun d!122879 () Bool)

(assert (=> d!122879 (= (apply!900 (+!3098 lt!452657 (tuple2!15537 lt!452660 (minValue!5932 thiss!1427))) lt!452650) (apply!900 lt!452657 lt!452650))))

(declare-fun lt!452827 () Unit!33555)

(assert (=> d!122879 (= lt!452827 (choose!1683 lt!452657 lt!452660 (minValue!5932 thiss!1427) lt!452650))))

(declare-fun e!580370 () Bool)

(assert (=> d!122879 e!580370))

(declare-fun res!688046 () Bool)

(assert (=> d!122879 (=> (not res!688046) (not e!580370))))

(assert (=> d!122879 (= res!688046 (contains!5964 lt!452657 lt!452650))))

(assert (=> d!122879 (= (addApplyDifferent!479 lt!452657 lt!452660 (minValue!5932 thiss!1427) lt!452650) lt!452827)))

(declare-fun b!1028206 () Bool)

(assert (=> b!1028206 (= e!580370 (not (= lt!452650 lt!452660)))))

(assert (= (and d!122879 res!688046) b!1028206))

(assert (=> d!122879 m!946505))

(assert (=> d!122879 m!946507))

(declare-fun m!946875 () Bool)

(assert (=> d!122879 m!946875))

(assert (=> d!122879 m!946505))

(assert (=> d!122879 m!946515))

(declare-fun m!946877 () Bool)

(assert (=> d!122879 m!946877))

(assert (=> b!1027929 d!122879))

(declare-fun d!122881 () Bool)

(declare-fun e!580371 () Bool)

(assert (=> d!122881 e!580371))

(declare-fun res!688047 () Bool)

(assert (=> d!122881 (=> (not res!688047) (not e!580371))))

(declare-fun lt!452829 () ListLongMap!13671)

(assert (=> d!122881 (= res!688047 (contains!5964 lt!452829 (_1!7779 (tuple2!15537 lt!452654 (zeroValue!5932 thiss!1427)))))))

(declare-fun lt!452828 () List!21811)

(assert (=> d!122881 (= lt!452829 (ListLongMap!13672 lt!452828))))

(declare-fun lt!452831 () Unit!33555)

(declare-fun lt!452830 () Unit!33555)

(assert (=> d!122881 (= lt!452831 lt!452830)))

(assert (=> d!122881 (= (getValueByKey!584 lt!452828 (_1!7779 (tuple2!15537 lt!452654 (zeroValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 lt!452654 (zeroValue!5932 thiss!1427)))))))

(assert (=> d!122881 (= lt!452830 (lemmaContainsTupThenGetReturnValue!275 lt!452828 (_1!7779 (tuple2!15537 lt!452654 (zeroValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 lt!452654 (zeroValue!5932 thiss!1427)))))))

(assert (=> d!122881 (= lt!452828 (insertStrictlySorted!368 (toList!6851 lt!452649) (_1!7779 (tuple2!15537 lt!452654 (zeroValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 lt!452654 (zeroValue!5932 thiss!1427)))))))

(assert (=> d!122881 (= (+!3098 lt!452649 (tuple2!15537 lt!452654 (zeroValue!5932 thiss!1427))) lt!452829)))

(declare-fun b!1028207 () Bool)

(declare-fun res!688048 () Bool)

(assert (=> b!1028207 (=> (not res!688048) (not e!580371))))

(assert (=> b!1028207 (= res!688048 (= (getValueByKey!584 (toList!6851 lt!452829) (_1!7779 (tuple2!15537 lt!452654 (zeroValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 lt!452654 (zeroValue!5932 thiss!1427))))))))

(declare-fun b!1028208 () Bool)

(assert (=> b!1028208 (= e!580371 (contains!5966 (toList!6851 lt!452829) (tuple2!15537 lt!452654 (zeroValue!5932 thiss!1427))))))

(assert (= (and d!122881 res!688047) b!1028207))

(assert (= (and b!1028207 res!688048) b!1028208))

(declare-fun m!946879 () Bool)

(assert (=> d!122881 m!946879))

(declare-fun m!946881 () Bool)

(assert (=> d!122881 m!946881))

(declare-fun m!946883 () Bool)

(assert (=> d!122881 m!946883))

(declare-fun m!946885 () Bool)

(assert (=> d!122881 m!946885))

(declare-fun m!946887 () Bool)

(assert (=> b!1028207 m!946887))

(declare-fun m!946889 () Bool)

(assert (=> b!1028208 m!946889))

(assert (=> b!1027929 d!122881))

(declare-fun d!122883 () Bool)

(assert (=> d!122883 (contains!5964 (+!3098 lt!452649 (tuple2!15537 lt!452654 (zeroValue!5932 thiss!1427))) lt!452666)))

(declare-fun lt!452834 () Unit!33555)

(declare-fun choose!1684 (ListLongMap!13671 (_ BitVec 64) V!37269 (_ BitVec 64)) Unit!33555)

(assert (=> d!122883 (= lt!452834 (choose!1684 lt!452649 lt!452654 (zeroValue!5932 thiss!1427) lt!452666))))

(assert (=> d!122883 (contains!5964 lt!452649 lt!452666)))

(assert (=> d!122883 (= (addStillContains!619 lt!452649 lt!452654 (zeroValue!5932 thiss!1427) lt!452666) lt!452834)))

(declare-fun bs!30009 () Bool)

(assert (= bs!30009 d!122883))

(assert (=> bs!30009 m!946501))

(assert (=> bs!30009 m!946501))

(assert (=> bs!30009 m!946503))

(declare-fun m!946891 () Bool)

(assert (=> bs!30009 m!946891))

(declare-fun m!946893 () Bool)

(assert (=> bs!30009 m!946893))

(assert (=> b!1027929 d!122883))

(declare-fun d!122885 () Bool)

(declare-fun e!580372 () Bool)

(assert (=> d!122885 e!580372))

(declare-fun res!688049 () Bool)

(assert (=> d!122885 (=> (not res!688049) (not e!580372))))

(declare-fun lt!452836 () ListLongMap!13671)

(assert (=> d!122885 (= res!688049 (contains!5964 lt!452836 (_1!7779 (tuple2!15537 lt!452663 (zeroValue!5932 thiss!1427)))))))

(declare-fun lt!452835 () List!21811)

(assert (=> d!122885 (= lt!452836 (ListLongMap!13672 lt!452835))))

(declare-fun lt!452838 () Unit!33555)

(declare-fun lt!452837 () Unit!33555)

(assert (=> d!122885 (= lt!452838 lt!452837)))

(assert (=> d!122885 (= (getValueByKey!584 lt!452835 (_1!7779 (tuple2!15537 lt!452663 (zeroValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 lt!452663 (zeroValue!5932 thiss!1427)))))))

(assert (=> d!122885 (= lt!452837 (lemmaContainsTupThenGetReturnValue!275 lt!452835 (_1!7779 (tuple2!15537 lt!452663 (zeroValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 lt!452663 (zeroValue!5932 thiss!1427)))))))

(assert (=> d!122885 (= lt!452835 (insertStrictlySorted!368 (toList!6851 lt!452652) (_1!7779 (tuple2!15537 lt!452663 (zeroValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 lt!452663 (zeroValue!5932 thiss!1427)))))))

(assert (=> d!122885 (= (+!3098 lt!452652 (tuple2!15537 lt!452663 (zeroValue!5932 thiss!1427))) lt!452836)))

(declare-fun b!1028210 () Bool)

(declare-fun res!688050 () Bool)

(assert (=> b!1028210 (=> (not res!688050) (not e!580372))))

(assert (=> b!1028210 (= res!688050 (= (getValueByKey!584 (toList!6851 lt!452836) (_1!7779 (tuple2!15537 lt!452663 (zeroValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 lt!452663 (zeroValue!5932 thiss!1427))))))))

(declare-fun b!1028211 () Bool)

(assert (=> b!1028211 (= e!580372 (contains!5966 (toList!6851 lt!452836) (tuple2!15537 lt!452663 (zeroValue!5932 thiss!1427))))))

(assert (= (and d!122885 res!688049) b!1028210))

(assert (= (and b!1028210 res!688050) b!1028211))

(declare-fun m!946895 () Bool)

(assert (=> d!122885 m!946895))

(declare-fun m!946897 () Bool)

(assert (=> d!122885 m!946897))

(declare-fun m!946899 () Bool)

(assert (=> d!122885 m!946899))

(declare-fun m!946901 () Bool)

(assert (=> d!122885 m!946901))

(declare-fun m!946903 () Bool)

(assert (=> b!1028210 m!946903))

(declare-fun m!946905 () Bool)

(assert (=> b!1028211 m!946905))

(assert (=> b!1027929 d!122885))

(declare-fun d!122887 () Bool)

(assert (=> d!122887 (= (apply!900 lt!452620 lt!452613) (get!16342 (getValueByKey!584 (toList!6851 lt!452620) lt!452613)))))

(declare-fun bs!30010 () Bool)

(assert (= bs!30010 d!122887))

(declare-fun m!946907 () Bool)

(assert (=> bs!30010 m!946907))

(assert (=> bs!30010 m!946907))

(declare-fun m!946909 () Bool)

(assert (=> bs!30010 m!946909))

(assert (=> b!1027893 d!122887))

(declare-fun b!1028212 () Bool)

(declare-fun e!580375 () ListLongMap!13671)

(declare-fun call!43335 () ListLongMap!13671)

(assert (=> b!1028212 (= e!580375 call!43335)))

(declare-fun b!1028213 () Bool)

(declare-fun e!580377 () Bool)

(declare-fun e!580374 () Bool)

(assert (=> b!1028213 (= e!580377 e!580374)))

(assert (=> b!1028213 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))))))

(declare-fun res!688054 () Bool)

(declare-fun lt!452843 () ListLongMap!13671)

(assert (=> b!1028213 (= res!688054 (contains!5964 lt!452843 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1028213 (=> (not res!688054) (not e!580374))))

(declare-fun b!1028214 () Bool)

(declare-fun e!580376 () ListLongMap!13671)

(assert (=> b!1028214 (= e!580376 (ListLongMap!13672 Nil!21808))))

(declare-fun d!122889 () Bool)

(declare-fun e!580378 () Bool)

(assert (=> d!122889 e!580378))

(declare-fun res!688052 () Bool)

(assert (=> d!122889 (=> (not res!688052) (not e!580378))))

(assert (=> d!122889 (= res!688052 (not (contains!5964 lt!452843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!122889 (= lt!452843 e!580376)))

(declare-fun c!103732 () Bool)

(assert (=> d!122889 (= c!103732 (bvsge #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))))))

(assert (=> d!122889 (validMask!0 (mask!29820 thiss!1427))))

(assert (=> d!122889 (= (getCurrentListMapNoExtraKeys!3514 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)) lt!452843)))

(declare-fun b!1028215 () Bool)

(assert (=> b!1028215 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))))))

(assert (=> b!1028215 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31645 (_values!6119 thiss!1427))))))

(assert (=> b!1028215 (= e!580374 (= (apply!900 lt!452843 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)) (get!16341 (select (arr!31132 (_values!6119 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1028216 () Bool)

(declare-fun lt!452844 () Unit!33555)

(declare-fun lt!452839 () Unit!33555)

(assert (=> b!1028216 (= lt!452844 lt!452839)))

(declare-fun lt!452840 () (_ BitVec 64))

(declare-fun lt!452842 () (_ BitVec 64))

(declare-fun lt!452845 () ListLongMap!13671)

(declare-fun lt!452841 () V!37269)

(assert (=> b!1028216 (not (contains!5964 (+!3098 lt!452845 (tuple2!15537 lt!452842 lt!452841)) lt!452840))))

(assert (=> b!1028216 (= lt!452839 (addStillNotContains!238 lt!452845 lt!452842 lt!452841 lt!452840))))

(assert (=> b!1028216 (= lt!452840 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1028216 (= lt!452841 (get!16341 (select (arr!31132 (_values!6119 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1028216 (= lt!452842 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028216 (= lt!452845 call!43335)))

(assert (=> b!1028216 (= e!580375 (+!3098 call!43335 (tuple2!15537 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000) (get!16341 (select (arr!31132 (_values!6119 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1948 (defaultEntry!6096 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1028217 () Bool)

(declare-fun res!688053 () Bool)

(assert (=> b!1028217 (=> (not res!688053) (not e!580378))))

(assert (=> b!1028217 (= res!688053 (not (contains!5964 lt!452843 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1028218 () Bool)

(declare-fun e!580379 () Bool)

(assert (=> b!1028218 (= e!580379 (isEmpty!922 lt!452843))))

(declare-fun b!1028219 () Bool)

(assert (=> b!1028219 (= e!580379 (= lt!452843 (getCurrentListMapNoExtraKeys!3514 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6096 thiss!1427))))))

(declare-fun b!1028220 () Bool)

(declare-fun e!580373 () Bool)

(assert (=> b!1028220 (= e!580373 (validKeyInArray!0 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1028220 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1028221 () Bool)

(assert (=> b!1028221 (= e!580377 e!580379)))

(declare-fun c!103731 () Bool)

(assert (=> b!1028221 (= c!103731 (bvslt #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))))))

(declare-fun b!1028222 () Bool)

(assert (=> b!1028222 (= e!580376 e!580375)))

(declare-fun c!103729 () Bool)

(assert (=> b!1028222 (= c!103729 (validKeyInArray!0 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028223 () Bool)

(assert (=> b!1028223 (= e!580378 e!580377)))

(declare-fun c!103730 () Bool)

(assert (=> b!1028223 (= c!103730 e!580373)))

(declare-fun res!688051 () Bool)

(assert (=> b!1028223 (=> (not res!688051) (not e!580373))))

(assert (=> b!1028223 (= res!688051 (bvslt #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))))))

(declare-fun bm!43332 () Bool)

(assert (=> bm!43332 (= call!43335 (getCurrentListMapNoExtraKeys!3514 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6096 thiss!1427)))))

(assert (= (and d!122889 c!103732) b!1028214))

(assert (= (and d!122889 (not c!103732)) b!1028222))

(assert (= (and b!1028222 c!103729) b!1028216))

(assert (= (and b!1028222 (not c!103729)) b!1028212))

(assert (= (or b!1028216 b!1028212) bm!43332))

(assert (= (and d!122889 res!688052) b!1028217))

(assert (= (and b!1028217 res!688053) b!1028223))

(assert (= (and b!1028223 res!688051) b!1028220))

(assert (= (and b!1028223 c!103730) b!1028213))

(assert (= (and b!1028223 (not c!103730)) b!1028221))

(assert (= (and b!1028213 res!688054) b!1028215))

(assert (= (and b!1028221 c!103731) b!1028219))

(assert (= (and b!1028221 (not c!103731)) b!1028218))

(declare-fun b_lambda!15767 () Bool)

(assert (=> (not b_lambda!15767) (not b!1028215)))

(assert (=> b!1028215 t!30882))

(declare-fun b_and!32859 () Bool)

(assert (= b_and!32857 (and (=> t!30882 result!14107) b_and!32859)))

(declare-fun b_lambda!15769 () Bool)

(assert (=> (not b_lambda!15769) (not b!1028216)))

(assert (=> b!1028216 t!30882))

(declare-fun b_and!32861 () Bool)

(assert (= b_and!32859 (and (=> t!30882 result!14107) b_and!32861)))

(declare-fun m!946911 () Bool)

(assert (=> b!1028219 m!946911))

(assert (=> b!1028213 m!946425))

(assert (=> b!1028213 m!946425))

(declare-fun m!946913 () Bool)

(assert (=> b!1028213 m!946913))

(assert (=> b!1028222 m!946425))

(assert (=> b!1028222 m!946425))

(assert (=> b!1028222 m!946429))

(assert (=> bm!43332 m!946911))

(declare-fun m!946915 () Bool)

(assert (=> b!1028217 m!946915))

(declare-fun m!946917 () Bool)

(assert (=> d!122889 m!946917))

(assert (=> d!122889 m!946475))

(assert (=> b!1028215 m!946425))

(assert (=> b!1028215 m!946343))

(assert (=> b!1028215 m!946421))

(assert (=> b!1028215 m!946343))

(assert (=> b!1028215 m!946423))

(assert (=> b!1028215 m!946425))

(declare-fun m!946919 () Bool)

(assert (=> b!1028215 m!946919))

(assert (=> b!1028215 m!946421))

(assert (=> b!1028220 m!946425))

(assert (=> b!1028220 m!946425))

(assert (=> b!1028220 m!946429))

(declare-fun m!946921 () Bool)

(assert (=> b!1028218 m!946921))

(assert (=> b!1028216 m!946425))

(declare-fun m!946923 () Bool)

(assert (=> b!1028216 m!946923))

(assert (=> b!1028216 m!946343))

(assert (=> b!1028216 m!946421))

(assert (=> b!1028216 m!946343))

(assert (=> b!1028216 m!946423))

(assert (=> b!1028216 m!946421))

(declare-fun m!946925 () Bool)

(assert (=> b!1028216 m!946925))

(declare-fun m!946927 () Bool)

(assert (=> b!1028216 m!946927))

(declare-fun m!946929 () Bool)

(assert (=> b!1028216 m!946929))

(assert (=> b!1028216 m!946927))

(assert (=> b!1027893 d!122889))

(declare-fun d!122891 () Bool)

(declare-fun e!580380 () Bool)

(assert (=> d!122891 e!580380))

(declare-fun res!688055 () Bool)

(assert (=> d!122891 (=> (not res!688055) (not e!580380))))

(declare-fun lt!452847 () ListLongMap!13671)

(assert (=> d!122891 (= res!688055 (contains!5964 lt!452847 (_1!7779 (tuple2!15537 lt!452617 (zeroValue!5932 thiss!1427)))))))

(declare-fun lt!452846 () List!21811)

(assert (=> d!122891 (= lt!452847 (ListLongMap!13672 lt!452846))))

(declare-fun lt!452849 () Unit!33555)

(declare-fun lt!452848 () Unit!33555)

(assert (=> d!122891 (= lt!452849 lt!452848)))

(assert (=> d!122891 (= (getValueByKey!584 lt!452846 (_1!7779 (tuple2!15537 lt!452617 (zeroValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 lt!452617 (zeroValue!5932 thiss!1427)))))))

(assert (=> d!122891 (= lt!452848 (lemmaContainsTupThenGetReturnValue!275 lt!452846 (_1!7779 (tuple2!15537 lt!452617 (zeroValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 lt!452617 (zeroValue!5932 thiss!1427)))))))

(assert (=> d!122891 (= lt!452846 (insertStrictlySorted!368 (toList!6851 lt!452612) (_1!7779 (tuple2!15537 lt!452617 (zeroValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 lt!452617 (zeroValue!5932 thiss!1427)))))))

(assert (=> d!122891 (= (+!3098 lt!452612 (tuple2!15537 lt!452617 (zeroValue!5932 thiss!1427))) lt!452847)))

(declare-fun b!1028224 () Bool)

(declare-fun res!688056 () Bool)

(assert (=> b!1028224 (=> (not res!688056) (not e!580380))))

(assert (=> b!1028224 (= res!688056 (= (getValueByKey!584 (toList!6851 lt!452847) (_1!7779 (tuple2!15537 lt!452617 (zeroValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 lt!452617 (zeroValue!5932 thiss!1427))))))))

(declare-fun b!1028225 () Bool)

(assert (=> b!1028225 (= e!580380 (contains!5966 (toList!6851 lt!452847) (tuple2!15537 lt!452617 (zeroValue!5932 thiss!1427))))))

(assert (= (and d!122891 res!688055) b!1028224))

(assert (= (and b!1028224 res!688056) b!1028225))

(declare-fun m!946931 () Bool)

(assert (=> d!122891 m!946931))

(declare-fun m!946933 () Bool)

(assert (=> d!122891 m!946933))

(declare-fun m!946935 () Bool)

(assert (=> d!122891 m!946935))

(declare-fun m!946937 () Bool)

(assert (=> d!122891 m!946937))

(declare-fun m!946939 () Bool)

(assert (=> b!1028224 m!946939))

(declare-fun m!946941 () Bool)

(assert (=> b!1028225 m!946941))

(assert (=> b!1027893 d!122891))

(declare-fun d!122893 () Bool)

(assert (=> d!122893 (= (apply!900 lt!452615 lt!452630) (get!16342 (getValueByKey!584 (toList!6851 lt!452615) lt!452630)))))

(declare-fun bs!30011 () Bool)

(assert (= bs!30011 d!122893))

(declare-fun m!946943 () Bool)

(assert (=> bs!30011 m!946943))

(assert (=> bs!30011 m!946943))

(declare-fun m!946945 () Bool)

(assert (=> bs!30011 m!946945))

(assert (=> b!1027893 d!122893))

(declare-fun d!122895 () Bool)

(assert (=> d!122895 (= (apply!900 (+!3098 lt!452615 (tuple2!15537 lt!452626 (zeroValue!5932 thiss!1427))) lt!452630) (get!16342 (getValueByKey!584 (toList!6851 (+!3098 lt!452615 (tuple2!15537 lt!452626 (zeroValue!5932 thiss!1427)))) lt!452630)))))

(declare-fun bs!30012 () Bool)

(assert (= bs!30012 d!122895))

(declare-fun m!946947 () Bool)

(assert (=> bs!30012 m!946947))

(assert (=> bs!30012 m!946947))

(declare-fun m!946949 () Bool)

(assert (=> bs!30012 m!946949))

(assert (=> b!1027893 d!122895))

(declare-fun d!122897 () Bool)

(declare-fun e!580381 () Bool)

(assert (=> d!122897 e!580381))

(declare-fun res!688057 () Bool)

(assert (=> d!122897 (=> (not res!688057) (not e!580381))))

(declare-fun lt!452851 () ListLongMap!13671)

(assert (=> d!122897 (= res!688057 (contains!5964 lt!452851 (_1!7779 (tuple2!15537 lt!452616 (minValue!5932 thiss!1427)))))))

(declare-fun lt!452850 () List!21811)

(assert (=> d!122897 (= lt!452851 (ListLongMap!13672 lt!452850))))

(declare-fun lt!452853 () Unit!33555)

(declare-fun lt!452852 () Unit!33555)

(assert (=> d!122897 (= lt!452853 lt!452852)))

(assert (=> d!122897 (= (getValueByKey!584 lt!452850 (_1!7779 (tuple2!15537 lt!452616 (minValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 lt!452616 (minValue!5932 thiss!1427)))))))

(assert (=> d!122897 (= lt!452852 (lemmaContainsTupThenGetReturnValue!275 lt!452850 (_1!7779 (tuple2!15537 lt!452616 (minValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 lt!452616 (minValue!5932 thiss!1427)))))))

(assert (=> d!122897 (= lt!452850 (insertStrictlySorted!368 (toList!6851 lt!452621) (_1!7779 (tuple2!15537 lt!452616 (minValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 lt!452616 (minValue!5932 thiss!1427)))))))

(assert (=> d!122897 (= (+!3098 lt!452621 (tuple2!15537 lt!452616 (minValue!5932 thiss!1427))) lt!452851)))

(declare-fun b!1028226 () Bool)

(declare-fun res!688058 () Bool)

(assert (=> b!1028226 (=> (not res!688058) (not e!580381))))

(assert (=> b!1028226 (= res!688058 (= (getValueByKey!584 (toList!6851 lt!452851) (_1!7779 (tuple2!15537 lt!452616 (minValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 lt!452616 (minValue!5932 thiss!1427))))))))

(declare-fun b!1028227 () Bool)

(assert (=> b!1028227 (= e!580381 (contains!5966 (toList!6851 lt!452851) (tuple2!15537 lt!452616 (minValue!5932 thiss!1427))))))

(assert (= (and d!122897 res!688057) b!1028226))

(assert (= (and b!1028226 res!688058) b!1028227))

(declare-fun m!946951 () Bool)

(assert (=> d!122897 m!946951))

(declare-fun m!946953 () Bool)

(assert (=> d!122897 m!946953))

(declare-fun m!946955 () Bool)

(assert (=> d!122897 m!946955))

(declare-fun m!946957 () Bool)

(assert (=> d!122897 m!946957))

(declare-fun m!946959 () Bool)

(assert (=> b!1028226 m!946959))

(declare-fun m!946961 () Bool)

(assert (=> b!1028227 m!946961))

(assert (=> b!1027893 d!122897))

(declare-fun d!122899 () Bool)

(assert (=> d!122899 (= (apply!900 (+!3098 lt!452620 (tuple2!15537 lt!452623 (minValue!5932 thiss!1427))) lt!452613) (get!16342 (getValueByKey!584 (toList!6851 (+!3098 lt!452620 (tuple2!15537 lt!452623 (minValue!5932 thiss!1427)))) lt!452613)))))

(declare-fun bs!30013 () Bool)

(assert (= bs!30013 d!122899))

(declare-fun m!946963 () Bool)

(assert (=> bs!30013 m!946963))

(assert (=> bs!30013 m!946963))

(declare-fun m!946965 () Bool)

(assert (=> bs!30013 m!946965))

(assert (=> b!1027893 d!122899))

(declare-fun d!122901 () Bool)

(assert (=> d!122901 (= (apply!900 (+!3098 lt!452621 (tuple2!15537 lt!452616 (minValue!5932 thiss!1427))) lt!452614) (apply!900 lt!452621 lt!452614))))

(declare-fun lt!452854 () Unit!33555)

(assert (=> d!122901 (= lt!452854 (choose!1683 lt!452621 lt!452616 (minValue!5932 thiss!1427) lt!452614))))

(declare-fun e!580382 () Bool)

(assert (=> d!122901 e!580382))

(declare-fun res!688059 () Bool)

(assert (=> d!122901 (=> (not res!688059) (not e!580382))))

(assert (=> d!122901 (= res!688059 (contains!5964 lt!452621 lt!452614))))

(assert (=> d!122901 (= (addApplyDifferent!479 lt!452621 lt!452616 (minValue!5932 thiss!1427) lt!452614) lt!452854)))

(declare-fun b!1028228 () Bool)

(assert (=> b!1028228 (= e!580382 (not (= lt!452614 lt!452616)))))

(assert (= (and d!122901 res!688059) b!1028228))

(assert (=> d!122901 m!946449))

(assert (=> d!122901 m!946451))

(declare-fun m!946967 () Bool)

(assert (=> d!122901 m!946967))

(assert (=> d!122901 m!946449))

(assert (=> d!122901 m!946439))

(declare-fun m!946969 () Bool)

(assert (=> d!122901 m!946969))

(assert (=> b!1027893 d!122901))

(declare-fun d!122903 () Bool)

(assert (=> d!122903 (= (apply!900 (+!3098 lt!452615 (tuple2!15537 lt!452626 (zeroValue!5932 thiss!1427))) lt!452630) (apply!900 lt!452615 lt!452630))))

(declare-fun lt!452855 () Unit!33555)

(assert (=> d!122903 (= lt!452855 (choose!1683 lt!452615 lt!452626 (zeroValue!5932 thiss!1427) lt!452630))))

(declare-fun e!580383 () Bool)

(assert (=> d!122903 e!580383))

(declare-fun res!688060 () Bool)

(assert (=> d!122903 (=> (not res!688060) (not e!580383))))

(assert (=> d!122903 (= res!688060 (contains!5964 lt!452615 lt!452630))))

(assert (=> d!122903 (= (addApplyDifferent!479 lt!452615 lt!452626 (zeroValue!5932 thiss!1427) lt!452630) lt!452855)))

(declare-fun b!1028229 () Bool)

(assert (=> b!1028229 (= e!580383 (not (= lt!452630 lt!452626)))))

(assert (= (and d!122903 res!688060) b!1028229))

(assert (=> d!122903 m!946443))

(assert (=> d!122903 m!946455))

(declare-fun m!946971 () Bool)

(assert (=> d!122903 m!946971))

(assert (=> d!122903 m!946443))

(assert (=> d!122903 m!946461))

(declare-fun m!946973 () Bool)

(assert (=> d!122903 m!946973))

(assert (=> b!1027893 d!122903))

(declare-fun d!122905 () Bool)

(assert (=> d!122905 (= (apply!900 lt!452621 lt!452614) (get!16342 (getValueByKey!584 (toList!6851 lt!452621) lt!452614)))))

(declare-fun bs!30014 () Bool)

(assert (= bs!30014 d!122905))

(declare-fun m!946975 () Bool)

(assert (=> bs!30014 m!946975))

(assert (=> bs!30014 m!946975))

(declare-fun m!946977 () Bool)

(assert (=> bs!30014 m!946977))

(assert (=> b!1027893 d!122905))

(declare-fun d!122907 () Bool)

(declare-fun e!580384 () Bool)

(assert (=> d!122907 e!580384))

(declare-fun res!688061 () Bool)

(assert (=> d!122907 (=> (not res!688061) (not e!580384))))

(declare-fun lt!452857 () ListLongMap!13671)

(assert (=> d!122907 (= res!688061 (contains!5964 lt!452857 (_1!7779 (tuple2!15537 lt!452623 (minValue!5932 thiss!1427)))))))

(declare-fun lt!452856 () List!21811)

(assert (=> d!122907 (= lt!452857 (ListLongMap!13672 lt!452856))))

(declare-fun lt!452859 () Unit!33555)

(declare-fun lt!452858 () Unit!33555)

(assert (=> d!122907 (= lt!452859 lt!452858)))

(assert (=> d!122907 (= (getValueByKey!584 lt!452856 (_1!7779 (tuple2!15537 lt!452623 (minValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 lt!452623 (minValue!5932 thiss!1427)))))))

(assert (=> d!122907 (= lt!452858 (lemmaContainsTupThenGetReturnValue!275 lt!452856 (_1!7779 (tuple2!15537 lt!452623 (minValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 lt!452623 (minValue!5932 thiss!1427)))))))

(assert (=> d!122907 (= lt!452856 (insertStrictlySorted!368 (toList!6851 lt!452620) (_1!7779 (tuple2!15537 lt!452623 (minValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 lt!452623 (minValue!5932 thiss!1427)))))))

(assert (=> d!122907 (= (+!3098 lt!452620 (tuple2!15537 lt!452623 (minValue!5932 thiss!1427))) lt!452857)))

(declare-fun b!1028230 () Bool)

(declare-fun res!688062 () Bool)

(assert (=> b!1028230 (=> (not res!688062) (not e!580384))))

(assert (=> b!1028230 (= res!688062 (= (getValueByKey!584 (toList!6851 lt!452857) (_1!7779 (tuple2!15537 lt!452623 (minValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 lt!452623 (minValue!5932 thiss!1427))))))))

(declare-fun b!1028231 () Bool)

(assert (=> b!1028231 (= e!580384 (contains!5966 (toList!6851 lt!452857) (tuple2!15537 lt!452623 (minValue!5932 thiss!1427))))))

(assert (= (and d!122907 res!688061) b!1028230))

(assert (= (and b!1028230 res!688062) b!1028231))

(declare-fun m!946979 () Bool)

(assert (=> d!122907 m!946979))

(declare-fun m!946981 () Bool)

(assert (=> d!122907 m!946981))

(declare-fun m!946983 () Bool)

(assert (=> d!122907 m!946983))

(declare-fun m!946985 () Bool)

(assert (=> d!122907 m!946985))

(declare-fun m!946987 () Bool)

(assert (=> b!1028230 m!946987))

(declare-fun m!946989 () Bool)

(assert (=> b!1028231 m!946989))

(assert (=> b!1027893 d!122907))

(declare-fun d!122909 () Bool)

(declare-fun e!580385 () Bool)

(assert (=> d!122909 e!580385))

(declare-fun res!688063 () Bool)

(assert (=> d!122909 (=> (not res!688063) (not e!580385))))

(declare-fun lt!452861 () ListLongMap!13671)

(assert (=> d!122909 (= res!688063 (contains!5964 lt!452861 (_1!7779 (tuple2!15537 lt!452626 (zeroValue!5932 thiss!1427)))))))

(declare-fun lt!452860 () List!21811)

(assert (=> d!122909 (= lt!452861 (ListLongMap!13672 lt!452860))))

(declare-fun lt!452863 () Unit!33555)

(declare-fun lt!452862 () Unit!33555)

(assert (=> d!122909 (= lt!452863 lt!452862)))

(assert (=> d!122909 (= (getValueByKey!584 lt!452860 (_1!7779 (tuple2!15537 lt!452626 (zeroValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 lt!452626 (zeroValue!5932 thiss!1427)))))))

(assert (=> d!122909 (= lt!452862 (lemmaContainsTupThenGetReturnValue!275 lt!452860 (_1!7779 (tuple2!15537 lt!452626 (zeroValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 lt!452626 (zeroValue!5932 thiss!1427)))))))

(assert (=> d!122909 (= lt!452860 (insertStrictlySorted!368 (toList!6851 lt!452615) (_1!7779 (tuple2!15537 lt!452626 (zeroValue!5932 thiss!1427))) (_2!7779 (tuple2!15537 lt!452626 (zeroValue!5932 thiss!1427)))))))

(assert (=> d!122909 (= (+!3098 lt!452615 (tuple2!15537 lt!452626 (zeroValue!5932 thiss!1427))) lt!452861)))

(declare-fun b!1028232 () Bool)

(declare-fun res!688064 () Bool)

(assert (=> b!1028232 (=> (not res!688064) (not e!580385))))

(assert (=> b!1028232 (= res!688064 (= (getValueByKey!584 (toList!6851 lt!452861) (_1!7779 (tuple2!15537 lt!452626 (zeroValue!5932 thiss!1427)))) (Some!634 (_2!7779 (tuple2!15537 lt!452626 (zeroValue!5932 thiss!1427))))))))

(declare-fun b!1028233 () Bool)

(assert (=> b!1028233 (= e!580385 (contains!5966 (toList!6851 lt!452861) (tuple2!15537 lt!452626 (zeroValue!5932 thiss!1427))))))

(assert (= (and d!122909 res!688063) b!1028232))

(assert (= (and b!1028232 res!688064) b!1028233))

(declare-fun m!946991 () Bool)

(assert (=> d!122909 m!946991))

(declare-fun m!946993 () Bool)

(assert (=> d!122909 m!946993))

(declare-fun m!946995 () Bool)

(assert (=> d!122909 m!946995))

(declare-fun m!946997 () Bool)

(assert (=> d!122909 m!946997))

(declare-fun m!946999 () Bool)

(assert (=> b!1028232 m!946999))

(declare-fun m!947001 () Bool)

(assert (=> b!1028233 m!947001))

(assert (=> b!1027893 d!122909))

(declare-fun d!122911 () Bool)

(declare-fun e!580386 () Bool)

(assert (=> d!122911 e!580386))

(declare-fun res!688065 () Bool)

(assert (=> d!122911 (=> res!688065 e!580386)))

(declare-fun lt!452867 () Bool)

(assert (=> d!122911 (= res!688065 (not lt!452867))))

(declare-fun lt!452865 () Bool)

(assert (=> d!122911 (= lt!452867 lt!452865)))

(declare-fun lt!452866 () Unit!33555)

(declare-fun e!580387 () Unit!33555)

(assert (=> d!122911 (= lt!452866 e!580387)))

(declare-fun c!103733 () Bool)

(assert (=> d!122911 (= c!103733 lt!452865)))

(assert (=> d!122911 (= lt!452865 (containsKey!559 (toList!6851 (+!3098 lt!452612 (tuple2!15537 lt!452617 (zeroValue!5932 thiss!1427)))) lt!452629))))

(assert (=> d!122911 (= (contains!5964 (+!3098 lt!452612 (tuple2!15537 lt!452617 (zeroValue!5932 thiss!1427))) lt!452629) lt!452867)))

(declare-fun b!1028234 () Bool)

(declare-fun lt!452864 () Unit!33555)

(assert (=> b!1028234 (= e!580387 lt!452864)))

(assert (=> b!1028234 (= lt!452864 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6851 (+!3098 lt!452612 (tuple2!15537 lt!452617 (zeroValue!5932 thiss!1427)))) lt!452629))))

(assert (=> b!1028234 (isDefined!431 (getValueByKey!584 (toList!6851 (+!3098 lt!452612 (tuple2!15537 lt!452617 (zeroValue!5932 thiss!1427)))) lt!452629))))

(declare-fun b!1028235 () Bool)

(declare-fun Unit!33571 () Unit!33555)

(assert (=> b!1028235 (= e!580387 Unit!33571)))

(declare-fun b!1028236 () Bool)

(assert (=> b!1028236 (= e!580386 (isDefined!431 (getValueByKey!584 (toList!6851 (+!3098 lt!452612 (tuple2!15537 lt!452617 (zeroValue!5932 thiss!1427)))) lt!452629)))))

(assert (= (and d!122911 c!103733) b!1028234))

(assert (= (and d!122911 (not c!103733)) b!1028235))

(assert (= (and d!122911 (not res!688065)) b!1028236))

(declare-fun m!947003 () Bool)

(assert (=> d!122911 m!947003))

(declare-fun m!947005 () Bool)

(assert (=> b!1028234 m!947005))

(declare-fun m!947007 () Bool)

(assert (=> b!1028234 m!947007))

(assert (=> b!1028234 m!947007))

(declare-fun m!947009 () Bool)

(assert (=> b!1028234 m!947009))

(assert (=> b!1028236 m!947007))

(assert (=> b!1028236 m!947007))

(assert (=> b!1028236 m!947009))

(assert (=> b!1027893 d!122911))

(declare-fun d!122913 () Bool)

(assert (=> d!122913 (= (apply!900 (+!3098 lt!452620 (tuple2!15537 lt!452623 (minValue!5932 thiss!1427))) lt!452613) (apply!900 lt!452620 lt!452613))))

(declare-fun lt!452868 () Unit!33555)

(assert (=> d!122913 (= lt!452868 (choose!1683 lt!452620 lt!452623 (minValue!5932 thiss!1427) lt!452613))))

(declare-fun e!580388 () Bool)

(assert (=> d!122913 e!580388))

(declare-fun res!688066 () Bool)

(assert (=> d!122913 (=> (not res!688066) (not e!580388))))

(assert (=> d!122913 (= res!688066 (contains!5964 lt!452620 lt!452613))))

(assert (=> d!122913 (= (addApplyDifferent!479 lt!452620 lt!452623 (minValue!5932 thiss!1427) lt!452613) lt!452868)))

(declare-fun b!1028237 () Bool)

(assert (=> b!1028237 (= e!580388 (not (= lt!452613 lt!452623)))))

(assert (= (and d!122913 res!688066) b!1028237))

(assert (=> d!122913 m!946435))

(assert (=> d!122913 m!946437))

(declare-fun m!947011 () Bool)

(assert (=> d!122913 m!947011))

(assert (=> d!122913 m!946435))

(assert (=> d!122913 m!946445))

(declare-fun m!947013 () Bool)

(assert (=> d!122913 m!947013))

(assert (=> b!1027893 d!122913))

(declare-fun d!122915 () Bool)

(assert (=> d!122915 (contains!5964 (+!3098 lt!452612 (tuple2!15537 lt!452617 (zeroValue!5932 thiss!1427))) lt!452629)))

(declare-fun lt!452869 () Unit!33555)

(assert (=> d!122915 (= lt!452869 (choose!1684 lt!452612 lt!452617 (zeroValue!5932 thiss!1427) lt!452629))))

(assert (=> d!122915 (contains!5964 lt!452612 lt!452629)))

(assert (=> d!122915 (= (addStillContains!619 lt!452612 lt!452617 (zeroValue!5932 thiss!1427) lt!452629) lt!452869)))

(declare-fun bs!30015 () Bool)

(assert (= bs!30015 d!122915))

(assert (=> bs!30015 m!946431))

(assert (=> bs!30015 m!946431))

(assert (=> bs!30015 m!946433))

(declare-fun m!947015 () Bool)

(assert (=> bs!30015 m!947015))

(declare-fun m!947017 () Bool)

(assert (=> bs!30015 m!947017))

(assert (=> b!1027893 d!122915))

(declare-fun d!122917 () Bool)

(assert (=> d!122917 (= (apply!900 (+!3098 lt!452621 (tuple2!15537 lt!452616 (minValue!5932 thiss!1427))) lt!452614) (get!16342 (getValueByKey!584 (toList!6851 (+!3098 lt!452621 (tuple2!15537 lt!452616 (minValue!5932 thiss!1427)))) lt!452614)))))

(declare-fun bs!30016 () Bool)

(assert (= bs!30016 d!122917))

(declare-fun m!947019 () Bool)

(assert (=> bs!30016 m!947019))

(assert (=> bs!30016 m!947019))

(declare-fun m!947021 () Bool)

(assert (=> bs!30016 m!947021))

(assert (=> b!1027893 d!122917))

(assert (=> b!1027953 d!122813))

(declare-fun d!122919 () Bool)

(declare-fun e!580389 () Bool)

(assert (=> d!122919 e!580389))

(declare-fun res!688067 () Bool)

(assert (=> d!122919 (=> res!688067 e!580389)))

(declare-fun lt!452873 () Bool)

(assert (=> d!122919 (= res!688067 (not lt!452873))))

(declare-fun lt!452871 () Bool)

(assert (=> d!122919 (= lt!452873 lt!452871)))

(declare-fun lt!452872 () Unit!33555)

(declare-fun e!580390 () Unit!33555)

(assert (=> d!122919 (= lt!452872 e!580390)))

(declare-fun c!103734 () Bool)

(assert (=> d!122919 (= c!103734 lt!452871)))

(assert (=> d!122919 (= lt!452871 (containsKey!559 (toList!6851 lt!452633) key!909))))

(assert (=> d!122919 (= (contains!5964 lt!452633 key!909) lt!452873)))

(declare-fun b!1028238 () Bool)

(declare-fun lt!452870 () Unit!33555)

(assert (=> b!1028238 (= e!580390 lt!452870)))

(assert (=> b!1028238 (= lt!452870 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6851 lt!452633) key!909))))

(assert (=> b!1028238 (isDefined!431 (getValueByKey!584 (toList!6851 lt!452633) key!909))))

(declare-fun b!1028239 () Bool)

(declare-fun Unit!33572 () Unit!33555)

(assert (=> b!1028239 (= e!580390 Unit!33572)))

(declare-fun b!1028240 () Bool)

(assert (=> b!1028240 (= e!580389 (isDefined!431 (getValueByKey!584 (toList!6851 lt!452633) key!909)))))

(assert (= (and d!122919 c!103734) b!1028238))

(assert (= (and d!122919 (not c!103734)) b!1028239))

(assert (= (and d!122919 (not res!688067)) b!1028240))

(declare-fun m!947023 () Bool)

(assert (=> d!122919 m!947023))

(declare-fun m!947025 () Bool)

(assert (=> b!1028238 m!947025))

(declare-fun m!947027 () Bool)

(assert (=> b!1028238 m!947027))

(assert (=> b!1028238 m!947027))

(declare-fun m!947029 () Bool)

(assert (=> b!1028238 m!947029))

(assert (=> b!1028240 m!947027))

(assert (=> b!1028240 m!947027))

(assert (=> b!1028240 m!947029))

(assert (=> d!122757 d!122919))

(declare-fun b!1028251 () Bool)

(declare-fun e!580399 () Bool)

(declare-fun lt!452876 () List!21811)

(assert (=> b!1028251 (= e!580399 (not (containsKey!559 lt!452876 key!909)))))

(declare-fun b!1028252 () Bool)

(declare-fun e!580398 () List!21811)

(assert (=> b!1028252 (= e!580398 Nil!21808)))

(declare-fun b!1028253 () Bool)

(declare-fun e!580397 () List!21811)

(assert (=> b!1028253 (= e!580397 e!580398)))

(declare-fun c!103740 () Bool)

(assert (=> b!1028253 (= c!103740 (and ((_ is Cons!21807) (toList!6851 (getCurrentListMap!3899 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))) (not (= (_1!7779 (h!23005 (toList!6851 (getCurrentListMap!3899 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427))))) key!909))))))

(declare-fun b!1028254 () Bool)

(assert (=> b!1028254 (= e!580397 (t!30883 (toList!6851 (getCurrentListMap!3899 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))))))

(declare-fun d!122921 () Bool)

(assert (=> d!122921 e!580399))

(declare-fun res!688070 () Bool)

(assert (=> d!122921 (=> (not res!688070) (not e!580399))))

(declare-fun isStrictlySorted!714 (List!21811) Bool)

(assert (=> d!122921 (= res!688070 (isStrictlySorted!714 lt!452876))))

(assert (=> d!122921 (= lt!452876 e!580397)))

(declare-fun c!103739 () Bool)

(assert (=> d!122921 (= c!103739 (and ((_ is Cons!21807) (toList!6851 (getCurrentListMap!3899 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))) (= (_1!7779 (h!23005 (toList!6851 (getCurrentListMap!3899 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427))))) key!909)))))

(assert (=> d!122921 (isStrictlySorted!714 (toList!6851 (getCurrentListMap!3899 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427))))))

(assert (=> d!122921 (= (removeStrictlySorted!50 (toList!6851 (getCurrentListMap!3899 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427))) key!909) lt!452876)))

(declare-fun b!1028255 () Bool)

(declare-fun $colon$colon!598 (List!21811 tuple2!15536) List!21811)

(assert (=> b!1028255 (= e!580398 ($colon$colon!598 (removeStrictlySorted!50 (t!30883 (toList!6851 (getCurrentListMap!3899 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427)))) key!909) (h!23005 (toList!6851 (getCurrentListMap!3899 (_keys!11245 thiss!1427) (_values!6119 thiss!1427) (mask!29820 thiss!1427) (extraKeys!5828 thiss!1427) (zeroValue!5932 thiss!1427) (minValue!5932 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6096 thiss!1427))))))))

(assert (= (and d!122921 c!103739) b!1028254))

(assert (= (and d!122921 (not c!103739)) b!1028253))

(assert (= (and b!1028253 c!103740) b!1028255))

(assert (= (and b!1028253 (not c!103740)) b!1028252))

(assert (= (and d!122921 res!688070) b!1028251))

(declare-fun m!947031 () Bool)

(assert (=> b!1028251 m!947031))

(declare-fun m!947033 () Bool)

(assert (=> d!122921 m!947033))

(declare-fun m!947035 () Bool)

(assert (=> d!122921 m!947035))

(declare-fun m!947037 () Bool)

(assert (=> b!1028255 m!947037))

(assert (=> b!1028255 m!947037))

(declare-fun m!947039 () Bool)

(assert (=> b!1028255 m!947039))

(assert (=> d!122757 d!122921))

(assert (=> d!122763 d!122783))

(declare-fun b!1028256 () Bool)

(declare-fun e!580402 () Bool)

(declare-fun call!43336 () Bool)

(assert (=> b!1028256 (= e!580402 call!43336)))

(declare-fun bm!43333 () Bool)

(assert (=> bm!43333 (= call!43336 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) (mask!29820 thiss!1427)))))

(declare-fun b!1028257 () Bool)

(declare-fun e!580401 () Bool)

(assert (=> b!1028257 (= e!580401 e!580402)))

(declare-fun c!103741 () Bool)

(assert (=> b!1028257 (= c!103741 (validKeyInArray!0 (select (arr!31131 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1028259 () Bool)

(declare-fun e!580400 () Bool)

(assert (=> b!1028259 (= e!580400 call!43336)))

(declare-fun b!1028258 () Bool)

(assert (=> b!1028258 (= e!580402 e!580400)))

(declare-fun lt!452878 () (_ BitVec 64))

(assert (=> b!1028258 (= lt!452878 (select (arr!31131 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!452877 () Unit!33555)

(assert (=> b!1028258 (= lt!452877 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) lt!452878 #b00000000000000000000000000000000))))

(assert (=> b!1028258 (arrayContainsKey!0 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) lt!452878 #b00000000000000000000000000000000)))

(declare-fun lt!452879 () Unit!33555)

(assert (=> b!1028258 (= lt!452879 lt!452877)))

(declare-fun res!688071 () Bool)

(assert (=> b!1028258 (= res!688071 (= (seekEntryOrOpen!0 (select (arr!31131 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427)))) #b00000000000000000000000000000000) (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) (mask!29820 thiss!1427)) (Found!9677 #b00000000000000000000000000000000)))))

(assert (=> b!1028258 (=> (not res!688071) (not e!580400))))

(declare-fun d!122923 () Bool)

(declare-fun res!688072 () Bool)

(assert (=> d!122923 (=> res!688072 e!580401)))

(assert (=> d!122923 (= res!688072 (bvsge #b00000000000000000000000000000000 (size!31644 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))))))))

(assert (=> d!122923 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) (mask!29820 thiss!1427)) e!580401)))

(assert (= (and d!122923 (not res!688072)) b!1028257))

(assert (= (and b!1028257 c!103741) b!1028258))

(assert (= (and b!1028257 (not c!103741)) b!1028256))

(assert (= (and b!1028258 res!688071) b!1028259))

(assert (= (or b!1028259 b!1028256) bm!43333))

(declare-fun m!947041 () Bool)

(assert (=> bm!43333 m!947041))

(assert (=> b!1028257 m!946583))

(assert (=> b!1028257 m!946583))

(assert (=> b!1028257 m!946587))

(assert (=> b!1028258 m!946583))

(declare-fun m!947043 () Bool)

(assert (=> b!1028258 m!947043))

(declare-fun m!947045 () Bool)

(assert (=> b!1028258 m!947045))

(assert (=> b!1028258 m!946583))

(declare-fun m!947047 () Bool)

(assert (=> b!1028258 m!947047))

(assert (=> b!1027956 d!122923))

(declare-fun d!122925 () Bool)

(declare-fun e!580403 () Bool)

(assert (=> d!122925 e!580403))

(declare-fun res!688073 () Bool)

(assert (=> d!122925 (=> (not res!688073) (not e!580403))))

(declare-fun lt!452881 () ListLongMap!13671)

(assert (=> d!122925 (= res!688073 (contains!5964 lt!452881 (_1!7779 (ite (or c!103649 c!103648) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))))))))

(declare-fun lt!452880 () List!21811)

(assert (=> d!122925 (= lt!452881 (ListLongMap!13672 lt!452880))))

(declare-fun lt!452883 () Unit!33555)

(declare-fun lt!452882 () Unit!33555)

(assert (=> d!122925 (= lt!452883 lt!452882)))

(assert (=> d!122925 (= (getValueByKey!584 lt!452880 (_1!7779 (ite (or c!103649 c!103648) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))))) (Some!634 (_2!7779 (ite (or c!103649 c!103648) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))))))))

(assert (=> d!122925 (= lt!452882 (lemmaContainsTupThenGetReturnValue!275 lt!452880 (_1!7779 (ite (or c!103649 c!103648) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))) (_2!7779 (ite (or c!103649 c!103648) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))))))))

(assert (=> d!122925 (= lt!452880 (insertStrictlySorted!368 (toList!6851 (ite c!103649 call!43311 (ite c!103648 call!43314 call!43312))) (_1!7779 (ite (or c!103649 c!103648) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))) (_2!7779 (ite (or c!103649 c!103648) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))))))))

(assert (=> d!122925 (= (+!3098 (ite c!103649 call!43311 (ite c!103648 call!43314 call!43312)) (ite (or c!103649 c!103648) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))) lt!452881)))

(declare-fun b!1028260 () Bool)

(declare-fun res!688074 () Bool)

(assert (=> b!1028260 (=> (not res!688074) (not e!580403))))

(assert (=> b!1028260 (= res!688074 (= (getValueByKey!584 (toList!6851 lt!452881) (_1!7779 (ite (or c!103649 c!103648) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))))) (Some!634 (_2!7779 (ite (or c!103649 c!103648) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))))))))

(declare-fun b!1028261 () Bool)

(assert (=> b!1028261 (= e!580403 (contains!5966 (toList!6851 lt!452881) (ite (or c!103649 c!103648) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))))))

(assert (= (and d!122925 res!688073) b!1028260))

(assert (= (and b!1028260 res!688074) b!1028261))

(declare-fun m!947049 () Bool)

(assert (=> d!122925 m!947049))

(declare-fun m!947051 () Bool)

(assert (=> d!122925 m!947051))

(declare-fun m!947053 () Bool)

(assert (=> d!122925 m!947053))

(declare-fun m!947055 () Bool)

(assert (=> d!122925 m!947055))

(declare-fun m!947057 () Bool)

(assert (=> b!1028260 m!947057))

(declare-fun m!947059 () Bool)

(assert (=> b!1028261 m!947059))

(assert (=> bm!43311 d!122925))

(declare-fun d!122927 () Bool)

(declare-fun e!580404 () Bool)

(assert (=> d!122927 e!580404))

(declare-fun res!688075 () Bool)

(assert (=> d!122927 (=> (not res!688075) (not e!580404))))

(declare-fun lt!452885 () ListLongMap!13671)

(assert (=> d!122927 (= res!688075 (contains!5964 lt!452885 (_1!7779 (ite (or c!103640 c!103639) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))))))))

(declare-fun lt!452884 () List!21811)

(assert (=> d!122927 (= lt!452885 (ListLongMap!13672 lt!452884))))

(declare-fun lt!452887 () Unit!33555)

(declare-fun lt!452886 () Unit!33555)

(assert (=> d!122927 (= lt!452887 lt!452886)))

(assert (=> d!122927 (= (getValueByKey!584 lt!452884 (_1!7779 (ite (or c!103640 c!103639) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))))) (Some!634 (_2!7779 (ite (or c!103640 c!103639) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))))))))

(assert (=> d!122927 (= lt!452886 (lemmaContainsTupThenGetReturnValue!275 lt!452884 (_1!7779 (ite (or c!103640 c!103639) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))) (_2!7779 (ite (or c!103640 c!103639) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))))))))

(assert (=> d!122927 (= lt!452884 (insertStrictlySorted!368 (toList!6851 (ite c!103640 call!43301 (ite c!103639 call!43304 call!43302))) (_1!7779 (ite (or c!103640 c!103639) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))) (_2!7779 (ite (or c!103640 c!103639) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))))))))

(assert (=> d!122927 (= (+!3098 (ite c!103640 call!43301 (ite c!103639 call!43304 call!43302)) (ite (or c!103640 c!103639) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))) lt!452885)))

(declare-fun b!1028262 () Bool)

(declare-fun res!688076 () Bool)

(assert (=> b!1028262 (=> (not res!688076) (not e!580404))))

(assert (=> b!1028262 (= res!688076 (= (getValueByKey!584 (toList!6851 lt!452885) (_1!7779 (ite (or c!103640 c!103639) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427))))) (Some!634 (_2!7779 (ite (or c!103640 c!103639) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))))))))

(declare-fun b!1028263 () Bool)

(assert (=> b!1028263 (= e!580404 (contains!5966 (toList!6851 lt!452885) (ite (or c!103640 c!103639) (tuple2!15537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5932 thiss!1427)) (tuple2!15537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5932 thiss!1427)))))))

(assert (= (and d!122927 res!688075) b!1028262))

(assert (= (and b!1028262 res!688076) b!1028263))

(declare-fun m!947061 () Bool)

(assert (=> d!122927 m!947061))

(declare-fun m!947063 () Bool)

(assert (=> d!122927 m!947063))

(declare-fun m!947065 () Bool)

(assert (=> d!122927 m!947065))

(declare-fun m!947067 () Bool)

(assert (=> d!122927 m!947067))

(declare-fun m!947069 () Bool)

(assert (=> b!1028262 m!947069))

(declare-fun m!947071 () Bool)

(assert (=> b!1028263 m!947071))

(assert (=> bm!43301 d!122927))

(assert (=> bm!43307 d!122859))

(assert (=> bm!43297 d!122889))

(declare-fun d!122929 () Bool)

(assert (=> d!122929 (arrayNoDuplicates!0 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) #b00000000000000000000000000000000 Nil!21809)))

(assert (=> d!122929 true))

(declare-fun _$66!32 () Unit!33555)

(assert (=> d!122929 (= (choose!53 (_keys!11245 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41080 lt!452520) #b00000000000000000000000000000000 Nil!21809) _$66!32)))

(declare-fun bs!30017 () Bool)

(assert (= bs!30017 d!122929))

(assert (=> bs!30017 m!946335))

(assert (=> bs!30017 m!946409))

(assert (=> d!122751 d!122929))

(declare-fun bm!43334 () Bool)

(declare-fun call!43337 () (_ BitVec 32))

(assert (=> bm!43334 (= call!43337 (arrayCountValidKeys!0 (_keys!11245 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31644 (_keys!11245 thiss!1427))))))

(declare-fun b!1028264 () Bool)

(declare-fun e!580405 () (_ BitVec 32))

(assert (=> b!1028264 (= e!580405 (bvadd #b00000000000000000000000000000001 call!43337))))

(declare-fun b!1028265 () Bool)

(assert (=> b!1028265 (= e!580405 call!43337)))

(declare-fun d!122931 () Bool)

(declare-fun lt!452888 () (_ BitVec 32))

(assert (=> d!122931 (and (bvsge lt!452888 #b00000000000000000000000000000000) (bvsle lt!452888 (bvsub (size!31644 (_keys!11245 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!580406 () (_ BitVec 32))

(assert (=> d!122931 (= lt!452888 e!580406)))

(declare-fun c!103743 () Bool)

(assert (=> d!122931 (= c!103743 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31644 (_keys!11245 thiss!1427))))))

(assert (=> d!122931 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31644 (_keys!11245 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31644 (_keys!11245 thiss!1427)) (size!31644 (_keys!11245 thiss!1427))))))

(assert (=> d!122931 (= (arrayCountValidKeys!0 (_keys!11245 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31644 (_keys!11245 thiss!1427))) lt!452888)))

(declare-fun b!1028266 () Bool)

(assert (=> b!1028266 (= e!580406 #b00000000000000000000000000000000)))

(declare-fun b!1028267 () Bool)

(assert (=> b!1028267 (= e!580406 e!580405)))

(declare-fun c!103742 () Bool)

(assert (=> b!1028267 (= c!103742 (validKeyInArray!0 (select (arr!31131 (_keys!11245 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!122931 c!103743) b!1028266))

(assert (= (and d!122931 (not c!103743)) b!1028267))

(assert (= (and b!1028267 c!103742) b!1028264))

(assert (= (and b!1028267 (not c!103742)) b!1028265))

(assert (= (or b!1028264 b!1028265) bm!43334))

(declare-fun m!947073 () Bool)

(assert (=> bm!43334 m!947073))

(declare-fun m!947075 () Bool)

(assert (=> b!1028267 m!947075))

(assert (=> b!1028267 m!947075))

(declare-fun m!947077 () Bool)

(assert (=> b!1028267 m!947077))

(assert (=> bm!43312 d!122931))

(assert (=> b!1027963 d!122765))

(assert (=> b!1027935 d!122815))

(declare-fun d!122933 () Bool)

(assert (=> d!122933 (= (arrayCountValidKeys!0 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11245 thiss!1427) #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!122933 true))

(declare-fun _$79!8 () Unit!33555)

(assert (=> d!122933 (= (choose!82 (_keys!11245 thiss!1427) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!8)))

(declare-fun bs!30018 () Bool)

(assert (= bs!30018 d!122933))

(assert (=> bs!30018 m!946335))

(assert (=> bs!30018 m!946411))

(assert (=> bs!30018 m!946319))

(assert (=> d!122753 d!122933))

(declare-fun d!122935 () Bool)

(declare-fun res!688077 () Bool)

(declare-fun e!580407 () Bool)

(assert (=> d!122935 (=> res!688077 e!580407)))

(assert (=> d!122935 (= res!688077 (= (select (arr!31131 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!122935 (= (arrayContainsKey!0 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) key!909 #b00000000000000000000000000000000) e!580407)))

(declare-fun b!1028268 () Bool)

(declare-fun e!580408 () Bool)

(assert (=> b!1028268 (= e!580407 e!580408)))

(declare-fun res!688078 () Bool)

(assert (=> b!1028268 (=> (not res!688078) (not e!580408))))

(assert (=> b!1028268 (= res!688078 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31644 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))))))))

(declare-fun b!1028269 () Bool)

(assert (=> b!1028269 (= e!580408 (arrayContainsKey!0 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!122935 (not res!688077)) b!1028268))

(assert (= (and b!1028268 res!688078) b!1028269))

(assert (=> d!122935 m!946583))

(declare-fun m!947079 () Bool)

(assert (=> b!1028269 m!947079))

(assert (=> b!1027938 d!122935))

(assert (=> b!1027811 d!122813))

(declare-fun d!122937 () Bool)

(declare-fun e!580409 () Bool)

(assert (=> d!122937 e!580409))

(declare-fun res!688079 () Bool)

(assert (=> d!122937 (=> res!688079 e!580409)))

(declare-fun lt!452892 () Bool)

(assert (=> d!122937 (= res!688079 (not lt!452892))))

(declare-fun lt!452890 () Bool)

(assert (=> d!122937 (= lt!452892 lt!452890)))

(declare-fun lt!452891 () Unit!33555)

(declare-fun e!580410 () Unit!33555)

(assert (=> d!122937 (= lt!452891 e!580410)))

(declare-fun c!103744 () Bool)

(assert (=> d!122937 (= c!103744 lt!452890)))

(assert (=> d!122937 (= lt!452890 (containsKey!559 (toList!6851 lt!452655) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!122937 (= (contains!5964 lt!452655 #b1000000000000000000000000000000000000000000000000000000000000000) lt!452892)))

(declare-fun b!1028270 () Bool)

(declare-fun lt!452889 () Unit!33555)

(assert (=> b!1028270 (= e!580410 lt!452889)))

(assert (=> b!1028270 (= lt!452889 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6851 lt!452655) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1028270 (isDefined!431 (getValueByKey!584 (toList!6851 lt!452655) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028271 () Bool)

(declare-fun Unit!33573 () Unit!33555)

(assert (=> b!1028271 (= e!580410 Unit!33573)))

(declare-fun b!1028272 () Bool)

(assert (=> b!1028272 (= e!580409 (isDefined!431 (getValueByKey!584 (toList!6851 lt!452655) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!122937 c!103744) b!1028270))

(assert (= (and d!122937 (not c!103744)) b!1028271))

(assert (= (and d!122937 (not res!688079)) b!1028272))

(declare-fun m!947081 () Bool)

(assert (=> d!122937 m!947081))

(declare-fun m!947083 () Bool)

(assert (=> b!1028270 m!947083))

(assert (=> b!1028270 m!946659))

(assert (=> b!1028270 m!946659))

(declare-fun m!947085 () Bool)

(assert (=> b!1028270 m!947085))

(assert (=> b!1028272 m!946659))

(assert (=> b!1028272 m!946659))

(assert (=> b!1028272 m!947085))

(assert (=> bm!43308 d!122937))

(declare-fun d!122939 () Bool)

(declare-fun e!580411 () Bool)

(assert (=> d!122939 e!580411))

(declare-fun res!688080 () Bool)

(assert (=> d!122939 (=> res!688080 e!580411)))

(declare-fun lt!452896 () Bool)

(assert (=> d!122939 (= res!688080 (not lt!452896))))

(declare-fun lt!452894 () Bool)

(assert (=> d!122939 (= lt!452896 lt!452894)))

(declare-fun lt!452895 () Unit!33555)

(declare-fun e!580412 () Unit!33555)

(assert (=> d!122939 (= lt!452895 e!580412)))

(declare-fun c!103745 () Bool)

(assert (=> d!122939 (= c!103745 lt!452894)))

(assert (=> d!122939 (= lt!452894 (containsKey!559 (toList!6851 lt!452618) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!122939 (= (contains!5964 lt!452618 #b1000000000000000000000000000000000000000000000000000000000000000) lt!452896)))

(declare-fun b!1028273 () Bool)

(declare-fun lt!452893 () Unit!33555)

(assert (=> b!1028273 (= e!580412 lt!452893)))

(assert (=> b!1028273 (= lt!452893 (lemmaContainsKeyImpliesGetValueByKeyDefined!392 (toList!6851 lt!452618) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1028273 (isDefined!431 (getValueByKey!584 (toList!6851 lt!452618) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028274 () Bool)

(declare-fun Unit!33574 () Unit!33555)

(assert (=> b!1028274 (= e!580412 Unit!33574)))

(declare-fun b!1028275 () Bool)

(assert (=> b!1028275 (= e!580411 (isDefined!431 (getValueByKey!584 (toList!6851 lt!452618) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!122939 c!103745) b!1028273))

(assert (= (and d!122939 (not c!103745)) b!1028274))

(assert (= (and d!122939 (not res!688080)) b!1028275))

(declare-fun m!947087 () Bool)

(assert (=> d!122939 m!947087))

(declare-fun m!947089 () Bool)

(assert (=> b!1028273 m!947089))

(assert (=> b!1028273 m!946663))

(assert (=> b!1028273 m!946663))

(declare-fun m!947091 () Bool)

(assert (=> b!1028273 m!947091))

(assert (=> b!1028275 m!946663))

(assert (=> b!1028275 m!946663))

(assert (=> b!1028275 m!947091))

(assert (=> bm!43298 d!122939))

(declare-fun b!1028276 () Bool)

(declare-fun e!580415 () Bool)

(declare-fun call!43338 () Bool)

(assert (=> b!1028276 (= e!580415 call!43338)))

(declare-fun b!1028277 () Bool)

(assert (=> b!1028277 (= e!580415 call!43338)))

(declare-fun bm!43335 () Bool)

(declare-fun c!103746 () Bool)

(assert (=> bm!43335 (= call!43338 (arrayNoDuplicates!0 (_keys!11245 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103746 (Cons!21808 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000) Nil!21809) Nil!21809)))))

(declare-fun b!1028278 () Bool)

(declare-fun e!580414 () Bool)

(declare-fun e!580416 () Bool)

(assert (=> b!1028278 (= e!580414 e!580416)))

(declare-fun res!688082 () Bool)

(assert (=> b!1028278 (=> (not res!688082) (not e!580416))))

(declare-fun e!580413 () Bool)

(assert (=> b!1028278 (= res!688082 (not e!580413))))

(declare-fun res!688083 () Bool)

(assert (=> b!1028278 (=> (not res!688083) (not e!580413))))

(assert (=> b!1028278 (= res!688083 (validKeyInArray!0 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!122941 () Bool)

(declare-fun res!688081 () Bool)

(assert (=> d!122941 (=> res!688081 e!580414)))

(assert (=> d!122941 (= res!688081 (bvsge #b00000000000000000000000000000000 (size!31644 (_keys!11245 thiss!1427))))))

(assert (=> d!122941 (= (arrayNoDuplicates!0 (_keys!11245 thiss!1427) #b00000000000000000000000000000000 Nil!21809) e!580414)))

(declare-fun b!1028279 () Bool)

(assert (=> b!1028279 (= e!580413 (contains!5965 Nil!21809 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028280 () Bool)

(assert (=> b!1028280 (= e!580416 e!580415)))

(assert (=> b!1028280 (= c!103746 (validKeyInArray!0 (select (arr!31131 (_keys!11245 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!122941 (not res!688081)) b!1028278))

(assert (= (and b!1028278 res!688083) b!1028279))

(assert (= (and b!1028278 res!688082) b!1028280))

(assert (= (and b!1028280 c!103746) b!1028276))

(assert (= (and b!1028280 (not c!103746)) b!1028277))

(assert (= (or b!1028276 b!1028277) bm!43335))

(assert (=> bm!43335 m!946425))

(declare-fun m!947093 () Bool)

(assert (=> bm!43335 m!947093))

(assert (=> b!1028278 m!946425))

(assert (=> b!1028278 m!946425))

(assert (=> b!1028278 m!946429))

(assert (=> b!1028279 m!946425))

(assert (=> b!1028279 m!946425))

(declare-fun m!947095 () Bool)

(assert (=> b!1028279 m!947095))

(assert (=> b!1028280 m!946425))

(assert (=> b!1028280 m!946425))

(assert (=> b!1028280 m!946429))

(assert (=> b!1027965 d!122941))

(declare-fun d!122943 () Bool)

(assert (=> d!122943 (not (arrayContainsKey!0 (array!64647 (store (arr!31131 (_keys!11245 thiss!1427)) (index!41080 lt!452520) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31644 (_keys!11245 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!122943 true))

(declare-fun _$59!11 () Unit!33555)

(assert (=> d!122943 (= (choose!121 (_keys!11245 thiss!1427) (index!41080 lt!452520) key!909) _$59!11)))

(declare-fun bs!30019 () Bool)

(assert (= bs!30019 d!122943))

(assert (=> bs!30019 m!946335))

(assert (=> bs!30019 m!946551))

(assert (=> d!122767 d!122943))

(assert (=> b!1027908 d!122813))

(declare-fun mapNonEmpty!37884 () Bool)

(declare-fun mapRes!37884 () Bool)

(declare-fun tp!72790 () Bool)

(declare-fun e!580418 () Bool)

(assert (=> mapNonEmpty!37884 (= mapRes!37884 (and tp!72790 e!580418))))

(declare-fun mapValue!37884 () ValueCell!11445)

(declare-fun mapKey!37884 () (_ BitVec 32))

(declare-fun mapRest!37884 () (Array (_ BitVec 32) ValueCell!11445))

(assert (=> mapNonEmpty!37884 (= mapRest!37883 (store mapRest!37884 mapKey!37884 mapValue!37884))))

(declare-fun mapIsEmpty!37884 () Bool)

(assert (=> mapIsEmpty!37884 mapRes!37884))

(declare-fun condMapEmpty!37884 () Bool)

(declare-fun mapDefault!37884 () ValueCell!11445)

(assert (=> mapNonEmpty!37883 (= condMapEmpty!37884 (= mapRest!37883 ((as const (Array (_ BitVec 32) ValueCell!11445)) mapDefault!37884)))))

(declare-fun e!580417 () Bool)

(assert (=> mapNonEmpty!37883 (= tp!72789 (and e!580417 mapRes!37884))))

(declare-fun b!1028281 () Bool)

(assert (=> b!1028281 (= e!580418 tp_is_empty!24297)))

(declare-fun b!1028282 () Bool)

(assert (=> b!1028282 (= e!580417 tp_is_empty!24297)))

(assert (= (and mapNonEmpty!37883 condMapEmpty!37884) mapIsEmpty!37884))

(assert (= (and mapNonEmpty!37883 (not condMapEmpty!37884)) mapNonEmpty!37884))

(assert (= (and mapNonEmpty!37884 ((_ is ValueCellFull!11445) mapValue!37884)) b!1028281))

(assert (= (and mapNonEmpty!37883 ((_ is ValueCellFull!11445) mapDefault!37884)) b!1028282))

(declare-fun m!947097 () Bool)

(assert (=> mapNonEmpty!37884 m!947097))

(declare-fun b_lambda!15771 () Bool)

(assert (= b_lambda!15765 (or (and b!1027769 b_free!20577) b_lambda!15771)))

(declare-fun b_lambda!15773 () Bool)

(assert (= b_lambda!15767 (or (and b!1027769 b_free!20577) b_lambda!15773)))

(declare-fun b_lambda!15775 () Bool)

(assert (= b_lambda!15761 (or (and b!1027769 b_free!20577) b_lambda!15775)))

(declare-fun b_lambda!15777 () Bool)

(assert (= b_lambda!15759 (or (and b!1027769 b_free!20577) b_lambda!15777)))

(declare-fun b_lambda!15779 () Bool)

(assert (= b_lambda!15769 (or (and b!1027769 b_free!20577) b_lambda!15779)))

(declare-fun b_lambda!15781 () Bool)

(assert (= b_lambda!15763 (or (and b!1027769 b_free!20577) b_lambda!15781)))

(check-sat (not d!122871) (not b!1028231) (not b!1028224) (not b!1028230) (not b!1028232) (not d!122921) (not d!122895) (not bm!43335) (not b!1028129) (not b!1028213) (not b!1028220) (not d!122917) (not b!1028251) (not b!1028270) (not d!122889) (not d!122823) (not b!1028021) (not b!1028131) (not b_next!20577) (not b!1028024) (not b!1028194) (not d!122869) (not d!122797) (not d!122867) (not b!1028261) (not b!1028189) (not d!122881) (not d!122907) (not b!1028225) (not b!1028218) (not b!1028097) (not d!122877) (not b!1028058) (not d!122811) (not b!1028000) (not b!1028040) (not bm!43332) (not bm!43331) (not d!122879) (not b!1028263) (not b!1028205) (not d!122915) (not b_lambda!15781) (not b!1028208) (not b!1028234) (not b!1028027) (not d!122903) (not b!1028278) (not b!1028019) (not bm!43322) (not b!1028005) (not d!122787) (not d!122863) (not b!1028279) (not b!1028196) (not d!122901) (not b!1028155) (not b!1028157) (not b!1028081) (not d!122929) (not b!1028236) (not d!122861) (not d!122875) (not b!1028226) (not b!1028185) (not d!122831) (not b!1028280) (not d!122855) (not d!122849) (not b!1028222) (not b!1028158) (not d!122913) (not b!1028101) (not b!1028056) (not b!1028210) (not d!122939) (not b!1028203) (not b!1028041) (not b!1028043) (not d!122851) (not b!1028275) (not d!122799) (not bm!43319) (not d!122845) (not b!1028240) (not b!1028258) (not b!1027997) (not b_lambda!15755) (not d!122819) (not b!1028011) (not b!1028215) (not b!1028123) (not b!1028054) (not b!1028102) (not d!122933) (not d!122925) (not d!122909) (not b!1028233) (not b!1028187) (not b_lambda!15773) (not d!122883) (not d!122897) (not b!1028238) (not bm!43325) (not b_lambda!15777) (not b!1028008) (not b_lambda!15775) (not b!1028217) (not b!1028042) (not d!122795) (not d!122781) (not d!122873) (not b!1028188) (not b_lambda!15745) (not b!1028028) b_and!32861 (not b!1028272) (not d!122835) (not d!122911) (not d!122885) (not d!122785) (not b!1028035) (not bm!43323) (not b!1028098) (not b!1028051) (not b!1028260) (not b!1028207) (not d!122927) (not d!122865) (not d!122905) (not d!122919) (not b!1028219) (not mapNonEmpty!37884) (not b!1028211) (not bm!43333) (not b!1028012) (not d!122801) (not b!1028047) (not b!1028192) (not b!1028267) (not b!1028010) (not b_lambda!15753) (not b!1028055) (not bm!43328) (not b!1028006) (not bm!43318) (not b!1028273) (not d!122859) (not bm!43320) (not b!1028262) (not b!1028124) (not d!122899) (not b!1028257) tp_is_empty!24297 (not b!1028022) (not d!122891) (not b!1028159) (not b!1028127) (not bm!43324) (not b!1028059) (not d!122839) (not bm!43326) (not b!1028269) (not b_lambda!15771) (not d!122937) (not d!122857) (not b!1028197) (not b!1028216) (not b!1028227) (not d!122943) (not b!1028105) (not b!1028191) (not bm!43327) (not b!1028156) (not bm!43334) (not b!1028190) (not d!122789) (not d!122833) (not b_lambda!15757) (not d!122841) (not d!122827) (not b!1028029) (not b!1028126) (not d!122793) (not d!122893) (not b!1028145) (not d!122887) (not b!1028255) (not b!1028154) (not b_lambda!15779))
(check-sat b_and!32861 (not b_next!20577))
