; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43650 () Bool)

(assert start!43650)

(declare-fun b_free!12357 () Bool)

(declare-fun b_next!12357 () Bool)

(assert (=> start!43650 (= b_free!12357 (not b_next!12357))))

(declare-fun tp!43363 () Bool)

(declare-fun b_and!21123 () Bool)

(assert (=> start!43650 (= tp!43363 b_and!21123)))

(declare-fun b!483471 () Bool)

(declare-fun e!284517 () Bool)

(declare-fun e!284522 () Bool)

(declare-fun mapRes!22522 () Bool)

(assert (=> b!483471 (= e!284517 (and e!284522 mapRes!22522))))

(declare-fun condMapEmpty!22522 () Bool)

(declare-datatypes ((V!19563 0))(
  ( (V!19564 (val!6982 Int)) )
))
(declare-datatypes ((ValueCell!6573 0))(
  ( (ValueCellFull!6573 (v!9278 V!19563)) (EmptyCell!6573) )
))
(declare-datatypes ((array!31399 0))(
  ( (array!31400 (arr!15099 (Array (_ BitVec 32) ValueCell!6573)) (size!15457 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31399)

(declare-fun mapDefault!22522 () ValueCell!6573)

(assert (=> b!483471 (= condMapEmpty!22522 (= (arr!15099 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6573)) mapDefault!22522)))))

(declare-fun b!483472 () Bool)

(declare-fun res!288095 () Bool)

(declare-fun e!284520 () Bool)

(assert (=> b!483472 (=> (not res!288095) (not e!284520))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!483472 (= res!288095 (validKeyInArray!0 k0!1332))))

(declare-fun b!483473 () Bool)

(declare-fun res!288102 () Bool)

(assert (=> b!483473 (=> (not res!288102) (not e!284520))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun minValue!1458 () V!19563)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19563)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31401 0))(
  ( (array!31402 (arr!15100 (Array (_ BitVec 32) (_ BitVec 64))) (size!15458 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31401)

(declare-datatypes ((tuple2!9168 0))(
  ( (tuple2!9169 (_1!4595 (_ BitVec 64)) (_2!4595 V!19563)) )
))
(declare-datatypes ((List!9246 0))(
  ( (Nil!9243) (Cons!9242 (h!10098 tuple2!9168) (t!15466 List!9246)) )
))
(declare-datatypes ((ListLongMap!8081 0))(
  ( (ListLongMap!8082 (toList!4056 List!9246)) )
))
(declare-fun contains!2673 (ListLongMap!8081 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2375 (array!31401 array!31399 (_ BitVec 32) (_ BitVec 32) V!19563 V!19563 (_ BitVec 32) Int) ListLongMap!8081)

(assert (=> b!483473 (= res!288102 (contains!2673 (getCurrentListMap!2375 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!483474 () Bool)

(declare-fun e!284519 () Bool)

(declare-fun arrayContainsKey!0 (array!31401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!483474 (= e!284519 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!483475 () Bool)

(declare-fun res!288097 () Bool)

(assert (=> b!483475 (=> (not res!288097) (not e!284520))))

(assert (=> b!483475 (= res!288097 (and (= (size!15457 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15458 _keys!1874) (size!15457 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun e!284518 () Bool)

(declare-fun b!483476 () Bool)

(declare-datatypes ((SeekEntryResult!3577 0))(
  ( (MissingZero!3577 (index!16487 (_ BitVec 32))) (Found!3577 (index!16488 (_ BitVec 32))) (Intermediate!3577 (undefined!4389 Bool) (index!16489 (_ BitVec 32)) (x!45399 (_ BitVec 32))) (Undefined!3577) (MissingVacant!3577 (index!16490 (_ BitVec 32))) )
))
(declare-fun lt!219157 () SeekEntryResult!3577)

(assert (=> b!483476 (= e!284518 (= (select (arr!15100 _keys!1874) (index!16488 lt!219157)) k0!1332))))

(declare-fun b!483477 () Bool)

(declare-fun tp_is_empty!13869 () Bool)

(assert (=> b!483477 (= e!284522 tp_is_empty!13869)))

(declare-fun b!483478 () Bool)

(declare-fun res!288101 () Bool)

(assert (=> b!483478 (=> (not res!288101) (not e!284520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31401 (_ BitVec 32)) Bool)

(assert (=> b!483478 (= res!288101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapNonEmpty!22522 () Bool)

(declare-fun tp!43362 () Bool)

(declare-fun e!284523 () Bool)

(assert (=> mapNonEmpty!22522 (= mapRes!22522 (and tp!43362 e!284523))))

(declare-fun mapRest!22522 () (Array (_ BitVec 32) ValueCell!6573))

(declare-fun mapKey!22522 () (_ BitVec 32))

(declare-fun mapValue!22522 () ValueCell!6573)

(assert (=> mapNonEmpty!22522 (= (arr!15099 _values!1516) (store mapRest!22522 mapKey!22522 mapValue!22522))))

(declare-fun b!483479 () Bool)

(assert (=> b!483479 (= e!284520 (not e!284518))))

(declare-fun res!288100 () Bool)

(assert (=> b!483479 (=> (not res!288100) (not e!284518))))

(get-info :version)

(assert (=> b!483479 (= res!288100 ((_ is Found!3577) lt!219157))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31401 (_ BitVec 32)) SeekEntryResult!3577)

(assert (=> b!483479 (= lt!219157 (seekEntryOrOpen!0 k0!1332 _keys!1874 mask!2352))))

(declare-fun lt!219155 () (_ BitVec 32))

(assert (=> b!483479 (arrayForallSeekEntryOrOpenFound!0 lt!219155 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14172 0))(
  ( (Unit!14173) )
))
(declare-fun lt!219154 () Unit!14172)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14172)

(assert (=> b!483479 (= lt!219154 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!219155))))

(declare-fun arrayScanForKey!0 (array!31401 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!483479 (= lt!219155 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!483479 e!284519))

(declare-fun c!58117 () Bool)

(assert (=> b!483479 (= c!58117 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!219156 () Unit!14172)

(declare-fun lemmaKeyInListMapIsInArray!154 (array!31401 array!31399 (_ BitVec 32) (_ BitVec 32) V!19563 V!19563 (_ BitVec 64) Int) Unit!14172)

(assert (=> b!483479 (= lt!219156 (lemmaKeyInListMapIsInArray!154 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!483480 () Bool)

(declare-fun res!288098 () Bool)

(assert (=> b!483480 (=> (not res!288098) (not e!284520))))

(declare-datatypes ((List!9247 0))(
  ( (Nil!9244) (Cons!9243 (h!10099 (_ BitVec 64)) (t!15467 List!9247)) )
))
(declare-fun arrayNoDuplicates!0 (array!31401 (_ BitVec 32) List!9247) Bool)

(assert (=> b!483480 (= res!288098 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9244))))

(declare-fun b!483481 () Bool)

(declare-fun res!288099 () Bool)

(assert (=> b!483481 (=> (not res!288099) (not e!284518))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!483481 (= res!288099 (inRange!0 (index!16488 lt!219157) mask!2352))))

(declare-fun mapIsEmpty!22522 () Bool)

(assert (=> mapIsEmpty!22522 mapRes!22522))

(declare-fun res!288096 () Bool)

(assert (=> start!43650 (=> (not res!288096) (not e!284520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43650 (= res!288096 (validMask!0 mask!2352))))

(assert (=> start!43650 e!284520))

(assert (=> start!43650 true))

(assert (=> start!43650 tp_is_empty!13869))

(declare-fun array_inv!10896 (array!31399) Bool)

(assert (=> start!43650 (and (array_inv!10896 _values!1516) e!284517)))

(assert (=> start!43650 tp!43363))

(declare-fun array_inv!10897 (array!31401) Bool)

(assert (=> start!43650 (array_inv!10897 _keys!1874)))

(declare-fun b!483482 () Bool)

(assert (=> b!483482 (= e!284523 tp_is_empty!13869)))

(declare-fun b!483483 () Bool)

(assert (=> b!483483 (= e!284519 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!43650 res!288096) b!483475))

(assert (= (and b!483475 res!288097) b!483478))

(assert (= (and b!483478 res!288101) b!483480))

(assert (= (and b!483480 res!288098) b!483473))

(assert (= (and b!483473 res!288102) b!483472))

(assert (= (and b!483472 res!288095) b!483479))

(assert (= (and b!483479 c!58117) b!483474))

(assert (= (and b!483479 (not c!58117)) b!483483))

(assert (= (and b!483479 res!288100) b!483481))

(assert (= (and b!483481 res!288099) b!483476))

(assert (= (and b!483471 condMapEmpty!22522) mapIsEmpty!22522))

(assert (= (and b!483471 (not condMapEmpty!22522)) mapNonEmpty!22522))

(assert (= (and mapNonEmpty!22522 ((_ is ValueCellFull!6573) mapValue!22522)) b!483482))

(assert (= (and b!483471 ((_ is ValueCellFull!6573) mapDefault!22522)) b!483477))

(assert (= start!43650 b!483471))

(declare-fun m!464449 () Bool)

(assert (=> b!483481 m!464449))

(declare-fun m!464451 () Bool)

(assert (=> b!483479 m!464451))

(declare-fun m!464453 () Bool)

(assert (=> b!483479 m!464453))

(declare-fun m!464455 () Bool)

(assert (=> b!483479 m!464455))

(declare-fun m!464457 () Bool)

(assert (=> b!483479 m!464457))

(declare-fun m!464459 () Bool)

(assert (=> b!483479 m!464459))

(declare-fun m!464461 () Bool)

(assert (=> b!483478 m!464461))

(declare-fun m!464463 () Bool)

(assert (=> b!483476 m!464463))

(declare-fun m!464465 () Bool)

(assert (=> b!483480 m!464465))

(declare-fun m!464467 () Bool)

(assert (=> b!483474 m!464467))

(declare-fun m!464469 () Bool)

(assert (=> mapNonEmpty!22522 m!464469))

(declare-fun m!464471 () Bool)

(assert (=> b!483473 m!464471))

(assert (=> b!483473 m!464471))

(declare-fun m!464473 () Bool)

(assert (=> b!483473 m!464473))

(declare-fun m!464475 () Bool)

(assert (=> start!43650 m!464475))

(declare-fun m!464477 () Bool)

(assert (=> start!43650 m!464477))

(declare-fun m!464479 () Bool)

(assert (=> start!43650 m!464479))

(declare-fun m!464481 () Bool)

(assert (=> b!483472 m!464481))

(check-sat (not b!483474) (not start!43650) (not b!483473) (not b!483479) (not b!483472) tp_is_empty!13869 (not mapNonEmpty!22522) (not b!483481) b_and!21123 (not b!483478) (not b_next!12357) (not b!483480))
(check-sat b_and!21123 (not b_next!12357))
(get-model)

(declare-fun d!76911 () Bool)

(declare-fun res!288131 () Bool)

(declare-fun e!284549 () Bool)

(assert (=> d!76911 (=> res!288131 e!284549)))

(assert (=> d!76911 (= res!288131 (= (select (arr!15100 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76911 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!284549)))

(declare-fun b!483527 () Bool)

(declare-fun e!284550 () Bool)

(assert (=> b!483527 (= e!284549 e!284550)))

(declare-fun res!288132 () Bool)

(assert (=> b!483527 (=> (not res!288132) (not e!284550))))

(assert (=> b!483527 (= res!288132 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15458 _keys!1874)))))

(declare-fun b!483528 () Bool)

(assert (=> b!483528 (= e!284550 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76911 (not res!288131)) b!483527))

(assert (= (and b!483527 res!288132) b!483528))

(declare-fun m!464517 () Bool)

(assert (=> d!76911 m!464517))

(declare-fun m!464519 () Bool)

(assert (=> b!483528 m!464519))

(assert (=> b!483474 d!76911))

(declare-fun b!483541 () Bool)

(declare-fun e!284558 () SeekEntryResult!3577)

(declare-fun lt!219178 () SeekEntryResult!3577)

(assert (=> b!483541 (= e!284558 (MissingZero!3577 (index!16489 lt!219178)))))

(declare-fun b!483542 () Bool)

(declare-fun e!284557 () SeekEntryResult!3577)

(assert (=> b!483542 (= e!284557 Undefined!3577)))

(declare-fun b!483543 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31401 (_ BitVec 32)) SeekEntryResult!3577)

(assert (=> b!483543 (= e!284558 (seekKeyOrZeroReturnVacant!0 (x!45399 lt!219178) (index!16489 lt!219178) (index!16489 lt!219178) k0!1332 _keys!1874 mask!2352))))

(declare-fun d!76913 () Bool)

(declare-fun lt!219176 () SeekEntryResult!3577)

(assert (=> d!76913 (and (or ((_ is Undefined!3577) lt!219176) (not ((_ is Found!3577) lt!219176)) (and (bvsge (index!16488 lt!219176) #b00000000000000000000000000000000) (bvslt (index!16488 lt!219176) (size!15458 _keys!1874)))) (or ((_ is Undefined!3577) lt!219176) ((_ is Found!3577) lt!219176) (not ((_ is MissingZero!3577) lt!219176)) (and (bvsge (index!16487 lt!219176) #b00000000000000000000000000000000) (bvslt (index!16487 lt!219176) (size!15458 _keys!1874)))) (or ((_ is Undefined!3577) lt!219176) ((_ is Found!3577) lt!219176) ((_ is MissingZero!3577) lt!219176) (not ((_ is MissingVacant!3577) lt!219176)) (and (bvsge (index!16490 lt!219176) #b00000000000000000000000000000000) (bvslt (index!16490 lt!219176) (size!15458 _keys!1874)))) (or ((_ is Undefined!3577) lt!219176) (ite ((_ is Found!3577) lt!219176) (= (select (arr!15100 _keys!1874) (index!16488 lt!219176)) k0!1332) (ite ((_ is MissingZero!3577) lt!219176) (= (select (arr!15100 _keys!1874) (index!16487 lt!219176)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3577) lt!219176) (= (select (arr!15100 _keys!1874) (index!16490 lt!219176)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!76913 (= lt!219176 e!284557)))

(declare-fun c!58128 () Bool)

(assert (=> d!76913 (= c!58128 (and ((_ is Intermediate!3577) lt!219178) (undefined!4389 lt!219178)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31401 (_ BitVec 32)) SeekEntryResult!3577)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!76913 (= lt!219178 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1332 mask!2352) k0!1332 _keys!1874 mask!2352))))

(assert (=> d!76913 (validMask!0 mask!2352)))

(assert (=> d!76913 (= (seekEntryOrOpen!0 k0!1332 _keys!1874 mask!2352) lt!219176)))

(declare-fun b!483544 () Bool)

(declare-fun c!58129 () Bool)

(declare-fun lt!219177 () (_ BitVec 64))

(assert (=> b!483544 (= c!58129 (= lt!219177 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!284559 () SeekEntryResult!3577)

(assert (=> b!483544 (= e!284559 e!284558)))

(declare-fun b!483545 () Bool)

(assert (=> b!483545 (= e!284557 e!284559)))

(assert (=> b!483545 (= lt!219177 (select (arr!15100 _keys!1874) (index!16489 lt!219178)))))

(declare-fun c!58127 () Bool)

(assert (=> b!483545 (= c!58127 (= lt!219177 k0!1332))))

(declare-fun b!483546 () Bool)

(assert (=> b!483546 (= e!284559 (Found!3577 (index!16489 lt!219178)))))

(assert (= (and d!76913 c!58128) b!483542))

(assert (= (and d!76913 (not c!58128)) b!483545))

(assert (= (and b!483545 c!58127) b!483546))

(assert (= (and b!483545 (not c!58127)) b!483544))

(assert (= (and b!483544 c!58129) b!483541))

(assert (= (and b!483544 (not c!58129)) b!483543))

(declare-fun m!464521 () Bool)

(assert (=> b!483543 m!464521))

(declare-fun m!464523 () Bool)

(assert (=> d!76913 m!464523))

(declare-fun m!464525 () Bool)

(assert (=> d!76913 m!464525))

(declare-fun m!464527 () Bool)

(assert (=> d!76913 m!464527))

(declare-fun m!464529 () Bool)

(assert (=> d!76913 m!464529))

(assert (=> d!76913 m!464475))

(assert (=> d!76913 m!464525))

(declare-fun m!464531 () Bool)

(assert (=> d!76913 m!464531))

(declare-fun m!464533 () Bool)

(assert (=> b!483545 m!464533))

(assert (=> b!483479 d!76913))

(declare-fun b!483555 () Bool)

(declare-fun e!284566 () Bool)

(declare-fun call!31042 () Bool)

(assert (=> b!483555 (= e!284566 call!31042)))

(declare-fun b!483556 () Bool)

(declare-fun e!284567 () Bool)

(declare-fun e!284568 () Bool)

(assert (=> b!483556 (= e!284567 e!284568)))

(declare-fun c!58132 () Bool)

(assert (=> b!483556 (= c!58132 (validKeyInArray!0 (select (arr!15100 _keys!1874) lt!219155)))))

(declare-fun b!483557 () Bool)

(assert (=> b!483557 (= e!284568 e!284566)))

(declare-fun lt!219186 () (_ BitVec 64))

(assert (=> b!483557 (= lt!219186 (select (arr!15100 _keys!1874) lt!219155))))

(declare-fun lt!219185 () Unit!14172)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31401 (_ BitVec 64) (_ BitVec 32)) Unit!14172)

(assert (=> b!483557 (= lt!219185 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!219186 lt!219155))))

(assert (=> b!483557 (arrayContainsKey!0 _keys!1874 lt!219186 #b00000000000000000000000000000000)))

(declare-fun lt!219187 () Unit!14172)

(assert (=> b!483557 (= lt!219187 lt!219185)))

(declare-fun res!288137 () Bool)

(assert (=> b!483557 (= res!288137 (= (seekEntryOrOpen!0 (select (arr!15100 _keys!1874) lt!219155) _keys!1874 mask!2352) (Found!3577 lt!219155)))))

(assert (=> b!483557 (=> (not res!288137) (not e!284566))))

(declare-fun b!483558 () Bool)

(assert (=> b!483558 (= e!284568 call!31042)))

(declare-fun d!76915 () Bool)

(declare-fun res!288138 () Bool)

(assert (=> d!76915 (=> res!288138 e!284567)))

(assert (=> d!76915 (= res!288138 (bvsge lt!219155 (size!15458 _keys!1874)))))

(assert (=> d!76915 (= (arrayForallSeekEntryOrOpenFound!0 lt!219155 _keys!1874 mask!2352) e!284567)))

(declare-fun bm!31039 () Bool)

(assert (=> bm!31039 (= call!31042 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!219155 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(assert (= (and d!76915 (not res!288138)) b!483556))

(assert (= (and b!483556 c!58132) b!483557))

(assert (= (and b!483556 (not c!58132)) b!483558))

(assert (= (and b!483557 res!288137) b!483555))

(assert (= (or b!483555 b!483558) bm!31039))

(declare-fun m!464535 () Bool)

(assert (=> b!483556 m!464535))

(assert (=> b!483556 m!464535))

(declare-fun m!464537 () Bool)

(assert (=> b!483556 m!464537))

(assert (=> b!483557 m!464535))

(declare-fun m!464539 () Bool)

(assert (=> b!483557 m!464539))

(declare-fun m!464541 () Bool)

(assert (=> b!483557 m!464541))

(assert (=> b!483557 m!464535))

(declare-fun m!464543 () Bool)

(assert (=> b!483557 m!464543))

(declare-fun m!464545 () Bool)

(assert (=> bm!31039 m!464545))

(assert (=> b!483479 d!76915))

(declare-fun d!76917 () Bool)

(assert (=> d!76917 (arrayForallSeekEntryOrOpenFound!0 lt!219155 _keys!1874 mask!2352)))

(declare-fun lt!219190 () Unit!14172)

(declare-fun choose!38 (array!31401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14172)

(assert (=> d!76917 (= lt!219190 (choose!38 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!219155))))

(assert (=> d!76917 (validMask!0 mask!2352)))

(assert (=> d!76917 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!219155) lt!219190)))

(declare-fun bs!15369 () Bool)

(assert (= bs!15369 d!76917))

(assert (=> bs!15369 m!464451))

(declare-fun m!464547 () Bool)

(assert (=> bs!15369 m!464547))

(assert (=> bs!15369 m!464475))

(assert (=> b!483479 d!76917))

(declare-fun d!76919 () Bool)

(declare-fun e!284571 () Bool)

(assert (=> d!76919 e!284571))

(declare-fun c!58135 () Bool)

(assert (=> d!76919 (= c!58135 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!219193 () Unit!14172)

(declare-fun choose!1381 (array!31401 array!31399 (_ BitVec 32) (_ BitVec 32) V!19563 V!19563 (_ BitVec 64) Int) Unit!14172)

(assert (=> d!76919 (= lt!219193 (choose!1381 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76919 (validMask!0 mask!2352)))

(assert (=> d!76919 (= (lemmaKeyInListMapIsInArray!154 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!219193)))

(declare-fun b!483563 () Bool)

(assert (=> b!483563 (= e!284571 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!483564 () Bool)

(assert (=> b!483564 (= e!284571 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76919 c!58135) b!483563))

(assert (= (and d!76919 (not c!58135)) b!483564))

(declare-fun m!464549 () Bool)

(assert (=> d!76919 m!464549))

(assert (=> d!76919 m!464475))

(assert (=> b!483563 m!464467))

(assert (=> b!483479 d!76919))

(declare-fun d!76921 () Bool)

(declare-fun lt!219196 () (_ BitVec 32))

(assert (=> d!76921 (and (or (bvslt lt!219196 #b00000000000000000000000000000000) (bvsge lt!219196 (size!15458 _keys!1874)) (and (bvsge lt!219196 #b00000000000000000000000000000000) (bvslt lt!219196 (size!15458 _keys!1874)))) (bvsge lt!219196 #b00000000000000000000000000000000) (bvslt lt!219196 (size!15458 _keys!1874)) (= (select (arr!15100 _keys!1874) lt!219196) k0!1332))))

(declare-fun e!284574 () (_ BitVec 32))

(assert (=> d!76921 (= lt!219196 e!284574)))

(declare-fun c!58138 () Bool)

(assert (=> d!76921 (= c!58138 (= (select (arr!15100 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76921 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15458 _keys!1874)) (bvslt (size!15458 _keys!1874) #b01111111111111111111111111111111))))

(assert (=> d!76921 (= (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) lt!219196)))

(declare-fun b!483569 () Bool)

(assert (=> b!483569 (= e!284574 #b00000000000000000000000000000000)))

(declare-fun b!483570 () Bool)

(assert (=> b!483570 (= e!284574 (arrayScanForKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76921 c!58138) b!483569))

(assert (= (and d!76921 (not c!58138)) b!483570))

(declare-fun m!464551 () Bool)

(assert (=> d!76921 m!464551))

(assert (=> d!76921 m!464517))

(declare-fun m!464553 () Bool)

(assert (=> b!483570 m!464553))

(assert (=> b!483479 d!76921))

(declare-fun b!483582 () Bool)

(declare-fun e!284585 () Bool)

(declare-fun call!31045 () Bool)

(assert (=> b!483582 (= e!284585 call!31045)))

(declare-fun b!483583 () Bool)

(assert (=> b!483583 (= e!284585 call!31045)))

(declare-fun b!483584 () Bool)

(declare-fun e!284584 () Bool)

(declare-fun contains!2674 (List!9247 (_ BitVec 64)) Bool)

(assert (=> b!483584 (= e!284584 (contains!2674 Nil!9244 (select (arr!15100 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!31042 () Bool)

(declare-fun c!58141 () Bool)

(assert (=> bm!31042 (= call!31045 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58141 (Cons!9243 (select (arr!15100 _keys!1874) #b00000000000000000000000000000000) Nil!9244) Nil!9244)))))

(declare-fun b!483585 () Bool)

(declare-fun e!284586 () Bool)

(assert (=> b!483585 (= e!284586 e!284585)))

(assert (=> b!483585 (= c!58141 (validKeyInArray!0 (select (arr!15100 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483581 () Bool)

(declare-fun e!284583 () Bool)

(assert (=> b!483581 (= e!284583 e!284586)))

(declare-fun res!288146 () Bool)

(assert (=> b!483581 (=> (not res!288146) (not e!284586))))

(assert (=> b!483581 (= res!288146 (not e!284584))))

(declare-fun res!288145 () Bool)

(assert (=> b!483581 (=> (not res!288145) (not e!284584))))

(assert (=> b!483581 (= res!288145 (validKeyInArray!0 (select (arr!15100 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun d!76923 () Bool)

(declare-fun res!288147 () Bool)

(assert (=> d!76923 (=> res!288147 e!284583)))

(assert (=> d!76923 (= res!288147 (bvsge #b00000000000000000000000000000000 (size!15458 _keys!1874)))))

(assert (=> d!76923 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9244) e!284583)))

(assert (= (and d!76923 (not res!288147)) b!483581))

(assert (= (and b!483581 res!288145) b!483584))

(assert (= (and b!483581 res!288146) b!483585))

(assert (= (and b!483585 c!58141) b!483582))

(assert (= (and b!483585 (not c!58141)) b!483583))

(assert (= (or b!483582 b!483583) bm!31042))

(assert (=> b!483584 m!464517))

(assert (=> b!483584 m!464517))

(declare-fun m!464555 () Bool)

(assert (=> b!483584 m!464555))

(assert (=> bm!31042 m!464517))

(declare-fun m!464557 () Bool)

(assert (=> bm!31042 m!464557))

(assert (=> b!483585 m!464517))

(assert (=> b!483585 m!464517))

(declare-fun m!464559 () Bool)

(assert (=> b!483585 m!464559))

(assert (=> b!483581 m!464517))

(assert (=> b!483581 m!464517))

(assert (=> b!483581 m!464559))

(assert (=> b!483480 d!76923))

(declare-fun d!76925 () Bool)

(assert (=> d!76925 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43650 d!76925))

(declare-fun d!76927 () Bool)

(assert (=> d!76927 (= (array_inv!10896 _values!1516) (bvsge (size!15457 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43650 d!76927))

(declare-fun d!76929 () Bool)

(assert (=> d!76929 (= (array_inv!10897 _keys!1874) (bvsge (size!15458 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43650 d!76929))

(declare-fun d!76931 () Bool)

(assert (=> d!76931 (= (inRange!0 (index!16488 lt!219157) mask!2352) (and (bvsge (index!16488 lt!219157) #b00000000000000000000000000000000) (bvslt (index!16488 lt!219157) (bvadd mask!2352 #b00000000000000000000000000000001))))))

(assert (=> b!483481 d!76931))

(declare-fun d!76933 () Bool)

(assert (=> d!76933 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!483472 d!76933))

(declare-fun d!76935 () Bool)

(declare-fun e!284591 () Bool)

(assert (=> d!76935 e!284591))

(declare-fun res!288150 () Bool)

(assert (=> d!76935 (=> res!288150 e!284591)))

(declare-fun lt!219205 () Bool)

(assert (=> d!76935 (= res!288150 (not lt!219205))))

(declare-fun lt!219207 () Bool)

(assert (=> d!76935 (= lt!219205 lt!219207)))

(declare-fun lt!219206 () Unit!14172)

(declare-fun e!284592 () Unit!14172)

(assert (=> d!76935 (= lt!219206 e!284592)))

(declare-fun c!58144 () Bool)

(assert (=> d!76935 (= c!58144 lt!219207)))

(declare-fun containsKey!361 (List!9246 (_ BitVec 64)) Bool)

(assert (=> d!76935 (= lt!219207 (containsKey!361 (toList!4056 (getCurrentListMap!2375 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76935 (= (contains!2673 (getCurrentListMap!2375 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!219205)))

(declare-fun b!483592 () Bool)

(declare-fun lt!219208 () Unit!14172)

(assert (=> b!483592 (= e!284592 lt!219208)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!309 (List!9246 (_ BitVec 64)) Unit!14172)

(assert (=> b!483592 (= lt!219208 (lemmaContainsKeyImpliesGetValueByKeyDefined!309 (toList!4056 (getCurrentListMap!2375 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!405 0))(
  ( (Some!404 (v!9280 V!19563)) (None!403) )
))
(declare-fun isDefined!310 (Option!405) Bool)

(declare-fun getValueByKey!399 (List!9246 (_ BitVec 64)) Option!405)

(assert (=> b!483592 (isDefined!310 (getValueByKey!399 (toList!4056 (getCurrentListMap!2375 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!483593 () Bool)

(declare-fun Unit!14174 () Unit!14172)

(assert (=> b!483593 (= e!284592 Unit!14174)))

(declare-fun b!483594 () Bool)

(assert (=> b!483594 (= e!284591 (isDefined!310 (getValueByKey!399 (toList!4056 (getCurrentListMap!2375 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76935 c!58144) b!483592))

(assert (= (and d!76935 (not c!58144)) b!483593))

(assert (= (and d!76935 (not res!288150)) b!483594))

(declare-fun m!464561 () Bool)

(assert (=> d!76935 m!464561))

(declare-fun m!464563 () Bool)

(assert (=> b!483592 m!464563))

(declare-fun m!464565 () Bool)

(assert (=> b!483592 m!464565))

(assert (=> b!483592 m!464565))

(declare-fun m!464567 () Bool)

(assert (=> b!483592 m!464567))

(assert (=> b!483594 m!464565))

(assert (=> b!483594 m!464565))

(assert (=> b!483594 m!464567))

(assert (=> b!483473 d!76935))

(declare-fun lt!219267 () ListLongMap!8081)

(declare-fun e!284625 () Bool)

(declare-fun b!483637 () Bool)

(declare-fun apply!346 (ListLongMap!8081 (_ BitVec 64)) V!19563)

(declare-fun get!7307 (ValueCell!6573 V!19563) V!19563)

(declare-fun dynLambda!957 (Int (_ BitVec 64)) V!19563)

(assert (=> b!483637 (= e!284625 (= (apply!346 lt!219267 (select (arr!15100 _keys!1874) #b00000000000000000000000000000000)) (get!7307 (select (arr!15099 _values!1516) #b00000000000000000000000000000000) (dynLambda!957 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!483637 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15457 _values!1516)))))

(assert (=> b!483637 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15458 _keys!1874)))))

(declare-fun b!483638 () Bool)

(declare-fun e!284619 () ListLongMap!8081)

(declare-fun call!31061 () ListLongMap!8081)

(assert (=> b!483638 (= e!284619 call!31061)))

(declare-fun b!483639 () Bool)

(declare-fun e!284628 () Unit!14172)

(declare-fun lt!219273 () Unit!14172)

(assert (=> b!483639 (= e!284628 lt!219273)))

(declare-fun lt!219253 () ListLongMap!8081)

(declare-fun getCurrentListMapNoExtraKeys!2115 (array!31401 array!31399 (_ BitVec 32) (_ BitVec 32) V!19563 V!19563 (_ BitVec 32) Int) ListLongMap!8081)

(assert (=> b!483639 (= lt!219253 (getCurrentListMapNoExtraKeys!2115 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219268 () (_ BitVec 64))

(assert (=> b!483639 (= lt!219268 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219271 () (_ BitVec 64))

(assert (=> b!483639 (= lt!219271 (select (arr!15100 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!219261 () Unit!14172)

(declare-fun addStillContains!304 (ListLongMap!8081 (_ BitVec 64) V!19563 (_ BitVec 64)) Unit!14172)

(assert (=> b!483639 (= lt!219261 (addStillContains!304 lt!219253 lt!219268 zeroValue!1458 lt!219271))))

(declare-fun +!1778 (ListLongMap!8081 tuple2!9168) ListLongMap!8081)

(assert (=> b!483639 (contains!2673 (+!1778 lt!219253 (tuple2!9169 lt!219268 zeroValue!1458)) lt!219271)))

(declare-fun lt!219259 () Unit!14172)

(assert (=> b!483639 (= lt!219259 lt!219261)))

(declare-fun lt!219269 () ListLongMap!8081)

(assert (=> b!483639 (= lt!219269 (getCurrentListMapNoExtraKeys!2115 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219257 () (_ BitVec 64))

(assert (=> b!483639 (= lt!219257 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219263 () (_ BitVec 64))

(assert (=> b!483639 (= lt!219263 (select (arr!15100 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!219274 () Unit!14172)

(declare-fun addApplyDifferent!304 (ListLongMap!8081 (_ BitVec 64) V!19563 (_ BitVec 64)) Unit!14172)

(assert (=> b!483639 (= lt!219274 (addApplyDifferent!304 lt!219269 lt!219257 minValue!1458 lt!219263))))

(assert (=> b!483639 (= (apply!346 (+!1778 lt!219269 (tuple2!9169 lt!219257 minValue!1458)) lt!219263) (apply!346 lt!219269 lt!219263))))

(declare-fun lt!219270 () Unit!14172)

(assert (=> b!483639 (= lt!219270 lt!219274)))

(declare-fun lt!219262 () ListLongMap!8081)

(assert (=> b!483639 (= lt!219262 (getCurrentListMapNoExtraKeys!2115 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219260 () (_ BitVec 64))

(assert (=> b!483639 (= lt!219260 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219256 () (_ BitVec 64))

(assert (=> b!483639 (= lt!219256 (select (arr!15100 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!219265 () Unit!14172)

(assert (=> b!483639 (= lt!219265 (addApplyDifferent!304 lt!219262 lt!219260 zeroValue!1458 lt!219256))))

(assert (=> b!483639 (= (apply!346 (+!1778 lt!219262 (tuple2!9169 lt!219260 zeroValue!1458)) lt!219256) (apply!346 lt!219262 lt!219256))))

(declare-fun lt!219258 () Unit!14172)

(assert (=> b!483639 (= lt!219258 lt!219265)))

(declare-fun lt!219254 () ListLongMap!8081)

(assert (=> b!483639 (= lt!219254 (getCurrentListMapNoExtraKeys!2115 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!219272 () (_ BitVec 64))

(assert (=> b!483639 (= lt!219272 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219266 () (_ BitVec 64))

(assert (=> b!483639 (= lt!219266 (select (arr!15100 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!483639 (= lt!219273 (addApplyDifferent!304 lt!219254 lt!219272 minValue!1458 lt!219266))))

(assert (=> b!483639 (= (apply!346 (+!1778 lt!219254 (tuple2!9169 lt!219272 minValue!1458)) lt!219266) (apply!346 lt!219254 lt!219266))))

(declare-fun b!483640 () Bool)

(declare-fun e!284627 () Bool)

(assert (=> b!483640 (= e!284627 (validKeyInArray!0 (select (arr!15100 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483641 () Bool)

(declare-fun e!284629 () Bool)

(assert (=> b!483641 (= e!284629 e!284625)))

(declare-fun res!288175 () Bool)

(assert (=> b!483641 (=> (not res!288175) (not e!284625))))

(assert (=> b!483641 (= res!288175 (contains!2673 lt!219267 (select (arr!15100 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!483641 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15458 _keys!1874)))))

(declare-fun b!483642 () Bool)

(declare-fun res!288176 () Bool)

(declare-fun e!284621 () Bool)

(assert (=> b!483642 (=> (not res!288176) (not e!284621))))

(declare-fun e!284630 () Bool)

(assert (=> b!483642 (= res!288176 e!284630)))

(declare-fun c!58162 () Bool)

(assert (=> b!483642 (= c!58162 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!31057 () Bool)

(declare-fun call!31063 () ListLongMap!8081)

(assert (=> bm!31057 (= call!31063 (getCurrentListMapNoExtraKeys!2115 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!483643 () Bool)

(declare-fun e!284624 () Bool)

(assert (=> b!483643 (= e!284630 e!284624)))

(declare-fun res!288173 () Bool)

(declare-fun call!31065 () Bool)

(assert (=> b!483643 (= res!288173 call!31065)))

(assert (=> b!483643 (=> (not res!288173) (not e!284624))))

(declare-fun b!483644 () Bool)

(declare-fun call!31062 () ListLongMap!8081)

(assert (=> b!483644 (= e!284619 call!31062)))

(declare-fun b!483645 () Bool)

(declare-fun res!288172 () Bool)

(assert (=> b!483645 (=> (not res!288172) (not e!284621))))

(assert (=> b!483645 (= res!288172 e!284629)))

(declare-fun res!288169 () Bool)

(assert (=> b!483645 (=> res!288169 e!284629)))

(declare-fun e!284631 () Bool)

(assert (=> b!483645 (= res!288169 (not e!284631))))

(declare-fun res!288177 () Bool)

(assert (=> b!483645 (=> (not res!288177) (not e!284631))))

(assert (=> b!483645 (= res!288177 (bvslt #b00000000000000000000000000000000 (size!15458 _keys!1874)))))

(declare-fun b!483646 () Bool)

(declare-fun e!284626 () ListLongMap!8081)

(declare-fun e!284620 () ListLongMap!8081)

(assert (=> b!483646 (= e!284626 e!284620)))

(declare-fun c!58161 () Bool)

(assert (=> b!483646 (= c!58161 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!483647 () Bool)

(declare-fun e!284622 () Bool)

(declare-fun call!31060 () Bool)

(assert (=> b!483647 (= e!284622 (not call!31060))))

(declare-fun bm!31058 () Bool)

(declare-fun call!31066 () ListLongMap!8081)

(assert (=> bm!31058 (= call!31066 call!31063)))

(declare-fun b!483648 () Bool)

(assert (=> b!483648 (= e!284621 e!284622)))

(declare-fun c!58159 () Bool)

(assert (=> b!483648 (= c!58159 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!483649 () Bool)

(declare-fun call!31064 () ListLongMap!8081)

(assert (=> b!483649 (= e!284626 (+!1778 call!31064 (tuple2!9169 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun b!483650 () Bool)

(declare-fun Unit!14175 () Unit!14172)

(assert (=> b!483650 (= e!284628 Unit!14175)))

(declare-fun b!483651 () Bool)

(assert (=> b!483651 (= e!284620 call!31062)))

(declare-fun c!58160 () Bool)

(declare-fun bm!31059 () Bool)

(assert (=> bm!31059 (= call!31064 (+!1778 (ite c!58160 call!31063 (ite c!58161 call!31066 call!31061)) (ite (or c!58160 c!58161) (tuple2!9169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9169 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!483652 () Bool)

(assert (=> b!483652 (= e!284631 (validKeyInArray!0 (select (arr!15100 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483653 () Bool)

(assert (=> b!483653 (= e!284624 (= (apply!346 lt!219267 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun bm!31060 () Bool)

(assert (=> bm!31060 (= call!31061 call!31066)))

(declare-fun b!483654 () Bool)

(declare-fun e!284623 () Bool)

(assert (=> b!483654 (= e!284623 (= (apply!346 lt!219267 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun b!483655 () Bool)

(assert (=> b!483655 (= e!284630 (not call!31065))))

(declare-fun b!483656 () Bool)

(assert (=> b!483656 (= e!284622 e!284623)))

(declare-fun res!288170 () Bool)

(assert (=> b!483656 (= res!288170 call!31060)))

(assert (=> b!483656 (=> (not res!288170) (not e!284623))))

(declare-fun bm!31061 () Bool)

(assert (=> bm!31061 (= call!31060 (contains!2673 lt!219267 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!31062 () Bool)

(assert (=> bm!31062 (= call!31062 call!31064)))

(declare-fun b!483657 () Bool)

(declare-fun c!58158 () Bool)

(assert (=> b!483657 (= c!58158 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!483657 (= e!284620 e!284619)))

(declare-fun bm!31063 () Bool)

(assert (=> bm!31063 (= call!31065 (contains!2673 lt!219267 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!76937 () Bool)

(assert (=> d!76937 e!284621))

(declare-fun res!288174 () Bool)

(assert (=> d!76937 (=> (not res!288174) (not e!284621))))

(assert (=> d!76937 (= res!288174 (or (bvsge #b00000000000000000000000000000000 (size!15458 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15458 _keys!1874)))))))

(declare-fun lt!219264 () ListLongMap!8081)

(assert (=> d!76937 (= lt!219267 lt!219264)))

(declare-fun lt!219255 () Unit!14172)

(assert (=> d!76937 (= lt!219255 e!284628)))

(declare-fun c!58157 () Bool)

(assert (=> d!76937 (= c!58157 e!284627)))

(declare-fun res!288171 () Bool)

(assert (=> d!76937 (=> (not res!288171) (not e!284627))))

(assert (=> d!76937 (= res!288171 (bvslt #b00000000000000000000000000000000 (size!15458 _keys!1874)))))

(assert (=> d!76937 (= lt!219264 e!284626)))

(assert (=> d!76937 (= c!58160 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76937 (validMask!0 mask!2352)))

(assert (=> d!76937 (= (getCurrentListMap!2375 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!219267)))

(assert (= (and d!76937 c!58160) b!483649))

(assert (= (and d!76937 (not c!58160)) b!483646))

(assert (= (and b!483646 c!58161) b!483651))

(assert (= (and b!483646 (not c!58161)) b!483657))

(assert (= (and b!483657 c!58158) b!483644))

(assert (= (and b!483657 (not c!58158)) b!483638))

(assert (= (or b!483644 b!483638) bm!31060))

(assert (= (or b!483651 bm!31060) bm!31058))

(assert (= (or b!483651 b!483644) bm!31062))

(assert (= (or b!483649 bm!31058) bm!31057))

(assert (= (or b!483649 bm!31062) bm!31059))

(assert (= (and d!76937 res!288171) b!483640))

(assert (= (and d!76937 c!58157) b!483639))

(assert (= (and d!76937 (not c!58157)) b!483650))

(assert (= (and d!76937 res!288174) b!483645))

(assert (= (and b!483645 res!288177) b!483652))

(assert (= (and b!483645 (not res!288169)) b!483641))

(assert (= (and b!483641 res!288175) b!483637))

(assert (= (and b!483645 res!288172) b!483642))

(assert (= (and b!483642 c!58162) b!483643))

(assert (= (and b!483642 (not c!58162)) b!483655))

(assert (= (and b!483643 res!288173) b!483653))

(assert (= (or b!483643 b!483655) bm!31063))

(assert (= (and b!483642 res!288176) b!483648))

(assert (= (and b!483648 c!58159) b!483656))

(assert (= (and b!483648 (not c!58159)) b!483647))

(assert (= (and b!483656 res!288170) b!483654))

(assert (= (or b!483656 b!483647) bm!31061))

(declare-fun b_lambda!10819 () Bool)

(assert (=> (not b_lambda!10819) (not b!483637)))

(declare-fun t!15469 () Bool)

(declare-fun tb!4173 () Bool)

(assert (=> (and start!43650 (= defaultEntry!1519 defaultEntry!1519) t!15469) tb!4173))

(declare-fun result!7787 () Bool)

(assert (=> tb!4173 (= result!7787 tp_is_empty!13869)))

(assert (=> b!483637 t!15469))

(declare-fun b_and!21127 () Bool)

(assert (= b_and!21123 (and (=> t!15469 result!7787) b_and!21127)))

(assert (=> b!483641 m!464517))

(assert (=> b!483641 m!464517))

(declare-fun m!464569 () Bool)

(assert (=> b!483641 m!464569))

(assert (=> d!76937 m!464475))

(declare-fun m!464571 () Bool)

(assert (=> b!483637 m!464571))

(declare-fun m!464573 () Bool)

(assert (=> b!483637 m!464573))

(declare-fun m!464575 () Bool)

(assert (=> b!483637 m!464575))

(assert (=> b!483637 m!464517))

(declare-fun m!464577 () Bool)

(assert (=> b!483637 m!464577))

(assert (=> b!483637 m!464571))

(assert (=> b!483637 m!464517))

(assert (=> b!483637 m!464573))

(declare-fun m!464579 () Bool)

(assert (=> bm!31063 m!464579))

(declare-fun m!464581 () Bool)

(assert (=> bm!31059 m!464581))

(declare-fun m!464583 () Bool)

(assert (=> b!483639 m!464583))

(declare-fun m!464585 () Bool)

(assert (=> b!483639 m!464585))

(declare-fun m!464587 () Bool)

(assert (=> b!483639 m!464587))

(declare-fun m!464589 () Bool)

(assert (=> b!483639 m!464589))

(declare-fun m!464591 () Bool)

(assert (=> b!483639 m!464591))

(declare-fun m!464593 () Bool)

(assert (=> b!483639 m!464593))

(declare-fun m!464595 () Bool)

(assert (=> b!483639 m!464595))

(assert (=> b!483639 m!464589))

(assert (=> b!483639 m!464593))

(declare-fun m!464597 () Bool)

(assert (=> b!483639 m!464597))

(declare-fun m!464599 () Bool)

(assert (=> b!483639 m!464599))

(declare-fun m!464601 () Bool)

(assert (=> b!483639 m!464601))

(assert (=> b!483639 m!464585))

(declare-fun m!464603 () Bool)

(assert (=> b!483639 m!464603))

(declare-fun m!464605 () Bool)

(assert (=> b!483639 m!464605))

(assert (=> b!483639 m!464517))

(declare-fun m!464607 () Bool)

(assert (=> b!483639 m!464607))

(declare-fun m!464609 () Bool)

(assert (=> b!483639 m!464609))

(assert (=> b!483639 m!464607))

(declare-fun m!464611 () Bool)

(assert (=> b!483639 m!464611))

(declare-fun m!464613 () Bool)

(assert (=> b!483639 m!464613))

(declare-fun m!464615 () Bool)

(assert (=> bm!31061 m!464615))

(declare-fun m!464617 () Bool)

(assert (=> b!483649 m!464617))

(assert (=> bm!31057 m!464599))

(declare-fun m!464619 () Bool)

(assert (=> b!483653 m!464619))

(assert (=> b!483652 m!464517))

(assert (=> b!483652 m!464517))

(assert (=> b!483652 m!464559))

(declare-fun m!464621 () Bool)

(assert (=> b!483654 m!464621))

(assert (=> b!483640 m!464517))

(assert (=> b!483640 m!464517))

(assert (=> b!483640 m!464559))

(assert (=> b!483473 d!76937))

(declare-fun b!483660 () Bool)

(declare-fun e!284632 () Bool)

(declare-fun call!31067 () Bool)

(assert (=> b!483660 (= e!284632 call!31067)))

(declare-fun b!483661 () Bool)

(declare-fun e!284633 () Bool)

(declare-fun e!284634 () Bool)

(assert (=> b!483661 (= e!284633 e!284634)))

(declare-fun c!58163 () Bool)

(assert (=> b!483661 (= c!58163 (validKeyInArray!0 (select (arr!15100 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483662 () Bool)

(assert (=> b!483662 (= e!284634 e!284632)))

(declare-fun lt!219276 () (_ BitVec 64))

(assert (=> b!483662 (= lt!219276 (select (arr!15100 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!219275 () Unit!14172)

(assert (=> b!483662 (= lt!219275 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!219276 #b00000000000000000000000000000000))))

(assert (=> b!483662 (arrayContainsKey!0 _keys!1874 lt!219276 #b00000000000000000000000000000000)))

(declare-fun lt!219277 () Unit!14172)

(assert (=> b!483662 (= lt!219277 lt!219275)))

(declare-fun res!288178 () Bool)

(assert (=> b!483662 (= res!288178 (= (seekEntryOrOpen!0 (select (arr!15100 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3577 #b00000000000000000000000000000000)))))

(assert (=> b!483662 (=> (not res!288178) (not e!284632))))

(declare-fun b!483663 () Bool)

(assert (=> b!483663 (= e!284634 call!31067)))

(declare-fun d!76939 () Bool)

(declare-fun res!288179 () Bool)

(assert (=> d!76939 (=> res!288179 e!284633)))

(assert (=> d!76939 (= res!288179 (bvsge #b00000000000000000000000000000000 (size!15458 _keys!1874)))))

(assert (=> d!76939 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!284633)))

(declare-fun bm!31064 () Bool)

(assert (=> bm!31064 (= call!31067 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(assert (= (and d!76939 (not res!288179)) b!483661))

(assert (= (and b!483661 c!58163) b!483662))

(assert (= (and b!483661 (not c!58163)) b!483663))

(assert (= (and b!483662 res!288178) b!483660))

(assert (= (or b!483660 b!483663) bm!31064))

(assert (=> b!483661 m!464517))

(assert (=> b!483661 m!464517))

(assert (=> b!483661 m!464559))

(assert (=> b!483662 m!464517))

(declare-fun m!464623 () Bool)

(assert (=> b!483662 m!464623))

(declare-fun m!464625 () Bool)

(assert (=> b!483662 m!464625))

(assert (=> b!483662 m!464517))

(declare-fun m!464627 () Bool)

(assert (=> b!483662 m!464627))

(declare-fun m!464629 () Bool)

(assert (=> bm!31064 m!464629))

(assert (=> b!483478 d!76939))

(declare-fun b!483671 () Bool)

(declare-fun e!284640 () Bool)

(assert (=> b!483671 (= e!284640 tp_is_empty!13869)))

(declare-fun b!483670 () Bool)

(declare-fun e!284639 () Bool)

(assert (=> b!483670 (= e!284639 tp_is_empty!13869)))

(declare-fun condMapEmpty!22528 () Bool)

(declare-fun mapDefault!22528 () ValueCell!6573)

(assert (=> mapNonEmpty!22522 (= condMapEmpty!22528 (= mapRest!22522 ((as const (Array (_ BitVec 32) ValueCell!6573)) mapDefault!22528)))))

(declare-fun mapRes!22528 () Bool)

(assert (=> mapNonEmpty!22522 (= tp!43362 (and e!284640 mapRes!22528))))

(declare-fun mapIsEmpty!22528 () Bool)

(assert (=> mapIsEmpty!22528 mapRes!22528))

(declare-fun mapNonEmpty!22528 () Bool)

(declare-fun tp!43372 () Bool)

(assert (=> mapNonEmpty!22528 (= mapRes!22528 (and tp!43372 e!284639))))

(declare-fun mapValue!22528 () ValueCell!6573)

(declare-fun mapRest!22528 () (Array (_ BitVec 32) ValueCell!6573))

(declare-fun mapKey!22528 () (_ BitVec 32))

(assert (=> mapNonEmpty!22528 (= mapRest!22522 (store mapRest!22528 mapKey!22528 mapValue!22528))))

(assert (= (and mapNonEmpty!22522 condMapEmpty!22528) mapIsEmpty!22528))

(assert (= (and mapNonEmpty!22522 (not condMapEmpty!22528)) mapNonEmpty!22528))

(assert (= (and mapNonEmpty!22528 ((_ is ValueCellFull!6573) mapValue!22528)) b!483670))

(assert (= (and mapNonEmpty!22522 ((_ is ValueCellFull!6573) mapDefault!22528)) b!483671))

(declare-fun m!464631 () Bool)

(assert (=> mapNonEmpty!22528 m!464631))

(declare-fun b_lambda!10821 () Bool)

(assert (= b_lambda!10819 (or (and start!43650 b_free!12357) b_lambda!10821)))

(check-sat (not bm!31059) (not bm!31042) (not b!483581) (not d!76937) (not b!483528) (not d!76935) (not b!483637) (not bm!31064) (not b!483641) (not b!483661) (not mapNonEmpty!22528) (not bm!31061) (not b!483640) (not d!76919) tp_is_empty!13869 (not b!483649) b_and!21127 (not b_lambda!10821) (not b!483662) (not b!483594) (not bm!31063) (not b!483592) (not b!483653) (not b!483543) (not b!483584) (not b!483639) (not bm!31039) (not d!76917) (not b!483570) (not b!483563) (not b!483585) (not b!483654) (not b_next!12357) (not b!483652) (not d!76913) (not b!483557) (not b!483556) (not bm!31057))
(check-sat b_and!21127 (not b_next!12357))
