; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131556 () Bool)

(assert start!131556)

(declare-fun b!1541302 () Bool)

(declare-fun res!1057940 () Bool)

(declare-fun e!857268 () Bool)

(assert (=> b!1541302 (=> (not res!1057940) (not e!857268))))

(declare-datatypes ((array!102446 0))(
  ( (array!102447 (arr!49430 (Array (_ BitVec 32) (_ BitVec 64))) (size!49982 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102446)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102446 (_ BitVec 32)) Bool)

(assert (=> b!1541302 (= res!1057940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1541303 () Bool)

(assert (=> b!1541303 (= e!857268 (bvsgt #b00000000000000000000000000000000 (size!49982 _keys!618)))))

(declare-fun b!1541304 () Bool)

(declare-fun e!857269 () Bool)

(declare-fun tp_is_empty!37633 () Bool)

(assert (=> b!1541304 (= e!857269 tp_is_empty!37633)))

(declare-fun b!1541306 () Bool)

(declare-fun res!1057941 () Bool)

(assert (=> b!1541306 (=> (not res!1057941) (not e!857268))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((V!58621 0))(
  ( (V!58622 (val!18894 Int)) )
))
(declare-datatypes ((ValueCell!17906 0))(
  ( (ValueCellFull!17906 (v!21690 V!58621)) (EmptyCell!17906) )
))
(declare-datatypes ((array!102448 0))(
  ( (array!102449 (arr!49431 (Array (_ BitVec 32) ValueCell!17906)) (size!49983 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102448)

(assert (=> b!1541306 (= res!1057941 (and (= (size!49983 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!49982 _keys!618) (size!49983 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58141 () Bool)

(declare-fun mapRes!58141 () Bool)

(declare-fun tp!110669 () Bool)

(assert (=> mapNonEmpty!58141 (= mapRes!58141 (and tp!110669 e!857269))))

(declare-fun mapRest!58141 () (Array (_ BitVec 32) ValueCell!17906))

(declare-fun mapValue!58141 () ValueCell!17906)

(declare-fun mapKey!58141 () (_ BitVec 32))

(assert (=> mapNonEmpty!58141 (= (arr!49431 _values!470) (store mapRest!58141 mapKey!58141 mapValue!58141))))

(declare-fun mapIsEmpty!58141 () Bool)

(assert (=> mapIsEmpty!58141 mapRes!58141))

(declare-fun b!1541307 () Bool)

(declare-fun e!857270 () Bool)

(assert (=> b!1541307 (= e!857270 tp_is_empty!37633)))

(declare-fun res!1057942 () Bool)

(assert (=> start!131556 (=> (not res!1057942) (not e!857268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131556 (= res!1057942 (validMask!0 mask!926))))

(assert (=> start!131556 e!857268))

(assert (=> start!131556 true))

(declare-fun e!857271 () Bool)

(declare-fun array_inv!38659 (array!102448) Bool)

(assert (=> start!131556 (and (array_inv!38659 _values!470) e!857271)))

(declare-fun array_inv!38660 (array!102446) Bool)

(assert (=> start!131556 (array_inv!38660 _keys!618)))

(declare-fun b!1541305 () Bool)

(assert (=> b!1541305 (= e!857271 (and e!857270 mapRes!58141))))

(declare-fun condMapEmpty!58141 () Bool)

(declare-fun mapDefault!58141 () ValueCell!17906)

(assert (=> b!1541305 (= condMapEmpty!58141 (= (arr!49431 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17906)) mapDefault!58141)))))

(assert (= (and start!131556 res!1057942) b!1541306))

(assert (= (and b!1541306 res!1057941) b!1541302))

(assert (= (and b!1541302 res!1057940) b!1541303))

(assert (= (and b!1541305 condMapEmpty!58141) mapIsEmpty!58141))

(assert (= (and b!1541305 (not condMapEmpty!58141)) mapNonEmpty!58141))

(get-info :version)

(assert (= (and mapNonEmpty!58141 ((_ is ValueCellFull!17906) mapValue!58141)) b!1541304))

(assert (= (and b!1541305 ((_ is ValueCellFull!17906) mapDefault!58141)) b!1541307))

(assert (= start!131556 b!1541305))

(declare-fun m!1422655 () Bool)

(assert (=> b!1541302 m!1422655))

(declare-fun m!1422657 () Bool)

(assert (=> mapNonEmpty!58141 m!1422657))

(declare-fun m!1422659 () Bool)

(assert (=> start!131556 m!1422659))

(declare-fun m!1422661 () Bool)

(assert (=> start!131556 m!1422661))

(declare-fun m!1422663 () Bool)

(assert (=> start!131556 m!1422663))

(check-sat (not start!131556) (not b!1541302) (not mapNonEmpty!58141) tp_is_empty!37633)
(check-sat)
(get-model)

(declare-fun d!160441 () Bool)

(assert (=> d!160441 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!131556 d!160441))

(declare-fun d!160443 () Bool)

(assert (=> d!160443 (= (array_inv!38659 _values!470) (bvsge (size!49983 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!131556 d!160443))

(declare-fun d!160445 () Bool)

(assert (=> d!160445 (= (array_inv!38660 _keys!618) (bvsge (size!49982 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!131556 d!160445))

(declare-fun b!1541352 () Bool)

(declare-fun e!857311 () Bool)

(declare-fun call!68650 () Bool)

(assert (=> b!1541352 (= e!857311 call!68650)))

(declare-fun b!1541353 () Bool)

(declare-fun e!857310 () Bool)

(assert (=> b!1541353 (= e!857310 e!857311)))

(declare-fun c!141210 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541353 (= c!141210 (validKeyInArray!0 (select (arr!49430 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1541354 () Bool)

(declare-fun e!857309 () Bool)

(assert (=> b!1541354 (= e!857309 call!68650)))

(declare-fun b!1541355 () Bool)

(assert (=> b!1541355 (= e!857311 e!857309)))

(declare-fun lt!665417 () (_ BitVec 64))

(assert (=> b!1541355 (= lt!665417 (select (arr!49430 _keys!618) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51317 0))(
  ( (Unit!51318) )
))
(declare-fun lt!665418 () Unit!51317)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102446 (_ BitVec 64) (_ BitVec 32)) Unit!51317)

(assert (=> b!1541355 (= lt!665418 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!665417 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1541355 (arrayContainsKey!0 _keys!618 lt!665417 #b00000000000000000000000000000000)))

(declare-fun lt!665416 () Unit!51317)

(assert (=> b!1541355 (= lt!665416 lt!665418)))

(declare-fun res!1057965 () Bool)

(declare-datatypes ((SeekEntryResult!13508 0))(
  ( (MissingZero!13508 (index!56430 (_ BitVec 32))) (Found!13508 (index!56431 (_ BitVec 32))) (Intermediate!13508 (undefined!14320 Bool) (index!56432 (_ BitVec 32)) (x!138355 (_ BitVec 32))) (Undefined!13508) (MissingVacant!13508 (index!56433 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102446 (_ BitVec 32)) SeekEntryResult!13508)

(assert (=> b!1541355 (= res!1057965 (= (seekEntryOrOpen!0 (select (arr!49430 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13508 #b00000000000000000000000000000000)))))

(assert (=> b!1541355 (=> (not res!1057965) (not e!857309))))

(declare-fun bm!68647 () Bool)

(assert (=> bm!68647 (= call!68650 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun d!160447 () Bool)

(declare-fun res!1057966 () Bool)

(assert (=> d!160447 (=> res!1057966 e!857310)))

(assert (=> d!160447 (= res!1057966 (bvsge #b00000000000000000000000000000000 (size!49982 _keys!618)))))

(assert (=> d!160447 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!857310)))

(assert (= (and d!160447 (not res!1057966)) b!1541353))

(assert (= (and b!1541353 c!141210) b!1541355))

(assert (= (and b!1541353 (not c!141210)) b!1541352))

(assert (= (and b!1541355 res!1057965) b!1541354))

(assert (= (or b!1541354 b!1541352) bm!68647))

(declare-fun m!1422685 () Bool)

(assert (=> b!1541353 m!1422685))

(assert (=> b!1541353 m!1422685))

(declare-fun m!1422687 () Bool)

(assert (=> b!1541353 m!1422687))

(assert (=> b!1541355 m!1422685))

(declare-fun m!1422689 () Bool)

(assert (=> b!1541355 m!1422689))

(declare-fun m!1422691 () Bool)

(assert (=> b!1541355 m!1422691))

(assert (=> b!1541355 m!1422685))

(declare-fun m!1422693 () Bool)

(assert (=> b!1541355 m!1422693))

(declare-fun m!1422695 () Bool)

(assert (=> bm!68647 m!1422695))

(assert (=> b!1541302 d!160447))

(declare-fun b!1541362 () Bool)

(declare-fun e!857316 () Bool)

(assert (=> b!1541362 (= e!857316 tp_is_empty!37633)))

(declare-fun mapIsEmpty!58150 () Bool)

(declare-fun mapRes!58150 () Bool)

(assert (=> mapIsEmpty!58150 mapRes!58150))

(declare-fun mapNonEmpty!58150 () Bool)

(declare-fun tp!110678 () Bool)

(assert (=> mapNonEmpty!58150 (= mapRes!58150 (and tp!110678 e!857316))))

(declare-fun mapValue!58150 () ValueCell!17906)

(declare-fun mapRest!58150 () (Array (_ BitVec 32) ValueCell!17906))

(declare-fun mapKey!58150 () (_ BitVec 32))

(assert (=> mapNonEmpty!58150 (= mapRest!58141 (store mapRest!58150 mapKey!58150 mapValue!58150))))

(declare-fun condMapEmpty!58150 () Bool)

(declare-fun mapDefault!58150 () ValueCell!17906)

(assert (=> mapNonEmpty!58141 (= condMapEmpty!58150 (= mapRest!58141 ((as const (Array (_ BitVec 32) ValueCell!17906)) mapDefault!58150)))))

(declare-fun e!857317 () Bool)

(assert (=> mapNonEmpty!58141 (= tp!110669 (and e!857317 mapRes!58150))))

(declare-fun b!1541363 () Bool)

(assert (=> b!1541363 (= e!857317 tp_is_empty!37633)))

(assert (= (and mapNonEmpty!58141 condMapEmpty!58150) mapIsEmpty!58150))

(assert (= (and mapNonEmpty!58141 (not condMapEmpty!58150)) mapNonEmpty!58150))

(assert (= (and mapNonEmpty!58150 ((_ is ValueCellFull!17906) mapValue!58150)) b!1541362))

(assert (= (and mapNonEmpty!58141 ((_ is ValueCellFull!17906) mapDefault!58150)) b!1541363))

(declare-fun m!1422697 () Bool)

(assert (=> mapNonEmpty!58150 m!1422697))

(check-sat (not mapNonEmpty!58150) (not bm!68647) (not b!1541355) (not b!1541353) tp_is_empty!37633)
(check-sat)
