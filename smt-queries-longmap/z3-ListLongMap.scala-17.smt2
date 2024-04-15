; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!512 () Bool)

(assert start!512)

(declare-fun b!2996 () Bool)

(declare-fun res!4947 () Bool)

(declare-fun e!1292 () Bool)

(assert (=> b!2996 (=> (not res!4947) (not e!1292))))

(declare-datatypes ((List!40 0))(
  ( (Nil!37) (Cons!36 (h!602 (_ BitVec 64)) (t!2167 List!40)) )
))
(declare-fun noDuplicate!7 (List!40) Bool)

(assert (=> b!2996 (= res!4947 (noDuplicate!7 Nil!37))))

(declare-fun mapIsEmpty!80 () Bool)

(declare-fun mapRes!80 () Bool)

(assert (=> mapIsEmpty!80 mapRes!80))

(declare-fun res!4946 () Bool)

(assert (=> start!512 (=> (not res!4946) (not e!1292))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!512 (= res!4946 (validMask!0 mask!2250))))

(assert (=> start!512 e!1292))

(assert (=> start!512 true))

(declare-datatypes ((V!291 0))(
  ( (V!292 (val!48 Int)) )
))
(declare-datatypes ((ValueCell!26 0))(
  ( (ValueCellFull!26 (v!1134 V!291)) (EmptyCell!26) )
))
(declare-datatypes ((array!105 0))(
  ( (array!106 (arr!47 (Array (_ BitVec 32) ValueCell!26)) (size!109 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!105)

(declare-fun e!1288 () Bool)

(declare-fun array_inv!27 (array!105) Bool)

(assert (=> start!512 (and (array_inv!27 _values!1492) e!1288)))

(declare-datatypes ((array!107 0))(
  ( (array!108 (arr!48 (Array (_ BitVec 32) (_ BitVec 64))) (size!110 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!107)

(declare-fun array_inv!28 (array!107) Bool)

(assert (=> start!512 (array_inv!28 _keys!1806)))

(declare-fun b!2997 () Bool)

(declare-fun res!4948 () Bool)

(assert (=> b!2997 (=> (not res!4948) (not e!1292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!107 (_ BitVec 32)) Bool)

(assert (=> b!2997 (= res!4948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!2998 () Bool)

(declare-fun e!1289 () Bool)

(declare-fun tp_is_empty!85 () Bool)

(assert (=> b!2998 (= e!1289 tp_is_empty!85)))

(declare-fun b!2999 () Bool)

(declare-fun res!4945 () Bool)

(assert (=> b!2999 (=> (not res!4945) (not e!1292))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!2999 (= res!4945 (and (= (size!109 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!110 _keys!1806) (size!109 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3000 () Bool)

(declare-fun e!1290 () Bool)

(declare-fun contains!12 (List!40 (_ BitVec 64)) Bool)

(assert (=> b!3000 (= e!1290 (contains!12 Nil!37 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!3001 () Bool)

(assert (=> b!3001 (= e!1292 e!1290)))

(declare-fun res!4944 () Bool)

(assert (=> b!3001 (=> res!4944 e!1290)))

(assert (=> b!3001 (= res!4944 (contains!12 Nil!37 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!80 () Bool)

(declare-fun tp!320 () Bool)

(declare-fun e!1293 () Bool)

(assert (=> mapNonEmpty!80 (= mapRes!80 (and tp!320 e!1293))))

(declare-fun mapKey!80 () (_ BitVec 32))

(declare-fun mapRest!80 () (Array (_ BitVec 32) ValueCell!26))

(declare-fun mapValue!80 () ValueCell!26)

(assert (=> mapNonEmpty!80 (= (arr!47 _values!1492) (store mapRest!80 mapKey!80 mapValue!80))))

(declare-fun b!3002 () Bool)

(assert (=> b!3002 (= e!1288 (and e!1289 mapRes!80))))

(declare-fun condMapEmpty!80 () Bool)

(declare-fun mapDefault!80 () ValueCell!26)

(assert (=> b!3002 (= condMapEmpty!80 (= (arr!47 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!26)) mapDefault!80)))))

(declare-fun b!3003 () Bool)

(declare-fun res!4949 () Bool)

(assert (=> b!3003 (=> (not res!4949) (not e!1292))))

(assert (=> b!3003 (= res!4949 (and (bvsle #b00000000000000000000000000000000 (size!110 _keys!1806)) (bvslt (size!110 _keys!1806) #b01111111111111111111111111111111)))))

(declare-fun b!3004 () Bool)

(assert (=> b!3004 (= e!1293 tp_is_empty!85)))

(assert (= (and start!512 res!4946) b!2999))

(assert (= (and b!2999 res!4945) b!2997))

(assert (= (and b!2997 res!4948) b!3003))

(assert (= (and b!3003 res!4949) b!2996))

(assert (= (and b!2996 res!4947) b!3001))

(assert (= (and b!3001 (not res!4944)) b!3000))

(assert (= (and b!3002 condMapEmpty!80) mapIsEmpty!80))

(assert (= (and b!3002 (not condMapEmpty!80)) mapNonEmpty!80))

(get-info :version)

(assert (= (and mapNonEmpty!80 ((_ is ValueCellFull!26) mapValue!80)) b!3004))

(assert (= (and b!3002 ((_ is ValueCellFull!26) mapDefault!80)) b!2998))

(assert (= start!512 b!3002))

(declare-fun m!1357 () Bool)

(assert (=> start!512 m!1357))

(declare-fun m!1359 () Bool)

(assert (=> start!512 m!1359))

(declare-fun m!1361 () Bool)

(assert (=> start!512 m!1361))

(declare-fun m!1363 () Bool)

(assert (=> b!2996 m!1363))

(declare-fun m!1365 () Bool)

(assert (=> b!2997 m!1365))

(declare-fun m!1367 () Bool)

(assert (=> b!3000 m!1367))

(declare-fun m!1369 () Bool)

(assert (=> mapNonEmpty!80 m!1369))

(declare-fun m!1371 () Bool)

(assert (=> b!3001 m!1371))

(check-sat (not b!2996) (not b!3000) (not b!2997) (not start!512) (not b!3001) tp_is_empty!85 (not mapNonEmpty!80))
(check-sat)
(get-model)

(declare-fun d!605 () Bool)

(declare-fun lt!407 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!8 (List!40) (InoxSet (_ BitVec 64)))

(assert (=> d!605 (= lt!407 (select (content!8 Nil!37) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!1334 () Bool)

(assert (=> d!605 (= lt!407 e!1334)))

(declare-fun res!4991 () Bool)

(assert (=> d!605 (=> (not res!4991) (not e!1334))))

(assert (=> d!605 (= res!4991 ((_ is Cons!36) Nil!37))))

(assert (=> d!605 (= (contains!12 Nil!37 #b1000000000000000000000000000000000000000000000000000000000000000) lt!407)))

(declare-fun b!3063 () Bool)

(declare-fun e!1335 () Bool)

(assert (=> b!3063 (= e!1334 e!1335)))

(declare-fun res!4990 () Bool)

(assert (=> b!3063 (=> res!4990 e!1335)))

(assert (=> b!3063 (= res!4990 (= (h!602 Nil!37) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!3064 () Bool)

(assert (=> b!3064 (= e!1335 (contains!12 (t!2167 Nil!37) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!605 res!4991) b!3063))

(assert (= (and b!3063 (not res!4990)) b!3064))

(declare-fun m!1405 () Bool)

(assert (=> d!605 m!1405))

(declare-fun m!1407 () Bool)

(assert (=> d!605 m!1407))

(declare-fun m!1409 () Bool)

(assert (=> b!3064 m!1409))

(assert (=> b!3000 d!605))

(declare-fun d!607 () Bool)

(assert (=> d!607 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!512 d!607))

(declare-fun d!609 () Bool)

(assert (=> d!609 (= (array_inv!27 _values!1492) (bvsge (size!109 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!512 d!609))

(declare-fun d!611 () Bool)

(assert (=> d!611 (= (array_inv!28 _keys!1806) (bvsge (size!110 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!512 d!611))

(declare-fun b!3073 () Bool)

(declare-fun e!1343 () Bool)

(declare-fun call!41 () Bool)

(assert (=> b!3073 (= e!1343 call!41)))

(declare-fun bm!38 () Bool)

(assert (=> bm!38 (= call!41 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun d!613 () Bool)

(declare-fun res!4996 () Bool)

(declare-fun e!1342 () Bool)

(assert (=> d!613 (=> res!4996 e!1342)))

(assert (=> d!613 (= res!4996 (bvsge #b00000000000000000000000000000000 (size!110 _keys!1806)))))

(assert (=> d!613 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!1342)))

(declare-fun b!3074 () Bool)

(assert (=> b!3074 (= e!1342 e!1343)))

(declare-fun c!185 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!3074 (= c!185 (validKeyInArray!0 (select (arr!48 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!3075 () Bool)

(declare-fun e!1344 () Bool)

(assert (=> b!3075 (= e!1343 e!1344)))

(declare-fun lt!416 () (_ BitVec 64))

(assert (=> b!3075 (= lt!416 (select (arr!48 _keys!1806) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!25 0))(
  ( (Unit!26) )
))
(declare-fun lt!414 () Unit!25)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!107 (_ BitVec 64) (_ BitVec 32)) Unit!25)

(assert (=> b!3075 (= lt!414 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!416 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!3075 (arrayContainsKey!0 _keys!1806 lt!416 #b00000000000000000000000000000000)))

(declare-fun lt!415 () Unit!25)

(assert (=> b!3075 (= lt!415 lt!414)))

(declare-fun res!4997 () Bool)

(declare-datatypes ((SeekEntryResult!8 0))(
  ( (MissingZero!8 (index!2151 (_ BitVec 32))) (Found!8 (index!2152 (_ BitVec 32))) (Intermediate!8 (undefined!820 Bool) (index!2153 (_ BitVec 32)) (x!2192 (_ BitVec 32))) (Undefined!8) (MissingVacant!8 (index!2154 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!107 (_ BitVec 32)) SeekEntryResult!8)

(assert (=> b!3075 (= res!4997 (= (seekEntryOrOpen!0 (select (arr!48 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!8 #b00000000000000000000000000000000)))))

(assert (=> b!3075 (=> (not res!4997) (not e!1344))))

(declare-fun b!3076 () Bool)

(assert (=> b!3076 (= e!1344 call!41)))

(assert (= (and d!613 (not res!4996)) b!3074))

(assert (= (and b!3074 c!185) b!3075))

(assert (= (and b!3074 (not c!185)) b!3073))

(assert (= (and b!3075 res!4997) b!3076))

(assert (= (or b!3076 b!3073) bm!38))

(declare-fun m!1411 () Bool)

(assert (=> bm!38 m!1411))

(declare-fun m!1413 () Bool)

(assert (=> b!3074 m!1413))

(assert (=> b!3074 m!1413))

(declare-fun m!1415 () Bool)

(assert (=> b!3074 m!1415))

(assert (=> b!3075 m!1413))

(declare-fun m!1417 () Bool)

(assert (=> b!3075 m!1417))

(declare-fun m!1419 () Bool)

(assert (=> b!3075 m!1419))

(assert (=> b!3075 m!1413))

(declare-fun m!1421 () Bool)

(assert (=> b!3075 m!1421))

(assert (=> b!2997 d!613))

(declare-fun d!615 () Bool)

(declare-fun res!5002 () Bool)

(declare-fun e!1349 () Bool)

(assert (=> d!615 (=> res!5002 e!1349)))

(assert (=> d!615 (= res!5002 ((_ is Nil!37) Nil!37))))

(assert (=> d!615 (= (noDuplicate!7 Nil!37) e!1349)))

(declare-fun b!3081 () Bool)

(declare-fun e!1350 () Bool)

(assert (=> b!3081 (= e!1349 e!1350)))

(declare-fun res!5003 () Bool)

(assert (=> b!3081 (=> (not res!5003) (not e!1350))))

(assert (=> b!3081 (= res!5003 (not (contains!12 (t!2167 Nil!37) (h!602 Nil!37))))))

(declare-fun b!3082 () Bool)

(assert (=> b!3082 (= e!1350 (noDuplicate!7 (t!2167 Nil!37)))))

(assert (= (and d!615 (not res!5002)) b!3081))

(assert (= (and b!3081 res!5003) b!3082))

(declare-fun m!1423 () Bool)

(assert (=> b!3081 m!1423))

(declare-fun m!1425 () Bool)

(assert (=> b!3082 m!1425))

(assert (=> b!2996 d!615))

(declare-fun d!617 () Bool)

(declare-fun lt!417 () Bool)

(assert (=> d!617 (= lt!417 (select (content!8 Nil!37) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!1351 () Bool)

(assert (=> d!617 (= lt!417 e!1351)))

(declare-fun res!5005 () Bool)

(assert (=> d!617 (=> (not res!5005) (not e!1351))))

(assert (=> d!617 (= res!5005 ((_ is Cons!36) Nil!37))))

(assert (=> d!617 (= (contains!12 Nil!37 #b0000000000000000000000000000000000000000000000000000000000000000) lt!417)))

(declare-fun b!3083 () Bool)

(declare-fun e!1352 () Bool)

(assert (=> b!3083 (= e!1351 e!1352)))

(declare-fun res!5004 () Bool)

(assert (=> b!3083 (=> res!5004 e!1352)))

(assert (=> b!3083 (= res!5004 (= (h!602 Nil!37) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!3084 () Bool)

(assert (=> b!3084 (= e!1352 (contains!12 (t!2167 Nil!37) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!617 res!5005) b!3083))

(assert (= (and b!3083 (not res!5004)) b!3084))

(assert (=> d!617 m!1405))

(declare-fun m!1427 () Bool)

(assert (=> d!617 m!1427))

(declare-fun m!1429 () Bool)

(assert (=> b!3084 m!1429))

(assert (=> b!3001 d!617))

(declare-fun condMapEmpty!89 () Bool)

(declare-fun mapDefault!89 () ValueCell!26)

(assert (=> mapNonEmpty!80 (= condMapEmpty!89 (= mapRest!80 ((as const (Array (_ BitVec 32) ValueCell!26)) mapDefault!89)))))

(declare-fun e!1357 () Bool)

(declare-fun mapRes!89 () Bool)

(assert (=> mapNonEmpty!80 (= tp!320 (and e!1357 mapRes!89))))

(declare-fun mapIsEmpty!89 () Bool)

(assert (=> mapIsEmpty!89 mapRes!89))

(declare-fun mapNonEmpty!89 () Bool)

(declare-fun tp!329 () Bool)

(declare-fun e!1358 () Bool)

(assert (=> mapNonEmpty!89 (= mapRes!89 (and tp!329 e!1358))))

(declare-fun mapKey!89 () (_ BitVec 32))

(declare-fun mapValue!89 () ValueCell!26)

(declare-fun mapRest!89 () (Array (_ BitVec 32) ValueCell!26))

(assert (=> mapNonEmpty!89 (= mapRest!80 (store mapRest!89 mapKey!89 mapValue!89))))

(declare-fun b!3091 () Bool)

(assert (=> b!3091 (= e!1358 tp_is_empty!85)))

(declare-fun b!3092 () Bool)

(assert (=> b!3092 (= e!1357 tp_is_empty!85)))

(assert (= (and mapNonEmpty!80 condMapEmpty!89) mapIsEmpty!89))

(assert (= (and mapNonEmpty!80 (not condMapEmpty!89)) mapNonEmpty!89))

(assert (= (and mapNonEmpty!89 ((_ is ValueCellFull!26) mapValue!89)) b!3091))

(assert (= (and mapNonEmpty!80 ((_ is ValueCellFull!26) mapDefault!89)) b!3092))

(declare-fun m!1431 () Bool)

(assert (=> mapNonEmpty!89 m!1431))

(check-sat tp_is_empty!85 (not bm!38) (not b!3075) (not mapNonEmpty!89) (not b!3074) (not b!3082) (not d!617) (not d!605) (not b!3081) (not b!3064) (not b!3084))
(check-sat)
