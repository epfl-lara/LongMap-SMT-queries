; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90298 () Bool)

(assert start!90298)

(declare-fun b!1033421 () Bool)

(declare-fun b_free!20797 () Bool)

(declare-fun b_next!20797 () Bool)

(assert (=> b!1033421 (= b_free!20797 (not b_next!20797))))

(declare-fun tp!73491 () Bool)

(declare-fun b_and!33239 () Bool)

(assert (=> b!1033421 (= tp!73491 b_and!33239)))

(declare-fun b!1033419 () Bool)

(declare-fun e!584132 () Bool)

(declare-fun e!584131 () Bool)

(declare-fun mapRes!38258 () Bool)

(assert (=> b!1033419 (= e!584132 (and e!584131 mapRes!38258))))

(declare-fun condMapEmpty!38258 () Bool)

(declare-datatypes ((V!37563 0))(
  ( (V!37564 (val!12309 Int)) )
))
(declare-datatypes ((ValueCell!11555 0))(
  ( (ValueCellFull!11555 (v!14885 V!37563)) (EmptyCell!11555) )
))
(declare-datatypes ((array!65053 0))(
  ( (array!65054 (arr!31320 (Array (_ BitVec 32) (_ BitVec 64))) (size!31844 (_ BitVec 32))) )
))
(declare-datatypes ((array!65055 0))(
  ( (array!65056 (arr!31321 (Array (_ BitVec 32) ValueCell!11555)) (size!31845 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5704 0))(
  ( (LongMapFixedSize!5705 (defaultEntry!6226 Int) (mask!30078 (_ BitVec 32)) (extraKeys!5958 (_ BitVec 32)) (zeroValue!6062 V!37563) (minValue!6062 V!37563) (_size!2907 (_ BitVec 32)) (_keys!11402 array!65053) (_values!6249 array!65055) (_vacant!2907 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5704)

(declare-fun mapDefault!38258 () ValueCell!11555)

(assert (=> b!1033419 (= condMapEmpty!38258 (= (arr!31321 (_values!6249 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11555)) mapDefault!38258)))))

(declare-fun b!1033420 () Bool)

(declare-fun e!584129 () Bool)

(declare-fun tp_is_empty!24517 () Bool)

(assert (=> b!1033420 (= e!584129 tp_is_empty!24517)))

(declare-fun mapNonEmpty!38258 () Bool)

(declare-fun tp!73490 () Bool)

(assert (=> mapNonEmpty!38258 (= mapRes!38258 (and tp!73490 e!584129))))

(declare-fun mapKey!38258 () (_ BitVec 32))

(declare-fun mapRest!38258 () (Array (_ BitVec 32) ValueCell!11555))

(declare-fun mapValue!38258 () ValueCell!11555)

(assert (=> mapNonEmpty!38258 (= (arr!31321 (_values!6249 thiss!1427)) (store mapRest!38258 mapKey!38258 mapValue!38258))))

(declare-fun res!690510 () Bool)

(declare-fun e!584133 () Bool)

(assert (=> start!90298 (=> (not res!690510) (not e!584133))))

(declare-fun valid!2144 (LongMapFixedSize!5704) Bool)

(assert (=> start!90298 (= res!690510 (valid!2144 thiss!1427))))

(assert (=> start!90298 e!584133))

(declare-fun e!584128 () Bool)

(assert (=> start!90298 e!584128))

(assert (=> start!90298 true))

(declare-fun array_inv!24231 (array!65053) Bool)

(declare-fun array_inv!24232 (array!65055) Bool)

(assert (=> b!1033421 (= e!584128 (and tp!73491 tp_is_empty!24517 (array_inv!24231 (_keys!11402 thiss!1427)) (array_inv!24232 (_values!6249 thiss!1427)) e!584132))))

(declare-fun e!584127 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun lt!455914 () LongMapFixedSize!5704)

(declare-fun b!1033422 () Bool)

(declare-datatypes ((tuple2!15806 0))(
  ( (tuple2!15807 (_1!7914 (_ BitVec 64)) (_2!7914 V!37563)) )
))
(declare-datatypes ((List!21939 0))(
  ( (Nil!21936) (Cons!21935 (h!23137 tuple2!15806) (t!31126 List!21939)) )
))
(declare-datatypes ((ListLongMap!13829 0))(
  ( (ListLongMap!13830 (toList!6930 List!21939)) )
))
(declare-fun map!14687 (LongMapFixedSize!5704) ListLongMap!13829)

(declare-fun -!522 (ListLongMap!13829 (_ BitVec 64)) ListLongMap!13829)

(assert (=> b!1033422 (= e!584127 (= (map!14687 lt!455914) (-!522 (map!14687 thiss!1427) key!909)))))

(declare-fun mapIsEmpty!38258 () Bool)

(assert (=> mapIsEmpty!38258 mapRes!38258))

(declare-fun b!1033423 () Bool)

(assert (=> b!1033423 (= e!584133 (not e!584127))))

(declare-fun res!690511 () Bool)

(assert (=> b!1033423 (=> (not res!690511) (not e!584127))))

(assert (=> b!1033423 (= res!690511 (valid!2144 lt!455914))))

(declare-fun lt!455915 () V!37563)

(assert (=> b!1033423 (= lt!455914 (LongMapFixedSize!5705 (defaultEntry!6226 thiss!1427) (mask!30078 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!455915 (minValue!6062 thiss!1427) (_size!2907 thiss!1427) (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (_vacant!2907 thiss!1427)))))

(declare-fun getCurrentListMap!3897 (array!65053 array!65055 (_ BitVec 32) (_ BitVec 32) V!37563 V!37563 (_ BitVec 32) Int) ListLongMap!13829)

(assert (=> b!1033423 (= (-!522 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!455915 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-datatypes ((Unit!33713 0))(
  ( (Unit!33714) )
))
(declare-fun lt!455916 () Unit!33713)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!11 (array!65053 array!65055 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!37563 V!37563 V!37563 Int) Unit!33713)

(assert (=> b!1033423 (= lt!455916 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!11 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) (zeroValue!6062 thiss!1427) lt!455915 (minValue!6062 thiss!1427) (defaultEntry!6226 thiss!1427)))))

(declare-fun dynLambda!1984 (Int (_ BitVec 64)) V!37563)

(assert (=> b!1033423 (= lt!455915 (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033424 () Bool)

(declare-fun res!690509 () Bool)

(assert (=> b!1033424 (=> (not res!690509) (not e!584133))))

(assert (=> b!1033424 (= res!690509 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1033425 () Bool)

(assert (=> b!1033425 (= e!584131 tp_is_empty!24517)))

(assert (= (and start!90298 res!690510) b!1033424))

(assert (= (and b!1033424 res!690509) b!1033423))

(assert (= (and b!1033423 res!690511) b!1033422))

(assert (= (and b!1033419 condMapEmpty!38258) mapIsEmpty!38258))

(assert (= (and b!1033419 (not condMapEmpty!38258)) mapNonEmpty!38258))

(get-info :version)

(assert (= (and mapNonEmpty!38258 ((_ is ValueCellFull!11555) mapValue!38258)) b!1033420))

(assert (= (and b!1033419 ((_ is ValueCellFull!11555) mapDefault!38258)) b!1033425))

(assert (= b!1033421 b!1033419))

(assert (= start!90298 b!1033421))

(declare-fun b_lambda!16023 () Bool)

(assert (=> (not b_lambda!16023) (not b!1033423)))

(declare-fun t!31125 () Bool)

(declare-fun tb!7011 () Bool)

(assert (=> (and b!1033421 (= (defaultEntry!6226 thiss!1427) (defaultEntry!6226 thiss!1427)) t!31125) tb!7011))

(declare-fun result!14375 () Bool)

(assert (=> tb!7011 (= result!14375 tp_is_empty!24517)))

(assert (=> b!1033423 t!31125))

(declare-fun b_and!33241 () Bool)

(assert (= b_and!33239 (and (=> t!31125 result!14375) b_and!33241)))

(declare-fun m!952647 () Bool)

(assert (=> b!1033422 m!952647))

(declare-fun m!952649 () Bool)

(assert (=> b!1033422 m!952649))

(assert (=> b!1033422 m!952649))

(declare-fun m!952651 () Bool)

(assert (=> b!1033422 m!952651))

(declare-fun m!952653 () Bool)

(assert (=> b!1033423 m!952653))

(declare-fun m!952655 () Bool)

(assert (=> b!1033423 m!952655))

(declare-fun m!952657 () Bool)

(assert (=> b!1033423 m!952657))

(declare-fun m!952659 () Bool)

(assert (=> b!1033423 m!952659))

(declare-fun m!952661 () Bool)

(assert (=> b!1033423 m!952661))

(declare-fun m!952663 () Bool)

(assert (=> b!1033423 m!952663))

(assert (=> b!1033423 m!952661))

(declare-fun m!952665 () Bool)

(assert (=> b!1033421 m!952665))

(declare-fun m!952667 () Bool)

(assert (=> b!1033421 m!952667))

(declare-fun m!952669 () Bool)

(assert (=> mapNonEmpty!38258 m!952669))

(declare-fun m!952671 () Bool)

(assert (=> start!90298 m!952671))

(check-sat (not b_next!20797) (not b!1033423) (not b_lambda!16023) (not b!1033422) b_and!33241 (not start!90298) (not mapNonEmpty!38258) (not b!1033421) tp_is_empty!24517)
(check-sat b_and!33241 (not b_next!20797))
(get-model)

(declare-fun b_lambda!16029 () Bool)

(assert (= b_lambda!16023 (or (and b!1033421 b_free!20797) b_lambda!16029)))

(check-sat (not b_next!20797) (not b_lambda!16029) (not b!1033423) (not b!1033422) b_and!33241 (not start!90298) (not mapNonEmpty!38258) (not b!1033421) tp_is_empty!24517)
(check-sat b_and!33241 (not b_next!20797))
(get-model)

(declare-fun d!123655 () Bool)

(assert (=> d!123655 (= (map!14687 lt!455914) (getCurrentListMap!3897 (_keys!11402 lt!455914) (_values!6249 lt!455914) (mask!30078 lt!455914) (extraKeys!5958 lt!455914) (zeroValue!6062 lt!455914) (minValue!6062 lt!455914) #b00000000000000000000000000000000 (defaultEntry!6226 lt!455914)))))

(declare-fun bs!30182 () Bool)

(assert (= bs!30182 d!123655))

(declare-fun m!952725 () Bool)

(assert (=> bs!30182 m!952725))

(assert (=> b!1033422 d!123655))

(declare-fun d!123657 () Bool)

(declare-fun lt!455937 () ListLongMap!13829)

(declare-fun contains!5992 (ListLongMap!13829 (_ BitVec 64)) Bool)

(assert (=> d!123657 (not (contains!5992 lt!455937 key!909))))

(declare-fun removeStrictlySorted!56 (List!21939 (_ BitVec 64)) List!21939)

(assert (=> d!123657 (= lt!455937 (ListLongMap!13830 (removeStrictlySorted!56 (toList!6930 (map!14687 thiss!1427)) key!909)))))

(assert (=> d!123657 (= (-!522 (map!14687 thiss!1427) key!909) lt!455937)))

(declare-fun bs!30183 () Bool)

(assert (= bs!30183 d!123657))

(declare-fun m!952727 () Bool)

(assert (=> bs!30183 m!952727))

(declare-fun m!952729 () Bool)

(assert (=> bs!30183 m!952729))

(assert (=> b!1033422 d!123657))

(declare-fun d!123659 () Bool)

(assert (=> d!123659 (= (map!14687 thiss!1427) (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun bs!30184 () Bool)

(assert (= bs!30184 d!123659))

(assert (=> bs!30184 m!952661))

(assert (=> b!1033422 d!123659))

(declare-fun d!123661 () Bool)

(assert (=> d!123661 (= (array_inv!24231 (_keys!11402 thiss!1427)) (bvsge (size!31844 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033421 d!123661))

(declare-fun d!123663 () Bool)

(assert (=> d!123663 (= (array_inv!24232 (_values!6249 thiss!1427)) (bvsge (size!31845 (_values!6249 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033421 d!123663))

(declare-fun d!123665 () Bool)

(declare-fun res!690536 () Bool)

(declare-fun e!584178 () Bool)

(assert (=> d!123665 (=> (not res!690536) (not e!584178))))

(declare-fun simpleValid!405 (LongMapFixedSize!5704) Bool)

(assert (=> d!123665 (= res!690536 (simpleValid!405 thiss!1427))))

(assert (=> d!123665 (= (valid!2144 thiss!1427) e!584178)))

(declare-fun b!1033480 () Bool)

(declare-fun res!690537 () Bool)

(assert (=> b!1033480 (=> (not res!690537) (not e!584178))))

(declare-fun arrayCountValidKeys!0 (array!65053 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1033480 (= res!690537 (= (arrayCountValidKeys!0 (_keys!11402 thiss!1427) #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))) (_size!2907 thiss!1427)))))

(declare-fun b!1033481 () Bool)

(declare-fun res!690538 () Bool)

(assert (=> b!1033481 (=> (not res!690538) (not e!584178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65053 (_ BitVec 32)) Bool)

(assert (=> b!1033481 (= res!690538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11402 thiss!1427) (mask!30078 thiss!1427)))))

(declare-fun b!1033482 () Bool)

(declare-datatypes ((List!21941 0))(
  ( (Nil!21938) (Cons!21937 (h!23139 (_ BitVec 64)) (t!31132 List!21941)) )
))
(declare-fun arrayNoDuplicates!0 (array!65053 (_ BitVec 32) List!21941) Bool)

(assert (=> b!1033482 (= e!584178 (arrayNoDuplicates!0 (_keys!11402 thiss!1427) #b00000000000000000000000000000000 Nil!21938))))

(assert (= (and d!123665 res!690536) b!1033480))

(assert (= (and b!1033480 res!690537) b!1033481))

(assert (= (and b!1033481 res!690538) b!1033482))

(declare-fun m!952731 () Bool)

(assert (=> d!123665 m!952731))

(declare-fun m!952733 () Bool)

(assert (=> b!1033480 m!952733))

(declare-fun m!952735 () Bool)

(assert (=> b!1033481 m!952735))

(declare-fun m!952737 () Bool)

(assert (=> b!1033482 m!952737))

(assert (=> start!90298 d!123665))

(declare-fun bm!43633 () Bool)

(declare-fun call!43637 () Bool)

(declare-fun lt!456003 () ListLongMap!13829)

(assert (=> bm!43633 (= call!43637 (contains!5992 lt!456003 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!123667 () Bool)

(declare-fun e!584211 () Bool)

(assert (=> d!123667 e!584211))

(declare-fun res!690557 () Bool)

(assert (=> d!123667 (=> (not res!690557) (not e!584211))))

(assert (=> d!123667 (= res!690557 (or (bvsge #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))))

(declare-fun lt!455997 () ListLongMap!13829)

(assert (=> d!123667 (= lt!456003 lt!455997)))

(declare-fun lt!455988 () Unit!33713)

(declare-fun e!584216 () Unit!33713)

(assert (=> d!123667 (= lt!455988 e!584216)))

(declare-fun c!104345 () Bool)

(declare-fun e!584210 () Bool)

(assert (=> d!123667 (= c!104345 e!584210)))

(declare-fun res!690564 () Bool)

(assert (=> d!123667 (=> (not res!690564) (not e!584210))))

(assert (=> d!123667 (= res!690564 (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun e!584207 () ListLongMap!13829)

(assert (=> d!123667 (= lt!455997 e!584207)))

(declare-fun c!104347 () Bool)

(assert (=> d!123667 (= c!104347 (and (not (= (bvand (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!123667 (validMask!0 (mask!30078 thiss!1427))))

(assert (=> d!123667 (= (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!455915 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)) lt!456003)))

(declare-fun b!1033525 () Bool)

(declare-fun e!584213 () Bool)

(declare-fun apply!899 (ListLongMap!13829 (_ BitVec 64)) V!37563)

(assert (=> b!1033525 (= e!584213 (= (apply!899 lt!456003 #b0000000000000000000000000000000000000000000000000000000000000000) lt!455915))))

(declare-fun b!1033526 () Bool)

(declare-fun Unit!33715 () Unit!33713)

(assert (=> b!1033526 (= e!584216 Unit!33715)))

(declare-fun call!43636 () ListLongMap!13829)

(declare-fun c!104348 () Bool)

(declare-fun call!43642 () ListLongMap!13829)

(declare-fun call!43639 () ListLongMap!13829)

(declare-fun bm!43634 () Bool)

(declare-fun call!43638 () ListLongMap!13829)

(declare-fun +!3130 (ListLongMap!13829 tuple2!15806) ListLongMap!13829)

(assert (=> bm!43634 (= call!43638 (+!3130 (ite c!104347 call!43636 (ite c!104348 call!43642 call!43639)) (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1033527 () Bool)

(declare-fun e!584208 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1033527 (= e!584208 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033528 () Bool)

(declare-fun lt!455990 () Unit!33713)

(assert (=> b!1033528 (= e!584216 lt!455990)))

(declare-fun lt!455986 () ListLongMap!13829)

(declare-fun getCurrentListMapNoExtraKeys!3565 (array!65053 array!65055 (_ BitVec 32) (_ BitVec 32) V!37563 V!37563 (_ BitVec 32) Int) ListLongMap!13829)

(assert (=> b!1033528 (= lt!455986 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!455915 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun lt!456000 () (_ BitVec 64))

(assert (=> b!1033528 (= lt!456000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!455982 () (_ BitVec 64))

(assert (=> b!1033528 (= lt!455982 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!455995 () Unit!33713)

(declare-fun addStillContains!618 (ListLongMap!13829 (_ BitVec 64) V!37563 (_ BitVec 64)) Unit!33713)

(assert (=> b!1033528 (= lt!455995 (addStillContains!618 lt!455986 lt!456000 lt!455915 lt!455982))))

(assert (=> b!1033528 (contains!5992 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915)) lt!455982)))

(declare-fun lt!455998 () Unit!33713)

(assert (=> b!1033528 (= lt!455998 lt!455995)))

(declare-fun lt!456002 () ListLongMap!13829)

(assert (=> b!1033528 (= lt!456002 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!455915 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun lt!456001 () (_ BitVec 64))

(assert (=> b!1033528 (= lt!456001 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!455993 () (_ BitVec 64))

(assert (=> b!1033528 (= lt!455993 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!455984 () Unit!33713)

(declare-fun addApplyDifferent!474 (ListLongMap!13829 (_ BitVec 64) V!37563 (_ BitVec 64)) Unit!33713)

(assert (=> b!1033528 (= lt!455984 (addApplyDifferent!474 lt!456002 lt!456001 (minValue!6062 thiss!1427) lt!455993))))

(assert (=> b!1033528 (= (apply!899 (+!3130 lt!456002 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))) lt!455993) (apply!899 lt!456002 lt!455993))))

(declare-fun lt!455985 () Unit!33713)

(assert (=> b!1033528 (= lt!455985 lt!455984)))

(declare-fun lt!455996 () ListLongMap!13829)

(assert (=> b!1033528 (= lt!455996 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!455915 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun lt!455991 () (_ BitVec 64))

(assert (=> b!1033528 (= lt!455991 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!455994 () (_ BitVec 64))

(assert (=> b!1033528 (= lt!455994 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!455999 () Unit!33713)

(assert (=> b!1033528 (= lt!455999 (addApplyDifferent!474 lt!455996 lt!455991 lt!455915 lt!455994))))

(assert (=> b!1033528 (= (apply!899 (+!3130 lt!455996 (tuple2!15807 lt!455991 lt!455915)) lt!455994) (apply!899 lt!455996 lt!455994))))

(declare-fun lt!455992 () Unit!33713)

(assert (=> b!1033528 (= lt!455992 lt!455999)))

(declare-fun lt!455983 () ListLongMap!13829)

(assert (=> b!1033528 (= lt!455983 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!455915 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun lt!455989 () (_ BitVec 64))

(assert (=> b!1033528 (= lt!455989 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!455987 () (_ BitVec 64))

(assert (=> b!1033528 (= lt!455987 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033528 (= lt!455990 (addApplyDifferent!474 lt!455983 lt!455989 (minValue!6062 thiss!1427) lt!455987))))

(assert (=> b!1033528 (= (apply!899 (+!3130 lt!455983 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))) lt!455987) (apply!899 lt!455983 lt!455987))))

(declare-fun bm!43635 () Bool)

(assert (=> bm!43635 (= call!43636 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!455915 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun b!1033529 () Bool)

(declare-fun res!690561 () Bool)

(assert (=> b!1033529 (=> (not res!690561) (not e!584211))))

(declare-fun e!584206 () Bool)

(assert (=> b!1033529 (= res!690561 e!584206)))

(declare-fun c!104349 () Bool)

(assert (=> b!1033529 (= c!104349 (not (= (bvand (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1033530 () Bool)

(declare-fun e!584217 () Bool)

(declare-fun get!16428 (ValueCell!11555 V!37563) V!37563)

(assert (=> b!1033530 (= e!584217 (= (apply!899 lt!456003 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1033530 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31845 (_values!6249 thiss!1427))))))

(assert (=> b!1033530 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun b!1033531 () Bool)

(assert (=> b!1033531 (= e!584206 e!584213)))

(declare-fun res!690562 () Bool)

(declare-fun call!43641 () Bool)

(assert (=> b!1033531 (= res!690562 call!43641)))

(assert (=> b!1033531 (=> (not res!690562) (not e!584213))))

(declare-fun b!1033532 () Bool)

(declare-fun e!584205 () ListLongMap!13829)

(declare-fun call!43640 () ListLongMap!13829)

(assert (=> b!1033532 (= e!584205 call!43640)))

(declare-fun b!1033533 () Bool)

(declare-fun e!584209 () Bool)

(assert (=> b!1033533 (= e!584209 (= (apply!899 lt!456003 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6062 thiss!1427)))))

(declare-fun b!1033534 () Bool)

(declare-fun e!584212 () ListLongMap!13829)

(assert (=> b!1033534 (= e!584212 call!43639)))

(declare-fun b!1033535 () Bool)

(assert (=> b!1033535 (= e!584207 (+!3130 call!43638 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(declare-fun b!1033536 () Bool)

(declare-fun e!584214 () Bool)

(assert (=> b!1033536 (= e!584214 e!584217)))

(declare-fun res!690560 () Bool)

(assert (=> b!1033536 (=> (not res!690560) (not e!584217))))

(assert (=> b!1033536 (= res!690560 (contains!5992 lt!456003 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1033536 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun b!1033537 () Bool)

(assert (=> b!1033537 (= e!584210 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43636 () Bool)

(assert (=> bm!43636 (= call!43639 call!43642)))

(declare-fun bm!43637 () Bool)

(assert (=> bm!43637 (= call!43641 (contains!5992 lt!456003 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033538 () Bool)

(declare-fun res!690559 () Bool)

(assert (=> b!1033538 (=> (not res!690559) (not e!584211))))

(assert (=> b!1033538 (= res!690559 e!584214)))

(declare-fun res!690558 () Bool)

(assert (=> b!1033538 (=> res!690558 e!584214)))

(assert (=> b!1033538 (= res!690558 (not e!584208))))

(declare-fun res!690565 () Bool)

(assert (=> b!1033538 (=> (not res!690565) (not e!584208))))

(assert (=> b!1033538 (= res!690565 (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun b!1033539 () Bool)

(assert (=> b!1033539 (= e!584207 e!584205)))

(assert (=> b!1033539 (= c!104348 (and (not (= (bvand (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1033540 () Bool)

(declare-fun e!584215 () Bool)

(assert (=> b!1033540 (= e!584215 (not call!43637))))

(declare-fun b!1033541 () Bool)

(assert (=> b!1033541 (= e!584211 e!584215)))

(declare-fun c!104344 () Bool)

(assert (=> b!1033541 (= c!104344 (not (= (bvand (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43638 () Bool)

(assert (=> bm!43638 (= call!43640 call!43638)))

(declare-fun b!1033542 () Bool)

(declare-fun c!104346 () Bool)

(assert (=> b!1033542 (= c!104346 (and (not (= (bvand (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1033542 (= e!584205 e!584212)))

(declare-fun b!1033543 () Bool)

(assert (=> b!1033543 (= e!584212 call!43640)))

(declare-fun bm!43639 () Bool)

(assert (=> bm!43639 (= call!43642 call!43636)))

(declare-fun b!1033544 () Bool)

(assert (=> b!1033544 (= e!584206 (not call!43641))))

(declare-fun b!1033545 () Bool)

(assert (=> b!1033545 (= e!584215 e!584209)))

(declare-fun res!690563 () Bool)

(assert (=> b!1033545 (= res!690563 call!43637)))

(assert (=> b!1033545 (=> (not res!690563) (not e!584209))))

(assert (= (and d!123667 c!104347) b!1033535))

(assert (= (and d!123667 (not c!104347)) b!1033539))

(assert (= (and b!1033539 c!104348) b!1033532))

(assert (= (and b!1033539 (not c!104348)) b!1033542))

(assert (= (and b!1033542 c!104346) b!1033543))

(assert (= (and b!1033542 (not c!104346)) b!1033534))

(assert (= (or b!1033543 b!1033534) bm!43636))

(assert (= (or b!1033532 bm!43636) bm!43639))

(assert (= (or b!1033532 b!1033543) bm!43638))

(assert (= (or b!1033535 bm!43639) bm!43635))

(assert (= (or b!1033535 bm!43638) bm!43634))

(assert (= (and d!123667 res!690564) b!1033537))

(assert (= (and d!123667 c!104345) b!1033528))

(assert (= (and d!123667 (not c!104345)) b!1033526))

(assert (= (and d!123667 res!690557) b!1033538))

(assert (= (and b!1033538 res!690565) b!1033527))

(assert (= (and b!1033538 (not res!690558)) b!1033536))

(assert (= (and b!1033536 res!690560) b!1033530))

(assert (= (and b!1033538 res!690559) b!1033529))

(assert (= (and b!1033529 c!104349) b!1033531))

(assert (= (and b!1033529 (not c!104349)) b!1033544))

(assert (= (and b!1033531 res!690562) b!1033525))

(assert (= (or b!1033531 b!1033544) bm!43637))

(assert (= (and b!1033529 res!690561) b!1033541))

(assert (= (and b!1033541 c!104344) b!1033545))

(assert (= (and b!1033541 (not c!104344)) b!1033540))

(assert (= (and b!1033545 res!690563) b!1033533))

(assert (= (or b!1033545 b!1033540) bm!43633))

(declare-fun b_lambda!16031 () Bool)

(assert (=> (not b_lambda!16031) (not b!1033530)))

(assert (=> b!1033530 t!31125))

(declare-fun b_and!33251 () Bool)

(assert (= b_and!33241 (and (=> t!31125 result!14375) b_and!33251)))

(declare-fun m!952739 () Bool)

(assert (=> b!1033528 m!952739))

(declare-fun m!952741 () Bool)

(assert (=> b!1033528 m!952741))

(declare-fun m!952743 () Bool)

(assert (=> b!1033528 m!952743))

(assert (=> b!1033528 m!952739))

(declare-fun m!952745 () Bool)

(assert (=> b!1033528 m!952745))

(declare-fun m!952747 () Bool)

(assert (=> b!1033528 m!952747))

(declare-fun m!952749 () Bool)

(assert (=> b!1033528 m!952749))

(declare-fun m!952751 () Bool)

(assert (=> b!1033528 m!952751))

(declare-fun m!952753 () Bool)

(assert (=> b!1033528 m!952753))

(declare-fun m!952755 () Bool)

(assert (=> b!1033528 m!952755))

(assert (=> b!1033528 m!952749))

(declare-fun m!952757 () Bool)

(assert (=> b!1033528 m!952757))

(declare-fun m!952759 () Bool)

(assert (=> b!1033528 m!952759))

(declare-fun m!952761 () Bool)

(assert (=> b!1033528 m!952761))

(declare-fun m!952763 () Bool)

(assert (=> b!1033528 m!952763))

(assert (=> b!1033528 m!952753))

(declare-fun m!952765 () Bool)

(assert (=> b!1033528 m!952765))

(declare-fun m!952767 () Bool)

(assert (=> b!1033528 m!952767))

(assert (=> b!1033528 m!952759))

(declare-fun m!952769 () Bool)

(assert (=> b!1033528 m!952769))

(declare-fun m!952771 () Bool)

(assert (=> b!1033528 m!952771))

(declare-fun m!952773 () Bool)

(assert (=> b!1033525 m!952773))

(declare-fun m!952775 () Bool)

(assert (=> bm!43633 m!952775))

(assert (=> b!1033527 m!952763))

(assert (=> b!1033527 m!952763))

(declare-fun m!952777 () Bool)

(assert (=> b!1033527 m!952777))

(declare-fun m!952779 () Bool)

(assert (=> b!1033530 m!952779))

(assert (=> b!1033530 m!952779))

(assert (=> b!1033530 m!952655))

(declare-fun m!952781 () Bool)

(assert (=> b!1033530 m!952781))

(assert (=> b!1033530 m!952655))

(assert (=> b!1033530 m!952763))

(assert (=> b!1033530 m!952763))

(declare-fun m!952783 () Bool)

(assert (=> b!1033530 m!952783))

(declare-fun m!952785 () Bool)

(assert (=> b!1033533 m!952785))

(assert (=> bm!43635 m!952743))

(declare-fun m!952787 () Bool)

(assert (=> bm!43637 m!952787))

(declare-fun m!952789 () Bool)

(assert (=> b!1033535 m!952789))

(assert (=> b!1033537 m!952763))

(assert (=> b!1033537 m!952763))

(assert (=> b!1033537 m!952777))

(declare-fun m!952791 () Bool)

(assert (=> bm!43634 m!952791))

(assert (=> b!1033536 m!952763))

(assert (=> b!1033536 m!952763))

(declare-fun m!952793 () Bool)

(assert (=> b!1033536 m!952793))

(declare-fun m!952795 () Bool)

(assert (=> d!123667 m!952795))

(assert (=> b!1033423 d!123667))

(declare-fun d!123669 () Bool)

(declare-fun res!690566 () Bool)

(declare-fun e!584218 () Bool)

(assert (=> d!123669 (=> (not res!690566) (not e!584218))))

(assert (=> d!123669 (= res!690566 (simpleValid!405 lt!455914))))

(assert (=> d!123669 (= (valid!2144 lt!455914) e!584218)))

(declare-fun b!1033546 () Bool)

(declare-fun res!690567 () Bool)

(assert (=> b!1033546 (=> (not res!690567) (not e!584218))))

(assert (=> b!1033546 (= res!690567 (= (arrayCountValidKeys!0 (_keys!11402 lt!455914) #b00000000000000000000000000000000 (size!31844 (_keys!11402 lt!455914))) (_size!2907 lt!455914)))))

(declare-fun b!1033547 () Bool)

(declare-fun res!690568 () Bool)

(assert (=> b!1033547 (=> (not res!690568) (not e!584218))))

(assert (=> b!1033547 (= res!690568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11402 lt!455914) (mask!30078 lt!455914)))))

(declare-fun b!1033548 () Bool)

(assert (=> b!1033548 (= e!584218 (arrayNoDuplicates!0 (_keys!11402 lt!455914) #b00000000000000000000000000000000 Nil!21938))))

(assert (= (and d!123669 res!690566) b!1033546))

(assert (= (and b!1033546 res!690567) b!1033547))

(assert (= (and b!1033547 res!690568) b!1033548))

(declare-fun m!952797 () Bool)

(assert (=> d!123669 m!952797))

(declare-fun m!952799 () Bool)

(assert (=> b!1033546 m!952799))

(declare-fun m!952801 () Bool)

(assert (=> b!1033547 m!952801))

(declare-fun m!952803 () Bool)

(assert (=> b!1033548 m!952803))

(assert (=> b!1033423 d!123669))

(declare-fun d!123671 () Bool)

(assert (=> d!123671 (= (-!522 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!455915 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun lt!456006 () Unit!33713)

(declare-fun choose!1703 (array!65053 array!65055 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!37563 V!37563 V!37563 Int) Unit!33713)

(assert (=> d!123671 (= lt!456006 (choose!1703 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) (zeroValue!6062 thiss!1427) lt!455915 (minValue!6062 thiss!1427) (defaultEntry!6226 thiss!1427)))))

(assert (=> d!123671 (validMask!0 (mask!30078 thiss!1427))))

(assert (=> d!123671 (= (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!11 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) (zeroValue!6062 thiss!1427) lt!455915 (minValue!6062 thiss!1427) (defaultEntry!6226 thiss!1427)) lt!456006)))

(declare-fun bs!30185 () Bool)

(assert (= bs!30185 d!123671))

(assert (=> bs!30185 m!952657))

(assert (=> bs!30185 m!952795))

(declare-fun m!952805 () Bool)

(assert (=> bs!30185 m!952805))

(assert (=> bs!30185 m!952661))

(assert (=> bs!30185 m!952663))

(assert (=> bs!30185 m!952661))

(assert (=> b!1033423 d!123671))

(declare-fun d!123673 () Bool)

(declare-fun lt!456007 () ListLongMap!13829)

(assert (=> d!123673 (not (contains!5992 lt!456007 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123673 (= lt!456007 (ListLongMap!13830 (removeStrictlySorted!56 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123673 (= (-!522 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!456007)))

(declare-fun bs!30186 () Bool)

(assert (= bs!30186 d!123673))

(declare-fun m!952807 () Bool)

(assert (=> bs!30186 m!952807))

(declare-fun m!952809 () Bool)

(assert (=> bs!30186 m!952809))

(assert (=> b!1033423 d!123673))

(declare-fun bm!43640 () Bool)

(declare-fun call!43644 () Bool)

(declare-fun lt!456029 () ListLongMap!13829)

(assert (=> bm!43640 (= call!43644 (contains!5992 lt!456029 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!123675 () Bool)

(declare-fun e!584225 () Bool)

(assert (=> d!123675 e!584225))

(declare-fun res!690569 () Bool)

(assert (=> d!123675 (=> (not res!690569) (not e!584225))))

(assert (=> d!123675 (= res!690569 (or (bvsge #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))))

(declare-fun lt!456023 () ListLongMap!13829)

(assert (=> d!123675 (= lt!456029 lt!456023)))

(declare-fun lt!456014 () Unit!33713)

(declare-fun e!584230 () Unit!33713)

(assert (=> d!123675 (= lt!456014 e!584230)))

(declare-fun c!104351 () Bool)

(declare-fun e!584224 () Bool)

(assert (=> d!123675 (= c!104351 e!584224)))

(declare-fun res!690576 () Bool)

(assert (=> d!123675 (=> (not res!690576) (not e!584224))))

(assert (=> d!123675 (= res!690576 (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun e!584221 () ListLongMap!13829)

(assert (=> d!123675 (= lt!456023 e!584221)))

(declare-fun c!104353 () Bool)

(assert (=> d!123675 (= c!104353 (and (not (= (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123675 (validMask!0 (mask!30078 thiss!1427))))

(assert (=> d!123675 (= (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)) lt!456029)))

(declare-fun b!1033549 () Bool)

(declare-fun e!584227 () Bool)

(assert (=> b!1033549 (= e!584227 (= (apply!899 lt!456029 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6062 thiss!1427)))))

(declare-fun b!1033550 () Bool)

(declare-fun Unit!33716 () Unit!33713)

(assert (=> b!1033550 (= e!584230 Unit!33716)))

(declare-fun c!104354 () Bool)

(declare-fun call!43645 () ListLongMap!13829)

(declare-fun call!43646 () ListLongMap!13829)

(declare-fun bm!43641 () Bool)

(declare-fun call!43649 () ListLongMap!13829)

(declare-fun call!43643 () ListLongMap!13829)

(assert (=> bm!43641 (= call!43645 (+!3130 (ite c!104353 call!43643 (ite c!104354 call!43649 call!43646)) (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1033551 () Bool)

(declare-fun e!584222 () Bool)

(assert (=> b!1033551 (= e!584222 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033552 () Bool)

(declare-fun lt!456016 () Unit!33713)

(assert (=> b!1033552 (= e!584230 lt!456016)))

(declare-fun lt!456012 () ListLongMap!13829)

(assert (=> b!1033552 (= lt!456012 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun lt!456026 () (_ BitVec 64))

(assert (=> b!1033552 (= lt!456026 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456008 () (_ BitVec 64))

(assert (=> b!1033552 (= lt!456008 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456021 () Unit!33713)

(assert (=> b!1033552 (= lt!456021 (addStillContains!618 lt!456012 lt!456026 (zeroValue!6062 thiss!1427) lt!456008))))

(assert (=> b!1033552 (contains!5992 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))) lt!456008)))

(declare-fun lt!456024 () Unit!33713)

(assert (=> b!1033552 (= lt!456024 lt!456021)))

(declare-fun lt!456028 () ListLongMap!13829)

(assert (=> b!1033552 (= lt!456028 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun lt!456027 () (_ BitVec 64))

(assert (=> b!1033552 (= lt!456027 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456019 () (_ BitVec 64))

(assert (=> b!1033552 (= lt!456019 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456010 () Unit!33713)

(assert (=> b!1033552 (= lt!456010 (addApplyDifferent!474 lt!456028 lt!456027 (minValue!6062 thiss!1427) lt!456019))))

(assert (=> b!1033552 (= (apply!899 (+!3130 lt!456028 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))) lt!456019) (apply!899 lt!456028 lt!456019))))

(declare-fun lt!456011 () Unit!33713)

(assert (=> b!1033552 (= lt!456011 lt!456010)))

(declare-fun lt!456022 () ListLongMap!13829)

(assert (=> b!1033552 (= lt!456022 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun lt!456017 () (_ BitVec 64))

(assert (=> b!1033552 (= lt!456017 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456020 () (_ BitVec 64))

(assert (=> b!1033552 (= lt!456020 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456025 () Unit!33713)

(assert (=> b!1033552 (= lt!456025 (addApplyDifferent!474 lt!456022 lt!456017 (zeroValue!6062 thiss!1427) lt!456020))))

(assert (=> b!1033552 (= (apply!899 (+!3130 lt!456022 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))) lt!456020) (apply!899 lt!456022 lt!456020))))

(declare-fun lt!456018 () Unit!33713)

(assert (=> b!1033552 (= lt!456018 lt!456025)))

(declare-fun lt!456009 () ListLongMap!13829)

(assert (=> b!1033552 (= lt!456009 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun lt!456015 () (_ BitVec 64))

(assert (=> b!1033552 (= lt!456015 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456013 () (_ BitVec 64))

(assert (=> b!1033552 (= lt!456013 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033552 (= lt!456016 (addApplyDifferent!474 lt!456009 lt!456015 (minValue!6062 thiss!1427) lt!456013))))

(assert (=> b!1033552 (= (apply!899 (+!3130 lt!456009 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))) lt!456013) (apply!899 lt!456009 lt!456013))))

(declare-fun bm!43642 () Bool)

(assert (=> bm!43642 (= call!43643 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun b!1033553 () Bool)

(declare-fun res!690573 () Bool)

(assert (=> b!1033553 (=> (not res!690573) (not e!584225))))

(declare-fun e!584220 () Bool)

(assert (=> b!1033553 (= res!690573 e!584220)))

(declare-fun c!104355 () Bool)

(assert (=> b!1033553 (= c!104355 (not (= (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1033554 () Bool)

(declare-fun e!584231 () Bool)

(assert (=> b!1033554 (= e!584231 (= (apply!899 lt!456029 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1033554 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31845 (_values!6249 thiss!1427))))))

(assert (=> b!1033554 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun b!1033555 () Bool)

(assert (=> b!1033555 (= e!584220 e!584227)))

(declare-fun res!690574 () Bool)

(declare-fun call!43648 () Bool)

(assert (=> b!1033555 (= res!690574 call!43648)))

(assert (=> b!1033555 (=> (not res!690574) (not e!584227))))

(declare-fun b!1033556 () Bool)

(declare-fun e!584219 () ListLongMap!13829)

(declare-fun call!43647 () ListLongMap!13829)

(assert (=> b!1033556 (= e!584219 call!43647)))

(declare-fun b!1033557 () Bool)

(declare-fun e!584223 () Bool)

(assert (=> b!1033557 (= e!584223 (= (apply!899 lt!456029 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6062 thiss!1427)))))

(declare-fun b!1033558 () Bool)

(declare-fun e!584226 () ListLongMap!13829)

(assert (=> b!1033558 (= e!584226 call!43646)))

(declare-fun b!1033559 () Bool)

(assert (=> b!1033559 (= e!584221 (+!3130 call!43645 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(declare-fun b!1033560 () Bool)

(declare-fun e!584228 () Bool)

(assert (=> b!1033560 (= e!584228 e!584231)))

(declare-fun res!690572 () Bool)

(assert (=> b!1033560 (=> (not res!690572) (not e!584231))))

(assert (=> b!1033560 (= res!690572 (contains!5992 lt!456029 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1033560 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun b!1033561 () Bool)

(assert (=> b!1033561 (= e!584224 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43643 () Bool)

(assert (=> bm!43643 (= call!43646 call!43649)))

(declare-fun bm!43644 () Bool)

(assert (=> bm!43644 (= call!43648 (contains!5992 lt!456029 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033562 () Bool)

(declare-fun res!690571 () Bool)

(assert (=> b!1033562 (=> (not res!690571) (not e!584225))))

(assert (=> b!1033562 (= res!690571 e!584228)))

(declare-fun res!690570 () Bool)

(assert (=> b!1033562 (=> res!690570 e!584228)))

(assert (=> b!1033562 (= res!690570 (not e!584222))))

(declare-fun res!690577 () Bool)

(assert (=> b!1033562 (=> (not res!690577) (not e!584222))))

(assert (=> b!1033562 (= res!690577 (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun b!1033563 () Bool)

(assert (=> b!1033563 (= e!584221 e!584219)))

(assert (=> b!1033563 (= c!104354 (and (not (= (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1033564 () Bool)

(declare-fun e!584229 () Bool)

(assert (=> b!1033564 (= e!584229 (not call!43644))))

(declare-fun b!1033565 () Bool)

(assert (=> b!1033565 (= e!584225 e!584229)))

(declare-fun c!104350 () Bool)

(assert (=> b!1033565 (= c!104350 (not (= (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43645 () Bool)

(assert (=> bm!43645 (= call!43647 call!43645)))

(declare-fun b!1033566 () Bool)

(declare-fun c!104352 () Bool)

(assert (=> b!1033566 (= c!104352 (and (not (= (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1033566 (= e!584219 e!584226)))

(declare-fun b!1033567 () Bool)

(assert (=> b!1033567 (= e!584226 call!43647)))

(declare-fun bm!43646 () Bool)

(assert (=> bm!43646 (= call!43649 call!43643)))

(declare-fun b!1033568 () Bool)

(assert (=> b!1033568 (= e!584220 (not call!43648))))

(declare-fun b!1033569 () Bool)

(assert (=> b!1033569 (= e!584229 e!584223)))

(declare-fun res!690575 () Bool)

(assert (=> b!1033569 (= res!690575 call!43644)))

(assert (=> b!1033569 (=> (not res!690575) (not e!584223))))

(assert (= (and d!123675 c!104353) b!1033559))

(assert (= (and d!123675 (not c!104353)) b!1033563))

(assert (= (and b!1033563 c!104354) b!1033556))

(assert (= (and b!1033563 (not c!104354)) b!1033566))

(assert (= (and b!1033566 c!104352) b!1033567))

(assert (= (and b!1033566 (not c!104352)) b!1033558))

(assert (= (or b!1033567 b!1033558) bm!43643))

(assert (= (or b!1033556 bm!43643) bm!43646))

(assert (= (or b!1033556 b!1033567) bm!43645))

(assert (= (or b!1033559 bm!43646) bm!43642))

(assert (= (or b!1033559 bm!43645) bm!43641))

(assert (= (and d!123675 res!690576) b!1033561))

(assert (= (and d!123675 c!104351) b!1033552))

(assert (= (and d!123675 (not c!104351)) b!1033550))

(assert (= (and d!123675 res!690569) b!1033562))

(assert (= (and b!1033562 res!690577) b!1033551))

(assert (= (and b!1033562 (not res!690570)) b!1033560))

(assert (= (and b!1033560 res!690572) b!1033554))

(assert (= (and b!1033562 res!690571) b!1033553))

(assert (= (and b!1033553 c!104355) b!1033555))

(assert (= (and b!1033553 (not c!104355)) b!1033568))

(assert (= (and b!1033555 res!690574) b!1033549))

(assert (= (or b!1033555 b!1033568) bm!43644))

(assert (= (and b!1033553 res!690573) b!1033565))

(assert (= (and b!1033565 c!104350) b!1033569))

(assert (= (and b!1033565 (not c!104350)) b!1033564))

(assert (= (and b!1033569 res!690575) b!1033557))

(assert (= (or b!1033569 b!1033564) bm!43640))

(declare-fun b_lambda!16033 () Bool)

(assert (=> (not b_lambda!16033) (not b!1033554)))

(assert (=> b!1033554 t!31125))

(declare-fun b_and!33253 () Bool)

(assert (= b_and!33251 (and (=> t!31125 result!14375) b_and!33253)))

(declare-fun m!952811 () Bool)

(assert (=> b!1033552 m!952811))

(declare-fun m!952813 () Bool)

(assert (=> b!1033552 m!952813))

(declare-fun m!952815 () Bool)

(assert (=> b!1033552 m!952815))

(assert (=> b!1033552 m!952811))

(declare-fun m!952817 () Bool)

(assert (=> b!1033552 m!952817))

(declare-fun m!952819 () Bool)

(assert (=> b!1033552 m!952819))

(declare-fun m!952821 () Bool)

(assert (=> b!1033552 m!952821))

(declare-fun m!952823 () Bool)

(assert (=> b!1033552 m!952823))

(declare-fun m!952825 () Bool)

(assert (=> b!1033552 m!952825))

(declare-fun m!952827 () Bool)

(assert (=> b!1033552 m!952827))

(assert (=> b!1033552 m!952821))

(declare-fun m!952829 () Bool)

(assert (=> b!1033552 m!952829))

(declare-fun m!952831 () Bool)

(assert (=> b!1033552 m!952831))

(declare-fun m!952833 () Bool)

(assert (=> b!1033552 m!952833))

(assert (=> b!1033552 m!952763))

(assert (=> b!1033552 m!952825))

(declare-fun m!952835 () Bool)

(assert (=> b!1033552 m!952835))

(declare-fun m!952837 () Bool)

(assert (=> b!1033552 m!952837))

(assert (=> b!1033552 m!952831))

(declare-fun m!952839 () Bool)

(assert (=> b!1033552 m!952839))

(declare-fun m!952841 () Bool)

(assert (=> b!1033552 m!952841))

(declare-fun m!952843 () Bool)

(assert (=> b!1033549 m!952843))

(declare-fun m!952845 () Bool)

(assert (=> bm!43640 m!952845))

(assert (=> b!1033551 m!952763))

(assert (=> b!1033551 m!952763))

(assert (=> b!1033551 m!952777))

(assert (=> b!1033554 m!952779))

(assert (=> b!1033554 m!952779))

(assert (=> b!1033554 m!952655))

(assert (=> b!1033554 m!952781))

(assert (=> b!1033554 m!952655))

(assert (=> b!1033554 m!952763))

(assert (=> b!1033554 m!952763))

(declare-fun m!952847 () Bool)

(assert (=> b!1033554 m!952847))

(declare-fun m!952849 () Bool)

(assert (=> b!1033557 m!952849))

(assert (=> bm!43642 m!952815))

(declare-fun m!952851 () Bool)

(assert (=> bm!43644 m!952851))

(declare-fun m!952853 () Bool)

(assert (=> b!1033559 m!952853))

(assert (=> b!1033561 m!952763))

(assert (=> b!1033561 m!952763))

(assert (=> b!1033561 m!952777))

(declare-fun m!952855 () Bool)

(assert (=> bm!43641 m!952855))

(assert (=> b!1033560 m!952763))

(assert (=> b!1033560 m!952763))

(declare-fun m!952857 () Bool)

(assert (=> b!1033560 m!952857))

(assert (=> d!123675 m!952795))

(assert (=> b!1033423 d!123675))

(declare-fun b!1033577 () Bool)

(declare-fun e!584236 () Bool)

(assert (=> b!1033577 (= e!584236 tp_is_empty!24517)))

(declare-fun condMapEmpty!38267 () Bool)

(declare-fun mapDefault!38267 () ValueCell!11555)

(assert (=> mapNonEmpty!38258 (= condMapEmpty!38267 (= mapRest!38258 ((as const (Array (_ BitVec 32) ValueCell!11555)) mapDefault!38267)))))

(declare-fun mapRes!38267 () Bool)

(assert (=> mapNonEmpty!38258 (= tp!73490 (and e!584236 mapRes!38267))))

(declare-fun b!1033576 () Bool)

(declare-fun e!584237 () Bool)

(assert (=> b!1033576 (= e!584237 tp_is_empty!24517)))

(declare-fun mapNonEmpty!38267 () Bool)

(declare-fun tp!73506 () Bool)

(assert (=> mapNonEmpty!38267 (= mapRes!38267 (and tp!73506 e!584237))))

(declare-fun mapRest!38267 () (Array (_ BitVec 32) ValueCell!11555))

(declare-fun mapKey!38267 () (_ BitVec 32))

(declare-fun mapValue!38267 () ValueCell!11555)

(assert (=> mapNonEmpty!38267 (= mapRest!38258 (store mapRest!38267 mapKey!38267 mapValue!38267))))

(declare-fun mapIsEmpty!38267 () Bool)

(assert (=> mapIsEmpty!38267 mapRes!38267))

(assert (= (and mapNonEmpty!38258 condMapEmpty!38267) mapIsEmpty!38267))

(assert (= (and mapNonEmpty!38258 (not condMapEmpty!38267)) mapNonEmpty!38267))

(assert (= (and mapNonEmpty!38267 ((_ is ValueCellFull!11555) mapValue!38267)) b!1033576))

(assert (= (and mapNonEmpty!38258 ((_ is ValueCellFull!11555) mapDefault!38267)) b!1033577))

(declare-fun m!952859 () Bool)

(assert (=> mapNonEmpty!38267 m!952859))

(declare-fun b_lambda!16035 () Bool)

(assert (= b_lambda!16031 (or (and b!1033421 b_free!20797) b_lambda!16035)))

(declare-fun b_lambda!16037 () Bool)

(assert (= b_lambda!16033 (or (and b!1033421 b_free!20797) b_lambda!16037)))

(check-sat (not b_lambda!16029) (not b_lambda!16035) (not bm!43642) (not b!1033549) (not d!123659) (not bm!43641) (not d!123675) (not b!1033552) (not b!1033560) (not b!1033546) (not bm!43640) (not d!123669) (not b!1033525) (not b!1033537) (not b!1033559) (not b!1033536) (not b!1033481) (not d!123665) (not b!1033551) (not d!123673) (not b!1033528) (not b!1033533) (not bm!43644) (not b!1033482) (not bm!43635) (not d!123657) (not b_next!20797) (not b!1033527) (not b!1033480) (not b!1033548) (not d!123671) (not bm!43633) (not d!123655) b_and!33253 (not bm!43637) (not b!1033557) tp_is_empty!24517 (not b!1033535) (not mapNonEmpty!38267) (not b_lambda!16037) (not bm!43634) (not b!1033530) (not b!1033561) (not d!123667) (not b!1033554) (not b!1033547))
(check-sat b_and!33253 (not b_next!20797))
(get-model)

(declare-fun b!1033588 () Bool)

(declare-fun e!584247 () Bool)

(declare-fun contains!5993 (List!21941 (_ BitVec 64)) Bool)

(assert (=> b!1033588 (= e!584247 (contains!5993 Nil!21938 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123677 () Bool)

(declare-fun res!690586 () Bool)

(declare-fun e!584246 () Bool)

(assert (=> d!123677 (=> res!690586 e!584246)))

(assert (=> d!123677 (= res!690586 (bvsge #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(assert (=> d!123677 (= (arrayNoDuplicates!0 (_keys!11402 thiss!1427) #b00000000000000000000000000000000 Nil!21938) e!584246)))

(declare-fun bm!43649 () Bool)

(declare-fun call!43652 () Bool)

(declare-fun c!104358 () Bool)

(assert (=> bm!43649 (= call!43652 (arrayNoDuplicates!0 (_keys!11402 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104358 (Cons!21937 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) Nil!21938) Nil!21938)))))

(declare-fun b!1033589 () Bool)

(declare-fun e!584248 () Bool)

(assert (=> b!1033589 (= e!584248 call!43652)))

(declare-fun b!1033590 () Bool)

(assert (=> b!1033590 (= e!584248 call!43652)))

(declare-fun b!1033591 () Bool)

(declare-fun e!584249 () Bool)

(assert (=> b!1033591 (= e!584249 e!584248)))

(assert (=> b!1033591 (= c!104358 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033592 () Bool)

(assert (=> b!1033592 (= e!584246 e!584249)))

(declare-fun res!690584 () Bool)

(assert (=> b!1033592 (=> (not res!690584) (not e!584249))))

(assert (=> b!1033592 (= res!690584 (not e!584247))))

(declare-fun res!690585 () Bool)

(assert (=> b!1033592 (=> (not res!690585) (not e!584247))))

(assert (=> b!1033592 (= res!690585 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123677 (not res!690586)) b!1033592))

(assert (= (and b!1033592 res!690585) b!1033588))

(assert (= (and b!1033592 res!690584) b!1033591))

(assert (= (and b!1033591 c!104358) b!1033590))

(assert (= (and b!1033591 (not c!104358)) b!1033589))

(assert (= (or b!1033590 b!1033589) bm!43649))

(assert (=> b!1033588 m!952763))

(assert (=> b!1033588 m!952763))

(declare-fun m!952861 () Bool)

(assert (=> b!1033588 m!952861))

(assert (=> bm!43649 m!952763))

(declare-fun m!952863 () Bool)

(assert (=> bm!43649 m!952863))

(assert (=> b!1033591 m!952763))

(assert (=> b!1033591 m!952763))

(assert (=> b!1033591 m!952777))

(assert (=> b!1033592 m!952763))

(assert (=> b!1033592 m!952763))

(assert (=> b!1033592 m!952777))

(assert (=> b!1033482 d!123677))

(declare-fun b!1033618 () Bool)

(declare-fun e!584270 () ListLongMap!13829)

(declare-fun call!43655 () ListLongMap!13829)

(assert (=> b!1033618 (= e!584270 call!43655)))

(declare-fun b!1033619 () Bool)

(assert (=> b!1033619 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(assert (=> b!1033619 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31845 (_values!6249 thiss!1427))))))

(declare-fun e!584264 () Bool)

(declare-fun lt!456045 () ListLongMap!13829)

(assert (=> b!1033619 (= e!584264 (= (apply!899 lt!456045 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1033620 () Bool)

(declare-fun e!584265 () Bool)

(assert (=> b!1033620 (= e!584265 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1033620 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1033621 () Bool)

(declare-fun e!584267 () Bool)

(declare-fun e!584266 () Bool)

(assert (=> b!1033621 (= e!584267 e!584266)))

(declare-fun c!104367 () Bool)

(assert (=> b!1033621 (= c!104367 (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun b!1033622 () Bool)

(declare-fun lt!456050 () Unit!33713)

(declare-fun lt!456047 () Unit!33713)

(assert (=> b!1033622 (= lt!456050 lt!456047)))

(declare-fun lt!456046 () (_ BitVec 64))

(declare-fun lt!456048 () ListLongMap!13829)

(declare-fun lt!456049 () V!37563)

(declare-fun lt!456044 () (_ BitVec 64))

(assert (=> b!1033622 (not (contains!5992 (+!3130 lt!456048 (tuple2!15807 lt!456046 lt!456049)) lt!456044))))

(declare-fun addStillNotContains!243 (ListLongMap!13829 (_ BitVec 64) V!37563 (_ BitVec 64)) Unit!33713)

(assert (=> b!1033622 (= lt!456047 (addStillNotContains!243 lt!456048 lt!456046 lt!456049 lt!456044))))

(assert (=> b!1033622 (= lt!456044 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1033622 (= lt!456049 (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1033622 (= lt!456046 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033622 (= lt!456048 call!43655)))

(assert (=> b!1033622 (= e!584270 (+!3130 call!43655 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1033623 () Bool)

(declare-fun isEmpty!931 (ListLongMap!13829) Bool)

(assert (=> b!1033623 (= e!584266 (isEmpty!931 lt!456045))))

(declare-fun bm!43652 () Bool)

(assert (=> bm!43652 (= call!43655 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427)))))

(declare-fun b!1033624 () Bool)

(declare-fun e!584268 () Bool)

(assert (=> b!1033624 (= e!584268 e!584267)))

(declare-fun c!104369 () Bool)

(assert (=> b!1033624 (= c!104369 e!584265)))

(declare-fun res!690598 () Bool)

(assert (=> b!1033624 (=> (not res!690598) (not e!584265))))

(assert (=> b!1033624 (= res!690598 (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun b!1033625 () Bool)

(declare-fun e!584269 () ListLongMap!13829)

(assert (=> b!1033625 (= e!584269 e!584270)))

(declare-fun c!104368 () Bool)

(assert (=> b!1033625 (= c!104368 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033626 () Bool)

(assert (=> b!1033626 (= e!584266 (= lt!456045 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427))))))

(declare-fun b!1033627 () Bool)

(assert (=> b!1033627 (= e!584269 (ListLongMap!13830 Nil!21936))))

(declare-fun b!1033628 () Bool)

(declare-fun res!690595 () Bool)

(assert (=> b!1033628 (=> (not res!690595) (not e!584268))))

(assert (=> b!1033628 (= res!690595 (not (contains!5992 lt!456045 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!123679 () Bool)

(assert (=> d!123679 e!584268))

(declare-fun res!690596 () Bool)

(assert (=> d!123679 (=> (not res!690596) (not e!584268))))

(assert (=> d!123679 (= res!690596 (not (contains!5992 lt!456045 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123679 (= lt!456045 e!584269)))

(declare-fun c!104370 () Bool)

(assert (=> d!123679 (= c!104370 (bvsge #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(assert (=> d!123679 (validMask!0 (mask!30078 thiss!1427))))

(assert (=> d!123679 (= (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)) lt!456045)))

(declare-fun b!1033617 () Bool)

(assert (=> b!1033617 (= e!584267 e!584264)))

(assert (=> b!1033617 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun res!690597 () Bool)

(assert (=> b!1033617 (= res!690597 (contains!5992 lt!456045 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1033617 (=> (not res!690597) (not e!584264))))

(assert (= (and d!123679 c!104370) b!1033627))

(assert (= (and d!123679 (not c!104370)) b!1033625))

(assert (= (and b!1033625 c!104368) b!1033622))

(assert (= (and b!1033625 (not c!104368)) b!1033618))

(assert (= (or b!1033622 b!1033618) bm!43652))

(assert (= (and d!123679 res!690596) b!1033628))

(assert (= (and b!1033628 res!690595) b!1033624))

(assert (= (and b!1033624 res!690598) b!1033620))

(assert (= (and b!1033624 c!104369) b!1033617))

(assert (= (and b!1033624 (not c!104369)) b!1033621))

(assert (= (and b!1033617 res!690597) b!1033619))

(assert (= (and b!1033621 c!104367) b!1033626))

(assert (= (and b!1033621 (not c!104367)) b!1033623))

(declare-fun b_lambda!16039 () Bool)

(assert (=> (not b_lambda!16039) (not b!1033619)))

(assert (=> b!1033619 t!31125))

(declare-fun b_and!33255 () Bool)

(assert (= b_and!33253 (and (=> t!31125 result!14375) b_and!33255)))

(declare-fun b_lambda!16041 () Bool)

(assert (=> (not b_lambda!16041) (not b!1033622)))

(assert (=> b!1033622 t!31125))

(declare-fun b_and!33257 () Bool)

(assert (= b_and!33255 (and (=> t!31125 result!14375) b_and!33257)))

(declare-fun m!952865 () Bool)

(assert (=> b!1033626 m!952865))

(declare-fun m!952867 () Bool)

(assert (=> b!1033623 m!952867))

(declare-fun m!952869 () Bool)

(assert (=> d!123679 m!952869))

(assert (=> d!123679 m!952795))

(assert (=> b!1033625 m!952763))

(assert (=> b!1033625 m!952763))

(assert (=> b!1033625 m!952777))

(assert (=> b!1033617 m!952763))

(assert (=> b!1033617 m!952763))

(declare-fun m!952871 () Bool)

(assert (=> b!1033617 m!952871))

(assert (=> b!1033620 m!952763))

(assert (=> b!1033620 m!952763))

(assert (=> b!1033620 m!952777))

(assert (=> b!1033619 m!952763))

(declare-fun m!952873 () Bool)

(assert (=> b!1033619 m!952873))

(assert (=> b!1033619 m!952763))

(assert (=> b!1033619 m!952655))

(assert (=> b!1033619 m!952779))

(assert (=> b!1033619 m!952779))

(assert (=> b!1033619 m!952655))

(assert (=> b!1033619 m!952781))

(assert (=> bm!43652 m!952865))

(declare-fun m!952875 () Bool)

(assert (=> b!1033628 m!952875))

(declare-fun m!952877 () Bool)

(assert (=> b!1033622 m!952877))

(declare-fun m!952879 () Bool)

(assert (=> b!1033622 m!952879))

(assert (=> b!1033622 m!952763))

(assert (=> b!1033622 m!952877))

(declare-fun m!952881 () Bool)

(assert (=> b!1033622 m!952881))

(assert (=> b!1033622 m!952655))

(declare-fun m!952883 () Bool)

(assert (=> b!1033622 m!952883))

(assert (=> b!1033622 m!952779))

(assert (=> b!1033622 m!952779))

(assert (=> b!1033622 m!952655))

(assert (=> b!1033622 m!952781))

(assert (=> bm!43642 d!123679))

(declare-fun d!123681 () Bool)

(assert (=> d!123681 (= (validMask!0 (mask!30078 thiss!1427)) (and (or (= (mask!30078 thiss!1427) #b00000000000000000000000000000111) (= (mask!30078 thiss!1427) #b00000000000000000000000000001111) (= (mask!30078 thiss!1427) #b00000000000000000000000000011111) (= (mask!30078 thiss!1427) #b00000000000000000000000000111111) (= (mask!30078 thiss!1427) #b00000000000000000000000001111111) (= (mask!30078 thiss!1427) #b00000000000000000000000011111111) (= (mask!30078 thiss!1427) #b00000000000000000000000111111111) (= (mask!30078 thiss!1427) #b00000000000000000000001111111111) (= (mask!30078 thiss!1427) #b00000000000000000000011111111111) (= (mask!30078 thiss!1427) #b00000000000000000000111111111111) (= (mask!30078 thiss!1427) #b00000000000000000001111111111111) (= (mask!30078 thiss!1427) #b00000000000000000011111111111111) (= (mask!30078 thiss!1427) #b00000000000000000111111111111111) (= (mask!30078 thiss!1427) #b00000000000000001111111111111111) (= (mask!30078 thiss!1427) #b00000000000000011111111111111111) (= (mask!30078 thiss!1427) #b00000000000000111111111111111111) (= (mask!30078 thiss!1427) #b00000000000001111111111111111111) (= (mask!30078 thiss!1427) #b00000000000011111111111111111111) (= (mask!30078 thiss!1427) #b00000000000111111111111111111111) (= (mask!30078 thiss!1427) #b00000000001111111111111111111111) (= (mask!30078 thiss!1427) #b00000000011111111111111111111111) (= (mask!30078 thiss!1427) #b00000000111111111111111111111111) (= (mask!30078 thiss!1427) #b00000001111111111111111111111111) (= (mask!30078 thiss!1427) #b00000011111111111111111111111111) (= (mask!30078 thiss!1427) #b00000111111111111111111111111111) (= (mask!30078 thiss!1427) #b00001111111111111111111111111111) (= (mask!30078 thiss!1427) #b00011111111111111111111111111111) (= (mask!30078 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30078 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!123675 d!123681))

(declare-fun b!1033637 () Bool)

(declare-fun e!584277 () Bool)

(declare-fun e!584278 () Bool)

(assert (=> b!1033637 (= e!584277 e!584278)))

(declare-fun lt!456059 () (_ BitVec 64))

(assert (=> b!1033637 (= lt!456059 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456057 () Unit!33713)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65053 (_ BitVec 64) (_ BitVec 32)) Unit!33713)

(assert (=> b!1033637 (= lt!456057 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11402 thiss!1427) lt!456059 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1033637 (arrayContainsKey!0 (_keys!11402 thiss!1427) lt!456059 #b00000000000000000000000000000000)))

(declare-fun lt!456058 () Unit!33713)

(assert (=> b!1033637 (= lt!456058 lt!456057)))

(declare-fun res!690604 () Bool)

(declare-datatypes ((SeekEntryResult!9729 0))(
  ( (MissingZero!9729 (index!41287 (_ BitVec 32))) (Found!9729 (index!41288 (_ BitVec 32))) (Intermediate!9729 (undefined!10541 Bool) (index!41289 (_ BitVec 32)) (x!92213 (_ BitVec 32))) (Undefined!9729) (MissingVacant!9729 (index!41290 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65053 (_ BitVec 32)) SeekEntryResult!9729)

(assert (=> b!1033637 (= res!690604 (= (seekEntryOrOpen!0 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (_keys!11402 thiss!1427) (mask!30078 thiss!1427)) (Found!9729 #b00000000000000000000000000000000)))))

(assert (=> b!1033637 (=> (not res!690604) (not e!584278))))

(declare-fun b!1033638 () Bool)

(declare-fun e!584279 () Bool)

(assert (=> b!1033638 (= e!584279 e!584277)))

(declare-fun c!104373 () Bool)

(assert (=> b!1033638 (= c!104373 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123683 () Bool)

(declare-fun res!690603 () Bool)

(assert (=> d!123683 (=> res!690603 e!584279)))

(assert (=> d!123683 (= res!690603 (bvsge #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(assert (=> d!123683 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11402 thiss!1427) (mask!30078 thiss!1427)) e!584279)))

(declare-fun b!1033639 () Bool)

(declare-fun call!43658 () Bool)

(assert (=> b!1033639 (= e!584277 call!43658)))

(declare-fun b!1033640 () Bool)

(assert (=> b!1033640 (= e!584278 call!43658)))

(declare-fun bm!43655 () Bool)

(assert (=> bm!43655 (= call!43658 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11402 thiss!1427) (mask!30078 thiss!1427)))))

(assert (= (and d!123683 (not res!690603)) b!1033638))

(assert (= (and b!1033638 c!104373) b!1033637))

(assert (= (and b!1033638 (not c!104373)) b!1033639))

(assert (= (and b!1033637 res!690604) b!1033640))

(assert (= (or b!1033640 b!1033639) bm!43655))

(assert (=> b!1033637 m!952763))

(declare-fun m!952885 () Bool)

(assert (=> b!1033637 m!952885))

(declare-fun m!952887 () Bool)

(assert (=> b!1033637 m!952887))

(assert (=> b!1033637 m!952763))

(declare-fun m!952889 () Bool)

(assert (=> b!1033637 m!952889))

(assert (=> b!1033638 m!952763))

(assert (=> b!1033638 m!952763))

(assert (=> b!1033638 m!952777))

(declare-fun m!952891 () Bool)

(assert (=> bm!43655 m!952891))

(assert (=> b!1033481 d!123683))

(declare-fun d!123685 () Bool)

(declare-datatypes ((Option!641 0))(
  ( (Some!640 (v!14888 V!37563)) (None!639) )
))
(declare-fun get!16429 (Option!641) V!37563)

(declare-fun getValueByKey!590 (List!21939 (_ BitVec 64)) Option!641)

(assert (=> d!123685 (= (apply!899 lt!456003 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) (get!16429 (getValueByKey!590 (toList!6930 lt!456003) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30187 () Bool)

(assert (= bs!30187 d!123685))

(assert (=> bs!30187 m!952763))

(declare-fun m!952893 () Bool)

(assert (=> bs!30187 m!952893))

(assert (=> bs!30187 m!952893))

(declare-fun m!952895 () Bool)

(assert (=> bs!30187 m!952895))

(assert (=> b!1033530 d!123685))

(declare-fun d!123687 () Bool)

(declare-fun c!104376 () Bool)

(assert (=> d!123687 (= c!104376 ((_ is ValueCellFull!11555) (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!584282 () V!37563)

(assert (=> d!123687 (= (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!584282)))

(declare-fun b!1033645 () Bool)

(declare-fun get!16430 (ValueCell!11555 V!37563) V!37563)

(assert (=> b!1033645 (= e!584282 (get!16430 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1033646 () Bool)

(declare-fun get!16431 (ValueCell!11555 V!37563) V!37563)

(assert (=> b!1033646 (= e!584282 (get!16431 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123687 c!104376) b!1033645))

(assert (= (and d!123687 (not c!104376)) b!1033646))

(assert (=> b!1033645 m!952779))

(assert (=> b!1033645 m!952655))

(declare-fun m!952897 () Bool)

(assert (=> b!1033645 m!952897))

(assert (=> b!1033646 m!952779))

(assert (=> b!1033646 m!952655))

(declare-fun m!952899 () Bool)

(assert (=> b!1033646 m!952899))

(assert (=> b!1033530 d!123687))

(declare-fun d!123689 () Bool)

(declare-fun e!584287 () Bool)

(assert (=> d!123689 e!584287))

(declare-fun res!690607 () Bool)

(assert (=> d!123689 (=> res!690607 e!584287)))

(declare-fun lt!456068 () Bool)

(assert (=> d!123689 (= res!690607 (not lt!456068))))

(declare-fun lt!456071 () Bool)

(assert (=> d!123689 (= lt!456068 lt!456071)))

(declare-fun lt!456070 () Unit!33713)

(declare-fun e!584288 () Unit!33713)

(assert (=> d!123689 (= lt!456070 e!584288)))

(declare-fun c!104379 () Bool)

(assert (=> d!123689 (= c!104379 lt!456071)))

(declare-fun containsKey!563 (List!21939 (_ BitVec 64)) Bool)

(assert (=> d!123689 (= lt!456071 (containsKey!563 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) lt!456008))))

(assert (=> d!123689 (= (contains!5992 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))) lt!456008) lt!456068)))

(declare-fun b!1033653 () Bool)

(declare-fun lt!456069 () Unit!33713)

(assert (=> b!1033653 (= e!584288 lt!456069)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!395 (List!21939 (_ BitVec 64)) Unit!33713)

(assert (=> b!1033653 (= lt!456069 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) lt!456008))))

(declare-fun isDefined!438 (Option!641) Bool)

(assert (=> b!1033653 (isDefined!438 (getValueByKey!590 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) lt!456008))))

(declare-fun b!1033654 () Bool)

(declare-fun Unit!33717 () Unit!33713)

(assert (=> b!1033654 (= e!584288 Unit!33717)))

(declare-fun b!1033655 () Bool)

(assert (=> b!1033655 (= e!584287 (isDefined!438 (getValueByKey!590 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) lt!456008)))))

(assert (= (and d!123689 c!104379) b!1033653))

(assert (= (and d!123689 (not c!104379)) b!1033654))

(assert (= (and d!123689 (not res!690607)) b!1033655))

(declare-fun m!952901 () Bool)

(assert (=> d!123689 m!952901))

(declare-fun m!952903 () Bool)

(assert (=> b!1033653 m!952903))

(declare-fun m!952905 () Bool)

(assert (=> b!1033653 m!952905))

(assert (=> b!1033653 m!952905))

(declare-fun m!952907 () Bool)

(assert (=> b!1033653 m!952907))

(assert (=> b!1033655 m!952905))

(assert (=> b!1033655 m!952905))

(assert (=> b!1033655 m!952907))

(assert (=> b!1033552 d!123689))

(declare-fun d!123691 () Bool)

(assert (=> d!123691 (= (apply!899 (+!3130 lt!456028 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))) lt!456019) (get!16429 (getValueByKey!590 (toList!6930 (+!3130 lt!456028 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))) lt!456019)))))

(declare-fun bs!30188 () Bool)

(assert (= bs!30188 d!123691))

(declare-fun m!952909 () Bool)

(assert (=> bs!30188 m!952909))

(assert (=> bs!30188 m!952909))

(declare-fun m!952911 () Bool)

(assert (=> bs!30188 m!952911))

(assert (=> b!1033552 d!123691))

(declare-fun d!123693 () Bool)

(assert (=> d!123693 (= (apply!899 (+!3130 lt!456009 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))) lt!456013) (get!16429 (getValueByKey!590 (toList!6930 (+!3130 lt!456009 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))) lt!456013)))))

(declare-fun bs!30189 () Bool)

(assert (= bs!30189 d!123693))

(declare-fun m!952913 () Bool)

(assert (=> bs!30189 m!952913))

(assert (=> bs!30189 m!952913))

(declare-fun m!952915 () Bool)

(assert (=> bs!30189 m!952915))

(assert (=> b!1033552 d!123693))

(declare-fun d!123695 () Bool)

(assert (=> d!123695 (= (apply!899 lt!456009 lt!456013) (get!16429 (getValueByKey!590 (toList!6930 lt!456009) lt!456013)))))

(declare-fun bs!30190 () Bool)

(assert (= bs!30190 d!123695))

(declare-fun m!952917 () Bool)

(assert (=> bs!30190 m!952917))

(assert (=> bs!30190 m!952917))

(declare-fun m!952919 () Bool)

(assert (=> bs!30190 m!952919))

(assert (=> b!1033552 d!123695))

(declare-fun d!123697 () Bool)

(declare-fun e!584291 () Bool)

(assert (=> d!123697 e!584291))

(declare-fun res!690613 () Bool)

(assert (=> d!123697 (=> (not res!690613) (not e!584291))))

(declare-fun lt!456081 () ListLongMap!13829)

(assert (=> d!123697 (= res!690613 (contains!5992 lt!456081 (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456083 () List!21939)

(assert (=> d!123697 (= lt!456081 (ListLongMap!13830 lt!456083))))

(declare-fun lt!456080 () Unit!33713)

(declare-fun lt!456082 () Unit!33713)

(assert (=> d!123697 (= lt!456080 lt!456082)))

(assert (=> d!123697 (= (getValueByKey!590 lt!456083 (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!280 (List!21939 (_ BitVec 64) V!37563) Unit!33713)

(assert (=> d!123697 (= lt!456082 (lemmaContainsTupThenGetReturnValue!280 lt!456083 (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))))))

(declare-fun insertStrictlySorted!373 (List!21939 (_ BitVec 64) V!37563) List!21939)

(assert (=> d!123697 (= lt!456083 (insertStrictlySorted!373 (toList!6930 lt!456028) (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))))))

(assert (=> d!123697 (= (+!3130 lt!456028 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))) lt!456081)))

(declare-fun b!1033660 () Bool)

(declare-fun res!690612 () Bool)

(assert (=> b!1033660 (=> (not res!690612) (not e!584291))))

(assert (=> b!1033660 (= res!690612 (= (getValueByKey!590 (toList!6930 lt!456081) (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))))))))

(declare-fun b!1033661 () Bool)

(declare-fun contains!5994 (List!21939 tuple2!15806) Bool)

(assert (=> b!1033661 (= e!584291 (contains!5994 (toList!6930 lt!456081) (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))))))

(assert (= (and d!123697 res!690613) b!1033660))

(assert (= (and b!1033660 res!690612) b!1033661))

(declare-fun m!952921 () Bool)

(assert (=> d!123697 m!952921))

(declare-fun m!952923 () Bool)

(assert (=> d!123697 m!952923))

(declare-fun m!952925 () Bool)

(assert (=> d!123697 m!952925))

(declare-fun m!952927 () Bool)

(assert (=> d!123697 m!952927))

(declare-fun m!952929 () Bool)

(assert (=> b!1033660 m!952929))

(declare-fun m!952931 () Bool)

(assert (=> b!1033661 m!952931))

(assert (=> b!1033552 d!123697))

(declare-fun d!123699 () Bool)

(assert (=> d!123699 (= (apply!899 lt!456028 lt!456019) (get!16429 (getValueByKey!590 (toList!6930 lt!456028) lt!456019)))))

(declare-fun bs!30191 () Bool)

(assert (= bs!30191 d!123699))

(declare-fun m!952933 () Bool)

(assert (=> bs!30191 m!952933))

(assert (=> bs!30191 m!952933))

(declare-fun m!952935 () Bool)

(assert (=> bs!30191 m!952935))

(assert (=> b!1033552 d!123699))

(declare-fun d!123701 () Bool)

(assert (=> d!123701 (contains!5992 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))) lt!456008)))

(declare-fun lt!456086 () Unit!33713)

(declare-fun choose!1704 (ListLongMap!13829 (_ BitVec 64) V!37563 (_ BitVec 64)) Unit!33713)

(assert (=> d!123701 (= lt!456086 (choose!1704 lt!456012 lt!456026 (zeroValue!6062 thiss!1427) lt!456008))))

(assert (=> d!123701 (contains!5992 lt!456012 lt!456008)))

(assert (=> d!123701 (= (addStillContains!618 lt!456012 lt!456026 (zeroValue!6062 thiss!1427) lt!456008) lt!456086)))

(declare-fun bs!30192 () Bool)

(assert (= bs!30192 d!123701))

(assert (=> bs!30192 m!952821))

(assert (=> bs!30192 m!952821))

(assert (=> bs!30192 m!952823))

(declare-fun m!952937 () Bool)

(assert (=> bs!30192 m!952937))

(declare-fun m!952939 () Bool)

(assert (=> bs!30192 m!952939))

(assert (=> b!1033552 d!123701))

(declare-fun d!123703 () Bool)

(assert (=> d!123703 (= (apply!899 (+!3130 lt!456009 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))) lt!456013) (apply!899 lt!456009 lt!456013))))

(declare-fun lt!456089 () Unit!33713)

(declare-fun choose!1705 (ListLongMap!13829 (_ BitVec 64) V!37563 (_ BitVec 64)) Unit!33713)

(assert (=> d!123703 (= lt!456089 (choose!1705 lt!456009 lt!456015 (minValue!6062 thiss!1427) lt!456013))))

(declare-fun e!584294 () Bool)

(assert (=> d!123703 e!584294))

(declare-fun res!690616 () Bool)

(assert (=> d!123703 (=> (not res!690616) (not e!584294))))

(assert (=> d!123703 (= res!690616 (contains!5992 lt!456009 lt!456013))))

(assert (=> d!123703 (= (addApplyDifferent!474 lt!456009 lt!456015 (minValue!6062 thiss!1427) lt!456013) lt!456089)))

(declare-fun b!1033666 () Bool)

(assert (=> b!1033666 (= e!584294 (not (= lt!456013 lt!456015)))))

(assert (= (and d!123703 res!690616) b!1033666))

(declare-fun m!952941 () Bool)

(assert (=> d!123703 m!952941))

(declare-fun m!952943 () Bool)

(assert (=> d!123703 m!952943))

(assert (=> d!123703 m!952825))

(assert (=> d!123703 m!952827))

(assert (=> d!123703 m!952825))

(assert (=> d!123703 m!952819))

(assert (=> b!1033552 d!123703))

(declare-fun d!123705 () Bool)

(assert (=> d!123705 (= (apply!899 (+!3130 lt!456022 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))) lt!456020) (apply!899 lt!456022 lt!456020))))

(declare-fun lt!456090 () Unit!33713)

(assert (=> d!123705 (= lt!456090 (choose!1705 lt!456022 lt!456017 (zeroValue!6062 thiss!1427) lt!456020))))

(declare-fun e!584295 () Bool)

(assert (=> d!123705 e!584295))

(declare-fun res!690617 () Bool)

(assert (=> d!123705 (=> (not res!690617) (not e!584295))))

(assert (=> d!123705 (= res!690617 (contains!5992 lt!456022 lt!456020))))

(assert (=> d!123705 (= (addApplyDifferent!474 lt!456022 lt!456017 (zeroValue!6062 thiss!1427) lt!456020) lt!456090)))

(declare-fun b!1033667 () Bool)

(assert (=> b!1033667 (= e!584295 (not (= lt!456020 lt!456017)))))

(assert (= (and d!123705 res!690617) b!1033667))

(declare-fun m!952945 () Bool)

(assert (=> d!123705 m!952945))

(declare-fun m!952947 () Bool)

(assert (=> d!123705 m!952947))

(assert (=> d!123705 m!952831))

(assert (=> d!123705 m!952833))

(assert (=> d!123705 m!952831))

(assert (=> d!123705 m!952837))

(assert (=> b!1033552 d!123705))

(declare-fun d!123707 () Bool)

(declare-fun e!584296 () Bool)

(assert (=> d!123707 e!584296))

(declare-fun res!690619 () Bool)

(assert (=> d!123707 (=> (not res!690619) (not e!584296))))

(declare-fun lt!456092 () ListLongMap!13829)

(assert (=> d!123707 (= res!690619 (contains!5992 lt!456092 (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))))

(declare-fun lt!456094 () List!21939)

(assert (=> d!123707 (= lt!456092 (ListLongMap!13830 lt!456094))))

(declare-fun lt!456091 () Unit!33713)

(declare-fun lt!456093 () Unit!33713)

(assert (=> d!123707 (= lt!456091 lt!456093)))

(assert (=> d!123707 (= (getValueByKey!590 lt!456094 (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))))

(assert (=> d!123707 (= lt!456093 (lemmaContainsTupThenGetReturnValue!280 lt!456094 (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))))

(assert (=> d!123707 (= lt!456094 (insertStrictlySorted!373 (toList!6930 lt!456012) (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))))

(assert (=> d!123707 (= (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))) lt!456092)))

(declare-fun b!1033668 () Bool)

(declare-fun res!690618 () Bool)

(assert (=> b!1033668 (=> (not res!690618) (not e!584296))))

(assert (=> b!1033668 (= res!690618 (= (getValueByKey!590 (toList!6930 lt!456092) (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))))))

(declare-fun b!1033669 () Bool)

(assert (=> b!1033669 (= e!584296 (contains!5994 (toList!6930 lt!456092) (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))))

(assert (= (and d!123707 res!690619) b!1033668))

(assert (= (and b!1033668 res!690618) b!1033669))

(declare-fun m!952949 () Bool)

(assert (=> d!123707 m!952949))

(declare-fun m!952951 () Bool)

(assert (=> d!123707 m!952951))

(declare-fun m!952953 () Bool)

(assert (=> d!123707 m!952953))

(declare-fun m!952955 () Bool)

(assert (=> d!123707 m!952955))

(declare-fun m!952957 () Bool)

(assert (=> b!1033668 m!952957))

(declare-fun m!952959 () Bool)

(assert (=> b!1033669 m!952959))

(assert (=> b!1033552 d!123707))

(declare-fun d!123709 () Bool)

(declare-fun e!584297 () Bool)

(assert (=> d!123709 e!584297))

(declare-fun res!690621 () Bool)

(assert (=> d!123709 (=> (not res!690621) (not e!584297))))

(declare-fun lt!456096 () ListLongMap!13829)

(assert (=> d!123709 (= res!690621 (contains!5992 lt!456096 (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))))))

(declare-fun lt!456098 () List!21939)

(assert (=> d!123709 (= lt!456096 (ListLongMap!13830 lt!456098))))

(declare-fun lt!456095 () Unit!33713)

(declare-fun lt!456097 () Unit!33713)

(assert (=> d!123709 (= lt!456095 lt!456097)))

(assert (=> d!123709 (= (getValueByKey!590 lt!456098 (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))))))

(assert (=> d!123709 (= lt!456097 (lemmaContainsTupThenGetReturnValue!280 lt!456098 (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))))))

(assert (=> d!123709 (= lt!456098 (insertStrictlySorted!373 (toList!6930 lt!456022) (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))))))

(assert (=> d!123709 (= (+!3130 lt!456022 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))) lt!456096)))

(declare-fun b!1033670 () Bool)

(declare-fun res!690620 () Bool)

(assert (=> b!1033670 (=> (not res!690620) (not e!584297))))

(assert (=> b!1033670 (= res!690620 (= (getValueByKey!590 (toList!6930 lt!456096) (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))))))))

(declare-fun b!1033671 () Bool)

(assert (=> b!1033671 (= e!584297 (contains!5994 (toList!6930 lt!456096) (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))))))

(assert (= (and d!123709 res!690621) b!1033670))

(assert (= (and b!1033670 res!690620) b!1033671))

(declare-fun m!952961 () Bool)

(assert (=> d!123709 m!952961))

(declare-fun m!952963 () Bool)

(assert (=> d!123709 m!952963))

(declare-fun m!952965 () Bool)

(assert (=> d!123709 m!952965))

(declare-fun m!952967 () Bool)

(assert (=> d!123709 m!952967))

(declare-fun m!952969 () Bool)

(assert (=> b!1033670 m!952969))

(declare-fun m!952971 () Bool)

(assert (=> b!1033671 m!952971))

(assert (=> b!1033552 d!123709))

(declare-fun d!123711 () Bool)

(assert (=> d!123711 (= (apply!899 (+!3130 lt!456028 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))) lt!456019) (apply!899 lt!456028 lt!456019))))

(declare-fun lt!456099 () Unit!33713)

(assert (=> d!123711 (= lt!456099 (choose!1705 lt!456028 lt!456027 (minValue!6062 thiss!1427) lt!456019))))

(declare-fun e!584298 () Bool)

(assert (=> d!123711 e!584298))

(declare-fun res!690622 () Bool)

(assert (=> d!123711 (=> (not res!690622) (not e!584298))))

(assert (=> d!123711 (= res!690622 (contains!5992 lt!456028 lt!456019))))

(assert (=> d!123711 (= (addApplyDifferent!474 lt!456028 lt!456027 (minValue!6062 thiss!1427) lt!456019) lt!456099)))

(declare-fun b!1033672 () Bool)

(assert (=> b!1033672 (= e!584298 (not (= lt!456019 lt!456027)))))

(assert (= (and d!123711 res!690622) b!1033672))

(declare-fun m!952973 () Bool)

(assert (=> d!123711 m!952973))

(declare-fun m!952975 () Bool)

(assert (=> d!123711 m!952975))

(assert (=> d!123711 m!952811))

(assert (=> d!123711 m!952817))

(assert (=> d!123711 m!952811))

(assert (=> d!123711 m!952839))

(assert (=> b!1033552 d!123711))

(declare-fun d!123713 () Bool)

(declare-fun e!584299 () Bool)

(assert (=> d!123713 e!584299))

(declare-fun res!690624 () Bool)

(assert (=> d!123713 (=> (not res!690624) (not e!584299))))

(declare-fun lt!456101 () ListLongMap!13829)

(assert (=> d!123713 (= res!690624 (contains!5992 lt!456101 (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456103 () List!21939)

(assert (=> d!123713 (= lt!456101 (ListLongMap!13830 lt!456103))))

(declare-fun lt!456100 () Unit!33713)

(declare-fun lt!456102 () Unit!33713)

(assert (=> d!123713 (= lt!456100 lt!456102)))

(assert (=> d!123713 (= (getValueByKey!590 lt!456103 (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))))))

(assert (=> d!123713 (= lt!456102 (lemmaContainsTupThenGetReturnValue!280 lt!456103 (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))))))

(assert (=> d!123713 (= lt!456103 (insertStrictlySorted!373 (toList!6930 lt!456009) (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))))))

(assert (=> d!123713 (= (+!3130 lt!456009 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))) lt!456101)))

(declare-fun b!1033673 () Bool)

(declare-fun res!690623 () Bool)

(assert (=> b!1033673 (=> (not res!690623) (not e!584299))))

(assert (=> b!1033673 (= res!690623 (= (getValueByKey!590 (toList!6930 lt!456101) (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))))))))

(declare-fun b!1033674 () Bool)

(assert (=> b!1033674 (= e!584299 (contains!5994 (toList!6930 lt!456101) (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))))))

(assert (= (and d!123713 res!690624) b!1033673))

(assert (= (and b!1033673 res!690623) b!1033674))

(declare-fun m!952977 () Bool)

(assert (=> d!123713 m!952977))

(declare-fun m!952979 () Bool)

(assert (=> d!123713 m!952979))

(declare-fun m!952981 () Bool)

(assert (=> d!123713 m!952981))

(declare-fun m!952983 () Bool)

(assert (=> d!123713 m!952983))

(declare-fun m!952985 () Bool)

(assert (=> b!1033673 m!952985))

(declare-fun m!952987 () Bool)

(assert (=> b!1033674 m!952987))

(assert (=> b!1033552 d!123713))

(assert (=> b!1033552 d!123679))

(declare-fun d!123715 () Bool)

(assert (=> d!123715 (= (apply!899 (+!3130 lt!456022 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))) lt!456020) (get!16429 (getValueByKey!590 (toList!6930 (+!3130 lt!456022 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))) lt!456020)))))

(declare-fun bs!30193 () Bool)

(assert (= bs!30193 d!123715))

(declare-fun m!952989 () Bool)

(assert (=> bs!30193 m!952989))

(assert (=> bs!30193 m!952989))

(declare-fun m!952991 () Bool)

(assert (=> bs!30193 m!952991))

(assert (=> b!1033552 d!123715))

(declare-fun d!123717 () Bool)

(assert (=> d!123717 (= (apply!899 lt!456022 lt!456020) (get!16429 (getValueByKey!590 (toList!6930 lt!456022) lt!456020)))))

(declare-fun bs!30194 () Bool)

(assert (= bs!30194 d!123717))

(declare-fun m!952993 () Bool)

(assert (=> bs!30194 m!952993))

(assert (=> bs!30194 m!952993))

(declare-fun m!952995 () Bool)

(assert (=> bs!30194 m!952995))

(assert (=> b!1033552 d!123717))

(declare-fun b!1033676 () Bool)

(declare-fun e!584306 () ListLongMap!13829)

(declare-fun call!43659 () ListLongMap!13829)

(assert (=> b!1033676 (= e!584306 call!43659)))

(declare-fun b!1033677 () Bool)

(assert (=> b!1033677 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(assert (=> b!1033677 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31845 (_values!6249 thiss!1427))))))

(declare-fun e!584300 () Bool)

(declare-fun lt!456105 () ListLongMap!13829)

(assert (=> b!1033677 (= e!584300 (= (apply!899 lt!456105 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1033678 () Bool)

(declare-fun e!584301 () Bool)

(assert (=> b!1033678 (= e!584301 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1033678 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1033679 () Bool)

(declare-fun e!584303 () Bool)

(declare-fun e!584302 () Bool)

(assert (=> b!1033679 (= e!584303 e!584302)))

(declare-fun c!104380 () Bool)

(assert (=> b!1033679 (= c!104380 (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun b!1033680 () Bool)

(declare-fun lt!456110 () Unit!33713)

(declare-fun lt!456107 () Unit!33713)

(assert (=> b!1033680 (= lt!456110 lt!456107)))

(declare-fun lt!456109 () V!37563)

(declare-fun lt!456104 () (_ BitVec 64))

(declare-fun lt!456106 () (_ BitVec 64))

(declare-fun lt!456108 () ListLongMap!13829)

(assert (=> b!1033680 (not (contains!5992 (+!3130 lt!456108 (tuple2!15807 lt!456106 lt!456109)) lt!456104))))

(assert (=> b!1033680 (= lt!456107 (addStillNotContains!243 lt!456108 lt!456106 lt!456109 lt!456104))))

(assert (=> b!1033680 (= lt!456104 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1033680 (= lt!456109 (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1033680 (= lt!456106 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033680 (= lt!456108 call!43659)))

(assert (=> b!1033680 (= e!584306 (+!3130 call!43659 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1033681 () Bool)

(assert (=> b!1033681 (= e!584302 (isEmpty!931 lt!456105))))

(declare-fun bm!43656 () Bool)

(assert (=> bm!43656 (= call!43659 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!455915 (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427)))))

(declare-fun b!1033682 () Bool)

(declare-fun e!584304 () Bool)

(assert (=> b!1033682 (= e!584304 e!584303)))

(declare-fun c!104382 () Bool)

(assert (=> b!1033682 (= c!104382 e!584301)))

(declare-fun res!690628 () Bool)

(assert (=> b!1033682 (=> (not res!690628) (not e!584301))))

(assert (=> b!1033682 (= res!690628 (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun b!1033683 () Bool)

(declare-fun e!584305 () ListLongMap!13829)

(assert (=> b!1033683 (= e!584305 e!584306)))

(declare-fun c!104381 () Bool)

(assert (=> b!1033683 (= c!104381 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033684 () Bool)

(assert (=> b!1033684 (= e!584302 (= lt!456105 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!455915 (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427))))))

(declare-fun b!1033685 () Bool)

(assert (=> b!1033685 (= e!584305 (ListLongMap!13830 Nil!21936))))

(declare-fun b!1033686 () Bool)

(declare-fun res!690625 () Bool)

(assert (=> b!1033686 (=> (not res!690625) (not e!584304))))

(assert (=> b!1033686 (= res!690625 (not (contains!5992 lt!456105 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!123719 () Bool)

(assert (=> d!123719 e!584304))

(declare-fun res!690626 () Bool)

(assert (=> d!123719 (=> (not res!690626) (not e!584304))))

(assert (=> d!123719 (= res!690626 (not (contains!5992 lt!456105 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123719 (= lt!456105 e!584305)))

(declare-fun c!104383 () Bool)

(assert (=> d!123719 (= c!104383 (bvsge #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(assert (=> d!123719 (validMask!0 (mask!30078 thiss!1427))))

(assert (=> d!123719 (= (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!455915 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)) lt!456105)))

(declare-fun b!1033675 () Bool)

(assert (=> b!1033675 (= e!584303 e!584300)))

(assert (=> b!1033675 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun res!690627 () Bool)

(assert (=> b!1033675 (= res!690627 (contains!5992 lt!456105 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1033675 (=> (not res!690627) (not e!584300))))

(assert (= (and d!123719 c!104383) b!1033685))

(assert (= (and d!123719 (not c!104383)) b!1033683))

(assert (= (and b!1033683 c!104381) b!1033680))

(assert (= (and b!1033683 (not c!104381)) b!1033676))

(assert (= (or b!1033680 b!1033676) bm!43656))

(assert (= (and d!123719 res!690626) b!1033686))

(assert (= (and b!1033686 res!690625) b!1033682))

(assert (= (and b!1033682 res!690628) b!1033678))

(assert (= (and b!1033682 c!104382) b!1033675))

(assert (= (and b!1033682 (not c!104382)) b!1033679))

(assert (= (and b!1033675 res!690627) b!1033677))

(assert (= (and b!1033679 c!104380) b!1033684))

(assert (= (and b!1033679 (not c!104380)) b!1033681))

(declare-fun b_lambda!16043 () Bool)

(assert (=> (not b_lambda!16043) (not b!1033677)))

(assert (=> b!1033677 t!31125))

(declare-fun b_and!33259 () Bool)

(assert (= b_and!33257 (and (=> t!31125 result!14375) b_and!33259)))

(declare-fun b_lambda!16045 () Bool)

(assert (=> (not b_lambda!16045) (not b!1033680)))

(assert (=> b!1033680 t!31125))

(declare-fun b_and!33261 () Bool)

(assert (= b_and!33259 (and (=> t!31125 result!14375) b_and!33261)))

(declare-fun m!952997 () Bool)

(assert (=> b!1033684 m!952997))

(declare-fun m!952999 () Bool)

(assert (=> b!1033681 m!952999))

(declare-fun m!953001 () Bool)

(assert (=> d!123719 m!953001))

(assert (=> d!123719 m!952795))

(assert (=> b!1033683 m!952763))

(assert (=> b!1033683 m!952763))

(assert (=> b!1033683 m!952777))

(assert (=> b!1033675 m!952763))

(assert (=> b!1033675 m!952763))

(declare-fun m!953003 () Bool)

(assert (=> b!1033675 m!953003))

(assert (=> b!1033678 m!952763))

(assert (=> b!1033678 m!952763))

(assert (=> b!1033678 m!952777))

(assert (=> b!1033677 m!952763))

(declare-fun m!953005 () Bool)

(assert (=> b!1033677 m!953005))

(assert (=> b!1033677 m!952763))

(assert (=> b!1033677 m!952655))

(assert (=> b!1033677 m!952779))

(assert (=> b!1033677 m!952779))

(assert (=> b!1033677 m!952655))

(assert (=> b!1033677 m!952781))

(assert (=> bm!43656 m!952997))

(declare-fun m!953007 () Bool)

(assert (=> b!1033686 m!953007))

(declare-fun m!953009 () Bool)

(assert (=> b!1033680 m!953009))

(declare-fun m!953011 () Bool)

(assert (=> b!1033680 m!953011))

(assert (=> b!1033680 m!952763))

(assert (=> b!1033680 m!953009))

(declare-fun m!953013 () Bool)

(assert (=> b!1033680 m!953013))

(assert (=> b!1033680 m!952655))

(declare-fun m!953015 () Bool)

(assert (=> b!1033680 m!953015))

(assert (=> b!1033680 m!952779))

(assert (=> b!1033680 m!952779))

(assert (=> b!1033680 m!952655))

(assert (=> b!1033680 m!952781))

(assert (=> bm!43635 d!123719))

(declare-fun b!1033695 () Bool)

(declare-fun res!690639 () Bool)

(declare-fun e!584309 () Bool)

(assert (=> b!1033695 (=> (not res!690639) (not e!584309))))

(assert (=> b!1033695 (= res!690639 (and (= (size!31845 (_values!6249 lt!455914)) (bvadd (mask!30078 lt!455914) #b00000000000000000000000000000001)) (= (size!31844 (_keys!11402 lt!455914)) (size!31845 (_values!6249 lt!455914))) (bvsge (_size!2907 lt!455914) #b00000000000000000000000000000000) (bvsle (_size!2907 lt!455914) (bvadd (mask!30078 lt!455914) #b00000000000000000000000000000001))))))

(declare-fun b!1033696 () Bool)

(declare-fun res!690640 () Bool)

(assert (=> b!1033696 (=> (not res!690640) (not e!584309))))

(declare-fun size!31850 (LongMapFixedSize!5704) (_ BitVec 32))

(assert (=> b!1033696 (= res!690640 (bvsge (size!31850 lt!455914) (_size!2907 lt!455914)))))

(declare-fun b!1033698 () Bool)

(assert (=> b!1033698 (= e!584309 (and (bvsge (extraKeys!5958 lt!455914) #b00000000000000000000000000000000) (bvsle (extraKeys!5958 lt!455914) #b00000000000000000000000000000011) (bvsge (_vacant!2907 lt!455914) #b00000000000000000000000000000000)))))

(declare-fun b!1033697 () Bool)

(declare-fun res!690638 () Bool)

(assert (=> b!1033697 (=> (not res!690638) (not e!584309))))

(assert (=> b!1033697 (= res!690638 (= (size!31850 lt!455914) (bvadd (_size!2907 lt!455914) (bvsdiv (bvadd (extraKeys!5958 lt!455914) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!123721 () Bool)

(declare-fun res!690637 () Bool)

(assert (=> d!123721 (=> (not res!690637) (not e!584309))))

(assert (=> d!123721 (= res!690637 (validMask!0 (mask!30078 lt!455914)))))

(assert (=> d!123721 (= (simpleValid!405 lt!455914) e!584309)))

(assert (= (and d!123721 res!690637) b!1033695))

(assert (= (and b!1033695 res!690639) b!1033696))

(assert (= (and b!1033696 res!690640) b!1033697))

(assert (= (and b!1033697 res!690638) b!1033698))

(declare-fun m!953017 () Bool)

(assert (=> b!1033696 m!953017))

(assert (=> b!1033697 m!953017))

(declare-fun m!953019 () Bool)

(assert (=> d!123721 m!953019))

(assert (=> d!123669 d!123721))

(declare-fun bm!43659 () Bool)

(declare-fun call!43662 () (_ BitVec 32))

(assert (=> bm!43659 (= call!43662 (arrayCountValidKeys!0 (_keys!11402 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun b!1033707 () Bool)

(declare-fun e!584314 () (_ BitVec 32))

(assert (=> b!1033707 (= e!584314 call!43662)))

(declare-fun b!1033708 () Bool)

(declare-fun e!584315 () (_ BitVec 32))

(assert (=> b!1033708 (= e!584315 #b00000000000000000000000000000000)))

(declare-fun d!123723 () Bool)

(declare-fun lt!456113 () (_ BitVec 32))

(assert (=> d!123723 (and (bvsge lt!456113 #b00000000000000000000000000000000) (bvsle lt!456113 (bvsub (size!31844 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123723 (= lt!456113 e!584315)))

(declare-fun c!104388 () Bool)

(assert (=> d!123723 (= c!104388 (bvsge #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))))))

(assert (=> d!123723 (and (bvsle #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31844 (_keys!11402 thiss!1427)) (size!31844 (_keys!11402 thiss!1427))))))

(assert (=> d!123723 (= (arrayCountValidKeys!0 (_keys!11402 thiss!1427) #b00000000000000000000000000000000 (size!31844 (_keys!11402 thiss!1427))) lt!456113)))

(declare-fun b!1033709 () Bool)

(assert (=> b!1033709 (= e!584315 e!584314)))

(declare-fun c!104389 () Bool)

(assert (=> b!1033709 (= c!104389 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033710 () Bool)

(assert (=> b!1033710 (= e!584314 (bvadd #b00000000000000000000000000000001 call!43662))))

(assert (= (and d!123723 c!104388) b!1033708))

(assert (= (and d!123723 (not c!104388)) b!1033709))

(assert (= (and b!1033709 c!104389) b!1033710))

(assert (= (and b!1033709 (not c!104389)) b!1033707))

(assert (= (or b!1033710 b!1033707) bm!43659))

(declare-fun m!953021 () Bool)

(assert (=> bm!43659 m!953021))

(assert (=> b!1033709 m!952763))

(assert (=> b!1033709 m!952763))

(assert (=> b!1033709 m!952777))

(assert (=> b!1033480 d!123723))

(declare-fun b!1033711 () Bool)

(declare-fun res!690643 () Bool)

(declare-fun e!584316 () Bool)

(assert (=> b!1033711 (=> (not res!690643) (not e!584316))))

(assert (=> b!1033711 (= res!690643 (and (= (size!31845 (_values!6249 thiss!1427)) (bvadd (mask!30078 thiss!1427) #b00000000000000000000000000000001)) (= (size!31844 (_keys!11402 thiss!1427)) (size!31845 (_values!6249 thiss!1427))) (bvsge (_size!2907 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2907 thiss!1427) (bvadd (mask!30078 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1033712 () Bool)

(declare-fun res!690644 () Bool)

(assert (=> b!1033712 (=> (not res!690644) (not e!584316))))

(assert (=> b!1033712 (= res!690644 (bvsge (size!31850 thiss!1427) (_size!2907 thiss!1427)))))

(declare-fun b!1033714 () Bool)

(assert (=> b!1033714 (= e!584316 (and (bvsge (extraKeys!5958 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5958 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2907 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1033713 () Bool)

(declare-fun res!690642 () Bool)

(assert (=> b!1033713 (=> (not res!690642) (not e!584316))))

(assert (=> b!1033713 (= res!690642 (= (size!31850 thiss!1427) (bvadd (_size!2907 thiss!1427) (bvsdiv (bvadd (extraKeys!5958 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!123725 () Bool)

(declare-fun res!690641 () Bool)

(assert (=> d!123725 (=> (not res!690641) (not e!584316))))

(assert (=> d!123725 (= res!690641 (validMask!0 (mask!30078 thiss!1427)))))

(assert (=> d!123725 (= (simpleValid!405 thiss!1427) e!584316)))

(assert (= (and d!123725 res!690641) b!1033711))

(assert (= (and b!1033711 res!690643) b!1033712))

(assert (= (and b!1033712 res!690644) b!1033713))

(assert (= (and b!1033713 res!690642) b!1033714))

(declare-fun m!953023 () Bool)

(assert (=> b!1033712 m!953023))

(assert (=> b!1033713 m!953023))

(assert (=> d!123725 m!952795))

(assert (=> d!123665 d!123725))

(declare-fun d!123727 () Bool)

(assert (=> d!123727 (= (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1033551 d!123727))

(declare-fun d!123729 () Bool)

(assert (=> d!123729 (= (apply!899 lt!456002 lt!455993) (get!16429 (getValueByKey!590 (toList!6930 lt!456002) lt!455993)))))

(declare-fun bs!30195 () Bool)

(assert (= bs!30195 d!123729))

(declare-fun m!953025 () Bool)

(assert (=> bs!30195 m!953025))

(assert (=> bs!30195 m!953025))

(declare-fun m!953027 () Bool)

(assert (=> bs!30195 m!953027))

(assert (=> b!1033528 d!123729))

(declare-fun d!123731 () Bool)

(declare-fun e!584317 () Bool)

(assert (=> d!123731 e!584317))

(declare-fun res!690646 () Bool)

(assert (=> d!123731 (=> (not res!690646) (not e!584317))))

(declare-fun lt!456115 () ListLongMap!13829)

(assert (=> d!123731 (= res!690646 (contains!5992 lt!456115 (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456117 () List!21939)

(assert (=> d!123731 (= lt!456115 (ListLongMap!13830 lt!456117))))

(declare-fun lt!456114 () Unit!33713)

(declare-fun lt!456116 () Unit!33713)

(assert (=> d!123731 (= lt!456114 lt!456116)))

(assert (=> d!123731 (= (getValueByKey!590 lt!456117 (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))))))

(assert (=> d!123731 (= lt!456116 (lemmaContainsTupThenGetReturnValue!280 lt!456117 (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))))))

(assert (=> d!123731 (= lt!456117 (insertStrictlySorted!373 (toList!6930 lt!455983) (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))))))

(assert (=> d!123731 (= (+!3130 lt!455983 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))) lt!456115)))

(declare-fun b!1033715 () Bool)

(declare-fun res!690645 () Bool)

(assert (=> b!1033715 (=> (not res!690645) (not e!584317))))

(assert (=> b!1033715 (= res!690645 (= (getValueByKey!590 (toList!6930 lt!456115) (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))))))))

(declare-fun b!1033716 () Bool)

(assert (=> b!1033716 (= e!584317 (contains!5994 (toList!6930 lt!456115) (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))))))

(assert (= (and d!123731 res!690646) b!1033715))

(assert (= (and b!1033715 res!690645) b!1033716))

(declare-fun m!953029 () Bool)

(assert (=> d!123731 m!953029))

(declare-fun m!953031 () Bool)

(assert (=> d!123731 m!953031))

(declare-fun m!953033 () Bool)

(assert (=> d!123731 m!953033))

(declare-fun m!953035 () Bool)

(assert (=> d!123731 m!953035))

(declare-fun m!953037 () Bool)

(assert (=> b!1033715 m!953037))

(declare-fun m!953039 () Bool)

(assert (=> b!1033716 m!953039))

(assert (=> b!1033528 d!123731))

(declare-fun d!123733 () Bool)

(assert (=> d!123733 (= (apply!899 (+!3130 lt!456002 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))) lt!455993) (apply!899 lt!456002 lt!455993))))

(declare-fun lt!456118 () Unit!33713)

(assert (=> d!123733 (= lt!456118 (choose!1705 lt!456002 lt!456001 (minValue!6062 thiss!1427) lt!455993))))

(declare-fun e!584318 () Bool)

(assert (=> d!123733 e!584318))

(declare-fun res!690647 () Bool)

(assert (=> d!123733 (=> (not res!690647) (not e!584318))))

(assert (=> d!123733 (= res!690647 (contains!5992 lt!456002 lt!455993))))

(assert (=> d!123733 (= (addApplyDifferent!474 lt!456002 lt!456001 (minValue!6062 thiss!1427) lt!455993) lt!456118)))

(declare-fun b!1033717 () Bool)

(assert (=> b!1033717 (= e!584318 (not (= lt!455993 lt!456001)))))

(assert (= (and d!123733 res!690647) b!1033717))

(declare-fun m!953041 () Bool)

(assert (=> d!123733 m!953041))

(declare-fun m!953043 () Bool)

(assert (=> d!123733 m!953043))

(assert (=> d!123733 m!952739))

(assert (=> d!123733 m!952745))

(assert (=> d!123733 m!952739))

(assert (=> d!123733 m!952769))

(assert (=> b!1033528 d!123733))

(declare-fun d!123735 () Bool)

(declare-fun e!584319 () Bool)

(assert (=> d!123735 e!584319))

(declare-fun res!690649 () Bool)

(assert (=> d!123735 (=> (not res!690649) (not e!584319))))

(declare-fun lt!456120 () ListLongMap!13829)

(assert (=> d!123735 (= res!690649 (contains!5992 lt!456120 (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456122 () List!21939)

(assert (=> d!123735 (= lt!456120 (ListLongMap!13830 lt!456122))))

(declare-fun lt!456119 () Unit!33713)

(declare-fun lt!456121 () Unit!33713)

(assert (=> d!123735 (= lt!456119 lt!456121)))

(assert (=> d!123735 (= (getValueByKey!590 lt!456122 (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))))))

(assert (=> d!123735 (= lt!456121 (lemmaContainsTupThenGetReturnValue!280 lt!456122 (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))))))

(assert (=> d!123735 (= lt!456122 (insertStrictlySorted!373 (toList!6930 lt!456002) (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))))))

(assert (=> d!123735 (= (+!3130 lt!456002 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))) lt!456120)))

(declare-fun b!1033718 () Bool)

(declare-fun res!690648 () Bool)

(assert (=> b!1033718 (=> (not res!690648) (not e!584319))))

(assert (=> b!1033718 (= res!690648 (= (getValueByKey!590 (toList!6930 lt!456120) (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))))))))

(declare-fun b!1033719 () Bool)

(assert (=> b!1033719 (= e!584319 (contains!5994 (toList!6930 lt!456120) (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))))))

(assert (= (and d!123735 res!690649) b!1033718))

(assert (= (and b!1033718 res!690648) b!1033719))

(declare-fun m!953045 () Bool)

(assert (=> d!123735 m!953045))

(declare-fun m!953047 () Bool)

(assert (=> d!123735 m!953047))

(declare-fun m!953049 () Bool)

(assert (=> d!123735 m!953049))

(declare-fun m!953051 () Bool)

(assert (=> d!123735 m!953051))

(declare-fun m!953053 () Bool)

(assert (=> b!1033718 m!953053))

(declare-fun m!953055 () Bool)

(assert (=> b!1033719 m!953055))

(assert (=> b!1033528 d!123735))

(declare-fun d!123737 () Bool)

(assert (=> d!123737 (= (apply!899 (+!3130 lt!456002 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))) lt!455993) (get!16429 (getValueByKey!590 (toList!6930 (+!3130 lt!456002 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))) lt!455993)))))

(declare-fun bs!30196 () Bool)

(assert (= bs!30196 d!123737))

(declare-fun m!953057 () Bool)

(assert (=> bs!30196 m!953057))

(assert (=> bs!30196 m!953057))

(declare-fun m!953059 () Bool)

(assert (=> bs!30196 m!953059))

(assert (=> b!1033528 d!123737))

(assert (=> b!1033528 d!123719))

(declare-fun d!123739 () Bool)

(assert (=> d!123739 (= (apply!899 (+!3130 lt!455983 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))) lt!455987) (apply!899 lt!455983 lt!455987))))

(declare-fun lt!456123 () Unit!33713)

(assert (=> d!123739 (= lt!456123 (choose!1705 lt!455983 lt!455989 (minValue!6062 thiss!1427) lt!455987))))

(declare-fun e!584320 () Bool)

(assert (=> d!123739 e!584320))

(declare-fun res!690650 () Bool)

(assert (=> d!123739 (=> (not res!690650) (not e!584320))))

(assert (=> d!123739 (= res!690650 (contains!5992 lt!455983 lt!455987))))

(assert (=> d!123739 (= (addApplyDifferent!474 lt!455983 lt!455989 (minValue!6062 thiss!1427) lt!455987) lt!456123)))

(declare-fun b!1033720 () Bool)

(assert (=> b!1033720 (= e!584320 (not (= lt!455987 lt!455989)))))

(assert (= (and d!123739 res!690650) b!1033720))

(declare-fun m!953061 () Bool)

(assert (=> d!123739 m!953061))

(declare-fun m!953063 () Bool)

(assert (=> d!123739 m!953063))

(assert (=> d!123739 m!952753))

(assert (=> d!123739 m!952755))

(assert (=> d!123739 m!952753))

(assert (=> d!123739 m!952747))

(assert (=> b!1033528 d!123739))

(declare-fun d!123741 () Bool)

(declare-fun e!584321 () Bool)

(assert (=> d!123741 e!584321))

(declare-fun res!690652 () Bool)

(assert (=> d!123741 (=> (not res!690652) (not e!584321))))

(declare-fun lt!456125 () ListLongMap!13829)

(assert (=> d!123741 (= res!690652 (contains!5992 lt!456125 (_1!7914 (tuple2!15807 lt!456000 lt!455915))))))

(declare-fun lt!456127 () List!21939)

(assert (=> d!123741 (= lt!456125 (ListLongMap!13830 lt!456127))))

(declare-fun lt!456124 () Unit!33713)

(declare-fun lt!456126 () Unit!33713)

(assert (=> d!123741 (= lt!456124 lt!456126)))

(assert (=> d!123741 (= (getValueByKey!590 lt!456127 (_1!7914 (tuple2!15807 lt!456000 lt!455915))) (Some!640 (_2!7914 (tuple2!15807 lt!456000 lt!455915))))))

(assert (=> d!123741 (= lt!456126 (lemmaContainsTupThenGetReturnValue!280 lt!456127 (_1!7914 (tuple2!15807 lt!456000 lt!455915)) (_2!7914 (tuple2!15807 lt!456000 lt!455915))))))

(assert (=> d!123741 (= lt!456127 (insertStrictlySorted!373 (toList!6930 lt!455986) (_1!7914 (tuple2!15807 lt!456000 lt!455915)) (_2!7914 (tuple2!15807 lt!456000 lt!455915))))))

(assert (=> d!123741 (= (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915)) lt!456125)))

(declare-fun b!1033721 () Bool)

(declare-fun res!690651 () Bool)

(assert (=> b!1033721 (=> (not res!690651) (not e!584321))))

(assert (=> b!1033721 (= res!690651 (= (getValueByKey!590 (toList!6930 lt!456125) (_1!7914 (tuple2!15807 lt!456000 lt!455915))) (Some!640 (_2!7914 (tuple2!15807 lt!456000 lt!455915)))))))

(declare-fun b!1033722 () Bool)

(assert (=> b!1033722 (= e!584321 (contains!5994 (toList!6930 lt!456125) (tuple2!15807 lt!456000 lt!455915)))))

(assert (= (and d!123741 res!690652) b!1033721))

(assert (= (and b!1033721 res!690651) b!1033722))

(declare-fun m!953065 () Bool)

(assert (=> d!123741 m!953065))

(declare-fun m!953067 () Bool)

(assert (=> d!123741 m!953067))

(declare-fun m!953069 () Bool)

(assert (=> d!123741 m!953069))

(declare-fun m!953071 () Bool)

(assert (=> d!123741 m!953071))

(declare-fun m!953073 () Bool)

(assert (=> b!1033721 m!953073))

(declare-fun m!953075 () Bool)

(assert (=> b!1033722 m!953075))

(assert (=> b!1033528 d!123741))

(declare-fun d!123743 () Bool)

(assert (=> d!123743 (= (apply!899 (+!3130 lt!455996 (tuple2!15807 lt!455991 lt!455915)) lt!455994) (get!16429 (getValueByKey!590 (toList!6930 (+!3130 lt!455996 (tuple2!15807 lt!455991 lt!455915))) lt!455994)))))

(declare-fun bs!30197 () Bool)

(assert (= bs!30197 d!123743))

(declare-fun m!953077 () Bool)

(assert (=> bs!30197 m!953077))

(assert (=> bs!30197 m!953077))

(declare-fun m!953079 () Bool)

(assert (=> bs!30197 m!953079))

(assert (=> b!1033528 d!123743))

(declare-fun d!123745 () Bool)

(declare-fun e!584322 () Bool)

(assert (=> d!123745 e!584322))

(declare-fun res!690654 () Bool)

(assert (=> d!123745 (=> (not res!690654) (not e!584322))))

(declare-fun lt!456129 () ListLongMap!13829)

(assert (=> d!123745 (= res!690654 (contains!5992 lt!456129 (_1!7914 (tuple2!15807 lt!455991 lt!455915))))))

(declare-fun lt!456131 () List!21939)

(assert (=> d!123745 (= lt!456129 (ListLongMap!13830 lt!456131))))

(declare-fun lt!456128 () Unit!33713)

(declare-fun lt!456130 () Unit!33713)

(assert (=> d!123745 (= lt!456128 lt!456130)))

(assert (=> d!123745 (= (getValueByKey!590 lt!456131 (_1!7914 (tuple2!15807 lt!455991 lt!455915))) (Some!640 (_2!7914 (tuple2!15807 lt!455991 lt!455915))))))

(assert (=> d!123745 (= lt!456130 (lemmaContainsTupThenGetReturnValue!280 lt!456131 (_1!7914 (tuple2!15807 lt!455991 lt!455915)) (_2!7914 (tuple2!15807 lt!455991 lt!455915))))))

(assert (=> d!123745 (= lt!456131 (insertStrictlySorted!373 (toList!6930 lt!455996) (_1!7914 (tuple2!15807 lt!455991 lt!455915)) (_2!7914 (tuple2!15807 lt!455991 lt!455915))))))

(assert (=> d!123745 (= (+!3130 lt!455996 (tuple2!15807 lt!455991 lt!455915)) lt!456129)))

(declare-fun b!1033723 () Bool)

(declare-fun res!690653 () Bool)

(assert (=> b!1033723 (=> (not res!690653) (not e!584322))))

(assert (=> b!1033723 (= res!690653 (= (getValueByKey!590 (toList!6930 lt!456129) (_1!7914 (tuple2!15807 lt!455991 lt!455915))) (Some!640 (_2!7914 (tuple2!15807 lt!455991 lt!455915)))))))

(declare-fun b!1033724 () Bool)

(assert (=> b!1033724 (= e!584322 (contains!5994 (toList!6930 lt!456129) (tuple2!15807 lt!455991 lt!455915)))))

(assert (= (and d!123745 res!690654) b!1033723))

(assert (= (and b!1033723 res!690653) b!1033724))

(declare-fun m!953081 () Bool)

(assert (=> d!123745 m!953081))

(declare-fun m!953083 () Bool)

(assert (=> d!123745 m!953083))

(declare-fun m!953085 () Bool)

(assert (=> d!123745 m!953085))

(declare-fun m!953087 () Bool)

(assert (=> d!123745 m!953087))

(declare-fun m!953089 () Bool)

(assert (=> b!1033723 m!953089))

(declare-fun m!953091 () Bool)

(assert (=> b!1033724 m!953091))

(assert (=> b!1033528 d!123745))

(declare-fun d!123747 () Bool)

(assert (=> d!123747 (= (apply!899 lt!455996 lt!455994) (get!16429 (getValueByKey!590 (toList!6930 lt!455996) lt!455994)))))

(declare-fun bs!30198 () Bool)

(assert (= bs!30198 d!123747))

(declare-fun m!953093 () Bool)

(assert (=> bs!30198 m!953093))

(assert (=> bs!30198 m!953093))

(declare-fun m!953095 () Bool)

(assert (=> bs!30198 m!953095))

(assert (=> b!1033528 d!123747))

(declare-fun d!123749 () Bool)

(assert (=> d!123749 (= (apply!899 (+!3130 lt!455996 (tuple2!15807 lt!455991 lt!455915)) lt!455994) (apply!899 lt!455996 lt!455994))))

(declare-fun lt!456132 () Unit!33713)

(assert (=> d!123749 (= lt!456132 (choose!1705 lt!455996 lt!455991 lt!455915 lt!455994))))

(declare-fun e!584323 () Bool)

(assert (=> d!123749 e!584323))

(declare-fun res!690655 () Bool)

(assert (=> d!123749 (=> (not res!690655) (not e!584323))))

(assert (=> d!123749 (= res!690655 (contains!5992 lt!455996 lt!455994))))

(assert (=> d!123749 (= (addApplyDifferent!474 lt!455996 lt!455991 lt!455915 lt!455994) lt!456132)))

(declare-fun b!1033725 () Bool)

(assert (=> b!1033725 (= e!584323 (not (= lt!455994 lt!455991)))))

(assert (= (and d!123749 res!690655) b!1033725))

(declare-fun m!953097 () Bool)

(assert (=> d!123749 m!953097))

(declare-fun m!953099 () Bool)

(assert (=> d!123749 m!953099))

(assert (=> d!123749 m!952759))

(assert (=> d!123749 m!952761))

(assert (=> d!123749 m!952759))

(assert (=> d!123749 m!952767))

(assert (=> b!1033528 d!123749))

(declare-fun d!123751 () Bool)

(assert (=> d!123751 (= (apply!899 lt!455983 lt!455987) (get!16429 (getValueByKey!590 (toList!6930 lt!455983) lt!455987)))))

(declare-fun bs!30199 () Bool)

(assert (= bs!30199 d!123751))

(declare-fun m!953101 () Bool)

(assert (=> bs!30199 m!953101))

(assert (=> bs!30199 m!953101))

(declare-fun m!953103 () Bool)

(assert (=> bs!30199 m!953103))

(assert (=> b!1033528 d!123751))

(declare-fun d!123753 () Bool)

(declare-fun e!584324 () Bool)

(assert (=> d!123753 e!584324))

(declare-fun res!690656 () Bool)

(assert (=> d!123753 (=> res!690656 e!584324)))

(declare-fun lt!456133 () Bool)

(assert (=> d!123753 (= res!690656 (not lt!456133))))

(declare-fun lt!456136 () Bool)

(assert (=> d!123753 (= lt!456133 lt!456136)))

(declare-fun lt!456135 () Unit!33713)

(declare-fun e!584325 () Unit!33713)

(assert (=> d!123753 (= lt!456135 e!584325)))

(declare-fun c!104390 () Bool)

(assert (=> d!123753 (= c!104390 lt!456136)))

(assert (=> d!123753 (= lt!456136 (containsKey!563 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915))) lt!455982))))

(assert (=> d!123753 (= (contains!5992 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915)) lt!455982) lt!456133)))

(declare-fun b!1033726 () Bool)

(declare-fun lt!456134 () Unit!33713)

(assert (=> b!1033726 (= e!584325 lt!456134)))

(assert (=> b!1033726 (= lt!456134 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915))) lt!455982))))

(assert (=> b!1033726 (isDefined!438 (getValueByKey!590 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915))) lt!455982))))

(declare-fun b!1033727 () Bool)

(declare-fun Unit!33718 () Unit!33713)

(assert (=> b!1033727 (= e!584325 Unit!33718)))

(declare-fun b!1033728 () Bool)

(assert (=> b!1033728 (= e!584324 (isDefined!438 (getValueByKey!590 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915))) lt!455982)))))

(assert (= (and d!123753 c!104390) b!1033726))

(assert (= (and d!123753 (not c!104390)) b!1033727))

(assert (= (and d!123753 (not res!690656)) b!1033728))

(declare-fun m!953105 () Bool)

(assert (=> d!123753 m!953105))

(declare-fun m!953107 () Bool)

(assert (=> b!1033726 m!953107))

(declare-fun m!953109 () Bool)

(assert (=> b!1033726 m!953109))

(assert (=> b!1033726 m!953109))

(declare-fun m!953111 () Bool)

(assert (=> b!1033726 m!953111))

(assert (=> b!1033728 m!953109))

(assert (=> b!1033728 m!953109))

(assert (=> b!1033728 m!953111))

(assert (=> b!1033528 d!123753))

(declare-fun d!123755 () Bool)

(assert (=> d!123755 (contains!5992 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915)) lt!455982)))

(declare-fun lt!456137 () Unit!33713)

(assert (=> d!123755 (= lt!456137 (choose!1704 lt!455986 lt!456000 lt!455915 lt!455982))))

(assert (=> d!123755 (contains!5992 lt!455986 lt!455982)))

(assert (=> d!123755 (= (addStillContains!618 lt!455986 lt!456000 lt!455915 lt!455982) lt!456137)))

(declare-fun bs!30200 () Bool)

(assert (= bs!30200 d!123755))

(assert (=> bs!30200 m!952749))

(assert (=> bs!30200 m!952749))

(assert (=> bs!30200 m!952751))

(declare-fun m!953113 () Bool)

(assert (=> bs!30200 m!953113))

(declare-fun m!953115 () Bool)

(assert (=> bs!30200 m!953115))

(assert (=> b!1033528 d!123755))

(declare-fun d!123757 () Bool)

(assert (=> d!123757 (= (apply!899 (+!3130 lt!455983 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))) lt!455987) (get!16429 (getValueByKey!590 (toList!6930 (+!3130 lt!455983 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))) lt!455987)))))

(declare-fun bs!30201 () Bool)

(assert (= bs!30201 d!123757))

(declare-fun m!953117 () Bool)

(assert (=> bs!30201 m!953117))

(assert (=> bs!30201 m!953117))

(declare-fun m!953119 () Bool)

(assert (=> bs!30201 m!953119))

(assert (=> b!1033528 d!123757))

(declare-fun d!123759 () Bool)

(declare-fun e!584326 () Bool)

(assert (=> d!123759 e!584326))

(declare-fun res!690658 () Bool)

(assert (=> d!123759 (=> (not res!690658) (not e!584326))))

(declare-fun lt!456139 () ListLongMap!13829)

(assert (=> d!123759 (= res!690658 (contains!5992 lt!456139 (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun lt!456141 () List!21939)

(assert (=> d!123759 (= lt!456139 (ListLongMap!13830 lt!456141))))

(declare-fun lt!456138 () Unit!33713)

(declare-fun lt!456140 () Unit!33713)

(assert (=> d!123759 (= lt!456138 lt!456140)))

(assert (=> d!123759 (= (getValueByKey!590 lt!456141 (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) (Some!640 (_2!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!123759 (= lt!456140 (lemmaContainsTupThenGetReturnValue!280 lt!456141 (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!123759 (= lt!456141 (insertStrictlySorted!373 (toList!6930 (ite c!104347 call!43636 (ite c!104348 call!43642 call!43639))) (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!123759 (= (+!3130 (ite c!104347 call!43636 (ite c!104348 call!43642 call!43639)) (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!456139)))

(declare-fun b!1033729 () Bool)

(declare-fun res!690657 () Bool)

(assert (=> b!1033729 (=> (not res!690657) (not e!584326))))

(assert (=> b!1033729 (= res!690657 (= (getValueByKey!590 (toList!6930 lt!456139) (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) (Some!640 (_2!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1033730 () Bool)

(assert (=> b!1033730 (= e!584326 (contains!5994 (toList!6930 lt!456139) (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (= (and d!123759 res!690658) b!1033729))

(assert (= (and b!1033729 res!690657) b!1033730))

(declare-fun m!953121 () Bool)

(assert (=> d!123759 m!953121))

(declare-fun m!953123 () Bool)

(assert (=> d!123759 m!953123))

(declare-fun m!953125 () Bool)

(assert (=> d!123759 m!953125))

(declare-fun m!953127 () Bool)

(assert (=> d!123759 m!953127))

(declare-fun m!953129 () Bool)

(assert (=> b!1033729 m!953129))

(declare-fun m!953131 () Bool)

(assert (=> b!1033730 m!953131))

(assert (=> bm!43634 d!123759))

(declare-fun d!123761 () Bool)

(declare-fun e!584327 () Bool)

(assert (=> d!123761 e!584327))

(declare-fun res!690660 () Bool)

(assert (=> d!123761 (=> (not res!690660) (not e!584327))))

(declare-fun lt!456143 () ListLongMap!13829)

(assert (=> d!123761 (= res!690660 (contains!5992 lt!456143 (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun lt!456145 () List!21939)

(assert (=> d!123761 (= lt!456143 (ListLongMap!13830 lt!456145))))

(declare-fun lt!456142 () Unit!33713)

(declare-fun lt!456144 () Unit!33713)

(assert (=> d!123761 (= lt!456142 lt!456144)))

(assert (=> d!123761 (= (getValueByKey!590 lt!456145 (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) (Some!640 (_2!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!123761 (= lt!456144 (lemmaContainsTupThenGetReturnValue!280 lt!456145 (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!123761 (= lt!456145 (insertStrictlySorted!373 (toList!6930 (ite c!104353 call!43643 (ite c!104354 call!43649 call!43646))) (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!123761 (= (+!3130 (ite c!104353 call!43643 (ite c!104354 call!43649 call!43646)) (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!456143)))

(declare-fun b!1033731 () Bool)

(declare-fun res!690659 () Bool)

(assert (=> b!1033731 (=> (not res!690659) (not e!584327))))

(assert (=> b!1033731 (= res!690659 (= (getValueByKey!590 (toList!6930 lt!456143) (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) (Some!640 (_2!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1033732 () Bool)

(assert (=> b!1033732 (= e!584327 (contains!5994 (toList!6930 lt!456143) (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (= (and d!123761 res!690660) b!1033731))

(assert (= (and b!1033731 res!690659) b!1033732))

(declare-fun m!953133 () Bool)

(assert (=> d!123761 m!953133))

(declare-fun m!953135 () Bool)

(assert (=> d!123761 m!953135))

(declare-fun m!953137 () Bool)

(assert (=> d!123761 m!953137))

(declare-fun m!953139 () Bool)

(assert (=> d!123761 m!953139))

(declare-fun m!953141 () Bool)

(assert (=> b!1033731 m!953141))

(declare-fun m!953143 () Bool)

(assert (=> b!1033732 m!953143))

(assert (=> bm!43641 d!123761))

(assert (=> b!1033527 d!123727))

(declare-fun d!123763 () Bool)

(assert (=> d!123763 (= (apply!899 lt!456029 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16429 (getValueByKey!590 (toList!6930 lt!456029) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30202 () Bool)

(assert (= bs!30202 d!123763))

(declare-fun m!953145 () Bool)

(assert (=> bs!30202 m!953145))

(assert (=> bs!30202 m!953145))

(declare-fun m!953147 () Bool)

(assert (=> bs!30202 m!953147))

(assert (=> b!1033549 d!123763))

(assert (=> d!123671 d!123667))

(assert (=> d!123671 d!123681))

(declare-fun d!123765 () Bool)

(assert (=> d!123765 (= (-!522 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!455915 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(assert (=> d!123765 true))

(declare-fun _$11!31 () Unit!33713)

(assert (=> d!123765 (= (choose!1703 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) (zeroValue!6062 thiss!1427) lt!455915 (minValue!6062 thiss!1427) (defaultEntry!6226 thiss!1427)) _$11!31)))

(declare-fun bs!30203 () Bool)

(assert (= bs!30203 d!123765))

(assert (=> bs!30203 m!952661))

(assert (=> bs!30203 m!952661))

(assert (=> bs!30203 m!952663))

(assert (=> bs!30203 m!952657))

(assert (=> d!123671 d!123765))

(assert (=> d!123671 d!123673))

(assert (=> d!123671 d!123675))

(declare-fun d!123767 () Bool)

(declare-fun e!584328 () Bool)

(assert (=> d!123767 e!584328))

(declare-fun res!690661 () Bool)

(assert (=> d!123767 (=> res!690661 e!584328)))

(declare-fun lt!456146 () Bool)

(assert (=> d!123767 (= res!690661 (not lt!456146))))

(declare-fun lt!456149 () Bool)

(assert (=> d!123767 (= lt!456146 lt!456149)))

(declare-fun lt!456148 () Unit!33713)

(declare-fun e!584329 () Unit!33713)

(assert (=> d!123767 (= lt!456148 e!584329)))

(declare-fun c!104391 () Bool)

(assert (=> d!123767 (= c!104391 lt!456149)))

(assert (=> d!123767 (= lt!456149 (containsKey!563 (toList!6930 lt!456029) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123767 (= (contains!5992 lt!456029 #b1000000000000000000000000000000000000000000000000000000000000000) lt!456146)))

(declare-fun b!1033733 () Bool)

(declare-fun lt!456147 () Unit!33713)

(assert (=> b!1033733 (= e!584329 lt!456147)))

(assert (=> b!1033733 (= lt!456147 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456029) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1033733 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456029) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033734 () Bool)

(declare-fun Unit!33719 () Unit!33713)

(assert (=> b!1033734 (= e!584329 Unit!33719)))

(declare-fun b!1033735 () Bool)

(assert (=> b!1033735 (= e!584328 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456029) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123767 c!104391) b!1033733))

(assert (= (and d!123767 (not c!104391)) b!1033734))

(assert (= (and d!123767 (not res!690661)) b!1033735))

(declare-fun m!953149 () Bool)

(assert (=> d!123767 m!953149))

(declare-fun m!953151 () Bool)

(assert (=> b!1033733 m!953151))

(declare-fun m!953153 () Bool)

(assert (=> b!1033733 m!953153))

(assert (=> b!1033733 m!953153))

(declare-fun m!953155 () Bool)

(assert (=> b!1033733 m!953155))

(assert (=> b!1033735 m!953153))

(assert (=> b!1033735 m!953153))

(assert (=> b!1033735 m!953155))

(assert (=> bm!43640 d!123767))

(declare-fun d!123769 () Bool)

(assert (=> d!123769 (= (apply!899 lt!456003 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16429 (getValueByKey!590 (toList!6930 lt!456003) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30204 () Bool)

(assert (= bs!30204 d!123769))

(declare-fun m!953157 () Bool)

(assert (=> bs!30204 m!953157))

(assert (=> bs!30204 m!953157))

(declare-fun m!953159 () Bool)

(assert (=> bs!30204 m!953159))

(assert (=> b!1033525 d!123769))

(declare-fun d!123771 () Bool)

(declare-fun e!584330 () Bool)

(assert (=> d!123771 e!584330))

(declare-fun res!690662 () Bool)

(assert (=> d!123771 (=> res!690662 e!584330)))

(declare-fun lt!456150 () Bool)

(assert (=> d!123771 (= res!690662 (not lt!456150))))

(declare-fun lt!456153 () Bool)

(assert (=> d!123771 (= lt!456150 lt!456153)))

(declare-fun lt!456152 () Unit!33713)

(declare-fun e!584331 () Unit!33713)

(assert (=> d!123771 (= lt!456152 e!584331)))

(declare-fun c!104392 () Bool)

(assert (=> d!123771 (= c!104392 lt!456153)))

(assert (=> d!123771 (= lt!456153 (containsKey!563 (toList!6930 lt!455937) key!909))))

(assert (=> d!123771 (= (contains!5992 lt!455937 key!909) lt!456150)))

(declare-fun b!1033736 () Bool)

(declare-fun lt!456151 () Unit!33713)

(assert (=> b!1033736 (= e!584331 lt!456151)))

(assert (=> b!1033736 (= lt!456151 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!455937) key!909))))

(assert (=> b!1033736 (isDefined!438 (getValueByKey!590 (toList!6930 lt!455937) key!909))))

(declare-fun b!1033737 () Bool)

(declare-fun Unit!33720 () Unit!33713)

(assert (=> b!1033737 (= e!584331 Unit!33720)))

(declare-fun b!1033738 () Bool)

(assert (=> b!1033738 (= e!584330 (isDefined!438 (getValueByKey!590 (toList!6930 lt!455937) key!909)))))

(assert (= (and d!123771 c!104392) b!1033736))

(assert (= (and d!123771 (not c!104392)) b!1033737))

(assert (= (and d!123771 (not res!690662)) b!1033738))

(declare-fun m!953161 () Bool)

(assert (=> d!123771 m!953161))

(declare-fun m!953163 () Bool)

(assert (=> b!1033736 m!953163))

(declare-fun m!953165 () Bool)

(assert (=> b!1033736 m!953165))

(assert (=> b!1033736 m!953165))

(declare-fun m!953167 () Bool)

(assert (=> b!1033736 m!953167))

(assert (=> b!1033738 m!953165))

(assert (=> b!1033738 m!953165))

(assert (=> b!1033738 m!953167))

(assert (=> d!123657 d!123771))

(declare-fun b!1033749 () Bool)

(declare-fun e!584340 () List!21939)

(assert (=> b!1033749 (= e!584340 (t!31126 (toList!6930 (map!14687 thiss!1427))))))

(declare-fun d!123773 () Bool)

(declare-fun e!584339 () Bool)

(assert (=> d!123773 e!584339))

(declare-fun res!690665 () Bool)

(assert (=> d!123773 (=> (not res!690665) (not e!584339))))

(declare-fun lt!456156 () List!21939)

(declare-fun isStrictlySorted!714 (List!21939) Bool)

(assert (=> d!123773 (= res!690665 (isStrictlySorted!714 lt!456156))))

(assert (=> d!123773 (= lt!456156 e!584340)))

(declare-fun c!104397 () Bool)

(assert (=> d!123773 (= c!104397 (and ((_ is Cons!21935) (toList!6930 (map!14687 thiss!1427))) (= (_1!7914 (h!23137 (toList!6930 (map!14687 thiss!1427)))) key!909)))))

(assert (=> d!123773 (isStrictlySorted!714 (toList!6930 (map!14687 thiss!1427)))))

(assert (=> d!123773 (= (removeStrictlySorted!56 (toList!6930 (map!14687 thiss!1427)) key!909) lt!456156)))

(declare-fun b!1033750 () Bool)

(declare-fun e!584338 () List!21939)

(assert (=> b!1033750 (= e!584338 Nil!21936)))

(declare-fun b!1033751 () Bool)

(assert (=> b!1033751 (= e!584340 e!584338)))

(declare-fun c!104398 () Bool)

(assert (=> b!1033751 (= c!104398 (and ((_ is Cons!21935) (toList!6930 (map!14687 thiss!1427))) (not (= (_1!7914 (h!23137 (toList!6930 (map!14687 thiss!1427)))) key!909))))))

(declare-fun b!1033752 () Bool)

(declare-fun $colon$colon!604 (List!21939 tuple2!15806) List!21939)

(assert (=> b!1033752 (= e!584338 ($colon$colon!604 (removeStrictlySorted!56 (t!31126 (toList!6930 (map!14687 thiss!1427))) key!909) (h!23137 (toList!6930 (map!14687 thiss!1427)))))))

(declare-fun b!1033753 () Bool)

(assert (=> b!1033753 (= e!584339 (not (containsKey!563 lt!456156 key!909)))))

(assert (= (and d!123773 c!104397) b!1033749))

(assert (= (and d!123773 (not c!104397)) b!1033751))

(assert (= (and b!1033751 c!104398) b!1033752))

(assert (= (and b!1033751 (not c!104398)) b!1033750))

(assert (= (and d!123773 res!690665) b!1033753))

(declare-fun m!953169 () Bool)

(assert (=> d!123773 m!953169))

(declare-fun m!953171 () Bool)

(assert (=> d!123773 m!953171))

(declare-fun m!953173 () Bool)

(assert (=> b!1033752 m!953173))

(assert (=> b!1033752 m!953173))

(declare-fun m!953175 () Bool)

(assert (=> b!1033752 m!953175))

(declare-fun m!953177 () Bool)

(assert (=> b!1033753 m!953177))

(assert (=> d!123657 d!123773))

(declare-fun d!123775 () Bool)

(declare-fun e!584341 () Bool)

(assert (=> d!123775 e!584341))

(declare-fun res!690666 () Bool)

(assert (=> d!123775 (=> res!690666 e!584341)))

(declare-fun lt!456157 () Bool)

(assert (=> d!123775 (= res!690666 (not lt!456157))))

(declare-fun lt!456160 () Bool)

(assert (=> d!123775 (= lt!456157 lt!456160)))

(declare-fun lt!456159 () Unit!33713)

(declare-fun e!584342 () Unit!33713)

(assert (=> d!123775 (= lt!456159 e!584342)))

(declare-fun c!104399 () Bool)

(assert (=> d!123775 (= c!104399 lt!456160)))

(assert (=> d!123775 (= lt!456160 (containsKey!563 (toList!6930 lt!456007) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123775 (= (contains!5992 lt!456007 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456157)))

(declare-fun b!1033754 () Bool)

(declare-fun lt!456158 () Unit!33713)

(assert (=> b!1033754 (= e!584342 lt!456158)))

(assert (=> b!1033754 (= lt!456158 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456007) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1033754 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456007) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033755 () Bool)

(declare-fun Unit!33721 () Unit!33713)

(assert (=> b!1033755 (= e!584342 Unit!33721)))

(declare-fun b!1033756 () Bool)

(assert (=> b!1033756 (= e!584341 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456007) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123775 c!104399) b!1033754))

(assert (= (and d!123775 (not c!104399)) b!1033755))

(assert (= (and d!123775 (not res!690666)) b!1033756))

(declare-fun m!953179 () Bool)

(assert (=> d!123775 m!953179))

(declare-fun m!953181 () Bool)

(assert (=> b!1033754 m!953181))

(declare-fun m!953183 () Bool)

(assert (=> b!1033754 m!953183))

(assert (=> b!1033754 m!953183))

(declare-fun m!953185 () Bool)

(assert (=> b!1033754 m!953185))

(assert (=> b!1033756 m!953183))

(assert (=> b!1033756 m!953183))

(assert (=> b!1033756 m!953185))

(assert (=> d!123673 d!123775))

(declare-fun b!1033757 () Bool)

(declare-fun e!584345 () List!21939)

(assert (=> b!1033757 (= e!584345 (t!31126 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))))

(declare-fun d!123777 () Bool)

(declare-fun e!584344 () Bool)

(assert (=> d!123777 e!584344))

(declare-fun res!690667 () Bool)

(assert (=> d!123777 (=> (not res!690667) (not e!584344))))

(declare-fun lt!456161 () List!21939)

(assert (=> d!123777 (= res!690667 (isStrictlySorted!714 lt!456161))))

(assert (=> d!123777 (= lt!456161 e!584345)))

(declare-fun c!104400 () Bool)

(assert (=> d!123777 (= c!104400 (and ((_ is Cons!21935) (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))) (= (_1!7914 (h!23137 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123777 (isStrictlySorted!714 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))))

(assert (=> d!123777 (= (removeStrictlySorted!56 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))) #b0000000000000000000000000000000000000000000000000000000000000000) lt!456161)))

(declare-fun b!1033758 () Bool)

(declare-fun e!584343 () List!21939)

(assert (=> b!1033758 (= e!584343 Nil!21936)))

(declare-fun b!1033759 () Bool)

(assert (=> b!1033759 (= e!584345 e!584343)))

(declare-fun c!104401 () Bool)

(assert (=> b!1033759 (= c!104401 (and ((_ is Cons!21935) (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))) (not (= (_1!7914 (h!23137 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1033760 () Bool)

(assert (=> b!1033760 (= e!584343 ($colon$colon!604 (removeStrictlySorted!56 (t!31126 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))) #b0000000000000000000000000000000000000000000000000000000000000000) (h!23137 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))))))

(declare-fun b!1033761 () Bool)

(assert (=> b!1033761 (= e!584344 (not (containsKey!563 lt!456161 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123777 c!104400) b!1033757))

(assert (= (and d!123777 (not c!104400)) b!1033759))

(assert (= (and b!1033759 c!104401) b!1033760))

(assert (= (and b!1033759 (not c!104401)) b!1033758))

(assert (= (and d!123777 res!690667) b!1033761))

(declare-fun m!953187 () Bool)

(assert (=> d!123777 m!953187))

(declare-fun m!953189 () Bool)

(assert (=> d!123777 m!953189))

(declare-fun m!953191 () Bool)

(assert (=> b!1033760 m!953191))

(assert (=> b!1033760 m!953191))

(declare-fun m!953193 () Bool)

(assert (=> b!1033760 m!953193))

(declare-fun m!953195 () Bool)

(assert (=> b!1033761 m!953195))

(assert (=> d!123673 d!123777))

(declare-fun d!123779 () Bool)

(declare-fun e!584346 () Bool)

(assert (=> d!123779 e!584346))

(declare-fun res!690668 () Bool)

(assert (=> d!123779 (=> res!690668 e!584346)))

(declare-fun lt!456162 () Bool)

(assert (=> d!123779 (= res!690668 (not lt!456162))))

(declare-fun lt!456165 () Bool)

(assert (=> d!123779 (= lt!456162 lt!456165)))

(declare-fun lt!456164 () Unit!33713)

(declare-fun e!584347 () Unit!33713)

(assert (=> d!123779 (= lt!456164 e!584347)))

(declare-fun c!104402 () Bool)

(assert (=> d!123779 (= c!104402 lt!456165)))

(assert (=> d!123779 (= lt!456165 (containsKey!563 (toList!6930 lt!456003) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123779 (= (contains!5992 lt!456003 #b1000000000000000000000000000000000000000000000000000000000000000) lt!456162)))

(declare-fun b!1033762 () Bool)

(declare-fun lt!456163 () Unit!33713)

(assert (=> b!1033762 (= e!584347 lt!456163)))

(assert (=> b!1033762 (= lt!456163 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456003) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1033762 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456003) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033763 () Bool)

(declare-fun Unit!33722 () Unit!33713)

(assert (=> b!1033763 (= e!584347 Unit!33722)))

(declare-fun b!1033764 () Bool)

(assert (=> b!1033764 (= e!584346 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456003) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123779 c!104402) b!1033762))

(assert (= (and d!123779 (not c!104402)) b!1033763))

(assert (= (and d!123779 (not res!690668)) b!1033764))

(declare-fun m!953197 () Bool)

(assert (=> d!123779 m!953197))

(declare-fun m!953199 () Bool)

(assert (=> b!1033762 m!953199))

(declare-fun m!953201 () Bool)

(assert (=> b!1033762 m!953201))

(assert (=> b!1033762 m!953201))

(declare-fun m!953203 () Bool)

(assert (=> b!1033762 m!953203))

(assert (=> b!1033764 m!953201))

(assert (=> b!1033764 m!953201))

(assert (=> b!1033764 m!953203))

(assert (=> bm!43633 d!123779))

(declare-fun d!123781 () Bool)

(declare-fun e!584348 () Bool)

(assert (=> d!123781 e!584348))

(declare-fun res!690669 () Bool)

(assert (=> d!123781 (=> res!690669 e!584348)))

(declare-fun lt!456166 () Bool)

(assert (=> d!123781 (= res!690669 (not lt!456166))))

(declare-fun lt!456169 () Bool)

(assert (=> d!123781 (= lt!456166 lt!456169)))

(declare-fun lt!456168 () Unit!33713)

(declare-fun e!584349 () Unit!33713)

(assert (=> d!123781 (= lt!456168 e!584349)))

(declare-fun c!104403 () Bool)

(assert (=> d!123781 (= c!104403 lt!456169)))

(assert (=> d!123781 (= lt!456169 (containsKey!563 (toList!6930 lt!456029) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123781 (= (contains!5992 lt!456029 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456166)))

(declare-fun b!1033765 () Bool)

(declare-fun lt!456167 () Unit!33713)

(assert (=> b!1033765 (= e!584349 lt!456167)))

(assert (=> b!1033765 (= lt!456167 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456029) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1033765 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456029) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033766 () Bool)

(declare-fun Unit!33723 () Unit!33713)

(assert (=> b!1033766 (= e!584349 Unit!33723)))

(declare-fun b!1033767 () Bool)

(assert (=> b!1033767 (= e!584348 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456029) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123781 c!104403) b!1033765))

(assert (= (and d!123781 (not c!104403)) b!1033766))

(assert (= (and d!123781 (not res!690669)) b!1033767))

(declare-fun m!953205 () Bool)

(assert (=> d!123781 m!953205))

(declare-fun m!953207 () Bool)

(assert (=> b!1033765 m!953207))

(assert (=> b!1033765 m!953145))

(assert (=> b!1033765 m!953145))

(declare-fun m!953209 () Bool)

(assert (=> b!1033765 m!953209))

(assert (=> b!1033767 m!953145))

(assert (=> b!1033767 m!953145))

(assert (=> b!1033767 m!953209))

(assert (=> bm!43644 d!123781))

(assert (=> d!123667 d!123681))

(declare-fun d!123783 () Bool)

(declare-fun e!584350 () Bool)

(assert (=> d!123783 e!584350))

(declare-fun res!690670 () Bool)

(assert (=> d!123783 (=> res!690670 e!584350)))

(declare-fun lt!456170 () Bool)

(assert (=> d!123783 (= res!690670 (not lt!456170))))

(declare-fun lt!456173 () Bool)

(assert (=> d!123783 (= lt!456170 lt!456173)))

(declare-fun lt!456172 () Unit!33713)

(declare-fun e!584351 () Unit!33713)

(assert (=> d!123783 (= lt!456172 e!584351)))

(declare-fun c!104404 () Bool)

(assert (=> d!123783 (= c!104404 lt!456173)))

(assert (=> d!123783 (= lt!456173 (containsKey!563 (toList!6930 lt!456003) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123783 (= (contains!5992 lt!456003 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456170)))

(declare-fun b!1033768 () Bool)

(declare-fun lt!456171 () Unit!33713)

(assert (=> b!1033768 (= e!584351 lt!456171)))

(assert (=> b!1033768 (= lt!456171 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456003) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1033768 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456003) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033769 () Bool)

(declare-fun Unit!33724 () Unit!33713)

(assert (=> b!1033769 (= e!584351 Unit!33724)))

(declare-fun b!1033770 () Bool)

(assert (=> b!1033770 (= e!584350 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456003) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123783 c!104404) b!1033768))

(assert (= (and d!123783 (not c!104404)) b!1033769))

(assert (= (and d!123783 (not res!690670)) b!1033770))

(declare-fun m!953211 () Bool)

(assert (=> d!123783 m!953211))

(declare-fun m!953213 () Bool)

(assert (=> b!1033768 m!953213))

(assert (=> b!1033768 m!953157))

(assert (=> b!1033768 m!953157))

(declare-fun m!953215 () Bool)

(assert (=> b!1033768 m!953215))

(assert (=> b!1033770 m!953157))

(assert (=> b!1033770 m!953157))

(assert (=> b!1033770 m!953215))

(assert (=> bm!43637 d!123783))

(declare-fun d!123785 () Bool)

(declare-fun e!584352 () Bool)

(assert (=> d!123785 e!584352))

(declare-fun res!690671 () Bool)

(assert (=> d!123785 (=> res!690671 e!584352)))

(declare-fun lt!456174 () Bool)

(assert (=> d!123785 (= res!690671 (not lt!456174))))

(declare-fun lt!456177 () Bool)

(assert (=> d!123785 (= lt!456174 lt!456177)))

(declare-fun lt!456176 () Unit!33713)

(declare-fun e!584353 () Unit!33713)

(assert (=> d!123785 (= lt!456176 e!584353)))

(declare-fun c!104405 () Bool)

(assert (=> d!123785 (= c!104405 lt!456177)))

(assert (=> d!123785 (= lt!456177 (containsKey!563 (toList!6930 lt!456029) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123785 (= (contains!5992 lt!456029 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) lt!456174)))

(declare-fun b!1033771 () Bool)

(declare-fun lt!456175 () Unit!33713)

(assert (=> b!1033771 (= e!584353 lt!456175)))

(assert (=> b!1033771 (= lt!456175 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456029) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1033771 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456029) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033772 () Bool)

(declare-fun Unit!33725 () Unit!33713)

(assert (=> b!1033772 (= e!584353 Unit!33725)))

(declare-fun b!1033773 () Bool)

(assert (=> b!1033773 (= e!584352 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456029) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!123785 c!104405) b!1033771))

(assert (= (and d!123785 (not c!104405)) b!1033772))

(assert (= (and d!123785 (not res!690671)) b!1033773))

(assert (=> d!123785 m!952763))

(declare-fun m!953217 () Bool)

(assert (=> d!123785 m!953217))

(assert (=> b!1033771 m!952763))

(declare-fun m!953219 () Bool)

(assert (=> b!1033771 m!953219))

(assert (=> b!1033771 m!952763))

(declare-fun m!953221 () Bool)

(assert (=> b!1033771 m!953221))

(assert (=> b!1033771 m!953221))

(declare-fun m!953223 () Bool)

(assert (=> b!1033771 m!953223))

(assert (=> b!1033773 m!952763))

(assert (=> b!1033773 m!953221))

(assert (=> b!1033773 m!953221))

(assert (=> b!1033773 m!953223))

(assert (=> b!1033560 d!123785))

(assert (=> b!1033537 d!123727))

(assert (=> b!1033561 d!123727))

(declare-fun d!123787 () Bool)

(declare-fun e!584354 () Bool)

(assert (=> d!123787 e!584354))

(declare-fun res!690673 () Bool)

(assert (=> d!123787 (=> (not res!690673) (not e!584354))))

(declare-fun lt!456179 () ListLongMap!13829)

(assert (=> d!123787 (= res!690673 (contains!5992 lt!456179 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456181 () List!21939)

(assert (=> d!123787 (= lt!456179 (ListLongMap!13830 lt!456181))))

(declare-fun lt!456178 () Unit!33713)

(declare-fun lt!456180 () Unit!33713)

(assert (=> d!123787 (= lt!456178 lt!456180)))

(assert (=> d!123787 (= (getValueByKey!590 lt!456181 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> d!123787 (= lt!456180 (lemmaContainsTupThenGetReturnValue!280 lt!456181 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> d!123787 (= lt!456181 (insertStrictlySorted!373 (toList!6930 call!43645) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> d!123787 (= (+!3130 call!43645 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) lt!456179)))

(declare-fun b!1033774 () Bool)

(declare-fun res!690672 () Bool)

(assert (=> b!1033774 (=> (not res!690672) (not e!584354))))

(assert (=> b!1033774 (= res!690672 (= (getValueByKey!590 (toList!6930 lt!456179) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1033775 () Bool)

(assert (=> b!1033775 (= e!584354 (contains!5994 (toList!6930 lt!456179) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(assert (= (and d!123787 res!690673) b!1033774))

(assert (= (and b!1033774 res!690672) b!1033775))

(declare-fun m!953225 () Bool)

(assert (=> d!123787 m!953225))

(declare-fun m!953227 () Bool)

(assert (=> d!123787 m!953227))

(declare-fun m!953229 () Bool)

(assert (=> d!123787 m!953229))

(declare-fun m!953231 () Bool)

(assert (=> d!123787 m!953231))

(declare-fun m!953233 () Bool)

(assert (=> b!1033774 m!953233))

(declare-fun m!953235 () Bool)

(assert (=> b!1033775 m!953235))

(assert (=> b!1033559 d!123787))

(declare-fun d!123789 () Bool)

(declare-fun e!584355 () Bool)

(assert (=> d!123789 e!584355))

(declare-fun res!690674 () Bool)

(assert (=> d!123789 (=> res!690674 e!584355)))

(declare-fun lt!456182 () Bool)

(assert (=> d!123789 (= res!690674 (not lt!456182))))

(declare-fun lt!456185 () Bool)

(assert (=> d!123789 (= lt!456182 lt!456185)))

(declare-fun lt!456184 () Unit!33713)

(declare-fun e!584356 () Unit!33713)

(assert (=> d!123789 (= lt!456184 e!584356)))

(declare-fun c!104406 () Bool)

(assert (=> d!123789 (= c!104406 lt!456185)))

(assert (=> d!123789 (= lt!456185 (containsKey!563 (toList!6930 lt!456003) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123789 (= (contains!5992 lt!456003 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) lt!456182)))

(declare-fun b!1033776 () Bool)

(declare-fun lt!456183 () Unit!33713)

(assert (=> b!1033776 (= e!584356 lt!456183)))

(assert (=> b!1033776 (= lt!456183 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456003) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1033776 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456003) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033777 () Bool)

(declare-fun Unit!33726 () Unit!33713)

(assert (=> b!1033777 (= e!584356 Unit!33726)))

(declare-fun b!1033778 () Bool)

(assert (=> b!1033778 (= e!584355 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456003) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!123789 c!104406) b!1033776))

(assert (= (and d!123789 (not c!104406)) b!1033777))

(assert (= (and d!123789 (not res!690674)) b!1033778))

(assert (=> d!123789 m!952763))

(declare-fun m!953237 () Bool)

(assert (=> d!123789 m!953237))

(assert (=> b!1033776 m!952763))

(declare-fun m!953239 () Bool)

(assert (=> b!1033776 m!953239))

(assert (=> b!1033776 m!952763))

(assert (=> b!1033776 m!952893))

(assert (=> b!1033776 m!952893))

(declare-fun m!953241 () Bool)

(assert (=> b!1033776 m!953241))

(assert (=> b!1033778 m!952763))

(assert (=> b!1033778 m!952893))

(assert (=> b!1033778 m!952893))

(assert (=> b!1033778 m!953241))

(assert (=> b!1033536 d!123789))

(assert (=> d!123659 d!123675))

(declare-fun bm!43660 () Bool)

(declare-fun call!43664 () Bool)

(declare-fun lt!456207 () ListLongMap!13829)

(assert (=> bm!43660 (= call!43664 (contains!5992 lt!456207 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!123791 () Bool)

(declare-fun e!584363 () Bool)

(assert (=> d!123791 e!584363))

(declare-fun res!690675 () Bool)

(assert (=> d!123791 (=> (not res!690675) (not e!584363))))

(assert (=> d!123791 (= res!690675 (or (bvsge #b00000000000000000000000000000000 (size!31844 (_keys!11402 lt!455914))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 lt!455914))))))))

(declare-fun lt!456201 () ListLongMap!13829)

(assert (=> d!123791 (= lt!456207 lt!456201)))

(declare-fun lt!456192 () Unit!33713)

(declare-fun e!584368 () Unit!33713)

(assert (=> d!123791 (= lt!456192 e!584368)))

(declare-fun c!104408 () Bool)

(declare-fun e!584362 () Bool)

(assert (=> d!123791 (= c!104408 e!584362)))

(declare-fun res!690682 () Bool)

(assert (=> d!123791 (=> (not res!690682) (not e!584362))))

(assert (=> d!123791 (= res!690682 (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 lt!455914))))))

(declare-fun e!584359 () ListLongMap!13829)

(assert (=> d!123791 (= lt!456201 e!584359)))

(declare-fun c!104410 () Bool)

(assert (=> d!123791 (= c!104410 (and (not (= (bvand (extraKeys!5958 lt!455914) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5958 lt!455914) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123791 (validMask!0 (mask!30078 lt!455914))))

(assert (=> d!123791 (= (getCurrentListMap!3897 (_keys!11402 lt!455914) (_values!6249 lt!455914) (mask!30078 lt!455914) (extraKeys!5958 lt!455914) (zeroValue!6062 lt!455914) (minValue!6062 lt!455914) #b00000000000000000000000000000000 (defaultEntry!6226 lt!455914)) lt!456207)))

(declare-fun b!1033779 () Bool)

(declare-fun e!584365 () Bool)

(assert (=> b!1033779 (= e!584365 (= (apply!899 lt!456207 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6062 lt!455914)))))

(declare-fun b!1033780 () Bool)

(declare-fun Unit!33727 () Unit!33713)

(assert (=> b!1033780 (= e!584368 Unit!33727)))

(declare-fun bm!43661 () Bool)

(declare-fun call!43669 () ListLongMap!13829)

(declare-fun c!104411 () Bool)

(declare-fun call!43665 () ListLongMap!13829)

(declare-fun call!43666 () ListLongMap!13829)

(declare-fun call!43663 () ListLongMap!13829)

(assert (=> bm!43661 (= call!43665 (+!3130 (ite c!104410 call!43663 (ite c!104411 call!43669 call!43666)) (ite (or c!104410 c!104411) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!455914)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914)))))))

(declare-fun b!1033781 () Bool)

(declare-fun e!584360 () Bool)

(assert (=> b!1033781 (= e!584360 (validKeyInArray!0 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)))))

(declare-fun b!1033782 () Bool)

(declare-fun lt!456194 () Unit!33713)

(assert (=> b!1033782 (= e!584368 lt!456194)))

(declare-fun lt!456190 () ListLongMap!13829)

(assert (=> b!1033782 (= lt!456190 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 lt!455914) (_values!6249 lt!455914) (mask!30078 lt!455914) (extraKeys!5958 lt!455914) (zeroValue!6062 lt!455914) (minValue!6062 lt!455914) #b00000000000000000000000000000000 (defaultEntry!6226 lt!455914)))))

(declare-fun lt!456204 () (_ BitVec 64))

(assert (=> b!1033782 (= lt!456204 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456186 () (_ BitVec 64))

(assert (=> b!1033782 (= lt!456186 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000))))

(declare-fun lt!456199 () Unit!33713)

(assert (=> b!1033782 (= lt!456199 (addStillContains!618 lt!456190 lt!456204 (zeroValue!6062 lt!455914) lt!456186))))

(assert (=> b!1033782 (contains!5992 (+!3130 lt!456190 (tuple2!15807 lt!456204 (zeroValue!6062 lt!455914))) lt!456186)))

(declare-fun lt!456202 () Unit!33713)

(assert (=> b!1033782 (= lt!456202 lt!456199)))

(declare-fun lt!456206 () ListLongMap!13829)

(assert (=> b!1033782 (= lt!456206 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 lt!455914) (_values!6249 lt!455914) (mask!30078 lt!455914) (extraKeys!5958 lt!455914) (zeroValue!6062 lt!455914) (minValue!6062 lt!455914) #b00000000000000000000000000000000 (defaultEntry!6226 lt!455914)))))

(declare-fun lt!456205 () (_ BitVec 64))

(assert (=> b!1033782 (= lt!456205 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456197 () (_ BitVec 64))

(assert (=> b!1033782 (= lt!456197 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000))))

(declare-fun lt!456188 () Unit!33713)

(assert (=> b!1033782 (= lt!456188 (addApplyDifferent!474 lt!456206 lt!456205 (minValue!6062 lt!455914) lt!456197))))

(assert (=> b!1033782 (= (apply!899 (+!3130 lt!456206 (tuple2!15807 lt!456205 (minValue!6062 lt!455914))) lt!456197) (apply!899 lt!456206 lt!456197))))

(declare-fun lt!456189 () Unit!33713)

(assert (=> b!1033782 (= lt!456189 lt!456188)))

(declare-fun lt!456200 () ListLongMap!13829)

(assert (=> b!1033782 (= lt!456200 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 lt!455914) (_values!6249 lt!455914) (mask!30078 lt!455914) (extraKeys!5958 lt!455914) (zeroValue!6062 lt!455914) (minValue!6062 lt!455914) #b00000000000000000000000000000000 (defaultEntry!6226 lt!455914)))))

(declare-fun lt!456195 () (_ BitVec 64))

(assert (=> b!1033782 (= lt!456195 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456198 () (_ BitVec 64))

(assert (=> b!1033782 (= lt!456198 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000))))

(declare-fun lt!456203 () Unit!33713)

(assert (=> b!1033782 (= lt!456203 (addApplyDifferent!474 lt!456200 lt!456195 (zeroValue!6062 lt!455914) lt!456198))))

(assert (=> b!1033782 (= (apply!899 (+!3130 lt!456200 (tuple2!15807 lt!456195 (zeroValue!6062 lt!455914))) lt!456198) (apply!899 lt!456200 lt!456198))))

(declare-fun lt!456196 () Unit!33713)

(assert (=> b!1033782 (= lt!456196 lt!456203)))

(declare-fun lt!456187 () ListLongMap!13829)

(assert (=> b!1033782 (= lt!456187 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 lt!455914) (_values!6249 lt!455914) (mask!30078 lt!455914) (extraKeys!5958 lt!455914) (zeroValue!6062 lt!455914) (minValue!6062 lt!455914) #b00000000000000000000000000000000 (defaultEntry!6226 lt!455914)))))

(declare-fun lt!456193 () (_ BitVec 64))

(assert (=> b!1033782 (= lt!456193 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456191 () (_ BitVec 64))

(assert (=> b!1033782 (= lt!456191 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000))))

(assert (=> b!1033782 (= lt!456194 (addApplyDifferent!474 lt!456187 lt!456193 (minValue!6062 lt!455914) lt!456191))))

(assert (=> b!1033782 (= (apply!899 (+!3130 lt!456187 (tuple2!15807 lt!456193 (minValue!6062 lt!455914))) lt!456191) (apply!899 lt!456187 lt!456191))))

(declare-fun bm!43662 () Bool)

(assert (=> bm!43662 (= call!43663 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 lt!455914) (_values!6249 lt!455914) (mask!30078 lt!455914) (extraKeys!5958 lt!455914) (zeroValue!6062 lt!455914) (minValue!6062 lt!455914) #b00000000000000000000000000000000 (defaultEntry!6226 lt!455914)))))

(declare-fun b!1033783 () Bool)

(declare-fun res!690679 () Bool)

(assert (=> b!1033783 (=> (not res!690679) (not e!584363))))

(declare-fun e!584358 () Bool)

(assert (=> b!1033783 (= res!690679 e!584358)))

(declare-fun c!104412 () Bool)

(assert (=> b!1033783 (= c!104412 (not (= (bvand (extraKeys!5958 lt!455914) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1033784 () Bool)

(declare-fun e!584369 () Bool)

(assert (=> b!1033784 (= e!584369 (= (apply!899 lt!456207 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)) (get!16428 (select (arr!31321 (_values!6249 lt!455914)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 lt!455914) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1033784 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31845 (_values!6249 lt!455914))))))

(assert (=> b!1033784 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 lt!455914))))))

(declare-fun b!1033785 () Bool)

(assert (=> b!1033785 (= e!584358 e!584365)))

(declare-fun res!690680 () Bool)

(declare-fun call!43668 () Bool)

(assert (=> b!1033785 (= res!690680 call!43668)))

(assert (=> b!1033785 (=> (not res!690680) (not e!584365))))

(declare-fun b!1033786 () Bool)

(declare-fun e!584357 () ListLongMap!13829)

(declare-fun call!43667 () ListLongMap!13829)

(assert (=> b!1033786 (= e!584357 call!43667)))

(declare-fun b!1033787 () Bool)

(declare-fun e!584361 () Bool)

(assert (=> b!1033787 (= e!584361 (= (apply!899 lt!456207 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6062 lt!455914)))))

(declare-fun b!1033788 () Bool)

(declare-fun e!584364 () ListLongMap!13829)

(assert (=> b!1033788 (= e!584364 call!43666)))

(declare-fun b!1033789 () Bool)

(assert (=> b!1033789 (= e!584359 (+!3130 call!43665 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914))))))

(declare-fun b!1033790 () Bool)

(declare-fun e!584366 () Bool)

(assert (=> b!1033790 (= e!584366 e!584369)))

(declare-fun res!690678 () Bool)

(assert (=> b!1033790 (=> (not res!690678) (not e!584369))))

(assert (=> b!1033790 (= res!690678 (contains!5992 lt!456207 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)))))

(assert (=> b!1033790 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 lt!455914))))))

(declare-fun b!1033791 () Bool)

(assert (=> b!1033791 (= e!584362 (validKeyInArray!0 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)))))

(declare-fun bm!43663 () Bool)

(assert (=> bm!43663 (= call!43666 call!43669)))

(declare-fun bm!43664 () Bool)

(assert (=> bm!43664 (= call!43668 (contains!5992 lt!456207 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033792 () Bool)

(declare-fun res!690677 () Bool)

(assert (=> b!1033792 (=> (not res!690677) (not e!584363))))

(assert (=> b!1033792 (= res!690677 e!584366)))

(declare-fun res!690676 () Bool)

(assert (=> b!1033792 (=> res!690676 e!584366)))

(assert (=> b!1033792 (= res!690676 (not e!584360))))

(declare-fun res!690683 () Bool)

(assert (=> b!1033792 (=> (not res!690683) (not e!584360))))

(assert (=> b!1033792 (= res!690683 (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 lt!455914))))))

(declare-fun b!1033793 () Bool)

(assert (=> b!1033793 (= e!584359 e!584357)))

(assert (=> b!1033793 (= c!104411 (and (not (= (bvand (extraKeys!5958 lt!455914) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5958 lt!455914) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1033794 () Bool)

(declare-fun e!584367 () Bool)

(assert (=> b!1033794 (= e!584367 (not call!43664))))

(declare-fun b!1033795 () Bool)

(assert (=> b!1033795 (= e!584363 e!584367)))

(declare-fun c!104407 () Bool)

(assert (=> b!1033795 (= c!104407 (not (= (bvand (extraKeys!5958 lt!455914) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43665 () Bool)

(assert (=> bm!43665 (= call!43667 call!43665)))

(declare-fun b!1033796 () Bool)

(declare-fun c!104409 () Bool)

(assert (=> b!1033796 (= c!104409 (and (not (= (bvand (extraKeys!5958 lt!455914) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5958 lt!455914) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1033796 (= e!584357 e!584364)))

(declare-fun b!1033797 () Bool)

(assert (=> b!1033797 (= e!584364 call!43667)))

(declare-fun bm!43666 () Bool)

(assert (=> bm!43666 (= call!43669 call!43663)))

(declare-fun b!1033798 () Bool)

(assert (=> b!1033798 (= e!584358 (not call!43668))))

(declare-fun b!1033799 () Bool)

(assert (=> b!1033799 (= e!584367 e!584361)))

(declare-fun res!690681 () Bool)

(assert (=> b!1033799 (= res!690681 call!43664)))

(assert (=> b!1033799 (=> (not res!690681) (not e!584361))))

(assert (= (and d!123791 c!104410) b!1033789))

(assert (= (and d!123791 (not c!104410)) b!1033793))

(assert (= (and b!1033793 c!104411) b!1033786))

(assert (= (and b!1033793 (not c!104411)) b!1033796))

(assert (= (and b!1033796 c!104409) b!1033797))

(assert (= (and b!1033796 (not c!104409)) b!1033788))

(assert (= (or b!1033797 b!1033788) bm!43663))

(assert (= (or b!1033786 bm!43663) bm!43666))

(assert (= (or b!1033786 b!1033797) bm!43665))

(assert (= (or b!1033789 bm!43666) bm!43662))

(assert (= (or b!1033789 bm!43665) bm!43661))

(assert (= (and d!123791 res!690682) b!1033791))

(assert (= (and d!123791 c!104408) b!1033782))

(assert (= (and d!123791 (not c!104408)) b!1033780))

(assert (= (and d!123791 res!690675) b!1033792))

(assert (= (and b!1033792 res!690683) b!1033781))

(assert (= (and b!1033792 (not res!690676)) b!1033790))

(assert (= (and b!1033790 res!690678) b!1033784))

(assert (= (and b!1033792 res!690677) b!1033783))

(assert (= (and b!1033783 c!104412) b!1033785))

(assert (= (and b!1033783 (not c!104412)) b!1033798))

(assert (= (and b!1033785 res!690680) b!1033779))

(assert (= (or b!1033785 b!1033798) bm!43664))

(assert (= (and b!1033783 res!690679) b!1033795))

(assert (= (and b!1033795 c!104407) b!1033799))

(assert (= (and b!1033795 (not c!104407)) b!1033794))

(assert (= (and b!1033799 res!690681) b!1033787))

(assert (= (or b!1033799 b!1033794) bm!43660))

(declare-fun b_lambda!16047 () Bool)

(assert (=> (not b_lambda!16047) (not b!1033784)))

(declare-fun t!31134 () Bool)

(declare-fun tb!7017 () Bool)

(assert (=> (and b!1033421 (= (defaultEntry!6226 thiss!1427) (defaultEntry!6226 lt!455914)) t!31134) tb!7017))

(declare-fun result!14389 () Bool)

(assert (=> tb!7017 (= result!14389 tp_is_empty!24517)))

(assert (=> b!1033784 t!31134))

(declare-fun b_and!33263 () Bool)

(assert (= b_and!33261 (and (=> t!31134 result!14389) b_and!33263)))

(declare-fun m!953243 () Bool)

(assert (=> b!1033782 m!953243))

(declare-fun m!953245 () Bool)

(assert (=> b!1033782 m!953245))

(declare-fun m!953247 () Bool)

(assert (=> b!1033782 m!953247))

(assert (=> b!1033782 m!953243))

(declare-fun m!953249 () Bool)

(assert (=> b!1033782 m!953249))

(declare-fun m!953251 () Bool)

(assert (=> b!1033782 m!953251))

(declare-fun m!953253 () Bool)

(assert (=> b!1033782 m!953253))

(declare-fun m!953255 () Bool)

(assert (=> b!1033782 m!953255))

(declare-fun m!953257 () Bool)

(assert (=> b!1033782 m!953257))

(declare-fun m!953259 () Bool)

(assert (=> b!1033782 m!953259))

(assert (=> b!1033782 m!953253))

(declare-fun m!953261 () Bool)

(assert (=> b!1033782 m!953261))

(declare-fun m!953263 () Bool)

(assert (=> b!1033782 m!953263))

(declare-fun m!953265 () Bool)

(assert (=> b!1033782 m!953265))

(declare-fun m!953267 () Bool)

(assert (=> b!1033782 m!953267))

(assert (=> b!1033782 m!953257))

(declare-fun m!953269 () Bool)

(assert (=> b!1033782 m!953269))

(declare-fun m!953271 () Bool)

(assert (=> b!1033782 m!953271))

(assert (=> b!1033782 m!953263))

(declare-fun m!953273 () Bool)

(assert (=> b!1033782 m!953273))

(declare-fun m!953275 () Bool)

(assert (=> b!1033782 m!953275))

(declare-fun m!953277 () Bool)

(assert (=> b!1033779 m!953277))

(declare-fun m!953279 () Bool)

(assert (=> bm!43660 m!953279))

(assert (=> b!1033781 m!953267))

(assert (=> b!1033781 m!953267))

(declare-fun m!953281 () Bool)

(assert (=> b!1033781 m!953281))

(declare-fun m!953283 () Bool)

(assert (=> b!1033784 m!953283))

(assert (=> b!1033784 m!953283))

(declare-fun m!953285 () Bool)

(assert (=> b!1033784 m!953285))

(declare-fun m!953287 () Bool)

(assert (=> b!1033784 m!953287))

(assert (=> b!1033784 m!953285))

(assert (=> b!1033784 m!953267))

(assert (=> b!1033784 m!953267))

(declare-fun m!953289 () Bool)

(assert (=> b!1033784 m!953289))

(declare-fun m!953291 () Bool)

(assert (=> b!1033787 m!953291))

(assert (=> bm!43662 m!953247))

(declare-fun m!953293 () Bool)

(assert (=> bm!43664 m!953293))

(declare-fun m!953295 () Bool)

(assert (=> b!1033789 m!953295))

(assert (=> b!1033791 m!953267))

(assert (=> b!1033791 m!953267))

(assert (=> b!1033791 m!953281))

(declare-fun m!953297 () Bool)

(assert (=> bm!43661 m!953297))

(assert (=> b!1033790 m!953267))

(assert (=> b!1033790 m!953267))

(declare-fun m!953299 () Bool)

(assert (=> b!1033790 m!953299))

(assert (=> d!123791 m!953019))

(assert (=> d!123655 d!123791))

(declare-fun b!1033800 () Bool)

(declare-fun e!584371 () Bool)

(assert (=> b!1033800 (= e!584371 (contains!5993 Nil!21938 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)))))

(declare-fun d!123793 () Bool)

(declare-fun res!690686 () Bool)

(declare-fun e!584370 () Bool)

(assert (=> d!123793 (=> res!690686 e!584370)))

(assert (=> d!123793 (= res!690686 (bvsge #b00000000000000000000000000000000 (size!31844 (_keys!11402 lt!455914))))))

(assert (=> d!123793 (= (arrayNoDuplicates!0 (_keys!11402 lt!455914) #b00000000000000000000000000000000 Nil!21938) e!584370)))

(declare-fun bm!43667 () Bool)

(declare-fun call!43670 () Bool)

(declare-fun c!104413 () Bool)

(assert (=> bm!43667 (= call!43670 (arrayNoDuplicates!0 (_keys!11402 lt!455914) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104413 (Cons!21937 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000) Nil!21938) Nil!21938)))))

(declare-fun b!1033801 () Bool)

(declare-fun e!584372 () Bool)

(assert (=> b!1033801 (= e!584372 call!43670)))

(declare-fun b!1033802 () Bool)

(assert (=> b!1033802 (= e!584372 call!43670)))

(declare-fun b!1033803 () Bool)

(declare-fun e!584373 () Bool)

(assert (=> b!1033803 (= e!584373 e!584372)))

(assert (=> b!1033803 (= c!104413 (validKeyInArray!0 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)))))

(declare-fun b!1033804 () Bool)

(assert (=> b!1033804 (= e!584370 e!584373)))

(declare-fun res!690684 () Bool)

(assert (=> b!1033804 (=> (not res!690684) (not e!584373))))

(assert (=> b!1033804 (= res!690684 (not e!584371))))

(declare-fun res!690685 () Bool)

(assert (=> b!1033804 (=> (not res!690685) (not e!584371))))

(assert (=> b!1033804 (= res!690685 (validKeyInArray!0 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)))))

(assert (= (and d!123793 (not res!690686)) b!1033804))

(assert (= (and b!1033804 res!690685) b!1033800))

(assert (= (and b!1033804 res!690684) b!1033803))

(assert (= (and b!1033803 c!104413) b!1033802))

(assert (= (and b!1033803 (not c!104413)) b!1033801))

(assert (= (or b!1033802 b!1033801) bm!43667))

(assert (=> b!1033800 m!953267))

(assert (=> b!1033800 m!953267))

(declare-fun m!953301 () Bool)

(assert (=> b!1033800 m!953301))

(assert (=> bm!43667 m!953267))

(declare-fun m!953303 () Bool)

(assert (=> bm!43667 m!953303))

(assert (=> b!1033803 m!953267))

(assert (=> b!1033803 m!953267))

(assert (=> b!1033803 m!953281))

(assert (=> b!1033804 m!953267))

(assert (=> b!1033804 m!953267))

(assert (=> b!1033804 m!953281))

(assert (=> b!1033548 d!123793))

(declare-fun d!123795 () Bool)

(declare-fun e!584374 () Bool)

(assert (=> d!123795 e!584374))

(declare-fun res!690688 () Bool)

(assert (=> d!123795 (=> (not res!690688) (not e!584374))))

(declare-fun lt!456209 () ListLongMap!13829)

(assert (=> d!123795 (= res!690688 (contains!5992 lt!456209 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456211 () List!21939)

(assert (=> d!123795 (= lt!456209 (ListLongMap!13830 lt!456211))))

(declare-fun lt!456208 () Unit!33713)

(declare-fun lt!456210 () Unit!33713)

(assert (=> d!123795 (= lt!456208 lt!456210)))

(assert (=> d!123795 (= (getValueByKey!590 lt!456211 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> d!123795 (= lt!456210 (lemmaContainsTupThenGetReturnValue!280 lt!456211 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> d!123795 (= lt!456211 (insertStrictlySorted!373 (toList!6930 call!43638) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> d!123795 (= (+!3130 call!43638 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) lt!456209)))

(declare-fun b!1033805 () Bool)

(declare-fun res!690687 () Bool)

(assert (=> b!1033805 (=> (not res!690687) (not e!584374))))

(assert (=> b!1033805 (= res!690687 (= (getValueByKey!590 (toList!6930 lt!456209) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1033806 () Bool)

(assert (=> b!1033806 (= e!584374 (contains!5994 (toList!6930 lt!456209) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(assert (= (and d!123795 res!690688) b!1033805))

(assert (= (and b!1033805 res!690687) b!1033806))

(declare-fun m!953305 () Bool)

(assert (=> d!123795 m!953305))

(declare-fun m!953307 () Bool)

(assert (=> d!123795 m!953307))

(declare-fun m!953309 () Bool)

(assert (=> d!123795 m!953309))

(declare-fun m!953311 () Bool)

(assert (=> d!123795 m!953311))

(declare-fun m!953313 () Bool)

(assert (=> b!1033805 m!953313))

(declare-fun m!953315 () Bool)

(assert (=> b!1033806 m!953315))

(assert (=> b!1033535 d!123795))

(declare-fun d!123797 () Bool)

(assert (=> d!123797 (= (apply!899 lt!456003 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16429 (getValueByKey!590 (toList!6930 lt!456003) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30205 () Bool)

(assert (= bs!30205 d!123797))

(assert (=> bs!30205 m!953201))

(assert (=> bs!30205 m!953201))

(declare-fun m!953317 () Bool)

(assert (=> bs!30205 m!953317))

(assert (=> b!1033533 d!123797))

(declare-fun d!123799 () Bool)

(assert (=> d!123799 (= (apply!899 lt!456029 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16429 (getValueByKey!590 (toList!6930 lt!456029) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30206 () Bool)

(assert (= bs!30206 d!123799))

(assert (=> bs!30206 m!953153))

(assert (=> bs!30206 m!953153))

(declare-fun m!953319 () Bool)

(assert (=> bs!30206 m!953319))

(assert (=> b!1033557 d!123799))

(declare-fun b!1033807 () Bool)

(declare-fun e!584375 () Bool)

(declare-fun e!584376 () Bool)

(assert (=> b!1033807 (= e!584375 e!584376)))

(declare-fun lt!456214 () (_ BitVec 64))

(assert (=> b!1033807 (= lt!456214 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000))))

(declare-fun lt!456212 () Unit!33713)

(assert (=> b!1033807 (= lt!456212 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11402 lt!455914) lt!456214 #b00000000000000000000000000000000))))

(assert (=> b!1033807 (arrayContainsKey!0 (_keys!11402 lt!455914) lt!456214 #b00000000000000000000000000000000)))

(declare-fun lt!456213 () Unit!33713)

(assert (=> b!1033807 (= lt!456213 lt!456212)))

(declare-fun res!690690 () Bool)

(assert (=> b!1033807 (= res!690690 (= (seekEntryOrOpen!0 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000) (_keys!11402 lt!455914) (mask!30078 lt!455914)) (Found!9729 #b00000000000000000000000000000000)))))

(assert (=> b!1033807 (=> (not res!690690) (not e!584376))))

(declare-fun b!1033808 () Bool)

(declare-fun e!584377 () Bool)

(assert (=> b!1033808 (= e!584377 e!584375)))

(declare-fun c!104414 () Bool)

(assert (=> b!1033808 (= c!104414 (validKeyInArray!0 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)))))

(declare-fun d!123801 () Bool)

(declare-fun res!690689 () Bool)

(assert (=> d!123801 (=> res!690689 e!584377)))

(assert (=> d!123801 (= res!690689 (bvsge #b00000000000000000000000000000000 (size!31844 (_keys!11402 lt!455914))))))

(assert (=> d!123801 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11402 lt!455914) (mask!30078 lt!455914)) e!584377)))

(declare-fun b!1033809 () Bool)

(declare-fun call!43671 () Bool)

(assert (=> b!1033809 (= e!584375 call!43671)))

(declare-fun b!1033810 () Bool)

(assert (=> b!1033810 (= e!584376 call!43671)))

(declare-fun bm!43668 () Bool)

(assert (=> bm!43668 (= call!43671 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11402 lt!455914) (mask!30078 lt!455914)))))

(assert (= (and d!123801 (not res!690689)) b!1033808))

(assert (= (and b!1033808 c!104414) b!1033807))

(assert (= (and b!1033808 (not c!104414)) b!1033809))

(assert (= (and b!1033807 res!690690) b!1033810))

(assert (= (or b!1033810 b!1033809) bm!43668))

(assert (=> b!1033807 m!953267))

(declare-fun m!953321 () Bool)

(assert (=> b!1033807 m!953321))

(declare-fun m!953323 () Bool)

(assert (=> b!1033807 m!953323))

(assert (=> b!1033807 m!953267))

(declare-fun m!953325 () Bool)

(assert (=> b!1033807 m!953325))

(assert (=> b!1033808 m!953267))

(assert (=> b!1033808 m!953267))

(assert (=> b!1033808 m!953281))

(declare-fun m!953327 () Bool)

(assert (=> bm!43668 m!953327))

(assert (=> b!1033547 d!123801))

(declare-fun bm!43669 () Bool)

(declare-fun call!43672 () (_ BitVec 32))

(assert (=> bm!43669 (= call!43672 (arrayCountValidKeys!0 (_keys!11402 lt!455914) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 lt!455914))))))

(declare-fun b!1033811 () Bool)

(declare-fun e!584378 () (_ BitVec 32))

(assert (=> b!1033811 (= e!584378 call!43672)))

(declare-fun b!1033812 () Bool)

(declare-fun e!584379 () (_ BitVec 32))

(assert (=> b!1033812 (= e!584379 #b00000000000000000000000000000000)))

(declare-fun d!123803 () Bool)

(declare-fun lt!456215 () (_ BitVec 32))

(assert (=> d!123803 (and (bvsge lt!456215 #b00000000000000000000000000000000) (bvsle lt!456215 (bvsub (size!31844 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)))))

(assert (=> d!123803 (= lt!456215 e!584379)))

(declare-fun c!104415 () Bool)

(assert (=> d!123803 (= c!104415 (bvsge #b00000000000000000000000000000000 (size!31844 (_keys!11402 lt!455914))))))

(assert (=> d!123803 (and (bvsle #b00000000000000000000000000000000 (size!31844 (_keys!11402 lt!455914))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31844 (_keys!11402 lt!455914)) (size!31844 (_keys!11402 lt!455914))))))

(assert (=> d!123803 (= (arrayCountValidKeys!0 (_keys!11402 lt!455914) #b00000000000000000000000000000000 (size!31844 (_keys!11402 lt!455914))) lt!456215)))

(declare-fun b!1033813 () Bool)

(assert (=> b!1033813 (= e!584379 e!584378)))

(declare-fun c!104416 () Bool)

(assert (=> b!1033813 (= c!104416 (validKeyInArray!0 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)))))

(declare-fun b!1033814 () Bool)

(assert (=> b!1033814 (= e!584378 (bvadd #b00000000000000000000000000000001 call!43672))))

(assert (= (and d!123803 c!104415) b!1033812))

(assert (= (and d!123803 (not c!104415)) b!1033813))

(assert (= (and b!1033813 c!104416) b!1033814))

(assert (= (and b!1033813 (not c!104416)) b!1033811))

(assert (= (or b!1033814 b!1033811) bm!43669))

(declare-fun m!953329 () Bool)

(assert (=> bm!43669 m!953329))

(assert (=> b!1033813 m!953267))

(assert (=> b!1033813 m!953267))

(assert (=> b!1033813 m!953281))

(assert (=> b!1033546 d!123803))

(declare-fun d!123805 () Bool)

(assert (=> d!123805 (= (apply!899 lt!456029 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) (get!16429 (getValueByKey!590 (toList!6930 lt!456029) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30207 () Bool)

(assert (= bs!30207 d!123805))

(assert (=> bs!30207 m!952763))

(assert (=> bs!30207 m!953221))

(assert (=> bs!30207 m!953221))

(declare-fun m!953331 () Bool)

(assert (=> bs!30207 m!953331))

(assert (=> b!1033554 d!123805))

(assert (=> b!1033554 d!123687))

(declare-fun b!1033816 () Bool)

(declare-fun e!584380 () Bool)

(assert (=> b!1033816 (= e!584380 tp_is_empty!24517)))

(declare-fun condMapEmpty!38268 () Bool)

(declare-fun mapDefault!38268 () ValueCell!11555)

(assert (=> mapNonEmpty!38267 (= condMapEmpty!38268 (= mapRest!38267 ((as const (Array (_ BitVec 32) ValueCell!11555)) mapDefault!38268)))))

(declare-fun mapRes!38268 () Bool)

(assert (=> mapNonEmpty!38267 (= tp!73506 (and e!584380 mapRes!38268))))

(declare-fun b!1033815 () Bool)

(declare-fun e!584381 () Bool)

(assert (=> b!1033815 (= e!584381 tp_is_empty!24517)))

(declare-fun mapNonEmpty!38268 () Bool)

(declare-fun tp!73507 () Bool)

(assert (=> mapNonEmpty!38268 (= mapRes!38268 (and tp!73507 e!584381))))

(declare-fun mapValue!38268 () ValueCell!11555)

(declare-fun mapRest!38268 () (Array (_ BitVec 32) ValueCell!11555))

(declare-fun mapKey!38268 () (_ BitVec 32))

(assert (=> mapNonEmpty!38268 (= mapRest!38267 (store mapRest!38268 mapKey!38268 mapValue!38268))))

(declare-fun mapIsEmpty!38268 () Bool)

(assert (=> mapIsEmpty!38268 mapRes!38268))

(assert (= (and mapNonEmpty!38267 condMapEmpty!38268) mapIsEmpty!38268))

(assert (= (and mapNonEmpty!38267 (not condMapEmpty!38268)) mapNonEmpty!38268))

(assert (= (and mapNonEmpty!38268 ((_ is ValueCellFull!11555) mapValue!38268)) b!1033815))

(assert (= (and mapNonEmpty!38267 ((_ is ValueCellFull!11555) mapDefault!38268)) b!1033816))

(declare-fun m!953333 () Bool)

(assert (=> mapNonEmpty!38268 m!953333))

(declare-fun b_lambda!16049 () Bool)

(assert (= b_lambda!16039 (or (and b!1033421 b_free!20797) b_lambda!16049)))

(declare-fun b_lambda!16051 () Bool)

(assert (= b_lambda!16043 (or (and b!1033421 b_free!20797) b_lambda!16051)))

(declare-fun b_lambda!16053 () Bool)

(assert (= b_lambda!16045 (or (and b!1033421 b_free!20797) b_lambda!16053)))

(declare-fun b_lambda!16055 () Bool)

(assert (= b_lambda!16041 (or (and b!1033421 b_free!20797) b_lambda!16055)))

(check-sat (not b!1033623) (not d!123707) (not b!1033645) (not d!123763) (not d!123805) (not b_lambda!16049) (not b!1033625) (not d!123715) (not b!1033638) (not d!123799) (not b!1033686) (not d!123737) (not b!1033724) (not d!123705) (not d!123711) (not d!123743) (not b!1033732) (not b!1033805) (not d!123735) b_and!33263 (not b!1033677) (not d!123689) (not b!1033775) (not b!1033733) (not d!123721) (not b!1033661) (not b!1033808) (not b!1033754) (not d!123787) (not b!1033760) (not b!1033680) (not d!123745) (not d!123699) (not b!1033715) (not d!123781) (not b!1033721) (not d!123769) (not bm!43667) (not d!123693) (not d!123713) (not b!1033776) (not d!123761) (not b!1033681) (not b!1033722) (not b!1033787) (not d!123741) (not d!123773) (not b!1033738) (not b!1033678) (not b!1033764) (not b_next!20797) (not b!1033803) (not b!1033791) (not b!1033761) (not b!1033653) (not d!123771) (not b_lambda!16029) (not d!123753) (not b!1033756) (not d!123703) (not d!123719) (not b!1033765) (not d!123729) (not d!123747) (not b!1033731) (not bm!43656) (not mapNonEmpty!38268) (not d!123709) (not b!1033712) (not b!1033784) (not b!1033628) (not d!123795) (not b!1033716) (not d!123767) (not b!1033728) tp_is_empty!24517 (not b!1033675) (not d!123717) (not b!1033770) (not b_lambda!16035) (not d!123755) (not d!123779) (not b!1033729) (not b!1033673) (not b!1033671) (not b_lambda!16051) (not b!1033588) (not d!123757) (not b!1033683) (not b_lambda!16037) (not b!1033655) (not b!1033718) (not b!1033646) (not b!1033726) (not b!1033660) (not b!1033806) (not b!1033723) (not d!123701) (not d!123751) (not b!1033782) (not b!1033773) (not b!1033762) (not b!1033696) (not bm!43649) (not b!1033779) (not b!1033619) (not b!1033807) (not b!1033736) (not b!1033684) (not b!1033697) (not bm!43669) (not b!1033771) (not b!1033768) (not b!1033767) (not bm!43662) (not b!1033790) (not b!1033591) (not d!123695) (not bm!43655) (not b!1033669) (not d!123725) (not b!1033752) (not d!123733) (not b!1033730) (not b!1033800) (not d!123765) (not bm!43668) (not d!123783) (not b!1033713) (not d!123759) (not d!123797) (not bm!43660) (not d!123685) (not b!1033753) (not b!1033620) (not b!1033626) (not bm!43659) (not d!123777) (not bm!43652) (not b!1033789) (not d!123679) (not b!1033617) (not b!1033813) (not d!123691) (not b!1033637) (not b!1033668) (not b!1033709) (not d!123785) (not b!1033592) (not b_lambda!16047) (not b!1033804) (not b!1033622) (not d!123749) (not d!123739) (not d!123775) (not b!1033719) (not bm!43661) (not b!1033774) (not b_lambda!16055) (not d!123789) (not d!123791) (not b!1033781) (not b!1033735) (not d!123697) (not b_lambda!16053) (not b!1033778) (not b!1033674) (not b!1033670) (not bm!43664) (not d!123731))
(check-sat b_and!33263 (not b_next!20797))
(get-model)

(assert (=> d!123705 d!123709))

(assert (=> d!123705 d!123715))

(assert (=> d!123705 d!123717))

(declare-fun d!123807 () Bool)

(assert (=> d!123807 (= (apply!899 (+!3130 lt!456022 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))) lt!456020) (apply!899 lt!456022 lt!456020))))

(assert (=> d!123807 true))

(declare-fun _$34!1164 () Unit!33713)

(assert (=> d!123807 (= (choose!1705 lt!456022 lt!456017 (zeroValue!6062 thiss!1427) lt!456020) _$34!1164)))

(declare-fun bs!30208 () Bool)

(assert (= bs!30208 d!123807))

(assert (=> bs!30208 m!952831))

(assert (=> bs!30208 m!952831))

(assert (=> bs!30208 m!952833))

(assert (=> bs!30208 m!952837))

(assert (=> d!123705 d!123807))

(declare-fun d!123809 () Bool)

(declare-fun e!584382 () Bool)

(assert (=> d!123809 e!584382))

(declare-fun res!690691 () Bool)

(assert (=> d!123809 (=> res!690691 e!584382)))

(declare-fun lt!456216 () Bool)

(assert (=> d!123809 (= res!690691 (not lt!456216))))

(declare-fun lt!456219 () Bool)

(assert (=> d!123809 (= lt!456216 lt!456219)))

(declare-fun lt!456218 () Unit!33713)

(declare-fun e!584383 () Unit!33713)

(assert (=> d!123809 (= lt!456218 e!584383)))

(declare-fun c!104417 () Bool)

(assert (=> d!123809 (= c!104417 lt!456219)))

(assert (=> d!123809 (= lt!456219 (containsKey!563 (toList!6930 lt!456022) lt!456020))))

(assert (=> d!123809 (= (contains!5992 lt!456022 lt!456020) lt!456216)))

(declare-fun b!1033818 () Bool)

(declare-fun lt!456217 () Unit!33713)

(assert (=> b!1033818 (= e!584383 lt!456217)))

(assert (=> b!1033818 (= lt!456217 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456022) lt!456020))))

(assert (=> b!1033818 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456022) lt!456020))))

(declare-fun b!1033819 () Bool)

(declare-fun Unit!33728 () Unit!33713)

(assert (=> b!1033819 (= e!584383 Unit!33728)))

(declare-fun b!1033820 () Bool)

(assert (=> b!1033820 (= e!584382 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456022) lt!456020)))))

(assert (= (and d!123809 c!104417) b!1033818))

(assert (= (and d!123809 (not c!104417)) b!1033819))

(assert (= (and d!123809 (not res!690691)) b!1033820))

(declare-fun m!953335 () Bool)

(assert (=> d!123809 m!953335))

(declare-fun m!953337 () Bool)

(assert (=> b!1033818 m!953337))

(assert (=> b!1033818 m!952993))

(assert (=> b!1033818 m!952993))

(declare-fun m!953339 () Bool)

(assert (=> b!1033818 m!953339))

(assert (=> b!1033820 m!952993))

(assert (=> b!1033820 m!952993))

(assert (=> b!1033820 m!953339))

(assert (=> d!123705 d!123809))

(declare-fun d!123811 () Bool)

(assert (=> d!123811 (= (get!16429 (getValueByKey!590 (toList!6930 lt!456029) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))) (v!14888 (getValueByKey!590 (toList!6930 lt!456029) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!123805 d!123811))

(declare-fun b!1033829 () Bool)

(declare-fun e!584388 () Option!641)

(assert (=> b!1033829 (= e!584388 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456029)))))))

(declare-fun b!1033832 () Bool)

(declare-fun e!584389 () Option!641)

(assert (=> b!1033832 (= e!584389 None!639)))

(declare-fun b!1033831 () Bool)

(assert (=> b!1033831 (= e!584389 (getValueByKey!590 (t!31126 (toList!6930 lt!456029)) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123813 () Bool)

(declare-fun c!104422 () Bool)

(assert (=> d!123813 (= c!104422 (and ((_ is Cons!21935) (toList!6930 lt!456029)) (= (_1!7914 (h!23137 (toList!6930 lt!456029))) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!123813 (= (getValueByKey!590 (toList!6930 lt!456029) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) e!584388)))

(declare-fun b!1033830 () Bool)

(assert (=> b!1033830 (= e!584388 e!584389)))

(declare-fun c!104423 () Bool)

(assert (=> b!1033830 (= c!104423 (and ((_ is Cons!21935) (toList!6930 lt!456029)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456029))) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))))

(assert (= (and d!123813 c!104422) b!1033829))

(assert (= (and d!123813 (not c!104422)) b!1033830))

(assert (= (and b!1033830 c!104423) b!1033831))

(assert (= (and b!1033830 (not c!104423)) b!1033832))

(assert (=> b!1033831 m!952763))

(declare-fun m!953341 () Bool)

(assert (=> b!1033831 m!953341))

(assert (=> d!123805 d!123813))

(declare-fun d!123815 () Bool)

(assert (=> d!123815 (= (apply!899 lt!456045 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) (get!16429 (getValueByKey!590 (toList!6930 lt!456045) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30209 () Bool)

(assert (= bs!30209 d!123815))

(assert (=> bs!30209 m!952763))

(declare-fun m!953343 () Bool)

(assert (=> bs!30209 m!953343))

(assert (=> bs!30209 m!953343))

(declare-fun m!953345 () Bool)

(assert (=> bs!30209 m!953345))

(assert (=> b!1033619 d!123815))

(assert (=> b!1033619 d!123687))

(declare-fun d!123817 () Bool)

(declare-fun res!690696 () Bool)

(declare-fun e!584394 () Bool)

(assert (=> d!123817 (=> res!690696 e!584394)))

(assert (=> d!123817 (= res!690696 (and ((_ is Cons!21935) lt!456156) (= (_1!7914 (h!23137 lt!456156)) key!909)))))

(assert (=> d!123817 (= (containsKey!563 lt!456156 key!909) e!584394)))

(declare-fun b!1033837 () Bool)

(declare-fun e!584395 () Bool)

(assert (=> b!1033837 (= e!584394 e!584395)))

(declare-fun res!690697 () Bool)

(assert (=> b!1033837 (=> (not res!690697) (not e!584395))))

(assert (=> b!1033837 (= res!690697 (and (or (not ((_ is Cons!21935) lt!456156)) (bvsle (_1!7914 (h!23137 lt!456156)) key!909)) ((_ is Cons!21935) lt!456156) (bvslt (_1!7914 (h!23137 lt!456156)) key!909)))))

(declare-fun b!1033838 () Bool)

(assert (=> b!1033838 (= e!584395 (containsKey!563 (t!31126 lt!456156) key!909))))

(assert (= (and d!123817 (not res!690696)) b!1033837))

(assert (= (and b!1033837 res!690697) b!1033838))

(declare-fun m!953347 () Bool)

(assert (=> b!1033838 m!953347))

(assert (=> b!1033753 d!123817))

(declare-fun d!123819 () Bool)

(declare-fun e!584396 () Bool)

(assert (=> d!123819 e!584396))

(declare-fun res!690698 () Bool)

(assert (=> d!123819 (=> res!690698 e!584396)))

(declare-fun lt!456220 () Bool)

(assert (=> d!123819 (= res!690698 (not lt!456220))))

(declare-fun lt!456223 () Bool)

(assert (=> d!123819 (= lt!456220 lt!456223)))

(declare-fun lt!456222 () Unit!33713)

(declare-fun e!584397 () Unit!33713)

(assert (=> d!123819 (= lt!456222 e!584397)))

(declare-fun c!104424 () Bool)

(assert (=> d!123819 (= c!104424 lt!456223)))

(assert (=> d!123819 (= lt!456223 (containsKey!563 (toList!6930 lt!456045) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123819 (= (contains!5992 lt!456045 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456220)))

(declare-fun b!1033839 () Bool)

(declare-fun lt!456221 () Unit!33713)

(assert (=> b!1033839 (= e!584397 lt!456221)))

(assert (=> b!1033839 (= lt!456221 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456045) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1033839 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456045) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033840 () Bool)

(declare-fun Unit!33729 () Unit!33713)

(assert (=> b!1033840 (= e!584397 Unit!33729)))

(declare-fun b!1033841 () Bool)

(assert (=> b!1033841 (= e!584396 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456045) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123819 c!104424) b!1033839))

(assert (= (and d!123819 (not c!104424)) b!1033840))

(assert (= (and d!123819 (not res!690698)) b!1033841))

(declare-fun m!953349 () Bool)

(assert (=> d!123819 m!953349))

(declare-fun m!953351 () Bool)

(assert (=> b!1033839 m!953351))

(declare-fun m!953353 () Bool)

(assert (=> b!1033839 m!953353))

(assert (=> b!1033839 m!953353))

(declare-fun m!953355 () Bool)

(assert (=> b!1033839 m!953355))

(assert (=> b!1033841 m!953353))

(assert (=> b!1033841 m!953353))

(assert (=> b!1033841 m!953355))

(assert (=> d!123679 d!123819))

(assert (=> d!123679 d!123681))

(declare-fun d!123821 () Bool)

(declare-fun lt!456226 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!512 (List!21939) (InoxSet tuple2!15806))

(assert (=> d!123821 (= lt!456226 (select (content!512 (toList!6930 lt!456096)) (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))))))

(declare-fun e!584403 () Bool)

(assert (=> d!123821 (= lt!456226 e!584403)))

(declare-fun res!690704 () Bool)

(assert (=> d!123821 (=> (not res!690704) (not e!584403))))

(assert (=> d!123821 (= res!690704 ((_ is Cons!21935) (toList!6930 lt!456096)))))

(assert (=> d!123821 (= (contains!5994 (toList!6930 lt!456096) (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))) lt!456226)))

(declare-fun b!1033846 () Bool)

(declare-fun e!584402 () Bool)

(assert (=> b!1033846 (= e!584403 e!584402)))

(declare-fun res!690703 () Bool)

(assert (=> b!1033846 (=> res!690703 e!584402)))

(assert (=> b!1033846 (= res!690703 (= (h!23137 (toList!6930 lt!456096)) (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))))))

(declare-fun b!1033847 () Bool)

(assert (=> b!1033847 (= e!584402 (contains!5994 (t!31126 (toList!6930 lt!456096)) (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))))))

(assert (= (and d!123821 res!690704) b!1033846))

(assert (= (and b!1033846 (not res!690703)) b!1033847))

(declare-fun m!953357 () Bool)

(assert (=> d!123821 m!953357))

(declare-fun m!953359 () Bool)

(assert (=> d!123821 m!953359))

(declare-fun m!953361 () Bool)

(assert (=> b!1033847 m!953361))

(assert (=> b!1033671 d!123821))

(declare-fun d!123823 () Bool)

(assert (=> d!123823 (= (get!16429 (getValueByKey!590 (toList!6930 lt!456003) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))) (v!14888 (getValueByKey!590 (toList!6930 lt!456003) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!123685 d!123823))

(declare-fun b!1033848 () Bool)

(declare-fun e!584404 () Option!641)

(assert (=> b!1033848 (= e!584404 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456003)))))))

(declare-fun b!1033851 () Bool)

(declare-fun e!584405 () Option!641)

(assert (=> b!1033851 (= e!584405 None!639)))

(declare-fun b!1033850 () Bool)

(assert (=> b!1033850 (= e!584405 (getValueByKey!590 (t!31126 (toList!6930 lt!456003)) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123825 () Bool)

(declare-fun c!104425 () Bool)

(assert (=> d!123825 (= c!104425 (and ((_ is Cons!21935) (toList!6930 lt!456003)) (= (_1!7914 (h!23137 (toList!6930 lt!456003))) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!123825 (= (getValueByKey!590 (toList!6930 lt!456003) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) e!584404)))

(declare-fun b!1033849 () Bool)

(assert (=> b!1033849 (= e!584404 e!584405)))

(declare-fun c!104426 () Bool)

(assert (=> b!1033849 (= c!104426 (and ((_ is Cons!21935) (toList!6930 lt!456003)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456003))) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))))

(assert (= (and d!123825 c!104425) b!1033848))

(assert (= (and d!123825 (not c!104425)) b!1033849))

(assert (= (and b!1033849 c!104426) b!1033850))

(assert (= (and b!1033849 (not c!104426)) b!1033851))

(assert (=> b!1033850 m!952763))

(declare-fun m!953363 () Bool)

(assert (=> b!1033850 m!953363))

(assert (=> d!123685 d!123825))

(declare-fun d!123827 () Bool)

(assert (=> d!123827 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456007) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!456229 () Unit!33713)

(declare-fun choose!1706 (List!21939 (_ BitVec 64)) Unit!33713)

(assert (=> d!123827 (= lt!456229 (choose!1706 (toList!6930 lt!456007) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!584408 () Bool)

(assert (=> d!123827 e!584408))

(declare-fun res!690707 () Bool)

(assert (=> d!123827 (=> (not res!690707) (not e!584408))))

(assert (=> d!123827 (= res!690707 (isStrictlySorted!714 (toList!6930 lt!456007)))))

(assert (=> d!123827 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456007) #b0000000000000000000000000000000000000000000000000000000000000000) lt!456229)))

(declare-fun b!1033854 () Bool)

(assert (=> b!1033854 (= e!584408 (containsKey!563 (toList!6930 lt!456007) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!123827 res!690707) b!1033854))

(assert (=> d!123827 m!953183))

(assert (=> d!123827 m!953183))

(assert (=> d!123827 m!953185))

(declare-fun m!953365 () Bool)

(assert (=> d!123827 m!953365))

(declare-fun m!953367 () Bool)

(assert (=> d!123827 m!953367))

(assert (=> b!1033854 m!953179))

(assert (=> b!1033754 d!123827))

(declare-fun d!123829 () Bool)

(declare-fun isEmpty!932 (Option!641) Bool)

(assert (=> d!123829 (= (isDefined!438 (getValueByKey!590 (toList!6930 lt!456007) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!932 (getValueByKey!590 (toList!6930 lt!456007) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30210 () Bool)

(assert (= bs!30210 d!123829))

(assert (=> bs!30210 m!953183))

(declare-fun m!953369 () Bool)

(assert (=> bs!30210 m!953369))

(assert (=> b!1033754 d!123829))

(declare-fun b!1033855 () Bool)

(declare-fun e!584409 () Option!641)

(assert (=> b!1033855 (= e!584409 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456007)))))))

(declare-fun b!1033858 () Bool)

(declare-fun e!584410 () Option!641)

(assert (=> b!1033858 (= e!584410 None!639)))

(declare-fun b!1033857 () Bool)

(assert (=> b!1033857 (= e!584410 (getValueByKey!590 (t!31126 (toList!6930 lt!456007)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!123831 () Bool)

(declare-fun c!104427 () Bool)

(assert (=> d!123831 (= c!104427 (and ((_ is Cons!21935) (toList!6930 lt!456007)) (= (_1!7914 (h!23137 (toList!6930 lt!456007))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123831 (= (getValueByKey!590 (toList!6930 lt!456007) #b0000000000000000000000000000000000000000000000000000000000000000) e!584409)))

(declare-fun b!1033856 () Bool)

(assert (=> b!1033856 (= e!584409 e!584410)))

(declare-fun c!104428 () Bool)

(assert (=> b!1033856 (= c!104428 (and ((_ is Cons!21935) (toList!6930 lt!456007)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456007))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!123831 c!104427) b!1033855))

(assert (= (and d!123831 (not c!104427)) b!1033856))

(assert (= (and b!1033856 c!104428) b!1033857))

(assert (= (and b!1033856 (not c!104428)) b!1033858))

(declare-fun m!953371 () Bool)

(assert (=> b!1033857 m!953371))

(assert (=> b!1033754 d!123831))

(declare-fun b!1033859 () Bool)

(declare-fun e!584411 () Bool)

(declare-fun e!584412 () Bool)

(assert (=> b!1033859 (= e!584411 e!584412)))

(declare-fun lt!456232 () (_ BitVec 64))

(assert (=> b!1033859 (= lt!456232 (select (arr!31320 (_keys!11402 lt!455914)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!456230 () Unit!33713)

(assert (=> b!1033859 (= lt!456230 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11402 lt!455914) lt!456232 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1033859 (arrayContainsKey!0 (_keys!11402 lt!455914) lt!456232 #b00000000000000000000000000000000)))

(declare-fun lt!456231 () Unit!33713)

(assert (=> b!1033859 (= lt!456231 lt!456230)))

(declare-fun res!690709 () Bool)

(assert (=> b!1033859 (= res!690709 (= (seekEntryOrOpen!0 (select (arr!31320 (_keys!11402 lt!455914)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!11402 lt!455914) (mask!30078 lt!455914)) (Found!9729 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1033859 (=> (not res!690709) (not e!584412))))

(declare-fun b!1033860 () Bool)

(declare-fun e!584413 () Bool)

(assert (=> b!1033860 (= e!584413 e!584411)))

(declare-fun c!104429 () Bool)

(assert (=> b!1033860 (= c!104429 (validKeyInArray!0 (select (arr!31320 (_keys!11402 lt!455914)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!123833 () Bool)

(declare-fun res!690708 () Bool)

(assert (=> d!123833 (=> res!690708 e!584413)))

(assert (=> d!123833 (= res!690708 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 lt!455914))))))

(assert (=> d!123833 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11402 lt!455914) (mask!30078 lt!455914)) e!584413)))

(declare-fun b!1033861 () Bool)

(declare-fun call!43673 () Bool)

(assert (=> b!1033861 (= e!584411 call!43673)))

(declare-fun b!1033862 () Bool)

(assert (=> b!1033862 (= e!584412 call!43673)))

(declare-fun bm!43670 () Bool)

(assert (=> bm!43670 (= call!43673 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!11402 lt!455914) (mask!30078 lt!455914)))))

(assert (= (and d!123833 (not res!690708)) b!1033860))

(assert (= (and b!1033860 c!104429) b!1033859))

(assert (= (and b!1033860 (not c!104429)) b!1033861))

(assert (= (and b!1033859 res!690709) b!1033862))

(assert (= (or b!1033862 b!1033861) bm!43670))

(declare-fun m!953373 () Bool)

(assert (=> b!1033859 m!953373))

(declare-fun m!953375 () Bool)

(assert (=> b!1033859 m!953375))

(declare-fun m!953377 () Bool)

(assert (=> b!1033859 m!953377))

(assert (=> b!1033859 m!953373))

(declare-fun m!953379 () Bool)

(assert (=> b!1033859 m!953379))

(assert (=> b!1033860 m!953373))

(assert (=> b!1033860 m!953373))

(declare-fun m!953381 () Bool)

(assert (=> b!1033860 m!953381))

(declare-fun m!953383 () Bool)

(assert (=> bm!43670 m!953383))

(assert (=> bm!43668 d!123833))

(declare-fun b!1033863 () Bool)

(declare-fun e!584414 () Option!641)

(assert (=> b!1033863 (= e!584414 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456139)))))))

(declare-fun b!1033866 () Bool)

(declare-fun e!584415 () Option!641)

(assert (=> b!1033866 (= e!584415 None!639)))

(declare-fun b!1033865 () Bool)

(assert (=> b!1033865 (= e!584415 (getValueByKey!590 (t!31126 (toList!6930 lt!456139)) (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun d!123835 () Bool)

(declare-fun c!104430 () Bool)

(assert (=> d!123835 (= c!104430 (and ((_ is Cons!21935) (toList!6930 lt!456139)) (= (_1!7914 (h!23137 (toList!6930 lt!456139))) (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (=> d!123835 (= (getValueByKey!590 (toList!6930 lt!456139) (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) e!584414)))

(declare-fun b!1033864 () Bool)

(assert (=> b!1033864 (= e!584414 e!584415)))

(declare-fun c!104431 () Bool)

(assert (=> b!1033864 (= c!104431 (and ((_ is Cons!21935) (toList!6930 lt!456139)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456139))) (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))))

(assert (= (and d!123835 c!104430) b!1033863))

(assert (= (and d!123835 (not c!104430)) b!1033864))

(assert (= (and b!1033864 c!104431) b!1033865))

(assert (= (and b!1033864 (not c!104431)) b!1033866))

(declare-fun m!953385 () Bool)

(assert (=> b!1033865 m!953385))

(assert (=> b!1033729 d!123835))

(declare-fun d!123837 () Bool)

(assert (=> d!123837 (= (validKeyInArray!0 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1033791 d!123837))

(declare-fun d!123839 () Bool)

(declare-fun e!584416 () Bool)

(assert (=> d!123839 e!584416))

(declare-fun res!690710 () Bool)

(assert (=> d!123839 (=> res!690710 e!584416)))

(declare-fun lt!456233 () Bool)

(assert (=> d!123839 (= res!690710 (not lt!456233))))

(declare-fun lt!456236 () Bool)

(assert (=> d!123839 (= lt!456233 lt!456236)))

(declare-fun lt!456235 () Unit!33713)

(declare-fun e!584417 () Unit!33713)

(assert (=> d!123839 (= lt!456235 e!584417)))

(declare-fun c!104432 () Bool)

(assert (=> d!123839 (= c!104432 lt!456236)))

(assert (=> d!123839 (= lt!456236 (containsKey!563 (toList!6930 lt!456081) (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))))))

(assert (=> d!123839 (= (contains!5992 lt!456081 (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))) lt!456233)))

(declare-fun b!1033867 () Bool)

(declare-fun lt!456234 () Unit!33713)

(assert (=> b!1033867 (= e!584417 lt!456234)))

(assert (=> b!1033867 (= lt!456234 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456081) (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))))))

(assert (=> b!1033867 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456081) (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))))))

(declare-fun b!1033868 () Bool)

(declare-fun Unit!33730 () Unit!33713)

(assert (=> b!1033868 (= e!584417 Unit!33730)))

(declare-fun b!1033869 () Bool)

(assert (=> b!1033869 (= e!584416 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456081) (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))))))))

(assert (= (and d!123839 c!104432) b!1033867))

(assert (= (and d!123839 (not c!104432)) b!1033868))

(assert (= (and d!123839 (not res!690710)) b!1033869))

(declare-fun m!953387 () Bool)

(assert (=> d!123839 m!953387))

(declare-fun m!953389 () Bool)

(assert (=> b!1033867 m!953389))

(assert (=> b!1033867 m!952929))

(assert (=> b!1033867 m!952929))

(declare-fun m!953391 () Bool)

(assert (=> b!1033867 m!953391))

(assert (=> b!1033869 m!952929))

(assert (=> b!1033869 m!952929))

(assert (=> b!1033869 m!953391))

(assert (=> d!123697 d!123839))

(declare-fun b!1033870 () Bool)

(declare-fun e!584418 () Option!641)

(assert (=> b!1033870 (= e!584418 (Some!640 (_2!7914 (h!23137 lt!456083))))))

(declare-fun b!1033873 () Bool)

(declare-fun e!584419 () Option!641)

(assert (=> b!1033873 (= e!584419 None!639)))

(declare-fun b!1033872 () Bool)

(assert (=> b!1033872 (= e!584419 (getValueByKey!590 (t!31126 lt!456083) (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))))))

(declare-fun c!104433 () Bool)

(declare-fun d!123841 () Bool)

(assert (=> d!123841 (= c!104433 (and ((_ is Cons!21935) lt!456083) (= (_1!7914 (h!23137 lt!456083)) (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))))))))

(assert (=> d!123841 (= (getValueByKey!590 lt!456083 (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))) e!584418)))

(declare-fun b!1033871 () Bool)

(assert (=> b!1033871 (= e!584418 e!584419)))

(declare-fun c!104434 () Bool)

(assert (=> b!1033871 (= c!104434 (and ((_ is Cons!21935) lt!456083) (not (= (_1!7914 (h!23137 lt!456083)) (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!123841 c!104433) b!1033870))

(assert (= (and d!123841 (not c!104433)) b!1033871))

(assert (= (and b!1033871 c!104434) b!1033872))

(assert (= (and b!1033871 (not c!104434)) b!1033873))

(declare-fun m!953393 () Bool)

(assert (=> b!1033872 m!953393))

(assert (=> d!123697 d!123841))

(declare-fun d!123843 () Bool)

(assert (=> d!123843 (= (getValueByKey!590 lt!456083 (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456239 () Unit!33713)

(declare-fun choose!1707 (List!21939 (_ BitVec 64) V!37563) Unit!33713)

(assert (=> d!123843 (= lt!456239 (choose!1707 lt!456083 (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))))))

(declare-fun e!584422 () Bool)

(assert (=> d!123843 e!584422))

(declare-fun res!690715 () Bool)

(assert (=> d!123843 (=> (not res!690715) (not e!584422))))

(assert (=> d!123843 (= res!690715 (isStrictlySorted!714 lt!456083))))

(assert (=> d!123843 (= (lemmaContainsTupThenGetReturnValue!280 lt!456083 (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))) lt!456239)))

(declare-fun b!1033878 () Bool)

(declare-fun res!690716 () Bool)

(assert (=> b!1033878 (=> (not res!690716) (not e!584422))))

(assert (=> b!1033878 (= res!690716 (containsKey!563 lt!456083 (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))))))

(declare-fun b!1033879 () Bool)

(assert (=> b!1033879 (= e!584422 (contains!5994 lt!456083 (tuple2!15807 (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))))))))

(assert (= (and d!123843 res!690715) b!1033878))

(assert (= (and b!1033878 res!690716) b!1033879))

(assert (=> d!123843 m!952923))

(declare-fun m!953395 () Bool)

(assert (=> d!123843 m!953395))

(declare-fun m!953397 () Bool)

(assert (=> d!123843 m!953397))

(declare-fun m!953399 () Bool)

(assert (=> b!1033878 m!953399))

(declare-fun m!953401 () Bool)

(assert (=> b!1033879 m!953401))

(assert (=> d!123697 d!123843))

(declare-fun b!1033900 () Bool)

(declare-fun lt!456242 () List!21939)

(declare-fun e!584434 () Bool)

(assert (=> b!1033900 (= e!584434 (contains!5994 lt!456242 (tuple2!15807 (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))))))))

(declare-fun b!1033901 () Bool)

(declare-fun e!584436 () List!21939)

(declare-fun call!43680 () List!21939)

(assert (=> b!1033901 (= e!584436 call!43680)))

(declare-fun e!584433 () List!21939)

(declare-fun c!104444 () Bool)

(declare-fun b!1033902 () Bool)

(declare-fun c!104446 () Bool)

(assert (=> b!1033902 (= e!584433 (ite c!104446 (t!31126 (toList!6930 lt!456028)) (ite c!104444 (Cons!21935 (h!23137 (toList!6930 lt!456028)) (t!31126 (toList!6930 lt!456028))) Nil!21936)))))

(declare-fun b!1033903 () Bool)

(declare-fun res!690722 () Bool)

(assert (=> b!1033903 (=> (not res!690722) (not e!584434))))

(assert (=> b!1033903 (= res!690722 (containsKey!563 lt!456242 (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))))))

(declare-fun b!1033904 () Bool)

(declare-fun e!584437 () List!21939)

(declare-fun call!43682 () List!21939)

(assert (=> b!1033904 (= e!584437 call!43682)))

(declare-fun bm!43677 () Bool)

(declare-fun call!43681 () List!21939)

(assert (=> bm!43677 (= call!43682 call!43681)))

(declare-fun b!1033905 () Bool)

(declare-fun e!584435 () List!21939)

(assert (=> b!1033905 (= e!584436 e!584435)))

(assert (=> b!1033905 (= c!104446 (and ((_ is Cons!21935) (toList!6930 lt!456028)) (= (_1!7914 (h!23137 (toList!6930 lt!456028))) (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))))))))

(declare-fun b!1033906 () Bool)

(assert (=> b!1033906 (= e!584437 call!43682)))

(declare-fun b!1033907 () Bool)

(assert (=> b!1033907 (= e!584435 call!43681)))

(declare-fun d!123845 () Bool)

(assert (=> d!123845 e!584434))

(declare-fun res!690721 () Bool)

(assert (=> d!123845 (=> (not res!690721) (not e!584434))))

(assert (=> d!123845 (= res!690721 (isStrictlySorted!714 lt!456242))))

(assert (=> d!123845 (= lt!456242 e!584436)))

(declare-fun c!104443 () Bool)

(assert (=> d!123845 (= c!104443 (and ((_ is Cons!21935) (toList!6930 lt!456028)) (bvslt (_1!7914 (h!23137 (toList!6930 lt!456028))) (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))))))))

(assert (=> d!123845 (isStrictlySorted!714 (toList!6930 lt!456028))))

(assert (=> d!123845 (= (insertStrictlySorted!373 (toList!6930 lt!456028) (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))) lt!456242)))

(declare-fun bm!43678 () Bool)

(assert (=> bm!43678 (= call!43681 call!43680)))

(declare-fun bm!43679 () Bool)

(assert (=> bm!43679 (= call!43680 ($colon$colon!604 e!584433 (ite c!104443 (h!23137 (toList!6930 lt!456028)) (tuple2!15807 (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))))))))

(declare-fun c!104445 () Bool)

(assert (=> bm!43679 (= c!104445 c!104443)))

(declare-fun b!1033908 () Bool)

(assert (=> b!1033908 (= e!584433 (insertStrictlySorted!373 (t!31126 (toList!6930 lt!456028)) (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))))))

(declare-fun b!1033909 () Bool)

(assert (=> b!1033909 (= c!104444 (and ((_ is Cons!21935) (toList!6930 lt!456028)) (bvsgt (_1!7914 (h!23137 (toList!6930 lt!456028))) (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))))))))

(assert (=> b!1033909 (= e!584435 e!584437)))

(assert (= (and d!123845 c!104443) b!1033901))

(assert (= (and d!123845 (not c!104443)) b!1033905))

(assert (= (and b!1033905 c!104446) b!1033907))

(assert (= (and b!1033905 (not c!104446)) b!1033909))

(assert (= (and b!1033909 c!104444) b!1033904))

(assert (= (and b!1033909 (not c!104444)) b!1033906))

(assert (= (or b!1033904 b!1033906) bm!43677))

(assert (= (or b!1033907 bm!43677) bm!43678))

(assert (= (or b!1033901 bm!43678) bm!43679))

(assert (= (and bm!43679 c!104445) b!1033908))

(assert (= (and bm!43679 (not c!104445)) b!1033902))

(assert (= (and d!123845 res!690721) b!1033903))

(assert (= (and b!1033903 res!690722) b!1033900))

(declare-fun m!953403 () Bool)

(assert (=> b!1033908 m!953403))

(declare-fun m!953405 () Bool)

(assert (=> d!123845 m!953405))

(declare-fun m!953407 () Bool)

(assert (=> d!123845 m!953407))

(declare-fun m!953409 () Bool)

(assert (=> b!1033900 m!953409))

(declare-fun m!953411 () Bool)

(assert (=> b!1033903 m!953411))

(declare-fun m!953413 () Bool)

(assert (=> bm!43679 m!953413))

(assert (=> d!123697 d!123845))

(declare-fun d!123847 () Bool)

(assert (=> d!123847 (= (get!16429 (getValueByKey!590 (toList!6930 (+!3130 lt!456028 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))) lt!456019)) (v!14888 (getValueByKey!590 (toList!6930 (+!3130 lt!456028 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))) lt!456019)))))

(assert (=> d!123691 d!123847))

(declare-fun e!584438 () Option!641)

(declare-fun b!1033910 () Bool)

(assert (=> b!1033910 (= e!584438 (Some!640 (_2!7914 (h!23137 (toList!6930 (+!3130 lt!456028 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))))))))))

(declare-fun b!1033913 () Bool)

(declare-fun e!584439 () Option!641)

(assert (=> b!1033913 (= e!584439 None!639)))

(declare-fun b!1033912 () Bool)

(assert (=> b!1033912 (= e!584439 (getValueByKey!590 (t!31126 (toList!6930 (+!3130 lt!456028 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))))) lt!456019))))

(declare-fun d!123849 () Bool)

(declare-fun c!104447 () Bool)

(assert (=> d!123849 (= c!104447 (and ((_ is Cons!21935) (toList!6930 (+!3130 lt!456028 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))))) (= (_1!7914 (h!23137 (toList!6930 (+!3130 lt!456028 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))))) lt!456019)))))

(assert (=> d!123849 (= (getValueByKey!590 (toList!6930 (+!3130 lt!456028 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))) lt!456019) e!584438)))

(declare-fun b!1033911 () Bool)

(assert (=> b!1033911 (= e!584438 e!584439)))

(declare-fun c!104448 () Bool)

(assert (=> b!1033911 (= c!104448 (and ((_ is Cons!21935) (toList!6930 (+!3130 lt!456028 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))))) (not (= (_1!7914 (h!23137 (toList!6930 (+!3130 lt!456028 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))))) lt!456019))))))

(assert (= (and d!123849 c!104447) b!1033910))

(assert (= (and d!123849 (not c!104447)) b!1033911))

(assert (= (and b!1033911 c!104448) b!1033912))

(assert (= (and b!1033911 (not c!104448)) b!1033913))

(declare-fun m!953415 () Bool)

(assert (=> b!1033912 m!953415))

(assert (=> d!123691 d!123849))

(declare-fun bm!43680 () Bool)

(declare-fun call!43683 () (_ BitVec 32))

(assert (=> bm!43680 (= call!43683 (arrayCountValidKeys!0 (_keys!11402 lt!455914) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31844 (_keys!11402 lt!455914))))))

(declare-fun b!1033914 () Bool)

(declare-fun e!584440 () (_ BitVec 32))

(assert (=> b!1033914 (= e!584440 call!43683)))

(declare-fun b!1033915 () Bool)

(declare-fun e!584441 () (_ BitVec 32))

(assert (=> b!1033915 (= e!584441 #b00000000000000000000000000000000)))

(declare-fun d!123851 () Bool)

(declare-fun lt!456243 () (_ BitVec 32))

(assert (=> d!123851 (and (bvsge lt!456243 #b00000000000000000000000000000000) (bvsle lt!456243 (bvsub (size!31844 (_keys!11402 lt!455914)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!123851 (= lt!456243 e!584441)))

(declare-fun c!104449 () Bool)

(assert (=> d!123851 (= c!104449 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 lt!455914))))))

(assert (=> d!123851 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 lt!455914))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31844 (_keys!11402 lt!455914)) (size!31844 (_keys!11402 lt!455914))))))

(assert (=> d!123851 (= (arrayCountValidKeys!0 (_keys!11402 lt!455914) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 lt!455914))) lt!456243)))

(declare-fun b!1033916 () Bool)

(assert (=> b!1033916 (= e!584441 e!584440)))

(declare-fun c!104450 () Bool)

(assert (=> b!1033916 (= c!104450 (validKeyInArray!0 (select (arr!31320 (_keys!11402 lt!455914)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1033917 () Bool)

(assert (=> b!1033917 (= e!584440 (bvadd #b00000000000000000000000000000001 call!43683))))

(assert (= (and d!123851 c!104449) b!1033915))

(assert (= (and d!123851 (not c!104449)) b!1033916))

(assert (= (and b!1033916 c!104450) b!1033917))

(assert (= (and b!1033916 (not c!104450)) b!1033914))

(assert (= (or b!1033917 b!1033914) bm!43680))

(declare-fun m!953417 () Bool)

(assert (=> bm!43680 m!953417))

(assert (=> b!1033916 m!953373))

(assert (=> b!1033916 m!953373))

(assert (=> b!1033916 m!953381))

(assert (=> bm!43669 d!123851))

(declare-fun d!123853 () Bool)

(assert (=> d!123853 (arrayContainsKey!0 (_keys!11402 lt!455914) lt!456214 #b00000000000000000000000000000000)))

(declare-fun lt!456246 () Unit!33713)

(declare-fun choose!13 (array!65053 (_ BitVec 64) (_ BitVec 32)) Unit!33713)

(assert (=> d!123853 (= lt!456246 (choose!13 (_keys!11402 lt!455914) lt!456214 #b00000000000000000000000000000000))))

(assert (=> d!123853 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!123853 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11402 lt!455914) lt!456214 #b00000000000000000000000000000000) lt!456246)))

(declare-fun bs!30211 () Bool)

(assert (= bs!30211 d!123853))

(assert (=> bs!30211 m!953323))

(declare-fun m!953419 () Bool)

(assert (=> bs!30211 m!953419))

(assert (=> b!1033807 d!123853))

(declare-fun d!123855 () Bool)

(declare-fun res!690727 () Bool)

(declare-fun e!584446 () Bool)

(assert (=> d!123855 (=> res!690727 e!584446)))

(assert (=> d!123855 (= res!690727 (= (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000) lt!456214))))

(assert (=> d!123855 (= (arrayContainsKey!0 (_keys!11402 lt!455914) lt!456214 #b00000000000000000000000000000000) e!584446)))

(declare-fun b!1033922 () Bool)

(declare-fun e!584447 () Bool)

(assert (=> b!1033922 (= e!584446 e!584447)))

(declare-fun res!690728 () Bool)

(assert (=> b!1033922 (=> (not res!690728) (not e!584447))))

(assert (=> b!1033922 (= res!690728 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 lt!455914))))))

(declare-fun b!1033923 () Bool)

(assert (=> b!1033923 (= e!584447 (arrayContainsKey!0 (_keys!11402 lt!455914) lt!456214 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123855 (not res!690727)) b!1033922))

(assert (= (and b!1033922 res!690728) b!1033923))

(assert (=> d!123855 m!953267))

(declare-fun m!953421 () Bool)

(assert (=> b!1033923 m!953421))

(assert (=> b!1033807 d!123855))

(declare-fun d!123857 () Bool)

(declare-fun lt!456254 () SeekEntryResult!9729)

(assert (=> d!123857 (and (or ((_ is Undefined!9729) lt!456254) (not ((_ is Found!9729) lt!456254)) (and (bvsge (index!41288 lt!456254) #b00000000000000000000000000000000) (bvslt (index!41288 lt!456254) (size!31844 (_keys!11402 lt!455914))))) (or ((_ is Undefined!9729) lt!456254) ((_ is Found!9729) lt!456254) (not ((_ is MissingZero!9729) lt!456254)) (and (bvsge (index!41287 lt!456254) #b00000000000000000000000000000000) (bvslt (index!41287 lt!456254) (size!31844 (_keys!11402 lt!455914))))) (or ((_ is Undefined!9729) lt!456254) ((_ is Found!9729) lt!456254) ((_ is MissingZero!9729) lt!456254) (not ((_ is MissingVacant!9729) lt!456254)) (and (bvsge (index!41290 lt!456254) #b00000000000000000000000000000000) (bvslt (index!41290 lt!456254) (size!31844 (_keys!11402 lt!455914))))) (or ((_ is Undefined!9729) lt!456254) (ite ((_ is Found!9729) lt!456254) (= (select (arr!31320 (_keys!11402 lt!455914)) (index!41288 lt!456254)) (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9729) lt!456254) (= (select (arr!31320 (_keys!11402 lt!455914)) (index!41287 lt!456254)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9729) lt!456254) (= (select (arr!31320 (_keys!11402 lt!455914)) (index!41290 lt!456254)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!584456 () SeekEntryResult!9729)

(assert (=> d!123857 (= lt!456254 e!584456)))

(declare-fun c!104457 () Bool)

(declare-fun lt!456255 () SeekEntryResult!9729)

(assert (=> d!123857 (= c!104457 (and ((_ is Intermediate!9729) lt!456255) (undefined!10541 lt!456255)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65053 (_ BitVec 32)) SeekEntryResult!9729)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!123857 (= lt!456255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000) (mask!30078 lt!455914)) (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000) (_keys!11402 lt!455914) (mask!30078 lt!455914)))))

(assert (=> d!123857 (validMask!0 (mask!30078 lt!455914))))

(assert (=> d!123857 (= (seekEntryOrOpen!0 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000) (_keys!11402 lt!455914) (mask!30078 lt!455914)) lt!456254)))

(declare-fun b!1033936 () Bool)

(declare-fun e!584454 () SeekEntryResult!9729)

(assert (=> b!1033936 (= e!584456 e!584454)))

(declare-fun lt!456253 () (_ BitVec 64))

(assert (=> b!1033936 (= lt!456253 (select (arr!31320 (_keys!11402 lt!455914)) (index!41289 lt!456255)))))

(declare-fun c!104459 () Bool)

(assert (=> b!1033936 (= c!104459 (= lt!456253 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)))))

(declare-fun b!1033937 () Bool)

(assert (=> b!1033937 (= e!584454 (Found!9729 (index!41289 lt!456255)))))

(declare-fun b!1033938 () Bool)

(declare-fun e!584455 () SeekEntryResult!9729)

(assert (=> b!1033938 (= e!584455 (MissingZero!9729 (index!41289 lt!456255)))))

(declare-fun b!1033939 () Bool)

(assert (=> b!1033939 (= e!584456 Undefined!9729)))

(declare-fun b!1033940 () Bool)

(declare-fun c!104458 () Bool)

(assert (=> b!1033940 (= c!104458 (= lt!456253 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1033940 (= e!584454 e!584455)))

(declare-fun b!1033941 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65053 (_ BitVec 32)) SeekEntryResult!9729)

(assert (=> b!1033941 (= e!584455 (seekKeyOrZeroReturnVacant!0 (x!92213 lt!456255) (index!41289 lt!456255) (index!41289 lt!456255) (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000) (_keys!11402 lt!455914) (mask!30078 lt!455914)))))

(assert (= (and d!123857 c!104457) b!1033939))

(assert (= (and d!123857 (not c!104457)) b!1033936))

(assert (= (and b!1033936 c!104459) b!1033937))

(assert (= (and b!1033936 (not c!104459)) b!1033940))

(assert (= (and b!1033940 c!104458) b!1033938))

(assert (= (and b!1033940 (not c!104458)) b!1033941))

(declare-fun m!953423 () Bool)

(assert (=> d!123857 m!953423))

(assert (=> d!123857 m!953267))

(declare-fun m!953425 () Bool)

(assert (=> d!123857 m!953425))

(declare-fun m!953427 () Bool)

(assert (=> d!123857 m!953427))

(assert (=> d!123857 m!953019))

(declare-fun m!953429 () Bool)

(assert (=> d!123857 m!953429))

(declare-fun m!953431 () Bool)

(assert (=> d!123857 m!953431))

(assert (=> d!123857 m!953267))

(assert (=> d!123857 m!953423))

(declare-fun m!953433 () Bool)

(assert (=> b!1033936 m!953433))

(assert (=> b!1033941 m!953267))

(declare-fun m!953435 () Bool)

(assert (=> b!1033941 m!953435))

(assert (=> b!1033807 d!123857))

(declare-fun d!123859 () Bool)

(assert (=> d!123859 (= (get!16429 (getValueByKey!590 (toList!6930 lt!456029) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14888 (getValueByKey!590 (toList!6930 lt!456029) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123763 d!123859))

(declare-fun b!1033942 () Bool)

(declare-fun e!584457 () Option!641)

(assert (=> b!1033942 (= e!584457 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456029)))))))

(declare-fun b!1033945 () Bool)

(declare-fun e!584458 () Option!641)

(assert (=> b!1033945 (= e!584458 None!639)))

(declare-fun b!1033944 () Bool)

(assert (=> b!1033944 (= e!584458 (getValueByKey!590 (t!31126 (toList!6930 lt!456029)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!123861 () Bool)

(declare-fun c!104460 () Bool)

(assert (=> d!123861 (= c!104460 (and ((_ is Cons!21935) (toList!6930 lt!456029)) (= (_1!7914 (h!23137 (toList!6930 lt!456029))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123861 (= (getValueByKey!590 (toList!6930 lt!456029) #b0000000000000000000000000000000000000000000000000000000000000000) e!584457)))

(declare-fun b!1033943 () Bool)

(assert (=> b!1033943 (= e!584457 e!584458)))

(declare-fun c!104461 () Bool)

(assert (=> b!1033943 (= c!104461 (and ((_ is Cons!21935) (toList!6930 lt!456029)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456029))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!123861 c!104460) b!1033942))

(assert (= (and d!123861 (not c!104460)) b!1033943))

(assert (= (and b!1033943 c!104461) b!1033944))

(assert (= (and b!1033943 (not c!104461)) b!1033945))

(declare-fun m!953437 () Bool)

(assert (=> b!1033944 m!953437))

(assert (=> d!123763 d!123861))

(declare-fun d!123863 () Bool)

(assert (=> d!123863 (= (get!16429 (getValueByKey!590 (toList!6930 lt!456003) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!14888 (getValueByKey!590 (toList!6930 lt!456003) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123797 d!123863))

(declare-fun b!1033946 () Bool)

(declare-fun e!584459 () Option!641)

(assert (=> b!1033946 (= e!584459 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456003)))))))

(declare-fun b!1033949 () Bool)

(declare-fun e!584460 () Option!641)

(assert (=> b!1033949 (= e!584460 None!639)))

(declare-fun b!1033948 () Bool)

(assert (=> b!1033948 (= e!584460 (getValueByKey!590 (t!31126 (toList!6930 lt!456003)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!123865 () Bool)

(declare-fun c!104462 () Bool)

(assert (=> d!123865 (= c!104462 (and ((_ is Cons!21935) (toList!6930 lt!456003)) (= (_1!7914 (h!23137 (toList!6930 lt!456003))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123865 (= (getValueByKey!590 (toList!6930 lt!456003) #b1000000000000000000000000000000000000000000000000000000000000000) e!584459)))

(declare-fun b!1033947 () Bool)

(assert (=> b!1033947 (= e!584459 e!584460)))

(declare-fun c!104463 () Bool)

(assert (=> b!1033947 (= c!104463 (and ((_ is Cons!21935) (toList!6930 lt!456003)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456003))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!123865 c!104462) b!1033946))

(assert (= (and d!123865 (not c!104462)) b!1033947))

(assert (= (and b!1033947 c!104463) b!1033948))

(assert (= (and b!1033947 (not c!104463)) b!1033949))

(declare-fun m!953439 () Bool)

(assert (=> b!1033948 m!953439))

(assert (=> d!123797 d!123865))

(declare-fun d!123867 () Bool)

(assert (=> d!123867 (= (apply!899 lt!456207 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16429 (getValueByKey!590 (toList!6930 lt!456207) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30212 () Bool)

(assert (= bs!30212 d!123867))

(declare-fun m!953441 () Bool)

(assert (=> bs!30212 m!953441))

(assert (=> bs!30212 m!953441))

(declare-fun m!953443 () Bool)

(assert (=> bs!30212 m!953443))

(assert (=> b!1033787 d!123867))

(declare-fun b!1033950 () Bool)

(declare-fun e!584461 () Option!641)

(assert (=> b!1033950 (= e!584461 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456125)))))))

(declare-fun b!1033953 () Bool)

(declare-fun e!584462 () Option!641)

(assert (=> b!1033953 (= e!584462 None!639)))

(declare-fun b!1033952 () Bool)

(assert (=> b!1033952 (= e!584462 (getValueByKey!590 (t!31126 (toList!6930 lt!456125)) (_1!7914 (tuple2!15807 lt!456000 lt!455915))))))

(declare-fun d!123869 () Bool)

(declare-fun c!104464 () Bool)

(assert (=> d!123869 (= c!104464 (and ((_ is Cons!21935) (toList!6930 lt!456125)) (= (_1!7914 (h!23137 (toList!6930 lt!456125))) (_1!7914 (tuple2!15807 lt!456000 lt!455915)))))))

(assert (=> d!123869 (= (getValueByKey!590 (toList!6930 lt!456125) (_1!7914 (tuple2!15807 lt!456000 lt!455915))) e!584461)))

(declare-fun b!1033951 () Bool)

(assert (=> b!1033951 (= e!584461 e!584462)))

(declare-fun c!104465 () Bool)

(assert (=> b!1033951 (= c!104465 (and ((_ is Cons!21935) (toList!6930 lt!456125)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456125))) (_1!7914 (tuple2!15807 lt!456000 lt!455915))))))))

(assert (= (and d!123869 c!104464) b!1033950))

(assert (= (and d!123869 (not c!104464)) b!1033951))

(assert (= (and b!1033951 c!104465) b!1033952))

(assert (= (and b!1033951 (not c!104465)) b!1033953))

(declare-fun m!953445 () Bool)

(assert (=> b!1033952 m!953445))

(assert (=> b!1033721 d!123869))

(declare-fun d!123871 () Bool)

(assert (=> d!123871 (= (isDefined!438 (getValueByKey!590 (toList!6930 lt!455937) key!909)) (not (isEmpty!932 (getValueByKey!590 (toList!6930 lt!455937) key!909))))))

(declare-fun bs!30213 () Bool)

(assert (= bs!30213 d!123871))

(assert (=> bs!30213 m!953165))

(declare-fun m!953447 () Bool)

(assert (=> bs!30213 m!953447))

(assert (=> b!1033738 d!123871))

(declare-fun b!1033954 () Bool)

(declare-fun e!584463 () Option!641)

(assert (=> b!1033954 (= e!584463 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!455937)))))))

(declare-fun b!1033957 () Bool)

(declare-fun e!584464 () Option!641)

(assert (=> b!1033957 (= e!584464 None!639)))

(declare-fun b!1033956 () Bool)

(assert (=> b!1033956 (= e!584464 (getValueByKey!590 (t!31126 (toList!6930 lt!455937)) key!909))))

(declare-fun d!123873 () Bool)

(declare-fun c!104466 () Bool)

(assert (=> d!123873 (= c!104466 (and ((_ is Cons!21935) (toList!6930 lt!455937)) (= (_1!7914 (h!23137 (toList!6930 lt!455937))) key!909)))))

(assert (=> d!123873 (= (getValueByKey!590 (toList!6930 lt!455937) key!909) e!584463)))

(declare-fun b!1033955 () Bool)

(assert (=> b!1033955 (= e!584463 e!584464)))

(declare-fun c!104467 () Bool)

(assert (=> b!1033955 (= c!104467 (and ((_ is Cons!21935) (toList!6930 lt!455937)) (not (= (_1!7914 (h!23137 (toList!6930 lt!455937))) key!909))))))

(assert (= (and d!123873 c!104466) b!1033954))

(assert (= (and d!123873 (not c!104466)) b!1033955))

(assert (= (and b!1033955 c!104467) b!1033956))

(assert (= (and b!1033955 (not c!104467)) b!1033957))

(declare-fun m!953449 () Bool)

(assert (=> b!1033956 m!953449))

(assert (=> b!1033738 d!123873))

(declare-fun d!123875 () Bool)

(declare-fun e!584465 () Bool)

(assert (=> d!123875 e!584465))

(declare-fun res!690729 () Bool)

(assert (=> d!123875 (=> res!690729 e!584465)))

(declare-fun lt!456256 () Bool)

(assert (=> d!123875 (= res!690729 (not lt!456256))))

(declare-fun lt!456259 () Bool)

(assert (=> d!123875 (= lt!456256 lt!456259)))

(declare-fun lt!456258 () Unit!33713)

(declare-fun e!584466 () Unit!33713)

(assert (=> d!123875 (= lt!456258 e!584466)))

(declare-fun c!104468 () Bool)

(assert (=> d!123875 (= c!104468 lt!456259)))

(assert (=> d!123875 (= lt!456259 (containsKey!563 (toList!6930 lt!456105) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123875 (= (contains!5992 lt!456105 #b1000000000000000000000000000000000000000000000000000000000000000) lt!456256)))

(declare-fun b!1033958 () Bool)

(declare-fun lt!456257 () Unit!33713)

(assert (=> b!1033958 (= e!584466 lt!456257)))

(assert (=> b!1033958 (= lt!456257 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456105) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1033958 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456105) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033959 () Bool)

(declare-fun Unit!33731 () Unit!33713)

(assert (=> b!1033959 (= e!584466 Unit!33731)))

(declare-fun b!1033960 () Bool)

(assert (=> b!1033960 (= e!584465 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456105) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123875 c!104468) b!1033958))

(assert (= (and d!123875 (not c!104468)) b!1033959))

(assert (= (and d!123875 (not res!690729)) b!1033960))

(declare-fun m!953451 () Bool)

(assert (=> d!123875 m!953451))

(declare-fun m!953453 () Bool)

(assert (=> b!1033958 m!953453))

(declare-fun m!953455 () Bool)

(assert (=> b!1033958 m!953455))

(assert (=> b!1033958 m!953455))

(declare-fun m!953457 () Bool)

(assert (=> b!1033958 m!953457))

(assert (=> b!1033960 m!953455))

(assert (=> b!1033960 m!953455))

(assert (=> b!1033960 m!953457))

(assert (=> b!1033686 d!123875))

(declare-fun d!123877 () Bool)

(declare-fun res!690730 () Bool)

(declare-fun e!584467 () Bool)

(assert (=> d!123877 (=> res!690730 e!584467)))

(assert (=> d!123877 (= res!690730 (and ((_ is Cons!21935) (toList!6930 lt!456003)) (= (_1!7914 (h!23137 (toList!6930 lt!456003))) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!123877 (= (containsKey!563 (toList!6930 lt!456003) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) e!584467)))

(declare-fun b!1033961 () Bool)

(declare-fun e!584468 () Bool)

(assert (=> b!1033961 (= e!584467 e!584468)))

(declare-fun res!690731 () Bool)

(assert (=> b!1033961 (=> (not res!690731) (not e!584468))))

(assert (=> b!1033961 (= res!690731 (and (or (not ((_ is Cons!21935) (toList!6930 lt!456003))) (bvsle (_1!7914 (h!23137 (toList!6930 lt!456003))) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))) ((_ is Cons!21935) (toList!6930 lt!456003)) (bvslt (_1!7914 (h!23137 (toList!6930 lt!456003))) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun b!1033962 () Bool)

(assert (=> b!1033962 (= e!584468 (containsKey!563 (t!31126 (toList!6930 lt!456003)) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123877 (not res!690730)) b!1033961))

(assert (= (and b!1033961 res!690731) b!1033962))

(assert (=> b!1033962 m!952763))

(declare-fun m!953459 () Bool)

(assert (=> b!1033962 m!953459))

(assert (=> d!123789 d!123877))

(declare-fun d!123879 () Bool)

(assert (=> d!123879 (= (get!16429 (getValueByKey!590 (toList!6930 lt!456002) lt!455993)) (v!14888 (getValueByKey!590 (toList!6930 lt!456002) lt!455993)))))

(assert (=> d!123729 d!123879))

(declare-fun b!1033963 () Bool)

(declare-fun e!584469 () Option!641)

(assert (=> b!1033963 (= e!584469 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456002)))))))

(declare-fun b!1033966 () Bool)

(declare-fun e!584470 () Option!641)

(assert (=> b!1033966 (= e!584470 None!639)))

(declare-fun b!1033965 () Bool)

(assert (=> b!1033965 (= e!584470 (getValueByKey!590 (t!31126 (toList!6930 lt!456002)) lt!455993))))

(declare-fun d!123881 () Bool)

(declare-fun c!104469 () Bool)

(assert (=> d!123881 (= c!104469 (and ((_ is Cons!21935) (toList!6930 lt!456002)) (= (_1!7914 (h!23137 (toList!6930 lt!456002))) lt!455993)))))

(assert (=> d!123881 (= (getValueByKey!590 (toList!6930 lt!456002) lt!455993) e!584469)))

(declare-fun b!1033964 () Bool)

(assert (=> b!1033964 (= e!584469 e!584470)))

(declare-fun c!104470 () Bool)

(assert (=> b!1033964 (= c!104470 (and ((_ is Cons!21935) (toList!6930 lt!456002)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456002))) lt!455993))))))

(assert (= (and d!123881 c!104469) b!1033963))

(assert (= (and d!123881 (not c!104469)) b!1033964))

(assert (= (and b!1033964 c!104470) b!1033965))

(assert (= (and b!1033964 (not c!104470)) b!1033966))

(declare-fun m!953461 () Bool)

(assert (=> b!1033965 m!953461))

(assert (=> d!123729 d!123881))

(declare-fun d!123883 () Bool)

(declare-fun res!690732 () Bool)

(declare-fun e!584471 () Bool)

(assert (=> d!123883 (=> res!690732 e!584471)))

(assert (=> d!123883 (= res!690732 (and ((_ is Cons!21935) (toList!6930 lt!456003)) (= (_1!7914 (h!23137 (toList!6930 lt!456003))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123883 (= (containsKey!563 (toList!6930 lt!456003) #b0000000000000000000000000000000000000000000000000000000000000000) e!584471)))

(declare-fun b!1033967 () Bool)

(declare-fun e!584472 () Bool)

(assert (=> b!1033967 (= e!584471 e!584472)))

(declare-fun res!690733 () Bool)

(assert (=> b!1033967 (=> (not res!690733) (not e!584472))))

(assert (=> b!1033967 (= res!690733 (and (or (not ((_ is Cons!21935) (toList!6930 lt!456003))) (bvsle (_1!7914 (h!23137 (toList!6930 lt!456003))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21935) (toList!6930 lt!456003)) (bvslt (_1!7914 (h!23137 (toList!6930 lt!456003))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1033968 () Bool)

(assert (=> b!1033968 (= e!584472 (containsKey!563 (t!31126 (toList!6930 lt!456003)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!123883 (not res!690732)) b!1033967))

(assert (= (and b!1033967 res!690733) b!1033968))

(declare-fun m!953463 () Bool)

(assert (=> b!1033968 m!953463))

(assert (=> d!123783 d!123883))

(declare-fun d!123885 () Bool)

(declare-fun e!584473 () Bool)

(assert (=> d!123885 e!584473))

(declare-fun res!690734 () Bool)

(assert (=> d!123885 (=> res!690734 e!584473)))

(declare-fun lt!456260 () Bool)

(assert (=> d!123885 (= res!690734 (not lt!456260))))

(declare-fun lt!456263 () Bool)

(assert (=> d!123885 (= lt!456260 lt!456263)))

(declare-fun lt!456262 () Unit!33713)

(declare-fun e!584474 () Unit!33713)

(assert (=> d!123885 (= lt!456262 e!584474)))

(declare-fun c!104471 () Bool)

(assert (=> d!123885 (= c!104471 lt!456263)))

(assert (=> d!123885 (= lt!456263 (containsKey!563 (toList!6930 lt!456139) (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!123885 (= (contains!5992 lt!456139 (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) lt!456260)))

(declare-fun b!1033969 () Bool)

(declare-fun lt!456261 () Unit!33713)

(assert (=> b!1033969 (= e!584474 lt!456261)))

(assert (=> b!1033969 (= lt!456261 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456139) (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> b!1033969 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456139) (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1033970 () Bool)

(declare-fun Unit!33732 () Unit!33713)

(assert (=> b!1033970 (= e!584474 Unit!33732)))

(declare-fun b!1033971 () Bool)

(assert (=> b!1033971 (= e!584473 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456139) (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!123885 c!104471) b!1033969))

(assert (= (and d!123885 (not c!104471)) b!1033970))

(assert (= (and d!123885 (not res!690734)) b!1033971))

(declare-fun m!953465 () Bool)

(assert (=> d!123885 m!953465))

(declare-fun m!953467 () Bool)

(assert (=> b!1033969 m!953467))

(assert (=> b!1033969 m!953129))

(assert (=> b!1033969 m!953129))

(declare-fun m!953469 () Bool)

(assert (=> b!1033969 m!953469))

(assert (=> b!1033971 m!953129))

(assert (=> b!1033971 m!953129))

(assert (=> b!1033971 m!953469))

(assert (=> d!123759 d!123885))

(declare-fun b!1033972 () Bool)

(declare-fun e!584475 () Option!641)

(assert (=> b!1033972 (= e!584475 (Some!640 (_2!7914 (h!23137 lt!456141))))))

(declare-fun b!1033975 () Bool)

(declare-fun e!584476 () Option!641)

(assert (=> b!1033975 (= e!584476 None!639)))

(declare-fun b!1033974 () Bool)

(assert (=> b!1033974 (= e!584476 (getValueByKey!590 (t!31126 lt!456141) (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun c!104472 () Bool)

(declare-fun d!123887 () Bool)

(assert (=> d!123887 (= c!104472 (and ((_ is Cons!21935) lt!456141) (= (_1!7914 (h!23137 lt!456141)) (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (=> d!123887 (= (getValueByKey!590 lt!456141 (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) e!584475)))

(declare-fun b!1033973 () Bool)

(assert (=> b!1033973 (= e!584475 e!584476)))

(declare-fun c!104473 () Bool)

(assert (=> b!1033973 (= c!104473 (and ((_ is Cons!21935) lt!456141) (not (= (_1!7914 (h!23137 lt!456141)) (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))))

(assert (= (and d!123887 c!104472) b!1033972))

(assert (= (and d!123887 (not c!104472)) b!1033973))

(assert (= (and b!1033973 c!104473) b!1033974))

(assert (= (and b!1033973 (not c!104473)) b!1033975))

(declare-fun m!953471 () Bool)

(assert (=> b!1033974 m!953471))

(assert (=> d!123759 d!123887))

(declare-fun d!123889 () Bool)

(assert (=> d!123889 (= (getValueByKey!590 lt!456141 (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) (Some!640 (_2!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun lt!456264 () Unit!33713)

(assert (=> d!123889 (= lt!456264 (choose!1707 lt!456141 (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun e!584477 () Bool)

(assert (=> d!123889 e!584477))

(declare-fun res!690735 () Bool)

(assert (=> d!123889 (=> (not res!690735) (not e!584477))))

(assert (=> d!123889 (= res!690735 (isStrictlySorted!714 lt!456141))))

(assert (=> d!123889 (= (lemmaContainsTupThenGetReturnValue!280 lt!456141 (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) lt!456264)))

(declare-fun b!1033976 () Bool)

(declare-fun res!690736 () Bool)

(assert (=> b!1033976 (=> (not res!690736) (not e!584477))))

(assert (=> b!1033976 (= res!690736 (containsKey!563 lt!456141 (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1033977 () Bool)

(assert (=> b!1033977 (= e!584477 (contains!5994 lt!456141 (tuple2!15807 (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!123889 res!690735) b!1033976))

(assert (= (and b!1033976 res!690736) b!1033977))

(assert (=> d!123889 m!953123))

(declare-fun m!953473 () Bool)

(assert (=> d!123889 m!953473))

(declare-fun m!953475 () Bool)

(assert (=> d!123889 m!953475))

(declare-fun m!953477 () Bool)

(assert (=> b!1033976 m!953477))

(declare-fun m!953479 () Bool)

(assert (=> b!1033977 m!953479))

(assert (=> d!123759 d!123889))

(declare-fun e!584479 () Bool)

(declare-fun lt!456265 () List!21939)

(declare-fun b!1033978 () Bool)

(assert (=> b!1033978 (= e!584479 (contains!5994 lt!456265 (tuple2!15807 (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1033979 () Bool)

(declare-fun e!584481 () List!21939)

(declare-fun call!43684 () List!21939)

(assert (=> b!1033979 (= e!584481 call!43684)))

(declare-fun b!1033980 () Bool)

(declare-fun c!104475 () Bool)

(declare-fun e!584478 () List!21939)

(declare-fun c!104477 () Bool)

(assert (=> b!1033980 (= e!584478 (ite c!104477 (t!31126 (toList!6930 (ite c!104347 call!43636 (ite c!104348 call!43642 call!43639)))) (ite c!104475 (Cons!21935 (h!23137 (toList!6930 (ite c!104347 call!43636 (ite c!104348 call!43642 call!43639)))) (t!31126 (toList!6930 (ite c!104347 call!43636 (ite c!104348 call!43642 call!43639))))) Nil!21936)))))

(declare-fun b!1033981 () Bool)

(declare-fun res!690738 () Bool)

(assert (=> b!1033981 (=> (not res!690738) (not e!584479))))

(assert (=> b!1033981 (= res!690738 (containsKey!563 lt!456265 (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1033982 () Bool)

(declare-fun e!584482 () List!21939)

(declare-fun call!43686 () List!21939)

(assert (=> b!1033982 (= e!584482 call!43686)))

(declare-fun bm!43681 () Bool)

(declare-fun call!43685 () List!21939)

(assert (=> bm!43681 (= call!43686 call!43685)))

(declare-fun b!1033983 () Bool)

(declare-fun e!584480 () List!21939)

(assert (=> b!1033983 (= e!584481 e!584480)))

(assert (=> b!1033983 (= c!104477 (and ((_ is Cons!21935) (toList!6930 (ite c!104347 call!43636 (ite c!104348 call!43642 call!43639)))) (= (_1!7914 (h!23137 (toList!6930 (ite c!104347 call!43636 (ite c!104348 call!43642 call!43639))))) (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1033984 () Bool)

(assert (=> b!1033984 (= e!584482 call!43686)))

(declare-fun b!1033985 () Bool)

(assert (=> b!1033985 (= e!584480 call!43685)))

(declare-fun d!123891 () Bool)

(assert (=> d!123891 e!584479))

(declare-fun res!690737 () Bool)

(assert (=> d!123891 (=> (not res!690737) (not e!584479))))

(assert (=> d!123891 (= res!690737 (isStrictlySorted!714 lt!456265))))

(assert (=> d!123891 (= lt!456265 e!584481)))

(declare-fun c!104474 () Bool)

(assert (=> d!123891 (= c!104474 (and ((_ is Cons!21935) (toList!6930 (ite c!104347 call!43636 (ite c!104348 call!43642 call!43639)))) (bvslt (_1!7914 (h!23137 (toList!6930 (ite c!104347 call!43636 (ite c!104348 call!43642 call!43639))))) (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (=> d!123891 (isStrictlySorted!714 (toList!6930 (ite c!104347 call!43636 (ite c!104348 call!43642 call!43639))))))

(assert (=> d!123891 (= (insertStrictlySorted!373 (toList!6930 (ite c!104347 call!43636 (ite c!104348 call!43642 call!43639))) (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) lt!456265)))

(declare-fun bm!43682 () Bool)

(assert (=> bm!43682 (= call!43685 call!43684)))

(declare-fun bm!43683 () Bool)

(assert (=> bm!43683 (= call!43684 ($colon$colon!604 e!584478 (ite c!104474 (h!23137 (toList!6930 (ite c!104347 call!43636 (ite c!104348 call!43642 call!43639)))) (tuple2!15807 (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))))

(declare-fun c!104476 () Bool)

(assert (=> bm!43683 (= c!104476 c!104474)))

(declare-fun b!1033986 () Bool)

(assert (=> b!1033986 (= e!584478 (insertStrictlySorted!373 (t!31126 (toList!6930 (ite c!104347 call!43636 (ite c!104348 call!43642 call!43639)))) (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1033987 () Bool)

(assert (=> b!1033987 (= c!104475 (and ((_ is Cons!21935) (toList!6930 (ite c!104347 call!43636 (ite c!104348 call!43642 call!43639)))) (bvsgt (_1!7914 (h!23137 (toList!6930 (ite c!104347 call!43636 (ite c!104348 call!43642 call!43639))))) (_1!7914 (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (=> b!1033987 (= e!584480 e!584482)))

(assert (= (and d!123891 c!104474) b!1033979))

(assert (= (and d!123891 (not c!104474)) b!1033983))

(assert (= (and b!1033983 c!104477) b!1033985))

(assert (= (and b!1033983 (not c!104477)) b!1033987))

(assert (= (and b!1033987 c!104475) b!1033982))

(assert (= (and b!1033987 (not c!104475)) b!1033984))

(assert (= (or b!1033982 b!1033984) bm!43681))

(assert (= (or b!1033985 bm!43681) bm!43682))

(assert (= (or b!1033979 bm!43682) bm!43683))

(assert (= (and bm!43683 c!104476) b!1033986))

(assert (= (and bm!43683 (not c!104476)) b!1033980))

(assert (= (and d!123891 res!690737) b!1033981))

(assert (= (and b!1033981 res!690738) b!1033978))

(declare-fun m!953481 () Bool)

(assert (=> b!1033986 m!953481))

(declare-fun m!953483 () Bool)

(assert (=> d!123891 m!953483))

(declare-fun m!953485 () Bool)

(assert (=> d!123891 m!953485))

(declare-fun m!953487 () Bool)

(assert (=> b!1033978 m!953487))

(declare-fun m!953489 () Bool)

(assert (=> b!1033981 m!953489))

(declare-fun m!953491 () Bool)

(assert (=> bm!43683 m!953491))

(assert (=> d!123759 d!123891))

(declare-fun d!123893 () Bool)

(assert (=> d!123893 (= (get!16429 (getValueByKey!590 (toList!6930 (+!3130 lt!456002 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))) lt!455993)) (v!14888 (getValueByKey!590 (toList!6930 (+!3130 lt!456002 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))) lt!455993)))))

(assert (=> d!123737 d!123893))

(declare-fun b!1033988 () Bool)

(declare-fun e!584483 () Option!641)

(assert (=> b!1033988 (= e!584483 (Some!640 (_2!7914 (h!23137 (toList!6930 (+!3130 lt!456002 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))))))))))

(declare-fun b!1033991 () Bool)

(declare-fun e!584484 () Option!641)

(assert (=> b!1033991 (= e!584484 None!639)))

(declare-fun b!1033990 () Bool)

(assert (=> b!1033990 (= e!584484 (getValueByKey!590 (t!31126 (toList!6930 (+!3130 lt!456002 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))))) lt!455993))))

(declare-fun d!123895 () Bool)

(declare-fun c!104478 () Bool)

(assert (=> d!123895 (= c!104478 (and ((_ is Cons!21935) (toList!6930 (+!3130 lt!456002 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))))) (= (_1!7914 (h!23137 (toList!6930 (+!3130 lt!456002 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))))) lt!455993)))))

(assert (=> d!123895 (= (getValueByKey!590 (toList!6930 (+!3130 lt!456002 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))) lt!455993) e!584483)))

(declare-fun b!1033989 () Bool)

(assert (=> b!1033989 (= e!584483 e!584484)))

(declare-fun c!104479 () Bool)

(assert (=> b!1033989 (= c!104479 (and ((_ is Cons!21935) (toList!6930 (+!3130 lt!456002 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))))) (not (= (_1!7914 (h!23137 (toList!6930 (+!3130 lt!456002 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))))) lt!455993))))))

(assert (= (and d!123895 c!104478) b!1033988))

(assert (= (and d!123895 (not c!104478)) b!1033989))

(assert (= (and b!1033989 c!104479) b!1033990))

(assert (= (and b!1033989 (not c!104479)) b!1033991))

(declare-fun m!953493 () Bool)

(assert (=> b!1033990 m!953493))

(assert (=> d!123737 d!123895))

(declare-fun d!123897 () Bool)

(assert (=> d!123897 (= (isDefined!438 (getValueByKey!590 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915))) lt!455982)) (not (isEmpty!932 (getValueByKey!590 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915))) lt!455982))))))

(declare-fun bs!30214 () Bool)

(assert (= bs!30214 d!123897))

(assert (=> bs!30214 m!953109))

(declare-fun m!953495 () Bool)

(assert (=> bs!30214 m!953495))

(assert (=> b!1033728 d!123897))

(declare-fun e!584485 () Option!641)

(declare-fun b!1033992 () Bool)

(assert (=> b!1033992 (= e!584485 (Some!640 (_2!7914 (h!23137 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915)))))))))

(declare-fun b!1033995 () Bool)

(declare-fun e!584486 () Option!641)

(assert (=> b!1033995 (= e!584486 None!639)))

(declare-fun b!1033994 () Bool)

(assert (=> b!1033994 (= e!584486 (getValueByKey!590 (t!31126 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915)))) lt!455982))))

(declare-fun d!123899 () Bool)

(declare-fun c!104480 () Bool)

(assert (=> d!123899 (= c!104480 (and ((_ is Cons!21935) (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915)))) (= (_1!7914 (h!23137 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915))))) lt!455982)))))

(assert (=> d!123899 (= (getValueByKey!590 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915))) lt!455982) e!584485)))

(declare-fun b!1033993 () Bool)

(assert (=> b!1033993 (= e!584485 e!584486)))

(declare-fun c!104481 () Bool)

(assert (=> b!1033993 (= c!104481 (and ((_ is Cons!21935) (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915)))) (not (= (_1!7914 (h!23137 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915))))) lt!455982))))))

(assert (= (and d!123899 c!104480) b!1033992))

(assert (= (and d!123899 (not c!104480)) b!1033993))

(assert (= (and b!1033993 c!104481) b!1033994))

(assert (= (and b!1033993 (not c!104481)) b!1033995))

(declare-fun m!953497 () Bool)

(assert (=> b!1033994 m!953497))

(assert (=> b!1033728 d!123899))

(declare-fun d!123901 () Bool)

(assert (=> d!123901 (= (size!31850 lt!455914) (bvadd (_size!2907 lt!455914) (bvsdiv (bvadd (extraKeys!5958 lt!455914) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!1033697 d!123901))

(declare-fun b!1033997 () Bool)

(declare-fun e!584493 () ListLongMap!13829)

(declare-fun call!43687 () ListLongMap!13829)

(assert (=> b!1033997 (= e!584493 call!43687)))

(declare-fun b!1033998 () Bool)

(assert (=> b!1033998 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 thiss!1427))))))

(assert (=> b!1033998 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31845 (_values!6249 thiss!1427))))))

(declare-fun e!584487 () Bool)

(declare-fun lt!456267 () ListLongMap!13829)

(assert (=> b!1033998 (= e!584487 (= (apply!899 lt!456267 (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1033999 () Bool)

(declare-fun e!584488 () Bool)

(assert (=> b!1033999 (= e!584488 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1033999 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1034000 () Bool)

(declare-fun e!584490 () Bool)

(declare-fun e!584489 () Bool)

(assert (=> b!1034000 (= e!584490 e!584489)))

(declare-fun c!104482 () Bool)

(assert (=> b!1034000 (= c!104482 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun b!1034001 () Bool)

(declare-fun lt!456272 () Unit!33713)

(declare-fun lt!456269 () Unit!33713)

(assert (=> b!1034001 (= lt!456272 lt!456269)))

(declare-fun lt!456271 () V!37563)

(declare-fun lt!456266 () (_ BitVec 64))

(declare-fun lt!456270 () ListLongMap!13829)

(declare-fun lt!456268 () (_ BitVec 64))

(assert (=> b!1034001 (not (contains!5992 (+!3130 lt!456270 (tuple2!15807 lt!456268 lt!456271)) lt!456266))))

(assert (=> b!1034001 (= lt!456269 (addStillNotContains!243 lt!456270 lt!456268 lt!456271 lt!456266))))

(assert (=> b!1034001 (= lt!456266 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1034001 (= lt!456271 (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1034001 (= lt!456268 (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1034001 (= lt!456270 call!43687)))

(assert (=> b!1034001 (= e!584493 (+!3130 call!43687 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1034002 () Bool)

(assert (=> b!1034002 (= e!584489 (isEmpty!931 lt!456267))))

(declare-fun bm!43684 () Bool)

(assert (=> bm!43684 (= call!43687 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427)))))

(declare-fun b!1034003 () Bool)

(declare-fun e!584491 () Bool)

(assert (=> b!1034003 (= e!584491 e!584490)))

(declare-fun c!104484 () Bool)

(assert (=> b!1034003 (= c!104484 e!584488)))

(declare-fun res!690742 () Bool)

(assert (=> b!1034003 (=> (not res!690742) (not e!584488))))

(assert (=> b!1034003 (= res!690742 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun b!1034004 () Bool)

(declare-fun e!584492 () ListLongMap!13829)

(assert (=> b!1034004 (= e!584492 e!584493)))

(declare-fun c!104483 () Bool)

(assert (=> b!1034004 (= c!104483 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1034005 () Bool)

(assert (=> b!1034005 (= e!584489 (= lt!456267 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427))))))

(declare-fun b!1034006 () Bool)

(assert (=> b!1034006 (= e!584492 (ListLongMap!13830 Nil!21936))))

(declare-fun b!1034007 () Bool)

(declare-fun res!690739 () Bool)

(assert (=> b!1034007 (=> (not res!690739) (not e!584491))))

(assert (=> b!1034007 (= res!690739 (not (contains!5992 lt!456267 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!123903 () Bool)

(assert (=> d!123903 e!584491))

(declare-fun res!690740 () Bool)

(assert (=> d!123903 (=> (not res!690740) (not e!584491))))

(assert (=> d!123903 (= res!690740 (not (contains!5992 lt!456267 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123903 (= lt!456267 e!584492)))

(declare-fun c!104485 () Bool)

(assert (=> d!123903 (= c!104485 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 thiss!1427))))))

(assert (=> d!123903 (validMask!0 (mask!30078 thiss!1427))))

(assert (=> d!123903 (= (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427)) lt!456267)))

(declare-fun b!1033996 () Bool)

(assert (=> b!1033996 (= e!584490 e!584487)))

(assert (=> b!1033996 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun res!690741 () Bool)

(assert (=> b!1033996 (= res!690741 (contains!5992 lt!456267 (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1033996 (=> (not res!690741) (not e!584487))))

(assert (= (and d!123903 c!104485) b!1034006))

(assert (= (and d!123903 (not c!104485)) b!1034004))

(assert (= (and b!1034004 c!104483) b!1034001))

(assert (= (and b!1034004 (not c!104483)) b!1033997))

(assert (= (or b!1034001 b!1033997) bm!43684))

(assert (= (and d!123903 res!690740) b!1034007))

(assert (= (and b!1034007 res!690739) b!1034003))

(assert (= (and b!1034003 res!690742) b!1033999))

(assert (= (and b!1034003 c!104484) b!1033996))

(assert (= (and b!1034003 (not c!104484)) b!1034000))

(assert (= (and b!1033996 res!690741) b!1033998))

(assert (= (and b!1034000 c!104482) b!1034005))

(assert (= (and b!1034000 (not c!104482)) b!1034002))

(declare-fun b_lambda!16057 () Bool)

(assert (=> (not b_lambda!16057) (not b!1033998)))

(assert (=> b!1033998 t!31125))

(declare-fun b_and!33265 () Bool)

(assert (= b_and!33263 (and (=> t!31125 result!14375) b_and!33265)))

(declare-fun b_lambda!16059 () Bool)

(assert (=> (not b_lambda!16059) (not b!1034001)))

(assert (=> b!1034001 t!31125))

(declare-fun b_and!33267 () Bool)

(assert (= b_and!33265 (and (=> t!31125 result!14375) b_and!33267)))

(declare-fun m!953499 () Bool)

(assert (=> b!1034005 m!953499))

(declare-fun m!953501 () Bool)

(assert (=> b!1034002 m!953501))

(declare-fun m!953503 () Bool)

(assert (=> d!123903 m!953503))

(assert (=> d!123903 m!952795))

(declare-fun m!953505 () Bool)

(assert (=> b!1034004 m!953505))

(assert (=> b!1034004 m!953505))

(declare-fun m!953507 () Bool)

(assert (=> b!1034004 m!953507))

(assert (=> b!1033996 m!953505))

(assert (=> b!1033996 m!953505))

(declare-fun m!953509 () Bool)

(assert (=> b!1033996 m!953509))

(assert (=> b!1033999 m!953505))

(assert (=> b!1033999 m!953505))

(assert (=> b!1033999 m!953507))

(assert (=> b!1033998 m!953505))

(declare-fun m!953511 () Bool)

(assert (=> b!1033998 m!953511))

(assert (=> b!1033998 m!953505))

(assert (=> b!1033998 m!952655))

(declare-fun m!953513 () Bool)

(assert (=> b!1033998 m!953513))

(assert (=> b!1033998 m!953513))

(assert (=> b!1033998 m!952655))

(declare-fun m!953515 () Bool)

(assert (=> b!1033998 m!953515))

(assert (=> bm!43684 m!953499))

(declare-fun m!953517 () Bool)

(assert (=> b!1034007 m!953517))

(declare-fun m!953519 () Bool)

(assert (=> b!1034001 m!953519))

(declare-fun m!953521 () Bool)

(assert (=> b!1034001 m!953521))

(assert (=> b!1034001 m!953505))

(assert (=> b!1034001 m!953519))

(declare-fun m!953523 () Bool)

(assert (=> b!1034001 m!953523))

(assert (=> b!1034001 m!952655))

(declare-fun m!953525 () Bool)

(assert (=> b!1034001 m!953525))

(assert (=> b!1034001 m!953513))

(assert (=> b!1034001 m!953513))

(assert (=> b!1034001 m!952655))

(assert (=> b!1034001 m!953515))

(assert (=> bm!43652 d!123903))

(assert (=> b!1033804 d!123837))

(declare-fun d!123905 () Bool)

(declare-fun e!584494 () Bool)

(assert (=> d!123905 e!584494))

(declare-fun res!690744 () Bool)

(assert (=> d!123905 (=> (not res!690744) (not e!584494))))

(declare-fun lt!456274 () ListLongMap!13829)

(assert (=> d!123905 (= res!690744 (contains!5992 lt!456274 (_1!7914 (ite (or c!104410 c!104411) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!455914)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914))))))))

(declare-fun lt!456276 () List!21939)

(assert (=> d!123905 (= lt!456274 (ListLongMap!13830 lt!456276))))

(declare-fun lt!456273 () Unit!33713)

(declare-fun lt!456275 () Unit!33713)

(assert (=> d!123905 (= lt!456273 lt!456275)))

(assert (=> d!123905 (= (getValueByKey!590 lt!456276 (_1!7914 (ite (or c!104410 c!104411) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!455914)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914))))) (Some!640 (_2!7914 (ite (or c!104410 c!104411) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!455914)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914))))))))

(assert (=> d!123905 (= lt!456275 (lemmaContainsTupThenGetReturnValue!280 lt!456276 (_1!7914 (ite (or c!104410 c!104411) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!455914)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914)))) (_2!7914 (ite (or c!104410 c!104411) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!455914)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914))))))))

(assert (=> d!123905 (= lt!456276 (insertStrictlySorted!373 (toList!6930 (ite c!104410 call!43663 (ite c!104411 call!43669 call!43666))) (_1!7914 (ite (or c!104410 c!104411) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!455914)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914)))) (_2!7914 (ite (or c!104410 c!104411) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!455914)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914))))))))

(assert (=> d!123905 (= (+!3130 (ite c!104410 call!43663 (ite c!104411 call!43669 call!43666)) (ite (or c!104410 c!104411) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!455914)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914)))) lt!456274)))

(declare-fun b!1034008 () Bool)

(declare-fun res!690743 () Bool)

(assert (=> b!1034008 (=> (not res!690743) (not e!584494))))

(assert (=> b!1034008 (= res!690743 (= (getValueByKey!590 (toList!6930 lt!456274) (_1!7914 (ite (or c!104410 c!104411) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!455914)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914))))) (Some!640 (_2!7914 (ite (or c!104410 c!104411) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!455914)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914)))))))))

(declare-fun b!1034009 () Bool)

(assert (=> b!1034009 (= e!584494 (contains!5994 (toList!6930 lt!456274) (ite (or c!104410 c!104411) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!455914)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914)))))))

(assert (= (and d!123905 res!690744) b!1034008))

(assert (= (and b!1034008 res!690743) b!1034009))

(declare-fun m!953527 () Bool)

(assert (=> d!123905 m!953527))

(declare-fun m!953529 () Bool)

(assert (=> d!123905 m!953529))

(declare-fun m!953531 () Bool)

(assert (=> d!123905 m!953531))

(declare-fun m!953533 () Bool)

(assert (=> d!123905 m!953533))

(declare-fun m!953535 () Bool)

(assert (=> b!1034008 m!953535))

(declare-fun m!953537 () Bool)

(assert (=> b!1034009 m!953537))

(assert (=> bm!43661 d!123905))

(declare-fun d!123907 () Bool)

(declare-fun e!584495 () Bool)

(assert (=> d!123907 e!584495))

(declare-fun res!690745 () Bool)

(assert (=> d!123907 (=> res!690745 e!584495)))

(declare-fun lt!456277 () Bool)

(assert (=> d!123907 (= res!690745 (not lt!456277))))

(declare-fun lt!456280 () Bool)

(assert (=> d!123907 (= lt!456277 lt!456280)))

(declare-fun lt!456279 () Unit!33713)

(declare-fun e!584496 () Unit!33713)

(assert (=> d!123907 (= lt!456279 e!584496)))

(declare-fun c!104486 () Bool)

(assert (=> d!123907 (= c!104486 lt!456280)))

(assert (=> d!123907 (= lt!456280 (containsKey!563 (toList!6930 lt!456125) (_1!7914 (tuple2!15807 lt!456000 lt!455915))))))

(assert (=> d!123907 (= (contains!5992 lt!456125 (_1!7914 (tuple2!15807 lt!456000 lt!455915))) lt!456277)))

(declare-fun b!1034010 () Bool)

(declare-fun lt!456278 () Unit!33713)

(assert (=> b!1034010 (= e!584496 lt!456278)))

(assert (=> b!1034010 (= lt!456278 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456125) (_1!7914 (tuple2!15807 lt!456000 lt!455915))))))

(assert (=> b!1034010 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456125) (_1!7914 (tuple2!15807 lt!456000 lt!455915))))))

(declare-fun b!1034011 () Bool)

(declare-fun Unit!33733 () Unit!33713)

(assert (=> b!1034011 (= e!584496 Unit!33733)))

(declare-fun b!1034012 () Bool)

(assert (=> b!1034012 (= e!584495 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456125) (_1!7914 (tuple2!15807 lt!456000 lt!455915)))))))

(assert (= (and d!123907 c!104486) b!1034010))

(assert (= (and d!123907 (not c!104486)) b!1034011))

(assert (= (and d!123907 (not res!690745)) b!1034012))

(declare-fun m!953539 () Bool)

(assert (=> d!123907 m!953539))

(declare-fun m!953541 () Bool)

(assert (=> b!1034010 m!953541))

(assert (=> b!1034010 m!953073))

(assert (=> b!1034010 m!953073))

(declare-fun m!953543 () Bool)

(assert (=> b!1034010 m!953543))

(assert (=> b!1034012 m!953073))

(assert (=> b!1034012 m!953073))

(assert (=> b!1034012 m!953543))

(assert (=> d!123741 d!123907))

(declare-fun b!1034013 () Bool)

(declare-fun e!584497 () Option!641)

(assert (=> b!1034013 (= e!584497 (Some!640 (_2!7914 (h!23137 lt!456127))))))

(declare-fun b!1034016 () Bool)

(declare-fun e!584498 () Option!641)

(assert (=> b!1034016 (= e!584498 None!639)))

(declare-fun b!1034015 () Bool)

(assert (=> b!1034015 (= e!584498 (getValueByKey!590 (t!31126 lt!456127) (_1!7914 (tuple2!15807 lt!456000 lt!455915))))))

(declare-fun d!123909 () Bool)

(declare-fun c!104487 () Bool)

(assert (=> d!123909 (= c!104487 (and ((_ is Cons!21935) lt!456127) (= (_1!7914 (h!23137 lt!456127)) (_1!7914 (tuple2!15807 lt!456000 lt!455915)))))))

(assert (=> d!123909 (= (getValueByKey!590 lt!456127 (_1!7914 (tuple2!15807 lt!456000 lt!455915))) e!584497)))

(declare-fun b!1034014 () Bool)

(assert (=> b!1034014 (= e!584497 e!584498)))

(declare-fun c!104488 () Bool)

(assert (=> b!1034014 (= c!104488 (and ((_ is Cons!21935) lt!456127) (not (= (_1!7914 (h!23137 lt!456127)) (_1!7914 (tuple2!15807 lt!456000 lt!455915))))))))

(assert (= (and d!123909 c!104487) b!1034013))

(assert (= (and d!123909 (not c!104487)) b!1034014))

(assert (= (and b!1034014 c!104488) b!1034015))

(assert (= (and b!1034014 (not c!104488)) b!1034016))

(declare-fun m!953545 () Bool)

(assert (=> b!1034015 m!953545))

(assert (=> d!123741 d!123909))

(declare-fun d!123911 () Bool)

(assert (=> d!123911 (= (getValueByKey!590 lt!456127 (_1!7914 (tuple2!15807 lt!456000 lt!455915))) (Some!640 (_2!7914 (tuple2!15807 lt!456000 lt!455915))))))

(declare-fun lt!456281 () Unit!33713)

(assert (=> d!123911 (= lt!456281 (choose!1707 lt!456127 (_1!7914 (tuple2!15807 lt!456000 lt!455915)) (_2!7914 (tuple2!15807 lt!456000 lt!455915))))))

(declare-fun e!584499 () Bool)

(assert (=> d!123911 e!584499))

(declare-fun res!690746 () Bool)

(assert (=> d!123911 (=> (not res!690746) (not e!584499))))

(assert (=> d!123911 (= res!690746 (isStrictlySorted!714 lt!456127))))

(assert (=> d!123911 (= (lemmaContainsTupThenGetReturnValue!280 lt!456127 (_1!7914 (tuple2!15807 lt!456000 lt!455915)) (_2!7914 (tuple2!15807 lt!456000 lt!455915))) lt!456281)))

(declare-fun b!1034017 () Bool)

(declare-fun res!690747 () Bool)

(assert (=> b!1034017 (=> (not res!690747) (not e!584499))))

(assert (=> b!1034017 (= res!690747 (containsKey!563 lt!456127 (_1!7914 (tuple2!15807 lt!456000 lt!455915))))))

(declare-fun b!1034018 () Bool)

(assert (=> b!1034018 (= e!584499 (contains!5994 lt!456127 (tuple2!15807 (_1!7914 (tuple2!15807 lt!456000 lt!455915)) (_2!7914 (tuple2!15807 lt!456000 lt!455915)))))))

(assert (= (and d!123911 res!690746) b!1034017))

(assert (= (and b!1034017 res!690747) b!1034018))

(assert (=> d!123911 m!953067))

(declare-fun m!953547 () Bool)

(assert (=> d!123911 m!953547))

(declare-fun m!953549 () Bool)

(assert (=> d!123911 m!953549))

(declare-fun m!953551 () Bool)

(assert (=> b!1034017 m!953551))

(declare-fun m!953553 () Bool)

(assert (=> b!1034018 m!953553))

(assert (=> d!123741 d!123911))

(declare-fun b!1034019 () Bool)

(declare-fun lt!456282 () List!21939)

(declare-fun e!584501 () Bool)

(assert (=> b!1034019 (= e!584501 (contains!5994 lt!456282 (tuple2!15807 (_1!7914 (tuple2!15807 lt!456000 lt!455915)) (_2!7914 (tuple2!15807 lt!456000 lt!455915)))))))

(declare-fun b!1034020 () Bool)

(declare-fun e!584503 () List!21939)

(declare-fun call!43688 () List!21939)

(assert (=> b!1034020 (= e!584503 call!43688)))

(declare-fun c!104490 () Bool)

(declare-fun b!1034021 () Bool)

(declare-fun e!584500 () List!21939)

(declare-fun c!104492 () Bool)

(assert (=> b!1034021 (= e!584500 (ite c!104492 (t!31126 (toList!6930 lt!455986)) (ite c!104490 (Cons!21935 (h!23137 (toList!6930 lt!455986)) (t!31126 (toList!6930 lt!455986))) Nil!21936)))))

(declare-fun b!1034022 () Bool)

(declare-fun res!690749 () Bool)

(assert (=> b!1034022 (=> (not res!690749) (not e!584501))))

(assert (=> b!1034022 (= res!690749 (containsKey!563 lt!456282 (_1!7914 (tuple2!15807 lt!456000 lt!455915))))))

(declare-fun b!1034023 () Bool)

(declare-fun e!584504 () List!21939)

(declare-fun call!43690 () List!21939)

(assert (=> b!1034023 (= e!584504 call!43690)))

(declare-fun bm!43685 () Bool)

(declare-fun call!43689 () List!21939)

(assert (=> bm!43685 (= call!43690 call!43689)))

(declare-fun b!1034024 () Bool)

(declare-fun e!584502 () List!21939)

(assert (=> b!1034024 (= e!584503 e!584502)))

(assert (=> b!1034024 (= c!104492 (and ((_ is Cons!21935) (toList!6930 lt!455986)) (= (_1!7914 (h!23137 (toList!6930 lt!455986))) (_1!7914 (tuple2!15807 lt!456000 lt!455915)))))))

(declare-fun b!1034025 () Bool)

(assert (=> b!1034025 (= e!584504 call!43690)))

(declare-fun b!1034026 () Bool)

(assert (=> b!1034026 (= e!584502 call!43689)))

(declare-fun d!123913 () Bool)

(assert (=> d!123913 e!584501))

(declare-fun res!690748 () Bool)

(assert (=> d!123913 (=> (not res!690748) (not e!584501))))

(assert (=> d!123913 (= res!690748 (isStrictlySorted!714 lt!456282))))

(assert (=> d!123913 (= lt!456282 e!584503)))

(declare-fun c!104489 () Bool)

(assert (=> d!123913 (= c!104489 (and ((_ is Cons!21935) (toList!6930 lt!455986)) (bvslt (_1!7914 (h!23137 (toList!6930 lt!455986))) (_1!7914 (tuple2!15807 lt!456000 lt!455915)))))))

(assert (=> d!123913 (isStrictlySorted!714 (toList!6930 lt!455986))))

(assert (=> d!123913 (= (insertStrictlySorted!373 (toList!6930 lt!455986) (_1!7914 (tuple2!15807 lt!456000 lt!455915)) (_2!7914 (tuple2!15807 lt!456000 lt!455915))) lt!456282)))

(declare-fun bm!43686 () Bool)

(assert (=> bm!43686 (= call!43689 call!43688)))

(declare-fun bm!43687 () Bool)

(assert (=> bm!43687 (= call!43688 ($colon$colon!604 e!584500 (ite c!104489 (h!23137 (toList!6930 lt!455986)) (tuple2!15807 (_1!7914 (tuple2!15807 lt!456000 lt!455915)) (_2!7914 (tuple2!15807 lt!456000 lt!455915))))))))

(declare-fun c!104491 () Bool)

(assert (=> bm!43687 (= c!104491 c!104489)))

(declare-fun b!1034027 () Bool)

(assert (=> b!1034027 (= e!584500 (insertStrictlySorted!373 (t!31126 (toList!6930 lt!455986)) (_1!7914 (tuple2!15807 lt!456000 lt!455915)) (_2!7914 (tuple2!15807 lt!456000 lt!455915))))))

(declare-fun b!1034028 () Bool)

(assert (=> b!1034028 (= c!104490 (and ((_ is Cons!21935) (toList!6930 lt!455986)) (bvsgt (_1!7914 (h!23137 (toList!6930 lt!455986))) (_1!7914 (tuple2!15807 lt!456000 lt!455915)))))))

(assert (=> b!1034028 (= e!584502 e!584504)))

(assert (= (and d!123913 c!104489) b!1034020))

(assert (= (and d!123913 (not c!104489)) b!1034024))

(assert (= (and b!1034024 c!104492) b!1034026))

(assert (= (and b!1034024 (not c!104492)) b!1034028))

(assert (= (and b!1034028 c!104490) b!1034023))

(assert (= (and b!1034028 (not c!104490)) b!1034025))

(assert (= (or b!1034023 b!1034025) bm!43685))

(assert (= (or b!1034026 bm!43685) bm!43686))

(assert (= (or b!1034020 bm!43686) bm!43687))

(assert (= (and bm!43687 c!104491) b!1034027))

(assert (= (and bm!43687 (not c!104491)) b!1034021))

(assert (= (and d!123913 res!690748) b!1034022))

(assert (= (and b!1034022 res!690749) b!1034019))

(declare-fun m!953555 () Bool)

(assert (=> b!1034027 m!953555))

(declare-fun m!953557 () Bool)

(assert (=> d!123913 m!953557))

(declare-fun m!953559 () Bool)

(assert (=> d!123913 m!953559))

(declare-fun m!953561 () Bool)

(assert (=> b!1034019 m!953561))

(declare-fun m!953563 () Bool)

(assert (=> b!1034022 m!953563))

(declare-fun m!953565 () Bool)

(assert (=> bm!43687 m!953565))

(assert (=> d!123741 d!123913))

(declare-fun d!123915 () Bool)

(assert (=> d!123915 (= (get!16429 (getValueByKey!590 (toList!6930 (+!3130 lt!456022 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))) lt!456020)) (v!14888 (getValueByKey!590 (toList!6930 (+!3130 lt!456022 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))) lt!456020)))))

(assert (=> d!123715 d!123915))

(declare-fun b!1034029 () Bool)

(declare-fun e!584505 () Option!641)

(assert (=> b!1034029 (= e!584505 (Some!640 (_2!7914 (h!23137 (toList!6930 (+!3130 lt!456022 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))))))))))

(declare-fun b!1034032 () Bool)

(declare-fun e!584506 () Option!641)

(assert (=> b!1034032 (= e!584506 None!639)))

(declare-fun b!1034031 () Bool)

(assert (=> b!1034031 (= e!584506 (getValueByKey!590 (t!31126 (toList!6930 (+!3130 lt!456022 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))))) lt!456020))))

(declare-fun d!123917 () Bool)

(declare-fun c!104493 () Bool)

(assert (=> d!123917 (= c!104493 (and ((_ is Cons!21935) (toList!6930 (+!3130 lt!456022 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))))) (= (_1!7914 (h!23137 (toList!6930 (+!3130 lt!456022 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))))) lt!456020)))))

(assert (=> d!123917 (= (getValueByKey!590 (toList!6930 (+!3130 lt!456022 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))) lt!456020) e!584505)))

(declare-fun b!1034030 () Bool)

(assert (=> b!1034030 (= e!584505 e!584506)))

(declare-fun c!104494 () Bool)

(assert (=> b!1034030 (= c!104494 (and ((_ is Cons!21935) (toList!6930 (+!3130 lt!456022 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))))) (not (= (_1!7914 (h!23137 (toList!6930 (+!3130 lt!456022 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))))) lt!456020))))))

(assert (= (and d!123917 c!104493) b!1034029))

(assert (= (and d!123917 (not c!104493)) b!1034030))

(assert (= (and b!1034030 c!104494) b!1034031))

(assert (= (and b!1034030 (not c!104494)) b!1034032))

(declare-fun m!953567 () Bool)

(assert (=> b!1034031 m!953567))

(assert (=> d!123715 d!123917))

(declare-fun d!123919 () Bool)

(assert (=> d!123919 (= (get!16430 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14885 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1033645 d!123919))

(declare-fun d!123921 () Bool)

(assert (=> d!123921 (= (isDefined!438 (getValueByKey!590 (toList!6930 lt!456003) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!932 (getValueByKey!590 (toList!6930 lt!456003) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30215 () Bool)

(assert (= bs!30215 d!123921))

(assert (=> bs!30215 m!953201))

(declare-fun m!953569 () Bool)

(assert (=> bs!30215 m!953569))

(assert (=> b!1033764 d!123921))

(assert (=> b!1033764 d!123865))

(declare-fun d!123923 () Bool)

(assert (=> d!123923 (isDefined!438 (getValueByKey!590 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) lt!456008))))

(declare-fun lt!456283 () Unit!33713)

(assert (=> d!123923 (= lt!456283 (choose!1706 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) lt!456008))))

(declare-fun e!584507 () Bool)

(assert (=> d!123923 e!584507))

(declare-fun res!690750 () Bool)

(assert (=> d!123923 (=> (not res!690750) (not e!584507))))

(assert (=> d!123923 (= res!690750 (isStrictlySorted!714 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))))))

(assert (=> d!123923 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) lt!456008) lt!456283)))

(declare-fun b!1034033 () Bool)

(assert (=> b!1034033 (= e!584507 (containsKey!563 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) lt!456008))))

(assert (= (and d!123923 res!690750) b!1034033))

(assert (=> d!123923 m!952905))

(assert (=> d!123923 m!952905))

(assert (=> d!123923 m!952907))

(declare-fun m!953571 () Bool)

(assert (=> d!123923 m!953571))

(declare-fun m!953573 () Bool)

(assert (=> d!123923 m!953573))

(assert (=> b!1034033 m!952901))

(assert (=> b!1033653 d!123923))

(declare-fun d!123925 () Bool)

(assert (=> d!123925 (= (isDefined!438 (getValueByKey!590 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) lt!456008)) (not (isEmpty!932 (getValueByKey!590 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) lt!456008))))))

(declare-fun bs!30216 () Bool)

(assert (= bs!30216 d!123925))

(assert (=> bs!30216 m!952905))

(declare-fun m!953575 () Bool)

(assert (=> bs!30216 m!953575))

(assert (=> b!1033653 d!123925))

(declare-fun b!1034034 () Bool)

(declare-fun e!584508 () Option!641)

(assert (=> b!1034034 (= e!584508 (Some!640 (_2!7914 (h!23137 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))))))))

(declare-fun b!1034037 () Bool)

(declare-fun e!584509 () Option!641)

(assert (=> b!1034037 (= e!584509 None!639)))

(declare-fun b!1034036 () Bool)

(assert (=> b!1034036 (= e!584509 (getValueByKey!590 (t!31126 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))) lt!456008))))

(declare-fun d!123927 () Bool)

(declare-fun c!104495 () Bool)

(assert (=> d!123927 (= c!104495 (and ((_ is Cons!21935) (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))) (= (_1!7914 (h!23137 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))) lt!456008)))))

(assert (=> d!123927 (= (getValueByKey!590 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) lt!456008) e!584508)))

(declare-fun b!1034035 () Bool)

(assert (=> b!1034035 (= e!584508 e!584509)))

(declare-fun c!104496 () Bool)

(assert (=> b!1034035 (= c!104496 (and ((_ is Cons!21935) (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))) (not (= (_1!7914 (h!23137 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))) lt!456008))))))

(assert (= (and d!123927 c!104495) b!1034034))

(assert (= (and d!123927 (not c!104495)) b!1034035))

(assert (= (and b!1034035 c!104496) b!1034036))

(assert (= (and b!1034035 (not c!104496)) b!1034037))

(declare-fun m!953577 () Bool)

(assert (=> b!1034036 m!953577))

(assert (=> b!1033653 d!123927))

(declare-fun b!1034038 () Bool)

(declare-fun e!584510 () Option!641)

(assert (=> b!1034038 (= e!584510 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456081)))))))

(declare-fun b!1034041 () Bool)

(declare-fun e!584511 () Option!641)

(assert (=> b!1034041 (= e!584511 None!639)))

(declare-fun b!1034040 () Bool)

(assert (=> b!1034040 (= e!584511 (getValueByKey!590 (t!31126 (toList!6930 lt!456081)) (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))))))

(declare-fun d!123929 () Bool)

(declare-fun c!104497 () Bool)

(assert (=> d!123929 (= c!104497 (and ((_ is Cons!21935) (toList!6930 lt!456081)) (= (_1!7914 (h!23137 (toList!6930 lt!456081))) (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))))))))

(assert (=> d!123929 (= (getValueByKey!590 (toList!6930 lt!456081) (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))) e!584510)))

(declare-fun b!1034039 () Bool)

(assert (=> b!1034039 (= e!584510 e!584511)))

(declare-fun c!104498 () Bool)

(assert (=> b!1034039 (= c!104498 (and ((_ is Cons!21935) (toList!6930 lt!456081)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456081))) (_1!7914 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!123929 c!104497) b!1034038))

(assert (= (and d!123929 (not c!104497)) b!1034039))

(assert (= (and b!1034039 c!104498) b!1034040))

(assert (= (and b!1034039 (not c!104498)) b!1034041))

(declare-fun m!953579 () Bool)

(assert (=> b!1034040 m!953579))

(assert (=> b!1033660 d!123929))

(assert (=> b!1033620 d!123727))

(declare-fun b!1034042 () Bool)

(declare-fun e!584513 () Bool)

(assert (=> b!1034042 (= e!584513 (contains!5993 (ite c!104413 (Cons!21937 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000) Nil!21938) Nil!21938) (select (arr!31320 (_keys!11402 lt!455914)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!123931 () Bool)

(declare-fun res!690753 () Bool)

(declare-fun e!584512 () Bool)

(assert (=> d!123931 (=> res!690753 e!584512)))

(assert (=> d!123931 (= res!690753 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 lt!455914))))))

(assert (=> d!123931 (= (arrayNoDuplicates!0 (_keys!11402 lt!455914) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104413 (Cons!21937 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000) Nil!21938) Nil!21938)) e!584512)))

(declare-fun bm!43688 () Bool)

(declare-fun call!43691 () Bool)

(declare-fun c!104499 () Bool)

(assert (=> bm!43688 (= call!43691 (arrayNoDuplicates!0 (_keys!11402 lt!455914) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!104499 (Cons!21937 (select (arr!31320 (_keys!11402 lt!455914)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!104413 (Cons!21937 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000) Nil!21938) Nil!21938)) (ite c!104413 (Cons!21937 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000) Nil!21938) Nil!21938))))))

(declare-fun b!1034043 () Bool)

(declare-fun e!584514 () Bool)

(assert (=> b!1034043 (= e!584514 call!43691)))

(declare-fun b!1034044 () Bool)

(assert (=> b!1034044 (= e!584514 call!43691)))

(declare-fun b!1034045 () Bool)

(declare-fun e!584515 () Bool)

(assert (=> b!1034045 (= e!584515 e!584514)))

(assert (=> b!1034045 (= c!104499 (validKeyInArray!0 (select (arr!31320 (_keys!11402 lt!455914)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1034046 () Bool)

(assert (=> b!1034046 (= e!584512 e!584515)))

(declare-fun res!690751 () Bool)

(assert (=> b!1034046 (=> (not res!690751) (not e!584515))))

(assert (=> b!1034046 (= res!690751 (not e!584513))))

(declare-fun res!690752 () Bool)

(assert (=> b!1034046 (=> (not res!690752) (not e!584513))))

(assert (=> b!1034046 (= res!690752 (validKeyInArray!0 (select (arr!31320 (_keys!11402 lt!455914)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!123931 (not res!690753)) b!1034046))

(assert (= (and b!1034046 res!690752) b!1034042))

(assert (= (and b!1034046 res!690751) b!1034045))

(assert (= (and b!1034045 c!104499) b!1034044))

(assert (= (and b!1034045 (not c!104499)) b!1034043))

(assert (= (or b!1034044 b!1034043) bm!43688))

(assert (=> b!1034042 m!953373))

(assert (=> b!1034042 m!953373))

(declare-fun m!953581 () Bool)

(assert (=> b!1034042 m!953581))

(assert (=> bm!43688 m!953373))

(declare-fun m!953583 () Bool)

(assert (=> bm!43688 m!953583))

(assert (=> b!1034045 m!953373))

(assert (=> b!1034045 m!953373))

(assert (=> b!1034045 m!953381))

(assert (=> b!1034046 m!953373))

(assert (=> b!1034046 m!953373))

(assert (=> b!1034046 m!953381))

(assert (=> bm!43667 d!123931))

(declare-fun d!123933 () Bool)

(assert (=> d!123933 (= (isDefined!438 (getValueByKey!590 (toList!6930 lt!456029) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!932 (getValueByKey!590 (toList!6930 lt!456029) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30217 () Bool)

(assert (= bs!30217 d!123933))

(assert (=> bs!30217 m!953145))

(declare-fun m!953585 () Bool)

(assert (=> bs!30217 m!953585))

(assert (=> b!1033767 d!123933))

(assert (=> b!1033767 d!123861))

(declare-fun d!123935 () Bool)

(assert (=> d!123935 (= (validMask!0 (mask!30078 lt!455914)) (and (or (= (mask!30078 lt!455914) #b00000000000000000000000000000111) (= (mask!30078 lt!455914) #b00000000000000000000000000001111) (= (mask!30078 lt!455914) #b00000000000000000000000000011111) (= (mask!30078 lt!455914) #b00000000000000000000000000111111) (= (mask!30078 lt!455914) #b00000000000000000000000001111111) (= (mask!30078 lt!455914) #b00000000000000000000000011111111) (= (mask!30078 lt!455914) #b00000000000000000000000111111111) (= (mask!30078 lt!455914) #b00000000000000000000001111111111) (= (mask!30078 lt!455914) #b00000000000000000000011111111111) (= (mask!30078 lt!455914) #b00000000000000000000111111111111) (= (mask!30078 lt!455914) #b00000000000000000001111111111111) (= (mask!30078 lt!455914) #b00000000000000000011111111111111) (= (mask!30078 lt!455914) #b00000000000000000111111111111111) (= (mask!30078 lt!455914) #b00000000000000001111111111111111) (= (mask!30078 lt!455914) #b00000000000000011111111111111111) (= (mask!30078 lt!455914) #b00000000000000111111111111111111) (= (mask!30078 lt!455914) #b00000000000001111111111111111111) (= (mask!30078 lt!455914) #b00000000000011111111111111111111) (= (mask!30078 lt!455914) #b00000000000111111111111111111111) (= (mask!30078 lt!455914) #b00000000001111111111111111111111) (= (mask!30078 lt!455914) #b00000000011111111111111111111111) (= (mask!30078 lt!455914) #b00000000111111111111111111111111) (= (mask!30078 lt!455914) #b00000001111111111111111111111111) (= (mask!30078 lt!455914) #b00000011111111111111111111111111) (= (mask!30078 lt!455914) #b00000111111111111111111111111111) (= (mask!30078 lt!455914) #b00001111111111111111111111111111) (= (mask!30078 lt!455914) #b00011111111111111111111111111111) (= (mask!30078 lt!455914) #b00111111111111111111111111111111)) (bvsle (mask!30078 lt!455914) #b00111111111111111111111111111111)))))

(assert (=> d!123721 d!123935))

(declare-fun b!1034047 () Bool)

(declare-fun e!584516 () Option!641)

(assert (=> b!1034047 (= e!584516 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456129)))))))

(declare-fun b!1034050 () Bool)

(declare-fun e!584517 () Option!641)

(assert (=> b!1034050 (= e!584517 None!639)))

(declare-fun b!1034049 () Bool)

(assert (=> b!1034049 (= e!584517 (getValueByKey!590 (t!31126 (toList!6930 lt!456129)) (_1!7914 (tuple2!15807 lt!455991 lt!455915))))))

(declare-fun d!123937 () Bool)

(declare-fun c!104500 () Bool)

(assert (=> d!123937 (= c!104500 (and ((_ is Cons!21935) (toList!6930 lt!456129)) (= (_1!7914 (h!23137 (toList!6930 lt!456129))) (_1!7914 (tuple2!15807 lt!455991 lt!455915)))))))

(assert (=> d!123937 (= (getValueByKey!590 (toList!6930 lt!456129) (_1!7914 (tuple2!15807 lt!455991 lt!455915))) e!584516)))

(declare-fun b!1034048 () Bool)

(assert (=> b!1034048 (= e!584516 e!584517)))

(declare-fun c!104501 () Bool)

(assert (=> b!1034048 (= c!104501 (and ((_ is Cons!21935) (toList!6930 lt!456129)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456129))) (_1!7914 (tuple2!15807 lt!455991 lt!455915))))))))

(assert (= (and d!123937 c!104500) b!1034047))

(assert (= (and d!123937 (not c!104500)) b!1034048))

(assert (= (and b!1034048 c!104501) b!1034049))

(assert (= (and b!1034048 (not c!104501)) b!1034050))

(declare-fun m!953587 () Bool)

(assert (=> b!1034049 m!953587))

(assert (=> b!1033723 d!123937))

(declare-fun d!123939 () Bool)

(declare-fun e!584518 () Bool)

(assert (=> d!123939 e!584518))

(declare-fun res!690754 () Bool)

(assert (=> d!123939 (=> res!690754 e!584518)))

(declare-fun lt!456284 () Bool)

(assert (=> d!123939 (= res!690754 (not lt!456284))))

(declare-fun lt!456287 () Bool)

(assert (=> d!123939 (= lt!456284 lt!456287)))

(declare-fun lt!456286 () Unit!33713)

(declare-fun e!584519 () Unit!33713)

(assert (=> d!123939 (= lt!456286 e!584519)))

(declare-fun c!104502 () Bool)

(assert (=> d!123939 (= c!104502 lt!456287)))

(assert (=> d!123939 (= lt!456287 (containsKey!563 (toList!6930 lt!456105) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123939 (= (contains!5992 lt!456105 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) lt!456284)))

(declare-fun b!1034051 () Bool)

(declare-fun lt!456285 () Unit!33713)

(assert (=> b!1034051 (= e!584519 lt!456285)))

(assert (=> b!1034051 (= lt!456285 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456105) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1034051 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456105) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034052 () Bool)

(declare-fun Unit!33734 () Unit!33713)

(assert (=> b!1034052 (= e!584519 Unit!33734)))

(declare-fun b!1034053 () Bool)

(assert (=> b!1034053 (= e!584518 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456105) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!123939 c!104502) b!1034051))

(assert (= (and d!123939 (not c!104502)) b!1034052))

(assert (= (and d!123939 (not res!690754)) b!1034053))

(assert (=> d!123939 m!952763))

(declare-fun m!953589 () Bool)

(assert (=> d!123939 m!953589))

(assert (=> b!1034051 m!952763))

(declare-fun m!953591 () Bool)

(assert (=> b!1034051 m!953591))

(assert (=> b!1034051 m!952763))

(declare-fun m!953593 () Bool)

(assert (=> b!1034051 m!953593))

(assert (=> b!1034051 m!953593))

(declare-fun m!953595 () Bool)

(assert (=> b!1034051 m!953595))

(assert (=> b!1034053 m!952763))

(assert (=> b!1034053 m!953593))

(assert (=> b!1034053 m!953593))

(assert (=> b!1034053 m!953595))

(assert (=> b!1033675 d!123939))

(assert (=> d!123703 d!123693))

(assert (=> d!123703 d!123713))

(assert (=> d!123703 d!123695))

(declare-fun d!123941 () Bool)

(assert (=> d!123941 (= (apply!899 (+!3130 lt!456009 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))) lt!456013) (apply!899 lt!456009 lt!456013))))

(assert (=> d!123941 true))

(declare-fun _$34!1165 () Unit!33713)

(assert (=> d!123941 (= (choose!1705 lt!456009 lt!456015 (minValue!6062 thiss!1427) lt!456013) _$34!1165)))

(declare-fun bs!30218 () Bool)

(assert (= bs!30218 d!123941))

(assert (=> bs!30218 m!952825))

(assert (=> bs!30218 m!952825))

(assert (=> bs!30218 m!952827))

(assert (=> bs!30218 m!952819))

(assert (=> d!123703 d!123941))

(declare-fun d!123943 () Bool)

(declare-fun e!584520 () Bool)

(assert (=> d!123943 e!584520))

(declare-fun res!690755 () Bool)

(assert (=> d!123943 (=> res!690755 e!584520)))

(declare-fun lt!456288 () Bool)

(assert (=> d!123943 (= res!690755 (not lt!456288))))

(declare-fun lt!456291 () Bool)

(assert (=> d!123943 (= lt!456288 lt!456291)))

(declare-fun lt!456290 () Unit!33713)

(declare-fun e!584521 () Unit!33713)

(assert (=> d!123943 (= lt!456290 e!584521)))

(declare-fun c!104503 () Bool)

(assert (=> d!123943 (= c!104503 lt!456291)))

(assert (=> d!123943 (= lt!456291 (containsKey!563 (toList!6930 lt!456009) lt!456013))))

(assert (=> d!123943 (= (contains!5992 lt!456009 lt!456013) lt!456288)))

(declare-fun b!1034054 () Bool)

(declare-fun lt!456289 () Unit!33713)

(assert (=> b!1034054 (= e!584521 lt!456289)))

(assert (=> b!1034054 (= lt!456289 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456009) lt!456013))))

(assert (=> b!1034054 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456009) lt!456013))))

(declare-fun b!1034055 () Bool)

(declare-fun Unit!33735 () Unit!33713)

(assert (=> b!1034055 (= e!584521 Unit!33735)))

(declare-fun b!1034056 () Bool)

(assert (=> b!1034056 (= e!584520 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456009) lt!456013)))))

(assert (= (and d!123943 c!104503) b!1034054))

(assert (= (and d!123943 (not c!104503)) b!1034055))

(assert (= (and d!123943 (not res!690755)) b!1034056))

(declare-fun m!953597 () Bool)

(assert (=> d!123943 m!953597))

(declare-fun m!953599 () Bool)

(assert (=> b!1034054 m!953599))

(assert (=> b!1034054 m!952917))

(assert (=> b!1034054 m!952917))

(declare-fun m!953601 () Bool)

(assert (=> b!1034054 m!953601))

(assert (=> b!1034056 m!952917))

(assert (=> b!1034056 m!952917))

(assert (=> b!1034056 m!953601))

(assert (=> d!123703 d!123943))

(declare-fun d!123945 () Bool)

(assert (=> d!123945 (= (get!16429 (getValueByKey!590 (toList!6930 lt!456029) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!14888 (getValueByKey!590 (toList!6930 lt!456029) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123799 d!123945))

(declare-fun b!1034057 () Bool)

(declare-fun e!584522 () Option!641)

(assert (=> b!1034057 (= e!584522 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456029)))))))

(declare-fun b!1034060 () Bool)

(declare-fun e!584523 () Option!641)

(assert (=> b!1034060 (= e!584523 None!639)))

(declare-fun b!1034059 () Bool)

(assert (=> b!1034059 (= e!584523 (getValueByKey!590 (t!31126 (toList!6930 lt!456029)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!123947 () Bool)

(declare-fun c!104504 () Bool)

(assert (=> d!123947 (= c!104504 (and ((_ is Cons!21935) (toList!6930 lt!456029)) (= (_1!7914 (h!23137 (toList!6930 lt!456029))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123947 (= (getValueByKey!590 (toList!6930 lt!456029) #b1000000000000000000000000000000000000000000000000000000000000000) e!584522)))

(declare-fun b!1034058 () Bool)

(assert (=> b!1034058 (= e!584522 e!584523)))

(declare-fun c!104505 () Bool)

(assert (=> b!1034058 (= c!104505 (and ((_ is Cons!21935) (toList!6930 lt!456029)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456029))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!123947 c!104504) b!1034057))

(assert (= (and d!123947 (not c!104504)) b!1034058))

(assert (= (and b!1034058 c!104505) b!1034059))

(assert (= (and b!1034058 (not c!104505)) b!1034060))

(declare-fun m!953603 () Bool)

(assert (=> b!1034059 m!953603))

(assert (=> d!123799 d!123947))

(declare-fun d!123949 () Bool)

(assert (=> d!123949 (= (isDefined!438 (getValueByKey!590 (toList!6930 lt!456029) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))) (not (isEmpty!932 (getValueByKey!590 (toList!6930 lt!456029) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun bs!30219 () Bool)

(assert (= bs!30219 d!123949))

(assert (=> bs!30219 m!953221))

(declare-fun m!953605 () Bool)

(assert (=> bs!30219 m!953605))

(assert (=> b!1033773 d!123949))

(assert (=> b!1033773 d!123813))

(declare-fun d!123951 () Bool)

(assert (=> d!123951 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456003) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!456292 () Unit!33713)

(assert (=> d!123951 (= lt!456292 (choose!1706 (toList!6930 lt!456003) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!584524 () Bool)

(assert (=> d!123951 e!584524))

(declare-fun res!690756 () Bool)

(assert (=> d!123951 (=> (not res!690756) (not e!584524))))

(assert (=> d!123951 (= res!690756 (isStrictlySorted!714 (toList!6930 lt!456003)))))

(assert (=> d!123951 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456003) #b0000000000000000000000000000000000000000000000000000000000000000) lt!456292)))

(declare-fun b!1034061 () Bool)

(assert (=> b!1034061 (= e!584524 (containsKey!563 (toList!6930 lt!456003) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!123951 res!690756) b!1034061))

(assert (=> d!123951 m!953157))

(assert (=> d!123951 m!953157))

(assert (=> d!123951 m!953215))

(declare-fun m!953607 () Bool)

(assert (=> d!123951 m!953607))

(declare-fun m!953609 () Bool)

(assert (=> d!123951 m!953609))

(assert (=> b!1034061 m!953211))

(assert (=> b!1033768 d!123951))

(declare-fun d!123953 () Bool)

(assert (=> d!123953 (= (isDefined!438 (getValueByKey!590 (toList!6930 lt!456003) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!932 (getValueByKey!590 (toList!6930 lt!456003) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30220 () Bool)

(assert (= bs!30220 d!123953))

(assert (=> bs!30220 m!953157))

(declare-fun m!953611 () Bool)

(assert (=> bs!30220 m!953611))

(assert (=> b!1033768 d!123953))

(declare-fun b!1034062 () Bool)

(declare-fun e!584525 () Option!641)

(assert (=> b!1034062 (= e!584525 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456003)))))))

(declare-fun b!1034065 () Bool)

(declare-fun e!584526 () Option!641)

(assert (=> b!1034065 (= e!584526 None!639)))

(declare-fun b!1034064 () Bool)

(assert (=> b!1034064 (= e!584526 (getValueByKey!590 (t!31126 (toList!6930 lt!456003)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!123955 () Bool)

(declare-fun c!104506 () Bool)

(assert (=> d!123955 (= c!104506 (and ((_ is Cons!21935) (toList!6930 lt!456003)) (= (_1!7914 (h!23137 (toList!6930 lt!456003))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123955 (= (getValueByKey!590 (toList!6930 lt!456003) #b0000000000000000000000000000000000000000000000000000000000000000) e!584525)))

(declare-fun b!1034063 () Bool)

(assert (=> b!1034063 (= e!584525 e!584526)))

(declare-fun c!104507 () Bool)

(assert (=> b!1034063 (= c!104507 (and ((_ is Cons!21935) (toList!6930 lt!456003)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456003))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!123955 c!104506) b!1034062))

(assert (= (and d!123955 (not c!104506)) b!1034063))

(assert (= (and b!1034063 c!104507) b!1034064))

(assert (= (and b!1034063 (not c!104507)) b!1034065))

(declare-fun m!953613 () Bool)

(assert (=> b!1034064 m!953613))

(assert (=> b!1033768 d!123955))

(declare-fun d!123957 () Bool)

(declare-fun lt!456293 () Bool)

(assert (=> d!123957 (= lt!456293 (select (content!512 (toList!6930 lt!456139)) (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun e!584528 () Bool)

(assert (=> d!123957 (= lt!456293 e!584528)))

(declare-fun res!690758 () Bool)

(assert (=> d!123957 (=> (not res!690758) (not e!584528))))

(assert (=> d!123957 (= res!690758 ((_ is Cons!21935) (toList!6930 lt!456139)))))

(assert (=> d!123957 (= (contains!5994 (toList!6930 lt!456139) (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!456293)))

(declare-fun b!1034066 () Bool)

(declare-fun e!584527 () Bool)

(assert (=> b!1034066 (= e!584528 e!584527)))

(declare-fun res!690757 () Bool)

(assert (=> b!1034066 (=> res!690757 e!584527)))

(assert (=> b!1034066 (= res!690757 (= (h!23137 (toList!6930 lt!456139)) (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034067 () Bool)

(assert (=> b!1034067 (= e!584527 (contains!5994 (t!31126 (toList!6930 lt!456139)) (ite (or c!104347 c!104348) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 lt!455915) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (= (and d!123957 res!690758) b!1034066))

(assert (= (and b!1034066 (not res!690757)) b!1034067))

(declare-fun m!953615 () Bool)

(assert (=> d!123957 m!953615))

(declare-fun m!953617 () Bool)

(assert (=> d!123957 m!953617))

(declare-fun m!953619 () Bool)

(assert (=> b!1034067 m!953619))

(assert (=> b!1033730 d!123957))

(declare-fun b!1034068 () Bool)

(declare-fun e!584529 () Option!641)

(assert (=> b!1034068 (= e!584529 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456092)))))))

(declare-fun b!1034071 () Bool)

(declare-fun e!584530 () Option!641)

(assert (=> b!1034071 (= e!584530 None!639)))

(declare-fun b!1034070 () Bool)

(assert (=> b!1034070 (= e!584530 (getValueByKey!590 (t!31126 (toList!6930 lt!456092)) (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))))

(declare-fun c!104508 () Bool)

(declare-fun d!123959 () Bool)

(assert (=> d!123959 (= c!104508 (and ((_ is Cons!21935) (toList!6930 lt!456092)) (= (_1!7914 (h!23137 (toList!6930 lt!456092))) (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))))))

(assert (=> d!123959 (= (getValueByKey!590 (toList!6930 lt!456092) (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) e!584529)))

(declare-fun b!1034069 () Bool)

(assert (=> b!1034069 (= e!584529 e!584530)))

(declare-fun c!104509 () Bool)

(assert (=> b!1034069 (= c!104509 (and ((_ is Cons!21935) (toList!6930 lt!456092)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456092))) (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))))))

(assert (= (and d!123959 c!104508) b!1034068))

(assert (= (and d!123959 (not c!104508)) b!1034069))

(assert (= (and b!1034069 c!104509) b!1034070))

(assert (= (and b!1034069 (not c!104509)) b!1034071))

(declare-fun m!953621 () Bool)

(assert (=> b!1034070 m!953621))

(assert (=> b!1033668 d!123959))

(declare-fun d!123961 () Bool)

(assert (=> d!123961 (= (apply!899 (+!3130 lt!456002 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))) lt!455993) (apply!899 lt!456002 lt!455993))))

(assert (=> d!123961 true))

(declare-fun _$34!1166 () Unit!33713)

(assert (=> d!123961 (= (choose!1705 lt!456002 lt!456001 (minValue!6062 thiss!1427) lt!455993) _$34!1166)))

(declare-fun bs!30221 () Bool)

(assert (= bs!30221 d!123961))

(assert (=> bs!30221 m!952739))

(assert (=> bs!30221 m!952739))

(assert (=> bs!30221 m!952745))

(assert (=> bs!30221 m!952769))

(assert (=> d!123733 d!123961))

(assert (=> d!123733 d!123729))

(assert (=> d!123733 d!123735))

(declare-fun d!123963 () Bool)

(declare-fun e!584531 () Bool)

(assert (=> d!123963 e!584531))

(declare-fun res!690759 () Bool)

(assert (=> d!123963 (=> res!690759 e!584531)))

(declare-fun lt!456294 () Bool)

(assert (=> d!123963 (= res!690759 (not lt!456294))))

(declare-fun lt!456297 () Bool)

(assert (=> d!123963 (= lt!456294 lt!456297)))

(declare-fun lt!456296 () Unit!33713)

(declare-fun e!584532 () Unit!33713)

(assert (=> d!123963 (= lt!456296 e!584532)))

(declare-fun c!104510 () Bool)

(assert (=> d!123963 (= c!104510 lt!456297)))

(assert (=> d!123963 (= lt!456297 (containsKey!563 (toList!6930 lt!456002) lt!455993))))

(assert (=> d!123963 (= (contains!5992 lt!456002 lt!455993) lt!456294)))

(declare-fun b!1034072 () Bool)

(declare-fun lt!456295 () Unit!33713)

(assert (=> b!1034072 (= e!584532 lt!456295)))

(assert (=> b!1034072 (= lt!456295 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456002) lt!455993))))

(assert (=> b!1034072 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456002) lt!455993))))

(declare-fun b!1034073 () Bool)

(declare-fun Unit!33736 () Unit!33713)

(assert (=> b!1034073 (= e!584532 Unit!33736)))

(declare-fun b!1034074 () Bool)

(assert (=> b!1034074 (= e!584531 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456002) lt!455993)))))

(assert (= (and d!123963 c!104510) b!1034072))

(assert (= (and d!123963 (not c!104510)) b!1034073))

(assert (= (and d!123963 (not res!690759)) b!1034074))

(declare-fun m!953623 () Bool)

(assert (=> d!123963 m!953623))

(declare-fun m!953625 () Bool)

(assert (=> b!1034072 m!953625))

(assert (=> b!1034072 m!953025))

(assert (=> b!1034072 m!953025))

(declare-fun m!953627 () Bool)

(assert (=> b!1034072 m!953627))

(assert (=> b!1034074 m!953025))

(assert (=> b!1034074 m!953025))

(assert (=> b!1034074 m!953627))

(assert (=> d!123733 d!123963))

(assert (=> d!123733 d!123737))

(declare-fun d!123965 () Bool)

(assert (=> d!123965 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456003) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun lt!456298 () Unit!33713)

(assert (=> d!123965 (= lt!456298 (choose!1706 (toList!6930 lt!456003) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!584533 () Bool)

(assert (=> d!123965 e!584533))

(declare-fun res!690760 () Bool)

(assert (=> d!123965 (=> (not res!690760) (not e!584533))))

(assert (=> d!123965 (= res!690760 (isStrictlySorted!714 (toList!6930 lt!456003)))))

(assert (=> d!123965 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456003) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) lt!456298)))

(declare-fun b!1034075 () Bool)

(assert (=> b!1034075 (= e!584533 (containsKey!563 (toList!6930 lt!456003) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123965 res!690760) b!1034075))

(assert (=> d!123965 m!952763))

(assert (=> d!123965 m!952893))

(assert (=> d!123965 m!952893))

(assert (=> d!123965 m!953241))

(assert (=> d!123965 m!952763))

(declare-fun m!953629 () Bool)

(assert (=> d!123965 m!953629))

(assert (=> d!123965 m!953609))

(assert (=> b!1034075 m!952763))

(assert (=> b!1034075 m!953237))

(assert (=> b!1033776 d!123965))

(declare-fun d!123967 () Bool)

(assert (=> d!123967 (= (isDefined!438 (getValueByKey!590 (toList!6930 lt!456003) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))) (not (isEmpty!932 (getValueByKey!590 (toList!6930 lt!456003) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun bs!30222 () Bool)

(assert (= bs!30222 d!123967))

(assert (=> bs!30222 m!952893))

(declare-fun m!953631 () Bool)

(assert (=> bs!30222 m!953631))

(assert (=> b!1033776 d!123967))

(assert (=> b!1033776 d!123825))

(assert (=> b!1033808 d!123837))

(assert (=> d!123711 d!123691))

(assert (=> d!123711 d!123697))

(assert (=> d!123711 d!123699))

(declare-fun d!123969 () Bool)

(declare-fun e!584534 () Bool)

(assert (=> d!123969 e!584534))

(declare-fun res!690761 () Bool)

(assert (=> d!123969 (=> res!690761 e!584534)))

(declare-fun lt!456299 () Bool)

(assert (=> d!123969 (= res!690761 (not lt!456299))))

(declare-fun lt!456302 () Bool)

(assert (=> d!123969 (= lt!456299 lt!456302)))

(declare-fun lt!456301 () Unit!33713)

(declare-fun e!584535 () Unit!33713)

(assert (=> d!123969 (= lt!456301 e!584535)))

(declare-fun c!104511 () Bool)

(assert (=> d!123969 (= c!104511 lt!456302)))

(assert (=> d!123969 (= lt!456302 (containsKey!563 (toList!6930 lt!456028) lt!456019))))

(assert (=> d!123969 (= (contains!5992 lt!456028 lt!456019) lt!456299)))

(declare-fun b!1034076 () Bool)

(declare-fun lt!456300 () Unit!33713)

(assert (=> b!1034076 (= e!584535 lt!456300)))

(assert (=> b!1034076 (= lt!456300 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456028) lt!456019))))

(assert (=> b!1034076 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456028) lt!456019))))

(declare-fun b!1034077 () Bool)

(declare-fun Unit!33737 () Unit!33713)

(assert (=> b!1034077 (= e!584535 Unit!33737)))

(declare-fun b!1034078 () Bool)

(assert (=> b!1034078 (= e!584534 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456028) lt!456019)))))

(assert (= (and d!123969 c!104511) b!1034076))

(assert (= (and d!123969 (not c!104511)) b!1034077))

(assert (= (and d!123969 (not res!690761)) b!1034078))

(declare-fun m!953633 () Bool)

(assert (=> d!123969 m!953633))

(declare-fun m!953635 () Bool)

(assert (=> b!1034076 m!953635))

(assert (=> b!1034076 m!952933))

(assert (=> b!1034076 m!952933))

(declare-fun m!953637 () Bool)

(assert (=> b!1034076 m!953637))

(assert (=> b!1034078 m!952933))

(assert (=> b!1034078 m!952933))

(assert (=> b!1034078 m!953637))

(assert (=> d!123711 d!123969))

(declare-fun d!123971 () Bool)

(assert (=> d!123971 (= (apply!899 (+!3130 lt!456028 (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))) lt!456019) (apply!899 lt!456028 lt!456019))))

(assert (=> d!123971 true))

(declare-fun _$34!1167 () Unit!33713)

(assert (=> d!123971 (= (choose!1705 lt!456028 lt!456027 (minValue!6062 thiss!1427) lt!456019) _$34!1167)))

(declare-fun bs!30223 () Bool)

(assert (= bs!30223 d!123971))

(assert (=> bs!30223 m!952811))

(assert (=> bs!30223 m!952811))

(assert (=> bs!30223 m!952817))

(assert (=> bs!30223 m!952839))

(assert (=> d!123711 d!123971))

(assert (=> b!1033591 d!123727))

(declare-fun d!123973 () Bool)

(declare-fun e!584536 () Bool)

(assert (=> d!123973 e!584536))

(declare-fun res!690762 () Bool)

(assert (=> d!123973 (=> res!690762 e!584536)))

(declare-fun lt!456303 () Bool)

(assert (=> d!123973 (= res!690762 (not lt!456303))))

(declare-fun lt!456306 () Bool)

(assert (=> d!123973 (= lt!456303 lt!456306)))

(declare-fun lt!456305 () Unit!33713)

(declare-fun e!584537 () Unit!33713)

(assert (=> d!123973 (= lt!456305 e!584537)))

(declare-fun c!104512 () Bool)

(assert (=> d!123973 (= c!104512 lt!456306)))

(assert (=> d!123973 (= lt!456306 (containsKey!563 (toList!6930 lt!456129) (_1!7914 (tuple2!15807 lt!455991 lt!455915))))))

(assert (=> d!123973 (= (contains!5992 lt!456129 (_1!7914 (tuple2!15807 lt!455991 lt!455915))) lt!456303)))

(declare-fun b!1034079 () Bool)

(declare-fun lt!456304 () Unit!33713)

(assert (=> b!1034079 (= e!584537 lt!456304)))

(assert (=> b!1034079 (= lt!456304 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456129) (_1!7914 (tuple2!15807 lt!455991 lt!455915))))))

(assert (=> b!1034079 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456129) (_1!7914 (tuple2!15807 lt!455991 lt!455915))))))

(declare-fun b!1034080 () Bool)

(declare-fun Unit!33738 () Unit!33713)

(assert (=> b!1034080 (= e!584537 Unit!33738)))

(declare-fun b!1034081 () Bool)

(assert (=> b!1034081 (= e!584536 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456129) (_1!7914 (tuple2!15807 lt!455991 lt!455915)))))))

(assert (= (and d!123973 c!104512) b!1034079))

(assert (= (and d!123973 (not c!104512)) b!1034080))

(assert (= (and d!123973 (not res!690762)) b!1034081))

(declare-fun m!953639 () Bool)

(assert (=> d!123973 m!953639))

(declare-fun m!953641 () Bool)

(assert (=> b!1034079 m!953641))

(assert (=> b!1034079 m!953089))

(assert (=> b!1034079 m!953089))

(declare-fun m!953643 () Bool)

(assert (=> b!1034079 m!953643))

(assert (=> b!1034081 m!953089))

(assert (=> b!1034081 m!953089))

(assert (=> b!1034081 m!953643))

(assert (=> d!123745 d!123973))

(declare-fun b!1034082 () Bool)

(declare-fun e!584538 () Option!641)

(assert (=> b!1034082 (= e!584538 (Some!640 (_2!7914 (h!23137 lt!456131))))))

(declare-fun b!1034085 () Bool)

(declare-fun e!584539 () Option!641)

(assert (=> b!1034085 (= e!584539 None!639)))

(declare-fun b!1034084 () Bool)

(assert (=> b!1034084 (= e!584539 (getValueByKey!590 (t!31126 lt!456131) (_1!7914 (tuple2!15807 lt!455991 lt!455915))))))

(declare-fun d!123975 () Bool)

(declare-fun c!104513 () Bool)

(assert (=> d!123975 (= c!104513 (and ((_ is Cons!21935) lt!456131) (= (_1!7914 (h!23137 lt!456131)) (_1!7914 (tuple2!15807 lt!455991 lt!455915)))))))

(assert (=> d!123975 (= (getValueByKey!590 lt!456131 (_1!7914 (tuple2!15807 lt!455991 lt!455915))) e!584538)))

(declare-fun b!1034083 () Bool)

(assert (=> b!1034083 (= e!584538 e!584539)))

(declare-fun c!104514 () Bool)

(assert (=> b!1034083 (= c!104514 (and ((_ is Cons!21935) lt!456131) (not (= (_1!7914 (h!23137 lt!456131)) (_1!7914 (tuple2!15807 lt!455991 lt!455915))))))))

(assert (= (and d!123975 c!104513) b!1034082))

(assert (= (and d!123975 (not c!104513)) b!1034083))

(assert (= (and b!1034083 c!104514) b!1034084))

(assert (= (and b!1034083 (not c!104514)) b!1034085))

(declare-fun m!953645 () Bool)

(assert (=> b!1034084 m!953645))

(assert (=> d!123745 d!123975))

(declare-fun d!123977 () Bool)

(assert (=> d!123977 (= (getValueByKey!590 lt!456131 (_1!7914 (tuple2!15807 lt!455991 lt!455915))) (Some!640 (_2!7914 (tuple2!15807 lt!455991 lt!455915))))))

(declare-fun lt!456307 () Unit!33713)

(assert (=> d!123977 (= lt!456307 (choose!1707 lt!456131 (_1!7914 (tuple2!15807 lt!455991 lt!455915)) (_2!7914 (tuple2!15807 lt!455991 lt!455915))))))

(declare-fun e!584540 () Bool)

(assert (=> d!123977 e!584540))

(declare-fun res!690763 () Bool)

(assert (=> d!123977 (=> (not res!690763) (not e!584540))))

(assert (=> d!123977 (= res!690763 (isStrictlySorted!714 lt!456131))))

(assert (=> d!123977 (= (lemmaContainsTupThenGetReturnValue!280 lt!456131 (_1!7914 (tuple2!15807 lt!455991 lt!455915)) (_2!7914 (tuple2!15807 lt!455991 lt!455915))) lt!456307)))

(declare-fun b!1034086 () Bool)

(declare-fun res!690764 () Bool)

(assert (=> b!1034086 (=> (not res!690764) (not e!584540))))

(assert (=> b!1034086 (= res!690764 (containsKey!563 lt!456131 (_1!7914 (tuple2!15807 lt!455991 lt!455915))))))

(declare-fun b!1034087 () Bool)

(assert (=> b!1034087 (= e!584540 (contains!5994 lt!456131 (tuple2!15807 (_1!7914 (tuple2!15807 lt!455991 lt!455915)) (_2!7914 (tuple2!15807 lt!455991 lt!455915)))))))

(assert (= (and d!123977 res!690763) b!1034086))

(assert (= (and b!1034086 res!690764) b!1034087))

(assert (=> d!123977 m!953083))

(declare-fun m!953647 () Bool)

(assert (=> d!123977 m!953647))

(declare-fun m!953649 () Bool)

(assert (=> d!123977 m!953649))

(declare-fun m!953651 () Bool)

(assert (=> b!1034086 m!953651))

(declare-fun m!953653 () Bool)

(assert (=> b!1034087 m!953653))

(assert (=> d!123745 d!123977))

(declare-fun e!584542 () Bool)

(declare-fun b!1034088 () Bool)

(declare-fun lt!456308 () List!21939)

(assert (=> b!1034088 (= e!584542 (contains!5994 lt!456308 (tuple2!15807 (_1!7914 (tuple2!15807 lt!455991 lt!455915)) (_2!7914 (tuple2!15807 lt!455991 lt!455915)))))))

(declare-fun b!1034089 () Bool)

(declare-fun e!584544 () List!21939)

(declare-fun call!43692 () List!21939)

(assert (=> b!1034089 (= e!584544 call!43692)))

(declare-fun c!104518 () Bool)

(declare-fun c!104516 () Bool)

(declare-fun b!1034090 () Bool)

(declare-fun e!584541 () List!21939)

(assert (=> b!1034090 (= e!584541 (ite c!104518 (t!31126 (toList!6930 lt!455996)) (ite c!104516 (Cons!21935 (h!23137 (toList!6930 lt!455996)) (t!31126 (toList!6930 lt!455996))) Nil!21936)))))

(declare-fun b!1034091 () Bool)

(declare-fun res!690766 () Bool)

(assert (=> b!1034091 (=> (not res!690766) (not e!584542))))

(assert (=> b!1034091 (= res!690766 (containsKey!563 lt!456308 (_1!7914 (tuple2!15807 lt!455991 lt!455915))))))

(declare-fun b!1034092 () Bool)

(declare-fun e!584545 () List!21939)

(declare-fun call!43694 () List!21939)

(assert (=> b!1034092 (= e!584545 call!43694)))

(declare-fun bm!43689 () Bool)

(declare-fun call!43693 () List!21939)

(assert (=> bm!43689 (= call!43694 call!43693)))

(declare-fun b!1034093 () Bool)

(declare-fun e!584543 () List!21939)

(assert (=> b!1034093 (= e!584544 e!584543)))

(assert (=> b!1034093 (= c!104518 (and ((_ is Cons!21935) (toList!6930 lt!455996)) (= (_1!7914 (h!23137 (toList!6930 lt!455996))) (_1!7914 (tuple2!15807 lt!455991 lt!455915)))))))

(declare-fun b!1034094 () Bool)

(assert (=> b!1034094 (= e!584545 call!43694)))

(declare-fun b!1034095 () Bool)

(assert (=> b!1034095 (= e!584543 call!43693)))

(declare-fun d!123979 () Bool)

(assert (=> d!123979 e!584542))

(declare-fun res!690765 () Bool)

(assert (=> d!123979 (=> (not res!690765) (not e!584542))))

(assert (=> d!123979 (= res!690765 (isStrictlySorted!714 lt!456308))))

(assert (=> d!123979 (= lt!456308 e!584544)))

(declare-fun c!104515 () Bool)

(assert (=> d!123979 (= c!104515 (and ((_ is Cons!21935) (toList!6930 lt!455996)) (bvslt (_1!7914 (h!23137 (toList!6930 lt!455996))) (_1!7914 (tuple2!15807 lt!455991 lt!455915)))))))

(assert (=> d!123979 (isStrictlySorted!714 (toList!6930 lt!455996))))

(assert (=> d!123979 (= (insertStrictlySorted!373 (toList!6930 lt!455996) (_1!7914 (tuple2!15807 lt!455991 lt!455915)) (_2!7914 (tuple2!15807 lt!455991 lt!455915))) lt!456308)))

(declare-fun bm!43690 () Bool)

(assert (=> bm!43690 (= call!43693 call!43692)))

(declare-fun bm!43691 () Bool)

(assert (=> bm!43691 (= call!43692 ($colon$colon!604 e!584541 (ite c!104515 (h!23137 (toList!6930 lt!455996)) (tuple2!15807 (_1!7914 (tuple2!15807 lt!455991 lt!455915)) (_2!7914 (tuple2!15807 lt!455991 lt!455915))))))))

(declare-fun c!104517 () Bool)

(assert (=> bm!43691 (= c!104517 c!104515)))

(declare-fun b!1034096 () Bool)

(assert (=> b!1034096 (= e!584541 (insertStrictlySorted!373 (t!31126 (toList!6930 lt!455996)) (_1!7914 (tuple2!15807 lt!455991 lt!455915)) (_2!7914 (tuple2!15807 lt!455991 lt!455915))))))

(declare-fun b!1034097 () Bool)

(assert (=> b!1034097 (= c!104516 (and ((_ is Cons!21935) (toList!6930 lt!455996)) (bvsgt (_1!7914 (h!23137 (toList!6930 lt!455996))) (_1!7914 (tuple2!15807 lt!455991 lt!455915)))))))

(assert (=> b!1034097 (= e!584543 e!584545)))

(assert (= (and d!123979 c!104515) b!1034089))

(assert (= (and d!123979 (not c!104515)) b!1034093))

(assert (= (and b!1034093 c!104518) b!1034095))

(assert (= (and b!1034093 (not c!104518)) b!1034097))

(assert (= (and b!1034097 c!104516) b!1034092))

(assert (= (and b!1034097 (not c!104516)) b!1034094))

(assert (= (or b!1034092 b!1034094) bm!43689))

(assert (= (or b!1034095 bm!43689) bm!43690))

(assert (= (or b!1034089 bm!43690) bm!43691))

(assert (= (and bm!43691 c!104517) b!1034096))

(assert (= (and bm!43691 (not c!104517)) b!1034090))

(assert (= (and d!123979 res!690765) b!1034091))

(assert (= (and b!1034091 res!690766) b!1034088))

(declare-fun m!953655 () Bool)

(assert (=> b!1034096 m!953655))

(declare-fun m!953657 () Bool)

(assert (=> d!123979 m!953657))

(declare-fun m!953659 () Bool)

(assert (=> d!123979 m!953659))

(declare-fun m!953661 () Bool)

(assert (=> b!1034088 m!953661))

(declare-fun m!953663 () Bool)

(assert (=> b!1034091 m!953663))

(declare-fun m!953665 () Bool)

(assert (=> bm!43691 m!953665))

(assert (=> d!123745 d!123979))

(declare-fun d!123981 () Bool)

(declare-fun lt!456309 () Bool)

(assert (=> d!123981 (= lt!456309 (select (content!512 (toList!6930 lt!456125)) (tuple2!15807 lt!456000 lt!455915)))))

(declare-fun e!584547 () Bool)

(assert (=> d!123981 (= lt!456309 e!584547)))

(declare-fun res!690768 () Bool)

(assert (=> d!123981 (=> (not res!690768) (not e!584547))))

(assert (=> d!123981 (= res!690768 ((_ is Cons!21935) (toList!6930 lt!456125)))))

(assert (=> d!123981 (= (contains!5994 (toList!6930 lt!456125) (tuple2!15807 lt!456000 lt!455915)) lt!456309)))

(declare-fun b!1034098 () Bool)

(declare-fun e!584546 () Bool)

(assert (=> b!1034098 (= e!584547 e!584546)))

(declare-fun res!690767 () Bool)

(assert (=> b!1034098 (=> res!690767 e!584546)))

(assert (=> b!1034098 (= res!690767 (= (h!23137 (toList!6930 lt!456125)) (tuple2!15807 lt!456000 lt!455915)))))

(declare-fun b!1034099 () Bool)

(assert (=> b!1034099 (= e!584546 (contains!5994 (t!31126 (toList!6930 lt!456125)) (tuple2!15807 lt!456000 lt!455915)))))

(assert (= (and d!123981 res!690768) b!1034098))

(assert (= (and b!1034098 (not res!690767)) b!1034099))

(declare-fun m!953667 () Bool)

(assert (=> d!123981 m!953667))

(declare-fun m!953669 () Bool)

(assert (=> d!123981 m!953669))

(declare-fun m!953671 () Bool)

(assert (=> b!1034099 m!953671))

(assert (=> b!1033722 d!123981))

(declare-fun d!123983 () Bool)

(declare-fun e!584548 () Bool)

(assert (=> d!123983 e!584548))

(declare-fun res!690769 () Bool)

(assert (=> d!123983 (=> res!690769 e!584548)))

(declare-fun lt!456310 () Bool)

(assert (=> d!123983 (= res!690769 (not lt!456310))))

(declare-fun lt!456313 () Bool)

(assert (=> d!123983 (= lt!456310 lt!456313)))

(declare-fun lt!456312 () Unit!33713)

(declare-fun e!584549 () Unit!33713)

(assert (=> d!123983 (= lt!456312 e!584549)))

(declare-fun c!104519 () Bool)

(assert (=> d!123983 (= c!104519 lt!456313)))

(assert (=> d!123983 (= lt!456313 (containsKey!563 (toList!6930 lt!456045) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123983 (= (contains!5992 lt!456045 #b1000000000000000000000000000000000000000000000000000000000000000) lt!456310)))

(declare-fun b!1034100 () Bool)

(declare-fun lt!456311 () Unit!33713)

(assert (=> b!1034100 (= e!584549 lt!456311)))

(assert (=> b!1034100 (= lt!456311 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456045) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1034100 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456045) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1034101 () Bool)

(declare-fun Unit!33739 () Unit!33713)

(assert (=> b!1034101 (= e!584549 Unit!33739)))

(declare-fun b!1034102 () Bool)

(assert (=> b!1034102 (= e!584548 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456045) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123983 c!104519) b!1034100))

(assert (= (and d!123983 (not c!104519)) b!1034101))

(assert (= (and d!123983 (not res!690769)) b!1034102))

(declare-fun m!953673 () Bool)

(assert (=> d!123983 m!953673))

(declare-fun m!953675 () Bool)

(assert (=> b!1034100 m!953675))

(declare-fun m!953677 () Bool)

(assert (=> b!1034100 m!953677))

(assert (=> b!1034100 m!953677))

(declare-fun m!953679 () Bool)

(assert (=> b!1034100 m!953679))

(assert (=> b!1034102 m!953677))

(assert (=> b!1034102 m!953677))

(assert (=> b!1034102 m!953679))

(assert (=> b!1033628 d!123983))

(declare-fun d!123985 () Bool)

(declare-fun e!584550 () Bool)

(assert (=> d!123985 e!584550))

(declare-fun res!690770 () Bool)

(assert (=> d!123985 (=> res!690770 e!584550)))

(declare-fun lt!456314 () Bool)

(assert (=> d!123985 (= res!690770 (not lt!456314))))

(declare-fun lt!456317 () Bool)

(assert (=> d!123985 (= lt!456314 lt!456317)))

(declare-fun lt!456316 () Unit!33713)

(declare-fun e!584551 () Unit!33713)

(assert (=> d!123985 (= lt!456316 e!584551)))

(declare-fun c!104520 () Bool)

(assert (=> d!123985 (= c!104520 lt!456317)))

(assert (=> d!123985 (= lt!456317 (containsKey!563 (toList!6930 lt!456092) (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))))

(assert (=> d!123985 (= (contains!5992 lt!456092 (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) lt!456314)))

(declare-fun b!1034103 () Bool)

(declare-fun lt!456315 () Unit!33713)

(assert (=> b!1034103 (= e!584551 lt!456315)))

(assert (=> b!1034103 (= lt!456315 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456092) (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))))

(assert (=> b!1034103 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456092) (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))))

(declare-fun b!1034104 () Bool)

(declare-fun Unit!33740 () Unit!33713)

(assert (=> b!1034104 (= e!584551 Unit!33740)))

(declare-fun b!1034105 () Bool)

(assert (=> b!1034105 (= e!584550 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456092) (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))))))

(assert (= (and d!123985 c!104520) b!1034103))

(assert (= (and d!123985 (not c!104520)) b!1034104))

(assert (= (and d!123985 (not res!690770)) b!1034105))

(declare-fun m!953681 () Bool)

(assert (=> d!123985 m!953681))

(declare-fun m!953683 () Bool)

(assert (=> b!1034103 m!953683))

(assert (=> b!1034103 m!952957))

(assert (=> b!1034103 m!952957))

(declare-fun m!953685 () Bool)

(assert (=> b!1034103 m!953685))

(assert (=> b!1034105 m!952957))

(assert (=> b!1034105 m!952957))

(assert (=> b!1034105 m!953685))

(assert (=> d!123707 d!123985))

(declare-fun b!1034106 () Bool)

(declare-fun e!584552 () Option!641)

(assert (=> b!1034106 (= e!584552 (Some!640 (_2!7914 (h!23137 lt!456094))))))

(declare-fun b!1034109 () Bool)

(declare-fun e!584553 () Option!641)

(assert (=> b!1034109 (= e!584553 None!639)))

(declare-fun b!1034108 () Bool)

(assert (=> b!1034108 (= e!584553 (getValueByKey!590 (t!31126 lt!456094) (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))))

(declare-fun d!123987 () Bool)

(declare-fun c!104521 () Bool)

(assert (=> d!123987 (= c!104521 (and ((_ is Cons!21935) lt!456094) (= (_1!7914 (h!23137 lt!456094)) (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))))))

(assert (=> d!123987 (= (getValueByKey!590 lt!456094 (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) e!584552)))

(declare-fun b!1034107 () Bool)

(assert (=> b!1034107 (= e!584552 e!584553)))

(declare-fun c!104522 () Bool)

(assert (=> b!1034107 (= c!104522 (and ((_ is Cons!21935) lt!456094) (not (= (_1!7914 (h!23137 lt!456094)) (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))))))

(assert (= (and d!123987 c!104521) b!1034106))

(assert (= (and d!123987 (not c!104521)) b!1034107))

(assert (= (and b!1034107 c!104522) b!1034108))

(assert (= (and b!1034107 (not c!104522)) b!1034109))

(declare-fun m!953687 () Bool)

(assert (=> b!1034108 m!953687))

(assert (=> d!123707 d!123987))

(declare-fun d!123989 () Bool)

(assert (=> d!123989 (= (getValueByKey!590 lt!456094 (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))))

(declare-fun lt!456318 () Unit!33713)

(assert (=> d!123989 (= lt!456318 (choose!1707 lt!456094 (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))))

(declare-fun e!584554 () Bool)

(assert (=> d!123989 e!584554))

(declare-fun res!690771 () Bool)

(assert (=> d!123989 (=> (not res!690771) (not e!584554))))

(assert (=> d!123989 (= res!690771 (isStrictlySorted!714 lt!456094))))

(assert (=> d!123989 (= (lemmaContainsTupThenGetReturnValue!280 lt!456094 (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) lt!456318)))

(declare-fun b!1034110 () Bool)

(declare-fun res!690772 () Bool)

(assert (=> b!1034110 (=> (not res!690772) (not e!584554))))

(assert (=> b!1034110 (= res!690772 (containsKey!563 lt!456094 (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))))

(declare-fun b!1034111 () Bool)

(assert (=> b!1034111 (= e!584554 (contains!5994 lt!456094 (tuple2!15807 (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))))))

(assert (= (and d!123989 res!690771) b!1034110))

(assert (= (and b!1034110 res!690772) b!1034111))

(assert (=> d!123989 m!952951))

(declare-fun m!953689 () Bool)

(assert (=> d!123989 m!953689))

(declare-fun m!953691 () Bool)

(assert (=> d!123989 m!953691))

(declare-fun m!953693 () Bool)

(assert (=> b!1034110 m!953693))

(declare-fun m!953695 () Bool)

(assert (=> b!1034111 m!953695))

(assert (=> d!123707 d!123989))

(declare-fun e!584556 () Bool)

(declare-fun lt!456319 () List!21939)

(declare-fun b!1034112 () Bool)

(assert (=> b!1034112 (= e!584556 (contains!5994 lt!456319 (tuple2!15807 (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))))))

(declare-fun b!1034113 () Bool)

(declare-fun e!584558 () List!21939)

(declare-fun call!43695 () List!21939)

(assert (=> b!1034113 (= e!584558 call!43695)))

(declare-fun c!104526 () Bool)

(declare-fun c!104524 () Bool)

(declare-fun e!584555 () List!21939)

(declare-fun b!1034114 () Bool)

(assert (=> b!1034114 (= e!584555 (ite c!104526 (t!31126 (toList!6930 lt!456012)) (ite c!104524 (Cons!21935 (h!23137 (toList!6930 lt!456012)) (t!31126 (toList!6930 lt!456012))) Nil!21936)))))

(declare-fun b!1034115 () Bool)

(declare-fun res!690774 () Bool)

(assert (=> b!1034115 (=> (not res!690774) (not e!584556))))

(assert (=> b!1034115 (= res!690774 (containsKey!563 lt!456319 (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))))

(declare-fun b!1034116 () Bool)

(declare-fun e!584559 () List!21939)

(declare-fun call!43697 () List!21939)

(assert (=> b!1034116 (= e!584559 call!43697)))

(declare-fun bm!43692 () Bool)

(declare-fun call!43696 () List!21939)

(assert (=> bm!43692 (= call!43697 call!43696)))

(declare-fun b!1034117 () Bool)

(declare-fun e!584557 () List!21939)

(assert (=> b!1034117 (= e!584558 e!584557)))

(assert (=> b!1034117 (= c!104526 (and ((_ is Cons!21935) (toList!6930 lt!456012)) (= (_1!7914 (h!23137 (toList!6930 lt!456012))) (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))))))

(declare-fun b!1034118 () Bool)

(assert (=> b!1034118 (= e!584559 call!43697)))

(declare-fun b!1034119 () Bool)

(assert (=> b!1034119 (= e!584557 call!43696)))

(declare-fun d!123991 () Bool)

(assert (=> d!123991 e!584556))

(declare-fun res!690773 () Bool)

(assert (=> d!123991 (=> (not res!690773) (not e!584556))))

(assert (=> d!123991 (= res!690773 (isStrictlySorted!714 lt!456319))))

(assert (=> d!123991 (= lt!456319 e!584558)))

(declare-fun c!104523 () Bool)

(assert (=> d!123991 (= c!104523 (and ((_ is Cons!21935) (toList!6930 lt!456012)) (bvslt (_1!7914 (h!23137 (toList!6930 lt!456012))) (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))))))

(assert (=> d!123991 (isStrictlySorted!714 (toList!6930 lt!456012))))

(assert (=> d!123991 (= (insertStrictlySorted!373 (toList!6930 lt!456012) (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) lt!456319)))

(declare-fun bm!43693 () Bool)

(assert (=> bm!43693 (= call!43696 call!43695)))

(declare-fun bm!43694 () Bool)

(assert (=> bm!43694 (= call!43695 ($colon$colon!604 e!584555 (ite c!104523 (h!23137 (toList!6930 lt!456012)) (tuple2!15807 (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))))))

(declare-fun c!104525 () Bool)

(assert (=> bm!43694 (= c!104525 c!104523)))

(declare-fun b!1034120 () Bool)

(assert (=> b!1034120 (= e!584555 (insertStrictlySorted!373 (t!31126 (toList!6930 lt!456012)) (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))))

(declare-fun b!1034121 () Bool)

(assert (=> b!1034121 (= c!104524 (and ((_ is Cons!21935) (toList!6930 lt!456012)) (bvsgt (_1!7914 (h!23137 (toList!6930 lt!456012))) (_1!7914 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))))))

(assert (=> b!1034121 (= e!584557 e!584559)))

(assert (= (and d!123991 c!104523) b!1034113))

(assert (= (and d!123991 (not c!104523)) b!1034117))

(assert (= (and b!1034117 c!104526) b!1034119))

(assert (= (and b!1034117 (not c!104526)) b!1034121))

(assert (= (and b!1034121 c!104524) b!1034116))

(assert (= (and b!1034121 (not c!104524)) b!1034118))

(assert (= (or b!1034116 b!1034118) bm!43692))

(assert (= (or b!1034119 bm!43692) bm!43693))

(assert (= (or b!1034113 bm!43693) bm!43694))

(assert (= (and bm!43694 c!104525) b!1034120))

(assert (= (and bm!43694 (not c!104525)) b!1034114))

(assert (= (and d!123991 res!690773) b!1034115))

(assert (= (and b!1034115 res!690774) b!1034112))

(declare-fun m!953697 () Bool)

(assert (=> b!1034120 m!953697))

(declare-fun m!953699 () Bool)

(assert (=> d!123991 m!953699))

(declare-fun m!953701 () Bool)

(assert (=> d!123991 m!953701))

(declare-fun m!953703 () Bool)

(assert (=> b!1034112 m!953703))

(declare-fun m!953705 () Bool)

(assert (=> b!1034115 m!953705))

(declare-fun m!953707 () Bool)

(assert (=> bm!43694 m!953707))

(assert (=> d!123707 d!123991))

(assert (=> b!1033683 d!123727))

(declare-fun d!123993 () Bool)

(assert (=> d!123993 (= (get!16429 (getValueByKey!590 (toList!6930 lt!456009) lt!456013)) (v!14888 (getValueByKey!590 (toList!6930 lt!456009) lt!456013)))))

(assert (=> d!123695 d!123993))

(declare-fun b!1034122 () Bool)

(declare-fun e!584560 () Option!641)

(assert (=> b!1034122 (= e!584560 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456009)))))))

(declare-fun b!1034125 () Bool)

(declare-fun e!584561 () Option!641)

(assert (=> b!1034125 (= e!584561 None!639)))

(declare-fun b!1034124 () Bool)

(assert (=> b!1034124 (= e!584561 (getValueByKey!590 (t!31126 (toList!6930 lt!456009)) lt!456013))))

(declare-fun d!123995 () Bool)

(declare-fun c!104527 () Bool)

(assert (=> d!123995 (= c!104527 (and ((_ is Cons!21935) (toList!6930 lt!456009)) (= (_1!7914 (h!23137 (toList!6930 lt!456009))) lt!456013)))))

(assert (=> d!123995 (= (getValueByKey!590 (toList!6930 lt!456009) lt!456013) e!584560)))

(declare-fun b!1034123 () Bool)

(assert (=> b!1034123 (= e!584560 e!584561)))

(declare-fun c!104528 () Bool)

(assert (=> b!1034123 (= c!104528 (and ((_ is Cons!21935) (toList!6930 lt!456009)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456009))) lt!456013))))))

(assert (= (and d!123995 c!104527) b!1034122))

(assert (= (and d!123995 (not c!104527)) b!1034123))

(assert (= (and b!1034123 c!104528) b!1034124))

(assert (= (and b!1034123 (not c!104528)) b!1034125))

(declare-fun m!953709 () Bool)

(assert (=> b!1034124 m!953709))

(assert (=> d!123695 d!123995))

(declare-fun d!123997 () Bool)

(declare-fun lt!456322 () Bool)

(declare-fun content!513 (List!21941) (InoxSet (_ BitVec 64)))

(assert (=> d!123997 (= lt!456322 (select (content!513 Nil!21938) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!584566 () Bool)

(assert (=> d!123997 (= lt!456322 e!584566)))

(declare-fun res!690779 () Bool)

(assert (=> d!123997 (=> (not res!690779) (not e!584566))))

(assert (=> d!123997 (= res!690779 ((_ is Cons!21937) Nil!21938))))

(assert (=> d!123997 (= (contains!5993 Nil!21938 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) lt!456322)))

(declare-fun b!1034130 () Bool)

(declare-fun e!584567 () Bool)

(assert (=> b!1034130 (= e!584566 e!584567)))

(declare-fun res!690780 () Bool)

(assert (=> b!1034130 (=> res!690780 e!584567)))

(assert (=> b!1034130 (= res!690780 (= (h!23139 Nil!21938) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034131 () Bool)

(assert (=> b!1034131 (= e!584567 (contains!5993 (t!31132 Nil!21938) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123997 res!690779) b!1034130))

(assert (= (and b!1034130 (not res!690780)) b!1034131))

(declare-fun m!953711 () Bool)

(assert (=> d!123997 m!953711))

(assert (=> d!123997 m!952763))

(declare-fun m!953713 () Bool)

(assert (=> d!123997 m!953713))

(assert (=> b!1034131 m!952763))

(declare-fun m!953715 () Bool)

(assert (=> b!1034131 m!953715))

(assert (=> b!1033588 d!123997))

(declare-fun d!123999 () Bool)

(assert (=> d!123999 (= (apply!899 lt!456207 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)) (get!16429 (getValueByKey!590 (toList!6930 lt!456207) (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000))))))

(declare-fun bs!30224 () Bool)

(assert (= bs!30224 d!123999))

(assert (=> bs!30224 m!953267))

(declare-fun m!953717 () Bool)

(assert (=> bs!30224 m!953717))

(assert (=> bs!30224 m!953717))

(declare-fun m!953719 () Bool)

(assert (=> bs!30224 m!953719))

(assert (=> b!1033784 d!123999))

(declare-fun d!124001 () Bool)

(declare-fun c!104529 () Bool)

(assert (=> d!124001 (= c!104529 ((_ is ValueCellFull!11555) (select (arr!31321 (_values!6249 lt!455914)) #b00000000000000000000000000000000)))))

(declare-fun e!584568 () V!37563)

(assert (=> d!124001 (= (get!16428 (select (arr!31321 (_values!6249 lt!455914)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 lt!455914) #b0000000000000000000000000000000000000000000000000000000000000000)) e!584568)))

(declare-fun b!1034132 () Bool)

(assert (=> b!1034132 (= e!584568 (get!16430 (select (arr!31321 (_values!6249 lt!455914)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 lt!455914) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034133 () Bool)

(assert (=> b!1034133 (= e!584568 (get!16431 (select (arr!31321 (_values!6249 lt!455914)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 lt!455914) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124001 c!104529) b!1034132))

(assert (= (and d!124001 (not c!104529)) b!1034133))

(assert (=> b!1034132 m!953283))

(assert (=> b!1034132 m!953285))

(declare-fun m!953721 () Bool)

(assert (=> b!1034132 m!953721))

(assert (=> b!1034133 m!953283))

(assert (=> b!1034133 m!953285))

(declare-fun m!953723 () Bool)

(assert (=> b!1034133 m!953723))

(assert (=> b!1033784 d!124001))

(declare-fun d!124003 () Bool)

(assert (=> d!124003 (= (isDefined!438 (getValueByKey!590 (toList!6930 lt!456029) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!932 (getValueByKey!590 (toList!6930 lt!456029) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30225 () Bool)

(assert (= bs!30225 d!124003))

(assert (=> bs!30225 m!953153))

(declare-fun m!953725 () Bool)

(assert (=> bs!30225 m!953725))

(assert (=> b!1033735 d!124003))

(assert (=> b!1033735 d!123947))

(declare-fun d!124005 () Bool)

(declare-fun e!584569 () Bool)

(assert (=> d!124005 e!584569))

(declare-fun res!690782 () Bool)

(assert (=> d!124005 (=> (not res!690782) (not e!584569))))

(declare-fun lt!456324 () ListLongMap!13829)

(assert (=> d!124005 (= res!690782 (contains!5992 lt!456324 (_1!7914 (tuple2!15807 lt!456106 lt!456109))))))

(declare-fun lt!456326 () List!21939)

(assert (=> d!124005 (= lt!456324 (ListLongMap!13830 lt!456326))))

(declare-fun lt!456323 () Unit!33713)

(declare-fun lt!456325 () Unit!33713)

(assert (=> d!124005 (= lt!456323 lt!456325)))

(assert (=> d!124005 (= (getValueByKey!590 lt!456326 (_1!7914 (tuple2!15807 lt!456106 lt!456109))) (Some!640 (_2!7914 (tuple2!15807 lt!456106 lt!456109))))))

(assert (=> d!124005 (= lt!456325 (lemmaContainsTupThenGetReturnValue!280 lt!456326 (_1!7914 (tuple2!15807 lt!456106 lt!456109)) (_2!7914 (tuple2!15807 lt!456106 lt!456109))))))

(assert (=> d!124005 (= lt!456326 (insertStrictlySorted!373 (toList!6930 lt!456108) (_1!7914 (tuple2!15807 lt!456106 lt!456109)) (_2!7914 (tuple2!15807 lt!456106 lt!456109))))))

(assert (=> d!124005 (= (+!3130 lt!456108 (tuple2!15807 lt!456106 lt!456109)) lt!456324)))

(declare-fun b!1034134 () Bool)

(declare-fun res!690781 () Bool)

(assert (=> b!1034134 (=> (not res!690781) (not e!584569))))

(assert (=> b!1034134 (= res!690781 (= (getValueByKey!590 (toList!6930 lt!456324) (_1!7914 (tuple2!15807 lt!456106 lt!456109))) (Some!640 (_2!7914 (tuple2!15807 lt!456106 lt!456109)))))))

(declare-fun b!1034135 () Bool)

(assert (=> b!1034135 (= e!584569 (contains!5994 (toList!6930 lt!456324) (tuple2!15807 lt!456106 lt!456109)))))

(assert (= (and d!124005 res!690782) b!1034134))

(assert (= (and b!1034134 res!690781) b!1034135))

(declare-fun m!953727 () Bool)

(assert (=> d!124005 m!953727))

(declare-fun m!953729 () Bool)

(assert (=> d!124005 m!953729))

(declare-fun m!953731 () Bool)

(assert (=> d!124005 m!953731))

(declare-fun m!953733 () Bool)

(assert (=> d!124005 m!953733))

(declare-fun m!953735 () Bool)

(assert (=> b!1034134 m!953735))

(declare-fun m!953737 () Bool)

(assert (=> b!1034135 m!953737))

(assert (=> b!1033680 d!124005))

(assert (=> b!1033680 d!123687))

(declare-fun d!124007 () Bool)

(declare-fun e!584570 () Bool)

(assert (=> d!124007 e!584570))

(declare-fun res!690784 () Bool)

(assert (=> d!124007 (=> (not res!690784) (not e!584570))))

(declare-fun lt!456328 () ListLongMap!13829)

(assert (=> d!124007 (= res!690784 (contains!5992 lt!456328 (_1!7914 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!456330 () List!21939)

(assert (=> d!124007 (= lt!456328 (ListLongMap!13830 lt!456330))))

(declare-fun lt!456327 () Unit!33713)

(declare-fun lt!456329 () Unit!33713)

(assert (=> d!124007 (= lt!456327 lt!456329)))

(assert (=> d!124007 (= (getValueByKey!590 lt!456330 (_1!7914 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!640 (_2!7914 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124007 (= lt!456329 (lemmaContainsTupThenGetReturnValue!280 lt!456330 (_1!7914 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7914 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124007 (= lt!456330 (insertStrictlySorted!373 (toList!6930 call!43659) (_1!7914 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7914 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124007 (= (+!3130 call!43659 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!456328)))

(declare-fun b!1034136 () Bool)

(declare-fun res!690783 () Bool)

(assert (=> b!1034136 (=> (not res!690783) (not e!584570))))

(assert (=> b!1034136 (= res!690783 (= (getValueByKey!590 (toList!6930 lt!456328) (_1!7914 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!640 (_2!7914 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1034137 () Bool)

(assert (=> b!1034137 (= e!584570 (contains!5994 (toList!6930 lt!456328) (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!124007 res!690784) b!1034136))

(assert (= (and b!1034136 res!690783) b!1034137))

(declare-fun m!953739 () Bool)

(assert (=> d!124007 m!953739))

(declare-fun m!953741 () Bool)

(assert (=> d!124007 m!953741))

(declare-fun m!953743 () Bool)

(assert (=> d!124007 m!953743))

(declare-fun m!953745 () Bool)

(assert (=> d!124007 m!953745))

(declare-fun m!953747 () Bool)

(assert (=> b!1034136 m!953747))

(declare-fun m!953749 () Bool)

(assert (=> b!1034137 m!953749))

(assert (=> b!1033680 d!124007))

(declare-fun d!124009 () Bool)

(assert (=> d!124009 (not (contains!5992 (+!3130 lt!456108 (tuple2!15807 lt!456106 lt!456109)) lt!456104))))

(declare-fun lt!456333 () Unit!33713)

(declare-fun choose!1708 (ListLongMap!13829 (_ BitVec 64) V!37563 (_ BitVec 64)) Unit!33713)

(assert (=> d!124009 (= lt!456333 (choose!1708 lt!456108 lt!456106 lt!456109 lt!456104))))

(declare-fun e!584573 () Bool)

(assert (=> d!124009 e!584573))

(declare-fun res!690787 () Bool)

(assert (=> d!124009 (=> (not res!690787) (not e!584573))))

(assert (=> d!124009 (= res!690787 (not (contains!5992 lt!456108 lt!456104)))))

(assert (=> d!124009 (= (addStillNotContains!243 lt!456108 lt!456106 lt!456109 lt!456104) lt!456333)))

(declare-fun b!1034141 () Bool)

(assert (=> b!1034141 (= e!584573 (not (= lt!456106 lt!456104)))))

(assert (= (and d!124009 res!690787) b!1034141))

(assert (=> d!124009 m!953009))

(assert (=> d!124009 m!953009))

(assert (=> d!124009 m!953013))

(declare-fun m!953751 () Bool)

(assert (=> d!124009 m!953751))

(declare-fun m!953753 () Bool)

(assert (=> d!124009 m!953753))

(assert (=> b!1033680 d!124009))

(declare-fun d!124011 () Bool)

(declare-fun e!584574 () Bool)

(assert (=> d!124011 e!584574))

(declare-fun res!690788 () Bool)

(assert (=> d!124011 (=> res!690788 e!584574)))

(declare-fun lt!456334 () Bool)

(assert (=> d!124011 (= res!690788 (not lt!456334))))

(declare-fun lt!456337 () Bool)

(assert (=> d!124011 (= lt!456334 lt!456337)))

(declare-fun lt!456336 () Unit!33713)

(declare-fun e!584575 () Unit!33713)

(assert (=> d!124011 (= lt!456336 e!584575)))

(declare-fun c!104530 () Bool)

(assert (=> d!124011 (= c!104530 lt!456337)))

(assert (=> d!124011 (= lt!456337 (containsKey!563 (toList!6930 (+!3130 lt!456108 (tuple2!15807 lt!456106 lt!456109))) lt!456104))))

(assert (=> d!124011 (= (contains!5992 (+!3130 lt!456108 (tuple2!15807 lt!456106 lt!456109)) lt!456104) lt!456334)))

(declare-fun b!1034142 () Bool)

(declare-fun lt!456335 () Unit!33713)

(assert (=> b!1034142 (= e!584575 lt!456335)))

(assert (=> b!1034142 (= lt!456335 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 (+!3130 lt!456108 (tuple2!15807 lt!456106 lt!456109))) lt!456104))))

(assert (=> b!1034142 (isDefined!438 (getValueByKey!590 (toList!6930 (+!3130 lt!456108 (tuple2!15807 lt!456106 lt!456109))) lt!456104))))

(declare-fun b!1034143 () Bool)

(declare-fun Unit!33741 () Unit!33713)

(assert (=> b!1034143 (= e!584575 Unit!33741)))

(declare-fun b!1034144 () Bool)

(assert (=> b!1034144 (= e!584574 (isDefined!438 (getValueByKey!590 (toList!6930 (+!3130 lt!456108 (tuple2!15807 lt!456106 lt!456109))) lt!456104)))))

(assert (= (and d!124011 c!104530) b!1034142))

(assert (= (and d!124011 (not c!104530)) b!1034143))

(assert (= (and d!124011 (not res!690788)) b!1034144))

(declare-fun m!953755 () Bool)

(assert (=> d!124011 m!953755))

(declare-fun m!953757 () Bool)

(assert (=> b!1034142 m!953757))

(declare-fun m!953759 () Bool)

(assert (=> b!1034142 m!953759))

(assert (=> b!1034142 m!953759))

(declare-fun m!953761 () Bool)

(assert (=> b!1034142 m!953761))

(assert (=> b!1034144 m!953759))

(assert (=> b!1034144 m!953759))

(assert (=> b!1034144 m!953761))

(assert (=> b!1033680 d!124011))

(declare-fun d!124013 () Bool)

(assert (=> d!124013 (= (get!16431 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1033646 d!124013))

(assert (=> b!1033781 d!123837))

(assert (=> d!123701 d!123689))

(assert (=> d!123701 d!123707))

(declare-fun d!124015 () Bool)

(assert (=> d!124015 (contains!5992 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))) lt!456008)))

(assert (=> d!124015 true))

(declare-fun _$35!438 () Unit!33713)

(assert (=> d!124015 (= (choose!1704 lt!456012 lt!456026 (zeroValue!6062 thiss!1427) lt!456008) _$35!438)))

(declare-fun bs!30226 () Bool)

(assert (= bs!30226 d!124015))

(assert (=> bs!30226 m!952821))

(assert (=> bs!30226 m!952821))

(assert (=> bs!30226 m!952823))

(assert (=> d!123701 d!124015))

(declare-fun d!124017 () Bool)

(declare-fun e!584576 () Bool)

(assert (=> d!124017 e!584576))

(declare-fun res!690789 () Bool)

(assert (=> d!124017 (=> res!690789 e!584576)))

(declare-fun lt!456338 () Bool)

(assert (=> d!124017 (= res!690789 (not lt!456338))))

(declare-fun lt!456341 () Bool)

(assert (=> d!124017 (= lt!456338 lt!456341)))

(declare-fun lt!456340 () Unit!33713)

(declare-fun e!584577 () Unit!33713)

(assert (=> d!124017 (= lt!456340 e!584577)))

(declare-fun c!104531 () Bool)

(assert (=> d!124017 (= c!104531 lt!456341)))

(assert (=> d!124017 (= lt!456341 (containsKey!563 (toList!6930 lt!456012) lt!456008))))

(assert (=> d!124017 (= (contains!5992 lt!456012 lt!456008) lt!456338)))

(declare-fun b!1034146 () Bool)

(declare-fun lt!456339 () Unit!33713)

(assert (=> b!1034146 (= e!584577 lt!456339)))

(assert (=> b!1034146 (= lt!456339 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456012) lt!456008))))

(assert (=> b!1034146 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456012) lt!456008))))

(declare-fun b!1034147 () Bool)

(declare-fun Unit!33742 () Unit!33713)

(assert (=> b!1034147 (= e!584577 Unit!33742)))

(declare-fun b!1034148 () Bool)

(assert (=> b!1034148 (= e!584576 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456012) lt!456008)))))

(assert (= (and d!124017 c!104531) b!1034146))

(assert (= (and d!124017 (not c!104531)) b!1034147))

(assert (= (and d!124017 (not res!690789)) b!1034148))

(declare-fun m!953763 () Bool)

(assert (=> d!124017 m!953763))

(declare-fun m!953765 () Bool)

(assert (=> b!1034146 m!953765))

(declare-fun m!953767 () Bool)

(assert (=> b!1034146 m!953767))

(assert (=> b!1034146 m!953767))

(declare-fun m!953769 () Bool)

(assert (=> b!1034146 m!953769))

(assert (=> b!1034148 m!953767))

(assert (=> b!1034148 m!953767))

(assert (=> b!1034148 m!953769))

(assert (=> d!123701 d!124017))

(declare-fun d!124019 () Bool)

(assert (=> d!124019 (= (get!16429 (getValueByKey!590 (toList!6930 (+!3130 lt!455983 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))) lt!455987)) (v!14888 (getValueByKey!590 (toList!6930 (+!3130 lt!455983 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))) lt!455987)))))

(assert (=> d!123757 d!124019))

(declare-fun e!584578 () Option!641)

(declare-fun b!1034149 () Bool)

(assert (=> b!1034149 (= e!584578 (Some!640 (_2!7914 (h!23137 (toList!6930 (+!3130 lt!455983 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))))))))))

(declare-fun b!1034152 () Bool)

(declare-fun e!584579 () Option!641)

(assert (=> b!1034152 (= e!584579 None!639)))

(declare-fun b!1034151 () Bool)

(assert (=> b!1034151 (= e!584579 (getValueByKey!590 (t!31126 (toList!6930 (+!3130 lt!455983 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))))) lt!455987))))

(declare-fun c!104532 () Bool)

(declare-fun d!124021 () Bool)

(assert (=> d!124021 (= c!104532 (and ((_ is Cons!21935) (toList!6930 (+!3130 lt!455983 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))))) (= (_1!7914 (h!23137 (toList!6930 (+!3130 lt!455983 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))))) lt!455987)))))

(assert (=> d!124021 (= (getValueByKey!590 (toList!6930 (+!3130 lt!455983 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))) lt!455987) e!584578)))

(declare-fun b!1034150 () Bool)

(assert (=> b!1034150 (= e!584578 e!584579)))

(declare-fun c!104533 () Bool)

(assert (=> b!1034150 (= c!104533 (and ((_ is Cons!21935) (toList!6930 (+!3130 lt!455983 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))))) (not (= (_1!7914 (h!23137 (toList!6930 (+!3130 lt!455983 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))))) lt!455987))))))

(assert (= (and d!124021 c!104532) b!1034149))

(assert (= (and d!124021 (not c!104532)) b!1034150))

(assert (= (and b!1034150 c!104533) b!1034151))

(assert (= (and b!1034150 (not c!104533)) b!1034152))

(declare-fun m!953771 () Bool)

(assert (=> b!1034151 m!953771))

(assert (=> d!123757 d!124021))

(declare-fun lt!456342 () Bool)

(declare-fun d!124023 () Bool)

(assert (=> d!124023 (= lt!456342 (select (content!512 (toList!6930 lt!456081)) (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))))))

(declare-fun e!584581 () Bool)

(assert (=> d!124023 (= lt!456342 e!584581)))

(declare-fun res!690791 () Bool)

(assert (=> d!124023 (=> (not res!690791) (not e!584581))))

(assert (=> d!124023 (= res!690791 ((_ is Cons!21935) (toList!6930 lt!456081)))))

(assert (=> d!124023 (= (contains!5994 (toList!6930 lt!456081) (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))) lt!456342)))

(declare-fun b!1034153 () Bool)

(declare-fun e!584580 () Bool)

(assert (=> b!1034153 (= e!584581 e!584580)))

(declare-fun res!690790 () Bool)

(assert (=> b!1034153 (=> res!690790 e!584580)))

(assert (=> b!1034153 (= res!690790 (= (h!23137 (toList!6930 lt!456081)) (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))))))

(declare-fun b!1034154 () Bool)

(assert (=> b!1034154 (= e!584580 (contains!5994 (t!31126 (toList!6930 lt!456081)) (tuple2!15807 lt!456027 (minValue!6062 thiss!1427))))))

(assert (= (and d!124023 res!690791) b!1034153))

(assert (= (and b!1034153 (not res!690790)) b!1034154))

(declare-fun m!953773 () Bool)

(assert (=> d!124023 m!953773))

(declare-fun m!953775 () Bool)

(assert (=> d!124023 m!953775))

(declare-fun m!953777 () Bool)

(assert (=> b!1034154 m!953777))

(assert (=> b!1033661 d!124023))

(declare-fun d!124025 () Bool)

(declare-fun res!690796 () Bool)

(declare-fun e!584586 () Bool)

(assert (=> d!124025 (=> res!690796 e!584586)))

(assert (=> d!124025 (= res!690796 (or ((_ is Nil!21936) lt!456156) ((_ is Nil!21936) (t!31126 lt!456156))))))

(assert (=> d!124025 (= (isStrictlySorted!714 lt!456156) e!584586)))

(declare-fun b!1034159 () Bool)

(declare-fun e!584587 () Bool)

(assert (=> b!1034159 (= e!584586 e!584587)))

(declare-fun res!690797 () Bool)

(assert (=> b!1034159 (=> (not res!690797) (not e!584587))))

(assert (=> b!1034159 (= res!690797 (bvslt (_1!7914 (h!23137 lt!456156)) (_1!7914 (h!23137 (t!31126 lt!456156)))))))

(declare-fun b!1034160 () Bool)

(assert (=> b!1034160 (= e!584587 (isStrictlySorted!714 (t!31126 lt!456156)))))

(assert (= (and d!124025 (not res!690796)) b!1034159))

(assert (= (and b!1034159 res!690797) b!1034160))

(declare-fun m!953779 () Bool)

(assert (=> b!1034160 m!953779))

(assert (=> d!123773 d!124025))

(declare-fun d!124027 () Bool)

(declare-fun res!690798 () Bool)

(declare-fun e!584588 () Bool)

(assert (=> d!124027 (=> res!690798 e!584588)))

(assert (=> d!124027 (= res!690798 (or ((_ is Nil!21936) (toList!6930 (map!14687 thiss!1427))) ((_ is Nil!21936) (t!31126 (toList!6930 (map!14687 thiss!1427))))))))

(assert (=> d!124027 (= (isStrictlySorted!714 (toList!6930 (map!14687 thiss!1427))) e!584588)))

(declare-fun b!1034161 () Bool)

(declare-fun e!584589 () Bool)

(assert (=> b!1034161 (= e!584588 e!584589)))

(declare-fun res!690799 () Bool)

(assert (=> b!1034161 (=> (not res!690799) (not e!584589))))

(assert (=> b!1034161 (= res!690799 (bvslt (_1!7914 (h!23137 (toList!6930 (map!14687 thiss!1427)))) (_1!7914 (h!23137 (t!31126 (toList!6930 (map!14687 thiss!1427)))))))))

(declare-fun b!1034162 () Bool)

(assert (=> b!1034162 (= e!584589 (isStrictlySorted!714 (t!31126 (toList!6930 (map!14687 thiss!1427)))))))

(assert (= (and d!124027 (not res!690798)) b!1034161))

(assert (= (and b!1034161 res!690799) b!1034162))

(declare-fun m!953781 () Bool)

(assert (=> b!1034162 m!953781))

(assert (=> d!123773 d!124027))

(declare-fun d!124029 () Bool)

(declare-fun res!690800 () Bool)

(declare-fun e!584590 () Bool)

(assert (=> d!124029 (=> res!690800 e!584590)))

(assert (=> d!124029 (= res!690800 (and ((_ is Cons!21935) (toList!6930 lt!455937)) (= (_1!7914 (h!23137 (toList!6930 lt!455937))) key!909)))))

(assert (=> d!124029 (= (containsKey!563 (toList!6930 lt!455937) key!909) e!584590)))

(declare-fun b!1034163 () Bool)

(declare-fun e!584591 () Bool)

(assert (=> b!1034163 (= e!584590 e!584591)))

(declare-fun res!690801 () Bool)

(assert (=> b!1034163 (=> (not res!690801) (not e!584591))))

(assert (=> b!1034163 (= res!690801 (and (or (not ((_ is Cons!21935) (toList!6930 lt!455937))) (bvsle (_1!7914 (h!23137 (toList!6930 lt!455937))) key!909)) ((_ is Cons!21935) (toList!6930 lt!455937)) (bvslt (_1!7914 (h!23137 (toList!6930 lt!455937))) key!909)))))

(declare-fun b!1034164 () Bool)

(assert (=> b!1034164 (= e!584591 (containsKey!563 (t!31126 (toList!6930 lt!455937)) key!909))))

(assert (= (and d!124029 (not res!690800)) b!1034163))

(assert (= (and b!1034163 res!690801) b!1034164))

(declare-fun m!953783 () Bool)

(assert (=> b!1034164 m!953783))

(assert (=> d!123771 d!124029))

(declare-fun d!124031 () Bool)

(assert (=> d!124031 (= ($colon$colon!604 (removeStrictlySorted!56 (t!31126 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))) #b0000000000000000000000000000000000000000000000000000000000000000) (h!23137 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))) (Cons!21935 (h!23137 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))) (removeStrictlySorted!56 (t!31126 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1033760 d!124031))

(declare-fun b!1034165 () Bool)

(declare-fun e!584594 () List!21939)

(assert (=> b!1034165 (= e!584594 (t!31126 (t!31126 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))))))

(declare-fun d!124033 () Bool)

(declare-fun e!584593 () Bool)

(assert (=> d!124033 e!584593))

(declare-fun res!690802 () Bool)

(assert (=> d!124033 (=> (not res!690802) (not e!584593))))

(declare-fun lt!456343 () List!21939)

(assert (=> d!124033 (= res!690802 (isStrictlySorted!714 lt!456343))))

(assert (=> d!124033 (= lt!456343 e!584594)))

(declare-fun c!104534 () Bool)

(assert (=> d!124033 (= c!104534 (and ((_ is Cons!21935) (t!31126 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))) (= (_1!7914 (h!23137 (t!31126 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124033 (isStrictlySorted!714 (t!31126 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))))

(assert (=> d!124033 (= (removeStrictlySorted!56 (t!31126 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))) #b0000000000000000000000000000000000000000000000000000000000000000) lt!456343)))

(declare-fun b!1034166 () Bool)

(declare-fun e!584592 () List!21939)

(assert (=> b!1034166 (= e!584592 Nil!21936)))

(declare-fun b!1034167 () Bool)

(assert (=> b!1034167 (= e!584594 e!584592)))

(declare-fun c!104535 () Bool)

(assert (=> b!1034167 (= c!104535 (and ((_ is Cons!21935) (t!31126 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))) (not (= (_1!7914 (h!23137 (t!31126 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1034168 () Bool)

(assert (=> b!1034168 (= e!584592 ($colon$colon!604 (removeStrictlySorted!56 (t!31126 (t!31126 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))) #b0000000000000000000000000000000000000000000000000000000000000000) (h!23137 (t!31126 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))))))

(declare-fun b!1034169 () Bool)

(assert (=> b!1034169 (= e!584593 (not (containsKey!563 lt!456343 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124033 c!104534) b!1034165))

(assert (= (and d!124033 (not c!104534)) b!1034167))

(assert (= (and b!1034167 c!104535) b!1034168))

(assert (= (and b!1034167 (not c!104535)) b!1034166))

(assert (= (and d!124033 res!690802) b!1034169))

(declare-fun m!953785 () Bool)

(assert (=> d!124033 m!953785))

(declare-fun m!953787 () Bool)

(assert (=> d!124033 m!953787))

(declare-fun m!953789 () Bool)

(assert (=> b!1034168 m!953789))

(assert (=> b!1034168 m!953789))

(declare-fun m!953791 () Bool)

(assert (=> b!1034168 m!953791))

(declare-fun m!953793 () Bool)

(assert (=> b!1034169 m!953793))

(assert (=> b!1033760 d!124033))

(declare-fun d!124035 () Bool)

(assert (=> d!124035 (= (apply!899 (+!3130 lt!455996 (tuple2!15807 lt!455991 lt!455915)) lt!455994) (apply!899 lt!455996 lt!455994))))

(assert (=> d!124035 true))

(declare-fun _$34!1168 () Unit!33713)

(assert (=> d!124035 (= (choose!1705 lt!455996 lt!455991 lt!455915 lt!455994) _$34!1168)))

(declare-fun bs!30227 () Bool)

(assert (= bs!30227 d!124035))

(assert (=> bs!30227 m!952759))

(assert (=> bs!30227 m!952759))

(assert (=> bs!30227 m!952761))

(assert (=> bs!30227 m!952767))

(assert (=> d!123749 d!124035))

(assert (=> d!123749 d!123743))

(assert (=> d!123749 d!123745))

(assert (=> d!123749 d!123747))

(declare-fun d!124037 () Bool)

(declare-fun e!584595 () Bool)

(assert (=> d!124037 e!584595))

(declare-fun res!690803 () Bool)

(assert (=> d!124037 (=> res!690803 e!584595)))

(declare-fun lt!456344 () Bool)

(assert (=> d!124037 (= res!690803 (not lt!456344))))

(declare-fun lt!456347 () Bool)

(assert (=> d!124037 (= lt!456344 lt!456347)))

(declare-fun lt!456346 () Unit!33713)

(declare-fun e!584596 () Unit!33713)

(assert (=> d!124037 (= lt!456346 e!584596)))

(declare-fun c!104536 () Bool)

(assert (=> d!124037 (= c!104536 lt!456347)))

(assert (=> d!124037 (= lt!456347 (containsKey!563 (toList!6930 lt!455996) lt!455994))))

(assert (=> d!124037 (= (contains!5992 lt!455996 lt!455994) lt!456344)))

(declare-fun b!1034170 () Bool)

(declare-fun lt!456345 () Unit!33713)

(assert (=> b!1034170 (= e!584596 lt!456345)))

(assert (=> b!1034170 (= lt!456345 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!455996) lt!455994))))

(assert (=> b!1034170 (isDefined!438 (getValueByKey!590 (toList!6930 lt!455996) lt!455994))))

(declare-fun b!1034171 () Bool)

(declare-fun Unit!33743 () Unit!33713)

(assert (=> b!1034171 (= e!584596 Unit!33743)))

(declare-fun b!1034172 () Bool)

(assert (=> b!1034172 (= e!584595 (isDefined!438 (getValueByKey!590 (toList!6930 lt!455996) lt!455994)))))

(assert (= (and d!124037 c!104536) b!1034170))

(assert (= (and d!124037 (not c!104536)) b!1034171))

(assert (= (and d!124037 (not res!690803)) b!1034172))

(declare-fun m!953795 () Bool)

(assert (=> d!124037 m!953795))

(declare-fun m!953797 () Bool)

(assert (=> b!1034170 m!953797))

(assert (=> b!1034170 m!953093))

(assert (=> b!1034170 m!953093))

(declare-fun m!953799 () Bool)

(assert (=> b!1034170 m!953799))

(assert (=> b!1034172 m!953093))

(assert (=> b!1034172 m!953093))

(assert (=> b!1034172 m!953799))

(assert (=> d!123749 d!124037))

(assert (=> b!1033756 d!123829))

(assert (=> b!1033756 d!123831))

(declare-fun lt!456348 () Bool)

(declare-fun d!124039 () Bool)

(assert (=> d!124039 (= lt!456348 (select (content!512 (toList!6930 lt!456129)) (tuple2!15807 lt!455991 lt!455915)))))

(declare-fun e!584598 () Bool)

(assert (=> d!124039 (= lt!456348 e!584598)))

(declare-fun res!690805 () Bool)

(assert (=> d!124039 (=> (not res!690805) (not e!584598))))

(assert (=> d!124039 (= res!690805 ((_ is Cons!21935) (toList!6930 lt!456129)))))

(assert (=> d!124039 (= (contains!5994 (toList!6930 lt!456129) (tuple2!15807 lt!455991 lt!455915)) lt!456348)))

(declare-fun b!1034173 () Bool)

(declare-fun e!584597 () Bool)

(assert (=> b!1034173 (= e!584598 e!584597)))

(declare-fun res!690804 () Bool)

(assert (=> b!1034173 (=> res!690804 e!584597)))

(assert (=> b!1034173 (= res!690804 (= (h!23137 (toList!6930 lt!456129)) (tuple2!15807 lt!455991 lt!455915)))))

(declare-fun b!1034174 () Bool)

(assert (=> b!1034174 (= e!584597 (contains!5994 (t!31126 (toList!6930 lt!456129)) (tuple2!15807 lt!455991 lt!455915)))))

(assert (= (and d!124039 res!690805) b!1034173))

(assert (= (and b!1034173 (not res!690804)) b!1034174))

(declare-fun m!953801 () Bool)

(assert (=> d!124039 m!953801))

(declare-fun m!953803 () Bool)

(assert (=> d!124039 m!953803))

(declare-fun m!953805 () Bool)

(assert (=> b!1034174 m!953805))

(assert (=> b!1033724 d!124039))

(declare-fun d!124041 () Bool)

(declare-fun e!584599 () Bool)

(assert (=> d!124041 e!584599))

(declare-fun res!690806 () Bool)

(assert (=> d!124041 (=> res!690806 e!584599)))

(declare-fun lt!456349 () Bool)

(assert (=> d!124041 (= res!690806 (not lt!456349))))

(declare-fun lt!456352 () Bool)

(assert (=> d!124041 (= lt!456349 lt!456352)))

(declare-fun lt!456351 () Unit!33713)

(declare-fun e!584600 () Unit!33713)

(assert (=> d!124041 (= lt!456351 e!584600)))

(declare-fun c!104537 () Bool)

(assert (=> d!124041 (= c!104537 lt!456352)))

(assert (=> d!124041 (= lt!456352 (containsKey!563 (toList!6930 lt!456207) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124041 (= (contains!5992 lt!456207 #b1000000000000000000000000000000000000000000000000000000000000000) lt!456349)))

(declare-fun b!1034175 () Bool)

(declare-fun lt!456350 () Unit!33713)

(assert (=> b!1034175 (= e!584600 lt!456350)))

(assert (=> b!1034175 (= lt!456350 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456207) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1034175 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456207) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1034176 () Bool)

(declare-fun Unit!33744 () Unit!33713)

(assert (=> b!1034176 (= e!584600 Unit!33744)))

(declare-fun b!1034177 () Bool)

(assert (=> b!1034177 (= e!584599 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456207) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124041 c!104537) b!1034175))

(assert (= (and d!124041 (not c!104537)) b!1034176))

(assert (= (and d!124041 (not res!690806)) b!1034177))

(declare-fun m!953807 () Bool)

(assert (=> d!124041 m!953807))

(declare-fun m!953809 () Bool)

(assert (=> b!1034175 m!953809))

(assert (=> b!1034175 m!953441))

(assert (=> b!1034175 m!953441))

(declare-fun m!953811 () Bool)

(assert (=> b!1034175 m!953811))

(assert (=> b!1034177 m!953441))

(assert (=> b!1034177 m!953441))

(assert (=> b!1034177 m!953811))

(assert (=> bm!43660 d!124041))

(declare-fun d!124043 () Bool)

(declare-fun e!584601 () Bool)

(assert (=> d!124043 e!584601))

(declare-fun res!690807 () Bool)

(assert (=> d!124043 (=> res!690807 e!584601)))

(declare-fun lt!456353 () Bool)

(assert (=> d!124043 (= res!690807 (not lt!456353))))

(declare-fun lt!456356 () Bool)

(assert (=> d!124043 (= lt!456353 lt!456356)))

(declare-fun lt!456355 () Unit!33713)

(declare-fun e!584602 () Unit!33713)

(assert (=> d!124043 (= lt!456355 e!584602)))

(declare-fun c!104538 () Bool)

(assert (=> d!124043 (= c!104538 lt!456356)))

(assert (=> d!124043 (= lt!456356 (containsKey!563 (toList!6930 lt!456045) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124043 (= (contains!5992 lt!456045 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) lt!456353)))

(declare-fun b!1034178 () Bool)

(declare-fun lt!456354 () Unit!33713)

(assert (=> b!1034178 (= e!584602 lt!456354)))

(assert (=> b!1034178 (= lt!456354 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456045) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1034178 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456045) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034179 () Bool)

(declare-fun Unit!33745 () Unit!33713)

(assert (=> b!1034179 (= e!584602 Unit!33745)))

(declare-fun b!1034180 () Bool)

(assert (=> b!1034180 (= e!584601 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456045) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!124043 c!104538) b!1034178))

(assert (= (and d!124043 (not c!104538)) b!1034179))

(assert (= (and d!124043 (not res!690807)) b!1034180))

(assert (=> d!124043 m!952763))

(declare-fun m!953813 () Bool)

(assert (=> d!124043 m!953813))

(assert (=> b!1034178 m!952763))

(declare-fun m!953815 () Bool)

(assert (=> b!1034178 m!953815))

(assert (=> b!1034178 m!952763))

(assert (=> b!1034178 m!953343))

(assert (=> b!1034178 m!953343))

(declare-fun m!953817 () Bool)

(assert (=> b!1034178 m!953817))

(assert (=> b!1034180 m!952763))

(assert (=> b!1034180 m!953343))

(assert (=> b!1034180 m!953343))

(assert (=> b!1034180 m!953817))

(assert (=> b!1033617 d!124043))

(declare-fun b!1034181 () Bool)

(declare-fun e!584603 () Option!641)

(assert (=> b!1034181 (= e!584603 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456143)))))))

(declare-fun b!1034184 () Bool)

(declare-fun e!584604 () Option!641)

(assert (=> b!1034184 (= e!584604 None!639)))

(declare-fun b!1034183 () Bool)

(assert (=> b!1034183 (= e!584604 (getValueByKey!590 (t!31126 (toList!6930 lt!456143)) (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun c!104539 () Bool)

(declare-fun d!124045 () Bool)

(assert (=> d!124045 (= c!104539 (and ((_ is Cons!21935) (toList!6930 lt!456143)) (= (_1!7914 (h!23137 (toList!6930 lt!456143))) (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (=> d!124045 (= (getValueByKey!590 (toList!6930 lt!456143) (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) e!584603)))

(declare-fun b!1034182 () Bool)

(assert (=> b!1034182 (= e!584603 e!584604)))

(declare-fun c!104540 () Bool)

(assert (=> b!1034182 (= c!104540 (and ((_ is Cons!21935) (toList!6930 lt!456143)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456143))) (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))))

(assert (= (and d!124045 c!104539) b!1034181))

(assert (= (and d!124045 (not c!104539)) b!1034182))

(assert (= (and b!1034182 c!104540) b!1034183))

(assert (= (and b!1034182 (not c!104540)) b!1034184))

(declare-fun m!953819 () Bool)

(assert (=> b!1034183 m!953819))

(assert (=> b!1033731 d!124045))

(declare-fun b!1034185 () Bool)

(declare-fun e!584605 () Option!641)

(assert (=> b!1034185 (= e!584605 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456209)))))))

(declare-fun b!1034188 () Bool)

(declare-fun e!584606 () Option!641)

(assert (=> b!1034188 (= e!584606 None!639)))

(declare-fun b!1034187 () Bool)

(assert (=> b!1034187 (= e!584606 (getValueByKey!590 (t!31126 (toList!6930 lt!456209)) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun d!124047 () Bool)

(declare-fun c!104541 () Bool)

(assert (=> d!124047 (= c!104541 (and ((_ is Cons!21935) (toList!6930 lt!456209)) (= (_1!7914 (h!23137 (toList!6930 lt!456209))) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124047 (= (getValueByKey!590 (toList!6930 lt!456209) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) e!584605)))

(declare-fun b!1034186 () Bool)

(assert (=> b!1034186 (= e!584605 e!584606)))

(declare-fun c!104542 () Bool)

(assert (=> b!1034186 (= c!104542 (and ((_ is Cons!21935) (toList!6930 lt!456209)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456209))) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!124047 c!104541) b!1034185))

(assert (= (and d!124047 (not c!104541)) b!1034186))

(assert (= (and b!1034186 c!104542) b!1034187))

(assert (= (and b!1034186 (not c!104542)) b!1034188))

(declare-fun m!953821 () Bool)

(assert (=> b!1034187 m!953821))

(assert (=> b!1033805 d!124047))

(declare-fun lt!456357 () Bool)

(declare-fun d!124049 () Bool)

(assert (=> d!124049 (= lt!456357 (select (content!512 (toList!6930 lt!456092)) (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))))

(declare-fun e!584608 () Bool)

(assert (=> d!124049 (= lt!456357 e!584608)))

(declare-fun res!690809 () Bool)

(assert (=> d!124049 (=> (not res!690809) (not e!584608))))

(assert (=> d!124049 (= res!690809 ((_ is Cons!21935) (toList!6930 lt!456092)))))

(assert (=> d!124049 (= (contains!5994 (toList!6930 lt!456092) (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))) lt!456357)))

(declare-fun b!1034189 () Bool)

(declare-fun e!584607 () Bool)

(assert (=> b!1034189 (= e!584608 e!584607)))

(declare-fun res!690808 () Bool)

(assert (=> b!1034189 (=> res!690808 e!584607)))

(assert (=> b!1034189 (= res!690808 (= (h!23137 (toList!6930 lt!456092)) (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))))

(declare-fun b!1034190 () Bool)

(assert (=> b!1034190 (= e!584607 (contains!5994 (t!31126 (toList!6930 lt!456092)) (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))))

(assert (= (and d!124049 res!690809) b!1034189))

(assert (= (and b!1034189 (not res!690808)) b!1034190))

(declare-fun m!953823 () Bool)

(assert (=> d!124049 m!953823))

(declare-fun m!953825 () Bool)

(assert (=> d!124049 m!953825))

(declare-fun m!953827 () Bool)

(assert (=> b!1034190 m!953827))

(assert (=> b!1033669 d!124049))

(declare-fun d!124051 () Bool)

(assert (=> d!124051 (= (size!31850 thiss!1427) (bvadd (_size!2907 thiss!1427) (bvsdiv (bvadd (extraKeys!5958 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!1033712 d!124051))

(declare-fun d!124053 () Bool)

(declare-fun e!584609 () Bool)

(assert (=> d!124053 e!584609))

(declare-fun res!690810 () Bool)

(assert (=> d!124053 (=> res!690810 e!584609)))

(declare-fun lt!456358 () Bool)

(assert (=> d!124053 (= res!690810 (not lt!456358))))

(declare-fun lt!456361 () Bool)

(assert (=> d!124053 (= lt!456358 lt!456361)))

(declare-fun lt!456360 () Unit!33713)

(declare-fun e!584610 () Unit!33713)

(assert (=> d!124053 (= lt!456360 e!584610)))

(declare-fun c!104543 () Bool)

(assert (=> d!124053 (= c!104543 lt!456361)))

(assert (=> d!124053 (= lt!456361 (containsKey!563 (toList!6930 lt!456207) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124053 (= (contains!5992 lt!456207 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456358)))

(declare-fun b!1034191 () Bool)

(declare-fun lt!456359 () Unit!33713)

(assert (=> b!1034191 (= e!584610 lt!456359)))

(assert (=> b!1034191 (= lt!456359 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456207) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1034191 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456207) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1034192 () Bool)

(declare-fun Unit!33746 () Unit!33713)

(assert (=> b!1034192 (= e!584610 Unit!33746)))

(declare-fun b!1034193 () Bool)

(assert (=> b!1034193 (= e!584609 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456207) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124053 c!104543) b!1034191))

(assert (= (and d!124053 (not c!104543)) b!1034192))

(assert (= (and d!124053 (not res!690810)) b!1034193))

(declare-fun m!953829 () Bool)

(assert (=> d!124053 m!953829))

(declare-fun m!953831 () Bool)

(assert (=> b!1034191 m!953831))

(declare-fun m!953833 () Bool)

(assert (=> b!1034191 m!953833))

(assert (=> b!1034191 m!953833))

(declare-fun m!953835 () Bool)

(assert (=> b!1034191 m!953835))

(assert (=> b!1034193 m!953833))

(assert (=> b!1034193 m!953833))

(assert (=> b!1034193 m!953835))

(assert (=> bm!43664 d!124053))

(declare-fun d!124055 () Bool)

(declare-fun e!584611 () Bool)

(assert (=> d!124055 e!584611))

(declare-fun res!690811 () Bool)

(assert (=> d!124055 (=> res!690811 e!584611)))

(declare-fun lt!456362 () Bool)

(assert (=> d!124055 (= res!690811 (not lt!456362))))

(declare-fun lt!456365 () Bool)

(assert (=> d!124055 (= lt!456362 lt!456365)))

(declare-fun lt!456364 () Unit!33713)

(declare-fun e!584612 () Unit!33713)

(assert (=> d!124055 (= lt!456364 e!584612)))

(declare-fun c!104544 () Bool)

(assert (=> d!124055 (= c!104544 lt!456365)))

(assert (=> d!124055 (= lt!456365 (containsKey!563 (toList!6930 lt!456105) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124055 (= (contains!5992 lt!456105 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456362)))

(declare-fun b!1034194 () Bool)

(declare-fun lt!456363 () Unit!33713)

(assert (=> b!1034194 (= e!584612 lt!456363)))

(assert (=> b!1034194 (= lt!456363 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456105) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1034194 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456105) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1034195 () Bool)

(declare-fun Unit!33747 () Unit!33713)

(assert (=> b!1034195 (= e!584612 Unit!33747)))

(declare-fun b!1034196 () Bool)

(assert (=> b!1034196 (= e!584611 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456105) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124055 c!104544) b!1034194))

(assert (= (and d!124055 (not c!104544)) b!1034195))

(assert (= (and d!124055 (not res!690811)) b!1034196))

(declare-fun m!953837 () Bool)

(assert (=> d!124055 m!953837))

(declare-fun m!953839 () Bool)

(assert (=> b!1034194 m!953839))

(declare-fun m!953841 () Bool)

(assert (=> b!1034194 m!953841))

(assert (=> b!1034194 m!953841))

(declare-fun m!953843 () Bool)

(assert (=> b!1034194 m!953843))

(assert (=> b!1034196 m!953841))

(assert (=> b!1034196 m!953841))

(assert (=> b!1034196 m!953843))

(assert (=> d!123719 d!124055))

(assert (=> d!123719 d!123681))

(assert (=> d!123755 d!123753))

(assert (=> d!123755 d!123741))

(declare-fun d!124057 () Bool)

(assert (=> d!124057 (contains!5992 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915)) lt!455982)))

(assert (=> d!124057 true))

(declare-fun _$35!439 () Unit!33713)

(assert (=> d!124057 (= (choose!1704 lt!455986 lt!456000 lt!455915 lt!455982) _$35!439)))

(declare-fun bs!30228 () Bool)

(assert (= bs!30228 d!124057))

(assert (=> bs!30228 m!952749))

(assert (=> bs!30228 m!952749))

(assert (=> bs!30228 m!952751))

(assert (=> d!123755 d!124057))

(declare-fun d!124059 () Bool)

(declare-fun e!584613 () Bool)

(assert (=> d!124059 e!584613))

(declare-fun res!690812 () Bool)

(assert (=> d!124059 (=> res!690812 e!584613)))

(declare-fun lt!456366 () Bool)

(assert (=> d!124059 (= res!690812 (not lt!456366))))

(declare-fun lt!456369 () Bool)

(assert (=> d!124059 (= lt!456366 lt!456369)))

(declare-fun lt!456368 () Unit!33713)

(declare-fun e!584614 () Unit!33713)

(assert (=> d!124059 (= lt!456368 e!584614)))

(declare-fun c!104545 () Bool)

(assert (=> d!124059 (= c!104545 lt!456369)))

(assert (=> d!124059 (= lt!456369 (containsKey!563 (toList!6930 lt!455986) lt!455982))))

(assert (=> d!124059 (= (contains!5992 lt!455986 lt!455982) lt!456366)))

(declare-fun b!1034197 () Bool)

(declare-fun lt!456367 () Unit!33713)

(assert (=> b!1034197 (= e!584614 lt!456367)))

(assert (=> b!1034197 (= lt!456367 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!455986) lt!455982))))

(assert (=> b!1034197 (isDefined!438 (getValueByKey!590 (toList!6930 lt!455986) lt!455982))))

(declare-fun b!1034198 () Bool)

(declare-fun Unit!33748 () Unit!33713)

(assert (=> b!1034198 (= e!584614 Unit!33748)))

(declare-fun b!1034199 () Bool)

(assert (=> b!1034199 (= e!584613 (isDefined!438 (getValueByKey!590 (toList!6930 lt!455986) lt!455982)))))

(assert (= (and d!124059 c!104545) b!1034197))

(assert (= (and d!124059 (not c!104545)) b!1034198))

(assert (= (and d!124059 (not res!690812)) b!1034199))

(declare-fun m!953845 () Bool)

(assert (=> d!124059 m!953845))

(declare-fun m!953847 () Bool)

(assert (=> b!1034197 m!953847))

(declare-fun m!953849 () Bool)

(assert (=> b!1034197 m!953849))

(assert (=> b!1034197 m!953849))

(declare-fun m!953851 () Bool)

(assert (=> b!1034197 m!953851))

(assert (=> b!1034199 m!953849))

(assert (=> b!1034199 m!953849))

(assert (=> b!1034199 m!953851))

(assert (=> d!123755 d!124059))

(declare-fun d!124061 () Bool)

(declare-fun res!690813 () Bool)

(declare-fun e!584615 () Bool)

(assert (=> d!124061 (=> res!690813 e!584615)))

(assert (=> d!124061 (= res!690813 (and ((_ is Cons!21935) (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915)))) (= (_1!7914 (h!23137 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915))))) lt!455982)))))

(assert (=> d!124061 (= (containsKey!563 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915))) lt!455982) e!584615)))

(declare-fun b!1034200 () Bool)

(declare-fun e!584616 () Bool)

(assert (=> b!1034200 (= e!584615 e!584616)))

(declare-fun res!690814 () Bool)

(assert (=> b!1034200 (=> (not res!690814) (not e!584616))))

(assert (=> b!1034200 (= res!690814 (and (or (not ((_ is Cons!21935) (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915))))) (bvsle (_1!7914 (h!23137 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915))))) lt!455982)) ((_ is Cons!21935) (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915)))) (bvslt (_1!7914 (h!23137 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915))))) lt!455982)))))

(declare-fun b!1034201 () Bool)

(assert (=> b!1034201 (= e!584616 (containsKey!563 (t!31126 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915)))) lt!455982))))

(assert (= (and d!124061 (not res!690813)) b!1034200))

(assert (= (and b!1034200 res!690814) b!1034201))

(declare-fun m!953853 () Bool)

(assert (=> b!1034201 m!953853))

(assert (=> d!123753 d!124061))

(declare-fun b!1034202 () Bool)

(declare-fun e!584617 () Option!641)

(assert (=> b!1034202 (= e!584617 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456120)))))))

(declare-fun b!1034205 () Bool)

(declare-fun e!584618 () Option!641)

(assert (=> b!1034205 (= e!584618 None!639)))

(declare-fun b!1034204 () Bool)

(assert (=> b!1034204 (= e!584618 (getValueByKey!590 (t!31126 (toList!6930 lt!456120)) (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))))))

(declare-fun d!124063 () Bool)

(declare-fun c!104546 () Bool)

(assert (=> d!124063 (= c!104546 (and ((_ is Cons!21935) (toList!6930 lt!456120)) (= (_1!7914 (h!23137 (toList!6930 lt!456120))) (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))))))))

(assert (=> d!124063 (= (getValueByKey!590 (toList!6930 lt!456120) (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))) e!584617)))

(declare-fun b!1034203 () Bool)

(assert (=> b!1034203 (= e!584617 e!584618)))

(declare-fun c!104547 () Bool)

(assert (=> b!1034203 (= c!104547 (and ((_ is Cons!21935) (toList!6930 lt!456120)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456120))) (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!124063 c!104546) b!1034202))

(assert (= (and d!124063 (not c!104546)) b!1034203))

(assert (= (and b!1034203 c!104547) b!1034204))

(assert (= (and b!1034203 (not c!104547)) b!1034205))

(declare-fun m!953855 () Bool)

(assert (=> b!1034204 m!953855))

(assert (=> b!1033718 d!124063))

(declare-fun b!1034206 () Bool)

(declare-fun e!584619 () Option!641)

(assert (=> b!1034206 (= e!584619 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456179)))))))

(declare-fun b!1034209 () Bool)

(declare-fun e!584620 () Option!641)

(assert (=> b!1034209 (= e!584620 None!639)))

(declare-fun b!1034208 () Bool)

(assert (=> b!1034208 (= e!584620 (getValueByKey!590 (t!31126 (toList!6930 lt!456179)) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun d!124065 () Bool)

(declare-fun c!104548 () Bool)

(assert (=> d!124065 (= c!104548 (and ((_ is Cons!21935) (toList!6930 lt!456179)) (= (_1!7914 (h!23137 (toList!6930 lt!456179))) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124065 (= (getValueByKey!590 (toList!6930 lt!456179) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) e!584619)))

(declare-fun b!1034207 () Bool)

(assert (=> b!1034207 (= e!584619 e!584620)))

(declare-fun c!104549 () Bool)

(assert (=> b!1034207 (= c!104549 (and ((_ is Cons!21935) (toList!6930 lt!456179)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456179))) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!124065 c!104548) b!1034206))

(assert (= (and d!124065 (not c!104548)) b!1034207))

(assert (= (and b!1034207 c!104549) b!1034208))

(assert (= (and b!1034207 (not c!104549)) b!1034209))

(declare-fun m!953857 () Bool)

(assert (=> b!1034208 m!953857))

(assert (=> b!1033774 d!124065))

(declare-fun d!124067 () Bool)

(declare-fun e!584621 () Bool)

(assert (=> d!124067 e!584621))

(declare-fun res!690816 () Bool)

(assert (=> d!124067 (=> (not res!690816) (not e!584621))))

(declare-fun lt!456371 () ListLongMap!13829)

(assert (=> d!124067 (= res!690816 (contains!5992 lt!456371 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914)))))))

(declare-fun lt!456373 () List!21939)

(assert (=> d!124067 (= lt!456371 (ListLongMap!13830 lt!456373))))

(declare-fun lt!456370 () Unit!33713)

(declare-fun lt!456372 () Unit!33713)

(assert (=> d!124067 (= lt!456370 lt!456372)))

(assert (=> d!124067 (= (getValueByKey!590 lt!456373 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914)))) (Some!640 (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914)))))))

(assert (=> d!124067 (= lt!456372 (lemmaContainsTupThenGetReturnValue!280 lt!456373 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914)))))))

(assert (=> d!124067 (= lt!456373 (insertStrictlySorted!373 (toList!6930 call!43665) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914)))))))

(assert (=> d!124067 (= (+!3130 call!43665 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914))) lt!456371)))

(declare-fun b!1034210 () Bool)

(declare-fun res!690815 () Bool)

(assert (=> b!1034210 (=> (not res!690815) (not e!584621))))

(assert (=> b!1034210 (= res!690815 (= (getValueByKey!590 (toList!6930 lt!456371) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914)))) (Some!640 (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914))))))))

(declare-fun b!1034211 () Bool)

(assert (=> b!1034211 (= e!584621 (contains!5994 (toList!6930 lt!456371) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!455914))))))

(assert (= (and d!124067 res!690816) b!1034210))

(assert (= (and b!1034210 res!690815) b!1034211))

(declare-fun m!953859 () Bool)

(assert (=> d!124067 m!953859))

(declare-fun m!953861 () Bool)

(assert (=> d!124067 m!953861))

(declare-fun m!953863 () Bool)

(assert (=> d!124067 m!953863))

(declare-fun m!953865 () Bool)

(assert (=> d!124067 m!953865))

(declare-fun m!953867 () Bool)

(assert (=> b!1034210 m!953867))

(declare-fun m!953869 () Bool)

(assert (=> b!1034211 m!953869))

(assert (=> b!1033789 d!124067))

(assert (=> b!1033592 d!123727))

(declare-fun d!124069 () Bool)

(declare-fun e!584622 () Bool)

(assert (=> d!124069 e!584622))

(declare-fun res!690817 () Bool)

(assert (=> d!124069 (=> res!690817 e!584622)))

(declare-fun lt!456374 () Bool)

(assert (=> d!124069 (= res!690817 (not lt!456374))))

(declare-fun lt!456377 () Bool)

(assert (=> d!124069 (= lt!456374 lt!456377)))

(declare-fun lt!456376 () Unit!33713)

(declare-fun e!584623 () Unit!33713)

(assert (=> d!124069 (= lt!456376 e!584623)))

(declare-fun c!104550 () Bool)

(assert (=> d!124069 (= c!104550 lt!456377)))

(assert (=> d!124069 (= lt!456377 (containsKey!563 (toList!6930 lt!456143) (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124069 (= (contains!5992 lt!456143 (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) lt!456374)))

(declare-fun b!1034212 () Bool)

(declare-fun lt!456375 () Unit!33713)

(assert (=> b!1034212 (= e!584623 lt!456375)))

(assert (=> b!1034212 (= lt!456375 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456143) (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> b!1034212 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456143) (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1034213 () Bool)

(declare-fun Unit!33749 () Unit!33713)

(assert (=> b!1034213 (= e!584623 Unit!33749)))

(declare-fun b!1034214 () Bool)

(assert (=> b!1034214 (= e!584622 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456143) (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!124069 c!104550) b!1034212))

(assert (= (and d!124069 (not c!104550)) b!1034213))

(assert (= (and d!124069 (not res!690817)) b!1034214))

(declare-fun m!953871 () Bool)

(assert (=> d!124069 m!953871))

(declare-fun m!953873 () Bool)

(assert (=> b!1034212 m!953873))

(assert (=> b!1034212 m!953141))

(assert (=> b!1034212 m!953141))

(declare-fun m!953875 () Bool)

(assert (=> b!1034212 m!953875))

(assert (=> b!1034214 m!953141))

(assert (=> b!1034214 m!953141))

(assert (=> b!1034214 m!953875))

(assert (=> d!123761 d!124069))

(declare-fun b!1034215 () Bool)

(declare-fun e!584624 () Option!641)

(assert (=> b!1034215 (= e!584624 (Some!640 (_2!7914 (h!23137 lt!456145))))))

(declare-fun b!1034218 () Bool)

(declare-fun e!584625 () Option!641)

(assert (=> b!1034218 (= e!584625 None!639)))

(declare-fun b!1034217 () Bool)

(assert (=> b!1034217 (= e!584625 (getValueByKey!590 (t!31126 lt!456145) (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun c!104551 () Bool)

(declare-fun d!124071 () Bool)

(assert (=> d!124071 (= c!104551 (and ((_ is Cons!21935) lt!456145) (= (_1!7914 (h!23137 lt!456145)) (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (=> d!124071 (= (getValueByKey!590 lt!456145 (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) e!584624)))

(declare-fun b!1034216 () Bool)

(assert (=> b!1034216 (= e!584624 e!584625)))

(declare-fun c!104552 () Bool)

(assert (=> b!1034216 (= c!104552 (and ((_ is Cons!21935) lt!456145) (not (= (_1!7914 (h!23137 lt!456145)) (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))))

(assert (= (and d!124071 c!104551) b!1034215))

(assert (= (and d!124071 (not c!104551)) b!1034216))

(assert (= (and b!1034216 c!104552) b!1034217))

(assert (= (and b!1034216 (not c!104552)) b!1034218))

(declare-fun m!953877 () Bool)

(assert (=> b!1034217 m!953877))

(assert (=> d!123761 d!124071))

(declare-fun d!124073 () Bool)

(assert (=> d!124073 (= (getValueByKey!590 lt!456145 (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) (Some!640 (_2!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun lt!456378 () Unit!33713)

(assert (=> d!124073 (= lt!456378 (choose!1707 lt!456145 (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun e!584626 () Bool)

(assert (=> d!124073 e!584626))

(declare-fun res!690818 () Bool)

(assert (=> d!124073 (=> (not res!690818) (not e!584626))))

(assert (=> d!124073 (= res!690818 (isStrictlySorted!714 lt!456145))))

(assert (=> d!124073 (= (lemmaContainsTupThenGetReturnValue!280 lt!456145 (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) lt!456378)))

(declare-fun b!1034219 () Bool)

(declare-fun res!690819 () Bool)

(assert (=> b!1034219 (=> (not res!690819) (not e!584626))))

(assert (=> b!1034219 (= res!690819 (containsKey!563 lt!456145 (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1034220 () Bool)

(assert (=> b!1034220 (= e!584626 (contains!5994 lt!456145 (tuple2!15807 (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!124073 res!690818) b!1034219))

(assert (= (and b!1034219 res!690819) b!1034220))

(assert (=> d!124073 m!953135))

(declare-fun m!953879 () Bool)

(assert (=> d!124073 m!953879))

(declare-fun m!953881 () Bool)

(assert (=> d!124073 m!953881))

(declare-fun m!953883 () Bool)

(assert (=> b!1034219 m!953883))

(declare-fun m!953885 () Bool)

(assert (=> b!1034220 m!953885))

(assert (=> d!123761 d!124073))

(declare-fun lt!456379 () List!21939)

(declare-fun b!1034221 () Bool)

(declare-fun e!584628 () Bool)

(assert (=> b!1034221 (= e!584628 (contains!5994 lt!456379 (tuple2!15807 (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1034222 () Bool)

(declare-fun e!584630 () List!21939)

(declare-fun call!43698 () List!21939)

(assert (=> b!1034222 (= e!584630 call!43698)))

(declare-fun c!104556 () Bool)

(declare-fun e!584627 () List!21939)

(declare-fun c!104554 () Bool)

(declare-fun b!1034223 () Bool)

(assert (=> b!1034223 (= e!584627 (ite c!104556 (t!31126 (toList!6930 (ite c!104353 call!43643 (ite c!104354 call!43649 call!43646)))) (ite c!104554 (Cons!21935 (h!23137 (toList!6930 (ite c!104353 call!43643 (ite c!104354 call!43649 call!43646)))) (t!31126 (toList!6930 (ite c!104353 call!43643 (ite c!104354 call!43649 call!43646))))) Nil!21936)))))

(declare-fun b!1034224 () Bool)

(declare-fun res!690821 () Bool)

(assert (=> b!1034224 (=> (not res!690821) (not e!584628))))

(assert (=> b!1034224 (= res!690821 (containsKey!563 lt!456379 (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1034225 () Bool)

(declare-fun e!584631 () List!21939)

(declare-fun call!43700 () List!21939)

(assert (=> b!1034225 (= e!584631 call!43700)))

(declare-fun bm!43695 () Bool)

(declare-fun call!43699 () List!21939)

(assert (=> bm!43695 (= call!43700 call!43699)))

(declare-fun b!1034226 () Bool)

(declare-fun e!584629 () List!21939)

(assert (=> b!1034226 (= e!584630 e!584629)))

(assert (=> b!1034226 (= c!104556 (and ((_ is Cons!21935) (toList!6930 (ite c!104353 call!43643 (ite c!104354 call!43649 call!43646)))) (= (_1!7914 (h!23137 (toList!6930 (ite c!104353 call!43643 (ite c!104354 call!43649 call!43646))))) (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1034227 () Bool)

(assert (=> b!1034227 (= e!584631 call!43700)))

(declare-fun b!1034228 () Bool)

(assert (=> b!1034228 (= e!584629 call!43699)))

(declare-fun d!124075 () Bool)

(assert (=> d!124075 e!584628))

(declare-fun res!690820 () Bool)

(assert (=> d!124075 (=> (not res!690820) (not e!584628))))

(assert (=> d!124075 (= res!690820 (isStrictlySorted!714 lt!456379))))

(assert (=> d!124075 (= lt!456379 e!584630)))

(declare-fun c!104553 () Bool)

(assert (=> d!124075 (= c!104553 (and ((_ is Cons!21935) (toList!6930 (ite c!104353 call!43643 (ite c!104354 call!43649 call!43646)))) (bvslt (_1!7914 (h!23137 (toList!6930 (ite c!104353 call!43643 (ite c!104354 call!43649 call!43646))))) (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (=> d!124075 (isStrictlySorted!714 (toList!6930 (ite c!104353 call!43643 (ite c!104354 call!43649 call!43646))))))

(assert (=> d!124075 (= (insertStrictlySorted!373 (toList!6930 (ite c!104353 call!43643 (ite c!104354 call!43649 call!43646))) (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) lt!456379)))

(declare-fun bm!43696 () Bool)

(assert (=> bm!43696 (= call!43699 call!43698)))

(declare-fun bm!43697 () Bool)

(assert (=> bm!43697 (= call!43698 ($colon$colon!604 e!584627 (ite c!104553 (h!23137 (toList!6930 (ite c!104353 call!43643 (ite c!104354 call!43649 call!43646)))) (tuple2!15807 (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))))

(declare-fun c!104555 () Bool)

(assert (=> bm!43697 (= c!104555 c!104553)))

(declare-fun b!1034229 () Bool)

(assert (=> b!1034229 (= e!584627 (insertStrictlySorted!373 (t!31126 (toList!6930 (ite c!104353 call!43643 (ite c!104354 call!43649 call!43646)))) (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1034230 () Bool)

(assert (=> b!1034230 (= c!104554 (and ((_ is Cons!21935) (toList!6930 (ite c!104353 call!43643 (ite c!104354 call!43649 call!43646)))) (bvsgt (_1!7914 (h!23137 (toList!6930 (ite c!104353 call!43643 (ite c!104354 call!43649 call!43646))))) (_1!7914 (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (=> b!1034230 (= e!584629 e!584631)))

(assert (= (and d!124075 c!104553) b!1034222))

(assert (= (and d!124075 (not c!104553)) b!1034226))

(assert (= (and b!1034226 c!104556) b!1034228))

(assert (= (and b!1034226 (not c!104556)) b!1034230))

(assert (= (and b!1034230 c!104554) b!1034225))

(assert (= (and b!1034230 (not c!104554)) b!1034227))

(assert (= (or b!1034225 b!1034227) bm!43695))

(assert (= (or b!1034228 bm!43695) bm!43696))

(assert (= (or b!1034222 bm!43696) bm!43697))

(assert (= (and bm!43697 c!104555) b!1034229))

(assert (= (and bm!43697 (not c!104555)) b!1034223))

(assert (= (and d!124075 res!690820) b!1034224))

(assert (= (and b!1034224 res!690821) b!1034221))

(declare-fun m!953887 () Bool)

(assert (=> b!1034229 m!953887))

(declare-fun m!953889 () Bool)

(assert (=> d!124075 m!953889))

(declare-fun m!953891 () Bool)

(assert (=> d!124075 m!953891))

(declare-fun m!953893 () Bool)

(assert (=> b!1034221 m!953893))

(declare-fun m!953895 () Bool)

(assert (=> b!1034224 m!953895))

(declare-fun m!953897 () Bool)

(assert (=> bm!43697 m!953897))

(assert (=> d!123761 d!124075))

(declare-fun d!124077 () Bool)

(declare-fun e!584632 () Bool)

(assert (=> d!124077 e!584632))

(declare-fun res!690822 () Bool)

(assert (=> d!124077 (=> res!690822 e!584632)))

(declare-fun lt!456380 () Bool)

(assert (=> d!124077 (= res!690822 (not lt!456380))))

(declare-fun lt!456383 () Bool)

(assert (=> d!124077 (= lt!456380 lt!456383)))

(declare-fun lt!456382 () Unit!33713)

(declare-fun e!584633 () Unit!33713)

(assert (=> d!124077 (= lt!456382 e!584633)))

(declare-fun c!104557 () Bool)

(assert (=> d!124077 (= c!104557 lt!456383)))

(assert (=> d!124077 (= lt!456383 (containsKey!563 (toList!6930 lt!456209) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> d!124077 (= (contains!5992 lt!456209 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!456380)))

(declare-fun b!1034231 () Bool)

(declare-fun lt!456381 () Unit!33713)

(assert (=> b!1034231 (= e!584633 lt!456381)))

(assert (=> b!1034231 (= lt!456381 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456209) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> b!1034231 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456209) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034232 () Bool)

(declare-fun Unit!33750 () Unit!33713)

(assert (=> b!1034232 (= e!584633 Unit!33750)))

(declare-fun b!1034233 () Bool)

(assert (=> b!1034233 (= e!584632 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456209) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124077 c!104557) b!1034231))

(assert (= (and d!124077 (not c!104557)) b!1034232))

(assert (= (and d!124077 (not res!690822)) b!1034233))

(declare-fun m!953899 () Bool)

(assert (=> d!124077 m!953899))

(declare-fun m!953901 () Bool)

(assert (=> b!1034231 m!953901))

(assert (=> b!1034231 m!953313))

(assert (=> b!1034231 m!953313))

(declare-fun m!953903 () Bool)

(assert (=> b!1034231 m!953903))

(assert (=> b!1034233 m!953313))

(assert (=> b!1034233 m!953313))

(assert (=> b!1034233 m!953903))

(assert (=> d!123795 d!124077))

(declare-fun b!1034234 () Bool)

(declare-fun e!584634 () Option!641)

(assert (=> b!1034234 (= e!584634 (Some!640 (_2!7914 (h!23137 lt!456211))))))

(declare-fun b!1034237 () Bool)

(declare-fun e!584635 () Option!641)

(assert (=> b!1034237 (= e!584635 None!639)))

(declare-fun b!1034236 () Bool)

(assert (=> b!1034236 (= e!584635 (getValueByKey!590 (t!31126 lt!456211) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun d!124079 () Bool)

(declare-fun c!104558 () Bool)

(assert (=> d!124079 (= c!104558 (and ((_ is Cons!21935) lt!456211) (= (_1!7914 (h!23137 lt!456211)) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124079 (= (getValueByKey!590 lt!456211 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) e!584634)))

(declare-fun b!1034235 () Bool)

(assert (=> b!1034235 (= e!584634 e!584635)))

(declare-fun c!104559 () Bool)

(assert (=> b!1034235 (= c!104559 (and ((_ is Cons!21935) lt!456211) (not (= (_1!7914 (h!23137 lt!456211)) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!124079 c!104558) b!1034234))

(assert (= (and d!124079 (not c!104558)) b!1034235))

(assert (= (and b!1034235 c!104559) b!1034236))

(assert (= (and b!1034235 (not c!104559)) b!1034237))

(declare-fun m!953905 () Bool)

(assert (=> b!1034236 m!953905))

(assert (=> d!123795 d!124079))

(declare-fun d!124081 () Bool)

(assert (=> d!124081 (= (getValueByKey!590 lt!456211 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456384 () Unit!33713)

(assert (=> d!124081 (= lt!456384 (choose!1707 lt!456211 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun e!584636 () Bool)

(assert (=> d!124081 e!584636))

(declare-fun res!690823 () Bool)

(assert (=> d!124081 (=> (not res!690823) (not e!584636))))

(assert (=> d!124081 (= res!690823 (isStrictlySorted!714 lt!456211))))

(assert (=> d!124081 (= (lemmaContainsTupThenGetReturnValue!280 lt!456211 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!456384)))

(declare-fun b!1034238 () Bool)

(declare-fun res!690824 () Bool)

(assert (=> b!1034238 (=> (not res!690824) (not e!584636))))

(assert (=> b!1034238 (= res!690824 (containsKey!563 lt!456211 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034239 () Bool)

(assert (=> b!1034239 (= e!584636 (contains!5994 lt!456211 (tuple2!15807 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124081 res!690823) b!1034238))

(assert (= (and b!1034238 res!690824) b!1034239))

(assert (=> d!124081 m!953307))

(declare-fun m!953907 () Bool)

(assert (=> d!124081 m!953907))

(declare-fun m!953909 () Bool)

(assert (=> d!124081 m!953909))

(declare-fun m!953911 () Bool)

(assert (=> b!1034238 m!953911))

(declare-fun m!953913 () Bool)

(assert (=> b!1034239 m!953913))

(assert (=> d!123795 d!124081))

(declare-fun b!1034240 () Bool)

(declare-fun e!584638 () Bool)

(declare-fun lt!456385 () List!21939)

(assert (=> b!1034240 (= e!584638 (contains!5994 lt!456385 (tuple2!15807 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1034241 () Bool)

(declare-fun e!584640 () List!21939)

(declare-fun call!43701 () List!21939)

(assert (=> b!1034241 (= e!584640 call!43701)))

(declare-fun c!104561 () Bool)

(declare-fun e!584637 () List!21939)

(declare-fun b!1034242 () Bool)

(declare-fun c!104563 () Bool)

(assert (=> b!1034242 (= e!584637 (ite c!104563 (t!31126 (toList!6930 call!43638)) (ite c!104561 (Cons!21935 (h!23137 (toList!6930 call!43638)) (t!31126 (toList!6930 call!43638))) Nil!21936)))))

(declare-fun b!1034243 () Bool)

(declare-fun res!690826 () Bool)

(assert (=> b!1034243 (=> (not res!690826) (not e!584638))))

(assert (=> b!1034243 (= res!690826 (containsKey!563 lt!456385 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034244 () Bool)

(declare-fun e!584641 () List!21939)

(declare-fun call!43703 () List!21939)

(assert (=> b!1034244 (= e!584641 call!43703)))

(declare-fun bm!43698 () Bool)

(declare-fun call!43702 () List!21939)

(assert (=> bm!43698 (= call!43703 call!43702)))

(declare-fun b!1034245 () Bool)

(declare-fun e!584639 () List!21939)

(assert (=> b!1034245 (= e!584640 e!584639)))

(assert (=> b!1034245 (= c!104563 (and ((_ is Cons!21935) (toList!6930 call!43638)) (= (_1!7914 (h!23137 (toList!6930 call!43638))) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1034246 () Bool)

(assert (=> b!1034246 (= e!584641 call!43703)))

(declare-fun b!1034247 () Bool)

(assert (=> b!1034247 (= e!584639 call!43702)))

(declare-fun d!124083 () Bool)

(assert (=> d!124083 e!584638))

(declare-fun res!690825 () Bool)

(assert (=> d!124083 (=> (not res!690825) (not e!584638))))

(assert (=> d!124083 (= res!690825 (isStrictlySorted!714 lt!456385))))

(assert (=> d!124083 (= lt!456385 e!584640)))

(declare-fun c!104560 () Bool)

(assert (=> d!124083 (= c!104560 (and ((_ is Cons!21935) (toList!6930 call!43638)) (bvslt (_1!7914 (h!23137 (toList!6930 call!43638))) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124083 (isStrictlySorted!714 (toList!6930 call!43638))))

(assert (=> d!124083 (= (insertStrictlySorted!373 (toList!6930 call!43638) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!456385)))

(declare-fun bm!43699 () Bool)

(assert (=> bm!43699 (= call!43702 call!43701)))

(declare-fun bm!43700 () Bool)

(assert (=> bm!43700 (= call!43701 ($colon$colon!604 e!584637 (ite c!104560 (h!23137 (toList!6930 call!43638)) (tuple2!15807 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun c!104562 () Bool)

(assert (=> bm!43700 (= c!104562 c!104560)))

(declare-fun b!1034248 () Bool)

(assert (=> b!1034248 (= e!584637 (insertStrictlySorted!373 (t!31126 (toList!6930 call!43638)) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034249 () Bool)

(assert (=> b!1034249 (= c!104561 (and ((_ is Cons!21935) (toList!6930 call!43638)) (bvsgt (_1!7914 (h!23137 (toList!6930 call!43638))) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> b!1034249 (= e!584639 e!584641)))

(assert (= (and d!124083 c!104560) b!1034241))

(assert (= (and d!124083 (not c!104560)) b!1034245))

(assert (= (and b!1034245 c!104563) b!1034247))

(assert (= (and b!1034245 (not c!104563)) b!1034249))

(assert (= (and b!1034249 c!104561) b!1034244))

(assert (= (and b!1034249 (not c!104561)) b!1034246))

(assert (= (or b!1034244 b!1034246) bm!43698))

(assert (= (or b!1034247 bm!43698) bm!43699))

(assert (= (or b!1034241 bm!43699) bm!43700))

(assert (= (and bm!43700 c!104562) b!1034248))

(assert (= (and bm!43700 (not c!104562)) b!1034242))

(assert (= (and d!124083 res!690825) b!1034243))

(assert (= (and b!1034243 res!690826) b!1034240))

(declare-fun m!953915 () Bool)

(assert (=> b!1034248 m!953915))

(declare-fun m!953917 () Bool)

(assert (=> d!124083 m!953917))

(declare-fun m!953919 () Bool)

(assert (=> d!124083 m!953919))

(declare-fun m!953921 () Bool)

(assert (=> b!1034240 m!953921))

(declare-fun m!953923 () Bool)

(assert (=> b!1034243 m!953923))

(declare-fun m!953925 () Bool)

(assert (=> bm!43700 m!953925))

(assert (=> d!123795 d!124083))

(declare-fun d!124085 () Bool)

(declare-fun res!690827 () Bool)

(declare-fun e!584642 () Bool)

(assert (=> d!124085 (=> res!690827 e!584642)))

(assert (=> d!124085 (= res!690827 (and ((_ is Cons!21935) (toList!6930 lt!456029)) (= (_1!7914 (h!23137 (toList!6930 lt!456029))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124085 (= (containsKey!563 (toList!6930 lt!456029) #b0000000000000000000000000000000000000000000000000000000000000000) e!584642)))

(declare-fun b!1034250 () Bool)

(declare-fun e!584643 () Bool)

(assert (=> b!1034250 (= e!584642 e!584643)))

(declare-fun res!690828 () Bool)

(assert (=> b!1034250 (=> (not res!690828) (not e!584643))))

(assert (=> b!1034250 (= res!690828 (and (or (not ((_ is Cons!21935) (toList!6930 lt!456029))) (bvsle (_1!7914 (h!23137 (toList!6930 lt!456029))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21935) (toList!6930 lt!456029)) (bvslt (_1!7914 (h!23137 (toList!6930 lt!456029))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034251 () Bool)

(assert (=> b!1034251 (= e!584643 (containsKey!563 (t!31126 (toList!6930 lt!456029)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124085 (not res!690827)) b!1034250))

(assert (= (and b!1034250 res!690828) b!1034251))

(declare-fun m!953927 () Bool)

(assert (=> b!1034251 m!953927))

(assert (=> d!123781 d!124085))

(declare-fun d!124087 () Bool)

(declare-fun res!690829 () Bool)

(declare-fun e!584644 () Bool)

(assert (=> d!124087 (=> res!690829 e!584644)))

(assert (=> d!124087 (= res!690829 (and ((_ is Cons!21935) (toList!6930 lt!456003)) (= (_1!7914 (h!23137 (toList!6930 lt!456003))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124087 (= (containsKey!563 (toList!6930 lt!456003) #b1000000000000000000000000000000000000000000000000000000000000000) e!584644)))

(declare-fun b!1034252 () Bool)

(declare-fun e!584645 () Bool)

(assert (=> b!1034252 (= e!584644 e!584645)))

(declare-fun res!690830 () Bool)

(assert (=> b!1034252 (=> (not res!690830) (not e!584645))))

(assert (=> b!1034252 (= res!690830 (and (or (not ((_ is Cons!21935) (toList!6930 lt!456003))) (bvsle (_1!7914 (h!23137 (toList!6930 lt!456003))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21935) (toList!6930 lt!456003)) (bvslt (_1!7914 (h!23137 (toList!6930 lt!456003))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034253 () Bool)

(assert (=> b!1034253 (= e!584645 (containsKey!563 (t!31126 (toList!6930 lt!456003)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124087 (not res!690829)) b!1034252))

(assert (= (and b!1034252 res!690830) b!1034253))

(declare-fun m!953929 () Bool)

(assert (=> b!1034253 m!953929))

(assert (=> d!123779 d!124087))

(declare-fun d!124089 () Bool)

(assert (=> d!124089 (isDefined!438 (getValueByKey!590 (toList!6930 lt!455937) key!909))))

(declare-fun lt!456386 () Unit!33713)

(assert (=> d!124089 (= lt!456386 (choose!1706 (toList!6930 lt!455937) key!909))))

(declare-fun e!584646 () Bool)

(assert (=> d!124089 e!584646))

(declare-fun res!690831 () Bool)

(assert (=> d!124089 (=> (not res!690831) (not e!584646))))

(assert (=> d!124089 (= res!690831 (isStrictlySorted!714 (toList!6930 lt!455937)))))

(assert (=> d!124089 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!455937) key!909) lt!456386)))

(declare-fun b!1034254 () Bool)

(assert (=> b!1034254 (= e!584646 (containsKey!563 (toList!6930 lt!455937) key!909))))

(assert (= (and d!124089 res!690831) b!1034254))

(assert (=> d!124089 m!953165))

(assert (=> d!124089 m!953165))

(assert (=> d!124089 m!953167))

(declare-fun m!953931 () Bool)

(assert (=> d!124089 m!953931))

(declare-fun m!953933 () Bool)

(assert (=> d!124089 m!953933))

(assert (=> b!1034254 m!953161))

(assert (=> b!1033736 d!124089))

(assert (=> b!1033736 d!123871))

(assert (=> b!1033736 d!123873))

(declare-fun b!1034255 () Bool)

(declare-fun e!584647 () Bool)

(declare-fun e!584648 () Bool)

(assert (=> b!1034255 (= e!584647 e!584648)))

(declare-fun lt!456389 () (_ BitVec 64))

(assert (=> b!1034255 (= lt!456389 (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!456387 () Unit!33713)

(assert (=> b!1034255 (= lt!456387 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11402 thiss!1427) lt!456389 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1034255 (arrayContainsKey!0 (_keys!11402 thiss!1427) lt!456389 #b00000000000000000000000000000000)))

(declare-fun lt!456388 () Unit!33713)

(assert (=> b!1034255 (= lt!456388 lt!456387)))

(declare-fun res!690833 () Bool)

(assert (=> b!1034255 (= res!690833 (= (seekEntryOrOpen!0 (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!11402 thiss!1427) (mask!30078 thiss!1427)) (Found!9729 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1034255 (=> (not res!690833) (not e!584648))))

(declare-fun b!1034256 () Bool)

(declare-fun e!584649 () Bool)

(assert (=> b!1034256 (= e!584649 e!584647)))

(declare-fun c!104564 () Bool)

(assert (=> b!1034256 (= c!104564 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!124091 () Bool)

(declare-fun res!690832 () Bool)

(assert (=> d!124091 (=> res!690832 e!584649)))

(assert (=> d!124091 (= res!690832 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 thiss!1427))))))

(assert (=> d!124091 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11402 thiss!1427) (mask!30078 thiss!1427)) e!584649)))

(declare-fun b!1034257 () Bool)

(declare-fun call!43704 () Bool)

(assert (=> b!1034257 (= e!584647 call!43704)))

(declare-fun b!1034258 () Bool)

(assert (=> b!1034258 (= e!584648 call!43704)))

(declare-fun bm!43701 () Bool)

(assert (=> bm!43701 (= call!43704 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!11402 thiss!1427) (mask!30078 thiss!1427)))))

(assert (= (and d!124091 (not res!690832)) b!1034256))

(assert (= (and b!1034256 c!104564) b!1034255))

(assert (= (and b!1034256 (not c!104564)) b!1034257))

(assert (= (and b!1034255 res!690833) b!1034258))

(assert (= (or b!1034258 b!1034257) bm!43701))

(assert (=> b!1034255 m!953505))

(declare-fun m!953935 () Bool)

(assert (=> b!1034255 m!953935))

(declare-fun m!953937 () Bool)

(assert (=> b!1034255 m!953937))

(assert (=> b!1034255 m!953505))

(declare-fun m!953939 () Bool)

(assert (=> b!1034255 m!953939))

(assert (=> b!1034256 m!953505))

(assert (=> b!1034256 m!953505))

(assert (=> b!1034256 m!953507))

(declare-fun m!953941 () Bool)

(assert (=> bm!43701 m!953941))

(assert (=> bm!43655 d!124091))

(declare-fun b!1034260 () Bool)

(declare-fun e!584656 () ListLongMap!13829)

(declare-fun call!43705 () ListLongMap!13829)

(assert (=> b!1034260 (= e!584656 call!43705)))

(declare-fun b!1034261 () Bool)

(assert (=> b!1034261 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 thiss!1427))))))

(assert (=> b!1034261 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31845 (_values!6249 thiss!1427))))))

(declare-fun e!584650 () Bool)

(declare-fun lt!456391 () ListLongMap!13829)

(assert (=> b!1034261 (= e!584650 (= (apply!899 lt!456391 (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1034262 () Bool)

(declare-fun e!584651 () Bool)

(assert (=> b!1034262 (= e!584651 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1034262 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1034263 () Bool)

(declare-fun e!584653 () Bool)

(declare-fun e!584652 () Bool)

(assert (=> b!1034263 (= e!584653 e!584652)))

(declare-fun c!104565 () Bool)

(assert (=> b!1034263 (= c!104565 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun b!1034264 () Bool)

(declare-fun lt!456396 () Unit!33713)

(declare-fun lt!456393 () Unit!33713)

(assert (=> b!1034264 (= lt!456396 lt!456393)))

(declare-fun lt!456392 () (_ BitVec 64))

(declare-fun lt!456390 () (_ BitVec 64))

(declare-fun lt!456395 () V!37563)

(declare-fun lt!456394 () ListLongMap!13829)

(assert (=> b!1034264 (not (contains!5992 (+!3130 lt!456394 (tuple2!15807 lt!456392 lt!456395)) lt!456390))))

(assert (=> b!1034264 (= lt!456393 (addStillNotContains!243 lt!456394 lt!456392 lt!456395 lt!456390))))

(assert (=> b!1034264 (= lt!456390 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1034264 (= lt!456395 (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1034264 (= lt!456392 (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1034264 (= lt!456394 call!43705)))

(assert (=> b!1034264 (= e!584656 (+!3130 call!43705 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1034265 () Bool)

(assert (=> b!1034265 (= e!584652 (isEmpty!931 lt!456391))))

(declare-fun bm!43702 () Bool)

(assert (=> bm!43702 (= call!43705 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!455915 (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427)))))

(declare-fun b!1034266 () Bool)

(declare-fun e!584654 () Bool)

(assert (=> b!1034266 (= e!584654 e!584653)))

(declare-fun c!104567 () Bool)

(assert (=> b!1034266 (= c!104567 e!584651)))

(declare-fun res!690837 () Bool)

(assert (=> b!1034266 (=> (not res!690837) (not e!584651))))

(assert (=> b!1034266 (= res!690837 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun b!1034267 () Bool)

(declare-fun e!584655 () ListLongMap!13829)

(assert (=> b!1034267 (= e!584655 e!584656)))

(declare-fun c!104566 () Bool)

(assert (=> b!1034267 (= c!104566 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1034268 () Bool)

(assert (=> b!1034268 (= e!584652 (= lt!456391 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!455915 (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427))))))

(declare-fun b!1034269 () Bool)

(assert (=> b!1034269 (= e!584655 (ListLongMap!13830 Nil!21936))))

(declare-fun b!1034270 () Bool)

(declare-fun res!690834 () Bool)

(assert (=> b!1034270 (=> (not res!690834) (not e!584654))))

(assert (=> b!1034270 (= res!690834 (not (contains!5992 lt!456391 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!124093 () Bool)

(assert (=> d!124093 e!584654))

(declare-fun res!690835 () Bool)

(assert (=> d!124093 (=> (not res!690835) (not e!584654))))

(assert (=> d!124093 (= res!690835 (not (contains!5992 lt!456391 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124093 (= lt!456391 e!584655)))

(declare-fun c!104568 () Bool)

(assert (=> d!124093 (= c!104568 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 thiss!1427))))))

(assert (=> d!124093 (validMask!0 (mask!30078 thiss!1427))))

(assert (=> d!124093 (= (getCurrentListMapNoExtraKeys!3565 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!455915 (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427)) lt!456391)))

(declare-fun b!1034259 () Bool)

(assert (=> b!1034259 (= e!584653 e!584650)))

(assert (=> b!1034259 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun res!690836 () Bool)

(assert (=> b!1034259 (= res!690836 (contains!5992 lt!456391 (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1034259 (=> (not res!690836) (not e!584650))))

(assert (= (and d!124093 c!104568) b!1034269))

(assert (= (and d!124093 (not c!104568)) b!1034267))

(assert (= (and b!1034267 c!104566) b!1034264))

(assert (= (and b!1034267 (not c!104566)) b!1034260))

(assert (= (or b!1034264 b!1034260) bm!43702))

(assert (= (and d!124093 res!690835) b!1034270))

(assert (= (and b!1034270 res!690834) b!1034266))

(assert (= (and b!1034266 res!690837) b!1034262))

(assert (= (and b!1034266 c!104567) b!1034259))

(assert (= (and b!1034266 (not c!104567)) b!1034263))

(assert (= (and b!1034259 res!690836) b!1034261))

(assert (= (and b!1034263 c!104565) b!1034268))

(assert (= (and b!1034263 (not c!104565)) b!1034265))

(declare-fun b_lambda!16061 () Bool)

(assert (=> (not b_lambda!16061) (not b!1034261)))

(assert (=> b!1034261 t!31125))

(declare-fun b_and!33269 () Bool)

(assert (= b_and!33267 (and (=> t!31125 result!14375) b_and!33269)))

(declare-fun b_lambda!16063 () Bool)

(assert (=> (not b_lambda!16063) (not b!1034264)))

(assert (=> b!1034264 t!31125))

(declare-fun b_and!33271 () Bool)

(assert (= b_and!33269 (and (=> t!31125 result!14375) b_and!33271)))

(declare-fun m!953943 () Bool)

(assert (=> b!1034268 m!953943))

(declare-fun m!953945 () Bool)

(assert (=> b!1034265 m!953945))

(declare-fun m!953947 () Bool)

(assert (=> d!124093 m!953947))

(assert (=> d!124093 m!952795))

(assert (=> b!1034267 m!953505))

(assert (=> b!1034267 m!953505))

(assert (=> b!1034267 m!953507))

(assert (=> b!1034259 m!953505))

(assert (=> b!1034259 m!953505))

(declare-fun m!953949 () Bool)

(assert (=> b!1034259 m!953949))

(assert (=> b!1034262 m!953505))

(assert (=> b!1034262 m!953505))

(assert (=> b!1034262 m!953507))

(assert (=> b!1034261 m!953505))

(declare-fun m!953951 () Bool)

(assert (=> b!1034261 m!953951))

(assert (=> b!1034261 m!953505))

(assert (=> b!1034261 m!952655))

(assert (=> b!1034261 m!953513))

(assert (=> b!1034261 m!953513))

(assert (=> b!1034261 m!952655))

(assert (=> b!1034261 m!953515))

(assert (=> bm!43702 m!953943))

(declare-fun m!953953 () Bool)

(assert (=> b!1034270 m!953953))

(declare-fun m!953955 () Bool)

(assert (=> b!1034264 m!953955))

(declare-fun m!953957 () Bool)

(assert (=> b!1034264 m!953957))

(assert (=> b!1034264 m!953505))

(assert (=> b!1034264 m!953955))

(declare-fun m!953959 () Bool)

(assert (=> b!1034264 m!953959))

(assert (=> b!1034264 m!952655))

(declare-fun m!953961 () Bool)

(assert (=> b!1034264 m!953961))

(assert (=> b!1034264 m!953513))

(assert (=> b!1034264 m!953513))

(assert (=> b!1034264 m!952655))

(assert (=> b!1034264 m!953515))

(assert (=> b!1033684 d!124093))

(declare-fun b!1034271 () Bool)

(declare-fun e!584657 () Option!641)

(assert (=> b!1034271 (= e!584657 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456101)))))))

(declare-fun b!1034274 () Bool)

(declare-fun e!584658 () Option!641)

(assert (=> b!1034274 (= e!584658 None!639)))

(declare-fun b!1034273 () Bool)

(assert (=> b!1034273 (= e!584658 (getValueByKey!590 (t!31126 (toList!6930 lt!456101)) (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))))))

(declare-fun d!124095 () Bool)

(declare-fun c!104569 () Bool)

(assert (=> d!124095 (= c!104569 (and ((_ is Cons!21935) (toList!6930 lt!456101)) (= (_1!7914 (h!23137 (toList!6930 lt!456101))) (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))))))))

(assert (=> d!124095 (= (getValueByKey!590 (toList!6930 lt!456101) (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))) e!584657)))

(declare-fun b!1034272 () Bool)

(assert (=> b!1034272 (= e!584657 e!584658)))

(declare-fun c!104570 () Bool)

(assert (=> b!1034272 (= c!104570 (and ((_ is Cons!21935) (toList!6930 lt!456101)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456101))) (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!124095 c!104569) b!1034271))

(assert (= (and d!124095 (not c!104569)) b!1034272))

(assert (= (and b!1034272 c!104570) b!1034273))

(assert (= (and b!1034272 (not c!104570)) b!1034274))

(declare-fun m!953963 () Bool)

(assert (=> b!1034273 m!953963))

(assert (=> b!1033673 d!124095))

(declare-fun b!1034275 () Bool)

(declare-fun e!584660 () Bool)

(assert (=> b!1034275 (= e!584660 (contains!5993 (ite c!104358 (Cons!21937 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) Nil!21938) Nil!21938) (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!124097 () Bool)

(declare-fun res!690840 () Bool)

(declare-fun e!584659 () Bool)

(assert (=> d!124097 (=> res!690840 e!584659)))

(assert (=> d!124097 (= res!690840 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 thiss!1427))))))

(assert (=> d!124097 (= (arrayNoDuplicates!0 (_keys!11402 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104358 (Cons!21937 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) Nil!21938) Nil!21938)) e!584659)))

(declare-fun call!43706 () Bool)

(declare-fun c!104571 () Bool)

(declare-fun bm!43703 () Bool)

(assert (=> bm!43703 (= call!43706 (arrayNoDuplicates!0 (_keys!11402 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!104571 (Cons!21937 (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!104358 (Cons!21937 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) Nil!21938) Nil!21938)) (ite c!104358 (Cons!21937 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) Nil!21938) Nil!21938))))))

(declare-fun b!1034276 () Bool)

(declare-fun e!584661 () Bool)

(assert (=> b!1034276 (= e!584661 call!43706)))

(declare-fun b!1034277 () Bool)

(assert (=> b!1034277 (= e!584661 call!43706)))

(declare-fun b!1034278 () Bool)

(declare-fun e!584662 () Bool)

(assert (=> b!1034278 (= e!584662 e!584661)))

(assert (=> b!1034278 (= c!104571 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1034279 () Bool)

(assert (=> b!1034279 (= e!584659 e!584662)))

(declare-fun res!690838 () Bool)

(assert (=> b!1034279 (=> (not res!690838) (not e!584662))))

(assert (=> b!1034279 (= res!690838 (not e!584660))))

(declare-fun res!690839 () Bool)

(assert (=> b!1034279 (=> (not res!690839) (not e!584660))))

(assert (=> b!1034279 (= res!690839 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!124097 (not res!690840)) b!1034279))

(assert (= (and b!1034279 res!690839) b!1034275))

(assert (= (and b!1034279 res!690838) b!1034278))

(assert (= (and b!1034278 c!104571) b!1034277))

(assert (= (and b!1034278 (not c!104571)) b!1034276))

(assert (= (or b!1034277 b!1034276) bm!43703))

(assert (=> b!1034275 m!953505))

(assert (=> b!1034275 m!953505))

(declare-fun m!953965 () Bool)

(assert (=> b!1034275 m!953965))

(assert (=> bm!43703 m!953505))

(declare-fun m!953967 () Bool)

(assert (=> bm!43703 m!953967))

(assert (=> b!1034278 m!953505))

(assert (=> b!1034278 m!953505))

(assert (=> b!1034278 m!953507))

(assert (=> b!1034279 m!953505))

(assert (=> b!1034279 m!953505))

(assert (=> b!1034279 m!953507))

(assert (=> bm!43649 d!124097))

(declare-fun d!124099 () Bool)

(declare-fun res!690841 () Bool)

(declare-fun e!584663 () Bool)

(assert (=> d!124099 (=> res!690841 e!584663)))

(assert (=> d!124099 (= res!690841 (and ((_ is Cons!21935) (toList!6930 lt!456029)) (= (_1!7914 (h!23137 (toList!6930 lt!456029))) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!124099 (= (containsKey!563 (toList!6930 lt!456029) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) e!584663)))

(declare-fun b!1034280 () Bool)

(declare-fun e!584664 () Bool)

(assert (=> b!1034280 (= e!584663 e!584664)))

(declare-fun res!690842 () Bool)

(assert (=> b!1034280 (=> (not res!690842) (not e!584664))))

(assert (=> b!1034280 (= res!690842 (and (or (not ((_ is Cons!21935) (toList!6930 lt!456029))) (bvsle (_1!7914 (h!23137 (toList!6930 lt!456029))) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))) ((_ is Cons!21935) (toList!6930 lt!456029)) (bvslt (_1!7914 (h!23137 (toList!6930 lt!456029))) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun b!1034281 () Bool)

(assert (=> b!1034281 (= e!584664 (containsKey!563 (t!31126 (toList!6930 lt!456029)) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124099 (not res!690841)) b!1034280))

(assert (= (and b!1034280 res!690842) b!1034281))

(assert (=> b!1034281 m!952763))

(declare-fun m!953969 () Bool)

(assert (=> b!1034281 m!953969))

(assert (=> d!123785 d!124099))

(assert (=> b!1033625 d!123727))

(declare-fun d!124101 () Bool)

(declare-fun e!584665 () Bool)

(assert (=> d!124101 e!584665))

(declare-fun res!690843 () Bool)

(assert (=> d!124101 (=> res!690843 e!584665)))

(declare-fun lt!456397 () Bool)

(assert (=> d!124101 (= res!690843 (not lt!456397))))

(declare-fun lt!456400 () Bool)

(assert (=> d!124101 (= lt!456397 lt!456400)))

(declare-fun lt!456399 () Unit!33713)

(declare-fun e!584666 () Unit!33713)

(assert (=> d!124101 (= lt!456399 e!584666)))

(declare-fun c!104572 () Bool)

(assert (=> d!124101 (= c!104572 lt!456400)))

(assert (=> d!124101 (= lt!456400 (containsKey!563 (toList!6930 lt!456120) (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))))))

(assert (=> d!124101 (= (contains!5992 lt!456120 (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))) lt!456397)))

(declare-fun b!1034282 () Bool)

(declare-fun lt!456398 () Unit!33713)

(assert (=> b!1034282 (= e!584666 lt!456398)))

(assert (=> b!1034282 (= lt!456398 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456120) (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))))))

(assert (=> b!1034282 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456120) (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034283 () Bool)

(declare-fun Unit!33751 () Unit!33713)

(assert (=> b!1034283 (= e!584666 Unit!33751)))

(declare-fun b!1034284 () Bool)

(assert (=> b!1034284 (= e!584665 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456120) (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124101 c!104572) b!1034282))

(assert (= (and d!124101 (not c!104572)) b!1034283))

(assert (= (and d!124101 (not res!690843)) b!1034284))

(declare-fun m!953971 () Bool)

(assert (=> d!124101 m!953971))

(declare-fun m!953973 () Bool)

(assert (=> b!1034282 m!953973))

(assert (=> b!1034282 m!953053))

(assert (=> b!1034282 m!953053))

(declare-fun m!953975 () Bool)

(assert (=> b!1034282 m!953975))

(assert (=> b!1034284 m!953053))

(assert (=> b!1034284 m!953053))

(assert (=> b!1034284 m!953975))

(assert (=> d!123735 d!124101))

(declare-fun b!1034285 () Bool)

(declare-fun e!584667 () Option!641)

(assert (=> b!1034285 (= e!584667 (Some!640 (_2!7914 (h!23137 lt!456122))))))

(declare-fun b!1034288 () Bool)

(declare-fun e!584668 () Option!641)

(assert (=> b!1034288 (= e!584668 None!639)))

(declare-fun b!1034287 () Bool)

(assert (=> b!1034287 (= e!584668 (getValueByKey!590 (t!31126 lt!456122) (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))))))

(declare-fun c!104573 () Bool)

(declare-fun d!124103 () Bool)

(assert (=> d!124103 (= c!104573 (and ((_ is Cons!21935) lt!456122) (= (_1!7914 (h!23137 lt!456122)) (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))))))))

(assert (=> d!124103 (= (getValueByKey!590 lt!456122 (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))) e!584667)))

(declare-fun b!1034286 () Bool)

(assert (=> b!1034286 (= e!584667 e!584668)))

(declare-fun c!104574 () Bool)

(assert (=> b!1034286 (= c!104574 (and ((_ is Cons!21935) lt!456122) (not (= (_1!7914 (h!23137 lt!456122)) (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!124103 c!104573) b!1034285))

(assert (= (and d!124103 (not c!104573)) b!1034286))

(assert (= (and b!1034286 c!104574) b!1034287))

(assert (= (and b!1034286 (not c!104574)) b!1034288))

(declare-fun m!953977 () Bool)

(assert (=> b!1034287 m!953977))

(assert (=> d!123735 d!124103))

(declare-fun d!124105 () Bool)

(assert (=> d!124105 (= (getValueByKey!590 lt!456122 (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456401 () Unit!33713)

(assert (=> d!124105 (= lt!456401 (choose!1707 lt!456122 (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))))))

(declare-fun e!584669 () Bool)

(assert (=> d!124105 e!584669))

(declare-fun res!690844 () Bool)

(assert (=> d!124105 (=> (not res!690844) (not e!584669))))

(assert (=> d!124105 (= res!690844 (isStrictlySorted!714 lt!456122))))

(assert (=> d!124105 (= (lemmaContainsTupThenGetReturnValue!280 lt!456122 (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))) lt!456401)))

(declare-fun b!1034289 () Bool)

(declare-fun res!690845 () Bool)

(assert (=> b!1034289 (=> (not res!690845) (not e!584669))))

(assert (=> b!1034289 (= res!690845 (containsKey!563 lt!456122 (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034290 () Bool)

(assert (=> b!1034290 (= e!584669 (contains!5994 lt!456122 (tuple2!15807 (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124105 res!690844) b!1034289))

(assert (= (and b!1034289 res!690845) b!1034290))

(assert (=> d!124105 m!953047))

(declare-fun m!953979 () Bool)

(assert (=> d!124105 m!953979))

(declare-fun m!953981 () Bool)

(assert (=> d!124105 m!953981))

(declare-fun m!953983 () Bool)

(assert (=> b!1034289 m!953983))

(declare-fun m!953985 () Bool)

(assert (=> b!1034290 m!953985))

(assert (=> d!123735 d!124105))

(declare-fun lt!456402 () List!21939)

(declare-fun b!1034291 () Bool)

(declare-fun e!584671 () Bool)

(assert (=> b!1034291 (= e!584671 (contains!5994 lt!456402 (tuple2!15807 (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))))))))

(declare-fun b!1034292 () Bool)

(declare-fun e!584673 () List!21939)

(declare-fun call!43707 () List!21939)

(assert (=> b!1034292 (= e!584673 call!43707)))

(declare-fun e!584670 () List!21939)

(declare-fun c!104578 () Bool)

(declare-fun b!1034293 () Bool)

(declare-fun c!104576 () Bool)

(assert (=> b!1034293 (= e!584670 (ite c!104578 (t!31126 (toList!6930 lt!456002)) (ite c!104576 (Cons!21935 (h!23137 (toList!6930 lt!456002)) (t!31126 (toList!6930 lt!456002))) Nil!21936)))))

(declare-fun b!1034294 () Bool)

(declare-fun res!690847 () Bool)

(assert (=> b!1034294 (=> (not res!690847) (not e!584671))))

(assert (=> b!1034294 (= res!690847 (containsKey!563 lt!456402 (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034295 () Bool)

(declare-fun e!584674 () List!21939)

(declare-fun call!43709 () List!21939)

(assert (=> b!1034295 (= e!584674 call!43709)))

(declare-fun bm!43704 () Bool)

(declare-fun call!43708 () List!21939)

(assert (=> bm!43704 (= call!43709 call!43708)))

(declare-fun b!1034296 () Bool)

(declare-fun e!584672 () List!21939)

(assert (=> b!1034296 (= e!584673 e!584672)))

(assert (=> b!1034296 (= c!104578 (and ((_ is Cons!21935) (toList!6930 lt!456002)) (= (_1!7914 (h!23137 (toList!6930 lt!456002))) (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))))))))

(declare-fun b!1034297 () Bool)

(assert (=> b!1034297 (= e!584674 call!43709)))

(declare-fun b!1034298 () Bool)

(assert (=> b!1034298 (= e!584672 call!43708)))

(declare-fun d!124107 () Bool)

(assert (=> d!124107 e!584671))

(declare-fun res!690846 () Bool)

(assert (=> d!124107 (=> (not res!690846) (not e!584671))))

(assert (=> d!124107 (= res!690846 (isStrictlySorted!714 lt!456402))))

(assert (=> d!124107 (= lt!456402 e!584673)))

(declare-fun c!104575 () Bool)

(assert (=> d!124107 (= c!104575 (and ((_ is Cons!21935) (toList!6930 lt!456002)) (bvslt (_1!7914 (h!23137 (toList!6930 lt!456002))) (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))))))))

(assert (=> d!124107 (isStrictlySorted!714 (toList!6930 lt!456002))))

(assert (=> d!124107 (= (insertStrictlySorted!373 (toList!6930 lt!456002) (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))) lt!456402)))

(declare-fun bm!43705 () Bool)

(assert (=> bm!43705 (= call!43708 call!43707)))

(declare-fun bm!43706 () Bool)

(assert (=> bm!43706 (= call!43707 ($colon$colon!604 e!584670 (ite c!104575 (h!23137 (toList!6930 lt!456002)) (tuple2!15807 (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))))))))

(declare-fun c!104577 () Bool)

(assert (=> bm!43706 (= c!104577 c!104575)))

(declare-fun b!1034299 () Bool)

(assert (=> b!1034299 (= e!584670 (insertStrictlySorted!373 (t!31126 (toList!6930 lt!456002)) (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034300 () Bool)

(assert (=> b!1034300 (= c!104576 (and ((_ is Cons!21935) (toList!6930 lt!456002)) (bvsgt (_1!7914 (h!23137 (toList!6930 lt!456002))) (_1!7914 (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))))))))

(assert (=> b!1034300 (= e!584672 e!584674)))

(assert (= (and d!124107 c!104575) b!1034292))

(assert (= (and d!124107 (not c!104575)) b!1034296))

(assert (= (and b!1034296 c!104578) b!1034298))

(assert (= (and b!1034296 (not c!104578)) b!1034300))

(assert (= (and b!1034300 c!104576) b!1034295))

(assert (= (and b!1034300 (not c!104576)) b!1034297))

(assert (= (or b!1034295 b!1034297) bm!43704))

(assert (= (or b!1034298 bm!43704) bm!43705))

(assert (= (or b!1034292 bm!43705) bm!43706))

(assert (= (and bm!43706 c!104577) b!1034299))

(assert (= (and bm!43706 (not c!104577)) b!1034293))

(assert (= (and d!124107 res!690846) b!1034294))

(assert (= (and b!1034294 res!690847) b!1034291))

(declare-fun m!953987 () Bool)

(assert (=> b!1034299 m!953987))

(declare-fun m!953989 () Bool)

(assert (=> d!124107 m!953989))

(declare-fun m!953991 () Bool)

(assert (=> d!124107 m!953991))

(declare-fun m!953993 () Bool)

(assert (=> b!1034291 m!953993))

(declare-fun m!953995 () Bool)

(assert (=> b!1034294 m!953995))

(declare-fun m!953997 () Bool)

(assert (=> bm!43706 m!953997))

(assert (=> d!123735 d!124107))

(declare-fun d!124109 () Bool)

(assert (=> d!124109 (arrayContainsKey!0 (_keys!11402 thiss!1427) lt!456059 #b00000000000000000000000000000000)))

(declare-fun lt!456403 () Unit!33713)

(assert (=> d!124109 (= lt!456403 (choose!13 (_keys!11402 thiss!1427) lt!456059 #b00000000000000000000000000000000))))

(assert (=> d!124109 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!124109 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11402 thiss!1427) lt!456059 #b00000000000000000000000000000000) lt!456403)))

(declare-fun bs!30229 () Bool)

(assert (= bs!30229 d!124109))

(assert (=> bs!30229 m!952887))

(declare-fun m!953999 () Bool)

(assert (=> bs!30229 m!953999))

(assert (=> b!1033637 d!124109))

(declare-fun d!124111 () Bool)

(declare-fun res!690848 () Bool)

(declare-fun e!584675 () Bool)

(assert (=> d!124111 (=> res!690848 e!584675)))

(assert (=> d!124111 (= res!690848 (= (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) lt!456059))))

(assert (=> d!124111 (= (arrayContainsKey!0 (_keys!11402 thiss!1427) lt!456059 #b00000000000000000000000000000000) e!584675)))

(declare-fun b!1034301 () Bool)

(declare-fun e!584676 () Bool)

(assert (=> b!1034301 (= e!584675 e!584676)))

(declare-fun res!690849 () Bool)

(assert (=> b!1034301 (=> (not res!690849) (not e!584676))))

(assert (=> b!1034301 (= res!690849 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun b!1034302 () Bool)

(assert (=> b!1034302 (= e!584676 (arrayContainsKey!0 (_keys!11402 thiss!1427) lt!456059 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!124111 (not res!690848)) b!1034301))

(assert (= (and b!1034301 res!690849) b!1034302))

(assert (=> d!124111 m!952763))

(declare-fun m!954001 () Bool)

(assert (=> b!1034302 m!954001))

(assert (=> b!1033637 d!124111))

(declare-fun d!124113 () Bool)

(declare-fun lt!456405 () SeekEntryResult!9729)

(assert (=> d!124113 (and (or ((_ is Undefined!9729) lt!456405) (not ((_ is Found!9729) lt!456405)) (and (bvsge (index!41288 lt!456405) #b00000000000000000000000000000000) (bvslt (index!41288 lt!456405) (size!31844 (_keys!11402 thiss!1427))))) (or ((_ is Undefined!9729) lt!456405) ((_ is Found!9729) lt!456405) (not ((_ is MissingZero!9729) lt!456405)) (and (bvsge (index!41287 lt!456405) #b00000000000000000000000000000000) (bvslt (index!41287 lt!456405) (size!31844 (_keys!11402 thiss!1427))))) (or ((_ is Undefined!9729) lt!456405) ((_ is Found!9729) lt!456405) ((_ is MissingZero!9729) lt!456405) (not ((_ is MissingVacant!9729) lt!456405)) (and (bvsge (index!41290 lt!456405) #b00000000000000000000000000000000) (bvslt (index!41290 lt!456405) (size!31844 (_keys!11402 thiss!1427))))) (or ((_ is Undefined!9729) lt!456405) (ite ((_ is Found!9729) lt!456405) (= (select (arr!31320 (_keys!11402 thiss!1427)) (index!41288 lt!456405)) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9729) lt!456405) (= (select (arr!31320 (_keys!11402 thiss!1427)) (index!41287 lt!456405)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9729) lt!456405) (= (select (arr!31320 (_keys!11402 thiss!1427)) (index!41290 lt!456405)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!584679 () SeekEntryResult!9729)

(assert (=> d!124113 (= lt!456405 e!584679)))

(declare-fun c!104579 () Bool)

(declare-fun lt!456406 () SeekEntryResult!9729)

(assert (=> d!124113 (= c!104579 (and ((_ is Intermediate!9729) lt!456406) (undefined!10541 lt!456406)))))

(assert (=> d!124113 (= lt!456406 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (mask!30078 thiss!1427)) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (_keys!11402 thiss!1427) (mask!30078 thiss!1427)))))

(assert (=> d!124113 (validMask!0 (mask!30078 thiss!1427))))

(assert (=> d!124113 (= (seekEntryOrOpen!0 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (_keys!11402 thiss!1427) (mask!30078 thiss!1427)) lt!456405)))

(declare-fun b!1034303 () Bool)

(declare-fun e!584677 () SeekEntryResult!9729)

(assert (=> b!1034303 (= e!584679 e!584677)))

(declare-fun lt!456404 () (_ BitVec 64))

(assert (=> b!1034303 (= lt!456404 (select (arr!31320 (_keys!11402 thiss!1427)) (index!41289 lt!456406)))))

(declare-fun c!104581 () Bool)

(assert (=> b!1034303 (= c!104581 (= lt!456404 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034304 () Bool)

(assert (=> b!1034304 (= e!584677 (Found!9729 (index!41289 lt!456406)))))

(declare-fun b!1034305 () Bool)

(declare-fun e!584678 () SeekEntryResult!9729)

(assert (=> b!1034305 (= e!584678 (MissingZero!9729 (index!41289 lt!456406)))))

(declare-fun b!1034306 () Bool)

(assert (=> b!1034306 (= e!584679 Undefined!9729)))

(declare-fun b!1034307 () Bool)

(declare-fun c!104580 () Bool)

(assert (=> b!1034307 (= c!104580 (= lt!456404 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1034307 (= e!584677 e!584678)))

(declare-fun b!1034308 () Bool)

(assert (=> b!1034308 (= e!584678 (seekKeyOrZeroReturnVacant!0 (x!92213 lt!456406) (index!41289 lt!456406) (index!41289 lt!456406) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (_keys!11402 thiss!1427) (mask!30078 thiss!1427)))))

(assert (= (and d!124113 c!104579) b!1034306))

(assert (= (and d!124113 (not c!104579)) b!1034303))

(assert (= (and b!1034303 c!104581) b!1034304))

(assert (= (and b!1034303 (not c!104581)) b!1034307))

(assert (= (and b!1034307 c!104580) b!1034305))

(assert (= (and b!1034307 (not c!104580)) b!1034308))

(declare-fun m!954003 () Bool)

(assert (=> d!124113 m!954003))

(assert (=> d!124113 m!952763))

(declare-fun m!954005 () Bool)

(assert (=> d!124113 m!954005))

(declare-fun m!954007 () Bool)

(assert (=> d!124113 m!954007))

(assert (=> d!124113 m!952795))

(declare-fun m!954009 () Bool)

(assert (=> d!124113 m!954009))

(declare-fun m!954011 () Bool)

(assert (=> d!124113 m!954011))

(assert (=> d!124113 m!952763))

(assert (=> d!124113 m!954003))

(declare-fun m!954013 () Bool)

(assert (=> b!1034303 m!954013))

(assert (=> b!1034308 m!952763))

(declare-fun m!954015 () Bool)

(assert (=> b!1034308 m!954015))

(assert (=> b!1033637 d!124113))

(assert (=> d!123791 d!123935))

(declare-fun d!124115 () Bool)

(declare-fun e!584680 () Bool)

(assert (=> d!124115 e!584680))

(declare-fun res!690850 () Bool)

(assert (=> d!124115 (=> res!690850 e!584680)))

(declare-fun lt!456407 () Bool)

(assert (=> d!124115 (= res!690850 (not lt!456407))))

(declare-fun lt!456410 () Bool)

(assert (=> d!124115 (= lt!456407 lt!456410)))

(declare-fun lt!456409 () Unit!33713)

(declare-fun e!584681 () Unit!33713)

(assert (=> d!124115 (= lt!456409 e!584681)))

(declare-fun c!104582 () Bool)

(assert (=> d!124115 (= c!104582 lt!456410)))

(assert (=> d!124115 (= lt!456410 (containsKey!563 (toList!6930 lt!456179) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> d!124115 (= (contains!5992 lt!456179 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!456407)))

(declare-fun b!1034309 () Bool)

(declare-fun lt!456408 () Unit!33713)

(assert (=> b!1034309 (= e!584681 lt!456408)))

(assert (=> b!1034309 (= lt!456408 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456179) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> b!1034309 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456179) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034310 () Bool)

(declare-fun Unit!33752 () Unit!33713)

(assert (=> b!1034310 (= e!584681 Unit!33752)))

(declare-fun b!1034311 () Bool)

(assert (=> b!1034311 (= e!584680 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456179) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124115 c!104582) b!1034309))

(assert (= (and d!124115 (not c!104582)) b!1034310))

(assert (= (and d!124115 (not res!690850)) b!1034311))

(declare-fun m!954017 () Bool)

(assert (=> d!124115 m!954017))

(declare-fun m!954019 () Bool)

(assert (=> b!1034309 m!954019))

(assert (=> b!1034309 m!953233))

(assert (=> b!1034309 m!953233))

(declare-fun m!954021 () Bool)

(assert (=> b!1034309 m!954021))

(assert (=> b!1034311 m!953233))

(assert (=> b!1034311 m!953233))

(assert (=> b!1034311 m!954021))

(assert (=> d!123787 d!124115))

(declare-fun b!1034312 () Bool)

(declare-fun e!584682 () Option!641)

(assert (=> b!1034312 (= e!584682 (Some!640 (_2!7914 (h!23137 lt!456181))))))

(declare-fun b!1034315 () Bool)

(declare-fun e!584683 () Option!641)

(assert (=> b!1034315 (= e!584683 None!639)))

(declare-fun b!1034314 () Bool)

(assert (=> b!1034314 (= e!584683 (getValueByKey!590 (t!31126 lt!456181) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun d!124117 () Bool)

(declare-fun c!104583 () Bool)

(assert (=> d!124117 (= c!104583 (and ((_ is Cons!21935) lt!456181) (= (_1!7914 (h!23137 lt!456181)) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124117 (= (getValueByKey!590 lt!456181 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) e!584682)))

(declare-fun b!1034313 () Bool)

(assert (=> b!1034313 (= e!584682 e!584683)))

(declare-fun c!104584 () Bool)

(assert (=> b!1034313 (= c!104584 (and ((_ is Cons!21935) lt!456181) (not (= (_1!7914 (h!23137 lt!456181)) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!124117 c!104583) b!1034312))

(assert (= (and d!124117 (not c!104583)) b!1034313))

(assert (= (and b!1034313 c!104584) b!1034314))

(assert (= (and b!1034313 (not c!104584)) b!1034315))

(declare-fun m!954023 () Bool)

(assert (=> b!1034314 m!954023))

(assert (=> d!123787 d!124117))

(declare-fun d!124119 () Bool)

(assert (=> d!124119 (= (getValueByKey!590 lt!456181 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456411 () Unit!33713)

(assert (=> d!124119 (= lt!456411 (choose!1707 lt!456181 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun e!584684 () Bool)

(assert (=> d!124119 e!584684))

(declare-fun res!690851 () Bool)

(assert (=> d!124119 (=> (not res!690851) (not e!584684))))

(assert (=> d!124119 (= res!690851 (isStrictlySorted!714 lt!456181))))

(assert (=> d!124119 (= (lemmaContainsTupThenGetReturnValue!280 lt!456181 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!456411)))

(declare-fun b!1034316 () Bool)

(declare-fun res!690852 () Bool)

(assert (=> b!1034316 (=> (not res!690852) (not e!584684))))

(assert (=> b!1034316 (= res!690852 (containsKey!563 lt!456181 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034317 () Bool)

(assert (=> b!1034317 (= e!584684 (contains!5994 lt!456181 (tuple2!15807 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124119 res!690851) b!1034316))

(assert (= (and b!1034316 res!690852) b!1034317))

(assert (=> d!124119 m!953227))

(declare-fun m!954025 () Bool)

(assert (=> d!124119 m!954025))

(declare-fun m!954027 () Bool)

(assert (=> d!124119 m!954027))

(declare-fun m!954029 () Bool)

(assert (=> b!1034316 m!954029))

(declare-fun m!954031 () Bool)

(assert (=> b!1034317 m!954031))

(assert (=> d!123787 d!124119))

(declare-fun b!1034318 () Bool)

(declare-fun e!584686 () Bool)

(declare-fun lt!456412 () List!21939)

(assert (=> b!1034318 (= e!584686 (contains!5994 lt!456412 (tuple2!15807 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1034319 () Bool)

(declare-fun e!584688 () List!21939)

(declare-fun call!43710 () List!21939)

(assert (=> b!1034319 (= e!584688 call!43710)))

(declare-fun c!104588 () Bool)

(declare-fun e!584685 () List!21939)

(declare-fun c!104586 () Bool)

(declare-fun b!1034320 () Bool)

(assert (=> b!1034320 (= e!584685 (ite c!104588 (t!31126 (toList!6930 call!43645)) (ite c!104586 (Cons!21935 (h!23137 (toList!6930 call!43645)) (t!31126 (toList!6930 call!43645))) Nil!21936)))))

(declare-fun b!1034321 () Bool)

(declare-fun res!690854 () Bool)

(assert (=> b!1034321 (=> (not res!690854) (not e!584686))))

(assert (=> b!1034321 (= res!690854 (containsKey!563 lt!456412 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034322 () Bool)

(declare-fun e!584689 () List!21939)

(declare-fun call!43712 () List!21939)

(assert (=> b!1034322 (= e!584689 call!43712)))

(declare-fun bm!43707 () Bool)

(declare-fun call!43711 () List!21939)

(assert (=> bm!43707 (= call!43712 call!43711)))

(declare-fun b!1034323 () Bool)

(declare-fun e!584687 () List!21939)

(assert (=> b!1034323 (= e!584688 e!584687)))

(assert (=> b!1034323 (= c!104588 (and ((_ is Cons!21935) (toList!6930 call!43645)) (= (_1!7914 (h!23137 (toList!6930 call!43645))) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1034324 () Bool)

(assert (=> b!1034324 (= e!584689 call!43712)))

(declare-fun b!1034325 () Bool)

(assert (=> b!1034325 (= e!584687 call!43711)))

(declare-fun d!124121 () Bool)

(assert (=> d!124121 e!584686))

(declare-fun res!690853 () Bool)

(assert (=> d!124121 (=> (not res!690853) (not e!584686))))

(assert (=> d!124121 (= res!690853 (isStrictlySorted!714 lt!456412))))

(assert (=> d!124121 (= lt!456412 e!584688)))

(declare-fun c!104585 () Bool)

(assert (=> d!124121 (= c!104585 (and ((_ is Cons!21935) (toList!6930 call!43645)) (bvslt (_1!7914 (h!23137 (toList!6930 call!43645))) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124121 (isStrictlySorted!714 (toList!6930 call!43645))))

(assert (=> d!124121 (= (insertStrictlySorted!373 (toList!6930 call!43645) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!456412)))

(declare-fun bm!43708 () Bool)

(assert (=> bm!43708 (= call!43711 call!43710)))

(declare-fun bm!43709 () Bool)

(assert (=> bm!43709 (= call!43710 ($colon$colon!604 e!584685 (ite c!104585 (h!23137 (toList!6930 call!43645)) (tuple2!15807 (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun c!104587 () Bool)

(assert (=> bm!43709 (= c!104587 c!104585)))

(declare-fun b!1034326 () Bool)

(assert (=> b!1034326 (= e!584685 (insertStrictlySorted!373 (t!31126 (toList!6930 call!43645)) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034327 () Bool)

(assert (=> b!1034327 (= c!104586 (and ((_ is Cons!21935) (toList!6930 call!43645)) (bvsgt (_1!7914 (h!23137 (toList!6930 call!43645))) (_1!7914 (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> b!1034327 (= e!584687 e!584689)))

(assert (= (and d!124121 c!104585) b!1034319))

(assert (= (and d!124121 (not c!104585)) b!1034323))

(assert (= (and b!1034323 c!104588) b!1034325))

(assert (= (and b!1034323 (not c!104588)) b!1034327))

(assert (= (and b!1034327 c!104586) b!1034322))

(assert (= (and b!1034327 (not c!104586)) b!1034324))

(assert (= (or b!1034322 b!1034324) bm!43707))

(assert (= (or b!1034325 bm!43707) bm!43708))

(assert (= (or b!1034319 bm!43708) bm!43709))

(assert (= (and bm!43709 c!104587) b!1034326))

(assert (= (and bm!43709 (not c!104587)) b!1034320))

(assert (= (and d!124121 res!690853) b!1034321))

(assert (= (and b!1034321 res!690854) b!1034318))

(declare-fun m!954033 () Bool)

(assert (=> b!1034326 m!954033))

(declare-fun m!954035 () Bool)

(assert (=> d!124121 m!954035))

(declare-fun m!954037 () Bool)

(assert (=> d!124121 m!954037))

(declare-fun m!954039 () Bool)

(assert (=> b!1034318 m!954039))

(declare-fun m!954041 () Bool)

(assert (=> b!1034321 m!954041))

(declare-fun m!954043 () Bool)

(assert (=> bm!43709 m!954043))

(assert (=> d!123787 d!124121))

(assert (=> b!1033709 d!123727))

(declare-fun d!124123 () Bool)

(declare-fun isEmpty!933 (List!21939) Bool)

(assert (=> d!124123 (= (isEmpty!931 lt!456105) (isEmpty!933 (toList!6930 lt!456105)))))

(declare-fun bs!30230 () Bool)

(assert (= bs!30230 d!124123))

(declare-fun m!954045 () Bool)

(assert (=> bs!30230 m!954045))

(assert (=> b!1033681 d!124123))

(assert (=> b!1033655 d!123925))

(assert (=> b!1033655 d!123927))

(declare-fun d!124125 () Bool)

(assert (=> d!124125 (= (get!16429 (getValueByKey!590 (toList!6930 (+!3130 lt!455996 (tuple2!15807 lt!455991 lt!455915))) lt!455994)) (v!14888 (getValueByKey!590 (toList!6930 (+!3130 lt!455996 (tuple2!15807 lt!455991 lt!455915))) lt!455994)))))

(assert (=> d!123743 d!124125))

(declare-fun e!584690 () Option!641)

(declare-fun b!1034328 () Bool)

(assert (=> b!1034328 (= e!584690 (Some!640 (_2!7914 (h!23137 (toList!6930 (+!3130 lt!455996 (tuple2!15807 lt!455991 lt!455915)))))))))

(declare-fun b!1034331 () Bool)

(declare-fun e!584691 () Option!641)

(assert (=> b!1034331 (= e!584691 None!639)))

(declare-fun b!1034330 () Bool)

(assert (=> b!1034330 (= e!584691 (getValueByKey!590 (t!31126 (toList!6930 (+!3130 lt!455996 (tuple2!15807 lt!455991 lt!455915)))) lt!455994))))

(declare-fun c!104589 () Bool)

(declare-fun d!124127 () Bool)

(assert (=> d!124127 (= c!104589 (and ((_ is Cons!21935) (toList!6930 (+!3130 lt!455996 (tuple2!15807 lt!455991 lt!455915)))) (= (_1!7914 (h!23137 (toList!6930 (+!3130 lt!455996 (tuple2!15807 lt!455991 lt!455915))))) lt!455994)))))

(assert (=> d!124127 (= (getValueByKey!590 (toList!6930 (+!3130 lt!455996 (tuple2!15807 lt!455991 lt!455915))) lt!455994) e!584690)))

(declare-fun b!1034329 () Bool)

(assert (=> b!1034329 (= e!584690 e!584691)))

(declare-fun c!104590 () Bool)

(assert (=> b!1034329 (= c!104590 (and ((_ is Cons!21935) (toList!6930 (+!3130 lt!455996 (tuple2!15807 lt!455991 lt!455915)))) (not (= (_1!7914 (h!23137 (toList!6930 (+!3130 lt!455996 (tuple2!15807 lt!455991 lt!455915))))) lt!455994))))))

(assert (= (and d!124127 c!104589) b!1034328))

(assert (= (and d!124127 (not c!104589)) b!1034329))

(assert (= (and b!1034329 c!104590) b!1034330))

(assert (= (and b!1034329 (not c!104590)) b!1034331))

(declare-fun m!954047 () Bool)

(assert (=> b!1034330 m!954047))

(assert (=> d!123743 d!124127))

(declare-fun d!124129 () Bool)

(assert (=> d!124129 (= (apply!899 lt!456206 lt!456197) (get!16429 (getValueByKey!590 (toList!6930 lt!456206) lt!456197)))))

(declare-fun bs!30231 () Bool)

(assert (= bs!30231 d!124129))

(declare-fun m!954049 () Bool)

(assert (=> bs!30231 m!954049))

(assert (=> bs!30231 m!954049))

(declare-fun m!954051 () Bool)

(assert (=> bs!30231 m!954051))

(assert (=> b!1033782 d!124129))

(declare-fun d!124131 () Bool)

(assert (=> d!124131 (= (apply!899 (+!3130 lt!456200 (tuple2!15807 lt!456195 (zeroValue!6062 lt!455914))) lt!456198) (apply!899 lt!456200 lt!456198))))

(declare-fun lt!456413 () Unit!33713)

(assert (=> d!124131 (= lt!456413 (choose!1705 lt!456200 lt!456195 (zeroValue!6062 lt!455914) lt!456198))))

(declare-fun e!584692 () Bool)

(assert (=> d!124131 e!584692))

(declare-fun res!690855 () Bool)

(assert (=> d!124131 (=> (not res!690855) (not e!584692))))

(assert (=> d!124131 (= res!690855 (contains!5992 lt!456200 lt!456198))))

(assert (=> d!124131 (= (addApplyDifferent!474 lt!456200 lt!456195 (zeroValue!6062 lt!455914) lt!456198) lt!456413)))

(declare-fun b!1034332 () Bool)

(assert (=> b!1034332 (= e!584692 (not (= lt!456198 lt!456195)))))

(assert (= (and d!124131 res!690855) b!1034332))

(declare-fun m!954053 () Bool)

(assert (=> d!124131 m!954053))

(declare-fun m!954055 () Bool)

(assert (=> d!124131 m!954055))

(assert (=> d!124131 m!953263))

(assert (=> d!124131 m!953265))

(assert (=> d!124131 m!953263))

(assert (=> d!124131 m!953271))

(assert (=> b!1033782 d!124131))

(declare-fun d!124133 () Bool)

(assert (=> d!124133 (= (apply!899 (+!3130 lt!456200 (tuple2!15807 lt!456195 (zeroValue!6062 lt!455914))) lt!456198) (get!16429 (getValueByKey!590 (toList!6930 (+!3130 lt!456200 (tuple2!15807 lt!456195 (zeroValue!6062 lt!455914)))) lt!456198)))))

(declare-fun bs!30232 () Bool)

(assert (= bs!30232 d!124133))

(declare-fun m!954057 () Bool)

(assert (=> bs!30232 m!954057))

(assert (=> bs!30232 m!954057))

(declare-fun m!954059 () Bool)

(assert (=> bs!30232 m!954059))

(assert (=> b!1033782 d!124133))

(declare-fun b!1034334 () Bool)

(declare-fun e!584699 () ListLongMap!13829)

(declare-fun call!43713 () ListLongMap!13829)

(assert (=> b!1034334 (= e!584699 call!43713)))

(declare-fun b!1034335 () Bool)

(assert (=> b!1034335 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 lt!455914))))))

(assert (=> b!1034335 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31845 (_values!6249 lt!455914))))))

(declare-fun e!584693 () Bool)

(declare-fun lt!456415 () ListLongMap!13829)

(assert (=> b!1034335 (= e!584693 (= (apply!899 lt!456415 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)) (get!16428 (select (arr!31321 (_values!6249 lt!455914)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 lt!455914) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1034336 () Bool)

(declare-fun e!584694 () Bool)

(assert (=> b!1034336 (= e!584694 (validKeyInArray!0 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)))))

(assert (=> b!1034336 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1034337 () Bool)

(declare-fun e!584696 () Bool)

(declare-fun e!584695 () Bool)

(assert (=> b!1034337 (= e!584696 e!584695)))

(declare-fun c!104591 () Bool)

(assert (=> b!1034337 (= c!104591 (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 lt!455914))))))

(declare-fun b!1034338 () Bool)

(declare-fun lt!456420 () Unit!33713)

(declare-fun lt!456417 () Unit!33713)

(assert (=> b!1034338 (= lt!456420 lt!456417)))

(declare-fun lt!456416 () (_ BitVec 64))

(declare-fun lt!456414 () (_ BitVec 64))

(declare-fun lt!456419 () V!37563)

(declare-fun lt!456418 () ListLongMap!13829)

(assert (=> b!1034338 (not (contains!5992 (+!3130 lt!456418 (tuple2!15807 lt!456416 lt!456419)) lt!456414))))

(assert (=> b!1034338 (= lt!456417 (addStillNotContains!243 lt!456418 lt!456416 lt!456419 lt!456414))))

(assert (=> b!1034338 (= lt!456414 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1034338 (= lt!456419 (get!16428 (select (arr!31321 (_values!6249 lt!455914)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 lt!455914) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1034338 (= lt!456416 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000))))

(assert (=> b!1034338 (= lt!456418 call!43713)))

(assert (=> b!1034338 (= e!584699 (+!3130 call!43713 (tuple2!15807 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 lt!455914)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 lt!455914) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1034339 () Bool)

(assert (=> b!1034339 (= e!584695 (isEmpty!931 lt!456415))))

(declare-fun bm!43710 () Bool)

(assert (=> bm!43710 (= call!43713 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 lt!455914) (_values!6249 lt!455914) (mask!30078 lt!455914) (extraKeys!5958 lt!455914) (zeroValue!6062 lt!455914) (minValue!6062 lt!455914) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6226 lt!455914)))))

(declare-fun b!1034340 () Bool)

(declare-fun e!584697 () Bool)

(assert (=> b!1034340 (= e!584697 e!584696)))

(declare-fun c!104593 () Bool)

(assert (=> b!1034340 (= c!104593 e!584694)))

(declare-fun res!690859 () Bool)

(assert (=> b!1034340 (=> (not res!690859) (not e!584694))))

(assert (=> b!1034340 (= res!690859 (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 lt!455914))))))

(declare-fun b!1034341 () Bool)

(declare-fun e!584698 () ListLongMap!13829)

(assert (=> b!1034341 (= e!584698 e!584699)))

(declare-fun c!104592 () Bool)

(assert (=> b!1034341 (= c!104592 (validKeyInArray!0 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)))))

(declare-fun b!1034342 () Bool)

(assert (=> b!1034342 (= e!584695 (= lt!456415 (getCurrentListMapNoExtraKeys!3565 (_keys!11402 lt!455914) (_values!6249 lt!455914) (mask!30078 lt!455914) (extraKeys!5958 lt!455914) (zeroValue!6062 lt!455914) (minValue!6062 lt!455914) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6226 lt!455914))))))

(declare-fun b!1034343 () Bool)

(assert (=> b!1034343 (= e!584698 (ListLongMap!13830 Nil!21936))))

(declare-fun b!1034344 () Bool)

(declare-fun res!690856 () Bool)

(assert (=> b!1034344 (=> (not res!690856) (not e!584697))))

(assert (=> b!1034344 (= res!690856 (not (contains!5992 lt!456415 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!124135 () Bool)

(assert (=> d!124135 e!584697))

(declare-fun res!690857 () Bool)

(assert (=> d!124135 (=> (not res!690857) (not e!584697))))

(assert (=> d!124135 (= res!690857 (not (contains!5992 lt!456415 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124135 (= lt!456415 e!584698)))

(declare-fun c!104594 () Bool)

(assert (=> d!124135 (= c!104594 (bvsge #b00000000000000000000000000000000 (size!31844 (_keys!11402 lt!455914))))))

(assert (=> d!124135 (validMask!0 (mask!30078 lt!455914))))

(assert (=> d!124135 (= (getCurrentListMapNoExtraKeys!3565 (_keys!11402 lt!455914) (_values!6249 lt!455914) (mask!30078 lt!455914) (extraKeys!5958 lt!455914) (zeroValue!6062 lt!455914) (minValue!6062 lt!455914) #b00000000000000000000000000000000 (defaultEntry!6226 lt!455914)) lt!456415)))

(declare-fun b!1034333 () Bool)

(assert (=> b!1034333 (= e!584696 e!584693)))

(assert (=> b!1034333 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31844 (_keys!11402 lt!455914))))))

(declare-fun res!690858 () Bool)

(assert (=> b!1034333 (= res!690858 (contains!5992 lt!456415 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)))))

(assert (=> b!1034333 (=> (not res!690858) (not e!584693))))

(assert (= (and d!124135 c!104594) b!1034343))

(assert (= (and d!124135 (not c!104594)) b!1034341))

(assert (= (and b!1034341 c!104592) b!1034338))

(assert (= (and b!1034341 (not c!104592)) b!1034334))

(assert (= (or b!1034338 b!1034334) bm!43710))

(assert (= (and d!124135 res!690857) b!1034344))

(assert (= (and b!1034344 res!690856) b!1034340))

(assert (= (and b!1034340 res!690859) b!1034336))

(assert (= (and b!1034340 c!104593) b!1034333))

(assert (= (and b!1034340 (not c!104593)) b!1034337))

(assert (= (and b!1034333 res!690858) b!1034335))

(assert (= (and b!1034337 c!104591) b!1034342))

(assert (= (and b!1034337 (not c!104591)) b!1034339))

(declare-fun b_lambda!16065 () Bool)

(assert (=> (not b_lambda!16065) (not b!1034335)))

(assert (=> b!1034335 t!31134))

(declare-fun b_and!33273 () Bool)

(assert (= b_and!33271 (and (=> t!31134 result!14389) b_and!33273)))

(declare-fun b_lambda!16067 () Bool)

(assert (=> (not b_lambda!16067) (not b!1034338)))

(assert (=> b!1034338 t!31134))

(declare-fun b_and!33275 () Bool)

(assert (= b_and!33273 (and (=> t!31134 result!14389) b_and!33275)))

(declare-fun m!954061 () Bool)

(assert (=> b!1034342 m!954061))

(declare-fun m!954063 () Bool)

(assert (=> b!1034339 m!954063))

(declare-fun m!954065 () Bool)

(assert (=> d!124135 m!954065))

(assert (=> d!124135 m!953019))

(assert (=> b!1034341 m!953267))

(assert (=> b!1034341 m!953267))

(assert (=> b!1034341 m!953281))

(assert (=> b!1034333 m!953267))

(assert (=> b!1034333 m!953267))

(declare-fun m!954067 () Bool)

(assert (=> b!1034333 m!954067))

(assert (=> b!1034336 m!953267))

(assert (=> b!1034336 m!953267))

(assert (=> b!1034336 m!953281))

(assert (=> b!1034335 m!953267))

(declare-fun m!954069 () Bool)

(assert (=> b!1034335 m!954069))

(assert (=> b!1034335 m!953267))

(assert (=> b!1034335 m!953285))

(assert (=> b!1034335 m!953283))

(assert (=> b!1034335 m!953283))

(assert (=> b!1034335 m!953285))

(assert (=> b!1034335 m!953287))

(assert (=> bm!43710 m!954061))

(declare-fun m!954071 () Bool)

(assert (=> b!1034344 m!954071))

(declare-fun m!954073 () Bool)

(assert (=> b!1034338 m!954073))

(declare-fun m!954075 () Bool)

(assert (=> b!1034338 m!954075))

(assert (=> b!1034338 m!953267))

(assert (=> b!1034338 m!954073))

(declare-fun m!954077 () Bool)

(assert (=> b!1034338 m!954077))

(assert (=> b!1034338 m!953285))

(declare-fun m!954079 () Bool)

(assert (=> b!1034338 m!954079))

(assert (=> b!1034338 m!953283))

(assert (=> b!1034338 m!953283))

(assert (=> b!1034338 m!953285))

(assert (=> b!1034338 m!953287))

(assert (=> b!1033782 d!124135))

(declare-fun d!124137 () Bool)

(assert (=> d!124137 (= (apply!899 (+!3130 lt!456206 (tuple2!15807 lt!456205 (minValue!6062 lt!455914))) lt!456197) (apply!899 lt!456206 lt!456197))))

(declare-fun lt!456421 () Unit!33713)

(assert (=> d!124137 (= lt!456421 (choose!1705 lt!456206 lt!456205 (minValue!6062 lt!455914) lt!456197))))

(declare-fun e!584700 () Bool)

(assert (=> d!124137 e!584700))

(declare-fun res!690860 () Bool)

(assert (=> d!124137 (=> (not res!690860) (not e!584700))))

(assert (=> d!124137 (= res!690860 (contains!5992 lt!456206 lt!456197))))

(assert (=> d!124137 (= (addApplyDifferent!474 lt!456206 lt!456205 (minValue!6062 lt!455914) lt!456197) lt!456421)))

(declare-fun b!1034345 () Bool)

(assert (=> b!1034345 (= e!584700 (not (= lt!456197 lt!456205)))))

(assert (= (and d!124137 res!690860) b!1034345))

(declare-fun m!954081 () Bool)

(assert (=> d!124137 m!954081))

(declare-fun m!954083 () Bool)

(assert (=> d!124137 m!954083))

(assert (=> d!124137 m!953243))

(assert (=> d!124137 m!953249))

(assert (=> d!124137 m!953243))

(assert (=> d!124137 m!953273))

(assert (=> b!1033782 d!124137))

(declare-fun d!124139 () Bool)

(declare-fun e!584701 () Bool)

(assert (=> d!124139 e!584701))

(declare-fun res!690862 () Bool)

(assert (=> d!124139 (=> (not res!690862) (not e!584701))))

(declare-fun lt!456423 () ListLongMap!13829)

(assert (=> d!124139 (= res!690862 (contains!5992 lt!456423 (_1!7914 (tuple2!15807 lt!456193 (minValue!6062 lt!455914)))))))

(declare-fun lt!456425 () List!21939)

(assert (=> d!124139 (= lt!456423 (ListLongMap!13830 lt!456425))))

(declare-fun lt!456422 () Unit!33713)

(declare-fun lt!456424 () Unit!33713)

(assert (=> d!124139 (= lt!456422 lt!456424)))

(assert (=> d!124139 (= (getValueByKey!590 lt!456425 (_1!7914 (tuple2!15807 lt!456193 (minValue!6062 lt!455914)))) (Some!640 (_2!7914 (tuple2!15807 lt!456193 (minValue!6062 lt!455914)))))))

(assert (=> d!124139 (= lt!456424 (lemmaContainsTupThenGetReturnValue!280 lt!456425 (_1!7914 (tuple2!15807 lt!456193 (minValue!6062 lt!455914))) (_2!7914 (tuple2!15807 lt!456193 (minValue!6062 lt!455914)))))))

(assert (=> d!124139 (= lt!456425 (insertStrictlySorted!373 (toList!6930 lt!456187) (_1!7914 (tuple2!15807 lt!456193 (minValue!6062 lt!455914))) (_2!7914 (tuple2!15807 lt!456193 (minValue!6062 lt!455914)))))))

(assert (=> d!124139 (= (+!3130 lt!456187 (tuple2!15807 lt!456193 (minValue!6062 lt!455914))) lt!456423)))

(declare-fun b!1034346 () Bool)

(declare-fun res!690861 () Bool)

(assert (=> b!1034346 (=> (not res!690861) (not e!584701))))

(assert (=> b!1034346 (= res!690861 (= (getValueByKey!590 (toList!6930 lt!456423) (_1!7914 (tuple2!15807 lt!456193 (minValue!6062 lt!455914)))) (Some!640 (_2!7914 (tuple2!15807 lt!456193 (minValue!6062 lt!455914))))))))

(declare-fun b!1034347 () Bool)

(assert (=> b!1034347 (= e!584701 (contains!5994 (toList!6930 lt!456423) (tuple2!15807 lt!456193 (minValue!6062 lt!455914))))))

(assert (= (and d!124139 res!690862) b!1034346))

(assert (= (and b!1034346 res!690861) b!1034347))

(declare-fun m!954085 () Bool)

(assert (=> d!124139 m!954085))

(declare-fun m!954087 () Bool)

(assert (=> d!124139 m!954087))

(declare-fun m!954089 () Bool)

(assert (=> d!124139 m!954089))

(declare-fun m!954091 () Bool)

(assert (=> d!124139 m!954091))

(declare-fun m!954093 () Bool)

(assert (=> b!1034346 m!954093))

(declare-fun m!954095 () Bool)

(assert (=> b!1034347 m!954095))

(assert (=> b!1033782 d!124139))

(declare-fun d!124141 () Bool)

(assert (=> d!124141 (contains!5992 (+!3130 lt!456190 (tuple2!15807 lt!456204 (zeroValue!6062 lt!455914))) lt!456186)))

(declare-fun lt!456426 () Unit!33713)

(assert (=> d!124141 (= lt!456426 (choose!1704 lt!456190 lt!456204 (zeroValue!6062 lt!455914) lt!456186))))

(assert (=> d!124141 (contains!5992 lt!456190 lt!456186)))

(assert (=> d!124141 (= (addStillContains!618 lt!456190 lt!456204 (zeroValue!6062 lt!455914) lt!456186) lt!456426)))

(declare-fun bs!30233 () Bool)

(assert (= bs!30233 d!124141))

(assert (=> bs!30233 m!953253))

(assert (=> bs!30233 m!953253))

(assert (=> bs!30233 m!953255))

(declare-fun m!954097 () Bool)

(assert (=> bs!30233 m!954097))

(declare-fun m!954099 () Bool)

(assert (=> bs!30233 m!954099))

(assert (=> b!1033782 d!124141))

(declare-fun d!124143 () Bool)

(assert (=> d!124143 (= (apply!899 (+!3130 lt!456206 (tuple2!15807 lt!456205 (minValue!6062 lt!455914))) lt!456197) (get!16429 (getValueByKey!590 (toList!6930 (+!3130 lt!456206 (tuple2!15807 lt!456205 (minValue!6062 lt!455914)))) lt!456197)))))

(declare-fun bs!30234 () Bool)

(assert (= bs!30234 d!124143))

(declare-fun m!954101 () Bool)

(assert (=> bs!30234 m!954101))

(assert (=> bs!30234 m!954101))

(declare-fun m!954103 () Bool)

(assert (=> bs!30234 m!954103))

(assert (=> b!1033782 d!124143))

(declare-fun d!124145 () Bool)

(assert (=> d!124145 (= (apply!899 (+!3130 lt!456187 (tuple2!15807 lt!456193 (minValue!6062 lt!455914))) lt!456191) (apply!899 lt!456187 lt!456191))))

(declare-fun lt!456427 () Unit!33713)

(assert (=> d!124145 (= lt!456427 (choose!1705 lt!456187 lt!456193 (minValue!6062 lt!455914) lt!456191))))

(declare-fun e!584702 () Bool)

(assert (=> d!124145 e!584702))

(declare-fun res!690863 () Bool)

(assert (=> d!124145 (=> (not res!690863) (not e!584702))))

(assert (=> d!124145 (= res!690863 (contains!5992 lt!456187 lt!456191))))

(assert (=> d!124145 (= (addApplyDifferent!474 lt!456187 lt!456193 (minValue!6062 lt!455914) lt!456191) lt!456427)))

(declare-fun b!1034348 () Bool)

(assert (=> b!1034348 (= e!584702 (not (= lt!456191 lt!456193)))))

(assert (= (and d!124145 res!690863) b!1034348))

(declare-fun m!954105 () Bool)

(assert (=> d!124145 m!954105))

(declare-fun m!954107 () Bool)

(assert (=> d!124145 m!954107))

(assert (=> d!124145 m!953257))

(assert (=> d!124145 m!953259))

(assert (=> d!124145 m!953257))

(assert (=> d!124145 m!953251))

(assert (=> b!1033782 d!124145))

(declare-fun d!124147 () Bool)

(assert (=> d!124147 (= (apply!899 lt!456187 lt!456191) (get!16429 (getValueByKey!590 (toList!6930 lt!456187) lt!456191)))))

(declare-fun bs!30235 () Bool)

(assert (= bs!30235 d!124147))

(declare-fun m!954109 () Bool)

(assert (=> bs!30235 m!954109))

(assert (=> bs!30235 m!954109))

(declare-fun m!954111 () Bool)

(assert (=> bs!30235 m!954111))

(assert (=> b!1033782 d!124147))

(declare-fun d!124149 () Bool)

(assert (=> d!124149 (= (apply!899 lt!456200 lt!456198) (get!16429 (getValueByKey!590 (toList!6930 lt!456200) lt!456198)))))

(declare-fun bs!30236 () Bool)

(assert (= bs!30236 d!124149))

(declare-fun m!954113 () Bool)

(assert (=> bs!30236 m!954113))

(assert (=> bs!30236 m!954113))

(declare-fun m!954115 () Bool)

(assert (=> bs!30236 m!954115))

(assert (=> b!1033782 d!124149))

(declare-fun d!124151 () Bool)

(assert (=> d!124151 (= (apply!899 (+!3130 lt!456187 (tuple2!15807 lt!456193 (minValue!6062 lt!455914))) lt!456191) (get!16429 (getValueByKey!590 (toList!6930 (+!3130 lt!456187 (tuple2!15807 lt!456193 (minValue!6062 lt!455914)))) lt!456191)))))

(declare-fun bs!30237 () Bool)

(assert (= bs!30237 d!124151))

(declare-fun m!954117 () Bool)

(assert (=> bs!30237 m!954117))

(assert (=> bs!30237 m!954117))

(declare-fun m!954119 () Bool)

(assert (=> bs!30237 m!954119))

(assert (=> b!1033782 d!124151))

(declare-fun d!124153 () Bool)

(declare-fun e!584703 () Bool)

(assert (=> d!124153 e!584703))

(declare-fun res!690865 () Bool)

(assert (=> d!124153 (=> (not res!690865) (not e!584703))))

(declare-fun lt!456429 () ListLongMap!13829)

(assert (=> d!124153 (= res!690865 (contains!5992 lt!456429 (_1!7914 (tuple2!15807 lt!456205 (minValue!6062 lt!455914)))))))

(declare-fun lt!456431 () List!21939)

(assert (=> d!124153 (= lt!456429 (ListLongMap!13830 lt!456431))))

(declare-fun lt!456428 () Unit!33713)

(declare-fun lt!456430 () Unit!33713)

(assert (=> d!124153 (= lt!456428 lt!456430)))

(assert (=> d!124153 (= (getValueByKey!590 lt!456431 (_1!7914 (tuple2!15807 lt!456205 (minValue!6062 lt!455914)))) (Some!640 (_2!7914 (tuple2!15807 lt!456205 (minValue!6062 lt!455914)))))))

(assert (=> d!124153 (= lt!456430 (lemmaContainsTupThenGetReturnValue!280 lt!456431 (_1!7914 (tuple2!15807 lt!456205 (minValue!6062 lt!455914))) (_2!7914 (tuple2!15807 lt!456205 (minValue!6062 lt!455914)))))))

(assert (=> d!124153 (= lt!456431 (insertStrictlySorted!373 (toList!6930 lt!456206) (_1!7914 (tuple2!15807 lt!456205 (minValue!6062 lt!455914))) (_2!7914 (tuple2!15807 lt!456205 (minValue!6062 lt!455914)))))))

(assert (=> d!124153 (= (+!3130 lt!456206 (tuple2!15807 lt!456205 (minValue!6062 lt!455914))) lt!456429)))

(declare-fun b!1034349 () Bool)

(declare-fun res!690864 () Bool)

(assert (=> b!1034349 (=> (not res!690864) (not e!584703))))

(assert (=> b!1034349 (= res!690864 (= (getValueByKey!590 (toList!6930 lt!456429) (_1!7914 (tuple2!15807 lt!456205 (minValue!6062 lt!455914)))) (Some!640 (_2!7914 (tuple2!15807 lt!456205 (minValue!6062 lt!455914))))))))

(declare-fun b!1034350 () Bool)

(assert (=> b!1034350 (= e!584703 (contains!5994 (toList!6930 lt!456429) (tuple2!15807 lt!456205 (minValue!6062 lt!455914))))))

(assert (= (and d!124153 res!690865) b!1034349))

(assert (= (and b!1034349 res!690864) b!1034350))

(declare-fun m!954121 () Bool)

(assert (=> d!124153 m!954121))

(declare-fun m!954123 () Bool)

(assert (=> d!124153 m!954123))

(declare-fun m!954125 () Bool)

(assert (=> d!124153 m!954125))

(declare-fun m!954127 () Bool)

(assert (=> d!124153 m!954127))

(declare-fun m!954129 () Bool)

(assert (=> b!1034349 m!954129))

(declare-fun m!954131 () Bool)

(assert (=> b!1034350 m!954131))

(assert (=> b!1033782 d!124153))

(declare-fun d!124155 () Bool)

(declare-fun e!584704 () Bool)

(assert (=> d!124155 e!584704))

(declare-fun res!690867 () Bool)

(assert (=> d!124155 (=> (not res!690867) (not e!584704))))

(declare-fun lt!456433 () ListLongMap!13829)

(assert (=> d!124155 (= res!690867 (contains!5992 lt!456433 (_1!7914 (tuple2!15807 lt!456195 (zeroValue!6062 lt!455914)))))))

(declare-fun lt!456435 () List!21939)

(assert (=> d!124155 (= lt!456433 (ListLongMap!13830 lt!456435))))

(declare-fun lt!456432 () Unit!33713)

(declare-fun lt!456434 () Unit!33713)

(assert (=> d!124155 (= lt!456432 lt!456434)))

(assert (=> d!124155 (= (getValueByKey!590 lt!456435 (_1!7914 (tuple2!15807 lt!456195 (zeroValue!6062 lt!455914)))) (Some!640 (_2!7914 (tuple2!15807 lt!456195 (zeroValue!6062 lt!455914)))))))

(assert (=> d!124155 (= lt!456434 (lemmaContainsTupThenGetReturnValue!280 lt!456435 (_1!7914 (tuple2!15807 lt!456195 (zeroValue!6062 lt!455914))) (_2!7914 (tuple2!15807 lt!456195 (zeroValue!6062 lt!455914)))))))

(assert (=> d!124155 (= lt!456435 (insertStrictlySorted!373 (toList!6930 lt!456200) (_1!7914 (tuple2!15807 lt!456195 (zeroValue!6062 lt!455914))) (_2!7914 (tuple2!15807 lt!456195 (zeroValue!6062 lt!455914)))))))

(assert (=> d!124155 (= (+!3130 lt!456200 (tuple2!15807 lt!456195 (zeroValue!6062 lt!455914))) lt!456433)))

(declare-fun b!1034351 () Bool)

(declare-fun res!690866 () Bool)

(assert (=> b!1034351 (=> (not res!690866) (not e!584704))))

(assert (=> b!1034351 (= res!690866 (= (getValueByKey!590 (toList!6930 lt!456433) (_1!7914 (tuple2!15807 lt!456195 (zeroValue!6062 lt!455914)))) (Some!640 (_2!7914 (tuple2!15807 lt!456195 (zeroValue!6062 lt!455914))))))))

(declare-fun b!1034352 () Bool)

(assert (=> b!1034352 (= e!584704 (contains!5994 (toList!6930 lt!456433) (tuple2!15807 lt!456195 (zeroValue!6062 lt!455914))))))

(assert (= (and d!124155 res!690867) b!1034351))

(assert (= (and b!1034351 res!690866) b!1034352))

(declare-fun m!954133 () Bool)

(assert (=> d!124155 m!954133))

(declare-fun m!954135 () Bool)

(assert (=> d!124155 m!954135))

(declare-fun m!954137 () Bool)

(assert (=> d!124155 m!954137))

(declare-fun m!954139 () Bool)

(assert (=> d!124155 m!954139))

(declare-fun m!954141 () Bool)

(assert (=> b!1034351 m!954141))

(declare-fun m!954143 () Bool)

(assert (=> b!1034352 m!954143))

(assert (=> b!1033782 d!124155))

(declare-fun d!124157 () Bool)

(declare-fun e!584705 () Bool)

(assert (=> d!124157 e!584705))

(declare-fun res!690869 () Bool)

(assert (=> d!124157 (=> (not res!690869) (not e!584705))))

(declare-fun lt!456437 () ListLongMap!13829)

(assert (=> d!124157 (= res!690869 (contains!5992 lt!456437 (_1!7914 (tuple2!15807 lt!456204 (zeroValue!6062 lt!455914)))))))

(declare-fun lt!456439 () List!21939)

(assert (=> d!124157 (= lt!456437 (ListLongMap!13830 lt!456439))))

(declare-fun lt!456436 () Unit!33713)

(declare-fun lt!456438 () Unit!33713)

(assert (=> d!124157 (= lt!456436 lt!456438)))

(assert (=> d!124157 (= (getValueByKey!590 lt!456439 (_1!7914 (tuple2!15807 lt!456204 (zeroValue!6062 lt!455914)))) (Some!640 (_2!7914 (tuple2!15807 lt!456204 (zeroValue!6062 lt!455914)))))))

(assert (=> d!124157 (= lt!456438 (lemmaContainsTupThenGetReturnValue!280 lt!456439 (_1!7914 (tuple2!15807 lt!456204 (zeroValue!6062 lt!455914))) (_2!7914 (tuple2!15807 lt!456204 (zeroValue!6062 lt!455914)))))))

(assert (=> d!124157 (= lt!456439 (insertStrictlySorted!373 (toList!6930 lt!456190) (_1!7914 (tuple2!15807 lt!456204 (zeroValue!6062 lt!455914))) (_2!7914 (tuple2!15807 lt!456204 (zeroValue!6062 lt!455914)))))))

(assert (=> d!124157 (= (+!3130 lt!456190 (tuple2!15807 lt!456204 (zeroValue!6062 lt!455914))) lt!456437)))

(declare-fun b!1034353 () Bool)

(declare-fun res!690868 () Bool)

(assert (=> b!1034353 (=> (not res!690868) (not e!584705))))

(assert (=> b!1034353 (= res!690868 (= (getValueByKey!590 (toList!6930 lt!456437) (_1!7914 (tuple2!15807 lt!456204 (zeroValue!6062 lt!455914)))) (Some!640 (_2!7914 (tuple2!15807 lt!456204 (zeroValue!6062 lt!455914))))))))

(declare-fun b!1034354 () Bool)

(assert (=> b!1034354 (= e!584705 (contains!5994 (toList!6930 lt!456437) (tuple2!15807 lt!456204 (zeroValue!6062 lt!455914))))))

(assert (= (and d!124157 res!690869) b!1034353))

(assert (= (and b!1034353 res!690868) b!1034354))

(declare-fun m!954145 () Bool)

(assert (=> d!124157 m!954145))

(declare-fun m!954147 () Bool)

(assert (=> d!124157 m!954147))

(declare-fun m!954149 () Bool)

(assert (=> d!124157 m!954149))

(declare-fun m!954151 () Bool)

(assert (=> d!124157 m!954151))

(declare-fun m!954153 () Bool)

(assert (=> b!1034353 m!954153))

(declare-fun m!954155 () Bool)

(assert (=> b!1034354 m!954155))

(assert (=> b!1033782 d!124157))

(declare-fun d!124159 () Bool)

(declare-fun e!584706 () Bool)

(assert (=> d!124159 e!584706))

(declare-fun res!690870 () Bool)

(assert (=> d!124159 (=> res!690870 e!584706)))

(declare-fun lt!456440 () Bool)

(assert (=> d!124159 (= res!690870 (not lt!456440))))

(declare-fun lt!456443 () Bool)

(assert (=> d!124159 (= lt!456440 lt!456443)))

(declare-fun lt!456442 () Unit!33713)

(declare-fun e!584707 () Unit!33713)

(assert (=> d!124159 (= lt!456442 e!584707)))

(declare-fun c!104595 () Bool)

(assert (=> d!124159 (= c!104595 lt!456443)))

(assert (=> d!124159 (= lt!456443 (containsKey!563 (toList!6930 (+!3130 lt!456190 (tuple2!15807 lt!456204 (zeroValue!6062 lt!455914)))) lt!456186))))

(assert (=> d!124159 (= (contains!5992 (+!3130 lt!456190 (tuple2!15807 lt!456204 (zeroValue!6062 lt!455914))) lt!456186) lt!456440)))

(declare-fun b!1034355 () Bool)

(declare-fun lt!456441 () Unit!33713)

(assert (=> b!1034355 (= e!584707 lt!456441)))

(assert (=> b!1034355 (= lt!456441 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 (+!3130 lt!456190 (tuple2!15807 lt!456204 (zeroValue!6062 lt!455914)))) lt!456186))))

(assert (=> b!1034355 (isDefined!438 (getValueByKey!590 (toList!6930 (+!3130 lt!456190 (tuple2!15807 lt!456204 (zeroValue!6062 lt!455914)))) lt!456186))))

(declare-fun b!1034356 () Bool)

(declare-fun Unit!33753 () Unit!33713)

(assert (=> b!1034356 (= e!584707 Unit!33753)))

(declare-fun b!1034357 () Bool)

(assert (=> b!1034357 (= e!584706 (isDefined!438 (getValueByKey!590 (toList!6930 (+!3130 lt!456190 (tuple2!15807 lt!456204 (zeroValue!6062 lt!455914)))) lt!456186)))))

(assert (= (and d!124159 c!104595) b!1034355))

(assert (= (and d!124159 (not c!104595)) b!1034356))

(assert (= (and d!124159 (not res!690870)) b!1034357))

(declare-fun m!954157 () Bool)

(assert (=> d!124159 m!954157))

(declare-fun m!954159 () Bool)

(assert (=> b!1034355 m!954159))

(declare-fun m!954161 () Bool)

(assert (=> b!1034355 m!954161))

(assert (=> b!1034355 m!954161))

(declare-fun m!954163 () Bool)

(assert (=> b!1034355 m!954163))

(assert (=> b!1034357 m!954161))

(assert (=> b!1034357 m!954161))

(assert (=> b!1034357 m!954163))

(assert (=> b!1033782 d!124159))

(declare-fun d!124161 () Bool)

(declare-fun e!584708 () Bool)

(assert (=> d!124161 e!584708))

(declare-fun res!690871 () Bool)

(assert (=> d!124161 (=> res!690871 e!584708)))

(declare-fun lt!456444 () Bool)

(assert (=> d!124161 (= res!690871 (not lt!456444))))

(declare-fun lt!456447 () Bool)

(assert (=> d!124161 (= lt!456444 lt!456447)))

(declare-fun lt!456446 () Unit!33713)

(declare-fun e!584709 () Unit!33713)

(assert (=> d!124161 (= lt!456446 e!584709)))

(declare-fun c!104596 () Bool)

(assert (=> d!124161 (= c!104596 lt!456447)))

(assert (=> d!124161 (= lt!456447 (containsKey!563 (toList!6930 (+!3130 lt!456048 (tuple2!15807 lt!456046 lt!456049))) lt!456044))))

(assert (=> d!124161 (= (contains!5992 (+!3130 lt!456048 (tuple2!15807 lt!456046 lt!456049)) lt!456044) lt!456444)))

(declare-fun b!1034358 () Bool)

(declare-fun lt!456445 () Unit!33713)

(assert (=> b!1034358 (= e!584709 lt!456445)))

(assert (=> b!1034358 (= lt!456445 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 (+!3130 lt!456048 (tuple2!15807 lt!456046 lt!456049))) lt!456044))))

(assert (=> b!1034358 (isDefined!438 (getValueByKey!590 (toList!6930 (+!3130 lt!456048 (tuple2!15807 lt!456046 lt!456049))) lt!456044))))

(declare-fun b!1034359 () Bool)

(declare-fun Unit!33754 () Unit!33713)

(assert (=> b!1034359 (= e!584709 Unit!33754)))

(declare-fun b!1034360 () Bool)

(assert (=> b!1034360 (= e!584708 (isDefined!438 (getValueByKey!590 (toList!6930 (+!3130 lt!456048 (tuple2!15807 lt!456046 lt!456049))) lt!456044)))))

(assert (= (and d!124161 c!104596) b!1034358))

(assert (= (and d!124161 (not c!104596)) b!1034359))

(assert (= (and d!124161 (not res!690871)) b!1034360))

(declare-fun m!954165 () Bool)

(assert (=> d!124161 m!954165))

(declare-fun m!954167 () Bool)

(assert (=> b!1034358 m!954167))

(declare-fun m!954169 () Bool)

(assert (=> b!1034358 m!954169))

(assert (=> b!1034358 m!954169))

(declare-fun m!954171 () Bool)

(assert (=> b!1034358 m!954171))

(assert (=> b!1034360 m!954169))

(assert (=> b!1034360 m!954169))

(assert (=> b!1034360 m!954171))

(assert (=> b!1033622 d!124161))

(declare-fun d!124163 () Bool)

(assert (=> d!124163 (not (contains!5992 (+!3130 lt!456048 (tuple2!15807 lt!456046 lt!456049)) lt!456044))))

(declare-fun lt!456448 () Unit!33713)

(assert (=> d!124163 (= lt!456448 (choose!1708 lt!456048 lt!456046 lt!456049 lt!456044))))

(declare-fun e!584710 () Bool)

(assert (=> d!124163 e!584710))

(declare-fun res!690872 () Bool)

(assert (=> d!124163 (=> (not res!690872) (not e!584710))))

(assert (=> d!124163 (= res!690872 (not (contains!5992 lt!456048 lt!456044)))))

(assert (=> d!124163 (= (addStillNotContains!243 lt!456048 lt!456046 lt!456049 lt!456044) lt!456448)))

(declare-fun b!1034361 () Bool)

(assert (=> b!1034361 (= e!584710 (not (= lt!456046 lt!456044)))))

(assert (= (and d!124163 res!690872) b!1034361))

(assert (=> d!124163 m!952877))

(assert (=> d!124163 m!952877))

(assert (=> d!124163 m!952881))

(declare-fun m!954173 () Bool)

(assert (=> d!124163 m!954173))

(declare-fun m!954175 () Bool)

(assert (=> d!124163 m!954175))

(assert (=> b!1033622 d!124163))

(assert (=> b!1033622 d!123687))

(declare-fun d!124165 () Bool)

(declare-fun e!584711 () Bool)

(assert (=> d!124165 e!584711))

(declare-fun res!690874 () Bool)

(assert (=> d!124165 (=> (not res!690874) (not e!584711))))

(declare-fun lt!456450 () ListLongMap!13829)

(assert (=> d!124165 (= res!690874 (contains!5992 lt!456450 (_1!7914 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!456452 () List!21939)

(assert (=> d!124165 (= lt!456450 (ListLongMap!13830 lt!456452))))

(declare-fun lt!456449 () Unit!33713)

(declare-fun lt!456451 () Unit!33713)

(assert (=> d!124165 (= lt!456449 lt!456451)))

(assert (=> d!124165 (= (getValueByKey!590 lt!456452 (_1!7914 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!640 (_2!7914 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124165 (= lt!456451 (lemmaContainsTupThenGetReturnValue!280 lt!456452 (_1!7914 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7914 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124165 (= lt!456452 (insertStrictlySorted!373 (toList!6930 call!43655) (_1!7914 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7914 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124165 (= (+!3130 call!43655 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!456450)))

(declare-fun b!1034362 () Bool)

(declare-fun res!690873 () Bool)

(assert (=> b!1034362 (=> (not res!690873) (not e!584711))))

(assert (=> b!1034362 (= res!690873 (= (getValueByKey!590 (toList!6930 lt!456450) (_1!7914 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!640 (_2!7914 (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1034363 () Bool)

(assert (=> b!1034363 (= e!584711 (contains!5994 (toList!6930 lt!456450) (tuple2!15807 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000) (get!16428 (select (arr!31321 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1984 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!124165 res!690874) b!1034362))

(assert (= (and b!1034362 res!690873) b!1034363))

(declare-fun m!954177 () Bool)

(assert (=> d!124165 m!954177))

(declare-fun m!954179 () Bool)

(assert (=> d!124165 m!954179))

(declare-fun m!954181 () Bool)

(assert (=> d!124165 m!954181))

(declare-fun m!954183 () Bool)

(assert (=> d!124165 m!954183))

(declare-fun m!954185 () Bool)

(assert (=> b!1034362 m!954185))

(declare-fun m!954187 () Bool)

(assert (=> b!1034363 m!954187))

(assert (=> b!1033622 d!124165))

(declare-fun d!124167 () Bool)

(declare-fun e!584712 () Bool)

(assert (=> d!124167 e!584712))

(declare-fun res!690876 () Bool)

(assert (=> d!124167 (=> (not res!690876) (not e!584712))))

(declare-fun lt!456454 () ListLongMap!13829)

(assert (=> d!124167 (= res!690876 (contains!5992 lt!456454 (_1!7914 (tuple2!15807 lt!456046 lt!456049))))))

(declare-fun lt!456456 () List!21939)

(assert (=> d!124167 (= lt!456454 (ListLongMap!13830 lt!456456))))

(declare-fun lt!456453 () Unit!33713)

(declare-fun lt!456455 () Unit!33713)

(assert (=> d!124167 (= lt!456453 lt!456455)))

(assert (=> d!124167 (= (getValueByKey!590 lt!456456 (_1!7914 (tuple2!15807 lt!456046 lt!456049))) (Some!640 (_2!7914 (tuple2!15807 lt!456046 lt!456049))))))

(assert (=> d!124167 (= lt!456455 (lemmaContainsTupThenGetReturnValue!280 lt!456456 (_1!7914 (tuple2!15807 lt!456046 lt!456049)) (_2!7914 (tuple2!15807 lt!456046 lt!456049))))))

(assert (=> d!124167 (= lt!456456 (insertStrictlySorted!373 (toList!6930 lt!456048) (_1!7914 (tuple2!15807 lt!456046 lt!456049)) (_2!7914 (tuple2!15807 lt!456046 lt!456049))))))

(assert (=> d!124167 (= (+!3130 lt!456048 (tuple2!15807 lt!456046 lt!456049)) lt!456454)))

(declare-fun b!1034364 () Bool)

(declare-fun res!690875 () Bool)

(assert (=> b!1034364 (=> (not res!690875) (not e!584712))))

(assert (=> b!1034364 (= res!690875 (= (getValueByKey!590 (toList!6930 lt!456454) (_1!7914 (tuple2!15807 lt!456046 lt!456049))) (Some!640 (_2!7914 (tuple2!15807 lt!456046 lt!456049)))))))

(declare-fun b!1034365 () Bool)

(assert (=> b!1034365 (= e!584712 (contains!5994 (toList!6930 lt!456454) (tuple2!15807 lt!456046 lt!456049)))))

(assert (= (and d!124167 res!690876) b!1034364))

(assert (= (and b!1034364 res!690875) b!1034365))

(declare-fun m!954189 () Bool)

(assert (=> d!124167 m!954189))

(declare-fun m!954191 () Bool)

(assert (=> d!124167 m!954191))

(declare-fun m!954193 () Bool)

(assert (=> d!124167 m!954193))

(declare-fun m!954195 () Bool)

(assert (=> d!124167 m!954195))

(declare-fun m!954197 () Bool)

(assert (=> b!1034364 m!954197))

(declare-fun m!954199 () Bool)

(assert (=> b!1034365 m!954199))

(assert (=> b!1033622 d!124167))

(declare-fun d!124169 () Bool)

(assert (=> d!124169 (isDefined!438 (getValueByKey!590 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915))) lt!455982))))

(declare-fun lt!456457 () Unit!33713)

(assert (=> d!124169 (= lt!456457 (choose!1706 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915))) lt!455982))))

(declare-fun e!584713 () Bool)

(assert (=> d!124169 e!584713))

(declare-fun res!690877 () Bool)

(assert (=> d!124169 (=> (not res!690877) (not e!584713))))

(assert (=> d!124169 (= res!690877 (isStrictlySorted!714 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915)))))))

(assert (=> d!124169 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915))) lt!455982) lt!456457)))

(declare-fun b!1034366 () Bool)

(assert (=> b!1034366 (= e!584713 (containsKey!563 (toList!6930 (+!3130 lt!455986 (tuple2!15807 lt!456000 lt!455915))) lt!455982))))

(assert (= (and d!124169 res!690877) b!1034366))

(assert (=> d!124169 m!953109))

(assert (=> d!124169 m!953109))

(assert (=> d!124169 m!953111))

(declare-fun m!954201 () Bool)

(assert (=> d!124169 m!954201))

(declare-fun m!954203 () Bool)

(assert (=> d!124169 m!954203))

(assert (=> b!1034366 m!953105))

(assert (=> b!1033726 d!124169))

(assert (=> b!1033726 d!123897))

(assert (=> b!1033726 d!123899))

(declare-fun b!1034367 () Bool)

(declare-fun e!584714 () Option!641)

(assert (=> b!1034367 (= e!584714 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456115)))))))

(declare-fun b!1034370 () Bool)

(declare-fun e!584715 () Option!641)

(assert (=> b!1034370 (= e!584715 None!639)))

(declare-fun b!1034369 () Bool)

(assert (=> b!1034369 (= e!584715 (getValueByKey!590 (t!31126 (toList!6930 lt!456115)) (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))))))

(declare-fun c!104597 () Bool)

(declare-fun d!124171 () Bool)

(assert (=> d!124171 (= c!104597 (and ((_ is Cons!21935) (toList!6930 lt!456115)) (= (_1!7914 (h!23137 (toList!6930 lt!456115))) (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))))))))

(assert (=> d!124171 (= (getValueByKey!590 (toList!6930 lt!456115) (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))) e!584714)))

(declare-fun b!1034368 () Bool)

(assert (=> b!1034368 (= e!584714 e!584715)))

(declare-fun c!104598 () Bool)

(assert (=> b!1034368 (= c!104598 (and ((_ is Cons!21935) (toList!6930 lt!456115)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456115))) (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!124171 c!104597) b!1034367))

(assert (= (and d!124171 (not c!104597)) b!1034368))

(assert (= (and b!1034368 c!104598) b!1034369))

(assert (= (and b!1034368 (not c!104598)) b!1034370))

(declare-fun m!954205 () Bool)

(assert (=> b!1034369 m!954205))

(assert (=> b!1033715 d!124171))

(declare-fun d!124173 () Bool)

(assert (=> d!124173 (= (apply!899 lt!456105 (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) (get!16429 (getValueByKey!590 (toList!6930 lt!456105) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30238 () Bool)

(assert (= bs!30238 d!124173))

(assert (=> bs!30238 m!952763))

(assert (=> bs!30238 m!953593))

(assert (=> bs!30238 m!953593))

(declare-fun m!954207 () Bool)

(assert (=> bs!30238 m!954207))

(assert (=> b!1033677 d!124173))

(assert (=> b!1033677 d!123687))

(declare-fun d!124175 () Bool)

(declare-fun e!584716 () Bool)

(assert (=> d!124175 e!584716))

(declare-fun res!690878 () Bool)

(assert (=> d!124175 (=> res!690878 e!584716)))

(declare-fun lt!456458 () Bool)

(assert (=> d!124175 (= res!690878 (not lt!456458))))

(declare-fun lt!456461 () Bool)

(assert (=> d!124175 (= lt!456458 lt!456461)))

(declare-fun lt!456460 () Unit!33713)

(declare-fun e!584717 () Unit!33713)

(assert (=> d!124175 (= lt!456460 e!584717)))

(declare-fun c!104599 () Bool)

(assert (=> d!124175 (= c!104599 lt!456461)))

(assert (=> d!124175 (= lt!456461 (containsKey!563 (toList!6930 lt!456101) (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))))))

(assert (=> d!124175 (= (contains!5992 lt!456101 (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))) lt!456458)))

(declare-fun b!1034371 () Bool)

(declare-fun lt!456459 () Unit!33713)

(assert (=> b!1034371 (= e!584717 lt!456459)))

(assert (=> b!1034371 (= lt!456459 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456101) (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))))))

(assert (=> b!1034371 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456101) (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034372 () Bool)

(declare-fun Unit!33755 () Unit!33713)

(assert (=> b!1034372 (= e!584717 Unit!33755)))

(declare-fun b!1034373 () Bool)

(assert (=> b!1034373 (= e!584716 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456101) (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124175 c!104599) b!1034371))

(assert (= (and d!124175 (not c!104599)) b!1034372))

(assert (= (and d!124175 (not res!690878)) b!1034373))

(declare-fun m!954209 () Bool)

(assert (=> d!124175 m!954209))

(declare-fun m!954211 () Bool)

(assert (=> b!1034371 m!954211))

(assert (=> b!1034371 m!952985))

(assert (=> b!1034371 m!952985))

(declare-fun m!954213 () Bool)

(assert (=> b!1034371 m!954213))

(assert (=> b!1034373 m!952985))

(assert (=> b!1034373 m!952985))

(assert (=> b!1034373 m!954213))

(assert (=> d!123713 d!124175))

(declare-fun b!1034374 () Bool)

(declare-fun e!584718 () Option!641)

(assert (=> b!1034374 (= e!584718 (Some!640 (_2!7914 (h!23137 lt!456103))))))

(declare-fun b!1034377 () Bool)

(declare-fun e!584719 () Option!641)

(assert (=> b!1034377 (= e!584719 None!639)))

(declare-fun b!1034376 () Bool)

(assert (=> b!1034376 (= e!584719 (getValueByKey!590 (t!31126 lt!456103) (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))))))

(declare-fun c!104600 () Bool)

(declare-fun d!124177 () Bool)

(assert (=> d!124177 (= c!104600 (and ((_ is Cons!21935) lt!456103) (= (_1!7914 (h!23137 lt!456103)) (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))))))))

(assert (=> d!124177 (= (getValueByKey!590 lt!456103 (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))) e!584718)))

(declare-fun b!1034375 () Bool)

(assert (=> b!1034375 (= e!584718 e!584719)))

(declare-fun c!104601 () Bool)

(assert (=> b!1034375 (= c!104601 (and ((_ is Cons!21935) lt!456103) (not (= (_1!7914 (h!23137 lt!456103)) (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!124177 c!104600) b!1034374))

(assert (= (and d!124177 (not c!104600)) b!1034375))

(assert (= (and b!1034375 c!104601) b!1034376))

(assert (= (and b!1034375 (not c!104601)) b!1034377))

(declare-fun m!954215 () Bool)

(assert (=> b!1034376 m!954215))

(assert (=> d!123713 d!124177))

(declare-fun d!124179 () Bool)

(assert (=> d!124179 (= (getValueByKey!590 lt!456103 (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456462 () Unit!33713)

(assert (=> d!124179 (= lt!456462 (choose!1707 lt!456103 (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))))))

(declare-fun e!584720 () Bool)

(assert (=> d!124179 e!584720))

(declare-fun res!690879 () Bool)

(assert (=> d!124179 (=> (not res!690879) (not e!584720))))

(assert (=> d!124179 (= res!690879 (isStrictlySorted!714 lt!456103))))

(assert (=> d!124179 (= (lemmaContainsTupThenGetReturnValue!280 lt!456103 (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))) lt!456462)))

(declare-fun b!1034378 () Bool)

(declare-fun res!690880 () Bool)

(assert (=> b!1034378 (=> (not res!690880) (not e!584720))))

(assert (=> b!1034378 (= res!690880 (containsKey!563 lt!456103 (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034379 () Bool)

(assert (=> b!1034379 (= e!584720 (contains!5994 lt!456103 (tuple2!15807 (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124179 res!690879) b!1034378))

(assert (= (and b!1034378 res!690880) b!1034379))

(assert (=> d!124179 m!952979))

(declare-fun m!954217 () Bool)

(assert (=> d!124179 m!954217))

(declare-fun m!954219 () Bool)

(assert (=> d!124179 m!954219))

(declare-fun m!954221 () Bool)

(assert (=> b!1034378 m!954221))

(declare-fun m!954223 () Bool)

(assert (=> b!1034379 m!954223))

(assert (=> d!123713 d!124179))

(declare-fun e!584722 () Bool)

(declare-fun b!1034380 () Bool)

(declare-fun lt!456463 () List!21939)

(assert (=> b!1034380 (= e!584722 (contains!5994 lt!456463 (tuple2!15807 (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))))))))

(declare-fun b!1034381 () Bool)

(declare-fun e!584724 () List!21939)

(declare-fun call!43714 () List!21939)

(assert (=> b!1034381 (= e!584724 call!43714)))

(declare-fun c!104605 () Bool)

(declare-fun b!1034382 () Bool)

(declare-fun c!104603 () Bool)

(declare-fun e!584721 () List!21939)

(assert (=> b!1034382 (= e!584721 (ite c!104605 (t!31126 (toList!6930 lt!456009)) (ite c!104603 (Cons!21935 (h!23137 (toList!6930 lt!456009)) (t!31126 (toList!6930 lt!456009))) Nil!21936)))))

(declare-fun b!1034383 () Bool)

(declare-fun res!690882 () Bool)

(assert (=> b!1034383 (=> (not res!690882) (not e!584722))))

(assert (=> b!1034383 (= res!690882 (containsKey!563 lt!456463 (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034384 () Bool)

(declare-fun e!584725 () List!21939)

(declare-fun call!43716 () List!21939)

(assert (=> b!1034384 (= e!584725 call!43716)))

(declare-fun bm!43711 () Bool)

(declare-fun call!43715 () List!21939)

(assert (=> bm!43711 (= call!43716 call!43715)))

(declare-fun b!1034385 () Bool)

(declare-fun e!584723 () List!21939)

(assert (=> b!1034385 (= e!584724 e!584723)))

(assert (=> b!1034385 (= c!104605 (and ((_ is Cons!21935) (toList!6930 lt!456009)) (= (_1!7914 (h!23137 (toList!6930 lt!456009))) (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))))))))

(declare-fun b!1034386 () Bool)

(assert (=> b!1034386 (= e!584725 call!43716)))

(declare-fun b!1034387 () Bool)

(assert (=> b!1034387 (= e!584723 call!43715)))

(declare-fun d!124181 () Bool)

(assert (=> d!124181 e!584722))

(declare-fun res!690881 () Bool)

(assert (=> d!124181 (=> (not res!690881) (not e!584722))))

(assert (=> d!124181 (= res!690881 (isStrictlySorted!714 lt!456463))))

(assert (=> d!124181 (= lt!456463 e!584724)))

(declare-fun c!104602 () Bool)

(assert (=> d!124181 (= c!104602 (and ((_ is Cons!21935) (toList!6930 lt!456009)) (bvslt (_1!7914 (h!23137 (toList!6930 lt!456009))) (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))))))))

(assert (=> d!124181 (isStrictlySorted!714 (toList!6930 lt!456009))))

(assert (=> d!124181 (= (insertStrictlySorted!373 (toList!6930 lt!456009) (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))) lt!456463)))

(declare-fun bm!43712 () Bool)

(assert (=> bm!43712 (= call!43715 call!43714)))

(declare-fun bm!43713 () Bool)

(assert (=> bm!43713 (= call!43714 ($colon$colon!604 e!584721 (ite c!104602 (h!23137 (toList!6930 lt!456009)) (tuple2!15807 (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))))))))

(declare-fun c!104604 () Bool)

(assert (=> bm!43713 (= c!104604 c!104602)))

(declare-fun b!1034388 () Bool)

(assert (=> b!1034388 (= e!584721 (insertStrictlySorted!373 (t!31126 (toList!6930 lt!456009)) (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034389 () Bool)

(assert (=> b!1034389 (= c!104603 (and ((_ is Cons!21935) (toList!6930 lt!456009)) (bvsgt (_1!7914 (h!23137 (toList!6930 lt!456009))) (_1!7914 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))))))))

(assert (=> b!1034389 (= e!584723 e!584725)))

(assert (= (and d!124181 c!104602) b!1034381))

(assert (= (and d!124181 (not c!104602)) b!1034385))

(assert (= (and b!1034385 c!104605) b!1034387))

(assert (= (and b!1034385 (not c!104605)) b!1034389))

(assert (= (and b!1034389 c!104603) b!1034384))

(assert (= (and b!1034389 (not c!104603)) b!1034386))

(assert (= (or b!1034384 b!1034386) bm!43711))

(assert (= (or b!1034387 bm!43711) bm!43712))

(assert (= (or b!1034381 bm!43712) bm!43713))

(assert (= (and bm!43713 c!104604) b!1034388))

(assert (= (and bm!43713 (not c!104604)) b!1034382))

(assert (= (and d!124181 res!690881) b!1034383))

(assert (= (and b!1034383 res!690882) b!1034380))

(declare-fun m!954225 () Bool)

(assert (=> b!1034388 m!954225))

(declare-fun m!954227 () Bool)

(assert (=> d!124181 m!954227))

(declare-fun m!954229 () Bool)

(assert (=> d!124181 m!954229))

(declare-fun m!954231 () Bool)

(assert (=> b!1034380 m!954231))

(declare-fun m!954233 () Bool)

(assert (=> b!1034383 m!954233))

(declare-fun m!954235 () Bool)

(assert (=> bm!43713 m!954235))

(assert (=> d!123713 d!124181))

(declare-fun d!124183 () Bool)

(assert (=> d!124183 (= (apply!899 lt!456207 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16429 (getValueByKey!590 (toList!6930 lt!456207) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30239 () Bool)

(assert (= bs!30239 d!124183))

(assert (=> bs!30239 m!953833))

(assert (=> bs!30239 m!953833))

(declare-fun m!954237 () Bool)

(assert (=> bs!30239 m!954237))

(assert (=> b!1033779 d!124183))

(declare-fun d!124185 () Bool)

(declare-fun lt!456464 () Bool)

(assert (=> d!124185 (= lt!456464 (select (content!512 (toList!6930 lt!456209)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(declare-fun e!584727 () Bool)

(assert (=> d!124185 (= lt!456464 e!584727)))

(declare-fun res!690884 () Bool)

(assert (=> d!124185 (=> (not res!690884) (not e!584727))))

(assert (=> d!124185 (= res!690884 ((_ is Cons!21935) (toList!6930 lt!456209)))))

(assert (=> d!124185 (= (contains!5994 (toList!6930 lt!456209) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) lt!456464)))

(declare-fun b!1034390 () Bool)

(declare-fun e!584726 () Bool)

(assert (=> b!1034390 (= e!584727 e!584726)))

(declare-fun res!690883 () Bool)

(assert (=> b!1034390 (=> res!690883 e!584726)))

(assert (=> b!1034390 (= res!690883 (= (h!23137 (toList!6930 lt!456209)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(declare-fun b!1034391 () Bool)

(assert (=> b!1034391 (= e!584726 (contains!5994 (t!31126 (toList!6930 lt!456209)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(assert (= (and d!124185 res!690884) b!1034390))

(assert (= (and b!1034390 (not res!690883)) b!1034391))

(declare-fun m!954239 () Bool)

(assert (=> d!124185 m!954239))

(declare-fun m!954241 () Bool)

(assert (=> d!124185 m!954241))

(declare-fun m!954243 () Bool)

(assert (=> b!1034391 m!954243))

(assert (=> b!1033806 d!124185))

(assert (=> b!1033770 d!123953))

(assert (=> b!1033770 d!123955))

(declare-fun d!124187 () Bool)

(assert (=> d!124187 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456029) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!456465 () Unit!33713)

(assert (=> d!124187 (= lt!456465 (choose!1706 (toList!6930 lt!456029) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!584728 () Bool)

(assert (=> d!124187 e!584728))

(declare-fun res!690885 () Bool)

(assert (=> d!124187 (=> (not res!690885) (not e!584728))))

(assert (=> d!124187 (= res!690885 (isStrictlySorted!714 (toList!6930 lt!456029)))))

(assert (=> d!124187 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456029) #b0000000000000000000000000000000000000000000000000000000000000000) lt!456465)))

(declare-fun b!1034392 () Bool)

(assert (=> b!1034392 (= e!584728 (containsKey!563 (toList!6930 lt!456029) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124187 res!690885) b!1034392))

(assert (=> d!124187 m!953145))

(assert (=> d!124187 m!953145))

(assert (=> d!124187 m!953209))

(declare-fun m!954245 () Bool)

(assert (=> d!124187 m!954245))

(declare-fun m!954247 () Bool)

(assert (=> d!124187 m!954247))

(assert (=> b!1034392 m!953205))

(assert (=> b!1033765 d!124187))

(assert (=> b!1033765 d!123933))

(assert (=> b!1033765 d!123861))

(declare-fun d!124189 () Bool)

(assert (=> d!124189 (= (get!16429 (getValueByKey!590 (toList!6930 (+!3130 lt!456009 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))) lt!456013)) (v!14888 (getValueByKey!590 (toList!6930 (+!3130 lt!456009 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))) lt!456013)))))

(assert (=> d!123693 d!124189))

(declare-fun b!1034393 () Bool)

(declare-fun e!584729 () Option!641)

(assert (=> b!1034393 (= e!584729 (Some!640 (_2!7914 (h!23137 (toList!6930 (+!3130 lt!456009 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))))))))))

(declare-fun b!1034396 () Bool)

(declare-fun e!584730 () Option!641)

(assert (=> b!1034396 (= e!584730 None!639)))

(declare-fun b!1034395 () Bool)

(assert (=> b!1034395 (= e!584730 (getValueByKey!590 (t!31126 (toList!6930 (+!3130 lt!456009 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))))) lt!456013))))

(declare-fun d!124191 () Bool)

(declare-fun c!104606 () Bool)

(assert (=> d!124191 (= c!104606 (and ((_ is Cons!21935) (toList!6930 (+!3130 lt!456009 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))))) (= (_1!7914 (h!23137 (toList!6930 (+!3130 lt!456009 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))))) lt!456013)))))

(assert (=> d!124191 (= (getValueByKey!590 (toList!6930 (+!3130 lt!456009 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))) lt!456013) e!584729)))

(declare-fun b!1034394 () Bool)

(assert (=> b!1034394 (= e!584729 e!584730)))

(declare-fun c!104607 () Bool)

(assert (=> b!1034394 (= c!104607 (and ((_ is Cons!21935) (toList!6930 (+!3130 lt!456009 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))))) (not (= (_1!7914 (h!23137 (toList!6930 (+!3130 lt!456009 (tuple2!15807 lt!456015 (minValue!6062 thiss!1427)))))) lt!456013))))))

(assert (= (and d!124191 c!104606) b!1034393))

(assert (= (and d!124191 (not c!104606)) b!1034394))

(assert (= (and b!1034394 c!104607) b!1034395))

(assert (= (and b!1034394 (not c!104607)) b!1034396))

(declare-fun m!954249 () Bool)

(assert (=> b!1034395 m!954249))

(assert (=> d!123693 d!124191))

(declare-fun d!124193 () Bool)

(assert (=> d!124193 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456003) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!456466 () Unit!33713)

(assert (=> d!124193 (= lt!456466 (choose!1706 (toList!6930 lt!456003) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!584731 () Bool)

(assert (=> d!124193 e!584731))

(declare-fun res!690886 () Bool)

(assert (=> d!124193 (=> (not res!690886) (not e!584731))))

(assert (=> d!124193 (= res!690886 (isStrictlySorted!714 (toList!6930 lt!456003)))))

(assert (=> d!124193 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456003) #b1000000000000000000000000000000000000000000000000000000000000000) lt!456466)))

(declare-fun b!1034397 () Bool)

(assert (=> b!1034397 (= e!584731 (containsKey!563 (toList!6930 lt!456003) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124193 res!690886) b!1034397))

(assert (=> d!124193 m!953201))

(assert (=> d!124193 m!953201))

(assert (=> d!124193 m!953203))

(declare-fun m!954251 () Bool)

(assert (=> d!124193 m!954251))

(assert (=> d!124193 m!953609))

(assert (=> b!1034397 m!953197))

(assert (=> b!1033762 d!124193))

(assert (=> b!1033762 d!123921))

(assert (=> b!1033762 d!123865))

(declare-fun d!124195 () Bool)

(declare-fun res!690887 () Bool)

(declare-fun e!584732 () Bool)

(assert (=> d!124195 (=> res!690887 e!584732)))

(assert (=> d!124195 (= res!690887 (and ((_ is Cons!21935) lt!456161) (= (_1!7914 (h!23137 lt!456161)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124195 (= (containsKey!563 lt!456161 #b0000000000000000000000000000000000000000000000000000000000000000) e!584732)))

(declare-fun b!1034398 () Bool)

(declare-fun e!584733 () Bool)

(assert (=> b!1034398 (= e!584732 e!584733)))

(declare-fun res!690888 () Bool)

(assert (=> b!1034398 (=> (not res!690888) (not e!584733))))

(assert (=> b!1034398 (= res!690888 (and (or (not ((_ is Cons!21935) lt!456161)) (bvsle (_1!7914 (h!23137 lt!456161)) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21935) lt!456161) (bvslt (_1!7914 (h!23137 lt!456161)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034399 () Bool)

(assert (=> b!1034399 (= e!584733 (containsKey!563 (t!31126 lt!456161) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124195 (not res!690887)) b!1034398))

(assert (= (and b!1034398 res!690888) b!1034399))

(declare-fun m!954253 () Bool)

(assert (=> b!1034399 m!954253))

(assert (=> b!1033761 d!124195))

(declare-fun b!1034400 () Bool)

(declare-fun e!584734 () Option!641)

(assert (=> b!1034400 (= e!584734 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456096)))))))

(declare-fun b!1034403 () Bool)

(declare-fun e!584735 () Option!641)

(assert (=> b!1034403 (= e!584735 None!639)))

(declare-fun b!1034402 () Bool)

(assert (=> b!1034402 (= e!584735 (getValueByKey!590 (t!31126 (toList!6930 lt!456096)) (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))))))

(declare-fun d!124197 () Bool)

(declare-fun c!104608 () Bool)

(assert (=> d!124197 (= c!104608 (and ((_ is Cons!21935) (toList!6930 lt!456096)) (= (_1!7914 (h!23137 (toList!6930 lt!456096))) (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))))))))

(assert (=> d!124197 (= (getValueByKey!590 (toList!6930 lt!456096) (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))) e!584734)))

(declare-fun b!1034401 () Bool)

(assert (=> b!1034401 (= e!584734 e!584735)))

(declare-fun c!104609 () Bool)

(assert (=> b!1034401 (= c!104609 (and ((_ is Cons!21935) (toList!6930 lt!456096)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456096))) (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))))))))

(assert (= (and d!124197 c!104608) b!1034400))

(assert (= (and d!124197 (not c!104608)) b!1034401))

(assert (= (and b!1034401 c!104609) b!1034402))

(assert (= (and b!1034401 (not c!104609)) b!1034403))

(declare-fun m!954255 () Bool)

(assert (=> b!1034402 m!954255))

(assert (=> b!1033670 d!124197))

(assert (=> b!1033778 d!123967))

(assert (=> b!1033778 d!123825))

(assert (=> d!123765 d!123673))

(assert (=> d!123765 d!123675))

(assert (=> d!123765 d!123667))

(assert (=> b!1033713 d!124051))

(declare-fun d!124199 () Bool)

(declare-fun lt!456467 () Bool)

(assert (=> d!124199 (= lt!456467 (select (content!512 (toList!6930 lt!456143)) (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun e!584737 () Bool)

(assert (=> d!124199 (= lt!456467 e!584737)))

(declare-fun res!690890 () Bool)

(assert (=> d!124199 (=> (not res!690890) (not e!584737))))

(assert (=> d!124199 (= res!690890 ((_ is Cons!21935) (toList!6930 lt!456143)))))

(assert (=> d!124199 (= (contains!5994 (toList!6930 lt!456143) (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!456467)))

(declare-fun b!1034404 () Bool)

(declare-fun e!584736 () Bool)

(assert (=> b!1034404 (= e!584737 e!584736)))

(declare-fun res!690889 () Bool)

(assert (=> b!1034404 (=> res!690889 e!584736)))

(assert (=> b!1034404 (= res!690889 (= (h!23137 (toList!6930 lt!456143)) (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034405 () Bool)

(assert (=> b!1034405 (= e!584736 (contains!5994 (t!31126 (toList!6930 lt!456143)) (ite (or c!104353 c!104354) (tuple2!15807 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (= (and d!124199 res!690890) b!1034404))

(assert (= (and b!1034404 (not res!690889)) b!1034405))

(declare-fun m!954257 () Bool)

(assert (=> d!124199 m!954257))

(declare-fun m!954259 () Bool)

(assert (=> d!124199 m!954259))

(declare-fun m!954261 () Bool)

(assert (=> b!1034405 m!954261))

(assert (=> b!1033732 d!124199))

(declare-fun d!124201 () Bool)

(assert (=> d!124201 (= ($colon$colon!604 (removeStrictlySorted!56 (t!31126 (toList!6930 (map!14687 thiss!1427))) key!909) (h!23137 (toList!6930 (map!14687 thiss!1427)))) (Cons!21935 (h!23137 (toList!6930 (map!14687 thiss!1427))) (removeStrictlySorted!56 (t!31126 (toList!6930 (map!14687 thiss!1427))) key!909)))))

(assert (=> b!1033752 d!124201))

(declare-fun b!1034406 () Bool)

(declare-fun e!584740 () List!21939)

(assert (=> b!1034406 (= e!584740 (t!31126 (t!31126 (toList!6930 (map!14687 thiss!1427)))))))

(declare-fun d!124203 () Bool)

(declare-fun e!584739 () Bool)

(assert (=> d!124203 e!584739))

(declare-fun res!690891 () Bool)

(assert (=> d!124203 (=> (not res!690891) (not e!584739))))

(declare-fun lt!456468 () List!21939)

(assert (=> d!124203 (= res!690891 (isStrictlySorted!714 lt!456468))))

(assert (=> d!124203 (= lt!456468 e!584740)))

(declare-fun c!104610 () Bool)

(assert (=> d!124203 (= c!104610 (and ((_ is Cons!21935) (t!31126 (toList!6930 (map!14687 thiss!1427)))) (= (_1!7914 (h!23137 (t!31126 (toList!6930 (map!14687 thiss!1427))))) key!909)))))

(assert (=> d!124203 (isStrictlySorted!714 (t!31126 (toList!6930 (map!14687 thiss!1427))))))

(assert (=> d!124203 (= (removeStrictlySorted!56 (t!31126 (toList!6930 (map!14687 thiss!1427))) key!909) lt!456468)))

(declare-fun b!1034407 () Bool)

(declare-fun e!584738 () List!21939)

(assert (=> b!1034407 (= e!584738 Nil!21936)))

(declare-fun b!1034408 () Bool)

(assert (=> b!1034408 (= e!584740 e!584738)))

(declare-fun c!104611 () Bool)

(assert (=> b!1034408 (= c!104611 (and ((_ is Cons!21935) (t!31126 (toList!6930 (map!14687 thiss!1427)))) (not (= (_1!7914 (h!23137 (t!31126 (toList!6930 (map!14687 thiss!1427))))) key!909))))))

(declare-fun b!1034409 () Bool)

(assert (=> b!1034409 (= e!584738 ($colon$colon!604 (removeStrictlySorted!56 (t!31126 (t!31126 (toList!6930 (map!14687 thiss!1427)))) key!909) (h!23137 (t!31126 (toList!6930 (map!14687 thiss!1427))))))))

(declare-fun b!1034410 () Bool)

(assert (=> b!1034410 (= e!584739 (not (containsKey!563 lt!456468 key!909)))))

(assert (= (and d!124203 c!104610) b!1034406))

(assert (= (and d!124203 (not c!104610)) b!1034408))

(assert (= (and b!1034408 c!104611) b!1034409))

(assert (= (and b!1034408 (not c!104611)) b!1034407))

(assert (= (and d!124203 res!690891) b!1034410))

(declare-fun m!954263 () Bool)

(assert (=> d!124203 m!954263))

(assert (=> d!124203 m!953781))

(declare-fun m!954265 () Bool)

(assert (=> b!1034409 m!954265))

(assert (=> b!1034409 m!954265))

(declare-fun m!954267 () Bool)

(assert (=> b!1034409 m!954267))

(declare-fun m!954269 () Bool)

(assert (=> b!1034410 m!954269))

(assert (=> b!1033752 d!124203))

(declare-fun d!124205 () Bool)

(assert (=> d!124205 (= (get!16429 (getValueByKey!590 (toList!6930 lt!456028) lt!456019)) (v!14888 (getValueByKey!590 (toList!6930 lt!456028) lt!456019)))))

(assert (=> d!123699 d!124205))

(declare-fun b!1034411 () Bool)

(declare-fun e!584741 () Option!641)

(assert (=> b!1034411 (= e!584741 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456028)))))))

(declare-fun b!1034414 () Bool)

(declare-fun e!584742 () Option!641)

(assert (=> b!1034414 (= e!584742 None!639)))

(declare-fun b!1034413 () Bool)

(assert (=> b!1034413 (= e!584742 (getValueByKey!590 (t!31126 (toList!6930 lt!456028)) lt!456019))))

(declare-fun d!124207 () Bool)

(declare-fun c!104612 () Bool)

(assert (=> d!124207 (= c!104612 (and ((_ is Cons!21935) (toList!6930 lt!456028)) (= (_1!7914 (h!23137 (toList!6930 lt!456028))) lt!456019)))))

(assert (=> d!124207 (= (getValueByKey!590 (toList!6930 lt!456028) lt!456019) e!584741)))

(declare-fun b!1034412 () Bool)

(assert (=> b!1034412 (= e!584741 e!584742)))

(declare-fun c!104613 () Bool)

(assert (=> b!1034412 (= c!104613 (and ((_ is Cons!21935) (toList!6930 lt!456028)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456028))) lt!456019))))))

(assert (= (and d!124207 c!104612) b!1034411))

(assert (= (and d!124207 (not c!104612)) b!1034412))

(assert (= (and b!1034412 c!104613) b!1034413))

(assert (= (and b!1034412 (not c!104613)) b!1034414))

(declare-fun m!954271 () Bool)

(assert (=> b!1034413 m!954271))

(assert (=> d!123699 d!124207))

(declare-fun d!124209 () Bool)

(assert (=> d!124209 (= (get!16429 (getValueByKey!590 (toList!6930 lt!456003) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14888 (getValueByKey!590 (toList!6930 lt!456003) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123769 d!124209))

(assert (=> d!123769 d!123955))

(assert (=> b!1033813 d!123837))

(declare-fun d!124211 () Bool)

(declare-fun res!690892 () Bool)

(declare-fun e!584743 () Bool)

(assert (=> d!124211 (=> res!690892 e!584743)))

(assert (=> d!124211 (= res!690892 (and ((_ is Cons!21935) (toList!6930 lt!456029)) (= (_1!7914 (h!23137 (toList!6930 lt!456029))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124211 (= (containsKey!563 (toList!6930 lt!456029) #b1000000000000000000000000000000000000000000000000000000000000000) e!584743)))

(declare-fun b!1034415 () Bool)

(declare-fun e!584744 () Bool)

(assert (=> b!1034415 (= e!584743 e!584744)))

(declare-fun res!690893 () Bool)

(assert (=> b!1034415 (=> (not res!690893) (not e!584744))))

(assert (=> b!1034415 (= res!690893 (and (or (not ((_ is Cons!21935) (toList!6930 lt!456029))) (bvsle (_1!7914 (h!23137 (toList!6930 lt!456029))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21935) (toList!6930 lt!456029)) (bvslt (_1!7914 (h!23137 (toList!6930 lt!456029))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034416 () Bool)

(assert (=> b!1034416 (= e!584744 (containsKey!563 (t!31126 (toList!6930 lt!456029)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124211 (not res!690892)) b!1034415))

(assert (= (and b!1034415 res!690893) b!1034416))

(declare-fun m!954273 () Bool)

(assert (=> b!1034416 m!954273))

(assert (=> d!123767 d!124211))

(declare-fun d!124213 () Bool)

(declare-fun e!584745 () Bool)

(assert (=> d!124213 e!584745))

(declare-fun res!690894 () Bool)

(assert (=> d!124213 (=> res!690894 e!584745)))

(declare-fun lt!456469 () Bool)

(assert (=> d!124213 (= res!690894 (not lt!456469))))

(declare-fun lt!456472 () Bool)

(assert (=> d!124213 (= lt!456469 lt!456472)))

(declare-fun lt!456471 () Unit!33713)

(declare-fun e!584746 () Unit!33713)

(assert (=> d!124213 (= lt!456471 e!584746)))

(declare-fun c!104614 () Bool)

(assert (=> d!124213 (= c!104614 lt!456472)))

(assert (=> d!124213 (= lt!456472 (containsKey!563 (toList!6930 lt!456115) (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))))))

(assert (=> d!124213 (= (contains!5992 lt!456115 (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))) lt!456469)))

(declare-fun b!1034417 () Bool)

(declare-fun lt!456470 () Unit!33713)

(assert (=> b!1034417 (= e!584746 lt!456470)))

(assert (=> b!1034417 (= lt!456470 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456115) (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))))))

(assert (=> b!1034417 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456115) (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034418 () Bool)

(declare-fun Unit!33756 () Unit!33713)

(assert (=> b!1034418 (= e!584746 Unit!33756)))

(declare-fun b!1034419 () Bool)

(assert (=> b!1034419 (= e!584745 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456115) (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124213 c!104614) b!1034417))

(assert (= (and d!124213 (not c!104614)) b!1034418))

(assert (= (and d!124213 (not res!690894)) b!1034419))

(declare-fun m!954275 () Bool)

(assert (=> d!124213 m!954275))

(declare-fun m!954277 () Bool)

(assert (=> b!1034417 m!954277))

(assert (=> b!1034417 m!953037))

(assert (=> b!1034417 m!953037))

(declare-fun m!954279 () Bool)

(assert (=> b!1034417 m!954279))

(assert (=> b!1034419 m!953037))

(assert (=> b!1034419 m!953037))

(assert (=> b!1034419 m!954279))

(assert (=> d!123731 d!124213))

(declare-fun b!1034420 () Bool)

(declare-fun e!584747 () Option!641)

(assert (=> b!1034420 (= e!584747 (Some!640 (_2!7914 (h!23137 lt!456117))))))

(declare-fun b!1034423 () Bool)

(declare-fun e!584748 () Option!641)

(assert (=> b!1034423 (= e!584748 None!639)))

(declare-fun b!1034422 () Bool)

(assert (=> b!1034422 (= e!584748 (getValueByKey!590 (t!31126 lt!456117) (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))))))

(declare-fun d!124215 () Bool)

(declare-fun c!104615 () Bool)

(assert (=> d!124215 (= c!104615 (and ((_ is Cons!21935) lt!456117) (= (_1!7914 (h!23137 lt!456117)) (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))))))))

(assert (=> d!124215 (= (getValueByKey!590 lt!456117 (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))) e!584747)))

(declare-fun b!1034421 () Bool)

(assert (=> b!1034421 (= e!584747 e!584748)))

(declare-fun c!104616 () Bool)

(assert (=> b!1034421 (= c!104616 (and ((_ is Cons!21935) lt!456117) (not (= (_1!7914 (h!23137 lt!456117)) (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!124215 c!104615) b!1034420))

(assert (= (and d!124215 (not c!104615)) b!1034421))

(assert (= (and b!1034421 c!104616) b!1034422))

(assert (= (and b!1034421 (not c!104616)) b!1034423))

(declare-fun m!954281 () Bool)

(assert (=> b!1034422 m!954281))

(assert (=> d!123731 d!124215))

(declare-fun d!124217 () Bool)

(assert (=> d!124217 (= (getValueByKey!590 lt!456117 (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456473 () Unit!33713)

(assert (=> d!124217 (= lt!456473 (choose!1707 lt!456117 (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))))))

(declare-fun e!584749 () Bool)

(assert (=> d!124217 e!584749))

(declare-fun res!690895 () Bool)

(assert (=> d!124217 (=> (not res!690895) (not e!584749))))

(assert (=> d!124217 (= res!690895 (isStrictlySorted!714 lt!456117))))

(assert (=> d!124217 (= (lemmaContainsTupThenGetReturnValue!280 lt!456117 (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))) lt!456473)))

(declare-fun b!1034424 () Bool)

(declare-fun res!690896 () Bool)

(assert (=> b!1034424 (=> (not res!690896) (not e!584749))))

(assert (=> b!1034424 (= res!690896 (containsKey!563 lt!456117 (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034425 () Bool)

(assert (=> b!1034425 (= e!584749 (contains!5994 lt!456117 (tuple2!15807 (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124217 res!690895) b!1034424))

(assert (= (and b!1034424 res!690896) b!1034425))

(assert (=> d!124217 m!953031))

(declare-fun m!954283 () Bool)

(assert (=> d!124217 m!954283))

(declare-fun m!954285 () Bool)

(assert (=> d!124217 m!954285))

(declare-fun m!954287 () Bool)

(assert (=> b!1034424 m!954287))

(declare-fun m!954289 () Bool)

(assert (=> b!1034425 m!954289))

(assert (=> d!123731 d!124217))

(declare-fun e!584751 () Bool)

(declare-fun lt!456474 () List!21939)

(declare-fun b!1034426 () Bool)

(assert (=> b!1034426 (= e!584751 (contains!5994 lt!456474 (tuple2!15807 (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))))))))

(declare-fun b!1034427 () Bool)

(declare-fun e!584753 () List!21939)

(declare-fun call!43717 () List!21939)

(assert (=> b!1034427 (= e!584753 call!43717)))

(declare-fun c!104620 () Bool)

(declare-fun b!1034428 () Bool)

(declare-fun c!104618 () Bool)

(declare-fun e!584750 () List!21939)

(assert (=> b!1034428 (= e!584750 (ite c!104620 (t!31126 (toList!6930 lt!455983)) (ite c!104618 (Cons!21935 (h!23137 (toList!6930 lt!455983)) (t!31126 (toList!6930 lt!455983))) Nil!21936)))))

(declare-fun b!1034429 () Bool)

(declare-fun res!690898 () Bool)

(assert (=> b!1034429 (=> (not res!690898) (not e!584751))))

(assert (=> b!1034429 (= res!690898 (containsKey!563 lt!456474 (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034430 () Bool)

(declare-fun e!584754 () List!21939)

(declare-fun call!43719 () List!21939)

(assert (=> b!1034430 (= e!584754 call!43719)))

(declare-fun bm!43714 () Bool)

(declare-fun call!43718 () List!21939)

(assert (=> bm!43714 (= call!43719 call!43718)))

(declare-fun b!1034431 () Bool)

(declare-fun e!584752 () List!21939)

(assert (=> b!1034431 (= e!584753 e!584752)))

(assert (=> b!1034431 (= c!104620 (and ((_ is Cons!21935) (toList!6930 lt!455983)) (= (_1!7914 (h!23137 (toList!6930 lt!455983))) (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))))))))

(declare-fun b!1034432 () Bool)

(assert (=> b!1034432 (= e!584754 call!43719)))

(declare-fun b!1034433 () Bool)

(assert (=> b!1034433 (= e!584752 call!43718)))

(declare-fun d!124219 () Bool)

(assert (=> d!124219 e!584751))

(declare-fun res!690897 () Bool)

(assert (=> d!124219 (=> (not res!690897) (not e!584751))))

(assert (=> d!124219 (= res!690897 (isStrictlySorted!714 lt!456474))))

(assert (=> d!124219 (= lt!456474 e!584753)))

(declare-fun c!104617 () Bool)

(assert (=> d!124219 (= c!104617 (and ((_ is Cons!21935) (toList!6930 lt!455983)) (bvslt (_1!7914 (h!23137 (toList!6930 lt!455983))) (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))))))))

(assert (=> d!124219 (isStrictlySorted!714 (toList!6930 lt!455983))))

(assert (=> d!124219 (= (insertStrictlySorted!373 (toList!6930 lt!455983) (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))) lt!456474)))

(declare-fun bm!43715 () Bool)

(assert (=> bm!43715 (= call!43718 call!43717)))

(declare-fun bm!43716 () Bool)

(assert (=> bm!43716 (= call!43717 ($colon$colon!604 e!584750 (ite c!104617 (h!23137 (toList!6930 lt!455983)) (tuple2!15807 (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))))))))

(declare-fun c!104619 () Bool)

(assert (=> bm!43716 (= c!104619 c!104617)))

(declare-fun b!1034434 () Bool)

(assert (=> b!1034434 (= e!584750 (insertStrictlySorted!373 (t!31126 (toList!6930 lt!455983)) (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427)))))))

(declare-fun b!1034435 () Bool)

(assert (=> b!1034435 (= c!104618 (and ((_ is Cons!21935) (toList!6930 lt!455983)) (bvsgt (_1!7914 (h!23137 (toList!6930 lt!455983))) (_1!7914 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))))))))

(assert (=> b!1034435 (= e!584752 e!584754)))

(assert (= (and d!124219 c!104617) b!1034427))

(assert (= (and d!124219 (not c!104617)) b!1034431))

(assert (= (and b!1034431 c!104620) b!1034433))

(assert (= (and b!1034431 (not c!104620)) b!1034435))

(assert (= (and b!1034435 c!104618) b!1034430))

(assert (= (and b!1034435 (not c!104618)) b!1034432))

(assert (= (or b!1034430 b!1034432) bm!43714))

(assert (= (or b!1034433 bm!43714) bm!43715))

(assert (= (or b!1034427 bm!43715) bm!43716))

(assert (= (and bm!43716 c!104619) b!1034434))

(assert (= (and bm!43716 (not c!104619)) b!1034428))

(assert (= (and d!124219 res!690897) b!1034429))

(assert (= (and b!1034429 res!690898) b!1034426))

(declare-fun m!954291 () Bool)

(assert (=> b!1034434 m!954291))

(declare-fun m!954293 () Bool)

(assert (=> d!124219 m!954293))

(declare-fun m!954295 () Bool)

(assert (=> d!124219 m!954295))

(declare-fun m!954297 () Bool)

(assert (=> b!1034426 m!954297))

(declare-fun m!954299 () Bool)

(assert (=> b!1034429 m!954299))

(declare-fun m!954301 () Bool)

(assert (=> bm!43716 m!954301))

(assert (=> d!123731 d!124219))

(declare-fun d!124221 () Bool)

(declare-fun lt!456475 () Bool)

(assert (=> d!124221 (= lt!456475 (select (content!512 (toList!6930 lt!456179)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(declare-fun e!584756 () Bool)

(assert (=> d!124221 (= lt!456475 e!584756)))

(declare-fun res!690900 () Bool)

(assert (=> d!124221 (=> (not res!690900) (not e!584756))))

(assert (=> d!124221 (= res!690900 ((_ is Cons!21935) (toList!6930 lt!456179)))))

(assert (=> d!124221 (= (contains!5994 (toList!6930 lt!456179) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) lt!456475)))

(declare-fun b!1034436 () Bool)

(declare-fun e!584755 () Bool)

(assert (=> b!1034436 (= e!584756 e!584755)))

(declare-fun res!690899 () Bool)

(assert (=> b!1034436 (=> res!690899 e!584755)))

(assert (=> b!1034436 (= res!690899 (= (h!23137 (toList!6930 lt!456179)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(declare-fun b!1034437 () Bool)

(assert (=> b!1034437 (= e!584755 (contains!5994 (t!31126 (toList!6930 lt!456179)) (tuple2!15807 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(assert (= (and d!124221 res!690900) b!1034436))

(assert (= (and b!1034436 (not res!690899)) b!1034437))

(declare-fun m!954303 () Bool)

(assert (=> d!124221 m!954303))

(declare-fun m!954305 () Bool)

(assert (=> d!124221 m!954305))

(declare-fun m!954307 () Bool)

(assert (=> b!1034437 m!954307))

(assert (=> b!1033775 d!124221))

(declare-fun d!124223 () Bool)

(assert (=> d!124223 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456029) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun lt!456476 () Unit!33713)

(assert (=> d!124223 (= lt!456476 (choose!1706 (toList!6930 lt!456029) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!584757 () Bool)

(assert (=> d!124223 e!584757))

(declare-fun res!690901 () Bool)

(assert (=> d!124223 (=> (not res!690901) (not e!584757))))

(assert (=> d!124223 (= res!690901 (isStrictlySorted!714 (toList!6930 lt!456029)))))

(assert (=> d!124223 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456029) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)) lt!456476)))

(declare-fun b!1034438 () Bool)

(assert (=> b!1034438 (= e!584757 (containsKey!563 (toList!6930 lt!456029) (select (arr!31320 (_keys!11402 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124223 res!690901) b!1034438))

(assert (=> d!124223 m!952763))

(assert (=> d!124223 m!953221))

(assert (=> d!124223 m!953221))

(assert (=> d!124223 m!953223))

(assert (=> d!124223 m!952763))

(declare-fun m!954309 () Bool)

(assert (=> d!124223 m!954309))

(assert (=> d!124223 m!954247))

(assert (=> b!1034438 m!952763))

(assert (=> b!1034438 m!953217))

(assert (=> b!1033771 d!124223))

(assert (=> b!1033771 d!123949))

(assert (=> b!1033771 d!123813))

(declare-fun d!124225 () Bool)

(declare-fun e!584758 () Bool)

(assert (=> d!124225 e!584758))

(declare-fun res!690902 () Bool)

(assert (=> d!124225 (=> res!690902 e!584758)))

(declare-fun lt!456477 () Bool)

(assert (=> d!124225 (= res!690902 (not lt!456477))))

(declare-fun lt!456480 () Bool)

(assert (=> d!124225 (= lt!456477 lt!456480)))

(declare-fun lt!456479 () Unit!33713)

(declare-fun e!584759 () Unit!33713)

(assert (=> d!124225 (= lt!456479 e!584759)))

(declare-fun c!104621 () Bool)

(assert (=> d!124225 (= c!104621 lt!456480)))

(assert (=> d!124225 (= lt!456480 (containsKey!563 (toList!6930 lt!456207) (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)))))

(assert (=> d!124225 (= (contains!5992 lt!456207 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)) lt!456477)))

(declare-fun b!1034439 () Bool)

(declare-fun lt!456478 () Unit!33713)

(assert (=> b!1034439 (= e!584759 lt!456478)))

(assert (=> b!1034439 (= lt!456478 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456207) (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)))))

(assert (=> b!1034439 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456207) (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)))))

(declare-fun b!1034440 () Bool)

(declare-fun Unit!33757 () Unit!33713)

(assert (=> b!1034440 (= e!584759 Unit!33757)))

(declare-fun b!1034441 () Bool)

(assert (=> b!1034441 (= e!584758 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456207) (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000))))))

(assert (= (and d!124225 c!104621) b!1034439))

(assert (= (and d!124225 (not c!104621)) b!1034440))

(assert (= (and d!124225 (not res!690902)) b!1034441))

(assert (=> d!124225 m!953267))

(declare-fun m!954311 () Bool)

(assert (=> d!124225 m!954311))

(assert (=> b!1034439 m!953267))

(declare-fun m!954313 () Bool)

(assert (=> b!1034439 m!954313))

(assert (=> b!1034439 m!953267))

(assert (=> b!1034439 m!953717))

(assert (=> b!1034439 m!953717))

(declare-fun m!954315 () Bool)

(assert (=> b!1034439 m!954315))

(assert (=> b!1034441 m!953267))

(assert (=> b!1034441 m!953717))

(assert (=> b!1034441 m!953717))

(assert (=> b!1034441 m!954315))

(assert (=> b!1033790 d!124225))

(assert (=> d!123739 d!123731))

(assert (=> d!123739 d!123751))

(assert (=> d!123739 d!123757))

(declare-fun d!124227 () Bool)

(declare-fun e!584760 () Bool)

(assert (=> d!124227 e!584760))

(declare-fun res!690903 () Bool)

(assert (=> d!124227 (=> res!690903 e!584760)))

(declare-fun lt!456481 () Bool)

(assert (=> d!124227 (= res!690903 (not lt!456481))))

(declare-fun lt!456484 () Bool)

(assert (=> d!124227 (= lt!456481 lt!456484)))

(declare-fun lt!456483 () Unit!33713)

(declare-fun e!584761 () Unit!33713)

(assert (=> d!124227 (= lt!456483 e!584761)))

(declare-fun c!104622 () Bool)

(assert (=> d!124227 (= c!104622 lt!456484)))

(assert (=> d!124227 (= lt!456484 (containsKey!563 (toList!6930 lt!455983) lt!455987))))

(assert (=> d!124227 (= (contains!5992 lt!455983 lt!455987) lt!456481)))

(declare-fun b!1034442 () Bool)

(declare-fun lt!456482 () Unit!33713)

(assert (=> b!1034442 (= e!584761 lt!456482)))

(assert (=> b!1034442 (= lt!456482 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!455983) lt!455987))))

(assert (=> b!1034442 (isDefined!438 (getValueByKey!590 (toList!6930 lt!455983) lt!455987))))

(declare-fun b!1034443 () Bool)

(declare-fun Unit!33758 () Unit!33713)

(assert (=> b!1034443 (= e!584761 Unit!33758)))

(declare-fun b!1034444 () Bool)

(assert (=> b!1034444 (= e!584760 (isDefined!438 (getValueByKey!590 (toList!6930 lt!455983) lt!455987)))))

(assert (= (and d!124227 c!104622) b!1034442))

(assert (= (and d!124227 (not c!104622)) b!1034443))

(assert (= (and d!124227 (not res!690903)) b!1034444))

(declare-fun m!954317 () Bool)

(assert (=> d!124227 m!954317))

(declare-fun m!954319 () Bool)

(assert (=> b!1034442 m!954319))

(assert (=> b!1034442 m!953101))

(assert (=> b!1034442 m!953101))

(declare-fun m!954321 () Bool)

(assert (=> b!1034442 m!954321))

(assert (=> b!1034444 m!953101))

(assert (=> b!1034444 m!953101))

(assert (=> b!1034444 m!954321))

(assert (=> d!123739 d!124227))

(declare-fun d!124229 () Bool)

(assert (=> d!124229 (= (apply!899 (+!3130 lt!455983 (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))) lt!455987) (apply!899 lt!455983 lt!455987))))

(assert (=> d!124229 true))

(declare-fun _$34!1169 () Unit!33713)

(assert (=> d!124229 (= (choose!1705 lt!455983 lt!455989 (minValue!6062 thiss!1427) lt!455987) _$34!1169)))

(declare-fun bs!30240 () Bool)

(assert (= bs!30240 d!124229))

(assert (=> bs!30240 m!952753))

(assert (=> bs!30240 m!952753))

(assert (=> bs!30240 m!952755))

(assert (=> bs!30240 m!952747))

(assert (=> d!123739 d!124229))

(declare-fun lt!456485 () Bool)

(declare-fun d!124231 () Bool)

(assert (=> d!124231 (= lt!456485 (select (content!512 (toList!6930 lt!456120)) (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))))))

(declare-fun e!584763 () Bool)

(assert (=> d!124231 (= lt!456485 e!584763)))

(declare-fun res!690905 () Bool)

(assert (=> d!124231 (=> (not res!690905) (not e!584763))))

(assert (=> d!124231 (= res!690905 ((_ is Cons!21935) (toList!6930 lt!456120)))))

(assert (=> d!124231 (= (contains!5994 (toList!6930 lt!456120) (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))) lt!456485)))

(declare-fun b!1034445 () Bool)

(declare-fun e!584762 () Bool)

(assert (=> b!1034445 (= e!584763 e!584762)))

(declare-fun res!690904 () Bool)

(assert (=> b!1034445 (=> res!690904 e!584762)))

(assert (=> b!1034445 (= res!690904 (= (h!23137 (toList!6930 lt!456120)) (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))))))

(declare-fun b!1034446 () Bool)

(assert (=> b!1034446 (= e!584762 (contains!5994 (t!31126 (toList!6930 lt!456120)) (tuple2!15807 lt!456001 (minValue!6062 thiss!1427))))))

(assert (= (and d!124231 res!690905) b!1034445))

(assert (= (and b!1034445 (not res!690904)) b!1034446))

(declare-fun m!954323 () Bool)

(assert (=> d!124231 m!954323))

(declare-fun m!954325 () Bool)

(assert (=> d!124231 m!954325))

(declare-fun m!954327 () Bool)

(assert (=> b!1034446 m!954327))

(assert (=> b!1033719 d!124231))

(declare-fun d!124233 () Bool)

(assert (=> d!124233 (= (get!16429 (getValueByKey!590 (toList!6930 lt!455996) lt!455994)) (v!14888 (getValueByKey!590 (toList!6930 lt!455996) lt!455994)))))

(assert (=> d!123747 d!124233))

(declare-fun b!1034447 () Bool)

(declare-fun e!584764 () Option!641)

(assert (=> b!1034447 (= e!584764 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!455996)))))))

(declare-fun b!1034450 () Bool)

(declare-fun e!584765 () Option!641)

(assert (=> b!1034450 (= e!584765 None!639)))

(declare-fun b!1034449 () Bool)

(assert (=> b!1034449 (= e!584765 (getValueByKey!590 (t!31126 (toList!6930 lt!455996)) lt!455994))))

(declare-fun d!124235 () Bool)

(declare-fun c!104623 () Bool)

(assert (=> d!124235 (= c!104623 (and ((_ is Cons!21935) (toList!6930 lt!455996)) (= (_1!7914 (h!23137 (toList!6930 lt!455996))) lt!455994)))))

(assert (=> d!124235 (= (getValueByKey!590 (toList!6930 lt!455996) lt!455994) e!584764)))

(declare-fun b!1034448 () Bool)

(assert (=> b!1034448 (= e!584764 e!584765)))

(declare-fun c!104624 () Bool)

(assert (=> b!1034448 (= c!104624 (and ((_ is Cons!21935) (toList!6930 lt!455996)) (not (= (_1!7914 (h!23137 (toList!6930 lt!455996))) lt!455994))))))

(assert (= (and d!124235 c!104623) b!1034447))

(assert (= (and d!124235 (not c!104623)) b!1034448))

(assert (= (and b!1034448 c!104624) b!1034449))

(assert (= (and b!1034448 (not c!104624)) b!1034450))

(declare-fun m!954329 () Bool)

(assert (=> b!1034449 m!954329))

(assert (=> d!123747 d!124235))

(declare-fun d!124237 () Bool)

(declare-fun e!584766 () Bool)

(assert (=> d!124237 e!584766))

(declare-fun res!690906 () Bool)

(assert (=> d!124237 (=> res!690906 e!584766)))

(declare-fun lt!456486 () Bool)

(assert (=> d!124237 (= res!690906 (not lt!456486))))

(declare-fun lt!456489 () Bool)

(assert (=> d!124237 (= lt!456486 lt!456489)))

(declare-fun lt!456488 () Unit!33713)

(declare-fun e!584767 () Unit!33713)

(assert (=> d!124237 (= lt!456488 e!584767)))

(declare-fun c!104625 () Bool)

(assert (=> d!124237 (= c!104625 lt!456489)))

(assert (=> d!124237 (= lt!456489 (containsKey!563 (toList!6930 lt!456096) (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))))))

(assert (=> d!124237 (= (contains!5992 lt!456096 (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))) lt!456486)))

(declare-fun b!1034451 () Bool)

(declare-fun lt!456487 () Unit!33713)

(assert (=> b!1034451 (= e!584767 lt!456487)))

(assert (=> b!1034451 (= lt!456487 (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456096) (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))))))

(assert (=> b!1034451 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456096) (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))))))

(declare-fun b!1034452 () Bool)

(declare-fun Unit!33759 () Unit!33713)

(assert (=> b!1034452 (= e!584767 Unit!33759)))

(declare-fun b!1034453 () Bool)

(assert (=> b!1034453 (= e!584766 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456096) (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))))))))

(assert (= (and d!124237 c!104625) b!1034451))

(assert (= (and d!124237 (not c!104625)) b!1034452))

(assert (= (and d!124237 (not res!690906)) b!1034453))

(declare-fun m!954331 () Bool)

(assert (=> d!124237 m!954331))

(declare-fun m!954333 () Bool)

(assert (=> b!1034451 m!954333))

(assert (=> b!1034451 m!952969))

(assert (=> b!1034451 m!952969))

(declare-fun m!954335 () Bool)

(assert (=> b!1034451 m!954335))

(assert (=> b!1034453 m!952969))

(assert (=> b!1034453 m!952969))

(assert (=> b!1034453 m!954335))

(assert (=> d!123709 d!124237))

(declare-fun b!1034454 () Bool)

(declare-fun e!584768 () Option!641)

(assert (=> b!1034454 (= e!584768 (Some!640 (_2!7914 (h!23137 lt!456098))))))

(declare-fun b!1034457 () Bool)

(declare-fun e!584769 () Option!641)

(assert (=> b!1034457 (= e!584769 None!639)))

(declare-fun b!1034456 () Bool)

(assert (=> b!1034456 (= e!584769 (getValueByKey!590 (t!31126 lt!456098) (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))))))

(declare-fun c!104626 () Bool)

(declare-fun d!124239 () Bool)

(assert (=> d!124239 (= c!104626 (and ((_ is Cons!21935) lt!456098) (= (_1!7914 (h!23137 lt!456098)) (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))))))))

(assert (=> d!124239 (= (getValueByKey!590 lt!456098 (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))) e!584768)))

(declare-fun b!1034455 () Bool)

(assert (=> b!1034455 (= e!584768 e!584769)))

(declare-fun c!104627 () Bool)

(assert (=> b!1034455 (= c!104627 (and ((_ is Cons!21935) lt!456098) (not (= (_1!7914 (h!23137 lt!456098)) (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))))))))

(assert (= (and d!124239 c!104626) b!1034454))

(assert (= (and d!124239 (not c!104626)) b!1034455))

(assert (= (and b!1034455 c!104627) b!1034456))

(assert (= (and b!1034455 (not c!104627)) b!1034457))

(declare-fun m!954337 () Bool)

(assert (=> b!1034456 m!954337))

(assert (=> d!123709 d!124239))

(declare-fun d!124241 () Bool)

(assert (=> d!124241 (= (getValueByKey!590 lt!456098 (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))) (Some!640 (_2!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))))))

(declare-fun lt!456490 () Unit!33713)

(assert (=> d!124241 (= lt!456490 (choose!1707 lt!456098 (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))))))

(declare-fun e!584770 () Bool)

(assert (=> d!124241 e!584770))

(declare-fun res!690907 () Bool)

(assert (=> d!124241 (=> (not res!690907) (not e!584770))))

(assert (=> d!124241 (= res!690907 (isStrictlySorted!714 lt!456098))))

(assert (=> d!124241 (= (lemmaContainsTupThenGetReturnValue!280 lt!456098 (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))) lt!456490)))

(declare-fun b!1034458 () Bool)

(declare-fun res!690908 () Bool)

(assert (=> b!1034458 (=> (not res!690908) (not e!584770))))

(assert (=> b!1034458 (= res!690908 (containsKey!563 lt!456098 (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))))))

(declare-fun b!1034459 () Bool)

(assert (=> b!1034459 (= e!584770 (contains!5994 lt!456098 (tuple2!15807 (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))))))))

(assert (= (and d!124241 res!690907) b!1034458))

(assert (= (and b!1034458 res!690908) b!1034459))

(assert (=> d!124241 m!952963))

(declare-fun m!954339 () Bool)

(assert (=> d!124241 m!954339))

(declare-fun m!954341 () Bool)

(assert (=> d!124241 m!954341))

(declare-fun m!954343 () Bool)

(assert (=> b!1034458 m!954343))

(declare-fun m!954345 () Bool)

(assert (=> b!1034459 m!954345))

(assert (=> d!123709 d!124241))

(declare-fun b!1034460 () Bool)

(declare-fun lt!456491 () List!21939)

(declare-fun e!584772 () Bool)

(assert (=> b!1034460 (= e!584772 (contains!5994 lt!456491 (tuple2!15807 (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))))))))

(declare-fun b!1034461 () Bool)

(declare-fun e!584774 () List!21939)

(declare-fun call!43720 () List!21939)

(assert (=> b!1034461 (= e!584774 call!43720)))

(declare-fun c!104629 () Bool)

(declare-fun e!584771 () List!21939)

(declare-fun c!104631 () Bool)

(declare-fun b!1034462 () Bool)

(assert (=> b!1034462 (= e!584771 (ite c!104631 (t!31126 (toList!6930 lt!456022)) (ite c!104629 (Cons!21935 (h!23137 (toList!6930 lt!456022)) (t!31126 (toList!6930 lt!456022))) Nil!21936)))))

(declare-fun b!1034463 () Bool)

(declare-fun res!690910 () Bool)

(assert (=> b!1034463 (=> (not res!690910) (not e!584772))))

(assert (=> b!1034463 (= res!690910 (containsKey!563 lt!456491 (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))))))

(declare-fun b!1034464 () Bool)

(declare-fun e!584775 () List!21939)

(declare-fun call!43722 () List!21939)

(assert (=> b!1034464 (= e!584775 call!43722)))

(declare-fun bm!43717 () Bool)

(declare-fun call!43721 () List!21939)

(assert (=> bm!43717 (= call!43722 call!43721)))

(declare-fun b!1034465 () Bool)

(declare-fun e!584773 () List!21939)

(assert (=> b!1034465 (= e!584774 e!584773)))

(assert (=> b!1034465 (= c!104631 (and ((_ is Cons!21935) (toList!6930 lt!456022)) (= (_1!7914 (h!23137 (toList!6930 lt!456022))) (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))))))))

(declare-fun b!1034466 () Bool)

(assert (=> b!1034466 (= e!584775 call!43722)))

(declare-fun b!1034467 () Bool)

(assert (=> b!1034467 (= e!584773 call!43721)))

(declare-fun d!124243 () Bool)

(assert (=> d!124243 e!584772))

(declare-fun res!690909 () Bool)

(assert (=> d!124243 (=> (not res!690909) (not e!584772))))

(assert (=> d!124243 (= res!690909 (isStrictlySorted!714 lt!456491))))

(assert (=> d!124243 (= lt!456491 e!584774)))

(declare-fun c!104628 () Bool)

(assert (=> d!124243 (= c!104628 (and ((_ is Cons!21935) (toList!6930 lt!456022)) (bvslt (_1!7914 (h!23137 (toList!6930 lt!456022))) (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))))))))

(assert (=> d!124243 (isStrictlySorted!714 (toList!6930 lt!456022))))

(assert (=> d!124243 (= (insertStrictlySorted!373 (toList!6930 lt!456022) (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))) lt!456491)))

(declare-fun bm!43718 () Bool)

(assert (=> bm!43718 (= call!43721 call!43720)))

(declare-fun bm!43719 () Bool)

(assert (=> bm!43719 (= call!43720 ($colon$colon!604 e!584771 (ite c!104628 (h!23137 (toList!6930 lt!456022)) (tuple2!15807 (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))))))))

(declare-fun c!104630 () Bool)

(assert (=> bm!43719 (= c!104630 c!104628)))

(declare-fun b!1034468 () Bool)

(assert (=> b!1034468 (= e!584771 (insertStrictlySorted!373 (t!31126 (toList!6930 lt!456022)) (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))) (_2!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427)))))))

(declare-fun b!1034469 () Bool)

(assert (=> b!1034469 (= c!104629 (and ((_ is Cons!21935) (toList!6930 lt!456022)) (bvsgt (_1!7914 (h!23137 (toList!6930 lt!456022))) (_1!7914 (tuple2!15807 lt!456017 (zeroValue!6062 thiss!1427))))))))

(assert (=> b!1034469 (= e!584773 e!584775)))

(assert (= (and d!124243 c!104628) b!1034461))

(assert (= (and d!124243 (not c!104628)) b!1034465))

(assert (= (and b!1034465 c!104631) b!1034467))

(assert (= (and b!1034465 (not c!104631)) b!1034469))

(assert (= (and b!1034469 c!104629) b!1034464))

(assert (= (and b!1034469 (not c!104629)) b!1034466))

(assert (= (or b!1034464 b!1034466) bm!43717))

(assert (= (or b!1034467 bm!43717) bm!43718))

(assert (= (or b!1034461 bm!43718) bm!43719))

(assert (= (and bm!43719 c!104630) b!1034468))

(assert (= (and bm!43719 (not c!104630)) b!1034462))

(assert (= (and d!124243 res!690909) b!1034463))

(assert (= (and b!1034463 res!690910) b!1034460))

(declare-fun m!954347 () Bool)

(assert (=> b!1034468 m!954347))

(declare-fun m!954349 () Bool)

(assert (=> d!124243 m!954349))

(declare-fun m!954351 () Bool)

(assert (=> d!124243 m!954351))

(declare-fun m!954353 () Bool)

(assert (=> b!1034460 m!954353))

(declare-fun m!954355 () Bool)

(assert (=> b!1034463 m!954355))

(declare-fun m!954357 () Bool)

(assert (=> bm!43719 m!954357))

(assert (=> d!123709 d!124243))

(assert (=> d!123725 d!123681))

(declare-fun d!124245 () Bool)

(assert (=> d!124245 (= (get!16429 (getValueByKey!590 (toList!6930 lt!456022) lt!456020)) (v!14888 (getValueByKey!590 (toList!6930 lt!456022) lt!456020)))))

(assert (=> d!123717 d!124245))

(declare-fun b!1034470 () Bool)

(declare-fun e!584776 () Option!641)

(assert (=> b!1034470 (= e!584776 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!456022)))))))

(declare-fun b!1034473 () Bool)

(declare-fun e!584777 () Option!641)

(assert (=> b!1034473 (= e!584777 None!639)))

(declare-fun b!1034472 () Bool)

(assert (=> b!1034472 (= e!584777 (getValueByKey!590 (t!31126 (toList!6930 lt!456022)) lt!456020))))

(declare-fun d!124247 () Bool)

(declare-fun c!104632 () Bool)

(assert (=> d!124247 (= c!104632 (and ((_ is Cons!21935) (toList!6930 lt!456022)) (= (_1!7914 (h!23137 (toList!6930 lt!456022))) lt!456020)))))

(assert (=> d!124247 (= (getValueByKey!590 (toList!6930 lt!456022) lt!456020) e!584776)))

(declare-fun b!1034471 () Bool)

(assert (=> b!1034471 (= e!584776 e!584777)))

(declare-fun c!104633 () Bool)

(assert (=> b!1034471 (= c!104633 (and ((_ is Cons!21935) (toList!6930 lt!456022)) (not (= (_1!7914 (h!23137 (toList!6930 lt!456022))) lt!456020))))))

(assert (= (and d!124247 c!104632) b!1034470))

(assert (= (and d!124247 (not c!104632)) b!1034471))

(assert (= (and b!1034471 c!104633) b!1034472))

(assert (= (and b!1034471 (not c!104633)) b!1034473))

(declare-fun m!954359 () Bool)

(assert (=> b!1034472 m!954359))

(assert (=> d!123717 d!124247))

(declare-fun d!124249 () Bool)

(declare-fun res!690911 () Bool)

(declare-fun e!584778 () Bool)

(assert (=> d!124249 (=> res!690911 e!584778)))

(assert (=> d!124249 (= res!690911 (and ((_ is Cons!21935) (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))) (= (_1!7914 (h!23137 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))) lt!456008)))))

(assert (=> d!124249 (= (containsKey!563 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))) lt!456008) e!584778)))

(declare-fun b!1034474 () Bool)

(declare-fun e!584779 () Bool)

(assert (=> b!1034474 (= e!584778 e!584779)))

(declare-fun res!690912 () Bool)

(assert (=> b!1034474 (=> (not res!690912) (not e!584779))))

(assert (=> b!1034474 (= res!690912 (and (or (not ((_ is Cons!21935) (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))) (bvsle (_1!7914 (h!23137 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))) lt!456008)) ((_ is Cons!21935) (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))) (bvslt (_1!7914 (h!23137 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427)))))) lt!456008)))))

(declare-fun b!1034475 () Bool)

(assert (=> b!1034475 (= e!584779 (containsKey!563 (t!31126 (toList!6930 (+!3130 lt!456012 (tuple2!15807 lt!456026 (zeroValue!6062 thiss!1427))))) lt!456008))))

(assert (= (and d!124249 (not res!690911)) b!1034474))

(assert (= (and b!1034474 res!690912) b!1034475))

(declare-fun m!954361 () Bool)

(assert (=> b!1034475 m!954361))

(assert (=> d!123689 d!124249))

(declare-fun d!124251 () Bool)

(declare-fun res!690913 () Bool)

(declare-fun e!584780 () Bool)

(assert (=> d!124251 (=> res!690913 e!584780)))

(assert (=> d!124251 (= res!690913 (and ((_ is Cons!21935) (toList!6930 lt!456007)) (= (_1!7914 (h!23137 (toList!6930 lt!456007))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124251 (= (containsKey!563 (toList!6930 lt!456007) #b0000000000000000000000000000000000000000000000000000000000000000) e!584780)))

(declare-fun b!1034476 () Bool)

(declare-fun e!584781 () Bool)

(assert (=> b!1034476 (= e!584780 e!584781)))

(declare-fun res!690914 () Bool)

(assert (=> b!1034476 (=> (not res!690914) (not e!584781))))

(assert (=> b!1034476 (= res!690914 (and (or (not ((_ is Cons!21935) (toList!6930 lt!456007))) (bvsle (_1!7914 (h!23137 (toList!6930 lt!456007))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21935) (toList!6930 lt!456007)) (bvslt (_1!7914 (h!23137 (toList!6930 lt!456007))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034477 () Bool)

(assert (=> b!1034477 (= e!584781 (containsKey!563 (t!31126 (toList!6930 lt!456007)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124251 (not res!690913)) b!1034476))

(assert (= (and b!1034476 res!690914) b!1034477))

(declare-fun m!954363 () Bool)

(assert (=> b!1034477 m!954363))

(assert (=> d!123775 d!124251))

(declare-fun d!124253 () Bool)

(declare-fun lt!456492 () Bool)

(assert (=> d!124253 (= lt!456492 (select (content!512 (toList!6930 lt!456101)) (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))))))

(declare-fun e!584783 () Bool)

(assert (=> d!124253 (= lt!456492 e!584783)))

(declare-fun res!690916 () Bool)

(assert (=> d!124253 (=> (not res!690916) (not e!584783))))

(assert (=> d!124253 (= res!690916 ((_ is Cons!21935) (toList!6930 lt!456101)))))

(assert (=> d!124253 (= (contains!5994 (toList!6930 lt!456101) (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))) lt!456492)))

(declare-fun b!1034478 () Bool)

(declare-fun e!584782 () Bool)

(assert (=> b!1034478 (= e!584783 e!584782)))

(declare-fun res!690915 () Bool)

(assert (=> b!1034478 (=> res!690915 e!584782)))

(assert (=> b!1034478 (= res!690915 (= (h!23137 (toList!6930 lt!456101)) (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))))))

(declare-fun b!1034479 () Bool)

(assert (=> b!1034479 (= e!584782 (contains!5994 (t!31126 (toList!6930 lt!456101)) (tuple2!15807 lt!456015 (minValue!6062 thiss!1427))))))

(assert (= (and d!124253 res!690916) b!1034478))

(assert (= (and b!1034478 (not res!690915)) b!1034479))

(declare-fun m!954365 () Bool)

(assert (=> d!124253 m!954365))

(declare-fun m!954367 () Bool)

(assert (=> d!124253 m!954367))

(declare-fun m!954369 () Bool)

(assert (=> b!1034479 m!954369))

(assert (=> b!1033674 d!124253))

(declare-fun d!124255 () Bool)

(assert (=> d!124255 (= (get!16429 (getValueByKey!590 (toList!6930 lt!455983) lt!455987)) (v!14888 (getValueByKey!590 (toList!6930 lt!455983) lt!455987)))))

(assert (=> d!123751 d!124255))

(declare-fun b!1034480 () Bool)

(declare-fun e!584784 () Option!641)

(assert (=> b!1034480 (= e!584784 (Some!640 (_2!7914 (h!23137 (toList!6930 lt!455983)))))))

(declare-fun b!1034483 () Bool)

(declare-fun e!584785 () Option!641)

(assert (=> b!1034483 (= e!584785 None!639)))

(declare-fun b!1034482 () Bool)

(assert (=> b!1034482 (= e!584785 (getValueByKey!590 (t!31126 (toList!6930 lt!455983)) lt!455987))))

(declare-fun d!124257 () Bool)

(declare-fun c!104634 () Bool)

(assert (=> d!124257 (= c!104634 (and ((_ is Cons!21935) (toList!6930 lt!455983)) (= (_1!7914 (h!23137 (toList!6930 lt!455983))) lt!455987)))))

(assert (=> d!124257 (= (getValueByKey!590 (toList!6930 lt!455983) lt!455987) e!584784)))

(declare-fun b!1034481 () Bool)

(assert (=> b!1034481 (= e!584784 e!584785)))

(declare-fun c!104635 () Bool)

(assert (=> b!1034481 (= c!104635 (and ((_ is Cons!21935) (toList!6930 lt!455983)) (not (= (_1!7914 (h!23137 (toList!6930 lt!455983))) lt!455987))))))

(assert (= (and d!124257 c!104634) b!1034480))

(assert (= (and d!124257 (not c!104634)) b!1034481))

(assert (= (and b!1034481 c!104635) b!1034482))

(assert (= (and b!1034481 (not c!104635)) b!1034483))

(declare-fun m!954371 () Bool)

(assert (=> b!1034482 m!954371))

(assert (=> d!123751 d!124257))

(declare-fun d!124259 () Bool)

(declare-fun res!690917 () Bool)

(declare-fun e!584786 () Bool)

(assert (=> d!124259 (=> res!690917 e!584786)))

(assert (=> d!124259 (= res!690917 (or ((_ is Nil!21936) lt!456161) ((_ is Nil!21936) (t!31126 lt!456161))))))

(assert (=> d!124259 (= (isStrictlySorted!714 lt!456161) e!584786)))

(declare-fun b!1034484 () Bool)

(declare-fun e!584787 () Bool)

(assert (=> b!1034484 (= e!584786 e!584787)))

(declare-fun res!690918 () Bool)

(assert (=> b!1034484 (=> (not res!690918) (not e!584787))))

(assert (=> b!1034484 (= res!690918 (bvslt (_1!7914 (h!23137 lt!456161)) (_1!7914 (h!23137 (t!31126 lt!456161)))))))

(declare-fun b!1034485 () Bool)

(assert (=> b!1034485 (= e!584787 (isStrictlySorted!714 (t!31126 lt!456161)))))

(assert (= (and d!124259 (not res!690917)) b!1034484))

(assert (= (and b!1034484 res!690918) b!1034485))

(declare-fun m!954373 () Bool)

(assert (=> b!1034485 m!954373))

(assert (=> d!123777 d!124259))

(declare-fun d!124261 () Bool)

(declare-fun res!690919 () Bool)

(declare-fun e!584788 () Bool)

(assert (=> d!124261 (=> res!690919 e!584788)))

(assert (=> d!124261 (= res!690919 (or ((_ is Nil!21936) (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))) ((_ is Nil!21936) (t!31126 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))))))

(assert (=> d!124261 (= (isStrictlySorted!714 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))) e!584788)))

(declare-fun b!1034486 () Bool)

(declare-fun e!584789 () Bool)

(assert (=> b!1034486 (= e!584788 e!584789)))

(declare-fun res!690920 () Bool)

(assert (=> b!1034486 (=> (not res!690920) (not e!584789))))

(assert (=> b!1034486 (= res!690920 (bvslt (_1!7914 (h!23137 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))) (_1!7914 (h!23137 (t!31126 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))))))))

(declare-fun b!1034487 () Bool)

(assert (=> b!1034487 (= e!584789 (isStrictlySorted!714 (t!31126 (toList!6930 (getCurrentListMap!3897 (_keys!11402 thiss!1427) (_values!6249 thiss!1427) (mask!30078 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))))))

(assert (= (and d!124261 (not res!690919)) b!1034486))

(assert (= (and b!1034486 res!690920) b!1034487))

(assert (=> b!1034487 m!953787))

(assert (=> d!123777 d!124261))

(assert (=> b!1033626 d!123903))

(assert (=> bm!43662 d!124135))

(assert (=> b!1033638 d!123727))

(assert (=> b!1033803 d!123837))

(assert (=> b!1033696 d!123901))

(assert (=> bm!43656 d!124093))

(declare-fun d!124263 () Bool)

(assert (=> d!124263 (isDefined!438 (getValueByKey!590 (toList!6930 lt!456029) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!456493 () Unit!33713)

(assert (=> d!124263 (= lt!456493 (choose!1706 (toList!6930 lt!456029) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!584790 () Bool)

(assert (=> d!124263 e!584790))

(declare-fun res!690921 () Bool)

(assert (=> d!124263 (=> (not res!690921) (not e!584790))))

(assert (=> d!124263 (= res!690921 (isStrictlySorted!714 (toList!6930 lt!456029)))))

(assert (=> d!124263 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!395 (toList!6930 lt!456029) #b1000000000000000000000000000000000000000000000000000000000000000) lt!456493)))

(declare-fun b!1034488 () Bool)

(assert (=> b!1034488 (= e!584790 (containsKey!563 (toList!6930 lt!456029) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124263 res!690921) b!1034488))

(assert (=> d!124263 m!953153))

(assert (=> d!124263 m!953153))

(assert (=> d!124263 m!953155))

(declare-fun m!954375 () Bool)

(assert (=> d!124263 m!954375))

(assert (=> d!124263 m!954247))

(assert (=> b!1034488 m!953149))

(assert (=> b!1033733 d!124263))

(assert (=> b!1033733 d!124003))

(assert (=> b!1033733 d!123947))

(declare-fun d!124265 () Bool)

(declare-fun lt!456494 () Bool)

(assert (=> d!124265 (= lt!456494 (select (content!512 (toList!6930 lt!456115)) (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))))))

(declare-fun e!584792 () Bool)

(assert (=> d!124265 (= lt!456494 e!584792)))

(declare-fun res!690923 () Bool)

(assert (=> d!124265 (=> (not res!690923) (not e!584792))))

(assert (=> d!124265 (= res!690923 ((_ is Cons!21935) (toList!6930 lt!456115)))))

(assert (=> d!124265 (= (contains!5994 (toList!6930 lt!456115) (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))) lt!456494)))

(declare-fun b!1034489 () Bool)

(declare-fun e!584791 () Bool)

(assert (=> b!1034489 (= e!584792 e!584791)))

(declare-fun res!690922 () Bool)

(assert (=> b!1034489 (=> res!690922 e!584791)))

(assert (=> b!1034489 (= res!690922 (= (h!23137 (toList!6930 lt!456115)) (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))))))

(declare-fun b!1034490 () Bool)

(assert (=> b!1034490 (= e!584791 (contains!5994 (t!31126 (toList!6930 lt!456115)) (tuple2!15807 lt!455989 (minValue!6062 thiss!1427))))))

(assert (= (and d!124265 res!690923) b!1034489))

(assert (= (and b!1034489 (not res!690922)) b!1034490))

(declare-fun m!954377 () Bool)

(assert (=> d!124265 m!954377))

(declare-fun m!954379 () Bool)

(assert (=> d!124265 m!954379))

(declare-fun m!954381 () Bool)

(assert (=> b!1034490 m!954381))

(assert (=> b!1033716 d!124265))

(declare-fun d!124267 () Bool)

(assert (=> d!124267 (= (isEmpty!931 lt!456045) (isEmpty!933 (toList!6930 lt!456045)))))

(declare-fun bs!30241 () Bool)

(assert (= bs!30241 d!124267))

(declare-fun m!954383 () Bool)

(assert (=> bs!30241 m!954383))

(assert (=> b!1033623 d!124267))

(declare-fun bm!43720 () Bool)

(declare-fun call!43723 () (_ BitVec 32))

(assert (=> bm!43720 (= call!43723 (arrayCountValidKeys!0 (_keys!11402 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31844 (_keys!11402 thiss!1427))))))

(declare-fun b!1034491 () Bool)

(declare-fun e!584793 () (_ BitVec 32))

(assert (=> b!1034491 (= e!584793 call!43723)))

(declare-fun b!1034492 () Bool)

(declare-fun e!584794 () (_ BitVec 32))

(assert (=> b!1034492 (= e!584794 #b00000000000000000000000000000000)))

(declare-fun d!124269 () Bool)

(declare-fun lt!456495 () (_ BitVec 32))

(assert (=> d!124269 (and (bvsge lt!456495 #b00000000000000000000000000000000) (bvsle lt!456495 (bvsub (size!31844 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!124269 (= lt!456495 e!584794)))

(declare-fun c!104636 () Bool)

(assert (=> d!124269 (= c!104636 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 thiss!1427))))))

(assert (=> d!124269 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31844 (_keys!11402 thiss!1427)) (size!31844 (_keys!11402 thiss!1427))))))

(assert (=> d!124269 (= (arrayCountValidKeys!0 (_keys!11402 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31844 (_keys!11402 thiss!1427))) lt!456495)))

(declare-fun b!1034493 () Bool)

(assert (=> b!1034493 (= e!584794 e!584793)))

(declare-fun c!104637 () Bool)

(assert (=> b!1034493 (= c!104637 (validKeyInArray!0 (select (arr!31320 (_keys!11402 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1034494 () Bool)

(assert (=> b!1034494 (= e!584793 (bvadd #b00000000000000000000000000000001 call!43723))))

(assert (= (and d!124269 c!104636) b!1034492))

(assert (= (and d!124269 (not c!104636)) b!1034493))

(assert (= (and b!1034493 c!104637) b!1034494))

(assert (= (and b!1034493 (not c!104637)) b!1034491))

(assert (= (or b!1034494 b!1034491) bm!43720))

(declare-fun m!954385 () Bool)

(assert (=> bm!43720 m!954385))

(assert (=> b!1034493 m!953505))

(assert (=> b!1034493 m!953505))

(assert (=> b!1034493 m!953507))

(assert (=> bm!43659 d!124269))

(declare-fun d!124271 () Bool)

(declare-fun lt!456496 () Bool)

(assert (=> d!124271 (= lt!456496 (select (content!513 Nil!21938) (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)))))

(declare-fun e!584795 () Bool)

(assert (=> d!124271 (= lt!456496 e!584795)))

(declare-fun res!690924 () Bool)

(assert (=> d!124271 (=> (not res!690924) (not e!584795))))

(assert (=> d!124271 (= res!690924 ((_ is Cons!21937) Nil!21938))))

(assert (=> d!124271 (= (contains!5993 Nil!21938 (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)) lt!456496)))

(declare-fun b!1034495 () Bool)

(declare-fun e!584796 () Bool)

(assert (=> b!1034495 (= e!584795 e!584796)))

(declare-fun res!690925 () Bool)

(assert (=> b!1034495 (=> res!690925 e!584796)))

(assert (=> b!1034495 (= res!690925 (= (h!23139 Nil!21938) (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)))))

(declare-fun b!1034496 () Bool)

(assert (=> b!1034496 (= e!584796 (contains!5993 (t!31132 Nil!21938) (select (arr!31320 (_keys!11402 lt!455914)) #b00000000000000000000000000000000)))))

(assert (= (and d!124271 res!690924) b!1034495))

(assert (= (and b!1034495 (not res!690925)) b!1034496))

(assert (=> d!124271 m!953711))

(assert (=> d!124271 m!953267))

(declare-fun m!954387 () Bool)

(assert (=> d!124271 m!954387))

(assert (=> b!1034496 m!953267))

(declare-fun m!954389 () Bool)

(assert (=> b!1034496 m!954389))

(assert (=> b!1033800 d!124271))

(assert (=> b!1033678 d!123727))

(declare-fun b!1034498 () Bool)

(declare-fun e!584797 () Bool)

(assert (=> b!1034498 (= e!584797 tp_is_empty!24517)))

(declare-fun condMapEmpty!38269 () Bool)

(declare-fun mapDefault!38269 () ValueCell!11555)

(assert (=> mapNonEmpty!38268 (= condMapEmpty!38269 (= mapRest!38268 ((as const (Array (_ BitVec 32) ValueCell!11555)) mapDefault!38269)))))

(declare-fun mapRes!38269 () Bool)

(assert (=> mapNonEmpty!38268 (= tp!73507 (and e!584797 mapRes!38269))))

(declare-fun b!1034497 () Bool)

(declare-fun e!584798 () Bool)

(assert (=> b!1034497 (= e!584798 tp_is_empty!24517)))

(declare-fun mapNonEmpty!38269 () Bool)

(declare-fun tp!73508 () Bool)

(assert (=> mapNonEmpty!38269 (= mapRes!38269 (and tp!73508 e!584798))))

(declare-fun mapRest!38269 () (Array (_ BitVec 32) ValueCell!11555))

(declare-fun mapKey!38269 () (_ BitVec 32))

(declare-fun mapValue!38269 () ValueCell!11555)

(assert (=> mapNonEmpty!38269 (= mapRest!38268 (store mapRest!38269 mapKey!38269 mapValue!38269))))

(declare-fun mapIsEmpty!38269 () Bool)

(assert (=> mapIsEmpty!38269 mapRes!38269))

(assert (= (and mapNonEmpty!38268 condMapEmpty!38269) mapIsEmpty!38269))

(assert (= (and mapNonEmpty!38268 (not condMapEmpty!38269)) mapNonEmpty!38269))

(assert (= (and mapNonEmpty!38269 ((_ is ValueCellFull!11555) mapValue!38269)) b!1034497))

(assert (= (and mapNonEmpty!38268 ((_ is ValueCellFull!11555) mapDefault!38269)) b!1034498))

(declare-fun m!954391 () Bool)

(assert (=> mapNonEmpty!38269 m!954391))

(declare-fun b_lambda!16069 () Bool)

(assert (= b_lambda!16063 (or (and b!1033421 b_free!20797) b_lambda!16069)))

(declare-fun b_lambda!16071 () Bool)

(assert (= b_lambda!16059 (or (and b!1033421 b_free!20797) b_lambda!16071)))

(declare-fun b_lambda!16073 () Bool)

(assert (= b_lambda!16047 (or (and b!1033421 b_free!20797 (= (defaultEntry!6226 thiss!1427) (defaultEntry!6226 lt!455914))) b_lambda!16073)))

(declare-fun b_lambda!16075 () Bool)

(assert (= b_lambda!16061 (or (and b!1033421 b_free!20797) b_lambda!16075)))

(declare-fun b_lambda!16077 () Bool)

(assert (= b_lambda!16057 (or (and b!1033421 b_free!20797) b_lambda!16077)))

(check-sat (not d!124121) (not d!124165) (not b!1034053) (not b!1034482) (not d!124109) (not b_lambda!16049) (not b!1034442) (not b!1033971) (not b!1034079) (not d!124089) (not d!123867) (not b!1034019) (not b!1034211) (not d!124271) (not b!1034282) (not b_lambda!16069) (not d!124179) (not b!1034067) (not d!123971) (not b!1034070) (not b!1034391) (not d!124083) (not d!124009) (not b!1034001) (not b!1034326) (not d!124053) (not b!1034259) (not b!1034005) (not b!1033869) (not b!1033912) (not b!1034365) (not b!1034311) (not d!123961) (not b!1034441) (not b!1034342) (not d!124167) (not b!1034429) (not d!124227) (not b!1034102) (not b!1034217) (not b!1034146) (not d!124041) (not b!1034265) (not b!1034399) (not d!124137) (not b!1033998) (not d!123913) (not d!123907) (not d!124135) (not b!1034284) (not b!1034453) (not d!123911) (not b!1034490) (not b!1034040) (not d!123809) (not d!124005) (not b!1034267) (not b!1034487) (not b!1033872) (not d!124139) (not b!1033847) (not d!124133) (not b!1033965) (not d!124035) (not b!1034488) (not bm!43683) (not d!124011) (not b!1034100) (not b!1034061) (not b!1033859) (not b!1033994) (not b!1034015) (not d!123943) (not d!124159) (not b_lambda!16065) (not b!1034212) (not b!1034087) (not b!1034468) (not b!1034187) (not b!1034364) (not b!1034344) (not mapNonEmpty!38269) (not b!1034208) (not d!124007) (not b!1033839) (not b!1034358) (not b!1034194) (not b!1034091) (not b!1034196) (not b!1034262) (not b!1034379) (not d!124049) (not b!1034475) (not d!123999) (not b!1034017) (not b!1033952) (not d!123957) (not b!1034397) (not d!124225) (not b!1034446) (not b!1034376) (not b!1034219) (not b!1034162) (not b!1034459) (not b!1034197) (not b!1034335) (not b!1034270) (not d!123967) (not b!1034479) (not b!1033962) (not b!1034191) (not b!1034018) (not b!1034278) (not bm!43694) (not d!124267) (not b!1034256) (not b!1033999) (not d!123989) (not d!124241) (not b!1034460) (not b!1034134) (not b!1034183) (not b!1034451) (not d!123991) (not b_next!20797) (not b!1034353) (not d!123843) (not d!123891) (not d!123923) (not b!1034169) (not b!1034075) (not b!1034456) (not b!1033923) (not d!124163) (not b!1034255) (not b!1034380) (not b!1033857) (not b!1034439) (not b!1034281) (not d!124173) (not b!1034316) (not d!123853) (not b!1034449) (not b!1034290) (not b!1034177) (not d!123921) (not b!1034137) (not b!1033948) (not b!1034190) (not d!123827) (not b_lambda!16029) (not d!124075) (not d!124265) (not b!1034133) (not d!123941) (not b!1034338) (not d!123997) (not d!124157) (not b!1034105) (not d!124223) (not b!1034496) (not b!1034268) (not d!123905) (not b!1034099) (not b!1034221) (not d!124149) (not b!1034172) (not b!1034144) (not d!123839) (not b!1034064) (not b!1034175) (not b!1034346) (not d!123933) (not bm!43713) (not b!1034178) (not b!1034392) (not b!1034261) (not b!1033977) (not b!1034349) (not b!1034309) (not b_lambda!16067) (not d!124169) (not b!1034350) (not b!1034355) (not d!124043) (not b!1034321) (not b!1034409) (not d!123819) (not b!1033916) (not d!124129) (not d!123925) (not b!1034294) (not b!1033838) (not b!1034072) (not b!1034136) (not d!124175) (not b!1034142) (not d!123889) (not d!123949) tp_is_empty!24517 (not b!1034042) (not d!124237) (not b!1034054) (not b!1034110) (not b!1034214) (not d!123965) (not bm!43670) (not b!1034059) (not b!1034493) (not b!1034336) (not bm!43701) (not d!123821) (not d!124213) (not b!1034210) (not d!124067) (not b!1034108) (not d!124107) (not d!123985) (not b!1034354) (not b!1034220) (not d!124077) (not d!124187) (not b_lambda!16035) (not b!1033879) (not d!124219) (not b_lambda!16075) (not d!123845) (not b!1034231) (not b!1034279) (not d!123977) (not b!1033968) (not b!1034049) (not b!1034425) (not b!1034120) (not b!1034413) (not b!1034485) (not d!124119) (not b!1034352) (not d!124145) (not d!124151) (not b!1034373) (not b!1034148) (not b!1034204) (not bm!43702) (not bm!43709) (not b!1034287) (not b!1034074) (not b_lambda!16051) (not b!1034395) (not d!123875) (not bm!43719) (not b!1033865) (not d!124143) (not b!1034078) (not b_lambda!16037) (not b!1033978) (not b!1034168) (not b!1034239) (not b!1034458) (not b!1034131) (not d!124217) (not b!1034357) (not b!1034402) (not bm!43710) (not b!1034056) (not b!1033990) (not b!1034243) (not b!1034383) (not b!1034033) (not d!123871) (not b!1034426) (not b!1034010) (not b!1034438) (not b!1034224) (not bm!43720) (not d!123963) (not d!124069) (not b!1034378) (not bm!43703) (not b!1033820) (not b!1034135) (not d!124231) (not d!124155) (not d!124039) (not b!1034036) (not b!1034360) (not b!1033986) (not bm!43716) (not b!1034151) (not bm!43680) (not d!123939) (not d!124123) (not b!1034333) (not d!124221) (not d!124115) (not b!1034339) (not bm!43684) (not d!124229) (not d!124017) (not b!1034289) (not b!1034422) (not b!1034199) (not b!1033996) (not b!1034444) (not b!1034164) (not bm!43700) (not d!123983) (not b_lambda!16077) (not b!1034424) (not b!1034088) (not b!1034012) (not b!1034193) (not d!124193) (not d!123897) (not b!1034084) (not d!124181) (not b!1034174) (not d!123857) (not b!1034351) (not b!1033908) (not b!1034229) (not b!1033854) (not b!1034369) (not b!1034238) (not b!1033860) (not d!124105) (not b!1034347) (not b!1033831) (not d!123979) (not b!1034341) (not b_lambda!16073) (not b!1034115) (not b!1034314) (not b!1033818) (not b!1034330) (not b!1034081) (not b!1034031) (not b!1034254) (not b!1033867) (not d!124093) (not d!123829) (not b!1034240) (not bm!43706) (not b!1034046) (not d!124131) (not b!1034291) (not b!1034273) (not b!1033981) (not bm!43688) (not d!124003) (not b!1034008) (not bm!43691) (not d!124059) (not b!1034434) (not d!124161) (not b_lambda!16071) (not b!1034463) (not d!123973) (not b!1034051) (not b!1034103) (not b!1034022) (not d!124037) (not d!124073) (not d!124015) (not b!1034076) (not b!1033974) (not d!124203) (not d!124199) (not b!1033956) (not b!1033878) (not d!123815) (not b!1034086) (not b!1034388) (not b!1034248) (not b!1034437) (not b!1033850) (not b!1034233) (not b!1034318) (not d!124185) (not d!124141) (not b!1034111) (not b!1034045) (not b!1033903) (not b!1034371) (not b!1034251) (not b!1033944) (not b!1034253) (not d!124263) (not b!1034362) (not b!1034096) (not bm!43679) (not b!1034275) (not b!1034299) (not b!1034317) (not d!123903) (not d!124023) (not b!1033958) (not d!123953) (not b!1034112) (not b!1034264) b_and!33275 (not b!1034308) (not b!1033969) (not b!1033960) (not b!1034124) (not d!124147) (not d!124113) (not d!123885) (not b!1033976) (not d!124243) (not b!1033900) (not b!1034410) (not b!1034477) (not d!123951) (not b!1034154) (not b!1034419) (not b!1034009) (not b!1033941) (not bm!43697) (not d!123969) (not b!1034366) (not b!1034236) (not d!124101) (not b!1034201) (not b!1034416) (not b!1034004) (not d!124081) (not d!124057) (not d!123807) (not b!1034002) (not b!1034007) (not b!1034472) (not b!1033841) (not d!124055) (not b!1034417) (not b!1034027) (not b!1034132) (not b!1034170) (not d!123981) (not b!1034180) (not b_lambda!16053) (not d!124033) (not b!1034160) (not d!124253) (not d!124183) (not bm!43687) (not d!124153) (not b!1034405) (not b!1034363) (not b!1034302) (not b_lambda!16055))
(check-sat b_and!33275 (not b_next!20797))
