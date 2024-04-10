; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34956 () Bool)

(assert start!34956)

(declare-fun b_free!7671 () Bool)

(declare-fun b_next!7671 () Bool)

(assert (=> start!34956 (= b_free!7671 (not b_next!7671))))

(declare-fun tp!26589 () Bool)

(declare-fun b_and!14899 () Bool)

(assert (=> start!34956 (= tp!26589 b_and!14899)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun call!26950 () Bool)

(declare-datatypes ((SeekEntryResult!3437 0))(
  ( (MissingZero!3437 (index!15927 (_ BitVec 32))) (Found!3437 (index!15928 (_ BitVec 32))) (Intermediate!3437 (undefined!4249 Bool) (index!15929 (_ BitVec 32)) (x!34859 (_ BitVec 32))) (Undefined!3437) (MissingVacant!3437 (index!15930 (_ BitVec 32))) )
))
(declare-fun lt!164451 () SeekEntryResult!3437)

(declare-fun c!53368 () Bool)

(declare-fun bm!26947 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!26947 (= call!26950 (inRange!0 (ite c!53368 (index!15927 lt!164451) (index!15930 lt!164451)) mask!2385))))

(declare-fun b!350144 () Bool)

(declare-fun e!214482 () Bool)

(get-info :version)

(assert (=> b!350144 (= e!214482 (not ((_ is Undefined!3437) lt!164451)))))

(declare-fun b!350145 () Bool)

(declare-datatypes ((Unit!10851 0))(
  ( (Unit!10852) )
))
(declare-fun e!214478 () Unit!10851)

(declare-fun Unit!10853 () Unit!10851)

(assert (=> b!350145 (= e!214478 Unit!10853)))

(declare-fun b!350146 () Bool)

(declare-fun res!194050 () Bool)

(declare-fun e!214484 () Bool)

(assert (=> b!350146 (=> res!194050 e!214484)))

(assert (=> b!350146 (= res!194050 (not call!26950))))

(assert (=> b!350146 (= e!214482 e!214484)))

(declare-fun b!350147 () Bool)

(declare-fun res!194048 () Bool)

(declare-fun e!214479 () Bool)

(assert (=> b!350147 (=> (not res!194048) (not e!214479))))

(declare-datatypes ((V!11141 0))(
  ( (V!11142 (val!3856 Int)) )
))
(declare-datatypes ((ValueCell!3468 0))(
  ( (ValueCellFull!3468 (v!6042 V!11141)) (EmptyCell!3468) )
))
(declare-datatypes ((array!18831 0))(
  ( (array!18832 (arr!8922 (Array (_ BitVec 32) ValueCell!3468)) (size!9274 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18831)

(declare-datatypes ((array!18833 0))(
  ( (array!18834 (arr!8923 (Array (_ BitVec 32) (_ BitVec 64))) (size!9275 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18833)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!350147 (= res!194048 (and (= (size!9274 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9275 _keys!1895) (size!9274 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350148 () Bool)

(declare-fun res!194053 () Bool)

(assert (=> b!350148 (=> (not res!194053) (not e!214479))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350148 (= res!194053 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12903 () Bool)

(declare-fun mapRes!12903 () Bool)

(assert (=> mapIsEmpty!12903 mapRes!12903))

(declare-fun b!350149 () Bool)

(declare-fun e!214486 () Bool)

(assert (=> b!350149 (= e!214486 e!214482)))

(declare-fun c!53370 () Bool)

(assert (=> b!350149 (= c!53370 ((_ is MissingVacant!3437) lt!164451))))

(declare-fun mapNonEmpty!12903 () Bool)

(declare-fun tp!26588 () Bool)

(declare-fun e!214481 () Bool)

(assert (=> mapNonEmpty!12903 (= mapRes!12903 (and tp!26588 e!214481))))

(declare-fun mapRest!12903 () (Array (_ BitVec 32) ValueCell!3468))

(declare-fun mapValue!12903 () ValueCell!3468)

(declare-fun mapKey!12903 () (_ BitVec 32))

(assert (=> mapNonEmpty!12903 (= (arr!8922 _values!1525) (store mapRest!12903 mapKey!12903 mapValue!12903))))

(declare-fun b!350150 () Bool)

(assert (=> b!350150 (= e!214484 (not (= (select (arr!8923 _keys!1895) (index!15930 lt!164451)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!350151 () Bool)

(declare-fun res!194052 () Bool)

(assert (=> b!350151 (=> (not res!194052) (not e!214479))))

(declare-datatypes ((List!5190 0))(
  ( (Nil!5187) (Cons!5186 (h!6042 (_ BitVec 64)) (t!10326 List!5190)) )
))
(declare-fun arrayNoDuplicates!0 (array!18833 (_ BitVec 32) List!5190) Bool)

(assert (=> b!350151 (= res!194052 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5187))))

(declare-fun b!350152 () Bool)

(declare-fun Unit!10854 () Unit!10851)

(assert (=> b!350152 (= e!214478 Unit!10854)))

(declare-fun zeroValue!1467 () V!11141)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11141)

(declare-fun lt!164452 () Unit!10851)

(declare-fun lemmaArrayContainsKeyThenInListMap!325 (array!18833 array!18831 (_ BitVec 32) (_ BitVec 32) V!11141 V!11141 (_ BitVec 64) (_ BitVec 32) Int) Unit!10851)

(declare-fun arrayScanForKey!0 (array!18833 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350152 (= lt!164452 (lemmaArrayContainsKeyThenInListMap!325 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!350152 false))

(declare-fun b!350153 () Bool)

(declare-fun e!214488 () Bool)

(declare-fun tp_is_empty!7623 () Bool)

(assert (=> b!350153 (= e!214488 tp_is_empty!7623)))

(declare-fun b!350155 () Bool)

(declare-fun e!214489 () Bool)

(assert (=> b!350155 (= e!214489 (not (= (select (arr!8923 _keys!1895) (index!15927 lt!164451)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!350156 () Bool)

(declare-fun res!194046 () Bool)

(assert (=> b!350156 (=> (not res!194046) (not e!214479))))

(declare-datatypes ((tuple2!5570 0))(
  ( (tuple2!5571 (_1!2796 (_ BitVec 64)) (_2!2796 V!11141)) )
))
(declare-datatypes ((List!5191 0))(
  ( (Nil!5188) (Cons!5187 (h!6043 tuple2!5570) (t!10327 List!5191)) )
))
(declare-datatypes ((ListLongMap!4483 0))(
  ( (ListLongMap!4484 (toList!2257 List!5191)) )
))
(declare-fun contains!2325 (ListLongMap!4483 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1778 (array!18833 array!18831 (_ BitVec 32) (_ BitVec 32) V!11141 V!11141 (_ BitVec 32) Int) ListLongMap!4483)

(assert (=> b!350156 (= res!194046 (not (contains!2325 (getCurrentListMap!1778 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350157 () Bool)

(declare-fun res!194055 () Bool)

(assert (=> b!350157 (=> (not res!194055) (not e!214479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18833 (_ BitVec 32)) Bool)

(assert (=> b!350157 (= res!194055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350158 () Bool)

(declare-fun e!214483 () Bool)

(assert (=> b!350158 (= e!214479 e!214483)))

(declare-fun res!194047 () Bool)

(assert (=> b!350158 (=> (not res!194047) (not e!214483))))

(assert (=> b!350158 (= res!194047 (and (not ((_ is Found!3437) lt!164451)) ((_ is MissingZero!3437) lt!164451)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18833 (_ BitVec 32)) SeekEntryResult!3437)

(assert (=> b!350158 (= lt!164451 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!350159 () Bool)

(declare-fun e!214485 () Bool)

(assert (=> b!350159 (= e!214485 (and e!214488 mapRes!12903))))

(declare-fun condMapEmpty!12903 () Bool)

(declare-fun mapDefault!12903 () ValueCell!3468)

(assert (=> b!350159 (= condMapEmpty!12903 (= (arr!8922 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3468)) mapDefault!12903)))))

(declare-fun b!350160 () Bool)

(declare-fun e!214487 () Bool)

(assert (=> b!350160 (= e!214487 e!214486)))

(assert (=> b!350160 (= c!53368 ((_ is MissingZero!3437) lt!164451))))

(declare-fun b!350161 () Bool)

(assert (=> b!350161 (= e!214483 e!214487)))

(declare-fun res!194049 () Bool)

(assert (=> b!350161 (=> (not res!194049) (not e!214487))))

(declare-fun lt!164450 () Bool)

(assert (=> b!350161 (= res!194049 (not lt!164450))))

(declare-fun lt!164449 () Unit!10851)

(assert (=> b!350161 (= lt!164449 e!214478)))

(declare-fun c!53369 () Bool)

(assert (=> b!350161 (= c!53369 lt!164450)))

(declare-fun arrayContainsKey!0 (array!18833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350161 (= lt!164450 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350162 () Bool)

(assert (=> b!350162 (= e!214486 e!214489)))

(declare-fun res!194051 () Bool)

(assert (=> b!350162 (= res!194051 (not call!26950))))

(assert (=> b!350162 (=> res!194051 e!214489)))

(declare-fun res!194054 () Bool)

(assert (=> start!34956 (=> (not res!194054) (not e!214479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34956 (= res!194054 (validMask!0 mask!2385))))

(assert (=> start!34956 e!214479))

(assert (=> start!34956 true))

(assert (=> start!34956 tp_is_empty!7623))

(assert (=> start!34956 tp!26589))

(declare-fun array_inv!6590 (array!18831) Bool)

(assert (=> start!34956 (and (array_inv!6590 _values!1525) e!214485)))

(declare-fun array_inv!6591 (array!18833) Bool)

(assert (=> start!34956 (array_inv!6591 _keys!1895)))

(declare-fun b!350154 () Bool)

(assert (=> b!350154 (= e!214481 tp_is_empty!7623)))

(assert (= (and start!34956 res!194054) b!350147))

(assert (= (and b!350147 res!194048) b!350157))

(assert (= (and b!350157 res!194055) b!350151))

(assert (= (and b!350151 res!194052) b!350148))

(assert (= (and b!350148 res!194053) b!350156))

(assert (= (and b!350156 res!194046) b!350158))

(assert (= (and b!350158 res!194047) b!350161))

(assert (= (and b!350161 c!53369) b!350152))

(assert (= (and b!350161 (not c!53369)) b!350145))

(assert (= (and b!350161 res!194049) b!350160))

(assert (= (and b!350160 c!53368) b!350162))

(assert (= (and b!350160 (not c!53368)) b!350149))

(assert (= (and b!350162 (not res!194051)) b!350155))

(assert (= (and b!350149 c!53370) b!350146))

(assert (= (and b!350149 (not c!53370)) b!350144))

(assert (= (and b!350146 (not res!194050)) b!350150))

(assert (= (or b!350162 b!350146) bm!26947))

(assert (= (and b!350159 condMapEmpty!12903) mapIsEmpty!12903))

(assert (= (and b!350159 (not condMapEmpty!12903)) mapNonEmpty!12903))

(assert (= (and mapNonEmpty!12903 ((_ is ValueCellFull!3468) mapValue!12903)) b!350154))

(assert (= (and b!350159 ((_ is ValueCellFull!3468) mapDefault!12903)) b!350153))

(assert (= start!34956 b!350159))

(declare-fun m!350427 () Bool)

(assert (=> b!350156 m!350427))

(assert (=> b!350156 m!350427))

(declare-fun m!350429 () Bool)

(assert (=> b!350156 m!350429))

(declare-fun m!350431 () Bool)

(assert (=> b!350152 m!350431))

(assert (=> b!350152 m!350431))

(declare-fun m!350433 () Bool)

(assert (=> b!350152 m!350433))

(declare-fun m!350435 () Bool)

(assert (=> b!350148 m!350435))

(declare-fun m!350437 () Bool)

(assert (=> b!350150 m!350437))

(declare-fun m!350439 () Bool)

(assert (=> start!34956 m!350439))

(declare-fun m!350441 () Bool)

(assert (=> start!34956 m!350441))

(declare-fun m!350443 () Bool)

(assert (=> start!34956 m!350443))

(declare-fun m!350445 () Bool)

(assert (=> b!350158 m!350445))

(declare-fun m!350447 () Bool)

(assert (=> b!350157 m!350447))

(declare-fun m!350449 () Bool)

(assert (=> mapNonEmpty!12903 m!350449))

(declare-fun m!350451 () Bool)

(assert (=> b!350155 m!350451))

(declare-fun m!350453 () Bool)

(assert (=> b!350151 m!350453))

(declare-fun m!350455 () Bool)

(assert (=> bm!26947 m!350455))

(declare-fun m!350457 () Bool)

(assert (=> b!350161 m!350457))

(check-sat (not b!350148) (not mapNonEmpty!12903) (not b!350156) (not b!350152) tp_is_empty!7623 (not b!350157) (not b!350158) b_and!14899 (not start!34956) (not b!350151) (not bm!26947) (not b!350161) (not b_next!7671))
(check-sat b_and!14899 (not b_next!7671))
(get-model)

(declare-fun d!71403 () Bool)

(declare-fun res!194090 () Bool)

(declare-fun e!214530 () Bool)

(assert (=> d!71403 (=> res!194090 e!214530)))

(assert (=> d!71403 (= res!194090 (= (select (arr!8923 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71403 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!214530)))

(declare-fun b!350224 () Bool)

(declare-fun e!214531 () Bool)

(assert (=> b!350224 (= e!214530 e!214531)))

(declare-fun res!194091 () Bool)

(assert (=> b!350224 (=> (not res!194091) (not e!214531))))

(assert (=> b!350224 (= res!194091 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9275 _keys!1895)))))

(declare-fun b!350225 () Bool)

(assert (=> b!350225 (= e!214531 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71403 (not res!194090)) b!350224))

(assert (= (and b!350224 res!194091) b!350225))

(declare-fun m!350491 () Bool)

(assert (=> d!71403 m!350491))

(declare-fun m!350493 () Bool)

(assert (=> b!350225 m!350493))

(assert (=> b!350161 d!71403))

(declare-fun b!350236 () Bool)

(declare-fun e!214542 () Bool)

(declare-fun contains!2327 (List!5190 (_ BitVec 64)) Bool)

(assert (=> b!350236 (= e!214542 (contains!2327 Nil!5187 (select (arr!8923 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!350237 () Bool)

(declare-fun e!214543 () Bool)

(declare-fun e!214541 () Bool)

(assert (=> b!350237 (= e!214543 e!214541)))

(declare-fun res!194098 () Bool)

(assert (=> b!350237 (=> (not res!194098) (not e!214541))))

(assert (=> b!350237 (= res!194098 (not e!214542))))

(declare-fun res!194100 () Bool)

(assert (=> b!350237 (=> (not res!194100) (not e!214542))))

(assert (=> b!350237 (= res!194100 (validKeyInArray!0 (select (arr!8923 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71405 () Bool)

(declare-fun res!194099 () Bool)

(assert (=> d!71405 (=> res!194099 e!214543)))

(assert (=> d!71405 (= res!194099 (bvsge #b00000000000000000000000000000000 (size!9275 _keys!1895)))))

(assert (=> d!71405 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5187) e!214543)))

(declare-fun bm!26953 () Bool)

(declare-fun call!26956 () Bool)

(declare-fun c!53382 () Bool)

(assert (=> bm!26953 (= call!26956 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53382 (Cons!5186 (select (arr!8923 _keys!1895) #b00000000000000000000000000000000) Nil!5187) Nil!5187)))))

(declare-fun b!350238 () Bool)

(declare-fun e!214540 () Bool)

(assert (=> b!350238 (= e!214540 call!26956)))

(declare-fun b!350239 () Bool)

(assert (=> b!350239 (= e!214541 e!214540)))

(assert (=> b!350239 (= c!53382 (validKeyInArray!0 (select (arr!8923 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!350240 () Bool)

(assert (=> b!350240 (= e!214540 call!26956)))

(assert (= (and d!71405 (not res!194099)) b!350237))

(assert (= (and b!350237 res!194100) b!350236))

(assert (= (and b!350237 res!194098) b!350239))

(assert (= (and b!350239 c!53382) b!350240))

(assert (= (and b!350239 (not c!53382)) b!350238))

(assert (= (or b!350240 b!350238) bm!26953))

(assert (=> b!350236 m!350491))

(assert (=> b!350236 m!350491))

(declare-fun m!350495 () Bool)

(assert (=> b!350236 m!350495))

(assert (=> b!350237 m!350491))

(assert (=> b!350237 m!350491))

(declare-fun m!350497 () Bool)

(assert (=> b!350237 m!350497))

(assert (=> bm!26953 m!350491))

(declare-fun m!350499 () Bool)

(assert (=> bm!26953 m!350499))

(assert (=> b!350239 m!350491))

(assert (=> b!350239 m!350491))

(assert (=> b!350239 m!350497))

(assert (=> b!350151 d!71405))

(declare-fun d!71407 () Bool)

(declare-fun e!214549 () Bool)

(assert (=> d!71407 e!214549))

(declare-fun res!194103 () Bool)

(assert (=> d!71407 (=> res!194103 e!214549)))

(declare-fun lt!164473 () Bool)

(assert (=> d!71407 (= res!194103 (not lt!164473))))

(declare-fun lt!164474 () Bool)

(assert (=> d!71407 (= lt!164473 lt!164474)))

(declare-fun lt!164476 () Unit!10851)

(declare-fun e!214548 () Unit!10851)

(assert (=> d!71407 (= lt!164476 e!214548)))

(declare-fun c!53385 () Bool)

(assert (=> d!71407 (= c!53385 lt!164474)))

(declare-fun containsKey!340 (List!5191 (_ BitVec 64)) Bool)

(assert (=> d!71407 (= lt!164474 (containsKey!340 (toList!2257 (getCurrentListMap!1778 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71407 (= (contains!2325 (getCurrentListMap!1778 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!164473)))

(declare-fun b!350247 () Bool)

(declare-fun lt!164475 () Unit!10851)

(assert (=> b!350247 (= e!214548 lt!164475)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!288 (List!5191 (_ BitVec 64)) Unit!10851)

(assert (=> b!350247 (= lt!164475 (lemmaContainsKeyImpliesGetValueByKeyDefined!288 (toList!2257 (getCurrentListMap!1778 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!354 0))(
  ( (Some!353 (v!6044 V!11141)) (None!352) )
))
(declare-fun isDefined!289 (Option!354) Bool)

(declare-fun getValueByKey!348 (List!5191 (_ BitVec 64)) Option!354)

(assert (=> b!350247 (isDefined!289 (getValueByKey!348 (toList!2257 (getCurrentListMap!1778 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!350248 () Bool)

(declare-fun Unit!10858 () Unit!10851)

(assert (=> b!350248 (= e!214548 Unit!10858)))

(declare-fun b!350249 () Bool)

(assert (=> b!350249 (= e!214549 (isDefined!289 (getValueByKey!348 (toList!2257 (getCurrentListMap!1778 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71407 c!53385) b!350247))

(assert (= (and d!71407 (not c!53385)) b!350248))

(assert (= (and d!71407 (not res!194103)) b!350249))

(declare-fun m!350501 () Bool)

(assert (=> d!71407 m!350501))

(declare-fun m!350503 () Bool)

(assert (=> b!350247 m!350503))

(declare-fun m!350505 () Bool)

(assert (=> b!350247 m!350505))

(assert (=> b!350247 m!350505))

(declare-fun m!350507 () Bool)

(assert (=> b!350247 m!350507))

(assert (=> b!350249 m!350505))

(assert (=> b!350249 m!350505))

(assert (=> b!350249 m!350507))

(assert (=> b!350156 d!71407))

(declare-fun b!350292 () Bool)

(declare-fun e!214577 () Bool)

(declare-fun lt!164532 () ListLongMap!4483)

(declare-fun apply!290 (ListLongMap!4483 (_ BitVec 64)) V!11141)

(declare-fun get!4776 (ValueCell!3468 V!11141) V!11141)

(declare-fun dynLambda!633 (Int (_ BitVec 64)) V!11141)

(assert (=> b!350292 (= e!214577 (= (apply!290 lt!164532 (select (arr!8923 _keys!1895) #b00000000000000000000000000000000)) (get!4776 (select (arr!8922 _values!1525) #b00000000000000000000000000000000) (dynLambda!633 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!350292 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9274 _values!1525)))))

(assert (=> b!350292 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9275 _keys!1895)))))

(declare-fun b!350293 () Bool)

(declare-fun e!214588 () Bool)

(assert (=> b!350293 (= e!214588 (= (apply!290 lt!164532 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!26968 () Bool)

(declare-fun call!26977 () Bool)

(assert (=> bm!26968 (= call!26977 (contains!2325 lt!164532 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26969 () Bool)

(declare-fun call!26976 () ListLongMap!4483)

(declare-fun call!26972 () ListLongMap!4483)

(assert (=> bm!26969 (= call!26976 call!26972)))

(declare-fun b!350295 () Bool)

(declare-fun e!214587 () Bool)

(declare-fun e!214584 () Bool)

(assert (=> b!350295 (= e!214587 e!214584)))

(declare-fun res!194126 () Bool)

(assert (=> b!350295 (= res!194126 call!26977)))

(assert (=> b!350295 (=> (not res!194126) (not e!214584))))

(declare-fun bm!26970 () Bool)

(declare-fun call!26973 () ListLongMap!4483)

(declare-fun call!26971 () ListLongMap!4483)

(assert (=> bm!26970 (= call!26973 call!26971)))

(declare-fun b!350296 () Bool)

(declare-fun e!214582 () Bool)

(declare-fun call!26974 () Bool)

(assert (=> b!350296 (= e!214582 (not call!26974))))

(declare-fun b!350297 () Bool)

(declare-fun e!214581 () Bool)

(assert (=> b!350297 (= e!214581 (validKeyInArray!0 (select (arr!8923 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26971 () Bool)

(declare-fun call!26975 () ListLongMap!4483)

(declare-fun getCurrentListMapNoExtraKeys!612 (array!18833 array!18831 (_ BitVec 32) (_ BitVec 32) V!11141 V!11141 (_ BitVec 32) Int) ListLongMap!4483)

(assert (=> bm!26971 (= call!26975 (getCurrentListMapNoExtraKeys!612 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!350298 () Bool)

(declare-fun e!214585 () Unit!10851)

(declare-fun Unit!10859 () Unit!10851)

(assert (=> b!350298 (= e!214585 Unit!10859)))

(declare-fun b!350299 () Bool)

(declare-fun res!194123 () Bool)

(declare-fun e!214583 () Bool)

(assert (=> b!350299 (=> (not res!194123) (not e!214583))))

(declare-fun e!214576 () Bool)

(assert (=> b!350299 (= res!194123 e!214576)))

(declare-fun res!194125 () Bool)

(assert (=> b!350299 (=> res!194125 e!214576)))

(assert (=> b!350299 (= res!194125 (not e!214581))))

(declare-fun res!194122 () Bool)

(assert (=> b!350299 (=> (not res!194122) (not e!214581))))

(assert (=> b!350299 (= res!194122 (bvslt #b00000000000000000000000000000000 (size!9275 _keys!1895)))))

(declare-fun b!350300 () Bool)

(declare-fun e!214579 () ListLongMap!4483)

(declare-fun +!739 (ListLongMap!4483 tuple2!5570) ListLongMap!4483)

(assert (=> b!350300 (= e!214579 (+!739 call!26972 (tuple2!5571 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!350301 () Bool)

(declare-fun res!194127 () Bool)

(assert (=> b!350301 (=> (not res!194127) (not e!214583))))

(assert (=> b!350301 (= res!194127 e!214587)))

(declare-fun c!53400 () Bool)

(assert (=> b!350301 (= c!53400 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!350302 () Bool)

(declare-fun e!214586 () ListLongMap!4483)

(assert (=> b!350302 (= e!214586 call!26976)))

(declare-fun bm!26972 () Bool)

(assert (=> bm!26972 (= call!26974 (contains!2325 lt!164532 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!350303 () Bool)

(assert (=> b!350303 (= e!214579 e!214586)))

(declare-fun c!53401 () Bool)

(assert (=> b!350303 (= c!53401 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!350304 () Bool)

(declare-fun c!53398 () Bool)

(assert (=> b!350304 (= c!53398 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!214580 () ListLongMap!4483)

(assert (=> b!350304 (= e!214586 e!214580)))

(declare-fun b!350305 () Bool)

(assert (=> b!350305 (= e!214580 call!26976)))

(declare-fun b!350306 () Bool)

(assert (=> b!350306 (= e!214583 e!214582)))

(declare-fun c!53402 () Bool)

(assert (=> b!350306 (= c!53402 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!53399 () Bool)

(declare-fun bm!26973 () Bool)

(assert (=> bm!26973 (= call!26972 (+!739 (ite c!53399 call!26975 (ite c!53401 call!26971 call!26973)) (ite (or c!53399 c!53401) (tuple2!5571 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5571 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26974 () Bool)

(assert (=> bm!26974 (= call!26971 call!26975)))

(declare-fun b!350294 () Bool)

(assert (=> b!350294 (= e!214584 (= (apply!290 lt!164532 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun d!71409 () Bool)

(assert (=> d!71409 e!214583))

(declare-fun res!194128 () Bool)

(assert (=> d!71409 (=> (not res!194128) (not e!214583))))

(assert (=> d!71409 (= res!194128 (or (bvsge #b00000000000000000000000000000000 (size!9275 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9275 _keys!1895)))))))

(declare-fun lt!164535 () ListLongMap!4483)

(assert (=> d!71409 (= lt!164532 lt!164535)))

(declare-fun lt!164533 () Unit!10851)

(assert (=> d!71409 (= lt!164533 e!214585)))

(declare-fun c!53403 () Bool)

(declare-fun e!214578 () Bool)

(assert (=> d!71409 (= c!53403 e!214578)))

(declare-fun res!194129 () Bool)

(assert (=> d!71409 (=> (not res!194129) (not e!214578))))

(assert (=> d!71409 (= res!194129 (bvslt #b00000000000000000000000000000000 (size!9275 _keys!1895)))))

(assert (=> d!71409 (= lt!164535 e!214579)))

(assert (=> d!71409 (= c!53399 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71409 (validMask!0 mask!2385)))

(assert (=> d!71409 (= (getCurrentListMap!1778 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!164532)))

(declare-fun b!350307 () Bool)

(assert (=> b!350307 (= e!214582 e!214588)))

(declare-fun res!194130 () Bool)

(assert (=> b!350307 (= res!194130 call!26974)))

(assert (=> b!350307 (=> (not res!194130) (not e!214588))))

(declare-fun b!350308 () Bool)

(declare-fun lt!164542 () Unit!10851)

(assert (=> b!350308 (= e!214585 lt!164542)))

(declare-fun lt!164529 () ListLongMap!4483)

(assert (=> b!350308 (= lt!164529 (getCurrentListMapNoExtraKeys!612 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164522 () (_ BitVec 64))

(assert (=> b!350308 (= lt!164522 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164524 () (_ BitVec 64))

(assert (=> b!350308 (= lt!164524 (select (arr!8923 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164536 () Unit!10851)

(declare-fun addStillContains!266 (ListLongMap!4483 (_ BitVec 64) V!11141 (_ BitVec 64)) Unit!10851)

(assert (=> b!350308 (= lt!164536 (addStillContains!266 lt!164529 lt!164522 zeroValue!1467 lt!164524))))

(assert (=> b!350308 (contains!2325 (+!739 lt!164529 (tuple2!5571 lt!164522 zeroValue!1467)) lt!164524)))

(declare-fun lt!164523 () Unit!10851)

(assert (=> b!350308 (= lt!164523 lt!164536)))

(declare-fun lt!164539 () ListLongMap!4483)

(assert (=> b!350308 (= lt!164539 (getCurrentListMapNoExtraKeys!612 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164541 () (_ BitVec 64))

(assert (=> b!350308 (= lt!164541 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164525 () (_ BitVec 64))

(assert (=> b!350308 (= lt!164525 (select (arr!8923 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164540 () Unit!10851)

(declare-fun addApplyDifferent!266 (ListLongMap!4483 (_ BitVec 64) V!11141 (_ BitVec 64)) Unit!10851)

(assert (=> b!350308 (= lt!164540 (addApplyDifferent!266 lt!164539 lt!164541 minValue!1467 lt!164525))))

(assert (=> b!350308 (= (apply!290 (+!739 lt!164539 (tuple2!5571 lt!164541 minValue!1467)) lt!164525) (apply!290 lt!164539 lt!164525))))

(declare-fun lt!164531 () Unit!10851)

(assert (=> b!350308 (= lt!164531 lt!164540)))

(declare-fun lt!164537 () ListLongMap!4483)

(assert (=> b!350308 (= lt!164537 (getCurrentListMapNoExtraKeys!612 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164528 () (_ BitVec 64))

(assert (=> b!350308 (= lt!164528 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164538 () (_ BitVec 64))

(assert (=> b!350308 (= lt!164538 (select (arr!8923 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164534 () Unit!10851)

(assert (=> b!350308 (= lt!164534 (addApplyDifferent!266 lt!164537 lt!164528 zeroValue!1467 lt!164538))))

(assert (=> b!350308 (= (apply!290 (+!739 lt!164537 (tuple2!5571 lt!164528 zeroValue!1467)) lt!164538) (apply!290 lt!164537 lt!164538))))

(declare-fun lt!164521 () Unit!10851)

(assert (=> b!350308 (= lt!164521 lt!164534)))

(declare-fun lt!164527 () ListLongMap!4483)

(assert (=> b!350308 (= lt!164527 (getCurrentListMapNoExtraKeys!612 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164526 () (_ BitVec 64))

(assert (=> b!350308 (= lt!164526 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164530 () (_ BitVec 64))

(assert (=> b!350308 (= lt!164530 (select (arr!8923 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!350308 (= lt!164542 (addApplyDifferent!266 lt!164527 lt!164526 minValue!1467 lt!164530))))

(assert (=> b!350308 (= (apply!290 (+!739 lt!164527 (tuple2!5571 lt!164526 minValue!1467)) lt!164530) (apply!290 lt!164527 lt!164530))))

(declare-fun b!350309 () Bool)

(assert (=> b!350309 (= e!214580 call!26973)))

(declare-fun b!350310 () Bool)

(assert (=> b!350310 (= e!214576 e!214577)))

(declare-fun res!194124 () Bool)

(assert (=> b!350310 (=> (not res!194124) (not e!214577))))

(assert (=> b!350310 (= res!194124 (contains!2325 lt!164532 (select (arr!8923 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!350310 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9275 _keys!1895)))))

(declare-fun b!350311 () Bool)

(assert (=> b!350311 (= e!214578 (validKeyInArray!0 (select (arr!8923 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!350312 () Bool)

(assert (=> b!350312 (= e!214587 (not call!26977))))

(assert (= (and d!71409 c!53399) b!350300))

(assert (= (and d!71409 (not c!53399)) b!350303))

(assert (= (and b!350303 c!53401) b!350302))

(assert (= (and b!350303 (not c!53401)) b!350304))

(assert (= (and b!350304 c!53398) b!350305))

(assert (= (and b!350304 (not c!53398)) b!350309))

(assert (= (or b!350305 b!350309) bm!26970))

(assert (= (or b!350302 bm!26970) bm!26974))

(assert (= (or b!350302 b!350305) bm!26969))

(assert (= (or b!350300 bm!26974) bm!26971))

(assert (= (or b!350300 bm!26969) bm!26973))

(assert (= (and d!71409 res!194129) b!350311))

(assert (= (and d!71409 c!53403) b!350308))

(assert (= (and d!71409 (not c!53403)) b!350298))

(assert (= (and d!71409 res!194128) b!350299))

(assert (= (and b!350299 res!194122) b!350297))

(assert (= (and b!350299 (not res!194125)) b!350310))

(assert (= (and b!350310 res!194124) b!350292))

(assert (= (and b!350299 res!194123) b!350301))

(assert (= (and b!350301 c!53400) b!350295))

(assert (= (and b!350301 (not c!53400)) b!350312))

(assert (= (and b!350295 res!194126) b!350294))

(assert (= (or b!350295 b!350312) bm!26968))

(assert (= (and b!350301 res!194127) b!350306))

(assert (= (and b!350306 c!53402) b!350307))

(assert (= (and b!350306 (not c!53402)) b!350296))

(assert (= (and b!350307 res!194130) b!350293))

(assert (= (or b!350307 b!350296) bm!26972))

(declare-fun b_lambda!8499 () Bool)

(assert (=> (not b_lambda!8499) (not b!350292)))

(declare-fun t!10330 () Bool)

(declare-fun tb!3095 () Bool)

(assert (=> (and start!34956 (= defaultEntry!1528 defaultEntry!1528) t!10330) tb!3095))

(declare-fun result!5615 () Bool)

(assert (=> tb!3095 (= result!5615 tp_is_empty!7623)))

(assert (=> b!350292 t!10330))

(declare-fun b_and!14903 () Bool)

(assert (= b_and!14899 (and (=> t!10330 result!5615) b_and!14903)))

(assert (=> d!71409 m!350439))

(assert (=> b!350310 m!350491))

(assert (=> b!350310 m!350491))

(declare-fun m!350509 () Bool)

(assert (=> b!350310 m!350509))

(assert (=> b!350297 m!350491))

(assert (=> b!350297 m!350491))

(assert (=> b!350297 m!350497))

(declare-fun m!350511 () Bool)

(assert (=> bm!26973 m!350511))

(assert (=> b!350311 m!350491))

(assert (=> b!350311 m!350491))

(assert (=> b!350311 m!350497))

(declare-fun m!350513 () Bool)

(assert (=> b!350308 m!350513))

(declare-fun m!350515 () Bool)

(assert (=> b!350308 m!350515))

(declare-fun m!350517 () Bool)

(assert (=> b!350308 m!350517))

(assert (=> b!350308 m!350513))

(declare-fun m!350519 () Bool)

(assert (=> b!350308 m!350519))

(declare-fun m!350521 () Bool)

(assert (=> b!350308 m!350521))

(declare-fun m!350523 () Bool)

(assert (=> b!350308 m!350523))

(declare-fun m!350525 () Bool)

(assert (=> b!350308 m!350525))

(assert (=> b!350308 m!350521))

(declare-fun m!350527 () Bool)

(assert (=> b!350308 m!350527))

(declare-fun m!350529 () Bool)

(assert (=> b!350308 m!350529))

(declare-fun m!350531 () Bool)

(assert (=> b!350308 m!350531))

(declare-fun m!350533 () Bool)

(assert (=> b!350308 m!350533))

(declare-fun m!350535 () Bool)

(assert (=> b!350308 m!350535))

(declare-fun m!350537 () Bool)

(assert (=> b!350308 m!350537))

(assert (=> b!350308 m!350491))

(assert (=> b!350308 m!350517))

(declare-fun m!350539 () Bool)

(assert (=> b!350308 m!350539))

(declare-fun m!350541 () Bool)

(assert (=> b!350308 m!350541))

(declare-fun m!350543 () Bool)

(assert (=> b!350308 m!350543))

(assert (=> b!350308 m!350523))

(declare-fun m!350545 () Bool)

(assert (=> b!350293 m!350545))

(declare-fun m!350547 () Bool)

(assert (=> b!350294 m!350547))

(declare-fun m!350549 () Bool)

(assert (=> b!350292 m!350549))

(declare-fun m!350551 () Bool)

(assert (=> b!350292 m!350551))

(declare-fun m!350553 () Bool)

(assert (=> b!350292 m!350553))

(assert (=> b!350292 m!350491))

(declare-fun m!350555 () Bool)

(assert (=> b!350292 m!350555))

(assert (=> b!350292 m!350491))

(assert (=> b!350292 m!350551))

(assert (=> b!350292 m!350549))

(assert (=> bm!26971 m!350519))

(declare-fun m!350557 () Bool)

(assert (=> bm!26968 m!350557))

(declare-fun m!350559 () Bool)

(assert (=> bm!26972 m!350559))

(declare-fun m!350561 () Bool)

(assert (=> b!350300 m!350561))

(assert (=> b!350156 d!71409))

(declare-fun d!71411 () Bool)

(assert (=> d!71411 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34956 d!71411))

(declare-fun d!71413 () Bool)

(assert (=> d!71413 (= (array_inv!6590 _values!1525) (bvsge (size!9274 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34956 d!71413))

(declare-fun d!71415 () Bool)

(assert (=> d!71415 (= (array_inv!6591 _keys!1895) (bvsge (size!9275 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34956 d!71415))

(declare-fun d!71417 () Bool)

(declare-fun lt!164550 () SeekEntryResult!3437)

(assert (=> d!71417 (and (or ((_ is Undefined!3437) lt!164550) (not ((_ is Found!3437) lt!164550)) (and (bvsge (index!15928 lt!164550) #b00000000000000000000000000000000) (bvslt (index!15928 lt!164550) (size!9275 _keys!1895)))) (or ((_ is Undefined!3437) lt!164550) ((_ is Found!3437) lt!164550) (not ((_ is MissingZero!3437) lt!164550)) (and (bvsge (index!15927 lt!164550) #b00000000000000000000000000000000) (bvslt (index!15927 lt!164550) (size!9275 _keys!1895)))) (or ((_ is Undefined!3437) lt!164550) ((_ is Found!3437) lt!164550) ((_ is MissingZero!3437) lt!164550) (not ((_ is MissingVacant!3437) lt!164550)) (and (bvsge (index!15930 lt!164550) #b00000000000000000000000000000000) (bvslt (index!15930 lt!164550) (size!9275 _keys!1895)))) (or ((_ is Undefined!3437) lt!164550) (ite ((_ is Found!3437) lt!164550) (= (select (arr!8923 _keys!1895) (index!15928 lt!164550)) k0!1348) (ite ((_ is MissingZero!3437) lt!164550) (= (select (arr!8923 _keys!1895) (index!15927 lt!164550)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3437) lt!164550) (= (select (arr!8923 _keys!1895) (index!15930 lt!164550)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!214596 () SeekEntryResult!3437)

(assert (=> d!71417 (= lt!164550 e!214596)))

(declare-fun c!53412 () Bool)

(declare-fun lt!164551 () SeekEntryResult!3437)

(assert (=> d!71417 (= c!53412 (and ((_ is Intermediate!3437) lt!164551) (undefined!4249 lt!164551)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18833 (_ BitVec 32)) SeekEntryResult!3437)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71417 (= lt!164551 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71417 (validMask!0 mask!2385)))

(assert (=> d!71417 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!164550)))

(declare-fun b!350327 () Bool)

(declare-fun e!214595 () SeekEntryResult!3437)

(assert (=> b!350327 (= e!214595 (Found!3437 (index!15929 lt!164551)))))

(declare-fun b!350328 () Bool)

(declare-fun e!214597 () SeekEntryResult!3437)

(assert (=> b!350328 (= e!214597 (MissingZero!3437 (index!15929 lt!164551)))))

(declare-fun b!350329 () Bool)

(assert (=> b!350329 (= e!214596 e!214595)))

(declare-fun lt!164549 () (_ BitVec 64))

(assert (=> b!350329 (= lt!164549 (select (arr!8923 _keys!1895) (index!15929 lt!164551)))))

(declare-fun c!53411 () Bool)

(assert (=> b!350329 (= c!53411 (= lt!164549 k0!1348))))

(declare-fun b!350330 () Bool)

(assert (=> b!350330 (= e!214596 Undefined!3437)))

(declare-fun b!350331 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18833 (_ BitVec 32)) SeekEntryResult!3437)

(assert (=> b!350331 (= e!214597 (seekKeyOrZeroReturnVacant!0 (x!34859 lt!164551) (index!15929 lt!164551) (index!15929 lt!164551) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!350332 () Bool)

(declare-fun c!53410 () Bool)

(assert (=> b!350332 (= c!53410 (= lt!164549 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!350332 (= e!214595 e!214597)))

(assert (= (and d!71417 c!53412) b!350330))

(assert (= (and d!71417 (not c!53412)) b!350329))

(assert (= (and b!350329 c!53411) b!350327))

(assert (= (and b!350329 (not c!53411)) b!350332))

(assert (= (and b!350332 c!53410) b!350328))

(assert (= (and b!350332 (not c!53410)) b!350331))

(declare-fun m!350563 () Bool)

(assert (=> d!71417 m!350563))

(declare-fun m!350565 () Bool)

(assert (=> d!71417 m!350565))

(assert (=> d!71417 m!350563))

(declare-fun m!350567 () Bool)

(assert (=> d!71417 m!350567))

(declare-fun m!350569 () Bool)

(assert (=> d!71417 m!350569))

(declare-fun m!350571 () Bool)

(assert (=> d!71417 m!350571))

(assert (=> d!71417 m!350439))

(declare-fun m!350573 () Bool)

(assert (=> b!350329 m!350573))

(declare-fun m!350575 () Bool)

(assert (=> b!350331 m!350575))

(assert (=> b!350158 d!71417))

(declare-fun d!71419 () Bool)

(assert (=> d!71419 (= (inRange!0 (ite c!53368 (index!15927 lt!164451) (index!15930 lt!164451)) mask!2385) (and (bvsge (ite c!53368 (index!15927 lt!164451) (index!15930 lt!164451)) #b00000000000000000000000000000000) (bvslt (ite c!53368 (index!15927 lt!164451) (index!15930 lt!164451)) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> bm!26947 d!71419))

(declare-fun b!350341 () Bool)

(declare-fun e!214605 () Bool)

(declare-fun e!214604 () Bool)

(assert (=> b!350341 (= e!214605 e!214604)))

(declare-fun lt!164560 () (_ BitVec 64))

(assert (=> b!350341 (= lt!164560 (select (arr!8923 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164558 () Unit!10851)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18833 (_ BitVec 64) (_ BitVec 32)) Unit!10851)

(assert (=> b!350341 (= lt!164558 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!164560 #b00000000000000000000000000000000))))

(assert (=> b!350341 (arrayContainsKey!0 _keys!1895 lt!164560 #b00000000000000000000000000000000)))

(declare-fun lt!164559 () Unit!10851)

(assert (=> b!350341 (= lt!164559 lt!164558)))

(declare-fun res!194136 () Bool)

(assert (=> b!350341 (= res!194136 (= (seekEntryOrOpen!0 (select (arr!8923 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3437 #b00000000000000000000000000000000)))))

(assert (=> b!350341 (=> (not res!194136) (not e!214604))))

(declare-fun b!350342 () Bool)

(declare-fun call!26980 () Bool)

(assert (=> b!350342 (= e!214605 call!26980)))

(declare-fun b!350343 () Bool)

(declare-fun e!214606 () Bool)

(assert (=> b!350343 (= e!214606 e!214605)))

(declare-fun c!53415 () Bool)

(assert (=> b!350343 (= c!53415 (validKeyInArray!0 (select (arr!8923 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!350344 () Bool)

(assert (=> b!350344 (= e!214604 call!26980)))

(declare-fun bm!26977 () Bool)

(assert (=> bm!26977 (= call!26980 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!71421 () Bool)

(declare-fun res!194135 () Bool)

(assert (=> d!71421 (=> res!194135 e!214606)))

(assert (=> d!71421 (= res!194135 (bvsge #b00000000000000000000000000000000 (size!9275 _keys!1895)))))

(assert (=> d!71421 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!214606)))

(assert (= (and d!71421 (not res!194135)) b!350343))

(assert (= (and b!350343 c!53415) b!350341))

(assert (= (and b!350343 (not c!53415)) b!350342))

(assert (= (and b!350341 res!194136) b!350344))

(assert (= (or b!350344 b!350342) bm!26977))

(assert (=> b!350341 m!350491))

(declare-fun m!350577 () Bool)

(assert (=> b!350341 m!350577))

(declare-fun m!350579 () Bool)

(assert (=> b!350341 m!350579))

(assert (=> b!350341 m!350491))

(declare-fun m!350581 () Bool)

(assert (=> b!350341 m!350581))

(assert (=> b!350343 m!350491))

(assert (=> b!350343 m!350491))

(assert (=> b!350343 m!350497))

(declare-fun m!350583 () Bool)

(assert (=> bm!26977 m!350583))

(assert (=> b!350157 d!71421))

(declare-fun d!71423 () Bool)

(assert (=> d!71423 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!350148 d!71423))

(declare-fun d!71425 () Bool)

(assert (=> d!71425 (contains!2325 (getCurrentListMap!1778 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!164563 () Unit!10851)

(declare-fun choose!1307 (array!18833 array!18831 (_ BitVec 32) (_ BitVec 32) V!11141 V!11141 (_ BitVec 64) (_ BitVec 32) Int) Unit!10851)

(assert (=> d!71425 (= lt!164563 (choose!1307 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!71425 (validMask!0 mask!2385)))

(assert (=> d!71425 (= (lemmaArrayContainsKeyThenInListMap!325 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!164563)))

(declare-fun bs!11940 () Bool)

(assert (= bs!11940 d!71425))

(assert (=> bs!11940 m!350427))

(assert (=> bs!11940 m!350427))

(assert (=> bs!11940 m!350429))

(assert (=> bs!11940 m!350431))

(declare-fun m!350585 () Bool)

(assert (=> bs!11940 m!350585))

(assert (=> bs!11940 m!350439))

(assert (=> b!350152 d!71425))

(declare-fun d!71427 () Bool)

(declare-fun lt!164566 () (_ BitVec 32))

(assert (=> d!71427 (and (or (bvslt lt!164566 #b00000000000000000000000000000000) (bvsge lt!164566 (size!9275 _keys!1895)) (and (bvsge lt!164566 #b00000000000000000000000000000000) (bvslt lt!164566 (size!9275 _keys!1895)))) (bvsge lt!164566 #b00000000000000000000000000000000) (bvslt lt!164566 (size!9275 _keys!1895)) (= (select (arr!8923 _keys!1895) lt!164566) k0!1348))))

(declare-fun e!214609 () (_ BitVec 32))

(assert (=> d!71427 (= lt!164566 e!214609)))

(declare-fun c!53418 () Bool)

(assert (=> d!71427 (= c!53418 (= (select (arr!8923 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71427 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9275 _keys!1895)) (bvslt (size!9275 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71427 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!164566)))

(declare-fun b!350349 () Bool)

(assert (=> b!350349 (= e!214609 #b00000000000000000000000000000000)))

(declare-fun b!350350 () Bool)

(assert (=> b!350350 (= e!214609 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71427 c!53418) b!350349))

(assert (= (and d!71427 (not c!53418)) b!350350))

(declare-fun m!350587 () Bool)

(assert (=> d!71427 m!350587))

(assert (=> d!71427 m!350491))

(declare-fun m!350589 () Bool)

(assert (=> b!350350 m!350589))

(assert (=> b!350152 d!71427))

(declare-fun mapNonEmpty!12909 () Bool)

(declare-fun mapRes!12909 () Bool)

(declare-fun tp!26598 () Bool)

(declare-fun e!214615 () Bool)

(assert (=> mapNonEmpty!12909 (= mapRes!12909 (and tp!26598 e!214615))))

(declare-fun mapKey!12909 () (_ BitVec 32))

(declare-fun mapValue!12909 () ValueCell!3468)

(declare-fun mapRest!12909 () (Array (_ BitVec 32) ValueCell!3468))

(assert (=> mapNonEmpty!12909 (= mapRest!12903 (store mapRest!12909 mapKey!12909 mapValue!12909))))

(declare-fun b!350358 () Bool)

(declare-fun e!214614 () Bool)

(assert (=> b!350358 (= e!214614 tp_is_empty!7623)))

(declare-fun mapIsEmpty!12909 () Bool)

(assert (=> mapIsEmpty!12909 mapRes!12909))

(declare-fun condMapEmpty!12909 () Bool)

(declare-fun mapDefault!12909 () ValueCell!3468)

(assert (=> mapNonEmpty!12903 (= condMapEmpty!12909 (= mapRest!12903 ((as const (Array (_ BitVec 32) ValueCell!3468)) mapDefault!12909)))))

(assert (=> mapNonEmpty!12903 (= tp!26588 (and e!214614 mapRes!12909))))

(declare-fun b!350357 () Bool)

(assert (=> b!350357 (= e!214615 tp_is_empty!7623)))

(assert (= (and mapNonEmpty!12903 condMapEmpty!12909) mapIsEmpty!12909))

(assert (= (and mapNonEmpty!12903 (not condMapEmpty!12909)) mapNonEmpty!12909))

(assert (= (and mapNonEmpty!12909 ((_ is ValueCellFull!3468) mapValue!12909)) b!350357))

(assert (= (and mapNonEmpty!12903 ((_ is ValueCellFull!3468) mapDefault!12909)) b!350358))

(declare-fun m!350591 () Bool)

(assert (=> mapNonEmpty!12909 m!350591))

(declare-fun b_lambda!8501 () Bool)

(assert (= b_lambda!8499 (or (and start!34956 b_free!7671) b_lambda!8501)))

(check-sat (not mapNonEmpty!12909) (not b!350293) (not bm!26972) (not bm!26968) (not b!350331) (not b!350294) (not b!350297) (not b!350341) (not b!350310) (not b!350247) (not b_next!7671) (not bm!26971) (not b!350308) (not b!350239) (not b!350311) (not b_lambda!8501) (not b!350237) (not b!350292) (not bm!26953) (not d!71409) tp_is_empty!7623 (not b!350350) (not b!350225) (not d!71407) (not d!71425) (not bm!26977) (not b!350236) (not bm!26973) (not b!350343) (not b!350249) (not d!71417) (not b!350300) b_and!14903)
(check-sat b_and!14903 (not b_next!7671))
