; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7352 () Bool)

(assert start!7352)

(declare-fun b!47210 () Bool)

(declare-fun e!30209 () Bool)

(declare-fun e!30206 () Bool)

(declare-fun mapRes!2063 () Bool)

(assert (=> b!47210 (= e!30209 (and e!30206 mapRes!2063))))

(declare-fun condMapEmpty!2063 () Bool)

(declare-datatypes ((V!2425 0))(
  ( (V!2426 (val!1048 Int)) )
))
(declare-datatypes ((ValueCell!720 0))(
  ( (ValueCellFull!720 (v!2108 V!2425)) (EmptyCell!720) )
))
(declare-datatypes ((array!3099 0))(
  ( (array!3100 (arr!1487 (Array (_ BitVec 32) ValueCell!720)) (size!1709 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3099)

(declare-fun mapDefault!2063 () ValueCell!720)

(assert (=> b!47210 (= condMapEmpty!2063 (= (arr!1487 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!720)) mapDefault!2063)))))

(declare-fun mapNonEmpty!2063 () Bool)

(declare-fun tp!6212 () Bool)

(declare-fun e!30207 () Bool)

(assert (=> mapNonEmpty!2063 (= mapRes!2063 (and tp!6212 e!30207))))

(declare-fun mapRest!2063 () (Array (_ BitVec 32) ValueCell!720))

(declare-fun mapValue!2063 () ValueCell!720)

(declare-fun mapKey!2063 () (_ BitVec 32))

(assert (=> mapNonEmpty!2063 (= (arr!1487 _values!1550) (store mapRest!2063 mapKey!2063 mapValue!2063))))

(declare-fun b!47211 () Bool)

(declare-fun tp_is_empty!2019 () Bool)

(assert (=> b!47211 (= e!30206 tp_is_empty!2019)))

(declare-fun b!47212 () Bool)

(assert (=> b!47212 (= e!30207 tp_is_empty!2019)))

(declare-fun b!47213 () Bool)

(declare-fun res!27472 () Bool)

(declare-fun e!30205 () Bool)

(assert (=> b!47213 (=> (not res!27472) (not e!30205))))

(declare-datatypes ((array!3101 0))(
  ( (array!3102 (arr!1488 (Array (_ BitVec 32) (_ BitVec 64))) (size!1710 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3101)

(declare-fun extraKeys!1471 () (_ BitVec 32))

(declare-fun mask!2458 () (_ BitVec 32))

(assert (=> b!47213 (= res!27472 (and (= (size!1709 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1710 _keys!1940) (size!1709 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47214 () Bool)

(assert (=> b!47214 (= e!30205 (and (bvsle #b00000000000000000000000000000000 (size!1710 _keys!1940)) (bvsge (size!1710 _keys!1940) #b01111111111111111111111111111111)))))

(declare-fun b!47215 () Bool)

(declare-fun res!27473 () Bool)

(assert (=> b!47215 (=> (not res!27473) (not e!30205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3101 (_ BitVec 32)) Bool)

(assert (=> b!47215 (= res!27473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun res!27474 () Bool)

(assert (=> start!7352 (=> (not res!27474) (not e!30205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7352 (= res!27474 (validMask!0 mask!2458))))

(assert (=> start!7352 e!30205))

(assert (=> start!7352 true))

(declare-fun array_inv!894 (array!3099) Bool)

(assert (=> start!7352 (and (array_inv!894 _values!1550) e!30209)))

(declare-fun array_inv!895 (array!3101) Bool)

(assert (=> start!7352 (array_inv!895 _keys!1940)))

(declare-fun mapIsEmpty!2063 () Bool)

(assert (=> mapIsEmpty!2063 mapRes!2063))

(assert (= (and start!7352 res!27474) b!47213))

(assert (= (and b!47213 res!27472) b!47215))

(assert (= (and b!47215 res!27473) b!47214))

(assert (= (and b!47210 condMapEmpty!2063) mapIsEmpty!2063))

(assert (= (and b!47210 (not condMapEmpty!2063)) mapNonEmpty!2063))

(get-info :version)

(assert (= (and mapNonEmpty!2063 ((_ is ValueCellFull!720) mapValue!2063)) b!47212))

(assert (= (and b!47210 ((_ is ValueCellFull!720) mapDefault!2063)) b!47211))

(assert (= start!7352 b!47210))

(declare-fun m!41513 () Bool)

(assert (=> mapNonEmpty!2063 m!41513))

(declare-fun m!41515 () Bool)

(assert (=> b!47215 m!41515))

(declare-fun m!41517 () Bool)

(assert (=> start!7352 m!41517))

(declare-fun m!41519 () Bool)

(assert (=> start!7352 m!41519))

(declare-fun m!41521 () Bool)

(assert (=> start!7352 m!41521))

(check-sat (not b!47215) (not start!7352) (not mapNonEmpty!2063) tp_is_empty!2019)
(check-sat)
(get-model)

(declare-fun b!47242 () Bool)

(declare-fun e!30231 () Bool)

(declare-fun e!30233 () Bool)

(assert (=> b!47242 (= e!30231 e!30233)))

(declare-fun c!6402 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47242 (= c!6402 (validKeyInArray!0 (select (arr!1488 _keys!1940) #b00000000000000000000000000000000)))))

(declare-fun d!9425 () Bool)

(declare-fun res!27488 () Bool)

(assert (=> d!9425 (=> res!27488 e!30231)))

(assert (=> d!9425 (= res!27488 (bvsge #b00000000000000000000000000000000 (size!1710 _keys!1940)))))

(assert (=> d!9425 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458) e!30231)))

(declare-fun b!47243 () Bool)

(declare-fun e!30232 () Bool)

(assert (=> b!47243 (= e!30233 e!30232)))

(declare-fun lt!20397 () (_ BitVec 64))

(assert (=> b!47243 (= lt!20397 (select (arr!1488 _keys!1940) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1329 0))(
  ( (Unit!1330) )
))
(declare-fun lt!20398 () Unit!1329)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3101 (_ BitVec 64) (_ BitVec 32)) Unit!1329)

(assert (=> b!47243 (= lt!20398 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1940 lt!20397 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!47243 (arrayContainsKey!0 _keys!1940 lt!20397 #b00000000000000000000000000000000)))

(declare-fun lt!20396 () Unit!1329)

(assert (=> b!47243 (= lt!20396 lt!20398)))

(declare-fun res!27489 () Bool)

(declare-datatypes ((SeekEntryResult!206 0))(
  ( (MissingZero!206 (index!2946 (_ BitVec 32))) (Found!206 (index!2947 (_ BitVec 32))) (Intermediate!206 (undefined!1018 Bool) (index!2948 (_ BitVec 32)) (x!8726 (_ BitVec 32))) (Undefined!206) (MissingVacant!206 (index!2949 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3101 (_ BitVec 32)) SeekEntryResult!206)

(assert (=> b!47243 (= res!27489 (= (seekEntryOrOpen!0 (select (arr!1488 _keys!1940) #b00000000000000000000000000000000) _keys!1940 mask!2458) (Found!206 #b00000000000000000000000000000000)))))

(assert (=> b!47243 (=> (not res!27489) (not e!30232))))

(declare-fun b!47244 () Bool)

(declare-fun call!3715 () Bool)

(assert (=> b!47244 (= e!30233 call!3715)))

(declare-fun bm!3712 () Bool)

(assert (=> bm!3712 (= call!3715 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1940 mask!2458))))

(declare-fun b!47245 () Bool)

(assert (=> b!47245 (= e!30232 call!3715)))

(assert (= (and d!9425 (not res!27488)) b!47242))

(assert (= (and b!47242 c!6402) b!47243))

(assert (= (and b!47242 (not c!6402)) b!47244))

(assert (= (and b!47243 res!27489) b!47245))

(assert (= (or b!47245 b!47244) bm!3712))

(declare-fun m!41533 () Bool)

(assert (=> b!47242 m!41533))

(assert (=> b!47242 m!41533))

(declare-fun m!41535 () Bool)

(assert (=> b!47242 m!41535))

(assert (=> b!47243 m!41533))

(declare-fun m!41537 () Bool)

(assert (=> b!47243 m!41537))

(declare-fun m!41539 () Bool)

(assert (=> b!47243 m!41539))

(assert (=> b!47243 m!41533))

(declare-fun m!41541 () Bool)

(assert (=> b!47243 m!41541))

(declare-fun m!41543 () Bool)

(assert (=> bm!3712 m!41543))

(assert (=> b!47215 d!9425))

(declare-fun d!9427 () Bool)

(assert (=> d!9427 (= (validMask!0 mask!2458) (and (or (= mask!2458 #b00000000000000000000000000000111) (= mask!2458 #b00000000000000000000000000001111) (= mask!2458 #b00000000000000000000000000011111) (= mask!2458 #b00000000000000000000000000111111) (= mask!2458 #b00000000000000000000000001111111) (= mask!2458 #b00000000000000000000000011111111) (= mask!2458 #b00000000000000000000000111111111) (= mask!2458 #b00000000000000000000001111111111) (= mask!2458 #b00000000000000000000011111111111) (= mask!2458 #b00000000000000000000111111111111) (= mask!2458 #b00000000000000000001111111111111) (= mask!2458 #b00000000000000000011111111111111) (= mask!2458 #b00000000000000000111111111111111) (= mask!2458 #b00000000000000001111111111111111) (= mask!2458 #b00000000000000011111111111111111) (= mask!2458 #b00000000000000111111111111111111) (= mask!2458 #b00000000000001111111111111111111) (= mask!2458 #b00000000000011111111111111111111) (= mask!2458 #b00000000000111111111111111111111) (= mask!2458 #b00000000001111111111111111111111) (= mask!2458 #b00000000011111111111111111111111) (= mask!2458 #b00000000111111111111111111111111) (= mask!2458 #b00000001111111111111111111111111) (= mask!2458 #b00000011111111111111111111111111) (= mask!2458 #b00000111111111111111111111111111) (= mask!2458 #b00001111111111111111111111111111) (= mask!2458 #b00011111111111111111111111111111) (= mask!2458 #b00111111111111111111111111111111)) (bvsle mask!2458 #b00111111111111111111111111111111)))))

(assert (=> start!7352 d!9427))

(declare-fun d!9429 () Bool)

(assert (=> d!9429 (= (array_inv!894 _values!1550) (bvsge (size!1709 _values!1550) #b00000000000000000000000000000000))))

(assert (=> start!7352 d!9429))

(declare-fun d!9431 () Bool)

(assert (=> d!9431 (= (array_inv!895 _keys!1940) (bvsge (size!1710 _keys!1940) #b00000000000000000000000000000000))))

(assert (=> start!7352 d!9431))

(declare-fun mapIsEmpty!2069 () Bool)

(declare-fun mapRes!2069 () Bool)

(assert (=> mapIsEmpty!2069 mapRes!2069))

(declare-fun condMapEmpty!2069 () Bool)

(declare-fun mapDefault!2069 () ValueCell!720)

(assert (=> mapNonEmpty!2063 (= condMapEmpty!2069 (= mapRest!2063 ((as const (Array (_ BitVec 32) ValueCell!720)) mapDefault!2069)))))

(declare-fun e!30239 () Bool)

(assert (=> mapNonEmpty!2063 (= tp!6212 (and e!30239 mapRes!2069))))

(declare-fun b!47253 () Bool)

(assert (=> b!47253 (= e!30239 tp_is_empty!2019)))

(declare-fun mapNonEmpty!2069 () Bool)

(declare-fun tp!6218 () Bool)

(declare-fun e!30238 () Bool)

(assert (=> mapNonEmpty!2069 (= mapRes!2069 (and tp!6218 e!30238))))

(declare-fun mapKey!2069 () (_ BitVec 32))

(declare-fun mapValue!2069 () ValueCell!720)

(declare-fun mapRest!2069 () (Array (_ BitVec 32) ValueCell!720))

(assert (=> mapNonEmpty!2069 (= mapRest!2063 (store mapRest!2069 mapKey!2069 mapValue!2069))))

(declare-fun b!47252 () Bool)

(assert (=> b!47252 (= e!30238 tp_is_empty!2019)))

(assert (= (and mapNonEmpty!2063 condMapEmpty!2069) mapIsEmpty!2069))

(assert (= (and mapNonEmpty!2063 (not condMapEmpty!2069)) mapNonEmpty!2069))

(assert (= (and mapNonEmpty!2069 ((_ is ValueCellFull!720) mapValue!2069)) b!47252))

(assert (= (and mapNonEmpty!2063 ((_ is ValueCellFull!720) mapDefault!2069)) b!47253))

(declare-fun m!41545 () Bool)

(assert (=> mapNonEmpty!2069 m!41545))

(check-sat tp_is_empty!2019 (not b!47243) (not bm!3712) (not mapNonEmpty!2069) (not b!47242))
(check-sat)
