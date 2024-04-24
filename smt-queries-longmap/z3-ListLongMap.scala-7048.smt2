; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89550 () Bool)

(assert start!89550)

(declare-fun b!1025333 () Bool)

(declare-fun b_free!20341 () Bool)

(declare-fun b_next!20341 () Bool)

(assert (=> b!1025333 (= b_free!20341 (not b_next!20341))))

(declare-fun tp!72061 () Bool)

(declare-fun b_and!32597 () Bool)

(assert (=> b!1025333 (= tp!72061 b_and!32597)))

(declare-fun b!1025328 () Bool)

(declare-fun res!686183 () Bool)

(declare-fun e!577988 () Bool)

(assert (=> b!1025328 (=> (not res!686183) (not e!577988))))

(declare-datatypes ((V!36955 0))(
  ( (V!36956 (val!12081 Int)) )
))
(declare-datatypes ((ValueCell!11327 0))(
  ( (ValueCellFull!11327 (v!14646 V!36955)) (EmptyCell!11327) )
))
(declare-datatypes ((array!64217 0))(
  ( (array!64218 (arr!30913 (Array (_ BitVec 32) (_ BitVec 64))) (size!31426 (_ BitVec 32))) )
))
(declare-datatypes ((array!64219 0))(
  ( (array!64220 (arr!30914 (Array (_ BitVec 32) ValueCell!11327)) (size!31427 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5248 0))(
  ( (LongMapFixedSize!5249 (defaultEntry!5976 Int) (mask!29675 (_ BitVec 32)) (extraKeys!5708 (_ BitVec 32)) (zeroValue!5812 V!36955) (minValue!5812 V!36955) (_size!2679 (_ BitVec 32)) (_keys!11160 array!64217) (_values!5999 array!64219) (_vacant!2679 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5248)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025328 (= res!686183 (validMask!0 (mask!29675 thiss!1427)))))

(declare-fun b!1025329 () Bool)

(assert (=> b!1025329 (= e!577988 (not (= (size!31426 (_keys!11160 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29675 thiss!1427)))))))

(declare-fun mapIsEmpty!37513 () Bool)

(declare-fun mapRes!37513 () Bool)

(assert (=> mapIsEmpty!37513 mapRes!37513))

(declare-fun mapNonEmpty!37513 () Bool)

(declare-fun tp!72062 () Bool)

(declare-fun e!577991 () Bool)

(assert (=> mapNonEmpty!37513 (= mapRes!37513 (and tp!72062 e!577991))))

(declare-fun mapRest!37513 () (Array (_ BitVec 32) ValueCell!11327))

(declare-fun mapValue!37513 () ValueCell!11327)

(declare-fun mapKey!37513 () (_ BitVec 32))

(assert (=> mapNonEmpty!37513 (= (arr!30914 (_values!5999 thiss!1427)) (store mapRest!37513 mapKey!37513 mapValue!37513))))

(declare-fun b!1025330 () Bool)

(declare-fun res!686181 () Bool)

(assert (=> b!1025330 (=> (not res!686181) (not e!577988))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025330 (= res!686181 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025331 () Bool)

(declare-fun e!577986 () Bool)

(declare-fun e!577990 () Bool)

(assert (=> b!1025331 (= e!577986 (and e!577990 mapRes!37513))))

(declare-fun condMapEmpty!37513 () Bool)

(declare-fun mapDefault!37513 () ValueCell!11327)

(assert (=> b!1025331 (= condMapEmpty!37513 (= (arr!30914 (_values!5999 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11327)) mapDefault!37513)))))

(declare-fun b!1025332 () Bool)

(declare-fun tp_is_empty!24061 () Bool)

(assert (=> b!1025332 (= e!577990 tp_is_empty!24061)))

(declare-fun e!577989 () Bool)

(declare-fun array_inv!23967 (array!64217) Bool)

(declare-fun array_inv!23968 (array!64219) Bool)

(assert (=> b!1025333 (= e!577989 (and tp!72061 tp_is_empty!24061 (array_inv!23967 (_keys!11160 thiss!1427)) (array_inv!23968 (_values!5999 thiss!1427)) e!577986))))

(declare-fun b!1025334 () Bool)

(assert (=> b!1025334 (= e!577991 tp_is_empty!24061)))

(declare-fun res!686182 () Bool)

(assert (=> start!89550 (=> (not res!686182) (not e!577988))))

(declare-fun valid!2006 (LongMapFixedSize!5248) Bool)

(assert (=> start!89550 (= res!686182 (valid!2006 thiss!1427))))

(assert (=> start!89550 e!577988))

(assert (=> start!89550 e!577989))

(assert (=> start!89550 true))

(assert (= (and start!89550 res!686182) b!1025330))

(assert (= (and b!1025330 res!686181) b!1025328))

(assert (= (and b!1025328 res!686183) b!1025329))

(assert (= (and b!1025331 condMapEmpty!37513) mapIsEmpty!37513))

(assert (= (and b!1025331 (not condMapEmpty!37513)) mapNonEmpty!37513))

(get-info :version)

(assert (= (and mapNonEmpty!37513 ((_ is ValueCellFull!11327) mapValue!37513)) b!1025334))

(assert (= (and b!1025331 ((_ is ValueCellFull!11327) mapDefault!37513)) b!1025332))

(assert (= b!1025333 b!1025331))

(assert (= start!89550 b!1025333))

(declare-fun m!944199 () Bool)

(assert (=> b!1025328 m!944199))

(declare-fun m!944201 () Bool)

(assert (=> mapNonEmpty!37513 m!944201))

(declare-fun m!944203 () Bool)

(assert (=> b!1025333 m!944203))

(declare-fun m!944205 () Bool)

(assert (=> b!1025333 m!944205))

(declare-fun m!944207 () Bool)

(assert (=> start!89550 m!944207))

(check-sat (not start!89550) (not mapNonEmpty!37513) tp_is_empty!24061 b_and!32597 (not b!1025333) (not b_next!20341) (not b!1025328))
(check-sat b_and!32597 (not b_next!20341))
(get-model)

(declare-fun d!123067 () Bool)

(declare-fun res!686208 () Bool)

(declare-fun e!578030 () Bool)

(assert (=> d!123067 (=> (not res!686208) (not e!578030))))

(declare-fun simpleValid!388 (LongMapFixedSize!5248) Bool)

(assert (=> d!123067 (= res!686208 (simpleValid!388 thiss!1427))))

(assert (=> d!123067 (= (valid!2006 thiss!1427) e!578030)))

(declare-fun b!1025383 () Bool)

(declare-fun res!686209 () Bool)

(assert (=> b!1025383 (=> (not res!686209) (not e!578030))))

(declare-fun arrayCountValidKeys!0 (array!64217 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025383 (= res!686209 (= (arrayCountValidKeys!0 (_keys!11160 thiss!1427) #b00000000000000000000000000000000 (size!31426 (_keys!11160 thiss!1427))) (_size!2679 thiss!1427)))))

(declare-fun b!1025384 () Bool)

(declare-fun res!686210 () Bool)

(assert (=> b!1025384 (=> (not res!686210) (not e!578030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64217 (_ BitVec 32)) Bool)

(assert (=> b!1025384 (= res!686210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11160 thiss!1427) (mask!29675 thiss!1427)))))

(declare-fun b!1025385 () Bool)

(declare-datatypes ((List!21710 0))(
  ( (Nil!21707) (Cons!21706 (h!22913 (_ BitVec 64)) (t!30764 List!21710)) )
))
(declare-fun arrayNoDuplicates!0 (array!64217 (_ BitVec 32) List!21710) Bool)

(assert (=> b!1025385 (= e!578030 (arrayNoDuplicates!0 (_keys!11160 thiss!1427) #b00000000000000000000000000000000 Nil!21707))))

(assert (= (and d!123067 res!686208) b!1025383))

(assert (= (and b!1025383 res!686209) b!1025384))

(assert (= (and b!1025384 res!686210) b!1025385))

(declare-fun m!944229 () Bool)

(assert (=> d!123067 m!944229))

(declare-fun m!944231 () Bool)

(assert (=> b!1025383 m!944231))

(declare-fun m!944233 () Bool)

(assert (=> b!1025384 m!944233))

(declare-fun m!944235 () Bool)

(assert (=> b!1025385 m!944235))

(assert (=> start!89550 d!123067))

(declare-fun d!123069 () Bool)

(assert (=> d!123069 (= (array_inv!23967 (_keys!11160 thiss!1427)) (bvsge (size!31426 (_keys!11160 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1025333 d!123069))

(declare-fun d!123071 () Bool)

(assert (=> d!123071 (= (array_inv!23968 (_values!5999 thiss!1427)) (bvsge (size!31427 (_values!5999 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1025333 d!123071))

(declare-fun d!123073 () Bool)

(assert (=> d!123073 (= (validMask!0 (mask!29675 thiss!1427)) (and (or (= (mask!29675 thiss!1427) #b00000000000000000000000000000111) (= (mask!29675 thiss!1427) #b00000000000000000000000000001111) (= (mask!29675 thiss!1427) #b00000000000000000000000000011111) (= (mask!29675 thiss!1427) #b00000000000000000000000000111111) (= (mask!29675 thiss!1427) #b00000000000000000000000001111111) (= (mask!29675 thiss!1427) #b00000000000000000000000011111111) (= (mask!29675 thiss!1427) #b00000000000000000000000111111111) (= (mask!29675 thiss!1427) #b00000000000000000000001111111111) (= (mask!29675 thiss!1427) #b00000000000000000000011111111111) (= (mask!29675 thiss!1427) #b00000000000000000000111111111111) (= (mask!29675 thiss!1427) #b00000000000000000001111111111111) (= (mask!29675 thiss!1427) #b00000000000000000011111111111111) (= (mask!29675 thiss!1427) #b00000000000000000111111111111111) (= (mask!29675 thiss!1427) #b00000000000000001111111111111111) (= (mask!29675 thiss!1427) #b00000000000000011111111111111111) (= (mask!29675 thiss!1427) #b00000000000000111111111111111111) (= (mask!29675 thiss!1427) #b00000000000001111111111111111111) (= (mask!29675 thiss!1427) #b00000000000011111111111111111111) (= (mask!29675 thiss!1427) #b00000000000111111111111111111111) (= (mask!29675 thiss!1427) #b00000000001111111111111111111111) (= (mask!29675 thiss!1427) #b00000000011111111111111111111111) (= (mask!29675 thiss!1427) #b00000000111111111111111111111111) (= (mask!29675 thiss!1427) #b00000001111111111111111111111111) (= (mask!29675 thiss!1427) #b00000011111111111111111111111111) (= (mask!29675 thiss!1427) #b00000111111111111111111111111111) (= (mask!29675 thiss!1427) #b00001111111111111111111111111111) (= (mask!29675 thiss!1427) #b00011111111111111111111111111111) (= (mask!29675 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29675 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1025328 d!123073))

(declare-fun condMapEmpty!37522 () Bool)

(declare-fun mapDefault!37522 () ValueCell!11327)

(assert (=> mapNonEmpty!37513 (= condMapEmpty!37522 (= mapRest!37513 ((as const (Array (_ BitVec 32) ValueCell!11327)) mapDefault!37522)))))

(declare-fun e!578035 () Bool)

(declare-fun mapRes!37522 () Bool)

(assert (=> mapNonEmpty!37513 (= tp!72062 (and e!578035 mapRes!37522))))

(declare-fun b!1025393 () Bool)

(assert (=> b!1025393 (= e!578035 tp_is_empty!24061)))

(declare-fun mapNonEmpty!37522 () Bool)

(declare-fun tp!72077 () Bool)

(declare-fun e!578036 () Bool)

(assert (=> mapNonEmpty!37522 (= mapRes!37522 (and tp!72077 e!578036))))

(declare-fun mapRest!37522 () (Array (_ BitVec 32) ValueCell!11327))

(declare-fun mapValue!37522 () ValueCell!11327)

(declare-fun mapKey!37522 () (_ BitVec 32))

(assert (=> mapNonEmpty!37522 (= mapRest!37513 (store mapRest!37522 mapKey!37522 mapValue!37522))))

(declare-fun mapIsEmpty!37522 () Bool)

(assert (=> mapIsEmpty!37522 mapRes!37522))

(declare-fun b!1025392 () Bool)

(assert (=> b!1025392 (= e!578036 tp_is_empty!24061)))

(assert (= (and mapNonEmpty!37513 condMapEmpty!37522) mapIsEmpty!37522))

(assert (= (and mapNonEmpty!37513 (not condMapEmpty!37522)) mapNonEmpty!37522))

(assert (= (and mapNonEmpty!37522 ((_ is ValueCellFull!11327) mapValue!37522)) b!1025392))

(assert (= (and mapNonEmpty!37513 ((_ is ValueCellFull!11327) mapDefault!37522)) b!1025393))

(declare-fun m!944237 () Bool)

(assert (=> mapNonEmpty!37522 m!944237))

(check-sat (not d!123067) (not mapNonEmpty!37522) (not b!1025385) (not b_next!20341) (not b!1025383) tp_is_empty!24061 b_and!32597 (not b!1025384))
(check-sat b_and!32597 (not b_next!20341))
(get-model)

(declare-fun d!123075 () Bool)

(declare-fun lt!451067 () (_ BitVec 32))

(assert (=> d!123075 (and (bvsge lt!451067 #b00000000000000000000000000000000) (bvsle lt!451067 (bvsub (size!31426 (_keys!11160 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!578041 () (_ BitVec 32))

(assert (=> d!123075 (= lt!451067 e!578041)))

(declare-fun c!103974 () Bool)

(assert (=> d!123075 (= c!103974 (bvsge #b00000000000000000000000000000000 (size!31426 (_keys!11160 thiss!1427))))))

(assert (=> d!123075 (and (bvsle #b00000000000000000000000000000000 (size!31426 (_keys!11160 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31426 (_keys!11160 thiss!1427)) (size!31426 (_keys!11160 thiss!1427))))))

(assert (=> d!123075 (= (arrayCountValidKeys!0 (_keys!11160 thiss!1427) #b00000000000000000000000000000000 (size!31426 (_keys!11160 thiss!1427))) lt!451067)))

(declare-fun bm!43300 () Bool)

(declare-fun call!43303 () (_ BitVec 32))

(assert (=> bm!43300 (= call!43303 (arrayCountValidKeys!0 (_keys!11160 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31426 (_keys!11160 thiss!1427))))))

(declare-fun b!1025402 () Bool)

(declare-fun e!578042 () (_ BitVec 32))

(assert (=> b!1025402 (= e!578042 call!43303)))

(declare-fun b!1025403 () Bool)

(assert (=> b!1025403 (= e!578041 e!578042)))

(declare-fun c!103973 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025403 (= c!103973 (validKeyInArray!0 (select (arr!30913 (_keys!11160 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1025404 () Bool)

(assert (=> b!1025404 (= e!578042 (bvadd #b00000000000000000000000000000001 call!43303))))

(declare-fun b!1025405 () Bool)

(assert (=> b!1025405 (= e!578041 #b00000000000000000000000000000000)))

(assert (= (and d!123075 c!103974) b!1025405))

(assert (= (and d!123075 (not c!103974)) b!1025403))

(assert (= (and b!1025403 c!103973) b!1025404))

(assert (= (and b!1025403 (not c!103973)) b!1025402))

(assert (= (or b!1025404 b!1025402) bm!43300))

(declare-fun m!944239 () Bool)

(assert (=> bm!43300 m!944239))

(declare-fun m!944241 () Bool)

(assert (=> b!1025403 m!944241))

(assert (=> b!1025403 m!944241))

(declare-fun m!944243 () Bool)

(assert (=> b!1025403 m!944243))

(assert (=> b!1025383 d!123075))

(declare-fun b!1025414 () Bool)

(declare-fun e!578050 () Bool)

(declare-fun e!578049 () Bool)

(assert (=> b!1025414 (= e!578050 e!578049)))

(declare-fun c!103977 () Bool)

(assert (=> b!1025414 (= c!103977 (validKeyInArray!0 (select (arr!30913 (_keys!11160 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1025415 () Bool)

(declare-fun call!43306 () Bool)

(assert (=> b!1025415 (= e!578049 call!43306)))

(declare-fun b!1025416 () Bool)

(declare-fun e!578051 () Bool)

(assert (=> b!1025416 (= e!578051 call!43306)))

(declare-fun b!1025417 () Bool)

(assert (=> b!1025417 (= e!578049 e!578051)))

(declare-fun lt!451075 () (_ BitVec 64))

(assert (=> b!1025417 (= lt!451075 (select (arr!30913 (_keys!11160 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33348 0))(
  ( (Unit!33349) )
))
(declare-fun lt!451074 () Unit!33348)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64217 (_ BitVec 64) (_ BitVec 32)) Unit!33348)

(assert (=> b!1025417 (= lt!451074 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11160 thiss!1427) lt!451075 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!64217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1025417 (arrayContainsKey!0 (_keys!11160 thiss!1427) lt!451075 #b00000000000000000000000000000000)))

(declare-fun lt!451076 () Unit!33348)

(assert (=> b!1025417 (= lt!451076 lt!451074)))

(declare-fun res!686216 () Bool)

(declare-datatypes ((SeekEntryResult!9543 0))(
  ( (MissingZero!9543 (index!40543 (_ BitVec 32))) (Found!9543 (index!40544 (_ BitVec 32))) (Intermediate!9543 (undefined!10355 Bool) (index!40545 (_ BitVec 32)) (x!91011 (_ BitVec 32))) (Undefined!9543) (MissingVacant!9543 (index!40546 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64217 (_ BitVec 32)) SeekEntryResult!9543)

(assert (=> b!1025417 (= res!686216 (= (seekEntryOrOpen!0 (select (arr!30913 (_keys!11160 thiss!1427)) #b00000000000000000000000000000000) (_keys!11160 thiss!1427) (mask!29675 thiss!1427)) (Found!9543 #b00000000000000000000000000000000)))))

(assert (=> b!1025417 (=> (not res!686216) (not e!578051))))

(declare-fun bm!43303 () Bool)

(assert (=> bm!43303 (= call!43306 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11160 thiss!1427) (mask!29675 thiss!1427)))))

(declare-fun d!123077 () Bool)

(declare-fun res!686215 () Bool)

(assert (=> d!123077 (=> res!686215 e!578050)))

(assert (=> d!123077 (= res!686215 (bvsge #b00000000000000000000000000000000 (size!31426 (_keys!11160 thiss!1427))))))

(assert (=> d!123077 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11160 thiss!1427) (mask!29675 thiss!1427)) e!578050)))

(assert (= (and d!123077 (not res!686215)) b!1025414))

(assert (= (and b!1025414 c!103977) b!1025417))

(assert (= (and b!1025414 (not c!103977)) b!1025415))

(assert (= (and b!1025417 res!686216) b!1025416))

(assert (= (or b!1025416 b!1025415) bm!43303))

(assert (=> b!1025414 m!944241))

(assert (=> b!1025414 m!944241))

(assert (=> b!1025414 m!944243))

(assert (=> b!1025417 m!944241))

(declare-fun m!944245 () Bool)

(assert (=> b!1025417 m!944245))

(declare-fun m!944247 () Bool)

(assert (=> b!1025417 m!944247))

(assert (=> b!1025417 m!944241))

(declare-fun m!944249 () Bool)

(assert (=> b!1025417 m!944249))

(declare-fun m!944251 () Bool)

(assert (=> bm!43303 m!944251))

(assert (=> b!1025384 d!123077))

(declare-fun b!1025426 () Bool)

(declare-fun res!686228 () Bool)

(declare-fun e!578054 () Bool)

(assert (=> b!1025426 (=> (not res!686228) (not e!578054))))

(assert (=> b!1025426 (= res!686228 (and (= (size!31427 (_values!5999 thiss!1427)) (bvadd (mask!29675 thiss!1427) #b00000000000000000000000000000001)) (= (size!31426 (_keys!11160 thiss!1427)) (size!31427 (_values!5999 thiss!1427))) (bvsge (_size!2679 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2679 thiss!1427) (bvadd (mask!29675 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1025428 () Bool)

(declare-fun res!686225 () Bool)

(assert (=> b!1025428 (=> (not res!686225) (not e!578054))))

(declare-fun size!31432 (LongMapFixedSize!5248) (_ BitVec 32))

(assert (=> b!1025428 (= res!686225 (= (size!31432 thiss!1427) (bvadd (_size!2679 thiss!1427) (bvsdiv (bvadd (extraKeys!5708 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!123079 () Bool)

(declare-fun res!686227 () Bool)

(assert (=> d!123079 (=> (not res!686227) (not e!578054))))

(assert (=> d!123079 (= res!686227 (validMask!0 (mask!29675 thiss!1427)))))

(assert (=> d!123079 (= (simpleValid!388 thiss!1427) e!578054)))

(declare-fun b!1025427 () Bool)

(declare-fun res!686226 () Bool)

(assert (=> b!1025427 (=> (not res!686226) (not e!578054))))

(assert (=> b!1025427 (= res!686226 (bvsge (size!31432 thiss!1427) (_size!2679 thiss!1427)))))

(declare-fun b!1025429 () Bool)

(assert (=> b!1025429 (= e!578054 (and (bvsge (extraKeys!5708 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5708 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2679 thiss!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!123079 res!686227) b!1025426))

(assert (= (and b!1025426 res!686228) b!1025427))

(assert (= (and b!1025427 res!686226) b!1025428))

(assert (= (and b!1025428 res!686225) b!1025429))

(declare-fun m!944253 () Bool)

(assert (=> b!1025428 m!944253))

(assert (=> d!123079 m!944199))

(assert (=> b!1025427 m!944253))

(assert (=> d!123067 d!123079))

(declare-fun b!1025440 () Bool)

(declare-fun e!578064 () Bool)

(declare-fun e!578063 () Bool)

(assert (=> b!1025440 (= e!578064 e!578063)))

(declare-fun res!686237 () Bool)

(assert (=> b!1025440 (=> (not res!686237) (not e!578063))))

(declare-fun e!578066 () Bool)

(assert (=> b!1025440 (= res!686237 (not e!578066))))

(declare-fun res!686236 () Bool)

(assert (=> b!1025440 (=> (not res!686236) (not e!578066))))

(assert (=> b!1025440 (= res!686236 (validKeyInArray!0 (select (arr!30913 (_keys!11160 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1025441 () Bool)

(declare-fun e!578065 () Bool)

(declare-fun call!43309 () Bool)

(assert (=> b!1025441 (= e!578065 call!43309)))

(declare-fun b!1025442 () Bool)

(assert (=> b!1025442 (= e!578065 call!43309)))

(declare-fun b!1025443 () Bool)

(assert (=> b!1025443 (= e!578063 e!578065)))

(declare-fun c!103980 () Bool)

(assert (=> b!1025443 (= c!103980 (validKeyInArray!0 (select (arr!30913 (_keys!11160 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1025444 () Bool)

(declare-fun contains!5965 (List!21710 (_ BitVec 64)) Bool)

(assert (=> b!1025444 (= e!578066 (contains!5965 Nil!21707 (select (arr!30913 (_keys!11160 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123081 () Bool)

(declare-fun res!686235 () Bool)

(assert (=> d!123081 (=> res!686235 e!578064)))

(assert (=> d!123081 (= res!686235 (bvsge #b00000000000000000000000000000000 (size!31426 (_keys!11160 thiss!1427))))))

(assert (=> d!123081 (= (arrayNoDuplicates!0 (_keys!11160 thiss!1427) #b00000000000000000000000000000000 Nil!21707) e!578064)))

(declare-fun bm!43306 () Bool)

(assert (=> bm!43306 (= call!43309 (arrayNoDuplicates!0 (_keys!11160 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103980 (Cons!21706 (select (arr!30913 (_keys!11160 thiss!1427)) #b00000000000000000000000000000000) Nil!21707) Nil!21707)))))

(assert (= (and d!123081 (not res!686235)) b!1025440))

(assert (= (and b!1025440 res!686236) b!1025444))

(assert (= (and b!1025440 res!686237) b!1025443))

(assert (= (and b!1025443 c!103980) b!1025441))

(assert (= (and b!1025443 (not c!103980)) b!1025442))

(assert (= (or b!1025441 b!1025442) bm!43306))

(assert (=> b!1025440 m!944241))

(assert (=> b!1025440 m!944241))

(assert (=> b!1025440 m!944243))

(assert (=> b!1025443 m!944241))

(assert (=> b!1025443 m!944241))

(assert (=> b!1025443 m!944243))

(assert (=> b!1025444 m!944241))

(assert (=> b!1025444 m!944241))

(declare-fun m!944255 () Bool)

(assert (=> b!1025444 m!944255))

(assert (=> bm!43306 m!944241))

(declare-fun m!944257 () Bool)

(assert (=> bm!43306 m!944257))

(assert (=> b!1025385 d!123081))

(declare-fun condMapEmpty!37523 () Bool)

(declare-fun mapDefault!37523 () ValueCell!11327)

(assert (=> mapNonEmpty!37522 (= condMapEmpty!37523 (= mapRest!37522 ((as const (Array (_ BitVec 32) ValueCell!11327)) mapDefault!37523)))))

(declare-fun e!578067 () Bool)

(declare-fun mapRes!37523 () Bool)

(assert (=> mapNonEmpty!37522 (= tp!72077 (and e!578067 mapRes!37523))))

(declare-fun b!1025446 () Bool)

(assert (=> b!1025446 (= e!578067 tp_is_empty!24061)))

(declare-fun mapNonEmpty!37523 () Bool)

(declare-fun tp!72078 () Bool)

(declare-fun e!578068 () Bool)

(assert (=> mapNonEmpty!37523 (= mapRes!37523 (and tp!72078 e!578068))))

(declare-fun mapValue!37523 () ValueCell!11327)

(declare-fun mapKey!37523 () (_ BitVec 32))

(declare-fun mapRest!37523 () (Array (_ BitVec 32) ValueCell!11327))

(assert (=> mapNonEmpty!37523 (= mapRest!37522 (store mapRest!37523 mapKey!37523 mapValue!37523))))

(declare-fun mapIsEmpty!37523 () Bool)

(assert (=> mapIsEmpty!37523 mapRes!37523))

(declare-fun b!1025445 () Bool)

(assert (=> b!1025445 (= e!578068 tp_is_empty!24061)))

(assert (= (and mapNonEmpty!37522 condMapEmpty!37523) mapIsEmpty!37523))

(assert (= (and mapNonEmpty!37522 (not condMapEmpty!37523)) mapNonEmpty!37523))

(assert (= (and mapNonEmpty!37523 ((_ is ValueCellFull!11327) mapValue!37523)) b!1025445))

(assert (= (and mapNonEmpty!37522 ((_ is ValueCellFull!11327) mapDefault!37523)) b!1025446))

(declare-fun m!944259 () Bool)

(assert (=> mapNonEmpty!37523 m!944259))

(check-sat (not b!1025403) (not bm!43303) (not b!1025427) (not b!1025440) (not b!1025417) (not mapNonEmpty!37523) tp_is_empty!24061 (not b!1025444) (not bm!43306) (not bm!43300) (not b_next!20341) b_and!32597 (not d!123079) (not b!1025443) (not b!1025428) (not b!1025414))
(check-sat b_and!32597 (not b_next!20341))
