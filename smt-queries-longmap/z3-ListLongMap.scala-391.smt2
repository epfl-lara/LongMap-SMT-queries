; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7370 () Bool)

(assert start!7370)

(declare-fun res!27476 () Bool)

(declare-fun e!30213 () Bool)

(assert (=> start!7370 (=> (not res!27476) (not e!30213))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7370 (= res!27476 (validMask!0 mask!2458))))

(assert (=> start!7370 e!30213))

(assert (=> start!7370 true))

(declare-datatypes ((V!2431 0))(
  ( (V!2432 (val!1050 Int)) )
))
(declare-datatypes ((ValueCell!722 0))(
  ( (ValueCellFull!722 (v!2111 V!2431)) (EmptyCell!722) )
))
(declare-datatypes ((array!3098 0))(
  ( (array!3099 (arr!1485 (Array (_ BitVec 32) ValueCell!722)) (size!1707 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3098)

(declare-fun e!30217 () Bool)

(declare-fun array_inv!884 (array!3098) Bool)

(assert (=> start!7370 (and (array_inv!884 _values!1550) e!30217)))

(declare-datatypes ((array!3100 0))(
  ( (array!3101 (arr!1486 (Array (_ BitVec 32) (_ BitVec 64))) (size!1708 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3100)

(declare-fun array_inv!885 (array!3100) Bool)

(assert (=> start!7370 (array_inv!885 _keys!1940)))

(declare-fun b!47211 () Bool)

(declare-fun res!27474 () Bool)

(assert (=> b!47211 (=> (not res!27474) (not e!30213))))

(assert (=> b!47211 (= res!27474 (and (bvsle #b00000000000000000000000000000000 (size!1708 _keys!1940)) (bvslt (size!1708 _keys!1940) #b01111111111111111111111111111111)))))

(declare-fun b!47212 () Bool)

(declare-fun res!27475 () Bool)

(assert (=> b!47212 (=> (not res!27475) (not e!30213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3100 (_ BitVec 32)) Bool)

(assert (=> b!47212 (= res!27475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47213 () Bool)

(declare-fun e!30216 () Bool)

(declare-fun mapRes!2072 () Bool)

(assert (=> b!47213 (= e!30217 (and e!30216 mapRes!2072))))

(declare-fun condMapEmpty!2072 () Bool)

(declare-fun mapDefault!2072 () ValueCell!722)

(assert (=> b!47213 (= condMapEmpty!2072 (= (arr!1485 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!722)) mapDefault!2072)))))

(declare-fun b!47214 () Bool)

(declare-fun res!27473 () Bool)

(assert (=> b!47214 (=> (not res!27473) (not e!30213))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47214 (= res!27473 (and (= (size!1707 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1708 _keys!1940) (size!1707 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!2072 () Bool)

(assert (=> mapIsEmpty!2072 mapRes!2072))

(declare-fun b!47215 () Bool)

(declare-fun tp_is_empty!2023 () Bool)

(assert (=> b!47215 (= e!30216 tp_is_empty!2023)))

(declare-fun b!47216 () Bool)

(declare-datatypes ((List!1242 0))(
  ( (Nil!1239) (Cons!1238 (h!1818 (_ BitVec 64)) (t!4270 List!1242)) )
))
(declare-fun noDuplicate!33 (List!1242) Bool)

(assert (=> b!47216 (= e!30213 (not (noDuplicate!33 Nil!1239)))))

(declare-fun b!47217 () Bool)

(declare-fun e!30215 () Bool)

(assert (=> b!47217 (= e!30215 tp_is_empty!2023)))

(declare-fun mapNonEmpty!2072 () Bool)

(declare-fun tp!6221 () Bool)

(assert (=> mapNonEmpty!2072 (= mapRes!2072 (and tp!6221 e!30215))))

(declare-fun mapKey!2072 () (_ BitVec 32))

(declare-fun mapRest!2072 () (Array (_ BitVec 32) ValueCell!722))

(declare-fun mapValue!2072 () ValueCell!722)

(assert (=> mapNonEmpty!2072 (= (arr!1485 _values!1550) (store mapRest!2072 mapKey!2072 mapValue!2072))))

(assert (= (and start!7370 res!27476) b!47214))

(assert (= (and b!47214 res!27473) b!47212))

(assert (= (and b!47212 res!27475) b!47211))

(assert (= (and b!47211 res!27474) b!47216))

(assert (= (and b!47213 condMapEmpty!2072) mapIsEmpty!2072))

(assert (= (and b!47213 (not condMapEmpty!2072)) mapNonEmpty!2072))

(get-info :version)

(assert (= (and mapNonEmpty!2072 ((_ is ValueCellFull!722) mapValue!2072)) b!47217))

(assert (= (and b!47213 ((_ is ValueCellFull!722) mapDefault!2072)) b!47215))

(assert (= start!7370 b!47213))

(declare-fun m!41423 () Bool)

(assert (=> start!7370 m!41423))

(declare-fun m!41425 () Bool)

(assert (=> start!7370 m!41425))

(declare-fun m!41427 () Bool)

(assert (=> start!7370 m!41427))

(declare-fun m!41429 () Bool)

(assert (=> b!47212 m!41429))

(declare-fun m!41431 () Bool)

(assert (=> b!47216 m!41431))

(declare-fun m!41433 () Bool)

(assert (=> mapNonEmpty!2072 m!41433))

(check-sat (not b!47216) tp_is_empty!2023 (not mapNonEmpty!2072) (not b!47212) (not start!7370))
(check-sat)
(get-model)

(declare-fun d!9423 () Bool)

(assert (=> d!9423 (= (validMask!0 mask!2458) (and (or (= mask!2458 #b00000000000000000000000000000111) (= mask!2458 #b00000000000000000000000000001111) (= mask!2458 #b00000000000000000000000000011111) (= mask!2458 #b00000000000000000000000000111111) (= mask!2458 #b00000000000000000000000001111111) (= mask!2458 #b00000000000000000000000011111111) (= mask!2458 #b00000000000000000000000111111111) (= mask!2458 #b00000000000000000000001111111111) (= mask!2458 #b00000000000000000000011111111111) (= mask!2458 #b00000000000000000000111111111111) (= mask!2458 #b00000000000000000001111111111111) (= mask!2458 #b00000000000000000011111111111111) (= mask!2458 #b00000000000000000111111111111111) (= mask!2458 #b00000000000000001111111111111111) (= mask!2458 #b00000000000000011111111111111111) (= mask!2458 #b00000000000000111111111111111111) (= mask!2458 #b00000000000001111111111111111111) (= mask!2458 #b00000000000011111111111111111111) (= mask!2458 #b00000000000111111111111111111111) (= mask!2458 #b00000000001111111111111111111111) (= mask!2458 #b00000000011111111111111111111111) (= mask!2458 #b00000000111111111111111111111111) (= mask!2458 #b00000001111111111111111111111111) (= mask!2458 #b00000011111111111111111111111111) (= mask!2458 #b00000111111111111111111111111111) (= mask!2458 #b00001111111111111111111111111111) (= mask!2458 #b00011111111111111111111111111111) (= mask!2458 #b00111111111111111111111111111111)) (bvsle mask!2458 #b00111111111111111111111111111111)))))

(assert (=> start!7370 d!9423))

(declare-fun d!9425 () Bool)

(assert (=> d!9425 (= (array_inv!884 _values!1550) (bvsge (size!1707 _values!1550) #b00000000000000000000000000000000))))

(assert (=> start!7370 d!9425))

(declare-fun d!9427 () Bool)

(assert (=> d!9427 (= (array_inv!885 _keys!1940) (bvsge (size!1708 _keys!1940) #b00000000000000000000000000000000))))

(assert (=> start!7370 d!9427))

(declare-fun d!9429 () Bool)

(declare-fun res!27505 () Bool)

(declare-fun e!30252 () Bool)

(assert (=> d!9429 (=> res!27505 e!30252)))

(assert (=> d!9429 (= res!27505 ((_ is Nil!1239) Nil!1239))))

(assert (=> d!9429 (= (noDuplicate!33 Nil!1239) e!30252)))

(declare-fun b!47264 () Bool)

(declare-fun e!30253 () Bool)

(assert (=> b!47264 (= e!30252 e!30253)))

(declare-fun res!27506 () Bool)

(assert (=> b!47264 (=> (not res!27506) (not e!30253))))

(declare-fun contains!574 (List!1242 (_ BitVec 64)) Bool)

(assert (=> b!47264 (= res!27506 (not (contains!574 (t!4270 Nil!1239) (h!1818 Nil!1239))))))

(declare-fun b!47265 () Bool)

(assert (=> b!47265 (= e!30253 (noDuplicate!33 (t!4270 Nil!1239)))))

(assert (= (and d!9429 (not res!27505)) b!47264))

(assert (= (and b!47264 res!27506) b!47265))

(declare-fun m!41459 () Bool)

(assert (=> b!47264 m!41459))

(declare-fun m!41461 () Bool)

(assert (=> b!47265 m!41461))

(assert (=> b!47216 d!9429))

(declare-fun b!47274 () Bool)

(declare-fun e!30260 () Bool)

(declare-fun call!3704 () Bool)

(assert (=> b!47274 (= e!30260 call!3704)))

(declare-fun b!47275 () Bool)

(declare-fun e!30261 () Bool)

(assert (=> b!47275 (= e!30260 e!30261)))

(declare-fun lt!20364 () (_ BitVec 64))

(assert (=> b!47275 (= lt!20364 (select (arr!1486 _keys!1940) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1342 0))(
  ( (Unit!1343) )
))
(declare-fun lt!20362 () Unit!1342)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3100 (_ BitVec 64) (_ BitVec 32)) Unit!1342)

(assert (=> b!47275 (= lt!20362 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1940 lt!20364 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!47275 (arrayContainsKey!0 _keys!1940 lt!20364 #b00000000000000000000000000000000)))

(declare-fun lt!20363 () Unit!1342)

(assert (=> b!47275 (= lt!20363 lt!20362)))

(declare-fun res!27511 () Bool)

(declare-datatypes ((SeekEntryResult!201 0))(
  ( (MissingZero!201 (index!2926 (_ BitVec 32))) (Found!201 (index!2927 (_ BitVec 32))) (Intermediate!201 (undefined!1013 Bool) (index!2928 (_ BitVec 32)) (x!8731 (_ BitVec 32))) (Undefined!201) (MissingVacant!201 (index!2929 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3100 (_ BitVec 32)) SeekEntryResult!201)

(assert (=> b!47275 (= res!27511 (= (seekEntryOrOpen!0 (select (arr!1486 _keys!1940) #b00000000000000000000000000000000) _keys!1940 mask!2458) (Found!201 #b00000000000000000000000000000000)))))

(assert (=> b!47275 (=> (not res!27511) (not e!30261))))

(declare-fun bm!3701 () Bool)

(assert (=> bm!3701 (= call!3704 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1940 mask!2458))))

(declare-fun b!47277 () Bool)

(assert (=> b!47277 (= e!30261 call!3704)))

(declare-fun b!47276 () Bool)

(declare-fun e!30262 () Bool)

(assert (=> b!47276 (= e!30262 e!30260)))

(declare-fun c!6389 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47276 (= c!6389 (validKeyInArray!0 (select (arr!1486 _keys!1940) #b00000000000000000000000000000000)))))

(declare-fun d!9431 () Bool)

(declare-fun res!27512 () Bool)

(assert (=> d!9431 (=> res!27512 e!30262)))

(assert (=> d!9431 (= res!27512 (bvsge #b00000000000000000000000000000000 (size!1708 _keys!1940)))))

(assert (=> d!9431 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458) e!30262)))

(assert (= (and d!9431 (not res!27512)) b!47276))

(assert (= (and b!47276 c!6389) b!47275))

(assert (= (and b!47276 (not c!6389)) b!47274))

(assert (= (and b!47275 res!27511) b!47277))

(assert (= (or b!47277 b!47274) bm!3701))

(declare-fun m!41463 () Bool)

(assert (=> b!47275 m!41463))

(declare-fun m!41465 () Bool)

(assert (=> b!47275 m!41465))

(declare-fun m!41467 () Bool)

(assert (=> b!47275 m!41467))

(assert (=> b!47275 m!41463))

(declare-fun m!41469 () Bool)

(assert (=> b!47275 m!41469))

(declare-fun m!41471 () Bool)

(assert (=> bm!3701 m!41471))

(assert (=> b!47276 m!41463))

(assert (=> b!47276 m!41463))

(declare-fun m!41473 () Bool)

(assert (=> b!47276 m!41473))

(assert (=> b!47212 d!9431))

(declare-fun mapNonEmpty!2081 () Bool)

(declare-fun mapRes!2081 () Bool)

(declare-fun tp!6230 () Bool)

(declare-fun e!30267 () Bool)

(assert (=> mapNonEmpty!2081 (= mapRes!2081 (and tp!6230 e!30267))))

(declare-fun mapKey!2081 () (_ BitVec 32))

(declare-fun mapValue!2081 () ValueCell!722)

(declare-fun mapRest!2081 () (Array (_ BitVec 32) ValueCell!722))

(assert (=> mapNonEmpty!2081 (= mapRest!2072 (store mapRest!2081 mapKey!2081 mapValue!2081))))

(declare-fun b!47284 () Bool)

(assert (=> b!47284 (= e!30267 tp_is_empty!2023)))

(declare-fun condMapEmpty!2081 () Bool)

(declare-fun mapDefault!2081 () ValueCell!722)

(assert (=> mapNonEmpty!2072 (= condMapEmpty!2081 (= mapRest!2072 ((as const (Array (_ BitVec 32) ValueCell!722)) mapDefault!2081)))))

(declare-fun e!30268 () Bool)

(assert (=> mapNonEmpty!2072 (= tp!6221 (and e!30268 mapRes!2081))))

(declare-fun mapIsEmpty!2081 () Bool)

(assert (=> mapIsEmpty!2081 mapRes!2081))

(declare-fun b!47285 () Bool)

(assert (=> b!47285 (= e!30268 tp_is_empty!2023)))

(assert (= (and mapNonEmpty!2072 condMapEmpty!2081) mapIsEmpty!2081))

(assert (= (and mapNonEmpty!2072 (not condMapEmpty!2081)) mapNonEmpty!2081))

(assert (= (and mapNonEmpty!2081 ((_ is ValueCellFull!722) mapValue!2081)) b!47284))

(assert (= (and mapNonEmpty!2072 ((_ is ValueCellFull!722) mapDefault!2081)) b!47285))

(declare-fun m!41475 () Bool)

(assert (=> mapNonEmpty!2081 m!41475))

(check-sat (not b!47275) tp_is_empty!2023 (not b!47264) (not mapNonEmpty!2081) (not bm!3701) (not b!47276) (not b!47265))
(check-sat)
