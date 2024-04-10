; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!514 () Bool)

(assert start!514)

(declare-fun b!3023 () Bool)

(declare-fun e!1308 () Bool)

(declare-datatypes ((List!41 0))(
  ( (Nil!38) (Cons!37 (h!603 (_ BitVec 64)) (t!2168 List!41)) )
))
(declare-fun contains!12 (List!41 (_ BitVec 64)) Bool)

(assert (=> b!3023 (= e!1308 (contains!12 Nil!38 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!3024 () Bool)

(declare-fun res!4966 () Bool)

(declare-fun e!1306 () Bool)

(assert (=> b!3024 (=> (not res!4966) (not e!1306))))

(declare-datatypes ((array!111 0))(
  ( (array!112 (arr!50 (Array (_ BitVec 32) (_ BitVec 64))) (size!112 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!111)

(assert (=> b!3024 (= res!4966 (and (bvsle #b00000000000000000000000000000000 (size!112 _keys!1806)) (bvslt (size!112 _keys!1806) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!83 () Bool)

(declare-fun mapRes!83 () Bool)

(assert (=> mapIsEmpty!83 mapRes!83))

(declare-fun b!3025 () Bool)

(declare-fun res!4967 () Bool)

(assert (=> b!3025 (=> (not res!4967) (not e!1306))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!293 0))(
  ( (V!294 (val!49 Int)) )
))
(declare-datatypes ((ValueCell!27 0))(
  ( (ValueCellFull!27 (v!1135 V!293)) (EmptyCell!27) )
))
(declare-datatypes ((array!113 0))(
  ( (array!114 (arr!51 (Array (_ BitVec 32) ValueCell!27)) (size!113 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!113)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3025 (= res!4967 (and (= (size!113 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!112 _keys!1806) (size!113 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3026 () Bool)

(declare-fun e!1307 () Bool)

(declare-fun tp_is_empty!87 () Bool)

(assert (=> b!3026 (= e!1307 tp_is_empty!87)))

(declare-fun res!4962 () Bool)

(assert (=> start!514 (=> (not res!4962) (not e!1306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!514 (= res!4962 (validMask!0 mask!2250))))

(assert (=> start!514 e!1306))

(assert (=> start!514 true))

(declare-fun e!1311 () Bool)

(declare-fun array_inv!31 (array!113) Bool)

(assert (=> start!514 (and (array_inv!31 _values!1492) e!1311)))

(declare-fun array_inv!32 (array!111) Bool)

(assert (=> start!514 (array_inv!32 _keys!1806)))

(declare-fun b!3027 () Bool)

(declare-fun res!4964 () Bool)

(assert (=> b!3027 (=> (not res!4964) (not e!1306))))

(declare-fun noDuplicate!8 (List!41) Bool)

(assert (=> b!3027 (= res!4964 (noDuplicate!8 Nil!38))))

(declare-fun b!3028 () Bool)

(declare-fun e!1310 () Bool)

(assert (=> b!3028 (= e!1310 tp_is_empty!87)))

(declare-fun b!3029 () Bool)

(declare-fun res!4965 () Bool)

(assert (=> b!3029 (=> (not res!4965) (not e!1306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!111 (_ BitVec 32)) Bool)

(assert (=> b!3029 (= res!4965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3030 () Bool)

(assert (=> b!3030 (= e!1311 (and e!1307 mapRes!83))))

(declare-fun condMapEmpty!83 () Bool)

(declare-fun mapDefault!83 () ValueCell!27)

(assert (=> b!3030 (= condMapEmpty!83 (= (arr!51 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!27)) mapDefault!83)))))

(declare-fun mapNonEmpty!83 () Bool)

(declare-fun tp!323 () Bool)

(assert (=> mapNonEmpty!83 (= mapRes!83 (and tp!323 e!1310))))

(declare-fun mapKey!83 () (_ BitVec 32))

(declare-fun mapValue!83 () ValueCell!27)

(declare-fun mapRest!83 () (Array (_ BitVec 32) ValueCell!27))

(assert (=> mapNonEmpty!83 (= (arr!51 _values!1492) (store mapRest!83 mapKey!83 mapValue!83))))

(declare-fun b!3031 () Bool)

(assert (=> b!3031 (= e!1306 e!1308)))

(declare-fun res!4963 () Bool)

(assert (=> b!3031 (=> res!4963 e!1308)))

(assert (=> b!3031 (= res!4963 (contains!12 Nil!38 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!514 res!4962) b!3025))

(assert (= (and b!3025 res!4967) b!3029))

(assert (= (and b!3029 res!4965) b!3024))

(assert (= (and b!3024 res!4966) b!3027))

(assert (= (and b!3027 res!4964) b!3031))

(assert (= (and b!3031 (not res!4963)) b!3023))

(assert (= (and b!3030 condMapEmpty!83) mapIsEmpty!83))

(assert (= (and b!3030 (not condMapEmpty!83)) mapNonEmpty!83))

(get-info :version)

(assert (= (and mapNonEmpty!83 ((_ is ValueCellFull!27) mapValue!83)) b!3028))

(assert (= (and b!3030 ((_ is ValueCellFull!27) mapDefault!83)) b!3026))

(assert (= start!514 b!3030))

(declare-fun m!1373 () Bool)

(assert (=> start!514 m!1373))

(declare-fun m!1375 () Bool)

(assert (=> start!514 m!1375))

(declare-fun m!1377 () Bool)

(assert (=> start!514 m!1377))

(declare-fun m!1379 () Bool)

(assert (=> b!3031 m!1379))

(declare-fun m!1381 () Bool)

(assert (=> b!3023 m!1381))

(declare-fun m!1383 () Bool)

(assert (=> mapNonEmpty!83 m!1383))

(declare-fun m!1385 () Bool)

(assert (=> b!3029 m!1385))

(declare-fun m!1387 () Bool)

(assert (=> b!3027 m!1387))

(check-sat (not mapNonEmpty!83) (not b!3031) (not start!514) (not b!3027) (not b!3023) tp_is_empty!87 (not b!3029))
(check-sat)
(get-model)

(declare-fun d!605 () Bool)

(assert (=> d!605 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!514 d!605))

(declare-fun d!607 () Bool)

(assert (=> d!607 (= (array_inv!31 _values!1492) (bvsge (size!113 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!514 d!607))

(declare-fun d!609 () Bool)

(assert (=> d!609 (= (array_inv!32 _keys!1806) (bvsge (size!112 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!514 d!609))

(declare-fun b!3067 () Bool)

(declare-fun e!1338 () Bool)

(declare-fun call!41 () Bool)

(assert (=> b!3067 (= e!1338 call!41)))

(declare-fun d!611 () Bool)

(declare-fun res!4991 () Bool)

(declare-fun e!1336 () Bool)

(assert (=> d!611 (=> res!4991 e!1336)))

(assert (=> d!611 (= res!4991 (bvsge #b00000000000000000000000000000000 (size!112 _keys!1806)))))

(assert (=> d!611 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!1336)))

(declare-fun bm!38 () Bool)

(assert (=> bm!38 (= call!41 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!3068 () Bool)

(declare-fun e!1337 () Bool)

(assert (=> b!3068 (= e!1338 e!1337)))

(declare-fun lt!411 () (_ BitVec 64))

(assert (=> b!3068 (= lt!411 (select (arr!50 _keys!1806) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!25 0))(
  ( (Unit!26) )
))
(declare-fun lt!412 () Unit!25)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!111 (_ BitVec 64) (_ BitVec 32)) Unit!25)

(assert (=> b!3068 (= lt!412 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!411 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!3068 (arrayContainsKey!0 _keys!1806 lt!411 #b00000000000000000000000000000000)))

(declare-fun lt!413 () Unit!25)

(assert (=> b!3068 (= lt!413 lt!412)))

(declare-fun res!4990 () Bool)

(declare-datatypes ((SeekEntryResult!8 0))(
  ( (MissingZero!8 (index!2151 (_ BitVec 32))) (Found!8 (index!2152 (_ BitVec 32))) (Intermediate!8 (undefined!820 Bool) (index!2153 (_ BitVec 32)) (x!2192 (_ BitVec 32))) (Undefined!8) (MissingVacant!8 (index!2154 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!111 (_ BitVec 32)) SeekEntryResult!8)

(assert (=> b!3068 (= res!4990 (= (seekEntryOrOpen!0 (select (arr!50 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!8 #b00000000000000000000000000000000)))))

(assert (=> b!3068 (=> (not res!4990) (not e!1337))))

(declare-fun b!3069 () Bool)

(assert (=> b!3069 (= e!1336 e!1338)))

(declare-fun c!185 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!3069 (= c!185 (validKeyInArray!0 (select (arr!50 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!3070 () Bool)

(assert (=> b!3070 (= e!1337 call!41)))

(assert (= (and d!611 (not res!4991)) b!3069))

(assert (= (and b!3069 c!185) b!3068))

(assert (= (and b!3069 (not c!185)) b!3067))

(assert (= (and b!3068 res!4990) b!3070))

(assert (= (or b!3070 b!3067) bm!38))

(declare-fun m!1405 () Bool)

(assert (=> bm!38 m!1405))

(declare-fun m!1407 () Bool)

(assert (=> b!3068 m!1407))

(declare-fun m!1409 () Bool)

(assert (=> b!3068 m!1409))

(declare-fun m!1411 () Bool)

(assert (=> b!3068 m!1411))

(assert (=> b!3068 m!1407))

(declare-fun m!1413 () Bool)

(assert (=> b!3068 m!1413))

(assert (=> b!3069 m!1407))

(assert (=> b!3069 m!1407))

(declare-fun m!1415 () Bool)

(assert (=> b!3069 m!1415))

(assert (=> b!3029 d!611))

(declare-fun d!613 () Bool)

(declare-fun lt!416 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!8 (List!41) (InoxSet (_ BitVec 64)))

(assert (=> d!613 (= lt!416 (select (content!8 Nil!38) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!1344 () Bool)

(assert (=> d!613 (= lt!416 e!1344)))

(declare-fun res!4997 () Bool)

(assert (=> d!613 (=> (not res!4997) (not e!1344))))

(assert (=> d!613 (= res!4997 ((_ is Cons!37) Nil!38))))

(assert (=> d!613 (= (contains!12 Nil!38 #b1000000000000000000000000000000000000000000000000000000000000000) lt!416)))

(declare-fun b!3075 () Bool)

(declare-fun e!1343 () Bool)

(assert (=> b!3075 (= e!1344 e!1343)))

(declare-fun res!4996 () Bool)

(assert (=> b!3075 (=> res!4996 e!1343)))

(assert (=> b!3075 (= res!4996 (= (h!603 Nil!38) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!3076 () Bool)

(assert (=> b!3076 (= e!1343 (contains!12 (t!2168 Nil!38) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!613 res!4997) b!3075))

(assert (= (and b!3075 (not res!4996)) b!3076))

(declare-fun m!1417 () Bool)

(assert (=> d!613 m!1417))

(declare-fun m!1419 () Bool)

(assert (=> d!613 m!1419))

(declare-fun m!1421 () Bool)

(assert (=> b!3076 m!1421))

(assert (=> b!3023 d!613))

(declare-fun d!615 () Bool)

(declare-fun res!5002 () Bool)

(declare-fun e!1349 () Bool)

(assert (=> d!615 (=> res!5002 e!1349)))

(assert (=> d!615 (= res!5002 ((_ is Nil!38) Nil!38))))

(assert (=> d!615 (= (noDuplicate!8 Nil!38) e!1349)))

(declare-fun b!3081 () Bool)

(declare-fun e!1350 () Bool)

(assert (=> b!3081 (= e!1349 e!1350)))

(declare-fun res!5003 () Bool)

(assert (=> b!3081 (=> (not res!5003) (not e!1350))))

(assert (=> b!3081 (= res!5003 (not (contains!12 (t!2168 Nil!38) (h!603 Nil!38))))))

(declare-fun b!3082 () Bool)

(assert (=> b!3082 (= e!1350 (noDuplicate!8 (t!2168 Nil!38)))))

(assert (= (and d!615 (not res!5002)) b!3081))

(assert (= (and b!3081 res!5003) b!3082))

(declare-fun m!1423 () Bool)

(assert (=> b!3081 m!1423))

(declare-fun m!1425 () Bool)

(assert (=> b!3082 m!1425))

(assert (=> b!3027 d!615))

(declare-fun d!617 () Bool)

(declare-fun lt!417 () Bool)

(assert (=> d!617 (= lt!417 (select (content!8 Nil!38) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!1352 () Bool)

(assert (=> d!617 (= lt!417 e!1352)))

(declare-fun res!5005 () Bool)

(assert (=> d!617 (=> (not res!5005) (not e!1352))))

(assert (=> d!617 (= res!5005 ((_ is Cons!37) Nil!38))))

(assert (=> d!617 (= (contains!12 Nil!38 #b0000000000000000000000000000000000000000000000000000000000000000) lt!417)))

(declare-fun b!3083 () Bool)

(declare-fun e!1351 () Bool)

(assert (=> b!3083 (= e!1352 e!1351)))

(declare-fun res!5004 () Bool)

(assert (=> b!3083 (=> res!5004 e!1351)))

(assert (=> b!3083 (= res!5004 (= (h!603 Nil!38) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!3084 () Bool)

(assert (=> b!3084 (= e!1351 (contains!12 (t!2168 Nil!38) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!617 res!5005) b!3083))

(assert (= (and b!3083 (not res!5004)) b!3084))

(assert (=> d!617 m!1417))

(declare-fun m!1427 () Bool)

(assert (=> d!617 m!1427))

(declare-fun m!1429 () Bool)

(assert (=> b!3084 m!1429))

(assert (=> b!3031 d!617))

(declare-fun mapNonEmpty!89 () Bool)

(declare-fun mapRes!89 () Bool)

(declare-fun tp!329 () Bool)

(declare-fun e!1357 () Bool)

(assert (=> mapNonEmpty!89 (= mapRes!89 (and tp!329 e!1357))))

(declare-fun mapRest!89 () (Array (_ BitVec 32) ValueCell!27))

(declare-fun mapValue!89 () ValueCell!27)

(declare-fun mapKey!89 () (_ BitVec 32))

(assert (=> mapNonEmpty!89 (= mapRest!83 (store mapRest!89 mapKey!89 mapValue!89))))

(declare-fun b!3091 () Bool)

(assert (=> b!3091 (= e!1357 tp_is_empty!87)))

(declare-fun condMapEmpty!89 () Bool)

(declare-fun mapDefault!89 () ValueCell!27)

(assert (=> mapNonEmpty!83 (= condMapEmpty!89 (= mapRest!83 ((as const (Array (_ BitVec 32) ValueCell!27)) mapDefault!89)))))

(declare-fun e!1358 () Bool)

(assert (=> mapNonEmpty!83 (= tp!323 (and e!1358 mapRes!89))))

(declare-fun mapIsEmpty!89 () Bool)

(assert (=> mapIsEmpty!89 mapRes!89))

(declare-fun b!3092 () Bool)

(assert (=> b!3092 (= e!1358 tp_is_empty!87)))

(assert (= (and mapNonEmpty!83 condMapEmpty!89) mapIsEmpty!89))

(assert (= (and mapNonEmpty!83 (not condMapEmpty!89)) mapNonEmpty!89))

(assert (= (and mapNonEmpty!89 ((_ is ValueCellFull!27) mapValue!89)) b!3091))

(assert (= (and mapNonEmpty!83 ((_ is ValueCellFull!27) mapDefault!89)) b!3092))

(declare-fun m!1431 () Bool)

(assert (=> mapNonEmpty!89 m!1431))

(check-sat (not mapNonEmpty!89) (not b!3082) (not b!3081) (not b!3076) (not b!3084) (not bm!38) (not b!3069) (not b!3068) (not d!617) (not d!613) tp_is_empty!87)
(check-sat)
