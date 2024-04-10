; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33560 () Bool)

(assert start!33560)

(declare-fun b_free!6831 () Bool)

(declare-fun b_next!6831 () Bool)

(assert (=> start!33560 (= b_free!6831 (not b_next!6831))))

(declare-fun tp!23990 () Bool)

(declare-fun b_and!14007 () Bool)

(assert (=> start!33560 (= tp!23990 b_and!14007)))

(declare-fun b!333060 () Bool)

(declare-fun res!183495 () Bool)

(declare-fun e!204518 () Bool)

(assert (=> b!333060 (=> (not res!183495) (not e!204518))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333060 (= res!183495 (validKeyInArray!0 k0!1348))))

(declare-fun b!333061 () Bool)

(declare-fun res!183497 () Bool)

(assert (=> b!333061 (=> (not res!183497) (not e!204518))))

(declare-datatypes ((array!17161 0))(
  ( (array!17162 (arr!8113 (Array (_ BitVec 32) (_ BitVec 64))) (size!8465 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17161)

(declare-datatypes ((List!4617 0))(
  ( (Nil!4614) (Cons!4613 (h!5469 (_ BitVec 64)) (t!9701 List!4617)) )
))
(declare-fun arrayNoDuplicates!0 (array!17161 (_ BitVec 32) List!4617) Bool)

(assert (=> b!333061 (= res!183497 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4614))))

(declare-datatypes ((SeekEntryResult!3134 0))(
  ( (MissingZero!3134 (index!14715 (_ BitVec 32))) (Found!3134 (index!14716 (_ BitVec 32))) (Intermediate!3134 (undefined!3946 Bool) (index!14717 (_ BitVec 32)) (x!33176 (_ BitVec 32))) (Undefined!3134) (MissingVacant!3134 (index!14718 (_ BitVec 32))) )
))
(declare-fun lt!159157 () SeekEntryResult!3134)

(declare-fun b!333062 () Bool)

(get-info :version)

(assert (=> b!333062 (= e!204518 (and ((_ is Found!3134) lt!159157) (= (select (arr!8113 _keys!1895) (index!14716 lt!159157)) k0!1348) (bvsge (index!14716 lt!159157) #b00000000000000000000000000000000) (bvsge (index!14716 lt!159157) (size!8465 _keys!1895))))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17161 (_ BitVec 32)) SeekEntryResult!3134)

(assert (=> b!333062 (= lt!159157 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333063 () Bool)

(declare-fun e!204519 () Bool)

(declare-fun e!204517 () Bool)

(declare-fun mapRes!11565 () Bool)

(assert (=> b!333063 (= e!204519 (and e!204517 mapRes!11565))))

(declare-fun condMapEmpty!11565 () Bool)

(declare-datatypes ((V!10021 0))(
  ( (V!10022 (val!3436 Int)) )
))
(declare-datatypes ((ValueCell!3048 0))(
  ( (ValueCellFull!3048 (v!5596 V!10021)) (EmptyCell!3048) )
))
(declare-datatypes ((array!17163 0))(
  ( (array!17164 (arr!8114 (Array (_ BitVec 32) ValueCell!3048)) (size!8466 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17163)

(declare-fun mapDefault!11565 () ValueCell!3048)

(assert (=> b!333063 (= condMapEmpty!11565 (= (arr!8114 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3048)) mapDefault!11565)))))

(declare-fun res!183492 () Bool)

(assert (=> start!33560 (=> (not res!183492) (not e!204518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33560 (= res!183492 (validMask!0 mask!2385))))

(assert (=> start!33560 e!204518))

(assert (=> start!33560 true))

(declare-fun tp_is_empty!6783 () Bool)

(assert (=> start!33560 tp_is_empty!6783))

(assert (=> start!33560 tp!23990))

(declare-fun array_inv!6038 (array!17163) Bool)

(assert (=> start!33560 (and (array_inv!6038 _values!1525) e!204519)))

(declare-fun array_inv!6039 (array!17161) Bool)

(assert (=> start!33560 (array_inv!6039 _keys!1895)))

(declare-fun b!333064 () Bool)

(declare-fun res!183494 () Bool)

(assert (=> b!333064 (=> (not res!183494) (not e!204518))))

(declare-fun zeroValue!1467 () V!10021)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10021)

(declare-datatypes ((tuple2!5002 0))(
  ( (tuple2!5003 (_1!2512 (_ BitVec 64)) (_2!2512 V!10021)) )
))
(declare-datatypes ((List!4618 0))(
  ( (Nil!4615) (Cons!4614 (h!5470 tuple2!5002) (t!9702 List!4618)) )
))
(declare-datatypes ((ListLongMap!3915 0))(
  ( (ListLongMap!3916 (toList!1973 List!4618)) )
))
(declare-fun contains!2015 (ListLongMap!3915 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1501 (array!17161 array!17163 (_ BitVec 32) (_ BitVec 32) V!10021 V!10021 (_ BitVec 32) Int) ListLongMap!3915)

(assert (=> b!333064 (= res!183494 (not (contains!2015 (getCurrentListMap!1501 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333065 () Bool)

(declare-fun res!183493 () Bool)

(assert (=> b!333065 (=> (not res!183493) (not e!204518))))

(assert (=> b!333065 (= res!183493 (and (= (size!8466 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8465 _keys!1895) (size!8466 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333066 () Bool)

(declare-fun e!204515 () Bool)

(assert (=> b!333066 (= e!204515 tp_is_empty!6783)))

(declare-fun b!333067 () Bool)

(assert (=> b!333067 (= e!204517 tp_is_empty!6783)))

(declare-fun mapIsEmpty!11565 () Bool)

(assert (=> mapIsEmpty!11565 mapRes!11565))

(declare-fun b!333068 () Bool)

(declare-fun res!183496 () Bool)

(assert (=> b!333068 (=> (not res!183496) (not e!204518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17161 (_ BitVec 32)) Bool)

(assert (=> b!333068 (= res!183496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11565 () Bool)

(declare-fun tp!23991 () Bool)

(assert (=> mapNonEmpty!11565 (= mapRes!11565 (and tp!23991 e!204515))))

(declare-fun mapKey!11565 () (_ BitVec 32))

(declare-fun mapRest!11565 () (Array (_ BitVec 32) ValueCell!3048))

(declare-fun mapValue!11565 () ValueCell!3048)

(assert (=> mapNonEmpty!11565 (= (arr!8114 _values!1525) (store mapRest!11565 mapKey!11565 mapValue!11565))))

(assert (= (and start!33560 res!183492) b!333065))

(assert (= (and b!333065 res!183493) b!333068))

(assert (= (and b!333068 res!183496) b!333061))

(assert (= (and b!333061 res!183497) b!333060))

(assert (= (and b!333060 res!183495) b!333064))

(assert (= (and b!333064 res!183494) b!333062))

(assert (= (and b!333063 condMapEmpty!11565) mapIsEmpty!11565))

(assert (= (and b!333063 (not condMapEmpty!11565)) mapNonEmpty!11565))

(assert (= (and mapNonEmpty!11565 ((_ is ValueCellFull!3048) mapValue!11565)) b!333066))

(assert (= (and b!333063 ((_ is ValueCellFull!3048) mapDefault!11565)) b!333067))

(assert (= start!33560 b!333063))

(declare-fun m!337403 () Bool)

(assert (=> b!333062 m!337403))

(declare-fun m!337405 () Bool)

(assert (=> b!333062 m!337405))

(declare-fun m!337407 () Bool)

(assert (=> b!333060 m!337407))

(declare-fun m!337409 () Bool)

(assert (=> b!333064 m!337409))

(assert (=> b!333064 m!337409))

(declare-fun m!337411 () Bool)

(assert (=> b!333064 m!337411))

(declare-fun m!337413 () Bool)

(assert (=> b!333061 m!337413))

(declare-fun m!337415 () Bool)

(assert (=> b!333068 m!337415))

(declare-fun m!337417 () Bool)

(assert (=> mapNonEmpty!11565 m!337417))

(declare-fun m!337419 () Bool)

(assert (=> start!33560 m!337419))

(declare-fun m!337421 () Bool)

(assert (=> start!33560 m!337421))

(declare-fun m!337423 () Bool)

(assert (=> start!33560 m!337423))

(check-sat (not b!333061) (not b!333060) (not b!333062) tp_is_empty!6783 (not b!333064) (not start!33560) (not b_next!6831) b_and!14007 (not b!333068) (not mapNonEmpty!11565))
(check-sat b_and!14007 (not b_next!6831))
(get-model)

(declare-fun d!70563 () Bool)

(assert (=> d!70563 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33560 d!70563))

(declare-fun d!70565 () Bool)

(assert (=> d!70565 (= (array_inv!6038 _values!1525) (bvsge (size!8466 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33560 d!70565))

(declare-fun d!70567 () Bool)

(assert (=> d!70567 (= (array_inv!6039 _keys!1895) (bvsge (size!8465 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33560 d!70567))

(declare-fun b!333106 () Bool)

(declare-fun e!204545 () Bool)

(declare-fun call!26245 () Bool)

(assert (=> b!333106 (= e!204545 call!26245)))

(declare-fun b!333107 () Bool)

(declare-fun e!204546 () Bool)

(assert (=> b!333107 (= e!204546 e!204545)))

(declare-fun c!52125 () Bool)

(assert (=> b!333107 (= c!52125 (validKeyInArray!0 (select (arr!8113 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70569 () Bool)

(declare-fun res!183522 () Bool)

(declare-fun e!204544 () Bool)

(assert (=> d!70569 (=> res!183522 e!204544)))

(assert (=> d!70569 (= res!183522 (bvsge #b00000000000000000000000000000000 (size!8465 _keys!1895)))))

(assert (=> d!70569 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4614) e!204544)))

(declare-fun b!333108 () Bool)

(assert (=> b!333108 (= e!204544 e!204546)))

(declare-fun res!183524 () Bool)

(assert (=> b!333108 (=> (not res!183524) (not e!204546))))

(declare-fun e!204543 () Bool)

(assert (=> b!333108 (= res!183524 (not e!204543))))

(declare-fun res!183523 () Bool)

(assert (=> b!333108 (=> (not res!183523) (not e!204543))))

(assert (=> b!333108 (= res!183523 (validKeyInArray!0 (select (arr!8113 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26242 () Bool)

(assert (=> bm!26242 (= call!26245 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52125 (Cons!4613 (select (arr!8113 _keys!1895) #b00000000000000000000000000000000) Nil!4614) Nil!4614)))))

(declare-fun b!333109 () Bool)

(declare-fun contains!2016 (List!4617 (_ BitVec 64)) Bool)

(assert (=> b!333109 (= e!204543 (contains!2016 Nil!4614 (select (arr!8113 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!333110 () Bool)

(assert (=> b!333110 (= e!204545 call!26245)))

(assert (= (and d!70569 (not res!183522)) b!333108))

(assert (= (and b!333108 res!183523) b!333109))

(assert (= (and b!333108 res!183524) b!333107))

(assert (= (and b!333107 c!52125) b!333110))

(assert (= (and b!333107 (not c!52125)) b!333106))

(assert (= (or b!333110 b!333106) bm!26242))

(declare-fun m!337447 () Bool)

(assert (=> b!333107 m!337447))

(assert (=> b!333107 m!337447))

(declare-fun m!337449 () Bool)

(assert (=> b!333107 m!337449))

(assert (=> b!333108 m!337447))

(assert (=> b!333108 m!337447))

(assert (=> b!333108 m!337449))

(assert (=> bm!26242 m!337447))

(declare-fun m!337451 () Bool)

(assert (=> bm!26242 m!337451))

(assert (=> b!333109 m!337447))

(assert (=> b!333109 m!337447))

(declare-fun m!337453 () Bool)

(assert (=> b!333109 m!337453))

(assert (=> b!333061 d!70569))

(declare-fun d!70571 () Bool)

(declare-fun lt!159168 () SeekEntryResult!3134)

(assert (=> d!70571 (and (or ((_ is Undefined!3134) lt!159168) (not ((_ is Found!3134) lt!159168)) (and (bvsge (index!14716 lt!159168) #b00000000000000000000000000000000) (bvslt (index!14716 lt!159168) (size!8465 _keys!1895)))) (or ((_ is Undefined!3134) lt!159168) ((_ is Found!3134) lt!159168) (not ((_ is MissingZero!3134) lt!159168)) (and (bvsge (index!14715 lt!159168) #b00000000000000000000000000000000) (bvslt (index!14715 lt!159168) (size!8465 _keys!1895)))) (or ((_ is Undefined!3134) lt!159168) ((_ is Found!3134) lt!159168) ((_ is MissingZero!3134) lt!159168) (not ((_ is MissingVacant!3134) lt!159168)) (and (bvsge (index!14718 lt!159168) #b00000000000000000000000000000000) (bvslt (index!14718 lt!159168) (size!8465 _keys!1895)))) (or ((_ is Undefined!3134) lt!159168) (ite ((_ is Found!3134) lt!159168) (= (select (arr!8113 _keys!1895) (index!14716 lt!159168)) k0!1348) (ite ((_ is MissingZero!3134) lt!159168) (= (select (arr!8113 _keys!1895) (index!14715 lt!159168)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3134) lt!159168) (= (select (arr!8113 _keys!1895) (index!14718 lt!159168)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!204555 () SeekEntryResult!3134)

(assert (=> d!70571 (= lt!159168 e!204555)))

(declare-fun c!52134 () Bool)

(declare-fun lt!159167 () SeekEntryResult!3134)

(assert (=> d!70571 (= c!52134 (and ((_ is Intermediate!3134) lt!159167) (undefined!3946 lt!159167)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17161 (_ BitVec 32)) SeekEntryResult!3134)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70571 (= lt!159167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70571 (validMask!0 mask!2385)))

(assert (=> d!70571 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!159168)))

(declare-fun b!333123 () Bool)

(declare-fun e!204553 () SeekEntryResult!3134)

(assert (=> b!333123 (= e!204553 (Found!3134 (index!14717 lt!159167)))))

(declare-fun b!333124 () Bool)

(declare-fun e!204554 () SeekEntryResult!3134)

(assert (=> b!333124 (= e!204554 (MissingZero!3134 (index!14717 lt!159167)))))

(declare-fun b!333125 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17161 (_ BitVec 32)) SeekEntryResult!3134)

(assert (=> b!333125 (= e!204554 (seekKeyOrZeroReturnVacant!0 (x!33176 lt!159167) (index!14717 lt!159167) (index!14717 lt!159167) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333126 () Bool)

(declare-fun c!52132 () Bool)

(declare-fun lt!159169 () (_ BitVec 64))

(assert (=> b!333126 (= c!52132 (= lt!159169 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!333126 (= e!204553 e!204554)))

(declare-fun b!333127 () Bool)

(assert (=> b!333127 (= e!204555 Undefined!3134)))

(declare-fun b!333128 () Bool)

(assert (=> b!333128 (= e!204555 e!204553)))

(assert (=> b!333128 (= lt!159169 (select (arr!8113 _keys!1895) (index!14717 lt!159167)))))

(declare-fun c!52133 () Bool)

(assert (=> b!333128 (= c!52133 (= lt!159169 k0!1348))))

(assert (= (and d!70571 c!52134) b!333127))

(assert (= (and d!70571 (not c!52134)) b!333128))

(assert (= (and b!333128 c!52133) b!333123))

(assert (= (and b!333128 (not c!52133)) b!333126))

(assert (= (and b!333126 c!52132) b!333124))

(assert (= (and b!333126 (not c!52132)) b!333125))

(declare-fun m!337455 () Bool)

(assert (=> d!70571 m!337455))

(declare-fun m!337457 () Bool)

(assert (=> d!70571 m!337457))

(assert (=> d!70571 m!337419))

(declare-fun m!337459 () Bool)

(assert (=> d!70571 m!337459))

(declare-fun m!337461 () Bool)

(assert (=> d!70571 m!337461))

(assert (=> d!70571 m!337459))

(declare-fun m!337463 () Bool)

(assert (=> d!70571 m!337463))

(declare-fun m!337465 () Bool)

(assert (=> b!333125 m!337465))

(declare-fun m!337467 () Bool)

(assert (=> b!333128 m!337467))

(assert (=> b!333062 d!70571))

(declare-fun d!70573 () Bool)

(declare-fun res!183530 () Bool)

(declare-fun e!204562 () Bool)

(assert (=> d!70573 (=> res!183530 e!204562)))

(assert (=> d!70573 (= res!183530 (bvsge #b00000000000000000000000000000000 (size!8465 _keys!1895)))))

(assert (=> d!70573 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!204562)))

(declare-fun b!333137 () Bool)

(declare-fun e!204563 () Bool)

(assert (=> b!333137 (= e!204562 e!204563)))

(declare-fun c!52137 () Bool)

(assert (=> b!333137 (= c!52137 (validKeyInArray!0 (select (arr!8113 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!333138 () Bool)

(declare-fun e!204564 () Bool)

(assert (=> b!333138 (= e!204563 e!204564)))

(declare-fun lt!159178 () (_ BitVec 64))

(assert (=> b!333138 (= lt!159178 (select (arr!8113 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10365 0))(
  ( (Unit!10366) )
))
(declare-fun lt!159176 () Unit!10365)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17161 (_ BitVec 64) (_ BitVec 32)) Unit!10365)

(assert (=> b!333138 (= lt!159176 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!159178 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!333138 (arrayContainsKey!0 _keys!1895 lt!159178 #b00000000000000000000000000000000)))

(declare-fun lt!159177 () Unit!10365)

(assert (=> b!333138 (= lt!159177 lt!159176)))

(declare-fun res!183529 () Bool)

(assert (=> b!333138 (= res!183529 (= (seekEntryOrOpen!0 (select (arr!8113 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3134 #b00000000000000000000000000000000)))))

(assert (=> b!333138 (=> (not res!183529) (not e!204564))))

(declare-fun bm!26245 () Bool)

(declare-fun call!26248 () Bool)

(assert (=> bm!26245 (= call!26248 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!333139 () Bool)

(assert (=> b!333139 (= e!204563 call!26248)))

(declare-fun b!333140 () Bool)

(assert (=> b!333140 (= e!204564 call!26248)))

(assert (= (and d!70573 (not res!183530)) b!333137))

(assert (= (and b!333137 c!52137) b!333138))

(assert (= (and b!333137 (not c!52137)) b!333139))

(assert (= (and b!333138 res!183529) b!333140))

(assert (= (or b!333140 b!333139) bm!26245))

(assert (=> b!333137 m!337447))

(assert (=> b!333137 m!337447))

(assert (=> b!333137 m!337449))

(assert (=> b!333138 m!337447))

(declare-fun m!337469 () Bool)

(assert (=> b!333138 m!337469))

(declare-fun m!337471 () Bool)

(assert (=> b!333138 m!337471))

(assert (=> b!333138 m!337447))

(declare-fun m!337473 () Bool)

(assert (=> b!333138 m!337473))

(declare-fun m!337475 () Bool)

(assert (=> bm!26245 m!337475))

(assert (=> b!333068 d!70573))

(declare-fun d!70575 () Bool)

(declare-fun e!204570 () Bool)

(assert (=> d!70575 e!204570))

(declare-fun res!183533 () Bool)

(assert (=> d!70575 (=> res!183533 e!204570)))

(declare-fun lt!159187 () Bool)

(assert (=> d!70575 (= res!183533 (not lt!159187))))

(declare-fun lt!159189 () Bool)

(assert (=> d!70575 (= lt!159187 lt!159189)))

(declare-fun lt!159190 () Unit!10365)

(declare-fun e!204569 () Unit!10365)

(assert (=> d!70575 (= lt!159190 e!204569)))

(declare-fun c!52140 () Bool)

(assert (=> d!70575 (= c!52140 lt!159189)))

(declare-fun containsKey!314 (List!4618 (_ BitVec 64)) Bool)

(assert (=> d!70575 (= lt!159189 (containsKey!314 (toList!1973 (getCurrentListMap!1501 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70575 (= (contains!2015 (getCurrentListMap!1501 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!159187)))

(declare-fun b!333147 () Bool)

(declare-fun lt!159188 () Unit!10365)

(assert (=> b!333147 (= e!204569 lt!159188)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!262 (List!4618 (_ BitVec 64)) Unit!10365)

(assert (=> b!333147 (= lt!159188 (lemmaContainsKeyImpliesGetValueByKeyDefined!262 (toList!1973 (getCurrentListMap!1501 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!328 0))(
  ( (Some!327 (v!5598 V!10021)) (None!326) )
))
(declare-fun isDefined!263 (Option!328) Bool)

(declare-fun getValueByKey!322 (List!4618 (_ BitVec 64)) Option!328)

(assert (=> b!333147 (isDefined!263 (getValueByKey!322 (toList!1973 (getCurrentListMap!1501 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!333148 () Bool)

(declare-fun Unit!10367 () Unit!10365)

(assert (=> b!333148 (= e!204569 Unit!10367)))

(declare-fun b!333149 () Bool)

(assert (=> b!333149 (= e!204570 (isDefined!263 (getValueByKey!322 (toList!1973 (getCurrentListMap!1501 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70575 c!52140) b!333147))

(assert (= (and d!70575 (not c!52140)) b!333148))

(assert (= (and d!70575 (not res!183533)) b!333149))

(declare-fun m!337477 () Bool)

(assert (=> d!70575 m!337477))

(declare-fun m!337479 () Bool)

(assert (=> b!333147 m!337479))

(declare-fun m!337481 () Bool)

(assert (=> b!333147 m!337481))

(assert (=> b!333147 m!337481))

(declare-fun m!337483 () Bool)

(assert (=> b!333147 m!337483))

(assert (=> b!333149 m!337481))

(assert (=> b!333149 m!337481))

(assert (=> b!333149 m!337483))

(assert (=> b!333064 d!70575))

(declare-fun b!333192 () Bool)

(declare-fun e!204609 () ListLongMap!3915)

(declare-fun call!26265 () ListLongMap!3915)

(declare-fun +!713 (ListLongMap!3915 tuple2!5002) ListLongMap!3915)

(assert (=> b!333192 (= e!204609 (+!713 call!26265 (tuple2!5003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26260 () Bool)

(declare-fun call!26269 () ListLongMap!3915)

(declare-fun getCurrentListMapNoExtraKeys!586 (array!17161 array!17163 (_ BitVec 32) (_ BitVec 32) V!10021 V!10021 (_ BitVec 32) Int) ListLongMap!3915)

(assert (=> bm!26260 (= call!26269 (getCurrentListMapNoExtraKeys!586 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!333193 () Bool)

(declare-fun e!204602 () Bool)

(declare-fun e!204604 () Bool)

(assert (=> b!333193 (= e!204602 e!204604)))

(declare-fun res!183552 () Bool)

(assert (=> b!333193 (=> (not res!183552) (not e!204604))))

(declare-fun lt!159252 () ListLongMap!3915)

(assert (=> b!333193 (= res!183552 (contains!2015 lt!159252 (select (arr!8113 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!333193 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8465 _keys!1895)))))

(declare-fun b!333194 () Bool)

(declare-fun e!204597 () Bool)

(declare-fun call!26267 () Bool)

(assert (=> b!333194 (= e!204597 (not call!26267))))

(declare-fun b!333195 () Bool)

(declare-fun e!204607 () ListLongMap!3915)

(declare-fun call!26263 () ListLongMap!3915)

(assert (=> b!333195 (= e!204607 call!26263)))

(declare-fun b!333196 () Bool)

(declare-fun e!204598 () Bool)

(assert (=> b!333196 (= e!204598 e!204597)))

(declare-fun c!52153 () Bool)

(assert (=> b!333196 (= c!52153 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!333197 () Bool)

(declare-fun e!204605 () Bool)

(assert (=> b!333197 (= e!204605 (validKeyInArray!0 (select (arr!8113 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!333198 () Bool)

(declare-fun e!204606 () ListLongMap!3915)

(assert (=> b!333198 (= e!204609 e!204606)))

(declare-fun c!52157 () Bool)

(assert (=> b!333198 (= c!52157 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!333199 () Bool)

(declare-fun e!204601 () Bool)

(assert (=> b!333199 (= e!204601 (validKeyInArray!0 (select (arr!8113 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!333200 () Bool)

(declare-fun e!204600 () Unit!10365)

(declare-fun Unit!10368 () Unit!10365)

(assert (=> b!333200 (= e!204600 Unit!10368)))

(declare-fun d!70577 () Bool)

(assert (=> d!70577 e!204598))

(declare-fun res!183560 () Bool)

(assert (=> d!70577 (=> (not res!183560) (not e!204598))))

(assert (=> d!70577 (= res!183560 (or (bvsge #b00000000000000000000000000000000 (size!8465 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8465 _keys!1895)))))))

(declare-fun lt!159254 () ListLongMap!3915)

(assert (=> d!70577 (= lt!159252 lt!159254)))

(declare-fun lt!159241 () Unit!10365)

(assert (=> d!70577 (= lt!159241 e!204600)))

(declare-fun c!52154 () Bool)

(assert (=> d!70577 (= c!52154 e!204605)))

(declare-fun res!183555 () Bool)

(assert (=> d!70577 (=> (not res!183555) (not e!204605))))

(assert (=> d!70577 (= res!183555 (bvslt #b00000000000000000000000000000000 (size!8465 _keys!1895)))))

(assert (=> d!70577 (= lt!159254 e!204609)))

(declare-fun c!52155 () Bool)

(assert (=> d!70577 (= c!52155 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70577 (validMask!0 mask!2385)))

(assert (=> d!70577 (= (getCurrentListMap!1501 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!159252)))

(declare-fun b!333201 () Bool)

(declare-fun e!204608 () Bool)

(assert (=> b!333201 (= e!204597 e!204608)))

(declare-fun res!183554 () Bool)

(assert (=> b!333201 (= res!183554 call!26267)))

(assert (=> b!333201 (=> (not res!183554) (not e!204608))))

(declare-fun bm!26261 () Bool)

(declare-fun call!26268 () ListLongMap!3915)

(assert (=> bm!26261 (= call!26268 call!26269)))

(declare-fun b!333202 () Bool)

(declare-fun apply!264 (ListLongMap!3915 (_ BitVec 64)) V!10021)

(assert (=> b!333202 (= e!204608 (= (apply!264 lt!159252 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!26262 () Bool)

(declare-fun call!26266 () ListLongMap!3915)

(assert (=> bm!26262 (= call!26266 call!26265)))

(declare-fun b!333203 () Bool)

(declare-fun res!183558 () Bool)

(assert (=> b!333203 (=> (not res!183558) (not e!204598))))

(assert (=> b!333203 (= res!183558 e!204602)))

(declare-fun res!183556 () Bool)

(assert (=> b!333203 (=> res!183556 e!204602)))

(assert (=> b!333203 (= res!183556 (not e!204601))))

(declare-fun res!183557 () Bool)

(assert (=> b!333203 (=> (not res!183557) (not e!204601))))

(assert (=> b!333203 (= res!183557 (bvslt #b00000000000000000000000000000000 (size!8465 _keys!1895)))))

(declare-fun b!333204 () Bool)

(declare-fun get!4470 (ValueCell!3048 V!10021) V!10021)

(declare-fun dynLambda!607 (Int (_ BitVec 64)) V!10021)

(assert (=> b!333204 (= e!204604 (= (apply!264 lt!159252 (select (arr!8113 _keys!1895) #b00000000000000000000000000000000)) (get!4470 (select (arr!8114 _values!1525) #b00000000000000000000000000000000) (dynLambda!607 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!333204 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8466 _values!1525)))))

(assert (=> b!333204 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8465 _keys!1895)))))

(declare-fun bm!26263 () Bool)

(assert (=> bm!26263 (= call!26265 (+!713 (ite c!52155 call!26269 (ite c!52157 call!26268 call!26263)) (ite (or c!52155 c!52157) (tuple2!5003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!333205 () Bool)

(declare-fun c!52156 () Bool)

(assert (=> b!333205 (= c!52156 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!333205 (= e!204606 e!204607)))

(declare-fun b!333206 () Bool)

(declare-fun e!204599 () Bool)

(declare-fun call!26264 () Bool)

(assert (=> b!333206 (= e!204599 (not call!26264))))

(declare-fun b!333207 () Bool)

(declare-fun e!204603 () Bool)

(assert (=> b!333207 (= e!204603 (= (apply!264 lt!159252 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!26264 () Bool)

(assert (=> bm!26264 (= call!26264 (contains!2015 lt!159252 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!333208 () Bool)

(assert (=> b!333208 (= e!204599 e!204603)))

(declare-fun res!183559 () Bool)

(assert (=> b!333208 (= res!183559 call!26264)))

(assert (=> b!333208 (=> (not res!183559) (not e!204603))))

(declare-fun b!333209 () Bool)

(assert (=> b!333209 (= e!204606 call!26266)))

(declare-fun bm!26265 () Bool)

(assert (=> bm!26265 (= call!26263 call!26268)))

(declare-fun bm!26266 () Bool)

(assert (=> bm!26266 (= call!26267 (contains!2015 lt!159252 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!333210 () Bool)

(declare-fun lt!159245 () Unit!10365)

(assert (=> b!333210 (= e!204600 lt!159245)))

(declare-fun lt!159247 () ListLongMap!3915)

(assert (=> b!333210 (= lt!159247 (getCurrentListMapNoExtraKeys!586 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159248 () (_ BitVec 64))

(assert (=> b!333210 (= lt!159248 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159243 () (_ BitVec 64))

(assert (=> b!333210 (= lt!159243 (select (arr!8113 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159242 () Unit!10365)

(declare-fun addStillContains!240 (ListLongMap!3915 (_ BitVec 64) V!10021 (_ BitVec 64)) Unit!10365)

(assert (=> b!333210 (= lt!159242 (addStillContains!240 lt!159247 lt!159248 zeroValue!1467 lt!159243))))

(assert (=> b!333210 (contains!2015 (+!713 lt!159247 (tuple2!5003 lt!159248 zeroValue!1467)) lt!159243)))

(declare-fun lt!159250 () Unit!10365)

(assert (=> b!333210 (= lt!159250 lt!159242)))

(declare-fun lt!159238 () ListLongMap!3915)

(assert (=> b!333210 (= lt!159238 (getCurrentListMapNoExtraKeys!586 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159237 () (_ BitVec 64))

(assert (=> b!333210 (= lt!159237 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159246 () (_ BitVec 64))

(assert (=> b!333210 (= lt!159246 (select (arr!8113 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159256 () Unit!10365)

(declare-fun addApplyDifferent!240 (ListLongMap!3915 (_ BitVec 64) V!10021 (_ BitVec 64)) Unit!10365)

(assert (=> b!333210 (= lt!159256 (addApplyDifferent!240 lt!159238 lt!159237 minValue!1467 lt!159246))))

(assert (=> b!333210 (= (apply!264 (+!713 lt!159238 (tuple2!5003 lt!159237 minValue!1467)) lt!159246) (apply!264 lt!159238 lt!159246))))

(declare-fun lt!159240 () Unit!10365)

(assert (=> b!333210 (= lt!159240 lt!159256)))

(declare-fun lt!159251 () ListLongMap!3915)

(assert (=> b!333210 (= lt!159251 (getCurrentListMapNoExtraKeys!586 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159255 () (_ BitVec 64))

(assert (=> b!333210 (= lt!159255 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159235 () (_ BitVec 64))

(assert (=> b!333210 (= lt!159235 (select (arr!8113 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159244 () Unit!10365)

(assert (=> b!333210 (= lt!159244 (addApplyDifferent!240 lt!159251 lt!159255 zeroValue!1467 lt!159235))))

(assert (=> b!333210 (= (apply!264 (+!713 lt!159251 (tuple2!5003 lt!159255 zeroValue!1467)) lt!159235) (apply!264 lt!159251 lt!159235))))

(declare-fun lt!159239 () Unit!10365)

(assert (=> b!333210 (= lt!159239 lt!159244)))

(declare-fun lt!159249 () ListLongMap!3915)

(assert (=> b!333210 (= lt!159249 (getCurrentListMapNoExtraKeys!586 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159253 () (_ BitVec 64))

(assert (=> b!333210 (= lt!159253 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159236 () (_ BitVec 64))

(assert (=> b!333210 (= lt!159236 (select (arr!8113 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!333210 (= lt!159245 (addApplyDifferent!240 lt!159249 lt!159253 minValue!1467 lt!159236))))

(assert (=> b!333210 (= (apply!264 (+!713 lt!159249 (tuple2!5003 lt!159253 minValue!1467)) lt!159236) (apply!264 lt!159249 lt!159236))))

(declare-fun b!333211 () Bool)

(declare-fun res!183553 () Bool)

(assert (=> b!333211 (=> (not res!183553) (not e!204598))))

(assert (=> b!333211 (= res!183553 e!204599)))

(declare-fun c!52158 () Bool)

(assert (=> b!333211 (= c!52158 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!333212 () Bool)

(assert (=> b!333212 (= e!204607 call!26266)))

(assert (= (and d!70577 c!52155) b!333192))

(assert (= (and d!70577 (not c!52155)) b!333198))

(assert (= (and b!333198 c!52157) b!333209))

(assert (= (and b!333198 (not c!52157)) b!333205))

(assert (= (and b!333205 c!52156) b!333212))

(assert (= (and b!333205 (not c!52156)) b!333195))

(assert (= (or b!333212 b!333195) bm!26265))

(assert (= (or b!333209 bm!26265) bm!26261))

(assert (= (or b!333209 b!333212) bm!26262))

(assert (= (or b!333192 bm!26261) bm!26260))

(assert (= (or b!333192 bm!26262) bm!26263))

(assert (= (and d!70577 res!183555) b!333197))

(assert (= (and d!70577 c!52154) b!333210))

(assert (= (and d!70577 (not c!52154)) b!333200))

(assert (= (and d!70577 res!183560) b!333203))

(assert (= (and b!333203 res!183557) b!333199))

(assert (= (and b!333203 (not res!183556)) b!333193))

(assert (= (and b!333193 res!183552) b!333204))

(assert (= (and b!333203 res!183558) b!333211))

(assert (= (and b!333211 c!52158) b!333208))

(assert (= (and b!333211 (not c!52158)) b!333206))

(assert (= (and b!333208 res!183559) b!333207))

(assert (= (or b!333208 b!333206) bm!26264))

(assert (= (and b!333211 res!183553) b!333196))

(assert (= (and b!333196 c!52153) b!333201))

(assert (= (and b!333196 (not c!52153)) b!333194))

(assert (= (and b!333201 res!183554) b!333202))

(assert (= (or b!333201 b!333194) bm!26266))

(declare-fun b_lambda!8395 () Bool)

(assert (=> (not b_lambda!8395) (not b!333204)))

(declare-fun t!9705 () Bool)

(declare-fun tb!3043 () Bool)

(assert (=> (and start!33560 (= defaultEntry!1528 defaultEntry!1528) t!9705) tb!3043))

(declare-fun result!5459 () Bool)

(assert (=> tb!3043 (= result!5459 tp_is_empty!6783)))

(assert (=> b!333204 t!9705))

(declare-fun b_and!14011 () Bool)

(assert (= b_and!14007 (and (=> t!9705 result!5459) b_and!14011)))

(declare-fun m!337485 () Bool)

(assert (=> bm!26266 m!337485))

(declare-fun m!337487 () Bool)

(assert (=> bm!26260 m!337487))

(assert (=> b!333210 m!337447))

(declare-fun m!337489 () Bool)

(assert (=> b!333210 m!337489))

(declare-fun m!337491 () Bool)

(assert (=> b!333210 m!337491))

(declare-fun m!337493 () Bool)

(assert (=> b!333210 m!337493))

(declare-fun m!337495 () Bool)

(assert (=> b!333210 m!337495))

(assert (=> b!333210 m!337493))

(assert (=> b!333210 m!337489))

(declare-fun m!337497 () Bool)

(assert (=> b!333210 m!337497))

(declare-fun m!337499 () Bool)

(assert (=> b!333210 m!337499))

(declare-fun m!337501 () Bool)

(assert (=> b!333210 m!337501))

(declare-fun m!337503 () Bool)

(assert (=> b!333210 m!337503))

(declare-fun m!337505 () Bool)

(assert (=> b!333210 m!337505))

(assert (=> b!333210 m!337501))

(declare-fun m!337507 () Bool)

(assert (=> b!333210 m!337507))

(declare-fun m!337509 () Bool)

(assert (=> b!333210 m!337509))

(assert (=> b!333210 m!337487))

(assert (=> b!333210 m!337503))

(declare-fun m!337511 () Bool)

(assert (=> b!333210 m!337511))

(declare-fun m!337513 () Bool)

(assert (=> b!333210 m!337513))

(declare-fun m!337515 () Bool)

(assert (=> b!333210 m!337515))

(declare-fun m!337517 () Bool)

(assert (=> b!333210 m!337517))

(declare-fun m!337519 () Bool)

(assert (=> b!333192 m!337519))

(declare-fun m!337521 () Bool)

(assert (=> b!333202 m!337521))

(assert (=> b!333204 m!337447))

(declare-fun m!337523 () Bool)

(assert (=> b!333204 m!337523))

(assert (=> b!333204 m!337523))

(declare-fun m!337525 () Bool)

(assert (=> b!333204 m!337525))

(declare-fun m!337527 () Bool)

(assert (=> b!333204 m!337527))

(assert (=> b!333204 m!337525))

(assert (=> b!333204 m!337447))

(declare-fun m!337529 () Bool)

(assert (=> b!333204 m!337529))

(declare-fun m!337531 () Bool)

(assert (=> b!333207 m!337531))

(assert (=> d!70577 m!337419))

(assert (=> b!333193 m!337447))

(assert (=> b!333193 m!337447))

(declare-fun m!337533 () Bool)

(assert (=> b!333193 m!337533))

(declare-fun m!337535 () Bool)

(assert (=> bm!26264 m!337535))

(assert (=> b!333199 m!337447))

(assert (=> b!333199 m!337447))

(assert (=> b!333199 m!337449))

(declare-fun m!337537 () Bool)

(assert (=> bm!26263 m!337537))

(assert (=> b!333197 m!337447))

(assert (=> b!333197 m!337447))

(assert (=> b!333197 m!337449))

(assert (=> b!333064 d!70577))

(declare-fun d!70579 () Bool)

(assert (=> d!70579 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!333060 d!70579))

(declare-fun mapIsEmpty!11571 () Bool)

(declare-fun mapRes!11571 () Bool)

(assert (=> mapIsEmpty!11571 mapRes!11571))

(declare-fun b!333221 () Bool)

(declare-fun e!204615 () Bool)

(assert (=> b!333221 (= e!204615 tp_is_empty!6783)))

(declare-fun condMapEmpty!11571 () Bool)

(declare-fun mapDefault!11571 () ValueCell!3048)

(assert (=> mapNonEmpty!11565 (= condMapEmpty!11571 (= mapRest!11565 ((as const (Array (_ BitVec 32) ValueCell!3048)) mapDefault!11571)))))

(declare-fun e!204614 () Bool)

(assert (=> mapNonEmpty!11565 (= tp!23991 (and e!204614 mapRes!11571))))

(declare-fun b!333222 () Bool)

(assert (=> b!333222 (= e!204614 tp_is_empty!6783)))

(declare-fun mapNonEmpty!11571 () Bool)

(declare-fun tp!24000 () Bool)

(assert (=> mapNonEmpty!11571 (= mapRes!11571 (and tp!24000 e!204615))))

(declare-fun mapKey!11571 () (_ BitVec 32))

(declare-fun mapValue!11571 () ValueCell!3048)

(declare-fun mapRest!11571 () (Array (_ BitVec 32) ValueCell!3048))

(assert (=> mapNonEmpty!11571 (= mapRest!11565 (store mapRest!11571 mapKey!11571 mapValue!11571))))

(assert (= (and mapNonEmpty!11565 condMapEmpty!11571) mapIsEmpty!11571))

(assert (= (and mapNonEmpty!11565 (not condMapEmpty!11571)) mapNonEmpty!11571))

(assert (= (and mapNonEmpty!11571 ((_ is ValueCellFull!3048) mapValue!11571)) b!333221))

(assert (= (and mapNonEmpty!11565 ((_ is ValueCellFull!3048) mapDefault!11571)) b!333222))

(declare-fun m!337539 () Bool)

(assert (=> mapNonEmpty!11571 m!337539))

(declare-fun b_lambda!8397 () Bool)

(assert (= b_lambda!8395 (or (and start!33560 b_free!6831) b_lambda!8397)))

(check-sat (not b_lambda!8397) (not bm!26263) (not b!333207) (not bm!26264) (not b!333192) (not d!70577) (not b!333125) (not b!333149) (not b!333204) (not b!333137) (not b!333210) (not b!333197) (not mapNonEmpty!11571) (not b!333108) (not bm!26245) (not b!333202) b_and!14011 (not bm!26266) tp_is_empty!6783 (not d!70575) (not b!333193) (not b!333199) (not b!333147) (not b!333138) (not d!70571) (not bm!26242) (not b!333109) (not b!333107) (not bm!26260) (not b_next!6831))
(check-sat b_and!14011 (not b_next!6831))
