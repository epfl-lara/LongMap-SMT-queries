; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80622 () Bool)

(assert start!80622)

(declare-fun b!946022 () Bool)

(declare-fun b_free!18133 () Bool)

(declare-fun b_next!18133 () Bool)

(assert (=> b!946022 (= b_free!18133 (not b_next!18133))))

(declare-fun tp!62937 () Bool)

(declare-fun b_and!29529 () Bool)

(assert (=> b!946022 (= tp!62937 b_and!29529)))

(declare-fun res!635186 () Bool)

(declare-fun e!532236 () Bool)

(assert (=> start!80622 (=> (not res!635186) (not e!532236))))

(declare-datatypes ((V!32487 0))(
  ( (V!32488 (val!10371 Int)) )
))
(declare-datatypes ((ValueCell!9839 0))(
  ( (ValueCellFull!9839 (v!12904 V!32487)) (EmptyCell!9839) )
))
(declare-datatypes ((array!57231 0))(
  ( (array!57232 (arr!27533 (Array (_ BitVec 32) ValueCell!9839)) (size!28005 (_ BitVec 32))) )
))
(declare-datatypes ((array!57233 0))(
  ( (array!57234 (arr!27534 (Array (_ BitVec 32) (_ BitVec 64))) (size!28006 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4828 0))(
  ( (LongMapFixedSize!4829 (defaultEntry!5711 Int) (mask!27401 (_ BitVec 32)) (extraKeys!5443 (_ BitVec 32)) (zeroValue!5547 V!32487) (minValue!5547 V!32487) (_size!2469 (_ BitVec 32)) (_keys!10598 array!57233) (_values!5734 array!57231) (_vacant!2469 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4828)

(declare-fun valid!1846 (LongMapFixedSize!4828) Bool)

(assert (=> start!80622 (= res!635186 (valid!1846 thiss!1141))))

(assert (=> start!80622 e!532236))

(declare-fun e!532238 () Bool)

(assert (=> start!80622 e!532238))

(assert (=> start!80622 true))

(declare-fun b!946017 () Bool)

(declare-fun e!532239 () Bool)

(declare-fun tp_is_empty!20641 () Bool)

(assert (=> b!946017 (= e!532239 tp_is_empty!20641)))

(declare-fun b!946018 () Bool)

(declare-fun e!532234 () Bool)

(assert (=> b!946018 (= e!532234 tp_is_empty!20641)))

(declare-fun b!946019 () Bool)

(declare-fun e!532240 () Bool)

(assert (=> b!946019 (= e!532240 (or (not (= (size!28005 (_values!5734 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27401 thiss!1141)))) (= (size!28006 (_keys!10598 thiss!1141)) (size!28005 (_values!5734 thiss!1141)))))))

(declare-fun b!946020 () Bool)

(declare-fun e!532237 () Bool)

(assert (=> b!946020 (= e!532236 e!532237)))

(declare-fun res!635183 () Bool)

(assert (=> b!946020 (=> (not res!635183) (not e!532237))))

(declare-datatypes ((SeekEntryResult!9097 0))(
  ( (MissingZero!9097 (index!38759 (_ BitVec 32))) (Found!9097 (index!38760 (_ BitVec 32))) (Intermediate!9097 (undefined!9909 Bool) (index!38761 (_ BitVec 32)) (x!81353 (_ BitVec 32))) (Undefined!9097) (MissingVacant!9097 (index!38762 (_ BitVec 32))) )
))
(declare-fun lt!426003 () SeekEntryResult!9097)

(get-info :version)

(assert (=> b!946020 (= res!635183 ((_ is Found!9097) lt!426003))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57233 (_ BitVec 32)) SeekEntryResult!9097)

(assert (=> b!946020 (= lt!426003 (seekEntry!0 key!756 (_keys!10598 thiss!1141) (mask!27401 thiss!1141)))))

(declare-fun b!946021 () Bool)

(assert (=> b!946021 (= e!532237 (not e!532240))))

(declare-fun res!635184 () Bool)

(assert (=> b!946021 (=> res!635184 e!532240)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!946021 (= res!635184 (not (validMask!0 (mask!27401 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946021 (arrayContainsKey!0 (_keys!10598 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31778 0))(
  ( (Unit!31779) )
))
(declare-fun lt!426004 () Unit!31778)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57233 (_ BitVec 64) (_ BitVec 32)) Unit!31778)

(assert (=> b!946021 (= lt!426004 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10598 thiss!1141) key!756 (index!38760 lt!426003)))))

(declare-fun mapNonEmpty!32815 () Bool)

(declare-fun mapRes!32815 () Bool)

(declare-fun tp!62938 () Bool)

(assert (=> mapNonEmpty!32815 (= mapRes!32815 (and tp!62938 e!532239))))

(declare-fun mapValue!32815 () ValueCell!9839)

(declare-fun mapRest!32815 () (Array (_ BitVec 32) ValueCell!9839))

(declare-fun mapKey!32815 () (_ BitVec 32))

(assert (=> mapNonEmpty!32815 (= (arr!27533 (_values!5734 thiss!1141)) (store mapRest!32815 mapKey!32815 mapValue!32815))))

(declare-fun mapIsEmpty!32815 () Bool)

(assert (=> mapIsEmpty!32815 mapRes!32815))

(declare-fun e!532235 () Bool)

(declare-fun array_inv!21440 (array!57233) Bool)

(declare-fun array_inv!21441 (array!57231) Bool)

(assert (=> b!946022 (= e!532238 (and tp!62937 tp_is_empty!20641 (array_inv!21440 (_keys!10598 thiss!1141)) (array_inv!21441 (_values!5734 thiss!1141)) e!532235))))

(declare-fun b!946023 () Bool)

(assert (=> b!946023 (= e!532235 (and e!532234 mapRes!32815))))

(declare-fun condMapEmpty!32815 () Bool)

(declare-fun mapDefault!32815 () ValueCell!9839)

(assert (=> b!946023 (= condMapEmpty!32815 (= (arr!27533 (_values!5734 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9839)) mapDefault!32815)))))

(declare-fun b!946024 () Bool)

(declare-fun res!635185 () Bool)

(assert (=> b!946024 (=> (not res!635185) (not e!532236))))

(assert (=> b!946024 (= res!635185 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!80622 res!635186) b!946024))

(assert (= (and b!946024 res!635185) b!946020))

(assert (= (and b!946020 res!635183) b!946021))

(assert (= (and b!946021 (not res!635184)) b!946019))

(assert (= (and b!946023 condMapEmpty!32815) mapIsEmpty!32815))

(assert (= (and b!946023 (not condMapEmpty!32815)) mapNonEmpty!32815))

(assert (= (and mapNonEmpty!32815 ((_ is ValueCellFull!9839) mapValue!32815)) b!946017))

(assert (= (and b!946023 ((_ is ValueCellFull!9839) mapDefault!32815)) b!946018))

(assert (= b!946022 b!946023))

(assert (= start!80622 b!946022))

(declare-fun m!878953 () Bool)

(assert (=> b!946022 m!878953))

(declare-fun m!878955 () Bool)

(assert (=> b!946022 m!878955))

(declare-fun m!878957 () Bool)

(assert (=> start!80622 m!878957))

(declare-fun m!878959 () Bool)

(assert (=> mapNonEmpty!32815 m!878959))

(declare-fun m!878961 () Bool)

(assert (=> b!946021 m!878961))

(declare-fun m!878963 () Bool)

(assert (=> b!946021 m!878963))

(declare-fun m!878965 () Bool)

(assert (=> b!946021 m!878965))

(declare-fun m!878967 () Bool)

(assert (=> b!946020 m!878967))

(check-sat tp_is_empty!20641 (not b!946021) b_and!29529 (not mapNonEmpty!32815) (not b!946020) (not b!946022) (not b_next!18133) (not start!80622))
(check-sat b_and!29529 (not b_next!18133))
(get-model)

(declare-fun d!114315 () Bool)

(declare-fun lt!426026 () SeekEntryResult!9097)

(assert (=> d!114315 (and (or ((_ is MissingVacant!9097) lt!426026) (not ((_ is Found!9097) lt!426026)) (and (bvsge (index!38760 lt!426026) #b00000000000000000000000000000000) (bvslt (index!38760 lt!426026) (size!28006 (_keys!10598 thiss!1141))))) (not ((_ is MissingVacant!9097) lt!426026)) (or (not ((_ is Found!9097) lt!426026)) (= (select (arr!27534 (_keys!10598 thiss!1141)) (index!38760 lt!426026)) key!756)))))

(declare-fun e!532295 () SeekEntryResult!9097)

(assert (=> d!114315 (= lt!426026 e!532295)))

(declare-fun c!98478 () Bool)

(declare-fun lt!426027 () SeekEntryResult!9097)

(assert (=> d!114315 (= c!98478 (and ((_ is Intermediate!9097) lt!426027) (undefined!9909 lt!426027)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57233 (_ BitVec 32)) SeekEntryResult!9097)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114315 (= lt!426027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27401 thiss!1141)) key!756 (_keys!10598 thiss!1141) (mask!27401 thiss!1141)))))

(assert (=> d!114315 (validMask!0 (mask!27401 thiss!1141))))

(assert (=> d!114315 (= (seekEntry!0 key!756 (_keys!10598 thiss!1141) (mask!27401 thiss!1141)) lt!426026)))

(declare-fun b!946085 () Bool)

(declare-fun c!98477 () Bool)

(declare-fun lt!426028 () (_ BitVec 64))

(assert (=> b!946085 (= c!98477 (= lt!426028 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532296 () SeekEntryResult!9097)

(declare-fun e!532297 () SeekEntryResult!9097)

(assert (=> b!946085 (= e!532296 e!532297)))

(declare-fun b!946086 () Bool)

(declare-fun lt!426025 () SeekEntryResult!9097)

(assert (=> b!946086 (= e!532297 (ite ((_ is MissingVacant!9097) lt!426025) (MissingZero!9097 (index!38762 lt!426025)) lt!426025))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57233 (_ BitVec 32)) SeekEntryResult!9097)

(assert (=> b!946086 (= lt!426025 (seekKeyOrZeroReturnVacant!0 (x!81353 lt!426027) (index!38761 lt!426027) (index!38761 lt!426027) key!756 (_keys!10598 thiss!1141) (mask!27401 thiss!1141)))))

(declare-fun b!946087 () Bool)

(assert (=> b!946087 (= e!532295 e!532296)))

(assert (=> b!946087 (= lt!426028 (select (arr!27534 (_keys!10598 thiss!1141)) (index!38761 lt!426027)))))

(declare-fun c!98476 () Bool)

(assert (=> b!946087 (= c!98476 (= lt!426028 key!756))))

(declare-fun b!946088 () Bool)

(assert (=> b!946088 (= e!532296 (Found!9097 (index!38761 lt!426027)))))

(declare-fun b!946089 () Bool)

(assert (=> b!946089 (= e!532295 Undefined!9097)))

(declare-fun b!946090 () Bool)

(assert (=> b!946090 (= e!532297 (MissingZero!9097 (index!38761 lt!426027)))))

(assert (= (and d!114315 c!98478) b!946089))

(assert (= (and d!114315 (not c!98478)) b!946087))

(assert (= (and b!946087 c!98476) b!946088))

(assert (= (and b!946087 (not c!98476)) b!946085))

(assert (= (and b!946085 c!98477) b!946090))

(assert (= (and b!946085 (not c!98477)) b!946086))

(declare-fun m!879001 () Bool)

(assert (=> d!114315 m!879001))

(declare-fun m!879003 () Bool)

(assert (=> d!114315 m!879003))

(assert (=> d!114315 m!879003))

(declare-fun m!879005 () Bool)

(assert (=> d!114315 m!879005))

(assert (=> d!114315 m!878961))

(declare-fun m!879007 () Bool)

(assert (=> b!946086 m!879007))

(declare-fun m!879009 () Bool)

(assert (=> b!946087 m!879009))

(assert (=> b!946020 d!114315))

(declare-fun d!114317 () Bool)

(assert (=> d!114317 (= (array_inv!21440 (_keys!10598 thiss!1141)) (bvsge (size!28006 (_keys!10598 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946022 d!114317))

(declare-fun d!114319 () Bool)

(assert (=> d!114319 (= (array_inv!21441 (_values!5734 thiss!1141)) (bvsge (size!28005 (_values!5734 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946022 d!114319))

(declare-fun d!114321 () Bool)

(declare-fun res!635217 () Bool)

(declare-fun e!532300 () Bool)

(assert (=> d!114321 (=> (not res!635217) (not e!532300))))

(declare-fun simpleValid!357 (LongMapFixedSize!4828) Bool)

(assert (=> d!114321 (= res!635217 (simpleValid!357 thiss!1141))))

(assert (=> d!114321 (= (valid!1846 thiss!1141) e!532300)))

(declare-fun b!946097 () Bool)

(declare-fun res!635218 () Bool)

(assert (=> b!946097 (=> (not res!635218) (not e!532300))))

(declare-fun arrayCountValidKeys!0 (array!57233 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946097 (= res!635218 (= (arrayCountValidKeys!0 (_keys!10598 thiss!1141) #b00000000000000000000000000000000 (size!28006 (_keys!10598 thiss!1141))) (_size!2469 thiss!1141)))))

(declare-fun b!946098 () Bool)

(declare-fun res!635219 () Bool)

(assert (=> b!946098 (=> (not res!635219) (not e!532300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57233 (_ BitVec 32)) Bool)

(assert (=> b!946098 (= res!635219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10598 thiss!1141) (mask!27401 thiss!1141)))))

(declare-fun b!946099 () Bool)

(declare-datatypes ((List!19302 0))(
  ( (Nil!19299) (Cons!19298 (h!20451 (_ BitVec 64)) (t!27614 List!19302)) )
))
(declare-fun arrayNoDuplicates!0 (array!57233 (_ BitVec 32) List!19302) Bool)

(assert (=> b!946099 (= e!532300 (arrayNoDuplicates!0 (_keys!10598 thiss!1141) #b00000000000000000000000000000000 Nil!19299))))

(assert (= (and d!114321 res!635217) b!946097))

(assert (= (and b!946097 res!635218) b!946098))

(assert (= (and b!946098 res!635219) b!946099))

(declare-fun m!879011 () Bool)

(assert (=> d!114321 m!879011))

(declare-fun m!879013 () Bool)

(assert (=> b!946097 m!879013))

(declare-fun m!879015 () Bool)

(assert (=> b!946098 m!879015))

(declare-fun m!879017 () Bool)

(assert (=> b!946099 m!879017))

(assert (=> start!80622 d!114321))

(declare-fun d!114323 () Bool)

(assert (=> d!114323 (= (validMask!0 (mask!27401 thiss!1141)) (and (or (= (mask!27401 thiss!1141) #b00000000000000000000000000000111) (= (mask!27401 thiss!1141) #b00000000000000000000000000001111) (= (mask!27401 thiss!1141) #b00000000000000000000000000011111) (= (mask!27401 thiss!1141) #b00000000000000000000000000111111) (= (mask!27401 thiss!1141) #b00000000000000000000000001111111) (= (mask!27401 thiss!1141) #b00000000000000000000000011111111) (= (mask!27401 thiss!1141) #b00000000000000000000000111111111) (= (mask!27401 thiss!1141) #b00000000000000000000001111111111) (= (mask!27401 thiss!1141) #b00000000000000000000011111111111) (= (mask!27401 thiss!1141) #b00000000000000000000111111111111) (= (mask!27401 thiss!1141) #b00000000000000000001111111111111) (= (mask!27401 thiss!1141) #b00000000000000000011111111111111) (= (mask!27401 thiss!1141) #b00000000000000000111111111111111) (= (mask!27401 thiss!1141) #b00000000000000001111111111111111) (= (mask!27401 thiss!1141) #b00000000000000011111111111111111) (= (mask!27401 thiss!1141) #b00000000000000111111111111111111) (= (mask!27401 thiss!1141) #b00000000000001111111111111111111) (= (mask!27401 thiss!1141) #b00000000000011111111111111111111) (= (mask!27401 thiss!1141) #b00000000000111111111111111111111) (= (mask!27401 thiss!1141) #b00000000001111111111111111111111) (= (mask!27401 thiss!1141) #b00000000011111111111111111111111) (= (mask!27401 thiss!1141) #b00000000111111111111111111111111) (= (mask!27401 thiss!1141) #b00000001111111111111111111111111) (= (mask!27401 thiss!1141) #b00000011111111111111111111111111) (= (mask!27401 thiss!1141) #b00000111111111111111111111111111) (= (mask!27401 thiss!1141) #b00001111111111111111111111111111) (= (mask!27401 thiss!1141) #b00011111111111111111111111111111) (= (mask!27401 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27401 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!946021 d!114323))

(declare-fun d!114325 () Bool)

(declare-fun res!635224 () Bool)

(declare-fun e!532305 () Bool)

(assert (=> d!114325 (=> res!635224 e!532305)))

(assert (=> d!114325 (= res!635224 (= (select (arr!27534 (_keys!10598 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114325 (= (arrayContainsKey!0 (_keys!10598 thiss!1141) key!756 #b00000000000000000000000000000000) e!532305)))

(declare-fun b!946104 () Bool)

(declare-fun e!532306 () Bool)

(assert (=> b!946104 (= e!532305 e!532306)))

(declare-fun res!635225 () Bool)

(assert (=> b!946104 (=> (not res!635225) (not e!532306))))

(assert (=> b!946104 (= res!635225 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28006 (_keys!10598 thiss!1141))))))

(declare-fun b!946105 () Bool)

(assert (=> b!946105 (= e!532306 (arrayContainsKey!0 (_keys!10598 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114325 (not res!635224)) b!946104))

(assert (= (and b!946104 res!635225) b!946105))

(declare-fun m!879019 () Bool)

(assert (=> d!114325 m!879019))

(declare-fun m!879021 () Bool)

(assert (=> b!946105 m!879021))

(assert (=> b!946021 d!114325))

(declare-fun d!114327 () Bool)

(assert (=> d!114327 (arrayContainsKey!0 (_keys!10598 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426031 () Unit!31778)

(declare-fun choose!13 (array!57233 (_ BitVec 64) (_ BitVec 32)) Unit!31778)

(assert (=> d!114327 (= lt!426031 (choose!13 (_keys!10598 thiss!1141) key!756 (index!38760 lt!426003)))))

(assert (=> d!114327 (bvsge (index!38760 lt!426003) #b00000000000000000000000000000000)))

(assert (=> d!114327 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10598 thiss!1141) key!756 (index!38760 lt!426003)) lt!426031)))

(declare-fun bs!26568 () Bool)

(assert (= bs!26568 d!114327))

(assert (=> bs!26568 m!878963))

(declare-fun m!879023 () Bool)

(assert (=> bs!26568 m!879023))

(assert (=> b!946021 d!114327))

(declare-fun b!946113 () Bool)

(declare-fun e!532311 () Bool)

(assert (=> b!946113 (= e!532311 tp_is_empty!20641)))

(declare-fun mapIsEmpty!32824 () Bool)

(declare-fun mapRes!32824 () Bool)

(assert (=> mapIsEmpty!32824 mapRes!32824))

(declare-fun mapNonEmpty!32824 () Bool)

(declare-fun tp!62953 () Bool)

(declare-fun e!532312 () Bool)

(assert (=> mapNonEmpty!32824 (= mapRes!32824 (and tp!62953 e!532312))))

(declare-fun mapKey!32824 () (_ BitVec 32))

(declare-fun mapRest!32824 () (Array (_ BitVec 32) ValueCell!9839))

(declare-fun mapValue!32824 () ValueCell!9839)

(assert (=> mapNonEmpty!32824 (= mapRest!32815 (store mapRest!32824 mapKey!32824 mapValue!32824))))

(declare-fun condMapEmpty!32824 () Bool)

(declare-fun mapDefault!32824 () ValueCell!9839)

(assert (=> mapNonEmpty!32815 (= condMapEmpty!32824 (= mapRest!32815 ((as const (Array (_ BitVec 32) ValueCell!9839)) mapDefault!32824)))))

(assert (=> mapNonEmpty!32815 (= tp!62938 (and e!532311 mapRes!32824))))

(declare-fun b!946112 () Bool)

(assert (=> b!946112 (= e!532312 tp_is_empty!20641)))

(assert (= (and mapNonEmpty!32815 condMapEmpty!32824) mapIsEmpty!32824))

(assert (= (and mapNonEmpty!32815 (not condMapEmpty!32824)) mapNonEmpty!32824))

(assert (= (and mapNonEmpty!32824 ((_ is ValueCellFull!9839) mapValue!32824)) b!946112))

(assert (= (and mapNonEmpty!32815 ((_ is ValueCellFull!9839) mapDefault!32824)) b!946113))

(declare-fun m!879025 () Bool)

(assert (=> mapNonEmpty!32824 m!879025))

(check-sat (not b!946099) (not b_next!18133) tp_is_empty!20641 (not d!114321) (not b!946105) (not mapNonEmpty!32824) (not d!114327) (not b!946086) (not b!946097) (not d!114315) (not b!946098) b_and!29529)
(check-sat b_and!29529 (not b_next!18133))
(get-model)

(declare-fun b!946122 () Bool)

(declare-fun e!532317 () (_ BitVec 32))

(declare-fun call!41053 () (_ BitVec 32))

(assert (=> b!946122 (= e!532317 (bvadd #b00000000000000000000000000000001 call!41053))))

(declare-fun d!114329 () Bool)

(declare-fun lt!426034 () (_ BitVec 32))

(assert (=> d!114329 (and (bvsge lt!426034 #b00000000000000000000000000000000) (bvsle lt!426034 (bvsub (size!28006 (_keys!10598 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!532318 () (_ BitVec 32))

(assert (=> d!114329 (= lt!426034 e!532318)))

(declare-fun c!98484 () Bool)

(assert (=> d!114329 (= c!98484 (bvsge #b00000000000000000000000000000000 (size!28006 (_keys!10598 thiss!1141))))))

(assert (=> d!114329 (and (bvsle #b00000000000000000000000000000000 (size!28006 (_keys!10598 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28006 (_keys!10598 thiss!1141)) (size!28006 (_keys!10598 thiss!1141))))))

(assert (=> d!114329 (= (arrayCountValidKeys!0 (_keys!10598 thiss!1141) #b00000000000000000000000000000000 (size!28006 (_keys!10598 thiss!1141))) lt!426034)))

(declare-fun b!946123 () Bool)

(assert (=> b!946123 (= e!532318 #b00000000000000000000000000000000)))

(declare-fun bm!41050 () Bool)

(assert (=> bm!41050 (= call!41053 (arrayCountValidKeys!0 (_keys!10598 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28006 (_keys!10598 thiss!1141))))))

(declare-fun b!946124 () Bool)

(assert (=> b!946124 (= e!532317 call!41053)))

(declare-fun b!946125 () Bool)

(assert (=> b!946125 (= e!532318 e!532317)))

(declare-fun c!98483 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!946125 (= c!98483 (validKeyInArray!0 (select (arr!27534 (_keys!10598 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114329 c!98484) b!946123))

(assert (= (and d!114329 (not c!98484)) b!946125))

(assert (= (and b!946125 c!98483) b!946122))

(assert (= (and b!946125 (not c!98483)) b!946124))

(assert (= (or b!946122 b!946124) bm!41050))

(declare-fun m!879027 () Bool)

(assert (=> bm!41050 m!879027))

(assert (=> b!946125 m!879019))

(assert (=> b!946125 m!879019))

(declare-fun m!879029 () Bool)

(assert (=> b!946125 m!879029))

(assert (=> b!946097 d!114329))

(declare-fun b!946138 () Bool)

(declare-fun e!532326 () SeekEntryResult!9097)

(assert (=> b!946138 (= e!532326 (MissingVacant!9097 (index!38761 lt!426027)))))

(declare-fun b!946139 () Bool)

(declare-fun e!532327 () SeekEntryResult!9097)

(assert (=> b!946139 (= e!532327 Undefined!9097)))

(declare-fun d!114331 () Bool)

(declare-fun lt!426039 () SeekEntryResult!9097)

(assert (=> d!114331 (and (or ((_ is Undefined!9097) lt!426039) (not ((_ is Found!9097) lt!426039)) (and (bvsge (index!38760 lt!426039) #b00000000000000000000000000000000) (bvslt (index!38760 lt!426039) (size!28006 (_keys!10598 thiss!1141))))) (or ((_ is Undefined!9097) lt!426039) ((_ is Found!9097) lt!426039) (not ((_ is MissingVacant!9097) lt!426039)) (not (= (index!38762 lt!426039) (index!38761 lt!426027))) (and (bvsge (index!38762 lt!426039) #b00000000000000000000000000000000) (bvslt (index!38762 lt!426039) (size!28006 (_keys!10598 thiss!1141))))) (or ((_ is Undefined!9097) lt!426039) (ite ((_ is Found!9097) lt!426039) (= (select (arr!27534 (_keys!10598 thiss!1141)) (index!38760 lt!426039)) key!756) (and ((_ is MissingVacant!9097) lt!426039) (= (index!38762 lt!426039) (index!38761 lt!426027)) (= (select (arr!27534 (_keys!10598 thiss!1141)) (index!38762 lt!426039)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114331 (= lt!426039 e!532327)))

(declare-fun c!98492 () Bool)

(assert (=> d!114331 (= c!98492 (bvsge (x!81353 lt!426027) #b01111111111111111111111111111110))))

(declare-fun lt!426040 () (_ BitVec 64))

(assert (=> d!114331 (= lt!426040 (select (arr!27534 (_keys!10598 thiss!1141)) (index!38761 lt!426027)))))

(assert (=> d!114331 (validMask!0 (mask!27401 thiss!1141))))

(assert (=> d!114331 (= (seekKeyOrZeroReturnVacant!0 (x!81353 lt!426027) (index!38761 lt!426027) (index!38761 lt!426027) key!756 (_keys!10598 thiss!1141) (mask!27401 thiss!1141)) lt!426039)))

(declare-fun b!946140 () Bool)

(declare-fun e!532325 () SeekEntryResult!9097)

(assert (=> b!946140 (= e!532327 e!532325)))

(declare-fun c!98491 () Bool)

(assert (=> b!946140 (= c!98491 (= lt!426040 key!756))))

(declare-fun b!946141 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946141 (= e!532326 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81353 lt!426027) #b00000000000000000000000000000001) (nextIndex!0 (index!38761 lt!426027) (x!81353 lt!426027) (mask!27401 thiss!1141)) (index!38761 lt!426027) key!756 (_keys!10598 thiss!1141) (mask!27401 thiss!1141)))))

(declare-fun b!946142 () Bool)

(declare-fun c!98493 () Bool)

(assert (=> b!946142 (= c!98493 (= lt!426040 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!946142 (= e!532325 e!532326)))

(declare-fun b!946143 () Bool)

(assert (=> b!946143 (= e!532325 (Found!9097 (index!38761 lt!426027)))))

(assert (= (and d!114331 c!98492) b!946139))

(assert (= (and d!114331 (not c!98492)) b!946140))

(assert (= (and b!946140 c!98491) b!946143))

(assert (= (and b!946140 (not c!98491)) b!946142))

(assert (= (and b!946142 c!98493) b!946138))

(assert (= (and b!946142 (not c!98493)) b!946141))

(declare-fun m!879031 () Bool)

(assert (=> d!114331 m!879031))

(declare-fun m!879033 () Bool)

(assert (=> d!114331 m!879033))

(assert (=> d!114331 m!879009))

(assert (=> d!114331 m!878961))

(declare-fun m!879035 () Bool)

(assert (=> b!946141 m!879035))

(assert (=> b!946141 m!879035))

(declare-fun m!879037 () Bool)

(assert (=> b!946141 m!879037))

(assert (=> b!946086 d!114331))

(declare-fun b!946155 () Bool)

(declare-fun e!532330 () Bool)

(assert (=> b!946155 (= e!532330 (and (bvsge (extraKeys!5443 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5443 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2469 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!946154 () Bool)

(declare-fun res!635236 () Bool)

(assert (=> b!946154 (=> (not res!635236) (not e!532330))))

(declare-fun size!28011 (LongMapFixedSize!4828) (_ BitVec 32))

(assert (=> b!946154 (= res!635236 (= (size!28011 thiss!1141) (bvadd (_size!2469 thiss!1141) (bvsdiv (bvadd (extraKeys!5443 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!114333 () Bool)

(declare-fun res!635237 () Bool)

(assert (=> d!114333 (=> (not res!635237) (not e!532330))))

(assert (=> d!114333 (= res!635237 (validMask!0 (mask!27401 thiss!1141)))))

(assert (=> d!114333 (= (simpleValid!357 thiss!1141) e!532330)))

(declare-fun b!946153 () Bool)

(declare-fun res!635234 () Bool)

(assert (=> b!946153 (=> (not res!635234) (not e!532330))))

(assert (=> b!946153 (= res!635234 (bvsge (size!28011 thiss!1141) (_size!2469 thiss!1141)))))

(declare-fun b!946152 () Bool)

(declare-fun res!635235 () Bool)

(assert (=> b!946152 (=> (not res!635235) (not e!532330))))

(assert (=> b!946152 (= res!635235 (and (= (size!28005 (_values!5734 thiss!1141)) (bvadd (mask!27401 thiss!1141) #b00000000000000000000000000000001)) (= (size!28006 (_keys!10598 thiss!1141)) (size!28005 (_values!5734 thiss!1141))) (bvsge (_size!2469 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2469 thiss!1141) (bvadd (mask!27401 thiss!1141) #b00000000000000000000000000000001))))))

(assert (= (and d!114333 res!635237) b!946152))

(assert (= (and b!946152 res!635235) b!946153))

(assert (= (and b!946153 res!635234) b!946154))

(assert (= (and b!946154 res!635236) b!946155))

(declare-fun m!879039 () Bool)

(assert (=> b!946154 m!879039))

(assert (=> d!114333 m!878961))

(assert (=> b!946153 m!879039))

(assert (=> d!114321 d!114333))

(declare-fun b!946164 () Bool)

(declare-fun e!532338 () Bool)

(declare-fun e!532339 () Bool)

(assert (=> b!946164 (= e!532338 e!532339)))

(declare-fun lt!426048 () (_ BitVec 64))

(assert (=> b!946164 (= lt!426048 (select (arr!27534 (_keys!10598 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426049 () Unit!31778)

(assert (=> b!946164 (= lt!426049 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10598 thiss!1141) lt!426048 #b00000000000000000000000000000000))))

(assert (=> b!946164 (arrayContainsKey!0 (_keys!10598 thiss!1141) lt!426048 #b00000000000000000000000000000000)))

(declare-fun lt!426047 () Unit!31778)

(assert (=> b!946164 (= lt!426047 lt!426049)))

(declare-fun res!635243 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57233 (_ BitVec 32)) SeekEntryResult!9097)

(assert (=> b!946164 (= res!635243 (= (seekEntryOrOpen!0 (select (arr!27534 (_keys!10598 thiss!1141)) #b00000000000000000000000000000000) (_keys!10598 thiss!1141) (mask!27401 thiss!1141)) (Found!9097 #b00000000000000000000000000000000)))))

(assert (=> b!946164 (=> (not res!635243) (not e!532339))))

(declare-fun b!946165 () Bool)

(declare-fun call!41056 () Bool)

(assert (=> b!946165 (= e!532339 call!41056)))

(declare-fun bm!41053 () Bool)

(assert (=> bm!41053 (= call!41056 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10598 thiss!1141) (mask!27401 thiss!1141)))))

(declare-fun b!946166 () Bool)

(declare-fun e!532337 () Bool)

(assert (=> b!946166 (= e!532337 e!532338)))

(declare-fun c!98496 () Bool)

(assert (=> b!946166 (= c!98496 (validKeyInArray!0 (select (arr!27534 (_keys!10598 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946167 () Bool)

(assert (=> b!946167 (= e!532338 call!41056)))

(declare-fun d!114335 () Bool)

(declare-fun res!635242 () Bool)

(assert (=> d!114335 (=> res!635242 e!532337)))

(assert (=> d!114335 (= res!635242 (bvsge #b00000000000000000000000000000000 (size!28006 (_keys!10598 thiss!1141))))))

(assert (=> d!114335 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10598 thiss!1141) (mask!27401 thiss!1141)) e!532337)))

(assert (= (and d!114335 (not res!635242)) b!946166))

(assert (= (and b!946166 c!98496) b!946164))

(assert (= (and b!946166 (not c!98496)) b!946167))

(assert (= (and b!946164 res!635243) b!946165))

(assert (= (or b!946165 b!946167) bm!41053))

(assert (=> b!946164 m!879019))

(declare-fun m!879041 () Bool)

(assert (=> b!946164 m!879041))

(declare-fun m!879043 () Bool)

(assert (=> b!946164 m!879043))

(assert (=> b!946164 m!879019))

(declare-fun m!879045 () Bool)

(assert (=> b!946164 m!879045))

(declare-fun m!879047 () Bool)

(assert (=> bm!41053 m!879047))

(assert (=> b!946166 m!879019))

(assert (=> b!946166 m!879019))

(assert (=> b!946166 m!879029))

(assert (=> b!946098 d!114335))

(declare-fun d!114337 () Bool)

(declare-fun res!635244 () Bool)

(declare-fun e!532340 () Bool)

(assert (=> d!114337 (=> res!635244 e!532340)))

(assert (=> d!114337 (= res!635244 (= (select (arr!27534 (_keys!10598 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!114337 (= (arrayContainsKey!0 (_keys!10598 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!532340)))

(declare-fun b!946168 () Bool)

(declare-fun e!532341 () Bool)

(assert (=> b!946168 (= e!532340 e!532341)))

(declare-fun res!635245 () Bool)

(assert (=> b!946168 (=> (not res!635245) (not e!532341))))

(assert (=> b!946168 (= res!635245 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!28006 (_keys!10598 thiss!1141))))))

(declare-fun b!946169 () Bool)

(assert (=> b!946169 (= e!532341 (arrayContainsKey!0 (_keys!10598 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!114337 (not res!635244)) b!946168))

(assert (= (and b!946168 res!635245) b!946169))

(declare-fun m!879049 () Bool)

(assert (=> d!114337 m!879049))

(declare-fun m!879051 () Bool)

(assert (=> b!946169 m!879051))

(assert (=> b!946105 d!114337))

(declare-fun b!946180 () Bool)

(declare-fun e!532352 () Bool)

(declare-fun call!41059 () Bool)

(assert (=> b!946180 (= e!532352 call!41059)))

(declare-fun b!946181 () Bool)

(assert (=> b!946181 (= e!532352 call!41059)))

(declare-fun b!946182 () Bool)

(declare-fun e!532350 () Bool)

(declare-fun contains!5157 (List!19302 (_ BitVec 64)) Bool)

(assert (=> b!946182 (= e!532350 (contains!5157 Nil!19299 (select (arr!27534 (_keys!10598 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946183 () Bool)

(declare-fun e!532351 () Bool)

(assert (=> b!946183 (= e!532351 e!532352)))

(declare-fun c!98499 () Bool)

(assert (=> b!946183 (= c!98499 (validKeyInArray!0 (select (arr!27534 (_keys!10598 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114339 () Bool)

(declare-fun res!635254 () Bool)

(declare-fun e!532353 () Bool)

(assert (=> d!114339 (=> res!635254 e!532353)))

(assert (=> d!114339 (= res!635254 (bvsge #b00000000000000000000000000000000 (size!28006 (_keys!10598 thiss!1141))))))

(assert (=> d!114339 (= (arrayNoDuplicates!0 (_keys!10598 thiss!1141) #b00000000000000000000000000000000 Nil!19299) e!532353)))

(declare-fun b!946184 () Bool)

(assert (=> b!946184 (= e!532353 e!532351)))

(declare-fun res!635253 () Bool)

(assert (=> b!946184 (=> (not res!635253) (not e!532351))))

(assert (=> b!946184 (= res!635253 (not e!532350))))

(declare-fun res!635252 () Bool)

(assert (=> b!946184 (=> (not res!635252) (not e!532350))))

(assert (=> b!946184 (= res!635252 (validKeyInArray!0 (select (arr!27534 (_keys!10598 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41056 () Bool)

(assert (=> bm!41056 (= call!41059 (arrayNoDuplicates!0 (_keys!10598 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98499 (Cons!19298 (select (arr!27534 (_keys!10598 thiss!1141)) #b00000000000000000000000000000000) Nil!19299) Nil!19299)))))

(assert (= (and d!114339 (not res!635254)) b!946184))

(assert (= (and b!946184 res!635252) b!946182))

(assert (= (and b!946184 res!635253) b!946183))

(assert (= (and b!946183 c!98499) b!946180))

(assert (= (and b!946183 (not c!98499)) b!946181))

(assert (= (or b!946180 b!946181) bm!41056))

(assert (=> b!946182 m!879019))

(assert (=> b!946182 m!879019))

(declare-fun m!879053 () Bool)

(assert (=> b!946182 m!879053))

(assert (=> b!946183 m!879019))

(assert (=> b!946183 m!879019))

(assert (=> b!946183 m!879029))

(assert (=> b!946184 m!879019))

(assert (=> b!946184 m!879019))

(assert (=> b!946184 m!879029))

(assert (=> bm!41056 m!879019))

(declare-fun m!879055 () Bool)

(assert (=> bm!41056 m!879055))

(assert (=> b!946099 d!114339))

(assert (=> d!114327 d!114325))

(declare-fun d!114341 () Bool)

(assert (=> d!114341 (arrayContainsKey!0 (_keys!10598 thiss!1141) key!756 #b00000000000000000000000000000000)))

(assert (=> d!114341 true))

(declare-fun _$60!430 () Unit!31778)

(assert (=> d!114341 (= (choose!13 (_keys!10598 thiss!1141) key!756 (index!38760 lt!426003)) _$60!430)))

(declare-fun bs!26569 () Bool)

(assert (= bs!26569 d!114341))

(assert (=> bs!26569 m!878963))

(assert (=> d!114327 d!114341))

(declare-fun b!946203 () Bool)

(declare-fun e!532367 () Bool)

(declare-fun e!532366 () Bool)

(assert (=> b!946203 (= e!532367 e!532366)))

(declare-fun res!635261 () Bool)

(declare-fun lt!426055 () SeekEntryResult!9097)

(assert (=> b!946203 (= res!635261 (and ((_ is Intermediate!9097) lt!426055) (not (undefined!9909 lt!426055)) (bvslt (x!81353 lt!426055) #b01111111111111111111111111111110) (bvsge (x!81353 lt!426055) #b00000000000000000000000000000000) (bvsge (x!81353 lt!426055) #b00000000000000000000000000000000)))))

(assert (=> b!946203 (=> (not res!635261) (not e!532366))))

(declare-fun b!946204 () Bool)

(declare-fun e!532368 () SeekEntryResult!9097)

(declare-fun e!532364 () SeekEntryResult!9097)

(assert (=> b!946204 (= e!532368 e!532364)))

(declare-fun c!98507 () Bool)

(declare-fun lt!426054 () (_ BitVec 64))

(assert (=> b!946204 (= c!98507 (or (= lt!426054 key!756) (= (bvadd lt!426054 lt!426054) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!946205 () Bool)

(assert (=> b!946205 (and (bvsge (index!38761 lt!426055) #b00000000000000000000000000000000) (bvslt (index!38761 lt!426055) (size!28006 (_keys!10598 thiss!1141))))))

(declare-fun e!532365 () Bool)

(assert (=> b!946205 (= e!532365 (= (select (arr!27534 (_keys!10598 thiss!1141)) (index!38761 lt!426055)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!946206 () Bool)

(assert (=> b!946206 (and (bvsge (index!38761 lt!426055) #b00000000000000000000000000000000) (bvslt (index!38761 lt!426055) (size!28006 (_keys!10598 thiss!1141))))))

(declare-fun res!635262 () Bool)

(assert (=> b!946206 (= res!635262 (= (select (arr!27534 (_keys!10598 thiss!1141)) (index!38761 lt!426055)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!946206 (=> res!635262 e!532365)))

(declare-fun b!946207 () Bool)

(assert (=> b!946207 (= e!532367 (bvsge (x!81353 lt!426055) #b01111111111111111111111111111110))))

(declare-fun b!946208 () Bool)

(assert (=> b!946208 (= e!532368 (Intermediate!9097 true (toIndex!0 key!756 (mask!27401 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!946209 () Bool)

(assert (=> b!946209 (= e!532364 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27401 thiss!1141)) #b00000000000000000000000000000000 (mask!27401 thiss!1141)) key!756 (_keys!10598 thiss!1141) (mask!27401 thiss!1141)))))

(declare-fun d!114343 () Bool)

(assert (=> d!114343 e!532367))

(declare-fun c!98508 () Bool)

(assert (=> d!114343 (= c!98508 (and ((_ is Intermediate!9097) lt!426055) (undefined!9909 lt!426055)))))

(assert (=> d!114343 (= lt!426055 e!532368)))

(declare-fun c!98506 () Bool)

(assert (=> d!114343 (= c!98506 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!114343 (= lt!426054 (select (arr!27534 (_keys!10598 thiss!1141)) (toIndex!0 key!756 (mask!27401 thiss!1141))))))

(assert (=> d!114343 (validMask!0 (mask!27401 thiss!1141))))

(assert (=> d!114343 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27401 thiss!1141)) key!756 (_keys!10598 thiss!1141) (mask!27401 thiss!1141)) lt!426055)))

(declare-fun b!946210 () Bool)

(assert (=> b!946210 (= e!532364 (Intermediate!9097 false (toIndex!0 key!756 (mask!27401 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!946211 () Bool)

(assert (=> b!946211 (and (bvsge (index!38761 lt!426055) #b00000000000000000000000000000000) (bvslt (index!38761 lt!426055) (size!28006 (_keys!10598 thiss!1141))))))

(declare-fun res!635263 () Bool)

(assert (=> b!946211 (= res!635263 (= (select (arr!27534 (_keys!10598 thiss!1141)) (index!38761 lt!426055)) key!756))))

(assert (=> b!946211 (=> res!635263 e!532365)))

(assert (=> b!946211 (= e!532366 e!532365)))

(assert (= (and d!114343 c!98506) b!946208))

(assert (= (and d!114343 (not c!98506)) b!946204))

(assert (= (and b!946204 c!98507) b!946210))

(assert (= (and b!946204 (not c!98507)) b!946209))

(assert (= (and d!114343 c!98508) b!946207))

(assert (= (and d!114343 (not c!98508)) b!946203))

(assert (= (and b!946203 res!635261) b!946211))

(assert (= (and b!946211 (not res!635263)) b!946206))

(assert (= (and b!946206 (not res!635262)) b!946205))

(declare-fun m!879057 () Bool)

(assert (=> b!946205 m!879057))

(assert (=> b!946209 m!879003))

(declare-fun m!879059 () Bool)

(assert (=> b!946209 m!879059))

(assert (=> b!946209 m!879059))

(declare-fun m!879061 () Bool)

(assert (=> b!946209 m!879061))

(assert (=> b!946211 m!879057))

(assert (=> d!114343 m!879003))

(declare-fun m!879063 () Bool)

(assert (=> d!114343 m!879063))

(assert (=> d!114343 m!878961))

(assert (=> b!946206 m!879057))

(assert (=> d!114315 d!114343))

(declare-fun d!114345 () Bool)

(declare-fun lt!426061 () (_ BitVec 32))

(declare-fun lt!426060 () (_ BitVec 32))

(assert (=> d!114345 (= lt!426061 (bvmul (bvxor lt!426060 (bvlshr lt!426060 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114345 (= lt!426060 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114345 (and (bvsge (mask!27401 thiss!1141) #b00000000000000000000000000000000) (let ((res!635264 (let ((h!20452 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81371 (bvmul (bvxor h!20452 (bvlshr h!20452 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81371 (bvlshr x!81371 #b00000000000000000000000000001101)) (mask!27401 thiss!1141)))))) (and (bvslt res!635264 (bvadd (mask!27401 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!635264 #b00000000000000000000000000000000))))))

(assert (=> d!114345 (= (toIndex!0 key!756 (mask!27401 thiss!1141)) (bvand (bvxor lt!426061 (bvlshr lt!426061 #b00000000000000000000000000001101)) (mask!27401 thiss!1141)))))

(assert (=> d!114315 d!114345))

(assert (=> d!114315 d!114323))

(declare-fun b!946213 () Bool)

(declare-fun e!532369 () Bool)

(assert (=> b!946213 (= e!532369 tp_is_empty!20641)))

(declare-fun mapIsEmpty!32825 () Bool)

(declare-fun mapRes!32825 () Bool)

(assert (=> mapIsEmpty!32825 mapRes!32825))

(declare-fun mapNonEmpty!32825 () Bool)

(declare-fun tp!62954 () Bool)

(declare-fun e!532370 () Bool)

(assert (=> mapNonEmpty!32825 (= mapRes!32825 (and tp!62954 e!532370))))

(declare-fun mapValue!32825 () ValueCell!9839)

(declare-fun mapKey!32825 () (_ BitVec 32))

(declare-fun mapRest!32825 () (Array (_ BitVec 32) ValueCell!9839))

(assert (=> mapNonEmpty!32825 (= mapRest!32824 (store mapRest!32825 mapKey!32825 mapValue!32825))))

(declare-fun condMapEmpty!32825 () Bool)

(declare-fun mapDefault!32825 () ValueCell!9839)

(assert (=> mapNonEmpty!32824 (= condMapEmpty!32825 (= mapRest!32824 ((as const (Array (_ BitVec 32) ValueCell!9839)) mapDefault!32825)))))

(assert (=> mapNonEmpty!32824 (= tp!62953 (and e!532369 mapRes!32825))))

(declare-fun b!946212 () Bool)

(assert (=> b!946212 (= e!532370 tp_is_empty!20641)))

(assert (= (and mapNonEmpty!32824 condMapEmpty!32825) mapIsEmpty!32825))

(assert (= (and mapNonEmpty!32824 (not condMapEmpty!32825)) mapNonEmpty!32825))

(assert (= (and mapNonEmpty!32825 ((_ is ValueCellFull!9839) mapValue!32825)) b!946212))

(assert (= (and mapNonEmpty!32824 ((_ is ValueCellFull!9839) mapDefault!32825)) b!946213))

(declare-fun m!879065 () Bool)

(assert (=> mapNonEmpty!32825 m!879065))

(check-sat (not d!114333) (not b!946183) (not b_next!18133) (not b!946154) (not bm!41056) tp_is_empty!20641 (not b!946184) (not mapNonEmpty!32825) (not d!114343) b_and!29529 (not b!946125) (not bm!41050) (not d!114341) (not b!946166) (not b!946153) (not b!946182) (not b!946209) (not b!946164) (not d!114331) (not bm!41053) (not b!946169) (not b!946141))
(check-sat b_and!29529 (not b_next!18133))
