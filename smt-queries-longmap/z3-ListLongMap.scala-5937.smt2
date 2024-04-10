; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77428 () Bool)

(assert start!77428)

(declare-fun res!609034 () Bool)

(declare-fun e!505455 () Bool)

(assert (=> start!77428 (=> (not res!609034) (not e!505455))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77428 (= res!609034 (validMask!0 mask!1756))))

(assert (=> start!77428 e!505455))

(assert (=> start!77428 true))

(declare-datatypes ((V!29569 0))(
  ( (V!29570 (val!9277 Int)) )
))
(declare-datatypes ((ValueCell!8745 0))(
  ( (ValueCellFull!8745 (v!11781 V!29569)) (EmptyCell!8745) )
))
(declare-datatypes ((array!52968 0))(
  ( (array!52969 (arr!25445 (Array (_ BitVec 32) ValueCell!8745)) (size!25904 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52968)

(declare-fun e!505454 () Bool)

(declare-fun array_inv!19948 (array!52968) Bool)

(assert (=> start!77428 (and (array_inv!19948 _values!1152) e!505454)))

(declare-datatypes ((array!52970 0))(
  ( (array!52971 (arr!25446 (Array (_ BitVec 32) (_ BitVec 64))) (size!25905 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52970)

(declare-fun array_inv!19949 (array!52970) Bool)

(assert (=> start!77428 (array_inv!19949 _keys!1386)))

(declare-fun b!902496 () Bool)

(declare-fun e!505456 () Bool)

(declare-fun mapRes!29386 () Bool)

(assert (=> b!902496 (= e!505454 (and e!505456 mapRes!29386))))

(declare-fun condMapEmpty!29386 () Bool)

(declare-fun mapDefault!29386 () ValueCell!8745)

(assert (=> b!902496 (= condMapEmpty!29386 (= (arr!25445 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8745)) mapDefault!29386)))))

(declare-fun mapNonEmpty!29386 () Bool)

(declare-fun tp!56445 () Bool)

(declare-fun e!505452 () Bool)

(assert (=> mapNonEmpty!29386 (= mapRes!29386 (and tp!56445 e!505452))))

(declare-fun mapKey!29386 () (_ BitVec 32))

(declare-fun mapValue!29386 () ValueCell!8745)

(declare-fun mapRest!29386 () (Array (_ BitVec 32) ValueCell!8745))

(assert (=> mapNonEmpty!29386 (= (arr!25445 _values!1152) (store mapRest!29386 mapKey!29386 mapValue!29386))))

(declare-fun b!902497 () Bool)

(declare-fun res!609036 () Bool)

(assert (=> b!902497 (=> (not res!609036) (not e!505455))))

(assert (=> b!902497 (= res!609036 (and (bvsle #b00000000000000000000000000000000 (size!25905 _keys!1386)) (bvslt (size!25905 _keys!1386) #b01111111111111111111111111111111)))))

(declare-fun b!902498 () Bool)

(declare-fun e!505453 () Bool)

(assert (=> b!902498 (= e!505455 e!505453)))

(declare-fun res!609038 () Bool)

(assert (=> b!902498 (=> res!609038 e!505453)))

(declare-datatypes ((List!17885 0))(
  ( (Nil!17882) (Cons!17881 (h!19027 (_ BitVec 64)) (t!25268 List!17885)) )
))
(declare-fun contains!4452 (List!17885 (_ BitVec 64)) Bool)

(assert (=> b!902498 (= res!609038 (contains!4452 Nil!17882 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!902499 () Bool)

(assert (=> b!902499 (= e!505453 (contains!4452 Nil!17882 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!902500 () Bool)

(declare-fun res!609035 () Bool)

(assert (=> b!902500 (=> (not res!609035) (not e!505455))))

(declare-fun noDuplicate!1328 (List!17885) Bool)

(assert (=> b!902500 (= res!609035 (noDuplicate!1328 Nil!17882))))

(declare-fun b!902501 () Bool)

(declare-fun res!609037 () Bool)

(assert (=> b!902501 (=> (not res!609037) (not e!505455))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902501 (= res!609037 (and (= (size!25904 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25905 _keys!1386) (size!25904 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!902502 () Bool)

(declare-fun tp_is_empty!18453 () Bool)

(assert (=> b!902502 (= e!505456 tp_is_empty!18453)))

(declare-fun b!902503 () Bool)

(declare-fun res!609039 () Bool)

(assert (=> b!902503 (=> (not res!609039) (not e!505455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52970 (_ BitVec 32)) Bool)

(assert (=> b!902503 (= res!609039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!902504 () Bool)

(assert (=> b!902504 (= e!505452 tp_is_empty!18453)))

(declare-fun mapIsEmpty!29386 () Bool)

(assert (=> mapIsEmpty!29386 mapRes!29386))

(assert (= (and start!77428 res!609034) b!902501))

(assert (= (and b!902501 res!609037) b!902503))

(assert (= (and b!902503 res!609039) b!902497))

(assert (= (and b!902497 res!609036) b!902500))

(assert (= (and b!902500 res!609035) b!902498))

(assert (= (and b!902498 (not res!609038)) b!902499))

(assert (= (and b!902496 condMapEmpty!29386) mapIsEmpty!29386))

(assert (= (and b!902496 (not condMapEmpty!29386)) mapNonEmpty!29386))

(get-info :version)

(assert (= (and mapNonEmpty!29386 ((_ is ValueCellFull!8745) mapValue!29386)) b!902504))

(assert (= (and b!902496 ((_ is ValueCellFull!8745) mapDefault!29386)) b!902502))

(assert (= start!77428 b!902496))

(declare-fun m!838471 () Bool)

(assert (=> b!902500 m!838471))

(declare-fun m!838473 () Bool)

(assert (=> b!902499 m!838473))

(declare-fun m!838475 () Bool)

(assert (=> b!902503 m!838475))

(declare-fun m!838477 () Bool)

(assert (=> start!77428 m!838477))

(declare-fun m!838479 () Bool)

(assert (=> start!77428 m!838479))

(declare-fun m!838481 () Bool)

(assert (=> start!77428 m!838481))

(declare-fun m!838483 () Bool)

(assert (=> b!902498 m!838483))

(declare-fun m!838485 () Bool)

(assert (=> mapNonEmpty!29386 m!838485))

(check-sat (not b!902500) tp_is_empty!18453 (not start!77428) (not b!902499) (not b!902503) (not mapNonEmpty!29386) (not b!902498))
(check-sat)
(get-model)

(declare-fun d!111961 () Bool)

(declare-fun lt!407867 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!402 (List!17885) (InoxSet (_ BitVec 64)))

(assert (=> d!111961 (= lt!407867 (select (content!402 Nil!17882) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!505479 () Bool)

(assert (=> d!111961 (= lt!407867 e!505479)))

(declare-fun res!609063 () Bool)

(assert (=> d!111961 (=> (not res!609063) (not e!505479))))

(assert (=> d!111961 (= res!609063 ((_ is Cons!17881) Nil!17882))))

(assert (=> d!111961 (= (contains!4452 Nil!17882 #b1000000000000000000000000000000000000000000000000000000000000000) lt!407867)))

(declare-fun b!902536 () Bool)

(declare-fun e!505480 () Bool)

(assert (=> b!902536 (= e!505479 e!505480)))

(declare-fun res!609062 () Bool)

(assert (=> b!902536 (=> res!609062 e!505480)))

(assert (=> b!902536 (= res!609062 (= (h!19027 Nil!17882) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!902537 () Bool)

(assert (=> b!902537 (= e!505480 (contains!4452 (t!25268 Nil!17882) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!111961 res!609063) b!902536))

(assert (= (and b!902536 (not res!609062)) b!902537))

(declare-fun m!838503 () Bool)

(assert (=> d!111961 m!838503))

(declare-fun m!838505 () Bool)

(assert (=> d!111961 m!838505))

(declare-fun m!838507 () Bool)

(assert (=> b!902537 m!838507))

(assert (=> b!902499 d!111961))

(declare-fun d!111963 () Bool)

(declare-fun res!609068 () Bool)

(declare-fun e!505485 () Bool)

(assert (=> d!111963 (=> res!609068 e!505485)))

(assert (=> d!111963 (= res!609068 ((_ is Nil!17882) Nil!17882))))

(assert (=> d!111963 (= (noDuplicate!1328 Nil!17882) e!505485)))

(declare-fun b!902542 () Bool)

(declare-fun e!505486 () Bool)

(assert (=> b!902542 (= e!505485 e!505486)))

(declare-fun res!609069 () Bool)

(assert (=> b!902542 (=> (not res!609069) (not e!505486))))

(assert (=> b!902542 (= res!609069 (not (contains!4452 (t!25268 Nil!17882) (h!19027 Nil!17882))))))

(declare-fun b!902543 () Bool)

(assert (=> b!902543 (= e!505486 (noDuplicate!1328 (t!25268 Nil!17882)))))

(assert (= (and d!111963 (not res!609068)) b!902542))

(assert (= (and b!902542 res!609069) b!902543))

(declare-fun m!838509 () Bool)

(assert (=> b!902542 m!838509))

(declare-fun m!838511 () Bool)

(assert (=> b!902543 m!838511))

(assert (=> b!902500 d!111963))

(declare-fun d!111965 () Bool)

(declare-fun res!609074 () Bool)

(declare-fun e!505495 () Bool)

(assert (=> d!111965 (=> res!609074 e!505495)))

(assert (=> d!111965 (= res!609074 (bvsge #b00000000000000000000000000000000 (size!25905 _keys!1386)))))

(assert (=> d!111965 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!505495)))

(declare-fun bm!40243 () Bool)

(declare-fun call!40246 () Bool)

(assert (=> bm!40243 (= call!40246 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!902552 () Bool)

(declare-fun e!505493 () Bool)

(assert (=> b!902552 (= e!505493 call!40246)))

(declare-fun b!902553 () Bool)

(declare-fun e!505494 () Bool)

(assert (=> b!902553 (= e!505494 call!40246)))

(declare-fun b!902554 () Bool)

(assert (=> b!902554 (= e!505494 e!505493)))

(declare-fun lt!407874 () (_ BitVec 64))

(assert (=> b!902554 (= lt!407874 (select (arr!25446 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30644 0))(
  ( (Unit!30645) )
))
(declare-fun lt!407875 () Unit!30644)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52970 (_ BitVec 64) (_ BitVec 32)) Unit!30644)

(assert (=> b!902554 (= lt!407875 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!407874 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52970 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!902554 (arrayContainsKey!0 _keys!1386 lt!407874 #b00000000000000000000000000000000)))

(declare-fun lt!407876 () Unit!30644)

(assert (=> b!902554 (= lt!407876 lt!407875)))

(declare-fun res!609075 () Bool)

(declare-datatypes ((SeekEntryResult!8961 0))(
  ( (MissingZero!8961 (index!38215 (_ BitVec 32))) (Found!8961 (index!38216 (_ BitVec 32))) (Intermediate!8961 (undefined!9773 Bool) (index!38217 (_ BitVec 32)) (x!76932 (_ BitVec 32))) (Undefined!8961) (MissingVacant!8961 (index!38218 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52970 (_ BitVec 32)) SeekEntryResult!8961)

(assert (=> b!902554 (= res!609075 (= (seekEntryOrOpen!0 (select (arr!25446 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8961 #b00000000000000000000000000000000)))))

(assert (=> b!902554 (=> (not res!609075) (not e!505493))))

(declare-fun b!902555 () Bool)

(assert (=> b!902555 (= e!505495 e!505494)))

(declare-fun c!95642 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!902555 (= c!95642 (validKeyInArray!0 (select (arr!25446 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!111965 (not res!609074)) b!902555))

(assert (= (and b!902555 c!95642) b!902554))

(assert (= (and b!902555 (not c!95642)) b!902553))

(assert (= (and b!902554 res!609075) b!902552))

(assert (= (or b!902552 b!902553) bm!40243))

(declare-fun m!838513 () Bool)

(assert (=> bm!40243 m!838513))

(declare-fun m!838515 () Bool)

(assert (=> b!902554 m!838515))

(declare-fun m!838517 () Bool)

(assert (=> b!902554 m!838517))

(declare-fun m!838519 () Bool)

(assert (=> b!902554 m!838519))

(assert (=> b!902554 m!838515))

(declare-fun m!838521 () Bool)

(assert (=> b!902554 m!838521))

(assert (=> b!902555 m!838515))

(assert (=> b!902555 m!838515))

(declare-fun m!838523 () Bool)

(assert (=> b!902555 m!838523))

(assert (=> b!902503 d!111965))

(declare-fun d!111967 () Bool)

(assert (=> d!111967 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77428 d!111967))

(declare-fun d!111969 () Bool)

(assert (=> d!111969 (= (array_inv!19948 _values!1152) (bvsge (size!25904 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77428 d!111969))

(declare-fun d!111971 () Bool)

(assert (=> d!111971 (= (array_inv!19949 _keys!1386) (bvsge (size!25905 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77428 d!111971))

(declare-fun d!111973 () Bool)

(declare-fun lt!407877 () Bool)

(assert (=> d!111973 (= lt!407877 (select (content!402 Nil!17882) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!505496 () Bool)

(assert (=> d!111973 (= lt!407877 e!505496)))

(declare-fun res!609077 () Bool)

(assert (=> d!111973 (=> (not res!609077) (not e!505496))))

(assert (=> d!111973 (= res!609077 ((_ is Cons!17881) Nil!17882))))

(assert (=> d!111973 (= (contains!4452 Nil!17882 #b0000000000000000000000000000000000000000000000000000000000000000) lt!407877)))

(declare-fun b!902556 () Bool)

(declare-fun e!505497 () Bool)

(assert (=> b!902556 (= e!505496 e!505497)))

(declare-fun res!609076 () Bool)

(assert (=> b!902556 (=> res!609076 e!505497)))

(assert (=> b!902556 (= res!609076 (= (h!19027 Nil!17882) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!902557 () Bool)

(assert (=> b!902557 (= e!505497 (contains!4452 (t!25268 Nil!17882) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!111973 res!609077) b!902556))

(assert (= (and b!902556 (not res!609076)) b!902557))

(assert (=> d!111973 m!838503))

(declare-fun m!838525 () Bool)

(assert (=> d!111973 m!838525))

(declare-fun m!838527 () Bool)

(assert (=> b!902557 m!838527))

(assert (=> b!902498 d!111973))

(declare-fun b!902564 () Bool)

(declare-fun e!505503 () Bool)

(assert (=> b!902564 (= e!505503 tp_is_empty!18453)))

(declare-fun condMapEmpty!29392 () Bool)

(declare-fun mapDefault!29392 () ValueCell!8745)

(assert (=> mapNonEmpty!29386 (= condMapEmpty!29392 (= mapRest!29386 ((as const (Array (_ BitVec 32) ValueCell!8745)) mapDefault!29392)))))

(declare-fun e!505502 () Bool)

(declare-fun mapRes!29392 () Bool)

(assert (=> mapNonEmpty!29386 (= tp!56445 (and e!505502 mapRes!29392))))

(declare-fun mapIsEmpty!29392 () Bool)

(assert (=> mapIsEmpty!29392 mapRes!29392))

(declare-fun b!902565 () Bool)

(assert (=> b!902565 (= e!505502 tp_is_empty!18453)))

(declare-fun mapNonEmpty!29392 () Bool)

(declare-fun tp!56451 () Bool)

(assert (=> mapNonEmpty!29392 (= mapRes!29392 (and tp!56451 e!505503))))

(declare-fun mapValue!29392 () ValueCell!8745)

(declare-fun mapKey!29392 () (_ BitVec 32))

(declare-fun mapRest!29392 () (Array (_ BitVec 32) ValueCell!8745))

(assert (=> mapNonEmpty!29392 (= mapRest!29386 (store mapRest!29392 mapKey!29392 mapValue!29392))))

(assert (= (and mapNonEmpty!29386 condMapEmpty!29392) mapIsEmpty!29392))

(assert (= (and mapNonEmpty!29386 (not condMapEmpty!29392)) mapNonEmpty!29392))

(assert (= (and mapNonEmpty!29392 ((_ is ValueCellFull!8745) mapValue!29392)) b!902564))

(assert (= (and mapNonEmpty!29386 ((_ is ValueCellFull!8745) mapDefault!29392)) b!902565))

(declare-fun m!838529 () Bool)

(assert (=> mapNonEmpty!29392 m!838529))

(check-sat (not b!902555) (not d!111973) (not b!902542) (not b!902557) (not b!902554) (not d!111961) (not mapNonEmpty!29392) (not bm!40243) (not b!902537) tp_is_empty!18453 (not b!902543))
(check-sat)
