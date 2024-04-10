; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3132 () Bool)

(assert start!3132)

(declare-fun b!19081 () Bool)

(declare-fun b_free!663 () Bool)

(declare-fun b_next!663 () Bool)

(assert (=> b!19081 (= b_free!663 (not b_next!663))))

(declare-fun tp!3186 () Bool)

(declare-fun b_and!1323 () Bool)

(assert (=> b!19081 (= tp!3186 b_and!1323)))

(declare-fun b!19077 () Bool)

(declare-fun e!12261 () Bool)

(declare-fun e!12263 () Bool)

(declare-fun mapRes!832 () Bool)

(assert (=> b!19077 (= e!12261 (and e!12263 mapRes!832))))

(declare-fun condMapEmpty!832 () Bool)

(declare-datatypes ((V!1061 0))(
  ( (V!1062 (val!490 Int)) )
))
(declare-datatypes ((ValueCell!264 0))(
  ( (ValueCellFull!264 (v!1496 V!1061)) (EmptyCell!264) )
))
(declare-datatypes ((array!1063 0))(
  ( (array!1064 (arr!511 (Array (_ BitVec 32) ValueCell!264)) (size!601 (_ BitVec 32))) )
))
(declare-datatypes ((array!1065 0))(
  ( (array!1066 (arr!512 (Array (_ BitVec 32) (_ BitVec 64))) (size!602 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!114 0))(
  ( (LongMapFixedSize!115 (defaultEntry!1676 Int) (mask!4615 (_ BitVec 32)) (extraKeys!1586 (_ BitVec 32)) (zeroValue!1610 V!1061) (minValue!1610 V!1061) (_size!90 (_ BitVec 32)) (_keys!3101 array!1065) (_values!1672 array!1063) (_vacant!90 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!114 0))(
  ( (Cell!115 (v!1497 LongMapFixedSize!114)) )
))
(declare-datatypes ((LongMap!114 0))(
  ( (LongMap!115 (underlying!68 Cell!114)) )
))
(declare-fun thiss!938 () LongMap!114)

(declare-fun mapDefault!832 () ValueCell!264)

(assert (=> b!19077 (= condMapEmpty!832 (= (arr!511 (_values!1672 (v!1497 (underlying!68 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!264)) mapDefault!832)))))

(declare-fun b!19078 () Bool)

(declare-fun tp_is_empty!927 () Bool)

(assert (=> b!19078 (= e!12263 tp_is_empty!927)))

(declare-fun b!19079 () Bool)

(declare-fun e!12265 () Bool)

(declare-fun e!12259 () Bool)

(assert (=> b!19079 (= e!12265 e!12259)))

(declare-fun b!19080 () Bool)

(declare-fun e!12262 () Bool)

(assert (=> b!19080 (= e!12262 tp_is_empty!927)))

(declare-fun mapNonEmpty!832 () Bool)

(declare-fun tp!3187 () Bool)

(assert (=> mapNonEmpty!832 (= mapRes!832 (and tp!3187 e!12262))))

(declare-fun mapRest!832 () (Array (_ BitVec 32) ValueCell!264))

(declare-fun mapKey!832 () (_ BitVec 32))

(declare-fun mapValue!832 () ValueCell!264)

(assert (=> mapNonEmpty!832 (= (arr!511 (_values!1672 (v!1497 (underlying!68 thiss!938)))) (store mapRest!832 mapKey!832 mapValue!832))))

(declare-fun e!12260 () Bool)

(declare-fun array_inv!351 (array!1065) Bool)

(declare-fun array_inv!352 (array!1063) Bool)

(assert (=> b!19081 (= e!12260 (and tp!3186 tp_is_empty!927 (array_inv!351 (_keys!3101 (v!1497 (underlying!68 thiss!938)))) (array_inv!352 (_values!1672 (v!1497 (underlying!68 thiss!938)))) e!12261))))

(declare-fun b!19082 () Bool)

(declare-fun e!12264 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!19082 (= e!12264 (not (validMask!0 (mask!4615 (v!1497 (underlying!68 thiss!938))))))))

(declare-fun b!19083 () Bool)

(assert (=> b!19083 (= e!12259 e!12260)))

(declare-fun mapIsEmpty!832 () Bool)

(assert (=> mapIsEmpty!832 mapRes!832))

(declare-fun res!13060 () Bool)

(assert (=> start!3132 (=> (not res!13060) (not e!12264))))

(declare-fun valid!54 (LongMap!114) Bool)

(assert (=> start!3132 (= res!13060 (valid!54 thiss!938))))

(assert (=> start!3132 e!12264))

(assert (=> start!3132 e!12265))

(assert (= (and start!3132 res!13060) b!19082))

(assert (= (and b!19077 condMapEmpty!832) mapIsEmpty!832))

(assert (= (and b!19077 (not condMapEmpty!832)) mapNonEmpty!832))

(get-info :version)

(assert (= (and mapNonEmpty!832 ((_ is ValueCellFull!264) mapValue!832)) b!19080))

(assert (= (and b!19077 ((_ is ValueCellFull!264) mapDefault!832)) b!19078))

(assert (= b!19081 b!19077))

(assert (= b!19083 b!19081))

(assert (= b!19079 b!19083))

(assert (= start!3132 b!19079))

(declare-fun m!13519 () Bool)

(assert (=> mapNonEmpty!832 m!13519))

(declare-fun m!13521 () Bool)

(assert (=> b!19081 m!13521))

(declare-fun m!13523 () Bool)

(assert (=> b!19081 m!13523))

(declare-fun m!13525 () Bool)

(assert (=> b!19082 m!13525))

(declare-fun m!13527 () Bool)

(assert (=> start!3132 m!13527))

(check-sat (not start!3132) (not b!19081) (not b!19082) b_and!1323 (not b_next!663) tp_is_empty!927 (not mapNonEmpty!832))
(check-sat b_and!1323 (not b_next!663))
(get-model)

(declare-fun d!3547 () Bool)

(declare-fun valid!55 (LongMapFixedSize!114) Bool)

(assert (=> d!3547 (= (valid!54 thiss!938) (valid!55 (v!1497 (underlying!68 thiss!938))))))

(declare-fun bs!862 () Bool)

(assert (= bs!862 d!3547))

(declare-fun m!13539 () Bool)

(assert (=> bs!862 m!13539))

(assert (=> start!3132 d!3547))

(declare-fun d!3549 () Bool)

(assert (=> d!3549 (= (validMask!0 (mask!4615 (v!1497 (underlying!68 thiss!938)))) (and (or (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000000000000111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000000000001111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000000000011111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000000000111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000000001111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000000011111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000000111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000001111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000011111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000111111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000000000001111111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000000000011111111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000000000111111111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000000001111111111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000000011111111111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000000111111111111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000001111111111111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000011111111111111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000111111111111111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000001111111111111111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000011111111111111111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000111111111111111111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000001111111111111111111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000011111111111111111111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000111111111111111111111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00001111111111111111111111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00011111111111111111111111111111) (= (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00111111111111111111111111111111)) (bvsle (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00111111111111111111111111111111)))))

(assert (=> b!19082 d!3549))

(declare-fun d!3551 () Bool)

(assert (=> d!3551 (= (array_inv!351 (_keys!3101 (v!1497 (underlying!68 thiss!938)))) (bvsge (size!602 (_keys!3101 (v!1497 (underlying!68 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19081 d!3551))

(declare-fun d!3553 () Bool)

(assert (=> d!3553 (= (array_inv!352 (_values!1672 (v!1497 (underlying!68 thiss!938)))) (bvsge (size!601 (_values!1672 (v!1497 (underlying!68 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19081 d!3553))

(declare-fun condMapEmpty!838 () Bool)

(declare-fun mapDefault!838 () ValueCell!264)

(assert (=> mapNonEmpty!832 (= condMapEmpty!838 (= mapRest!832 ((as const (Array (_ BitVec 32) ValueCell!264)) mapDefault!838)))))

(declare-fun e!12295 () Bool)

(declare-fun mapRes!838 () Bool)

(assert (=> mapNonEmpty!832 (= tp!3187 (and e!12295 mapRes!838))))

(declare-fun mapNonEmpty!838 () Bool)

(declare-fun tp!3196 () Bool)

(declare-fun e!12296 () Bool)

(assert (=> mapNonEmpty!838 (= mapRes!838 (and tp!3196 e!12296))))

(declare-fun mapRest!838 () (Array (_ BitVec 32) ValueCell!264))

(declare-fun mapValue!838 () ValueCell!264)

(declare-fun mapKey!838 () (_ BitVec 32))

(assert (=> mapNonEmpty!838 (= mapRest!832 (store mapRest!838 mapKey!838 mapValue!838))))

(declare-fun b!19111 () Bool)

(assert (=> b!19111 (= e!12296 tp_is_empty!927)))

(declare-fun mapIsEmpty!838 () Bool)

(assert (=> mapIsEmpty!838 mapRes!838))

(declare-fun b!19112 () Bool)

(assert (=> b!19112 (= e!12295 tp_is_empty!927)))

(assert (= (and mapNonEmpty!832 condMapEmpty!838) mapIsEmpty!838))

(assert (= (and mapNonEmpty!832 (not condMapEmpty!838)) mapNonEmpty!838))

(assert (= (and mapNonEmpty!838 ((_ is ValueCellFull!264) mapValue!838)) b!19111))

(assert (= (and mapNonEmpty!832 ((_ is ValueCellFull!264) mapDefault!838)) b!19112))

(declare-fun m!13541 () Bool)

(assert (=> mapNonEmpty!838 m!13541))

(check-sat (not mapNonEmpty!838) b_and!1323 (not b_next!663) (not d!3547) tp_is_empty!927)
(check-sat b_and!1323 (not b_next!663))
(get-model)

(declare-fun d!3555 () Bool)

(declare-fun res!13070 () Bool)

(declare-fun e!12299 () Bool)

(assert (=> d!3555 (=> (not res!13070) (not e!12299))))

(declare-fun simpleValid!10 (LongMapFixedSize!114) Bool)

(assert (=> d!3555 (= res!13070 (simpleValid!10 (v!1497 (underlying!68 thiss!938))))))

(assert (=> d!3555 (= (valid!55 (v!1497 (underlying!68 thiss!938))) e!12299)))

(declare-fun b!19119 () Bool)

(declare-fun res!13071 () Bool)

(assert (=> b!19119 (=> (not res!13071) (not e!12299))))

(declare-fun arrayCountValidKeys!0 (array!1065 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19119 (= res!13071 (= (arrayCountValidKeys!0 (_keys!3101 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000000000000000 (size!602 (_keys!3101 (v!1497 (underlying!68 thiss!938))))) (_size!90 (v!1497 (underlying!68 thiss!938)))))))

(declare-fun b!19120 () Bool)

(declare-fun res!13072 () Bool)

(assert (=> b!19120 (=> (not res!13072) (not e!12299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1065 (_ BitVec 32)) Bool)

(assert (=> b!19120 (= res!13072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3101 (v!1497 (underlying!68 thiss!938))) (mask!4615 (v!1497 (underlying!68 thiss!938)))))))

(declare-fun b!19121 () Bool)

(declare-datatypes ((List!544 0))(
  ( (Nil!541) (Cons!540 (h!1106 (_ BitVec 64)) (t!3187 List!544)) )
))
(declare-fun arrayNoDuplicates!0 (array!1065 (_ BitVec 32) List!544) Bool)

(assert (=> b!19121 (= e!12299 (arrayNoDuplicates!0 (_keys!3101 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000000000000000 Nil!541))))

(assert (= (and d!3555 res!13070) b!19119))

(assert (= (and b!19119 res!13071) b!19120))

(assert (= (and b!19120 res!13072) b!19121))

(declare-fun m!13543 () Bool)

(assert (=> d!3555 m!13543))

(declare-fun m!13545 () Bool)

(assert (=> b!19119 m!13545))

(declare-fun m!13547 () Bool)

(assert (=> b!19120 m!13547))

(declare-fun m!13549 () Bool)

(assert (=> b!19121 m!13549))

(assert (=> d!3547 d!3555))

(declare-fun condMapEmpty!839 () Bool)

(declare-fun mapDefault!839 () ValueCell!264)

(assert (=> mapNonEmpty!838 (= condMapEmpty!839 (= mapRest!838 ((as const (Array (_ BitVec 32) ValueCell!264)) mapDefault!839)))))

(declare-fun e!12300 () Bool)

(declare-fun mapRes!839 () Bool)

(assert (=> mapNonEmpty!838 (= tp!3196 (and e!12300 mapRes!839))))

(declare-fun mapNonEmpty!839 () Bool)

(declare-fun tp!3197 () Bool)

(declare-fun e!12301 () Bool)

(assert (=> mapNonEmpty!839 (= mapRes!839 (and tp!3197 e!12301))))

(declare-fun mapKey!839 () (_ BitVec 32))

(declare-fun mapRest!839 () (Array (_ BitVec 32) ValueCell!264))

(declare-fun mapValue!839 () ValueCell!264)

(assert (=> mapNonEmpty!839 (= mapRest!838 (store mapRest!839 mapKey!839 mapValue!839))))

(declare-fun b!19122 () Bool)

(assert (=> b!19122 (= e!12301 tp_is_empty!927)))

(declare-fun mapIsEmpty!839 () Bool)

(assert (=> mapIsEmpty!839 mapRes!839))

(declare-fun b!19123 () Bool)

(assert (=> b!19123 (= e!12300 tp_is_empty!927)))

(assert (= (and mapNonEmpty!838 condMapEmpty!839) mapIsEmpty!839))

(assert (= (and mapNonEmpty!838 (not condMapEmpty!839)) mapNonEmpty!839))

(assert (= (and mapNonEmpty!839 ((_ is ValueCellFull!264) mapValue!839)) b!19122))

(assert (= (and mapNonEmpty!838 ((_ is ValueCellFull!264) mapDefault!839)) b!19123))

(declare-fun m!13551 () Bool)

(assert (=> mapNonEmpty!839 m!13551))

(check-sat (not b!19120) (not mapNonEmpty!839) (not b!19119) (not b_next!663) tp_is_empty!927 (not b!19121) b_and!1323 (not d!3555))
(check-sat b_and!1323 (not b_next!663))
(get-model)

(declare-fun b!19133 () Bool)

(declare-fun e!12309 () Bool)

(declare-fun e!12310 () Bool)

(assert (=> b!19133 (= e!12309 e!12310)))

(declare-fun c!2046 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!19133 (= c!2046 (validKeyInArray!0 (select (arr!512 (_keys!3101 (v!1497 (underlying!68 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19134 () Bool)

(declare-fun e!12308 () Bool)

(declare-fun call!880 () Bool)

(assert (=> b!19134 (= e!12308 call!880)))

(declare-fun b!19135 () Bool)

(assert (=> b!19135 (= e!12310 e!12308)))

(declare-fun lt!5397 () (_ BitVec 64))

(assert (=> b!19135 (= lt!5397 (select (arr!512 (_keys!3101 (v!1497 (underlying!68 thiss!938)))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!378 0))(
  ( (Unit!379) )
))
(declare-fun lt!5395 () Unit!378)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1065 (_ BitVec 64) (_ BitVec 32)) Unit!378)

(assert (=> b!19135 (= lt!5395 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3101 (v!1497 (underlying!68 thiss!938))) lt!5397 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!19135 (arrayContainsKey!0 (_keys!3101 (v!1497 (underlying!68 thiss!938))) lt!5397 #b00000000000000000000000000000000)))

(declare-fun lt!5396 () Unit!378)

(assert (=> b!19135 (= lt!5396 lt!5395)))

(declare-fun res!13078 () Bool)

(declare-datatypes ((SeekEntryResult!44 0))(
  ( (MissingZero!44 (index!2296 (_ BitVec 32))) (Found!44 (index!2297 (_ BitVec 32))) (Intermediate!44 (undefined!856 Bool) (index!2298 (_ BitVec 32)) (x!4699 (_ BitVec 32))) (Undefined!44) (MissingVacant!44 (index!2299 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1065 (_ BitVec 32)) SeekEntryResult!44)

(assert (=> b!19135 (= res!13078 (= (seekEntryOrOpen!0 (select (arr!512 (_keys!3101 (v!1497 (underlying!68 thiss!938)))) #b00000000000000000000000000000000) (_keys!3101 (v!1497 (underlying!68 thiss!938))) (mask!4615 (v!1497 (underlying!68 thiss!938)))) (Found!44 #b00000000000000000000000000000000)))))

(assert (=> b!19135 (=> (not res!13078) (not e!12308))))

(declare-fun bm!877 () Bool)

(assert (=> bm!877 (= call!880 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3101 (v!1497 (underlying!68 thiss!938))) (mask!4615 (v!1497 (underlying!68 thiss!938)))))))

(declare-fun d!3557 () Bool)

(declare-fun res!13077 () Bool)

(assert (=> d!3557 (=> res!13077 e!12309)))

(assert (=> d!3557 (= res!13077 (bvsge #b00000000000000000000000000000000 (size!602 (_keys!3101 (v!1497 (underlying!68 thiss!938))))))))

(assert (=> d!3557 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3101 (v!1497 (underlying!68 thiss!938))) (mask!4615 (v!1497 (underlying!68 thiss!938)))) e!12309)))

(declare-fun b!19132 () Bool)

(assert (=> b!19132 (= e!12310 call!880)))

(assert (= (and d!3557 (not res!13077)) b!19133))

(assert (= (and b!19133 c!2046) b!19135))

(assert (= (and b!19133 (not c!2046)) b!19132))

(assert (= (and b!19135 res!13078) b!19134))

(assert (= (or b!19134 b!19132) bm!877))

(declare-fun m!13553 () Bool)

(assert (=> b!19133 m!13553))

(assert (=> b!19133 m!13553))

(declare-fun m!13555 () Bool)

(assert (=> b!19133 m!13555))

(assert (=> b!19135 m!13553))

(declare-fun m!13557 () Bool)

(assert (=> b!19135 m!13557))

(declare-fun m!13559 () Bool)

(assert (=> b!19135 m!13559))

(assert (=> b!19135 m!13553))

(declare-fun m!13561 () Bool)

(assert (=> b!19135 m!13561))

(declare-fun m!13563 () Bool)

(assert (=> bm!877 m!13563))

(assert (=> b!19120 d!3557))

(declare-fun d!3559 () Bool)

(declare-fun res!13086 () Bool)

(declare-fun e!12319 () Bool)

(assert (=> d!3559 (=> res!13086 e!12319)))

(assert (=> d!3559 (= res!13086 (bvsge #b00000000000000000000000000000000 (size!602 (_keys!3101 (v!1497 (underlying!68 thiss!938))))))))

(assert (=> d!3559 (= (arrayNoDuplicates!0 (_keys!3101 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000000000000000 Nil!541) e!12319)))

(declare-fun b!19146 () Bool)

(declare-fun e!12321 () Bool)

(declare-fun call!883 () Bool)

(assert (=> b!19146 (= e!12321 call!883)))

(declare-fun bm!880 () Bool)

(declare-fun c!2049 () Bool)

(assert (=> bm!880 (= call!883 (arrayNoDuplicates!0 (_keys!3101 (v!1497 (underlying!68 thiss!938))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!2049 (Cons!540 (select (arr!512 (_keys!3101 (v!1497 (underlying!68 thiss!938)))) #b00000000000000000000000000000000) Nil!541) Nil!541)))))

(declare-fun b!19147 () Bool)

(declare-fun e!12320 () Bool)

(declare-fun contains!218 (List!544 (_ BitVec 64)) Bool)

(assert (=> b!19147 (= e!12320 (contains!218 Nil!541 (select (arr!512 (_keys!3101 (v!1497 (underlying!68 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19148 () Bool)

(assert (=> b!19148 (= e!12321 call!883)))

(declare-fun b!19149 () Bool)

(declare-fun e!12322 () Bool)

(assert (=> b!19149 (= e!12319 e!12322)))

(declare-fun res!13087 () Bool)

(assert (=> b!19149 (=> (not res!13087) (not e!12322))))

(assert (=> b!19149 (= res!13087 (not e!12320))))

(declare-fun res!13085 () Bool)

(assert (=> b!19149 (=> (not res!13085) (not e!12320))))

(assert (=> b!19149 (= res!13085 (validKeyInArray!0 (select (arr!512 (_keys!3101 (v!1497 (underlying!68 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19150 () Bool)

(assert (=> b!19150 (= e!12322 e!12321)))

(assert (=> b!19150 (= c!2049 (validKeyInArray!0 (select (arr!512 (_keys!3101 (v!1497 (underlying!68 thiss!938)))) #b00000000000000000000000000000000)))))

(assert (= (and d!3559 (not res!13086)) b!19149))

(assert (= (and b!19149 res!13085) b!19147))

(assert (= (and b!19149 res!13087) b!19150))

(assert (= (and b!19150 c!2049) b!19148))

(assert (= (and b!19150 (not c!2049)) b!19146))

(assert (= (or b!19148 b!19146) bm!880))

(assert (=> bm!880 m!13553))

(declare-fun m!13565 () Bool)

(assert (=> bm!880 m!13565))

(assert (=> b!19147 m!13553))

(assert (=> b!19147 m!13553))

(declare-fun m!13567 () Bool)

(assert (=> b!19147 m!13567))

(assert (=> b!19149 m!13553))

(assert (=> b!19149 m!13553))

(assert (=> b!19149 m!13555))

(assert (=> b!19150 m!13553))

(assert (=> b!19150 m!13553))

(assert (=> b!19150 m!13555))

(assert (=> b!19121 d!3559))

(declare-fun b!19159 () Bool)

(declare-fun e!12328 () (_ BitVec 32))

(declare-fun call!886 () (_ BitVec 32))

(assert (=> b!19159 (= e!12328 call!886)))

(declare-fun bm!883 () Bool)

(assert (=> bm!883 (= call!886 (arrayCountValidKeys!0 (_keys!3101 (v!1497 (underlying!68 thiss!938))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!602 (_keys!3101 (v!1497 (underlying!68 thiss!938))))))))

(declare-fun d!3561 () Bool)

(declare-fun lt!5400 () (_ BitVec 32))

(assert (=> d!3561 (and (bvsge lt!5400 #b00000000000000000000000000000000) (bvsle lt!5400 (bvsub (size!602 (_keys!3101 (v!1497 (underlying!68 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun e!12327 () (_ BitVec 32))

(assert (=> d!3561 (= lt!5400 e!12327)))

(declare-fun c!2055 () Bool)

(assert (=> d!3561 (= c!2055 (bvsge #b00000000000000000000000000000000 (size!602 (_keys!3101 (v!1497 (underlying!68 thiss!938))))))))

(assert (=> d!3561 (and (bvsle #b00000000000000000000000000000000 (size!602 (_keys!3101 (v!1497 (underlying!68 thiss!938))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!602 (_keys!3101 (v!1497 (underlying!68 thiss!938)))) (size!602 (_keys!3101 (v!1497 (underlying!68 thiss!938))))))))

(assert (=> d!3561 (= (arrayCountValidKeys!0 (_keys!3101 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000000000000000 (size!602 (_keys!3101 (v!1497 (underlying!68 thiss!938))))) lt!5400)))

(declare-fun b!19160 () Bool)

(assert (=> b!19160 (= e!12327 e!12328)))

(declare-fun c!2054 () Bool)

(assert (=> b!19160 (= c!2054 (validKeyInArray!0 (select (arr!512 (_keys!3101 (v!1497 (underlying!68 thiss!938)))) #b00000000000000000000000000000000)))))

(declare-fun b!19161 () Bool)

(assert (=> b!19161 (= e!12327 #b00000000000000000000000000000000)))

(declare-fun b!19162 () Bool)

(assert (=> b!19162 (= e!12328 (bvadd #b00000000000000000000000000000001 call!886))))

(assert (= (and d!3561 c!2055) b!19161))

(assert (= (and d!3561 (not c!2055)) b!19160))

(assert (= (and b!19160 c!2054) b!19162))

(assert (= (and b!19160 (not c!2054)) b!19159))

(assert (= (or b!19162 b!19159) bm!883))

(declare-fun m!13569 () Bool)

(assert (=> bm!883 m!13569))

(assert (=> b!19160 m!13553))

(assert (=> b!19160 m!13553))

(assert (=> b!19160 m!13555))

(assert (=> b!19119 d!3561))

(declare-fun b!19171 () Bool)

(declare-fun res!13096 () Bool)

(declare-fun e!12331 () Bool)

(assert (=> b!19171 (=> (not res!13096) (not e!12331))))

(assert (=> b!19171 (= res!13096 (and (= (size!601 (_values!1672 (v!1497 (underlying!68 thiss!938)))) (bvadd (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000000000000001)) (= (size!602 (_keys!3101 (v!1497 (underlying!68 thiss!938)))) (size!601 (_values!1672 (v!1497 (underlying!68 thiss!938))))) (bvsge (_size!90 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000000000000000) (bvsle (_size!90 (v!1497 (underlying!68 thiss!938))) (bvadd (mask!4615 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000000000000001))))))

(declare-fun d!3563 () Bool)

(declare-fun res!13099 () Bool)

(assert (=> d!3563 (=> (not res!13099) (not e!12331))))

(assert (=> d!3563 (= res!13099 (validMask!0 (mask!4615 (v!1497 (underlying!68 thiss!938)))))))

(assert (=> d!3563 (= (simpleValid!10 (v!1497 (underlying!68 thiss!938))) e!12331)))

(declare-fun b!19174 () Bool)

(assert (=> b!19174 (= e!12331 (and (bvsge (extraKeys!1586 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000000000000000) (bvsle (extraKeys!1586 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000000000000011) (bvsge (_vacant!90 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000000000000000)))))

(declare-fun b!19172 () Bool)

(declare-fun res!13098 () Bool)

(assert (=> b!19172 (=> (not res!13098) (not e!12331))))

(declare-fun size!605 (LongMapFixedSize!114) (_ BitVec 32))

(assert (=> b!19172 (= res!13098 (bvsge (size!605 (v!1497 (underlying!68 thiss!938))) (_size!90 (v!1497 (underlying!68 thiss!938)))))))

(declare-fun b!19173 () Bool)

(declare-fun res!13097 () Bool)

(assert (=> b!19173 (=> (not res!13097) (not e!12331))))

(assert (=> b!19173 (= res!13097 (= (size!605 (v!1497 (underlying!68 thiss!938))) (bvadd (_size!90 (v!1497 (underlying!68 thiss!938))) (bvsdiv (bvadd (extraKeys!1586 (v!1497 (underlying!68 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!3563 res!13099) b!19171))

(assert (= (and b!19171 res!13096) b!19172))

(assert (= (and b!19172 res!13098) b!19173))

(assert (= (and b!19173 res!13097) b!19174))

(assert (=> d!3563 m!13525))

(declare-fun m!13571 () Bool)

(assert (=> b!19172 m!13571))

(assert (=> b!19173 m!13571))

(assert (=> d!3555 d!3563))

(declare-fun condMapEmpty!840 () Bool)

(declare-fun mapDefault!840 () ValueCell!264)

(assert (=> mapNonEmpty!839 (= condMapEmpty!840 (= mapRest!839 ((as const (Array (_ BitVec 32) ValueCell!264)) mapDefault!840)))))

(declare-fun e!12332 () Bool)

(declare-fun mapRes!840 () Bool)

(assert (=> mapNonEmpty!839 (= tp!3197 (and e!12332 mapRes!840))))

(declare-fun mapNonEmpty!840 () Bool)

(declare-fun tp!3198 () Bool)

(declare-fun e!12333 () Bool)

(assert (=> mapNonEmpty!840 (= mapRes!840 (and tp!3198 e!12333))))

(declare-fun mapRest!840 () (Array (_ BitVec 32) ValueCell!264))

(declare-fun mapValue!840 () ValueCell!264)

(declare-fun mapKey!840 () (_ BitVec 32))

(assert (=> mapNonEmpty!840 (= mapRest!839 (store mapRest!840 mapKey!840 mapValue!840))))

(declare-fun b!19175 () Bool)

(assert (=> b!19175 (= e!12333 tp_is_empty!927)))

(declare-fun mapIsEmpty!840 () Bool)

(assert (=> mapIsEmpty!840 mapRes!840))

(declare-fun b!19176 () Bool)

(assert (=> b!19176 (= e!12332 tp_is_empty!927)))

(assert (= (and mapNonEmpty!839 condMapEmpty!840) mapIsEmpty!840))

(assert (= (and mapNonEmpty!839 (not condMapEmpty!840)) mapNonEmpty!840))

(assert (= (and mapNonEmpty!840 ((_ is ValueCellFull!264) mapValue!840)) b!19175))

(assert (= (and mapNonEmpty!839 ((_ is ValueCellFull!264) mapDefault!840)) b!19176))

(declare-fun m!13573 () Bool)

(assert (=> mapNonEmpty!840 m!13573))

(check-sat (not b!19133) (not mapNonEmpty!840) (not b!19150) (not b!19147) (not b!19149) (not bm!877) b_and!1323 (not b!19160) (not b_next!663) (not b!19173) (not bm!880) (not b!19172) (not b!19135) tp_is_empty!927 (not bm!883) (not d!3563))
(check-sat b_and!1323 (not b_next!663))
