; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90668 () Bool)

(assert start!90668)

(declare-fun b!1037008 () Bool)

(declare-fun b_free!20883 () Bool)

(declare-fun b_next!20883 () Bool)

(assert (=> b!1037008 (= b_free!20883 (not b_next!20883))))

(declare-fun tp!73788 () Bool)

(declare-fun b_and!33415 () Bool)

(assert (=> b!1037008 (= tp!73788 b_and!33415)))

(declare-fun b!1037003 () Bool)

(declare-fun e!586530 () Bool)

(declare-fun e!586526 () Bool)

(assert (=> b!1037003 (= e!586530 e!586526)))

(declare-fun res!692011 () Bool)

(assert (=> b!1037003 (=> res!692011 e!586526)))

(declare-datatypes ((SeekEntryResult!9748 0))(
  ( (MissingZero!9748 (index!41363 (_ BitVec 32))) (Found!9748 (index!41364 (_ BitVec 32))) (Intermediate!9748 (undefined!10560 Bool) (index!41365 (_ BitVec 32)) (x!92490 (_ BitVec 32))) (Undefined!9748) (MissingVacant!9748 (index!41366 (_ BitVec 32))) )
))
(declare-fun lt!457369 () SeekEntryResult!9748)

(declare-datatypes ((V!37677 0))(
  ( (V!37678 (val!12352 Int)) )
))
(declare-datatypes ((ValueCell!11598 0))(
  ( (ValueCellFull!11598 (v!14935 V!37677)) (EmptyCell!11598) )
))
(declare-datatypes ((array!65306 0))(
  ( (array!65307 (arr!31437 (Array (_ BitVec 32) (_ BitVec 64))) (size!31966 (_ BitVec 32))) )
))
(declare-datatypes ((array!65308 0))(
  ( (array!65309 (arr!31438 (Array (_ BitVec 32) ValueCell!11598)) (size!31967 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5790 0))(
  ( (LongMapFixedSize!5791 (defaultEntry!6277 Int) (mask!30183 (_ BitVec 32)) (extraKeys!6005 (_ BitVec 32)) (zeroValue!6111 V!37677) (minValue!6111 V!37677) (_size!2950 (_ BitVec 32)) (_keys!11468 array!65306) (_values!6300 array!65308) (_vacant!2950 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5790)

(assert (=> b!1037003 (= res!692011 (or (bvslt (index!41364 lt!457369) #b00000000000000000000000000000000) (bvsge (index!41364 lt!457369) (size!31966 (_keys!11468 thiss!1427)))))))

(declare-fun mapIsEmpty!38426 () Bool)

(declare-fun mapRes!38426 () Bool)

(assert (=> mapIsEmpty!38426 mapRes!38426))

(declare-fun b!1037004 () Bool)

(declare-fun e!586527 () Bool)

(declare-fun tp_is_empty!24603 () Bool)

(assert (=> b!1037004 (= e!586527 tp_is_empty!24603)))

(declare-fun b!1037005 () Bool)

(declare-fun res!692015 () Bool)

(declare-fun e!586531 () Bool)

(assert (=> b!1037005 (=> (not res!692015) (not e!586531))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1037005 (= res!692015 (not (= key!909 (bvneg key!909))))))

(declare-fun res!692014 () Bool)

(assert (=> start!90668 (=> (not res!692014) (not e!586531))))

(declare-fun valid!2184 (LongMapFixedSize!5790) Bool)

(assert (=> start!90668 (= res!692014 (valid!2184 thiss!1427))))

(assert (=> start!90668 e!586531))

(declare-fun e!586532 () Bool)

(assert (=> start!90668 e!586532))

(assert (=> start!90668 true))

(declare-fun b!1037006 () Bool)

(assert (=> b!1037006 (= e!586531 e!586530)))

(declare-fun res!692013 () Bool)

(assert (=> b!1037006 (=> (not res!692013) (not e!586530))))

(get-info :version)

(assert (=> b!1037006 (= res!692013 ((_ is Found!9748) lt!457369))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65306 (_ BitVec 32)) SeekEntryResult!9748)

(assert (=> b!1037006 (= lt!457369 (seekEntry!0 key!909 (_keys!11468 thiss!1427) (mask!30183 thiss!1427)))))

(declare-fun b!1037007 () Bool)

(declare-fun res!692012 () Bool)

(assert (=> b!1037007 (=> res!692012 e!586526)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1037007 (= res!692012 (not (validKeyInArray!0 (select (arr!31437 (_keys!11468 thiss!1427)) (index!41364 lt!457369)))))))

(declare-fun e!586533 () Bool)

(declare-fun array_inv!24317 (array!65306) Bool)

(declare-fun array_inv!24318 (array!65308) Bool)

(assert (=> b!1037008 (= e!586532 (and tp!73788 tp_is_empty!24603 (array_inv!24317 (_keys!11468 thiss!1427)) (array_inv!24318 (_values!6300 thiss!1427)) e!586533))))

(declare-fun b!1037009 () Bool)

(declare-fun e!586529 () Bool)

(assert (=> b!1037009 (= e!586529 tp_is_empty!24603)))

(declare-fun b!1037010 () Bool)

(assert (=> b!1037010 (= e!586533 (and e!586527 mapRes!38426))))

(declare-fun condMapEmpty!38426 () Bool)

(declare-fun mapDefault!38426 () ValueCell!11598)

(assert (=> b!1037010 (= condMapEmpty!38426 (= (arr!31438 (_values!6300 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11598)) mapDefault!38426)))))

(declare-fun b!1037011 () Bool)

(assert (=> b!1037011 (= e!586526 (bvsge (size!31966 (_keys!11468 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun mapNonEmpty!38426 () Bool)

(declare-fun tp!73787 () Bool)

(assert (=> mapNonEmpty!38426 (= mapRes!38426 (and tp!73787 e!586529))))

(declare-fun mapValue!38426 () ValueCell!11598)

(declare-fun mapKey!38426 () (_ BitVec 32))

(declare-fun mapRest!38426 () (Array (_ BitVec 32) ValueCell!11598))

(assert (=> mapNonEmpty!38426 (= (arr!31438 (_values!6300 thiss!1427)) (store mapRest!38426 mapKey!38426 mapValue!38426))))

(assert (= (and start!90668 res!692014) b!1037005))

(assert (= (and b!1037005 res!692015) b!1037006))

(assert (= (and b!1037006 res!692013) b!1037003))

(assert (= (and b!1037003 (not res!692011)) b!1037007))

(assert (= (and b!1037007 (not res!692012)) b!1037011))

(assert (= (and b!1037010 condMapEmpty!38426) mapIsEmpty!38426))

(assert (= (and b!1037010 (not condMapEmpty!38426)) mapNonEmpty!38426))

(assert (= (and mapNonEmpty!38426 ((_ is ValueCellFull!11598) mapValue!38426)) b!1037009))

(assert (= (and b!1037010 ((_ is ValueCellFull!11598) mapDefault!38426)) b!1037004))

(assert (= b!1037008 b!1037010))

(assert (= start!90668 b!1037008))

(declare-fun m!957365 () Bool)

(assert (=> b!1037007 m!957365))

(assert (=> b!1037007 m!957365))

(declare-fun m!957367 () Bool)

(assert (=> b!1037007 m!957367))

(declare-fun m!957369 () Bool)

(assert (=> mapNonEmpty!38426 m!957369))

(declare-fun m!957371 () Bool)

(assert (=> b!1037006 m!957371))

(declare-fun m!957373 () Bool)

(assert (=> b!1037008 m!957373))

(declare-fun m!957375 () Bool)

(assert (=> b!1037008 m!957375))

(declare-fun m!957377 () Bool)

(assert (=> start!90668 m!957377))

(check-sat (not b!1037008) (not b_next!20883) tp_is_empty!24603 (not start!90668) (not b!1037006) b_and!33415 (not mapNonEmpty!38426) (not b!1037007))
(check-sat b_and!33415 (not b_next!20883))
(get-model)

(declare-fun d!125179 () Bool)

(assert (=> d!125179 (= (validKeyInArray!0 (select (arr!31437 (_keys!11468 thiss!1427)) (index!41364 lt!457369))) (and (not (= (select (arr!31437 (_keys!11468 thiss!1427)) (index!41364 lt!457369)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31437 (_keys!11468 thiss!1427)) (index!41364 lt!457369)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1037007 d!125179))

(declare-fun d!125181 () Bool)

(declare-fun res!692037 () Bool)

(declare-fun e!586560 () Bool)

(assert (=> d!125181 (=> (not res!692037) (not e!586560))))

(declare-fun simpleValid!415 (LongMapFixedSize!5790) Bool)

(assert (=> d!125181 (= res!692037 (simpleValid!415 thiss!1427))))

(assert (=> d!125181 (= (valid!2184 thiss!1427) e!586560)))

(declare-fun b!1037045 () Bool)

(declare-fun res!692038 () Bool)

(assert (=> b!1037045 (=> (not res!692038) (not e!586560))))

(declare-fun arrayCountValidKeys!0 (array!65306 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037045 (= res!692038 (= (arrayCountValidKeys!0 (_keys!11468 thiss!1427) #b00000000000000000000000000000000 (size!31966 (_keys!11468 thiss!1427))) (_size!2950 thiss!1427)))))

(declare-fun b!1037046 () Bool)

(declare-fun res!692039 () Bool)

(assert (=> b!1037046 (=> (not res!692039) (not e!586560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65306 (_ BitVec 32)) Bool)

(assert (=> b!1037046 (= res!692039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11468 thiss!1427) (mask!30183 thiss!1427)))))

(declare-fun b!1037047 () Bool)

(declare-datatypes ((List!21921 0))(
  ( (Nil!21918) (Cons!21917 (h!23119 (_ BitVec 64)) (t!31135 List!21921)) )
))
(declare-fun arrayNoDuplicates!0 (array!65306 (_ BitVec 32) List!21921) Bool)

(assert (=> b!1037047 (= e!586560 (arrayNoDuplicates!0 (_keys!11468 thiss!1427) #b00000000000000000000000000000000 Nil!21918))))

(assert (= (and d!125181 res!692037) b!1037045))

(assert (= (and b!1037045 res!692038) b!1037046))

(assert (= (and b!1037046 res!692039) b!1037047))

(declare-fun m!957393 () Bool)

(assert (=> d!125181 m!957393))

(declare-fun m!957395 () Bool)

(assert (=> b!1037045 m!957395))

(declare-fun m!957397 () Bool)

(assert (=> b!1037046 m!957397))

(declare-fun m!957399 () Bool)

(assert (=> b!1037047 m!957399))

(assert (=> start!90668 d!125181))

(declare-fun d!125183 () Bool)

(assert (=> d!125183 (= (array_inv!24317 (_keys!11468 thiss!1427)) (bvsge (size!31966 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037008 d!125183))

(declare-fun d!125185 () Bool)

(assert (=> d!125185 (= (array_inv!24318 (_values!6300 thiss!1427)) (bvsge (size!31967 (_values!6300 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037008 d!125185))

(declare-fun d!125187 () Bool)

(declare-fun lt!457381 () SeekEntryResult!9748)

(assert (=> d!125187 (and (or ((_ is MissingVacant!9748) lt!457381) (not ((_ is Found!9748) lt!457381)) (and (bvsge (index!41364 lt!457381) #b00000000000000000000000000000000) (bvslt (index!41364 lt!457381) (size!31966 (_keys!11468 thiss!1427))))) (not ((_ is MissingVacant!9748) lt!457381)) (or (not ((_ is Found!9748) lt!457381)) (= (select (arr!31437 (_keys!11468 thiss!1427)) (index!41364 lt!457381)) key!909)))))

(declare-fun e!586569 () SeekEntryResult!9748)

(assert (=> d!125187 (= lt!457381 e!586569)))

(declare-fun c!105059 () Bool)

(declare-fun lt!457384 () SeekEntryResult!9748)

(assert (=> d!125187 (= c!105059 (and ((_ is Intermediate!9748) lt!457384) (undefined!10560 lt!457384)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65306 (_ BitVec 32)) SeekEntryResult!9748)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125187 (= lt!457384 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30183 thiss!1427)) key!909 (_keys!11468 thiss!1427) (mask!30183 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125187 (validMask!0 (mask!30183 thiss!1427))))

(assert (=> d!125187 (= (seekEntry!0 key!909 (_keys!11468 thiss!1427) (mask!30183 thiss!1427)) lt!457381)))

(declare-fun b!1037060 () Bool)

(declare-fun e!586568 () SeekEntryResult!9748)

(declare-fun lt!457383 () SeekEntryResult!9748)

(assert (=> b!1037060 (= e!586568 (ite ((_ is MissingVacant!9748) lt!457383) (MissingZero!9748 (index!41366 lt!457383)) lt!457383))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65306 (_ BitVec 32)) SeekEntryResult!9748)

(assert (=> b!1037060 (= lt!457383 (seekKeyOrZeroReturnVacant!0 (x!92490 lt!457384) (index!41365 lt!457384) (index!41365 lt!457384) key!909 (_keys!11468 thiss!1427) (mask!30183 thiss!1427)))))

(declare-fun b!1037061 () Bool)

(assert (=> b!1037061 (= e!586569 Undefined!9748)))

(declare-fun b!1037062 () Bool)

(declare-fun c!105060 () Bool)

(declare-fun lt!457382 () (_ BitVec 64))

(assert (=> b!1037062 (= c!105060 (= lt!457382 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586567 () SeekEntryResult!9748)

(assert (=> b!1037062 (= e!586567 e!586568)))

(declare-fun b!1037063 () Bool)

(assert (=> b!1037063 (= e!586569 e!586567)))

(assert (=> b!1037063 (= lt!457382 (select (arr!31437 (_keys!11468 thiss!1427)) (index!41365 lt!457384)))))

(declare-fun c!105058 () Bool)

(assert (=> b!1037063 (= c!105058 (= lt!457382 key!909))))

(declare-fun b!1037064 () Bool)

(assert (=> b!1037064 (= e!586567 (Found!9748 (index!41365 lt!457384)))))

(declare-fun b!1037065 () Bool)

(assert (=> b!1037065 (= e!586568 (MissingZero!9748 (index!41365 lt!457384)))))

(assert (= (and d!125187 c!105059) b!1037061))

(assert (= (and d!125187 (not c!105059)) b!1037063))

(assert (= (and b!1037063 c!105058) b!1037064))

(assert (= (and b!1037063 (not c!105058)) b!1037062))

(assert (= (and b!1037062 c!105060) b!1037065))

(assert (= (and b!1037062 (not c!105060)) b!1037060))

(declare-fun m!957401 () Bool)

(assert (=> d!125187 m!957401))

(declare-fun m!957403 () Bool)

(assert (=> d!125187 m!957403))

(assert (=> d!125187 m!957403))

(declare-fun m!957405 () Bool)

(assert (=> d!125187 m!957405))

(declare-fun m!957407 () Bool)

(assert (=> d!125187 m!957407))

(declare-fun m!957409 () Bool)

(assert (=> b!1037060 m!957409))

(declare-fun m!957411 () Bool)

(assert (=> b!1037063 m!957411))

(assert (=> b!1037006 d!125187))

(declare-fun mapIsEmpty!38432 () Bool)

(declare-fun mapRes!38432 () Bool)

(assert (=> mapIsEmpty!38432 mapRes!38432))

(declare-fun b!1037072 () Bool)

(declare-fun e!586575 () Bool)

(assert (=> b!1037072 (= e!586575 tp_is_empty!24603)))

(declare-fun condMapEmpty!38432 () Bool)

(declare-fun mapDefault!38432 () ValueCell!11598)

(assert (=> mapNonEmpty!38426 (= condMapEmpty!38432 (= mapRest!38426 ((as const (Array (_ BitVec 32) ValueCell!11598)) mapDefault!38432)))))

(declare-fun e!586574 () Bool)

(assert (=> mapNonEmpty!38426 (= tp!73787 (and e!586574 mapRes!38432))))

(declare-fun b!1037073 () Bool)

(assert (=> b!1037073 (= e!586574 tp_is_empty!24603)))

(declare-fun mapNonEmpty!38432 () Bool)

(declare-fun tp!73797 () Bool)

(assert (=> mapNonEmpty!38432 (= mapRes!38432 (and tp!73797 e!586575))))

(declare-fun mapValue!38432 () ValueCell!11598)

(declare-fun mapRest!38432 () (Array (_ BitVec 32) ValueCell!11598))

(declare-fun mapKey!38432 () (_ BitVec 32))

(assert (=> mapNonEmpty!38432 (= mapRest!38426 (store mapRest!38432 mapKey!38432 mapValue!38432))))

(assert (= (and mapNonEmpty!38426 condMapEmpty!38432) mapIsEmpty!38432))

(assert (= (and mapNonEmpty!38426 (not condMapEmpty!38432)) mapNonEmpty!38432))

(assert (= (and mapNonEmpty!38432 ((_ is ValueCellFull!11598) mapValue!38432)) b!1037072))

(assert (= (and mapNonEmpty!38426 ((_ is ValueCellFull!11598) mapDefault!38432)) b!1037073))

(declare-fun m!957413 () Bool)

(assert (=> mapNonEmpty!38432 m!957413))

(check-sat (not b!1037060) (not b!1037046) (not b!1037045) (not b!1037047) (not d!125181) (not b_next!20883) tp_is_empty!24603 (not d!125187) (not mapNonEmpty!38432) b_and!33415)
(check-sat b_and!33415 (not b_next!20883))
(get-model)

(declare-fun bm!43902 () Bool)

(declare-fun call!43905 () (_ BitVec 32))

(assert (=> bm!43902 (= call!43905 (arrayCountValidKeys!0 (_keys!11468 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31966 (_keys!11468 thiss!1427))))))

(declare-fun b!1037082 () Bool)

(declare-fun e!586580 () (_ BitVec 32))

(assert (=> b!1037082 (= e!586580 (bvadd #b00000000000000000000000000000001 call!43905))))

(declare-fun b!1037083 () Bool)

(assert (=> b!1037083 (= e!586580 call!43905)))

(declare-fun b!1037084 () Bool)

(declare-fun e!586581 () (_ BitVec 32))

(assert (=> b!1037084 (= e!586581 e!586580)))

(declare-fun c!105066 () Bool)

(assert (=> b!1037084 (= c!105066 (validKeyInArray!0 (select (arr!31437 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037085 () Bool)

(assert (=> b!1037085 (= e!586581 #b00000000000000000000000000000000)))

(declare-fun d!125189 () Bool)

(declare-fun lt!457387 () (_ BitVec 32))

(assert (=> d!125189 (and (bvsge lt!457387 #b00000000000000000000000000000000) (bvsle lt!457387 (bvsub (size!31966 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125189 (= lt!457387 e!586581)))

(declare-fun c!105065 () Bool)

(assert (=> d!125189 (= c!105065 (bvsge #b00000000000000000000000000000000 (size!31966 (_keys!11468 thiss!1427))))))

(assert (=> d!125189 (and (bvsle #b00000000000000000000000000000000 (size!31966 (_keys!11468 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31966 (_keys!11468 thiss!1427)) (size!31966 (_keys!11468 thiss!1427))))))

(assert (=> d!125189 (= (arrayCountValidKeys!0 (_keys!11468 thiss!1427) #b00000000000000000000000000000000 (size!31966 (_keys!11468 thiss!1427))) lt!457387)))

(assert (= (and d!125189 c!105065) b!1037085))

(assert (= (and d!125189 (not c!105065)) b!1037084))

(assert (= (and b!1037084 c!105066) b!1037082))

(assert (= (and b!1037084 (not c!105066)) b!1037083))

(assert (= (or b!1037082 b!1037083) bm!43902))

(declare-fun m!957415 () Bool)

(assert (=> bm!43902 m!957415))

(declare-fun m!957417 () Bool)

(assert (=> b!1037084 m!957417))

(assert (=> b!1037084 m!957417))

(declare-fun m!957419 () Bool)

(assert (=> b!1037084 m!957419))

(assert (=> b!1037045 d!125189))

(declare-fun b!1037104 () Bool)

(declare-fun e!586592 () SeekEntryResult!9748)

(assert (=> b!1037104 (= e!586592 (Intermediate!9748 true (toIndex!0 key!909 (mask!30183 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1037105 () Bool)

(declare-fun e!586594 () Bool)

(declare-fun lt!457393 () SeekEntryResult!9748)

(assert (=> b!1037105 (= e!586594 (bvsge (x!92490 lt!457393) #b01111111111111111111111111111110))))

(declare-fun b!1037106 () Bool)

(assert (=> b!1037106 (and (bvsge (index!41365 lt!457393) #b00000000000000000000000000000000) (bvslt (index!41365 lt!457393) (size!31966 (_keys!11468 thiss!1427))))))

(declare-fun res!692046 () Bool)

(assert (=> b!1037106 (= res!692046 (= (select (arr!31437 (_keys!11468 thiss!1427)) (index!41365 lt!457393)) key!909))))

(declare-fun e!586595 () Bool)

(assert (=> b!1037106 (=> res!692046 e!586595)))

(declare-fun e!586593 () Bool)

(assert (=> b!1037106 (= e!586593 e!586595)))

(declare-fun b!1037107 () Bool)

(declare-fun e!586596 () SeekEntryResult!9748)

(assert (=> b!1037107 (= e!586592 e!586596)))

(declare-fun c!105074 () Bool)

(declare-fun lt!457392 () (_ BitVec 64))

(assert (=> b!1037107 (= c!105074 (or (= lt!457392 key!909) (= (bvadd lt!457392 lt!457392) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1037108 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037108 (= e!586596 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!30183 thiss!1427)) #b00000000000000000000000000000000 (mask!30183 thiss!1427)) key!909 (_keys!11468 thiss!1427) (mask!30183 thiss!1427)))))

(declare-fun b!1037109 () Bool)

(assert (=> b!1037109 (= e!586596 (Intermediate!9748 false (toIndex!0 key!909 (mask!30183 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun d!125191 () Bool)

(assert (=> d!125191 e!586594))

(declare-fun c!105075 () Bool)

(assert (=> d!125191 (= c!105075 (and ((_ is Intermediate!9748) lt!457393) (undefined!10560 lt!457393)))))

(assert (=> d!125191 (= lt!457393 e!586592)))

(declare-fun c!105073 () Bool)

(assert (=> d!125191 (= c!105073 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!125191 (= lt!457392 (select (arr!31437 (_keys!11468 thiss!1427)) (toIndex!0 key!909 (mask!30183 thiss!1427))))))

(assert (=> d!125191 (validMask!0 (mask!30183 thiss!1427))))

(assert (=> d!125191 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30183 thiss!1427)) key!909 (_keys!11468 thiss!1427) (mask!30183 thiss!1427)) lt!457393)))

(declare-fun b!1037110 () Bool)

(assert (=> b!1037110 (and (bvsge (index!41365 lt!457393) #b00000000000000000000000000000000) (bvslt (index!41365 lt!457393) (size!31966 (_keys!11468 thiss!1427))))))

(declare-fun res!692048 () Bool)

(assert (=> b!1037110 (= res!692048 (= (select (arr!31437 (_keys!11468 thiss!1427)) (index!41365 lt!457393)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037110 (=> res!692048 e!586595)))

(declare-fun b!1037111 () Bool)

(assert (=> b!1037111 (and (bvsge (index!41365 lt!457393) #b00000000000000000000000000000000) (bvslt (index!41365 lt!457393) (size!31966 (_keys!11468 thiss!1427))))))

(assert (=> b!1037111 (= e!586595 (= (select (arr!31437 (_keys!11468 thiss!1427)) (index!41365 lt!457393)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037112 () Bool)

(assert (=> b!1037112 (= e!586594 e!586593)))

(declare-fun res!692047 () Bool)

(assert (=> b!1037112 (= res!692047 (and ((_ is Intermediate!9748) lt!457393) (not (undefined!10560 lt!457393)) (bvslt (x!92490 lt!457393) #b01111111111111111111111111111110) (bvsge (x!92490 lt!457393) #b00000000000000000000000000000000) (bvsge (x!92490 lt!457393) #b00000000000000000000000000000000)))))

(assert (=> b!1037112 (=> (not res!692047) (not e!586593))))

(assert (= (and d!125191 c!105073) b!1037104))

(assert (= (and d!125191 (not c!105073)) b!1037107))

(assert (= (and b!1037107 c!105074) b!1037109))

(assert (= (and b!1037107 (not c!105074)) b!1037108))

(assert (= (and d!125191 c!105075) b!1037105))

(assert (= (and d!125191 (not c!105075)) b!1037112))

(assert (= (and b!1037112 res!692047) b!1037106))

(assert (= (and b!1037106 (not res!692046)) b!1037110))

(assert (= (and b!1037110 (not res!692048)) b!1037111))

(declare-fun m!957421 () Bool)

(assert (=> b!1037111 m!957421))

(assert (=> b!1037108 m!957403))

(declare-fun m!957423 () Bool)

(assert (=> b!1037108 m!957423))

(assert (=> b!1037108 m!957423))

(declare-fun m!957425 () Bool)

(assert (=> b!1037108 m!957425))

(assert (=> b!1037106 m!957421))

(assert (=> b!1037110 m!957421))

(assert (=> d!125191 m!957403))

(declare-fun m!957427 () Bool)

(assert (=> d!125191 m!957427))

(assert (=> d!125191 m!957407))

(assert (=> d!125187 d!125191))

(declare-fun d!125193 () Bool)

(declare-fun lt!457399 () (_ BitVec 32))

(declare-fun lt!457398 () (_ BitVec 32))

(assert (=> d!125193 (= lt!457399 (bvmul (bvxor lt!457398 (bvlshr lt!457398 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!125193 (= lt!457398 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!125193 (and (bvsge (mask!30183 thiss!1427) #b00000000000000000000000000000000) (let ((res!692049 (let ((h!23120 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!92507 (bvmul (bvxor h!23120 (bvlshr h!23120 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!92507 (bvlshr x!92507 #b00000000000000000000000000001101)) (mask!30183 thiss!1427)))))) (and (bvslt res!692049 (bvadd (mask!30183 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!692049 #b00000000000000000000000000000000))))))

(assert (=> d!125193 (= (toIndex!0 key!909 (mask!30183 thiss!1427)) (bvand (bvxor lt!457399 (bvlshr lt!457399 #b00000000000000000000000000001101)) (mask!30183 thiss!1427)))))

(assert (=> d!125187 d!125193))

(declare-fun d!125195 () Bool)

(assert (=> d!125195 (= (validMask!0 (mask!30183 thiss!1427)) (and (or (= (mask!30183 thiss!1427) #b00000000000000000000000000000111) (= (mask!30183 thiss!1427) #b00000000000000000000000000001111) (= (mask!30183 thiss!1427) #b00000000000000000000000000011111) (= (mask!30183 thiss!1427) #b00000000000000000000000000111111) (= (mask!30183 thiss!1427) #b00000000000000000000000001111111) (= (mask!30183 thiss!1427) #b00000000000000000000000011111111) (= (mask!30183 thiss!1427) #b00000000000000000000000111111111) (= (mask!30183 thiss!1427) #b00000000000000000000001111111111) (= (mask!30183 thiss!1427) #b00000000000000000000011111111111) (= (mask!30183 thiss!1427) #b00000000000000000000111111111111) (= (mask!30183 thiss!1427) #b00000000000000000001111111111111) (= (mask!30183 thiss!1427) #b00000000000000000011111111111111) (= (mask!30183 thiss!1427) #b00000000000000000111111111111111) (= (mask!30183 thiss!1427) #b00000000000000001111111111111111) (= (mask!30183 thiss!1427) #b00000000000000011111111111111111) (= (mask!30183 thiss!1427) #b00000000000000111111111111111111) (= (mask!30183 thiss!1427) #b00000000000001111111111111111111) (= (mask!30183 thiss!1427) #b00000000000011111111111111111111) (= (mask!30183 thiss!1427) #b00000000000111111111111111111111) (= (mask!30183 thiss!1427) #b00000000001111111111111111111111) (= (mask!30183 thiss!1427) #b00000000011111111111111111111111) (= (mask!30183 thiss!1427) #b00000000111111111111111111111111) (= (mask!30183 thiss!1427) #b00000001111111111111111111111111) (= (mask!30183 thiss!1427) #b00000011111111111111111111111111) (= (mask!30183 thiss!1427) #b00000111111111111111111111111111) (= (mask!30183 thiss!1427) #b00001111111111111111111111111111) (= (mask!30183 thiss!1427) #b00011111111111111111111111111111) (= (mask!30183 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30183 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!125187 d!125195))

(declare-fun b!1037122 () Bool)

(declare-fun e!586604 () Bool)

(declare-fun call!43908 () Bool)

(assert (=> b!1037122 (= e!586604 call!43908)))

(declare-fun bm!43905 () Bool)

(assert (=> bm!43905 (= call!43908 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11468 thiss!1427) (mask!30183 thiss!1427)))))

(declare-fun b!1037123 () Bool)

(declare-fun e!586605 () Bool)

(assert (=> b!1037123 (= e!586605 e!586604)))

(declare-fun c!105078 () Bool)

(assert (=> b!1037123 (= c!105078 (validKeyInArray!0 (select (arr!31437 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037124 () Bool)

(declare-fun e!586603 () Bool)

(assert (=> b!1037124 (= e!586604 e!586603)))

(declare-fun lt!457407 () (_ BitVec 64))

(assert (=> b!1037124 (= lt!457407 (select (arr!31437 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33943 0))(
  ( (Unit!33944) )
))
(declare-fun lt!457406 () Unit!33943)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65306 (_ BitVec 64) (_ BitVec 32)) Unit!33943)

(assert (=> b!1037124 (= lt!457406 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11468 thiss!1427) lt!457407 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65306 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1037124 (arrayContainsKey!0 (_keys!11468 thiss!1427) lt!457407 #b00000000000000000000000000000000)))

(declare-fun lt!457408 () Unit!33943)

(assert (=> b!1037124 (= lt!457408 lt!457406)))

(declare-fun res!692054 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65306 (_ BitVec 32)) SeekEntryResult!9748)

(assert (=> b!1037124 (= res!692054 (= (seekEntryOrOpen!0 (select (arr!31437 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000) (_keys!11468 thiss!1427) (mask!30183 thiss!1427)) (Found!9748 #b00000000000000000000000000000000)))))

(assert (=> b!1037124 (=> (not res!692054) (not e!586603))))

(declare-fun d!125197 () Bool)

(declare-fun res!692055 () Bool)

(assert (=> d!125197 (=> res!692055 e!586605)))

(assert (=> d!125197 (= res!692055 (bvsge #b00000000000000000000000000000000 (size!31966 (_keys!11468 thiss!1427))))))

(assert (=> d!125197 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11468 thiss!1427) (mask!30183 thiss!1427)) e!586605)))

(declare-fun b!1037121 () Bool)

(assert (=> b!1037121 (= e!586603 call!43908)))

(assert (= (and d!125197 (not res!692055)) b!1037123))

(assert (= (and b!1037123 c!105078) b!1037124))

(assert (= (and b!1037123 (not c!105078)) b!1037122))

(assert (= (and b!1037124 res!692054) b!1037121))

(assert (= (or b!1037121 b!1037122) bm!43905))

(declare-fun m!957429 () Bool)

(assert (=> bm!43905 m!957429))

(assert (=> b!1037123 m!957417))

(assert (=> b!1037123 m!957417))

(assert (=> b!1037123 m!957419))

(assert (=> b!1037124 m!957417))

(declare-fun m!957431 () Bool)

(assert (=> b!1037124 m!957431))

(declare-fun m!957433 () Bool)

(assert (=> b!1037124 m!957433))

(assert (=> b!1037124 m!957417))

(declare-fun m!957435 () Bool)

(assert (=> b!1037124 m!957435))

(assert (=> b!1037046 d!125197))

(declare-fun d!125199 () Bool)

(declare-fun lt!457413 () SeekEntryResult!9748)

(assert (=> d!125199 (and (or ((_ is Undefined!9748) lt!457413) (not ((_ is Found!9748) lt!457413)) (and (bvsge (index!41364 lt!457413) #b00000000000000000000000000000000) (bvslt (index!41364 lt!457413) (size!31966 (_keys!11468 thiss!1427))))) (or ((_ is Undefined!9748) lt!457413) ((_ is Found!9748) lt!457413) (not ((_ is MissingVacant!9748) lt!457413)) (not (= (index!41366 lt!457413) (index!41365 lt!457384))) (and (bvsge (index!41366 lt!457413) #b00000000000000000000000000000000) (bvslt (index!41366 lt!457413) (size!31966 (_keys!11468 thiss!1427))))) (or ((_ is Undefined!9748) lt!457413) (ite ((_ is Found!9748) lt!457413) (= (select (arr!31437 (_keys!11468 thiss!1427)) (index!41364 lt!457413)) key!909) (and ((_ is MissingVacant!9748) lt!457413) (= (index!41366 lt!457413) (index!41365 lt!457384)) (= (select (arr!31437 (_keys!11468 thiss!1427)) (index!41366 lt!457413)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!586614 () SeekEntryResult!9748)

(assert (=> d!125199 (= lt!457413 e!586614)))

(declare-fun c!105085 () Bool)

(assert (=> d!125199 (= c!105085 (bvsge (x!92490 lt!457384) #b01111111111111111111111111111110))))

(declare-fun lt!457414 () (_ BitVec 64))

(assert (=> d!125199 (= lt!457414 (select (arr!31437 (_keys!11468 thiss!1427)) (index!41365 lt!457384)))))

(assert (=> d!125199 (validMask!0 (mask!30183 thiss!1427))))

(assert (=> d!125199 (= (seekKeyOrZeroReturnVacant!0 (x!92490 lt!457384) (index!41365 lt!457384) (index!41365 lt!457384) key!909 (_keys!11468 thiss!1427) (mask!30183 thiss!1427)) lt!457413)))

(declare-fun b!1037137 () Bool)

(declare-fun e!586613 () SeekEntryResult!9748)

(assert (=> b!1037137 (= e!586613 (Found!9748 (index!41365 lt!457384)))))

(declare-fun b!1037138 () Bool)

(assert (=> b!1037138 (= e!586614 Undefined!9748)))

(declare-fun b!1037139 () Bool)

(declare-fun e!586612 () SeekEntryResult!9748)

(assert (=> b!1037139 (= e!586612 (MissingVacant!9748 (index!41365 lt!457384)))))

(declare-fun b!1037140 () Bool)

(assert (=> b!1037140 (= e!586614 e!586613)))

(declare-fun c!105087 () Bool)

(assert (=> b!1037140 (= c!105087 (= lt!457414 key!909))))

(declare-fun b!1037141 () Bool)

(declare-fun c!105086 () Bool)

(assert (=> b!1037141 (= c!105086 (= lt!457414 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037141 (= e!586613 e!586612)))

(declare-fun b!1037142 () Bool)

(assert (=> b!1037142 (= e!586612 (seekKeyOrZeroReturnVacant!0 (bvadd (x!92490 lt!457384) #b00000000000000000000000000000001) (nextIndex!0 (index!41365 lt!457384) (x!92490 lt!457384) (mask!30183 thiss!1427)) (index!41365 lt!457384) key!909 (_keys!11468 thiss!1427) (mask!30183 thiss!1427)))))

(assert (= (and d!125199 c!105085) b!1037138))

(assert (= (and d!125199 (not c!105085)) b!1037140))

(assert (= (and b!1037140 c!105087) b!1037137))

(assert (= (and b!1037140 (not c!105087)) b!1037141))

(assert (= (and b!1037141 c!105086) b!1037139))

(assert (= (and b!1037141 (not c!105086)) b!1037142))

(declare-fun m!957437 () Bool)

(assert (=> d!125199 m!957437))

(declare-fun m!957439 () Bool)

(assert (=> d!125199 m!957439))

(assert (=> d!125199 m!957411))

(assert (=> d!125199 m!957407))

(declare-fun m!957441 () Bool)

(assert (=> b!1037142 m!957441))

(assert (=> b!1037142 m!957441))

(declare-fun m!957443 () Bool)

(assert (=> b!1037142 m!957443))

(assert (=> b!1037060 d!125199))

(declare-fun bm!43908 () Bool)

(declare-fun call!43911 () Bool)

(declare-fun c!105090 () Bool)

(assert (=> bm!43908 (= call!43911 (arrayNoDuplicates!0 (_keys!11468 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105090 (Cons!21917 (select (arr!31437 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000) Nil!21918) Nil!21918)))))

(declare-fun b!1037153 () Bool)

(declare-fun e!586623 () Bool)

(assert (=> b!1037153 (= e!586623 call!43911)))

(declare-fun b!1037154 () Bool)

(declare-fun e!586626 () Bool)

(assert (=> b!1037154 (= e!586626 e!586623)))

(assert (=> b!1037154 (= c!105090 (validKeyInArray!0 (select (arr!31437 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125201 () Bool)

(declare-fun res!692062 () Bool)

(declare-fun e!586624 () Bool)

(assert (=> d!125201 (=> res!692062 e!586624)))

(assert (=> d!125201 (= res!692062 (bvsge #b00000000000000000000000000000000 (size!31966 (_keys!11468 thiss!1427))))))

(assert (=> d!125201 (= (arrayNoDuplicates!0 (_keys!11468 thiss!1427) #b00000000000000000000000000000000 Nil!21918) e!586624)))

(declare-fun b!1037155 () Bool)

(assert (=> b!1037155 (= e!586624 e!586626)))

(declare-fun res!692063 () Bool)

(assert (=> b!1037155 (=> (not res!692063) (not e!586626))))

(declare-fun e!586625 () Bool)

(assert (=> b!1037155 (= res!692063 (not e!586625))))

(declare-fun res!692064 () Bool)

(assert (=> b!1037155 (=> (not res!692064) (not e!586625))))

(assert (=> b!1037155 (= res!692064 (validKeyInArray!0 (select (arr!31437 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037156 () Bool)

(declare-fun contains!6024 (List!21921 (_ BitVec 64)) Bool)

(assert (=> b!1037156 (= e!586625 (contains!6024 Nil!21918 (select (arr!31437 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037157 () Bool)

(assert (=> b!1037157 (= e!586623 call!43911)))

(assert (= (and d!125201 (not res!692062)) b!1037155))

(assert (= (and b!1037155 res!692064) b!1037156))

(assert (= (and b!1037155 res!692063) b!1037154))

(assert (= (and b!1037154 c!105090) b!1037153))

(assert (= (and b!1037154 (not c!105090)) b!1037157))

(assert (= (or b!1037153 b!1037157) bm!43908))

(assert (=> bm!43908 m!957417))

(declare-fun m!957445 () Bool)

(assert (=> bm!43908 m!957445))

(assert (=> b!1037154 m!957417))

(assert (=> b!1037154 m!957417))

(assert (=> b!1037154 m!957419))

(assert (=> b!1037155 m!957417))

(assert (=> b!1037155 m!957417))

(assert (=> b!1037155 m!957419))

(assert (=> b!1037156 m!957417))

(assert (=> b!1037156 m!957417))

(declare-fun m!957447 () Bool)

(assert (=> b!1037156 m!957447))

(assert (=> b!1037047 d!125201))

(declare-fun d!125203 () Bool)

(declare-fun res!692074 () Bool)

(declare-fun e!586629 () Bool)

(assert (=> d!125203 (=> (not res!692074) (not e!586629))))

(assert (=> d!125203 (= res!692074 (validMask!0 (mask!30183 thiss!1427)))))

(assert (=> d!125203 (= (simpleValid!415 thiss!1427) e!586629)))

(declare-fun b!1037166 () Bool)

(declare-fun res!692073 () Bool)

(assert (=> b!1037166 (=> (not res!692073) (not e!586629))))

(assert (=> b!1037166 (= res!692073 (and (= (size!31967 (_values!6300 thiss!1427)) (bvadd (mask!30183 thiss!1427) #b00000000000000000000000000000001)) (= (size!31966 (_keys!11468 thiss!1427)) (size!31967 (_values!6300 thiss!1427))) (bvsge (_size!2950 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2950 thiss!1427) (bvadd (mask!30183 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1037168 () Bool)

(declare-fun res!692075 () Bool)

(assert (=> b!1037168 (=> (not res!692075) (not e!586629))))

(declare-fun size!31970 (LongMapFixedSize!5790) (_ BitVec 32))

(assert (=> b!1037168 (= res!692075 (= (size!31970 thiss!1427) (bvadd (_size!2950 thiss!1427) (bvsdiv (bvadd (extraKeys!6005 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1037167 () Bool)

(declare-fun res!692076 () Bool)

(assert (=> b!1037167 (=> (not res!692076) (not e!586629))))

(assert (=> b!1037167 (= res!692076 (bvsge (size!31970 thiss!1427) (_size!2950 thiss!1427)))))

(declare-fun b!1037169 () Bool)

(assert (=> b!1037169 (= e!586629 (and (bvsge (extraKeys!6005 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6005 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2950 thiss!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!125203 res!692074) b!1037166))

(assert (= (and b!1037166 res!692073) b!1037167))

(assert (= (and b!1037167 res!692076) b!1037168))

(assert (= (and b!1037168 res!692075) b!1037169))

(assert (=> d!125203 m!957407))

(declare-fun m!957449 () Bool)

(assert (=> b!1037168 m!957449))

(assert (=> b!1037167 m!957449))

(assert (=> d!125181 d!125203))

(declare-fun mapIsEmpty!38433 () Bool)

(declare-fun mapRes!38433 () Bool)

(assert (=> mapIsEmpty!38433 mapRes!38433))

(declare-fun b!1037170 () Bool)

(declare-fun e!586631 () Bool)

(assert (=> b!1037170 (= e!586631 tp_is_empty!24603)))

(declare-fun condMapEmpty!38433 () Bool)

(declare-fun mapDefault!38433 () ValueCell!11598)

(assert (=> mapNonEmpty!38432 (= condMapEmpty!38433 (= mapRest!38432 ((as const (Array (_ BitVec 32) ValueCell!11598)) mapDefault!38433)))))

(declare-fun e!586630 () Bool)

(assert (=> mapNonEmpty!38432 (= tp!73797 (and e!586630 mapRes!38433))))

(declare-fun b!1037171 () Bool)

(assert (=> b!1037171 (= e!586630 tp_is_empty!24603)))

(declare-fun mapNonEmpty!38433 () Bool)

(declare-fun tp!73798 () Bool)

(assert (=> mapNonEmpty!38433 (= mapRes!38433 (and tp!73798 e!586631))))

(declare-fun mapValue!38433 () ValueCell!11598)

(declare-fun mapRest!38433 () (Array (_ BitVec 32) ValueCell!11598))

(declare-fun mapKey!38433 () (_ BitVec 32))

(assert (=> mapNonEmpty!38433 (= mapRest!38432 (store mapRest!38433 mapKey!38433 mapValue!38433))))

(assert (= (and mapNonEmpty!38432 condMapEmpty!38433) mapIsEmpty!38433))

(assert (= (and mapNonEmpty!38432 (not condMapEmpty!38433)) mapNonEmpty!38433))

(assert (= (and mapNonEmpty!38433 ((_ is ValueCellFull!11598) mapValue!38433)) b!1037170))

(assert (= (and mapNonEmpty!38432 ((_ is ValueCellFull!11598) mapDefault!38433)) b!1037171))

(declare-fun m!957451 () Bool)

(assert (=> mapNonEmpty!38433 m!957451))

(check-sat (not b!1037123) (not d!125191) b_and!33415 (not d!125203) (not bm!43908) (not bm!43905) (not b!1037108) (not b!1037124) (not b_next!20883) (not d!125199) tp_is_empty!24603 (not mapNonEmpty!38433) (not b!1037156) (not b!1037084) (not b!1037168) (not b!1037142) (not bm!43902) (not b!1037154) (not b!1037155) (not b!1037167))
(check-sat b_and!33415 (not b_next!20883))
